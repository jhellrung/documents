function varargout = rdgc2dgui(varargin)
% RDGC2DGUI M-file for rdgc2dgui.fig
%      RDGC2DGUI, by itself, creates a new RDGC2DGUI or raises the existing
%      singleton*.
%
%      H = RDGC2DGUI returns the handle to a new RDGC2DGUI or the handle to
%      the existing singleton*.
%
%      RDGC2DGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RDGC2DGUI.M with the given input arguments.
%
%      RDGC2DGUI('Property','Value',...) creates a new RDGC2DGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rdgc2dgui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rdgc2dgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rdgc2dgui

% Last Modified by GUIDE v2.5 11-Aug-2003 00:12:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rdgc2dgui_OpeningFcn, ...
                   'gui_OutputFcn',  @rdgc2dgui_OutputFcn, ...
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


% --- Executes just before rdgc2dgui is made visible.
function rdgc2dgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rdgc2dgui (see VARARGIN)

data.buildnew = true;

vars = {'gamma_' 'd' 'Jr' 'dr' 'Js' 'ds' 'dt' 'displaystep' ...
        'value1' 'value2' 'value3' 'value4' 'value5' ...
        'maxperturbation' 'randomseed' 'nsteps' 'maxchange' ...
        'uthreshold' 'vthreshold' ...
        'r' 's' 'U0' 'V0' 'U' 'V'};
for i = 1:length(vars)
    eval(['data.' vars{i} ' = [];']);
end
vars = {'param1' 'param2' 'param3' 'param4' 'param5' ...
        'x' 'y' 'z' 'rho' 'f' 'g' 'u0' 'v0'};
for i = 1:length(vars)
    eval(['data.' vars{i} ' = '''';']);
end
vars = {'u_r_0_dirichlet' 'u_r_0_neumann' 'u_r_0_periodic' ...
        'u_r_1_dirichlet' 'u_r_1_neumann' 'u_r_1_periodic' ...
        'u_s_0_dirichlet' 'u_s_0_neumann' 'u_s_0_periodic' ...
        'u_s_1_dirichlet' 'u_s_1_neumann' 'u_s_1_periodic' ...
        'v_r_0_dirichlet' 'v_r_0_neumann' 'v_r_0_periodic' ...
        'v_r_1_dirichlet' 'v_r_1_neumann' 'v_r_1_periodic' ...
        'v_s_0_dirichlet' 'v_s_0_neumann' 'v_s_0_periodic' ...
        'v_s_1_dirichlet' 'v_s_1_neumann' 'v_s_1_periodic' ...
        'maxperturbation' 'randomseed' 'nsteps' 'maxchange' ...
        'uthreshold' 'vthreshold'};
for i = 1:length(vars)
    eval(['data.' vars{i} '_flag = false;']);
end

setappdata(hObject, 'data', data);

% Choose default command line output for rdgc2dgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rdgc2dgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rdgc2dgui_OutputFcn(hObject, eventdata, handles)
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
else
    set(hObject, 'Value', [], 'String', '');
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
%  Mapping
%    x(r,s,t) = rho(t) * ________
%    y(r,s,t) = rho(t) * ________
%    z(r,s,t) = rho(t) * ________
%    rho(t) = ________
%
%--------------------------------------------------------------------------




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

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);



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

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);



% --- Executes during object creation, after setting all properties.
function z_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function z_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to z_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_textbox as text
%        str2double(get(hObject,'String')) returns contents of z_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);



% --- Executes during object creation, after setting all properties.
function rho_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rho_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function rho_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to rho_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rho_textbox as text
%        str2double(get(hObject,'String')) returns contents of rho_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);



%--------------------------------------------------------------------------
%
%  Calculation
%    Jr =   ________
%    dr =   ________
%    Js =   ________
%    ds =   ________
%    dt =   ________
%
%--------------------------------------------------------------------------



% --- Executes during object creation, after setting all properties.
function Jr_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Jr_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Jr_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to Jr_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Jr_textbox as text
%        str2double(get(hObject,'String')) returns contents of Jr_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('Jr', string)
    Jr = str2num(string);
    dr = 1/Jr;
    set([handles.Jr_textbox handles.dr_textbox], ...
        {'Value' 'String'}, ...
        {Jr int2str(Jr) ; dr num2str(dr,8)});
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('Jr must evaluate to an integer greater than 2', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function dr_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dr_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function dr_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to dr_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dr_textbox as text
%        str2double(get(hObject,'String')) returns contents of dr_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('dr', string)
    dr = str2num(string);
    Jr = max([ceil(1/dr) 3]);
    dr = 1/Jr;
    set([handles.Jr_textbox handles.dr_textbox], ...
        {'Value' 'String'}, ...
        {Jr int2str(Jr) ; dr num2str(dr,8)});
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('dr must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function Js_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Js_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Js_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to Js_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Js_textbox as text
%        str2double(get(hObject,'String')) returns contents of Js_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('Js', string)
    Js = str2num(string);
    ds = 1/Js;
    set([handles.Js_textbox handles.ds_textbox], ...
        {'Value' 'String'}, ...
        {Js int2str(Js) ; ds num2str(ds,8)});
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('Js must evaluate to an integer greater than 2', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function ds_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ds_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ds_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to ds_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ds_textbox as text
%        str2double(get(hObject,'String')) returns contents of ds_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('ds', string)
    ds = str2num(string);
    Js = max([ceil(1/ds) 3]);
    ds = 1/Js;
    set([handles.Js_textbox handles.ds_textbox], ...
        {'Value' 'String'}, ...
        {Js int2str(Js) ; ds num2str(ds,8)});
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
    set(hObject, 'Value', str2num(string));
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('dt must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



%--------------------------------------------------------------------------
%
%  Initial Conditions
%    u0(r,s) = ________
%    v0(r,s) = ________
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



% --- Executes on button press in axislimits_radiobutton.
function axislimits_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to axislimits_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of axislimits_radiobutton

set(handles.axislimits_radiobutton, 'Value', get(handles.axislimits_radiobutton, 'Max'));
set(handles.fitplot_radiobutton, 'Value', get(handles.fitplot_radiobutton, 'Min'));
set(handles.axislimits_textbox, 'Enable', 'on');
refreshframe;



% --- Executes during object creation, after setting all properties.
function axislimits_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axislimits_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function axislimits_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to axislimits_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of axislimits_textbox as text
%        str2double(get(hObject,'String')) returns contents of axislimits_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('axislimits', string)
    axislimits = str2num(string);
    set(hObject, 'Value', axislimits);
    refreshframe;
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg({'axis must specify legal x- and y- or x-, y-, and z-limits' 'type ''help axis'''}, 'error', 'modal'));
    end
