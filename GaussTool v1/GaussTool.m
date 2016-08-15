function varargout = GaussTool(varargin)
% GAUSSTOOL MATLAB code for GaussTool.fig
%      GAUSSTOOL, by itself, creates a new GAUSSTOOL or raises the existing
%      singleton*.
%
%      H = GAUSSTOOL returns the handle to a new GAUSSTOOL or the handle to
%      the existing singleton*.
%
%      GAUSSTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAUSSTOOL.M with the given input arguments.
%
%      GAUSSTOOL('Property','Value',...) creates a new GAUSSTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GaussTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GaussTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GaussTool

% Last Modified by GUIDE v2.5 16-Jul-2016 01:58:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GaussTool_OpeningFcn, ...
                   'gui_OutputFcn',  @GaussTool_OutputFcn, ...
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


% --- Executes just before GaussTool is made visible.
function GaussTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GaussTool (see VARARGIN)

% Choose default command line output for GaussTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GaussTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);
plotGaussF(handles);


% --- Outputs from this function are returned to the command line.
function varargout = GaussTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function widthSlider_Callback(hObject, eventdata, handles)
% hObject    handle to widthSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
w = handles.widthSlider.Value;
handles.widthText.String = num2str(w);
plotGaussF(handles);

% --- Executes during object creation, after setting all properties.
function widthSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to widthSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function widthText_Callback(hObject, eventdata, handles)
% hObject    handle to widthText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of widthText as text
%        str2double(get(hObject,'String')) returns contents of widthText as a double
wTxt = str2double(handles.widthText.String);
wSliderMax = handles.widthSlider.Max;

if wTxt <= wSliderMax
    handles.widthSlider.Value = wTxt;
end
plotGaussF(handles);

% --- Executes during object creation, after setting all properties.
function widthText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to widthText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in plotPopup.
function plotPopup_Callback(hObject, eventdata, handles)
% hObject    handle to plotPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns plotPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from plotPopup
plotGaussF(handles);

% --- Executes during object creation, after setting all properties.
function plotPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gridCheckBox.
function gridCheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to gridCheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gridCheckBox
plotGaussF(handles);
