.PHONY: sim clean
all:

IMG = yield-os-riscv32e-npc.bin
DIFFTEST_REF= ../nemu/build/riscv32-nemu-interpreter-so
LLVM_CONFIG ?= llvm-config
LLVM_CXXFLAGS := $(shell $(LLVM_CONFIG) --cxxflags)
LLVM_CXXFLAGS := $(filter-out -D__STDC_FORMAT_MACROS, $(LLVM_CXXFLAGS))
LLVM_LDFLAGS := $(shell $(LLVM_CONFIG) --ldflags --libs)
LLVM_LDFLAGS += -lreadline
run: sim
	./obj_dir/VTopLevel +trace $(IMG) $(ELF) $(DIFFTEST_REF)
gdb: sim
	gdb --args ./obj_dir/VTopLevel +trace $(IMG) $(ELF) $(DIFFTEST_REF)

sim:
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	verilator -cc --exe --build -x-assign fast --trace --assert --coverage -CFLAGS -ggdb  -LDFLAGS -ggdb -j 8 \
	--top-module TopLevel \
	-CFLAGS "-ggdb $(LLVM_CXXFLAGS)" \
	-LDFLAGS "-ggdb $(LLVM_LDFLAGS)" \
	csrc/main.cpp csrc/dpi.cpp csrc/sdb/sdb.cpp csrc/sdb/watchpoint.cpp csrc/sdb/expr.cpp \
	csrc/isa/isa.cpp csrc/common.cpp csrc/utils/disasm.cpp \
	csrc/difftest/dut.cpp \
	vsrc/TopLevel.v vsrc/EBreak.v vsrc/PMem.v

clean:
	rm -rf obj_dir logs

include ../Makefile
