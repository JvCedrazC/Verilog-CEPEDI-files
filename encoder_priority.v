module encoder_priority(
    input            e0, e1, e2, e3,
    output reg [1:0] address
);

    always @(*) begin
        address = 2'b11;
        if (e3)
            address = 2'b11;
        else if (e2)
            address = 2'b10;
        else if (e1)
            address = 2'b01;
        else if (e0)
            address = 2'b00;
    end

endmodule