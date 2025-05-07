module remove_even;
  int queue[$] = {1, 2, 3, 4, 5, 6, 7, 8}; // Example queue

  initial begin
    $display("Original Queue: %p", queue);

    // Remove even numbers
    for (int i = 0; i < queue.size(); ) begin
      if (queue[i] % 2 == 0)
        queue.delete(i); // delete element at index i (shifts rest left)
      else
        i++; // only increment if no deletion
    end

    $display("Queue after removing even numbers: %p", queue);
  end
endmodule
