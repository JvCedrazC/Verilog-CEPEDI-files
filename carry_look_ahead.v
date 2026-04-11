module carry_look_ahead#(parameter WIDTH = 4)(
    input      [WIDTH-1:0] A, B,
    input                  Cin,
    output reg             Cout,
    output reg [WIDTH-1:0] sum
);
    reg [WIDTH-1:0] P;
    reg [WIDTH-1:0] G;
    reg [WIDTH:0]   C;
    integer i;
    always @(*)begin
        P    = A ^ B;
        G    = A & B;
        C[0] = Cin;
        for (i =  0; i < WIDTH; i = i +1) begin 
            C[i+1] = G[i] | (P[i] & C[i]);
        end

        Cout = C[WIDTH];
        sum = P ^ C[WIDTH-1:0];
    end

endmodule