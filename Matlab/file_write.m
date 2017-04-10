function file_write(file,P)
    for i = 1:size(P(:,1))
        fprintf(file, '%d\t%d\t%d\n',i,P(i,1), P(i,2));
        fprintf('Distancia: %d - Angulo: %d Grados\n',P(i,1), P(i,2)+90);
    end
    fprintf('...Procesada\n');
end