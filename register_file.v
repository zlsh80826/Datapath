module RegisterFile (
    input [15:0] DData,
    input [2:0] AAddress,
    input [2:0] BAddress,
    input [2:0] DAddress,
    input ReadOrWrite,
    output reg [15:0] AData,
    output reg [15:0] BData,
    output [15:0] r0,
    output [15:0] r1,
    output [15:0] r2,
    output [15:0] r3,
    output [15:0] r4,
    output [15:0] r5,
    output [15:0] r6,
    output [15:0] r7,
    input clk);

    reg [15:0] register [7:0];

    always @(posedge clk) begin
        AData = register[AAddress];
        BData = register[BAddress];
        /*if ( ReadOrWrite == 1'b1 ) begin
            register[DAddress] = DData;
        end*/
    end

    always @(*) begin
        if ( ReadOrWrite == 1'b1 ) begin
            register[DAddress] = DData;
        end
    end

    assign r0 = register[0];
    assign r1 = register[1];
    assign r2 = register[2];
    assign r3 = register[3];
    assign r4 = register[4];
    assign r5 = register[5];
    assign r6 = register[6];
    assign r7 = register[7];
    
endmodule
