class constraint_2;
	rand bit[2:0] da[];
	constraint da_size{da.size == 10;
			foreach(da[i])
				da[i] == (i+2)/2;
			}
endclass

constraint_2 c1;

module test();
	initial
		begin
			c1 = new;
			assert(c1.randomize());
			$display("da:%p",c1.da);
		end
endmodule
