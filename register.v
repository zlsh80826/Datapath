module RegisterFile (index, val, clk);
	input [2:0] index;
	input clk;
	output [7:0] val;
	reg [7:0] val;

	reg [15:0] r0;
	reg [15:0] r1;
	reg [15:0] r2;
	reg [15:0] r3;
	reg [15:0] r4;
	reg [15:0] r5;
	reg [15:0] r6;
	reg [15:0] r7;

	always @ (posedge clk) begin
		case(index)
			3'b000: val = r0;
			3'b001: val = r1;
			3'b010: val = r2;
			3'b011: val = r3;
			3'b100: val = r4;
			3'b101: val = r5;
			3'b110: val = r6;
			3'b111: val = r7;
		endcase
	end

endmodule
