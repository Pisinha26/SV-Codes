class constraint_29;
	rand int da[];
	constraint c1{da.size == 10;}

	//method 1
	/*constraint c2{foreach(da[i])
			if(i==0)
				da[i] == 1;
			else if(i==9)
				da[i] == 1;
			else
				da[i] == 0; }
	*/
	
	//method 2
	constraint c2{foreach(da[i])
			if(i%9 == 0)
				da[i] == 1;
			else 
				da[i] == 0; }
endclass
constraint_29 c1;
module test();
	initial
		begin
			c1=new;
			assert(c1.randomize());
			$display("da: %p",c1.da);
		end
endmodule 
