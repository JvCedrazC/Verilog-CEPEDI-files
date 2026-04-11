module datapath(
    input      [3:0] data0, data1, data2, data3,
    input      [1:0] address,
    output reg [3:0] out_data
);
    always @(*) begin
        if (address == 2'b11)
            out_data = data3;
        else if (address == 2'b10)
            out_data = data2;
        else if (address == 2'b01)
            out_data = data1;
        else if (address == 2'b00)
            out_data = data0;
        else
            out_data = data3;
    end
endmodule
