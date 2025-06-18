module ALU(
    input      [3:0]  op,     // 操作码
    input      [31:0] a,      // 操作数A
    input      [31:0] b,      // 操作数B
    output reg [31:0] result, // 运算结果
    output            zero    // 零标志
);

// 操作码定义
localparam [3:0]
    ADD  = 4'b0000,
    SUB  = 4'b0001,
    AND  = 4'b0010,
    OR   = 4'b0011,
    XOR  = 4'b0100,
    SLL  = 4'b0101,  // 逻辑左移
    SRL  = 4'b0110,  // 逻辑右移
    SRA  = 4'b0111;  // 算术右移

always @(*) begin
    case(op)
        ADD:  result = a + b;
        SUB:  result = a - b;
        AND:  result = a & b;
        OR:   result = a | b;
        XOR:  result = a ^ b;
        SLL:  result = a << b[4:0];  // 移位位数取低5位
        SRL:  result = a >> b[4:0];
        SRA:  result = $signed(a) >>> b[4:0];
        default: result = 32'h0;
    endcase
end

// 零标志生成
assign zero = (result == 32'h0);

endmodule