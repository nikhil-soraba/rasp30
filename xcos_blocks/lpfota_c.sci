function block=lpfota_c(block,flag)
    if flag ==1
        r = 1:block.ipar(1)
        block.outptr(1)(r)=block.x(r)
    elseif flag==0
        kap= 0.7;
        j = 1:block.ipar(1)
        C = 5e-9*ones(block.ipar(1),1);
        tau=1 ./(2*%pi*block.rpar(j));
        Ut = 0.256;
        Ibias= (2*C*Ut)./(kap*tau);

        block.xd(j)=(Ibias./C).*tanh((kap*(block.inptr(1)(j)-block.x(j)))/(2*Ut))
    end
endfunction 

