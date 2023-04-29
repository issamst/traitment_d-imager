
function varargout = mini_photoshop(varargin)
% MINI_PHOTOSHOP MATLAB code for mini_photoshop.fig
%      MINI_PHOTOSHOP, by itself, creates a new MINI_PHOTOSHOP or raises the existing
%      singleton*.
%
%      H = MINI_PHOTOSHOP returns the handle to a new MINI_PHOTOSHOP or the handle to
%      the existing singleton*.
%
%      MINI_PHOTOSHOP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINI_PHOTOSHOP.M with the given input arguments.
%
%      MINI_PHOTOSHOP('Property','Value',...) creates a new MINI_PHOTOSHOP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mini_photoshop_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mini_photoshop_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mini_photoshop

% Last Modified by GUIDE v2.5 31-Jan-2023 15:11:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mini_photoshop_OpeningFcn, ...
                   'gui_OutputFcn',  @mini_photoshop_OutputFcn, ...
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


% --- Executes just before mini_photoshop is made visible.
function mini_photoshop_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mini_photoshop (see VARARGIN)

% Choose default command line output for mini_photoshop
handles.output = hObject;
set(handles.brightSlider,'Visible','Off');
set(handles.contrastSlider,'Visible','Off');
set(handles.hueSlider,'Visible','Off');
set(handles.downBorder,'Visible','On');

h = handles.figure1; %returns its handle
newIcon = javax.swing.ImageIcon('C:\Users\ISSAM\Desktop\mini photoshop\miniPS_icon.png');
figFrame = get(h,'JavaFrame'); %Get the JavaFrame of Figure.
figFrame.setFigureIcon(newIcon); %modify icon

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes mini_photoshop wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mini_photoshop_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% Implementation of the menu bar function
% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function image_Callback(hObject, eventdata, handles)
% hObject    handle to image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.brightSlider,'Visible','Off');
set(handles.contrastSlider,'Visible','Off');
set(handles.hueSlider,'Visible','Off');
set(handles.downBorder,'Visible','On');

% --------------------------------------------------------------------
function filter_Callback(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.brightSlider,'Visible','Off');
set(handles.contrastSlider,'Visible','Off');
set(handles.hueSlider,'Visible','Off');
set(handles.downBorder,'Visible','On');

% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.brightSlider,'Visible','Off');
set(handles.contrastSlider,'Visible','Off');
set(handles.hueSlider,'Visible','Off');
set(handles.downBorder,'Visible','On');

% --------------------------------------------------------------------
function adjust_Callback(hObject, eventdata, handles)
% hObject    handle to adjust (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function transfer_Callback(hObject, eventdata, handles)
% hObject    handle to transfer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.brightSlider,'Visible','Off');
set(handles.contrastSlider,'Visible','Off');
set(handles.hueSlider,'Visible','Off');
set(handles.downBorder,'Visible','On');

% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%open a picture
[FileName,PathName,FilterIndex]=uigetfile({'*.*';'*.jpg';'*.bmp';'*.png'},'Please select a file');
data=imread([PathName,FileName]);
set(handles.save,'UserData',[PathName,FileName]);%In order to store pictures, the original path and original file name can be stored


[height,width,dim] = size(data);
% disp(width);
% disp(height);
set(hObject,'UserData',data); %The value of userdata is a matrix, which is used to store more important data and play the role of data transmission
set(handles.scale,'UserData',data);%After the zoomed image is saved, the data, width, and height of the original image must be changed, so save the data, width, and height before opening the image to prevent data, width, and height from being updated
set(handles.rotate,'UserData',data);%After the rotated image is saved, the data of the original image needs to be changed, so save the data before opening the image to prevent the data from being updated
set(handles.bright,'UserData',data);%After adjusting the brightness of the image and saving it, you need to change the data of the original image, so save the data before opening the image to prevent the data from updating
set(handles.contrast,'UserData',data);%After adjusting the contrast of the image and saving it, you need to change the data of the original image, so save the data before opening the image to prevent the data from updating
set(handles.hue,'UserData',data);%After adjusting the saturation of the image and saving it, you need to change the data of the original image, so save the data before opening the image to prevent the data from updating
set(handles.black_and_white,'UserData',data);
set(handles.Inverse,'UserData',data);
set(handles.surfaceBlur,'UserData',data);
set(handles.motionBlur,'UserData',data);
set(handles.gaussBlur,'UserData',data);
set(handles.usmSharp,'UserData',data);
set(handles.reset,'UserData',data);
set(handles.choose,'UserData',data);

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);
newPos=floor([1,1,resetWidth-1,resetHeight-1]);
set(handles.pickBtn,'UserData',newPos);


