module register_file #(parameter n = 8) (
    input  logic en,           
    input  logic reset_n,    
    input  logic clk,           
    input  logic [1:0] rs1,   
    input  logic [1:0] rs2,   
    input  logic [1:0] rd,     
    input  logic [n-1:0] write_data, 
    output logic [n-1:0] op1,   
    output logic [n-1:0] op2  
);

    
    logic [n-1:0] file [0:3];

   

  
    assign op1 = (rs1==2'b00)?'b0: file[rs1]; 
    assign op2 = (rs2==2'b00)?'b0: file[rs2]; 

    
    always_ff @(posedge clk or negedge reset_n) begin
        if (en) begin
        if (!reset_n) begin
            
            file[0] <= 8'b0;
            file[1] <= 8'b0;
            file[2] <= 8'b0;
            file[3] <= 8'b0;
        end else if (en) begin
           
            file[rd] <= write_data;
        end
    end
    end
endmodule
