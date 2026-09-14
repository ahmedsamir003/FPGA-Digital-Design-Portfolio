module memory #(
  parameter AWIDTH = 5,
  parameter DWIDTH = 8
)(
  input   wire                clk,
  input   wire                wr,
  input   wire                rd,
  input   wire  [AWIDTH-1:0]  addr,
  inout   wire  [DWIDTH-1:0]  data
);
reg [DWIDTH-1:0]  MEM [31:0];
assign data = rd ? MEM[addr] : 'bz;

always@(posedge clk)
  begin
    if(wr && !rd)
      begin
        MEM[addr] <= data;
      end
  end
endmodule