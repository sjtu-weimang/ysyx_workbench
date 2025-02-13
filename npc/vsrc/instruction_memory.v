module instruction_memory (
    input  [31:0] addr,      // 输入地址（PC）
    output [31:0] instr      // 输出指令
);
    // 定义指令存储器（ROM）
    reg [31:0] rom [0:1023]; // 假设 ROM 大小为 1024 个 32 位字

    // 初始化 ROM（加载程序）
    initial begin
        $readmemh("program.hex", rom); // 从文件加载程序
    end

    // 输出指令
    assign instr = rom[addr[11:2]]; // 地址按字对齐（32位字地址）
endmodule