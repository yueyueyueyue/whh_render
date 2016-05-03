function H = whh_homo_plane2plane( point, p1, p2) 
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
h = A\x_(:); %[h1 h2 h3 h4 h5 h6 h7 h8 h9]'
H = reshape(h, [3 3])';
end