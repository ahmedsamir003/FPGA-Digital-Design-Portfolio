module O_Mealy (
    input clk, rst_n, 
    input seq_in, 
    output reg seq_correct
);

    localparam s0 = 3'b000,
               s1 = 3'b001,
               s2 = 3'b010,
               s3 = 3'b011,
               s4 = 3'b100,
               s5 = 3'b101;

    reg [2:0] current_state, next_state;

    always @(posedge clk) begin
        if (!rst_n) begin
            current_state <= s0;
        end else begin
            current_state <= next_state;
        end
    end 

    always @(*) begin
        case (current_state)
            s0: begin
                if (seq_in) begin
                    next_state = s1;
                end else begin
                    next_state = s0;
                end
            end 

            s1: begin
                if (seq_in) begin
                    next_state = s2;
                end else begin
                    next_state = s0;
                end
            end

            s2: begin
                if (seq_in) begin
                    next_state = s2;
                end else begin
                    next_state = s3;
                end
            end

            s3: begin
                if (seq_in) begin
                    next_state = s4;
                end else begin
                    next_state = s0;
                end
            end

            s4: begin
                if (seq_in) begin
                    next_state = s2;
                end begin
                    next_state = s5;
                end
            end

            s5: begin
                if (seq_in) begin
                    next_state = s1;
                end else begin
                    next_state = s0;
                end
            end
            default: next_state = s0;
        endcase
    end



    always @(*) begin
        if (current_state == s5 && seq_in) begin
            seq_correct = 1;
        end else begin
            seq_correct = 0;
        end
    end
    
endmodule