function varargout = rd2dgui(varargin)
% RD2DGUI M-file for rd2dgui.fig
%      RD2DGUI, by itself, creates a new RD2DGUI or raises the existing
%      singleton*.
%
%      H = RD2DGUI returns the handle to a new RD2DGUI or the handle to
%      the existing singleton*.
%
%      RD2DGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RD2DGUI.M with the given input arguments.
%
%      RD2DGUI('Property','Value',...) creates a new RD2DGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rd2dgui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rd2dgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rd2dgui

% Last Modified by GUIDE v2.5 11-Aug-2003 00:10:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rd2dgui_OpeningFcn, ...
                   'gui_OutputFcn',  @rd2dgui_OutputFcn, ...
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


% --- Executes just before rd2dgui is made visible.
function rd2dgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rd2dgui (see VARARGIN)

data.buildnew = true;

vars = {'gamma_' 'd' 'xmax' 'Jx' 'dx' 'ymax' ...
        'Jy' 'dy' 'dt' 'nux' 'nuy' 'displaystep' ...
        'value1' 'value2' 'value3' 'value4' 'value5' ...
        'maxperturbation' 'randomseed' 'nsteps' 'maxchange' ...
        'uthreshold' 'vthreshold' ...
        'x' 'y' 'U0' 'V0' 'U' 'V'};
for i = 1:length(vars)
    eval(['data.' vars{i} ' = [];']);
end
vars = {'param1' 'param2' 'param3' 'param4' 'param5'...
        'f' 'g' 'u0' 'v0'};
