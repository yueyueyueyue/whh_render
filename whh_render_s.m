%相机阵列的image based render

%0 数据的读取,各种参数的设定

%0.1 views的分布情况
view_img_rsl = [768 768]'; %view image resolution

[space_range_x, space_range_y] = deal(3, 3);
[steps_x, steps_y] = deal(2, 2);
[dx, dy] = deal(space_range_x/steps_x, space_range_y/steps_y); %distance between adjacent views
dz = 20; %the z positon of view points
v_focal_length = 300;
v_sensor_size = 32;
v_fov = 2*rad2deg(atan(v_sensor_size/2/v_focal_length));

view_cnt = (steps_x*2+1)*(steps_y*2+1); %count of views
view_cnt_x = steps_x*2+1;
view_cnt_y = steps_y*2+1;
view_center_center = [0, 0, dz]'; %the center of center view
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



%0.2 图片读取
views = zeros(view_cnt_xy(1),view_cnt_xy(2), k);
%'..\cube_hci_plugin\cubedata1\000_0000.png'
%folder = '..\cube_hci_plugin\cubedata1\'; suffix = '_000.png';
%'C:\tmp\images\000_0001.png'
folder = 'C:\tmp\images\'; suffix = '_0001.png';

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
img_p = [0 0 0]; %[0, 0, z] image's view position
dis = 20; %the distance between viewpoint and imaging plane
img_r = [90 0 0]; %the rotation in xyz-euler sequence
img_r = img_r.*pi./180;
%calc
img_box_half_width = dis*tan(fov/2);
img_box_half_height = img_box_half_width;
%top_left点 top_right点 bottom_left点
img_tl = [-img_box_half_width, img_box_half_height, 0]; %the top left point of the image
img_tr = [ img_box_half_width, img_box_half_height, 0]; %the top right point of the image
img_bl = [2*img_box_half_width,0,0]; %the bottom left point of the image
%旋转
R_x = [1 0 0; 0 cos(img_r(1)) -sin(img_r(1)); 0 sin(img_r(1)) cos(img_r(1))];
R_y = [cos(img_r(2)) 0 sin(img_r(2)); 0 1 0; -sin(img_r(2)) 0 cos(img_r(2))];
R_z = [cos(img_r(3)) -sin(img_r(3)) 0; sin(img_r(3)) cos(img_r(3)); 0 0 1];
R = R_z*R_y*R_x;
img_tltrbl = [img_tl' img_tr' img_bl'];
img_tltrbl = R*(img_tltrbl - [img_p' img_p' img_p']) + [img_p' img_p' img_p'];
[img_tl, img_tr, img_bl] = deal(img_tltrbl(:,1), img_tltrbl(:,2), img_tltrbl(:,3));




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