//*************************** PFET GOLDEN *******************************
if (blk_name.entries(bl) =='pfet_gldn') then
    mputl("# PFET GOLDEN",fd_w);
    mputl(".subckt pfet in[0]=net"+string(blk(blk_objs(bl),3))+'_1'+" in[1]=net" + string(blk(blk_objs(bl),2))+'_1' + " out=net"+ string(blk(blk_objs(bl),2+numofip))+'_1',fd_w);
    mputl("  ",fd_w)
    select board_num
    case 2 then
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_1','11 '+string(pfetloc)+' 0'];
    case 3 then
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_1','3 '+string(pfetloc)+' 0'];
    end
    pfetloc=pfetloc+1;
end
