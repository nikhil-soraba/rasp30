//************************* VMM_WTA nbias ************************************
if (blk_name.entries(bl) =='vmm_wta_nbias') then 
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
    mputl("#VMM_WTA_NBIAS",fd_w);
    mputl(".subckt vmm4x4 in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(1)+ " in[1]=net"+string(blk(blk_objs(bl),2))+"_"+string(2)+ " in[2]=net"+string(blk(blk_objs(bl),2))+"_"+string(3)+ " in[3]=net"+string(blk(blk_objs(bl),2))+"_"+string(4)+ " out[0]=vmm_out1 out[1]=vmm_out2 out[2]=vmm_out3 out[3]=vmm_out4 #vmm4x4_target =" +string(sprintf(tar1,tar2)),fd_w)
    mputl("  ",fd_w);
    mputl(".subckt wta in[0]=vmm_out1 in[1]=nfet_d out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+"_" + string(1)+" #wta_fg =0&wta_bufbias =" +string(sprintf('%1.1e',scs_m.objs(blk_objs(bl)).model.rpar(1)))+"&wta_pfetbias =" +string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(2))),fd_w)
    mputl("  ",fd_w);
    mputl(".subckt wta in[0]=vmm_out2 in[1]=nfet_d out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+"_" + string(2)+" #wta_fg =0&wta_bufbias =" +string(sprintf('%1.1e',scs_m.objs(blk_objs(bl)).model.rpar(1)))+"&wta_pfetbias =" +string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(3))),fd_w)
    mputl("  ",fd_w);
    mputl(".subckt wta in[0]=vmm_out3 in[1]=nfet_d out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+"_" + string(3)+" #wta_fg =0&wta_bufbias =" +string(sprintf('%1.1e',scs_m.objs(blk_objs(bl)).model.rpar(1)))+"&wta_pfetbias =" +string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(4))),fd_w)
    mputl("  ",fd_w);
    mputl(".subckt wta in[0]=vmm_out4 in[1]=nfet_d out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+"_" + string(4)+" #wta_fg =0&wta_bufbias =" +string(sprintf('%1.1e',scs_m.objs(blk_objs(bl)).model.rpar(1)))+"&wta_pfetbias =" +string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(5))),fd_w)
    mputl("  ",fd_w);
    mputl(".subckt nmirror_vmm in[0]=nfet_d out=nfet_d #nmirror_bias[0] ="+string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(6))),fd_w);
    mputl("  ",fd_w);
end