end



% --- Executes on button press in fitplot_radiobutton.
function fitplot_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to fitplot_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fitplot_radiobutton

set(handles.axislimits_radiobutton, 'Value', get(handles.axislimits_radiobutton, 'Min'));
set(handles.fitplot_radiobutton, 'Value', get(handles.fitplot_radiobutton, 'Max'));
set(handles.axislimits_textbox, 'Enable', 'off');
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

vars = {'x' 'y' 'z' 'rho' 'f' 'g' 'u0' 'v0'};
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

vars = {'gamma_' 'd' 'Jr' 'dr' 'Js' 'ds' 'dt' 'displaystep'};
for i = 1:length(vars)
    s = vars{i};
    eval([s ' = get(handles.' s '_textbox, ''Value'');']);
    if isempty(eval(s))
        uiwait(errordlg([s ' must be specified'], 'error', 'modal'));
        return;
    end
    eval(['data.' s ' = ' s ';']);
end


% get the status of all menu flags

vars = {'u_r_0_dirichlet' 'u_r_0_neumann' 'u_r_0_periodic' ...
        'u_r_1_dirichlet' 'u_r_1_neumann' 'u_r_1_periodic' ...
        'u_s_0_dirichlet' 'u_s_0_neumann' 'u_s_0_periodic' ...
        'u_s_1_dirichlet' 'u_s_1_neumann' 'u_s_1_periodic' ...
        'v_r_0_dirichlet' 'v_r_0_neumann' 'v_r_0_periodic' ...
        'v_r_1_dirichlet' 'v_r_1_neumann' 'v_r_1_periodic' ...
        'v_s_0_dirichlet' 'v_s_0_neumann' 'v_s_0_periodic' ...
        'v_s_1_dirichlet' 'v_s_1_neumann' 'v_s_1_periodic'};
for i = 1:length(vars)
    s = vars{i};
    eval([s '_flag = isequal(get(handles.' s '_menu, ''Checked''), ''on'');']);
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


try
    r = sym('r', 'positive');
    s = sym('s', 'positive');
    t = sym('t', 'positive');
    xr = diff(eval(x), r);
    xs = diff(eval(x), s);
    yr = diff(eval(y), r);
    ys = diff(eval(y), s);
    zr = diff(eval(z), r);
    zs = diff(eval(z), s);
    if simplify(xr*xs + yr*ys + zr*zs) ~= 0
        uiwait(errordlg('the parametrization must define an orthogonal system on the surface', 'error', 'modal'))
        set(handles.status_textbox, 'String', 'Ready');
        return;
    end
    hr = abs(eval(rho))*sqrt(xr^2 + yr^2 + zr^2);
    hs = abs(eval(rho))*sqrt(xs^2 + ys^2 + zs^2);
    k1 = vectorize(char(simplify(1/(hr*hs))));
    k2 = vectorize(char(simplify(diff(log(hr*hs), t))));
    pr = regexprep(vectorize(char(simplify(hs/hr))), '\<r\>', 'rshift');
    pr = regexprep(pr, '\<s\>', 'ss');
    ps = regexprep(vectorize(char(simplify(hr/hs))), '\<s\>', 'sshift');
    ps = regexprep(ps, '\<r\>', 'rr');
    k1 = regexprep(k1, '\<signum\>', 'sign');
    k2 = regexprep(k2, '\<signum\>', 'sign');
    pr = regexprep(pr, '\<signum\>', 'sign');
    ps = regexprep(ps, '\<signum\>', 'sign');
catch
    uiwait(errordlg({['error evaluating or differentiating one of ' x ', ' y ', ' z ', or ' rho] ...
                     'unable to begin build'}, 'error', 'modal'));
    set(handles.status_textbox, 'String', 'Ready');
    return;
end


if data.buildnew
    [r s] = meshgrid(0:dr:1, 0:ds:1);
    
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
            u = repmat(u(1), [Js+1 Jr+1]);
            v = repmat(v(1), [Js+1 Jr+1]);
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
                if ~isequal(size(u), [Js+1 Jr+1])
                    u = u(imag(u) == 0);
                    if length(u) > 1
                        u = u(u >= 0);
                    end
                    u = repmat(u(1), [Js+1 Jr+1]);
                end
            catch
                error(['error evaluating u0 = ' u0]);
            end
            try
                v = eval(vectorize(v0));
                if ~isequal(size(v), [Js+1 Jr+1])
                    v = v(imag(v) == 0);
                    if length(v) > 1
                        v = v(v >= 0);
                    end
                    v = repmat(v(1), [Js+1 Jr+1]);
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
        u = u + maxperturbation*(2*rand([Js+1 Jr+1]) - 1);
        v = v + maxperturbation*(2*rand([Js+1 Jr+1]) - 1);
    end
    
    data.r = r;
    data.s = s;
    data.U = [];
    data.U(1,:,:) = u;
    data.V = [];
    data.V(1,:,:) = v;
    step = 0;
    
else
    r = data.r;
    s = data.s;
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

skip = 1;

nur = dt/dr^2;
nus = dt/ds^2;

rshift = [repmat(-dr/2, [Js+1 1]) r+dr/2];
ss = [s(:,1) s];
sshift = [repmat(-ds/2, [1 Jr+1]) ; s+ds/2];
rr = [r(1,:) ; r];

f = vectorize(f);
g = vectorize(g);

Z = zeros([Js+1 Jr+1]);

aa = Z;
cc = Z;
du = Z;
dv = Z;
ee = Z;
ff = Z;
gg = Z;
fu = Z;
gv = Z;
lu = Z;
lv = Z;
uu = Z;
vv = Z;

k1_ = Z;
k2_ = Z;
pr_ = zeros([Js+1 Jr+2]);
ps_ = zeros([Js+2 Jr+1]);

