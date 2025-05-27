class constraint_23;
	rand int arr[5][6];
	int i;
	
	constraint c1{foreach(arr[i])
			foreach(arr[i][j])
				arr[i][j] inside {[1:100]};}
	
	constraint c2{foreach(arr[i])
			foreach(arr[i][j])
				arr[i][5] == arr[i][0] + arr[i][1] + arr[i][2] + arr[i][3] + arr[i][4];

			}

endclass
constraint_23 c1;
module test();
	initial
		begin
			c1=new;
			assert(c1.randomize());
			$display("arr: %p",c1.arr);
		end
endmodule
