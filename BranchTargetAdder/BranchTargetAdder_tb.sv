`timescale 1ns / 1ps

module BranchTargetAdder_tb;

  // Inputs
  logic [31:0] pc;
  logic [31:0] imm_gn;

  // Output
  logic [31:0] branch_target;

  // Instantiate the module
  BranchTargetAdder dut (
    .pc(pc),
    .imm_gn(imm_gn),
    .branch_target(branch_target)
  );

  initial begin
    // Test case 1
    pc = 32'd100;
    imm_gn = 32'd20;
    #10;

    // Test case 2
    pc = 32'd0;
    imm_gn = 32'd4;
    #10;

    // Test case 3
    pc = 32'd128;
    imm_gn = -32'sd8;  // Should test negative immediate
    #10;

    // Test case 4
    pc = 32'd4294967295;  // 0xFFFFFFFF
    imm_gn = 32'd1;
    #10;

    $stop;
  end

endmodule

