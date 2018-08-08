function hist_save(Image, tit, path, close_fig)
if (strcmp('full', tit))
    fh = figure; title(tit);
    imhist(Image);
    saveas(fh, path, 'jpg');
else
    red = 'red';
    green = 'green';
    blue = 'blue';
    if (strcmp(red, tit))
        Layer = 1;
    end
    if (strcmp(green, tit))
        Layer = 2;
    end
    if (strcmp(blue, tit))
        Layer = 3;
    end
    fh = figure; title(tit);
    imhist(Image(:,:,Layer));
    saveas(fh, path, 'jpg');
end

if (strcmp(close_fig, 'true'))
    close(fh);
end
disp(['fig "',tit,'" was saved [done]'])