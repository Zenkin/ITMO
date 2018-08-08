function profile_save(Image, x, y, tit, path, close_fig)
fh = figure; title(tit);
improfile(Image,x,y), grid on;
saveas(fh, path, 'jpg');
if (strcmp(close_fig, 'true'))
    close(fh);
end
disp(['fprofile "',tit,'" was saved [done]'])