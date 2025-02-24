// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vriscv_core.h for the primary calling header

#ifndef VERILATED_VRISCV_CORE___024ROOT_H_
#define VERILATED_VRISCV_CORE___024ROOT_H_  // guard

#include "verilated.h"

class Vriscv_core__Syms;

class Vriscv_core___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(rst,0,0);
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlTriggerVec<0> __VactTriggered;
    VlTriggerVec<0> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vriscv_core__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vriscv_core___024root(Vriscv_core__Syms* symsp, const char* v__name);
    ~Vriscv_core___024root();
    VL_UNCOPYABLE(Vriscv_core___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
