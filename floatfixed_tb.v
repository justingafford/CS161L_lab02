`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:09:55 04/12/2020
// Design Name:   fixedpoint
// Module Name:   C:/Users/justi/Desktop/Justin/lab02/floatfixed_tb.v
// Project Name:  lab02
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fixedpoint
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

//the following code is a modified version of the code from the test bench of lab 1.

module floatfixedtb;

	// Inputs
	reg clk ; 
	reg rst ; 
	reg [31:0] binaryNumber;
	reg [4:0] decimalPlace;
	reg  opcode ; 
	
	wire [31:0] myResult;
	reg [31:0] outputR ;
	
	// ---------------------------------------------------
	// Instantiate the Unit Under Test (UUT)
	// --------------------------------------------------- 
	
	floatfixed uut (
	   .clk( clk ) , 
      .rst(rst) , 		
		.binaryNumber(binaryNumber), 
		.decimalPlace(decimalPlace),
		.opcode(opcode) , 
		.result(myResult)
	);
  
  initial begin 
	
	 clk = 0 ; rst = 1 ; #50 ; 
	 clk = 1 ; rst = 1 ; #50 ; 
	 clk = 0 ; rst = 0 ; #50 ; 
	 clk = 1 ; rst = 0 ; #50 ; 
	  
	 forever begin 
		clk = ~clk; #50 ; 
	 end 
	 
	end 
	
	initial begin
  
  //Here we initialize the parameters
   opcode = 1'b0; 
	decimalPlace = 4'b0000;
	binaryNumber = { 32'h0 } ; 
	outputR           = { 32'h0 } ;
  
  #100 ; 		
		
// TEST 1(25.25 = 11001_01) 	
		opcode = 1'b0; 
		decimalPlace = 5'b11001;
		binaryNumber = { {12'b0011001_01000} , { 20'h00000 }   } ; 
		outputR = 32'b0_10000011_10010100000000000000000;
    #100;
    $display (" TEST 01 ....... %h %h ", outputR,  myResult ); 
    if ( outputR != myResult ) $display ("Failed TEST 01 ....... %h %h ", outputR,  myResult ); 
    
// TEST 2
    opcode = 1'b1; 
		decimalPlace = 4'b0111;
		binaryNumber = 32'b0_01111111_10000000000000000000000;
		R = { {24'h000000}, {8'b1100_0000}  } ;  
    #100; 
    $display (" TEST 02 ....... %h %h ", outputR,  myResult ); 
    if ( outputR != myResult ) $display ("Failed TEST 02 ....... %h %h ", outputR,  myResult ); 
    
//TEST 3
		opcode = 1'b1; 
		decimalPlace = 5'b0010;
		binaryNumber = 32'b0_0111_1110_10000000000000000000000; 
		outputR = { {20'h00000}, {12'h003}  } ; 
    #100;
    $display (" TEST 03 ....... %h %h ", outputR,  myResult ); 
		if ( outputR != myResult ) $display ("Failed TEST 03 ....... %h %h ", outputR,  myResult );     
		 
//TEST 4
		opcode = 1'b1;  
		binaryNumber = 32'b0_10000010_00001000000000000000000; 
		decimalPlace = 5'b00111;
		outputR = { {16'h0000}, {16'b0000_0100_0010_0000}} ; 
    #100;
    $display (" TEST 04 ....... %h %h ", outputR,  myResult ); 
		if ( outputR != myResult ) $display ("Failed TEST 04 ....... %h %h ", outputR,  myResult );
		
// TEST 5(1.5)
		opcode = 1'b0; 
		decimalPlace = 4'b0111;
		binaryNumber = { {24'h000000}, {8'b1100_0000}  } ; 
		outputR = 32'b0_01111111_10000000000000000000000;
    #100;
    $display (" TEST 05 ....... %h %h ", outputR,  myResult ); 
		if ( outputR != myResult ) $display ("Failed TEST 05 ....... %h %h ", outputR,  myResult );
    
//TEST 6(0.75)
		opcode = 1'b0; 
		decimalPlace = 5'b0010;
		binaryNumber = { {20'h00000}, {12'h003}  } ; 
		outputR = 32'b0_0111_1110_10000000000000000000000;		
    #100;
    $display (" TEST 06 ....... %h %h ", outputR,  myResult ); 
		if ( outputR != myResult ) $display ("Failed TEST 06 ....... %h %h ", outputR,  myResult ); 
    
//TEST 7(6.3125)
		opcode = 1'b0; 
		decimalPlace = 4'b0100;
		binaryNumber = { {24'h000000}, {8'b0110_0101}  } ; 
		outputR = 32'b0_10000001_10010100000000000000000;
    #100;
    $display (" TEST 07 ....... %h %h ", outputR,  myResult ); 
		if ( outputR != myResult ) $display ("Failed TEST 07 ....... %h %h ", outputR,  myResult ); 
    
//TEST 8
		opcode = 1'b1; 
		decimalPlace = 5'b11001;
		binaryNumber = 32'b0_10000011_10010100000000000000000;
		outputR = { {12'b0011001_01000} , { 20'h00000 }  } ;  
    #100; 
    $display (" TEST 08 ....... %h %h ", R,  myResult ); 
		if ( outputR != myResult ) $display ("Failed TEST 08 ....... %h %h ", R,  myResult ); 
    
//TEST 9(Working with 1056 - 4)

		opcode = 1'b0;  
		binaryNumber = { {16'h0000}, {16'b0100_0010_0000_0000}} ; 
		decimalPlace = 5'b0100;
		outputR = 32'b0_10001001_00001000000000000000000 ; 		
    #100;
    $display (" TEST 09 ....... %h %h ", outputR,  myResult ); 
		if ( outputR != myResult ) $display ("Failed TEST 09 ....... %h %h ", outputR,  myResult ); 
    

//TEST 10
		opcode = 1'b1; 
		decimalPlace = 5'b0001;
		binaryNumber = 32'b0_10001000_00000000000000000000000 ;
		outputR = { {20'h00000}, {12'h400}  } ;  
    #100;
    $display (" TEST 10 ....... %h %h ", outputR,  myResult ); 
		if ( outputR != myResult ) $display ("Failed TEST 10 ....... %h %h ", outputR,  myResult );
    
//TEST 11
		opcode = 1'b1; 
		decimalPlace = 4'b0100;
		binaryNumber = 32'b0_10000001_10010100000000000000000;
		outputR = { {24'h000000}, {8'b0110_0101}  } ;  
		#100; 
    $display (" TEST 11 ....... %h %h ", outputR,  myResult ); 
		if ( outputR != myResult ) $display ("Failed TEST 11 ....... %h %h ", outputR,  myResult ); 	
    
// TEST 12(12.625)
		opcode = 1'b0; 
		decimalPlace = 4'b0011;
		binaryNumber = { {24'h000000}, {8'b01100_101}  } ; 
		outputR = 32'b0_10000010_10010100000000000000000;
    #100;
    $display (" TEST 12 ....... %h %h ", outputR,  myResult ); 
	  if ( outputR != myResult ) $display ("Failed TEST 12 ....... %h %h ", outputR,  myResult ); 
    
// TEST 13(512.0)
		opcode = 1'b0; 
		decimalPlace = 5'b0001;
		binaryNumber = { {20'h00000}, {12'h400}  } ; 
		outputR = 32'b0_10001000_00000000000000000000000;
    #100;
    $display (" TEST 13 ....... %h %h ", outputR,  myResult ); 
		if ( outputR != myResult ) $display ("Failed TEST 13 ....... %h %h ", outputR,  myResult );  
    
//TEST 14		
		opcode = 1'b1;  
		binaryNumber = 32'b0_10001001_00001000000000000000000 ; 
		decimalPlace = 5'b0100;
		outputR = { {16'h0000}, {16'b0100_0010_0000_0000}} ; 
    #100;
    $display (" TEST 14 ....... %h %h ", outputR,  myResult ); 
		if ( outputR != myResult ) $display ("Failed TEST 14 ....... %h %h ", outputR,  myResult ); 
    
//TEST 15(1056 (Pos 7) TO (8.25))
		opcode = 1'b0;  
		binaryNumber = { {16'h0000}, {16'b0000_0100_0010_0000}} ; 
		decimalPlace = 5'b00111;
		outputR = 32'b0_10000010_00001000000000000000000; 	
    #100;
    $display (" TEST 15 ....... %h %h ", outputR,  myResult ); 
		if ( outputR != myResult ) $display ("Failed TEST 15 ....... %h %h ", outputR,  myResult ); 
    
//TEST 16
		opcode = 1'b1; 
		decimalPlace = 4'b0011;
		binaryNumber = 32'b0_10000010_10010100000000000000000; 
		outputR = { {24'h000000}, {8'b01100_101}  } ;  
    #100;
    $display (" TEST 16 ....... %h %h ", outputR,  myResult ); 
		if ( outputR != myResult ) $display ("Failed TEST 16 ....... %h %h ", outputR,  myResult );     
    
 
    
	end
endmodule
