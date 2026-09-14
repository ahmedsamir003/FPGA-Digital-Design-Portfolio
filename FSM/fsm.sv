module fsm (
    input   wire    clk,
    input   wire    rst,
    input   wire    a,
    input   wire    b,
    output  reg     y0,
    output  reg     y1
);

////////////////////////////////////////
/*
localparam       [1:0]      S0 = 2'b00,
                            S1 = 2'b01,
                            S2 = 2'b10;

reg              [1:0]      current_state,
                            next_state;
*/
////////////////////////////////////////


////////////////////////////////////////
typedef enum bit [1:0]  {
                            S0 = 2'b00,
                            S1 = 2'b01,
                            S2 = 2'b10
}   state_e;

state_e         current_state,
                next_state;
////////////////////////////////////////



always@(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                current_state <= S0;
            end
        else
            begin
                current_state <= next_state;
            end
    end

always@(*)
    begin
    next_state = current_state;
    case(current_state)
        S0: begin
                if(!a)
                    next_state = S0;
                else if(!b)
                    next_state = S1;
                else
                    next_state = S2;
            end
        S1: begin
                if(a)
                    next_state = S0;
                else
                    next_state = current_state;
            end
        S2: begin
                next_state = S0;
            end
        default:    next_state = current_state;
    endcase
    end

always@(*)
    begin
        y1 = (current_state == S0) || (current_state == S1);
        y0 = (current_state == S0) && (a && b);
    end
endmodule