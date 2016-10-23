//**************************** NFET GOLDEN *******************************
if (blk_name.entries(bl) =='nfet_gldn') then
    mputl("# NFET GOLDEN",fd_w);
    mputl(".subckt nfet in[0]=net"+string(blk(blk_objs(bl),2))+'_1'+ " in[1]=net" + string(blk(blk_objs(bl),3)) +'_1'+ " out=net"+ string(blk(blk_objs(bl),2+numofip))+'_1',fd_w);
    mputl("  ",fd_w);
    select board_num
    case 2 then
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_1','11 '+string(nfetloc)+' 0'];
    case 3 then
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_1','3 '+string(nfetloc)+' 0'];
    end
    nfetloc=nfetloc+1;
    //nfetloc=2;
end
