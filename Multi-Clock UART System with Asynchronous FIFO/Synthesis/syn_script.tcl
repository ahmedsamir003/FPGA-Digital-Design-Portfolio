################## Design Compiler Library Files ######################

# 1. Search Paths
set RTL_DIR "/home/ICer/Labs/system/rtl"
set STD_DIR "/home/ICer/Labs/system/std_cells"

lappend search_path $RTL_DIR $STD_DIR

# 2. Technology Libraries
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

# Set target_library to worst-case (SS) corner for setup timing optimization
set target_library [list $SSLIB]

# Include all corners and '*' for design memory mapping
set link_library   [list * $TTLIB $SSLIB $FFLIB]

######################## Reading RTL Files #################################

# Analyze & Elaborate flow (Recommended over read_file)
analyze -format verilog { \
    /home/ICer/Labs/system/rtl/data_sampling.v \
    /home/ICer/Labs/system/rtl/deserializer.v \
    /home/ICer/Labs/system/rtl/DF_Sync.v \
    /home/ICer/Labs/system/rtl/edge_bit_counter.v \
    /home/ICer/Labs/system/rtl/fifo_mem.v \
    /home/ICer/Labs/system/rtl/fifo_rd.v \
    /home/ICer/Labs/system/rtl/fifo_wr.v \
    /home/ICer/Labs/system/rtl/parity_calc.v \
    /home/ICer/Labs/system/rtl/parity_check.v \
    /home/ICer/Labs/system/rtl/RX_FSM.v \
    /home/ICer/Labs/system/rtl/serializer.v \
    /home/ICer/Labs/system/rtl/start_check.v \
    /home/ICer/Labs/system/rtl/stop_check.v \
    /home/ICer/Labs/system/rtl/TX_FSM.v \
    /home/ICer/Labs/system/rtl/TX_mux.v \
    /home/ICer/Labs/system/rtl/UART_RX.v \
    /home/ICer/Labs/system/rtl/async_fifo.v \
    /home/ICer/Labs/system/rtl/UART_TX.v \
    /home/ICer/Labs/system/rtl/system_top.v \
}

elaborate system_top
current_design system_top

# Link design hierarchy
link
check_design

# Save generic GTECH netlist
write_file -format verilog -hierarchy -output system_top_netlist_GTECH.v

###################### Mapping and Optimization ########################

# Advanced synthesis and technology mapping engine
compile_ultra

# Flatten hierarchy to expose all gates directly in Design Vision
ungroup -all -flatten

#############################################################################
# Write out Mapped Gate-Level Design & Reports
#############################################################################

# Final gate-level netlist and DDC database
write_file -format verilog -hierarchy -output system_top_netlist.v
write_file -format ddc     -hierarchy -output system_top.ddc

# Synthesis Reports
report_area   > report_area.txt
report_timing > report_timing.txt
report_power  > report_power.txt

# GUI & Schematic rendering
start_gui
