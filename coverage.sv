
class coverage extends uvm_subscriber #(seq_item);
   `uvm_component_utils(coverage)

  uvm_analysis_imp #(seq_item, coverage) monitor_cov ;

  seq_item seq_trans;
  
  logic [7:0] w_bus;     // Main bus
  
  logic [13:0] cw_bus; // Controll word bus


    
  function new (string name = "coverage" , uvm_component parent = null);
    super.new(name, parent);

     cov  = new();
    
  endfunction  
  
   covergroup cov;
        
        w_bus : coverpoint     seq_trans.w_bus;
       cw_bus : coverpoint     seq_trans.cw_bus;

        
      endgroup : cov
  
    virtual function void build_phase (uvm_phase phase);
    super.build_phase (phase);
    /// instance analysis port
    monitor_cov = new ("monitor_cov", this);
      seq_trans = new();

     

  endfunction
  
   function void write(seq_item t);
         
     seq_trans.w_bus  = t.w_bus;
     seq_trans.cw_bus = t.cw_bus;
     
         cov.sample();

   endfunction : write

endclass : coverage