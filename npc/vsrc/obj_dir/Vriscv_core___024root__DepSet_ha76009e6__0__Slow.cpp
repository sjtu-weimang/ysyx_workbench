// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vriscv_core.h for the primary calling header

#include "verilated.h"

#include "Vriscv_core___024root.h"

VL_ATTR_COLD void Vriscv_core___024root___eval_static(Vriscv_core___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vriscv_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vriscv_core___024root___eval_static\n"); );
}

VL_ATTR_COLD void Vriscv_core___024root___eval_initial(Vriscv_core___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vriscv_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vriscv_core___024root___eval_initial\n"); );
}

VL_ATTR_COLD void Vriscv_core___024root___eval_final(Vriscv_core___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vriscv_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vriscv_core___024root___eval_final\n"); );
}

VL_ATTR_COLD void Vriscv_core___024root___eval_settle(Vriscv_core___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vriscv_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vriscv_core___024root___eval_settle\n"); );
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vriscv_core___024root___dump_triggers__act(Vriscv_core___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vriscv_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vriscv_core___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VactTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vriscv_core___024root___dump_triggers__nba(Vriscv_core___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vriscv_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vriscv_core___024root___dump_triggers__nba\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VnbaTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vriscv_core___024root___ctor_var_reset(Vriscv_core___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vriscv_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vriscv_core___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clk = VL_RAND_RESET_I(1);
    vlSelf->rst = VL_RAND_RESET_I(1);
}
