closeFigure = 'false';
% Shift
%__________________________________________________________________________
xShift = 10; % px
yShift = 10; % px
disp('Shift')
disp('   ');
mkdir shift;
disp('creating a folder "shift" [done]');

Image = imread('roadSign.jpg');
T = [1 0 0; 0 1 0; xShift yShift 1];
tform = affine2d(T);
Image_shift = imwarp(Image, tform , 'Interp', 'nearest', 'OutputView',... 
imref2d(size(Image), [1 size(Image,2)] , [1 size(Image,1)]));
saveImage(Image, 'original', 'shift/original', closeFigure);
saveImage(Image_shift, 'shift', 'shift/shift', closeFigure);
disp('   ');
%__________________________________________________________________________

% Reflect
%__________________________________________________________________________
disp('Reflect');
disp('   ');
mkdir reflect;
disp('creating a folder "reflect" [done]');

T = [1 0 0; 0 -1 0; 0 0 1];
tform = affine2d(T);
Image_reflect = imwarp(Image, tform);
saveImage(Image, 'original', 'reflect/original', closeFigure);
saveImage(Image_reflect, 'reflect', 'reflect/reflect', closeFigure);
disp('   ');
%__________________________________________________________________________

% Scale
%__________________________________________________________________________
disp('Scale');
disp('   ');
mkdir scale;
disp('creating a folder "scale" [done]');
T = [0.2 0 0; 0 0.2 0; 0 0 1];
tform = affine2d(T);
Image_scale = imwarp(Image, tform);

saveImage(Image, 'original', 'scale/original', closeFigure);
saveImage(Image_scale, 'scale', 'scale/scale', closeFigure);
disp('   ');
%__________________________________________________________________________

% Rotate
%__________________________________________________________________________
disp('Rotate');
disp('   ');
mkdir rotate;
disp('creating a folder "rotate" [done]');
phi = 17*pi/180;
T = [cos(phi) sin(phi) 0;
    -sin(phi) cos(phi) 0;
    0 0 1];
tform = affine2d(T);
Image_rotate = imwarp(Image, tform );

saveImage(Image, 'original', 'rotate/original', closeFigure);
saveImage(Image_rotate, 'rotate', 'rotate/rotate', closeFigure);
disp('   ');
%__________________________________________________________________________

% Скос изображения
%__________________________________________________________________________
disp('Bevel');
disp('   ');
mkdir bevel;
disp('creating a folder "bevel" [done]');
T = [1 0 0; 0.3 1 0; 0 0 1];
tform = affine2d (T);
Image_bevel = imwarp (Image, tform );

saveImage(Image, 'original', 'bevel/original', closeFigure);
saveImage(Image_bevel, 'bevel', 'bevel/bevel', closeFigure);
disp('   ');
%__________________________________________________________________________

% Кусочно-линейные преобразования
%__________________________________________________________________________
disp('Piecewiselinear');
disp('   ');
mkdir piecewiselinear;
disp('creating a folder "piecewiselinear" [done]');
imid = round(size(Image ,2)/2);
Image_left = Image(:, 1:imid, :);
stretch = 2;
Image_right = Image(:, (imid+1:end), :);
T = [stretch 0 0; 0 1 0; 0 0 1];
tform = affine2d(T);
Image_scale = imwarp (Image_right , tform);
Image_piecewiselinear = [Image_left Image_scale];

saveImage(Image, 'original', 'piecewiselinear/original', closeFigure);
saveImage(Image_piecewiselinear, 'piecewiselinear',...
    'piecewiselinear/piecewiselinear', closeFigure);
disp('   ');
%__________________________________________________________________________

% Проекция изображения
%__________________________________________________________________________
disp('Projective');
disp('   ');
mkdir projective;
disp('creating a folder "projective" [done]');

T = [1.1 0.35 0; 0.2 1.1 0; 0.00075 0.0005 1];
tform = projective2d (T);
Image_projective = imwarp (Image, tform );

saveImage(Image, 'original', 'projective/original', closeFigure);
saveImage(Image_projective, 'projective',...
    'projective/projective', closeFigure);
disp('   ');
%__________________________________________________________________________

% Полиномиальное преобразование
%__________________________________________________________________________
disp('Polynomial');
disp('   ');
mkdir polynomial;
disp('creating a folder "polynomial" [done]');

[numRows , numCols , Layers] = size(Image);
T = [0 0; 1 0; 0 1; 0.00001 0;
    0.002 0; 0.001 0];
for k =1:1:Layers
    for y =1:1:numCols
        for x =1:1:numRows
            xnew = round(T(1 ,1)+T(2 ,1)*x +...
            T(3 ,1)*y+T(4 ,1)*x^2+...
            T(5 ,1)*x*y+T(6 ,1)*y^2);
            ynew = round(T(1 ,2)+T(2 ,2)*x +...
            T(3 ,2)*y+T(4 ,2)*x^2+...
            T(5 ,2)*x*y+T(6 ,2)*y^2);
            I_polynomial(xnew ,ynew ,k) = ...
            Image(x,y,k);
        end
    end
end

