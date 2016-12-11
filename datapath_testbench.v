`timescale 1ns/100ps

module DatapathSimulation;
    wire [54:0] ControlWord;
    reg [54:0] temp;
    integer file, status, i, out;
    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7, A, B;
    wire V, C, N, Z;
    reg clk;

    top datapath ( ControlWord, V, C, N, Z, r0, r1, r2, r3, r4, r5, r6, r7, A, B, clk);

    assign ControlWord = temp;

    initial begin
        `ifdef SYNTHESIS
            $sdf_annotate("datapath_syn.sdf", DatapathSimulation);
            $fsdbDumpfile("syn.fsdb");
        `else
            $fsdbDumpfile("datapath.fsdb");
        `endif
        $fsdbDumpvars;
    end

    always #15 clk = ~clk;

    initial begin
        file = $fopen("pattern.dat", "r");
        out = $fopen("output.txt", "w");
        i = 1;
        clk = 0; 
        #16
        status = $fscanf(file, "%b", temp);
        while( !$feof(file) ) begin
            #30
            status = $fscanf(file, "%b", temp);
            $fwrite(out, "%b_%b_%b_%b_%b_%b_%b_%b_%b_%b_%b_%b_%b_%b\n", V, C, N, Z,
            r0, r1, r2, r3, r4, r5, r6, r7, A, B);
            i = i + 1;
        end       
        $fclose(file);
        $fclose(out);
        $finish;
    end

endmodule    
        
        
        
