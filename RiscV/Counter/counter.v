module counter #(
  parameter WIDTH = 5
)(
  input  wire                  clk,
  input  wire                  rst,
  input  wire                  enab,
  input  wire                  load,
  input  wire    [WIDTH-1:0]   cnt_in,
  output reg     [WIDTH-1:0]   cnt_out
);

function  [WIDTH-1:0] next_count;
  input     [WIDTH-1:0] current_value;
  begin
    next_count = current_value + 1'b1;
  end
endfunction

always@(posedge clk)
  begin
    if(rst)
      begin
        cnt_out <= {WIDTH{1'b0}};
      end
    else if(load)
      begin
        cnt_out <= cnt_in;
      end
    else if(enab)
      begin
        cnt_out <= next_count(cnt_out);
      end
  end
endmodule