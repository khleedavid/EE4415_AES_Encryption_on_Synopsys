# list verilog files in design
set my_verilog_files [list AddRndKey_top.v AEScntx.v AESCore.v aes_sbox.v AES_top.v \
	KeySchedule_top.v matrix_mult.v matrix_mult.sv MixCol_top.v shiftRows_top.v subBytes_top.v \
	tb_aes.sv]

# Set the top module of your design
set my_toplevel AES_top

set all_in_ex_clk [remove_from_collection \
	[all_inputs] [get_ports clk]]
set target_library saed32rvt_tt1p05v125c.db
set link_library "* saed32rvt_tt1p05v125c.db"
#enter the files to be analyzed
analyze -f verilog $my_verilog_files

#elaborate top
elaborate $my_toplevel

# Designate the design to synthesize
current_design $my_toplevel

#create a clock with given constrained clock period
# set clock period in ns to 2
create_clock -period 2 [get_ports clk]

#create input delay on all inputs except clock
# set input delay except Clk port to 0.2ns
set_input_delay -max 0.2 -clock clk $all_in_ex_clk

#create output delay on all outputs
# set output delay to 0.2
set_output_delay -max 0.2 -clock clk [all_outputs]

#set given load capacitance on all output pins
# set output load capacitance to 5fF
set_load 5 [all_outputs]

report_clock -skew -attributes
report_port -verbose