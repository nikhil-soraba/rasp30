//************************* MUX4_1 ******************************
if (blk_name.entries(bl) =='mux4_1') then
    mputl("# MUX4_1",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        cap_str= ".subckt mux4_1 in[0]=sel1 in[1]=net"+string(blk(blk_objs(bl),2))+'_'+ string(ss)+" in[2]=sel2 in[3]=net"+string(blk(blk_objs(bl),3))+'_'+ string(ss)+" in[4]=sel3 in[5]=net"+string(blk(blk_objs(bl),4))+'_'+ string(ss)+" in[6]=sel4 in[7]=net"+string(blk(blk_objs(bl),5))+'_'+ string(ss)+" out=net"+ string(blk(blk_objs(bl),2+numofip))+'_'+ string(ss) + " #mux4_1_fg[0] =0";
        mputl(cap_str,fd_w);
        mputl("  ",fd_w);
    end
    fd_io= mopen (fname+'.pads','a+');
    select board_num
    case 2 then
        mputl("sel1 13 0 1 #int[1]",fd_io);
        mputl("sel2 13 0 2 #int[2]",fd_io);
        mputl("sel3 13 0 3 #int[3]",fd_io);
        mputl("sel4 13 0 4 #int[4]",fd_io);
    case 3 then 
        mputl("sel1 0 12 5 #int[5]",fd_io);
        mputl("sel2 0 13 0 #int[0]",fd_io);
        mputl("sel3 0 13 1 #int[1]",fd_io);
        mputl("sel4 0 13 2 #int[2]",fd_io);
    end
    mclose(fd_io); 
end
