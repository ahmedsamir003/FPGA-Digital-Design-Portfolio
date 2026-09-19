`timescale 1ns/1ps

module UART_TX_tb;

    localparam DATA_WIDTH = 8;
    localparam CLK_PERIOD = 10;

    reg                   clk;
    reg                   rst_n;
    reg  [DATA_WIDTH-1:0] P_DATA;
    reg                   Data_Valid;
    reg                   PAR_EN;
    reg                   PAR_TYP;
    wire                  TX_OUT;
    wire                  busy;

    UART_TX #(.DATA_WIDTH(DATA_WIDTH)) dut (
        .clk        (clk),
        .rst_n      (rst_n),
        .P_DATA     (P_DATA),
        .Data_Valid (Data_Valid),
        .PAR_EN     (PAR_EN),
        .PAR_TYP    (PAR_TYP),
        .TX_OUT     (TX_OUT),
        .busy       (busy)
    );

    always #(CLK_PERIOD / 2) clk = ~clk;

    initial begin
        init_check();
        reset_check();

        // TEST 1: A5 Even Parity (par_en = 1, par_typ = 0)
        $display("\n///////////// TEST 1 : A5 Even Parity /////////////");
        write_valid(8'hA5, 1'b1, 1'b0);
        check_out(8'hA5, 1'b1, 1'b0);

        // TEST 2: A5 Odd Parity (par_en = 1, par_typ = 1)
        $display("\n///////////// TEST 2 : A5 ODD Parity /////////////");
        write_valid(8'hA5, 1'b1, 1'b1);
        check_out(8'hA5, 1'b1, 1'b1);

        // TEST 3: FF No Parity (par_en = 0, par_typ = 0)
        $display("\n///////////// TEST 3 : FF NO Parity /////////////");
        write_valid(8'hFF, 1'b0, 1'b0);
        check_out(8'hFF, 1'b0, 1'b0);

        // TEST 4: 00 No Parity (par_en = 0, par_typ = 0)
        $display("\n///////////// TEST 4 : 00 NO Parity /////////////");
        write_valid(8'h00, 1'b0, 1'b0);
        check_out(8'h00, 1'b0, 1'b0);

        // TEST 5: 55 Even Parity (par_en = 1, par_typ = 0)
        $display("\n///////////// TEST 5 : 55 Even Parity /////////////");
        write_valid(8'h55, 1'b1, 1'b0);
        check_out(8'h55, 1'b1, 1'b0);

        // TEST 6: AA Odd Parity (par_en = 1, par_typ = 1)
        $display("\n///////////// TEST 6 : AA ODD Parity /////////////");
        write_valid(8'hAA, 1'b1, 1'b1);
        check_out(8'hAA, 1'b1, 1'b1);

        $stop;
    end

    // Initialization
    task init_check;
        begin
            clk        = 1'b0;
            rst_n      = 1'b0;
            P_DATA     = {DATA_WIDTH{1'b0}};
            Data_Valid = 1'b0;
            PAR_EN     = 1'b0;
            PAR_TYP    = 1'b0;
            repeat (2) @(posedge clk);
            $display("  busy=%b TX_OUT=%b", busy, TX_OUT);
        end
    endtask

    // Reset sequence
    task reset_check;
        begin
            rst_n = 1'b0;
            repeat (2) @(posedge clk);
            rst_n = 1'b1;
            @(posedge clk);
            $display("  after rst_n: busy=%b TX_OUT=%b", busy, TX_OUT);
        end
    endtask

    // Drive inputs
    task write_valid(
        input [DATA_WIDTH-1:0] data,
        input par_en,
        input par_typ
    );
        begin
            @(posedge clk);
            P_DATA     = data;
            PAR_EN     = par_en;
            PAR_TYP    = par_typ;
            Data_Valid = 1'b1;
            @(posedge clk);
            Data_Valid = 1'b0;
        end
    endtask

    // Verify output stream
    integer i;
    task check_out(
        input [DATA_WIDTH-1:0] expected_out,
        input par_en,
        input par_typ
    );
        begin
            // 1. Check START bit
            @(negedge clk);
            if (!TX_OUT)
                $display(" PASS , START BIT = 0");
            else
                $display(" FAIL , START BIT = %b", TX_OUT);

            // 2. Check Data Bits (LSB first)
            for (i = 0; i < DATA_WIDTH; i = i + 1) begin
                @(negedge clk);
                if (TX_OUT == expected_out[i])
                    $display(" PASS ");
                else
                    $display(" FAIL , data bit %0d , expected %b , received %b", i, expected_out[i], TX_OUT);
            end

            // 3. Check Parity Bit
            if (par_en) begin
                @(negedge clk);
                if (par_typ) begin // Odd Parity
                    if (TX_OUT == ~(^expected_out))
                        $display(" PASS , Odd parity bit");
                    else
                        $display(" FAIL , Odd parity bit (expected %b, received %b)", ~(^expected_out), TX_OUT);
                end else begin     // Even Parity
                    if (TX_OUT == ^expected_out)
                        $display(" PASS , Even parity bit");
                    else
                        $display(" FAIL , Even parity bit (expected %b, received %b)", ^expected_out, TX_OUT);
                end
            end

            // 4. Check STOP bit
            @(negedge clk);
            if (TX_OUT)
                $display(" PASS , STOP BIT = 1");
            else
                $display(" FAIL , STOP BIT = 0");
        end
    endtask

endmodule