function [x,y,typ]=Adaptive_receptor(job,arg1,arg2)
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
            [ok, in_out_num, FGOTA_4_Ibias, FGOTA_4_Ibias_p, FGOTA_4_Ibias_n, exprs]=scicos_getvalue('New Block Parameter',['number of blocks'; 'OTAbuf_bias'; 'Pfet_bias'; 'OTA_bias'],list('vec',-1, 'vec', -1, 'vec', -1, 'vec', -1),exprs)
            
            if ~ok then break,end
            if ok then
                model.ipar=in_out_num
                model.rpar=[FGOTA_4_Ibias FGOTA_4_Ibias_p FGOTA_4_Ibias_n ]
                graphics.exprs=exprs;
                x.graphics=graphics;
                x.model=model
                break;
            end
        end
    case 'define' then
        in_out_num=1
        FGOTA_4_Ibias=10e-9
        FGOTA_4_Ibias_p=10e-9
        FGOTA_4_Ibias_n=10e-9
        model=scicos_model()
        model.sim=list('Adaptive_receptor_c',5)
        model.in=[-1;-1;]
        model.in2=[-1;-1;]
        model.intyp=[-1;-1;]
        model.out=[-1;]
        model.out2=[-1;]
        model.outtyp=[-1;]
        model.ipar=in_out_num
        //model.state=zeros(1,1)
        model.rpar=[FGOTA_4_Ibias FGOTA_4_Ibias_p FGOTA_4_Ibias_n ]
        model.blocktype='d'
        model.dep_ut=[%f %t] //[block input has direct feedthrough to output w/o ODE   block always active]
        
        exprs=[sci2exp(in_out_num);sci2exp(FGOTA_4_Ibias);sci2exp(FGOTA_4_Ibias_p);sci2exp(FGOTA_4_Ibias_n)]
        gr_i=['txt=[''Adaptive_receptor''];';'xstringb(orig(1),orig(2),txt,sz(1),sz(2),''fill'');']
        x=standard_define([5 2],model, exprs,gr_i) //Numbers define the width and height of block
    end
endfunction
