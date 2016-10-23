//**************************** TGATE ***********************************
if (blk_name.entries(bl) =='tgate') then
    mputl("#TGATE "+string(bl),fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        mputl(".subckt tgate in[0]=net"+string(blk(blk_objs(bl),2))+"_" + string(ss)+" in[1]=net" + string(blk(blk_objs(bl),3))+"_" + string(ss)+" out=net"+ string(blk(blk_objs(bl),2+numofip))+"_" + string(ss),fd_w);
        mputl("  ",fd_w);
    end
    if scs_m.objs(bl).model.rpar(1) == 1 then
        plcvpr = %t;
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_1',string(scs_m.objs(bl).model.rpar(2))+' '+string(scs_m.objs(bl).model.rpar(3))+' 0'];
    end
end
