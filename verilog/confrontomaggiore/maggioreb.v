module maggiore(output reg gt, input [N-1:0] x, input [N-1:0] y)
  parameter N = 2;
  always @(x or y)
    begin
      if(x[1] > y[1])
        gt <= 1;
      else
        begin
          if(y[1] > x[1])
            gt <= 0;
          else
    	    begin
              if(x[0] > y[0])
                gt <= 1;
              else
                gt <= 0;
            end
        end
    end
 endmodule //maggiore