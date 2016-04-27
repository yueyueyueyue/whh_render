function inter = whh_line_plane_intersection( A, plane, B)
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


[Q, C, D] = deal(plane.Q, plane.C, plane.D);

t_alpha_beta = (Q-B)\[A-B -C -D];
[alpha_, beta_] = deal(t_alpha_beta(2), t_alpha_beta(3));

inter = Q + alpha*C + beta*D;

end