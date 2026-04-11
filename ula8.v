`include "cla.v"
`include "somador_c2.v"

module ula (
    input       [3:0] A,                      // Operando A
    input       [3:0] B,                      // Operando B
    input       [3:0] seletor,                // Sinal de seleção (4 bits)
    output reg  [3:0] resultado,              // Resultado da operação
    output wire       C_cla,       
    output reg        C, V, Z, N, 
    output wire       P, G        // Flags

);  

    wire [4:0] w_temp_sum, w_temp_sub;
    reg        Cin;
    cla        cla1(.A(A),.B(B),.Cin(Cin), .Cout (w_temp_sum[4]), .sum(w_temp_sum[3:0]));
    somador_c2 sc2(.A(A), .B(B), .sum (w_temp_sub[3:0]), .Cout (w_temp_sub[4]));
    assign P = A[3] ^ B[3];
    assign G = A[3] & B[3];
    always @(*) begin
        C     = 1'b0; 
        V     = 1'b0;
        Z     = 1'b0;
        N     = 1'b0;
        Cin   = 1'b0;
    

        case (seletor)
            4'b0000: resultado = A & B;       // Operação AND
            4'b0001: resultado = A | B;       // Operação OR
            4'b0010: resultado = ~A;          // Operação NOT (aplica-se apenas ao operando A)
            4'b0011: resultado = ~(A & B);    // Operação NAND
            4'b0100: begin                    //Soma
                resultado = w_temp_sum[3:0];
                C = w_temp_sum[4];
                V = (A[3] == B[3] && A[3] != resultado[3]);
            end 
            4'b0101: begin                   // Subtração 
                resultado = w_temp_sub[3:0];
                C = ~w_temp_sub[4];
                V = ((A[3] != B[3]) && (resultado[3] != A[3])); 

            end       
            4'b0110: resultado = A << B;     //Shift a esquerda
            4'b0111: resultado = A >> B;     //Shift a direita
            4'b1000: resultado = A ^ B;      //Operação XOR
            4'b1001: resultado = ~(A | B);   //Operação NOR 
            default: resultado = 4'b0000;    //Operação padrão (zero)
        endcase
        if (resultado == 4'b0)
            Z = 1;
        N = resultado[3];
    end
endmodule