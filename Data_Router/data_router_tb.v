`timescale 1ns / 1ps

module tb_data_router;

    reg  [31:0] data_in;
    wire [7:0]  byte_low;
    wire [7:0]  byte_high;
    wire        parity_bit;

    data_router dut (
        .data_in    (data_in),
        .byte_low   (byte_low),
        .byte_high  (byte_high),
        .parity_bit (parity_bit)
    );

    initial begin
        $monitor("Time=%0nt | data_in=0x%h | byte_high=0x%h | parity_bit=%b | byte_low=0x%h",
                 $time, data_in, byte_high, parity_bit, byte_low);

        data_in = 32'hAB_CD_EF_12;
        #10;

        data_in = 32'h89_00_80_FF;
        #10;

        data_in = 32'h12_34_00_56;
        #10;

        $finish;
    end

endmodule