imagesc([-width/2:width/2],[-height/2,height/2],data);
set(gca,'XLim',[-width/2,width/2],'XTick',[]);
set(gca,'YLim',[-height/2,height/2],'YTick',[]);
% set(gca,'XLim',[-width/2,width/2]);
% set(gca,'YLim',[-height/2,height/2]);
axis equal;



% --------------------------------------------------------------------
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);
newPos=floor([1,1,resetWidth-1,resetHeight-1]);
set(handles.pickBtn,'UserData',newPos);

imagesc([-resetWidth/2,resetWidth/2],[-resetHeight/2,resetHeight/2],resetData);% The difficulty is to center the scaled image
set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.open,'UserData',resetData);%Update data to store new images


% --------------------------------------------------------------------
function prevStep_Callback(hObject, eventdata, handles)
% hObject    handle to prevStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

oriData=get(handles.prevStep,'UserData');

[oriHeight,oriWidth,oriDim] = size(oriData);

prevStepData=oriData;
[prevStepHeight,prevStepWidth,prevStepDim] = size(prevStepData);
imagesc([-prevStepWidth/2:prevStepWidth/2],[-prevStepHeight/2,prevStepHeight/2],prevStepData);% The difficulty is to center the scaled image

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);
set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.open,'UserData',prevStepData);%Update data to store new images
% --------------------------------------------------------------------
function backStep_Callback(hObject, eventdata, handles)
% hObject    handle to backStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oriData=get(handles.backStep,'UserData');

[oriHeight,oriWidth,oriDim] = size(oriData);

backData=oriData;
[backHeight,backWidth,backDim] = size(backData);
imagesc([-backWidth/2:backWidth/2],[-backHeight/2,backHeight/2],backData);% The difficulty is to center the scaled image

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);
set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.open,'UserData',backData);%Update data to store new images


% --------------------------------------------------------------------
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cla(handles.axes);



% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=get(handles.open,'UserData');
saveOriPa=get(handles.save,'UserData');%save original path Original path, original name Save
imwrite(data,saveOriPa);

% --------------------------------------------------------------------
function save_as_Callback(hObject, eventdata, handles)
% hObject    handle to save_as (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=get(handles.open,'UserData');
[FileName,PathName,FilterIndex]=uiputfile({'*.jpg';'*.bmp';'*.png';},'save document','new_figure');
disp(FileName);
disp(PathName);
imwrite(data,[PathName,FileName]);


% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);


% --------------------------------------------------------------------
function scale_Callback(hObject, eventdata, handles)
% hObject    handle to scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data, used to store new images

[oriHeight,oriWidth,oriDim] = size(oriData);

scaleFactor=inputdlg('Please enter a scaling factor (greater than 0)','Input',[1 40]);
scaleFactor=str2num(scaleFactor{1});
scaleData=imresize(oriData,scaleFactor);% Matlab's own image scaling function

[scaleHeight,scaleWidth,scaleDim] = size(scaleData);
disp(scaleHeight);
imagesc([-scaleWidth/2:scaleWidth/2],[-scaleHeight/2,scaleHeight/2],scaleData);% The difficulty is to center the scaled image

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);
set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.open,'UserData',scaleData);%Update data to store new images
set(handles.backStep,'UserData',scaleData);%Update data to store new images



% --------------------------------------------------------------------
function rotate_Callback(hObject, eventdata, handles)
% hObject    handle to rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

rotateFactor=inputdlg('enter the rotation angle(-180°,180°)','Theta Value',[1 40]);
rotateFactor=str2num(rotateFactor{1});
rotateData=imrotate(oriData,rotateFactor);% Matlab's own image rotation function
[rotateHeight,rotateWidth,oriDim] = size(rotateData);

imagesc([-rotateWidth/2:rotateWidth/2],[-rotateHeight/2,rotateHeight/2],rotateData);% The difficulty is to center the zoomed image

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);
set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.open,'UserData',rotateData);%Update data, used to store new images
set(handles.backStep,'UserData',rotateData);%Update data to store new images



