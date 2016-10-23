//************************** VDD Out (Macro block) *****************************
if(blk_name.entries(bl)=='vdd_o')  then
    for ss=1:scs_m.objs(bl).model.ipar(1)
        mputl("#VDD_OUT "+string(bl),fd_w);
        mputl(".subckt vdd_out in[0]=fb_vddout_net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" in[1]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" out[0]=fb_vddout_net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" #vdd_out_c =0",fd_w);
        mputl(' ',fd_w);
    end
end
