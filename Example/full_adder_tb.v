module full_adder_tb;
	reg A, B, C_in; wire Sum, C_out;
	full_adder test(A, B, C_in, Sum, C_out);
	initial
	begin
		A = 1'b0; B = 1'b0; C_in = 1'b0;
		#10 A = 1'b0; B = 1'b1;
		#20 B = 1'b1; B = 1'b0;
		#30 A = 1'b1; B = 1'b1;
		#50 $finish;
	end
	initial 
	begin
		$dumpfile("full_adder.vcd");
		$dumpvars(0, full_adder_tb);
		$display("         Full Adder        ");
		$display("---------------------------");
		$display("Time  A  B  C_in  Sum  Carry");
		$display("---------------------------");
		$monitor("%4d %2b %2b %3b %5b %4b", $time, A, B, C_in, Sum, C_out);
	end
endmodule

