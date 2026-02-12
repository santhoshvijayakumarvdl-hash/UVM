import uvm_pkg::*;
`include "uvm_macros.svh"

//factory registration
class seq_item extends uvm_sequence_item;
  rand bit[7:0] waddr;
  rand bit[9:0] din;
  rand bit write_en;
  bit [9:0] dout;
  bit [7:0] raddr;
 

  `uvm_object_utils_begin(seq_item)
  `uvm_field_int(waddr,UVM_ALL_ON)
  `uvm_field_int(raddr,UVM_ALL_ON)
  `uvm_field_int(din,UVM_ALL_ON)
  `uvm_field_int(write_en,UVM_ALL_ON)
  `uvm_object_utils_end
  

  //default constructor
  function new(string name = "seq_item");
    super.new(name);
  endfunction

  //constraint
  constraint dor {(write_en)->waddr<((1<<10)-1);}

  constraint wr{write_en dist{0:/3,1:/7};}
  constraint dar{(write_en)->din<((1<<8)-1);}
  
  
endclass

