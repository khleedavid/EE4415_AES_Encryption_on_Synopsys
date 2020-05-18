module shiftRows_top(
input [127:0] ip,
input enable,
output [127:0] op
);
////enter your code here
wire [127:0] op_buffer;
//col1
assign	op_buffer[127:120] = ip[127:120];
assign	op_buffer[119:112] = ip[87:80];
assign	op_buffer[111:104] = ip[47:40];
assign	op_buffer[103:96] = ip[7:0];

//col2
assign	op_buffer[95:88] = ip[95:88];
assign	op_buffer[87:80] = ip[55:48];
assign	op_buffer[79:72] = ip[15:8];
assign	op_buffer[71:64] = ip[103:96];

//col3
assign	op_buffer[63:56] = ip[63:56];
assign	op_buffer[55:48] = ip[23:16];
assign	op_buffer[47:40] = ip[111:104];
assign	op_buffer[39:32] = ip[71:64];

//col4
assign	op_buffer[31:24] = ip[31:24];
assign	op_buffer[23:16] = ip[119:112];
assign	op_buffer[15:8] = ip[79:72];
assign	op_buffer[7:0] = ip[39:32];

assign	op = enable ? op_buffer : ip;
endmodule
