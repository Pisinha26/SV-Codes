module trycov_m;
    typedef enum int {NONE, ONE, MORE, ALL} num_type_e;
    
    class trycov;
        rand num_type_e which_enable[5];
        rand bit [15:0] enable[5];

        // Constraints 
        constraint enable_default_c {
          foreach (which_enable[i]) {
            (which_enable[i] == NONE)  -> (enable[i] == 'h0); 
            (which_enable[i] == ONE)   -> ($countones(enable[i]) == 1);
            (which_enable[i] == MORE)  -> (($countones(enable[i]) > 1) && ($countones(enable[i]) < 16));
            (which_enable[i] == ALL)   -> ($countones(enable[i]) == 16); 
          }
        }


        // coverage 
        covergroup cg_vat_type;
          cp_which_enable_0 : coverpoint which_enable[0] {
            bins none = {NONE};
            bins one = {ONE};
            bins more = {MORE};
            bins all = {ALL};
          }


          cp_enable_0 : coverpoint enable[0] {
            bins zero = {16'h0000} iff (which_enable[0] == NONE);
            
            bins bit_0 = {16'h0001} iff (which_enable[0] == ONE);
            bins bit_1 = {16'h0002} iff (which_enable[0] == ONE);
            bins bit_2 = {16'h0004} iff (which_enable[0] == ONE);
            bins bit_3 = {16'h0008} iff (which_enable[0] == ONE);
            bins bit_4 = {16'h0010} iff (which_enable[0] == ONE);
            bins bit_5 = {16'h0020} iff (which_enable[0] == ONE);
            bins bit_6 = {16'h0040} iff (which_enable[0] == ONE);
            bins bit_7 = {16'h0080} iff (which_enable[0] == ONE);
            bins bit_8 = {16'h0100} iff (which_enable[0] == ONE);
            bins bit_9 = {16'h0200} iff (which_enable[0] == ONE);
            bins bit_10 = {16'h0400} iff (which_enable[0] == ONE);
            bins bit_11 = {16'h0800} iff (which_enable[0] == ONE);
            bins bit_12 = {16'h1000} iff (which_enable[0] == ONE);
            bins bit_13 = {16'h2000} iff (which_enable[0] == ONE);
            bins bit_14 = {16'h4000} iff (which_enable[0] == ONE);
            bins bit_15 = {16'h8000} iff (which_enable[0] == ONE);

            bins bits_set_2 = {[16'h0000:16'hFFFF]} with ($countones(item) == 2) iff (which_enable[0] == MORE);
            bins bits_set_3 = {[16'h0000:16'hFFFF]} with ($countones(item) == 3) iff (which_enable[0] == MORE);
            bins bits_set_4 = {[16'h0000:16'hFFFF]} with ($countones(item) == 4) iff (which_enable[0] == MORE);
            bins bits_set_5 = {[16'h0000:16'hFFFF]} with ($countones(item) == 5) iff (which_enable[0] == MORE);
            bins bits_set_6 = {[16'h0000:16'hFFFF]} with ($countones(item) == 6) iff (which_enable[0] == MORE);
            bins bits_set_7 = {[16'h0000:16'hFFFF]} with ($countones(item) == 7) iff (which_enable[0] == MORE);
            bins bits_set_8 = {[16'h0000:16'hFFFF]} with ($countones(item) == 8) iff (which_enable[0] == MORE);
            bins bits_set_9 = {[16'h0000:16'hFFFF]} with ($countones(item) == 9) iff (which_enable[0] == MORE);
            bins bits_set_10 = {[16'h0000:16'hFFFF]} with ($countones(item) == 10) iff (which_enable[0] == MORE);
            bins bits_set_11 = {[16'h0000:16'hFFFF]} with ($countones(item) == 11) iff (which_enable[0] == MORE);
            bins bits_set_12 = {[16'h0000:16'hFFFF]} with ($countones(item) == 12) iff (which_enable[0] == MORE);
            bins bits_set_13 = {[16'h0000:16'hFFFF]} with ($countones(item) == 13) iff (which_enable[0] == MORE);
            bins bits_set_14 = {[16'h0000:16'hFFFF]} with ($countones(item) == 14) iff (which_enable[0] == MORE);
            bins bits_set_15 = {[16'h0000:16'hFFFF]} with ($countones(item) == 15) iff (which_enable[0] == MORE);

            bins all_bits = {16'hFFFF} iff (which_enable[0] == ALL);
          }
        
          crs_which_enable_0_enable_0_0 : cross cp_which_enable_0, cp_enable_0 {
            // Ignore combinations where which_enable[0] is NONE but enable[0] is not zero.
            
            // ignore_bins invalid_none = binsof(which_enable[0].none) && (enable[0] != 16'h0);
            
            // ignore_bins invalid_none = binsof(cp_which_enable_0) intersect {NONE} && binsof (cp_enable_0) intersect {cp_enable_0.bit_0, cp_enable_0.bit_1, cp_enable_0.bit_2, cp_enable_0.bit_3};
            
            // ignore_bins invalid_none = binsof(cp_which_enable_0) intersect {NONE} && binsof ({cp_enable_0.bit_0; cp_enable_0.bit_1});
          }
        endgroup
   
        function new();
            cg_vat_type = new();
        endfunction: new

        function void post_randomize();
            cg_vat_type.sample();
        endfunction: post_randomize
    endclass: trycov

    initial begin 
        trycov tc;
        tc = new();

        repeat (100) begin 
            assert(tc.randomize());
            $display("%p", tc);
        end 
    end 
endmodule: trycov_m
