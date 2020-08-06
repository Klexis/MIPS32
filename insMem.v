module insMem(input clock, 
				input [31:0] address, 
				output reg [31:0] instruction);

	
	reg [31:0] inMem [0:255];
	
	initial 
	begin
		$readmemh("instructionList.txt", inMem, 0, 21);
	end
	
	always @(posedge clock) 
	begin
		instruction = inMem[address];
	end
endmodule