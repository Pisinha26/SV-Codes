module counter (output logic[2:0] count_out, // counter output
                input  logic[2:0] data_in, // data to load 
                input  logic ld_enb, count_enb, rst_n, clk);
    timeunit 1ns; timeprecision 100ps;
    logic [2:0]  count;
    logic                      tc;
    assign count_out                   =count;
    assign tc                          = count==3'b111;

    default clocking @(negedge clk); endclocking
    always @ (posedge clk or negedge rst_n) 
    begin 
        if (!rst_n)         count <= 0;           
        else if (ld_enb)    count <= data_in; 
        else if (count_enb) count <= count_out + 1; 
    end                         
endmodule // counter

module counter_props (
  input logic[2:0] count_out,  //  counter output    
  input  logic ld_enb, rst_n, 					               
  input  logic [2:0] count,        // internal design signal
  input  logic tc,                  // internal design signal
  input  logic clk
  );
   timeunit 1ns;   timeprecision 100ps;

   property p_tc;
    disable iff (!rst_n)
         (count)==3'b111 |-> tc; 
   endproperty : p_tc
   ap_tc : assert property(@ (posedge clk) p_tc) else
     $display ("0t error in terminal count", $time); 

   ap_counter : assert property( @ (posedge clk) tc |-> ##8 tc);
  default clocking @(negedge clk); endclocking
 endmodule : counter_props

module counter_tb;
  timeunit 1ns;   timeprecision 1ns;
    logic  ld_enb=0; 
    logic [2:0]  data_in; 
    wire  [2:0]  count_out; 
    logic  count_enb=0; 
    logic  clk=0; 
    logic  rst_n=1;
    initial forever #10 clk=!clk; 
   
  counter  
   DUT  ( 
       .ld_enb (ld_enb ) ,
      .data_in (data_in ) ,
      .count_out (count_out ) ,
      .count_enb (count_enb ) ,
      .clk (clk ) ,
      .rst_n (rst_n ) );

  bind counter counter_props counter_props_1(
          .count_out(count),
          .ld_enb(ld_enb),
          .rst_n(rst_n), 	
          .count(count), 										 
          .clk(clk), 
          .tc(tc));
  
  default clocking @(negedge clk); endclocking
  initial begin
        ##1;
	data_in   <= 8'hF0;
	ld_enb 	  <= 1;
	count_enb <= 1'b1;
	##1;
	ld_enb <= 1'b0;
	end 

endmodule : counter_tb
