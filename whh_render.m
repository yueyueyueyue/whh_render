%������е�image based render

%0 ���ݵĶ�ȡ,���ֲ������趨

%0.1 views�ķֲ����
view_img_rsl = [384 384]'; %view image resolution
view_adj_dis = 0; %distance between adjacent views
view_cnt = 441; %count of views
view_cnt_xy = [21 21]; %[row, column]
view_center_center = []; %the center of center view
view_center_bounding_box = [];%the bounding box of the center_view

%0.2 ͼƬ��ȡ
views = zeros(view_cnt_xy(1),view_cnt_xy(2), k);
%'..\cube_hci_plugin\cubedata1\000_0000.png'
floder = '..\cube_hci_plugin\cubedata1\'; suffix = '_0000.png';


for i = 0:view_cnt-1
    if i<10 
        im = imread([folder '00' num2str(i) suffix]); 
    elseif i<100
        im = imread([folder '0' num2str(i) suffix]); 
    else
        im = imread([folder num2str(i) suffix]);
    end
    
    
    
end

%0.3 imaging plane�Ĳ����趨


%0.4 ���ճ������Ĳ����趨
img_rsl = [512 512]'; %image resolution

%1 ����imaging plane��������
%2 ������任����view��ȥ
%2.1 imaging plane��ƽ��
%2.2 imaging plane�Ƿ�ƽ��
%3 ��ֵ��ø���rgbֵ
%4 �õ�����ͼ��

imshow(im);