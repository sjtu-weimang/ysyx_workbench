//=======================instruction_fetch=============================//
module instruction_fetch(
    input clk,
    input rst,
    output reg [31:0] instruction, // 修正拼写错误
    output reg [31:0] pc
);
    reg [31:0] instruction_memory [7:0]; // 示例指令存储器,最多存放256条指令

    // 初始化PC（仅仿真使用）
    initial begin
        pc = 32'h80000000;
    end

    always @(posedge clk) begin   
        if (!rst) begin
            pc <= 32'h80000000;
            instruction <= 32'h00000013; // NOP指令编码
        end
        else begin
            instruction <= instruction_memory[pc[30:2]]; // 字地址访问，去除首位(保证从指令存储器的第一位开始访问)，左移两位
            pc <= pc + 4;
        end
    end
endmodule
