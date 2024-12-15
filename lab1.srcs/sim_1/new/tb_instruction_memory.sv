`timescale 1ns / 1ps


module tb_instruction_memory;
localparam n = 8;

logic [3:0]address;
logic [n-1:0]instruction;

instruction_memory #(.n(n)) dut(

.address(address),
.instruction(instruction)
);


initial begin

address = 'b0000; #10;
address = 'b0001; #10;
address = 'b0010; #10;
address = 'b0011; #10;



$finish;
end
endmodule
