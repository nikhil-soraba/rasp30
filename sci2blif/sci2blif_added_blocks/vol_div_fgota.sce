//************************ Voltage Divider FGOTA ****************************
if (blk_name.entries(bl) =='vol_div_fgota') then
    mputl("#Voltage Divider FGOTA",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        vol_div_fgota_str= ".subckt volt_div_fgota in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+ " in[1]=net"+string(blk(blk_objs(bl),3))+"_1"+" out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+"_" + string(ss)+" #volt_div_fgota_fg =0&vd_fgota_bias =" +string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(ss*1))) + "&vd_fgota_pbias =" +string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(ss*2)))+"&vd_fgota_nbias ="+string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(ss*3)))+"&cap_1x_vd =0&vd_target ="+string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(ss*4)));
        mputl(vol_div_fgota_str,fd_w);
        mputl("  ",fd_w);
    end
end
