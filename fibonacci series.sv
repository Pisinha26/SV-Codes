module fibonacci;
  int n = 10;            // Number of terms
  int fib[$];            // Queue to store Fibonacci series
  int a = 0, b = 1, next;

  initial begin
    $display("Fibonacci Series for %0d terms:", n);
    
    // Generate Fibonacci terms
    for (int i = 0; i < n; i++) begin
      fib.push_back(a);
      next = a + b;
      a = b;
      b = next;
    end

    $display("%p", fib);
  end
endmodule
