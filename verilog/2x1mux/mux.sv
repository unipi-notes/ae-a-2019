module mux (output logic z, input logic x, y, ic );
    assign z = (ic == 0 ? x : y);
endmodule