//To find the second largest number
 
module second_largest_finder;
 int arr[] = '{23, 45, 12, 78, 34, 56};
  int first, second;
  int i;
 
  initial begin
    if (arr.size() < 2) begin
      $display("Not enough elements to find second largest.");
      return;
    end
 
    // Initialize first and second with first two elements
    if (arr[0] > arr[1]) begin
      first  = arr[0];
      second = arr[1];
    end else begin
      first  = arr[1];
      second = arr[0];
    end
 
    // Start from index 2
    for (i = 2; i < arr.size(); i++) begin
      if (arr[i] > first) begin
        second = first;
        first = arr[i];
      end else if (arr[i] > second && arr[i] != first) begin
        second = arr[i];
      end
    end
 
    if (first == second)
      $display("No distinct second largest number found.");
    else
      $display("Second largest number is: %0d", second);
  end
 
endmodule
