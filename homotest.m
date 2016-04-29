function homotest( handles )
%HOMOTEST Summary of this function goes here
%   Detailed explanation goes here



%imaging camera
imging_p = whh_imging_plane(handles);  %imgine_plane:Q C D
position = str2num(get(handles.position, 'String'));

%view cameras
data_p.Q = [-1, 1, 1.25]';
data_p.C = [2, 0, 0]'; %[1,1,1.25]'-[-1,1,1.25]';
data_p.D = [0, -2, 0]'; %[-1,-1,1.25]'-[-1,1,1.25]';
vpoints = whh_view_points(handles);%squeeze(viewpoints(i,j,:))is a view-point

vpoint = squeeze(vpoints(1,1,:));


H = whh_homo_plane2plane(vpoint, data_p, imging_p);%data_p -> imging_p

figure(1), hold off, view(45, 45)
draw_viewpoints(vpoints(1,1,:), '*r');
hold on, draw_plane(data_p, 'g-');
hold on, draw_plane(H_X_plane(H, data_p), 'b-');
hold on, draw_plane(imging_p, 'r-');
hold on, draw_camera(vpoint, data_p, 'b-')
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

function plane_ = H_X_plane(H, plane)
Q = plane.Q; C = plane.C; D = plane.D;
Q = H*Q;
C = H*C;
D = H*D;
plane_.Q = Q;
plane_.C = C;
plane_.D = D;
end