function varargout = rdg1dgui(varargin)
% RDG1DGUI M-file for rdg1dgui.fig
%      RDG1DGUI, by itself, creates a new RDG1DGUI or raises the existing
%      singleton*.
%
%      H = RDG1DGUI returns the handle to a new RDG1DGUI or the handle to
%      the existing singleton*.
%
%      RDG1DGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RDG1DGUI.M with the given input arguments.
%
%      RDG1DGUI('Property','Value',...) creates a new RDG1DGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rdg1dgui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rdg1dgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rdg1dgui

% Last Modified by GUIDE v2.5 30-Aug-2003 20:57:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rdg1dgui_OpeningFcn, ...
                   'gui_OutputFcn',  @rdg1dgui_OutputFcn, ...
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


% --- Executes just before rdg1dgui is made visible.
function rdg1dgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rdg1dgui (see VARARGIN)

data.buildnew = true;

vars = {'gamma_' 'd' 'J' 'ds' 'dt' 'nu' 'displaystep' ...
        'value1' 'value2' 'value3' 'value4' 'value5' ...
        'maxperturbation' 'randomseed' 'nsteps' 'maxchange' ...
        's' 'U0' 'V0' 'U' 'V'};
for i = 1:length(vars)
    eval(['data.' vars{i} ' = [];']);
end
vars = {'param1' 'param2' 'param3' 'param4' 'param5' ...
        'f' 'g' 'u0' 'v0' 'rho'};
