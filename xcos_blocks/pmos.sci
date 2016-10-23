//  Scicos
//
//  Copyright (C) INRIA - METALAU Project <scicos@inria.fr>
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
//
// See the file ../license.txt
//

function [x,y,typ]=pmos(job,arg1,arg2)
x=[];y=[];typ=[];
select job
case 'plot' then
standard_draw(arg1,%f) 

case 'getinputs' then
   [x,y,typ]=standard_inputs(arg1)
case 'getoutputs' then
   [x,y,typ]=standard_outputs(arg1)
case 'getorigin' then
  [x,y]=standard_origin(arg1)
case 'set' then
  x=arg1;
  graphics=arg1.graphics;exprs=graphics.exprs
  model=arg1.model;
  while %t do
    [ok,K,Ith,sig,VT0,exprs]=scicos_getvalue('Set NMOS Transistor parameters',..
	['Kappa ';..
	 	 'Ith [A]';..
	 'sigma';..
      'VT0 [V] ';],      list('vec',-1,'vec',-1,'vec',-1,'vec',-1),exprs)
	 
    if ~ok then break,end
    model.equations.parameters(2)=list(K,Ith,sig,VT0)
    graphics.exprs=exprs
    x.graphics=graphics;x.model=model
    break
  end
case 'define' then
  model=scicos_model()
   K=0.7;
   Ith=1e-12;
   sig=1e-4;
   VT0=0.45;
   
  model.sim='pmos';
  model.blocktype='c';
  model.dep_ut=[%t %f];
  mo=modelica()
  mo.model='pmos';
  mo.outputs=['S';'B';'D']
  mo.inputs='G';
  mo.parameters=list(['K';'Ith';'sig';'VT0'],[K;Ith;sig;VT0]);
  model.equations=mo
  model.in=ones(size(mo.inputs,'*'),1)
  model.out=ones(size(mo.outputs,'*'),1)
  exprs=[string(K);string(Ith);string(sig);string(VT0)]
  
  gr_i=['text=[''pmos''];';'xstringb(orig(1),orig(2),text,sz(1),sz(2),''fill'');']
    
  x=standard_define([2 2],model,exprs,gr_i)
  x.graphics.in_implicit=['I']
  x.graphics.out_implicit=['I';'I';'I']
end
endfunction

