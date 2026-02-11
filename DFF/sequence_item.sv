import uvm_pkg::*;
`include "uvm_macros.svh"

//factory registration
class seq_item extends uvm_sequence_item;
  rand logic d, rst;
  logic q,qb;

  `uvm_object_utils_begin(seq_item)
  `uvm_field_int(d,UVM_ALL_ON)
  `uvm_field_int(rst,UVM_ALL_ON)
  `uvm_field_int(q,UVM_ALL_ON)
  `uvm_field_int(qb,UVM_ALL_ON)
  `uvm_object_utils_end
  

  //default constructor
  function new(string name = "seq_item");
    super.new(name);
  endfunction

  //constraint
  constraint dor {d dist {0:/ 7, 1:/ 3};}
  constraint ror {rst dist{ 0:/ 1, 1:/ 9};}
  
endclass

