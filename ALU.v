module ALU (input [3:0] code, 
			input [31:0] i1, i2,
			input [4:0] sAmt, 
			output reg [31:0] out,
			output zero);
	 

	always @(code, i1, i2) begin
		case (code)
			0: out = i1 & i2;
			1: out = i1 + i2;
			2: out = i1 - i2;
			3: out = i1 * i2;
			4: out = i1 / i2;
			5: out = ~(i1 | i2);
			6: out = i1 | i2;
			7: out = i1 << i2;
			8: out = i1 >> i2;
			9: out = i1 ^ i2;
			10: out = (i1 < i2) ? 1 : 0; 
			11: out = i1 << sAmt;
			12: out = i1 >> sAmt;
			default: out = 0;
		endcase
	end

	assign zero = (out == 0);
	
endmodule