module Controller(
  input         clock,
  input         reset,
  input  [31:0] io_inst,
  output [2:0]  io_PC_sel,
  output        io_imem_en,
  output        io_reg_write_en,
  output [2:0]  io_imm_type,
  output [1:0]  io_A_sel,
  output [1:0]  io_B_sel,
  output [3:0]  io_WB_sel,
  output [5:0]  io_ALU_sel,
  output [7:0]  io_ebreak_en,
  output [7:0]  io_ebreak_code,
  output        io_dmem_read_en,
  output        io_dmem_write_en,
  output [7:0]  io_dmem_write_mask,
  output        io_csr_rs_en,
  output        io_csr_rw_en,
  output        io_ecall_en,
  output        io_mret_en
);
  reg [3:0] state; // @[Controller.scala 40:22]
  wire  _io_reg_write_en_T = state == 4'h3; // @[Controller.scala 45:28]
  wire [1:0] _state_T_3 = 4'h1 == state ? 2'h2 : {{1'd0}, 4'h0 == state}; // @[Mux.scala 81:58]
  wire [1:0] _state_T_5 = 4'h2 == state ? 2'h3 : _state_T_3; // @[Mux.scala 81:58]
  wire [1:0] _state_T_7 = 4'h3 == state ? 2'h1 : _state_T_5; // @[Mux.scala 81:58]
  wire [31:0] _signals_T = io_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _signals_T_1 = 32'h33 == _signals_T; // @[Lookup.scala 31:38]
  wire  _signals_T_3 = 32'h40000033 == _signals_T; // @[Lookup.scala 31:38]
  wire  _signals_T_5 = 32'h4033 == _signals_T; // @[Lookup.scala 31:38]
  wire  _signals_T_7 = 32'h6033 == _signals_T; // @[Lookup.scala 31:38]
  wire  _signals_T_9 = 32'h7033 == _signals_T; // @[Lookup.scala 31:38]
  wire  _signals_T_11 = 32'h1033 == _signals_T; // @[Lookup.scala 31:38]
  wire  _signals_T_13 = 32'h5033 == _signals_T; // @[Lookup.scala 31:38]
  wire  _signals_T_15 = 32'h40005033 == _signals_T; // @[Lookup.scala 31:38]
  wire  _signals_T_17 = 32'h2033 == _signals_T; // @[Lookup.scala 31:38]
  wire  _signals_T_19 = 32'h3033 == _signals_T; // @[Lookup.scala 31:38]
  wire [31:0] _signals_T_20 = io_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _signals_T_21 = 32'h13 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_23 = 32'h7013 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_25 = 32'h6013 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_27 = 32'h4013 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_29 = 32'h1013 == _signals_T; // @[Lookup.scala 31:38]
  wire  _signals_T_31 = 32'h5013 == _signals_T; // @[Lookup.scala 31:38]
  wire  _signals_T_33 = 32'h40005013 == _signals_T; // @[Lookup.scala 31:38]
  wire  _signals_T_35 = 32'h2013 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_37 = 32'h3013 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_39 = 32'h2003 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_41 = 32'h3 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_43 = 32'h4003 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_45 = 32'h1003 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_47 = 32'h5003 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_49 = 32'h2023 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_51 = 32'h1023 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_53 = 32'h23 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_55 = 32'h63 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_57 = 32'h1063 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_59 = 32'h4063 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_61 = 32'h5063 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_63 = 32'h6063 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_65 = 32'h7063 == _signals_T_20; // @[Lookup.scala 31:38]
  wire [31:0] _signals_T_66 = io_inst & 32'h7f; // @[Lookup.scala 31:38]
  wire  _signals_T_67 = 32'h6f == _signals_T_66; // @[Lookup.scala 31:38]
  wire  _signals_T_69 = 32'h67 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_71 = 32'h37 == _signals_T_66; // @[Lookup.scala 31:38]
  wire  _signals_T_73 = 32'h17 == _signals_T_66; // @[Lookup.scala 31:38]
  wire  _signals_T_75 = 32'h100073 == io_inst; // @[Lookup.scala 31:38]
  wire  _signals_T_77 = 32'h73 == io_inst; // @[Lookup.scala 31:38]
  wire  _signals_T_79 = 32'h30200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _signals_T_81 = 32'h1073 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_83 = 32'h2073 == _signals_T_20; // @[Lookup.scala 31:38]
  wire  _signals_T_85 = _signals_T_81 | _signals_T_83; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_86 = _signals_T_79 ? 3'h5 : {{2'd0}, _signals_T_85}; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_87 = _signals_T_77 ? 3'h4 : _signals_T_86; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_88 = _signals_T_75 ? 3'h0 : _signals_T_87; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_89 = _signals_T_73 ? 3'h1 : _signals_T_88; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_90 = _signals_T_71 ? 3'h1 : _signals_T_89; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_91 = _signals_T_69 ? 3'h2 : _signals_T_90; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_92 = _signals_T_67 ? 3'h2 : _signals_T_91; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_93 = _signals_T_65 ? 3'h3 : _signals_T_92; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_94 = _signals_T_63 ? 3'h3 : _signals_T_93; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_95 = _signals_T_61 ? 3'h3 : _signals_T_94; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_96 = _signals_T_59 ? 3'h3 : _signals_T_95; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_97 = _signals_T_57 ? 3'h3 : _signals_T_96; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_98 = _signals_T_55 ? 3'h3 : _signals_T_97; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_99 = _signals_T_53 ? 3'h1 : _signals_T_98; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_100 = _signals_T_51 ? 3'h1 : _signals_T_99; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_101 = _signals_T_49 ? 3'h1 : _signals_T_100; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_102 = _signals_T_47 ? 3'h1 : _signals_T_101; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_103 = _signals_T_45 ? 3'h1 : _signals_T_102; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_104 = _signals_T_43 ? 3'h1 : _signals_T_103; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_105 = _signals_T_41 ? 3'h1 : _signals_T_104; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_106 = _signals_T_39 ? 3'h1 : _signals_T_105; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_107 = _signals_T_37 ? 3'h1 : _signals_T_106; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_108 = _signals_T_35 ? 3'h1 : _signals_T_107; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_109 = _signals_T_33 ? 3'h1 : _signals_T_108; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_110 = _signals_T_31 ? 3'h1 : _signals_T_109; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_111 = _signals_T_29 ? 3'h1 : _signals_T_110; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_112 = _signals_T_27 ? 3'h1 : _signals_T_111; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_113 = _signals_T_25 ? 3'h1 : _signals_T_112; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_114 = _signals_T_23 ? 3'h1 : _signals_T_113; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_115 = _signals_T_21 ? 3'h1 : _signals_T_114; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_116 = _signals_T_19 ? 3'h1 : _signals_T_115; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_117 = _signals_T_17 ? 3'h1 : _signals_T_116; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_118 = _signals_T_15 ? 3'h1 : _signals_T_117; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_119 = _signals_T_13 ? 3'h1 : _signals_T_118; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_120 = _signals_T_11 ? 3'h1 : _signals_T_119; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_121 = _signals_T_9 ? 3'h1 : _signals_T_120; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_122 = _signals_T_7 ? 3'h1 : _signals_T_121; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_123 = _signals_T_5 ? 3'h1 : _signals_T_122; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_124 = _signals_T_3 ? 3'h1 : _signals_T_123; // @[Lookup.scala 34:39]
  wire [2:0] signals_0 = _signals_T_1 ? 3'h1 : _signals_T_124; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_130 = _signals_T_73 ? 2'h2 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_131 = _signals_T_71 ? 2'h0 : _signals_T_130; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_132 = _signals_T_69 ? 2'h1 : _signals_T_131; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_133 = _signals_T_67 ? 2'h2 : _signals_T_132; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_134 = _signals_T_65 ? 2'h1 : _signals_T_133; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_135 = _signals_T_63 ? 2'h1 : _signals_T_134; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_136 = _signals_T_61 ? 2'h1 : _signals_T_135; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_137 = _signals_T_59 ? 2'h1 : _signals_T_136; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_138 = _signals_T_57 ? 2'h1 : _signals_T_137; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_139 = _signals_T_55 ? 2'h1 : _signals_T_138; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_140 = _signals_T_53 ? 2'h1 : _signals_T_139; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_141 = _signals_T_51 ? 2'h1 : _signals_T_140; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_142 = _signals_T_49 ? 2'h1 : _signals_T_141; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_143 = _signals_T_47 ? 2'h1 : _signals_T_142; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_144 = _signals_T_45 ? 2'h1 : _signals_T_143; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_145 = _signals_T_43 ? 2'h1 : _signals_T_144; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_146 = _signals_T_41 ? 2'h1 : _signals_T_145; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_147 = _signals_T_39 ? 2'h1 : _signals_T_146; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_148 = _signals_T_37 ? 2'h1 : _signals_T_147; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_149 = _signals_T_35 ? 2'h1 : _signals_T_148; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_150 = _signals_T_33 ? 2'h1 : _signals_T_149; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_151 = _signals_T_31 ? 2'h1 : _signals_T_150; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_152 = _signals_T_29 ? 2'h1 : _signals_T_151; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_153 = _signals_T_27 ? 2'h1 : _signals_T_152; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_154 = _signals_T_25 ? 2'h1 : _signals_T_153; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_155 = _signals_T_23 ? 2'h1 : _signals_T_154; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_156 = _signals_T_21 ? 2'h1 : _signals_T_155; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_157 = _signals_T_19 ? 2'h1 : _signals_T_156; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_158 = _signals_T_17 ? 2'h1 : _signals_T_157; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_159 = _signals_T_15 ? 2'h1 : _signals_T_158; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_160 = _signals_T_13 ? 2'h1 : _signals_T_159; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_161 = _signals_T_11 ? 2'h1 : _signals_T_160; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_162 = _signals_T_9 ? 2'h1 : _signals_T_161; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_163 = _signals_T_7 ? 2'h1 : _signals_T_162; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_164 = _signals_T_5 ? 2'h1 : _signals_T_163; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_165 = _signals_T_3 ? 2'h1 : _signals_T_164; // @[Lookup.scala 34:39]
  wire  _signals_T_175 = _signals_T_65 ? 1'h0 : 1'h1; // @[Lookup.scala 34:39]
  wire  _signals_T_176 = _signals_T_63 ? 1'h0 : _signals_T_175; // @[Lookup.scala 34:39]
  wire  _signals_T_177 = _signals_T_61 ? 1'h0 : _signals_T_176; // @[Lookup.scala 34:39]
  wire  _signals_T_178 = _signals_T_59 ? 1'h0 : _signals_T_177; // @[Lookup.scala 34:39]
  wire  _signals_T_179 = _signals_T_57 ? 1'h0 : _signals_T_178; // @[Lookup.scala 34:39]
  wire  _signals_T_180 = _signals_T_55 ? 1'h0 : _signals_T_179; // @[Lookup.scala 34:39]
  wire  _signals_T_198 = _signals_T_19 ? 1'h0 : _signals_T_21 | (_signals_T_23 | (_signals_T_25 | (_signals_T_27 | (
    _signals_T_29 | (_signals_T_31 | (_signals_T_33 | (_signals_T_35 | (_signals_T_37 | (_signals_T_39 | (_signals_T_41
     | (_signals_T_43 | (_signals_T_45 | (_signals_T_47 | (_signals_T_49 | (_signals_T_51 | (_signals_T_53 |
    _signals_T_180)))))))))))))))); // @[Lookup.scala 34:39]
  wire  _signals_T_199 = _signals_T_17 ? 1'h0 : _signals_T_198; // @[Lookup.scala 34:39]
  wire  _signals_T_200 = _signals_T_15 ? 1'h0 : _signals_T_199; // @[Lookup.scala 34:39]
  wire  _signals_T_201 = _signals_T_13 ? 1'h0 : _signals_T_200; // @[Lookup.scala 34:39]
  wire  _signals_T_202 = _signals_T_11 ? 1'h0 : _signals_T_201; // @[Lookup.scala 34:39]
  wire  _signals_T_203 = _signals_T_9 ? 1'h0 : _signals_T_202; // @[Lookup.scala 34:39]
  wire  _signals_T_204 = _signals_T_7 ? 1'h0 : _signals_T_203; // @[Lookup.scala 34:39]
  wire  _signals_T_205 = _signals_T_5 ? 1'h0 : _signals_T_204; // @[Lookup.scala 34:39]
  wire  _signals_T_206 = _signals_T_3 ? 1'h0 : _signals_T_205; // @[Lookup.scala 34:39]
  wire  signals_2 = _signals_T_1 ? 1'h0 : _signals_T_206; // @[Lookup.scala 34:39]
  wire  _signals_T_211 = _signals_T_75 | (_signals_T_77 | (_signals_T_79 | (_signals_T_81 | _signals_T_83))); // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_212 = _signals_T_73 ? 3'h4 : {{2'd0}, _signals_T_211}; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_213 = _signals_T_71 ? 3'h4 : _signals_T_212; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_214 = _signals_T_69 ? 3'h1 : _signals_T_213; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_215 = _signals_T_67 ? 3'h5 : _signals_T_214; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_216 = _signals_T_65 ? 3'h3 : _signals_T_215; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_217 = _signals_T_63 ? 3'h3 : _signals_T_216; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_218 = _signals_T_61 ? 3'h3 : _signals_T_217; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_219 = _signals_T_59 ? 3'h3 : _signals_T_218; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_220 = _signals_T_57 ? 3'h3 : _signals_T_219; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_221 = _signals_T_55 ? 3'h3 : _signals_T_220; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_222 = _signals_T_53 ? 3'h2 : _signals_T_221; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_223 = _signals_T_51 ? 3'h2 : _signals_T_222; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_224 = _signals_T_49 ? 3'h2 : _signals_T_223; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_225 = _signals_T_47 ? 3'h1 : _signals_T_224; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_226 = _signals_T_45 ? 3'h1 : _signals_T_225; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_227 = _signals_T_43 ? 3'h1 : _signals_T_226; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_228 = _signals_T_41 ? 3'h1 : _signals_T_227; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_229 = _signals_T_39 ? 3'h1 : _signals_T_228; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_230 = _signals_T_37 ? 3'h1 : _signals_T_229; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_231 = _signals_T_35 ? 3'h1 : _signals_T_230; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_232 = _signals_T_33 ? 3'h1 : _signals_T_231; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_233 = _signals_T_31 ? 3'h1 : _signals_T_232; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_234 = _signals_T_29 ? 3'h1 : _signals_T_233; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_235 = _signals_T_27 ? 3'h1 : _signals_T_234; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_236 = _signals_T_25 ? 3'h1 : _signals_T_235; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_237 = _signals_T_23 ? 3'h1 : _signals_T_236; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_238 = _signals_T_21 ? 3'h1 : _signals_T_237; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_239 = _signals_T_19 ? 3'h6 : _signals_T_238; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_240 = _signals_T_17 ? 3'h6 : _signals_T_239; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_241 = _signals_T_15 ? 3'h6 : _signals_T_240; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_242 = _signals_T_13 ? 3'h6 : _signals_T_241; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_243 = _signals_T_11 ? 3'h6 : _signals_T_242; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_244 = _signals_T_9 ? 3'h6 : _signals_T_243; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_245 = _signals_T_7 ? 3'h6 : _signals_T_244; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_246 = _signals_T_5 ? 3'h6 : _signals_T_245; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_247 = _signals_T_3 ? 3'h6 : _signals_T_246; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_248 = _signals_T_83 ? 4'h8 : 4'h0; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_249 = _signals_T_81 ? 4'h8 : _signals_T_248; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_250 = _signals_T_79 ? 4'h0 : _signals_T_249; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_251 = _signals_T_77 ? 4'h0 : _signals_T_250; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_252 = _signals_T_75 ? 4'h0 : _signals_T_251; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_253 = _signals_T_73 ? 4'h1 : _signals_T_252; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_254 = _signals_T_71 ? 4'h1 : _signals_T_253; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_255 = _signals_T_69 ? 4'h2 : _signals_T_254; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_256 = _signals_T_67 ? 4'h2 : _signals_T_255; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_257 = _signals_T_65 ? 4'h0 : _signals_T_256; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_258 = _signals_T_63 ? 4'h0 : _signals_T_257; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_259 = _signals_T_61 ? 4'h0 : _signals_T_258; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_260 = _signals_T_59 ? 4'h0 : _signals_T_259; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_261 = _signals_T_57 ? 4'h0 : _signals_T_260; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_262 = _signals_T_55 ? 4'h0 : _signals_T_261; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_263 = _signals_T_53 ? 4'h0 : _signals_T_262; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_264 = _signals_T_51 ? 4'h0 : _signals_T_263; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_265 = _signals_T_49 ? 4'h0 : _signals_T_264; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_266 = _signals_T_47 ? 4'h5 : _signals_T_265; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_267 = _signals_T_45 ? 4'h7 : _signals_T_266; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_268 = _signals_T_43 ? 4'h4 : _signals_T_267; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_269 = _signals_T_41 ? 4'h6 : _signals_T_268; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_270 = _signals_T_39 ? 4'h3 : _signals_T_269; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_271 = _signals_T_37 ? 4'h1 : _signals_T_270; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_272 = _signals_T_35 ? 4'h1 : _signals_T_271; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_273 = _signals_T_33 ? 4'h1 : _signals_T_272; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_274 = _signals_T_31 ? 4'h1 : _signals_T_273; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_275 = _signals_T_29 ? 4'h1 : _signals_T_274; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_276 = _signals_T_27 ? 4'h1 : _signals_T_275; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_277 = _signals_T_25 ? 4'h1 : _signals_T_276; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_278 = _signals_T_23 ? 4'h1 : _signals_T_277; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_279 = _signals_T_21 ? 4'h1 : _signals_T_278; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_280 = _signals_T_19 ? 4'h1 : _signals_T_279; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_281 = _signals_T_17 ? 4'h1 : _signals_T_280; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_282 = _signals_T_15 ? 4'h1 : _signals_T_281; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_283 = _signals_T_13 ? 4'h1 : _signals_T_282; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_284 = _signals_T_11 ? 4'h1 : _signals_T_283; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_285 = _signals_T_9 ? 4'h1 : _signals_T_284; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_286 = _signals_T_7 ? 4'h1 : _signals_T_285; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_287 = _signals_T_5 ? 4'h1 : _signals_T_286; // @[Lookup.scala 34:39]
  wire [3:0] _signals_T_288 = _signals_T_3 ? 4'h1 : _signals_T_287; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_289 = _signals_T_83 ? 8'h0 : 8'hff; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_290 = _signals_T_81 ? 8'h0 : _signals_T_289; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_291 = _signals_T_79 ? 8'h0 : _signals_T_290; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_292 = _signals_T_77 ? 8'h0 : _signals_T_291; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_293 = _signals_T_75 ? 8'h1 : _signals_T_292; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_294 = _signals_T_73 ? 8'h0 : _signals_T_293; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_295 = _signals_T_71 ? 8'h0 : _signals_T_294; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_296 = _signals_T_69 ? 8'h0 : _signals_T_295; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_297 = _signals_T_67 ? 8'h0 : _signals_T_296; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_298 = _signals_T_65 ? 8'h0 : _signals_T_297; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_299 = _signals_T_63 ? 8'h0 : _signals_T_298; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_300 = _signals_T_61 ? 8'h0 : _signals_T_299; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_301 = _signals_T_59 ? 8'h0 : _signals_T_300; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_302 = _signals_T_57 ? 8'h0 : _signals_T_301; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_303 = _signals_T_55 ? 8'h0 : _signals_T_302; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_304 = _signals_T_53 ? 8'h0 : _signals_T_303; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_305 = _signals_T_51 ? 8'h0 : _signals_T_304; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_306 = _signals_T_49 ? 8'h0 : _signals_T_305; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_307 = _signals_T_47 ? 8'h0 : _signals_T_306; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_308 = _signals_T_45 ? 8'h0 : _signals_T_307; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_309 = _signals_T_43 ? 8'h0 : _signals_T_308; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_310 = _signals_T_41 ? 8'h0 : _signals_T_309; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_311 = _signals_T_39 ? 8'h0 : _signals_T_310; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_312 = _signals_T_37 ? 8'h0 : _signals_T_311; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_313 = _signals_T_35 ? 8'h0 : _signals_T_312; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_314 = _signals_T_33 ? 8'h0 : _signals_T_313; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_315 = _signals_T_31 ? 8'h0 : _signals_T_314; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_316 = _signals_T_29 ? 8'h0 : _signals_T_315; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_317 = _signals_T_27 ? 8'h0 : _signals_T_316; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_318 = _signals_T_25 ? 8'h0 : _signals_T_317; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_319 = _signals_T_23 ? 8'h0 : _signals_T_318; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_320 = _signals_T_21 ? 8'h0 : _signals_T_319; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_321 = _signals_T_19 ? 8'h0 : _signals_T_320; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_322 = _signals_T_17 ? 8'h0 : _signals_T_321; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_323 = _signals_T_15 ? 8'h0 : _signals_T_322; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_324 = _signals_T_13 ? 8'h0 : _signals_T_323; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_325 = _signals_T_11 ? 8'h0 : _signals_T_324; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_326 = _signals_T_9 ? 8'h0 : _signals_T_325; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_327 = _signals_T_7 ? 8'h0 : _signals_T_326; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_328 = _signals_T_5 ? 8'h0 : _signals_T_327; // @[Lookup.scala 34:39]
  wire [7:0] _signals_T_329 = _signals_T_3 ? 8'h0 : _signals_T_328; // @[Lookup.scala 34:39]
  wire [7:0] signals_5 = _signals_T_1 ? 8'h0 : _signals_T_329; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_348 = _signals_T_47 ? 3'h5 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_349 = _signals_T_45 ? 3'h2 : _signals_T_348; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_350 = _signals_T_43 ? 3'h4 : _signals_T_349; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_351 = _signals_T_41 ? 3'h1 : _signals_T_350; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_352 = _signals_T_39 ? 3'h3 : _signals_T_351; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_353 = _signals_T_37 ? 3'h0 : _signals_T_352; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_354 = _signals_T_35 ? 3'h0 : _signals_T_353; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_355 = _signals_T_33 ? 3'h0 : _signals_T_354; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_356 = _signals_T_31 ? 3'h0 : _signals_T_355; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_357 = _signals_T_29 ? 3'h0 : _signals_T_356; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_358 = _signals_T_27 ? 3'h0 : _signals_T_357; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_359 = _signals_T_25 ? 3'h0 : _signals_T_358; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_360 = _signals_T_23 ? 3'h0 : _signals_T_359; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_361 = _signals_T_21 ? 3'h0 : _signals_T_360; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_362 = _signals_T_19 ? 3'h0 : _signals_T_361; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_363 = _signals_T_17 ? 3'h0 : _signals_T_362; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_364 = _signals_T_15 ? 3'h0 : _signals_T_363; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_365 = _signals_T_13 ? 3'h0 : _signals_T_364; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_366 = _signals_T_11 ? 3'h0 : _signals_T_365; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_367 = _signals_T_9 ? 3'h0 : _signals_T_366; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_368 = _signals_T_7 ? 3'h0 : _signals_T_367; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_369 = _signals_T_5 ? 3'h0 : _signals_T_368; // @[Lookup.scala 34:39]
  wire [2:0] _signals_T_370 = _signals_T_3 ? 3'h0 : _signals_T_369; // @[Lookup.scala 34:39]
  wire [2:0] signals_6 = _signals_T_1 ? 3'h0 : _signals_T_370; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_387 = _signals_T_51 ? 2'h2 : {{1'd0}, _signals_T_53}; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_388 = _signals_T_49 ? 2'h3 : _signals_T_387; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_389 = _signals_T_47 ? 2'h0 : _signals_T_388; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_390 = _signals_T_45 ? 2'h0 : _signals_T_389; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_391 = _signals_T_43 ? 2'h0 : _signals_T_390; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_392 = _signals_T_41 ? 2'h0 : _signals_T_391; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_393 = _signals_T_39 ? 2'h0 : _signals_T_392; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_394 = _signals_T_37 ? 2'h0 : _signals_T_393; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_395 = _signals_T_35 ? 2'h0 : _signals_T_394; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_396 = _signals_T_33 ? 2'h0 : _signals_T_395; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_397 = _signals_T_31 ? 2'h0 : _signals_T_396; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_398 = _signals_T_29 ? 2'h0 : _signals_T_397; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_399 = _signals_T_27 ? 2'h0 : _signals_T_398; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_400 = _signals_T_25 ? 2'h0 : _signals_T_399; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_401 = _signals_T_23 ? 2'h0 : _signals_T_400; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_402 = _signals_T_21 ? 2'h0 : _signals_T_401; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_403 = _signals_T_19 ? 2'h0 : _signals_T_402; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_404 = _signals_T_17 ? 2'h0 : _signals_T_403; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_405 = _signals_T_15 ? 2'h0 : _signals_T_404; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_406 = _signals_T_13 ? 2'h0 : _signals_T_405; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_407 = _signals_T_11 ? 2'h0 : _signals_T_406; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_408 = _signals_T_9 ? 2'h0 : _signals_T_407; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_409 = _signals_T_7 ? 2'h0 : _signals_T_408; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_410 = _signals_T_5 ? 2'h0 : _signals_T_409; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_411 = _signals_T_3 ? 2'h0 : _signals_T_410; // @[Lookup.scala 34:39]
  wire [1:0] signals_7 = _signals_T_1 ? 2'h0 : _signals_T_411; // @[Lookup.scala 34:39]
  wire  _signals_T_420 = _signals_T_67 | (_signals_T_69 | (_signals_T_71 | _signals_T_73)); // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_421 = _signals_T_65 ? 2'h3 : {{1'd0}, _signals_T_420}; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_422 = _signals_T_63 ? 5'h10 : {{3'd0}, _signals_T_421}; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_423 = _signals_T_61 ? 5'h4 : _signals_T_422; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_424 = _signals_T_59 ? 5'hf : _signals_T_423; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_425 = _signals_T_57 ? 5'he : _signals_T_424; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_426 = _signals_T_55 ? 5'hd : _signals_T_425; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_427 = _signals_T_53 ? 5'h1 : _signals_T_426; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_428 = _signals_T_51 ? 5'h1 : _signals_T_427; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_429 = _signals_T_49 ? 5'h1 : _signals_T_428; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_430 = _signals_T_47 ? 5'h1 : _signals_T_429; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_431 = _signals_T_45 ? 5'h1 : _signals_T_430; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_432 = _signals_T_43 ? 5'h1 : _signals_T_431; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_433 = _signals_T_41 ? 5'h1 : _signals_T_432; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_434 = _signals_T_39 ? 5'h1 : _signals_T_433; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_435 = _signals_T_37 ? 5'h9 : _signals_T_434; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_436 = _signals_T_35 ? 5'h8 : _signals_T_435; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_437 = _signals_T_33 ? 5'h7 : _signals_T_436; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_438 = _signals_T_31 ? 5'h6 : _signals_T_437; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_439 = _signals_T_29 ? 5'h5 : _signals_T_438; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_440 = _signals_T_27 ? 5'hc : _signals_T_439; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_441 = _signals_T_25 ? 5'hb : _signals_T_440; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_442 = _signals_T_23 ? 5'ha : _signals_T_441; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_443 = _signals_T_21 ? 5'h1 : _signals_T_442; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_444 = _signals_T_19 ? 5'h9 : _signals_T_443; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_445 = _signals_T_17 ? 5'h8 : _signals_T_444; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_446 = _signals_T_15 ? 5'h7 : _signals_T_445; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_447 = _signals_T_13 ? 5'h6 : _signals_T_446; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_448 = _signals_T_11 ? 5'h5 : _signals_T_447; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_449 = _signals_T_9 ? 5'ha : _signals_T_448; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_450 = _signals_T_7 ? 5'hb : _signals_T_449; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_451 = _signals_T_5 ? 5'hc : _signals_T_450; // @[Lookup.scala 34:39]
  wire [4:0] _signals_T_452 = _signals_T_3 ? 5'h2 : _signals_T_451; // @[Lookup.scala 34:39]
  wire [4:0] signals_8 = _signals_T_1 ? 5'h1 : _signals_T_452; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_453 = _signals_T_83 ? 2'h2 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_454 = _signals_T_81 ? 2'h1 : _signals_T_453; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_455 = _signals_T_79 ? 2'h0 : _signals_T_454; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_456 = _signals_T_77 ? 2'h0 : _signals_T_455; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_457 = _signals_T_75 ? 2'h0 : _signals_T_456; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_458 = _signals_T_73 ? 2'h0 : _signals_T_457; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_459 = _signals_T_71 ? 2'h0 : _signals_T_458; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_460 = _signals_T_69 ? 2'h0 : _signals_T_459; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_461 = _signals_T_67 ? 2'h0 : _signals_T_460; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_462 = _signals_T_65 ? 2'h0 : _signals_T_461; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_463 = _signals_T_63 ? 2'h0 : _signals_T_462; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_464 = _signals_T_61 ? 2'h0 : _signals_T_463; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_465 = _signals_T_59 ? 2'h0 : _signals_T_464; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_466 = _signals_T_57 ? 2'h0 : _signals_T_465; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_467 = _signals_T_55 ? 2'h0 : _signals_T_466; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_468 = _signals_T_53 ? 2'h0 : _signals_T_467; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_469 = _signals_T_51 ? 2'h0 : _signals_T_468; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_470 = _signals_T_49 ? 2'h0 : _signals_T_469; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_471 = _signals_T_47 ? 2'h0 : _signals_T_470; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_472 = _signals_T_45 ? 2'h0 : _signals_T_471; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_473 = _signals_T_43 ? 2'h0 : _signals_T_472; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_474 = _signals_T_41 ? 2'h0 : _signals_T_473; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_475 = _signals_T_39 ? 2'h0 : _signals_T_474; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_476 = _signals_T_37 ? 2'h0 : _signals_T_475; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_477 = _signals_T_35 ? 2'h0 : _signals_T_476; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_478 = _signals_T_33 ? 2'h0 : _signals_T_477; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_479 = _signals_T_31 ? 2'h0 : _signals_T_478; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_480 = _signals_T_29 ? 2'h0 : _signals_T_479; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_481 = _signals_T_27 ? 2'h0 : _signals_T_480; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_482 = _signals_T_25 ? 2'h0 : _signals_T_481; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_483 = _signals_T_23 ? 2'h0 : _signals_T_482; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_484 = _signals_T_21 ? 2'h0 : _signals_T_483; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_485 = _signals_T_19 ? 2'h0 : _signals_T_484; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_486 = _signals_T_17 ? 2'h0 : _signals_T_485; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_487 = _signals_T_15 ? 2'h0 : _signals_T_486; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_488 = _signals_T_13 ? 2'h0 : _signals_T_487; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_489 = _signals_T_11 ? 2'h0 : _signals_T_488; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_490 = _signals_T_9 ? 2'h0 : _signals_T_489; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_491 = _signals_T_7 ? 2'h0 : _signals_T_490; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_492 = _signals_T_5 ? 2'h0 : _signals_T_491; // @[Lookup.scala 34:39]
  wire [1:0] _signals_T_493 = _signals_T_3 ? 2'h0 : _signals_T_492; // @[Lookup.scala 34:39]
  wire [1:0] signals_9 = _signals_T_1 ? 2'h0 : _signals_T_493; // @[Lookup.scala 34:39]
  wire  _io_ebreak_en_T = state == 4'h2; // @[Controller.scala 111:24]
  wire  _io_ebreak_en_T_2 = state == 4'h2 & signals_5 != 8'h0; // @[Controller.scala 111:41]
  wire [1:0] _io_dmem_write_mask_T_3 = 2'h2 == signals_7 ? 2'h3 : {{1'd0}, 2'h1 == signals_7}; // @[Mux.scala 81:58]
  wire [3:0] _io_dmem_write_mask_T_5 = 2'h3 == signals_7 ? 4'hf : {{2'd0}, _io_dmem_write_mask_T_3}; // @[Mux.scala 81:58]
  wire [1:0] _GEN_0 = reset ? 2'h0 : _state_T_7; // @[Controller.scala 40:{22,22} 46:9]
  assign io_PC_sel = state != 4'h3 ? 3'h0 : signals_0; // @[Controller.scala 106:19]
  assign io_imem_en = state == 4'h1; // @[Controller.scala 43:22]
  assign io_reg_write_en = state == 4'h3 & io_WB_sel != 4'h0; // @[Controller.scala 45:49]
  assign io_imm_type = _signals_T_1 ? 3'h6 : _signals_T_247; // @[Lookup.scala 34:39]
  assign io_A_sel = _signals_T_1 ? 2'h1 : _signals_T_165; // @[Lookup.scala 34:39]
  assign io_B_sel = {{1'd0}, signals_2}; // @[Controller.scala 108:12]
  assign io_WB_sel = _signals_T_1 ? 4'h1 : _signals_T_288; // @[Lookup.scala 34:39]
  assign io_ALU_sel = {{1'd0}, signals_8}; // @[Controller.scala 121:14]
  assign io_ebreak_en = {{7'd0}, _io_ebreak_en_T_2}; // @[Controller.scala 111:16]
  assign io_ebreak_code = _signals_T_1 ? 8'h0 : _signals_T_329; // @[Lookup.scala 34:39]
  assign io_dmem_read_en = _io_reg_write_en_T & signals_6 != 3'h0; // @[Controller.scala 113:47]
  assign io_dmem_write_en = _io_reg_write_en_T & signals_7 != 2'h0; // @[Controller.scala 115:48]
  assign io_dmem_write_mask = {{4'd0}, _io_dmem_write_mask_T_5}; // @[Controller.scala 116:22]
  assign io_csr_rs_en = _io_ebreak_en_T & signals_9 == 2'h2; // @[Controller.scala 123:41]
  assign io_csr_rw_en = _io_ebreak_en_T & signals_9 == 2'h1; // @[Controller.scala 124:41]
  assign io_ecall_en = _io_ebreak_en_T & signals_0 == 3'h4; // @[Controller.scala 125:40]
  assign io_mret_en = _io_ebreak_en_T & signals_0 == 3'h5; // @[Controller.scala 126:40]
  always @(posedge clock) begin
    state <= {{2'd0}, _GEN_0}; // @[Controller.scala 40:{22,22} 46:9]
  end
endmodule
module RegisterFile(
  input         clock,
  input         reset,
  input  [4:0]  io_write_address,
  input  [31:0] io_write_data,
  input         io_write_enable,
  input  [4:0]  io_reg1_addr,
  output [31:0] io_reg1_data,
  input  [4:0]  io_reg2_addr,
  output [31:0] io_reg2_data,
  input  [31:0] io_csr_addr,
  input  [31:0] io_csr_wdata,
  output [31:0] io_csr_rdata,
  input         io_csr_rw_enable,
  input         io_csr_rs_enable,
  input         io_csr_ecall_enable,
  input         io_csr_mret_enable,
  input  [31:0] io_pc,
  output [31:0] io_csr_ecall_ret,
  output [31:0] io_csr_mret_ret,
  output [31:0] io_test_reg_out_1,
  output [31:0] io_test_reg_out_2,
  output [31:0] io_test_reg_out_3,
  output [31:0] io_test_reg_out_4,
  output [31:0] io_test_reg_out_5,
  output [31:0] io_test_reg_out_6,
  output [31:0] io_test_reg_out_7,
  output [31:0] io_test_reg_out_8,
  output [31:0] io_test_reg_out_9,
  output [31:0] io_test_reg_out_10,
  output [31:0] io_test_reg_out_11,
  output [31:0] io_test_reg_out_12,
  output [31:0] io_test_reg_out_13,
  output [31:0] io_test_reg_out_14,
  output [31:0] io_test_reg_out_15,
  output [31:0] io_test_reg_out_16,
  output [31:0] io_test_reg_out_17,
  output [31:0] io_test_reg_out_18,
  output [31:0] io_test_reg_out_19,
  output [31:0] io_test_reg_out_20,
  output [31:0] io_test_reg_out_21,
  output [31:0] io_test_reg_out_22,
  output [31:0] io_test_reg_out_23,
  output [31:0] io_test_reg_out_24,
  output [31:0] io_test_reg_out_25,
  output [31:0] io_test_reg_out_26,
  output [31:0] io_test_reg_out_27,
  output [31:0] io_test_reg_out_28,
  output [31:0] io_test_reg_out_29,
  output [31:0] io_test_reg_out_30,
  output [31:0] io_test_reg_out_31
);
  reg [31:0] registers_1; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_2; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_3; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_4; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_5; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_6; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_7; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_8; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_9; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_10; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_11; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_12; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_13; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_14; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_15; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_16; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_17; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_18; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_19; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_20; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_21; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_22; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_23; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_24; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_25; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_26; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_27; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_28; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_29; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_30; // @[RegisterFile.scala 37:34]
  reg [31:0] registers_31; // @[RegisterFile.scala 37:34]
  reg [31:0] csr_0; // @[RegisterFile.scala 38:28]
  reg [31:0] csr_1; // @[RegisterFile.scala 38:28]
  reg [31:0] csr_2; // @[RegisterFile.scala 38:28]
  reg [31:0] csr_3; // @[RegisterFile.scala 38:28]
  reg [31:0] csr_4; // @[RegisterFile.scala 38:28]
  reg [31:0] csr_5; // @[RegisterFile.scala 38:28]
  wire [31:0] _GEN_1 = 5'h1 == io_write_address ? io_write_data : registers_1; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_2 = 5'h2 == io_write_address ? io_write_data : registers_2; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_3 = 5'h3 == io_write_address ? io_write_data : registers_3; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_4 = 5'h4 == io_write_address ? io_write_data : registers_4; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_5 = 5'h5 == io_write_address ? io_write_data : registers_5; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_6 = 5'h6 == io_write_address ? io_write_data : registers_6; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_7 = 5'h7 == io_write_address ? io_write_data : registers_7; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_8 = 5'h8 == io_write_address ? io_write_data : registers_8; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_9 = 5'h9 == io_write_address ? io_write_data : registers_9; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_10 = 5'ha == io_write_address ? io_write_data : registers_10; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_11 = 5'hb == io_write_address ? io_write_data : registers_11; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_12 = 5'hc == io_write_address ? io_write_data : registers_12; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_13 = 5'hd == io_write_address ? io_write_data : registers_13; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_14 = 5'he == io_write_address ? io_write_data : registers_14; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_15 = 5'hf == io_write_address ? io_write_data : registers_15; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_16 = 5'h10 == io_write_address ? io_write_data : registers_16; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_17 = 5'h11 == io_write_address ? io_write_data : registers_17; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_18 = 5'h12 == io_write_address ? io_write_data : registers_18; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_19 = 5'h13 == io_write_address ? io_write_data : registers_19; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_20 = 5'h14 == io_write_address ? io_write_data : registers_20; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_21 = 5'h15 == io_write_address ? io_write_data : registers_21; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_22 = 5'h16 == io_write_address ? io_write_data : registers_22; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_23 = 5'h17 == io_write_address ? io_write_data : registers_23; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_24 = 5'h18 == io_write_address ? io_write_data : registers_24; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_25 = 5'h19 == io_write_address ? io_write_data : registers_25; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_26 = 5'h1a == io_write_address ? io_write_data : registers_26; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_27 = 5'h1b == io_write_address ? io_write_data : registers_27; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_28 = 5'h1c == io_write_address ? io_write_data : registers_28; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_29 = 5'h1d == io_write_address ? io_write_data : registers_29; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_30 = 5'h1e == io_write_address ? io_write_data : registers_30; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_31 = 5'h1f == io_write_address ? io_write_data : registers_31; // @[RegisterFile.scala 44:{33,33} 37:34]
  wire [31:0] _GEN_33 = io_write_enable & io_write_address != 5'h0 ? _GEN_1 : registers_1; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_34 = io_write_enable & io_write_address != 5'h0 ? _GEN_2 : registers_2; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_35 = io_write_enable & io_write_address != 5'h0 ? _GEN_3 : registers_3; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_36 = io_write_enable & io_write_address != 5'h0 ? _GEN_4 : registers_4; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_37 = io_write_enable & io_write_address != 5'h0 ? _GEN_5 : registers_5; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_38 = io_write_enable & io_write_address != 5'h0 ? _GEN_6 : registers_6; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_39 = io_write_enable & io_write_address != 5'h0 ? _GEN_7 : registers_7; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_40 = io_write_enable & io_write_address != 5'h0 ? _GEN_8 : registers_8; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_41 = io_write_enable & io_write_address != 5'h0 ? _GEN_9 : registers_9; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_42 = io_write_enable & io_write_address != 5'h0 ? _GEN_10 : registers_10; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_43 = io_write_enable & io_write_address != 5'h0 ? _GEN_11 : registers_11; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_44 = io_write_enable & io_write_address != 5'h0 ? _GEN_12 : registers_12; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_45 = io_write_enable & io_write_address != 5'h0 ? _GEN_13 : registers_13; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_46 = io_write_enable & io_write_address != 5'h0 ? _GEN_14 : registers_14; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_47 = io_write_enable & io_write_address != 5'h0 ? _GEN_15 : registers_15; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_48 = io_write_enable & io_write_address != 5'h0 ? _GEN_16 : registers_16; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_49 = io_write_enable & io_write_address != 5'h0 ? _GEN_17 : registers_17; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_50 = io_write_enable & io_write_address != 5'h0 ? _GEN_18 : registers_18; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_51 = io_write_enable & io_write_address != 5'h0 ? _GEN_19 : registers_19; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_52 = io_write_enable & io_write_address != 5'h0 ? _GEN_20 : registers_20; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_53 = io_write_enable & io_write_address != 5'h0 ? _GEN_21 : registers_21; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_54 = io_write_enable & io_write_address != 5'h0 ? _GEN_22 : registers_22; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_55 = io_write_enable & io_write_address != 5'h0 ? _GEN_23 : registers_23; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_56 = io_write_enable & io_write_address != 5'h0 ? _GEN_24 : registers_24; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_57 = io_write_enable & io_write_address != 5'h0 ? _GEN_25 : registers_25; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_58 = io_write_enable & io_write_address != 5'h0 ? _GEN_26 : registers_26; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_59 = io_write_enable & io_write_address != 5'h0 ? _GEN_27 : registers_27; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_60 = io_write_enable & io_write_address != 5'h0 ? _GEN_28 : registers_28; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_61 = io_write_enable & io_write_address != 5'h0 ? _GEN_29 : registers_29; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_62 = io_write_enable & io_write_address != 5'h0 ? _GEN_30 : registers_30; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_63 = io_write_enable & io_write_address != 5'h0 ? _GEN_31 : registers_31; // @[RegisterFile.scala 37:34 43:50]
  wire [31:0] _GEN_65 = 5'h1 == io_reg1_addr ? registers_1 : 32'h0; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_66 = 5'h2 == io_reg1_addr ? registers_2 : _GEN_65; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_67 = 5'h3 == io_reg1_addr ? registers_3 : _GEN_66; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_68 = 5'h4 == io_reg1_addr ? registers_4 : _GEN_67; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_69 = 5'h5 == io_reg1_addr ? registers_5 : _GEN_68; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_70 = 5'h6 == io_reg1_addr ? registers_6 : _GEN_69; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_71 = 5'h7 == io_reg1_addr ? registers_7 : _GEN_70; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_72 = 5'h8 == io_reg1_addr ? registers_8 : _GEN_71; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_73 = 5'h9 == io_reg1_addr ? registers_9 : _GEN_72; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_74 = 5'ha == io_reg1_addr ? registers_10 : _GEN_73; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_75 = 5'hb == io_reg1_addr ? registers_11 : _GEN_74; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_76 = 5'hc == io_reg1_addr ? registers_12 : _GEN_75; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_77 = 5'hd == io_reg1_addr ? registers_13 : _GEN_76; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_78 = 5'he == io_reg1_addr ? registers_14 : _GEN_77; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_79 = 5'hf == io_reg1_addr ? registers_15 : _GEN_78; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_80 = 5'h10 == io_reg1_addr ? registers_16 : _GEN_79; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_81 = 5'h11 == io_reg1_addr ? registers_17 : _GEN_80; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_82 = 5'h12 == io_reg1_addr ? registers_18 : _GEN_81; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_83 = 5'h13 == io_reg1_addr ? registers_19 : _GEN_82; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_84 = 5'h14 == io_reg1_addr ? registers_20 : _GEN_83; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_85 = 5'h15 == io_reg1_addr ? registers_21 : _GEN_84; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_86 = 5'h16 == io_reg1_addr ? registers_22 : _GEN_85; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_87 = 5'h17 == io_reg1_addr ? registers_23 : _GEN_86; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_88 = 5'h18 == io_reg1_addr ? registers_24 : _GEN_87; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_89 = 5'h19 == io_reg1_addr ? registers_25 : _GEN_88; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_90 = 5'h1a == io_reg1_addr ? registers_26 : _GEN_89; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_91 = 5'h1b == io_reg1_addr ? registers_27 : _GEN_90; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_92 = 5'h1c == io_reg1_addr ? registers_28 : _GEN_91; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_93 = 5'h1d == io_reg1_addr ? registers_29 : _GEN_92; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_94 = 5'h1e == io_reg1_addr ? registers_30 : _GEN_93; // @[RegisterFile.scala 46:{16,16}]
  wire [31:0] _GEN_97 = 5'h1 == io_reg2_addr ? registers_1 : 32'h0; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_98 = 5'h2 == io_reg2_addr ? registers_2 : _GEN_97; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_99 = 5'h3 == io_reg2_addr ? registers_3 : _GEN_98; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_100 = 5'h4 == io_reg2_addr ? registers_4 : _GEN_99; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_101 = 5'h5 == io_reg2_addr ? registers_5 : _GEN_100; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_102 = 5'h6 == io_reg2_addr ? registers_6 : _GEN_101; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_103 = 5'h7 == io_reg2_addr ? registers_7 : _GEN_102; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_104 = 5'h8 == io_reg2_addr ? registers_8 : _GEN_103; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_105 = 5'h9 == io_reg2_addr ? registers_9 : _GEN_104; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_106 = 5'ha == io_reg2_addr ? registers_10 : _GEN_105; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_107 = 5'hb == io_reg2_addr ? registers_11 : _GEN_106; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_108 = 5'hc == io_reg2_addr ? registers_12 : _GEN_107; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_109 = 5'hd == io_reg2_addr ? registers_13 : _GEN_108; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_110 = 5'he == io_reg2_addr ? registers_14 : _GEN_109; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_111 = 5'hf == io_reg2_addr ? registers_15 : _GEN_110; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_112 = 5'h10 == io_reg2_addr ? registers_16 : _GEN_111; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_113 = 5'h11 == io_reg2_addr ? registers_17 : _GEN_112; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_114 = 5'h12 == io_reg2_addr ? registers_18 : _GEN_113; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_115 = 5'h13 == io_reg2_addr ? registers_19 : _GEN_114; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_116 = 5'h14 == io_reg2_addr ? registers_20 : _GEN_115; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_117 = 5'h15 == io_reg2_addr ? registers_21 : _GEN_116; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_118 = 5'h16 == io_reg2_addr ? registers_22 : _GEN_117; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_119 = 5'h17 == io_reg2_addr ? registers_23 : _GEN_118; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_120 = 5'h18 == io_reg2_addr ? registers_24 : _GEN_119; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_121 = 5'h19 == io_reg2_addr ? registers_25 : _GEN_120; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_122 = 5'h1a == io_reg2_addr ? registers_26 : _GEN_121; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_123 = 5'h1b == io_reg2_addr ? registers_27 : _GEN_122; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_124 = 5'h1c == io_reg2_addr ? registers_28 : _GEN_123; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_125 = 5'h1d == io_reg2_addr ? registers_29 : _GEN_124; // @[RegisterFile.scala 47:{16,16}]
  wire [31:0] _GEN_126 = 5'h1e == io_reg2_addr ? registers_30 : _GEN_125; // @[RegisterFile.scala 47:{16,16}]
  wire [2:0] _csr_id_T_2 = 12'h300 == io_csr_addr[11:0] ? 3'h0 : 3'h7; // @[Mux.scala 81:58]
  wire [2:0] _csr_id_T_4 = 12'h341 == io_csr_addr[11:0] ? 3'h1 : _csr_id_T_2; // @[Mux.scala 81:58]
  wire [2:0] _csr_id_T_6 = 12'h342 == io_csr_addr[11:0] ? 3'h2 : _csr_id_T_4; // @[Mux.scala 81:58]
  wire [2:0] _csr_id_T_8 = 12'h305 == io_csr_addr[11:0] ? 3'h3 : _csr_id_T_6; // @[Mux.scala 81:58]
  wire [2:0] _csr_id_T_10 = 12'hf11 == io_csr_addr[11:0] ? 3'h4 : _csr_id_T_8; // @[Mux.scala 81:58]
  wire [2:0] _csr_id_T_12 = 12'hf12 == io_csr_addr[11:0] ? 3'h5 : _csr_id_T_10; // @[Mux.scala 81:58]
  wire [4:0] csr_id = {{2'd0}, _csr_id_T_12}; // @[RegisterFile.scala 49:28 51:10]
  wire  csr_valid = csr_id != 5'h7; // @[RegisterFile.scala 59:24]
  wire [31:0] _GEN_167 = 3'h1 == csr_id[2:0] ? csr_1 : csr_0; // @[RegisterFile.scala 64:{33,33}]
  wire [31:0] _GEN_168 = 3'h2 == csr_id[2:0] ? csr_2 : _GEN_167; // @[RegisterFile.scala 64:{33,33}]
  wire [31:0] _GEN_169 = 3'h3 == csr_id[2:0] ? csr_3 : _GEN_168; // @[RegisterFile.scala 64:{33,33}]
  wire [31:0] _GEN_170 = 3'h4 == csr_id[2:0] ? csr_4 : _GEN_169; // @[RegisterFile.scala 64:{33,33}]
  wire [31:0] _GEN_171 = 3'h5 == csr_id[2:0] ? csr_5 : _GEN_170; // @[RegisterFile.scala 64:{33,33}]
  wire [31:0] _csr_T_1 = _GEN_171 | io_csr_wdata; // @[RegisterFile.scala 65:32]
  wire [31:0] _GEN_184 = io_csr_mret_enable ? 32'h80 : csr_0; // @[RegisterFile.scala 70:34 71:12 38:28]
  assign io_reg1_data = 5'h1f == io_reg1_addr ? registers_31 : _GEN_94; // @[RegisterFile.scala 46:{16,16}]
  assign io_reg2_data = 5'h1f == io_reg2_addr ? registers_31 : _GEN_126; // @[RegisterFile.scala 47:{16,16}]
  assign io_csr_rdata = 3'h5 == csr_id[2:0] ? csr_5 : _GEN_170; // @[RegisterFile.scala 76:{16,16}]
  assign io_csr_ecall_ret = csr_3; // @[RegisterFile.scala 74:19]
  assign io_csr_mret_ret = csr_1; // @[RegisterFile.scala 75:19]
  assign io_test_reg_out_1 = registers_1; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_2 = registers_2; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_3 = registers_3; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_4 = registers_4; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_5 = registers_5; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_6 = registers_6; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_7 = registers_7; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_8 = registers_8; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_9 = registers_9; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_10 = registers_10; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_11 = registers_11; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_12 = registers_12; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_13 = registers_13; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_14 = registers_14; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_15 = registers_15; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_16 = registers_16; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_17 = registers_17; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_18 = registers_18; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_19 = registers_19; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_20 = registers_20; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_21 = registers_21; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_22 = registers_22; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_23 = registers_23; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_24 = registers_24; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_25 = registers_25; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_26 = registers_26; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_27 = registers_27; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_28 = registers_28; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_29 = registers_29; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_30 = registers_30; // @[RegisterFile.scala 78:19]
  assign io_test_reg_out_31 = registers_31; // @[RegisterFile.scala 78:19]
  always @(posedge clock) begin
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_1 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_1 <= _GEN_33;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h1 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_1 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_1 <= _GEN_33;
      end
    end else begin
      registers_1 <= _GEN_33;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_2 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_2 <= _GEN_34;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h2 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_2 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_2 <= _GEN_34;
      end
    end else begin
      registers_2 <= _GEN_34;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_3 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_3 <= _GEN_35;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h3 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_3 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_3 <= _GEN_35;
      end
    end else begin
      registers_3 <= _GEN_35;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_4 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_4 <= _GEN_36;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h4 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_4 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_4 <= _GEN_36;
      end
    end else begin
      registers_4 <= _GEN_36;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_5 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_5 <= _GEN_37;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h5 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_5 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_5 <= _GEN_37;
      end
    end else begin
      registers_5 <= _GEN_37;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_6 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_6 <= _GEN_38;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h6 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_6 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_6 <= _GEN_38;
      end
    end else begin
      registers_6 <= _GEN_38;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_7 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_7 <= _GEN_39;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h7 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_7 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_7 <= _GEN_39;
      end
    end else begin
      registers_7 <= _GEN_39;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_8 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_8 <= _GEN_40;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h8 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_8 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_8 <= _GEN_40;
      end
    end else begin
      registers_8 <= _GEN_40;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_9 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_9 <= _GEN_41;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h9 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_9 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_9 <= _GEN_41;
      end
    end else begin
      registers_9 <= _GEN_41;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_10 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_10 <= _GEN_42;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'ha == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_10 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_10 <= _GEN_42;
      end
    end else begin
      registers_10 <= _GEN_42;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_11 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_11 <= _GEN_43;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'hb == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_11 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_11 <= _GEN_43;
      end
    end else begin
      registers_11 <= _GEN_43;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_12 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_12 <= _GEN_44;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'hc == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_12 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_12 <= _GEN_44;
      end
    end else begin
      registers_12 <= _GEN_44;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_13 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_13 <= _GEN_45;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'hd == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_13 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_13 <= _GEN_45;
      end
    end else begin
      registers_13 <= _GEN_45;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_14 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_14 <= _GEN_46;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'he == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_14 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_14 <= _GEN_46;
      end
    end else begin
      registers_14 <= _GEN_46;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_15 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_15 <= _GEN_47;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'hf == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_15 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_15 <= _GEN_47;
      end
    end else begin
      registers_15 <= _GEN_47;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_16 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_16 <= _GEN_48;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h10 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_16 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_16 <= _GEN_48;
      end
    end else begin
      registers_16 <= _GEN_48;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_17 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_17 <= _GEN_49;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h11 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_17 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_17 <= _GEN_49;
      end
    end else begin
      registers_17 <= _GEN_49;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_18 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_18 <= _GEN_50;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h12 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_18 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_18 <= _GEN_50;
      end
    end else begin
      registers_18 <= _GEN_50;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_19 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_19 <= _GEN_51;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h13 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_19 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_19 <= _GEN_51;
      end
    end else begin
      registers_19 <= _GEN_51;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_20 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_20 <= _GEN_52;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h14 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_20 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_20 <= _GEN_52;
      end
    end else begin
      registers_20 <= _GEN_52;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_21 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_21 <= _GEN_53;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h15 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_21 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_21 <= _GEN_53;
      end
    end else begin
      registers_21 <= _GEN_53;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_22 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_22 <= _GEN_54;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h16 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_22 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_22 <= _GEN_54;
      end
    end else begin
      registers_22 <= _GEN_54;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_23 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_23 <= _GEN_55;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h17 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_23 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_23 <= _GEN_55;
      end
    end else begin
      registers_23 <= _GEN_55;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_24 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_24 <= _GEN_56;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h18 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_24 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_24 <= _GEN_56;
      end
    end else begin
      registers_24 <= _GEN_56;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_25 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_25 <= _GEN_57;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h19 == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_25 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_25 <= _GEN_57;
      end
    end else begin
      registers_25 <= _GEN_57;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_26 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_26 <= _GEN_58;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h1a == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_26 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_26 <= _GEN_58;
      end
    end else begin
      registers_26 <= _GEN_58;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_27 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_27 <= _GEN_59;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h1b == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_27 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_27 <= _GEN_59;
      end
    end else begin
      registers_27 <= _GEN_59;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_28 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_28 <= _GEN_60;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h1c == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_28 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_28 <= _GEN_60;
      end
    end else begin
      registers_28 <= _GEN_60;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_29 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_29 <= _GEN_61;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h1d == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_29 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_29 <= _GEN_61;
      end
    end else begin
      registers_29 <= _GEN_61;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_30 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_30 <= _GEN_62;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h1e == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_30 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_30 <= _GEN_62;
      end
    end else begin
      registers_30 <= _GEN_62;
    end
    if (reset) begin // @[RegisterFile.scala 37:34]
      registers_31 <= 32'h0; // @[RegisterFile.scala 37:34]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      registers_31 <= _GEN_63;
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (5'h1f == io_write_address) begin // @[RegisterFile.scala 64:33]
        registers_31 <= _GEN_171; // @[RegisterFile.scala 64:33]
      end else begin
        registers_31 <= _GEN_63;
      end
    end else begin
      registers_31 <= _GEN_63;
    end
    if (reset) begin // @[RegisterFile.scala 38:28]
      csr_0 <= 32'h0; // @[RegisterFile.scala 38:28]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      if (3'h0 == csr_id[2:0]) begin // @[RegisterFile.scala 62:17]
        csr_0 <= io_csr_wdata; // @[RegisterFile.scala 62:17]
      end
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (3'h0 == csr_id[2:0]) begin // @[RegisterFile.scala 65:17]
        csr_0 <= _csr_T_1; // @[RegisterFile.scala 65:17]
      end
    end else if (io_csr_ecall_enable) begin // @[RegisterFile.scala 66:35]
      csr_0 <= 32'h1800; // @[RegisterFile.scala 69:12]
    end else begin
      csr_0 <= _GEN_184;
    end
    if (reset) begin // @[RegisterFile.scala 38:28]
      csr_1 <= 32'h0; // @[RegisterFile.scala 38:28]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      if (3'h1 == csr_id[2:0]) begin // @[RegisterFile.scala 62:17]
        csr_1 <= io_csr_wdata; // @[RegisterFile.scala 62:17]
      end
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (3'h1 == csr_id[2:0]) begin // @[RegisterFile.scala 65:17]
        csr_1 <= _csr_T_1; // @[RegisterFile.scala 65:17]
      end
    end else if (io_csr_ecall_enable) begin // @[RegisterFile.scala 66:35]
      csr_1 <= io_pc; // @[RegisterFile.scala 68:12]
    end
    if (reset) begin // @[RegisterFile.scala 38:28]
      csr_2 <= 32'h0; // @[RegisterFile.scala 38:28]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      if (3'h2 == csr_id[2:0]) begin // @[RegisterFile.scala 62:17]
        csr_2 <= io_csr_wdata; // @[RegisterFile.scala 62:17]
      end
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (3'h2 == csr_id[2:0]) begin // @[RegisterFile.scala 65:17]
        csr_2 <= _csr_T_1; // @[RegisterFile.scala 65:17]
      end
    end else if (io_csr_ecall_enable) begin // @[RegisterFile.scala 66:35]
      csr_2 <= 32'hb; // @[RegisterFile.scala 67:12]
    end
    if (reset) begin // @[RegisterFile.scala 38:28]
      csr_3 <= 32'h0; // @[RegisterFile.scala 38:28]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      if (3'h3 == csr_id[2:0]) begin // @[RegisterFile.scala 62:17]
        csr_3 <= io_csr_wdata; // @[RegisterFile.scala 62:17]
      end
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (3'h3 == csr_id[2:0]) begin // @[RegisterFile.scala 65:17]
        csr_3 <= _csr_T_1; // @[RegisterFile.scala 65:17]
      end
    end
    if (reset) begin // @[RegisterFile.scala 38:28]
      csr_4 <= 32'h0; // @[RegisterFile.scala 38:28]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      if (3'h4 == csr_id[2:0]) begin // @[RegisterFile.scala 62:17]
        csr_4 <= io_csr_wdata; // @[RegisterFile.scala 62:17]
      end else begin
        csr_4 <= 32'h79737978; // @[RegisterFile.scala 39:10]
      end
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (3'h4 == csr_id[2:0]) begin // @[RegisterFile.scala 65:17]
        csr_4 <= _csr_T_1; // @[RegisterFile.scala 65:17]
      end else begin
        csr_4 <= 32'h79737978; // @[RegisterFile.scala 39:10]
      end
    end else begin
      csr_4 <= 32'h79737978; // @[RegisterFile.scala 39:10]
    end
    if (reset) begin // @[RegisterFile.scala 38:28]
      csr_5 <= 32'h0; // @[RegisterFile.scala 38:28]
    end else if (io_csr_rw_enable & csr_valid) begin // @[RegisterFile.scala 60:38]
      if (3'h5 == csr_id[2:0]) begin // @[RegisterFile.scala 62:17]
        csr_5 <= io_csr_wdata; // @[RegisterFile.scala 62:17]
      end else begin
        csr_5 <= 32'h15fdf1f; // @[RegisterFile.scala 40:10]
      end
    end else if (io_csr_rs_enable & csr_valid) begin // @[RegisterFile.scala 63:44]
      if (3'h5 == csr_id[2:0]) begin // @[RegisterFile.scala 65:17]
        csr_5 <= _csr_T_1; // @[RegisterFile.scala 65:17]
      end else begin
        csr_5 <= 32'h15fdf1f; // @[RegisterFile.scala 40:10]
      end
    end else begin
      csr_5 <= 32'h15fdf1f; // @[RegisterFile.scala 40:10]
    end
  end
endmodule
module ALU(
  input  [31:0] io_src1,
  input  [31:0] io_src2,
  output [31:0] io_result,
  input  [5:0]  io_sel
);
  wire [31:0] _io_result_T_1 = io_src1 + io_src2; // @[ALU.scala 12:21]
  wire [31:0] _io_result_T_3 = io_src1 - io_src2; // @[ALU.scala 13:21]
  wire [31:0] _io_result_T_4 = io_src1 & io_src2; // @[ALU.scala 14:21]
  wire [31:0] _io_result_T_5 = io_src1 | io_src2; // @[ALU.scala 15:21]
  wire [31:0] _io_result_T_6 = io_src1 ^ io_src2; // @[ALU.scala 16:21]
  wire  _io_result_T_7 = io_src1 == io_src2; // @[ALU.scala 17:21]
  wire  _io_result_T_8 = io_src1 != io_src2; // @[ALU.scala 18:21]
  wire  _io_result_T_11 = $signed(io_src1) < $signed(io_src2); // @[ALU.scala 19:28]
  wire  _io_result_T_14 = $signed(io_src1) >= $signed(io_src2); // @[ALU.scala 20:28]
  wire  _io_result_T_15 = io_src1 < io_src2; // @[ALU.scala 21:21]
  wire  _io_result_T_16 = io_src1 >= io_src2; // @[ALU.scala 22:21]
  wire [62:0] _GEN_0 = {{31'd0}, io_src1}; // @[ALU.scala 23:21]
  wire [62:0] _io_result_T_18 = _GEN_0 << io_src2[4:0]; // @[ALU.scala 23:21]
  wire [31:0] _io_result_T_19 = io_src1 >> io_src2; // @[ALU.scala 24:21]
  wire [31:0] _io_result_T_23 = $signed(io_src1) >>> io_src2[4:0]; // @[ALU.scala 25:45]
  wire [31:0] _io_result_T_29 = 6'h1 == io_sel ? _io_result_T_1 : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _io_result_T_31 = 6'h2 == io_sel ? _io_result_T_3 : _io_result_T_29; // @[Mux.scala 81:58]
  wire [31:0] _io_result_T_33 = 6'ha == io_sel ? _io_result_T_4 : _io_result_T_31; // @[Mux.scala 81:58]
  wire [31:0] _io_result_T_35 = 6'hb == io_sel ? _io_result_T_5 : _io_result_T_33; // @[Mux.scala 81:58]
  wire [31:0] _io_result_T_37 = 6'hc == io_sel ? _io_result_T_6 : _io_result_T_35; // @[Mux.scala 81:58]
  wire [31:0] _io_result_T_39 = 6'hd == io_sel ? {{31'd0}, _io_result_T_7} : _io_result_T_37; // @[Mux.scala 81:58]
  wire [31:0] _io_result_T_41 = 6'he == io_sel ? {{31'd0}, _io_result_T_8} : _io_result_T_39; // @[Mux.scala 81:58]
  wire [31:0] _io_result_T_43 = 6'hf == io_sel ? {{31'd0}, _io_result_T_11} : _io_result_T_41; // @[Mux.scala 81:58]
  wire [31:0] _io_result_T_45 = 6'h4 == io_sel ? {{31'd0}, _io_result_T_14} : _io_result_T_43; // @[Mux.scala 81:58]
  wire [31:0] _io_result_T_47 = 6'h10 == io_sel ? {{31'd0}, _io_result_T_15} : _io_result_T_45; // @[Mux.scala 81:58]
  wire [31:0] _io_result_T_49 = 6'h3 == io_sel ? {{31'd0}, _io_result_T_16} : _io_result_T_47; // @[Mux.scala 81:58]
  wire [62:0] _io_result_T_51 = 6'h5 == io_sel ? _io_result_T_18 : {{31'd0}, _io_result_T_49}; // @[Mux.scala 81:58]
  wire [62:0] _io_result_T_53 = 6'h6 == io_sel ? {{31'd0}, _io_result_T_19} : _io_result_T_51; // @[Mux.scala 81:58]
  wire [62:0] _io_result_T_55 = 6'h7 == io_sel ? {{31'd0}, _io_result_T_23} : _io_result_T_53; // @[Mux.scala 81:58]
  wire [62:0] _io_result_T_57 = 6'h8 == io_sel ? {{62'd0}, _io_result_T_11} : _io_result_T_55; // @[Mux.scala 81:58]
  wire [62:0] _io_result_T_59 = 6'h9 == io_sel ? {{62'd0}, _io_result_T_15} : _io_result_T_57; // @[Mux.scala 81:58]
  assign io_result = _io_result_T_59[31:0]; // @[ALU.scala 11:13]
