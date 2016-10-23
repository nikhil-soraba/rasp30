//**************************** NMIRROR_vmm *********************************
if (blk_name.entries(bl) =='nmirror_vmm') then
    mputl("#NMIRROR "+string(bl),fd_w);
    addvmm = %t;
    for ss=1:scs_m.objs(bl).model.opar(1)
        nmirror_str= ".subckt nmirror_vmm in[0]=vcc out=net"+ string(blk(blk_objs(bl),2+numofip))+'_' + string(ss)+" #nmirror_bias[0] =" +string(sprintf('%1.3e',scs_m.objs(blk_objs(bl)).model.opar(2*ss)));
        mputl(nmirror_str,fd_w);
        mputl("  ",fd_w);
    end
end
