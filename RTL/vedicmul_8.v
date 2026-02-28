module vedicmul_8(a, b, s);
    input  [7:0]  a, b;
    output [15:0] s;

    wire [7:0]  q0, q1, q2, q3;
    wire [15:0] sum1, sum2;

    vedicmul_4 m0 (.a(a[3:0]), .b(b[3:0]), .s(q0));  // AL x BL
    vedicmul_4 m1 (.a(a[7:4]), .b(b[3:0]), .s(q1));  // AH x BL
    vedicmul_4 m2 (.a(a[3:0]), .b(b[7:4]), .s(q2));  // AL x BH
    vedicmul_4 m3 (.a(a[7:4]), .b(b[7:4]), .s(q3));  // AH x BH

    assign sum1 = {8'b00000000, q0} + {q1, 4'b0000} + {q2, 4'b0000};
    assign sum2 = {q3, 8'b00000000} + sum1;
    assign s    = sum2;

endmodule

