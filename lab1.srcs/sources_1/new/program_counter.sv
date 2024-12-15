`timescale 1ns / 1ps


module program_counter #(parameter n = 4)(
input en, clk, reset_n,
output logic [n-1:0]count

    );
    
    always_ff @ (posedge clk, negedge reset_n) begin
    if (en) begin
    if (reset_n == 0) count <= 0;
    else count <= count + 1;
    
    
    
    end
    end
    
endmodule
