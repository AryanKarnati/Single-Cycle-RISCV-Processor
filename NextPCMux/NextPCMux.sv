module NextPCMux (
	input logic [31:0] pc_plus_4,
	input logic [31:0] branch_target,
	input logic [31:0] jump_target,
	input logic [1:0] pc_src,
	output logic [31:0] next_pc
);

always_comb begin
	case(pc_src)
	2'b00 : next_pc = pc_plus_4; // Normal execution
	2'b01 : next_pc = branch_target; //Branch taken
 	2'b10 : next_pc = jump_target; // JAL or JALR
	default : next_pc = 32'h00000000; // Safe default
endcase

end

endmodule
