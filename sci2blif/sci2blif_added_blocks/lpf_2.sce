//**************************** LPF 2nd Order *********************************
if(blk_name.entries(bl)=='lpf_2')  then
    mputl("# LPF 2nd Order",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        str= '.subckt lpf_2 in[0]=net' + string(blk(blk_objs(bl),2))+"_" + string(ss)+' out[0]=net'+ string(blk(blk_objs(bl),2+numofip))+"_" + string(ss)+" #lpf_2_fg[0] =0&lpf_2_otabias[0] =" +string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(2*ss-1)))+'&lpf_2_otabias[1] =" +string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(2*ss)));
        mputl(str,fd_w);
        mputl("  ",fd_w);
    end
end
