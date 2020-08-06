`include "PC.v"
`include "insMem.v"
`include "Control.v"
`include "mux32.v"
`include "mux5.v"
`include "Registers.v"
`include "extend.v"
`include "ALU.v"
`include "ALUctrl.v"
`include "dataMem.v"

module cpu(input clock, reset);

	wire outReg, wP, i2, regI, mrP, mwP, branch, jumpr, zero;
	wire [31:0] curr, next;
	wire [4:0] out_reg;
	wire [3:0] code;
	wire [31:0] ins, rsv, rtv, wd_reg, extended, ai2, aluOut, rd_mem, npAdd1, npAdd2;

	PC pc(.clock(clock), .reset(reset),.curr(curr), .next(next));

	insMem insmem(.clock(clock), .address(curr), .instruction(ins));

	Control control(.opCode(ins[31:26]), .outReg(outReg), .wP(wP), .i2(i2), .regI(regI), .mrP(mrP), .mwP(mwP), .branch(branch));

	Reg regs(.clock(clock),.jumpr(jumpr),.wP(wP),.rs(ins[25:21]),.rt(ins[20:16]),.rd(out_reg),.rsv(rsv),.rtv(rtv),.rdv(wd_reg));

	extend ext(.ins15_0(ins[15:0]), .extended(extended));

	ALUctrl getCode(.opCode(ins[31:26]), .funCode(ins[5:0]), .jumpr(jumpr), .code(code));

	ALU alu(.code(code),.i1(rsv),.i2(ai2),.out(aluOut),.zero(zero));

	ALU alu1(.code(4'b0001),.i1(next),.i2(extended<<2),.out(npAdd1));

	dataMem datam(.clock(clock),.target(aluOut),.wP(mwP),.rP(mrP),.writeData(rtv),.readData(rd_mem));

	mux5 mux1(.op0(ins[20:16]),.op1(ins[15:11]),.choice(outReg), .res(out_reg));

	mux32 mux3(.op0(next),.op1(npAdd1),.choice(branch & zero),.res(npAdd2));

	mux32 mux2(.op0(rtv),.op1(extended),.choice(i2),.res(ai2));

	mux32 mux4(.op0(npAdd2),.op1(rsv),.choice(jumpr),.res(curr));

	mux32 mux5(.op0(aluOut),.op1(rd_mem),.choice(regI),.res(wd_reg)); 

endmodule