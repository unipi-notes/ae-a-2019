module counter(
    input inc,
    input clock,
    output [0:N-1] z
);
    parameter N = 8;

    reg [0:N-1] value;

    initial
        value = 0;

    always @(posedge clock) begin
        value = value + inc;
    end

    assign
        z = value;

endmodule // counter