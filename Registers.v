module Reg(input clock, wP, jumpr,
				input [4:0] rs, rt, rd,
				input [31:0] rdv,
				output [31:0] rsv, rtv);

	reg [31:0] regMem [0:31];
	assign rtv = regMem[rt];
	assign rsv = regMem[rs];
	always @(posedge clock)
	begin
		if(wP==1 && jumpr ==0)
			regMem[rd] = rdv;
	end
endmodule