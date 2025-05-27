class constraint_18;
	rand int da[];
	constraint c1{da.size == 10;}
	constraint c2{foreach(da[i])
			if(i == 0)
				da[i] == 0;
			else
				da[i] == da[i-1] + 5; }
endclass

constraint_18 c1;

module test();
	initial
		begin
			c1=new;
			assert(c1.randomize());
			$display("da: %p",c1.da);
		end
endmodule
