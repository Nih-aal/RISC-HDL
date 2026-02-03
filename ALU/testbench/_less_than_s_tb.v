`timescale 1ns/1ps

module testbench;

    reg [63:0] a;
    reg [63:0] b;

    wire [63:0] o;

    strictly_less_than_s uut (.a(a), .b(b), .c(o));

    initial begin
    
        $dumpfile("GTK/less_than_signed.vcd");
        $dumpvars(0, testbench);

        // Gpt generated test cases - 

        // -------------------------
        // Basic signed comparisons
        // -------------------------

        // 5 < 10 → true
        a = 64'sd5;
        b = 64'sd10;
        #10;

        // 10 < 5 → false
        a = 64'sd10;
        b = 64'sd5;
        #10;

        // 7 < 7 → false
        a = 64'sd7;
        b = 64'sd7;
        #10;

        // -------------------------
        // Positive vs negative
        // -------------------------

        // -1 < 1 → true
        a = -64'sd1;
        b = 64'sd1;
        #10;

        // 1 < -1 → false
        a = 64'sd1;
        b = -64'sd1;
        #10;

        // -------------------------
        // Negative vs negative
        // -------------------------

        // -10 < -5 → true
        a = -64'sd10;
        b = -64'sd5;
        #10;

        // -5 < -10 → false
        a = -64'sd5;
        b = -64'sd10;
        #10;

        // -------------------------
        // Edge cases (SIGNED RANGE)
        // -------------------------

        // Min < Max → true
        a = 64'sh8000000000000000;  // -2^63
        b = 64'sh7FFFFFFFFFFFFFFF;  //  2^63 - 1
        #10;

        // Max < Min → false
        a = 64'sh7FFFFFFFFFFFFFFF;
        b = 64'sh8000000000000000;
        #10;

        // -------------------------
        // Overflow-sensitive cases
        // -------------------------

        // (2^63 - 1) < (-1) → false
        // subtraction overflows, logic must correct via overflow bit
        a = 64'sh7FFFFFFFFFFFFFFF;
        b = -64'sd1;
        #10;

        // (-2^63) < (1) → true
        // subtraction overflows, still must be correct
        a = 64'sh8000000000000000;
        b = 64'sd1;
        #10;



        $finish;
     
    end

endmodule