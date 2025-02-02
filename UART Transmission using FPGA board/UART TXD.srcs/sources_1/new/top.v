`timescale 1ns / 1ps

module top(
input send,//when to start transmission of data
input clk,//100 mhz
output uart_tx
    );
 //   100 MHz / 9600 = 10416
parameter bit_tmr_max = 10416;
parameter bit_index_max = 10;

parameter rdy = 0, load_bit =1, send_bit = 2;

reg [13:0] bitTmr = 0;
reg bitDone;
reg [3:0] bitIndex;
reg txBit = 1'b1;
reg [9:0] txData;
reg [1:0] state = rdy; 

// Generating Bit rate

   always@(posedge clk) begin
        if(state ==  rdy)
                bitTmr <= 0;
         else begin   
                 if(bitTmr == bit_tmr_max) begin
                    bitDone <= 1'b1;
                    bitTmr <= 0; 
                   end
                else begin
                   bitTmr <= bitTmr + 1; 
                   bitDone <= 1'b0; 
                 end    
        end
 end
         




////Next State Process 
    always@(posedge clk)  begin  
            case(state)
                 rdy : begin
                      txBit <= 1'b1;
                      bitIndex <= 0;
                     if(send == 1'b1) begin
                         state <= load_bit;
                         txData <= {1'b1,8'h41,1'b0};
                         end 
                      else
                          state <= rdy;
                     end
                 load_bit:begin 
                       bitIndex <= bitIndex + 1;
                       txBit <= txData[bitIndex]; 
                       state <= send_bit;
                  end
                  send_bit: begin
                     if(bitDone == 1'b1) begin
                        if(bitIndex == bit_index_max) 
                             state <= rdy;
                         else
                              state <= load_bit;
                        end
                        end
                   default : state <= rdy;    
            endcase
       end

  
assign uart_tx = txBit;              

        
endmodule





