`include "encoder_priority.v"
`include "datapath.v"
`include "control.v"


module top(
    input        e0, e1, e2, e3,
    input  [3:0] data0, data1, data2, data3,
    output [3:0] out_data,
    output [3:0] status
);
    wire [1:0] address;
    encoder_priority enc_p1 (.e0(e0), .e1(e1), .e2(e2), .e3(e3), .address(address));
    datapath         dp1    (.data0(data0), .data1(data1), .data2(data2), .data3(data3), .address(address), .out_data(out_data));
    control          c1     (.address(address), .out_flag(status));

endmodule