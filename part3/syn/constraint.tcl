set all_in_ex_clk [remove_from_collection \
	[all_inputs] [get_ports Clk]]
set target_library saed32rvt_tt1p05v125c.db
set link_library "* saed32rvt_tt1p05v125c.db"

#create a clock with given constrained clock period
# set clock period in ns to 0.5
create_clock -period 0.5 [get_ports Clk]

#create input delay on all inputs except clock
# set input delay except Clk port to 0.1ns
set_input_delay -max 0.1 -clock Clk $all_in_ex_clk

#create output delay on all outputs
# set output delay to 0.1
set_output_delay -max 0.1 -clock Clk [all_outputs]

#set given load capacitance on all output pins
# set output load capacitance to 5fF
set_load 5 [all_outputs]
