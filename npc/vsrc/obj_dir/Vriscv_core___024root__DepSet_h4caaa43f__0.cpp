// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vriscv_core.h for the primary calling header

#include "verilated.h"

#include "Vriscv_core__Syms.h"
#include "Vriscv_core___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vriscv_core___024root___dump_triggers__act(Vriscv_core___024root* vlSelf);
#endif  // VL_DEBUG

void Vriscv_core___024root___eval_triggers__act(Vriscv_core___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vriscv_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vriscv_core___024root___eval_triggers__act\n"); );
    // Body
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vriscv_core___024root___dump_triggers__act(vlSelf);
    }
#endif
}
