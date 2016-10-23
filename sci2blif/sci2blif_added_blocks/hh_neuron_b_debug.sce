//*************** HH neuron b debug **********************
if (blk_name.entries(bl) =='hh_neuron_b_debug') then
    mputl("# HH neuron b debug",fd_w);
    hh_neuron_b_debug_str= ".subckt hh_neuron_b_debug"
    for ss=1:scs_m.objs(bl).model.ipar(1)
        hh_neuron_b_debug_str=hh_neuron_b_debug_str+" in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" in[1]=net"+string(blk(blk_objs(bl),3))+"_1"+" in[2]=net"+string(blk(blk_objs(bl),4))+"_1"+" in[3]=net"+string(blk(blk_objs(bl),5))+"_1"+" out[0]=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(ss)+" out[1]=net"+string(blk(blk_objs(bl),3+numofip))+"_1"+" out[2]=net"+string(blk(blk_objs(bl),4+numofip))+"_1"+" #hh_neuron_b_local[0] =0&hh_neuron_b_bias_1[0] ="+string(sprintf('%1.2e',scs_m.objs(bl).model.rpar(1)))+"&hh_neuron_b_bias_2[0] ="+string(sprintf('%1.2e',scs_m.objs(bl).model.rpar(2)))+"&hh_neuron_b_bias_3[0] ="+string(sprintf('%1.2e',scs_m.objs(bl).model.rpar(3)))+"&hh_neuron_b_bias_4[0] =2.0e-06";
    end
    mputl(hh_neuron_b_debug_str,fd_w);
    mputl("  ",fd_w);
    if scs_m.objs(bl).model.ipar(2) == 1 then
        plcvpr = %t;
        plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_1',' '+string(scs_m.objs(bl).model.ipar(3))+' '+string(scs_m.objs(bl).model.ipar(4))+' 0'];
    end
    string(sprintf('%1.2e',scs_m.objs(blk_objs(bl)).model.rpar(ss*3)))
end
