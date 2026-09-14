`timescale 1ns/1ps

module stream_parity_gen_tb();

    reg clk;
    reg rst;
    reg serial_in;

    wire parity_out;
    wire valid;

    reg [7:0] active_byte;
    reg [7:0] expected_byte;

    stream_parity_gen u_dut (
        .clk        (clk),
        .rst        (rst),
        .serial_in  (serial_in),
        .parity_out (parity_out),
        .valid      (valid)
    );

    always #5 clk = ~clk;

    task send_byte(input [7:0] data);
        integer i;
        begin
            active_byte = data;
            for (i = 0; i < 8; i = i + 1) begin
                serial_in <= data[7-i];
                if (i == 7) begin
                    expected_byte <= data;
                end
                @(posedge clk);
            end
        end
    endtask

    always @(posedge clk) begin
        #1;
        if (!rst && valid) begin
            if (parity_out !== ^expected_byte) begin
                $display("[FAIL] Byte 8'd%0d | Expected Parity = %b | Got = %b", 
                         expected_byte, ^expected_byte, parity_out);
            end else begin
                $display("[PASS] Byte 8'd%0d | Parity = %b", expected_byte, parity_out);
            end
        end
    end

    integer byte_val;
    initial begin
        clk       = 0;
        rst       = 1;
        serial_in = 0;

        repeat (2) @(posedge clk);
        #1 rst = 0;

        for (byte_val = 0; byte_val < 256; byte_val = byte_val + 1) begin
            send_byte(byte_val[7:0]);
        end

        repeat (2) @(posedge clk);
        $stop;
    end

endmodule