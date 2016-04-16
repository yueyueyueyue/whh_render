function [ output_args ] = whh_imging_plane_coordinate ( input_args )
%WHH_IMGING_PLANE_COORDINATE  Summary of this function goes here
%   Detailed explanation goes here
function im_cor = whh_imging_plane_coordinate(handles)
%imaging plane的参数设定
positoin = str2num(get(handles.position, 'String'));%image's view positionsize = str2num(get(handles.distance, 'String')); %the distance between viewpoint and imaging plane
size = str2num(get(handles.size, 'String'));
rotation = str2num(get(handles.rotation, 'String')); %the rotation in xyz-euler sequence
%calc
[height, width] = deal(size(1), size(2));
%top_left点 top_right点 bottom_left点
img_tl = [-width/2, height/2, distance]; %the top left point of the image
img_tr = [ width/2, height/2, distance]; %the top right point of the image
img_bl = [-width/2,-height/2, distance]; %the bottom left point of the image
%旋转
R_x = [1 0 0; 0 cosd(rotation(1)) -sind(rotation(1)); 0 sind(rotation(1)) cosd(rotation(1))];
R_y = [cosd(rotation(2)) 0 sind(rotation(2)); 0 1 0; -sind(rotation(2)) 0 cosd(rotation(2))];
R_z = [cosd(rotation(3)) -sind(rotation(3)) 0; sind(rotation(3)) cosd(rotation(3)); 0 0 1];
R = R_z*R_y*R_x;
img_tltrbl = [img_tl' img_tr' img_bl'];
T = str2num(get(handles.position), 'String');
img_tltrbl = R*img_tltrbl + T;
[img_tl, img_tr, img_bl] = deal(img_tltrbl(:,1), img_tltrbl(:,2), img_tltrbl(:,3));

resolution = str2num( get(handles.resolution, 'String') );

h_v = img_tr - img_tl;      %horizontal vector
v_v    = img_bl - img_tl;   %vertical vector

[j i] = meshgrid( linspace(0,1,resolution(2)), linspace(0,1,resolution(1)));

img_cor = zeros(resolution(2), resolution(1), 3);

img_cor(:,:,1) = img_tl(1) + i.*h_v(1) + j.*v_v(1);
img_cor(:,:,2) = img_tl(2) + i.*h_v(2) + j.*v_v(2);
img_cor(:,:,3) = img_tl(3) + i.*h_v(3) + j.*v_v(3);

end

