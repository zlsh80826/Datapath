module BarrelShifter ( input [2:0] ShiftSelect,
                       input [3:0] ShifterAmount,
                       input signed [15:0] OriginB,
                       output signed [15:0] ShiftedB);
    
    parameter UNDEFINE = 16'b0000_0000_0000_0000;

    assign ShiftedB = ( ShiftSelect == 3'b000 ) ? ( OriginB >> ShifterAmount ) :
                      ( ShiftSelect == 3'b001 ) ? ( OriginB << ShifterAmount ) :
                      ( ShiftSelect == 3'b010 ) ? ( ( OriginB >> ShifterAmount ) | ( OriginB << ~ShifterAmount ) ) :
                      ( ShiftSelect == 3'b011 ) ? ( ( OriginB << ShifterAmount ) | ( OriginB >> ~ShifterAmount ) ) :
                      ( ShiftSelect == 3'b110 ) ? ( OriginB >>> ShifterAmount ) : UNDEFINE;

endmodule
