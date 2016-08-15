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

% Last Modified by GUIDE v2.5 18-Jul-2016 04:10:58

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


% --- Executes on slider movement.
function centerSlider_Callback(hObject, eventdata, handles)
% hObject    handle to centerSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
centerSliderVal = handles.centerSlider.Value;
handles.centerText.String = num2str(centerSliderVal);
plotGaussF(handles);

% --- Executes during object creation, after setting all properties.
function centerSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to centerSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function centerText_Callback(hObject, eventdata, handles)
% hObject    handle to centerText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of centerText as text
%        str2double(get(hObject,'String')) returns contents of centerText as a double
centerTextStr = str2double(handles.centerText.String);
centerSliderMax = handles.centerSlider.Max;
centerSliderMin = handles.centerSlider.Min;

if (centerTextStr <= centerSliderMax) && (centerTextStr >= centerSliderMin)
    handles.centerSlider.Value = centerTextStr;
end
plotGaussF(handles);

% --- Executes during object creation, after setting all properties.
function centerText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to centerText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function saveMenu_Callback(hObject, eventdata, handles)
% hObject    handle to saveMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% collect information from the GUI
a = handles.widthSlider.Value;
x0 = handles.centerSlider.Value;
iPlotChoice = handles.plotPopup.Value; 
doGrid = handles.gridCheckBox.Value;

%% save the information
% saveFile = 'gausstool';
[fileName, pathName] = uiputfile('gausstool.mat','Save data to file');
saveFile = [pathName, fileName];
save(saveFile, 'a', 'x0', 'iPlotChoice', 'doGrid');


% --------------------------------------------------------------------
function loadMenu_Callback(hObject, eventdata, handles)
% hObject    handle to loadMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% load the information from file
% loadFile = 'gausstool';
[fileName, pathName] = uigetfile('*.mat', 'Load data from file..');
loadFile = [pathName, fileName];
load(loadFile, 'a', 'x0', 'iPlotChoice', 'doGrid');

%% distribute the information
handles.widthSlider.Value = a;
handles.centerSlider.Value = x0;
handles.plotPopup.Value = iPlotChoice; 
handles.gridCheckBox.Value = doGrid;

%% plot the information
plotGaussF(handles);


% --------------------------------------------------------------------
function quitMenu_Callback(hObject, eventdata, handles)
% hObject    handle to quitMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in lockScaleButton.
function lockScaleButton_Callback(hObject, eventdata, handles)
% hObject    handle to lockScaleButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of lockScaleButton
isLocked = handles.lockScaleButton.Value;
if isLocked
    axisScaling = axis(handles.plotAxes);
    setappdata(gcf, 'AxisScaling', axisScaling);
    handles.lockScaleButton.String = 'Unlock Scale';
else
    handles.lockScaleButton.String = 'Lock Scale';
end
    
    


% --------------------------------------------------------------------
function widthMinMax_Callback(hObject, eventdata, handles)
% hObject    handle to widthMinMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Enter width slider maximum:', 'Enter width minimum'};
dlgTitle = 'Width slider min/max editor';
numLines = [1, 40];
default = {num2str(handles.widthSlider.Max),...
            num2str(handles.widthSlider.Min)};

newMinMax = inputdlg(prompt, dlgTitle, numLines, default);

if ~isempty(newMinMax)
    handles.widthSlider.Max = str2double(newMinMax{1});
    handles.widthSlider.Min = str2double(newMinMax{2});
end

% --------------------------------------------------------------------
function centerMinMax_Callback(hObject, eventdata, handles)
% hObject    handle to centerMinMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Enter width slider maximum:', 'Enter width minimum'};
dlgTitle = 'Center slider min/max editor';
numLines = [1, 40];
default = {num2str(handles.centerSlider.Max),...
            num2str(handles.centerSlider.Min)};

newMinMax = inputdlg(prompt, dlgTitle, numLines, default);

if ~isempty(newMinMax)
    handles.centerSlider.Max = str2double(newMinMax{1});
    handles.centerSlider.Min = str2double(newMinMax{2});
end

