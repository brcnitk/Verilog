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

