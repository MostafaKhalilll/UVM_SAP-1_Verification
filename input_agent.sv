class input_agent extends uvm_agent ;
   
  driver driver1;
  sequencer seqr;
  monitor monitor1;
  
    `uvm_component_utils(input_agent)

  typedef uvm_sequencer#(seq_item) my_sequencer;
 
  function new(string name = "agent", uvm_component parent);
    super.new(name,parent);
  endfunction : new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(get_is_active() == UVM_ACTIVE) begin
      driver1 = driver::type_id::create("driver",this);
      seqr = sequencer::type_id::create("sequencer",this);
    end
    monitor1 = monitor::type_id::create("monitor",this);
  endfunction : build_phase
  
  function void connect_phase(uvm_phase phase);
     if(get_is_active() == UVM_ACTIVE) begin
    driver1.seq_item_port.connect(seqr.seq_item_export);
     end
  endfunction : connect_phase
  
endclass : input_agent