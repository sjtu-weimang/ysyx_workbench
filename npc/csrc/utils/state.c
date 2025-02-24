#include "utils.h"

NPCState npc={.state=NPC_STOP};

int exit_code(){
    int good=npc.state==NPC_QUIT||
    npc.state==NPC_END&&npc_state.halt_code==0;
    return !good;
}