`timescale 1ns/1ps

module testbench;

    reg [63:0] a;
    reg [63:0] b;

    wire [63:0] o;

    strictly_less_than_uns uut (.a(a), .b(b), .c(o));

    initial begin
    
        $dumpfile("GTK/less_than_unsigned.vcd");
        $dumpvars(0, testbench);

        // Gpt generated test cases - 

        // -------------------------
        // Basic unsigned comparisons
        // -------------------------

        // 5 < 10 → true
        a = 64'd5;
        b = 64'd10;
        #10;

        // 10 < 5 → false
        a = 64'd10;
        b = 64'd5;
        #10;

        // 7 < 7 → false
        a = 64'd7;
        b = 64'd7;
        #10;

        // -------------------------
        // Boundary cases
        // -------------------------

        // 0 < 1 → true
        a = 64'd0;
        b = 64'd1;
        #10;

        // 1 < 0 → false
        a = 64'd1;
        b = 64'd0;
        #10;

        // -------------------------
        // Large unsigned values
        // -------------------------

        // max < max → false
        a = 64'hFFFFFFFFFFFFFFFF;
        b = 64'hFFFFFFFFFFFFFFFF;
        #10;

        // max < max+1 (wrap not allowed) → false
        a = 64'hFFFFFFFFFFFFFFFF;
        b = 64'd0;
        #10;

        // small < max → true
        a = 64'd1;
        b = 64'hFFFFFFFFFFFFFFFF;
        #10;

        // -------------------------
        // MSB-focused (unsigned!)
        // -------------------------

        // 2^63 < 2^63 + 1 → true
        a = 64'h8000000000000000;
        b = 64'h8000000000000001;
        #10;

        // 2^63 + 1 < 2^63 → false
        a = 64'h8000000000000001;
        b = 64'h8000000000000000;
        #10;


        $finish;
     
    end

endmodule