for i = 1:length(vars)
    eval(['data.' vars{i} ' = '''';']);
end
vars = {'u0t' 'us0t' 'u1t' 'us1t' 'u0tu1t' ...
        'v0t' 'vs0t' 'v1t' 'vs1t' 'v0tv1t' ...
        'maxperturbation' 'randomseed' 'nsteps' 'maxchange'};
for i = 1:length(vars)
    eval(['data.' vars{i} '_flag = false;']);
end

setappdata(hObject, 'data', data);

% Choose default command line output for rdg1dgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rdg1dgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rdg1dgui_OutputFcn(hObject, eventdata, handles)
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
        nu = min([1 1/d]);
        set(handles.nu_textbox, 'Value', nu, 'String', num2str(nu,8));
        ds = get(handles.ds_textbox, 'Value');
        if ~isempty(ds)
            dt = nu*ds^2;
        else
            dt = get(handles.dt_textbox, 'Value');
            if ~isempty(dt)
                ds = sqrt(dt/nu);
                J = max([ceil(1/ds) 3]);
                ds = 1/J;
                set([handles.J_textbox handles.ds_textbox], ...
                    {'Value' 'String'}, ...
                    {J int2str(J) ; ds num2str(ds,8)});
            end
        end
        set(handles.dt_textbox, 'Value', dt, 'String', num2str(dt,8));
    end
else
    set([hObject handles.nu_textbox], 'Value', [], 'String', '');
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
%    J =      ________
%    ds =     ________
%    dt =     ________
%    nu =     ________
%    rho(t) = ________
%
%--------------------------------------------------------------------------



% --- Executes during object creation, after setting all properties.
function J_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to J_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function J_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to J_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of J_textbox as text
%        str2double(get(hObject,'String')) returns contents of J_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('J', string)
    J = str2num(string);
    ds = 1/J;
    dt = get(handles.dt_textbox, 'Value');
    nu = get(handles.nu_textbox, 'Value');
    if isequal(get(handles.forcemaximumprinciplecondition_menu, 'Checked'), 'off')
        if ~isempty(dt)
            nu = dt/ds^2;
        end
    elseif ~isempty(nu)
        dt = nu*ds^2;
    end
    set([handles.J_textbox handles.ds_textbox handles.dt_textbox handles.nu_textbox], ...
        {'Value' 'String'}, ...
        {J int2str(J) ; ds num2str(ds,8) ; dt num2str(dt,8) ; nu num2str(nu,8)});
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('J must evaluate to an integer greater than 2', 'error', 'modal'));
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
    J = max([ceil(1/ds) 3]);
    ds = 1/J;
    dt = get(handles.dt_textbox, 'Value');
    nu = get(handles.nu_textbox, 'Value');
    if isequal(get(handles.forcemaximumprinciplecondition_menu, 'Checked'), 'off')
        if ~isempty(dt)
            nu = dt/ds^2;
        end
    elseif ~isempty(nu)
        dt = nu*ds^2;
    end
    set([handles.J_textbox handles.ds_textbox handles.dt_textbox handles.nu_textbox], ...
        {'Value' 'String'}, ...
        {J int2str(J) ; ds num2str(ds,8) ; dt num2str(dt,8) ; nu num2str(nu,8)});
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('ds must evaluate to a nonnegative real', 'error', 'modal'));
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
    ds = get(handles.ds_textbox, 'Value');
    nu = get(handles.nu_textbox, 'Value');
    if isequal(get(handles.forcemaximumprinciplecondition_menu, 'Checked'), 'off') && ...
        ~isempty(ds)
        nu = dt/ds^2;
    elseif ~isempty(nu)
        ds = sqrt(dt/nu);
        J = max([ceil(1/ds) 3]);
        ds = 1/J;
        dt = nu*ds^2;
        set([handles.J_textbox handles.ds_textbox], ...
            {'Value' 'String'}, ...
            {J int2str(J) ; ds num2str(ds,8)});
    end
    set([handles.dt_textbox handles.nu_textbox], ...
        {'Value' 'String'}, ...
        {dt num2str(dt,8) ; nu num2str(nu,8)});
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('dt must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



% --- Executes during object creation, after setting all properties.
function nu_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nu_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function nu_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to nu_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nu_textbox as text
%        str2double(get(hObject,'String')) returns contents of nu_textbox as a double

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

string = get(hObject, 'String');
if ~isempty(string) && isvalid('nu', string)
    nu = str2num(string);
    ds = get(handles.ds_textbox, 'Value');
    dt = get(handles.dt_textbox, 'Value');
    if ~isempty(ds)
        dt = nu*ds^2;
    elseif ~isempty(dt)
        ds = sqrt(dt/nu);
        J = max([ceil(1/ds) 3]);
        ds = 1/J;
        dt = nu*ds^2;
        set([handles.J_textbox handles.ds_textbox], ...
            {'Value' 'String'}, ...
            {J int2str(J) ; ds num2str(ds,8)});
    end
    set([handles.dt_textbox handles.nu_textbox], ...
        {'Value' 'String'}, ...
        {dt num2str(dt,8) ; nu num2str(nu,8)});
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('nu must evaluate to a positive real', 'error', 'modal'));
    end
end



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
%    ( ) u(0,t) = 0  ( ) us(0,t) = 0
%    ( ) u(1,t) = 0  ( ) us(1,t) = 0
%    ( ) v(0,t) = 0  ( ) vs(0,t) = 0
%    ( ) v(1,t) = 0  ( ) vs(1,t) = 0
%
%--------------------------------------------------------------------------



% --- Executes on button press in u0t_radiobutton.
function u0t_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to u0t_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of u0t_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u0t_radiobutton, 'Value', get(handles.u0t_radiobutton, 'Max'));
set(handles.us0t_radiobutton, 'Value', get(handles.us0t_radiobutton, 'Min'));
if get(handles.u0tu1t_radiobutton, 'Value') == get(handles.u0tu1t_radiobutton, 'Max')
    set(handles.u1t_radiobutton, 'Value', get(handles.u1t_radiobutton, 'Max'));
end
set(handles.u0tu1t_radiobutton, 'Value', get(handles.u0tu1t_radiobutton, 'Min'));



% --- Executes on button press in us0t_radiobutton.
function us0t_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to us0t_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of us0t_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u0t_radiobutton, 'Value', get(handles.u0t_radiobutton, 'Min'));
set(handles.us0t_radiobutton, 'Value', get(handles.us0t_radiobutton, 'Max'));
if get(handles.u0tu1t_radiobutton, 'Value') == get(handles.u0tu1t_radiobutton, 'Max')
    set(handles.us1t_radiobutton, 'Value', get(handles.us1t_radiobutton, 'Max'));
end
set(handles.u0tu1t_radiobutton, 'Value', get(handles.u0tu1t_radiobutton, 'Min'));



% --- Executes on button press in u1t_radiobutton.
function u1t_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to u1t_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of u1t_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u1t_radiobutton, 'Value', get(handles.u1t_radiobutton, 'Max'));
set(handles.us1t_radiobutton, 'Value', get(handles.us1t_radiobutton, 'Min'));
if get(handles.u0tu1t_radiobutton, 'Value') == get(handles.u0tu1t_radiobutton, 'Max')
    set(handles.u0t_radiobutton, 'Value', get(handles.u0t_radiobutton, 'Max'));
end
set(handles.u0tu1t_radiobutton, 'Value', get(handles.u0tu1t_radiobutton, 'Min'));



% --- Executes on button press in us1t_radiobutton.
function us1t_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to us1t_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of us1t_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u1t_radiobutton, 'Value', get(handles.u1t_radiobutton, 'Min'));
set(handles.us1t_radiobutton, 'Value', get(handles.us1t_radiobutton, 'Max'));
if get(handles.u0tu1t_radiobutton, 'Value') == get(handles.u0tu1t_radiobutton, 'Max')
    set(handles.us0t_radiobutton, 'Value', get(handles.us0t_radiobutton, 'Max'));
end
set(handles.u0tu1t_radiobutton, 'Value', get(handles.u0tu1t_radiobutton, 'Min'));



% --- Executes on button press in u0tu1t_radiobutton.
function u0tu1t_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to u0tu1t_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of u0tu1t_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.u0tu1t_radiobutton, 'Value', get(handles.u0tu1t_radiobutton, 'Max'));
set(handles.u0t_radiobutton, 'Value', get(handles.u0t_radiobutton, 'Min'));
set(handles.us0t_radiobutton, 'Value', get(handles.us0t_radiobutton, 'Min'));
set(handles.u1t_radiobutton, 'Value', get(handles.u1t_radiobutton, 'Min'));
set(handles.us1t_radiobutton, 'Value', get(handles.us1t_radiobutton, 'Min'));



% --- Executes on button press in v0t_radiobutton.
function v0t_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to v0t_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of v0t_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v0t_radiobutton, 'Value', get(handles.v0t_radiobutton, 'Max'));
set(handles.vs0t_radiobutton, 'Value', get(handles.vs0t_radiobutton, 'Min'));
if get(handles.v0tv1t_radiobutton, 'Value') == get(handles.v0tv1t_radiobutton, 'Max')
    set(handles.v1t_radiobutton, 'Value', get(handles.v1t_radiobutton, 'Max'));
end
set(handles.v0tv1t_radiobutton, 'Value', get(handles.v0tv1t_radiobutton, 'Min'));



% --- Executes on button press in vs0t_radiobutton.
function vs0t_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to vs0t_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vs0t_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v0t_radiobutton, 'Value', get(handles.v0t_radiobutton, 'Min'));
set(handles.vs0t_radiobutton, 'Value', get(handles.vs0t_radiobutton, 'Max'));
if get(handles.v0tv1t_radiobutton, 'Value') == get(handles.v0tv1t_radiobutton, 'Max')
    set(handles.vs1t_radiobutton, 'Value', get(handles.vs1t_radiobutton, 'Max'));
end
set(handles.v0tv1t_radiobutton, 'Value', get(handles.v0tv1t_radiobutton, 'Min'));



% --- Executes on button press in v1t_radiobutton.
function v1t_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to v1t_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of v1t_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v1t_radiobutton, 'Value', get(handles.v1t_radiobutton, 'Max'));
set(handles.vs1t_radiobutton, 'Value', get(handles.vs1t_radiobutton, 'Min'));
if get(handles.v0tv1t_radiobutton, 'Value') == get(handles.v0tv1t_radiobutton, 'Max')
    set(handles.v0t_radiobutton, 'Value', get(handles.v0t_radiobutton, 'Max'));
end
set(handles.v0tv1t_radiobutton, 'Value', get(handles.v0tv1t_radiobutton, 'Min'));



% --- Executes on button press in vs1t_radiobutton.
function vs1t_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to vs1t_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vs1t_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v1t_radiobutton, 'Value', get(handles.v1t_radiobutton, 'Min'));
set(handles.vs1t_radiobutton, 'Value', get(handles.vs1t_radiobutton, 'Max'));
if get(handles.v0tv1t_radiobutton, 'Value') == get(handles.v0tv1t_radiobutton, 'Max')
    set(handles.vs0t_radiobutton, 'Value', get(handles.vs0t_radiobutton, 'Max'));
end
set(handles.v0tv1t_radiobutton, 'Value', get(handles.v0tv1t_radiobutton, 'Min'));



% --- Executes on button press in v0tv1t_radiobutton.
function v0tv1t_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to v0tv1t_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of v0tv1t_radiobutton

data = getappdata(gcbf, 'data');
data.buildnew = true;
setappdata(gcbf, 'data', data);

set(handles.v0tv1t_radiobutton, 'Value', get(handles.v0tv1t_radiobutton, 'Max'));
set(handles.v0t_radiobutton, 'Value', get(handles.v0t_radiobutton, 'Min'));
set(handles.vs0t_radiobutton, 'Value', get(handles.vs0t_radiobutton, 'Min'));
set(handles.v1t_radiobutton, 'Value', get(handles.v1t_radiobutton, 'Min'));
set(handles.vs1t_radiobutton, 'Value', get(handles.vs1t_radiobutton, 'Min'));



%--------------------------------------------------------------------------
%
%  Plotting
%    [ ] Run for at most ________ steps
%    [ ] Run until max change < ________
%    Display/save every ________ th step
%    ( ) Fixed Axis, y = ________
%    ( ) Fit plot     to ________
%    Azimuth angle   = ________
%    Elevation angle = ________
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



% --- Executes on button press in ylimits_radiobutton.
function ylimits_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to ylimits_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ylimits_radiobutton

set(handles.ylimits_radiobutton, 'Value', get(handles.ylimits_radiobutton, 'Max'));
set(handles.fitplot_radiobutton, 'Value', get(handles.fitplot_radiobutton, 'Min'));
set([handles.ymin_textbox handles.ymax_textbox], 'Enable', 'on');
refreshframe;



% --- Executes during object creation, after setting all properties.
function ymin_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ymin_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ymin_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to ymin_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ymin_textbox as text
%        str2double(get(hObject,'String')) returns contents of ymin_textbox as a double

string = get(hObject, 'String');
if ~isempty(string) && isvalid('ymin', string)
    ymin = str2num(string);
    set(hObject, 'Value', ymin);
    ymax = get(handles.ymax_textbox, 'Value');
    if ~isempty(ymax) && ymax <= ymin
        set(handles.ymax_textbox, 'Value', [], 'String', '');
        uiwait(errordlg('ymin must be strictly less than ymax', 'error', 'modal'));
    end
    refreshframe;
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('ymin must evaluate to a nonnegative real', 'error', 'modal'));
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

string = get(hObject, 'String');
if ~isempty(string) && isvalid('ymax', string)
    ymax = str2num(string);
    set(hObject, 'Value', ymax);
    ymin = get(handles.ymin_textbox, 'Value');
    if ~isempty(ymin) && ymax <= ymin
        set(handles.ymin_textbox, 'Value', [], 'String', '');
        uiwait(errordlg('ymin must be strictly less than ymax', 'error', 'modal'));
    end
    refreshframe;
else
    set(hObject, 'Value', [], 'String', '');
    if ~isempty(string)
        uiwait(errordlg('ymax must evaluate to a nonnegative real', 'error', 'modal'));
    end
end



% --- Executes on button press in fitplot_radiobutton.
function fitplot_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to fitplot_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fitplot_radiobutton

set(handles.ylimits_radiobutton, 'Value', get(handles.ylimits_radiobutton, 'Min'));
set(handles.fitplot_radiobutton, 'Value', get(handles.fitplot_radiobutton, 'Max'));
set([handles.ymin_textbox handles.ymax_textbox], 'Enable', 'off');
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

vars = {'f' 'g' 'u0' 'v0' 'rho'};
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

vars = {'gamma_' 'd' 'J' 'ds' 'dt' 'nu' 'displaystep'};
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

vars = {'u0t' 'us0t' 'u1t' 'us1t' 'u0tu1t' ...
        'v0t' 'vs0t' 'v1t' 'vs1t' 'v0tv1t'};
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


try
    t = sym('t', 'positive');
    k1 = vectorize(char(simplify(sym(1/eval(rho)^2))));
    k2 = vectorize(char(simplify(diff(log(eval(rho)), t))));
    k1 = regexprep(k1, '\<signum\>', 'sign');
    k2 = regexprep(k2, '\<signum\>', 'sign');
catch
    uiwait(errordlg({['error evaluating or differentiating ' rho] 'unable to begin build'}, 'error', 'modal'));
    set(handles.status_textbox, 'String', 'Ready');
    return;
end


if data.buildnew
    s = 0:ds:1;
    
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
            u = repmat(u(1), [1 J+1]);
            v = repmat(v(1), [1 J+1]);
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
                if ~isequal(size(u), [1 J+1])
                    u = u(imag(u) == 0);
                    if length(u) > 1
                        u = u(u >= 0);
                    end
                    u = repmat(u(1), [1 J+1]);
                end
            catch
                error(['error evaluating u0 = ' u0]);
            end
            try
                v = eval(vectorize(v0));
                if ~isequal(size(v), [1 J+1])
                    v = v(imag(v) == 0);
                    if length(v) > 1
                        v = v(v >= 0);
                    end
                    v = repmat(v(1), [1 J+1]);
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
        u = u + maxperturbation*(2*rand([1 J+1]) - 1);
        v = v + maxperturbation*(2*rand([1 J+1]) - 1);
    end
    
    data.s = s;
    data.U = u;
    data.V = v;
    step = 0;
    
else
    s = data.s;
    u = data.U(end,:);
    v = data.V(end,:);
    step = (length(data.U(:,1)) - 1)*displaystep;
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

Z = zeros([1 J+1]);

du = Z;
dv = Z;
ee = Z;
ff = Z;
fu = Z;
gv = Z;
lu = Z;
lv = Z;
uu = Z;
vv = Z;

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
        k1_ = eval(k1);
    catch
        error(['error evaluating k1 = ' k1 ' at t = ' num2str(t,8) ', step ' int2str(step)]);
    end
    try
        k2_ = eval(k2);
    catch
        error(['error evaluating k2 = ' k2 ' at t = ' num2str(t,8) ', step ' int2str(step)]);
    end
    
    
    while step < nsteps && get(handles.hold_pushbutton, 'Value') == 0.0
        
        set(handles.status_textbox, 'String', ['Calculating step ' int2str(step+1) '...']);
        drawnow;
        
        
        du = stepsize*w3(1)*lu;
        for j = 2:J
            lu(j) = u(j-1) - 2*u(j) + u(j+1);
        end
        lu(1) = (us0t_flag*u(2) + u0tu1t_flag*u(J+1)) - 2*u(1) + u(2);
        lu(J+1) = u(J) - 2*u(J+1) + (us1t_flag*u(J) + u0tu1t_flag*u(1));
        lu = k1_*nu*lu - k2_*dt*u;
        if w1(1) ~= 0
            du = du - w1(1)*uu;
        end
        du = du - w1(2)*u + stepsize*w3(2)*lu;
        if cnlf_flag || sbdfcn2_flag
            uu = u;
        end
        if w2(1) ~= 0
            du = du + stepsize*dt*gamma_*w2(1)*fu;
        end
        try
            fu = eval(f);
        catch
            error(['error evaluating f = ' f ' at step ' num2str(step,8)]);
        end
        du = du + stepsize*dt*gamma_*w2(2)*fu;
        if stepsize < 1 && mod(step,1) == 0
            lu_initial = lu;
            fu_initial = fu;
            uu_initial = uu;
        end
        du(1) = ~u0t_flag*du(1);
        du(J+1) = ~u1t_flag*du(J+1);
        
        
        dv = stepsize*w3(1)*lv;
        for j = 2:J
            lv(j) = v(j-1) - 2*v(j) + v(j+1);
        end
        lv(1) = (vs0t_flag*v(2) + v0tv1t_flag*v(J+1)) - 2*v(1) + v(2);
        lv(J+1) = v(J) - 2*v(J+1) + (vs1t_flag*v(J) + v0tv1t_flag*v(1));
        lv = d*k1_*nu*lv - k2_*dt*v;
        if w1(1) ~= 0
            dv = dv - w1(1)*vv;
        end
        dv = dv - w1(2)*v + stepsize*w3(2)*lv;
        if cnlf_flag || sbdfcn2_flag
            vv = v;
        end
        if w2(1) ~= 0
            dv = dv + stepsize*dt*gamma_*w2(1)*gv;
        end
        try
            gv = eval(g);
        catch
            error(['error evaluating g = ' g ' at step ' int2str(step)]);
        end
        dv = dv + stepsize*dt*gamma_*w2(2)*gv;
        if stepsize < 1 && mod(step,1) == 0
            lv_initial = lv;
            gv_initial = gv;
            vv_initial = vv;
        end
        dv(1) = ~v0t_flag*dv(1);
        dv(J+1) = ~v1t_flag*dv(J+1);
        
        
        step = step + stepsize;
        t = step*dt;
        try
            k1_ = eval(k1);
        catch
            error(['error evaluating k1 = ' k1 ' at t = ' num2str(t,8) ', step ' int2str(step)]);
        end
        try
            k2_ = eval(k2);
        catch
            error(['error evaluating k2 = ' k2 ' at t = ' num2str(t,8) ', step ' int2str(step)]);
        end
        
        
        a = w3(3)*stepsize*k1_*nu;
        b = w1(3) + w3(3)*stepsize*(2*k1_*nu + dt*k2_);
        c = w3(3)*stepsize*k1_*nu;
        a1 = u0tu1t_flag*a;
        b1 = u0t_flag + ~u0t_flag*b;
        c1 = ~u0t_flag*c + us0t_flag*a;
        aJ1 = ~u1t_flag*a + us1t_flag*c;
        bJ1 = u1t_flag + ~u1t_flag*b;
        cJ1 = u0tu1t_flag*c;
        
        ee(1) = c1/b1;
        ff(1) = du(1)/b1;
        gg(1) = a1/b1;
        h = cJ1;
        m = h*gg(1);
        n = h*ff(1);
        for j = 2:J-1
            k = 1/(b - a*ee(j-1));
            ee(j) = c*k;
            ff(j) = (du(j) + a*ff(j-1))*k;
            gg(j) = a*gg(j-1)*k;
            h = ee(j-1)*h;
            m = m + gg(j)*h;
            n = n + ff(j)*h;
        end
        k = 1/(b - a*ee(J-1));
        ee(J) = 0;
        ff(J) = (du(J) + a*ff(J-1))*k;
        gg(J) = (a*gg(J-1) + c)*k;
        h = ee(J-1)*h + aJ1;
        m = m + gg(J)*h;
        n = n + ff(J)*h;
        u(J+1) = (du(J+1) + n)/(bJ1 - m);
        for j = J:-1:1
            u(j) = ff(j) + ee(j)*u(j+1) + gg(j)*u(J+1);
        end
        
        
        a = w3(3)*stepsize*d*k1_*nu;
        b = w1(3) + w3(3)*stepsize*(2*d*k1_*nu + dt*k2_);
        c = w3(3)*stepsize*d*k1_*nu;
        a1 = v0tv1t_flag*a;
        b1 = v0t_flag + ~v0t_flag*b;
        c1 = ~v0t_flag*c + vs0t_flag*a;
        aJ1 = ~v1t_flag*a + vs1t_flag*c;
        bJ1 = v1t_flag + ~v1t_flag*b;
        cJ1 = v0tv1t_flag*c;
        
        ee(1) = c1/b1;
        ff(1) = dv(1)/b1;
        gg(1) = a1/b1;
        h = cJ1;
        m = h*gg(1);
        n = h*ff(1);
        for j = 2:J-1
            k = 1/(b - a*ee(j-1));
            ee(j) = c*k;
            ff(j) = (dv(j) + a*ff(j-1))*k;
            gg(j) = a*gg(j-1)*k;
            h = ee(j-1)*h;
            m = m + gg(j)*h;
            n = n + ff(j)*h;
        end
        k = 1/(b - a*ee(J-1));
        ee(J) = 0;
        ff(J) = (dv(J) + a*ff(J-1))*k;
        gg(J) = (a*gg(J-1) + c)*k;
        h = ee(J-1)*h + aJ1;
        m = m + gg(J)*h;
        n = n + ff(J)*h;
        v(J+1) = (dv(J+1) + n)/(bJ1 - m);
        for j = J:-1:1
            v(j) = ff(j) + ee(j)*v(j+1) + gg(j)*v(J+1);
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
        
        
        if mod(step,1) == stepsize
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
        
        
        if mod(step, displaystep) == 0
            data = getappdata(gcbf, 'data');
            data.U(end+1,:) = u;
            data.V(end+1,:) = v;
            setappdata(gcbf, 'data', data);
            axes(handles.axes);
            plotuv(step/displaystep);
            plotcolorbar;
            if maxchange_flag && max([max(abs(u-data.U(end,:))) max(abs(v-data.V(end,:)))]) < maxchange
                nsteps = 0;
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
if length(data.U) < 1
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
    for j = 1:length(data.U(:,1))
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
    loadbuild('empty.mat');
    disablemovie;
catch
end



% --------------------------------------------------------------------
function default_menu_Callback(hObject, eventdata, handles)
% hObject    handle to default_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    loadbuild('default.mat');
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
    set(handles.nu_textbox, 'Enable', 'on');
else
    set(hObject, 'Checked', 'on');
    set(handles.nu_textbox, 'Enable', 'off');
    d = get(handles.d_textbox, 'Value');
    if ~isempty(d)
        nu = min([1 1/d]);
        set(handles.nu_textbox, 'Value', nu, 'String', num2str(nu,8));
        ds = get(handles.ds_textbox, 'Value');
        if ~isempty(ds)
            dt = nu*ds^2;
        else
            dt = get(handles.dt_textbox, 'Value');
            if ~isempty(dt)
                ds = sqrt(dt/nu);
                J = max([ceil(1/ds) 3]);
                ds = 1/J;
                dt = nu*ds^2;
                set([handles.J_textbox handles.ds_textbox], ...
                    {'Value' 'String'}, ...
                    {J int2str(J) ; ds num2str(ds,8)});
            end
        end
        set(handles.dt_textbox, 'Value', dt, 'String', num2str(dt,8));
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
function sy_space_menu_Callback(hObject, eventdata, handles)
% hObject    handle to sy_space_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setspacemenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function sty_space_menu_Callback(hObject, eventdata, handles)
% hObject    handle to sty_space_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setspacemenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function xy_space_menu_Callback(hObject, eventdata, handles)
% hObject    handle to xy_space_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setspacemenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function xty_space_menu_Callback(hObject, eventdata, handles)
% hObject    handle to xty_space_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setspacemenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function plotu_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function plotu_b_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu_b_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotu_menu], 'Checked', 'off');
else
    setucolormenusoff;
    set([hObject handles.plotu_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotu_g_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu_g_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotu_menu], 'Checked', 'off');
else
    setucolormenusoff;
    set([hObject handles.plotu_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotu_r_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu_r_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotu_menu], 'Checked', 'off');
else
    setucolormenusoff;
    set([hObject handles.plotu_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotu_c_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu_c_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotu_menu], 'Checked', 'off');
else
    setucolormenusoff;
    set([hObject handles.plotu_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotu_m_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu_m_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotu_menu], 'Checked', 'off');
else
    setucolormenusoff;
    set([hObject handles.plotu_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotu_y_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu_y_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotu_menu], 'Checked', 'off');
else
    setucolormenusoff;
    set([hObject handles.plotu_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotu_k_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu_k_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotu_menu], 'Checked', 'off');
else
    setucolormenusoff;
    set([hObject handles.plotu_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotu0_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu0_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function plotu0_b_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu0_b_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotu0_menu], 'Checked', 'off');
else
    setu0colormenusoff;
    set([hObject handles.plotu0_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotu0_g_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu0_g_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotu0_menu], 'Checked', 'off');
else
    setu0colormenusoff;
    set([hObject handles.plotu0_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotu0_r_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu0_r_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotu0_menu], 'Checked', 'off');
else
    setu0colormenusoff;
    set([hObject handles.plotu0_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotu0_c_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu0_c_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotu0_menu], 'Checked', 'off');
else
    setu0colormenusoff;
    set([hObject handles.plotu0_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotu0_m_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu0_m_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotu0_menu], 'Checked', 'off');
else
    setu0colormenusoff;
    set([hObject handles.plotu0_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotu0_y_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu0_y_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotu0_menu], 'Checked', 'off');
else
    setu0colormenusoff;
    set([hObject handles.plotu0_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotu0_k_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotu0_k_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotu0_menu], 'Checked', 'off');
else
    setu0colormenusoff;
    set([hObject handles.plotu0_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function plotv_b_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv_b_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotv_menu], 'Checked', 'off');
else
    setvcolormenusoff;
    set([hObject handles.plotv_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv_g_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv_g_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotv_menu], 'Checked', 'off');
else
    setvcolormenusoff;
    set([hObject handles.plotv_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv_r_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv_r_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotv_menu], 'Checked', 'off');
else
    setvcolormenusoff;
    set([hObject handles.plotv_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv_c_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv_c_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotv_menu], 'Checked', 'off');
else
    setvcolormenusoff;
    set([hObject handles.plotv_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv_m_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv_m_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotv_menu], 'Checked', 'off');
else
    setvcolormenusoff;
    set([hObject handles.plotv_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv_y_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv_y_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotv_menu], 'Checked', 'off');
else
    setvcolormenusoff;
    set([hObject handles.plotv_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv_k_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv_k_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotv_menu], 'Checked', 'off');
else
    setvcolormenusoff;
    set([hObject handles.plotv_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv0_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv0_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function plotv0_b_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv0_b_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotv0_menu], 'Checked', 'off');
else
    setv0colormenusoff;
    set([hObject handles.plotv0_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv0_g_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv0_g_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotv0_menu], 'Checked', 'off');
else
    setv0colormenusoff;
    set([hObject handles.plotv0_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv0_r_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv0_r_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotv0_menu], 'Checked', 'off');
else
    setv0colormenusoff;
    set([hObject handles.plotv0_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv0_c_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv0_c_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotv0_menu], 'Checked', 'off');
else
    setv0colormenusoff;
    set([hObject handles.plotv0_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv0_m_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv0_m_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotv0_menu], 'Checked', 'off');
else
    setv0colormenusoff;
    set([hObject handles.plotv0_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv0_y_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv0_y_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotv0_menu], 'Checked', 'off');
else
    setv0colormenusoff;
    set([hObject handles.plotv0_menu], 'Checked', 'on');
end
refreshframe;



% --------------------------------------------------------------------
function plotv0_k_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plotv0_k_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'Checked'), 'on')
    set([hObject handles.plotv0_menu], 'Checked', 'off');
else
    setv0colormenusoff;
    set([hObject handles.plotv0_menu], 'Checked', 'on');
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
% hObject    handle to facted_shading_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setshadingmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function flat_shading_menu_Callback(hObject, eventdata, handles)
% hObject    handle to flat_shading_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setshadingmenusoff;
set(hObject, 'Checked', 'on');
refreshframe;



% --------------------------------------------------------------------
function interp_shading_menu_Callback(hObject, eventdata, handles)
% hObject    handle to interp_shading_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setshadingmenusoff;
set(hObject, 'Checked', 'on');
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
    {90.0 '90.0' ; 90.0 '90.0'});
refreshframe;



% --------------------------------------------------------------------
function fixcurrentaxis_menu_Callback(hObject, eventdata, handles)
% hObject    handle to fixcurrentaxis_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.ylimits_radiobutton, 'Value', get(handles.ylimits_radiobutton, 'Max'));
set(handles.fitplot_radiobutton, 'Value', get(handles.fitplot_radiobutton, 'Min'));

axes(handles.axes);
axislim = axis;
if length(axislim) == 6
    ymin = axislim(5);
    ymax = axislim(6);
else
    if isequal(get(handles.sy_space_menu, 'Checked'), 'on') || ...
       isequal(get(handles.xy_space_menu, 'Checked'), 'on')
        ymin = axislim(3);
        ymax = axislim(4);
    else
        data = getappdata(gcbf, 'data');
        frame = get(handles.frame_slider, 'Value') + 1;
        ymin = inf;
        ymax = -inf;
        if isequal(get(handles.plotu_menu, 'Checked'), 'on')
            ymin = min([ymin min(min(data.U(1:frame,:)))]);
            ymax = max([ymax max(max(data.U(1:frame,:)))]);
        end
        if isequal(get(handles.plotv_menu, 'Checked'), 'on')
            ymin = min([ymin min(min(data.V(1:frame,:)))]);
            ymax = max([ymax max(max(data.V(1:frame,:)))]);
        end
        if ymin == inf
            ymin = 0;
        end
        if ymax == -inf
            ymax = 1;
        end
    end
end

set([handles.ymin_textbox handles.ymax_textbox], ...
    {'Enable' 'Value' 'String'}, ...
    {'on' ymin num2str(ymin,8); 'on' ymax num2str(ymax,8)});



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

nsteps = length(data.U(:,1)) - 1;
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
        b = isequal(size(value),[1 1]) && ~isnan(value) && isreal(value) && mod(value,1) == 0;
    case 'J'
        b = isequal(size(value),[1 1]) && ~isnan(value) && isreal(value) && mod(value,1) == 0 && value > 2;
    case {'nonnegativereal' 'd' 'gamma_' 'time' 'ymax' 'ymin'}
        b = isequal(size(value),[1 1]) && ~isnan(value) && isreal(value) && value >= 0;
    case {'nonnegativeinteger' 'nsteps' 'step'}
        b = isequal(size(value),[1 1]) && ~isnan(value) && isreal(value) && mod(value,1) == 0 && value >= 0;
    case {'positiveinteger' 'displaystep'}
        b = isequal(size(value),[1 1]) && ~isnan(value) && isreal(value) && mod(value,1) == 0 && value > 0;
    case {'positivereal' 'dt' 'ds' 'maxchange' 'maxperturbation' 'nu'}
        b = isequal(size(value),[1 1]) && ~isnan(value) && isreal(value) && value > 0;
    case {'real' 'azimuthangle' 'elevationangle'}
        b = isequal(size(value),[1 1]) && ~isnan(value) && isreal(value);
    case {'value1' 'value2' 'value3' 'value4' 'value5'}
        b = isequal(size(value),[1 1]) && ~isnan(value);
    otherwise
        b = false;
end



% --- Unchecks all space menus.
function setspacemenusoff

handles = guidata(gcbf);
spaces = {'sy' 'sty' 'xy' 'xty'};
for i = 1:length(spaces)
    set(eval(['handles.' spaces{i} '_space_menu']), 'Checked', 'off');
end



% --- Unchecks all u-color menus.
function setucolormenusoff

handles = guidata(gcbf);
colors = {'b' 'g' 'r' 'c' 'm' 'y' 'k'};
for i = 1:length(colors)
    set(eval(['handles.plotu_' colors{i} '_menu']), 'Checked', 'off');
end



% --- Unchecks all u0-color menus.
function setu0colormenusoff

handles = guidata(gcbf);
colors = {'b' 'g' 'r' 'c' 'm' 'y' 'k'};
for i = 1:length(colors)
    set(eval(['handles.plotu0_' colors{i} '_menu']), 'Checked', 'off');
end



% --- Unchecks all v-color menus.
function setvcolormenusoff

handles = guidata(gcbf);
colors = {'b' 'g' 'r' 'c' 'm' 'y' 'k'};
for i = 1:length(colors)
    set(eval(['handles.plotv_' colors{i} '_menu']), 'Checked', 'off');
end



% --- Unchecks all v0-color menus.
function setv0colormenusoff

handles = guidata(gcbf);
colors = {'b' 'g' 'r' 'c' 'm' 'y' 'k'};
for i = 1:length(colors)
    set(eval(['handles.plotv0_' colors{i} '_menu']), 'Checked', 'off');
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
t = frame*data.displaystep*data.dt;
set([handles.step_textbox handles.time_textbox], ...
    {'Value' 'String'}, ...
    {step int2str(step) ; t num2str(t,8)});
set(handles.status_textbox, 'String', ['Plotting frame ' int2str(frame) '...']);
drawnow;

cla;
hold on;

if isequal(get(handles.sy_space_menu, 'Checked'), 'on') || ...
   isequal(get(handles.xy_space_menu, 'Checked'), 'on')
    u = data.U(frame+1,:);
    u0 = data.U0;
    v = data.V(frame+1,:);
    v0 = data.V0;
    x = data.s;
    if isequal(get(handles.sy_space_menu, 'Checked'), 'on')
        label = 's';
    else
        x = x*eval(data.rho);
        label = 'x';
    end
    vars = {'v0' 'u0' 'v' 'u'};
    colors = {'b' 'g' 'r' 'c' 'm' 'y' 'k'};
    for i = 1:length(vars)
        if isequal(get(eval(['handles.plot' vars{i} '_menu']), 'Checked'), 'on')
            for j = 1:length(colors)
                if isequal(get(eval(['handles.plot' vars{i} '_' colors{j} '_menu']), 'Checked'), 'on')
                    plot(x, eval(vars{i}), colors{j});
                end
            end
        end
    end
    view(2);
    xlabel(label);
    ylabel('y');
else
    u = data.U(1:frame+1,:);
    u0 = repmat(data.U0, [frame+1 1]);
    v = data.V(1:frame+1,:);
    v0 = repmat(data.V0, [frame+1 1]);
    if frame == 0 || ~isequal(get(handles.interp_shading_menu, 'Checked'), 'on')
        t = (0:frame+1)*data.displaystep*data.dt;
        u = [u ; u(end,:)];
        u0 = [u0 ; u0(end,:)];
        v = [v ; v(end,:)];
        v0 = [v0 ; v0(end,:)];
    else
        t = (0:frame)*data.displaystep*data.dt;
    end
    [x t] = meshgrid(data.x, t);
    
    if isequal(get(handles.sty_space_menu, 'Checked'), 'on')
        label = 's';
    else
        x = x.*eval(vectorize(data.rho));
        label = 'x';
    end
    
    vars = {'v0' 'u0' 'v' 'u'};
    for i = 1:length(vars)
        if isequal(get(eval(['handles.plot' vars{i} '_menu']), 'Checked'), 'on')
            surf(x, t, eval(vars{i}));
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
    
    xlabel(label);
    ylabel('t');
    zlabel('y');
end

hold off;

axis tight;
caxis('auto');

if get(handles.ylimits_radiobutton, 'Value') == get(handles.ylimits_radiobutton, 'Max')
    ymin = get(handles.ymin_textbox, 'Value');
    ymax = get(handles.ymax_textbox, 'Value');
    if ~isempty(ymin) && ~isempty(ymax)
        axislimits = axis;
        if isequal(get(handles.sy_space_menu, 'Checked'), 'on') || ...
           isequal(get(handles.xy_space_menu, 'Checked'), 'on')
            axislimits(3:4) = [ymin ymax];
        else
            if length(axislimits) < 6
                axislimits = [axislimits ymin ymax];
            else
                axislimits(5:6) = [ymin ymax];
            end
        end
        axis(axislimits);
        caxis([ymin ymax]);
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
    
    vars = {'gamma_' 'd' 'J' 'ds' 'dt' 'nu' 'displaystep' ...
            'value1' 'value2' 'value3' 'value4' 'value5' ...
            'maxperturbation' 'randomseed' 'nsteps' 'maxchange'};
    for i = 1:length(vars)
        set(eval(['handles.' vars{i} '_textbox']), ...
            'Value', eval(['data.' vars{i}]), ...
            'String', num2str(eval(['data.' vars{i}]),8));
    end
    vars = {'param1' 'param2' 'param3' 'param4' 'param5' ...
            'f' 'g' 'u0' 'v0' 'rho'};
    for i = 1:length(vars)
        set(eval(['handles.' vars{i} '_textbox']), 'String', eval(['data.' vars{i}]));
    end
    vars = {'u0t' 'us0t' 'u1t' 'us1t' ...
            'v0t' 'vs0t' 'v1t' 'vs1t'};
    for i = 1:length(vars)
        set(eval(['handles.' vars{i} '_radiobutton']), 'Value', eval(['data.' vars{i} '_flag']));
    end
    vars = {'maxperturbation' 'randomseed' 'nsteps' 'maxchange'};
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

