`define DRIV vif.Driver.driver_cb

class driver extends uvm_driver #(seq_item);

  
  virtual sap_intf sap_intf1; 

  `uvm_component_utils(driver);

  function new(string name,uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task run_phase (uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      
      drive();
     
       repeat(req.delay) begin // Delay between packets
         @(sap_intf1.cb);
      end
      
      seq_item_port.item_done();
    end
  endtask: run_phase


  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (! uvm_config_db #(virtual sap_intf) ::get(this, "", "sap_intf", sap_intf1)) begin

      `uvm_error (get_type_name (), "DUT interface not found")

    end

  endfunction:build_phase


  virtual task drive();
	
       
    @(posedge sap_intf1.dv.clk);

    sap_intf1.drv.cw_bus  <= req.cw_bus;     
    

    @(posedge sap_intf1.dv.clk);

    `uvm_info(get_type_name(), $sformatf("---- driver data ---"),UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("cw_bus : %0b",req.cw_bus ),UVM_LOW)

    
    
  endtask :drive




endclass