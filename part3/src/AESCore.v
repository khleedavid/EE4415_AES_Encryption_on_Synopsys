module AESCore#(N=4)(
input clk,
input rstn,
input [127:0] plain_text,
input [127:0] cipher_key,
//from controller
input accept,
input [3:0] rndNo,
input enbSB,
input enbSR,
input enbMC,
input enbAR,
input enbKS,
//to testbench
output reg [127:0] cipher_text //reg
);
////enter your code here
//nslowing buffers
reg [127:0] buffer_KS_ip0;
reg [127:0] buffer_KS_ip1;
reg [127:0] buffer_KS_ip2;

reg [127:0] buffer_SB_ip0;
reg [127:0] buffer_SB_ip1;
reg [127:0] buffer_SB_ip2;

reg [127:0] buffer_CT_ip0;
reg [127:0] buffer_CT_ip1;
reg [127:0] buffer_CT_ip2;
//aescore buffers
reg [127:0] buffer_cipher_in;
reg [127:0] buffer_cipher_comb;
reg [127:0] buffer_cipher_out;
reg [127:0] buffer_text_A;
reg [127:0] buffer_text_A_comb;
wire [127:0] buffer_text_B;
wire [127:0] buffer_text_C;
wire [127:0] buffer_text_D;
wire [127:0] buffer_text_E;
// buffers for cipher_text register
dff_core dff_CT0(
	.clk(clk),
	.buffer_ip(buffer_CT_ip0),
	.buffer_op(buffer_CT_ip1)
);
dff_core dff_CT1(
	.clk(clk),
	.buffer_ip(buffer_CT_ip1),
	.buffer_op(buffer_CT_ip2)
);
dff_core dff_CT2(
	.clk(clk),
	.buffer_ip(buffer_CT_ip2),
	.buffer_op(cipher_text)
);
// buffers for KeySchedule register
dff_core dff_KS0(
	.clk(clk),
	.buffer_ip(buffer_KS_ip0),
	.buffer_op(buffer_KS_ip1)
);
dff_core dff_KS1(
	.clk(clk),
	.buffer_ip(buffer_KS_ip1),
	.buffer_op(buffer_KS_ip2)
);
dff_core dff_KS2(
	.clk(clk),
	.buffer_ip(buffer_KS_ip2),
	.buffer_op(buffer_cipher_comb)
);
// buffers for subBytes register
dff_core dff_SB0(
	.clk(clk),
	.buffer_ip(buffer_SB_ip0),
	.buffer_op(buffer_SB_ip1)
);
dff_core dff_SB1(
	.clk(clk),
	.buffer_ip(buffer_SB_ip1),
	.buffer_op(buffer_SB_ip2)
);
dff_core dff_SB2(
	.clk(clk),
	.buffer_ip(buffer_SB_ip2),
	.buffer_op(buffer_text_A_comb)
);
// modules for AES encryption
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
//	.clk(clk),
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

//buffer_text_E is the output of AddRndKey, it needs to go into the next round if rndNo < 10

//when rndNo = 0, assign plaintext to buffertextA
//between rndNo 1 to 9, assign buffer_text_E(FROM ADDRNDKEY) to buffer_text_A

always @(posedge clk) begin //register for buffer_text_A
	if (!rstn) begin
		buffer_SB_ip0 <= plain_text;
	end
	else if (rndNo!= 0) begin
		buffer_SB_ip0 <= buffer_text_E;
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
		buffer_KS_ip0 <= cipher_key;
	end
	else if (rndNo!= 0) begin 
		buffer_KS_ip0 <= buffer_cipher_out;
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
		buffer_CT_ip0 <= 128'b0;
	end
	else begin
		buffer_CT_ip0 <= buffer_text_E;
	end
end

endmodule
//create a dff register for easy replication
module dff_core(
input clk,
input [127:0] buffer_ip,
output reg [127:0] buffer_op
);
	always @ (posedge clk)
	begin
		buffer_op <= buffer_ip;
	end
endmodule