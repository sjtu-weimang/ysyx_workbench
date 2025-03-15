#include <cpu/cpu.h>
#include <dlfcn.h>
#include <mem/paddr.h>

typedef void (*regcpy_func_t)(void *dut, bool direction);
typedef void (*exec_func_t)(uint64_t n);
typedef void (*init_func_t)();

regcpy_func_t ref_difftest_regcpy = nullptr;
exec_func_t ref_difftest_exec = nullptr;

struct diff_CPU_State {
  word_t gpr[32];
  paddr_t pc;
};

enum { DIFFTEST_TO_DUT, DIFFTEST_TO_REF };
static bool is_skip_ref = false;

void difftest_skip_ref() { is_skip_ref = true; }

void init_difftest(char *ref_so_file, long img_size) {
  assert(ref_so_file);
  Log("difftest with %s is open.", ref_so_file);
  void *handle;
  handle = dlopen(ref_so_file, RTLD_LAZY);
  assert(handle);

  ref_difftest_regcpy = (regcpy_func_t)dlsym(handle, "difftest_regcpy");
  assert(ref_difftest_regcpy);

  ref_difftest_exec = (exec_func_t)dlsym(handle, "difftest_exec");
  assert(ref_difftest_exec);

  init_func_t ref_difftest_init = (init_func_t)dlsym(handle, "difftest_init");
  assert(ref_difftest_init);

  Log("Differential testing: %s", ANSI_FMT("ON", ANSI_FG_GREEN));
  Log("The result of every instruction will be compared with %s. "
      "This will help you a lot for debugging, but also significantly reduce "
      "the performance. ",
      ref_so_file);
  ref_difftest_init();
}

#define CHECKDIFF(r1, r2, fmt, ...)                                            \
  if (r1 != r2) {                                                              \
    printf("difftest fail at " fmt ", expect %#x got %#x\n", ##__VA_ARGS__,    \
           r1, r2);                                                            \
    npc_state.state = NPC_ABORT;                                               \
    npc_state.halt_code = 1;                                                   \
    return;                                                                    \
  }

static void checkregs(diff_CPU_State &ref_state, paddr_t pc) {
  for (int i = 0; i < ARRLEN(ref_state.gpr); i++) {
    CHECKDIFF(ref_state.gpr[i], cpu.gpr[i], "gpr[%d]", i);
  }
  CHECKDIFF(ref_state.pc, cpu.pc, "PC");
}
void difftest_step(paddr_t pc) {
  if (is_skip_ref) {
    ref_difftest_regcpy(&cpu, DIFFTEST_TO_REF);
    is_skip_ref = false;
    return;
  }
  ref_difftest_exec(1);

  diff_CPU_State ref_state;

  ref_difftest_regcpy(&ref_state, DIFFTEST_TO_DUT);

  checkregs(ref_state, pc);
}