#include <cpu/cpu.h>

static const char *regs[] = {"$0", "ra", "sp",  "gp",  "tp", "t0", "t1", "t2",
                             "s0", "s1", "a0",  "a1",  "a2", "a3", "a4", "a5",
                             "a6", "a7", "s2",  "s3",  "s4", "s5", "s6", "s7",
                             "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"};

// macro for display registers
#define REG_ENTRY_FORMAT "%-8s\t%-#20x\t%-20d\n"
#define PRINT_REG(name, value) printf(REG_ENTRY_FORMAT, name, value, value)

// print the state of register.
void dump_gpr() {
  int reg_num = ARRLEN(regs);
  int i;

  Statement("General Purpose Register");
  for (i = 0; i < reg_num; i++) {
    printf("[%d]:", i);
    PRINT_REG(regs[i], cpu.gpr[i]);
  }

  Statement("Special Purpose Register");
  PRINT_REG("pc", cpu.pc);
}

// convert register string to val,for dsiplaying the state of register.
word_t reg_str2val(const char *s, bool *success) {
  if (strcmp(s, "$pc") == 0) {
    *success = true;
    return cpu.pc;
  }
  if (strncmp(s, "$x", 2) == 0) {
    int idx = strtol(s + 2, NULL, 10);
    *success = true;
    return cpu.gpr[idx];
  }

  int i;
  int reg_num = ARRLEN(regs);
  for (i = 0; i < reg_num; i++) {
    if (regs[i][0] == '$' && strcmp(regs[i], s) == 0 ||
        strcmp(regs[i], s + 1) == 0) {
      break;
    }
  }
  *success = i < reg_num;

  return *success ? cpu.gpr[i] : 0;
}