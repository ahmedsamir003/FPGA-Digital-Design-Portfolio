onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {TX Domain} -color Cyan /system_top_tb/tx_clk
add wave -noupdate -expand -group {TX Domain} -color {Light Blue} /system_top_tb/tx_rstn
add wave -noupdate -expand -group {RX Domain} -color Cyan /system_top_tb/rx_clk
add wave -noupdate -expand -group {RX Domain} -color {Light Blue} /system_top_tb/rx_rstn
add wave -noupdate -expand -group {RX_Data In} -color Gold /system_top_tb/rx_in
add wave -noupdate -expand -group {RX_Data In} -color {Cornflower Blue} /system_top_tb/rx_par_en
add wave -noupdate -expand -group {RX_Data In} -color {Cornflower Blue} /system_top_tb/rx_par_typ
add wave -noupdate -expand -group {RX_Data In} -color Magenta -radix unsigned /system_top_tb/rx_prescale
add wave -noupdate -expand -group {FIFO Signals} -color White /system_top_tb/fifo_rd_inc
add wave -noupdate -expand -group {FIFO Signals} -color {Pale Green} /system_top_tb/fifo_full
add wave -noupdate -expand -group {FIFO Signals} -color {Pale Green} /system_top_tb/fifo_empty
add wave -noupdate -expand -group {FIFO Signals} -color {Light Steel Blue} -radix hexadecimal /system_top_tb/fifo_rd_data
add wave -noupdate -expand -group {FIFO Signals} -color Khaki -radix unsigned /system_top_tb/DUT/u_uart_rx/u_edge_bit_counter/edge_cnt
add wave -noupdate -expand -group {FIFO Signals} -color Khaki -radix unsigned /system_top_tb/DUT/u_uart_rx/u_edge_bit_counter/bit_cnt
add wave -noupdate -expand -group {FIFO Signals} -color Orchid -radix unsigned /system_top_tb/DUT/u_async_fifo/u_fifo_wr/gray_w_ptr
add wave -noupdate -expand -group {FIFO Signals} -color Orchid -radix unsigned -childformat {{{/system_top_tb/DUT/u_async_fifo/u_fifo_rd/rq2_wptr[3]} -radix unsigned} {{/system_top_tb/DUT/u_async_fifo/u_fifo_rd/rq2_wptr[2]} -radix unsigned} {{/system_top_tb/DUT/u_async_fifo/u_fifo_rd/rq2_wptr[1]} -radix unsigned} {{/system_top_tb/DUT/u_async_fifo/u_fifo_rd/rq2_wptr[0]} -radix unsigned}} -subitemconfig {{/system_top_tb/DUT/u_async_fifo/u_fifo_rd/rq2_wptr[3]} {-color Orchid -radix unsigned} {/system_top_tb/DUT/u_async_fifo/u_fifo_rd/rq2_wptr[2]} {-color Orchid -radix unsigned} {/system_top_tb/DUT/u_async_fifo/u_fifo_rd/rq2_wptr[1]} {-color Orchid -radix unsigned} {/system_top_tb/DUT/u_async_fifo/u_fifo_rd/rq2_wptr[0]} {-color Orchid -radix unsigned}} /system_top_tb/DUT/u_async_fifo/u_fifo_rd/rq2_wptr
add wave -noupdate -color Pink /system_top_tb/tx_par_typ
add wave -noupdate -color Pink /system_top_tb/tx_par_en
add wave -noupdate -expand -group {TX_Data Out} -color Gold /system_top_tb/tx_out
add wave -noupdate -expand -group {TX_Data Out} -color {Medium Slate Blue} /system_top_tb/tx_busy
add wave -noupdate -expand -group {TX_Data Out} -color Gold /system_top_tb/tx_data_valid
add wave -noupdate -expand -group Error_Signals -color Orange /system_top_tb/rx_stop_error
add wave -noupdate -expand -group Error_Signals -color Orange /system_top_tb/rx_parity_error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {212923639 ps} 0} {{Cursor 2} {9803877 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {223970261 ps}
