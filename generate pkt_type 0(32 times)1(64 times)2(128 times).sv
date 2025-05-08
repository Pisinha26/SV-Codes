class packet;
  rand bit [1:0] packet_type[]; // Dynamic array for shuffle

  constraint c_packet_distribution {
    packet_type.size() == 256; // Allocate memory dynamically
    foreach(packet_type[i]) {

      packet_type.sum() with (int'(item==0) == 32);
      packet_type.sum() with (int'(item==1) == 64);
      packet_type.sum() with (int'(item==2) == 128);
      
    }
  }

endclass

module test;
  int count_0, count_1, count_2, count_3;
  packet pkt;

  initial begin
    pkt = new();
    pkt.randomize();

    foreach(pkt.packet_type[i]) begin
      case (pkt.packet_type[i])
        0: count_0++;
        1: count_1++;
        2: count_2++;
        3: count_3++;
      endcase
    end

    $display("count_0=%0d, count_1=%0d, count_2=%0d, count_3=%0d",
             count_0, count_1, count_2, count_3);
  end
endmodule
