function viewpoints = whh_view_points( handles )
%WHH_VIEW_POINTS the Q-CD planes of views; {QCD, QCD, QCD,...}
%   Detailed explanation goes here
view_cnt = str2num(handles.view_cnt, 'String');
view_range = str2num(handles.view_range, 'String');

[v, h] = deal(view_range(1), view_range(2)); 
v_dz = get(handles.v_dz, 'String');
[X, Y] = meshgrid(linspace(-h,h,view_cnt(2)),linspace(-v,v,view_cnt(1)));
Z = v_dz*ones(size(X));

hv=size(X);
viewpoints = zeros(hv(1), hv(2), 3);

viewpoints(:,:,1) = X;
viewpoints(:,:,2) = Y;
viewpoints(:,:,3) = Z;

end

