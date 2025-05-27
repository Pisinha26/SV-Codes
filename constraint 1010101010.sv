class constraint_6;
	rand int da[];
	constraint c1{da.size == 10;}
	constraint c2{foreach(da[i])
			if(i%2 == 0)
				da[i] == 1;
			else
				da[i] == 0;}

endclass

constraint_6 c1;

module test();
	initial
		begin
			c1=new;
			assert(c1.randomize());
			$display("da: %p",c1.da);
		end
endmodule
