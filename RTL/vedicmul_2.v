module vedicmul_2(a, b, s);
    input  [1:0] a, b;
    output [3:0] s;

    wire w, x, y, z;

    assign s[0] = a[0] & b[0];
    assign w    = a[1] & b[0];
    assign x    = a[0] & b[1];
    assign y    = a[1] & b[1];

    assign s[1] = w ^ x;
    assign z    = w & x;

    assign s[2] = y ^ z;
    assign s[3] = y & z;

endmodule
