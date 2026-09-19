module system_top #(
    parameter DATA_WIDTH   = 8,
    parameter FIFO_P_WIDTH = 4
)(
    // Transmitter Clock & Reset Domain
    input  wire                  tx_clk,
    input  wire                  tx_rstn,

    // Receiver Clock & Reset Domain
    input  wire                  rx_clk,
    input  wire                  rx_rstn,

    // UART RX Interface
    input  wire                  rx_in,
    input  wire                  rx_par_en,
    input  wire                  rx_par_typ,
    input  wire [5:0]            rx_prescale,
    output wire                  rx_stop_error,
    output wire                  rx_parity_error,

    // UART TX Interface
    input  wire                  tx_par_en,
    input  wire                  tx_par_typ,
    output wire                  tx_out,
    output wire                  tx_busy,

    // FIFO Interface Controls
    input  wire                  fifo_rd_inc,
    input  wire                  tx_data_valid,
    output wire                  fifo_full,
    output wire                  fifo_empty,
    output wire [DATA_WIDTH-1:0] fifo_rd_data
);

    // Interconnect Signals: UART RX -> Async FIFO Write Port
    wire [DATA_WIDTH-1:0] rx_pdata;
    wire                  rx_data_valid;

    // -------------------------------------------------------------------------
    // 1. UART Receiver Instance (Rx Clock Domain)
    // -------------------------------------------------------------------------
    UART_RX u_uart_rx (
        .clk          (rx_clk),
        .rst_n        (rx_rstn),
        .RX_IN        (rx_in),
        .PAR_EN       (rx_par_en),
        .PAR_TYP      (rx_par_typ),
        .Prescale     (rx_prescale),
        .data_valid   (rx_data_valid),
        .P_DATA       (rx_pdata),
        .Stop_Error   (rx_stop_error),
        .Parity_Error (rx_parity_error)
    );

    // -------------------------------------------------------------------------
    // 2. Asynchronous FIFO Instance (Bridge RX & TX Domains)
    // -------------------------------------------------------------------------
    async_fifo #(
        .D_WIDTH (DATA_WIDTH),
        .P_WIDTH (FIFO_P_WIDTH)
    ) u_async_fifo (
        // Write Domain (Driven by UART RX)
        .w_clk   (rx_clk),
        .w_rstn  (rx_rstn),
        .w_inc   (rx_data_valid),
        .w_data  (rx_pdata),
        .full    (fifo_full),

        // Read Domain (Driven by system/TX reader)
        .r_clk   (tx_clk),
        .r_rstn  (tx_rstn),
        .r_inc   (fifo_rd_inc),
        .r_data  (fifo_rd_data),
        .empty   (fifo_empty)
    );

    // -------------------------------------------------------------------------
    // 3. UART Transmitter Instance (Tx Clock Domain)
    // -------------------------------------------------------------------------
    UART_TX #(
        .DATA_WIDTH (DATA_WIDTH)
    ) u_uart_tx (
        .clk        (tx_clk),
        .rst_n      (tx_rstn),
        .P_DATA     (fifo_rd_data),
        .Data_Valid (tx_data_valid),
        .PAR_EN     (tx_par_en),
        .PAR_TYP    (tx_par_typ),
        .TX_OUT     (tx_out),
        .busy       (tx_busy)
    );

endmodule