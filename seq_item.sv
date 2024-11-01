
class seq_item extends uvm_sequence_item;
  
  `uvm_object_utils(seq_item)
   logic 	[7:0] w_bus;     // Main bus
  rand bit 	[13:0] cw_bus; // Controll word bus
  logic  	[7:0] o;
    int delay = 10;
  
  function new (string name = "seq_item");
    super.new(name);
  endfunction: new
  
endclass