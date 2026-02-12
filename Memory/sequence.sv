import uvm_pkg::*;
`include "uvm_macros.svh"

//factory registration
class seq extends uvm_sequence #(seq_item);
  int count=10;
  
  bit [9:0] waddr_queue[$];

  `uvm_object_utils(seq)

  //default constructor
  function new(string name = "seq_item");
    super.new(name);
    req=new();
  endfunction
  
//task
  virtual task body();
  seq_item req;

  repeat (count) begin
    req = seq_item::type_id::create("req");

    start_item(req);
    assert(req.randomize());
    if (req.write_en) begin
      waddr_queue.push_back(req.waddr);
    end
    else if (waddr_queue.size() > 0) begin
      req.raddr = waddr_queue.pop_front();
    end

    finish_item(req);
  end

  `uvm_info(get_type_name(), "sequence is finished", UVM_MEDIUM)
endtask

    
    
endclass

