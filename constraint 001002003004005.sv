class constraint_15;
	rand int da[];
	constraint c1{da.size == 15;}
	constraint c2{foreach(da[i])
			if(i % 3 == 2)
				da[i] == i / 3 + 1;
			else
				da[i] == 0; }
endclass

constraint_15 c1;

module test();
	initial
		begin
			c1=new();
			assert(c1.randomize());
			$display("da: %p",c1.da);
		end
endmodule
