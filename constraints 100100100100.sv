class constraint_14;
	rand int da[];
	constraint c1{da.size == 12;}
	constraint c2{foreach(da[i])
			if(i % 3 == 0)
				da[i] == 1;
			else
				da[i] == 0; }
endclass

constraint_14 c1;

module test();
	initial 
		begin
			c1=new;
			assert(c1.randomize());
			$display("da: %p",c1.da);
		end
endmodule
