module extend (input [15:0] ins15_0, 
					output reg [31:0]extended);

	
	always @(ins15_0) begin
		extended = ins15_0;
	end
endmodule
