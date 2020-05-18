module AEScntx(
//from testbench
input clk,
input start,
input rstn,
//to AEScore
output reg accept,
output reg [3:0] rndNo,
output reg enbSB,
output reg enbSR,
output reg enbMC,
output reg enbAR,
output reg enbKS,
//to testbench
output reg done,
output reg [9:0] completed_round
);
////enter your code here
always @ (posedge clk) begin
		if(!rstn) begin
			rndNo <= 0;
			done  <= 0;
			completed_round <= 0;
			accept <= 0;
		end
		else begin
		rndNo = (start && rndNo <10) ? rndNo+1 : (rndNo ==10) ? 0: rndNo;
		done = (rstn && start && rndNo == 0) ? 1 : 0;
		accept = (rndNo == 0) ? 1:0;
		end
		case(rndNo)
			4'b0000: begin enbSB = 0; enbSR = 0; enbMC = 0; enbAR = 1; enbKS = 0; completed_round = 0; end
			4'b0001: begin enbSB = 1; enbSR = 1; enbMC = 1; enbAR = 1; enbKS = 1; completed_round = 1; end
			4'b0010: begin enbSB = 1; enbSR = 1; enbMC = 1; enbAR = 1; enbKS = 1; completed_round = 2; end
			4'b0011: begin enbSB = 1; enbSR = 1; enbMC = 1; enbAR = 1; enbKS = 1; completed_round = 4; end
			4'b0100: begin enbSB = 1; enbSR = 1; enbMC = 1; enbAR = 1; enbKS = 1; completed_round = 8; end
			4'b0101: begin enbSB = 1; enbSR = 1; enbMC = 1; enbAR = 1; enbKS = 1; completed_round = 16; end
			4'b0110: begin enbSB = 1; enbSR = 1; enbMC = 1; enbAR = 1; enbKS = 1; completed_round = 32; end
			4'b0111: begin enbSB = 1; enbSR = 1; enbMC = 1; enbAR = 1; enbKS = 1; completed_round = 64; end
			4'b1000: begin enbSB = 1; enbSR = 1; enbMC = 1; enbAR = 1; enbKS = 1; completed_round = 128; end
			4'b1001: begin enbSB = 1; enbSR = 1; enbMC = 1; enbAR = 1; enbKS = 1; completed_round = 256; end
			4'b1010: begin enbSB = 1; enbSR = 1; enbMC = 0; enbAR = 1; enbKS = 1; completed_round = 512; end
			default: begin enbSB = 0; enbSR = 0; enbMC = 0; enbAR = 1; enbKS = 0; completed_round = 0; end
		endcase
end
endmodule
