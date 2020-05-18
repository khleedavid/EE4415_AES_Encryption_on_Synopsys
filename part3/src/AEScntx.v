module AEScntx #(N = 4)(
//from testbench
input bit clk,
input bit start,
input bit rstn,
//to AEScore
output bit accept, //reg 
output bit [3:0] rndNo, //reg
output bit enbSB,
output bit enbSR,
output bit enbMC,
output bit enbAR,
output bit enbKS,
//to testbench
output bit done //reg
);
////enter your code here
//aes_cntx performs the necessary timing required to ensure that each signal flows through the appropriate path
//each signal must pass through rndNo 0 to 10, and result in N number of done signals at the end of each round
//input 1 : 0 |1 |2 |3 |4 |5 |6 |7 |8 |9 |10 done
//input 2 : 0 |0 |1 |2 |3 |4 |5 |6 |7 |8 |9 |10 done
//input 3 : 0 |0 |0 |1 |2 |3 |4 |5 |6 |7 |8 |9 |10 done
//input 4 : 0 |0 |0 |0 |1 |2 |3 |4 |5 |6 |7 |8 |9 |10 done
//in a nslowed system, 
//input 1 : 0 |0 |0 |0 |1 |1 |1 |1 |2 |2 |2 |2 |3 |3 |3 |3 |4 |4 |4 |4 |5 |5 |5 |5 |6 |6 |6 |6 |7 |7 |7 |7 |8 |8 |8 |8 |9 |9 |9 |9 |10 |10 |10 |10 donedonedonedone
reg [3:0] i;
reg [3:0] rndNo_prev;

rndMult cnt_i(
	.clk(clk),
	.rstn(rstn),
	.start(start),
	.counter(i)
);
always @ (posedge clk) begin
		if(!rstn) begin
			rndNo <= 0;
			rndNo_prev <=0;
		end
		else begin
		rndNo = (start && rndNo <10 && i == 3) ? rndNo+1 : (rndNo==10 && i == 3) ? 0: rndNo;
		end
end		
always @(rndNo) begin
	rndNo_prev <= (rndNo > 0 && rndNo < 11) ? rndNo - 1: rndNo_prev;
end
assign	done = (rstn && start && rndNo_prev == 9 && rndNo == 0) ? 1'b1 : 1'b0;
assign	accept = (rstn && rndNo == 0) ? 1'b1 : 1'b0;
assign	enbSB = (rndNo>=1 && rndNo<=10);
assign	enbSR = (rndNo>=1 && rndNo<=10);
assign	enbMC = (rndNo>=1 && rndNo<=9);
assign	enbAR = (rndNo>=0 && rndNo<=10);
assign	enbKS = (rndNo>=1 && rndNo<=10);
endmodule

module rndMult(
input clk, 
input rstn, 
input start,
output [3:0] counter
);
reg [3:0] counter_up;
//up counter
	always @(posedge clk)
	begin
		if(!rstn)
		 counter_up <= 4'd0;
		else if(counter_up == 4'd3)
		 counter_up = 4'd0;
		else if (start)
		 counter_up = counter_up + 4'd1;
	assign counter = counter_up;
endmodule