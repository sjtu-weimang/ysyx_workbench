// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vriscv_core.h for the primary calling header

#include "verilated.h"

#include "Vriscv_core___024root.h"

void Vriscv_core___024root___eval_act(Vriscv_core___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vriscv_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vriscv_core___024root___eval_act\n"); );
}

void Vriscv_core___024root___eval_nba(Vriscv_core___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vriscv_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vriscv_core___024root___eval_nba\n"); );
}

void Vriscv_core___024root___eval_triggers__act(Vriscv_core___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vriscv_core___024root___dump_triggers__act(Vriscv_core___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vriscv_core___024root___dump_triggers__nba(Vriscv_core___024root* vlSelf);
#endif  // VL_DEBUG

void Vriscv_core___024root___eval(Vriscv_core___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vriscv_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vriscv_core___024root___eval\n"); );
    // Init
    VlTriggerVec<0> __VpreTriggered;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        __VnbaContinue = 0U;
        vlSelf->__VnbaTriggered.clear();
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            vlSelf->__VactContinue = 0U;
            Vriscv_core___024root___eval_triggers__act(vlSelf);
            if (vlSelf->__VactTriggered.any()) {
                vlSelf->__VactContinue = 1U;
                if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                    Vriscv_core___024root___dump_triggers__act(vlSelf);
#endif
                    VL_FATAL_MT("riscv_core.v", 1, "", "Active region did not converge.");
                }
                vlSelf->__VactIterCount = ((IData)(1U) 
                                           + vlSelf->__VactIterCount);
                __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
                vlSelf->__VnbaTriggered.set(vlSelf->__VactTriggered);
                Vriscv_core___024root___eval_act(vlSelf);
            }
        }
        if (vlSelf->__VnbaTriggered.any()) {
            __VnbaContinue = 1U;
            if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
                Vriscv_core___024root___dump_triggers__nba(vlSelf);
#endif
                VL_FATAL_MT("riscv_core.v", 1, "", "NBA region did not converge.");
            }
            __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
            Vriscv_core___024root___eval_nba(vlSelf);
        }
    }
}

#ifdef VL_DEBUG
void Vriscv_core___024root___eval_debug_assertions(Vriscv_core___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vriscv_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vriscv_core___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((vlSelf->rst & 0xfeU))) {
        Verilated::overWidthError("rst");}
}
#endif  // VL_DEBUG
