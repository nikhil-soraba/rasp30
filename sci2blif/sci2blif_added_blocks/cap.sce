//****************************** CAP ***********************************
if (blk_name.entries(bl) =='cap') then
    mputl("#CAP "+string(bl),fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        cap_str = ".subckt cap in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+"_" + string(ss);
        capcap = scs_m.objs(blk_objs(bl)).model.rpar(1)
        select capcap
        case 1 then cap_str= cap_str +" #cap_1x =0";
        case 2 then cap_str= cap_str +" #cap_2x =0";
        case 3 then cap_str= cap_str +" #cap_3x =0";
        case 4 then cap_str= cap_str +" #cap_3x =0"+"&cap_1x =0";
        case 5 then cap_str= cap_str +" #cap_3x =0"+"&cap_2x =0";
        case 6 then cap_str= cap_str +" #cap_3x =0"+"&cap_2x =0"+"&cap_1x =0";
        else error("Capacitor cannot be compiled.");
        end
        mputl(cap_str,fd_w);
        mputl("  ",fd_w);
    end
end
