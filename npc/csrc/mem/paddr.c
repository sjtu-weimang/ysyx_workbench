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
void paddr_read(paddr_t addr, word_t *data) {

  addr = addr & ~0x3u;
  // IFDEF(CONFIG_MTRACE, trace_mread(addr));
  if (likely(in_pmem(addr))) {
    *data = host_read(guest_to_host(addr), 8);
    return;
  }
  *data = device_read(addr, 8); // WARN: no len specified in DPI-C interface
  return;
}

// for DPI-C
void paddr_write(paddr_t addr, word_t data, uint8_t mask) {
  addr = addr & ~0x3u;
  int len;
  switch (mask) {
  case 0x01:
    len = 1;
    break;
  case 0x03:
    len = 2;
    break;
  case 0x0f:
    len = 4;
    break;
  case 0xff:
    len = 8;
    break;
  case 0x00:
    return;
  default:
    Panic("paddr_write wrong mask: %02x", mask);
  }
  if (likely(in_pmem(addr))) {
    host_write(guest_to_host(addr), len, data);
    return;
  }
  device_write(addr, len, data);
  return;
}

// for C
word_t paddr_read(paddr_t addr, int len) {
  IFDEF(CONFIG_MTRACE, trace_mread(addr));
  word_t data;
  if (likely(in_pmem(addr))) {
    return host_read(guest_to_host(addr), len);
  }
  device_read(addr, len);
  return 0;
}

// for C
void paddr_write(paddr_t addr, int len, word_t data) {
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
