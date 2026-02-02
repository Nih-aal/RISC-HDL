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