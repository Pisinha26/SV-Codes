class constraint_35;
	rand bit [7:0]y;
	constraint c1{$countones(y) == 1;}
endclass
constraint_35 c1;
module test();
	initial
		begin
			repeat(8)
				begin
					c1=new;
					assert(c1.randomize());
					$display("y=%b",c1.y);
				end
		end
endmodule
