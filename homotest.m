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


H = whh_homo_plane2plane(vpoint, imging_p, data_p);%imging_p -> data_p

figure(1), hold off, view(45, 45)

draw_viewpoints(vpoints(1,1,:), '*r');
hold on, draw_plane(data_p, 'r-');
hold on, draw_plane(H_X_plane(H, imging_p), 'b-');

p1 = [data_p.Q data_p.Q+data_p.C data_p.Q+data_p.C+data_p.D data_p.Q+data_p.D];
data_p2 = H_X_plane(H, imging_p);
p2 = [data_p2.Q data_p2.Q+data_p2.C data_p2.Q+data_p2.C+data_p2.D data_p2.Q+data_p2.D];
    
%  [XI,YI] = polyxpoly(X1,Y1,X2,Y2) 
% polyxpoly(, p2);

hold on, draw_plane(imging_p, 'b-');
axis equal

end






function H = homo_plane2plane( point, p1, p2) 
%WHH_HOMO_PLANE2PLANE H*points(p1) = points(p2)
%   制造3对对应点，用来计算单应
%   两个平面关于一个投影点会有一个对应的单应
x = []; x_ = []; %H*x = x_
inter = whh_line_plane_intersection(point, p1, p2.Q);
x = [x inter];
x_ = [x_ p2.Q];
inter = whh_line_plane_intersection(point, p1, p2.Q+p2.C);
x = [x inter];
x_ = [x_ p2.Q+p2.C];
inter = whh_line_plane_intersection(point, p1, p2.Q+p2.D);
x = [x inter];
x_ = [x_ p2.Q+p2.D];

H = whh_homo(x, x_); %[h1 h2 h3; h4 h5 h6; h7 h8 h9]

end

function H = whh_homo( x, x_ )
%WHH_HOMO H*x=x_
%  x:=x_:=[3*3], x(:, 1) = [x1 y1 z1]';
zerorow = [0 0 0];
A = [x(:, 1)' zerorow zerorow; zerorow x(:, 1)' zerorow; zerorow zerorow x(:, 1)'; ...
    x(:, 2)' zerorow zerorow; zerorow x(:, 2)' zerorow; zerorow zerorow x(:, 2)'; ...
    x(:, 3)' zerorow zerorow; zerorow x(:, 3)' zerorow; zerorow zerorow x(:, 3)'];
h = x_(:)\A; %[h1 h2 h3 h4 h5 h6 h7 h8 h9]
H = [h(1:3);h(4:6);h(7:9)];

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