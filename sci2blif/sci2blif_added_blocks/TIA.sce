//************************* TIA ******************************
if (blk_name.entries(bl) =='TIA') then
    plcvpr =%t;
    cap_info = cap_info2(cap_info,pass_num,'out_mite_adc', bl)
    cap_info = cap_info2(cap_info,pass_num,'out_tia', bl)
    mputl("# TIA",fd_w);
    tia_str= ".subckt TIA_blk in[0]=net"+string(blk(blk_objs(bl),2))+'_1 out[0]=out_tia #TIA_fgota_bias[0] =10e-6&TIA_ota_p_bias[0] =50e-9&TIA_ota_n_bias[0] =10e-9&TIA_fgota_bias[1] =10e-6&TIA_ota_p_bias[1] =50e-9&TIA_ota_n_bias[1] =2e-9&TIA_ota_bias[0] =1e-6&TIA_ota_buf_out[0] =2e-6&TIA_fg[0] =0";
    mputl(tia_str,fd_w);
    mputl("  ",fd_w);
    mputl("# MITE_ADC*",fd_w);
    mputl(".subckt meas_volt_mite in[0]=out_tia"+' out[0]=out_mite_adc #meas_fg =0.00001',fd_w);
    mputl("  ",fd_w);
    MITE_ADC_check=1;
    mite_adc=1;
    fd_io= mopen (fname+'.pads','a+')
    select board_num
    case 2 then mputl("out:out_mite_adc 7 0 0 #tgate[0]",fd_io);
        plcloc=[plcloc;'out_tia',' 11 1 0'];
    case 3 then mputl("out:out_mite_adc 8 1 0 #int[0]",fd_io);
        plcloc=[plcloc;'out_tia',' 5 1 0'];
    end
    mclose(fd_io);
end
