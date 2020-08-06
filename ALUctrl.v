module ALUctrl (input [5:0] opCode,
					input [5:0] funCode,
					output reg jumpr,
					output reg [3:0] code);

	
	always @(opCode, funCode) 
	begin
		jumpr = 0;
		if(opCode == 0)
			case(funCode)
				32: code = 1; 
				36: code = 0;
				26: code = 4;
				24: code = 3;
				39: code = 5;
				37: code = 6;
				34: code = 2; 		
				38: code = 9; 
				42: code = 10;
				0: code = 11;
				4: code = 7;
				3: code = 12;
				7: code = 8;
				8: jumpr = 1;
				default: code = 13;
			endcase
		else
			case(opCode)
				8: code = 1;
				35: code = 1;
				43: code = 1;
				12: code = 0;
				13: code = 6;
				14: code = 9;
				10: code = 10;
				4: code = 2;
				default: code = 13;
			endcase		
	end
endmodule