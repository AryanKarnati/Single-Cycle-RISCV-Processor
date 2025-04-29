`timescale 1ns / 1ps

module ProgramCounter_tb;

  // Inputs
  reg clk;
  reg reset;
  reg [31:0] pc_next;

  // Outputs
  wire [31:0] pc_out;

  // Instantiate the Program Counter
  ProgramCounter uut (
    .clk(clk),
    .reset(reset),
    .pc_next(pc_next),
    .pc_out(pc_out)
  );

  // Clock Generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle every 5ns -> 10ns clock period
  end

  // Stimulus
  initial begin
    // Initialize Inputs
    reset = 1;
    pc_next = 32'h00000000;
    #10;
    
    reset = 0;
    pc_next = 32'h00000004;
    #10;
    
    pc_next = 32'h00000008;
    #10;
    
    pc_next = 32'h0000000C;
    #10;
    
    $stop; // End simulation
  end

endmodule
