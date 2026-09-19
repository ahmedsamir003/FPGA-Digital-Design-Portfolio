`timescale 1ns/1ps

module system_top_tb #(
    parameter DATA_WIDTH   = 8,
    parameter FIFO_P_WIDTH = 4
);

    // Transmitter Clock & Reset Domain
    reg                     tx_clk;
    reg                     tx_rstn;

    // Receiver Clock & Reset Domain
    reg                     rx_clk;
    reg                     rx_rstn;

    // UART RX Interface
    reg                     rx_in;
    reg                     rx_par_en;
    reg                     rx_par_typ;
    reg [5:0]               rx_prescale;
    wire                    rx_stop_error;
    wire                    rx_parity_error;

    // UART TX Interface
    reg                     tx_par_en;
    reg                     tx_par_typ;
    wire                    tx_out;
    wire                    tx_busy;

    // FIFO Interface Controls
    reg                     fifo_rd_inc;
    reg                     tx_data_valid;
    wire                    fifo_full;
    wire                    fifo_empty;
    wire [DATA_WIDTH-1:0]   fifo_rd_data;

    // Verification Variables
    reg [DATA_WIDTH-1:0]    captured_byte;
    integer                 test_count  = 0;
    integer                 error_count = 0;

    // -------------------------------------------------------------------------
    // System Top Instance ( RX_Domain ---> FIFO ---> CDC ---> TX_Domain)
    // -------------------------------------------------------------------------
    system_top #(
        .DATA_WIDTH   (DATA_WIDTH),
        .FIFO_P_WIDTH (FIFO_P_WIDTH)
    ) DUT (
        // Transmitter Clock & Reset Domain
        .tx_clk          (tx_clk),
        .tx_rstn         (tx_rstn),

        // Receiver Clock & Reset Domain
        .rx_clk          (rx_clk),
        .rx_rstn         (rx_rstn),

        // UART RX Interface
        .rx_in           (rx_in),
        .rx_par_en       (rx_par_en),
        .rx_par_typ      (rx_par_typ),
        .rx_prescale     (rx_prescale),
        .rx_stop_error   (rx_stop_error),
        .rx_parity_error (rx_parity_error),
        
        // UART TX Interface
        .tx_par_en       (tx_par_en),
        .tx_par_typ      (tx_par_typ),
        .tx_out          (tx_out),
        .tx_busy         (tx_busy),

        // FIFO Interface Controls
        .fifo_rd_inc     (fifo_rd_inc),
        .tx_data_valid   (tx_data_valid),
        .fifo_full       (fifo_full),
        .fifo_empty      (fifo_empty),
        .fifo_rd_data    (fifo_rd_data)
    );

    // -------------------------------------------------------------------------
    // RX_Clock Domain & TX_Clock Domain Definition
    // -------------------------------------------------------------------------
    always #4340.278 tx_clk = ~tx_clk;
    always #542.535  rx_clk = ~rx_clk;

    // -------------------------------------------------------------------------
    // FIFO Read Controller Logic
    // -------------------------------------------------------------------------
    always @(posedge tx_clk or negedge tx_rstn) begin
        if (!tx_rstn) begin
            fifo_rd_inc   <= 1'b0;
            tx_data_valid <= 1'b0;
        end else begin
            if (!fifo_empty && !tx_busy && !tx_data_valid && !fifo_rd_inc) begin
                tx_data_valid <= 1'b1; // Trigger UART_TX latching mem[0]
                fifo_rd_inc   <= 1'b0; 
            end else if (tx_data_valid) begin
                tx_data_valid <= 1'b0;
                fifo_rd_inc   <= 1'b1; // Advance read pointer to next word
            end else begin
                tx_data_valid <= 1'b0;
                fifo_rd_inc   <= 1'b0;
            end
        end
    end

    // -------------------------------------------------------------------------
    ///////////////////////////// Helper Tasks /////////////////////////////////
    // -------------------------------------------------------------------------

    //////////////////////////// Initialize ////////////////////////////////
    task initialize();
        begin
            tx_clk        = 1'b0;
            rx_clk        = 1'b0;
            tx_rstn       = 1'b0;
            rx_rstn       = 1'b0;
            rx_in         = 1'b1;
            rx_par_en     = 1'b0;
            rx_par_typ    = 1'b0;
            rx_prescale   = 6'd8;
            tx_par_en     = 1'b0;
            tx_par_typ    = 1'b0;
            fifo_rd_inc   = 1'b0;
            tx_data_valid = 1'b0;
        end
    endtask

    /////////////////////////////// Reset //////////////////////////////////
    task reset();
        begin
            tx_rstn = 1'b1;
            rx_rstn = 1'b1;
            #100;
            tx_rstn = 1'b0;
            rx_rstn = 1'b0;
            #100;
            tx_rstn = 1'b1;
            rx_rstn = 1'b1;
        end
    endtask

    //////////////////////////// UART_Send ////////////////////////////////
    task UART_Send(
        input [DATA_WIDTH-1:0] data_in,
        input [5:0]            samples,
        input                  parity_enable,
        input                  parity_type
    );
        integer i;
        reg parity_bit;
        real bit_period;
        begin
            rx_prescale = samples;
            
            // Sync RX and TX Parity Configurations
            rx_par_en   = parity_enable;
            tx_par_en   = parity_enable;
            rx_par_typ  = parity_type;
            tx_par_typ  = parity_type;

            // Select bit duration based on prescale factor
            case (samples)
                6'd8:    bit_period = 8680.556;
                6'd16:   bit_period = 17361.112;
                6'd32:   bit_period = 34722.224;
                default: bit_period = 8680.556;
            endcase

            // Idle state
            rx_in = 1'b1;
            #(bit_period);

            // Start bit
            rx_in = 1'b0;
            #(bit_period);

            // Data bits (LSB first)
            for (i = 0; i < DATA_WIDTH; i = i + 1) begin
                rx_in = data_in[i];
                #(bit_period);
            end

            // Parity bit calculation (Even: ~(^data), Odd: ^data)
            if (parity_enable) begin
                parity_bit = parity_type ? ~(^data_in) : (^data_in);
                rx_in = parity_bit;
                #(bit_period);
            end

            // Stop bit
            rx_in = 1'b1;
            #(bit_period);
        end
    endtask

    //////////////////////////// UART_Receive ////////////////////////////////
task UART_Receive(
    input [DATA_WIDTH-1:0] exp_data
);
    integer k;
    reg captured_parity;
    reg expected_parity;
    begin
        // 1. Wait for Start Bit
        @(negedge tx_out);
        
        // 2. Wait half period to align sampling to center of start bit
        #4340.278;

        // 3. Sample 8 Data Bits
        for (k = 0; k < DATA_WIDTH; k = k + 1) begin
            #8680.556;
            captured_byte[k] = tx_out;
        end

        // 4. Sample and Check Parity Bit (if enabled on TX)
        if (tx_par_en) begin
            #8680.556;
            captured_parity = tx_out;
            
            // Calculate expected parity (Even = ~(^data), Odd = ^data)
            expected_parity = tx_par_typ ? ~(^exp_data) : (^exp_data);

            if (captured_parity !== expected_parity) begin
                $display("[FAIL Parity] Test %0d: Expected Parity %0b, Got %0b", 
                         test_count + 1, expected_parity, captured_parity);
            end
        end

        // 5. Wait for Stop Bit
        #8680.556;

        // 6. Compare captured data with expected data
        test_count = test_count + 1;
        if (captured_byte === exp_data) begin
            $display("[PASS] Test %0d: Transmitted 0x%0h successfully matched 0x%0h", 
                     test_count, captured_byte, exp_data);
        end else begin
            $display("[FAIL] Test %0d: Expected 0x%0h, but Captured 0x%0h", 
                     test_count, exp_data, captured_byte);
            error_count = error_count + 1;
        end
    end
endtask

    /////////////////////// Parity Error Fault Injection ///////////////////////////
    task parity_error(
        input [DATA_WIDTH-1:0] data_in
    );
        integer i;
        real bit_period;
        begin
            $display("[TB] Inserting intentional Parity Error...");
            test_count  = test_count + 1;
            bit_period  = 8680.556;
            rx_prescale = 6'd8;
            rx_par_en   = 1'b1;
            rx_par_typ  = 1'b1; // Expects Even Parity

            // Start bit
            rx_in = 1'b0; 
            #(bit_period);

            // Data payload
            for (i = 0; i < DATA_WIDTH; i = i + 1) begin
                rx_in = data_in[i]; 
                #(bit_period);
            end

            // INSERTING WRONG PARITY: Force Odd parity when Even is expected
            rx_in = ^data_in; 
            #(bit_period);

            // Stop bit
            rx_in = 1'b1; 
            #(bit_period);

            #1000;
            if (rx_parity_error === 1'b1)
                $display("[PASS] Test %0d: rx_parity_error successfully caught intentional parity fault!", test_count);
            else begin
                $display("[FAIL] Test %0d: rx_parity_error failed to detect corrupted parity bit!", test_count);
                error_count = error_count + 1;
            end
        end
    endtask

    // -------------------------------------------------------------------------
    ///////////////////////////// Initial Block ////////////////////////////////
    // -------------------------------------------------------------------------
    initial begin
        initialize();
        reset();
        #1000;

        $display("\n==================================================");
        $display("   STARTING AUTOMATED LOOPBACK VERIFICATION       ");
        $display("==================================================\n");

        // 1. Basic Prescale Sweeps (8, 16, 32)
        $display("--- 1. Prescale Sweeps ---");
        fork
            UART_Send(8'hA5, 6'd8, 1'b0, 1'b0);
            UART_Receive(8'hA5);
        join
        #20000;

        fork
            UART_Send(8'h3C, 6'd16, 1'b0, 1'b0);
            UART_Receive(8'h3C);
        join
        #20000;

        fork
            UART_Send(8'hF0, 6'd32, 1'b0, 1'b0);
            UART_Receive(8'hF0);
        join
        #20000;

        // 2. Parity Checks (Even & Odd)
        $display("\n--- 2. Parity Hardware Checks ---");
        
        // Even Parity Test
        fork
            UART_Send(8'h55, 6'd8, 1'b1, 1'b1);
            UART_Receive(8'h55);
        join
        #20000;

        // Odd Parity Test
        fork
            UART_Send(8'hAA, 6'd8, 1'b1, 1'b0);
            UART_Receive(8'hAA);
        join
        #20000;

        // 3. Parity Error Fault Injection
        $display("\n--- 3. Parity Error Injection ---");
        parity_error(8'hA5);
        #20000;

        // 4. Back-to-Back Burst Stream
        $display("\n--- 4. Back-to-Back Burst Stream ---");
        fork
            begin
                UART_Send(8'h11, 6'd8, 1'b0, 1'b0);
                UART_Send(8'h22, 6'd8, 1'b0, 1'b0);
                UART_Send(8'h33, 6'd8, 1'b0, 1'b0);
            end
            begin
                UART_Receive(8'h11);
                UART_Receive(8'h22);
                UART_Receive(8'h33);
            end
        join
        #50000;

        // Final Verification Summary
        $display("\n==================================================");
        $display("               TEST SUMMARY REPORT                ");
        $display("  Total Tests Executed : %0d", test_count);
        $display("  Total Errors Found   : %0d", error_count);
        if (error_count == 0)
            $display("  VERIFICATION STATUS  : ALL PASSED");
        else
            $display("  VERIFICATION STATUS  : FAILED");
        $display("==================================================\n");

        $stop;
    end

endmodule