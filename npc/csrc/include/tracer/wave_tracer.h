#include <VTop.h>
#include <cmmon.h>
#include <verilated_vcd.c.h>

const MAX_WAVE_CNT = CONFIG_MAX_WAVETRACE_CLK;
VerilatedVcdC *vcd;
VTop *dut;

void open(VTop *dut);

void dump_single();

void close();
