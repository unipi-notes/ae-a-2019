module testautomata();
    reg [1:2] x;

    initial
        clock = 0;

    // Clock loop
    always
        begin
            // Wait two units of time and assign 1 to clock
            #2 clock = 1;
            #1 clock = 0;
        end

    initial
        begin
            
        end

endmodule