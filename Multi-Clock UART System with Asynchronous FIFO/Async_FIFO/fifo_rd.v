module fifo_rd #(
    parameter P_WIDTH = 4                       // Pointer Width
)(
    input  wire                  r_clk,         // read domian operating clock
    input  wire                  r_rstn,        // read domian active low reset
    input  wire                  r_inc,         // read control signal (enable)
    input  wire [P_WIDTH-1:0]    rq2_wptr,      // synced gray coded write pointer
    output wire [P_WIDTH-2:0]    r_addr,        // Read address to memory
    output reg  [P_WIDTH-1:0]    gray_rd_ptr,   // Model output: Gray pointer
    output reg                   empty          // Empty flag
);

// Internal signals
    reg  [P_WIDTH-1:0] r_bin;           // Binary read pointer
    wire [P_WIDTH-1:0] r_bin_next;      // Next binary read pointer
    wire [P_WIDTH-1:0] r_gray_next;     // Next Gray read pointer
    wire               empty_check; 

    // address generation
    assign r_addr = r_bin[P_WIDTH-2:0]; 

    // gray pointer generation
    assign r_bin_next = r_bin + (r_inc & ~empty);
    assign r_gray_next = (r_bin_next >> 1) ^ r_bin_next;

    // generation of empty flag
    assign empty_check = (r_gray_next == rq2_wptr);

    // sequential logic
    always @(posedge r_clk or negedge r_rstn) begin
        if (!r_rstn) begin
            empty       <= 1'b1;
            r_bin       <= {P_WIDTH{1'b0}};
            gray_rd_ptr <= {P_WIDTH{1'b0}};
        end else begin
            empty       <= empty_check;
            r_bin       <= r_bin_next;
            gray_rd_ptr <= r_gray_next;   
        end
    end

endmodule