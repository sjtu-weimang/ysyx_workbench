module npc (
  input clk,
  input rst
);
  // -------------------- PC --------------------
  reg [31:0] pc /*verilator public*/;
  always @(posedge clk) begin
    if (rst) pc <= 32'h8000_0000; // 复位值 0x80000000
    else pc <= pc + 4;            // 顺序执行
  end

  // -------------------- 指令存储器 --------------------
  wire [31:0] instr;
  reg [31:0] imem [0:255] /*verilator public*/;
  initial begin
    // 初始化指令（示例）
    imem[0] = 32'h02A00093; // addi x1, x0, 42
    imem[1] = 32'h06408093; // addi x2, x1, 100
    imem[2] = 32'h00500013; // addi x0, x0, 5 (验证 x0 不可写)
  end
  assign instr = imem[pc[31:2]]; // 按字寻址

  // -------------------- 译码逻辑 --------------------
  wire [4:0] rs1 = instr[19:15];
  wire [4:0] rd  = instr[11:7];
  wire [31:0] imm = {{20{instr[31]}}, instr[31:20]}; // 符号扩展

  // -------------------- 寄存器文件 --------------------
  reg [31:0] rf [31:0] /*verilator public*/; // 32 个寄存器
  wire [31:0] rs1_val = (rs1 == 0) ? 0 : rf[rs1]; // x0 恒为 0

  // 写回逻辑
  always @(posedge clk) begin
    if (!rst && rd != 0) begin // x0 不可写
      rf[rd] <= rs1_val + imm;
    end
  end
endmodule