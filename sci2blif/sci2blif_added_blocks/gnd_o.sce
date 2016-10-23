//************************** GND out (Macro block) ********************************
if(blk_name.entries(bl)=='gnd_o')  then
    for ss=1:scs_m.objs(bl).model.ipar(1)
    cap_info = cap_info2(cap_info,pass_num,'fb_gndout_net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+"', bl)
        mputl("#GND_OUT "+string(bl),fd_w);
        mputl(".subckt gnd_out in[0]=fb_gndout_net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" in[1]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" out[0]=fb_gndout_net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+"  #gnd_out_c =0",fd_w);
        mputl(' ',fd_w);
    end
end
