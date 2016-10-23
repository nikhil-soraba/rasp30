//************************* TIA with ramp adc******************************
if (blk_name.entries(bl) =='TIA_ramp') then
    plcvpr =%t;
    mputl("# TIA",fd_w);
    tia_str= ".subckt TIA_blk in[0]=net"+string(blk(blk_objs(bl),2))+'_1 out[0]=out_tia #TIA_fgota_bias[0] =10e-6&TIA_ota_p_bias[0] =50e-9&TIA_ota_n_bias[0] =10e-9&TIA_fgota_bias[1] =10e-6&TIA_ota_p_bias[1] =50e-9&TIA_ota_n_bias[1] =2e-9&TIA_ota_bias[0] =1e-6&TIA_ota_buf_out[0] =2e-6&TIA_fg[0] =0";
    mputl(tia_str,fd_w);
    mputl("  ",fd_w);
    mputl("# ramp_ADC*",fd_w);
    mputl(".subckt ramp_fe in[0]=out_tia out=out_ramp_adc #ramp_fe_fg[0] =0&ramp_pfetinput[0] =10e-9&c4_ota_bias[0] =2e-6&c4_ota_p_bias[0] =2e-6&c4_ota_n_bias[0] =1.5e-6&speech_peakotabias[0] =2e-6&c4_ota_bias[1] =2e-6&c4_ota_p_bias[1] =500e-9&c4_ota_n_bias[1] =500e-9&ramp_pfetinput[1] =30e-9",fd_w);
    mputl("  ",fd_w);
    RAMP_ADC_check=1;
    fd_io= mopen (fname+'.pads','a+');
    select board_num
    case 2 then mputl("out:out_ramp_adc 15 1 5 #int[5]",fd_io);
    case 3 then mputl("out:out_ramp_adc 1 15 3 #int[3]",fd_io);
    end
    mclose(fd_io);
    plcvpr = %t;
    select board_num
    case 2 then   plcloc=[plcloc;'out_ramp_adc",' 7	1	0'];
        plcloc=[plcloc;'out_tia',' 11 1 0'];
    case 3 then  plcloc=[plcloc;'out_ramp_adc",' 1	 1	0'];
        plcloc=[plcloc;'out_tia',' 5 1 0'];
    end
end
