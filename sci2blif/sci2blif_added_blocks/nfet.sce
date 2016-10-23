//****************************** NFET **********************************
if (blk_name.entries(bl) =='nfet') then
    mputl("#NFET "+string(bl),fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        mputl(".subckt nfet in[0]=net"+string(blk(blk_objs(bl),2))+'_'+ string(ss)+ " in[1]=net" + string(blk(blk_objs(bl),3)) +'_'+ string(ss)+ " out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+'_'+ string(ss),fd_w);
        mputl("  ",fd_w);
    end
end
