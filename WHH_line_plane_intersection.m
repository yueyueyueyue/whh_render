function [img_weight_, img_] = whh_line_plane_intersection( viewpoint, img_coor, Q, C, D, vimg)
%LINE_PLANE_INTERSECTION return the intersection of line AB and plane Q-CD
%   Detailed explanation goes here
%[A-B -C -D]*[t alpha beta]'=Q-B

%先默认不会出现退化的情形
% AB = B - A;
% if norm( cross(AB, C) ) <0.000001 || norm( cross(AB, D) ) <0.000001
%     result = 0;
%     intersection = [];
%     return;
% end %向量AB与平面平行的情形，即没有交点

%可以稀疏矩阵乘法来统一处理，【以后试验】
[row, column, ~] = size(img_coor);
A = viewpoint;
alpha = zeros(size(img_coor));
beta = zeros(size(img_coor));
for i = 1:row
    for j = 1:column
        B = squeeze(img_coor(i, j, :));
        t_alpha_beta = (Q-B)\[A-B -C -D];
        [alpha_, beta_] = deal(t_alpha_beta(2), t_alpha_beta(3));
        alpha(i, j) = alpha_;
        beta(i, j) = beta_;
    end
end

[img_weight_, img_] = whh_rgb_alphabeta(alpha, beta, vimg);


end

function [weight, img] = whh_rgb_alphabeta(alpha, beta, vimg)
    img_size = size(alpha);
    mask = alpha>=0 & beta>=0 & alpha<=1 & beta<=1;
    weight = mask;
    
    vimg_size = size(vimg);
    X = alpha.*vimg_size(1);
    Y = beta.*vimg_size(2);
    
    r_ = interp2(squeeze(vimg(:, :, 1)), X, Y, 'linear', 0); 
    g_ = interp2(squeeze(vimg(:, :, 2)), X, Y, 'linear', 0); 
    b_ = interp2(squeeze(vimg(:, :, 3)), X, Y, 'linear', 0); 
    
    
    img = zeros(img_size(1), img_size(2), 3);
    img(:, :, 1) = r_;
    img(:, :, 2) = g_;
    img(:, :, 3) = b_;
end

