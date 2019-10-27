module test();
    reg [7:0] x;
    wire [$clog2(7):0] z;

    index p (x, z);

    initial
        begin
            $dumpfile("test.vcd");
            $dumpvars;

            x = 8'b10000000;
            #1 x = 8'b01000000;
            #1 x = 8'b00100000;
            #1 x = 8'b00010000;
            #1 x = 8'b00001000;
            #1 x = 8'b00000100;
            #1 x = 8'b00000010;
            #1 x = 8'b00000001;
            #1 x = 8'b00000000;
            #1 x = 8'b01010010;
            #1 x = 8'b01011010;
            #1 x = 8'b01000001;
            #1 x = 8'b11010000;
            #1 x = 8'b10110110;
            #1 x = 8'b00000000;
        end
endmodule // test