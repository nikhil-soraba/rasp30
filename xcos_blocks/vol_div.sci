function [x,y,typ]=vol_div(job,arg1,arg2)
    // Copyright INRIA
    x=[];y=[];typ=[];
    select job
    case 'plot' then standard_draw(arg1)
    case 'getinputs' then [x,y,typ]=standard_inputs(arg1)
    case 'getoutputs' then [x,y,typ]=standard_outputs(arg1)
    case 'getorigin' then [x,y]=standard_origin(arg1)
    case 'set' then 
        x=arg1; graphics=arg1.graphics;exprs=graphics.exprs; model=arg1.model;
        while %t do
            [ok,in_out_num,cap1,cap2,ref_target,fix_loc,exprs]=getvalue('Set voltage divider Parameters', ['Number of voltage divider blocks';'Vin Cap 64fF [1-4X]';'Gnd Cap 64fF [0-8X]';'reference target current';'Fix_location'],list('vec',1,'vec',-1,'vec',-1,'vec',-1,'vec',-1),exprs)

            if ~ok then break,end

            if ok then
                model.in=[in_out_num;in_out_num]
                model.out=in_out_num
                model.ipar=in_out_num
                model.rpar = [cap1,cap2,ref_target,fix_loc']
                graphics.exprs=exprs;x.graphics=graphics;x.model=model
                break
            end
        end
    case 'define' then
        in_out_num =1;
        cap1 = 1;
        cap2 = 1;
        ref_target = 20e-9;
        fix_loc=[0;0;0];
        model=scicos_model();
        //model.sim=list('c4_func',5)
        model.in=[in_out_num;in_out_num];
        model.in2=[1;1];
        model.intyp=[-1;-1];
        model.out=in_out_num;
        model.out2=1;
        model.outtyp=-1;
        model.rpar = [cap1,cap2,ref_target,fix_loc']
        //model.state= state
        model.ipar=in_out_num
        model.blocktype='d'
        model.dep_ut=[%f %t]

        exprs=[sci2exp(in_out_num); sci2exp(cap1); sci2exp(cap2); sci2exp(ref_target); sci2exp(fix_loc)]
        gr_i=['txt=''vol_div '';';'xstringb(orig(1),orig(2),txt,sz(1),sz(2),''fill'')']
        x=standard_define([8 3],model,exprs,gr_i)
    end
endfunction
