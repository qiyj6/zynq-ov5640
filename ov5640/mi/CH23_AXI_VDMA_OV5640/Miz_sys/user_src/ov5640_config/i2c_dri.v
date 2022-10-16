//****************************************Copyright (c)***********************************//
//ć?ćŻćŻćďźwww.openedv.com
//ćˇĺŽĺşéşďźhttp://openedv.taobao.com
//ĺłćł¨ĺžŽäżĄĺŹäźĺšłĺ°ĺžŽäżĄĺˇďź"ć­Łçšĺĺ­"ďźĺč´ščˇĺFPGA & STM32čľćă?
//çćć?ćďźççĺżçŠśă?
//Copyright(C) ć­Łçšĺĺ­ 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           i2c_dri
// Last modified Date:  2018/3/12 11:17:33
// Last Version:        V1.0
// Descriptions:        i2céŠąĺ¨ć¨Ąĺďźäžĺśäťé?ä˝żç¨i2cĺčŽŽçć¨Ąĺäžĺ?
//----------------------------------------------------------------------------------------
// Created by:          ć­Łçšĺĺ­
// Created date:        2018/3/12 11:17:33
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module i2c_dri
    #(// slave addressďźĺ¨äťśĺ°ĺ?ďźďźćžć­¤ĺ¤ćšäžżĺć°äź é?
      parameter   SLAVE_ADDR =  7'b1010000   ,
      parameter   CLK_FREQ   = 26'd50_000_000,   // i2c_drić¨ĄĺçéŠąĺ¨ćśéé˘ç?(CLK_FREQ)
      parameter   I2C_FREQ   = 18'd250_000       // I2CçSCLćśéé˘ç
     )(
          //global clock
          input                clk        ,      // i2c_drić¨ĄĺçéŠąĺ¨ćśé?(CLK_FREQ)
          input                rst_n      ,      // ĺ¤ä˝äżĄĺˇ

          //i2c interface
          input                i2c_exec   ,      // I2Cč§Śĺć§čĄäżĄĺˇ
          input                bit_ctrl   ,      // ĺ­ĺ°ĺ?ä˝ć§ĺ?(16b/8b)
          input                i2c_rh_wl  ,      // I2CčŻťĺć§ĺśäżĄĺˇ
          input        [15:0]  i2c_addr   ,      // I2Cĺ¨äťśĺĺ°ĺ?
          input        [ 7:0]  i2c_data_w ,      // I2CčŚĺçć°ć?
          output  reg  [ 7:0]  i2c_data_r ,      // I2CčŻťĺşçć°ć?
          output  reg          i2c_done   ,      // I2Cä¸?ćŹĄćä˝ĺŽć?
          output  reg          scl        ,      // I2CçSCLćśéäżĄĺˇ
          inout                sda        ,      // I2CçSDAäżĄĺˇ

          //user interface
          output  reg          dri_clk           // éŠąĺ¨I2Cćä˝çéŠąĺ¨ćśé?
     );

//localparam define
localparam  st_idle     = 8'b0000_0001;          // çŠşé˛çść??
localparam  st_sladdr   = 8'b0000_0010;          // ĺé?ĺ¨äťśĺ°ĺ?(slave address)
localparam  st_addr16   = 8'b0000_0100;          // ĺé??16ä˝ĺ­ĺ°ĺ
localparam  st_addr8    = 8'b0000_1000;          // ĺé??8ä˝ĺ­ĺ°ĺ
localparam  st_data_wr  = 8'b0001_0000;          // ĺć°ć?(8 bit)
localparam  st_addr_rd  = 8'b0010_0000;          // ĺé?ĺ¨äťśĺ°ĺ?čŻ?
localparam  st_data_rd  = 8'b0100_0000;          // čŻťć°ć?(8 bit)
localparam  st_stop     = 8'b1000_0000;          // çťćI2Cćä˝

