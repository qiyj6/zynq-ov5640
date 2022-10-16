// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:cam_config_top:1.0
// IP Revision: 1

(* X_CORE_INFO = "cam_config_top,Vivado 2020.1" *)
(* CHECK_LICENSE_TYPE = "system_cam_config_top_0_0,cam_config_top,{}" *)
(* CORE_GENERATION_INFO = "system_cam_config_top_0_0,cam_config_top,{x_ipProduct=Vivado 2020.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=cam_config_top,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,SLAVE_ADDR=0111100,BIT_CTRL=1,CLK_FREQ=10111110101111000010000000,I2C_FREQ=111101000010010000,CMOS_H_PIXEL=0x000400,CMOS_V_PIXEL=0x000300}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_cam_config_top_0_0 (
  clk_50m,
  rst_n,
  cam_init_done,
  cam_pclk,
  cam_vsync,
  cam_href,
  cam_data,
  cam_rst_n,
  cam_pwdn,
  cam_scl,
  cam_xclk,
  cam_sda
);

input wire clk_50m;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *)
input wire rst_n;
output wire cam_init_done;
input wire cam_pclk;
input wire cam_vsync;
input wire cam_href;
input wire [7 : 0] cam_data;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME cam_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 cam_rst_n RST" *)
output wire cam_rst_n;
output wire cam_pwdn;
output wire cam_scl;
output wire cam_xclk;
inout wire cam_sda;

  cam_config_top #(
    .SLAVE_ADDR(7'B0111100),
    .BIT_CTRL(1'B1),
    .CLK_FREQ(26'B10111110101111000010000000),
    .I2C_FREQ(18'B111101000010010000),
    .CMOS_H_PIXEL(24'H000400),
    .CMOS_V_PIXEL(24'H000300)
  ) inst (
    .clk_50m(clk_50m),
    .rst_n(rst_n),
    .cam_init_done(cam_init_done),
    .cam_pclk(cam_pclk),
    .cam_vsync(cam_vsync),
    .cam_href(cam_href),
    .cam_data(cam_data),
    .cam_rst_n(cam_rst_n),
    .cam_pwdn(cam_pwdn),
    .cam_scl(cam_scl),
    .cam_xclk(cam_xclk),
    .cam_sda(cam_sda)
  );
endmodule
