function saveImage(Image, title_, path, closeFigure)
fh = figure; title(title_);
imshow(Image)
saveas(fh, path, 'jpg');
if (strcmp(closeFigure, 'true'))
    close(fh);
end
disp(['figure "',title_,'" was saved [done]'])