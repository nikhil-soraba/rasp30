//************************** VMM Sense Amp******************************
if (blk_name.entries(bl) =='sen_amp') then
    addvmm = %t;
    mputl("#VMM w/Sense Amp",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        vmmsen_str=".subckt vmm_senseamp1 in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+ " in[1]=net"+string(blk(blk_objs(bl),3))+"_"+string(ss)+" out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+"_" + string(ss)+" #vmm_senseamp1_fg =0"+"&ota0bias ="+string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(ss)));
        mputl(vmmsen_str,fd_w);
        mputl("  ",fd_w);
    end
end
