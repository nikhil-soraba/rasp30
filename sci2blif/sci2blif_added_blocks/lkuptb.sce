//**************************** LOOKUP Table ********************************
if(blk_name.entries(bl)=='lkuptb')  then
    mputl("# LOOKUP Table-> "+scs_m.objs(blk_objs(bl)).model.opar(1),fd_w);
    truecase=strsplit(scs_m.objs(blk_objs(bl)).model.opar(2)," ")
    if scs_m.objs(bl).model.ipar(1) == 1 then
        lkuptb_str='.names'+' net' + string(blk(blk_objs(bl),2))+"_" + string(1)+' tg4logic_1 tg4logic_2 tg4logic_3'+' net'+ string(blk(blk_objs(bl),2+numofip))+"_" + string(1);
    end
    if scs_m.objs(bl).model.ipar(1) == 2 then
        lkuptb_str='.names'+' net' + string(blk(blk_objs(bl),2))+"_" + string(1)+' net'+ string(blk(blk_objs(bl),3))+"_" + string(1)+' tg4logic_1 tg4logic_2'+' net'+ string(blk(blk_objs(bl),2+numofip))+"_" + string(1);
    end
    if scs_m.objs(bl).model.ipar(1) == 3 then
        lkuptb_str='.names'+' net' + string(blk(blk_objs(bl),2))+"_" + string(1)+' net'+ string(blk(blk_objs(bl),3))+"_" + string(1)+' net' + string(blk(blk_objs(bl),4))+"_" + string(1)+' tg4logic_1'+' net'+ string(blk(blk_objs(bl),2+numofip))+"_" + string(1);
    end
    if scs_m.objs(bl).model.ipar(1) == 4 then
        lkuptb_str='.names'+' net' + string(blk(blk_objs(bl),2))+"_" + string(1)+' net'+ string(blk(blk_objs(bl),3))+"_" + string(1)+' net' + string(blk(blk_objs(bl),4))+"_" + string(1)+' net'+ string(blk(blk_objs(bl),5))+"_" + string(1)+' net'+ string(blk(blk_objs(bl),2+numofip))+"_" + string(1);
    end
    mputl(lkuptb_str,fd_w);
    for i=1:size(truecase,1)
        mputl(truecase(i)+' 1',fd_w);
    end
    mputl("  ",fd_w)
    if scs_m.objs(bl).model.rpar(1) == 1 then
        plcvpr = %t;
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_1',string(scs_m.objs(bl).model.rpar(2))+' '+string(scs_m.objs(bl).model.rpar(3))+' 0'];
    end

    //**************************** LPF *************************************
elseif (blk_name.entries(bl) =='lpf') then 
    mputl("# lpf",fd_w);
    for otabuf_i = 1:scs_m.objs(bl).model.rpar(1)
        lpf_str=".subckt lpf in[0]=net"+string(blk(blk_objs(bl),2))+ "_" + string(otabuf_i)+" out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+ "_" + string(otabuf_i)+ " #ota_biasfb[0] =" +string(sprintf('%1.12f',scs_m.objs(blk_objs(bl)).model.rpar(2)))+" &lpf_fg[0] =0";
        lpfcap = scs_m.objs(blk_objs(bl)).model.rpar(3)
        select lpfcap
        case 1 then lpf_str= lpf_str +"&lpf_cap_1x[0] =0";
        case 2 then lpf_str= lpf_str +"&lpf_cap_2x[0] =0";
        case 3 then lpf_str= lpf_str +"&lpf_cap_3x[0] =0";
        case 4 then lpf_str= lpf_str +"&lpf_cap_3x[0] =0"+"&lpf_cap_1x[1] =0";
        case 5 then lpf_str= lpf_str +"&lpf_cap_3x[0] =0"+"&lpf_cap_2x[1] =0";
        case 6 then lpf_str= lpf_str +"&lpf_cap_3x[0] =0"+"&lpf_cap_2x[1] =0"+"&lpf_cap_1x[2] =0";
        case 18 then lpf_str= lpf_str +"&lpf_cap_3x[0] =0"+"&lpf_cap_2x[0] =0"+"&lpf_cap_1x[0] =0"+"&lpf_cap_3x[2] =0"+"&lpf_cap_2x[2] =0"+"&lpf_cap_1x[2] =0" +"&lpf_cap_3x[3] =0"+"&lpf_cap_2x[3] =0"+"&lpf_cap_1x[3] =0";
        else error("LPF capacitor cannot be compiled.");
        end
        mputl(lpf_str,fd_w);
        mputl("  ",fd_w);
    end
end
