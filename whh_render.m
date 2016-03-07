%相机阵列的image based render

%0 数据的读取,各种参数的设定

%0.1 views的分布情况
view_img_rsl = [384 384]'; %view image resolution
view_adj_dis = 0; %distance between adjacent views
view_cnt = 441; %count of views
view_cnt_xy = [21 21]; %[row, column]
view_center_center = []; %the center of center view
view_center_bounding_box = [];%the bounding box of the center_view

%0.2 图片读取
views = zeros(view_cnt_xy(1),view_cnt_xy(2), k);
%'..\cube_hci_plugin\cubedata1\000_0000.png'
floder = '..\cube_hci_plugin\cubedata1\'; suffix = '_0000.png';


for i = 0:view_cnt-1
    if i<10 
        im = imread([folder '00' num2str(i) suffix]); 
    elseif i<100
        im = imread([folder '0' num2str(i) suffix]); 
    else
        im = imread([folder num2str(i) suffix]);
    end
    
    
    
end

%0.3 imaging plane的参数设定


%0.4 最终成像结果的参数设定
img_rsl = [512 512]'; %image resolution

%1 生成imaging plane各点坐标
%2 各坐标变换到各view中去
%2.1 imaging plane是平面
%2.2 imaging plane是非平面
%3 插值获得各点rgb值
%4 得到所需图像

imshow(im);