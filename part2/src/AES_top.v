module AES_top #(N = 100)(
//from testbench
input clk,
input start,
input rstn,
input [128*N-1:0] plain_text,
input [128*N-1:0] cipher_key,
//to testbench
output done,
output [9:0] completed_round,
output [128*N-1:0] cipher_text
);
////enter your code here
wire accept;
wire [3:0]rndNo;
wire enbSB;
wire enbSR;
wire enbMC;
wire enbAR;
wire enbKS;

AEScntx cntx_top(
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
	.done(done),
	.completed_round(completed_round)
);
genvar i;
generate for (i = 0; i < N; i = i + 1) begin
AESCore core_top(
	.clk(clk),
	.rstn(rstn),
	//from AEStop
	.plain_text(plain_text[128*i+127 : 128*i]), 
	.cipher_key(cipher_key[128*i+127 : 128*i]),
	//from AEScntx
	.accept(accept),
	.rndNo(rndNo),
	.enbSB(enbSB),
	.enbSR(enbSR),
	.enbMC(enbMC),
	.enbAR(enbAR),
	.enbKS(enbKS),
	//to AEStop
	.cipher_text(cipher_text[128*i+127 : 128*i])
);
end endgenerate
endmodule
