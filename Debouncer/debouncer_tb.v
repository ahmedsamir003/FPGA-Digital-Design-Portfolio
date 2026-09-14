`timescale 1ns/1ps

module debouncer_tb;

    reg clk;
    reg rst;
    reg sw;

    wire debounced_out;
    wire m_tick;


    debounce DUT (
        .clk(clk),
        .rst(rst),
        .sw(sw),
        .debounced_out(debounced_out),
        .m_tick(m_tick)
    );


    // 10 ns clock
    always #5 clk = ~clk;


    initial begin

        clk = 0;
        rst = 0;
        sw  = 0;

        // Reset
        #20;
        rst = 1;

        // Wait until just after a tick
        #86;

        // Time = 106 ns
        sw = 1;

        // Wait
        #400;

        $stop;

    end


    initial begin
        $monitor("Time = %0t ns | SW = %b | m_tick = %b | State = %b | Counter = %d | Debounced = %b",
                 $time,
                 sw,
                 m_tick,
                 DUT.state,
                 DUT.debounce_counter,
                 debounced_out);
    end

endmodule