class ArrayRandomizer;
  rand int arr[];        // Declare a dynamic array as random
  int unique_queue[$];   // Will store array without duplicates
  int seen[int];         // Associative array to track already seen values

  // Constraint: Size and element range
  constraint arr_size_c {
    arr.size() inside {[5:10]};          
  }
  constraint val_range_c {
    foreach (arr[i]) arr[i] inside {[0:9]}; 
  }

  // Method to remove duplicates
  function void remove_duplicates();
    seen.delete();
    unique_queue.delete();
//If a value hasn't been seen before: Add it to the seen set and Add it to unique_queue
    foreach (arr[i]) begin                 
      if (!seen.exists(arr[i])) begin
        seen[arr[i]] = 1;
        unique_queue.push_back(arr[i]);
      end
    end
  endfunction
endclass


module test;
  ArrayRandomizer obj = new();
initial begin
    repeat (3) begin
      assert(obj.randomize());
      $display("Random array:%p", obj.arr);
      obj.remove_duplicates();
      $display("After removing dups:%p\n", obj.unique_queue);
    end
  end
endmodule
