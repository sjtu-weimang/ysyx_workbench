#include <verilated.h>

#include <Vtop.h>
#include <Vtop__Dpi.h>
#include <common.h>
#include <cpu/cpu.h>
#include <module.h>
#include <utils.h>

void init_monitor(int, char *[]);
void sdb_mianloop();

int main(int argc, char **argv) {

  init_monitor(argc, argv);

  sdb_mianloop();

  return exit_code();
}