function converttoeps(filename)
tic;
load(filename);
h = figure;
hold off;
for i = [1 14 46 98 132 181 195 214 252 306 320 331]
    figure(h);
    pcolor(data.r, data.s, squeeze(data.V(i,:,:)));
    set(gca, {'XTick' 'YTick'}, {[] []});
    axis('equal');
    axis('tight');
    %colormap([(0:232/64:232)' (0:196/64:196)' (0:94/64:94)']/256);
    colormap([(60:5/64:65)' (45:55/64:100)' (85:-20/64:65)']/256);
    caxis('auto');
    shading('interp');
    drawnow;
    print(h, '-depsc2', [filename '_frame_greenpurple' sprintf('%03d',i-1)]);
end
delete(h);
disp(['elapsed_time = ' num2str(toc,8)]);
