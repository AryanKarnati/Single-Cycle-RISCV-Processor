module ProgramCounter(
	input logic clk, //initiaizes clk wire
	input logic reset, //iniitalizes input reset wire
	input logic [31:0] pc_next, // initializes intput wire of 32 bits
	output logic [31:0] pc_out // initializes output of 32 bits
);

always_ff @(posedge clk or posedge reset) begin
	if (reset) begin // if reset is true then output a 0
	 pc_out <= 32'b0; 
	end else begin // else pc output is the next pc value
	 pc_out <= pc_next;
	end
end

endmodule

