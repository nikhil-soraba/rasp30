//****************************** PFET **********************************
if (blk_name.entries(bl) =='pfet') then
    mputl("#PFET "+string(bl),fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        mputl(".subckt pfet in[0]=net"+string(blk(blk_objs(bl),3))+'_'+string(ss)+" in[1]=net" + string(blk(blk_objs(bl),2))+'_'+string(ss)+" out=net"+ string(blk(blk_objs(bl),2+numofip))+'_'+string(ss),fd_w);
        mputl("  ",fd_w);
    end
    fd_info= mopen('info.txt','a+');
    mputl('Pfet gate=net"+string(blk(blk_objs(bl),3))+" source=net" + string(blk(blk_objs(bl),2))',fd_info);
    mclose(fd_info);
end
