#include <Vtop.h>
#include <stdio.h>

static Vtop dut;

static void single_cycle() {
  static int sim_time = 0;
  dut.clk = 0;
  dut.eval();
  dut.clk = 1;
  dut.eval();
}

static void reset(int n) {
  dut.rst = 1;
  while (n-- > 0)
    single_cycle();
  dut.rst = 0;
}

int main() {

  reset(10);

  for (int i = 0; i < 200; i++) {
    single_cycle();
  }

  delete dut;
}

void dpic_ebreak(uint32_t pc, uint32_t code) {
  printf("%#08llx: ebreak with code(%d)\n", pc, code);
  finish();
  exit(0);
}
