`timescale 1ns / 1ps
module top (
    
    input logic clk,
    input logic rst
);

parameter PROG_VALUE = 3; // PC
parameter REGF_WIDTH = 16;// reg
parameter IMEM_DEPTH = 4;// ROM
parameter ALU_WIDTH = 16;//ALU

logic [ ALU_WIDTH - 1 : 0 ] alu_out_to_alu_input;

logic [ REGF_WIDTH - 1 : 0] reg_out_op1, reg_out_op2;
logic [ $clog2 (PROG_VALUE) - 1 : 0 ]  addr;
logic [ 7 :0]  ins;
logic [1:0]  opcode; // input on opcode of ALU.
logic [1:0]  rs1;
logic [1:0]  rs2;
logic [1:0]  rd;

assign opcode = ins[1:0];
assign rs1 = ins[3:2];
assign rs2 = ins[5:4];
assign rd  = ins[7:6];


alu #(  .ALU_WIDTH( ALU_WIDTH ) ) ALU1(
    
    .op1(reg_out_op1), 
    .op2(reg_out_op2),
    .opcode(opcode),
    .alu_result(alu_out_to_alu_input)
    
);


program_counter #( .PROG_VALUE (PROG_VALUE) ) PC1(
    .clk(clk),
    .rst(rst),  
//    .D(),
    .Q(addr)
);

register_file #( .REGF_WIDTH (REGF_WIDTH) ) REG1(
        .clk(clk),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .alu_input(alu_out_to_alu_input),
        .reg_out_op1(reg_out_op1), 
        .reg_out_op2(reg_out_op2)  
);

instruction_memory #( .IMEM_DEPTH (IMEM_DEPTH) ) INS1(
    .addr(addr),
    .inst(ins)
    
    );


endmodule 