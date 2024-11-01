

class test extends uvm_test;
  
  `uvm_component_utils(test)
  
  env env1;
  sequenc seq;
  
  //Constructor
  
  function new(string name = "test",uvm_component parent=null);
    super.new(name,parent);
  endfunction : new
  
  //Build phase
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	    env1 = env::type_id::create("env", this);
     seq = sequenc::type_id::create("sequenc", this);
  endfunction : build_phase
  
  virtual function void end_of_elaboration();
    //print's the topology
    print();
  endfunction
  
  virtual task run_phase (uvm_phase phase);
    
      phase.raise_objection (this); //flag
  
    seq.start(env1.input_agent1.seqr);
    
    phase.drop_objection (this); //flag
    
  endtask
  
endclass