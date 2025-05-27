class constraint_16;
	rand int da[];
	constraint c1{da.size == 15;}
	constraint c2{foreach(da[i])
			if(i%4==0 || i%4==3)
				da[i] == 1;
			else 
				da[i] == 2; }
endclass

constraint_16 c1;

module test();
	initial
		begin
			c1=new;
			assert(c1.randomize());
			$display("da: %p",c1.da);
		end
endmodule
