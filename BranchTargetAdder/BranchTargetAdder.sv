module BranchTargetAdder(
	input logic [31:0] pc,
	input logic [31:0] imm_gn,
	output logic [31:0] branch_target
);


always_comb begin
	branch_target = pc + imm_gn;
end

endmodule
