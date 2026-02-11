import uvm_pkg::*;
`include "uvm_macros.svh"


//factory registration
class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
  //item_queue
  seq_item i_queue[$];
  
  
  //import creation
  uvm_analysis_imp #(seq_item, scoreboard) scb_port;
 

   //default constructor
  function new(string name = "scoreboard",uvm_component parent=null);
    super.new(name,parent);
    scb_port=new("scb_port",this);
   endfunction
  
//phases
    
    //BUILD_PHASE
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
    endfunction
  
  
  //writing items 
  function void write(seq_item scb_item);
   
         
    if(((scb_item.q==scb_item.d)&&(scb_item.rst))||((scb_item.q==0)&&(!scb_item.rst)))
      `uvm_info(get_type_name(),$sformatf("matched d=%d,rst=%d,q=%d,qb=%d",scb_item.d,scb_item.rst,scb_item.q,scb_item.qb),UVM_MEDIUM)
            
      else `uvm_info(get_type_name(),$sformatf("mismatched d=%d,rst=%d,q=%d,qb=%d",scb_item.d,scb_item.rst,scb_item.q,scb_item.qb),UVM_MEDIUM)
        
            endfunction
      
      
endclass

