module vedicmul_16(a, b, s);
    input  [15:0] a, b;
    output [31:0] s;

    wire [15:0] q0, q1, q2, q3;
    wire [31:0] sum1, sum2;

    vedicmul_8 m0 (.a(a[7:0]),  .b(b[7:0]),  .s(q0));  // AL x BL
    vedicmul_8 m1 (.a(a[15:8]), .b(b[7:0]),  .s(q1));  // AH x BL
    vedicmul_8 m2 (.a(a[7:0]),  .b(b[15:8]), .s(q2));  // AL x BH
    vedicmul_8 m3 (.a(a[15:8]), .b(b[15:8]), .s(q3));  // AH x BH

    assign sum1 = {16'b0, q0} + {q1, 8'b0} + {q2, 8'b0};
    assign sum2 = {q3, 16'b0} + sum1;
    assign s    = sum2;

endmodule
