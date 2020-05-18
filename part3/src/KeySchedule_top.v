module KeySchedule_top(
input [127:0] ip_key,
input enable,
input [3:0] rndNo,
output [127:0] op_key
);
////enter your code here
wire [127:0] op_buffer;
wire [31:0] op_rot;
wire [31:0] op_sbox;
wire [31:0] op_rcon;

aes_sbox sub1(
	.ip(ip_key[7:0]),
	.op(op_sbox[15:8])
);
aes_sbox sub2(
	.ip(ip_key[15:8]),
	.op(op_sbox[23:16])
);
aes_sbox sub3(
	.ip(ip_key[23:16]),
	.op(op_sbox[31:24])
);
aes_sbox sub4(
	.ip(ip_key[31:24]),
	.op(op_sbox[7:0])
); 

assign	op_buffer[127:96] = ip_key[127:96] ^ op_sbox ^ rCon(rndNo);
assign	op_buffer[95:64] = ip_key[95:64] ^ ip_key[127:96] ^ op_sbox ^ rCon(rndNo);
assign	op_buffer[63:32] = ip_key[63:32] ^ ip_key[95:64] ^ ip_key[127:96] ^ op_sbox ^ rCon(rndNo);
assign	op_buffer[31:0] = ip_key[31:0] ^ ip_key[63:32] ^ ip_key[95:64] ^ ip_key[127:96] ^ op_sbox ^ rCon(rndNo);

assign op_key = enable ? op_buffer : ip_key;

function [31:0] rCon;
input [3:0] rndNo;
	case(rndNo)		
	   4'h1: rCon=32'h01000000;
	   4'h2: rCon=32'h02000000;
	   4'h3: rCon=32'h04000000;
	   4'h4: rCon=32'h08000000;
	   4'h5: rCon=32'h10000000;
	   4'h6: rCon=32'h20000000;
	   4'h7: rCon=32'h40000000;
	   4'h8: rCon=32'h80000000;
	   4'h9: rCon=32'h1b000000;
	   4'ha: rCon=32'h36000000;
	   default: rCon=32'h00000000;
	endcase
endfunction
endmodule
