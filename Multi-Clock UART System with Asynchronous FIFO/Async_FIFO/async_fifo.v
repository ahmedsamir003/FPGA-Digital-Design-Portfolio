module async_fifo #(
    parameter D_WIDTH = 8,
    parameter P_WIDTH = 4
)(
    // Write Domain
    input  wire                 w_clk,
    input  wire                 w_rstn,
    input  wire                 w_inc,
    input  wire [D_WIDTH-1:0]   w_data,
    output wire                 full,

    // Read Domain
    input  wire                 r_clk,
    input  wire                 r_rstn,
    input  wire                 r_inc,
    output wire [D_WIDTH-1:0]   r_data,
    output wire                 empty
);

    localparam A_WIDTH = P_WIDTH - 1;
    localparam F_DEPTH = 1 << A_WIDTH;

    // Internal Interconnect Wires
    wire [A_WIDTH-1:0] w_addr;
    wire [A_WIDTH-1:0] r_addr;
    wire [P_WIDTH-1:0] gray_w_ptr;
    wire [P_WIDTH-1:0] gray_rd_ptr;
    wire [P_WIDTH-1:0] wq2_rptr;
    wire [P_WIDTH-1:0] rq2_wptr;

    // 1. Write Pointer & Full Generation
    fifo_wr #(
        .P_WIDTH(P_WIDTH)
    ) u_fifo_wr (
        .w_clk(w_clk),
        .w_rstn(w_rstn),
        .w_inc(w_inc),
        .wq2_rptr(wq2_rptr),
        .w_addr(w_addr),
        .gray_w_ptr(gray_w_ptr),
        .full(full)
    );

    // 2. Read Pointer & Empty Generation
    fifo_rd #(
        .P_WIDTH(P_WIDTH)
    ) u_fifo_rd (
        .r_clk(r_clk),
        .r_rstn(r_rstn),
        .r_inc(r_inc),
        .rq2_wptr(rq2_wptr),
        .r_addr(r_addr),
        .gray_rd_ptr(gray_rd_ptr),
        .empty(empty)
    );

    // 3. FIFO Memory Array
    fifo_mem #(
        .D_WIDTH(D_WIDTH),
        .A_WIDTH(A_WIDTH),
        .F_DEPTH(F_DEPTH)
    ) u_fifo_mem (
        .w_clk(w_clk),
        .w_rstn(w_rstn),
        .w_full(full),
        .w_inc(w_inc),
        .w_data(w_data),
        .w_addr(w_addr),
        .r_addr(r_addr),
        .r_data(r_data)
    );

    // 4. Synchronize Read Pointer into Write Domain (rptr -> w_clk)
    DF_Sync #(
        .DATA_WIDTH(P_WIDTH)
    ) u_sync_r2w (
        .clk(w_clk),
        .rst_n(w_rstn),
        .async(gray_rd_ptr),
        .sync(wq2_rptr)
    );

    // 5. Synchronize Write Pointer into Read Domain (wptr -> r_clk)
    DF_Sync #(
        .DATA_WIDTH(P_WIDTH)
    ) u_sync_w2r (
        .clk(r_clk),
        .rst_n(r_rstn),
        .async(gray_w_ptr),
        .sync(rq2_wptr)
    );

endmodule