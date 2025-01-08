#include <isa.h>
#include "local-include/reg.h"

const char *regs[] = {
  "$0", "ra", "sp", "gp", "tp", "t0", "t1", "t2",
  "s0", "s1", "a0", "a1", "a2", "a3", "a4", "a5",
  "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7",
  "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"
};

#define REGISTERS_PER_LINE 4
#define MIN(X, Y) (((X) < (Y)) ? (X) : (Y))

void isa_reg_display() {
  int length = ARRLEN(regs);
  int i = 0;
  printf("================================REGISTER INFORMATION==================================\n");
  for (i = 0; i < length; i+= REGISTERS_PER_LINE){
    for (int j = i; j < MIN(length, i + REGISTERS_PER_LINE); ++j){
      printf("%3s: %#12x | ", regs[j], cpu.gpr[j]);
    }
    printf("\n");
  }
}

word_t isa_reg_str2val(const char *s, bool *success) {
  *success = true;
  if (strcmp(s, regs[0]) == 0){
    return cpu.gpr[0];
  }

  for (int i = 1; i < ARRLEN(regs); ++i){
    if (strcmp(regs[i], s+1) == 0){//跳过$
      *success = true;
      return cpu.gpr[i];
    }
  }

  *success = false;
  return -1;
}