module cla#(parameter WIDTH = 4)(
    input       [WIDTH-1:0] A, B,
    input                   Cin,
    output wire             Cout,
    output wire [WIDTH-1:0] sum
); 
    wire [WIDTH-1:0] P;
    wire [WIDTH-1:0] G;
    wire [WIDTH:0]   C;  
    
    genvar i;
  
    assign P = A ^ B;
    assign G = A & B;
    assign C[0] = Cin;
    generate
        for (i =  0; i < WIDTH; i = i +1) begin : carry
            assign C[i+1] = G[i] | (P[i] & C[i]);
        end
    endgenerate

    assign Cout = C[WIDTH];
    assign sum = P ^ C[WIDTH-1:0];

endmodule