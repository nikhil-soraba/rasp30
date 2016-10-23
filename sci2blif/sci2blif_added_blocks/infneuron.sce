//************************** INF Neuron ********************************
if (blk_name.entries(bl) =='infneuron') then  //FIX For Multiple blocks 
    mputl("# INF Neuron",fd_w);
    mputl(".subckt INFneuron in[0]=net"+string(blk(blk_objs(bl),2))+"_1"+ " in[1]=net"+string(blk(blk_objs(bl),3))+"_1"+ " in[2]=net"+string(blk(blk_objs(bl),4))+"_1"+ " out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+"_1"+" #c4_ota_bias[1] =" +string(sprintf('%1.12f',scs_m.objs(blk_objs(bl)).model.rpar(1))) + "&c4_ota_bias[0] =" +string(sprintf('%1.12f',scs_m.objs(blk_objs(bl)).model.rpar(2))) + "&INF_bias[0] =" +string(sprintf('%1.12f',scs_m.objs(blk_objs(bl)).model.rpar(3))) +"&INF_fg[0] =0", fd_w);
    mputl("  ",fd_w);
end
