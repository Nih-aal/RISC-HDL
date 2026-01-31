// Basic 64 bit ripple adder/subtracter circuit

module adder_1bit (
    
    input a,
    input b,
    input cin,
    output s,
    output cout

);

    wire P;
    assign P = a ^ b;
    assign s = (P) ^ cin;
    assign cout = (a & b) | (cin & P);

endmodule

module adder_4bit (

    input [3:0] a,
    input [3:0] b,
    input cin,

    output [3:0] s,
    output cout

);

    wire [2:0] c;

    adder_1bit bit0 (.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(c[0]));
    adder_1bit bit1 (.a(a[1]), .b(b[1]), .cin(c[0]), .s(s[1]), .cout(c[1]));
    adder_1bit bit2 (.a(a[2]), .b(b[2]), .cin(c[1]), .s(s[2]), .cout(c[2]));
    adder_1bit bit3 (.a(a[3]), .b(b[3]), .cin(c[2]), .s(s[3]), .cout(cout));

endmodule

module adder_16bit (
    
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] s,
    output cout

);

    wire [2:0] c;

    adder_4bit instance1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .s(s[3:0]), .cout(c[0]));
    adder_4bit instance2 (.a(a[7:4]), .b(b[7:4]), .cin(c[0]), .s(s[7:4]), .cout(c[1]));
    adder_4bit instance3 (.a(a[11:8]), .b(b[11:8]), .cin(c[1]), .s(s[11:8]), .cout(c[2]));
    adder_4bit instance4 (.a(a[15:12]), .b(b[15:12]), .cin(c[2]), .s(s[15:12]), .cout(cout));

endmodule

module adder_64bit (
    
    input [63:0] a,
    input [63:0] b,
    input cin,
    output [63:0] s,
    output cout

);

    wire [2:0] c;

    adder_16bit instance1 (.a(a[15:0]), .b(b[15:0]), .cin(cin), .s(s[15:0]), .cout(c[0]));
    adder_16bit instance2 (.a(a[31:16]), .b(b[31:16]), .cin(c[0]), .s(s[31:16]), .cout(c[1]));
    adder_16bit instance3 (.a(a[47:32]), .b(b[47:32]), .cin(c[1]), .s(s[47:32]), .cout(c[2]));
    adder_16bit instance4 (.a(a[63:48]), .b(b[63:48]), .cin(c[2]), .s(s[63:48]), .cout(cout));

endmodule
