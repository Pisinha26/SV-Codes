class constraint_19;
	rand int da[];
	constraint c1{da.size == 10;}
	constraint c2{foreach(da[i])
			if(i%2 == 0)
				da[i] == 5 * (i+1);
			else
				da[i] == -5 * (i+1); }

endclass


constraint_19 c1;

module test();
	initial
		begin
			c1=new;
			assert(c1.randomize());
			$display("da: %p",c1.da);
		end		
		
endmodule
