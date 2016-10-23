//**************************** fgswc nmirror with bias ***********************************
if (blk_name.entries(bl) =='fgswc_nmirror_w_bias') then
    mputl("#FGSWC_NMIRROR_W_BIAS",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        fgswc_nmirror_w_bias_str=".subckt fgswc_nmirror_w_bias in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" out[0]=net"+string(blk(blk_objs(bl),2+numofip))+"_" + string(ss)+" #fgswc_nmirror_w_bias1 ="+string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(4)))+"&fgswc_nmirror_w_bias2 ="+string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(5)));
        mputl(fgswc_nmirror_w_bias_str,fd_w);
        mputl("  ",fd_w);
        if scs_m.objs(bl).model.rpar(1) == 1 then
            plcvpr = %t;
            plcloc=[plcloc;"net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(ss),string(scs_m.objs(bl).model.rpar(2))+' '+string(scs_m.objs(bl).model.rpar(3))+' 0'];
        end
    end
end



