//**************************** Adaptive_element **********************************
if (blk_name.entries(bl) == "Adaptive_element") then
    mputl("#Adaptive_element",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        l1_str= ".subckt nfet in[0]=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(ss)+" in[1]=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(ss)+" out[0]=net"+string(blk(blk_objs(bl),3+numofip))+"_"+string(ss);
        mputl(l1_str,fd_w);
        mputl("  ",fd_w);
        l1_str= ".subckt pfet in[0]=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(ss)+" in[1]=net"+string(blk(blk_objs(bl),3+numofip))+"_"+string(ss)+" out=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(ss);
        mputl(l1_str,fd_w);
        mputl("  ",fd_w);
    end
    mputl("",fd_w);
end
