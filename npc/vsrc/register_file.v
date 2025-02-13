module register_file (
    input         clk,
    input         rst_n,
    input  [3:0]  rs1_addr,    // 源寄存器1地址（4位，支持16个寄存器）
    input  [3:0]  rs2_addr,    // 源寄存器2地址
    input  [3:0]  rd_addr,     // 目的寄存器地址
    input  [31:0] rd_data,     // 写入数据
    input         reg_write,   // 写使能
    output [31:0] rs1_data,    // 源寄存器1数据
    output [31:0] rs2_data     // 源寄存器2数据
);
    reg [31:0] regs [0:15];    // 16个32位寄存器
    
    // 初始化x0为0（硬连线）
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) regs[0] <= 32'b0;
    end
    
    // 读操作（组合逻辑）
    assign rs1_data = (rs1_addr == 0) ? 32'b0 : regs[rs1_addr];
    assign rs2_data = (rs2_addr == 0) ? 32'b0 : regs[rs2_addr];
    
    // 写操作（时序逻辑）
    always @(posedge clk) begin
        if (reg_write && rd_addr != 0) begin
            regs[rd_addr] <= rd_data;
        end
    end
endmodule