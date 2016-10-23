//**************************** OTA Buffer2 *****************************
if (blk_name.entries(bl) =='ota_3') then 
    mputl("# ota_buffer",fd_w);
    for otabuf_i = 1:scs_m.objs(bl).model.rpar(2)
        mputl(".subckt ota_buffer in[0]=net"+string(blk(blk_objs(bl),2))+ "_" + string(otabuf_i)+" out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+ "_" + string(otabuf_i)+ " #ota_biasfb =" +string(sprintf('%1.12f',scs_m.objs(blk_objs(bl)).model.rpar(1))),fd_w);
        mputl("  ",fd_w);
    end
end
