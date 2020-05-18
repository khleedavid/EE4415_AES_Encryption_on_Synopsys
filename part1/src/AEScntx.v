module AEScntx(
//from testbench
input  clk,
input  start,
input  rstn,
//to AEScore
output reg accept,
output reg [3:0] rndNo,
output enbSB,
output enbSR,
output enbMC,
output enbAR,
output enbKS,
//to AEStop
output reg done,
output reg [9:0] completed_round
);
////enter your code here
	always @ (posedge clk) begin	
	//on reset, prepare system to receive new input
		if(!rstn) begin
			rndNo <= 0;
			done  <= 0;
			completed_round <= 0;
			accept <= 0;
		end
	//else, current encryption in progress, increment rndNo, update done and accept to match rndNo
		else begin
		rndNo = (start && rndNo <10) ? rndNo+1 : (rndNo ==10) ? 0: rndNo;
		done = (rstn && start && rndNo == 0) ? 1 : 0;
		accept = (rndNo == 0) ? 1:0;
		end
	//update completed_round from rndNo
		case(rndNo)
			4'b0000: begin completed_round = 0; end
			4'b0001: begin completed_round = 1; end
			4'b0010: begin completed_round = 2; end
			4'b0011: begin completed_round = 4; end
			4'b0100: begin completed_round = 8; end
			4'b0101: begin completed_round = 16; end
			4'b0110: begin completed_round = 32; end
			4'b0111: begin completed_round = 64; end
			4'b1000: begin completed_round = 128; end
			4'b1001: begin completed_round = 256; end
			4'b1010: begin completed_round = 512; end
			default: begin completed_round = 0; end
		endcase
	end
	//assign enable signals based on rndNo
  assign enbSB = (rndNo>=1 && rndNo<=10);
  assign enbSR = (rndNo>=1 && rndNo<=10);
  assign enbMC = (rndNo>=1 && rndNo<=9);
  assign enbAR = (rndNo>=0 && rndNo<=10);
  assign enbKS = (rndNo>=1 && rndNo<=10);
endmodule
