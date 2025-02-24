module riscv_core(
    input clk,
    input rst
);
    // 信号声明
    wire [31:0] pc;
    wire [31:0] instruction;
    wire [4:0]  rs1, rs2, rd;
    wire [31:0] imm;
    wire [31:0] reg_data1, reg_data2;
    wire [31:0] alu_result;
    wire [31:0] mem_addr;
    wire [31:0] mem_read_data;
    wire [31:0] write_data;
    wire        reg_write_en;
    wire        mem_write_en;
    wire        mem_read_en;

    // 模块实例化
    instruction_fetch IF(
        .clk(clk),
        .rst(rst),
        .instruction(instruction),
        .pc(pc)
    );

    instruction_decode ID(
        .clk(clk),
        .rst(rst),
        .pc(pc),
        .instruction(instruction),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .imm(imm)
    );

    register_file RF(
        .clk(clk),
        .rst(rst),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .write_data(write_data),
        .reg_write_en(reg_write_en),
        .data1(reg_data1),
        .data2(reg_data2)
    );

    execute EX(
        .clk(clk),
        .rst(rst),
        .imm(imm),
        .pc(pc),
        .instruction(instruction),
        .reg_data1(reg_data1),
        .reg_data2(reg_data2),
        .mem_addr(mem_addr),
        .alu_result(alu_result),
        .reg_write_en(reg_write_en)
    );

    data_memory DM(
        .clk(clk),
        .addr(mem_addr),
        .write_data(reg_data2),
        .mem_write_en(mem_write_en),
        .mem_read_en(mem_read_en),
        .read_data(mem_read_data)
    );

    write_back WB(
        .alu_result(alu_result),
        .mem_read_data(mem_read_data),
        .mem_to_reg(mem_read_en), // 简化控制
        .write_data(write_data)
    );

    // 控制单元（简化版）
    assign mem_read_en = (instruction[6:0] == 7'b0000011);
    assign mem_write_en = (instruction[6:0] == 7'b0100011);
endmodule

