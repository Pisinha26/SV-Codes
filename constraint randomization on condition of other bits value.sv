/*
Var[31:24] should lie in between 10 and 250. 
If the randomized value of var[31:24] is 210 then var1[23:16] should lie in between 200 and 220 else it should lie between 100 and 150. 
If the randomized value of var[23:16] is in between 110 to 125 then var[15:8] should be between 0 and 50.
and var[7:0] should be always var[15:8] + 50
*/

class cons;
  rand int var1;
  
  constraint conss{
    var1[31:24]  inside{[10:250]} ;
    var1[23:16]inside{[100:150]} ;
    (var1[31:24]==210) -> var1[23:16]inside{[200:220]}  ;
    (var1[23:16]inside{[110:125]} )  -> var1[15:8] inside {[0:50]}  ;
  } 
  
  function void post_randomize() ;    
    var1[7:0]=(var1[15:8])+50;
  endfunction 
endclass


module tb;
  cons h_c=new;
  initial begin
    h_c.randomize();
    $display("variable=%b",h_c.var1);
    $display("variable=%d",h_c.var1[31:24]);
    $display("variable=%d",h_c.var1[23:16]);
    $display("variable=%d",h_c.var1[15:8]);
    $display("variable=%d",h_c.var1[7:0]);
  end
endmodule
