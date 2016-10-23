//************************** Dendritic Diffuser new **********************************
if (blk_name.entries(bl) =='Dendrite') then
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

    mputl("# Dendrite Diffuser",fd_w);
    for ss=1:1
        den_str1= '.subckt dendrite_4x4 in[0]=net' + string(blk(blk_objs(bl),2)) +"_" + string(ss)+ " in[1]=net' + string(blk(blk_objs(bl),3)) +"_" + string(ss)+' in[2]=net' + string(blk(blk_objs(bl),4)) +"_" + string(ss)+' in[3]=net' + string(blk(blk_objs(bl),5)) +"_" + string(ss)+ " out[0]=net'+ string(blk(blk_objs(bl),2+numofip))+ "_" + string(ss)+' out[1]=net'+ string(blk(blk_objs(bl),3+numofip))+ "_" + string(ss)+' out[2]=net'+ string(blk(blk_objs(bl),4+numofip))+ "_" + string(ss)+' out[3]=net'+ string(blk(blk_objs(bl),5+numofip))+ "_" + string(ss)+' #dendrite_4x4_fg =0&dendrite_4x4_target =' +string(sprintf(tar1,tar2));
        mputl(den_str1,fd_w);
        mputl("  ",fd_w)
    end
end
