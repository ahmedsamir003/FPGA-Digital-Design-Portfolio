module UART_TX #(
    parameter DATA_WIDTH = 8
)(
    input  wire                  clk,
    input  wire                  rst_n,
    input  wire [DATA_WIDTH-1:0] P_DATA,
    input  wire                  Data_Valid,
    input  wire                  PAR_EN,
    input  wire                  PAR_TYP,
    output wire                  TX_OUT,
    output wire                  busy
);
    
    assign start_bit = 1'b0 ;
    assign stop_bit = 1'b1 ;
    
    wire        ser_en, ser_done, ser_data,ser_load;
    wire [2:0]  mux_sel;
    wire        par_bit;
 
    serializer #(
        .DATA_WIDTH(DATA_WIDTH)
    ) u_serializer (
        .clk      (clk),
        .rst_n    (rst_n),
        .ser_en   (ser_en),
        .ser_load (ser_load),
        .P_DATA   (P_DATA),
        .ser_data (ser_data),
        .ser_done (ser_done)
    );
 
    TX_FSM u_fsm (
        .clk        (clk),
        .rst_n      (rst_n),
        .Data_Valid (Data_Valid),
        .PAR_EN     (PAR_EN),
        .ser_done   (ser_done),
        .ser_load   (ser_load),
        .ser_en     (ser_en),
        .mux_sel    (mux_sel),
        .busy       (busy)
    );
 
    parity_calc #(
        .DATA_WIDTH(DATA_WIDTH)
    ) u_parity_calc (
        .clk          (clk),
        .rst_n        (rst_n),
        .Data_Valid   (Data_Valid),
        .P_DATA       (P_DATA),
        .PAR_TYP      (PAR_TYP),
        .par_bit      (par_bit)
    );
 
    TX_mux u_mux (
        .mux_sel   (mux_sel),
        .start_bit (start_bit),
        .stop_bit  (stop_bit),
        .ser_data  (ser_data),
        .par_bit   (par_bit),
        .TX_OUT    (TX_OUT)
    );
 
endmodule