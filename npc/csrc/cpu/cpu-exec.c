#include <cpu/cpu.h>
#include <cpu/difftest.h>
#include <mem/paddr.h>
#include <module.h>
#include <tracer/inst_tracer.h>
#include <tracer/wave_tracer.h>
#include <mem/mem.h>

#define MAX_INST_TO_PRINT 10

void device_update();
int wp_difftest();

CPU_state cpu;
static bool g_print_step = false;
static uint64_t cycle_cnt = 0;
static uint64_t inst_cnt = 0;
static uint64_t commit_cnt = 0;
int device_access_st = 0;

mem_t mem;
mem_t mem2;

//ebreak instruction 
void dpic_ebreak(paddr_t pc,uint32_t code){
    npc_state.state=NPC_END;
    npc_state.halt_pc=pc;
    npc_state.halt_code=code;
}

#ifdef CONFIG_FTRACE
void trace_func_call(paddr_t pc, paddr_t target,bool is_tail);
void trace_func_ret(paddr_t pc);

void dpic_ftrace(paddr_t pc,paddr_t dnpc,uint8_t dest,word_t imm,uint8_t is_ret){
    if(is_ret){
        trace_func_ret(pc);
    }else if(dest==0){
        trace_func_call(pc,dnpc,true);
    }else if(dest==1){
        trace_func_call(pc,dnpc,false);
    }
}
#endif

//sync CPU_state
static void set_cpu(){
    #include "set_cpu.h"
} 

static void single_cycle(){
    ++cycle_cnt;
    dut.clock=0;
    dut.eval();
    IFDEF(CONFIG_WTRACE,wavetracer.dump_single());
    dut.clock=1;
    dut.eval();


}

void cpu_reset(int n){
    dut.reset=1;
    while(n-->0)single_cycle();
    cpu.pc=0x80000000;
    cpu.mstatus=0xa00001800;
}

void dpic_commit(unsigned long long pc,unsigned inst, unsigned long long npc,char dm_access){
    commit_cnt--;
    inst_cnt++;
    set_cpu();
    cpu.pc=npc;

    if (device_access_st && dm_access) {
    device_access_st--;
    difftest_skip_ref();
  }

  IFDEF(CONFIG_ITRACE,itracer.trace(pc,inst,g_print_step));
  IFDEF(CONFIG_WATCHPOINT,if(wp_difftest())npc_state.state=NPC_STOP);
  device_update();
  IFDEF(CONFIG_DIFFTEST,difftest_step(pc));
}

static void exec(uint64_t n){
    commit_vnt=n;

    if(dut.reset==1){
        dut.reset=0;
        dut.eval();
        set_cpu();
    }

    while(commit_cnt>0){
        single_cycle();
        if(npc_state.state!=NPC_RUNNING)break;
    }
}

void cpu_exec(uint64_t n){
    g_print_step=(n<=MAX_INST_TO_PRINT);

    switch (npc_state.state) {
    case NPC_END:
    case NPC_ABORT:
        printf(
            "Program execution has ended. To restart the program, exit NPC and "
            "run again.\n");
        return;
    default:
        npc_state.state = NPC_RUNNING;
    }

    exec(n);

    switch(npc_state.state){
        case NPC_RUNNING:
        npc_state.state=NPC_STOP;
        break;
        case NPC_END:
        case NPC_ABORT:
        if(npc_state.halt_code!=0)itracer.dump();
        Log("npc: %s \n\thalt_code=%d\n\thalt_pc=" FMT_PADDR "\n\t%lu instructions executed\n\tIPC=%0.6f",
            npc_state.state==NPC_ABORT?ANSI_FMT("ABORT",ANSI_FG_RED):
            (npc_state.halt_code==0?ANSI_FMT("HIT GOOD TRAP",ANSI_FG_GREEN):
            ANSI_FMT("HIT BAD TRAP",ANSI_FG_RED)),
            npc_state.halt_code,npc_state.halt_pc,inst_cnt,(double)inst_cnt/cycle_cnt)

    }
}


