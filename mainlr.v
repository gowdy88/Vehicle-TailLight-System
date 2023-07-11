`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:59:48 02/17/2023 
// Design Name: 
// Module Name:    mainlr 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mainlr(
    input [1:0] S,//LR
    input Clk,
	 input Rst,
    output reg [2:0] Left,
    output reg [2:0] Right
    );
	  parameter S0 = 2'b00,S1= 2'b01,S2=2'b10,S3=2'b11;
	  parameter T0 = 2'b00,T1= 2'b01,T2=2'b10,T3=2'b11;
	  reg[1:0] nextstate, presentstate;
	  reg [25:0] count_div;
	  always@(posedge Clk, posedge Rst) begin
   
        if(Rst == 1'b1)
        count_div <= 0;
        else
        count_div <= count_div + 1;
        end
	  	 
	 always @(posedge count_div[25] or posedge Rst)
	 begin
	 if(Rst==1)
	 begin
	 Left<=0;
	 Right<=0;
	 end
	 case(S)
	 S0:begin
	 Left<=0;
	 Right<=0;
	 end
	 S1:begin
	 //rctrl (Clk,Rst,Right[2:0]);
	 // @(count_div[25])
	 begin
	  if(Rst==1)
     presentstate <= T0;
     else
     presentstate <= nextstate;
     end
     //@(presentstate)
     begin
     case(presentstate)
     T0:begin
        nextstate<=T1;
        end
     T1:begin
        nextstate<=T2;
        end 
     T2:begin
        nextstate<=T3;
        end 
      T3:begin
         nextstate<=T0;
         end
              
   endcase
   end 
    //@(presentstate)
   begin
   case(presentstate)
   T0:Right<=3'b000;
   T1:Right<=3'b001;
   T2:Right<=3'b011;
   T3:Right<=3'b111;
   endcase
	 
	 end
	 end
	 S2:begin
	 //lctrl (Clk,Rst,Left[2:0]);
	 //@(count_div[25])
	 begin
	 if(Rst==1)
     presentstate <= T0;
     else
     presentstate <= nextstate;
     end
     //@(presentstate)
     begin
     case(presentstate)
     T0:begin
        nextstate<=T1;
        end
     T1:begin
        nextstate<=T2;
        end 
     T2:begin
        nextstate<=T3;
        end 
      T3:begin
         nextstate<=T0;
         end
              
   endcase
   end 
    //@(presentstate)
   begin
   case(presentstate)
   T0:Left<=3'b000;
   T1:Left<=3'b001;
   T2:Left<=3'b011;
   T3:Left<=3'b111;
   endcase
   end
   end
   S3:begin
	 Left<=0;
	 Right<=0;
	 end
	 endcase
	 end
endmodule
