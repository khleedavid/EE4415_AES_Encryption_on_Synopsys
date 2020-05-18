module tb_aes();
parameter no_of_AES =250;
parameter N = 4;
bit clk;
bit start;
bit rstn;
bit [127:0] plain_text;
bit [127:0] cipher_key;
bit done;
bit [127:0] cipher_text;
bit [9:0] completed_round;
bit [127:0] plain_text_mem [no_of_AES*N];
bit [127:0] cipher_key_mem [no_of_AES*N];
bit [127:0] cipher_text_mem [no_of_AES*N];
bit [127:0] initial_round_data_mem [no_of_AES*N];
bit [127:0] round1_data_mem [no_of_AES*N];
bit [127:0] round2_data_mem [no_of_AES*N];
bit [127:0] round3_data_mem [no_of_AES*N];
bit [127:0] round4_data_mem [no_of_AES*N];
bit [127:0] round5_data_mem [no_of_AES*N];
bit [127:0] round6_data_mem [no_of_AES*N];
bit [127:0] round7_data_mem [no_of_AES*N];
bit [127:0] round8_data_mem [no_of_AES*N];
bit [127:0] round9_data_mem [no_of_AES*N];
bit [127:0] cipher_text_ref_mem [no_of_AES*N];
bit [31:0] random_number;
bit [127:0] random_number_bigger;

AES_top #(N) dut(.*);
//AES_top  dut(.*);
int initial_count;
bit initial_state;
// initial_state is used to input N = 4 inputs at the start 
assign initial_state = (start==1'b1) && (initial_count<(N-1));

int count;
int ip_address;
int no_of_errors;
always begin
  #5 clk = ~clk;
end

initial begin
//read in plain_text, cipher_text_mem, and cipher_key
    $readmemh("../../ref/plain_text.txt",plain_text_mem);
    $readmemh("../../ref/cipher_key.txt",cipher_key_mem);
    $readmemh("../../ref/cipher_text.txt",cipher_text_ref_mem);
    //for (int i=0;i<no_of_AES;i++)
    //begin
    //  void'(randomize(random_number));
    //  random_number_bigger[31:0] = random_number; 
    //  void'(randomize(random_number));
    //  random_number_bigger[63:32] = random_number; 
    //  void'(randomize(random_number));
    //  random_number_bigger[95:64] = random_number; 
    //  void'(randomize(random_number));
    //  random_number_bigger[127:96] = random_number; 
    //  plain_text_mem[i] = random_number_bigger;
    //  void'(randomize(random_number));
    //  random_number_bigger[31:0] = random_number; 
    //  void'(randomize(random_number));
    //  random_number_bigger[63:32] = random_number; 
    //  void'(randomize(random_number));
    //  random_number_bigger[95:64] = random_number; 
    //  void'(randomize(random_number));
    //  random_number_bigger[127:96] = random_number; 
    //  cipher_key_mem[i] = random_number_bigger;
    //end
    clk <= 1'b0;
    rstn <= 1'b0;
    start <= 1'b0;
    rstn <= #22 1'b1;
    start <= #32 1'b1;
end

always@(negedge clk or negedge rstn)
begin
    if(!rstn)
    begin
		//reset initial_count	
        initial_count <= 0;
    end
    else
    begin
        if (start)
        begin
			//initial_count is used to track the number of negedge clk elapsed since start
            initial_count <= initial_count+1;
        end
    end
end

always@(negedge clk or negedge rstn)
begin
    if (!rstn)
    begin
        ip_address <= 0;
    end
    else
       begin
       if(initial_state || done)
       begin
	   // ip_address is used to track the number of new inputs inserted into plain_text
           ip_address <= ip_address+1;
       end
    end
end

//for each change in ip_address, update plain_text input
//assign ip_address = count;
assign plain_text = plain_text_mem[ip_address];
assign cipher_key = cipher_key_mem[ip_address];

always@(negedge clk)
begin
  if (done) 
  begin
  //count tracks the number of done signals sent, which is the number of cipher_text outputs produced
    count <= count+1;
    cipher_text_mem[count] <= cipher_text;
  end
  //when count reaches the max number of AES inputs, begin comparison
  if (count == (no_of_AES*N))
  begin
    //$writememh("plain_text.txt",plain_text_mem);
    //$writememh("cipher_key.txt",cipher_key_mem);
    //$writememh("data_out.txt",cipher_text_mem);
    //$writememh("initial_round_data.txt",initial_round_data_mem);
    //$writememh("round1_data.txt",round1_data_mem);
    //$writememh("round2_data.txt",round2_data_mem);
    //$writememh("round3_data.txt",round3_data_mem);
    //$writememh("round4_data.txt",round4_data_mem);
    //$writememh("round5_data.txt",round5_data_mem);
    //$writememh("round6_data.txt",round6_data_mem);
    //$writememh("round7_data.txt",round7_data_mem);
    //$writememh("round8_data.txt",round8_data_mem);
    //$writememh("round9_data.txt",round9_data_mem);
    for (int i = N ; i< no_of_AES*N; i++)
    begin
        if (cipher_text_mem[i] != cipher_text_ref_mem[i])
            no_of_errors =no_of_errors+1;
    end
    if (no_of_errors == 0)
    begin
        $display("Congratulations, your code passed all the tests for N-slowing...");
    end
    else
    begin
        $display("%d out of %d test cases failed",no_of_errors,(no_of_AES*N));
    end
    $finish();
  end
end
endmodule
