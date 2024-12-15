`timescale 1ns / 1ps

module tb_program_counter;
localparam n = 4;

logic en, reset_n, clk;
logic [n-1:0]count;


program_counter #(.n(n)) dut (
.en(en),
.clk(clk),
.reset_n(reset_n),
.count(count)

);



initial begin
clk = 0;
forever #1 clk = ~clk;
end

initial begin

en = 1; reset_n = 0; #2;
en = 1; reset_n = 1; #10;
en = 1; reset_n = 1; #10;




$finish;
end
endmodule
