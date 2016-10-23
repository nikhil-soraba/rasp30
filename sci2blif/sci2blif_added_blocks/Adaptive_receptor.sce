//**************************** Adaptive_receptor **********************************
if (blk_name.entries(bl) == "Adaptive_receptor") then
addvmm = %t;
    mputl("#Adaptive_receptor",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        l1_str= ".subckt Adaptive_receptor in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" in[1]=net"+string(blk(blk_objs(bl),3))+"_"+string(ss)+" out[0]=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(ss)+" #Adaptive_receptor_fg[0] =0&speech_peakotabias[0] ="+string(sprintf('%e',scs_m.objs(bl).model.rpar(1)))+"&Adaptive_receptor_pfetbias[0] ="+string(sprintf('%e',scs_m.objs(bl).model.rpar(2)))+"&speech_peakotabias[1] ="+string(sprintf('%e',scs_m.objs(bl).model.rpar(3)));
        mputl(l1_str,fd_w);
        mputl("  ",fd_w);
    end
    mputl("",fd_w);
end
