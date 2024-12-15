`timescale 1ns / 1ps

module register_file_tb;
localparam n = 8;

   
    logic en;
    logic reset_n;
    logic clk;
    logic [1:0] rs1;
    logic [1:0] rs2;
    logic [1:0] rd;
    logic [n-1:0] write_data;
    logic [n-1:0] op1;
    logic [n-1:0] op2;


    register_file dut (
        .en(en),
        .reset_n(reset_n),
        .clk(clk),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .write_data(write_data),
        .op1(op1),
        .op2(op2)
    );

    
    initial begin
        clk = 0;
        forever #1 clk = ~clk; 
    end

    
    initial begin
    

    
        en = 0;
        reset_n = 0;
        rs1 = 0;
        rs2 = 0;
        rd = 0;
        write_data = 0;

       
        #10;
        reset_n = 1;
        en = 1;

        
        #10;
        rd = 2'b01;
        write_data = 8'hAA;
        #10;

        rd = 2'b10;
        write_data = 8'hBB;
        #10;

        rd = 2'b11;
        write_data = 8'hCC; 
        #10;

     
        rs1 = 2'b01;
        rs2 = 2'b10;
        #10;

        rs1 = 2'b11;
        rs2 = 2'b00;
        #10;
 

        
        reset_n = 0;
        #10;
        reset_n = 1;

        
        rs1 = 2'b01;
        rs2 = 2'b10;
        #10;

    end

endmodule
