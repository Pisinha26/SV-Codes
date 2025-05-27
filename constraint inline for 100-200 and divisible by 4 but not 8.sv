class constraint_30;
	rand bit [7:0] a;
	constraint c2{(a%4==0) && (a%8!=0);}
endclass
constraint_30 c1;
module test();
	initial
		begin
			repeat(5)
				begin
					c1=new;
					assert(c1.randomize() with {a>100 && a<200;});
					$display("a: %d",c1.a);
				end
		end
endmodule
