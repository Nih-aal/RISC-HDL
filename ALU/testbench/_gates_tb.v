`timescale 1ns/1ps

module testbench;

    reg [63:0] a,b;

    wire [63:0] cxor;
    wire [63:0] cor;
    wire [63:0] cand;

    xor_64bit uut1 (.a(a), .b(b), .c(cxor)); 
    or_64bit uut2 (.a(a), .b(b), .c(cor));
    and_64bit uut3 (.a(a), .b(b), .c(cand));

    integer i;

    initial begin

        $dumpfile("GTK/gates64bit.vcd");
        $dumpvars(0, testbench);
        

        for (i = 0; i < 64; i = i + 1) begin
            
            a = 64'b1 << i;
            b = 64'b0;
            #5;

        end

        i = 0;
        for (i = 0; i < 64; i = i + 1) begin
        
            a = 64'b1 << i;
            b = 64'hFFFFFFFFFFFFFFFF;
            #5;
        
        end

    end
    
endmodule