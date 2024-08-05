module gate_nand(A, B, Y);
	input A, B;
	output Y;

	/*
	// Structural Modelling
	nand (Y, A, B);
	*/

	/*
	// Dataflow Modelling
	assign Y = ~(A & B);
	*/

	
	// Behavioral Modelling
	reg Y;
	always @ (A or B)
	begin
		if (A == 1 && B == 1)
			Y = 0;
		else
			Y = 1;
	end


endmodule
