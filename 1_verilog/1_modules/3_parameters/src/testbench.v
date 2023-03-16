`timescale 1ns/1ps


module testbench ();

   // DECLARE SIGNALS
   reg clk;     // "reg" type signals are  controlled
   reg [3:0] a;  // by the testbench
   reg [3:0] b;
   reg [3:0] c;
   reg [3:0] d;


   wire [5:0] sum;  // "wire" type signals are controlled
                    // by the module being tested
   
   integer clk_count = 0;   // Clock counter to keep track of elapsed time
       
   // INSTANTIATE the DEVICE UNDER TEST (DUT)
   top DUT(
	   .clk(clk),
	   .a(a),
	   .b(b),
	   .c(c),
	   .d(d),
	   .sum(sum)
	   );

   // INITIAL SIGNAL CONFIGURATION:
   initial begin
      clk = 0;      
      a   = 0;
      b   = 0;      
      c   = 0;      
      d   = 0;      
   end

   // GENERATE CLOCK:
   initial forever #10 clk = ~clk;
   
   // CREATE STIMULI:
   always @(posedge clk) begin
      a <= $random();
      b <= $random();
      c <= $random();
      d <= $random();
   end


   // WRITE OUTPUT TO CONSOLE:
   integer fid;
   initial fid = $fopen("test_result.txt", "w");
   
   always @(posedge clk) begin
      $write("clk:   %d",     clk_count);      
      $write("\ta:   %d(%b)", a,a);
      $write("\tb:   %d(%b)", b,b);
      $write("\tc:   %d(%b)", c,c);
      $write("\td:   %d(%b)", d,d);
      $write("\tsum: %d(%b)", sum,sum);
      $write("\n");
      
      $fwrite(fid,"clk:   %d",     clk_count);      
      $fwrite(fid,"\ta:   %d(%b)", a,a);
      $fwrite(fid,"\tb:   %d(%b)", b,b);
      $fwrite(fid,"\tc:   %d(%b)", c,c);
      $fwrite(fid,"\td:   %d(%b)", d,d);
      $fwrite(fid,"\tsum: %d(%b)", sum,sum);
      $fwrite(fid,"\n");      
   end

   // DEFINE WHEN TO TERMINATE SIMULATION:
   always @(posedge clk) begin
      clk_count <= clk_count + 1;
      if (clk_count == 8) begin
	 $fclose(fid);
	 $finish;
      end
   end
   
endmodule // testbench
