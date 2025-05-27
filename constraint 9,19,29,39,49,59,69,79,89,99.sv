class constraint_10;
	rand int da[];
	constraint c1{da.size == 10;}
	constraint c2{foreach(da[i])
			da[i] == (i * 10) + 9;
			}
endclass

constraint_10 c1;

module test();
	initial
		begin
			c1=new;
			assert(c1.randomize());
			$display("da: %p",c1.da);
		end
endmodule
