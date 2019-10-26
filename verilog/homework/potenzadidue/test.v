module test();
    reg [0:7] x;
    wire z;

    potenzadidue p (z, x);

    initial
        begin
            $dumpfile("test.vcd");
            $dumpvars;

            x = 8'b10000000; // z = 1
            #1 x = 8'b01000000; // z = 1
            #1 x = 8'b00100000; // z = 1
            #1 x = 8'b00010000; // z = 1
            #1 x = 8'b00001000; // z = 1
            #1 x = 8'b00000100; // z = 1
            #1 x = 8'b00000010; // z = 1
            #1 x = 8'b00000001; // z = 0
            #1 x = 8'b01010010; // z = 0
            #1 x = 8'b01011010; // z = 0
            #1 x = 8'b01000001; // z = 0
            #1 x = 8'b11010000; // z = 0
            #1 x = 8'b10110110; // z = 0
        end
endmodule //test