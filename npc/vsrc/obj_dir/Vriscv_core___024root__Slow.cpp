// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vriscv_core.h for the primary calling header

#include "verilated.h"

#include "Vriscv_core__Syms.h"
#include "Vriscv_core___024root.h"

void Vriscv_core___024root___ctor_var_reset(Vriscv_core___024root* vlSelf);

Vriscv_core___024root::Vriscv_core___024root(Vriscv_core__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vriscv_core___024root___ctor_var_reset(this);
}

void Vriscv_core___024root::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vriscv_core___024root::~Vriscv_core___024root() {
}
