class constraint_26;
	rand int da[];
	rand int a;
	constraint c1{da.size == 6;}
	constraint c2{a inside {[20:30]};}
	constraint c3{foreach(da[i])
			if(i==0)
				da[i] == a;
			else
				da[i] == da[i-1] - 3; }
endclass
constraint_26 c1;
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
