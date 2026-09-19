module fifo_wr #(
    parameter P_WIDTH = 4
)(
    input  wire                   w_clk,       // write domian operating clock
    input  wire                   w_rstn,      // write domian active low reset
    input  wire                   w_inc,       // write control signal (enable)
    input  wire [P_WIDTH-1:0]     wq2_rptr,    // synced gray coded read pointer
    output wire [P_WIDTH-2:0]     w_addr,      // generated binary write address
    output wire [P_WIDTH-1:0]     gray_w_ptr,  // generated gray coded write pointer
    output reg                    full         // fifo full flag
);

    reg [P_WIDTH-1:0] wbin;
    reg [P_WIDTH-1:0] wgray;

    wire [P_WIDTH-1:0] wbin_next;
    wire [P_WIDTH-1:0] wgray_next;
    wire               full_val;

    // gray pointer generation
    assign wbin_next  = wbin + (w_inc & ~full);
    assign wgray_next = (wbin_next >> 1) ^ wbin_next;

    // address generation
    assign w_addr = wbin[P_WIDTH-2:0];
    assign gray_w_ptr  = wgray;

    // full flag generation
    assign full_val =(wgray_next == { ~wq2_rptr[P_WIDTH-1:P_WIDTH-2], 
                                         wq2_rptr[P_WIDTH-3:0] });

    // sequential logic //
    always @(posedge w_clk or negedge w_rstn) begin
        if (!w_rstn) begin
            wbin  <= 0;
            wgray <= 0;
        end
        else begin
            wbin  <= wbin_next;
            wgray <= wgray_next;
        end
    end

    always @(posedge w_clk or negedge w_rstn) begin
        if (!w_rstn)
            full <= 1'b0;
        else
            full <= full_val;
    end

endmodule