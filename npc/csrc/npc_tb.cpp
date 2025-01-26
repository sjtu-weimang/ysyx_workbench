#include<iostream>
#include<verilated.h>
#include"../vsrc/npc.v"

int main(int argc int **argv){
    Vnpc* top=new Vnpc;

    top->clk=0;
    top->rst=1;

    for (int i=0;i<10;i++){
        if(i==2)top->rst=0;
        top->clk=!top->clk;
        top->eval();

        std::cout << "Cycle " << i << ": "
            << "PC = 0x" << std::hex << top->pc
            << ", x1 = 0x" << top->rf[1]
            << ", x2 = 0x" << top->rf[2]
            << ", x0 = 0x" << top->rf[0] << std::endl;
    }
    top->final();
    delete top;

    std::cout<<"Simulation finished."<<endl;
    return 0;
}