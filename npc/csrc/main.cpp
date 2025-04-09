#include "VTopLevel.h"
#include "common.h"
#include "difftest/difftest-def.h"
#include "dpi.h"
#include "isa/isa.h"
#include "sdb/sdb.h"
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <verilated.h>

int cycle_cnt;

void cpu_exec(int n) {
  if (n < 0) {
    n = 0x3fffffff;
  }
  for (int i = 0; i < n; i++) {
    if (npc_status != NPC_STATUS_GOOD) {
      break;
    }
    cycle_cnt++;
    contextp->timeInc(1);
    top->clock = 0;
    top->eval();
    top->clock = 1;
    top->eval();
    if (is_ebreak) {
      if (ebreak_code == 1) {
        npc_status = NPC_STATUS_QUIT;
        printf("At %d cycle, ebreak called. Exited.\n", cycle_cnt);
      } else {
        npc_status = NPC_STATUS_FAILED;
        printf("At %d cycle, ebreak called with error code %d,ebreak_pc is "
               "%x,Exited.\n",
               cycle_cnt, int(ebreak_code), ebreak_pc);
      }
      break;
    }
  }
}

int main(int argc, char **argv) {
  if (argc < 2) {
    puts("Format: <x.exe> +trace <executable image> <elf file> <difftest ref "
         "so file>");
    return 1;
  } else {
    printf("arg1 is %s\n", argv[1]);
    printf("arg2 is %s\n", argv[2]);
    printf("arg3 is %s\n", argv[3]);
    printf("img files is %s\n", argv[2]);
  }
  Verilated::mkdir("logs");
  log_init();
  FILE *f = fopen(argv[2], "rb");
  if (f == nullptr) {
    puts("Open executable image failed");
  }
  const char *elf = argv[3];
  const char *difftest_ref_so_file = argv[4];
  int img_size = fread(mem, 1, MEM_SIZE, f);
  is_ebreak = false;
  contextp->debug(0);
  contextp->randReset(2);
  // contextp->traceEverOn(true);
  contextp->commandArgs(argc, argv);
  imem_en_ref = &top->io_test_imem_en;
  top->reset = 1;
  top->clock = 0;
  top->eval();
  top->clock = 1;
  top->eval();
  top->reset = 0;
  npc_status = NPC_STATUS_GOOD;

  init_isa();
  init_sdb(elf);
#ifdef CONFIG_DIFFTEST
  init_difftest(difftest_ref_so_file, img_size, 0);
#endif

  get_time();
  sdb_mainloop();

#ifdef CONFIG_ITRACE
  instruction_ring_buffer_write();
#endif
#ifdef CONFIG_FTRACE
  ftrace_close();
#endif

  top->final();
  // contextp->coveragep()->write("logs/coverage.dat");
  if (npc_status != NPC_STATUS_QUIT) {
    puts("Program exited abnormally.");
    log_close();
    return 1;
  }

  log_close();
}
