class monitor extends uvm_monitor;

  `uvm_component_utils (monitor)
  /////Instantiation my_data is a custom class object LTM

  virtual sap_intf sap_intf1;
  seq_item mon_tran;


  /// port to connect with coverage :

  uvm_analysis_port #(seq_item) mon_analysis_port;

  ////Standard Code for all Components.
  function new (string name, uvm_component parent = null);
    super.new(name, parent);
    mon_tran = new();
  endfunction
  // build phase

  virtual function void build_phase (uvm_phase phase);
    super.build_phase (phase);
    mon_analysis_port = new ("mon_analysis_port", this);

    if (!uvm_config_db #(virtual sap_intf) ::get(this, "*", "sap_intf", sap_intf1)) begin

      `uvm_error (get_type_name (), "DUT interface not found")

    end

  endfunction

  // Run Phase

  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge sap_intf1.TB.clk); //clocking block of interface
      
      mon_tran.cw_bus 		= sap_intf1.cb.cw_bus;
      
//output
      @(posedge sap_intf1.TB.clk);
		mon_tran.o 		= sap_intf1.cb.o;

      `uvm_info(get_type_name(), $sformatf("---- monitor data ---"),UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("o : %0b", mon_tran.o ),UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("w_bus : %0b", mon_tran.w_bus ),UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("cw_bus : %0b", mon_tran.cw_bus ),UVM_LOW)

    end

  endtask : run_phase



endclass