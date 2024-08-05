module gate_nand_tb;
	reg A, B; wire Y;
	gate_nand nand_gate(A, B, Y);
	initial
	begin
		A = 1'b0; B = 1'b0;
		#10 A = 1'b1;
		#10 B = 1'b1;
		#10 A = 1'b0;
		#10 $finish;
	end
	initial 
	begin
		$dumpfile("gate_nand.vcd");
		$dumpvars(0, gate_nand_tb);
		$display("----NAND Gate Truth Table----");
		$display("-----------------------------");
		$display("Time       A        B    A~&B");
    	$display("-----------------------------");
		$monitor("%4d    %4b      %3b     %1b", $time, A, B, Y);
	end
endmodule

