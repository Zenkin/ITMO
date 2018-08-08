function projection_save(Image, tit, path, close_fig)

[numRows , ~ , ~] = size (Image);

prof = zeros(numRows, 1);
j = zeros(1, numRows);

for i =1:1:numRows
    prof(i, 1)=(round(sum(Image(:,1,1)))+round(sum(Image(i,:,2)))+round(sum(Image(i,:,3))))/(256*3);
    j(i)=numRows-i;
end

fh = figure; title(tit);
plot(prof, j); grid on;
saveas(fh, path, 'jpg');
if (strcmp(close_fig, 'true'))
    close(fh);
end
disp(['projection "',tit,'" was saved [done]'])