function [SD] = fun_SD(IM1, IM2)
% Calcula la diferencia de intenmsidades entre IM1 y cada una de IM2

[a1, b1, c1, c2, c3, c4]=size(IM2);
SD=zeros(c1, c2, c3, c4);

for k1=1:c1
    for k2=1:c2
        for k3=1:c3
            for k4=1:c4
                IM1_IM2=(IM1-IM2(:,:,k1,k2,k3,k4)).^2;
                sombra=IM1.*IM2(:,:,k1,k2,k3,k4);
                M=max(sombra); M=max(M);
                sombra=sombra/M;
                sombra=ceil(sombra);
                n=sum(sum(sombra));
                SD(k1, k2, k3, k4)= sum(sum(IM1_IM2.*sombra));
                SD(k1, k2, k3, k4)=SD(k1, k2, k3, k4)/n;
            end
        end
    end
end