module memory_test;

  localparam integer AWIDTH = 5;
  localparam integer DWIDTH = 8;

  reg                 clk;
  reg                 wr;
  reg                 rd;
  reg  [AWIDTH-1:0]   addr;
  wire [DWIDTH-1:0]   data;
  reg  [DWIDTH-1:0]   rdata;

  assign data = rdata;

  memory #(
    .AWIDTH ( AWIDTH ),
    .DWIDTH ( DWIDTH ) 
  ) memory_inst (
    .clk  ( clk  ),
    .wr   ( wr   ),
    .rd   ( rd   ),
    .addr ( addr ),
    .data ( data ) 
  );

  task write_mem;
    input [AWIDTH-1:0] w_addr;
    input [DWIDTH-1:0] w_data;
    begin
      $display("Writing addr=%b data=%b", w_addr, w_data);
      wr    = 1'b1;
      rd    = 1'b0;
      addr  = w_addr;
      rdata = w_data;
      @(negedge clk);
    end
  endtask

  task read_mem;
    input [AWIDTH-1:0] r_addr;
    input [DWIDTH-1:0] exp_data;
    begin
      $display("Reading addr=%b data=%b", r_addr, exp_data);
      wr    = 1'b0;
      rd    = 1'b1;
      addr  = r_addr;
      rdata = 'bz;
      @(negedge clk);
      
      if (data !== exp_data) begin
        $display("TEST FAILED: At time %0d addr=%b data=%b, expected %b", $time, addr, data, exp_data);
        $finish;
      end else begin 
        $display("At time %0d addr=%b data=%b", $time, addr, data);
      end
    end
  endtask

  initial repeat (67) begin #5 clk=1; #5 clk=0; end

  integer i;
  
  initial 
  @(negedge clk) begin

    write_mem('d0,  8'hFF);
    write_mem('d31, 8'h00);

    read_mem('d0,  8'hFF);
    read_mem('d31, 8'h00);

    $display("Writing ascending data to descending addresses");
    for (i = (1<<AWIDTH)-1; i > 0; i = i - 1) begin
      write_mem(i, ((1<<AWIDTH)-1) - i);
    end

    $display("Reading ascending data from descending addresses");
    for (i = (1<<AWIDTH)-1; i > 0; i = i - 1) begin
      read_mem(i, ((1<<AWIDTH)-1) - i);
    end

    $display("TEST PASSED");
    $stop;
  end

endmodule