//************************* Common Source ******************************
if (blk_name.entries(bl) =='common_source') then
    mputl("# Common Source",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        cap_str= ".subckt common_source1 in[0]=net"+string(blk(blk_objs(bl),2))+'_'+ string(ss)+" out=net"+ string(blk(blk_objs(bl),2+numofip))+'_'...
        + string(ss) + " #common_source1_fg =0&cs_bias =" +string(sprintf('%1.12f',scs_m.objs(blk_objs(bl)).model.rpar(ss)));
        mputl(cap_str,fd_w);
        mputl("  ",fd_w);
    end
end
