module AES_top(
//from testbench
input  clk,
input  start,
input  rstn,
input [127:0] plain_text,//16byte==128bit, first byte is [127:120]
input [127:0] cipher_key,
//to testbench
output done,
output [9:0] completed_round,
output [127:0] cipher_text
);
////enter your code here

//send to AESCore: cipher_key, plain_text
//send to AEScntx: start

//take first plain_text XOR cipher_key => cipher_text [done]
//mixing x 9:
////subbytes: for each cipher_text[i], op[i] = ip[cipher_text[i]] [done]
////shiftrows: split op into 4 arrays 0-31|32-63|64-95|96-127, reg0123 rotate each row by its row number,recombine into op [done]
////mixcolumns: split op into 4 arrays 0,4,8,12|				//     1,5,9,13|				//     2,6,10,14|				//     3,7,11,15|
//matrix mult each array w rijndael galois matrix, recombine arrays to op [done]
////addrndkey: xor each op col w rndkey 
//** at last mix don't add mixcol
//keyschedule: generate rndkey from cipherkey
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

AESCore core_top(
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