warningstate = warning('off', 'MATLAB:divideByZero');


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
    
    t = step*dt;
    try
        k1_(:,:) = eval(k1);
    catch
        error(['error evaluating k1 = ' k1 ' at t = ' num2str(t,8) ', step ' int2str(step)]);
    end
    try
        k2_(:,:) = eval(k2);
    catch
        error(['error evaluating k2 = ' k2 ' at t = ' num2str(t,8) ', step ' int2str(step)]);
    end
    try
        ps_(:,:) = eval(ps);
    catch
        error(['error evaluating ps = ' ps ' at t = ' num2str(t,8) ', step ' int2str(step)]);
    end
    
    while step < nsteps && get(handles.hold_pushbutton, 'Value') == 0.0
        
        set(handles.status_textbox, 'String', ['Calculating step ' int2str(step+1) '...']);
        drawnow;
        
        
        du = 1/2*stepsize*w3(1)*lu;
        for i = 2:Js
            lu(i,:) = ps_(i,:).*u(i-1,:) - (ps_(i,:) + ps_(i+1,:)).*u(i,:) + ps_(i+1,:).*u(i+1,:);
        end
        lu(1,:) = ps_(1,:).*(u_s_0_periodic_flag*u(Js+1,:) + u_s_0_neumann_flag*u(2,:)) - ...
            (ps_(1,:) + ps_(2,:)).*u(1,:) + ps_(2,:).*u(2,:);
        lu(Js+1,:) = ps_(Js+1,:).*u(Js,:) - (ps_(Js+1,:) + ps_(Js+2,:)).*u(Js+1,:) + ...
            ps_(Js+2,:).*(u_s_1_periodic_flag*u(1,:) + u_s_1_neumann_flag*u(Js,:));
        lu = 2*nus*k1_.*lu - dt*k2_.*u;
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
        du(1,:) = ~u_s_0_dirichlet_flag*du(1,:);
        du(Js+1,:) = ~u_s_1_dirichlet_flag*du(Js+1,:);
        du(:,1) = ~u_r_0_dirichlet_flag*du(:,1);
        du(:,Jr+1) = ~u_r_1_dirichlet_flag*du(:,Jr+1);
        
        
        dv = 1/2*stepsize*w3(1)*lv;
        for i = 2:Js
            lv(i,:) = ps_(i,:).*v(i-1,:) - (ps_(i,:) + ps_(i+1,:)).*v(i,:) + ps_(i+1,:).*v(i+1,:);
        end
        lv(1,:) = ps_(1,:).*(v_s_0_periodic_flag*v(Js+1,:) + v_s_0_neumann_flag*v(2,:)) - ...
            (ps_(1,:) + ps_(2,:)).*v(1,:) + ps_(2,:).*v(2,:);
        lv(Js+1,:) = ps_(Js+1,:).*v(Js,:) - (ps_(Js+1,:) + ps_(Js+2,:)).*v(Js+1,:) + ...
            ps_(Js+2,:).*(v_s_1_periodic_flag*v(1,:) + v_s_1_neumann_flag*v(Js,:));
        lv = 2*d*nus*k1_.*lv - dt*k2_.*v;
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
        dv(1,:) = ~v_s_0_dirichlet_flag*dv(1,:);
        dv(Js+1,:) = ~v_s_1_dirichlet_flag*dv(Js+1,:);
        dv(:,1) = ~v_r_0_dirichlet_flag*dv(:,1);
        dv(:,Jr+1) = ~v_r_1_dirichlet_flag*dv(:,Jr+1);
        
        
        
        step = step + 1/2*stepsize;
        t = step*dt;
        try
            k1_(:,:) = eval(k1);
        catch
            error(['error evaluating k1 = ' k1 ' at t = ' num2str(t,8) ', step ' int2str(step)]);
        end
        try
            k2_(:,:) = eval(k2);
        catch
            error(['error evaluating k2 = ' k2 ' at t = ' num2str(t,8) ', step ' int2str(step)]);
        end
        try
            pr_(:,:) = eval(pr);
        catch
            error(['error evaluating pr = ' pr ' at t = ' num2str(t,8) ', step ' int2str(step)]);
        end
        
        
        for j = 1:Jr+1
            aa(:,j) = w3(3)*stepsize*nur*k1_(:,j).*pr_(:,j);
            bb(:,j) = w1(3) + w3(3)*stepsize*(nur*k1_(:,j).*(pr_(:,j) + pr_(:,j+1)) + 1/2*dt*k2_(:,j));
            cc(:,j) = w3(3)*stepsize*nur*k1_(:,j).*pr_(:,j+1);
        end
        cc(:,1) = ~u_r_0_dirichlet_flag*cc(:,1) + u_r_0_neumann_flag*aa(:,1);
        bb(:,1) = u_r_0_dirichlet_flag + ~u_r_0_dirichlet_flag*bb(:,1);
        aa(:,1) = u_r_0_periodic_flag*aa(:,1);
        aa(:,Jr+1) = ~u_r_1_dirichlet_flag*aa(:,Jr+1) + u_r_1_neumann_flag*cc(:,Jr+1);
        bb(:,Jr+1) = u_r_1_dirichlet_flag + ~u_r_1_dirichlet_flag*bb(:,Jr+1);
        cc(:,Jr+1) = u_r_1_periodic_flag*cc(:,Jr+1);
        
        ee(:,1) = cc(:,1)./bb(:,1);
        ff(:,1) = du(:,1)./bb(:,1);
        gg(:,1) = aa(:,1)./bb(:,1);
        h = cc(:,Jr+1);
        m = h.*gg(:,1);
        n = h.*ff(:,1);
        for j = 2:Jr-1
            k = 1./(bb(:,j) - aa(:,j).*ee(:,j-1));
            ee(:,j) = cc(:,j).*k;
            ff(:,j) = (du(:,j) + aa(:,j).*ff(:,j-1)).*k;
            gg(:,j) = aa(:,j).*gg(:,j-1).*k;
            h = ee(:,j-1).*h;
            m = m + h.*gg(:,j);
            n = n + h.*ff(:,j);
        end
        k = 1./(bb(:,Jr) - aa(:,Jr).*ee(:,Jr-1));
        ee(:,Jr) = 0;
        ff(:,Jr) = (du(:,Jr) + aa(:,Jr).*ff(:,Jr-1)).*k;
        gg(:,Jr) = (aa(:,Jr).*gg(:,Jr-1) + cc(:,Jr)).*k;
        h = ee(:,Jr-1).*h + aa(:,Jr+1);
        m = m + h.*gg(:,Jr);
        n = n + h.*ff(:,Jr);
        u(:,Jr+1) = (du(:,Jr+1) + n)./(bb(:,Jr+1) - m);
        for j = Jr:-1:1
            u(:,j) = ff(:,j) + ee(:,j).*u(:,j+1) + gg(:,j).*u(:,Jr+1);
        end
        
        
        for j = 1:Jr+1
            aa(:,j) = w3(3)*stepsize*d*nur*k1_(:,j).*pr_(:,j);
            bb(:,j) = w1(3) + w3(3)*stepsize*(d*nur*k1_(:,j).*(pr_(:,j) + pr_(:,j+1)) + 1/2*dt*k2_(:,j));
            cc(:,j) = w3(3)*stepsize*d*nur*k1_(:,j).*pr_(:,j+1);
        end
        cc(:,1) = ~v_r_0_dirichlet_flag*cc(:,1) + v_r_0_neumann_flag*aa(:,1);
        bb(:,1) = v_r_0_dirichlet_flag + ~v_r_0_dirichlet_flag*bb(:,1);
        aa(:,1) = v_r_0_periodic_flag*aa(:,1);
        aa(:,Jr+1) = ~v_r_1_dirichlet_flag*aa(:,Jr+1) + v_r_1_neumann_flag*cc(:,Jr+1);
        bb(:,Jr+1) = v_r_1_dirichlet_flag + ~v_r_1_dirichlet_flag*bb(:,Jr+1);
        cc(:,Jr+1) = v_r_1_periodic_flag*cc(:,Jr+1);
        
        ee(:,1) = cc(:,1)./bb(:,1);
        ff(:,1) = dv(:,1)./bb(:,1);
        gg(:,1) = aa(:,1)./bb(:,1);
        h = cc(:,Jr+1);
        m = h.*gg(:,1);
        n = h.*ff(:,1);
        for j = 2:Jr-1
            k = 1./(bb(:,j) - aa(:,j).*ee(:,j-1));
            ee(:,j) = cc(:,j).*k;
            ff(:,j) = (dv(:,j) + aa(:,j).*ff(:,j-1)).*k;
            gg(:,j) = aa(:,j).*gg(:,j-1).*k;
            h = ee(:,j-1).*h;
            m = m + h.*gg(:,j);
            n = n + h.*ff(:,j);
        end
        k = 1./(bb(:,Jr) - aa(:,Jr).*ee(:,Jr-1));
        ee(:,Jr) = 0;
        ff(:,Jr) = (dv(:,Jr) + aa(:,Jr).*ff(:,Jr-1)).*k;
        gg(:,Jr) = (aa(:,Jr).*gg(:,Jr-1) + cc(:,Jr)).*k;
        h = ee(:,Jr-1).*h + aa(:,Jr+1);
        m = m + gg(:,Jr).*h;
        n = n + ff(:,Jr).*h;
        v(:,Jr+1) = (dv(:,Jr+1) + n)./(bb(:,Jr+1) - m);
        for j = Jr:-1:1
            v(:,j) = ff(:,j) + ee(:,j).*v(:,j+1) + gg(:,j).*v(:,Jr+1);
        end
        
        
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
        for j = 2:Jr
            lu(:,j) = pr_(:,j).*u(:,j-1) - (pr_(:,j) + pr_(:,j+1)).*u(:,j) + pr_(:,j+1).*u(:,j+1);
        end
        lu(:,1) = pr_(:,1).*(u_r_0_periodic_flag*u(:,Jr+1) + u_r_0_neumann_flag*u(:,2)) - ...
            (pr_(:,1) + pr_(:,2)).*u(:,1) + pr_(:,2).*u(:,2);
        lu(:,Jr+1) = pr_(:,Jr+1).*u(:,Jr) - (pr_(:,Jr+1) + pr_(:,Jr+2)).*u(:,Jr+1) + ...
            pr_(:,Jr+2).*(u_r_1_periodic_flag*u(:,1) + u_r_1_neumann_flag*u(:,Jr));
        lu = 2*nur*k1_.*lu - dt*k2_.*u;
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
        du(:,1) = ~u_r_0_dirichlet_flag*du(:,1);
        du(:,Jr+1) = ~u_r_1_dirichlet_flag*du(:,Jr+1);
        du(1,:) = ~u_s_0_dirichlet_flag*du(1,:);
        du(Js+1,:) = ~u_s_1_dirichlet_flag*du(Js+1,:);
        
        
        dv = 1/2*stepsize*w3(1)*lv;
        for j = 2:Jr
            lv(:,j) = pr_(:,j).*v(:,j-1) - (pr_(:,j) + pr_(:,j+1)).*v(:,j) + pr_(:,j+1).*v(:,j+1);
        end
        lv(:,1) = pr_(:,1).*(v_r_0_periodic_flag*v(:,Jr+1) + v_r_0_neumann_flag*v(:,2)) - ...
            (pr_(:,1) + pr_(:,2)).*v(:,1) + pr_(:,2).*v(:,2);
        lv(:,Jr+1) = pr_(:,Jr+1).*v(:,Jr) - (pr_(:,Jr+1) + pr_(:,Jr+2)).*v(:,Jr+1) + ...
            pr_(:,Jr+2).*(v_r_1_periodic_flag*v(:,1) + v_r_1_neumann_flag*v(:,Jr));
        lv = 2*d*nur*k1_.*lv - dt*k2_.*v;
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
        dv(:,1) = ~v_r_0_dirichlet_flag*dv(:,1);
        dv(:,Jr+1) = ~v_r_1_dirichlet_flag*dv(:,Jr+1);
        dv(1,:) = ~v_s_0_dirichlet_flag*dv(1,:);
        dv(Js+1,:) = ~v_s_1_dirichlet_flag*dv(Js+1,:);
        
        
        step = step + 1/2*stepsize;
        t = step*dt;
        try
            k1_(:,:) = eval(k1);
        catch
            error(['error evaluating k1 = ' k1 ' at t = ' num2str(t,8) ', step ' int2str(step)]);
        end
        try
            k2_(:,:) = eval(k2);
        catch
            error(['error evaluating k2 = ' k2 ' at t = ' num2str(t,8) ', step ' int2str(step)]);
        end
        try
            ps_(:,:) = eval(ps);
        catch
            error(['error evaluating ps = ' ps ' at t = ' num2str(t,8) ', step ' int2str(step)]);
        end
        
        
        for i = 1:Js+1
            aa(i,:) = w3(3)*stepsize*nus*k1_(i,:).*ps_(i,:);
            bb(i,:) = w1(3) + w3(3)*stepsize*(nus*k1_(i,:).*(ps_(i,:) + ps_(i+1,:)) + 1/2*dt*k2_(i,:));
            cc(i,:) = w3(3)*stepsize*nus*k1_(i,:).*ps_(i+1,:);
        end
        cc(1,:) = ~u_s_0_dirichlet_flag*cc(1,:) + u_s_0_neumann_flag*aa(1,:);
        bb(1,:) = u_s_0_dirichlet_flag + ~u_s_0_dirichlet_flag*bb(1,:);
        aa(1,:) = u_s_0_periodic_flag*aa(1,:);
        aa(Js+1,:) = ~u_s_1_dirichlet_flag*aa(Js+1,:) + u_s_1_neumann_flag*cc(Js+1,:);
        bb(Js+1,:) = u_s_1_dirichlet_flag + ~u_s_1_dirichlet_flag*bb(Js+1,:);
        cc(Js+1,:) = u_s_0_periodic_flag*cc(Js+1,:);
        
        ee(1,:) = cc(1,:)./bb(1,:);
        ff(1,:) = du(1,:)./bb(1,:);
        gg(1,:) = aa(1,:)./bb(1,:);
        h = cc(Js+1,:);
        m = h.*gg(1,:);
        n = h.*ff(1,:);
        for i = 2:Js-1
            k = 1./(bb(i,:) - aa(i,:).*ee(i-1,:));
            ee(i,:) = cc(i,:).*k;
            ff(i,:) = (du(i,:) + aa(i,:).*ff(i-1,:)).*k;
            gg(i,:) = aa(i,:).*gg(i-1,:).*k;
            h = ee(i-1,:).*h;
            m = m + h.*gg(i,:);
            n = n + h.*ff(i,:);
        end
        k = 1./(bb(Js,:) - aa(Js,:).*ee(Js-1,:));
        ee(Js,:) = 0;
        ff(Js,:) = (du(Js,:) + aa(Js,:).*ff(Js-1,:)).*k;
        gg(Js,:) = (aa(Js,:).*gg(Js-1,:) + cc(Js,:)).*k;
        h = ee(Js-1,:).*h + aa(Js+1,:);
        m = m + h.*gg(Js,:);
        n = n + h.*ff(Js,:);
        u(Js+1,:) = (du(Js+1,:) + n)./(bb(Js+1,:) - m);
        for i = Js:-1:1
            u(i,:) = ff(i,:) + ee(i,:).*u(i+1,:) + gg(i,:).*u(Js+1,:);
        end
        
        
        for i = 1:Js+1
            aa(i,:) = w3(3)*stepsize*d*nus*k1_(i,:).*ps_(i,:);
            bb(i,:) = w1(3) + w3(3)*stepsize*(d*nus*k1_(i,:).*(ps_(i,:) + ps_(i+1,:)) + 1/2*dt*k2_(i,:));
            cc(i,:) = w3(3)*stepsize*d*nus*k1_(i,:).*ps_(i+1,:);
        end
        
        cc(1,:) = ~v_s_0_dirichlet_flag*cc(1,:) + v_s_0_neumann_flag*aa(1,:);
        bb(1,:) = v_s_0_dirichlet_flag + ~v_s_0_dirichlet_flag*bb(1,:);
        aa(1,:) = v_s_0_periodic_flag*aa(1,:);
        aa(Js+1,:) = ~v_s_1_dirichlet_flag*aa(Js+1,:) + v_s_1_neumann_flag*cc(Js+1,:);
        bb(Js+1,:) = v_s_1_dirichlet_flag + ~v_s_1_dirichlet_flag*bb(Js+1,:);
        cc(Js+1,:) = v_s_0_periodic_flag*cc(Js+1,:);
        
        ee(1,:) = cc(1,:)./bb(1,:);
        ff(1,:) = dv(1,:)./bb(1,:);
        gg(1,:) = aa(1,:)./bb(1,:);
        h = cc(Js+1,:);
        m = h.*gg(1,:);
        n = h.*ff(1,:);
        for i = 2:Js-1
            k = 1./(bb(i,:) - aa(i,:).*ee(i-1,:));
            ee(i,:) = cc(i,:).*k;
            ff(i,:) = (dv(i,:) + aa(i,:).*ff(i-1,:)).*k;
            gg(i,:) = aa(i,:).*gg(i-1,:).*k;
            h = ee(i-1,:).*h;
            m = m + h.*gg(i,:);
            n = n + h.*ff(i,:);
        end
        k = 1./(bb(Js,:) - aa(Js,:).*ee(Js-1,:));
        ee(Js,:) = 0;
        ff(Js,:) = (dv(Js,:) + aa(Js,:).*ff(Js-1,:)).*k;
        gg(Js,:) = (aa(Js,:).*gg(Js-1,:) + cc(Js,:)).*k;
        h = ee(Js-1,:).*h + aa(Js+1,:);
        m = m + h.*gg(Js,:);
        n = n + h.*ff(Js,:);
        v(Js+1,:) = (dv(Js+1,:) + n)./(bb(Js+1,:) - m);
        for i = Js:-1:1
            v(i,:) = ff(i,:) + ee(i,:).*v(i+1,:) + gg(i,:).*v(Js+1,:);
        end
        
        
        
        if any(any(isnan(u))) || any(any(isnan(v)))
            error('intermediate calculations produced NaN''s');
        end
        
        
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


