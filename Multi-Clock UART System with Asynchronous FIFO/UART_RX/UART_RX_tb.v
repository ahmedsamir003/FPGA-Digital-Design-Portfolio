`timescale 1ns/1ps

module UART_RX_tb ();
    reg CLK_tb;
    reg RST_tb;
    reg RX_IN_tb;
    reg PAR_EN_tb;
    reg PAR_TYP_tb;
    reg [5:0] Prescale_tb;

    wire Stop_Error_tb;
    wire data_valid_tb;
    wire Parity_Error_tb;
    wire [7:0] P_DATA_tb;

    reg valid_seen;

    // DUT Instantiation
    UART_RX DUT (
        .RX_IN(RX_IN_tb),
        .Prescale(Prescale_tb),
        .PAR_EN(PAR_EN_tb),
        .PAR_TYP(PAR_TYP_tb),
        .clk(CLK_tb),
        .rst_n(RST_tb),
        .Stop_Error(Stop_Error_tb),
        .Parity_Error(Parity_Error_tb),
        .data_valid(data_valid_tb),
        .P_DATA(P_DATA_tb)
    );

    // Fixed 100MHz clock generation (10ns period)
    initial CLK_tb = 1'b0;
    always #5 CLK_tb = ~CLK_tb;

    // Monitor data_valid assertions safely
    always @(posedge CLK_tb or negedge RST_tb) begin
        if (!RST_tb)
            valid_seen <= 1'b0;
        else if (data_valid_tb)
            valid_seen <= 1'b1;
    end

    // Initial Test Suite
    initial begin
        $display("==================================================");
        $display("   STARTING UART_RX TESTBENCH SIMULATION         ");
        $display("==================================================");

        initialize();
        reset();

        $display("\n---> TEST CASE 1: Prescale 8, No Parity");
        set_prescale(6'd8);
        PAR_EN_tb  = 1'b0;
        PAR_TYP_tb = 1'b0;
        valid_seen = 1'b0;
        send_frame(8'hAC);
        check_output(8'hAC, 1'b0, 1'b0);

        $display("\n---> TEST CASE 2: Prescale 16, No Parity");
        set_prescale(6'd16);
        PAR_EN_tb  = 1'b0;
        PAR_TYP_tb = 1'b0;
        valid_seen = 1'b0;
        send_frame(8'hAC);
        check_output(8'hAC, 1'b0, 1'b0);

        $display("\n---> TEST CASE 3: Prescale 32, No Parity");
        set_prescale(6'd32);
        PAR_EN_tb  = 1'b0;
        PAR_TYP_tb = 1'b0;
        valid_seen = 1'b0;
        send_frame(8'hAC);
        check_output(8'hAC, 1'b0, 1'b0);

        $display("\n---> TEST CASE 4: Prescale 16, Even Parity");
        set_prescale(6'd16);
        PAR_EN_tb  = 1'b1;
        PAR_TYP_tb = 1'b0;
        valid_seen = 1'b0;
        send_frame(8'hAC);
        check_output(8'hAC, 1'b0, 1'b0);

        $display("\n---> TEST CASE 5: Prescale 16, Odd Parity");
        set_prescale(6'd16);
        PAR_EN_tb  = 1'b1;
        PAR_TYP_tb = 1'b1;
        valid_seen = 1'b0;
        send_frame(8'hAC);
        check_output(8'hAC, 1'b0, 1'b0);

        $display("\n---> TEST CASE 6: Parity Error Detection");
        set_prescale(6'd8);
        PAR_EN_tb  = 1'b1;
        PAR_TYP_tb = 1'b0;
        valid_seen = 1'b0;
        send_frame_wrong_parity(8'b1010_1100);
        repeat(5) @(posedge CLK_tb);
        if (Parity_Error_tb)
            $display("PASS: Parity Error detected");
        else
            $display("FAIL: Parity Error was not detected");

        if (!valid_seen)
            $display("PASS: DATA_VALID not asserted on parity error");
        else
            $display("FAIL: DATA_VALID was asserted on parity error");

        $display("\n---> TEST CASE 7: Stop Error Detection");
        reset();
        set_prescale(6'd8);
        PAR_EN_tb  = 1'b0;
        PAR_TYP_tb = 1'b0;
        valid_seen = 1'b0;
        send_frame_wrong_stop(8'b1010_1100);
        repeat(5) @(posedge CLK_tb);
        if (Stop_Error_tb)
            $display("PASS: Stop Error detected");
        else
            $display("FAIL: Stop Error was not detected");

        $display("\n---> TEST CASE 8: Back-to-Back Frames");
        reset();
        set_prescale(6'd8);
        PAR_EN_tb  = 1'b0;
        PAR_TYP_tb = 1'b0;
        
        valid_seen = 1'b0;
        send_frame(8'b1010_1100);
        wait_for_valid();
        if (valid_seen && P_DATA_tb == 8'b1010_1100)
            $display("PASS: Frame 1 Received Correctly");
        else
            $display("FAIL: Frame 1 Failed");

        valid_seen = 1'b0;
        send_frame(8'b0101_0011);
        wait_for_valid();
        if (valid_seen && P_DATA_tb == 8'b0101_0011)
            $display("PASS: Frame 2 Received Correctly");
        else
            $display("FAIL: Frame 2 Failed");

        $display("\n---> TEST CASE 9: Reset Verification");
        set_prescale(6'd16);
        PAR_EN_tb  = 1'b0;
        PAR_TYP_tb = 1'b0;
        RX_IN_tb   = 1'b0;
        repeat(4) @(posedge CLK_tb);
        RST_tb     = 1'b0;
        #10;
        if (P_DATA_tb == 8'b0 && !data_valid_tb)
            $display("PASS: Reset cleared registers successfully");
        else
            $display("FAIL: Reset failed to clear registers");
        RST_tb   = 1'b1;
        RX_IN_tb = 1'b1;

        $display("\n---> TEST CASE 10: IDLE Line State");
        initialize();
        reset();
        set_prescale(6'd16);
        valid_seen = 1'b0;
        repeat(20) @(posedge CLK_tb);
        if (!valid_seen)
            $display("PASS: DATA_VALID stayed 0 during IDLE");
        else
            $display("FAIL: DATA_VALID falsely triggered during IDLE");

        $display("\n==================================================");
        $display("   SIMULATION COMPLETE - ALL TESTS EXECUTED      ");
        $display("==================================================");
        #100;
        $stop;
    end

    // Tasks Definition
    task initialize;
        begin
            CLK_tb      = 1'b0;
            RST_tb      = 1'b0;
            RX_IN_tb    = 1'b1;
            PAR_EN_tb   = 1'b0;
            PAR_TYP_tb  = 1'b0;
            valid_seen  = 1'b0;
            Prescale_tb = 6'd8;
        end
    endtask

    task reset;
        begin
            RST_tb = 1'b0;
            #20;
            RST_tb = 1'b1;
            #10;
        end
    endtask

    task set_prescale(input [5:0] Prescale_Value);
        begin
            Prescale_tb = Prescale_Value;
        end
    endtask

    task send_bit(input bit_value);
        begin
            RX_IN_tb = bit_value;
            repeat(Prescale_tb) @(posedge CLK_tb);
        end
    endtask

    task send_frame(input [7:0] data);
        integer i;
        begin
            send_bit(1'b0); // START
            for (i = 0; i < 8; i = i + 1)
                send_bit(data[i]); // DATA
            if (PAR_EN_tb) begin
                if (PAR_TYP_tb)
                    send_bit(~(^data));
                else
                    send_bit(^data);
            end
            send_bit(1'b1); // STOP
        end
    endtask

task send_frame_wrong_parity(input [7:0] data);
    integer i;
    begin
        send_bit(1'b0); // START
        for (i = 0; i < 8; i = i + 1)
            send_bit(data[i]); // DATA
            
        if (PAR_EN_tb) begin
            if (PAR_TYP_tb)
                send_bit(^data);   // Wrong for Odd
            else
                send_bit(~(^data)); // Wrong for Even
        end
        
        send_bit(1'b1); // STOP
    end
endtask

task send_frame_wrong_stop(input [7:0] data);
    integer i;
    begin
        send_bit(1'b0); // START
        for (i = 0; i < 8; i = i + 1)
            send_bit(data[i]); // DATA
            
        if (PAR_EN_tb) begin
            if (PAR_TYP_tb)
                send_bit(~(^data));
            else
                send_bit(^data);
        end
        
        send_bit(1'b0); 
    end
endtask

    task wait_for_valid;
        integer timeout;
        begin
            timeout = 0;
            while (!valid_seen && timeout < 100) begin
                @(posedge CLK_tb);
                timeout = timeout + 1;
            end
        end
    endtask

    task check_output(
        input [7:0] exp_out,
        input       exp_parity_error,
        input       exp_stop_error
    );
        begin
            wait_for_valid();

            if (valid_seen)
                $display("PASS: DATA_VALID asserted");
            else
                $display("FAIL: DATA_VALID missing");

            if (P_DATA_tb == exp_out)
                $display("PASS: P_DATA = %h", P_DATA_tb);
            else
                $display("FAIL: P_DATA = %h (Expected %h)", P_DATA_tb, exp_out);

            if (Parity_Error_tb == exp_parity_error)
                $display("PASS: Parity_Error = %b", Parity_Error_tb);
            else
                $display("FAIL: Parity_Error = %b (Expected %b)", Parity_Error_tb, exp_parity_error);

            if (Stop_Error_tb == exp_stop_error)
                $display("PASS: Stop_Error = %b", Stop_Error_tb);
            else
                $display("FAIL: Stop_Error = %b (Expected %b)", Stop_Error_tb, exp_stop_error);
        end
    endtask

endmodule