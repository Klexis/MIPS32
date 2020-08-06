module Control(
	input [5:0] opCode,
	output reg outReg, wP, i2, regI, mrP, mwP, branch);

// type       0       1
// outReg     rt      rd
// i2         reg     imm
// regI       ALU     Mem

	always @(*) 
	begin
		case(opCode)
			0: 
			begin
				outReg = 1;
				wP = 1;
				i2 = 0;
				regI = 0;
				mrP = 0;
				mwP = 0;
				branch = 0;
			end
			4: 
			begin
				outReg = 1;
				wP = 0;
				i2 = 0;
				regI = 0;
				mrP = 0;
				mwP = 0;
				branch = 1;
			end
			8: 
			begin
				outReg = 1;
				wP = 1;
				i2 = 1;
				regI = 0;
				mrP = 0;
				mwP = 0;
				branch = 0;
			end
			12: 
			begin
				outReg = 1;
				wP = 1;
				i2 = 1;
				regI = 0;
				mrP = 0;
				mwP = 0;
				branch = 0;
			end
			13: 
			begin
				outReg = 1;
				wP = 1;
				i2 = 1;
				regI = 0;
				mrP = 0;
				mwP = 0;
				branch = 0;
			end
			10: 
			begin
				outReg = 1;
				wP = 1;
				i2 = 1;
				regI = 0;
				mrP = 0;
				mwP = 0;
				branch = 0;
			end
			14: 
			begin
				outReg = 1;
				wP = 1;
				i2 = 1;
				regI = 0;
				mrP = 0;
				mwP = 0;
				branch = 0;
			end
			43:
			begin
				outReg = 1;
				wP = 0;
				i2 = 1;
				regI = 0;
				mrP = 0;
				mwP = 1;
				branch = 0;
			end
			35:
			begin
				outReg = 0;
				wP = 1;
				i2 = 1;
				regI = 1;
				mrP = 1;
				mwP = 0;
				branch = 0;
			end
			2:
			begin
				outReg = 0;
				wP = 0;
				i2 = 1;
				regI = 1;
				mrP = 0;
				mwP = 0;
				branch = 0;
			end
		endcase
	end
endmodule