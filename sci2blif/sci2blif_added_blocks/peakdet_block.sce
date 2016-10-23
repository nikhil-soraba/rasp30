//************************* Peak Detector ******************************
if (blk_name.entries(bl) =='peakdet_block') then
    mputl("# PEAK DETECTOR",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        cap_str= ".subckt peak_detector in[0]=net"+string(blk(blk_objs(bl),2))+'_'+ string(ss)+" in[1]=net" + string(blk(blk_objs(bl),3))+'_'+ string(ss) + " out=net"+ string(blk(blk_objs(bl),2+numofip))+'_'...
        + string(ss) + " #peak_detector_fg[0] =0&ota_bias[0] =" +string(sprintf('%1.12f',scs_m.objs(blk_objs(bl)).model.rpar(ss)));
        capcap = scs_m.objs(blk_objs(bl)).model.rpar(scs_m.objs(blk_objs(bl)).model.ipar(1)+ss)
        select capcap
        case 1 then cap_str= cap_str +"&c4_cap_1x[0] =0";
        case 2 then cap_str= cap_str +"&c4_cap_2x[0] =0";
        case 3 then cap_str= cap_str +"&c4_cap_3x[0] =0";
        case 4 then cap_str= cap_str +"&c4_cap_3x[0] =0"+"&c4_cap_1x[0] =0";
        case 5 then cap_str= cap_str +"&c4_cap_3x[0] =0"+"&c4_cap_2x[0] =0";
        case 6 then cap_str= cap_str +"&c4_cap_3x[0] =0"+"&c4_cap_2x[0] =0"+"&c4_cap_1x[0] =0";
        else error("Capacitor for Peak Detector cannot be compiled.");
        end
        mputl(cap_str,fd_w);
        mputl("  ",fd_w);
    end
end
