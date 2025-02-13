module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] alu_op,
    output reg [31:0] result,
    output zero
);
    parameter OP_ADD = 4'b0000;
    parameter OP_SUB = 4'b0001;
    parameter OP_AND = 4'b0010;
    parameter OP_OR  = 4'b0011;
    parameter OP_XOR = 4'b0100;
    parameter OP_SLT = 4'b0101;
    parameter OP_SLTU= 4'b0100;


always @(*) begin
    case(alu_op)
    OP_ADD: result=a+b;
    OP_SUB: result=a-b;
    OP_AND: result=a&b;
    OP_OR:  result=a|b;
    OP_XOR: result=a^b;
    OP_SLT: result=($signed(a)<$signed(b))?32'b1:32'b0;
    OP_SLTU: result=(a<b)?32'b1:32'b0;
    default: result=32'b0;
    endcase
end

assign zero=(result==0)

endmodule