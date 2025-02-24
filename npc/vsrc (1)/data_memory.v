module data_memory (
    input         clk,          // 时钟信号
    input  [31:0] addr,         // 输入地址
    input  [31:0] write_data,   // 写入数据
    input         mem_write,    // 写使能
    output [31:0] read_data     // 读取数据
);
    // 定义数据存储器（RAM）
    reg [31:0] ram [0:1023];    // 假设 RAM 大小为 1024 个 32 位字

    // 读操作（组合逻辑）
    assign read_data = ram[addr[11:2]]; // 地址按字对齐（32位字地址）

    // 写操作（时序逻辑）
    always @(posedge clk) begin
        if (mem_write) begin
            ram[addr[11:2]] <= write_data;
        end
    end
endmodule