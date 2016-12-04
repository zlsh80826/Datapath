`timescale 1ns/100ps

module DatapathSimulation;
    wire [54:0] ControlWord;
    reg [54:0] temp;
    integer file, status;

    top datapath ( ControlWord );

    initial begin
        $fsdbDumpfile("datapath.fsdb");
        $fsdbDumpvars;
    end

    initial begin
        file = $fopen("test_pattern.dat", "r");
        
        while( !$feof(file) ) begin
            # 10
            status = $fscanf(file, "%b", temp);
        end       
        $fclose(file);
    end

endmodule    
        
        
        