% --------------------------------------------------------------------
function flip_Callback(hObject, eventdata, handles)
% hObject    handle to flip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url = 'https://www.mathworks.com/help/index.html';
web(url,'-browser');

% --------------------------------------------------------------------
function doc_Callback(hObject, eventdata, handles)
% hObject    handle to doc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url = 'https://www.mathworks.com/help/index.html';
web(url,'-browser');

% --------------------------------------------------------------------
function blur_Callback(hObject, eventdata, handles)
% hObject    handle to blur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function sharp_Callback(hObject, eventdata, handles)
% hObject    handle to sharp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function bright_Callback(hObject, eventdata, handles)
% hObject    handle to bright (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.brightSlider,'Visible','On');
set(handles.contrastSlider,'Visible','Off');
set(handles.hueSlider,'Visible','Off');
set(handles.downBorder,'Visible','Off');


% --------------------------------------------------------------------
function contrast_Callback(hObject, eventdata, handles)
% hObject    handle to contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.contrastSlider,'Visible','On');
set(handles.brightSlider,'Visible','Off');
set(handles.hueSlider,'Visible','Off');
set(handles.downBorder,'Visible','Off');

% --------------------------------------------------------------------
function hue_Callback(hObject, eventdata, handles)
% hObject    handle to hue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.hueSlider,'Visible','On');
set(handles.brightSlider,'Visible','Off');
set(handles.contrastSlider,'Visible','Off');
set(handles.downBorder,'Visible','Off');

% --------------------------------------------------------------------
function black_and_white_Callback(hObject, eventdata, handles)
% hObject    handle to black_and_white (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

oriData=get(handles.open,'UserData');

imgk=im2bw(oriData);
img2=imgk;
axes(handles.axes);
imshow(img2); colormap  gray

% --------------------------------------------------------------------
function Inverse_Callback(hObject, eventdata, handles)
% hObject    handle to Inverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData)

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData)

newPos=get(handles.pickBtn,'UserData')
newPos=floor(newPos);


if isempty(newPos)
    newPos=floor([1,1,resetWidth-1,resetHeight-1]);
end
g=imcrop(oriData,newPos);
imgn=g;
maxL=max(max(g))
imgn(:,:,1)=maxL(:,:,1)-g(:,:,1);
imgn(:,:,2)=maxL(:,:,2)-g(:,:,2);
imgn(:,:,3)=maxL(:,:,3)-g(:,:,3);
oriData(newPos(2):newPos(2)+newPos(4),newPos(1):newPos(1)+newPos(3),1:oriDim)=imgn(:,:,1:oriDim); 
inverseData=oriData;

[inverseHeight,inverseWidth,inverseDim] = size(inverseData);
imagesc([-inverseWidth/2:inverseWidth/2],[-inverseHeight/2,inverseHeight/2],inverseData);% The difficulty is to center the scaled image

set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.open,'UserData',inverseData);%Update data to store new images
set(handles.backStep,'UserData',inverseData);%Update data to store new images


% --------------------------------------------------------------------
function mosiac_Callback(hObject, eventdata, handles)
% hObject    handle to mosiac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

mosiacFactor=inputdlg('Please enter cell size (pixels)','Input',[1 40]);
mosiacFactor=str2num(mosiacFactor{1});

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);

newPos=get(handles.pickBtn,'UserData');
newPos=floor(newPos)
if isempty(newPos)
    newPos=floor([1,1,resetWidth-1,resetHeight-1])
end
g=imcrop(oriData,newPos);
[h,w,dim] = size(g)
imgn = g;
%Set mosaic area n*n pixel block size
nh = floor(h/mosiacFactor)*mosiacFactor;%Resize images that are not necessarily integer multiples of n to integer multiples
nw = floor(w/mosiacFactor)*mosiacFactor;
%Loop processing on three channels
for t = 1:3
    for j = 1:mosiacFactor:nh
        for i = 1:mosiacFactor:nw
            imgn(j:j+mosiacFactor-1, i:i+mosiacFactor-1, t) =mean(mean(g(j:j+mosiacFactor-1, i:i+mosiacFactor-1, t)));%Averaging the column
        end
        imgn(j:j+mosiacFactor-1,nw:w , t ) = mean(mean(g(j:j+mosiacFactor-1,nw:w , t)));%Process the last column
    end
    for i = 1:mosiacFactor:nw
        imgn(nh:h, i:i+mosiacFactor-1, t) = mean(mean(g(nh:h, i:i+mosiacFactor-1, t)));%Process the last line
    end
    imgn(nh:h, nw:w, t) = mean(mean(g(nh:h, nw:w , t)));%Handle the last corner
