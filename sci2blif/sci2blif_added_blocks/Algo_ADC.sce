//************************* Algorithmic ADC ******************************
if (blk_name.entries(bl) =='Algo_ADC') then
    mputl("# Algorithmic ADC ",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        adc_str= ".subckt Algo_ADC in[0]=net"+string(blk(blk_objs(bl),2))+'_'+ string(ss)+" in[1]=clk_A in[2]=clk_R in[3]=clk_S in[4]=clk_L"+" out=net"+ string(blk(blk_objs(bl),2+numofip))+'_'+ string(ss)+ " #Algo_ADC_p_bias[0] =1.1e-6&Algo_ADC_n_bias[0] =1.22e-6&Algo_ADC_fgota_bias[0] =0.2e-6&Algo_ADC_p_bias[1] =2e-6&Algo_ADC_n_bias[1] =5.9e-7&Algo_ADC_fgota_bias[1] =0.3e-6&Algo_ADC_ota_bias[1] =0.1e-6&Vref_res[0] =4e-6&Vref_res[1] =1.5e-9&comp_res[0] =19e-6&comp_res[1] =1e-9&Algo_ADC_ota_bias[0] =1e-6&Algo_ADC_fg[3] =0";
        mputl(adc_str,fd_w);
        mputl("  ",fd_w);
        x= ".subckt inv in[0]=net"+string(blk(blk_objs(bl),5))+'_'+ string(ss)+ " in[1]=net"+string(blk(blk_objs(bl),3))+'_'+ string(ss)+" out[0]=clk_L out[1]=clk_R #inv_fg[0] =0" ;
        mputl(x,fd_w);

        mputl("  ",fd_w);
        y= ".subckt inv in[0]=net"+string(blk(blk_objs(bl),6))+'_'+ string(ss)+ " in[1]=net"+string(blk(blk_objs(bl),4))+'_'+ string(ss)+" out[0]=clk_S out[1]=clk_A #inv_fg[0] =0" ;
        mputl(y,fd_w);
        mputl("  ",fd_w);
        plcvpr = %t;
        //plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_1',' 3 '+string(nfetloc)+' 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_1','10 1 0'];
        plcloc=[plcloc;'clk_S', '10 2 0'];
        plcloc=[plcloc;'clk_L','11 2 0'];
    end
end
