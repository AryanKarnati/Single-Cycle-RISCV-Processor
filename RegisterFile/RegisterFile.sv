module RegisterFile(
	input logic clk, // Initializing Clock
	input logic we, // Initializing write enable signal
	input logic [4:0] rs1, // 5-bit address for the first source register
	input logic [4:0] rs2, // 5-bit address for the second source register
	input logic [4:0] rd, // 5-bit address for the destination register
	input logic [31:0] wd, // 32-bit address to write into the destination register
	output logic [31:0] rd1, // 32-bit data from the first source register
	output logic [31:0] rd2 // 32-bit data from the second source register
);

logic [31:0] registers [31:0]; // array of all 32 registers

assign rd1 = (rs1 != 0) ? registers[rs1] : 32'b0; // reads all data from registers
assign rd2 = (rs2 != 0) ? registers[rs2] : 32'b0; // reads all data from registers

// Synchronous write to rd on the rising edge of the clk when we is high
always_ff @(posedge clk) begin
	if(we && rd != 0) begin
	 registers[rd] <= wd;
	end
     end

endmodule

