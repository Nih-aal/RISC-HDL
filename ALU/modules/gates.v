// XOR OR AND operations on 64 bit data

// Due to provided design constraints the following is being done 

module xor_1bit (

    input a,
    input b,

    output c

); 

    assign c = a ^ b;

endmodule

module xor_4bit (

    input [3:0] a,
    input [3:0] b,

    output [3:0] c

);

    xor_1bit instance1 (.a(a[0]), .b(b[0]), .c(c[0]));
    xor_1bit instance2 (.a(a[1]), .b(b[1]), .c(c[1]));
    xor_1bit instance3 (.a(a[2]), .b(b[2]), .c(c[2]));
    xor_1bit instance4 (.a(a[3]), .b(b[3]), .c(c[3]));

endmodule

module xor_16bit (

    input [15:0] a,
    input [15:0] b,

    output [15:0] c

);

    xor_4bit instance1 (.a(a[3:0]), .b(b[3:0]), .c(c[3:0]));
    xor_4bit instance2 (.a(a[7:4]), .b(b[7:4]), .c(c[7:4]));
    xor_4bit instance3 (.a(a[11:8]), .b(b[11:8]), .c(c[11:8]));
    xor_4bit instance4 (.a(a[15:12]), .b(b[15:12]), .c(c[15:12]));

endmodule

module xor_64bit (

    input [63:0] a,
    input [63:0] b,

    output [63:0] c

);

    xor_16bit instance1 (.a(a[15:0]), .b(b[15:0]), .c(c[15:0]));
    xor_16bit instance2 (.a(a[31:16]), .b(b[31:16]), .c(c[31:16]));
    xor_16bit instance3 (.a(a[47:32]), .b(b[47:32]), .c(c[47:32]));
    xor_16bit instance4 (.a(a[63:48]), .b(b[63:48]), .c(c[63:48]));

endmodule