// XOR OR AND operations on 64 bit data

// Due to provided design constraints the following is being done 


module xor_4bit (

    input [3:0] a,
    input [3:0] b,

    output [3:0] c

);

    xor instance1 (c[0], b[0], a[0]);
    xor instance2 (c[1], b[1], a[1]);
    xor instance3 (c[2], b[2], a[2]);
    xor instance4 (c[3], b[3], a[3]);

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

/////////////////////////////////////////////////////////////////////////////////////////////////////

module or_4bit (

    input [3:0] a,
    input [3:0] b,

    output [3:0] c

);

    or instance1 (c[0], b[0], a[0]);
    or instance2 (c[1], b[1], a[1]);
    or instance3 (c[2], b[2], a[2]);
    or instance4 (c[3], b[3], a[3]);

endmodule

module or_16bit (

    input [15:0] a,
    input [15:0] b,

    output [15:0] c

);

    or_4bit instance1 (.a(a[3:0]), .b(b[3:0]), .c(c[3:0]));
    or_4bit instance2 (.a(a[7:4]), .b(b[7:4]), .c(c[7:4]));
    or_4bit instance3 (.a(a[11:8]), .b(b[11:8]), .c(c[11:8]));
    or_4bit instance4 (.a(a[15:12]), .b(b[15:12]), .c(c[15:12]));

endmodule

module or_64bit (

    input [63:0] a,
    input [63:0] b,

    output [63:0] c

);

    or_16bit instance1 (.a(a[15:0]), .b(b[15:0]), .c(c[15:0]));
    or_16bit instance2 (.a(a[31:16]), .b(b[31:16]), .c(c[31:16]));
    or_16bit instance3 (.a(a[47:32]), .b(b[47:32]), .c(c[47:32]));
    or_16bit instance4 (.a(a[63:48]), .b(b[63:48]), .c(c[63:48]));

endmodule

/////////////////////////////////////////////////////////////////////////////////////////////////////

module and_4bit (

    input [3:0] a,
    input [3:0] b,

    output [3:0] c

);

    and instance1 (c[0], b[0], a[0]);
    and instance2 (c[1], b[1], a[1]);
    and instance3 (c[2], b[2], a[2]);
    and instance4 (c[3], b[3], a[3]);

endmodule

module and_16bit (

    input [15:0] a,
    input [15:0] b,

    output [15:0] c

);

    and_4bit instance1 (.a(a[3:0]), .b(b[3:0]), .c(c[3:0]));
    and_4bit instance2 (.a(a[7:4]), .b(b[7:4]), .c(c[7:4]));
    and_4bit instance3 (.a(a[11:8]), .b(b[11:8]), .c(c[11:8]));
    and_4bit instance4 (.a(a[15:12]), .b(b[15:12]), .c(c[15:12]));

endmodule

module and_64bit (

    input [63:0] a,
    input [63:0] b,

    output [63:0] c

);

    and_16bit instance1 (.a(a[15:0]), .b(b[15:0]), .c(c[15:0]));
    and_16bit instance2 (.a(a[31:16]), .b(b[31:16]), .c(c[31:16]));
    and_16bit instance3 (.a(a[47:32]), .b(b[47:32]), .c(c[47:32]));
    and_16bit instance4 (.a(a[63:48]), .b(b[63:48]), .c(c[63:48]));

endmodule






