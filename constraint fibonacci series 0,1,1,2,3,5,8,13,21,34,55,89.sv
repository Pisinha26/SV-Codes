class constraint_12;
	rand int da[];
	constraint c1{da.size == 12;}
	constraint c2{foreach(da[i])
			if(i==0)
				da[i] == 0;
			else if(i==1)
				da[i] == 1;
			else
				da[i] == da[i-2] + da[i-1]; }
endclass

constraint_12 c1;

module test();
	initial
		begin
			c1=new;
			assert(c1.randomize());
			$display("da: %p",c1.da);
		end
endmodule
