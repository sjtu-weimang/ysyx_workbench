#ifndef INST_TRACE
#include <common.h>

#define MAX_IRINGBUF 16

typedef struct {
  word_t pc;
  uint32_t inst;
} ItraceNode;

extern ItraceNode iringbuf[MAX_IRINGBUF];

void trace(paddr_t pc, uint32_t inst, bool print);

void dump();

extern int p_cur;
extern bool full;

#endif