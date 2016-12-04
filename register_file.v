module RegisterFile (
	input [15:0] DData,
	input [2:0] AAddress,
	input [2:0] BAddress,
	input [2:0] DAddress,
	input ReadOrWrite,
	output reg [15:0] AData,
	output reg [15:0] BData);

	reg [7:0] register [15:0];

	always @ (*) begin
		if ( ReadOrWrite == 1'b0 ) begin
			AData <= register[AAddress];
			BData <= register[BAddress];
		end else begin
			register[DAddress] <= DData;
		end
	end

endmodule
