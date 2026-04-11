`timescale 1ns/1ps
`include "carry_look_ahead.v"

module carry_look_ahead_tb;
    reg [3:0]  A;
    reg [3:0]  B;
    reg        Cin;
    wire       Cout;
    wire [3:0] sum;
    carry_look_ahead cla(.A(A), .B(B),.Cin(Cin), .Cout(Cout), .sum(sum));

    initial begin

        $dumpfile("cla.vcd");
        $dumpvars(0, carry_look_ahead_tb);
        $monitor("A: %b|B: %b|S: %b|C_out: %b", A, B, sum, Cout);

        #5; A = 0000; B = 0001; Cin = 0;
        #5; A = 0001; B = 0011; Cin = 0;
        #5; A = 0011; B = 0011; Cin = 0;
        #5; A = 0101; B = 0011; Cin = 0;
        #5; A = 0001; B = 1111; Cin = 0;
        #5; A = 0111; B = 1011; Cin = 0;

        $finish;

    end

endmodule