`timescale 1ns/1ps

module fsm_tb;

    reg clk;
    reg rst;
    reg a;
    reg b;
    wire y0;
    wire y1;

    fsm DUT (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .y0(y0),
        .y1(y1)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 0;
        a   = 0;
        b   = 0;

        #15;
        rst = 1;
        #10;

        a = 1; b = 0;
        #10;

        a = 1; b = 0;
        #10;

        a = 1; b = 1;
        #10;

        a = 0; b = 0;
        #10;

        #20;
        $stop;
    end

endmodule