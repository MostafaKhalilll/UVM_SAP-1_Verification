module memory (
  input enable,
  input [3:0] address,
  output [7:0] w_bus 
);


reg [7:0] ram [15:0];

initial begin

  // Instructions
  ram[4'b0000] = 8'b00000110; //load EH
  ram[4'b0001] = 8'b00010111; //add FH
  ram[4'b0010] = 8'b00100111; //sub FH
  ram[4'b0011] = 8'b00100111; //and FH
  ram[4'b0100] = 8'b00100111; //Or FH
  ram[4'b0101] = 8'b00100111; //not 
  ram[4'b0110] = 8'b00100111; //shift Right
  ram[4'b0111] = 8'b00100111; //shift Right
  
  ram[4'b1000] = 8'b11100000; //OUT
 

  // Data
  ram[4'b1110] = 8'b00000001;
  ram[4'b1111] = 8'b00000101;
end

  assign w_bus = (enable) ? 8'bzzzzzzzz : ram[address];

endmodule
