//**************************** Min_detect **********************************
if (blk_name.entries(bl) == "Min_detect") then
    mputl("#Min_detect",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        Min_detect_str= '.subckt Min_detect'+' in[0]=net'+string(blk(blk_objs(bl),2))+'_'+string(ss)+' out[0]=net'+string(blk(blk_objs(bl),2+numofip))+'_'+string(ss)+' #Min_detect_ls =0'+'&Min_detect_fgswc_ibias ='+string(sprintf('%e',scs_m.objs(bl).model.rpar(scs_m.objs(bl).model.ipar(1)*(1-1)+ss)))+'&Min_detect_ota0_ibias ='+string(sprintf('%e',scs_m.objs(bl).model.rpar(scs_m.objs(bl).model.ipar(1)*(2-1)+ss)))
        mputl(Min_detect_str,fd_w);
    mputl("",fd_w);
    end
end
