module cam_config_top(

    input clk_50m,
    input rst_n,
    output cam_init_done,

    input                 cam_pclk    ,  //cmos 闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔告灮閹风兘鏁撻弬銈嗗閺冨爼鏁撻弬銈嗗
    input                 cam_vsync   ,  //cmos 闁跨喐鏋婚幏宄版倱闁跨喐鏋婚幏鐑芥晸閺傘倖瀚�??
    input                 cam_href    ,  //cmos 闁跨喐鏋婚幏宄版倱闁跨喐鏋婚幏鐑芥晸閺傘倖瀚�??
    input        [7:0]    cam_data    ,  //cmos 闁跨喐鏋婚幏鐑芥晸閺傘倖瀚�  
    output                cam_rst_n   ,  //cmos 闁跨喐鏋婚幏铚傜秴闁跨喕鍓奸崣鍑ょ秶閹风兘鏁撻柊鐢殿暜閹峰嘲閽╅柨鐔告灮閹烽攱鏅�
    output                cam_pwdn    ,  //cmos 闁跨喐鏋婚幏閿嬬爱闁跨喐鏋婚幏鐑芥晸閺傘倖瀚瑰Ο鈥崇础闁鏁撻弬銈嗗闁跨喕鍓奸悮瀛樺
    output                cam_scl     ,  //cmos SCCB_SCL??
    output                cam_xclk    ,
    inout                 cam_sda        //cmos SCCB_SDA??
);

parameter  SLAVE_ADDR = 7'b0111100         ;  //OV5640闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔告灮閹风兘鏁撻弬銈嗗??7'h3c
parameter  BIT_CTRL   = 1'b1          ;  //OV5640闁跨喐鏋婚幏鐑芥晸鐞涙濡喊澶嬪????16??  0:8?? 1:16??
parameter  CLK_FREQ   = 26'd50_000_000;  //i2c_dri濡繝鏁撻弬銈嗗闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔虹哺閹插瀚归柨鐔哄珱绾板瀚归崜鈺呮晸閿燂拷50Mhz
parameter  I2C_FREQ   = 18'd250_000   ;  //I2C闁跨喐鏋婚幏绋碈L閺冨爼鏁撻弬銈嗗妫版垿鏁撻弬銈嗗,闁跨喐鏋婚幏鐑芥晸閺傘倖瀚�??400KHz
parameter  CMOS_H_PIXEL = 24'd1280    ;  //CMOS濮樻潙閽╅柨鐔告灮閹风兘鏁撻弬銈嗗闁跨喐鏋婚幏鐑芥晸閹搭亪娼婚幏鐑芥晸閺傘倖瀚�,闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔告灮閹风兘鏁撻弬銈嗗SDRAM闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔峰建閿燂拷
parameter  CMOS_V_PIXEL = 24'd720     ;  //CMOS闁跨喐鏋婚幏椋庢纯闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔告灮閹风兘鏁撻幋顏堟交閹风兘鏁撻弬銈嗗,闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔告灮閹风兘鏁撻弬銈嗗SDRAM闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔峰建閿燂拷

wire        i2c_dri_clk;
wire        i2c_exec;
wire [23:0] i2c_data;
wire        i2c_done;

i2c_dri 
   #(
    .SLAVE_ADDR         (SLAVE_ADDR),       //闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔告灮閹凤拷???
    .CLK_FREQ           (CLK_FREQ  ),              
    .I2C_FREQ           (I2C_FREQ  )                
    )   u_i2c_dri(   
    .clk                (clk_50m   ),
    .rst_n              (rst_n),   
        
    .i2c_exec           (i2c_exec  ),   
    .bit_ctrl           (BIT_CTRL  ),   
    .i2c_rh_wl          (1'b0),             //闁跨喐鏆€鐠佽瀚�??0闁跨喐鏋婚幏宄板涧闁跨喓鐓喊澶嬪闁跨喐鏋婚幏绋㊣C闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔告灮閹峰嘲鍟撻柨鐔告灮閹风兘鏁撻弬銈嗗   
    .i2c_addr           (i2c_data[23:8]),   
    .i2c_data_w         (i2c_data[7:0]),   
    .i2c_data_r         (),   
    .i2c_done           (i2c_done),   
    .scl                (cam_scl   ),   
    .sda                (cam_sda   ),   
        
    .dri_clk            (i2c_dri_clk)       //I2C闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归弮鍫曟晸閺傘倖瀚�
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