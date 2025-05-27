/*Randomize an array such that it should have 10 locations and foreach randomization the sum of array elements have to doubled except for first randomization? */

class randd;
  rand int unsigned arr [];
  longint unsigned sum=0;
  static int unsigned prev_sum=0;
  
    constraint cons{ arr.size()==10 ;
                    foreach (arr[i]) arr[i] inside {[0:2000]}; //---to avoid overflow
                 
                  	if(prev_sum!=0){
                    	arr.sum()==prev_sum*2;
                  	}
                  	else {
                      arr.sum() inside {[1:500]}; //---initial sum
                  	}    
                 }
  function void post_randomize();
   sum=arr.sum();
   prev_sum=sum;
  endfunction
    function void print();
    $display("Array: %p, Sum: %0d", arr, sum);
  endfunction
  endclass
                  
module tb;
  randd hr=new();
  initial begin
    repeat(5)begin
if(!hr.randomize())begin
      		$display("Randomization failed.");
      		break;
    	end
    	else
    	hr.print(); 
    end
    end
  endmodule