//reg define
reg            sda_dir     ;                     // I2Cć°ćŽ(SDA)ćšĺć§ĺś
reg            sda_out     ;                     // SDAčžĺşäżĄĺˇ
reg            st_done     ;                     // çść?çťć?
reg            wr_flag     ;                     // ĺć ĺż?
reg    [ 6:0]  cnt         ;                     // čŽĄć°
reg    [ 7:0]  cur_state   ;                     // çść?ćşĺ˝ĺçść??
reg    [ 7:0]  next_state  ;                     // çść?ćşä¸ä¸çść??
reg    [15:0]  addr_t      ;                     // ĺ°ĺ
reg    [ 7:0]  data_r      ;                     // čŻťĺçć°ć?
reg    [ 7:0]  data_wr_t   ;                     // I2Cé?ĺçć°ćŽçä¸´ćśĺŻĺ­?
reg    [ 9:0]  clk_cnt     ;                     // ĺé˘ćśéčŽĄć°

//wire define
wire          sda_in      ;                      // SDAčžĺĽäżĄĺˇ
wire   [8:0]  clk_divide  ;                      // ć¨ĄĺéŠąĺ¨ćśéçĺé˘çłťć?

//*****************************************************
//**                    main code
//*****************************************************

//SDAć§ĺś
assign  sda     = sda_dir ?  sda_out : 1'bz;     // SDAć°ćŽčžĺşćéŤé?
assign  sda_in  = sda ;                          // SDAć°ćŽčžĺĽ
assign  clk_divide = (CLK_FREQ/I2C_FREQ) >> 3;   // ć¨ĄĺéŠąĺ¨ćśéçĺé˘çłťć?