end

oriData(newPos(2):newPos(2)+newPos(4),newPos(1):newPos(1)+newPos(3),1:3)=imgn(:,:,1:3); 
mosiacData=oriData;
[mosiacHeight,mosiacWidth,mosiacDim] = size(mosiacData);

imagesc([-mosiacWidth/2:mosiacWidth/2],[-mosiacHeight/2,mosiacHeight/2],mosiacData);%The difficulty is to center the scaled image

set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;
set(handles.open,'UserData',mosiacData);%Update data to store new images
set(handles.backStep,'UserData',mosiacData);%Update data to store new images


% --- Executes during object creation, after setting all properties.
function axes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes


% --- Executes on brightSlider movement.
function brightSlider_Callback(hObject, eventdata, handles)
% hObject    handle to brightSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

oriData=get(handles.reset,'UserData');

prevData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',prevData);%Update data to store new images

[oriHeight,oriWidth,oriDim] = size(oriData);
hsvData = rgb2hsv(oriData);     %color space conversion
H = hsvData(:,:,1); % tone
S = hsvData(:,:,2); % saturation
V = hsvData(:,:,3); % brightness

brightFactor=get(hObject,'Value')

hsvData(:,:,3) =brightFactor* hsvData(:,:,3);   %1.5 bits need to be enhanced multiples, which can be dynamically adjusted according to the picture situation

brightData = hsv2rgb(hsvData); %Convert to RGB for display
[brightHeight,brightWidth,brightDim] = size(brightData);

imagesc([-brightWidth/2:brightWidth/2],[-brightHeight/2,brightHeight/2],brightData);% The difficulty is to center the scaled image

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);
set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;
set(handles.open,'UserData',brightData);%Update data to store new images
set(handles.backStep,'UserData',brightData);%Update data to store new images

% Hints: get(hObject,'Value') returns position of brightSlider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of brightSlider


% --- Executes during object creation, after setting all properties.
function brightSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brightSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: brightSlider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function lrFlip_Callback(hObject, eventdata, handles)
% hObject    handle to lrFlip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);

newPos=get(handles.pickBtn,'UserData');
newPos=floor(newPos);
if isempty(newPos)
    newPos=floor([1,1,resetWidth-1,resetHeight-1]);
end
g=imcrop(oriData,newPos);

imgn=fliplr(g);% Matlab's own image rotation function

oriData(newPos(2):newPos(2)+newPos(4),newPos(1):newPos(1)+newPos(3),1:3)=imgn(:,:,1:3); 
fliplrData=oriData;
[fliplrHeight,fliplrWidth,oriDim] = size(fliplrData);

imagesc([-fliplrWidth/2:fliplrWidth/2],[-fliplrHeight/2,fliplrHeight/2],fliplrData);% The difficulty is to center the scaled image
resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);
set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.open,'UserData',fliplrData);%Update data to store new images
set(handles.backStep,'UserData',fliplrData);%Update data to store new images

% --------------------------------------------------------------------
function udFlip_Callback(hObject, eventdata, handles)
% hObject    handle to udFlip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);

newPos=get(handles.pickBtn,'UserData');
newPos=floor(newPos);
if isempty(newPos)
    newPos=floor([1,1,resetWidth-1,resetHeight-1]);
end
g=imcrop(oriData,newPos);

imgn=flipud(g);% Matlab's own image rotation function

oriData(newPos(2):newPos(2)+newPos(4),newPos(1):newPos(1)+newPos(3),1:3)=imgn(:,:,1:3); 
flipudData=oriData;

[flipudHeight,flipudWidth,oriDim] = size(flipudData);

imagesc([-flipudWidth/2:flipudWidth/2],[-flipudHeight/2,flipudHeight/2],flipudData);% The difficulty is to center the scaled image

