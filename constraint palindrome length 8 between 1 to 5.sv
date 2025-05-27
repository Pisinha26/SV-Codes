class constraint_32;
	rand int da[];
	constraint c1{da.size == 8;}
	constraint c2{foreach(da[i])
			da[i] inside {[1:5]};}
	constraint c3{foreach(da[i])
			da[i] == da[da.size() - 1 - i]; }
endclass
constraint_32 c1;
module test();
	initial
		begin
			repeat(10)
				begin
					c1=new;
					assert(c1.randomize());
					$display("da: %p",c1.da);
				end
		end
endmodule
