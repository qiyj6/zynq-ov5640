# led
set_property IOSTANDARD LVCMOS33 [get_ports gpio_led_tri_io[*]]
set_property PACKAGE_PIN R14 [get_ports gpio_led_tri_io[0]]
set_property PACKAGE_PIN P14 [get_ports gpio_led_tri_io[1]]
set_property PACKAGE_PIN N16 [get_ports gpio_led_tri_io[2]]
set_property IOSTANDARD LVCMOS33 [get_ports led_cam_init]
set_property PACKAGE_PIN M14 [get_ports led_cam_init]
#------------------------------------------------------------------------
#                   HDMI PINS
#------------------------------------------------------------------------
set_property IOSTANDARD TMDS_33 [get_ports HDMI_CLK_P]
set_property IOSTANDARD TMDS_33 [get_ports HDMI_D0_P]
set_property IOSTANDARD TMDS_33 [get_ports HDMI_D1_P]
set_property IOSTANDARD TMDS_33 [get_ports HDMI_D2_P]
set_property IOSTANDARD TMDS_33 [get_ports HDMI_CLK_N]
set_property IOSTANDARD TMDS_33 [get_ports HDMI_D0_N]
set_property IOSTANDARD TMDS_33 [get_ports HDMI_D1_N]
set_property IOSTANDARD TMDS_33 [get_ports HDMI_D2_N]


set_property PACKAGE_PIN L16 [get_ports HDMI_CLK_P]
set_property PACKAGE_PIN L17 [get_ports HDMI_CLK_N]
set_property PACKAGE_PIN K17 [get_ports HDMI_D0_P]
set_property PACKAGE_PIN K18 [get_ports HDMI_D0_N]
set_property PACKAGE_PIN K19 [get_ports HDMI_D1_P]
set_property PACKAGE_PIN J19 [get_ports HDMI_D1_N]
set_property PACKAGE_PIN J18 [get_ports HDMI_D2_P]
set_property PACKAGE_PIN H18 [get_ports HDMI_D2_N]
#---------------------------------------------------------------------------------------
#                       CMOS1 PINS
#---------------------------------------------------------------------------------------

set_property PACKAGE_PIN H16 [get_ports clk_125m]
set_property IOSTANDARD LVCMOS33 [get_ports clk_125m]

set_property PACKAGE_PIN T10 [get_ports cam_scl]
set_property IOSTANDARD LVCMOS33 [get_ports cam_scl]

set_property PACKAGE_PIN W13 [get_ports cam_sda]
set_property IOSTANDARD LVCMOS33 [get_ports cam_sda]
set_property PULLUP true [get_ports cam_sda]

set_property PACKAGE_PIN  L19 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]

set_property PACKAGE_PIN  Y18 [get_ports cam_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports cam_rst_n]
#---------------------------------------------------------
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports cmos_xclk_o]
set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVCMOS33} [get_ports cmos_pclk_i]
#------------------------------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports cmos_vsync_i]
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports cmos_href_i]
#------------------------------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {cmos_data_i[0]}]
set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVCMOS33} [get_ports {cmos_data_i[1]}]
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports {cmos_data_i[2]}]
set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS33} [get_ports {cmos_data_i[3]}]
set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports {cmos_data_i[4]}]
set_property -dict {PACKAGE_PIN Y17 IOSTANDARD LVCMOS33} [get_ports {cmos_data_i[5]}]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {cmos_data_i[6]}]
set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports {cmos_data_i[7]}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets cmos_pclk_i_IBUF]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets cmos_pclk_i]

