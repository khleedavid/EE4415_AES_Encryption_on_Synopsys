module subBytes_top(
input [127:0] ip,
input enable,
output [127:0] op
);
////enter your code here
wire [127:0] op_buffer;
aes_sbox sbox15(.ip(ip[127:120]),.op(op_buffer[127:120]));
aes_sbox sbox14(.ip(ip[119:112]),.op(op_buffer[119:112]));
aes_sbox sbox13(.ip(ip[111:104]),.op(op_buffer[111:104]));
aes_sbox sbox12(.ip(ip[103:96]),.op(op_buffer[103:96]));
aes_sbox sbox11(.ip(ip[95:88]),.op(op_buffer[95:88]));
aes_sbox sbox10(.ip(ip[87:80]),.op(op_buffer[87:80]));
aes_sbox sbox9(.ip(ip[79:72]),.op(op_buffer[79:72]));
aes_sbox sbox8(.ip(ip[71:64]),.op(op_buffer[71:64]));
aes_sbox sbox7(.ip(ip[63:56]),.op(op_buffer[63:56]));
aes_sbox sbox6(.ip(ip[55:48]),.op(op_buffer[55:48]));
aes_sbox sbox5(.ip(ip[47:40]),.op(op_buffer[47:40]));
aes_sbox sbox4(.ip(ip[39:32]),.op(op_buffer[39:32]));
aes_sbox sbox3(.ip(ip[31:24]),.op(op_buffer[31:24]));
aes_sbox sbox2(.ip(ip[23:16]),.op(op_buffer[23:16]));
aes_sbox sbox1(.ip(ip[15:8]),.op(op_buffer[15:8]));
aes_sbox sbox0(.ip(ip[7:0]),.op(op_buffer[7:0]));

assign op = (enable==1) ? op_buffer : ip;

endmodule
