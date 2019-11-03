/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_2 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  wire [1-1:0] M_button_cond_out;
  reg [1-1:0] M_button_cond_in;
  button_conditioner_3 button_cond (
    .clk(clk),
    .in(M_button_cond_in),
    .out(M_button_cond_out)
  );
  wire [1-1:0] M_edge_detector2_out;
  reg [1-1:0] M_edge_detector2_in;
  edge_detector_2 edge_detector2 (
    .clk(clk),
    .in(M_edge_detector2_in),
    .out(M_edge_detector2_out)
  );
  wire [1-1:0] M_button_cond2_out;
  reg [1-1:0] M_button_cond2_in;
  button_conditioner_3 button_cond2 (
    .clk(clk),
    .in(M_button_cond2_in),
    .out(M_button_cond2_out)
  );
  wire [1-1:0] M_edge_detector3_out;
  reg [1-1:0] M_edge_detector3_in;
  edge_detector_2 edge_detector3 (
    .clk(clk),
    .in(M_edge_detector3_in),
    .out(M_edge_detector3_out)
  );
  wire [1-1:0] M_button_cond3_out;
  reg [1-1:0] M_button_cond3_in;
  button_conditioner_3 button_cond3 (
    .clk(clk),
    .in(M_button_cond3_in),
    .out(M_button_cond3_out)
  );
  wire [16-1:0] M_adder_result;
  wire [1-1:0] M_adder_z;
  wire [1-1:0] M_adder_v;
  wire [1-1:0] M_adder_n;
  reg [1-1:0] M_adder_rst;
  reg [24-1:0] M_adder_io_dip;
  reg [16-1:0] M_adder_a;
  reg [16-1:0] M_adder_b;
  adder_8 adder (
    .clk(clk),
    .rst(M_adder_rst),
    .io_dip(M_adder_io_dip),
    .a(M_adder_a),
    .b(M_adder_b),
    .result(M_adder_result),
    .z(M_adder_z),
    .v(M_adder_v),
    .n(M_adder_n)
  );
  
  reg [15:0] a;
  
  reg [15:0] b;
  
  reg [7:0] add;
  
  reg [7:0] sub;
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_button_cond_in = io_button[3+0-:1];
    M_edge_detector_in = M_button_cond_out;
    M_button_cond2_in = io_button[4+0-:1];
    M_edge_detector2_in = M_button_cond2_out;
    M_button_cond3_in = io_button[1+0-:1];
    M_edge_detector3_in = M_button_cond3_out;
    a = 1'h0;
    b = 1'h0;
    out = 1'h0;
    z = 1'h0;
    v = 1'h0;
    n = 1'h0;
    if (M_edge_detector_out == 1'h1) begin
      a[8+7-:8] = io_dip[8+7-:8];
      a[0+7-:8] = io_dip[0+7-:8];
      io_led[8+7-:8] = a[8+7-:8];
      io_led[0+7-:8] = a[0+7-:8];
    end
    if (M_edge_detector2_out == 1'h1) begin
      b[8+7-:8] = io_dip[8+7-:8];
      b[0+7-:8] = io_dip[0+7-:8];
      io_led[8+7-:8] = b[8+7-:8];
      io_led[0+7-:8] = b[0+7-:8];
    end
    add = 1'h0;
    sub = add + 1'h1;
    M_adder_a = a;
    M_adder_b = b;
    M_adder_io_dip = io_dip;
    M_adder_rst = rst;
    if (M_edge_detector3_out == 1'h1 & (io_dip[16+7-:8] == add | io_dip[16+7-:8] == sub)) begin
      out = M_adder_result;
      z = M_adder_z;
      v = M_adder_v;
      n = M_adder_n;
      io_led[8+7-:8] = M_adder_result[8+7-:8];
      io_led[0+7-:8] = M_adder_result[0+7-:8];
    end
  end
endmodule
