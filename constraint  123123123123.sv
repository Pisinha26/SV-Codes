class constraint_13;
	rand int da[];
	constraint c1{da.size == 12;}
	constraint c2{foreach(da[i])
			da[i] == ((i%3) + 1); }
endclass

constraint_13 c1;

module test();
	initial
		begin
			c1=new();
			assert(c1.randomize());
			$display("da: %p",c1.da);
		end
endmodule
