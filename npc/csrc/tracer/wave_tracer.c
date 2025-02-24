#include <tracer/wave_tracer.h>

void open(VTop *dut) {
  vcd = new VerilatedVcdC;
  dut->trace(vcd, 0);
  vcd->open("waveform.vcd");
}

void dump_single() {
  static uint32_t sim_time = 0;
  static uint32_t dump_cnt = 0;
  if (sim_time <= MAX_WAVE_CNTAX) {
    IFDEF(
        CONFIG_WAVETRACE_FLUSH,
        dump_cnt = (dump_cnt + 1) % CONFIG_WAVETRACE_FLUSH;
        if (dump_cnt == 0) { vcd->flush(); })
  }
}

close() {
  vcd->close();
  delete vcd;
}