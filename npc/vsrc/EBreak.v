import "DPI-C" function void ebreak(input byte code);

module EBreak (
		input enable,
		input [7:0] code,
		input [31:0]pc
		);
	always @* begin
		if (enable)
			begin			
			ebreak(code);
			$display("ebreak pc is %x\n",pc);
			end

	end
endmodule

