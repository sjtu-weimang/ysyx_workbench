# 编译器设置
VERILATOR = verilator
VERILATOR_FLAGS = -Wall --cc --exe --build 

# 目标文件
VERILOG_SOURCES = top.v cpu.v inst_rom_dpic.v data_ram_dpic.v dpi_c.v ebreak.v 
TESTBENCH = inter_test.c paddr.c
TOP_MODULE = Vtop

# 默认目标
all: compile run

# 编译 Verilog 和测试平台
compile:
	$(VERILATOR) $(VERILATOR_FLAGS) $(VERILOG_SOURCES) $(TESTBENCH)

# 运行仿真
run:
	./obj_dir/$(TOP_MODULE)

# 清理生成的文件
clean:
	rm -rf obj_dir 

# 伪目标声明:
.PHONY: all compile run clean