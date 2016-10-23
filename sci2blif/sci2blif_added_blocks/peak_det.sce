//********************** Peak Detector Separate ************************
if (blk_name.entries(bl) =='peak_det') then
    mputl("# PEAK DETECTOR",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        peak_str= '.subckt peak_detector in[0]=net" + string(blk(blk_objs(bl),2))+ '_' + string(ss)+' in[1]=net"+ string(blk(blk_objs(bl),3))+'_'+string(1)+' out[0]=net" + string(blk(blk_objs(bl),2+numofip))+ '_' + string(ss)+' #peak_ota_bias[0] =100e-9&peak_detector_fg[0] =0&peak_ota_p_bias[0] =100e-9&peak_ota_n_bias[0] =100e-9&peak_ota_small_cap[0] =0';
        mputl(peak_str,fd_w);
        mputl("  ",fd_w);
    end
end