warning(warningstate);



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
[filename pathname] = uiputfile('rdgc2d.mat', 'Save as...');
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
[filename pathname] = uiputfile('rdgc2d.avi', 'Save movie as...');
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
function boundaryconditions_menu_Callback(hObject, eventdata, handles)
% hObject    handle to boundaryconditions_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function u_r_0_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_r_0_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function u_r_0_dirichlet_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_r_0_dirichlet_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u_r_0_dirichlet_menu, 'Checked', 'on');
set(handles.u_r_0_neumann_menu, 'Checked', 'off');
if isequal(get(handles.u_r_0_periodic_menu, 'Checked'), 'on')
    set(handles.u_r_1_dirichlet_menu, 'Checked', 'on');
end
set([handles.u_r_0_periodic_menu handles.u_r_1_periodic_menu], 'Checked', 'off');



% --------------------------------------------------------------------
function u_r_0_neumann_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_r_0_neumann_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u_r_0_dirichlet_menu, 'Checked', 'off');
set(handles.u_r_0_neumann_menu, 'Checked', 'on');
if isequal(get(handles.u_r_0_periodic_menu, 'Checked'), 'on')
    set(handles.u_r_1_neumann_menu, 'Checked', 'on');
end
set([handles.u_r_0_periodic_menu handles.u_r_1_periodic_menu], 'Checked', 'off');



