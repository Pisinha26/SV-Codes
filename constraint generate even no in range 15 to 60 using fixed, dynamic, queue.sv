class constraint_20;
	rand int fixed[15];
	rand int da[];
	rand int queue[$];
	constraint c1{da.size == 15;
			queue.size == 15;}
	constraint c2{foreach(fixed[i])
			fixed[i] inside {[15:60]} && fixed[i]%2==0;}

	constraint c3{foreach(da[i])
			da[i] inside {[15:60]} && da[i]%2==0;}
	constraint c4{foreach(queue[i])
			queue[i] inside {[15:60]} && queue[i]%2==0;} 
endclass

constraint_20 c1;

module test();
	initial
		begin
			c1=new;
			assert(c1.randomize());
			$display("fixed: %p, da: %p, queue: %p",c1.fixed,c1.da,c1.queue);
		end
endmodule
