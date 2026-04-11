module somador_c2 #(parameter WIDTH = 4)(
    input  [WIDTH-1:0] A, B,
    output [WIDTH-1:0] sum,
    output             Cout
);
    assign {Cout, sum} = A + (~(B) + 1'b1);
    
endmodule