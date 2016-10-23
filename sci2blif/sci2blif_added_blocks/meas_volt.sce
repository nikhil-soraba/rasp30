//**************************** Measure Volt (mite_adc) ****************************
if (blk_name.entries(bl) =='meas_volt') then
    MITE_ADC_check=1;
    cap_info = cap_info2(cap_info,pass_num,'out_mite_adc', bl)
    mputl("# MITE_ADC",fd_w);
    for meas = 1:scs_m.objs(bl).model.rpar(2)
        mputl(".subckt meas_volt_mite in[0]=net"+string(blk(blk_objs(bl),2))+'_'+ string(meas)+' out[0]=out_mite_adc #meas_fg =0.00001',fd_w);
        mputl("  ",fd_w);
        select board_num
        case 2 then plcloc=[plcloc;'out_mite_adc','14 '+string(meas)+' 0'];
        case 3 then plcloc=[plcloc;'out_mite_adc','7 '+string(meas)+' 0'];   
        end
    end
    fd_io= mopen (fname+'.pads','a+')
    select board_num
    case 2 then mputl("out:out_mite_adc 7 0 0 #tgate[0]",fd_io);
    case 3 then mputl("out:out_mite_adc 8 1 0 #int[0]",fd_io);
    end
    mclose(fd_io);
end
