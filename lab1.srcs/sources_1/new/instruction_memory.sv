`timescale 1ns / 1ps


module instruction_memory #(parameter n = 8)(

input logic [3:0]address,
output logic [n-1:0]instruction
    );
    
    
    logic [7:0]rom [0:3];
    
    initial begin
    $readmemb("/home/it/Downloads/ISA/CX-204-Lab1/support_files/fib_im.mem", rom);
    end
    
    
   //another good method:
    
    always_comb begin
        instruction = rom[address];
    end
    
    
    //my method:
//    always_comb begin

//    case (address)
//    4'b0000 : instruction = rom[0];
//    4'b0001 : instruction = rom[1];
//    4'b0010 : instruction = rom[2];
//    4'b0011 : instruction = rom[3];
//    default: instruction = 8'b00000000;
    
//    endcase
//    end
    
    
endmodule
