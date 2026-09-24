####################################################################################
# Synthesis & Constraints Master Script 
# Project: Multi-Clock UART System with Async FIFO
# Top Module: system_top
####################################################################################

########################### Define Top Module ############################
                                                   
set top_module system_top
define_design_lib work -path ./work
set_svf $top_module.svf

################## Design Compiler Library Files Setup ######################

puts "###########################################"
puts "#      Setting Design Libraries           #"
puts "###########################################"

set RTL_DIR "/home/ICer/Labs/system/rtl"
set STD_DIR "/home/ICer/Labs/system/std_cells"
lappend search_path $RTL_DIR $STD_DIR

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

set target_library [list $SSLIB]
set link_library [list * $SSLIB $TTLIB $FFLIB]  

######################## Reading RTL Files #################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

analyze -format verilog { \
    data_sampling.v \
    deserializer.v \
    DF_Sync.v \
    edge_bit_counter.v \
    fifo_mem.v \
    fifo_rd.v \
    fifo_wr.v \
    parity_calc.v \
    parity_check.v \
    RX_FSM.v \
    serializer.v \
    start_check.v \
    stop_check.v \
    TX_FSM.v \
    TX_mux.v \
    UART_RX.v \
    async_fifo.v \
    UART_TX.v \
    system_top.v \
}

elaborate $top_module
current_design $top_module

puts "###############################################"
puts "######## Linking & Checking Design ############"
puts "###############################################"

link 
check_design

# Save generic GTECH netlist before constraints
file mkdir netlists
write_file -format verilog -hierarchy -output netlists/${top_module}_netlist_GTECH.v

puts "###############################################"
puts "############ Design Constraints ###############"
puts "###############################################"

# Prevent assign statements in the generated netlist
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

# -------------------------------------------------------------------------
# 1. Clock Definitions
# -------------------------------------------------------------------------
# Master Clock 1: Receiver Domain (rx_clk) -> 100 MHz (10ns)
set CLK1_NAME RX_CLK
set CLK1_PER 10.0
set CLK1_SETUP_SKEW 0.2
set CLK1_HOLD_SKEW 0.1
set CLK1_LAT 0
set CLK1_RISE 0.05
set CLK1_FALL 0.05

create_clock            -name   $CLK1_NAME      -period $CLK1_PER -waveform "0 [expr $CLK1_PER/2.0]"  [get_ports rx_clk]
set_clock_uncertainty   -setup  $CLK1_SETUP_SKEW                                                      [get_clocks $CLK1_NAME]
set_clock_uncertainty   -hold   $CLK1_HOLD_SKEW                                                       [get_clocks $CLK1_NAME]
set_clock_transition    -rise   $CLK1_RISE                                                            [get_clocks $CLK1_NAME]
set_clock_transition    -fall   $CLK1_FALL                                                            [get_clocks $CLK1_NAME]
set_clock_latency               $CLK1_LAT                                                             [get_clocks $CLK1_NAME]

# Master Clock 2: Transmitter Domain (tx_clk) -> 40 MHz (25ns)
set CLK2_NAME TX_CLK
set CLK2_PER 25.0
set CLK2_SETUP_SKEW 0.2
set CLK2_HOLD_SKEW 0.1
set CLK2_LAT 0
set CLK2_RISE 0.05
set CLK2_FALL 0.05

create_clock            -name   $CLK2_NAME      -period $CLK2_PER -waveform "0 [expr $CLK2_PER/2.0]"  [get_ports tx_clk]
set_clock_uncertainty   -setup  $CLK2_SETUP_SKEW                                                      [get_clocks $CLK2_NAME]
set_clock_uncertainty   -hold   $CLK2_HOLD_SKEW                                                       [get_clocks $CLK2_NAME]
set_clock_transition    -rise   $CLK2_RISE                                                            [get_clocks $CLK2_NAME]
set_clock_transition    -fall   $CLK2_FALL                                                            [get_clocks $CLK2_NAME]
set_clock_latency               $CLK2_LAT                                                             [get_clocks $CLK2_NAME]

# Prevent DC from buffering the clock nets directly, and idealize resets
set_dont_touch_network [get_clocks "$CLK1_NAME $CLK2_NAME"]
set_ideal_network      [get_ports {rx_rstn tx_rstn}]

# -------------------------------------------------------------------------
# 2. Clock Relationships (CDC)
# -------------------------------------------------------------------------
# Declare RX and TX domains as asynchronous to ensure safe Clock Domain Crossing (CDC)
set_clock_groups -asynchronous -group [get_clocks $CLK1_NAME] -group [get_clocks $CLK2_NAME]

# -------------------------------------------------------------------------
# 3. Set Input/Output Delays on Ports
# -------------------------------------------------------------------------
set in_delay_rx  [expr 0.2*$CLK1_PER]
set out_delay_rx [expr 0.2*$CLK1_PER]
set in_delay_tx  [expr 0.2*$CLK2_PER]
set out_delay_tx [expr 0.2*$CLK2_PER]

# Port Groupings mapped to system_top.v
set RX_IN_PORTS  [get_ports {rx_in rx_par_en rx_par_typ rx_prescale rx_rstn}]
set RX_OUT_PORTS [get_ports {rx_stop_error rx_parity_error fifo_full}]

set TX_IN_PORTS  [get_ports {tx_par_en tx_par_typ fifo_rd_inc tx_data_valid tx_rstn}]
set TX_OUT_PORTS [get_ports {tx_out tx_busy fifo_empty fifo_rd_data}]

# Constrain RX Domain Paths (Relative to rx_clk)
set_input_delay  $in_delay_rx  -clock $CLK1_NAME $RX_IN_PORTS
set_output_delay $out_delay_rx -clock $CLK1_NAME $RX_OUT_PORTS

# Constrain TX Domain Paths (Relative to tx_clk)
set_input_delay  $in_delay_tx  -clock $CLK2_NAME $TX_IN_PORTS
set_output_delay $out_delay_tx -clock $CLK2_NAME $TX_OUT_PORTS

# -------------------------------------------------------------------------
# 4. Driving Cells & Output Loads
# -------------------------------------------------------------------------
# Apply driving cell to all inputs EXCEPT the clocks
set ALL_DATA_INPUTS [remove_from_collection [all_inputs] [get_ports {rx_clk tx_clk}]]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y $ALL_DATA_INPUTS

set_load 0.1 [all_outputs]

# -------------------------------------------------------------------------
# 5. Operating Conditions & Wireload Model
# -------------------------------------------------------------------------
set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
                         -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c

puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile_ultra 

###################### Pre-write Cleanups ##################################
change_names -rule verilog -hierarchy
set verilogout_no_tri true

#############################################################################
# Write out files
#############################################################################
file mkdir sdf
file mkdir sdc
file mkdir reports

write_file -format ddc     -hierarchy -output netlists/$top_module.ddc
write_file -format verilog -hierarchy -output netlists/$top_module.v
write_sdf  sdf/$top_module.sdf
write_sdc  -nosplit sdc/$top_module.sdc

####################### Reporting ##########################################
report_area -hierarchy > reports/area.rpt
report_power -hierarchy > reports/power.rpt
report_timing -delay_type min > reports/hold.rpt
report_timing -delay_type max > reports/setup.rpt
report_clock -attributes > reports/clocks.rpt
report_constraint -all_violators -nosplit > reports/constraints.rpt

################# Starting graphical user interface #######################
start_gui
