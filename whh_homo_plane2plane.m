function H = whh_homo_plane2plane( point, p1, p2)
%WHH_HOMO_PLANE2PLANE Summary of this function goes here
%   制造3对对应点，用来计算单应
%   两个平面关于一个投影点会有一个对应的单应
x = []; x_ = [];
inter = whh_line_plane_intersection(point, p1, p2.Q);
x = [x inter];
x_ = [x_ p2.Q];
inter = whh_line_plane_intersection(point, p1, p2.Q+p2.C);
x = [x inter];
x_ = [x_ p2.Q+p2.C];
inter = whh_line_plane_intersection(point, p1, p2.Q+p2.D);
x = [x inter];
x_ = [x_ p2.Q+p2.D];

H = whh_homo(x, x_);

end

function H = whh_homo( x, x_ )
%WHH_HOMO H*x=x_
%  x:=x_:=[3*3], x(:, 1) = [x1 y1 z1]';
zerorow = [0 0 0];
A = [x(:, 1)' zerorow zerorow; zerorow x(:, 1)' zerorow; zerorow zerorow x(:, 1)'; ...
    x(:, 2)' zerorow zerorow; zerorow x(:, 2)' zerorow; zerorow zerorow x(:, 2)'; ...
    x(:, 3)' zerorow zerorow; zerorow x(:, 3)' zerorow; zerorow zerorow x(:, 3)'];
h = x_(:)\A;
H = [h(1:3)';h(4:6)';h(7:9)'];

end

