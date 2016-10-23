//************************* VMM_WTA ************************************
if (blk_name.entries(bl) =='vmm12x1_wowta') then 
    addvmm = %t;

    k =scs_m.objs(blk_objs(bl)).model.opar(1);
    tar1=[];
    tar2=[];
    tar3=[];
    for j=1:12
        if j == 12 then tar1=tar1+'%1.2e';
        else tar1=tar1+'%1.2e,';
        end
    end
    j = size(k,2)+1;
    for i=1:size(k,1) 
        tar3='k('+string(i)+',:) ';
        for n = j:12
            tar3=tar3+'50e-12 ';
        end
        tar2(i,:)=evstr(tar3);          
    end
    mputl("# VMM12x1",fd_w);
    vmm12_1 =".subckt vmm12x1_wowta";
    for i = 1:size(k,2)
        vmm12_1 = vmm12_1 + " in["+ string(i-1)+"]=net"+string(blk(blk_objs(bl),2))+"_"+string(i);
    end
    if j < 13 then
        for i = j:12
            vmm12_1 = vmm12_1 + " in["+ string(i-1)+"]=net"+string(blk(blk_objs(bl),2))+"_"+string(1);
        end
    end
    for i = 1:size(k,1)
        vmm12_1o = vmm12_1 + " out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+"_" + string(i)+" #vmm12x1_wowta_fg =0";
        vmm12_1target="&vmm12x1_target =" +string(sprintf(tar1,tar2(i,:)));
        mputl(vmm12_1o+vmm12_1target,fd_w);
        mputl("  ",fd_w);
        vmm12_1target=[];
        vmm12_1o=[];
        select board_num
        case 2 then
            if sftreg_count >0
                plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+"_" + string(i),'10 '+string(sftreg_count+i)+' 0'];
            else
                plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+"_" + string(i),'10 '+string(i)+' 0'];
            end
        case 3 then
            if sftreg_count >0
                plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+"_" + string(i),'5 '+string(sftreg_count+i)+' 0'];
            else
                plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+"_" + string(i),'5 '+string(i)+' 0'];         
            end
        end
    end
    mputl("  ",fd_w);
end
