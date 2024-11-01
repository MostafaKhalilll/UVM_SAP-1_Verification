`timescale 1ns/1ps
interface sap_intf (input clk , inv_clk);
  
  bit reset;
  logic [7:0] o;
  logic [7:0] w_bus;     // Main bus
  logic [13:0] cw_bus; // Controll word bus
  
  
  clocking cb @(posedge clk);
    
    default input #1ns output #2ns;
    
    input clk, inv_clk, reset ;
    input w_bus, cw_bus;
    input o;

  endclocking
  
    clocking drv @(posedge clk);
    
    default input #1ns output #2ns;
    
    output clk, inv_clk, reset, cw_bus;
    input  w_bus, o;
      
  endclocking

  
  modport TB  (clocking cb, input clk , reset);
  
    modport dv  (clocking drv, input clk );
      

        
endinterface