% --------------------------------------------------------------------
function u_r_0_periodic_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_r_0_periodic_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set([handles.u_r_0_dirichlet_menu handles.u_r_0_neumann_menu ...
     handles.u_r_1_dirichlet_menu handles.u_r_1_neumann_menu], 'Checked', 'off');
set([handles.u_r_0_periodic_menu handles.u_r_1_periodic_menu], 'Checked', 'on');



% --------------------------------------------------------------------
function u_r_1_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_r_1_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function u_r_1_dirichlet_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_r_1_dirichlet_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u_r_1_dirichlet_menu, 'Checked', 'on');
set(handles.u_r_1_neumann_menu, 'Checked', 'off');
if isequal(get(handles.u_r_1_periodic_menu, 'Checked'), 'on')
    set(handles.u_r_0_dirichlet_menu, 'Checked', 'on');
end
set([handles.u_r_0_periodic_menu handles.u_r_1_periodic_menu], 'Checked', 'off');



% --------------------------------------------------------------------
function u_r_1_neumann_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_r_1_neumann_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u_r_1_dirichlet_menu, 'Checked', 'off');
set(handles.u_r_1_neumann_menu, 'Checked', 'on');
if isequal(get(handles.u_r_1_periodic_menu, 'Checked'), 'on')
    set(handles.u_r_0_neumann_menu, 'Checked', 'on');
