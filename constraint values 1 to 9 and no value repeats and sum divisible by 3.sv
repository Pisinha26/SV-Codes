class constraint_27;
	rand int da[];
	constraint c1{da.size == 6;}
	constraint c2{foreach(da[i])
			da[i] inside {[1:9]};}
	constraint c3{unique {da};}	
	constraint c4{(da.sum() % 3) == 0;}
endclass
constraint_27 c1;
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
