function img = WHH_render( handles )
%WHH_RENDER Summary of this function goes here
%   Detailed explanation goes here

data = whh_read_pics_of_views('C:\tmp\images\', '_0001.png', handles); %data(y, x, :, :, :) is one image;
data_size = str2num(get(handles.view_rsl, 'string'));% h w
disp('date read finished');

img_coor = whh_imging_plane_coordinate(handles);    %img(:,:,1) is the x coordiante of the plane
                                                    %squeeze(img_coor(i,j,:))is a view-point
disp('img coordinate generation finished');

%vplanes = whh_view_planes(handles); %the Q-CD planes of views; {QCD, QCD, QCD,...}

Q = [-1, 1, 1.25]';
C = [2, 0, 0]'; %[1,1,1.25]'-[-1,1,1.25]';
D = [0, 2, 0]'; %[-1,-1,1.25]'-[-1,1,1.25]';
viewpoints = whh_view_points(handles);%squeeze(viewpoints(i,j,:))is a view-point
disp('viewpoints generation finished');

[height, width, ~] = size(img_coor);
img = zeros(height, width, 3);
img_weight = zeros(height, width);
view_cnt = str2num(get(handles.view_cnt, 'String'));

disp('deal with every view:');
for vi = 1:view_cnt(1)
    for vj = 1:view_cnt(2)
        
        disp([vi vj]);
        
        [img_weight_, img_] = whh_line_plane_intersection(squeeze(viewpoints(vi, vj)), img_coor, Q, C, D, squeeze(data(vi,vj,:,:,:)) );
        %one view point ------[]-------- img_coor
        %get the img and the corresponding img_weight
        
        img_weight = img_weight + img_weight_;
        img = img + img_;
    end
end

img_weight(img_weight==0) = 1;
img(:,:,1) = img(:,:,1)./img_weight;
img(:,:,2) = img(:,:,2)./img_weight;
img(:,:,3) = img(:,:,3)./img_weight;

end

