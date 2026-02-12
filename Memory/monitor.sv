import uvm_pkg::*;
`include "uvm_macros.svh"

//factory registration
class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  
  //virtual interface
  virtual add_if vif;
    
   //object creation
    seq_item mon_item;
  
  // analysis port
  uvm_analysis_port #(seq_item) mon_ap;

   //default constructor
  function new(string name = "monitor",uvm_component parent=null);
    super.new(name,parent);
    
  endfunction
  
//phases
    
    //BUILD_PHASE
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      if(!uvm_config_db #(virtual add_if)::get(this,"","vif",vif))
        `uvm_info(get_type_name(),"build_phase in monitor is wrong",UVM_MEDIUM);
      mon_ap=new("mon_ap",this);
      
    endfunction
      
      //RUN_PHASE
      virtual task run_phase(uvm_phase phase);
        `uvm_info(get_type_name(),"run_phase in monitor is started",UVM_MEDIUM); 
       
          forever begin 
            
            @(posedge vif.clk);
            #3;
          mon_item=seq_item::type_id::create("mon_item",this);
           
          mon_item.waddr=vif.waddr;
          mon_item.raddr=vif.raddr;
          mon_item.din=vif.din; 
          mon_item.write_en=vif.write_en;
            mon_item.dout = vif.dout;
         
          mon_item.print();
          
          
            `uvm_info(get_type_name(),$sformatf("waddr=%d raddr=%d din=%d write_en=%d dout=%b",mon_item.waddr,mon_item.raddr,mon_item.din,mon_item.write_en,mon_item.dout),UVM_MEDIUM);
                   
       // analysis port write
                    mon_ap.write(mon_item);
           end
      endtask   
endclass

