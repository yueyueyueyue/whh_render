function whh_draw_cameras( handles )
%WHH_DRAW_CAMERAS Summary of this function goes here
%   Detailed explanation goes here

%axes(handles.axes2), hold off, view(45, 45), set(gca,'DataAspectRatio',[1 1 1])
figure(1), hold off, view(45, 45)

imging_p = whh_imging_plane(handles);  %imgine_plane:Q C D
position = str2num(get(handles.position, 'String'));
O = position; Q = imging_p.Q; C = imging_p.C; D = imging_p.D; 
draw_camera(O, Q,Q+C,Q+C+D,Q+D, 'b-');

%vplanes = whh_view_planes(handles); %the Q-CD planes of views; {QCD, QCD, QCD,...}
data_p.Q = [-1, 1, 1.25]';
data_p.C = [2, 0, 0]'; %[1,1,1.25]'-[-1,1,1.25]';
data_p.D = [0, 2, 0]'; %[-1,-1,1.25]'-[-1,1,1.25]';
Q = data_p.Q; C = data_p.C; D = data_p.D;
hold on, draw_plane(Q,Q+C,Q+C+D,Q+D, 'r-');

vpoints = whh_view_points(handles);%squeeze(viewpoints(i,j,:))is a view-point
disp('draw view points');
hold on, draw_viewpoints(vpoints, 'r*');
axis equal

end

function draw_camera(O, A,B,C,D, plot_pattern)
data = [O A B O C B C D A D O];
plot3(data(1,:), data(2,:), data(3,:), plot_pattern)
end

function draw_plane(A,B,C,D, plot_pattern)
data = [A B C D A];
plot3(data(1,:), data(2,:), data(3,:), plot_pattern)
end

function draw_viewpoints(vpoints, plot_pattern)
x = vpoints(:,:,1); y = vpoints(:,:,2); z = vpoints(:,:,3);
plot3(x(:), y(:), z(:), plot_pattern)
end





