module parity_check (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       par_chk_en,
    input  wire       PAR_TYP,
    input  wire       sampled_bit,
    input  wire [7:0] P_DATA,
    output reg        par_err
);

    assign expected_parity = PAR_TYP ? ~(^P_DATA) : (^P_DATA);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            par_err <= 1'b0;
        end else if (par_chk_en) begin
            par_err <= (expected_parity != sampled_bit);
        end
    end

endmodule
