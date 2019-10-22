module mul(output [7:0]z, // 8 bit number result
    input [3:0] x,  // 2 4-bit numbers input
    input [3:0] y);

    wire [11:0] c;  // carry wire
    wire [6:1]  w;  // adder result wire

    assign
        z[0] = x[0]&y[0];   // first bit of output (least significative)
        // is just AND between the first bits of the two inputs

    // first row of adders
        //carryout  output  addend1     addend2     carryin
    ha h1(c[0],     z[1],   x[1]&y[0],  x[0]&y[1]);        // second bit of output
    fa f2(c[1],     w[1],   x[2]&y[0],  x[1]&y[1],  c[0]);
    fa f3(c[2],     w[2],   x[3]&y[0],  x[2]&y[1],  c[1]);
    ha h4(c[3],     w[3],   x[3]&y[1],  c[2]);

    // second row of adders
    ha h5(c[4],     z[2],   w[1],       x[0]&y[2]);        // third bit of output
    fa f6(c[5],     w[4],   w[2],       x[1]&y[2],  c[0]);
    fa f7(c[6],     w[5],   w[3],       x[2]&y[2],  c[1]);
    fa f8(c[7],     w[6],   c[3],       x[3]&y[2],  c[6]);

    // third row of adders
    ha h9(c[8],     z[3],   w[4],       x[0]&y[3]);        // third bit of output
    fa f10(c[9],    z[4],   w[5],       x[1]&y[3],  c[8]);
    fa f11(c[10],   z[5],   w[6],       x[2]&y[3],  c[9]);
    fa f12(z[7],    z[6],   c[7],       x[3]&y[3],  c[10]);
    // on last bit, carry out is the last bit of output

endmodule //mul4bit