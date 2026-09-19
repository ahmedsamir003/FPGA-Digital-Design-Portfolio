module parity_calc #(
    parameter DATA_WIDTH = 8
)(
    input  wire                  clk,
    input  wire                  rst_n,
    input  wire                  Data_Valid,
    input  wire [DATA_WIDTH-1:0] P_DATA,
    input  wire                  PAR_TYP,  // 0 = even, 1 = odd
    output reg                   par_bit
);

    wire xor_all = ^P_DATA;   // XOR of all bits = even parity

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
        par_bit = 1'b0;
        else if (Data_Valid) begin
            if (PAR_TYP)
                par_bit = ~xor_all;   // odd parity
            else
                par_bit = xor_all;    // even parity
        end
        else    
                par_bit = 1'b0;
    end

endmodule