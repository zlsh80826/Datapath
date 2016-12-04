`timescale 1ns/100ps
module BarrelShifter ( input [2:0] ShiftSelect,
                       input [3:0] ShifterAmount,
                       input [15:0] OriginB,
                       output [15:0] ShiftedB);
    
    parameter UNDEFINE = 16'b0000_0000_0000_0000;
           
    assign ShiftedB = ( ShiftSelect == 3'b000 ) ? ( OriginB >> ShifterAmount ) :
                      ( ShiftSelect == 3'b001 ) ? ( OriginB << ShifterAmount ) :
                      ( ShiftSelect == 3'b010 ) ? ( ( OriginB >> ShifterAmount ) | ( OriginB << (16 - ShifterAmount) ) ) :
                      ( ShiftSelect == 3'b011 ) ? ( ( OriginB << ShifterAmount ) | ( OriginB >> (16 - ShifterAmount) ) ) :
                      ( ShiftSelect == 3'b100 ) ? ( ( OriginB >> ShifterAmount ) | (16'b1000_0000_0000_0000 & OriginB) ) : UNDEFINE;
    

endmodule
