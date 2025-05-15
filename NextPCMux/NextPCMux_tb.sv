`timescale 1ns / 1ps

module NextPCMux_tb;

//Inputs
	logic [31:0] pc_plus_4;
	logic [31:0] branch_target;
	logic [31:0] jump_target;
	logic [1:0] pc_src;
	
// Outputs
	logic [31:0] next_pc;

// Instantiate Module

NextPCMux dut (
	.pc_plus_4(pc_plus_4),
	.branch_target(branch_target),
	.jump_target(jump_target),
	.pc_src(pc_src),
	.next_pc(next_pc)
);

initial begin

$display("Starting NextPCMux testbench...");

    // Set static input values
    pc_plus_4     = 32'd104;
    branch_target = 32'd200;
    jump_target   = 32'd512;

    // Test case 1: pc_src = 2'b00 ? Expect pc_plus_4
    pc_src = 2'b00;
    #10;
    $display("Test 1 - pc_src=00: next_pc = %0d (expected 104)", next_pc);

    // Test case 2: pc_src = 2'b01 ? Expect branch_target
    pc_src = 2'b01;
    #10;
    $display("Test 2 - pc_src=01: next_pc = %0d (expected 200)", next_pc);

    // Test case 3: pc_src = 2'b10 ? Expect jump_target
    pc_src = 2'b10;
    #10;
    $display("Test 3 - pc_src=10: next_pc = %0d (expected 512)", next_pc);

    // Test case 4: pc_src = 2'b11 ? Expect default (depending on your logic)
    pc_src = 2'b11;
    #10;
    $display("Test 4 - pc_src=11: next_pc = %0d (expected depends on default)", next_pc);

    $display("NextPCMux testbench finished.");
    $stop;
  end

endmodule
