module FunctionUnit ( input  [15:0] A,
                      input  [15:0] B,
                      output [15:0] Result,
                      input  [3:0]  FunctionSelect,
                      output Overflow,
                      output CarryOut,
                      output Negative,
                      output Zero);
    
    parameter UNDEFINE = 16'b0000_0000_0000_0000;   

    wire [15:0] tempB;
    assign tempB = ( FunctionSelect == 4'b0100 || FunctionSelect == 4'b0101 ) ? ~B
                                                                              :  B;

    assign {CarryOut, Result} = (FunctionSelect == 4'b0000) ? (A) :
                                (FunctionSelect == 4'b0001) ? (A + 16'b1) :
                                (FunctionSelect == 4'b0010) ? (A + tempB) :
                                (FunctionSelect == 4'b0011) ? (A + tempB + 16'b1) :
                                (FunctionSelect == 4'b0100) ? (A + tempB) :
                                (FunctionSelect == 4'b0101) ? (A + tempB + 16'b1) :
                                (FunctionSelect == 4'b0110) ? (A + 17'b1111_1111_1111_1111_1) :
                                (FunctionSelect == 4'b0111) ? (A) : 
                                (FunctionSelect == 4'b1000) ? (A & tempB) :
                                (FunctionSelect == 4'b1001) ? (A | tempB) :
                                (FunctionSelect == 4'b1010) ? (A ^ tempB) :
                                (FunctionSelect == 4'b1011) ? (~A) :
                                (FunctionSelect == 4'b1100) ? (tempB) : UNDEFINE;
    
    assign Overflow =           (FunctionSelect == 4'b0001) ? () :
                                (FunctionSelect == 4'b0010) ? (A + tempB) :
                                (FunctionSelect == 4'b0011) ? (A + tempB + 16'b1) :
                                (FunctionSelect == 4'b0100) ? (A + tempB) :
                                (FunctionSelect == 4'b0101) ? (A + tempB + 16'b1) :
                                (FunctionSelect == 4'b0110) ? (A + 17'b1111_1111_1111_1111_1) :
    assign Negative = (Result[15] == 1);
    assign Zero = (Result == 16'b0000_0000_0000_0000);

    function overflow 
        input [15:0] a, b;
        begin
            
        end
    endfunction



endmodule 
