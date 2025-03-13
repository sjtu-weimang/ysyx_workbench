#ifndef WAVETRACE
#include <Vtop.h>
#include <common.h>
#include <verilated_vcd_c.h>

const int MAX_WAVE_CNT = CONFIG_MAX_WAVETRACE_CLK;

extern VerilatedVcdC *vcd;

void open(Vtop *dut);

void dump_single();

void close();
#endif
