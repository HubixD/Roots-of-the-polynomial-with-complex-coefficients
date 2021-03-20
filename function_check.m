function [fz_check] = function_check(domain,fun,f_root,order)

    for n=1:order
        Aa(n) = 1/(domain(1,1)-f_root(n,1));                                % 1 / [(z(1,1)-z1)(z(1,1)-z2)...(z(1,1)-zN)]
    end
    
    product = 1;
    
    for k=1:length(Aa)
        product = Aa(1,k)*product;                                          %Aa(1,1)*Aa(1,2)*Aa(1,3)*Aa(1,4)...Aa(1,length(Aa))
    end

    a = fun(1,1)*product;                                                   % fz(1,1) * 1 / [(z(1,1)-z1)(z(1,1)-z2)...(z(1,1)-zN)]
    fz_check = a*poly(f_root);
    
end