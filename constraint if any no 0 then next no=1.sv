class constraint_31;
	rand int da[];
	constraint c1{da.size==10;}
	constraint c2{foreach(da[i])
			da[i] inside {[0:5]};}
	constraint c3{foreach(da[i])
				if(i<9 && da[i] == 0)
					da[i+1] == 1;}
endclass
constraint_31 c1;
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
