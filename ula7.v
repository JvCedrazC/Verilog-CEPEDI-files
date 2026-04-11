module ula (
    input      [3:0] A,         // Operando A
    input      [3:0] B,         // Operando B
    input      [3:0] seletor,   // Sinal de seleção (3 bits)
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
            4'b0000: resultado = A & B;       // Operação AND
            4'b0001: resultado = A | B;       // Operação OR
            4'b0010: resultado = ~A;          // Operação NOT (aplica-se apenas ao operando A)
            4'b0011: resultado = ~(A & B);    // Operação NAND
            4'b0100: begin                    //Soma
                temp = A + B; 
                resultado = temp[3:0];
                C = temp[4];
                V = (A[3] == B[3] && A[3] != resultado[3]);
            end 
            4'b0101: begin                   // Subtração 
                temp = A - B;
                resultado = temp[3:0];
                C = ~temp[4];
                V = ((A[3] != B[3]) && (resultado[3] != A[3])); 

            end       
            4'b0110: resultado = A << B;      //Shift a esquerda
            4'b0111: resultado = A >> B;      //Shift a direita
            4'b1000: resultado = A ^ B;      //Operação XOR
            4'b1001: resultado = ~(A | B);   //Operação NOR 
            default: resultado = 4'b0000;    //Operação padrão (zero)
        endcase
        if (resultado == 4'b0)
            Z = 1;
        N = resultado[3];
        
    end
endmodule