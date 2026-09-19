module deserializer #(
    parameter DATA_WIDTH = 8
)(
    input  wire                     clk,
    input  wire                     rst_n,      
    input  wire                     deser_en,   
    input  wire                     sampled_bit,
    output reg  [DATA_WIDTH-1:0]    P_DATA
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            P_DATA <= {DATA_WIDTH{1'b0}};
        else if (deser_en)
            P_DATA <= {sampled_bit, P_DATA[DATA_WIDTH-1:1]};
    end

endmodule