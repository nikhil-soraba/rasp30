//**************************** OTA Buffer ******************************
if (blk_name.entries(bl) =='ota_buf') then 
    //plcvpr = %t; //Michelle
    mputl("# ota_buf",fd_w);
    for otabuf_i = 1:scs_m.objs(bl).model.rpar(2)
        mputl(".subckt ota_buf in[0]=net"+string(blk(blk_objs(bl),2))+ "_" + string(otabuf_i)+" out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+ "_" + string(otabuf_i)+ " #ota_biasfb =" +string(sprintf('%1.12f',scs_m.objs(blk_objs(bl)).model.rpar(1))),fd_w);
        mputl("  ",fd_w);
        //plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_'+ string(ss),' 1 14 0']; //Michelle
    end
end
