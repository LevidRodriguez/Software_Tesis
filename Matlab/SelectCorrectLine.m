function P_Ok = SelectCorrectLine(P)
    % Elegir las lineas cercanas de 83  a 90 y de -83 a -90
    % Si esta en -90 y la distancia  800 Eliminar superior
    % Si esta en -90 y la distancia  321 Eliminar inferior
    % Eliminacion del borde superior 
    r= find(P(:,1)==800 & P(:,2)==1);
    P(r,:)=[];
    % Eliminar borde inferior
    r= find(P(:,1)==321 & P(:,2)==1);
    P(r,:)=[];
    % Eliminacion del borde izquierdo 
    r= find(P(:,1)==800 & P(:,2)==91);
    P(r,:)=[];
    % Elegir a linea que nos interesa
    % r = find(P(1,:) < 853);
    % P = P(r,:);
    % r = find(P(:,2)< 8 | P(:,2)>172); %Original
    r = find(P(:,2)<=9 | P(:,2)>172); %Modifique 24/11/2016
    P_Ok = P(r,:);
end