for i = 1:length(vars)
    eval(['data.' vars{i} ' = '''';']);
end
vars = {'u0yt' 'ux0yt' 'uxmaxyt' 'uxxmaxyt' 'u0ytuxmaxyt' ...
        'ux0t' 'uyx0t' 'uxymaxt' 'uyxymaxt' 'ux0tuxymaxt' ...
        'v0yt' 'vx0yt' 'vxmaxyt' 'vxxmaxyt' 'v0ytvxmaxyt' ...
        'vx0t' 'vyx0t' 'vxymaxt' 'vyxymaxt' 'vx0tvxymaxt' ...
        'maxperturbation' 'randomseed' 'nsteps' 'maxchange' ...
        'uthreshold' 'vthreshold'};
for i = 1:length(vars)
    eval(['data.' vars{i} '_flag = false;']);
end

setappdata(hObject, 'data', data);

% Choose default command line output for rd2dgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rd2dgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rd2dgui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



%--------------------------------------------------------------------------
%
%  Reaction Kinetics
%    gamma    = ________
%    d        = ________
%    f(u,v)   = ________
%    g(u,v)   = ________
%    ________ = ________
%    ________ = ________
%    ________ = ________
%    ________ = ________
%    ________ = ________
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

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('gamma_', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('gamma_ must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



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

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('d', string)
    d = str2num(string);
    set(hObject, 'Value', d);
    if isequal(get(handles.forcemaximumprinciplecondition_menu, 'Checked'), 'on')
        dx = get(handles.dx_textbox, 'Value');
        dy = get(handles.dy_textbox, 'Value');
        if ~isempty(dx) && ~isempty(dy)
            dt = min([dx dy])^2/max([1 d]);
            nux = dt/dx^2;
            nuy = dt/dy^2;
            set([handles.dt_textbox handles.nux_textbox handles.nuy_textbox], ...
                {'Value' 'String'}, ...
                {dt num2str(dt,8) ; nux num2str(nux,8) ; nuy num2str(nuy,8)});
        end
    end
else
    set([hObject handles.nux_textbox handles.nuy_textbox], 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('d must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



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

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);



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

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);



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

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);



% --- Executes during object creation, after setting all properties.
function value1_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value1_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value1_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value1_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value1_textbox as text
%        str2double(get(hObject,'String')) returns contents of value1_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value1', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value1 must evaluate to a number', 'error', 'modal'));
    end
end



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

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);



% --- Executes during object creation, after setting all properties.
function value2_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value2_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value2_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value2_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value2_textbox as text
%        str2double(get(hObject,'String')) returns contents of value2_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value2', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value2 must evaluate to a number', 'error', 'modal'));
    end
end



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

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);



% --- Executes during object creation, after setting all properties.
function value3_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value3_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value3_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value3_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value3_textbox as text
%        str2double(get(hObject,'String')) returns contents of value3_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value3', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value3 must evaluate to a number', 'error', 'modal'));
    end
end



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

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);



% --- Executes during object creation, after setting all properties.
function value4_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value4_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value4_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value4_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value4_textbox as text
%        str2double(get(hObject,'String')) returns contents of value4_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value4', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value4 must evaluate to a number', 'error', 'modal'));
    end
end



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

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);



% --- Executes during object creation, after setting all properties.
function value5_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value5_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function value5_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to value5_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value5_textbox as text
%        str2double(get(hObject,'String')) returns contents of value5_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('value5', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('value5 must evaluate to a number', 'error', 'modal'));
    end
end



%--------------------------------------------------------------------------
%
%  Calculation
%    xmax = ________
%    Jx =   ________
%    dx =   ________
%    ymax = ________
%    Jy =   ________
%    dy =   ________
%    dt =   ________
%    nux =  ________
%    nuy =  ________
%
%--------------------------------------------------------------------------



% --- Executes during object creation, after setting all properties.
function xmax_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmax_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function xmax_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to xmax_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmax_textbox as text
%        str2double(get(hObject,'String')) returns contents of xmax_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('xmax', string)
    xmax = str2num(string);
    Jx = get(handles.Jx_textbox, 'Value');
    dx = get(handles.dx_textbox, 'Value');
    if ~isempty(Jx)
        dx = xmax/Jx;
    elseif ~isempty(dx)
        Jx = max([ceil(xmax/dx) 3]);
        dx = xmax/Jx;
    end
    if ~isempty(dx)
        dy = get(handles.dy_textbox, 'Value');
        dt = get(handles.dt_textbox, 'Value');
        nux = get(handles.nux_textbox, 'Value');
        nuy = get(handles.nuy_textbox, 'Value');
        d = get(handles.d_textbox, 'Value');
        if isequal(get(handles.forcemaximumprinciplecondition_menu, 'Checked'), 'off')
            if ~isempty(dt)
                nux = dt/dx^2;
            end
        elseif ~isempty(dy) && ~isempty(d)
            dt = min([dx dy])^2/max([1 d]);
            nux = dt/dx^2;
            nuy = dt/dy^2;
        end
        set([handles.dt_textbox handles.nux_textbox handles.nuy_textbox], ...
            {'Value' 'String'}, ...
            {dt num2str(dt,8) ; nux num2str(nux,8) ; nuy num2str(nuy,8)});
    end
    set([handles.xmax_textbox handles.Jx_textbox handles.dx_textbox], ...
        {'Value' 'String'}, ...
        {xmax num2str(xmax,8) ; Jx int2str(Jx) ; dx num2str(dx,8)});
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        
        uiwait(errordlg('xmax must evaluate to a positive real', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function Jx_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Jx_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Jx_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to Jx_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Jx_textbox as text
%        str2double(get(hObject,'String')) returns contents of Jx_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('Jx', string)
    Jx = str2num(string);
    xmax = get(handles.xmax_textbox, 'Value');
    dx = get(handles.dx_textbox, 'Value');
    if ~isempty(xmax)
        dx = xmax/Jx;
    elseif ~isempty(dx)
        xmax = Jx*dx;
    end
    if ~isempty(dx)
        dy = get(handles.dy_textbox, 'Value');
        dt = get(handles.dt_textbox, 'Value');
        nux = get(handles.nux_textbox, 'Value');
        nuy = get(handles.nuy_textbox, 'Value');
        d = get(handles.d_textbox, 'Value');
        if isequal(get(handles.forcemaximumprinciplecondition_menu, 'Checked'), 'off')
            if ~isempty(dt)
                nux = dt/dx^2;
            end
        elseif ~isempty(dy) && ~isempty(d)
            dt = min([dx dy])^2/max([1 d]);
            nux = dt/dx^2;
            nuy = dt/dy^2;
        end
        set([handles.dt_textbox handles.nux_textbox handles.nuy_textbox], ...
            {'Value' 'String'}, ...
            {dt num2str(dt,8) ; nux num2str(nux,8) ; nuy num2str(nuy,8)});
    end
    set([handles.xmax_textbox handles.Jx_textbox handles.dx_textbox], ...
        {'Value' 'String'}, ...
        {xmax num2str(xmax,8) ; Jx int2str(Jx) ; dx num2str(dx,8)});
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('Jx must evaluate to an integer greater than 2', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function dx_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dx_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function dx_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to dx_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dx_textbox as text
%        str2double(get(hObject,'String')) returns contents of dx_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('dx', string)
    dx = str2num(string);
    xmax = get(handles.xmax_textbox, 'Value');
    Jx = get(handles.Jx_textbox, 'Value');
    if ~isempty(xmax)
        Jx = max([ceil(xmax/dx) 3]);
        dx = xmax/Jx;
    elseif ~isempty(Jx)
        xmax = Jx*dx;
    end
    if ~isempty(dx)
        dy = get(handles.dy_textbox, 'Value');
        dt = get(handles.dt_textbox, 'Value');
        nux = get(handles.nux_textbox, 'Value');
        nuy = get(handles.nuy_textbox, 'Value');
        d = get(handles.d_textbox, 'Value');
        if isequal(get(handles.forcemaximumprinciplecondition_menu, 'Checked'), 'off')
            if ~isempty(dt)
                nux = dt/dx^2;
            end
        elseif ~isempty(dy) && ~isempty(d)
            dt = min([dx dy])^2/max([1 d]);
            nux = dt/dx^2;
            nuy = dt/dy^2;
        end
        set([handles.dt_textbox handles.nux_textbox handles.nuy_textbox], ...
            {'Value' 'String'}, ...
            {dt num2str(dt,8) ; nux num2str(nux,8) ; nuy num2str(nuy,8)});
    end
    set([handles.xmax_textbox handles.Jx_textbox handles.dx_textbox], ...
        {'Value' 'String'}, ...
        {xmax num2str(xmax,8) ; Jx int2str(Jx) ; dx num2str(dx,8)});
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('dx must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function ymax_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ymax_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ymax_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to ymax_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ymax_textbox as text
%        str2double(get(hObject,'String')) returns contents of ymax_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('ymax', string)
    ymax = str2num(string);
    Jy = get(handles.Jy_textbox, 'Value');
    dy = get(handles.dy_textbox, 'Value');
    if ~isempty(Jy)
        dy = ymax/Jy;
    elseif ~isempty(dy)
        Jy = max([ceil(ymax/dy) 3]);
        dy = ymax/Jy;
    end
    if ~isempty(dy)
        dx = get(handles.dx_textbox, 'Value');
        dt = get(handles.dt_textbox, 'Value');
        nux = get(handles.nux_textbox, 'Value');
        nuy = get(handles.nuy_textbox, 'Value');
        d = get(handles.d_textbox, 'Value');
        if isequal(get(handles.forcemaximumprinciplecondition_menu, 'Checked'), 'off')
            if ~isempty(dt)
                nuy = dt/dy^2;
            end
        elseif ~isempty(dx) && ~isempty(d)
            dt = min([dx dy])^2/max([1 d]);
            nux = dt/dx^2;
            nuy = dt/dy^2;
        end
        set([handles.dt_textbox handles.nux_textbox handles.nuy_textbox], ...
            {'Value' 'String'}, ...
            {dt num2str(dt,8) ; nux num2str(nux,8) ; nuy num2str(nuy,8)});
    end
    set([handles.ymax_textbox handles.Jy_textbox handles.dy_textbox], ...
        {'Value' 'String'}, ...
        {ymax num2str(ymax,8) ; Jy int2str(Jy) ; dy num2str(dy,8)});
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('ymax must evaluate to a positive real', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function Jy_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Jy_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Jy_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to Jy_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Jy_textbox as text
%        str2double(get(hObject,'String')) returns contents of Jy_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('Jy', string)
    Jy = str2num(string);
    ymax = get(handles.ymax_textbox, 'Value');
    dy = get(handles.dy_textbox, 'Value');
    if ~isempty(ymax)
        dy = ymax/Jy;
    elseif ~isempty(dy)
        ymax = Jy*dy;
    end
    if ~isempty(dy)
        dx = get(handles.dx_textbox, 'Value');
        dt = get(handles.dt_textbox, 'Value');
        nux = get(handles.nux_textbox, 'Value');
        nuy = get(handles.nuy_textbox, 'Value');
        d = get(handles.d_textbox, 'Value');
        if isequal(get(handles.forcemaximumprinciplecondition_menu, 'Checked'), 'off')
            if ~isempty(dt)
                nuy = dt/dy^2;
            end
        elseif ~isempty(dx) && ~isempty(d)
            dt = min([dx dy])^2/max([1 d]);
            nux = dt/dx^2;
            nuy = dt/dy^2;
        end
        set([handles.dt_textbox handles.nux_textbox handles.nuy_textbox], ...
            {'Value' 'String'}, ...
            {dt num2str(dt,8) ; nux num2str(nux,8) ; nuy num2str(nuy,8)});
    end
    set([handles.ymax_textbox handles.Jy_textbox handles.dy_textbox], ...
        {'Value' 'String'}, ...
        {ymax num2str(ymax,8) ; Jy int2str(Jy) ; dy num2str(dy,8)});
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('Jy must evaluate to an integer greater than 2', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function dy_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dy_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function dy_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to dy_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dy_textbox as text
%        str2double(get(hObject,'String')) returns contents of dy_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('dy', string)
    dy = str2num(string);
    ymax = get(handles.ymax_textbox, 'Value');
    Jy = get(handles.Jy_textbox, 'Value');
    if ~isempty(ymax)
        Jy = max([ceil(ymax/dy) 3]);
        dy = ymax/Jy;
    elseif ~isempty(Jy)
        ymax = Jy*dy;
    end
    if ~isempty(dy)
        dx = get(handles.dx_textbox, 'Value');
        dt = get(handles.dt_textbox, 'Value');
        nux = get(handles.nux_textbox, 'Value');
        nuy = get(handles.nuy_textbox, 'Value');
        d = get(handles.d_textbox, 'Value');
        if isequal(get(handles.forcemaximumprinciplecondition_menu, 'Checked'), 'off')
            if ~isempty(dt)
                nuy = dt/dy^2;
            end
        elseif ~isempty(dx) && ~isempty(d)
            dt = min([dx dy])^2/max([1 d]);
            nux = dt/dx^2;
            nuy = dt/dy^2;
        end
        set([handles.dt_textbox handles.nux_textbox handles.nuy_textbox], ...
            {'Value' 'String'}, ...
            {dt num2str(dt,8) ; nux num2str(nux,8) ; nuy num2str(nuy,8)});
    end
    set([handles.ymax_textbox handles.Jy_textbox handles.dy_textbox], ...
        {'Value' 'String'}, ...
        {ymax num2str(ymax,8) ; Jy int2str(Jy) ; dy num2str(dy,8)});
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('dy must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function dt_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dt_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function dt_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to dt_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dt_textbox as text
%        str2double(get(hObject,'String')) returns contents of dt_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('dt', string)
    dt = str2num(string);
    xmax = get(handles.xmax_textbox, 'Value');
    Jx = get(handles.Jx_textbox, 'Value');
    dx = get(handles.dx_textbox, 'Value');
    ymax = get(handles.ymax_textbox, 'Value');
    Jy = get(handles.Jy_textbox, 'Value');
    dy = get(handles.dy_textbox, 'Value');
    nux = get(handles.nux_textbox, 'Value');
    nuy = get(handles.nuy_textbox, 'Value');
    d = get(handles.d_textbox, 'Value');
    if isequal(get(handles.forcemaximumprinciplecondition_menu, 'Checked'), 'off')
        if ~isempty(dx)
            nux = dt/dx^2;
        elseif ~isempty(nux)
            dx = sqrt(dt/nux);
        end
        if ~isempty(dy)
            nuy = dt/dy^2;
        elseif ~isempty(nuy)
            dy = sqrt(dt/nuy);
        end
    elseif ~isempty(d)
        dx = sqrt(dt*max([1 d]));
        dy = sqrt(dt*max([1 d]));
    end
    if ~isempty(dx)
        if ~isempty(xmax)
            Jx = max([ceil(xmax/dx) 3]);
            dx = xmax/Jx;
        elseif ~isempty(Jx)
            xmax = Jx*dx;
        end
    end
    if ~isempty(dy)
        if ~isempty(ymax)
            Jy = max([ceil(ymax/dy) 3]);
            dy = ymax/Jy;
        elseif ~isempty(Jy)
            ymax = Jy*dy;
        end
    end
    if isequal(get(handles.forcemaximumprinciplecondition_menu, 'Checked'), 'on')
        dt = min([dx dy])^2/max([1 d]);
    end
    nux = dt/dx^2;
    nuy = dt/dy^2;
    set([handles.xmax_textbox handles.Jx_textbox handles.dx_textbox ...
         handles.ymax_textbox handles.Jy_textbox handles.dy_textbox ...
         handles.dt_textbox handles.nux_textbox handles.nuy_textbox], ...
        {'Value' 'String'}, ...
        {xmax num2str(xmax,8) ; Jx int2str(Jx) ; dx num2str(dx,8) ; ...
         ymax num2str(ymax,8) ; Jy int2str(Jy) ; dy num2str(dy,8) ; ...
         dt num2str(dt,8) ; nux num2str(nux,8) ; nuy num2str(nuy,8)});
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('dt must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function nux_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nux_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function nux_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to nux_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nux_textbox as text
%        str2double(get(hObject,'String')) returns contents of nux_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('nux', string)
    nux = str2num(string);
    dt = get(handles.dt_textbox, 'Value');
    if ~isempty(dt)
        dx = sqrt(dt/nux);
        xmax = get(handles.xmax_textbox, 'Value');
        Jx = get(handles.Jx_textbox, 'Value');
        if ~isempty(xmax)
            Jx = max([ceil(xmax/dx) 3]);
            dx = xmax/Jx;
            nux = dt/dx^2;
        elseif ~isempty(Jx)
            xmax = Jx*dx;
        end
        set([handles.xmax_textbox handles.Jx_textbox handles.dx_textbox], ...
            {'Value' 'String'}, ...
            {xmax num2str(xmax,8) ; Jx num2str(Jx,8) ; dx num2str(dx,8)});
    end
    set(handles.nux_textbox, 'Value', nux, 'String', num2str(nux,8));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('nux must evaluate to a positive real', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function nuy_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nuy_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function nuy_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to nuy_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nuy_textbox as text
%        str2double(get(hObject,'String')) returns contents of nuy_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('nuy', string)
    nuy = str2num(string);
    dt = get(handles.dt_textbox, 'Value');
    if ~isempty(dt)
        dy = sqrt(dt/nuy);
        ymax = get(handles.ymax_textbox, 'Value');
        Jy = get(handles.Jy_textbox, 'Value');
        if ~isempty(ymax)
            Jy = max([ceil(ymax/dy) 3]);
            dy = ymax/Jy;
            nuy = dt/dy^2;
        elseif ~isempty(Jy)
            ymax = Jy*dy;
        end
        set([handles.ymax_textbox handles.Jy_textbox handles.dy_textbox], ...
            {'Value' 'String'}, ...
            {ymax num2str(ymax,8) ; Jy num2str(Jy,8) ; dy num2str(dy,8)});
    end
    set(handles.nuy_textbox, 'Value', nuy, 'String', num2str(nuy,8));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('nuy must evaluate to a positive real', 'error', 'modal'));
    end
end



%--------------------------------------------------------------------------
%
%  Initial Conditions
%    u0(x) = ________
%    v0(x) = ________
%    [ ] Random perturbations?
%    max perturbation = ________
%    [ ] Set random seed to ________
%
%--------------------------------------------------------------------------



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

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);



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

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);



% --- Executes on button press in maxperturbation_checkbox.
function maxperturbation_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to maxperturbation_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of maxperturbation_checkbox

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

if get(hObject,'Value') == get(hObject,'Min')
    set(handles.maxperturbation_textbox, 'Enable', 'off');
else
    set(handles.maxperturbation_textbox, 'Enable', 'on');
end



% --- Executes during object creation, after setting all properties.
function maxperturbation_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxperturbation_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function maxperturbation_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to maxperturbation_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxperturbation_textbox as text
%        str2double(get(hObject,'String')) returns contents of maxperturbation_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('maxperturbation', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('maxperturbation must evaluate to a positive real', 'error', 'modal'));
    end
end



% --- Executes on button press in randomseed_checkbox.
function randomseed_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to randomseed_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of randomseed_checkbox

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

if get(hObject,'Value') == get(hObject,'Min')
    set(handles.randomseed_textbox, 'Enable', 'off');
else
    set(handles.randomseed_textbox, 'Enable', 'on');
end



% --- Executes during object creation, after setting all properties.
function randomseed_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to randomseed_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function randomseed_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to randomseed_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of randomseed_textbox as text
%        str2double(get(hObject,'String')) returns contents of randomseed_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('randomseed', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('randomseed must evaluate to an integer', 'error', 'modal'));
    end
end



%--------------------------------------------------------------------------
%
%  Boundary Conditions
%    ( ) u(0,y,t) = 0     ( ) ux(0,y,t) = 0
%    ( ) u(xmax,y,t) = 0  ( ) ux(xmax,y,t) = 0
%    ( ) u(0,y,t) = u(xmax,y,t)
%    ( ) u(x,0,t) = 0     ( ) uy(x,0,t) = 0
%    ( ) u(x,ymax,t) = 0  ( ) uy(x,ymax,t) = 0
%    ( ) u(x,0,t) = u(x,ymax,t)
%    ( ) v(0,y,t) = 0     ( ) vx(0,y,t) = 0
%    ( ) v(xmax,y,t) = 0  ( ) vx(xmax,y,t) = 0
%    ( ) v(0,y,t) = v(xmax,y,t)
%    ( ) v(x,0,t) = 0     ( ) vy(x,0,t) = 0
%    ( ) v(x,ymax,t) = 0  ( ) vy(x,ymax,t) = 0
%    ( ) v(x,0,t) = v(x,ymax,t)
%
%--------------------------------------------------------------------------



% --- Executes on button press in u0yt_radiobutton.
function u0yt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to u0yt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of u0yt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u0yt_radiobutton, 'Value', get(handles.u0yt_radiobutton, 'Max'));
set(handles.ux0yt_radiobutton, 'Value', get(handles.ux0yt_radiobutton, 'Min'));
if get(handles.u0ytuxmaxyt_radiobutton, 'Value') == get(handles.u0ytuxmaxyt_radiobutton, 'Max')
    set(handles.uxmaxyt_radiobutton, 'Value', get(handles.uxmaxyt_radiobutton, 'Max'));
end
set(handles.u0ytuxmaxyt_radiobutton, 'Value', get(handles.u0ytuxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in ux0yt_radiobutton.
function ux0yt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to ux0yt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ux0yt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u0yt_radiobutton, 'Value', get(handles.u0yt_radiobutton, 'Min'));
set(handles.ux0yt_radiobutton, 'Value', get(handles.ux0yt_radiobutton, 'Max'));
if get(handles.u0ytuxmaxyt_radiobutton, 'Value') == get(handles.u0ytuxmaxyt_radiobutton, 'Max')
    set(handles.uxxmaxyt_radiobutton, 'Value', get(handles.uxxmaxyt_radiobutton, 'Max'));
end
set(handles.u0ytuxmaxyt_radiobutton, 'Value', get(handles.u0ytuxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in uxmaxyt_radiobutton.
function uxmaxyt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to uxmaxyt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of uxmaxyt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.uxmaxyt_radiobutton, 'Value', get(handles.uxmaxyt_radiobutton, 'Max'));
set(handles.uxxmaxyt_radiobutton, 'Value', get(handles.uxxmaxyt_radiobutton, 'Min'));
if get(handles.u0ytuxmaxyt_radiobutton, 'Value') == get(handles.u0ytuxmaxyt_radiobutton, 'Max')
    set(handles.u0yt_radiobutton, 'Value', get(handles.u0yt_radiobutton, 'Max'));
end
set(handles.u0ytuxmaxyt_radiobutton, 'Value', get(handles.u0ytuxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in uxxmaxyt_radiobutton.
function uxxmaxyt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to uxxmaxyt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of uxxmaxyt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.uxmaxyt_radiobutton, 'Value', get(handles.uxmaxyt_radiobutton, 'Min'));
set(handles.uxxmaxyt_radiobutton, 'Value', get(handles.uxxmaxyt_radiobutton, 'Max'));
if get(handles.u0ytuxmaxyt_radiobutton, 'Value') == get(handles.u0ytuxmaxyt_radiobutton, 'Max')
    set(handles.ux0yt_radiobutton, 'Value', get(handles.ux0yt_radiobutton, 'Max'));
end
set(handles.u0ytuxmaxyt_radiobutton, 'Value', get(handles.u0ytuxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in u0ytuxmaxyt_radiobutton.
function u0ytuxmaxyt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to u0ytuxmaxyt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of u0ytuxmaxyt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u0ytuxmaxyt_radiobutton, 'Value', get(handles.u0ytuxmaxyt_radiobutton, 'Max'));
set(handles.u0yt_radiobutton, 'Value', get(handles.u0yt_radiobutton, 'Min'));
set(handles.ux0yt_radiobutton, 'Value', get(handles.ux0yt_radiobutton, 'Min'));
set(handles.uxmaxyt_radiobutton, 'Value', get(handles.uxmaxyt_radiobutton, 'Min'));
set(handles.uxxmaxyt_radiobutton, 'Value', get(handles.uxxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in ux0t_radiobutton.
function ux0t_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to ux0t_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ux0t_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.ux0t_radiobutton, 'Value', get(handles.ux0t_radiobutton, 'Max'));
set(handles.uyx0t_radiobutton, 'Value', get(handles.uyx0t_radiobutton, 'Min'));
if get(handles.ux0tuxymaxt_radiobutton, 'Value') == get(handles.ux0tuxymaxt_radiobutton, 'Max')
    set(handles.uxymaxt_radiobutton, 'Value', get(handles.uxymaxt_radiobutton, 'Max'));
end
set(handles.ux0tuxymaxt_radiobutton, 'Value', get(handles.u0ytuxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in uyx0t_radiobutton.
function uyx0t_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to uyx0t_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of uyx0t_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.ux0t_radiobutton, 'Value', get(handles.ux0t_radiobutton, 'Min'));
set(handles.uyx0t_radiobutton, 'Value', get(handles.uyx0t_radiobutton, 'Max'));
if get(handles.ux0tuxymaxt_radiobutton, 'Value') == get(handles.ux0tuxymaxt_radiobutton, 'Max')
    set(handles.uyxymaxt_radiobutton, 'Value', get(handles.uyxymaxt_radiobutton, 'Max'));
end
set(handles.ux0tuxymaxt_radiobutton, 'Value', get(handles.u0ytuxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in uxymaxt_radiobutton.
function uxymaxt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to uxymaxt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of uxymaxt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.uxymaxt_radiobutton, 'Value', get(handles.uxymaxt_radiobutton, 'Max'));
set(handles.uyxymaxt_radiobutton, 'Value', get(handles.uyxymaxt_radiobutton, 'Min'));
if get(handles.ux0tuxymaxt_radiobutton, 'Value') == get(handles.ux0tuxymaxt_radiobutton, 'Max')
    set(handles.ux0t_radiobutton, 'Value', get(handles.ux0t_radiobutton, 'Max'));
end
set(handles.ux0tuxymaxt_radiobutton, 'Value', get(handles.u0ytuxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in uyxymaxt_radiobutton.
function uyxymaxt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to uyxymaxt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of uyxymaxt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.uxymaxt_radiobutton, 'Value', get(handles.uxymaxt_radiobutton, 'Min'));
set(handles.uyxymaxt_radiobutton, 'Value', get(handles.uyxymaxt_radiobutton, 'Max'));
if get(handles.ux0tuxymaxt_radiobutton, 'Value') == get(handles.ux0tuxymaxt_radiobutton, 'Max')
    set(handles.uyx0t_radiobutton, 'Value', get(handles.uyx0t_radiobutton, 'Max'));
end
set(handles.ux0tuxymaxt_radiobutton, 'Value', get(handles.u0ytuxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in ux0tuxymaxt_radiobutton.
function ux0tuxymaxt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to ux0tuxymaxt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ux0tuxymaxt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.ux0tuxymaxt_radiobutton, 'Value', get(handles.u0ytuxmaxyt_radiobutton, 'Max'));
set(handles.ux0t_radiobutton, 'Value', get(handles.ux0t_radiobutton, 'Min'));
set(handles.uyx0t_radiobutton, 'Value', get(handles.uyx0t_radiobutton, 'Min'));
set(handles.uxymaxt_radiobutton, 'Value', get(handles.uxymaxt_radiobutton, 'Min'));
set(handles.uyxymaxt_radiobutton, 'Value', get(handles.uyxymaxt_radiobutton, 'Min'));



% --- Executes on button press in v0yt_radiobutton.
function v0yt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to v0yt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of v0yt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v0yt_radiobutton, 'Value', get(handles.v0yt_radiobutton, 'Max'));
set(handles.vx0yt_radiobutton, 'Value', get(handles.vx0yt_radiobutton, 'Min'));
if get(handles.v0ytvxmaxyt_radiobutton, 'Value') == get(handles.v0ytvxmaxyt_radiobutton, 'Max')
    set(handles.vxmaxyt_radiobutton, 'Value', get(handles.vxmaxyt_radiobutton, 'Max'));
end
set(handles.v0ytvxmaxyt_radiobutton, 'Value', get(handles.v0ytvxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in vx0yt_radiobutton.
function vx0yt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to vx0yt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vx0yt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v0yt_radiobutton, 'Value', get(handles.v0yt_radiobutton, 'Min'));
set(handles.vx0yt_radiobutton, 'Value', get(handles.vx0yt_radiobutton, 'Max'));
if get(handles.v0ytvxmaxyt_radiobutton, 'Value') == get(handles.v0ytvxmaxyt_radiobutton, 'Max')
    set(handles.vxxmaxyt_radiobutton, 'Value', get(handles.vxxmaxyt_radiobutton, 'Max'));
end
set(handles.v0ytvxmaxyt_radiobutton, 'Value', get(handles.v0ytvxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in vxmaxyt_radiobutton.
function vxmaxyt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to vxmaxyt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vxmaxyt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.vxmaxyt_radiobutton, 'Value', get(handles.vxmaxyt_radiobutton, 'Max'));
set(handles.vxxmaxyt_radiobutton, 'Value', get(handles.vxxmaxyt_radiobutton, 'Min'));
if get(handles.v0ytvxmaxyt_radiobutton, 'Value') == get(handles.v0ytvxmaxyt_radiobutton, 'Max')
    set(handles.v0yt_radiobutton, 'Value', get(handles.v0yt_radiobutton, 'Max'));
end
set(handles.v0ytvxmaxyt_radiobutton, 'Value', get(handles.v0ytvxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in vxxmaxyt_radiobutton.
function vxxmaxyt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to vxxmaxyt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vxxmaxyt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.vxmaxyt_radiobutton, 'Value', get(handles.vxmaxyt_radiobutton, 'Min'));
set(handles.vxxmaxyt_radiobutton, 'Value', get(handles.vxxmaxyt_radiobutton, 'Max'));
if get(handles.v0ytvxmaxyt_radiobutton, 'Value') == get(handles.v0ytvxmaxyt_radiobutton, 'Max')
    set(handles.vx0yt_radiobutton, 'Value', get(handles.vx0yt_radiobutton, 'Max'));
end
set(handles.v0ytvxmaxyt_radiobutton, 'Value', get(handles.v0ytvxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in v0ytvxmaxyt_radiobutton.
function v0ytvxmaxyt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to v0ytvxmaxyt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of v0ytvxmaxyt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v0ytvxmaxyt_radiobutton, 'Value', get(handles.v0ytvxmaxyt_radiobutton, 'Max'));
set(handles.v0yt_radiobutton, 'Value', get(handles.v0yt_radiobutton, 'Min'));
set(handles.vx0yt_radiobutton, 'Value', get(handles.vx0yt_radiobutton, 'Min'));
set(handles.vxmaxyt_radiobutton, 'Value', get(handles.vxmaxyt_radiobutton, 'Min'));
set(handles.vxxmaxyt_radiobutton, 'Value', get(handles.vxxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in vx0t_radiobutton.
function vx0t_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to vx0t_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vx0t_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.vx0t_radiobutton, 'Value', get(handles.vx0t_radiobutton, 'Max'));
set(handles.vyx0t_radiobutton, 'Value', get(handles.vyx0t_radiobutton, 'Min'));
if get(handles.vx0tvxymaxt_radiobutton, 'Value') == get(handles.vx0tvxymaxt_radiobutton, 'Max')
    set(handles.vxymaxt_radiobutton, 'Value', get(handles.vxymaxt_radiobutton, 'Max'));
end
set(handles.vx0tvxymaxt_radiobutton, 'Value', get(handles.v0ytvxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in vyx0t_radiobutton.
function vyx0t_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to vyx0t_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vyx0t_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.vx0t_radiobutton, 'Value', get(handles.vx0t_radiobutton, 'Min'));
set(handles.vyx0t_radiobutton, 'Value', get(handles.vyx0t_radiobutton, 'Max'));
if get(handles.vx0tvxymaxt_radiobutton, 'Value') == get(handles.vx0tvxymaxt_radiobutton, 'Max')
    set(handles.vyxymaxt_radiobutton, 'Value', get(handles.vyxymaxt_radiobutton, 'Max'));
end
set(handles.vx0tvxymaxt_radiobutton, 'Value', get(handles.v0ytvxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in vxymaxt_radiobutton.
function vxymaxt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to vxymaxt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vxymaxt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.vxymaxt_radiobutton, 'Value', get(handles.vxymaxt_radiobutton, 'Max'));
set(handles.vyxymaxt_radiobutton, 'Value', get(handles.vyxymaxt_radiobutton, 'Min'));
if get(handles.vx0tvxymaxt_radiobutton, 'Value') == get(handles.vx0tvxymaxt_radiobutton, 'Max')
    set(handles.vx0t_radiobutton, 'Value', get(handles.vx0t_radiobutton, 'Max'));
end
set(handles.vx0tvxymaxt_radiobutton, 'Value', get(handles.v0ytvxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in vyxymaxt_radiobutton.
function vyxymaxt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to vyxymaxt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vyxymaxt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.vxymaxt_radiobutton, 'Value', get(handles.vxymaxt_radiobutton, 'Min'));
set(handles.vyxymaxt_radiobutton, 'Value', get(handles.vyxymaxt_radiobutton, 'Max'));
if get(handles.vx0tvxymaxt_radiobutton, 'Value') == get(handles.vx0tvxymaxt_radiobutton, 'Max')
    set(handles.vyx0t_radiobutton, 'Value', get(handles.vyx0t_radiobutton, 'Max'));
end
set(handles.vx0tvxymaxt_radiobutton, 'Value', get(handles.v0ytvxmaxyt_radiobutton, 'Min'));



% --- Executes on button press in vx0tvxymaxt_radiobutton.
function vx0tvxymaxt_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to vx0tvxymaxt_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vx0tvxymaxt_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.vx0tvxymaxt_radiobutton, 'Value', get(handles.v0ytvxmaxyt_radiobutton, 'Max'));
set(handles.vx0t_radiobutton, 'Value', get(handles.vx0t_radiobutton, 'Min'));
set(handles.vyx0t_radiobutton, 'Value', get(handles.vyx0t_radiobutton, 'Min'));
set(handles.vxymaxt_radiobutton, 'Value', get(handles.vxymaxt_radiobutton, 'Min'));
set(handles.vyxymaxt_radiobutton, 'Value', get(handles.vyxymaxt_radiobutton, 'Min'));



%--------------------------------------------------------------------------
%
%  Plotting
%    [ ] Run for at most ________ steps
%    [ ] Run until max change < ________
%    Display/save every ________ th step
%    ( ) Fixed axis, z = ________
%    ( ) Fit plot     to ________
%    Azimuth angle   = ________
%    Elevation angle = ________
%    [ ] u threshold = ________
%    [ ] v threshold = ________
%    Status: ________
%
%--------------------------------------------------------------------------



% --- Executes on button press in nsteps_checkbox.
function nsteps_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to nsteps_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of nsteps_checkbox

if get(hObject, 'Value') == get(hObject, 'Min')
    set(handles.nsteps_textbox, 'Enable', 'off');
else
    set(handles.nsteps_textbox, 'Enable', 'on');
end



% --- Executes during object creation, after setting all properties.
function nsteps_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nsteps_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function nsteps_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to nsteps_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nsteps_textbox as text
%        str2double(get(hObject,'String')) returns contents of nsteps_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('nsteps', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('nsteps must evaluate to a nonnegative integer', 'error', 'modal'));
    end
end
    


% --- Executes on button press in maxchange_checkbox.
function maxchange_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to maxchange_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of maxchange_checkbox

if get(hObject, 'Value') == get(hObject, 'Min')
    set(handles.maxchange_textbox, 'Enable', 'off');
else
    set(handles.maxchange_textbox, 'Enable', 'on');
end



% --- Executes during object creation, after setting all properties.
function maxchange_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxchange_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function maxchange_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to maxchange_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxchange_textbox as text
%        str2double(get(hObject,'String')) returns contents of maxchange_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('maxchange', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('maxchange must be a positive real', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function displaystep_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to displaystep_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function displaystep_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to displaystep_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of displaystep_textbox as text
%        str2double(get(hObject,'String')) returns contents of displaystep_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('displaystep', string)
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('displaystep must evaluate to a positive integer', 'error', 'modal'));
    end
end



% --- Executes on button press in zlimits_radiobutton.
function zlimits_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to zlimits_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of zlimits_radiobutton

set(handles.zlimits_radiobutton, 'Value', get(handles.zlimits_radiobutton, 'Max'));
set(handles.fitplot_radiobutton, 'Value', get(handles.fitplot_radiobutton, 'Min'));
set([handles.zmin_textbox handles.zmax_textbox], 'Enable', 'on');
refreshframe;



% --- Executes during object creation, after setting all properties.
function zmin_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zmin_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function zmin_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to zmin_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zmin_textbox as text
%        str2double(get(hObject,'String')) returns contents of zmin_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('zmin', string)
    zmin = str2num(string);
    set(hObject, 'Value', zmin);
    zmax = get(handles.zmax_textbox, 'Value');
    if ~isempty(zmax) && zmax <= zmin
        set(handles.zmax_textbox, 'Value', [], 'String', '');
        uiwait(errordlg('zmin must be strictly less than zmax', 'error', 'modal'));
    end
    refreshframe;
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('zmin must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function zmax_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zmax_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function zmax_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to zmax_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zmax_textbox as text
%        str2double(get(hObject,'String')) returns contents of zmax_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('zmax', string)
    zmax = str2num(string);
    set(hObject, 'Value', zmax);
    zmin = get(handles.zmin_textbox, 'Value');
    if ~isempty(zmin) && zmax <= zmin
        set(handles.zmin_textbox, 'Value', [], 'String', '');
        uiwait(errordlg('zmin must be strictly less than zmax', 'error', 'modal'));
    end
    refreshframe;
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('zmax must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



% --- Executes on button press in fitplot_radiobutton.
function fitplot_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to fitplot_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fitplot_radiobutton

set(handles.zlimits_radiobutton, 'Value', get(handles.zlimits_radiobutton, 'Min'));
set(handles.fitplot_radiobutton, 'Value', get(handles.fitplot_radiobutton, 'Max'));
set([handles.zmin_textbox handles.zmax_textbox], 'Enable', 'off');
refreshframe;



% --- Executes during object creation, after setting all properties.
function azimuthangle_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to azimuthangle_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function azimuthangle_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to azimuthangle_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of azimuthangle_textbox as text
%        str2double(get(hObject,'String')) returns contents of azimuthangle_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('azimuthangle', string)
    set(hObject, 'Value', str2num(string));
    refreshframe;
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('azimuthangle must evaluate to a real', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function elevationangle_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to elevationangle_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function elevationangle_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to elevationangle_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of elevationangle_textbox as text
%        str2double(get(hObject,'String')) returns contents of elevationangle_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('elevationangle', string)
    set(hObject, 'Value', str2num(string));
    refreshframe;
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('elevationangle must evaluate to a real', 'error', 'modal'));
    end
end



% --- Executes on button press in uthreshold_checkbox.
function uthreshold_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to uthreshold_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of uthreshold_checkbox

if get(hObject, 'Value') == get(hObject, 'Min')
    set(handles.uthreshold_textbox, 'Enable', 'off');
else
    set(handles.uthreshold_textbox, 'Enable', 'on');
end
refreshframe;



% --- Executes during object creation, after setting all properties.
function uthreshold_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uthreshold_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function uthreshold_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to uthreshold_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of uthreshold_textbox as text
%        str2double(get(hObject,'String')) returns contents of uthreshold_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('uthreshold', string)
    set(hObject, 'Value', str2num(string));
    refreshframe;
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('uthreshold must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



% --- Executes on button press in vthreshold_checkbox.
function vthreshold_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to vthreshold_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vthreshold_checkbox

if get(hObject, 'Value') == get(hObject, 'Min')
    set(handles.vthreshold_textbox, 'Enable', 'off');
else
    set(handles.vthreshold_textbox, 'Enable', 'on');
end
refreshframe;



% --- Executes during object creation, after setting all properties.
function vthreshold_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vthreshold_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function vthreshold_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to vthreshold_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vthreshold_textbox as text
%        str2double(get(hObject,'String')) returns contents of vthreshold_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('vthreshold', string)
    set(hObject, 'Value', str2num(string));
    refreshframe;
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('vthreshold must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function status_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to status_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function status_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to status_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of status_textbox as text
%        str2double(get(hObject,'String')) returns contents of status_textbox as a double



%--------------------------------------------------------------------------
%
%  Simulation
%    [ Build ] [ Hold ]
%    << |< |> || >| >>
%    |<=[ ]======>|
%    Step ________, Time ________
%
%--------------------------------------------------------------------------



% --- Executes on button press in build_pushbutton.
function build_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to build_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');


% get all parameter variables and corresponding value variables

params = {'param1' 'param2' 'param3' 'param4' 'param5'};
values = {'value1' 'value2' 'value3' 'value4' 'value5'};
for i = 1:length(params)
    s = params{i};
    t = values{i};
    eval([s ' = get(handles.' s '_textbox, ''String'');']);
    eval([t ' = get(handles.' t '_textbox, ''Value'');']);
    eval(['data.' s ' = ' s ';']);
    eval(['data.' t ' = ' t ';']);
end


% substitute all parameter variables in each string variable

vars = {'f' 'g' 'u0' 'v0'};
for i = 1:length(vars)
    s = vars{i};
    eval([s ' = get(handles.' s '_textbox, ''String'');']);
    eval(['data.' s ' = ' s ';']);
    for j = 1:length(params)
        p = eval(params{j});
        v = eval(values{j});
        if ~isempty(p) && ~isempty(v)
            eval([s '= regexprep(' s ', ''\<' p '\>'', [''('' num2str(v,15) '')'']);']);
        end
    end
end


% get the values of all required numeric variables

vars = {'gamma_' 'd' 'xmax' 'Jx' 'dx' 'ymax' ...
        'Jy' 'dy' 'dt' 'nux' 'nuy' 'displaystep'};
for i = 1:length(vars)
    s = vars{i};
    eval([s ' = get(handles.' s '_textbox, ''Value'');']);
    if isempty(eval(s))
        uiwait(errordlg([s ' must be specified'], 'error', 'modal'));
        return;
    end
    eval(['data.' s ' = ' s ';']);
end


% get the status of all radiobuttons

vars = {'u0yt' 'ux0yt' 'uxmaxyt' 'uxxmaxyt' 'u0ytuxmaxyt' ...
        'ux0t' 'uyx0t' 'uxymaxt' 'uyxymaxt' 'ux0tuxymaxt' ...
        'v0yt' 'vx0yt' 'vxmaxyt' 'vxxmaxyt' 'v0ytvxmaxyt' ...
        'vx0t' 'vyx0t' 'vxymaxt' 'vyxymaxt' 'vx0tvxymaxt'};
for i = 1:length(vars)
    s = vars{i};
    eval([s '_flag = get(handles.' s '_radiobutton, ''Value'') == get(handles.' s '_radiobutton, ''Max'');']);
    eval(['data.' s '_flag = ' s '_flag;']);
end


% get the status of all checkboxes

vars = {'maxperturbation' 'randomseed' 'nsteps' 'maxchange'};
for i = 1:length(vars)
    s = vars{i};
    eval([s '_flag = get(handles.' s '_checkbox, ''Value'') == get(handles.' s '_checkbox, ''Max'');']);
    eval(['data.' s '_flag = ' s '_flag;']);
end


% get the values of all optional parameters

vars = {'maxperturbation' 'randomseed' 'nsteps' 'maxchange'};
for i = 1:length(vars)
    s = vars{i};
    eval([s ' = get(handles.' s '_textbox, ''Value'');']);
    if eval([s '_flag']) && isempty(eval(s))
        uiwait(errordlg([s ' must be specified'], 'error', 'modal'));
        return;
    end
    eval(['data.' s ' = ' s ';']);
end


% initialize simulation

set(handles.status_textbox, 'String', 'Initializing simulation...');
drawnow;

if data.buildnew
    [x y] = meshgrid(0:dx:xmax, 0:dy:ymax);

    if isequal(get(handles.solveforinitialconditions_menu, 'Checked'), 'on')
        try
            [u v] = solve([f ' = 0'], [g ' = 0'], 'u', 'v');
            u = eval(u);
            v = eval(v);
            for i = 1:length(u)
                if imag(u(i)) ~= 0 || imag(v(i)) ~= 0
                    u = [u(1:i-1) ; u(i+1:end)];
                    v = [v(1:i-1) ; v(i+1:end)];
                end
            end
            while length(u) > 1 && (u(1) < 0 || v(1) < 0)
                u = u(2:end);
                v = v(2:end);
            end
            disp(['u0 = ' num2str(u,8)]);
            disp(['v0 = ' num2str(v,8)]);
            u = repmat(u(1), [Jy+1 Jx+1]);
            v = repmat(v(1), [Jy+1 Jx+1]);
        catch
            uiwait(errordlg({'error solving for initial conditions' ...
                    'unable to begin build'}, 'error', 'modal'));
            set(handles.status_textbox, 'String', 'Ready');
            return;
        end
    else
        try
            try
                u = eval(vectorize(u0));
                if ~isequal(size(u), [Jy+1 Jx+1])
                    u = u(imag(u) == 0);
                    if length(u) > 1
                        u = u(u >= 0);
                    end
                    u = repmat(u(1), [Jy+1 Jx+1]);
                end
            catch
                error(['error evaluating u0 = ' u0]);
            end
            try
                v = eval(vectorize(v0));
                if ~isequal(size(v), [Jy+1 Jx+1])
                    v = v(imag(v) == 0);
                    if length(v) > 1
                        v = v(v >= 0);
                    end
                    v = repmat(v(1), [Jy+1 Jx+1]);
                end
            catch
                error(['error evaluating v0 = ' v0]);
            end
        catch
            uiwait(errordlg({regexprep(lasterr, ['^(.*)\' char(10)], '') ...
                    'unable to begin build'}, 'error', 'modal'));
            set(handles.status_textbox, 'String', 'Ready');
            return;
        end
    end
    
    data.U0 = u;
    data.V0 = v;
    
    if maxperturbation_flag
        if randomseed_flag
            rand('state', randomseed);
        else
            rand('state', sum(100*clock));
        end
        u = u + maxperturbation*(2*rand([Jy+1 Jx+1]) - 1);
        v = v + maxperturbation*(2*rand([Jy+1 Jx+1]) - 1);
    end
    
    data.x = x;
    data.y = y;
    data.U = [];
    data.U(1,:,:) = u;
    data.V = [];
    data.V(1,:,:) = v;
    step = 0;
    
else
    x = data.x;
    y = data.y;
    u = squeeze(data.U(end,:,:));
    v = squeeze(data.V(end,:,:));
    step = (length(data.U(:,1,1)) - 1)*displaystep;
end

if ~nsteps_flag
    nsteps = inf;
end


% disable components

set([handles.build_pushbutton handles.rebuild_pushbutton handles.file_menu], 'Enable', 'off');
disablemovie;

set([handles.pause_pushbutton handles.hold_pushbutton], 'Value', 0.0);

data.buildnew = false;
setappdata(gcbf, 'data', data);


% run simulation

tic;

axes(handles.axes);
plotuv(step/displaystep);
plotcolorbar;

set(handles.hold_pushbutton, 'Enable', 'Inactive');


f = vectorize(f);
g = vectorize(g);

Z = zeros([Jy+1 Jx+1]);

du = Z;
dv = Z;
ex = Z(1,:);
ey = Z(:,1);
ff = Z;
gx = Z(1,:);
gy = Z(:,1);
fu = Z;
gv = Z;
lu = Z;
lv = Z;
uu = Z;
vv = Z;


vars = {'cnlf' 'sbdfcn2'};
for i = 1:length(vars)
    eval([vars{i} '_flag = isequal(get(handles.' vars{i} '_numericalscheme_menu, ''Checked''), ''on'');']);
end
vars = {'order1reactionterm' 'order2reactionterm' 'order2diffusionterm' 'order3diffusionterm'};
for i = 1:length(vars)
    if cnlf_flag || sbdfcn2_flag
        eval([vars{i} '_flag = false;']);
    else
        eval([vars{i} '_flag = isequal(get(handles.' vars{i} '_numericalscheme_menu, ''Checked''), ''on'');']);
    end
end
    

w1 = [0 -1 1];
w2 = [0 1];
w3 = [0 1/2 1/2];

if order1reactionterm_flag && order2diffusionterm_flag
    stepsize = 1;
else
    stepsize = 2^-4;
end


try
        
    while step < nsteps && get(handles.hold_pushbutton, 'Value') == 0.0
        
        set(handles.status_textbox, 'String', ['Calculating step ' int2str(step+1) '...']);
        drawnow;
        
        
        du = 1/2*stepsize*w3(1)*lu;
        for i = 2:Jy
            lu(i,:) = u(i-1,:) - 2*u(i,:) + u(i+1,:);
        end
        lu(1,:) = (ux0tuxymaxt_flag*u(Jy+1,:) + uyx0t_flag*u(2,:)) - 2*u(1,:) + u(2,:);
        lu(Jy+1,:) = u(Jy,:) - 2*u(Jy+1,:) + (ux0tuxymaxt_flag*u(1,:) + uyxymaxt_flag*u(Jy,:));
        lu = 2*nuy*lu;
        if w1(1) ~= 0
            du = du - w1(1)*uu;
        end
        du = du - w1(2)*u + 1/2*stepsize*w3(2)*lu;
        if cnlf_flag || sbdfcn2_flag
            uu = u;
        end
        if w2(1) ~= 0
            du = du + 1/2*stepsize*dt*gamma_*w2(1)*fu;
        end
        try
            fu = eval(f);
        catch
            error(['error evaluating f = ' f ' at step ' num2str(step,8)]);
        end
        du = du + 1/2*stepsize*dt*gamma_*w2(2)*fu;
        if stepsize < 1 && mod(step,1) == 0
            lu_initial = lu;
            fu_initial = fu;
            uu_initial = uu;
        end
        du(1,:) = ~ux0t_flag*du(1,:);
        du(Jy+1,:) = ~uxymaxt_flag*du(Jy+1,:);
        du(:,1) = ~u0yt_flag*du(:,1);
        du(:,Jx+1) = ~uxmaxyt_flag*du(:,Jx+1);
        
        
        dv = 1/2*stepsize*w3(1)*lv;
        for i = 2:Jy
            lv(i,:) = v(i-1,:) - 2*v(i,:) + v(i+1,:);
        end
        lv(1,:) = (vx0tvxymaxt_flag*v(Jy+1,:) + vyx0t_flag*v(2,:)) - 2*v(1,:) + v(2,:);
        lv(Jy+1,:) = v(Jy,:) - 2*v(Jy+1,:) + (vx0tvxymaxt_flag*v(1,:) + vyxymaxt_flag*v(Jy,:));
        lv = 2*d*nuy*lv;
        if w1(1) ~= 0
            dv = dv - w1(1)*vv;
        end
        dv = dv - w1(2)*v + 1/2*stepsize*w3(2)*lv;
        if cnlf_flag || sbdfcn2_flag
            vv = v;
        end
        if w2(1) ~= 0
            dv = dv + 1/2*stepsize*dt*gamma_*w2(1)*gv;
        end
        try
            gv = eval(g);
        catch
            error(['error evaluating g = ' g ' at step ' num2str(step,8)]);
        end
        dv = dv + 1/2*stepsize*dt*gamma_*w2(2)*gv;
        if stepsize < 1 && mod(step,1) == 0
            lv_initial = lv;
            gv_initial = gv;
            vv_initial = vv;
        end
        dv(1,:) = ~vx0t_flag*dv(1,:);
        dv(Jy+1,:) = ~vxymaxt_flag*dv(Jy+1,:);
        dv(:,1) = ~v0yt_flag*dv(:,1);
        dv(:,Jx+1) = ~vxmaxyt_flag*dv(:,Jx+1);
        
        
        a = w3(3)*stepsize*nux;
        b = w1(3) + w3(3)*stepsize*2*nux;
        c = w3(3)*stepsize*nux;
        a1 = u0ytuxmaxyt_flag*a;
        b1 = u0yt_flag + ~u0yt_flag*b;
        c1 = ~u0yt_flag*c + ux0yt_flag*a;
        aJ1 = ~uxmaxyt_flag*a + uxxmaxyt_flag*c;
        bJ1 = uxmaxyt_flag + ~uxmaxyt_flag*b;
        cJ1 = u0ytuxmaxyt_flag*c;
        
        ex(1) = c1/b1;
        ff(:,1) = du(:,1)/b1;
        gx(1) = a1/b1;
        h = cJ1;
        m = h*gx(1);
        n = h*ff(:,1);
        for j = 2:Jx-1
            k = 1/(b - a*ex(j-1));
            ex(j) = c*k;
            ff(:,j) = (du(:,j) + a*ff(:,j-1))*k;
            gx(j) = a*gx(j-1)*k;
            h = ex(j-1)*h;
            m = m + h*gx(j);
            n = n + h*ff(:,j);
        end
        k = 1/(b - a*ex(Jx-1));
        ex(Jx) = 0;
        ff(:,Jx) = (du(:,Jx) + a*ff(:,Jx-1))*k;
        gx(Jx) = (a*gx(Jx-1) + c)*k;
        h = ex(Jx-1)*h + aJ1;
        m = m + h*gx(Jx);
        n = n + h*ff(:,Jx);
        u(:,Jx+1) = (du(:,Jx+1) + n)/(bJ1 - m);
        for j = Jx:-1:1
            u(:,j) = ff(:,j) + ex(j)*u(:,j+1) + gx(j)*u(:,Jx+1);
        end
        
        
        a = w3(3)*stepsize*d*nux;
        b = w1(3) + w3(3)*stepsize*d*2*nux;
        c = w3(3)*stepsize*d*nux;
        a1 = v0ytvxmaxyt_flag*a;
        b1 = v0yt_flag + ~v0yt_flag*b;
        c1 = ~v0yt_flag*c + vx0yt_flag*a;
        aJ1 = ~vxmaxyt_flag*a + vxxmaxyt_flag*c;
        bJ1 = vxmaxyt_flag + ~vxmaxyt_flag*b;
        cJ1 = v0ytvxmaxyt_flag*c;
        
        ex(1) = c1/b1;
        ff(:,1) = dv(:,1)/b1;
        gx(1) = a1/b1;
        h = cJ1;
        m = h*gx(1);
        n = h*ff(:,1);
        for j = 2:Jx-1
            k = 1/(b - a*ex(j-1));
            ex(j) = c*k;
            ff(:,j) = (dv(:,j) + a*ff(:,j-1))*k;
            gx(j) = a*gx(j-1)*k;
            h = ex(j-1)*h;
            m = m + h*gx(j);
            n = n + h*ff(:,j);
        end
        k = 1/(b - a*ex(Jx-1));
        ex(Jx) = 0;
        ff(:,Jx) = (dv(:,Jx) + a*ff(:,Jx-1))*k;
        gx(Jx) = (a*gx(Jx-1) + c)*k;
        h = ex(Jx-1)*h + aJ1;
        m = m + h*gx(Jx);
        n = n + h*ff(:,Jx);
        v(:,Jx+1) = (dv(:,Jx+1) + n)/(bJ1 - m);
        for j = Jx:-1:1
            v(:,j) = ff(:,j) + ex(j)*v(:,j+1) + gx(j)*v(:,Jx+1);
        end
        
        
        step = step + 1/2*stepsize;
        
        
        if mod(step,1) == 1/2*stepsize
            if order2reactionterm_flag
                w2 = [-1/2 3/2];
            end
            if order3diffusionterm_flag
                w3 = [1/16 6/16 9/16];
            end
            if cnlf_flag
                w1 = [-1 0 1];
                w3 = [1/2 0 1/2];
            end
            if sbdfcn2_flag
                w1 = [1/2 -4/2 3/2];
                w2 = [-1 2];
            end
        end
        
        
        du = 1/2*stepsize*w3(1)*lu;
        for j = 2:Jx
            lu(:,j) = u(:,j-1) - 2*u(:,j) + u(:,j+1);
        end
        lu(:,1) = (u0ytuxmaxyt_flag*u(:,Jx+1) + ux0yt_flag*u(:,2)) - 2*u(:,1) + u(:,2);
        lu(:,Jx+1) = u(:,Jx) - 2*u(:,Jx+1) + (u0ytuxmaxyt_flag*u(:,1) + uxxmaxyt_flag*u(:,Jx));
        lu = 2*nux*lu;
        if w1(1) ~= 0
            du = du - w1(1)*uu;
        end
        du = du - w1(2)*u + 1/2*stepsize*w3(2)*lu;
        if cnlf_flag || sbdfcn2_flag
            uu = u;
        end
        if w2(1) ~= 0
            du = du + 1/2*stepsize*dt*gamma_*w2(1)*fu;
        end
        try
            fu = eval(f);
        catch
            error(['error evaluating f = ' f ' at step ' num2str(step,8)]);
        end
        du = du + 1/2*stepsize*dt*gamma_*w2(2)*fu;
        du(:,1) = ~u0yt_flag*du(:,1);
        du(:,Jx+1) = ~uxmaxyt_flag*du(:,Jx+1);
        du(1,:) = ~ux0t_flag*du(1,:);
        du(Jy+1,:) = ~uxymaxt_flag*du(Jy+1,:);
        
        
        dv = 1/2*stepsize*w3(1)*lv;
        for j = 2:Jx
            lv(:,j) = v(:,j-1) - 2*v(:,j) + v(:,j+1);
        end
        lv(:,1) = (v0ytvxmaxyt_flag*v(:,Jx+1) + vx0yt_flag*v(:,2)) - 2*v(:,1) + v(:,2);
        lv(:,Jx+1) = v(:,Jx) - 2*v(:,Jx+1) + (v0ytvxmaxyt_flag*v(:,1) + vxxmaxyt_flag*v(:,Jx));
        lv = 2*d*nux*lv;
        if w1(1) ~= 0
            dv = dv - w1(1)*vv;
        end
        dv = dv - w1(2)*v + 1/2*stepsize*w3(2)*lv;
        if cnlf_flag || sbdfcn2_flag
            vv = v;
        end
        if w2(1) ~= 0
            dv = dv + 1/2*stepsize*dt*gamma_*w2(1)*gv;
        end
        try
            gv = eval(g);
        catch
            error(['error evaluating g = ' g ' at step ' num2str(step,8)]);
        end
        dv = dv + 1/2*stepsize*dt*gamma_*w2(2)*gv;
        dv(:,1) = ~v0yt_flag*dv(:,1);
        dv(:,Jx+1) = ~vxmaxyt_flag*dv(:,Jx+1);
        dv(1,:) = ~vx0t_flag*dv(1,:);
        dv(Jy+1,:) = ~vxymaxt_flag*dv(Jy+1,:);
        
        
        a = w3(3)*stepsize*nuy;
        b = w1(3) + w3(3)*stepsize*2*nuy;
        c = w3(3)*stepsize*nuy;
        a1 = ux0tuxymaxt_flag*a;
        b1 = ux0t_flag + ~ux0t_flag*b;
        c1 = ~ux0t_flag*c + uyx0t_flag*a;
        aJ1 = ~uxymaxt_flag*a + uyxymaxt_flag*c;
        bJ1 = uxymaxt_flag + ~uxymaxt_flag*b;
        cJ1 = ux0tuxymaxt_flag*c;
        
        ey(1) = c1/b1;
        ff(1,:) = du(1,:)/b1;
        gy(1) = a1/b1;
        h = cJ1;
        m = h*gy(1);
        n = h*ff(1,:);
        for i = 2:Jy-1
            k = 1/(b - a*ey(i-1));
            ey(i) = c*k;
            ff(i,:) = (du(i,:) + a*ff(i-1,:))*k;
            gy(i) = a*gy(i-1)*k;
            h = ey(i-1)*h;
            m = m + h*gy(i);
            n = n + h*ff(i,:);
        end
        k = 1/(b - a*ey(Jy-1));
        ey(Jy) = 0;
        ff(Jy,:) = (du(Jy,:) + a*ff(Jy-1,:))*k;
        gy(Jy) = (a*gy(Jy-1) + c)*k;
        h = ey(Jy-1)*h + aJ1;
        m = m + h*gy(Jy);
        n = n + h*ff(Jy,:);
        u(Jy+1,:) = (du(Jy+1,:) + n)/(bJ1 - m);
        for i = Jy:-1:1
            u(i,:) = ff(i,:) + ey(i)*u(i+1,:) + gy(i)*u(Jy+1,:);
        end
        
        
        a = w3(3)*stepsize*d*nuy;
        b = w1(3) + w3(3)*stepsize*d*2*nuy;
        c = w3(3)*stepsize*d*nuy;
        a1 = vx0tvxymaxt_flag*a;
        b1 = vx0t_flag + ~vx0t_flag*b;
        c1 = ~vx0t_flag*c + vyx0t_flag*a;
        aJ1 = ~vxymaxt_flag*a + vyxymaxt_flag*c;
        bJ1 = vxymaxt_flag + ~vxymaxt_flag*b;
        cJ1 = vx0tvxymaxt_flag*c;
        
        ey(1) = c1/b1;
        ff(1,:) = dv(1,:)/b1;
        gy(1) = a1/b1;
        h = cJ1;
        m = h*gy(1);
        n = h*ff(1,:);
        for i = 2:Jy-1
            k = 1/(b - a*ey(i-1));
            ey(i) = c*k;
            ff(i,:) = (dv(i,:) + a*ff(i-1,:))*k;
            gy(i) = a*gy(i-1)*k;
            h = ey(i-1)*h;
            m = m + h*gy(i);
            n = n + h*ff(i,:);
        end
        k = 1/(b - a*ey(Jy-1));
        ey(Jy) = 0;
        ff(Jy,:) = (dv(Jy,:) + a*ff(Jy-1,:))*k;
        gy(Jy) = (a*gy(Jy-1) + c)*k;
        h = ey(Jy-1)*h + aJ1;
        m = m + h*gy(Jy);
        n = n + h*ff(Jy,:);
        v(Jy+1,:) = (dv(Jy+1,:) + n)/(bJ1 - m);
        for i = Jy:-1:1
            v(i,:) = ff(i,:) + ey(i)*v(i+1,:) + gy(i)*v(Jy+1,:);
        end
        
        
        
        if any(any(isnan(u))) || any(any(isnan(v)))
            error('intermediate calculations produced NaN''s');
        end
        
        
        step = step + 1/2*stepsize;
        if stepsize < 1 && mod(step,1) == 0
            stepsize = 1;
            fu = fu_initial;
            gv = gv_initial;
            lu = lu_initial;
            lv = lv_initial;
            uu = uu_initial;
            vv = vv_initial;
        end
        
        
        if mod(step, displaystep) == 0
            data = getappdata(gcbf, 'data');
            data.U(end+1,:,:) = u;
            data.V(end+1,:,:) = v;
            setappdata(gcbf, 'data', data);
            axes(handles.axes);
            plotuv(step/displaystep);
            plotcolorbar;
            if maxchange_flag && ...
                    max(max(abs(data.U(end,:,:) - data.U(end-1,:,:)))) < maxchange && ...
                    max(max(abs(data.V(end,:,:) - data.V(end-1,:,:)))) < maxchange
                set(handles.hold_pushbutton, 'Value', 1.0);
            end
        end
    end
        
catch
    uiwait(errordlg({regexprep(lasterr, ['^(.*)\' char(10)], '') ...
                     'build terminated'}, 'error', 'modal'));
end


% reinitialize

set(handles.status_textbox, 'String', 'Reinitializing...');
drawnow;

set(handles.hold_pushbutton, 'Enable', 'off');

initializemovie('end');

set([handles.build_pushbutton handles.rebuild_pushbutton handles.file_menu], 'Enable', 'on');

set(handles.status_textbox, 'String', 'Ready');

disp(['elapsed_time = ' num2str(toc,8)]);



% --- Executes on button press in rebuild_pushbutton.
function rebuild_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to rebuild_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

build_pushbutton_Callback(handles.build_pushbutton, eventdata, handles);



% --- Executes on button press in hold_pushbutton.
function hold_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to hold_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over hold_pushbutton.
function hold_pushbutton_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to hold_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(hObject, 'Value', 1.0);



% --- Executes on button press in begin_pushbutton.
function begin_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to begin_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.pause_pushbutton, 'Value', 1.0);
setframe(0);



% --- Executes on button press in previous_pushbutton.
function previous_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to previous_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.pause_pushbutton, 'Value', 1.0);
setframe(get(handles.frame_slider, 'Value') - 1);



% --- Executes on button press in play_pushbutton.
function play_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to play_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.pause_pushbutton, 'Value', 0.0);

max = get(handles.frame_slider, 'Max') + 1;
i = mod(get(handles.frame_slider, 'Value') + 1, max);

while i <= max && get(handles.pause_pushbutton, 'Value') == 0.0
    setframe(i);
    i = i + 1;
end

set(handles.pause_pushbutton, 'Value', 1.0);



% --- Executes on button press in pause_pushbutton.
function pause_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to pause_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pause_pushbutton.
function pause_pushbutton_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pause_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.pause_pushbutton, 'Value', 1.0);



% --- Executes on button press in next_pushbutton.
function next_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to next_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.pause_pushbutton, 'Value', 1.0);
setframe(get(handles.frame_slider, 'Value') + 1);



% --- Executes on button press in end_pushbutton.
function end_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to end_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.pause_pushbutton, 'Value', 1.0);
setframe(get(handles.frame_slider, 'Max'));



% --- Executes during object creation, after setting all properties.
function frame_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frame_slider (see GCBO)
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
function frame_slider_Callback(hObject, eventdata, handles)
% hObject    handle to frame_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.pause_pushbutton, 'Value', 1.0);
setframe(floor(get(handles.frame_slider, 'Value')));



% --- Executes during object creation, after setting all properties.
function step_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function step_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to step_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of step_textbox as text
%        str2double(get(hObject,'String')) returns contents of step_textbox as a double

string = get(hObject, 'String');
if isvalid('step', string)
    set(handles.pause_pushbutton, 'Value', 1.0);
    data = getappdata(gcbf, 'data');
    setframe(min([floor(str2num(string)/data.displaystep) get(handles.frame_slider, 'Max')]));
else
    uiwait(errordlg('step must evaluate to a nonnegative integer', 'error', 'modal'));
    setframe(get(handles.frame_slider, 'Value'));
end



% --- Executes during object creation, after setting all properties.
function time_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function time_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to time_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time_textbox as text
%        str2double(get(hObject,'String')) returns contents of time_textbox as a double

string = get(hObject, 'String');
if isvalid('time', string)
    set(handles.pause_pushbutton, 'Value', 1.0);
    data = getappdata(gcbf, 'data');
    setframe(min([floor(str2num(string)/(data.dt*data.displaystep)) get(handles.frame_slider, 'Max')]));
else
    uiwait(errordlg('time must evaluate to a nonnegative real', 'error', 'modal'));
    setframe(get(handles.frame_slider, 'Value'));
end



%--------------------------------------------------------------------------
%
%  Menu Callbacks
%   |
%   +-- File
%   |    |
%   |    +-- Import Build
%   |    +-- Export Build
%   |    +-- Print Frame
%   |    +-- Load
%   |         |
%   |         +-- Schnakenberg
%   |         +-- 
%
%  *** to be finished later... ***
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
        initializemovie('begin');
    catch
    end
end



% --------------------------------------------------------------------
function exportbuild_menu_Callback(hObject, eventdata, handles)
% hObject    handle to exportbuild_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(hObject, 'Interruptible', 'off');
[filename pathname] = uiputfile('rd2d.mat', 'Save build as...');
if ~isequal(filename, 0)
    set(handles.status_textbox, 'String', 'Exporting data...');
    drawnow;
    data = getappdata(gcbf, 'data');
    save([pathname filename], 'data');
    set(handles.status_textbox, 'String', 'Ready');
    drawnow;
end



% --------------------------------------------------------------------
function exportmovie_menu_Callback(hObject, eventdata, handles)
% hObject    handle to exportmovie_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
if length(size(data.U)) ~= 3
    uiwait(errordlg('a movie must be built before being exported', 'error', 'modal'));
    return;
end

set(hObject, 'Interruptible', 'off');
[filename pathname] = uiputfile('rd2d.avi', 'Save movie as...');
if ~isequal(filename, 0)
    try
        mov = avifile([pathname filename], 'Compression', 'none', 'fps', 4);
    catch
        uiwait(errordlg({['error opening ' pathname filename] 'the file may be in use by another program'}, 'error', 'modal'));
        return;
    end
    h = figure;
    for j = 1:length(data.U(:,1,1))
        figure(h);
        plotuv(j-1);
        set(handles.status_textbox, 'String', ['Capturing frame ' int2str(j-1) '...']);
        drawnow;
        mov = addframe(mov, getframe(h));
    end
    mov = close(mov);
    delete(h);
    set(handles.status_textbox, 'String', 'Ready');
end



% --------------------------------------------------------------------
function exportframe_menu_Callback(hObject, eventdata, handles)
% hObject    handle to exportframe_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

figure;
plotuv(get(handles.frame_slider, 'Value'));



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
function empty_menu_Callback(hObject, eventdata, handles)
% hObject    handle to empty_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    loadbuild('', 'empty.mat');
    disablemovie;
catch
end



% --------------------------------------------------------------------
function default_menu_Callback(hObject, eventdata, handles)
% hObject    handle to default_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    loadbuild('', 'default.mat');
    disablemovie;
catch
end



% --------------------------------------------------------------------
function exit_menu_Callback(hObject, eventdata, handles)
% hObject    handle to exit_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

delete(gcbf);



% --------------------------------------------------------------------
function calculation_menu_Callback(hObject, eventdata, handles)
% hObject    handle to calculation_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function solveforinitialconditions_menu_Callback(hObject, eventdata, handles)
% hObject    handle to solveforinitialconditions_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);
if isequal(get(hObject, 'Checked'), 'on')
    set(hObject, 'Checked', 'off');
    set([handles.u0_textbox handles.v0_textbox], 'Enable', 'on');
else
    set(hObject, 'Checked', 'on');
    set([handles.u0_textbox handles.v0_textbox], 'Enable', 'off');
end



% --------------------------------------------------------------------
function forcemaximumprinciplecondition_menu_Callback(hObject, eventdata, handles)
% hObject    handle to forcemaximumprinciplecondition_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

if isequal(get(hObject, 'Checked'), 'on')
    set(hObject, 'Checked', 'off');
    set([handles.nux_textbox handles.nuy_textbox], 'Enable', 'on');
else
    set(hObject, 'Checked', 'on');
    set([handles.nux_textbox handles.nuy_textbox], 'Enable', 'off');
    d = get(handles.d_textbox, 'Value');
    if ~isempty(d)
        dx = get(handles.dx_textbox, 'Value');
        dy = get(handles.dy_textbox, 'Value');
        dt = get(handles.dt_textbox, 'Value');
        if ~isempty(dx) && ~isempty(dy)
            dt = min([dx dy])^2/max([1 d]);
            nux = dt/dx^2;
            nuy = dt/dy^2;
            set([handles.dt_textbox handles.nux_textbox handles.nuy_textbox], ...
                {'Value' 'String'}, ...
                {dt num2str(dt,8) ; nux num2str(nux,8) ; nuy num2str(nuy,8)});
        end
    end
end



% --------------------------------------------------------------------
function numericalscheme_menu_Callback(hObject, eventdata, handles)
% hObject    handle to numericalscheme_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function reactionterm_numericalscheme_menu_Callback(hObject, eventdata, handles)
% hObject    handle to reactionterm_numericalscheme_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function order1reactionterm_numericalscheme_menu_Callback(hObject, eventdata, handles)
% hObject    handle to order1reactionterm_numericalscheme_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.order1reactionterm_numericalscheme_menu, 'Checked', 'on');
set(handles.order2reactionterm_numericalscheme_menu, 'Checked', 'off');



% --------------------------------------------------------------------
function order2reactionterm_numericalscheme_menu_Callback(hObject, eventdata, handles)
% hObject    handle to order2reactionterm_numericalscheme_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.order1reactionterm_numericalscheme_menu, 'Checked', 'off');
set(handles.order2reactionterm_numericalscheme_menu, 'Checked', 'on');



% --------------------------------------------------------------------
function diffusionterm_numericalscheme_menu_Callback(hObject, eventdata, handles)
% hObject    handle to diffusionterm_numericalscheme_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function order2diffusionterm_numericalscheme_menu_Callback(hObject, eventdata, handles)
% hObject    handle to order2diffusionterm_numericalscheme_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.order2diffusionterm_numericalscheme_menu, 'Checked', 'on');
set(handles.order3diffusionterm_numericalscheme_menu, 'Checked', 'off');



% --------------------------------------------------------------------
function order3diffusionterm_numericalscheme_menu_Callback(hObject, eventdata, handles)
% hObject    handle to order3diffusionterm_numericalscheme_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.order2diffusionterm_numericalscheme_menu, 'Checked', 'off');
set(handles.order3diffusionterm_numericalscheme_menu, 'Checked', 'on');



% --------------------------------------------------------------------
function cnlf_numericalscheme_menu_Callback(hObject, eventdata, handles)
% hObject    handle to cnlf_numericalscheme_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set(hObject, 'Checked', 'off');
    set([handles.order1reactionterm_numericalscheme_menu ...
         handles.order2reactionterm_numericalscheme_menu ...
         handles.order2diffusionterm_numericalscheme_menu ...
         handles.order3diffusionterm_numericalscheme_menu], 'Enable', 'on');
else
    set(hObject, 'Checked', 'on');
    set(handles.sbdfcn2_numericalscheme_menu, 'Checked', 'off');
    set([handles.order1reactionterm_numericalscheme_menu ...
         handles.order2reactionterm_numericalscheme_menu ...
         handles.order2diffusionterm_numericalscheme_menu ...
         handles.order3diffusionterm_numericalscheme_menu], 'Enable', 'off');
end



% --------------------------------------------------------------------
function sbdfcn2_numericalscheme_menu_Callback(hObject, eventdata, handles)
% hObject    handle to sbdfcn2_numericalscheme_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set(hObject, 'Checked', 'off');
    set([handles.order1reactionterm_numericalscheme_menu ...
         handles.order2reactionterm_numericalscheme_menu ...
         handles.order2diffusionterm_numericalscheme_menu ...
         handles.order3diffusionterm_numericalscheme_menu], 'Enable', 'on');
else
    set(hObject, 'Checked', 'on');
    set(handles.cnlf_numericalscheme_menu, 'Checked', 'off');
    set([handles.order1reactionterm_numericalscheme_menu ...
         handles.order2reactionterm_numericalscheme_menu ...
         handles.order2diffusionterm_numericalscheme_menu ...
         handles.order3diffusionterm_numericalscheme_menu], 'Enable', 'off');
end



% --------------------------------------------------------------------
function plotting_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotting_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function plotu_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set(hObject, 'Checked', 'off');
else
    set(hObject, 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotu0_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu0_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set(hObject, 'Checked', 'off');
else
    set(hObject, 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set(hObject, 'Checked', 'off');
else
    set(hObject, 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv0_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv0_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set(hObject, 'Checked', 'off');
else
    set(hObject, 'Checked', 'on');
end
refreshframe;



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
refreshframe;



% --------------------------------------------------------------------
function hot_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to hot_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function gray_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to gray_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function bone_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to bone_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function copper_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to copper_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function pink_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to pink_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function white_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to white_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function flag_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to flag_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function lines_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to lines_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function colorcube_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to colorcube_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function vga_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to vga_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function jet_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to jet_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function prism_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to prism_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function cool_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to cool_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function autumn_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to autumn_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function spring_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to spring_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function winter_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to winter_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function summer_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to summer_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function mudd_colormap_menu_Callback(hObject, eventdata, handles)
% hObject    handle to mudd_colormap_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setcolormapmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function shading_menu_Callback(hObject, eventdata, handles)
% hObject    handle to shading_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function faceted_shading_menu_Callback(hObject, eventdata, handles)
% hObject    handle to shadingfaceted_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setshadingmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function flat_shading_menu_Callback(hObject, eventdata, handles)
% hObject    handle to shadingflat_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setshadingmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function interp_shading_menu_Callback(hObject, eventdata, handles)
% hObject    handle to shadinginterp_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setshadingmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function options_menu_Callback(hObject, eventdata, handles)
% hObject    handle to options_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function cliffplot_menu_Callback(hObject, eventdata, handles)
% hObject    handle to cliffplot_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set(hObject, 'Checked', 'off')
else
    set(hObject, 'Checked', 'on')
end
refreshframe;



% --------------------------------------------------------------------
function mesh_menu_Callback(hObject, eventdata, handles)
% hObject    handle to mesh_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set(hObject, 'Checked', 'off')
else
    set(hObject, 'Checked', 'on')
end
refreshframe;



% --------------------------------------------------------------------
function view_menu_Callback(hObject, eventdata, handles)
% hObject    handle to view_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function default_view_menu_Callback(hObject, eventdata, handles)
% hObject    handle to default_view_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set([handles.azimuthangle_textbox handles.elevationangle_textbox], ...
    {'Value' 'String'}, ...
    {-37.5 '-37.5' ; 30.0 '30.0'});
refreshframe;



% --------------------------------------------------------------------
function overhead_view_menu_Callback(hObject, eventdata, handles)
% hObject    handle to overhead_view_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set([handles.azimuthangle_textbox handles.elevationangle_textbox], ...
    {'Value' 'String'}, ...
    {0.0 '0.0' ; 90.0 '90.0'});
refreshframe;



% --------------------------------------------------------------------
function fixcurrentaxis_menu_Callback(hObject, eventdata, handles)
% hObject    handle to fixcurrentaxis_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.zlimits_radiobutton, 'Value', get(handles.zlimits_radiobutton, 'Max'));
set(handles.fitplot_radiobutton, 'Value', get(handles.fitplot_radiobutton, 'Min'));

axes(handles.axes);
axislim = axis;
if length(axislim) == 6
    zmin = axislim(5);
    zmax = axislim(6);
else
    data = getappdata(gcbf, 'data');
    frame = get(handles.frame_slider, 'Value') + 1;
    zmin = inf;
    zmax = -inf;
    if isequal(get(handles.plotu_menu, 'Checked'), 'on')
        zmin = min([zmin min(min(squeeze(data.U(frame,:,:))))]);
        zmax = max([zmax max(max(squeeze(data.U(frame,:,:))))]);
    end
    if isequal(get(handles.plotv_menu, 'Checked'), 'on')
        zmin = min([zmin min(min(squeeze(data.V(frame,:,:))))]);
        zmax = max([zmax max(max(squeeze(data.V(frame,:,:))))]);
    end
    if zmin == inf
        zmin = 0;
    end
    if zmax == -inf;
        zmax = 1;
    end
end

set([handles.zmin_textbox handles.zmax_textbox], ...
    {'Enable' 'Value' 'String'}, ...
    {'on' zmin num2str(zmin,8); 'on' zmax num2str(zmax,8)});



% --------------------------------------------------------------------
function showcolorbar_menu_Callback(hObject, eventdata, handles)
% hObject    handle to showcolorbar_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if isequal(get(hObject, 'Checked'), 'on')
    set(hObject, 'Checked', 'off');
    axes(handles.colorbar_axes);
    cla;
    set(handles.colorbar_axes, 'Visible', 'off');
else
    set(hObject, 'Checked', 'on');
    set(handles.colorbar_axes, 'Visible', 'on');
    plotcolorbar;
end

drawnow;



%--------------------------------------------------------------------------
%
%  Miscellaneous Functions
%
%--------------------------------------------------------------------------



% --- Keeps only those components with zero imaginary part.
function y = keepreal(x)
if all(imag(x) == 0)
    y = x;
else
    y = x(imag(x) == 0);
end



% --- Disables movie buttons
function disablemovie

handles = guidata(gcbf);
set([handles.begin_pushbutton ...
     handles.previous_pushbutton ...
     handles.play_pushbutton ...
     handles.pause_pushbutton ...
     handles.next_pushbutton ...
     handles.end_pushbutton ...
     handles.frame_slider ...
     handles.step_textbox ...
     handles.time_textbox], 'Enable', 'off');



% --- Initialize movie buttons
function initializemovie(startframe)

handles = guidata(gcbf);
data = getappdata(gcbf, 'data');

set(handles.pause_pushbutton, 'Value', 1.0);

nsteps = length(data.U(:,1,1)) - 1;
if nsteps < 0
    return
end

if nsteps == 0
    set(handles.frame_slider, 'Min', 0, 'Max', 1, 'Enable', 'off');
else
    set(handles.frame_slider, 'Min', 0, 'Max', nsteps, 'SliderStep', [1 8]/nsteps);
    
    set([handles.begin_pushbutton ...
         handles.previous_pushbutton ...
         handles.play_pushbutton ...
         handles.next_pushbutton ...
         handles.end_pushbutton ...
         handles.frame_slider ...
         handles.step_textbox ...
         handles.time_textbox], 'Enable', 'on');
    
    set(handles.pause_pushbutton, 'Enable', 'inactive');
end

switch startframe
    case 'begin'
        setframe(0)
    case 'end'
        setframe(nsteps)
end



% --- Determines if the value in string is valid for variable.
function b = isvalid(variable, string)

value = str2num(string);
switch variable
    case {'integer' 'randomseed'}
        b = length(value) == 1 && ~isnan(value) && isreal(value) && mod(value,1) == 0;
    case {'Jx' 'Jy'}
        b = length(value) == 1 && ~isnan(value) && isreal(value) && mod(value,1) == 0 && value > 2;
    case {'nonnegativereal' 'd' 'gamma_' 'time' 'uthreshold' 'vthreshold' 'zmin' 'zmax'}
        b = length(value) == 1 && ~isnan(value) && isreal(value) && value >= 0;
    case {'nonnegativeinteger' 'nsteps' 'step'}
        b = length(value) == 1 && ~isnan(value) && isreal(value) && mod(value,1) == 0 && value >= 0;
    case {'positiveinteger' 'displaystep'}
        b = length(value) == 1 && ~isnan(value) && isreal(value) && mod(value,1) == 0 && value > 0;
    case {'positivereal' 'dt' 'dx' 'dy' 'maxchange' 'maxperturbation' 'nux' 'nuy' 'xmax' 'ymax'}
        b = length(value) == 1 && ~isnan(value) && isreal(value) && value > 0;
    case {'real' 'azimuthangle' 'elevationangle'}
        b = length(value) == 1 && ~isnan(value) && isreal(value);
    case {'value1' 'value2' 'value3' 'value4' 'value5'}
        b = length(value) == 1 && ~isnan(value);
    otherwise
        b = false;
end



% --- Unchecks all colormap menus.
function setcolormapmenusoff

handles = guidata(gcbf);
colormaps = {'hsv' 'hot' 'gray' 'bone' 'copper' 'pink' 'white' ...
             'flag' 'lines' 'colorcube' 'vga' 'jet' 'prism' ...
             'cool' 'autumn' 'spring' 'winter' 'summer' ...
             'mudd'};
for i = 1:length(colormaps)
    set(eval(['handles.' colormaps{i} '_colormap_menu']), 'Checked', 'off');
end



% --- Unchecks all shading menus.
function setshadingmenusoff

handles = guidata(gcbf);
set([handles.faceted_shading_menu ...
     handles.flat_shading_menu ...
     handles.interp_shading_menu], 'Checked', 'off');



% --- Sets the colormap of the current axes.
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



% --- Sets the frame number to frame.
function setframe(frame)

handles = guidata(gcbf);

if frame < 0
    frame = 0;
end
if frame > get(handles.frame_slider, 'Max')
    frame = get(handles.frame_slider, 'Max');
end
set(handles.frame_slider, 'Value', frame);
try
    axes(handles.axes);
    plotuv(frame);
    plotcolorbar;
catch
    uiwait(errordlg(['error plotting frame ' int2str(frame)], 'error', 'modal'));
    set(handles.pause_pushbutton, 'Value', 1.0);
end



% -- Refreshes current frame.
function refreshframe

handles = guidata(gcbf);
data = getappdata(gcbf, 'data');
if ~data.buildnew && ~isempty(data.U) && get(handles.pause_pushbutton, 'Value') == 1.0
    try
        axes(handles.axes);
        plotuv(get(handles.frame_slider, 'Value'));
        plotcolorbar;
    catch
        uiwait(errordlg('error refreshing frame', 'error', 'modal'));
    end
end



% --- Plots the specified frame number to current axes.
function plotuv(frame)

handles = guidata(gcbf);
data = getappdata(gcbf, 'data');
step = frame*data.displaystep;
time = frame*data.displaystep*data.dt;
set([handles.step_textbox handles.time_textbox], ...
    {'Value' 'String'}, ...
    {step int2str(step) ; time num2str(time,8)});
set(handles.status_textbox, 'String', ['Plotting frame ' int2str(frame) '...']);
drawnow;

u = squeeze(data.U(frame+1,:,:));
u0 = data.U0;
uthreshold = repmat(get(handles.uthreshold_textbox, 'Value'), [data.Jy+1 data.Jx+1]);
v = squeeze(data.V(frame+1,:,:));
v0 = data.V0;
vthreshold = repmat(get(handles.vthreshold_textbox, 'Value'), [data.Jy+1 data.Jx+1]);

if isequal(get(handles.mesh_menu, 'Checked'), 'on')
    plotfunction = @mesh;
else
    plotfunction = @surf;
end

cla;
hold on;

if isequal(get(handles.cliffplot_menu, 'Checked'), 'on')
    if get(handles.uthreshold_checkbox, 'Value') == get(handles.uthreshold_checkbox, 'Min') ...
            || isempty(uthreshold)
        uthreshold = u0;
    end
    if get(handles.vthreshold_checkbox, 'Value') == get(handles.vthreshold_checkbox, 'Min') ...
            || isempty(vthreshold)
        vthreshold = v0;
    end
    if isequal(get(handles.plotu_menu, 'Checked'), 'on')
        feval(plotfunction, data.x, data.y, (u > uthreshold) + 3);
    end
    if isequal(get(handles.plotv_menu, 'Checked'), 'on')
        feval(plotfunction, data.x, data.y, (v > vthreshold) + 0);
    end
    
    axis('tight');
    caxis('auto');
    
else
    vars = {'u' 'u0' 'v' 'v0'};
    for i = 1:length(vars)
        if isequal(get(eval(['handles.plot' vars{i} '_menu']), 'Checked'), 'on')
            feval(plotfunction, data.x, data.y, eval(vars{i}));
        end
    end
    if ~isempty(uthreshold) && ...
            get(handles.uthreshold_checkbox, 'Value') == get(handles.uthreshold_checkbox, 'Max')
        feval(plotfunction, data.x, data.y, uthreshold);
    end
    if ~isempty(vthreshold) && ...
            get(handles.vthreshold_checkbox, 'Value') == get(handles.vthreshold_checkbox, 'Max')
        feval(plotfunction, data.x, data.y, vthreshold);
    end
    
    axis('tight');
    caxis('auto');
    
    if get(handles.zlimits_radiobutton, 'Value') == get(handles.zlimits_radiobutton, 'Max')
        zmin = get(handles.zmin_textbox, 'Value');
        zmax = get(handles.zmax_textbox, 'Value');
        if ~isempty(zmin) && ~isempty(zmax)
            axis([0 data.x(end) 0 data.y(end) zmin zmax]);
            caxis([zmin zmax]);
        end
    end
    
end
hold off;

axis('normal');
view(3);
azimuthangle = get(handles.azimuthangle_textbox, 'Value');
elevationangle = get(handles.elevationangle_textbox, 'Value');
if ~isempty(azimuthangle) && ~isempty(elevationangle)
    view(azimuthangle, elevationangle);
    if elevationangle == 90
        axis('equal');
    end
end

setcolormap;

shadings = {'faceted' 'flat' 'interp'};
for i = 1:length(shadings)
    if isequal(get(eval(['handles.' shadings{i} '_shading_menu']), 'Checked'), 'on')
        shading(shadings{i});
    end
end

xlabel('x');
ylabel('y');

drawnow;

set(handles.status_textbox, 'String', 'Ready');



% --- Plot colorbar.
function plotcolorbar

handles = guidata(gcbf);
if isequal(get(handles.colorbar_axes, 'Visible'), 'off')
    return;
end

set(handles.status_textbox, 'String', 'Plotting colorbar...');
drawnow;

axes(handles.colorbar_axes);
cla;

clim = get(handles.axes, 'CLim');
pcolor([0 1], clim, [clim' clim']);
set(handles.colorbar_axes, 'XTick', []);
caxis('auto');

setcolormap;

shading('interp');

drawnow;

set(handles.status_textbox, 'String', 'Ready');



% --- Load the specified kinetics.
function loadkinetics(filename)

handles = guidata(gcbf);
try
    load(filename);
    vars = {'param1' 'param2' 'param3' 'param4' 'param5' ...
            'f' 'g' 'u0' 'v0'};
    for i = 1:length(vars)
        set(eval(['handles.' vars{i} '_textbox']), 'String', eval(['data.' vars{i}]));
    end
    data = getappdata(gcbf, 'data');
    data.buildnew = true;
    setappdata(gcbf, 'data', data);
catch
    uiwait(errordlg(['error loading ' filename], 'error', 'modal'));
    set(handles.status_textbox, 'String', 'Ready');
    rethrow(lasterror);
end



% --- Loads the specified build.
function loadbuild(pathname, filename)

handles = guidata(gcbf);
data = getappdata(gcbf, 'data');
set(handles.status_textbox, 'String', ['Loading ' filename '...']);
drawnow;
try
    load([pathname filename]);
    
    vars = {'gamma_' 'd' 'xmax' 'Jx' 'dx' 'ymax' ...
            'Jy' 'dy' 'dt' 'nux' 'nuy' 'displaystep' ...
            'value1' 'value2' 'value3' 'value4' 'value5' ...
            'maxperturbation' 'randomseed' 'nsteps' 'maxchange' ...
            'uthreshold' 'vthreshold'};
    for i = 1:length(vars)
        set(eval(['handles.' vars{i} '_textbox']), ...
            'Value', eval(['data.' vars{i}]), ...
            'String', num2str(eval(['data.' vars{i}]),8));
    end
    vars = {'param1' 'param2' 'param3' 'param4' 'param5' ...
            'f' 'g' 'u0' 'v0'};
    for i = 1:length(vars)
        set(eval(['handles.' vars{i} '_textbox']), 'String', eval(['data.' vars{i}]));
    end
    vars = {'u0yt' 'ux0yt' 'uxmaxyt' 'uxxmaxyt' 'u0ytuxmaxyt' ...
            'ux0t' 'uyx0t' 'uxymaxt' 'uyxymaxt' 'ux0tuxymaxt' ...
            'v0yt' 'vx0yt' 'vxmaxyt' 'vxxmaxyt' 'v0ytvxmaxyt' ...
            'vx0t' 'vyx0t' 'vxymaxt' 'vyxymaxt' 'vx0tvxymaxt'};
    for i = 1:length(vars)
        set(eval(['handles.' vars{i} '_radiobutton']), 'Value', eval(['data.' vars{i} '_flag']));
    end
    vars = {'maxperturbation' 'randomseed' 'nsteps' 'maxchange' ...
            'uthreshold' 'vthreshold'};
    for i = 1:length(vars)
        set(eval(['handles.' vars{i} '_checkbox']), 'Value', eval(['data.' vars{i} '_flag']));
        if eval(['data.' vars{i} '_flag'])
            set(eval(['handles.' vars{i} '_textbox']), 'Enable', 'on');
        else
            set(eval(['handles.' vars{i} '_textbox']), 'Enable', 'off');
        end
    end
catch
    uiwait(errordlg(['error loading ' filename], 'error', 'modal'));
    set(handles.status_textbox, 'String', 'Ready');
    rethrow(lasterror);
end

data.buildnew = false;
setappdata(gcbf, 'data', data);

axes(handles.axes);
cla reset;
set(handles.status_textbox, 'String', 'Ready');

