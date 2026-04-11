module control(
    input      [1:0] address,
    output reg [3:0] out_flag
);
    always @(*) begin
        case (address)
            2'b11:   out_flag = 4'b1000;
            2'b10:   out_flag = 4'b0100;
            2'b01:   out_flag = 4'b0010;
            2'b00:   out_flag = 4'b0001;
            default: out_flag = 4'b1000;
        endcase
    end
endmodule
