module RX_FSM (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       RX_IN,
    input  wire       PAR_EN,
    input  wire [3:0] bit_cnt,      
    input  wire [5:0] edge_cnt,  
    input  wire [5:0] Prescale,  
    input  wire       strt_glitch,   
    input  wire       par_err,       
    input  wire       stp_err,       
    
    output reg        Clear,
    output reg        dat_samp_en,
    output reg        enable,         
    output reg        strt_chk_en,
    output reg        par_chk_en,
    output reg        stp_chk_en,
    output reg        deser_en,
    output reg        data_valid
);
    localparam [2:0] IDLE   = 3'b000,
                     START  = 3'b001,
                     DATA   = 3'b011,
                     PARITY = 3'b010,
                     STOP   = 3'b110,
                     VALID  = 3'b111;

    reg [2:0] current_state, next_state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    always @(*) begin
        next_state = current_state;
        case (current_state)
            IDLE: begin
                if (!RX_IN) 
                    next_state = START;
                else
                    next_state = IDLE;
            end
            
            START: begin
            
                if (edge_cnt == Prescale - 1) begin
                    if (strt_glitch)
                        next_state = IDLE;
                    else
                        next_state = DATA;
                end else begin
                        next_state = START;
                    end
            end
            
            DATA: begin
            
                if (bit_cnt == 4'd8 && edge_cnt == Prescale - 1) begin
                    if (PAR_EN)
                        next_state = PARITY;
                    else
                        next_state = STOP;
                end else begin
                        next_state = DATA;
                    end
            end
            
            PARITY: begin
                if (edge_cnt == Prescale - 1) begin
                    next_state = STOP;
                end else begin
                    next_state = PARITY;
                end
            end
            
            STOP: begin
                if (edge_cnt == Prescale - 1) begin
                    if(!stp_err && (!PAR_EN || !par_err))
                        next_state = VALID;
                    else
                        next_state = IDLE;
                end else begin
                    next_state = STOP;
                end
            end

            VALID: begin
                if(!RX_IN)
                    next_state = START;
                else
                    next_state = IDLE;
            end
            
            default: next_state = IDLE;
        endcase
    end

    always @(*) begin
        Clear       = 1'b0;
        dat_samp_en = 1'b0;
        enable      = 1'b0;
        strt_chk_en = 1'b0;
        par_chk_en  = 1'b0;
        stp_chk_en  = 1'b0;
        deser_en    = 1'b0;
        data_valid  = 1'b0;

        case (current_state)
            IDLE: begin
                    Clear  = 1'b1;
            end
            
            START: begin
                enable = 1'b1;
                dat_samp_en = 1'b1;

                if (edge_cnt == ((Prescale >> 1 ) + 2))
                    strt_chk_en = 1'b1;
            end
            
            DATA: begin
                enable = 1'b1;
                dat_samp_en = 1'b1;

                if (edge_cnt == Prescale - 1 )
                    deser_en = 1'b1;
            end
            
            PARITY: begin
                enable = 1'b1;
                dat_samp_en = 1'b1;

                if (edge_cnt == ((Prescale >> 1) + 2))
                    par_chk_en = 1'b1;
            end
            
            STOP: begin
                enable = 1'b1;
                dat_samp_en = 1'b1;

                if (edge_cnt == ((Prescale >> 1) + 2))
                    stp_chk_en = 1'b1;
            end

            VALID: begin
                data_valid = 1'b1;
                Clear       = 1'b1;
                if(!RX_IN) begin
                    enable      = 1'b1;
                    dat_samp_en = 1'b1;
                end
            end

            default: begin
                Clear       = 1'b0;
                dat_samp_en = 1'b0;
                enable      = 1'b0;
                strt_chk_en = 1'b0;
                par_chk_en  = 1'b0;
                stp_chk_en  = 1'b0;
                deser_en    = 1'b0;
                data_valid  = 1'b0;
            end
        endcase
    end

endmodule