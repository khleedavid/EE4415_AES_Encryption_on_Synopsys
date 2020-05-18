# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Thu May 7 21:53:59 2020
# Designs open: 3
#   V1: /class4/ug19/a168625w/ee4415_part2/part3/vcs/results.vpd
#   V2: /class4/ug19/a168625w/ee4415_part2/part1/vcs/results.vpd
#   V3: /class4/ug19/a168625w/ee4415_part2/part2/vcs/results.vpd
# Toplevel windows open: 1
# 	TopLevel.2
#   Wave.1: 27 signals
#   Group count = 7
#   Group core_top signal count = 27
#   Group tb_aes signal count = 27
#   Group Group1 signal count = 9
#   Group tb_aes_1 signal count = 12
#   Group cntx_top signal count = 12
#   Group genblk1[0].core_top signal count = 19
# End_DVE_Session_Save_Info

# DVE version: J-2014.12_Full64
# DVE build date: Nov 21 2014 20:56:01


#<Session mode="Full" path="/class4/ug19/a168625w/ee4415_part2/part3/vcs/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.2

if {![gui_exist_window -window TopLevel.2]} {
    set TopLevel.2 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.2 TopLevel.2
}
gui_show_window -window ${TopLevel.2} -show_state maximized -rect {{0 23} {1535 863}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_hide_toolbar -toolbar {Simulator}
gui_hide_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
gui_sync_global -id ${TopLevel.2} -option true

# MDI window settings
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.2}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 445} {child_wave_right 1085} {child_wave_colname 220} {child_wave_colvalue 221} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) none
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) none
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) none
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) none
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.2}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { ![gui_is_db_opened -db {/class4/ug19/a168625w/ee4415_part2/part3/vcs/results.vpd}] } {
	gui_open_db -design V1 -file /class4/ug19/a168625w/ee4415_part2/part3/vcs/results.vpd -nosource
}
if { ![gui_is_db_opened -db {/class4/ug19/a168625w/ee4415_part2/part1/vcs/results.vpd}] } {
	gui_open_db -design V2 -file /class4/ug19/a168625w/ee4415_part2/part1/vcs/results.vpd -nosource
}
if { ![gui_is_db_opened -db {/class4/ug19/a168625w/ee4415_part2/part2/vcs/results.vpd}] } {
	gui_open_db -design V3 -file /class4/ug19/a168625w/ee4415_part2/part2/vcs/results.vpd -nosource
}
gui_set_precision 10ps
gui_set_time_units 10ps
#</Database>

# DVE Global setting session: 


# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {V3:tb_aes.dut.cntx_top}
gui_load_child_values {V3:tb_aes.dut.genblk1[0].core_top}
gui_load_child_values {V1:tb_aes.dut.core_top}
gui_load_child_values {V2:tb_aes}


set _session_group_1 core_top
gui_sg_create "$_session_group_1"
set core_top "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { V1:tb_aes.dut.core_top.clk V1:tb_aes.dut.core_top.rstn V1:tb_aes.dut.core_top.plain_text V1:tb_aes.dut.core_top.cipher_key V1:tb_aes.dut.core_top.accept V1:tb_aes.dut.core_top.rndNo V1:tb_aes.dut.core_top.enbSB V1:tb_aes.dut.core_top.enbSR V1:tb_aes.dut.core_top.enbMC V1:tb_aes.dut.core_top.enbAR V1:tb_aes.dut.core_top.enbKS V1:tb_aes.dut.core_top.cipher_text V1:tb_aes.dut.core_top.buffer_text_SB_ip0 V1:tb_aes.dut.core_top.buffer_text_SB_ip1 V1:tb_aes.dut.core_top.buffer_text_SR_ip2 V1:tb_aes.dut.core_top.buffer_text_SR_ip3 V1:tb_aes.dut.core_top.buffer_text_MC_ip4 V1:tb_aes.dut.core_top.buffer_text_MC_ip5 V1:tb_aes.dut.core_top.buffer_text_AR_ip6 V1:tb_aes.dut.core_top.buffer_text_AR_ip7 V1:tb_aes.dut.core_top.buffer_text_E V1:tb_aes.dut.core_top.buffer_cipher_in V1:tb_aes.dut.core_top.buffer_cipher_out_ip0 V1:tb_aes.dut.core_top.buffer_cipher_out_ip1 V1:tb_aes.dut.core_top.buffer_cipher_out_ip3 V1:tb_aes.dut.core_top.buffer_cipher_out V1:tb_aes.dut.core_top.N }
gui_set_radix -radix {decimal} -signals {V1:tb_aes.dut.core_top.N}
gui_set_radix -radix {twosComplement} -signals {V1:tb_aes.dut.core_top.N}

