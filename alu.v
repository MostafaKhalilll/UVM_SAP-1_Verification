module alu (
  input enable,
  input [2:0]su,
  input [7:0] a,
  input [7:0] b,
  output [7:0] w_bus
);

reg [7:0] result;

always @(*) begin
  if(su == 3'b000) begin
      result <= a + b;
  end
  else if(su == 3'b001) begin
      result <= a - b;
  end
   else if(su == 3'b010) begin
      result <= a & b;
  end
   else if(su == 3'b011) begin
      result <= a | b;
  end
   else if(su == 3'b100) begin
      result <= ~a ;
  end
   else if(su == 3'b101) begin
      result <= a>>1 ;
  end
    else if(su == 3'b110) begin
      result <= a<<1 ;
  end
end

assign w_bus = (enable) ? result : 8'bzzzzzzzz;

endmodule
