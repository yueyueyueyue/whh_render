function WHH_render( handles )
%WHH_DRAW_CAMERAS Summary of this function goes here
%   Detailed explanation goes here


%imaging camera
imging_p = whh_imging_plane(handles);  %imgine_plane:Q C D
position = str2num(get(handles.position, 'String'));

%view cameras
data_p.Q = [-1, 1, 1.25]';
data_p.C = [2, 0, 0]'; %[1,1,1.25]'-[-1,1,1.25]';
data_p.D = [0, -2, 0]'; %[-1,-1,1.25]'-[-1,1,1.25]';
vpoints = whh_view_points(handles);%squeeze(viewpoints(i,j,:))is a view-point










end