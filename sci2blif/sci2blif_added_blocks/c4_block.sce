//**************************** C4 N:N **********************************
if (blk_name.entries(bl) =='c4_block') then
    mputl("# C4",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        c4_str= ".subckt c4_blk in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+ " in[1]=net"+string(blk(blk_objs(bl),3))+"_"+string(ss)+" out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+"_" + string(ss)+" #c4_ota_bias[1] =" +string(sprintf('%1.12f',scs_m.objs(blk_objs(bl)).model.rpar(3))) + "&c4_ota_bias[0] =" +string(sprintf('%1.12f',scs_m.objs(blk_objs(bl)).model.rpar(4)))+"&c4_fg[0] =0";
        for ii=1:2
            c4cap = scs_m.objs(blk_objs(bl)).model.rpar(ii+4)
            select c4cap
            case 1 then c4_str= c4_str +"&c4_cap_1x[" + string(ii-1) +"] =0";
            case 2 then c4_str= c4_str +"&c4_cap_2x[" + string(ii-1) +"] =0";
            case 3 then c4_str= c4_str +"&c4_cap_3x[" + string(ii-1) +"] =0";
            case 4 then c4_str= c4_str +"&c4_cap_3x[" + string(ii-1) +"] =0"+"&c4_cap_1x[" + string(ii-1) +"] =0";
            case 5 then c4_str= c4_str +"&c4_cap_3x[" + string(ii-1) +"] =0"+"&c4_cap_2x[" + string(ii-1) +"] =0";
            case 6 then c4_str= c4_str +"&c4_cap_3x[" + string(ii-1) +"] =0"+"&c4_cap_2x[" + string(ii-1) +"] =0"+"&c4_cap_1x[" + string(ii-1) +"] =0";
            case 18 then c4_str= c4_str +"&c4_cap_3x[0] =0"+"&c4_cap_2x[0] =0"+"&c4_cap_1x[0] =0"+"&c4_cap_3x[2] =0"+"&c4_cap_2x[2] =0"+"&c4_cap_1x[2] =0" +"&c4_cap_3x[3] =0"+"&c4_cap_2x[3] =0"+"&c4_cap_1x[3] =0";
            else error("C4 capacitor cannot be compiled.");
            end
        end
        mputl(c4_str,fd_w); 
        mputl("  ",fd_w);

        select board_num

        case 2 then plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_'+ string(ss),'6 '+string(ss)+' 0'];
        case 3 then plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_'+ string(ss),'1 '+string(ss)+' 0'];   
        end
    end
end
