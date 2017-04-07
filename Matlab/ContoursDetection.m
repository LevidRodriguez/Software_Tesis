function Imagen_Contours = ContoursDetection(ImageBinary, FilterType)
    %   Funcion que determina los contornos en una imagen
    %   ImagenBinary: Imagen de entrada en la cual se determinaran los
    %   contornos
    %   Imagen_Contours: Imagen de salida  la cual contiene los contornos
    %   localizados en la imagen de entrada
    %   FilterType selecciona el tipo de filtro a utilizar para la
    %   determinacion de los contornos:
    %       1 .- Gradiente con mascara de 1x1
    %       2 .- Gradiente con mascara de 1x3
    %       3 .- Herosion ventana circular de 1 pixel
    %       4 .- Dilatacion ventana circular de 1 pixel
    
    %% Definimos las mascaras para el tipo de filtro a usar
    switch(FilterType)
        case 1
            maskx = [1 -1];
            masky = [1 -1]';
            [y,x] = size(ImageBinary);
            gx = conv2(double(ImageBinary),double(maskx));
            %gx = conv2(ImageBinary, maskx);
            gx = gx(:,1:x);
            gx2=gx.*gx;
            gy = conv2(double(ImageBinary),double(masky));
            %gy = conv2(ImageBinary, masky);
            gy = gy(1:y,:);
            gy2=gy.*gy;
            Gradiente = sqrt(gx2+gy2);
            %   Retornamos la imagen con contornos determinada por el
            %   gradiente
            Imagen_Contours = Gradiente;
        case 2
            maskx = [1 0 -1];
            masky = [1 0 -1]';
            [y,x] = size(ImageBinary);
            gx = conv2(double(ImageBinary),double(maskx));
            %gx = conv2(ImageBinary,maskx);
            gx = gx(:,1:x);
            gx2=gx.*gx;
            gy = conv2(double(ImageBinary),double(masky));
            %gy = conv2(ImageBinary,masky);
            gy = gy(1:y,:);
            gy2=gy.*gy;
            Gradiente = sqrt(gx2+gy2);
            %   Retornamos la imagen con contornos determinada por el
            %   gradiente
            Imagen_Contours = Gradiente;
        case 3
            se = strel('disk',1);
            Imagen_Erode = imerode(ImageBinary,se);
            Imagen_Contours = ImageBinary  - Imagen_Erode;
        case 4    
            se = strel('disk',1);
            Imagen_Dilatacion = imdilate(ImageBinary,se);
            Imagen_Contours = Imagen_Dilatacion - ImageBinary;
        case 5
            [y,x] = size(ImageBinary);
            sx = [-1 0 1;-2 0 2;-1 0 1];
            sy = [-1 -2 -1;0 0 0;1 2 1];
            gx = conv2(double(ImageBinary),sx, 'same');
            % gx = gx(:,1:x);
            gx2=gx.*gx;
            gy = conv2(double(ImageBinary),sy,'same');
            % gy = gy(1:y,:);
            gy2=gy.*gy;
            Img_Contours = sqrt(gx2+gy2);            
            Imagen_Contours = uint8(Img_Contours);
        otherwise
            fprintf('Invalid\n');
    end
end