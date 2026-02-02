`timescale 1ns/1ps

module testbench;

    reg [63:0] a,b;
    reg mode;

    wire [63:0] s;
    wire carry_flag, overflow_flag;

    add_sub_64bit uut (.a(a), .b(b), .s(s), .mode(mode), .carry_flag(carry_flag), .overflow_flag(overflow_flag));

    initial begin
    
        $dumpfile("GTK/adder64bit.vcd");
        $dumpvars(0, testbench);

        // Gpt generated cases - 

        // --------------------
        // ADDITION TESTS
        // --------------------

        mode = 0;

        // 1) small + small
        a = 64'd2; 
        b = 64'd3;
        #10;

        // 2) medium + medium
        a = 64'd100;
        b = 64'd200;
        #10;

        // 3) large + large (no overflow)
        a = 64'd1073741824;   // 2^30
        b = 64'd1073741824;   // 2^30
        #10;

        // 4) edge (max positive - 1 + 1)
        a = 64'sh7FFFFFFFFFFFFFFE;
        b = 64'd1;
        #10;

        // 5) signed overflow (positive + positive)
        a = 64'sh7FFFFFFFFFFFFFFF;
        b = 64'd1;
        #10;

        // --------------------
        // SUBTRACTION TESTS
        // --------------------
        mode = 1;

        // 6) 7 - 5 = 2
        a = 64'd7;
        b = 64'd5;
        #10;

        // 7) 5 - 7 = -2
        a = 64'd5;
        b = 64'd7;
        #10;

        // 8) (-3) - (-5) = 2
        a = -64'sd3;
        b = -64'sd5;
        #10;

        // 9) edge: min negative - 1 (overflow)
        a = 64'sh8000000000000000;
        b = 64'd1;
        #10;

        $finish;
        
    end

endmodule