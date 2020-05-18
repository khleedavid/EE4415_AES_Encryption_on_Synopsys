module MixCol_top(
input [127:0] ip,
input enable,
output [127:0] op
);
////enter your code here
wire [127:0] op_buffer;

matrix_mult mult3(.ip(ip[127:96]),.op(op_buffer[127:96]));
matrix_mult mult2(.ip(ip[95:64]),.op(op_buffer[95:64]));
matrix_mult mult1(.ip(ip[63:32]),.op(op_buffer[63:32]));
matrix_mult mult0(.ip(ip[31:0]),.op(op_buffer[31:0]));

assign op = enable ? op_buffer : ip;
endmodule
