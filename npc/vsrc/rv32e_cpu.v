module rv32e_cpu(
    input clk,
    input rst_n,
    output [31:0]pc
);
    //内部信号定义
    wire[31:0]instr;
    wire[3:0] alu_op;
    wire  reg_write,alu_src,mem_write,mem_to_reg,branch;
    wire[31:0] rs1_data,rs2_data,alu_result,mem_data;

    //程序计数器pc
    reg[31:0] pc_reg;
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            pc_reg<=32'h0;
        else
            pc_reg<=pc_next;
    end
    assign pc=pc_reg

    //指令存储器
    instruction_memory imem(
        .addr(pc_reg)
        .instr(instr)
    );

    //指令选择
    control_unit ctrl(
        .opcode(instr[6:0]),
        .reg_write(reg_write),
        .alu_src(alu_src),
        .alu_op(alu_op),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .branch(branch)
    );

    //寄存器堆
    register_file reg_file(
        .clk(clk),
        .rst_n(rst_n),
        .rs1_addr(instr[19:16]),//rv32e的寄存器地址为16位
        .rs2_addr(instr[24:21]),
        .rd_addr(instr[11:8]),
        .rd_data(mem_to_reg?mem_data:alu_result),
        .reg_write(reg_write),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data)
    );

    //alu
    alu alu(
        .a(rs1_data),
        .b(alu_src?instr[31:20]:rs_data),//立即数或寄存器
        .alu_op(alu_op),
        .result(alu_result),
        .zero(zero_flag)
    );

    //数据存储器
    data_memory dmem(
        .clk(clk),
        .addr(alu_result),
        .write_data(rs2_data),
        .mem_write(mem_write),
        .read_data(mem_data)
    );

    //下一条pc
    wire [31:0] pc_next=pc_reg+4;
endmodule