end
set([handles.u_r_0_periodic_menu handles.u_r_1_periodic_menu], 'Checked', 'off');



% --------------------------------------------------------------------
function u_r_1_periodic_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_r_1_periodic_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set([handles.u_r_0_dirichlet_menu handles.u_r_0_neumann_menu ...
     handles.u_r_1_dirichlet_menu handles.u_r_1_neumann_menu], 'Checked', 'off');
set([handles.u_r_0_periodic_menu handles.u_r_1_periodic_menu], 'Checked', 'on');



% --------------------------------------------------------------------
function u_s_0_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_s_0_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function u_s_0_dirichlet_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_s_0_dirichlet_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u_s_0_dirichlet_menu, 'Checked', 'on');
set(handles.u_s_0_neumann_menu, 'Checked', 'off');
if isequal(get(handles.u_s_0_periodic_menu, 'Checked'), 'on')
    set(handles.u_s_1_dirichlet_menu, 'Checked', 'on');
end
set([handles.u_s_0_periodic_menu handles.u_s_1_periodic_menu], 'Checked', 'off');




% --------------------------------------------------------------------
function u_s_0_neumann_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_s_0_neumann_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u_s_0_dirichlet_menu, 'Checked', 'off');
set(handles.u_s_0_neumann_menu, 'Checked', 'on');
if isequal(get(handles.u_s_0_periodic_menu, 'Checked'), 'on')
    set(handles.u_s_1_neumann_menu, 'Checked', 'on');
end
set([handles.u_s_0_periodic_menu handles.u_s_1_periodic_menu], 'Checked', 'off');



% --------------------------------------------------------------------
function u_s_0_periodic_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_s_0_periodic_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set([handles.u_s_0_dirichlet_menu handles.u_s_0_neumann_menu ...
     handles.u_s_1_dirichlet_menu handles.u_s_1_neumann_menu], 'Checked', 'off');
set([handles.u_s_0_periodic_menu handles.u_s_1_periodic_menu], 'Checked', 'on');



% --------------------------------------------------------------------
function u_s_1_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_s_1_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function u_s_1_dirichlet_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_s_1_dirichlet_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u_s_1_dirichlet_menu, 'Checked', 'on');
set(handles.u_s_1_neumann_menu, 'Checked', 'off');
if isequal(get(handles.u_s_1_periodic_menu, 'Checked'), 'on')
    set(handles.u_s_0_dirichlet_menu, 'Checked', 'on');
end
set([handles.u_s_0_periodic_menu handles.u_s_1_periodic_menu], 'Checked', 'off');



% --------------------------------------------------------------------
function u_s_1_neumann_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_s_1_neumann_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u_s_1_dirichlet_menu, 'Checked', 'off');
set(handles.u_s_1_neumann_menu, 'Checked', 'on');
if isequal(get(handles.u_s_1_periodic_menu, 'Checked'), 'on')
    set(handles.u_s_0_neumann_menu, 'Checked', 'on');
end
set([handles.u_s_0_periodic_menu handles.u_s_1_periodic_menu], 'Checked', 'off');



% --------------------------------------------------------------------
function u_s_1_periodic_menu_Callback(hObject, eventdata, handles)
% hObject    handle to u_s_1_periodic_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set([handles.u_s_0_dirichlet_menu handles.u_s_0_neumann_menu ...
     handles.u_s_1_dirichlet_menu handles.u_s_1_neumann_menu], 'Checked', 'off');
set([handles.u_s_0_periodic_menu handles.u_s_1_periodic_menu], 'Checked', 'on');



% --------------------------------------------------------------------
function v_r_0_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_r_0_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function v_r_0_dirichlet_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_r_0_dirichlet_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v_r_0_dirichlet_menu, 'Checked', 'on');
set(handles.v_r_0_neumann_menu, 'Checked', 'off');
if isequal(get(handles.v_r_0_periodic_menu, 'Checked'), 'on')
    set(handles.v_r_1_dirichlet_menu, 'Checked', 'on');
end
set([handles.v_r_0_periodic_menu handles.v_r_1_periodic_menu], 'Checked', 'off');



% --------------------------------------------------------------------
function v_r_0_neumann_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_r_0_neumann_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v_r_0_dirichlet_menu, 'Checked', 'off');
set(handles.v_r_0_neumann_menu, 'Checked', 'on');
if isequal(get(handles.v_r_0_periodic_menu, 'Checked'), 'on')
    set(handles.v_r_1_neumann_menu, 'Checked', 'on');
end
set([handles.v_r_0_periodic_menu handles.v_r_1_periodic_menu], 'Checked', 'off');



% --------------------------------------------------------------------
function v_r_0_periodic_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_r_0_periodic_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set([handles.v_r_0_dirichlet_menu handles.v_r_0_neumann_menu ...
     handles.v_r_1_dirichlet_menu handles.v_r_1_neumann_menu], 'Checked', 'off');
set([handles.v_r_0_periodic_menu handles.v_r_1_periodic_menu], 'Checked', 'on');



% --------------------------------------------------------------------
function v_r_1_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_r_1_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function v_r_1_dirichlet_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_r_1_dirichlet_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v_r_1_dirichlet_menu, 'Checked', 'on');
set(handles.v_r_1_neumann_menu, 'Checked', 'off');
if isequal(get(handles.v_r_1_periodic_menu, 'Checked'), 'on')
    set(handles.v_r_0_dirichlet_menu, 'Checked', 'on');
