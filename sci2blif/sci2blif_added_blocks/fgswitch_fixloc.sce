//**************************** FG Switch (fix loc) **********************************
if(blk_name.entries(bl)=='fgswitch_fixloc')  then
    mputl("#FG_SWITCH",fd_w);
    ii=scs_m.objs(bl).model.ipar(1)
    for ss=1:ii
        fg_str= '.subckt fgswitch in[0]=net' + string(blk(blk_objs(bl),2)) +"_" + string(ss)+' out[0]=net'+ string(blk(blk_objs(bl),2+numofip))+ "_" + string(ss)+ ' #fgswitch_bias ='+ string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(ss)));
        mputl(fg_str,fd_w);
        mputl("  ",fd_w);
        if scs_m.objs(bl).model.rpar(ii+1) == 1 then
            plcvpr = %t;
            plcloc=[plcloc;'net'+ string(blk(blk_objs(bl),2+numofip))+ "_" + string(ss),string(scs_m.objs(bl).model.rpar(ii+2+(ss-1)*2))+' '+string(scs_m.objs(bl).model.rpar(ii+3+(ss-1)*2))+' 0'];
        end
    end
end
