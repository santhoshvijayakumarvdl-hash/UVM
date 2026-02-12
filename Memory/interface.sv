interface add_if();
  logic[7:0] waddr;
  logic[7:0] raddr;
  logic[9:0] din;
  logic[9:0] dout;
  logic write_en;
  logic clk;
  
  clocking ck1 @ (posedge clk);
	default input #1ns output #1ns;
	input waddr,raddr,din,dout,write_en;
	
	
endclocking
  
  
endinterface
