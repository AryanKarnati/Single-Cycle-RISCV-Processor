`timescale 1ns / 1ps

module ControlUnit_tb;

  // Inputs
  logic [6:0] opcode;

  // Outputs
  logic RegWrite, ALUSrc, MemWrite, MemToReg, Branch;
  logic [1:0] ALUOp;

  // Instantiate the Unit Under Test (UUT)
  ControlUnit uut (
    .opcode(opcode),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .MemToReg(MemToReg),
    .Branch(Branch),
    .ALUOp(ALUOp)
  );

  // Test stimulus
  initial begin
    // R-type: 0110011
    opcode = 7'b0110011; #10;
    $display("R-type: RegWrite=%b ALUSrc=%b MemWrite=%b MemToReg=%b Branch=%b ALUOp=%b", 
             RegWrite, ALUSrc, MemWrite, MemToReg, Branch, ALUOp);

    // I-type: 0010011
    opcode = 7'b0010011; #10;
    $display("I-type: RegWrite=%b ALUSrc=%b MemWrite=%b MemToReg=%b Branch=%b ALUOp=%b", 
             RegWrite, ALUSrc, MemWrite, MemToReg, Branch, ALUOp);

    // Load: 0000011
    opcode = 7'b0000011; #10;
    $display("Load: RegWrite=%b ALUSrc=%b MemWrite=%b MemToReg=%b Branch=%b ALUOp=%b", 
             RegWrite, ALUSrc, MemWrite, MemToReg, Branch, ALUOp);

    // Store: 0100011
    opcode = 7'b0100011; #10;
    $display("Store: RegWrite=%b ALUSrc=%b MemWrite=%b MemToReg=%b Branch=%b ALUOp=%b", 
             RegWrite, ALUSrc, MemWrite, MemToReg, Branch, ALUOp);

    // Branch: 1100011
    opcode = 7'b1100011; #10;
    $display("Branch: RegWrite=%b ALUSrc=%b MemWrite=%b MemToReg=%b Branch=%b ALUOp=%b", 
             RegWrite, ALUSrc, MemWrite, MemToReg, Branch, ALUOp);

    $stop;
  end

endmodule

