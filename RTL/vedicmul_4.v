module vedicmul_4(a,b,s);

	    input [3:0]a,b;
	    output [7:0]s;
	
	    wire [3:0] q0, q1, q2, q3;
	    wire [7:0] sum1, sum2;

	   
	    vedicmul_2 m0 (.a(a[1:0]), .b(b[1:0]), .s(q0)); 
	    vedicmul_2 m1 (.a(a[3:2]), .b(b[1:0]), .s(q1));  
	    vedicmul_2 m2 (.a(a[1:0]), .b(b[3:2]), .s(q2)); 
	    vedicmul_2 m3 (.a(a[3:2]), .b(b[3:2]), .s(q3)); 

	    
	    assign sum1 = {q1, 2'b00} + {q2, 2'b00} + {4'b0000, q0};
	    assign sum2 = {q3, 4'b0000} + sum1;
	    assign s = sum2;
endmodule
