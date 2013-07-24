function varargout = paramgui(varargin)
% PARAMGUI M-file for paramgui.fig
%      PARAMGUI, by itself, creates a new PARAMGUI or raises the existing
%      singleton*.
%
%      H = PARAMGUI returns the handle to a new PARAMGUI or the handle to
%      the existing singleton*.
%
%      PARAMGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARAMGUI.M with the given input arguments.
%
%      PARAMGUI('Property','Value',...) creates a new PARAMGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before paramgui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to paramgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help paramgui

% Last Modified by GUIDE v2.5 13-Aug-2003 19:33:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @paramgui_OpeningFcn, ...
                   'gui_OutputFcn',  @paramgui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT



% --- Executes just before paramgui is made visible.
function paramgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to paramgui (see VARARGIN)

vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5' 'u0' 'v0' 'k1' 'k2'};
for i = 1:length(vars)
    eval(['data.' vars{i} ' = [];']);
end
vars = {'param1' 'param2' 'param3' 'param4' 'param5'};
for i = 1:length(vars)
    eval(['data.' vars{i} ' = '''';']);
end
setappdata(hObject, 'data', data);

set(hObject, 'WindowButtonMotionFcn', @paramgui_WindowButtonMotionFcn);
set(hObject, 'WindowButtonDownFcn', @paramgui_WindowButtonDownFcn);

% Choose default command line output for paramgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes paramgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = paramgui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes during object creation, after setting all properties.
function f_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function f_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to f_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f_textbox as text
%        str2double(get(hObject,'String')) returns contents of f_textbox as a double



% --- Executes during object creation, after setting all properties.
function g_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function g_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to g_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g_textbox as text
%        str2double(get(hObject,'String')) returns contents of g_textbox as a double



%--------------------------------------------------------------------------
%
%  gamma_
%
%--------------------------------------------------------------------------



% --- Executes during object creation, after setting all properties.
function gamma__textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma__textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function gamma__textbox_Callback(hObject, eventdata, handles)
% hObject    handle to gamma__textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gamma__textbox as text
%        str2double(get(hObject,'String')) returns contents of gamma__textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('gamma_', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('gamma_ must evaluate to a vector of nonnegative reals', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function gamma__slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma__slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



% --- Executes on slider movement.
function gamma__slider_Callback(hObject, eventdata, handles)
% hObject    handle to gamma__slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(hObject, 'Value', floor(get(hObject, 'Value')));
refreshplots;



% --- Executes during object creation, after setting all properties.
function gamma_slider_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma_slider_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function gamma_slider_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to gamma_slider_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gamma_slider_textbox as text
%        str2double(get(hObject,'String')) returns contents of gamma_slider_textbox as a double

data = getappdata(gcbf, 'data');

string = get(hObject, 'String');
if ~isempty(string) && isvalid('gamma_', string)
    set(handles.gamma__slider, 'Value', max([length(find(data.gamma_ <= str2num(string))) 1]));
    refreshplots;
else
    v = data.gamma_(get(handles.gamma__slider, 'Value'));
    set(hObject, 'Value', v, 'String', str2num(v,8));
    if ~isempty(string)
        uiwait(errordlg('gamma_ must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



% --- Executes on button press in gamma_x_radiobutton.
function gamma_x_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to gamma_x_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gamma_x_radiobutton

h = handles.gamma_y_radiobutton;
if get(h, 'Value') == get(h, 'Max')
    set(h, 'Value', get(h, 'Min'));
    vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        h = eval(['handles.' vars{i} 'x_radiobutton']);
        if get(h, 'Value') == get(h, 'Max') && h ~= hObject
            h = eval(['handles.' vars{i} 'y_radiobutton']);
            set(h, 'Value', get(h, 'Max'));
        end
    end
end
setxradiobuttonsoff;
set(hObject, 'Value', get(hObject, 'Max'));
refreshparam;



% --- Executes on button press in gamma_y_radiobutton.
function gamma_y_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to gamma_y_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gamma_y_radiobutton

h = handles.gamma_x_radiobutton;
if get(h, 'Value') == get(h, 'Max')
    set(h, 'Value', get(h, 'Min'));
    vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        h = eval(['handles.' vars{i} 'y_radiobutton']);
        if get(h, 'Value') == get(h, 'Max') && h ~= hObject
            h = eval(['handles.' vars{i} 'x_radiobutton']);
            set(h, 'Value', get(h, 'Max'));
        end
    end
end
setyradiobuttonsoff;
set(hObject, 'Value', get(hObject, 'Max'));
refreshpparam;



%--------------------------------------------------------------------------
%
%  d
%
%--------------------------------------------------------------------------



% --- Executes during object creation, after setting all properties.
function d_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function d_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to d_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d_textbox as text
%        str2double(get(hObject,'String')) returns contents of d_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('d', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('d must evaluate to a vector of nonnegative reals', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function d_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



% --- Executes on slider movement.
function d_slider_Callback(hObject, eventdata, handles)
% hObject    handle to d_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(hObject, 'Value', floor(get(hObject, 'Value')));
refreshplots;



% --- Executes during object creation, after setting all properties.
function dslider_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dslider_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function dslider_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to dslider_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dslider_textbox as text
%        str2double(get(hObject,'String')) returns contents of dslider_textbox as a double

data = getappdata(gcbf, 'data');

string = get(hObject, 'String');
if ~isempty(string) && isvalid('d', string)
    set(handles.d_slider, 'Value', max([length(find(data.d <= str2num(string))) 1]));
    refreshplots;
else
    v = data.d(get(handles.d_slider, 'Value'));
    set(hObject, 'Value', v, 'String', str2num(v,8));
    if ~isempty(string)
        uiwait(errordlg('d must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



% --- Executes on button press in dx_radiobutton.
function dx_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to dx_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of dx_radiobutton

h = handles.dy_radiobutton;
if get(h, 'Value') == get(h, 'Max')
    set(h, 'Value', get(h, 'Min'));
    vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        h = eval(['handles.' vars{i} 'x_radiobutton']);
        if get(h, 'Value') == get(h, 'Max') && h ~= hObject
            h = eval(['handles.' vars{i} 'y_radiobutton']);
            set(h, 'Value', get(h, 'Max'));
        end
    end
end
setxradiobuttonsoff;
set(hObject, 'Value', get(hObject, 'Max'));
refreshparam;



% --- Executes on button press in dy_radiobutton.
function dy_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to dy_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of dy_radiobutton

h = handles.dx_radiobutton;
if get(h, 'Value') == get(h, 'Max')
    set(h, 'Value', get(h, 'Min'));
    vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        h = eval(['handles.' vars{i} 'y_radiobutton']);
        if get(h, 'Value') == get(h, 'Max') && h ~= hObject
            h = eval(['handles.' vars{i} 'x_radiobutton']);
            set(h, 'Value', get(h, 'Max'));
        end
    end
end
setyradiobuttonsoff;
set(hObject, 'Value', get(hObject, 'Max'));
refreshparam;



%--------------------------------------------------------------------------
%
%  param1
%
%--------------------------------------------------------------------------



% --- Executes during object creation, after setting all properties.
function param1_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param1_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function param1_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to param1_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param1_textbox as text
%        str2double(get(hObject,'String')) returns contents of param1_textbox as a double



% --- Executes during object creation, after setting all properties.
function value1min_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value1min_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value1min_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value1min_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value1min_textbox as text
%        str2double(get(hObject,'String')) returns contents of value1min_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value1min', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value1min must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value1step_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value1step_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value1step_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value1step_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value1step_textbox as text
%        str2double(get(hObject,'String')) returns contents of value1step_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value1step', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value1step must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value1max_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value1max_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value1max_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value1max_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value1max_textbox as text
%        str2double(get(hObject,'String')) returns contents of value1max_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value1max', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value1max must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value1_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value1_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



% --- Executes on slider movement.
function value1_slider_Callback(hObject, eventdata, handles)
% hObject    handle to value1_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(hObject, 'Value', floor(get(hObject, 'Value')));
refreshplots;



% --- Executes during object creation, after setting all properties.
function value1slider_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value1slider_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value1slider_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value1slider_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value1slider_textbox as text
%        str2double(get(hObject,'String')) returns contents of value1slider_textbox as a double

data = getappdata(gcbf, 'data');

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value1', string)
    set(handles.value1_slider, 'Value', max([length(find(data.value1 <= str2num(string))) 1]));
    refreshplots;
else
    v = get(handles.value1_slider, 'Value');
    set(hObject, 'Value', v, 'String', str2num(v,8));
    if ~isempty(string)
        uiwait(errordlg('value1 must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes on button press in value1x_radiobutton.
function value1x_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to value1x_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of value1x_radiobutton

h = handles.value1y_radiobutton;
if get(h, 'Value') == get(h, 'Max')
    set(h, 'Value', get(h, 'Min'));
    vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        h = eval(['handles.' vars{i} 'x_radiobutton']);
        if get(h, 'Value') == get(h, 'Max') && h ~= hObject
            h = eval(['handles.' vars{i} 'y_radiobutton']);
            set(h, 'Value', get(h, 'Max'));
        end
    end
end
setxradiobuttonsoff;
set(hObject, 'Value', get(hObject, 'Max'));
refreshparam;



% --- Executes on button press in value1y_radiobutton.
function value1y_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to value1y_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of value1y_radiobutton

h = handles.value1x_radiobutton;
if get(h, 'Value') == get(h, 'Max')
    set(h, 'Value', get(h, 'Min'));
    vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        h = eval(['handles.' vars{i} 'y_radiobutton']);
        if get(h, 'Value') == get(h, 'Max') && h ~= hObject
            h = eval(['handles.' vars{i} 'x_radiobutton']);
            set(h, 'Value', get(h, 'Max'));
        end
    end
end
setyradiobuttonsoff;
set(hObject, 'Value', get(hObject, 'Max'));
refreshparam;



%--------------------------------------------------------------------------
%
%  param2
%
%--------------------------------------------------------------------------



% --- Executes during object creation, after setting all properties.
function param2_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param2_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function param2_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to param2_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param2_textbox as text
%        str2double(get(hObject,'String')) returns contents of param2_textbox as a double



% --- Executes during object creation, after setting all properties.
function value2min_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value2min_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value2min_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value2min_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value2min_textbox as text
%        str2double(get(hObject,'String')) returns contents of value2min_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value2min', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value2min must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value2step_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value2step_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value2step_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value2step_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value2step_textbox as text
%        str2double(get(hObject,'String')) returns contents of value2step_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value2step', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value2step must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value2max_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value2max_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value2max_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value2max_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value2max_textbox as text
%        str2double(get(hObject,'String')) returns contents of value2max_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value2max', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value2max must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value2_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value2_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



% --- Executes on slider movement.
function value2_slider_Callback(hObject, eventdata, handles)
% hObject    handle to value2_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(hObject, 'Value', floor(get(hObject, 'Value')));
refreshplots;



% --- Executes during object creation, after setting all properties.
function value2slider_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value2slider_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value2slider_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value2slider_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value2slider_textbox as text
%        str2double(get(hObject,'String')) returns contents of value2slider_textbox as a double

data = getappdata(gcbf, 'data');

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value2', string)
    set(handles.value2_slider, 'Value', max([length(find(data.value2 <= str2num(string))) 1]));
    refreshplots;
else
    v = get(handles.value2_slider, 'Value');
    set(hObject, 'Value', v, 'String', str2num(v,8));
    if ~isempty(string)
        uiwait(errordlg('value2 must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes on button press in value2x_radiobutton.
function value2x_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to value2x_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of value2x_radiobutton

h = handles.value2y_radiobutton;
if get(h, 'Value') == get(h, 'Max')
    set(h, 'Value', get(h, 'Min'));
    vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        h = eval(['handles.' vars{i} 'x_radiobutton']);
        if get(h, 'Value') == get(h, 'Max') && h ~= hObject
            h = eval(['handles.' vars{i} 'y_radiobutton']);
            set(h, 'Value', get(h, 'Max'));
        end
    end
end
setxradiobuttonsoff;
set(hObject, 'Value', get(hObject, 'Max'));
refreshparam;



% --- Executes on button press in value2y_radiobutton.
function value2y_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to value2y_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of value2y_radiobutton

h = handles.value2x_radiobutton;
if get(h, 'Value') == get(h, 'Max')
    set(h, 'Value', get(h, 'Min'));
    vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        h = eval(['handles.' vars{i} 'y_radiobutton']);
        if get(h, 'Value') == get(h, 'Max') && h ~= hObject
            h = eval(['handles.' vars{i} 'x_radiobutton']);
            set(h, 'Value', get(h, 'Max'));
        end
    end
end
setyradiobuttonsoff;
set(hObject, 'Value', get(hObject, 'Max'));
refreshparam;



%--------------------------------------------------------------------------
%
%  param3
%
%--------------------------------------------------------------------------



% --- Executes during object creation, after setting all properties.
function param3_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param3_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function param3_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to param3_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param3_textbox as text
%        str2double(get(hObject,'String')) returns contents of param3_textbox as a double



% --- Executes during object creation, after setting all properties.
function value3min_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value3min_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value3min_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value3min_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value3min_textbox as text
%        str2double(get(hObject,'String')) returns contents of value3min_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value3min', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value3min must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value3step_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value3step_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value3step_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value3step_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value3step_textbox as text
%        str2double(get(hObject,'String')) returns contents of value3step_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value3step', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value3step must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value3max_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value3max_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value3max_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value3max_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value3max_textbox as text
%        str2double(get(hObject,'String')) returns contents of value3max_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value3max', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value3max must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value3_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value3_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



% --- Executes on slider movement.
function value3_slider_Callback(hObject, eventdata, handles)
% hObject    handle to value3_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(hObject, 'Value', floor(get(hObject, 'Value')));
refreshplots;



% --- Executes during object creation, after setting all properties.
function value3slider_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value3slider_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value3slider_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value3slider_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value3slider_textbox as text
%        str2double(get(hObject,'String')) returns contents of value3slider_textbox as a double

data = getappdata(gcbf, 'data');

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value3', string)
    set(handles.value3_slider, 'Value', max([length(find(data.value3 <= str2num(string))) 1]));
    refreshplots;
else
    v = get(handles.value3_slider, 'Value');
    set(hObject, 'Value', v, 'String', str2num(v,8));
    if ~isempty(string)
        uiwait(errordlg('value3 must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes on button press in value3x_radiobutton.
function value3x_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to value3x_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of value3x_radiobutton

h = handles.value3y_radiobutton;
if get(h, 'Value') == get(h, 'Max')
    set(h, 'Value', get(h, 'Min'));
    vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        h = eval(['handles.' vars{i} 'x_radiobutton']);
        if get(h, 'Value') == get(h, 'Max') && h ~= hObject
            h = eval(['handles.' vars{i} 'y_radiobutton']);
            set(h, 'Value', get(h, 'Max'));
        end
    end
end
setxradiobuttonsoff;
set(hObject, 'Value', get(hObject, 'Max'));
refreshparam;



% --- Executes on button press in value3y_radiobutton.
function value3y_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to value3y_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of value3y_radiobutton

h = handles.value3x_radiobutton;
if get(h, 'Value') == get(h, 'Max')
    set(h, 'Value', get(h, 'Min'));
    vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        h = eval(['handles.' vars{i} 'y_radiobutton']);
        if get(h, 'Value') == get(h, 'Max') && h ~= hObject
            h = eval(['handles.' vars{i} 'x_radiobutton']);
            set(h, 'Value', get(h, 'Max'));
        end
    end
end
setyradiobuttonsoff;
set(hObject, 'Value', get(hObject, 'Max'));
refreshparam;



%--------------------------------------------------------------------------
%
%  param4
%
%--------------------------------------------------------------------------



% --- Executes during object creation, after setting all properties.
function param4_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param4_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function param4_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to param4_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param4_textbox as text
%        str2double(get(hObject,'String')) returns contents of param4_textbox as a double



% --- Executes during object creation, after setting all properties.
function value4min_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value4min_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value4min_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value4min_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value4min_textbox as text
%        str2double(get(hObject,'String')) returns contents of value4min_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value4min', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value4min must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value4step_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value4step_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value4step_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value4step_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value4step_textbox as text
%        str2double(get(hObject,'String')) returns contents of value4step_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value4step', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value4step must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value4max_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value4max_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value4max_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value4max_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value4max_textbox as text
%        str2double(get(hObject,'String')) returns contents of value4max_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value4max', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value4max must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value4_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value4_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



% --- Executes on slider movement.
function value4_slider_Callback(hObject, eventdata, handles)
% hObject    handle to value4_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(hObject, 'Value', floor(get(hObject, 'Value')));
refreshplots;



% --- Executes during object creation, after setting all properties.
function value4slider_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value4slider_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value4slider_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value4slider_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value4slider_textbox as text
%        str2double(get(hObject,'String')) returns contents of value4slider_textbox as a double

data = getappdata(gcbf, 'data');

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value4', string)
    set(handles.value4_slider, 'Value', max([length(find(data.value4 <= str2num(string))) 1]));
    refreshplots;
else
    v = get(handles.value4_slider, 'Value');
    set(hObject, 'Value', v, 'String', str2num(v,8));
    if ~isempty(string)
        uiwait(errordlg('value4 must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes on button press in value4x_radiobutton.
function value4x_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to value4x_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of value4x_radiobutton

h = handles.value4y_radiobutton;
if get(h, 'Value') == get(h, 'Max')
    set(h, 'Value', get(h, 'Min'));
    vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        h = eval(['handles.' vars{i} 'x_radiobutton']);
        if get(h, 'Value') == get(h, 'Max') && h ~= hObject
            h = eval(['handles.' vars{i} 'y_radiobutton']);
            set(h, 'Value', get(h, 'Max'));
        end
    end
end
setxradiobuttonsoff;
set(hObject, 'Value', get(hObject, 'Max'));
refreshparam;



% --- Executes on button press in value4y_radiobutton.
function value4y_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to value4y_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of value4y_radiobutton

h = handles.value4x_radiobutton;
if get(h, 'Value') == get(h, 'Max')
    set(h, 'Value', get(h, 'Min'));
    vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        h = eval(['handles.' vars{i} 'y_radiobutton']);
        if get(h, 'Value') == get(h, 'Max') && h ~= hObject
            h = eval(['handles.' vars{i} 'x_radiobutton']);
            set(h, 'Value', get(h, 'Max'));
        end
    end
end
setyradiobuttonsoff;
set(hObject, 'Value', get(hObject, 'Max'));
refreshparam;



%--------------------------------------------------------------------------
%
%  param5
%
%--------------------------------------------------------------------------



% --- Executes during object creation, after setting all properties.
function param5_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param5_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function param5_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to param5_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param5_textbox as text
%        str2double(get(hObject,'String')) returns contents of param5_textbox as a double



% --- Executes during object creation, after setting all properties.
function value5min_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value5min_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value5min_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value5min_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value5min_textbox as text
%        str2double(get(hObject,'String')) returns contents of value5min_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value5min', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value5min must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value5step_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value5step_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value5step_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value5step_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value5step_textbox as text
%        str2double(get(hObject,'String')) returns contents of value5step_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value5step', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value5step must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value5max_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value5max_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value5max_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value5max_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value5max_textbox as text
%        str2double(get(hObject,'String')) returns contents of value5max_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value5max', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value5max must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function value5_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value5_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



% --- Executes on slider movement.
function value5_slider_Callback(hObject, eventdata, handles)
% hObject    handle to value5_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(hObject, 'Value', floor(get(hObject, 'Value')));
refreshplots;



% --- Executes during object creation, after setting all properties.
function value5slider_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value5slider_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value5slider_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value5slider_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value5slider_textbox as text
%        str2double(get(hObject,'String')) returns contents of value5slider_textbox as a double

data = getappdata(gcbf, 'data');

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value5', string)
    set(handles.value5_slider, 'Value', max([length(find(data.value5 <= str2num(string))) 1]));
    refreshplots;
else
    v = get(handles.value5_slider, 'Value');
    set(hObject, 'Value', v, 'String', str2num(v,8));
    if ~isempty(string)
        uiwait(errordlg('value5 must evaluate to a real number', 'error', 'modal'));
    end
end



% --- Executes on button press in value5x_radiobutton.
function value5x_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to value5x_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of value5x_radiobutton

h = handles.value5y_radiobutton;
if get(h, 'Value') == get(h, 'Max')
    set(h, 'Value', get(h, 'Min'));
    vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        h = eval(['handles.' vars{i} 'x_radiobutton']);
        if get(h, 'Value') == get(h, 'Max') && h ~= hObject
            h = eval(['handles.' vars{i} 'y_radiobutton']);
            set(h, 'Value', get(h, 'Max'));
        end
    end
end
setxradiobuttonsoff;
set(hObject, 'Value', get(hObject, 'Max'));
refreshparam;



% --- Executes on button press in value5y_radiobutton.
function value5y_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to value5y_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of value5y_radiobutton

h = handles.value5x_radiobutton;
if get(h, 'Value') == get(h, 'Max')
    set(h, 'Value', get(h, 'Min'));
    vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        h = eval(['handles.' vars{i} 'y_radiobutton']);
        if get(h, 'Value') == get(h, 'Max') && h ~= hObject
            h = eval(['handles.' vars{i} 'x_radiobutton']);
            set(h, 'Value', get(h, 'Max'));
        end
    end
end
setyradiobuttonsoff;
set(hObject, 'Value', get(hObject, 'Max'));
refreshparam;



%--------------------------------------------------------------------------
%
%  zero limits
%
%--------------------------------------------------------------------------



% --- Executes during object creation, after setting all properties.
function lowerzerolimit_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lowerzerolimit_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function lowerzerolimit_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to lowerzerolimit_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lowerzerolimit_textbox as text
%        str2double(get(hObject,'String')) returns contents of lowerzerolimit_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('lowerzerolimit', string)
    lowerzerolimit = str2num(string);
    upperzerolimit = get(handles.upperzerolimit_textbox, 'Value');
    if ~isempty(upperzerolimit) && lowerzerolimit > upperzerolimit
        set(hObject, 'Value', [], 'String', '');
        uiwait(errordlg('lowerzerolimit must be less than or equal to upperzerolimit', 'error', 'modal'));
    else
        set(hObject, 'Value', lowerzerolimit);
    end
else
    set(hObject, 'Value', [], 'String', '');
    uiwait(errordlg('lowerzerolimit must evaluate to a real', 'error', 'modal'));
end



% --- Executes during object creation, after setting all properties.
function upperzerolimit_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to upperzerolimit_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function upperzerolimit_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to upperzerolimit_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of upperzerolimit_textbox as text
%        str2double(get(hObject,'String')) returns contents of upperzerolimit_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('upperzerolimit', string)
    upperzerolimit = str2num(string);
    lowerzerolimit = get(handles.lowerzerolimit_textbox, 'Value');
    if ~isempty(lowerzerolimit) && lowerzerolimit > upperzerolimit
        set(hObject, 'Value', [], 'String', '');
        uiwait(errordlg('lowerzerolimit must be less than or equal to upperzerolimit', 'error', 'modal'));
    else
        set(hObject, 'Value', upperzerolimit);
    end
else
    set(hObject, 'Value', [], 'String', '');
    uiwait(errordlg('upperzerolimit must evaluate to a real', 'error', 'modal'));
end






% --- Executes on button press in build_pushbutton.
function build_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to build_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

vars = {'f' 'g'};
for i = 1:length(vars)
    s = vars{i};
    eval([s ' = get(handles.' s '_textbox, ''String'');']);
    eval(['data.' s ' = ' s ';']);
end

vars = {'gamma_' 'd' 'lowerzerolimit' 'upperzerolimit'};
for i = 1:length(vars)
    s = vars{i};
    eval([s ' = sort(get(handles.' s '_textbox, ''Value''));']);
    if isempty(eval(s))
        uiwait(errordlg([s ' must be specified'], 'error', 'modal'));
        return;
    end
    eval(['data.' s ' = ' s ';']);
end

params = {'param1' 'param2' 'param3' 'param4' 'param5'};
values = {'value1' 'value2' 'value3' 'value4' 'value5'};
for i = 1:length(params)
    s = params{i};
    t = values{i};
    eval([s ' = get(handles.' s '_textbox, ''String'');']);
    min_ = get(eval(['handles.' t 'min_textbox']), 'Value');
    step = get(eval(['handles.' t 'step_textbox']), 'Value');
    max_ = get(eval(['handles.' t 'max_textbox']), 'Value');
    if ~isempty(eval(s))
        eval([eval(s) ' = sym(' s ', ''real'');']);
        try
            eval([t ' = min_:step:max_;']);
        catch
            uiwait(errordlg(['valid parameters must be specified for ' eval(s)], 'error', 'modal'));
            return;
        end
    else
        eval([t ' = [];']);
    end
    eval(['data.' s ' = ' s ';']);
    eval(['data.' t ' = ' t ';']);
end


u = sym('u', 'positive');
v = sym('v', 'positive');
fu = char(simplify(diff(eval(f), u)));
fv = char(simplify(diff(eval(f), v)));
gu = char(simplify(diff(eval(g), u)));
gv = char(simplify(diff(eval(g), v)));

h = simplify(numden(eval(f)));
k = simplify(numden(eval(g)));
hu = simplify(diff(h, u));
hv = simplify(diff(h, v));
ku = simplify(diff(k, u));
kv = simplify(diff(k, v));
Nu = char(simplify(h*kv - hv*k));
Nv = char(simplify(hu*k - ku*h));
D = char(simplify(hu*kv - hv*ku));

Z = zeros([length(gamma_) length(d) ...
           max([length(value1) 1]) ...
           max([length(value2) 1]) ...
           max([length(value3) 1]) ...
           max([length(value4) 1]) ...
           max([length(value5) 1])]);
data.u0 = Z;
data.v0 = Z;
data.k1 = Z;
data.k2 = Z;


vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
for i = 1:length(vars)
    set([eval(['handles.' vars{i} '_slider']) ...
         eval(['handles.' vars{i} 'slider_textbox'])], 'Enable', 'off');
end


tic;

u = (lowerzerolimit + upperzerolimit)/2;
v = (lowerzerolimit + upperzerolimit)/2;

for j1 = 1:max([length(value1) 1])
    if ~isempty(param1)
        eval([param1 ' = value1(j1);']);
        set(handles.value1slider_textbox, 'String', num2str(value1(j1),8));
    end
    for j2 = 1:max([length(value2) 1])
        if ~isempty(param2)
            eval([param2 ' = value2(j2);']);
            set(handles.value2slider_textbox, 'String', num2str(value2(j2),8));
        end
        for j3 = 1:max([length(value3) 1])
            if ~isempty(param3)
                eval([param3 ' = value3(j3);']);
                set(handles.value3slider_textbox, 'String', num2str(value3(j3),8));
            end
            for j4 = 1:max([length(value4) 1])
                if ~isempty(param4)
                    eval([param4 ' = value4(j4);']);
                    set(handles.value4slider_textbox, 'String', num2str(value4(j4),8));
                end
                for j5 = 1:max([length(value5) 1])
                    if ~isempty(param5)
                        eval([param5 ' = value5(j5);']);
                        set(handles.value5slider_textbox, 'String', num2str(value5(j5),8));
                    end
                    drawnow;
                    
                    c = [max(abs([eval(h) eval(k)])) repmat(inf, [1 8])];
                    while c(1) > 1e-8 && c(1) < max(c)
                        D_ = eval(D);
                        if D_ == 0
                            u = u + 1e-8;
                            v = v + 1e-8;
                        else
                            Nu_ = eval(Nu);
                            Nv_ = eval(Nv);
                            u = u - Nu_/D_;
                            v = v - Nv_/D_;
                            if u < lowerzerolimit || u > upperzerolimit
                                u = (lowerzerolimit + upperzerolimit)/2;
                            end
                            if v < lowerzerolimit || v > upperzerolimit
                                v = (lowerzerolimit + upperzerolimit)/2;
                            end
                        end
                        c(2:end) = c(1:end-1);
                        c(1) = max(abs([eval(h) eval(k)]));
                    end
                    
                    if c(1) <= 1e-8
                        data.u0(:,:,j1,j2,j3,j4,j5) = u;
                        data.v0(:,:,j1,j2,j3,j4,j5) = v;
                        fu_ = eval(fu);
                        fv_ = eval(fv);
                        gu_ = eval(gu);
                        gv_ = eval(gv);
                        if fu_ + gv_ < 0 && fu_*gv_ - fv_*gu_ > 0
                            for i = 1:length(d)
                                if d(i)*fu_ + gv_ > 0 && (d(i)*fu_ + gv_)^2 - 4*d(i)*(fu_*gv_ - fv_*gu_) > 0
                                    data.k1(:,i,j1,j2,j3,j4,j5) = ...
                                        gamma_*((d(i)*fu_ + gv_ - sqrt((d(i)*fu_ + gv_)^2 - 4*d(i)*(fu_*gv_ - fv_*gu_)))/(2*d(i)));
                                    data.k2(:,i,j1,j2,j3,j4,j5) = ...
                                        gamma_*((d(i)*fu_ + gv_ + sqrt((d(i)*fu_ + gv_)^2 - 4*d(i)*(fu_*gv_ - fv_*gu_)))/(2*d(i)));
                                end
                            end
                        end
                    else
                        data.u0(:,:,j1,j2,j3,j4,j5) = NaN;
                        data.v0(:,:,j1,j2,j3,j4,j5) = NaN;
                    end
                    
                end
            end
        end
    end
end


disp(['elapsed_time = ' num2str(toc,8)]);

setappdata(gcbf, 'data', data);

initializeplot;



% --- Executes during object creation, after setting all properties.
function x_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function x_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to x_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_textbox as text
%        str2double(get(hObject,'String')) returns contents of x_textbox as a double



% --- Executes during object creation, after setting all properties.
function y_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function y_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to y_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_textbox as text
%        str2double(get(hObject,'String')) returns contents of y_textbox as a double



% --- Executes during object creation, after setting all properties.
function u0_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to u0_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function u0_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to u0_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of u0_textbox as text
%        str2double(get(hObject,'String')) returns contents of u0_textbox as a double



% --- Executes during object creation, after setting all properties.
function v0_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v0_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function v0_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to v0_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v0_textbox as text
%        str2double(get(hObject,'String')) returns contents of v0_textbox as a double



% --- Executes during object creation, after setting all properties.
function k1_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k1_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function k1_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to k1_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k1_textbox as text
%        str2double(get(hObject,'String')) returns contents of k1_textbox as a double



% --- Executes during object creation, after setting all properties.
function k2_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k2_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function k2_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to k2_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k2_textbox as text
%        str2double(get(hObject,'String')) returns contents of k2_textbox as a double



% --- Executes during object creation, after setting all properties.
function p_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function p_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to p_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_textbox as text
%        str2double(get(hObject,'String')) returns contents of p_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('p', string)
    set(hObject, 'Value', str2num(string));
    refreshnm;
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('p must evaluate to a positive real', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function q_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function q_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to q_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_textbox as text
%        str2double(get(hObject,'String')) returns contents of q_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('q', string)
    set(hObject, 'Value', str2num(string));
    refreshnm;
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('q must evaluate to a positive real', 'error', 'modal'));
    end
end



%--------------------------------------------------------------------------
%
%  Menu Callbacks
%
%--------------------------------------------------------------------------



% --------------------------------------------------------------------
function file_menu_Callback(hObject, eventdata, handles)
% hObject    handle to file_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function importbuild_menu_Callback(hObject, eventdata, handles)
% hObject    handle to importbuild_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(hObject, 'Interruptible', 'off');
[filename pathname] = uigetfile('*.mat', 'Open...');
if ~isequal(filename, 0)
    try
        loadbuild(pathname, filename);
        initializeplot;
    catch
    end
end



% --------------------------------------------------------------------
function exportbuild_menu_Callback(hObject, eventdata, handles)
% hObject    handle to exportbuild_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(hObject, 'Interruptible', 'off');
[filename pathname] = uiputfile('param.mat', 'Save as...');
if ~isequal(filename, 0)
    data = getappdata(gcbf, 'data');
    save([pathname filename], 'data');
end



% --------------------------------------------------------------------
function exportframe_menu_Callback(hObject, eventdata, handles)
% hObject    handle to exportframe_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

figure;
plotparam;



% --------------------------------------------------------------------
function printframe_menu_Callback(hObject, eventdata, handles)
% hObject    handle to printframe_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

printdlg(gcbf);



% --------------------------------------------------------------------
function load_menu_Callback(hObject, eventdata, handles)
% hObject    handle to load_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function schnakenberg_menu_Callback(hObject, eventdata, handles)
% hObject    handle to schnakenberg_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    loadkinetics('schnakenberg_kinetics.mat');
    disablemovie;
catch
end



% --------------------------------------------------------------------
function giererandmeinhardt_menu_Callback(hObject, eventdata, handles)
% hObject    handle to giererandmeinhardt_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    loadkinetics('giererandmeinhardt_kinetics.mat');
    disablemovie;
catch
end



% --------------------------------------------------------------------
function thomas_menu_Callback(hObject, eventdata, handles)
% hObject    handle to thomas_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    loadkinetics('thomas_kinetics.mat');
    disablemovie;
catch
end



% --------------------------------------------------------------------
function predatorprey_menu_Callback(hObject, eventdata, handles)
% hObject    handle to predatorprey_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    loadkinetics('predatorprey_kinetics.mat');
    disablemovie;
catch
end



% --------------------------------------------------------------------
function barrioetal_menu_Callback(hObject, eventdata, handles)
% hObject    handle to barrioetal_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    loadkinetics('barrioetal_kinetics.mat');
    disablemovie;
catch
end



% --------------------------------------------------------------------
function empty_menu_Callback(hObject, eventdata, handles)
% hObject    handle to empty_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    loadbuild('', 'empty.mat');
catch
end



% --------------------------------------------------------------------
function default_menu_Callback(hObject, eventdata, handles)
% hObject    handle to default_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    loadbuild('', 'default.mat');
catch
end



% --------------------------------------------------------------------
function exit_menu_Callback(hObject, eventdata, handles)
% hObject    handle to exit_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

delete(gcbf);



% --------------------------------------------------------------------
function plotting_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotting_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function colormaps_menu_Callback(hObject, eventdata, handles)
% hObject    handle to colormaps_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function hsv_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to hsv_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function hot_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to hot_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function gray_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to gray_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function bone_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to bone_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function copper_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to copper_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function pink_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to pink_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function white_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to white_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function flag_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to flag_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function lines_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to lines_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function colorcube_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to colorcube_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function vga_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to vga_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function jet_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to jet_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function prism_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to prism_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function cool_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to cool_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function autumn_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to autumn_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function spring_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to spring_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function winter_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to winter_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function summer_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to summer_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function mudd_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to mudd_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshplots;



% --------------------------------------------------------------------
function shading_menu_Callback(hObject, eventdata, handles)
% hObject    handle to shading_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function faceted_shading_menu_Callback(hObject, eventdata, handles)
% hObject    handle to faceted_shading_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setshadingmenusoff;
set(hObject, 'Checked', 'on');
refreshparam;



% --------------------------------------------------------------------
function flat_shading_menu_Callback(hObject, eventdata, handles)
% hObject    handle to flat_shading_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setshadingmenusoff;
set(hObject, 'Checked', 'on');
refreshparam;



% --------------------------------------------------------------------
function interp_shading_menu_Callback(hObject, eventdata, handles)
% hObject    handle to interp_shading_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setshadingmenusoff;
set(hObject, 'Checked', 'on');
refreshparam;



%--------------------------------------------------------------------------
%
%  Miscellaneous Functions
%
%--------------------------------------------------------------------------



% --- Executes on mouse motion over figure - except title and menu.
function paramgui_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to paramgui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
if isempty(data.k1)
    return;
end

handles = guidata(gcbf);
point = get(handles.axes, 'CurrentPoint');
x = point(1,1);
y = point(1,2);
xlim = get(handles.axes, 'XLim');
ylim = get(handles.axes, 'YLim');
if x < xlim(1) || x > xlim(2) || y < ylim(1) || y > ylim(2)
    return;
end

vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
for i = 1:length(vars)
    s = vars{i};
    hx = eval(['handles.' s 'x_radiobutton']);
    hy = eval(['handles.' s 'y_radiobutton']);
    v = eval(['data.' s]);
    if ~isempty(v)
        if get(hx, 'Value') == get(hx, 'Max')
            x = v(max([find(v < x) 1]));
            set(handles.x_textbox, 'Value', x, 'String', num2str(x,8));
        elseif get(hy, 'Value') == get(hy, 'Max')
            y = v(max([find(v < y) 1]));
            set(handles.y_textbox, 'Value', y, 'String', num2str(y,8));
        end
    end
end



% --- Executes on mouse press over figure - except title and menu.
function paramgui_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to paramgui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
if isempty(data.k1)
    return;
end

handles = guidata(gcbf);
point = get(handles.axes, 'CurrentPoint');
x = point(1,1);
y = point(1,2);
xlim = get(handles.axes, 'XLim');
ylim = get(handles.axes, 'YLim');
if x < xlim(1) || x > xlim(2) || y < ylim(1) || y > ylim(2)
    return;
end

vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
for i = 1:length(vars)
    s = vars{i};
    hx = eval(['handles.' s 'x_radiobutton']);
    hy = eval(['handles.' s 'y_radiobutton']);
    v = eval(['data.' s]);
    if ~isempty(v)
        if get(hx, 'Value') == get(hx, 'Max')
            set(eval(['handles.' s '_slider']), 'Value', max([find(v < x) 1]));
        elseif get(hy, 'Value') == get(hy, 'Max')
            set(eval(['handles.' s '_slider']), 'Value', max([find(v < y) 1]));
        end
    end
end

refreshnm;



% --- Determines if the value in string is valid for variable.
function b = isvalid(var, string)

v = str2num(string);
switch var
    case {'nonnegativerealvector' 'd' 'gamma_'}
        b = min(size(v)) == 1 && all(~isnan(v)) && all(isreal(v)) && all(v >= 0);
    case {'positivereal' 'value1step' 'value2step' 'value3step' 'value4step' 'value5step' 'p' 'q'};
        b = isequal(size(v), [1 1]) &&  ~isnan(v) && isreal(v) && v > 0;
    case {'real' 'value1' 'value1min' 'value1max' ...
                 'value2' 'value2min' 'value2max' ...
                 'value3' 'value3min' 'value3max' ...
                 'value4' 'value4min' 'value4max' ...
                 'value5' 'value5min' 'value5max' ...
                 'lowerzerolimit' 'upperzerolimit'};
        b = isequal(size(v), [1 1]) && ~isnan(v) && isreal(v);
    otherwise
        b = false;
end



% --- Initializes plot values.
function initializeplot

handles = guidata(gcbf);
data = getappdata(gcbf, 'data');
vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
for i = 1:length(vars)
    s = vars{i};
    v = eval(['data.' s]);
    set(eval(['handles.' s '_slider']), 'Min', 1, 'Max', max([2 length(v)]), 'Value', 1);
    if length(v) > 1
        set(eval(['handles.' s '_slider']), 'SliderStep', [1 2]/(length(v)-1));
        set([eval(['handles.' s '_slider']) eval(['handles.' s 'slider_textbox'])], 'Enable', 'on');
    end
end
refreshplots;



% --- Sets all x radiobuttons off
function setxradiobuttonsoff

handles = guidata(gcbf);
vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
for i = 1:length(vars)
    h = eval(['handles.' vars{i} 'x_radiobutton']);
    set(h, 'Value', get(h, 'Min'));
end



% --- Sets all y radiobuttons off
function setyradiobuttonsoff

handles = guidata(gcbf);
vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
for i = 1:length(vars)
    h = eval(['handles.' vars{i} 'y_radiobutton']);
    set(h, 'Value', get(h, 'Min'));
end



% --- Unchecks all colormap menus
function setcolormapmenusoff

handles = guidata(gcbf);
colormaps = {'hsv' 'hot' 'gray' 'bone' 'copper' 'pink' 'white' ...
             'flag' 'lines' 'colorcube' 'vga' 'jet' 'prism' ...
             'cool' 'autumn' 'spring' 'winter' 'summer' ...
             'mudd'};
for i = 1:length(colormaps)
    set(eval(['handles.' colormaps{i} '_colormap_menu']), 'Checked', 'off');
end



% --- Unchecks all shading menus
function setshadingmenusoff

handles = guidata(gcbf);
shadings = {'faceted' 'flat' 'interp'};
for i = 1:length(shadings)
    set(eval(['handles.' shadings{i} '_shading_menu']), 'Checked', 'off');
end



% --- Sets colormap
function setcolormap

handles = guidata(gcbf);
colormaps = {'hsv' 'hot' 'gray' 'bone' 'copper' 'pink' 'white' ...
             'flag' 'lines' 'colorcube' 'vga' 'jet' 'prism' ...
             'cool' 'autumn' 'spring' 'winter' 'summer' ...
             'mudd'};
for i = 1:length(colormaps)
    if isequal(get(eval(['handles.' colormaps{i} '_colormap_menu']), 'Checked'), 'on')
        switch colormaps{i}
            case 'mudd'
                colormap([(0:232/64:232)' (0:196/64:196)' (0:94/64:94)']/255);
            otherwise
                colormap(colormaps{i});
        end
    end
end



% --- Refresh values
function refreshvalues

handles = guidata(gcbf);
data = getappdata(gcbf, 'data');
vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
for i = 1:length(vars)
    s = vars{i};
    v = eval(['data.' s]);
    k = get(eval(['handles.' s '_slider']), 'Value');
    if isempty(v)
        set(eval(['handles.' s 'slider_textbox']), 'Value', [], 'String', '');
    else
        set(eval(['handles.' s 'slider_textbox']), 'Value', v(k), 'String', num2str(v(k),8));
    end
end

drawnow;



% --- Refresh both plots
function refreshplots

refreshvalues;
handles = guidata(gcbf);
axes(handles.axes);
plotparam;
axes(handles.nm_axes);
plotnm;



% --- Refresh param plot
function refreshparam

refreshvalues;
handles = guidata(gcbf);
axes(handles.axes);
plotparam;



% --- Refresh nm plot
function refreshnm

refreshvalues;
handles = guidata(gcbf);
axes(handles.nm_axes);
plotnm;



% --- Plot parameter space.
function plotparam

handles = guidata(gcbf);
data = getappdata(gcbf, 'data');

if isempty(data.k1)
    return;
end

cla;

vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
j = cell([1 length(vars)]);
order = zeros([1 length(vars)]);
for i = 1:length(vars)
    s = vars{i};
    v = eval(['data.' s]);
    k = get(eval(['handles.' s '_slider']), 'Value');
    hx = eval(['handles.' s 'x_radiobutton']);
    hy = eval(['handles.' s 'y_radiobutton']);
    if get(hx, 'Value') == get(hx, 'Max')
        if isempty(v)
            return;
        end
        x = v;
        j{2} = 1:length(v);
        order(2) = i;
    elseif get(hy, 'Value') == get(hy, 'Max')
        if isempty(v)
            return;
        end
        y = v;
        j{1} = 1:length(v);
        order(1) = i;
    else
        j{i + (order(1) == 0) + (order(2) == 0)} = k;
        order(i + (order(1) == 0) + (order(2) == 0)) = i;
    end
end

k1 = permute(data.k1, order);
k1 = squeeze(k1(j{1},j{2},j{3},j{4},j{5},j{6},j{7}));
k2 = permute(data.k2, order);
k2 = squeeze(k2(j{1},j{2},j{3},j{4},j{5},j{6},j{7}));
kmax = (k1 + k2)/2;

if length(x) == 1
    x = [x-1e-8 x+1e-8];
    kmax = [kmax kmax];
elseif ~isequal(get(handles.interp_shading_menu, 'Checked'), 'on')
    x = [x x(end)];
    kmax = [kmax kmax(:,end)];
end
if length(y) == 1
    y = [y-1e-8 y+1e-8];
    kmax = [kmax ; kmax];
elseif ~isequal(get(handles.interp_shading_menu, 'Checked'), 'on')
    y = [y y(end)];
    kmax = [kmax ; kmax(end,:)];
end

pcolor(x, y, kmax);
caxis([0 max(max(kmax))]);

vars = {'gamma_' 'd' data.param1 data.param2 data.param3 data.param4 data.param5};
xlabel(vars(order(2)));
ylabel(vars(order(1)));

setcolormap;

shadings = {'faceted' 'flat' 'interp'};
for i = 1:length(shadings)
    if isequal(get(eval(['handles.' shadings{i} '_shading_menu']), 'Checked'), 'on')
        shading(shadings{i});
    end
end



% --- Plot possible (n,m)
function plotnm

handles = guidata(gcbf);
vars = {'gamma_' 'd' 'value1' 'value2' 'value3' 'value4' 'value5'};
j = zeros([1 length(vars)]);
for i = 1:length(vars)
    j(i) = get(eval(['handles.' vars{i} '_slider']), 'Value');
end

data = getappdata(gcbf, 'data');

set(handles.u0_textbox, 'String', num2str(data.u0(j(1),j(2),j(3),j(4),j(5),j(6),j(7)),6));
set(handles.v0_textbox, 'String', num2str(data.v0(j(1),j(2),j(3),j(4),j(5),j(6),j(7)),6));
k1 = data.k1(j(1),j(2),j(3),j(4),j(5),j(6),j(7));
k2 = data.k2(j(1),j(2),j(3),j(4),j(5),j(6),j(7));
set(handles.k1_textbox, 'String', num2str(k1,6));
set(handles.k2_textbox, 'String', num2str(k2,6));

p = get(handles.p_textbox, 'Value');
q = get(handles.q_textbox, 'Value');
if isempty(p) || isempty(q)
    return;
end

cla;

n = 0:floor(sqrt(k2/pi^2*p^2)) + 1;
m = 0:floor(sqrt(k2/pi^2*q^2)) + 1;
nm = zeros([length(m) length(n)]);
for i = 1:length(m)
    for j = 1:length(n)
        k = pi^2*((j-1)^2/p^2 + (i-1)^2/q^2);
        if k1 < k && k < k2
            nm(i,j) = min([k - k1 k2 - k]);
        else
            nm(i,j) = NaN;
        end
    end
end

pcolor(n - 1/2, m - 1/2, nm);
xlabel('n');
ylabel('m');

setcolormap;
shading('faceted');
set(gca, 'XMinorGrid', 'on');
set(gca, 'YMinorGrid', 'on');



% --- Load the specified kinetics.
function loadkinetics(filename)

handles = guidata(gcbf);
try
    load(filename);
    vars = {'param1' 'param2' 'param3' 'param4' 'param5' 'f' 'g'};
    for i = 1:length(vars)
        set(eval(['handles.' vars{i} '_textbox']), 'String', eval(['data.' vars{i}]));
    end
catch
    uiwait(errordlg(['error loading ' filename], 'error', 'modal'));
    rethrow(lasterror);
end



% --- Loads the specified build.
function loadbuild(pathname, filename)

handles = guidata(gcbf);
data = getappdata(gcbf, 'data');
try
    load([pathname filename]);
    vars = {'gamma_' 'd' 'lowerzerolimit' 'upperzerolimit'};
    for i = 1:length(vars)
        set(eval(['handles.' vars{i} '_textbox']), ...
            'Value', eval(['data.' vars{i}]), ...
            'String', mat2str(eval(['data.' vars{i}]),8));
    end
    vars = {'value1' 'value2' 'value3' 'value4' 'value5'};
    for i = 1:length(vars)
        v = eval(['data.' vars{i}]);
        min_ = min(v);
        if length(v) > 1
            step = v(2) - v(1);
        else
            step = 1;
        end
        max_ = max(v);
        set([eval(['handles.' vars{i} 'min_textbox']) ...
             eval(['handles.' vars{i} 'step_textbox']) ...
             eval(['handles.' vars{i} 'max_textbox'])], {'Value' 'String'}, ...
             {min_ num2str(min_,8) ; step num2str(step,8) ; max_ num2str(max_,8)});
    end
    vars = {'f' 'g' 'param1' 'param2' 'param3' 'param4' 'param5'};
    for i = 1:length(vars)
        set(eval(['handles.' vars{i} '_textbox']), 'String', eval(['data.' vars{i}]));
    end
catch
    uiwait(errordlg(['error loading ' filename], 'error', 'modal'));
    rethrow(lasterror);
end

setappdata(gcbf, 'data', data);

axes(handles.axes);
cla reset;

