module top ( input [54:0] ControlWord,
             output Overflow,
             output CarryOut,
             output Negative,
             output Zero,
             output [15:0] r0,
             output [15:0] r1,
             output [15:0] r2,
             output [15:0] r3,
             output [15:0] r4,
             output [15:0] r5,
             output [15:0] r6,
             output [15:0] r7,
             output [15:0] AData,
             output [15:0] ShiftedB,
             input clk);

    wire [15:0] DData;
    wire [15:0] BData, SelectedB;
    wire [15:0] ALUResult;

    RegisterFile registerFile ( DData,
                                ControlWord[51:49],
                                ControlWord[48:46],
                                ControlWord[54:52],
                                ControlWord[32],
                                AData,
                                BData,
                                r0,
                                r1,
                                r2,
                                r3,
                                r4,
                                r5,
                                r6,
                                r7,
                                clk );

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
                                CarryOut,
                                Negative,
                                Zero);

    Multiplexer multiplexerD ( ALUResult,
                               ControlWord[15:0],
                               ControlWord[33],
                               DData );

endmodule
