%相机阵列的image based render

%0 数据的读取,各种参数的设定

%0.1 views的分布情况

view_cnt = (steps_x*2+1)*(steps_y*2+1); %count of views

view_img_plane_z = 1/tand(fov/2);

view_center_bounding_box = [[-1 1 view_img_plane_z]' [1 -1 view_img_plane_z]'];%the bounding box of the center_view

%the position of views
n=0;
views = zeros(3, view_cnt); %the position of view points
for y = steps_y:-1:-setps_y
    for x = -steps_x:1:setps_x
        n = n+1;
        views(:, n) = [x*dx y*dy dz]';
    end
end









%0.4 最终成像结果的参数设定
img_rsl = [512 512]'; %image resolution

%1 生成imaging plane各点坐标
%1.1 imaging plane是平面的情形
img = ones(img_rsl(1), img_rsl(2), 3);
img_coor = []; %coordinate
[img_hv, img_vv] = deal( img_tr-img_tl, img_bl-img_tl); %image horizontal vector and image vertical vector
[img_hv, img_vv] = deal( img_hv./(img_rsl(1)-1), img_vv./(img_rsl(2)-1) );
for i = 0:img_rsl(1)-1
    for j = 0:img_rsl(2)-1
        img_coor(end+1) = img_tl + i*img_vv + j*img_hv;
    end
end
%1.2 imagin plane是非平面的情形

%2 各坐标变换到各view中去q
%2.1 imaging plane是平面的情形
for k = 1:img_rsl(1)*img_rsl(2)
    weight = 0;
    for i = 1:view_cnt_y
        for j = 1:view_cnt_x
            
            [result, intersection] = line_plane_intersection(a, b, c, D, E);
            if result ~= 0
                weight = weight + 1;
            end
        end
    end
end
%2.2 imaging plane是非平面的情形

%3 插值获得各点rgb值
%4 得到所需图像

imshow(im)