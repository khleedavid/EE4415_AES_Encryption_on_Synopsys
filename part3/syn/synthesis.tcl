# list verilog files in design
set my_verilog_files [list AddRndKey_top.v AEScntx.v AESCore.v aes_sbox.v AES_top.v \
	KeySchedule_top.v matrix_mult.v matrix_mult.sv MixCol_top.v shiftRows_top.v subBytes_top.v \
	tb_aes.sv]

# Set the top module of your design
set my_toplevel AES_top

#enter the files to be analyzed
analyze -f verilog $my_verilog_files

#elaborate top
elaborate $my_toplevel

#source constraint file
source constraint.tcl

#compile the top module
compile $my_toplevel

#report critical path
report_timing

#retime the design
optimize_registers

#report critical path after retiming
report_timing

#report area
report_area