set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.open,'UserData',flipudData);%Update data, used to store new images
set(handles.backStep,'UserData',flipudData);%Update data to store new images


% --------------------------------------------------------------------
function rotate180_Callback(hObject, eventdata, handles)
% hObject    handle to rotate180 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

rotateFactor=180;
rotateData=imrotate(oriData,rotateFactor);% Matlab's own image rotation function
[rotateHeight,rotateWidth,oriDim] = size(rotateData);


imagesc([-rotateWidth/2:rotateWidth/2],[-rotateHeight/2,rotateHeight/2],rotateData);% The difficulty is to center the scaled image

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);
set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.open,'UserData',rotateData);%Update data to store new images
set(handles.backStep,'UserData',rotateData);%Update data to store new images


% --------------------------------------------------------------------
function rightRotate90_Callback(hObject, eventdata, handles)
% hObject    handle to rightRotate90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

rotateFactor=-90;
rotateData=imrotate(oriData,rotateFactor);% matlabBuilt-in image rotation function
[rotateHeight,rotateWidth,oriDim] = size(rotateData);


imagesc([-rotateWidth/2:rotateWidth/2],[-rotateHeight/2,rotateHeight/2],rotateData);% The difficulty is to center the scaled image

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);
set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.open,'UserData',rotateData);%Update data to store new images
set(handles.backStep,'UserData',rotateData);%Update data to store new images



% --------------------------------------------------------------------
function leftRotate90_Callback(hObject, eventdata, handles)
% hObject    handle to leftRotate90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

rotateFactor=90;
rotateData=imrotate(oriData,rotateFactor);% matlabBuilt-in image rotation function
[rotateHeight,rotateWidth,oriDim] = size(rotateData);

imagesc([-rotateWidth/2:rotateWidth/2],[-rotateHeight/2,rotateHeight/2],rotateData);% The difficulty is to center the scaled image

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);
set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.open,'UserData',rotateData);%Update data to store new images
set(handles.backStep,'UserData',rotateData);%Update data to store new images



% --- Executes on slider movement.
function contrastSlider_Callback(hObject, eventdata, handles)
% hObject    handle to contrastSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oriData=get(handles.reset,'UserData');

prevData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',prevData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

contrastFactor=get(hObject,'Value');



contrastData = imadjust(oriData,[],[],contrastFactor);
[contrastHeight,contrastWidth,contrastDim] = size(contrastData);

imagesc([-contrastWidth/2:contrastWidth/2],[-contrastHeight/2,contrastHeight/2],contrastData);% The difficulty is to center the scaled image

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);
set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;
set(handles.open,'UserData',contrastData);%Update data to store new images
set(handles.backStep,'UserData',contrastData);%Update data to store new images



% --- Executes during object creation, after setting all properties.
function contrastSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to contrastSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function hueSlider_Callback(hObject, eventdata, handles)
% hObject    handle to hueSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oriData=get(handles.reset,'UserData');

prevData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',prevData);%Update data to store new images

[oriHeight,oriWidth,oriDim] = size(oriData);
hsvData = rgb2hsv(oriData);     %color space conversion
H = hsvData(:,:,1); % tone
S = hsvData(:,:,2); % saturation
V = hsvData(:,:,3); % brightness

hueFactor=get(hObject,'Value');
hsvData(:,:,2) =hueFactor* hsvData(:,:,2);   %1.5 bits need to be enhanced multiples, which can be dynamically adjusted according to the picture situation

hueData = hsv2rgb(hsvData); %Convert to RGB for display
[hueHeight,hueWidth,hueDim] = size(hueData);

imagesc([-hueWidth/2:hueWidth/2],[-hueHeight/2,hueHeight/2],hueData);% The difficulty is to center the scaled image

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);
set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.backStep,'UserData',hueData);%Update data to store new images
set(handles.open,'UserData',hueData);%Update data to store new images
set(handles.open,'UserData',hueData);%Update data to store new images
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function hueSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hueSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function surfaceBlur_Callback(hObject, eventdata, handles)
% hObject    handle to surfaceBlur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);

newPos=get(handles.pickBtn,'UserData');
newPos=floor(newPos);
if isempty(newPos)
    newPos=floor([1,1,resetWidth-1,resetHeight-1]);
end
g=imcrop(oriData,newPos);
[h,w,dim] = size(g);

