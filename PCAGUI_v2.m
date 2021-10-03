function PCAGUI_v2
% PCAGUI.m
% PCAGUI.m generates the GUI window for PCA.m.
% Last Modified: Dec. 23, 2016
% Writen by:Yaray Ku

% calculate PCA
global LData Ldata TData Tdata title TPC LPC Texplained Lexplained Tpaxes3 Lpaxes3 Tpaxes2 Lpaxes2
Tdata = TData;
Ldata = LData;
[TPC,Tscore,~,~,Texplained] = pca(Tdata);
[LPC,Lscore,~,~,Lexplained] = pca(Ldata);
% pre-load value
TatPC = Tdata*TPC(:,1:3);
LatPC = Ldata*TPC(:,1:3);

% predefine settings
PCaxesstring = {'PC1','PC2','PC3','PC4','PC5'};
% get size and position
pscreen = get(0,'Screensize');
% Figure position
pfigure = [0.025*pscreen(3) 0.1*pscreen(4) 0.95*pscreen(3) 0.9*pscreen(4)];
% Earth Panel Position
Tppanel = [0.01 0.5 0.53 0.48];
Tpaxes1 = [0.1 0.67 0.36 0.28];
Tpaxes2 = [0.06 0.055 0.45 0.45];
Tpaxes3 = [0.59 0.15 0.38 0.8];
% Moon Panel Position
Lppanel = [0.01 0.02 0.53 0.48];
Lpaxes1 = [0.1 0.67 0.36 0.28];
Lpaxes2 = [0.06 0.055 0.45 0.45];
Lpaxes3 = [0.59 0.15 0.38 0.8];
% Comparison plot
Cpaxes = [0.59 0.075 0.35 0.7];
% listbox
Cplist = [0.867 0.91 0.12 0.05];
% puchbuttom
ppb2 = [0.6 0.8 0.05 0.04];
ppb3 = [0.7 0.8 0.05 0.04];
ppbq = [0.962 0.03 0.03 0.04];
% radiobutton
CTpr = [0.55 0.9 0.13 0.04];
CLpr = [0.55 0.86 0.13 0.04];
% edit bar
Tpedit = [0.68 0.905 0.03 0.03];
Lpedit = [0.68 0.865 0.03 0.03];
% text position
ptext = [0.65 0.93 0.2 0.05];
Tptext = [0.715 0.905 0.15 0.03];
Lptext = [0.715 0.865 0.15 0.03];
% popmenu
Cpx = [0.92 0.88 0.065 0.015];
Cpy = [0.92 0.84 0.065 0.015];
Cpz = [0.92 0.80 0.065 0.015];
Cpxtext = [0.875 0.865 0.04 0.023];
Cpytext = [0.875 0.83 0.04 0.023];
Cpztext = [0.875 0.795 0.04 0.023];

% Set Up Figure
hf = figure('Position',pfigure,'NumberTitle','off','Name',...
    'Prinicipal Composition Analysis on Lunar and Terrestrial Samples');

% Terrestrial panel
hTpanel = uipanel(hf,'Units','normalized','Position',Tppanel,...
    'Title','Terrestrial Sample','FontSize',13,'Tag','Tpanel');
% axes1
hTaxes1 = axes('Parent',hTpanel,'Units','normalized','Position',Tpaxes1,...
    'ALimMode','manual','tag','Tax1','xlim',[0 11],'ylim',[0 100],'xtick',[1:10]);
hTPCbar = bar(Texplained);
set(hTPCbar,'tag','Texpalined')
set(hTaxes1,'xlim',[0 9],'ylim',[0 100])
xlabel('Principal Component (Eigenvector)')
ylabel('Variance Explained %')
% axes2
hTaxes2 = axes('Parent',hTpanel,'Units','normalized','Position',Tpaxes2,...
    'NextPlot','add','ALimMode','manual','tag','Tax2');
