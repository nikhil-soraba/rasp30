//************************* Common Source conventional ******************************
if (blk_name.entries(bl) =='common_source_nfg') then
    mputl("# Common Source conventional",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        cap_str= ".subckt common_source_nfg in[0]=net"+string(blk(blk_objs(bl),2))+'_'+ string(ss)+" in[1]=net"+string(blk(blk_objs(bl),3))+'_'+ string(ss)+" out=net"+ string(blk(blk_objs(bl),2+numofip))+'_'...
        + string(ss) + " #common_source_nfg_fg =0";
        mputl(cap_str,fd_w);
        mputl("  ",fd_w);
    end
end
