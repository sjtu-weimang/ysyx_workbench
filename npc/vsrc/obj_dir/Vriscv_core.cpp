// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vriscv_core.h"
#include "Vriscv_core__Syms.h"

//============================================================
// Constructors

Vriscv_core::Vriscv_core(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vriscv_core__Syms(contextp(), _vcname__, this)}
    , clk{vlSymsp->TOP.clk}
    , rst{vlSymsp->TOP.rst}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vriscv_core::Vriscv_core(const char* _vcname__)
    : Vriscv_core(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vriscv_core::~Vriscv_core() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vriscv_core___024root___eval_debug_assertions(Vriscv_core___024root* vlSelf);
#endif  // VL_DEBUG
void Vriscv_core___024root___eval_static(Vriscv_core___024root* vlSelf);
void Vriscv_core___024root___eval_initial(Vriscv_core___024root* vlSelf);
void Vriscv_core___024root___eval_settle(Vriscv_core___024root* vlSelf);
void Vriscv_core___024root___eval(Vriscv_core___024root* vlSelf);

void Vriscv_core::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vriscv_core::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vriscv_core___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vriscv_core___024root___eval_static(&(vlSymsp->TOP));
        Vriscv_core___024root___eval_initial(&(vlSymsp->TOP));
        Vriscv_core___024root___eval_settle(&(vlSymsp->TOP));
    }
    // MTask 0 start
    VL_DEBUG_IF(VL_DBG_MSGF("MTask0 starting\n"););
    Verilated::mtaskId(0);
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vriscv_core___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfThreadMTask(vlSymsp->__Vm_evalMsgQp);
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vriscv_core::eventsPending() { return false; }

uint64_t Vriscv_core::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vriscv_core::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vriscv_core___024root___eval_final(Vriscv_core___024root* vlSelf);

VL_ATTR_COLD void Vriscv_core::final() {
    Vriscv_core___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vriscv_core::hierName() const { return vlSymsp->name(); }
const char* Vriscv_core::modelName() const { return "Vriscv_core"; }
unsigned Vriscv_core::threads() const { return 1; }