sBlurRT= inputdlg({'Please enter a radius (pixels)','Please enter a threshold (color scale)'},'Input',[1 40]);
sBlurR=str2num(sBlurRT{1});
sBlurT=str2num(sBlurRT{2});

imgn=Surface_Blur(g,sBlurR,sBlurT);

oriData(newPos(2):newPos(2)+newPos(4),newPos(1):newPos(1)+newPos(3),1:3)=imgn(:,:,1:3); 
sBlurData=oriData;

[sBlurHeight,sBlurWidth,sBlurDim] = size(sBlurData);
imagesc([-sBlurWidth/2:sBlurWidth/2],[-sBlurHeight/2,sBlurHeight/2],sBlurData);% The difficulty is to center the scaled image

set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.backStep,'UserData',sBlurData);%Update data to store new images
set(handles.open,'UserData',sBlurData);%Update data to store new images


% --------------------------------------------------------------------
function motionBlur_Callback(hObject, eventdata, handles)
% hObject    handle to motionBlur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);

newPos=get(handles.pickBtn,'UserData');
newPos=floor(newPos);
if isempty(newPos)
    newPos=floor([1,1,resetWidth-1,resetHeight-1]);
end
g=imcrop(oriData,newPos);
[h,w,dim] = size(g);

mBlurAD= inputdlg({'Please enter the angle (°)','Please enter distance (pixels)'},'Input',[1 40]);
mBlurA=str2num(mBlurAD{1});
mBlurD=str2num(mBlurAD{2});

H = fspecial('motion',mBlurD,mBlurA);
imgn = imfilter(g,H,'replicate');

oriData(newPos(2):newPos(2)+newPos(4),newPos(1):newPos(1)+newPos(3),1:3)=imgn(:,:,1:3); 
mBlurData=oriData;

[mBlurHeight,mBlurWidth,mBlurDim] = size(mBlurData);
imagesc([-mBlurWidth/2:mBlurWidth/2],[-mBlurHeight/2,mBlurHeight/2],mBlurData);% The difficulty is to center the scaled image
resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);
set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.backStep,'UserData',mBlurData);%Update data to store new images
set(handles.open,'UserData',mBlurData);%Update data to store new images


% --------------------------------------------------------------------
function gaussBlur_Callback(hObject, eventdata, handles)
% hObject    handle to gaussBlur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);

newPos=get(handles.pickBtn,'UserData');
newPos=floor(newPos);
if isempty(newPos)
    newPos=floor([1,1,resetWidth-1,resetHeight-1]);
end
g=imcrop(oriData,newPos);
[h,w,dim] = size(g);

mBlurH= inputdlg('Please enter a radius (pixels)','Input',[1 40]);
mBlurH=str2num(mBlurH{1});
sigma=10;
H = fspecial('gaussian',mBlurH,sigma);
imgn  = imfilter(g,H,'replicate');

oriData(newPos(2):newPos(2)+newPos(4),newPos(1):newPos(1)+newPos(3),1:3)=imgn(:,:,1:3); 

gBlurData=oriData;

[gBlurHeight,gBlurWidth,gBlurDim] = size(gBlurData);
imagesc([-gBlurWidth/2:gBlurWidth/2],[-gBlurHeight/2,gBlurHeight/2],gBlurData);% The difficulty is to center the scaled image

set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;

set(handles.backStep,'UserData',gBlurData);%Update data to store new images
set(handles.open,'UserData',gBlurData);%Update data to store new images


% --------------------------------------------------------------------
function usmSharp_Callback(hObject, eventdata, handles)
% hObject    handle to usmSharp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);

mBlurRAT= inputdlg({'Please enter a radius (pixels)','Please enter the quantity (between 0-2)','Please enter a threshold (between 0-1)'},'Input',[1 40]);
mBlurR=str2num(mBlurRAT{1});
mBlurA=str2num(mBlurRAT{2});
mBlurT=str2num(mBlurRAT{3});

newPos=get(handles.pickBtn,'UserData');
newPos=floor(newPos);
if isempty(newPos)
    newPos=floor([1,1,resetWidth-1,resetHeight-1]);
end
g=imcrop(oriData,newPos);
[h,w,dim] = size(g);
imgn = imsharpen(g,'Radius',mBlurR,'Amount',mBlurA,'threshold',mBlurT);

