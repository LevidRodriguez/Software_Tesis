function P_Ok = FindMaximoLocal(H_Original, P)
    % Maximo Local
    % Determinar la relacion entre las coordenadas, si son consecutivas en x e y
    % Etiquetar las que son consecutivas
    % De todas las consecutivas determinar en la H_Original la de mayor amplitud
    % Manejar un Humbral de +-4 en Y y +-3 en X 
    maxH = H_Original(P(1,1), P(1,2)); 
    cordmaxH = P(1,:);
    [r,c]=size(P);
    for j = 2: r
        if H_Original(P(j,1), P(j,2)) > maxH 
            maxH = H_Original(P(j,1), P(j,2)); 
            cordmaxH = P(j,:);
        end
    end
    P_Ok = cordmaxH;
end