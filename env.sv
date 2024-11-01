
class env extends uvm_env;

  // agent and scoreboard instance

  input_agent      	input_agent1;
  coverage           coverage1  ;
  `uvm_component_utils(env)


  ///Constructor
  
  function new(string name = "env",uvm_component parent=null);
    
    super.new(name,parent);
  	
  endfunction : new
  
  ///Build phase
    
    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	
  coverage1 = coverage::type_id::create("coverage", this);
    input_agent1 = input_agent::type_id::create("input_agent", this);
  
  endfunction : build_phase
  
  
  
  //connect phase
  
  function void connect_phase(uvm_phase phase);
    input_agent1.monitor1.mon_analysis_port.connect(coverage1.monitor_cov);
  endfunction : connect_phase
  
  
endclass