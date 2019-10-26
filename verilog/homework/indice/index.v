module index (
    input [N-1:0] x,
    output logic [$clog2(N):0] z
);

parameter N = 8;
reg [$clog2(N):0] i;

always @(x)
    if(x == 0)
        z <= ~0; // set all output bits to 1
    else
        for (i = 0; i < N; i++) begin
        if(x[i])
            z <= i;
        end


endmodule // index