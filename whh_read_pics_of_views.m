function data = whh_read_pics_of_views( folder, suffix, handles )
%WHH_READ_PICS_OF_VIEWS Õº∆¨∂¡»°
%   folder = 'C:\tmp\images\'; suffix = '_0001.png';
%   data(y, x, :) is one image;

view_cnt_xy = str2num( get(handles.view_cnt, 'String'));
k = 3;
view_rsl = str2num( get(handles.view_rsl, 'String') );

data = zeros(view_cnt_xy(1),view_cnt_xy(2), view_rsl(1), view_rsl(2), k);
%'..\cube_hci_plugin\cubedata1\000_0000.png'
%folder = '..\cube_hci_plugin\cubedata1\'; suffix = '_000.png';
%'C:\tmp\images\000_0001.png'
%folder = 'C:\tmp\images\'; suffix = '_0001.png';

view_cnt = view_cnt_xy(1)*view_cnt_xy(2);
for i = 0:view_cnt-1
    if i<10 
        im = imread([folder '00' num2str(i) suffix]); 
    elseif i<100
        im = imread([folder '0' num2str(i) suffix]); 
    else
        im = imread([folder num2str(i) suffix]);
    end    
    
    view_cnt_yx = flipud(view_cnt_xy);
    [y, x] = ind2sub(view_cnt_yx, i+1);
    data(y, x, :, :, :) = double(im);
end

end

