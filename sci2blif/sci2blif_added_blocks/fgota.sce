//**************************** FG OTA **********************************
if(blk_name.entries(bl)=='fgota')  then
    //plcvpr = %t; //Michelle
    mputl("#FGOTA "+string(bl),fd_w);
    fgibias = strsplit(scs_m.objs(blk_objs(bl)).model.rpar(1)," ");
    fgpibias = strsplit(scs_m.objs(blk_objs(bl)).model.rpar(2)," ");
    fgnibias = strsplit(scs_m.objs(blk_objs(bl)).model.rpar(3)," ");
    for ss=1:scs_m.objs(bl).model.ipar(1)
        ota_str= '.subckt fgota in[0]=net' + string(blk(blk_objs(bl),2)) +"_" + string(ss)+' in[1]=net'+ string(blk(blk_objs(bl),3)) +"_" + string(ss)+ ' out[0]=net'+ string(blk(blk_objs(bl),2+numofip))+ "_" + string(ss);
        //feedback configuration
        if ((blk(blk_objs(bl),2) == blk(blk_objs(bl),2+numofip)) | (blk(blk_objs(bl),3) == blk(blk_objs(bl),2+numofip))) then
            ota_str= ota_str +" #fgota_biasfb =" + fgibias(ss)+ "&ota_p_bias =" + fgpibias(ss)+"&ota_n_bias =" + fgnibias(ss);
        else //non-feedback configuration
            ota_str= ota_str +" #ota_bias =" +fgibias(ss) + "&ota_p_bias =" +fgpibias(ss)+"&ota_n_bias =" + fgnibias(ss);
        end
        if scs_m.objs(blk_objs(bl)).model.ipar(1+ss) == 1 then
            ota_str= ota_str +"&ota_small_cap =0";
        end
        mputl(ota_str,fd_w);
        mputl("  ",fd_w);
    end
end
