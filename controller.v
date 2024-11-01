module controller (
  input clk,
  input [3:0] opcode,
  output [13:0] cw_bus
);



  reg [2:0] step = 3'b000;
  reg [13:0] microcodes[127:0] ;

  initial begin
    /* LDA */
    // FETCH
    microcodes[7'b0000000] = 14'b01011110000011; 
    microcodes[7'b0000001] = 14'b10100110000011;
    // EXECUTE
    microcodes[7'b0000010] = 14'b00011010000011;
    microcodes[7'b0000011] = 14'b00101100000011;
    microcodes[7'b0000100] = 14'b00111110000011; // NOP

    /* ADD */
    // FETCH
    microcodes[7'b0001000] = 14'b01011110000011; 
    microcodes[7'b0001001] = 14'b10100110000011;
    // EXECUTE
    microcodes[7'b0001010] = 14'b00011010000011;
    microcodes[7'b0001011] = 14'b00101110000001;
    microcodes[7'b0001100] = 14'b00111100000111;

    /* SUB */
    // FETCH
    microcodes[7'b0010000] = 14'b01011110000011; 
    microcodes[7'b0010001] = 14'b10100110000011;
    // EXECUTE
    microcodes[7'b0010010] = 14'b00011010001011;
    microcodes[7'b0010011] = 14'b00101110000001;
    microcodes[7'b0010100] = 14'b00111100000111;
    
    /* AND */
    // FETCH
    microcodes[7'b0011000] = 14'b01011110000011; 
    microcodes[7'b0011001] = 14'b10100110000011;
    // EXECUTE
    microcodes[7'b0011010] = 14'b00011010010011;
    microcodes[7'b0011011] = 14'b00101110000001;
    microcodes[7'b0011100] = 14'b00111100000111;
    
    /* OR */
    // FETCH
    microcodes[7'b0100000] = 14'b01011110000011; 
    microcodes[7'b0100001] = 14'b10100110000011;
    // EXECUTE
    microcodes[7'b0100010] = 14'b00011010011011;
    microcodes[7'b0100011] = 14'b00101110000001;
    microcodes[7'b0100100] = 14'b00111100000111;
    
    /* NOT */
    // FETCH
    microcodes[7'b0101000] = 14'b01011110000011; 
    microcodes[7'b0101001] = 14'b10100110000011;
    // EXECUTE
    microcodes[7'b0101010] = 14'b00011010100011;
    microcodes[7'b0101011] = 14'b00101110000001;
    microcodes[7'b0101100] = 14'b00111100000111;
    
    /* Shift R */
    // FETCH
    microcodes[7'b0110000] = 14'b01011110000011; 
    microcodes[7'b0110001] = 14'b10100110000011;
    // EXECUTE
    microcodes[7'b0110010] = 14'b00011010101011;
    microcodes[7'b0110011] = 14'b00101110000001;
    microcodes[7'b0110100] = 14'b00111100000111;
    
    /* Shift L */
    // FETCH
    microcodes[7'b0111000] = 14'b01011110000011; 
    microcodes[7'b0111001] = 14'b10100110000011;
    // EXECUTE
    microcodes[7'b0111010] = 14'b00011010110011;
    microcodes[7'b0111011] = 14'b00101110000001;
    microcodes[7'b0111100] = 14'b00111100000111;

    /* OUT */
    // FETCH
 	 microcodes[7'b1110000] = 14'b01011110000011; 
    microcodes[7'b1110001] = 14'b10100110000011;
    // EXECUTE
    microcodes[7'b1110010] = 14'b00111111000010;
    microcodes[7'b1110011] = 14'b00111110000011;
    microcodes[7'b1110100] = 14'b00111110000011; // NOP

    /* HLT */
    microcodes[7'b1111000] = 14'b01011110000011;
    microcodes[7'b1111001] = 14'b10100110000011;
    microcodes[7'b1111010] = 14'b00111110000011; // NOP
    microcodes[7'b1111011] = 14'b00111110000011; // NOP
    microcodes[7'b1111100] = 14'b00111110000011; // NOP

  end

  always @(posedge clk) begin
    if(step == 3'b100) begin
      step <= 3'b000;
    end
    else begin
      step <= step + 1;
    end
  end

  assign cw_bus = microcodes[{ opcode, step }];

endmodule
