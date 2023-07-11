`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:21:38 02/17/2023 
// Design Name: 
// Module Name:    lctrl 
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
module lctrl(
    input Clk,
    input Rst,
    output reg [2:0] Left
    );
	 reg[1:0] nextstate, presentstate;
	 parameter S0 = 2'b00, S1= 2'b01, S2 = 2'b10, S3 = 2'b11;
    reg [25:0] count_div;
    always@(posedge Clk, posedge Rst) begin
   
        if(Rst == 1'b1)
        count_div <= 0;
        else
        count_div <= count_div + 1;
        end
        
     always @(posedge count_div[25], posedge Rst)
     begin
     if(Rst==1)
     presentstate <= S0;
     else
     presentstate <= nextstate;
     end
     
     always@(presentstate)
     begin
     case(presentstate)
     S0:begin
        nextstate=S1;
        end
     S1:begin
        nextstate=S2;
        end 
     S2:begin
        nextstate=S3;
        end 
      S3:begin
         nextstate=S0;
         end
              
   endcase
   end 
   always @(presentstate)
   begin
   case(presentstate)
   S0:Left=4'b0000;
   S1:Left=4'b0001;
   S2:Left=4'b0011;
   S3:Left=4'b0111;
   endcase
   end
endmodule





	 



