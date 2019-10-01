module test_mux();

reg my_x, my_y, my_ic;
wire my_z;

mux mymux(my_z, my_x, my_y, my_ic);

    initial
        begin
            // Dump log to a file
            $dumpfile("provamux.vcd");
            $dumpvars;
            my_x = 0;
            my_y = 0;
            my_ic = 1;

            #10
                my_x = 1;

            $finish;
        end
endmodule // test_mux
