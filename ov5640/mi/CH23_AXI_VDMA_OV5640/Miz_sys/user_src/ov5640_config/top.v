module cam_config_top(

    input clk_50m,
    input rst_n,
    output cam_init_done,

    input                 cam_pclk    ,  //cmos 数据像素时钟
    input                 cam_vsync   ,  //cmos 场同步信??
    input                 cam_href    ,  //cmos 行同步信??
    input        [7:0]    cam_data    ,  //cmos 数据  
    output                cam_rst_n   ,  //cmos 复位信号，低电平有效
    output                cam_pwdn    ,  //cmos 电源休眠模式选择信号
    output                cam_scl     ,  //cmos SCCB_SCL??
    output                cam_xclk    ,
    inout                 cam_sda        //cmos SCCB_SDA??
);

parameter  SLAVE_ADDR = 7'b0111100         ;  //OV5640的器件地??7'h3c
parameter  BIT_CTRL   = 1'b1          ;  //OV5640的字节地????16??  0:8?? 1:16??
parameter  CLK_FREQ   = 26'd50_000_000;  //i2c_dri模块的驱动时钟频率：50Mhz
parameter  I2C_FREQ   = 18'd250_000   ;  //I2C的SCL时钟频率,不超??400KHz
parameter  CMOS_H_PIXEL = 24'd1280    ;  //CMOS水平方向像素个数,用于设置SDRAM缓存大小
parameter  CMOS_V_PIXEL = 24'd720     ;  //CMOS垂直方向像素个数,用于设置SDRAM缓存大小

wire        i2c_dri_clk;
wire        i2c_exec;
wire [23:0] i2c_data;
wire        i2c_done;

i2c_dri 
   #(
    .SLAVE_ADDR         (SLAVE_ADDR),       //参数传???
    .CLK_FREQ           (CLK_FREQ  ),              
    .I2C_FREQ           (I2C_FREQ  )                
    )   u_i2c_dri(   
    .clk                (clk_50m   ),
    .rst_n              (rst_n),   
        
    .i2c_exec           (i2c_exec  ),   
    .bit_ctrl           (BIT_CTRL  ),   
    .i2c_rh_wl          (1'b0),             //固定??0，只用到了IIC驱动的写操作   
    .i2c_addr           (i2c_data[23:8]),   
    .i2c_data_w         (i2c_data[7:0]),   
    .i2c_data_r         (),   
    .i2c_done           (i2c_done),   
    .scl                (cam_scl   ),   
    .sda                (cam_sda   ),   
        
    .dri_clk            (i2c_dri_clk)       //I2C操作时钟
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