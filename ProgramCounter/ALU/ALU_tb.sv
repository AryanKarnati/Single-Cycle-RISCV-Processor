`timescale 1ns / 1ps

module ALU_tb;

  // Inputs
  logic [31:0] A;
  logic [31:0] B;
  logic [3:0] ALUControl;

  // Outputs
  logic [31:0] result;
  logic zero;

  // Instantiate the ALU module
  ALU uut (
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .result(result),
    .zero(zero)
  );

  // Test Stimulus
  initial begin
    // Case 1: AND Operation
    A = 32'h00000000;
    B = 32'h00000001;
    ALUControl = 4'b0000;
    #10;

    // Case 2: OR Operation
    A = 32'h00000001;
    B = 32'h00000001;
    ALUControl = 4'b0001;
    #10;

    // Case 3: Addition
    A = 32'd10;
    B = 32'd5;
    ALUControl = 4'b0010;
    #10;

    // Case 4: Subtraction
    A = 32'd20;
    B = 32'd18;
    ALUControl = 4'b0011;
    #10;

    // Case 5: SLT Operation
    A = 32'd5;
    B = 32'd10;
    ALUControl = 4'b0100;
    #10;

    // Case 6: XOR Operation
    A = 32'hFF00FF00;
    B = 32'h00FF00FF;
    ALUControl = 4'b0101;
    #10;

    $finish;
  end

endmodule

