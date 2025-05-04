`timescale 1ns / 1ps

module ALUControlUnit_tb;

  // Inputs
  logic [1:0] ALUOp;
  logic [2:0] funct3;
  logic [6:0] funct7;

  // Output
  logic [3:0] ALUControl;

  // Instantiate the DUT
  ALUControlUnit uut (
    .ALUOp(ALUOp),
    .funct3(funct3),
    .funct7(funct7),
    .ALUControl(ALUControl)
  );

  initial begin
    // R-type ADD
    ALUOp   = 2'b10;
    funct3  = 3'b000;
    funct7  = 7'b0000000;
    #10;

    // R-type SUB
    funct7  = 7'b0100000;
    #10;

    // AND
    funct3  = 3'b111;
    funct7  = 7'b0000000;
    #10;

    // OR
    funct3 = 3'b110;
    #10;

    // XOR
    funct3 = 3'b100;
    #10;

    // SLT
    funct3 = 3'b010;
    #10;

    // I-type ADDI
    ALUOp = 2'b00;
    #10;

    // BEQ
    ALUOp = 2'b01;
    #10;

    $finish;
  end

endmodule

