class constraint_28;
	rand int count;
	constraint c1{(count%3 == 0) && (count%5 == 0) && (count%2 != 0);}
	constraint c2{count inside {[30:150]};}
endclass
constraint_28 c1;
module test();
	initial
		begin
			repeat(5)
				begin
					c1=new;
					assert(c1.randomize());
					$display("count=%d",c1.count);
				end
		end
endmodule
