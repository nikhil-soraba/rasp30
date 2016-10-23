//**************************** nmirror with bias ***********************************
if (blk_name.entries(bl) =='nmirror_w_bias') then
    mputl("#NMIRROR_W_BIAS",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        nmirror_w_bias_str=".subckt nmirror_w_bias in[0]=fbout_"+string(internal_number)+"_"+string(ss)+" in[1]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" out[0]=fbout_"+string(internal_number)+"_"+string(ss)+" #nmirror_w_bias_fg =0&nmirror_w_bias_bias ="+string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(4)));
        mputl(nmirror_w_bias_str,fd_w);
        mputl("  ",fd_w);
        if scs_m.objs(bl).model.rpar(1) == 1 then
            plcvpr = %t;
            plcloc=[plcloc;"fbout_"+string(internal_number)+"_"+string(ss),string(scs_m.objs(bl).model.rpar(2))+' '+string(scs_m.objs(bl).model.rpar(3))+' 0'];
        end
    end
    internal_number=internal_number+1;
end



