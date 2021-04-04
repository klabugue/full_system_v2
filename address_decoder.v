`timescale 1ns / 1ps
module address_decoder(
  input WE,
  input [31:0] A,
  output wire WE1, WE2, WE3, WEM,
  output wire [2:0] RdSel
);
// WE1, WE2, WE3, WEM, RdSel
reg [6:0] ctrl_signals;

  always @ (*) begin
    casex (A[11:8])
      // select factorial accelerator
      4'h8:    ctrl_signals = WE ? 7'b1_0_0_0_010 : 7'b0_0_0_0_010;
      // select gpio
      4'h9:    ctrl_signals = WE ? 7'b0_1_0_0_011 : 7'b0_0_0_0_011;
      // select intc
      4'hC:    ctrl_signals = WE ? 7'b0_0_1_0_100 : 7'b0_0_0_0_100;
      // select data memory
      default: ctrl_signals = (A[8:4] >= 5'b0_0000
                                && A[8:4] < 5'b1_0000
                                && WE) ? 7'b0_0_0_1_000 : 7'b0_0_0_0_000;
    endcase
  end

  assign {WE1, WE2, WE3, WEM, RdSel} = ctrl_signals;

endmodule
