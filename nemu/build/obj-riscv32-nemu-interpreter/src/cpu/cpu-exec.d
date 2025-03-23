cmd_/home/zhang/ysyx-workbench/nemu/build/obj-riscv32-nemu-interpreter/src/cpu/cpu-exec.o := unused

source_/home/zhang/ysyx-workbench/nemu/build/obj-riscv32-nemu-interpreter/src/cpu/cpu-exec.o := src/cpu/cpu-exec.c

deps_/home/zhang/ysyx-workbench/nemu/build/obj-riscv32-nemu-interpreter/src/cpu/cpu-exec.o := \
    $(wildcard include/config/watchpoint.h) \
    $(wildcard include/config/itrace.h) \
    $(wildcard include/config/ftrace.h) \
    $(wildcard include/config/itrace/cond.h) \
    $(wildcard include/config/difftest.h) \
    $(wildcard include/config/isa/x86.h) \
    $(wildcard include/config/isa/loongarch32r.h) \
    $(wildcard include/config/device.h) \
    $(wildcard include/config/target/am.h) \
    $(wildcard include/config/etrace.h) \
  /home/zhang/ysyx-workbench/nemu/include/debug.h \
  /home/zhang/ysyx-workbench/nemu/include/common.h \
    $(wildcard include/config/mbase.h) \
    $(wildcard include/config/msize.h) \
    $(wildcard include/config/isa64.h) \
  /home/zhang/ysyx-workbench/nemu/include/macro.h \
  /home/zhang/ysyx-workbench/nemu/include/utils.h \
    $(wildcard include/config/target/native/elf.h) \
  /home/zhang/ysyx-workbench/nemu/include/cpu/cpu.h \
  /home/zhang/ysyx-workbench/nemu/include/cpu/decode.h \
  /home/zhang/ysyx-workbench/nemu/include/isa.h \
  /home/zhang/ysyx-workbench/nemu/src/isa/riscv32/include/isa-def.h \
    $(wildcard include/config/rve.h) \
    $(wildcard include/config/rv64.h) \
  /home/zhang/ysyx-workbench/nemu/include/cpu/difftest.h \
  /home/zhang/ysyx-workbench/nemu/include/difftest-def.h \
    $(wildcard include/config/isa/mips32.h) \
    $(wildcard include/config/isa/riscv.h) \
  src/cpu/../monitor/sdb/watchpoint.h \
  src/cpu/../monitor/sdb/sdb.h \

/home/zhang/ysyx-workbench/nemu/build/obj-riscv32-nemu-interpreter/src/cpu/cpu-exec.o: $(deps_/home/zhang/ysyx-workbench/nemu/build/obj-riscv32-nemu-interpreter/src/cpu/cpu-exec.o)

$(deps_/home/zhang/ysyx-workbench/nemu/build/obj-riscv32-nemu-interpreter/src/cpu/cpu-exec.o):
