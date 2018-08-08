function image_save(Image, tit, path, close_fig)
fh = figure; title(tit);
imshow(Image)
saveas(fh, path, 'jpg');
if (strcmp(close_fig, 'true'))
    close(fh);
end
disp(['fig "',tit,'" was saved [done]'])