module AES_top#(N=4)(
//from testbench
input clk,
input start,
input rstn,
input [127:0] plain_text,
input [127:0] cipher_key,
//to testbench
output done,
output [127:0] cipher_text
);
////enter your code here

//take in N inputs at start, and pass each input down a set of registers on each negedge clock.
// round 0//0 | 0 | 0 | 0
// round 1//1 | 0 | 0 | 0
// round 2//2 | 1 | 0 | 0
// round 3//3 | 2 | 1 | 0
// round 4//4 | 3 | 2 | 1 //after 4 signals input begins
// Q: how do we track when a signal is ready for output? done signal must know how to assert for N cycles in aes_cntx
// Q: how do we insert 4 signals behind each other in the same cycle? insert N registers in the main path and in every loop

wire accept;
wire [3:0]rndNo;
wire enbSB;
wire enbSR;
wire enbMC;
wire enbAR;
wire enbKS;

AEScntx #(N) cntx_top(
	.clk(clk),
	.start(start),
	.rstn(rstn),
	//to AEScore
	.accept(accept),
	.rndNo(rndNo),
	.enbSB(enbSB),
	.enbSR(enbSR),
	.enbMC(enbMC),
	.enbAR(enbAR),
	.enbKS(enbKS),
	//to AEStop
	.done(done)
);

AESCore #(N) core_top(
	.clk(clk),
	.rstn(rstn),
	//from AEStop
	.plain_text(plain_text), 
	.cipher_key(cipher_key),
	//from AEScntx
	.accept(accept),
	.rndNo(rndNo),
	.enbSB(enbSB),
	.enbSR(enbSR),
	.enbMC(enbMC),
	.enbAR(enbAR),
	.enbKS(enbKS),
	//to AEStop
	.cipher_text(cipher_text)
);

endmodule
