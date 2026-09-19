module UART_RX (
    input  wire                  clk,
    input  wire                  rst_n,      
    input  wire                  RX_IN,
    input  wire                  PAR_EN,
    input  wire                  PAR_TYP,
    input  wire [5:0]            Prescale,   // 8, 16, or 32

    output wire                  data_valid,
    output wire [7:0]            P_DATA,
    output wire                  Stop_Error,
    output wire                  Parity_Error
);


    wire                     par_chk_en, par_err;
    wire                     strt_chk_en, strt_glitch;
    wire                     stp_chk_en, stp_err;
    wire                     dat_samp_en;
    wire [5:0]               edge_cnt;
    wire [3:0]               bit_cnt;
    wire                     enable;
    wire                     deser_en,Clear;
    wire                     sampled_bit;


    assign Stop_Error   = stp_err;
    assign Parity_Error = par_err;

    RX_FSM u_RX_FSM (
        .clk         (clk),
        .rst_n       (rst_n),
        .RX_IN       (RX_IN),
        .PAR_EN      (PAR_EN),
        .Prescale    (Prescale),
        .par_err     (par_err),
        .strt_glitch (strt_glitch),
        .stp_err     (stp_err),
        .edge_cnt    (edge_cnt),
        .bit_cnt     (bit_cnt),
        .Clear       (Clear),
        .par_chk_en  (par_chk_en),
        .strt_chk_en (strt_chk_en),
        .stp_chk_en  (stp_chk_en),
        .dat_samp_en (dat_samp_en),
        .enable      (enable),
        .deser_en    (deser_en),
        .data_valid  (data_valid)
    );


    data_sampling u_data_sampling ( 
        .clk         (clk),
        .rst_n       (rst_n),
        .RX_IN       (RX_IN),
        .Prescale    (Prescale),
        .dat_samp_en (dat_samp_en),
        .edge_cnt    (edge_cnt),
        .sampled_bit (sampled_bit)
    );


    edge_bit_counter u_edge_bit_counter (
        .clk      (clk),
        .rst_n    (rst_n),
        .Clear    (Clear),
        .enable   (enable),
        .Prescale (Prescale),
        .edge_cnt (edge_cnt),
        .bit_cnt  (bit_cnt)
    );


    parity_check u_parity_check (
        .clk         (clk),
        .rst_n       (rst_n),
        .par_chk_en  (par_chk_en),
        .PAR_TYP     (PAR_TYP),
        .P_DATA      (P_DATA),
        .sampled_bit (sampled_bit),
        .par_err     (par_err)
    );

    start_check u_start_check (
        .clk          (clk),
        .rst_n        (rst_n),
        .strt_chk_en  (strt_chk_en),
        .sampled_bit  (sampled_bit),
        .strt_glitch  (strt_glitch)
    );


    stop_check u_stop_check (
        .clk        (clk),
        .rst_n      (rst_n),
        .stp_chk_en (stp_chk_en),
        .sampled_bit(sampled_bit),
        .stp_err    (stp_err)
    );

    deserializer u_deserializer (
        .clk         (clk),
        .rst_n       (rst_n),
        .deser_en    (deser_en),
        .sampled_bit (sampled_bit),
        .P_DATA      (P_DATA)
    );

endmodule