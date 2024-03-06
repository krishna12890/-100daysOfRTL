// Code your design here
module d_flip_flop
  (
    input     logic      clk,
	input     logic      reset,
    input     logic      d_i,         // D input to the flop

    output    logic      q_norst_o,   // Q output from non-resettable flop
    output    logic      q_syncrst_o, // Q output from flop using synchronous reset
    output    logic      q_asyncrst_o // Q output from flop using asynchrnoous reset
  );
  
  

  assign q_norst_o = d_i;
  
  always@(posedge clk or negedge reset)
    begin
      if(~reset)
      	begin
        	q_asyncrst_o <= 1'b0;
      	end
      else
      	begin
        	q_asyncrst_o <= d_i;
      	end
     end
  
  always@(posedge clk)
    begin 
      if(~reset)
      begin
       q_syncrst_o <= 1'b0;
      end
      
  	  else
      begin
        q_syncrst_o <= d_i;
      end
    end
      
endmodule