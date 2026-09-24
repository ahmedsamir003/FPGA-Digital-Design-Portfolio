/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Fri Sep 25 02:56:18 2026
/////////////////////////////////////////////////////////////


module system_top ( tx_clk, tx_rstn, rx_clk, rx_rstn, rx_in, rx_par_en, 
        rx_par_typ, rx_prescale, rx_stop_error, rx_parity_error, tx_par_en, 
        tx_par_typ, tx_out, tx_busy, fifo_rd_inc, tx_data_valid, fifo_full, 
        fifo_empty, fifo_rd_data );
  input [5:0] rx_prescale;
  output [7:0] fifo_rd_data;
  input tx_clk, tx_rstn, rx_clk, rx_rstn, rx_in, rx_par_en, rx_par_typ,
         tx_par_en, tx_par_typ, fifo_rd_inc, tx_data_valid;
  output rx_stop_error, rx_parity_error, tx_out, tx_busy, fifo_full,
         fifo_empty;
  wire   n612, n613, n614, n615, n616, n617, n618, n619, u_uart_rx_sampled_bit,
         u_uart_rx_strt_glitch, u_uart_tx_ser_data,
         u_uart_rx_u_edge_bit_counter_N36, u_uart_rx_u_edge_bit_counter_N35,
         u_uart_rx_u_edge_bit_counter_N34, u_uart_rx_u_edge_bit_counter_N33,
         u_uart_rx_u_edge_bit_counter_N32, u_uart_rx_u_edge_bit_counter_N31,
         eq_x_39_n25, eq_x_37_n25, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n548, n549, n550, n551, n552, n553, n554,
         n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576,
         n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611;
  wire   [7:0] rx_pdata;
  wire   [3:0] u_uart_rx_bit_cnt;
  wire   [5:0] u_uart_rx_edge_cnt;
  wire   [3:0] u_async_fifo_gray_rd_ptr;
  wire   [2:0] u_async_fifo_r_addr;
  wire   [3:0] u_async_fifo_rq2_wptr;
  wire   [3:0] u_async_fifo_gray_w_ptr;
  wire   [2:0] u_async_fifo_w_addr;
  wire   [3:0] u_async_fifo_wq2_rptr;
  wire   [2:0] u_uart_rx_u_RX_FSM_current_state;
  wire   [1:0] u_uart_rx_u_data_sampling_samples;
  wire   [2:0] u_async_fifo_u_fifo_wr_wgray_next;
  wire   [3:0] u_async_fifo_u_fifo_wr_wbin_next;
  wire   [2:0] u_async_fifo_u_fifo_rd_r_gray_next;
  wire   [3:1] u_async_fifo_u_fifo_rd_r_bin_next;
  wire   [63:0] u_async_fifo_u_fifo_mem_mem;
  wire   [3:0] u_async_fifo_u_sync_r2w_sync_reg;
  wire   [2:0] u_uart_tx_u_serializer_count;
  wire   [7:1] u_uart_tx_u_serializer_shift_data;
  wire   [2:0] u_uart_tx_u_fsm_next_state;
  wire   [2:0] u_uart_tx_u_fsm_current_state;
  wire   [3:0] u_async_fifo_u_sync_w2r_sync_reg;

  DFFRQX1M u_uart_rx_u_deserializer_P_DATA_reg_7_ ( .D(n231), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[7]) );
  DFFRQX1M u_uart_rx_u_deserializer_P_DATA_reg_6_ ( .D(n228), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[6]) );
  DFFRQX1M u_uart_rx_u_deserializer_P_DATA_reg_5_ ( .D(n227), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[5]) );
  DFFRQX1M u_uart_rx_u_deserializer_P_DATA_reg_4_ ( .D(n226), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[4]) );
  DFFRQX1M u_uart_rx_u_deserializer_P_DATA_reg_3_ ( .D(n225), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[3]) );
  DFFRQX1M u_uart_rx_u_deserializer_P_DATA_reg_2_ ( .D(n224), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[2]) );
  DFFRQX1M u_uart_rx_u_deserializer_P_DATA_reg_1_ ( .D(n223), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[1]) );
  DFFRQX1M u_uart_rx_u_deserializer_P_DATA_reg_0_ ( .D(n222), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[0]) );
  DFFRQX1M u_uart_rx_u_start_check_strt_glitch_reg ( .D(n221), .CK(rx_clk), 
        .RN(rx_rstn), .Q(u_uart_rx_strt_glitch) );
  DFFRQX1M u_uart_rx_u_RX_FSM_current_state_reg_0_ ( .D(n314), .CK(rx_clk), 
        .RN(rx_rstn), .Q(u_uart_rx_u_RX_FSM_current_state[0]) );
  DFFRQX1M u_uart_rx_u_edge_bit_counter_bit_cnt_reg_2_ ( .D(n311), .CK(rx_clk), 
        .RN(rx_rstn), .Q(u_uart_rx_bit_cnt[2]) );
  DFFRQX1M u_uart_rx_u_RX_FSM_current_state_reg_1_ ( .D(n315), .CK(rx_clk), 
        .RN(rx_rstn), .Q(u_uart_rx_u_RX_FSM_current_state[1]) );
  DFFRQX1M u_async_fifo_u_sync_w2r_sync_reg_reg_3_ ( .D(
        u_async_fifo_gray_w_ptr[3]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_async_fifo_u_sync_w2r_sync_reg[3]) );
  DFFRQX1M u_async_fifo_u_sync_w2r_sync_reg_3_ ( .D(
        u_async_fifo_u_sync_w2r_sync_reg[3]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_async_fifo_rq2_wptr[3]) );
  DFFRQX1M u_async_fifo_u_fifo_rd_gray_rd_ptr_reg_0_ ( .D(
        u_async_fifo_u_fifo_rd_r_gray_next[0]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_async_fifo_gray_rd_ptr[0]) );
  DFFRQX1M u_async_fifo_u_sync_r2w_sync_reg_reg_0_ ( .D(
        u_async_fifo_gray_rd_ptr[0]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_u_sync_r2w_sync_reg[0]) );
  DFFRQX1M u_async_fifo_u_sync_r2w_sync_reg_0_ ( .D(
        u_async_fifo_u_sync_r2w_sync_reg[0]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_wq2_rptr[0]) );
  DFFRQX1M u_async_fifo_u_fifo_rd_gray_rd_ptr_reg_1_ ( .D(n317), .CK(tx_clk), 
        .RN(tx_rstn), .Q(u_async_fifo_gray_rd_ptr[1]) );
  DFFRQX1M u_async_fifo_u_sync_r2w_sync_reg_reg_1_ ( .D(
        u_async_fifo_gray_rd_ptr[1]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_u_sync_r2w_sync_reg[1]) );
  DFFRQX1M u_async_fifo_u_sync_r2w_sync_reg_1_ ( .D(
        u_async_fifo_u_sync_r2w_sync_reg[1]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_wq2_rptr[1]) );
  DFFRQX1M u_async_fifo_u_fifo_rd_gray_rd_ptr_reg_2_ ( .D(
        u_async_fifo_u_fifo_rd_r_gray_next[2]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_async_fifo_gray_rd_ptr[2]) );
  DFFRQX1M u_async_fifo_u_sync_r2w_sync_reg_reg_2_ ( .D(
        u_async_fifo_gray_rd_ptr[2]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_u_sync_r2w_sync_reg[2]) );
  DFFRQX1M u_async_fifo_u_sync_r2w_sync_reg_2_ ( .D(
        u_async_fifo_u_sync_r2w_sync_reg[2]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_wq2_rptr[2]) );
  DFFRQX1M u_async_fifo_u_sync_r2w_sync_reg_reg_3_ ( .D(
        u_async_fifo_gray_rd_ptr[3]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_u_sync_r2w_sync_reg[3]) );
  DFFRQX1M u_async_fifo_u_sync_r2w_sync_reg_3_ ( .D(
        u_async_fifo_u_sync_r2w_sync_reg[3]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_wq2_rptr[3]) );
  DFFRQX1M u_async_fifo_u_fifo_wr_wbin_reg_0_ ( .D(
        u_async_fifo_u_fifo_wr_wbin_next[0]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_w_addr[0]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_7__0_ ( .D(n306), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[0]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_7__7_ ( .D(n305), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[7]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_7__6_ ( .D(n304), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[6]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_7__5_ ( .D(n303), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[5]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_7__4_ ( .D(n302), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[4]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_7__3_ ( .D(n301), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[3]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_7__2_ ( .D(n300), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[2]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_7__1_ ( .D(n299), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[1]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_5__0_ ( .D(n290), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[16]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_5__7_ ( .D(n289), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[23]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_5__6_ ( .D(n288), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[22]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_5__5_ ( .D(n287), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[21]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_5__4_ ( .D(n286), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[20]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_5__3_ ( .D(n285), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[19]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_5__2_ ( .D(n284), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[18]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_5__1_ ( .D(n283), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[17]) );
  DFFRQX1M u_async_fifo_u_fifo_wr_wgray_reg_1_ ( .D(
        u_async_fifo_u_fifo_wr_wgray_next[1]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_gray_w_ptr[1]) );
  DFFRQX1M u_async_fifo_u_sync_w2r_sync_reg_reg_1_ ( .D(
        u_async_fifo_gray_w_ptr[1]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_async_fifo_u_sync_w2r_sync_reg[1]) );
  DFFRQX1M u_async_fifo_u_sync_w2r_sync_reg_1_ ( .D(
        u_async_fifo_u_sync_w2r_sync_reg[1]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_async_fifo_rq2_wptr[1]) );
  DFFRQX1M u_async_fifo_u_fifo_wr_wgray_reg_2_ ( .D(
        u_async_fifo_u_fifo_wr_wgray_next[2]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_gray_w_ptr[2]) );
  DFFRQX1M u_async_fifo_u_sync_w2r_sync_reg_reg_2_ ( .D(
        u_async_fifo_gray_w_ptr[2]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_async_fifo_u_sync_w2r_sync_reg[2]) );
  DFFRQX1M u_async_fifo_u_sync_w2r_sync_reg_2_ ( .D(
        u_async_fifo_u_sync_w2r_sync_reg[2]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_async_fifo_rq2_wptr[2]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_3__0_ ( .D(n274), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[32]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_3__7_ ( .D(n273), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[39]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_3__6_ ( .D(n272), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[38]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_3__5_ ( .D(n271), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[37]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_3__4_ ( .D(n270), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[36]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_3__3_ ( .D(n269), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[35]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_3__2_ ( .D(n268), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[34]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_3__1_ ( .D(n267), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[33]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_1__0_ ( .D(n258), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[48]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_1__7_ ( .D(n257), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[55]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_1__6_ ( .D(n256), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[54]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_1__5_ ( .D(n255), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[53]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_1__4_ ( .D(n254), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[52]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_1__3_ ( .D(n253), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[51]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_1__2_ ( .D(n252), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[50]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_1__1_ ( .D(n251), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[49]) );
  DFFRQX1M u_async_fifo_u_fifo_wr_wgray_reg_0_ ( .D(
        u_async_fifo_u_fifo_wr_wgray_next[0]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_gray_w_ptr[0]) );
  DFFRQX1M u_async_fifo_u_sync_w2r_sync_reg_reg_0_ ( .D(
        u_async_fifo_gray_w_ptr[0]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_async_fifo_u_sync_w2r_sync_reg[0]) );
  DFFRQX1M u_async_fifo_u_sync_w2r_sync_reg_0_ ( .D(
        u_async_fifo_u_sync_w2r_sync_reg[0]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_async_fifo_rq2_wptr[0]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_6__0_ ( .D(n298), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[8]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_6__7_ ( .D(n297), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[15]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_6__6_ ( .D(n296), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[14]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_6__5_ ( .D(n295), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[13]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_6__4_ ( .D(n294), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[12]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_6__3_ ( .D(n293), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[11]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_6__2_ ( .D(n292), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[10]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_6__1_ ( .D(n291), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[9]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_4__0_ ( .D(n282), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[24]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_4__7_ ( .D(n281), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[31]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_4__6_ ( .D(n280), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[30]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_4__5_ ( .D(n279), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[29]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_4__4_ ( .D(n278), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[28]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_4__3_ ( .D(n277), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[27]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_4__2_ ( .D(n276), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[26]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_4__1_ ( .D(n275), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[25]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_2__0_ ( .D(n266), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[40]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_2__7_ ( .D(n265), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[47]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_2__6_ ( .D(n264), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[46]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_2__5_ ( .D(n263), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[45]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_2__4_ ( .D(n262), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[44]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_2__3_ ( .D(n261), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[43]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_2__2_ ( .D(n260), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[42]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_2__1_ ( .D(n259), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[41]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_0__0_ ( .D(n250), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[56]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_0__7_ ( .D(n249), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[63]) );
  DFFRQX1M u_uart_tx_u_serializer_shift_data_reg_7_ ( .D(n232), .CK(tx_clk), 
        .RN(tx_rstn), .Q(u_uart_tx_u_serializer_shift_data[7]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_0__6_ ( .D(n248), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[62]) );
  DFFRQX1M u_uart_tx_u_serializer_shift_data_reg_6_ ( .D(n233), .CK(tx_clk), 
        .RN(tx_rstn), .Q(u_uart_tx_u_serializer_shift_data[6]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_0__5_ ( .D(n247), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[61]) );
  DFFRQX1M u_uart_tx_u_serializer_shift_data_reg_5_ ( .D(n234), .CK(tx_clk), 
        .RN(tx_rstn), .Q(u_uart_tx_u_serializer_shift_data[5]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_0__4_ ( .D(n246), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[60]) );
  DFFRQX1M u_uart_tx_u_serializer_shift_data_reg_4_ ( .D(n235), .CK(tx_clk), 
        .RN(tx_rstn), .Q(u_uart_tx_u_serializer_shift_data[4]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_0__3_ ( .D(n245), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[59]) );
  DFFRQX1M u_uart_tx_u_serializer_shift_data_reg_3_ ( .D(n236), .CK(tx_clk), 
        .RN(tx_rstn), .Q(u_uart_tx_u_serializer_shift_data[3]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_0__2_ ( .D(n244), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[58]) );
  DFFRQX1M u_uart_tx_u_serializer_shift_data_reg_2_ ( .D(n237), .CK(tx_clk), 
        .RN(tx_rstn), .Q(u_uart_tx_u_serializer_shift_data[2]) );
  DFFRQX1M u_async_fifo_u_fifo_mem_mem_reg_0__1_ ( .D(n243), .CK(rx_clk), .RN(
        rx_rstn), .Q(u_async_fifo_u_fifo_mem_mem[57]) );
  DFFRQX1M u_uart_tx_u_serializer_shift_data_reg_1_ ( .D(n238), .CK(tx_clk), 
        .RN(tx_rstn), .Q(u_uart_tx_u_serializer_shift_data[1]) );
  DFFRQX1M u_uart_tx_u_serializer_shift_data_reg_0_ ( .D(n239), .CK(tx_clk), 
        .RN(tx_rstn), .Q(u_uart_tx_ser_data) );
  DFFRQX2M u_uart_tx_u_fsm_current_state_reg_2_ ( .D(
        u_uart_tx_u_fsm_next_state[2]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_uart_tx_u_fsm_current_state[2]) );
  DFFRQX2M u_async_fifo_u_fifo_rd_r_bin_reg_0_ ( .D(n319), .CK(tx_clk), .RN(
        tx_rstn), .Q(u_async_fifo_r_addr[0]) );
  DFFRQX4M u_uart_rx_u_edge_bit_counter_edge_cnt_reg_3_ ( .D(
        u_uart_rx_u_edge_bit_counter_N34), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_uart_rx_edge_cnt[3]) );
  DFFRQX4M u_uart_rx_u_edge_bit_counter_edge_cnt_reg_0_ ( .D(
        u_uart_rx_u_edge_bit_counter_N31), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_uart_rx_edge_cnt[0]) );
  DFFRQX4M u_uart_rx_u_edge_bit_counter_edge_cnt_reg_5_ ( .D(
        u_uart_rx_u_edge_bit_counter_N36), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_uart_rx_edge_cnt[5]) );
  DFFRQX4M u_uart_rx_u_edge_bit_counter_bit_cnt_reg_0_ ( .D(n313), .CK(rx_clk), 
        .RN(rx_rstn), .Q(u_uart_rx_bit_cnt[0]) );
  DFFRQX4M u_uart_rx_u_parity_check_par_err_reg ( .D(n230), .CK(rx_clk), .RN(
        rx_rstn), .Q(rx_parity_error) );
  DFFRQX4M u_uart_tx_u_serializer_count_reg_0_ ( .D(n240), .CK(tx_clk), .RN(
        tx_rstn), .Q(u_uart_tx_u_serializer_count[0]) );
  DFFRQX4M u_async_fifo_u_fifo_rd_r_bin_reg_1_ ( .D(
        u_async_fifo_u_fifo_rd_r_bin_next[1]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_async_fifo_r_addr[1]) );
  DFFRQX2M u_uart_rx_u_RX_FSM_current_state_reg_2_ ( .D(n316), .CK(rx_clk), 
        .RN(rx_rstn), .Q(u_uart_rx_u_RX_FSM_current_state[2]) );
  DFFRQX2M u_async_fifo_u_fifo_wr_wgray_reg_3_ ( .D(
        u_async_fifo_u_fifo_wr_wbin_next[3]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_gray_w_ptr[3]) );
  DFFRQX2M u_uart_rx_u_data_sampling_sampled_bit_reg ( .D(n309), .CK(rx_clk), 
        .RN(rx_rstn), .Q(u_uart_rx_sampled_bit) );
  DFFRQX2M u_uart_rx_u_edge_bit_counter_bit_cnt_reg_3_ ( .D(n310), .CK(rx_clk), 
        .RN(rx_rstn), .Q(u_uart_rx_bit_cnt[3]) );
  DFFSQX4M u_async_fifo_u_fifo_rd_empty_reg ( .D(eq_x_39_n25), .CK(tx_clk), 
        .SN(tx_rstn), .Q(fifo_empty) );
  DFFRQX4M u_async_fifo_u_fifo_wr_full_reg ( .D(eq_x_37_n25), .CK(rx_clk), 
        .RN(rx_rstn), .Q(fifo_full) );
  DFFRQX2M u_uart_tx_u_fsm_current_state_reg_0_ ( .D(
        u_uart_tx_u_fsm_next_state[0]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_uart_tx_u_fsm_current_state[0]) );
  DFFRQX2M u_async_fifo_u_fifo_rd_gray_rd_ptr_reg_3_ ( .D(
        u_async_fifo_u_fifo_rd_r_bin_next[3]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_async_fifo_gray_rd_ptr[3]) );
  DFFRQX4M u_uart_rx_u_edge_bit_counter_edge_cnt_reg_2_ ( .D(
        u_uart_rx_u_edge_bit_counter_N33), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_uart_rx_edge_cnt[2]) );
  DFFRQX4M u_uart_rx_u_edge_bit_counter_edge_cnt_reg_1_ ( .D(
        u_uart_rx_u_edge_bit_counter_N32), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_uart_rx_edge_cnt[1]) );
  DFFRQX4M u_async_fifo_u_fifo_wr_wbin_reg_1_ ( .D(
        u_async_fifo_u_fifo_wr_wbin_next[1]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_w_addr[1]) );
  DFFRQX2M u_uart_rx_u_edge_bit_counter_edge_cnt_reg_4_ ( .D(
        u_uart_rx_u_edge_bit_counter_N35), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_uart_rx_edge_cnt[4]) );
  DFFRQX2M u_uart_rx_u_edge_bit_counter_bit_cnt_reg_1_ ( .D(n312), .CK(rx_clk), 
        .RN(rx_rstn), .Q(u_uart_rx_bit_cnt[1]) );
  DFFRQX4M u_uart_rx_u_stop_check_stp_err_reg ( .D(n229), .CK(rx_clk), .RN(
        rx_rstn), .Q(rx_stop_error) );
  DFFRQX2M u_uart_rx_u_data_sampling_samples_reg_1_ ( .D(n307), .CK(rx_clk), 
        .RN(rx_rstn), .Q(u_uart_rx_u_data_sampling_samples[1]) );
  DFFRQX2M u_uart_tx_u_serializer_count_reg_1_ ( .D(n241), .CK(tx_clk), .RN(
        tx_rstn), .Q(u_uart_tx_u_serializer_count[1]) );
  DFFRQX2M u_uart_tx_u_serializer_count_reg_2_ ( .D(n242), .CK(tx_clk), .RN(
        tx_rstn), .Q(u_uart_tx_u_serializer_count[2]) );
  DFFRQX2M u_uart_rx_u_data_sampling_samples_reg_0_ ( .D(n308), .CK(rx_clk), 
        .RN(rx_rstn), .Q(u_uart_rx_u_data_sampling_samples[0]) );
  DFFRQX1M u_async_fifo_u_fifo_rd_r_bin_reg_2_ ( .D(n320), .CK(tx_clk), .RN(
        tx_rstn), .Q(u_async_fifo_r_addr[2]) );
  DFFRX2M u_uart_tx_u_fsm_current_state_reg_1_ ( .D(
        u_uart_tx_u_fsm_next_state[1]), .CK(tx_clk), .RN(tx_rstn), .Q(
        u_uart_tx_u_fsm_current_state[1]), .QN(n611) );
  DFFRQX4M u_async_fifo_u_fifo_wr_wbin_reg_2_ ( .D(
        u_async_fifo_u_fifo_wr_wbin_next[2]), .CK(rx_clk), .RN(rx_rstn), .Q(
        u_async_fifo_w_addr[2]) );
  BUFX8M U354 ( .A(n363), .Y(n546) );
  NOR2X4M U355 ( .A(n512), .B(n368), .Y(n367) );
  BUFX4M U356 ( .A(rx_prescale[1]), .Y(n481) );
  BUFX4M U357 ( .A(rx_prescale[0]), .Y(n342) );
  AOI221X2M U358 ( .A0(tx_par_en), .A1(n523), .B0(n521), .B1(n523), .C0(n520), 
        .Y(u_uart_tx_u_fsm_next_state[2]) );
  AOI221X2M U359 ( .A0(n608), .A1(u_async_fifo_rq2_wptr[0]), .B0(
        u_async_fifo_rq2_wptr[1]), .B1(n323), .C0(n607), .Y(n609) );
  AOI222X2M U360 ( .A0(fifo_rd_data[3]), .A1(n494), .B0(n532), .B1(
        u_uart_tx_u_serializer_shift_data[4]), .C0(n432), .C1(
        u_uart_tx_u_serializer_shift_data[3]), .Y(n495) );
  AOI222X2M U361 ( .A0(fifo_rd_data[4]), .A1(n494), .B0(n532), .B1(
        u_uart_tx_u_serializer_shift_data[5]), .C0(n432), .C1(
        u_uart_tx_u_serializer_shift_data[4]), .Y(n493) );
  AOI32X1M U362 ( .A0(n523), .A1(n522), .A2(n521), .B0(n520), .B1(n522), .Y(
        u_uart_tx_u_fsm_next_state[0]) );
  AOI22X1M U363 ( .A0(n532), .A1(u_uart_tx_u_serializer_shift_data[3]), .B0(
        n432), .B1(u_uart_tx_u_serializer_shift_data[2]), .Y(n524) );
  AOI22X1M U364 ( .A0(n532), .A1(u_uart_tx_u_serializer_shift_data[7]), .B0(
        n432), .B1(u_uart_tx_u_serializer_shift_data[6]), .Y(n526) );
  AOI22X1M U365 ( .A0(n532), .A1(u_uart_tx_u_serializer_shift_data[6]), .B0(
        n432), .B1(u_uart_tx_u_serializer_shift_data[5]), .Y(n528) );
  AOI22X1M U366 ( .A0(n532), .A1(u_uart_tx_u_serializer_shift_data[2]), .B0(
        n432), .B1(u_uart_tx_u_serializer_shift_data[1]), .Y(n530) );
  AOI22X1M U367 ( .A0(n532), .A1(u_uart_tx_u_serializer_shift_data[1]), .B0(
        n432), .B1(u_uart_tx_ser_data), .Y(n533) );
  CLKINVX1M U368 ( .A(u_async_fifo_r_addr[1]), .Y(n372) );
  CLKINVX1M U369 ( .A(n436), .Y(n441) );
  AOI21BX1M U370 ( .A0(n431), .A1(n430), .B0N(tx_rstn), .Y(n429) );
  CLKINVX2M U371 ( .A(n515), .Y(u_async_fifo_u_fifo_wr_wgray_next[1]) );
  INVX2M U372 ( .A(u_async_fifo_u_fifo_rd_r_gray_next[2]), .Y(n605) );
  BUFX10M U373 ( .A(n366), .Y(n545) );
  CLKNAND2X2M U374 ( .A(u_uart_rx_sampled_bit), .B(n449), .Y(n446) );
  CLKNAND2X2M U375 ( .A(n595), .B(rx_stop_error), .Y(n594) );
  CLKINVX2M U376 ( .A(n563), .Y(u_uart_rx_u_edge_bit_counter_N34) );
  AOI31X1M U377 ( .A0(n415), .A1(n414), .A2(n413), .B0(n412), .Y(n612) );
  AOI31X1M U378 ( .A0(n379), .A1(n378), .A2(n377), .B0(n376), .Y(n613) );
  CLKINVX2M U379 ( .A(n443), .Y(n449) );
  AOI31X1M U380 ( .A0(n385), .A1(n384), .A2(n383), .B0(n382), .Y(n614) );
  AOI31X1M U381 ( .A0(n391), .A1(n390), .A2(n389), .B0(n388), .Y(n615) );
  AOI31X1M U382 ( .A0(n409), .A1(n408), .A2(n407), .B0(n406), .Y(n618) );
  AOI31X1M U383 ( .A0(n425), .A1(n424), .A2(n423), .B0(n422), .Y(n619) );
  NAND2X1M U384 ( .A(u_async_fifo_w_addr[2]), .B(n365), .Y(n364) );
  AOI31X1M U385 ( .A0(n403), .A1(n402), .A2(n401), .B0(n400), .Y(n617) );
  AOI31X1M U386 ( .A0(n397), .A1(n396), .A2(n395), .B0(n394), .Y(n616) );
  NAND3X2M U387 ( .A(n336), .B(u_uart_rx_u_data_sampling_samples[0]), .C(n582), 
        .Y(n335) );
  AO22XLM U388 ( .A0(u_uart_tx_u_serializer_count[1]), .A1(n489), .B0(n490), 
        .B1(u_uart_tx_u_serializer_count[0]), .Y(n241) );
  INVX4M U389 ( .A(n367), .Y(n365) );
  INVX2M U390 ( .A(n506), .Y(n455) );
  INVX2M U391 ( .A(n593), .Y(n510) );
  BUFX2M U392 ( .A(n464), .Y(n322) );
  XOR2X1M U393 ( .A(n341), .B(u_uart_rx_edge_cnt[1]), .Y(n344) );
  CLKINVX4M U394 ( .A(u_uart_rx_bit_cnt[2]), .Y(n559) );
  CLKINVX2M U395 ( .A(u_async_fifo_w_addr[0]), .Y(n361) );
  XOR3X1M U396 ( .A(fifo_rd_data[4]), .B(fifo_rd_data[3]), .C(n428), .Y(n430)
         );
  INVX1M U397 ( .A(fifo_rd_data[2]), .Y(n525) );
  INVX1M U398 ( .A(n317), .Y(n323) );
  INVX1M U399 ( .A(fifo_rd_data[7]), .Y(n496) );
  AOI2BB2X1M U400 ( .B0(n545), .B1(n354), .A0N(u_async_fifo_u_fifo_mem_mem[1]), 
        .A1N(n545), .Y(n299) );
  AOI2BB2X1M U401 ( .B0(n545), .B1(n537), .A0N(u_async_fifo_u_fifo_mem_mem[4]), 
        .A1N(n545), .Y(n302) );
  AOI2BB2X1M U402 ( .B0(n545), .B1(n351), .A0N(u_async_fifo_u_fifo_mem_mem[6]), 
        .A1N(n545), .Y(n304) );
  AOI2BB2X1M U403 ( .B0(n545), .B1(n352), .A0N(u_async_fifo_u_fifo_mem_mem[2]), 
        .A1N(n545), .Y(n300) );
  INVX1M U404 ( .A(fifo_rd_data[6]), .Y(n527) );
  AOI2BB2X1M U405 ( .B0(n545), .B1(n538), .A0N(u_async_fifo_u_fifo_mem_mem[3]), 
        .A1N(n545), .Y(n301) );
  AOI2BB2X1M U406 ( .B0(n545), .B1(n587), .A0N(u_async_fifo_u_fifo_mem_mem[0]), 
        .A1N(n545), .Y(n306) );
  AOI2BB2X1M U407 ( .B0(n545), .B1(n589), .A0N(u_async_fifo_u_fifo_mem_mem[7]), 
        .A1N(n545), .Y(n305) );
  INVX1M U408 ( .A(fifo_rd_data[5]), .Y(n529) );
  AOI2BB2X1M U409 ( .B0(n545), .B1(n353), .A0N(u_async_fifo_u_fifo_mem_mem[5]), 
        .A1N(n545), .Y(n303) );
  INVX1M U410 ( .A(fifo_rd_data[0]), .Y(n535) );
  INVX1M U411 ( .A(fifo_rd_data[1]), .Y(n531) );
  AOI2BB2X1M U412 ( .B0(n546), .B1(n351), .A0N(u_async_fifo_u_fifo_mem_mem[38]), .A1N(n546), .Y(n272) );
  AOI2BB2X1M U413 ( .B0(n546), .B1(n587), .A0N(u_async_fifo_u_fifo_mem_mem[32]), .A1N(n546), .Y(n274) );
  INVX1M U414 ( .A(u_async_fifo_u_fifo_rd_r_gray_next[0]), .Y(n608) );
  AOI2BB2X1M U415 ( .B0(n546), .B1(n538), .A0N(u_async_fifo_u_fifo_mem_mem[35]), .A1N(n546), .Y(n269) );
  AOI2BB2X1M U416 ( .B0(n546), .B1(n352), .A0N(u_async_fifo_u_fifo_mem_mem[34]), .A1N(n546), .Y(n268) );
  AOI2BB2X1M U417 ( .B0(n546), .B1(n589), .A0N(u_async_fifo_u_fifo_mem_mem[39]), .A1N(n546), .Y(n273) );
  AOI2BB2X1M U418 ( .B0(n546), .B1(n353), .A0N(u_async_fifo_u_fifo_mem_mem[37]), .A1N(n546), .Y(n271) );
  AOI2BB2X1M U419 ( .B0(n546), .B1(n354), .A0N(u_async_fifo_u_fifo_mem_mem[33]), .A1N(n546), .Y(n267) );
  AOI2BB2X1M U420 ( .B0(n546), .B1(n537), .A0N(u_async_fifo_u_fifo_mem_mem[36]), .A1N(n546), .Y(n270) );
  BUFX4M U421 ( .A(n586), .Y(n591) );
  CLKBUFX4M U422 ( .A(n617), .Y(fifo_rd_data[2]) );
  CLKBUFX4M U423 ( .A(n616), .Y(fifo_rd_data[3]) );
  INVX1M U424 ( .A(n550), .Y(u_async_fifo_u_fifo_wr_wgray_next[0]) );
  CLKBUFX4M U425 ( .A(n612), .Y(fifo_rd_data[7]) );
  AOI2BB2X1M U426 ( .B0(n542), .B1(n589), .A0N(u_async_fifo_u_fifo_mem_mem[31]), .A1N(n542), .Y(n281) );
  AOI2BB2X1M U427 ( .B0(n542), .B1(n352), .A0N(u_async_fifo_u_fifo_mem_mem[26]), .A1N(n542), .Y(n276) );
  AOI2BB2X1M U428 ( .B0(n542), .B1(n354), .A0N(u_async_fifo_u_fifo_mem_mem[25]), .A1N(n542), .Y(n275) );
  AOI2BB2X1M U429 ( .B0(n542), .B1(n537), .A0N(u_async_fifo_u_fifo_mem_mem[28]), .A1N(n542), .Y(n278) );
  AOI2BB2X1M U430 ( .B0(n540), .B1(n587), .A0N(u_async_fifo_u_fifo_mem_mem[40]), .A1N(n540), .Y(n266) );
  AOI2BB2X1M U431 ( .B0(n542), .B1(n538), .A0N(u_async_fifo_u_fifo_mem_mem[27]), .A1N(n542), .Y(n277) );
  AOI2BB2X1M U432 ( .B0(n541), .B1(n353), .A0N(u_async_fifo_u_fifo_mem_mem[61]), .A1N(n541), .Y(n247) );
  AOI2BB2X1M U433 ( .B0(n539), .B1(n587), .A0N(u_async_fifo_u_fifo_mem_mem[48]), .A1N(n539), .Y(n258) );
  AOI2BB2X1M U434 ( .B0(n544), .B1(n354), .A0N(u_async_fifo_u_fifo_mem_mem[9]), 
        .A1N(n544), .Y(n291) );
  AOI2BB2X1M U435 ( .B0(n542), .B1(n353), .A0N(u_async_fifo_u_fifo_mem_mem[29]), .A1N(n542), .Y(n279) );
  AOI2BB2X1M U436 ( .B0(n540), .B1(n589), .A0N(u_async_fifo_u_fifo_mem_mem[47]), .A1N(n540), .Y(n265) );
  AOI2BB2X1M U437 ( .B0(n542), .B1(n587), .A0N(u_async_fifo_u_fifo_mem_mem[24]), .A1N(n542), .Y(n282) );
  AOI2BB2X1M U438 ( .B0(n541), .B1(n354), .A0N(u_async_fifo_u_fifo_mem_mem[57]), .A1N(n541), .Y(n243) );
  AOI2BB2X1M U439 ( .B0(n542), .B1(n351), .A0N(u_async_fifo_u_fifo_mem_mem[30]), .A1N(n542), .Y(n280) );
  AOI2BB2X1M U440 ( .B0(n539), .B1(n589), .A0N(u_async_fifo_u_fifo_mem_mem[55]), .A1N(n539), .Y(n257) );
  AOI2BB2X1M U441 ( .B0(n540), .B1(n351), .A0N(u_async_fifo_u_fifo_mem_mem[46]), .A1N(n540), .Y(n264) );
  AOI2BB2X1M U442 ( .B0(n540), .B1(n353), .A0N(u_async_fifo_u_fifo_mem_mem[45]), .A1N(n540), .Y(n263) );
  AOI2BB2X1M U443 ( .B0(n540), .B1(n537), .A0N(u_async_fifo_u_fifo_mem_mem[44]), .A1N(n540), .Y(n262) );
  AOI2BB2X1M U444 ( .B0(n539), .B1(n351), .A0N(u_async_fifo_u_fifo_mem_mem[54]), .A1N(n539), .Y(n256) );
  AOI2BB2X1M U445 ( .B0(n544), .B1(n538), .A0N(u_async_fifo_u_fifo_mem_mem[11]), .A1N(n544), .Y(n293) );
  AOI2BB2X1M U446 ( .B0(n540), .B1(n538), .A0N(u_async_fifo_u_fifo_mem_mem[43]), .A1N(n540), .Y(n261) );
  AOI2BB2X1M U447 ( .B0(n541), .B1(n352), .A0N(u_async_fifo_u_fifo_mem_mem[58]), .A1N(n541), .Y(n244) );
  AOI2BB2X1M U448 ( .B0(n540), .B1(n352), .A0N(u_async_fifo_u_fifo_mem_mem[42]), .A1N(n540), .Y(n260) );
  AOI2BB2X1M U449 ( .B0(n539), .B1(n353), .A0N(u_async_fifo_u_fifo_mem_mem[53]), .A1N(n539), .Y(n255) );
  AOI2BB2X1M U450 ( .B0(n544), .B1(n537), .A0N(u_async_fifo_u_fifo_mem_mem[12]), .A1N(n544), .Y(n294) );
  AOI2BB2X1M U451 ( .B0(n540), .B1(n354), .A0N(u_async_fifo_u_fifo_mem_mem[41]), .A1N(n540), .Y(n259) );
  AOI2BB2X1M U452 ( .B0(n539), .B1(n537), .A0N(u_async_fifo_u_fifo_mem_mem[52]), .A1N(n539), .Y(n254) );
  AOI2BB2X1M U453 ( .B0(n544), .B1(n353), .A0N(u_async_fifo_u_fifo_mem_mem[13]), .A1N(n544), .Y(n295) );
  AOI2BB2X1M U454 ( .B0(n541), .B1(n538), .A0N(u_async_fifo_u_fifo_mem_mem[59]), .A1N(n541), .Y(n245) );
  AOI2BB2X1M U455 ( .B0(n541), .B1(n587), .A0N(u_async_fifo_u_fifo_mem_mem[56]), .A1N(n541), .Y(n250) );
  AOI2BB2X1M U456 ( .B0(n544), .B1(n351), .A0N(u_async_fifo_u_fifo_mem_mem[14]), .A1N(n544), .Y(n296) );
  AOI2BB2X1M U457 ( .B0(n541), .B1(n589), .A0N(u_async_fifo_u_fifo_mem_mem[63]), .A1N(n541), .Y(n249) );
  AOI2BB2X1M U458 ( .B0(n544), .B1(n589), .A0N(u_async_fifo_u_fifo_mem_mem[15]), .A1N(n544), .Y(n297) );
  AOI2BB2X1M U459 ( .B0(n539), .B1(n538), .A0N(u_async_fifo_u_fifo_mem_mem[51]), .A1N(n539), .Y(n253) );
  AOI2BB2X1M U460 ( .B0(n539), .B1(n352), .A0N(u_async_fifo_u_fifo_mem_mem[50]), .A1N(n539), .Y(n252) );
  AOI2BB2X1M U461 ( .B0(n544), .B1(n587), .A0N(u_async_fifo_u_fifo_mem_mem[8]), 
        .A1N(n544), .Y(n298) );
  AOI2BB2X1M U462 ( .B0(n541), .B1(n537), .A0N(u_async_fifo_u_fifo_mem_mem[60]), .A1N(n541), .Y(n246) );
  AOI2BB2X1M U463 ( .B0(n541), .B1(n351), .A0N(u_async_fifo_u_fifo_mem_mem[62]), .A1N(n541), .Y(n248) );
  AOI2BB2X1M U464 ( .B0(n539), .B1(n354), .A0N(u_async_fifo_u_fifo_mem_mem[49]), .A1N(n539), .Y(n251) );
  AOI2BB2X1M U465 ( .B0(n544), .B1(n352), .A0N(u_async_fifo_u_fifo_mem_mem[10]), .A1N(n544), .Y(n292) );
  INVX1M U466 ( .A(u_async_fifo_u_fifo_wr_wbin_next[1]), .Y(n501) );
  AO22X1M U467 ( .A0(n499), .A1(n500), .B0(n450), .B1(n497), .Y(n318) );
  AOI2BB2X1M U468 ( .B0(n543), .B1(n354), .A0N(u_async_fifo_u_fifo_mem_mem[17]), .A1N(n543), .Y(n283) );
  AOI2BB2X1M U469 ( .B0(n543), .B1(n352), .A0N(u_async_fifo_u_fifo_mem_mem[18]), .A1N(n543), .Y(n284) );
  AOI2BB2X1M U470 ( .B0(n543), .B1(n587), .A0N(u_async_fifo_u_fifo_mem_mem[16]), .A1N(n543), .Y(n290) );
  AOI2BB2X1M U471 ( .B0(n543), .B1(n353), .A0N(u_async_fifo_u_fifo_mem_mem[21]), .A1N(n543), .Y(n287) );
  AOI2BB2X1M U472 ( .B0(n543), .B1(n538), .A0N(u_async_fifo_u_fifo_mem_mem[19]), .A1N(n543), .Y(n285) );
  AOI2BB2X1M U473 ( .B0(n543), .B1(n537), .A0N(u_async_fifo_u_fifo_mem_mem[20]), .A1N(n543), .Y(n286) );
  AOI2BB2X1M U474 ( .B0(n543), .B1(n351), .A0N(u_async_fifo_u_fifo_mem_mem[22]), .A1N(n543), .Y(n288) );
  AOI2BB2X1M U475 ( .B0(n543), .B1(n589), .A0N(u_async_fifo_u_fifo_mem_mem[23]), .A1N(n543), .Y(n289) );
  NAND3X1M U476 ( .A(n593), .B(n505), .C(n504), .Y(n457) );
  INVX1M U477 ( .A(u_async_fifo_u_fifo_wr_wbin_next[0]), .Y(n511) );
  NOR2X1M U478 ( .A(n571), .B(n570), .Y(n569) );
  NAND3X1M U479 ( .A(u_uart_rx_bit_cnt[0]), .B(n553), .C(n552), .Y(n548) );
  NAND2X1M U480 ( .A(n553), .B(n552), .Y(n555) );
  OAI2BB1X1M U481 ( .A0N(u_uart_rx_bit_cnt[0]), .A1N(n553), .B0(n552), .Y(n549) );
  NAND3X1M U482 ( .A(n585), .B(u_uart_rx_u_data_sampling_samples[1]), .C(n582), 
        .Y(n583) );
  OAI2BB1X1M U483 ( .A0N(n419), .A1N(u_async_fifo_u_fifo_mem_mem[35]), .B0(
        n392), .Y(n393) );
  OAI2BB1X1M U484 ( .A0N(n419), .A1N(u_async_fifo_u_fifo_mem_mem[34]), .B0(
        n398), .Y(n399) );
  OAI2BB1X1M U485 ( .A0N(n419), .A1N(u_async_fifo_u_fifo_mem_mem[36]), .B0(
        n386), .Y(n387) );
  OAI2BB1X1M U486 ( .A0N(n419), .A1N(u_async_fifo_u_fifo_mem_mem[32]), .B0(
        n418), .Y(n420) );
  OAI2BB1X1M U487 ( .A0N(n419), .A1N(u_async_fifo_u_fifo_mem_mem[33]), .B0(
        n404), .Y(n405) );
  OAI2BB1X1M U488 ( .A0N(n419), .A1N(u_async_fifo_u_fifo_mem_mem[39]), .B0(
        n410), .Y(n411) );
  AND2X1M U489 ( .A(n581), .B(n582), .Y(n439) );
  OAI2BB1X1M U490 ( .A0N(n419), .A1N(u_async_fifo_u_fifo_mem_mem[37]), .B0(
        n380), .Y(n381) );
  OAI2BB1X1M U491 ( .A0N(n419), .A1N(u_async_fifo_u_fifo_mem_mem[38]), .B0(
        n374), .Y(n375) );
  INVX4M U492 ( .A(n488), .Y(n432) );
  OAI2B11X1M U493 ( .A1N(n445), .A0(n444), .B0(n581), .C0(n582), .Y(n447) );
  XOR3X1M U494 ( .A(rx_pdata[7]), .B(rx_par_typ), .C(n568), .Y(n570) );
  AOI21X1M U495 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[17]), .B0(n497), 
        .Y(n409) );
  AOI21X1M U496 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[21]), .B0(n497), 
        .Y(n385) );
  AOI21X1M U497 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[23]), .B0(n497), 
        .Y(n415) );
  AOI21X1M U498 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[22]), .B0(n497), 
        .Y(n379) );
  AOI21X1M U499 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[20]), .B0(n497), 
        .Y(n391) );
  NAND2X4M U500 ( .A(u_async_fifo_w_addr[0]), .B(n362), .Y(n368) );
  AOI21X1M U501 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[18]), .B0(n497), 
        .Y(n403) );
  AOI21X1M U502 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[19]), .B0(n497), 
        .Y(n397) );
  AOI21X1M U503 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[16]), .B0(n497), 
        .Y(n425) );
  CLKINVX2M U504 ( .A(n534), .Y(n494) );
  AOI31X1M U505 ( .A0(n564), .A1(n452), .A2(n508), .B0(n451), .Y(n456) );
  INVX6M U506 ( .A(rx_pdata[4]), .Y(n537) );
  INVX6M U507 ( .A(rx_pdata[5]), .Y(n353) );
  INVX6M U508 ( .A(rx_pdata[3]), .Y(n538) );
  INVX1M U509 ( .A(u_uart_rx_strt_glitch), .Y(n487) );
  INVX4M U510 ( .A(u_uart_rx_edge_cnt[4]), .Y(n600) );
  INVX6M U511 ( .A(rx_pdata[6]), .Y(n351) );
  INVX6M U512 ( .A(rx_pdata[2]), .Y(n352) );
  XNOR2X1M U513 ( .A(n342), .B(u_uart_rx_edge_cnt[0]), .Y(n343) );
  INVX1M U514 ( .A(u_uart_rx_edge_cnt[1]), .Y(n602) );
  INVX6M U515 ( .A(rx_pdata[1]), .Y(n354) );
  CLKBUFX4M U516 ( .A(rx_in), .Y(n321) );
  BUFX4M U517 ( .A(rx_prescale[4]), .Y(n471) );
  BUFX4M U518 ( .A(rx_prescale[5]), .Y(n477) );
  INVX6M U519 ( .A(n586), .Y(n588) );
  NOR3X6M U520 ( .A(n508), .B(n455), .C(n503), .Y(n586) );
  NAND2BX4M U521 ( .AN(n546), .B(n364), .Y(u_async_fifo_u_fifo_wr_wbin_next[2]) );
  AOI2BB2X8M U522 ( .B0(u_async_fifo_gray_w_ptr[3]), .B1(n545), .A0N(n545), 
        .A1N(u_async_fifo_gray_w_ptr[3]), .Y(
        u_async_fifo_u_fifo_wr_wbin_next[3]) );
  INVX2M U523 ( .A(n577), .Y(n444) );
  BUFX4M U524 ( .A(rx_prescale[3]), .Y(n469) );
  OAI22X1M U525 ( .A0(n515), .A1(u_async_fifo_wq2_rptr[1]), .B0(
        u_async_fifo_u_fifo_wr_wgray_next[2]), .B1(u_async_fifo_wq2_rptr[2]), 
        .Y(n514) );
  OAI21X2M U526 ( .A0(n336), .A1(n584), .B0(n335), .Y(n308) );
  OR4X1M U527 ( .A(n469), .B(n470), .C(n481), .D(n342), .Y(n345) );
  CLKINVX1M U528 ( .A(n445), .Y(n440) );
  OAI22X1M U529 ( .A0(n470), .A1(n339), .B0(n469), .B1(n340), .Y(n338) );
  NAND2XLM U530 ( .A(n419), .B(u_async_fifo_u_fifo_mem_mem[2]), .Y(n401) );
  NAND2XLM U531 ( .A(n419), .B(u_async_fifo_u_fifo_mem_mem[7]), .Y(n413) );
  BUFX6M U532 ( .A(u_async_fifo_r_addr[2]), .Y(n499) );
  NOR3X4M U533 ( .A(n564), .B(n452), .C(n508), .Y(n451) );
  INVX4M U534 ( .A(u_uart_rx_u_RX_FSM_current_state[2]), .Y(n564) );
  AND3X2M U535 ( .A(n485), .B(n484), .C(n483), .Y(n592) );
  NAND2XLM U536 ( .A(n419), .B(u_async_fifo_u_fifo_mem_mem[0]), .Y(n423) );
  NAND2XLM U537 ( .A(n419), .B(u_async_fifo_u_fifo_mem_mem[1]), .Y(n407) );
  NAND2XLM U538 ( .A(n419), .B(u_async_fifo_u_fifo_mem_mem[4]), .Y(n389) );
  NAND2XLM U539 ( .A(n419), .B(u_async_fifo_u_fifo_mem_mem[5]), .Y(n383) );
  NAND2XLM U540 ( .A(n419), .B(u_async_fifo_u_fifo_mem_mem[6]), .Y(n377) );
  OR2X1M U541 ( .A(n600), .B(n599), .Y(n596) );
  NAND2XLM U542 ( .A(n506), .B(n505), .Y(n507) );
  OA22X2M U543 ( .A0(n498), .A1(n497), .B0(n320), .B1(
        u_async_fifo_u_fifo_rd_r_bin_next[1]), .Y(n317) );
  AOI21X4M U544 ( .A0(n466), .A1(n465), .B0(n322), .Y(n319) );
  INVX2M U545 ( .A(n318), .Y(n320) );
  AOI221X2M U546 ( .A0(n606), .A1(u_async_fifo_rq2_wptr[3]), .B0(
        u_async_fifo_rq2_wptr[2]), .B1(n605), .C0(n604), .Y(n610) );
  AOI221X2M U547 ( .A0(u_uart_rx_u_RX_FSM_current_state[1]), .A1(n453), .B0(
        n508), .B1(n487), .C0(n503), .Y(n454) );
  AOI211X2M U548 ( .A0(u_uart_rx_edge_cnt[3]), .A1(n437), .B0(n556), .C0(n333), 
        .Y(n334) );
  NOR2X2M U549 ( .A(n365), .B(u_async_fifo_w_addr[2]), .Y(n363) );
  OAI31X2M U550 ( .A0(n564), .A1(n503), .A2(n504), .B0(n348), .Y(n349) );
  INVX4M U551 ( .A(n505), .Y(n503) );
  NAND4X2M U552 ( .A(n461), .B(n458), .C(n460), .D(n459), .Y(n346) );
  OR2X4M U553 ( .A(u_uart_tx_u_fsm_current_state[0]), .B(n520), .Y(n492) );
  NOR3BX2M U554 ( .AN(fifo_rd_inc), .B(fifo_empty), .C(n466), .Y(n464) );
  NAND2X4M U555 ( .A(n361), .B(n362), .Y(n360) );
  NOR2BX4M U556 ( .AN(n451), .B(fifo_full), .Y(n362) );
  NOR2X6M U557 ( .A(n508), .B(u_uart_rx_u_RX_FSM_current_state[0]), .Y(n593)
         );
  NOR3X4M U558 ( .A(n469), .B(n477), .C(n438), .Y(n575) );
  NOR3X4M U559 ( .A(n469), .B(n471), .C(n437), .Y(n574) );
  ADDHX2M U560 ( .A(n478), .B(n477), .CO(n482), .S(n468) );
  NOR2X4M U561 ( .A(n557), .B(n556), .Y(n562) );
  INVX6M U562 ( .A(n499), .Y(n497) );
  NAND4X2M U563 ( .A(n581), .B(n334), .C(n600), .D(n597), .Y(n336) );
  NOR3X12M U564 ( .A(n481), .B(n342), .C(n470), .Y(n581) );
  BUFX8M U565 ( .A(n371), .Y(n416) );
  BUFX8M U566 ( .A(n370), .Y(n417) );
  AOI222X2M U567 ( .A0(n321), .A1(u_uart_rx_u_data_sampling_samples[1]), .B0(
        n321), .B1(u_uart_rx_u_data_sampling_samples[0]), .C0(
        u_uart_rx_u_data_sampling_samples[1]), .C1(
        u_uart_rx_u_data_sampling_samples[0]), .Y(n448) );
  OAI31X2M U568 ( .A0(u_uart_tx_u_serializer_count[2]), .A1(n492), .A2(n518), 
        .B0(n491), .Y(n242) );
  OAI22X4M U569 ( .A0(u_async_fifo_u_fifo_wr_wbin_next[2]), .A1(
        u_async_fifo_u_fifo_wr_wbin_next[1]), .B0(n502), .B1(n501), .Y(n515)
         );
  AOI21X4M U570 ( .A0(rx_parity_error), .A1(rx_par_en), .B0(rx_stop_error), 
        .Y(n504) );
  AOI32X1M U571 ( .A0(n552), .A1(u_uart_rx_bit_cnt[3]), .A2(n559), .B0(n558), 
        .B1(u_uart_rx_bit_cnt[3]), .Y(n462) );
  INVX4M U572 ( .A(n551), .Y(n552) );
  CLKINVX1M U573 ( .A(u_uart_rx_bit_cnt[1]), .Y(n547) );
  AOI33X2M U574 ( .A0(n477), .A1(u_uart_rx_edge_cnt[4]), .A2(n474), .B0(
        u_uart_rx_edge_cnt[3]), .B1(n600), .B2(n437), .Y(n435) );
  AOI33X2M U575 ( .A0(u_uart_rx_edge_cnt[3]), .A1(n575), .A2(n600), .B0(
        u_uart_rx_edge_cnt[4]), .B1(n574), .B2(n474), .Y(n578) );
  INVX4M U576 ( .A(u_async_fifo_w_addr[1]), .Y(n512) );
  NOR3X2M U577 ( .A(u_async_fifo_w_addr[2]), .B(u_async_fifo_w_addr[1]), .C(
        n360), .Y(n356) );
  NOR3X2M U578 ( .A(u_async_fifo_w_addr[2]), .B(u_async_fifo_w_addr[1]), .C(
        n368), .Y(n350) );
  NOR3X2M U579 ( .A(u_uart_rx_edge_cnt[1]), .B(u_uart_rx_edge_cnt[5]), .C(
        u_uart_rx_edge_cnt[0]), .Y(n580) );
  INVX4M U580 ( .A(u_uart_rx_edge_cnt[2]), .Y(n557) );
  INVX6M U581 ( .A(rx_pdata[0]), .Y(n587) );
  INVX6M U582 ( .A(rx_pdata[7]), .Y(n589) );
  XNOR2X4M U583 ( .A(n337), .B(u_uart_rx_edge_cnt[2]), .Y(n339) );
  NOR2X2M U584 ( .A(n481), .B(n342), .Y(n337) );
  OAI31X2M U585 ( .A0(u_uart_rx_bit_cnt[3]), .A1(n559), .A2(n560), .B0(n462), 
        .Y(n310) );
  OAI31X2M U586 ( .A0(n449), .A1(n448), .A2(n447), .B0(n446), .Y(n309) );
  INVX4M U587 ( .A(u_uart_rx_edge_cnt[3]), .Y(n474) );
  OAI31X2M U588 ( .A0(rx_par_en), .A1(n453), .A2(n588), .B0(n349), .Y(n316) );
  AOI31X4M U589 ( .A0(u_uart_tx_u_fsm_current_state[0]), .A1(n434), .A2(n519), 
        .B0(n433), .Y(tx_out) );
  AOI2BB2X1M U590 ( .B0(u_uart_tx_u_serializer_count[0]), .B1(n488), .A0N(n532), .A1N(u_uart_tx_u_serializer_count[0]), .Y(n240) );
  AO21XLM U591 ( .A0(n573), .A1(rx_parity_error), .B0(n572), .Y(n230) );
  AOI22X4M U592 ( .A0(n512), .A1(u_async_fifo_u_fifo_wr_wbin_next[0]), .B0(
        n511), .B1(u_async_fifo_u_fifo_wr_wbin_next[1]), .Y(n550) );
  OAI21X4M U593 ( .A0(n362), .A1(n361), .B0(n360), .Y(
        u_async_fifo_u_fifo_wr_wbin_next[0]) );
  OAI21X4M U594 ( .A0(n321), .A1(n508), .B0(n551), .Y(n582) );
  CLKINVX1M U595 ( .A(u_uart_rx_bit_cnt[0]), .Y(n554) );
  AOI221X2M U596 ( .A0(u_uart_rx_edge_cnt[5]), .A1(n598), .B0(n597), .B1(n596), 
        .C0(n601), .Y(u_uart_rx_u_edge_bit_counter_N36) );
  INVX4M U597 ( .A(u_async_fifo_w_addr[2]), .Y(n502) );
  CLKBUFX4M U598 ( .A(n618), .Y(fifo_rd_data[1]) );
  CLKBUFX4M U599 ( .A(n619), .Y(fifo_rd_data[0]) );
  CLKBUFX4M U600 ( .A(n615), .Y(fifo_rd_data[4]) );
  CLKBUFX4M U601 ( .A(n614), .Y(fifo_rd_data[5]) );
  AOI22X2M U602 ( .A0(fifo_rd_data[6]), .A1(fifo_rd_data[5]), .B0(n529), .B1(
        n527), .Y(n431) );
  CLKBUFX4M U603 ( .A(n613), .Y(fifo_rd_data[6]) );
  CLKINVX1M U604 ( .A(u_uart_rx_edge_cnt[0]), .Y(n480) );
  AOI221X2M U605 ( .A0(u_uart_rx_edge_cnt[0]), .A1(n603), .B0(n602), .B1(n603), 
        .C0(n601), .Y(u_uart_rx_u_edge_bit_counter_N32) );
  NAND2XLM U606 ( .A(n419), .B(u_async_fifo_u_fifo_mem_mem[3]), .Y(n395) );
  BUFX5M U607 ( .A(rx_prescale[2]), .Y(n470) );
  INVX2M U608 ( .A(n477), .Y(n437) );
  NAND2X2M U609 ( .A(u_uart_rx_edge_cnt[1]), .B(u_uart_rx_edge_cnt[0]), .Y(
        n556) );
  INVX2M U610 ( .A(n471), .Y(n438) );
  AOI221X2M U611 ( .A0(n477), .A1(n471), .B0(n474), .B1(n438), .C0(n469), .Y(
        n332) );
  NAND3X2M U612 ( .A(n469), .B(n438), .C(n437), .Y(n577) );
  AOI22X1M U613 ( .A0(u_uart_rx_edge_cnt[2]), .A1(n332), .B0(n444), .B1(n557), 
        .Y(n333) );
  INVX2M U614 ( .A(u_uart_rx_edge_cnt[5]), .Y(n597) );
  INVX2M U615 ( .A(u_uart_rx_u_RX_FSM_current_state[0]), .Y(n452) );
  NOR2X4M U616 ( .A(n452), .B(u_uart_rx_u_RX_FSM_current_state[2]), .Y(n506)
         );
  INVX4M U617 ( .A(u_uart_rx_u_RX_FSM_current_state[1]), .Y(n508) );
  NOR2X4M U618 ( .A(n506), .B(n593), .Y(n551) );
  NAND2X2M U619 ( .A(n321), .B(n552), .Y(n584) );
  NAND4X2M U620 ( .A(u_uart_rx_bit_cnt[3]), .B(n559), .C(n547), .D(n554), .Y(
        n453) );
  NOR2X2M U621 ( .A(n471), .B(n345), .Y(n347) );
  XNOR2X4M U622 ( .A(n581), .B(u_uart_rx_edge_cnt[3]), .Y(n340) );
  AOI221X4M U623 ( .A0(n340), .A1(n469), .B0(n339), .B1(n470), .C0(n338), .Y(
        n461) );
  XNOR3X2M U624 ( .A(n477), .B(u_uart_rx_edge_cnt[5]), .C(n347), .Y(n458) );
  OAI2BB2X1M U625 ( .B0(n481), .B1(n342), .A0N(n481), .A1N(n342), .Y(n341) );
  NOR2X2M U626 ( .A(n344), .B(n343), .Y(n460) );
  XOR3X2M U627 ( .A(n471), .B(u_uart_rx_edge_cnt[4]), .C(n345), .Y(n459) );
  AOI2B1X4M U628 ( .A1N(n477), .A0(n347), .B0(n346), .Y(n505) );
  AOI21X2M U629 ( .A0(n564), .A1(n503), .B0(n510), .Y(n348) );
  BUFX8M U630 ( .A(n350), .Y(n539) );
  NOR3X2M U631 ( .A(u_async_fifo_w_addr[2]), .B(n512), .C(n360), .Y(n355) );
  BUFX8M U632 ( .A(n355), .Y(n540) );
  BUFX8M U633 ( .A(n356), .Y(n541) );
  NOR3X2M U634 ( .A(u_async_fifo_w_addr[1]), .B(n502), .C(n360), .Y(n357) );
  BUFX8M U635 ( .A(n357), .Y(n542) );
  NOR3X2M U636 ( .A(u_async_fifo_w_addr[1]), .B(n502), .C(n368), .Y(n358) );
  BUFX8M U637 ( .A(n358), .Y(n543) );
  NOR3X2M U638 ( .A(n502), .B(n512), .C(n360), .Y(n359) );
  BUFX8M U639 ( .A(n359), .Y(n544) );
  NOR2X2M U640 ( .A(n502), .B(n365), .Y(n366) );
  AOI2BB2X4M U641 ( .B0(u_async_fifo_gray_w_ptr[3]), .B1(
        u_async_fifo_u_fifo_wr_wbin_next[2]), .A0N(
        u_async_fifo_u_fifo_wr_wbin_next[2]), .A1N(
        u_async_fifo_u_fifo_wr_wbin_next[3]), .Y(
        u_async_fifo_u_fifo_wr_wgray_next[2]) );
  AOI21X4M U642 ( .A0(n512), .A1(n368), .B0(n367), .Y(
        u_async_fifo_u_fifo_wr_wbin_next[1]) );
  INVX2M U643 ( .A(u_async_fifo_r_addr[0]), .Y(n466) );
  NOR2X2M U644 ( .A(u_async_fifo_r_addr[1]), .B(n466), .Y(n369) );
  BUFX8M U645 ( .A(n369), .Y(n421) );
  NOR2X2M U646 ( .A(u_async_fifo_r_addr[1]), .B(u_async_fifo_r_addr[0]), .Y(
        n370) );
  NOR2X2M U647 ( .A(u_async_fifo_r_addr[0]), .B(n372), .Y(n371) );
  AOI22X1M U648 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[30]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[14]), .Y(n378) );
  NOR2X2M U649 ( .A(n372), .B(n466), .Y(n373) );
  BUFX8M U650 ( .A(n373), .Y(n419) );
  AOI22X1M U651 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[62]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[46]), .Y(n374) );
  AOI211X2M U652 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[54]), .B0(n499), 
        .C0(n375), .Y(n376) );
  AOI22X1M U653 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[29]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[13]), .Y(n384) );
  AOI22X1M U654 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[61]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[45]), .Y(n380) );
  AOI211X2M U655 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[53]), .B0(n499), 
        .C0(n381), .Y(n382) );
  AOI22X1M U656 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[28]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[12]), .Y(n390) );
  AOI22X1M U657 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[60]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[44]), .Y(n386) );
  AOI211X2M U658 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[52]), .B0(n499), 
        .C0(n387), .Y(n388) );
  AOI22X1M U659 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[27]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[11]), .Y(n396) );
  AOI22X1M U660 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[59]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[43]), .Y(n392) );
  AOI211X2M U661 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[51]), .B0(n499), 
        .C0(n393), .Y(n394) );
  AOI22X1M U662 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[26]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[10]), .Y(n402) );
  AOI22X1M U663 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[58]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[42]), .Y(n398) );
  AOI211X2M U664 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[50]), .B0(n499), 
        .C0(n399), .Y(n400) );
  AOI22X1M U665 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[25]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[9]), .Y(n408) );
  AOI22X1M U666 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[57]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[41]), .Y(n404) );
  AOI211X2M U667 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[49]), .B0(n499), 
        .C0(n405), .Y(n406) );
  AOI22X1M U668 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[31]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[15]), .Y(n414) );
  AOI22X1M U669 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[63]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[47]), .Y(n410) );
  AOI211X2M U670 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[55]), .B0(n499), 
        .C0(n411), .Y(n412) );
  AOI22X1M U671 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[24]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[8]), .Y(n424) );
  AOI22X1M U672 ( .A0(n417), .A1(u_async_fifo_u_fifo_mem_mem[56]), .B0(n416), 
        .B1(u_async_fifo_u_fifo_mem_mem[40]), .Y(n418) );
  AOI211X2M U673 ( .A0(n421), .A1(u_async_fifo_u_fifo_mem_mem[48]), .B0(n499), 
        .C0(n420), .Y(n422) );
  CLKINVX4M U674 ( .A(u_uart_tx_u_fsm_current_state[0]), .Y(n523) );
  AOI22X1M U675 ( .A0(fifo_rd_data[2]), .A1(fifo_rd_data[1]), .B0(n531), .B1(
        n525), .Y(n427) );
  AOI22X1M U676 ( .A0(fifo_rd_data[7]), .A1(fifo_rd_data[0]), .B0(n535), .B1(
        n496), .Y(n426) );
  XOR3XLM U677 ( .A(n427), .B(tx_par_typ), .C(n426), .Y(n428) );
  OAI211X2M U678 ( .A0(n431), .A1(n430), .B0(tx_data_valid), .C0(n429), .Y(
        n434) );
  INVX2M U679 ( .A(u_uart_tx_u_fsm_current_state[2]), .Y(n519) );
  AOI21X2M U680 ( .A0(u_uart_tx_u_fsm_current_state[2]), .A1(n523), .B0(n611), 
        .Y(n463) );
  NAND2X2M U681 ( .A(u_uart_tx_u_fsm_current_state[1]), .B(n519), .Y(n520) );
  NAND3X4M U682 ( .A(n519), .B(n611), .C(u_uart_tx_u_fsm_current_state[0]), 
        .Y(n534) );
  NAND2X2M U683 ( .A(n492), .B(n534), .Y(n488) );
  AOI21X2M U684 ( .A0(u_uart_tx_ser_data), .A1(n463), .B0(n432), .Y(n433) );
  NAND2X2M U685 ( .A(u_uart_rx_edge_cnt[0]), .B(n602), .Y(n603) );
  OR4X1M U686 ( .A(u_uart_rx_edge_cnt[2]), .B(u_uart_rx_edge_cnt[5]), .C(n603), 
        .D(n435), .Y(n442) );
  NAND3X2M U687 ( .A(u_uart_rx_edge_cnt[2]), .B(n474), .C(n600), .Y(n576) );
  OAI31X2M U688 ( .A0(u_uart_rx_edge_cnt[5]), .A1(n603), .A2(n576), .B0(n444), 
        .Y(n436) );
  NOR2X2M U689 ( .A(n574), .B(n575), .Y(n445) );
  OAI221X1M U690 ( .A0(n442), .A1(n441), .B0(n440), .B1(n441), .C0(n439), .Y(
        n443) );
  NAND2X2M U691 ( .A(u_async_fifo_r_addr[1]), .B(n322), .Y(n450) );
  INVX2M U692 ( .A(n450), .Y(n500) );
  OAI21X2M U693 ( .A0(u_async_fifo_r_addr[1]), .A1(n322), .B0(n450), .Y(n498)
         );
  INVX2M U694 ( .A(n498), .Y(u_async_fifo_u_fifo_rd_r_bin_next[1]) );
  OAI222X1M U695 ( .A0(n457), .A1(n564), .B0(n321), .B1(n456), .C0(n455), .C1(
        n454), .Y(n314) );
  AND4X4M U696 ( .A(n461), .B(n460), .C(n459), .D(n458), .Y(n553) );
  NAND4X2M U697 ( .A(u_uart_rx_bit_cnt[1]), .B(u_uart_rx_bit_cnt[0]), .C(n553), 
        .D(n552), .Y(n560) );
  AOI31X2M U698 ( .A0(u_uart_rx_bit_cnt[0]), .A1(u_uart_rx_bit_cnt[1]), .A2(
        n553), .B0(n551), .Y(n558) );
  CLKINVX4M U699 ( .A(n492), .Y(n532) );
  OR2X2M U700 ( .A(n463), .B(n494), .Y(tx_busy) );
  NAND2BXLM U701 ( .AN(fifo_empty), .B(fifo_rd_inc), .Y(n465) );
  INVX2M U702 ( .A(u_uart_rx_sampled_bit), .Y(n590) );
  OAI22X1M U703 ( .A0(n600), .A1(n468), .B0(u_uart_rx_edge_cnt[1]), .B1(n470), 
        .Y(n467) );
  AOI221X2M U704 ( .A0(n600), .A1(n468), .B0(n470), .B1(u_uart_rx_edge_cnt[1]), 
        .C0(n467), .Y(n485) );
  ADDHX2M U705 ( .A(n470), .B(n469), .CO(n472), .S(n476) );
  ADDHX2M U706 ( .A(n472), .B(n471), .CO(n478), .S(n475) );
  OAI22X1M U707 ( .A0(n557), .A1(n476), .B0(n474), .B1(n475), .Y(n473) );
  AOI221X2M U708 ( .A0(n557), .A1(n476), .B0(n475), .B1(n474), .C0(n473), .Y(
        n484) );
  OAI22X1M U709 ( .A0(n597), .A1(n482), .B0(n480), .B1(n481), .Y(n479) );
  AOI221X2M U710 ( .A0(n597), .A1(n482), .B0(n481), .B1(n480), .C0(n479), .Y(
        n483) );
  NAND3X2M U711 ( .A(n506), .B(n592), .C(n508), .Y(n486) );
  MXI2X1M U712 ( .A(n590), .B(n487), .S0(n486), .Y(n221) );
  OAI21X2M U713 ( .A0(u_uart_tx_u_serializer_count[0]), .A1(n492), .B0(n488), 
        .Y(n489) );
  NOR2X2M U714 ( .A(u_uart_tx_u_serializer_count[1]), .B(n492), .Y(n490) );
  NAND2X1M U715 ( .A(u_uart_tx_u_serializer_count[1]), .B(
        u_uart_tx_u_serializer_count[0]), .Y(n518) );
  OAI21X1M U716 ( .A0(n490), .A1(n489), .B0(u_uart_tx_u_serializer_count[2]), 
        .Y(n491) );
  CLKINVX1M U717 ( .A(n493), .Y(n235) );
  CLKINVX1M U718 ( .A(n495), .Y(n236) );
  OAI2BB2X1M U719 ( .B0(n496), .B1(n534), .A0N(n432), .A1N(
        u_uart_tx_u_serializer_shift_data[7]), .Y(n232) );
  AOI21X2M U720 ( .A0(n500), .A1(n499), .B0(u_async_fifo_gray_rd_ptr[3]), .Y(
        n536) );
  AOI31X2M U721 ( .A0(n500), .A1(n499), .A2(u_async_fifo_gray_rd_ptr[3]), .B0(
        n536), .Y(u_async_fifo_u_fifo_rd_r_bin_next[3]) );
  NOR2X2M U722 ( .A(n504), .B(n503), .Y(n509) );
  OAI222X1M U723 ( .A0(n510), .A1(n509), .B0(n508), .B1(
        u_uart_rx_u_RX_FSM_current_state[2]), .C0(n507), .C1(
        u_uart_rx_strt_glitch), .Y(n315) );
  OAI22X1M U724 ( .A0(u_async_fifo_u_fifo_wr_wbin_next[3]), .A1(
        u_async_fifo_wq2_rptr[3]), .B0(u_async_fifo_wq2_rptr[0]), .B1(n550), 
        .Y(n513) );
  AOI221X2M U725 ( .A0(u_async_fifo_u_fifo_wr_wbin_next[3]), .A1(
        u_async_fifo_wq2_rptr[3]), .B0(n550), .B1(u_async_fifo_wq2_rptr[0]), 
        .C0(n513), .Y(n517) );
  AOI221X2M U726 ( .A0(n515), .A1(u_async_fifo_wq2_rptr[1]), .B0(
        u_async_fifo_wq2_rptr[2]), .B1(u_async_fifo_u_fifo_wr_wgray_next[2]), 
        .C0(n514), .Y(n516) );
  AND2X2M U727 ( .A(n517), .B(n516), .Y(eq_x_37_n25) );
  AOI21X1M U728 ( .A0(n523), .A1(n611), .B0(u_uart_tx_u_fsm_current_state[2]), 
        .Y(u_uart_tx_u_fsm_next_state[1]) );
  NAND2BX1M U729 ( .AN(n518), .B(u_uart_tx_u_serializer_count[2]), .Y(n521) );
  NAND4X2M U730 ( .A(tx_data_valid), .B(n519), .C(n523), .D(n611), .Y(n522) );
  OAI21X1M U731 ( .A0(n525), .A1(n534), .B0(n524), .Y(n237) );
  OAI21X1M U732 ( .A0(n527), .A1(n534), .B0(n526), .Y(n233) );
  OAI21X1M U733 ( .A0(n529), .A1(n534), .B0(n528), .Y(n234) );
  OAI21X1M U734 ( .A0(n531), .A1(n534), .B0(n530), .Y(n238) );
  OAI21X1M U735 ( .A0(n535), .A1(n534), .B0(n533), .Y(n239) );
  AOI2BB2X2M U736 ( .B0(n319), .B1(u_async_fifo_r_addr[1]), .A0N(
        u_async_fifo_u_fifo_rd_r_bin_next[1]), .A1N(n319), .Y(
        u_async_fifo_u_fifo_rd_r_gray_next[0]) );
  INVX2M U737 ( .A(u_async_fifo_u_fifo_rd_r_bin_next[3]), .Y(n606) );
  OAI2BB2X2M U738 ( .B0(n320), .B1(n606), .A0N(n320), .A1N(n536), .Y(
        u_async_fifo_u_fifo_rd_r_gray_next[2]) );
  AOI22X1M U739 ( .A0(u_uart_rx_bit_cnt[1]), .A1(n549), .B0(n548), .B1(n547), 
        .Y(n312) );
  NOR2X2M U740 ( .A(n553), .B(n551), .Y(n561) );
  INVX4M U741 ( .A(n561), .Y(n601) );
  NOR2X2M U742 ( .A(u_uart_rx_edge_cnt[0]), .B(n601), .Y(
        u_uart_rx_u_edge_bit_counter_N31) );
  AOI22X1M U743 ( .A0(u_uart_rx_bit_cnt[0]), .A1(n601), .B0(n555), .B1(n554), 
        .Y(n313) );
  AOI211X2M U744 ( .A0(n557), .A1(n556), .B0(n562), .C0(n601), .Y(
        u_uart_rx_u_edge_bit_counter_N33) );
  AOI2BB2X2M U745 ( .B0(n560), .B1(n559), .A0N(n559), .A1N(n558), .Y(n311) );
  NAND2X2M U746 ( .A(u_uart_rx_edge_cnt[3]), .B(n562), .Y(n599) );
  OAI211X2M U747 ( .A0(u_uart_rx_edge_cnt[3]), .A1(n562), .B0(n599), .C0(n561), 
        .Y(n563) );
  NAND3X2M U748 ( .A(n593), .B(n592), .C(n564), .Y(n573) );
  AOI22X2M U749 ( .A0(rx_pdata[4]), .A1(rx_pdata[3]), .B0(n538), .B1(n537), 
        .Y(n571) );
  AOI22X1M U750 ( .A0(rx_pdata[6]), .A1(rx_pdata[5]), .B0(n353), .B1(n351), 
        .Y(n567) );
  AOI22X1M U751 ( .A0(rx_pdata[2]), .A1(rx_pdata[1]), .B0(n354), .B1(n352), 
        .Y(n566) );
  AOI22X1M U752 ( .A0(u_uart_rx_sampled_bit), .A1(rx_pdata[0]), .B0(n587), 
        .B1(n590), .Y(n565) );
  XOR3XLM U753 ( .A(n567), .B(n566), .C(n565), .Y(n568) );
  AOI211X2M U754 ( .A0(n571), .A1(n570), .B0(n573), .C0(n569), .Y(n572) );
  OAI22X1M U755 ( .A0(u_uart_rx_edge_cnt[2]), .A1(n578), .B0(n577), .B1(n576), 
        .Y(n579) );
  NAND3X2M U756 ( .A(n581), .B(n580), .C(n579), .Y(n585) );
  OAI21X2M U757 ( .A0(n585), .A1(n584), .B0(n583), .Y(n307) );
  AOI22X1M U758 ( .A0(n591), .A1(n352), .B0(n354), .B1(n588), .Y(n223) );
  AOI22X1M U759 ( .A0(n591), .A1(n354), .B0(n587), .B1(n588), .Y(n222) );
  AOI22X1M U760 ( .A0(n591), .A1(n353), .B0(n537), .B1(n588), .Y(n226) );
  AOI22X1M U761 ( .A0(n591), .A1(n538), .B0(n352), .B1(n588), .Y(n224) );
  AOI22X1M U762 ( .A0(n591), .A1(n589), .B0(n351), .B1(n588), .Y(n228) );
  AOI22X1M U763 ( .A0(n591), .A1(n537), .B0(n538), .B1(n588), .Y(n225) );
  AOI22X1M U764 ( .A0(n591), .A1(n351), .B0(n353), .B1(n588), .Y(n227) );
  AOI22X1M U765 ( .A0(n591), .A1(n590), .B0(n589), .B1(n588), .Y(n231) );
  NAND3X2M U766 ( .A(u_uart_rx_u_RX_FSM_current_state[2]), .B(n593), .C(n592), 
        .Y(n595) );
  OAI21X2M U767 ( .A0(n595), .A1(u_uart_rx_sampled_bit), .B0(n594), .Y(n229)
         );
  NOR2X2M U768 ( .A(n600), .B(n599), .Y(n598) );
  AOI211X2M U769 ( .A0(n600), .A1(n599), .B0(n598), .C0(n601), .Y(
        u_uart_rx_u_edge_bit_counter_N35) );
  OAI22X1M U770 ( .A0(n606), .A1(u_async_fifo_rq2_wptr[3]), .B0(n605), .B1(
        u_async_fifo_rq2_wptr[2]), .Y(n604) );
  OAI22X1M U771 ( .A0(n608), .A1(u_async_fifo_rq2_wptr[0]), .B0(n323), .B1(
        u_async_fifo_rq2_wptr[1]), .Y(n607) );
  AND2X2M U772 ( .A(n610), .B(n609), .Y(eq_x_39_n25) );
endmodule

