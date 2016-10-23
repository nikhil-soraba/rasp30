//**************************** inv_mblif **********************************
if (blk_name.entries(bl) == "inv_mblif") then
    mputl("#inv_mblif",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        l1_str= ".subckt nfet in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" in[1]=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(ss)+" out[0]=net1_1_inv_mblif_"+string(bl);
        mputl(l1_str,fd_w);
        mputl("  ",fd_w);
        l1_str= ".subckt pfet in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" in[1]=vcc"+" out=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(ss);
        mputl(l1_str,fd_w);
        mputl("  ",fd_w);
        l1_str= ".subckt gnd_out in[0]=fb_gndout_net1_1_inv_mblif_"+string(bl)+" in[1]=net1_1_inv_mblif_"+string(bl)+" out[0]=fb_gndout_net1_1_inv_mblif_"+string(bl)+" #gnd_out_c =0";
        mputl(l1_str,fd_w);
        mputl("  ",fd_w);
    end
    mputl("",fd_w);
end
