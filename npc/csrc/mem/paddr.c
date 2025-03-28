#include <cpu/cpu.h>
#include <device/io.h>
#include <mem/host.h>
#include <mem/paddr.h>
#include <sys/time.h>
#include <utils.h>

static uint8_t pmem[CONFIG_MSIZE] = {};
static uint32_t rtc_port_base[2];

uint8_t *guest_to_host(paddr_t paddr) { return pmem + paddr - CONFIG_MBASE; }
paddr_t host_to_guest(uint8_t *haddr) { return haddr - pmem + CONFIG_MBASE; }

void trace_mread(paddr_t addr) {
  printf("mtrace: read at " FMT_PADDR "\n", addr);
}

void trace_mwrite(paddr_t addr, word_t data, uint8_t mask) {
  printf("mtrace: write at " FMT_PADDR ", data=" FMT_WORD ", mask=%x\n", addr,
         data, mask);
}

// for DPI-C
int pmem_read(int raddr) {
  word_t ret = 0;
  bool mmio = false;
  // raddr = raddr & ~0x3u;
  if (raddr == RTC_ADDR) {
    mmio = true;
    ret = (uint32_t)time_tmp;
#ifdef CONFIG_DTRACE
    dtrace_read("RTC", raddr, ret);
#endif
  } else if (raddr == RTC_ADDR + 4) {
    mmio = true;
    time_tmp = get_time();
    ret = time_tmp >> 32;
#ifdef CONFIG_DTRACE
    dtrace_read("RTC", raddr, ret);
#endif
  }
  if (mmio) {
#ifdef CONFIG_DIFFTEST
    difftest_skip_ref();
#endif
    return ret;
  }
  word_t data = paddr_read(raddr, 4);
  // Log("pmem_read: raddr=0x%x, data=0x%x\n", raddr, data);
#ifdef CONFIG_TRACE
  if (*imem_en_ref) {
    trace_exec(raddr, data);
  }
#endif
  return data;
}
void pmem_write(int waddr, int wdata, char wmask) {
  // waddr = waddr & ~0x3u;
  bool mmio = false;
  if (waddr == SERIAL_PORT) {
#ifdef CONFIG_DTRACE
    dtrace_write("serial", waddr, wdata);
#endif
    putchar(wdata);
    mmio = true;
    // fflush(stdout);
    // return;
  }
  if (mmio) {
#ifdef CONFIG_DIFFTEST
    difftest_skip_ref();
#endif
    return;
  }
  int len = 0;
  if (wmask == 0b1) {
    len = 1;
  } else if (wmask == 0b11) {
    len = 2;
  } else if (wmask == 0b1111) {
    len = 4;
  } else {
    return;
  }
  paddr_write(waddr, len, wdata);
}

// for C
word_t pmem_read(paddr_t addr, int len) {
  IFDEF(CONFIG_MTRACE, trace_mread(addr));
  word_t data;
  if (likely(in_pmem(addr))) {
    return host_read(guest_to_host(addr), len);
  }
  device_read(addr, len);
  return 0;
}

// for C
void pmem_write(paddr_t addr, int len, word_t data) {
  printf("paddr_write\n");
  if (likely(in_pmem(addr))) {
    host_write(guest_to_host(addr), len, data);
    return;
  }
  device_write(addr, len, data);
}

static const uint32_t img[] = {
    0x00500093, // addi x1,x0,5
    0x00300113, // addi x2,x0,3,
    0x002081b3, // add  x3,x1,x2
    0x00302023, // sw   x3,0(x0)
    0x00002203, // ld   x4 0(x0)
    0x00100073, // ebreak
};

long load_img(char *img_file) {
  if (img_file == nullptr) {
    Log("No image is given. Use the default build-in image.");
    memcpy(guest_to_host(RESET_VECTOR), img, sizeof(img));
    return 4096; // built-in image size
  }

  FILE *fp = fopen(img_file, "rb");
  Assert(fp, "Can not open '%s'", img_file);

  fseek(fp, 0, SEEK_END);
  long size = ftell(fp);

  Log("The image is %s, size = %ld", img_file, size);

  fseek(fp, 0, SEEK_SET);
  int ret = fread(guest_to_host(RESET_VECTOR), size, 1, fp);
  assert(ret == 1);

  fclose(fp);
  return size;
}
