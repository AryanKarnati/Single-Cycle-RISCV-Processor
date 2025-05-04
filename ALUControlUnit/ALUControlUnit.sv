module ALUControlUnit(
	input logic [1:0] ALUOp,
	input logic [2:0] funct3,
	input logic [6:0] funct7,
	output logic [3:0] ALUControl
);

always_comb begin
	case(ALUOp)
	2'b00 : ALUControl = 4'b0010;
	2'b01 : ALUControl = 4'b0011;
	2'b10 : begin
		case(funct3) 
			3'b000 : begin
					if(funct7[5] == 1'b0)
						ALUControl = 4'b0010; //ADD
					else
						ALUControl = 4'b0011; //SUB
				end
			3'b111 : ALUControl = 4'b0000; // AND
			3'b110 : ALUControl = 4'b0001; // OR
			3'b100 : ALUControl = 4'b0101; // XOR
			3'b010 : ALUControl = 4'b0100; // SLT
			default: ALUControl = 4'b0000; // ADD as default
	             endcase
	      end
	default: ALUControl = 4'b0000;
     endcase
end

endmodule		
				
	