set _session_group_2 tb_aes
gui_sg_create "$_session_group_2"
set tb_aes "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { V2:tb_aes.round6_data_mem V2:tb_aes.random_number V2:tb_aes.no_of_errors V2:tb_aes.round9_data_mem V2:tb_aes.cipher_key V2:tb_aes.cipher_text_mem V2:tb_aes.round1_data_mem V2:tb_aes.plain_text_mem V2:tb_aes.round4_data_mem V2:tb_aes.random_number_bigger V2:tb_aes.rstn V2:tb_aes.initial_round_data_mem V2:tb_aes.round7_data_mem V2:tb_aes.cipher_text V2:tb_aes.completed_round V2:tb_aes.round2_data_mem V2:tb_aes.cipher_text_ref_mem V2:tb_aes.round5_data_mem V2:tb_aes.round8_data_mem V2:tb_aes.clk V2:tb_aes.cipher_key_mem V2:tb_aes.done V2:tb_aes.start V2:tb_aes.count V2:tb_aes.no_of_AES V2:tb_aes.round3_data_mem V2:tb_aes.plain_text }
gui_set_radix -radix {decimal} -signals {V2:tb_aes.no_of_errors}
gui_set_radix -radix {twosComplement} -signals {V2:tb_aes.no_of_errors}
gui_set_radix -radix {decimal} -signals {V2:tb_aes.no_of_AES}
gui_set_radix -radix {twosComplement} -signals {V2:tb_aes.no_of_AES}

set _session_group_3 Group1
gui_sg_create "$_session_group_3"
set Group1 "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { V2:tb_aes.clk V2:tb_aes.start V2:tb_aes.rstn V2:tb_aes.plain_text V2:tb_aes.cipher_key V2:tb_aes.done V2:tb_aes.completed_round V2:tb_aes.cipher_text }

set _session_group_4 $_session_group_3|
append _session_group_4 tb_aes
gui_sg_create "$_session_group_4"
set Group1|tb_aes "$_session_group_4"

gui_sg_addsignal -group "$_session_group_4" { V3:tb_aes.clk V3:tb_aes.start V3:tb_aes.rstn V3:tb_aes.plain_text V3:tb_aes.cipher_key V3:tb_aes.done V3:tb_aes.completed_round V3:tb_aes.cipher_text V3:tb_aes.count V3:tb_aes.no_of_errors V3:tb_aes.plain_text_mem V3:tb_aes.cipher_key_mem V3:tb_aes.cipher_text_mem V3:tb_aes.cipher_text_ref_mem V3:tb_aes.no_of_AES V3:tb_aes.N }
gui_set_radix -radix {decimal} -signals {V3:tb_aes.count}
gui_set_radix -radix {twosComplement} -signals {V3:tb_aes.count}
gui_set_radix -radix {decimal} -signals {V3:tb_aes.no_of_errors}
gui_set_radix -radix {twosComplement} -signals {V3:tb_aes.no_of_errors}
gui_set_radix -radix {decimal} -signals {V3:tb_aes.no_of_AES}
gui_set_radix -radix {twosComplement} -signals {V3:tb_aes.no_of_AES}
gui_set_radix -radix {decimal} -signals {V3:tb_aes.N}
gui_set_radix -radix {twosComplement} -signals {V3:tb_aes.N}

set _session_group_5 tb_aes_1
gui_sg_create "$_session_group_5"
set tb_aes_1 "$_session_group_5"

