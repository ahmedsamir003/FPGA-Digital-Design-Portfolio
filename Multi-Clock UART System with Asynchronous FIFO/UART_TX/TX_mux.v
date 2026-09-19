module TX_mux (
    input  wire [2:0] mux_sel,
    input  wire       start_bit,
    input  wire       stop_bit,  
    input  wire       ser_data,
    input  wire       par_bit,
    output reg        TX_OUT
);
    localparam  [2:0]       IDLE_SEL   = 3'b000,
                            START_SEL  = 3'b001,
                            DATA_SEL   = 3'b011,
                            PARITY_SEL = 3'b010,
                            STOP_SEL   = 3'b111;
 
    always @(*) begin
        case (mux_sel)
            IDLE_SEL:     TX_OUT = stop_bit;
            START_SEL:    TX_OUT = start_bit;
            DATA_SEL:     TX_OUT = ser_data;
            PARITY_SEL:   TX_OUT = par_bit;
            STOP_SEL:     TX_OUT = stop_bit;
            default:      TX_OUT = stop_bit;                 // idle line should rest high
        endcase
    end
endmodule