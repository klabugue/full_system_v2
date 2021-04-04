`timescale 1ns / 1ps

module intc(
input wire clk,
input wire iack,
input wire rst,
input wire done1,
input wire done2,
input wire done3,
input wire done4,
output [31:0] EAddr,
output irq

    );
    
    wire done1_out, done2_out, done3_out, done4_out;
    wire iack_out;
    wire [3:0] done_main;
    assign done_main = {done4_out, done3_out, done2_out, done1_out};
    
    pr_enc pr_enc(
        .clk (clk),
        .rst (rst),
        .done (done_main),
        .EAddr(EAddr),
        .irq(irq)
    );
    
    ff # (1) done1_reg(
        .clk(clk),
        .rst(rst),
        .en(done1),
        .q(done1_out)
    );
    
     ff # (1) done2_reg(
        .clk(clk),
        .rst(rst),
        .en(done2),
        .q(done2_out)
    );
    
    ff # (1) done3_reg(
        .clk(clk),
        .rst(rst),
        .en(done3),
        .q(done3_out)
   );
   
   ff # (1) done4_reg(
        .clk(clk),
        .rst(rst),
        .en(done4),
        .q(done4_out)
  );
  
  ff iack_reg(
       .clk(clk),
       .rst(rst),
       .en(iack),
       .q(iack_out)
 );

endmodule
