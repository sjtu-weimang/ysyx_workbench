import "DPI-C" function int pmem_read(input int raddr);
import "DPI-C" function void pmem_write(
  input int waddr, input int wdata, input byte wmask);
module PMem(
		input valid,
		input [31:0] raddr,
		input [31:0] waddr,
		input [31:0] wdata,
		input [7:0] wmask,
		input wen,
		output reg [31:0] rdata
		);
	always @(*) begin
	  if (valid) begin // 有读写请求时
		rdata = pmem_read(raddr);
		if (wen) begin // 有写请求时
		  pmem_write(waddr, wdata, wmask);
		end
	  end
	  else begin
		rdata = 0;
	  end
	end
endmodule


// `ifdef SYNTHESIS  // 综合模式：用真实 Memory
// module PMem(
// 		input valid,
// 		input [31:0] raddr,
// 		input [31:0] waddr,
// 		input [31:0] wdata,
// 		input [7:0] wmask,
// 		input wen,
// 		output reg [31:0] rdata
// 		);
//     reg [31:0] mem [0:1023];
//     always @(posedge clk) begin
//         if (valid) begin
//             rdata <= mem[raddr[11:2]];
//             if (wen) begin
//                 if (wmask[0]) mem[waddr[11:2]][7:0]   <= wdata[7:0];
//                 if (wmask[1]) mem[waddr[11:2]][15:8]  <= wdata[15:8];
//                 if (wmask[2]) mem[waddr[11:2]][23:16] <= wdata[23:16];
//                 if (wmask[3]) mem[waddr[11:2]][31:24] <= wdata[31:24];
//             end
//         end
//         else begin
//             rdata <= 0;
//         end
//     end
// `else  // 仿真模式：用 DPI-C
//     always @(*) begin
//         if (valid) begin
//             rdata = pmem_read(raddr);
//             if (wen) pmem_write(waddr, wdata, wmask);
//         end
//         else begin
//             rdata = 0;
//         end
//     end
// `endif
// endmodule
