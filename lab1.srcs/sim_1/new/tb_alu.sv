`timescale 1ns / 1ps


module tb_alu;
localparam n = 4;


logic cin;
logic [n-1:0]op1, op2;
logic [1:0]opcode;
logic [n-1:0]alu_result;


alu #(.n(n)) dut(

.cin(0),
.op1(op1),
.op2(op2),
.opcode(opcode),
.alu_result(alu_result)
);


initial begin

opcode = 00; op1 = 6; op2 = 3; #10;
opcode = 01; op1 = 6; op2 = 3; #10;
opcode = 10; op1 = 6; op2 = 6; #10;
opcode = 11; op1 = 6; op2 = 6; #10;



$finish;
end
endmodule
