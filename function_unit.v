module FunctionUnit ( input  [15:0] A,
                      input  [15:0] B,
                      output [15:0] Result,
                      input  [3:0]  FunctionSelect,
                      output Overflow,
                      output CarryOut,
                      output Negative,
                      output Zero);
    
    parameter UNDEFINE = 16'b0000_0000_0000_0000;   

    wire [15:0] inverseB;
    assign inverseB = ~B;

    assign {CarryOut, Result} = (FunctionSelect == 4'b0000) ? (A) :
                                (FunctionSelect == 4'b0001) ? (A + 16'b1) :
                                (FunctionSelect == 4'b0010) ? (A + B) :
                                (FunctionSelect == 4'b0011) ? (A + B + 16'b1) :
                                (FunctionSelect == 4'b0100) ? (A + inverseB) :
                                (FunctionSelect == 4'b0101) ? (A + inverseB + 16'b1) :
                                (FunctionSelect == 4'b0110) ? (A + 17'b1111_1111_1111_1111_1) :
                                (FunctionSelect == 4'b0111) ? (A) : 
                                (FunctionSelect == 4'b1000) ? (A & B) :
                                (FunctionSelect == 4'b1001) ? (A | B) :
                                (FunctionSelect == 4'b1010) ? (A ^ B) :
                                (FunctionSelect == 4'b1011) ? (~A) :
                                (FunctionSelect == 4'b1100) ? (B) : UNDEFINE;
    
    assign Overflow = CarryOut | Result[15];
    assign Negative = Result[15];
    assign Zero = (Result == 16'b0);

endmodule 
