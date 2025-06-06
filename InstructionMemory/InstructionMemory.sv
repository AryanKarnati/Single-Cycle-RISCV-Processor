module InstructionMemory(
	input logic [31:0] addr, // Address from Program Counter
	output logic [31:0] instr // Fetched Instruction
);

logic [31:0] memory [0:255]; // ROM: 256 instructions max

always_comb begin 
	instr = memory[addr[9:2]]; // Word-aligned address access
end

endmodule 