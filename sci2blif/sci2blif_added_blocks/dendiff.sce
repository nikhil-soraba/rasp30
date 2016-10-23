//************************** Dendritic Diffuser **********************************
if (blk_name.entries(bl) =='dendiff') then
    mputl("# Dendritic Diffuser",fd_w);
    for ss=1:1 //scs_m.objs(bl).model.ipar(1)
        den_str= '.subckt dendiff in[0]=net' + string(blk(blk_objs(bl),2)) +"_" + string(ss)+ " in[1]=net' + string(blk(blk_objs(bl),3)) +"_" + string(ss)+' in[2]=net' + string(blk(blk_objs(bl),4)) +"_" + string(ss)+' in[3]=net' + string(blk(blk_objs(bl),5)) +"_" + string(ss)+ " in[4]=net' + string(blk(blk_objs(bl),6)) +"_" + string(ss)+' in[5]=net' + string(blk(blk_objs(bl),7)) +"_" + string(ss)+' out[0]=net'+ string(blk(blk_objs(bl),2+numofip))+ "_" + string(ss)+' #dendiff_synapse ='+scs_m.objs(blk_objs(bl)).model.opar(2)+'&dendiff_axial ='+scs_m.objs(blk_objs(bl)).model.opar(3)+'&dendiff_leak ='+scs_m.objs(blk_objs(bl)).model.opar(4)+'&dendiff_vmem ='+scs_m.objs(blk_objs(bl)).model.opar(5);
        mputl(den_str,fd_w);
        mputl("  ",fd_w)
    end
end
