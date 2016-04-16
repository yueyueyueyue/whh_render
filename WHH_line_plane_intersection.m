function [ result, alpha_beta ] = WHH_line_plane_intersection( A, B, C, D, Q)
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

t_alpha_beta = (Q-B)\[A-B -C -D];
[t, alpha, beta] = deal(t_alpha_beta(1), t_alpha_beta(2), t_alpha_beta(3));
if alpha<0 || beta<0 || alpha>1 || beta>1
    result = 0;
    alpha_beta = [];
    return;
end

result = 1;
alpha_beta = [alpha beta]';


end

