#include "Vriscv_core.h"
#include "verilated.h"
#include <fstream>

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);
    Vriscv_core* top = new Vriscv_core;
    
    // 初始化指令存储器
    std::ifstream bin_file("test.bin", std::ios::binary);
    for(int i=0; i<1024; i++) {
        if(bin_file) {
            uint32_t instr;
            bin_file.read((char*)&instr, 4);
            top->IF->instruction_memory[i] = instr;
        } else {
            top->IF->instruction_memory[i] = 0x00000013; // NOP
        }
    }

    // 复位序列
    top->rst = 1;
    top->clk = 0;
    for(int i=0; i<5; i++) {
        top->clk = !top->clk;
        top->eval();
    }
    top->rst = 0;

    // 执行100个时钟周期
    for(int cycle=0; cycle<100; cycle++) {
        top->clk = 1;
        top->eval();
        top->clk = 0;
        top->eval();

        // 显示寄存器状态
        printf("Cycle %2d: PC=%08x Instr=%08x", 
            cycle, top->pc, top->instruction);
        if(top->reg_write_en) {
            printf(" x%d=%08x", top->rd_out, top->write_data);
        }
        printf("\n");

        // 结束条件判断
        if(top->pc >= 0x80000000 + 5*4) break;
    }

    // 验证结果
    bool pass = true;
    if(top->RF->registers[3] != 8) pass = false;
    if(top->RF->registers[4] != 8) pass = false;

    delete top;
    return pass ? 0 : 1;
}