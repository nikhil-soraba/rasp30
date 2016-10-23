//**************************** Compiled RAMP ADC ****************************
if (blk_name.entries(bl) =='Ramp_ADC') then
    cap_info = cap_info2(cap_info,pass_num,'out_ramp_adc', bl)
    mputl("# Ramp_ADC*",fd_w);
    if chip_num == "21" then 
        mputl(".subckt ramp_fe in[0]=net'+string(blk(blk_objs(bl),2))+'_1 out=out_ramp_adc #ramp_fe_fg[0] =0&ramp_pfetinput[0] =3e-9&c4_ota_bias[0] =2e-6&c4_ota_p_bias[0] =2e-6&c4_ota_n_bias[0] =0.8e-6&speech_peakotabias[0] =2e-6&c4_ota_bias[1] =2e-6&c4_ota_p_bias[1] =500e-9&c4_ota_n_bias[1] =500e-9&ramp_pfetinput[1] =0.4e-9",fd_w);
        elseif chip_num == "13"&board_num==3 then 
        mputl(".subckt ramp_fe in[0]=net'+string(blk(blk_objs(bl),2))+'_1 out=out_ramp_adc #ramp_fe_fg[0] =0&ramp_pfetinput[0] =30e-9&c4_ota_bias[0] =2e-6&c4_ota_p_bias[0] =2e-6&c4_ota_n_bias[0] =1.5e-6&speech_peakotabias[0] =2e-6&c4_ota_bias[1] =2e-6&c4_ota_p_bias[1] =500e-9&c4_ota_n_bias[1] =500e-9&ramp_pfetinput[1] =0.1e-9",fd_w);
        else
        mputl(".subckt ramp_fe in[0]=net'+string(blk(blk_objs(bl),2))+'_1 out=out_ramp_adc #ramp_fe_fg[0] =0&ramp_pfetinput[0] =15e-9&c4_ota_bias[0] =2e-6&c4_ota_p_bias[0] =2e-6&c4_ota_n_bias[0] =1.5e-6&speech_peakotabias[0] =2e-6&c4_ota_bias[1] =2e-6&c4_ota_p_bias[1] =500e-9&c4_ota_n_bias[1] =500e-9&ramp_pfetinput[1] =10e-9",fd_w);
    end
    mputl("  ",fd_w)
    RAMP_ADC_check=1;
    fd_io= mopen (fname+'.pads','a+');
    select board_num
    case 2 then mputl("out:out_ramp_adc 15 1 5 #int[5]",fd_io);
    //case 2 then mputl("out:out_ramp_adc 9 0 0 #ana_buff_out[0]",fd_io);
    case 3 then mputl("out:out_ramp_adc 1 15 3 #int[3]",fd_io);
    //case 3 then mputl("out:out_ramp_adc 1 15 0 #ana_buff_out[0]",fd_io);
  
    end
    plcvpr = %t;
    select board_num
    case 2 then   plcloc=[plcloc;'out_ramp_adc",'7 1 0'];
    case 3 then  plcloc=[plcloc;'out_ramp_adc",'3 1 0'];
    end
    mclose(fd_io); 
end
