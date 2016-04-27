function inter = whh_line_plane_intersection( A, plane, B)
%LINE_PLANE_INTERSECTION return the intersection of line AB and plane Q-CD
%   Detailed explanation goes here
%[A-B -C -D]*[t alpha beta]'=Q-B

%��Ĭ�ϲ�������˻�������
% AB = B - A;
% if norm( cross(AB, C) ) <0.000001 || norm( cross(AB, D) ) <0.000001
%     result = 0;
%     intersection = [];
%     return;
% end %����AB��ƽ��ƽ�е����Σ���û�н���


[Q, C, D] = deal(plane.Q, plane.C, plane.D);

t_alpha_beta = (Q-B)\[A-B -C -D];
[alpha_, beta_] = deal(t_alpha_beta(2), t_alpha_beta(3));

inter = Q + alpha*C + beta*D;

end