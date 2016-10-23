function [x,y,typ]=nmirror_w_bias(job,arg1,arg2)
    // Copyright INRIA
    x=[];y=[];typ=[];
    select job
    case 'plot' then standard_draw(arg1)
    case 'getinputs' then [x,y,typ]=standard_inputs(arg1)
    case 'getoutputs' then [x,y,typ]=standard_outputs(arg1)
    case 'getorigin' then [x,y]=standard_origin(arg1)
    case 'set' then
        x=arg1; graphics=arg1.graphics; model=arg1.model; exprs=graphics.exprs;
        while %t do
            [ok,in_num,fix_loc,nmr_bias,exprs]=scicos_getvalue('parameters',['No. of Inputs';'Fix_location';'nmirror_bias'],list('vec',1,'vec',-1,'vec',-1),exprs);
            if ~ok then break,end

            if ok then
                model.ipar=in_num;
                model.rpar= [fix_loc',nmr_bias];
                graphics.exprs=exprs;
                x.graphics=graphics;
                x.model=model;
                break;
            end
        end
    case 'define' then
        in_num=1;
        nmr_bias=10e-9;
        fix_loc=[0;0;0];
        model=scicos_model();
        //model.sim=list('nmirror_w_bias_c',5)
        model.in=1;
        model.in2=1;
        model.intyp=-1;
        model.ipar=in_num;
        model.rpar= [fix_loc',nmr_bias];
        //model.state=zeros(1,1);
        model.blocktype='d';
        model.dep_ut=[%t %f];

        exprs=[sci2exp(in_num);sci2exp(fix_loc);sci2exp(nmr_bias)]; //sci2exp(in_num);
        gr_i=['txt=''nmirror_w_bias'';';'xstringb(orig(1),orig(2),txt,sz(1),sz(2),''fill'')'];
        x=standard_define([6 2],model,exprs,gr_i);
    end
endfunction
