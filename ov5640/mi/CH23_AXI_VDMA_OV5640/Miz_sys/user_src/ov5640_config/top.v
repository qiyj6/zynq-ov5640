module cam_config_top(

    input clk_50m,
    input rst_n,
    output cam_init_done,

    input                 cam_pclk    ,  //cmos ��������ʱ��
    input                 cam_vsync   ,  //cmos ��ͬ����??
    input                 cam_href    ,  //cmos ��ͬ����??
    input        [7:0]    cam_data    ,  //cmos ����  
    output                cam_rst_n   ,  //cmos ��λ�źţ��͵�ƽ��Ч
    output                cam_pwdn    ,  //cmos ��Դ����ģʽѡ���ź�
    output                cam_scl     ,  //cmos SCCB_SCL??
    output                cam_xclk    ,
    inout                 cam_sda        //cmos SCCB_SDA??
);

parameter  SLAVE_ADDR = 7'b0111100         ;  //OV5640��������??7'h3c
parameter  BIT_CTRL   = 1'b1          ;  //OV5640���ֽڵ�????16??  0:8?? 1:16??
parameter  CLK_FREQ   = 26'd50_000_000;  //i2c_driģ�������ʱ��Ƶ�ʣ�50Mhz
parameter  I2C_FREQ   = 18'd250_000   ;  //I2C��SCLʱ��Ƶ��,����??400KHz
parameter  CMOS_H_PIXEL = 24'd1024    ;  //CMOSˮƽ�������ظ���,��������SDRAM�����С
parameter  CMOS_V_PIXEL = 24'd768     ;  //CMOS��ֱ�������ظ���,��������SDRAM�����С

wire        i2c_dri_clk;
wire        i2c_exec;
wire [23:0] i2c_data;
wire        i2c_done;

i2c_dri 
   #(
    .SLAVE_ADDR         (SLAVE_ADDR),       //������???
    .CLK_FREQ           (CLK_FREQ  ),              
    .I2C_FREQ           (I2C_FREQ  )                
    )   u_i2c_dri(   
    .clk                (clk_50m   ),
    .rst_n              (rst_n),   
        
    .i2c_exec           (i2c_exec  ),   
    .bit_ctrl           (BIT_CTRL  ),   
    .i2c_rh_wl          (1'b0),             //�̶�??0��ֻ�õ���IIC������д����   
    .i2c_addr           (i2c_data[23:8]),   
    .i2c_data_w         (i2c_data[7:0]),   
    .i2c_data_r         (),   
    .i2c_done           (i2c_done),   
    .scl                (cam_scl   ),   
    .sda                (cam_sda   ),   
        
    .dri_clk            (i2c_dri_clk)       //I2C����ʱ��
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