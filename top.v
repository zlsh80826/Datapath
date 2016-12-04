module top ( input [54:0] ControlWord );

	wire [15:0] DData;
	wire [15:0] AData;
	wire [15:0] BData, SelectedB, ShiftedB;
	wire [15:0] ALUResult;
	wire Overflow, CarryOut, Negative, Zero;

	RegisterFile registerFile ( DData,
				   				ControlWord[51:49],
				   				ControlWord[48:46],
				   				ControlWord[54:52],
				   				ControlWord[32],
								AData,
								BData );

	Multiplexer multiplexerB ( BData,
							   ControlWord[31:16],
							   ControlWord[45],
							   SelectedB );
	
	BarrelShifter barrelShifter ( ControlWord[40:38],
								  ControlWord[37:34],
								  SelectedB,
								  ShiftedB );
	
	FunctionUnit functionUnit ( AData,
								ShiftedB,
								ALUResult,
								ControlWord[44:41],
								Overflow,
								CarrOut,
								Negative,
								Zero );

	Multiplexer multiplexerD ( ALUResult,
							   ControlWord[15:0],
							   ControlWord[33],
							   DDate );
endmodule
