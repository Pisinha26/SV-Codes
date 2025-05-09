module pll;
    logic clk = 0;
    
    property p_freq_chk_tol (int tolerance, realtime half_duty_cycle);
        realtime current_time;
        @(posedge clk) (1, current_time=$realtime) |-> 
        @(negedge clk) ($realtime-current_time) >= half_duty_cycle - (half_duty_cycle * tolerance)/100.0 && 
                       ($realtime-current_time) <= half_duty_cycle + (half_duty_cycle * tolerance)/100.0 ;
    endproperty : p_freq_chk_tol

    property p_freq_chk_to0 (int tolerance, realtime half_duty_cycle);
        realtime current_time;
        @(negedge clk) (1, current_time=$time) |-> 
        @(posedge clk) ($realtime-current_time) >= half_duty_cycle - (half_duty_cycle * tolerance)/100.0 && 
                         ($realtime-current_time) <= half_duty_cycle + (half_duty_cycle * tolerance)/100.0 ;
    endproperty : p_freq_chk_to0

    
    ap_freq_chk_tol : assert property (p_freq_chk_tol(5, 50ns));
    ap_freq_chk_to0 : assert property (p_freq_chk_to0(5, 50ns));
     
      always
        begin
        clk = 1'b1;  
        #20;
        clk = 1'b0;
        #80;
      end
     
      initial begin
        #50000 $finish;
      end
endmodule
