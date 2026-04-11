module ula (
    input      [3:0] A,         // Operando A
    input      [3:0] B,         // Operando B
    input      [2:0] seletor,   // Sinal de seleção (3 bits)
    output reg [3:0] resultado, // Resultado da operação
    output reg     C, V, Z, N

);  
    reg [4:0] temp;
    always @(*) begin
        C = 1'b0; 
        V = 1'b0;
        Z = 1'b0;
        N = 1'b0;
        case (seletor)
            3'b000: resultado = A & B;       // Operação AND
            3'b001: resultado = A | B;       // Operação OR
            3'b010: resultado = ~A;          // Operação NOT (aplica-se apenas ao operando A)
            3'b011: resultado = ~(A & B);    // Operação NAND
            3'b100: begin                    //Soma
                temp = A + B; 
                resultado = temp[3:0];
                C = temp[4];
                V = (A[3] == B[3] && A[3] != resultado[3]);
            end 
            3'b101: begin                   // Subtração 
                temp = A - B;
                resultado = temp[3:0];
                C = ~temp[4];
                V = ((A[3] != B[3]) && (resultado[3] != A[3])); 

            end       
            3'b110: resultado = A << B;      //Shift a esquerda
            3'b111: resultado = A >> B;      //Shift a direita
            default: resultado = 4'b0000;    // Operação padrão (zero)
        endcase
        if (resultado == 4'b0)
            Z = 1;
        N = resultado[3];
        
    end
endmodule