//************************ Voltage Divider ****************************
if (blk_name.entries(bl) =='vol_div') then
    mputl("# Voltage Divider",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        vol_div_str= ".subckt volt_div in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+ " in[1]=net"+string(blk(blk_objs(bl),3))+"_1"+" out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+"_" + string(ss)+" #volt_div_fg =0&vd_ota_bias =9e-6";
        capcap1 = scs_m.objs(blk_objs(bl)).model.rpar(1);
        select capcap1
        case 1 then vol_div_str= vol_div_str +"&cap_1x_vd_Vin =0";
        case 2 then vol_div_str= vol_div_str +"&cap_2x_vd_Vin =0";
        case 3 then vol_div_str= vol_div_str +"&cap_1x_vd_Vin =0"+"&cap_2x_vd_Vin =0";
        case 4 then vol_div_str= vol_div_str +"&cap_4x_vd_Vin =0";
        else error("Capacitor cannot be compiled.");
        end
        capcap2 = scs_m.objs(blk_objs(bl)).model.rpar(2);
        select capcap2
        case 0 then vol_div_str= vol_div_str;
        case 1 then vol_div_str= vol_div_str +"&cap_1x_vd_gnd0 =0";
        case 2 then vol_div_str= vol_div_str +"&cap_2x_vd_gnd0 =0";
        case 3 then vol_div_str= vol_div_str +"&cap_1x_vd_gnd0 =0"+"&cap_2x_vd_gnd0 =0";
        case 4 then vol_div_str= vol_div_str +"&cap_4x_vd_gnd0 =0";
        case 5 then vol_div_str= vol_div_str +"&cap_4x_vd_gnd0 =0"+"&cap_1x_vd_gnd1 =0";
        case 6 then vol_div_str= vol_div_str +"&cap_4x_vd_gnd0 =0"+"&cap_2x_vd_gnd1 =0";
        case 7 then vol_div_str= vol_div_str +"&cap_4x_vd_gnd0 =0"+"&cap_1x_vd_gnd1 =0"+"&cap_2x_vd_gnd1 =0";
        case 8 then vol_div_str= vol_div_str +"&cap_4x_vd_gnd0 =0"+"&cap_4x_vd_gnd1 =0";
        case 14 then vol_div_str= vol_div_str +"&cap_1x_vd_gnd0 =0"+"&cap_2x_vd_gnd0 =0"+"&cap_4x_vd_gnd0 =0"+"&cap_1x_vd_gnd1 =0"+"&cap_2x_vd_gnd1 =0"+"&cap_4x_vd_gnd1 =0";
        else error("Capacitor cannot be compiled.");
        end
        vol_div_str= vol_div_str +"&vd_target ="+string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(3)));
        mputl(vol_div_str,fd_w);
        mputl("  ",fd_w);
        if scs_m.objs(bl).model.rpar(4) == 1 then
            plcvpr = %t;
            plcloc=[plcloc;"net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(ss),string(scs_m.objs(bl).model.rpar(5+(ss-1)*2))+' '+string(scs_m.objs(bl).model.rpar(6+(ss-1)*2))+' 0'];
        end
    end
end