//çćI2CçSCLçĺĺé˘ççéŠąĺ¨ćśéç¨äşéŠąĺ¨i2cçćä˝?
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        dri_clk <=  1'b1;
        clk_cnt <= 10'd0;
    end
    else if(clk_cnt == clk_divide - 1'd1) begin
        clk_cnt <= 10'd0;
        dri_clk <= ~dri_clk;
    end
    else
        clk_cnt <= clk_cnt + 1'b1;
end

//(ä¸ćŽľĺźçśććş)ĺć­Ľćśĺşćčż°çść?č˝Źç§?
always @(posedge dri_clk or negedge rst_n) begin
    if(!rst_n)
        cur_state <= st_idle;
    else
        cur_state <= next_state;
end

//çťĺéťčžĺ¤ć­çść?č˝Źç§ťćĄäť?
always @( * ) begin
//    next_state = st_idle;
    case(cur_state)
        st_idle: begin                           // çŠşé˛çść??
           if(i2c_exec) begin
               next_state = st_sladdr;
           end
           else
               next_state = st_idle;
        end
        st_sladdr: begin
            if(st_done) begin
                if(bit_ctrl)                     // ĺ¤ć­ć?16ä˝čżć?8ä˝ĺ­ĺ°ĺ
                   next_state = st_addr16;
                else
                   next_state = st_addr8 ;
            end
            else
                next_state = st_sladdr;
        end
        st_addr16: begin                         // ĺ?16ä˝ĺ­ĺ°ĺ
            if(st_done) begin
                next_state = st_addr8;
            end
            else begin
                next_state = st_addr16;
            end
        end
        st_addr8: begin                          // 8ä˝ĺ­ĺ°ĺ
            if(st_done) begin
                if(wr_flag==1'b0)                // čŻťĺĺ¤ć­
                    next_state = st_data_wr;
                else
                    next_state = st_addr_rd;
            end
            else begin
                next_state = st_addr8;
            end
        end
        st_data_wr: begin                        // ĺć°ć?(8 bit)
            if(st_done)
                next_state = st_stop;
            else
                next_state = st_data_wr;
        end
        st_addr_rd: begin                        // ĺĺ°ĺ?äťĽčżčĄčŻťć°ćŽ
            if(st_done) begin
                next_state = st_data_rd;
            end
            else begin
                next_state = st_addr_rd;
            end
        end
        st_data_rd: begin                        // čŻťĺć°ćŽ(8 bit)
            if(st_done)
                next_state = st_stop;
            else
                next_state = st_data_rd;
        end
        st_stop: begin                           // çťćI2Cćä˝
            if(st_done)
                next_state = st_idle;
            else
                next_state = st_stop ;
        end
        default: next_state= st_idle;
    endcase
end

//ćśĺşçľčˇŻćčż°çść?čžĺ?
always @(posedge dri_clk or negedge rst_n) begin
    //ĺ¤ä˝ĺĺ§ĺ?
    if(!rst_n) begin
        scl        <= 1'b1;
        sda_out    <= 1'b1;
        sda_dir    <= 1'b1;
        i2c_done   <= 1'b0;
        cnt        <= 1'b0;
        st_done    <= 1'b0;
        data_r     <= 1'b0;
        i2c_data_r <= 1'b0;
        wr_flag    <= 1'b0;
        addr_t     <= 1'b0;
        data_wr_t  <= 1'b0;
    end
    else begin
        st_done <= 1'b0 ;
        cnt     <= cnt +1'b1 ;
        case(cur_state)
             st_idle: begin                            // çŠşé˛çść??
                scl     <= 1'b1;
                sda_out <= 1'b1;
                sda_dir <= 1'b1;
                i2c_done<= 1'b0;
                cnt     <= 7'b0;
                if(i2c_exec) begin
                    wr_flag   <= i2c_rh_wl ;
                    addr_t    <= i2c_addr  ;
                    data_wr_t <= i2c_data_w;
                end
            end
            st_sladdr: begin                           // ĺĺ°ĺ?(ĺ¨äťśĺ°ĺĺĺ­ĺ°ĺ)
                case(cnt)
                    7'd1 : sda_out <= 1'b0;            // ĺź?ĺ§I2C
                    7'd3 : scl <= 1'b0;
                    7'd4 : sda_out <= SLAVE_ADDR[6];   // äź é?ĺ¨äťśĺ°ĺ?
                    7'd5 : scl <= 1'b1;
                    7'd7 : scl <= 1'b0;
                    7'd8 : sda_out <= SLAVE_ADDR[5];
                    7'd9 : scl <= 1'b1;
                    7'd11: scl <= 1'b0;
                    7'd12: sda_out <= SLAVE_ADDR[4];
                    7'd13: scl <= 1'b1;
                    7'd15: scl <= 1'b0;
                    7'd16: sda_out <= SLAVE_ADDR[3];
                    7'd17: scl <= 1'b1;
                    7'd19: scl <= 1'b0;
                    7'd20: sda_out <= SLAVE_ADDR[2];
                    7'd21: scl <= 1'b1;
                    7'd23: scl <= 1'b0;
                    7'd24: sda_out <= SLAVE_ADDR[1];
                    7'd25: scl <= 1'b1;
                    7'd27: scl <= 1'b0;
                    7'd28: sda_out <= SLAVE_ADDR[0];
                    7'd29: scl <= 1'b1;
                    7'd31: scl <= 1'b0;
                    7'd32: sda_out <= 1'b0;            // 0:ĺ?
                    7'd33: scl <= 1'b1;
                    7'd35: scl <= 1'b0;
                    7'd36: begin
                        sda_dir <= 1'b0;               // äťćşĺşç­
                        sda_out <= 1'b1;
                    end
                    7'd37: scl     <= 1'b1;
                    7'd38: st_done <= 1'b1;
                    7'd39: begin
                        scl <= 1'b0;
                        cnt <= 1'b0;
                    end
                    default :  ;
                endcase
            end
            st_addr16: begin
                case(cnt)
                    7'd0 : begin
                        sda_dir <= 1'b1 ;
                        sda_out <= addr_t[15];         // äź é?ĺ­ĺ°ĺ
                    end
                    7'd1 : scl <= 1'b1;
                    7'd3 : scl <= 1'b0;
                    7'd4 : sda_out <= addr_t[14];
                    7'd5 : scl <= 1'b1;
                    7'd7 : scl <= 1'b0;
                    7'd8 : sda_out <= addr_t[13];
                    7'd9 : scl <= 1'b1;
                    7'd11: scl <= 1'b0;
                    7'd12: sda_out <= addr_t[12];
                    7'd13: scl <= 1'b1;
                    7'd15: scl <= 1'b0;
                    7'd16: sda_out <= addr_t[11];
                    7'd17: scl <= 1'b1;
                    7'd19: scl <= 1'b0;
                    7'd20: sda_out <= addr_t[10];
                    7'd21: scl <= 1'b1;
                    7'd23: scl <= 1'b0;
                    7'd24: sda_out <= addr_t[9];
                    7'd25: scl <= 1'b1;
                    7'd27: scl <= 1'b0;
                    7'd28: sda_out <= addr_t[8];
                    7'd29: scl <= 1'b1;
                    7'd31: scl <= 1'b0;
                    7'd32: begin
                        sda_dir <= 1'b0;               // äťćşĺşç­
                        sda_out <= 1'b1;
                    end
                    7'd33: scl     <= 1'b1;
                    7'd34: st_done <= 1'b1;
                    7'd35: begin
                        scl <= 1'b0;
                        cnt <= 1'b0;
                    end
                    default :  ;
                endcase
            end
            st_addr8: begin
                case(cnt)
                    7'd0: begin
                       sda_dir <= 1'b1 ;
                       sda_out <= addr_t[7];           // ĺ­ĺ°ĺ?
                    end
                    7'd1 : scl <= 1'b1;
                    7'd3 : scl <= 1'b0;
                    7'd4 : sda_out <= addr_t[6];
                    7'd5 : scl <= 1'b1;
                    7'd7 : scl <= 1'b0;
                    7'd8 : sda_out <= addr_t[5];
                    7'd9 : scl <= 1'b1;
                    7'd11: scl <= 1'b0;
                    7'd12: sda_out <= addr_t[4];
                    7'd13: scl <= 1'b1;
                    7'd15: scl <= 1'b0;
                    7'd16: sda_out <= addr_t[3];
                    7'd17: scl <= 1'b1;
                    7'd19: scl <= 1'b0;
                    7'd20: sda_out <= addr_t[2];
                    7'd21: scl <= 1'b1;
                    7'd23: scl <= 1'b0;
                    7'd24: sda_out <= addr_t[1];
                    7'd25: scl <= 1'b1;
                    7'd27: scl <= 1'b0;
                    7'd28: sda_out <= addr_t[0];
                    7'd29: scl <= 1'b1;
                    7'd31: scl <= 1'b0;
                    7'd32: begin
                        sda_dir <= 1'b0;               // äťćşĺşç­
                        sda_out <= 1'b1;
                    end
                    7'd33: scl     <= 1'b1;
                    7'd34: st_done <= 1'b1;
                    7'd35: begin
                        scl <= 1'b0;
                        cnt <= 1'b0;
                    end
                    default :  ;
                endcase
            end
            st_data_wr: begin                          // ĺć°ć?(8 bit)
                case(cnt)
                    7'd0: begin
                        sda_out <= data_wr_t[7];       // I2Cĺ?8ä˝ć°ć?
                        sda_dir <= 1'b1;
                    end
                    7'd1 : scl <= 1'b1;
                    7'd3 : scl <= 1'b0;
                    7'd4 : sda_out <= data_wr_t[6];
                    7'd5 : scl <= 1'b1;
                    7'd7 : scl <= 1'b0;
                    7'd8 : sda_out <= data_wr_t[5];
                    7'd9 : scl <= 1'b1;
                    7'd11: scl <= 1'b0;
                    7'd12: sda_out <= data_wr_t[4];
                    7'd13: scl <= 1'b1;
                    7'd15: scl <= 1'b0;
                    7'd16: sda_out <= data_wr_t[3];
                    7'd17: scl <= 1'b1;
                    7'd19: scl <= 1'b0;
                    7'd20: sda_out <= data_wr_t[2];
                    7'd21: scl <= 1'b1;
                    7'd23: scl <= 1'b0;
                    7'd24: sda_out <= data_wr_t[1];
                    7'd25: scl <= 1'b1;
                    7'd27: scl <= 1'b0;
                    7'd28: sda_out <= data_wr_t[0];
                    7'd29: scl <= 1'b1;
                    7'd31: scl <= 1'b0;
                    7'd32: begin
                        sda_dir <= 1'b0;               // äťćşĺşç­
                        sda_out <= 1'b1;
                    end
                    7'd33: scl <= 1'b1;
                    7'd34: st_done <= 1'b1;
                    7'd35: begin
                        scl  <= 1'b0;
                        cnt  <= 1'b0;
                    end
                    default  :  ;
                endcase
            end
            st_addr_rd: begin                          // ĺĺ°ĺ?äťĽčżčĄčŻťć°ćŽ
                case(cnt)
                    7'd0 : begin
                        sda_dir <= 1'b1;
                        sda_out <= 1'b1;
                    end
                    7'd1 : scl <= 1'b1;
                    7'd2 : sda_out <= 1'b0;            // éć°ĺź?ĺ§?
                    7'd3 : scl <= 1'b0;
                    7'd4 : sda_out <= SLAVE_ADDR[6];   // äź é?ĺ¨äťśĺ°ĺ?
                    7'd5 : scl <= 1'b1;
                    7'd7 : scl <= 1'b0;
                    7'd8 : sda_out <= SLAVE_ADDR[5];
                    7'd9 : scl <= 1'b1;
                    7'd11: scl <= 1'b0;
                    7'd12: sda_out <= SLAVE_ADDR[4];
                    7'd13: scl <= 1'b1;
                    7'd15: scl <= 1'b0;
                    7'd16: sda_out <= SLAVE_ADDR[3];
                    7'd17: scl <= 1'b1;
                    7'd19: scl <= 1'b0;
                    7'd20: sda_out <= SLAVE_ADDR[2];
                    7'd21: scl <= 1'b1;
                    7'd23: scl <= 1'b0;
                    7'd24: sda_out <= SLAVE_ADDR[1];
                    7'd25: scl <= 1'b1;
                    7'd27: scl <= 1'b0;
                    7'd28: sda_out <= SLAVE_ADDR[0];
                    7'd29: scl <= 1'b1;
                    7'd31: scl <= 1'b0;
                    7'd32: sda_out <= 1'b1;            // 1:čŻ?
                    7'd33: scl <= 1'b1;
                    7'd35: scl <= 1'b0;
                    7'd36: begin
                        sda_dir <= 1'b0;               // äťćşĺşç­
                        sda_out <= 1'b1;
                    end
                    7'd37: scl     <= 1'b1;
                    7'd38: st_done <= 1'b1;
                    7'd39: begin
                        scl <= 1'b0;
                        cnt <= 1'b0;
                    end
                    default : ;
                endcase
            end
            st_data_rd: begin                          // čŻťĺć°ćŽ(8 bit)
                case(cnt)
                    7'd0: sda_dir <= 1'b0;
                    7'd1: begin
                        data_r[7] <= sda_in;
                        scl       <= 1'b1;
                    end
                    7'd3: scl  <= 1'b0;
                    7'd5: begin
                        data_r[6] <= sda_in ;
                        scl       <= 1'b1   ;
                    end
                    7'd7: scl  <= 1'b0;
                    7'd9: begin
                        data_r[5] <= sda_in;
                        scl       <= 1'b1  ;
                    end
                    7'd11: scl  <= 1'b0;
                    7'd13: begin
                        data_r[4] <= sda_in;
                        scl       <= 1'b1  ;
                    end
                    7'd15: scl  <= 1'b0;
                    7'd17: begin
                        data_r[3] <= sda_in;
                        scl       <= 1'b1  ;
                    end
                    7'd19: scl  <= 1'b0;
                    7'd21: begin
                        data_r[2] <= sda_in;
                        scl       <= 1'b1  ;
                    end
                    7'd23: scl  <= 1'b0;
                    7'd25: begin
                        data_r[1] <= sda_in;
                        scl       <= 1'b1  ;
                    end
                    7'd27: scl  <= 1'b0;
                    7'd29: begin
                        data_r[0] <= sda_in;
                        scl       <= 1'b1  ;
                    end
                    7'd31: scl  <= 1'b0;
                    7'd32: begin
                        sda_dir <= 1'b1;              // éĺşç­?
                        sda_out <= 1'b1;
                    end
                    7'd33: scl     <= 1'b1;
                    7'd34: st_done <= 1'b1;
                    7'd35: begin
                        scl <= 1'b0;
                        cnt <= 1'b0;
                        i2c_data_r <= data_r;
                    end
                    default  :  ;
                endcase
            end
            st_stop: begin                            // çťćI2Cćä˝
                case(cnt)
                    7'd0: begin
                        sda_dir <= 1'b1;              // çťćI2C
                        sda_out <= 1'b0;
                    end
                    7'd1 : scl     <= 1'b1;
                    7'd3 : sda_out <= 1'b1;
                    7'd15: st_done <= 1'b1;
                    7'd16: begin
                        cnt      <= 1'b0;
                        i2c_done <= 1'b1;             // ĺä¸ĺąć¨Ąĺäź éI2CçťćäżĄĺˇ
                    end
                    default  : ;
                endcase
            end
        endcase
    end
end

endmodule