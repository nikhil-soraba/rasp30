//****************************** ADC **********************************
    if(blk_name.entries(bl)=='adc')  then
        ONchip_ADC=1;
        adc_loc_idx = adc_loc_idx +1;
        fd_io= mopen (fname+'.pads','a+');  // DEDICATED PADS code
        for ss=1:scs_m.objs(prime_ops(s)).model.ipar(1)
      mputl("# ota_buf",fd_w);
            mputl(".subckt ota_buf in[0]=net'+ string(blk(blk_objs(bl),2))+'_'+string(ss)+" out[0]=out_adc_" + string(ss)+ " #ota_biasfb =10e-6",fd_w);
            mputl("  ",fd_w);
            select board_num    
            case 2 then   mputl('out:out_adc_" + string(ss)+' '+ adc_locin(1,ss).entries,fd_io);
            case 3 then   mputl('out:out_adc_" + string(ss)+' ' + adc_locin(2,ss).entries,fd_io);
            end

        end
        mclose(fd_io);
end
