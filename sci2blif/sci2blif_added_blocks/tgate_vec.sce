//**************************** TGATE ***********************************
if (blk_name.entries(bl) =='tgate_vec') then
    for ss=1:scs_m.objs(bl).model.ipar(1)
        mputl("# TGATE ",fd_w);
        Tgate_str= '.subckt tgate in[0]=net"+string(blk(blk_objs(bl),2))+'_'+string(ss)+" in[1]=net" + string(blk(blk_objs(bl),3)) + '_'+string(ss)+' out=net"+ string(blk(blk_objs(bl),2+numofip))+'_'+string(ss);
        mputl(Tgate_str,fd_w);
        mputl("  ",fd_w);
    end
end
