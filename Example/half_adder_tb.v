module half_adder_tb;
	reg A, B; wire Sum, C_out;
	half_adder half_adder(A, B, Sum, C_out);
	initial
	begin
		A = 1'b0; B = 1'b0;
		#10 A = 1'b0; B = 1'b1;
		#10 A = 1'b1; B = 1'b0;
		#10 A = 1'b1; B = 1'b1;
	end
	initial 
	begin
		$dumpfile("half_adder.vcd");
		$dumpvars(0, half_adder_tb);
		$display("       Half Adder     ");
		$display("----------------------");
		$display("Time  A  B  Sum  Carry");
		$display("----------------------");
		$monitor("%4d %2b %2b %3b %5b", $time, A, B, Sum, C_out);
		#500 $finish;
	end
endmodule

