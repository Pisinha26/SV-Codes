class constraint_5;
	rand int da[];
	constraint c1{da.size == 10;}
	constraint c2{foreach(da[i])
			da[i] == i%2;}

endclass

constraint_5 c1;

module test();
	initial
		begin
			c1 = new;
			assert(c1.randomize());
			$display("da: %p",c1.da);
		end
endmodule
