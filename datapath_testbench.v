`timescale 1ns/100ps

module DatapathSimulation;
    wire [54:0] ControlWord;
    reg [54:0] temp;
    integer file, status, i, out;
    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7, A, B;
    wire V, C, N, Z;

    top datapath ( ControlWord, V, C, N, Z, r0, r1, r2, r3, r4, r5, r6, r7, A, B);

    assign ControlWord = temp;

    initial begin
        $fsdbDumpfile("datapath.fsdb");
        $fsdbDumpvars;
    end

    initial begin
        file = $fopen("pattern.dat", "r");
        out = $fopen("output.txt", "w");
        #2
        while( !$feof(file) ) begin
            status = $fscanf(file, "%b", temp);
            #5
            $fwrite(out, "%b_%b_%b_%b_%b_%b_%b_%b_%b_%b_%b_%b_%b_%b\n", V, C, N, Z,
            r0, r1, r2, r3, r4, r5, r6, r7, A, B);
            i = i + 1;
        end       
        $fclose(file);
        $fclose(out);
        $finish;
    end

endmodule    
        
        
        