oriData(newPos(2):newPos(2)+newPos(4),newPos(1):newPos(1)+newPos(3),1:3)=imgn(:,:,1:3); 
usmSharpData=oriData;
[usmSharpHeight,usmSharpWidth,usmSharpDim] = size(usmSharpData);

imagesc([-usmSharpWidth/2:usmSharpWidth/2],[-usmSharpHeight/2,usmSharpHeight/2],usmSharpData);% The difficulty is to center the scaled image

set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;
set(handles.open,'UserData',usmSharpData);%Update data to store new images
set(handles.backStep,'UserData',usmSharpData);%Update data to store new images




% --- Executes on button press in cropBtn.
function cropBtn_Callback(~, eventdata, handles)
% hObject    handle to cropBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);

pos=floor([-resetWidth/2+5,-resetHeight/2+5,resetWidth-10,resetHeight-10]);
t=imrect(gca,pos);

pause;
pos=getPosition(t);
pos(1)=resetWidth/2+pos(1);
pos(2)=resetHeight/2+pos(2);
newPos=floor(pos);
newPosBtn=newPos;
newPosBtn(1)=1;
newPosBtn(2)=1;

g=imcrop(oriData,newPos);
imgn=g;
cropData=imgn;

[cropHeight,cropWidth,cropDim] = size(cropData);
imagesc([-cropWidth/2:cropWidth/2],[-cropHeight/2,cropHeight/2],cropData);% The difficulty is to center the scaled image

set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;
% 
% oriData(newPos(2):newPos(2)+newPos(4),newPos(1):newPos(1)+newPos(3),1:3)=cropData; 
set(handles.backStep,'UserData',cropData);%Update data to store new images
set(handles.open,'UserData',cropData);%Update data to store new images
set(handles.pickBtn,'UserData',newPosBtn);






% --- Executes on button press in pickBtn.
function pickBtn_Callback(hObject, eventdata, handles)
% hObject    handle to pickBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

t=imrect();
pos=getPosition(t);

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);

pos(1)=oriWidth/2+pos(1);
pos(2)=oriHeight/2+pos(2);
newPos=floor(pos);

set(handles.pickBtn,'UserData',newPos);


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function cropBtn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cropBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over cropBtn.
function cropBtn_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to cropBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function histogramme_Callback(hObject, eventdata, handles)
% hObject    handle to histogramme (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Data=get(handles.reset,'UserData'); 

axes(handles.axes);
imhist(Data)


% --------------------------------------------------------------------
function Filtre__Callback(hObject, eventdata, handles)
% hObject    handle to Filtre_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Gauisian_filtrer_Callback(hObject, eventdata, handles)
% hObject    handle to Gauisian_filtrer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Data=get(handles.reset,'UserData'); 
g=imgaussfilt(Data,10);
axes(handles.axes);
imshow(g);
% --------------------------------------------------------------------
function filtre_median_Callback(hObject, eventdata, handles)
% hObject    handle to filtre_median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Data=get(handles.reset,'UserData'); 


N=imnoise(Data,'salt & pepper');
axes(handles.axes);
imshow(N);
% --------------------------------------------------------------------
function filtre_moyen_Callback(hObject, eventdata, handles)
% hObject    handle to filtre_moyen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Data=get(handles.reset,'UserData'); 
g=imgaussfilt(Data,3);
axes(handles.axes);
imshow(g);


% --------------------------------------------------------------------
function HSV_Callback(hObject, eventdata, handles)
% hObject    handle to HSV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Data=get(handles.reset,'UserData'); 
imgk=rgb2hsv(Data);
Data=imgk;
axes(handles.axes);
imshow(Data); colormap gray


% --------------------------------------------------------------------
function contour_Callback(hObject, eventdata, handles)
% hObject    handle to contour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Data=get(handles.reset,'UserData'); 

b = rgb2gray(Data);
img2 = edge(b,'canny');
axes(handles.axes);
imshow(img2);

% --------------------------------------------------------------------
function fourier_Callback(hObject, eventdata, handles)
% hObject    handle to fourier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Data=get(handles.reset,'UserData'); 






I1=Data;
I1=rgb2gray(I1);
F=fft2(I1);
s=abs(F);
Fsh = fftshift(F);
s2 = log(1+abs(Fsh));
F=ifftshift(Fsh);
f=ifft2(F);
img2=f;
axes(handles.axes);
imshow(img2,[]);


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);

