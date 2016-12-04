module BarrelShifter ( input [2:0] ShiftSelect,
					   input [3:0] ShifterAmount,
					   input signed [15:0] originB,
					   output signed [15:0] shiftedB);
	
	parameter UNDEFINE = 16'b0000_0000_0000_0000;

	assign shiftedB = ( ShiftSelect == 3'b000 ) ? ( originB >> ShifterAmount ) :
					  ( ShiftSelect == 3'b001 ) ? ( originB << ShifterAmount ) :
					  ( ShiftSelect == 3'b010 ) ? ( ( originB >> ShifterAmount ) | ( originB << ~ShifterAmount ) ) :
					  ( ShiftSelect == 3'b011 ) ? ( ( originB << ShifterAmount ) | ( originB >> ~ShifterAmount ) ) :
					  ( ShiftSelect == 3'b110 ) ? ( originB >>> ShifterAmount ) : UNDEFINE;

endmodule
