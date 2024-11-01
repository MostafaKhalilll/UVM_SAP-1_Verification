`timescale 1ns/1ps
module top;
  
  bit clk;
  bit inv_clk;
  bit reset;


  
  
  sap_intf sap_intf1 ( clk, inv_clk ) ;
  
////////// Connection to DUT ////////////
  
  cpu dut (
  
    .clk(sap_intf1.clk),
    .inv_clk(sap_intf1.inv_clk),
    .reset(sap_intf1.reset),
    .w_bus(sap_intf1.w_bus),
    .o(sap_intf1.o),
    .cw_bus(sap_intf1.cw_bus)
  
  );
  

  initial begin

    
    $display("CPU running...");
    sap_intf1.reset = 1'b1;
    #10;
    sap_intf1.reset = 1'b0;
    #10;

    inv_clk = 1'b0;
    clk = 1'b1;
#10000;
     sap_intf1.reset = 1'b1;
    #10;
    sap_intf1.reset = 1'b0;
    #10;
  end


 	always #10 clk = ~clk;
    always #10 inv_clk = ~inv_clk;

  initial begin

    uvm_config_db #(virtual sap_intf)::set(null, "*", "sap_intf", sap_intf1);
    run_test("test");

  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

  end

endmodule
