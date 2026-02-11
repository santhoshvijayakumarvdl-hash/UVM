interface add_if();
  logic clk;
  logic d;
  logic rst;
  logic q;
  logic qb;
  
  clocking ck1 @ (posedge clk);
	default input #1ns output #1ns;
	input d,rst,q,qb;
	
	
endclocking
  
  
endinterface
