// to allocate a register module in a program or another module:
// register #(1) state
// register is the type, #(p1, p2, p3) are the parameters in order
// and state is the variable name.
module register(output reg [1:N]state, input clock, input enable, input [1:N]inval);
                        // reg keyword denotes a flip-flop
    parameter N = 2;

    // initial runs a block when the module is created (initialized)
    initial
        begin
            state = 0;
        end

    // always, similar to 'while true' runs a block when
    // posedge means when the clock becomes positive
    always @(posedge clock)
        begin
            // <= is the asynchronous assignment operator
            // while = is sequential, <= tries to run subsequent
            // assignments at the same time. it is recommended
            // to use asynchronous assignment inside of always blocks
            if(enable) state <= inval;
        end
endmodule //register