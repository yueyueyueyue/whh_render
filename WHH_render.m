function img = WHH_render( handles )
%WHH_RENDER Summary of this function goes here
%   Detailed explanation goes here

data = whh_read_pics_of_views('C:\tmp\images\', '_0001.png', handles); %data(y, x, :) is one image;
data_size = str2num(get(handles.view_rsl, 'string'));% h w

img_coor = whh_imging_plane_coordinate(handles); %img(:,:,1) is the x coordiante of the plane

%vplanes = whh_view_planes(handles); %the Q-CD planes of views; {QCD, QCD, QCD,...}
%vplanes_cnt = size(vplanes);
Q = [-1, 1, 1.25]';
C = [2, 0, 0]; %[1,1,1.25]'-[-1,1,1.25]';
D = [0, 2, 0]; %[-1,-1,1.25]'-[-1,1,1.25]';
viewpoints = whh_view_points(handles);%viewpoints(i,j,:)is a view-point


[height, width, ~] = size(img_cor);
img = zeros(height, width, 3);
img_weight = zeros(height, width);
for i = 1:height
    for j = 1:width
        cor = squeeze( img_cor(i, j, :) );
        
        for vi = 1:vplanes_cnt(1)
            for vj = 1:vplanes_cnt(2)
                [result, alpha_beta] = whh_line_plane_intersection(position, cor, vplanes);
                if result==1
                    img_weight(i, j) = img_weight(i, j) + 1;
                    img(i, j, :) = img(i, j, :) + whh_rgb_from_alphabeta();
                end
            end
            
        end
        
        
    end
end

img = zeros(70,70);

end

