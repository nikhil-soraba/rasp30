//**************************** bias_gen **********************************
if (blk_name.entries(bl) == "bias_gen") then
    mputl("#bias_gen",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)

        l1_str= ".subckt bias_gen in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" out[0]=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(ss)+" out[1]=net"+string(blk(blk_objs(bl),3+numofip))+"_"+string(ss)+" #bias_gen_fg[0] =0&bias_gen_current1 ="+string(sprintf('%e',scs_m.objs(bl).model.rpar(1)))+'&bias_gen_current2 ="+string(sprintf('%e',scs_m.objs(bl).model.rpar(2)))';
        
        mputl(l1_str,fd_w);
        mputl("  ",fd_w);
    end
    mputl("",fd_w);
end
