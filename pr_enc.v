`timescale 1ns / 1ps

module pr_enc(
input clk,
input rst,
input [3:0]			done,
output reg [31:0] 	EAddr
    );
    
  always @ (negedge clk) begin
    if(done[0]) begin
        EAddr = 32'h0000002c;  //Should this be 32'h00003000
    end
    else if (done[1]) begin
        EAddr = 32'h00000004;
    end
    else if(done[2]) begin 
        EAddr = 32'h00000008;
    end
    else if(done[3]) begin
        EAddr = 32'h0000000c;
    end
    else
        begin
            EAddr = 32'hxxxxxxxx;
        end
    end
endmodule
