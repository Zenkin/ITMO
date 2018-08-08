% Для закрытия картинок поставить false
close_fig = 'true';

% Арифметические операции
disp('Арифметические операции')
disp('   ')
% _________________________________________________________________________
% Считываем изображение

mkdir 1_part_1;
disp('create folder "1_part_1" [done]')

Image=imread('woman.jpg');

% Переводим изображение в double
% как я понял, матлаб только с этим 
% значением может обрабатывать изображения
Image=im2double(Image);

% Сохраняем гистограммы
hist_save(Image, 'red', '1_part_1\red', close_fig);
hist_save(Image, 'green', '1_part_1\green', close_fig);
hist_save(Image, 'blue', '1_part_1\blue', close_fig);

% сохраняем картинку
image_save(Image, 'original', '1_part_1\original', close_fig);

Image_2=Image+100/255;

% Сохраняем гистограммы
hist_save(Image_2, 'red', '1_part_1\red_2', close_fig);
hist_save(Image_2, 'green', '1_part_1\green_2', close_fig);
hist_save(Image_2, 'blue', '1_part_1\blue_2', close_fig);

% сохраняем картинку
image_save(Image_2, 'modified', '1_part_1\modified', close_fig);
disp('   ')
% _________________________________________________________________________

% Растяжение динамического диапазона значений яркостей изображения
disp('Растяжение динамического диапазона значений яркостей изображения')
disp('   ')
% _________________________________________________________________________
Image = imread('woman.jpg');
Image = im2double(Image);
[numRows, numCols, Layers] = size(Image);

% задаём коэффициент нелнейности
alpha = 0.5;
% копируем наш массив, чтобы потом можно было изменять его
Image_new = Image;
for k = 1:Layers
    % находим минимальное и максимальное значения интенсиваности в слою
    Imin = min(min(Image(:,:,k)));
    Imax = max(max(Image(:,:,k)));
    for i = 1:numRows
        for j = 1:numCols
            % вычисляем новую интенсивность
            Image_new(i,j,k)= ((Image(i,j,k)-Imin)/(Imax-Imin))^alpha;
            % проверка на выход за 1
            if Image_new(i,j,k) > 1
                Image_new(i,j,k) = 1;
            end
            % проверка на неотрицательност значений
            if Image_new(i,j,k) < 0
                Image_new(i,j,k) = 0;
            end
        end
    end    
end

mkdir 1_part_2;
disp('create folder "1_part_2" [done]')

hist_save(Image, 'red', '1_part_2\red', close_fig);
hist_save(Image, 'green', '1_part_2\green', close_fig);
hist_save(Image, 'blue', '1_part_2\blue', close_fig);
hist_save(Image_new, 'red', '1_part_2\red_2', close_fig);
hist_save(Image_new, 'green', '1_part_2\green_2', close_fig);
hist_save(Image_new, 'blue', '1_part_2\blue_2', close_fig);

image_save(Image, 'original', '1_part_2\original', close_fig);
image_save(Image_new, 'modified', '1_part_2\modified', close_fig);
disp('   ')
% _________________________________________________________________________

% Равномерное преобразование
disp('Равномерное приеобразование');
disp('   ')
% _________________________________________________________________________
Image = imread('woman.jpg');
Image = im2double(Image);
[ numRows, numCols, Layers ] = size(Image);
Image_new = Image;

for k = 1:Layers
    H = imhist(Image(:,:,k));
    CH = cumsum(H) ./ (numRows * numCols);
    Imin = min(min(Image(:,:,k)));
    Imax = max(max(Image(:,:,k)));
    for i = 1:numRows
        for j = 1:numCols
            Image_new(i, j, k) = (Imax-Imin) * CH(ceil(255 * Image(i, j, k) + eps)) + Imin;
        end
    end
end 

mkdir 1_part_3;
disp('create folder "1_part_3" [done]')

hist_save(Image, 'red', '1_part_3\red', close_fig);
hist_save(Image, 'green', '1_part_3\green', close_fig);
hist_save(Image, 'blue', '1_part_3\blue', close_fig);
hist_save(Image_new, 'red', '1_part_3\red_2', close_fig);
hist_save(Image_new, 'green', '1_part_3\green_2', close_fig);
hist_save(Image_new, 'blue', '1_part_3\blue_2', close_fig);

image_save(Image, 'original', '1_part_3\original', close_fig);
image_save(Image_new, 'modified', '1_part_3\modified', close_fig);
disp('   ')
% _________________________________________________________________________

% Экспоненциальное преобразование
disp('Равномерное приеобразование');
disp('   ')
% _________________________________________________________________________
Image = imread('woman.jpg');
Image = im2double(Image);
[ numRows, numCols, Layers ] = size(Image);

