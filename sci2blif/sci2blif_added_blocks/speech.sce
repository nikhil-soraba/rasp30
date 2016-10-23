//**************************** Speech **********************************
if (blk_name.entries(bl) =='speech') then
    addvmm = %t;
    mputl("# speech",fd_w);
    for ss=1:scs_m.objs(bl).model.ipar(1)
        speech_str= '.subckt speech in[0]=net' + string(blk(blk_objs(bl),2))+"_1 in[1]=net"+string(blk(blk_objs(bl),3))+"_1 in[2]=vcc out[0]=net'+ string(blk(blk_objs(bl),2+numofip))+"_" + string(ss)+" out[1]=net'+ string(blk(blk_objs(bl),3+numofip))+"_" + string(ss)+" #c4_ota_bias[0] =" +string(sprintf('%1.3e',scs_m.objs(blk_objs(bl)).model.rpar(2*ss-1)))+"&c4_ota_bias[1] =" +string(sprintf('%1.3e',scs_m.objs(blk_objs(bl)).model.rpar(2*ss)))+"&speech_fg[0] =0&c4_ota_p_bias[0] =105e-9&c4_ota_n_bias[0] =105e-9&c4_ota_p_bias[1] =105e-9&c4_ota_n_bias[1] =105e-9&speech_peakotabias[0] =100e-9&speech_pfetbias[0] =2e-11&speech_peakotabias[1] =9e-10";
        mputl(speech_str,fd_w);
        mputl("  ",fd_w);
        select board_num

        case 2 then plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_'+ string(ss),'6 '+string(ss)+' 0'];
        case 3 then plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_'+ string(ss),'1 '+string(ss)+' 0'];   
        end
    end
end
