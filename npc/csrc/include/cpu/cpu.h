#ifndef CPU_H
#define CPU_H
#include <Vtop.h>
#include <Vtop__Dpi.h>
#include <Vtop___024root.h>
#include <common.h>
#include <verilated.h>
#include <verilated_dpi.h>
#include <verilated_vcd_c.h>

#include <cpu/difftest.h>
#include <mem/paddr.h>
#include <module.h>
#include <tracer/inst_tracer.h>
#include <tracer/wave_tracer.h>

// cpu state
typedef struct {
  word_t gpr[32];
  paddr_t pc;

  // control and status register
  word_t mcause;
  word_t mepc;
  word_t mstatus;
  word_t mtvec;
} CPU_state;

// extern state a global variable difined in other files.
extern CPU_state cpu;
extern Vtop dut;
extern void cpu_reset(int n);
extern void cpu_exec(uint64_t n);

extern void dump_gpr();
word_t reg_str2val(const char *s,bool *success);
uint32_t get_inst();

#endif