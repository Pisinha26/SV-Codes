class constraint_25;
	rand int da[];
	constraint c1{da.size == 6;}
	constraint c2{foreach(da[i])
			da[i] inside {[0:10]};}
	constraint c3{da.sum() == 30;}
endclass
constraint_25 c1;
module test();
	initial
		begin
			repeat(3)
				begin
					c1=new;
					assert(c1.randomize());
					$display("da: %p",c1.da);
				end
		end
endmodule