saveImage(Image, 'original', 'polynomial/original', closeFigure);
saveImage(I_polynomial, 'polynomial',...
    'polynomial/polynomial', closeFigure);
disp('   ');
% %__________________________________________________________________________

% Синусоидальное искажение
%__________________________________________________________________________
disp('Sinusoid');
disp('   ');
mkdir sinusoid;
disp('creating a folder "sinusoid" [done]');

[nrows , ncols , ~] = size(Image);
[xi ,yi] = meshgrid(1:ncols , 1:nrows);
imid = round (size(Image ,2)/2);
u = xi + 20*sin(2* pi*yi/90);
v = yi;
tmap_B = cat(3,u,v);
resamp = makeresampler ('linear','fill');
I_sinusoid = tformarray (Image ,[] , resamp ,...
[2 1] ,[1 2] ,[] , tmap_B ,.3);

saveImage(Image, 'original', 'sinusoid/original', closeFigure);
saveImage(I_sinusoid, 'sinusoid',...
    'sinusoid/sinusoid', closeFigure);
disp('   ');
%__________________________________________________________________________

% Бочкообразная дисторсия
%__________________________________________________________________________
disp('Barrel');
disp('   ');
mkdir barrel;
disp('creating a folder "barrel" [done]');

[nrows , ncols , ~] = size(Image);
[xi ,yi] = meshgrid (1:ncols ,1:nrows);
imid = round(size(Image ,2)/2);
xt = xi(:)-imid ;
yt = yi(:)-imid ;
[theta, r] = cart2pol (xt ,yt);
F3 = .000001;
F5 = .00000012;
R = r + F3*r.^2 + F5*r.^4;
[ut ,vt] = pol2cart(theta, R);
u = reshape(ut, size (xi))+imid ;
v = reshape(vt, size (yi))+imid ;
tmap_B = cat (3, u, v);
resamp = makeresampler('linear','fill');
I_barrel = tformarray (Image ,[] , resamp ,...
[2 1] ,[1 2] ,[] , tmap_B ,.3);

saveImage(Image, 'original', 'barrel/original', closeFigure);
saveImage(I_barrel, 'barrel',...
    'barrel/barrel', closeFigure);
disp('   ');
%__________________________________________________________________________

% Подушкообразная дисторсия
%__________________________________________________________________________
disp('Pillow');
disp('   ');
mkdir pillow;
disp('creating a folder "pillow" [done]');

[nrows, ncols, ~] = size(Image);
[xi, yi] = meshgrid(1:ncols, 1:nrows);
imid = round(size(Image, 2)/2);
xt = xi(:) - imid ;
yt = yi(:) - imid ;
[theta, r] = cart2pol(xt, yt);
F3 = -0.0009;
R = r + F3*r.^2;
[ut, vt] = pol2cart(theta, R);
u = reshape(ut, size(xi)) + imid;
v = reshape(vt, size(yi)) + imid;
tmap_B = cat(3, u, v);
resamp = makeresampler('linear', 'fill');
I_pillow = tformarray(Image, [], resamp ,...
[2 1], [1 2], [], tmap_B,.3);

saveImage(Image, 'original', 'pillow/original', closeFigure);
saveImage(I_pillow, 'pillow',...
    'pillow/pillow', closeFigure);
disp('   ');
%__________________________________________________________________________

% Склеивание фотографий
__________________________________________________________________________
disp('Gluing');
disp('   ');
mkdir gluing;
disp('creating a folder "gluing" [done]');

topPart = imread('itmoTop.jpg');
botPart = imread('itmoBot.jpg');

topPartHT = im2double(rgb2gray(topPart));
botPartHT = im2double(rgb2gray(botPart));

Layers = 3;

intersecPart = 1;
[numRows, numCols, ~] = size(topPartHT);
[numRowsBot, numColsBot] = size(botPartHT);
botPartCorrHT = zeros(intersecPart, numCols);
topPartCorrHT = zeros(intersecPart, numCols);
correlationArray = [];

for j = 1:1:numCols
    for i = 1:1:intersecPart
        botPartCorrHT(i,j) = botPartHT(i,j);
    end
end

for j = 0:1:numRows - intersecPart
    for i = 1:1:intersecPart
        topPartCorrHT(i, :) = topPartHT(i+j, :);
    end
    correlationCoefficient = ...
        corr2 (topPartCorrHT, botPartCorrHT);
    correlationArray = [correlationArray correlationCoefficient];
    correlationCoefficient = 0;
end
[M, I] = max(correlationArray);

numRowsBotCorr = numRowsBot + I - 1;
for k = 1:1:Layers
    for j = 1:1:numCols
        for i = 1:I-1
            result_img(i,j,k) = topPart(i,j,k);
        end
        for i = I:1:numRowsBotCorr
            result_img(i,j,k) = botPart(i-I+1, j, k);
        end
    end
end

saveImage(topPart, 'topPart', 'gluing/topPart', closeFigure);
saveImage(botPart, 'botPart', 'gluing/botPart', closeFigure);
saveImage(result_img, 'gluing',...
    'gluing/gluing', closeFigure);
disp('   ');
%__________________________________________________________________________
