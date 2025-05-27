class constraint_11;
	rand bit [3:0] da[];
	constraint c1{da.size == 10;}
	constraint c2{foreach(da[i])
			if(i%2 == 0)
				da[i]%2 == 1;
			else if(i%2 == 1)
				da[i]%2 == 0; }
endclass

constraint_11 c1;

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
