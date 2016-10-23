//************************* Half Wave Rectifier ******************************
if (blk_name.entries(bl) =='h_rect') then
    mputl("# h_rect",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        //.subckt h_rect in[0]=in1 in[1]=in2 out=out #h_rect_bias[0] =1e-6  &  h_rect_fg[0] =0
        cap_str= ".subckt h_rect in[0]=net" + string(blk(blk_objs(bl),2)) + "_" + string(2*ss-1) + " in[1]=net" + string(blk(blk_objs(bl),3)) + "_" + string(2*ss-1) + " out=net"+ string(blk(blk_objs(bl),2+numofip)) + "_" + string(2*ss-1) + " #h_rect_bias[0] =" + string(sprintf('%1.12f',scs_m.objs(blk_objs(bl)).model.rpar(ss))) + "&h_rect_fg[0] =0";
        mputl(cap_str,fd_w);
        mputl("  ",fd_w);
    end
end
