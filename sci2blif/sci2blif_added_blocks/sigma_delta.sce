//**************************** sigmadelta **************************************
if (blk_name.entries(bl) =='sigma_delta') then
    mputl("# sigmadelta",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        sigma_str= '.subckt sigma_delta_fe in[0]=net' + string(blk(blk_objs(bl),2))+"_"+ string(ss) +" in[1]=net"+string(blk(blk_objs(bl),3))+"_1 in[2]=net"+string(blk(blk_objs(bl),4))+"_1 out[0]=net'+ string(blk(blk_objs(bl),2+numofip))+"_" + string(ss)+" #sd_ota_bias[0] =" +string(sprintf('%1.3e',scs_m.objs(blk_objs(bl)).model.rpar(3*ss-2)))+"&sd_ota_bias[1] =" +string(sprintf('%1.3e',scs_m.objs(blk_objs(bl)).model.rpar(3*ss)))+"&sd_ota_bias[2] =" +string(sprintf('%1.3e',scs_m.objs(blk_objs(bl)).model.rpar(3*ss-1)))+"&sigma_delta_fe_fg[0] =0&sd_ota_bias[3] =2e-6&sd_ota_p_bias[0] =500e-9&sd_ota_n_bias[0] =700e-9&sd_ota_p_bias[1] =500e-9&sd_ota_n_bias[1] =700e-9";
        mputl(sigma_str,fd_w);
        mputl("  ",fd_w);
    end
end
