//***************************** WTA ************************************
if (blk_name.entries(bl) =='wta') then
    addvmm = %t;
    mputl("#WTA",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        mputl(".subckt wta in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+ " in[1]=net"+string(blk(blk_objs(bl),3))+"_"+string(ss)+" out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+"_" + string(ss)+" #wta_fg =0",fd_w);
        mputl("  ",fd_w);
        plcvpr = %t;
        //need a better way to handle the plcloc
        if grep(plcloc,'10 1 0')>0 then
            plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_'+ string(ss),'10 '+string(ss+1)+' 0'];
        else
            plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_'+ string(ss),'10 '+string(ss)+' 0'];
        end
        //  disp(plcloc)
    end
end
