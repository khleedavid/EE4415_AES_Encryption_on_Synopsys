module matrix_mult(
input bit [31:0] ip,
output bit [31:0] op
);

bit [7:0] b0;
bit [7:0] b1;
bit [7:0] b2;
bit [7:0] b3;
bit [7:0] a0;
bit [7:0] a1;
bit [7:0] a2;
bit [7:0] a3;

assign a0 = ip[31:24];
assign a1 = ip[23:16];
assign a2 = ip[15:8];
assign a3 = ip[7:0];


assign b0 = (a0[7]==1'b1)?((a0<<1)^(8'h1b)):(a0<<1);
assign b1 = (a1[7]==1'b1)?((a1<<1)^(8'h1b)):(a1<<1);
assign b2 = (a2[7]==1'b1)?((a2<<1)^(8'h1b)):(a2<<1);
assign b3 = (a3[7]==1'b1)?((a3<<1)^(8'h1b)):(a3<<1);

assign op[31:24] = b0^a3^a2^b1^a1; 
assign op[23:16] = b1^a0^a3^b2^a2;
assign op[15:8] = b2^a1^a0^b3^a3;
assign op[7:0] = b3^a2^a1^b0^a0;

endmodule
