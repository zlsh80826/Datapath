module RegisterFile (index, val, clk);
	input [2:0] index;
	input clk;
	output [7:0] val;
	reg [7:0] val;

	reg [7:0] register [0:15];

	always @ (posedge clk) begin
		val = register[index];
	end

endmodule
