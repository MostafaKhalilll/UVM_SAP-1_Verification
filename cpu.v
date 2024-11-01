module cpu(
  input clk,
  input inv_clk,
  input reset,
  output [7:0] o,

  wire [7:0] w_bus,
  wire [13:0] cw_bus
  
);

  

  // Inner connections
  wire [7:0] AtoALU;
  wire [7:0] BtoALU;
  wire [3:0] MARtoRAM;
  wire [3:0] IRtoCONTROLLER;
a_register a_register_DUT (
    .clk(clk),
    .reset(reset),
    .enable(cw_bus[6]),
    .load(cw_bus[7]),
    .alu_connection(AtoALU),
    .w_bus(w_bus)
  );

  b_register b_register_DUT (
    .clk(clk),
    .reset(reset),
    .load(cw_bus[1]),
    .alu_connection(BtoALU),
    .w_bus(w_bus)
  );

  program_counter program_counter_DUT (
    .clk(clk),
    .reset(reset),
    .enable(cw_bus[12]),
    .cp(cw_bus[13]),
    .w_bus(w_bus[3:0])
  );

  alu alu_DUT (
    .enable(cw_bus[2]),
    .su(cw_bus[5:3]),
    .a(AtoALU),
    .b(BtoALU),
    .w_bus(w_bus)
  );

  mar mar_DUT (
    .clk(clk),
    .load(cw_bus[11]),
    .w_bus(w_bus[3:0]),
    .RAM_address(MARtoRAM)
  );

  memory memory_DUT (
    .enable(cw_bus[10]),
    .address(MARtoRAM),
    .w_bus(w_bus)
  );

  instruction_register instruction_register_DUT (
    .clk(clk),
    .reset(reset),
    .enable(cw_bus[8]),
    .load(cw_bus[9]),
    .w_bus(w_bus),
    .address(w_bus[3:0]),
    .opcode(IRtoCONTROLLER)
  );

  output_register output_register_DUT (
    .clk(clk),
    .reset(reset),
    .load(cw_bus[0]),
    .w_bus(w_bus),
    .out(o)
  );


 controller controller_DUT (
    .clk(inv_clk),
    .opcode(IRtoCONTROLLER),
    .cw_bus(cw_bus)
  );

endmodule

