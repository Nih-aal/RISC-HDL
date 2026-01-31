`timescale 1ms/1ps

module testbench;

    reg [63:0] a,b;
    reg cin;

    wire [63:0] s;
    wire cout;

    adder_64bit uut (.a(a), .b(b), .cin(cin), .s(s), .cout(cout));

    initial begin
    
        $dumpfile("GTK/adder64bit.vcd");
        $dumpvars(0, testbench);

        cin = 0;

        // small + small
        a = 64'd2; 
        b = 64'd3; 
        #10;

        // medium + medium
        a = 64'd100; 
        b = 64'd200; 
        #10;

        // large + large (no overflow)
        a = 64'd1073741824;     // 2^30
        b = 64'd1073741824;     // 2^30
        #10;

        // edge case (max positive, no overflow)
        a = 64'sh7FFFFFFFFFFFFFFE;
        b = 64'd1;
        #10;

        // signed overflow (positive + positive)
        a = 64'sh7FFFFFFFFFFFFFFF;
        b = 64'd1;
        #10;

    end

endmodule