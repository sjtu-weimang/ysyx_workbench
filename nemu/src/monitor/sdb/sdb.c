/***************************************************************************************
* Copyright (c) 2014-2024 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include <isa.h>
#include <cpu/cpu.h>
#include <readline/readline.h>
#include <readline/history.h>
#include "sdb.h"

static int is_batch_mode = false;

void init_regex();
void init_wp_pool();

/* We use the `readline' library to provide more flexibility to read from stdin. */
static char* rl_gets() {
  static char *line_read = NULL;

  if (line_read) {
    free(line_read);
    line_read = NULL;
  }

  line_read = readline("(nemu) ");

  if (line_read && *line_read) {
    add_history(line_read);
  }

  return line_read;
}

//单步执行的命令
static int cmd_siN(char *args){
  int n = 1;
  if (args != NULL) {
    sscanf(args, "%d", &n);
  }
  printf("n = %d\n", n);
  cpu_exec(n);
  return 0;
}
//表达式求值的命令
static int cmd_p(char *args) {
  bool success = true;
  word_t result = expr(args, &success);
  if (success) {
    printf("%s=\n",args);
    printf("%u\n",result);
  } else {
    printf("Invalid expression\n");
  }
  return 0;
}

//扫描内存的命令
static int cmd_x(char *args) {
  char *arg = strtok(NULL, " ");
  int n=-1;
  bool success=true;
  vaddr_t addr=0x80000000;
  if(*arg<'0'||*arg>'9'){
    printf("n need to be a number between 0 and 9.\n");
    return 0;
  }
  sscanf(arg, "%d", &n); //把表达式转化为整数常量
  arg = strtok(NULL, " ");
  sscanf(arg, "%x", &addr);
  //addr=expr(arg,&success);
  //printf("%0x\n"addr);
  if(!success){
    printf("expression is invalid.\n");
    return 0;}
  if(addr<0x8000000 || addr>0xffffffff){
    printf("invalid address.\n");
    return 0;
  }
  for(int i = 0; i < n; i++){
    printf("0x%08x: ", addr);
    for (int j = 0; j < 4; j++) {
      printf("0x%02x ", vaddr_read(addr, 1));
      addr++;
    }
    printf("\n");
  }
  return 0;
}

//设置监视点的命令
static int cmd_w(char* args){
    bool success=true;
    WP* point =new_wp(args,&success);
    if(!success){
      printf("Some things wrong happend.\n");
    }else{
      printf("create a WatchPoint(No.%d):%s\n",point->NO,point
      ->expression);
    }
    return 0;
  }

//打印程序的状态命令
static int cmd_info(char *args) {
  char *arg = strtok(NULL, " ");
  if (arg==NULL){
    printf("info \n");
  }
  else if (strcmp(arg, "r") == 0) {
    printf("the states of riscv32 registers displayed:\n");
    isa_reg_display();
  }else if (strcmp(arg, "w") == 0) {
    wp_display();
    //printf("wp_display to be implement\n");
  }else {
    printf("Unknown command '%s'\n", arg);
  }
  return 0;
}

//删除监视点的指令
static int cmd_d(char * args){
  if (args==NULL){
    printf("d instruciton is missing parameter N.\n");
    return 0;
  }
  int N=atoi(args);
  delete_watchpoint(N);
  return 0;
}
static int cmd_c(char *args) {
  cpu_exec(-1);
  return 0;
}

static int cmd_q(char *args) {
  nemu_state.state=NEMU_QUIT;
  return -1;
}

static int cmd_help(char *args);

static struct {
  const char *name;
  const char *description;
  int (*handler) (char *);
} cmd_table [] = {
  { "help", "Display information about all supported commands", cmd_help },
  { "c", "Continue the execution of the program", cmd_c },
  { "q", "Exit NEMU", cmd_q },
  { "si", "Single step execution of the program", cmd_siN },
  { "info", "Print program state", cmd_info },
  { "p", "Expression evaluation", cmd_p },
  { "x","Scann the memory address",cmd_x},
  { "w","Set watch point",cmd_w},
  {"d","Delete the watch point with code N",cmd_d}
  /* TODO: Add more commands */

};

//获取命令的数量
#define NR_CMD ARRLEN(cmd_table)

static int cmd_help(char *args) {
  /* extract the first argument */
  char *arg = strtok(NULL, " ");
  int i;

  if (arg == NULL) {
    /* no argument given */
    for (i = 0; i < NR_CMD; i ++) {
      printf("%s - %s\n", cmd_table[i].name, cmd_table[i].description);
    }
  }
  else {
    for (i = 0; i < NR_CMD; i ++) {
      if (strcmp(arg, cmd_table[i].name) == 0) {
        printf("%s - %s\n", cmd_table[i].name, cmd_table[i].description);
        return 0;
      }
    }
    printf("Unknown command '%s'\n", arg);
  }
  return 0;
}

void sdb_set_batch_mode() {
  is_batch_mode = true;
}

void sdb_mainloop() {
  if (is_batch_mode) {
    cmd_c(NULL);
    return;
  }

  for (char *str; (str = rl_gets()) != NULL; ) {
    char *str_end = str + strlen(str);

    /* extract the first token as the command */
    char *cmd = strtok(str, " ");
    if (cmd == NULL) { continue; }

    /* treat the remaining string as the arguments,
     * which may need further parsing
     */
    char *args = cmd + strlen(cmd) + 1;
    if (args >= str_end) {
      args = NULL;
    }

#ifdef CONFIG_DEVICE
    extern void sdl_clear_event_queue();
    sdl_clear_event_queue();
#endif

    int i;
    for (i = 0; i < NR_CMD; i ++) {
      if (strcmp(cmd, cmd_table[i].name) == 0) {
        if (cmd_table[i].handler(args) < 0) { return; }
        break;
      }
    }

    if (i == NR_CMD) { printf("Unknown command '%s'\n", cmd); }
  }
}

void init_sdb() {
  /* Compile the regular expressions. */
  init_regex();

  /* Initialize the watchpoint pool. */
  init_wp_pool();
}
