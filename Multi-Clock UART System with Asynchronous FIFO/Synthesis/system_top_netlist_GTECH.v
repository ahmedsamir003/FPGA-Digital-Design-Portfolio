/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : O-2018.06-SP1
// Date      : Thu Sep 17 13:17:04 2026
/////////////////////////////////////////////////////////////


module RX_FSM ( clk, rst_n, RX_IN, PAR_EN, bit_cnt, edge_cnt, Prescale, 
        strt_glitch, par_err, stp_err, Clear, dat_samp_en, enable, strt_chk_en, 
        par_chk_en, stp_chk_en, deser_en, data_valid );
  input [3:0] bit_cnt;
  input [5:0] edge_cnt;
  input [5:0] Prescale;
  input clk, rst_n, RX_IN, PAR_EN, strt_glitch, par_err, stp_err;
  output Clear, dat_samp_en, enable, strt_chk_en, par_chk_en, stp_chk_en,
         deser_en, data_valid;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, dat_samp_en, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26,
         N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40,
         N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54,
         N55, N56, N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68,
         N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82,
         N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96,
         N97, N98, N99, N100, N101, N102, N103, N104, N105, N106, N107, N108,
         N109, N110, N111, N112, N113, N114, N115, N116, N117, N118, N119,
         N120, N121, N122, N123, N124, N125, N126, N127, N128, N129, N130,
         N131, N132, N133, N134, N135, N136, N137, N138, N139;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign enable = dat_samp_en;

  \**SEQGEN**  \current_state_reg[2]  ( .clear(N17), .preset(1'b0), 
        .next_state(next_state[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(current_state[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \current_state_reg[1]  ( .clear(N17), .preset(1'b0), 
        .next_state(next_state[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(current_state[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \current_state_reg[0]  ( .clear(N17), .preset(1'b0), 
        .next_state(next_state[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(current_state[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  GTECH_AND2 C19 ( .A(N18), .B(N19), .Z(N21) );
  GTECH_AND2 C20 ( .A(N21), .B(N20), .Z(N22) );
  GTECH_OR2 C22 ( .A(current_state[2]), .B(current_state[1]), .Z(N23) );
  GTECH_OR2 C23 ( .A(N23), .B(N20), .Z(N24) );
  GTECH_OR2 C27 ( .A(current_state[2]), .B(N19), .Z(N26) );
  GTECH_OR2 C28 ( .A(N26), .B(N20), .Z(N27) );
  GTECH_OR2 C31 ( .A(current_state[2]), .B(N19), .Z(N29) );
  GTECH_OR2 C32 ( .A(N29), .B(current_state[0]), .Z(N30) );
  GTECH_OR2 C36 ( .A(N18), .B(N19), .Z(N32) );
  GTECH_OR2 C37 ( .A(N32), .B(current_state[0]), .Z(N33) );
  GTECH_AND2 C39 ( .A(current_state[2]), .B(current_state[1]), .Z(N35) );
  GTECH_AND2 C40 ( .A(N35), .B(current_state[0]), .Z(N36) );
  GTECH_OR2 C42 ( .A(N18), .B(current_state[1]), .Z(N37) );
  EQ_UNS_OP eq_50 ( .A(edge_cnt), .B({N45, N45, N45, N45, N45, N45, N45, N45, 
        N45, N45, N45, N45, N45, N45, N45, N45, N45, N45, N45, N45, N45, N45, 
        N45, N45, N45, N45, N44, N43, N42, N41, N40, N39}), .Z(N46) );
  EQ_UNS_OP eq_62_2 ( .A(edge_cnt), .B({N57, N57, N57, N57, N57, N57, N57, N57, 
        N57, N57, N57, N57, N57, N57, N57, N57, N57, N57, N57, N57, N57, N57, 
        N57, N57, N57, N57, N56, N55, N54, N53, N52, N51}), .Z(N58) );
  EQ_UNS_OP eq_73 ( .A(edge_cnt), .B({N70, N70, N70, N70, N70, N70, N70, N70, 
        N70, N70, N70, N70, N70, N70, N70, N70, N70, N70, N70, N70, N70, N70, 
        N70, N70, N70, N70, N69, N68, N67, N66, N65, N64}), .Z(N71) );
  EQ_UNS_OP eq_81 ( .A(edge_cnt), .B({N78, N78, N78, N78, N78, N78, N78, N78, 
        N78, N78, N78, N78, N78, N78, N78, N78, N78, N78, N78, N78, N78, N78, 
        N78, N78, N78, N78, N77, N76, N75, N74, N73, N72}), .Z(N79) );
  GTECH_AND2 C125 ( .A(N18), .B(N19), .Z(N84) );
  GTECH_AND2 C126 ( .A(N84), .B(N20), .Z(N85) );
  GTECH_OR2 C128 ( .A(current_state[2]), .B(current_state[1]), .Z(N86) );
  GTECH_OR2 C129 ( .A(N86), .B(N20), .Z(N87) );
  GTECH_OR2 C133 ( .A(current_state[2]), .B(N19), .Z(N89) );
  GTECH_OR2 C134 ( .A(N89), .B(N20), .Z(N90) );
  GTECH_OR2 C137 ( .A(current_state[2]), .B(N19), .Z(N92) );
  GTECH_OR2 C138 ( .A(N92), .B(current_state[0]), .Z(N93) );
  GTECH_OR2 C142 ( .A(N18), .B(N19), .Z(N95) );
  GTECH_OR2 C143 ( .A(N95), .B(current_state[0]), .Z(N96) );
  GTECH_AND2 C145 ( .A(current_state[2]), .B(current_state[1]), .Z(N98) );
  GTECH_AND2 C146 ( .A(N98), .B(current_state[0]), .Z(N99) );
  GTECH_OR2 C148 ( .A(N18), .B(current_state[1]), .Z(N100) );
  EQ_UNS_OP eq_121 ( .A(edge_cnt), .B({N107, N106, N105, N104, N103, N102}), 
        .Z(N108) );
  EQ_UNS_OP eq_129 ( .A(edge_cnt), .B({N115, N115, N115, N115, N115, N115, 
        N115, N115, N115, N115, N115, N115, N115, N115, N115, N115, N115, N115, 
        N115, N115, N115, N115, N115, N115, N115, N115, N114, N113, N112, N111, 
        N110, N109}), .Z(N116) );
  EQ_UNS_OP eq_137 ( .A(edge_cnt), .B({N122, N121, N120, N119, N118, N117}), 
        .Z(N123) );
  EQ_UNS_OP eq_145 ( .A(edge_cnt), .B({N129, N128, N127, N126, N125, N124}), 
        .Z(N130) );
  GTECH_NOT I_0 ( .A(bit_cnt[3]), .Z(N132) );
  GTECH_OR2 C205 ( .A(bit_cnt[2]), .B(N132), .Z(N133) );
  GTECH_OR2 C206 ( .A(bit_cnt[1]), .B(N133), .Z(N134) );
  GTECH_OR2 C207 ( .A(bit_cnt[0]), .B(N134), .Z(N135) );
  GTECH_NOT I_1 ( .A(N135), .Z(N136) );
  ADD_UNS_OP add_121 ( .A(Prescale[5:1]), .B({1'b1, 1'b0}), .Z({N107, N106, 
        N105, N104, N103, N102}) );
  SUB_UNS_OP sub_50 ( .A(Prescale), .B(1'b1), .Z({N45, N44, N43, N42, N41, N40, 
        N39}) );
  ADD_UNS_OP add_145 ( .A(Prescale[5:1]), .B({1'b1, 1'b0}), .Z({N129, N128, 
        N127, N126, N125, N124}) );
  SUB_UNS_OP sub_81 ( .A(Prescale), .B(1'b1), .Z({N78, N77, N76, N75, N74, N73, 
        N72}) );
  SUB_UNS_OP sub_62 ( .A(Prescale), .B(1'b1), .Z({N57, N56, N55, N54, N53, N52, 
        N51}) );
  SUB_UNS_OP sub_73 ( .A(Prescale), .B(1'b1), .Z({N70, N69, N68, N67, N66, N65, 
        N64}) );
  SUB_UNS_OP sub_129 ( .A(Prescale), .B(1'b1), .Z({N115, N114, N113, N112, 
        N111, N110, N109}) );
  ADD_UNS_OP add_137 ( .A(Prescale[5:1]), .B({1'b1, 1'b0}), .Z({N122, N121, 
        N120, N119, N118, N117}) );
  SELECT_OP C209 ( .DATA1({N48, N48}), .DATA2({1'b0, 1'b1}), .CONTROL1(N0), 
        .CONTROL2(N47), .Z({N50, N49}) );
  GTECH_BUF B_0 ( .A(N46), .Z(N0) );
  GTECH_NOT I_2 ( .A(N59), .Z(N62) );
  SELECT_OP C211 ( .DATA1(N61), .DATA2(1'b0), .CONTROL1(N1), .CONTROL2(N60), 
        .Z(N63) );
  GTECH_BUF B_1 ( .A(N59), .Z(N1) );
  SELECT_OP C212 ( .DATA1({N81, N81}), .DATA2({1'b1, 1'b0}), .CONTROL1(N2), 
        .CONTROL2(N80), .Z({N83, N82}) );
  GTECH_BUF B_2 ( .A(N79), .Z(N2) );
  SELECT_OP C213 ( .DATA1({1'b0, 1'b0, N131}), .DATA2({1'b0, N50, N49}), 
        .DATA3({N63, 1'b1, N62}), .DATA4({N71, 1'b1, 1'b0}), .DATA5({N83, N83, 
        N82}), .DATA6({1'b0, 1'b0, N131}), .DATA7({1'b0, 1'b0, 1'b0}), 
        .CONTROL1(N3), .CONTROL2(N4), .CONTROL3(N5), .CONTROL4(N6), .CONTROL5(
        N7), .CONTROL6(N8), .CONTROL7(N9), .Z(next_state) );
  GTECH_BUF B_3 ( .A(N22), .Z(N3) );
  GTECH_BUF B_4 ( .A(N25), .Z(N4) );
  GTECH_BUF B_5 ( .A(N28), .Z(N5) );
  GTECH_BUF B_6 ( .A(N31), .Z(N6) );
  GTECH_BUF B_7 ( .A(N34), .Z(N7) );
  GTECH_BUF B_8 ( .A(N36), .Z(N8) );
  GTECH_BUF B_9 ( .A(N38), .Z(N9) );
  SELECT_OP C214 ( .DATA1(1'b1), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b1), .DATA7(1'b0), .CONTROL1(N10), .CONTROL2(
        N11), .CONTROL3(N12), .CONTROL4(N13), .CONTROL5(N14), .CONTROL6(N15), 
        .CONTROL7(N16), .Z(Clear) );
  GTECH_BUF B_10 ( .A(N85), .Z(N10) );
  GTECH_BUF B_11 ( .A(N88), .Z(N11) );
  GTECH_BUF B_12 ( .A(N91), .Z(N12) );
  GTECH_BUF B_13 ( .A(N94), .Z(N13) );
  GTECH_BUF B_14 ( .A(N97), .Z(N14) );
  GTECH_BUF B_15 ( .A(N99), .Z(N15) );
  GTECH_BUF B_16 ( .A(N101), .Z(N16) );
  SELECT_OP C215 ( .DATA1(1'b0), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b1), 
        .DATA5(1'b1), .DATA6(N131), .DATA7(1'b0), .CONTROL1(N10), .CONTROL2(
        N11), .CONTROL3(N12), .CONTROL4(N13), .CONTROL5(N14), .CONTROL6(N15), 
        .CONTROL7(N16), .Z(dat_samp_en) );
  SELECT_OP C216 ( .DATA1(1'b0), .DATA2(N108), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b0), .DATA7(1'b0), .CONTROL1(N10), .CONTROL2(
        N11), .CONTROL3(N12), .CONTROL4(N13), .CONTROL5(N14), .CONTROL6(N15), 
        .CONTROL7(N16), .Z(strt_chk_en) );
  SELECT_OP C217 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(N116), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b0), .DATA7(1'b0), .CONTROL1(N10), .CONTROL2(
        N11), .CONTROL3(N12), .CONTROL4(N13), .CONTROL5(N14), .CONTROL6(N15), 
        .CONTROL7(N16), .Z(deser_en) );
  SELECT_OP C218 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(N123), 
        .DATA5(1'b0), .DATA6(1'b0), .DATA7(1'b0), .CONTROL1(N10), .CONTROL2(
        N11), .CONTROL3(N12), .CONTROL4(N13), .CONTROL5(N14), .CONTROL6(N15), 
        .CONTROL7(N16), .Z(par_chk_en) );
  SELECT_OP C219 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(N130), .DATA6(1'b0), .DATA7(1'b0), .CONTROL1(N10), .CONTROL2(
        N11), .CONTROL3(N12), .CONTROL4(N13), .CONTROL5(N14), .CONTROL6(N15), 
        .CONTROL7(N16), .Z(stp_chk_en) );
  SELECT_OP C220 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b1), .DATA7(1'b0), .CONTROL1(N10), .CONTROL2(
        N11), .CONTROL3(N12), .CONTROL4(N13), .CONTROL5(N14), .CONTROL6(N15), 
        .CONTROL7(N16), .Z(data_valid) );
  GTECH_NOT I_3 ( .A(rst_n), .Z(N17) );
  GTECH_NOT I_4 ( .A(current_state[2]), .Z(N18) );
  GTECH_NOT I_5 ( .A(current_state[1]), .Z(N19) );
  GTECH_NOT I_6 ( .A(current_state[0]), .Z(N20) );
  GTECH_NOT I_7 ( .A(N24), .Z(N25) );
  GTECH_NOT I_8 ( .A(N27), .Z(N28) );
  GTECH_NOT I_9 ( .A(N30), .Z(N31) );
  GTECH_NOT I_10 ( .A(N33), .Z(N34) );
  GTECH_NOT I_11 ( .A(N37), .Z(N38) );
  GTECH_BUF B_17 ( .A(N25) );
  GTECH_NOT I_12 ( .A(N46), .Z(N47) );
  GTECH_NOT I_13 ( .A(strt_glitch), .Z(N48) );
  GTECH_BUF B_18 ( .A(N28) );
  GTECH_AND2 C252 ( .A(N136), .B(N58), .Z(N59) );
  GTECH_NOT I_14 ( .A(N59), .Z(N60) );
  GTECH_NOT I_15 ( .A(PAR_EN), .Z(N61) );
  GTECH_BUF B_19 ( .A(N31) );
  GTECH_BUF B_20 ( .A(N34) );
  GTECH_NOT I_16 ( .A(N79), .Z(N80) );
  GTECH_AND2 C262 ( .A(N137), .B(N139), .Z(N81) );
  GTECH_NOT I_17 ( .A(stp_err), .Z(N137) );
  GTECH_OR2 C264 ( .A(N61), .B(N138), .Z(N139) );
  GTECH_NOT I_18 ( .A(par_err), .Z(N138) );
  GTECH_NOT I_19 ( .A(N87), .Z(N88) );
  GTECH_NOT I_20 ( .A(N90), .Z(N91) );
  GTECH_NOT I_21 ( .A(N93), .Z(N94) );
  GTECH_NOT I_22 ( .A(N96), .Z(N97) );
  GTECH_NOT I_23 ( .A(N100), .Z(N101) );
  GTECH_BUF B_21 ( .A(N88) );
  GTECH_BUF B_22 ( .A(N91) );
  GTECH_BUF B_23 ( .A(N94) );
  GTECH_BUF B_24 ( .A(N97) );
  GTECH_NOT I_24 ( .A(RX_IN), .Z(N131) );
endmodule


module data_sampling ( clk, rst_n, RX_IN, edge_cnt, dat_samp_en, Prescale, 
        sampled_bit );
  input [5:0] edge_cnt;
  input [5:0] Prescale;
  input clk, rst_n, RX_IN, dat_samp_en;
  output sampled_bit;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85,
         N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99,
         N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112;
  wire   [1:0] samples;

  GTECH_AND2 C17 ( .A(N18), .B(N19), .Z(N21) );
  GTECH_AND2 C18 ( .A(N21), .B(N20), .Z(N22) );
  GTECH_OR2 C23 ( .A(Prescale[5]), .B(Prescale[4]), .Z(N25) );
  GTECH_OR2 C24 ( .A(N25), .B(N24), .Z(N26) );
  GTECH_OR2 C27 ( .A(Prescale[5]), .B(N28), .Z(N29) );
  GTECH_OR2 C28 ( .A(N29), .B(Prescale[3]), .Z(N30) );
  GTECH_OR2 C31 ( .A(N32), .B(Prescale[4]), .Z(N33) );
  GTECH_OR2 C32 ( .A(N33), .B(Prescale[3]), .Z(N34) );
  \**SEQGEN**  sampled_bit_reg ( .clear(N16), .preset(1'b0), .next_state(N70), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(sampled_bit), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N69) );
  \**SEQGEN**  \samples_reg[1]  ( .clear(N16), .preset(1'b0), .next_state(N67), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(samples[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N68) );
  \**SEQGEN**  \samples_reg[0]  ( .clear(N16), .preset(1'b0), .next_state(N67), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(samples[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N66) );
  GTECH_NOT I_0 ( .A(edge_cnt[2]), .Z(N71) );
  GTECH_NOT I_1 ( .A(edge_cnt[0]), .Z(N72) );
  GTECH_OR2 C121 ( .A(edge_cnt[4]), .B(edge_cnt[5]), .Z(N73) );
  GTECH_OR2 C122 ( .A(edge_cnt[3]), .B(N73), .Z(N74) );
  GTECH_OR2 C123 ( .A(N71), .B(N74), .Z(N75) );
  GTECH_OR2 C124 ( .A(edge_cnt[1]), .B(N75), .Z(N76) );
  GTECH_OR2 C125 ( .A(N72), .B(N76), .Z(N77) );
  GTECH_NOT I_2 ( .A(N77), .Z(N78) );
  GTECH_NOT I_3 ( .A(edge_cnt[3]), .Z(N79) );
  GTECH_OR2 C130 ( .A(N79), .B(N73), .Z(N80) );
  GTECH_OR2 C131 ( .A(edge_cnt[2]), .B(N80), .Z(N81) );
  GTECH_OR2 C132 ( .A(edge_cnt[1]), .B(N81), .Z(N82) );
  GTECH_OR2 C133 ( .A(N72), .B(N82), .Z(N83) );
  GTECH_NOT I_4 ( .A(N83), .Z(N84) );
  GTECH_NOT I_5 ( .A(edge_cnt[4]), .Z(N85) );
  GTECH_OR2 C137 ( .A(N85), .B(edge_cnt[5]), .Z(N86) );
  GTECH_OR2 C138 ( .A(edge_cnt[3]), .B(N86), .Z(N87) );
  GTECH_OR2 C139 ( .A(edge_cnt[2]), .B(N87), .Z(N88) );
  GTECH_OR2 C140 ( .A(edge_cnt[1]), .B(N88), .Z(N89) );
  GTECH_OR2 C141 ( .A(N72), .B(N89), .Z(N90) );
  GTECH_NOT I_6 ( .A(N90), .Z(N91) );
  GTECH_OR2 C148 ( .A(edge_cnt[0]), .B(N76), .Z(N92) );
  GTECH_NOT I_7 ( .A(N92), .Z(N93) );
  GTECH_NOT I_8 ( .A(edge_cnt[1]), .Z(N94) );
  GTECH_OR2 C154 ( .A(edge_cnt[2]), .B(N74), .Z(N95) );
  GTECH_OR2 C155 ( .A(N94), .B(N95), .Z(N96) );
  GTECH_OR2 C156 ( .A(N72), .B(N96), .Z(N97) );
  GTECH_NOT I_9 ( .A(N97), .Z(N98) );
  GTECH_OR2 C163 ( .A(edge_cnt[0]), .B(N82), .Z(N99) );
  GTECH_NOT I_10 ( .A(N99), .Z(N100) );
  GTECH_OR2 C171 ( .A(N94), .B(N75), .Z(N101) );
  GTECH_OR2 C172 ( .A(N72), .B(N101), .Z(N102) );
  GTECH_NOT I_11 ( .A(N102), .Z(N103) );
  GTECH_OR2 C179 ( .A(edge_cnt[0]), .B(N89), .Z(N104) );
  GTECH_NOT I_12 ( .A(N104), .Z(N105) );
  GTECH_OR2 C187 ( .A(N71), .B(N80), .Z(N106) );
  GTECH_OR2 C188 ( .A(N94), .B(N106), .Z(N107) );
  GTECH_OR2 C189 ( .A(N72), .B(N107), .Z(N108) );
  GTECH_NOT I_13 ( .A(N108), .Z(N109) );
  SELECT_OP C191 ( .DATA1({1'b0, 1'b1}), .DATA2({1'b1, 1'b0}), .DATA3({1'b0, 
        1'b0}), .DATA4({1'b0, 1'b0}), .CONTROL1(N0), .CONTROL2(N1), .CONTROL3(
        N2), .CONTROL4(N41), .Z({N43, N42}) );
  GTECH_BUF B_0 ( .A(N98), .Z(N0) );
  GTECH_BUF B_1 ( .A(N93), .Z(N1) );
  GTECH_BUF B_2 ( .A(N78), .Z(N2) );
  SELECT_OP C192 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b1), .DATA4(1'b0), 
        .CONTROL1(N0), .CONTROL2(N1), .CONTROL3(N2), .CONTROL4(N41), .Z(N44)
         );
  SELECT_OP C193 ( .DATA1({1'b0, 1'b1}), .DATA2({1'b1, 1'b0}), .DATA3({1'b0, 
        1'b0}), .DATA4({1'b0, 1'b0}), .CONTROL1(N3), .CONTROL2(N4), .CONTROL3(
        N5), .CONTROL4(N47), .Z({N49, N48}) );
  GTECH_BUF B_3 ( .A(N103), .Z(N3) );
  GTECH_BUF B_4 ( .A(N100), .Z(N4) );
  GTECH_BUF B_5 ( .A(N84), .Z(N5) );
  SELECT_OP C194 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b1), .DATA4(1'b0), 
        .CONTROL1(N3), .CONTROL2(N4), .CONTROL3(N5), .CONTROL4(N47), .Z(N50)
         );
  SELECT_OP C195 ( .DATA1({1'b0, 1'b1}), .DATA2({1'b1, 1'b0}), .DATA3({1'b0, 
        1'b0}), .DATA4({1'b0, 1'b0}), .CONTROL1(N6), .CONTROL2(N7), .CONTROL3(
        N8), .CONTROL4(N53), .Z({N55, N54}) );
  GTECH_BUF B_6 ( .A(N109), .Z(N6) );
  GTECH_BUF B_7 ( .A(N105), .Z(N7) );
  GTECH_BUF B_8 ( .A(N91), .Z(N8) );
  SELECT_OP C196 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b1), .DATA4(1'b0), 
        .CONTROL1(N6), .CONTROL2(N7), .CONTROL3(N8), .CONTROL4(N53), .Z(N56)
         );
  SELECT_OP C197 ( .DATA1(N44), .DATA2(N50), .DATA3(N56), .DATA4(1'b1), 
        .CONTROL1(N9), .CONTROL2(N10), .CONTROL3(N11), .CONTROL4(N38), .Z(N57)
         );
  GTECH_BUF B_9 ( .A(N27), .Z(N9) );
  GTECH_BUF B_10 ( .A(N31), .Z(N10) );
  GTECH_BUF B_11 ( .A(N35), .Z(N11) );
  SELECT_OP C198 ( .DATA1(N15), .DATA2(N15), .DATA3(N15), .DATA4(1'b0), 
        .CONTROL1(N9), .CONTROL2(N10), .CONTROL3(N11), .CONTROL4(N38), .Z(N58)
         );
  SELECT_OP C199 ( .DATA1({N43, N42}), .DATA2({N49, N48}), .DATA3({N55, N54}), 
        .DATA4({1'b0, 1'b0}), .CONTROL1(N9), .CONTROL2(N10), .CONTROL3(N11), 
        .CONTROL4(N38), .Z({N61, N59}) );
  SELECT_OP C200 ( .DATA1(RX_IN), .DATA2(RX_IN), .DATA3(RX_IN), .CONTROL1(N9), 
        .CONTROL2(N10), .CONTROL3(N11), .Z(N60) );
  SELECT_OP C201 ( .DATA1(N57), .DATA2(1'b1), .CONTROL1(N12), .CONTROL2(N23), 
        .Z(N62) );
  GTECH_BUF B_12 ( .A(N22), .Z(N12) );
  SELECT_OP C202 ( .DATA1(N58), .DATA2(1'b0), .CONTROL1(N12), .CONTROL2(N23), 
        .Z(N63) );
  SELECT_OP C203 ( .DATA1({N61, N59}), .DATA2({1'b0, 1'b0}), .CONTROL1(N12), 
        .CONTROL2(N23), .Z({N65, N64}) );
  SELECT_OP C204 ( .DATA1({N65, N64}), .DATA2({1'b1, 1'b1}), .CONTROL1(N13), 
        .CONTROL2(N14), .Z({N68, N66}) );
  GTECH_BUF B_13 ( .A(dat_samp_en), .Z(N13) );
  GTECH_BUF B_14 ( .A(N17), .Z(N14) );
  SELECT_OP C205 ( .DATA1(N60), .DATA2(1'b0), .CONTROL1(N13), .CONTROL2(N14), 
        .Z(N67) );
  SELECT_OP C206 ( .DATA1(N62), .DATA2(1'b1), .CONTROL1(N13), .CONTROL2(N14), 
        .Z(N69) );
  SELECT_OP C207 ( .DATA1(N63), .DATA2(1'b0), .CONTROL1(N13), .CONTROL2(N14), 
        .Z(N70) );
  GTECH_OR2 C210 ( .A(N110), .B(N112), .Z(N15) );
  GTECH_AND2 C211 ( .A(samples[0]), .B(samples[1]), .Z(N110) );
  GTECH_AND2 C212 ( .A(N111), .B(RX_IN), .Z(N112) );
  GTECH_XOR2 C213 ( .A(samples[0]), .B(samples[1]), .Z(N111) );
  GTECH_NOT I_14 ( .A(rst_n), .Z(N16) );
  GTECH_NOT I_15 ( .A(dat_samp_en), .Z(N17) );
  GTECH_NOT I_16 ( .A(Prescale[2]), .Z(N18) );
  GTECH_NOT I_17 ( .A(Prescale[1]), .Z(N19) );
  GTECH_NOT I_18 ( .A(Prescale[0]), .Z(N20) );
  GTECH_NOT I_19 ( .A(N22), .Z(N23) );
  GTECH_NOT I_20 ( .A(Prescale[3]), .Z(N24) );
  GTECH_NOT I_21 ( .A(N26), .Z(N27) );
  GTECH_NOT I_22 ( .A(Prescale[4]), .Z(N28) );
  GTECH_NOT I_23 ( .A(N30), .Z(N31) );
  GTECH_NOT I_24 ( .A(Prescale[5]), .Z(N32) );
  GTECH_NOT I_25 ( .A(N34), .Z(N35) );
  GTECH_OR2 C232 ( .A(N31), .B(N27), .Z(N36) );
  GTECH_OR2 C233 ( .A(N35), .B(N36), .Z(N37) );
  GTECH_NOT I_26 ( .A(N37), .Z(N38) );
  GTECH_OR2 C238 ( .A(N93), .B(N98), .Z(N39) );
  GTECH_OR2 C239 ( .A(N78), .B(N39), .Z(N40) );
  GTECH_NOT I_27 ( .A(N40), .Z(N41) );
  GTECH_OR2 C244 ( .A(N100), .B(N103), .Z(N45) );
  GTECH_OR2 C245 ( .A(N84), .B(N45), .Z(N46) );
  GTECH_NOT I_28 ( .A(N46), .Z(N47) );
  GTECH_OR2 C250 ( .A(N105), .B(N109), .Z(N51) );
  GTECH_OR2 C251 ( .A(N91), .B(N51), .Z(N52) );
  GTECH_NOT I_29 ( .A(N52), .Z(N53) );
endmodule


module edge_bit_counter ( clk, rst_n, Clear, enable, Prescale, edge_cnt, 
        bit_cnt );
  input [5:0] Prescale;
  output [5:0] edge_cnt;
  output [3:0] bit_cnt;
  input clk, rst_n, Clear, enable;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43;

  EQ_UNS_OP eq_20 ( .A(edge_cnt), .B({N12, N11, N10, N9, N8, N7}), .Z(N13) );
  \**SEQGEN**  \bit_cnt_reg[3]  ( .clear(N2), .preset(1'b0), .next_state(N41), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(bit_cnt[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N37) );
  \**SEQGEN**  \bit_cnt_reg[2]  ( .clear(N2), .preset(1'b0), .next_state(N40), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(bit_cnt[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N37) );
  \**SEQGEN**  \bit_cnt_reg[1]  ( .clear(N2), .preset(1'b0), .next_state(N39), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(bit_cnt[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N37) );
  \**SEQGEN**  \bit_cnt_reg[0]  ( .clear(N2), .preset(1'b0), .next_state(N38), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(bit_cnt[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N37) );
  \**SEQGEN**  \edge_cnt_reg[5]  ( .clear(N2), .preset(1'b0), .next_state(N36), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(edge_cnt[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \edge_cnt_reg[4]  ( .clear(N2), .preset(1'b0), .next_state(N35), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(edge_cnt[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \edge_cnt_reg[3]  ( .clear(N2), .preset(1'b0), .next_state(N34), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(edge_cnt[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \edge_cnt_reg[2]  ( .clear(N2), .preset(1'b0), .next_state(N33), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(edge_cnt[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \edge_cnt_reg[1]  ( .clear(N2), .preset(1'b0), .next_state(N32), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(edge_cnt[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \edge_cnt_reg[0]  ( .clear(N2), .preset(1'b0), .next_state(N31), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(edge_cnt[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  SUB_UNS_OP sub_20 ( .A(Prescale), .B(1'b1), .Z({N12, N11, N10, N9, N8, N7})
         );
  ADD_UNS_OP add_22 ( .A(bit_cnt), .B(1'b1), .Z({N18, N17, N16, N15}) );
  ADD_UNS_OP add_24 ( .A(edge_cnt), .B(1'b1), .Z({N24, N23, N22, N21, N20, N19}) );
  SELECT_OP C76 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N24, 
        N23, N22, N21, N20, N19}), .CONTROL1(N0), .CONTROL2(N14), .Z({N30, N29, 
        N28, N27, N26, N25}) );
  GTECH_BUF B_0 ( .A(N13), .Z(N0) );
  SELECT_OP C77 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N30, 
        N29, N28, N27, N26, N25}), .DATA3({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N1), .CONTROL2(N43), .CONTROL3(N5), .Z({N36, N35, N34, N33, N32, 
        N31}) );
  GTECH_BUF B_1 ( .A(Clear), .Z(N1) );
  SELECT_OP C78 ( .DATA1(1'b1), .DATA2(N13), .DATA3(1'b1), .CONTROL1(N1), 
        .CONTROL2(N43), .CONTROL3(N5), .Z(N37) );
  SELECT_OP C79 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N18, N17, N16, N15}), .DATA3({1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N1), .CONTROL2(N43), .CONTROL3(
        N5), .Z({N41, N40, N39, N38}) );
  GTECH_NOT I_0 ( .A(rst_n), .Z(N2) );
  GTECH_BUF B_2 ( .A(rst_n), .Z(N3) );
  GTECH_OR2 C87 ( .A(enable), .B(Clear), .Z(N4) );
  GTECH_NOT I_1 ( .A(N4), .Z(N5) );
  GTECH_AND2 C89 ( .A(N3), .B(N43), .Z(N6) );
  GTECH_NOT I_2 ( .A(N13), .Z(N14) );
  GTECH_AND2 C92 ( .A(N6), .B(N13) );
  GTECH_AND2 C93 ( .A(N6), .B(N14) );
  GTECH_NOT I_3 ( .A(Clear), .Z(N42) );
  GTECH_AND2 C95 ( .A(enable), .B(N42), .Z(N43) );
  GTECH_AND2 C96 ( .A(N6), .B(N42) );
endmodule


module parity_check ( clk, rst_n, par_chk_en, PAR_TYP, sampled_bit, P_DATA, 
        par_err );
  input [7:0] P_DATA;
  input clk, rst_n, par_chk_en, PAR_TYP, sampled_bit;
  output par_err;
  wire   N0, N1, N2, N3, N4, expected_parity, N5, N6, N7, N8, N9, N10, N11,
         N12;

  GTECH_XOR2 C21 ( .A(expected_parity), .B(sampled_bit), .Z(N6) );
  \**SEQGEN**  par_err_reg ( .clear(N5), .preset(1'b0), .next_state(N6), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(par_err), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(par_chk_en) );
  SELECT_OP C28 ( .DATA1(N4), .DATA2(N2), .CONTROL1(N0), .CONTROL2(N1), .Z(
        expected_parity) );
  GTECH_BUF B_0 ( .A(PAR_TYP), .Z(N0) );
  GTECH_BUF B_1 ( .A(N3), .Z(N1) );
  GTECH_XOR2 C31 ( .A(N12), .B(P_DATA[0]), .Z(N2) );
  GTECH_XOR2 C32 ( .A(N11), .B(P_DATA[1]), .Z(N12) );
  GTECH_XOR2 C33 ( .A(N10), .B(P_DATA[2]), .Z(N11) );
  GTECH_XOR2 C34 ( .A(N9), .B(P_DATA[3]), .Z(N10) );
  GTECH_XOR2 C35 ( .A(N8), .B(P_DATA[4]), .Z(N9) );
  GTECH_XOR2 C36 ( .A(N7), .B(P_DATA[5]), .Z(N8) );
  GTECH_XOR2 C37 ( .A(P_DATA[7]), .B(P_DATA[6]), .Z(N7) );
  GTECH_NOT I_0 ( .A(PAR_TYP), .Z(N3) );
  GTECH_NOT I_1 ( .A(N2), .Z(N4) );
  GTECH_NOT I_2 ( .A(rst_n), .Z(N5) );
endmodule


module start_check ( clk, rst_n, strt_chk_en, sampled_bit, strt_glitch );
  input clk, rst_n, strt_chk_en, sampled_bit;
  output strt_glitch;
  wire   N0;

  \**SEQGEN**  strt_glitch_reg ( .clear(N0), .preset(1'b0), .next_state(
        sampled_bit), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        strt_glitch), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(strt_chk_en) );
  GTECH_NOT I_0 ( .A(rst_n), .Z(N0) );
endmodule


module stop_check ( clk, rst_n, stp_chk_en, sampled_bit, stp_err );
  input clk, rst_n, stp_chk_en, sampled_bit;
  output stp_err;
  wire   N0, N1;

  \**SEQGEN**  stp_err_reg ( .clear(N0), .preset(1'b0), .next_state(N1), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(stp_err), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(stp_chk_en) );
  GTECH_NOT I_0 ( .A(rst_n), .Z(N0) );
  GTECH_NOT I_1 ( .A(sampled_bit), .Z(N1) );
endmodule


module deserializer ( clk, rst_n, deser_en, sampled_bit, P_DATA );
  output [7:0] P_DATA;
  input clk, rst_n, deser_en, sampled_bit;
  wire   N0;

  \**SEQGEN**  \P_DATA_reg[7]  ( .clear(N0), .preset(1'b0), .next_state(
        sampled_bit), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        P_DATA[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(deser_en) );
  \**SEQGEN**  \P_DATA_reg[6]  ( .clear(N0), .preset(1'b0), .next_state(
        P_DATA[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        P_DATA[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(deser_en) );
  \**SEQGEN**  \P_DATA_reg[5]  ( .clear(N0), .preset(1'b0), .next_state(
        P_DATA[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        P_DATA[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(deser_en) );
  \**SEQGEN**  \P_DATA_reg[4]  ( .clear(N0), .preset(1'b0), .next_state(
        P_DATA[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        P_DATA[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(deser_en) );
  \**SEQGEN**  \P_DATA_reg[3]  ( .clear(N0), .preset(1'b0), .next_state(
        P_DATA[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        P_DATA[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(deser_en) );
  \**SEQGEN**  \P_DATA_reg[2]  ( .clear(N0), .preset(1'b0), .next_state(
        P_DATA[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        P_DATA[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(deser_en) );
  \**SEQGEN**  \P_DATA_reg[1]  ( .clear(N0), .preset(1'b0), .next_state(
        P_DATA[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        P_DATA[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(deser_en) );
  \**SEQGEN**  \P_DATA_reg[0]  ( .clear(N0), .preset(1'b0), .next_state(
        P_DATA[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        P_DATA[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(deser_en) );
  GTECH_NOT I_0 ( .A(rst_n), .Z(N0) );
endmodule


module UART_RX ( clk, rst_n, RX_IN, PAR_EN, PAR_TYP, Prescale, data_valid, 
        P_DATA, Stop_Error, Parity_Error );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input clk, rst_n, RX_IN, PAR_EN, PAR_TYP;
  output data_valid, Stop_Error, Parity_Error;
  wire   strt_glitch, Clear, par_chk_en, strt_chk_en, stp_chk_en, dat_samp_en,
         enable, deser_en, sampled_bit;
  wire   [5:0] edge_cnt;
  wire   [3:0] bit_cnt;

  RX_FSM u_RX_FSM ( .clk(clk), .rst_n(rst_n), .RX_IN(RX_IN), .PAR_EN(PAR_EN), 
        .bit_cnt(bit_cnt), .edge_cnt(edge_cnt), .Prescale(Prescale), 
        .strt_glitch(strt_glitch), .par_err(Parity_Error), .stp_err(Stop_Error), .Clear(Clear), .dat_samp_en(dat_samp_en), .enable(enable), .strt_chk_en(
        strt_chk_en), .par_chk_en(par_chk_en), .stp_chk_en(stp_chk_en), 
        .deser_en(deser_en), .data_valid(data_valid) );
  data_sampling u_data_sampling ( .clk(clk), .rst_n(rst_n), .RX_IN(RX_IN), 
        .edge_cnt(edge_cnt), .dat_samp_en(dat_samp_en), .Prescale(Prescale), 
        .sampled_bit(sampled_bit) );
  edge_bit_counter u_edge_bit_counter ( .clk(clk), .rst_n(rst_n), .Clear(Clear), .enable(enable), .Prescale(Prescale), .edge_cnt(edge_cnt), .bit_cnt(bit_cnt)
         );
  parity_check u_parity_check ( .clk(clk), .rst_n(rst_n), .par_chk_en(
        par_chk_en), .PAR_TYP(PAR_TYP), .sampled_bit(sampled_bit), .P_DATA(
        P_DATA), .par_err(Parity_Error) );
  start_check u_start_check ( .clk(clk), .rst_n(rst_n), .strt_chk_en(
        strt_chk_en), .sampled_bit(sampled_bit), .strt_glitch(strt_glitch) );
  stop_check u_stop_check ( .clk(clk), .rst_n(rst_n), .stp_chk_en(stp_chk_en), 
        .sampled_bit(sampled_bit), .stp_err(Stop_Error) );
  deserializer u_deserializer ( .clk(clk), .rst_n(rst_n), .deser_en(deser_en), 
        .sampled_bit(sampled_bit), .P_DATA(P_DATA) );
endmodule


module fifo_wr_P_WIDTH4 ( w_clk, w_rstn, w_inc, wq2_rptr, w_addr, gray_w_ptr, 
        full );
  input [3:0] wq2_rptr;
  output [2:0] w_addr;
  output [3:0] gray_w_ptr;
  input w_clk, w_rstn, w_inc;
  output full;
  wire   N0, N1, N2, full_val, N3, N4;
  wire   [3:3] wbin;
  wire   [3:0] wbin_next;
  wire   [2:0] wgray_next;

  EQ_UNS_OP eq_29 ( .A({wbin_next[3], wgray_next}), .B({N1, N2, wq2_rptr[1:0]}), .Z(full_val) );
  \**SEQGEN**  \wbin_reg[3]  ( .clear(N3), .preset(1'b0), .next_state(
        wbin_next[3]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        wbin[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \wbin_reg[2]  ( .clear(N3), .preset(1'b0), .next_state(
        wbin_next[2]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        w_addr[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wbin_reg[1]  ( .clear(N3), .preset(1'b0), .next_state(
        wbin_next[1]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        w_addr[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wbin_reg[0]  ( .clear(N3), .preset(1'b0), .next_state(
        wbin_next[0]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        w_addr[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wgray_reg[3]  ( .clear(N3), .preset(1'b0), .next_state(
        wbin_next[3]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        gray_w_ptr[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wgray_reg[2]  ( .clear(N3), .preset(1'b0), .next_state(
        wgray_next[2]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        gray_w_ptr[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wgray_reg[1]  ( .clear(N3), .preset(1'b0), .next_state(
        wgray_next[1]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        gray_w_ptr[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wgray_reg[0]  ( .clear(N3), .preset(1'b0), .next_state(
        wgray_next[0]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        gray_w_ptr[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  full_reg ( .clear(N3), .preset(1'b0), .next_state(full_val), 
        .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(full), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  ADD_UNS_OP add_21 ( .A({wbin[3], w_addr}), .B(N0), .Z(wbin_next) );
  GTECH_AND2 C41 ( .A(w_inc), .B(N4), .Z(N0) );
  GTECH_NOT I_0 ( .A(full), .Z(N4) );
  GTECH_XOR2 C43 ( .A(wbin_next[3]), .B(wbin_next[2]), .Z(wgray_next[2]) );
  GTECH_XOR2 C44 ( .A(wbin_next[2]), .B(wbin_next[1]), .Z(wgray_next[1]) );
  GTECH_XOR2 C45 ( .A(wbin_next[1]), .B(wbin_next[0]), .Z(wgray_next[0]) );
  GTECH_NOT I_1 ( .A(wq2_rptr[3]), .Z(N1) );
  GTECH_NOT I_2 ( .A(wq2_rptr[2]), .Z(N2) );
  GTECH_NOT I_3 ( .A(w_rstn), .Z(N3) );
endmodule


module fifo_rd_P_WIDTH4 ( r_clk, r_rstn, r_inc, rq2_wptr, r_addr, gray_rd_ptr, 
        empty );
  input [3:0] rq2_wptr;
  output [2:0] r_addr;
  output [3:0] gray_rd_ptr;
  input r_clk, r_rstn, r_inc;
  output empty;
  wire   N0, empty_check, N1, N2;
  wire   [3:3] r_bin;
  wire   [3:0] r_bin_next;
  wire   [2:0] r_gray_next;

  EQ_UNS_OP eq_27 ( .A({r_bin_next[3], r_gray_next}), .B(rq2_wptr), .Z(
        empty_check) );
  \**SEQGEN**  \r_bin_reg[3]  ( .clear(N1), .preset(1'b0), .next_state(
        r_bin_next[3]), .clocked_on(r_clk), .data_in(1'b0), .enable(1'b0), .Q(
        r_bin[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \r_bin_reg[2]  ( .clear(N1), .preset(1'b0), .next_state(
        r_bin_next[2]), .clocked_on(r_clk), .data_in(1'b0), .enable(1'b0), .Q(
        r_addr[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \r_bin_reg[1]  ( .clear(N1), .preset(1'b0), .next_state(
        r_bin_next[1]), .clocked_on(r_clk), .data_in(1'b0), .enable(1'b0), .Q(
        r_addr[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \r_bin_reg[0]  ( .clear(N1), .preset(1'b0), .next_state(
        r_bin_next[0]), .clocked_on(r_clk), .data_in(1'b0), .enable(1'b0), .Q(
        r_addr[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \gray_rd_ptr_reg[3]  ( .clear(N1), .preset(1'b0), .next_state(
        r_bin_next[3]), .clocked_on(r_clk), .data_in(1'b0), .enable(1'b0), .Q(
        gray_rd_ptr[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \gray_rd_ptr_reg[2]  ( .clear(N1), .preset(1'b0), .next_state(
        r_gray_next[2]), .clocked_on(r_clk), .data_in(1'b0), .enable(1'b0), 
        .Q(gray_rd_ptr[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \gray_rd_ptr_reg[1]  ( .clear(N1), .preset(1'b0), .next_state(
        r_gray_next[1]), .clocked_on(r_clk), .data_in(1'b0), .enable(1'b0), 
        .Q(gray_rd_ptr[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \gray_rd_ptr_reg[0]  ( .clear(N1), .preset(1'b0), .next_state(
        r_gray_next[0]), .clocked_on(r_clk), .data_in(1'b0), .enable(1'b0), 
        .Q(gray_rd_ptr[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  empty_reg ( .clear(1'b0), .preset(N1), .next_state(empty_check), 
        .clocked_on(r_clk), .data_in(1'b0), .enable(1'b0), .Q(empty), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  ADD_UNS_OP add_23 ( .A({r_bin[3], r_addr}), .B(N0), .Z(r_bin_next) );
  GTECH_AND2 C34 ( .A(r_inc), .B(N2), .Z(N0) );
  GTECH_NOT I_0 ( .A(empty), .Z(N2) );
  GTECH_XOR2 C36 ( .A(r_bin_next[3]), .B(r_bin_next[2]), .Z(r_gray_next[2]) );
  GTECH_XOR2 C37 ( .A(r_bin_next[2]), .B(r_bin_next[1]), .Z(r_gray_next[1]) );
  GTECH_XOR2 C38 ( .A(r_bin_next[1]), .B(r_bin_next[0]), .Z(r_gray_next[0]) );
  GTECH_NOT I_1 ( .A(r_rstn), .Z(N1) );
endmodule


module fifo_mem_D_WIDTH8_A_WIDTH3_F_DEPTH8 ( w_clk, w_rstn, w_full, w_inc, 
        w_data, w_addr, r_addr, r_data );
  input [7:0] w_data;
  input [2:0] w_addr;
  input [2:0] r_addr;
  output [7:0] r_data;
  input w_clk, w_rstn, w_full, w_inc;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, \mem[0][7] ,
         \mem[0][6] , \mem[0][5] , \mem[0][4] , \mem[0][3] , \mem[0][2] ,
         \mem[0][1] , \mem[0][0] , \mem[1][7] , \mem[1][6] , \mem[1][5] ,
         \mem[1][4] , \mem[1][3] , \mem[1][2] , \mem[1][1] , \mem[1][0] ,
         \mem[2][7] , \mem[2][6] , \mem[2][5] , \mem[2][4] , \mem[2][3] ,
         \mem[2][2] , \mem[2][1] , \mem[2][0] , \mem[3][7] , \mem[3][6] ,
         \mem[3][5] , \mem[3][4] , \mem[3][3] , \mem[3][2] , \mem[3][1] ,
         \mem[3][0] , \mem[4][7] , \mem[4][6] , \mem[4][5] , \mem[4][4] ,
         \mem[4][3] , \mem[4][2] , \mem[4][1] , \mem[4][0] , \mem[5][7] ,
         \mem[5][6] , \mem[5][5] , \mem[5][4] , \mem[5][3] , \mem[5][2] ,
         \mem[5][1] , \mem[5][0] , \mem[6][7] , \mem[6][6] , \mem[6][5] ,
         \mem[6][4] , \mem[6][3] , \mem[6][2] , \mem[6][1] , \mem[6][0] ,
         \mem[7][7] , \mem[7][6] , \mem[7][5] , \mem[7][4] , \mem[7][3] ,
         \mem[7][2] , \mem[7][1] , \mem[7][0] , N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, N34, N35;

  \**SEQGEN**  \mem_reg[0][7]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[7]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[0][7] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N30) );
  \**SEQGEN**  \mem_reg[0][6]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[6]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[0][6] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N30) );
  \**SEQGEN**  \mem_reg[0][5]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[5]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[0][5] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N30) );
  \**SEQGEN**  \mem_reg[0][4]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[4]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[0][4] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N30) );
  \**SEQGEN**  \mem_reg[0][3]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[3]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[0][3] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N30) );
  \**SEQGEN**  \mem_reg[0][2]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[2]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[0][2] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N30) );
  \**SEQGEN**  \mem_reg[0][1]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[1]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[0][1] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N30) );
  \**SEQGEN**  \mem_reg[0][0]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[0]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[0][0] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N30) );
  \**SEQGEN**  \mem_reg[1][7]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[7]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[1][7] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N29) );
  \**SEQGEN**  \mem_reg[1][6]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[6]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[1][6] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N29) );
  \**SEQGEN**  \mem_reg[1][5]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[5]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[1][5] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N29) );
  \**SEQGEN**  \mem_reg[1][4]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[4]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[1][4] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N29) );
  \**SEQGEN**  \mem_reg[1][3]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[3]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[1][3] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N29) );
  \**SEQGEN**  \mem_reg[1][2]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[2]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[1][2] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N29) );
  \**SEQGEN**  \mem_reg[1][1]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[1]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[1][1] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N29) );
  \**SEQGEN**  \mem_reg[1][0]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[0]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[1][0] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N29) );
  \**SEQGEN**  \mem_reg[2][7]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[7]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[2][7] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N28) );
  \**SEQGEN**  \mem_reg[2][6]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[6]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[2][6] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N28) );
  \**SEQGEN**  \mem_reg[2][5]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[5]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[2][5] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N28) );
  \**SEQGEN**  \mem_reg[2][4]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[4]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[2][4] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N28) );
  \**SEQGEN**  \mem_reg[2][3]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[3]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[2][3] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N28) );
  \**SEQGEN**  \mem_reg[2][2]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[2]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[2][2] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N28) );
  \**SEQGEN**  \mem_reg[2][1]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[1]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[2][1] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N28) );
  \**SEQGEN**  \mem_reg[2][0]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[0]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[2][0] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N28) );
  \**SEQGEN**  \mem_reg[3][7]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[7]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[3][7] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N27) );
  \**SEQGEN**  \mem_reg[3][6]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[6]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[3][6] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N27) );
  \**SEQGEN**  \mem_reg[3][5]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[5]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[3][5] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N27) );
  \**SEQGEN**  \mem_reg[3][4]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[4]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[3][4] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N27) );
  \**SEQGEN**  \mem_reg[3][3]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[3]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[3][3] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N27) );
  \**SEQGEN**  \mem_reg[3][2]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[2]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[3][2] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N27) );
  \**SEQGEN**  \mem_reg[3][1]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[1]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[3][1] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N27) );
  \**SEQGEN**  \mem_reg[3][0]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[0]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[3][0] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N27) );
  \**SEQGEN**  \mem_reg[4][7]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[7]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[4][7] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N26) );
  \**SEQGEN**  \mem_reg[4][6]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[6]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[4][6] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N26) );
  \**SEQGEN**  \mem_reg[4][5]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[5]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[4][5] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N26) );
  \**SEQGEN**  \mem_reg[4][4]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[4]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[4][4] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N26) );
  \**SEQGEN**  \mem_reg[4][3]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[3]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[4][3] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N26) );
  \**SEQGEN**  \mem_reg[4][2]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[2]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[4][2] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N26) );
  \**SEQGEN**  \mem_reg[4][1]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[1]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[4][1] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N26) );
  \**SEQGEN**  \mem_reg[4][0]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[0]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[4][0] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N26) );
  \**SEQGEN**  \mem_reg[5][7]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[7]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[5][7] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N25) );
  \**SEQGEN**  \mem_reg[5][6]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[6]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[5][6] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N25) );
  \**SEQGEN**  \mem_reg[5][5]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[5]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[5][5] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N25) );
  \**SEQGEN**  \mem_reg[5][4]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[4]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[5][4] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N25) );
  \**SEQGEN**  \mem_reg[5][3]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[3]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[5][3] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N25) );
  \**SEQGEN**  \mem_reg[5][2]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[2]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[5][2] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N25) );
  \**SEQGEN**  \mem_reg[5][1]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[1]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[5][1] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N25) );
  \**SEQGEN**  \mem_reg[5][0]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[0]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[5][0] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N25) );
  \**SEQGEN**  \mem_reg[6][7]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[7]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[6][7] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N24) );
  \**SEQGEN**  \mem_reg[6][6]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[6]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[6][6] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N24) );
  \**SEQGEN**  \mem_reg[6][5]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[5]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[6][5] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N24) );
  \**SEQGEN**  \mem_reg[6][4]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[4]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[6][4] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N24) );
  \**SEQGEN**  \mem_reg[6][3]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[3]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[6][3] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N24) );
  \**SEQGEN**  \mem_reg[6][2]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[2]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[6][2] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N24) );
  \**SEQGEN**  \mem_reg[6][1]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[1]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[6][1] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N24) );
  \**SEQGEN**  \mem_reg[6][0]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[0]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[6][0] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N24) );
  \**SEQGEN**  \mem_reg[7][7]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[7]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[7][7] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N23) );
  \**SEQGEN**  \mem_reg[7][6]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[6]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[7][6] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N23) );
  \**SEQGEN**  \mem_reg[7][5]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[5]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[7][5] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N23) );
  \**SEQGEN**  \mem_reg[7][4]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[4]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[7][4] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N23) );
  \**SEQGEN**  \mem_reg[7][3]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[3]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[7][3] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N23) );
  \**SEQGEN**  \mem_reg[7][2]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[2]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[7][2] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N23) );
  \**SEQGEN**  \mem_reg[7][1]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[1]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[7][1] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N23) );
  \**SEQGEN**  \mem_reg[7][0]  ( .clear(N12), .preset(1'b0), .next_state(
        w_data[0]), .clocked_on(w_clk), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[7][0] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N23) );
  GTECH_AND2 C287 ( .A(N31), .B(w_addr[2]), .Z(N22) );
  GTECH_AND2 C289 ( .A(N32), .B(w_addr[2]), .Z(N21) );
  GTECH_AND2 C291 ( .A(N33), .B(w_addr[2]), .Z(N20) );
  GTECH_AND2 C293 ( .A(N34), .B(w_addr[2]), .Z(N19) );
  GTECH_AND2 C294 ( .A(w_addr[0]), .B(w_addr[1]), .Z(N31) );
  GTECH_AND2 C295 ( .A(N31), .B(N0), .Z(N18) );
  GTECH_NOT I_0 ( .A(w_addr[2]), .Z(N0) );
  GTECH_AND2 C296 ( .A(N1), .B(w_addr[1]), .Z(N32) );
  GTECH_NOT I_1 ( .A(w_addr[0]), .Z(N1) );
  GTECH_AND2 C297 ( .A(N32), .B(N2), .Z(N17) );
  GTECH_NOT I_2 ( .A(w_addr[2]), .Z(N2) );
  GTECH_AND2 C298 ( .A(w_addr[0]), .B(N3), .Z(N33) );
  GTECH_NOT I_3 ( .A(w_addr[1]), .Z(N3) );
  GTECH_AND2 C299 ( .A(N33), .B(N4), .Z(N16) );
  GTECH_NOT I_4 ( .A(w_addr[2]), .Z(N4) );
  GTECH_AND2 C300 ( .A(N5), .B(N6), .Z(N34) );
  GTECH_NOT I_5 ( .A(w_addr[0]), .Z(N5) );
  GTECH_NOT I_6 ( .A(w_addr[1]), .Z(N6) );
  GTECH_AND2 C301 ( .A(N34), .B(N7), .Z(N15) );
  GTECH_NOT I_7 ( .A(w_addr[2]), .Z(N7) );
  SELECT_OP C302 ( .DATA1({N15, N16, N17, N18, N19, N20, N21, N22}), .DATA2({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N8), 
        .CONTROL2(N14), .Z({N30, N29, N28, N27, N26, N25, N24, N23}) );
  GTECH_BUF B_0 ( .A(N13), .Z(N8) );
  MUX_OP C303 ( .D0({\mem[0][0] , \mem[0][1] , \mem[0][2] , \mem[0][3] , 
        \mem[0][4] , \mem[0][5] , \mem[0][6] , \mem[0][7] }), .D1({\mem[1][0] , 
        \mem[1][1] , \mem[1][2] , \mem[1][3] , \mem[1][4] , \mem[1][5] , 
        \mem[1][6] , \mem[1][7] }), .D2({\mem[2][0] , \mem[2][1] , \mem[2][2] , 
        \mem[2][3] , \mem[2][4] , \mem[2][5] , \mem[2][6] , \mem[2][7] }), 
        .D3({\mem[3][0] , \mem[3][1] , \mem[3][2] , \mem[3][3] , \mem[3][4] , 
        \mem[3][5] , \mem[3][6] , \mem[3][7] }), .D4({\mem[4][0] , \mem[4][1] , 
        \mem[4][2] , \mem[4][3] , \mem[4][4] , \mem[4][5] , \mem[4][6] , 
        \mem[4][7] }), .D5({\mem[5][0] , \mem[5][1] , \mem[5][2] , \mem[5][3] , 
        \mem[5][4] , \mem[5][5] , \mem[5][6] , \mem[5][7] }), .D6({\mem[6][0] , 
        \mem[6][1] , \mem[6][2] , \mem[6][3] , \mem[6][4] , \mem[6][5] , 
        \mem[6][6] , \mem[6][7] }), .D7({\mem[7][0] , \mem[7][1] , \mem[7][2] , 
        \mem[7][3] , \mem[7][4] , \mem[7][5] , \mem[7][6] , \mem[7][7] }), 
        .S0(N9), .S1(N10), .S2(N11), .Z({r_data[0], r_data[1], r_data[2], 
        r_data[3], r_data[4], r_data[5], r_data[6], r_data[7]}) );
  GTECH_BUF B_1 ( .A(r_addr[0]), .Z(N9) );
  GTECH_BUF B_2 ( .A(r_addr[1]), .Z(N10) );
  GTECH_BUF B_3 ( .A(r_addr[2]), .Z(N11) );
  GTECH_NOT I_8 ( .A(w_rstn), .Z(N12) );
  GTECH_AND2 C307 ( .A(w_inc), .B(N35), .Z(N13) );
  GTECH_NOT I_9 ( .A(w_full), .Z(N35) );
  GTECH_NOT I_10 ( .A(N13), .Z(N14) );
endmodule


module DF_Sync_DATA_WIDTH4 ( clk, rst_n, async, sync );
  input [3:0] async;
  output [3:0] sync;
  input clk, rst_n;
  wire   N0;
  wire   [3:0] sync_reg;

  \**SEQGEN**  \sync_reg_reg[3]  ( .clear(N0), .preset(1'b0), .next_state(
        async[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        sync_reg[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \sync_reg_reg[2]  ( .clear(N0), .preset(1'b0), .next_state(
        async[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        sync_reg[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \sync_reg_reg[1]  ( .clear(N0), .preset(1'b0), .next_state(
        async[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        sync_reg[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \sync_reg_reg[0]  ( .clear(N0), .preset(1'b0), .next_state(
        async[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        sync_reg[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \sync_reg[3]_inst  ( .clear(N0), .preset(1'b0), .next_state(
        sync_reg[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        sync[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \sync_reg[2]_inst  ( .clear(N0), .preset(1'b0), .next_state(
        sync_reg[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        sync[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \sync_reg[1]_inst  ( .clear(N0), .preset(1'b0), .next_state(
        sync_reg[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        sync[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \sync_reg[0]_inst  ( .clear(N0), .preset(1'b0), .next_state(
        sync_reg[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        sync[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  GTECH_NOT I_0 ( .A(rst_n), .Z(N0) );
endmodule


module async_fifo_D_WIDTH8_P_WIDTH4 ( w_clk, w_rstn, w_inc, w_data, full, 
        r_clk, r_rstn, r_inc, r_data, empty );
  input [7:0] w_data;
  output [7:0] r_data;
  input w_clk, w_rstn, w_inc, r_clk, r_rstn, r_inc;
  output full, empty;

  wire   [3:0] wq2_rptr;
  wire   [2:0] w_addr;
  wire   [3:0] gray_w_ptr;
  wire   [3:0] rq2_wptr;
  wire   [2:0] r_addr;
  wire   [3:0] gray_rd_ptr;

  fifo_wr_P_WIDTH4 u_fifo_wr ( .w_clk(w_clk), .w_rstn(w_rstn), .w_inc(w_inc), 
        .wq2_rptr(wq2_rptr), .w_addr(w_addr), .gray_w_ptr(gray_w_ptr), .full(
        full) );
  fifo_rd_P_WIDTH4 u_fifo_rd ( .r_clk(r_clk), .r_rstn(r_rstn), .r_inc(r_inc), 
        .rq2_wptr(rq2_wptr), .r_addr(r_addr), .gray_rd_ptr(gray_rd_ptr), 
        .empty(empty) );
  fifo_mem_D_WIDTH8_A_WIDTH3_F_DEPTH8 u_fifo_mem ( .w_clk(w_clk), .w_rstn(
        w_rstn), .w_full(full), .w_inc(w_inc), .w_data(w_data), .w_addr(w_addr), .r_addr(r_addr), .r_data(r_data) );
  DF_Sync_DATA_WIDTH4 u_sync_r2w ( .clk(w_clk), .rst_n(w_rstn), .async(
        gray_rd_ptr), .sync(wq2_rptr) );
  DF_Sync_DATA_WIDTH4 u_sync_w2r ( .clk(r_clk), .rst_n(r_rstn), .async(
        gray_w_ptr), .sync(rq2_wptr) );
endmodule


module serializer_DATA_WIDTH8 ( clk, rst_n, ser_en, ser_load, P_DATA, ser_done, 
        ser_data );
  input [7:0] P_DATA;
  input clk, rst_n, ser_en, ser_load;
  output ser_done, ser_data;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24;
  wire   [7:1] shift_data;
  wire   [2:0] count;
  assign ser_done = N24;

  \**SEQGEN**  \shift_data_reg[7]  ( .clear(N1), .preset(1'b0), .next_state(
        N17), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_data[7]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \shift_data_reg[6]  ( .clear(N1), .preset(1'b0), .next_state(
        N16), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_data[6]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \shift_data_reg[5]  ( .clear(N1), .preset(1'b0), .next_state(
        N15), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_data[5]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \shift_data_reg[4]  ( .clear(N1), .preset(1'b0), .next_state(
        N14), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_data[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \shift_data_reg[3]  ( .clear(N1), .preset(1'b0), .next_state(
        N13), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_data[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \shift_data_reg[2]  ( .clear(N1), .preset(1'b0), .next_state(
        N12), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_data[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \shift_data_reg[1]  ( .clear(N1), .preset(1'b0), .next_state(
        N11), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_data[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \shift_data_reg[0]  ( .clear(N1), .preset(1'b0), .next_state(
        N10), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(ser_data), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N9) );
  \**SEQGEN**  \count_reg[2]  ( .clear(N1), .preset(1'b0), .next_state(N20), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(count[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N9) );
  \**SEQGEN**  \count_reg[1]  ( .clear(N1), .preset(1'b0), .next_state(N19), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(count[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N9) );
  \**SEQGEN**  \count_reg[0]  ( .clear(N1), .preset(1'b0), .next_state(N18), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(count[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N9) );
  GTECH_AND2 C67 ( .A(count[1]), .B(count[2]), .Z(N23) );
  GTECH_AND2 C68 ( .A(count[0]), .B(N23), .Z(N24) );
  ADD_UNS_OP add_30 ( .A(count), .B(1'b1), .Z({N8, N7, N6}) );
  SELECT_OP C69 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N0), 
        .CONTROL2(N22), .CONTROL3(N4), .Z(N9) );
  GTECH_BUF B_0 ( .A(ser_load), .Z(N0) );
  SELECT_OP C70 ( .DATA1(P_DATA), .DATA2({1'b0, shift_data}), .CONTROL1(N0), 
        .CONTROL2(N22), .Z({N17, N16, N15, N14, N13, N12, N11, N10}) );
  SELECT_OP C71 ( .DATA1({1'b0, 1'b0, 1'b0}), .DATA2({N8, N7, N6}), .CONTROL1(
        N0), .CONTROL2(N22), .Z({N20, N19, N18}) );
  GTECH_NOT I_0 ( .A(rst_n), .Z(N1) );
  GTECH_BUF B_1 ( .A(rst_n), .Z(N2) );
  GTECH_OR2 C79 ( .A(ser_en), .B(ser_load), .Z(N3) );
  GTECH_NOT I_1 ( .A(N3), .Z(N4) );
  GTECH_AND2 C81 ( .A(N2), .B(N22), .Z(N5) );
  GTECH_NOT I_2 ( .A(ser_load), .Z(N21) );
  GTECH_AND2 C83 ( .A(ser_en), .B(N21), .Z(N22) );
  GTECH_AND2 C84 ( .A(N5), .B(N21) );
endmodule


module TX_FSM ( clk, rst_n, Data_Valid, PAR_EN, ser_done, ser_load, ser_en, 
        busy, mux_sel );
  output [2:0] mux_sel;
  input clk, rst_n, Data_Valid, PAR_EN, ser_done;
  output ser_load, ser_en, busy;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  \**SEQGEN**  \current_state_reg[2]  ( .clear(N14), .preset(1'b0), 
        .next_state(next_state[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(current_state[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \current_state_reg[1]  ( .clear(N14), .preset(1'b0), 
        .next_state(next_state[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(current_state[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \current_state_reg[0]  ( .clear(N14), .preset(1'b0), 
        .next_state(next_state[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(current_state[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  GTECH_AND2 C18 ( .A(N15), .B(N16), .Z(N18) );
  GTECH_AND2 C19 ( .A(N18), .B(N17), .Z(N19) );
  GTECH_OR2 C21 ( .A(current_state[2]), .B(current_state[1]), .Z(N20) );
  GTECH_OR2 C22 ( .A(N20), .B(N17), .Z(N21) );
  GTECH_OR2 C25 ( .A(current_state[2]), .B(N16), .Z(N23) );
  GTECH_OR2 C26 ( .A(N23), .B(current_state[0]), .Z(N24) );
  GTECH_OR2 C30 ( .A(current_state[2]), .B(N16), .Z(N26) );
  GTECH_OR2 C31 ( .A(N26), .B(N17), .Z(N27) );
  GTECH_AND2 C33 ( .A(current_state[2]), .B(current_state[1]), .Z(N29) );
  GTECH_AND2 C34 ( .A(N29), .B(current_state[0]), .Z(N30) );
  GTECH_AND2 C36 ( .A(current_state[2]), .B(N16), .Z(N31) );
  GTECH_AND2 C38 ( .A(current_state[2]), .B(N17), .Z(N32) );
  GTECH_AND2 C77 ( .A(N15), .B(N16), .Z(N37) );
  GTECH_AND2 C78 ( .A(N37), .B(N17), .Z(N38) );
  GTECH_OR2 C80 ( .A(current_state[2]), .B(current_state[1]), .Z(N39) );
  GTECH_OR2 C81 ( .A(N39), .B(N17), .Z(N40) );
  GTECH_OR2 C84 ( .A(current_state[2]), .B(N16), .Z(N42) );
  GTECH_OR2 C85 ( .A(N42), .B(current_state[0]), .Z(N43) );
  GTECH_OR2 C89 ( .A(current_state[2]), .B(N16), .Z(N45) );
  GTECH_OR2 C90 ( .A(N45), .B(N17), .Z(N46) );
  GTECH_AND2 C92 ( .A(current_state[2]), .B(current_state[1]), .Z(N48) );
  GTECH_AND2 C93 ( .A(N48), .B(current_state[0]), .Z(N49) );
  GTECH_AND2 C95 ( .A(current_state[2]), .B(N16), .Z(N50) );
  GTECH_AND2 C97 ( .A(current_state[2]), .B(N17), .Z(N51) );
  SELECT_OP C124 ( .DATA1(N35), .DATA2(1'b0), .CONTROL1(N0), .CONTROL2(N1), 
        .Z(N36) );
  GTECH_BUF B_0 ( .A(ser_done), .Z(N0) );
  GTECH_BUF B_1 ( .A(N34), .Z(N1) );
  SELECT_OP C125 ( .DATA1({1'b0, 1'b0, Data_Valid}), .DATA2({1'b0, 1'b1, 1'b0}), .DATA3({N36, 1'b1, ser_done}), .DATA4({1'b1, 1'b1, 1'b1}), .DATA5({1'b0, 
        1'b0, 1'b0}), .DATA6({1'b0, 1'b0, 1'b0}), .CONTROL1(N2), .CONTROL2(N3), 
        .CONTROL3(N4), .CONTROL4(N5), .CONTROL5(N6), .CONTROL6(N7), .Z(
        next_state) );
  GTECH_BUF B_2 ( .A(N19), .Z(N2) );
  GTECH_BUF B_3 ( .A(N22), .Z(N3) );
  GTECH_BUF B_4 ( .A(N25), .Z(N4) );
  GTECH_BUF B_5 ( .A(N28), .Z(N5) );
  GTECH_BUF B_6 ( .A(N30), .Z(N6) );
  GTECH_BUF B_7 ( .A(N33), .Z(N7) );
  SELECT_OP C126 ( .DATA1(1'b0), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b1), 
        .DATA5(1'b1), .DATA6(1'b0), .CONTROL1(N8), .CONTROL2(N9), .CONTROL3(
        N10), .CONTROL4(N11), .CONTROL5(N12), .CONTROL6(N13), .Z(busy) );
  GTECH_BUF B_8 ( .A(N38), .Z(N8) );
  GTECH_BUF B_9 ( .A(ser_load), .Z(N9) );
  GTECH_BUF B_10 ( .A(ser_en), .Z(N10) );
  GTECH_BUF B_11 ( .A(N47), .Z(N11) );
  GTECH_BUF B_12 ( .A(mux_sel[2]), .Z(N12) );
  GTECH_BUF B_13 ( .A(N52), .Z(N13) );
  SELECT_OP C127 ( .DATA1({1'b0, 1'b0}), .DATA2({1'b0, 1'b1}), .DATA3({1'b1, 
        1'b1}), .DATA4({1'b1, 1'b0}), .DATA5({1'b1, 1'b1}), .DATA6({1'b0, 1'b0}), .CONTROL1(N8), .CONTROL2(N9), .CONTROL3(N10), .CONTROL4(N11), .CONTROL5(N12), .CONTROL6(N13), .Z(mux_sel[1:0]) );
  GTECH_NOT I_0 ( .A(rst_n), .Z(N14) );
  GTECH_NOT I_1 ( .A(current_state[2]), .Z(N15) );
  GTECH_NOT I_2 ( .A(current_state[1]), .Z(N16) );
  GTECH_NOT I_3 ( .A(current_state[0]), .Z(N17) );
  GTECH_NOT I_4 ( .A(N21), .Z(N22) );
  GTECH_NOT I_5 ( .A(N24), .Z(N25) );
  GTECH_NOT I_6 ( .A(N27), .Z(N28) );
  GTECH_OR2 C143 ( .A(N31), .B(N32), .Z(N33) );
  GTECH_NOT I_7 ( .A(ser_done), .Z(N34) );
  GTECH_NOT I_8 ( .A(PAR_EN), .Z(N35) );
  GTECH_NOT I_9 ( .A(N40), .Z(N41) );
  GTECH_NOT I_10 ( .A(N43), .Z(N44) );
  GTECH_NOT I_11 ( .A(N46), .Z(N47) );
  GTECH_OR2 C168 ( .A(N50), .B(N51), .Z(N52) );
  GTECH_BUF B_14 ( .A(N41), .Z(ser_load) );
  GTECH_BUF B_15 ( .A(N44), .Z(ser_en) );
  GTECH_BUF B_16 ( .A(N49), .Z(mux_sel[2]) );
endmodule


module parity_calc_DATA_WIDTH8 ( clk, rst_n, Data_Valid, P_DATA, PAR_TYP, 
        par_bit );
  input [7:0] P_DATA;
  input clk, rst_n, Data_Valid, PAR_TYP;
  output par_bit;
  wire   N0, N1, N2, xor_all, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13,
         N14, N15;

  SELECT_OP C27 ( .DATA1(N7), .DATA2(xor_all), .CONTROL1(N0), .CONTROL2(N1), 
        .Z(N8) );
  GTECH_BUF B_0 ( .A(PAR_TYP), .Z(N0) );
  GTECH_BUF B_1 ( .A(N6), .Z(N1) );
  SELECT_OP C28 ( .DATA1(1'b0), .DATA2(N8), .DATA3(1'b0), .CONTROL1(N2), 
        .CONTROL2(N9), .CONTROL3(N5), .Z(par_bit) );
  GTECH_BUF B_2 ( .A(N3), .Z(N2) );
  GTECH_XOR2 C31 ( .A(N15), .B(P_DATA[0]), .Z(xor_all) );
  GTECH_XOR2 C32 ( .A(N14), .B(P_DATA[1]), .Z(N15) );
  GTECH_XOR2 C33 ( .A(N13), .B(P_DATA[2]), .Z(N14) );
  GTECH_XOR2 C34 ( .A(N12), .B(P_DATA[3]), .Z(N13) );
  GTECH_XOR2 C35 ( .A(N11), .B(P_DATA[4]), .Z(N12) );
  GTECH_XOR2 C36 ( .A(N10), .B(P_DATA[5]), .Z(N11) );
  GTECH_XOR2 C37 ( .A(P_DATA[7]), .B(P_DATA[6]), .Z(N10) );
  GTECH_NOT I_0 ( .A(rst_n), .Z(N3) );
  GTECH_OR2 C41 ( .A(Data_Valid), .B(N3), .Z(N4) );
  GTECH_NOT I_1 ( .A(N4), .Z(N5) );
  GTECH_NOT I_2 ( .A(PAR_TYP), .Z(N6) );
  GTECH_NOT I_3 ( .A(xor_all), .Z(N7) );
  GTECH_AND2 C48 ( .A(Data_Valid), .B(rst_n), .Z(N9) );
endmodule


module TX_mux ( mux_sel, start_bit, stop_bit, ser_data, par_bit, TX_OUT );
  input [2:0] mux_sel;
  input start_bit, stop_bit, ser_data, par_bit;
  output TX_OUT;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23;

  GTECH_AND2 C7 ( .A(N6), .B(N7), .Z(N9) );
  GTECH_AND2 C8 ( .A(N9), .B(N8), .Z(N10) );
  GTECH_OR2 C10 ( .A(mux_sel[2]), .B(mux_sel[1]), .Z(N11) );
  GTECH_OR2 C11 ( .A(N11), .B(N8), .Z(N12) );
  GTECH_OR2 C15 ( .A(mux_sel[2]), .B(N7), .Z(N14) );
  GTECH_OR2 C16 ( .A(N14), .B(N8), .Z(N15) );
  GTECH_OR2 C20 ( .A(N14), .B(mux_sel[0]), .Z(N17) );
  GTECH_AND2 C22 ( .A(mux_sel[2]), .B(mux_sel[1]), .Z(N19) );
  GTECH_AND2 C23 ( .A(N19), .B(mux_sel[0]), .Z(N20) );
  GTECH_AND2 C25 ( .A(mux_sel[2]), .B(N7), .Z(N21) );
  GTECH_AND2 C27 ( .A(mux_sel[2]), .B(N8), .Z(N22) );
  SELECT_OP C43 ( .DATA1(stop_bit), .DATA2(start_bit), .DATA3(ser_data), 
        .DATA4(par_bit), .DATA5(stop_bit), .DATA6(stop_bit), .CONTROL1(N0), 
        .CONTROL2(N1), .CONTROL3(N2), .CONTROL4(N3), .CONTROL5(N4), .CONTROL6(
        N5), .Z(TX_OUT) );
  GTECH_BUF B_0 ( .A(N10), .Z(N0) );
  GTECH_BUF B_1 ( .A(N13), .Z(N1) );
  GTECH_BUF B_2 ( .A(N16), .Z(N2) );
  GTECH_BUF B_3 ( .A(N18), .Z(N3) );
  GTECH_BUF B_4 ( .A(N20), .Z(N4) );
  GTECH_BUF B_5 ( .A(N23), .Z(N5) );
  GTECH_NOT I_0 ( .A(mux_sel[2]), .Z(N6) );
  GTECH_NOT I_1 ( .A(mux_sel[1]), .Z(N7) );
  GTECH_NOT I_2 ( .A(mux_sel[0]), .Z(N8) );
  GTECH_NOT I_3 ( .A(N12), .Z(N13) );
  GTECH_NOT I_4 ( .A(N15), .Z(N16) );
  GTECH_NOT I_5 ( .A(N17), .Z(N18) );
  GTECH_OR2 C51 ( .A(N21), .B(N22), .Z(N23) );
endmodule


module UART_TX_DATA_WIDTH8 ( clk, rst_n, P_DATA, Data_Valid, PAR_EN, PAR_TYP, 
        TX_OUT, busy );
  input [7:0] P_DATA;
  input clk, rst_n, Data_Valid, PAR_EN, PAR_TYP;
  output TX_OUT, busy;
  wire   ser_en, ser_load, ser_data, ser_done, par_bit;
  wire   [2:0] mux_sel;

  serializer_DATA_WIDTH8 u_serializer ( .clk(clk), .rst_n(rst_n), .ser_en(
        ser_en), .ser_load(ser_load), .P_DATA(P_DATA), .ser_done(ser_done), 
        .ser_data(ser_data) );
  TX_FSM u_fsm ( .clk(clk), .rst_n(rst_n), .Data_Valid(Data_Valid), .PAR_EN(
        PAR_EN), .ser_done(ser_done), .ser_load(ser_load), .ser_en(ser_en), 
        .busy(busy), .mux_sel(mux_sel) );
  parity_calc_DATA_WIDTH8 u_parity_calc ( .clk(clk), .rst_n(rst_n), 
        .Data_Valid(Data_Valid), .P_DATA(P_DATA), .PAR_TYP(PAR_TYP), .par_bit(
        par_bit) );
  TX_mux u_mux ( .mux_sel(mux_sel), .start_bit(1'b0), .stop_bit(1'b1), 
        .ser_data(ser_data), .par_bit(par_bit), .TX_OUT(TX_OUT) );
endmodule


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
  wire   rx_data_valid;
  wire   [7:0] rx_pdata;

  UART_RX u_uart_rx ( .clk(rx_clk), .rst_n(rx_rstn), .RX_IN(rx_in), .PAR_EN(
        rx_par_en), .PAR_TYP(rx_par_typ), .Prescale(rx_prescale), .data_valid(
        rx_data_valid), .P_DATA(rx_pdata), .Stop_Error(rx_stop_error), 
        .Parity_Error(rx_parity_error) );
  async_fifo_D_WIDTH8_P_WIDTH4 u_async_fifo ( .w_clk(rx_clk), .w_rstn(rx_rstn), 
        .w_inc(rx_data_valid), .w_data(rx_pdata), .full(fifo_full), .r_clk(
        tx_clk), .r_rstn(tx_rstn), .r_inc(fifo_rd_inc), .r_data(fifo_rd_data), 
        .empty(fifo_empty) );
  UART_TX_DATA_WIDTH8 u_uart_tx ( .clk(tx_clk), .rst_n(tx_rstn), .P_DATA(
        fifo_rd_data), .Data_Valid(tx_data_valid), .PAR_EN(tx_par_en), 
        .PAR_TYP(tx_par_typ), .TX_OUT(tx_out), .busy(tx_busy) );
endmodule