gui_sg_addsignal -group "$_session_group_5" { V3:tb_aes.clk V3:tb_aes.start V3:tb_aes.rstn V3:tb_aes.plain_text V3:tb_aes.cipher_key V3:tb_aes.done V3:tb_aes.completed_round V3:tb_aes.cipher_text V3:tb_aes.count V3:tb_aes.no_of_errors V3:tb_aes.no_of_AES V3:tb_aes.N }
gui_set_radix -radix {decimal} -signals {V3:tb_aes.count}
gui_set_radix -radix {twosComplement} -signals {V3:tb_aes.count}
gui_set_radix -radix {decimal} -signals {V3:tb_aes.no_of_errors}
gui_set_radix -radix {twosComplement} -signals {V3:tb_aes.no_of_errors}
gui_set_radix -radix {decimal} -signals {V3:tb_aes.no_of_AES}
gui_set_radix -radix {twosComplement} -signals {V3:tb_aes.no_of_AES}
gui_set_radix -radix {decimal} -signals {V3:tb_aes.N}
gui_set_radix -radix {twosComplement} -signals {V3:tb_aes.N}

set _session_group_6 cntx_top
gui_sg_create "$_session_group_6"
set cntx_top "$_session_group_6"

gui_sg_addsignal -group "$_session_group_6" { V3:tb_aes.dut.cntx_top.clk V3:tb_aes.dut.cntx_top.start V3:tb_aes.dut.cntx_top.rstn V3:tb_aes.dut.cntx_top.accept V3:tb_aes.dut.cntx_top.rndNo V3:tb_aes.dut.cntx_top.enbSB V3:tb_aes.dut.cntx_top.enbSR V3:tb_aes.dut.cntx_top.enbMC V3:tb_aes.dut.cntx_top.enbAR V3:tb_aes.dut.cntx_top.enbKS V3:tb_aes.dut.cntx_top.done V3:tb_aes.dut.cntx_top.completed_round }

set _session_group_7 {genblk1[0].core_top}
gui_sg_create "$_session_group_7"
set {genblk1[0].core_top} "$_session_group_7"

gui_sg_addsignal -group "$_session_group_7" { {V3:tb_aes.dut.genblk1[0].core_top.rstn} {V3:tb_aes.dut.genblk1[0].core_top.rndNo} {V3:tb_aes.dut.genblk1[0].core_top.plain_text} {V3:tb_aes.dut.genblk1[0].core_top.enbSR} {V3:tb_aes.dut.genblk1[0].core_top.enbSB} {V3:tb_aes.dut.genblk1[0].core_top.enbMC} {V3:tb_aes.dut.genblk1[0].core_top.enbKS} {V3:tb_aes.dut.genblk1[0].core_top.enbAR} {V3:tb_aes.dut.genblk1[0].core_top.clk} {V3:tb_aes.dut.genblk1[0].core_top.cipher_text} {V3:tb_aes.dut.genblk1[0].core_top.cipher_key} {V3:tb_aes.dut.genblk1[0].core_top.buffer_text_E} {V3:tb_aes.dut.genblk1[0].core_top.buffer_text_D} {V3:tb_aes.dut.genblk1[0].core_top.buffer_text_C} {V3:tb_aes.dut.genblk1[0].core_top.buffer_text_B} {V3:tb_aes.dut.genblk1[0].core_top.buffer_text_A} {V3:tb_aes.dut.genblk1[0].core_top.buffer_cipher_out} {V3:tb_aes.dut.genblk1[0].core_top.buffer_cipher_in} {V3:tb_aes.dut.genblk1[0].core_top.accept} }

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 7500



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 1691 13020
gui_list_add_group -id ${Wave.1} -after {New Group} {core_top}
gui_list_select -id ${Wave.1} {V1:tb_aes.dut.core_top.buffer_cipher_in }
gui_seek_criteria -id ${Wave.1} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.1}
gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group core_top  -item {V1:tb_aes.dut.core_top.buffer_text_E[127:0]} -position below

gui_marker_move -id ${Wave.1} {C1} 7500
gui_view_scroll -id ${Wave.1} -vertical -set 93
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