Tb = bar([1:8],[abs(TPC(1,1:3));abs(TPC(2,1:3));abs(TPC(3,1:3));...
    abs(TPC(4,1:3));abs(TPC(5,1:3));abs(TPC(6,1:3));abs(TPC(7,1:3));...
    abs(TPC(8,1:3))]);
set(hTaxes2,'xtick',[1:8],'XTickLabel',title,'XLim',[0 9],'YLim',[0 1])
set(Tb,'BarWidth',1)
pattern = legend('PC1','PC2','PC3');
set(pattern,'FontSize',6)
ylabel('Loading')
% axes3
hTaxes3 = axes('Parent',hTpanel,'Units','normalized','Position',Tpaxes3,...
    'NextPlot','add','tag','Tax3');
scoreplot_v2(TPC,Tscore,title);
view(2)

% Lunar panel
hLpanel = uipanel(hf,'units','normalized','Position',Lppanel,...
    'Title','Lunar Sample','FontSize',13,'Tag','Lpanel');
% axes1
hLaxes1 = axes('Parent',hLpanel,'Units','normalized','Position',Lpaxes1,...
    'ALimMode','manual','tag','Tax1','xlim',[0 11],'ylim',[0 100],'xtick',[1:10]);
hLPCbar = bar(Lexplained);
set(hLPCbar,'tag','Lexpalined')
set(hLaxes1,'xlim',[0 9],'ylim',[0 100])
xlabel('Principal Component (Eigenvector)')
ylabel('Variance Explained %')
% axes2
hLaxes2 = axes('Parent',hLpanel,'Units','normalized','Position',Lpaxes2,...
    'NextPlot','add','ALimMode','manual','tag','Lax2');
Lb = bar([1:8],[abs(LPC(1,1:3));abs(LPC(2,1:3));abs(LPC(3,1:3));...
    abs(LPC(4,1:3));abs(LPC(5,1:3));abs(LPC(6,1:3));abs(LPC(7,1:3));...
    abs(LPC(8,1:3))]);
set(hLaxes2,'xtick',[1:8],'XTickLabel',title,'XLim',[0 9],'YLim',[0 1])
ylabel('Loading')
set(Lb,'BarWidth',1)
pattern = legend('PC1','PC2','PC3');
set(pattern,'FontSize',6)
% axes3
hLaxes3 = axes('Parent',hLpanel,'Units','normalized','Position',Lpaxes3,...
    'NextPlot','add','NextPlot','add','tag','Tax3');
scoreplot_v2(LPC,Lscore,title);
view(2)

% Comparison plot set up
hCaxes = axes('units','normalized','position',Cpaxes,'box','on',...
    'tag','Comparisonaxes','NextPlot','add','XGrid','on','YGrid','on',...
    'ZGrid','on','color',[0.95 0.95 0.95]);
T3D = scatter3(TatPC(:,1),TatPC(:,2),TatPC(:,3),'o','markerfacecolor','k',...
    'markeredgecolor','none','MarkerFaceAlpha',.7,'tag','T3Dscatter');
hold on
L3D = scatter3(LatPC(:,1),LatPC(:,2),LatPC(:,3),'o','markerfacecolor','r',...
    'markeredgecolor','none','MarkerFaceAlpha',.7,'tag','L3Dscatter');
xlabel(['PC1 (',num2str(round(Texplained(1))),'%)'])
ylabel(['PC2 (',num2str(round(Texplained(2))),'%)'])
zlabel(['PC3 (',num2str(round(Texplained(3))),'%)'])
legend(hCaxes,'Terrestrial Samples','Lunar Mare Basalt','Location','northwest')
view(3)

% control part set up
hTtext = uicontrol(hf,'style','text','units','normalized',...
    'position',ptext,'String','SiO2 Concentration upper limit',...
    'FontSize',13,'HorizontalAlignment','left');
hTtext = uicontrol(hf,'style','text','units','normalized',...
    'position',Tptext,'String',['%  > ',num2str(min(Tdata(:,1))),' %'],...
    'FontSize',12,'HorizontalAlignment','left');