alfa = 0.9;
Image_new = Image;
for k = 1:Layers
    H = imhist(Image(:,:,k));
    CH = cumsum(H) ./ (numRows * numCols);
    Imin = min(min(Image(:,:,k)));
    for i = 1:numRows
        for j = 1:numCols
            Image_new(i, j, k) = Imin - (1 / alfa) * log10(1 - CH(ceil(255 * Image(i,j,k) + eps)));
        end
    end
end

mkdir 1_part_4;
disp('create folder "1_part_4" [done]')

hist_save(Image, 'red', '1_part_4\red', close_fig);
hist_save(Image, 'green', '1_part_4\green', close_fig);
hist_save(Image, 'blue', '1_part_4\blue', close_fig);
hist_save(Image_new, 'red', '1_part_4\red_2', close_fig);
hist_save(Image_new, 'green', '1_part_4\green_2', close_fig);
hist_save(Image_new, 'blue', '1_part_4\blue_2', close_fig);

image_save(Image, 'original', '1_part_4\original', close_fig);
image_save(Image_new, 'modified', '1_part_4\modified', close_fig);
disp('   ')
% _________________________________________________________________________

% Преобразование по закону Рэлея
disp('Преобразование по закону Рэлея')
disp('   ')
% _________________________________________________________________________
Image = imread('woman.jpg');
Image = im2double(Image);
[ numRows, numCols, Layers ] = size(Image);

alfa = 0.9;
Image_new = Image;
for k = 1:Layers
    H = imhist(Image(:,:,k));
    CH = cumsum(H) ./ (numRows * numCols);
    Imin = min(min(Image(:,:,k)));
    for i = 1:numRows
        for j = 1:numCols
            Image_new(i, j, k) = Imin + sqrt(2 * alfa^2 * log10(1 / (1 - CH(ceil(255 * Image(i,j,k) + eps)))));
        end
    end
end

mkdir 1_part_5;
disp('create folder "1_part_5" [done]')

hist_save(Image, 'red', '1_part_5\red', close_fig);
hist_save(Image, 'green', '1_part_5\green', close_fig);
hist_save(Image, 'blue', '1_part_5\blue', close_fig);
hist_save(Image_new, 'red', '1_part_5\red_2', close_fig);
hist_save(Image_new, 'green', '1_part_5\green_2', close_fig);
hist_save(Image_new, 'blue', '1_part_5\blue_2', close_fig);

image_save(Image, 'original', '1_part_5\original', close_fig);
image_save(Image_new, 'modified', '1_part_5\modified', close_fig);
disp('   ')
% _________________________________________________________________________

% Преобразование по закону степени 2/3
disp('Преобразование по закону степени 2/3')
disp('   ')
% _________________________________________________________________________
Image = imread('woman.jpg');
Image = im2double(Image);
[ numRows, numCols, Layers ] = size(Image);

Image_new = Image;
for k = 1:Layers
    H = imhist(Image(:,:,k));
    CH = cumsum(H) ./ (numRows * numCols);
    Imin = min(min(Image(:,:,k)));
    for i = 1:numRows
        for j = 1:numCols
            Image_new(i, j, k) = (CH(ceil(255 * Image(i,j,k) + eps)))^(2/3);
        end
    end
end

mkdir 1_part_6;
disp('create folder "1_part_6" [done]')

hist_save(Image, 'red', '1_part_6\red', close_fig);
hist_save(Image, 'green', '1_part_6\green', close_fig);
hist_save(Image, 'blue', '1_part_6\blue', close_fig);
hist_save(Image_new, 'red', '1_part_6\red_2', close_fig);
hist_save(Image_new, 'green', '1_part_6\green_2', close_fig);
hist_save(Image_new, 'blue', '1_part_6\blue_2', close_fig);

image_save(Image, 'original', '1_part_6\original', close_fig);
image_save(Image_new, 'modified', '1_part_6\modified', close_fig);
disp('   ')
% _________________________________________________________________________

% Гиперболические преобразования
disp('Гиперболические преобразования')
disp('   ')
% _________________________________________________________________________
Image = imread('woman.jpg');
Image = im2double(Image);
[ numRows, numCols, Layers ] = size(Image);

Image_new = Image;
for k = 1:Layers
    H = imhist(Image(:,:,k));
    CH = cumsum(H) ./ (numRows * numCols);
    Imin = min(min(Image(:,:,k)));
    for i = 1:numRows
        for j = 1:numCols
            Image_new(i, j, k) = 0.01^(CH(ceil(255 * Image(i, j, k) + eps)));
        end
    end
end

mkdir 1_part_7;
disp('create folder "1_part_6" [done]')

hist_save(Image, 'red', '1_part_7\red', close_fig);
hist_save(Image, 'green', '1_part_7\green', close_fig);
hist_save(Image, 'blue', '1_part_7\blue', close_fig);
hist_save(Image_new, 'red', '1_part_7\red_2', close_fig);
hist_save(Image_new, 'green', '1_part_7\green_2', close_fig);
hist_save(Image_new, 'blue', '1_part_7\blue_2', close_fig);

