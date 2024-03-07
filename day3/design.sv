// Code your design here
module edge_detector
  (
	input     wire    clk,
	input     wire    reset,

	input     wire    a_i,            // Serial input to the module

	output    wire    rising_edge_o,  // Rising edge output
	output    wire    falling_edge_o  // Falling edge output    
  );
  
  reg a_prev;
  
  always@(posedge clk or negedge reset)
    begin
      if(~reset)
        begin
          a_prev <= 1'b0;
        end
      
      else
      begin
        a_prev <= a_i;
      end
      
    end
  
  assign falling_edge_o = a_prev & ~a_i;
  assign rising_edge_o = ~a_prev & a_i; 
  
endmodule