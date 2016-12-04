module Multiplexer ( input [15:0] In1,
					 input [15:0] In2,
					 input Select,
					 output [15:0] Result );

	assign Result = ( Select == 1'b0 ) ? In1 : In2;

endmodule
