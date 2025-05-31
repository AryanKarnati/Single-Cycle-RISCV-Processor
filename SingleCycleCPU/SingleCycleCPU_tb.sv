`timescale 1ns / 1ps

module SingleCycleCPU_tb;

  logic clk;
  logic reset;

  // Instantiate the DUT (Device Under Test)
  SingleCycleCPU dut (
    .clk(clk),
    .reset(reset)
  );

  // Generate clock: 10ns period
  always #5 clk = ~clk;

  initial begin
    // Initial values
    clk = 0;
    reset = 1;

    // Apply reset for 1 cycle
    #10 reset = 0;

    // Run long enough to execute all instructions
    #500;

    $finish;
  end

endmodule

