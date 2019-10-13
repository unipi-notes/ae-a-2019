// Register using output wires
module registerv2(output [1:N]z, input clock, input enable, input [1:N]inval);
    parameter N = 2;

    reg [1:N] state;

    initial
        begin
            state = 0;
        end

    always @(posedge clock)
        begin
            if(enable) state <= inval;
        end

    assign
        z = state;
endmodule //registerv2