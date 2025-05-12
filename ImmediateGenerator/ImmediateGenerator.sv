module ImmediateGenerator(
  input  logic [31:0] instr,
  output logic [31:0] imm_out
);

always_comb begin
  case (instr[6:0])
    7'b0000011, 7'b0010011: begin // I-type (e.g., lw, addi)
      imm_out = {{20{instr[31]}}, instr[31:20]};
    end
    7'b0100011: begin // S-type (e.g., sw)
      imm_out = {{20{instr[31]}}, instr[31:25], instr[11:7]};
    end
    7'b1100011: begin // B-type (e.g., beq)
      imm_out = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
    end
    default: begin
      imm_out = 32'b0;
    end
  endcase
end

endmodule