end
set([handles.v_r_0_periodic_menu handles.v_r_1_periodic_menu], 'Checked', 'off');



% --------------------------------------------------------------------
function v_r_1_neumann_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_r_1_neumann_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v_r_1_dirichlet_menu, 'Checked', 'off');
set(handles.v_r_1_neumann_menu, 'Checked', 'on');
if isequal(get(handles.v_r_1_periodic_menu, 'Checked'), 'on')
    set(handles.v_r_0_neumann_menu, 'Checked', 'on');
end
set([handles.v_r_0_periodic_menu handles.v_r_1_periodic_menu], 'Checked', 'off');



% --------------------------------------------------------------------
function v_r_1_periodic_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_r_1_periodic_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set([handles.v_r_0_dirichlet_menu handles.v_r_0_neumann_menu ...
     handles.v_r_1_dirichlet_menu handles.v_r_1_neumann_menu], 'Checked', 'off');
set([handles.v_r_0_periodic_menu handles.v_r_1_periodic_menu], 'Checked', 'on');



% --------------------------------------------------------------------
function v_s_0_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_s_0_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function v_s_0_dirichlet_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_s_0_dirichlet_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v_s_0_dirichlet_menu, 'Checked', 'on');
set(handles.v_s_0_neumann_menu, 'Checked', 'off');
if isequal(get(handles.v_s_0_periodic_menu, 'Checked'), 'on')
    set(handles.v_s_1_dirichlet_menu, 'Checked', 'on');
end
set([handles.v_s_0_periodic_menu handles.v_s_1_periodic_menu], 'Checked', 'off');




% --------------------------------------------------------------------
function v_s_0_neumann_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_s_0_neumann_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v_s_0_dirichlet_menu, 'Checked', 'off');
set(handles.v_s_0_neumann_menu, 'Checked', 'on');
if isequal(get(handles.v_s_0_periodic_menu, 'Checked'), 'on')
    set(handles.v_s_1_neumann_menu, 'Checked', 'on');
end
set([handles.v_s_0_periodic_menu handles.v_s_1_periodic_menu], 'Checked', 'off');



% --------------------------------------------------------------------
function v_s_0_periodic_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_s_0_periodic_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set([handles.v_s_0_dirichlet_menu handles.v_s_0_neumann_menu ...
     handles.v_s_1_dirichlet_menu handles.v_s_1_neumann_menu], 'Checked', 'off');
set([handles.v_s_0_periodic_menu handles.v_s_1_periodic_menu], 'Checked', 'on');



% --------------------------------------------------------------------
function v_s_1_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_s_1_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function v_s_1_dirichlet_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_s_1_dirichlet_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v_s_1_dirichlet_menu, 'Checked', 'on');
set(handles.v_s_1_neumann_menu, 'Checked', 'off');
if isequal(get(handles.v_s_1_periodic_menu, 'Checked'), 'on')
    set(handles.v_s_0_dirichlet_menu, 'Checked', 'on');
end
set([handles.v_s_0_periodic_menu handles.v_s_1_periodic_menu], 'Checked', 'off');



% --------------------------------------------------------------------
function v_s_1_neumann_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_s_1_neumann_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v_s_1_dirichlet_menu, 'Checked', 'off');
set(handles.v_s_1_neumann_menu, 'Checked', 'on');
if isequal(get(handles.v_s_1_periodic_menu, 'Checked'), 'on')
    set(handles.v_s_0_neumann_menu, 'Checked', 'on');
end
set([handles.v_s_0_periodic_menu handles.v_s_1_periodic_menu], 'Checked', 'off');



% --------------------------------------------------------------------
function v_s_1_periodic_menu_Callback(hObject, eventdata, handles)
% hObject    handle to v_s_1_periodic_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set([handles.v_s_0_dirichlet_menu handles.v_s_0_neumann_menu ...
     handles.v_s_1_dirichlet_menu handles.v_s_1_neumann_menu], 'Checked', 'off');
set([handles.v_s_0_periodic_menu handles.v_s_1_periodic_menu], 'Checked', 'on');



% --------------------------------------------------------------------
function plotting_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotting_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function rs_space_menu_Callback(hObject, eventdata, handles)
% hObject    handle to rs_space_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'off')
    set(hObject, 'Checked', 'on');
    set(handles.xyz_space_menu, 'Checked', 'off');
end
refreshframe;



% --------------------------------------------------------------------
function xyz_space_menu_Callback(hObject, eventdata, handles)
% hObject    handle to xyz_space_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'off')
    set(hObject, 'Checked', 'on');
    set(handles.rs_space_menu, 'Checked', 'off');
end
refreshframe;



% --------------------------------------------------------------------
function plotu_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set(hObject, 'Checked', 'off');
    set(handles.plotv_menu, 'Checked', 'on');
else
    set(hObject, 'Checked', 'on');
    set(handles.plotv_menu, 'Checked', 'off');
end
refreshframe;



% --------------------------------------------------------------------
function plotv_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set(hObject, 'Checked', 'off');
    set(handles.plotu_menu, 'Checked', 'on');
else
    set(hObject, 'Checked', 'on');
    set(handles.plotu_menu, 'Checked', 'off');
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

set(handles.axislimits_radiobutton, 'Value', get(handles.axislimits_radiobutton, 'Max'));
set(handles.fitplot_radiobutton, 'Value', get(handles.fitplot_radiobutton, 'Min'));
axes(handles.axes);
axislim = axis;
set(handles.axislimits_textbox, 'Enable', 'on', ...
    'Value', axislim, 'String', mat2str(axislim));



% --------------------------------------------------------------------
function equalaxis_menu_Callback(hObject, eventdata, handles)
% hObject    handle to equalaxis_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set(hObject, 'Checked', 'off')
else
    set(hObject, 'Checked', 'on')