hTtext = uicontrol(hf,'style','text','units','normalized',...
    'position',Lptext,'String',['%  > ',num2str(min(Ldata(:,1))),' %'],...
    'FontSize',12,'HorizontalAlignment','left');

hTedit = uicontrol(hf,'style','edit','units','normalized','String','100',...
    'position',Tpedit,'tag','Tedit','callback',@range);
hLedit = uicontrol(hf,'style','edit','units','normalized','String','100',...
    'position',Lpedit,'tag','Ledit','callback',@range);

hfram = uicontrol(hf,'style','listbox','units','normalized','value',1,...
    'position',Cplist,'String',{'Terrestrial PC axes','Lunar PC axes'},...
    'FontSize',12,'tag','frame','HorizontalAlignment','left','callback',@changeframe);
hppb2 = uicontrol(hf,'style','pushbutton','units','normalized',...
    'position',ppb2,'String','View 2D',...
    'FontSize',13,'tag','plot','HorizontalAlignment','left','callback',@view2D);
hppb3 = uicontrol(hf,'style','pushbutton','units','normalized',...
    'position',ppb3,'String','View 3D',...
    'FontSize',13,'tag','plot','HorizontalAlignment','left','callback',@view3D);
hpbq= uicontrol(hf,'style','pushbutton','units','normalized',...
    'position',ppbq,'String','QUIT',...
    'FontSize',13,'tag','plot','HorizontalAlignment','left','callback',@quit);

hTr = uicontrol(hf,'style','radiobutton','units','normalized','value',1,...
    'position',CTpr,'string','Terrestrial Samples',...
    'FontSize',12,'tag','TSample','callback',@Samvisible);
hLr = uicontrol(hf,'style','radiobutton','units','normalized','value',1,...
    'position',CLpr,'string','Lunar Samples',...
    'FontSize',12,'tag','LSample','callback',@Samvisible);

hpopx = uicontrol(hf,'style','popupmenu','units','normalized','value',1,...
    'position',Cpx,'string',PCaxesstring,'FontSize',12,'tag','PCX',...
    'callback',@axischange);
hpopy = uicontrol(hf,'style','popupmenu','units','normalized','value',2,...
    'position',Cpy,'string',PCaxesstring,'FontSize',12,'tag','PCY',...
    'callback',@axischange);
hpopz = uicontrol(hf,'style','popupmenu','units','normalized','value',3,...
    'position',Cpz,'string',PCaxesstring,'FontSize',12,'tag','PCZ',...
    'callback',@axischange);

htextx = uicontrol(hf,'style','text','units','normalized',...
    'position',Cpxtext,'string','X-axis','FontSize',12,'tag','XAxis');
htexty = uicontrol(hf,'style','text','units','normalized',...
    'position',Cpytext,'string','Y-axis','FontSize',12,'tag','YAxis');
htextz = uicontrol(hf,'style','text','units','normalized',...
    'position',Cpztext,'string','Z-axis','FontSize',12,'tag','ZAxis');

end
%% callback functions
function changeframe(hObj,eventdata)
global Tdata Ldata TPC LPC Texplained Lexplained
hf = gcbf;
hlist = hObj;
Vx = get(findobj(hf,'tag','PCX'),'value');
Vy = get(findobj(hf,'tag','PCY'),'value');
Vz = get(findobj(hf,'tag','PCZ'),'value');
if get(hlist,'value')==1
    PC = TPC;
    explained = Texplained;
elseif get(hlist,'value')==2
    PC = LPC;
    explained = Lexplained;
end
TatPC = Tdata*PC(:,[Vx,Vy,Vz]);
LatPC = Ldata*PC(:,[Vx,Vy,Vz]);
T3D = findobj(hf,'Tag','T3Dscatter');
L3D = findobj(hf,'Tag','L3Dscatter');
set(T3D,'XData',TatPC(:,1),'YData',TatPC(:,2),'ZData',TatPC(:,3));
set(L3D,'XData',LatPC(:,1),'YData',LatPC(:,2),'ZData',LatPC(:,3));
hCaxes = findobj(hf,'tag','Comparisonaxes');
set(hCaxes.XLabel,'String',['PC',num2str(Vx),' (',num2str(round(explained(Vx))),'%)'])
set(hCaxes.YLabel,'String',['PC',num2str(Vy),' (',num2str(round(explained(Vy))),'%)'])
set(hCaxes.ZLabel,'String',['PC',num2str(Vz),' (',num2str(round(explained(Vz))),'%)'])
end

