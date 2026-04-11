`timescale 1ns/1ps
`include "top.v"

module request_tb;

    reg [3:0]  data0, data1, data2, data3;
    reg        e0, e1, e2, e3;
    wire [3:0] out_data;
    wire [3:0] status;

    top request(.e0(e0), .e1(e1), .e2(e2), .e3(e3), .data0(data0), .data1(data1), .data2(data2), .data3(data3), .out_data(out_data), .status(status));

    task expect (input [3:0] d);
        begin
            $display("Time: %0d|Data0: %b|Data1: %b|Data2: %b|Data3: %b|e0: %b|e1: %b|e2: %b|e3: %b|Out_Data: %b|Status: %b|",    
            $time, data0, data1, data2, data3, e0, e1, e2, e3, out_data, status);
            if (out_data !== d) begin
                $display("TEST FAILD");
                $display("Expected\n out_data: %b", d);
                $finish; 
            end
        end
    endtask

    initial begin
        $display("Iniciando Teste!");
        data0 = 4'b0; data1 =4'b0001; data2 = 4'b0010; data3 = 4'b0011;
        #5; e0 = 0; e1 = 0; e2 = 0; e3 = 1; expect(data3);
        #5; e0 = 0; e1 = 0; e2 = 1; e3 = 0; expect(data2);
        #5; e0 = 0; e1 = 0; e2 = 1; e3 = 1; expect(data3);
        #5; e0 = 0; e1 = 1; e2 = 0; e3 = 0; expect(data1);
        #5; e0 = 0; e1 = 1; e2 = 0; e3 = 1; expect(data3);
        #5; e0 = 0; e1 = 1; e2 = 1; e3 = 0; expect(data2);
        #5; e0 = 0; e1 = 1; e2 = 1; e3 = 1; expect(data3);
        #5; e0 = 1; e1 = 0; e2 = 0; e3 = 0; expect(data0);
        #5; e0 = 1; e1 = 0; e2 = 0; e3 = 1; expect(data3);
        #5; e0 = 1; e1 = 0; e2 = 1; e3 = 0; expect(data2);
        #5; e0 = 1; e1 = 0; e2 = 1; e3 = 1; expect(data3);
        #5; e0 = 1; e1 = 1; e2 = 0; e3 = 0; expect(data1);
        #5; e0 = 1; e1 = 1; e2 = 0; e3 = 1; expect(data3);
        #5; e0 = 1; e1 = 1; e2 = 1; e3 = 0; expect(data2);
        #5; e0 = 1; e1 = 1; e2 = 1; e3 = 1; expect(data3);
  
        
        $display("TEST PASSED");
    end
endmodule