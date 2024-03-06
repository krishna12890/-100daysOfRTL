// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module tb;
  
  reg [7:0]    a_i;   // First leg of the mux
  reg [7:0]    b_i;   // Second leg of the mux
  reg          sel_i; // Mux select
  wire [7:0]    y_o;   // Mux output
  
  
  localparam int clk_period = 2; 
 
  two_one_mux dut
  (
    .a_i(a_i),
    .b_i(b_i),
    .sel_i(sel_i),
    .y_o(y_o)
  );
  
  initial
  begin
    a_i = 7'd32;
    b_i = 7'd64;
    sel_i = 1'b0;
    #3
    sel_i = 1'b1;
  end
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
      #100
      $finish;
    end
  initial
    begin
      $monitor("%d,%d,%d",a_i,b_i,sel_i,y_o);
    end
  
endmodule