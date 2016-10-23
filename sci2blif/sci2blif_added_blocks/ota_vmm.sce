//**************************** ota_vmm **********************************
if (blk_name.entries(bl) == "ota_vmm") then
addvmm = %t;
    mputl("#ota_vmm",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        l1_str= ".subckt ota_vmm in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" in[1]=net"+string(blk(blk_objs(bl),3))+"_"+string(ss)+" out[0]=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(ss)+" #ota_bias ="+string(sprintf('%e',scs_m.objs(bl).model.rpar(1)));
        mputl(l1_str,fd_w);
        mputl("  ",fd_w);
        select board_num
         case 2  plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_'+ string(ss),' 11 '+string(ss)+' 0']; 
         case 3 plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_'+ string(ss),' 5 '+string(ss)+' 0']; 
           end
    end
    mputl("",fd_w);
end
