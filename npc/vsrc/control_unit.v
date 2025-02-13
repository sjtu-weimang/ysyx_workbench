module control_unit(
    input [6:0] opcode,
    output reg reg_write,
    output reg alu_src,
    output reg[3:0] alu_op,
    output reg mem_write,
    output reg mem_to_reg,
    output reg branch
);
    parameter OP_RTYPE=7'b0110011;
    parameter OP_ITYPE=7'b0010011;
    parameter OP_STORE=7'b0100011;
    parameter OP_BRANCH=7'b1100011;

    always @(*) begin
     case(opcode)
        OP_RTYPE:begin
            reg_write= 1'b1;
            alu_src  = 1'b0;
            mem_write= 1'b0;
            mem_to_reg=1'b0;
            branch   = 1'b0;
            alu_op   = 4'b0000;// 根据func3和func7细化
        end
        OP_ITYPE:begin
            reg_write = 1'b1;
            alu_src   = 1'b1;
            mem_write = 1'b0;
            mem_to_reg= 1'b0;
            branch    = 1'b0;
            alu_op    = 4'b0000;
        end
        OP_STORE:begin
            reg_write = 1'b0;
            alu_src   = 1'b1;
            mem_write = 1'b1;
            mem_to_reg= 1'b0;
            branch    = 1'b0;
        end
        OP_BRANCH: begin
            reg_write = 1'b0;
            alu_src   = 1'b0;
            mem_write = 1'b0;
            mem_to_reg= 1'b0;
            branch    = 1'b1;
        end
        default: begin
            reg_write = 1'b0;
            alu_src   = 1'b0;
            mem_write = 1'b0;
            mem_to_reg= 1'b0;
            branch    = 1'b0;
        end
     endcase
    end
endmodule