//***************************** OTA ************************************
if(blk_name.entries(bl)=='ota')  then
    mputl("#OTA "+string(bl),fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        ota_str= '.subckt ota in[0]=net' + string(blk(blk_objs(bl),2))+"_" + string(ss)+' in[1]=net'+ string(blk(blk_objs(bl),3))+"_" + string(ss)+' out[0]=net'+ string(blk(blk_objs(bl),2+numofip))+"_" + string(ss)+" #ota_bias =" + string(sprintf('%e',scs_m.objs(blk_objs(bl)).model.rpar(1)));
        mputl(ota_str,fd_w);
        mputl("  ",fd_w);
    end
end
