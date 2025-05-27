class constraint_17;
	rand int da[];
	constraint c1{da.size == 10;}
	constraint c2{foreach(da[i])
			if(i%2 == 0)
				da[i] == 0;
			else
				da[i] inside {[1:9]}; }
endclass

constraint_17 c1;

module test();
	initial
		begin
			repeat(5)
				begin
					c1=new;
					assert(c1.randomize());
					$display("da: %p",c1.da);
				end
		end
endmodule
