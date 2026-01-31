`timescale 1ns/1ps

module testbench;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    reg mode;

    wire [3:0] s;
    wire cout;

    adder_4bit uut (.a(a), .b(b), .cin(cin), .s(s), .cout(cout), .mode(mode));

    initial begin
    
        $dumpfile("GTK/adder4bit.vcd");
        $dumpvars(0, testbench);

        mode = 1;
        cin = 1;

        a = 4'b0001; b = 4'b0010;
        #10;

        a = 4'b0010; b = 4'b0001;
        #10;

        a = 4'b0111; b = 4'b0111;
        #10;

        mode = 0;
        cin = 0;

        a = 4'b0001; b = 4'b0001;
        #10;

        a = 4'b0010; b = 4'b0001;
        #10;
    
        $finish;

    end

endmodule