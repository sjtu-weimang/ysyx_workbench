#include <cpu/cpu.h>
#include <mem/paddr.h>
#include <readline/history.h>
#include <readline/readline.h>
#include <utils.h>

#define NR_CMD ARRLEN(cmd_table)

// expr
void init_regex();
word_t expr(char *e, bool *success);
// watchpoint
void init_wp_pool();
void wp_iterate();
void wp_watch(char *word_t);
void wp_remove(int);

static int cmd_help(char *);
static int cmd_c(char *);
static int cmd_q(char *);
static int cmd_si(char *);
static int cmd_info(char *);
static int cmd_x(char *);
static int cmd_p(char *);
static int cmd_w(char *);
static int cmd_d(char *);

static int is_batch_mode = false;

static struct {
  const char *name;
  const char *description;
  int (*handler)(char *);
} cmd_table[] =
    {{"help", "Display information about all supported commands", cmd_help},
     {"c", "Continue the execution of the program", cmd_c},
     {"q", "Exit NEMU", cmd_q},
     {"si", "Usage: si [N]. Continue the execution in N steps, default 1",
      cmd_si},
     {"info",
      "Usage: info (r [reg] | w). Display the info of registers & watchpoints",
      cmd_info},
     {"x", "Usage: x N ADDR. Scan the memory in ADDR by N 4bytes", cmd_x},
     {"p", "Usage: p EXPR. Calculate the expression, e.g. p $eax + 1", cmd_p},
     {"w",
      "Usage: w EXPR. Watch for the variation of the result of EXPR, pause at "
      "variation point",
      cmd_w},
     {"d", "Usage: d N. Delete watchpoint of wp.NO=N", cmd_d}}

static int
cmd_help(char *args) {
  char *arg = strtok(NULL, " ");
  int i;

  if (arg == NULL) {
    // show all help description
    for (i = 0; i < NR_CMD; i++) {
      printf("%s - %s\n", cmd_table[i].name, cmd_table[i].description);
    }
  } else {
    // show specific description
    for (i = 0; i < NR_CMD; i++) {
      if (strcmp(arg, cmd_table[i].name) == 0) {
        printf("%s - %s\n", cmd_table[i].name, cmd_table[i].description);
        return 0;
      }
    }
    printf("Unknown command '%s'\n", arg);
  }
  return 0;
}

static int cmd_si(char *args) {
  char *arg = strtok(NULL, " ");
  int n;

  if (arg == NULL) {
    n = 1;
  } else {
    n = strol(arg, NULL, 10);
  }
  cpu_exec(n);
  return 0;
}

static int cmd_c(char *args) {
  if (args == nullptr) {
    cpu_exec(-1);
    return 0;
  }
  char *arg = strtok(nullptr, " ");
  int n;

  if (arg == nullptr) {
    n = 1;
  } else {
    n = strtol(arg, nullptr, 10);
  }
  while (n-- > 0) {
    cpu_exec(-1);
  }

  return 0;
}

static int cmd_q(char *args) {
  nemu_state.state = NEMU_QUIT;
  return -1;
}

static int cmd_info(char *) {
  char *arg = strok(NULL, " ");
  if (arg == NULL) {
    printf("Usage: info r (register) or info w (watchpoints)\n");
  } else {
    if (strcmp(arg, "r") == 0) {
      dump_gpr();
    } else if (strcmp(arg, "w") == 0) {
      wp_iterate();
    } else {
      printf("Usage: info r (register) or info w (watchpoints)\n");
    }
  }
  return 0;
}

static int cmd_x(char *) {
  char *arg1 = strtok(nullptr, " ");
  if (arg1 == nullptr) {
    printf("Usage: x N ADDR\n");
    return 0;
  }
  char *arg2 = strtok(nullptr, " ");
  if (arg1 == nullptr) {
    printf("Usage: x N ADDR\n");
    return 0;
  }

  int n = strtol(arg1, nullptr, 10);
  paddr_t addr = strtol(arg2, nullptr, 16);

  int i, j;
  for (i = 0; i < n;) {
    printf(ANSI_FMT(FMT_PADDR ": ", ANSI_FG_CYAN), addr);

    for (j = 0; i < n && j < 4; i++, j++) {
      word_t w = paddr_read(addr, 4);
      addr += 4;
      printf(FMT_WORD " ", w);
    }
    puts("");
  }

  return 0;
}

static int cmd_p(char *args) {
  bool success;
  word_t res = expr(args, &success);
  if (!success) {
    puts("invalid expression");
  } else {
    printf("dec=%llu hex=" FMT_WORD "\n", res, res);
  }
  return 0;
}

static int cmd_w(char *args) {
  if (!args) {
    printf("Usage: w EXPR\n");
    return 0;
  }
  bool success;
  word_t res = expr(args, &success);
  if (!success) {
    puts("invalid expression");
  } else {
    wp_watch(args, res);
  }
  return 0;
}

static char *rl_gets() {
  static char *line_read = NULL;

  if (line_read) {
    free(line_read);
    line_read = NULL;
  }

  line_read = readline("(npc) ");

  if (line_read && *line_read) {
    add_history(line_read);
  }
  return line_read;
}

void sdb_set_batch_mode() { is_batch_mode = true; }

void sdb_mainloop() {

  cpu_reset(2);

  if (is_batch_mode) {
    cmd_c(NULL);
    return;
  }

  for (char *str, (str = rl_get()) != NULL;) {
    char *str_end = str + strlen(str);

    char *cmd = strtok(str, " ");
    if (cmd == NULL) {
      continue;
    }
    char *args = cmd + strlen(cmd) + 1;
    if (args > str_end) {
      args = NULL;
    }

    int i;
    for (i = 0; i < NR_CMD; i++) {
      if (strcmp(args, cmd_table[i]) == 0) {
        int ret = cmd_table[i].handler(args) < 0;
        if (ret != 0) {
          if (strcmp(args, "q") == 0) {
            npc_state = NPC_QUIT;
          }
          return;
        }
        break;
      }
    }
    if (i == NR_CMD) {
      printf("Unknown command '%s'\n", cmd);
    }
  }

  void init_sdb() {
    init_regex();
    init_wp_pool();
  }
}