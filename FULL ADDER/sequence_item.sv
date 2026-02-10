import uvm_pkg::*;
`include "uvm_macros.svh"

//factory registration
class seq_item extends uvm_sequence_item;
  rand logic a, b, c ;
  bit sum,carry;

  `uvm_object_utils_begin(seq_item)
    `uvm_field_int(a,UVM_ALL_ON)
    `uvm_field_int(b,UVM_ALL_ON)
    `uvm_field_int(c,UVM_ALL_ON)
  `uvm_field_int(sum,UVM_ALL_ON)
  `uvm_field_int(carry,UVM_ALL_ON)
  
  `uvm_object_utils_end
  

  //default constructor
  function new(string name = "seq_item");
    super.new(name);
  endfunction

  //constraint
  constraint aor {a dist {0:/ 7, 1:/ 3};}
  constraint bor {b dist{ 0:/ 3, 1:/ 7};}
  constraint cor {c dist {0:/ 5, 1:/ 5};}
endclass

