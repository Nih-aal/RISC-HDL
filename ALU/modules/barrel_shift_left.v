module mux_2x1 (

    input m0,
    input m1,
    input s,

    output y

);
    wire s_bar, or1, or2;

    not n0 (s_bar, s);
    and a0 (or1, s_bar, m0);
    and a1 (or2, s, m1);
    or o0 (y, or1, or2);


endmodule



module barrel_shifter_left (

    input [63:0] data,
    input [63:0] _shift, 

    // Reason for masking to only 6 bits - https://www.reddit.com/r/cpp/comments/1ow3g9y/cursed_arithmetic_left_shifts/

    output [63:0] out

);
    // masking

    wire [5:0] shift;

    buf b0 (shift[0], _shift[0]);
    buf b1 (shift[1], _shift[1]);
    buf b2 (shift[2], _shift[2]);
    buf b3 (shift[3], _shift[3]);
    buf b4 (shift[4], _shift[4]);
    buf b5 (shift[5], _shift[5]);


    wire [63:0] layer1;

    genvar i;

    generate

        for (i = 1; i < 64; i = i + 1) begin : mux_col0_hi
            
            mux_2x1 m (.m0(data[i]), .m1(data[i-1]), .s(shift[0]), .y(layer1[i]));

        end

    endgenerate

    mux_2x1 mux_col0_row0 (.m0(data[0]), .m1(1'b0), .s(shift[0]), .y(layer1[0]));

    ////////

    wire [63:0] layer2;

    generate

        for (i = 2; i < 64; i = i + 1) begin : mux_col1_hi
            
            mux_2x1 m (.m0(layer1[i]), .m1(layer1[i-2]), .s(shift[1]), .y(layer2[i]));

        end

    endgenerate

    mux_2x1 mux_col1_row1 (.m0(layer1[1]), .m1(1'b0), .s(shift[1]), .y(layer2[1]));
    mux_2x1 mux_col1_row0 (.m0(layer1[0]), .m1(1'b0), .s(shift[1]), .y(layer2[0]));
    
    ////////

    wire [63:0] layer3;

    generate

        for (i = 4; i < 64; i = i + 1) begin : mux_col2_hi
            
            mux_2x1 m (.m0(layer2[i]), .m1(layer2[i-4]), .s(shift[2]), .y(layer3[i]));

        end

    endgenerate

    generate

        for (i = 0; i < 4; i = i + 1) begin : mux_col2_lo
            
            mux_2x1 m (.m0(layer2[i]), .m1(1'b0), .s(shift[2]), .y(layer3[i]));

        end

    endgenerate

    ////////

    wire [63:0] layer4;

    generate

        for (i = 8; i < 64; i = i + 1) begin : mux_col3_hi
            
            mux_2x1 m (.m0(layer3[i]), .m1(layer3[i-8]), .s(shift[3]), .y(layer4[i]));

        end

    endgenerate

    generate

        for (i = 0; i < 8; i = i + 1) begin : mux_col3_lo
            
            mux_2x1 m (.m0(layer3[i]), .m1(1'b0), .s(shift[3]), .y(layer4[i]));

        end

    endgenerate

    ////////

    wire [63:0] layer5;

    generate

        for (i = 16; i < 64; i = i + 1) begin : mux_col4_hi
            
            mux_2x1 m (.m0(layer4[i]), .m1(layer4[i-16]), .s(shift[4]), .y(layer5[i]));

        end

    endgenerate

    generate

        for (i = 0; i < 16; i = i + 1) begin : mux_col4_lo
            
            mux_2x1 m (.m0(layer4[i]), .m1(1'b0), .s(shift[4]), .y(layer5[i]));

        end

    endgenerate

    ////////

    // Last layer woohooo!

    generate

        for (i = 32; i < 64; i = i + 1) begin : mux_col5_hi
            
            mux_2x1 m (.m0(layer5[i]), .m1(layer5[i-32]), .s(shift[5]), .y(out[i]));

        end

    endgenerate

    generate

        for (i = 0; i < 32; i = i + 1) begin : mux_col5_lo
            
            mux_2x1 m (.m0(layer5[i]), .m1(1'b0), .s(shift[5]), .y(out[i]));

        end

    endgenerate

endmodule