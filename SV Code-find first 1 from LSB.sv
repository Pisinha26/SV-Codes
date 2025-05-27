module first_one_finder;
 logic [31:0] data;
  integer position;
  bit found;
  initial begin
   data = 32'b00000000_00000000_00000000_00101000; 
   found = 0;
   for (int i = 0; i < 32; i++) begin
         if (data[i] == 1'b1) begin
        position = i;
        found = 1;
        break;
      end
    end
  if (found)
      $display("First 1 from LSB is at position: %0d", position);
    else
      $display("No 1 found in the input data.");
  end
endmodule
