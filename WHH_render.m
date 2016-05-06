function img = WHH_render( handles )
%WHH_RENDER Summary of this function goes here
%   Detailed explanation goes here

global data;%data(y, x, :, :, :) is one image;
%data = whh_read_pics_of_views('C:\tmp\images\', '_0000.png', handles);

% img_coor = whh_imging_plane_coordinate(handles);    %img(:,:,1) is the x coordiante of the plane
%                                                     %squeeze(img_coor(i,j,:))is a view-point

imging_p = whh_imging_plane(handles);  %imgine_plane:Q C D
                                                 
disp('img coordinate generation finished');

%vplanes = whh_view_planes(handles); %the Q-CD planes of views; {QCD, QCD, QCD,...}

data_p.Q = [-1, 1, 1.25]';
data_p.C = [2, 0, 0]'; %[1,1,1.25]'-[-1,1,1.25]';
data_p.D = [0, -2, 0]'; %[-1,-1,1.25]'-[-1,1,1.25]';

viewpoints = whh_view_points(handles);%squeeze(viewpoints(i,j,:))is a view-point
disp('viewpoints generation finished');
[ic, jc, ~] = size(viewpoints);
Hs_i2d = zeros(ic,jc,3,3);
for i = 1:ic
    for j = 1:jc
        Hs_i2d(i,j,:,:) = whh_homo_plane2plane(squeeze(viewpoints(i,j,:)), imging_p, data_p);%imging_p->data_p
    end
end

rsl = str2num(get(handles.resolution, 'string'));
[Cw, Dw] = meshgrid( linspace(0,1,rsl(2)), linspace(0,1,rsl(1)) );
Cw = Cw(:); Dw = Dw(:);
img_coor = [imging_p.C, imging_p.D]*[Cw';Dw'];
img_coor = img_coor + repmat(imging_p.Q, [1, length(Cw)]);

view_rsl = str2num(get(handles.view_rsl, 'string'));
[ic, jc, ~] = size(viewpoints);
mask = zeros(rsl');
img = zeros(rsl(1),rsl(2),3);
for i = 1:ic
    for j = 1:jc
        H_i2d = squeeze(Hs_i2d(i,j,:,:));
        data_coor = H_i2d*img_coor;
        %[C D][alpha;beta] = [p1 p2 p3 ..]
        alpha_beta = [data_p.C data_p.D]\data_coor;
        
        alpha = alpha_beta(1, :); beta = alpha_beta(2, :);
        Alpha = reshape(alpha, rsl'); Beta = reshape(beta, rsl');
        mask = mask + double(Alpha>=0&Alpha<=1&Beta>=0&Beta<=1);
        
        x_y = [view_rsl(1) 0; 0 view_rsl(2)]*alpha_beta;
        %data(y, x, :, :, :) 
        x = x_y(1,:); y = x_y(2,:);
        X = reshape(x, rsl'); Y = reshape(y, rsl');
        data_ = squeeze(data(i, j, :, :, :));
        im_(:,:,1) = interp2(data_(:,:,1), X, Y, 'linear', 0);
        im_(:,:,2) = interp2(data_(:,:,2), X, Y, 'linear', 0);
        im_(:,:,3) = interp2(data_(:,:,3), X, Y, 'linear', 0);
        img = img + im_;
        
        
    end
    disp(i);
end
mask(mask==0)=1;
img(:,:,1) = img(:,:,1)./mask;
img(:,:,2) = img(:,:,2)./mask;
img(:,:,3) = img(:,:,3)./mask;

end

