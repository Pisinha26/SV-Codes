module top;
  class abc;
    rand bit[3:0]index;
    rand bit[15:0]data;
    constraint c1 {index < 15;
                   data == (3<<index);
                  }
  endclass
  initial begin
    abc h;
    h=new();
    repeat(20) begin
      h.randomize();
      $display("data =%b",h.data);
    end
  end
endmodule
    
