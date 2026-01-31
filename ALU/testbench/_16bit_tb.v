`timescale 1ms/1ps

module testbench;

    reg [15:0] a,b;
    reg cin;

    wire [15:0] s;
    wire cout;

    adder_16bit uut (.a(a), .b(b), .cin(cin), .s(s), .cout(cout));

    initial begin
    
        $dumpfile("GTK/adder16bit.vcd");
        $dumpvars(0, testbench);

        cin = 0; a = 8'b00010001; b = 8'b10001000;
        #10;

        cin = 1; a = 8'b00010001; b = 8'b10001000;
        #10;

        cin = 0; a = 16'b1111111111111111; b = 16'b1111111111111111;
        #10;

        cin = 1; a = 16'b1111111111111111; b = 16'b1111111111111111;
        #10;
    
        $finish;

    end

endmodule