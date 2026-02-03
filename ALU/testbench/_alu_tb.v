`timescale 1ns/1ps

module alu_64_bit_tb;

    reg [63:0] a, b;
    reg [3:0] opcode;
    wire [63:0] result;
    wire cout, carry_flag, overflow_flag, zero_flag;

    // Instantiate the ALU wrapper
    alu_64_bit uut(
        .a(a),
        .b(b),
        .opcode(opcode),
        .result(result),
        .cout(cout),
        .carry_flag(carry_flag),
        .overflow_flag(overflow_flag),
        .zero_flag(zero_flag)
    );


initial begin

    $dumpfile("GTK/alu.vcd");
    $dumpvars(0, alu_64_bit_tb);
    
    // Gpt generated testcases 

    // -------------------------
    // ADD
    // opcode = 0000
    // -------------------------
    opcode = 4'b0000;

    // 5 + 10 = 15
    a = 64'd5;
    b = 64'd10;
    #10;

    // max + 1 -> overflow
    a = 64'sh7FFFFFFFFFFFFFFF;
    b = 64'd1;
    #10;

    // -------------------------
    // SUB
    // opcode = 1000
    // -------------------------
    opcode = 4'b1000;

    // 10 - 5 = 5
    a = 64'd10;
    b = 64'd5;
    #10;

    // 5 - 10 = -5
    a = 64'd5;
    b = 64'd10;
    #10;

    // -------------------------
    // SLL (shift left logical)
    // opcode = 0001
    // -------------------------
    opcode = 4'b0001;

    a = 64'h1;
    b = 64'd3;   // shift by 3
    #10;

    // -------------------------
    // SRL (shift right logical)
    // opcode = 0101
    // -------------------------
    opcode = 4'b0101;

    a = 64'h8000000000000000;
    b = 64'd4;
    #10;

    // -------------------------
    // SRA (shift right arithmetic)
    // opcode = 1101
    // -------------------------
    opcode = 4'b1101;

    a = -64'sd8;
    b = 64'd1;
    #10;

    // -------------------------
    // SLT (signed)
    // opcode = 0010
    // -------------------------
    opcode = 4'b0010;

    // -5 < 3 -> true
    a = -64'sd5;
    b = 64'sd3;
    #10;

    // 5 < -3 -> false
    a = 64'sd5;
    b = -64'sd3;
    #10;

    // -------------------------
    // SLTU (unsigned)
    // opcode = 0011
    // -------------------------
    opcode = 4'b0011;

    // 1 < max -> true
    a = 64'd1;
    b = 64'hFFFFFFFFFFFFFFFF;
    #10;

    // max < 1 -> false
    a = 64'hFFFFFFFFFFFFFFFF;
    b = 64'd1;
    #10;

    // -------------------------
    // XOR
    // opcode = 0100
    // -------------------------
    opcode = 4'b0100;

    a = 64'hAAAA_AAAA_AAAA_AAAA;
    b = 64'h5555_5555_5555_5555;
    #10;

    // -------------------------
    // OR
    // opcode = 0110
    // -------------------------
    opcode = 4'b0110;

    a = 64'h0000_0000_0000_0001;
    b = 64'h0000_0000_0000_0010;
    #10;

    // -------------------------
    // AND
    // opcode = 0111
    // -------------------------
    opcode = 4'b0111;

    a = 64'hF0F0_F0F0_F0F0_F0F0;
    b = 64'h0F0F_0F0F_0F0F_0F0F;
    #10;

    // -------------------------
    // ZERO FLAG CHECK
    // -------------------------
    opcode = 4'b0000;

    // 5 - 5 = 0 → zero_flag must be 1
    a = 64'd5;
    b = -64'd5;
    #10;

    $finish;
end

endmodule