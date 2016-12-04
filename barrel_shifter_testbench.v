`timescale 1ns/100ps

module BarrelShifterTest;

    reg [15:0] B;
    wire [15:0] R;
    reg [2:0] SS;
    reg [3:0] SA;
    integer i;
    
    BarrelShifter bs( .ShiftSelect(SS),
                      .ShifterAmount(SA),
                      .OriginB(B),
                      .ShiftedB(R) );

    initial begin

        # 5 
        B = 16'b1101_0000_0000_0000;
        SA = 4'b1111;

        SS = 3'b000;
        # 5
        $display("%b logical right shift %d is %b", B, SA, R);

        SS = 3'b001;
        # 5
        $display("%b logical left shift %d is %b", B, SA, R);

        SS = 3'b010;
        #5
        $display("%b logical right rotation shift %d is %b", B, SA, R);

        SS = 3'b011;
        #5
        $display("%b logical left rotation shift %d is %b", B, SA, R);

        SS = 3'b100;
        #5
        $display("%b arithmetical right shift %d is %b", B, SA, R);
    end

endmodule    
        
        
        