pos=floor([-resetWidth/2+5,-resetHeight/2+5,resetWidth-10,resetHeight-10]);
t=imrect(gca,pos);

pause;
pos=getPosition(t);
pos(1)=resetWidth/2+pos(1);
pos(2)=resetHeight/2+pos(2);
newPos=floor(pos);
newPosBtn=newPos;
newPosBtn(1)=1;
newPosBtn(2)=1;

g=imcrop(oriData,newPos);
imgn=g;
cropData=imgn;

[cropHeight,cropWidth,cropDim] = size(cropData);
imagesc([-cropWidth/2:cropWidth/2],[-cropHeight/2,cropHeight/2],cropData);% The difficulty is to center the scaled image

set(gca,'XLim',[-resetWidth/2,resetWidth/2],'Color','white','XTick',[]);
set(gca,'YLim',[-resetHeight/2,resetHeight/2],'Color','white','YTick',[]);
axis equal;
% 
% oriData(newPos(2):newPos(2)+newPos(4),newPos(1):newPos(1)+newPos(3),1:3)=cropData; 
set(handles.backStep,'UserData',cropData);%Update data to store new images
set(handles.open,'UserData',cropData);%Update data to store new images
set(handles.pickBtn,'UserData',newPosBtn);


% --------------------------------------------------------------------
function choose_Callback(hObject, eventdata, handles)
% hObject    handle to choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oriData=get(handles.open,'UserData');
set(handles.prevStep,'UserData',oriData);%Update data to store new images
[oriHeight,oriWidth,oriDim] = size(oriData);

t=imrect();
pos=getPosition(t);

resetData=get(handles.reset,'UserData'); 
[resetHeight,resetWidth,resetDim] = size(resetData);

pos(1)=oriWidth/2+pos(1);
pos(2)=oriHeight/2+pos(2);
newPos=floor(pos);

set(handles.pickBtn,'UserData',newPos);


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oriData=get(handles.open,'UserData');

            [impath, user_canceled] = imgetfile;
            if user_canceled
                msgbox(sprintf('Veuilez charger l''image avant d''effectuez les effets '),'error','error');
                return;
            end
            imageB=imread(impath);
            setappdata(0,"im2",imageB);
            g=size(oriData);
            imageB=imresize(imageB,[g(1),g(2)]);
            fftA = fft2(double(oriData));
            fftB = fft2(double(imageB));
            fftC = abs(fftA).*exp(1i*angle(fftB));
            fftD = abs(fftB).*exp(1i*angle(fftA)); 
            fftE= abs(fftA).*exp(1i*angle(fftA));
            fftF= abs(fftB).*exp(1i*angle(fftB));
            imageC = ifft2(fftC);
            imageD = ifft2(fftD);
            imageE = ifft2(fftE);
            imageF = ifft2(fftF);
            %Calculate limits for plotting
            cmin = min(min(min(abs(imageC))));
            cmax = max(max(max(abs(imageC))));
            dmin = min(min(min(abs(imageD))));
            dmax = max(max(max(abs(imageD))));
            h = waitbar(0,'Please wait...');
                steps = 300;
                for step = 1:steps
                    % computations take place here
                    waitbar(step / steps)
                end
                close(h)
            
            axes(handles.axes);
            imshow(imageC);


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function pushbutton2_Callback(hObject, eventdata, handles)
oriData=get(handles.open,'UserData');
global imgu
global img2
[l,c,d]=size(oriData);
[ll,cc,d]=size(imgu);
Max = max(l,ll);
Min = max(c,cc);
i1= uint8(zeros(Max,Min,d));
i1(1:l,1:c,:)=img;
i2= uint8(zeros(Max,Min,d));
i2(1:ll,1:cc,:)=imgu;
mer= uint8(zeros(Max,Min));
for k=1:d
for i=1:Max
    for j=1:Min
        
    h= i1(i,j,k)+i2(i,j,k);
      
    if h > 255
        mer(i,j,k)=255;
    else
        mer(i,j,k)=h;
    end
    end
end
end
img2 = mer;
axes(handles.axes);
imshow(img2);
