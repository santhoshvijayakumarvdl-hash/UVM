import uvm_pkg::*;
`include "uvm_macros.svh"


//factory registration
class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
  //ram block
  reg [7:0] mem [(1<<10)-1:0];

  

  
  
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

    mem[scb_item.waddr] = scb_item.din;
    if(!scb_item.write_en)begin
    
    if(mem[scb_item.raddr]==scb_item.dout)  
   
       `uvm_info(get_type_name(),$sformatf("matched din=%d,waddr=%d,raddr=%d,write_en=%d,dout=%d",scb_item.din,scb_item.waddr,scb_item.raddr,scb_item.write_en,scb_item.dout),UVM_MEDIUM)
            
      else `uvm_info(get_type_name(),$sformatf("mismatched din=%d,waddr=%d,raddr=%d,write_en=%d,dout=%d",scb_item.din,scb_item.waddr,scb_item.raddr,scb_item.write_en,scb_item.dout),UVM_MEDIUM)
        end
        
            endfunction
      
      
endclass

