class constraint_3;
	rand int da[];
	constraint c1{da.size == 10;}
	constraint c2{foreach(da[i])
			if(i<5)
				da[i] == da.size - (i+(i+1));
			else
				da[i] == 18 - (i*2);}
endclass

constraint_3 c1;

module test();
	initial
		begin
			c1 = new;
			assert(c1.randomize());
			$display("da: %p",c1.da);
		end
endmodule
