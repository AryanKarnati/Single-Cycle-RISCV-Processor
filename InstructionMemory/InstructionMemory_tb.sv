`timescale 1ns / 1ps

module InstructionMemory_tb;

//Inputs
logic [31:0] addr;
logic [31:0] instr;

//Instantiate InstructionMemory Module
InstructionMemory uut(
	.addr(addr),
	.instr(instr)
);

//Test stimulus

initial begin

	uut.memory[0] = 32'h00000013; // NOP (ADDI x0, x0, 0)
	uut.memory[1] = 32'h00208133; // ADD x2, x1, x2
	uut.memory[2] = 32'h003101B3; // ADD x3, x2, x3
	
	// Test case 1: address 0x00
        addr = 32'h00000000;
        #10;
        $display("Addr: %h, Instruction: %h", addr, instr);

        // Test case 2: address 0x04
        addr = 32'h00000004;
        #10;
        $display("Addr: %h, Instruction: %h", addr, instr);

        // Test case 3: address 0x08
        addr = 32'h00000008;
        #10;
        $display("Addr: %h, Instruction: %h", addr, instr);

    $finish;
  end

endmodule