image_save(Image, 'original', '1_part_7\original', close_fig);
image_save(Image_new, 'modified', '1_part_7\modified', close_fig);
disp('   ')
% _________________________________________________________________________

% histeq
disp('histeq')
disp('   ')
% _________________________________________________________________________
Image=imread('woman.jpg');
Image=im2double(Image);
Image_new = Image;
Image_red=Image(:,:,1); Image_green=Image(:,:,2); Image_blue=Image(:,:,3);
Image_red=histeq(Image_red);
Image_green=histeq(Image_green);
Image_blue=histeq(Image_blue);
Image_new(:,:,1)=Image_red;
Image_new(:,:,2)=Image_green;
Image_new(:,:,3)=Image_blue;

mkdir histeq;
disp('create folder "histeq" [done]')

hist_save(Image, 'red', 'histeq\red', close_fig);
hist_save(Image, 'green', 'histeq\green', close_fig);
hist_save(Image, 'blue', 'histeq\blue', close_fig);
hist_save(Image_new, 'red', 'histeq\red_2', close_fig);
hist_save(Image_new, 'green', 'histeq\green_2', close_fig);
hist_save(Image_new, 'blue', 'histeq\blue_2', close_fig);

image_save(Image, 'original', 'histeq\original', close_fig);
image_save(Image_new, 'modified', 'histeq\modified', close_fig);
% _________________________________________________________________________

% imadjust
disp('imadjust')
disp('   ')
% _________________________________________________________________________
Image=imread('woman.jpg');
Image=im2double(Image);
Image_new = Image;
Image_red=Image(:,:,1); Image_green=Image(:,:,2); Image_blue=Image(:,:,3);
Image_red=imadjust(Image_red);
Image_green=imadjust(Image_green);
Image_blue=imadjust(Image_blue);
Image_new(:,:,1)=Image_red;
Image_new(:,:,2)=Image_green;
Image_new(:,:,3)=Image_blue;

mkdir imadjust;
disp('create folder "imadjust" [done]')

hist_save(Image, 'red', 'imadjust\red', close_fig);
hist_save(Image, 'green', 'imadjust\green', close_fig);
hist_save(Image, 'blue', 'imadjust\blue', close_fig);
hist_save(Image_new, 'red', 'imadjust\red_2', close_fig);
hist_save(Image_new, 'green', 'imadjust\green_2', close_fig);
hist_save(Image_new, 'blue', 'imadjust\blue_2', close_fig);

image_save(Image, 'original', 'imadjust\original', close_fig);
image_save(Image_new, 'modified', 'imadjust\modified', close_fig);
% _________________________________________________________________________

% adapthisteq
disp('adapthisteq')
disp('   ')
% _________________________________________________________________________
Image=imread('woman.jpg');
Image=im2double(Image);
Image_new = Image;
Image_red=Image(:,:,1); Image_green=Image(:,:,2); Image_blue=Image(:,:,3);
Image_red = adapthisteq(Image_red);
Image_green = adapthisteq(Image_green);
Image_blue = adapthisteq(Image_blue);
Image_new(:,:,1)=Image_red;
Image_new(:,:,2)=Image_green;
Image_new(:,:,3)=Image_blue;

mkdir adapthisteq;
disp('create folder "adapthisteq" [done]')

hist_save(Image, 'red', 'adapthisteq\red', close_fig);
hist_save(Image, 'green', 'adapthisteq\green', close_fig);
hist_save(Image, 'blue', 'adapthisteq\blue', close_fig);
hist_save(Image_new, 'red', 'adapthisteq\red_2', close_fig);
hist_save(Image_new, 'green', 'adapthisteq\green_2', close_fig);
hist_save(Image_new, 'blue', 'adapthisteq\blue_2', close_fig);

image_save(Image, 'original', 'adapthisteq\original', close_fig);
image_save(Image_new, 'modified', 'adapthisteq\modified', close_fig);
% __________________________________________________________________________
% 
% Построение профиля вдоль оси ОХ
disp('Построение профиля вдоль оси ОХ и OY')
disp('   ')
% __________________________________________________________________________
Image = imread('piano.jpg');
[numRows , numCols , Layers] = size(Image);

mkdir profile;
disp('create folder "profile" [done]')
x = [1 numCols];
y = [ceil(numRows/2) ceil(numRows/2)];
profile_save(Image, x, y, 'ox', 'profile\ox', close_fig);

y = [1 numRows];
x = [ceil(numCols/2) ceil(numCols/2)];
profile_save(Image, x, y, 'oy', 'profile\oy', close_fig);

image_save(Image, 'original', 'profile\original', close_fig);
%__________________________________________________________________________

% Проекция изображения
%__________________________________________________________________________
Image=imread('code.bmp');
Image=im2double(Image);

mkdir projections;
disp('create folder "projections" [done]');

projection_save(Image, 'projection', 'projections\projection', close_fig)

image_save(Image, 'original', 'projections\original', close_fig);

%__________________________________________________________________________
