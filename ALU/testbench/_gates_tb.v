`timescale 1ns/1ps

module testbench;

    reg [63:0] a,b;

    wire [63:0] c;

    xor_64bit uut (.a(a), .b(b), .c(c)); 

    initial begin
        
        $dumpfile("GTK/gates64bit.vcd");
        $dumpvars(0, testbench);

        // Gpt generated test cases

        // --------------------
        // BASIC cases
        // --------------------

        // 0 ^ 0 = 0
        a = 64'd0;
        b = 64'd0;
        #10;

        // 1 ^ 0 = 1
        a = 64'd1;
        b = 64'd0;
        #10;

        // 1 ^ 1 = 0
        a = 64'd1;
        b = 64'd1;
        #10;

        // --------------------
        // Pattern tests
        // --------------------

        // all 0s ^ all 1s = all 1s
        a = 64'h0000000000000000;
        b = 64'hFFFFFFFFFFFFFFFF;
        #10;

        // all 1s ^ all 1s = 0
        a = 64'hFFFFFFFFFFFFFFFF;
        b = 64'hFFFFFFFFFFFFFFFF;
        #10;

        // alternating bits
        a = 64'hAAAAAAAAAAAAAAAA; // 1010...
        b = 64'h5555555555555555; // 0101...
        #10;

        // --------------------
        // Random-looking values
        // --------------------

        a = 64'h123456789ABCDEF0;
        b = 64'h0F0F0F0F0F0F0F0F;
        #10;

        a = 64'h8000000000000000;
        b = 64'h0000000000000001;
        #10;

        // --------------------
        // Self XOR (must be zero)
        // --------------------

        a = 64'hDEAABEEECAAEBEBE;
        b = 64'hDEAABEEECAAEBEBE;
        #10;

        $finish;

    end


endmodule