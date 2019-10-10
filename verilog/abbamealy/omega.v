// Output module of the Mealy automata finding "abba" in strings of {a,b,c}
// The syntax [1:2] denotes an array indexed from 1 to 2
module omega(output z, input [1:2]s, input [1:2]x)

    // Continuos assignment, z should continuosly be equal to the equation
    assign
        z = (s[1] && ~s[2] && ~x[1] && ~x[2])

endmodule //omega