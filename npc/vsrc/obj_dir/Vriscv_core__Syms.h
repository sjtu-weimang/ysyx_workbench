// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VRISCV_CORE__SYMS_H_
#define VERILATED_VRISCV_CORE__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vriscv_core.h"

// INCLUDE MODULE CLASSES
#include "Vriscv_core___024root.h"

// SYMS CLASS (contains all model state)
class Vriscv_core__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vriscv_core* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vriscv_core___024root          TOP;

    // CONSTRUCTORS
    Vriscv_core__Syms(VerilatedContext* contextp, const char* namep, Vriscv_core* modelp);
    ~Vriscv_core__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
