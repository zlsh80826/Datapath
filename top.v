module top ( input [54:0] ControlWord,
			 input Clock);

	wire [15:0] Data;
	wire [15:0] A;
	wire [15:0] B;

	RegisterFile D_reg ( DA, Data, Clock );

	RegisterFile A_reg ( AA, A, Clock );

	RegisterFile B_reg ( BA, B, Clock );






endmodule
