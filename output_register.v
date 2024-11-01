module output_register (
  input clk,
  input load,
  input reset,
  inout [7:0] w_bus,
  output [7:0] out
);


reg [7:0] register = 8'b00000000;

always @(posedge clk) begin
  if(reset == 1'b1) begin
      register <= 8'b00000000;
  end
  else if(load == 1'b0) begin
      register <= w_bus;
  end
end

assign out = register;

  // try


  
    
endmodule
