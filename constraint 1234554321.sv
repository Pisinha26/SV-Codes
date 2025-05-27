class constraint_8;
	rand int da[];
	constraint c1{da.size == 10;}
	constraint c2{foreach(da[i])
			if(i<5)
				da[i] == i + 1;
			else
				da[i] == 10 - i;
			}
endclass

constraint_8 c1;
	
module test();
	initial
		begin
			c1=new;
			assert(c1.randomize());
			$display("da: %p",c1.da);
		end
endmodule
