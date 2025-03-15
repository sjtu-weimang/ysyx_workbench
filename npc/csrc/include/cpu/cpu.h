#ifndef CPU_H
#define CPU_H
#include <Vtop.h>
#include <Vtop__Dpi.h>
#include <Vtop___024root.h>
#include <verilated.h>
#include <verilated_dpi.h>
#include <verilated_vcd_c.h>

#include <common.h>

// cpu state
typedef struct {
  word_t gpr[32];
  paddr_t pc;

} CPU_state;

// extern state a global variable difined in other files.
extern CPU_state cpu;
extern Vtop dut;

void cpu_reset(int n);
void cpu_exec(uint32_t n);
void dump_gpr();

word_t reg_str2val(const char *s, bool *success);
uint32_t get_inst();

#endif