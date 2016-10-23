//**************************** Integrator ******************************
if (blk_name.entries(bl) =='integrator') then
    //addvmm = %t;
    mputl("# INTEGRATOR",fd_w);
    ii= scs_m.objs(bl).model.ipar(1)
    for ss=1:ii
        integrator_str= ".subckt integrator in[0]=net" + string(blk(blk_objs(bl),2))+ "_1"+" in[1]=net" + string(blk(blk_objs(bl),3))+ "_"+string(ss)+" in[2]=net" + string(blk(blk_objs(bl),4))+ "_1"+" out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+"_" + string(ss)+" #integrator_fg =0";

        capcap = scs_m.objs(blk_objs(bl)).model.rpar(3);
        select capcap
        case 1 then integrator_str= integrator_str +"&itg_cap_1x =0";
        case 2 then integrator_str= integrator_str +"&itg_cap_1x =0"+"&itg_cap_2x =0";
        case 3 then integrator_str= integrator_str +"&itg_cap_1x =0"+"&itg_cap_2x =0"+"&itg_cap_3x =0";
        case 4 then integrator_str= integrator_str +"&itg_cap_1x =0"+"&itg_cap_2x =0"+"&itg_cap_3x =0"+"&itg_cap_4x =0";
        else error("Capacitor cannot be compiled.");
        end
        integrator_str= integrator_str +"&integrator_ota0 =" +string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(1)))+"&integrator_ota1 =" +string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(2)));
        mputl(integrator_str,fd_w);
        mputl("  ",fd_w);
    end
    if scs_m.objs(bl).model.ipar(1) == 16 then
        plcvpr = %t;
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_1',' 2 4 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_2',' 2 5 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_3',' 2 6 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_4',' 2 7 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_5',' 2 8 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_6',' 3 4 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_7',' 3 5 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_8',' 3 6 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_9',' 3 7 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_10',' 3 8 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_11',' 6 6 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_12',' 6 7 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_13',' 6 8 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_14',' 7 6 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_15',' 7 7 0'];
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_16',' 7 8 0'];
    end
end
