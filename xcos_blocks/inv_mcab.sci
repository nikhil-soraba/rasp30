function [x,y,typ]=inv_mcab(job,arg1,arg2)
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
            [ok, in_out_num, exprs]=scicos_getvalue('New Block Parameter',['number of blocks'],list('vec',-1),exprs)
            
            if ~ok then break,end
            if ok then
                model.ipar=in_out_num
                model.rpar=[]
                graphics.exprs=exprs;
                x.graphics=graphics;
                x.model=model
                break;
            end
        end
    case 'define' then
        in_out_num=1
        model=scicos_model()
        model.sim=list('inv_mcab_c',5)
        model.in=[-1;]
        model.in2=[-1;]
        model.intyp=[-1;]
        model.out=[-1;]
        model.out2=[-1;]
        model.outtyp=[-1;]
        model.ipar=in_out_num
        //model.state=zeros(1,1)
        model.rpar=[]
        model.blocktype='d'
        model.dep_ut=[%f %t] //[block input has direct feedthrough to output w/o ODE   block always active]
        
        exprs=[sci2exp(in_out_num)]
        gr_i=['txt=[''inv_mcab''];';'xstringb(orig(1),orig(2),txt,sz(1),sz(2),''fill'');']
        x=standard_define([5 2],model, exprs,gr_i) //Numbers define the width and height of block
    end
endfunction
