`timescale 1ns/1ps

module testbench;

    reg [15:0] a,b;
    reg cin, mode;

    wire [15:0] s;
    wire cout;

    adder_16bit uut (.a(a), .b(b), .cin(cin), .s(s), .cout(cout), .mode(mode));

    initial begin
    
        $dumpfile("GTK/adder16bit.vcd");
        $dumpvars(0, testbench);

        mode = 1;
        cin = 1;

        a = 16'b0000000000000010; b = 16'b0000000000000001;
        #10;

        a = 16'b0000000000000001; b = 16'b0000000000000010;
        #10;

        mode = 0;
        cin = 0;

        cin = 0; a = 16'b0011111111111111; b = 16'b0011111111111111;
        #10;

        cin = 1; a = 16'b0011111111111111; b = 16'b0011111111111100;
        #10;
    
        $finish;

    end

endmodule