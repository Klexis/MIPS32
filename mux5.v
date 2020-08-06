module mux5 (input [4:0] op0, op1,
			 input choice,
			 output reg[4:0] res);
	
	always @(*) 
	begin
		case (choice)
			0: res = op0;
			1: res = op1;
		endcase
	end
endmodule