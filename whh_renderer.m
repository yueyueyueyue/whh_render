function varargout = whh_renderer(varargin)
% WHH_RENDERER MATLAB code for whh_renderer.fig
%      WHH_RENDERER, by itself, creates a new WHH_RENDERER or raises the existing
%      singleton*.
%
%      H = WHH_RENDERER returns the handle to a new WHH_RENDERER or the handle to
%      the existing singleton*.
%
%      WHH_RENDERER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WHH_RENDERER.M with the given input arguments.
%
%      WHH_RENDERER('Property','Value',...) creates a new WHH_RENDERER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before whh_renderer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to whh_renderer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help whh_renderer

% Last Modified by GUIDE v2.5 06-May-2016 18:01:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @whh_renderer_OpeningFcn, ...
                   'gui_OutputFcn',  @whh_renderer_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before whh_renderer is made visible.
function whh_renderer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to whh_renderer (see VARARGIN)

% Choose default command line output for whh_renderer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes whh_renderer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = whh_renderer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function position_Callback(hObject, eventdata, handles)
% hObject    handle to position (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of position as text
%        str2double(get(hObject,'String')) returns contents of position as a double


% --- Executes during object creation, after setting all properties.
function position_CreateFcn(hObject, eventdata, handles)
% hObject    handle to position (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotation_Callback(hObject, eventdata, handles)
% hObject    handle to rotation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotation as text
%        str2double(get(hObject,'String')) returns contents of rotation as a double


% --- Executes during object creation, after setting all properties.
function rotation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to view_cnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of view_cnt as text
%        str2double(get(hObject,'String')) returns contents of view_cnt as a double


% --- Executes during object creation, after setting all properties.
function view_cnt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to view_cnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resolution_Callback(hObject, eventdata, handles)
% hObject    handle to resolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resolution as text
%        str2double(get(hObject,'String')) returns contents of resolution as a double


% --- Executes during object creation, after setting all properties.
function resolution_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function view_range_Callback(hObject, eventdata, handles)
% hObject    handle to view_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of view_range as text
%        str2double(get(hObject,'String')) returns contents of view_range as a double
view_range = str2num(get(handles.view_range, 'String'));
view_steps = str2num(get(handles.view_steps, 'String'));
v_dxy = view_range./view_steps;
set(handles.v_dx, 'String', num2str(v_dxy(1)));
set(handles.v_dy, 'String', num2str(v_dxy(2)));


% --- Executes during object creation, after setting all properties.
function view_range_CreateFcn(hObject, eventdata, handles)
% hObject    handle to view_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function view_steps_Callback(hObject, eventdata, handles)
% hObject    handle to view_steps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of view_steps as text
%        str2double(get(hObject,'String')) returns contents of view_steps as a double
view_range = str2num(get(handles.view_range, 'String'));
view_steps = str2num(get(handles.view_steps, 'String'));
v_dxy = view_range./view_steps;
set(handles.v_dx, 'String', num2str(v_dxy(1)));
set(handles.v_dy, 'String', num2str(v_dxy(2)));

view_cnt = view_steps*2+[1 1]';
set(handles.view_cnt, 'String', ['[', num2str(view_cnt(1)), ' ', num2str(view_cnt(2)), ']'''] );



% --- Executes during object creation, after setting all properties.
function view_steps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to view_steps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v_dz_Callback(hObject, eventdata, handles)
% hObject    handle to v_dz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v_dz as text
%        str2double(get(hObject,'String')) returns contents of v_dz as a double


% --- Executes during object creation, after setting all properties.
function v_dz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_dz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function v_fov_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_fov (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function v_focal_length_Callback(hObject, eventdata, handles)
% hObject    handle to v_focal_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v_focal_length as text
%        str2double(get(hObject,'String')) returns contents of v_focal_length as a double
v_focal_length = str2num(get(handles.v_focal_length, 'String'));
v_sensor_size = str2num(get(handles.v_sensor_size, 'String'));
v_fov = 2*rad2deg(atan(v_sensor_size/2/v_focal_length));
set(handles.v_fov, 'String', num2str(v_fov));
v_dz_ = 1/tand(v_fov/2); %view_img_plane_z
set(handles.v_dz_, 'String', num2str(v_dz_));


% --- Executes during object creation, after setting all properties.
function v_focal_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_focal_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function v_sensor_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_sensor_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function view_rsl_Callback(hObject, eventdata, handles)
% hObject    handle to view_rsl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of view_rsl as text
%        str2double(get(hObject,'String')) returns contents of view_rsl as a double


% --- Executes during object creation, after setting all properties.
function view_rsl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to view_rsl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dz__Callback(hObject, eventdata, handles)
% hObject    handle to v_dz_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v_dz_ as text
%        str2double(get(hObject,'String')) returns contents of v_dz_ as a double


% --- Executes during object creation, after setting all properties.
function v_dz__CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_dz_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function v_dx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_dx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function v_dy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_dy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in draw.
function draw_Callback(hObject, eventdata, handles)
% hObject    handle to sdraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pic = WHH_render(handles);
axes(handles.axes1);
imshow(pic);

function size_Callback(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size as text
%        str2double(get(hObject,'String')) returns contents of size as a double


% --- Executes during object creation, after setting all properties.
function size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function distance_Callback(hObject, eventdata, handles)
% hObject    handle to distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of distance as text
%        str2double(get(hObject,'String')) returns contents of distance as a double
fov = str2num(get(handles.fov, 'String'));
distance = get(handles.distance, 'value');
size = [2*distance*tand(fov/2) 2*distance*tand(fov/2)]';
set(handles.size, 'String', ['[' num2str(size(1)) ' ' num2str(size(2))  ']''']);
set(handles.text33, 'string', distance);

pic = WHH_render(handles);
axes(handles.axes1);
imshow(pic);

whh_draw_cameras(handles);



% --- Executes during object creation, after setting all properties.
function distance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fov_Callback(hObject, eventdata, handles)
% hObject    handle to fov (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fov as text
%        str2double(get(hObject,'String')) returns contents of fov as a double
fov = str2num(get(handles.fov, 'String'));
distance = get(handles.distance, 'value');
size = [2*distance*tand(fov/2) 2*distance*tand(fov/2)]';
set(handles.size, 'String', ['[' num2str(size(1)) ' ' num2str(size(2))  ']''']);


% --- Executes during object creation, after setting all properties.
function fov_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fov (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key release with focus on figure1 and none of its controls.
function figure1_KeyReleaseFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was released, in lower case
%	Character: character interpretation of the key(s) that was released
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) released
% handles    structure with handles and user data (see GUIDATA)
if eventdata.Key == 'a'
    s_length = str2num(get(handles.move_step_length, 'String'));
    position = str2num(get(handles.position, 'String'));
    position = position + [-s_length 0 0]';
    set(handles.position, 'String', whh_vector2str(position) );
elseif eventdata.Key == 's'
    s_length = str2num(get(handles.move_step_length, 'String'));
    position = str2num(get(handles.position, 'String'));
    position = position + [0 0 s_length]';
    set(handles.position, 'String', whh_vector2str(position) );
elseif eventdata.Key == 'd'
    s_length = str2num(get(handles.move_step_length, 'String'));
    position = str2num(get(handles.position, 'String'));
    position = position + [s_length 0 0]';
    set(handles.position, 'String', whh_vector2str(position) );
elseif eventdata.Key == 'w'
    s_length = str2num(get(handles.move_step_length, 'String'));
    position = str2num(get(handles.position, 'String'));
    position = position + [0 0 -s_length]';
    set(handles.position, 'String', whh_vector2str(position) );
elseif eventdata.Key == 'q'
    s_length = str2num(get(handles.move_step_length, 'String'));
    position = str2num(get(handles.position, 'String'));
    position = position + [0 -s_length 0]';
    set(handles.position, 'String', whh_vector2str(position) );
elseif eventdata.Key == 'e'
    s_length = str2num(get(handles.move_step_length, 'String'));
    position = str2num(get(handles.position, 'String'));
    position = position + [0 s_length 0]';
    set(handles.position, 'String', whh_vector2str(position) );
elseif eventdata.Key == 'j'
    s_length = str2num(get(handles.rot_step_length, 'String'));
    rotation = str2num(get(handles.rotation, 'String'));
    rotation = rotation + [0 -s_length 0]';
    set(handles.rotation, 'String', whh_vector2str(rotation) );
elseif eventdata.Key == 'k'
    s_length = str2num(get(handles.rot_step_length, 'String'));
    rotation = str2num(get(handles.rotation, 'String'));
    rotation = rotation + [s_length 0 0]';
    set(handles.rotation, 'String', whh_vector2str(rotation) );
elseif eventdata.Key == 'l'
    s_length = str2num(get(handles.rot_step_length, 'String'));
    rotation = str2num(get(handles.rotation, 'String'));
    rotation = rotation + [0 s_length 0]';
    set(handles.rotation, 'String', whh_vector2str(rotation) );
elseif eventdata.Key == 'i'
    s_length = str2num(get(handles.rot_step_length, 'String'));
    rotation = str2num(get(handles.rotation, 'String'));
    rotation = rotation + [-s_length 0 0]';
    set(handles.rotation, 'String', whh_vector2str(rotation) );
elseif eventdata.Key == 'u'
    s_length = str2num(get(handles.rot_step_length, 'String'));
    rotation = str2num(get(handles.rotation, 'String'));
    rotation = rotation + [0 0 s_length]';
    set(handles.rotation, 'String', whh_vector2str(rotation) );
elseif eventdata.Key == 'o'
    s_length = str2num(get(handles.rot_step_length, 'String'));
    rotation = str2num(get(handles.rotation, 'String'));
    rotation = rotation + [0 0 -s_length]';
    set(handles.rotation, 'String', whh_vector2str(rotation) );
end

pic = WHH_render(handles);
axes(handles.axes1);
imshow(pic);

axes(handles.axes2), hold off
whh_draw_cameras( handles );



function move_step_length_Callback(hObject, eventdata, handles)
% hObject    handle to move_step_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of move_step_length as text
%        str2double(get(hObject,'String')) returns contents of move_step_length as a double


% --- Executes during object creation, after setting all properties.
function move_step_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to move_step_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rot_step_length_Callback(hObject, eventdata, handles)
% hObject    handle to rot_step_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rot_step_length as text
%        str2double(get(hObject,'String')) returns contents of rot_step_length as a double


% --- Executes during object creation, after setting all properties.
function rot_step_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rot_step_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
whh_draw_cameras(handles);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
homotest(handles);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;
disp('数据载入开始');
data = whh_read_pics_of_views('C:\tmp\images\', '_0000.png', handles);
disp('载入数据完毕');
