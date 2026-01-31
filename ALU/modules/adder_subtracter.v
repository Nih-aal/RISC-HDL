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

