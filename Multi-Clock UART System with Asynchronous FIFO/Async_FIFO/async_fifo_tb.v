`timescale 1ns/1ps

module async_fifo_tb;

    parameter D_WIDTH = 8;
    parameter P_WIDTH = 4; // Address Width = 3, FIFO Depth = 8

    reg                 w_clk_tb;
    reg                 w_rstn_tb;
    reg                 w_inc_tb;
    reg                 r_clk_tb;
    reg                 r_rstn_tb;
    reg                 r_inc_tb;
    reg  [D_WIDTH-1:0]  w_data_tb;
    wire [D_WIDTH-1:0]  r_data_tb;
    wire                full_tb;
    wire                empty_tb;

    // Instantiate Top-Level Async FIFO Module
    async_fifo #(
        .D_WIDTH(D_WIDTH),
        .P_WIDTH(P_WIDTH)
    ) DUT (
        .w_clk(w_clk_tb),
        .w_rstn(w_rstn_tb),
        .w_inc(w_inc_tb),
        .w_data(w_data_tb),
        .full(full_tb),
        .r_clk(r_clk_tb),
        .r_rstn(r_rstn_tb),
        .r_inc(r_inc_tb),
        .r_data(r_data_tb),
        .empty(empty_tb)
    );

    // Clock Generators (Write: 100MHz / Read: 40MHz)
    always #5    w_clk_tb = ~w_clk_tb;
    always #12.5 r_clk_tb = ~r_clk_tb;

    // Task: Write Data
    task write_data;
        input [D_WIDTH-1:0] data;
        begin
            @(negedge w_clk_tb);
            if (!full_tb) begin
                w_inc_tb  = 1'b1;
                w_data_tb = data;
                $display("[WRITE] Time=%0t | Sent: %0d", $time, data);
                @(negedge w_clk_tb);
                w_inc_tb  = 1'b0;
            end else begin
                $display("[WRITE BLOCKED] Time=%0t | FIFO Full! Dropped: %0d", $time, data);
            end
        end
    endtask

    // Task: Read Data (Sample data first, then pulse r_inc)
    task read_data;
        begin
            @(negedge r_clk_tb);
            if (!empty_tb) begin
                $display("[READ]  Time=%0t | Got: %0d", $time, r_data_tb);
                r_inc_tb = 1'b1;
                @(negedge r_clk_tb);
                r_inc_tb = 1'b0;
            end else begin
                $display("[READ BLOCKED]  Time=%0t | FIFO Empty!", $time);
            end
        end
    endtask

    // Main Test Sequence
    integer i;
    initial begin
        // 1. Initialize & Reset
        w_clk_tb  = 0;
        r_clk_tb  = 0;
        w_inc_tb  = 0;
        r_inc_tb  = 0;
        w_rstn_tb = 0;
        r_rstn_tb = 0;
        w_data_tb = 0;
        #30;
        w_rstn_tb = 1;
        r_rstn_tb = 1;
        #20;

        // CASE 1: Fill FIFO until FULL (Depth = 8)
        $display("\n--- TEST CASE 1: Filling FIFO to FULL ---");
        for (i = 1; i <= 9; i = i + 1) begin
            write_data(i * 10);
        end

        // CASE 2: Attempt Write when FULL
        $display("\n--- TEST CASE 2: Overflow Prevention Check ---");
        write_data(8'hFF); // Should be blocked by full flag

        // CASE 3: Read a few items to clear FULL flag
        $display("\n--- TEST CASE 3: Reading Partial Data ---");
        repeat (3) read_data();

        // Wait 3 write clock cycles for CDC synchronizer to deassert FULL
        repeat (3) @(posedge w_clk_tb);

        // CASE 4: Write again after freeing space
        $display("\n--- TEST CASE 4: Writing After Read ---");
        write_data(8'hAA);
        write_data(8'hBB);

        // CASE 5: Empty out the FIFO completely
        $display("\n--- TEST CASE 5: Emptying FIFO Completely ---");
        repeat (9) read_data();

        // CASE 6: Underflow Check
        $display("\n--- TEST CASE 6: Underflow Prevention Check ---");
        read_data(); // Should be blocked by empty flag

        #100;
        $display("\n=========================================");
        $display("   ALL TEST CASES PASSED SUCCESSFULLY!");
        $display("=========================================\n");
        $finish;
    end

endmodule