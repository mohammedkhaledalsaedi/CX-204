`timescale 1ns / 1ps


module alu #(parameter n = 4)(
input cin,
input [n-1:0]op1, op2,
input [1:0]opcode,
output logic [n-1:0]alu_result
    );
    
    wire [n-1:0]add;
    wire [n-1:0]sub;
    wire cout;
    wire borrow;
    
    
    
    assign {cout, add} = cin + op1[n-1:0] + op2[n-1:0];
    assign {borrow, sub} = op1[n-1:0] - op2[n-1:0] - cin;
  
  
    
    logic [n-1:0]AND_Gate;
    assign AND_Gate = op1[n-1:0] & op2[n-1:0];
    
    logic [n-1:0]OR_Gate;
    assign OR_Gate = op1[n-1:0] | op2[n-1:0];
    
    
    
    //output of the mux
always_comb begin
    case (opcode)
        2'b00: alu_result = add;
        2'b01: alu_result = sub;
        2'b10: alu_result = AND_Gate;
        2'b11: alu_result = OR_Gate;
        default: alu_result = 4'b0000;
    endcase
end


    
    
    
    
endmodule
