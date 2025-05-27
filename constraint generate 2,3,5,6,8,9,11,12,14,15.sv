class constraint_7;
	rand int da[];

	constraint c1{da.size == 10;}
	constraint c2{foreach(da[i])
			if(i == 0)
				da[i] == 2;
			else if(i == 1)
				da[i] ==3;
			else if(i/2 == 0)
				da[i] == da[i-2] + 3;
			else if(i/2 != 0)
				da[i] == da[i-2] + 3;
			}
endclass

constraint_7 c1;

module test();
	initial
		begin
			c1=new;
			assert(c1.randomize());
			$display("da: %p",c1.da);
		end
endmodule
