//**************************** NMIRROR *********************************
if (blk_name.entries(bl) =='nmirror') then
    mputl("#NMIRROR "+string(bl),fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        nmirror_str= ".subckt nmirror in[0]=net"+string(blk(blk_objs(bl),2))+'_'+ string(ss)+" out=net"+ string(blk(blk_objs(bl),2+numofip))+'_' + string(ss);
        mputl(nmirror_str,fd_w);
        mputl("  ",fd_w);
    end
end
