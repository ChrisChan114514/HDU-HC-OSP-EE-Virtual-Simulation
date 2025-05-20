## Generated SDC file "lcd_all_colorbar.out.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Full Version"

## DATE    "Fri Nov 30 12:12:05 2018"

##
## DEVICE  "EP4CE10F17C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
create_clock -name {sys_clk} -period 20.000 -waveform { 0.000 10.000 } [get_ports {sys_clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {u_pll|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {u_pll|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 2 -master_clock {sys_clk} [get_pins {u_pll|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {u_pll|altpll_component|auto_generated|pll1|clk[1]} -source [get_pins {u_pll|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 2 -phase -75.000 -master_clock {sys_clk} [get_pins {u_pll|altpll_component|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {u_pll|altpll_component|auto_generated|pll1|clk[2]} -source [get_pins {u_pll|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -master_clock {sys_clk} [get_pins {u_pll|altpll_component|auto_generated|pll1|clk[2]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {u_pll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_registers {*|alt_jtag_atlantic:*|jupdate}] -to [get_registers {*|alt_jtag_atlantic:*|jupdate1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rdata[*]}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read}] -to [get_registers {*|alt_jtag_atlantic:*|read1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read_req}] 
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rvalid}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|t_dav}] -to [get_registers {*|alt_jtag_atlantic:*|tck_t_dav}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|user_saw_rvalid}] -to [get_registers {*|alt_jtag_atlantic:*|rvalid0*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|wdata[*]}] -to [get_registers *]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write}] -to [get_registers {*|alt_jtag_atlantic:*|write1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_ena*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_pause*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_valid}] 
set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_qe9:dffpipe12|dffe13a*}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn}]
set_false_path -from [get_keepers {*qsys_nios2_qsys:*|qsys_nios2_qsys_nios2_oci:the_qsys_nios2_qsys_nios2_oci|qsys_nios2_qsys_nios2_oci_break:the_qsys_nios2_qsys_nios2_oci_break|break_readreg*}] -to [get_keepers {*qsys_nios2_qsys:*|qsys_nios2_qsys_nios2_oci:the_qsys_nios2_qsys_nios2_oci|qsys_nios2_qsys_jtag_debug_module_wrapper:the_qsys_nios2_qsys_jtag_debug_module_wrapper|qsys_nios2_qsys_jtag_debug_module_tck:the_qsys_nios2_qsys_jtag_debug_module_tck|*sr*}]
set_false_path -from [get_keepers {*qsys_nios2_qsys:*|qsys_nios2_qsys_nios2_oci:the_qsys_nios2_qsys_nios2_oci|qsys_nios2_qsys_nios2_oci_debug:the_qsys_nios2_qsys_nios2_oci_debug|*resetlatch}] -to [get_keepers {*qsys_nios2_qsys:*|qsys_nios2_qsys_nios2_oci:the_qsys_nios2_qsys_nios2_oci|qsys_nios2_qsys_jtag_debug_module_wrapper:the_qsys_nios2_qsys_jtag_debug_module_wrapper|qsys_nios2_qsys_jtag_debug_module_tck:the_qsys_nios2_qsys_jtag_debug_module_tck|*sr[33]}]
set_false_path -from [get_keepers {*qsys_nios2_qsys:*|qsys_nios2_qsys_nios2_oci:the_qsys_nios2_qsys_nios2_oci|qsys_nios2_qsys_nios2_oci_debug:the_qsys_nios2_qsys_nios2_oci_debug|monitor_ready}] -to [get_keepers {*qsys_nios2_qsys:*|qsys_nios2_qsys_nios2_oci:the_qsys_nios2_qsys_nios2_oci|qsys_nios2_qsys_jtag_debug_module_wrapper:the_qsys_nios2_qsys_jtag_debug_module_wrapper|qsys_nios2_qsys_jtag_debug_module_tck:the_qsys_nios2_qsys_jtag_debug_module_tck|*sr[0]}]
set_false_path -from [get_keepers {*qsys_nios2_qsys:*|qsys_nios2_qsys_nios2_oci:the_qsys_nios2_qsys_nios2_oci|qsys_nios2_qsys_nios2_oci_debug:the_qsys_nios2_qsys_nios2_oci_debug|monitor_error}] -to [get_keepers {*qsys_nios2_qsys:*|qsys_nios2_qsys_nios2_oci:the_qsys_nios2_qsys_nios2_oci|qsys_nios2_qsys_jtag_debug_module_wrapper:the_qsys_nios2_qsys_jtag_debug_module_wrapper|qsys_nios2_qsys_jtag_debug_module_tck:the_qsys_nios2_qsys_jtag_debug_module_tck|*sr[34]}]
set_false_path -from [get_keepers {*qsys_nios2_qsys:*|qsys_nios2_qsys_nios2_oci:the_qsys_nios2_qsys_nios2_oci|qsys_nios2_qsys_nios2_ocimem:the_qsys_nios2_qsys_nios2_ocimem|*MonDReg*}] -to [get_keepers {*qsys_nios2_qsys:*|qsys_nios2_qsys_nios2_oci:the_qsys_nios2_qsys_nios2_oci|qsys_nios2_qsys_jtag_debug_module_wrapper:the_qsys_nios2_qsys_jtag_debug_module_wrapper|qsys_nios2_qsys_jtag_debug_module_tck:the_qsys_nios2_qsys_jtag_debug_module_tck|*sr*}]
set_false_path -from [get_keepers {*qsys_nios2_qsys:*|qsys_nios2_qsys_nios2_oci:the_qsys_nios2_qsys_nios2_oci|qsys_nios2_qsys_jtag_debug_module_wrapper:the_qsys_nios2_qsys_jtag_debug_module_wrapper|qsys_nios2_qsys_jtag_debug_module_tck:the_qsys_nios2_qsys_jtag_debug_module_tck|*sr*}] -to [get_keepers {*qsys_nios2_qsys:*|qsys_nios2_qsys_nios2_oci:the_qsys_nios2_qsys_nios2_oci|qsys_nios2_qsys_jtag_debug_module_wrapper:the_qsys_nios2_qsys_jtag_debug_module_wrapper|qsys_nios2_qsys_jtag_debug_module_sysclk:the_qsys_nios2_qsys_jtag_debug_module_sysclk|*jdo*}]
set_false_path -from [get_keepers {sld_hub:*|irf_reg*}] -to [get_keepers {*qsys_nios2_qsys:*|qsys_nios2_qsys_nios2_oci:the_qsys_nios2_qsys_nios2_oci|qsys_nios2_qsys_jtag_debug_module_wrapper:the_qsys_nios2_qsys_jtag_debug_module_wrapper|qsys_nios2_qsys_jtag_debug_module_sysclk:the_qsys_nios2_qsys_jtag_debug_module_sysclk|ir*}]
set_false_path -from [get_keepers {sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1]}] -to [get_keepers {*qsys_nios2_qsys:*|qsys_nios2_qsys_nios2_oci:the_qsys_nios2_qsys_nios2_oci|qsys_nios2_qsys_nios2_oci_debug:the_qsys_nios2_qsys_nios2_oci_debug|monitor_go}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

