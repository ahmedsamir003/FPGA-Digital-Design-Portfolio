module edge_bit_counter (
    input  wire       clk,
    input  wire       rst_n,      // Active low reset (rst_n)
    input  wire       Clear,
    input  wire       enable,
    input  wire [5:0] Prescale,   // MAX 32 (oversampling)
    
    output reg  [5:0] edge_cnt,
    output reg  [3:0] bit_cnt    // Max 11 bits for UART frame
);

always @(posedge clk or negedge rst_n) begin 
    if (!rst_n) begin
        edge_cnt <= 0;
        bit_cnt  <= 0;
    end else if(Clear) begin
        edge_cnt <= 0;
        bit_cnt  <= 0;
    end else if(enable) begin
                if (edge_cnt == (Prescale - 1'b1)) begin
                    edge_cnt <= 6'b0;
                    bit_cnt  <= bit_cnt + 1'b1;
                end else begin
                    edge_cnt <= edge_cnt + 1'b1;
                end
            end
        else begin
            edge_cnt <= 0;
            bit_cnt  <= 0;
        end
    end

endmodule
		