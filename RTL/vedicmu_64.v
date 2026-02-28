module vedicmul_64(a, b, s);
    input  [63:0]  a, b;
    output [127:0] s;

    wire [63:0]  q0, q1, q2, q3;
    wire [127:0] sum1, sum2;

    vedicmul_32 m0 (.a(a[31:0]),  .b(b[31:0]),  .s(q0));  // AL x BL
    vedicmul_32 m1 (.a(a[63:32]), .b(b[31:0]),  .s(q1));  // AH x BL
    vedicmul_32 m2 (.a(a[31:0]),  .b(b[63:32]), .s(q2));  // AL x BH
    vedicmul_32 m3 (.a(a[63:32]), .b(b[63:32]), .s(q3));  // AH x BH

    assign sum1 = {64'b0, q0} + {q1, 32'b0} + {q2, 32'b0};
    assign sum2 = {q3, 64'b0} + sum1;
    assign s    = sum2;

endmodule
