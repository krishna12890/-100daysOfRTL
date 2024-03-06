// Code your testbench here
// or browse Examples
module tb;
  
    logic      clk;
	logic      reset;
    logic      d_i;         // D input to the flop

    logic      q_norst_o;   // Q output from non-resettable flop
    logic      q_syncrst_o; // Q output from flop using synchronous reset
    logic      q_asyncrst_o; // Q output from flop using asynchrnoous reset
    
    parameter int clk_period=8;
  
  d_flip_flop dut 
  (
    .clk(clk),
    .reset(reset),
    .d_i(d_i),
    .q_norst_o(q_norst_o),
    .q_syncrst_o(q_syncrst_o),
    .q_asyncrst_o(q_asyncrst_o)
  );
  
  
  always #(0.5*clk_period) clk = ~clk;
  
  always #(0.6*clk_period) d_i = ~d_i; 
  
  initial
    begin
      clk = 1'b0;
      reset = 1'b1;
      #(0.2*clk_period)
      reset = 1'b0;
      #(0.2*clk_period)
      reset = 1'b1;
      #(38)
      reset = 1'b0;
      #(0.2*clk_period)
      reset = 1'b1;
    end

  initial
  begin
    d_i=1'b0;
  end
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
      #100
      $finish;
    end
  
  
endmodule