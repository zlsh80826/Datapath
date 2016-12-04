module ALU ( input  [15:0] A,
			 input  [15:0] B,
			 output [15:0] result,
			 input  [3:0] function_code,
			 output cout);
	
	parameter UNDEFINE = 16'b0000_0000_0000_0000;	

	assign result = (function_code == 4'b0000) ? (A) :
					(function_code == 4'b0001) ? (A + 4'b0001) :
					(function_code == 4'b0010) ? (A + B) :
					(function_code == 4'b0011) ? (A + B + 4'b0001) :
					(function_code == 4'b0100) ? (A + ~B) :
					(function_code == 4'b0101) ? (A + ~B + 4'b0001) :
					(function_code == 4'b0110) ? (A - 4'b0001) :
					(function_code == 4'b0111) ? (A) : 
					(function_code == 4'b1000) ? (A & B) :
					(function_code == 4'b1001) ? (A | B) :
					(function_code == 4'b1010) ? (A ^ B) :
					(function_code == 4'b1011) ? (~A) :
					(function_code == 4'b1100) ? (B) : UNDEFINE;					

endmodule 
