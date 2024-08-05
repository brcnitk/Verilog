module full_adder(A, B, C_in, Sum, C_out);
	input A, B, C_in;
	output Sum, C_out;	

	// Structural Modelling
	wire S1, C1, C2;
	half_adder HA1(A, B, S1, C1), HA2(S1, C_in, Sum, C2);
	or (C_out, C1, C2);
	
endmodule

module half_adder(A, B, Sum, C_out);
	input A, B;
	output Sum, C_out;
	
	/*
	// Structural Modelling
	wire temp;
	xor (Sum, A, B);
	nand (temp, A, B);
	not (C_out, temp);
	*/

	/*
	// Dataflow Modelling
	assign {C_out, Sum} = A + B; 
	*/

	// Behavioral Modelling
	reg Sum, C_out;
	always @ (A or B)
	begin
		if (A == 0 && B == 0)
		begin
			Sum = 0;
			C_out = 0;
		end 
		else if (A == 1 && B == 1)
		begin
			Sum = 0;
			C_out = 1;
		end
		else
		begin
			Sum = 1;
			C_out = 0;
		end
	end
endmodule
	