function Samvisible(hObj,eventdata)
hf = gcbf;
hr = hObj;
if strcmpi(get(hr,'tag'),'Tsample')
    Sca = findobj(hf,'tag','T3Dscatter');
else
    Sca = findobj(hf,'tag','L3Dscatter');
end
if get(hr,'value')==0
    set(Sca,'visible','off')
else
    set(Sca,'visible','on')
end
end

function axischange(hObj,eventdata)
global TPC LPC Tdata Ldata Texplained Lexplained
hf = gcbf;
hpop = hObj;
% declare the frame
if get(findobj(hf,'Tag','frame'),'value')==1
    explained = Texplained;
    PC = TPC;
elseif get(findobj(hf,'Tag','frame'),'value')==2
    explained = Lexplained;
    PC = LPC;
end
% change PC
hCaxes = findobj(hf,'tag','Comparisonaxes');
T3D = findobj(hf,'tag','T3Dscatter');
L3D = findobj(hf,'tag','L3Dscatter');
V = get(hpop,'value');
if strcmpi(get(hpop,'tag'),'PCX')
    set(T3D,'XData',Tdata*PC(:,V));
    set(L3D,'XData',Ldata*PC(:,V));
    set(hCaxes.XLabel,'String',['PC',num2str(V),' (',num2str(round(explained(V))),'%)'])
elseif strcmpi(get(hpop,'tag'),'PCY')
    set(T3D,'YData',Tdata*PC(:,V));
    set(L3D,'YData',Ldata*PC(:,V));
    set(hCaxes.YLabel,'String',['PC',num2str(V),' (',num2str(round(explained(V))),'%)'])
elseif strcmpi(get(hpop,'tag'),'PCZ')
    set(T3D,'ZData',Tdata*PC(:,V));
    set(L3D,'ZData',Ldata*PC(:,V));
    set(hCaxes.ZLabel,'String',['PC',num2str(V),' (',num2str(round(explained(V))),'%)'])
end
end

function range(hObj,eventdata)
global TData LData Tdata Ldata LPC Lscore Lexplained TPC Tscore...
    Texplained title Tpaxes3 Lpaxes3 Tpaxes2 Lpaxes2
hf = gcbf;
hedit = hObj;
% calculate data
V = str2double(get(hedit,'String'));
if strcmpi(get(hedit,'tag'),'Tedit')
    Tdata = TData; % original data
    Tdata = Tdata([find(Tdata(:,1)<V);find(isnan(TData(:,1)))],:);
    [TPC,Tscore,~,~,Texplained] = pca(Tdata);
    % change Lunar panel
    hTpanel = findobj(hf,'tag','Tpanel');
    % plot axes1
    hTPCbar = findobj(hTpanel,'tag','Texpalined');
    set(hTPCbar,'YData',Texplained)
    % plot axes2
    hTaxes2 = findobj(hTpanel,'tag','Tax2');
    set(hTaxes2.Children(3),'YData',abs(TPC(:,1)))
    set(hTaxes2.Children(2),'YData',abs(TPC(:,2)))
    set(hTaxes2.Children(1),'YData',abs(TPC(:,3)))
    % plot axes3
    hTaxes3 = findobj(hTpanel,'tag','Tax3');
    delete(hTaxes3)
    hTaxes3 = axes('Parent',hTpanel,'Units','normalized','Position',Tpaxes3,...
        'NextPlot','add','NextPlot','add','tag','Tax3');
    scoreplot_v2(TPC,Tscore,title)
