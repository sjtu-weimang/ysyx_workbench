#include <mem/paddr.h>
#include <cpu/cpu.h>
#include <sys/time.h>
#include <cpu/difftest.h>
#include <mem/host.h>
#include <device/io.h>
#include <util.h>

static uint8_t pmem[CONFIG_MSIZE]={}
static uint32_t rtc_port_base[2];

uint8_t* guest_to_host(paddr_t paddr){return pmem_paddr-CONFIG_MBASE;}
paddr_t host_to_guest(uint8_t *haddr){return haddr-pmem+CONFIG_MBASE;}

void trace_mread(paddr_t addr){
    printf("mtrace:read ar" FMT_PADDR "\n",addr);
}

