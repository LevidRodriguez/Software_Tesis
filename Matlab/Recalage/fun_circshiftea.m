function [IMP2] = fun_circshiftea(IM, DYi, DYs, DeltaDY, DXi, DXs, DeltaDX)


NDY=((DYs-DYi)/DeltaDY)+1;
NDX=((DXs-DXi)/DeltaDX)+1;
[a1, a2, a3, a4]=size(IM);
% [a1, a2, a3, a4] % para desplegarlos, pero ya no los requiero desplegar
IMP=zeros(a1, a2, a3, a4, NDY);
% O=Original
% R=Replica

k1=0;
for DY=DYi:DeltaDY:DYs
    k1=k1+1;
    Oi=max(1,DY+1);
    Os=min(a1,a1+DY);
    Ri=max(1-DY,1);
    Rs=min(a1,a1-DY);
    IMP(Ri:Rs,:,:,:,k1)=IM(Oi:Os,:,:,:);
end
    

IMP2=zeros(a1, a2, a3, a4, NDY, NDX);
% [a1, a2, a3, a4, NDY, NDX] % para desplegarlos, pero ya no los requiero desplegar

k1=0;
for DX=DXi:DeltaDX:DXs
    k1=k1+1;
        IMP2(:,:,:,:,:,k1)=circshift(IMP(:,:,:,:,:),[0,DX]);
end