endmodule
module ImmediateGenerator(
  input  [31:0] io_inst,
  output [31:0] io_imm,
  input  [2:0]  io_imm_type
);
  wire [11:0] _io_imm_T_1 = io_inst[31:20]; // @[ImmediateGenerator.scala 11:34]
  wire [31:0] _io_imm_T_3 = {{20{_io_imm_T_1[11]}},_io_imm_T_1}; // @[ImmediateGenerator.scala 11:49]
  wire [19:0] _io_imm_T_6 = io_inst[31:12]; // @[ImmediateGenerator.scala 12:52]
  wire [31:0] _io_imm_T_7 = {_io_imm_T_6,12'h0}; // @[Cat.scala 33:92]
  wire [20:0] _io_imm_T_13 = {io_inst[31],io_inst[19:12],io_inst[20],io_inst[30:21],1'h0}; // @[ImmediateGenerator.scala 14:32]
  wire [31:0] _io_imm_T_15 = {{11{_io_imm_T_13[20]}},_io_imm_T_13}; // @[ImmediateGenerator.scala 14:47]
  wire [11:0] _io_imm_T_19 = {io_inst[31:25],io_inst[11:7]}; // @[ImmediateGenerator.scala 15:53]
  wire [31:0] _io_imm_T_21 = {{20{_io_imm_T_19[11]}},_io_imm_T_19}; // @[ImmediateGenerator.scala 15:68]
  wire [12:0] _io_imm_T_27 = {io_inst[31],io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[ImmediateGenerator.scala 17:32]
  wire [31:0] _io_imm_T_29 = {{19{_io_imm_T_27[12]}},_io_imm_T_27}; // @[ImmediateGenerator.scala 17:47]
  wire [31:0] _io_imm_T_31 = 3'h1 == io_imm_type ? _io_imm_T_3 : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _io_imm_T_33 = 3'h4 == io_imm_type ? _io_imm_T_7 : _io_imm_T_31; // @[Mux.scala 81:58]
  wire [31:0] _io_imm_T_35 = 3'h5 == io_imm_type ? _io_imm_T_15 : _io_imm_T_33; // @[Mux.scala 81:58]
  wire [31:0] _io_imm_T_37 = 3'h2 == io_imm_type ? _io_imm_T_21 : _io_imm_T_35; // @[Mux.scala 81:58]
  assign io_imm = 3'h3 == io_imm_type ? _io_imm_T_29 : _io_imm_T_37; // @[Mux.scala 81:58]
endmodule
module TopLevel(
  input         clock,
  input         reset,
  output [31:0] io_test_pc,
  output [31:0] io_test_regs_0,
  output [31:0] io_test_regs_1,
  output [31:0] io_test_regs_2,
  output [31:0] io_test_regs_3,
  output [31:0] io_test_regs_4,
  output [31:0] io_test_regs_5,
  output [31:0] io_test_regs_6,
  output [31:0] io_test_regs_7,
  output [31:0] io_test_regs_8,
  output [31:0] io_test_regs_9,
  output [31:0] io_test_regs_10,
  output [31:0] io_test_regs_11,
  output [31:0] io_test_regs_12,
  output [31:0] io_test_regs_13,
  output [31:0] io_test_regs_14,
  output [31:0] io_test_regs_15,
  output [31:0] io_test_regs_16,
  output [31:0] io_test_regs_17,
  output [31:0] io_test_regs_18,
  output [31:0] io_test_regs_19,
  output [31:0] io_test_regs_20,
  output [31:0] io_test_regs_21,
  output [31:0] io_test_regs_22,
  output [31:0] io_test_regs_23,
  output [31:0] io_test_regs_24,
  output [31:0] io_test_regs_25,
  output [31:0] io_test_regs_26,
  output [31:0] io_test_regs_27,
  output [31:0] io_test_regs_28,
  output [31:0] io_test_regs_29,
  output [31:0] io_test_regs_30,
  output [31:0] io_test_regs_31,
  output        io_test_imem_en
);
  wire  controller_clock; // @[TopLevel.scala 13:26]
  wire  controller_reset; // @[TopLevel.scala 13:26]
  wire [31:0] controller_io_inst; // @[TopLevel.scala 13:26]
  wire [2:0] controller_io_PC_sel; // @[TopLevel.scala 13:26]
  wire  controller_io_imem_en; // @[TopLevel.scala 13:26]
  wire  controller_io_reg_write_en; // @[TopLevel.scala 13:26]
  wire [2:0] controller_io_imm_type; // @[TopLevel.scala 13:26]
  wire [1:0] controller_io_A_sel; // @[TopLevel.scala 13:26]
  wire [1:0] controller_io_B_sel; // @[TopLevel.scala 13:26]
  wire [3:0] controller_io_WB_sel; // @[TopLevel.scala 13:26]
  wire [5:0] controller_io_ALU_sel; // @[TopLevel.scala 13:26]
  wire [7:0] controller_io_ebreak_en; // @[TopLevel.scala 13:26]
  wire [7:0] controller_io_ebreak_code; // @[TopLevel.scala 13:26]
  wire  controller_io_dmem_read_en; // @[TopLevel.scala 13:26]
  wire  controller_io_dmem_write_en; // @[TopLevel.scala 13:26]
  wire [7:0] controller_io_dmem_write_mask; // @[TopLevel.scala 13:26]
  wire  controller_io_csr_rs_en; // @[TopLevel.scala 13:26]
  wire  controller_io_csr_rw_en; // @[TopLevel.scala 13:26]
  wire  controller_io_ecall_en; // @[TopLevel.scala 13:26]
  wire  controller_io_mret_en; // @[TopLevel.scala 13:26]
  wire  imem_valid; // @[TopLevel.scala 15:20]
  wire [31:0] imem_raddr; // @[TopLevel.scala 15:20]
  wire [31:0] imem_rdata; // @[TopLevel.scala 15:20]
  wire [31:0] imem_waddr; // @[TopLevel.scala 15:20]
  wire [31:0] imem_wdata; // @[TopLevel.scala 15:20]
  wire [7:0] imem_wmask; // @[TopLevel.scala 15:20]
  wire  imem_wen; // @[TopLevel.scala 15:20]
  wire  dmem_valid; // @[TopLevel.scala 16:20]
  wire [31:0] dmem_raddr; // @[TopLevel.scala 16:20]
  wire [31:0] dmem_rdata; // @[TopLevel.scala 16:20]
  wire [31:0] dmem_waddr; // @[TopLevel.scala 16:20]
  wire [31:0] dmem_wdata; // @[TopLevel.scala 16:20]
  wire [7:0] dmem_wmask; // @[TopLevel.scala 16:20]
  wire  dmem_wen; // @[TopLevel.scala 16:20]
  wire  register_file_clock; // @[TopLevel.scala 17:29]
  wire  register_file_reset; // @[TopLevel.scala 17:29]
  wire [4:0] register_file_io_write_address; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_write_data; // @[TopLevel.scala 17:29]
  wire  register_file_io_write_enable; // @[TopLevel.scala 17:29]
  wire [4:0] register_file_io_reg1_addr; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_reg1_data; // @[TopLevel.scala 17:29]
  wire [4:0] register_file_io_reg2_addr; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_reg2_data; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_csr_addr; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_csr_wdata; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_csr_rdata; // @[TopLevel.scala 17:29]
  wire  register_file_io_csr_rw_enable; // @[TopLevel.scala 17:29]
  wire  register_file_io_csr_rs_enable; // @[TopLevel.scala 17:29]
  wire  register_file_io_csr_ecall_enable; // @[TopLevel.scala 17:29]
  wire  register_file_io_csr_mret_enable; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_pc; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_csr_ecall_ret; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_csr_mret_ret; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_1; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_2; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_3; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_4; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_5; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_6; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_7; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_8; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_9; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_10; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_11; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_12; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_13; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_14; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_15; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_16; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_17; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_18; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_19; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_20; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_21; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_22; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_23; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_24; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_25; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_26; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_27; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_28; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_29; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_30; // @[TopLevel.scala 17:29]
  wire [31:0] register_file_io_test_reg_out_31; // @[TopLevel.scala 17:29]
  wire [31:0] alu_io_src1; // @[TopLevel.scala 18:19]
  wire [31:0] alu_io_src2; // @[TopLevel.scala 18:19]
  wire [31:0] alu_io_result; // @[TopLevel.scala 18:19]
  wire [5:0] alu_io_sel; // @[TopLevel.scala 18:19]
  wire  ebreak_inst_enable; // @[TopLevel.scala 20:27]
  wire [7:0] ebreak_inst_code; // @[TopLevel.scala 20:27]
  wire [31:0] ebreak_inst_pc; // @[TopLevel.scala 20:27]
  wire [31:0] imm_gen_io_inst; // @[TopLevel.scala 21:23]
  wire [31:0] imm_gen_io_imm; // @[TopLevel.scala 21:23]
  wire [2:0] imm_gen_io_imm_type; // @[TopLevel.scala 21:23]
  reg [31:0] PC; // @[TopLevel.scala 10:19]
  reg [31:0] inst; // @[TopLevel.scala 19:21]
  wire [31:0] _PC_T_1 = PC + 32'h4; // @[TopLevel.scala 32:24]
  wire [31:0] _PC_T_4 = PC + imm_gen_io_imm; // @[TopLevel.scala 34:48]
  wire [31:0] _PC_T_7 = alu_io_result[0] ? _PC_T_4 : _PC_T_1; // @[TopLevel.scala 34:25]
  wire [31:0] _PC_T_11 = 3'h1 == controller_io_PC_sel ? _PC_T_1 : PC; // @[Mux.scala 81:58]
  wire [31:0] _PC_T_13 = 3'h2 == controller_io_PC_sel ? alu_io_result : _PC_T_11; // @[Mux.scala 81:58]
  wire [31:0] _alu_io_src1_T_1 = 2'h1 == controller_io_A_sel ? register_file_io_reg1_data : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _alu_io_src2_T_1 = 2'h0 == controller_io_B_sel ? register_file_io_reg2_data : 32'h0; // @[Mux.scala 81:58]
  wire [7:0] _register_file_io_write_data_T_5 = dmem_rdata[7:0]; // @[TopLevel.scala 76:38]
  wire [31:0] _register_file_io_write_data_T_7 = {{24{_register_file_io_write_data_T_5[7]}},
    _register_file_io_write_data_T_5}; // @[TopLevel.scala 76:53]
  wire [15:0] _register_file_io_write_data_T_9 = dmem_rdata[15:0]; // @[TopLevel.scala 77:39]
  wire [31:0] _register_file_io_write_data_T_11 = {{16{_register_file_io_write_data_T_9[15]}},
    _register_file_io_write_data_T_9}; // @[TopLevel.scala 77:54]
  wire [31:0] _register_file_io_write_data_T_13 = 4'h1 == controller_io_WB_sel ? alu_io_result : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _register_file_io_write_data_T_15 = 4'h2 == controller_io_WB_sel ? _PC_T_1 :
    _register_file_io_write_data_T_13; // @[Mux.scala 81:58]
  wire [31:0] _register_file_io_write_data_T_17 = 4'h3 == controller_io_WB_sel ? dmem_rdata :
    _register_file_io_write_data_T_15; // @[Mux.scala 81:58]
  wire [31:0] _register_file_io_write_data_T_19 = 4'h4 == controller_io_WB_sel ? {{24'd0}, dmem_rdata[7:0]} :
    _register_file_io_write_data_T_17; // @[Mux.scala 81:58]
  wire [31:0] _register_file_io_write_data_T_21 = 4'h5 == controller_io_WB_sel ? {{16'd0}, dmem_rdata[15:0]} :
    _register_file_io_write_data_T_19; // @[Mux.scala 81:58]
  wire [31:0] _register_file_io_write_data_T_23 = 4'h6 == controller_io_WB_sel ? _register_file_io_write_data_T_7 :
    _register_file_io_write_data_T_21; // @[Mux.scala 81:58]
  wire [31:0] _register_file_io_write_data_T_25 = 4'h7 == controller_io_WB_sel ? _register_file_io_write_data_T_11 :
    _register_file_io_write_data_T_23; // @[Mux.scala 81:58]
  wire  _T = PC == 32'h8000031c; // @[TopLevel.scala 80:10]
  reg [31:0] dmem_write_data; // @[TopLevel.scala 112:32]
  Controller controller ( // @[TopLevel.scala 13:26]
    .clock(controller_clock),
    .reset(controller_reset),
    .io_inst(controller_io_inst),
    .io_PC_sel(controller_io_PC_sel),
    .io_imem_en(controller_io_imem_en),
    .io_reg_write_en(controller_io_reg_write_en),
    .io_imm_type(controller_io_imm_type),
    .io_A_sel(controller_io_A_sel),
    .io_B_sel(controller_io_B_sel),
    .io_WB_sel(controller_io_WB_sel),
    .io_ALU_sel(controller_io_ALU_sel),
    .io_ebreak_en(controller_io_ebreak_en),
    .io_ebreak_code(controller_io_ebreak_code),
    .io_dmem_read_en(controller_io_dmem_read_en),
    .io_dmem_write_en(controller_io_dmem_write_en),
    .io_dmem_write_mask(controller_io_dmem_write_mask),
    .io_csr_rs_en(controller_io_csr_rs_en),
    .io_csr_rw_en(controller_io_csr_rw_en),
    .io_ecall_en(controller_io_ecall_en),
    .io_mret_en(controller_io_mret_en)
  );
  PMem imem ( // @[TopLevel.scala 15:20]
    .valid(imem_valid),
    .raddr(imem_raddr),
    .rdata(imem_rdata),
    .waddr(imem_waddr),
    .wdata(imem_wdata),
    .wmask(imem_wmask),
    .wen(imem_wen)
  );
  PMem dmem ( // @[TopLevel.scala 16:20]
    .valid(dmem_valid),
    .raddr(dmem_raddr),
    .rdata(dmem_rdata),
    .waddr(dmem_waddr),
    .wdata(dmem_wdata),
    .wmask(dmem_wmask),
    .wen(dmem_wen)
  );
  RegisterFile register_file ( // @[TopLevel.scala 17:29]
    .clock(register_file_clock),
    .reset(register_file_reset),
    .io_write_address(register_file_io_write_address),
    .io_write_data(register_file_io_write_data),
    .io_write_enable(register_file_io_write_enable),
    .io_reg1_addr(register_file_io_reg1_addr),
    .io_reg1_data(register_file_io_reg1_data),
    .io_reg2_addr(register_file_io_reg2_addr),
    .io_reg2_data(register_file_io_reg2_data),
    .io_csr_addr(register_file_io_csr_addr),
    .io_csr_wdata(register_file_io_csr_wdata),
    .io_csr_rdata(register_file_io_csr_rdata),
    .io_csr_rw_enable(register_file_io_csr_rw_enable),
    .io_csr_rs_enable(register_file_io_csr_rs_enable),
    .io_csr_ecall_enable(register_file_io_csr_ecall_enable),
    .io_csr_mret_enable(register_file_io_csr_mret_enable),
    .io_pc(register_file_io_pc),
    .io_csr_ecall_ret(register_file_io_csr_ecall_ret),
    .io_csr_mret_ret(register_file_io_csr_mret_ret),
    .io_test_reg_out_1(register_file_io_test_reg_out_1),
    .io_test_reg_out_2(register_file_io_test_reg_out_2),
    .io_test_reg_out_3(register_file_io_test_reg_out_3),
    .io_test_reg_out_4(register_file_io_test_reg_out_4),
    .io_test_reg_out_5(register_file_io_test_reg_out_5),
    .io_test_reg_out_6(register_file_io_test_reg_out_6),
    .io_test_reg_out_7(register_file_io_test_reg_out_7),
    .io_test_reg_out_8(register_file_io_test_reg_out_8),
    .io_test_reg_out_9(register_file_io_test_reg_out_9),
    .io_test_reg_out_10(register_file_io_test_reg_out_10),
    .io_test_reg_out_11(register_file_io_test_reg_out_11),
    .io_test_reg_out_12(register_file_io_test_reg_out_12),
    .io_test_reg_out_13(register_file_io_test_reg_out_13),
    .io_test_reg_out_14(register_file_io_test_reg_out_14),
    .io_test_reg_out_15(register_file_io_test_reg_out_15),
    .io_test_reg_out_16(register_file_io_test_reg_out_16),
    .io_test_reg_out_17(register_file_io_test_reg_out_17),
    .io_test_reg_out_18(register_file_io_test_reg_out_18),
    .io_test_reg_out_19(register_file_io_test_reg_out_19),
    .io_test_reg_out_20(register_file_io_test_reg_out_20),
    .io_test_reg_out_21(register_file_io_test_reg_out_21),
    .io_test_reg_out_22(register_file_io_test_reg_out_22),
    .io_test_reg_out_23(register_file_io_test_reg_out_23),
    .io_test_reg_out_24(register_file_io_test_reg_out_24),
    .io_test_reg_out_25(register_file_io_test_reg_out_25),
    .io_test_reg_out_26(register_file_io_test_reg_out_26),
    .io_test_reg_out_27(register_file_io_test_reg_out_27),
    .io_test_reg_out_28(register_file_io_test_reg_out_28),
    .io_test_reg_out_29(register_file_io_test_reg_out_29),
    .io_test_reg_out_30(register_file_io_test_reg_out_30),
    .io_test_reg_out_31(register_file_io_test_reg_out_31)
  );
  ALU alu ( // @[TopLevel.scala 18:19]
    .io_src1(alu_io_src1),
    .io_src2(alu_io_src2),
    .io_result(alu_io_result),
    .io_sel(alu_io_sel)
  );
  EBreak ebreak_inst ( // @[TopLevel.scala 20:27]
    .enable(ebreak_inst_enable),
    .code(ebreak_inst_code),
    .pc(ebreak_inst_pc)
  );
  ImmediateGenerator imm_gen ( // @[TopLevel.scala 21:23]
    .io_inst(imm_gen_io_inst),
    .io_imm(imm_gen_io_imm),
    .io_imm_type(imm_gen_io_imm_type)
  );
  assign io_test_pc = PC; // @[TopLevel.scala 11:14]
  assign io_test_regs_0 = 32'h0; // @[TopLevel.scala 102:16]
  assign io_test_regs_1 = register_file_io_test_reg_out_1; // @[TopLevel.scala 102:16]
  assign io_test_regs_2 = register_file_io_test_reg_out_2; // @[TopLevel.scala 102:16]
  assign io_test_regs_3 = register_file_io_test_reg_out_3; // @[TopLevel.scala 102:16]
  assign io_test_regs_4 = register_file_io_test_reg_out_4; // @[TopLevel.scala 102:16]
  assign io_test_regs_5 = register_file_io_test_reg_out_5; // @[TopLevel.scala 102:16]
  assign io_test_regs_6 = register_file_io_test_reg_out_6; // @[TopLevel.scala 102:16]
  assign io_test_regs_7 = register_file_io_test_reg_out_7; // @[TopLevel.scala 102:16]
  assign io_test_regs_8 = register_file_io_test_reg_out_8; // @[TopLevel.scala 102:16]
  assign io_test_regs_9 = register_file_io_test_reg_out_9; // @[TopLevel.scala 102:16]
  assign io_test_regs_10 = register_file_io_test_reg_out_10; // @[TopLevel.scala 102:16]
  assign io_test_regs_11 = register_file_io_test_reg_out_11; // @[TopLevel.scala 102:16]
  assign io_test_regs_12 = register_file_io_test_reg_out_12; // @[TopLevel.scala 102:16]
  assign io_test_regs_13 = register_file_io_test_reg_out_13; // @[TopLevel.scala 102:16]
  assign io_test_regs_14 = register_file_io_test_reg_out_14; // @[TopLevel.scala 102:16]
  assign io_test_regs_15 = register_file_io_test_reg_out_15; // @[TopLevel.scala 102:16]
  assign io_test_regs_16 = register_file_io_test_reg_out_16; // @[TopLevel.scala 102:16]
  assign io_test_regs_17 = register_file_io_test_reg_out_17; // @[TopLevel.scala 102:16]
  assign io_test_regs_18 = register_file_io_test_reg_out_18; // @[TopLevel.scala 102:16]
  assign io_test_regs_19 = register_file_io_test_reg_out_19; // @[TopLevel.scala 102:16]
  assign io_test_regs_20 = register_file_io_test_reg_out_20; // @[TopLevel.scala 102:16]
  assign io_test_regs_21 = register_file_io_test_reg_out_21; // @[TopLevel.scala 102:16]
  assign io_test_regs_22 = register_file_io_test_reg_out_22; // @[TopLevel.scala 102:16]
  assign io_test_regs_23 = register_file_io_test_reg_out_23; // @[TopLevel.scala 102:16]
  assign io_test_regs_24 = register_file_io_test_reg_out_24; // @[TopLevel.scala 102:16]
  assign io_test_regs_25 = register_file_io_test_reg_out_25; // @[TopLevel.scala 102:16]
  assign io_test_regs_26 = register_file_io_test_reg_out_26; // @[TopLevel.scala 102:16]
  assign io_test_regs_27 = register_file_io_test_reg_out_27; // @[TopLevel.scala 102:16]
  assign io_test_regs_28 = register_file_io_test_reg_out_28; // @[TopLevel.scala 102:16]
  assign io_test_regs_29 = register_file_io_test_reg_out_29; // @[TopLevel.scala 102:16]
  assign io_test_regs_30 = register_file_io_test_reg_out_30; // @[TopLevel.scala 102:16]
  assign io_test_regs_31 = register_file_io_test_reg_out_31; // @[TopLevel.scala 102:16]
  assign io_test_imem_en = controller_io_imem_en; // @[TopLevel.scala 110:19]
  assign controller_clock = clock;
  assign controller_reset = reset;
  assign controller_io_inst = inst; // @[TopLevel.scala 60:22]
  assign imem_valid = controller_io_imem_en; // @[TopLevel.scala 104:17]
  assign imem_raddr = PC; // @[TopLevel.scala 105:17]
  assign imem_waddr = 32'h0; // @[TopLevel.scala 106:16]
  assign imem_wdata = 32'h0; // @[TopLevel.scala 107:16]
  assign imem_wmask = 8'h0; // @[TopLevel.scala 108:16]
  assign imem_wen = 1'h0; // @[TopLevel.scala 109:15]
  assign dmem_valid = controller_io_dmem_read_en | controller_io_dmem_write_en; // @[TopLevel.scala 114:47]
  assign dmem_raddr = alu_io_result; // @[TopLevel.scala 115:17]
  assign dmem_waddr = alu_io_result; // @[TopLevel.scala 117:17]
  assign dmem_wdata = dmem_write_data; // @[TopLevel.scala 118:17]
  assign dmem_wmask = controller_io_dmem_write_mask; // @[TopLevel.scala 119:17]
  assign dmem_wen = controller_io_dmem_write_en; // @[TopLevel.scala 116:15]
  assign register_file_clock = clock;
  assign register_file_reset = reset;
  assign register_file_io_write_address = inst[11:7]; // @[TopLevel.scala 86:41]
  assign register_file_io_write_data = 4'h8 == controller_io_WB_sel ? register_file_io_csr_rdata :
    _register_file_io_write_data_T_25; // @[Mux.scala 81:58]
  assign register_file_io_write_enable = controller_io_reg_write_en; // @[TopLevel.scala 87:33]
  assign register_file_io_reg1_addr = inst[19:15]; // @[TopLevel.scala 88:37]
  assign register_file_io_reg2_addr = inst[24:20]; // @[TopLevel.scala 89:37]
  assign register_file_io_csr_addr = imm_gen_io_imm; // @[TopLevel.scala 95:29]
  assign register_file_io_csr_wdata = register_file_io_reg1_data; // @[TopLevel.scala 98:30]
  assign register_file_io_csr_rw_enable = controller_io_csr_rw_en; // @[TopLevel.scala 92:34]
  assign register_file_io_csr_rs_enable = controller_io_csr_rs_en; // @[TopLevel.scala 93:34]
  assign register_file_io_csr_ecall_enable = controller_io_ecall_en; // @[TopLevel.scala 96:36]
  assign register_file_io_csr_mret_enable = controller_io_mret_en; // @[TopLevel.scala 97:35]
  assign register_file_io_pc = PC; // @[TopLevel.scala 90:22]
  assign alu_io_src1 = 2'h2 == controller_io_A_sel ? PC : _alu_io_src1_T_1; // @[Mux.scala 81:58]
  assign alu_io_src2 = 2'h1 == controller_io_B_sel ? imm_gen_io_imm : _alu_io_src2_T_1; // @[Mux.scala 81:58]
  assign alu_io_sel = controller_io_ALU_sel; // @[TopLevel.scala 69:14]
  assign ebreak_inst_enable = controller_io_ebreak_en[0]; // @[TopLevel.scala 23:25]
  assign ebreak_inst_code = controller_io_ebreak_code; // @[TopLevel.scala 24:25]
  assign ebreak_inst_pc = PC; // @[TopLevel.scala 100:21]
  assign imm_gen_io_inst = inst; // @[TopLevel.scala 83:19]
  assign imm_gen_io_imm_type = controller_io_imm_type; // @[TopLevel.scala 84:23]
  always @(posedge clock) begin
    if (reset) begin // @[TopLevel.scala 10:19]
      PC <= 32'h80000000; // @[TopLevel.scala 10:19]
    end else if (3'h5 == controller_io_PC_sel) begin // @[Mux.scala 81:58]
      PC <= register_file_io_csr_mret_ret;
    end else if (3'h4 == controller_io_PC_sel) begin // @[Mux.scala 81:58]
      PC <= register_file_io_csr_ecall_ret;
    end else if (3'h3 == controller_io_PC_sel) begin // @[Mux.scala 81:58]
      PC <= _PC_T_7;
    end else begin
      PC <= _PC_T_13;
    end
    if (reset) begin // @[TopLevel.scala 19:21]
      inst <= 32'h0; // @[TopLevel.scala 19:21]
    end else if (controller_io_imem_en) begin // @[TopLevel.scala 59:14]
      inst <= imem_rdata;
    end
    if (reset) begin // @[TopLevel.scala 112:32]
      dmem_write_data <= 32'h0; // @[TopLevel.scala 112:32]
    end else begin
      dmem_write_data <= register_file_io_reg2_data; // @[TopLevel.scala 113:19]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & ~reset) begin
          $fwrite(32'h80000002,"csr rdata is: %x\n",register_file_io_csr_rdata); // @[TopLevel.scala 81:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
