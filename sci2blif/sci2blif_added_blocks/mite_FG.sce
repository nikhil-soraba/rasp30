//****************************** MITE***********************************
if (blk_name.entries(bl) =='mite_FG') then
    for ss=1:scs_m.objs(bl).model.opar(1)
        mputl("# MITE",fd_w);
        mputl(".subckt mite in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" in[1]=net"+string(blk(blk_objs(bl),3))+"_"+string(ss)+" in[2]=net"+string(blk(blk_objs(bl),4))+"_"+string(ss)+" out=net"+ string(blk(blk_objs(bl),2+numofip))+"_"+string(ss)+" #mite_fg0 ="+string(sprintf('%1.3e',scs_m.objs(blk_objs(bl)).model.opar(2*ss))),fd_w);
        mputl("  ",fd_w);
    end
end
