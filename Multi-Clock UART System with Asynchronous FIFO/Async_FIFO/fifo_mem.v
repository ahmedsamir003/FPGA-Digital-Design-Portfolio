module fifo_mem #(
    parameter D_WIDTH = 8,                  // Data Size
    parameter A_WIDTH = 3,                  // Address Size
    parameter F_DEPTH = 8                   // Fifo Depth
)(
    input  wire                 w_clk,      // write domian operating clock
    input  wire                 w_rstn,     // write domian active low reset
    input  wire                 w_full,     // fifo buffer full flag
    input  wire                 w_inc,      // write control signal

    input  wire [D_WIDTH-1:0]   w_data,     // write data bus
    input  wire [A_WIDTH-1:0]   w_addr,     // write address bus
    input  wire [A_WIDTH-1:0]   r_addr,     // read address bus
    output wire [D_WIDTH-1:0]   r_data      // read data bus
);

    reg [D_WIDTH-1:0] mem [0:F_DEPTH-1];

    assign r_data = mem[r_addr];            // reading domain

    // registered writing domain
    integer i;
    always @(posedge w_clk or negedge w_rstn) begin
        if(!w_rstn) begin
                for(i = 0 ; i < F_DEPTH ; i = i + 1) 
                mem[i] <= {D_WIDTH{1'b0}} ;
        end else if (w_inc && !w_full) begin
            mem[w_addr] <= w_data;
        end
    end

endmodule