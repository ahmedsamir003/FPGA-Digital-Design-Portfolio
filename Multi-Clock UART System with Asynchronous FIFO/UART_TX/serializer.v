module serializer #(
    parameter DATA_WIDTH = 8
)(
    input  wire                  clk,
    input  wire                  rst_n,
    input  wire                  ser_en,
    input  wire                  ser_load,
    input  wire [DATA_WIDTH-1:0] P_DATA,

    output wire                  ser_done,
    output wire                  ser_data
);

    reg [2:0]            count;
    reg [DATA_WIDTH-1:0] shift_data;

    assign ser_data = shift_data[0];
    assign ser_done = (count == 3'd7);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_data <= {DATA_WIDTH{1'b0}};
            count      <= 3'b0;
        end else begin
            if (ser_load) begin
                shift_data <= P_DATA;
                count      <= 3'b0;
            end else if (ser_en) begin
                shift_data <= shift_data >> 1;
                count      <= count + 1'b1;
            end
        end
    end

endmodule