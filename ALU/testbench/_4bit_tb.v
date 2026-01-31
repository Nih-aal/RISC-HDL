`timescale 1ms/1ps

module testbench;

    reg [3:0] a,b;
    reg cin;

    wire [3:0] s;
    wire cout;

    adder_4bit uut (.a(a), .b(b), .cin(cin), .s(s), .cout(cout));

    initial begin
    
        $dumpfile("GTK/adder4bit.vcd");
        $dumpvars(0, testbench);

        cin = 0; a = 4'b0001; b = 4'b0001;
        #10;

        cin = 1; a = 4'b0010; b = 4'b0001;
        #10;

        cin = 0; a = 4'b1111; b = 4'b1111;
        #10;

        cin = 1; a = 4'b1111; b = 4'b1111;
        #10; 
    
        $finish;

    end

endmodule