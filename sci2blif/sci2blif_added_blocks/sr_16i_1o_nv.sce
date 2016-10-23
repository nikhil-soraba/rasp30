//**** Shift Register 16inputs 1output (non vecterized version) ********
if (blk_name.entries(bl) =='sr_16i_1o_nv') then
    addvmm = %t;
    mputl("# Shift register 16inputs 1output",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        sr_1i_16o_nv_str= ".subckt sftreg in[0]=net"+string(blk(blk_objs(bl),2))+"_"+string(ss)+" in[1]=net"+string(blk(blk_objs(bl),3))+"_"+string(ss)+" in[2]=net"+string(blk(blk_objs(bl),4))+"_"+string(ss)+" in[3]=net"+string(blk(blk_objs(bl),5))+"_"+string(ss)+" in[4]=net"+string(blk(blk_objs(bl),6))+"_"+string(ss)+" in[5]=net"+string(blk(blk_objs(bl),7))+"_"+string(ss)+" in[6]=net"+string(blk(blk_objs(bl),8))+"_"+string(ss)+" in[7]=net"+string(blk(blk_objs(bl),9))+"_"+string(ss)+" in[8]=net"+string(blk(blk_objs(bl),10))+"_"+string(ss)+" in[9]=net"+string(blk(blk_objs(bl),11))+"_"+string(ss)+" in[10]=net"+string(blk(blk_objs(bl),12))+"_"+string(ss)+" in[11]=net"+string(blk(blk_objs(bl),13))+"_"+string(ss)+" in[12]=net"+string(blk(blk_objs(bl),14))+"_"+string(ss)+" in[13]=net"+string(blk(blk_objs(bl),15))+"_"+string(ss)+" in[14]=net"+string(blk(blk_objs(bl),16))+"_"+string(ss)+" in[15]=net"+string(blk(blk_objs(bl),17))+"_"+string(ss)+" in[16]=net"+string(blk(blk_objs(bl),18))+"_1"+" in[17]=net"+string(blk(blk_objs(bl),19))+"_1"+" in[18]=net"+string(blk(blk_objs(bl),20))+"_1"+" out[0]=net"+string(blk(blk_objs(bl),2+numofip))+"_"+string(ss)+" out[1]=net"+string(blk(blk_objs(bl),3+numofip))+"_"+string(ss)+" out[2]=net"+string(blk(blk_objs(bl),4+numofip))+"_"+string(ss)+" out[3]=net"+string(blk(blk_objs(bl),5+numofip))+"_"+string(ss)+" #sftreg_fg =0";
        mputl(sr_1i_16o_nv_str,fd_w);
        mputl("  ",fd_w);
        select board_num
        case 2 then plcloc=[plcloc;"net"+string(blk(blk_objs(bl),2+numofip))+"_1",'11 '+string(ss+5)+' 0'];
        case 3 then plcloc=[plcloc;"net"+string(blk(blk_objs(bl),2+numofip))+"_1",'5 '+string(ss+5)+' 0'];  
        end
    end
end
