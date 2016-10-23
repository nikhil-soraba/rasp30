//**************************** FG Switch **********************************
if(blk_name.entries(bl)=='fgswitch')  then
    addvmm = %t;
    mputl("# fg_io",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        fg_str= '.subckt fg_io in[0]=net' + string(blk(blk_objs(bl),2)) +"_" + string(ss)+' out[0]=net'+ string(blk(blk_objs(bl),2+numofip))+ "_" + string(ss)+ ' #fg_io_fg ='+ string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(ss)));
        mputl(fg_str,fd_w);
        mputl("  ",fd_w);
    end
end
