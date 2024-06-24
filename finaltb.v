`timescale 1ps/1ps
module tb;
  reg clk, reset;
  reg [9:0] inaddress;
  wire [15:0] outdata;
  integer k;

  risc_processor inst1(
    .inaddress(inaddress),
    .clk(clk),
    .reset(reset),
    .outdata(outdata)
  );

  // Provide a clock signal
  always #5 clk = ~clk;

  // Initialize signals
  initial begin
    clk = 0;
    reset = 0;
  end

  // Monitor the output
  initial begin
//use the below code for testing gcd ,comment this code if you want to test sorting of numbers
     $monitor($time," MEMORY:mem[0]=%d,mem[1]=%d,mem[3]=%d,reg[0]= %d,reg[1]= %d,reg[2]=%d,reg[3]=%d,reg[4]=%d",inst1.dpath.dmem.dmem[0],
              inst1.dpath.dmem.dmem[1],inst1.dpath.dmem.dmem[2],inst1.dpath.rbank.regfile[0],
             inst1.dpath.rbank.regfile[1],inst1.dpath.rbank.regfile[2],inst1.dpath.rbank.regfile[3],inst1.dpath.rbank.regfile[4]);
       #5200
       inaddress=0;
        #20
       $display("mem[0]=",outdata);
      
       inaddress=1;
        #20
        $display("mem[1]=",outdata);
         
       inaddress=2;
        #20
        $display("mem[3]=",outdata);
        
        
//use the below code for testing sorting of numbers ,comment this code if you want to test gcd of  two numbers
   
//    $monitor($time," Array:mem[0]=%d,mem[1]=%d,mem[2]=%d,mem[3]=%d,mem[4]=%d,mem[5]=%d,mem[6]=%d,mem[7]=%d,mem[8]=%d,mem[9]=%d",dut.dpath.dmem.dmem[100],
//    dut.dpath.dmem.dmem[101],dut.dpath.dmem.dmem[102],dut.dpath.dmem.dmem[103],
//    dut.dpath.dmem.dmem[104],dut.dpath.dmem.dmem[105],dut.dpath.dmem.dmem[106],
//    dut.dpath.dmem.dmem[107],dut.dpath.dmem.dmem[108],dut.dpath.dmem.dmem[109]);
    
    

//    #100000000 $finish; // Finish the simulation after 10000 time units
  end

endmodule