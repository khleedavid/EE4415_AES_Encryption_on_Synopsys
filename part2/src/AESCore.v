module AESCore(
//from testbench
input clk,
input rstn,
input reg [127:0] plain_text,
input reg [127:0] cipher_key,
//from controller
input accept,
input [3:0] rndNo,
input enbSB,
input enbSR,
input enbMC,
input enbAR,
input enbKS,
//to testbench
output reg [127:0] cipher_text
);
////enter your code here
reg [127:0] buffer_cipher_in;
wire [127:0] buffer_cipher_out;

reg [127:0] buffer_text_A;
wire [127:0] buffer_text_B;
wire [127:0] buffer_text_C;
wire [127:0] buffer_text_D;
wire [127:0] buffer_text_E;

subBytes_top SB_top(
	.ip(buffer_text_A),
	.enable(enbSB),
	.op(buffer_text_B)
);
shiftRows_top SR_top(
	.ip(buffer_text_B),
	.enable(enbSR),
	.op(buffer_text_C)
);
MixCol_top MC_top(
	.ip(buffer_text_C),
	.enable(enbMC),
	.op(buffer_text_D)
);
//cipher_key is unchanged for rndNo = 0, and modified for rndNo 1 to 10
KeySchedule_top KS_top(
	.ip_key(buffer_cipher_in),
	.enable(enbKS),
	.rndNo(rndNo),
	.op_key(buffer_cipher_out)
);
//buffer_text_E is the output of AddRndKey, it needs to go into the next round if rndNo < 10
AddRndKey_top AR_top(
	.ip(buffer_text_D),
	.ip_key(buffer_cipher_out),
	.enable(enbAR),
	.op(buffer_text_E)
);
//when rndNo = 0, assign plaintext to buffertextA
//between rndNo 1 to 9, assign buffer_text_E(FROM ADDRNDKEY) to buffer_text_A

always @(posedge clk) begin
	 if(!rstn) begin
			buffer_text_A <= plain_text;
			buffer_cipher_in <= cipher_key;
			cipher_text <= 128'b0;
	 end
	else if (rndNo != 0) begin
		buffer_text_A <= buffer_text_E;
		buffer_cipher_in <= buffer_cipher_out;
		cipher_text <= buffer_text_E;
	end	
	else begin
	cipher_text <= buffer_text_E;
	end
end
always @(accept or rstn or plain_text or cipher_key) begin
	 if(accept && rstn) begin
			buffer_text_A <= plain_text;
			buffer_cipher_in <= cipher_key;
	 end
end

endmodule
