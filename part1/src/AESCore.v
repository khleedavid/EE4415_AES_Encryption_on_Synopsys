module AESCore(
//from testbench
input  clk,
input  rstn,
//from AEStop
input [127:0] plain_text, 
input [127:0] cipher_key,
//from AEScntx
input  accept,
input  [3:0] rndNo,
input  enbSB,
input  enbSR,
input  enbMC,
input  enbAR,
input  enbKS,
//to AEStop
output reg [127:0] cipher_text
);
////enter your code here
reg [127:0] buffer_cipher_in;	//wire into keyschedule
reg [127:0] buffer_cipher_comb; //wire for multiplexer for keyschedule
wire [127:0] buffer_cipher_out;	//wire output keyschedule

reg [127:0] buffer_text_A;	//wire into subBytes_top
reg [127:0] buffer_text_A_comb;	//wire into multiplexer for subBytes_top
wire [127:0] buffer_text_B;	//wire into shiftRows_top
wire [127:0] buffer_text_C;	//wire into MixCol_top
wire [127:0] buffer_text_D;	//wire into AddRndKey_top
wire [127:0] buffer_text_E;	//wire into register for timing

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
always @(posedge clk) begin //register for buffer_text_A
	if (!rstn) begin
		buffer_text_A_comb <= plain_text;
	end
	else if (rndNo!= 0) begin
		buffer_text_A_comb <= buffer_text_E;
	end
end
always @(*) begin	//combinational multiplexer for buffer_text_A
	 if(accept && rstn) begin
		buffer_text_A <= plain_text;
	 end
	 else
		buffer_text_A <= buffer_text_A_comb;
end

always @(posedge clk) begin //register for buffer_cipher_in
	if (!rstn) begin
		buffer_cipher_comb <= cipher_key;
	end
	else if (rndNo!= 0) begin 
		buffer_cipher_comb <= buffer_cipher_out;
	end
end
always @(*) begin
	 if(accept && rstn) begin //combinational multiplexer for buffer_cipher_in
		buffer_cipher_in <= cipher_key;
	 end
	 else
		buffer_cipher_in <= buffer_cipher_comb;
end
always @(posedge clk) begin //register for cipher_text
	if(!rstn) begin
		cipher_text <= 128'b0;
	end
	else begin
		cipher_text <= buffer_text_E;
	end
end


endmodule
