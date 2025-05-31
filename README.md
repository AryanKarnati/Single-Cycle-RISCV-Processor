# Single-Cycle-RISCV-Processor
This project implements a functional single-cycle RISC-V processor in SystemVerilog, capable of executing a subset of the RV32I instruction set. Built entirely from scratch, this processor is designed to fetch, decode, and execute one instruction per clock cycle—offering an educational foundation for understanding modern CPU architecture and digital logic design.

🚀 Project Overview
Architecture: Single-cycle

Instruction Set: RV32I subset

Language: SystemVerilog

Simulation Tool: ModelSim

Instruction Support: Arithmetic, logic, memory access, and branching

🧩 Features
32-bit Program Counter

Instruction Memory for 32-bit RISC-V instructions

Register File with 32 general-purpose registers (x0–x31)

Immediate Generator supporting I, S, B-type instructions

Control Unit and ALU Control Unit for signal generation

Arithmetic Logic Unit (ALU) with zero flag

Data Memory with support for LW and SW

Branch Target Adder for computing conditional jump targets

Next PC Mux for managing control flow

Fully integrated SingleCycleCPU.sv top module

✅ Supported Instructions
add, sub, and, or, xor, slt

lw, sw

beq

Additional instructions can be easily added by extending the control and ALU logic.

📊 Testing & Validation
Functional testing done via SingleCycleCPU_tb.sv with $display output and waveform analysis.

Confirmed correct control signal generation and data flow for all supported instructions.

All modules tested in isolation and as part of the top-level integration.
