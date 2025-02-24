#include <common.h>

#define MAX_IRINGBUF 16

typedef struct {
  word_t pc;
  uint32_t inst;
} ItraceNode;

ItraceNode iringbuf[MAX_IRINGBUF];

void trace(paddr_t pc, uint32_t inst, bool print);

void dump();

int p_cur = 0;
bool full = false;
