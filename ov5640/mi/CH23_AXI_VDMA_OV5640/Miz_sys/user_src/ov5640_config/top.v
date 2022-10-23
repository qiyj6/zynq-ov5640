module cam_config_top(

    input clk_50m,
    input rst_n,
    output cam_init_done,

    input                 cam_pclk    ,  //cmos 锟斤拷锟斤拷锟斤拷锟斤拷时锟斤拷
    input                 cam_vsync   ,  //cmos 锟斤拷同锟斤拷锟斤拷??
    input                 cam_href    ,  //cmos 锟斤拷同锟斤拷锟斤拷??
    input        [7:0]    cam_data    ,  //cmos 锟斤拷锟斤拷  
    output                cam_rst_n   ,  //cmos 锟斤拷位锟脚号ｏ拷锟酵碉拷平锟斤拷效
    output                cam_pwdn    ,  //cmos 锟斤拷源锟斤拷锟斤拷模式选锟斤拷锟脚猴拷
    output                cam_scl     ,  //cmos SCCB_SCL??
    output                cam_xclk    ,
    inout                 cam_sda        //cmos SCCB_SDA??
);

parameter  SLAVE_ADDR = 7'b0111100         ;  //OV5640锟斤拷锟斤拷锟斤拷锟斤拷??7'h3c
parameter  BIT_CTRL   = 1'b1          ;  //OV5640锟斤拷锟街节碉拷????16??  0:8?? 1:16??
parameter  CLK_FREQ   = 26'd50_000_000;  //i2c_dri模锟斤拷锟斤拷锟斤拷锟绞憋拷锟狡碉拷剩锟�50Mhz
parameter  I2C_FREQ   = 18'd250_000   ;  //I2C锟斤拷SCL时锟斤拷频锟斤拷,锟斤拷锟斤拷??400KHz
parameter  CMOS_H_PIXEL = 24'd1024    ;  //CMOS水平锟斤拷锟斤拷锟斤拷锟截革拷锟斤拷,锟斤拷锟斤拷锟斤拷锟斤拷SDRAM锟斤拷锟斤拷锟叫�
parameter  CMOS_V_PIXEL = 24'd768     ;  //CMOS锟斤拷直锟斤拷锟斤拷锟斤拷锟截革拷锟斤拷,锟斤拷锟斤拷锟斤拷锟斤拷SDRAM锟斤拷锟斤拷锟叫�

wire        i2c_dri_clk;
wire        i2c_exec;
wire [23:0] i2c_data;
wire        i2c_done;

i2c_dri 
   #(
    .SLAVE_ADDR         (SLAVE_ADDR),       //锟斤拷锟斤拷锟斤拷???
    .CLK_FREQ           (CLK_FREQ  ),              
    .I2C_FREQ           (I2C_FREQ  )                
    )   u_i2c_dri(   
    .clk                (clk_50m   ),
    .rst_n              (rst_n),   
        
    .i2c_exec           (i2c_exec  ),   
    .bit_ctrl           (BIT_CTRL  ),   
    .i2c_rh_wl          (1'b0),             //锟教讹拷??0锟斤拷只锟矫碉拷锟斤拷IIC锟斤拷锟斤拷锟斤拷写锟斤拷锟斤拷   
    .i2c_addr           (i2c_data[23:8]),   
    .i2c_data_w         (i2c_data[7:0]),   
    .i2c_data_r         (),   
    .i2c_done           (i2c_done),   
    .scl                (cam_scl   ),   
    .sda                (cam_sda   ),   
        
    .dri_clk            (i2c_dri_clk)       //I2C锟斤拷锟斤拷时锟斤拷
);   

i2c_ov5640_rgb565_cfg 
   #(
     .CMOS_H_PIXEL      (CMOS_H_PIXEL),
     .CMOS_V_PIXEL      (CMOS_V_PIXEL)
    )   u_i2c_cfg(   
    .clk                (i2c_dri_clk),
    .rst_n              (rst_n),
    .i2c_done           (i2c_done),
    .i2c_exec           (i2c_exec),
    .i2c_data           (i2c_data),
    .init_done          (cam_init_done)
    );  


endmodule