module FunctionUnit ( input  [15:0] A,
			 		  input  [15:0] B,
			 		  output [15:0] Result,
				 	  input  [3:0]  FunctionSelect,
			 		  output Overflow,
			 		  output CarryOut,
			 		  output Negative,
			 		  output Zero);
	
	parameter UNDEFINE = 16'b0000_0000_0000_0000;	

	assign Result = (FunctionSelect == 4'b0000) ? (A) :
					(FunctionSelect == 4'b0001) ? (A + 4'b0001) :
					(FunctionSelect == 4'b0010) ? (A + B) :
					(FunctionSelect == 4'b0011) ? (A + B + 4'b0001) :
					(FunctionSelect == 4'b0100) ? (A + ~B) :
					(FunctionSelect == 4'b0101) ? (A + ~B + 4'b0001) :
					(FunctionSelect == 4'b0110) ? (A - 4'b0001) :
					(FunctionSelect == 4'b0111) ? (A) : 
					(FunctionSelect == 4'b1000) ? (A & B) :
					(FunctionSelect == 4'b1001) ? (A | B) :
					(FunctionSelect == 4'b1010) ? (A ^ B) :
					(FunctionSelect == 4'b1011) ? (~A) :
					(FunctionSelect == 4'b1100) ? (B) : UNDEFINE;
	
	assign Overflow = 0;
	assign CarryOut = 0;
	assign Negative = 0;
	assign Zero = 0;

endmodule 
