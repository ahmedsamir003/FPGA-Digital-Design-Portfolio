module Seq_Det_tb;
    reg clk, rst_n, seq_in;
    wire seq_correct_NO_moore, seq_correct_O_moore, seq_correct_NO_mealy,seq_correct_O_mealy;

    N_O_Moore dutnomoore (
        .clk(clk),
        .rst_n(rst_n),
        .seq_in(seq_in),
        .seq_correct(seq_correct_NO_moore)
    );

    O_Moore dutomoore (
        .clk(clk),
        .rst_n(rst_n),
        .seq_in(seq_in),
        .seq_correct(seq_correct_O_moore)
    );

    N_O_Mealy dutnomealy (
        .clk(clk),
        .rst_n(rst_n),
        .seq_in(seq_in),
        .seq_correct(seq_correct_NO_mealy)
    );

    O_Mealy dutomealy (
        .clk(clk),
        .rst_n(rst_n),
        .seq_in(seq_in),
        .seq_correct(seq_correct_O_mealy)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        rst_n = 0;
        seq_in = 0;

        @(negedge clk);

        rst_n = 1;

        @(negedge clk);

        seq_in = 1;
        @(negedge clk);
        @(negedge clk);

        seq_in = 0;

        @(negedge clk);

        seq_in = 1;

        @(negedge clk);

        seq_in = 0;

        @(negedge clk);

        seq_in = 1;

        @(negedge clk);

        seq_in = 1;

        @(negedge clk);
        
        seq_in = 0;

        @(negedge clk);

        seq_in = 1;

        @(negedge clk);

        seq_in = 0;

        @(negedge clk);

        seq_in = 1;

        @(negedge clk);


        $finish;

    end
    
endmodule