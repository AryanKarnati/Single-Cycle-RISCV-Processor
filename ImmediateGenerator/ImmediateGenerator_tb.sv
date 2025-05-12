`timescale 1ns / 1ps

module ImmediateGenerator_tb;

  // Inputs
  logic [31:0] instr;

  // Outputs
  logic [31:0] imm_out;

  // Instantiate the DUT
  ImmediateGenerator dut (
    .instr(instr),
    .imm_out(imm_out)
  );

  initial begin
    // Test I-type (e.g., addi)
    instr = 32'b000000000101_00000_000_00000_0010011; // imm = 0x00000005
    #10;

    // Test S-type (e.g., sw)
    instr = 32'b0000000_00101_00010_010_00000_0100011; // imm = 0x00000015
    #10;

    // Test B-type (e.g., beq)
    instr = 32'b000000_00010_00001_000_00000_1100011; // imm = 0x00000004
    #10;

    // Test edge case: negative immediate
    instr = 32'b111111111111_00000_000_00000_0010011; // imm = 0xFFFFFFFF (sign-extended -1)
    #10;

    $finish;
  end

endmodule

