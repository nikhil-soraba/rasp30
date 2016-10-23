//**************************** SOS **********************************
if (blk_name.entries(bl) =='SOS') then
    mputl("# SOS",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        SOS_str= '.subckt speech in[0]=net' + string(blk(blk_objs(bl),2))+"_" + string(ss)+" out[0]=net'+ string(blk(blk_objs(bl),2+numofip))+"_" + string(ss)+" #c4_ota_bias[0] =" +string(sprintf('%1.3e',scs_m.objs(blk_objs(bl)).model.rpar(3*ss-1)))+"&c4_ota_bias[1] =" +string(sprintf('%1.3e',scs_m.objs(blk_objs(bl)).model.rpar(3*ss-2)))+"&HOP_bif_fg[0] =0&c4_ota_p_bias[0] =100e-9&c4_ota_n_bias[0] =100e-9&c4_ota_p_bias[1] =100e-9c4_ota_n_bias[1] =100e-9&speech_peakotabias[0] =" +string(sprintf('%1.3e',scs_m.objs(blk_objs(bl)).model.rpar(3*ss)));
        mputl(SOS_str,fd_w)
        mputl("  ",fd_w)
    end
end
