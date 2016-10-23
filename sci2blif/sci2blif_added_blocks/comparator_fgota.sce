//****************************Comparator FG OTA **********************************
if(blk_name.entries(bl)=='comparator_fgota')  then
    plcvpr = %t;
    mputl("#FGOTA "+string(bl),fd_w);
    fgibias = strsplit(scs_m.objs(blk_objs(bl)).model.rpar(1)," ");
    fgpibias = strsplit(scs_m.objs(blk_objs(bl)).model.rpar(2)," ");
    fgnibias = strsplit(scs_m.objs(blk_objs(bl)).model.rpar(3)," ");
    for ss=1:scs_m.objs(bl).model.ipar(1)
        ota_str= '.subckt fgota in[0]=net' + string(blk(blk_objs(bl),2)) +"_1 in[1]=net'+ string(blk(blk_objs(bl),3)) +"_" + string(ss)+ ' out[0]=net'+ string(blk(blk_objs(bl),2+numofip))+ "_" + string(ss);
        ota_str= ota_str +" #ota_bias =" +fgibias(ss) + "&ota_p_bias =" +fgpibias(ss)+"&ota_n_bias =" + fgnibias(ss);

        if scs_m.objs(blk_objs(bl)).model.ipar(1+ss) == 1 then
            ota_str= ota_str +"&ota_small_cap =0";
        end
        mputl(ota_str,fd_w);
        mputl("  ",fd_w);

        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_'+ string(ss),'6 '+string(ss)+' 0']; 
    end
end
