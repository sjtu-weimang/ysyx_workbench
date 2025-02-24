//=======================instruction_fetch=============================//
module instruction_fetch(
    input clk,
    input rst,
    //input [31:0] in_addr_i,        // 输入端口不需要reg类型
    output reg [31:0] instruction, // 修正拼写错误
    output reg [31:0] pc
);
    reg [31:0] instruction_memory [0:1023]; // 示例指令存储器

    // 初始化PC（仅仿真使用）
    initial begin
        pc = 32'h80000000;
    end

    always @(posedge clk) begin    // 修正敏感列表
        if (!rst) begin
            pc <= 32'h80000000;
            instruction <= 32'h00000013; // NOP指令编码
        end
        else begin
            instruction <= instruction_memory[pc[11:2]]; // 字地址访问
            pc <= pc + 4;
        end
    end
endmodule

//=======================instruction_decode=============================//
module instruction_decode(
    input clk,
    input rst,
    input [31:0] pc,
    input [31:0] instruction,
    output reg [4:0] rs1,
    output reg [4:0] rs2,
    output reg [4:0] rd,
    output reg [31:0] imm          // 扩展为32位立即数
);
    always @(posedge clk) begin     // 修正敏感列表
        if (!rst) begin
            {rs1, rs2, rd, imm} <= {5'b0, 5'b0, 5'b0, 32'b0};
        end
        else begin
            case (instruction[6:0])
                // R-type
                7'b0110011: begin
                    rs1 <= instruction[19:15];
                    rs2 <= instruction[24:20];
                    rd  <= instruction[11:7];
                    imm <= 32'b0;
                end
                // I-type
                7'b0010011, 7'b0000011: begin
                    rs1 <= instruction[19:15];
                    rd  <= instruction[11:7];
                    imm <= {{20{instruction[31]}}, instruction[31:20]};
                end
                // 添加其他指令类型解码
                default: {rs1, rs2, rd, imm} <= {5'b0, 5'b0, 5'b0, 32'b0};
            endcase
        end
    end
endmodule

//=======================execute=======================================//
module execute(
    input clk,
    input rst,
    input [31:0] imm,
    input [31:0] pc,
    input [31:0] instruction,
    input [31:0] reg_data1,        // 从寄存器文件读取的数据
    input [31:0] reg_data2,
    output reg [31:0] mem_addr,
    output reg [31:0] alu_result,
    output reg reg_write_en
);
    // ALU操作
    always @(*) begin
        if (!rst) begin
            {alu_result, mem_addr, reg_write_en} = {32'b0, 32'b0, 1'b0};
        end
        else begin
            case (instruction[6:0])
                7'b0110011: begin // R-type
                    case ({instruction[31:25], instruction[14:12]})
                        10'b0000000000: alu_result = reg_data1 + reg_data2; // ADD
                        10'b0100000000: alu_result = reg_data1 - reg_data2; // SUB
                        // 添加其他ALU操作
                        default: alu_result = 32'b0;
                    endcase
                    reg_write_en = 1'b1;
                end
                7'b0010011: begin // I-type
                    alu_result = reg_data1 + imm;
                    reg_write_en = 1'b1;
                end
                7'b0000011: begin // Load
                    mem_addr = reg_data1 + imm;
                    reg_write_en = 1'b1;
                end
                default: {alu_result, reg_write_en} = {32'b0, 1'b0};
            endcase
        end
    end
endmodule

//=======================register_file=================================//
module register_file(
    input clk,
    input rst,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] write_data,
    input reg_write_en,
    output [31:0] data1,
    output [31:0] data2
);
    reg [31:0] registers [0:31];

    // 初始化寄存器（x0始终为0）
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1)
            registers[i] = 32'b0;
    end

    assign data1 = (rs1 != 0) ? registers[rs1] : 32'b0;
    assign data2 = (rs2 != 0) ? registers[rs2] : 32'b0;

    always @(posedge clk) begin
        if (reg_write_en && rd != 0) begin
            registers[rd] <= write_data;
        end
    end
endmodule

//=======================data_memory===================================//
module data_memory(
    input clk,
    input [31:0] addr,
    input [31:0] write_data,
    input mem_write_en,
    input mem_read_en,
    output [31:0] read_data
);
    reg [31:0] memory [0:1023];
    
    assign read_data = mem_read_en ? memory[addr[11:2]] : 32'b0;
    
    always @(posedge clk) begin
        if (mem_write_en)
            memory[addr[11:2]] <= write_data;
    end
endmodule

//=======================write_back====================================//
module write_back(
    input [31:0] alu_result,
    input [31:0] mem_read_data,
    input mem_to_reg,
    output [31:0] write_data
);
    assign write_data = mem_to_reg ? mem_read_data : alu_result;
endmodule