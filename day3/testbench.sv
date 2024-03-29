// Simple edge detector TB

module day3_tb ();

  logic    clk;
  logic    reset;

  logic    a_i;

  logic    rising_edge_o;
  logic    falling_edge_o;

  edge_detector dut (.*);

  // clk
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end
  
  initial
  begin
    rising_edge_o <= 1'b0;
    falling_edge_o <= 1'b0;
  end

  // Stimulus
  initial begin
    reset <= 1'b0;
    a_i <= 1'b1;
    @(posedge clk);
    reset <= 1'b1;
    @(posedge clk);
    for (int i=0; i<32; i++) begin
      a_i <= $random%2;
      @(posedge clk);
    end
    $finish();
  end

  // Dump VCD
  initial begin
    $dumpfile("day3.vcd");
    $dumpvars(0, day3_tb);
  end

endmodule