elseif strcmpi(get(hedit,'tag'),'Ledit')
    Ldata = LData; % original data
    Ldata = Ldata([find(Ldata(:,1)<V);find(isnan(LData(:,1)))],:);
    [LPC,Lscore,~,~,Lexplained] = pca(Ldata);
    % change Lunar panel
    hLpanel = findobj(hf,'tag','Lpanel');
    % plot axes1
    hLPCbar = findobj(hLpanel,'tag','Lexpalined');
    set(hLPCbar,'YData',Lexplained)
    % plot axes2
    hLaxes2 = findobj(hLpanel,'tag','Lax2');
    set(hLaxes2.Children(3),'YData',abs(LPC(:,1)))
    set(hLaxes2.Children(2),'YData',abs(LPC(:,2)))
    set(hLaxes2.Children(1),'YData',abs(LPC(:,3)))
    % replot axes3
    hLaxes3 = findobj(hLpanel,'tag','Lax3');
    delete(hLaxes3)
    hLaxes3 = axes('Parent',hLpanel,'Units','normalized','Position',Lpaxes3,...
        'NextPlot','add','NextPlot','add','tag','Lax3');
    scoreplot_v2(LPC,Lscore,title)
end
% update the comparison value
% declare the frame
hCaxes = findobj(hf,'tag','Comparisonaxes');
Vx = get(findobj(hf,'tag','PCX'),'value');
Vy = get(findobj(hf,'tag','PCY'),'value');
Vz = get(findobj(hf,'tag','PCZ'),'value');
T3D = findobj(hf,'tag','T3Dscatter');
L3D = findobj(hf,'tag','L3Dscatter');

TtDATA = Tdata*TPC(:,[Vx Vy Vz]);
LtDATA = Ldata*TPC(:,[Vx Vy Vz]);
TlDATA = Tdata*LPC(:,[Vx Vy Vz]);
LlDATA = Ldata*LPC(:,[Vx Vy Vz]);
if get(findobj(hf,'Tag','frame'),'value') == 1
    set(T3D,'XData',TtDATA(:,1),'YData',TtDATA(:,2),'ZData',TtDATA(:,3));
    set(L3D,'XData',LtDATA(:,1),'YData',LtDATA(:,2),'ZData',LtDATA(:,3));
    set(hCaxes.XLabel,'String',['PC',num2str(Vx),' (',num2str(round(Texplained(Vx))),'%)'])
    set(hCaxes.YLabel,'String',['PC',num2str(Vy),' (',num2str(round(Texplained(Vy))),'%)'])
    set(hCaxes.ZLabel,'String',['PC',num2str(Vz),' (',num2str(round(Texplained(Vz))),'%)'])
elseif get(findobj(hf,'Tag','frame'),'value') == 2
    set(T3D,'XData',TlDATA(:,1),'YData',TlDATA(:,2),'ZData',TlDATA(:,3));
    set(L3D,'XData',LlDATA(:,1),'YData',LlDATA(:,2),'ZData',LlDATA(:,3));
    set(hCaxes.XLabel,'String',['PC',num2str(Vx),' (',num2str(round(Lexplained(Vx))),'%)'])
    set(hCaxes.YLabel,'String',['PC',num2str(Vy),' (',num2str(round(Lexplained(Vy))),'%)'])
    set(hCaxes.ZLabel,'String',['PC',num2str(Vz),' (',num2str(round(Lexplained(Vz))),'%)'])
    
end
legend(hCaxes,'Terrestrial Samples','Lunar Mare Basalt','Location','northwest')

end



function view2D (hObj,eventdata)
hf = gcbf;
hppb = hObj;
hCaxes = findobj(hf,'tag','Comparisonaxes');
set(hCaxes,'view',[0 90])
end
function view3D (hObj,eventdata)
hf = gcbf;
hppb = hObj;
hCaxes = findobj(hf,'tag','Comparisonaxes');
set(hCaxes,'view',[-37.5 30])
end
function quit(hObj,eventdata)
close all
end
