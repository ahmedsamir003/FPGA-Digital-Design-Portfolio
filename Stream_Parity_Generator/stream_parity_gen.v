module stream_parity_gen(
    input   wire        clk,
    input   wire        rst,
    input   wire        serial_in,
    output  reg         parity_out,
    output  reg         valid
);

reg [7:0]   shift_reg;
reg [2:0]   bit_cnt;

function [7:0] shift;
    input   [7:0]   current_reg;
    input           new_bit;
    begin
        shift = {current_reg[6:0], new_bit};
    end
endfunction

function calc_even_parity;
    input   [7:0]   data;
    begin
        calc_even_parity = ^data;
    end
endfunction

always @(posedge clk) begin
    if (rst) begin
        shift_reg  <= 8'd0;
        parity_out <= 1'b0;
        bit_cnt    <= 3'd0;
        valid      <= 1'b0;
    end else begin
        shift_reg <= shift(shift_reg, serial_in);
        bit_cnt   <= bit_cnt + 1'b1;

        if (bit_cnt == 3'd7) begin
            valid      <= 1'b1;
            parity_out <= calc_even_parity(shift(shift_reg, serial_in));                        
        end else begin
            valid      <= 1'b0;
        end
    end
end

endmodule