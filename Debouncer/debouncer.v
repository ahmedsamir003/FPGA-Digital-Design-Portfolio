module debouncer (
    input  wire clk,
    input  wire rst,
    input  wire sw,

    output reg  debounced_out,
    output reg  m_tick
);

    reg [3:0] tick_counter;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            tick_counter <= 4'd0;
            m_tick       <= 1'b0;
        end
        else begin
            if (tick_counter == 4'd9) begin
                tick_counter <= 4'd0;
                m_tick       <= 1'b1;
            end
            else begin
                tick_counter <= tick_counter + 1'b1;
                m_tick       <= 1'b0;
            end
        end
    end

    localparam  [2:0]       ZERO      = 2'b00,
                            WAIT_ONE  = 2'b01,
                            ONE       = 2'b10,
                            WAIT_ZERO = 2'b11;

    reg         [1:0]       state,
                            debounce_counter;


    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            state            <= ZERO;
            debounce_counter <= 2'd0;
        end
        else begin

            case (state)

                ZERO: begin
                    debounce_counter <= 2'd0;

                    if (sw)
                        state <= WAIT_ONE;
                end


                WAIT_ONE: begin

                    if (!sw) begin
                        state            <= ZERO;
                        debounce_counter <= 2'd0;
                    end

                    else if (m_tick) begin

                        if (debounce_counter == 2'd1) begin
                            state            <= ONE;
                            debounce_counter <= 2'd0;
                        end
                        else begin
                            debounce_counter <= debounce_counter + 1'b1;
                        end
                    end
                end


                ONE: begin
                    debounce_counter <= 2'd0;

                    if (!sw)
                        state <= WAIT_ZERO;
                end


                WAIT_ZERO: begin

                    if (sw) begin
                        state            <= ONE;
                        debounce_counter <= 2'd0;
                    end

                    else if (m_tick) begin

                        if (debounce_counter == 2'd1) begin
                            state            <= ZERO;
                            debounce_counter <= 2'd0;
                        end
                        else begin
                            debounce_counter <= debounce_counter + 1'b1;
                        end
                    end
                end

                default: begin
                    state            <= ZERO;
                    debounce_counter <= 2'd0;
                end

            endcase
        end
    end

    always @(*) begin

        case (state)

            ZERO:
                debounced_out = 1'b0;

            WAIT_ONE:
                debounced_out = 1'b0;

            ONE:
                debounced_out = 1'b1;

            WAIT_ZERO:
                debounced_out = 1'b1;

            default:
                debounced_out = 1'b0;

        endcase

    end

endmodule