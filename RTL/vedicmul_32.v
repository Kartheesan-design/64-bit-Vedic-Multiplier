module vedicmul_32(a, b, s);
    input  [31:0] a, b;
    output [63:0] s;

    wire [31:0] q0, q1, q2, q3;
    wire [63:0] sum1, sum2;

    vedicmul_16 m0 (.a(a[15:0]),  .b(b[15:0]),  .s(q0));  // AL x BL
    vedicmul_16 m1 (.a(a[31:16]), .b(b[15:0]),  .s(q1));  // AH x BL
    vedicmul_16 m2 (.a(a[15:0]),  .b(b[31:16]), .s(q2));  // AL x BH
    vedicmul_16 m3 (.a(a[31:16]), .b(b[31:16]), .s(q3));  // AH x BH

    assign sum1 = {32'b0, q0} + {q1, 16'b0} + {q2, 16'b0};
    assign sum2 = {q3, 32'b0} + sum1;
    assign s    = sum2;

endmodule
