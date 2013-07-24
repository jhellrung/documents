function converttoeps(filename)
tic;
load(filename);
h = figure;
hold off;
for i = 1:length(data.U(:,1,1))
    figure(h);
    pcolor(data.x, data.y, squeeze(data.U(i,:,:)));
    set(gca, {'XTick' 'YTick'}, {[] []});
    axis('equal');
    axis('tight');
    colormap([(0:232/64:232)' (0:196/64:196)' (0:94/64:94)']/255);
    caxis('auto');
    shading('interp');
    drawnow;
    print(h, '-depsc2', [filename '_frame_gold' sprintf('%03d',i-1)]);
end
delete(h);
disp(['elapsed_time = ' num2str(toc,8)]);
