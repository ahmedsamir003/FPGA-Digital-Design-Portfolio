/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Sep 17 13:17:12 2026
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
  wire   \u_uart_rx/sampled_bit , \u_uart_rx/strt_glitch ,
         \u_uart_tx/ser_data , \u_uart_rx/u_edge_bit_counter/N36 ,
         \u_uart_rx/u_edge_bit_counter/N35 ,
         \u_uart_rx/u_edge_bit_counter/N34 ,
         \u_uart_rx/u_edge_bit_counter/N33 ,
         \u_uart_rx/u_edge_bit_counter/N32 ,
         \u_uart_rx/u_edge_bit_counter/N31 ,
         \u_async_fifo/u_fifo_mem/mem[0][7] ,
         \u_async_fifo/u_fifo_mem/mem[0][6] ,
         \u_async_fifo/u_fifo_mem/mem[0][5] ,
         \u_async_fifo/u_fifo_mem/mem[0][4] ,
         \u_async_fifo/u_fifo_mem/mem[0][3] ,
         \u_async_fifo/u_fifo_mem/mem[0][2] ,
         \u_async_fifo/u_fifo_mem/mem[0][1] ,
         \u_async_fifo/u_fifo_mem/mem[0][0] ,
         \u_async_fifo/u_fifo_mem/mem[1][7] ,
         \u_async_fifo/u_fifo_mem/mem[1][6] ,
         \u_async_fifo/u_fifo_mem/mem[1][5] ,
         \u_async_fifo/u_fifo_mem/mem[1][4] ,
         \u_async_fifo/u_fifo_mem/mem[1][3] ,
         \u_async_fifo/u_fifo_mem/mem[1][2] ,
         \u_async_fifo/u_fifo_mem/mem[1][1] ,
         \u_async_fifo/u_fifo_mem/mem[1][0] ,
         \u_async_fifo/u_fifo_mem/mem[2][7] ,
         \u_async_fifo/u_fifo_mem/mem[2][6] ,
         \u_async_fifo/u_fifo_mem/mem[2][5] ,
         \u_async_fifo/u_fifo_mem/mem[2][4] ,
         \u_async_fifo/u_fifo_mem/mem[2][3] ,
         \u_async_fifo/u_fifo_mem/mem[2][2] ,
         \u_async_fifo/u_fifo_mem/mem[2][1] ,
         \u_async_fifo/u_fifo_mem/mem[2][0] ,
         \u_async_fifo/u_fifo_mem/mem[3][7] ,
         \u_async_fifo/u_fifo_mem/mem[3][6] ,
         \u_async_fifo/u_fifo_mem/mem[3][5] ,
         \u_async_fifo/u_fifo_mem/mem[3][4] ,
         \u_async_fifo/u_fifo_mem/mem[3][3] ,
         \u_async_fifo/u_fifo_mem/mem[3][2] ,
         \u_async_fifo/u_fifo_mem/mem[3][1] ,
         \u_async_fifo/u_fifo_mem/mem[3][0] ,
         \u_async_fifo/u_fifo_mem/mem[4][7] ,
         \u_async_fifo/u_fifo_mem/mem[4][6] ,
         \u_async_fifo/u_fifo_mem/mem[4][5] ,
         \u_async_fifo/u_fifo_mem/mem[4][4] ,
         \u_async_fifo/u_fifo_mem/mem[4][3] ,
         \u_async_fifo/u_fifo_mem/mem[4][2] ,
         \u_async_fifo/u_fifo_mem/mem[4][1] ,
         \u_async_fifo/u_fifo_mem/mem[4][0] ,
         \u_async_fifo/u_fifo_mem/mem[5][7] ,
         \u_async_fifo/u_fifo_mem/mem[5][6] ,
         \u_async_fifo/u_fifo_mem/mem[5][5] ,
         \u_async_fifo/u_fifo_mem/mem[5][4] ,
         \u_async_fifo/u_fifo_mem/mem[5][3] ,
         \u_async_fifo/u_fifo_mem/mem[5][2] ,
         \u_async_fifo/u_fifo_mem/mem[5][1] ,
         \u_async_fifo/u_fifo_mem/mem[5][0] ,
         \u_async_fifo/u_fifo_mem/mem[6][7] ,
         \u_async_fifo/u_fifo_mem/mem[6][6] ,
         \u_async_fifo/u_fifo_mem/mem[6][5] ,
         \u_async_fifo/u_fifo_mem/mem[6][4] ,
         \u_async_fifo/u_fifo_mem/mem[6][3] ,
         \u_async_fifo/u_fifo_mem/mem[6][2] ,
         \u_async_fifo/u_fifo_mem/mem[6][1] ,
         \u_async_fifo/u_fifo_mem/mem[6][0] ,
         \u_async_fifo/u_fifo_mem/mem[7][7] ,
         \u_async_fifo/u_fifo_mem/mem[7][6] ,
         \u_async_fifo/u_fifo_mem/mem[7][5] ,
         \u_async_fifo/u_fifo_mem/mem[7][4] ,
         \u_async_fifo/u_fifo_mem/mem[7][3] ,
         \u_async_fifo/u_fifo_mem/mem[7][2] ,
         \u_async_fifo/u_fifo_mem/mem[7][1] ,
         \u_async_fifo/u_fifo_mem/mem[7][0] , \eq_x_39/n25 , \eq_x_37/n25 ,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506,
         n507, n508, n509, n510, n511, n512, n513, n514, n515, n516, n517,
         n518, n519, n520, n521, n522, n523, n524, n525, n526, n527, n528,
         n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, n539,
         n540, n541, n542, n543, n544, n545, n546, n547, n548, n549, n550,
         n551, n552, n553, n554, n555, n556, n557, n558, n559, n560, n561,
         n562, n563, n564, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n578;
  wire   [7:0] rx_pdata;
  wire   [3:0] \u_uart_rx/bit_cnt ;
  wire   [5:0] \u_uart_rx/edge_cnt ;
  wire   [3:0] \u_async_fifo/gray_rd_ptr ;
  wire   [2:0] \u_async_fifo/r_addr ;
  wire   [3:0] \u_async_fifo/rq2_wptr ;
  wire   [3:0] \u_async_fifo/gray_w_ptr ;
  wire   [2:0] \u_async_fifo/w_addr ;
  wire   [3:0] \u_async_fifo/wq2_rptr ;
  wire   [2:0] \u_uart_rx/u_RX_FSM/current_state ;
  wire   [1:0] \u_uart_rx/u_data_sampling/samples ;
  wire   [2:0] \u_async_fifo/u_fifo_wr/wgray_next ;
  wire   [3:0] \u_async_fifo/u_fifo_wr/wbin_next ;
  wire   [2:0] \u_async_fifo/u_fifo_rd/r_gray_next ;
  wire   [3:0] \u_async_fifo/u_fifo_rd/r_bin_next ;
  wire   [3:0] \u_async_fifo/u_sync_r2w/sync_reg ;
  wire   [2:0] \u_uart_tx/u_serializer/count ;
  wire   [7:1] \u_uart_tx/u_serializer/shift_data ;
  wire   [2:0] \u_uart_tx/u_fsm/next_state ;
  wire   [2:0] \u_uart_tx/u_fsm/current_state ;
  wire   [3:0] \u_async_fifo/u_sync_w2r/sync_reg ;

  DFFSQX2M \u_async_fifo/u_fifo_rd/empty_reg  ( .D(\eq_x_39/n25 ), .CK(tx_clk), 
        .SN(tx_rstn), .Q(fifo_empty) );
  DFFRQX1M \u_async_fifo/u_sync_w2r/sync_reg_reg[0]  ( .D(
        \u_async_fifo/gray_w_ptr [0]), .CK(tx_clk), .RN(tx_rstn), .Q(
        \u_async_fifo/u_sync_w2r/sync_reg [0]) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[5][6]  ( .D(n288), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[5][6] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[2][7]  ( .D(n265), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[2][7] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[7][7]  ( .D(n305), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[7][7] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[4][7]  ( .D(n281), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[4][7] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[1][0]  ( .D(n258), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[1][0] ) );
  DFFRQX1M \u_uart_tx/u_fsm/current_state_reg[0]  ( .D(
        \u_uart_tx/u_fsm/next_state [0]), .CK(tx_clk), .RN(tx_rstn), .Q(
        \u_uart_tx/u_fsm/current_state [0]) );
  DFFRQX1M \u_uart_rx/u_data_sampling/samples_reg[0]  ( .D(n308), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_uart_rx/u_data_sampling/samples [0]) );
  DFFRQX1M \u_uart_rx/u_edge_bit_counter/edge_cnt_reg[2]  ( .D(
        \u_uart_rx/u_edge_bit_counter/N33 ), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_uart_rx/edge_cnt [2]) );
  DFFRQX1M \u_async_fifo/u_fifo_rd/gray_rd_ptr_reg[0]  ( .D(
        \u_async_fifo/u_fifo_rd/r_gray_next [0]), .CK(tx_clk), .RN(tx_rstn), 
        .Q(\u_async_fifo/gray_rd_ptr [0]) );
  DFFRQX1M \u_async_fifo/u_fifo_rd/gray_rd_ptr_reg[1]  ( .D(
        \u_async_fifo/u_fifo_rd/r_gray_next [1]), .CK(tx_clk), .RN(tx_rstn), 
        .Q(\u_async_fifo/gray_rd_ptr [1]) );
  DFFRQX1M \u_async_fifo/u_fifo_rd/gray_rd_ptr_reg[2]  ( .D(
        \u_async_fifo/u_fifo_rd/r_gray_next [2]), .CK(tx_clk), .RN(tx_rstn), 
        .Q(\u_async_fifo/gray_rd_ptr [2]) );
  DFFRQX1M \u_async_fifo/u_fifo_wr/wgray_reg[1]  ( .D(
        \u_async_fifo/u_fifo_wr/wgray_next [1]), .CK(rx_clk), .RN(rx_rstn), 
        .Q(\u_async_fifo/gray_w_ptr [1]) );
  DFFRQX1M \u_async_fifo/u_fifo_wr/wgray_reg[2]  ( .D(
        \u_async_fifo/u_fifo_wr/wgray_next [2]), .CK(rx_clk), .RN(rx_rstn), 
        .Q(\u_async_fifo/gray_w_ptr [2]) );
  DFFRQX1M \u_async_fifo/u_fifo_wr/wgray_reg[0]  ( .D(
        \u_async_fifo/u_fifo_wr/wgray_next [0]), .CK(rx_clk), .RN(rx_rstn), 
        .Q(\u_async_fifo/gray_w_ptr [0]) );
  DFFRQX1M \u_async_fifo/u_fifo_wr/full_reg  ( .D(\eq_x_37/n25 ), .CK(rx_clk), 
        .RN(rx_rstn), .Q(fifo_full) );
  DFFRQX1M \u_uart_rx/u_edge_bit_counter/bit_cnt_reg[2]  ( .D(n311), .CK(
        rx_clk), .RN(rx_rstn), .Q(\u_uart_rx/bit_cnt [2]) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[3][0]  ( .D(n274), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[3][0] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[3][7]  ( .D(n273), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[3][7] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[3][6]  ( .D(n272), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[3][6] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[3][5]  ( .D(n271), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[3][5] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[3][4]  ( .D(n270), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[3][4] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[3][3]  ( .D(n269), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[3][3] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[3][2]  ( .D(n268), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[3][2] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[3][1]  ( .D(n267), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[3][1] ) );
  DFFRQX1M \u_uart_rx/u_parity_check/par_err_reg  ( .D(n230), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_parity_error) );
  DFFRQX1M \u_uart_tx/u_serializer/shift_data_reg[0]  ( .D(n239), .CK(tx_clk), 
        .RN(tx_rstn), .Q(\u_uart_tx/ser_data ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[5][0]  ( .D(n290), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[5][0] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[5][7]  ( .D(n289), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[5][7] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[5][5]  ( .D(n287), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[5][5] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[5][4]  ( .D(n286), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[5][4] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[5][3]  ( .D(n285), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[5][3] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[5][2]  ( .D(n284), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[5][2] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[5][1]  ( .D(n283), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[5][1] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[6][0]  ( .D(n298), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[6][0] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[6][7]  ( .D(n297), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[6][7] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[6][6]  ( .D(n296), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[6][6] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[6][5]  ( .D(n295), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[6][5] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[6][4]  ( .D(n294), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[6][4] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[6][3]  ( .D(n293), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[6][3] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[6][2]  ( .D(n292), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[6][2] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[6][1]  ( .D(n291), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[6][1] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[2][0]  ( .D(n266), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[2][0] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[2][6]  ( .D(n264), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[2][6] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[2][5]  ( .D(n263), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[2][5] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[2][4]  ( .D(n262), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[2][4] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[2][3]  ( .D(n261), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[2][3] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[2][2]  ( .D(n260), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[2][2] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[2][1]  ( .D(n259), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[2][1] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[7][0]  ( .D(n306), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[7][0] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[7][6]  ( .D(n304), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[7][6] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[7][5]  ( .D(n303), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[7][5] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[7][4]  ( .D(n302), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[7][4] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[7][3]  ( .D(n301), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[7][3] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[7][2]  ( .D(n300), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[7][2] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[7][1]  ( .D(n299), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[7][1] ) );
  DFFRQX1M \u_uart_rx/u_stop_check/stp_err_reg  ( .D(n229), .CK(rx_clk), .RN(
        rx_rstn), .Q(rx_stop_error) );
  DFFRQX1M \u_uart_tx/u_serializer/shift_data_reg[6]  ( .D(n233), .CK(tx_clk), 
        .RN(tx_rstn), .Q(\u_uart_tx/u_serializer/shift_data [6]) );
  DFFRQX1M \u_uart_tx/u_serializer/shift_data_reg[2]  ( .D(n237), .CK(tx_clk), 
        .RN(tx_rstn), .Q(\u_uart_tx/u_serializer/shift_data [2]) );
  DFFRQX1M \u_uart_tx/u_serializer/shift_data_reg[1]  ( .D(n238), .CK(tx_clk), 
        .RN(tx_rstn), .Q(\u_uart_tx/u_serializer/shift_data [1]) );
  DFFRQX1M \u_uart_tx/u_serializer/shift_data_reg[5]  ( .D(n234), .CK(tx_clk), 
        .RN(tx_rstn), .Q(\u_uart_tx/u_serializer/shift_data [5]) );
  DFFRQX1M \u_uart_tx/u_serializer/shift_data_reg[7]  ( .D(n232), .CK(tx_clk), 
        .RN(tx_rstn), .Q(\u_uart_tx/u_serializer/shift_data [7]) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[4][0]  ( .D(n282), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[4][0] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[4][6]  ( .D(n280), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[4][6] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[4][5]  ( .D(n279), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[4][5] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[4][4]  ( .D(n278), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[4][4] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[4][3]  ( .D(n277), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[4][3] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[4][2]  ( .D(n276), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[4][2] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[4][1]  ( .D(n275), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[4][1] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[0][0]  ( .D(n250), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[0][0] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[0][7]  ( .D(n249), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[0][7] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[0][6]  ( .D(n248), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[0][6] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[0][5]  ( .D(n247), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[0][5] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[0][4]  ( .D(n246), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[0][4] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[0][3]  ( .D(n245), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[0][3] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[0][2]  ( .D(n244), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[0][2] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[0][1]  ( .D(n243), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[0][1] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[1][7]  ( .D(n257), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[1][7] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[1][6]  ( .D(n256), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[1][6] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[1][5]  ( .D(n255), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[1][5] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[1][4]  ( .D(n254), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[1][4] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[1][3]  ( .D(n253), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[1][3] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[1][2]  ( .D(n252), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[1][2] ) );
  DFFRQX1M \u_async_fifo/u_fifo_mem/mem_reg[1][1]  ( .D(n251), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_async_fifo/u_fifo_mem/mem[1][1] ) );
  DFFRQX1M \u_uart_tx/u_serializer/shift_data_reg[3]  ( .D(n236), .CK(tx_clk), 
        .RN(tx_rstn), .Q(\u_uart_tx/u_serializer/shift_data [3]) );
  DFFRQX1M \u_uart_tx/u_serializer/shift_data_reg[4]  ( .D(n235), .CK(tx_clk), 
        .RN(tx_rstn), .Q(\u_uart_tx/u_serializer/shift_data [4]) );
  DFFRQX1M \u_async_fifo/u_fifo_wr/wbin_reg[0]  ( .D(
        \u_async_fifo/u_fifo_wr/wbin_next [0]), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_async_fifo/w_addr [0]) );
  DFFRQX1M \u_uart_rx/u_deserializer/P_DATA_reg[6]  ( .D(n228), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[6]) );
  DFFRQX1M \u_uart_rx/u_deserializer/P_DATA_reg[4]  ( .D(n226), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[4]) );
  DFFRQX1M \u_uart_rx/u_deserializer/P_DATA_reg[1]  ( .D(n223), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[1]) );
  DFFRQX1M \u_uart_rx/u_RX_FSM/current_state_reg[0]  ( .D(n314), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_uart_rx/u_RX_FSM/current_state [0]) );
  DFFRQX1M \u_uart_rx/u_deserializer/P_DATA_reg[5]  ( .D(n227), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[5]) );
  DFFRQX1M \u_uart_rx/u_deserializer/P_DATA_reg[3]  ( .D(n225), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[3]) );
  DFFRQX1M \u_uart_rx/u_deserializer/P_DATA_reg[2]  ( .D(n224), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[2]) );
  DFFRQX1M \u_uart_rx/u_deserializer/P_DATA_reg[0]  ( .D(n222), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[0]) );
  DFFRQX1M \u_uart_rx/u_deserializer/P_DATA_reg[7]  ( .D(n231), .CK(rx_clk), 
        .RN(rx_rstn), .Q(rx_pdata[7]) );
  DFFRQX1M \u_async_fifo/u_fifo_rd/gray_rd_ptr_reg[3]  ( .D(
        \u_async_fifo/u_fifo_rd/r_bin_next [3]), .CK(tx_clk), .RN(tx_rstn), 
        .Q(\u_async_fifo/gray_rd_ptr [3]) );
  DFFRQX1M \u_uart_tx/u_serializer/count_reg[1]  ( .D(n241), .CK(tx_clk), .RN(
        tx_rstn), .Q(\u_uart_tx/u_serializer/count [1]) );
  DFFRQX1M \u_uart_tx/u_serializer/count_reg[2]  ( .D(n242), .CK(tx_clk), .RN(
        tx_rstn), .Q(\u_uart_tx/u_serializer/count [2]) );
  DFFRQX1M \u_uart_rx/u_start_check/strt_glitch_reg  ( .D(n221), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_uart_rx/strt_glitch ) );
  DFFRQX1M \u_uart_rx/u_edge_bit_counter/bit_cnt_reg[1]  ( .D(n312), .CK(
        rx_clk), .RN(rx_rstn), .Q(\u_uart_rx/bit_cnt [1]) );
  DFFRQX1M \u_uart_tx/u_fsm/current_state_reg[1]  ( .D(
        \u_uart_tx/u_fsm/next_state [1]), .CK(tx_clk), .RN(tx_rstn), .Q(
        \u_uart_tx/u_fsm/current_state [1]) );
  DFFRQX1M \u_async_fifo/u_fifo_rd/r_bin_reg[0]  ( .D(
        \u_async_fifo/u_fifo_rd/r_bin_next [0]), .CK(tx_clk), .RN(tx_rstn), 
        .Q(\u_async_fifo/r_addr [0]) );
  DFFRQX1M \u_uart_rx/u_data_sampling/samples_reg[1]  ( .D(n307), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_uart_rx/u_data_sampling/samples [1]) );
  DFFRQX1M \u_uart_rx/u_edge_bit_counter/bit_cnt_reg[0]  ( .D(n313), .CK(
        rx_clk), .RN(rx_rstn), .Q(\u_uart_rx/bit_cnt [0]) );
  DFFRQX1M \u_uart_rx/u_edge_bit_counter/bit_cnt_reg[3]  ( .D(n310), .CK(
        rx_clk), .RN(rx_rstn), .Q(\u_uart_rx/bit_cnt [3]) );
  DFFRQX1M \u_async_fifo/u_fifo_wr/wgray_reg[3]  ( .D(
        \u_async_fifo/u_fifo_wr/wbin_next [3]), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_async_fifo/gray_w_ptr [3]) );
  DFFRQX1M \u_uart_rx/u_data_sampling/sampled_bit_reg  ( .D(n309), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_uart_rx/sampled_bit ) );
  DFFRQX1M \u_uart_tx/u_fsm/current_state_reg[2]  ( .D(
        \u_uart_tx/u_fsm/next_state [2]), .CK(tx_clk), .RN(tx_rstn), .Q(
        \u_uart_tx/u_fsm/current_state [2]) );
  DFFRQX1M \u_uart_rx/u_RX_FSM/current_state_reg[1]  ( .D(n315), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_uart_rx/u_RX_FSM/current_state [1]) );
  DFFRQX1M \u_uart_tx/u_serializer/count_reg[0]  ( .D(n240), .CK(tx_clk), .RN(
        tx_rstn), .Q(\u_uart_tx/u_serializer/count [0]) );
  DFFRQX1M \u_async_fifo/u_fifo_wr/wbin_reg[1]  ( .D(
        \u_async_fifo/u_fifo_wr/wbin_next [1]), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_async_fifo/w_addr [1]) );
  DFFRQX1M \u_uart_rx/u_edge_bit_counter/edge_cnt_reg[5]  ( .D(
        \u_uart_rx/u_edge_bit_counter/N36 ), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_uart_rx/edge_cnt [5]) );
  DFFRQX1M \u_async_fifo/u_fifo_wr/wbin_reg[2]  ( .D(
        \u_async_fifo/u_fifo_wr/wbin_next [2]), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_async_fifo/w_addr [2]) );
  DFFRQX1M \u_async_fifo/u_fifo_rd/r_bin_reg[1]  ( .D(
        \u_async_fifo/u_fifo_rd/r_bin_next [1]), .CK(tx_clk), .RN(tx_rstn), 
        .Q(\u_async_fifo/r_addr [1]) );
  DFFRQX1M \u_uart_rx/u_RX_FSM/current_state_reg[2]  ( .D(n316), .CK(rx_clk), 
        .RN(rx_rstn), .Q(\u_uart_rx/u_RX_FSM/current_state [2]) );
  DFFRQX1M \u_uart_rx/u_edge_bit_counter/edge_cnt_reg[4]  ( .D(
        \u_uart_rx/u_edge_bit_counter/N35 ), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_uart_rx/edge_cnt [4]) );
  DFFRQX1M \u_uart_rx/u_edge_bit_counter/edge_cnt_reg[0]  ( .D(
        \u_uart_rx/u_edge_bit_counter/N31 ), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_uart_rx/edge_cnt [0]) );
  DFFRQX1M \u_uart_rx/u_edge_bit_counter/edge_cnt_reg[1]  ( .D(
        \u_uart_rx/u_edge_bit_counter/N32 ), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_uart_rx/edge_cnt [1]) );
  DFFRQX1M \u_uart_rx/u_edge_bit_counter/edge_cnt_reg[3]  ( .D(
        \u_uart_rx/u_edge_bit_counter/N34 ), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_uart_rx/edge_cnt [3]) );
  DFFRQX1M \u_async_fifo/u_fifo_rd/r_bin_reg[2]  ( .D(
        \u_async_fifo/u_fifo_rd/r_bin_next [2]), .CK(tx_clk), .RN(tx_rstn), 
        .Q(\u_async_fifo/r_addr [2]) );
  DFFRQX1M \u_async_fifo/u_sync_w2r/sync_reg[3]_inst  ( .D(
        \u_async_fifo/u_sync_w2r/sync_reg [3]), .CK(tx_clk), .RN(tx_rstn), .Q(
        \u_async_fifo/rq2_wptr [3]) );
  DFFRQX1M \u_async_fifo/u_sync_w2r/sync_reg[2]_inst  ( .D(
        \u_async_fifo/u_sync_w2r/sync_reg [2]), .CK(tx_clk), .RN(tx_rstn), .Q(
        \u_async_fifo/rq2_wptr [2]) );
  DFFRQX1M \u_async_fifo/u_sync_w2r/sync_reg[0]_inst  ( .D(
        \u_async_fifo/u_sync_w2r/sync_reg [0]), .CK(tx_clk), .RN(tx_rstn), .Q(
        \u_async_fifo/rq2_wptr [0]) );
  DFFRQX1M \u_async_fifo/u_sync_w2r/sync_reg[1]_inst  ( .D(
        \u_async_fifo/u_sync_w2r/sync_reg [1]), .CK(tx_clk), .RN(tx_rstn), .Q(
        \u_async_fifo/rq2_wptr [1]) );
  DFFRQX1M \u_async_fifo/u_sync_r2w/sync_reg[3]_inst  ( .D(
        \u_async_fifo/u_sync_r2w/sync_reg [3]), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_async_fifo/wq2_rptr [3]) );
  DFFRQX1M \u_async_fifo/u_sync_r2w/sync_reg[0]_inst  ( .D(
        \u_async_fifo/u_sync_r2w/sync_reg [0]), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_async_fifo/wq2_rptr [0]) );
  DFFRQX1M \u_async_fifo/u_sync_r2w/sync_reg[1]_inst  ( .D(
        \u_async_fifo/u_sync_r2w/sync_reg [1]), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_async_fifo/wq2_rptr [1]) );
  DFFRQX1M \u_async_fifo/u_sync_r2w/sync_reg[2]_inst  ( .D(
        \u_async_fifo/u_sync_r2w/sync_reg [2]), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_async_fifo/wq2_rptr [2]) );
  DFFRQX1M \u_async_fifo/u_sync_w2r/sync_reg_reg[3]  ( .D(
        \u_async_fifo/gray_w_ptr [3]), .CK(tx_clk), .RN(tx_rstn), .Q(
        \u_async_fifo/u_sync_w2r/sync_reg [3]) );
  DFFRQX1M \u_async_fifo/u_sync_r2w/sync_reg_reg[0]  ( .D(
        \u_async_fifo/gray_rd_ptr [0]), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_async_fifo/u_sync_r2w/sync_reg [0]) );
  DFFRQX1M \u_async_fifo/u_sync_r2w/sync_reg_reg[1]  ( .D(
        \u_async_fifo/gray_rd_ptr [1]), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_async_fifo/u_sync_r2w/sync_reg [1]) );
  DFFRQX1M \u_async_fifo/u_sync_r2w/sync_reg_reg[2]  ( .D(
        \u_async_fifo/gray_rd_ptr [2]), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_async_fifo/u_sync_r2w/sync_reg [2]) );
  DFFRQX1M \u_async_fifo/u_sync_r2w/sync_reg_reg[3]  ( .D(
        \u_async_fifo/gray_rd_ptr [3]), .CK(rx_clk), .RN(rx_rstn), .Q(
        \u_async_fifo/u_sync_r2w/sync_reg [3]) );
  DFFRQX1M \u_async_fifo/u_sync_w2r/sync_reg_reg[1]  ( .D(
        \u_async_fifo/gray_w_ptr [1]), .CK(tx_clk), .RN(tx_rstn), .Q(
        \u_async_fifo/u_sync_w2r/sync_reg [1]) );
  DFFRQX1M \u_async_fifo/u_sync_w2r/sync_reg_reg[2]  ( .D(
        \u_async_fifo/gray_w_ptr [2]), .CK(tx_clk), .RN(tx_rstn), .Q(
        \u_async_fifo/u_sync_w2r/sync_reg [2]) );
  OAI2BB1XLM U352 ( .A0N(n415), .A1N(\u_async_fifo/u_fifo_mem/mem[3][1] ), 
        .B0(n399), .Y(n400) );
  OAI2BB1XLM U353 ( .A0N(n415), .A1N(\u_async_fifo/u_fifo_mem/mem[3][3] ), 
        .B0(n353), .Y(n354) );
  OAI2BB1XLM U354 ( .A0N(n415), .A1N(\u_async_fifo/u_fifo_mem/mem[3][4] ), 
        .B0(n360), .Y(n361) );
  OAI2BB1XLM U355 ( .A0N(n415), .A1N(\u_async_fifo/u_fifo_mem/mem[3][5] ), 
        .B0(n414), .Y(n416) );
  OAI2BB1XLM U356 ( .A0N(n415), .A1N(\u_async_fifo/u_fifo_mem/mem[3][6] ), 
        .B0(n405), .Y(n406) );
  NOR2XLM U357 ( .A(n352), .B(n425), .Y(n415) );
  OAI2BB1XLM U358 ( .A0N(n415), .A1N(\u_async_fifo/u_fifo_mem/mem[3][7] ), 
        .B0(n381), .Y(n382) );
  AOI31XLM U359 ( .A0(n404), .A1(n403), .A2(n402), .B0(n401), .Y(
        fifo_rd_data[1]) );
  NAND2XLM U360 ( .A(n415), .B(\u_async_fifo/u_fifo_mem/mem[7][1] ), .Y(n402)
         );
  AOI31XLM U361 ( .A0(n398), .A1(n397), .A2(n396), .B0(n395), .Y(
        fifo_rd_data[2]) );
  NAND2XLM U362 ( .A(n415), .B(\u_async_fifo/u_fifo_mem/mem[7][2] ), .Y(n396)
         );
  AOI31XLM U363 ( .A0(n358), .A1(n357), .A2(n356), .B0(n355), .Y(
        fifo_rd_data[3]) );
  AOI31XLM U364 ( .A0(n365), .A1(n364), .A2(n363), .B0(n362), .Y(
        fifo_rd_data[4]) );
  NAND2XLM U365 ( .A(n415), .B(\u_async_fifo/u_fifo_mem/mem[7][4] ), .Y(n363)
         );
  AOI31XLM U366 ( .A0(n421), .A1(n420), .A2(n419), .B0(n418), .Y(
        fifo_rd_data[5]) );
  NAND2XLM U367 ( .A(n415), .B(\u_async_fifo/u_fifo_mem/mem[7][5] ), .Y(n419)
         );
  AOI31XLM U368 ( .A0(n410), .A1(n409), .A2(n408), .B0(n407), .Y(
        fifo_rd_data[6]) );
  NAND2XLM U369 ( .A(n415), .B(\u_async_fifo/u_fifo_mem/mem[7][6] ), .Y(n408)
         );
  AOI31XLM U370 ( .A0(n386), .A1(n385), .A2(n384), .B0(n383), .Y(
        fifo_rd_data[7]) );
  NOR3X1M U371 ( .A(\u_async_fifo/w_addr [1]), .B(n560), .C(n567), .Y(n561) );
  NOR3X1M U372 ( .A(\u_async_fifo/w_addr [2]), .B(n563), .C(n567), .Y(n564) );
  NOR3X1M U373 ( .A(\u_async_fifo/w_addr [2]), .B(\u_async_fifo/w_addr [1]), 
        .C(n567), .Y(n576) );
  NOR3X1M U374 ( .A(\u_async_fifo/w_addr [1]), .B(n560), .C(n565), .Y(n559) );
  AOI22XLM U375 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[0][5] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[2][5] ), .Y(n414) );
  AOI22XLM U376 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[4][5] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[6][5] ), .Y(n420) );
  AOI22XLM U377 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[0][6] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[2][6] ), .Y(n405) );
  AOI22XLM U378 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[4][6] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[6][6] ), .Y(n409) );
  AOI22XLM U379 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[0][1] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[2][1] ), .Y(n399) );
  AOI22XLM U380 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[4][1] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[6][1] ), .Y(n403) );
  AOI22XLM U381 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[0][2] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[2][2] ), .Y(n393) );
  AOI22XLM U382 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[4][2] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[6][2] ), .Y(n397) );
  AOI22XLM U383 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[4][0] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[6][0] ), .Y(n391) );
  AOI22XLM U384 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[0][7] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[2][7] ), .Y(n381) );
  AOI22XLM U385 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[4][7] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[6][7] ), .Y(n385) );
  AOI22XLM U386 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[4][4] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[6][4] ), .Y(n364) );
  AOI22XLM U387 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[0][3] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[2][3] ), .Y(n353) );
  AOI22XLM U388 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[4][3] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[6][3] ), .Y(n357) );
  AOI21XLM U389 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[5][5] ), .B0(
        n411), .Y(n421) );
  AOI21XLM U390 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[5][6] ), .B0(
        n411), .Y(n410) );
  AOI21XLM U391 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[5][1] ), .B0(
        n411), .Y(n404) );
  AOI21XLM U392 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[5][2] ), .B0(
        n411), .Y(n398) );
  AOI21XLM U393 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[5][0] ), .B0(
        n411), .Y(n392) );
  AOI21XLM U394 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[5][7] ), .B0(
        n411), .Y(n386) );
  AOI21XLM U395 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[5][4] ), .B0(
        n411), .Y(n365) );
  AOI21XLM U396 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[5][3] ), .B0(
        n411), .Y(n358) );
  NOR3X1M U397 ( .A(\u_async_fifo/w_addr [2]), .B(\u_async_fifo/w_addr [1]), 
        .C(n565), .Y(n566) );
  OAI211XLM U398 ( .A0(\u_uart_rx/edge_cnt [4]), .A1(n375), .B0(n432), .C0(
        n377), .Y(n374) );
  NAND2XLM U399 ( .A(n451), .B(n484), .Y(n373) );
  AOI22XLM U400 ( .A0(fifo_rd_data[7]), .A1(fifo_rd_data[0]), .B0(n504), .B1(
        n531), .Y(n505) );
  CLKINVX1M U401 ( .A(rx_prescale[5]), .Y(n477) );
  AOI22XLM U402 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[0][0] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[2][0] ), .Y(n387) );
  AOI22XLM U403 ( .A0(n413), .A1(\u_async_fifo/u_fifo_mem/mem[0][4] ), .B0(
        n412), .B1(\u_async_fifo/u_fifo_mem/mem[2][4] ), .Y(n360) );
  NAND3XLM U404 ( .A(n380), .B(n379), .C(n378), .Y(n431) );
  NOR2XLM U405 ( .A(n346), .B(n345), .Y(n344) );
  OAI2BB1XLM U406 ( .A0N(n415), .A1N(\u_async_fifo/u_fifo_mem/mem[3][0] ), 
        .B0(n387), .Y(n388) );
  OAI2BB1XLM U407 ( .A0N(n415), .A1N(\u_async_fifo/u_fifo_mem/mem[3][2] ), 
        .B0(n393), .Y(n394) );
  CLKINVX1M U408 ( .A(n545), .Y(n543) );
  CLKINVX1M U409 ( .A(n549), .Y(n547) );
  OAI211XLM U410 ( .A0(n486), .A1(n485), .B0(n484), .C0(n483), .Y(n488) );
  NAND2BXLM U411 ( .AN(fifo_empty), .B(fifo_rd_inc), .Y(n424) );
  NAND2BXLM U412 ( .AN(n445), .B(\u_uart_tx/u_serializer/count [2]), .Y(n552)
         );
  AOI222XLM U413 ( .A0(fifo_rd_data[3]), .A1(n422), .B0(n577), .B1(
        \u_uart_tx/u_serializer/shift_data [4]), .C0(n529), .C1(
        \u_uart_tx/u_serializer/shift_data [3]), .Y(n359) );
  NOR2XLM U414 ( .A(n560), .B(n327), .Y(n557) );
  NAND2XLM U415 ( .A(n415), .B(\u_async_fifo/u_fifo_mem/mem[7][0] ), .Y(n390)
         );
  NAND2XLM U416 ( .A(n415), .B(\u_async_fifo/u_fifo_mem/mem[7][3] ), .Y(n356)
         );
  NAND2XLM U417 ( .A(n415), .B(\u_async_fifo/u_fifo_mem/mem[7][7] ), .Y(n384)
         );
  AOI211XLM U418 ( .A0(n499), .A1(n498), .B0(n549), .C0(n546), .Y(
        \u_uart_rx/u_edge_bit_counter/N35 ) );
  AOI21XLM U419 ( .A0(n425), .A1(n424), .B0(n423), .Y(
        \u_async_fifo/u_fifo_rd/r_bin_next [0]) );
  AOI22XLM U420 ( .A0(n441), .A1(n571), .B0(n572), .B1(n496), .Y(n226) );
  OAI21XLM U421 ( .A0(n501), .A1(n530), .B0(n430), .Y(n234) );
  OAI21XLM U422 ( .A0(n504), .A1(n530), .B0(n426), .Y(n239) );
  AOI31XLM U423 ( .A0(n392), .A1(n391), .A2(n390), .B0(n389), .Y(
        fifo_rd_data[0]) );
  CLKINVX1M U424 ( .A(\u_async_fifo/r_addr [0]), .Y(n425) );
  NOR3BXLM U425 ( .AN(fifo_rd_inc), .B(fifo_empty), .C(n425), .Y(n423) );
  NAND2XLM U426 ( .A(\u_async_fifo/r_addr [1]), .B(n423), .Y(n317) );
  CLKINVX1M U427 ( .A(n317), .Y(n319) );
  CLKINVX1M U428 ( .A(\u_async_fifo/r_addr [2]), .Y(n411) );
  AOI22XLM U429 ( .A0(\u_async_fifo/r_addr [2]), .A1(n319), .B0(n317), .B1(
        n411), .Y(\u_async_fifo/u_fifo_rd/r_bin_next [2]) );
  OAI21XLM U430 ( .A0(\u_async_fifo/r_addr [1]), .A1(n423), .B0(n317), .Y(n318) );
  CLKINVX1M U431 ( .A(n318), .Y(\u_async_fifo/u_fifo_rd/r_bin_next [1]) );
  OAI22XLM U432 ( .A0(n318), .A1(n411), .B0(
        \u_async_fifo/u_fifo_rd/r_bin_next [2]), .B1(
        \u_async_fifo/u_fifo_rd/r_bin_next [1]), .Y(n519) );
  CLKINVX1M U433 ( .A(n519), .Y(\u_async_fifo/u_fifo_rd/r_gray_next [1]) );
  AOI21XLM U434 ( .A0(n319), .A1(\u_async_fifo/r_addr [2]), .B0(
        \u_async_fifo/gray_rd_ptr [3]), .Y(n320) );
  AOI31XLM U435 ( .A0(n319), .A1(\u_async_fifo/r_addr [2]), .A2(
        \u_async_fifo/gray_rd_ptr [3]), .B0(n320), .Y(
        \u_async_fifo/u_fifo_rd/r_bin_next [3]) );
  CLKINVX1M U436 ( .A(\u_async_fifo/u_fifo_rd/r_bin_next [3]), .Y(n517) );
  AOI2BB2XLM U437 ( .B0(\u_async_fifo/u_fifo_rd/r_bin_next [2]), .B1(n320), 
        .A0N(\u_async_fifo/u_fifo_rd/r_bin_next [2]), .A1N(n517), .Y(n516) );
  CLKINVX1M U438 ( .A(n516), .Y(\u_async_fifo/u_fifo_rd/r_gray_next [2]) );
  CLKINVX1M U439 ( .A(\u_async_fifo/w_addr [1]), .Y(n563) );
  CLKINVX1M U440 ( .A(\u_uart_rx/u_RX_FSM/current_state [2]), .Y(n435) );
  CLKINVX1M U441 ( .A(\u_uart_rx/u_RX_FSM/current_state [0]), .Y(n434) );
  CLKINVX1M U442 ( .A(\u_uart_rx/u_RX_FSM/current_state [1]), .Y(n538) );
  NOR3XLM U443 ( .A(n435), .B(n434), .C(n538), .Y(n433) );
  NOR2BXLM U444 ( .AN(n433), .B(fifo_full), .Y(n325) );
  NAND2XLM U445 ( .A(\u_async_fifo/w_addr [0]), .B(n325), .Y(n565) );
  NOR2XLM U446 ( .A(n563), .B(n565), .Y(n322) );
  CLKINVX1M U447 ( .A(n322), .Y(n327) );
  NOR2XLM U448 ( .A(n327), .B(\u_async_fifo/w_addr [2]), .Y(n562) );
  NAND2XLM U449 ( .A(\u_async_fifo/w_addr [2]), .B(n327), .Y(n321) );
  NAND2BXLM U450 ( .AN(n562), .B(n321), .Y(
        \u_async_fifo/u_fifo_wr/wbin_next [2]) );
  AOI21XLM U451 ( .A0(n563), .A1(n565), .B0(n322), .Y(
        \u_async_fifo/u_fifo_wr/wbin_next [1]) );
  CLKINVX1M U452 ( .A(\u_async_fifo/w_addr [2]), .Y(n560) );
  CLKINVX1M U453 ( .A(\u_async_fifo/u_fifo_wr/wbin_next [1]), .Y(n323) );
  OAI22XLM U454 ( .A0(\u_async_fifo/u_fifo_wr/wbin_next [2]), .A1(
        \u_async_fifo/u_fifo_wr/wbin_next [1]), .B0(n560), .B1(n323), .Y(n526)
         );
  CLKINVX1M U455 ( .A(n526), .Y(\u_async_fifo/u_fifo_wr/wgray_next [1]) );
  CLKINVX1M U456 ( .A(\u_async_fifo/w_addr [0]), .Y(n324) );
  NAND2XLM U457 ( .A(n324), .B(n325), .Y(n567) );
  OAI21XLM U458 ( .A0(n325), .A1(n324), .B0(n567), .Y(
        \u_async_fifo/u_fifo_wr/wbin_next [0]) );
  CLKINVX1M U459 ( .A(\u_async_fifo/u_fifo_wr/wbin_next [0]), .Y(n326) );
  AOI22XLM U460 ( .A0(n563), .A1(\u_async_fifo/u_fifo_wr/wbin_next [0]), .B0(
        n326), .B1(\u_async_fifo/u_fifo_wr/wbin_next [1]), .Y(n524) );
  CLKINVX1M U461 ( .A(n524), .Y(\u_async_fifo/u_fifo_wr/wgray_next [0]) );
  AOI2BB2XLM U462 ( .B0(\u_async_fifo/gray_w_ptr [3]), .B1(n557), .A0N(n557), 
        .A1N(\u_async_fifo/gray_w_ptr [3]), .Y(
        \u_async_fifo/u_fifo_wr/wbin_next [3]) );
  AOI2BB2XLM U463 ( .B0(\u_async_fifo/gray_w_ptr [3]), .B1(
        \u_async_fifo/u_fifo_wr/wbin_next [2]), .A0N(
        \u_async_fifo/u_fifo_wr/wbin_next [2]), .A1N(
        \u_async_fifo/u_fifo_wr/wbin_next [3]), .Y(
        \u_async_fifo/u_fifo_wr/wgray_next [2]) );
  NOR2XLM U464 ( .A(\u_uart_rx/u_RX_FSM/current_state [0]), .B(n538), .Y(n493)
         );
  CLKINVX1M U465 ( .A(n493), .Y(n540) );
  AOI2BB2XLM U466 ( .B0(rx_prescale[2]), .B1(\u_uart_rx/edge_cnt [1]), .A0N(
        \u_uart_rx/edge_cnt [1]), .A1N(rx_prescale[2]), .Y(n339) );
  CLKINVX1M U467 ( .A(\u_uart_rx/edge_cnt [0]), .Y(n541) );
  NAND3XLM U468 ( .A(rx_prescale[4]), .B(rx_prescale[3]), .C(rx_prescale[2]), 
        .Y(n335) );
  CLKINVX1M U469 ( .A(\u_uart_rx/edge_cnt [4]), .Y(n499) );
  AOI22XLM U470 ( .A0(\u_uart_rx/edge_cnt [4]), .A1(rx_prescale[5]), .B0(n477), 
        .B1(n499), .Y(n329) );
  OAI22XLM U471 ( .A0(rx_prescale[1]), .A1(n541), .B0(n335), .B1(n329), .Y(
        n328) );
  AOI221XLM U472 ( .A0(n541), .A1(rx_prescale[1]), .B0(n335), .B1(n329), .C0(
        n328), .Y(n338) );
  CLKINVX1M U473 ( .A(rx_prescale[4]), .Y(n478) );
  NAND2XLM U474 ( .A(rx_prescale[3]), .B(rx_prescale[2]), .Y(n330) );
  OAI2BB1XLM U475 ( .A0N(n478), .A1N(n330), .B0(n335), .Y(n333) );
  OAI21XLM U476 ( .A0(rx_prescale[3]), .A1(rx_prescale[2]), .B0(n330), .Y(n332) );
  OAI22XLM U477 ( .A0(\u_uart_rx/edge_cnt [2]), .A1(n332), .B0(
        \u_uart_rx/edge_cnt [3]), .B1(n333), .Y(n331) );
  AOI221XLM U478 ( .A0(n333), .A1(\u_uart_rx/edge_cnt [3]), .B0(n332), .B1(
        \u_uart_rx/edge_cnt [2]), .C0(n331), .Y(n337) );
  CLKINVX1M U479 ( .A(\u_uart_rx/edge_cnt [5]), .Y(n548) );
  OAI21XLM U480 ( .A0(n477), .A1(n335), .B0(n548), .Y(n334) );
  OAI31XLM U481 ( .A0(n477), .A1(n548), .A2(n335), .B0(n334), .Y(n336) );
  NAND4XLM U482 ( .A(n339), .B(n338), .C(n337), .D(n336), .Y(n447) );
  NOR2XLM U483 ( .A(n540), .B(n447), .Y(n349) );
  NAND2XLM U484 ( .A(n349), .B(n435), .Y(n348) );
  CLKINVX1M U485 ( .A(rx_pdata[3]), .Y(n573) );
  CLKINVX1M U486 ( .A(rx_pdata[4]), .Y(n572) );
  AOI22XLM U487 ( .A0(rx_pdata[4]), .A1(rx_pdata[3]), .B0(n573), .B1(n572), 
        .Y(n346) );
  CLKINVX1M U488 ( .A(rx_pdata[5]), .Y(n571) );
  CLKINVX1M U489 ( .A(rx_pdata[6]), .Y(n570) );
  AOI22XLM U490 ( .A0(rx_pdata[6]), .A1(rx_pdata[5]), .B0(n571), .B1(n570), 
        .Y(n342) );
  CLKINVX1M U491 ( .A(rx_pdata[0]), .Y(n568) );
  CLKINVX1M U492 ( .A(rx_pdata[1]), .Y(n575) );
  AOI22XLM U493 ( .A0(rx_pdata[1]), .A1(rx_pdata[0]), .B0(n568), .B1(n575), 
        .Y(n341) );
  CLKINVX1M U494 ( .A(rx_pdata[2]), .Y(n574) );
  CLKINVX1M U495 ( .A(\u_uart_rx/sampled_bit ), .Y(n449) );
  AOI22XLM U496 ( .A0(\u_uart_rx/sampled_bit ), .A1(rx_pdata[2]), .B0(n574), 
        .B1(n449), .Y(n340) );
  XOR3XLM U497 ( .A(n342), .B(n341), .C(n340), .Y(n343) );
  XOR3XLM U498 ( .A(rx_pdata[7]), .B(rx_par_typ), .C(n343), .Y(n345) );
  AOI211XLM U499 ( .A0(n346), .A1(n345), .B0(n348), .C0(n344), .Y(n347) );
  AO21XLM U500 ( .A0(n348), .A1(rx_parity_error), .B0(n347), .Y(n230) );
  NAND2XLM U501 ( .A(\u_uart_rx/u_RX_FSM/current_state [2]), .B(n349), .Y(n351) );
  NAND2XLM U502 ( .A(n351), .B(rx_stop_error), .Y(n350) );
  OAI21XLM U503 ( .A0(n351), .A1(\u_uart_rx/sampled_bit ), .B0(n350), .Y(n229)
         );
  NOR2XLM U504 ( .A(\u_async_fifo/r_addr [1]), .B(n425), .Y(n417) );
  NOR2XLM U505 ( .A(\u_async_fifo/r_addr [1]), .B(\u_async_fifo/r_addr [0]), 
        .Y(n413) );
  CLKINVX1M U506 ( .A(\u_async_fifo/r_addr [1]), .Y(n352) );
  NOR2XLM U507 ( .A(\u_async_fifo/r_addr [0]), .B(n352), .Y(n412) );
  AOI211XLM U508 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[1][3] ), .B0(
        \u_async_fifo/r_addr [2]), .C0(n354), .Y(n355) );
  CLKINVX1M U509 ( .A(\u_uart_tx/u_fsm/current_state [0]), .Y(n553) );
  NOR3XLM U510 ( .A(\u_uart_tx/u_fsm/current_state [2]), .B(
        \u_uart_tx/u_fsm/current_state [1]), .C(n553), .Y(n422) );
  CLKINVX1M U511 ( .A(\u_uart_tx/u_fsm/current_state [2]), .Y(n513) );
  NAND2XLM U512 ( .A(\u_uart_tx/u_fsm/current_state [1]), .B(n513), .Y(n551)
         );
  NOR2XLM U513 ( .A(\u_uart_tx/u_fsm/current_state [0]), .B(n551), .Y(n577) );
  NOR2XLM U514 ( .A(n577), .B(n422), .Y(n529) );
  CLKINVX1M U515 ( .A(n359), .Y(n236) );
  AOI211XLM U516 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[1][4] ), .B0(
        \u_async_fifo/r_addr [2]), .C0(n361), .Y(n362) );
  AOI222XLM U517 ( .A0(fifo_rd_data[4]), .A1(n422), .B0(n577), .B1(
        \u_uart_tx/u_serializer/shift_data [5]), .C0(n529), .C1(
        \u_uart_tx/u_serializer/shift_data [4]), .Y(n366) );
  CLKINVX1M U518 ( .A(n366), .Y(n235) );
  CLKINVX1M U519 ( .A(n577), .Y(n446) );
  CLKINVX1M U520 ( .A(n529), .Y(n578) );
  OAI21XLM U521 ( .A0(\u_uart_tx/u_serializer/count [0]), .A1(n446), .B0(n578), 
        .Y(n442) );
  NOR2XLM U522 ( .A(\u_uart_tx/u_serializer/count [1]), .B(n446), .Y(n443) );
  AO22XLM U523 ( .A0(\u_uart_tx/u_serializer/count [1]), .A1(n442), .B0(n443), 
        .B1(\u_uart_tx/u_serializer/count [0]), .Y(n241) );
  NOR2XLM U524 ( .A(\u_uart_rx/u_RX_FSM/current_state [2]), .B(n434), .Y(n536)
         );
  NOR2XLM U525 ( .A(n536), .B(n493), .Y(n469) );
  CLKINVX1M U526 ( .A(n469), .Y(n470) );
  NOR2XLM U527 ( .A(rx_prescale[1]), .B(rx_prescale[0]), .Y(n367) );
  AOI21XLM U528 ( .A0(rx_prescale[0]), .A1(rx_prescale[1]), .B0(n367), .Y(n370) );
  NOR3XLM U529 ( .A(rx_prescale[2]), .B(rx_prescale[1]), .C(rx_prescale[0]), 
        .Y(n484) );
  AOI2B1XLM U530 ( .A1N(n367), .A0(rx_prescale[2]), .B0(n484), .Y(n369) );
  OAI22XLM U531 ( .A0(\u_uart_rx/edge_cnt [1]), .A1(n370), .B0(
        \u_uart_rx/edge_cnt [2]), .B1(n369), .Y(n368) );
  AOI221XLM U532 ( .A0(\u_uart_rx/edge_cnt [1]), .A1(n370), .B0(n369), .B1(
        \u_uart_rx/edge_cnt [2]), .C0(n368), .Y(n380) );
  CLKINVX1M U533 ( .A(rx_prescale[3]), .Y(n451) );
  OA21XLM U534 ( .A0(n451), .A1(n484), .B0(n373), .Y(n372) );
  OAI22XLM U535 ( .A0(rx_prescale[0]), .A1(\u_uart_rx/edge_cnt [0]), .B0(n372), 
        .B1(\u_uart_rx/edge_cnt [3]), .Y(n371) );
  AOI221XLM U536 ( .A0(rx_prescale[0]), .A1(\u_uart_rx/edge_cnt [0]), .B0(
        \u_uart_rx/edge_cnt [3]), .B1(n372), .C0(n371), .Y(n379) );
  NAND2BXLM U537 ( .AN(n373), .B(n478), .Y(n432) );
  AOI22XLM U538 ( .A0(\u_uart_rx/edge_cnt [5]), .A1(n477), .B0(rx_prescale[5]), 
        .B1(n548), .Y(n377) );
  NAND2XLM U539 ( .A(rx_prescale[4]), .B(n373), .Y(n375) );
  AO21XLM U540 ( .A0(\u_uart_rx/edge_cnt [4]), .A1(n375), .B0(n374), .Y(n376)
         );
  OAI31XLM U541 ( .A0(n432), .A1(n377), .A2(n499), .B0(n376), .Y(n378) );
  NAND2XLM U542 ( .A(n470), .B(n431), .Y(n546) );
  NOR2XLM U543 ( .A(\u_uart_rx/edge_cnt [0]), .B(n546), .Y(
        \u_uart_rx/u_edge_bit_counter/N31 ) );
  CLKINVX1M U544 ( .A(\u_uart_rx/edge_cnt [2]), .Y(n461) );
  NAND2XLM U545 ( .A(\u_uart_rx/edge_cnt [0]), .B(\u_uart_rx/edge_cnt [1]), 
        .Y(n459) );
  CLKINVX1M U546 ( .A(\u_uart_rx/edge_cnt [1]), .Y(n542) );
  NOR3XLM U547 ( .A(n541), .B(n542), .C(n461), .Y(n545) );
  AOI211XLM U548 ( .A0(n461), .A1(n459), .B0(n545), .C0(n546), .Y(
        \u_uart_rx/u_edge_bit_counter/N33 ) );
  AOI211XLM U549 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[1][7] ), .B0(
        \u_async_fifo/r_addr [2]), .C0(n382), .Y(n383) );
  AOI211XLM U550 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[1][0] ), .B0(
        \u_async_fifo/r_addr [2]), .C0(n388), .Y(n389) );
  AOI211XLM U551 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[1][2] ), .B0(
        \u_async_fifo/r_addr [2]), .C0(n394), .Y(n395) );
  AOI211XLM U552 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[1][1] ), .B0(
        \u_async_fifo/r_addr [2]), .C0(n400), .Y(n401) );
  AOI211XLM U553 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[1][6] ), .B0(
        \u_async_fifo/r_addr [2]), .C0(n406), .Y(n407) );
  AOI211XLM U554 ( .A0(n417), .A1(\u_async_fifo/u_fifo_mem/mem[1][5] ), .B0(
        \u_async_fifo/r_addr [2]), .C0(n416), .Y(n418) );
  CLKINVX1M U555 ( .A(\u_uart_tx/u_fsm/current_state [1]), .Y(n550) );
  AOI21XLM U556 ( .A0(\u_uart_tx/u_fsm/current_state [2]), .A1(n553), .B0(n550), .Y(n511) );
  CLKINVX1M U557 ( .A(n422), .Y(n530) );
  NAND2BXLM U558 ( .AN(n511), .B(n530), .Y(tx_busy) );
  OAI2BB2XLM U559 ( .B0(\u_async_fifo/u_fifo_rd/r_bin_next [1]), .B1(
        \u_async_fifo/u_fifo_rd/r_bin_next [0]), .A0N(
        \u_async_fifo/u_fifo_rd/r_bin_next [0]), .A1N(\u_async_fifo/r_addr [1]), .Y(n520) );
  CLKINVX1M U560 ( .A(n520), .Y(\u_async_fifo/u_fifo_rd/r_gray_next [0]) );
  CLKINVX1M U561 ( .A(fifo_rd_data[0]), .Y(n504) );
  AOI22XLM U562 ( .A0(n577), .A1(\u_uart_tx/u_serializer/shift_data [1]), .B0(
        n529), .B1(\u_uart_tx/ser_data ), .Y(n426) );
  CLKINVX1M U563 ( .A(fifo_rd_data[6]), .Y(n500) );
  AOI22XLM U564 ( .A0(n577), .A1(\u_uart_tx/u_serializer/shift_data [7]), .B0(
        n529), .B1(\u_uart_tx/u_serializer/shift_data [6]), .Y(n427) );
  OAI21XLM U565 ( .A0(n500), .A1(n530), .B0(n427), .Y(n233) );
  CLKINVX1M U566 ( .A(fifo_rd_data[2]), .Y(n502) );
  AOI22XLM U567 ( .A0(n577), .A1(\u_uart_tx/u_serializer/shift_data [3]), .B0(
        n529), .B1(\u_uart_tx/u_serializer/shift_data [2]), .Y(n428) );
  OAI21XLM U568 ( .A0(n502), .A1(n530), .B0(n428), .Y(n237) );
  CLKINVX1M U569 ( .A(fifo_rd_data[1]), .Y(n503) );
  AOI22XLM U570 ( .A0(n577), .A1(\u_uart_tx/u_serializer/shift_data [2]), .B0(
        n529), .B1(\u_uart_tx/u_serializer/shift_data [1]), .Y(n429) );
  OAI21XLM U571 ( .A0(n503), .A1(n530), .B0(n429), .Y(n238) );
  CLKINVX1M U572 ( .A(fifo_rd_data[5]), .Y(n501) );
  AOI22XLM U573 ( .A0(n577), .A1(\u_uart_tx/u_serializer/shift_data [6]), .B0(
        n529), .B1(\u_uart_tx/u_serializer/shift_data [5]), .Y(n430) );
  CLKINVX1M U574 ( .A(n431), .Y(n532) );
  OAI21XLM U575 ( .A0(n432), .A1(rx_prescale[5]), .B0(n532), .Y(n491) );
  CLKINVX1M U576 ( .A(n491), .Y(n535) );
  NAND3XLM U577 ( .A(n536), .B(\u_uart_rx/u_RX_FSM/current_state [1]), .C(n535), .Y(n496) );
  CLKINVX1M U578 ( .A(n496), .Y(n441) );
  CLKINVX1M U579 ( .A(rx_pdata[7]), .Y(n569) );
  AOI22XLM U580 ( .A0(n441), .A1(n569), .B0(n570), .B1(n496), .Y(n228) );
  AOI22XLM U581 ( .A0(n441), .A1(n574), .B0(n575), .B1(n496), .Y(n223) );
  AOI31XLM U582 ( .A0(n435), .A1(n434), .A2(n538), .B0(n433), .Y(n439) );
  CLKINVX1M U583 ( .A(\u_uart_rx/bit_cnt [2]), .Y(n555) );
  CLKINVX1M U584 ( .A(\u_uart_rx/bit_cnt [1]), .Y(n466) );
  CLKINVX1M U585 ( .A(\u_uart_rx/bit_cnt [0]), .Y(n534) );
  NAND4XLM U586 ( .A(\u_uart_rx/bit_cnt [3]), .B(n555), .C(n466), .D(n534), 
        .Y(n497) );
  OAI21XLM U587 ( .A0(\u_uart_rx/u_RX_FSM/current_state [1]), .A1(
        \u_uart_rx/strt_glitch ), .B0(n535), .Y(n436) );
  AOI32XLM U588 ( .A0(\u_uart_rx/u_RX_FSM/current_state [1]), .A1(n536), .A2(
        n497), .B0(n436), .B1(n536), .Y(n438) );
  AOI21XLM U589 ( .A0(rx_par_en), .A1(rx_parity_error), .B0(rx_stop_error), 
        .Y(n492) );
  NAND4XLM U590 ( .A(\u_uart_rx/u_RX_FSM/current_state [2]), .B(n493), .C(n535), .D(n492), .Y(n437) );
  OAI211XLM U591 ( .A0(rx_in), .A1(n439), .B0(n438), .C0(n437), .Y(n314) );
  NAND4XLM U592 ( .A(tx_data_valid), .B(n513), .C(n553), .D(n550), .Y(n440) );
  NAND2XLM U593 ( .A(\u_uart_tx/u_serializer/count [1]), .B(
        \u_uart_tx/u_serializer/count [0]), .Y(n445) );
  AOI32XLM U594 ( .A0(n553), .A1(n440), .A2(n552), .B0(n551), .B1(n440), .Y(
        \u_uart_tx/u_fsm/next_state [0]) );
  AOI22XLM U595 ( .A0(n441), .A1(n570), .B0(n571), .B1(n496), .Y(n227) );
  AOI22XLM U596 ( .A0(n441), .A1(n572), .B0(n573), .B1(n496), .Y(n225) );
  AOI22XLM U597 ( .A0(n441), .A1(n573), .B0(n574), .B1(n496), .Y(n224) );
  AOI22XLM U598 ( .A0(n441), .A1(n575), .B0(n568), .B1(n496), .Y(n222) );
  AOI22XLM U599 ( .A0(n441), .A1(n449), .B0(n569), .B1(n496), .Y(n231) );
  OAI21XLM U600 ( .A0(n443), .A1(n442), .B0(\u_uart_tx/u_serializer/count [2]), 
        .Y(n444) );
  OAI31XLM U601 ( .A0(\u_uart_tx/u_serializer/count [2]), .A1(n446), .A2(n445), 
        .B0(n444), .Y(n242) );
  NAND3BXLM U602 ( .AN(n447), .B(n536), .C(n538), .Y(n450) );
  NAND2XLM U603 ( .A(n450), .B(\u_uart_rx/strt_glitch ), .Y(n448) );
  OAI21XLM U604 ( .A0(n450), .A1(n449), .B0(n448), .Y(n221) );
  NOR2XLM U605 ( .A(n469), .B(\u_uart_rx/bit_cnt [0]), .Y(n533) );
  NOR2BXLM U606 ( .AN(n546), .B(n533), .Y(n468) );
  NAND3XLM U607 ( .A(n470), .B(\u_uart_rx/bit_cnt [0]), .C(n532), .Y(n467) );
  AOI22XLM U608 ( .A0(\u_uart_rx/bit_cnt [1]), .A1(n468), .B0(n467), .B1(n466), 
        .Y(n312) );
  NOR3XLM U609 ( .A(n461), .B(\u_uart_rx/edge_cnt [4]), .C(
        \u_uart_rx/edge_cnt [3]), .Y(n476) );
  NOR3XLM U610 ( .A(rx_prescale[4]), .B(rx_prescale[5]), .C(n451), .Y(n486) );
  NAND3XLM U611 ( .A(\u_uart_rx/edge_cnt [3]), .B(n499), .C(n477), .Y(n473) );
  CLKINVX1M U612 ( .A(\u_uart_rx/edge_cnt [3]), .Y(n544) );
  NAND3XLM U613 ( .A(rx_prescale[5]), .B(\u_uart_rx/edge_cnt [4]), .C(n544), 
        .Y(n474) );
  AOI221XLM U614 ( .A0(rx_prescale[4]), .A1(n473), .B0(n478), .B1(n474), .C0(
        \u_uart_rx/edge_cnt [2]), .Y(n452) );
  AOI22XLM U615 ( .A0(n476), .A1(n486), .B0(n452), .B1(n451), .Y(n453) );
  NOR4XLM U616 ( .A(\u_uart_rx/edge_cnt [5]), .B(\u_uart_rx/edge_cnt [0]), .C(
        \u_uart_rx/edge_cnt [1]), .D(n453), .Y(n454) );
  NAND2XLM U617 ( .A(n484), .B(n454), .Y(n456) );
  NAND2XLM U618 ( .A(rx_in), .B(n470), .Y(n464) );
  OAI21XLM U619 ( .A0(rx_in), .A1(n538), .B0(n469), .Y(n483) );
  NAND3XLM U620 ( .A(n456), .B(\u_uart_rx/u_data_sampling/samples [1]), .C(
        n483), .Y(n455) );
  OAI21XLM U621 ( .A0(n456), .A1(n464), .B0(n455), .Y(n307) );
  AOI221XLM U622 ( .A0(rx_prescale[5]), .A1(n544), .B0(n477), .B1(n478), .C0(
        rx_prescale[3]), .Y(n462) );
  OAI21XLM U623 ( .A0(rx_prescale[4]), .A1(n461), .B0(\u_uart_rx/edge_cnt [3]), 
        .Y(n457) );
  OAI211XLM U624 ( .A0(\u_uart_rx/edge_cnt [2]), .A1(n486), .B0(n484), .C0(
        n457), .Y(n458) );
  NOR4XLM U625 ( .A(\u_uart_rx/edge_cnt [4]), .B(\u_uart_rx/edge_cnt [5]), .C(
        n459), .D(n458), .Y(n460) );
  OAI21XLM U626 ( .A0(n462), .A1(n461), .B0(n460), .Y(n465) );
  NAND3XLM U627 ( .A(n465), .B(\u_uart_rx/u_data_sampling/samples [0]), .C(
        n483), .Y(n463) );
  OAI21XLM U628 ( .A0(n465), .A1(n464), .B0(n463), .Y(n308) );
  OR2X1M U629 ( .A(n467), .B(n466), .Y(n556) );
  OAI21XLM U630 ( .A0(n469), .A1(\u_uart_rx/bit_cnt [1]), .B0(n468), .Y(n554)
         );
  AOI21XLM U631 ( .A0(n470), .A1(n555), .B0(n554), .Y(n472) );
  CLKINVX1M U632 ( .A(\u_uart_rx/bit_cnt [3]), .Y(n471) );
  OAI32XLM U633 ( .A0(\u_uart_rx/bit_cnt [3]), .A1(n555), .A2(n556), .B0(n472), 
        .B1(n471), .Y(n310) );
  NAND3XLM U634 ( .A(\u_uart_rx/edge_cnt [0]), .B(n548), .C(n542), .Y(n475) );
  AOI211XLM U635 ( .A0(n474), .A1(n473), .B0(\u_uart_rx/edge_cnt [2]), .C0(
        n475), .Y(n482) );
  OAI2B1XLM U636 ( .A1N(n476), .A0(n475), .B0(n486), .Y(n481) );
  AOI221XLM U637 ( .A0(rx_prescale[4]), .A1(rx_prescale[5]), .B0(n478), .B1(
        n477), .C0(rx_prescale[3]), .Y(n485) );
  CLKINVX1M U638 ( .A(n485), .Y(n480) );
  NAND2XLM U639 ( .A(n484), .B(n483), .Y(n479) );
  AOI221XLM U640 ( .A0(n482), .A1(n481), .B0(n480), .B1(n481), .C0(n479), .Y(
        n490) );
  AOI222XLM U641 ( .A0(rx_in), .A1(\u_uart_rx/u_data_sampling/samples [0]), 
        .B0(rx_in), .B1(\u_uart_rx/u_data_sampling/samples [1]), .C0(
        \u_uart_rx/u_data_sampling/samples [0]), .C1(
        \u_uart_rx/u_data_sampling/samples [1]), .Y(n489) );
  NAND2XLM U642 ( .A(\u_uart_rx/sampled_bit ), .B(n490), .Y(n487) );
  OAI31XLM U643 ( .A0(n490), .A1(n489), .A2(n488), .B0(n487), .Y(n309) );
  NOR2XLM U644 ( .A(n492), .B(n491), .Y(n539) );
  NAND2XLM U645 ( .A(\u_uart_rx/u_RX_FSM/current_state [2]), .B(n539), .Y(n494) );
  OAI211XLM U646 ( .A0(\u_uart_rx/u_RX_FSM/current_state [2]), .A1(n535), .B0(
        n494), .C0(n493), .Y(n495) );
  OAI31XLM U647 ( .A0(rx_par_en), .A1(n497), .A2(n496), .B0(n495), .Y(n316) );
  NAND2XLM U648 ( .A(\u_uart_rx/edge_cnt [3]), .B(n545), .Y(n498) );
  NOR3XLM U649 ( .A(n499), .B(n544), .C(n543), .Y(n549) );
  AOI22XLM U650 ( .A0(fifo_rd_data[6]), .A1(fifo_rd_data[5]), .B0(n501), .B1(
        n500), .Y(n510) );
  AOI22XLM U651 ( .A0(fifo_rd_data[2]), .A1(fifo_rd_data[1]), .B0(n503), .B1(
        n502), .Y(n506) );
  CLKINVX1M U652 ( .A(fifo_rd_data[7]), .Y(n531) );
  XOR3XLM U653 ( .A(n506), .B(tx_par_typ), .C(n505), .Y(n507) );
  XOR3XLM U654 ( .A(fifo_rd_data[4]), .B(fifo_rd_data[3]), .C(n507), .Y(n509)
         );
  AOI21BXLM U655 ( .A0(n510), .A1(n509), .B0N(tx_rstn), .Y(n508) );
  OAI211XLM U656 ( .A0(n510), .A1(n509), .B0(tx_data_valid), .C0(n508), .Y(
        n514) );
  AOI21XLM U657 ( .A0(\u_uart_tx/ser_data ), .A1(n511), .B0(n529), .Y(n512) );
  AOI31XLM U658 ( .A0(\u_uart_tx/u_fsm/current_state [0]), .A1(n514), .A2(n513), .B0(n512), .Y(tx_out) );
  OAI22XLM U659 ( .A0(n517), .A1(\u_async_fifo/rq2_wptr [3]), .B0(n516), .B1(
        \u_async_fifo/rq2_wptr [2]), .Y(n515) );
  AOI221XLM U660 ( .A0(n517), .A1(\u_async_fifo/rq2_wptr [3]), .B0(
        \u_async_fifo/rq2_wptr [2]), .B1(n516), .C0(n515), .Y(n522) );
  OAI22XLM U661 ( .A0(n520), .A1(\u_async_fifo/rq2_wptr [0]), .B0(n519), .B1(
        \u_async_fifo/rq2_wptr [1]), .Y(n518) );
  AOI221XLM U662 ( .A0(n520), .A1(\u_async_fifo/rq2_wptr [0]), .B0(
        \u_async_fifo/rq2_wptr [1]), .B1(n519), .C0(n518), .Y(n521) );
  AND2X1M U663 ( .A(n522), .B(n521), .Y(\eq_x_39/n25 ) );
  OAI22XLM U664 ( .A0(\u_async_fifo/u_fifo_wr/wbin_next [3]), .A1(
        \u_async_fifo/wq2_rptr [3]), .B0(\u_async_fifo/wq2_rptr [0]), .B1(n524), .Y(n523) );
  AOI221XLM U665 ( .A0(\u_async_fifo/u_fifo_wr/wbin_next [3]), .A1(
        \u_async_fifo/wq2_rptr [3]), .B0(n524), .B1(\u_async_fifo/wq2_rptr [0]), .C0(n523), .Y(n528) );
  OAI22XLM U666 ( .A0(n526), .A1(\u_async_fifo/wq2_rptr [1]), .B0(
        \u_async_fifo/u_fifo_wr/wgray_next [2]), .B1(
        \u_async_fifo/wq2_rptr [2]), .Y(n525) );
  AOI221XLM U667 ( .A0(n526), .A1(\u_async_fifo/wq2_rptr [1]), .B0(
        \u_async_fifo/wq2_rptr [2]), .B1(
        \u_async_fifo/u_fifo_wr/wgray_next [2]), .C0(n525), .Y(n527) );
  AND2X1M U668 ( .A(n528), .B(n527), .Y(\eq_x_37/n25 ) );
  OAI2BB2XLM U669 ( .B0(n531), .B1(n530), .A0N(n529), .A1N(
        \u_uart_tx/u_serializer/shift_data [7]), .Y(n232) );
  OAI2BB2XLM U670 ( .B0(n534), .B1(n546), .A0N(n533), .A1N(n532), .Y(n313) );
  NAND2XLM U671 ( .A(n536), .B(n535), .Y(n537) );
  OAI222XLM U672 ( .A0(n540), .A1(n539), .B0(n538), .B1(
        \u_uart_rx/u_RX_FSM/current_state [2]), .C0(n537), .C1(
        \u_uart_rx/strt_glitch ), .Y(n315) );
  AOI221XLM U673 ( .A0(\u_uart_rx/edge_cnt [1]), .A1(\u_uart_rx/edge_cnt [0]), 
        .B0(n542), .B1(n541), .C0(n546), .Y(\u_uart_rx/u_edge_bit_counter/N32 ) );
  AOI221XLM U674 ( .A0(\u_uart_rx/edge_cnt [3]), .A1(n545), .B0(n544), .B1(
        n543), .C0(n546), .Y(\u_uart_rx/u_edge_bit_counter/N34 ) );
  AOI221XLM U675 ( .A0(\u_uart_rx/edge_cnt [5]), .A1(n549), .B0(n548), .B1(
        n547), .C0(n546), .Y(\u_uart_rx/u_edge_bit_counter/N36 ) );
  AOI21XLM U676 ( .A0(n553), .A1(n550), .B0(\u_uart_tx/u_fsm/current_state [2]), .Y(\u_uart_tx/u_fsm/next_state [1]) );
  AOI221XLM U677 ( .A0(tx_par_en), .A1(n553), .B0(n552), .B1(n553), .C0(n551), 
        .Y(\u_uart_tx/u_fsm/next_state [2]) );
  AOI2BB2XLM U678 ( .B0(n556), .B1(n555), .A0N(n555), .A1N(n554), .Y(n311) );
  AOI2BB2XLM U679 ( .B0(n557), .B1(n568), .A0N(
        \u_async_fifo/u_fifo_mem/mem[7][0] ), .A1N(n557), .Y(n306) );
  AOI2BB2XLM U680 ( .B0(n557), .B1(n569), .A0N(
        \u_async_fifo/u_fifo_mem/mem[7][7] ), .A1N(n557), .Y(n305) );
  AOI2BB2XLM U681 ( .B0(n557), .B1(n570), .A0N(
        \u_async_fifo/u_fifo_mem/mem[7][6] ), .A1N(n557), .Y(n304) );
  AOI2BB2XLM U682 ( .B0(n557), .B1(n571), .A0N(
        \u_async_fifo/u_fifo_mem/mem[7][5] ), .A1N(n557), .Y(n303) );
  AOI2BB2XLM U683 ( .B0(n557), .B1(n572), .A0N(
        \u_async_fifo/u_fifo_mem/mem[7][4] ), .A1N(n557), .Y(n302) );
  AOI2BB2XLM U684 ( .B0(n557), .B1(n573), .A0N(
        \u_async_fifo/u_fifo_mem/mem[7][3] ), .A1N(n557), .Y(n301) );
  AOI2BB2XLM U685 ( .B0(n557), .B1(n574), .A0N(
        \u_async_fifo/u_fifo_mem/mem[7][2] ), .A1N(n557), .Y(n300) );
  AOI2BB2XLM U686 ( .B0(n557), .B1(n575), .A0N(
        \u_async_fifo/u_fifo_mem/mem[7][1] ), .A1N(n557), .Y(n299) );
  NOR3X1M U687 ( .A(n560), .B(n563), .C(n567), .Y(n558) );
  AOI2BB2XLM U688 ( .B0(n558), .B1(n568), .A0N(
        \u_async_fifo/u_fifo_mem/mem[6][0] ), .A1N(n558), .Y(n298) );
  AOI2BB2XLM U689 ( .B0(n558), .B1(n569), .A0N(
        \u_async_fifo/u_fifo_mem/mem[6][7] ), .A1N(n558), .Y(n297) );
  AOI2BB2XLM U690 ( .B0(n558), .B1(n570), .A0N(
        \u_async_fifo/u_fifo_mem/mem[6][6] ), .A1N(n558), .Y(n296) );
  AOI2BB2XLM U691 ( .B0(n558), .B1(n571), .A0N(
        \u_async_fifo/u_fifo_mem/mem[6][5] ), .A1N(n558), .Y(n295) );
  AOI2BB2XLM U692 ( .B0(n558), .B1(n572), .A0N(
        \u_async_fifo/u_fifo_mem/mem[6][4] ), .A1N(n558), .Y(n294) );
  AOI2BB2XLM U693 ( .B0(n558), .B1(n573), .A0N(
        \u_async_fifo/u_fifo_mem/mem[6][3] ), .A1N(n558), .Y(n293) );
  AOI2BB2XLM U694 ( .B0(n558), .B1(n574), .A0N(
        \u_async_fifo/u_fifo_mem/mem[6][2] ), .A1N(n558), .Y(n292) );
  AOI2BB2XLM U695 ( .B0(n558), .B1(n575), .A0N(
        \u_async_fifo/u_fifo_mem/mem[6][1] ), .A1N(n558), .Y(n291) );
  AOI2BB2XLM U696 ( .B0(n559), .B1(n568), .A0N(
        \u_async_fifo/u_fifo_mem/mem[5][0] ), .A1N(n559), .Y(n290) );
  AOI2BB2XLM U697 ( .B0(n559), .B1(n569), .A0N(
        \u_async_fifo/u_fifo_mem/mem[5][7] ), .A1N(n559), .Y(n289) );
  AOI2BB2XLM U698 ( .B0(n559), .B1(n570), .A0N(
        \u_async_fifo/u_fifo_mem/mem[5][6] ), .A1N(n559), .Y(n288) );
  AOI2BB2XLM U699 ( .B0(n559), .B1(n571), .A0N(
        \u_async_fifo/u_fifo_mem/mem[5][5] ), .A1N(n559), .Y(n287) );
  AOI2BB2XLM U700 ( .B0(n559), .B1(n572), .A0N(
        \u_async_fifo/u_fifo_mem/mem[5][4] ), .A1N(n559), .Y(n286) );
  AOI2BB2XLM U701 ( .B0(n559), .B1(n573), .A0N(
        \u_async_fifo/u_fifo_mem/mem[5][3] ), .A1N(n559), .Y(n285) );
  AOI2BB2XLM U702 ( .B0(n559), .B1(n574), .A0N(
        \u_async_fifo/u_fifo_mem/mem[5][2] ), .A1N(n559), .Y(n284) );
  AOI2BB2XLM U703 ( .B0(n559), .B1(n575), .A0N(
        \u_async_fifo/u_fifo_mem/mem[5][1] ), .A1N(n559), .Y(n283) );
  AOI2BB2XLM U704 ( .B0(n561), .B1(n568), .A0N(
        \u_async_fifo/u_fifo_mem/mem[4][0] ), .A1N(n561), .Y(n282) );
  AOI2BB2XLM U705 ( .B0(n561), .B1(n569), .A0N(
        \u_async_fifo/u_fifo_mem/mem[4][7] ), .A1N(n561), .Y(n281) );
  AOI2BB2XLM U706 ( .B0(n561), .B1(n570), .A0N(
        \u_async_fifo/u_fifo_mem/mem[4][6] ), .A1N(n561), .Y(n280) );
  AOI2BB2XLM U707 ( .B0(n561), .B1(n571), .A0N(
        \u_async_fifo/u_fifo_mem/mem[4][5] ), .A1N(n561), .Y(n279) );
  AOI2BB2XLM U708 ( .B0(n561), .B1(n572), .A0N(
        \u_async_fifo/u_fifo_mem/mem[4][4] ), .A1N(n561), .Y(n278) );
  AOI2BB2XLM U709 ( .B0(n561), .B1(n573), .A0N(
        \u_async_fifo/u_fifo_mem/mem[4][3] ), .A1N(n561), .Y(n277) );
  AOI2BB2XLM U710 ( .B0(n561), .B1(n574), .A0N(
        \u_async_fifo/u_fifo_mem/mem[4][2] ), .A1N(n561), .Y(n276) );
  AOI2BB2XLM U711 ( .B0(n561), .B1(n575), .A0N(
        \u_async_fifo/u_fifo_mem/mem[4][1] ), .A1N(n561), .Y(n275) );
  AOI2BB2XLM U712 ( .B0(n562), .B1(n568), .A0N(
        \u_async_fifo/u_fifo_mem/mem[3][0] ), .A1N(n562), .Y(n274) );
  AOI2BB2XLM U713 ( .B0(n562), .B1(n569), .A0N(
        \u_async_fifo/u_fifo_mem/mem[3][7] ), .A1N(n562), .Y(n273) );
  AOI2BB2XLM U714 ( .B0(n562), .B1(n570), .A0N(
        \u_async_fifo/u_fifo_mem/mem[3][6] ), .A1N(n562), .Y(n272) );
  AOI2BB2XLM U715 ( .B0(n562), .B1(n571), .A0N(
        \u_async_fifo/u_fifo_mem/mem[3][5] ), .A1N(n562), .Y(n271) );
  AOI2BB2XLM U716 ( .B0(n562), .B1(n572), .A0N(
        \u_async_fifo/u_fifo_mem/mem[3][4] ), .A1N(n562), .Y(n270) );
  AOI2BB2XLM U717 ( .B0(n562), .B1(n573), .A0N(
        \u_async_fifo/u_fifo_mem/mem[3][3] ), .A1N(n562), .Y(n269) );
  AOI2BB2XLM U718 ( .B0(n562), .B1(n574), .A0N(
        \u_async_fifo/u_fifo_mem/mem[3][2] ), .A1N(n562), .Y(n268) );
  AOI2BB2XLM U719 ( .B0(n562), .B1(n575), .A0N(
        \u_async_fifo/u_fifo_mem/mem[3][1] ), .A1N(n562), .Y(n267) );
  AOI2BB2XLM U720 ( .B0(n564), .B1(n568), .A0N(
        \u_async_fifo/u_fifo_mem/mem[2][0] ), .A1N(n564), .Y(n266) );
  AOI2BB2XLM U721 ( .B0(n564), .B1(n569), .A0N(
        \u_async_fifo/u_fifo_mem/mem[2][7] ), .A1N(n564), .Y(n265) );
  AOI2BB2XLM U722 ( .B0(n564), .B1(n570), .A0N(
        \u_async_fifo/u_fifo_mem/mem[2][6] ), .A1N(n564), .Y(n264) );
  AOI2BB2XLM U723 ( .B0(n564), .B1(n571), .A0N(
        \u_async_fifo/u_fifo_mem/mem[2][5] ), .A1N(n564), .Y(n263) );
  AOI2BB2XLM U724 ( .B0(n564), .B1(n572), .A0N(
        \u_async_fifo/u_fifo_mem/mem[2][4] ), .A1N(n564), .Y(n262) );
  AOI2BB2XLM U725 ( .B0(n564), .B1(n573), .A0N(
        \u_async_fifo/u_fifo_mem/mem[2][3] ), .A1N(n564), .Y(n261) );
  AOI2BB2XLM U726 ( .B0(n564), .B1(n574), .A0N(
        \u_async_fifo/u_fifo_mem/mem[2][2] ), .A1N(n564), .Y(n260) );
  AOI2BB2XLM U727 ( .B0(n564), .B1(n575), .A0N(
        \u_async_fifo/u_fifo_mem/mem[2][1] ), .A1N(n564), .Y(n259) );
  AOI2BB2XLM U728 ( .B0(n566), .B1(n568), .A0N(
        \u_async_fifo/u_fifo_mem/mem[1][0] ), .A1N(n566), .Y(n258) );
  AOI2BB2XLM U729 ( .B0(n566), .B1(n569), .A0N(
        \u_async_fifo/u_fifo_mem/mem[1][7] ), .A1N(n566), .Y(n257) );
  AOI2BB2XLM U730 ( .B0(n566), .B1(n570), .A0N(
        \u_async_fifo/u_fifo_mem/mem[1][6] ), .A1N(n566), .Y(n256) );
  AOI2BB2XLM U731 ( .B0(n566), .B1(n571), .A0N(
        \u_async_fifo/u_fifo_mem/mem[1][5] ), .A1N(n566), .Y(n255) );
  AOI2BB2XLM U732 ( .B0(n566), .B1(n572), .A0N(
        \u_async_fifo/u_fifo_mem/mem[1][4] ), .A1N(n566), .Y(n254) );
  AOI2BB2XLM U733 ( .B0(n566), .B1(n573), .A0N(
        \u_async_fifo/u_fifo_mem/mem[1][3] ), .A1N(n566), .Y(n253) );
  AOI2BB2XLM U734 ( .B0(n566), .B1(n574), .A0N(
        \u_async_fifo/u_fifo_mem/mem[1][2] ), .A1N(n566), .Y(n252) );
  AOI2BB2XLM U735 ( .B0(n566), .B1(n575), .A0N(
        \u_async_fifo/u_fifo_mem/mem[1][1] ), .A1N(n566), .Y(n251) );
  AOI2BB2XLM U736 ( .B0(n576), .B1(n568), .A0N(
        \u_async_fifo/u_fifo_mem/mem[0][0] ), .A1N(n576), .Y(n250) );
  AOI2BB2XLM U737 ( .B0(n576), .B1(n569), .A0N(
        \u_async_fifo/u_fifo_mem/mem[0][7] ), .A1N(n576), .Y(n249) );
  AOI2BB2XLM U738 ( .B0(n576), .B1(n570), .A0N(
        \u_async_fifo/u_fifo_mem/mem[0][6] ), .A1N(n576), .Y(n248) );
  AOI2BB2XLM U739 ( .B0(n576), .B1(n571), .A0N(
        \u_async_fifo/u_fifo_mem/mem[0][5] ), .A1N(n576), .Y(n247) );
  AOI2BB2XLM U740 ( .B0(n576), .B1(n572), .A0N(
        \u_async_fifo/u_fifo_mem/mem[0][4] ), .A1N(n576), .Y(n246) );
  AOI2BB2XLM U741 ( .B0(n576), .B1(n573), .A0N(
        \u_async_fifo/u_fifo_mem/mem[0][3] ), .A1N(n576), .Y(n245) );
  AOI2BB2XLM U742 ( .B0(n576), .B1(n574), .A0N(
        \u_async_fifo/u_fifo_mem/mem[0][2] ), .A1N(n576), .Y(n244) );
  AOI2BB2XLM U743 ( .B0(n576), .B1(n575), .A0N(
        \u_async_fifo/u_fifo_mem/mem[0][1] ), .A1N(n576), .Y(n243) );
  AOI2BB2XLM U744 ( .B0(\u_uart_tx/u_serializer/count [0]), .B1(n578), .A0N(
        n577), .A1N(\u_uart_tx/u_serializer/count [0]), .Y(n240) );
endmodule

