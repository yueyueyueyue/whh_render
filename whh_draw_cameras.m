function whh_draw_cameras( handles )
%WHH_DRAW_CAMERAS Summary of this function goes here
%   Detailed explanation goes here

%axes(handles.axes2), hold off, view(45, 45), set(gca,'DataAspectRatio',[1 1 1])
axes(handles.axes2), view(45, 45)

imging_p = whh_imging_plane(handles);  %imgine_plane:Q C D
position = str2num(get(handles.position, 'String'));
hold off
draw_camera(position, imging_p, 'b-');

%vplanes = whh_view_planes(handles); %the Q-CD planes of views; {QCD, QCD, QCD,...}
data_p.Q = [-1, 1, 1.25]';
data_p.C = [2, 0, 0]'; %[1,1,1.25]'-[-1,1,1.25]';
data_p.D = [0, -2, 0]'; %[-1,-1,1.25]'-[-1,1,1.25]';
hold on
draw_plane(data_p, 'r-');

vpoints = whh_view_points(handles);%squeeze(viewpoints(i,j,:))is a view-point
disp('draw view points');
draw_viewpoints(vpoints, 'r*');
axis equal

end

function draw_camera(O, plane, plot_pattern)
Q = plane.Q; C = plane.C; D = plane.D; 
[A, B, C, D] = deal(Q, Q+C, Q+C+D, Q+D);
data = [O A B O C B C D A D O];
plot3(data(1,:), data(2,:), data(3,:), plot_pattern)
end

function draw_plane(plane, plot_pattern)
Q = plane.Q; C = plane.C; D = plane.D;
[A, B, C, D] = deal(Q, Q+C, Q+C+D, Q+D);
data = [A B C D A];
plot3(data(1,:), data(2,:), data(3,:), plot_pattern)
end

function draw_viewpoints(vpoints, plot_pattern)
x = vpoints(:,:,1); y = vpoints(:,:,2); z = vpoints(:,:,3);
plot3(x(:), y(:), z(:), plot_pattern)
end