end
refreshframe;



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
    case {'axislimits'}
        b = (isequal(size(value),[1 6]) && all(~isnan(value)) && all(isreal(value)) && ...
            value(1) < value(2) && value(3) < value(4) && value(5) < value(6)) || ...
            (isequal(size(value),[1 4]) && all(~isnan(value)) && all(isreal(value)) && ...
            value(1) < value(2) && value(3) < value(4));
    case {'integer' 'randomseed'}
        b = isequal(size(value),[1 1]) && ~isnan(value) && isreal(value) && mod(value,1) == 0;
    case {'Jr' 'Js'}
        b = isequal(size(value),[1 1]) && ~isnan(value) && isreal(value) && mod(value,1) == 0 && value > 2;
    case {'nonnegativereal' 'd' 'gamma_' 'time' 'uthreshold' 'vthreshold'}
        b = isequal(size(value),[1 1]) && ~isnan(value) && isreal(value) && value >= 0;
    case {'nonnegativeinteger' 'nsteps' 'step'}
        b = isequal(size(value),[1 1]) && ~isnan(value) && isreal(value) && mod(value,1) == 0 && value >= 0;
    case {'positiveinteger' 'displaystep'}
        b = isequal(size(value),[1 1]) && ~isnan(value) && isreal(value) && mod(value,1) == 0 && value > 0;
    case {'positivereal' 'dt' 'dr' 'ds' 'maxchange' 'maxperturbation'}
        b = isequal(size(value),[1 1]) && ~isnan(value) && isreal(value) && value > 0;
    case {'real' 'azimuthangle' 'elevationangle'}
        b = isequal(size(value),[1 1]) && ~isnan(value) && isreal(value);
    case {'value1' 'value2' 'value3' 'value4' 'value5'}
        b = isequal(size(value),[1 1]) && ~isnan(value);
    otherwise
        b = false;
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
    handles = guidata(gcbf);
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
t = frame*data.displaystep*data.dt;
set([handles.step_textbox handles.time_textbox], ...
    {'Value' 'String'}, ...
    {step int2str(step) ; t num2str(t,8)});
set(handles.status_textbox, 'String', ['Plotting frame ' int2str(frame) '...']);
drawnow;

if isequal(get(handles.mesh_menu, 'Checked'), 'on')
    plotfunction = @mesh;
else
    plotfunction = @surf;
end

if isequal(get(handles.plotu_menu, 'Checked'), 'on')
    plotdata = squeeze(data.U(frame+1,:,:));
    threshold = repmat(get(handles.uthreshold_textbox, 'Value'), [data.Js+1 data.Jr+1]);
    if get(handles.uthreshold_checkbox, 'Value') == get(handles.uthreshold_checkbox, 'Min') ...
            || isempty(threshold)
        threshold = data.U0;
    end
else
    plotdata = squeeze(data.V(frame+1,:,:));
    threshold = repmat(get(handles.vthreshold_textbox, 'Value'), [data.Js+1 data.Jr+1]);
    if get(handles.vthreshold_checkbox, 'Value') == get(handles.vthreshold_checkbox, 'Min') ...
            || isempty(threshold)
        threshold = data.V0;
    end
end

if isequal(get(handles.cliffplot_menu, 'Checked'), 'on')
    plotdata = (plotdata > threshold)+0;
end

cla;
hold off;

r = data.r;
s = data.s;
if isequal(get(handles.rs_space_menu, 'Checked'), 'on')
    warningstate = warning('off', 'all');
    feval(plotfunction, r, s, plotdata);
    warning(warningstate);
    xlabel('r');
    ylabel('s');
else
    Z = zeros([data.Js+1 data.Jr+1]);
    rho_ = eval(data.rho);
    warningstate = warning('off', 'all');
    feval(plotfunction, rho_.*eval(vectorize(data.x))+Z, ...
                        rho_.*eval(vectorize(data.y))+Z, ...
                        rho_.*eval(vectorize(data.z))+Z, plotdata);
    warning(warningstate);
    xlabel('x');
    ylabel('y');
    zlabel('z');
end

if isequal(get(handles.equalaxis_menu, 'Checked'), 'on')
    axis equal;
else
    axis tight;
end
caxis('auto');

if get(handles.axislimits_radiobutton, 'Value') == get(handles.axislimits_radiobutton, 'Max')
    axislimits = get(handles.axislimits_textbox, 'Value');
    if ~isempty(axislimits)
        axis(axislimits);
        if length(axislimits) == 6 && isequal(get(handles.rs_space_menu, 'Checked'), 'on')
            caxis(axislimits(5:6));
        end
    end
end

view(3);
azimuthangle = get(handles.azimuthangle_textbox, 'Value');
elevationangle = get(handles.elevationangle_textbox, 'Value');
if ~isempty(azimuthangle) && ~isempty(elevationangle)
    view(azimuthangle, elevationangle);
end

setcolormap;

shadings = {'faceted' 'flat' 'interp'};
for i = 1:length(shadings)
    if isequal(get(eval(['handles.' shadings{i} '_shading_menu']), 'Checked'), 'on')
        shading(shadings{i});
    end
end

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
    
    vars = {'gamma_' 'd' 'Jr' 'dr' 'Js' 'ds' 'dt' 'displaystep' ...
            'value1' 'value2' 'value3' 'value4' 'value5' ...
            'maxperturbation' 'randomseed' 'nsteps' 'maxchange' ...
            'uthreshold' 'vthreshold'};
    for i = 1:length(vars)
        set(eval(['handles.' vars{i} '_textbox']), ...
            'Value', eval(['data.' vars{i}]), ...
            'String', num2str(eval(['data.' vars{i}]),8));
    end
    vars = {'param1' 'param2' 'param3' 'param4' 'param5' ...
            'x' 'y' 'z' 'rho' 'f' 'g' 'u0' 'v0'};
    for i = 1:length(vars)
        set(eval(['handles.' vars{i} '_textbox']), 'String', eval(['data.' vars{i}]));
    end
    vars = {'u_r_0_dirichlet' 'u_r_0_neumann' 'u_r_0_periodic' ...
            'u_r_1_dirichlet' 'u_r_1_neumann' 'u_r_1_periodic' ...
            'u_s_0_dirichlet' 'u_s_0_neumann' 'u_s_0_periodic' ...
            'u_s_1_dirichlet' 'u_s_1_neumann' 'u_s_1_periodic' ...
            'v_r_0_dirichlet' 'v_r_0_neumann' 'v_r_0_periodic' ...
            'v_r_1_dirichlet' 'v_r_1_neumann' 'v_r_1_periodic' ...
            'v_s_0_dirichlet' 'v_s_0_neumann' 'v_s_0_periodic' ...
            'v_s_1_dirichlet' 'v_s_1_neumann' 'v_s_1_periodic'};
    for i = 1:length(vars)
        if eval(['data.' vars{i} '_flag'])
            set(eval(['handles.' vars{i} '_menu']), 'Checked', 'on');
        else
            set(eval(['handles.' vars{i} '_menu']), 'Checked', 'off');
        end
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

