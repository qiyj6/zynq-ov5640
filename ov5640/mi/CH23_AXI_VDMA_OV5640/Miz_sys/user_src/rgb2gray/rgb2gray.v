module rgb2gray(

    input cmos_pclk_i,
    input [23:0] rgb_i,
    input clk_ce_i,
    input de_i,
    input vs_i,
    input hs_i,
    output reg [23:0] gray_o,
    output reg clk_ce_o,
    output reg de_o,
    output reg vs_o,
    output reg hs_o
);

wire [7:0] gray_o_r;
reg clk_ce_o_r;
reg de_o_r;
reg vs_o_r;
reg hs_o_r;

reg clk_ce_o_rr;
reg de_o_rr;
reg vs_o_rr;
reg hs_o_rr;
reg [15:0]r_temp;
reg [15:0]g_temp;
reg [15:0]b_temp;
reg [23:0]rgb_i_r;

always@(posedge cmos_pclk_i) begin
    rgb_i_r <= rgb_i;
    clk_ce_o_r <= clk_ce_i;
    de_o_r <= de_i;
    vs_o_r <= vs_i;
    hs_o_r <= hs_i;
end

always@(posedge cmos_pclk_i) begin
    r_temp <= rgb_i_r[23:16] * 76;
    g_temp <= rgb_i_r[15:8] * 150;
    b_temp <= rgb_i_r[7:0] * 30;
    clk_ce_o_rr <= clk_ce_o_r;
    de_o_rr <= de_o_r;
    vs_o_rr <= vs_o_r;
    hs_o_rr <= hs_o_r;
end

assign gray_o_r = (r_temp+g_temp+b_temp)>>8;

always@(posedge cmos_pclk_i) begin
    gray_o <= {gray_o_r,gray_o_r,gray_o_r};
    clk_ce_o <= clk_ce_o_rr;
    de_o <= de_o_rr;
    vs_o <= vs_o_rr;
    hs_o <= hs_o_rr;
end

endmodule