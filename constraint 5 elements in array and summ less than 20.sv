class ArraySumConstraint;
  rand int arr[5];
  
  constraint val_range {
    foreach (arr[i]) arr[i] inside {[0:10]}; // Set reasonable range
  }

  constraint sum_limit {
    (arr.sum() < 20);
  }

  function void display();
    int total = 0;
    $display("Array elements:");
    foreach (arr[i]) begin
      $display("arr[%0d] = %0d", i, arr[i]);
      total += arr[i];
    end
    $display("Sum = %0d", total);
  end
endclass

module test;
  initial begin
    ArraySumConstraint obj = new();
    if (obj.randomize()) begin
      obj.display();
    end else begin
      $display("Randomization failed.");
    end
  end
endmodule


//////////////////////////2nd way to write this code///////////////////////////////////////////
  class test;
    rand int a[]; // Use 'int' instead of 'bit[5:0]'because bit[5:0] makes it packed array but sum function works on int and integer

  constraint c1 { a.size() == 5; }
  constraint c2 { a.sum() < 20; }
  constraint c3 { foreach (a[i]) a[i] inside {[0:7]}; } 
endclass

module top;
  initial begin
    test t = new();
    if (t.randomize()) begin
      $display("Array = %p", t.a);
      $display("Sum = %0d", t.a.sum());
    end else begin
      $display("Randomization failed.");
    end
  end
endmodule
