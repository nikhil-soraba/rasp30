function [x,y,typ]=adc(job,arg1,arg2)
    // Copyright INRIA
    x=[];y=[];typ=[];
    select job
    case 'plot' then
        standard_draw(arg1)
    case 'getinputs' then //** GET INPUTS 
        [x,y,typ]=standard_inputs(arg1)
    case 'getoutputs' then
        [x,y,typ]=standard_outputs(arg1)
    case 'getorigin' then
        [x,y]=standard_origin(arg1)
    case 'set' then
        x=arg1;
        graphics=arg1.graphics
        model=arg1.model
        exprs=graphics.exprs
        while %t do
            [ok,in_out_num,exprs]=scicos_getvalue('Set ADC Block',['Number of ADC(1 or 2) blocks'],list('vec',-1),exprs)

            if ~ok then break,end

            if ok then
                model.in=[in_out_num]
                model.sim=list('adc_c',5)
                model.ipar=in_out_num
                graphics.exprs=exprs;
                x.graphics=graphics;
                x.model=model
                break;
            end

        end
    case 'define' then
        model=scicos_model()
        in_out_num =1
        model.sim=list('adc_c',5)
        model.in=[in_out_num]
        model.intyp=-1
        model.blocktype='d'
        model.dep_ut=[%t %f]

        exprs=[sci2exp(in_out_num)]
        gr_i=['txt='' ADC '';';'xstringb(orig(1),orig(2),txt,sz(1),sz(2),''fill'')']
        x=standard_define([5 2],model, exprs,gr_i)
    end
endfunction
