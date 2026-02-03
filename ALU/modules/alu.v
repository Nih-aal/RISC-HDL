`include "barrel_shift.v"
`include "gates.v"
`include "less_than.v" // includes adder subtracter

module alu_64_bit (

    input [63:0] a,
    input [63:0] b,
    input [3:0] opcode,

    output reg [63:0] result,
    output reg cout,
    output reg carry_flag,
    output reg overflow_flag,
    output zero_flag

);
    wire [63:0] r_add, r_sll, r_slt, r_sltu, r_xor, r_srl, r_or, r_and, r_sub, r_sra;
    wire add_overflow, sub_overflow, add_cout, sub_cout;
    wire zero_flag_bar;

    add_sub_64bit instance1 (.a(a), .b(b), .mode(1'b0), .s(r_add), .carry_flag(add_cout), .overflow_flag(add_overflow));
            
    barrel_shifter_left instance2 (.data(a), ._shift(b), .out(r_sll));
            
    strictly_less_than_s instance3 (.a(a), .b(b), .c(r_slt));

    strictly_less_than_uns instance4 (.a(a), .b(b), .c(r_sltu));

    xor_64bit instance5 (.a(a), .b(b), .c(r_xor));

    barrel_shifter_right_logical instance6 (.data(a), ._shift(b), .out(r_srl));

    or_64bit instance7 (.a(a), .b(b), .c(r_or));

    and_64bit instance8 (.a(a), .b(b), .c(r_and));

    add_sub_64bit instance9 (.a(a), .b(b), .mode(1'b1), .s(r_sub), .carry_flag(sub_cout), .overflow_flag(sub_overflow));
        
    barrel_shifter_right_arithmetic instance10 (.data(a), ._shift(b), .out(r_sra));

    // zero flag

    // wire [63:0] temp_zeroflag;

    // strictly_less_than_uns instance11 (.a(result), .b(64'h0000000000000001), .c(temp_zeroflag));

    // buf b99 (zero_flag, temp_zeroflag[0]);


    or_64bit_itself zero_flag_ka_instance1 (.a(result), .out(zero_flag_bar));
    not zero_flag_ka_instance2 (zero_flag, zero_flag_bar);


    always @(*) begin

        result = 64'b0;
        carry_flag = 1'b0;
        overflow_flag = 1'b0;
        cout = 0;

        case (opcode)

            4'b0000: begin 

                result = r_add; 
                cout = add_cout; 
                carry_flag = add_cout; 
                overflow_flag = add_overflow;

            end
            4'b0001: result = r_sll;
            
            4'b0010: result = r_slt;

            4'b0011: result = r_sltu;

            4'b0100: result = r_xor;

            4'b0101: result = r_srl;

            4'b0110: result = r_or;

            4'b0111: result = r_and;
        
            4'b1000: begin

                 result = r_sub;
                 cout = sub_cout; 
                 carry_flag = sub_cout; 
                 overflow_flag = sub_overflow;
            
            end
            4'b1101: result = r_sra; 

        endcase

    end
endmodule