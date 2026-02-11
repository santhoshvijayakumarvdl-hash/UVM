class my_cov extends uvm_subscriber#(seq_item);
  `uvm_component_utils(my_cov)
  
  seq_item tr;
  
  covergroup my_coverage;
    
    option.comment="Coverage for an dff";
    
    val_A: coverpoint(tr.d)
    { 
      bins low_d  = {0};
      bins high_d = {1};
    }
    
    val_B: coverpoint(tr.rst)
    { 
      bins low_rst  = {0};
      bins high_rst= {1};
    } 
    
    
   
    
  
    combi: cross val_A, val_B;
  endgroup: my_coverage
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
    my_coverage=new();
  endfunction: new
  
  function void write(seq_item t);
    tr=t;
    my_coverage.sample();
  endfunction
  
  function void report_phase(uvm_phase phase);
    `uvm_info(get_full_name(),$sformatf("Coverage is %0.2f %%", my_coverage.get_coverage()),UVM_MEDIUM);
  endfunction
endclass
    
