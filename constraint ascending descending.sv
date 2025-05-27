class constraint_22;
	rand int a[];
	rand int b[];
	
	constraint c1{a.size == 10; b.size == 10;}
	
	constraint c2{foreach(a[i])
			a[i] inside {[1:50]};
		      foreach(b[i])
			b[i] inside {[1:50]};}

	constraint ascending_order{foreach(a[i])
					if(i>0)
						a[i] > a[i-1]; }
	
	constraint descending_oredr{foreach(b[i])
					if(i>0)
						b[i] < b[i-1]; }

endclass
constraint_22 c1;
module test();
	initial
		begin
			c1=new;
			assert(c1.randomize());
			$display("ASCENDING ORDER: %p",c1.a);
			$display("DESCENDING ORDER: %p",c1.b);
		end
endmodule
