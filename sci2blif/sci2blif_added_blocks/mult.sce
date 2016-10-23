//**************************** MULT ************************************
if (blk_name.entries(bl) =='mult') then
    mputl("# MULT",fd_w);
    mputl(".subckt mult in[0]=net"+string(blk(blk_objs(bl),2))+'_'+ string(1)+ " in[1]=net"+string(blk(blk_objs(bl),3))+'_'+ string(1)+ " in[2]=net"+string(blk(blk_objs(bl),4))+'_'+ string(1)+ " in[3]=net"+string(blk(blk_objs(bl),5))+'_'+ string(1)+" out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+'_'+ string(1)+" out[1]=net"+ string(blk(blk_objs(bl),3+numofip))+'_'+ string(1),fd_w);
    mputl("  ",fd_w);
end
