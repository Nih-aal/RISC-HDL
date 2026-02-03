// The following modules implement strictly less than operation - both signed and unsigned
// Saves 1 if true else 0

`include "adder_subtracter.v"

module strictly_less_than_uns (

    input [63:0] a,
    input [63:0] b,

    output [63:0] c

);

    wire [63:0] sub_out;
    wire mode, cout, not_used, cout_bar;
    buf b0 (mode, 1'b1); // mode = 1 for subtract

    add_sub_64bit instance1 (.a(a), .b(b), .mode(mode), .s(sub_out), .carry_flag(cout), .overflow_flag(not_used));

    // Whenever a valid non borrow subtraction happens,
    // cout = 1, therefore all we need to check is if cout = 0
    // If cout = 0 then less than is = true
    // Thus, c[0] = ~cout 

    not n0 (cout_bar, cout);
    buf b1 (c[0], cout_bar); 

    // other bits are made 0 - 

    genvar i;
    generate
        for (i = 1; i < 64; i = i + 1) begin : zero_fill
            buf bz (c[i], 1'b0);
        end
    endgenerate

endmodule

////////

module strictly_less_than_s (

    input [63:0] a,
    input [63:0] b,

    output [63:0] c

);

    wire [63:0] sub_out;
    wire mode, cout, overflow;
    buf b0 (mode, 1'b1); // mode = 1 for subtract

    add_sub_64bit instance1 (.a(a), .b(b), .mode(mode), .s(sub_out), .carry_flag(cout), .overflow_flag(overflow));

    // Normally it should be enough to see the msb
    // If the msb is 1 then a - b is negative or < 0 => a < b
    // However due to overflow the logic is modified
    // Whenever an overflow happens, the msb sign is corrected,
    // This is done by fliiping the msb by xoring with 1 as follows -

    xor x0 (c[0], overflow, sub_out[63]);

    // other bits are made 0 - 
    
    genvar i;
    generate
        for (i = 1; i < 64; i = i + 1) begin : zero_fill
            buf bz (c[i], 1'b0);
        end
    endgenerate

endmodule

