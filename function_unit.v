module FunctionUnit ( input  [15:0] A,
                      input  [15:0] B,
                      output [15:0] Result,
                      input  [3:0]  FunctionSelect,
                      output Overflow,
                      output CarryOut,
                      output Negative,
                      output Zero);
    
    parameter UNDEFINE = 16'b0000_0000_0000_0000;   

    wire [15:0] tempB, inverseA, Aplus1;
    assign tempB = ( FunctionSelect == 4'b0100 || FunctionSelect == 4'b0101 ) ? ~B
                                                                              :  B;

    assign inverseA = ~A;
    assign Aplus1 = A + 16'd1;
    assign {CarryOut, Result} = (FunctionSelect == 4'b0000) ? (A) :
                                (FunctionSelect == 4'b0001) ? (Aplus1) :
                                (FunctionSelect == 4'b0010) ? (A + tempB) :
                                (FunctionSelect == 4'b0011) ? (A + tempB + 16'd1) :
                                (FunctionSelect == 4'b0100) ? (A + tempB) :
                                (FunctionSelect == 4'b0101) ? (A + tempB + 16'd1) :
                                (FunctionSelect == 4'b0110) ? (A - 16'd1) :
                                (FunctionSelect == 4'b0111) ? (A) : 
                                (FunctionSelect == 4'b1000) ? (A & tempB) :
                                (FunctionSelect == 4'b1001) ? (A | tempB) :
                                (FunctionSelect == 4'b1010) ? (A ^ tempB) :
                                (FunctionSelect == 4'b1011) ? (inverseA) :
                                (FunctionSelect == 4'b1100) ? (tempB) : UNDEFINE;
    
    assign Overflow =           (FunctionSelect == 4'b0001) ? overflow(A, 16'd1, Result) :
                                (FunctionSelect == 4'b0010) ? overflow(A, tempB, Result) :
                                (FunctionSelect == 4'b0011) ? overflow(A, tempB, Result) :
                                (FunctionSelect == 4'b0100) ? overflow(A, tempB, Result) :
                                (FunctionSelect == 4'b0101) ? overflow(A, tempB, Result) :               
                                (FunctionSelect == 4'b0110) ? overflow(A, 16'b1111_1111_1111_1111, Result) :
                                0;

    assign Negative = (Result[15] == 1);
    assign Zero = (Result == 16'b0000_0000_0000_0000);

    function overflow; 
        input [15:0] a, b, result;
        begin
            overflow = ( (a[15] == 1'b0) && (b[15] == 1'b0) && (result[15] == 1'b1) ) |
                       ( (a[15] == 1'b1) && (b[15] == 1'b1) && (result[15] == 1'b0) );
        end
    endfunction

    /*always@(Result) begin
        $display("%b", A);
    end*/ 

endmodule 
