//************************* VMM_4by4 ************************************
if (blk_name.entries(bl) =='vmm_4by4') then 
    addvmm = %t;
    k =scs_m.objs(blk_objs(bl)).model.opar(1);
    tar1=[];
    tar2=[];
    for i=1:size(k,1) 
        for j=1:size(k,2)
            if (j == size(k,2)) & (i == size(k,1)) then tar1=tar1+'%1.2e';
            else tar1=tar1+'%1.2e,';
            end
        end
        tar2=tar2+'k('+string(i)+',:) ';
    end
    tar2= evstr(tar2);
    mputl("# VMM ",fd_w);
    mputl(".subckt vmm4x4 in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(1)+ " in[1]=net"+string(blk(blk_objs(bl),2))+"_"+string(2)+ " in[2]=net"+string(blk(blk_objs(bl),2))+"_"+string(3)+ " in[3]=net"+string(blk(blk_objs(bl),2))+"_"+string(4)+ " out[0]=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(1)+ " out[1]=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(2)+ " out[2]=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(3)+ " out[3]=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(4)+" #vmm4x4_target =" +string(sprintf(tar1,tar2)),fd_w)
    mputl("  ",fd_w);
end
