class constraint_33;
	rand bit[4:0]hour;
	rand bit[5:0]minute;
	rand bit[5:0]second;
	constraint c1{hour inside {[0:23]};}
	constraint c2{minute inside {[0:59]};}
	constraint c3{second inside {[0:59]};}
endclass
constraint_33 c1;
module test();
	initial
		begin
			repeat(5)
				begin
					c1=new;
					assert(c1.randomize());
					$display("%d:%d:%d",c1.hour,c1.minute,c1.second);
				end
		end
endmodule
