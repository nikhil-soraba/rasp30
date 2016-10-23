//**************************** inv_mcab **********************************
if (blk_name.entries(bl) == "inv_mcab") then
    mputl("#inv_mcab",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        inv_mcab_str= '.subckt inv_mcab'+' in[0]=net'+string(blk(blk_objs(bl),2))+'_'+string(ss)+' out[0]=net'+string(blk(blk_objs(bl),2+numofip))+'_'+string(ss)+' #inv_mcab_ls =0'
        mputl(inv_mcab_str,fd_w);
    mputl("",fd_w);
    end
end
