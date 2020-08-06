module PC(input clock, reset,
			input [31:0] curr,
			output reg [31:0] next);

	
	always @(posedge clock) begin
		if (reset == 1) 
			next = 0;
		else 
			next = curr + 4; 
	end
endmodule