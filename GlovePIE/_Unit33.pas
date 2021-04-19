//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit33;

interface

uses
  SysUtils, Classes, StdActns, Forms, Controls, DwmApi, Graphics, ImgList, Menus;

type
  THintAction = class(TCustomAction)
  published
    constructor Create;//004DE298
  public
    constructor Create; virtual;//v2C//004DE298
  end;
  TScrollBarKind = (sbHorizontal, sbVertical);
  TScrollBarStyle = (ssRegular, ssFlat, ssHotTrack);
  TControlScrollBar = class(TPersistent)
  published
    function IsScrollBarVisible:Boolean;//004E5C38
    procedure ChangeBiDiPosition;//004E5A78
    procedure Assign(Source:TPersistent);//004E5A28
  public
    FControl:TScrollingWinControl;//f4
    FIncrement:TScrollBarInc;//f8
    FPageIncrement:TScrollBarInc;//fA
    FPosition:Integer;//fC
    FRange:Integer;//f10
    FCalcRange:Integer;//f14
    FKind:TScrollBarKind;//f18
    FMargin:Word;//f1A
    FVisible:Boolean;//f1C
    FTracking:Boolean;//f1D
    FScaled:Boolean;//f1E
    FSmooth:Boolean;//f1F
    FDelay:Integer;//f20
    FButtonSize:Integer;//f24
    FColor:TColor;//f28
    FParentColor:Boolean;//f2C
    FSize:Integer;//f30
    FStyle:TScrollBarStyle;//f34
    FThumbSize:Integer;//f38
    FPageDiv:Integer;//f3C
    FLineDiv:Integer;//f40
    FUpdateNeeded:Boolean;//f44
    procedure Assign(Source:TPersistent); virtual;//v8//004E5A28
    constructor Create(AControl:TScrollingWinControl; AKind:TScrollBarKind);//004E5994
    procedure IsStoredIncrement(Value:TScrollBarInc);//004E5A20
    procedure CalcAutoRange;//004E5B8C
    function ControlSize(ControlSB:Boolean; AssumeSB:Boolean):Integer;//004E5D18
    function GetScrollPos:Integer;//004E5D98
    function NeedsScrollBarVisible:Boolean;//004E5DA8
    procedure ScrollMessage(var Msg:TWMScroll);//004E5E1C
    procedure SetButtonSize(Value:Integer);//004E611C
    procedure SetColor(Value:TColor);//004E615C
    procedure SetParentColor(Value:Boolean);//004E6178
    procedure SetPosition(Value:Integer);//004E6190
    procedure SetSize(Value:Integer);//004E624C
    procedure SetStyle(Value:TScrollBarStyle);//004E628C
    procedure SetThumbSize(Value:Integer);//004E62A4
    procedure DoSetRange(Value:Integer);//004E62BC
    procedure SetRange(Value:Integer);//004E62D4
    function IsRangeStored(Value:Integer):Boolean;//004E62E8
    procedure SetVisible(Value:Boolean);//004E62F8
    procedure Update(ControlSB:Boolean; AssumeSB:Boolean);//004E640C
  end;
  TWindowState = (wsNormal, wsMinimized, wsMaximized);
  TScrollingWinControl = class(TWinControl)
  published
    constructor Create;//004E6520
    procedure DisableAutoRange;//004E69F4
    destructor Destroy();//004E65C4
    procedure EnableAutoRange;//004E69FC
    procedure ScrollInView(AControl:TControl);//004E6A80
  public
    FAutoRangeCount:Integer;//f270
    FAutoScroll:Boolean;//f274
    FHorzScrollBar:TControlScrollBar;//f278
    FPanPoint:TPoint;//f27C
    FUpdatingScrollBars:Boolean;//f284
    FVertScrollBar:TControlScrollBar;//f288
    destructor Destroy(); virtual;//004E65C4
    constructor Create; virtual;//v2C//004E6520
    procedure DoGesture(const EventInfo:TGestureEventInfo; var Handled:Boolean); virtual;//v44//004E67B8
    procedure DoGetGestureOptions(var Gestures:TInteractiveGestures; var Options:TInteractiveGestureOptions); virtual;//v48//004E682C
    procedure AdjustClientRect(var Rect:TRect); virtual;//vA0//004E6DD8
    procedure AlignControls(AControl:TControl; var ARect:TRect); virtual;//vA4//004E6660
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004E6610
    procedure CreateWnd; virtual;//vB4//004E6620
    function AutoScrollEnabled:Boolean; virtual;//vEC//004E6680
    procedure AutoScrollInView(AControl:TControl); virtual;//vF0//004E69D8
    procedure vF4; virtual;//vF4//004E6C9C
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//004E6CA0
    procedure WMHScroll(Message:TWMCommand); message WM_HSCROLL;//004E6D90
    procedure WMVScroll(Message:TWMHScroll); message WM_VSCROLL;//004E6DB4
    procedure CMBiDiModeChanged(var Message:TMessage); message CM_BIDIMODECHANGED;//004E6E58
    procedure DoFlipChildren; dynamic;//004E66A0
    procedure IsTouchPropertyStored(AProperty:TTouchProperty); dynamic;//004E6A34
    procedure ChangeScale(M:Integer; D:Integer); dynamic;//004E6C78
    procedure CalcAutoRange;//004E6860
    procedure SetAutoScroll(Value:Boolean);//004E6884
    procedure SetHorzScrollBar(Value:TControlScrollBar);//004E68C0
    procedure SetVertScrollBar(Value:TControlScrollBar);//004E68D0
    procedure UpdateScrollBars;//004E68E0
    procedure ScaleScrollBars(M:Integer; D:Integer);//004E6BD4
  end;
  TFormBorderStyle = (bsNone, bsSingle, bsSizeable, bsDialog, bsToolWindow, bsSizeToolWin);
  TBorderStyle = (bsNone, bsSingle);
  TPopupWnd = TPopupWnd = record//size=8
ID:Integer;//f0
ControlWnd:HWND;//f4
end;;
  TPopupWndArray = array of TPopupWnd;
//elSize = 8;
  TFormStyle = (fsNormal, fsMDIChild, fsMDIForm, fsStayOnTop);
  TBorderIcon = (biSystemMenu, biMinimize, biMaximize, biHelp);
  TBorderIcons = set of TBorderIcon;
  TPosition = (poDesigned, poDefault, poDefaultPosOnly, poDefaultSizeOnly, poScreenCenter, poDesktopCenter, poMainFormCenter, poOwnerFormCenter);
  TDefaultMonitor = (dmDesktop, dmPrimary, dmMainForm, dmActiveForm);
  TPrintScale = (poNone, poProportional, poPrintToFit);
  TShowAction = (saIgnore, saRestore, saMinimize, saMaximize);
  TTileMode = (tbHorizontal, tbVertical);
  TCloseAction = (caNone, caHide, caFree, caMinimize);
  TCloseEvent = procedure(Sender:TObject; var Action:TCloseAction) of object;;
  TCloseQueryEvent = procedure(Sender:TObject; var CanClose:Boolean) of object;;
  :6 = (fsCreating, fsVisible, fsShowing, fsModal, fsCreatedMDIChild, fsActivated);
  TFormState = set of :6;
  TShortCutEvent = procedure(var Msg:TWMKey; var Handled:Boolean) of object;;
  THelpEvent = function(Command:Word; Data:Integer; var CallHelp:Boolean):Boolean of object;;
  TPopupMode = (pmNone, pmAuto, pmExplicit);
  TGlassFrame = class(TPersistent)
  published
    function FrameExtended:Boolean;//004F36C4
    function IntersectsControl(Control:TControl):Boolean;//004F36FC
    constructor Create;//004F35BC
    procedure Assign(Source:TPersistent);//004F3610
  public
    FClient:TCustomForm;//f4
    FEnabled:Boolean;//f8
    FLeft:Integer;//fC
    FTop:Integer;//f10
    FRight:Integer;//f14
    FBottom:Integer;//f18
    FOnChange:TNotifyEvent;//f20
    FSheetOfGlass:Boolean;//f28
    procedure Assign(Source:TPersistent); virtual;//v8//004F3610
    procedure Change; virtual;//vC//004F3668
    procedure SetEnabled(Value:Boolean);//004F37E0
    procedure SetExtendedFrame(Index:Integer; Value:Integer);//004F3810
    procedure SetSheetOfGlass(Value:Boolean);//004F3870
  end;
  TCustomForm = class(TScrollingWinControl)
  published
    procedure IsShortCut(var Message:TWMKey);//004ED59C
    procedure Release;//004ECE2C
    procedure Hide;//004ECD50
    procedure RecreateAsPopup(AWindowHandle:HWND);//004ECDFC
    procedure GetChildren(Root:TComponent; Proc:TGetChildProc);//004E7D68
    procedure FocusControl(Control:TWinControl);//004EAA1C
    procedure Print;//004ECB20
    function GetFormImage:TBitmap;//004ECA08
    procedure MakeFullyVisible(AMonitor:TMonitor);//004ED818
    function WantChildKey(Child:TControl; var Message:TMessage):Boolean;//004E7FE4
    procedure set_PopupParent(Value:TCustomForm);//004E97E4
    function ShowModal:Integer;//004ECE48
    function SetFocusedControl(Control:TWinControl):Boolean;//004EAA88
    procedure Show;//004ECD58
    procedure SendCancelMode(Sender:TControl);//004EAE0C
    procedure MouseWheelHandler(var Message:TMessage);//004ED650
    procedure SetFocus;//004ECD70
    procedure AfterConstruction;//004E70A8
    procedure BeforeDestruction;//004E729C
    constructor CreateNew(Dummy:Integer);//004E7254
    destructor Destroy();//004E7310
    constructor Create;//004E6EE8
    function CloseQuery:Boolean;//004EC90C
    //procedure DefaultHandler(var Message:?);//004EA894
    procedure Close;//004EC868
    procedure Dock(NewDockSite:TWinControl; ARect:TRect);//004E9000
    procedure DefocusControl(Control:TWinControl; Removing:Boolean);//004EA9D4
  public
    FActiveControl:TWinControl;//f290
    FFocusedControl:TWinControl;//f294
    FBorderIcons:TBorderIcons;//f298
    FBorderStyle:TFormBorderStyle;//f299
    FWindowState:TWindowState;//f29A
    FShowAction:TShowAction;//f29B
    FKeyPreview:Boolean;//f29C
    FActive:Boolean;//f29D
    FFormStyle:TFormStyle;//f29E
    FPosition:TPosition;//f29F
    FDefaultMonitor:TDefaultMonitor;//f2A0
    FTileMode:TTileMode;//f2A1
    FDropTarget:Boolean;//f2A2
    FPrintScale:TPrintScale;//f2A3
    FCanvas:TControlCanvas;//f2A4
    FHelpFile:string;//f2A8
    FIcon:TIcon;//f2AC
    FInCMParentBiDiModeChanged:Boolean;//f2B0
    FMenu:TMainMenu;//f2B4
    FModalResult:TModalResult;//f2B8
    FDesigner:IDesignerHook;//f2BC
    FWindowMenu:TMenuItem;//f2C0
    FPixelsPerInch:Integer;//f2C4
    FObjectMenuItem:TMenuItem;//f2C8
    FOleForm:IOleForm;//f2CC
    FClientWidth:Integer;//f2D0
    FClientHeight:Integer;//f2D4
    FTextHeight:Integer;//f2D8
    FDefClientProc:Pointer;//f2DC
    FActiveOleControl:TWinControl;//f2E0
    FSavedBorderStyle:TFormBorderStyle;//f2E4
    FOnActivate:TNotifyEvent;//f2E8
    FOnClose:TCloseEvent;//f2F0
    FOnCloseQuery:TCloseQueryEvent;//f2F8
    FOnDeactivate:TNotifyEvent;//f300
    FOnHelp:THelpEvent;//f308
    FOnHide:TNotifyEvent;//f310
    FOnPaint:TNotifyEvent;//f318
    FOnShortCut:TShortCutEvent;//f320
    FOnShow:TNotifyEvent;//f328
    FOnCreate:TNotifyEvent;//f330
    FOnDestroy:TNotifyEvent;//f338
    FAlphaBlend:Boolean;//f340
    FAlphaBlendValue:Byte;//f341
    FPopupChildren:TList;//f344
    FPopupMode:TPopupMode;//f348
    FPopupParent:TCustomForm;//f34C
    FRecreateChildren:TList;//f350
    FPopupWnds:TPopupWndArray;//f354
    FInternalPopupParent:TCustomForm;//f358
    FInternalPopupParentWnd:HWND;//f35C
    FScreenSnap:Boolean;//f360
    FSnapBuffer:Integer;//f364
    FTransparentColor:Boolean;//f368
    FTransparentColorValue:TColor;//f36C
    FCreatingMainForm:Boolean;//f370
    FGlassFrame:TGlassFrame;//f374
    FRefreshGlassFrame:Boolean;//f378
    FOldCreateOrder:Boolean;//f379
    FClientHandle:HWND;//f37C
    FClientInstance:Pointer;//f380
    FFormState:TFormState;//f384
    procedure AfterConstruction; virtual;//004E70A8
    procedure BeforeDestruction; virtual;//004E729C
    //procedure DefaultHandler(var Message:?); virtual;//004EA894
    destructor Destroy(); virtual;//004E7310
    procedure DefineProperties(Filer:TFiler); virtual;//v4//004E7970
    procedure Loaded; virtual;//vC//004E7520
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//004E75A4
    procedure ReadState(Reader:TReader); virtual;//v14//004E76E0
    procedure ValidateRename(AComponent:TComponent; const CurName:UnicodeString; const NewName:UnicodeString); virtual;//v20//004E80A4
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; virtual; stdcall;//v28//004ED614
    constructor Create; virtual;//v2C//004E6EE8
    function GetClientRect:TRect; virtual;//v54//004E7CE0
    function GetFloating:Boolean; virtual;//v60//004E7DEC
    procedure RequestAlign; virtual;//v68//004ED2C8
    procedure SetParent(AParent:TWinControl); virtual;//v78//004E7FE8
    procedure SetParentBiDiMode(Value:Boolean); virtual;//v7C//004E7EA4
    procedure WndProc(var Message:TMessage); virtual;//v84//004E80E4
    procedure AlignControls(AControl:TControl; var Rect:TRect); virtual;//vA4//004E88FC
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004E9DA4
    procedure CreateWindowHandle(const Params:TCreateParams); virtual;//vB0//004EA5A0
    procedure CreateWnd; virtual;//vB4//004EA3A0
    procedure DestroyHandle; virtual;//vC0//004EA71C
    procedure DestroyWindowHandle; virtual;//vC4//004EA850
    procedure PaintWindow(DC:HDC); virtual;//vD4//004EAFEC
    procedure SetFocus; virtual;//vE8//004ECD70
    procedure Resizing(State:TWindowState); virtual;//vF4//004EB8B8
    procedure ClientWndProc(var Message:TMessage); virtual;//vF8//004E8718
    procedure DoCreate; virtual;//vFC//004E7444
    procedure DoDestroy; virtual;//v100//004E74C0
    procedure UpdateActions; virtual;//v104//004ED208
    constructor CreateNew(Dummy:Integer); virtual;//v108//004E7254
    function CloseQuery:Boolean; virtual;//v10C//004EC90C
    function SetFocusedControl(Control:TWinControl):Boolean; virtual;//v110//004EAA88
    function ShowModal:Integer; virtual;//v114//004ECE48
    function WantChildKey(Child:TControl; var Message:TMessage):Boolean; virtual;//v118//004E7FE4
    procedure WMDestroy(var Message:TWMDestroy); message WM_DESTROY;//004EB5B4
    procedure WMActivate(var Message:TWMActivate); message WM_ACTIVATE;//004EB874
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//004EB28C
    procedure WMClose; message WM_CLOSE;//004EB8F0
    procedure WMQueryEndSession(var Message:TWMQueryEndSession); message WM_QUERYENDSESSION;//004EB8F8
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//004EB38C
    procedure WMShowWindow(var Message:TWMShowWindow); message WM_SHOWWINDOW;//004EB9F4
    procedure WMSettingChange(var Message:TMessage); message WM_SETTINGCHANGE;//004ED2E8
    procedure WMGetMinMaxInfo(var Message:TWMGetMinMaxInfo); message WM_GETMINMAXINFO;//004EBD4C
    procedure WMIconEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ICONERASEBKGND;//004EB32C
    procedure WMNextDlgCtl(var Message:TWMNextDlgCtl); message WM_NEXTDLGCTL;//004EBAF8
    procedure WMQueryDragIcon(var Message:TWMQueryDragIcon); message WM_QUERYDRAGICON;//004EB3C0
    procedure WMWindowPosChanging(var Message:TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;//004EBDE4
    procedure WMHelp(var Message:TWMHelp); message WM_HELP;//004EBBEC
    procedure WMNCCreate(var Message:TWMNCCreate); message WM_NCCREATE;//004EB4D0
    procedure WMNCCalcSize(var Message:TWMNCCalcSize); message WM_NCCALCSIZE;//004EBFC8
    procedure WMNCHitTest(var Message:TWMNCHitTest); message WM_NCHITTEST;//004EB504
    procedure WMNCPaint(var Message:TWMNCPaint); message WM_NCPAINT;//004EB304
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown); message WM_NCLBUTTONDOWN;//004EB528
    procedure WMCommand(Message:TWMCharToItem); message WM_COMMAND;//004EB748
    procedure WMSysCommand(var Message:TWMSysCommand); message WM_SYSCOMMAND;//004EB96C
    procedure WMInitMenuPopup(var Message:TWMInitMenuPopup); message WM_INITMENUPOPUP;//004EB77C
    procedure WMGestureNotify(var Message:TWMGestureNotify); dynamic;//004EC01C
    procedure WMMenuSelect(var Message:TWMMenuSelect); message WM_MENUSELECT;//004EB7CC
    procedure WMMenuChar(var Message:TWMMenuChar); message WM_MENUCHAR;//004EB794
    procedure WMEnterMenuLoop(var Message:TMessage); message WM_ENTERMENULOOP;//004EBB24
    procedure WMMDIActivate(var Message:TWMMDIActivate); message WM_MDIACTIVATE;//004EBAA0
    procedure CMActivate(var Message:TCMActivate); message CM_ACTIVATE;//004EC024
    procedure CMDeactivate(var Message:TCMDeactivate); message CM_DEACTIVATE;//004EC048
    procedure CMDialogKey(var Message:TCMDialogKey); message CM_DIALOGKEY;//004EC068
    procedure CMParentFontChanged(var Message:TCMParentFontChanged); message CM_PARENTFONTCHANGED;//004EC7F8
    procedure CMColorChanged(var Message:TMessage); message CM_COLORCHANGED;//004E9884
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//004E9918
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//004E98D0
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//004EC79C
    procedure CMMenuChanged(var Message:TMessage); message CM_MENUCHANGED;//004E9938
    procedure CMAppSysCommand(var Message:TMessage); message CM_APPSYSCOMMAND;//004EB914
    procedure CMShowingChanged(var Message:TMessage); message CM_SHOWINGCHANGED;//004EC104
    procedure CMIconChanged(var Message:TMessage); message CM_ICONCHANGED;//004EC774
    procedure CMRelease; message CM_RELEASE;//004EC794
    procedure CMUIActivate(var Message:void ); message CM_UIACTIVATE;//004EC7EC
    procedure CMBiDiModeChanged(var Message:TMessage); message CM_BIDIMODECHANGED;//004E89B8
    procedure CMParentBiDiModeChanged(var Message:TMessage); message CM_PARENTBIDIMODECHANGED;//004E8A50
    procedure CMActionUpdate(var Message:TMessage); message CM_ACTIONUPDATE;//004ED4CC
    procedure CMActionExecute(var Message:TMessage); message CM_ACTIONEXECUTE;//004ED3C0
    procedure CMIsShortCut(var Message:TWMKey); message CM_DOCKNOTIFICATION;//004EC830
    procedure CMUpdateActions(var Message:TMessage); message CM_RAWX11EVENT;//004EC85C
    procedure CMPopupHwndDestroy(var Message:TCMPopupHWndDestroy); dynamic;//004E8AE0
    procedure IsShortCut(var Message:TWMKey); dynamic;//004ED59C
    procedure Paint; dynamic;//004EAFB0
    procedure InitializeNewForm; dynamic;//004E70E0
    procedure HandleCreateException; dynamic;//004ED688
    procedure GetOwnerWindow; dynamic;//004E7DD4
    procedure GetBorderStyles(var Style:Cardinal; var ExStyle:Cardinal; var ClassStyle:Cardinal); dynamic;//004E8D4C
    procedure GetBorderIconStyles(var Style:Cardinal; var ExStyle:Cardinal); dynamic;//004E8B98
    procedure DoShow; dynamic;//004E7CC0
    procedure DoHide; dynamic;//004E7CA0
    procedure DoClose(var Action:TCloseAction); dynamic;//004E7C80
    procedure Deactivate; dynamic;//004EAF80
    procedure sub_004EAD2C; dynamic;//004EAD2C
    procedure Activate; dynamic;//004EAF50
    procedure MouseWheelHandler(var Message:TMessage); dynamic;//004ED650
    procedure Dock(NewDockSite:TWinControl; ARect:TRect); dynamic;//004E9000
    procedure VisibleChanging; dynamic;//004E7F78
    procedure PaletteChanged(Foreground:Boolean); dynamic;//004EB1E8
    procedure DoDock(NewDockSite:TWinControl; var ARect:TRect); dynamic;//004E9044
    procedure ChangeScale(M:Integer; D:Integer); dynamic;//004E7B30
    procedure BeginAutoDrag; dynamic;//004E7B2C
    procedure SetChildOrder(Child:TComponent; Order:Integer); dynamic;//004E7E10
    procedure GetChildren(Root:TComponent; Proc:TGetChildProc); dynamic;//004E7D68
    procedure ReadIgnoreFontProperty(Reader:TReader);//004E7A58
    procedure ReadTextHeight(Reader:TReader);//004E7A78
    procedure WriteTextHeight(Writer:TWriter);//004E7A90
    procedure WritePixelsPerInch(Writer:TWriter);//004E7AAC
    function GetLeft:Integer;//004E7AC8
    function GetTop:Integer;//004E7AE8
    function GetTextHeight:Integer;//004E7B04
    procedure IconChanged(Sender:TObject);//004E7BB8
    function IsClientSizeStored(Value:Integer):Boolean;//004E7C14
    function IsFormSizeStored(Value:Integer):Boolean;//004E7C24
    function IsAutoScrollStored(Value:Boolean):Boolean;//004E7C4C
    procedure SetClientWidth(Value:Integer);//004E7ECC
    procedure SetClientHeight(Value:Integer);//004E7F00
    procedure SetVisible(Value:Boolean);//004E7F34
    procedure SetDesigner(ADesigner:IDesignerHook);//004E8B48
    procedure SetBorderIcons(Value:TBorderIcons);//004E8C64
    procedure SetBorderStyle(Value:TFormBorderStyle);//004E8E60
    function get_ActiveMDIChild:TForm;//004E909C
    function get_MDIChildCount:Integer;//004E90D0
    function get_MDIChildren(I:Integer):TForm;//004E911C
    function GetMonitor:TMonitor;//004E919C
    function GetCanvas:TCanvas;//004E9238
    procedure SetIcon(Value:TIcon);//004E9240
    function IsForm(Value:TWinControl):Boolean;//004E924C
    function IsIconStored(Value:TIcon):Boolean;//004E9254
    procedure SetFormStyle(Value:TFormStyle);//004E927C
    procedure RefreshMDIMenu;//004E93F0
    procedure SetObjectMenuItem(Value:TMenuItem);//004E946C
    procedure SetWindowMenu(Value:TMenuItem);//004E9490
    procedure SetMenu(Value:TMainMenu);//004E94B8
    function GetPixelsPerInch:Integer;//004E96DC
    function GetPopupChildren:TList;//004E96F0
    function GetRecreateChildren:TList;//004E9718
    procedure SetPixelsPerInch(Value:Integer);//004E9740
    procedure SetPosition(Value:TPosition);//004E9774
    procedure SetPopupMode(Value:TPopupMode);//004E9790
    function GetScaled:Boolean;//004E9848
    procedure SetScaled(Value:Boolean);//004E9854
    function NormalColor:TColor;//004E98B8
    procedure SetWindowState(Value:TWindowState);//004E9954
    procedure SetWindowToMonitor;//004E9994
    procedure SetActiveControl(Control:TComponent);//004EA8F8
    procedure SetActiveOleControl(Control:TWinControl);//004EA9B8
    procedure SetWindowFocus;//004EAD30
    procedure SetActive(Value:Boolean);//004EADA8
    procedure MergeMenu(MergeState:Boolean);//004EAE5C
    function GetIconHandle:HICON;//004EAFD0
    procedure CloseModal;//004EC970
    procedure UpdateWindowState;//004ED274
    procedure SetLayeredAttribs;//004ED698
    procedure SetAlphaBlend(const Value:Boolean);//004ED774
    procedure SetAlphaBlendValue(const Value:Byte);//004ED788
    procedure SetTransparentColorValue(const Value:TColor);//004ED79C
    procedure SetTransparentColor(const Value:Boolean);//004ED7B0
    procedure InitAlphaBlending(var Params:TCreateParams);//004ED7EC
    procedure SetLeft(Value:Integer);//004ED904
    procedure SetTop(Value:Integer);//004ED940
    procedure SetGlassFrame(const Value:TGlassFrame);//004ED980
    procedure UpdateGlassFrame(Sender:TObject);//004ED98C
    procedure UpdateGlassFrameControls(const Rect:TRect);//004EDBCC
  end;
  TForm = class(TCustomForm)
  published
    procedure Previous;//004EDCA0
    procedure Tile;//004EDBF0
    procedure Next;//004EDC78
    procedure ArrangeIcons;//004EDC50
    procedure Cascade;//004EDC28
  end;
  TCustomDockForm = class(TCustomForm)
  published
    constructor Create;//004EDCC8
  public
    procedure Loaded; virtual;//vC//004EDE78
    constructor Create; virtual;//v2C//004EDCC8
    procedure WMNCHitTest(var Message:TWMNCHitTest); message WM_NCHITTEST;//004EDEF0
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown); message WM_NCLBUTTONDOWN;//004EDF18
    procedure CMVisibleChanged(var Message:TMessage); message CM_VISIBLECHANGED;//004EE13C
    procedure CMControlListChange(var Message:TMessage); message CM_CONTROLLISTCHANGE;//004EDFAC
    procedure CMUnDockClient(var Message:TCMUnDockClient); message CM_UNDOCKCLIENT;//004EE124
    procedure CMDockNotification(var Message:TCMDockNotification); dynamic;//004EE004
    procedure GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean); dynamic;//004EDEC4
    procedure DoRemoveDockClient(Client:TControl); dynamic;//004EDE58
    procedure DoAddDockClient(Client:TControl; const ARect:TRect); dynamic;//004EDD30
  end;
  TMonitor = class(TObject)
  public
    FHandle:HMONITOR;//f4
    FMonitorNum:Integer;//f8
    function GetLeft:Integer;//004EE17C
    function GetHeight:Integer;//004EE194
    function GetTop:Integer;//004EE1B0
    function GetWidth:Integer;//004EE1C8
    function GetBoundsRect:TRect;//004EE1E4
    function GetWorkareaRect:TRect;//004EE210
    function GetPrimary:Boolean;//004EE23C
  end;
  TCursorRec = TCursorRec = record//size=C
Next:PCursorRec;//f0
Index:Integer;//f4
Handle:HICON;//f8
end;;
  TMonitorDefaultTo = (mdNearest, mdNull, mdPrimary);
  TScreen = class(TComponent)
  published
    function MonitorFromWindow(Handle:Cardinal; MonitorDefault:TMonitorDefaultTo):TMonitor;//004EF8CC
    function MonitorFromRect(Rect:TRect; MonitorDefault:TMonitorDefaultTo):TMonitor;//004EF8A4
    procedure ResetFonts;//004EF4F4
    procedure Realign;//004EEF24
    function MonitorFromPoint(Point:TPoint; MonitorDefault:TMonitorDefaultTo):TMonitor;//004EF878
    destructor Destroy();//004EE484
    constructor Create;//004EE2F4
    procedure EnableAlign;//004EEF04
    procedure DisableAlign;//004EEEFC
  public
    FFonts:TStrings;//f34
    FImes:TStrings;//f38
    FDefaultIme:string;//f3C
    FDefaultKbLayout:HKL;//f40
    FPixelsPerInch:Integer;//f44
    FCursor:TCursor;//f48
    FCursorCount:Integer;//f4C
    FForms:TList;//f50
    FCustomForms:TList;//f54
    FDataModules:TList;//f58
    FMonitors:TList;//f5C
    FActiveControl:TWinControl;//f60
    FActiveCustomForm:TCustomForm;//f64
    FActiveForm:TForm;//f68
    FLastActiveControl:TWinControl;//f6C
    FLastActiveCustomForm:TCustomForm;//f70
    FFocusedForm:TCustomForm;//f74
    FSaveFocusedList:TList;//f78
    FHintFont:TFont;//f7C
    FIconFont:TFont;//f80
    FMenuFont:TFont;//f84
    FMessageFont:TFont;//f88
    FCaptionFont:TFont;//f8C
    FAlignLevel:Word;//f90
    FControlState:TControlState;//f92
    FOnActiveControlChange:TNotifyEvent;//f98
    FOnActiveFormChange:TNotifyEvent;//fA0
    FCursorList:PCursorRec;//fA8
    FDefaultCursor:HICON;//fAC
    destructor Destroy(); virtual;//004EE484
    constructor Create; virtual;//v2C//004EE2F4
    function GetHeight:Integer;//004EE5C0
    function GetWidth:Integer;//004EE5C8
    function GetDesktopTop:Integer;//004EE5D0
    function GetDesktopLeft:Integer;//004EE5D8
    function GetDesktopHeight:Integer;//004EE5E0
    function GetDesktopWidth:Integer;//004EE5E8
    function GetMonitor(Index:Integer):TMonitor;//004EE5F0
    function GetMonitorCount:Integer;//004EE604
    function GetForm(Index:Integer):TForm;//004EE61C
    function GetFormCount:Integer;//004EE630
    function GetCustomForms(Index:Integer):TCustomForm;//004EE638
    function GetCustomFormCount:Integer;//004EE64C
    procedure UpdateLastActive;//004EE654
    procedure AddForm(AForm:TCustomForm);//004EE6A0
    procedure RemoveForm(AForm:TCustomForm);//004EE6D8
    procedure AddDataModule(DataModule:TDataModule);//004EE730
    procedure RemoveDataModule(DataModule:TDataModule);//004EE73C
    procedure CreateCursors;//004EE748
    procedure DestroyCursors;//004EE7A0
    procedure DeleteCursor(Index:Integer);//004EE804
    function FindMonitor(Handle:HMONITOR):TMonitor;//004EE8A4
    procedure InsertCursor(Index:Integer; Handle:HCURSOR);//004EE8D0
    function GetImes:TStrings;//004EE8FC
    function GetDefaultIME:UnicodeString;//004EEB40
    procedure IconFontChanged(Sender:TObject);//004EEB5C
    function GetDataModule(Index:Integer):TDataModule;//004EEBAC
    function GetDataModuleCount:Integer;//004EEBC0
    function GetCursors(Index:Integer):HCURSOR;//004EEBC8
    procedure SetCursor(Value:TCursor);//004EEBF4
    procedure SetCursors(Index:Integer; Handle:HCURSOR);//004EEC9C
    procedure SetHintFont(Value:TFont);//004EECEC
    procedure SetIconFont(Value:TFont);//004EECFC
    procedure SetMenuFont(Value:TFont);//004EED0C
    procedure SetMessageFont(Value:TFont);//004EED1C
    procedure SetCaptionFont(Value:TFont);//004EED2C
    procedure GetMetricSettings;//004EED3C
    procedure AlignForms(AForm:TCustomForm; var Rect:TRect);//004EF314
    procedure AlignForm(AForm:TCustomForm);//004EF39C
    function GetFonts:TStrings;//004EF420
    function GetDesktopRect:TRect;//004EF7D0
    function GetWorkAreaHeight:Integer;//004EF800
    function GetWorkAreaLeft:Integer;//004EF81C
    function GetWorkAreaRect:TRect;//004EF834
    function GetWorkAreaTop:Integer;//004EF844
    function GetWorkAreaWidth:Integer;//004EF85C
    procedure ClearMonitors;//004EF8F4
    procedure GetMonitors;//004EF92C
    function GetPrimaryMonitor:TMonitor;//004EF99C
  end;
  TTimerMode = (tmShow, tmHide);
  TPopupForm = TPopupForm = record//size=C
FormID:Integer;//f0
Form:TCustomForm;//f4
WasPopup:Boolean;//f8
end;;
  TPopupFormArray = array of TPopupForm;
//elSize = C;
  TMessageEvent = procedure(var Msg:tagMSG; var Handled:Boolean) of object;;
  TExceptionEvent = procedure(Sender:TObject; E:Exception) of object;;
  TGetHandleEvent = procedure(var Handle:HWND) of object;;
  TIdleEvent = procedure(Sender:TObject; var Done:Boolean) of object;;
  TShowHintEvent = procedure(var HintStr:string; var CanShow:Boolean; var HintInfo:THintInfo) of object;;
  TWindowHook = function(var Message:TMessage):Boolean of object;;
  TSettingChangeEvent = procedure(Sender:TObject; Flag:Integer; const Section:string; var Result:Integer) of object;;
  :TApplication.:1 = array of HWND;
//elSize = 4
//varType equivalent: varInteger;
  TApplication = class(TComponent)
  published
    procedure NormalizeTopMosts;//004F0174
    procedure NormalizeAllTopMosts;//004F017C
    procedure ProcessMessages;//004F1668
    procedure Restore;//004F0F50
    procedure RemovePopupForm(APopupForm:TCustomForm);//004F0184
    function IsRightToLeft:Boolean;//004F04A0
    procedure Initialize;//004F1784
    procedure Minimize;//004F0E4C
    procedure ModalFinished;//004F0148
    procedure ModalStarted;//004F011C
    procedure RestoreTopMosts;//004F01D4
    function UseRightToLeftAlignment:Boolean;//004F04D0
    function UpdateAction(Action:TBasicAction):Boolean;//004F32B4
    function UseRightToLeftReading:Boolean;//004F04B8
    function MessageBox(Text:PWideChar; Caption:PWideChar; Flags:Integer):Integer;//004F1B28
    function UseRightToLeftScrollBar:Boolean;//004F04E8
    procedure ShowException(E:Exception);//004F1CA8
    procedure Run;//004F18EC
    procedure Terminate;//004F1A0C
    procedure UnhookSynchronizeWakeup;//004F3374
    procedure UnhookMainWindow(Hook:TWindowHook);//004F1704
    procedure HookSynchronizeWakeup;//004F3364
    procedure CancelHint;//004F2990
    procedure ControlDestroyed(Control:TControl);//004EFF60
    //procedure CreateForm(InstanceClass:TComponentClass; var Reference:?);//004F179C
    procedure DoApplicationIdle;//004F2498
    procedure CreateHandle;//004EFDA8
    destructor Destroy();//004EFC48
    constructor Create;//004EF9DC
    procedure ActivateHint(CursorPos:TPoint);//004F2C60
    procedure BringToFront;//004F1084
    function AddPopupForm(APopupForm:TCustomForm):Integer;//004F3010
    function ExecuteAction(Action:TBasicAction):Boolean;//004F328C
    function HelpShowTableOfContents:Boolean;//004F212C
    function HelpKeyword(Keyword:string):Boolean;//004F1F7C
    procedure HideHint;//004F291C
    procedure HookMainWindow(Hook:TWindowHook);//004F16A4
    procedure HintMouseMessage(Control:TControl; var Message:TMessage);//004F27C0
    procedure HandleMessage;//004F1680
    procedure HandleException(Sender:TObject);//004F1AA4
    function HelpCommand(Command:Integer; Data:Integer):Boolean;//004F2094
    function HelpJump(JumpID:string):Boolean;//004F209C
    function HelpContext(Context:THelpContext):Boolean;//004F200C
  public
    FAppIconic:Boolean;//f34
    FBiDiMode:TBiDiMode;//f35
    FBiDiKeyboard:string;//f38
    FDefaultFont:TFont;//f3C
    FNonBiDiKeyboard:string;//f40
    FMainForm:TForm;//f44
    FMouseControl:TControl;//f48
    FHelpSystem:IHelpSystem;//f4C
    FHelpFile:string;//f50
    FHint:string;//f54
    FHintActive:Boolean;//f58
    FUpdateFormatSettings:Boolean;//f59
    FUpdateMetricSettings:Boolean;//f5A
    FShowMainForm:Boolean;//f5B
    FHintColor:TColor;//f5C
    FHintControl:TControl;//f60
    FHintCursorRect:TRect;//f64
    FHintHidePause:Integer;//f74
    FHintPause:Integer;//f78
    FHintShortCuts:Boolean;//f7C
    FHintShortPause:Integer;//f80
    FHintWindow:THintWindow;//f84
    FShowHint:Boolean;//f88
    FTimerMode:TTimerMode;//f89
    FTimerHandle:Word;//f8A
    FTitle:string;//f8C
    FTopMostList:TList;//f90
    FTopMostLevel:Integer;//f94
    FPopupOwners:TList;//f98
    FPopupLevel:Integer;//f9C
    FIcon:TIcon;//fA0
    FTerminate:Boolean;//fA4
    FActive:Boolean;//fA5
    FAllowTesting:Boolean;//fA6
    FTestLib:Cardinal;//fA8
    FHandleCreated:Boolean;//fAC
    FRunning:Boolean;//fAD
    FWindowHooks:TList;//fB0
    FWindowList:Pointer;//fB4
    FDialogHandle:HWND;//fB8
    FAutoDragDocking:Boolean;//fBC
    FActionUpdateDelay:Integer;//fC0
    FModalLevel:Integer;//fC4
    FCurrentPopupID:Integer;//fC8
    FPopupForms:TPopupFormArray;//fCC
    FModalPopupMode:TPopupMode;//fD0
    FCreatingMainForm:Boolean;//fD1
    FEnumAllWindowsOnActivateHint:Boolean;//fD2
    FMainFormOnTaskBar:Boolean;//fD3
    FLastActivePopup:HWND;//fD4
    FOwnedAppWnds::1;//fD8
    FInitialMainFormState:TWindowState;//fDC
    FOnActionExecute:TActionEvent;//fE0
    FOnActionUpdate:TActionEvent;//fE8
    FOnException:TExceptionEvent;//fF0
    fF4:dword;//fF4
    FOnGetActiveFormHandle:TGetHandleEvent;//fF8
    FOnGetMainFormHandle:TGetHandleEvent;//f100
    FOnMessage:TMessageEvent;//f108
    FOnModalBegin:TNotifyEvent;//f110
    FOnModalEnd:TNotifyEvent;//f118
    FOnHelp:THelpEvent;//f120
    FOnHint:TNotifyEvent;//f128
    FOnIdle:TIdleEvent;//f130
    FOnDeactivate:TNotifyEvent;//f138
    FOnActivate:TNotifyEvent;//f140
    FOnMinimize:TNotifyEvent;//f148
    f14C:dword;//f14C
    FOnRestore:TNotifyEvent;//f150
    FOnShortCut:TShortCutEvent;//f158
    FOnShowHint:TShowHintEvent;//f160
    FOnSettingChange:TSettingChangeEvent;//f168
    FHandle:HWND;//f170
    FObjectInstance:Pointer;//f174
    FPopupControlWnd:HWND;//f178
    FNeedToUninitialize:Boolean;//f17C
    destructor Destroy(); virtual;//004EFC48
    constructor Create; virtual;//v2C//004EF9DC
    procedure DoNormalizeTopMosts(IncludeMain:Boolean);//004F0074
    procedure DoShowOwnedPopups(Show:Boolean);//004F0334
    function CheckIniChange(var Message:TMessage):Boolean;//004F0504
    procedure SettingChange(var Message:TWMSettingChange);//004F0584
    procedure WndProc(var Message:TMessage);//004F0690
    function GetIconHandle:HICON;//004F0E30
    function GetTitle:UnicodeString;//004F10DC
    procedure SetIcon(Value:TIcon);//004F1160
    procedure SetBiDiMode(Value:TBiDiMode);//004F116C
    procedure SetDefaultFont(Value:TFont);//004F11AC
    procedure SetTitle(const Value:UnicodeString);//004F11BC
    procedure SetHandle(Value:HWND);//004F1218
    function IsDlgMsg(var Msg:TMsg):Boolean;//004F1260
    function IsMDIMsg(var Msg:TMsg):Boolean;//004F12A8
    function IsKeyMsg(var Msg:TMsg):Boolean;//004F12F8
    function IsHintMsg(var Msg:TMsg):Boolean;//004F13F0
    function IsShortCut(var Message:TWMKey):Boolean;//004F1424
    procedure PopupControlProc(var Message:TMessage);//004F1490
    function ProcessMessage(var Msg:TMsg):Boolean;//004F1554
    function InvokeHelp(Command:Word; Data:LongInt):Boolean;//004F1D7C
    function DoOnHelp(Command:Word; Data:Integer; var CallHelp:Boolean):Boolean;//004F1EB0
    function GetExeName:UnicodeString;//004F2198
    procedure SetShowHint(Value:Boolean);//004F21A8
    procedure SetHintColor(Value:TColor);//004F2200
    procedure DefaultFontChanged(Sender:TObject);//004F2220
    procedure DoActionIdle;//004F2230
    function DoMouseIdle:TControl;//004F2294
    procedure Idle(const Msg:TMsg);//004F2320
    procedure NotifyForms(Msg:Word; WParam:WPARAM; LParam:LPARAM);//004F24C0
    procedure IconChanged(Sender:TObject);//004F2508
    procedure SetHint(const Value:UnicodeString);//004F2578
    procedure UpdateVisible;//004F26AC
    function ValidateHelpSystem:Boolean;//004F2734
    procedure StartHintTimer(Value:Integer; TimerMode:TTimerMode);//004F2754
    procedure StopHintTimer;//004F2798
    procedure HintTimerExpired;//004F28E4
    function GetCurrentHelpFile:UnicodeString;//004F30D8
    function GetDialogHandle:HWND;//004F3114
    procedure SetDialogHandle(Value:HWND);//004F313C
    function GetActiveFormHandle:HWND;//004F3168
    function GetMainFormHandle:HWND;//004F31B4
    function DispatchAction(Msg:LongInt; Action:TBasicAction):Boolean;//004F31F4
    procedure WakeMainThread(Sender:TObject);//004F3350
    function IsPreProcessMessage(var Msg:TMsg):Boolean;//004F3384
    procedure InternalRestore;//004F33F0
    procedure SetMainFormOnTaskBar(const Value:Boolean);//004F3478
  end;
    function IsIconic(const hWnd:HWND):BOOL;//004E5288
    function SaveFocusState:TFocusState;//004E52AC
    procedure RestoreFocusState(FocusState:TFocusState);//004E52B4
    procedure ShowMDIClientEdge(ClientHandle:THandle; ShowEdge:Boolean);//004E52BC
    procedure ChangeAppWindow(const Handle:THandle; const SetAppWindow:Boolean; const RestoreVisibility:Boolean);//004E5308
    procedure DoneApplication;//004E53CC
    function DoDisableWindow(Window:HWND; Data:LPARAM):BOOL; stdcall;//004E5408
    function DisableTaskWindows(ActiveWindow:HWND):Pointer;//004E5458
    procedure EnableTaskWindows(WindowList:Pointer);//004E551C
    function DoFindWindow(Window:HWND; Param:LPARAM):BOOL; stdcall;//004E5554
    function FindTopMostWindow(ActiveWindow:HWND):HWND;//004E55B8
    function SendFocusMessage(Window:HWND; Msg:Word):Boolean;//004E55F8
    function CheckTaskWindow(Window:HWND; Data:LongInt):BOOL; stdcall;//004E5618
    function CheckTaskWindowAll(Window:HWND; Data:LongInt):BOOL; stdcall;//004E5638
    function ForegroundTaskCheck(CheckAll:Boolean):Boolean;//004E5670
    function FindGlobalComponent(const Name:UnicodeString):TComponent;//004E56B4
    function MakeObjectInstance(Method:TWndMethod):Pointer;//004E5734
    procedure sub_004E5748;//004E5748
    function AllocateHWnd(Method:TWndMethod):HWND;//004E5750
    procedure sub_004E5764;//004E5764
    function KeysToShiftState(Keys:Word):TShiftState;//004E576C
    function KeyDataToShiftState(KeyData:LongInt):TShiftState;//004E57C0
    function KeyboardStateToShiftState(const KeyboardState:TKeyboardState):TShiftState;//004E5800
    function IsAccel(VK:Word; const Str:UnicodeString):Boolean;//004E5850
    function GetRealParentForm(Control:TControl; TopForm:Boolean):TCustomForm;//004E58C0
    function GetParentForm(Control:TControl; TopForm:Boolean):TCustomForm;//004E5904
    function ValidParentForm(Control:TControl; TopForm:Boolean):TCustomForm;//004E5914
    procedure ProcessHorz(Control:TControl);//004E5AB0
    procedure ProcessVert(Control:TControl);//004E5B20
    function ScrollBarVisible(Code:Word):Boolean;//004E5C70
    function Adjustment(Code:Word; Metric:Word):Integer;//004E5CA4
    function GetRealScrollPosition:Integer;//004E5DC0
    procedure UpdateScrollProperties(Redraw:Boolean);//004E6304
    procedure CreateParams(var Params:TCreateParams);//004E6610
    procedure CreateWnd;//004E6620
    procedure AlignControls(AControl:TControl; var ARect:TRect);//004E6660
    function AutoScrollEnabled:Boolean;//004E6680
    procedure DoFlipChildren;//004E66A0
    procedure DoGesture(const EventInfo:TGestureEventInfo; var Handled:Boolean);//004E67B8
    procedure DoGetGestureOptions(var Gestures:TInteractiveGestures; var Options:TInteractiveGestureOptions);//004E682C
    procedure AutoScrollInView(AControl:TControl);//004E69D8
    procedure IsTouchPropertyStored(AProperty:TTouchProperty);//004E6A34
    procedure ChangeScale(M:Integer; D:Integer);//004E6C78
    procedure sub_004E6C9C;//004E6C9C
    procedure WMSize(var Message:TWMSize);//004E6CA0
    procedure WMHScroll(Message:TWMCommand);//004E6D90
    procedure WMVScroll(Message:TWMHScroll);//004E6DB4
    procedure AdjustClientRect(var Rect:TRect);//004E6DD8
    procedure CMBiDiModeChanged(var Message:TMessage);//004E6E58
    procedure InitializeNewForm;//004E70E0
    procedure DoCreate;//004E7444
    procedure DoDestroy;//004E74C0
    procedure Loaded;//004E7520
    procedure Notification(AComponent:TComponent; Operation:TOperation);//004E75A4
    procedure ReadState(Reader:TReader);//004E76E0
    procedure DefineProperties(Filer:TFiler);//004E7970
    procedure BeginAutoDrag;//004E7B2C
    procedure ChangeScale(M:Integer; D:Integer);//004E7B30
    procedure DoClose(var Action:TCloseAction);//004E7C80
    procedure DoHide;//004E7CA0
    procedure DoShow;//004E7CC0
    function GetClientRect:TRect;//004E7CE0
    procedure GetOwnerWindow;//004E7DD4
    function GetFloating:Boolean;//004E7DEC
    procedure SetChildOrder(Child:TComponent; Order:Integer);//004E7E10
    procedure SetParentBiDiMode(Value:Boolean);//004E7EA4
    procedure VisibleChanging;//004E7F78
    procedure SetParent(AParent:TWinControl);//004E7FE8
    procedure ValidateRename(AComponent:TComponent; const CurName:UnicodeString; const NewName:UnicodeString);//004E80A4
    procedure WndProc(var Message:TMessage);//004E80E4
    procedure Default;//004E868C
    function MaximizedChildren:Boolean;//004E86D8
    procedure ClientWndProc(var Message:TMessage);//004E8718
    procedure AlignControls(AControl:TControl; var Rect:TRect);//004E88FC
    procedure CMBiDiModeChanged(var Message:TMessage);//004E89B8
    procedure CMParentBiDiModeChanged(var Message:TMessage);//004E8A50
    procedure CMPopupHwndDestroy(var Message:TCMPopupHWndDestroy);//004E8AE0
    procedure GetBorderIconStyles(var Style:Cardinal; var ExStyle:Cardinal);//004E8B98
    procedure GetBorderStyles(var Style:Cardinal; var ExStyle:Cardinal; var ClassStyle:Cardinal);//004E8D4C
    procedure DoDock(NewDockSite:TWinControl; var ARect:TRect);//004E9044
    function EnumMonitorsProc(hm:HMONITOR; dc:HDC; r:PRect; Data:Pointer):Boolean; stdcall;//004E916C
    procedure CMColorChanged(var Message:TMessage);//004E9884
    procedure CMCtl3DChanged(var Message:TMessage);//004E98D0
    procedure CMFontChanged(var Message:TMessage);//004E9918
    procedure CMMenuChanged(var Message:TMessage);//004E9938
    function GetNonToolWindowPopupParent(WndParent:HWND):HWND;//004E9D34
    procedure CreateParams(var Params:TCreateParams);//004E9DA4
    procedure CreateWnd;//004EA3A0
    procedure CreateWindowHandle(const Params:TCreateParams);//004EA5A0
    function DestroyPopupWindow(Window:HWND; Data:PDestroyPopupData):BOOL; stdcall;//004EA6D8
    procedure DestroyHandle;//004EA71C
    procedure DestroyWindowHandle;//004EA850
    procedure sub_004EAD2C;//004EAD2C
    procedure DoNestedActivation(Msg:Cardinal; Control:TWinControl; Form:TCustomForm);//004EAF04
    procedure Activate;//004EAF50
    procedure Deactivate;//004EAF80
    procedure Paint;//004EAFB0
    procedure PaintWindow(DC:HDC);//004EAFEC
    procedure PaletteChanged(Foreground:Boolean);//004EB1E8
    procedure WMPaint(var Message:TWMPaint);//004EB28C
    procedure WMNCPaint(var Message:TWMNCPaint);//004EB304
    procedure WMIconEraseBkgnd(var Message:TWMEraseBkgnd);//004EB32C
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//004EB38C
    procedure WMQueryDragIcon(var Message:TWMQueryDragIcon);//004EB3C0
    procedure ModifySystemMenu;//004EB3D4
    procedure WMNCCreate(var Message:TWMNCCreate);//004EB4D0
    procedure WMNCHitTest(var Message:TWMNCHitTest);//004EB504
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown);//004EB528
    procedure WMDestroy(var Message:TWMDestroy);//004EB5B4
    procedure WMCommand(Message:TWMCharToItem);//004EB748
    procedure WMInitMenuPopup(var Message:TWMInitMenuPopup);//004EB77C
    procedure WMMenuChar(var Message:TWMMenuChar);//004EB794
    procedure WMMenuSelect(var Message:TWMMenuSelect);//004EB7CC
    procedure WMActivate(var Message:TWMActivate);//004EB874
    procedure Resizing(State:TWindowState);//004EB8B8
    procedure WMClose;//004EB8F0
    procedure WMQueryEndSession(var Message:TWMQueryEndSession);//004EB8F8
    procedure CMAppSysCommand(var Message:TMessage);//004EB914
    procedure WMSysCommand(var Message:TWMSysCommand);//004EB96C
    procedure WMShowWindow(var Message:TWMShowWindow);//004EB9F4
    procedure WMMDIActivate(var Message:TWMMDIActivate);//004EBAA0
    procedure WMNextDlgCtl(var Message:TWMNextDlgCtl);//004EBAF8
    procedure WMEnterMenuLoop(var Message:TMessage);//004EBB24
    function GetMenuHelpContext(Menu:TMenu):Integer;//004EBB40
    function ControlHasHelp(const Control:TWinControl):Boolean;//004EBB80
    procedure GetHelpInfo(const Control:TWinControl; var HType:THelpType; var ContextID:Integer; var Keyword:UnicodeString);//004EBBB8
    procedure WMHelp(var Message:TWMHelp);//004EBBEC
    procedure WMGetMinMaxInfo(var Message:TWMGetMinMaxInfo);//004EBD4C
    procedure HandleEdge(var Edge:Integer; SnapToEdge:Integer; SnapDistance:Integer);//004EBDB8
    procedure WMWindowPosChanging(var Message:TWMWindowPosChanging);//004EBDE4
    procedure WMNCCalcSize(var Message:TWMNCCalcSize);//004EBFC8
    procedure WMGestureNotify(var Message:TWMGestureNotify);//004EC01C
    procedure CMActivate(var Message:TCMActivate);//004EC024
    procedure CMDeactivate(var Message:TCMDeactivate);//004EC048
    procedure CMDialogKey(var Message:TCMDialogKey);//004EC068
    procedure CMShowingChanged(var Message:TMessage);//004EC104
    procedure CMIconChanged(var Message:TMessage);//004EC774
    procedure CMRelease;//004EC794
    procedure CMTextChanged(var Message:TMessage);//004EC79C
    procedure CMUIActivate(var Message:void );//004EC7EC
    procedure CMParentFontChanged(var Message:TCMParentFontChanged);//004EC7F8
    procedure CMIsShortCut(var Message:TWMKey);//004EC830
    procedure CMUpdateActions(var Message:TMessage);//004EC85C
    procedure TraverseClients(Container:TWinControl);//004ED184
    procedure UpdateActions;//004ED208
    procedure RequestAlign;//004ED2C8
    procedure WMSettingChange(var Message:TMessage);//004ED2E8
    function ProcessExecute(Control:TControl):Boolean;//004ED308
    function TraverseClients2(Container:TWinControl):Boolean;//004ED338
    procedure CMActionExecute(var Message:TMessage);//004ED3C0
    function ProcessUpdate(Control:TControl):Boolean;//004ED414
    function TraverseClients3(Container:TWinControl):Boolean;//004ED43C
    procedure CMActionUpdate(var Message:TMessage);//004ED4CC
    function DispatchShortCut(const Owner:TComponent):Boolean;//004ED520
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;//004ED614
    procedure HandleCreateException;//004ED688
    procedure DoUpdateControls(AControl:TWinControl);//004EDA8C
    procedure DoAddDockClient(Client:TControl; const ARect:TRect);//004EDD30
    procedure DoRemoveDockClient(Client:TControl);//004EDE58
    procedure Loaded;//004EDE78
    procedure GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean);//004EDEC4
    procedure WMNCHitTest(var Message:TWMNCHitTest);//004EDEF0
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown);//004EDF18
    procedure CMControlListChange(var Message:TMessage);//004EDFAC
    procedure CMDockNotification(var Message:TCMDockNotification);//004EE004
    procedure CMUnDockClient(var Message:TCMUnDockClient);//004EE124
    procedure CMVisibleChanged(var Message:TMessage);//004EE13C
    function EnumFontsProc(var LogFont:TLogFont; var TextMetric:TTextMetric; FontType:Integer; Data:Pointer):Integer; stdcall;//004EE25C
    function DoFindMonitor:TMonitor;//004EE850
    function InsertBefore(C1:TCustomForm; C2:TCustomForm; AAlign:TAlign):Boolean;//004EEF2C
    procedure DoPosition(Form:TCustomForm; AAlign:TAlign);//004EEFB4
    procedure DoAlign(AAlign:TAlign);//004EF16C
    function AlignWork:Boolean;//004EF2BC
    function GetHint(Control:TControl):UnicodeString;//004EF508
    function GetHintControl(Control:TControl):TControl;//004EF540
    procedure HintTimerProc(Wnd:HWND; Msg:LongInt; TimerID:LongInt; SysTime:LongInt); stdcall;//004EF560
    procedure HintMouseThread(Param:Integer); stdcall;//004EF5B4
    function HintGetMsgHook(nCode:Integer; wParam:WPARAM; LParam:LPARAM):LRESULT; stdcall;//004EF610
    procedure HookHintHooks;//004EF654
    procedure UnhookHintHooks;//004EF6C8
    function GetAnimation:Boolean;//004EF744
    procedure SetAnimation(Value:Boolean);//004EF774
    procedure ShowWinNoAnimate(Handle:HWND; CmdShow:Integer);//004EF7A0
    function DoGetPrimaryMonitor:TMonitor;//004EF94C
    function GetTopMostWindows(Handle:HWND; Info:Pointer):BOOL; stdcall;//004EFFC0
    function GetPopupOwnerWindows(Handle:HWND; Info:Pointer):BOOL; stdcall;//004F0240
    procedure Default;//004F0600
    procedure DrawAppIcon;//004F0640
    function IsClass(Obj:TObject; Cls:TClass):Boolean;//004F1A20
    procedure IdleTimerProc(Wnd:HWND; Msg:LongInt; TimerID:LongInt; SysTime:LongInt); stdcall;//004F22B8
    procedure SetVisible(Value:Boolean);//004F260C
    function FindScanline(Source:Pointer; MaxLen:Cardinal; Value:Cardinal):Cardinal;//004F29BC
    function GetCursorHeightMargin:Integer;//004F29CC
    procedure ValidateHintWindow(HintClass:THintWindowClass);//004F2B20
    function MultiLineWidth(const Value:UnicodeString):Integer;//004F2B80
    procedure InitProcs;//004F32DC
    procedure Change;//004F3668

implementation

//004DE298
constructor THintAction.Create;
begin
{*
 004DE298    push        ebx
 004DE299    push        esi
 004DE29A    test        dl,dl
>004DE29C    je          004DE2A6
 004DE29E    add         esp,0FFFFFFF0
 004DE2A1    call        @ClassCreate
 004DE2A6    mov         ebx,edx
 004DE2A8    mov         esi,eax
 004DE2AA    xor         edx,edx
 004DE2AC    mov         eax,esi
 004DE2AE    call        TCustomAction.Create
 004DE2B3    mov         byte ptr [esi+60],0
 004DE2B7    mov         eax,esi
 004DE2B9    test        bl,bl
>004DE2BB    je          004DE2CC
 004DE2BD    call        @AfterConstruction
 004DE2C2    pop         dword ptr fs:[0]
 004DE2C9    add         esp,0C
 004DE2CC    mov         eax,esi
 004DE2CE    pop         esi
 004DE2CF    pop         ebx
 004DE2D0    ret
*}
end;

//004E5288
function IsIconic(const hWnd:HWND):BOOL;
begin
{*
 004E5288    mov         edx,dword ptr ds:[7932EC];Application:TApplication
 004E528E    cmp         eax,dword ptr [edx+170]
>004E5294    jne         004E52A3
 004E5296    mov         eax,[007932EC];Application:TApplication
 004E529B    cmp         byte ptr [eax+34],1
 004E529F    cmc
 004E52A0    sbb         eax,eax
 004E52A2    ret
 004E52A3    push        eax
 004E52A4    call        user32.IsIconic
 004E52A9    ret
*}
end;

//004E52AC
function SaveFocusState:TFocusState;
begin
{*
 004E52AC    mov         eax,[007866FC]
 004E52B1    ret
*}
end;

//004E52B4
procedure RestoreFocusState(FocusState:TFocusState);
begin
{*
 004E52B4    mov         [007866FC],eax
 004E52B9    ret
*}
end;

//004E52BC
procedure ShowMDIClientEdge(ClientHandle:THandle; ShowEdge:Boolean);
begin
{*
 004E52BC    push        ebx
 004E52BD    push        esi
 004E52BE    mov         ebx,edx
 004E52C0    mov         esi,eax
 004E52C2    test        esi,esi
>004E52C4    je          004E5303
 004E52C6    push        0EC
 004E52C8    push        esi
 004E52C9    call        user32.GetWindowLongW
 004E52CE    test        bl,bl
>004E52D0    je          004E52DE
 004E52D2    test        ah,2
>004E52D5    jne         004E5303
 004E52D7    or          eax,200
>004E52DC    jmp         004E52E8
 004E52DE    test        ah,2
>004E52E1    je          004E5303
 004E52E3    and         eax,0FFFFFDFF
 004E52E8    push        eax
 004E52E9    push        0EC
 004E52EB    push        esi
 004E52EC    call        user32.SetWindowLongW
 004E52F1    push        37
 004E52F3    push        0
 004E52F5    push        0
 004E52F7    push        0
 004E52F9    push        0
 004E52FB    push        0
 004E52FD    push        esi
 004E52FE    call        user32.SetWindowPos
 004E5303    pop         esi
 004E5304    pop         ebx
 004E5305    ret
*}
end;

//004E5308
procedure ChangeAppWindow(const Handle:THandle; const SetAppWindow:Boolean; const RestoreVisibility:Boolean);
begin
{*
 004E5308    push        ebx
 004E5309    push        esi
 004E530A    push        edi
 004E530B    push        ecx
 004E530C    mov         byte ptr [esp],cl
 004E530F    mov         ebx,edx
 004E5311    mov         esi,eax
 004E5313    push        0EC
 004E5315    push        esi
 004E5316    call        user32.GetWindowLongW
 004E531B    mov         edi,eax
 004E531D    test        bl,bl
>004E531F    je          004E5329
 004E5321    test        edi,40000
>004E5327    je          004E5343
 004E5329    test        bl,bl
>004E532B    jne         004E53C4
 004E5331    mov         eax,edi
 004E5333    and         eax,40000
 004E5338    cmp         eax,40000
>004E533D    jne         004E53C4
 004E5343    push        esi
 004E5344    call        user32.IsIconic
 004E5349    cmp         eax,1
 004E534C    sbb         eax,eax
 004E534E    inc         eax
 004E534F    mov         byte ptr [esp+2],al
 004E5353    push        esi
 004E5354    call        user32.IsWindowVisible
 004E5359    cmp         eax,1
 004E535C    sbb         eax,eax
 004E535E    inc         eax
 004E535F    mov         byte ptr [esp+1],al
 004E5363    movzx       eax,byte ptr [esp+1]
 004E5368    or          al,byte ptr [esp+2]
>004E536C    je          004E5376
 004E536E    push        0
 004E5370    push        esi
 004E5371    call        user32.ShowWindow
 004E5376    test        bl,bl
>004E5378    je          004E538B
 004E537A    or          edi,40000
 004E5380    push        edi
 004E5381    push        0EC
 004E5383    push        esi
 004E5384    call        user32.SetWindowLongW
>004E5389    jmp         004E539A
 004E538B    and         edi,0FFFBFFFF
 004E5391    push        edi
 004E5392    push        0EC
 004E5394    push        esi
 004E5395    call        user32.SetWindowLongW
 004E539A    movzx       eax,byte ptr [esp]
 004E539E    and         al,byte ptr [esp+1]
>004E53A2    jne         004E53AB
 004E53A4    cmp         byte ptr [esp+2],0
>004E53A9    je          004E53C4
 004E53AB    cmp         byte ptr [esp+2],0
>004E53B0    je          004E53BC
 004E53B2    push        6
 004E53B4    push        esi
 004E53B5    call        user32.ShowWindow
>004E53BA    jmp         004E53C4
 004E53BC    push        5
 004E53BE    push        esi
 004E53BF    call        user32.ShowWindow
 004E53C4    pop         edx
 004E53C5    pop         edi
 004E53C6    pop         esi
 004E53C7    pop         ebx
 004E53C8    ret
*}
end;

//004E53CC
procedure DoneApplication;
begin
{*
 004E53CC    mov         eax,[007932EC];Application:TApplication
 004E53D1    cmp         dword ptr [eax+170],0
>004E53D8    je          004E53E6
 004E53DA    xor         edx,edx
 004E53DC    mov         eax,[007932EC];Application:TApplication
 004E53E1    call        TApplication.DoShowOwnedPopups
 004E53E6    xor         edx,edx
 004E53E8    mov         eax,[007932EC];Application:TApplication
 004E53ED    call        TApplication.SetShowHint
 004E53F2    mov         eax,[007932EC];Application:TApplication
 004E53F7    call        TComponent.Destroying
 004E53FC    mov         eax,[007932EC];Application:TApplication
 004E5401    call        TComponent.DestroyComponents
 004E5406    ret
*}
end;

//004E5408
function DoDisableWindow(Window:HWND; Data:LPARAM):BOOL; stdcall;
begin
{*
 004E5408    push        ebp
 004E5409    mov         ebp,esp
 004E540B    push        ebx
 004E540C    mov         ebx,dword ptr [ebp+8]
 004E540F    cmp         ebx,dword ptr ds:[786700]
>004E5415    je          004E544D
 004E5417    push        ebx
 004E5418    call        user32.IsWindowVisible
 004E541D    test        eax,eax
>004E541F    je          004E544D
 004E5421    push        ebx
 004E5422    call        user32.IsWindowEnabled
 004E5427    test        eax,eax
>004E5429    je          004E544D
 004E542B    mov         eax,8
 004E5430    call        @GetMem
 004E5435    mov         edx,dword ptr ds:[786710]
 004E543B    mov         dword ptr [eax],edx
 004E543D    mov         dword ptr [eax+4],ebx
 004E5440    mov         [00786710],eax
 004E5445    push        0
 004E5447    push        ebx
 004E5448    call        user32.EnableWindow
 004E544D    or          eax,0FFFFFFFF
 004E5450    pop         ebx
 004E5451    pop         ebp
 004E5452    ret         8
*}
end;

//004E5458
function DisableTaskWindows(ActiveWindow:HWND):Pointer;
begin
{*
 004E5458    push        ebp
 004E5459    mov         ebp,esp
 004E545B    add         esp,0FFFFFFF4
 004E545E    push        ebx
 004E545F    push        esi
 004E5460    push        edi
 004E5461    xor         edx,edx
 004E5463    mov         dword ptr [ebp-4],edx
 004E5466    mov         edx,dword ptr ds:[786700]
 004E546C    mov         dword ptr [ebp-8],edx
 004E546F    mov         edx,dword ptr ds:[786710]
 004E5475    mov         dword ptr [ebp-0C],edx
 004E5478    mov         [00786700],eax
 004E547D    xor         eax,eax
 004E547F    mov         [00786710],eax
 004E5484    mov         ebx,4E5408;DoDisableWindow:BOOL
 004E5489    xor         eax,eax
 004E548B    push        ebp
 004E548C    push        4E550A
 004E5491    push        dword ptr fs:[eax]
 004E5494    mov         dword ptr fs:[eax],esp
 004E5497    mov         byte ptr ds:[78670C],1
 004E549E    xor         eax,eax
 004E54A0    push        ebp
 004E54A1    push        4E54CC
 004E54A6    push        dword ptr fs:[eax]
 004E54A9    mov         dword ptr fs:[eax],esp
 004E54AC    push        0
 004E54AE    push        ebx
 004E54AF    call        kernel32.GetCurrentThreadId
 004E54B4    push        eax
 004E54B5    call        user32.EnumThreadWindows
 004E54BA    mov         eax,[00786710]
 004E54BF    mov         dword ptr [ebp-4],eax
 004E54C2    xor         eax,eax
 004E54C4    pop         edx
 004E54C5    pop         ecx
 004E54C6    pop         ecx
 004E54C7    mov         dword ptr fs:[eax],edx
>004E54CA    jmp         004E54E5
>004E54CC    jmp         @HandleAnyException
 004E54D1    mov         eax,[00786710]
 004E54D6    call        EnableTaskWindows
 004E54DB    call        @RaiseAgain
 004E54E0    call        @DoneExcept
 004E54E5    xor         eax,eax
 004E54E7    pop         edx
 004E54E8    pop         ecx
 004E54E9    pop         ecx
 004E54EA    mov         dword ptr fs:[eax],edx
 004E54ED    push        4E5511
 004E54F2    mov         byte ptr ds:[78670C],0
 004E54F9    mov         eax,dword ptr [ebp-0C]
 004E54FC    mov         [00786710],eax
 004E5501    mov         eax,dword ptr [ebp-8]
 004E5504    mov         [00786700],eax
 004E5509    ret
>004E550A    jmp         @HandleFinally
>004E550F    jmp         004E54F2
 004E5511    mov         eax,dword ptr [ebp-4]
 004E5514    pop         edi
 004E5515    pop         esi
 004E5516    pop         ebx
 004E5517    mov         esp,ebp
 004E5519    pop         ebp
 004E551A    ret
*}
end;

//004E551C
procedure EnableTaskWindows(WindowList:Pointer);
begin
{*
 004E551C    push        ebx
 004E551D    push        esi
 004E551E    mov         esi,eax
 004E5520    test        esi,esi
>004E5522    je          004E5550
 004E5524    mov         ebx,esi
 004E5526    mov         eax,dword ptr [ebx+4]
 004E5529    push        eax
 004E552A    call        user32.IsWindow
 004E552F    test        eax,eax
>004E5531    je          004E553E
 004E5533    push        0FF
 004E5535    mov         eax,dword ptr [ebx+4]
 004E5538    push        eax
 004E5539    call        user32.EnableWindow
 004E553E    mov         esi,dword ptr [ebx]
 004E5540    mov         edx,8
 004E5545    mov         eax,ebx
 004E5547    call        @FreeMem
 004E554C    test        esi,esi
>004E554E    jne         004E5524
 004E5550    pop         esi
 004E5551    pop         ebx
 004E5552    ret
*}
end;

//004E5554
function DoFindWindow(Window:HWND; Param:LPARAM):BOOL; stdcall;
begin
{*
 004E5554    push        ebp
 004E5555    mov         ebp,esp
 004E5557    push        ebx
 004E5558    mov         ebx,dword ptr [ebp+8]
 004E555B    cmp         ebx,dword ptr ds:[786700]
>004E5561    je          004E55B0
 004E5563    mov         eax,[007932EC];Application:TApplication
 004E5568    cmp         ebx,dword ptr [eax+170]
>004E556E    je          004E55B0
 004E5570    push        ebx
 004E5571    call        user32.IsWindowVisible
 004E5576    test        eax,eax
>004E5578    je          004E55B0
 004E557A    push        ebx
 004E557B    call        user32.IsWindowEnabled
 004E5580    test        eax,eax
>004E5582    je          004E55B0
 004E5584    push        0EC
 004E5586    push        ebx
 004E5587    call        user32.GetWindowLongW
 004E558C    test        al,8
>004E558E    jne         004E55A1
 004E5590    cmp         dword ptr ds:[786704],0
>004E5597    jne         004E55B0
 004E5599    mov         dword ptr ds:[786704],ebx
>004E559F    jmp         004E55B0
 004E55A1    cmp         dword ptr ds:[786708],0
>004E55A8    jne         004E55B0
 004E55AA    mov         dword ptr ds:[786708],ebx
 004E55B0    or          eax,0FFFFFFFF
 004E55B3    pop         ebx
 004E55B4    pop         ebp
 004E55B5    ret         8
*}
end;

//004E55B8
function FindTopMostWindow(ActiveWindow:HWND):HWND;
begin
{*
 004E55B8    push        ebx
 004E55B9    mov         [00786700],eax
 004E55BE    xor         eax,eax
 004E55C0    mov         [00786704],eax
 004E55C5    xor         eax,eax
 004E55C7    mov         [00786708],eax
 004E55CC    mov         ebx,4E5554;DoFindWindow:BOOL
 004E55D1    push        0
 004E55D3    push        ebx
 004E55D4    call        kernel32.GetCurrentThreadId
 004E55D9    push        eax
 004E55DA    call        user32.EnumThreadWindows
 004E55DF    cmp         dword ptr ds:[786704],0
>004E55E6    je          004E55EF
 004E55E8    mov         eax,[00786704]
 004E55ED    pop         ebx
 004E55EE    ret
 004E55EF    mov         eax,[00786708]
 004E55F4    pop         ebx
 004E55F5    ret
*}
end;

//004E55F8
function SendFocusMessage(Window:HWND; Msg:Word):Boolean;
begin
{*
 004E55F8    push        ebx
 004E55F9    mov         ebx,dword ptr ds:[7866FC]
 004E55FF    push        0
 004E5601    push        0
 004E5603    movzx       edx,dx
 004E5606    push        edx
 004E5607    push        eax
 004E5608    call        user32.SendMessageW
 004E560D    cmp         ebx,dword ptr ds:[7866FC]
 004E5613    sete        al
 004E5616    pop         ebx
 004E5617    ret
*}
end;

//004E5618
function CheckTaskWindow(Window:HWND; Data:LongInt):BOOL; stdcall;
begin
{*
 004E5618    push        ebp
 004E5619    mov         ebp,esp
 004E561B    push        ebx
 004E561C    mov         eax,dword ptr [ebp+0C]
 004E561F    or          edx,0FFFFFFFF
 004E5622    mov         ecx,eax
 004E5624    mov         ebx,dword ptr [ecx]
 004E5626    cmp         ebx,dword ptr [ebp+8]
>004E5629    jne         004E5631
 004E562B    xor         edx,edx
 004E562D    mov         byte ptr [ecx+4],1
 004E5631    mov         eax,edx
 004E5633    pop         ebx
 004E5634    pop         ebp
 004E5635    ret         8
*}
end;

//004E5638
function CheckTaskWindowAll(Window:HWND; Data:LongInt):BOOL; stdcall;
begin
{*
 004E5638    push        ebp
 004E5639    mov         ebp,esp
 004E563B    push        ecx
 004E563C    push        ebx
 004E563D    push        esi
 004E563E    push        edi
 004E563F    mov         esi,dword ptr [ebp+0C]
 004E5642    mov         ebx,dword ptr [ebp+8]
 004E5645    or          edi,0FFFFFFFF
 004E5648    lea         eax,[ebp-4]
 004E564B    push        eax
 004E564C    push        ebx
 004E564D    call        user32.GetWindowThreadProcessId
 004E5652    cmp         ebx,dword ptr [esi]
>004E5654    jne         004E5666
 004E5656    call        kernel32.GetCurrentProcessId
 004E565B    cmp         eax,dword ptr [ebp-4]
>004E565E    jne         004E5666
 004E5660    xor         edi,edi
 004E5662    mov         byte ptr [esi+4],1
 004E5666    mov         eax,edi
 004E5668    pop         edi
 004E5669    pop         esi
 004E566A    pop         ebx
 004E566B    pop         ecx
 004E566C    pop         ebp
 004E566D    ret         8
*}
end;

//004E5670
function ForegroundTaskCheck(CheckAll:Boolean):Boolean;
begin
{*
 004E5670    push        ebx
 004E5671    add         esp,0FFFFFFF8
 004E5674    mov         ebx,eax
 004E5676    call        user32.GetActiveWindow
 004E567B    mov         dword ptr [esp],eax
 004E567E    mov         byte ptr [esp+4],0
 004E5683    test        bl,bl
>004E5685    je          004E5696
 004E5687    mov         eax,esp
 004E5689    push        eax
 004E568A    push        4E5638;CheckTaskWindowAll:BOOL
 004E568F    call        user32.EnumWindows
>004E5694    jmp         004E56A9
 004E5696    mov         eax,esp
 004E5698    push        eax
 004E5699    push        4E5618;CheckTaskWindow:BOOL
 004E569E    call        kernel32.GetCurrentThreadId
 004E56A3    push        eax
 004E56A4    call        user32.EnumThreadWindows
 004E56A9    movzx       eax,byte ptr [esp+4]
 004E56AE    pop         ecx
 004E56AF    pop         edx
 004E56B0    pop         ebx
 004E56B1    ret
*}
end;

//004E56B4
function FindGlobalComponent(const Name:UnicodeString):TComponent;
begin
{*
 004E56B4    push        ebx
 004E56B5    push        esi
 004E56B6    push        edi
 004E56B7    push        ebp
 004E56B8    mov         ebp,eax
 004E56BA    mov         eax,[007932F0];Screen:TScreen
 004E56BF    call        TScreen.GetFormCount
 004E56C4    mov         esi,eax
 004E56C6    dec         esi
 004E56C7    test        esi,esi
>004E56C9    jl          004E56F4
 004E56CB    inc         esi
 004E56CC    xor         edi,edi
 004E56CE    mov         edx,edi
 004E56D0    mov         eax,[007932F0];Screen:TScreen
 004E56D5    call        TScreen.GetForm
 004E56DA    mov         ebx,eax
 004E56DC    test        byte ptr [ebx+1D],2
>004E56E0    jne         004E56F0
 004E56E2    mov         edx,dword ptr [ebx+8]
 004E56E5    mov         eax,ebp
 004E56E7    call        CompareText
 004E56EC    test        eax,eax
>004E56EE    je          004E572A
 004E56F0    inc         edi
 004E56F1    dec         esi
>004E56F2    jne         004E56CE
 004E56F4    mov         eax,[007932F0];Screen:TScreen
 004E56F9    call        TScreen.GetDataModuleCount
 004E56FE    mov         esi,eax
 004E5700    dec         esi
 004E5701    test        esi,esi
>004E5703    jl          004E5728
 004E5705    inc         esi
 004E5706    xor         edi,edi
 004E5708    mov         edx,edi
 004E570A    mov         eax,[007932F0];Screen:TScreen
 004E570F    call        TScreen.GetDataModule
 004E5714    mov         ebx,eax
 004E5716    mov         edx,dword ptr [ebx+8]
 004E5719    mov         eax,ebp
 004E571B    call        CompareText
 004E5720    test        eax,eax
>004E5722    je          004E572A
 004E5724    inc         edi
 004E5725    dec         esi
>004E5726    jne         004E5708
 004E5728    xor         ebx,ebx
 004E572A    mov         eax,ebx
 004E572C    pop         ebp
 004E572D    pop         edi
 004E572E    pop         esi
 004E572F    pop         ebx
 004E5730    ret
*}
end;

//004E5734
function MakeObjectInstance(Method:TWndMethod):Pointer;
begin
{*
 004E5734    push        ebp
 004E5735    mov         ebp,esp
 004E5737    push        dword ptr [ebp+0C]
 004E573A    push        dword ptr [ebp+8]
 004E573D    call        MakeObjectInstance
 004E5742    pop         ebp
 004E5743    ret         8
*}
end;

//004E5748
procedure sub_004E5748;
begin
{*
 004E5748    call        FreeObjectInstance
 004E574D    ret
*}
end;

//004E5750
function AllocateHWnd(Method:TWndMethod):HWND;
begin
{*
 004E5750    push        ebp
 004E5751    mov         ebp,esp
 004E5753    push        dword ptr [ebp+0C]
 004E5756    push        dword ptr [ebp+8]
 004E5759    call        AllocateHWnd
 004E575E    pop         ebp
 004E575F    ret         8
*}
end;

//004E5764
procedure sub_004E5764;
begin
{*
 004E5764    call        DeallocateHWnd
 004E5769    ret
*}
end;

//004E576C
function KeysToShiftState(Keys:Word):TShiftState;
begin
{*
 004E576C    push        ebx
 004E576D    push        esi
 004E576E    mov         ebx,eax
 004E5770    movzx       esi,word ptr ds:[4E57BC]
 004E5777    test        bl,4
>004E577A    je          004E5780
 004E577C    or          si,1
 004E5780    test        bl,8
>004E5783    je          004E5789
 004E5785    or          si,4
 004E5789    test        bl,1
>004E578C    je          004E5792
 004E578E    or          si,8
 004E5792    test        bl,2
>004E5795    je          004E579B
 004E5797    or          si,10
 004E579B    test        bl,10
>004E579E    je          004E57A4
 004E57A0    or          si,20
 004E57A4    push        12
 004E57A6    call        user32.GetKeyState
 004E57AB    test        ax,ax
>004E57AE    jge         004E57B4
 004E57B0    or          si,2
 004E57B4    mov         eax,esi
 004E57B6    pop         esi
 004E57B7    pop         ebx
 004E57B8    ret
*}
end;

//004E57C0
function KeyDataToShiftState(KeyData:LongInt):TShiftState;
begin
{*
 004E57C0    push        ebx
 004E57C1    push        esi
 004E57C2    mov         esi,eax
 004E57C4    movzx       ebx,word ptr ds:[4E57FC]
 004E57CB    push        10
 004E57CD    call        user32.GetKeyState
 004E57D2    test        ax,ax
>004E57D5    jge         004E57DB
 004E57D7    or          bx,1
 004E57DB    push        11
 004E57DD    call        user32.GetKeyState
 004E57E2    test        ax,ax
>004E57E5    jge         004E57EB
 004E57E7    or          bx,4
 004E57EB    test        esi,20000000
>004E57F1    je          004E57F7
 004E57F3    or          bx,2
 004E57F7    mov         eax,ebx
 004E57F9    pop         esi
 004E57FA    pop         ebx
 004E57FB    ret
*}
end;

//004E5800
function KeyboardStateToShiftState(const KeyboardState:TKeyboardState):TShiftState;
begin
{*
 004E5800    push        ebx
 004E5801    push        esi
 004E5802    mov         ebx,eax
 004E5804    movzx       esi,word ptr ds:[4E584C]
 004E580B    test        byte ptr [ebx+10],80
>004E580F    je          004E5815
 004E5811    or          si,1
 004E5815    test        byte ptr [ebx+11],80
>004E5819    je          004E581F
 004E581B    or          si,4
 004E581F    test        byte ptr [ebx+12],80
>004E5823    je          004E5829
 004E5825    or          si,2
 004E5829    test        byte ptr [ebx+1],80
>004E582D    je          004E5833
 004E582F    or          si,8
 004E5833    test        byte ptr [ebx+2],80
>004E5837    je          004E583D
 004E5839    or          si,10
 004E583D    test        byte ptr [ebx+4],80
>004E5841    je          004E5847
 004E5843    or          si,20
 004E5847    mov         eax,esi
 004E5849    pop         esi
 004E584A    pop         ebx
 004E584B    ret
*}
end;

//004E5850
function IsAccel(VK:Word; const Str:UnicodeString):Boolean;
begin
{*
 004E5850    push        ebp
 004E5851    mov         ebp,esp
 004E5853    push        0
 004E5855    push        0
 004E5857    push        ebx
 004E5858    push        esi
 004E5859    mov         esi,edx
 004E585B    mov         ebx,eax
 004E585D    xor         eax,eax
 004E585F    push        ebp
 004E5860    push        4E58B0
 004E5865    push        dword ptr fs:[eax]
 004E5868    mov         dword ptr fs:[eax],esp
 004E586B    lea         edx,[ebp-4]
 004E586E    mov         eax,esi
 004E5870    call        GetHotkey
 004E5875    mov         eax,dword ptr [ebp-4]
 004E5878    push        eax
 004E5879    lea         eax,[ebp-8]
 004E587C    mov         edx,ebx
 004E587E    call        @UStrFromWChar
 004E5883    mov         eax,dword ptr [ebp-8]
 004E5886    mov         cl,1
 004E5888    pop         edx
 004E5889    call        CompareText
 004E588E    test        eax,eax
 004E5890    sete        al
 004E5893    mov         ebx,eax
 004E5895    xor         eax,eax
 004E5897    pop         edx
 004E5898    pop         ecx
 004E5899    pop         ecx
 004E589A    mov         dword ptr fs:[eax],edx
 004E589D    push        4E58B7
 004E58A2    lea         eax,[ebp-8]
 004E58A5    mov         edx,2
 004E58AA    call        @UStrArrayClr
 004E58AF    ret
>004E58B0    jmp         @HandleFinally
>004E58B5    jmp         004E58A2
 004E58B7    mov         eax,ebx
 004E58B9    pop         esi
 004E58BA    pop         ebx
 004E58BB    pop         ecx
 004E58BC    pop         ecx
 004E58BD    pop         ebp
 004E58BE    ret
*}
end;

//004E58C0
function GetRealParentForm(Control:TControl; TopForm:Boolean):TCustomForm;
begin
{*
 004E58C0    push        ebx
 004E58C1    push        esi
 004E58C2    mov         ebx,edx
 004E58C4    mov         esi,eax
>004E58C6    jmp         004E58CB
 004E58C8    mov         esi,dword ptr [esi+34]
 004E58CB    test        bl,bl
>004E58CD    jne         004E58E0
 004E58CF    mov         eax,esi
 004E58D1    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 004E58D7    call        @IsClass
 004E58DC    test        al,al
>004E58DE    jne         004E58E6
 004E58E0    cmp         dword ptr [esi+34],0
>004E58E4    jne         004E58C8
 004E58E6    mov         eax,esi
 004E58E8    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 004E58EE    call        @IsClass
 004E58F3    test        al,al
>004E58F5    je          004E58FC
 004E58F7    mov         eax,esi
 004E58F9    pop         esi
 004E58FA    pop         ebx
 004E58FB    ret
 004E58FC    xor         eax,eax
 004E58FE    pop         esi
 004E58FF    pop         ebx
 004E5900    ret
*}
end;

//004E5904
function GetParentForm(Control:TControl; TopForm:Boolean):TCustomForm;
begin
{*
 004E5904    test        byte ptr [eax+1C],10
>004E5908    je          004E590C
 004E590A    xor         edx,edx
 004E590C    call        GetRealParentForm
 004E5911    ret
*}
end;

//004E5914
function ValidParentForm(Control:TControl; TopForm:Boolean):TCustomForm;
begin
{*
 004E5914    push        ebp
 004E5915    mov         ebp,esp
 004E5917    add         esp,0FFFFFFF4
 004E591A    push        ebx
 004E591B    push        esi
 004E591C    xor         ecx,ecx
 004E591E    mov         dword ptr [ebp-0C],ecx
 004E5921    mov         esi,eax
 004E5923    xor         eax,eax
 004E5925    push        ebp
 004E5926    push        4E5985
 004E592B    push        dword ptr fs:[eax]
 004E592E    mov         dword ptr fs:[eax],esp
 004E5931    mov         eax,esi
 004E5933    call        GetParentForm
 004E5938    mov         ebx,eax
 004E593A    test        ebx,ebx
>004E593C    jne         004E596F
 004E593E    mov         eax,dword ptr [esi+8]
 004E5941    mov         dword ptr [ebp-8],eax
 004E5944    mov         byte ptr [ebp-4],11
 004E5948    lea         eax,[ebp-8]
 004E594B    push        eax
 004E594C    push        0
 004E594E    lea         edx,[ebp-0C]
 004E5951    mov         eax,[0078D6BC];^SResString201:TResStringRec
 004E5956    call        LoadResString
 004E595B    mov         ecx,dword ptr [ebp-0C]
 004E595E    mov         dl,1
 004E5960    mov         eax,[00439268];EInvalidOperation
 004E5965    call        Exception.CreateFmt
 004E596A    call        @RaiseExcept
 004E596F    xor         eax,eax
 004E5971    pop         edx
 004E5972    pop         ecx
 004E5973    pop         ecx
 004E5974    mov         dword ptr fs:[eax],edx
 004E5977    push        4E598C
 004E597C    lea         eax,[ebp-0C]
 004E597F    call        @UStrClr
 004E5984    ret
>004E5985    jmp         @HandleFinally
>004E598A    jmp         004E597C
 004E598C    mov         eax,ebx
 004E598E    pop         esi
 004E598F    pop         ebx
 004E5990    mov         esp,ebp
 004E5992    pop         ebp
 004E5993    ret
*}
end;

//004E5994
constructor TControlScrollBar.Create(AControl:TScrollingWinControl; AKind:TScrollBarKind);
begin
{*
 004E5994    push        ebp
 004E5995    mov         ebp,esp
 004E5997    push        ebx
 004E5998    push        esi
 004E5999    push        edi
 004E599A    test        dl,dl
>004E599C    je          004E59A6
 004E599E    add         esp,0FFFFFFF0
 004E59A1    call        @ClassCreate
 004E59A6    mov         esi,ecx
 004E59A8    mov         ebx,edx
 004E59AA    mov         edi,eax
 004E59AC    xor         edx,edx
 004E59AE    mov         eax,edi
 004E59B0    call        TObject.Create
 004E59B5    mov         dword ptr [edi+4],esi
 004E59B8    movzx       eax,byte ptr [ebp+8]
 004E59BC    mov         byte ptr [edi+18],al
 004E59BF    mov         cx,50
 004E59C3    mov         word ptr [edi+0A],cx
 004E59C7    movzx       eax,cx
 004E59CA    mov         ecx,0A
 004E59CF    xor         edx,edx
 004E59D1    div         eax,ecx
 004E59D3    mov         word ptr [edi+8],ax
 004E59D7    mov         byte ptr [edi+1C],1
 004E59DB    mov         dword ptr [edi+20],0A
 004E59E2    mov         dword ptr [edi+40],4
 004E59E9    mov         dword ptr [edi+3C],0C
 004E59F0    mov         dword ptr [edi+28],0FF000014
 004E59F7    mov         byte ptr [edi+2C],1
 004E59FB    mov         byte ptr [edi+44],1
 004E59FF    mov         eax,edi
 004E5A01    test        bl,bl
>004E5A03    je          004E5A14
 004E5A05    call        @AfterConstruction
 004E5A0A    pop         dword ptr fs:[0]
 004E5A11    add         esp,0C
 004E5A14    mov         eax,edi
 004E5A16    pop         edi
 004E5A17    pop         esi
 004E5A18    pop         ebx
 004E5A19    pop         ebp
 004E5A1A    ret         4
*}
end;

//004E5A20
procedure TControlScrollBar.IsStoredIncrement(Value:TScrollBarInc);
begin
{*
 004E5A20    movzx       eax,byte ptr [eax+1F];TControlScrollBar.FSmooth:Boolean
 004E5A24    xor         al,1
 004E5A26    ret
*}
end;

//004E5A28
procedure TControlScrollBar.Assign(Source:TPersistent);
begin
{*
 004E5A28    push        ebx
 004E5A29    push        esi
 004E5A2A    push        edi
 004E5A2B    mov         esi,edx
 004E5A2D    mov         ebx,eax
 004E5A2F    mov         eax,esi
 004E5A31    mov         edx,dword ptr ds:[4DE380];TControlScrollBar
 004E5A37    call        @IsClass
 004E5A3C    test        al,al
>004E5A3E    je          004E5A6B
 004E5A40    mov         edi,esi
 004E5A42    movzx       edx,byte ptr [edi+1C]
 004E5A46    mov         eax,ebx
 004E5A48    call        TControlScrollBar.SetVisible
 004E5A4D    mov         edx,dword ptr [edi+10]
 004E5A50    mov         eax,ebx
 004E5A52    call        TControlScrollBar.SetRange
 004E5A57    mov         edx,dword ptr [edi+0C]
 004E5A5A    mov         eax,ebx
 004E5A5C    call        TControlScrollBar.SetPosition
 004E5A61    movzx       eax,word ptr [edi+8]
 004E5A65    mov         word ptr [ebx+8],ax
>004E5A69    jmp         004E5A74
 004E5A6B    mov         edx,esi
 004E5A6D    mov         eax,ebx
 004E5A6F    call        TPersistent.Assign
 004E5A74    pop         edi
 004E5A75    pop         esi
 004E5A76    pop         ebx
 004E5A77    ret
*}
end;

//004E5A78
procedure TControlScrollBar.ChangeBiDiPosition;
begin
{*
 004E5A78    push        ebx
 004E5A79    mov         ebx,eax
 004E5A7B    cmp         byte ptr [ebx+18],0
>004E5A7F    jne         004E5AAD
 004E5A81    mov         eax,ebx
 004E5A83    call        TControlScrollBar.IsScrollBarVisible
 004E5A88    test        al,al
>004E5A8A    je          004E5AAD
 004E5A8C    mov         eax,dword ptr [ebx+4]
 004E5A8F    call        TControl.UseRightToLeftScrollBar
 004E5A94    test        al,al
>004E5A96    jne         004E5AA3
 004E5A98    xor         edx,edx
 004E5A9A    mov         eax,ebx
 004E5A9C    call        TControlScrollBar.SetPosition
>004E5AA1    jmp         004E5AAD
 004E5AA3    mov         edx,dword ptr [ebx+10]
 004E5AA6    mov         eax,ebx
 004E5AA8    call        TControlScrollBar.SetPosition
 004E5AAD    pop         ebx
 004E5AAE    ret
*}
end;

//004E5AB0
procedure ProcessHorz(Control:TControl);
begin
{*
 004E5AB0    push        ebp
 004E5AB1    mov         ebp,esp
 004E5AB3    push        ebx
 004E5AB4    mov         ebx,eax
 004E5AB6    cmp         byte ptr [ebx+59],0
>004E5ABA    je          004E5B15
 004E5ABC    movzx       eax,byte ptr [ebx+5D]
 004E5AC0    sub         al,1
>004E5AC2    jb          004E5ACE
 004E5AC4    sub         al,2
>004E5AC6    je          004E5ACE
 004E5AC8    dec         al
>004E5ACA    je          004E5B0C
>004E5ACC    jmp         004E5B15
 004E5ACE    cmp         byte ptr [ebx+5D],3
>004E5AD2    je          004E5AE9
 004E5AD4    movzx       eax,byte ptr ds:[4E5B18]
 004E5ADB    and         al,byte ptr [ebx+63]
 004E5ADE    movzx       edx,byte ptr ds:[4E5B1C]
 004E5AE5    cmp         dl,al
>004E5AE7    jne         004E5B15
 004E5AE9    mov         eax,dword ptr [ebp+8]
 004E5AEC    mov         eax,dword ptr [eax-4]
 004E5AEF    mov         edx,dword ptr [ebp+8]
 004E5AF2    mov         edx,dword ptr [edx-8]
 004E5AF5    mov         edx,dword ptr [edx+0C]
 004E5AF8    add         edx,dword ptr [ebx+40]
 004E5AFB    add         edx,dword ptr [ebx+48]
 004E5AFE    cmp         edx,eax
>004E5B00    jl          004E5B04
 004E5B02    mov         eax,edx
 004E5B04    mov         edx,dword ptr [ebp+8]
 004E5B07    mov         dword ptr [edx-4],eax
>004E5B0A    jmp         004E5B15
 004E5B0C    mov         eax,dword ptr [ebp+8]
 004E5B0F    mov         edx,dword ptr [ebx+48]
 004E5B12    add         dword ptr [eax-0C],edx
 004E5B15    pop         ebx
 004E5B16    pop         ebp
 004E5B17    ret
*}
end;

//004E5B20
procedure ProcessVert(Control:TControl);
begin
{*
 004E5B20    push        ebp
 004E5B21    mov         ebp,esp
 004E5B23    push        ebx
 004E5B24    mov         ebx,eax
 004E5B26    cmp         byte ptr [ebx+59],0
>004E5B2A    je          004E5B7F
 004E5B2C    movzx       eax,byte ptr [ebx+5D]
 004E5B30    sub         al,2
>004E5B32    jb          004E5B38
>004E5B34    je          004E5B76
>004E5B36    jmp         004E5B7F
 004E5B38    cmp         byte ptr [ebx+5D],1
>004E5B3C    je          004E5B53
 004E5B3E    movzx       eax,byte ptr ds:[4E5B84]
 004E5B45    and         al,byte ptr [ebx+63]
 004E5B48    movzx       edx,byte ptr ds:[4E5B88]
 004E5B4F    cmp         dl,al
>004E5B51    jne         004E5B7F
 004E5B53    mov         eax,dword ptr [ebp+8]
 004E5B56    mov         eax,dword ptr [eax-4]
 004E5B59    mov         edx,dword ptr [ebp+8]
 004E5B5C    mov         edx,dword ptr [edx-8]
 004E5B5F    mov         edx,dword ptr [edx+0C]
 004E5B62    add         edx,dword ptr [ebx+44]
 004E5B65    add         edx,dword ptr [ebx+4C]
 004E5B68    cmp         edx,eax
>004E5B6A    jl          004E5B6E
 004E5B6C    mov         eax,edx
 004E5B6E    mov         edx,dword ptr [ebp+8]
 004E5B71    mov         dword ptr [edx-4],eax
>004E5B74    jmp         004E5B7F
 004E5B76    mov         eax,dword ptr [ebp+8]
 004E5B79    mov         edx,dword ptr [ebx+4C]
 004E5B7C    add         dword ptr [eax-0C],edx
 004E5B7F    pop         ebx
 004E5B80    pop         ebp
 004E5B81    ret
*}
end;

//004E5B8C
procedure TControlScrollBar.CalcAutoRange;
begin
{*
 004E5B8C    push        ebp
 004E5B8D    mov         ebp,esp
 004E5B8F    add         esp,0FFFFFFF4
 004E5B92    push        ebx
 004E5B93    push        esi
 004E5B94    mov         dword ptr [ebp-8],eax
 004E5B97    mov         eax,dword ptr [ebp-8]
 004E5B9A    mov         ebx,dword ptr [eax+4]
 004E5B9D    cmp         byte ptr [ebx+274],0
>004E5BA4    je          004E5C31
 004E5BAA    mov         eax,ebx
 004E5BAC    mov         edx,dword ptr [eax]
 004E5BAE    call        dword ptr [edx+0EC]
 004E5BB4    test        al,al
>004E5BB6    je          004E5C27
 004E5BB8    xor         eax,eax
 004E5BBA    mov         dword ptr [ebp-4],eax
 004E5BBD    xor         eax,eax
 004E5BBF    mov         dword ptr [ebp-0C],eax
 004E5BC2    mov         eax,dword ptr [ebp-8]
 004E5BC5    mov         eax,dword ptr [eax+4]
 004E5BC8    call        TWinControl.GetControlCount
 004E5BCD    mov         ebx,eax
 004E5BCF    dec         ebx
 004E5BD0    test        ebx,ebx
>004E5BD2    jl          004E5C0E
 004E5BD4    inc         ebx
 004E5BD5    xor         esi,esi
 004E5BD7    mov         eax,dword ptr [ebp-8]
 004E5BDA    cmp         byte ptr [eax+18],0
>004E5BDE    jne         004E5BF6
 004E5BE0    push        ebp
 004E5BE1    mov         eax,dword ptr [ebp-8]
 004E5BE4    mov         eax,dword ptr [eax+4]
 004E5BE7    mov         edx,esi
 004E5BE9    call        TWinControl.GetControl
 004E5BEE    call        ProcessHorz
 004E5BF3    pop         ecx
>004E5BF4    jmp         004E5C0A
 004E5BF6    push        ebp
 004E5BF7    mov         eax,dword ptr [ebp-8]
 004E5BFA    mov         eax,dword ptr [eax+4]
 004E5BFD    mov         edx,esi
 004E5BFF    call        TWinControl.GetControl
 004E5C04    call        ProcessVert
 004E5C09    pop         ecx
 004E5C0A    inc         esi
 004E5C0B    dec         ebx
>004E5C0C    jne         004E5BD7
 004E5C0E    mov         edx,dword ptr [ebp-4]
 004E5C11    add         edx,dword ptr [ebp-0C]
 004E5C14    mov         eax,dword ptr [ebp-8]
 004E5C17    movzx       eax,word ptr [eax+1A]
 004E5C1B    add         edx,eax
 004E5C1D    mov         eax,dword ptr [ebp-8]
 004E5C20    call        TControlScrollBar.DoSetRange
>004E5C25    jmp         004E5C31
 004E5C27    xor         edx,edx
 004E5C29    mov         eax,dword ptr [ebp-8]
 004E5C2C    call        TControlScrollBar.DoSetRange
 004E5C31    pop         esi
 004E5C32    pop         ebx
 004E5C33    mov         esp,ebp
 004E5C35    pop         ebp
 004E5C36    ret
*}
end;

//004E5C38
function TControlScrollBar.IsScrollBarVisible:Boolean;
begin
{*
 004E5C38    push        ebx
 004E5C39    push        esi
 004E5C3A    mov         ebx,eax
 004E5C3C    mov         esi,100000
 004E5C41    cmp         byte ptr [ebx+18],1
>004E5C45    jne         004E5C4C
 004E5C47    mov         esi,200000
 004E5C4C    cmp         byte ptr [ebx+1C],0
>004E5C50    je          004E5C66
 004E5C52    push        0F0
 004E5C54    mov         eax,dword ptr [ebx+4]
 004E5C57    call        TWinControl.GetHandle
 004E5C5C    push        eax
 004E5C5D    call        user32.GetWindowLongW
 004E5C62    test        eax,esi
>004E5C64    jne         004E5C6B
 004E5C66    xor         eax,eax
 004E5C68    pop         esi
 004E5C69    pop         ebx
 004E5C6A    ret
 004E5C6B    mov         al,1
 004E5C6D    pop         esi
 004E5C6E    pop         ebx
 004E5C6F    ret
*}
end;

//004E5C70
function ScrollBarVisible(Code:Word):Boolean;
begin
{*
 004E5C70    push        ebp
 004E5C71    mov         ebp,esp
 004E5C73    push        ebx
 004E5C74    mov         ebx,100000
 004E5C79    cmp         ax,1
>004E5C7D    jne         004E5C84
 004E5C7F    mov         ebx,200000
 004E5C84    push        0F0
 004E5C86    mov         eax,dword ptr [ebp+8]
 004E5C89    mov         eax,dword ptr [eax-4]
 004E5C8C    mov         eax,dword ptr [eax+4]
 004E5C8F    call        TWinControl.GetHandle
 004E5C94    push        eax
 004E5C95    call        user32.GetWindowLongW
 004E5C9A    test        eax,ebx
 004E5C9C    setne       al
 004E5C9F    pop         ebx
 004E5CA0    pop         ebp
 004E5CA1    ret
*}
end;

//004E5CA4
function Adjustment(Code:Word; Metric:Word):Integer;
begin
{*
 004E5CA4    push        ebp
 004E5CA5    mov         ebp,esp
 004E5CA7    push        ebx
 004E5CA8    push        esi
 004E5CA9    push        edi
 004E5CAA    mov         edi,edx
 004E5CAC    mov         esi,eax
 004E5CAE    xor         ebx,ebx
 004E5CB0    mov         eax,dword ptr [ebp+8]
 004E5CB3    cmp         byte ptr [eax-5],0
>004E5CB7    jne         004E5D11
 004E5CB9    mov         eax,dword ptr [ebp+8]
 004E5CBC    cmp         byte ptr [eax-6],0
>004E5CC0    je          004E5CE7
 004E5CC2    mov         eax,dword ptr [ebp+8]
 004E5CC5    push        eax
 004E5CC6    mov         eax,esi
 004E5CC8    call        ScrollBarVisible
 004E5CCD    pop         ecx
 004E5CCE    test        al,al
>004E5CD0    jne         004E5CE7
 004E5CD2    movzx       eax,di
 004E5CD5    push        eax
 004E5CD6    call        user32.GetSystemMetrics
 004E5CDB    mov         ebx,eax
 004E5CDD    mov         eax,dword ptr [ebp+8]
 004E5CE0    sub         ebx,dword ptr [eax-0C]
 004E5CE3    neg         ebx
>004E5CE5    jmp         004E5D11
 004E5CE7    mov         eax,dword ptr [ebp+8]
 004E5CEA    cmp         byte ptr [eax-6],0
>004E5CEE    jne         004E5D11
 004E5CF0    mov         eax,dword ptr [ebp+8]
 004E5CF3    push        eax
 004E5CF4    mov         eax,esi
 004E5CF6    call        ScrollBarVisible
 004E5CFB    pop         ecx
 004E5CFC    test        al,al
>004E5CFE    je          004E5D11
 004E5D00    movzx       eax,di
 004E5D03    push        eax
 004E5D04    call        user32.GetSystemMetrics
 004E5D09    mov         ebx,eax
 004E5D0B    mov         eax,dword ptr [ebp+8]
 004E5D0E    sub         ebx,dword ptr [eax-0C]
 004E5D11    mov         eax,ebx
 004E5D13    pop         edi
 004E5D14    pop         esi
 004E5D15    pop         ebx
 004E5D16    pop         ebp
 004E5D17    ret
*}
end;

//004E5D18
function TControlScrollBar.ControlSize(ControlSB:Boolean; AssumeSB:Boolean):Integer;
begin
{*
 004E5D18    push        ebp
 004E5D19    mov         ebp,esp
 004E5D1B    add         esp,0FFFFFFF4
 004E5D1E    push        ebx
 004E5D1F    mov         byte ptr [ebp-6],cl
 004E5D22    mov         byte ptr [ebp-5],dl
 004E5D25    mov         dword ptr [ebp-4],eax
 004E5D28    push        0F0
 004E5D2A    mov         eax,dword ptr [ebp-4]
 004E5D2D    mov         eax,dword ptr [eax+4]
 004E5D30    call        TWinControl.GetHandle
 004E5D35    push        eax
 004E5D36    call        user32.GetWindowLongW
 004E5D3B    test        eax,840000
 004E5D40    setne       al
 004E5D43    and         eax,7F
 004E5D46    mov         dword ptr [ebp-0C],eax
 004E5D49    mov         eax,dword ptr [ebp-4]
 004E5D4C    cmp         byte ptr [eax+18],1
>004E5D50    jne         004E5D72
 004E5D52    push        ebp
 004E5D53    mov         dx,15
 004E5D57    xor         eax,eax
 004E5D59    call        Adjustment
 004E5D5E    pop         ecx
 004E5D5F    mov         ebx,eax
 004E5D61    mov         eax,dword ptr [ebp-4]
 004E5D64    mov         eax,dword ptr [eax+4]
 004E5D67    call        TControl.GetClientHeight
 004E5D6C    add         ebx,eax
 004E5D6E    mov         eax,ebx
>004E5D70    jmp         004E5D92
 004E5D72    push        ebp
 004E5D73    mov         dx,14
 004E5D77    mov         ax,1
 004E5D7B    call        Adjustment
 004E5D80    pop         ecx
 004E5D81    mov         ebx,eax
 004E5D83    mov         eax,dword ptr [ebp-4]
 004E5D86    mov         eax,dword ptr [eax+4]
 004E5D89    call        TControl.GetClientWidth
 004E5D8E    add         ebx,eax
 004E5D90    mov         eax,ebx
 004E5D92    pop         ebx
 004E5D93    mov         esp,ebp
 004E5D95    pop         ebp
 004E5D96    ret
*}
end;

//004E5D98
function TControlScrollBar.GetScrollPos:Integer;
begin
{*
 004E5D98    xor         edx,edx
 004E5D9A    cmp         byte ptr [eax+1C],0
>004E5D9E    je          004E5DA3
 004E5DA0    mov         edx,dword ptr [eax+0C]
 004E5DA3    mov         eax,edx
 004E5DA5    ret
*}
end;

//004E5DA8
function TControlScrollBar.NeedsScrollBarVisible:Boolean;
begin
{*
 004E5DA8    push        ebx
 004E5DA9    mov         ebx,eax
 004E5DAB    xor         ecx,ecx
 004E5DAD    xor         edx,edx
 004E5DAF    mov         eax,ebx
 004E5DB1    call        TControlScrollBar.ControlSize
 004E5DB6    cmp         eax,dword ptr [ebx+10]
 004E5DB9    setl        al
 004E5DBC    pop         ebx
 004E5DBD    ret
*}
end;

//004E5DC0
function GetRealScrollPosition:Integer;
begin
{*
 004E5DC0    push        ebp
 004E5DC1    mov         ebp,esp
 004E5DC3    add         esp,0FFFFFFE4
 004E5DC6    push        ebx
 004E5DC7    push        esi
 004E5DC8    mov         dword ptr [ebp-1C],1C
 004E5DCF    mov         dword ptr [ebp-18],10
 004E5DD6    xor         ebx,ebx
 004E5DD8    mov         eax,dword ptr [ebp+8]
 004E5DDB    mov         eax,dword ptr [eax-4]
 004E5DDE    cmp         byte ptr [eax+18],1
>004E5DE2    jne         004E5DE9
 004E5DE4    mov         ebx,1
 004E5DE9    mov         eax,dword ptr [ebp+8]
 004E5DEC    mov         esi,dword ptr [eax-8]
 004E5DEF    movsx       esi,word ptr [esi+6]
 004E5DF3    lea         eax,[ebp-1C]
 004E5DF6    push        eax
 004E5DF7    push        ebx
 004E5DF8    mov         eax,dword ptr [ebp+8]
 004E5DFB    mov         eax,dword ptr [eax-4]
 004E5DFE    mov         eax,dword ptr [eax+4]
 004E5E01    call        TWinControl.GetHandle
 004E5E06    push        eax
 004E5E07    call        comctl32.FlatSB_GetScrollInfo
 004E5E0C    test        eax,eax
>004E5E0E    je          004E5E13
 004E5E10    mov         esi,dword ptr [ebp-4]
 004E5E13    mov         eax,esi
 004E5E15    pop         esi
 004E5E16    pop         ebx
 004E5E17    mov         esp,ebp
 004E5E19    pop         ebp
 004E5E1A    ret
*}
end;

//004E5E1C
procedure TControlScrollBar.ScrollMessage(var Msg:TWMScroll);
begin
{*
 004E5E1C    push        ebp
 004E5E1D    mov         ebp,esp
 004E5E1F    add         esp,0FFFFFFEC
 004E5E22    push        ebx
 004E5E23    push        esi
 004E5E24    push        edi
 004E5E25    mov         dword ptr [ebp-8],edx
 004E5E28    mov         dword ptr [ebp-4],eax
 004E5E2B    mov         eax,dword ptr [ebp-4]
 004E5E2E    cmp         byte ptr [eax+1F],0
>004E5E32    je          004E5FDF
 004E5E38    mov         eax,dword ptr [ebp-8]
 004E5E3B    movzx       eax,word ptr [eax+4]
 004E5E3F    sub         ax,4
>004E5E43    jae         004E5FDF
 004E5E49    mov         eax,dword ptr [ebp-8]
 004E5E4C    movzx       eax,word ptr [eax+4]
 004E5E50    sub         ax,2
>004E5E54    jb          004E5E5E
 004E5E56    sub         ax,2
>004E5E5A    jb          004E5E7F
>004E5E5C    jmp         004E5EA5
 004E5E5E    mov         eax,dword ptr [ebp-4]
 004E5E61    movzx       ebx,word ptr [eax+8]
 004E5E65    mov         eax,ebx
 004E5E67    mov         edx,dword ptr [ebp-4]
 004E5E6A    mov         ecx,dword ptr [edx+40]
 004E5E6D    cdq
 004E5E6E    idiv        eax,ecx
 004E5E70    mov         dword ptr [ebp-0C],eax
 004E5E73    mov         eax,ebx
 004E5E75    cdq
 004E5E76    idiv        eax,ecx
 004E5E78    mov         dword ptr [ebp-10],edx
 004E5E7B    mov         edi,ecx
>004E5E7D    jmp         004E5EB1
 004E5E7F    mov         eax,dword ptr [ebp-4]
 004E5E82    movzx       eax,word ptr [eax+0A]
 004E5E86    mov         dword ptr [ebp-0C],eax
 004E5E89    mov         eax,dword ptr [ebp-4]
 004E5E8C    mov         ebx,dword ptr [eax+3C]
 004E5E8F    mov         eax,dword ptr [ebp-0C]
 004E5E92    cdq
 004E5E93    idiv        eax,ebx
 004E5E95    mov         dword ptr [ebp-10],edx
 004E5E98    mov         eax,dword ptr [ebp-0C]
 004E5E9B    cdq
 004E5E9C    idiv        eax,ebx
 004E5E9E    mov         dword ptr [ebp-0C],eax
 004E5EA1    mov         edi,ebx
>004E5EA3    jmp         004E5EB1
 004E5EA5    xor         edi,edi
 004E5EA7    xor         eax,eax
 004E5EA9    mov         dword ptr [ebp-0C],eax
 004E5EAC    xor         eax,eax
 004E5EAE    mov         dword ptr [ebp-10],eax
 004E5EB1    xor         eax,eax
 004E5EB3    mov         dword ptr [ebp-14],eax
 004E5EB6    test        edi,edi
>004E5EB8    jle         004E5F5F
 004E5EBE    call        kernel32.GetTickCount
 004E5EC3    mov         ebx,eax
 004E5EC5    mov         esi,ebx
 004E5EC7    sub         esi,dword ptr [ebp-14]
 004E5ECA    mov         eax,dword ptr [ebp-4]
 004E5ECD    cmp         esi,dword ptr [eax+20]
>004E5ED0    jae         004E5EE0
 004E5ED2    mov         eax,dword ptr [ebp-4]
 004E5ED5    mov         eax,dword ptr [eax+20]
 004E5ED8    sub         eax,esi
 004E5EDA    push        eax
 004E5EDB    call        kernel32.Sleep
 004E5EE0    mov         dword ptr [ebp-14],ebx
 004E5EE3    mov         eax,dword ptr [ebp-8]
 004E5EE6    movzx       eax,word ptr [eax+4]
 004E5EEA    sub         ax,1
>004E5EEE    jb          004E5EFE
>004E5EF0    je          004E5F11
 004E5EF2    dec         ax
>004E5EF5    je          004E5F24
 004E5EF7    dec         ax
>004E5EFA    je          004E5F37
>004E5EFC    jmp         004E5F48
 004E5EFE    mov         eax,dword ptr [ebp-4]
 004E5F01    mov         edx,dword ptr [eax+0C]
 004E5F04    sub         edx,dword ptr [ebp-0C]
 004E5F07    mov         eax,dword ptr [ebp-4]
 004E5F0A    call        TControlScrollBar.SetPosition
>004E5F0F    jmp         004E5F48
 004E5F11    mov         eax,dword ptr [ebp-4]
 004E5F14    mov         edx,dword ptr [eax+0C]
 004E5F17    add         edx,dword ptr [ebp-0C]
 004E5F1A    mov         eax,dword ptr [ebp-4]
 004E5F1D    call        TControlScrollBar.SetPosition
>004E5F22    jmp         004E5F48
 004E5F24    mov         eax,dword ptr [ebp-4]
 004E5F27    mov         edx,dword ptr [eax+0C]
 004E5F2A    sub         edx,dword ptr [ebp-0C]
 004E5F2D    mov         eax,dword ptr [ebp-4]
 004E5F30    call        TControlScrollBar.SetPosition
>004E5F35    jmp         004E5F48
 004E5F37    mov         eax,dword ptr [ebp-4]
 004E5F3A    mov         edx,dword ptr [eax+0C]
 004E5F3D    add         edx,dword ptr [ebp-0C]
 004E5F40    mov         eax,dword ptr [ebp-4]
 004E5F43    call        TControlScrollBar.SetPosition
 004E5F48    mov         eax,dword ptr [ebp-4]
 004E5F4B    mov         eax,dword ptr [eax+4]
 004E5F4E    mov         edx,dword ptr [eax]
 004E5F50    call        dword ptr [edx+9C]
 004E5F56    dec         edi
 004E5F57    test        edi,edi
>004E5F59    jg          004E5EBE
 004E5F5F    cmp         dword ptr [ebp-10],0
>004E5F63    jle         004E6113
 004E5F69    mov         eax,dword ptr [ebp-8]
 004E5F6C    movzx       eax,word ptr [eax+4]
 004E5F70    sub         ax,1
>004E5F74    jb          004E5F87
>004E5F76    je          004E5F9D
 004E5F78    dec         ax
>004E5F7B    je          004E5FB3
 004E5F7D    dec         ax
>004E5F80    je          004E5FC9
>004E5F82    jmp         004E6113
 004E5F87    mov         eax,dword ptr [ebp-4]
 004E5F8A    mov         edx,dword ptr [eax+0C]
 004E5F8D    sub         edx,dword ptr [ebp-10]
 004E5F90    mov         eax,dword ptr [ebp-4]
 004E5F93    call        TControlScrollBar.SetPosition
>004E5F98    jmp         004E6113
 004E5F9D    mov         eax,dword ptr [ebp-4]
 004E5FA0    mov         edx,dword ptr [eax+0C]
 004E5FA3    add         edx,dword ptr [ebp-10]
 004E5FA6    mov         eax,dword ptr [ebp-4]
 004E5FA9    call        TControlScrollBar.SetPosition
>004E5FAE    jmp         004E6113
 004E5FB3    mov         eax,dword ptr [ebp-4]
 004E5FB6    mov         edx,dword ptr [eax+0C]
 004E5FB9    sub         edx,dword ptr [ebp-10]
 004E5FBC    mov         eax,dword ptr [ebp-4]
 004E5FBF    call        TControlScrollBar.SetPosition
>004E5FC4    jmp         004E6113
 004E5FC9    mov         eax,dword ptr [ebp-4]
 004E5FCC    mov         edx,dword ptr [eax+0C]
 004E5FCF    add         edx,dword ptr [ebp-10]
 004E5FD2    mov         eax,dword ptr [ebp-4]
 004E5FD5    call        TControlScrollBar.SetPosition
>004E5FDA    jmp         004E6113
 004E5FDF    mov         eax,dword ptr [ebp-8]
 004E5FE2    movsx       eax,word ptr [eax+4]
 004E5FE6    cmp         eax,7
>004E5FE9    ja          004E6113
 004E5FEF    jmp         dword ptr [eax*4+4E5FF6]
 004E5FEF    dd          004E6016
 004E5FEF    dd          004E6032
 004E5FEF    dd          004E604E
 004E5FEF    dd          004E606F
 004E5FEF    dd          004E6090
 004E5FEF    dd          004E60C0
 004E5FEF    dd          004E60F9
 004E5FEF    dd          004E6105
 004E6016    mov         eax,dword ptr [ebp-4]
 004E6019    mov         edx,dword ptr [eax+0C]
 004E601C    mov         eax,dword ptr [ebp-4]
 004E601F    movzx       eax,word ptr [eax+8]
 004E6023    sub         edx,eax
 004E6025    mov         eax,dword ptr [ebp-4]
 004E6028    call        TControlScrollBar.SetPosition
>004E602D    jmp         004E6113
 004E6032    mov         eax,dword ptr [ebp-4]
 004E6035    mov         edx,dword ptr [eax+0C]
 004E6038    mov         eax,dword ptr [ebp-4]
 004E603B    movzx       eax,word ptr [eax+8]
 004E603F    add         edx,eax
 004E6041    mov         eax,dword ptr [ebp-4]
 004E6044    call        TControlScrollBar.SetPosition
>004E6049    jmp         004E6113
 004E604E    xor         ecx,ecx
 004E6050    mov         dl,1
 004E6052    mov         eax,dword ptr [ebp-4]
 004E6055    call        TControlScrollBar.ControlSize
 004E605A    mov         edx,dword ptr [ebp-4]
 004E605D    mov         edx,dword ptr [edx+0C]
 004E6060    sub         edx,eax
 004E6062    mov         eax,dword ptr [ebp-4]
 004E6065    call        TControlScrollBar.SetPosition
>004E606A    jmp         004E6113
 004E606F    xor         ecx,ecx
 004E6071    mov         dl,1
 004E6073    mov         eax,dword ptr [ebp-4]
 004E6076    call        TControlScrollBar.ControlSize
 004E607B    mov         edx,eax
 004E607D    mov         eax,dword ptr [ebp-4]
 004E6080    add         edx,dword ptr [eax+0C]
 004E6083    mov         eax,dword ptr [ebp-4]
 004E6086    call        TControlScrollBar.SetPosition
>004E608B    jmp         004E6113
 004E6090    mov         eax,dword ptr [ebp-4]
 004E6093    cmp         dword ptr [eax+14],7FFF
>004E609A    jle         004E60AF
 004E609C    push        ebp
 004E609D    call        GetRealScrollPosition
 004E60A2    pop         ecx
 004E60A3    mov         edx,eax
 004E60A5    mov         eax,dword ptr [ebp-4]
 004E60A8    call        TControlScrollBar.SetPosition
>004E60AD    jmp         004E6113
 004E60AF    mov         edx,dword ptr [ebp-8]
 004E60B2    movsx       edx,word ptr [edx+6]
 004E60B6    mov         eax,dword ptr [ebp-4]
 004E60B9    call        TControlScrollBar.SetPosition
>004E60BE    jmp         004E6113
 004E60C0    mov         eax,dword ptr [ebp-4]
 004E60C3    cmp         byte ptr [eax+1D],0
>004E60C7    je          004E6113
 004E60C9    mov         eax,dword ptr [ebp-4]
 004E60CC    cmp         dword ptr [eax+14],7FFF
>004E60D3    jle         004E60E8
 004E60D5    push        ebp
 004E60D6    call        GetRealScrollPosition
 004E60DB    pop         ecx
 004E60DC    mov         edx,eax
 004E60DE    mov         eax,dword ptr [ebp-4]
 004E60E1    call        TControlScrollBar.SetPosition
>004E60E6    jmp         004E6113
 004E60E8    mov         edx,dword ptr [ebp-8]
 004E60EB    movsx       edx,word ptr [edx+6]
 004E60EF    mov         eax,dword ptr [ebp-4]
 004E60F2    call        TControlScrollBar.SetPosition
>004E60F7    jmp         004E6113
 004E60F9    xor         edx,edx
 004E60FB    mov         eax,dword ptr [ebp-4]
 004E60FE    call        TControlScrollBar.SetPosition
>004E6103    jmp         004E6113
 004E6105    mov         eax,dword ptr [ebp-4]
 004E6108    mov         edx,dword ptr [eax+14]
 004E610B    mov         eax,dword ptr [ebp-4]
 004E610E    call        TControlScrollBar.SetPosition
 004E6113    pop         edi
 004E6114    pop         esi
 004E6115    pop         ebx
 004E6116    mov         esp,ebp
 004E6118    pop         ebp
 004E6119    ret
*}
end;

//004E611C
procedure TControlScrollBar.SetButtonSize(Value:Integer);
begin
{*
 004E611C    push        ebx
 004E611D    push        esi
 004E611E    mov         ebx,eax
 004E6120    cmp         edx,dword ptr [ebx+24]
>004E6123    je          004E6156
 004E6125    mov         esi,edx
 004E6127    test        esi,esi
>004E6129    jne         004E613E
 004E612B    movzx       eax,byte ptr [ebx+18]
 004E612F    mov         eax,dword ptr [eax*4+786714]
 004E6136    push        eax
 004E6137    call        user32.GetSystemMetrics
 004E613C    mov         edx,eax
 004E613E    mov         dword ptr [ebx+24],edx
 004E6141    mov         byte ptr [ebx+44],1
 004E6145    mov         eax,dword ptr [ebx+4]
 004E6148    call        TScrollingWinControl.UpdateScrollBars
 004E614D    test        esi,esi
>004E614F    jne         004E6156
 004E6151    xor         eax,eax
 004E6153    mov         dword ptr [ebx+24],eax
 004E6156    pop         esi
 004E6157    pop         ebx
 004E6158    ret
*}
end;

//004E615C
procedure TControlScrollBar.SetColor(Value:TColor);
begin
{*
 004E615C    cmp         edx,dword ptr [eax+28]
>004E615F    je          004E6174
 004E6161    mov         dword ptr [eax+28],edx
 004E6164    mov         byte ptr [eax+2C],0
 004E6168    mov         byte ptr [eax+44],1
 004E616C    mov         eax,dword ptr [eax+4]
 004E616F    call        TScrollingWinControl.UpdateScrollBars
 004E6174    ret
*}
end;

//004E6178
procedure TControlScrollBar.SetParentColor(Value:Boolean);
begin
{*
 004E6178    cmp         dl,byte ptr [eax+2C]
>004E617B    je          004E618E
 004E617D    mov         byte ptr [eax+2C],dl
 004E6180    test        dl,dl
>004E6182    je          004E618E
 004E6184    mov         edx,0FF000014
 004E6189    call        TControlScrollBar.SetColor
 004E618E    ret
*}
end;

//004E6190
procedure TControlScrollBar.SetPosition(Value:Integer);
begin
{*
 004E6190    push        ebx
 004E6191    push        esi
 004E6192    push        edi
 004E6193    mov         ebx,eax
 004E6195    mov         eax,dword ptr [ebx+4]
 004E6198    test        byte ptr [eax+1C],2
>004E619C    je          004E61A6
 004E619E    mov         dword ptr [ebx+0C],edx
>004E61A1    jmp         004E6247
 004E61A6    mov         eax,dword ptr [ebx+14]
 004E61A9    cmp         edx,eax
>004E61AB    jle         004E61B1
 004E61AD    mov         edx,eax
>004E61AF    jmp         004E61B7
 004E61B1    test        edx,edx
>004E61B3    jge         004E61B7
 004E61B5    xor         edx,edx
 004E61B7    cmp         byte ptr [ebx+18],0
>004E61BB    jne         004E61C1
 004E61BD    xor         esi,esi
>004E61BF    jmp         004E61C5
 004E61C1    mov         si,1
 004E61C5    mov         eax,dword ptr [ebx+0C]
 004E61C8    cmp         edx,eax
>004E61CA    je          004E621B
 004E61CC    mov         dword ptr [ebx+0C],edx
 004E61CF    cmp         byte ptr [ebx+18],0
>004E61D3    jne         004E61E5
 004E61D5    sub         eax,edx
 004E61D7    mov         edx,eax
 004E61D9    xor         ecx,ecx
 004E61DB    mov         eax,dword ptr [ebx+4]
 004E61DE    call        TWinControl.ScrollBy
>004E61E3    jmp         004E61F3
 004E61E5    mov         ecx,eax
 004E61E7    sub         ecx,edx
 004E61E9    mov         eax,dword ptr [ebx+4]
 004E61EC    xor         edx,edx
 004E61EE    call        TWinControl.ScrollBy
 004E61F3    mov         eax,dword ptr [ebx+4]
 004E61F6    test        byte ptr [eax+1C],10
>004E61FA    je          004E621B
 004E61FC    xor         edx,edx
 004E61FE    call        GetParentForm
 004E6203    test        eax,eax
>004E6205    je          004E621B
 004E6207    cmp         dword ptr [eax+2BC],0
>004E620E    je          004E621B
 004E6210    mov         eax,dword ptr [eax+2BC]
 004E6216    mov         edx,dword ptr [eax]
 004E6218    call        dword ptr [edx+0C]
 004E621B    movzx       edi,si
 004E621E    push        edi
 004E621F    mov         eax,dword ptr [ebx+4]
 004E6222    call        TWinControl.GetHandle
 004E6227    push        eax
 004E6228    call        comctl32.FlatSB_GetScrollPos
 004E622D    cmp         eax,dword ptr [ebx+0C]
>004E6230    je          004E6247
 004E6232    push        0FF
 004E6234    mov         eax,dword ptr [ebx+0C]
 004E6237    push        eax
 004E6238    push        edi
 004E6239    mov         eax,dword ptr [ebx+4]
 004E623C    call        TWinControl.GetHandle
 004E6241    push        eax
 004E6242    call        comctl32.FlatSB_SetScrollPos
 004E6247    pop         edi
 004E6248    pop         esi
 004E6249    pop         ebx
 004E624A    ret
*}
end;

//004E624C
procedure TControlScrollBar.SetSize(Value:Integer);
begin
{*
 004E624C    push        ebx
 004E624D    push        esi
 004E624E    mov         ebx,eax
 004E6250    cmp         edx,dword ptr [ebx+30]
>004E6253    je          004E6286
 004E6255    mov         esi,edx
 004E6257    test        esi,esi
>004E6259    jne         004E626E
 004E625B    movzx       eax,byte ptr [ebx+18]
 004E625F    mov         eax,dword ptr [eax*4+78671C]
 004E6266    push        eax
 004E6267    call        user32.GetSystemMetrics
 004E626C    mov         edx,eax
 004E626E    mov         dword ptr [ebx+30],edx
 004E6271    mov         byte ptr [ebx+44],1
 004E6275    mov         eax,dword ptr [ebx+4]
 004E6278    call        TScrollingWinControl.UpdateScrollBars
 004E627D    test        esi,esi
>004E627F    jne         004E6286
 004E6281    xor         eax,eax
 004E6283    mov         dword ptr [ebx+30],eax
 004E6286    pop         esi
 004E6287    pop         ebx
 004E6288    ret
*}
end;

//004E628C
procedure TControlScrollBar.SetStyle(Value:TScrollBarStyle);
begin
{*
 004E628C    cmp         dl,byte ptr [eax+34]
>004E628F    je          004E62A0
 004E6291    mov         byte ptr [eax+34],dl
 004E6294    mov         byte ptr [eax+44],1
 004E6298    mov         eax,dword ptr [eax+4]
 004E629B    call        TScrollingWinControl.UpdateScrollBars
 004E62A0    ret
*}
end;

//004E62A4
procedure TControlScrollBar.SetThumbSize(Value:Integer);
begin
{*
 004E62A4    cmp         edx,dword ptr [eax+38]
>004E62A7    je          004E62B8
 004E62A9    mov         dword ptr [eax+38],edx
 004E62AC    mov         byte ptr [eax+44],1
 004E62B0    mov         eax,dword ptr [eax+4]
 004E62B3    call        TScrollingWinControl.UpdateScrollBars
 004E62B8    ret
*}
end;

//004E62BC
procedure TControlScrollBar.DoSetRange(Value:Integer);
begin
{*
 004E62BC    mov         ecx,edx
 004E62BE    mov         dword ptr [eax+10],ecx
 004E62C1    test        ecx,ecx
>004E62C3    jge         004E62CA
 004E62C5    xor         edx,edx
 004E62C7    mov         dword ptr [eax+10],edx
 004E62CA    mov         eax,dword ptr [eax+4]
 004E62CD    call        TScrollingWinControl.UpdateScrollBars
 004E62D2    ret
*}
end;

//004E62D4
procedure TControlScrollBar.SetRange(Value:Integer);
begin
{*
 004E62D4    mov         ecx,dword ptr [eax+4]
 004E62D7    mov         byte ptr [ecx+274],0
 004E62DE    mov         byte ptr [eax+1E],1
 004E62E2    call        TControlScrollBar.DoSetRange
 004E62E7    ret
*}
end;

//004E62E8
function TControlScrollBar.IsRangeStored(Value:Integer):Boolean;
begin
{*
 004E62E8    mov         eax,dword ptr [eax+4]
 004E62EB    movzx       eax,byte ptr [eax+274]
 004E62F2    xor         al,1
 004E62F4    ret
*}
end;

//004E62F8
procedure TControlScrollBar.SetVisible(Value:Boolean);
begin
{*
 004E62F8    mov         byte ptr [eax+1C],dl
 004E62FB    mov         eax,dword ptr [eax+4]
 004E62FE    call        TScrollingWinControl.UpdateScrollBars
 004E6303    ret
*}
end;

//004E6304
procedure UpdateScrollProperties(Redraw:Boolean);
begin
{*
 004E6304    push        ebp
 004E6305    mov         ebp,esp
 004E6307    push        ebx
 004E6308    push        esi
 004E6309    mov         ebx,eax
 004E630B    mov         esi,dword ptr [ebp+8]
 004E630E    add         esi,0FFFFFFFC
 004E6311    cmp         bl,1
 004E6314    cmc
 004E6315    sbb         eax,eax
 004E6317    push        eax
 004E6318    mov         eax,dword ptr [esi]
 004E631A    movzx       eax,byte ptr [eax+34]
 004E631E    mov         eax,dword ptr [eax*4+78674C]
 004E6325    push        eax
 004E6326    mov         eax,dword ptr [esi]
 004E6328    movzx       eax,byte ptr [eax+18]
 004E632C    lea         eax,[eax+eax*4]
 004E632F    mov         eax,dword ptr [eax*4+786724]
 004E6336    push        eax
 004E6337    mov         eax,dword ptr [esi]
 004E6339    mov         eax,dword ptr [eax+4]
 004E633C    call        TWinControl.GetHandle
 004E6341    push        eax
 004E6342    call        comctl32.FlatSB_SetScrollProp
 004E6347    mov         eax,dword ptr [esi]
 004E6349    cmp         dword ptr [eax+24],0
>004E634D    jle         004E6378
 004E634F    push        0
 004E6351    mov         eax,dword ptr [esi]
 004E6353    mov         eax,dword ptr [eax+24]
 004E6356    push        eax
 004E6357    mov         eax,dword ptr [esi]
 004E6359    movzx       eax,byte ptr [eax+18]
 004E635D    lea         eax,[eax+eax*4]
 004E6360    mov         eax,dword ptr [eax*4+786728]
 004E6367    push        eax
 004E6368    mov         eax,dword ptr [esi]
 004E636A    mov         eax,dword ptr [eax+4]
 004E636D    call        TWinControl.GetHandle
 004E6372    push        eax
 004E6373    call        comctl32.FlatSB_SetScrollProp
 004E6378    mov         eax,dword ptr [esi]
 004E637A    cmp         dword ptr [eax+38],0
>004E637E    jle         004E63A9
 004E6380    push        0
 004E6382    mov         eax,dword ptr [esi]
 004E6384    mov         eax,dword ptr [eax+38]
 004E6387    push        eax
 004E6388    mov         eax,dword ptr [esi]
 004E638A    movzx       eax,byte ptr [eax+18]
 004E638E    lea         eax,[eax+eax*4]
 004E6391    mov         eax,dword ptr [eax*4+78672C]
 004E6398    push        eax
 004E6399    mov         eax,dword ptr [esi]
 004E639B    mov         eax,dword ptr [eax+4]
 004E639E    call        TWinControl.GetHandle
 004E63A3    push        eax
 004E63A4    call        comctl32.FlatSB_SetScrollProp
 004E63A9    mov         eax,dword ptr [esi]
 004E63AB    cmp         dword ptr [eax+30],0
>004E63AF    jle         004E63DA
 004E63B1    push        0
 004E63B3    mov         eax,dword ptr [esi]
 004E63B5    mov         eax,dword ptr [eax+30]
 004E63B8    push        eax
 004E63B9    mov         eax,dword ptr [esi]
 004E63BB    movzx       eax,byte ptr [eax+18]
 004E63BF    lea         eax,[eax+eax*4]
 004E63C2    mov         eax,dword ptr [eax*4+786730]
 004E63C9    push        eax
 004E63CA    mov         eax,dword ptr [esi]
 004E63CC    mov         eax,dword ptr [eax+4]
 004E63CF    call        TWinControl.GetHandle
 004E63D4    push        eax
 004E63D5    call        comctl32.FlatSB_SetScrollProp
 004E63DA    push        0
 004E63DC    mov         eax,dword ptr [esi]
 004E63DE    mov         eax,dword ptr [eax+28]
 004E63E1    call        ColorToRGB
 004E63E6    push        eax
 004E63E7    mov         eax,dword ptr [esi]
 004E63E9    movzx       eax,byte ptr [eax+18]
 004E63ED    lea         eax,[eax+eax*4]
 004E63F0    mov         eax,dword ptr [eax*4+786734]
 004E63F7    push        eax
 004E63F8    mov         eax,dword ptr [esi]
 004E63FA    mov         eax,dword ptr [eax+4]
 004E63FD    call        TWinControl.GetHandle
 004E6402    push        eax
 004E6403    call        comctl32.FlatSB_SetScrollProp
 004E6408    pop         esi
 004E6409    pop         ebx
 004E640A    pop         ebp
 004E640B    ret
*}
end;

//004E640C
procedure TControlScrollBar.Update(ControlSB:Boolean; AssumeSB:Boolean);
begin
{*
 004E640C    push        ebp
 004E640D    mov         ebp,esp
 004E640F    add         esp,0FFFFFFDC
 004E6412    push        ebx
 004E6413    push        esi
 004E6414    push        edi
 004E6415    mov         byte ptr [ebp-6],cl
 004E6418    mov         byte ptr [ebp-5],dl
 004E641B    mov         dword ptr [ebp-4],eax
 004E641E    lea         esi,[ebp-4]
 004E6421    mov         eax,dword ptr [esi]
 004E6423    xor         edx,edx
 004E6425    mov         dword ptr [eax+14],edx
 004E6428    xor         ebx,ebx
 004E642A    mov         eax,dword ptr [esi]
 004E642C    cmp         byte ptr [eax+18],1
>004E6430    jne         004E6436
 004E6432    mov         bx,1
 004E6436    mov         eax,dword ptr [esi]
 004E6438    cmp         byte ptr [eax+1C],0
>004E643C    je          004E6464
 004E643E    movzx       ecx,byte ptr [ebp-6]
 004E6442    movzx       edx,byte ptr [ebp-5]
 004E6446    mov         eax,dword ptr [esi]
 004E6448    call        TControlScrollBar.ControlSize
 004E644D    mov         edx,dword ptr [esi]
 004E644F    mov         edi,dword ptr [edx+10]
 004E6452    sub         edi,eax
 004E6454    mov         eax,dword ptr [esi]
 004E6456    mov         dword ptr [eax+14],edi
 004E6459    test        edi,edi
>004E645B    jge         004E6464
 004E645D    mov         eax,dword ptr [esi]
 004E645F    xor         edx,edx
 004E6461    mov         dword ptr [eax+14],edx
 004E6464    mov         dword ptr [ebp-22],1C
 004E646B    mov         dword ptr [ebp-1E],17
 004E6472    xor         eax,eax
 004E6474    mov         dword ptr [ebp-1A],eax
 004E6477    mov         eax,dword ptr [esi]
 004E6479    cmp         dword ptr [eax+14],0
>004E647D    jle         004E6489
 004E647F    mov         eax,dword ptr [esi]
 004E6481    mov         eax,dword ptr [eax+10]
 004E6484    mov         dword ptr [ebp-16],eax
>004E6487    jmp         004E648E
 004E6489    xor         eax,eax
 004E648B    mov         dword ptr [ebp-16],eax
 004E648E    movzx       ecx,byte ptr [ebp-6]
 004E6492    movzx       edx,byte ptr [ebp-5]
 004E6496    mov         eax,dword ptr [esi]
 004E6498    call        TControlScrollBar.ControlSize
 004E649D    inc         eax
 004E649E    mov         dword ptr [ebp-12],eax
 004E64A1    mov         eax,dword ptr [esi]
 004E64A3    mov         eax,dword ptr [eax+0C]
 004E64A6    mov         dword ptr [ebp-0E],eax
 004E64A9    mov         dword ptr [ebp-0A],eax
 004E64AC    mov         edx,dword ptr [esi]
 004E64AE    xor         eax,eax
 004E64B0    mov         byte ptr [edx+44],al
 004E64B3    push        ebp
 004E64B4    call        UpdateScrollProperties
 004E64B9    pop         ecx
 004E64BA    push        0FF
 004E64BC    lea         eax,[ebp-22]
 004E64BF    push        eax
 004E64C0    movzx       eax,bx
 004E64C3    push        eax
 004E64C4    mov         eax,dword ptr [esi]
 004E64C6    mov         eax,dword ptr [eax+4]
 004E64C9    call        TWinControl.GetHandle
 004E64CE    push        eax
 004E64CF    call        comctl32.FlatSB_SetScrollInfo
 004E64D4    mov         eax,dword ptr [esi]
 004E64D6    mov         edx,dword ptr [eax+0C]
 004E64D9    mov         eax,dword ptr [esi]
 004E64DB    call        TControlScrollBar.SetPosition
 004E64E0    xor         ecx,ecx
 004E64E2    mov         dl,1
 004E64E4    mov         eax,dword ptr [esi]
 004E64E6    call        TControlScrollBar.ControlSize
 004E64EB    lea         eax,[eax+eax*8]
 004E64EE    mov         ecx,0A
 004E64F3    cdq
 004E64F4    idiv        eax,ecx
 004E64F6    mov         ebx,eax
 004E64F8    mov         eax,dword ptr [esi]
 004E64FA    mov         word ptr [eax+0A],bx
 004E64FE    mov         eax,dword ptr [esi]
 004E6500    cmp         byte ptr [eax+1F],0
>004E6504    je          004E6518
 004E6506    movzx       eax,bx
 004E6509    mov         ecx,0A
 004E650E    xor         edx,edx
 004E6510    div         eax,ecx
 004E6512    mov         edx,dword ptr [esi]
 004E6514    mov         word ptr [edx+8],ax
 004E6518    pop         edi
 004E6519    pop         esi
 004E651A    pop         ebx
 004E651B    mov         esp,ebp
 004E651D    pop         ebp
 004E651E    ret
*}
end;

//004E6520
constructor TScrollingWinControl.Create;
begin
{*
 004E6520    push        ebp
 004E6521    mov         ebp,esp
 004E6523    push        ecx
 004E6524    push        ebx
 004E6525    test        dl,dl
>004E6527    je          004E6531
 004E6529    add         esp,0FFFFFFF0
 004E652C    call        @ClassCreate
 004E6531    mov         byte ptr [ebp-1],dl
 004E6534    mov         ebx,eax
 004E6536    xor         edx,edx
 004E6538    mov         eax,ebx
 004E653A    call        TWinControl.Create
 004E653F    mov         eax,dword ptr [ebx+50]
 004E6542    or          eax,dword ptr ds:[4E65B8]
 004E6548    mov         dword ptr [ebx+50],eax
 004E654B    push        0
 004E654D    mov         ecx,ebx
 004E654F    mov         dl,1
 004E6551    mov         eax,[004DE380];TControlScrollBar
 004E6556    call        TControlScrollBar.Create
 004E655B    mov         dword ptr [ebx+278],eax
 004E6561    push        1
 004E6563    mov         ecx,ebx
 004E6565    mov         dl,1
 004E6567    mov         eax,[004DE380];TControlScrollBar
 004E656C    call        TControlScrollBar.Create
 004E6571    mov         dword ptr [ebx+288],eax
 004E6577    mov         byte ptr [ebx+274],0
 004E657E    mov         eax,dword ptr [ebx+0AC]
 004E6584    movzx       edx,byte ptr ds:[4E65BC]
 004E658B    mov         byte ptr [eax+10],dl
 004E658E    movzx       edx,byte ptr ds:[4E65C0]
 004E6595    mov         byte ptr [eax+11],dl
 004E6598    mov         eax,ebx
 004E659A    cmp         byte ptr [ebp-1],0
>004E659E    je          004E65AF
 004E65A0    call        @AfterConstruction
 004E65A5    pop         dword ptr fs:[0]
 004E65AC    add         esp,0C
 004E65AF    mov         eax,ebx
 004E65B1    pop         ebx
 004E65B2    pop         ecx
 004E65B3    pop         ebp
 004E65B4    ret
*}
end;

//004E65C4
destructor TScrollingWinControl.Destroy();
begin
{*
 004E65C4    push        ebx
 004E65C5    push        esi
 004E65C6    call        @BeforeDestruction
 004E65CB    mov         ebx,edx
 004E65CD    mov         esi,eax
 004E65CF    lea         eax,[esi+278]
 004E65D5    mov         edx,dword ptr [eax]
 004E65D7    xor         ecx,ecx
 004E65D9    mov         dword ptr [eax],ecx
 004E65DB    mov         eax,edx
 004E65DD    call        TObject.Free
 004E65E2    lea         eax,[esi+288]
 004E65E8    mov         edx,dword ptr [eax]
 004E65EA    xor         ecx,ecx
 004E65EC    mov         dword ptr [eax],ecx
 004E65EE    mov         eax,edx
 004E65F0    call        TObject.Free
 004E65F5    mov         edx,ebx
 004E65F7    and         dl,0FC
 004E65FA    mov         eax,esi
 004E65FC    call        TWinControl.Destroy
 004E6601    test        bl,bl
>004E6603    jle         004E660C
 004E6605    mov         eax,esi
 004E6607    call        @ClassDestroy
 004E660C    pop         esi
 004E660D    pop         ebx
 004E660E    ret
*}
end;

//004E6610
procedure TScrollingWinControl.CreateParams(var Params:TCreateParams);
begin
{*
 004E6610    push        ebx
 004E6611    mov         ebx,edx
 004E6613    mov         edx,ebx
 004E6615    call        TWinControl.CreateParams
 004E661A    and         dword ptr [ebx+24],0FFFFFFFC
 004E661E    pop         ebx
 004E661F    ret
*}
end;

//004E6620
procedure TScrollingWinControl.CreateWnd;
begin
{*
 004E6620    push        ebx
 004E6621    mov         ebx,eax
 004E6623    mov         eax,ebx
 004E6625    call        TWinControl.CreateWnd
 004E662A    mov         eax,[0078DB7C];SysLocale:TSysLocale
 004E662F    cmp         byte ptr [eax+0D],0
>004E6633    jne         004E6655
 004E6635    mov         edx,1
 004E663A    mov         eax,5
 004E663F    call        CheckWin32Version
 004E6644    test        al,al
>004E6646    jne         004E6655
 004E6648    mov         eax,ebx
 004E664A    call        TWinControl.GetHandle
 004E664F    push        eax
 004E6650    call        comctl32.InitializeFlatSB
 004E6655    mov         eax,ebx
 004E6657    call        TScrollingWinControl.UpdateScrollBars
 004E665C    pop         ebx
 004E665D    ret
*}
end;

//004E6660
procedure TScrollingWinControl.AlignControls(AControl:TControl; var ARect:TRect);
begin
{*
 004E6660    push        ebx
 004E6661    push        esi
 004E6662    push        edi
 004E6663    mov         edi,ecx
 004E6665    mov         esi,edx
 004E6667    mov         ebx,eax
 004E6669    mov         eax,ebx
 004E666B    call        TScrollingWinControl.CalcAutoRange
 004E6670    mov         ecx,edi
 004E6672    mov         edx,esi
 004E6674    mov         eax,ebx
 004E6676    call        TWinControl.AlignControls
 004E667B    pop         edi
 004E667C    pop         esi
 004E667D    pop         ebx
 004E667E    ret
*}
end;

//004E6680
function TScrollingWinControl.AutoScrollEnabled:Boolean;
begin
{*
 004E6680    cmp         byte ptr [eax+5E],0
>004E6684    jne         004E6698
 004E6686    cmp         byte ptr [eax+1EC],0
>004E668D    je          004E669B
 004E668F    cmp         byte ptr [eax+1EB],0
>004E6696    je          004E669B
 004E6698    xor         eax,eax
 004E669A    ret
 004E669B    mov         al,1
 004E669D    ret
*}
end;

//004E66A0
procedure TScrollingWinControl.DoFlipChildren;
begin
{*
 004E66A0    push        ebp
 004E66A1    mov         ebp,esp
 004E66A3    add         esp,0FFFFFFF0
 004E66A6    push        ebx
 004E66A7    push        esi
 004E66A8    push        edi
 004E66A9    mov         dword ptr [ebp-4],eax
 004E66AC    mov         dl,1
 004E66AE    mov         eax,[00439644];TList
 004E66B3    call        TObject.Create
 004E66B8    mov         dword ptr [ebp-10],eax
 004E66BB    xor         eax,eax
 004E66BD    push        ebp
 004E66BE    push        4E67A8
 004E66C3    push        dword ptr fs:[eax]
 004E66C6    mov         dword ptr fs:[eax],esp
 004E66C9    mov         eax,dword ptr [ebp-4]
 004E66CC    call        TControl.GetClientWidth
 004E66D1    mov         dword ptr [ebp-8],eax
 004E66D4    mov         eax,dword ptr [ebp-4]
 004E66D7    mov         ebx,dword ptr [eax+278]
 004E66DD    mov         eax,ebx
 004E66DF    call        TControlScrollBar.IsScrollBarVisible
 004E66E4    test        al,al
>004E66E6    je          004E66F0
 004E66E8    mov         eax,dword ptr [ebx+10]
 004E66EB    cmp         eax,dword ptr [ebp-8]
>004E66EE    jg          004E66F4
 004E66F0    xor         eax,eax
>004E66F2    jmp         004E66F6
 004E66F4    mov         al,1
 004E66F6    mov         byte ptr [ebp-9],al
 004E66F9    cmp         byte ptr [ebp-9],0
>004E66FD    je          004E670E
 004E66FF    mov         eax,dword ptr [ebx+10]
 004E6702    mov         dword ptr [ebp-8],eax
 004E6705    xor         edx,edx
 004E6707    mov         eax,ebx
 004E6709    call        TControlScrollBar.SetPosition
 004E670E    mov         eax,dword ptr [ebp-4]
 004E6711    call        TWinControl.GetControlCount
 004E6716    mov         esi,eax
 004E6718    dec         esi
 004E6719    test        esi,esi
>004E671B    jl          004E6754
 004E671D    inc         esi
 004E671E    xor         ebx,ebx
 004E6720    mov         edx,ebx
 004E6722    mov         eax,dword ptr [ebp-4]
 004E6725    call        TWinControl.GetControl
 004E672A    mov         edi,eax
 004E672C    mov         edx,ebx
 004E672E    mov         eax,dword ptr [ebp-4]
 004E6731    call        TWinControl.GetControl
 004E6736    mov         edx,eax
 004E6738    mov         eax,dword ptr [ebp-10]
 004E673B    call        TList.Add
 004E6740    mov         edx,dword ptr [ebp-8]
 004E6743    sub         edx,dword ptr [edi+48]
 004E6746    sub         edx,dword ptr [edi+40]
 004E6749    mov         eax,edi
 004E674B    call        TControl.SetLeft
 004E6750    inc         ebx
 004E6751    dec         esi
>004E6752    jne         004E6720
 004E6754    mov         eax,dword ptr [ebp-10]
 004E6757    mov         esi,dword ptr [eax+8]
 004E675A    dec         esi
 004E675B    test        esi,esi
>004E675D    jl          004E677E
 004E675F    inc         esi
 004E6760    xor         ebx,ebx
 004E6762    push        0
 004E6764    mov         edx,ebx
 004E6766    mov         eax,dword ptr [ebp-10]
 004E6769    call        TList.Get
 004E676E    xor         ecx,ecx
 004E6770    mov         edx,0B03E
 004E6775    call        TControl.Perform
 004E677A    inc         ebx
 004E677B    dec         esi
>004E677C    jne         004E6762
 004E677E    cmp         byte ptr [ebp-9],0
>004E6782    je          004E6792
 004E6784    mov         eax,dword ptr [ebp-4]
 004E6787    mov         eax,dword ptr [eax+278]
 004E678D    call        TControlScrollBar.ChangeBiDiPosition
 004E6792    xor         eax,eax
 004E6794    pop         edx
 004E6795    pop         ecx
 004E6796    pop         ecx
 004E6797    mov         dword ptr fs:[eax],edx
 004E679A    push        4E67AF
 004E679F    mov         eax,dword ptr [ebp-10]
 004E67A2    call        TObject.Free
 004E67A7    ret
>004E67A8    jmp         @HandleFinally
>004E67AD    jmp         004E679F
 004E67AF    pop         edi
 004E67B0    pop         esi
 004E67B1    pop         ebx
 004E67B2    mov         esp,ebp
 004E67B4    pop         ebp
 004E67B5    ret
*}
end;

//004E67B8
procedure TScrollingWinControl.DoGesture(const EventInfo:TGestureEventInfo; var Handled:Boolean);
begin
{*
 004E67B8    push        ebx
 004E67B9    push        esi
 004E67BA    mov         esi,edx
 004E67BC    mov         ebx,eax
 004E67BE    cmp         word ptr [esi],104
>004E67C3    jne         004E6826
 004E67C5    mov         byte ptr [ecx],1
 004E67C8    test        byte ptr [esi+0C],1
>004E67CC    je          004E67E2
 004E67CE    mov         eax,dword ptr [esi+4]
 004E67D1    mov         dword ptr [ebx+27C],eax
 004E67D7    mov         eax,dword ptr [esi+8]
 004E67DA    mov         dword ptr [ebx+280],eax
>004E67E0    jmp         004E6826
 004E67E2    mov         eax,dword ptr [ebx+278]
 004E67E8    mov         edx,dword ptr [eax+0C]
 004E67EB    mov         ecx,dword ptr [esi+4]
 004E67EE    sub         ecx,dword ptr [ebx+27C]
 004E67F4    sub         edx,ecx
 004E67F6    call        TControlScrollBar.SetPosition
 004E67FB    mov         eax,dword ptr [ebx+288]
 004E6801    mov         edx,dword ptr [eax+0C]
 004E6804    mov         ecx,dword ptr [esi+8]
 004E6807    sub         ecx,dword ptr [ebx+280]
 004E680D    sub         edx,ecx
 004E680F    call        TControlScrollBar.SetPosition
 004E6814    mov         eax,dword ptr [esi+4]
 004E6817    mov         dword ptr [ebx+27C],eax
 004E681D    mov         eax,dword ptr [esi+8]
 004E6820    mov         dword ptr [ebx+280],eax
 004E6826    pop         esi
 004E6827    pop         ebx
 004E6828    ret
*}
end;

//004E682C
procedure TScrollingWinControl.DoGetGestureOptions(var Gestures:TInteractiveGestures; var Options:TInteractiveGestureOptions);
begin
{*
 004E682C    push        ebx
 004E682D    push        esi
 004E682E    mov         ebx,edx
 004E6830    mov         esi,eax
 004E6832    mov         edx,ebx
 004E6834    mov         eax,esi
 004E6836    call        TControl.DoGetGestureOptions
 004E683B    test        byte ptr [ebx],2
>004E683E    je          004E6856
 004E6840    cmp         byte ptr [esi+274],0
>004E6847    jne         004E6856
 004E6849    movzx       eax,byte ptr ds:[4E685C]
 004E6850    not         eax
 004E6852    and         al,byte ptr [ebx]
 004E6854    mov         byte ptr [ebx],al
 004E6856    pop         esi
 004E6857    pop         ebx
 004E6858    ret
*}
end;

//004E6860
procedure TScrollingWinControl.CalcAutoRange;
begin
{*
 004E6860    push        ebx
 004E6861    mov         ebx,eax
 004E6863    cmp         dword ptr [ebx+270],0
>004E686A    jg          004E6882
 004E686C    mov         eax,dword ptr [ebx+278]
 004E6872    call        TControlScrollBar.CalcAutoRange
 004E6877    mov         eax,dword ptr [ebx+288]
 004E687D    call        TControlScrollBar.CalcAutoRange
 004E6882    pop         ebx
 004E6883    ret
*}
end;

//004E6884
procedure TScrollingWinControl.SetAutoScroll(Value:Boolean);
begin
{*
 004E6884    push        ebx
 004E6885    mov         ebx,eax
 004E6887    cmp         dl,byte ptr [ebx+274]
>004E688D    je          004E68BC
 004E688F    mov         byte ptr [ebx+274],dl
 004E6895    test        dl,dl
>004E6897    je          004E68A2
 004E6899    mov         eax,ebx
 004E689B    call        TScrollingWinControl.CalcAutoRange
>004E68A0    jmp         004E68BC
 004E68A2    xor         edx,edx
 004E68A4    mov         eax,dword ptr [ebx+278]
 004E68AA    call        TControlScrollBar.SetRange
 004E68AF    xor         edx,edx
 004E68B1    mov         eax,dword ptr [ebx+288]
 004E68B7    call        TControlScrollBar.SetRange
 004E68BC    pop         ebx
 004E68BD    ret
*}
end;

//004E68C0
procedure TScrollingWinControl.SetHorzScrollBar(Value:TControlScrollBar);
begin
{*
 004E68C0    push        esi
 004E68C1    mov         esi,eax
 004E68C3    mov         eax,dword ptr [esi+278]
 004E68C9    mov         ecx,dword ptr [eax]
 004E68CB    call        dword ptr [ecx+8]
 004E68CE    pop         esi
 004E68CF    ret
*}
end;

//004E68D0
procedure TScrollingWinControl.SetVertScrollBar(Value:TControlScrollBar);
begin
{*
 004E68D0    push        esi
 004E68D1    mov         esi,eax
 004E68D3    mov         eax,dword ptr [esi+288]
 004E68D9    mov         ecx,dword ptr [eax]
 004E68DB    call        dword ptr [ecx+8]
 004E68DE    pop         esi
 004E68DF    ret
*}
end;

//004E68E0
procedure TScrollingWinControl.UpdateScrollBars;
begin
{*
 004E68E0    push        ebp
 004E68E1    mov         ebp,esp
 004E68E3    push        ecx
 004E68E4    mov         dword ptr [ebp-4],eax
 004E68E7    mov         eax,dword ptr [ebp-4]
 004E68EA    cmp         byte ptr [eax+284],0
>004E68F1    jne         004E69D2
 004E68F7    mov         eax,dword ptr [ebp-4]
 004E68FA    call        TWinControl.HandleAllocated
 004E68FF    test        al,al
>004E6901    je          004E69D2
 004E6907    xor         eax,eax
 004E6909    push        ebp
 004E690A    push        4E69CB
 004E690F    push        dword ptr fs:[eax]
 004E6912    mov         dword ptr fs:[eax],esp
 004E6915    mov         eax,dword ptr [ebp-4]
 004E6918    mov         byte ptr [eax+284],1
 004E691F    mov         eax,dword ptr [ebp-4]
 004E6922    mov         eax,dword ptr [eax+288]
 004E6928    call        TControlScrollBar.NeedsScrollBarVisible
 004E692D    test        al,al
>004E692F    je          004E6957
 004E6931    mov         eax,dword ptr [ebp-4]
 004E6934    mov         eax,dword ptr [eax+278]
 004E693A    mov         cl,1
 004E693C    xor         edx,edx
 004E693E    call        TControlScrollBar.Update
 004E6943    mov         eax,dword ptr [ebp-4]
 004E6946    mov         eax,dword ptr [eax+288]
 004E694C    xor         ecx,ecx
 004E694E    mov         dl,1
 004E6950    call        TControlScrollBar.Update
>004E6955    jmp         004E69B3
 004E6957    mov         eax,dword ptr [ebp-4]
 004E695A    mov         eax,dword ptr [eax+278]
 004E6960    call        TControlScrollBar.NeedsScrollBarVisible
 004E6965    test        al,al
>004E6967    je          004E698F
 004E6969    mov         eax,dword ptr [ebp-4]
 004E696C    mov         eax,dword ptr [eax+288]
 004E6972    mov         cl,1
 004E6974    xor         edx,edx
 004E6976    call        TControlScrollBar.Update
 004E697B    mov         eax,dword ptr [ebp-4]
 004E697E    mov         eax,dword ptr [eax+278]
 004E6984    xor         ecx,ecx
 004E6986    mov         dl,1
 004E6988    call        TControlScrollBar.Update
>004E698D    jmp         004E69B3
 004E698F    mov         eax,dword ptr [ebp-4]
 004E6992    mov         eax,dword ptr [eax+288]
 004E6998    xor         ecx,ecx
 004E699A    xor         edx,edx
 004E699C    call        TControlScrollBar.Update
 004E69A1    mov         eax,dword ptr [ebp-4]
 004E69A4    mov         eax,dword ptr [eax+278]
 004E69AA    xor         ecx,ecx
 004E69AC    mov         dl,1
 004E69AE    call        TControlScrollBar.Update
 004E69B3    xor         eax,eax
 004E69B5    pop         edx
 004E69B6    pop         ecx
 004E69B7    pop         ecx
 004E69B8    mov         dword ptr fs:[eax],edx
 004E69BB    push        4E69D2
 004E69C0    mov         eax,dword ptr [ebp-4]
 004E69C3    mov         byte ptr [eax+284],0
 004E69CA    ret
>004E69CB    jmp         @HandleFinally
>004E69D0    jmp         004E69C0
 004E69D2    pop         ecx
 004E69D3    pop         ebp
 004E69D4    ret
*}
end;

//004E69D8
procedure TScrollingWinControl.AutoScrollInView(AControl:TControl);
begin
{*
 004E69D8    test        edx,edx
>004E69DA    je          004E69F3
 004E69DC    test        byte ptr [edx+1C],1
>004E69E0    jne         004E69F3
 004E69E2    test        byte ptr [eax+1C],1
>004E69E6    jne         004E69F3
 004E69E8    test        byte ptr [eax+1C],8
>004E69EC    jne         004E69F3
 004E69EE    call        TScrollingWinControl.ScrollInView
 004E69F3    ret
*}
end;

//004E69F4
procedure TScrollingWinControl.DisableAutoRange;
begin
{*
 004E69F4    inc         dword ptr [eax+270];TScrollingWinControl.FAutoRangeCount:Integer
 004E69FA    ret
*}
end;

//004E69FC
procedure TScrollingWinControl.EnableAutoRange;
begin
{*
 004E69FC    cmp         dword ptr [eax+270],0
>004E6A03    jle         004E6A31
 004E6A05    dec         dword ptr [eax+270]
 004E6A0B    cmp         dword ptr [eax+270],0
>004E6A12    jne         004E6A31
 004E6A14    mov         edx,dword ptr [eax+278]
 004E6A1A    cmp         byte ptr [edx+1C],0
>004E6A1E    jne         004E6A2C
 004E6A20    mov         edx,dword ptr [eax+288]
 004E6A26    cmp         byte ptr [edx+1C],0
>004E6A2A    je          004E6A31
 004E6A2C    call        TScrollingWinControl.CalcAutoRange
 004E6A31    ret
*}
end;

//004E6A34
procedure TScrollingWinControl.IsTouchPropertyStored(AProperty:TTouchProperty);
begin
{*
 004E6A34    push        ebx
 004E6A35    push        esi
 004E6A36    mov         ebx,edx
 004E6A38    mov         esi,eax
 004E6A3A    mov         edx,ebx
 004E6A3C    mov         eax,esi
 004E6A3E    call        TControl.IsTouchPropertyStored
 004E6A43    sub         bl,1
>004E6A46    jb          004E6A4C
>004E6A48    je          004E6A62
>004E6A4A    jmp         004E6A75
 004E6A4C    mov         eax,dword ptr [esi+0AC]
 004E6A52    movzx       edx,byte ptr ds:[4E6A78]
 004E6A59    cmp         dl,byte ptr [eax+10]
 004E6A5C    setne       al
 004E6A5F    pop         esi
 004E6A60    pop         ebx
 004E6A61    ret
 004E6A62    mov         eax,dword ptr [esi+0AC]
 004E6A68    movzx       edx,byte ptr ds:[4E6A7C]
 004E6A6F    cmp         dl,byte ptr [eax+11]
 004E6A72    setne       al
 004E6A75    pop         esi
 004E6A76    pop         ebx
 004E6A77    ret
*}
end;

//004E6A80
procedure TScrollingWinControl.ScrollInView(AControl:TControl);
begin
{*
 004E6A80    push        ebx
 004E6A81    push        esi
 004E6A82    push        edi
 004E6A83    push        ebp
 004E6A84    add         esp,0FFFFFFE0
 004E6A87    mov         esi,edx
 004E6A89    mov         ebx,eax
 004E6A8B    mov         edi,esp
 004E6A8D    test        esi,esi
>004E6A8F    je          004E6BC9
 004E6A95    mov         edx,edi
 004E6A97    mov         eax,esi
 004E6A99    mov         ecx,dword ptr [eax]
 004E6A9B    call        dword ptr [ecx+54]
 004E6A9E    mov         eax,dword ptr [ebx+278]
 004E6AA4    movzx       eax,word ptr [eax+1A]
 004E6AA8    sub         dword ptr [edi],eax
 004E6AAA    add         dword ptr [edi+8],eax
 004E6AAD    mov         eax,dword ptr [ebx+288]
 004E6AB3    movzx       eax,word ptr [eax+1A]
 004E6AB7    sub         dword ptr [edi+4],eax
 004E6ABA    add         dword ptr [edi+0C],eax
 004E6ABD    lea         ecx,[esp+18]
 004E6AC1    mov         edx,edi
 004E6AC3    mov         eax,esi
 004E6AC5    call        TControl.ClientToScreen
 004E6ACA    lea         edx,[esp+18]
 004E6ACE    lea         ecx,[esp+10]
 004E6AD2    mov         eax,ebx
 004E6AD4    call        TControl.ScreenToClient
 004E6AD9    mov         eax,dword ptr [esp+10]
 004E6ADD    mov         dword ptr [edi],eax
 004E6ADF    mov         eax,dword ptr [esp+14]
 004E6AE3    mov         dword ptr [edi+4],eax
 004E6AE6    lea         ecx,[esp+18]
 004E6AEA    lea         edx,[edi+8]
 004E6AED    mov         eax,esi
 004E6AEF    call        TControl.ClientToScreen
 004E6AF4    lea         edx,[esp+18]
 004E6AF8    lea         ecx,[esp+10]
 004E6AFC    mov         eax,ebx
 004E6AFE    call        TControl.ScreenToClient
 004E6B03    mov         eax,dword ptr [esp+10]
 004E6B07    mov         dword ptr [edi+8],eax
 004E6B0A    mov         eax,dword ptr [esp+14]
 004E6B0E    mov         dword ptr [edi+0C],eax
 004E6B11    mov         esi,dword ptr [edi]
 004E6B13    test        esi,esi
>004E6B15    jge         004E6B29
 004E6B17    mov         eax,dword ptr [ebx+278]
 004E6B1D    mov         edx,dword ptr [eax+0C]
 004E6B20    add         edx,esi
 004E6B22    call        TControlScrollBar.SetPosition
>004E6B27    jmp         004E6B6C
 004E6B29    mov         eax,ebx
 004E6B2B    call        TControl.GetClientWidth
 004E6B30    mov         ebp,dword ptr [edi+8]
 004E6B33    cmp         eax,ebp
>004E6B35    jge         004E6B6C
 004E6B37    mov         eax,ebx
 004E6B39    call        TControl.GetClientWidth
 004E6B3E    sub         ebp,esi
 004E6B40    cmp         eax,ebp
>004E6B42    jge         004E6B50
 004E6B44    mov         eax,ebx
 004E6B46    call        TControl.GetClientWidth
 004E6B4B    add         eax,dword ptr [edi]
 004E6B4D    mov         dword ptr [edi+8],eax
 004E6B50    mov         esi,dword ptr [ebx+278]
 004E6B56    mov         eax,ebx
 004E6B58    call        TControl.GetClientWidth
 004E6B5D    mov         edx,dword ptr [esi+0C]
 004E6B60    add         edx,dword ptr [edi+8]
 004E6B63    sub         edx,eax
 004E6B65    mov         eax,esi
 004E6B67    call        TControlScrollBar.SetPosition
 004E6B6C    mov         esi,dword ptr [edi+4]
 004E6B6F    test        esi,esi
>004E6B71    jge         004E6B85
 004E6B73    mov         eax,dword ptr [ebx+288]
 004E6B79    mov         edx,dword ptr [eax+0C]
 004E6B7C    add         edx,esi
 004E6B7E    call        TControlScrollBar.SetPosition
>004E6B83    jmp         004E6BC9
 004E6B85    mov         eax,ebx
 004E6B87    call        TControl.GetClientHeight
 004E6B8C    mov         ebp,dword ptr [edi+0C]
 004E6B8F    cmp         eax,ebp
>004E6B91    jge         004E6BC9
 004E6B93    mov         eax,ebx
 004E6B95    call        TControl.GetClientHeight
 004E6B9A    sub         ebp,esi
 004E6B9C    cmp         eax,ebp
>004E6B9E    jge         004E6BAD
 004E6BA0    mov         eax,ebx
 004E6BA2    call        TControl.GetClientHeight
 004E6BA7    add         eax,dword ptr [edi+4]
 004E6BAA    mov         dword ptr [edi+0C],eax
 004E6BAD    mov         esi,dword ptr [ebx+288]
 004E6BB3    mov         eax,ebx
 004E6BB5    call        TControl.GetClientHeight
 004E6BBA    mov         edx,dword ptr [esi+0C]
 004E6BBD    add         edx,dword ptr [edi+0C]
 004E6BC0    sub         edx,eax
 004E6BC2    mov         eax,esi
 004E6BC4    call        TControlScrollBar.SetPosition
 004E6BC9    add         esp,20
 004E6BCC    pop         ebp
 004E6BCD    pop         edi
 004E6BCE    pop         esi
 004E6BCF    pop         ebx
 004E6BD0    ret
*}
end;

//004E6BD4
procedure TScrollingWinControl.ScaleScrollBars(M:Integer; D:Integer);
begin
{*
 004E6BD4    push        ebx
 004E6BD5    push        esi
 004E6BD6    push        edi
 004E6BD7    push        ebp
 004E6BD8    mov         edi,ecx
 004E6BDA    mov         esi,edx
 004E6BDC    mov         ebx,eax
 004E6BDE    cmp         edi,esi
>004E6BE0    je          004E6C5F
 004E6BE2    test        byte ptr [ebx+1C],1
>004E6BE6    jne         004E6BFC
 004E6BE8    mov         eax,dword ptr [ebx+278]
 004E6BEE    mov         byte ptr [eax+1E],1
 004E6BF2    mov         eax,dword ptr [ebx+288]
 004E6BF8    mov         byte ptr [eax+1E],1
 004E6BFC    xor         edx,edx
 004E6BFE    mov         eax,dword ptr [ebx+278]
 004E6C04    call        TControlScrollBar.SetPosition
 004E6C09    xor         edx,edx
 004E6C0B    mov         eax,dword ptr [ebx+288]
 004E6C11    call        TControlScrollBar.SetPosition
 004E6C16    cmp         byte ptr [ebx+274],0
>004E6C1D    jne         004E6C5F
 004E6C1F    mov         ebp,dword ptr [ebx+278]
 004E6C25    cmp         byte ptr [ebp+1E],0
>004E6C29    je          004E6C3F
 004E6C2B    push        edi
 004E6C2C    push        esi
 004E6C2D    mov         eax,dword ptr [ebp+10]
 004E6C30    push        eax
 004E6C31    call        kernel32.MulDiv
 004E6C36    mov         edx,eax
 004E6C38    mov         eax,ebp
 004E6C3A    call        TControlScrollBar.SetRange
 004E6C3F    mov         ebp,dword ptr [ebx+288]
 004E6C45    cmp         byte ptr [ebp+1E],0
>004E6C49    je          004E6C5F
 004E6C4B    push        edi
 004E6C4C    push        esi
 004E6C4D    mov         eax,dword ptr [ebp+10]
 004E6C50    push        eax
 004E6C51    call        kernel32.MulDiv
 004E6C56    mov         edx,eax
 004E6C58    mov         eax,ebp
 004E6C5A    call        TControlScrollBar.SetRange
 004E6C5F    mov         eax,dword ptr [ebx+278]
 004E6C65    mov         byte ptr [eax+1E],0
 004E6C69    mov         eax,dword ptr [ebx+288]
 004E6C6F    mov         byte ptr [eax+1E],0
 004E6C73    pop         ebp
 004E6C74    pop         edi
 004E6C75    pop         esi
 004E6C76    pop         ebx
 004E6C77    ret
*}
end;

//004E6C78
procedure TScrollingWinControl.ChangeScale(M:Integer; D:Integer);
begin
{*
 004E6C78    push        ebx
 004E6C79    push        esi
 004E6C7A    push        edi
 004E6C7B    mov         edi,ecx
 004E6C7D    mov         esi,edx
 004E6C7F    mov         ebx,eax
 004E6C81    mov         ecx,edi
 004E6C83    mov         edx,esi
 004E6C85    mov         eax,ebx
 004E6C87    call        TScrollingWinControl.ScaleScrollBars
 004E6C8C    mov         ecx,edi
 004E6C8E    mov         edx,esi
 004E6C90    mov         eax,ebx
 004E6C92    call        TWinControl.ChangeScale
 004E6C97    pop         edi
 004E6C98    pop         esi
 004E6C99    pop         ebx
 004E6C9A    ret
*}
end;

//004E6C9C
procedure sub_004E6C9C;
begin
{*
 004E6C9C    ret
*}
end;

//004E6CA0
procedure TScrollingWinControl.WMSize(var Message:TWMSize);
begin
{*
 004E6CA0    push        ebp
 004E6CA1    mov         ebp,esp
 004E6CA3    add         esp,0FFFFFFF8
 004E6CA6    push        ebx
 004E6CA7    mov         ebx,edx
 004E6CA9    mov         dword ptr [ebp-4],eax
 004E6CAC    mov         eax,dword ptr [ebp-4]
 004E6CAF    inc         dword ptr [eax+270]
 004E6CB5    xor         edx,edx
 004E6CB7    push        ebp
 004E6CB8    push        4E6D0C
 004E6CBD    push        dword ptr fs:[edx]
 004E6CC0    mov         dword ptr fs:[edx],esp
 004E6CC3    mov         edx,ebx
 004E6CC5    mov         eax,dword ptr [ebp-4]
 004E6CC8    call        TWinControl.WMSize
 004E6CCD    xor         eax,eax
 004E6CCF    mov         edx,dword ptr [ebx+4]
 004E6CD2    sub         edx,1
>004E6CD5    jb          004E6CDE
>004E6CD7    je          004E6CE2
 004E6CD9    dec         edx
>004E6CDA    je          004E6CE6
>004E6CDC    jmp         004E6CE8
 004E6CDE    xor         eax,eax
>004E6CE0    jmp         004E6CE8
 004E6CE2    mov         al,1
>004E6CE4    jmp         004E6CE8
 004E6CE6    mov         al,2
 004E6CE8    mov         edx,eax
 004E6CEA    mov         eax,dword ptr [ebp-4]
 004E6CED    mov         ecx,dword ptr [eax]
 004E6CEF    call        dword ptr [ecx+0F4]
 004E6CF5    xor         eax,eax
 004E6CF7    pop         edx
 004E6CF8    pop         ecx
 004E6CF9    pop         ecx
 004E6CFA    mov         dword ptr fs:[eax],edx
 004E6CFD    push        4E6D13
 004E6D02    mov         eax,dword ptr [ebp-4]
 004E6D05    dec         dword ptr [eax+270]
 004E6D0B    ret
>004E6D0C    jmp         @HandleFinally
>004E6D11    jmp         004E6D02
 004E6D13    mov         eax,dword ptr [ebp-4]
 004E6D16    movzx       eax,byte ptr [eax+284]
 004E6D1D    mov         byte ptr [ebp-5],al
 004E6D20    mov         eax,dword ptr [ebp-4]
 004E6D23    mov         byte ptr [eax+284],1
 004E6D2A    xor         eax,eax
 004E6D2C    push        ebp
 004E6D2D    push        4E6D5B
 004E6D32    push        dword ptr fs:[eax]
 004E6D35    mov         dword ptr fs:[eax],esp
 004E6D38    mov         eax,dword ptr [ebp-4]
 004E6D3B    call        TScrollingWinControl.CalcAutoRange
 004E6D40    xor         eax,eax
 004E6D42    pop         edx
 004E6D43    pop         ecx
 004E6D44    pop         ecx
 004E6D45    mov         dword ptr fs:[eax],edx
 004E6D48    push        4E6D62
 004E6D4D    mov         eax,dword ptr [ebp-4]
 004E6D50    movzx       edx,byte ptr [ebp-5]
 004E6D54    mov         byte ptr [eax+284],dl
 004E6D5A    ret
>004E6D5B    jmp         @HandleFinally
>004E6D60    jmp         004E6D4D
 004E6D62    mov         eax,dword ptr [ebp-4]
 004E6D65    mov         eax,dword ptr [eax+278]
 004E6D6B    cmp         byte ptr [eax+1C],0
>004E6D6F    jne         004E6D80
 004E6D71    mov         eax,dword ptr [ebp-4]
 004E6D74    mov         eax,dword ptr [eax+288]
 004E6D7A    cmp         byte ptr [eax+1C],0
>004E6D7E    je          004E6D88
 004E6D80    mov         eax,dword ptr [ebp-4]
 004E6D83    call        TScrollingWinControl.UpdateScrollBars
 004E6D88    pop         ebx
 004E6D89    pop         ecx
 004E6D8A    pop         ecx
 004E6D8B    pop         ebp
 004E6D8C    ret
*}
end;

//004E6D90
procedure TScrollingWinControl.WMHScroll(Message:TWMCommand);
begin
{*
 004E6D90    cmp         dword ptr [edx+8],0
>004E6D94    jne         004E6DAE
 004E6D96    mov         ecx,dword ptr [eax+278];TScrollingWinControl.FHorzScrollBar:TControlScrollBar
 004E6D9C    cmp         byte ptr [ecx+1C],0;TControlScrollBar.FVisible:Boolean
>004E6DA0    je          004E6DAE
 004E6DA2    mov         eax,dword ptr [eax+278];TScrollingWinControl.FHorzScrollBar:TControlScrollBar
 004E6DA8    call        TControlScrollBar.ScrollMessage
 004E6DAD    ret
 004E6DAE    call        TWinControl.WMCommand
 004E6DB3    ret
*}
end;

//004E6DB4
procedure TScrollingWinControl.WMVScroll(Message:TWMHScroll);
begin
{*
 004E6DB4    cmp         dword ptr [edx+8],0
>004E6DB8    jne         004E6DD2
 004E6DBA    mov         ecx,dword ptr [eax+288];TScrollingWinControl.FVertScrollBar:TControlScrollBar
 004E6DC0    cmp         byte ptr [ecx+1C],0;TControlScrollBar.FVisible:Boolean
>004E6DC4    je          004E6DD2
 004E6DC6    mov         eax,dword ptr [eax+288];TScrollingWinControl.FVertScrollBar:TControlScrollBar
 004E6DCC    call        TControlScrollBar.ScrollMessage
 004E6DD1    ret
 004E6DD2    call        TWinControl.WMHScroll
 004E6DD7    ret
*}
end;

//004E6DD8
procedure TScrollingWinControl.AdjustClientRect(var Rect:TRect);
begin
{*
 004E6DD8    push        ebx
 004E6DD9    push        esi
 004E6DDA    push        edi
 004E6DDB    add         esp,0FFFFFFEC
 004E6DDE    mov         dword ptr [esp],edx
 004E6DE1    mov         ebx,eax
 004E6DE3    mov         eax,ebx
 004E6DE5    call        TControl.GetClientWidth
 004E6DEA    mov         edx,dword ptr [ebx+278]
 004E6DF0    mov         edx,dword ptr [edx+10]
 004E6DF3    cmp         eax,edx
>004E6DF5    jge         004E6DFB
 004E6DF7    mov         esi,edx
>004E6DF9    jmp         004E6DFD
 004E6DFB    mov         esi,eax
 004E6DFD    mov         eax,ebx
 004E6DFF    call        TControl.GetClientHeight
 004E6E04    mov         edx,dword ptr [ebx+288]
 004E6E0A    mov         edx,dword ptr [edx+10]
 004E6E0D    cmp         eax,edx
>004E6E0F    jle         004E6E15
 004E6E11    mov         edi,eax
>004E6E13    jmp         004E6E17
 004E6E15    mov         edi,edx
 004E6E17    push        edi
 004E6E18    lea         eax,[esp+8]
 004E6E1C    push        eax
 004E6E1D    mov         eax,dword ptr [ebx+288]
 004E6E23    mov         edx,dword ptr [eax+0C]
 004E6E26    neg         edx
 004E6E28    mov         eax,dword ptr [ebx+278]
 004E6E2E    mov         eax,dword ptr [eax+0C]
 004E6E31    neg         eax
 004E6E33    mov         ecx,esi
 004E6E35    call        Bounds
 004E6E3A    mov         eax,dword ptr [esp]
 004E6E3D    lea         esi,[esp+4]
 004E6E41    mov         edi,eax
 004E6E43    movs        dword ptr [edi],dword ptr [esi]
 004E6E44    movs        dword ptr [edi],dword ptr [esi]
 004E6E45    movs        dword ptr [edi],dword ptr [esi]
 004E6E46    movs        dword ptr [edi],dword ptr [esi]
 004E6E47    mov         edx,dword ptr [esp]
 004E6E4A    mov         eax,ebx
 004E6E4C    call        TWinControl.AdjustClientRect
 004E6E51    add         esp,14
 004E6E54    pop         edi
 004E6E55    pop         esi
 004E6E56    pop         ebx
 004E6E57    ret
*}
end;

//004E6E58
procedure TScrollingWinControl.CMBiDiModeChanged(var Message:TMessage);
begin
{*
 004E6E58    push        ebp
 004E6E59    mov         ebp,esp
 004E6E5B    add         esp,0FFFFFFF4
 004E6E5E    mov         dword ptr [ebp-8],edx
 004E6E61    mov         dword ptr [ebp-4],eax
 004E6E64    mov         eax,dword ptr [ebp-8]
 004E6E67    mov         eax,dword ptr [eax+4]
 004E6E6A    mov         dword ptr [ebp-0C],eax
 004E6E6D    xor         eax,eax
 004E6E6F    push        ebp
 004E6E70    push        4E6EB9
 004E6E75    push        dword ptr fs:[eax]
 004E6E78    mov         dword ptr fs:[eax],esp
 004E6E7B    mov         eax,dword ptr [ebp-4]
 004E6E7E    mov         edx,dword ptr ds:[784A2C];gvar_00784A2C
 004E6E84    call        @IsClass
 004E6E89    test        al,al
>004E6E8B    jne         004E6E97
 004E6E8D    mov         eax,dword ptr [ebp-8]
 004E6E90    mov         dword ptr [eax+4],1
 004E6E97    mov         edx,dword ptr [ebp-8]
 004E6E9A    mov         eax,dword ptr [ebp-4]
 004E6E9D    call        TWinControl.CMBiDiModeChanged
 004E6EA2    xor         eax,eax
 004E6EA4    pop         edx
 004E6EA5    pop         ecx
 004E6EA6    pop         ecx
 004E6EA7    mov         dword ptr fs:[eax],edx
 004E6EAA    push        4E6EC0
 004E6EAF    mov         eax,dword ptr [ebp-8]
 004E6EB2    mov         edx,dword ptr [ebp-0C]
 004E6EB5    mov         dword ptr [eax+4],edx
 004E6EB8    ret
>004E6EB9    jmp         @HandleFinally
>004E6EBE    jmp         004E6EAF
 004E6EC0    mov         eax,dword ptr [ebp-4]
 004E6EC3    call        TWinControl.HandleAllocated
 004E6EC8    test        al,al
>004E6ECA    je          004E6EE2
 004E6ECC    mov         eax,dword ptr [ebp-4]
 004E6ECF    mov         eax,dword ptr [eax+278]
 004E6ED5    call        TControlScrollBar.ChangeBiDiPosition
 004E6EDA    mov         eax,dword ptr [ebp-4]
 004E6EDD    call        TScrollingWinControl.UpdateScrollBars
 004E6EE2    mov         esp,ebp
 004E6EE4    pop         ebp
 004E6EE5    ret
*}
end;

//004E6EE8
constructor TCustomForm.Create;
begin
{*
 004E6EE8    push        ebp
 004E6EE9    mov         ebp,esp
 004E6EEB    add         esp,0FFFFFFE8
 004E6EEE    push        ebx
 004E6EEF    push        esi
 004E6EF0    xor         ebx,ebx
 004E6EF2    mov         dword ptr [ebp-14],ebx
 004E6EF5    mov         dword ptr [ebp-18],ebx
 004E6EF8    test        dl,dl
>004E6EFA    je          004E6F04
 004E6EFC    add         esp,0FFFFFFF0
 004E6EFF    call        @ClassCreate
 004E6F04    mov         byte ptr [ebp-5],dl
 004E6F07    mov         dword ptr [ebp-4],eax
 004E6F0A    xor         eax,eax
 004E6F0C    push        ebp
 004E6F0D    push        4E7079
 004E6F12    push        dword ptr fs:[eax]
 004E6F15    mov         dword ptr fs:[eax],esp
 004E6F18    xor         edx,edx
 004E6F1A    mov         eax,dword ptr [ebp-4]
 004E6F1D    call        TScrollingWinControl.Create
 004E6F22    mov         eax,[0078DAF0];GlobalNameSpace:IReadWriteSync
 004E6F27    mov         eax,dword ptr [eax]
 004E6F29    mov         edx,dword ptr [eax]
 004E6F2B    call        dword ptr [edx+14]
 004E6F2E    xor         edx,edx
 004E6F30    push        ebp
 004E6F31    push        4E7045
 004E6F36    push        dword ptr fs:[edx]
 004E6F39    mov         dword ptr fs:[edx],esp
 004E6F3C    mov         eax,[007932EC];Application:TApplication
 004E6F41    movzx       eax,byte ptr [eax+0D1]
 004E6F48    mov         edx,dword ptr [ebp-4]
 004E6F4B    mov         byte ptr [edx+370],al
 004E6F51    test        al,al
>004E6F53    je          004E6F61
 004E6F55    mov         eax,[007932EC];Application:TApplication
 004E6F5A    mov         byte ptr [eax+0D1],0
 004E6F61    mov         eax,dword ptr [ebp-4]
 004E6F64    mov         si,0FFA5
 004E6F68    call        @CallDynaInst
 004E6F6D    mov         edx,dword ptr [ebp-4]
 004E6F70    mov         edx,dword ptr [edx]
 004E6F72    mov         eax,edx
 004E6F74    cmp         eax,dword ptr ds:[4E0C38];TForm
>004E6F7A    je          004E702B
 004E6F80    mov         eax,dword ptr [ebp-4]
 004E6F83    test        byte ptr [eax+1C],10
>004E6F87    jne         004E702B
 004E6F8D    mov         eax,dword ptr [ebp-4]
 004E6F90    or          byte ptr [eax+384],1
 004E6F97    xor         eax,eax
 004E6F99    push        ebp
 004E6F9A    push        4E700D
 004E6F9F    push        dword ptr fs:[eax]
 004E6FA2    mov         dword ptr fs:[eax],esp
 004E6FA5    mov         edx,dword ptr ds:[4E0C38];TForm
 004E6FAB    mov         eax,dword ptr [ebp-4]
 004E6FAE    call        InitInheritedComponent
 004E6FB3    test        al,al
>004E6FB5    jne         004E6FF5
 004E6FB7    lea         edx,[ebp-14]
 004E6FBA    mov         eax,dword ptr [ebp-4]
 004E6FBD    mov         eax,dword ptr [eax]
 004E6FBF    call        TObject.ClassName
 004E6FC4    mov         eax,dword ptr [ebp-14]
 004E6FC7    mov         dword ptr [ebp-10],eax
 004E6FCA    mov         byte ptr [ebp-0C],11
 004E6FCE    lea         eax,[ebp-10]
 004E6FD1    push        eax
 004E6FD2    push        0
 004E6FD4    lea         edx,[ebp-18]
 004E6FD7    mov         eax,[0078D2BC];^SResString141:TResStringRec
 004E6FDC    call        LoadResString
 004E6FE1    mov         ecx,dword ptr [ebp-18]
 004E6FE4    mov         dl,1
 004E6FE6    mov         eax,[00438E24];EResNotFound
 004E6FEB    call        Exception.CreateFmt
 004E6FF0    call        @RaiseExcept
 004E6FF5    xor         eax,eax
 004E6FF7    pop         edx
 004E6FF8    pop         ecx
 004E6FF9    pop         ecx
 004E6FFA    mov         dword ptr fs:[eax],edx
 004E6FFD    push        4E7014
 004E7002    mov         eax,dword ptr [ebp-4]
 004E7005    and         byte ptr [eax+384],0FE
 004E700C    ret
>004E700D    jmp         @HandleFinally
>004E7012    jmp         004E7002
 004E7014    mov         eax,dword ptr [ebp-4]
 004E7017    cmp         byte ptr [eax+379],0
>004E701E    je          004E702B
 004E7020    mov         eax,dword ptr [ebp-4]
 004E7023    mov         edx,dword ptr [eax]
 004E7025    call        dword ptr [edx+0FC]
 004E702B    xor         eax,eax
 004E702D    pop         edx
 004E702E    pop         ecx
 004E702F    pop         ecx
 004E7030    mov         dword ptr fs:[eax],edx
 004E7033    push        4E704C
 004E7038    mov         eax,[0078DAF0];GlobalNameSpace:IReadWriteSync
 004E703D    mov         eax,dword ptr [eax]
 004E703F    mov         edx,dword ptr [eax]
 004E7041    call        dword ptr [edx+18]
 004E7044    ret
>004E7045    jmp         @HandleFinally
>004E704A    jmp         004E7038
 004E704C    mov         eax,dword ptr [ebp-4]
 004E704F    mov         eax,dword ptr [eax+50]
 004E7052    or          eax,dword ptr ds:[4E70A4]
 004E7058    mov         edx,dword ptr [ebp-4]
 004E705B    mov         dword ptr [edx+50],eax
 004E705E    xor         eax,eax
 004E7060    pop         edx
 004E7061    pop         ecx
 004E7062    pop         ecx
 004E7063    mov         dword ptr fs:[eax],edx
 004E7066    push        4E7080
 004E706B    lea         eax,[ebp-18]
 004E706E    mov         edx,2
 004E7073    call        @UStrArrayClr
 004E7078    ret
>004E7079    jmp         @HandleFinally
>004E707E    jmp         004E706B
 004E7080    mov         eax,dword ptr [ebp-4]
 004E7083    cmp         byte ptr [ebp-5],0
>004E7087    je          004E7098
 004E7089    call        @AfterConstruction
 004E708E    pop         dword ptr fs:[0]
 004E7095    add         esp,0C
 004E7098    mov         eax,dword ptr [ebp-4]
 004E709B    pop         esi
 004E709C    pop         ebx
 004E709D    mov         esp,ebp
 004E709F    pop         ebp
 004E70A0    ret
*}
end;

//004E70A8
procedure TCustomForm.AfterConstruction;
begin
{*
 004E70A8    push        ebx
 004E70A9    push        esi
 004E70AA    mov         ebx,eax
 004E70AC    cmp         byte ptr [ebx+379],0
>004E70B3    jne         004E70BF
 004E70B5    mov         eax,ebx
 004E70B7    mov         edx,dword ptr [eax]
 004E70B9    call        dword ptr [edx+0FC]
 004E70BF    test        byte ptr [ebx+384],20
>004E70C6    je          004E70DA
 004E70C8    mov         eax,ebx
 004E70CA    mov         si,0FFAF
 004E70CE    call        @CallDynaInst
 004E70D3    and         byte ptr [ebx+384],0DF
 004E70DA    pop         esi
 004E70DB    pop         ebx
 004E70DC    ret
*}
end;

//004E70E0
procedure TCustomForm.InitializeNewForm;
begin
{*
 004E70E0    push        ebx
 004E70E1    push        esi
 004E70E2    mov         ebx,eax
 004E70E4    mov         eax,[004E724C]
 004E70E9    mov         dword ptr [ebx+50],eax
 004E70EC    xor         edx,edx
 004E70EE    mov         eax,ebx
 004E70F0    call        TCustomForm.SetLeft
 004E70F5    xor         edx,edx
 004E70F7    mov         eax,ebx
 004E70F9    call        TCustomForm.SetTop
 004E70FE    mov         edx,140
 004E7103    mov         eax,ebx
 004E7105    call        TControl.SetWidth
 004E710A    mov         edx,0F0
 004E710F    mov         eax,ebx
 004E7111    call        TControl.SetHeight
 004E7116    mov         dl,1
 004E7118    mov         eax,[00464454];TIcon
 004E711D    call        TIcon.Create
 004E7122    mov         esi,eax
 004E7124    mov         dword ptr [ebx+2AC],esi
 004E712A    push        31
 004E712C    call        user32.GetSystemMetrics
 004E7131    mov         edx,eax
 004E7133    mov         eax,esi
 004E7135    mov         ecx,dword ptr [eax]
 004E7137    call        dword ptr [ecx+44]
 004E713A    push        32
 004E713C    call        user32.GetSystemMetrics
 004E7141    mov         edx,eax
 004E7143    mov         eax,dword ptr [ebx+2AC]
 004E7149    mov         ecx,dword ptr [eax]
 004E714B    call        dword ptr [ecx+38]
 004E714E    mov         eax,dword ptr [ebx+2AC]
 004E7154    mov         dword ptr [eax+14],ebx
 004E7157    mov         dword ptr [eax+10],4E7BB8;TCustomForm.IconChanged
 004E715E    mov         byte ptr [ebx+29F],2
 004E7165    mov         dl,1
 004E7167    mov         eax,[00476D34];TControlCanvas
 004E716C    call        TCanvas.Create
 004E7171    mov         esi,eax
 004E7173    mov         dword ptr [ebx+2A4],esi
 004E7179    mov         edx,ebx
 004E717B    mov         eax,esi
 004E717D    call        TControlCanvas.SetControl
 004E7182    movzx       eax,byte ptr ds:[4E7250]
 004E7189    mov         byte ptr [ebx+298],al
 004E718F    mov         byte ptr [ebx+299],2
 004E7196    mov         byte ptr [ebx+29A],0
 004E719D    mov         byte ptr [ebx+2A0],3
 004E71A4    mov         byte ptr [ebx+2B0],0
 004E71AB    mov         eax,[007932F0];Screen:TScreen
 004E71B0    mov         eax,dword ptr [eax+44]
 004E71B3    mov         dword ptr [ebx+2C4],eax
 004E71B9    mov         ecx,ebx
 004E71BB    mov         dl,1
 004E71BD    mov         eax,[004DF478];TGlassFrame
 004E71C2    call        TGlassFrame.Create
 004E71C7    mov         esi,eax
 004E71C9    mov         dword ptr [ebx+374],esi
 004E71CF    mov         dword ptr [esi+24],ebx
 004E71D2    mov         dword ptr [esi+20],4ED98C;TCustomForm.UpdateGlassFrame
 004E71D9    mov         byte ptr [ebx+378],0
 004E71E0    mov         byte ptr [ebx+2A3],1
 004E71E7    mov         edx,dword ptr [ebx]
 004E71E9    mov         eax,edx
 004E71EB    mov         dword ptr [ebx+0A8],eax
 004E71F1    mov         byte ptr [ebx+341],0FF
 004E71F8    xor         eax,eax
 004E71FA    mov         dword ptr [ebx+36C],eax
 004E7200    xor         edx,edx
 004E7202    mov         eax,ebx
 004E7204    call        TCustomForm.SetVisible
 004E7209    xor         edx,edx
 004E720B    mov         eax,ebx
 004E720D    call        TControl.SetParentColor
 004E7212    xor         edx,edx
 004E7214    mov         eax,ebx
 004E7216    call        TControl.SetParentFont
 004E721B    xor         edx,edx
 004E721D    mov         eax,ebx
 004E721F    mov         ecx,dword ptr [eax]
 004E7221    call        dword ptr [ecx+0DC]
 004E7227    mov         dl,1
 004E7229    mov         eax,ebx
 004E722B    call        TWinControl.SetCtl3D
 004E7230    mov         edx,ebx
 004E7232    mov         eax,[007932F0];Screen:TScreen
 004E7237    call        TScreen.AddForm
 004E723C    mov         dword ptr [ebx+364],0A
 004E7246    pop         esi
 004E7247    pop         ebx
 004E7248    ret
*}
end;

//004E7254
constructor TCustomForm.CreateNew(Dummy:Integer);
begin
{*
 004E7254    push        ebp
 004E7255    mov         ebp,esp
 004E7257    push        ebx
 004E7258    push        esi
 004E7259    push        edi
 004E725A    test        dl,dl
>004E725C    je          004E7266
 004E725E    add         esp,0FFFFFFF0
 004E7261    call        @ClassCreate
 004E7266    mov         ebx,edx
 004E7268    mov         edi,eax
 004E726A    xor         edx,edx
 004E726C    mov         eax,edi
 004E726E    call        TScrollingWinControl.Create
 004E7273    mov         eax,edi
 004E7275    mov         si,0FFA5
 004E7279    call        @CallDynaInst
 004E727E    mov         eax,edi
 004E7280    test        bl,bl
>004E7282    je          004E7293
 004E7284    call        @AfterConstruction
 004E7289    pop         dword ptr fs:[0]
 004E7290    add         esp,0C
 004E7293    mov         eax,edi
 004E7295    pop         edi
 004E7296    pop         esi
 004E7297    pop         ebx
 004E7298    pop         ebp
 004E7299    ret         4
*}
end;

//004E729C
procedure TCustomForm.BeforeDestruction;
begin
{*
 004E729C    push        esi
 004E729D    mov         esi,eax
 004E729F    mov         eax,[0078DAF0];GlobalNameSpace:IReadWriteSync
 004E72A4    mov         eax,dword ptr [eax]
 004E72A6    mov         edx,dword ptr [eax]
 004E72A8    call        dword ptr [edx+14]
 004E72AB    mov         eax,esi
 004E72AD    call        TComponent.Destroying
 004E72B2    mov         eax,[007932F0];Screen:TScreen
 004E72B7    mov         eax,dword ptr [eax+78]
 004E72BA    mov         edx,esi
 004E72BC    xor         ecx,ecx
 004E72BE    call        TList.RemoveItem
 004E72C3    xor         edx,edx
 004E72C5    mov         eax,esi
 004E72C7    call        RemoveFixupReferences
 004E72CC    cmp         dword ptr [esi+2CC],0
>004E72D3    je          004E72E0
 004E72D5    mov         eax,dword ptr [esi+2CC]
 004E72DB    mov         edx,dword ptr [eax]
 004E72DD    call        dword ptr [edx+0C]
 004E72E0    cmp         byte ptr [esi+29E],1
>004E72E7    je          004E72F9
 004E72E9    test        byte ptr [esi+384],4
>004E72F0    jne         004E72F9
 004E72F2    mov         eax,esi
 004E72F4    call        TCustomForm.Hide
 004E72F9    cmp         byte ptr [esi+379],0
>004E7300    jne         004E730C
 004E7302    mov         eax,esi
 004E7304    mov         edx,dword ptr [eax]
 004E7306    call        dword ptr [edx+100]
 004E730C    pop         esi
 004E730D    ret
*}
end;

//004E7310
destructor TCustomForm.Destroy();
begin
{*
 004E7310    push        ebp
 004E7311    mov         ebp,esp
 004E7313    add         esp,0FFFFFFF8
 004E7316    call        @BeforeDestruction
 004E731B    mov         byte ptr [ebp-5],dl
 004E731E    mov         dword ptr [ebp-4],eax
 004E7321    mov         edx,dword ptr [ebp-4]
 004E7324    mov         eax,[007932EC];Application:TApplication
 004E7329    call        TApplication.RemovePopupForm
 004E732E    mov         eax,dword ptr [ebp-4]
 004E7331    test        byte ptr [eax+1C],8
>004E7335    jne         004E7343
 004E7337    mov         eax,[0078DAF0];GlobalNameSpace:IReadWriteSync
 004E733C    mov         eax,dword ptr [eax]
 004E733E    mov         edx,dword ptr [eax]
 004E7340    call        dword ptr [edx+14]
 004E7343    xor         ecx,ecx
 004E7345    push        ebp
 004E7346    push        4E7428
 004E734B    push        dword ptr fs:[ecx]
 004E734E    mov         dword ptr fs:[ecx],esp
 004E7351    mov         eax,dword ptr [ebp-4]
 004E7354    cmp         byte ptr [eax+379],0
>004E735B    je          004E7368
 004E735D    mov         eax,dword ptr [ebp-4]
 004E7360    mov         edx,dword ptr [eax]
 004E7362    call        dword ptr [edx+100]
 004E7368    xor         edx,edx
 004E736A    mov         eax,dword ptr [ebp-4]
 004E736D    call        TCustomForm.MergeMenu
 004E7372    mov         eax,dword ptr [ebp-4]
 004E7375    call        TWinControl.HandleAllocated
 004E737A    test        al,al
>004E737C    je          004E7389
 004E737E    mov         eax,dword ptr [ebp-4]
 004E7381    mov         edx,dword ptr [eax]
 004E7383    call        dword ptr [edx+0C4]
 004E7389    mov         edx,dword ptr [ebp-4]
 004E738C    mov         eax,[007932F0];Screen:TScreen
 004E7391    call        TScreen.RemoveForm
 004E7396    mov         eax,dword ptr [ebp-4]
 004E7399    add         eax,2A4
 004E739E    mov         edx,dword ptr [eax]
 004E73A0    xor         ecx,ecx
 004E73A2    mov         dword ptr [eax],ecx
 004E73A4    mov         eax,edx
 004E73A6    call        TObject.Free
 004E73AB    mov         eax,dword ptr [ebp-4]
 004E73AE    add         eax,2AC
 004E73B3    mov         edx,dword ptr [eax]
 004E73B5    xor         ecx,ecx
 004E73B7    mov         dword ptr [eax],ecx
 004E73B9    mov         eax,edx
 004E73BB    call        TObject.Free
 004E73C0    mov         eax,dword ptr [ebp-4]
 004E73C3    add         eax,344
 004E73C8    mov         edx,dword ptr [eax]
 004E73CA    xor         ecx,ecx
 004E73CC    mov         dword ptr [eax],ecx
 004E73CE    mov         eax,edx
 004E73D0    call        TObject.Free
 004E73D5    mov         eax,dword ptr [ebp-4]
 004E73D8    add         eax,350
 004E73DD    mov         edx,dword ptr [eax]
 004E73DF    xor         ecx,ecx
 004E73E1    mov         dword ptr [eax],ecx
 004E73E3    mov         eax,edx
 004E73E5    call        TObject.Free
 004E73EA    mov         eax,dword ptr [ebp-4]
 004E73ED    add         eax,374
 004E73F2    mov         edx,dword ptr [eax]
 004E73F4    xor         ecx,ecx
 004E73F6    mov         dword ptr [eax],ecx
 004E73F8    mov         eax,edx
 004E73FA    call        TObject.Free
 004E73FF    movzx       edx,byte ptr [ebp-5]
 004E7403    and         dl,0FC
 004E7406    mov         eax,dword ptr [ebp-4]
 004E7409    call        TScrollingWinControl.Destroy
 004E740E    xor         eax,eax
 004E7410    pop         edx
 004E7411    pop         ecx
 004E7412    pop         ecx
 004E7413    mov         dword ptr fs:[eax],edx
 004E7416    push        4E742F
 004E741B    mov         eax,[0078DAF0];GlobalNameSpace:IReadWriteSync
 004E7420    mov         eax,dword ptr [eax]
 004E7422    mov         edx,dword ptr [eax]
 004E7424    call        dword ptr [edx+18]
 004E7427    ret
>004E7428    jmp         @HandleFinally
>004E742D    jmp         004E741B
 004E742F    cmp         byte ptr [ebp-5],0
>004E7433    jle         004E743D
 004E7435    mov         eax,dword ptr [ebp-4]
 004E7438    call        @ClassDestroy
 004E743D    pop         ecx
 004E743E    pop         ecx
 004E743F    pop         ebp
 004E7440    ret
*}
end;

//004E7444
procedure TCustomForm.DoCreate;
begin
{*
 004E7444    push        ebp
 004E7445    mov         ebp,esp
 004E7447    push        ecx
 004E7448    push        ebx
 004E7449    push        esi
 004E744A    push        edi
 004E744B    mov         dword ptr [ebp-4],eax
 004E744E    mov         eax,dword ptr [ebp-4]
 004E7451    cmp         word ptr [eax+332],0
>004E7459    je          004E74A4
 004E745B    xor         eax,eax
 004E745D    push        ebp
 004E745E    push        4E7485
 004E7463    push        dword ptr fs:[eax]
 004E7466    mov         dword ptr fs:[eax],esp
 004E7469    mov         ebx,dword ptr [ebp-4]
 004E746C    mov         edx,dword ptr [ebp-4]
 004E746F    mov         eax,dword ptr [ebx+334]
 004E7475    call        dword ptr [ebx+330]
 004E747B    xor         eax,eax
 004E747D    pop         edx
 004E747E    pop         ecx
 004E747F    pop         ecx
 004E7480    mov         dword ptr fs:[eax],edx
>004E7483    jmp         004E74A4
>004E7485    jmp         @HandleAnyException
 004E748A    mov         eax,dword ptr [ebp-4]
 004E748D    mov         si,0FFA6
 004E7491    call        @CallDynaInst
 004E7496    test        al,al
>004E7498    jne         004E749F
 004E749A    call        @RaiseAgain
 004E749F    call        @DoneExcept
 004E74A4    mov         eax,dword ptr [ebp-4]
 004E74A7    test        byte ptr [eax+384],2
>004E74AE    je          004E74BA
 004E74B0    mov         dl,1
 004E74B2    mov         eax,dword ptr [ebp-4]
 004E74B5    call        TCustomForm.SetVisible
 004E74BA    pop         edi
 004E74BB    pop         esi
 004E74BC    pop         ebx
 004E74BD    pop         ecx
 004E74BE    pop         ebp
 004E74BF    ret
*}
end;

//004E74C0
procedure TCustomForm.DoDestroy;
begin
{*
 004E74C0    push        ebp
 004E74C1    mov         ebp,esp
 004E74C3    push        ecx
 004E74C4    push        ebx
 004E74C5    push        esi
 004E74C6    push        edi
 004E74C7    mov         dword ptr [ebp-4],eax
 004E74CA    mov         eax,dword ptr [ebp-4]
 004E74CD    cmp         word ptr [eax+33A],0
>004E74D5    je          004E7518
 004E74D7    xor         eax,eax
 004E74D9    push        ebp
 004E74DA    push        4E7501
 004E74DF    push        dword ptr fs:[eax]
 004E74E2    mov         dword ptr fs:[eax],esp
 004E74E5    mov         ebx,dword ptr [ebp-4]
 004E74E8    mov         edx,dword ptr [ebp-4]
 004E74EB    mov         eax,dword ptr [ebx+33C]
 004E74F1    call        dword ptr [ebx+338]
 004E74F7    xor         eax,eax
 004E74F9    pop         edx
 004E74FA    pop         ecx
 004E74FB    pop         ecx
 004E74FC    mov         dword ptr fs:[eax],edx
>004E74FF    jmp         004E7518
>004E7501    jmp         @HandleAnyException
 004E7506    mov         edx,dword ptr [ebp-4]
 004E7509    mov         eax,[007932EC];Application:TApplication
 004E750E    call        TApplication.HandleException
 004E7513    call        @DoneExcept
 004E7518    pop         edi
 004E7519    pop         esi
 004E751A    pop         ebx
 004E751B    pop         ecx
 004E751C    pop         ebp
 004E751D    ret
*}
end;

//004E7520
procedure TCustomForm.Loaded;
begin
{*
 004E7520    push        ebx
 004E7521    push        esi
 004E7522    push        edi
 004E7523    mov         ebx,eax
 004E7525    mov         eax,ebx
 004E7527    call        TControl.Loaded
 004E752C    cmp         dword ptr [ebx+290],0
>004E7533    je          004E7567
 004E7535    cmp         dword ptr [ebx+34],0
>004E7539    je          004E7541
 004E753B    test        byte ptr [ebx+1C],10
>004E753F    jne         004E7567
 004E7541    mov         edi,dword ptr [ebx+290]
 004E7547    xor         eax,eax
 004E7549    mov         dword ptr [ebx+290],eax
 004E754F    mov         eax,edi
 004E7551    mov         si,0FFB6
 004E7555    call        @CallDynaInst
 004E755A    test        al,al
>004E755C    je          004E7567
 004E755E    mov         edx,edi
 004E7560    mov         eax,ebx
 004E7562    call        TCustomForm.SetActiveControl
 004E7567    cmp         byte ptr [ebx+5B],0
>004E756B    je          004E7586
 004E756D    mov         eax,[007932EC];Application:TApplication
 004E7572    mov         edx,dword ptr [eax+3C]
 004E7575    mov         eax,dword ptr [ebx+64]
 004E7578    mov         ecx,dword ptr [eax]
 004E757A    call        dword ptr [ecx+8]
 004E757D    mov         dl,1
 004E757F    mov         eax,ebx
 004E7581    call        TControl.SetParentFont
 004E7586    mov         eax,dword ptr [ebx+374]
 004E758C    call        TGlassFrame.FrameExtended
 004E7591    test        al,al
>004E7593    je          004E759E
 004E7595    xor         edx,edx
 004E7597    mov         eax,ebx
 004E7599    call        TCustomForm.UpdateGlassFrame
 004E759E    pop         edi
 004E759F    pop         esi
 004E75A0    pop         ebx
 004E75A1    ret
*}
end;

//004E75A4
procedure TCustomForm.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 004E75A4    push        ebx
 004E75A5    push        esi
 004E75A6    push        edi
 004E75A7    mov         ebx,ecx
 004E75A9    mov         esi,edx
 004E75AB    mov         edi,eax
 004E75AD    mov         ecx,ebx
 004E75AF    mov         edx,esi
 004E75B1    mov         eax,edi
 004E75B3    call        TWinControl.Notification
 004E75B8    mov         eax,ebx
 004E75BA    sub         al,1
>004E75BC    jb          004E75C5
>004E75BE    je          004E7608
>004E75C0    jmp         004E76C2
 004E75C5    test        byte ptr [edi+1C],1
>004E75C9    jne         004E76C2
 004E75CF    cmp         dword ptr [edi+2B4],0
>004E75D6    jne         004E76C2
 004E75DC    cmp         edi,dword ptr [esi+4]
>004E75DF    jne         004E76C2
 004E75E5    mov         eax,esi
 004E75E7    mov         edx,dword ptr ds:[4A09B4];TMainMenu
 004E75ED    call        @IsClass
 004E75F2    test        al,al
>004E75F4    je          004E76C2
 004E75FA    mov         edx,esi
 004E75FC    mov         eax,edi
 004E75FE    call        TCustomForm.SetMenu
>004E7603    jmp         004E76C2
 004E7608    cmp         esi,dword ptr [edi+2B4]
>004E760E    jne         004E7619
 004E7610    xor         edx,edx
 004E7612    mov         eax,edi
 004E7614    call        TCustomForm.SetMenu
 004E7619    cmp         esi,dword ptr [edi+2C0]
>004E761F    jne         004E762A
 004E7621    xor         edx,edx
 004E7623    mov         eax,edi
 004E7625    call        TCustomForm.SetWindowMenu
 004E762A    cmp         esi,dword ptr [edi+2C8]
>004E7630    jne         004E763B
 004E7632    xor         edx,edx
 004E7634    mov         eax,edi
 004E7636    call        TCustomForm.SetObjectMenuItem
 004E763B    cmp         esi,dword ptr [edi+34C]
>004E7641    jne         004E764C
 004E7643    xor         edx,edx
 004E7645    mov         eax,edi
 004E7647    call        TCustomForm.set_PopupParent
 004E764C    mov         eax,dword ptr [edi+344]
 004E7652    test        eax,eax
>004E7654    je          004E7677
 004E7656    mov         edx,esi
 004E7658    call        TList.IndexOf
 004E765D    test        eax,eax
>004E765F    jl          004E7677
 004E7661    mov         edx,eax
 004E7663    mov         eax,dword ptr [edi+344]
 004E7669    call        TList.Delete
 004E766E    mov         edx,edi
 004E7670    mov         eax,esi
 004E7672    call        TComponent.RemoveFreeNotification
 004E7677    mov         eax,dword ptr [edi+350]
 004E767D    test        eax,eax
>004E767F    je          004E76A2
 004E7681    mov         edx,esi
 004E7683    call        TList.IndexOf
 004E7688    test        eax,eax
>004E768A    jl          004E76A2
 004E768C    mov         edx,eax
 004E768E    mov         eax,dword ptr [edi+350]
 004E7694    call        TList.Delete
 004E7699    mov         edx,edi
 004E769B    mov         eax,esi
 004E769D    call        TComponent.RemoveFreeNotification
 004E76A2    cmp         esi,dword ptr [edi+358]
>004E76A8    jne         004E76B2
 004E76AA    xor         eax,eax
 004E76AC    mov         dword ptr [edi+358],eax
 004E76B2    cmp         esi,dword ptr [edi+2E0]
>004E76B8    jne         004E76C2
 004E76BA    xor         eax,eax
 004E76BC    mov         dword ptr [edi+2E0],eax
 004E76C2    cmp         dword ptr [edi+2BC],0
>004E76C9    je          004E76DA
 004E76CB    mov         ecx,ebx
 004E76CD    mov         edx,esi
 004E76CF    mov         eax,dword ptr [edi+2BC]
 004E76D5    mov         ebx,dword ptr [eax]
 004E76D7    call        dword ptr [ebx+10]
 004E76DA    pop         edi
 004E76DB    pop         esi
 004E76DC    pop         ebx
 004E76DD    ret
*}
end;

//004E76E0
procedure TCustomForm.ReadState(Reader:TReader);
begin
{*
 004E76E0    push        ebp
 004E76E1    mov         ebp,esp
 004E76E3    push        ecx
 004E76E4    push        ebx
 004E76E5    push        esi
 004E76E6    mov         esi,edx
 004E76E8    mov         dword ptr [ebp-4],eax
 004E76EB    mov         eax,dword ptr [ebp-4]
 004E76EE    call        TWinControl.DisableAlign
 004E76F3    xor         edx,edx
 004E76F5    push        ebp
 004E76F6    push        4E795D
 004E76FB    push        dword ptr fs:[edx]
 004E76FE    mov         dword ptr fs:[edx],esp
 004E7701    mov         eax,dword ptr [ebp-4]
 004E7704    xor         edx,edx
 004E7706    mov         dword ptr [eax+2D0],edx
 004E770C    mov         eax,dword ptr [ebp-4]
 004E770F    xor         edx,edx
 004E7711    mov         dword ptr [eax+2D4],edx
 004E7717    mov         eax,dword ptr [ebp-4]
 004E771A    xor         edx,edx
 004E771C    mov         dword ptr [eax+2D8],edx
 004E7722    xor         ebx,ebx
 004E7724    mov         eax,dword ptr [ebp-4]
 004E7727    mov         eax,dword ptr [eax]
 004E7729    call        TObject.ClassParent
 004E772E    cmp         eax,dword ptr ds:[4E0C38];TForm
>004E7734    jne         004E7748
 004E7736    movzx       eax,byte ptr ds:[790C35];gvar_00790C35
 004E773D    xor         al,1
 004E773F    mov         edx,dword ptr [ebp-4]
 004E7742    mov         byte ptr [edx+379],al
 004E7748    mov         edx,esi
 004E774A    mov         eax,dword ptr [ebp-4]
 004E774D    call        TWinControl.ReadState
 004E7752    mov         eax,dword ptr [ebp-4]
 004E7755    cmp         dword ptr [eax+2C4],0
>004E775C    je          004E78D0
 004E7762    mov         eax,dword ptr [ebp-4]
 004E7765    cmp         dword ptr [eax+2D8],0
>004E776C    jle         004E78D0
 004E7772    mov         eax,dword ptr [ebp-4]
 004E7775    test        byte ptr [eax+88],10
>004E777C    je          004E77C0
 004E777E    mov         eax,dword ptr [ebp-4]
 004E7781    mov         eax,dword ptr [eax+2C4]
 004E7787    mov         edx,dword ptr ds:[7932F0];Screen:TScreen
 004E778D    cmp         eax,dword ptr [edx+44]
>004E7790    je          004E77C0
 004E7792    mov         eax,dword ptr [ebp-4]
 004E7795    mov         eax,dword ptr [eax+2C4]
 004E779B    push        eax
 004E779C    mov         eax,[007932F0];Screen:TScreen
 004E77A1    mov         eax,dword ptr [eax+44]
 004E77A4    push        eax
 004E77A5    mov         eax,dword ptr [ebp-4]
 004E77A8    mov         esi,dword ptr [eax+64]
 004E77AB    mov         eax,dword ptr [esi+10]
 004E77AE    mov         eax,dword ptr [eax+18]
 004E77B1    push        eax
 004E77B2    call        kernel32.MulDiv
 004E77B7    mov         edx,eax
 004E77B9    mov         eax,esi
 004E77BB    call        TFont.SetHeight
 004E77C0    mov         eax,[007932F0];Screen:TScreen
 004E77C5    mov         eax,dword ptr [eax+44]
 004E77C8    mov         edx,dword ptr [ebp-4]
 004E77CB    mov         dword ptr [edx+2C4],eax
 004E77D1    mov         eax,dword ptr [ebp-4]
 004E77D4    call        TCustomForm.GetTextHeight
 004E77D9    mov         esi,eax
 004E77DB    mov         eax,dword ptr [ebp-4]
 004E77DE    mov         eax,dword ptr [eax+2D8]
 004E77E4    cmp         esi,eax
>004E77E6    je          004E78D0
 004E77EC    mov         bl,1
 004E77EE    mov         ecx,eax
 004E77F0    mov         edx,esi
 004E77F2    mov         eax,dword ptr [ebp-4]
 004E77F5    call        TScrollingWinControl.ScaleScrollBars
 004E77FA    mov         eax,dword ptr [ebp-4]
 004E77FD    mov         ecx,dword ptr [eax+2D8]
 004E7803    mov         edx,esi
 004E7805    mov         eax,dword ptr [ebp-4]
 004E7808    call        TControl.ScaleConstraints
 004E780D    mov         eax,dword ptr [ebp-4]
 004E7810    mov         ecx,dword ptr [eax+2D8]
 004E7816    mov         edx,esi
 004E7818    mov         eax,dword ptr [ebp-4]
 004E781B    call        TWinControl.ScaleControls
 004E7820    mov         eax,dword ptr [ebp-4]
 004E7823    test        byte ptr [eax+88],4
>004E782A    je          004E784F
 004E782C    mov         eax,dword ptr [ebp-4]
 004E782F    mov         eax,dword ptr [eax+2D8]
 004E7835    push        eax
 004E7836    push        esi
 004E7837    mov         eax,dword ptr [ebp-4]
 004E783A    mov         eax,dword ptr [eax+2D0]
 004E7840    push        eax
 004E7841    call        kernel32.MulDiv
 004E7846    mov         edx,dword ptr [ebp-4]
 004E7849    mov         dword ptr [edx+2D0],eax
 004E784F    mov         eax,dword ptr [ebp-4]
 004E7852    test        byte ptr [eax+88],8
>004E7859    je          004E787E
 004E785B    mov         eax,dword ptr [ebp-4]
 004E785E    mov         eax,dword ptr [eax+2D8]
 004E7864    push        eax
 004E7865    push        esi
 004E7866    mov         eax,dword ptr [ebp-4]
 004E7869    mov         eax,dword ptr [eax+2D4]
 004E786F    push        eax
 004E7870    call        kernel32.MulDiv
 004E7875    mov         edx,dword ptr [ebp-4]
 004E7878    mov         dword ptr [edx+2D4],eax
 004E787E    mov         eax,dword ptr [ebp-4]
 004E7881    test        byte ptr [eax+88],20
>004E7888    je          004E78D0
 004E788A    mov         eax,dword ptr [ebp-4]
 004E788D    mov         eax,dword ptr [eax+2D8]
 004E7893    push        eax
 004E7894    push        esi
 004E7895    mov         eax,dword ptr [ebp-4]
 004E7898    mov         eax,dword ptr [eax+264]
 004E789E    push        eax
 004E789F    call        kernel32.MulDiv
 004E78A4    mov         edx,dword ptr [ebp-4]
 004E78A7    mov         dword ptr [edx+264],eax
 004E78AD    mov         eax,dword ptr [ebp-4]
 004E78B0    mov         eax,dword ptr [eax+2D8]
 004E78B6    push        eax
 004E78B7    push        esi
 004E78B8    mov         eax,dword ptr [ebp-4]
 004E78BB    mov         eax,dword ptr [eax+268]
 004E78C1    push        eax
 004E78C2    call        kernel32.MulDiv
 004E78C7    mov         edx,dword ptr [ebp-4]
 004E78CA    mov         dword ptr [edx+268],eax
 004E78D0    mov         eax,dword ptr [ebp-4]
 004E78D3    mov         eax,dword ptr [eax+2D0]
 004E78D9    test        eax,eax
>004E78DB    jle         004E78E7
 004E78DD    mov         edx,eax
 004E78DF    mov         eax,dword ptr [ebp-4]
 004E78E2    call        TControl.SetClientWidth
 004E78E7    mov         eax,dword ptr [ebp-4]
 004E78EA    mov         eax,dword ptr [eax+2D4]
 004E78F0    test        eax,eax
>004E78F2    jle         004E78FE
 004E78F4    mov         edx,eax
 004E78F6    mov         eax,dword ptr [ebp-4]
 004E78F9    call        TControl.SetClientHeight
 004E78FE    mov         eax,dword ptr [ebp-4]
 004E7901    movzx       edx,byte ptr ds:[4E796C]
 004E7908    mov         byte ptr [eax+88],dl
 004E790E    test        bl,bl
>004E7910    jne         004E7936
 004E7912    mov         ecx,1
 004E7917    mov         edx,1
 004E791C    mov         eax,dword ptr [ebp-4]
 004E791F    call        TScrollingWinControl.ScaleScrollBars
 004E7924    mov         ecx,1
 004E7929    mov         edx,1
 004E792E    mov         eax,dword ptr [ebp-4]
 004E7931    call        TWinControl.ScaleControls
 004E7936    push        0
 004E7938    xor         ecx,ecx
 004E793A    mov         edx,0B03D
 004E793F    mov         eax,dword ptr [ebp-4]
 004E7942    call        TControl.Perform
 004E7947    xor         eax,eax
 004E7949    pop         edx
 004E794A    pop         ecx
 004E794B    pop         ecx
 004E794C    mov         dword ptr fs:[eax],edx
 004E794F    push        4E7964
 004E7954    mov         eax,dword ptr [ebp-4]
 004E7957    call        TWinControl.EnableAlign
 004E795C    ret
>004E795D    jmp         @HandleFinally
>004E7962    jmp         004E7954
 004E7964    pop         esi
 004E7965    pop         ebx
 004E7966    pop         ecx
 004E7967    pop         ebp
 004E7968    ret
*}
end;

//004E7970
procedure TCustomForm.DefineProperties(Filer:TFiler);
begin
{*
 004E7970    push        ebx
 004E7971    push        esi
 004E7972    push        edi
 004E7973    mov         esi,edx
 004E7975    mov         ebx,eax
 004E7977    mov         edx,esi
 004E7979    mov         eax,ebx
 004E797B    call        TWinControl.DefineProperties
 004E7980    push        0
 004E7982    push        0
 004E7984    push        ebx
 004E7985    push        4E7AAC;TCustomForm.WritePixelsPerInch
 004E798A    movzx       ecx,byte ptr [ebx+60]
 004E798E    xor         cl,1
 004E7991    mov         edx,4E79E4;'PixelsPerInch'
 004E7996    mov         eax,esi
 004E7998    mov         edi,dword ptr [eax]
 004E799A    call        dword ptr [edi+4]
 004E799D    push        ebx
 004E799E    push        4E7A78;TCustomForm.ReadTextHeight
 004E79A3    push        ebx
 004E79A4    push        4E7A90;TCustomForm.WriteTextHeight
 004E79A9    movzx       ecx,byte ptr [ebx+60]
 004E79AD    xor         cl,1
 004E79B0    mov         edx,4E7A0C;'TextHeight'
 004E79B5    mov         eax,esi
 004E79B7    mov         edi,dword ptr [eax]
 004E79B9    call        dword ptr [edi+4]
 004E79BC    push        ebx
 004E79BD    push        4E7A58;TCustomForm.ReadIgnoreFontProperty
 004E79C2    push        0
 004E79C4    push        0
 004E79C6    xor         ecx,ecx
 004E79C8    mov         edx,4E7A30;'IgnoreFontProperty'
 004E79CD    mov         eax,esi
 004E79CF    mov         ebx,dword ptr [eax]
 004E79D1    call        dword ptr [ebx+4]
 004E79D4    pop         edi
 004E79D5    pop         esi
 004E79D6    pop         ebx
 004E79D7    ret
*}
end;

//004E7A58
procedure TCustomForm.ReadIgnoreFontProperty(Reader:TReader);
begin
{*
 004E7A58    push        ebx
 004E7A59    push        esi
 004E7A5A    mov         esi,edx
 004E7A5C    mov         ebx,eax
 004E7A5E    mov         eax,esi
 004E7A60    call        TReader.ReadBoolean
 004E7A65    test        al,al
>004E7A67    je          004E7A72
 004E7A69    mov         dl,1
 004E7A6B    mov         eax,ebx
 004E7A6D    call        TControl.SetParentFont
 004E7A72    pop         esi
 004E7A73    pop         ebx
 004E7A74    ret
*}
end;

//004E7A78
procedure TCustomForm.ReadTextHeight(Reader:TReader);
begin
{*
 004E7A78    push        ebx
 004E7A79    push        esi
 004E7A7A    mov         esi,edx
 004E7A7C    mov         ebx,eax
 004E7A7E    mov         eax,esi
 004E7A80    call        TReader.ReadInteger
 004E7A85    mov         dword ptr [ebx+2D8],eax
 004E7A8B    pop         esi
 004E7A8C    pop         ebx
 004E7A8D    ret
*}
end;

//004E7A90
procedure TCustomForm.WriteTextHeight(Writer:TWriter);
begin
{*
 004E7A90    push        ebx
 004E7A91    push        esi
 004E7A92    mov         esi,edx
 004E7A94    mov         ebx,eax
 004E7A96    mov         eax,ebx
 004E7A98    call        TCustomForm.GetTextHeight
 004E7A9D    mov         edx,eax
 004E7A9F    mov         eax,esi
 004E7AA1    call        TWriter.WriteInteger
 004E7AA6    pop         esi
 004E7AA7    pop         ebx
 004E7AA8    ret
*}
end;

//004E7AAC
procedure TCustomForm.WritePixelsPerInch(Writer:TWriter);
begin
{*
 004E7AAC    push        ebx
 004E7AAD    push        esi
 004E7AAE    mov         esi,edx
 004E7AB0    mov         ebx,eax
 004E7AB2    mov         eax,ebx
 004E7AB4    call        TCustomForm.GetPixelsPerInch
 004E7AB9    mov         edx,eax
 004E7ABB    mov         eax,esi
 004E7ABD    call        TWriter.WriteInteger
 004E7AC2    pop         esi
 004E7AC3    pop         ebx
 004E7AC4    ret
*}
end;

//004E7AC8
function TCustomForm.GetLeft:Integer;
begin
{*
 004E7AC8    test        byte ptr [eax+1C],10
>004E7ACC    je          004E7AE3
 004E7ACE    cmp         dword ptr [eax+34],0
>004E7AD2    je          004E7AE3
 004E7AD4    mov         eax,dword ptr [eax+18]
 004E7AD7    and         eax,0FFFF0000
 004E7ADC    shr         eax,10
 004E7ADF    movsx       eax,ax
 004E7AE2    ret
 004E7AE3    mov         eax,dword ptr [eax+40]
 004E7AE6    ret
*}
end;

//004E7AE8
function TCustomForm.GetTop:Integer;
begin
{*
 004E7AE8    test        byte ptr [eax+1C],10
>004E7AEC    je          004E7B00
 004E7AEE    cmp         dword ptr [eax+34],0
>004E7AF2    je          004E7B00
 004E7AF4    movzx       eax,word ptr [eax+18]
 004E7AF8    and         ax,0FFFFFFFF
 004E7AFC    movsx       eax,ax
 004E7AFF    ret
 004E7B00    mov         eax,dword ptr [eax+44]
 004E7B03    ret
*}
end;

//004E7B04
function TCustomForm.GetTextHeight:Integer;
begin
{*
 004E7B04    push        ebx
 004E7B05    mov         ebx,eax
 004E7B07    mov         eax,ebx
 004E7B09    call        TCustomForm.GetCanvas
 004E7B0E    mov         edx,4E7B28;'0'
 004E7B13    call        TCustomCanvas.TextHeight
 004E7B18    pop         ebx
 004E7B19    ret
*}
end;

//004E7B2C
procedure TCustomForm.BeginAutoDrag;
begin
{*
 004E7B2C    ret
*}
end;

//004E7B30
procedure TCustomForm.ChangeScale(M:Integer; D:Integer);
begin
{*
 004E7B30    push        ebx
 004E7B31    push        esi
 004E7B32    push        edi
 004E7B33    push        ebp
 004E7B34    mov         edi,ecx
 004E7B36    mov         esi,edx
 004E7B38    mov         ebx,eax
 004E7B3A    mov         ecx,edi
 004E7B3C    mov         edx,esi
 004E7B3E    mov         eax,ebx
 004E7B40    call        TScrollingWinControl.ScaleScrollBars
 004E7B45    mov         ecx,edi
 004E7B47    mov         edx,esi
 004E7B49    mov         eax,ebx
 004E7B4B    call        TWinControl.ScaleControls
 004E7B50    mov         eax,ebx
 004E7B52    call        TCustomForm.IsClientSizeStored
 004E7B57    test        al,al
>004E7B59    je          004E7B8D
 004E7B5B    mov         eax,ebx
 004E7B5D    call        TControl.GetClientHeight
 004E7B62    mov         ebp,eax
 004E7B64    push        edi
 004E7B65    push        esi
 004E7B66    mov         eax,ebx
 004E7B68    call        TControl.GetClientWidth
 004E7B6D    push        eax
 004E7B6E    call        kernel32.MulDiv
 004E7B73    mov         edx,eax
 004E7B75    mov         eax,ebx
 004E7B77    call        TCustomForm.SetClientWidth
 004E7B7C    push        edi
 004E7B7D    push        esi
 004E7B7E    push        ebp
 004E7B7F    call        kernel32.MulDiv
 004E7B84    mov         edx,eax
 004E7B86    mov         eax,ebx
 004E7B88    call        TCustomForm.SetClientHeight
 004E7B8D    push        edi
 004E7B8E    push        esi
 004E7B8F    mov         ebp,dword ptr [ebx+64]
 004E7B92    mov         eax,ebp
 004E7B94    call        TFont.GetSize
 004E7B99    push        eax
 004E7B9A    call        kernel32.MulDiv
 004E7B9F    mov         edx,eax
 004E7BA1    mov         eax,ebp
 004E7BA3    call        TFont.SetSize
 004E7BA8    mov         ecx,edi
 004E7BAA    mov         edx,esi
 004E7BAC    mov         eax,ebx
 004E7BAE    call        TControl.ScaleConstraints
 004E7BB3    pop         ebp
 004E7BB4    pop         edi
 004E7BB5    pop         esi
 004E7BB6    pop         ebx
 004E7BB7    ret
*}
end;

//004E7BB8
procedure TCustomForm.IconChanged(Sender:TObject);
begin
{*
 004E7BB8    push        ebx
 004E7BB9    mov         ebx,eax
 004E7BBB    mov         eax,[0078D264];^NewStyleControls:Boolean
 004E7BC0    cmp         byte ptr [eax],0
>004E7BC3    je          004E7BF7
 004E7BC5    mov         eax,ebx
 004E7BC7    call        TWinControl.HandleAllocated
 004E7BCC    test        al,al
>004E7BCE    je          004E7C11
 004E7BD0    cmp         byte ptr [ebx+299],3
>004E7BD7    je          004E7C11
 004E7BD9    mov         eax,ebx
 004E7BDB    call        TCustomForm.GetIconHandle
 004E7BE0    push        eax
 004E7BE1    push        1
 004E7BE3    push        80
 004E7BE8    mov         eax,ebx
 004E7BEA    call        TWinControl.GetHandle
 004E7BEF    push        eax
 004E7BF0    call        user32.SendMessageW
 004E7BF5    pop         ebx
 004E7BF6    ret
 004E7BF7    mov         eax,ebx
 004E7BF9    call        TWinControl.GetHandle
 004E7BFE    call        IsIconic
 004E7C03    test        eax,eax
>004E7C05    je          004E7C11
 004E7C07    mov         eax,ebx
 004E7C09    mov         edx,dword ptr [eax]
 004E7C0B    call        dword ptr [edx+90]
 004E7C11    pop         ebx
 004E7C12    ret
*}
end;

//004E7C14
function TCustomForm.IsClientSizeStored(Value:Integer):Boolean;
begin
{*
 004E7C14    push        ebx
 004E7C15    mov         ebx,eax
 004E7C17    mov         eax,ebx
 004E7C19    call        TCustomForm.IsFormSizeStored
 004E7C1E    xor         al,1
 004E7C20    pop         ebx
 004E7C21    ret
*}
end;

//004E7C24
function TCustomForm.IsFormSizeStored(Value:Integer):Boolean;
begin
{*
 004E7C24    cmp         byte ptr [eax+274],0
>004E7C2B    jne         004E7C48
 004E7C2D    mov         edx,dword ptr [eax+278]
 004E7C33    cmp         dword ptr [edx+10],0
>004E7C37    jne         004E7C48
 004E7C39    mov         eax,dword ptr [eax+288]
 004E7C3F    cmp         dword ptr [eax+10],0
>004E7C43    jne         004E7C48
 004E7C45    xor         eax,eax
 004E7C47    ret
 004E7C48    mov         al,1
 004E7C4A    ret
*}
end;

//004E7C4C
function TCustomForm.IsAutoScrollStored(Value:Boolean):Boolean;
begin
{*
 004E7C4C    push        ebx
 004E7C4D    mov         ebx,eax
 004E7C4F    mov         eax,ebx
 004E7C51    call        TCustomForm.IsForm
 004E7C56    test        al,al
>004E7C58    je          004E7C77
 004E7C5A    movzx       eax,byte ptr [ebx+299]
 004E7C61    sub         al,2
>004E7C63    je          004E7C6D
 004E7C65    sub         al,3
>004E7C67    je          004E7C6D
 004E7C69    xor         eax,eax
>004E7C6B    jmp         004E7C6F
 004E7C6D    mov         al,1
 004E7C6F    cmp         al,byte ptr [ebx+274]
>004E7C75    je          004E7C7B
 004E7C77    xor         eax,eax
 004E7C79    pop         ebx
 004E7C7A    ret
 004E7C7B    mov         al,1
 004E7C7D    pop         ebx
 004E7C7E    ret
*}
end;

//004E7C80
procedure TCustomForm.DoClose(var Action:TCloseAction);
begin
{*
 004E7C80    push        ebx
 004E7C81    cmp         word ptr [eax+2F2],0
>004E7C89    je          004E7C9D
 004E7C8B    mov         ecx,edx
 004E7C8D    mov         ebx,eax
 004E7C8F    mov         edx,eax
 004E7C91    mov         eax,dword ptr [ebx+2F4]
 004E7C97    call        dword ptr [ebx+2F0]
 004E7C9D    pop         ebx
 004E7C9E    ret
*}
end;

//004E7CA0
procedure TCustomForm.DoHide;
begin
{*
 004E7CA0    push        ebx
 004E7CA1    cmp         word ptr [eax+312],0
>004E7CA9    je          004E7CBB
 004E7CAB    mov         ebx,eax
 004E7CAD    mov         edx,eax
 004E7CAF    mov         eax,dword ptr [ebx+314]
 004E7CB5    call        dword ptr [ebx+310]
 004E7CBB    pop         ebx
 004E7CBC    ret
*}
end;

//004E7CC0
procedure TCustomForm.DoShow;
begin
{*
 004E7CC0    push        ebx
 004E7CC1    cmp         word ptr [eax+32A],0
>004E7CC9    je          004E7CDB
 004E7CCB    mov         ebx,eax
 004E7CCD    mov         edx,eax
 004E7CCF    mov         eax,dword ptr [ebx+32C]
 004E7CD5    call        dword ptr [ebx+328]
 004E7CDB    pop         ebx
 004E7CDC    ret
*}
end;

//004E7CE0
function TCustomForm.GetClientRect:TRect;
begin
{*
 004E7CE0    push        ebx
 004E7CE1    push        esi
 004E7CE2    mov         esi,edx
 004E7CE4    mov         ebx,eax
 004E7CE6    mov         eax,ebx
 004E7CE8    call        TWinControl.GetHandle
 004E7CED    call        IsIconic
 004E7CF2    test        eax,eax
>004E7CF4    je          004E7D59
 004E7CF6    push        0
 004E7CF8    push        0
 004E7CFA    push        0
 004E7CFC    push        0
 004E7CFE    push        esi
 004E7CFF    call        user32.SetRect
 004E7D04    push        0EC
 004E7D06    mov         eax,ebx
 004E7D08    call        TWinControl.GetHandle
 004E7D0D    push        eax
 004E7D0E    call        user32.GetWindowLongW
 004E7D13    push        eax
 004E7D14    cmp         dword ptr [ebx+2B4],0
 004E7D1B    setne       al
 004E7D1E    neg         al
 004E7D20    sbb         eax,eax
 004E7D22    push        eax
 004E7D23    push        0F0
 004E7D25    mov         eax,ebx
 004E7D27    call        TWinControl.GetHandle
 004E7D2C    push        eax
 004E7D2D    call        user32.GetWindowLongW
 004E7D32    push        eax
 004E7D33    push        esi
 004E7D34    call        user32.AdjustWindowRectEx
 004E7D39    mov         eax,dword ptr [ebx+4C]
 004E7D3C    sub         eax,dword ptr [esi+0C]
 004E7D3F    add         eax,dword ptr [esi+4]
 004E7D42    push        eax
 004E7D43    mov         eax,dword ptr [ebx+48]
 004E7D46    sub         eax,dword ptr [esi+8]
 004E7D49    add         eax,dword ptr [esi]
 004E7D4B    push        eax
 004E7D4C    push        0
 004E7D4E    push        0
 004E7D50    push        esi
 004E7D51    call        user32.SetRect
 004E7D56    pop         esi
 004E7D57    pop         ebx
 004E7D58    ret
 004E7D59    mov         edx,esi
 004E7D5B    mov         eax,ebx
 004E7D5D    call        TWinControl.GetClientRect
 004E7D62    pop         esi
 004E7D63    pop         ebx
 004E7D64    ret
*}
end;

//004E7D68
procedure TCustomForm.GetChildren(Root:TComponent; Proc:TGetChildProc);
begin
{*
 004E7D68    push        ebp
 004E7D69    mov         ebp,esp
 004E7D6B    add         esp,0FFFFFFF8
 004E7D6E    push        ebx
 004E7D6F    push        esi
 004E7D70    push        edi
 004E7D71    mov         esi,edx
 004E7D73    mov         ebx,eax
 004E7D75    push        dword ptr [ebp+0C]
 004E7D78    push        dword ptr [ebp+8]
 004E7D7B    mov         edx,esi
 004E7D7D    mov         eax,ebx
 004E7D7F    call        TWinControl.GetChildren
 004E7D84    cmp         ebx,esi
>004E7D86    jne         004E7DCA
 004E7D88    mov         eax,ebx
 004E7D8A    call        TComponent.GetComponentCount
 004E7D8F    dec         eax
 004E7D90    test        eax,eax
>004E7D92    jl          004E7DCA
 004E7D94    inc         eax
 004E7D95    mov         dword ptr [ebp-8],eax
 004E7D98    mov         dword ptr [ebp-4],0
 004E7D9F    mov         edx,dword ptr [ebp-4]
 004E7DA2    mov         eax,ebx
 004E7DA4    call        TComponent.GetComponent
 004E7DA9    mov         edi,eax
 004E7DAB    mov         eax,edi
 004E7DAD    mov         si,0FFF1
 004E7DB1    call        @CallDynaInst
 004E7DB6    test        al,al
>004E7DB8    jne         004E7DC2
 004E7DBA    mov         edx,edi
 004E7DBC    mov         eax,dword ptr [ebp+0C]
 004E7DBF    call        dword ptr [ebp+8]
 004E7DC2    inc         dword ptr [ebp-4]
 004E7DC5    dec         dword ptr [ebp-8]
>004E7DC8    jne         004E7D9F
 004E7DCA    pop         edi
 004E7DCB    pop         esi
 004E7DCC    pop         ebx
 004E7DCD    pop         ecx
 004E7DCE    pop         ecx
 004E7DCF    pop         ebp
 004E7DD0    ret         8
*}
end;

//004E7DD4
procedure TCustomForm.GetOwnerWindow;
begin
{*
 004E7DD4    mov         edx,dword ptr [eax+258]
 004E7DDA    test        edx,edx
>004E7DDC    je          004E7DE7
 004E7DDE    push        4
 004E7DE0    push        edx
 004E7DE1    call        user32.GetWindow
 004E7DE6    ret
 004E7DE7    xor         eax,eax
 004E7DE9    ret
*}
end;

//004E7DEC
function TCustomForm.GetFloating:Boolean;
begin
{*
 004E7DEC    push        ebx
 004E7DED    mov         ebx,eax
 004E7DEF    cmp         dword ptr [ebx+90],0
>004E7DF6    jne         004E7E0A
 004E7DF8    mov         eax,ebx
 004E7DFA    mov         edx,dword ptr [eax]
 004E7DFC    call        dword ptr [edx+64]
 004E7DFF    mov         ecx,dword ptr [ebx]
 004E7E01    mov         edx,ecx
 004E7E03    cmp         edx,eax
 004E7E05    sete        al
 004E7E08    pop         ebx
 004E7E09    ret
 004E7E0A    xor         eax,eax
 004E7E0C    pop         ebx
 004E7E0D    ret
*}
end;

//004E7E10
procedure TCustomForm.SetChildOrder(Child:TComponent; Order:Integer);
begin
{*
 004E7E10    push        ebx
 004E7E11    push        esi
 004E7E12    push        edi
 004E7E13    push        ebp
 004E7E14    add         esp,0FFFFFFF4
 004E7E17    mov         dword ptr [esp+4],ecx
 004E7E1B    mov         dword ptr [esp],edx
 004E7E1E    mov         ebp,eax
 004E7E20    mov         eax,dword ptr [esp]
 004E7E23    mov         edx,dword ptr ds:[47A16C];TControl
 004E7E29    call        @IsClass
 004E7E2E    test        al,al
>004E7E30    je          004E7E42
 004E7E32    mov         ecx,dword ptr [esp+4]
 004E7E36    mov         edx,dword ptr [esp]
 004E7E39    mov         eax,ebp
 004E7E3B    call        TWinControl.SetChildOrder
>004E7E40    jmp         004E7E9A
 004E7E42    mov         eax,ebp
 004E7E44    call        TWinControl.GetControlCount
 004E7E49    sub         dword ptr [esp+4],eax
 004E7E4D    mov         dword ptr [esp+8],0FFFFFFFF
 004E7E55    mov         eax,ebp
 004E7E57    call        TComponent.GetComponentCount
 004E7E5C    mov         ebx,eax
 004E7E5E    dec         ebx
 004E7E5F    test        ebx,ebx
>004E7E61    jl          004E7E9A
 004E7E63    inc         ebx
 004E7E64    xor         edi,edi
 004E7E66    mov         edx,edi
 004E7E68    mov         eax,ebp
 004E7E6A    call        TComponent.GetComponent
 004E7E6F    mov         si,0FFF1
 004E7E73    call        @CallDynaInst
 004E7E78    test        al,al
>004E7E7A    jne         004E7E96
 004E7E7C    inc         dword ptr [esp+8]
 004E7E80    mov         eax,dword ptr [esp+8]
 004E7E84    cmp         eax,dword ptr [esp+4]
>004E7E88    jne         004E7E96
 004E7E8A    mov         edx,edi
 004E7E8C    mov         eax,dword ptr [esp]
 004E7E8F    call        TComponent.SetComponentIndex
>004E7E94    jmp         004E7E9A
 004E7E96    inc         edi
 004E7E97    dec         ebx
>004E7E98    jne         004E7E66
 004E7E9A    add         esp,0C
 004E7E9D    pop         ebp
 004E7E9E    pop         edi
 004E7E9F    pop         esi
 004E7EA0    pop         ebx
 004E7EA1    ret
*}
end;

//004E7EA4
procedure TCustomForm.SetParentBiDiMode(Value:Boolean);
begin
{*
 004E7EA4    push        ebx
 004E7EA5    mov         ebx,eax
 004E7EA7    cmp         dl,byte ptr [ebx+62]
>004E7EAA    je          004E7EC9
 004E7EAC    mov         eax,ebx
 004E7EAE    call        TControl.SetParentBiDiMode
 004E7EB3    cmp         dword ptr [ebx+34],0
>004E7EB7    jne         004E7EC9
 004E7EB9    push        0
 004E7EBB    xor         ecx,ecx
 004E7EBD    mov         edx,0B03D
 004E7EC2    mov         eax,ebx
 004E7EC4    call        TControl.Perform
 004E7EC9    pop         ebx
 004E7ECA    ret
*}
end;

//004E7ECC
procedure TCustomForm.SetClientWidth(Value:Integer);
begin
{*
 004E7ECC    push        ebx
 004E7ECD    mov         ebx,eax
 004E7ECF    test        byte ptr [ebx+54],8
>004E7ED3    je          004E7EF0
 004E7ED5    mov         dword ptr [ebx+2D0],edx
 004E7EDB    movzx       eax,byte ptr ds:[4E7EFC]
 004E7EE2    or          al,byte ptr [ebx+88]
 004E7EE8    mov         byte ptr [ebx+88],al
 004E7EEE    pop         ebx
 004E7EEF    ret
 004E7EF0    mov         eax,ebx
 004E7EF2    call        TControl.SetClientWidth
 004E7EF7    pop         ebx
 004E7EF8    ret
*}
end;

//004E7F00
procedure TCustomForm.SetClientHeight(Value:Integer);
begin
{*
 004E7F00    push        ebx
 004E7F01    mov         ebx,eax
 004E7F03    test        byte ptr [ebx+54],8
>004E7F07    je          004E7F24
 004E7F09    mov         dword ptr [ebx+2D4],edx
 004E7F0F    movzx       eax,byte ptr ds:[4E7F30]
 004E7F16    or          al,byte ptr [ebx+88]
 004E7F1C    mov         byte ptr [ebx+88],al
 004E7F22    pop         ebx
 004E7F23    ret
 004E7F24    mov         eax,ebx
 004E7F26    call        TControl.SetClientHeight
 004E7F2B    pop         ebx
 004E7F2C    ret
*}
end;

//004E7F34
procedure TCustomForm.SetVisible(Value:Boolean);
begin
{*
 004E7F34    push        ebx
 004E7F35    push        esi
 004E7F36    mov         ebx,edx
 004E7F38    mov         esi,eax
 004E7F3A    test        byte ptr [esi+384],1
>004E7F41    je          004E7F5A
 004E7F43    test        bl,bl
>004E7F45    je          004E7F50
 004E7F47    or          byte ptr [esi+384],2
>004E7F4E    jmp         004E7F73
 004E7F50    and         byte ptr [esi+384],0FD
 004E7F57    pop         esi
 004E7F58    pop         ebx
 004E7F59    ret
 004E7F5A    test        bl,bl
>004E7F5C    je          004E7F6A
 004E7F5E    cmp         bl,byte ptr [esi+59]
>004E7F61    je          004E7F6A
 004E7F63    mov         eax,esi
 004E7F65    call        TCustomForm.SetWindowToMonitor
 004E7F6A    mov         edx,ebx
 004E7F6C    mov         eax,esi
 004E7F6E    call        TControl.SetVisible
 004E7F73    pop         esi
 004E7F74    pop         ebx
 004E7F75    ret
*}
end;

//004E7F78
procedure TCustomForm.VisibleChanging;
begin
{*
 004E7F78    push        ebp
 004E7F79    mov         ebp,esp
 004E7F7B    push        0
 004E7F7D    xor         edx,edx
 004E7F7F    push        ebp
 004E7F80    push        4E7FD7
 004E7F85    push        dword ptr fs:[edx]
 004E7F88    mov         dword ptr fs:[edx],esp
 004E7F8B    cmp         byte ptr [eax+29E],1
>004E7F92    jne         004E7FC1
 004E7F94    cmp         byte ptr [eax+59],0
>004E7F98    je          004E7FC1
 004E7F9A    cmp         dword ptr [eax+34],0
>004E7F9E    jne         004E7FC1
 004E7FA0    lea         edx,[ebp-4]
 004E7FA3    mov         eax,[0078CCE8];^SResString203:TResStringRec
 004E7FA8    call        LoadResString
 004E7FAD    mov         ecx,dword ptr [ebp-4]
 004E7FB0    mov         dl,1
 004E7FB2    mov         eax,[00439268];EInvalidOperation
 004E7FB7    call        Exception.Create
 004E7FBC    call        @RaiseExcept
 004E7FC1    xor         eax,eax
 004E7FC3    pop         edx
 004E7FC4    pop         ecx
 004E7FC5    pop         ecx
 004E7FC6    mov         dword ptr fs:[eax],edx
 004E7FC9    push        4E7FDE
 004E7FCE    lea         eax,[ebp-4]
 004E7FD1    call        @UStrClr
 004E7FD6    ret
>004E7FD7    jmp         @HandleFinally
>004E7FDC    jmp         004E7FCE
 004E7FDE    pop         ecx
 004E7FDF    pop         ebp
 004E7FE0    ret
*}
end;

//004E7FE4
function TCustomForm.WantChildKey(Child:TControl; var Message:TMessage):Boolean;
begin
{*
 004E7FE4    xor         eax,eax
 004E7FE6    ret
*}
end;

//004E7FE8
procedure TCustomForm.SetParent(AParent:TWinControl);
begin
{*
 004E7FE8    push        ebp
 004E7FE9    mov         ebp,esp
 004E7FEB    add         esp,0FFFFFFF8
 004E7FEE    push        ebx
 004E7FEF    mov         ebx,edx
 004E7FF1    mov         dword ptr [ebp-4],eax
 004E7FF4    mov         eax,dword ptr [ebp-4]
 004E7FF7    mov         eax,dword ptr [eax+34]
 004E7FFA    cmp         ebx,eax
>004E7FFC    je          004E809F
 004E8002    cmp         ebx,dword ptr [ebp-4]
>004E8005    je          004E809F
 004E800B    test        eax,eax
 004E800D    sete        byte ptr [ebp-5]
 004E8011    cmp         byte ptr [ebp-5],0
>004E8015    je          004E8021
 004E8017    mov         dl,1
 004E8019    mov         eax,dword ptr [ebp-4]
 004E801C    call        TWinControl.UpdateRecreatingFlag
 004E8021    xor         eax,eax
 004E8023    push        ebp
 004E8024    push        4E8098
 004E8029    push        dword ptr fs:[eax]
 004E802C    mov         dword ptr fs:[eax],esp
 004E802F    cmp         byte ptr [ebp-5],0
>004E8033    je          004E8040
 004E8035    mov         eax,dword ptr [ebp-4]
 004E8038    mov         edx,dword ptr [eax]
 004E803A    call        dword ptr [edx+0C0]
 004E8040    mov         eax,dword ptr [ebp-4]
 004E8043    test        byte ptr [eax+1C],10
>004E8047    jne         004E8054
 004E8049    mov         eax,dword ptr [ebp-4]
 004E804C    xor         edx,edx
 004E804E    mov         dword ptr [eax+290],edx
 004E8054    mov         eax,dword ptr [ebp-4]
 004E8057    xor         edx,edx
 004E8059    mov         dword ptr [eax+294],edx
 004E805F    mov         edx,ebx
 004E8061    mov         eax,dword ptr [ebp-4]
 004E8064    call        TWinControl.SetParent
 004E8069    mov         eax,dword ptr [ebp-4]
 004E806C    cmp         dword ptr [eax+34],0
>004E8070    jne         004E807A
 004E8072    mov         eax,dword ptr [ebp-4]
 004E8075    call        TWinControl.UpdateControlState
 004E807A    xor         eax,eax
 004E807C    pop         edx
 004E807D    pop         ecx
 004E807E    pop         ecx
 004E807F    mov         dword ptr fs:[eax],edx
 004E8082    push        4E809F
 004E8087    cmp         byte ptr [ebp-5],0
>004E808B    je          004E8097
 004E808D    xor         edx,edx
 004E808F    mov         eax,dword ptr [ebp-4]
 004E8092    call        TWinControl.UpdateRecreatingFlag
 004E8097    ret
>004E8098    jmp         @HandleFinally
>004E809D    jmp         004E8087
 004E809F    pop         ebx
 004E80A0    pop         ecx
 004E80A1    pop         ecx
 004E80A2    pop         ebp
 004E80A3    ret
*}
end;

//004E80A4
procedure TCustomForm.ValidateRename(AComponent:TComponent; const CurName:UnicodeString; const NewName:UnicodeString);
begin
{*
 004E80A4    push        ebp
 004E80A5    mov         ebp,esp
 004E80A7    push        ebx
 004E80A8    push        esi
 004E80A9    push        edi
 004E80AA    mov         edi,ecx
 004E80AC    mov         esi,edx
 004E80AE    mov         ebx,eax
 004E80B0    mov         eax,dword ptr [ebp+8]
 004E80B3    push        eax
 004E80B4    mov         ecx,edi
 004E80B6    mov         edx,esi
 004E80B8    mov         eax,ebx
 004E80BA    call        TComponent.ValidateRename
 004E80BF    cmp         dword ptr [ebx+2BC],0
>004E80C6    je          004E80DB
 004E80C8    mov         eax,dword ptr [ebp+8]
 004E80CB    push        eax
 004E80CC    mov         ecx,edi
 004E80CE    mov         edx,esi
 004E80D0    mov         eax,dword ptr [ebx+2BC]
 004E80D6    mov         ebx,dword ptr [eax]
 004E80D8    call        dword ptr [ebx+30]
 004E80DB    pop         edi
 004E80DC    pop         esi
 004E80DD    pop         ebx
 004E80DE    pop         ebp
 004E80DF    ret         4
*}
end;

//004E80E4
procedure TCustomForm.WndProc(var Message:TMessage);
begin
{*
 004E80E4    push        ebp
 004E80E5    mov         ebp,esp
 004E80E7    add         esp,0FFFFFFE8
 004E80EA    push        ebx
 004E80EB    push        esi
 004E80EC    push        edi
 004E80ED    mov         ebx,edx
 004E80EF    mov         dword ptr [ebp-4],eax
 004E80F2    mov         eax,dword ptr [ebx]
 004E80F4    mov         edx,eax
 004E80F6    cmp         edx,112
>004E80FC    jg          004E812A
>004E80FE    je          004E815A
 004E8100    add         edx,0FFFFFFFA
 004E8103    sub         edx,3
>004E8106    jb          004E81ED
 004E810C    sub         edx,22
>004E810F    je          004E83B9
 004E8115    dec         edx
>004E8116    je          004E84BA
 004E811C    sub         edx,1A
>004E811F    je          004E833D
>004E8125    jmp         004E85F4
 004E812A    add         edx,0FFFFFCE2
 004E8130    sub         edx,2
>004E8133    jb          004E85E8
 004E8139    sub         edx,0ACFA
>004E813F    je          004E831C
 004E8145    dec         edx
>004E8146    je          004E82FB
 004E814C    sub         edx,2C
>004E814F    je          004E8267
>004E8155    jmp         004E85F4
 004E815A    mov         eax,dword ptr [ebx+4]
 004E815D    and         eax,0FFF0
 004E8162    cmp         eax,0F120
>004E8167    je          004E818B
 004E8169    mov         eax,dword ptr [ebx+4]
 004E816C    and         eax,0FFF0
 004E8171    cmp         eax,0F030
>004E8176    jne         004E8673
 004E817C    mov         eax,[007932EC];Application:TApplication
 004E8181    cmp         byte ptr [eax+34],0
>004E8185    je          004E8673
 004E818B    mov         eax,[007932EC];Application:TApplication
 004E8190    mov         eax,dword ptr [eax+44]
 004E8193    cmp         eax,dword ptr [ebp-4]
>004E8196    jne         004E8673
 004E819C    mov         eax,[007932EC];Application:TApplication
 004E81A1    cmp         byte ptr [eax+0D3],0
>004E81A8    je          004E8673
 004E81AE    mov         eax,[007932EC];Application:TApplication
 004E81B3    mov         eax,dword ptr [eax+44]
 004E81B6    call        TWinControl.GetHandle
 004E81BB    push        eax
 004E81BC    call        user32.IsIconic
 004E81C1    cmp         eax,1
 004E81C4    sbb         eax,eax
 004E81C6    inc         eax
 004E81C7    mov         byte ptr [ebp-11],al
 004E81CA    mov         edx,ebx
 004E81CC    mov         eax,dword ptr [ebp-4]
 004E81CF    call        TWinControl.WndProc
 004E81D4    cmp         byte ptr [ebp-11],0
>004E81D8    je          004E867D
 004E81DE    mov         eax,[007932EC];Application:TApplication
 004E81E3    call        TApplication.InternalRestore
>004E81E8    jmp         004E867D
 004E81ED    cmp         byte ptr ds:[7866F8],0
>004E81F4    je          004E867D
 004E81FA    cmp         dword ptr [ebx],7
>004E81FD    jne         004E8673
 004E8203    mov         eax,dword ptr [ebp-4]
 004E8206    test        byte ptr [eax+1C],10
>004E820A    jne         004E8673
 004E8210    xor         esi,esi
 004E8212    mov         eax,dword ptr [ebp-4]
 004E8215    cmp         byte ptr [eax+29E],2
>004E821C    jne         004E823B
 004E821E    mov         eax,dword ptr [ebp-4]
 004E8221    call        TCustomForm.get_ActiveMDIChild
 004E8226    test        eax,eax
>004E8228    je          004E8254
 004E822A    mov         eax,dword ptr [ebp-4]
 004E822D    call        TCustomForm.get_ActiveMDIChild
 004E8232    call        TWinControl.GetHandle
 004E8237    mov         esi,eax
>004E8239    jmp         004E8254
 004E823B    mov         eax,dword ptr [ebp-4]
 004E823E    mov         eax,dword ptr [eax+290]
 004E8244    test        eax,eax
>004E8246    je          004E8254
 004E8248    cmp         eax,dword ptr [ebp-4]
>004E824B    je          004E8254
 004E824D    call        TWinControl.GetHandle
 004E8252    mov         esi,eax
 004E8254    test        esi,esi
>004E8256    je          004E8673
 004E825C    push        esi
 004E825D    call        user32.SetFocus
>004E8262    jmp         004E867D
 004E8267    mov         esi,dword ptr [ebx+4]
 004E826A    xor         edi,edi
>004E826C    jmp         004E827F
 004E826E    mov         eax,esi
 004E8270    call        FindControl
 004E8275    mov         edi,eax
 004E8277    push        esi
 004E8278    call        user32.GetParent
 004E827D    mov         esi,eax
 004E827F    test        esi,esi
>004E8281    je          004E8287
 004E8283    test        edi,edi
>004E8285    je          004E826E
 004E8287    test        edi,edi
>004E8289    je          004E8673
 004E828F    mov         dl,1
 004E8291    mov         eax,edi
 004E8293    call        GetParentForm
 004E8298    mov         esi,eax
 004E829A    mov         eax,dword ptr [ebp-4]
 004E829D    cmp         edi,dword ptr [eax+290]
>004E82A3    jne         004E82B3
 004E82A5    mov         eax,[007932F0];Screen:TScreen
 004E82AA    cmp         edi,dword ptr [eax+60]
>004E82AD    je          004E8673
 004E82B3    test        esi,esi
>004E82B5    je          004E8673
 004E82BB    cmp         esi,dword ptr [ebp-4]
>004E82BE    je          004E82CE
 004E82C0    mov         eax,[007932F0];Screen:TScreen
 004E82C5    cmp         esi,dword ptr [eax+64]
>004E82C8    je          004E8673
 004E82CE    mov         eax,dword ptr [esi+290]
 004E82D4    test        eax,eax
>004E82D6    je          004E82EA
 004E82D8    cmp         edi,eax
>004E82DA    je          004E82EA
 004E82DC    push        0
 004E82DE    xor         ecx,ecx
 004E82E0    mov         edx,8
 004E82E5    call        TControl.Perform
 004E82EA    mov         edx,edi
 004E82EC    mov         eax,esi
 004E82EE    mov         ecx,dword ptr [eax]
 004E82F0    call        dword ptr [ecx+110]
>004E82F6    jmp         004E8673
 004E82FB    mov         eax,dword ptr [ebp-4]
 004E82FE    cmp         dword ptr [eax+90],0
>004E8305    je          004E8673
 004E830B    mov         eax,dword ptr [ebp-4]
 004E830E    mov         si,0FFAD
 004E8312    call        @CallDynaInst
>004E8317    jmp         004E8673
 004E831C    mov         eax,dword ptr [ebp-4]
 004E831F    cmp         dword ptr [eax+90],0
>004E8326    je          004E8673
 004E832C    mov         eax,dword ptr [ebp-4]
 004E832F    mov         si,0FFAF
 004E8333    call        @CallDynaInst
>004E8338    jmp         004E8673
 004E833D    mov         eax,dword ptr [ebp-4]
 004E8340    movzx       eax,word ptr [eax+1C]
 004E8344    and         ax,word ptr ds:[4E8684]
 004E834B    movzx       edx,word ptr ds:[4E8688]
 004E8352    cmp         dx,ax
>004E8355    jne         004E8673
 004E835B    mov         eax,dword ptr [ebx+8]
 004E835E    mov         edx,dword ptr [ebp-4]
 004E8361    movzx       edx,byte ptr [edx+29F]
 004E8368    dec         edx
 004E8369    sub         dl,2
>004E836C    jae         004E8380
 004E836E    mov         edx,dword ptr [ebp-4]
 004E8371    cmp         byte ptr [edx+29A],2
>004E8378    je          004E8380
 004E837A    mov         edx,eax
 004E837C    or          dword ptr [edx+18],2
 004E8380    mov         edx,dword ptr [ebp-4]
 004E8383    movzx       edx,byte ptr [edx+29F]
 004E838A    sub         dl,1
>004E838D    je          004E8398
 004E838F    sub         dl,2
>004E8392    jne         004E8673
 004E8398    mov         edx,dword ptr [ebp-4]
 004E839B    movzx       edx,byte ptr [edx+299]
 004E83A2    sub         dl,2
>004E83A5    je          004E83B0
 004E83A7    sub         dl,3
>004E83AA    jne         004E8673
 004E83B0    or          dword ptr [eax+18],1
>004E83B4    jmp         004E8673
 004E83B9    mov         eax,dword ptr [ebx+8]
 004E83BC    mov         dword ptr [ebp-18],eax
 004E83BF    mov         eax,dword ptr [ebp-18]
 004E83C2    cmp         dword ptr [eax],1
>004E83C5    jne         004E8673
 004E83CB    mov         eax,dword ptr [ebp-4]
 004E83CE    cmp         dword ptr [eax+2B4],0
>004E83D5    je          004E8673
 004E83DB    mov         eax,dword ptr [ebp-18]
 004E83DE    mov         edx,dword ptr [eax+8]
 004E83E1    mov         eax,dword ptr [ebp-4]
 004E83E4    mov         eax,dword ptr [eax+2B4]
 004E83EA    xor         ecx,ecx
 004E83EC    call        TMenu.FindItem
 004E83F1    mov         edi,eax
 004E83F3    test        edi,edi
>004E83F5    je          004E8673
 004E83FB    mov         dl,1
 004E83FD    mov         eax,[00476D34];TControlCanvas
 004E8402    call        TCanvas.Create
 004E8407    mov         dword ptr [ebp-0C],eax
 004E840A    xor         eax,eax
 004E840C    push        ebp
 004E840D    push        4E84B3
 004E8412    push        dword ptr fs:[eax]
 004E8415    mov         dword ptr fs:[eax],esp
 004E8418    mov         eax,dword ptr [ebp-18]
 004E841B    mov         eax,dword ptr [eax+18]
 004E841E    push        eax
 004E841F    call        gdi32.SaveDC
 004E8424    mov         dword ptr [ebp-8],eax
 004E8427    xor         eax,eax
 004E8429    push        ebp
 004E842A    push        4E8496
 004E842F    push        dword ptr fs:[eax]
 004E8432    mov         dword ptr fs:[eax],esp
 004E8435    mov         eax,dword ptr [ebp-18]
 004E8438    mov         edx,dword ptr [eax+18]
 004E843B    mov         eax,dword ptr [ebp-0C]
 004E843E    call        TCanvas.SetHandle
 004E8443    mov         eax,[007932F0];Screen:TScreen
 004E8448    mov         edx,dword ptr [eax+84]
 004E844E    mov         eax,dword ptr [ebp-0C]
 004E8451    call        TCanvas.SetFont
 004E8456    mov         eax,dword ptr [ebp-18]
 004E8459    movzx       eax,word ptr [eax+10]
 004E845D    push        eax
 004E845E    mov         eax,dword ptr [ebp-18]
 004E8461    lea         ecx,[eax+1C]
 004E8464    mov         edx,dword ptr [ebp-0C]
 004E8467    mov         eax,edi
 004E8469    call        DrawMenuItem
 004E846E    xor         eax,eax
 004E8470    pop         edx
 004E8471    pop         ecx
 004E8472    pop         ecx
 004E8473    mov         dword ptr fs:[eax],edx
 004E8476    push        4E849D
 004E847B    xor         edx,edx
 004E847D    mov         eax,dword ptr [ebp-0C]
 004E8480    call        TCanvas.SetHandle
 004E8485    mov         eax,dword ptr [ebp-8]
 004E8488    push        eax
 004E8489    mov         eax,dword ptr [ebp-18]
 004E848C    mov         eax,dword ptr [eax+18]
 004E848F    push        eax
 004E8490    call        gdi32.RestoreDC
 004E8495    ret
>004E8496    jmp         @HandleFinally
>004E849B    jmp         004E847B
 004E849D    xor         eax,eax
 004E849F    pop         edx
 004E84A0    pop         ecx
 004E84A1    pop         ecx
 004E84A2    mov         dword ptr fs:[eax],edx
 004E84A5    push        4E867D
 004E84AA    mov         eax,dword ptr [ebp-0C]
 004E84AD    call        TObject.Free
 004E84B2    ret
>004E84B3    jmp         @HandleFinally
>004E84B8    jmp         004E84AA
 004E84BA    mov         esi,dword ptr [ebx+8]
 004E84BD    cmp         dword ptr [esi],1
>004E84C0    jne         004E8673
 004E84C6    mov         eax,dword ptr [ebp-4]
 004E84C9    cmp         dword ptr [eax+2B4],0
>004E84D0    je          004E8673
 004E84D6    mov         edx,dword ptr [esi+8]
 004E84D9    mov         eax,dword ptr [ebp-4]
 004E84DC    mov         eax,dword ptr [eax+2B4]
 004E84E2    xor         ecx,ecx
 004E84E4    call        TMenu.FindItem
 004E84E9    mov         edi,eax
 004E84EB    test        edi,edi
>004E84ED    je          004E8673
 004E84F3    mov         eax,dword ptr [ebp-4]
 004E84F6    call        TWinControl.GetHandle
 004E84FB    push        eax
 004E84FC    call        user32.GetWindowDC
 004E8501    mov         dword ptr [ebp-10],eax
 004E8504    xor         eax,eax
 004E8506    push        ebp
 004E8507    push        4E85E1
 004E850C    push        dword ptr fs:[eax]
 004E850F    mov         dword ptr fs:[eax],esp
 004E8512    mov         dl,1
 004E8514    mov         eax,[00476D34];TControlCanvas
 004E8519    call        TCanvas.Create
 004E851E    mov         dword ptr [ebp-0C],eax
 004E8521    xor         eax,eax
 004E8523    push        ebp
 004E8524    push        4E85BA
 004E8529    push        dword ptr fs:[eax]
 004E852C    mov         dword ptr fs:[eax],esp
 004E852F    mov         eax,dword ptr [ebp-10]
 004E8532    push        eax
 004E8533    call        gdi32.SaveDC
 004E8538    mov         dword ptr [ebp-8],eax
 004E853B    xor         eax,eax
 004E853D    push        ebp
 004E853E    push        4E859D
 004E8543    push        dword ptr fs:[eax]
 004E8546    mov         dword ptr fs:[eax],esp
 004E8549    mov         edx,dword ptr [ebp-10]
 004E854C    mov         eax,dword ptr [ebp-0C]
 004E854F    call        TCanvas.SetHandle
 004E8554    mov         eax,[007932F0];Screen:TScreen
 004E8559    mov         edx,dword ptr [eax+84]
 004E855F    mov         eax,dword ptr [ebp-0C]
 004E8562    call        TCanvas.SetFont
 004E8567    lea         eax,[esi+10]
 004E856A    push        eax
 004E856B    lea         ecx,[esi+0C]
 004E856E    mov         edx,dword ptr [ebp-0C]
 004E8571    mov         eax,edi
 004E8573    mov         ebx,dword ptr [eax]
 004E8575    call        dword ptr [ebx+3C]
 004E8578    xor         eax,eax
 004E857A    pop         edx
 004E857B    pop         ecx
 004E857C    pop         ecx
 004E857D    mov         dword ptr fs:[eax],edx
 004E8580    push        4E85A4
 004E8585    xor         edx,edx
 004E8587    mov         eax,dword ptr [ebp-0C]
 004E858A    call        TCanvas.SetHandle
 004E858F    mov         eax,dword ptr [ebp-8]
 004E8592    push        eax
 004E8593    mov         eax,dword ptr [ebp-10]
 004E8596    push        eax
 004E8597    call        gdi32.RestoreDC
 004E859C    ret
>004E859D    jmp         @HandleFinally
>004E85A2    jmp         004E8585
 004E85A4    xor         eax,eax
 004E85A6    pop         edx
 004E85A7    pop         ecx
 004E85A8    pop         ecx
 004E85A9    mov         dword ptr fs:[eax],edx
 004E85AC    push        4E85C1
 004E85B1    mov         eax,dword ptr [ebp-0C]
 004E85B4    call        TObject.Free
 004E85B9    ret
>004E85BA    jmp         @HandleFinally
>004E85BF    jmp         004E85B1
 004E85C1    xor         eax,eax
 004E85C3    pop         edx
 004E85C4    pop         ecx
 004E85C5    pop         ecx
 004E85C6    mov         dword ptr fs:[eax],edx
 004E85C9    push        4E867D
 004E85CE    mov         eax,dword ptr [ebp-10]
 004E85D1    push        eax
 004E85D2    mov         eax,dword ptr [ebp-4]
 004E85D5    call        TWinControl.GetHandle
 004E85DA    push        eax
 004E85DB    call        user32.ReleaseDC
 004E85E0    ret
>004E85E1    jmp         @HandleFinally
>004E85E6    jmp         004E85CE
 004E85E8    xor         edx,edx
 004E85EA    mov         eax,dword ptr [ebp-4]
 004E85ED    call        TCustomForm.UpdateGlassFrame
>004E85F2    jmp         004E8673
 004E85F4    cmp         eax,dword ptr ds:[7932F8]
>004E85FA    jne         004E8673
 004E85FC    push        0
 004E85FE    xor         ecx,ecx
 004E8600    mov         edx,0B025
 004E8605    mov         eax,dword ptr [ebp-4]
 004E8608    call        TControl.Perform
 004E860D    push        0
 004E860F    xor         ecx,ecx
 004E8611    mov         edx,0B024
 004E8616    mov         eax,dword ptr [ebp-4]
 004E8619    call        TControl.Perform
 004E861E    push        0
 004E8620    xor         ecx,ecx
 004E8622    mov         edx,0B035
 004E8627    mov         eax,dword ptr [ebp-4]
 004E862A    call        TControl.Perform
 004E862F    push        0
 004E8631    xor         ecx,ecx
 004E8633    mov         edx,0B009
 004E8638    mov         eax,dword ptr [ebp-4]
 004E863B    call        TControl.Perform
 004E8640    push        0
 004E8642    xor         ecx,ecx
 004E8644    mov         edx,0B008
 004E8649    mov         eax,dword ptr [ebp-4]
 004E864C    call        TControl.Perform
 004E8651    push        0
 004E8653    xor         ecx,ecx
 004E8655    mov         edx,0B03D
 004E865A    mov         eax,dword ptr [ebp-4]
 004E865D    call        TControl.Perform
 004E8662    push        0
 004E8664    xor         ecx,ecx
 004E8666    mov         edx,0B050
 004E866B    mov         eax,dword ptr [ebp-4]
 004E866E    call        TControl.Perform
 004E8673    mov         edx,ebx
 004E8675    mov         eax,dword ptr [ebp-4]
 004E8678    call        TWinControl.WndProc
 004E867D    pop         edi
 004E867E    pop         esi
 004E867F    pop         ebx
 004E8680    mov         esp,ebp
 004E8682    pop         ebp
 004E8683    ret
*}
end;

//004E868C
procedure Default;
begin
{*
 004E868C    push        ebp
 004E868D    mov         ebp,esp
 004E868F    mov         eax,dword ptr [ebp+8]
 004E8692    mov         eax,dword ptr [eax-8]
 004E8695    mov         eax,dword ptr [eax+8]
 004E8698    push        eax
 004E8699    mov         eax,dword ptr [ebp+8]
 004E869C    mov         eax,dword ptr [eax-8]
 004E869F    mov         eax,dword ptr [eax+4]
 004E86A2    push        eax
 004E86A3    mov         eax,dword ptr [ebp+8]
 004E86A6    mov         eax,dword ptr [eax-8]
 004E86A9    mov         eax,dword ptr [eax]
 004E86AB    push        eax
 004E86AC    mov         eax,dword ptr [ebp+8]
 004E86AF    mov         eax,dword ptr [eax-4]
 004E86B2    mov         eax,dword ptr [eax+37C]
 004E86B8    push        eax
 004E86B9    mov         eax,dword ptr [ebp+8]
 004E86BC    mov         eax,dword ptr [eax-4]
 004E86BF    mov         eax,dword ptr [eax+2DC]
 004E86C5    push        eax
 004E86C6    call        user32.CallWindowProcW
 004E86CB    mov         edx,dword ptr [ebp+8]
 004E86CE    mov         edx,dword ptr [edx-8]
 004E86D1    mov         dword ptr [edx+0C],eax
 004E86D4    pop         ebp
 004E86D5    ret
*}
end;

//004E86D8
function MaximizedChildren:Boolean;
begin
{*
 004E86D8    push        ebp
 004E86D9    mov         ebp,esp
 004E86DB    push        ebx
 004E86DC    push        esi
 004E86DD    mov         eax,dword ptr [ebp+8]
 004E86E0    mov         eax,dword ptr [eax-4]
 004E86E3    call        TCustomForm.get_MDIChildCount
 004E86E8    mov         ebx,eax
 004E86EA    dec         ebx
 004E86EB    test        ebx,ebx
>004E86ED    jl          004E8710
 004E86EF    inc         ebx
 004E86F0    xor         esi,esi
 004E86F2    mov         eax,dword ptr [ebp+8]
 004E86F5    mov         eax,dword ptr [eax-4]
 004E86F8    mov         edx,esi
 004E86FA    call        TCustomForm.get_MDIChildren
 004E86FF    cmp         byte ptr [eax+29A],2
>004E8706    jne         004E870C
 004E8708    mov         al,1
>004E870A    jmp         004E8712
 004E870C    inc         esi
 004E870D    dec         ebx
>004E870E    jne         004E86F2
 004E8710    xor         eax,eax
 004E8712    pop         esi
 004E8713    pop         ebx
 004E8714    pop         ebp
 004E8715    ret
*}
end;

//004E8718
procedure TCustomForm.ClientWndProc(var Message:TMessage);
begin
{*
 004E8718    push        ebp
 004E8719    mov         ebp,esp
 004E871B    add         esp,0FFFFFF8C
 004E871E    mov         dword ptr [ebp-8],edx
 004E8721    mov         dword ptr [ebp-4],eax
 004E8724    mov         eax,dword ptr [ebp-8]
 004E8727    mov         eax,dword ptr [eax]
 004E8729    sub         eax,0F
>004E872C    je          004E8839
 004E8732    sub         eax,5
>004E8735    je          004E876C
 004E8737    sub         eax,2B
>004E873A    je          004E87F2
 004E8740    sub         eax,45
>004E8743    jne         004E88F0
 004E8749    push        ebp
 004E874A    call        Default
 004E874F    pop         ecx
 004E8750    mov         eax,dword ptr [ebp-8]
 004E8753    cmp         dword ptr [eax+0C],1
>004E8757    jne         004E88F7
 004E875D    mov         eax,dword ptr [ebp-8]
 004E8760    mov         dword ptr [eax+0C],0FFFFFFFF
>004E8767    jmp         004E88F7
 004E876C    mov         eax,dword ptr [ebp-8]
 004E876F    mov         eax,dword ptr [eax+4]
 004E8772    mov         dword ptr [ebp-0C],eax
 004E8775    mov         eax,dword ptr [ebp-4]
 004E8778    mov         eax,dword ptr [eax+1C0]
 004E877E    call        TBrush.GetHandle
 004E8783    push        eax
 004E8784    lea         edx,[ebp-6C]
 004E8787    mov         eax,dword ptr [ebp-4]
 004E878A    mov         ecx,dword ptr [eax]
 004E878C    call        dword ptr [ecx+54]
 004E878F    lea         eax,[ebp-6C]
 004E8792    push        eax
 004E8793    mov         eax,dword ptr [ebp-0C]
 004E8796    push        eax
 004E8797    call        user32.FillRect
 004E879C    mov         eax,dword ptr [ebp-4]
 004E879F    cmp         byte ptr [eax+29E],2
>004E87A6    jne         004E87E3
 004E87A8    mov         eax,dword ptr [ebp-4]
 004E87AB    cmp         dword ptr [eax+37C],0
>004E87B2    je          004E87E3
 004E87B4    lea         eax,[ebp-5C]
 004E87B7    push        eax
 004E87B8    mov         eax,dword ptr [ebp-4]
 004E87BB    mov         eax,dword ptr [eax+37C]
 004E87C1    push        eax
 004E87C2    call        user32.GetClientRect
 004E87C7    mov         eax,dword ptr [ebp-4]
 004E87CA    mov         eax,dword ptr [eax+1C0]
 004E87D0    call        TBrush.GetHandle
 004E87D5    push        eax
 004E87D6    lea         eax,[ebp-5C]
 004E87D9    push        eax
 004E87DA    mov         eax,dword ptr [ebp-0C]
 004E87DD    push        eax
 004E87DE    call        user32.FillRect
 004E87E3    mov         eax,dword ptr [ebp-8]
 004E87E6    mov         dword ptr [eax+0C],1
>004E87ED    jmp         004E88F7
 004E87F2    push        ebp
 004E87F3    call        Default
 004E87F8    pop         ecx
 004E87F9    mov         eax,dword ptr [ebp-4]
 004E87FC    cmp         byte ptr [eax+29E],2
>004E8803    jne         004E88F7
 004E8809    mov         eax,dword ptr [ebp-4]
 004E880C    call        TCustomForm.get_MDIChildCount
 004E8811    test        eax,eax
>004E8813    je          004E8824
 004E8815    push        ebp
 004E8816    call        MaximizedChildren
 004E881B    pop         ecx
 004E881C    test        al,al
>004E881E    je          004E8824
 004E8820    xor         edx,edx
>004E8822    jmp         004E8826
 004E8824    mov         dl,1
 004E8826    mov         eax,dword ptr [ebp-4]
 004E8829    mov         eax,dword ptr [eax+37C]
 004E882F    call        ShowMDIClientEdge
>004E8834    jmp         004E88F7
 004E8839    mov         eax,dword ptr [ebp-8]
 004E883C    mov         eax,dword ptr [eax+4]
 004E883F    mov         dword ptr [ebp-0C],eax
 004E8842    cmp         dword ptr [ebp-0C],0
>004E8846    jne         004E8861
 004E8848    lea         eax,[ebp-4C]
 004E884B    push        eax
 004E884C    mov         eax,dword ptr [ebp-4]
 004E884F    mov         eax,dword ptr [eax+37C]
 004E8855    push        eax
 004E8856    call        user32.BeginPaint
 004E885B    mov         edx,dword ptr [ebp-8]
 004E885E    mov         dword ptr [edx+4],eax
 004E8861    xor         eax,eax
 004E8863    push        ebp
 004E8864    push        4E88E9
 004E8869    push        dword ptr fs:[eax]
 004E886C    mov         dword ptr fs:[eax],esp
 004E886F    cmp         dword ptr [ebp-0C],0
>004E8873    jne         004E88B7
 004E8875    lea         eax,[ebp-5C]
 004E8878    push        eax
 004E8879    mov         eax,dword ptr [ebp-4]
 004E887C    mov         eax,dword ptr [eax+37C]
 004E8882    push        eax
 004E8883    call        user32.GetWindowRect
 004E8888    lea         ecx,[ebp-74]
 004E888B    lea         edx,[ebp-5C]
 004E888E    mov         eax,dword ptr [ebp-4]
 004E8891    call        TControl.ScreenToClient
 004E8896    mov         eax,dword ptr [ebp-74]
 004E8899    mov         dword ptr [ebp-5C],eax
 004E889C    mov         eax,dword ptr [ebp-70]
 004E889F    mov         dword ptr [ebp-58],eax
 004E88A2    mov         ecx,dword ptr [ebp-58]
 004E88A5    neg         ecx
 004E88A7    mov         edx,dword ptr [ebp-5C]
 004E88AA    neg         edx
 004E88AC    mov         eax,dword ptr [ebp-8]
 004E88AF    mov         eax,dword ptr [eax+4]
 004E88B2    call        MoveWindowOrg
 004E88B7    mov         edx,dword ptr [ebp-8]
 004E88BA    mov         eax,dword ptr [ebp-4]
 004E88BD    call        TWinControl.PaintHandler
 004E88C2    xor         eax,eax
 004E88C4    pop         edx
 004E88C5    pop         ecx
 004E88C6    pop         ecx
 004E88C7    mov         dword ptr fs:[eax],edx
 004E88CA    push        4E88F7
 004E88CF    cmp         dword ptr [ebp-0C],0
>004E88D3    jne         004E88E8
 004E88D5    lea         eax,[ebp-4C]
 004E88D8    push        eax
 004E88D9    mov         eax,dword ptr [ebp-4]
 004E88DC    mov         eax,dword ptr [eax+37C]
 004E88E2    push        eax
 004E88E3    call        user32.EndPaint
 004E88E8    ret
>004E88E9    jmp         @HandleFinally
>004E88EE    jmp         004E88CF
 004E88F0    push        ebp
 004E88F1    call        Default
 004E88F6    pop         ecx
 004E88F7    mov         esp,ebp
 004E88F9    pop         ebp
 004E88FA    ret
*}
end;

//004E88FC
procedure TCustomForm.AlignControls(AControl:TControl; var Rect:TRect);
begin
{*
 004E88FC    push        ebx
 004E88FD    push        esi
 004E88FE    push        edi
 004E88FF    add         esp,0FFFFFFE0
 004E8902    mov         esi,ecx
 004E8904    mov         ebx,eax
 004E8906    mov         ecx,esi
 004E8908    mov         eax,ebx
 004E890A    call        TScrollingWinControl.AlignControls
 004E890F    mov         eax,dword ptr [ebx+37C]
 004E8915    test        eax,eax
>004E8917    je          004E8960
 004E8919    push        14
 004E891B    mov         ecx,dword ptr [esi+0C]
 004E891E    mov         edi,dword ptr [esi+4]
 004E8921    sub         ecx,edi
 004E8923    push        ecx
 004E8924    mov         ecx,dword ptr [esi+8]
 004E8927    mov         edx,dword ptr [esi]
 004E8929    sub         ecx,edx
 004E892B    push        ecx
 004E892C    push        edi
 004E892D    push        edx
 004E892E    push        1
 004E8930    push        eax
 004E8931    call        user32.SetWindowPos
 004E8936    cmp         byte ptr [ebx+29E],2
>004E893D    jne         004E8960
 004E893F    push        esp
 004E8940    mov         eax,dword ptr [ebx+37C]
 004E8946    push        eax
 004E8947    call        user32.GetClientRect
 004E894C    test        eax,eax
>004E894E    je          004E8960
 004E8950    push        0FF
 004E8952    push        0
 004E8954    mov         eax,dword ptr [ebx+37C]
 004E895A    push        eax
 004E895B    call        user32.InvalidateRect
 004E8960    test        byte ptr [ebx+55],80
>004E8964    je          004E89B0
 004E8966    test        byte ptr [ebx+1C],1
>004E896A    jne         004E89B0
 004E896C    mov         eax,ebx
 004E896E    call        TControl.GetClientHeight
 004E8973    mov         edx,dword ptr [ebx+374]
 004E8979    sub         eax,dword ptr [edx+18]
 004E897C    push        eax
 004E897D    lea         eax,[esp+14]
 004E8981    push        eax
 004E8982    mov         eax,ebx
 004E8984    call        TControl.GetClientWidth
 004E8989    mov         ecx,eax
 004E898B    mov         eax,dword ptr [ebx+374]
 004E8991    sub         ecx,dword ptr [eax+14]
 004E8994    mov         esi,dword ptr [ebx+374]
 004E899A    mov         edx,dword ptr [esi+10]
 004E899D    mov         eax,dword ptr [esi+0C]
 004E89A0    call        Rect
 004E89A5    lea         edx,[esp+10]
 004E89A9    mov         eax,ebx
 004E89AB    call        TCustomForm.UpdateGlassFrameControls
 004E89B0    add         esp,20
 004E89B3    pop         edi
 004E89B4    pop         esi
 004E89B5    pop         ebx
 004E89B6    ret
*}
end;

//004E89B8
procedure TCustomForm.CMBiDiModeChanged(var Message:TMessage);
begin
{*
 004E89B8    push        ebx
 004E89B9    push        esi
 004E89BA    push        edi
 004E89BB    push        ecx
 004E89BC    mov         ebx,eax
 004E89BE    mov         eax,ebx
 004E89C0    call        TScrollingWinControl.CMBiDiModeChanged
 004E89C5    mov         eax,ebx
 004E89C7    call        TWinControl.HandleAllocated
 004E89CC    test        al,al
>004E89CE    je          004E8A0D
 004E89D0    push        0EC
 004E89D2    mov         eax,ebx
 004E89D4    call        TWinControl.GetHandle
 004E89D9    push        eax
 004E89DA    call        user32.GetWindowLongW
 004E89DF    and         eax,0FFFFEFFF
 004E89E4    and         eax,0FFFFDFFF
 004E89E9    and         eax,0FFFFBFFF
 004E89EE    mov         dword ptr [esp],eax
 004E89F1    mov         edx,esp
 004E89F3    mov         eax,ebx
 004E89F5    call        TWinControl.AddBiDiModeExStyle
 004E89FA    mov         eax,dword ptr [esp]
 004E89FD    push        eax
 004E89FE    push        0EC
 004E8A00    mov         eax,ebx
 004E8A02    call        TWinControl.GetHandle
 004E8A07    push        eax
 004E8A08    call        user32.SetWindowLongW
 004E8A0D    mov         eax,ebx
 004E8A0F    call        TComponent.GetComponentCount
 004E8A14    mov         edi,eax
 004E8A16    dec         edi
 004E8A17    test        edi,edi
>004E8A19    jl          004E8A48
 004E8A1B    inc         edi
 004E8A1C    xor         esi,esi
 004E8A1E    mov         edx,esi
 004E8A20    mov         eax,ebx
 004E8A22    call        TComponent.GetComponent
 004E8A27    mov         edx,dword ptr ds:[4A02F4];TMenu
 004E8A2D    call        @IsClass
 004E8A32    test        al,al
>004E8A34    je          004E8A44
 004E8A36    mov         edx,esi
 004E8A38    mov         eax,ebx
 004E8A3A    call        TComponent.GetComponent
 004E8A3F    call        TMenu.ParentBiDiModeChanged
 004E8A44    inc         esi
 004E8A45    dec         edi
>004E8A46    jne         004E8A1E
 004E8A48    pop         edx
 004E8A49    pop         edi
 004E8A4A    pop         esi
 004E8A4B    pop         ebx
 004E8A4C    ret
*}
end;

//004E8A50
procedure TCustomForm.CMParentBiDiModeChanged(var Message:TMessage);
begin
{*
 004E8A50    push        ebp
 004E8A51    mov         ebp,esp
 004E8A53    push        ecx
 004E8A54    mov         dword ptr [ebp-4],eax
 004E8A57    mov         eax,dword ptr [ebp-4]
 004E8A5A    cmp         byte ptr [eax+2B0],0
>004E8A61    jne         004E8ADC
 004E8A63    mov         eax,dword ptr [ebp-4]
 004E8A66    mov         byte ptr [eax+2B0],1
 004E8A6D    xor         edx,edx
 004E8A6F    push        ebp
 004E8A70    push        4E8AD5
 004E8A75    push        dword ptr fs:[edx]
 004E8A78    mov         dword ptr fs:[edx],esp
 004E8A7B    mov         eax,dword ptr [ebp-4]
 004E8A7E    cmp         byte ptr [eax+62],0
>004E8A82    je          004E8ABD
 004E8A84    mov         eax,dword ptr [ebp-4]
 004E8A87    mov         eax,dword ptr [eax+34]
 004E8A8A    test        eax,eax
>004E8A8C    jne         004E8AA4
 004E8A8E    mov         eax,[007932EC];Application:TApplication
 004E8A93    movzx       edx,byte ptr [eax+35]
 004E8A97    mov         eax,dword ptr [ebp-4]
 004E8A9A    mov         ecx,dword ptr [eax]
 004E8A9C    call        dword ptr [ecx+80]
>004E8AA2    jmp         004E8AB3
 004E8AA4    movzx       edx,byte ptr [eax+61]
 004E8AA8    mov         eax,dword ptr [ebp-4]
 004E8AAB    mov         ecx,dword ptr [eax]
 004E8AAD    call        dword ptr [ecx+80]
 004E8AB3    mov         dl,1
 004E8AB5    mov         eax,dword ptr [ebp-4]
 004E8AB8    mov         ecx,dword ptr [eax]
 004E8ABA    call        dword ptr [ecx+7C]
 004E8ABD    xor         eax,eax
 004E8ABF    pop         edx
 004E8AC0    pop         ecx
 004E8AC1    pop         ecx
 004E8AC2    mov         dword ptr fs:[eax],edx
 004E8AC5    push        4E8ADC
 004E8ACA    mov         eax,dword ptr [ebp-4]
 004E8ACD    mov         byte ptr [eax+2B0],0
 004E8AD4    ret
>004E8AD5    jmp         @HandleFinally
>004E8ADA    jmp         004E8ACA
 004E8ADC    pop         ecx
 004E8ADD    pop         ebp
 004E8ADE    ret
*}
end;

//004E8AE0
procedure TCustomForm.CMPopupHwndDestroy(var Message:TCMPopupHWndDestroy);
begin
{*
 004E8AE0    push        ebx
 004E8AE1    push        esi
 004E8AE2    push        edi
 004E8AE3    mov         esi,edx
 004E8AE5    mov         ebx,eax
 004E8AE7    mov         eax,dword ptr [esi+4]
 004E8AEA    mov         eax,dword ptr [eax+4]
 004E8AED    call        FindControl
 004E8AF2    test        eax,eax
>004E8AF4    je          004E8AFF
 004E8AF6    mov         eax,dword ptr [esi+4]
 004E8AF9    cmp         byte ptr [eax+8],0
>004E8AFD    jne         004E8B44
 004E8AFF    mov         eax,dword ptr [ebx+354]
 004E8B05    call        @DynArrayLength
 004E8B0A    mov         edi,eax
 004E8B0C    lea         eax,[edi+1]
 004E8B0F    push        eax
 004E8B10    lea         eax,[ebx+354]
 004E8B16    mov         ecx,1
 004E8B1B    mov         edx,dword ptr ds:[4DEEE4];TPopupWndArray
 004E8B21    call        @DynArraySetLength
 004E8B26    add         esp,4
 004E8B29    mov         eax,dword ptr [ebx+354]
 004E8B2F    mov         edx,dword ptr [esi+4]
 004E8B32    mov         edx,dword ptr [edx]
 004E8B34    mov         dword ptr [eax+edi*8],edx
 004E8B37    mov         eax,dword ptr [ebx+354]
 004E8B3D    mov         edx,dword ptr [esi+8]
 004E8B40    mov         dword ptr [eax+edi*8+4],edx
 004E8B44    pop         edi
 004E8B45    pop         esi
 004E8B46    pop         ebx
 004E8B47    ret
*}
end;

//004E8B48
procedure TCustomForm.SetDesigner(ADesigner:IDesignerHook);
begin
{*
 004E8B48    push        ebp
 004E8B49    mov         ebp,esp
 004E8B4B    push        ecx
 004E8B4C    push        ebx
 004E8B4D    mov         dword ptr [ebp-4],edx
 004E8B50    mov         ebx,eax
 004E8B52    mov         eax,dword ptr [ebp-4]
 004E8B55    call        @IntfAddRef
 004E8B5A    xor         eax,eax
 004E8B5C    push        ebp
 004E8B5D    push        4E8B8C
 004E8B62    push        dword ptr fs:[eax]
 004E8B65    mov         dword ptr fs:[eax],esp
 004E8B68    lea         eax,[ebx+2BC]
 004E8B6E    mov         edx,dword ptr [ebp-4]
 004E8B71    call        @IntfCopy
 004E8B76    xor         eax,eax
 004E8B78    pop         edx
 004E8B79    pop         ecx
 004E8B7A    pop         ecx
 004E8B7B    mov         dword ptr fs:[eax],edx
 004E8B7E    push        4E8B93
 004E8B83    lea         eax,[ebp-4]
 004E8B86    call        @IntfClear
 004E8B8B    ret
>004E8B8C    jmp         @HandleFinally
>004E8B91    jmp         004E8B83
 004E8B93    pop         ebx
 004E8B94    pop         ecx
 004E8B95    pop         ebp
 004E8B96    ret
*}
end;

//004E8B98
procedure TCustomForm.GetBorderIconStyles(var Style:Cardinal; var ExStyle:Cardinal);
begin
{*
 004E8B98    push        ebx
 004E8B99    push        esi
 004E8B9A    push        edi
 004E8B9B    push        ebp
 004E8B9C    push        ecx
 004E8B9D    mov         ebp,ecx
 004E8B9F    mov         edi,edx
 004E8BA1    mov         esi,eax
 004E8BA3    and         dword ptr [edi],0FFF4FFFF
 004E8BA9    and         dword ptr [ebp],0FFFFFBFF
 004E8BB0    movzx       eax,byte ptr [esi+299]
 004E8BB7    mov         byte ptr [esp],al
 004E8BBA    cmp         byte ptr [esi+29E],1
>004E8BC1    jne         004E8BD3
 004E8BC3    movzx       eax,byte ptr [esp]
 004E8BC7    test        al,al
>004E8BC9    je          004E8BCF
 004E8BCB    sub         al,3
>004E8BCD    jne         004E8BD3
 004E8BCF    mov         byte ptr [esp],2
 004E8BD3    movzx       ebx,byte ptr [esi+298]
 004E8BDA    movzx       eax,byte ptr [esp]
 004E8BDE    sub         al,1
>004E8BE0    jb          004E8BED
 004E8BE2    sub         al,2
>004E8BE4    je          004E8BF6
 004E8BE6    dec         eax
 004E8BE7    sub         al,2
>004E8BE9    jb          004E8C03
>004E8BEB    jmp         004E8C0E
 004E8BED    movzx       ebx,byte ptr ds:[4E8C58]
>004E8BF4    jmp         004E8C0E
 004E8BF6    movzx       eax,byte ptr ds:[4E8C5C]
 004E8BFD    and         al,bl
 004E8BFF    mov         ebx,eax
>004E8C01    jmp         004E8C0E
 004E8C03    movzx       eax,byte ptr ds:[4E8C60]
 004E8C0A    and         al,bl
 004E8C0C    mov         ebx,eax
 004E8C0E    movzx       eax,byte ptr [esp]
 004E8C12    sub         al,3
>004E8C14    jae         004E8C3A
 004E8C16    cmp         byte ptr [esi+29E],1
>004E8C1D    jne         004E8C24
 004E8C1F    test        bl,1
>004E8C22    je          004E8C3A
 004E8C24    test        bl,2
>004E8C27    je          004E8C2F
 004E8C29    or          dword ptr [edi],20000
 004E8C2F    test        bl,4
>004E8C32    je          004E8C3A
 004E8C34    or          dword ptr [edi],10000
 004E8C3A    test        bl,1
>004E8C3D    je          004E8C45
 004E8C3F    or          dword ptr [edi],80000
 004E8C45    test        bl,8
>004E8C48    je          004E8C51
 004E8C4A    or          dword ptr [ebp],400
 004E8C51    pop         edx
 004E8C52    pop         ebp
 004E8C53    pop         edi
 004E8C54    pop         esi
 004E8C55    pop         ebx
 004E8C56    ret
*}
end;

//004E8C64
procedure TCustomForm.SetBorderIcons(Value:TBorderIcons);
begin
{*
 004E8C64    push        ebx
 004E8C65    push        esi
 004E8C66    add         esp,0FFFFFFF4
 004E8C69    mov         byte ptr [esp],dl
 004E8C6C    mov         ebx,eax
 004E8C6E    movzx       eax,byte ptr [esp]
 004E8C72    cmp         al,byte ptr [ebx+298]
>004E8C78    je          004E8D46
 004E8C7E    movzx       eax,byte ptr [esp]
 004E8C82    mov         byte ptr [ebx+298],al
 004E8C88    mov         eax,ebx
 004E8C8A    call        TWinControl.HandleAllocated
 004E8C8F    test        al,al
>004E8C91    je          004E8D46
 004E8C97    test        byte ptr [ebx+1C],10
>004E8C9B    je          004E8CB1
 004E8C9D    test        byte ptr [ebx+1C],10
>004E8CA1    je          004E8D46
 004E8CA7    cmp         dword ptr [ebx+34],0
>004E8CAB    je          004E8D46
 004E8CB1    cmp         byte ptr [ebx+29E],1
>004E8CB8    jne         004E8CC3
 004E8CBA    cmp         byte ptr [ebx+29A],2
>004E8CC1    je          004E8D3F
 004E8CC3    push        0F0
 004E8CC5    mov         eax,ebx
 004E8CC7    call        TWinControl.GetHandle
 004E8CCC    push        eax
 004E8CCD    call        user32.GetWindowLongW
 004E8CD2    mov         dword ptr [esp+4],eax
 004E8CD6    push        0EC
 004E8CD8    mov         eax,ebx
 004E8CDA    call        TWinControl.GetHandle
 004E8CDF    push        eax
 004E8CE0    call        user32.GetWindowLongW
 004E8CE5    mov         dword ptr [esp+8],eax
 004E8CE9    lea         ecx,[esp+8]
 004E8CED    lea         edx,[esp+4]
 004E8CF1    mov         eax,ebx
 004E8CF3    mov         si,0FFA9
 004E8CF7    call        @CallDynaInst
 004E8CFC    mov         eax,dword ptr [esp+4]
 004E8D00    push        eax
 004E8D01    push        0F0
 004E8D03    mov         eax,ebx
 004E8D05    call        TWinControl.GetHandle
 004E8D0A    push        eax
 004E8D0B    call        user32.SetWindowLongW
 004E8D10    mov         eax,dword ptr [esp+8]
 004E8D14    push        eax
 004E8D15    push        0EC
 004E8D17    mov         eax,ebx
 004E8D19    call        TWinControl.GetHandle
 004E8D1E    push        eax
 004E8D1F    call        user32.SetWindowLongW
 004E8D24    push        37
 004E8D26    push        0
 004E8D28    push        0
 004E8D2A    push        0
 004E8D2C    push        0
 004E8D2E    push        0
 004E8D30    mov         eax,ebx
 004E8D32    call        TWinControl.GetHandle
 004E8D37    push        eax
 004E8D38    call        user32.SetWindowPos
>004E8D3D    jmp         004E8D46
 004E8D3F    mov         eax,ebx
 004E8D41    call        TWinControl.RecreateWnd
 004E8D46    add         esp,0C
 004E8D49    pop         esi
 004E8D4A    pop         ebx
 004E8D4B    ret
*}
end;

//004E8D4C
procedure TCustomForm.GetBorderStyles(var Style:Cardinal; var ExStyle:Cardinal; var ClassStyle:Cardinal);
begin
{*
 004E8D4C    push        ebp
 004E8D4D    mov         ebp,esp
 004E8D4F    push        esi
 004E8D50    push        edi
 004E8D51    mov         edi,ecx
 004E8D53    mov         esi,eax
 004E8D55    and         dword ptr [edx],7F3BFF7F
 004E8D5B    and         dword ptr [edi],0FFFFFE7E
 004E8D61    mov         eax,dword ptr [ebp+8]
 004E8D64    and         dword ptr [eax],0FFFFD7FF
 004E8D6A    movzx       eax,byte ptr [esi+299]
 004E8D71    cmp         byte ptr [esi+29E],1
>004E8D78    jne         004E8D87
 004E8D7A    mov         ecx,eax
 004E8D7C    test        cl,cl
>004E8D7E    je          004E8D85
 004E8D80    sub         cl,3
>004E8D83    jne         004E8D87
 004E8D85    mov         al,2
 004E8D87    movzx       ecx,al
 004E8D8A    cmp         ecx,5
>004E8D8D    ja          004E8E42
 004E8D93    jmp         dword ptr [ecx*4+4E8D9A]
 004E8D93    dd          004E8DB2
 004E8D93    dd          004E8DCD
 004E8D93    dd          004E8DD5
 004E8D93    dd          004E8DDD
 004E8D93    dd          004E8DCD
 004E8D93    dd          004E8DD5
 004E8DB2    cmp         dword ptr [esi+34],0
>004E8DB6    jne         004E8E42
 004E8DBC    cmp         dword ptr [esi+1D4],0
>004E8DC3    jne         004E8E42
 004E8DC5    or          dword ptr [edx],80000000
>004E8DCB    jmp         004E8E42
 004E8DCD    or          dword ptr [edx],0C00000
>004E8DD3    jmp         004E8E42
 004E8DD5    or          dword ptr [edx],0C40000
>004E8DDB    jmp         004E8E42
 004E8DDD    test        byte ptr [esi+1C],10
>004E8DE1    je          004E8DF1
 004E8DE3    cmp         dword ptr [esi+34],0
>004E8DE7    je          004E8DF1
 004E8DE9    or          dword ptr [edx],0C00000
>004E8DEF    jmp         004E8E01
 004E8DF1    mov         ecx,dword ptr [edx]
 004E8DF3    or          ecx,80000000
 004E8DF9    or          ecx,0C00000
 004E8DFF    mov         dword ptr [edx],ecx
 004E8E01    mov         ecx,dword ptr [edi]
 004E8E03    or          ecx,1
 004E8E06    or          ecx,100
 004E8E0C    mov         dword ptr [edi],ecx
 004E8E0E    mov         ecx,dword ptr ds:[78D264];^NewStyleControls:Boolean
 004E8E14    cmp         byte ptr [ecx],0
>004E8E17    jne         004E8E29
 004E8E19    mov         ecx,dword ptr [edx]
 004E8E1B    or          ecx,400000
 004E8E21    or          ecx,80
 004E8E27    mov         dword ptr [edx],ecx
 004E8E29    mov         edx,dword ptr [ebp+8]
 004E8E2C    mov         edx,dword ptr [edx]
 004E8E2E    or          edx,8
 004E8E31    or          edx,800
 004E8E37    or          edx,2000
 004E8E3D    mov         ecx,dword ptr [ebp+8]
 004E8E40    mov         dword ptr [ecx],edx
 004E8E42    add         al,0FC
 004E8E44    sub         al,2
>004E8E46    jae         004E8E57
 004E8E48    cmp         byte ptr [esi+29E],1
>004E8E4F    je          004E8E57
 004E8E51    or          dword ptr [edi],80
 004E8E57    pop         edi
 004E8E58    pop         esi
 004E8E59    pop         ebp
 004E8E5A    ret         4
*}
end;

//004E8E60
procedure TCustomForm.SetBorderStyle(Value:TFormBorderStyle);
begin
{*
 004E8E60    push        esi
 004E8E61    push        edi
 004E8E62    add         esp,0FFFFFFF4
 004E8E65    mov         edi,eax
 004E8E67    cmp         dl,byte ptr [edi+299]
>004E8E6D    je          004E8FF7
 004E8E73    mov         byte ptr [edi+299],dl
 004E8E79    cmp         byte ptr [edi+274],0
>004E8E80    je          004E8E91
 004E8E82    movzx       eax,byte ptr [edi+299]
 004E8E89    sub         al,2
>004E8E8B    je          004E8E95
 004E8E8D    sub         al,3
>004E8E8F    je          004E8E95
 004E8E91    xor         edx,edx
>004E8E93    jmp         004E8E97
 004E8E95    mov         dl,1
 004E8E97    mov         eax,edi
 004E8E99    call        TScrollingWinControl.SetAutoScroll
 004E8E9E    mov         eax,edi
 004E8EA0    call        TWinControl.HandleAllocated
 004E8EA5    test        al,al
>004E8EA7    je          004E8FF7
 004E8EAD    test        byte ptr [edi+1C],10
>004E8EB1    je          004E8EC7
 004E8EB3    test        byte ptr [edi+1C],10
>004E8EB7    je          004E8FF7
 004E8EBD    cmp         dword ptr [edi+34],0
>004E8EC1    je          004E8FF7
 004E8EC7    push        0F0
 004E8EC9    mov         eax,edi
 004E8ECB    call        TWinControl.GetHandle
 004E8ED0    push        eax
 004E8ED1    call        user32.GetWindowLongW
 004E8ED6    mov         dword ptr [esp],eax
 004E8ED9    push        0EC
 004E8EDB    mov         eax,edi
 004E8EDD    call        TWinControl.GetHandle
 004E8EE2    push        eax
 004E8EE3    call        user32.GetWindowLongW
 004E8EE8    mov         dword ptr [esp+4],eax
 004E8EEC    push        0E6
 004E8EEE    mov         eax,edi
 004E8EF0    call        TWinControl.GetHandle
 004E8EF5    push        eax
 004E8EF6    call        user32.GetClassLongW
 004E8EFB    mov         dword ptr [esp+8],eax
 004E8EFF    lea         eax,[esp+8]
 004E8F03    push        eax
 004E8F04    lea         ecx,[esp+8]
 004E8F08    lea         edx,[esp+4]
 004E8F0C    mov         eax,edi
 004E8F0E    mov         si,0FFA8
 004E8F12    call        @CallDynaInst
 004E8F17    lea         ecx,[esp+4]
 004E8F1B    mov         edx,esp
 004E8F1D    mov         eax,edi
 004E8F1F    mov         si,0FFA9
 004E8F23    call        @CallDynaInst
 004E8F28    mov         eax,dword ptr [esp]
 004E8F2B    push        eax
 004E8F2C    push        0F0
 004E8F2E    mov         eax,edi
 004E8F30    call        TWinControl.GetHandle
 004E8F35    push        eax
 004E8F36    call        user32.SetWindowLongW
 004E8F3B    mov         eax,dword ptr [esp+4]
 004E8F3F    push        eax
 004E8F40    push        0EC
 004E8F42    mov         eax,edi
 004E8F44    call        TWinControl.GetHandle
 004E8F49    push        eax
 004E8F4A    call        user32.SetWindowLongW
 004E8F4F    mov         eax,dword ptr [esp+8]
 004E8F53    push        eax
 004E8F54    push        0E6
 004E8F56    mov         eax,edi
 004E8F58    call        TWinControl.GetHandle
 004E8F5D    push        eax
 004E8F5E    call        user32.SetClassLongW
 004E8F63    mov         eax,edi
 004E8F65    call        TWinControl.HandleAllocated
 004E8F6A    test        al,al
>004E8F6C    je          004E8FD4
 004E8F6E    mov         eax,[0078D264];^NewStyleControls:Boolean
 004E8F73    cmp         byte ptr [eax],0
>004E8F76    je          004E8FB5
 004E8F78    cmp         byte ptr [edi+299],3
>004E8F7F    je          004E8F9F
 004E8F81    mov         eax,edi
 004E8F83    call        TCustomForm.GetIconHandle
 004E8F88    push        eax
 004E8F89    push        1
 004E8F8B    push        80
 004E8F90    mov         eax,edi
 004E8F92    call        TWinControl.GetHandle
 004E8F97    push        eax
 004E8F98    call        user32.SendMessageW
>004E8F9D    jmp         004E8FB5
 004E8F9F    push        0
 004E8FA1    push        1
 004E8FA3    push        80
 004E8FA8    mov         eax,edi
 004E8FAA    call        TWinControl.GetHandle
 004E8FAF    push        eax
 004E8FB0    call        user32.SendMessageW
 004E8FB5    push        0FF
 004E8FB7    mov         eax,edi
 004E8FB9    call        TWinControl.GetHandle
 004E8FBE    push        eax
 004E8FBF    call        user32.GetSystemMenu
 004E8FC4    push        0
 004E8FC6    xor         ecx,ecx
 004E8FC8    mov         edx,81
 004E8FCD    mov         eax,edi
 004E8FCF    call        TControl.Perform
 004E8FD4    push        37
 004E8FD6    push        0
 004E8FD8    push        0
 004E8FDA    push        0
 004E8FDC    push        0
 004E8FDE    push        0
 004E8FE0    mov         eax,edi
 004E8FE2    call        TWinControl.GetHandle
 004E8FE7    push        eax
 004E8FE8    call        user32.SetWindowPos
 004E8FED    mov         eax,edi
 004E8FEF    mov         edx,dword ptr [eax]
 004E8FF1    call        dword ptr [edx+90]
 004E8FF7    add         esp,0C
 004E8FFA    pop         edi
 004E8FFB    pop         esi
 004E8FFC    ret
*}
end;

//004E9000
procedure TCustomForm.Dock(NewDockSite:TWinControl; ARect:TRect);
begin
{*
 004E9000    push        ebx
 004E9001    push        esi
 004E9002    push        edi
 004E9003    add         esp,0FFFFFFF0
 004E9006    mov         esi,ecx
 004E9008    lea         edi,[esp]
 004E900B    movs        dword ptr [edi],dword ptr [esi]
 004E900C    movs        dword ptr [edi],dword ptr [esi]
 004E900D    movs        dword ptr [edi],dword ptr [esi]
 004E900E    movs        dword ptr [edi],dword ptr [esi]
 004E900F    mov         ebx,eax
 004E9011    mov         edi,dword ptr [ebx+34]
 004E9014    mov         esi,dword ptr [ebx+90]
 004E901A    mov         ecx,esp
 004E901C    mov         eax,ebx
 004E901E    call        TControl.Dock
 004E9023    mov         eax,dword ptr [ebx+34]
 004E9026    test        eax,eax
>004E9028    je          004E903D
 004E902A    cmp         edi,eax
>004E902C    jne         004E903D
 004E902E    cmp         esi,dword ptr [ebx+90]
>004E9034    je          004E903D
 004E9036    mov         eax,ebx
 004E9038    call        TWinControl.RecreateWnd
 004E903D    add         esp,10
 004E9040    pop         edi
 004E9041    pop         esi
 004E9042    pop         ebx
 004E9043    ret
*}
end;

//004E9044
procedure TCustomForm.DoDock(NewDockSite:TWinControl; var ARect:TRect);
begin
{*
 004E9044    push        ebx
 004E9045    push        esi
 004E9046    push        edi
 004E9047    mov         edi,ecx
 004E9049    mov         esi,edx
 004E904B    mov         ebx,eax
 004E904D    cmp         esi,dword ptr [ebx+90]
>004E9053    je          004E908B
 004E9055    test        esi,esi
>004E9057    je          004E9064
 004E9059    mov         eax,ebx
 004E905B    mov         edx,dword ptr [eax]
 004E905D    call        dword ptr [edx+60]
 004E9060    test        al,al
>004E9062    je          004E908B
 004E9064    test        esi,esi
>004E9066    jne         004E9077
 004E9068    movzx       eax,byte ptr [ebx+2E4]
 004E906F    mov         byte ptr [ebx+299],al
>004E9075    jmp         004E908B
 004E9077    movzx       eax,byte ptr [ebx+299]
 004E907E    mov         byte ptr [ebx+2E4],al
 004E9084    mov         byte ptr [ebx+299],0
 004E908B    mov         ecx,edi
 004E908D    mov         edx,esi
 004E908F    mov         eax,ebx
 004E9091    call        TControl.DoDock
 004E9096    pop         edi
 004E9097    pop         esi
 004E9098    pop         ebx
 004E9099    ret
*}
end;

//004E909C
function TCustomForm.get_ActiveMDIChild:TForm;
begin
{*
 004E909C    push        ebx
 004E909D    mov         ebx,eax
 004E909F    xor         eax,eax
 004E90A1    cmp         byte ptr [ebx+29E],2
>004E90A8    jne         004E90CD
 004E90AA    cmp         dword ptr [ebx+37C],0
>004E90B1    je          004E90CD
 004E90B3    push        0
 004E90B5    push        0
 004E90B7    push        229
 004E90BC    mov         eax,dword ptr [ebx+37C]
 004E90C2    push        eax
 004E90C3    call        user32.SendMessageW
 004E90C8    call        FindControl
 004E90CD    pop         ebx
 004E90CE    ret
*}
end;

//004E90D0
function TCustomForm.get_MDIChildCount:Integer;
begin
{*
 004E90D0    push        ebx
 004E90D1    push        esi
 004E90D2    push        edi
 004E90D3    xor         edi,edi
 004E90D5    cmp         byte ptr [eax+29E],2
>004E90DC    jne         004E9115
 004E90DE    cmp         dword ptr [eax+37C],0
>004E90E5    je          004E9115
 004E90E7    mov         eax,[007932F0];Screen:TScreen
 004E90EC    call        TScreen.GetFormCount
 004E90F1    mov         ebx,eax
 004E90F3    dec         ebx
 004E90F4    test        ebx,ebx
>004E90F6    jl          004E9115
 004E90F8    inc         ebx
 004E90F9    xor         esi,esi
 004E90FB    mov         edx,esi
 004E90FD    mov         eax,[007932F0];Screen:TScreen
 004E9102    call        TScreen.GetForm
 004E9107    cmp         byte ptr [eax+29E],1
>004E910E    jne         004E9111
 004E9110    inc         edi
 004E9111    inc         esi
 004E9112    dec         ebx
>004E9113    jne         004E90FB
 004E9115    mov         eax,edi
 004E9117    pop         edi
 004E9118    pop         esi
 004E9119    pop         ebx
 004E911A    ret
*}
end;

//004E911C
function TCustomForm.get_MDIChildren(I:Integer):TForm;
begin
{*
 004E911C    push        ebx
 004E911D    push        esi
 004E911E    push        edi
 004E911F    mov         edi,edx
 004E9121    cmp         byte ptr [eax+29E],2
>004E9128    jne         004E9165
 004E912A    cmp         dword ptr [eax+37C],0
>004E9131    je          004E9165
 004E9133    mov         eax,[007932F0];Screen:TScreen
 004E9138    call        TScreen.GetFormCount
 004E913D    mov         ebx,eax
 004E913F    dec         ebx
 004E9140    test        ebx,ebx
>004E9142    jl          004E9165
 004E9144    inc         ebx
 004E9145    xor         esi,esi
 004E9147    mov         edx,esi
 004E9149    mov         eax,[007932F0];Screen:TScreen
 004E914E    call        TScreen.GetForm
 004E9153    cmp         byte ptr [eax+29E],1
>004E915A    jne         004E9161
 004E915C    dec         edi
 004E915D    test        edi,edi
>004E915F    jl          004E9167
 004E9161    inc         esi
 004E9162    dec         ebx
>004E9163    jne         004E9147
 004E9165    xor         eax,eax
 004E9167    pop         edi
 004E9168    pop         esi
 004E9169    pop         ebx
 004E916A    ret
*}
end;

//004E916C
function EnumMonitorsProc(hm:HMONITOR; dc:HDC; r:PRect; Data:Pointer):Boolean; stdcall;
begin
{*
 004E916C    push        ebp
 004E916D    mov         ebp,esp
 004E916F    push        ebx
 004E9170    mov         ebx,dword ptr [ebp+14]
 004E9173    mov         dl,1
 004E9175    mov         eax,[004E2338];TMonitor
 004E917A    call        TObject.Create
 004E917F    mov         edx,dword ptr [ebp+8]
 004E9182    mov         dword ptr [eax+4],edx
 004E9185    mov         edx,dword ptr [ebx+8]
 004E9188    mov         dword ptr [eax+8],edx
 004E918B    mov         edx,eax
 004E918D    mov         eax,ebx
 004E918F    call        TList.Add
 004E9194    mov         al,1
 004E9196    pop         ebx
 004E9197    pop         ebp
 004E9198    ret         10
*}
end;

//004E919C
function TCustomForm.GetMonitor:TMonitor;
begin
{*
 004E919C    push        ebx
 004E919D    push        esi
 004E919E    push        edi
 004E919F    push        ebp
 004E91A0    mov         ebx,eax
 004E91A2    xor         ebp,ebp
 004E91A4    push        2
 004E91A6    mov         eax,ebx
 004E91A8    call        TWinControl.GetHandle
 004E91AD    push        eax
 004E91AE    call        user32.MonitorFromWindow
 004E91B3    mov         edi,eax
 004E91B5    mov         eax,[007932F0];Screen:TScreen
 004E91BA    call        TScreen.GetMonitorCount
 004E91BF    mov         esi,eax
 004E91C1    dec         esi
 004E91C2    test        esi,esi
>004E91C4    jl          004E91EE
 004E91C6    inc         esi
 004E91C7    xor         ebx,ebx
 004E91C9    mov         edx,ebx
 004E91CB    mov         eax,[007932F0];Screen:TScreen
 004E91D0    call        TScreen.GetMonitor
 004E91D5    cmp         edi,dword ptr [eax+4]
>004E91D8    jne         004E91EA
 004E91DA    mov         edx,ebx
 004E91DC    mov         eax,[007932F0];Screen:TScreen
 004E91E1    call        TScreen.GetMonitor
 004E91E6    mov         ebp,eax
>004E91E8    jmp         004E9231
 004E91EA    inc         ebx
 004E91EB    dec         esi
>004E91EC    jne         004E91C9
 004E91EE    mov         eax,[007932F0];Screen:TScreen
 004E91F3    call        TScreen.GetMonitors
 004E91F8    mov         eax,[007932F0];Screen:TScreen
 004E91FD    call        TScreen.GetMonitorCount
 004E9202    mov         esi,eax
 004E9204    dec         esi
 004E9205    test        esi,esi
>004E9207    jl          004E9231
 004E9209    inc         esi
 004E920A    xor         ebx,ebx
 004E920C    mov         edx,ebx
 004E920E    mov         eax,[007932F0];Screen:TScreen
 004E9213    call        TScreen.GetMonitor
 004E9218    cmp         edi,dword ptr [eax+4]
>004E921B    jne         004E922D
 004E921D    mov         edx,ebx
 004E921F    mov         eax,[007932F0];Screen:TScreen
 004E9224    call        TScreen.GetMonitor
 004E9229    mov         ebp,eax
>004E922B    jmp         004E9231
 004E922D    inc         ebx
 004E922E    dec         esi
>004E922F    jne         004E920C
 004E9231    mov         eax,ebp
 004E9233    pop         ebp
 004E9234    pop         edi
 004E9235    pop         esi
 004E9236    pop         ebx
 004E9237    ret
*}
end;

//004E9238
function TCustomForm.GetCanvas:TCanvas;
begin
{*
 004E9238    mov         eax,dword ptr [eax+2A4]
 004E923E    ret
*}
end;

//004E9240
procedure TCustomForm.SetIcon(Value:TIcon);
begin
{*
 004E9240    mov         eax,dword ptr [eax+2AC]
 004E9246    mov         ecx,dword ptr [eax]
 004E9248    call        dword ptr [ecx+8]
 004E924B    ret
*}
end;

//004E924C
function TCustomForm.IsForm(Value:TWinControl):Boolean;
begin
{*
 004E924C    movzx       eax,byte ptr [eax+60]
 004E9250    xor         al,1
 004E9252    ret
*}
end;

//004E9254
function TCustomForm.IsIconStored(Value:TIcon):Boolean;
begin
{*
 004E9254    push        ebx
 004E9255    mov         ebx,eax
 004E9257    mov         eax,ebx
 004E9259    call        TCustomForm.IsForm
 004E925E    test        al,al
>004E9260    je          004E9271
 004E9262    mov         eax,dword ptr [ebx+2AC]
 004E9268    call        TIcon.GetHandle
 004E926D    test        eax,eax
>004E926F    jne         004E9275
 004E9271    xor         eax,eax
 004E9273    pop         ebx
 004E9274    ret
 004E9275    mov         al,1
 004E9277    pop         ebx
 004E9278    ret
*}
end;

//004E927C
procedure TCustomForm.SetFormStyle(Value:TFormStyle);
begin
{*
 004E927C    push        ebp
 004E927D    mov         ebp,esp
 004E927F    add         esp,0FFFFFFF8
 004E9282    push        ebx
 004E9283    mov         ebx,edx
 004E9285    mov         dword ptr [ebp-4],eax
 004E9288    mov         eax,dword ptr [ebp-4]
 004E928B    cmp         bl,byte ptr [eax+29E]
>004E9291    je          004E93EB
 004E9297    test        bl,bl
>004E9299    jne         004E92A7
 004E929B    mov         eax,dword ptr [ebp-4]
 004E929E    cmp         byte ptr [eax+29E],3
>004E92A5    je          004E92B8
 004E92A7    cmp         bl,3
>004E92AA    jne         004E9316
 004E92AC    mov         eax,dword ptr [ebp-4]
 004E92AF    cmp         byte ptr [eax+29E],0
>004E92B6    jne         004E9316
 004E92B8    mov         eax,dword ptr [ebp-4]
 004E92BB    mov         byte ptr [eax+29E],bl
 004E92C1    mov         eax,dword ptr [ebp-4]
 004E92C4    test        byte ptr [eax+1C],10
>004E92C8    jne         004E93EB
 004E92CE    mov         eax,dword ptr [ebp-4]
 004E92D1    call        TWinControl.HandleAllocated
 004E92D6    test        al,al
>004E92D8    je          004E93EB
 004E92DE    push        213
 004E92E3    push        0
 004E92E5    push        0
 004E92E7    push        0
 004E92E9    push        0
 004E92EB    mov         eax,dword ptr [ebp-4]
 004E92EE    cmp         byte ptr [eax+29E],3
 004E92F5    sete        al
 004E92F8    and         eax,7F
 004E92FB    mov         eax,dword ptr [eax*4+786758]
 004E9302    push        eax
 004E9303    mov         eax,dword ptr [ebp-4]
 004E9306    call        TWinControl.GetHandle
 004E930B    push        eax
 004E930C    call        user32.SetWindowPos
>004E9311    jmp         004E93EB
 004E9316    cmp         bl,1
>004E9319    jne         004E9331
 004E931B    mov         eax,dword ptr [ebp-4]
 004E931E    cmp         byte ptr [eax+29F],0
>004E9325    jne         004E9331
 004E9327    mov         dl,1
 004E9329    mov         eax,dword ptr [ebp-4]
 004E932C    call        TCustomForm.SetPosition
 004E9331    mov         eax,dword ptr [ebp-4]
 004E9334    test        byte ptr [eax+1C],10
 004E9338    setne       al
 004E933B    xor         al,1
 004E933D    mov         byte ptr [ebp-5],al
 004E9340    cmp         byte ptr [ebp-5],0
>004E9344    je          004E9350
 004E9346    mov         dl,1
 004E9348    mov         eax,dword ptr [ebp-4]
 004E934B    call        TWinControl.UpdateRecreatingFlag
 004E9350    xor         edx,edx
 004E9352    push        ebp
 004E9353    push        4E93E4
 004E9358    push        dword ptr fs:[edx]
 004E935B    mov         dword ptr fs:[edx],esp
 004E935E    cmp         byte ptr [ebp-5],0
>004E9362    je          004E936F
 004E9364    mov         eax,dword ptr [ebp-4]
 004E9367    mov         edx,dword ptr [eax]
 004E9369    call        dword ptr [edx+0C0]
 004E936F    mov         eax,dword ptr [ebp-4]
 004E9372    movzx       eax,byte ptr [eax+29E]
 004E9379    mov         edx,dword ptr [ebp-4]
 004E937C    mov         byte ptr [edx+29E],bl
 004E9382    cmp         bl,2
>004E9385    je          004E938B
 004E9387    cmp         al,2
>004E9389    jne         004E93A9
 004E938B    mov         eax,dword ptr [ebp-4]
 004E938E    cmp         byte ptr [eax+1E9],0
>004E9395    jne         004E93A9
 004E9397    mov         eax,dword ptr [ebp-4]
 004E939A    call        TCustomForm.NormalColor
 004E939F    mov         edx,eax
 004E93A1    mov         eax,dword ptr [ebp-4]
 004E93A4    call        TControl.SetColor
 004E93A9    cmp         byte ptr [ebp-5],0
>004E93AD    je          004E93B7
 004E93AF    mov         eax,dword ptr [ebp-4]
 004E93B2    call        TWinControl.UpdateControlState
 004E93B7    cmp         bl,1
>004E93BA    jne         004E93C6
 004E93BC    mov         dl,1
 004E93BE    mov         eax,dword ptr [ebp-4]
 004E93C1    call        TCustomForm.SetVisible
 004E93C6    xor         eax,eax
 004E93C8    pop         edx
 004E93C9    pop         ecx
 004E93CA    pop         ecx
 004E93CB    mov         dword ptr fs:[eax],edx
 004E93CE    push        4E93EB
 004E93D3    cmp         byte ptr [ebp-5],0
>004E93D7    je          004E93E3
 004E93D9    xor         edx,edx
 004E93DB    mov         eax,dword ptr [ebp-4]
 004E93DE    call        TWinControl.UpdateRecreatingFlag
 004E93E3    ret
>004E93E4    jmp         @HandleFinally
>004E93E9    jmp         004E93D3
 004E93EB    pop         ebx
 004E93EC    pop         ecx
 004E93ED    pop         ecx
 004E93EE    pop         ebp
 004E93EF    ret
*}
end;

//004E93F0
procedure TCustomForm.RefreshMDIMenu;
begin
{*
 004E93F0    push        ebx
 004E93F1    push        esi
 004E93F2    push        edi
 004E93F3    push        ebp
 004E93F4    mov         ebp,eax
 004E93F6    cmp         byte ptr [ebp+29E],2
>004E93FD    jne         004E9464
 004E93FF    cmp         dword ptr [ebp+37C],0
>004E9406    je          004E9464
 004E9408    xor         esi,esi
 004E940A    mov         eax,dword ptr [ebp+2B4]
 004E9410    test        eax,eax
>004E9412    je          004E941B
 004E9414    mov         edx,dword ptr [eax]
 004E9416    call        dword ptr [edx+38]
 004E9419    mov         esi,eax
 004E941B    xor         edi,edi
 004E941D    mov         eax,dword ptr [ebp+2C0]
 004E9423    test        eax,eax
>004E9425    je          004E942E
 004E9427    call        TMenuItem.GetHandle
 004E942C    mov         edi,eax
 004E942E    mov         eax,ebp
 004E9430    call        TWinControl.GetHandle
 004E9435    push        eax
 004E9436    call        user32.GetMenu
 004E943B    cmp         esi,eax
 004E943D    setne       bl
 004E9440    push        edi
 004E9441    push        esi
 004E9442    push        230
 004E9447    mov         eax,dword ptr [ebp+37C]
 004E944D    push        eax
 004E944E    call        user32.SendMessageW
 004E9453    test        bl,bl
>004E9455    je          004E9464
 004E9457    mov         eax,ebp
 004E9459    call        TWinControl.GetHandle
 004E945E    push        eax
 004E945F    call        user32.DrawMenuBar
 004E9464    pop         ebp
 004E9465    pop         edi
 004E9466    pop         esi
 004E9467    pop         ebx
 004E9468    ret
*}
end;

//004E946C
procedure TCustomForm.SetObjectMenuItem(Value:TMenuItem);
begin
{*
 004E946C    push        ebx
 004E946D    mov         ebx,edx
 004E946F    mov         dword ptr [eax+2C8],ebx
 004E9475    test        ebx,ebx
>004E9477    je          004E948B
 004E9479    mov         edx,eax
 004E947B    mov         eax,ebx
 004E947D    call        TComponent.FreeNotification
 004E9482    xor         edx,edx
 004E9484    mov         eax,ebx
 004E9486    call        TMenuItem.SetEnabled
 004E948B    pop         ebx
 004E948C    ret
*}
end;

//004E9490
procedure TCustomForm.SetWindowMenu(Value:TMenuItem);
begin
{*
 004E9490    push        ebx
 004E9491    mov         ebx,eax
 004E9493    cmp         edx,dword ptr [ebx+2C0]
>004E9499    je          004E94B5
 004E949B    mov         dword ptr [ebx+2C0],edx
 004E94A1    test        edx,edx
>004E94A3    je          004E94AE
 004E94A5    mov         eax,edx
 004E94A7    mov         edx,ebx
 004E94A9    call        TComponent.FreeNotification
 004E94AE    mov         eax,ebx
 004E94B0    call        TCustomForm.RefreshMDIMenu
 004E94B5    pop         ebx
 004E94B6    ret
*}
end;

//004E94B8
procedure TCustomForm.SetMenu(Value:TMainMenu);
begin
{*
 004E94B8    push        ebp
 004E94B9    mov         ebp,esp
 004E94BB    add         esp,0FFFFFFF0
 004E94BE    push        ebx
 004E94BF    push        esi
 004E94C0    push        edi
 004E94C1    xor         ecx,ecx
 004E94C3    mov         dword ptr [ebp-10],ecx
 004E94C6    mov         esi,edx
 004E94C8    mov         ebx,eax
 004E94CA    xor         eax,eax
 004E94CC    push        ebp
 004E94CD    push        4E96CC
 004E94D2    push        dword ptr fs:[eax]
 004E94D5    mov         dword ptr fs:[eax],esp
 004E94D8    test        esi,esi
>004E94DA    je          004E954C
 004E94DC    mov         eax,[007932F0];Screen:TScreen
 004E94E1    call        TScreen.GetFormCount
 004E94E6    dec         eax
 004E94E7    test        eax,eax
>004E94E9    jl          004E954C
 004E94EB    inc         eax
 004E94EC    mov         dword ptr [ebp-4],eax
 004E94EF    xor         edi,edi
 004E94F1    mov         edx,edi
 004E94F3    mov         eax,[007932F0];Screen:TScreen
 004E94F8    call        TScreen.GetForm
 004E94FD    cmp         esi,dword ptr [eax+2B4]
>004E9503    jne         004E9546
 004E9505    mov         edx,edi
 004E9507    mov         eax,[007932F0];Screen:TScreen
 004E950C    call        TScreen.GetForm
 004E9511    cmp         ebx,eax
>004E9513    je          004E9546
 004E9515    mov         eax,dword ptr [esi+8]
 004E9518    mov         dword ptr [ebp-0C],eax
 004E951B    mov         byte ptr [ebp-8],11
 004E951F    lea         eax,[ebp-0C]
 004E9522    push        eax
 004E9523    push        0
 004E9525    lea         edx,[ebp-10]
 004E9528    mov         eax,[0078CF80];^SResString287:TResStringRec
 004E952D    call        LoadResString
 004E9532    mov         ecx,dword ptr [ebp-10]
 004E9535    mov         dl,1
 004E9537    mov         eax,[00439268];EInvalidOperation
 004E953C    call        Exception.CreateFmt
 004E9541    call        @RaiseExcept
 004E9546    inc         edi
 004E9547    dec         dword ptr [ebp-4]
>004E954A    jne         004E94F1
 004E954C    mov         eax,dword ptr [ebx+2B4]
 004E9552    test        eax,eax
>004E9554    je          004E955D
 004E9556    xor         edx,edx
 004E9558    call        TMenu.SetWindowHandle
 004E955D    test        byte ptr [ebx+1C],8
>004E9561    jne         004E956D
 004E9563    test        esi,esi
>004E9565    je          004E956F
 004E9567    test        byte ptr [esi+1C],8
>004E956B    je          004E956F
 004E956D    xor         esi,esi
 004E956F    mov         dword ptr [ebx+2B4],esi
 004E9575    test        esi,esi
>004E9577    je          004E9582
 004E9579    mov         edx,ebx
 004E957B    mov         eax,esi
 004E957D    call        TComponent.FreeNotification
 004E9582    test        esi,esi
>004E9584    je          004E9635
 004E958A    test        byte ptr [ebx+1C],10
>004E958E    jne         004E959D
 004E9590    cmp         byte ptr [ebx+299],3
>004E9597    je          004E9635
 004E959D    mov         eax,dword ptr [ebx+2B4]
 004E95A3    cmp         byte ptr [eax+64],0
>004E95A7    jne         004E95B2
 004E95A9    cmp         byte ptr [ebx+29E],1
>004E95B0    jne         004E95B8
 004E95B2    test        byte ptr [ebx+1C],10
>004E95B6    je          004E9610
 004E95B8    mov         eax,ebx
 004E95BA    call        TWinControl.HandleAllocated
 004E95BF    test        al,al
>004E95C1    je          004E964F
 004E95C7    mov         eax,dword ptr [ebx+2B4]
 004E95CD    mov         edx,dword ptr [eax]
 004E95CF    call        dword ptr [edx+38]
 004E95D2    mov         edi,eax
 004E95D4    mov         eax,ebx
 004E95D6    call        TWinControl.GetHandle
 004E95DB    push        eax
 004E95DC    call        user32.GetMenu
 004E95E1    cmp         edi,eax
>004E95E3    je          004E95FE
 004E95E5    mov         eax,dword ptr [ebx+2B4]
 004E95EB    mov         edx,dword ptr [eax]
 004E95ED    call        dword ptr [edx+38]
 004E95F0    push        eax
 004E95F1    mov         eax,ebx
 004E95F3    call        TWinControl.GetHandle
 004E95F8    push        eax
 004E95F9    call        user32.SetMenu
 004E95FE    mov         eax,ebx
 004E9600    call        TWinControl.GetHandle
 004E9605    mov         edx,eax
 004E9607    mov         eax,esi
 004E9609    call        TMenu.SetWindowHandle
>004E960E    jmp         004E964F
 004E9610    cmp         byte ptr [ebx+29E],1
>004E9617    je          004E964F
 004E9619    mov         eax,ebx
 004E961B    call        TWinControl.HandleAllocated
 004E9620    test        al,al
>004E9622    je          004E964F
 004E9624    push        0
 004E9626    mov         eax,ebx
 004E9628    call        TWinControl.GetHandle
 004E962D    push        eax
 004E962E    call        user32.SetMenu
>004E9633    jmp         004E964F
 004E9635    mov         eax,ebx
 004E9637    call        TWinControl.HandleAllocated
 004E963C    test        al,al
>004E963E    je          004E964F
 004E9640    push        0
 004E9642    mov         eax,ebx
 004E9644    call        TWinControl.GetHandle
 004E9649    push        eax
 004E964A    call        user32.SetMenu
 004E964F    cmp         byte ptr [ebx+29D],0
>004E9656    je          004E9661
 004E9658    mov         dl,1
 004E965A    mov         eax,ebx
 004E965C    call        TCustomForm.MergeMenu
 004E9661    mov         eax,ebx
 004E9663    call        TCustomForm.RefreshMDIMenu
 004E9668    cmp         dword ptr [ebx+2BC],0
>004E966F    je          004E96B6
 004E9671    test        byte ptr [ebx+1C],10
>004E9675    je          004E96B6
 004E9677    cmp         dword ptr [ebx+34],0
>004E967B    je          004E96B6
 004E967D    push        37
 004E967F    push        0
 004E9681    push        0
 004E9683    push        0
 004E9685    push        0
 004E9687    push        0
 004E9689    mov         eax,ebx
 004E968B    call        TWinControl.GetHandle
 004E9690    push        eax
 004E9691    call        user32.SetWindowPos
 004E9696    push        0
 004E9698    xor         ecx,ecx
 004E969A    mov         edx,85
 004E969F    mov         eax,ebx
 004E96A1    call        TControl.Perform
 004E96A6    push        0
 004E96A8    xor         ecx,ecx
 004E96AA    mov         edx,0F
 004E96AF    mov         eax,ebx
 004E96B1    call        TControl.Perform
 004E96B6    xor         eax,eax
 004E96B8    pop         edx
 004E96B9    pop         ecx
 004E96BA    pop         ecx
 004E96BB    mov         dword ptr fs:[eax],edx
 004E96BE    push        4E96D3
 004E96C3    lea         eax,[ebp-10]
 004E96C6    call        @UStrClr
 004E96CB    ret
>004E96CC    jmp         @HandleFinally
>004E96D1    jmp         004E96C3
 004E96D3    pop         edi
 004E96D4    pop         esi
 004E96D5    pop         ebx
 004E96D6    mov         esp,ebp
 004E96D8    pop         ebp
 004E96D9    ret
*}
end;

//004E96DC
function TCustomForm.GetPixelsPerInch:Integer;
begin
{*
 004E96DC    mov         eax,dword ptr [eax+2C4]
 004E96E2    test        eax,eax
>004E96E4    jne         004E96EE
 004E96E6    mov         eax,[007932F0];Screen:TScreen
 004E96EB    mov         eax,dword ptr [eax+44]
 004E96EE    ret
*}
end;

//004E96F0
function TCustomForm.GetPopupChildren:TList;
begin
{*
 004E96F0    push        ebx
 004E96F1    mov         ebx,eax
 004E96F3    cmp         dword ptr [ebx+344],0
>004E96FA    jne         004E970E
 004E96FC    mov         dl,1
 004E96FE    mov         eax,[00439644];TList
 004E9703    call        TObject.Create
 004E9708    mov         dword ptr [ebx+344],eax
 004E970E    mov         eax,dword ptr [ebx+344]
 004E9714    pop         ebx
 004E9715    ret
*}
end;

//004E9718
function TCustomForm.GetRecreateChildren:TList;
begin
{*
 004E9718    push        ebx
 004E9719    mov         ebx,eax
 004E971B    cmp         dword ptr [ebx+350],0
>004E9722    jne         004E9736
 004E9724    mov         dl,1
 004E9726    mov         eax,[00439644];TList
 004E972B    call        TObject.Create
 004E9730    mov         dword ptr [ebx+350],eax
 004E9736    mov         eax,dword ptr [ebx+350]
 004E973C    pop         ebx
 004E973D    ret
*}
end;

//004E9740
procedure TCustomForm.SetPixelsPerInch(Value:Integer);
begin
{*
 004E9740    push        ebx
 004E9741    push        esi
 004E9742    mov         esi,edx
 004E9744    mov         ebx,eax
 004E9746    mov         eax,ebx
 004E9748    call        TCustomForm.GetPixelsPerInch
 004E974D    cmp         esi,eax
>004E974F    je          004E976F
 004E9751    test        esi,esi
>004E9753    je          004E975A
 004E9755    cmp         esi,24
>004E9758    jl          004E976F
 004E975A    test        byte ptr [ebx+1C],1
>004E975E    je          004E9769
 004E9760    cmp         dword ptr [ebx+2C4],0
>004E9767    je          004E976F
 004E9769    mov         dword ptr [ebx+2C4],esi
 004E976F    pop         esi
 004E9770    pop         ebx
 004E9771    ret
*}
end;

//004E9774
procedure TCustomForm.SetPosition(Value:TPosition);
begin
{*
 004E9774    cmp         dl,byte ptr [eax+29F]
>004E977A    je          004E978D
 004E977C    mov         byte ptr [eax+29F],dl
 004E9782    test        byte ptr [eax+1C],10
>004E9786    jne         004E978D
 004E9788    call        TWinControl.RecreateWnd
 004E978D    ret
*}
end;

//004E9790
procedure TCustomForm.SetPopupMode(Value:TPopupMode);
begin
{*
 004E9790    push        ebx
 004E9791    mov         ebx,eax
 004E9793    cmp         dl,byte ptr [ebx+348]
>004E9799    je          004E97E0
 004E979B    mov         byte ptr [ebx+348],dl
 004E97A1    cmp         dl,1
>004E97A4    jne         004E97B8
 004E97A6    cmp         dword ptr [ebx+34C],0
>004E97AD    je          004E97B8
 004E97AF    xor         edx,edx
 004E97B1    mov         eax,ebx
 004E97B3    call        TCustomForm.set_PopupParent
 004E97B8    xor         eax,eax
 004E97BA    mov         dword ptr [ebx+358],eax
 004E97C0    xor         eax,eax
 004E97C2    mov         dword ptr [ebx+35C],eax
 004E97C8    mov         eax,ebx
 004E97CA    call        TWinControl.HandleAllocated
 004E97CF    test        al,al
>004E97D1    je          004E97E0
 004E97D3    test        byte ptr [ebx+1C],10
>004E97D7    jne         004E97E0
 004E97D9    mov         eax,ebx
 004E97DB    call        TWinControl.RecreateWnd
 004E97E0    pop         ebx
 004E97E1    ret
*}
end;

//004E97E4
procedure TCustomForm.set_PopupParent(Value:TCustomForm);
begin
{*
 004E97E4    push        ebx
 004E97E5    push        esi
 004E97E6    mov         esi,edx
 004E97E8    mov         ebx,eax
 004E97EA    mov         eax,dword ptr [ebx+34C]
 004E97F0    cmp         esi,eax
>004E97F2    je          004E9845
 004E97F4    cmp         ebx,esi
>004E97F6    je          004E9845
 004E97F8    test        eax,eax
>004E97FA    je          004E9803
 004E97FC    mov         edx,ebx
 004E97FE    call        TComponent.RemoveFreeNotification
 004E9803    mov         dword ptr [ebx+34C],esi
 004E9809    test        esi,esi
>004E980B    je          004E981D
 004E980D    mov         edx,ebx
 004E980F    mov         eax,esi
 004E9811    call        TComponent.FreeNotification
 004E9816    mov         byte ptr [ebx+348],2
 004E981D    xor         eax,eax
 004E981F    mov         dword ptr [ebx+358],eax
 004E9825    xor         eax,eax
 004E9827    mov         dword ptr [ebx+35C],eax
 004E982D    mov         eax,ebx
 004E982F    call        TWinControl.HandleAllocated
 004E9834    test        al,al
>004E9836    je          004E9845
 004E9838    test        byte ptr [ebx+1C],10
>004E983C    jne         004E9845
 004E983E    mov         eax,ebx
 004E9840    call        TWinControl.RecreateWnd
 004E9845    pop         esi
 004E9846    pop         ebx
 004E9847    ret
*}
end;

//004E9848
function TCustomForm.GetScaled:Boolean;
begin
{*
 004E9848    cmp         dword ptr [eax+2C4],0
 004E984F    setne       al
 004E9852    ret
*}
end;

//004E9854
procedure TCustomForm.SetScaled(Value:Boolean);
begin
{*
 004E9854    push        ebx
 004E9855    push        esi
 004E9856    mov         ebx,edx
 004E9858    mov         esi,eax
 004E985A    mov         eax,esi
 004E985C    call        TCustomForm.GetScaled
 004E9861    cmp         bl,al
>004E9863    je          004E987F
 004E9865    xor         eax,eax
 004E9867    mov         dword ptr [esi+2C4],eax
 004E986D    test        bl,bl
>004E986F    je          004E987F
 004E9871    mov         eax,[007932F0];Screen:TScreen
 004E9876    mov         eax,dword ptr [eax+44]
 004E9879    mov         dword ptr [esi+2C4],eax
 004E987F    pop         esi
 004E9880    pop         ebx
 004E9881    ret
*}
end;

//004E9884
procedure TCustomForm.CMColorChanged(var Message:TMessage);
begin
{*
 004E9884    push        ebx
 004E9885    mov         ebx,eax
 004E9887    mov         eax,ebx
 004E9889    call        TWinControl.CMColorChanged
 004E988E    mov         eax,dword ptr [ebx+2A4]
 004E9894    test        eax,eax
>004E9896    je          004E98B3
 004E9898    mov         eax,dword ptr [eax+48]
 004E989B    mov         edx,dword ptr [ebx+6C]
 004E989E    call        TBrush.SetColor
 004E98A3    push        0
 004E98A5    xor         ecx,ecx
 004E98A7    mov         edx,0B03B
 004E98AC    mov         eax,ebx
 004E98AE    call        TControl.Perform
 004E98B3    pop         ebx
 004E98B4    ret
*}
end;

//004E98B8
function TCustomForm.NormalColor:TColor;
begin
{*
 004E98B8    mov         edx,0FF000005
 004E98BD    cmp         byte ptr [eax+29E],2
>004E98C4    jne         004E98CB
 004E98C6    mov         edx,0FF00000C
 004E98CB    mov         eax,edx
 004E98CD    ret
*}
end;

//004E98D0
procedure TCustomForm.CMCtl3DChanged(var Message:TMessage);
begin
{*
 004E98D0    push        ebx
 004E98D1    mov         ebx,eax
 004E98D3    mov         eax,ebx
 004E98D5    call        TWinControl.CMCtl3DChanged
 004E98DA    cmp         byte ptr [ebx+1E9],0
>004E98E1    je          004E98FD
 004E98E3    mov         eax,ebx
 004E98E5    call        TCustomForm.NormalColor
 004E98EA    cmp         eax,dword ptr [ebx+6C]
>004E98ED    jne         004E9916
 004E98EF    mov         edx,0FF00000F
 004E98F4    mov         eax,ebx
 004E98F6    call        TControl.SetColor
 004E98FB    pop         ebx
 004E98FC    ret
 004E98FD    cmp         dword ptr [ebx+6C],0FF00000F
>004E9904    jne         004E9916
 004E9906    mov         eax,ebx
 004E9908    call        TCustomForm.NormalColor
 004E990D    mov         edx,eax
 004E990F    mov         eax,ebx
 004E9911    call        TControl.SetColor
 004E9916    pop         ebx
 004E9917    ret
*}
end;

//004E9918
procedure TCustomForm.CMFontChanged(var Message:TMessage);
begin
{*
 004E9918    push        ebx
 004E9919    mov         ebx,eax
 004E991B    mov         eax,ebx
 004E991D    call        TWinControl.CMFontChanged
 004E9922    mov         eax,dword ptr [ebx+2A4]
 004E9928    test        eax,eax
>004E992A    je          004E9934
 004E992C    mov         edx,dword ptr [ebx+64]
 004E992F    call        TCanvas.SetFont
 004E9934    pop         ebx
 004E9935    ret
*}
end;

//004E9938
procedure TCustomForm.CMMenuChanged(var Message:TMessage);
begin
{*
 004E9938    push        ebx
 004E9939    mov         ebx,eax
 004E993B    mov         eax,ebx
 004E993D    call        TCustomForm.RefreshMDIMenu
 004E9942    mov         edx,dword ptr [ebx+2B4]
 004E9948    mov         eax,ebx
 004E994A    call        TCustomForm.SetMenu
 004E994F    pop         ebx
 004E9950    ret
*}
end;

//004E9954
procedure TCustomForm.SetWindowState(Value:TWindowState);
begin
{*
 004E9954    push        ebx
 004E9955    push        esi
 004E9956    mov         ebx,edx
 004E9958    mov         esi,eax
 004E995A    cmp         bl,byte ptr [esi+29A]
>004E9960    je          004E998F
 004E9962    mov         byte ptr [esi+29A],bl
 004E9968    test        byte ptr [esi+1C],10
>004E996C    jne         004E998F
 004E996E    cmp         byte ptr [esi+1EA],0
>004E9975    je          004E998F
 004E9977    movzx       eax,bl
 004E997A    mov         eax,dword ptr [eax*4+786760]
 004E9981    push        eax
 004E9982    mov         eax,esi
 004E9984    call        TWinControl.GetHandle
 004E9989    push        eax
 004E998A    call        user32.ShowWindow
 004E998F    pop         esi
 004E9990    pop         ebx
 004E9991    ret
*}
end;

//004E9994
procedure TCustomForm.SetWindowToMonitor;
begin
{*
 004E9994    push        ebx
 004E9995    push        esi
 004E9996    push        edi
 004E9997    push        ebp
 004E9998    add         esp,0FFFFFFDC
 004E999B    mov         ebx,eax
 004E999D    movzx       eax,byte ptr [ebx+2A0]
 004E99A4    test        al,al
>004E99A6    je          004E9D2A
 004E99AC    mov         edx,dword ptr ds:[7932EC];Application:TApplication
 004E99B2    cmp         dword ptr [edx+44],0
>004E99B6    je          004E9D2A
 004E99BC    xor         edx,edx
 004E99BE    mov         dword ptr [esp],edx
 004E99C1    cmp         al,2
>004E99C3    jne         004E99DA
 004E99C5    mov         eax,[007932EC];Application:TApplication
 004E99CA    mov         eax,dword ptr [eax+44]
 004E99CD    call        TCustomForm.GetMonitor
 004E99D2    mov         eax,dword ptr [eax+4]
 004E99D5    mov         dword ptr [esp],eax
>004E99D8    jmp         004E9A1A
 004E99DA    movzx       eax,byte ptr [ebx+2A0]
 004E99E1    cmp         al,3
>004E99E3    jne         004E9A06
 004E99E5    mov         edx,dword ptr ds:[7932F0];Screen:TScreen
 004E99EB    cmp         dword ptr [edx+64],0
>004E99EF    je          004E9A06
 004E99F1    mov         eax,[007932F0];Screen:TScreen
 004E99F6    mov         eax,dword ptr [eax+64]
 004E99F9    call        TCustomForm.GetMonitor
 004E99FE    mov         eax,dword ptr [eax+4]
 004E9A01    mov         dword ptr [esp],eax
>004E9A04    jmp         004E9A1A
 004E9A06    cmp         al,1
>004E9A08    jne         004E9A1A
 004E9A0A    mov         eax,[007932F0];Screen:TScreen
 004E9A0F    call        TScreen.GetPrimaryMonitor
 004E9A14    mov         eax,dword ptr [eax+4]
 004E9A17    mov         dword ptr [esp],eax
 004E9A1A    mov         eax,ebx
 004E9A1C    call        TCustomForm.GetMonitor
 004E9A21    mov         eax,dword ptr [eax+4]
 004E9A24    mov         dword ptr [esp+4],eax
 004E9A28    mov         eax,[007932F0];Screen:TScreen
 004E9A2D    call        TScreen.GetMonitorCount
 004E9A32    dec         eax
 004E9A33    test        eax,eax
>004E9A35    jl          004E9D2A
 004E9A3B    inc         eax
 004E9A3C    mov         dword ptr [esp+10],eax
 004E9A40    xor         esi,esi
 004E9A42    mov         edx,esi
 004E9A44    mov         eax,[007932F0];Screen:TScreen
 004E9A49    call        TScreen.GetMonitor
 004E9A4E    mov         eax,dword ptr [eax+4]
 004E9A51    cmp         eax,dword ptr [esp]
>004E9A54    jne         004E9D1F
 004E9A5A    mov         eax,dword ptr [esp]
 004E9A5D    cmp         eax,dword ptr [esp+4]
>004E9A61    je          004E9CC4
 004E9A67    mov         eax,[007932F0];Screen:TScreen
 004E9A6C    call        TScreen.GetMonitorCount
 004E9A71    mov         edi,eax
 004E9A73    dec         edi
 004E9A74    test        edi,edi
>004E9A76    jl          004E9D1F
 004E9A7C    inc         edi
 004E9A7D    mov         dword ptr [esp+8],0
 004E9A85    mov         edx,dword ptr [esp+8]
 004E9A89    mov         eax,[007932F0];Screen:TScreen
 004E9A8E    call        TScreen.GetMonitor
 004E9A93    mov         eax,dword ptr [eax+4]
 004E9A96    cmp         eax,dword ptr [esp+4]
>004E9A9A    jne         004E9CB7
 004E9AA0    movzx       eax,byte ptr [ebx+29F]
 004E9AA7    cmp         al,4
>004E9AA9    jne         004E9B03
 004E9AAB    mov         edx,esi
 004E9AAD    mov         eax,[007932F0];Screen:TScreen
 004E9AB2    call        TScreen.GetMonitor
 004E9AB7    lea         edx,[esp+14]
 004E9ABB    call        TMonitor.GetWorkareaRect
 004E9AC0    mov         ecx,dword ptr [ebx+48]
 004E9AC3    push        ecx
 004E9AC4    mov         ecx,dword ptr [ebx+4C]
 004E9AC7    push        ecx
 004E9AC8    mov         ecx,dword ptr [esp+28]
 004E9ACC    mov         edx,dword ptr [esp+20]
 004E9AD0    sub         ecx,edx
 004E9AD2    sub         ecx,dword ptr [ebx+4C]
 004E9AD5    sar         ecx,1
>004E9AD7    jns         004E9ADC
 004E9AD9    adc         ecx,0
 004E9ADC    add         ecx,edx
 004E9ADE    mov         edx,dword ptr [esp+24]
 004E9AE2    mov         eax,dword ptr [esp+1C]
 004E9AE6    sub         edx,eax
 004E9AE8    sub         edx,dword ptr [ebx+48]
 004E9AEB    sar         edx,1
>004E9AED    jns         004E9AF2
 004E9AEF    adc         edx,0
 004E9AF2    add         edx,eax
 004E9AF4    mov         eax,ebx
 004E9AF6    mov         ebp,dword ptr [eax]
 004E9AF8    call        dword ptr [ebp+98]
>004E9AFE    jmp         004E9CB7
 004E9B03    cmp         al,6
>004E9B05    jne         004E9B81
 004E9B07    mov         eax,dword ptr [ebx+48]
 004E9B0A    push        eax
 004E9B0B    mov         ebp,dword ptr [ebx+4C]
 004E9B0E    push        ebp
 004E9B0F    mov         edx,esi
 004E9B11    mov         eax,[007932F0];Screen:TScreen
 004E9B16    call        TScreen.GetMonitor
 004E9B1B    call        TMonitor.GetTop
 004E9B20    push        eax
 004E9B21    mov         edx,esi
 004E9B23    mov         eax,[007932F0];Screen:TScreen
 004E9B28    call        TScreen.GetMonitor
 004E9B2D    call        TMonitor.GetHeight
 004E9B32    sub         eax,ebp
 004E9B34    sar         eax,1
>004E9B36    jns         004E9B3B
 004E9B38    adc         eax,0
 004E9B3B    pop         edx
 004E9B3C    add         edx,eax
 004E9B3E    push        edx
 004E9B3F    mov         edx,esi
 004E9B41    mov         eax,[007932F0];Screen:TScreen
 004E9B46    call        TScreen.GetMonitor
 004E9B4B    call        TMonitor.GetLeft
 004E9B50    mov         ebp,eax
 004E9B52    mov         edx,esi
 004E9B54    mov         eax,[007932F0];Screen:TScreen
 004E9B59    call        TScreen.GetMonitor
 004E9B5E    call        TMonitor.GetWidth
 004E9B63    sub         eax,dword ptr [ebx+48]
 004E9B66    sar         eax,1
>004E9B68    jns         004E9B6D
 004E9B6A    adc         eax,0
 004E9B6D    add         ebp,eax
 004E9B6F    mov         edx,ebp
 004E9B71    mov         eax,ebx
 004E9B73    pop         ecx
 004E9B74    mov         ebp,dword ptr [eax]
 004E9B76    call        dword ptr [ebp+98]
>004E9B7C    jmp         004E9CB7
 004E9B81    mov         edx,esi
 004E9B83    mov         eax,[007932F0];Screen:TScreen
 004E9B88    call        TScreen.GetMonitor
 004E9B8D    call        TMonitor.GetLeft
 004E9B92    mov         ebp,eax
 004E9B94    mov         eax,ebx
 004E9B96    call        TCustomForm.GetLeft
 004E9B9B    add         ebp,eax
 004E9B9D    mov         edx,dword ptr [esp+8]
 004E9BA1    mov         eax,[007932F0];Screen:TScreen
 004E9BA6    call        TScreen.GetMonitor
 004E9BAB    call        TMonitor.GetLeft
 004E9BB0    sub         ebp,eax
 004E9BB2    mov         edx,esi
 004E9BB4    mov         eax,[007932F0];Screen:TScreen
 004E9BB9    call        TScreen.GetMonitor
 004E9BBE    call        TMonitor.GetLeft
 004E9BC3    push        eax
 004E9BC4    mov         edx,esi
 004E9BC6    mov         eax,[007932F0];Screen:TScreen
 004E9BCB    call        TScreen.GetMonitor
 004E9BD0    call        TMonitor.GetWidth
 004E9BD5    pop         edx
 004E9BD6    add         edx,eax
 004E9BD8    mov         eax,dword ptr [ebx+48]
 004E9BDB    add         eax,ebp
 004E9BDD    cmp         edx,eax
>004E9BDF    jge         004E9C0A
 004E9BE1    mov         edx,esi
 004E9BE3    mov         eax,[007932F0];Screen:TScreen
 004E9BE8    call        TScreen.GetMonitor
 004E9BED    call        TMonitor.GetLeft
 004E9BF2    mov         ebp,eax
 004E9BF4    mov         edx,esi
 004E9BF6    mov         eax,[007932F0];Screen:TScreen
 004E9BFB    call        TScreen.GetMonitor
 004E9C00    call        TMonitor.GetWidth
 004E9C05    add         ebp,eax
 004E9C07    sub         ebp,dword ptr [ebx+48]
 004E9C0A    mov         edx,esi
 004E9C0C    mov         eax,[007932F0];Screen:TScreen
 004E9C11    call        TScreen.GetMonitor
 004E9C16    call        TMonitor.GetTop
 004E9C1B    push        eax
 004E9C1C    mov         eax,ebx
 004E9C1E    call        TCustomForm.GetTop
 004E9C23    pop         edx
 004E9C24    add         edx,eax
 004E9C26    push        edx
 004E9C27    mov         edx,dword ptr [esp+0C]
 004E9C2B    mov         eax,[007932F0];Screen:TScreen
 004E9C30    call        TScreen.GetMonitor
 004E9C35    call        TMonitor.GetTop
 004E9C3A    pop         edx
 004E9C3B    sub         edx,eax
 004E9C3D    mov         dword ptr [esp+0C],edx
 004E9C41    mov         edx,esi
 004E9C43    mov         eax,[007932F0];Screen:TScreen
 004E9C48    call        TScreen.GetMonitor
 004E9C4D    call        TMonitor.GetTop
 004E9C52    push        eax
 004E9C53    mov         edx,esi
 004E9C55    mov         eax,[007932F0];Screen:TScreen
 004E9C5A    call        TScreen.GetMonitor
 004E9C5F    call        TMonitor.GetHeight
 004E9C64    pop         edx
 004E9C65    add         edx,eax
 004E9C67    mov         eax,dword ptr [esp+0C]
 004E9C6B    add         eax,dword ptr [ebx+4C]
 004E9C6E    cmp         edx,eax
>004E9C70    jge         004E9C9F
 004E9C72    mov         edx,esi
 004E9C74    mov         eax,[007932F0];Screen:TScreen
 004E9C79    call        TScreen.GetMonitor
 004E9C7E    call        TMonitor.GetTop
 004E9C83    push        eax
 004E9C84    mov         edx,esi
 004E9C86    mov         eax,[007932F0];Screen:TScreen
 004E9C8B    call        TScreen.GetMonitor
 004E9C90    call        TMonitor.GetHeight
 004E9C95    pop         edx
 004E9C96    add         edx,eax
 004E9C98    sub         edx,dword ptr [ebx+4C]
 004E9C9B    mov         dword ptr [esp+0C],edx
 004E9C9F    mov         eax,dword ptr [ebx+48]
 004E9CA2    push        eax
 004E9CA3    mov         eax,dword ptr [ebx+4C]
 004E9CA6    push        eax
 004E9CA7    mov         ecx,dword ptr [esp+14]
 004E9CAB    mov         edx,ebp
 004E9CAD    mov         eax,ebx
 004E9CAF    mov         ebp,dword ptr [eax]
 004E9CB1    call        dword ptr [ebp+98]
 004E9CB7    inc         dword ptr [esp+8]
 004E9CBB    dec         edi
>004E9CBC    jne         004E9A85
>004E9CC2    jmp         004E9D1F
 004E9CC4    cmp         byte ptr [ebx+29F],4
>004E9CCB    jne         004E9D1F
 004E9CCD    mov         edx,esi
 004E9CCF    mov         eax,[007932F0];Screen:TScreen
 004E9CD4    call        TScreen.GetMonitor
 004E9CD9    lea         edx,[esp+14]
 004E9CDD    call        TMonitor.GetWorkareaRect
 004E9CE2    mov         edi,dword ptr [ebx+48]
 004E9CE5    push        edi
 004E9CE6    mov         ecx,dword ptr [ebx+4C]
 004E9CE9    push        ecx
 004E9CEA    mov         ecx,dword ptr [esp+28]
 004E9CEE    mov         edx,dword ptr [esp+20]
 004E9CF2    sub         ecx,edx
 004E9CF4    sub         ecx,dword ptr [ebx+4C]
 004E9CF7    sar         ecx,1
>004E9CF9    jns         004E9CFE
 004E9CFB    adc         ecx,0
 004E9CFE    add         ecx,edx
 004E9D00    mov         edx,dword ptr [esp+24]
 004E9D04    mov         eax,dword ptr [esp+1C]
 004E9D08    sub         edx,eax
 004E9D0A    sub         edx,edi
 004E9D0C    sar         edx,1
>004E9D0E    jns         004E9D13
 004E9D10    adc         edx,0
 004E9D13    add         edx,eax
 004E9D15    mov         eax,ebx
 004E9D17    mov         edi,dword ptr [eax]
 004E9D19    call        dword ptr [edi+98]
 004E9D1F    inc         esi
 004E9D20    dec         dword ptr [esp+10]
>004E9D24    jne         004E9A42
 004E9D2A    add         esp,24
 004E9D2D    pop         ebp
 004E9D2E    pop         edi
 004E9D2F    pop         esi
 004E9D30    pop         ebx
 004E9D31    ret
*}
end;

//004E9D34
function GetNonToolWindowPopupParent(WndParent:HWND):HWND;
begin
{*
 004E9D34    push        ebx
 004E9D35    push        eax
 004E9D36    call        user32.GetParent
 004E9D3B    mov         ebx,eax
>004E9D3D    jmp         004E9D47
 004E9D3F    push        ebx
 004E9D40    call        user32.GetParent
 004E9D45    mov         ebx,eax
 004E9D47    test        ebx,ebx
>004E9D49    je          004E9D5F
 004E9D4B    push        0EC
 004E9D4D    push        ebx
 004E9D4E    call        user32.GetWindowLongW
 004E9D53    and         eax,80
 004E9D58    cmp         eax,80
>004E9D5D    je          004E9D3F
 004E9D5F    test        ebx,ebx
>004E9D61    jne         004E9D9E
 004E9D63    mov         eax,[007932EC];Application:TApplication
 004E9D68    mov         ebx,dword ptr [eax+44]
 004E9D6B    test        ebx,ebx
>004E9D6D    je          004E9D93
 004E9D6F    push        0EC
 004E9D71    mov         eax,ebx
 004E9D73    call        TWinControl.GetHandle
 004E9D78    push        eax
 004E9D79    call        user32.GetWindowLongW
 004E9D7E    test        al,80
>004E9D80    jne         004E9D93
 004E9D82    mov         eax,[007932EC];Application:TApplication
 004E9D87    mov         eax,dword ptr [eax+44]
 004E9D8A    call        TWinControl.GetHandle
 004E9D8F    mov         ebx,eax
>004E9D91    jmp         004E9D9E
 004E9D93    mov         eax,[007932EC];Application:TApplication
 004E9D98    mov         ebx,dword ptr [eax+170]
 004E9D9E    mov         eax,ebx
 004E9DA0    pop         ebx
 004E9DA1    ret
*}
end;

//004E9DA4
procedure TCustomForm.CreateParams(var Params:TCreateParams);
begin
{*
 004E9DA4    push        ebx
 004E9DA5    push        esi
 004E9DA6    push        edi
 004E9DA7    push        ebp
 004E9DA8    add         esp,0FFFFFFF0
 004E9DAB    mov         edi,edx
 004E9DAD    mov         ebx,eax
 004E9DAF    mov         edx,edi
 004E9DB1    mov         eax,ebx
 004E9DB3    call        TScrollingWinControl.CreateParams
 004E9DB8    mov         edx,edi
 004E9DBA    mov         eax,ebx
 004E9DBC    call        TCustomForm.InitAlphaBlending
 004E9DC1    cmp         dword ptr [ebx+34],0
>004E9DC5    jne         004EA1BC
 004E9DCB    cmp         dword ptr [ebx+1D4],0
>004E9DD2    jne         004EA1BC
 004E9DD8    xor         esi,esi
 004E9DDA    test        byte ptr [ebx+1C],10
>004E9DDE    je          004E9DE4
 004E9DE0    mov         al,2
>004E9DE2    jmp         004E9E0E
 004E9DE4    test        byte ptr [ebx+384],8
>004E9DEB    je          004E9DFA
 004E9DED    cmp         byte ptr [ebx+348],0
>004E9DF4    jne         004E9DFA
 004E9DF6    mov         al,1
>004E9DF8    jmp         004E9E0E
 004E9DFA    cmp         byte ptr [ebx+29E],0
>004E9E01    jne         004E9E0C
 004E9E03    movzx       eax,byte ptr [ebx+348]
>004E9E0A    jmp         004E9E0E
 004E9E0C    xor         eax,eax
 004E9E0E    mov         ebp,dword ptr [ebx+358]
 004E9E14    test        ebp,ebp
>004E9E16    jne         004EA14E
 004E9E1C    cmp         dword ptr [ebx+35C],0
>004E9E23    jne         004EA14E
 004E9E29    sub         al,1
>004E9E2B    jb          004E9E40
>004E9E2D    je          004E9F26
 004E9E33    dec         al
>004E9E35    je          004EA0B9
>004E9E3B    jmp         004EA169
 004E9E40    mov         eax,[007932EC];Application:TApplication
 004E9E45    cmp         byte ptr [eax+0D3],0
>004E9E4C    je          004E9EFD
 004E9E52    cmp         byte ptr [ebx+370],0
>004E9E59    jne         004E9E65
 004E9E5B    mov         eax,[007932EC];Application:TApplication
 004E9E60    cmp         ebx,dword ptr [eax+44]
>004E9E63    jne         004E9E6F
 004E9E65    xor         eax,eax
 004E9E67    mov         dword ptr [edi+1C],eax
>004E9E6A    jmp         004EA169
 004E9E6F    mov         eax,[007932EC];Application:TApplication
 004E9E74    mov         ebp,dword ptr [eax+44]
 004E9E77    test        ebp,ebp
>004E9E79    je          004E9EEA
 004E9E7B    mov         eax,ebp
 004E9E7D    call        TWinControl.HandleAllocated
 004E9E82    test        al,al
>004E9E84    je          004E9EEA
 004E9E86    mov         eax,[007932EC];Application:TApplication
 004E9E8B    call        TApplication.GetMainFormHandle
 004E9E90    mov         ebp,eax
 004E9E92    mov         dword ptr [edi+1C],ebp
 004E9E95    mov         eax,[007932EC];Application:TApplication
 004E9E9A    mov         eax,dword ptr [eax+44]
 004E9E9D    call        TWinControl.GetHandle
 004E9EA2    cmp         ebp,eax
>004E9EA4    jne         004EA169
 004E9EAA    mov         eax,[007932EC];Application:TApplication
 004E9EAF    mov         eax,dword ptr [eax+44]
 004E9EB2    call        TCustomForm.GetPopupChildren
 004E9EB7    mov         edx,ebx
 004E9EB9    call        TList.IndexOf
 004E9EBE    test        eax,eax
>004E9EC0    jge         004E9ED6
 004E9EC2    mov         eax,[007932EC];Application:TApplication
 004E9EC7    mov         eax,dword ptr [eax+44]
 004E9ECA    call        TCustomForm.GetPopupChildren
 004E9ECF    mov         edx,ebx
 004E9ED1    call        TList.Add
 004E9ED6    mov         eax,[007932EC];Application:TApplication
 004E9EDB    mov         edx,dword ptr [eax+44]
 004E9EDE    mov         eax,ebx
 004E9EE0    call        TComponent.FreeNotification
>004E9EE5    jmp         004EA169
 004E9EEA    mov         eax,[007932EC];Application:TApplication
 004E9EEF    mov         eax,dword ptr [eax+170]
 004E9EF5    mov         dword ptr [edi+1C],eax
>004E9EF8    jmp         004EA169
 004E9EFD    mov         eax,[007932EC];Application:TApplication
 004E9F02    mov         ebp,dword ptr [eax+170]
 004E9F08    mov         dword ptr [edi+1C],ebp
 004E9F0B    push        0EC
 004E9F0D    push        ebp
 004E9F0E    call        user32.GetWindowLongW
 004E9F13    and         eax,0FFFFFF7F
 004E9F18    push        eax
 004E9F19    push        0EC
 004E9F1B    push        ebp
 004E9F1C    call        user32.SetWindowLongW
>004E9F21    jmp         004EA169
 004E9F26    cmp         byte ptr [ebx+370],0
>004E9F2D    je          004E9F36
 004E9F2F    xor         eax,eax
 004E9F31    mov         dword ptr [edi+1C],eax
>004E9F34    jmp         004E9F43
 004E9F36    mov         eax,[007932EC];Application:TApplication
 004E9F3B    call        TApplication.GetActiveFormHandle
 004E9F40    mov         dword ptr [edi+1C],eax
 004E9F43    cmp         dword ptr [edi+1C],0
>004E9F47    je          004E9F74
 004E9F49    mov         eax,dword ptr [edi+1C]
 004E9F4C    call        IsIconic
 004E9F51    test        eax,eax
>004E9F53    jne         004E9F6F
 004E9F55    mov         eax,dword ptr [edi+1C]
 004E9F58    push        eax
 004E9F59    call        user32.IsWindowVisible
 004E9F5E    test        eax,eax
>004E9F60    je          004E9F6F
 004E9F62    mov         eax,dword ptr [edi+1C]
 004E9F65    push        eax
 004E9F66    call        user32.IsWindowEnabled
 004E9F6B    test        eax,eax
>004E9F6D    jne         004E9F74
 004E9F6F    xor         eax,eax
 004E9F71    mov         dword ptr [edi+1C],eax
 004E9F74    mov         ebp,dword ptr [edi+1C]
 004E9F77    test        ebp,ebp
>004E9F79    je          004E9F9A
 004E9F7B    push        0EC
 004E9F7D    push        ebp
 004E9F7E    call        user32.GetWindowLongW
 004E9F83    and         eax,80
 004E9F88    cmp         eax,80
>004E9F8D    jne         004E9F9A
 004E9F8F    mov         eax,dword ptr [edi+1C]
 004E9F92    call        GetNonToolWindowPopupParent
 004E9F97    mov         dword ptr [edi+1C],eax
 004E9F9A    mov         eax,dword ptr [edi+1C]
 004E9F9D    test        eax,eax
>004E9F9F    je          004E9FCB
 004E9FA1    mov         edx,dword ptr ds:[7932F0];Screen:TScreen
 004E9FA7    cmp         dword ptr [edx+68],0
>004E9FAB    je          004E9FCB
 004E9FAD    mov         edx,dword ptr ds:[7932F0];Screen:TScreen
 004E9FB3    mov         edx,dword ptr [edx+68]
 004E9FB6    cmp         eax,dword ptr [edx+258]
>004E9FBC    jne         004E9FCB
 004E9FBE    mov         eax,[007932F0];Screen:TScreen
 004E9FC3    mov         esi,dword ptr [eax+68]
>004E9FC6    jmp         004EA169
 004E9FCB    test        eax,eax
>004E9FCD    jne         004EA169
 004E9FD3    mov         eax,[007932EC];Application:TApplication
 004E9FD8    cmp         byte ptr [eax+0D3],0
>004E9FDF    je          004EA090
 004E9FE5    cmp         byte ptr [ebx+370],0
>004E9FEC    jne         004E9FF8
 004E9FEE    mov         eax,[007932EC];Application:TApplication
 004E9FF3    cmp         ebx,dword ptr [eax+44]
>004E9FF6    jne         004EA002
 004E9FF8    xor         eax,eax
 004E9FFA    mov         dword ptr [edi+1C],eax
>004E9FFD    jmp         004EA169
 004EA002    mov         eax,[007932EC];Application:TApplication
 004EA007    mov         ebp,dword ptr [eax+44]
 004EA00A    test        ebp,ebp
>004EA00C    je          004EA07D
 004EA00E    mov         eax,ebp
 004EA010    call        TWinControl.HandleAllocated
 004EA015    test        al,al
>004EA017    je          004EA07D
 004EA019    mov         eax,[007932EC];Application:TApplication
 004EA01E    call        TApplication.GetMainFormHandle
 004EA023    mov         ebp,eax
 004EA025    mov         dword ptr [edi+1C],ebp
 004EA028    mov         eax,[007932EC];Application:TApplication
 004EA02D    mov         eax,dword ptr [eax+44]
 004EA030    call        TWinControl.GetHandle
 004EA035    cmp         ebp,eax
>004EA037    jne         004EA169
 004EA03D    mov         eax,[007932EC];Application:TApplication
 004EA042    mov         eax,dword ptr [eax+44]
 004EA045    call        TCustomForm.GetPopupChildren
 004EA04A    mov         edx,ebx
 004EA04C    call        TList.IndexOf
 004EA051    test        eax,eax
>004EA053    jge         004EA069
 004EA055    mov         eax,[007932EC];Application:TApplication
 004EA05A    mov         eax,dword ptr [eax+44]
 004EA05D    call        TCustomForm.GetPopupChildren
 004EA062    mov         edx,ebx
 004EA064    call        TList.Add
 004EA069    mov         eax,[007932EC];Application:TApplication
 004EA06E    mov         edx,dword ptr [eax+44]
 004EA071    mov         eax,ebx
 004EA073    call        TComponent.FreeNotification
>004EA078    jmp         004EA169
 004EA07D    mov         eax,[007932EC];Application:TApplication
 004EA082    mov         eax,dword ptr [eax+170]
 004EA088    mov         dword ptr [edi+1C],eax
>004EA08B    jmp         004EA169
 004EA090    mov         eax,[007932EC];Application:TApplication
 004EA095    mov         ebp,dword ptr [eax+170]
 004EA09B    mov         dword ptr [edi+1C],ebp
 004EA09E    push        0EC
 004EA0A0    push        ebp
 004EA0A1    call        user32.GetWindowLongW
 004EA0A6    and         eax,0FFFFFF7F
 004EA0AB    push        eax
 004EA0AC    push        0EC
 004EA0AE    push        ebp
 004EA0AF    call        user32.SetWindowLongW
>004EA0B4    jmp         004EA169
 004EA0B9    mov         ebp,dword ptr [ebx+34C]
 004EA0BF    test        ebp,ebp
>004EA0C1    je          004EA0DB
 004EA0C3    test        byte ptr [ebx+1C],10
>004EA0C7    jne         004EA0DB
 004EA0C9    mov         eax,ebp
 004EA0CB    call        TWinControl.GetHandle
 004EA0D0    mov         dword ptr [edi+1C],eax
 004EA0D3    mov         esi,dword ptr [ebx+34C]
>004EA0D9    jmp         004EA0E8
 004EA0DB    mov         eax,[007932EC];Application:TApplication
 004EA0E0    call        TApplication.GetMainFormHandle
 004EA0E5    mov         dword ptr [edi+1C],eax
 004EA0E8    mov         eax,dword ptr [edi+1C]
 004EA0EB    test        eax,eax
>004EA0ED    je          004EA116
 004EA0EF    mov         edx,dword ptr ds:[7932EC];Application:TApplication
 004EA0F5    cmp         dword ptr [edx+44],0
>004EA0F9    je          004EA116
 004EA0FB    mov         edx,dword ptr ds:[7932EC];Application:TApplication
 004EA101    mov         edx,dword ptr [edx+44]
 004EA104    cmp         eax,dword ptr [edx+258]
>004EA10A    jne         004EA116
 004EA10C    mov         eax,[007932EC];Application:TApplication
 004EA111    mov         esi,dword ptr [eax+44]
>004EA114    jmp         004EA169
 004EA116    test        eax,eax
>004EA118    jne         004EA169
 004EA11A    mov         eax,[007932EC];Application:TApplication
 004EA11F    mov         ebp,dword ptr [eax+170]
 004EA125    mov         dword ptr [edi+1C],ebp
 004EA128    mov         eax,[007932EC];Application:TApplication
 004EA12D    cmp         byte ptr [eax+0D3],0
>004EA134    jne         004EA169
 004EA136    push        0EC
 004EA138    push        ebp
 004EA139    call        user32.GetWindowLongW
 004EA13E    and         eax,0FFFFFF7F
 004EA143    push        eax
 004EA144    push        0EC
 004EA146    push        ebp
 004EA147    call        user32.SetWindowLongW
>004EA14C    jmp         004EA169
 004EA14E    mov         eax,dword ptr [ebx+35C]
 004EA154    test        eax,eax
>004EA156    je          004EA15D
 004EA158    mov         dword ptr [edi+1C],eax
>004EA15B    jmp         004EA169
 004EA15D    mov         esi,ebp
 004EA15F    mov         eax,ebp
 004EA161    call        TWinControl.GetHandle
 004EA166    mov         dword ptr [edi+1C],eax
 004EA169    test        esi,esi
>004EA16B    je          004EA19E
 004EA16D    mov         eax,esi
 004EA16F    call        TCustomForm.GetPopupChildren
 004EA174    mov         edx,ebx
 004EA176    call        TList.IndexOf
 004EA17B    test        eax,eax
>004EA17D    jge         004EA18D
 004EA17F    mov         eax,esi
 004EA181    call        TCustomForm.GetPopupChildren
 004EA186    mov         edx,ebx
 004EA188    call        TList.Add
 004EA18D    mov         edx,esi
 004EA18F    mov         eax,ebx
 004EA191    call        TComponent.FreeNotification
 004EA196    mov         dword ptr [ebx+358],esi
>004EA19C    jmp         004EA1B5
 004EA19E    mov         eax,dword ptr [edi+1C]
 004EA1A1    mov         edx,dword ptr ds:[7932EC];Application:TApplication
 004EA1A7    cmp         eax,dword ptr [edx+170]
>004EA1AD    je          004EA1B5
 004EA1AF    mov         dword ptr [ebx+35C],eax
 004EA1B5    and         dword ptr [edi+4],0BFFCFFFF
 004EA1BC    mov         dword ptr [edi+24],8
 004EA1C3    test        byte ptr [ebx+1C],10
>004EA1C7    je          004EA1DB
 004EA1C9    cmp         dword ptr [ebx+34],0
>004EA1CD    jne         004EA1DB
 004EA1CF    or          dword ptr [edi+4],0CF0000
>004EA1D6    jmp         004EA396
 004EA1DB    test        byte ptr [ebx+1C],10
>004EA1DF    je          004EA1E7
 004EA1E1    cmp         dword ptr [ebx+34],0
>004EA1E5    jne         004EA201
 004EA1E7    movzx       eax,byte ptr [ebx+29F]
 004EA1EE    dec         eax
 004EA1EF    sub         al,2
>004EA1F1    jae         004EA201
 004EA1F3    mov         dword ptr [edi+0C],80000000
 004EA1FA    mov         dword ptr [edi+10],80000000
 004EA201    lea         eax,[edi+24]
 004EA204    push        eax
 004EA205    lea         ecx,[edi+8]
 004EA208    lea         edx,[edi+4]
 004EA20B    mov         eax,ebx
 004EA20D    mov         si,0FFA8
 004EA211    call        @CallDynaInst
 004EA216    movzx       eax,byte ptr [ebx+299]
 004EA21D    cmp         byte ptr [ebx+29E],1
>004EA224    jne         004EA233
 004EA226    mov         edx,eax
 004EA228    test        dl,dl
>004EA22A    je          004EA231
 004EA22C    sub         dl,3
>004EA22F    jne         004EA233
 004EA231    mov         al,2
 004EA233    mov         edx,eax
 004EA235    sub         dl,2
>004EA238    je          004EA23F
 004EA23A    sub         dl,3
>004EA23D    jne         004EA26A
 004EA23F    test        byte ptr [ebx+1C],10
>004EA243    je          004EA24B
 004EA245    cmp         dword ptr [ebx+34],0
>004EA249    jne         004EA26A
 004EA24B    movzx       edx,byte ptr [ebx+29F]
 004EA252    sub         dl,1
>004EA255    je          004EA25C
 004EA257    sub         dl,2
>004EA25A    jne         004EA26A
 004EA25C    mov         dword ptr [edi+14],80000000
 004EA263    mov         dword ptr [edi+18],80000000
 004EA26A    sub         al,3
>004EA26C    jae         004EA2BA
 004EA26E    test        byte ptr [ebx+1C],10
>004EA272    jne         004EA2C1
 004EA274    movzx       eax,byte ptr [ebx+29A]
 004EA27B    cmp         al,1
>004EA27D    jne         004EA2AD
 004EA27F    mov         eax,[007932EC];Application:TApplication
 004EA284    cmp         byte ptr [eax+0D3],0
>004EA28B    je          004EA2A4
 004EA28D    cmp         byte ptr [ebx+370],0
>004EA294    je          004EA2A4
 004EA296    mov         eax,[007932EC];Application:TApplication
 004EA29B    mov         byte ptr [eax+0DC],1
>004EA2A2    jmp         004EA2C1
 004EA2A4    or          dword ptr [edi+4],20000000
>004EA2AB    jmp         004EA2C1
 004EA2AD    cmp         al,2
>004EA2AF    jne         004EA2C1
 004EA2B1    or          dword ptr [edi+4],1000000
>004EA2B8    jmp         004EA2C1
 004EA2BA    mov         byte ptr [ebx+29A],0
 004EA2C1    test        byte ptr [ebx+1D],2
>004EA2C5    je          004EA2CE
 004EA2C7    and         dword ptr [edi+4],0FF3FFFFF
 004EA2CE    cmp         byte ptr [ebx+29E],1
>004EA2D5    jne         004EA2DF
 004EA2D7    mov         eax,40DD30;user32.DefMDIChildProcW:Integer
 004EA2DC    mov         dword ptr [edi+28],eax
 004EA2DF    lea         ecx,[edi+8]
 004EA2E2    lea         edx,[edi+4]
 004EA2E5    mov         eax,ebx
 004EA2E7    mov         si,0FFA9
 004EA2EB    call        @CallDynaInst
 004EA2F0    mov         eax,[007932EC];Application:TApplication
 004EA2F5    cmp         byte ptr [eax+0D3],0
>004EA2FC    je          004EA32D
 004EA2FE    cmp         byte ptr [ebx+370],0
>004EA305    jne         004EA326
 004EA307    test        byte ptr [ebx+1C],10
>004EA30B    jne         004EA313
 004EA30D    test        byte ptr [ebx+55],20
>004EA311    je          004EA32D
 004EA313    cmp         byte ptr [ebx+29E],1
>004EA31A    je          004EA32D
 004EA31C    mov         eax,[007932EC];Application:TApplication
 004EA321    cmp         ebx,dword ptr [eax+44]
>004EA324    jne         004EA32D
 004EA326    or          dword ptr [edi+8],40000
 004EA32D    mov         eax,ebx
 004EA32F    call        TCustomForm.IsClientSizeStored
 004EA334    test        al,al
>004EA336    je          004EA396
 004EA338    cmp         byte ptr [ebx+29A],2
>004EA33F    jne         004EA396
 004EA341    mov         eax,dword ptr [ebx+2D4]
 004EA347    push        eax
 004EA348    lea         eax,[esp+4]
 004EA34C    push        eax
 004EA34D    mov         ecx,dword ptr [ebx+2D0]
 004EA353    xor         edx,edx
 004EA355    xor         eax,eax
 004EA357    call        Rect
 004EA35C    mov         eax,dword ptr [edi+8]
 004EA35F    push        eax
 004EA360    cmp         dword ptr [ebx+2B4],0
 004EA367    setne       al
 004EA36A    neg         al
 004EA36C    sbb         eax,eax
 004EA36E    push        eax
 004EA36F    mov         eax,dword ptr [edi+4]
 004EA372    push        eax
 004EA373    lea         eax,[esp+0C]
 004EA377    push        eax
 004EA378    call        user32.AdjustWindowRectEx
 004EA37D    test        eax,eax
>004EA37F    je          004EA396
 004EA381    mov         eax,dword ptr [esp+8]
 004EA385    sub         eax,dword ptr [esp]
 004EA388    mov         dword ptr [edi+14],eax
 004EA38B    mov         eax,dword ptr [esp+0C]
 004EA38F    sub         eax,dword ptr [esp+4]
 004EA393    mov         dword ptr [edi+18],eax
 004EA396    add         esp,10
 004EA399    pop         ebp
 004EA39A    pop         edi
 004EA39B    pop         esi
 004EA39C    pop         ebx
 004EA39D    ret
*}
end;

//004EA3A0
procedure TCustomForm.CreateWnd;
begin
{*
 004EA3A0    push        ebx
 004EA3A1    push        esi
 004EA3A2    push        edi
 004EA3A3    add         esp,0FFFFFFF8
 004EA3A6    mov         ebx,eax
 004EA3A8    mov         eax,ebx
 004EA3AA    call        TScrollingWinControl.CreateWnd
 004EA3AF    mov         eax,[0078D264];^NewStyleControls:Boolean
 004EA3B4    cmp         byte ptr [eax],0
>004EA3B7    je          004EA3F6
 004EA3B9    cmp         byte ptr [ebx+299],3
>004EA3C0    je          004EA3E0
 004EA3C2    mov         eax,ebx
 004EA3C4    call        TCustomForm.GetIconHandle
 004EA3C9    push        eax
 004EA3CA    push        1
 004EA3CC    push        80
 004EA3D1    mov         eax,ebx
 004EA3D3    call        TWinControl.GetHandle
 004EA3D8    push        eax
 004EA3D9    call        user32.SendMessageW
>004EA3DE    jmp         004EA3F6
 004EA3E0    push        0
 004EA3E2    push        1
 004EA3E4    push        80
 004EA3E9    mov         eax,ebx
 004EA3EB    call        TWinControl.GetHandle
 004EA3F0    push        eax
 004EA3F1    call        user32.SendMessageW
 004EA3F6    test        byte ptr [ebx+1C],10
>004EA3FA    jne         004EA4D7
 004EA400    movzx       eax,byte ptr [ebx+29E]
 004EA407    sub         al,2
>004EA409    je          004EA418
 004EA40B    dec         al
>004EA40D    je          004EA4BE
>004EA413    jmp         004EA4D7
 004EA418    mov         dword ptr [esp+4],0FF00
 004EA420    xor         eax,eax
 004EA422    mov         dword ptr [esp],eax
 004EA425    mov         esi,dword ptr [ebx+2C0]
 004EA42B    test        esi,esi
>004EA42D    je          004EA439
 004EA42F    mov         eax,esi
 004EA431    call        TMenuItem.GetHandle
 004EA436    mov         dword ptr [esp],eax
 004EA439    push        56330001
 004EA43E    push        0
 004EA440    push        0
 004EA442    mov         eax,ebx
 004EA444    call        TControl.GetClientWidth
 004EA449    push        eax
 004EA44A    mov         eax,ebx
 004EA44C    call        TControl.GetClientHeight
 004EA451    push        eax
 004EA452    mov         eax,ebx
 004EA454    call        TWinControl.GetHandle
 004EA459    push        eax
 004EA45A    push        0
 004EA45C    mov         eax,[00790C38];gvar_00790C38
 004EA461    push        eax
 004EA462    lea         eax,[esp+20]
 004EA466    push        eax
 004EA467    mov         edx,4EA58C
 004EA46C    xor         ecx,ecx
 004EA46E    mov         eax,200
 004EA473    call        CreateWindowEx
 004EA478    mov         dword ptr [ebx+37C],eax
 004EA47E    push        ebx
 004EA47F    mov         eax,dword ptr [ebx]
 004EA481    mov         eax,dword ptr [eax+0F8]
 004EA487    push        eax
 004EA488    call        MakeObjectInstance
 004EA48D    mov         dword ptr [ebx+380],eax
 004EA493    push        0FC
 004EA495    mov         eax,dword ptr [ebx+37C]
 004EA49B    push        eax
 004EA49C    call        user32.GetWindowLongW
 004EA4A1    mov         dword ptr [ebx+2DC],eax
 004EA4A7    mov         eax,dword ptr [ebx+380]
 004EA4AD    push        eax
 004EA4AE    push        0FC
 004EA4B0    mov         eax,dword ptr [ebx+37C]
 004EA4B6    push        eax
 004EA4B7    call        user32.SetWindowLongW
>004EA4BC    jmp         004EA4D7
 004EA4BE    push        13
 004EA4C0    push        0
 004EA4C2    push        0
 004EA4C4    push        0
 004EA4C6    push        0
 004EA4C8    push        0FF
 004EA4CA    mov         eax,ebx
 004EA4CC    call        TWinControl.GetHandle
 004EA4D1    push        eax
 004EA4D2    call        user32.SetWindowPos
 004EA4D7    mov         eax,dword ptr [ebx+350]
 004EA4DD    test        eax,eax
>004EA4DF    je          004EA50D
 004EA4E1    mov         edi,dword ptr [eax+8]
 004EA4E4    dec         edi
 004EA4E5    test        edi,edi
>004EA4E7    jl          004EA502
 004EA4E9    inc         edi
 004EA4EA    xor         esi,esi
 004EA4EC    mov         edx,esi
 004EA4EE    mov         eax,dword ptr [ebx+350]
 004EA4F4    call        TList.Get
 004EA4F9    call        TWinControl.UpdateControlState
 004EA4FE    inc         esi
 004EA4FF    dec         edi
>004EA500    jne         004EA4EC
 004EA502    mov         eax,dword ptr [ebx+350]
 004EA508    mov         edx,dword ptr [eax]
 004EA50A    call        dword ptr [edx+8]
 004EA50D    mov         eax,dword ptr [ebx+354]
 004EA513    call        @DynArrayHigh
 004EA518    mov         edi,eax
 004EA51A    test        edi,edi
>004EA51C    jl          004EA54B
 004EA51E    inc         edi
 004EA51F    xor         esi,esi
 004EA521    mov         eax,dword ptr [ebx+258]
 004EA527    push        eax
 004EA528    mov         eax,dword ptr [ebx+354]
 004EA52E    mov         eax,dword ptr [eax+esi*8]
 004EA531    push        eax
 004EA532    push        0B049
 004EA537    mov         eax,dword ptr [ebx+354]
 004EA53D    mov         eax,dword ptr [eax+esi*8+4]
 004EA541    push        eax
 004EA542    call        user32.SendMessageW
 004EA547    inc         esi
 004EA548    dec         edi
>004EA549    jne         004EA521
 004EA54B    push        0
 004EA54D    lea         eax,[ebx+354]
 004EA553    mov         ecx,1
 004EA558    mov         edx,dword ptr ds:[4DEEE4];TPopupWndArray
 004EA55E    call        @DynArraySetLength
 004EA563    add         esp,4
 004EA566    test        byte ptr [ebx+1C],1
>004EA56A    jne         004EA584
 004EA56C    mov         eax,dword ptr [ebx+374]
 004EA572    call        TGlassFrame.FrameExtended
 004EA577    test        al,al
>004EA579    je          004EA584
 004EA57B    xor         edx,edx
 004EA57D    mov         eax,ebx
 004EA57F    call        TCustomForm.UpdateGlassFrame
 004EA584    pop         ecx
 004EA585    pop         edx
 004EA586    pop         edi
 004EA587    pop         esi
 004EA588    pop         ebx
 004EA589    ret
*}
end;

//004EA5A0
procedure TCustomForm.CreateWindowHandle(const Params:TCreateParams);
begin
{*
 004EA5A0    push        ebp
 004EA5A1    mov         ebp,esp
 004EA5A3    add         esp,0FFFFFF0C
 004EA5A9    push        ebx
 004EA5AA    push        esi
 004EA5AB    push        edi
 004EA5AC    xor         ecx,ecx
 004EA5AE    mov         dword ptr [ebp-0F4],ecx
 004EA5B4    mov         ebx,eax
 004EA5B6    xor         eax,eax
 004EA5B8    push        ebp
 004EA5B9    push        4EA6C8
 004EA5BE    push        dword ptr fs:[eax]
 004EA5C1    mov         dword ptr fs:[eax],esp
 004EA5C4    cmp         byte ptr [ebx+29E],1
>004EA5CB    jne         004EA67B
 004EA5D1    test        byte ptr [ebx+1C],10
>004EA5D5    jne         004EA67B
 004EA5DB    mov         eax,[007932EC];Application:TApplication
 004EA5E0    mov         eax,dword ptr [eax+44]
 004EA5E3    test        eax,eax
>004EA5E5    je          004EA5F0
 004EA5E7    cmp         dword ptr [eax+37C],0
>004EA5EE    jne         004EA617
 004EA5F0    lea         edx,[ebp-0F4]
 004EA5F6    mov         eax,[0078D878];^SResString218:TResStringRec
 004EA5FB    call        LoadResString
 004EA600    mov         ecx,dword ptr [ebp-0F4]
 004EA606    mov         dl,1
 004EA608    mov         eax,[00439268];EInvalidOperation
 004EA60D    call        Exception.Create
 004EA612    call        @RaiseExcept
 004EA617    lea         eax,[edx+4C]
 004EA61A    mov         dword ptr [ebp-24],eax
 004EA61D    mov         eax,dword ptr [edx]
 004EA61F    mov         dword ptr [ebp-20],eax
 004EA622    mov         eax,[00790C38];gvar_00790C38
 004EA627    mov         dword ptr [ebp-1C],eax
 004EA62A    mov         eax,dword ptr [edx+0C]
 004EA62D    mov         dword ptr [ebp-18],eax
 004EA630    mov         eax,dword ptr [edx+10]
 004EA633    mov         dword ptr [ebp-14],eax
 004EA636    mov         eax,dword ptr [edx+14]
 004EA639    mov         dword ptr [ebp-10],eax
 004EA63C    mov         eax,dword ptr [edx+18]
 004EA63F    mov         dword ptr [ebp-0C],eax
 004EA642    mov         eax,dword ptr [edx+4]
 004EA645    mov         dword ptr [ebp-8],eax
 004EA648    mov         eax,dword ptr [edx+20]
 004EA64B    mov         dword ptr [ebp-4],eax
 004EA64E    lea         eax,[ebp-24]
 004EA651    push        eax
 004EA652    mov         eax,[007932EC];Application:TApplication
 004EA657    mov         eax,dword ptr [eax+44]
 004EA65A    mov         eax,dword ptr [eax+37C]
 004EA660    xor         ecx,ecx
 004EA662    mov         edx,220
 004EA667    call        SendStructMessage
 004EA66C    mov         dword ptr [ebx+258],eax
 004EA672    or          byte ptr [ebx+384],10
>004EA679    jmp         004EA6A8
 004EA67B    mov         esi,edx
 004EA67D    lea         edi,[ebp-0F0]
 004EA683    mov         ecx,33
 004EA688    rep movs    dword ptr [edi],dword ptr [esi]
 004EA68A    and         dword ptr [ebp-0E8],0FFF7FFFF
 004EA694    lea         edx,[ebp-0F0]
 004EA69A    mov         eax,ebx
 004EA69C    call        TWinControl.CreateWindowHandle
 004EA6A1    and         byte ptr [ebx+384],0EF
 004EA6A8    mov         eax,ebx
 004EA6AA    call        TCustomForm.SetLayeredAttribs
 004EA6AF    xor         eax,eax
 004EA6B1    pop         edx
 004EA6B2    pop         ecx
 004EA6B3    pop         ecx
 004EA6B4    mov         dword ptr fs:[eax],edx
 004EA6B7    push        4EA6CF
 004EA6BC    lea         eax,[ebp-0F4]
 004EA6C2    call        @UStrClr
 004EA6C7    ret
>004EA6C8    jmp         @HandleFinally
>004EA6CD    jmp         004EA6BC
 004EA6CF    pop         edi
 004EA6D0    pop         esi
 004EA6D1    pop         ebx
 004EA6D2    mov         esp,ebp
 004EA6D4    pop         ebp
 004EA6D5    ret
*}
end;

//004EA6D8
function DestroyPopupWindow(Window:HWND; Data:PDestroyPopupData):BOOL; stdcall;
begin
{*
 004EA6D8    push        ebp
 004EA6D9    mov         ebp,esp
 004EA6DB    push        ebx
 004EA6DC    push        esi
 004EA6DD    mov         esi,dword ptr [ebp+0C]
 004EA6E0    mov         ebx,dword ptr [ebp+8]
 004EA6E3    cmp         ebx,dword ptr [esi]
>004EA6E5    je          004EA710
 004EA6E7    mov         eax,ebx
 004EA6E9    call        FindControl
 004EA6EE    test        eax,eax
>004EA6F0    jne         004EA710
 004EA6F2    push        4
 004EA6F4    push        ebx
 004EA6F5    call        user32.GetWindow
 004EA6FA    cmp         eax,dword ptr [esi]
>004EA6FC    jne         004EA710
 004EA6FE    push        0
 004EA700    movzx       eax,byte ptr [esi+4]
 004EA704    push        eax
 004EA705    push        0B04A
 004EA70A    push        ebx
 004EA70B    call        user32.SendMessageW
 004EA710    or          eax,0FFFFFFFF
 004EA713    pop         esi
 004EA714    pop         ebx
 004EA715    pop         ebp
 004EA716    ret         8
*}
end;

//004EA71C
procedure TCustomForm.DestroyHandle;
begin
{*
 004EA71C    push        ebp
 004EA71D    mov         ebp,esp
 004EA71F    add         esp,0FFFFFFE8
 004EA722    mov         dword ptr [ebp-4],eax
 004EA725    mov         eax,dword ptr [ebp-4]
 004EA728    cmp         dword ptr [eax+258],0
>004EA72F    je          004EA842
 004EA735    mov         eax,dword ptr [ebp-4]
 004EA738    cmp         dword ptr [eax+344],0
>004EA73F    je          004EA815
 004EA745    mov         eax,dword ptr [ebp-4]
 004EA748    call        TCustomForm.GetRecreateChildren
 004EA74D    mov         dword ptr [ebp-0C],eax
 004EA750    mov         eax,dword ptr [ebp-4]
 004EA753    mov         eax,dword ptr [eax+344]
 004EA759    mov         eax,dword ptr [eax+8]
 004EA75C    dec         eax
 004EA75D    test        eax,eax
>004EA75F    jl          004EA815
 004EA765    inc         eax
 004EA766    mov         dword ptr [ebp-18],eax
 004EA769    mov         dword ptr [ebp-8],0
 004EA770    mov         eax,dword ptr [ebp-4]
 004EA773    test        byte ptr [eax+55],20
>004EA777    je          004EA791
 004EA779    mov         eax,dword ptr [ebp-4]
 004EA77C    mov         eax,dword ptr [eax+344]
 004EA782    mov         edx,dword ptr [ebp-8]
 004EA785    call        TList.Get
 004EA78A    mov         dl,1
 004EA78C    call        TWinControl.UpdateRecreatingFlag
 004EA791    xor         eax,eax
 004EA793    push        ebp
 004EA794    push        4EA802
 004EA799    push        dword ptr fs:[eax]
 004EA79C    mov         dword ptr fs:[eax],esp
 004EA79F    mov         eax,dword ptr [ebp-4]
 004EA7A2    mov         eax,dword ptr [eax+344]
 004EA7A8    mov         edx,dword ptr [ebp-8]
 004EA7AB    call        TList.Get
 004EA7B0    mov         edx,eax
 004EA7B2    mov         eax,dword ptr [ebp-0C]
 004EA7B5    call        TList.Add
 004EA7BA    mov         eax,dword ptr [ebp-4]
 004EA7BD    mov         eax,dword ptr [eax+344]
 004EA7C3    mov         edx,dword ptr [ebp-8]
 004EA7C6    call        TList.Get
 004EA7CB    mov         edx,dword ptr [eax]
 004EA7CD    call        dword ptr [edx+0C0]
 004EA7D3    xor         eax,eax
 004EA7D5    pop         edx
 004EA7D6    pop         ecx
 004EA7D7    pop         ecx
 004EA7D8    mov         dword ptr fs:[eax],edx
 004EA7DB    push        4EA809
 004EA7E0    mov         eax,dword ptr [ebp-4]
 004EA7E3    test        byte ptr [eax+55],20
>004EA7E7    je          004EA801
 004EA7E9    mov         eax,dword ptr [ebp-4]
 004EA7EC    mov         eax,dword ptr [eax+344]
 004EA7F2    mov         edx,dword ptr [ebp-8]
 004EA7F5    call        TList.Get
 004EA7FA    xor         edx,edx
 004EA7FC    call        TWinControl.UpdateRecreatingFlag
 004EA801    ret
>004EA802    jmp         @HandleFinally
>004EA807    jmp         004EA7E0
 004EA809    inc         dword ptr [ebp-8]
 004EA80C    dec         dword ptr [ebp-18]
>004EA80F    jne         004EA770
 004EA815    mov         eax,dword ptr [ebp-4]
 004EA818    mov         eax,dword ptr [eax+258]
 004EA81E    mov         dword ptr [ebp-14],eax
 004EA821    mov         eax,dword ptr [ebp-4]
 004EA824    test        byte ptr [eax+55],20
 004EA828    setne       al
 004EA82B    mov         byte ptr [ebp-10],al
 004EA82E    lea         eax,[ebp-14]
 004EA831    push        eax
 004EA832    push        4EA6D8;DestroyPopupWindow:BOOL
 004EA837    call        kernel32.GetCurrentThreadId
 004EA83C    push        eax
 004EA83D    call        user32.EnumThreadWindows
 004EA842    mov         eax,dword ptr [ebp-4]
 004EA845    call        TWinControl.DestroyHandle
 004EA84A    mov         esp,ebp
 004EA84C    pop         ebp
 004EA84D    ret
*}
end;

//004EA850
procedure TCustomForm.DestroyWindowHandle;
begin
{*
 004EA850    push        ebx
 004EA851    mov         ebx,eax
 004EA853    test        byte ptr [ebx+384],10
>004EA85A    je          004EA881
 004EA85C    push        0
 004EA85E    mov         eax,ebx
 004EA860    call        TWinControl.GetHandle
 004EA865    push        eax
 004EA866    push        221
 004EA86B    mov         eax,[007932EC];Application:TApplication
 004EA870    mov         eax,dword ptr [eax+44]
 004EA873    mov         eax,dword ptr [eax+37C]
 004EA879    push        eax
 004EA87A    call        user32.SendMessageW
>004EA87F    jmp         004EA888
 004EA881    mov         eax,ebx
 004EA883    call        TWinControl.DestroyWindowHandle
 004EA888    xor         eax,eax
 004EA88A    mov         dword ptr [ebx+37C],eax
 004EA890    pop         ebx
 004EA891    ret
*}
end;

//004EA894
{*procedure TCustomForm.DefaultHandler(var Message:?);
begin
 004EA894    push        ebx
 004EA895    push        esi
 004EA896    mov         esi,edx
 004EA898    mov         ebx,eax
 004EA89A    cmp         dword ptr [ebx+37C],0
>004EA8A1    je          004EA8EA
 004EA8A3    cmp         dword ptr [esi],5
>004EA8A6    jne         004EA8C5
 004EA8A8    mov         eax,dword ptr [esi+8]
 004EA8AB    push        eax
 004EA8AC    mov         eax,dword ptr [esi+4]
 004EA8AF    push        eax
 004EA8B0    mov         eax,dword ptr [esi]
 004EA8B2    push        eax
 004EA8B3    mov         eax,ebx
 004EA8B5    call        TWinControl.GetHandle
 004EA8BA    push        eax
 004EA8BB    call        user32.DefWindowProcW
 004EA8C0    mov         dword ptr [esi+0C],eax
>004EA8C3    jmp         004EA8F3
 004EA8C5    mov         eax,dword ptr [esi+8]
 004EA8C8    push        eax
 004EA8C9    mov         eax,dword ptr [esi+4]
 004EA8CC    push        eax
 004EA8CD    mov         eax,dword ptr [esi]
 004EA8CF    push        eax
 004EA8D0    mov         eax,dword ptr [ebx+37C]
 004EA8D6    push        eax
 004EA8D7    mov         eax,ebx
 004EA8D9    call        TWinControl.GetHandle
 004EA8DE    push        eax
 004EA8DF    call        user32.DefFrameProcW
 004EA8E4    mov         dword ptr [esi+0C],eax
 004EA8E7    pop         esi
 004EA8E8    pop         ebx
 004EA8E9    ret
 004EA8EA    mov         edx,esi
 004EA8EC    mov         eax,ebx
 004EA8EE    call        TWinControl.DefaultHandler
 004EA8F3    pop         esi
 004EA8F4    pop         ebx
 004EA8F5    ret
end;*}

//004EA8F8
procedure TCustomForm.SetActiveControl(Control:TComponent);
begin
{*
 004EA8F8    push        ebp
 004EA8F9    mov         ebp,esp
 004EA8FB    push        0
 004EA8FD    push        ebx
 004EA8FE    push        esi
 004EA8FF    push        edi
 004EA900    mov         edi,edx
 004EA902    mov         ebx,eax
 004EA904    xor         eax,eax
 004EA906    push        ebp
 004EA907    push        4EA9A8
 004EA90C    push        dword ptr fs:[eax]
 004EA90F    mov         dword ptr fs:[eax],esp
 004EA912    cmp         edi,dword ptr [ebx+290]
>004EA918    je          004EA992
 004EA91A    test        edi,edi
>004EA91C    je          004EA96B
 004EA91E    test        byte ptr [ebx+1C],10
>004EA922    jne         004EA96B
 004EA924    cmp         ebx,edi
>004EA926    je          004EA94A
 004EA928    mov         dl,1
 004EA92A    mov         eax,edi
 004EA92C    call        GetRealParentForm
 004EA931    cmp         ebx,eax
>004EA933    jne         004EA94A
 004EA935    test        byte ptr [ebx+1C],1
>004EA939    jne         004EA96B
 004EA93B    mov         eax,edi
 004EA93D    mov         si,0FFB6
 004EA941    call        @CallDynaInst
 004EA946    test        al,al
>004EA948    jne         004EA96B
 004EA94A    lea         edx,[ebp-4]
 004EA94D    mov         eax,[0078D8DC];^SResString200:TResStringRec
 004EA952    call        LoadResString
 004EA957    mov         ecx,dword ptr [ebp-4]
 004EA95A    mov         dl,1
 004EA95C    mov         eax,[00439268];EInvalidOperation
 004EA961    call        Exception.Create
 004EA966    call        @RaiseExcept
 004EA96B    mov         dword ptr [ebx+290],edi
 004EA971    test        byte ptr [ebx+1C],1
>004EA975    jne         004EA992
 004EA977    cmp         byte ptr [ebx+29D],0
>004EA97E    je          004EA987
 004EA980    mov         eax,ebx
 004EA982    call        TCustomForm.SetWindowFocus
 004EA987    mov         eax,ebx
 004EA989    mov         si,0FFAE
 004EA98D    call        @CallDynaInst
 004EA992    xor         eax,eax
 004EA994    pop         edx
 004EA995    pop         ecx
 004EA996    pop         ecx
 004EA997    mov         dword ptr fs:[eax],edx
 004EA99A    push        4EA9AF
 004EA99F    lea         eax,[ebp-4]
 004EA9A2    call        @UStrClr
 004EA9A7    ret
>004EA9A8    jmp         @HandleFinally
>004EA9AD    jmp         004EA99F
 004EA9AF    pop         edi
 004EA9B0    pop         esi
 004EA9B1    pop         ebx
 004EA9B2    pop         ecx
 004EA9B3    pop         ebp
 004EA9B4    ret
*}
end;

//004EA9B8
procedure TCustomForm.SetActiveOleControl(Control:TWinControl);
begin
{*
 004EA9B8    cmp         edx,dword ptr [eax+2E0]
>004EA9BE    je          004EA9D0
 004EA9C0    mov         dword ptr [eax+2E0],edx
 004EA9C6    test        edx,edx
>004EA9C8    je          004EA9D0
 004EA9CA    xchg        eax,edx
 004EA9CB    call        TComponent.FreeNotification
 004EA9D0    ret
*}
end;

//004EA9D4
procedure TCustomForm.DefocusControl(Control:TWinControl; Removing:Boolean);
begin
{*
 004EA9D4    push        ebx
 004EA9D5    push        esi
 004EA9D6    push        edi
 004EA9D7    mov         ebx,ecx
 004EA9D9    mov         esi,edx
 004EA9DB    mov         edi,eax
 004EA9DD    test        bl,bl
>004EA9DF    je          004EA9FB
 004EA9E1    mov         edx,dword ptr [edi+294]
 004EA9E7    mov         eax,esi
 004EA9E9    call        TWinControl.ContainsControl
 004EA9EE    test        al,al
>004EA9F0    je          004EA9FB
 004EA9F2    mov         eax,dword ptr [esi+34]
 004EA9F5    mov         dword ptr [edi+294],eax
 004EA9FB    mov         edx,dword ptr [edi+290]
 004EAA01    mov         eax,esi
 004EAA03    call        TWinControl.ContainsControl
 004EAA08    test        al,al
>004EAA0A    je          004EAA15
 004EAA0C    xor         edx,edx
 004EAA0E    mov         eax,edi
 004EAA10    call        TCustomForm.SetActiveControl
 004EAA15    pop         edi
 004EAA16    pop         esi
 004EAA17    pop         ebx
 004EAA18    ret
*}
end;

//004EAA1C
procedure TCustomForm.FocusControl(Control:TWinControl);
begin
{*
 004EAA1C    push        ebx
 004EAA1D    push        esi
 004EAA1E    push        edi
 004EAA1F    push        ebp
 004EAA20    mov         edi,edx
 004EAA22    mov         ebp,eax
 004EAA24    movzx       ebx,byte ptr [ebp+29D]
 004EAA2B    test        bl,bl
>004EAA2D    je          004EAA6B
 004EAA2F    cmp         byte ptr [ebp+29E],1
>004EAA36    jne         004EAA6B
 004EAA38    test        edi,edi
>004EAA3A    je          004EAA6B
 004EAA3C    cmp         edi,dword ptr [ebp+290]
>004EAA42    jne         004EAA6B
 004EAA44    mov         eax,edi
 004EAA46    call        TWinControl.HandleAllocated
 004EAA4B    test        al,al
>004EAA4D    je          004EAA6B
 004EAA4F    mov         eax,edi
 004EAA51    mov         si,0FFB3
 004EAA55    call        @CallDynaInst
 004EAA5A    test        al,al
>004EAA5C    jne         004EAA6B
 004EAA5E    mov         eax,edi
 004EAA60    call        TWinControl.GetHandle
 004EAA65    push        eax
 004EAA66    call        user32.SetFocus
 004EAA6B    mov         edx,edi
 004EAA6D    mov         eax,ebp
 004EAA6F    call        TCustomForm.SetActiveControl
 004EAA74    test        bl,bl
>004EAA76    jne         004EAA82
 004EAA78    mov         eax,ebp
 004EAA7A    mov         edx,dword ptr [eax]
 004EAA7C    call        dword ptr [edx+0E8]
 004EAA82    pop         ebp
 004EAA83    pop         edi
 004EAA84    pop         esi
 004EAA85    pop         ebx
 004EAA86    ret
*}
end;

//004EAA88
function TCustomForm.SetFocusedControl(Control:TWinControl):Boolean;
begin
{*
 004EAA88    push        ebp
 004EAA89    mov         ebp,esp
 004EAA8B    add         esp,0FFFFFFF8
 004EAA8E    push        ebx
 004EAA8F    push        esi
 004EAA90    push        edi
 004EAA91    mov         dword ptr [ebp-4],edx
 004EAA94    mov         edi,eax
 004EAA96    mov         byte ptr [ebp-5],0
 004EAA9A    inc         dword ptr ds:[7866FC]
 004EAAA0    cmp         dword ptr [edi+2BC],0
>004EAAA7    jne         004EAAC1
 004EAAA9    cmp         edi,dword ptr [ebp-4]
>004EAAAC    je          004EAAB9
 004EAAAE    mov         eax,dword ptr [ebp-4]
 004EAAB1    mov         dword ptr [edi+290],eax
>004EAAB7    jmp         004EAAC1
 004EAAB9    xor         eax,eax
 004EAABB    mov         dword ptr [edi+290],eax
 004EAAC1    mov         eax,[007932F0];Screen:TScreen
 004EAAC6    mov         edx,dword ptr [ebp-4]
 004EAAC9    mov         dword ptr [eax+60],edx
 004EAACC    mov         eax,[007932F0];Screen:TScreen
 004EAAD1    mov         dword ptr [eax+64],edi
 004EAAD4    mov         eax,[007932F0];Screen:TScreen
 004EAAD9    mov         eax,dword ptr [eax+54]
 004EAADC    mov         esi,edi
 004EAADE    mov         edx,esi
 004EAAE0    xor         ecx,ecx
 004EAAE2    call        TList.RemoveItem
 004EAAE7    mov         eax,[007932F0];Screen:TScreen
 004EAAEC    mov         eax,dword ptr [eax+54]
 004EAAEF    mov         ecx,edi
 004EAAF1    xor         edx,edx
 004EAAF3    call        TList.Insert
 004EAAF8    mov         eax,edi
 004EAAFA    mov         edx,dword ptr ds:[4E0C38];TForm
 004EAB00    call        @IsClass
 004EAB05    test        al,al
>004EAB07    je          004EAB35
 004EAB09    mov         eax,[007932F0];Screen:TScreen
 004EAB0E    mov         dword ptr [eax+68],edi
 004EAB11    mov         eax,[007932F0];Screen:TScreen
 004EAB16    mov         eax,dword ptr [eax+50]
 004EAB19    mov         edx,esi
 004EAB1B    xor         ecx,ecx
 004EAB1D    call        TList.RemoveItem
 004EAB22    mov         eax,[007932F0];Screen:TScreen
 004EAB27    mov         eax,dword ptr [eax+50]
 004EAB2A    mov         ecx,edi
 004EAB2C    xor         edx,edx
 004EAB2E    call        TList.Insert
>004EAB33    jmp         004EAB3F
 004EAB35    mov         eax,[007932F0];Screen:TScreen
 004EAB3A    xor         edx,edx
 004EAB3C    mov         dword ptr [eax+68],edx
 004EAB3F    mov         eax,dword ptr [ebp-4]
 004EAB42    test        byte ptr [eax+54],20
>004EAB46    jne         004EAD1A
 004EAB4C    mov         eax,dword ptr [ebp-4]
 004EAB4F    mov         eax,dword ptr [eax+54]
 004EAB52    or          eax,dword ptr ds:[4EAD28]
 004EAB58    mov         edx,dword ptr [ebp-4]
 004EAB5B    mov         dword ptr [edx+54],eax
 004EAB5E    xor         edx,edx
 004EAB60    push        ebp
 004EAB61    push        4EAD05
 004EAB66    push        dword ptr fs:[edx]
 004EAB69    mov         dword ptr fs:[edx],esp
 004EAB6C    mov         eax,[007932F0];Screen:TScreen
 004EAB71    mov         eax,dword ptr [eax+74]
 004EAB74    cmp         edi,eax
>004EAB76    je          004EABCC
 004EAB78    test        eax,eax
>004EAB7A    je          004EABA6
 004EAB7C    call        TWinControl.GetHandle
 004EAB81    mov         ebx,eax
 004EAB83    mov         eax,[007932F0];Screen:TScreen
 004EAB88    xor         edx,edx
 004EAB8A    mov         dword ptr [eax+74],edx
 004EAB8D    mov         dx,0B001
 004EAB91    mov         eax,ebx
 004EAB93    call        SendFocusMessage
 004EAB98    test        al,al
>004EAB9A    jne         004EABA6
 004EAB9C    call        @TryFinallyExit
>004EABA1    jmp         004EAD1A
 004EABA6    mov         eax,[007932F0];Screen:TScreen
 004EABAB    mov         dword ptr [eax+74],edi
 004EABAE    mov         eax,edi
 004EABB0    call        TWinControl.GetHandle
 004EABB5    mov         dx,0B000
 004EABB9    call        SendFocusMessage
 004EABBE    test        al,al
>004EABC0    jne         004EABCC
 004EABC2    call        @TryFinallyExit
>004EABC7    jmp         004EAD1A
 004EABCC    cmp         dword ptr [edi+294],0
>004EABD3    jne         004EABDB
 004EABD5    mov         dword ptr [edi+294],edi
 004EABDB    mov         eax,dword ptr [edi+294]
 004EABE1    cmp         eax,dword ptr [ebp-4]
>004EABE4    je          004EACE3
>004EABEA    jmp         004EAC21
 004EABEC    mov         eax,dword ptr [edi+294]
 004EABF2    call        TWinControl.GetHandle
 004EABF7    mov         ebx,eax
 004EABF9    mov         eax,dword ptr [edi+294]
 004EABFF    mov         eax,dword ptr [eax+34]
 004EAC02    mov         dword ptr [edi+294],eax
 004EAC08    mov         dx,0B01B
 004EAC0C    mov         eax,ebx
 004EAC0E    call        SendFocusMessage
 004EAC13    test        al,al
>004EAC15    jne         004EAC21
 004EAC17    call        @TryFinallyExit
>004EAC1C    jmp         004EAD1A
 004EAC21    mov         esi,dword ptr [edi+294]
 004EAC27    test        esi,esi
>004EAC29    je          004EAC71
 004EAC2B    mov         eax,esi
 004EAC2D    mov         edx,dword ptr [ebp-4]
 004EAC30    call        TWinControl.ContainsControl
 004EAC35    test        al,al
>004EAC37    je          004EABEC
>004EAC39    jmp         004EAC71
 004EAC3B    mov         esi,dword ptr [ebp-4]
>004EAC3E    jmp         004EAC42
 004EAC40    mov         esi,ebx
 004EAC42    mov         ebx,dword ptr [esi+34]
 004EAC45    cmp         ebx,dword ptr [edi+294]
>004EAC4B    jne         004EAC40
 004EAC4D    mov         dword ptr [edi+294],esi
 004EAC53    mov         eax,esi
 004EAC55    call        TWinControl.GetHandle
 004EAC5A    mov         dx,0B01A
 004EAC5E    call        SendFocusMessage
 004EAC63    test        al,al
>004EAC65    jne         004EAC71
 004EAC67    call        @TryFinallyExit
>004EAC6C    jmp         004EAD1A
 004EAC71    mov         eax,dword ptr [edi+294]
 004EAC77    cmp         eax,dword ptr [ebp-4]
>004EAC7A    jne         004EAC3B
 004EAC7C    mov         eax,dword ptr [ebp-4]
 004EAC7F    mov         esi,dword ptr [eax+34]
 004EAC82    mov         eax,dword ptr [ebp-4]
 004EAC85    test        byte ptr [eax+1C],10
>004EAC89    jne         004EACB4
 004EAC8B    test        esi,esi
>004EAC8D    je          004EACB4
 004EAC8F    mov         eax,esi
 004EAC91    mov         edx,dword ptr ds:[4DE958];TScrollingWinControl
 004EAC97    call        @IsClass
 004EAC9C    test        al,al
>004EAC9E    je          004EACAD
 004EACA0    mov         edx,dword ptr [ebp-4]
 004EACA3    mov         eax,esi
 004EACA5    mov         ecx,dword ptr [eax]
 004EACA7    call        dword ptr [ecx+0F0]
 004EACAD    mov         esi,dword ptr [esi+34]
 004EACB0    test        esi,esi
>004EACB2    jne         004EAC8F
 004EACB4    mov         eax,dword ptr [ebp-4]
 004EACB7    push        eax
 004EACB8    xor         ecx,ecx
 004EACBA    mov         edx,0B007
 004EACBF    mov         eax,edi
 004EACC1    call        TControl.Perform
 004EACC6    mov         eax,dword ptr [edi+2E0]
 004EACCC    test        eax,eax
>004EACCE    je          004EACE3
 004EACD0    cmp         eax,dword ptr [ebp-4]
>004EACD3    je          004EACE3
 004EACD5    push        0
 004EACD7    xor         ecx,ecx
 004EACD9    mov         edx,0B02A
 004EACDE    call        TControl.Perform
 004EACE3    xor         eax,eax
 004EACE5    pop         edx
 004EACE6    pop         ecx
 004EACE7    pop         ecx
 004EACE8    mov         dword ptr fs:[eax],edx
 004EACEB    push        4EAD0C
 004EACF0    mov         eax,dword ptr [ebp-4]
 004EACF3    mov         edx,dword ptr ds:[4EAD28]
 004EACF9    not         edx
 004EACFB    and         edx,dword ptr [eax+54]
 004EACFE    mov         eax,dword ptr [ebp-4]
 004EAD01    mov         dword ptr [eax+54],edx
 004EAD04    ret
>004EAD05    jmp         @HandleFinally
>004EAD0A    jmp         004EACF0
 004EAD0C    mov         eax,[007932F0];Screen:TScreen
 004EAD11    call        TScreen.UpdateLastActive
 004EAD16    mov         byte ptr [ebp-5],1
 004EAD1A    movzx       eax,byte ptr [ebp-5]
 004EAD1E    pop         edi
 004EAD1F    pop         esi
 004EAD20    pop         ebx
 004EAD21    pop         ecx
 004EAD22    pop         ecx
 004EAD23    pop         ebp
 004EAD24    ret
*}
end;

//004EAD2C
procedure TCustomForm.sub_004EAD2C;
begin
{*
 004EAD2C    ret
*}
end;

//004EAD30
procedure TCustomForm.SetWindowFocus;
begin
{*
 004EAD30    push        ebx
 004EAD31    push        esi
 004EAD32    mov         ebx,eax
 004EAD34    mov         eax,dword ptr [ebx+290]
 004EAD3A    test        eax,eax
>004EAD3C    je          004EAD4B
 004EAD3E    cmp         dword ptr [ebx+2BC],0
>004EAD45    jne         004EAD4B
 004EAD47    mov         esi,eax
>004EAD49    jmp         004EAD75
 004EAD4B    cmp         dword ptr [ebx+34],0
>004EAD4F    je          004EAD73
 004EAD51    cmp         dword ptr [ebx+2BC],0
>004EAD58    jne         004EAD73
 004EAD5A    push        1
 004EAD5C    push        0
 004EAD5E    mov         cl,1
 004EAD60    xor         edx,edx
 004EAD62    mov         eax,ebx
 004EAD64    call        TWinControl.FindNextControl
 004EAD69    mov         esi,eax
 004EAD6B    test        esi,esi
>004EAD6D    jne         004EAD75
 004EAD6F    mov         esi,ebx
>004EAD71    jmp         004EAD75
 004EAD73    mov         esi,ebx
 004EAD75    mov         eax,esi
 004EAD77    call        TWinControl.GetHandle
 004EAD7C    push        eax
 004EAD7D    call        user32.SetFocus
 004EAD82    mov         eax,esi
 004EAD84    call        TWinControl.GetHandle
 004EAD89    mov         ebx,eax
 004EAD8B    call        user32.GetFocus
 004EAD90    cmp         ebx,eax
>004EAD92    jne         004EADA4
 004EAD94    push        0
 004EAD96    xor         ecx,ecx
 004EAD98    mov         edx,0B029
 004EAD9D    mov         eax,esi
 004EAD9F    call        TControl.Perform
 004EADA4    pop         esi
 004EADA5    pop         ebx
 004EADA6    ret
*}
end;

//004EADA8
procedure TCustomForm.SetActive(Value:Boolean);
begin
{*
 004EADA8    push        ebx
 004EADA9    push        esi
 004EADAA    mov         ebx,edx
 004EADAC    mov         esi,eax
 004EADAE    mov         byte ptr [esi+29D],bl
 004EADB4    mov         eax,dword ptr [esi+2E0]
 004EADBA    test        eax,eax
>004EADBC    je          004EADCD
 004EADBE    push        0
 004EADC0    movzx       ecx,bl
 004EADC3    mov         edx,0B02B
 004EADC8    call        TControl.Perform
 004EADCD    test        bl,bl
>004EADCF    je          004EAE08
 004EADD1    cmp         dword ptr [esi+290],0
>004EADD8    jne         004EADF8
 004EADDA    test        byte ptr [esi+1C],10
>004EADDE    jne         004EADF8
 004EADE0    push        1
 004EADE2    push        0
 004EADE4    mov         cl,1
 004EADE6    xor         edx,edx
 004EADE8    mov         eax,esi
 004EADEA    call        TWinControl.FindNextControl
 004EADEF    mov         edx,eax
 004EADF1    mov         eax,esi
 004EADF3    call        TCustomForm.SetActiveControl
 004EADF8    mov         dl,1
 004EADFA    mov         eax,esi
 004EADFC    call        TCustomForm.MergeMenu
 004EAE01    mov         eax,esi
 004EAE03    call        TCustomForm.SetWindowFocus
 004EAE08    pop         esi
 004EAE09    pop         ebx
 004EAE0A    ret
*}
end;

//004EAE0C
procedure TCustomForm.SendCancelMode(Sender:TControl);
begin
{*
 004EAE0C    push        ebx
 004EAE0D    push        esi
 004EAE0E    mov         esi,edx
 004EAE10    mov         ebx,eax
 004EAE12    cmp         byte ptr [ebx+29D],0
>004EAE19    je          004EAE37
 004EAE1B    cmp         dword ptr [ebx+290],0
>004EAE22    je          004EAE37
 004EAE24    push        esi
 004EAE25    xor         ecx,ecx
 004EAE27    mov         edx,0B004
 004EAE2C    mov         eax,dword ptr [ebx+290]
 004EAE32    call        TControl.Perform
 004EAE37    cmp         byte ptr [ebx+29E],2
>004EAE3E    jne         004EAE59
 004EAE40    mov         eax,ebx
 004EAE42    call        TCustomForm.get_ActiveMDIChild
 004EAE47    test        eax,eax
>004EAE49    je          004EAE59
 004EAE4B    mov         eax,ebx
 004EAE4D    call        TCustomForm.get_ActiveMDIChild
 004EAE52    mov         edx,esi
 004EAE54    call        TCustomForm.SendCancelMode
 004EAE59    pop         esi
 004EAE5A    pop         ebx
 004EAE5B    ret
*}
end;

//004EAE5C
procedure TCustomForm.MergeMenu(MergeState:Boolean);
begin
{*
 004EAE5C    push        esi
 004EAE5D    test        byte ptr [eax+384],8
>004EAE64    jne         004EAF00
 004EAE6A    mov         ecx,dword ptr ds:[7932EC];Application:TApplication
 004EAE70    cmp         dword ptr [ecx+44],0
>004EAE74    je          004EAF00
 004EAE7A    mov         ecx,dword ptr ds:[7932EC];Application:TApplication
 004EAE80    mov         ecx,dword ptr [ecx+44]
 004EAE83    cmp         dword ptr [ecx+2B4],0
>004EAE8A    je          004EAF00
 004EAE8C    mov         ecx,dword ptr ds:[7932EC];Application:TApplication
 004EAE92    cmp         eax,dword ptr [ecx+44]
>004EAE95    je          004EAF00
 004EAE97    cmp         byte ptr [eax+29E],1
>004EAE9E    je          004EAEB2
 004EAEA0    mov         ecx,dword ptr ds:[7932EC];Application:TApplication
 004EAEA6    mov         ecx,dword ptr [ecx+44]
 004EAEA9    cmp         byte ptr [ecx+29E],2
>004EAEB0    je          004EAF00
 004EAEB2    xor         esi,esi
 004EAEB4    test        byte ptr [eax+1C],10
>004EAEB8    jne         004EAEDE
 004EAEBA    cmp         dword ptr [eax+2B4],0
>004EAEC1    je          004EAEDE
 004EAEC3    mov         ecx,dword ptr [eax+2B4]
 004EAEC9    cmp         byte ptr [ecx+64],0
>004EAECD    jne         004EAED8
 004EAECF    cmp         byte ptr [eax+29E],1
>004EAED6    jne         004EAEDE
 004EAED8    mov         esi,dword ptr [eax+2B4]
 004EAEDE    mov         eax,[007932EC];Application:TApplication
 004EAEE3    mov         eax,dword ptr [eax+44]
 004EAEE6    mov         eax,dword ptr [eax+2B4]
 004EAEEC    test        dl,dl
>004EAEEE    je          004EAEF9
 004EAEF0    mov         edx,esi
 004EAEF2    call        TMainMenu.Merge
>004EAEF7    jmp         004EAF00
 004EAEF9    mov         edx,esi
 004EAEFB    call        TMainMenu.Unmerge
 004EAF00    pop         esi
 004EAF01    ret
*}
end;

//004EAF04
procedure DoNestedActivation(Msg:Cardinal; Control:TWinControl; Form:TCustomForm);
begin
{*
 004EAF04    push        ebx
 004EAF05    push        esi
 004EAF06    push        edi
 004EAF07    push        ebp
 004EAF08    mov         edi,ecx
 004EAF0A    mov         ebx,edx
 004EAF0C    mov         ebp,eax
 004EAF0E    test        ebx,ebx
>004EAF10    je          004EAF48
>004EAF12    jmp         004EAF16
 004EAF14    mov         ebx,esi
 004EAF16    mov         esi,dword ptr [ebx+34]
 004EAF19    test        esi,esi
>004EAF1B    je          004EAF2E
 004EAF1D    mov         eax,ebx
 004EAF1F    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 004EAF25    call        @IsClass
 004EAF2A    test        al,al
>004EAF2C    je          004EAF14
 004EAF2E    test        ebx,ebx
>004EAF30    je          004EAF48
 004EAF32    cmp         edi,ebx
>004EAF34    je          004EAF48
 004EAF36    push        0
 004EAF38    push        0
 004EAF3A    push        ebp
 004EAF3B    mov         eax,ebx
 004EAF3D    call        TWinControl.GetHandle
 004EAF42    push        eax
 004EAF43    call        user32.SendMessageW
 004EAF48    pop         ebp
 004EAF49    pop         edi
 004EAF4A    pop         esi
 004EAF4B    pop         ebx
 004EAF4C    ret
*}
end;

//004EAF50
procedure TCustomForm.Activate;
begin
{*
 004EAF50    push        ebx
 004EAF51    mov         ebx,eax
 004EAF53    mov         ecx,ebx
 004EAF55    mov         edx,dword ptr [ebx+290]
 004EAF5B    mov         eax,0B000
 004EAF60    call        DoNestedActivation
 004EAF65    cmp         word ptr [ebx+2EA],0
>004EAF6D    je          004EAF7D
 004EAF6F    mov         edx,ebx
 004EAF71    mov         eax,dword ptr [ebx+2EC]
 004EAF77    call        dword ptr [ebx+2E8]
 004EAF7D    pop         ebx
 004EAF7E    ret
*}
end;

//004EAF80
procedure TCustomForm.Deactivate;
begin
{*
 004EAF80    push        ebx
 004EAF81    mov         ebx,eax
 004EAF83    mov         ecx,ebx
 004EAF85    mov         edx,dword ptr [ebx+290]
 004EAF8B    mov         eax,0B001
 004EAF90    call        DoNestedActivation
 004EAF95    cmp         word ptr [ebx+302],0
>004EAF9D    je          004EAFAD
 004EAF9F    mov         edx,ebx
 004EAFA1    mov         eax,dword ptr [ebx+304]
 004EAFA7    call        dword ptr [ebx+300]
 004EAFAD    pop         ebx
 004EAFAE    ret
*}
end;

//004EAFB0
procedure TCustomForm.Paint;
begin
{*
 004EAFB0    push        ebx
 004EAFB1    cmp         word ptr [eax+31A],0
>004EAFB9    je          004EAFCB
 004EAFBB    mov         ebx,eax
 004EAFBD    mov         edx,eax
 004EAFBF    mov         eax,dword ptr [ebx+31C]
 004EAFC5    call        dword ptr [ebx+318]
 004EAFCB    pop         ebx
 004EAFCC    ret
*}
end;

//004EAFD0
function TCustomForm.GetIconHandle:HICON;
begin
{*
 004EAFD0    mov         eax,dword ptr [eax+2AC]
 004EAFD6    call        TIcon.GetHandle
 004EAFDB    test        eax,eax
>004EAFDD    jne         004EAFE9
 004EAFDF    mov         eax,[007932EC];Application:TApplication
 004EAFE4    call        TApplication.GetIconHandle
 004EAFE9    ret
*}
end;

//004EAFEC
procedure TCustomForm.PaintWindow(DC:HDC);
begin
{*
 004EAFEC    push        ebp
 004EAFED    mov         ebp,esp
 004EAFEF    add         esp,0FFFFFFE4
 004EAFF2    push        ebx
 004EAFF3    push        esi
 004EAFF4    mov         dword ptr [ebp-8],edx
 004EAFF7    mov         dword ptr [ebp-4],eax
 004EAFFA    mov         eax,dword ptr [ebp-4]
 004EAFFD    mov         eax,dword ptr [eax+2A4]
 004EB003    call        TCustomCanvas.Lock
 004EB008    xor         eax,eax
 004EB00A    push        ebp
 004EB00B    push        4EB1D8
 004EB010    push        dword ptr fs:[eax]
 004EB013    mov         dword ptr fs:[eax],esp
 004EB016    mov         eax,dword ptr [ebp-4]
 004EB019    mov         eax,dword ptr [eax+2A4]
 004EB01F    mov         edx,dword ptr [ebp-8]
 004EB022    call        TCanvas.SetHandle
 004EB027    xor         eax,eax
 004EB029    push        ebp
 004EB02A    push        4EB1B5
 004EB02F    push        dword ptr fs:[eax]
 004EB032    mov         dword ptr fs:[eax],esp
 004EB035    mov         eax,dword ptr [ebp-8]
 004EB038    push        eax
 004EB039    call        gdi32.SaveDC
 004EB03E    mov         dword ptr [ebp-0C],eax
 004EB041    xor         eax,eax
 004EB043    push        ebp
 004EB044    push        4EB168
 004EB049    push        dword ptr fs:[eax]
 004EB04C    mov         dword ptr fs:[eax],esp
 004EB04F    mov         eax,dword ptr [ebp-4]
 004EB052    mov         ebx,dword ptr [eax+374]
 004EB058    mov         eax,ebx
 004EB05A    call        TGlassFrame.FrameExtended
 004EB05F    test        al,al
>004EB061    jne         004EB07D
 004EB063    mov         eax,dword ptr [ebp-4]
 004EB066    cmp         dword ptr [eax+2BC],0
>004EB06D    je          004EB14D
 004EB073    cmp         byte ptr [ebx+8],0
>004EB077    je          004EB14D
 004EB07D    lea         edx,[ebp-1C]
 004EB080    mov         eax,dword ptr [ebp-4]
 004EB083    mov         ecx,dword ptr [eax]
 004EB085    call        dword ptr [ecx+54]
 004EB088    cmp         byte ptr [ebx+28],0
>004EB08C    jne         004EB0BB
 004EB08E    mov         eax,dword ptr [ebp-4]
 004EB091    cmp         byte ptr [eax+378],0
>004EB098    jne         004EB0BB
 004EB09A    mov         eax,dword ptr [ebp-10]
 004EB09D    sub         eax,dword ptr [ebx+18]
 004EB0A0    push        eax
 004EB0A1    mov         eax,dword ptr [ebp-14]
 004EB0A4    sub         eax,dword ptr [ebx+14]
 004EB0A7    push        eax
 004EB0A8    mov         eax,dword ptr [ebx+10]
 004EB0AB    push        eax
 004EB0AC    mov         eax,dword ptr [ebx+0C]
 004EB0AF    push        eax
 004EB0B0    mov         eax,dword ptr [ebp-8]
 004EB0B3    push        eax
 004EB0B4    call        gdi32.ExcludeClipRect
>004EB0B9    jmp         004EB0C5
 004EB0BB    mov         eax,dword ptr [ebp-4]
 004EB0BE    mov         byte ptr [eax+378],0
 004EB0C5    mov         eax,dword ptr [ebp-4]
 004EB0C8    cmp         dword ptr [eax+2BC],0
>004EB0CF    jne         004EB0F3
 004EB0D1    push        4
 004EB0D3    call        gdi32.GetStockObject
 004EB0D8    push        eax
 004EB0D9    lea         eax,[ebp-1C]
 004EB0DC    push        eax
 004EB0DD    mov         eax,dword ptr [ebp-4]
 004EB0E0    mov         eax,dword ptr [eax+2A4]
 004EB0E6    call        TCanvas.GetHandle
 004EB0EB    push        eax
 004EB0EC    call        user32.FillRect
>004EB0F1    jmp         004EB14D
 004EB0F3    mov         eax,dword ptr [ebp-4]
 004EB0F6    mov         eax,dword ptr [eax+2A4]
 004EB0FC    mov         eax,dword ptr [eax+48]
 004EB0FF    mov         edx,0FF000002
 004EB104    call        TBrush.SetColor
 004EB109    mov         eax,dword ptr [ebp-4]
 004EB10C    mov         eax,dword ptr [eax+2A4]
 004EB112    mov         eax,dword ptr [eax+48]
 004EB115    mov         dl,5
 004EB117    call        TBrush.SetStyle
 004EB11C    mov         eax,dword ptr [ebp-4]
 004EB11F    mov         eax,dword ptr [eax+6C]
 004EB122    call        ColorToRGB
 004EB127    push        eax
 004EB128    mov         eax,dword ptr [ebp-4]
 004EB12B    mov         eax,dword ptr [eax+2A4]
 004EB131    call        TCanvas.GetHandle
 004EB136    push        eax
 004EB137    call        gdi32.SetBkColor
 004EB13C    lea         edx,[ebp-1C]
 004EB13F    mov         eax,dword ptr [ebp-4]
 004EB142    mov         eax,dword ptr [eax+2A4]
 004EB148    mov         ecx,dword ptr [eax]
 004EB14A    call        dword ptr [ecx+54]
 004EB14D    xor         eax,eax
 004EB14F    pop         edx
 004EB150    pop         ecx
 004EB151    pop         ecx
 004EB152    mov         dword ptr fs:[eax],edx
 004EB155    push        4EB16F
 004EB15A    mov         eax,dword ptr [ebp-0C]
 004EB15D    push        eax
 004EB15E    mov         eax,dword ptr [ebp-8]
 004EB161    push        eax
 004EB162    call        gdi32.RestoreDC
 004EB167    ret
>004EB168    jmp         @HandleFinally
>004EB16D    jmp         004EB15A
 004EB16F    mov         eax,dword ptr [ebp-4]
 004EB172    cmp         dword ptr [eax+2BC],0
>004EB179    je          004EB18B
 004EB17B    mov         eax,dword ptr [ebp-4]
 004EB17E    mov         eax,dword ptr [eax+2BC]
 004EB184    mov         edx,dword ptr [eax]
 004EB186    call        dword ptr [edx+28]
>004EB189    jmp         004EB197
 004EB18B    mov         eax,dword ptr [ebp-4]
 004EB18E    mov         si,0FFA4
 004EB192    call        @CallDynaInst
 004EB197    xor         eax,eax
 004EB199    pop         edx
 004EB19A    pop         ecx
 004EB19B    pop         ecx
 004EB19C    mov         dword ptr fs:[eax],edx
 004EB19F    push        4EB1BC
 004EB1A4    mov         eax,dword ptr [ebp-4]
 004EB1A7    mov         eax,dword ptr [eax+2A4]
 004EB1AD    xor         edx,edx
 004EB1AF    call        TCanvas.SetHandle
 004EB1B4    ret
>004EB1B5    jmp         @HandleFinally
>004EB1BA    jmp         004EB1A4
 004EB1BC    xor         eax,eax
 004EB1BE    pop         edx
 004EB1BF    pop         ecx
 004EB1C0    pop         ecx
 004EB1C1    mov         dword ptr fs:[eax],edx
 004EB1C4    push        4EB1DF
 004EB1C9    mov         eax,dword ptr [ebp-4]
 004EB1CC    mov         eax,dword ptr [eax+2A4]
 004EB1D2    call        TCustomCanvas.Unlock
 004EB1D7    ret
>004EB1D8    jmp         @HandleFinally
>004EB1DD    jmp         004EB1C9
 004EB1DF    pop         esi
 004EB1E0    pop         ebx
 004EB1E1    mov         esp,ebp
 004EB1E3    pop         ebp
 004EB1E4    ret
*}
end;

//004EB1E8
procedure TCustomForm.PaletteChanged(Foreground:Boolean);
begin
{*
 004EB1E8    push        ebx
 004EB1E9    push        esi
 004EB1EA    push        edi
 004EB1EB    push        ebp
 004EB1EC    add         esp,0FFFFFFF0
 004EB1EF    mov         byte ptr [esp+4],dl
 004EB1F3    mov         dword ptr [esp],eax
 004EB1F6    xor         ebx,ebx
 004EB1F8    mov         eax,dword ptr [esp]
 004EB1FB    call        TCustomForm.get_ActiveMDIChild
 004EB200    mov         dword ptr [esp+0C],eax
 004EB204    cmp         dword ptr [esp+0C],0
>004EB209    je          004EB21F
 004EB20B    movzx       edx,byte ptr [esp+4]
 004EB210    mov         eax,dword ptr [esp+0C]
 004EB214    mov         si,0FFD1
 004EB218    call        @CallDynaInst
 004EB21D    mov         ebx,eax
 004EB21F    mov         eax,dword ptr [esp]
 004EB222    call        TCustomForm.get_MDIChildCount
 004EB227    mov         ebp,eax
 004EB229    dec         ebp
 004EB22A    test        ebp,ebp
>004EB22C    jl          004EB26A
 004EB22E    inc         ebp
 004EB22F    mov         dword ptr [esp+8],0
 004EB237    test        byte ptr [esp+4],bl
>004EB23B    jne         004EB27F
 004EB23D    mov         edx,dword ptr [esp+8]
 004EB241    mov         eax,dword ptr [esp]
 004EB244    call        TCustomForm.get_MDIChildren
 004EB249    mov         edi,eax
 004EB24B    cmp         edi,dword ptr [esp+0C]
>004EB24F    je          004EB263
 004EB251    movzx       edx,byte ptr [esp+4]
 004EB256    mov         eax,edi
 004EB258    mov         si,0FFD1
 004EB25C    call        @CallDynaInst
 004EB261    or          bl,al
 004EB263    inc         dword ptr [esp+8]
 004EB267    dec         ebp
>004EB268    jne         004EB237
 004EB26A    test        byte ptr [esp+4],bl
>004EB26E    jne         004EB27F
 004EB270    movzx       edx,byte ptr [esp+4]
 004EB275    mov         eax,dword ptr [esp]
 004EB278    call        TWinControl.PaletteChanged
 004EB27D    mov         ebx,eax
 004EB27F    mov         eax,ebx
 004EB281    add         esp,10
 004EB284    pop         ebp
 004EB285    pop         edi
 004EB286    pop         esi
 004EB287    pop         ebx
 004EB288    ret
*}
end;

//004EB28C
procedure TCustomForm.WMPaint(var Message:TWMPaint);
begin
{*
 004EB28C    push        ebx
 004EB28D    push        esi
 004EB28E    add         esp,0FFFFFFC0
 004EB291    mov         esi,edx
 004EB293    mov         ebx,eax
 004EB295    mov         eax,ebx
 004EB297    call        TWinControl.GetHandle
 004EB29C    call        IsIconic
 004EB2A1    test        eax,eax
>004EB2A3    jne         004EB2C8
 004EB2A5    mov         eax,[004EB300]
 004EB2AA    or          eax,dword ptr [ebx+54]
 004EB2AD    mov         dword ptr [ebx+54],eax
 004EB2B0    mov         edx,esi
 004EB2B2    mov         eax,ebx
 004EB2B4    call        TWinControl.WMPaint
 004EB2B9    mov         eax,[004EB300]
 004EB2BE    not         eax
 004EB2C0    and         eax,dword ptr [ebx+54]
 004EB2C3    mov         dword ptr [ebx+54],eax
>004EB2C6    jmp         004EB2F8
 004EB2C8    push        esp
 004EB2C9    mov         eax,ebx
 004EB2CB    call        TWinControl.GetHandle
 004EB2D0    push        eax
 004EB2D1    call        user32.BeginPaint
 004EB2D6    mov         esi,eax
 004EB2D8    mov         eax,ebx
 004EB2DA    call        TCustomForm.GetIconHandle
 004EB2DF    push        eax
 004EB2E0    push        0
 004EB2E2    push        0
 004EB2E4    push        esi
 004EB2E5    call        user32.DrawIcon
 004EB2EA    push        esp
 004EB2EB    mov         eax,ebx
 004EB2ED    call        TWinControl.GetHandle
 004EB2F2    push        eax
 004EB2F3    call        user32.EndPaint
 004EB2F8    add         esp,40
 004EB2FB    pop         esi
 004EB2FC    pop         ebx
 004EB2FD    ret
*}
end;

//004EB304
procedure TCustomForm.WMNCPaint(var Message:TWMNCPaint);
begin
{*
 004EB304    push        ebx
 004EB305    mov         ebx,eax
 004EB307    mov         eax,ebx
 004EB309    call        TWinControl.WMNCPaint
 004EB30E    cmp         dword ptr [ebx+2BC],0
>004EB315    je          004EB328
 004EB317    cmp         dword ptr [ebx+34],0
>004EB31B    je          004EB328
 004EB31D    mov         eax,dword ptr [ebx+2BC]
 004EB323    mov         edx,dword ptr [eax]
 004EB325    call        dword ptr [edx+2C]
 004EB328    pop         ebx
 004EB329    ret
*}
end;

//004EB32C
procedure TCustomForm.WMIconEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 004EB32C    push        ebx
 004EB32D    push        esi
 004EB32E    add         esp,0FFFFFFF0
 004EB331    mov         esi,edx
 004EB333    mov         ebx,eax
 004EB335    cmp         byte ptr [ebx+29E],1
>004EB33C    jne         004EB385
 004EB33E    cmp         byte ptr [ebx+29E],1
>004EB345    jne         004EB37C
 004EB347    test        byte ptr [ebx+1C],10
>004EB34B    jne         004EB37C
 004EB34D    mov         eax,[007932EC];Application:TApplication
 004EB352    mov         eax,dword ptr [eax+44]
 004EB355    mov         eax,dword ptr [eax+1C0]
 004EB35B    call        TBrush.GetHandle
 004EB360    push        eax
 004EB361    lea         edx,[esp+4]
 004EB365    mov         eax,ebx
 004EB367    mov         ecx,dword ptr [eax]
 004EB369    call        dword ptr [ecx+54]
 004EB36C    lea         eax,[esp+4]
 004EB370    push        eax
 004EB371    mov         eax,dword ptr [esi+4]
 004EB374    push        eax
 004EB375    call        user32.FillRect
>004EB37A    jmp         004EB385
 004EB37C    mov         edx,esi
 004EB37E    mov         eax,ebx
 004EB380    mov         ecx,dword ptr [eax]
 004EB382    call        dword ptr [ecx-10]
 004EB385    add         esp,10
 004EB388    pop         esi
 004EB389    pop         ebx
 004EB38A    ret
*}
end;

//004EB38C
procedure TCustomForm.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 004EB38C    push        ebx
 004EB38D    push        esi
 004EB38E    mov         esi,edx
 004EB390    mov         ebx,eax
 004EB392    mov         eax,ebx
 004EB394    call        TWinControl.GetHandle
 004EB399    call        IsIconic
 004EB39E    test        eax,eax
>004EB3A0    jne         004EB3AE
 004EB3A2    mov         edx,esi
 004EB3A4    mov         eax,ebx
 004EB3A6    call        TWinControl.WMEraseBkgnd
 004EB3AB    pop         esi
 004EB3AC    pop         ebx
 004EB3AD    ret
 004EB3AE    mov         dword ptr [esi],27
 004EB3B4    mov         edx,esi
 004EB3B6    mov         eax,ebx
 004EB3B8    mov         ecx,dword ptr [eax]
 004EB3BA    call        dword ptr [ecx-10]
 004EB3BD    pop         esi
 004EB3BE    pop         ebx
 004EB3BF    ret
*}
end;

//004EB3C0
procedure TCustomForm.WMQueryDragIcon(var Message:TWMQueryDragIcon);
begin
{*
 004EB3C0    push        ebx
 004EB3C1    push        esi
 004EB3C2    mov         esi,edx
 004EB3C4    mov         ebx,eax
 004EB3C6    mov         eax,ebx
 004EB3C8    call        TCustomForm.GetIconHandle
 004EB3CD    mov         dword ptr [esi+0C],eax
 004EB3D0    pop         esi
 004EB3D1    pop         ebx
 004EB3D2    ret
*}
end;

//004EB3D4
procedure ModifySystemMenu;
begin
{*
 004EB3D4    push        ebp
 004EB3D5    mov         ebp,esp
 004EB3D7    push        ebx
 004EB3D8    mov         eax,dword ptr [ebp+8]
 004EB3DB    mov         eax,dword ptr [eax-4]
 004EB3DE    cmp         byte ptr [eax+299],0
>004EB3E5    je          004EB4CA
 004EB3EB    mov         eax,dword ptr [ebp+8]
 004EB3EE    mov         eax,dword ptr [eax-4]
 004EB3F1    test        byte ptr [eax+298],1
>004EB3F8    je          004EB4CA
 004EB3FE    mov         eax,dword ptr [ebp+8]
 004EB401    mov         eax,dword ptr [eax-4]
 004EB404    cmp         byte ptr [eax+29E],1
>004EB40B    je          004EB4CA
 004EB411    push        0
 004EB413    mov         eax,dword ptr [ebp+8]
 004EB416    mov         eax,dword ptr [eax-4]
 004EB419    call        TWinControl.GetHandle
 004EB41E    push        eax
 004EB41F    call        user32.GetSystemMenu
 004EB424    mov         ebx,eax
 004EB426    mov         eax,dword ptr [ebp+8]
 004EB429    mov         eax,dword ptr [eax-4]
 004EB42C    cmp         byte ptr [eax+299],3
>004EB433    jne         004EB492
 004EB435    push        0
 004EB437    push        0F130
 004EB43C    push        ebx
 004EB43D    call        user32.DeleteMenu
 004EB442    push        400
 004EB447    push        7
 004EB449    push        ebx
 004EB44A    call        user32.DeleteMenu
 004EB44F    push        400
 004EB454    push        5
 004EB456    push        ebx
 004EB457    call        user32.DeleteMenu
 004EB45C    push        0
 004EB45E    push        0F030
 004EB463    push        ebx
 004EB464    call        user32.DeleteMenu
 004EB469    push        0
 004EB46B    push        0F020
 004EB470    push        ebx
 004EB471    call        user32.DeleteMenu
 004EB476    push        0
 004EB478    push        0F000
 004EB47D    push        ebx
 004EB47E    call        user32.DeleteMenu
 004EB483    push        0
 004EB485    push        0F120
 004EB48A    push        ebx
 004EB48B    call        user32.DeleteMenu
>004EB490    jmp         004EB4CA
 004EB492    mov         eax,dword ptr [ebp+8]
 004EB495    mov         eax,dword ptr [eax-4]
 004EB498    test        byte ptr [eax+298],2
>004EB49F    jne         004EB4AE
 004EB4A1    push        1
 004EB4A3    push        0F020
 004EB4A8    push        ebx
 004EB4A9    call        user32.EnableMenuItem
 004EB4AE    mov         eax,dword ptr [ebp+8]
 004EB4B1    mov         eax,dword ptr [eax-4]
 004EB4B4    test        byte ptr [eax+298],4
>004EB4BB    jne         004EB4CA
 004EB4BD    push        1
 004EB4BF    push        0F030
 004EB4C4    push        ebx
 004EB4C5    call        user32.EnableMenuItem
 004EB4CA    pop         ebx
 004EB4CB    pop         ebp
 004EB4CC    ret
*}
end;

//004EB4D0
procedure TCustomForm.WMNCCreate(var Message:TWMNCCreate);
begin
{*
 004EB4D0    push        ebp
 004EB4D1    mov         ebp,esp
 004EB4D3    push        ecx
 004EB4D4    mov         dword ptr [ebp-4],eax
 004EB4D7    mov         eax,dword ptr [ebp-4]
 004EB4DA    mov         ecx,dword ptr [eax]
 004EB4DC    call        dword ptr [ecx-10]
 004EB4DF    mov         eax,dword ptr [ebp-4]
 004EB4E2    mov         edx,dword ptr [eax+2B4]
 004EB4E8    mov         eax,dword ptr [ebp-4]
 004EB4EB    call        TCustomForm.SetMenu
 004EB4F0    mov         eax,dword ptr [ebp-4]
 004EB4F3    test        byte ptr [eax+1C],10
>004EB4F7    jne         004EB500
 004EB4F9    push        ebp
 004EB4FA    call        ModifySystemMenu
 004EB4FF    pop         ecx
 004EB500    pop         ecx
 004EB501    pop         ebp
 004EB502    ret
*}
end;

//004EB504
procedure TCustomForm.WMNCHitTest(var Message:TWMNCHitTest);
begin
{*
 004EB504    push        esi
 004EB505    mov         esi,eax
 004EB507    test        byte ptr [esi+1C],10
>004EB50B    je          004EB51C
 004EB50D    cmp         dword ptr [esi+34],0
>004EB511    je          004EB51C
 004EB513    mov         eax,esi
 004EB515    mov         ecx,dword ptr [eax]
 004EB517    call        dword ptr [ecx-10]
 004EB51A    pop         esi
 004EB51B    ret
 004EB51C    mov         eax,esi
 004EB51E    call        TWinControl.WMNCHitTest
 004EB523    pop         esi
 004EB524    ret
*}
end;

//004EB528
procedure TCustomForm.WMNCLButtonDown(var Message:TWMNCLButtonDown);
begin
{*
 004EB528    push        ebx
 004EB529    push        esi
 004EB52A    mov         esi,edx
 004EB52C    mov         ebx,eax
 004EB52E    cmp         dword ptr [esi+4],2
>004EB532    jne         004EB5A8
 004EB534    cmp         byte ptr [ebx+8B],1
>004EB53B    jne         004EB5A8
 004EB53D    test        byte ptr [ebx+1C],10
>004EB541    jne         004EB5A8
 004EB543    mov         eax,ebx
 004EB545    call        TWinControl.GetHandle
 004EB54A    call        IsIconic
 004EB54F    test        eax,eax
>004EB551    jne         004EB5A8
 004EB553    push        7
 004EB555    push        0
 004EB557    push        0
 004EB559    push        0
 004EB55B    push        0
 004EB55D    push        0
 004EB55F    mov         eax,ebx
 004EB561    call        TWinControl.GetHandle
 004EB566    push        eax
 004EB567    call        user32.SetWindowPos
 004EB56C    mov         eax,dword ptr [esi+8]
 004EB56F    push        eax
 004EB570    mov         eax,dword ptr [esi+4]
 004EB573    push        eax
 004EB574    push        0A2
 004EB579    mov         eax,ebx
 004EB57B    call        TWinControl.GetHandle
 004EB580    push        eax
 004EB581    call        user32.PostMessageW
 004EB586    cmp         byte ptr [ebx+29D],0
>004EB58D    je          004EB5B1
 004EB58F    mov         eax,ebx
 004EB591    mov         edx,dword ptr [eax]
 004EB593    call        dword ptr [edx+60]
 004EB596    mov         edx,eax
 004EB598    xor         dl,1
 004EB59B    or          ecx,0FFFFFFFF
 004EB59E    mov         eax,ebx
 004EB5A0    call        TControl.BeginDrag
 004EB5A5    pop         esi
 004EB5A6    pop         ebx
 004EB5A7    ret
 004EB5A8    mov         edx,esi
 004EB5AA    mov         eax,ebx
 004EB5AC    call        TControl.WMNCLButtonDown
 004EB5B1    pop         esi
 004EB5B2    pop         ebx
 004EB5B3    ret
*}
end;

//004EB5B4
procedure TCustomForm.WMDestroy(var Message:TWMDestroy);
begin
{*
 004EB5B4    push        ebx
 004EB5B5    push        esi
 004EB5B6    push        edi
 004EB5B7    push        ebp
 004EB5B8    add         esp,0FFFFFFF0
 004EB5BB    mov         dword ptr [esp],edx
 004EB5BE    mov         edi,eax
 004EB5C0    mov         eax,edi
 004EB5C2    call        TCustomForm.GetRecreateChildren
 004EB5C7    mov         ebp,eax
 004EB5C9    mov         eax,dword ptr [edi+344]
 004EB5CF    test        eax,eax
>004EB5D1    je          004EB628
 004EB5D3    mov         esi,dword ptr [eax+8]
 004EB5D6    dec         esi
 004EB5D7    test        esi,esi
>004EB5D9    jl          004EB628
 004EB5DB    inc         esi
 004EB5DC    xor         ebx,ebx
 004EB5DE    mov         edx,ebx
 004EB5E0    mov         eax,dword ptr [edi+344]
 004EB5E6    call        TList.Get
 004EB5EB    call        TWinControl.HandleAllocated
 004EB5F0    test        al,al
>004EB5F2    je          004EB624
 004EB5F4    mov         edx,ebx
 004EB5F6    mov         eax,dword ptr [edi+344]
 004EB5FC    call        TList.Get
 004EB601    mov         edx,eax
 004EB603    mov         eax,ebp
 004EB605    call        TList.IndexOf
 004EB60A    test        eax,eax
>004EB60C    jge         004EB624
 004EB60E    mov         edx,ebx
 004EB610    mov         eax,dword ptr [edi+344]
 004EB616    call        TList.Get
 004EB61B    mov         edx,eax
 004EB61D    mov         eax,ebp
 004EB61F    call        TList.Add
 004EB624    inc         ebx
 004EB625    dec         esi
>004EB626    jne         004EB5DE
 004EB628    cmp         dword ptr [edi+358],0
>004EB62F    je          004EB678
 004EB631    mov         eax,dword ptr [edi+358]
 004EB637    call        TCustomForm.GetRecreateChildren
 004EB63C    mov         edx,edi
 004EB63E    call        TList.IndexOf
 004EB643    test        eax,eax
>004EB645    jge         004EB6E8
 004EB64B    mov         eax,dword ptr [edi+358]
 004EB651    call        TCustomForm.GetPopupChildren
 004EB656    mov         edx,edi
 004EB658    call        TList.IndexOf
 004EB65D    inc         eax
>004EB65E    jle         004EB6E8
 004EB664    mov         eax,dword ptr [edi+358]
 004EB66A    call        TCustomForm.GetRecreateChildren
 004EB66F    mov         edx,edi
 004EB671    call        TList.Add
>004EB676    jmp         004EB6E8
 004EB678    test        byte ptr [edi+1C],8
>004EB67C    jne         004EB6E0
 004EB67E    mov         eax,edi
 004EB680    mov         si,0FFA7
 004EB684    call        @CallDynaInst
 004EB689    mov         ebx,eax
 004EB68B    test        ebx,ebx
>004EB68D    je          004EB6E0
 004EB68F    mov         eax,[007932EC];Application:TApplication
 004EB694    cmp         ebx,dword ptr [eax+170]
>004EB69A    je          004EB6E0
 004EB69C    mov         edx,edi
 004EB69E    mov         eax,[007932EC];Application:TApplication
 004EB6A3    call        TApplication.AddPopupForm
 004EB6A8    mov         dword ptr [esp+4],eax
 004EB6AC    mov         eax,dword ptr [edi+258]
 004EB6B2    mov         dword ptr [esp+8],eax
 004EB6B6    cmp         dword ptr [edi+35C],0
 004EB6BD    setne       al
 004EB6C0    mov         byte ptr [esp+0C],al
 004EB6C4    mov         eax,[007932EC];Application:TApplication
 004EB6C9    mov         eax,dword ptr [eax+178]
 004EB6CF    push        eax
 004EB6D0    lea         eax,[esp+8]
 004EB6D4    push        eax
 004EB6D5    push        0B048
 004EB6DA    push        ebx
 004EB6DB    call        user32.SendMessageW
 004EB6E0    xor         eax,eax
 004EB6E2    mov         dword ptr [edi+35C],eax
 004EB6E8    mov         eax,[0078D264];^NewStyleControls:Boolean
 004EB6ED    cmp         byte ptr [eax],0
>004EB6F0    je          004EB708
 004EB6F2    push        0
 004EB6F4    push        1
 004EB6F6    push        80
 004EB6FB    mov         eax,edi
 004EB6FD    call        TWinControl.GetHandle
 004EB702    push        eax
 004EB703    call        user32.SendMessageW
 004EB708    cmp         dword ptr [edi+2B4],0
>004EB70F    je          004EB736
 004EB711    cmp         byte ptr [edi+29E],1
>004EB718    je          004EB736
 004EB71A    push        0
 004EB71C    mov         eax,edi
 004EB71E    call        TWinControl.GetHandle
 004EB723    push        eax
 004EB724    call        user32.SetMenu
 004EB729    xor         edx,edx
 004EB72B    mov         eax,dword ptr [edi+2B4]
 004EB731    call        TMenu.SetWindowHandle
 004EB736    mov         edx,dword ptr [esp]
 004EB739    mov         eax,edi
 004EB73B    call        TWinControl.WMDestroy
 004EB740    add         esp,10
 004EB743    pop         ebp
 004EB744    pop         edi
 004EB745    pop         esi
 004EB746    pop         ebx
 004EB747    ret
*}
end;

//004EB748
procedure TCustomForm.WMCommand(Message:TWMCharToItem);
begin
{*
 004EB748    push        ebx
 004EB749    push        esi
 004EB74A    mov         esi,edx
 004EB74C    mov         ebx,eax
 004EB74E    cmp         dword ptr [esi+8],0
>004EB752    jne         004EB770
 004EB754    cmp         dword ptr [ebx+2B4],0;TCustomForm.FMenu:TMainMenu
>004EB75B    je          004EB770
 004EB75D    movzx       edx,word ptr [esi+4]
 004EB761    mov         eax,dword ptr [ebx+2B4];TCustomForm.FMenu:TMainMenu
 004EB767    call        TMenu.DispatchCommand
 004EB76C    test        al,al
>004EB76E    jne         004EB779
 004EB770    mov         edx,esi
 004EB772    mov         eax,ebx
 004EB774    call        TWinControl.WMCharToItem
 004EB779    pop         esi
 004EB77A    pop         ebx
 004EB77B    ret
*}
end;

//004EB77C
procedure TCustomForm.WMInitMenuPopup(var Message:TWMInitMenuPopup);
begin
{*
 004EB77C    mov         ecx,dword ptr [eax+2B4]
 004EB782    test        ecx,ecx
>004EB784    je          004EB790
 004EB786    mov         edx,dword ptr [edx+4]
 004EB789    mov         eax,ecx
 004EB78B    call        TMenu.DispatchPopup
 004EB790    ret
*}
end;

//004EB794
procedure TCustomForm.WMMenuChar(var Message:TWMMenuChar);
begin
{*
 004EB794    push        ebx
 004EB795    push        esi
 004EB796    mov         esi,edx
 004EB798    mov         ebx,eax
 004EB79A    mov         eax,dword ptr [ebx+2B4]
 004EB7A0    test        eax,eax
>004EB7A2    je          004EB7BD
 004EB7A4    mov         edx,esi
 004EB7A6    call        TMenu.ProcessMenuChar
 004EB7AB    cmp         dword ptr [esi+0C],0
>004EB7AF    jne         004EB7C6
 004EB7B1    mov         edx,esi
 004EB7B3    mov         eax,ebx
 004EB7B5    mov         ecx,dword ptr [eax]
 004EB7B7    call        dword ptr [ecx-10]
 004EB7BA    pop         esi
 004EB7BB    pop         ebx
 004EB7BC    ret
 004EB7BD    mov         edx,esi
 004EB7BF    mov         eax,ebx
 004EB7C1    mov         ecx,dword ptr [eax]
 004EB7C3    call        dword ptr [ecx-10]
 004EB7C6    pop         esi
 004EB7C7    pop         ebx
 004EB7C8    ret
*}
end;

//004EB7CC
procedure TCustomForm.WMMenuSelect(var Message:TWMMenuSelect);
begin
{*
 004EB7CC    push        ebp
 004EB7CD    mov         ebp,esp
 004EB7CF    push        0
 004EB7D1    push        ebx
 004EB7D2    push        esi
 004EB7D3    push        edi
 004EB7D4    mov         edi,eax
 004EB7D6    xor         eax,eax
 004EB7D8    push        ebp
 004EB7D9    push        4EB867
 004EB7DE    push        dword ptr fs:[eax]
 004EB7E1    mov         dword ptr fs:[eax],esp
 004EB7E4    cmp         dword ptr [edi+2B4],0
>004EB7EB    je          004EB851
 004EB7ED    xor         esi,esi
 004EB7EF    cmp         word ptr [edx+6],0FFFF
>004EB7F5    jne         004EB7FE
 004EB7F7    cmp         word ptr [edx+4],0
>004EB7FC    je          004EB827
 004EB7FE    xor         ebx,ebx
 004EB800    movzx       eax,word ptr [edx+4]
 004EB804    test        byte ptr [edx+6],10
>004EB808    je          004EB816
 004EB80A    mov         bl,1
 004EB80C    push        eax
 004EB80D    mov         eax,dword ptr [edx+8]
 004EB810    push        eax
 004EB811    call        user32.GetSubMenu
 004EB816    mov         ecx,ebx
 004EB818    mov         edx,eax
 004EB81A    mov         eax,dword ptr [edi+2B4]
 004EB820    call        TMenu.FindItem
 004EB825    mov         esi,eax
 004EB827    test        esi,esi
>004EB829    je          004EB845
 004EB82B    lea         edx,[ebp-4]
 004EB82E    mov         eax,dword ptr [esi+58]
 004EB831    call        GetLongHint
 004EB836    mov         edx,dword ptr [ebp-4]
 004EB839    mov         eax,[007932EC];Application:TApplication
 004EB83E    call        TApplication.SetHint
>004EB843    jmp         004EB851
 004EB845    xor         edx,edx
 004EB847    mov         eax,[007932EC];Application:TApplication
 004EB84C    call        TApplication.SetHint
 004EB851    xor         eax,eax
 004EB853    pop         edx
 004EB854    pop         ecx
 004EB855    pop         ecx
 004EB856    mov         dword ptr fs:[eax],edx
 004EB859    push        4EB86E
 004EB85E    lea         eax,[ebp-4]
 004EB861    call        @UStrClr
 004EB866    ret
>004EB867    jmp         @HandleFinally
>004EB86C    jmp         004EB85E
 004EB86E    pop         edi
 004EB86F    pop         esi
 004EB870    pop         ebx
 004EB871    pop         ecx
 004EB872    pop         ebp
 004EB873    ret
*}
end;

//004EB874
procedure TCustomForm.WMActivate(var Message:TWMActivate);
begin
{*
 004EB874    push        ebx
 004EB875    push        esi
 004EB876    mov         esi,edx
 004EB878    mov         ebx,eax
 004EB87A    push        0F0
 004EB87C    mov         eax,ebx
 004EB87E    call        TWinControl.GetHandle
 004EB883    push        eax
 004EB884    call        user32.GetWindowLongW
 004EB889    and         eax,40000000
 004EB88E    cmp         eax,40000000
>004EB893    je          004EB8B3
 004EB895    cmp         byte ptr [ebx+29E],2
>004EB89C    jne         004EB8A4
 004EB89E    test        byte ptr [ebx+1C],10
>004EB8A2    je          004EB8B3
 004EB8A4    cmp         word ptr [esi+4],0
 004EB8A9    setne       dl
 004EB8AC    mov         eax,ebx
 004EB8AE    call        TCustomForm.SetActive
 004EB8B3    pop         esi
 004EB8B4    pop         ebx
 004EB8B5    ret
*}
end;

//004EB8B8
procedure TCustomForm.Resizing(State:TWindowState);
begin
{*
 004EB8B8    push        ebx
 004EB8B9    mov         ebx,eax
 004EB8BB    test        byte ptr [ebx+1C],10
>004EB8BF    jne         004EB8CD
 004EB8C1    test        byte ptr [ebx+55],20
>004EB8C5    jne         004EB8CD
 004EB8C7    mov         byte ptr [ebx+29A],dl
 004EB8CD    cmp         dl,1
>004EB8D0    je          004EB8D9
 004EB8D2    mov         eax,ebx
 004EB8D4    mov         edx,dword ptr [eax]
 004EB8D6    call        dword ptr [edx+68]
 004EB8D9    cmp         dword ptr [ebx+2CC],0
>004EB8E0    je          004EB8ED
 004EB8E2    mov         eax,dword ptr [ebx+2CC]
 004EB8E8    mov         edx,dword ptr [eax]
 004EB8EA    call        dword ptr [edx+10]
 004EB8ED    pop         ebx
 004EB8EE    ret
*}
end;

//004EB8F0
procedure TCustomForm.WMClose;
begin
{*
 004EB8F0    call        TCustomForm.Close
 004EB8F5    ret
*}
end;

//004EB8F8
procedure TCustomForm.WMQueryEndSession(var Message:TWMQueryEndSession);
begin
{*
 004EB8F8    push        ebx
 004EB8F9    push        esi
 004EB8FA    mov         esi,edx
 004EB8FC    mov         ebx,eax
 004EB8FE    mov         eax,ebx
 004EB900    mov         edx,dword ptr [eax]
 004EB902    call        dword ptr [edx+10C]
 004EB908    and         eax,7F
 004EB90B    mov         dword ptr [esi+0C],eax
 004EB90E    pop         esi
 004EB90F    pop         ebx
 004EB910    ret
*}
end;

//004EB914
procedure TCustomForm.CMAppSysCommand(var Message:TMessage);
begin
{*
 004EB914    push        ebx
 004EB915    push        esi
 004EB916    mov         ebx,edx
 004EB918    xor         edx,edx
 004EB91A    mov         dword ptr [ebx+0C],edx
 004EB91D    test        byte ptr [eax+1C],10
>004EB921    jne         004EB941
 004EB923    cmp         byte ptr [eax+29E],1
>004EB92A    je          004EB941
 004EB92C    cmp         dword ptr [eax+2B4],0
>004EB933    je          004EB941
 004EB935    mov         edx,dword ptr [eax+2B4]
 004EB93B    cmp         byte ptr [edx+64],0
>004EB93F    je          004EB967
 004EB941    mov         esi,dword ptr [ebx+8]
 004EB944    xor         edx,edx
 004EB946    call        TCustomForm.SendCancelMode
 004EB94B    movzx       ecx,word ptr [esi+8]
 004EB94F    mov         edx,dword ptr [esi+4]
 004EB952    mov         eax,0B017
 004EB957    call        SendAppMessage
 004EB95C    test        eax,eax
>004EB95E    je          004EB967
 004EB960    mov         dword ptr [ebx+0C],1
 004EB967    pop         esi
 004EB968    pop         ebx
 004EB969    ret
*}
end;

//004EB96C
procedure TCustomForm.WMSysCommand(var Message:TWMSysCommand);
begin
{*
 004EB96C    push        ebx
 004EB96D    push        esi
 004EB96E    mov         esi,edx
 004EB970    mov         ebx,eax
 004EB972    mov         eax,dword ptr [esi+4]
 004EB975    and         eax,0FFF0
 004EB97A    cmp         eax,0F020
>004EB97F    jne         004EB999
 004EB981    mov         eax,[007932EC];Application:TApplication
 004EB986    cmp         ebx,dword ptr [eax+44]
>004EB989    jne         004EB999
 004EB98B    mov         edx,esi
 004EB98D    mov         eax,[007932EC];Application:TApplication
 004EB992    call        TApplication.WndProc
>004EB997    jmp         004EB9C6
 004EB999    mov         eax,dword ptr [esi+4]
 004EB99C    and         eax,0FFF0
 004EB9A1    cmp         eax,0F010
>004EB9A6    jne         004EB9BD
 004EB9A8    test        byte ptr [ebx+1C],10
>004EB9AC    jne         004EB9BD
 004EB9AE    cmp         byte ptr [ebx+5D],0
>004EB9B2    je          004EB9BD
 004EB9B4    cmp         byte ptr [ebx+29A],1
>004EB9BB    jne         004EB9C6
 004EB9BD    mov         edx,esi
 004EB9BF    mov         eax,ebx
 004EB9C1    call        TWinControl.WMSysCommand
 004EB9C6    mov         eax,dword ptr [esi+4]
 004EB9C9    and         eax,0FFF0
 004EB9CE    cmp         eax,0F020
>004EB9D3    je          004EB9DC
 004EB9D5    cmp         eax,0F120
>004EB9DA    jne         004EB9EF
 004EB9DC    test        byte ptr [ebx+1C],10
>004EB9E0    jne         004EB9EF
 004EB9E2    cmp         byte ptr [ebx+5D],0
>004EB9E6    je          004EB9EF
 004EB9E8    mov         eax,ebx
 004EB9EA    mov         edx,dword ptr [eax]
 004EB9EC    call        dword ptr [edx+68]
 004EB9EF    pop         esi
 004EB9F0    pop         ebx
 004EB9F1    ret
*}
end;

//004EB9F4
procedure TCustomForm.WMShowWindow(var Message:TWMShowWindow);
begin
{*
 004EB9F4    push        ebx
 004EB9F5    push        esi
 004EB9F6    mov         esi,edx
 004EB9F8    mov         ebx,eax
 004EB9FA    mov         eax,dword ptr [esi+8]
 004EB9FD    dec         eax
>004EB9FE    je          004EBA0A
 004EBA00    sub         eax,2
>004EBA03    je          004EBA50
>004EBA05    jmp         004EBA92
 004EBA0A    mov         eax,ebx
 004EBA0C    call        TWinControl.GetHandle
 004EBA11    call        IsIconic
 004EBA16    test        eax,eax
>004EBA18    je          004EBA23
 004EBA1A    mov         byte ptr [ebx+29B],2
>004EBA21    jmp         004EBA44
 004EBA23    mov         eax,ebx
 004EBA25    call        TWinControl.GetHandle
 004EBA2A    push        eax
 004EBA2B    call        user32.IsZoomed
 004EBA30    test        eax,eax
>004EBA32    je          004EBA3D
 004EBA34    mov         byte ptr [ebx+29B],3
>004EBA3B    jmp         004EBA44
 004EBA3D    mov         byte ptr [ebx+29B],1
 004EBA44    mov         edx,esi
 004EBA46    mov         eax,ebx
 004EBA48    mov         ecx,dword ptr [eax]
 004EBA4A    call        dword ptr [ecx-10]
 004EBA4D    pop         esi
 004EBA4E    pop         ebx
 004EBA4F    ret
 004EBA50    cmp         byte ptr [ebx+29B],0
>004EBA57    je          004EBA9B
 004EBA59    movzx       eax,byte ptr [ebx+29B]
 004EBA60    mov         eax,dword ptr [eax*4+786768]
 004EBA67    push        eax
 004EBA68    mov         eax,ebx
 004EBA6A    call        TWinControl.GetHandle
 004EBA6F    push        eax
 004EBA70    call        user32.ShowWindow
 004EBA75    mov         byte ptr [ebx+29B],0
 004EBA7C    mov         eax,[007932EC];Application:TApplication
 004EBA81    cmp         ebx,dword ptr [eax+44]
>004EBA84    jne         004EBA9B
 004EBA86    mov         eax,[007932EC];Application:TApplication
 004EBA8B    mov         byte ptr [eax+34],0
 004EBA8F    pop         esi
 004EBA90    pop         ebx
 004EBA91    ret
 004EBA92    mov         edx,esi
 004EBA94    mov         eax,ebx
 004EBA96    mov         ecx,dword ptr [eax]
 004EBA98    call        dword ptr [ecx-10]
 004EBA9B    pop         esi
 004EBA9C    pop         ebx
 004EBA9D    ret
*}
end;

//004EBAA0
procedure TCustomForm.WMMDIActivate(var Message:TWMMDIActivate);
begin
{*
 004EBAA0    push        ebx
 004EBAA1    push        esi
 004EBAA2    mov         ebx,edx
 004EBAA4    mov         esi,eax
 004EBAA6    mov         edx,ebx
 004EBAA8    mov         eax,esi
 004EBAAA    mov         ecx,dword ptr [eax]
 004EBAAC    call        dword ptr [ecx-10]
 004EBAAF    cmp         byte ptr [esi+29E],1
>004EBAB6    jne         004EBAF5
 004EBAB8    mov         eax,esi
 004EBABA    call        TWinControl.GetHandle
 004EBABF    cmp         eax,dword ptr [ebx+8]
 004EBAC2    sete        al
 004EBAC5    mov         ebx,eax
 004EBAC7    mov         edx,ebx
 004EBAC9    mov         eax,esi
 004EBACB    call        TCustomForm.SetActive
 004EBAD0    test        bl,bl
>004EBAD2    je          004EBAF5
 004EBAD4    mov         eax,[007932EC];Application:TApplication
 004EBAD9    mov         eax,dword ptr [eax+44]
 004EBADC    test        byte ptr [eax+54],4
>004EBAE0    je          004EBAF5
 004EBAE2    mov         eax,[007932EC];Application:TApplication
 004EBAE7    mov         eax,dword ptr [eax+44]
 004EBAEA    mov         dl,1
 004EBAEC    mov         si,0FFD1
 004EBAF0    call        @CallDynaInst
 004EBAF5    pop         esi
 004EBAF6    pop         ebx
 004EBAF7    ret
*}
end;

//004EBAF8
procedure TCustomForm.WMNextDlgCtl(var Message:TWMNextDlgCtl);
begin
{*
 004EBAF8    cmp         word ptr [edx+8],0
>004EBAFD    je          004EBB09
 004EBAFF    mov         eax,dword ptr [edx+4]
 004EBB02    push        eax
 004EBB03    call        user32.SetFocus
 004EBB08    ret
 004EBB09    push        1
 004EBB0B    mov         ecx,dword ptr [edx+4]
 004EBB0E    cmp         ecx,1
 004EBB11    sbb         ecx,ecx
 004EBB13    neg         ecx
 004EBB15    mov         edx,dword ptr [eax+290]
 004EBB1B    call        TWinControl.SelectNext
 004EBB20    ret
*}
end;

//004EBB24
procedure TCustomForm.WMEnterMenuLoop(var Message:TMessage);
begin
{*
 004EBB24    push        ebx
 004EBB25    push        esi
 004EBB26    mov         esi,edx
 004EBB28    mov         ebx,eax
 004EBB2A    xor         edx,edx
 004EBB2C    mov         eax,ebx
 004EBB2E    call        TCustomForm.SendCancelMode
 004EBB33    mov         edx,esi
 004EBB35    mov         eax,ebx
 004EBB37    mov         ecx,dword ptr [eax]
 004EBB39    call        dword ptr [ecx-10]
 004EBB3C    pop         esi
 004EBB3D    pop         ebx
 004EBB3E    ret
*}
end;

//004EBB40
function GetMenuHelpContext(Menu:TMenu):Integer;
begin
{*
 004EBB40    push        ebp
 004EBB41    mov         ebp,esp
 004EBB43    push        ebx
 004EBB44    mov         ebx,eax
 004EBB46    xor         eax,eax
 004EBB48    test        ebx,ebx
>004EBB4A    je          004EBB7A
 004EBB4C    mov         eax,dword ptr [ebp+8]
 004EBB4F    mov         eax,dword ptr [eax-4]
 004EBB52    mov         eax,dword ptr [eax+8]
 004EBB55    mov         edx,dword ptr [eax+8]
 004EBB58    mov         cl,1
 004EBB5A    mov         eax,ebx
 004EBB5C    call        TMenu.GetHelpContext
 004EBB61    test        eax,eax
>004EBB63    jne         004EBB7A
 004EBB65    mov         eax,dword ptr [ebp+8]
 004EBB68    mov         eax,dword ptr [eax-4]
 004EBB6B    mov         eax,dword ptr [eax+8]
 004EBB6E    mov         edx,dword ptr [eax+0C]
 004EBB71    xor         ecx,ecx
 004EBB73    mov         eax,ebx
 004EBB75    call        TMenu.GetHelpContext
 004EBB7A    pop         ebx
 004EBB7B    pop         ebp
 004EBB7C    ret
*}
end;

//004EBB80
function ControlHasHelp(const Control:TWinControl):Boolean;
begin
{*
 004EBB80    push        ebx
 004EBB81    push        esi
 004EBB82    mov         esi,eax
 004EBB84    xor         ebx,ebx
 004EBB86    cmp         byte ptr [esi+160],1
>004EBB8D    jne         004EBB9C
 004EBB8F    cmp         dword ptr [esi+168],0
>004EBB96    je          004EBB9C
 004EBB98    mov         bl,1
>004EBB9A    jmp         004EBBB0
 004EBB9C    cmp         byte ptr [esi+160],0
>004EBBA3    jne         004EBBB0
 004EBBA5    cmp         dword ptr [esi+164],0
>004EBBAC    je          004EBBB0
 004EBBAE    mov         bl,1
 004EBBB0    mov         eax,ebx
 004EBBB2    pop         esi
 004EBBB3    pop         ebx
 004EBBB4    ret
*}
end;

//004EBBB8
procedure GetHelpInfo(const Control:TWinControl; var HType:THelpType; var ContextID:Integer; var Keyword:UnicodeString);
begin
{*
 004EBBB8    push        ebp
 004EBBB9    mov         ebp,esp
 004EBBBB    push        ebx
 004EBBBC    mov         ebx,eax
 004EBBBE    cmp         byte ptr [ebx+160],1
>004EBBC5    jne         004EBBD4
 004EBBC7    mov         byte ptr [edx],1
 004EBBCA    mov         eax,dword ptr [ebx+168]
 004EBBD0    mov         dword ptr [ecx],eax
>004EBBD2    jmp         004EBBE5
 004EBBD4    mov         byte ptr [edx],0
 004EBBD7    mov         eax,dword ptr [ebp+8]
 004EBBDA    mov         edx,dword ptr [ebx+164]
 004EBBE0    call        @UStrAsg
 004EBBE5    pop         ebx
 004EBBE6    pop         ebp
 004EBBE7    ret         4
*}
end;

//004EBBEC
procedure TCustomForm.WMHelp(var Message:TWMHelp);
begin
{*
 004EBBEC    push        ebp
 004EBBED    mov         ebp,esp
 004EBBEF    add         esp,0FFFFFFD0
 004EBBF2    push        ebx
 004EBBF3    push        esi
 004EBBF4    xor         ecx,ecx
 004EBBF6    mov         dword ptr [ebp-8],ecx
 004EBBF9    mov         dword ptr [ebp-4],edx
 004EBBFC    mov         esi,eax
 004EBBFE    xor         eax,eax
 004EBC00    push        ebp
 004EBC01    push        4EBD3E
 004EBC06    push        dword ptr fs:[eax]
 004EBC09    mov         dword ptr fs:[eax],esp
 004EBC0C    test        byte ptr [esi+1C],10
>004EBC10    jne         004EBD28
 004EBC16    mov         eax,dword ptr [ebp-4]
 004EBC19    mov         eax,dword ptr [eax+8]
 004EBC1C    cmp         dword ptr [eax+4],1
>004EBC20    jne         004EBC72
 004EBC22    mov         eax,dword ptr [eax+0C]
 004EBC25    call        FindControl
 004EBC2A    mov         ebx,eax
>004EBC2C    jmp         004EBC31
 004EBC2E    mov         ebx,dword ptr [ebx+34]
 004EBC31    test        ebx,ebx
>004EBC33    je          004EBC40
 004EBC35    mov         eax,ebx
 004EBC37    call        ControlHasHelp
 004EBC3C    test        al,al
>004EBC3E    je          004EBC2E
 004EBC40    test        ebx,ebx
>004EBC42    je          004EBD28
 004EBC48    lea         eax,[ebp-8]
 004EBC4B    push        eax
 004EBC4C    lea         ecx,[ebp-0C]
 004EBC4F    lea         edx,[ebp-0D]
 004EBC52    mov         eax,ebx
 004EBC54    call        GetHelpInfo
 004EBC59    xor         eax,eax
 004EBC5B    mov         dword ptr [ebp-20],eax
 004EBC5E    xor         eax,eax
 004EBC60    mov         dword ptr [ebp-1C],eax
 004EBC63    lea         ecx,[ebp-18]
 004EBC66    lea         edx,[ebp-20]
 004EBC69    mov         eax,ebx
 004EBC6B    call        TControl.ClientToScreen
>004EBC70    jmp         004EBCB0
 004EBC72    mov         byte ptr [ebp-0D],1
 004EBC76    push        ebp
 004EBC77    mov         eax,dword ptr [esi+2B4]
 004EBC7D    call        GetMenuHelpContext
 004EBC82    pop         ecx
 004EBC83    mov         dword ptr [ebp-0C],eax
 004EBC86    cmp         dword ptr [ebp-0C],0
>004EBC8A    jne         004EBC99
 004EBC8C    push        ebp
 004EBC8D    mov         eax,dword ptr [esi+7C]
 004EBC90    call        GetMenuHelpContext
 004EBC95    pop         ecx
 004EBC96    mov         dword ptr [ebp-0C],eax
 004EBC99    xor         eax,eax
 004EBC9B    mov         dword ptr [ebp-28],eax
 004EBC9E    xor         eax,eax
 004EBCA0    mov         dword ptr [ebp-24],eax
 004EBCA3    lea         ecx,[ebp-18]
 004EBCA6    lea         edx,[ebp-28]
 004EBCA9    mov         eax,esi
 004EBCAB    call        TControl.ClientToScreen
 004EBCB0    test        byte ptr [esi+298],8
>004EBCB7    je          004EBD00
 004EBCB9    cmp         byte ptr [ebp-0D],1
>004EBCBD    jne         004EBD00
 004EBCBF    mov         eax,dword ptr [ebp-18]
 004EBCC2    mov         dword ptr [ebp-30],eax
 004EBCC5    mov         eax,dword ptr [ebp-14]
 004EBCC8    mov         dword ptr [ebp-2C],eax
 004EBCCB    mov         eax,dword ptr [ebp-30]
 004EBCCE    and         eax,0FFFF
 004EBCD3    mov         edx,dword ptr [ebp-2C]
 004EBCD6    shl         edx,10
 004EBCD9    or          eax,edx
 004EBCDB    mov         ecx,eax
 004EBCDD    mov         edx,0D
 004EBCE2    mov         eax,[007932EC];Application:TApplication
 004EBCE7    call        TApplication.HelpCommand
 004EBCEC    mov         ecx,dword ptr [ebp-0C]
 004EBCEF    mov         edx,8
 004EBCF4    mov         eax,[007932EC];Application:TApplication
 004EBCF9    call        TApplication.HelpCommand
>004EBCFE    jmp         004EBD28
 004EBD00    cmp         byte ptr [ebp-0D],1
>004EBD04    jne         004EBD15
 004EBD06    mov         edx,dword ptr [ebp-0C]
 004EBD09    mov         eax,[007932EC];Application:TApplication
 004EBD0E    call        TApplication.HelpContext
>004EBD13    jmp         004EBD28
 004EBD15    cmp         byte ptr [ebp-0D],0
>004EBD19    jne         004EBD28
 004EBD1B    mov         edx,dword ptr [ebp-8]
 004EBD1E    mov         eax,[007932EC];Application:TApplication
 004EBD23    call        TApplication.HelpKeyword
 004EBD28    xor         eax,eax
 004EBD2A    pop         edx
 004EBD2B    pop         ecx
 004EBD2C    pop         ecx
 004EBD2D    mov         dword ptr fs:[eax],edx
 004EBD30    push        4EBD45
 004EBD35    lea         eax,[ebp-8]
 004EBD38    call        @UStrClr
 004EBD3D    ret
>004EBD3E    jmp         @HandleFinally
>004EBD43    jmp         004EBD35
 004EBD45    pop         esi
 004EBD46    pop         ebx
 004EBD47    mov         esp,ebp
 004EBD49    pop         ebp
 004EBD4A    ret
*}
end;

//004EBD4C
procedure TCustomForm.WMGetMinMaxInfo(var Message:TWMGetMinMaxInfo);
begin
{*
 004EBD4C    push        ebx
 004EBD4D    push        esi
 004EBD4E    push        edi
 004EBD4F    push        ecx
 004EBD50    mov         dword ptr [esp],edx
 004EBD53    mov         esi,eax
 004EBD55    test        byte ptr [esi+1C],2
>004EBD59    jne         004EBDA7
 004EBD5B    mov         eax,dword ptr [esp]
 004EBD5E    mov         eax,dword ptr [eax+8]
 004EBD61    mov         edi,eax
 004EBD63    mov         eax,dword ptr [esi+70]
 004EBD66    lea         edx,[edi+18]
 004EBD69    mov         ecx,dword ptr [eax+14]
 004EBD6C    test        ecx,ecx
>004EBD6E    jbe         004EBD72
 004EBD70    mov         dword ptr [edx],ecx
 004EBD72    mov         ecx,dword ptr [eax+10]
 004EBD75    test        ecx,ecx
>004EBD77    jbe         004EBD7C
 004EBD79    mov         dword ptr [edx+4],ecx
 004EBD7C    lea         edx,[edi+20]
 004EBD7F    mov         ecx,dword ptr [eax+0C]
 004EBD82    test        ecx,ecx
>004EBD84    jbe         004EBD88
 004EBD86    mov         dword ptr [edx],ecx
 004EBD88    mov         ecx,dword ptr [eax+8]
 004EBD8B    test        ecx,ecx
>004EBD8D    jbe         004EBD92
 004EBD8F    mov         dword ptr [edx+4],ecx
 004EBD92    lea         eax,[edi+20]
 004EBD95    push        eax
 004EBD96    lea         eax,[edi+24]
 004EBD99    push        eax
 004EBD9A    lea         ecx,[edi+1C]
 004EBD9D    lea         edx,[edi+18]
 004EBDA0    mov         eax,esi
 004EBDA2    mov         ebx,dword ptr [eax]
 004EBDA4    call        dword ptr [ebx+3C]
 004EBDA7    mov         edx,dword ptr [esp]
 004EBDAA    mov         eax,esi
 004EBDAC    mov         ecx,dword ptr [eax]
 004EBDAE    call        dword ptr [ecx-10]
 004EBDB1    pop         edx
 004EBDB2    pop         edi
 004EBDB3    pop         esi
 004EBDB4    pop         ebx
 004EBDB5    ret
*}
end;

//004EBDB8
procedure HandleEdge(var Edge:Integer; SnapToEdge:Integer; SnapDistance:Integer);
begin
{*
 004EBDB8    push        ebp
 004EBDB9    mov         ebp,esp
 004EBDBB    push        ebx
 004EBDBC    push        esi
 004EBDBD    mov         esi,edx
 004EBDBF    mov         ebx,eax
 004EBDC1    mov         eax,dword ptr [ebx]
 004EBDC3    add         eax,ecx
 004EBDC5    sub         eax,esi
 004EBDC7    cdq
 004EBDC8    xor         eax,edx
 004EBDCA    sub         eax,edx
 004EBDCC    mov         edx,dword ptr [ebp+8]
 004EBDCF    mov         edx,dword ptr [edx-4]
 004EBDD2    cmp         eax,dword ptr [edx+364]
>004EBDD8    jge         004EBDDE
 004EBDDA    sub         esi,ecx
 004EBDDC    mov         dword ptr [ebx],esi
 004EBDDE    pop         esi
 004EBDDF    pop         ebx
 004EBDE0    pop         ebp
 004EBDE1    ret
*}
end;

//004EBDE4
procedure TCustomForm.WMWindowPosChanging(var Message:TWMWindowPosChanging);
begin
{*
 004EBDE4    push        ebp
 004EBDE5    mov         ebp,esp
 004EBDE7    add         esp,0FFFFFFCC
 004EBDEA    push        ebx
 004EBDEB    push        esi
 004EBDEC    push        edi
 004EBDED    mov         edi,edx
 004EBDEF    mov         dword ptr [ebp-4],eax
 004EBDF2    mov         ebx,dword ptr [edi+8]
 004EBDF5    mov         eax,dword ptr [ebx+18]
 004EBDF8    and         eax,8000
 004EBDFD    cmp         eax,8000
>004EBE02    jne         004EBE0C
 004EBE04    mov         eax,dword ptr [ebp-4]
 004EBE07    call        TCustomForm.UpdateWindowState
 004EBE0C    mov         eax,dword ptr [ebp-4]
 004EBE0F    cmp         byte ptr [eax+360],0
>004EBE16    je          004EBEA6
 004EBE1C    mov         eax,dword ptr [ebp-4]
 004EBE1F    cmp         dword ptr [eax+34],0
>004EBE23    je          004EBE2E
 004EBE25    mov         eax,dword ptr [ebp-4]
 004EBE28    test        byte ptr [eax+1C],10
>004EBE2C    jne         004EBEA6
 004EBE2E    cmp         dword ptr [ebx+8],0
>004EBE32    jne         004EBE3A
 004EBE34    cmp         dword ptr [ebx+0C],0
>004EBE38    je          004EBEA6
 004EBE3A    mov         eax,dword ptr [ebp-4]
 004EBE3D    mov         eax,dword ptr [eax+48]
 004EBE40    cmp         eax,dword ptr [ebx+10]
>004EBE43    jne         004EBEA6
 004EBE45    mov         eax,dword ptr [ebp-4]
 004EBE48    mov         eax,dword ptr [eax+4C]
 004EBE4B    cmp         eax,dword ptr [ebx+14]
>004EBE4E    jne         004EBEA6
 004EBE50    mov         esi,ebx
 004EBE52    mov         eax,dword ptr [ebp-4]
 004EBE55    call        TCustomForm.GetMonitor
 004EBE5A    lea         edx,[ebp-34]
 004EBE5D    call        TMonitor.GetWorkareaRect
 004EBE62    push        ebp
 004EBE63    lea         eax,[esi+8]
 004EBE66    xor         ecx,ecx
 004EBE68    mov         edx,dword ptr [ebp-34]
 004EBE6B    call        HandleEdge
 004EBE70    pop         ecx
 004EBE71    push        ebp
 004EBE72    lea         eax,[esi+0C]
 004EBE75    xor         ecx,ecx
 004EBE77    mov         edx,dword ptr [ebp-30]
 004EBE7A    call        HandleEdge
 004EBE7F    pop         ecx
 004EBE80    push        ebp
 004EBE81    mov         eax,dword ptr [ebp-4]
 004EBE84    mov         ecx,dword ptr [eax+48]
 004EBE87    lea         eax,[esi+8]
 004EBE8A    mov         edx,dword ptr [ebp-2C]
 004EBE8D    call        HandleEdge
 004EBE92    pop         ecx
 004EBE93    push        ebp
 004EBE94    mov         eax,dword ptr [ebp-4]
 004EBE97    mov         ecx,dword ptr [eax+4C]
 004EBE9A    lea         eax,[esi+0C]
 004EBE9D    mov         edx,dword ptr [ebp-28]
 004EBEA0    call        HandleEdge
 004EBEA5    pop         ecx
 004EBEA6    mov         edx,edi
 004EBEA8    mov         eax,dword ptr [ebp-4]
 004EBEAB    call        TWinControl.WMWindowPosChanging
 004EBEB0    mov         eax,dword ptr [ebp-4]
 004EBEB3    mov         esi,dword ptr [eax+374]
 004EBEB9    mov         eax,esi
 004EBEBB    call        TGlassFrame.FrameExtended
 004EBEC0    test        al,al
>004EBEC2    je          004EBFBF
 004EBEC8    cmp         byte ptr [esi+28],0
>004EBECC    jne         004EBFBF
 004EBED2    mov         eax,dword ptr [ebp-4]
 004EBED5    cmp         byte ptr [eax+59],0
>004EBED9    jne         004EBEE8
 004EBEDB    mov         eax,dword ptr [ebp-4]
 004EBEDE    test        byte ptr [eax+1C],10
>004EBEE2    je          004EBFBF
 004EBEE8    mov         eax,dword ptr [ebx+10]
 004EBEEB    test        eax,eax
>004EBEED    jne         004EBEF9
 004EBEEF    cmp         dword ptr [ebx+14],0
>004EBEF3    je          004EBFBF
 004EBEF9    mov         edx,dword ptr [ebp-4]
 004EBEFC    mov         edi,eax
 004EBEFE    sub         edi,dword ptr [edx+48]
 004EBF01    mov         eax,dword ptr [ebp-4]
 004EBF04    mov         edx,dword ptr [ebx+14]
 004EBF07    sub         edx,dword ptr [eax+4C]
 004EBF0A    mov         ebx,edx
 004EBF0C    test        edi,edi
>004EBF0E    jne         004EBF18
 004EBF10    test        ebx,ebx
>004EBF12    je          004EBFBF
 004EBF18    lea         edx,[ebp-14]
 004EBF1B    mov         eax,dword ptr [ebp-4]
 004EBF1E    mov         ecx,dword ptr [eax]
 004EBF20    call        dword ptr [ecx+54]
 004EBF23    mov         eax,dword ptr [ebp-8]
 004EBF26    sub         eax,dword ptr [esi+18]
 004EBF29    push        eax
 004EBF2A    lea         eax,[ebp-24]
 004EBF2D    push        eax
 004EBF2E    mov         ecx,dword ptr [ebp-0C]
 004EBF31    sub         ecx,dword ptr [esi+14]
 004EBF34    mov         edx,dword ptr [esi+10]
 004EBF37    mov         eax,dword ptr [esi+0C]
 004EBF3A    call        Rect
 004EBF3F    mov         eax,dword ptr [ebp-18]
 004EBF42    cmp         eax,dword ptr [esi+10]
>004EBF45    jg          004EBF65
 004EBF47    test        ebx,ebx
>004EBF49    jle         004EBF65
 004EBF4B    mov         eax,dword ptr [ebp-20]
 004EBF4E    sub         eax,ebx
 004EBF50    mov         dword ptr [ebp-18],eax
 004EBF53    mov         eax,dword ptr [esi+18]
 004EBF56    mov         dword ptr [ebp-20],eax
 004EBF59    mov         eax,dword ptr [ebp-4]
 004EBF5C    mov         byte ptr [eax+378],1
>004EBF63    jmp         004EBF77
 004EBF65    test        ebx,ebx
>004EBF67    jle         004EBF6C
 004EBF69    add         dword ptr [ebp-18],ebx
 004EBF6C    mov         eax,dword ptr [ebp-20]
 004EBF6F    cmp         eax,dword ptr [ebp-18]
>004EBF72    jle         004EBF77
 004EBF74    mov         dword ptr [ebp-18],eax
 004EBF77    mov         edx,dword ptr [esi+0C]
 004EBF7A    mov         eax,dword ptr [ebp-1C]
 004EBF7D    cmp         edx,eax
>004EBF7F    jle         004EBF99
 004EBF81    test        edi,edi
>004EBF83    jle         004EBF99
 004EBF85    sub         eax,edi
 004EBF87    mov         dword ptr [ebp-24],eax
 004EBF8A    mov         dword ptr [ebp-1C],edx
 004EBF8D    mov         eax,dword ptr [ebp-4]
 004EBF90    mov         byte ptr [eax+378],1
>004EBF97    jmp         004EBFAB
 004EBF99    test        edi,edi
>004EBF9B    jle         004EBFA0
 004EBF9D    add         dword ptr [ebp-1C],edi
 004EBFA0    mov         eax,dword ptr [ebp-24]
 004EBFA3    cmp         eax,dword ptr [ebp-1C]
>004EBFA6    jle         004EBFAB
 004EBFA8    mov         dword ptr [ebp-1C],eax
 004EBFAB    push        0
 004EBFAD    lea         eax,[ebp-24]
 004EBFB0    push        eax
 004EBFB1    mov         eax,dword ptr [ebp-4]
 004EBFB4    call        TWinControl.GetHandle
 004EBFB9    push        eax
 004EBFBA    call        user32.InvalidateRect
 004EBFBF    pop         edi
 004EBFC0    pop         esi
 004EBFC1    pop         ebx
 004EBFC2    mov         esp,ebp
 004EBFC4    pop         ebp
 004EBFC5    ret
*}
end;

//004EBFC8
procedure TCustomForm.WMNCCalcSize(var Message:TWMNCCalcSize);
begin
{*
 004EBFC8    push        ebx
 004EBFC9    push        esi
 004EBFCA    mov         esi,edx
 004EBFCC    mov         ebx,eax
 004EBFCE    mov         edx,esi
 004EBFD0    mov         eax,ebx
 004EBFD2    call        TWinControl.WMNCCalcSize
 004EBFD7    test        byte ptr [ebx+1C],10
>004EBFDB    je          004EC017
 004EBFDD    cmp         dword ptr [ebx+34],0
>004EBFE1    je          004EC017
 004EBFE3    cmp         dword ptr [ebx+2B4],0
>004EBFEA    je          004EC017
 004EBFEC    mov         eax,dword ptr [ebx+2B4]
 004EBFF2    cmp         dword ptr [eax+38],0
>004EBFF6    je          004EC017
 004EBFF8    mov         eax,dword ptr [ebx+2B4]
 004EBFFE    mov         eax,dword ptr [eax+38]
 004EC001    call        TMenuItem.GetCount
 004EC006    test        eax,eax
>004EC008    jle         004EC017
 004EC00A    mov         ebx,dword ptr [esi+8]
 004EC00D    push        0F
 004EC00F    call        user32.GetSystemMetrics
 004EC014    add         dword ptr [ebx+4],eax
 004EC017    pop         esi
 004EC018    pop         ebx
 004EC019    ret
*}
end;

//004EC01C
procedure TCustomForm.WMGestureNotify(var Message:TWMGestureNotify);
begin
{*
 004EC01C    call        TWinControl.WMGestureNotify
 004EC021    ret
*}
end;

//004EC024
procedure TCustomForm.CMActivate(var Message:TCMActivate);
begin
{*
 004EC024    push        ebx
 004EC025    push        esi
 004EC026    mov         ebx,eax
 004EC028    test        byte ptr [ebx+1C],2
>004EC02C    jne         004EC03C
 004EC02E    mov         eax,ebx
 004EC030    mov         si,0FFAF
 004EC034    call        @CallDynaInst
 004EC039    pop         esi
 004EC03A    pop         ebx
 004EC03B    ret
 004EC03C    or          byte ptr [ebx+384],20
 004EC043    pop         esi
 004EC044    pop         ebx
 004EC045    ret
*}
end;

//004EC048
procedure TCustomForm.CMDeactivate(var Message:TCMDeactivate);
begin
{*
 004EC048    push        esi
 004EC049    mov         esi,eax
 004EC04B    test        byte ptr [esi+1C],2
>004EC04F    jne         004EC05E
 004EC051    mov         eax,esi
 004EC053    mov         si,0FFAD
 004EC057    call        @CallDynaInst
 004EC05C    pop         esi
 004EC05D    ret
 004EC05E    and         byte ptr [esi+384],0DF
 004EC065    pop         esi
 004EC066    ret
*}
end;

//004EC068
procedure TCustomForm.CMDialogKey(var Message:TCMDialogKey);
begin
{*
 004EC068    push        ebx
 004EC069    push        esi
 004EC06A    mov         esi,edx
 004EC06C    mov         ebx,eax
 004EC06E    push        12
 004EC070    call        user32.GetKeyState
 004EC075    test        ax,ax
>004EC078    jl          004EC0F6
 004EC07A    movzx       eax,word ptr [esi+4]
 004EC07E    sub         ax,9
>004EC082    je          004EC08F
 004EC084    add         eax,0FFFFFFE4
 004EC087    sub         ax,4
>004EC08B    jb          004EC0C1
>004EC08D    jmp         004EC0F6
 004EC08F    push        11
 004EC091    call        user32.GetKeyState
 004EC096    test        ax,ax
>004EC099    jl          004EC0F6
 004EC09B    push        1
 004EC09D    push        10
 004EC09F    call        user32.GetKeyState
 004EC0A4    test        ax,ax
 004EC0A7    setge       cl
 004EC0AA    mov         edx,dword ptr [ebx+290]
 004EC0B0    mov         eax,ebx
 004EC0B2    call        TWinControl.SelectNext
 004EC0B7    mov         dword ptr [esi+0C],1
 004EC0BE    pop         esi
 004EC0BF    pop         ebx
 004EC0C0    ret
 004EC0C1    mov         eax,dword ptr [ebx+290]
 004EC0C7    test        eax,eax
>004EC0C9    je          004EC0FF
 004EC0CB    push        0
 004EC0CD    movzx       edx,word ptr [esi+4]
 004EC0D1    cmp         dx,27
>004EC0D5    je          004EC0E1
 004EC0D7    cmp         dx,28
>004EC0DB    je          004EC0E1
 004EC0DD    xor         ecx,ecx
>004EC0DF    jmp         004EC0E3
 004EC0E1    mov         cl,1
 004EC0E3    mov         edx,dword ptr [eax+34]
 004EC0E6    xchg        eax,edx
 004EC0E7    call        TWinControl.SelectNext
 004EC0EC    mov         dword ptr [esi+0C],1
 004EC0F3    pop         esi
 004EC0F4    pop         ebx
 004EC0F5    ret
 004EC0F6    mov         edx,esi
 004EC0F8    mov         eax,ebx
 004EC0FA    call        TWinControl.CMDialogKey
 004EC0FF    pop         esi
 004EC100    pop         ebx
 004EC101    ret
*}
end;

//004EC104
procedure TCustomForm.CMShowingChanged(var Message:TMessage);
begin
{*
 004EC104    push        ebp
 004EC105    mov         ebp,esp
 004EC107    add         esp,0FFFFFFE8
 004EC10A    push        ebx
 004EC10B    push        esi
 004EC10C    push        edi
 004EC10D    xor         ecx,ecx
 004EC10F    mov         dword ptr [ebp-18],ecx
 004EC112    mov         dword ptr [ebp-4],eax
 004EC115    xor         eax,eax
 004EC117    push        ebp
 004EC118    push        4EC766
 004EC11D    push        dword ptr fs:[eax]
 004EC120    mov         dword ptr fs:[eax],esp
 004EC123    mov         eax,dword ptr [ebp-4]
 004EC126    test        byte ptr [eax+1C],10
>004EC12A    jne         004EC159
 004EC12C    mov         eax,dword ptr [ebp-4]
 004EC12F    test        byte ptr [eax+384],4
>004EC136    je          004EC159
 004EC138    lea         edx,[ebp-18]
 004EC13B    mov         eax,[0078DB38];^SResString204:TResStringRec
 004EC140    call        LoadResString
 004EC145    mov         ecx,dword ptr [ebp-18]
 004EC148    mov         dl,1
 004EC14A    mov         eax,[00439268];EInvalidOperation
 004EC14F    call        Exception.Create
 004EC154    call        @RaiseExcept
 004EC159    mov         eax,[007932EC];Application:TApplication
 004EC15E    call        TApplication.UpdateVisible
 004EC163    mov         eax,dword ptr [ebp-4]
 004EC166    or          byte ptr [eax+384],4
 004EC16D    xor         edx,edx
 004EC16F    push        ebp
 004EC170    push        4EC749
 004EC175    push        dword ptr fs:[edx]
 004EC178    mov         dword ptr fs:[edx],esp
 004EC17B    mov         eax,dword ptr [ebp-4]
 004EC17E    test        byte ptr [eax+1C],10
>004EC182    jne         004EC703
 004EC188    mov         eax,dword ptr [ebp-4]
 004EC18B    cmp         byte ptr [eax+1EA],0
>004EC192    je          004EC5F7
 004EC198    xor         eax,eax
 004EC19A    push        ebp
 004EC19B    push        4EC1BC
 004EC1A0    push        dword ptr fs:[eax]
 004EC1A3    mov         dword ptr fs:[eax],esp
 004EC1A6    mov         eax,dword ptr [ebp-4]
 004EC1A9    mov         si,0FFAA
 004EC1AD    call        @CallDynaInst
 004EC1B2    xor         eax,eax
 004EC1B4    pop         edx
 004EC1B5    pop         ecx
 004EC1B6    pop         ecx
 004EC1B7    mov         dword ptr fs:[eax],edx
>004EC1BA    jmp         004EC1D3
>004EC1BC    jmp         @HandleAnyException
 004EC1C1    mov         edx,dword ptr [ebp-4]
 004EC1C4    mov         eax,[007932EC];Application:TApplication
 004EC1C9    call        TApplication.HandleException
 004EC1CE    call        @DoneExcept
 004EC1D3    mov         eax,dword ptr [ebp-4]
 004EC1D6    cmp         byte ptr [eax+29F],4
>004EC1DD    je          004EC1FF
 004EC1DF    mov         eax,dword ptr [ebp-4]
 004EC1E2    cmp         byte ptr [eax+29F],6
>004EC1E9    jne         004EC2E3
 004EC1EF    mov         eax,dword ptr [ebp-4]
 004EC1F2    cmp         byte ptr [eax+29E],1
>004EC1F9    jne         004EC2E3
 004EC1FF    mov         eax,dword ptr [ebp-4]
 004EC202    cmp         byte ptr [eax+29E],1
>004EC209    jne         004EC245
 004EC20B    mov         eax,[007932EC];Application:TApplication
 004EC210    mov         eax,dword ptr [eax+44]
 004EC213    call        TControl.GetClientWidth
 004EC218    mov         ebx,eax
 004EC21A    mov         eax,dword ptr [ebp-4]
 004EC21D    sub         ebx,dword ptr [eax+48]
 004EC220    sar         ebx,1
>004EC222    jns         004EC227
 004EC224    adc         ebx,0
 004EC227    mov         eax,[007932EC];Application:TApplication
 004EC22C    mov         eax,dword ptr [eax+44]
 004EC22F    call        TControl.GetClientHeight
 004EC234    mov         esi,eax
 004EC236    mov         eax,dword ptr [ebp-4]
 004EC239    sub         esi,dword ptr [eax+4C]
 004EC23C    sar         esi,1
>004EC23E    jns         004EC278
 004EC240    adc         esi,0
>004EC243    jmp         004EC278
 004EC245    lea         edx,[ebp-14]
 004EC248    mov         eax,[007932F0];Screen:TScreen
 004EC24D    call        TScreen.GetWorkAreaRect
 004EC252    mov         ebx,dword ptr [ebp-0C]
 004EC255    sub         ebx,dword ptr [ebp-14]
 004EC258    mov         eax,dword ptr [ebp-4]
 004EC25B    sub         ebx,dword ptr [eax+48]
 004EC25E    sar         ebx,1
>004EC260    jns         004EC265
 004EC262    adc         ebx,0
 004EC265    mov         esi,dword ptr [ebp-8]
 004EC268    sub         esi,dword ptr [ebp-10]
 004EC26B    mov         eax,dword ptr [ebp-4]
 004EC26E    sub         esi,dword ptr [eax+4C]
 004EC271    sar         esi,1
>004EC273    jns         004EC278
 004EC275    adc         esi,0
 004EC278    mov         eax,[007932F0];Screen:TScreen
 004EC27D    call        TScreen.GetDesktopLeft
 004EC282    cmp         ebx,eax
>004EC284    jge         004EC292
 004EC286    mov         eax,[007932F0];Screen:TScreen
 004EC28B    call        TScreen.GetDesktopLeft
 004EC290    mov         ebx,eax
 004EC292    mov         eax,[007932F0];Screen:TScreen
 004EC297    call        TScreen.GetDesktopTop
 004EC29C    cmp         esi,eax
>004EC29E    jge         004EC2AC
 004EC2A0    mov         eax,[007932F0];Screen:TScreen
 004EC2A5    call        TScreen.GetDesktopTop
 004EC2AA    mov         esi,eax
 004EC2AC    mov         eax,dword ptr [ebp-4]
 004EC2AF    mov         eax,dword ptr [eax+48]
 004EC2B2    push        eax
 004EC2B3    mov         eax,dword ptr [ebp-4]
 004EC2B6    mov         eax,dword ptr [eax+4C]
 004EC2B9    push        eax
 004EC2BA    mov         ecx,esi
 004EC2BC    mov         edx,ebx
 004EC2BE    mov         eax,dword ptr [ebp-4]
 004EC2C1    mov         ebx,dword ptr [eax]
 004EC2C3    call        dword ptr [ebx+98]
 004EC2C9    mov         eax,dword ptr [ebp-4]
 004EC2CC    cmp         byte ptr [eax+59],0
>004EC2D0    je          004EC503
 004EC2D6    mov         eax,dword ptr [ebp-4]
 004EC2D9    call        TCustomForm.SetWindowToMonitor
>004EC2DE    jmp         004EC503
 004EC2E3    mov         eax,dword ptr [ebp-4]
 004EC2E6    movzx       eax,byte ptr [eax+29F]
 004EC2ED    mov         edx,eax
 004EC2EF    add         dl,0FA
 004EC2F2    sub         dl,2
>004EC2F5    jae         004EC408
 004EC2FB    mov         eax,[007932EC];Application:TApplication
 004EC300    mov         esi,dword ptr [eax+44]
 004EC303    mov         eax,dword ptr [ebp-4]
 004EC306    cmp         byte ptr [eax+29F],7
>004EC30D    jne         004EC32A
 004EC30F    mov         eax,dword ptr [ebp-4]
 004EC312    mov         eax,dword ptr [eax+4]
 004EC315    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 004EC31B    call        @IsClass
 004EC320    test        al,al
>004EC322    je          004EC32A
 004EC324    mov         eax,dword ptr [ebp-4]
 004EC327    mov         esi,dword ptr [eax+4]
 004EC32A    test        esi,esi
>004EC32C    je          004EC36B
 004EC32E    cmp         esi,dword ptr [ebp-4]
>004EC331    je          004EC36B
 004EC333    mov         eax,esi
 004EC335    call        TCustomForm.GetLeft
 004EC33A    mov         ebx,eax
 004EC33C    mov         eax,dword ptr [esi+48]
 004EC33F    mov         edx,dword ptr [ebp-4]
 004EC342    sub         eax,dword ptr [edx+48]
 004EC345    sar         eax,1
>004EC347    jns         004EC34C
 004EC349    adc         eax,0
 004EC34C    add         ebx,eax
 004EC34E    mov         eax,esi
 004EC350    call        TCustomForm.GetTop
 004EC355    mov         edx,dword ptr [esi+4C]
 004EC358    mov         ecx,dword ptr [ebp-4]
 004EC35B    sub         edx,dword ptr [ecx+4C]
 004EC35E    sar         edx,1
>004EC360    jns         004EC365
 004EC362    adc         edx,0
 004EC365    add         eax,edx
 004EC367    mov         esi,eax
>004EC369    jmp         004EC39D
 004EC36B    mov         eax,[007932F0];Screen:TScreen
 004EC370    call        TScreen.GetWidth
 004EC375    mov         ebx,eax
 004EC377    mov         eax,dword ptr [ebp-4]
 004EC37A    sub         ebx,dword ptr [eax+48]
 004EC37D    sar         ebx,1
>004EC37F    jns         004EC384
 004EC381    adc         ebx,0
 004EC384    mov         eax,[007932F0];Screen:TScreen
 004EC389    call        TScreen.GetHeight
 004EC38E    mov         esi,eax
 004EC390    mov         eax,dword ptr [ebp-4]
 004EC393    sub         esi,dword ptr [eax+4C]
 004EC396    sar         esi,1
>004EC398    jns         004EC39D
 004EC39A    adc         esi,0
 004EC39D    mov         eax,[007932F0];Screen:TScreen
 004EC3A2    call        TScreen.GetDesktopLeft
 004EC3A7    cmp         ebx,eax
>004EC3A9    jge         004EC3B7
 004EC3AB    mov         eax,[007932F0];Screen:TScreen
 004EC3B0    call        TScreen.GetDesktopLeft
 004EC3B5    mov         ebx,eax
 004EC3B7    mov         eax,[007932F0];Screen:TScreen
 004EC3BC    call        TScreen.GetDesktopTop
 004EC3C1    cmp         esi,eax
>004EC3C3    jge         004EC3D1
 004EC3C5    mov         eax,[007932F0];Screen:TScreen
 004EC3CA    call        TScreen.GetDesktopTop
 004EC3CF    mov         esi,eax
 004EC3D1    mov         eax,dword ptr [ebp-4]
 004EC3D4    mov         eax,dword ptr [eax+48]
 004EC3D7    push        eax
 004EC3D8    mov         eax,dword ptr [ebp-4]
 004EC3DB    mov         eax,dword ptr [eax+4C]
 004EC3DE    push        eax
 004EC3DF    mov         ecx,esi
 004EC3E1    mov         edx,ebx
 004EC3E3    mov         eax,dword ptr [ebp-4]
 004EC3E6    mov         ebx,dword ptr [eax]
 004EC3E8    call        dword ptr [ebx+98]
 004EC3EE    mov         eax,dword ptr [ebp-4]
 004EC3F1    cmp         byte ptr [eax+59],0
>004EC3F5    je          004EC503
 004EC3FB    mov         eax,dword ptr [ebp-4]
 004EC3FE    call        TCustomForm.SetWindowToMonitor
>004EC403    jmp         004EC503
 004EC408    cmp         al,5
>004EC40A    jne         004EC503
 004EC410    mov         eax,dword ptr [ebp-4]
 004EC413    cmp         byte ptr [eax+29E],1
>004EC41A    jne         004EC456
 004EC41C    mov         eax,[007932EC];Application:TApplication
 004EC421    mov         eax,dword ptr [eax+44]
 004EC424    call        TControl.GetClientWidth
 004EC429    mov         ebx,eax
 004EC42B    mov         eax,dword ptr [ebp-4]
 004EC42E    sub         ebx,dword ptr [eax+48]
 004EC431    sar         ebx,1
>004EC433    jns         004EC438
 004EC435    adc         ebx,0
 004EC438    mov         eax,[007932EC];Application:TApplication
 004EC43D    mov         eax,dword ptr [eax+44]
 004EC440    call        TControl.GetClientHeight
 004EC445    mov         esi,eax
 004EC447    mov         eax,dword ptr [ebp-4]
 004EC44A    sub         esi,dword ptr [eax+4C]
 004EC44D    sar         esi,1
>004EC44F    jns         004EC4B2
 004EC451    adc         esi,0
>004EC454    jmp         004EC4B2
 004EC456    mov         eax,[007932F0];Screen:TScreen
 004EC45B    call        TScreen.GetDesktopWidth
 004EC460    mov         ebx,eax
 004EC462    sar         ebx,1
>004EC464    jns         004EC469
 004EC466    adc         ebx,0
 004EC469    mov         eax,[007932F0];Screen:TScreen
 004EC46E    call        TScreen.GetDesktopLeft
 004EC473    add         ebx,eax
 004EC475    mov         eax,dword ptr [ebp-4]
 004EC478    mov         eax,dword ptr [eax+48]
 004EC47B    sar         eax,1
>004EC47D    jns         004EC482
 004EC47F    adc         eax,0
 004EC482    sub         ebx,eax
 004EC484    mov         eax,[007932F0];Screen:TScreen
 004EC489    call        TScreen.GetDesktopHeight
 004EC48E    mov         esi,eax
 004EC490    sar         esi,1
>004EC492    jns         004EC497
 004EC494    adc         esi,0
 004EC497    mov         eax,[007932F0];Screen:TScreen
 004EC49C    call        TScreen.GetDesktopTop
 004EC4A1    add         esi,eax
 004EC4A3    mov         eax,dword ptr [ebp-4]
 004EC4A6    mov         eax,dword ptr [eax+4C]
 004EC4A9    sar         eax,1
>004EC4AB    jns         004EC4B0
 004EC4AD    adc         eax,0
 004EC4B0    sub         esi,eax
 004EC4B2    mov         eax,[007932F0];Screen:TScreen
 004EC4B7    call        TScreen.GetDesktopLeft
 004EC4BC    cmp         ebx,eax
>004EC4BE    jge         004EC4CC
 004EC4C0    mov         eax,[007932F0];Screen:TScreen
 004EC4C5    call        TScreen.GetDesktopLeft
 004EC4CA    mov         ebx,eax
 004EC4CC    mov         eax,[007932F0];Screen:TScreen
 004EC4D1    call        TScreen.GetDesktopTop
 004EC4D6    cmp         esi,eax
>004EC4D8    jge         004EC4E6
 004EC4DA    mov         eax,[007932F0];Screen:TScreen
 004EC4DF    call        TScreen.GetDesktopTop
 004EC4E4    mov         esi,eax
 004EC4E6    mov         eax,dword ptr [ebp-4]
 004EC4E9    mov         eax,dword ptr [eax+48]
 004EC4EC    push        eax
 004EC4ED    mov         eax,dword ptr [ebp-4]
 004EC4F0    mov         eax,dword ptr [eax+4C]
 004EC4F3    push        eax
 004EC4F4    mov         ecx,esi
 004EC4F6    mov         edx,ebx
 004EC4F8    mov         eax,dword ptr [ebp-4]
 004EC4FB    mov         ebx,dword ptr [eax]
 004EC4FD    call        dword ptr [ebx+98]
 004EC503    mov         eax,dword ptr [ebp-4]
 004EC506    mov         byte ptr [eax+29F],0
 004EC50D    mov         eax,dword ptr [ebp-4]
 004EC510    cmp         byte ptr [eax+29E],1
>004EC517    jne         004EC5D2
 004EC51D    mov         eax,dword ptr [ebp-4]
 004EC520    cmp         byte ptr [eax+29A],2
>004EC527    jne         004EC55F
 004EC529    push        0
 004EC52B    mov         eax,dword ptr [ebp-4]
 004EC52E    call        TWinControl.GetHandle
 004EC533    push        eax
 004EC534    push        223
 004EC539    mov         eax,[007932EC];Application:TApplication
 004EC53E    mov         eax,dword ptr [eax+44]
 004EC541    mov         eax,dword ptr [eax+37C]
 004EC547    push        eax
 004EC548    call        user32.SendMessageW
 004EC54D    push        3
 004EC54F    mov         eax,dword ptr [ebp-4]
 004EC552    call        TWinControl.GetHandle
 004EC557    push        eax
 004EC558    call        user32.ShowWindow
>004EC55D    jmp         004EC5B0
 004EC55F    mov         eax,dword ptr [ebp-4]
 004EC562    movzx       eax,byte ptr [eax+29A]
 004EC569    mov         eax,dword ptr [eax*4+786778]
 004EC570    push        eax
 004EC571    mov         eax,dword ptr [ebp-4]
 004EC574    call        TWinControl.GetHandle
 004EC579    push        eax
 004EC57A    call        user32.ShowWindow
 004EC57F    mov         eax,dword ptr [ebp-4]
 004EC582    mov         eax,dword ptr [eax+48]
 004EC585    mov         edx,dword ptr [ebp-4]
 004EC588    mov         edx,dword ptr [edx+4C]
 004EC58B    shl         edx,10
 004EC58E    or          eax,edx
 004EC590    push        eax
 004EC591    push        0
 004EC593    push        5
 004EC595    mov         eax,dword ptr [ebp-4]
 004EC598    call        TWinControl.GetHandle
 004EC59D    push        eax
 004EC59E    push        40DD30;user32.DefMDIChildProcW:Integer
 004EC5A3    call        user32.CallWindowProcW
 004EC5A8    mov         eax,dword ptr [ebp-4]
 004EC5AB    call        TControl.BringToFront
 004EC5B0    push        0
 004EC5B2    push        0
 004EC5B4    push        234
 004EC5B9    mov         eax,[007932EC];Application:TApplication
 004EC5BE    mov         eax,dword ptr [eax+44]
 004EC5C1    mov         eax,dword ptr [eax+37C]
 004EC5C7    push        eax
 004EC5C8    call        user32.SendMessageW
>004EC5CD    jmp         004EC731
 004EC5D2    mov         eax,dword ptr [ebp-4]
 004EC5D5    movzx       eax,byte ptr [eax+29A]
 004EC5DC    mov         eax,dword ptr [eax*4+786778]
 004EC5E3    push        eax
 004EC5E4    mov         eax,dword ptr [ebp-4]
 004EC5E7    call        TWinControl.GetHandle
 004EC5EC    push        eax
 004EC5ED    call        user32.ShowWindow
>004EC5F2    jmp         004EC731
 004EC5F7    xor         eax,eax
 004EC5F9    push        ebp
 004EC5FA    push        4EC61B
 004EC5FF    push        dword ptr fs:[eax]
 004EC602    mov         dword ptr fs:[eax],esp
 004EC605    mov         eax,dword ptr [ebp-4]
 004EC608    mov         si,0FFAB
 004EC60C    call        @CallDynaInst
 004EC611    xor         eax,eax
 004EC613    pop         edx
 004EC614    pop         ecx
 004EC615    pop         ecx
 004EC616    mov         dword ptr fs:[eax],edx
>004EC619    jmp         004EC632
>004EC61B    jmp         @HandleAnyException
 004EC620    mov         edx,dword ptr [ebp-4]
 004EC623    mov         eax,[007932EC];Application:TApplication
 004EC628    call        TApplication.HandleException
 004EC62D    call        @DoneExcept
 004EC632    mov         eax,[007932F0];Screen:TScreen
 004EC637    mov         eax,dword ptr [eax+68]
 004EC63A    cmp         eax,dword ptr [ebp-4]
>004EC63D    jne         004EC649
 004EC63F    xor         edx,edx
 004EC641    mov         eax,dword ptr [ebp-4]
 004EC644    call        TCustomForm.MergeMenu
 004EC649    mov         eax,dword ptr [ebp-4]
 004EC64C    cmp         byte ptr [eax+29E],1
>004EC653    jne         004EC665
 004EC655    mov         eax,dword ptr [ebp-4]
 004EC658    mov         edx,dword ptr [eax]
 004EC65A    call        dword ptr [edx+0C0]
>004EC660    jmp         004EC731
 004EC665    mov         eax,dword ptr [ebp-4]
 004EC668    test        byte ptr [eax+384],8
>004EC66F    je          004EC693
 004EC671    push        97
 004EC676    push        0
 004EC678    push        0
 004EC67A    push        0
 004EC67C    push        0
 004EC67E    push        0
 004EC680    mov         eax,dword ptr [ebp-4]
 004EC683    call        TWinControl.GetHandle
 004EC688    push        eax
 004EC689    call        user32.SetWindowPos
>004EC68E    jmp         004EC731
 004EC693    xor         ebx,ebx
 004EC695    mov         eax,dword ptr [ebp-4]
 004EC698    call        TWinControl.GetHandle
 004EC69D    mov         esi,eax
 004EC69F    call        user32.GetActiveWindow
 004EC6A4    cmp         esi,eax
>004EC6A6    jne         004EC6C8
 004EC6A8    mov         eax,dword ptr [ebp-4]
 004EC6AB    call        TWinControl.GetHandle
 004EC6B0    call        IsIconic
 004EC6B5    test        eax,eax
>004EC6B7    jne         004EC6C8
 004EC6B9    mov         eax,dword ptr [ebp-4]
 004EC6BC    call        TWinControl.GetHandle
 004EC6C1    call        FindTopMostWindow
 004EC6C6    mov         ebx,eax
 004EC6C8    test        ebx,ebx
>004EC6CA    je          004EC6F1
 004EC6CC    push        97
 004EC6D1    push        0
 004EC6D3    push        0
 004EC6D5    push        0
 004EC6D7    push        0
 004EC6D9    push        0
 004EC6DB    mov         eax,dword ptr [ebp-4]
 004EC6DE    call        TWinControl.GetHandle
 004EC6E3    push        eax
 004EC6E4    call        user32.SetWindowPos
 004EC6E9    push        ebx
 004EC6EA    call        user32.SetActiveWindow
>004EC6EF    jmp         004EC731
 004EC6F1    push        0
 004EC6F3    mov         eax,dword ptr [ebp-4]
 004EC6F6    call        TWinControl.GetHandle
 004EC6FB    push        eax
 004EC6FC    call        user32.ShowWindow
>004EC701    jmp         004EC731
 004EC703    mov         eax,dword ptr [ebp-4]
 004EC706    test        byte ptr [eax+1C],10
>004EC70A    je          004EC731
 004EC70C    mov         eax,dword ptr [ebp-4]
 004EC70F    cmp         dword ptr [eax+34],0
>004EC713    je          004EC731
 004EC715    mov         eax,dword ptr [ebp-4]
 004EC718    cmp         byte ptr [eax+1EA],0
>004EC71F    je          004EC731
 004EC721    push        1
 004EC723    mov         eax,dword ptr [ebp-4]
 004EC726    call        TWinControl.GetHandle
 004EC72B    push        eax
 004EC72C    call        user32.ShowWindow
 004EC731    xor         eax,eax
 004EC733    pop         edx
 004EC734    pop         ecx
 004EC735    pop         ecx
 004EC736    mov         dword ptr fs:[eax],edx
 004EC739    push        4EC750
 004EC73E    mov         eax,dword ptr [ebp-4]
 004EC741    and         byte ptr [eax+384],0FB
 004EC748    ret
>004EC749    jmp         @HandleFinally
>004EC74E    jmp         004EC73E
 004EC750    xor         eax,eax
 004EC752    pop         edx
 004EC753    pop         ecx
 004EC754    pop         ecx
 004EC755    mov         dword ptr fs:[eax],edx
 004EC758    push        4EC76D
 004EC75D    lea         eax,[ebp-18]
 004EC760    call        @UStrClr
 004EC765    ret
>004EC766    jmp         @HandleFinally
>004EC76B    jmp         004EC75D
 004EC76D    pop         edi
 004EC76E    pop         esi
 004EC76F    pop         ebx
 004EC770    mov         esp,ebp
 004EC772    pop         ebp
 004EC773    ret
*}
end;

//004EC774
procedure TCustomForm.CMIconChanged(var Message:TMessage);
begin
{*
 004EC774    push        ebx
 004EC775    mov         ebx,eax
 004EC777    mov         eax,dword ptr [ebx+2AC]
 004EC77D    call        TIcon.GetHandle
 004EC782    test        eax,eax
>004EC784    jne         004EC78F
 004EC786    xor         edx,edx
 004EC788    mov         eax,ebx
 004EC78A    call        TCustomForm.IconChanged
 004EC78F    pop         ebx
 004EC790    ret
*}
end;

//004EC794
procedure TCustomForm.CMRelease;
begin
{*
 004EC794    call        TObject.Free
 004EC799    ret
*}
end;

//004EC79C
procedure TCustomForm.CMTextChanged(var Message:TMessage);
begin
{*
 004EC79C    push        ebx
 004EC79D    mov         ebx,eax
 004EC79F    mov         eax,ebx
 004EC7A1    call        TWinControl.CMTextChanged
 004EC7A6    cmp         byte ptr [ebx+29E],1
>004EC7AD    jne         004EC7E8
 004EC7AF    mov         eax,[007932EC];Application:TApplication
 004EC7B4    cmp         dword ptr [eax+44],0
>004EC7B8    je          004EC7E8
 004EC7BA    mov         eax,[007932EC];Application:TApplication
 004EC7BF    mov         eax,dword ptr [eax+44]
 004EC7C2    cmp         dword ptr [eax+37C],0
>004EC7C9    je          004EC7E8
 004EC7CB    push        0
 004EC7CD    push        0
 004EC7CF    push        234
 004EC7D4    mov         eax,[007932EC];Application:TApplication
 004EC7D9    mov         eax,dword ptr [eax+44]
 004EC7DC    mov         eax,dword ptr [eax+37C]
 004EC7E2    push        eax
 004EC7E3    call        user32.SendMessageW
 004EC7E8    pop         ebx
 004EC7E9    ret
*}
end;

//004EC7EC
procedure TCustomForm.CMUIActivate(var Message:void );
begin
{*
 004EC7EC    push        esi
 004EC7ED    mov         esi,eax
 004EC7EF    mov         eax,esi
 004EC7F1    mov         ecx,dword ptr [eax]
 004EC7F3    call        dword ptr [ecx-10]
 004EC7F6    pop         esi
 004EC7F7    ret
*}
end;

//004EC7F8
procedure TCustomForm.CMParentFontChanged(var Message:TCMParentFontChanged);
begin
{*
 004EC7F8    push        esi
 004EC7F9    mov         esi,eax
 004EC7FB    cmp         byte ptr [esi+5B],0
>004EC7FF    je          004EC82D
 004EC801    cmp         dword ptr [edx+4],0
>004EC805    je          004EC814
 004EC807    mov         edx,dword ptr [edx+8]
 004EC80A    mov         eax,dword ptr [esi+64]
 004EC80D    mov         ecx,dword ptr [eax]
 004EC80F    call        dword ptr [ecx+8]
>004EC812    jmp         004EC82D
 004EC814    mov         eax,[007932EC];Application:TApplication
 004EC819    mov         edx,dword ptr [eax+3C]
 004EC81C    mov         eax,dword ptr [esi+64]
 004EC81F    mov         ecx,dword ptr [eax]
 004EC821    call        dword ptr [ecx+8]
 004EC824    mov         dl,1
 004EC826    mov         eax,esi
 004EC828    call        TControl.SetParentFont
 004EC82D    pop         esi
 004EC82E    ret
*}
end;

//004EC830
procedure TCustomForm.CMIsShortCut(var Message:TWMKey);
begin
{*
 004EC830    push        ebx
 004EC831    push        esi
 004EC832    push        edi
 004EC833    mov         ebx,edx
 004EC835    mov         edi,eax
 004EC837    mov         edx,ebx
 004EC839    mov         eax,edi
 004EC83B    mov         si,0FFA3
 004EC83F    call        @CallDynaInst
 004EC844    test        al,al
>004EC846    je          004EC851
 004EC848    mov         dword ptr [ebx+0C],1
>004EC84F    jmp         004EC856
 004EC851    xor         eax,eax
 004EC853    mov         dword ptr [ebx+0C],eax
 004EC856    pop         edi
 004EC857    pop         esi
 004EC858    pop         ebx
 004EC859    ret
*}
end;

//004EC85C
procedure TCustomForm.CMUpdateActions(var Message:TMessage);
begin
{*
 004EC85C    mov         edx,dword ptr [eax]
 004EC85E    call        dword ptr [edx+104]
 004EC864    ret
*}
end;

//004EC868
procedure TCustomForm.Close;
begin
{*
 004EC868    push        ebx
 004EC869    push        esi
 004EC86A    push        ecx
 004EC86B    mov         ebx,eax
 004EC86D    test        byte ptr [ebx+384],8
>004EC874    je          004EC885
 004EC876    mov         dword ptr [ebx+2B8],2
>004EC880    jmp         004EC905
 004EC885    mov         eax,ebx
 004EC887    mov         edx,dword ptr [eax]
 004EC889    call        dword ptr [edx+10C]
 004EC88F    test        al,al
>004EC891    je          004EC905
 004EC893    cmp         byte ptr [ebx+29E],1
>004EC89A    jne         004EC8B1
 004EC89C    test        byte ptr [ebx+298],2
>004EC8A3    je          004EC8AB
 004EC8A5    mov         byte ptr [esp],3
>004EC8A9    jmp         004EC8B5
 004EC8AB    mov         byte ptr [esp],0
>004EC8AF    jmp         004EC8B5
 004EC8B1    mov         byte ptr [esp],1
 004EC8B5    mov         edx,esp
 004EC8B7    mov         eax,ebx
 004EC8B9    mov         si,0FFAC
 004EC8BD    call        @CallDynaInst
 004EC8C2    cmp         byte ptr [esp],0
>004EC8C6    je          004EC905
 004EC8C8    mov         eax,[007932EC];Application:TApplication
 004EC8CD    cmp         ebx,dword ptr [eax+44]
>004EC8D0    jne         004EC8DE
 004EC8D2    mov         eax,[007932EC];Application:TApplication
 004EC8D7    call        TApplication.Terminate
>004EC8DC    jmp         004EC905
 004EC8DE    cmp         byte ptr [esp],1
>004EC8E2    jne         004EC8ED
 004EC8E4    mov         eax,ebx
 004EC8E6    call        TCustomForm.Hide
>004EC8EB    jmp         004EC905
 004EC8ED    cmp         byte ptr [esp],3
>004EC8F1    jne         004EC8FE
 004EC8F3    mov         dl,1
 004EC8F5    mov         eax,ebx
 004EC8F7    call        TCustomForm.SetWindowState
>004EC8FC    jmp         004EC905
 004EC8FE    mov         eax,ebx
 004EC900    call        TCustomForm.Release
 004EC905    pop         edx
 004EC906    pop         esi
 004EC907    pop         ebx
 004EC908    ret
*}
end;

//004EC90C
function TCustomForm.CloseQuery:Boolean;
begin
{*
 004EC90C    push        ebx
 004EC90D    push        esi
 004EC90E    push        edi
 004EC90F    push        ecx
 004EC910    mov         ebx,eax
 004EC912    cmp         byte ptr [ebx+29E],2
>004EC919    jne         004EC949
 004EC91B    mov         byte ptr [esp],0
 004EC91F    mov         eax,ebx
 004EC921    call        TCustomForm.get_MDIChildCount
 004EC926    mov         esi,eax
 004EC928    dec         esi
 004EC929    test        esi,esi
>004EC92B    jl          004EC949
 004EC92D    inc         esi
 004EC92E    xor         edi,edi
 004EC930    mov         edx,edi
 004EC932    mov         eax,ebx
 004EC934    call        TCustomForm.get_MDIChildren
 004EC939    mov         edx,dword ptr [eax]
 004EC93B    call        dword ptr [edx+10C]
 004EC941    test        al,al
>004EC943    je          004EC967
 004EC945    inc         edi
 004EC946    dec         esi
>004EC947    jne         004EC930
 004EC949    mov         byte ptr [esp],1
 004EC94D    cmp         word ptr [ebx+2FA],0
>004EC955    je          004EC967
 004EC957    mov         ecx,esp
 004EC959    mov         edx,ebx
 004EC95B    mov         eax,dword ptr [ebx+2FC]
 004EC961    call        dword ptr [ebx+2F8]
 004EC967    movzx       eax,byte ptr [esp]
 004EC96B    pop         edx
 004EC96C    pop         edi
 004EC96D    pop         esi
 004EC96E    pop         ebx
 004EC96F    ret
*}
end;

//004EC970
procedure TCustomForm.CloseModal;
begin
{*
 004EC970    push        ebp
 004EC971    mov         ebp,esp
 004EC973    add         esp,0FFFFFFF8
 004EC976    push        ebx
 004EC977    push        esi
 004EC978    push        edi
 004EC979    mov         dword ptr [ebp-4],eax
 004EC97C    xor         eax,eax
 004EC97E    push        ebp
 004EC97F    push        4EC9DD
 004EC984    push        dword ptr fs:[eax]
 004EC987    mov         dword ptr fs:[eax],esp
 004EC98A    mov         byte ptr [ebp-5],0
 004EC98E    mov         eax,dword ptr [ebp-4]
 004EC991    mov         edx,dword ptr [eax]
 004EC993    call        dword ptr [edx+10C]
 004EC999    test        al,al
>004EC99B    je          004EC9B0
 004EC99D    mov         byte ptr [ebp-5],1
 004EC9A1    lea         edx,[ebp-5]
 004EC9A4    mov         eax,dword ptr [ebp-4]
 004EC9A7    mov         si,0FFAC
 004EC9AB    call        @CallDynaInst
 004EC9B0    movzx       eax,byte ptr [ebp-5]
 004EC9B4    sub         al,1
>004EC9B6    jb          004EC9BE
 004EC9B8    dec         al
>004EC9BA    je          004EC9CB
>004EC9BC    jmp         004EC9D3
 004EC9BE    mov         eax,dword ptr [ebp-4]
 004EC9C1    xor         edx,edx
 004EC9C3    mov         dword ptr [eax+2B8],edx
>004EC9C9    jmp         004EC9D3
 004EC9CB    mov         eax,dword ptr [ebp-4]
 004EC9CE    call        TCustomForm.Release
 004EC9D3    xor         eax,eax
 004EC9D5    pop         edx
 004EC9D6    pop         ecx
 004EC9D7    pop         ecx
 004EC9D8    mov         dword ptr fs:[eax],edx
>004EC9DB    jmp         004EC9FF
>004EC9DD    jmp         @HandleAnyException
 004EC9E2    mov         eax,dword ptr [ebp-4]
 004EC9E5    xor         edx,edx
 004EC9E7    mov         dword ptr [eax+2B8],edx
 004EC9ED    mov         edx,dword ptr [ebp-4]
 004EC9F0    mov         eax,[007932EC];Application:TApplication
 004EC9F5    call        TApplication.HandleException
 004EC9FA    call        @DoneExcept
 004EC9FF    pop         edi
 004ECA00    pop         esi
 004ECA01    pop         ebx
 004ECA02    pop         ecx
 004ECA03    pop         ecx
 004ECA04    pop         ebp
 004ECA05    ret
*}
end;

//004ECA08
function TCustomForm.GetFormImage:TBitmap;
begin
{*
 004ECA08    push        ebp
 004ECA09    mov         ebp,esp
 004ECA0B    add         esp,0FFFFFFEC
 004ECA0E    push        ebx
 004ECA0F    push        esi
 004ECA10    push        edi
 004ECA11    mov         ebx,eax
 004ECA13    mov         dl,1
 004ECA15    mov         eax,[00463B28];TBitmap
 004ECA1A    call        TBitmap.Create
 004ECA1F    mov         dword ptr [ebp-4],eax
 004ECA22    xor         eax,eax
 004ECA24    push        ebp
 004ECA25    push        4ECAFE
 004ECA2A    push        dword ptr fs:[eax]
 004ECA2D    mov         dword ptr fs:[eax],esp
 004ECA30    mov         eax,ebx
 004ECA32    call        TControl.GetClientWidth
 004ECA37    mov         edx,eax
 004ECA39    mov         eax,dword ptr [ebp-4]
 004ECA3C    mov         ecx,dword ptr [eax]
 004ECA3E    call        dword ptr [ecx+44]
 004ECA41    mov         eax,ebx
 004ECA43    call        TControl.GetClientHeight
 004ECA48    mov         edx,eax
 004ECA4A    mov         eax,dword ptr [ebp-4]
 004ECA4D    mov         ecx,dword ptr [eax]
 004ECA4F    call        dword ptr [ecx+38]
 004ECA52    mov         eax,dword ptr [ebp-4]
 004ECA55    call        TBitmap.GetCanvas
 004ECA5A    mov         edx,dword ptr [ebx+1C0]
 004ECA60    call        TCanvas.SetBrush
 004ECA65    lea         edx,[ebp-14]
 004ECA68    mov         eax,ebx
 004ECA6A    mov         ecx,dword ptr [eax]
 004ECA6C    call        dword ptr [ecx+54]
 004ECA6F    lea         eax,[ebp-14]
 004ECA72    push        eax
 004ECA73    mov         eax,dword ptr [ebp-4]
 004ECA76    call        TBitmap.GetCanvas
 004ECA7B    pop         edx
 004ECA7C    mov         ecx,dword ptr [eax]
 004ECA7E    call        dword ptr [ecx+54]
 004ECA81    mov         eax,dword ptr [ebp-4]
 004ECA84    call        TBitmap.GetCanvas
 004ECA89    call        TCustomCanvas.Lock
 004ECA8E    xor         eax,eax
 004ECA90    push        ebp
 004ECA91    push        4ECAED
 004ECA96    push        dword ptr fs:[eax]
 004ECA99    mov         dword ptr fs:[eax],esp
 004ECA9C    push        0F0
 004ECA9E    mov         eax,ebx
 004ECAA0    call        TWinControl.GetHandle
 004ECAA5    push        eax
 004ECAA6    call        user32.GetWindowLongW
 004ECAAB    test        eax,800000
>004ECAB0    je          004ECAB7
 004ECAB2    or          esi,0FFFFFFFF
>004ECAB5    jmp         004ECAB9
 004ECAB7    xor         esi,esi
 004ECAB9    push        esi
 004ECABA    mov         eax,dword ptr [ebp-4]
 004ECABD    call        TBitmap.GetCanvas
 004ECAC2    call        TCanvas.GetHandle
 004ECAC7    mov         edx,eax
 004ECAC9    mov         ecx,esi
 004ECACB    mov         eax,ebx
 004ECACD    call        TWinControl.PaintTo
 004ECAD2    xor         eax,eax
 004ECAD4    pop         edx
 004ECAD5    pop         ecx
 004ECAD6    pop         ecx
 004ECAD7    mov         dword ptr fs:[eax],edx
 004ECADA    push        4ECAF4
 004ECADF    mov         eax,dword ptr [ebp-4]
 004ECAE2    call        TBitmap.GetCanvas
 004ECAE7    call        TCustomCanvas.Unlock
 004ECAEC    ret
>004ECAED    jmp         @HandleFinally
>004ECAF2    jmp         004ECADF
 004ECAF4    xor         eax,eax
 004ECAF6    pop         edx
 004ECAF7    pop         ecx
 004ECAF8    pop         ecx
 004ECAF9    mov         dword ptr fs:[eax],edx
>004ECAFC    jmp         004ECB15
>004ECAFE    jmp         @HandleAnyException
 004ECB03    mov         eax,dword ptr [ebp-4]
 004ECB06    call        TObject.Free
 004ECB0B    call        @RaiseAgain
 004ECB10    call        @DoneExcept
 004ECB15    mov         eax,dword ptr [ebp-4]
 004ECB18    pop         edi
 004ECB19    pop         esi
 004ECB1A    pop         ebx
 004ECB1B    mov         esp,ebp
 004ECB1D    pop         ebp
 004ECB1E    ret
*}
end;

//004ECB20
procedure TCustomForm.Print;
begin
{*
 004ECB20    push        ebp
 004ECB21    mov         ebp,esp
 004ECB23    add         esp,0FFFFFFDC
 004ECB26    push        ebx
 004ECB27    push        esi
 004ECB28    push        edi
 004ECB29    mov         dword ptr [ebp-4],eax
 004ECB2C    call        Printer
 004ECB31    call        TPrinter.BeginDoc
 004ECB36    xor         edx,edx
 004ECB38    push        ebp
 004ECB39    push        4ECD3F
 004ECB3E    push        dword ptr fs:[edx]
 004ECB41    mov         dword ptr fs:[edx],esp
 004ECB44    mov         eax,dword ptr [ebp-4]
 004ECB47    call        TCustomForm.GetFormImage
 004ECB4C    mov         dword ptr [ebp-8],eax
 004ECB4F    mov         eax,dword ptr [ebp-4]
 004ECB52    call        TCustomForm.GetCanvas
 004ECB57    call        TCustomCanvas.Lock
 004ECB5C    xor         edx,edx
 004ECB5E    push        ebp
 004ECB5F    push        4ECD20
 004ECB64    push        dword ptr fs:[edx]
 004ECB67    mov         dword ptr fs:[edx],esp
 004ECB6A    call        Printer
 004ECB6F    mov         ebx,eax
 004ECB71    mov         eax,ebx
 004ECB73    call        TPrinter.GetCanvas
 004ECB78    mov         dword ptr [ebp-24],eax
 004ECB7B    mov         eax,dword ptr [ebp-8]
 004ECB7E    mov         edx,dword ptr [eax]
 004ECB80    call        dword ptr [edx+70]
 004ECB83    mov         esi,eax
 004ECB85    lea         ecx,[ebp-10]
 004ECB88    lea         edx,[ebp-0C]
 004ECB8B    mov         eax,esi
 004ECB8D    call        GetDIBSizes
 004ECB92    mov         eax,dword ptr [ebp-0C]
 004ECB95    call        AllocMem
 004ECB9A    mov         dword ptr [ebp-1C],eax
 004ECB9D    xor         edx,edx
 004ECB9F    push        ebp
 004ECBA0    push        4ECCF6
 004ECBA5    push        dword ptr fs:[edx]
 004ECBA8    mov         dword ptr fs:[edx],esp
 004ECBAB    mov         eax,dword ptr [ebp-10]
 004ECBAE    call        AllocMem
 004ECBB3    mov         dword ptr [ebp-20],eax
 004ECBB6    xor         edx,edx
 004ECBB8    push        ebp
 004ECBB9    push        4ECCD6
 004ECBBE    push        dword ptr fs:[edx]
 004ECBC1    mov         dword ptr fs:[edx],esp
 004ECBC4    mov         eax,dword ptr [ebp-20]
 004ECBC7    push        eax
 004ECBC8    mov         ecx,dword ptr [ebp-1C]
 004ECBCB    xor         edx,edx
 004ECBCD    mov         eax,esi
 004ECBCF    call        GetDIB
 004ECBD4    mov         eax,dword ptr [ebp-1C]
 004ECBD7    mov         esi,dword ptr [eax+4]
 004ECBDA    mov         edi,dword ptr [eax+8]
 004ECBDD    mov         eax,dword ptr [ebp-4]
 004ECBE0    movzx       eax,byte ptr [eax+2A3]
 004ECBE7    dec         al
>004ECBE9    je          004ECBF4
 004ECBEB    dec         al
>004ECBED    je          004ECC3C
>004ECBEF    jmp         004ECC84
 004ECBF4    mov         eax,dword ptr [ebp-4]
 004ECBF7    call        TCustomForm.GetPixelsPerInch
 004ECBFC    push        eax
 004ECBFD    push        58
 004ECBFF    mov         eax,dword ptr [ebp-24]
 004ECC02    call        TCanvas.GetHandle
 004ECC07    push        eax
 004ECC08    call        gdi32.GetDeviceCaps
 004ECC0D    push        eax
 004ECC0E    push        esi
 004ECC0F    call        kernel32.MulDiv
 004ECC14    mov         dword ptr [ebp-14],eax
 004ECC17    mov         eax,dword ptr [ebp-4]
 004ECC1A    call        TCustomForm.GetPixelsPerInch
 004ECC1F    push        eax
 004ECC20    push        5A
 004ECC22    mov         eax,dword ptr [ebp-24]
 004ECC25    call        TCanvas.GetHandle
 004ECC2A    push        eax
 004ECC2B    call        gdi32.GetDeviceCaps
 004ECC30    push        eax
 004ECC31    push        edi
 004ECC32    call        kernel32.MulDiv
 004ECC37    mov         dword ptr [ebp-18],eax
>004ECC3A    jmp         004ECC8A
 004ECC3C    push        edi
 004ECC3D    mov         eax,ebx
 004ECC3F    call        TPrinter.GetPageHeight
 004ECC44    push        eax
 004ECC45    push        esi
 004ECC46    call        kernel32.MulDiv
 004ECC4B    mov         dword ptr [ebp-14],eax
 004ECC4E    mov         eax,ebx
 004ECC50    call        TPrinter.GetPageWidth
 004ECC55    cmp         eax,dword ptr [ebp-14]
>004ECC58    jle         004ECC66
 004ECC5A    mov         eax,ebx
 004ECC5C    call        TPrinter.GetPageHeight
 004ECC61    mov         dword ptr [ebp-18],eax
>004ECC64    jmp         004ECC8A
 004ECC66    mov         eax,ebx
 004ECC68    call        TPrinter.GetPageWidth
 004ECC6D    mov         dword ptr [ebp-14],eax
 004ECC70    push        esi
 004ECC71    mov         eax,ebx
 004ECC73    call        TPrinter.GetPageWidth
 004ECC78    push        eax
 004ECC79    push        edi
 004ECC7A    call        kernel32.MulDiv
 004ECC7F    mov         dword ptr [ebp-18],eax
>004ECC82    jmp         004ECC8A
 004ECC84    mov         dword ptr [ebp-14],esi
 004ECC87    mov         dword ptr [ebp-18],edi
 004ECC8A    push        0CC0020
 004ECC8F    push        0
 004ECC91    mov         eax,dword ptr [ebp-1C]
 004ECC94    push        eax
 004ECC95    mov         eax,dword ptr [ebp-20]
 004ECC98    push        eax
 004ECC99    push        edi
 004ECC9A    push        esi
 004ECC9B    push        0
 004ECC9D    push        0
 004ECC9F    mov         eax,dword ptr [ebp-18]
 004ECCA2    push        eax
 004ECCA3    mov         eax,dword ptr [ebp-14]
 004ECCA6    push        eax
 004ECCA7    push        0
 004ECCA9    push        0
 004ECCAB    mov         eax,ebx
 004ECCAD    call        TPrinter.GetCanvas
 004ECCB2    call        TCanvas.GetHandle
 004ECCB7    push        eax
 004ECCB8    call        gdi32.StretchDIBits
 004ECCBD    xor         eax,eax
 004ECCBF    pop         edx
 004ECCC0    pop         ecx
 004ECCC1    pop         ecx
 004ECCC2    mov         dword ptr fs:[eax],edx
 004ECCC5    push        4ECCDD
 004ECCCA    mov         edx,dword ptr [ebp-10]
 004ECCCD    mov         eax,dword ptr [ebp-20]
 004ECCD0    call        @FreeMem
 004ECCD5    ret
>004ECCD6    jmp         @HandleFinally
>004ECCDB    jmp         004ECCCA
 004ECCDD    xor         eax,eax
 004ECCDF    pop         edx
 004ECCE0    pop         ecx
 004ECCE1    pop         ecx
 004ECCE2    mov         dword ptr fs:[eax],edx
 004ECCE5    push        4ECCFD
 004ECCEA    mov         edx,dword ptr [ebp-0C]
 004ECCED    mov         eax,dword ptr [ebp-1C]
 004ECCF0    call        @FreeMem
 004ECCF5    ret
>004ECCF6    jmp         @HandleFinally
>004ECCFB    jmp         004ECCEA
 004ECCFD    xor         eax,eax
 004ECCFF    pop         edx
 004ECD00    pop         ecx
 004ECD01    pop         ecx
 004ECD02    mov         dword ptr fs:[eax],edx
 004ECD05    push        4ECD27
 004ECD0A    mov         eax,dword ptr [ebp-4]
 004ECD0D    call        TCustomForm.GetCanvas
 004ECD12    call        TCustomCanvas.Unlock
 004ECD17    mov         eax,dword ptr [ebp-8]
 004ECD1A    call        TObject.Free
 004ECD1F    ret
>004ECD20    jmp         @HandleFinally
>004ECD25    jmp         004ECD0A
 004ECD27    xor         eax,eax
 004ECD29    pop         edx
 004ECD2A    pop         ecx
 004ECD2B    pop         ecx
 004ECD2C    mov         dword ptr fs:[eax],edx
 004ECD2F    push        4ECD46
 004ECD34    call        Printer
 004ECD39    call        TPrinter.EndDoc
 004ECD3E    ret
>004ECD3F    jmp         @HandleFinally
>004ECD44    jmp         004ECD34
 004ECD46    pop         edi
 004ECD47    pop         esi
 004ECD48    pop         ebx
 004ECD49    mov         esp,ebp
 004ECD4B    pop         ebp
 004ECD4C    ret
*}
end;

//004ECD50
procedure TCustomForm.Hide;
begin
{*
 004ECD50    xor         edx,edx
 004ECD52    call        TCustomForm.SetVisible
 004ECD57    ret
*}
end;

//004ECD58
procedure TCustomForm.Show;
begin
{*
 004ECD58    push        ebx
 004ECD59    mov         ebx,eax
 004ECD5B    mov         dl,1
 004ECD5D    mov         eax,ebx
 004ECD5F    call        TCustomForm.SetVisible
 004ECD64    mov         eax,ebx
 004ECD66    call        TControl.BringToFront
 004ECD6B    pop         ebx
 004ECD6C    ret
*}
end;

//004ECD70
procedure TCustomForm.SetFocus;
begin
{*
 004ECD70    push        ebp
 004ECD71    mov         ebp,esp
 004ECD73    push        0
 004ECD75    push        ebx
 004ECD76    mov         ebx,eax
 004ECD78    xor         eax,eax
 004ECD7A    push        ebp
 004ECD7B    push        4ECDEF
 004ECD80    push        dword ptr fs:[eax]
 004ECD83    mov         dword ptr fs:[eax],esp
 004ECD86    cmp         byte ptr [ebx+29D],0
>004ECD8D    jne         004ECDD9
 004ECD8F    cmp         byte ptr [ebx+59],0
>004ECD93    je          004ECDA0
 004ECD95    mov         eax,ebx
 004ECD97    mov         edx,dword ptr [eax]
 004ECD99    call        dword ptr [edx+5C]
 004ECD9C    test        al,al
>004ECD9E    jne         004ECDD2
 004ECDA0    test        byte ptr [ebx+1C],10
>004ECDA4    je          004ECDB1
 004ECDA6    mov         eax,ebx
 004ECDA8    call        TWinControl.HandleAllocated
 004ECDAD    test        al,al
>004ECDAF    jne         004ECDD2
 004ECDB1    lea         edx,[ebp-4]
 004ECDB4    mov         eax,[0078D8DC];^SResString200:TResStringRec
 004ECDB9    call        LoadResString
 004ECDBE    mov         ecx,dword ptr [ebp-4]
 004ECDC1    mov         dl,1
 004ECDC3    mov         eax,[00439268];EInvalidOperation
 004ECDC8    call        Exception.Create
 004ECDCD    call        @RaiseExcept
 004ECDD2    mov         eax,ebx
 004ECDD4    call        TCustomForm.SetWindowFocus
 004ECDD9    xor         eax,eax
 004ECDDB    pop         edx
 004ECDDC    pop         ecx
 004ECDDD    pop         ecx
 004ECDDE    mov         dword ptr fs:[eax],edx
 004ECDE1    push        4ECDF6
 004ECDE6    lea         eax,[ebp-4]
 004ECDE9    call        @UStrClr
 004ECDEE    ret
>004ECDEF    jmp         @HandleFinally
>004ECDF4    jmp         004ECDE6
 004ECDF6    pop         ebx
 004ECDF7    pop         ecx
 004ECDF8    pop         ebp
 004ECDF9    ret
*}
end;

//004ECDFC
procedure TCustomForm.RecreateAsPopup(AWindowHandle:HWND);
begin
{*
 004ECDFC    push        ebx
 004ECDFD    mov         ebx,eax
 004ECDFF    mov         dword ptr [ebx+35C],edx
 004ECE05    xor         eax,eax
 004ECE07    mov         dword ptr [ebx+358],eax
 004ECE0D    mov         eax,ebx
 004ECE0F    call        TWinControl.HandleAllocated
 004ECE14    test        al,al
>004ECE16    je          004ECE21
 004ECE18    mov         eax,ebx
 004ECE1A    call        TWinControl.RecreateWnd
 004ECE1F    pop         ebx
 004ECE20    ret
 004ECE21    mov         eax,ebx
 004ECE23    call        TWinControl.UpdateControlState
 004ECE28    pop         ebx
 004ECE29    ret
*}
end;

//004ECE2C
procedure TCustomForm.Release;
begin
{*
 004ECE2C    push        ebx
 004ECE2D    mov         ebx,eax
 004ECE2F    push        0
 004ECE31    push        0
 004ECE33    push        0B021
 004ECE38    mov         eax,ebx
 004ECE3A    call        TWinControl.GetHandle
 004ECE3F    push        eax
 004ECE40    call        user32.PostMessageW
 004ECE45    pop         ebx
 004ECE46    ret
*}
end;

//004ECE48
function TCustomForm.ShowModal:Integer;
begin
{*
 004ECE48    push        ebp
 004ECE49    mov         ebp,esp
 004ECE4B    add         esp,0FFFFFFE0
 004ECE4E    push        ebx
 004ECE4F    xor         edx,edx
 004ECE51    mov         dword ptr [ebp-20],edx
 004ECE54    mov         dword ptr [ebp-4],eax
 004ECE57    xor         eax,eax
 004ECE59    push        ebp
 004ECE5A    push        4ED172
 004ECE5F    push        dword ptr fs:[eax]
 004ECE62    mov         dword ptr fs:[eax],esp
 004ECE65    call        CancelDrag
 004ECE6A    mov         eax,dword ptr [ebp-4]
 004ECE6D    cmp         byte ptr [eax+59],0
>004ECE71    jne         004ECE97
 004ECE73    mov         eax,dword ptr [ebp-4]
 004ECE76    mov         edx,dword ptr [eax]
 004ECE78    call        dword ptr [edx+5C]
 004ECE7B    test        al,al
>004ECE7D    je          004ECE97
 004ECE7F    mov         eax,dword ptr [ebp-4]
 004ECE82    test        byte ptr [eax+384],8
>004ECE89    jne         004ECE97
 004ECE8B    mov         eax,dword ptr [ebp-4]
 004ECE8E    cmp         byte ptr [eax+29E],1
>004ECE95    jne         004ECEB8
 004ECE97    lea         edx,[ebp-20]
 004ECE9A    mov         eax,[0078D2B8];^SResString205:TResStringRec
 004ECE9F    call        LoadResString
 004ECEA4    mov         ecx,dword ptr [ebp-20]
 004ECEA7    mov         dl,1
 004ECEA9    mov         eax,[00439268];EInvalidOperation
 004ECEAE    call        Exception.Create
 004ECEB3    call        @RaiseExcept
 004ECEB8    call        user32.GetCapture
 004ECEBD    test        eax,eax
>004ECEBF    je          004ECED2
 004ECEC1    push        0
 004ECEC3    push        0
 004ECEC5    push        1F
 004ECEC7    call        user32.GetCapture
 004ECECC    push        eax
 004ECECD    call        user32.SendMessageW
 004ECED2    call        user32.ReleaseCapture
 004ECED7    mov         eax,[007932EC];Application:TApplication
 004ECEDC    call        TApplication.ModalStarted
 004ECEE1    xor         ecx,ecx
 004ECEE3    push        ebp
 004ECEE4    push        4ED155
 004ECEE9    push        dword ptr fs:[ecx]
 004ECEEC    mov         dword ptr fs:[ecx],esp
 004ECEEF    call        user32.GetActiveWindow
 004ECEF4    mov         dword ptr [ebp-1C],eax
 004ECEF7    mov         eax,dword ptr [ebp-4]
 004ECEFA    or          byte ptr [eax+384],8
 004ECF01    mov         eax,dword ptr [ebp-4]
 004ECF04    cmp         byte ptr [eax+348],0
>004ECF0B    jne         004ECF46
 004ECF0D    mov         eax,[007932EC];Application:TApplication
 004ECF12    cmp         byte ptr [eax+0D0],0
>004ECF19    je          004ECF46
 004ECF1B    mov         eax,dword ptr [ebp-4]
 004ECF1E    call        TWinControl.RecreateWnd
 004ECF23    mov         eax,dword ptr [ebp-4]
 004ECF26    call        TWinControl.HandleNeeded
 004ECF2B    cmp         dword ptr [ebp-1C],0
>004ECF2F    je          004ECF3E
 004ECF31    mov         eax,dword ptr [ebp-1C]
 004ECF34    push        eax
 004ECF35    call        user32.IsWindow
 004ECF3A    test        eax,eax
>004ECF3C    jne         004ECF46
 004ECF3E    call        user32.GetActiveWindow
 004ECF43    mov         dword ptr [ebp-1C],eax
 004ECF46    call        SaveFocusState
 004ECF4B    mov         dword ptr [ebp-10],eax
 004ECF4E    mov         eax,[007932F0];Screen:TScreen
 004ECF53    mov         ecx,dword ptr [eax+74]
 004ECF56    mov         eax,[007932F0];Screen:TScreen
 004ECF5B    mov         eax,dword ptr [eax+78]
 004ECF5E    xor         edx,edx
 004ECF60    call        TList.Insert
 004ECF65    mov         eax,[007932F0];Screen:TScreen
 004ECF6A    mov         edx,dword ptr [ebp-4]
 004ECF6D    mov         dword ptr [eax+74],edx
 004ECF70    mov         eax,[007932F0];Screen:TScreen
 004ECF75    movzx       eax,word ptr [eax+48]
 004ECF79    mov         word ptr [ebp-12],ax
 004ECF7D    xor         edx,edx
 004ECF7F    mov         eax,[007932F0];Screen:TScreen
 004ECF84    call        TScreen.SetCursor
 004ECF89    mov         eax,[007932F0];Screen:TScreen
 004ECF8E    mov         eax,dword ptr [eax+4C]
 004ECF91    mov         dword ptr [ebp-18],eax
 004ECF94    xor         eax,eax
 004ECF96    call        DisableTaskWindows
 004ECF9B    mov         dword ptr [ebp-0C],eax
 004ECF9E    xor         ecx,ecx
 004ECFA0    push        ebp
 004ECFA1    push        4ED133
 004ECFA6    push        dword ptr fs:[ecx]
 004ECFA9    mov         dword ptr fs:[ecx],esp
 004ECFAC    mov         eax,dword ptr [ebp-4]
 004ECFAF    call        TCustomForm.Show
 004ECFB4    xor         edx,edx
 004ECFB6    push        ebp
 004ECFB7    push        4ED074
 004ECFBC    push        dword ptr fs:[edx]
 004ECFBF    mov         dword ptr fs:[edx],esp
 004ECFC2    push        0
 004ECFC4    push        0
 004ECFC6    push        0B000
 004ECFCB    mov         eax,dword ptr [ebp-4]
 004ECFCE    call        TWinControl.GetHandle
 004ECFD3    push        eax
 004ECFD4    call        user32.SendMessageW
 004ECFD9    mov         eax,dword ptr [ebp-4]
 004ECFDC    xor         edx,edx
 004ECFDE    mov         dword ptr [eax+2B8],edx
 004ECFE4    mov         eax,[007932EC];Application:TApplication
 004ECFE9    call        TApplication.HandleMessage
 004ECFEE    mov         eax,[007932EC];Application:TApplication
 004ECFF3    cmp         byte ptr [eax+0A4],0
>004ECFFA    je          004ED00B
 004ECFFC    mov         eax,dword ptr [ebp-4]
 004ECFFF    mov         dword ptr [eax+2B8],2
>004ED009    jmp         004ED01F
 004ED00B    mov         eax,dword ptr [ebp-4]
 004ED00E    cmp         dword ptr [eax+2B8],0
>004ED015    je          004ED01F
 004ED017    mov         eax,dword ptr [ebp-4]
 004ED01A    call        TCustomForm.CloseModal
 004ED01F    mov         eax,dword ptr [ebp-4]
 004ED022    mov         eax,dword ptr [eax+2B8]
 004ED028    test        eax,eax
>004ED02A    je          004ECFE4
 004ED02C    mov         dword ptr [ebp-8],eax
 004ED02F    push        0
 004ED031    push        0
 004ED033    push        0B001
 004ED038    mov         eax,dword ptr [ebp-4]
 004ED03B    call        TWinControl.GetHandle
 004ED040    push        eax
 004ED041    call        user32.SendMessageW
 004ED046    mov         eax,dword ptr [ebp-4]
 004ED049    call        TWinControl.GetHandle
 004ED04E    mov         ebx,eax
 004ED050    call        user32.GetActiveWindow
 004ED055    cmp         ebx,eax
>004ED057    je          004ED05E
 004ED059    xor         eax,eax
 004ED05B    mov         dword ptr [ebp-1C],eax
 004ED05E    xor         eax,eax
 004ED060    pop         edx
 004ED061    pop         ecx
 004ED062    pop         ecx
 004ED063    mov         dword ptr fs:[eax],edx
 004ED066    push        4ED07B
 004ED06B    mov         eax,dword ptr [ebp-4]
 004ED06E    call        TCustomForm.Hide
 004ED073    ret
>004ED074    jmp         @HandleFinally
>004ED079    jmp         004ED06B
 004ED07B    xor         eax,eax
 004ED07D    pop         edx
 004ED07E    pop         ecx
 004ED07F    pop         ecx
 004ED080    mov         dword ptr fs:[eax],edx
 004ED083    push        4ED13D
 004ED088    mov         eax,[007932F0];Screen:TScreen
 004ED08D    mov         eax,dword ptr [eax+4C]
 004ED090    cmp         eax,dword ptr [ebp-18]
>004ED093    jne         004ED0A5
 004ED095    movzx       edx,word ptr [ebp-12]
 004ED099    mov         eax,[007932F0];Screen:TScreen
 004ED09E    call        TScreen.SetCursor
>004ED0A3    jmp         004ED0B1
 004ED0A5    xor         edx,edx
 004ED0A7    mov         eax,[007932F0];Screen:TScreen
 004ED0AC    call        TScreen.SetCursor
 004ED0B1    mov         eax,dword ptr [ebp-0C]
 004ED0B4    call        EnableTaskWindows
 004ED0B9    mov         eax,[007932F0];Screen:TScreen
 004ED0BE    mov         eax,dword ptr [eax+78]
 004ED0C1    cmp         dword ptr [eax+8],0
>004ED0C5    jle         004ED0EA
 004ED0C7    xor         edx,edx
 004ED0C9    call        TList.Get
 004ED0CE    mov         ecx,dword ptr ds:[7932F0];Screen:TScreen
 004ED0D4    mov         edx,eax
 004ED0D6    mov         dword ptr [ecx+74],edx
 004ED0D9    mov         eax,[007932F0];Screen:TScreen
 004ED0DE    mov         eax,dword ptr [eax+78]
 004ED0E1    xor         ecx,ecx
 004ED0E3    call        TList.RemoveItem
>004ED0E8    jmp         004ED0F4
 004ED0EA    mov         eax,[007932F0];Screen:TScreen
 004ED0EF    xor         edx,edx
 004ED0F1    mov         dword ptr [eax+74],edx
 004ED0F4    cmp         dword ptr [ebp-1C],0
>004ED0F8    je          004ED111
 004ED0FA    mov         eax,dword ptr [ebp-1C]
 004ED0FD    push        eax
 004ED0FE    call        user32.IsWindow
 004ED103    test        eax,eax
>004ED105    jne         004ED111
 004ED107    xor         eax,eax
 004ED109    call        FindTopMostWindow
 004ED10E    mov         dword ptr [ebp-1C],eax
 004ED111    cmp         dword ptr [ebp-1C],0
>004ED115    je          004ED120
 004ED117    mov         eax,dword ptr [ebp-1C]
 004ED11A    push        eax
 004ED11B    call        user32.SetActiveWindow
 004ED120    mov         eax,dword ptr [ebp-10]
 004ED123    call        RestoreFocusState
 004ED128    mov         eax,dword ptr [ebp-4]
 004ED12B    and         byte ptr [eax+384],0F7
 004ED132    ret
>004ED133    jmp         @HandleFinally
>004ED138    jmp         004ED088
 004ED13D    xor         eax,eax
 004ED13F    pop         edx
 004ED140    pop         ecx
 004ED141    pop         ecx
 004ED142    mov         dword ptr fs:[eax],edx
 004ED145    push        4ED15C
 004ED14A    mov         eax,[007932EC];Application:TApplication
 004ED14F    call        TApplication.ModalFinished
 004ED154    ret
>004ED155    jmp         @HandleFinally
>004ED15A    jmp         004ED14A
 004ED15C    xor         eax,eax
 004ED15E    pop         edx
 004ED15F    pop         ecx
 004ED160    pop         ecx
 004ED161    mov         dword ptr fs:[eax],edx
 004ED164    push        4ED179
 004ED169    lea         eax,[ebp-20]
 004ED16C    call        @UStrClr
 004ED171    ret
>004ED172    jmp         @HandleFinally
>004ED177    jmp         004ED169
 004ED179    mov         eax,dword ptr [ebp-8]
 004ED17C    pop         ebx
 004ED17D    mov         esp,ebp
 004ED17F    pop         ebp
 004ED180    ret
*}
end;

//004ED184
procedure TraverseClients(Container:TWinControl);
begin
{*
 004ED184    push        ebp
 004ED185    mov         ebp,esp
 004ED187    push        ecx
 004ED188    push        ebx
 004ED189    push        esi
 004ED18A    push        edi
 004ED18B    mov         edi,eax
 004ED18D    cmp         byte ptr [edi+1EA],0
>004ED194    je          004ED202
 004ED196    test        byte ptr [edi+1C],10
>004ED19A    jne         004ED202
 004ED19C    mov         eax,edi
 004ED19E    call        TWinControl.GetControlCount
 004ED1A3    mov         esi,eax
 004ED1A5    dec         esi
 004ED1A6    test        esi,esi
>004ED1A8    jl          004ED202
 004ED1AA    inc         esi
 004ED1AB    mov         dword ptr [ebp-4],0
 004ED1B2    mov         edx,dword ptr [ebp-4]
 004ED1B5    mov         eax,edi
 004ED1B7    call        TWinControl.GetControl
 004ED1BC    mov         ebx,eax
 004ED1BE    test        byte ptr [ebx+51],80
>004ED1C2    je          004ED1D4
 004ED1C4    cmp         byte ptr [ebx+59],0
>004ED1C8    je          004ED1D4
 004ED1CA    mov         eax,ebx
 004ED1CC    mov         edx,dword ptr [eax]
 004ED1CE    call        dword ptr [edx+8C]
 004ED1D4    mov         eax,ebx
 004ED1D6    mov         edx,dword ptr ds:[47C4E8];TWinControl
 004ED1DC    call        @IsClass
 004ED1E1    test        al,al
>004ED1E3    je          004ED1FC
 004ED1E5    mov         eax,ebx
 004ED1E7    call        TWinControl.GetControlCount
 004ED1EC    test        eax,eax
>004ED1EE    jle         004ED1FC
 004ED1F0    mov         eax,dword ptr [ebp+8]
 004ED1F3    push        eax
 004ED1F4    mov         eax,ebx
 004ED1F6    call        TraverseClients
 004ED1FB    pop         ecx
 004ED1FC    inc         dword ptr [ebp-4]
 004ED1FF    dec         esi
>004ED200    jne         004ED1B2
 004ED202    pop         edi
 004ED203    pop         esi
 004ED204    pop         ebx
 004ED205    pop         ecx
 004ED206    pop         ebp
 004ED207    ret
*}
end;

//004ED208
procedure TCustomForm.UpdateActions;
begin
{*
 004ED208    push        ebp
 004ED209    mov         ebp,esp
 004ED20B    push        ebx
 004ED20C    push        esi
 004ED20D    push        edi
 004ED20E    mov         ebx,eax
 004ED210    test        byte ptr [ebx+1C],10
>004ED214    jne         004ED26D
 004ED216    cmp         byte ptr [ebx+1EA],0
>004ED21D    je          004ED26D
 004ED21F    mov         eax,ebx
 004ED221    mov         edx,dword ptr [eax]
 004ED223    call        dword ptr [edx+8C]
 004ED229    mov         esi,dword ptr [ebx+2B4]
 004ED22F    test        esi,esi
>004ED231    je          004ED264
 004ED233    mov         eax,dword ptr [esi+38]
 004ED236    call        TMenuItem.GetCount
 004ED23B    dec         eax
 004ED23C    test        eax,eax
>004ED23E    jl          004ED264
 004ED240    inc         eax
 004ED241    mov         esi,eax
 004ED243    xor         edi,edi
 004ED245    mov         eax,dword ptr [ebx+2B4]
 004ED24B    mov         eax,dword ptr [eax+38]
 004ED24E    mov         edx,edi
 004ED250    call        TMenuItem.GetItem
 004ED255    cmp         byte ptr [eax+3E],0
>004ED259    je          004ED260
 004ED25B    mov         edx,dword ptr [eax]
 004ED25D    call        dword ptr [edx+44]
 004ED260    inc         edi
 004ED261    dec         esi
>004ED262    jne         004ED245
 004ED264    push        ebp
 004ED265    mov         eax,ebx
 004ED267    call        TraverseClients
 004ED26C    pop         ecx
 004ED26D    pop         edi
 004ED26E    pop         esi
 004ED26F    pop         ebx
 004ED270    pop         ebp
 004ED271    ret
*}
end;

//004ED274
procedure TCustomForm.UpdateWindowState;
begin
{*
 004ED274    push        ebx
 004ED275    add         esp,0FFFFFFD4
 004ED278    mov         ebx,eax
 004ED27A    mov         eax,ebx
 004ED27C    call        TWinControl.HandleAllocated
 004ED281    test        al,al
>004ED283    je          004ED2C1
 004ED285    mov         dword ptr [esp],2C
 004ED28C    push        esp
 004ED28D    mov         eax,ebx
 004ED28F    call        TWinControl.GetHandle
 004ED294    push        eax
 004ED295    call        user32.GetWindowPlacement
 004ED29A    mov         eax,dword ptr [esp+8]
 004ED29E    sub         eax,2
>004ED2A1    je          004ED2A8
 004ED2A3    dec         eax
>004ED2A4    je          004ED2B1
>004ED2A6    jmp         004ED2BA
 004ED2A8    mov         byte ptr [ebx+29A],1
>004ED2AF    jmp         004ED2C1
 004ED2B1    mov         byte ptr [ebx+29A],2
>004ED2B8    jmp         004ED2C1
 004ED2BA    mov         byte ptr [ebx+29A],0
 004ED2C1    add         esp,2C
 004ED2C4    pop         ebx
 004ED2C5    ret
*}
end;

//004ED2C8
procedure TCustomForm.RequestAlign;
begin
{*
 004ED2C8    cmp         dword ptr [eax+34],0
>004ED2CC    jne         004ED2DB
 004ED2CE    mov         edx,eax
 004ED2D0    mov         eax,[007932F0];Screen:TScreen
 004ED2D5    call        TScreen.AlignForm
 004ED2DA    ret
 004ED2DB    test        byte ptr [eax+1C],10
>004ED2DF    jne         004ED2E6
 004ED2E1    call        TWinControl.RequestAlign
 004ED2E6    ret
*}
end;

//004ED2E8
procedure TCustomForm.WMSettingChange(var Message:TMessage);
begin
{*
 004ED2E8    push        ebx
 004ED2E9    push        esi
 004ED2EA    mov         esi,edx
 004ED2EC    mov         ebx,eax
 004ED2EE    mov         edx,esi
 004ED2F0    mov         eax,ebx
 004ED2F2    call        TWinControl.WMWinIniChange
 004ED2F7    cmp         dword ptr [esi+4],2F
>004ED2FB    jne         004ED304
 004ED2FD    mov         eax,ebx
 004ED2FF    mov         edx,dword ptr [eax]
 004ED301    call        dword ptr [edx+68]
 004ED304    pop         esi
 004ED305    pop         ebx
 004ED306    ret
*}
end;

//004ED308
function ProcessExecute(Control:TControl):Boolean;
begin
{*
 004ED308    push        ebp
 004ED309    mov         ebp,esp
 004ED30B    push        ebx
 004ED30C    push        esi
 004ED30D    mov         ebx,eax
 004ED30F    test        ebx,ebx
>004ED311    je          004ED32B
 004ED313    mov         eax,dword ptr [ebp+8]
 004ED316    mov         edx,dword ptr [eax-4]
 004ED319    mov         edx,dword ptr [edx+8]
 004ED31C    mov         eax,ebx
 004ED31E    mov         si,0FFF3
 004ED322    call        @CallDynaInst
 004ED327    test        al,al
>004ED329    jne         004ED32F
 004ED32B    xor         eax,eax
>004ED32D    jmp         004ED331
 004ED32F    mov         al,1
 004ED331    pop         esi
 004ED332    pop         ebx
 004ED333    pop         ebp
 004ED334    ret
*}
end;

//004ED338
function TraverseClients2(Container:TWinControl):Boolean;
begin
{*
 004ED338    push        ebp
 004ED339    mov         ebp,esp
 004ED33B    push        ecx
 004ED33C    push        ebx
 004ED33D    push        esi
 004ED33E    push        edi
 004ED33F    mov         dword ptr [ebp-4],eax
 004ED342    mov         eax,dword ptr [ebp-4]
 004ED345    cmp         byte ptr [eax+1EA],0
>004ED34C    je          004ED3B6
 004ED34E    mov         eax,dword ptr [ebp-4]
 004ED351    call        TWinControl.GetControlCount
 004ED356    mov         esi,eax
 004ED358    dec         esi
 004ED359    test        esi,esi
>004ED35B    jl          004ED3B6
 004ED35D    inc         esi
 004ED35E    xor         edi,edi
 004ED360    mov         edx,edi
 004ED362    mov         eax,dword ptr [ebp-4]
 004ED365    call        TWinControl.GetControl
 004ED36A    mov         ebx,eax
 004ED36C    cmp         byte ptr [ebx+59],0
>004ED370    je          004ED382
 004ED372    mov         eax,dword ptr [ebp+8]
 004ED375    push        eax
 004ED376    mov         eax,ebx
 004ED378    call        ProcessExecute
 004ED37D    pop         ecx
 004ED37E    test        al,al
>004ED380    jne         004ED3AE
 004ED382    mov         eax,ebx
 004ED384    mov         edx,dword ptr ds:[47C4E8];TWinControl
 004ED38A    call        @IsClass
 004ED38F    test        al,al
>004ED391    je          004ED3B2
 004ED393    mov         eax,ebx
 004ED395    call        TWinControl.GetControlCount
 004ED39A    test        eax,eax
>004ED39C    jle         004ED3B2
 004ED39E    mov         eax,dword ptr [ebp+8]
 004ED3A1    push        eax
 004ED3A2    mov         eax,ebx
 004ED3A4    call        TraverseClients2
 004ED3A9    pop         ecx
 004ED3AA    test        al,al
>004ED3AC    je          004ED3B2
 004ED3AE    mov         al,1
>004ED3B0    jmp         004ED3B8
 004ED3B2    inc         edi
 004ED3B3    dec         esi
>004ED3B4    jne         004ED360
 004ED3B6    xor         eax,eax
 004ED3B8    pop         edi
 004ED3B9    pop         esi
 004ED3BA    pop         ebx
 004ED3BB    pop         ecx
 004ED3BC    pop         ebp
 004ED3BD    ret
*}
end;

//004ED3C0
procedure TCustomForm.CMActionExecute(var Message:TMessage);
begin
{*
 004ED3C0    push        ebp
 004ED3C1    mov         ebp,esp
 004ED3C3    push        ecx
 004ED3C4    push        ebx
 004ED3C5    mov         dword ptr [ebp-4],edx
 004ED3C8    mov         ebx,eax
 004ED3CA    test        byte ptr [ebx+1C],10
>004ED3CE    jne         004ED40E
 004ED3D0    cmp         byte ptr [ebx+1EA],0
>004ED3D7    je          004ED40E
 004ED3D9    push        ebp
 004ED3DA    mov         eax,dword ptr [ebx+290]
 004ED3E0    call        ProcessExecute
 004ED3E5    pop         ecx
 004ED3E6    test        al,al
>004ED3E8    jne         004ED404
 004ED3EA    push        ebp
 004ED3EB    mov         eax,ebx
 004ED3ED    call        ProcessExecute
 004ED3F2    pop         ecx
 004ED3F3    test        al,al
>004ED3F5    jne         004ED404
 004ED3F7    push        ebp
 004ED3F8    mov         eax,ebx
 004ED3FA    call        TraverseClients2
 004ED3FF    pop         ecx
 004ED400    test        al,al
>004ED402    je          004ED40E
 004ED404    mov         eax,dword ptr [ebp-4]
 004ED407    mov         dword ptr [eax+0C],1
 004ED40E    pop         ebx
 004ED40F    pop         ecx
 004ED410    pop         ebp
 004ED411    ret
*}
end;

//004ED414
function ProcessUpdate(Control:TControl):Boolean;
begin
{*
 004ED414    push        ebp
 004ED415    mov         ebp,esp
 004ED417    push        ebx
 004ED418    mov         ebx,eax
 004ED41A    test        ebx,ebx
>004ED41C    je          004ED432
 004ED41E    mov         eax,dword ptr [ebp+8]
 004ED421    mov         edx,dword ptr [eax-4]
 004ED424    mov         edx,dword ptr [edx+8]
 004ED427    mov         eax,ebx
 004ED429    mov         ecx,dword ptr [eax]
 004ED42B    call        dword ptr [ecx+30]
 004ED42E    test        al,al
>004ED430    jne         004ED437
 004ED432    xor         eax,eax
 004ED434    pop         ebx
 004ED435    pop         ebp
 004ED436    ret
 004ED437    mov         al,1
 004ED439    pop         ebx
 004ED43A    pop         ebp
 004ED43B    ret
*}
end;

//004ED43C
function TraverseClients3(Container:TWinControl):Boolean;
begin
{*
 004ED43C    push        ebp
 004ED43D    mov         ebp,esp
 004ED43F    push        ecx
 004ED440    push        ebx
 004ED441    push        esi
 004ED442    push        edi
 004ED443    mov         edi,eax
 004ED445    cmp         byte ptr [edi+1EA],0
>004ED44C    je          004ED4C2
 004ED44E    test        byte ptr [edi+1C],10
>004ED452    jne         004ED4C2
 004ED454    mov         eax,edi
 004ED456    call        TWinControl.GetControlCount
 004ED45B    mov         esi,eax
 004ED45D    dec         esi
 004ED45E    test        esi,esi
>004ED460    jl          004ED4C2
 004ED462    inc         esi
 004ED463    mov         dword ptr [ebp-4],0
 004ED46A    mov         edx,dword ptr [ebp-4]
 004ED46D    mov         eax,edi
 004ED46F    call        TWinControl.GetControl
 004ED474    mov         ebx,eax
 004ED476    cmp         byte ptr [ebx+59],0
>004ED47A    je          004ED48C
 004ED47C    mov         eax,dword ptr [ebp+8]
 004ED47F    push        eax
 004ED480    mov         eax,ebx
 004ED482    call        ProcessUpdate
 004ED487    pop         ecx
 004ED488    test        al,al
>004ED48A    jne         004ED4B8
 004ED48C    mov         eax,ebx
 004ED48E    mov         edx,dword ptr ds:[47C4E8];TWinControl
 004ED494    call        @IsClass
 004ED499    test        al,al
>004ED49B    je          004ED4BC
 004ED49D    mov         eax,ebx
 004ED49F    call        TWinControl.GetControlCount
 004ED4A4    test        eax,eax
>004ED4A6    jle         004ED4BC
 004ED4A8    mov         eax,dword ptr [ebp+8]
 004ED4AB    push        eax
 004ED4AC    mov         eax,ebx
 004ED4AE    call        TraverseClients3
 004ED4B3    pop         ecx
 004ED4B4    test        al,al
>004ED4B6    je          004ED4BC
 004ED4B8    mov         al,1
>004ED4BA    jmp         004ED4C4
 004ED4BC    inc         dword ptr [ebp-4]
 004ED4BF    dec         esi
>004ED4C0    jne         004ED46A
 004ED4C2    xor         eax,eax
 004ED4C4    pop         edi
 004ED4C5    pop         esi
 004ED4C6    pop         ebx
 004ED4C7    pop         ecx
 004ED4C8    pop         ebp
 004ED4C9    ret
*}
end;

//004ED4CC
procedure TCustomForm.CMActionUpdate(var Message:TMessage);
begin
{*
 004ED4CC    push        ebp
 004ED4CD    mov         ebp,esp
 004ED4CF    push        ecx
 004ED4D0    push        ebx
 004ED4D1    mov         dword ptr [ebp-4],edx
 004ED4D4    mov         ebx,eax
 004ED4D6    test        byte ptr [ebx+1C],10
>004ED4DA    jne         004ED51A
 004ED4DC    cmp         byte ptr [ebx+1EA],0
>004ED4E3    je          004ED51A
 004ED4E5    push        ebp
 004ED4E6    mov         eax,dword ptr [ebx+290]
 004ED4EC    call        ProcessUpdate
 004ED4F1    pop         ecx
 004ED4F2    test        al,al
>004ED4F4    jne         004ED510
 004ED4F6    push        ebp
 004ED4F7    mov         eax,ebx
 004ED4F9    call        ProcessUpdate
 004ED4FE    pop         ecx
 004ED4FF    test        al,al
>004ED501    jne         004ED510
 004ED503    push        ebp
 004ED504    mov         eax,ebx
 004ED506    call        TraverseClients3
 004ED50B    pop         ecx
 004ED50C    test        al,al
>004ED50E    je          004ED51A
 004ED510    mov         eax,dword ptr [ebp-4]
 004ED513    mov         dword ptr [eax+0C],1
 004ED51A    pop         ebx
 004ED51B    pop         ecx
 004ED51C    pop         ebp
 004ED51D    ret
*}
end;

//004ED520
function DispatchShortCut(const Owner:TComponent):Boolean;
begin
{*
 004ED520    push        ebp
 004ED521    mov         ebp,esp
 004ED523    add         esp,0FFFFFFF8
 004ED526    push        ebx
 004ED527    push        esi
 004ED528    push        edi
 004ED529    mov         dword ptr [ebp-4],eax
 004ED52C    mov         byte ptr [ebp-5],0
 004ED530    mov         eax,dword ptr [ebp-4]
 004ED533    call        TComponent.GetComponentCount
 004ED538    mov         esi,eax
 004ED53A    dec         esi
 004ED53B    test        esi,esi
>004ED53D    jl          004ED58F
 004ED53F    inc         esi
 004ED540    xor         edi,edi
 004ED542    mov         edx,edi
 004ED544    mov         eax,dword ptr [ebp-4]
 004ED547    call        TComponent.GetComponent
 004ED54C    mov         ebx,eax
 004ED54E    mov         eax,ebx
 004ED550    mov         edx,dword ptr ds:[473DC0];TCustomActionList
 004ED556    call        @IsClass
 004ED55B    test        al,al
>004ED55D    je          004ED576
 004ED55F    mov         eax,dword ptr [ebp+8]
 004ED562    mov         edx,dword ptr [eax-4]
 004ED565    mov         eax,ebx
 004ED567    call        TCustomActionList.IsShortCut
 004ED56C    test        al,al
>004ED56E    je          004ED58B
 004ED570    mov         byte ptr [ebp-5],1
>004ED574    jmp         004ED58F
 004ED576    mov         eax,dword ptr [ebp+8]
 004ED579    push        eax
 004ED57A    mov         eax,ebx
 004ED57C    call        DispatchShortCut
 004ED581    pop         ecx
 004ED582    mov         byte ptr [ebp-5],al
 004ED585    cmp         byte ptr [ebp-5],0
>004ED589    jne         004ED58F
 004ED58B    inc         edi
 004ED58C    dec         esi
>004ED58D    jne         004ED542
 004ED58F    movzx       eax,byte ptr [ebp-5]
 004ED593    pop         edi
 004ED594    pop         esi
 004ED595    pop         ebx
 004ED596    pop         ecx
 004ED597    pop         ecx
 004ED598    pop         ebp
 004ED599    ret
*}
end;

//004ED59C
procedure TCustomForm.IsShortCut(var Message:TWMKey);
begin
{*
 004ED59C    push        ebp
 004ED59D    mov         ebp,esp
 004ED59F    add         esp,0FFFFFFF8
 004ED5A2    push        ebx
 004ED5A3    push        esi
 004ED5A4    push        edi
 004ED5A5    mov         dword ptr [ebp-4],edx
 004ED5A8    mov         ebx,eax
 004ED5AA    mov         byte ptr [ebp-5],0
 004ED5AE    cmp         word ptr [ebx+322],0
>004ED5B6    je          004ED5CA
 004ED5B8    lea         ecx,[ebp-5]
 004ED5BB    mov         edx,dword ptr [ebp-4]
 004ED5BE    mov         eax,dword ptr [ebx+324]
 004ED5C4    call        dword ptr [ebx+320]
 004ED5CA    cmp         byte ptr [ebp-5],0
>004ED5CE    jne         004ED603
 004ED5D0    mov         edi,dword ptr [ebx+2B4]
 004ED5D6    test        edi,edi
>004ED5D8    je          004ED5F2
 004ED5DA    cmp         dword ptr [edi+3C],0
>004ED5DE    je          004ED5F2
 004ED5E0    mov         edx,dword ptr [ebp-4]
 004ED5E3    mov         eax,edi
 004ED5E5    mov         si,0FFEF
 004ED5E9    call        @CallDynaInst
 004ED5EE    test        al,al
>004ED5F0    jne         004ED603
 004ED5F2    push        ebp
 004ED5F3    mov         eax,ebx
 004ED5F5    call        DispatchShortCut
 004ED5FA    pop         ecx
 004ED5FB    test        al,al
>004ED5FD    jne         004ED603
 004ED5FF    xor         eax,eax
>004ED601    jmp         004ED605
 004ED603    mov         al,1
 004ED605    mov         byte ptr [ebp-5],al
 004ED608    movzx       eax,byte ptr [ebp-5]
 004ED60C    pop         edi
 004ED60D    pop         esi
 004ED60E    pop         ebx
 004ED60F    pop         ecx
 004ED610    pop         ecx
 004ED611    pop         ebp
 004ED612    ret
*}
end;

//004ED614
function TCustomForm.QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;
begin
{*
 004ED614    push        ebp
 004ED615    mov         ebp,esp
 004ED617    push        ebx
 004ED618    push        esi
 004ED619    push        edi
 004ED61A    mov         edi,dword ptr [ebp+10]
 004ED61D    mov         esi,dword ptr [ebp+0C]
 004ED620    mov         ebx,dword ptr [ebp+8]
 004ED623    cmp         dword ptr [ebx+2BC],0
>004ED62A    je          004ED63D
 004ED62C    push        edi
 004ED62D    push        esi
 004ED62E    mov         eax,dword ptr [ebx+2BC]
 004ED634    push        eax
 004ED635    mov         eax,dword ptr [eax]
 004ED637    call        dword ptr [eax]
 004ED639    test        eax,eax
>004ED63B    je          004ED647
 004ED63D    push        edi
 004ED63E    push        esi
 004ED63F    push        ebx
 004ED640    call        TComponent.QueryInterface
>004ED645    jmp         004ED649
 004ED647    xor         eax,eax
 004ED649    pop         edi
 004ED64A    pop         esi
 004ED64B    pop         ebx
 004ED64C    pop         ebp
 004ED64D    ret         0C
*}
end;

//004ED650
procedure TCustomForm.MouseWheelHandler(var Message:TMessage);
begin
{*
 004ED650    push        ebx
 004ED651    push        esi
 004ED652    push        edi
 004ED653    mov         esi,edx
 004ED655    mov         ebx,eax
 004ED657    mov         edi,dword ptr [ebx+294]
 004ED65D    test        edi,edi
>004ED65F    je          004ED679
 004ED661    mov         eax,dword ptr [esi+8]
 004ED664    push        eax
 004ED665    mov         ecx,dword ptr [esi+4]
 004ED668    mov         edx,0B043
 004ED66D    mov         eax,edi
 004ED66F    call        TControl.Perform
 004ED674    mov         dword ptr [esi+0C],eax
>004ED677    jmp         004ED682
 004ED679    mov         edx,esi
 004ED67B    mov         eax,ebx
 004ED67D    call        TControl.MouseWheelHandler
 004ED682    pop         edi
 004ED683    pop         esi
 004ED684    pop         ebx
 004ED685    ret
*}
end;

//004ED688
procedure TCustomForm.HandleCreateException;
begin
{*
 004ED688    mov         edx,eax
 004ED68A    mov         eax,[007932EC];Application:TApplication
 004ED68F    call        TApplication.HandleException
 004ED694    mov         al,1
 004ED696    ret
*}
end;

//004ED698
procedure TCustomForm.SetLayeredAttribs;
begin
{*
 004ED698    push        ebx
 004ED699    push        esi
 004ED69A    mov         ebx,eax
 004ED69C    test        byte ptr [ebx+1C],10
>004ED6A0    jne         004ED770
 004ED6A6    cmp         dword ptr ds:[7866F4],0
>004ED6AD    je          004ED770
 004ED6B3    mov         eax,ebx
 004ED6B5    call        TWinControl.HandleAllocated
 004ED6BA    test        al,al
>004ED6BC    je          004ED770
 004ED6C2    push        0EC
 004ED6C4    mov         eax,ebx
 004ED6C6    call        TWinControl.GetHandle
 004ED6CB    push        eax
 004ED6CC    call        user32.GetWindowLongW
 004ED6D1    mov         esi,eax
 004ED6D3    cmp         byte ptr [ebx+340],0
>004ED6DA    jne         004ED6E5
 004ED6DC    cmp         byte ptr [ebx+368],0
>004ED6E3    je          004ED744
 004ED6E5    test        esi,80000
>004ED6EB    jne         004ED703
 004ED6ED    or          esi,80000
 004ED6F3    push        esi
 004ED6F4    push        0EC
 004ED6F6    mov         eax,ebx
 004ED6F8    call        TWinControl.GetHandle
 004ED6FD    push        eax
 004ED6FE    call        user32.SetWindowLongW
 004ED703    movzx       eax,byte ptr [ebx+340]
 004ED70A    mov         eax,dword ptr [eax*4+786784]
 004ED711    movzx       edx,byte ptr [ebx+368]
 004ED718    or          eax,dword ptr [edx*4+78678C]
 004ED71F    push        eax
 004ED720    movzx       eax,byte ptr [ebx+341]
 004ED727    push        eax
 004ED728    mov         eax,dword ptr [ebx+36C]
 004ED72E    call        ColorToRGB
 004ED733    push        eax
 004ED734    mov         eax,ebx
 004ED736    call        TWinControl.GetHandle
 004ED73B    push        eax
 004ED73C    call        dword ptr ds:[7866F4]
>004ED742    jmp         004ED770
 004ED744    and         esi,0FFF7FFFF
 004ED74A    push        esi
 004ED74B    push        0EC
 004ED74D    mov         eax,ebx
 004ED74F    call        TWinControl.GetHandle
 004ED754    push        eax
 004ED755    call        user32.SetWindowLongW
 004ED75A    push        485
 004ED75F    push        0
 004ED761    push        0
 004ED763    mov         eax,ebx
 004ED765    call        TWinControl.GetHandle
 004ED76A    push        eax
 004ED76B    call        user32.RedrawWindow
 004ED770    pop         esi
 004ED771    pop         ebx
 004ED772    ret
*}
end;

//004ED774
procedure TCustomForm.SetAlphaBlend(const Value:Boolean);
begin
{*
 004ED774    cmp         dl,byte ptr [eax+340]
>004ED77A    je          004ED787
 004ED77C    mov         byte ptr [eax+340],dl
 004ED782    call        TCustomForm.SetLayeredAttribs
 004ED787    ret
*}
end;

//004ED788
procedure TCustomForm.SetAlphaBlendValue(const Value:Byte);
begin
{*
 004ED788    cmp         dl,byte ptr [eax+341]
>004ED78E    je          004ED79B
 004ED790    mov         byte ptr [eax+341],dl
 004ED796    call        TCustomForm.SetLayeredAttribs
 004ED79B    ret
*}
end;

//004ED79C
procedure TCustomForm.SetTransparentColorValue(const Value:TColor);
begin
{*
 004ED79C    cmp         edx,dword ptr [eax+36C]
>004ED7A2    je          004ED7AF
 004ED7A4    mov         dword ptr [eax+36C],edx
 004ED7AA    call        TCustomForm.SetLayeredAttribs
 004ED7AF    ret
*}
end;

//004ED7B0
procedure TCustomForm.SetTransparentColor(const Value:Boolean);
begin
{*
 004ED7B0    push        ebx
 004ED7B1    mov         ebx,eax
 004ED7B3    cmp         dl,byte ptr [ebx+368]
>004ED7B9    je          004ED7EA
 004ED7BB    mov         byte ptr [ebx+368],dl
 004ED7C1    cmp         byte ptr [ebx+368],0
>004ED7C8    je          004ED7E3
 004ED7CA    mov         eax,dword ptr [ebx+374]
 004ED7D0    cmp         byte ptr [eax+8],0
>004ED7D4    je          004ED7E3
 004ED7D6    xor         edx,edx
 004ED7D8    mov         eax,dword ptr [ebx+374]
 004ED7DE    call        TGlassFrame.SetEnabled
 004ED7E3    mov         eax,ebx
 004ED7E5    call        TCustomForm.SetLayeredAttribs
 004ED7EA    pop         ebx
 004ED7EB    ret
*}
end;

//004ED7EC
procedure TCustomForm.InitAlphaBlending(var Params:TCreateParams);
begin
{*
 004ED7EC    test        byte ptr [eax+1C],10
>004ED7F0    jne         004ED814
 004ED7F2    cmp         dword ptr ds:[7866F4],0
>004ED7F9    je          004ED814
 004ED7FB    cmp         byte ptr [eax+340],0
>004ED802    jne         004ED80D
 004ED804    cmp         byte ptr [eax+368],0
>004ED80B    je          004ED814
 004ED80D    or          dword ptr [edx+8],80000
 004ED814    ret
*}
end;

//004ED818
procedure TCustomForm.MakeFullyVisible(AMonitor:TMonitor);
begin
{*
 004ED818    push        ebx
 004ED819    push        esi
 004ED81A    push        edi
 004ED81B    push        ebp
 004ED81C    mov         esi,edx
 004ED81E    mov         ebx,eax
 004ED820    test        esi,esi
>004ED822    jne         004ED82D
 004ED824    mov         eax,ebx
 004ED826    call        TCustomForm.GetMonitor
 004ED82B    mov         esi,eax
 004ED82D    mov         eax,ebx
 004ED82F    call        TCustomForm.GetLeft
 004ED834    mov         edi,eax
 004ED836    mov         eax,ebx
 004ED838    call        TCustomForm.GetTop
 004ED83D    mov         ebp,eax
 004ED83F    mov         eax,esi
 004ED841    call        TMonitor.GetLeft
 004ED846    push        eax
 004ED847    mov         eax,esi
 004ED849    call        TMonitor.GetWidth
 004ED84E    pop         edx
 004ED84F    add         edx,eax
 004ED851    push        edx
 004ED852    mov         eax,ebx
 004ED854    call        TCustomForm.GetLeft
 004ED859    add         eax,dword ptr [ebx+48]
 004ED85C    pop         edx
 004ED85D    cmp         edx,eax
>004ED85F    jge         004ED876
 004ED861    mov         eax,esi
 004ED863    call        TMonitor.GetLeft
 004ED868    mov         edi,eax
 004ED86A    mov         eax,esi
 004ED86C    call        TMonitor.GetWidth
 004ED871    add         edi,eax
 004ED873    sub         edi,dword ptr [ebx+48]
 004ED876    mov         eax,ebx
 004ED878    call        TCustomForm.GetLeft
 004ED87D    push        eax
 004ED87E    mov         eax,esi
 004ED880    call        TMonitor.GetLeft
 004ED885    pop         edx
 004ED886    cmp         edx,eax
>004ED888    jge         004ED893
 004ED88A    mov         eax,esi
 004ED88C    call        TMonitor.GetLeft
 004ED891    mov         edi,eax
 004ED893    mov         eax,esi
 004ED895    call        TMonitor.GetTop
 004ED89A    push        eax
 004ED89B    mov         eax,esi
 004ED89D    call        TMonitor.GetHeight
 004ED8A2    pop         edx
 004ED8A3    add         edx,eax
 004ED8A5    push        edx
 004ED8A6    mov         eax,ebx
 004ED8A8    call        TCustomForm.GetTop
 004ED8AD    add         eax,dword ptr [ebx+4C]
 004ED8B0    pop         edx
 004ED8B1    cmp         edx,eax
>004ED8B3    jge         004ED8CA
 004ED8B5    mov         eax,esi
 004ED8B7    call        TMonitor.GetTop
 004ED8BC    mov         ebp,eax
 004ED8BE    mov         eax,esi
 004ED8C0    call        TMonitor.GetHeight
 004ED8C5    add         ebp,eax
 004ED8C7    sub         ebp,dword ptr [ebx+4C]
 004ED8CA    mov         eax,ebx
 004ED8CC    call        TCustomForm.GetTop
 004ED8D1    push        eax
 004ED8D2    mov         eax,esi
 004ED8D4    call        TMonitor.GetTop
 004ED8D9    pop         edx
 004ED8DA    cmp         edx,eax
>004ED8DC    jge         004ED8E7
 004ED8DE    mov         eax,esi
 004ED8E0    call        TMonitor.GetTop
 004ED8E5    mov         ebp,eax
 004ED8E7    mov         eax,dword ptr [ebx+48]
 004ED8EA    push        eax
 004ED8EB    mov         eax,dword ptr [ebx+4C]
 004ED8EE    push        eax
 004ED8EF    mov         ecx,ebp
 004ED8F1    mov         edx,edi
 004ED8F3    mov         eax,ebx
 004ED8F5    mov         ebx,dword ptr [eax]
 004ED8F7    call        dword ptr [ebx+98]
 004ED8FD    pop         ebp
 004ED8FE    pop         edi
 004ED8FF    pop         esi
 004ED900    pop         ebx
 004ED901    ret
*}
end;

//004ED904
procedure TCustomForm.SetLeft(Value:Integer);
begin
{*
 004ED904    test        byte ptr [eax+1C],10
>004ED908    je          004ED938
 004ED90A    cmp         dword ptr [eax+34],0
>004ED90E    je          004ED938
 004ED910    mov         ecx,dword ptr [eax+18]
 004ED913    and         ecx,0FFFF
 004ED919    shl         edx,10
 004ED91C    or          ecx,edx
 004ED91E    mov         dword ptr [eax+18],ecx
 004ED921    test        byte ptr [eax+1C],1
>004ED925    jne         004ED93D
 004ED927    cmp         byte ptr [eax+29F],3
>004ED92E    je          004ED93D
 004ED930    xor         edx,edx
 004ED932    call        TCustomForm.SetPosition
 004ED937    ret
 004ED938    call        TControl.SetLeft
 004ED93D    ret
*}
end;

//004ED940
procedure TCustomForm.SetTop(Value:Integer);
begin
{*
 004ED940    test        byte ptr [eax+1C],10
>004ED944    je          004ED977
 004ED946    cmp         dword ptr [eax+34],0
>004ED94A    je          004ED977
 004ED94C    mov         ecx,dword ptr [eax+18]
 004ED94F    and         ecx,0FFFF0000
 004ED955    and         edx,0FFFF
 004ED95B    or          ecx,edx
 004ED95D    mov         dword ptr [eax+18],ecx
 004ED960    test        byte ptr [eax+1C],1
>004ED964    jne         004ED97C
 004ED966    cmp         byte ptr [eax+29F],3
>004ED96D    je          004ED97C
 004ED96F    xor         edx,edx
 004ED971    call        TCustomForm.SetPosition
 004ED976    ret
 004ED977    call        TControl.SetTop
 004ED97C    ret
*}
end;

//004ED980
procedure TCustomForm.SetGlassFrame(const Value:TGlassFrame);
begin
{*
 004ED980    mov         eax,dword ptr [eax+374]
 004ED986    mov         ecx,dword ptr [eax]
 004ED988    call        dword ptr [ecx+8]
 004ED98B    ret
*}
end;

//004ED98C
procedure TCustomForm.UpdateGlassFrame(Sender:TObject);
begin
{*
 004ED98C    push        esi
 004ED98D    add         esp,0FFFFFFF0
 004ED990    mov         esi,eax
 004ED992    call        DwmCompositionEnabled
 004ED997    test        al,al
>004ED999    je          004EDA5D
 004ED99F    mov         eax,esi
 004ED9A1    call        TWinControl.HandleAllocated
 004ED9A6    test        al,al
>004ED9A8    je          004EDA5D
 004ED9AE    mov         eax,dword ptr [esi+374]
 004ED9B4    cmp         byte ptr [eax+8],0
>004ED9B8    je          004EDA0F
 004ED9BA    cmp         byte ptr [eax+28],0
>004ED9BE    jne         004ED9DD
 004ED9C0    mov         edx,dword ptr [eax+0C]
 004ED9C3    mov         dword ptr [esp],edx
 004ED9C6    mov         edx,dword ptr [eax+14]
 004ED9C9    mov         dword ptr [esp+4],edx
 004ED9CD    mov         edx,dword ptr [eax+10]
 004ED9D0    mov         dword ptr [esp+8],edx
 004ED9D4    mov         eax,dword ptr [eax+18]
 004ED9D7    mov         dword ptr [esp+0C],eax
>004ED9DB    jmp         004ED9FC
 004ED9DD    mov         dword ptr [esp],0FFFFFFFF
 004ED9E4    mov         dword ptr [esp+4],0FFFFFFFF
 004ED9EC    mov         dword ptr [esp+8],0FFFFFFFF
 004ED9F4    mov         dword ptr [esp+0C],0FFFFFFFF
 004ED9FC    test        byte ptr [esi+1C],10
>004EDA00    jne         004EDA2A
 004EDA02    mov         eax,[004EDA88]
 004EDA07    or          eax,dword ptr [esi+54]
 004EDA0A    mov         dword ptr [esi+54],eax
>004EDA0D    jmp         004EDA2A
 004EDA0F    mov         eax,[004EDA88]
 004EDA14    not         eax
 004EDA16    and         eax,dword ptr [esi+54]
 004EDA19    mov         dword ptr [esi+54],eax
 004EDA1C    mov         eax,esp
 004EDA1E    xor         ecx,ecx
 004EDA20    mov         edx,10
 004EDA25    call        @FillChar
 004EDA2A    test        byte ptr [esi+1C],10
>004EDA2E    je          004EDA43
 004EDA30    push        0FF
 004EDA32    push        0
 004EDA34    mov         eax,esi
 004EDA36    call        TWinControl.GetHandle
 004EDA3B    push        eax
 004EDA3C    call        user32.InvalidateRect
>004EDA41    jmp         004EDA81
 004EDA43    push        esp
 004EDA44    mov         eax,esi
 004EDA46    call        TWinControl.GetHandle
 004EDA4B    push        eax
 004EDA4C    call        DwmExtendFrameIntoClientArea
 004EDA51    mov         eax,esi
 004EDA53    mov         edx,dword ptr [eax]
 004EDA55    call        dword ptr [edx+90]
>004EDA5B    jmp         004EDA81
 004EDA5D    mov         eax,[004EDA88]
 004EDA62    not         eax
 004EDA64    and         eax,dword ptr [esi+54]
 004EDA67    mov         dword ptr [esi+54],eax
 004EDA6A    test        byte ptr [esi+1C],10
>004EDA6E    je          004EDA81
 004EDA70    push        0FF
 004EDA72    push        0
 004EDA74    mov         eax,esi
 004EDA76    call        TWinControl.GetHandle
 004EDA7B    push        eax
 004EDA7C    call        user32.InvalidateRect
 004EDA81    add         esp,10
 004EDA84    pop         esi
 004EDA85    ret
*}
end;

//004EDA8C
procedure DoUpdateControls(AControl:TWinControl);
begin
{*
 004EDA8C    push        ebp
 004EDA8D    mov         ebp,esp
 004EDA8F    add         esp,0FFFFFFE0
 004EDA92    push        ebx
 004EDA93    push        esi
 004EDA94    mov         dword ptr [ebp-4],eax
 004EDA97    mov         eax,dword ptr [ebp-4]
 004EDA9A    call        TWinControl.GetControlCount
 004EDA9F    mov         esi,eax
 004EDAA1    dec         esi
 004EDAA2    test        esi,esi
>004EDAA4    jl          004EDBBF
 004EDAAA    inc         esi
 004EDAAB    mov         dword ptr [ebp-8],0
 004EDAB2    mov         edx,dword ptr [ebp-8]
 004EDAB5    mov         eax,dword ptr [ebp-4]
 004EDAB8    call        TWinControl.GetControl
 004EDABD    mov         ebx,eax
 004EDABF    mov         eax,dword ptr [ebp+8]
 004EDAC2    mov         eax,dword ptr [eax-4]
 004EDAC5    mov         eax,dword ptr [eax+374]
 004EDACB    cmp         byte ptr [eax+28],0
>004EDACF    jne         004EDB1B
 004EDAD1    lea         edx,[ebp-18]
 004EDAD4    mov         eax,ebx
 004EDAD6    mov         ecx,dword ptr [eax]
 004EDAD8    call        dword ptr [ecx+54]
 004EDADB    lea         eax,[ebp-20]
 004EDADE    push        eax
 004EDADF    mov         eax,dword ptr [ebp+8]
 004EDAE2    mov         ecx,dword ptr [eax-4]
 004EDAE5    lea         edx,[ebp-18]
 004EDAE8    mov         eax,ebx
 004EDAEA    call        TControl.ClientToParent
 004EDAEF    mov         eax,dword ptr [ebp-20]
 004EDAF2    mov         dword ptr [ebp-18],eax
 004EDAF5    mov         eax,dword ptr [ebp-1C]
 004EDAF8    mov         dword ptr [ebp-14],eax
 004EDAFB    lea         eax,[ebp-20]
 004EDAFE    push        eax
 004EDAFF    mov         eax,dword ptr [ebp+8]
 004EDB02    mov         ecx,dword ptr [eax-4]
 004EDB05    lea         edx,[ebp-10]
 004EDB08    mov         eax,ebx
 004EDB0A    call        TControl.ClientToParent
 004EDB0F    mov         eax,dword ptr [ebp-20]
 004EDB12    mov         dword ptr [ebp-10],eax
 004EDB15    mov         eax,dword ptr [ebp-1C]
 004EDB18    mov         dword ptr [ebp-0C],eax
 004EDB1B    mov         eax,dword ptr [ebp+8]
 004EDB1E    mov         eax,dword ptr [eax-4]
 004EDB21    mov         eax,dword ptr [eax+374]
 004EDB27    cmp         byte ptr [eax+28],0
>004EDB2B    je          004EDB31
 004EDB2D    mov         al,1
>004EDB2F    jmp         004EDB6E
 004EDB31    mov         eax,dword ptr [ebp+8]
 004EDB34    mov         eax,dword ptr [eax-8]
 004EDB37    mov         eax,dword ptr [eax]
 004EDB39    cmp         eax,dword ptr [ebp-18]
>004EDB3C    jg          004EDB6C
 004EDB3E    mov         eax,dword ptr [ebp+8]
 004EDB41    mov         eax,dword ptr [eax-8]
 004EDB44    mov         eax,dword ptr [eax+8]
 004EDB47    cmp         eax,dword ptr [ebp-10]
>004EDB4A    jl          004EDB6C
 004EDB4C    mov         eax,dword ptr [ebp+8]
 004EDB4F    mov         eax,dword ptr [eax-8]
 004EDB52    mov         eax,dword ptr [eax+4]
 004EDB55    cmp         eax,dword ptr [ebp-14]
>004EDB58    jg          004EDB6C
 004EDB5A    mov         eax,dword ptr [ebp+8]
 004EDB5D    mov         eax,dword ptr [eax-8]
 004EDB60    mov         eax,dword ptr [eax+0C]
 004EDB63    cmp         eax,dword ptr [ebp-0C]
>004EDB66    jl          004EDB6C
 004EDB68    xor         eax,eax
>004EDB6A    jmp         004EDB6E
 004EDB6C    mov         al,1
 004EDB6E    test        al,al
>004EDB70    je          004EDB85
 004EDB72    test        byte ptr [ebx+55],80
>004EDB76    jne         004EDB98
 004EDB78    mov         eax,[004EDBC8]
 004EDB7D    or          eax,dword ptr [ebx+54]
 004EDB80    mov         dword ptr [ebx+54],eax
>004EDB83    jmp         004EDB98
 004EDB85    test        byte ptr [ebx+55],80
>004EDB89    je          004EDB98
 004EDB8B    mov         eax,[004EDBC8]
 004EDB90    not         eax
 004EDB92    and         eax,dword ptr [ebx+54]
 004EDB95    mov         dword ptr [ebx+54],eax
 004EDB98    mov         eax,ebx
 004EDB9A    mov         edx,dword ptr ds:[47C4E8];TWinControl
 004EDBA0    call        @IsClass
 004EDBA5    test        al,al
>004EDBA7    je          004EDBB5
 004EDBA9    mov         eax,dword ptr [ebp+8]
 004EDBAC    push        eax
 004EDBAD    mov         eax,ebx
 004EDBAF    call        DoUpdateControls
 004EDBB4    pop         ecx
 004EDBB5    inc         dword ptr [ebp-8]
 004EDBB8    dec         esi
>004EDBB9    jne         004EDAB2
 004EDBBF    pop         esi
 004EDBC0    pop         ebx
 004EDBC1    mov         esp,ebp
 004EDBC3    pop         ebp
 004EDBC4    ret
*}
end;

//004EDBCC
procedure TCustomForm.UpdateGlassFrameControls(const Rect:TRect);
begin
{*
 004EDBCC    push        ebp
 004EDBCD    mov         ebp,esp
 004EDBCF    add         esp,0FFFFFFF8
 004EDBD2    mov         dword ptr [ebp-8],edx
 004EDBD5    mov         dword ptr [ebp-4],eax
 004EDBD8    mov         eax,dword ptr [ebp-4]
 004EDBDB    test        byte ptr [eax+1C],10
>004EDBDF    jne         004EDBEB
 004EDBE1    push        ebp
 004EDBE2    mov         eax,dword ptr [ebp-4]
 004EDBE5    call        DoUpdateControls
 004EDBEA    pop         ecx
 004EDBEB    pop         ecx
 004EDBEC    pop         ecx
 004EDBED    pop         ebp
 004EDBEE    ret
*}
end;

//004EDBF0
procedure TForm.Tile;
begin
{*
 004EDBF0    cmp         byte ptr [eax+29E],2
>004EDBF7    jne         004EDC25
 004EDBF9    cmp         dword ptr [eax+37C],0
>004EDC00    je          004EDC25
 004EDC02    push        0
 004EDC04    movzx       edx,byte ptr [eax+2A1]
 004EDC0B    movzx       edx,word ptr [edx*2+786794]
 004EDC13    push        edx
 004EDC14    push        226
 004EDC19    mov         eax,dword ptr [eax+37C]
 004EDC1F    push        eax
 004EDC20    call        user32.SendMessageW
 004EDC25    ret
*}
end;

//004EDC28
procedure TForm.Cascade;
begin
{*
 004EDC28    cmp         byte ptr [eax+29E],2
>004EDC2F    jne         004EDC4F
 004EDC31    cmp         dword ptr [eax+37C],0
>004EDC38    je          004EDC4F
 004EDC3A    push        0
 004EDC3C    push        0
 004EDC3E    push        227
 004EDC43    mov         eax,dword ptr [eax+37C]
 004EDC49    push        eax
 004EDC4A    call        user32.SendMessageW
 004EDC4F    ret
*}
end;

//004EDC50
procedure TForm.ArrangeIcons;
begin
{*
 004EDC50    cmp         byte ptr [eax+29E],2
>004EDC57    jne         004EDC77
 004EDC59    cmp         dword ptr [eax+37C],0
>004EDC60    je          004EDC77
 004EDC62    push        0
 004EDC64    push        0
 004EDC66    push        228
 004EDC6B    mov         eax,dword ptr [eax+37C]
 004EDC71    push        eax
 004EDC72    call        user32.SendMessageW
 004EDC77    ret
*}
end;

//004EDC78
procedure TForm.Next;
begin
{*
 004EDC78    cmp         byte ptr [eax+29E],2
>004EDC7F    jne         004EDC9F
 004EDC81    cmp         dword ptr [eax+37C],0
>004EDC88    je          004EDC9F
 004EDC8A    push        0
 004EDC8C    push        0
 004EDC8E    push        224
 004EDC93    mov         eax,dword ptr [eax+37C]
 004EDC99    push        eax
 004EDC9A    call        user32.SendMessageW
 004EDC9F    ret
*}
end;

//004EDCA0
procedure TForm.Previous;
begin
{*
 004EDCA0    cmp         byte ptr [eax+29E],2
>004EDCA7    jne         004EDCC7
 004EDCA9    cmp         dword ptr [eax+37C],0
>004EDCB0    je          004EDCC7
 004EDCB2    push        1
 004EDCB4    push        0
 004EDCB6    push        224
 004EDCBB    mov         eax,dword ptr [eax+37C]
 004EDCC1    push        eax
 004EDCC2    call        user32.SendMessageW
 004EDCC7    ret
*}
end;

//004EDCC8
constructor TCustomDockForm.Create;
begin
{*
 004EDCC8    push        ebp
 004EDCC9    mov         ebp,esp
 004EDCCB    push        ecx
 004EDCCC    push        ebx
 004EDCCD    push        esi
 004EDCCE    test        dl,dl
>004EDCD0    je          004EDCDA
 004EDCD2    add         esp,0FFFFFFF0
 004EDCD5    call        @ClassCreate
 004EDCDA    mov         byte ptr [ebp-1],dl
 004EDCDD    mov         ebx,eax
 004EDCDF    push        0
 004EDCE1    xor         edx,edx
 004EDCE3    mov         eax,ebx
 004EDCE5    mov         esi,dword ptr [eax]
 004EDCE7    call        dword ptr [esi+108]
 004EDCED    xor         edx,edx
 004EDCEF    mov         eax,ebx
 004EDCF1    call        TScrollingWinControl.SetAutoScroll
 004EDCF6    mov         dl,5
 004EDCF8    mov         eax,ebx
 004EDCFA    call        TCustomForm.SetBorderStyle
 004EDCFF    mov         dl,1
 004EDD01    mov         eax,ebx
 004EDD03    call        TWinControl.SetDockSite
 004EDD08    mov         dl,3
 004EDD0A    mov         eax,ebx
 004EDD0C    call        TCustomForm.SetFormStyle
 004EDD11    mov         eax,ebx
 004EDD13    cmp         byte ptr [ebp-1],0
>004EDD17    je          004EDD28
 004EDD19    call        @AfterConstruction
 004EDD1E    pop         dword ptr fs:[0]
 004EDD25    add         esp,0C
 004EDD28    mov         eax,ebx
 004EDD2A    pop         esi
 004EDD2B    pop         ebx
 004EDD2C    pop         ecx
 004EDD2D    pop         ebp
 004EDD2E    ret
*}
end;

//004EDD30
procedure TCustomDockForm.DoAddDockClient(Client:TControl; const ARect:TRect);
begin
{*
 004EDD30    push        ebp
 004EDD31    mov         ebp,esp
 004EDD33    add         esp,0FFFFFFF0
 004EDD36    push        ebx
 004EDD37    push        esi
 004EDD38    xor         ebx,ebx
 004EDD3A    mov         dword ptr [ebp-4],ebx
 004EDD3D    mov         dword ptr [ebp-0C],ecx
 004EDD40    mov         dword ptr [ebp-8],edx
 004EDD43    mov         esi,eax
 004EDD45    xor         eax,eax
 004EDD47    push        ebp
 004EDD48    push        4EDE29
 004EDD4D    push        dword ptr fs:[eax]
 004EDD50    mov         dword ptr fs:[eax],esp
 004EDD53    mov         eax,esi
 004EDD55    call        TWinControl.GetDockClientCount
 004EDD5A    dec         eax
>004EDD5B    jne         004EDDED
 004EDD61    mov         eax,dword ptr [ebp-8]
 004EDD64    call        TControl.GetTextLen
 004EDD69    mov         ecx,eax
 004EDD6B    inc         ecx
 004EDD6C    lea         eax,[ebp-4]
 004EDD6F    xor         edx,edx
 004EDD71    call        @UStrFromPWCharLen
 004EDD76    mov         ebx,dword ptr [ebp-4]
 004EDD79    test        ebx,ebx
>004EDD7B    je          004EDD82
 004EDD7D    sub         ebx,4
 004EDD80    mov         ebx,dword ptr [ebx]
 004EDD82    mov         eax,dword ptr [ebp-4]
 004EDD85    call        @UStrToPWChar
 004EDD8A    mov         edx,eax
 004EDD8C    mov         ecx,ebx
 004EDD8E    mov         eax,dword ptr [ebp-8]
 004EDD91    call        TControl.GetTextBuf
 004EDD96    mov         eax,dword ptr [ebp-4]
 004EDD99    test        eax,eax
>004EDD9B    je          004EDDA2
 004EDD9D    sub         eax,4
 004EDDA0    mov         eax,dword ptr [eax]
 004EDDA2    test        eax,eax
>004EDDA4    jle         004EDDE3
 004EDDA6    mov         ebx,1
 004EDDAB    mov         edx,4EDE38
 004EDDB0    mov         dword ptr [ebp-10],edx
 004EDDB3    mov         edx,dword ptr [ebp-4]
 004EDDB6    movzx       edx,word ptr [edx+ebx*2-2]
 004EDDBB    mov         ecx,dword ptr [ebp-10]
 004EDDBE    cmp         dx,0FF
>004EDDC3    ja          004EDDCB
 004EDDC5    movzx       edx,dx
 004EDDC8    bt          dword ptr [ecx],edx
 004EDDCB    setb        dl
 004EDDCE    test        dl,dl
>004EDDD0    je          004EDDDF
 004EDDD2    mov         edx,ebx
 004EDDD4    dec         edx
 004EDDD5    lea         eax,[ebp-4]
 004EDDD8    call        @UStrSetLength
>004EDDDD    jmp         004EDDE3
 004EDDDF    inc         ebx
 004EDDE0    dec         eax
>004EDDE1    jne         004EDDAB
 004EDDE3    mov         edx,dword ptr [ebp-4]
 004EDDE6    mov         eax,esi
 004EDDE8    call        TControl.SetText
 004EDDED    mov         ecx,dword ptr [ebp-0C]
 004EDDF0    mov         edx,dword ptr [ebp-8]
 004EDDF3    mov         eax,esi
 004EDDF5    call        TWinControl.DoAddDockClient
 004EDDFA    mov         dl,5
 004EDDFC    mov         eax,dword ptr [ebp-8]
 004EDDFF    call        TControl.SetAlign
 004EDE04    test        byte ptr [esi+1C],1
>004EDE08    jne         004EDE13
 004EDE0A    mov         dl,1
 004EDE0C    mov         eax,esi
 004EDE0E    call        TCustomForm.SetVisible
 004EDE13    xor         eax,eax
 004EDE15    pop         edx
 004EDE16    pop         ecx
 004EDE17    pop         ecx
 004EDE18    mov         dword ptr fs:[eax],edx
 004EDE1B    push        4EDE30
 004EDE20    lea         eax,[ebp-4]
 004EDE23    call        @UStrClr
 004EDE28    ret
>004EDE29    jmp         @HandleFinally
>004EDE2E    jmp         004EDE20
 004EDE30    pop         esi
 004EDE31    pop         ebx
 004EDE32    mov         esp,ebp
 004EDE34    pop         ebp
 004EDE35    ret
*}
end;

//004EDE58
procedure TCustomDockForm.DoRemoveDockClient(Client:TControl);
begin
{*
 004EDE58    push        ebx
 004EDE59    mov         ebx,eax
 004EDE5B    mov         eax,ebx
 004EDE5D    call        TWinControl.DoRemoveDockClient
 004EDE62    mov         eax,ebx
 004EDE64    call        TWinControl.GetDockClientCount
 004EDE69    test        eax,eax
>004EDE6B    jne         004EDE74
 004EDE6D    mov         eax,ebx
 004EDE6F    call        TCustomForm.Release
 004EDE74    pop         ebx
 004EDE75    ret
*}
end;

//004EDE78
procedure TCustomDockForm.Loaded;
begin
{*
 004EDE78    push        ebx
 004EDE79    push        esi
 004EDE7A    push        edi
 004EDE7B    push        ebp
 004EDE7C    add         esp,0FFFFFFF0
 004EDE7F    mov         ebx,eax
 004EDE81    mov         eax,ebx
 004EDE83    call        TWinControl.GetControlCount
 004EDE88    mov         edi,eax
 004EDE8A    dec         edi
 004EDE8B    test        edi,edi
>004EDE8D    jl          004EDEB5
 004EDE8F    inc         edi
 004EDE90    xor         ebp,ebp
 004EDE92    mov         edx,esp
 004EDE94    mov         eax,ebx
 004EDE96    mov         ecx,dword ptr [eax]
 004EDE98    call        dword ptr [ecx+54]
 004EDE9B    push        esp
 004EDE9C    mov         edx,ebp
 004EDE9E    mov         eax,ebx
 004EDEA0    call        TWinControl.GetControl
 004EDEA5    mov         edx,ebx
 004EDEA7    pop         ecx
 004EDEA8    mov         si,0FFCC
 004EDEAC    call        @CallDynaInst
 004EDEB1    inc         ebp
 004EDEB2    dec         edi
>004EDEB3    jne         004EDE92
 004EDEB5    mov         eax,ebx
 004EDEB7    call        TCustomForm.Loaded
 004EDEBC    add         esp,10
 004EDEBF    pop         ebp
 004EDEC0    pop         edi
 004EDEC1    pop         esi
 004EDEC2    pop         ebx
 004EDEC3    ret
*}
end;

//004EDEC4
procedure TCustomDockForm.GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean);
begin
{*
 004EDEC4    push        ebp
 004EDEC5    mov         ebp,esp
 004EDEC7    add         esp,0FFFFFFF8
 004EDECA    push        ebx
 004EDECB    push        esi
 004EDECC    push        edi
 004EDECD    mov         esi,dword ptr [ebp+0C]
 004EDED0    lea         edi,[ebp-8]
 004EDED3    movs        dword ptr [edi],dword ptr [esi]
 004EDED4    movs        dword ptr [edi],dword ptr [esi]
 004EDED5    mov         ebx,eax
 004EDED7    mov         eax,ebx
 004EDED9    call        TWinControl.GetDockClientCount
 004EDEDE    test        eax,eax
 004EDEE0    mov         eax,dword ptr [ebp+8]
 004EDEE3    sete        byte ptr [eax]
 004EDEE6    pop         edi
 004EDEE7    pop         esi
 004EDEE8    pop         ebx
 004EDEE9    pop         ecx
 004EDEEA    pop         ecx
 004EDEEB    pop         ebp
 004EDEEC    ret         8
*}
end;

//004EDEF0
procedure TCustomDockForm.WMNCHitTest(var Message:TWMNCHitTest);
begin
{*
 004EDEF0    push        ebx
 004EDEF1    push        esi
 004EDEF2    mov         esi,edx
 004EDEF4    mov         ebx,eax
 004EDEF6    mov         edx,esi
 004EDEF8    mov         eax,ebx
 004EDEFA    call        TCustomForm.WMNCHitTest
 004EDEFF    test        byte ptr [ebx+1C],10
>004EDF03    jne         004EDF12
 004EDF05    cmp         dword ptr [esi+0C],1
>004EDF09    jne         004EDF12
 004EDF0B    mov         dword ptr [esi+0C],2
 004EDF12    pop         esi
 004EDF13    pop         ebx
 004EDF14    ret
*}
end;

//004EDF18
procedure TCustomDockForm.WMNCLButtonDown(var Message:TWMNCLButtonDown);
begin
{*
 004EDF18    push        ebx
 004EDF19    push        esi
 004EDF1A    mov         esi,edx
 004EDF1C    mov         ebx,eax
 004EDF1E    cmp         dword ptr [esi+4],2
>004EDF22    jne         004EDFA0
 004EDF24    cmp         byte ptr [ebx+8B],1
>004EDF2B    je          004EDFA0
 004EDF2D    test        byte ptr [ebx+1C],10
>004EDF31    jne         004EDFA0
 004EDF33    mov         eax,ebx
 004EDF35    call        TWinControl.GetHandle
 004EDF3A    call        IsIconic
 004EDF3F    test        eax,eax
>004EDF41    jne         004EDFA0
 004EDF43    mov         eax,ebx
 004EDF45    call        TWinControl.GetDockClientCount
 004EDF4A    test        eax,eax
>004EDF4C    jle         004EDFA0
 004EDF4E    push        7
 004EDF50    push        0
 004EDF52    push        0
 004EDF54    push        0
 004EDF56    push        0
 004EDF58    push        0
 004EDF5A    mov         eax,ebx
 004EDF5C    call        TWinControl.GetHandle
 004EDF61    push        eax
 004EDF62    call        user32.SetWindowPos
 004EDF67    mov         eax,dword ptr [esi+8]
 004EDF6A    push        eax
 004EDF6B    mov         eax,dword ptr [esi+4]
 004EDF6E    push        eax
 004EDF6F    push        0A2
 004EDF74    mov         eax,ebx
 004EDF76    call        TWinControl.GetHandle
 004EDF7B    push        eax
 004EDF7C    call        user32.PostMessageW
 004EDF81    cmp         byte ptr [ebx+29D],0
>004EDF88    je          004EDFA9
 004EDF8A    xor         edx,edx
 004EDF8C    mov         eax,ebx
 004EDF8E    call        TWinControl.GetDockClients
 004EDF93    or          ecx,0FFFFFFFF
 004EDF96    mov         dl,1
 004EDF98    call        TControl.BeginDrag
 004EDF9D    pop         esi
 004EDF9E    pop         ebx
 004EDF9F    ret
 004EDFA0    mov         edx,esi
 004EDFA2    mov         eax,ebx
 004EDFA4    call        TCustomForm.WMNCLButtonDown
 004EDFA9    pop         esi
 004EDFAA    pop         ebx
 004EDFAB    ret
*}
end;

//004EDFAC
procedure TCustomDockForm.CMControlListChange(var Message:TMessage);
begin
{*
 004EDFAC    push        ebx
 004EDFAD    push        esi
 004EDFAE    push        edi
 004EDFAF    add         esp,0FFFFFFF0
 004EDFB2    mov         esi,edx
 004EDFB4    mov         ebx,eax
 004EDFB6    mov         edx,esi
 004EDFB8    mov         eax,ebx
 004EDFBA    call        TWinControl.CMControlListChange
 004EDFBF    cmp         dword ptr [esi+8],0
>004EDFC3    jne         004EDFFB
 004EDFC5    mov         eax,dword ptr [esi+4]
 004EDFC8    push        eax
 004EDFC9    xor         ecx,ecx
 004EDFCB    mov         edx,0B039
 004EDFD0    mov         eax,ebx
 004EDFD2    call        TControl.Perform
 004EDFD7    mov         edi,dword ptr [esi+4]
 004EDFDA    cmp         ebx,dword ptr [edi+90]
>004EDFE0    jne         004EDFFB
 004EDFE2    mov         edx,esp
 004EDFE4    mov         eax,edi
 004EDFE6    call        TControl.GetBoundsRect
 004EDFEB    mov         ecx,esp
 004EDFED    mov         eax,edi
 004EDFEF    or          edx,0FFFFFFFF
 004EDFF2    mov         si,0FFCC
 004EDFF6    call        @CallDynaInst
 004EDFFB    add         esp,10
 004EDFFE    pop         edi
 004EDFFF    pop         esi
 004EE000    pop         ebx
 004EE001    ret
*}
end;

//004EE004
procedure TCustomDockForm.CMDockNotification(var Message:TCMDockNotification);
begin
{*
 004EE004    push        ebp
 004EE005    mov         ebp,esp
 004EE007    add         esp,0FFFFFFF8
 004EE00A    push        ebx
 004EE00B    push        esi
 004EE00C    xor         ecx,ecx
 004EE00E    mov         dword ptr [ebp-4],ecx
 004EE011    mov         ebx,edx
 004EE013    mov         dword ptr [ebp-8],eax
 004EE016    xor         eax,eax
 004EE018    push        ebp
 004EE019    push        4EE0F4
 004EE01E    push        dword ptr fs:[eax]
 004EE021    mov         dword ptr fs:[eax],esp
 004EE024    mov         edx,ebx
 004EE026    mov         eax,dword ptr [ebp-8]
 004EE029    mov         ecx,dword ptr [eax]
 004EE02B    call        dword ptr [ecx-10]
 004EE02E    mov         eax,dword ptr [ebx+8]
 004EE031    mov         eax,dword ptr [eax]
 004EE033    sub         eax,0C
>004EE036    je          004EE057
 004EE038    sub         eax,0AFFF
>004EE03D    jne         004EE0DE
 004EE043    mov         eax,dword ptr [ebx+4]
 004EE046    movzx       edx,byte ptr [eax+59]
 004EE04A    mov         eax,dword ptr [ebp-8]
 004EE04D    call        TCustomForm.SetVisible
>004EE052    jmp         004EE0DE
 004EE057    mov         eax,dword ptr [ebx+4]
 004EE05A    call        TControl.GetTextLen
 004EE05F    mov         ecx,eax
 004EE061    inc         ecx
 004EE062    lea         eax,[ebp-4]
 004EE065    xor         edx,edx
 004EE067    call        @UStrFromPWCharLen
 004EE06C    mov         esi,dword ptr [ebp-4]
 004EE06F    test        esi,esi
>004EE071    je          004EE078
 004EE073    sub         esi,4
 004EE076    mov         esi,dword ptr [esi]
 004EE078    mov         eax,dword ptr [ebp-4]
 004EE07B    call        @UStrToPWChar
 004EE080    mov         edx,eax
 004EE082    mov         eax,dword ptr [ebx+4]
 004EE085    mov         ecx,esi
 004EE087    call        TControl.GetTextBuf
 004EE08C    mov         eax,dword ptr [ebp-4]
 004EE08F    test        eax,eax
>004EE091    je          004EE098
 004EE093    sub         eax,4
 004EE096    mov         eax,dword ptr [eax]
 004EE098    test        eax,eax
>004EE09A    jle         004EE0D3
 004EE09C    mov         ebx,1
 004EE0A1    mov         esi,4EE104
 004EE0A6    mov         edx,dword ptr [ebp-4]
 004EE0A9    movzx       edx,word ptr [edx+ebx*2-2]
 004EE0AE    cmp         dx,0FF
>004EE0B3    ja          004EE0BB
 004EE0B5    movzx       edx,dx
 004EE0B8    bt          dword ptr [esi],edx
 004EE0BB    setb        dl
 004EE0BE    test        dl,dl
>004EE0C0    je          004EE0CF
 004EE0C2    mov         edx,ebx
 004EE0C4    dec         edx
 004EE0C5    lea         eax,[ebp-4]
 004EE0C8    call        @UStrSetLength
>004EE0CD    jmp         004EE0D3
 004EE0CF    inc         ebx
 004EE0D0    dec         eax
>004EE0D1    jne         004EE0A1
 004EE0D3    mov         edx,dword ptr [ebp-4]
 004EE0D6    mov         eax,dword ptr [ebp-8]
 004EE0D9    call        TControl.SetText
 004EE0DE    xor         eax,eax
 004EE0E0    pop         edx
 004EE0E1    pop         ecx
 004EE0E2    pop         ecx
 004EE0E3    mov         dword ptr fs:[eax],edx
 004EE0E6    push        4EE0FB
 004EE0EB    lea         eax,[ebp-4]
 004EE0EE    call        @UStrClr
 004EE0F3    ret
>004EE0F4    jmp         @HandleFinally
>004EE0F9    jmp         004EE0EB
 004EE0FB    pop         esi
 004EE0FC    pop         ebx
 004EE0FD    pop         ecx
 004EE0FE    pop         ecx
 004EE0FF    pop         ebp
 004EE100    ret
*}
end;

//004EE124
procedure TCustomDockForm.CMUnDockClient(var Message:TCMUnDockClient);
begin
{*
 004EE124    push        ebx
 004EE125    mov         ebx,edx
 004EE127    mov         edx,ebx
 004EE129    call        TWinControl.CMUnDockClient
 004EE12E    mov         eax,dword ptr [ebx+8]
 004EE131    xor         edx,edx
 004EE133    call        TControl.SetAlign
 004EE138    pop         ebx
 004EE139    ret
*}
end;

//004EE13C
procedure TCustomDockForm.CMVisibleChanged(var Message:TMessage);
begin
{*
 004EE13C    push        ebx
 004EE13D    push        esi
 004EE13E    push        edi
 004EE13F    mov         ebx,eax
 004EE141    mov         eax,ebx
 004EE143    call        TWinControl.CMVisibleChanged
 004EE148    test        byte ptr [ebx+1C],8
>004EE14C    jne         004EE175
 004EE14E    mov         eax,ebx
 004EE150    call        TWinControl.GetDockClientCount
 004EE155    mov         esi,eax
 004EE157    dec         esi
 004EE158    test        esi,esi
>004EE15A    jl          004EE175
 004EE15C    inc         esi
 004EE15D    xor         edi,edi
 004EE15F    mov         edx,edi
 004EE161    mov         eax,ebx
 004EE163    call        TWinControl.GetDockClients
 004EE168    movzx       edx,byte ptr [ebx+59]
 004EE16C    call        TControl.SetVisible
 004EE171    inc         edi
 004EE172    dec         esi
>004EE173    jne         004EE15F
 004EE175    pop         edi
 004EE176    pop         esi
 004EE177    pop         ebx
 004EE178    ret
*}
end;

//004EE17C
function TMonitor.GetLeft:Integer;
begin
{*
 004EE17C    push        ebx
 004EE17D    add         esp,0FFFFFFF0
 004EE180    mov         ebx,eax
 004EE182    mov         edx,esp
 004EE184    mov         eax,ebx
 004EE186    call        TMonitor.GetBoundsRect
 004EE18B    mov         eax,dword ptr [esp]
 004EE18E    add         esp,10
 004EE191    pop         ebx
 004EE192    ret
*}
end;

//004EE194
function TMonitor.GetHeight:Integer;
begin
{*
 004EE194    push        ebx
 004EE195    add         esp,0FFFFFFF0
 004EE198    mov         ebx,eax
 004EE19A    mov         edx,esp
 004EE19C    mov         eax,ebx
 004EE19E    call        TMonitor.GetBoundsRect
 004EE1A3    mov         eax,dword ptr [esp+0C]
 004EE1A7    sub         eax,dword ptr [esp+4]
 004EE1AB    add         esp,10
 004EE1AE    pop         ebx
 004EE1AF    ret
*}
end;

//004EE1B0
function TMonitor.GetTop:Integer;
begin
{*
 004EE1B0    push        ebx
 004EE1B1    add         esp,0FFFFFFF0
 004EE1B4    mov         ebx,eax
 004EE1B6    mov         edx,esp
 004EE1B8    mov         eax,ebx
 004EE1BA    call        TMonitor.GetBoundsRect
 004EE1BF    mov         eax,dword ptr [esp+4]
 004EE1C3    add         esp,10
 004EE1C6    pop         ebx
 004EE1C7    ret
*}
end;

//004EE1C8
function TMonitor.GetWidth:Integer;
begin
{*
 004EE1C8    push        ebx
 004EE1C9    add         esp,0FFFFFFF0
 004EE1CC    mov         ebx,eax
 004EE1CE    mov         edx,esp
 004EE1D0    mov         eax,ebx
 004EE1D2    call        TMonitor.GetBoundsRect
 004EE1D7    mov         eax,dword ptr [esp+8]
 004EE1DB    sub         eax,dword ptr [esp]
 004EE1DE    add         esp,10
 004EE1E1    pop         ebx
 004EE1E2    ret
*}
end;

//004EE1E4
function TMonitor.GetBoundsRect:TRect;
begin
{*
 004EE1E4    push        ebx
 004EE1E5    push        esi
 004EE1E6    push        edi
 004EE1E7    add         esp,0FFFFFFD8
 004EE1EA    mov         ebx,edx
 004EE1EC    mov         dword ptr [esp],28
 004EE1F3    push        esp
 004EE1F4    mov         eax,dword ptr [eax+4]
 004EE1F7    push        eax
 004EE1F8    call        user32.GetMonitorInfoW
 004EE1FD    mov         edi,ebx
 004EE1FF    lea         esi,[esp+4]
 004EE203    movs        dword ptr [edi],dword ptr [esi]
 004EE204    movs        dword ptr [edi],dword ptr [esi]
 004EE205    movs        dword ptr [edi],dword ptr [esi]
 004EE206    movs        dword ptr [edi],dword ptr [esi]
 004EE207    add         esp,28
 004EE20A    pop         edi
 004EE20B    pop         esi
 004EE20C    pop         ebx
 004EE20D    ret
*}
end;

//004EE210
function TMonitor.GetWorkareaRect:TRect;
begin
{*
 004EE210    push        ebx
 004EE211    push        esi
 004EE212    push        edi
 004EE213    add         esp,0FFFFFFD8
 004EE216    mov         ebx,edx
 004EE218    mov         dword ptr [esp],28
 004EE21F    push        esp
 004EE220    mov         eax,dword ptr [eax+4]
 004EE223    push        eax
 004EE224    call        user32.GetMonitorInfoW
 004EE229    mov         edi,ebx
 004EE22B    lea         esi,[esp+14]
 004EE22F    movs        dword ptr [edi],dword ptr [esi]
 004EE230    movs        dword ptr [edi],dword ptr [esi]
 004EE231    movs        dword ptr [edi],dword ptr [esi]
 004EE232    movs        dword ptr [edi],dword ptr [esi]
 004EE233    add         esp,28
 004EE236    pop         edi
 004EE237    pop         esi
 004EE238    pop         ebx
 004EE239    ret
*}
end;

//004EE23C
function TMonitor.GetPrimary:Boolean;
begin
{*
 004EE23C    add         esp,0FFFFFFD8
 004EE23F    mov         dword ptr [esp],28
 004EE246    push        esp
 004EE247    mov         eax,dword ptr [eax+4]
 004EE24A    push        eax
 004EE24B    call        user32.GetMonitorInfoW
 004EE250    test        byte ptr [esp+24],1
 004EE255    setne       al
 004EE258    add         esp,28
 004EE25B    ret
*}
end;

//004EE25C
function EnumFontsProc(var LogFont:TLogFont; var TextMetric:TTextMetric; FontType:Integer; Data:Pointer):Integer; stdcall;
begin
{*
 004EE25C    push        ebp
 004EE25D    mov         ebp,esp
 004EE25F    push        0
 004EE261    push        0
 004EE263    push        ebx
 004EE264    push        esi
 004EE265    xor         eax,eax
 004EE267    push        ebp
 004EE268    push        4EE2E1
 004EE26D    push        dword ptr fs:[eax]
 004EE270    mov         dword ptr fs:[eax],esp
 004EE273    mov         ebx,dword ptr [ebp+14]
 004EE276    lea         eax,[ebp-4]
 004EE279    mov         edx,dword ptr [ebp+8]
 004EE27C    add         edx,1C
 004EE27F    mov         ecx,20
 004EE284    call        @UStrFromWArray
 004EE289    mov         eax,ebx
 004EE28B    mov         edx,dword ptr [eax]
 004EE28D    call        dword ptr [edx+14]
 004EE290    test        eax,eax
>004EE292    je          004EE2B7
 004EE294    mov         eax,ebx
 004EE296    mov         edx,dword ptr [eax]
 004EE298    call        dword ptr [edx+14]
 004EE29B    mov         edx,eax
 004EE29D    dec         edx
 004EE29E    lea         ecx,[ebp-8]
 004EE2A1    mov         eax,ebx
 004EE2A3    mov         esi,dword ptr [eax]
 004EE2A5    call        dword ptr [esi+0C]
 004EE2A8    mov         eax,dword ptr [ebp-8]
 004EE2AB    mov         edx,dword ptr [ebp-4]
 004EE2AE    call        AnsiCompareText
 004EE2B3    test        eax,eax
>004EE2B5    je          004EE2C1
 004EE2B7    mov         edx,dword ptr [ebp-4]
 004EE2BA    mov         eax,ebx
 004EE2BC    mov         ecx,dword ptr [eax]
 004EE2BE    call        dword ptr [ecx+38]
 004EE2C1    mov         ebx,1
 004EE2C6    xor         eax,eax
 004EE2C8    pop         edx
 004EE2C9    pop         ecx
 004EE2CA    pop         ecx
 004EE2CB    mov         dword ptr fs:[eax],edx
 004EE2CE    push        4EE2E8
 004EE2D3    lea         eax,[ebp-8]
 004EE2D6    mov         edx,2
 004EE2DB    call        @UStrArrayClr
 004EE2E0    ret
>004EE2E1    jmp         @HandleFinally
>004EE2E6    jmp         004EE2D3
 004EE2E8    mov         eax,ebx
 004EE2EA    pop         esi
 004EE2EB    pop         ebx
 004EE2EC    pop         ecx
 004EE2ED    pop         ecx
 004EE2EE    pop         ebp
 004EE2EF    ret         10
*}
end;

//004EE2F4
constructor TScreen.Create;
begin
{*
 004EE2F4    push        ebp
 004EE2F5    mov         ebp,esp
 004EE2F7    push        ecx
 004EE2F8    push        ebx
 004EE2F9    push        esi
 004EE2FA    test        dl,dl
>004EE2FC    je          004EE306
 004EE2FE    add         esp,0FFFFFFF0
 004EE301    call        @ClassCreate
 004EE306    mov         byte ptr [ebp-1],dl
 004EE309    mov         ebx,eax
 004EE30B    xor         edx,edx
 004EE30D    mov         eax,ebx
 004EE30F    call        TComponent.Create
 004EE314    mov         eax,[0078CF18]
 004EE319    mov         dword ptr [eax+4],ebx
 004EE31C    mov         dword ptr [eax],4EE730;TScreen.AddDataModule
 004EE322    mov         eax,[0078CF3C]
 004EE327    mov         dword ptr [eax+4],ebx
 004EE32A    mov         dword ptr [eax],4EE73C;TScreen.RemoveDataModule
 004EE330    mov         eax,ebx
 004EE332    call        TScreen.CreateCursors
 004EE337    push        0
 004EE339    call        user32.GetKeyboardLayout
 004EE33E    mov         dword ptr [ebx+40],eax
 004EE341    mov         dl,1
 004EE343    mov         eax,[00439644];TList
 004EE348    call        TObject.Create
 004EE34D    mov         dword ptr [ebx+50],eax
 004EE350    mov         dl,1
 004EE352    mov         eax,[00439644];TList
 004EE357    call        TObject.Create
 004EE35C    mov         dword ptr [ebx+54],eax
 004EE35F    mov         dl,1
 004EE361    mov         eax,[00439644];TList
 004EE366    call        TObject.Create
 004EE36B    mov         dword ptr [ebx+58],eax
 004EE36E    mov         dl,1
 004EE370    mov         eax,[00439644];TList
 004EE375    call        TObject.Create
 004EE37A    mov         dword ptr [ebx+5C],eax
 004EE37D    mov         dl,1
 004EE37F    mov         eax,[00439644];TList
 004EE384    call        TObject.Create
 004EE389    mov         dword ptr [ebx+78],eax
 004EE38C    push        0
 004EE38E    call        user32.GetDC
 004EE393    mov         esi,eax
 004EE395    push        5A
 004EE397    push        esi
 004EE398    call        gdi32.GetDeviceCaps
 004EE39D    mov         dword ptr [ebx+44],eax
 004EE3A0    push        esi
 004EE3A1    push        0
 004EE3A3    call        user32.ReleaseDC
 004EE3A8    mov         eax,dword ptr [ebx+5C]
 004EE3AB    push        eax
 004EE3AC    mov         eax,4E916C;EnumMonitorsProc:Boolean
 004EE3B1    push        eax
 004EE3B2    push        0
 004EE3B4    push        0
 004EE3B6    call        user32.EnumDisplayMonitors
 004EE3BB    mov         dl,1
 004EE3BD    mov         eax,[0045FAE8];TFont
 004EE3C2    call        TFont.Create
 004EE3C7    mov         dword ptr [ebx+80],eax
 004EE3CD    mov         dl,1
 004EE3CF    mov         eax,[0045FAE8];TFont
 004EE3D4    call        TFont.Create
 004EE3D9    mov         dword ptr [ebx+84],eax
 004EE3DF    mov         dl,1
 004EE3E1    mov         eax,[0045FAE8];TFont
 004EE3E6    call        TFont.Create
 004EE3EB    mov         dword ptr [ebx+7C],eax
 004EE3EE    mov         dl,1
 004EE3F0    mov         eax,[0045FAE8];TFont
 004EE3F5    call        TFont.Create
 004EE3FA    mov         dword ptr [ebx+88],eax
 004EE400    mov         dl,1
 004EE402    mov         eax,[0045FAE8];TFont
 004EE407    call        TFont.Create
 004EE40C    mov         dword ptr [ebx+8C],eax
 004EE412    mov         eax,ebx
 004EE414    call        TScreen.GetMetricSettings
 004EE419    mov         eax,dword ptr [ebx+80]
 004EE41F    mov         dword ptr [eax+0C],ebx
 004EE422    mov         dword ptr [eax+8],4EEB5C;TScreen.IconFontChanged
 004EE429    mov         eax,dword ptr [ebx+84]
 004EE42F    mov         dword ptr [eax+0C],ebx
 004EE432    mov         dword ptr [eax+8],4EEB5C;TScreen.IconFontChanged
 004EE439    mov         eax,dword ptr [ebx+7C]
 004EE43C    mov         dword ptr [eax+0C],ebx
 004EE43F    mov         dword ptr [eax+8],4EEB5C;TScreen.IconFontChanged
 004EE446    mov         eax,dword ptr [ebx+88]
 004EE44C    mov         dword ptr [eax+0C],ebx
 004EE44F    mov         dword ptr [eax+8],4EEB5C;TScreen.IconFontChanged
 004EE456    mov         eax,dword ptr [ebx+8C]
 004EE45C    mov         dword ptr [eax+0C],ebx
 004EE45F    mov         dword ptr [eax+8],4EEB5C;TScreen.IconFontChanged
 004EE466    mov         eax,ebx
 004EE468    cmp         byte ptr [ebp-1],0
>004EE46C    je          004EE47D
 004EE46E    call        @AfterConstruction
 004EE473    pop         dword ptr fs:[0]
 004EE47A    add         esp,0C
 004EE47D    mov         eax,ebx
 004EE47F    pop         esi
 004EE480    pop         ebx
 004EE481    pop         ecx
 004EE482    pop         ebp
 004EE483    ret
*}
end;

//004EE484
destructor TScreen.Destroy();
begin
{*
 004EE484    push        ebx
 004EE485    push        esi
 004EE486    push        edi
 004EE487    push        ebp
 004EE488    call        @BeforeDestruction
 004EE48D    mov         ebx,edx
 004EE48F    mov         ebp,eax
 004EE491    lea         eax,[ebp+88]
 004EE497    mov         edx,dword ptr [eax]
 004EE499    xor         ecx,ecx
 004EE49B    mov         dword ptr [eax],ecx
 004EE49D    mov         eax,edx
 004EE49F    call        TObject.Free
 004EE4A4    lea         eax,[ebp+7C]
 004EE4A7    mov         edx,dword ptr [eax]
 004EE4A9    xor         ecx,ecx
 004EE4AB    mov         dword ptr [eax],ecx
 004EE4AD    mov         eax,edx
 004EE4AF    call        TObject.Free
 004EE4B4    lea         eax,[ebp+84]
 004EE4BA    mov         edx,dword ptr [eax]
 004EE4BC    xor         ecx,ecx
 004EE4BE    mov         dword ptr [eax],ecx
 004EE4C0    mov         eax,edx
 004EE4C2    call        TObject.Free
 004EE4C7    lea         eax,[ebp+80]
 004EE4CD    mov         edx,dword ptr [eax]
 004EE4CF    xor         ecx,ecx
 004EE4D1    mov         dword ptr [eax],ecx
 004EE4D3    mov         eax,edx
 004EE4D5    call        TObject.Free
 004EE4DA    lea         eax,[ebp+8C]
 004EE4E0    mov         edx,dword ptr [eax]
 004EE4E2    xor         ecx,ecx
 004EE4E4    mov         dword ptr [eax],ecx
 004EE4E6    mov         eax,edx
 004EE4E8    call        TObject.Free
 004EE4ED    lea         eax,[ebp+58]
 004EE4F0    mov         edx,dword ptr [eax]
 004EE4F2    xor         ecx,ecx
 004EE4F4    mov         dword ptr [eax],ecx
 004EE4F6    mov         eax,edx
 004EE4F8    call        TObject.Free
 004EE4FD    lea         eax,[ebp+54]
 004EE500    mov         edx,dword ptr [eax]
 004EE502    xor         ecx,ecx
 004EE504    mov         dword ptr [eax],ecx
 004EE506    mov         eax,edx
 004EE508    call        TObject.Free
 004EE50D    lea         eax,[ebp+50]
 004EE510    mov         edx,dword ptr [eax]
 004EE512    xor         ecx,ecx
 004EE514    mov         dword ptr [eax],ecx
 004EE516    mov         eax,edx
 004EE518    call        TObject.Free
 004EE51D    lea         eax,[ebp+34]
 004EE520    mov         edx,dword ptr [eax]
 004EE522    xor         ecx,ecx
 004EE524    mov         dword ptr [eax],ecx
 004EE526    mov         eax,edx
 004EE528    call        TObject.Free
 004EE52D    lea         eax,[ebp+38]
 004EE530    mov         edx,dword ptr [eax]
 004EE532    xor         ecx,ecx
 004EE534    mov         dword ptr [eax],ecx
 004EE536    mov         eax,edx
 004EE538    call        TObject.Free
 004EE53D    lea         eax,[ebp+78]
 004EE540    mov         edx,dword ptr [eax]
 004EE542    xor         ecx,ecx
 004EE544    mov         dword ptr [eax],ecx
 004EE546    mov         eax,edx
 004EE548    call        TObject.Free
 004EE54D    mov         eax,dword ptr [ebp+5C]
 004EE550    test        eax,eax
>004EE552    je          004EE572
 004EE554    mov         esi,dword ptr [eax+8]
 004EE557    dec         esi
 004EE558    test        esi,esi
>004EE55A    jl          004EE572
 004EE55C    inc         esi
 004EE55D    xor         edi,edi
 004EE55F    mov         eax,dword ptr [ebp+5C]
 004EE562    mov         edx,edi
 004EE564    call        TList.Get
 004EE569    call        TObject.Free
 004EE56E    inc         edi
 004EE56F    dec         esi
>004EE570    jne         004EE55F
 004EE572    lea         eax,[ebp+5C]
 004EE575    mov         edx,dword ptr [eax]
 004EE577    xor         ecx,ecx
 004EE579    mov         dword ptr [eax],ecx
 004EE57B    mov         eax,edx
 004EE57D    call        TObject.Free
 004EE582    mov         eax,ebp
 004EE584    call        TScreen.DestroyCursors
 004EE589    mov         eax,[0078CF18]
 004EE58E    xor         edx,edx
 004EE590    mov         dword ptr [eax],edx
 004EE592    mov         dword ptr [eax+4],edx
 004EE595    mov         eax,[0078CF3C]
 004EE59A    xor         edx,edx
 004EE59C    mov         dword ptr [eax],edx
 004EE59E    mov         dword ptr [eax+4],edx
 004EE5A1    mov         edx,ebx
 004EE5A3    and         dl,0FC
 004EE5A6    mov         eax,ebp
 004EE5A8    call        TComponent.Destroy
 004EE5AD    test        bl,bl
>004EE5AF    jle         004EE5B8
 004EE5B1    mov         eax,ebp
 004EE5B3    call        @ClassDestroy
 004EE5B8    pop         ebp
 004EE5B9    pop         edi
 004EE5BA    pop         esi
 004EE5BB    pop         ebx
 004EE5BC    ret
*}
end;

//004EE5C0
function TScreen.GetHeight:Integer;
begin
{*
 004EE5C0    push        1
 004EE5C2    call        user32.GetSystemMetrics
 004EE5C7    ret
*}
end;

//004EE5C8
function TScreen.GetWidth:Integer;
begin
{*
 004EE5C8    push        0
 004EE5CA    call        user32.GetSystemMetrics
 004EE5CF    ret
*}
end;

//004EE5D0
function TScreen.GetDesktopTop:Integer;
begin
{*
 004EE5D0    push        4D
 004EE5D2    call        user32.GetSystemMetrics
 004EE5D7    ret
*}
end;

//004EE5D8
function TScreen.GetDesktopLeft:Integer;
begin
{*
 004EE5D8    push        4C
 004EE5DA    call        user32.GetSystemMetrics
 004EE5DF    ret
*}
end;

//004EE5E0
function TScreen.GetDesktopHeight:Integer;
begin
{*
 004EE5E0    push        4F
 004EE5E2    call        user32.GetSystemMetrics
 004EE5E7    ret
*}
end;

//004EE5E8
function TScreen.GetDesktopWidth:Integer;
begin
{*
 004EE5E8    push        4E
 004EE5EA    call        user32.GetSystemMetrics
 004EE5EF    ret
*}
end;

//004EE5F0
function TScreen.GetMonitor(Index:Integer):TMonitor;
begin
{*
 004EE5F0    push        ebx
 004EE5F1    push        esi
 004EE5F2    mov         esi,edx
 004EE5F4    mov         ebx,eax
 004EE5F6    mov         edx,esi
 004EE5F8    mov         eax,dword ptr [ebx+5C]
 004EE5FB    call        TList.Get
 004EE600    pop         esi
 004EE601    pop         ebx
 004EE602    ret
*}
end;

//004EE604
function TScreen.GetMonitorCount:Integer;
begin
{*
 004EE604    mov         edx,dword ptr [eax+5C]
 004EE607    mov         edx,dword ptr [edx+8]
 004EE60A    test        edx,edx
>004EE60C    jne         004EE616
 004EE60E    push        50
 004EE610    call        user32.GetSystemMetrics
 004EE615    ret
 004EE616    mov         eax,edx
 004EE618    ret
*}
end;

//004EE61C
function TScreen.GetForm(Index:Integer):TForm;
begin
{*
 004EE61C    push        ebx
 004EE61D    push        esi
 004EE61E    mov         esi,edx
 004EE620    mov         ebx,eax
 004EE622    mov         edx,esi
 004EE624    mov         eax,dword ptr [ebx+50]
 004EE627    call        TList.Get
 004EE62C    pop         esi
 004EE62D    pop         ebx
 004EE62E    ret
*}
end;

//004EE630
function TScreen.GetFormCount:Integer;
begin
{*
 004EE630    mov         eax,dword ptr [eax+50]
 004EE633    mov         eax,dword ptr [eax+8]
 004EE636    ret
*}
end;

//004EE638
function TScreen.GetCustomForms(Index:Integer):TCustomForm;
begin
{*
 004EE638    push        ebx
 004EE639    push        esi
 004EE63A    mov         esi,edx
 004EE63C    mov         ebx,eax
 004EE63E    mov         edx,esi
 004EE640    mov         eax,dword ptr [ebx+54]
 004EE643    call        TList.Get
 004EE648    pop         esi
 004EE649    pop         ebx
 004EE64A    ret
*}
end;

//004EE64C
function TScreen.GetCustomFormCount:Integer;
begin
{*
 004EE64C    mov         eax,dword ptr [eax+54]
 004EE64F    mov         eax,dword ptr [eax+8]
 004EE652    ret
*}
end;

//004EE654
procedure TScreen.UpdateLastActive;
begin
{*
 004EE654    push        ebx
 004EE655    mov         ebx,eax
 004EE657    mov         eax,dword ptr [ebx+64]
 004EE65A    cmp         eax,dword ptr [ebx+70]
>004EE65D    je          004EE67A
 004EE65F    mov         dword ptr [ebx+70],eax
 004EE662    cmp         word ptr [ebx+0A2],0
>004EE66A    je          004EE67A
 004EE66C    mov         edx,ebx
 004EE66E    mov         eax,dword ptr [ebx+0A4]
 004EE674    call        dword ptr [ebx+0A0]
 004EE67A    mov         eax,dword ptr [ebx+60]
 004EE67D    cmp         eax,dword ptr [ebx+6C]
>004EE680    je          004EE69D
 004EE682    mov         dword ptr [ebx+6C],eax
 004EE685    cmp         word ptr [ebx+9A],0
>004EE68D    je          004EE69D
 004EE68F    mov         edx,ebx
 004EE691    mov         eax,dword ptr [ebx+9C]
 004EE697    call        dword ptr [ebx+98]
 004EE69D    pop         ebx
 004EE69E    ret
*}
end;

//004EE6A0
procedure TScreen.AddForm(AForm:TCustomForm);
begin
{*
 004EE6A0    push        ebx
 004EE6A1    push        esi
 004EE6A2    mov         esi,edx
 004EE6A4    mov         ebx,eax
 004EE6A6    mov         edx,esi
 004EE6A8    mov         eax,dword ptr [ebx+54]
 004EE6AB    call        TList.Add
 004EE6B0    mov         eax,esi
 004EE6B2    mov         edx,dword ptr ds:[4E0C38];TForm
 004EE6B8    call        @IsClass
 004EE6BD    test        al,al
>004EE6BF    je          004EE6D5
 004EE6C1    mov         edx,esi
 004EE6C3    mov         eax,dword ptr [ebx+50]
 004EE6C6    call        TList.Add
 004EE6CB    mov         eax,[007932EC];Application:TApplication
 004EE6D0    call        TApplication.UpdateVisible
 004EE6D5    pop         esi
 004EE6D6    pop         ebx
 004EE6D7    ret
*}
end;

//004EE6D8
procedure TScreen.RemoveForm(AForm:TCustomForm);
begin
{*
 004EE6D8    push        ebx
 004EE6D9    push        esi
 004EE6DA    push        edi
 004EE6DB    mov         esi,edx
 004EE6DD    mov         ebx,eax
 004EE6DF    mov         edi,esi
 004EE6E1    mov         edx,edi
 004EE6E3    xor         ecx,ecx
 004EE6E5    mov         eax,dword ptr [ebx+54]
 004EE6E8    call        TList.RemoveItem
 004EE6ED    mov         edx,edi
 004EE6EF    xor         ecx,ecx
 004EE6F1    mov         eax,dword ptr [ebx+50]
 004EE6F4    call        TList.RemoveItem
 004EE6F9    mov         eax,[007932EC];Application:TApplication
 004EE6FE    call        TApplication.UpdateVisible
 004EE703    mov         eax,dword ptr [ebx+54]
 004EE706    cmp         dword ptr [eax+8],0
>004EE70A    jne         004EE72A
 004EE70C    mov         eax,[007932EC];Application:TApplication
 004EE711    cmp         dword ptr [eax+84],0
>004EE718    je          004EE72A
 004EE71A    mov         eax,[007932EC];Application:TApplication
 004EE71F    mov         eax,dword ptr [eax+84]
 004EE725    call        THintWindow.ReleaseHandle
 004EE72A    pop         edi
 004EE72B    pop         esi
 004EE72C    pop         ebx
 004EE72D    ret
*}
end;

//004EE730
procedure TScreen.AddDataModule(DataModule:TDataModule);
begin
{*
 004EE730    mov         eax,dword ptr [eax+58]
 004EE733    call        TList.Add
 004EE738    ret
*}
end;

//004EE73C
procedure TScreen.RemoveDataModule(DataModule:TDataModule);
begin
{*
 004EE73C    xor         ecx,ecx
 004EE73E    mov         eax,dword ptr [eax+58]
 004EE741    call        TList.RemoveItem
 004EE746    ret
*}
end;

//004EE748
procedure TScreen.CreateCursors;
begin
{*
 004EE748    push        ebx
 004EE749    push        esi
 004EE74A    push        edi
 004EE74B    push        ebp
 004EE74C    mov         ebp,eax
 004EE74E    push        7F00
 004EE753    push        0
 004EE755    call        user32.LoadCursorW
 004EE75A    mov         dword ptr [ebp+0AC],eax
 004EE760    mov         ebx,0FFFFFFEA
 004EE765    mov         esi,786798
 004EE76A    cmp         ebx,0FFFFFFEF
>004EE76D    jl          004EE77C
 004EE76F    cmp         ebx,0FFFFFFF4
>004EE772    jg          004EE77C
 004EE774    mov         edi,dword ptr ds:[790C38];gvar_00790C38
>004EE77A    jmp         004EE77E
 004EE77C    xor         edi,edi
 004EE77E    mov         eax,dword ptr [esi]
 004EE780    push        eax
 004EE781    push        edi
 004EE782    call        user32.LoadCursorW
 004EE787    mov         ecx,eax
 004EE789    mov         edx,ebx
 004EE78B    mov         eax,ebp
 004EE78D    call        TScreen.InsertCursor
 004EE792    inc         ebx
 004EE793    add         esi,4
 004EE796    cmp         ebx,0FFFFFFFF
>004EE799    jne         004EE76A
 004EE79B    pop         ebp
 004EE79C    pop         edi
 004EE79D    pop         esi
 004EE79E    pop         ebx
 004EE79F    ret
*}
end;

//004EE7A0
procedure TScreen.DestroyCursors;
begin
{*
 004EE7A0    push        ebx
 004EE7A1    push        esi
 004EE7A2    push        edi
 004EE7A3    push        ebp
 004EE7A4    mov         ebp,eax
 004EE7A6    mov         ebx,dword ptr [ebp+0A8]
 004EE7AC    test        ebx,ebx
>004EE7AE    je          004EE7E3
 004EE7B0    mov         esi,dword ptr [ebx+4]
 004EE7B3    cmp         esi,0FFFFFFEF
>004EE7B6    jl          004EE7BD
 004EE7B8    cmp         esi,0FFFFFFF4
>004EE7BB    jle         004EE7C6
 004EE7BD    cmp         esi,0FFFFFFEB
>004EE7C0    je          004EE7C6
 004EE7C2    test        esi,esi
>004EE7C4    jle         004EE7CF
 004EE7C6    mov         eax,dword ptr [ebx+8]
 004EE7C9    push        eax
 004EE7CA    call        user32.DestroyCursor
 004EE7CF    mov         edi,dword ptr [ebx]
 004EE7D1    mov         edx,0C
 004EE7D6    mov         eax,ebx
 004EE7D8    call        @FreeMem
 004EE7DD    mov         ebx,edi
 004EE7DF    test        ebx,ebx
>004EE7E1    jne         004EE7B0
 004EE7E3    push        7F00
 004EE7E8    push        0
 004EE7EA    call        user32.LoadCursorW
 004EE7EF    mov         edx,dword ptr [ebp+0AC]
 004EE7F5    cmp         eax,edx
>004EE7F7    je          004EE7FF
 004EE7F9    push        edx
 004EE7FA    call        user32.DestroyCursor
 004EE7FF    pop         ebp
 004EE800    pop         edi
 004EE801    pop         esi
 004EE802    pop         ebx
 004EE803    ret
*}
end;

//004EE804
procedure TScreen.DeleteCursor(Index:Integer);
begin
{*
 004EE804    push        ebx
 004EE805    push        esi
 004EE806    push        edi
 004EE807    mov         edi,eax
 004EE809    mov         ebx,dword ptr [edi+0A8]
 004EE80F    xor         esi,esi
>004EE811    jmp         004EE817
 004EE813    mov         esi,ebx
 004EE815    mov         ebx,dword ptr [ebx]
 004EE817    test        ebx,ebx
>004EE819    je          004EE820
 004EE81B    cmp         edx,dword ptr [ebx+4]
>004EE81E    jne         004EE813
 004EE820    test        ebx,ebx
>004EE822    je          004EE84B
 004EE824    mov         eax,dword ptr [ebx+8]
 004EE827    push        eax
 004EE828    call        user32.DestroyCursor
 004EE82D    test        esi,esi
>004EE82F    jne         004EE83B
 004EE831    mov         eax,dword ptr [ebx]
 004EE833    mov         dword ptr [edi+0A8],eax
>004EE839    jmp         004EE83F
 004EE83B    mov         eax,dword ptr [ebx]
 004EE83D    mov         dword ptr [esi],eax
 004EE83F    mov         edx,0C
 004EE844    mov         eax,ebx
 004EE846    call        @FreeMem
 004EE84B    pop         edi
 004EE84C    pop         esi
 004EE84D    pop         ebx
 004EE84E    ret
*}
end;

//004EE850
function DoFindMonitor:TMonitor;
begin
{*
 004EE850    push        ebp
 004EE851    mov         ebp,esp
 004EE853    push        ebx
 004EE854    push        esi
 004EE855    push        edi
 004EE856    xor         edi,edi
 004EE858    mov         eax,dword ptr [ebp+8]
 004EE85B    mov         eax,dword ptr [eax-4]
 004EE85E    call        TScreen.GetMonitorCount
 004EE863    mov         esi,eax
 004EE865    dec         esi
 004EE866    test        esi,esi
>004EE868    jl          004EE89A
 004EE86A    inc         esi
 004EE86B    xor         ebx,ebx
 004EE86D    mov         eax,dword ptr [ebp+8]
 004EE870    mov         eax,dword ptr [eax-4]
 004EE873    mov         edx,ebx
 004EE875    call        TScreen.GetMonitor
 004EE87A    mov         eax,dword ptr [eax+4]
 004EE87D    mov         edx,dword ptr [ebp+8]
 004EE880    cmp         eax,dword ptr [edx-8]
>004EE883    jne         004EE896
 004EE885    mov         eax,dword ptr [ebp+8]
 004EE888    mov         eax,dword ptr [eax-4]
 004EE88B    mov         edx,ebx
 004EE88D    call        TScreen.GetMonitor
 004EE892    mov         edi,eax
>004EE894    jmp         004EE89A
 004EE896    inc         ebx
 004EE897    dec         esi
>004EE898    jne         004EE86D
 004EE89A    mov         eax,edi
 004EE89C    pop         edi
 004EE89D    pop         esi
 004EE89E    pop         ebx
 004EE89F    pop         ebp
 004EE8A0    ret
*}
end;

//004EE8A4
function TScreen.FindMonitor(Handle:HMONITOR):TMonitor;
begin
{*
 004EE8A4    push        ebp
 004EE8A5    mov         ebp,esp
 004EE8A7    add         esp,0FFFFFFF8
 004EE8AA    mov         dword ptr [ebp-8],edx
 004EE8AD    mov         dword ptr [ebp-4],eax
 004EE8B0    push        ebp
 004EE8B1    call        DoFindMonitor
 004EE8B6    pop         ecx
 004EE8B7    test        eax,eax
>004EE8B9    jne         004EE8CA
 004EE8BB    mov         eax,dword ptr [ebp-4]
 004EE8BE    call        TScreen.GetMonitors
 004EE8C3    push        ebp
 004EE8C4    call        DoFindMonitor
 004EE8C9    pop         ecx
 004EE8CA    pop         ecx
 004EE8CB    pop         ecx
 004EE8CC    pop         ebp
 004EE8CD    ret
*}
end;

//004EE8D0
procedure TScreen.InsertCursor(Index:Integer; Handle:HCURSOR);
begin
{*
 004EE8D0    push        ebx
 004EE8D1    push        esi
 004EE8D2    push        edi
 004EE8D3    mov         edi,ecx
 004EE8D5    mov         esi,edx
 004EE8D7    mov         ebx,eax
 004EE8D9    mov         eax,0C
 004EE8DE    call        @GetMem
 004EE8E3    mov         edx,dword ptr [ebx+0A8]
 004EE8E9    mov         dword ptr [eax],edx
 004EE8EB    mov         dword ptr [eax+4],esi
 004EE8EE    mov         dword ptr [eax+8],edi
 004EE8F1    mov         dword ptr [ebx+0A8],eax
 004EE8F7    pop         edi
 004EE8F8    pop         esi
 004EE8F9    pop         ebx
 004EE8FA    ret
*}
end;

//004EE8FC
function TScreen.GetImes:TStrings;
begin
{*
 004EE8FC    push        ebp
 004EE8FD    mov         ebp,esp
 004EE8FF    add         esp,0FFFFFC60
 004EE905    push        ebx
 004EE906    xor         edx,edx
 004EE908    mov         dword ptr [ebp-3A0],edx
 004EE90E    mov         dword ptr [ebp-4],eax
 004EE911    xor         eax,eax
 004EE913    push        ebp
 004EE914    push        4EEAA7
 004EE919    push        dword ptr fs:[eax]
 004EE91C    mov         dword ptr fs:[eax],esp
 004EE91F    mov         eax,dword ptr [ebp-4]
 004EE922    cmp         dword ptr [eax+38],0
>004EE926    jne         004EEA88
 004EE92C    mov         dl,1
 004EE92E    mov         eax,[0043C7BC];TStringList
 004EE933    call        TStringList.Create
 004EE938    mov         edx,dword ptr [ebp-4]
 004EE93B    mov         dword ptr [edx+38],eax
 004EE93E    mov         eax,dword ptr [ebp-4]
 004EE941    add         eax,3C
 004EE944    call        @UStrClr
 004EE949    lea         eax,[ebp-114]
 004EE94F    push        eax
 004EE950    push        40
 004EE952    call        user32.GetKeyboardLayoutList
 004EE957    dec         eax
 004EE958    test        eax,eax
>004EE95A    jl          004EEA77
 004EE960    inc         eax
 004EE961    mov         dword ptr [ebp-10],eax
 004EE964    lea         eax,[ebp-114]
 004EE96A    mov         dword ptr [ebp-14],eax
 004EE96D    mov         eax,dword ptr [ebp-14]
 004EE970    mov         eax,dword ptr [eax]
 004EE972    call        Imm32IsIME
 004EE977    test        al,al
>004EE979    je          004EEA6A
 004EE97F    lea         eax,[ebp-0C]
 004EE982    push        eax
 004EE983    push        20019
 004EE988    push        0
 004EE98A    push        0
 004EE98C    mov         eax,dword ptr [ebp-14]
 004EE98F    mov         eax,dword ptr [eax]
 004EE991    mov         dword ptr [ebp-39C],eax
 004EE997    mov         byte ptr [ebp-398],0
 004EE99E    lea         ecx,[ebp-39C]
 004EE9A4    mov         edx,4EEAB8
 004EE9A9    lea         eax,[ebp-394]
 004EE9AF    call        StrFmt
 004EE9B4    push        eax
 004EE9B5    push        80000002
 004EE9BA    call        advapi32.RegOpenKeyExW
 004EE9BF    test        eax,eax
>004EE9C1    jne         004EEA6A
 004EE9C7    xor         eax,eax
 004EE9C9    push        ebp
 004EE9CA    push        4EEA63
 004EE9CF    push        dword ptr fs:[eax]
 004EE9D2    mov         dword ptr fs:[eax],esp
 004EE9D5    mov         dword ptr [ebp-8],200
 004EE9DC    lea         eax,[ebp-8]
 004EE9DF    push        eax
 004EE9E0    lea         eax,[ebp-314]
 004EE9E6    push        eax
 004EE9E7    push        0
 004EE9E9    push        0
 004EE9EB    push        4EEB28
 004EE9F0    mov         eax,dword ptr [ebp-0C]
 004EE9F3    push        eax
 004EE9F4    call        advapi32.RegQueryValueExW
 004EE9F9    test        eax,eax
>004EE9FB    jne         004EEA4C
 004EE9FD    lea         eax,[ebp-3A0]
 004EEA03    lea         edx,[ebp-314]
 004EEA09    mov         ecx,100
 004EEA0E    call        @UStrFromWArray
 004EEA13    mov         edx,dword ptr [ebp-3A0]
 004EEA19    mov         eax,dword ptr [ebp-14]
 004EEA1C    mov         ecx,dword ptr [eax]
 004EEA1E    mov         eax,dword ptr [ebp-4]
 004EEA21    mov         eax,dword ptr [eax+38]
 004EEA24    mov         ebx,dword ptr [eax]
 004EEA26    call        dword ptr [ebx+3C]
 004EEA29    mov         eax,dword ptr [ebp-14]
 004EEA2C    mov         eax,dword ptr [eax]
 004EEA2E    mov         edx,dword ptr [ebp-4]
 004EEA31    cmp         eax,dword ptr [edx+40]
>004EEA34    jne         004EEA4C
 004EEA36    mov         eax,dword ptr [ebp-4]
 004EEA39    add         eax,3C
 004EEA3C    lea         edx,[ebp-314]
 004EEA42    mov         ecx,100
 004EEA47    call        @UStrFromWArray
 004EEA4C    xor         eax,eax
 004EEA4E    pop         edx
 004EEA4F    pop         ecx
 004EEA50    pop         ecx
 004EEA51    mov         dword ptr fs:[eax],edx
 004EEA54    push        4EEA6A
 004EEA59    mov         eax,dword ptr [ebp-0C]
 004EEA5C    push        eax
 004EEA5D    call        advapi32.RegCloseKey
 004EEA62    ret
>004EEA63    jmp         @HandleFinally
>004EEA68    jmp         004EEA59
 004EEA6A    add         dword ptr [ebp-14],4
 004EEA6E    dec         dword ptr [ebp-10]
>004EEA71    jne         004EE96D
 004EEA77    mov         eax,dword ptr [ebp-4]
 004EEA7A    mov         eax,dword ptr [eax+38]
 004EEA7D    mov         byte ptr [eax+39],0
 004EEA81    mov         dl,1
 004EEA83    call        TStringList.SetSorted
 004EEA88    mov         eax,dword ptr [ebp-4]
 004EEA8B    mov         ebx,dword ptr [eax+38]
 004EEA8E    xor         eax,eax
 004EEA90    pop         edx
 004EEA91    pop         ecx
 004EEA92    pop         ecx
 004EEA93    mov         dword ptr fs:[eax],edx
 004EEA96    push        4EEAAE
 004EEA9B    lea         eax,[ebp-3A0]
 004EEAA1    call        @UStrClr
 004EEAA6    ret
>004EEAA7    jmp         @HandleFinally
>004EEAAC    jmp         004EEA9B
 004EEAAE    mov         eax,ebx
 004EEAB0    pop         ebx
 004EEAB1    mov         esp,ebp
 004EEAB3    pop         ebp
 004EEAB4    ret
*}
end;

//004EEB40
function TScreen.GetDefaultIME:UnicodeString;
begin
{*
 004EEB40    push        ebx
 004EEB41    push        esi
 004EEB42    mov         esi,edx
 004EEB44    mov         ebx,eax
 004EEB46    mov         eax,ebx
 004EEB48    call        TScreen.GetImes
 004EEB4D    mov         eax,esi
 004EEB4F    mov         edx,dword ptr [ebx+3C]
 004EEB52    call        @UStrAsg
 004EEB57    pop         esi
 004EEB58    pop         ebx
 004EEB59    ret
*}
end;

//004EEB5C
procedure TScreen.IconFontChanged(Sender:TObject);
begin
{*
 004EEB5C    push        ebx
 004EEB5D    push        esi
 004EEB5E    mov         esi,edx
 004EEB60    mov         ebx,eax
 004EEB62    push        0
 004EEB64    xor         ecx,ecx
 004EEB66    mov         dx,0B035
 004EEB6A    mov         eax,[007932EC];Application:TApplication
 004EEB6F    call        TApplication.NotifyForms
 004EEB74    cmp         esi,dword ptr [ebx+7C]
>004EEB77    jne         004EEBA8
 004EEB79    cmp         dword ptr ds:[7932EC],0;Application:TApplication
>004EEB80    je          004EEBA8
 004EEB82    mov         eax,[007932EC];Application:TApplication
 004EEB87    cmp         byte ptr [eax+88],0
>004EEB8E    je          004EEBA8
 004EEB90    xor         edx,edx
 004EEB92    mov         eax,[007932EC];Application:TApplication
 004EEB97    call        TApplication.SetShowHint
 004EEB9C    mov         dl,1
 004EEB9E    mov         eax,[007932EC];Application:TApplication
 004EEBA3    call        TApplication.SetShowHint
 004EEBA8    pop         esi
 004EEBA9    pop         ebx
 004EEBAA    ret
*}
end;

//004EEBAC
function TScreen.GetDataModule(Index:Integer):TDataModule;
begin
{*
 004EEBAC    push        ebx
 004EEBAD    push        esi
 004EEBAE    mov         esi,edx
 004EEBB0    mov         ebx,eax
 004EEBB2    mov         edx,esi
 004EEBB4    mov         eax,dword ptr [ebx+58]
 004EEBB7    call        TList.Get
 004EEBBC    pop         esi
 004EEBBD    pop         ebx
 004EEBBE    ret
*}
end;

//004EEBC0
function TScreen.GetDataModuleCount:Integer;
begin
{*
 004EEBC0    mov         eax,dword ptr [eax+58]
 004EEBC3    mov         eax,dword ptr [eax+8]
 004EEBC6    ret
*}
end;

//004EEBC8
function TScreen.GetCursors(Index:Integer):HCURSOR;
begin
{*
 004EEBC8    xor         ecx,ecx
 004EEBCA    cmp         edx,0FFFFFFFF
>004EEBCD    je          004EEBF1
 004EEBCF    mov         ecx,dword ptr [eax+0A8]
>004EEBD5    jmp         004EEBD9
 004EEBD7    mov         ecx,dword ptr [ecx]
 004EEBD9    test        ecx,ecx
>004EEBDB    je          004EEBE2
 004EEBDD    cmp         edx,dword ptr [ecx+4]
>004EEBE0    jne         004EEBD7
 004EEBE2    test        ecx,ecx
>004EEBE4    jne         004EEBEE
 004EEBE6    mov         ecx,dword ptr [eax+0AC]
>004EEBEC    jmp         004EEBF1
 004EEBEE    mov         ecx,dword ptr [ecx+8]
 004EEBF1    mov         eax,ecx
 004EEBF3    ret
*}
end;

//004EEBF4
procedure TScreen.SetCursor(Value:TCursor);
begin
{*
 004EEBF4    push        ebx
 004EEBF5    push        esi
 004EEBF6    push        edi
 004EEBF7    push        ebp
 004EEBF8    add         esp,0FFFFFFF0
 004EEBFB    mov         esi,edx
 004EEBFD    mov         ebx,eax
 004EEBFF    cmp         si,word ptr [ebx+48]
>004EEC03    je          004EEC91
 004EEC09    mov         word ptr [ebx+48],si
 004EEC0D    test        si,si
>004EEC10    jne         004EEC81
 004EEC12    push        esp
 004EEC13    call        user32.GetCursorPos
 004EEC18    push        dword ptr [esp+4]
 004EEC1C    push        dword ptr [esp+4]
 004EEC20    call        user32.WindowFromPoint
 004EEC25    mov         edi,eax
 004EEC27    test        edi,edi
>004EEC29    je          004EEC81
 004EEC2B    push        0
 004EEC2D    push        edi
 004EEC2E    call        user32.GetWindowThreadProcessId
 004EEC33    mov         ebp,eax
 004EEC35    call        kernel32.GetCurrentThreadId
 004EEC3A    cmp         ebp,eax
>004EEC3C    jne         004EEC81
 004EEC3E    mov         eax,dword ptr [esp]
 004EEC41    mov         dword ptr [esp+8],eax
 004EEC45    mov         eax,dword ptr [esp+4]
 004EEC49    mov         dword ptr [esp+0C],eax
 004EEC4D    mov         eax,dword ptr [esp+8]
 004EEC51    and         eax,0FFFF
 004EEC56    mov         edx,dword ptr [esp+0C]
 004EEC5A    shl         edx,10
 004EEC5D    or          eax,edx
 004EEC5F    push        eax
 004EEC60    push        0
 004EEC62    push        84
 004EEC67    push        edi
 004EEC68    call        user32.SendMessageW
 004EEC6D    movzx       eax,ax
 004EEC70    or          eax,2000000
 004EEC75    push        eax
 004EEC76    push        edi
 004EEC77    push        20
 004EEC79    push        edi
 004EEC7A    call        user32.SendMessageW
>004EEC7F    jmp         004EEC94
 004EEC81    movsx       edx,si
 004EEC84    mov         eax,ebx
 004EEC86    call        TScreen.GetCursors
 004EEC8B    push        eax
 004EEC8C    call        user32.SetCursor
 004EEC91    inc         dword ptr [ebx+4C]
 004EEC94    add         esp,10
 004EEC97    pop         ebp
 004EEC98    pop         edi
 004EEC99    pop         esi
 004EEC9A    pop         ebx
 004EEC9B    ret
*}
end;

//004EEC9C
procedure TScreen.SetCursors(Index:Integer; Handle:HCURSOR);
begin
{*
 004EEC9C    push        ebx
 004EEC9D    push        esi
 004EEC9E    push        edi
 004EEC9F    mov         edi,ecx
 004EECA1    mov         esi,edx
 004EECA3    mov         ebx,eax
 004EECA5    test        esi,esi
>004EECA7    jne         004EECC9
 004EECA9    test        edi,edi
>004EECAB    jne         004EECC1
 004EECAD    push        7F00
 004EECB2    push        0
 004EECB4    call        user32.LoadCursorW
 004EECB9    mov         dword ptr [ebx+0AC],eax
>004EECBF    jmp         004EECE6
 004EECC1    mov         dword ptr [ebx+0AC],edi
>004EECC7    jmp         004EECE6
 004EECC9    cmp         esi,0FFFFFFFF
>004EECCC    je          004EECE6
 004EECCE    mov         edx,esi
 004EECD0    mov         eax,ebx
 004EECD2    call        TScreen.DeleteCursor
 004EECD7    test        edi,edi
>004EECD9    je          004EECE6
 004EECDB    mov         ecx,edi
 004EECDD    mov         edx,esi
 004EECDF    mov         eax,ebx
 004EECE1    call        TScreen.InsertCursor
 004EECE6    pop         edi
 004EECE7    pop         esi
 004EECE8    pop         ebx
 004EECE9    ret
*}
end;

//004EECEC
procedure TScreen.SetHintFont(Value:TFont);
begin
{*
 004EECEC    push        esi
 004EECED    mov         esi,eax
 004EECEF    mov         eax,dword ptr [esi+7C]
 004EECF2    mov         ecx,dword ptr [eax]
 004EECF4    call        dword ptr [ecx+8]
 004EECF7    pop         esi
 004EECF8    ret
*}
end;

//004EECFC
procedure TScreen.SetIconFont(Value:TFont);
begin
{*
 004EECFC    push        esi
 004EECFD    mov         esi,eax
 004EECFF    mov         eax,dword ptr [esi+80]
 004EED05    mov         ecx,dword ptr [eax]
 004EED07    call        dword ptr [ecx+8]
 004EED0A    pop         esi
 004EED0B    ret
*}
end;

//004EED0C
procedure TScreen.SetMenuFont(Value:TFont);
begin
{*
 004EED0C    push        esi
 004EED0D    mov         esi,eax
 004EED0F    mov         eax,dword ptr [esi+84]
 004EED15    mov         ecx,dword ptr [eax]
 004EED17    call        dword ptr [ecx+8]
 004EED1A    pop         esi
 004EED1B    ret
*}
end;

//004EED1C
procedure TScreen.SetMessageFont(Value:TFont);
begin
{*
 004EED1C    push        esi
 004EED1D    mov         esi,eax
 004EED1F    mov         eax,dword ptr [esi+88]
 004EED25    mov         ecx,dword ptr [eax]
 004EED27    call        dword ptr [ecx+8]
 004EED2A    pop         esi
 004EED2B    ret
*}
end;

//004EED2C
procedure TScreen.SetCaptionFont(Value:TFont);
begin
{*
 004EED2C    push        esi
 004EED2D    mov         esi,eax
 004EED2F    mov         eax,dword ptr [esi+8C]
 004EED35    mov         ecx,dword ptr [eax]
 004EED37    call        dword ptr [ecx+8]
 004EED3A    pop         esi
 004EED3B    ret
*}
end;

//004EED3C
procedure TScreen.GetMetricSettings;
begin
{*
 004EED3C    push        ebp
 004EED3D    mov         ebp,esp
 004EED3F    add         esp,0FFFFFDA8
 004EED45    push        ebx
 004EED46    push        esi
 004EED47    mov         ebx,eax
 004EED49    mov         byte ptr [ebp-1],0
 004EED4D    cmp         dword ptr ds:[7932EC],0;Application:TApplication
>004EED54    je          004EED65
 004EED56    mov         eax,[007932EC];Application:TApplication
 004EED5B    movzx       eax,byte ptr [eax+88]
 004EED62    mov         byte ptr [ebp-1],al
 004EED65    xor         eax,eax
 004EED67    push        ebp
 004EED68    push        4EEEEC
 004EED6D    push        dword ptr fs:[eax]
 004EED70    mov         dword ptr fs:[eax],esp
 004EED73    cmp         dword ptr ds:[7932EC],0;Application:TApplication
>004EED7A    je          004EED88
 004EED7C    xor         edx,edx
 004EED7E    mov         eax,[007932EC];Application:TApplication
 004EED83    call        TApplication.SetShowHint
 004EED88    mov         esi,5C
 004EED8D    push        0
 004EED8F    lea         eax,[ebp-60]
 004EED92    push        eax
 004EED93    push        esi
 004EED94    push        1F
 004EED96    call        user32.SystemParametersInfoW
 004EED9B    test        eax,eax
>004EED9D    je          004EEDB7
 004EED9F    lea         eax,[ebp-60]
 004EEDA2    push        eax
 004EEDA3    call        gdi32.CreateFontIndirectW
 004EEDA8    mov         edx,eax
 004EEDAA    mov         eax,dword ptr [ebx+80]
 004EEDB0    call        TFont.SetHandle
>004EEDB5    jmp         004EEDCB
 004EEDB7    push        0D
 004EEDB9    call        gdi32.GetStockObject
 004EEDBE    mov         edx,eax
 004EEDC0    mov         eax,dword ptr [ebx+80]
 004EEDC6    call        TFont.SetHandle
 004EEDCB    call        tagNONCLIENTMETRICSW.SizeOf
 004EEDD0    mov         esi,eax
 004EEDD2    mov         dword ptr [ebp-258],esi
 004EEDD8    push        0
 004EEDDA    lea         eax,[ebp-258]
 004EEDE0    push        eax
 004EEDE1    push        0
 004EEDE3    push        29
 004EEDE5    call        user32.SystemParametersInfoW
 004EEDEA    test        eax,eax
>004EEDEC    je          004EEE51
 004EEDEE    lea         eax,[ebp-11C]
 004EEDF4    push        eax
 004EEDF5    call        gdi32.CreateFontIndirectW
 004EEDFA    mov         edx,eax
 004EEDFC    mov         eax,dword ptr [ebx+7C]
 004EEDFF    call        TFont.SetHandle
 004EEE04    lea         eax,[ebp-178]
 004EEE0A    push        eax
 004EEE0B    call        gdi32.CreateFontIndirectW
 004EEE10    mov         edx,eax
 004EEE12    mov         eax,dword ptr [ebx+84]
 004EEE18    call        TFont.SetHandle
 004EEE1D    lea         eax,[ebp-0C0]
 004EEE23    push        eax
 004EEE24    call        gdi32.CreateFontIndirectW
 004EEE29    mov         edx,eax
 004EEE2B    mov         eax,dword ptr [ebx+88]
 004EEE31    call        TFont.SetHandle
 004EEE36    lea         eax,[ebp-240]
 004EEE3C    push        eax
 004EEE3D    call        gdi32.CreateFontIndirectW
 004EEE42    mov         edx,eax
 004EEE44    mov         eax,dword ptr [ebx+8C]
 004EEE4A    call        TFont.SetHandle
>004EEE4F    jmp         004EEE9A
 004EEE51    mov         eax,dword ptr [ebx+7C]
 004EEE54    mov         edx,8
 004EEE59    call        TFont.SetSize
 004EEE5E    push        0D
 004EEE60    call        gdi32.GetStockObject
 004EEE65    mov         edx,eax
 004EEE67    mov         eax,dword ptr [ebx+84]
 004EEE6D    call        TFont.SetHandle
 004EEE72    push        0D
 004EEE74    call        gdi32.GetStockObject
 004EEE79    mov         edx,eax
 004EEE7B    mov         eax,dword ptr [ebx+88]
 004EEE81    call        TFont.SetHandle
 004EEE86    push        0D
 004EEE88    call        gdi32.GetStockObject
 004EEE8D    mov         edx,eax
 004EEE8F    mov         eax,dword ptr [ebx+8C]
 004EEE95    call        TFont.SetHandle
 004EEE9A    mov         eax,dword ptr [ebx+7C]
 004EEE9D    mov         edx,0FF000017
 004EEEA2    call        TFont.SetColor
 004EEEA7    mov         eax,dword ptr [ebx+84]
 004EEEAD    mov         edx,0FF000007
 004EEEB2    call        TFont.SetColor
 004EEEB7    mov         eax,dword ptr [ebx+88]
 004EEEBD    mov         edx,0FF000008
 004EEEC2    call        TFont.SetColor
 004EEEC7    xor         eax,eax
 004EEEC9    pop         edx
 004EEECA    pop         ecx
 004EEECB    pop         ecx
 004EEECC    mov         dword ptr fs:[eax],edx
 004EEECF    push        4EEEF3
 004EEED4    cmp         dword ptr ds:[7932EC],0;Application:TApplication
>004EEEDB    je          004EEEEB
 004EEEDD    movzx       edx,byte ptr [ebp-1]
 004EEEE1    mov         eax,[007932EC];Application:TApplication
 004EEEE6    call        TApplication.SetShowHint
 004EEEEB    ret
>004EEEEC    jmp         @HandleFinally
>004EEEF1    jmp         004EEED4
 004EEEF3    pop         esi
 004EEEF4    pop         ebx
 004EEEF5    mov         esp,ebp
 004EEEF7    pop         ebp
 004EEEF8    ret
*}
end;

//004EEEFC
procedure TScreen.DisableAlign;
begin
{*
 004EEEFC    inc         word ptr [eax+90]
 004EEF03    ret
*}
end;

//004EEF04
procedure TScreen.EnableAlign;
begin
{*
 004EEF04    dec         word ptr [eax+90]
 004EEF0B    cmp         word ptr [eax+90],0
>004EEF13    jne         004EEF23
 004EEF15    test        byte ptr [eax+92],10
>004EEF1C    je          004EEF23
 004EEF1E    call        TScreen.Realign
 004EEF23    ret
*}
end;

//004EEF24
procedure TScreen.Realign;
begin
{*
 004EEF24    xor         edx,edx
 004EEF26    call        TScreen.AlignForm
 004EEF2B    ret
*}
end;

//004EEF2C
function InsertBefore(C1:TCustomForm; C2:TCustomForm; AAlign:TAlign):Boolean;
begin
{*
 004EEF2C    push        ebx
 004EEF2D    push        esi
 004EEF2E    push        edi
 004EEF2F    mov         edi,edx
 004EEF31    mov         esi,eax
 004EEF33    xor         eax,eax
 004EEF35    dec         cl
>004EEF37    je          004EEF47
 004EEF39    dec         cl
>004EEF3B    je          004EEF5E
 004EEF3D    dec         cl
>004EEF3F    je          004EEF7B
 004EEF41    dec         cl
>004EEF43    je          004EEF92
>004EEF45    jmp         004EEFAD
 004EEF47    mov         eax,esi
 004EEF49    call        TCustomForm.GetTop
 004EEF4E    mov         ebx,eax
 004EEF50    mov         eax,edi
 004EEF52    call        TCustomForm.GetTop
 004EEF57    cmp         ebx,eax
 004EEF59    setl        al
>004EEF5C    jmp         004EEFAD
 004EEF5E    mov         eax,edi
 004EEF60    call        TCustomForm.GetTop
 004EEF65    mov         ebx,eax
 004EEF67    add         ebx,dword ptr [edi+4C]
 004EEF6A    mov         eax,esi
 004EEF6C    call        TCustomForm.GetTop
 004EEF71    add         eax,dword ptr [esi+4C]
 004EEF74    cmp         ebx,eax
 004EEF76    setl        al
>004EEF79    jmp         004EEFAD
 004EEF7B    mov         eax,esi
 004EEF7D    call        TCustomForm.GetLeft
 004EEF82    mov         ebx,eax
 004EEF84    mov         eax,edi
 004EEF86    call        TCustomForm.GetLeft
 004EEF8B    cmp         ebx,eax
 004EEF8D    setl        al
>004EEF90    jmp         004EEFAD
 004EEF92    mov         eax,edi
 004EEF94    call        TCustomForm.GetLeft
 004EEF99    mov         ebx,eax
 004EEF9B    add         ebx,dword ptr [edi+48]
 004EEF9E    mov         eax,esi
 004EEFA0    call        TCustomForm.GetLeft
 004EEFA5    add         eax,dword ptr [esi+48]
 004EEFA8    cmp         ebx,eax
 004EEFAA    setl        al
 004EEFAD    pop         edi
 004EEFAE    pop         esi
 004EEFAF    pop         ebx
 004EEFB0    ret
*}
end;

//004EEFB4
procedure DoPosition(Form:TCustomForm; AAlign:TAlign);
begin
{*
 004EEFB4    push        ebp
 004EEFB5    mov         ebp,esp
 004EEFB7    add         esp,0FFFFFFF0
 004EEFBA    push        ebx
 004EEFBB    push        esi
 004EEFBC    push        edi
 004EEFBD    mov         byte ptr [ebp-1],dl
 004EEFC0    mov         ebx,eax
 004EEFC2    mov         eax,dword ptr [ebp+8]
 004EEFC5    mov         esi,dword ptr [eax-4]
 004EEFC8    mov         esi,dword ptr [esi+8]
 004EEFCB    mov         eax,dword ptr [ebp+8]
 004EEFCE    mov         eax,dword ptr [eax-4]
 004EEFD1    sub         esi,dword ptr [eax]
 004EEFD3    test        esi,esi
>004EEFD5    jl          004EEFE1
 004EEFD7    movzx       eax,byte ptr [ebp-1]
 004EEFDB    add         al,0FD
 004EEFDD    sub         al,2
>004EEFDF    jae         004EEFE4
 004EEFE1    mov         esi,dword ptr [ebx+48]
 004EEFE4    mov         eax,dword ptr [ebp+8]
 004EEFE7    mov         eax,dword ptr [eax-4]
 004EEFEA    mov         eax,dword ptr [eax+0C]
 004EEFED    mov         edx,dword ptr [ebp+8]
 004EEFF0    mov         edx,dword ptr [edx-4]
 004EEFF3    sub         eax,dword ptr [edx+4]
 004EEFF6    mov         dword ptr [ebp-10],eax
 004EEFF9    cmp         dword ptr [ebp-10],0
>004EEFFD    jl          004EF008
 004EEFFF    movzx       eax,byte ptr [ebp-1]
 004EF003    dec         eax
 004EF004    sub         al,2
>004EF006    jae         004EF00E
 004EF008    mov         eax,dword ptr [ebx+4C]
 004EF00B    mov         dword ptr [ebp-10],eax
 004EF00E    cmp         byte ptr [ebp-1],1
>004EF012    jne         004EF03C
 004EF014    cmp         byte ptr [ebx+29A],2
>004EF01B    jne         004EF03C
 004EF01D    mov         eax,ebx
 004EF01F    call        TCustomForm.GetLeft
 004EF024    mov         dword ptr [ebp-8],eax
 004EF027    mov         eax,ebx
 004EF029    call        TCustomForm.GetTop
 004EF02E    mov         dword ptr [ebp-0C],eax
 004EF031    push        3D
 004EF033    call        user32.GetSystemMetrics
 004EF038    mov         esi,eax
>004EF03A    jmp         004EF053
 004EF03C    mov         eax,dword ptr [ebp+8]
 004EF03F    mov         eax,dword ptr [eax-4]
 004EF042    mov         eax,dword ptr [eax]
 004EF044    mov         dword ptr [ebp-8],eax
 004EF047    mov         eax,dword ptr [ebp+8]
 004EF04A    mov         eax,dword ptr [eax-4]
 004EF04D    mov         eax,dword ptr [eax+4]
 004EF050    mov         dword ptr [ebp-0C],eax
 004EF053    movzx       eax,byte ptr [ebp-1]
 004EF057    dec         al
>004EF059    je          004EF069
 004EF05B    dec         al
>004EF05D    je          004EF077
 004EF05F    dec         al
>004EF061    je          004EF091
 004EF063    dec         al
>004EF065    je          004EF09B
>004EF067    jmp         004EF0B0
 004EF069    mov         eax,dword ptr [ebp+8]
 004EF06C    mov         eax,dword ptr [eax-4]
 004EF06F    mov         edx,dword ptr [ebp-10]
 004EF072    add         dword ptr [eax+4],edx
>004EF075    jmp         004EF0B0
 004EF077    mov         eax,dword ptr [ebp+8]
 004EF07A    mov         eax,dword ptr [eax-4]
 004EF07D    mov         edx,dword ptr [ebp-10]
 004EF080    sub         dword ptr [eax+0C],edx
 004EF083    mov         eax,dword ptr [ebp+8]
 004EF086    mov         eax,dword ptr [eax-4]
 004EF089    mov         eax,dword ptr [eax+0C]
 004EF08C    mov         dword ptr [ebp-0C],eax
>004EF08F    jmp         004EF0B0
 004EF091    mov         eax,dword ptr [ebp+8]
 004EF094    mov         eax,dword ptr [eax-4]
 004EF097    add         dword ptr [eax],esi
>004EF099    jmp         004EF0B0
 004EF09B    mov         eax,dword ptr [ebp+8]
 004EF09E    mov         eax,dword ptr [eax-4]
 004EF0A1    sub         dword ptr [eax+8],esi
 004EF0A4    mov         eax,dword ptr [ebp+8]
 004EF0A7    mov         eax,dword ptr [eax-4]
 004EF0AA    mov         eax,dword ptr [eax+8]
 004EF0AD    mov         dword ptr [ebp-8],eax
 004EF0B0    push        esi
 004EF0B1    mov         eax,dword ptr [ebp-10]
 004EF0B4    push        eax
 004EF0B5    mov         ecx,dword ptr [ebp-0C]
 004EF0B8    mov         edx,dword ptr [ebp-8]
 004EF0BB    mov         eax,ebx
 004EF0BD    mov         edi,dword ptr [eax]
 004EF0BF    call        dword ptr [edi+98]
 004EF0C5    cmp         byte ptr [ebx+29A],2
>004EF0CC    jne         004EF0D7
 004EF0CE    sub         esi,dword ptr [ebp-8]
 004EF0D1    mov         eax,dword ptr [ebp-0C]
 004EF0D4    sub         dword ptr [ebp-10],eax
 004EF0D7    mov         eax,dword ptr [ebx+48]
 004EF0DA    cmp         esi,eax
>004EF0DC    jne         004EF0E6
 004EF0DE    mov         edx,dword ptr [ebx+4C]
 004EF0E1    cmp         edx,dword ptr [ebp-10]
>004EF0E4    je          004EF163
 004EF0E6    movzx       edx,byte ptr [ebp-1]
 004EF0EA    cmp         edx,5
>004EF0ED    ja          004EF163
 004EF0EF    jmp         dword ptr [edx*4+4EF0F6]
 004EF0EF    dd          004EF163
 004EF0EF    dd          004EF10E
 004EF0EF    dd          004EF11F
 004EF0EF    dd          004EF130
 004EF0EF    dd          004EF13C
 004EF0EF    dd          004EF149
 004EF10E    mov         eax,dword ptr [ebp-10]
 004EF111    sub         eax,dword ptr [ebx+4C]
 004EF114    mov         edx,dword ptr [ebp+8]
 004EF117    mov         edx,dword ptr [edx-4]
 004EF11A    sub         dword ptr [edx+4],eax
>004EF11D    jmp         004EF163
 004EF11F    mov         eax,dword ptr [ebp-10]
 004EF122    sub         eax,dword ptr [ebx+4C]
 004EF125    mov         edx,dword ptr [ebp+8]
 004EF128    mov         edx,dword ptr [edx-4]
 004EF12B    add         dword ptr [edx+0C],eax
>004EF12E    jmp         004EF163
 004EF130    sub         esi,eax
 004EF132    mov         eax,dword ptr [ebp+8]
 004EF135    mov         eax,dword ptr [eax-4]
 004EF138    sub         dword ptr [eax],esi
>004EF13A    jmp         004EF163
 004EF13C    sub         esi,eax
 004EF13E    mov         eax,dword ptr [ebp+8]
 004EF141    mov         eax,dword ptr [eax-4]
 004EF144    add         dword ptr [eax+8],esi
>004EF147    jmp         004EF163
 004EF149    sub         esi,eax
 004EF14B    mov         eax,dword ptr [ebp+8]
 004EF14E    mov         eax,dword ptr [eax-4]
 004EF151    add         dword ptr [eax+8],esi
 004EF154    mov         eax,dword ptr [ebp-10]
 004EF157    sub         eax,dword ptr [ebx+4C]
 004EF15A    mov         edx,dword ptr [ebp+8]
 004EF15D    mov         edx,dword ptr [edx-4]
 004EF160    add         dword ptr [edx+0C],eax
 004EF163    pop         edi
 004EF164    pop         esi
 004EF165    pop         ebx
 004EF166    mov         esp,ebp
 004EF168    pop         ebp
 004EF169    ret
*}
end;

//004EF16C
procedure DoAlign(AAlign:TAlign);
begin
{*
 004EF16C    push        ebp
 004EF16D    mov         ebp,esp
 004EF16F    add         esp,0FFFFFFF8
 004EF172    push        ebx
 004EF173    push        esi
 004EF174    push        edi
 004EF175    mov         byte ptr [ebp-1],al
 004EF178    mov         eax,dword ptr [ebp+8]
 004EF17B    mov         eax,dword ptr [eax-8]
 004EF17E    mov         edx,dword ptr [eax]
 004EF180    call        dword ptr [edx+8]
 004EF183    mov         eax,dword ptr [ebp+8]
 004EF186    cmp         dword ptr [eax-0C],0
>004EF18A    je          004EF1DF
 004EF18C    mov         eax,dword ptr [ebp+8]
 004EF18F    mov         eax,dword ptr [eax-0C]
 004EF192    cmp         dword ptr [eax+34],0
>004EF196    jne         004EF1DF
 004EF198    mov         eax,dword ptr [ebp+8]
 004EF19B    mov         eax,dword ptr [eax-0C]
 004EF19E    test        byte ptr [eax+1C],10
>004EF1A2    jne         004EF1DF
 004EF1A4    mov         eax,dword ptr [ebp+8]
 004EF1A7    mov         eax,dword ptr [eax-0C]
 004EF1AA    cmp         byte ptr [eax+59],0
>004EF1AE    je          004EF1DF
 004EF1B0    mov         eax,dword ptr [ebp+8]
 004EF1B3    mov         eax,dword ptr [eax-0C]
 004EF1B6    movzx       eax,byte ptr [eax+5D]
 004EF1BA    cmp         al,byte ptr [ebp-1]
>004EF1BD    jne         004EF1DF
 004EF1BF    mov         eax,dword ptr [ebp+8]
 004EF1C2    mov         eax,dword ptr [eax-0C]
 004EF1C5    cmp         byte ptr [eax+29A],1
>004EF1CC    je          004EF1DF
 004EF1CE    mov         eax,dword ptr [ebp+8]
 004EF1D1    mov         edx,dword ptr [eax-0C]
 004EF1D4    mov         eax,dword ptr [ebp+8]
 004EF1D7    mov         eax,dword ptr [eax-8]
 004EF1DA    call        TList.Add
 004EF1DF    mov         eax,dword ptr [ebp+8]
 004EF1E2    mov         eax,dword ptr [eax-10]
 004EF1E5    call        TScreen.GetCustomFormCount
 004EF1EA    mov         edi,eax
 004EF1EC    dec         edi
 004EF1ED    test        edi,edi
>004EF1EF    jl          004EF27C
 004EF1F5    inc         edi
 004EF1F6    mov         dword ptr [ebp-8],0
 004EF1FD    mov         eax,dword ptr [ebp+8]
 004EF200    mov         eax,dword ptr [eax-10]
 004EF203    mov         edx,dword ptr [ebp-8]
 004EF206    call        TScreen.GetCustomForms
 004EF20B    mov         ebx,eax
 004EF20D    cmp         dword ptr [ebx+34],0
>004EF211    jne         004EF276
 004EF213    movzx       eax,byte ptr [ebx+5D]
 004EF217    cmp         al,byte ptr [ebp-1]
>004EF21A    jne         004EF276
 004EF21C    test        byte ptr [ebx+1C],10
>004EF220    jne         004EF276
 004EF222    cmp         byte ptr [ebx+59],0
>004EF226    je          004EF276
 004EF228    cmp         byte ptr [ebx+29A],1
>004EF22F    je          004EF276
 004EF231    mov         eax,dword ptr [ebp+8]
 004EF234    cmp         ebx,dword ptr [eax-0C]
>004EF237    je          004EF276
 004EF239    xor         esi,esi
>004EF23B    jmp         004EF23E
 004EF23D    inc         esi
 004EF23E    mov         eax,dword ptr [ebp+8]
 004EF241    mov         eax,dword ptr [eax-8]
 004EF244    cmp         esi,dword ptr [eax+8]
>004EF247    jge         004EF267
 004EF249    mov         eax,dword ptr [ebp+8]
 004EF24C    mov         eax,dword ptr [eax-8]
 004EF24F    mov         edx,esi
 004EF251    call        TList.Get
 004EF256    mov         edx,eax
 004EF258    movzx       ecx,byte ptr [ebp-1]
 004EF25C    mov         eax,ebx
 004EF25E    call        InsertBefore
 004EF263    test        al,al
>004EF265    je          004EF23D
 004EF267    mov         eax,dword ptr [ebp+8]
 004EF26A    mov         eax,dword ptr [eax-8]
 004EF26D    mov         ecx,ebx
 004EF26F    mov         edx,esi
 004EF271    call        TList.Insert
 004EF276    inc         dword ptr [ebp-8]
 004EF279    dec         edi
>004EF27A    jne         004EF1FD
 004EF27C    mov         eax,dword ptr [ebp+8]
 004EF27F    mov         eax,dword ptr [eax-8]
 004EF282    mov         edi,dword ptr [eax+8]
 004EF285    dec         edi
 004EF286    test        edi,edi
>004EF288    jl          004EF2B4
 004EF28A    inc         edi
 004EF28B    mov         dword ptr [ebp-8],0
 004EF292    mov         eax,dword ptr [ebp+8]
 004EF295    push        eax
 004EF296    mov         eax,dword ptr [ebp+8]
 004EF299    mov         eax,dword ptr [eax-8]
 004EF29C    mov         edx,dword ptr [ebp-8]
 004EF29F    call        TList.Get
 004EF2A4    movzx       edx,byte ptr [ebp-1]
 004EF2A8    call        DoPosition
 004EF2AD    pop         ecx
 004EF2AE    inc         dword ptr [ebp-8]
 004EF2B1    dec         edi
>004EF2B2    jne         004EF292
 004EF2B4    pop         edi
 004EF2B5    pop         esi
 004EF2B6    pop         ebx
 004EF2B7    pop         ecx
 004EF2B8    pop         ecx
 004EF2B9    pop         ebp
 004EF2BA    ret
*}
end;

//004EF2BC
function AlignWork:Boolean;
begin
{*
 004EF2BC    push        ebp
 004EF2BD    mov         ebp,esp
 004EF2BF    push        ebx
 004EF2C0    push        esi
 004EF2C1    mov         bl,1
 004EF2C3    mov         eax,dword ptr [ebp+8]
 004EF2C6    mov         eax,dword ptr [eax-10]
 004EF2C9    call        TScreen.GetCustomFormCount
 004EF2CE    mov         esi,eax
 004EF2D0    dec         esi
 004EF2D1    cmp         esi,0
>004EF2D4    jl          004EF30A
 004EF2D6    mov         eax,dword ptr [ebp+8]
 004EF2D9    mov         eax,dword ptr [eax-10]
 004EF2DC    mov         edx,esi
 004EF2DE    call        TScreen.GetCustomForms
 004EF2E3    cmp         dword ptr [eax+34],0
>004EF2E7    jne         004EF304
 004EF2E9    test        byte ptr [eax+1C],10
>004EF2ED    jne         004EF304
 004EF2EF    cmp         byte ptr [eax+5D],0
>004EF2F3    je          004EF304
 004EF2F5    cmp         byte ptr [eax+59],0
>004EF2F9    je          004EF304
 004EF2FB    cmp         byte ptr [eax+29A],1
>004EF302    jne         004EF30C
 004EF304    dec         esi
 004EF305    cmp         esi,0FFFFFFFF
>004EF308    jne         004EF2D6
 004EF30A    xor         ebx,ebx
 004EF30C    mov         eax,ebx
 004EF30E    pop         esi
 004EF30F    pop         ebx
 004EF310    pop         ebp
 004EF311    ret
*}
end;

//004EF314
procedure TScreen.AlignForms(AForm:TCustomForm; var Rect:TRect);
begin
{*
 004EF314    push        ebp
 004EF315    mov         ebp,esp
 004EF317    add         esp,0FFFFFFF0
 004EF31A    mov         dword ptr [ebp-4],ecx
 004EF31D    mov         dword ptr [ebp-0C],edx
 004EF320    mov         dword ptr [ebp-10],eax
 004EF323    push        ebp
 004EF324    call        AlignWork
 004EF329    pop         ecx
 004EF32A    test        al,al
>004EF32C    je          004EF395
 004EF32E    mov         dl,1
 004EF330    mov         eax,[00439644];TList
 004EF335    call        TObject.Create
 004EF33A    mov         dword ptr [ebp-8],eax
 004EF33D    xor         eax,eax
 004EF33F    push        ebp
 004EF340    push        4EF38E
 004EF345    push        dword ptr fs:[eax]
 004EF348    mov         dword ptr fs:[eax],esp
 004EF34B    push        ebp
 004EF34C    mov         al,1
 004EF34E    call        DoAlign
 004EF353    pop         ecx
 004EF354    push        ebp
 004EF355    mov         al,2
 004EF357    call        DoAlign
 004EF35C    pop         ecx
 004EF35D    push        ebp
 004EF35E    mov         al,3
 004EF360    call        DoAlign
 004EF365    pop         ecx
 004EF366    push        ebp
 004EF367    mov         al,4
 004EF369    call        DoAlign
 004EF36E    pop         ecx
 004EF36F    push        ebp
 004EF370    mov         al,5
 004EF372    call        DoAlign
 004EF377    pop         ecx
 004EF378    xor         eax,eax
 004EF37A    pop         edx
 004EF37B    pop         ecx
 004EF37C    pop         ecx
 004EF37D    mov         dword ptr fs:[eax],edx
 004EF380    push        4EF395
 004EF385    mov         eax,dword ptr [ebp-8]
 004EF388    call        TObject.Free
 004EF38D    ret
>004EF38E    jmp         @HandleFinally
>004EF393    jmp         004EF385
 004EF395    mov         esp,ebp
 004EF397    pop         ebp
 004EF398    ret
*}
end;

//004EF39C
procedure TScreen.AlignForm(AForm:TCustomForm);
begin
{*
 004EF39C    push        ebp
 004EF39D    mov         ebp,esp
 004EF39F    add         esp,0FFFFFFEC
 004EF3A2    push        ebx
 004EF3A3    mov         ebx,edx
 004EF3A5    mov         dword ptr [ebp-4],eax
 004EF3A8    mov         eax,dword ptr [ebp-4]
 004EF3AB    cmp         word ptr [eax+90],0
>004EF3B3    je          004EF3C1
 004EF3B5    mov         eax,dword ptr [ebp-4]
 004EF3B8    or          dword ptr [eax+92],10
>004EF3BF    jmp         004EF41A
 004EF3C1    mov         eax,dword ptr [ebp-4]
 004EF3C4    call        TScreen.DisableAlign
 004EF3C9    xor         eax,eax
 004EF3CB    push        ebp
 004EF3CC    push        4EF413
 004EF3D1    push        dword ptr fs:[eax]
 004EF3D4    mov         dword ptr fs:[eax],esp
 004EF3D7    push        0
 004EF3D9    lea         eax,[ebp-14]
 004EF3DC    push        eax
 004EF3DD    push        0
 004EF3DF    push        30
 004EF3E1    call        user32.SystemParametersInfoW
 004EF3E6    lea         ecx,[ebp-14]
 004EF3E9    mov         edx,ebx
 004EF3EB    mov         eax,dword ptr [ebp-4]
 004EF3EE    call        TScreen.AlignForms
 004EF3F3    xor         eax,eax
 004EF3F5    pop         edx
 004EF3F6    pop         ecx
 004EF3F7    pop         ecx
 004EF3F8    mov         dword ptr fs:[eax],edx
 004EF3FB    push        4EF41A
 004EF400    mov         eax,dword ptr [ebp-4]
 004EF403    and         dword ptr [eax+92],0FFFFFFEF
 004EF40A    mov         eax,dword ptr [ebp-4]
 004EF40D    call        TScreen.EnableAlign
 004EF412    ret
>004EF413    jmp         @HandleFinally
>004EF418    jmp         004EF400
 004EF41A    pop         ebx
 004EF41B    mov         esp,ebp
 004EF41D    pop         ebp
 004EF41E    ret
*}
end;

//004EF420
function TScreen.GetFonts:TStrings;
begin
{*
 004EF420    push        ebp
 004EF421    mov         ebp,esp
 004EF423    add         esp,0FFFFFF9C
 004EF426    mov         dword ptr [ebp-4],eax
 004EF429    mov         eax,dword ptr [ebp-4]
 004EF42C    cmp         dword ptr [eax+34],0
>004EF430    jne         004EF4CB
 004EF436    mov         dl,1
 004EF438    mov         eax,[0043C7BC];TStringList
 004EF43D    call        TStringList.Create
 004EF442    mov         edx,dword ptr [ebp-4]
 004EF445    mov         dword ptr [edx+34],eax
 004EF448    push        0
 004EF44A    call        user32.GetDC
 004EF44F    mov         dword ptr [ebp-8],eax
 004EF452    xor         eax,eax
 004EF454    push        ebp
 004EF455    push        4EF4C4
 004EF45A    push        dword ptr fs:[eax]
 004EF45D    mov         dword ptr fs:[eax],esp
 004EF460    mov         eax,dword ptr [ebp-4]
 004EF463    mov         eax,dword ptr [eax+34]
 004EF466    mov         edx,4EF4E4;'Default'
 004EF46B    mov         ecx,dword ptr [eax]
 004EF46D    call        dword ptr [ecx+38]
 004EF470    lea         eax,[ebp-64]
 004EF473    xor         ecx,ecx
 004EF475    mov         edx,5C
 004EF47A    call        @FillChar
 004EF47F    mov         byte ptr [ebp-4D],1
 004EF483    push        0
 004EF485    mov         eax,dword ptr [ebp-4]
 004EF488    mov         eax,dword ptr [eax+34]
 004EF48B    push        eax
 004EF48C    push        4EE25C;EnumFontsProc:Integer
 004EF491    lea         eax,[ebp-64]
 004EF494    push        eax
 004EF495    mov         eax,dword ptr [ebp-8]
 004EF498    push        eax
 004EF499    call        gdi32.EnumFontFamiliesExW
 004EF49E    mov         eax,dword ptr [ebp-4]
 004EF4A1    mov         eax,dword ptr [eax+34]
 004EF4A4    mov         dl,1
 004EF4A6    call        TStringList.SetSorted
 004EF4AB    xor         eax,eax
 004EF4AD    pop         edx
 004EF4AE    pop         ecx
 004EF4AF    pop         ecx
 004EF4B0    mov         dword ptr fs:[eax],edx
 004EF4B3    push        4EF4CB
 004EF4B8    mov         eax,dword ptr [ebp-8]
 004EF4BB    push        eax
 004EF4BC    push        0
 004EF4BE    call        user32.ReleaseDC
 004EF4C3    ret
>004EF4C4    jmp         @HandleFinally
>004EF4C9    jmp         004EF4B8
 004EF4CB    mov         eax,dword ptr [ebp-4]
 004EF4CE    mov         eax,dword ptr [eax+34]
 004EF4D1    mov         esp,ebp
 004EF4D3    pop         ebp
 004EF4D4    ret
*}
end;

//004EF4F4
procedure TScreen.ResetFonts;
begin
{*
 004EF4F4    add         eax,34
 004EF4F7    mov         edx,dword ptr [eax]
 004EF4F9    xor         ecx,ecx
 004EF4FB    mov         dword ptr [eax],ecx
 004EF4FD    mov         eax,edx
 004EF4FF    call        TObject.Free
 004EF504    ret
*}
end;

//004EF508
function GetHint(Control:TControl):UnicodeString;
begin
{*
 004EF508    push        ebx
 004EF509    push        esi
 004EF50A    mov         esi,edx
 004EF50C    mov         ebx,eax
 004EF50E    test        ebx,ebx
>004EF510    je          004EF534
 004EF512    cmp         dword ptr [ebx+80],0
>004EF519    jne         004EF520
 004EF51B    mov         ebx,dword ptr [ebx+34]
>004EF51E    jmp         004EF530
 004EF520    mov         eax,esi
 004EF522    mov         edx,dword ptr [ebx+80]
 004EF528    call        @UStrAsg
 004EF52D    pop         esi
 004EF52E    pop         ebx
 004EF52F    ret
 004EF530    test        ebx,ebx
>004EF532    jne         004EF512
 004EF534    mov         eax,esi
 004EF536    call        @UStrClr
 004EF53B    pop         esi
 004EF53C    pop         ebx
 004EF53D    ret
*}
end;

//004EF540
function GetHintControl(Control:TControl):TControl;
begin
{*
>004EF540    jmp         004EF545
 004EF542    mov         eax,dword ptr [eax+34]
 004EF545    test        eax,eax
>004EF547    je          004EF552
 004EF549    cmp         byte ptr [eax+89],0
>004EF550    je          004EF542
 004EF552    test        eax,eax
>004EF554    je          004EF55E
 004EF556    test        byte ptr [eax+1C],10
>004EF55A    je          004EF55E
 004EF55C    xor         eax,eax
 004EF55E    ret
*}
end;

//004EF560
procedure HintTimerProc(Wnd:HWND; Msg:LongInt; TimerID:LongInt; SysTime:LongInt); stdcall;
begin
{*
 004EF560    push        ebp
 004EF561    mov         ebp,esp
 004EF563    push        ebx
 004EF564    push        esi
 004EF565    push        edi
 004EF566    cmp         dword ptr ds:[7932EC],0;Application:TApplication
>004EF56D    je          004EF5AB
 004EF56F    xor         eax,eax
 004EF571    push        ebp
 004EF572    push        4EF591
 004EF577    push        dword ptr fs:[eax]
 004EF57A    mov         dword ptr fs:[eax],esp
 004EF57D    mov         eax,[007932EC];Application:TApplication
 004EF582    call        TApplication.HintTimerExpired
 004EF587    xor         eax,eax
 004EF589    pop         edx
 004EF58A    pop         ecx
 004EF58B    pop         ecx
 004EF58C    mov         dword ptr fs:[eax],edx
>004EF58F    jmp         004EF5AB
>004EF591    jmp         @HandleAnyException
 004EF596    mov         edx,dword ptr ds:[7932EC];Application:TApplication
 004EF59C    mov         eax,[007932EC];Application:TApplication
 004EF5A1    call        TApplication.HandleException
 004EF5A6    call        @DoneExcept
 004EF5AB    pop         edi
 004EF5AC    pop         esi
 004EF5AD    pop         ebx
 004EF5AE    pop         ebp
 004EF5AF    ret         10
*}
end;

//004EF5B4
procedure HintMouseThread(Param:Integer); stdcall;
begin
{*
 004EF5B4    push        ebp
 004EF5B5    mov         ebp,esp
 004EF5B7    add         esp,0FFFFFFF8
 004EF5BA    push        ebx
 004EF5BB    mov         ebx,7932EC;Application:TApplication
 004EF5C0    call        kernel32.GetCurrentThreadId
 004EF5C5    mov         [007932FC],eax
>004EF5CA    jmp         004EF5F5
 004EF5CC    cmp         dword ptr [ebx],0
>004EF5CF    je          004EF5F5
 004EF5D1    mov         eax,dword ptr [ebx]
 004EF5D3    cmp         dword ptr [eax+60],0
>004EF5D7    je          004EF5F5
 004EF5D9    lea         eax,[ebp-8]
 004EF5DC    push        eax
 004EF5DD    call        user32.GetCursorPos
 004EF5E2    lea         eax,[ebp-8]
 004EF5E5    call        FindVCLWindow
 004EF5EA    test        eax,eax
>004EF5EC    jne         004EF5F5
 004EF5EE    mov         eax,dword ptr [ebx]
 004EF5F0    call        TApplication.CancelHint
 004EF5F5    push        64
 004EF5F7    mov         eax,[00793300]
 004EF5FC    push        eax
 004EF5FD    call        kernel32.WaitForSingleObject
 004EF602    cmp         eax,102
>004EF607    je          004EF5CC
 004EF609    pop         ebx
 004EF60A    pop         ecx
 004EF60B    pop         ecx
 004EF60C    pop         ebp
 004EF60D    ret         4
*}
end;

//004EF610
function HintGetMsgHook(nCode:Integer; wParam:WPARAM; LParam:LPARAM):LRESULT; stdcall;
begin
{*
 004EF610    push        ebp
 004EF611    mov         ebp,esp
 004EF613    push        ebx
 004EF614    push        esi
 004EF615    push        edi
 004EF616    mov         esi,dword ptr [ebp+10]
 004EF619    mov         ebx,dword ptr [ebp+8]
 004EF61C    push        esi
 004EF61D    mov         eax,dword ptr [ebp+0C]
 004EF620    push        eax
 004EF621    push        ebx
 004EF622    mov         eax,[00793304]
 004EF627    push        eax
 004EF628    call        user32.CallNextHookEx
 004EF62D    mov         edi,eax
 004EF62F    test        ebx,ebx
>004EF631    jl          004EF648
 004EF633    cmp         dword ptr ds:[7932EC],0;Application:TApplication
>004EF63A    je          004EF648
 004EF63C    mov         edx,esi
 004EF63E    mov         eax,[007932EC];Application:TApplication
 004EF643    call        TApplication.IsHintMsg
 004EF648    mov         eax,edi
 004EF64A    pop         edi
 004EF64B    pop         esi
 004EF64C    pop         ebx
 004EF64D    pop         ebp
 004EF64E    ret         0C
*}
end;

//004EF654
procedure HookHintHooks;
begin
{*
 004EF654    push        ecx
 004EF655    mov         eax,[007932EC];Application:TApplication
 004EF65A    cmp         byte ptr [eax+0AD],0
>004EF661    jne         004EF6C6
 004EF663    cmp         dword ptr ds:[793304],0
>004EF66A    jne         004EF686
 004EF66C    call        kernel32.GetCurrentThreadId
 004EF671    push        eax
 004EF672    push        0
 004EF674    mov         eax,[007867F4];^HintGetMsgHook:LRESULT
 004EF679    push        eax
 004EF67A    push        3
 004EF67C    call        user32.SetWindowsHookExW
 004EF681    mov         [00793304],eax
 004EF686    cmp         dword ptr ds:[793300],0
>004EF68D    jne         004EF6A1
 004EF68F    push        0
 004EF691    push        0
 004EF693    push        0
 004EF695    push        0
 004EF697    call        kernel32.CreateEventW
 004EF69C    mov         [00793300],eax
 004EF6A1    cmp         dword ptr ds:[793308],0
>004EF6A8    jne         004EF6C6
 004EF6AA    push        esp
 004EF6AB    push        0
 004EF6AD    push        0
 004EF6AF    mov         eax,[007867F0];^HintMouseThread
 004EF6B4    push        eax
 004EF6B5    push        3E8
 004EF6BA    push        0
 004EF6BC    call        kernel32.CreateThread
 004EF6C1    mov         [00793308],eax
 004EF6C6    pop         edx
 004EF6C7    ret
*}
end;

//004EF6C8
procedure UnhookHintHooks;
begin
{*
 004EF6C8    push        ecx
 004EF6C9    cmp         dword ptr ds:[793304],0
>004EF6D0    je          004EF6DD
 004EF6D2    mov         eax,[00793304]
 004EF6D7    push        eax
 004EF6D8    call        user32.UnhookWindowsHookEx
 004EF6DD    xor         eax,eax
 004EF6DF    mov         [00793304],eax
 004EF6E4    push        0
 004EF6E6    push        793308
 004EF6EB    call        kernel32.InterlockedExchange
 004EF6F0    mov         dword ptr [esp],eax
 004EF6F3    cmp         dword ptr [esp],0
>004EF6F7    je          004EF73F
 004EF6F9    mov         eax,[00793300]
 004EF6FE    push        eax
 004EF6FF    call        kernel32.SetEvent
 004EF704    call        kernel32.GetCurrentThreadId
 004EF709    cmp         eax,dword ptr ds:[7932FC]
>004EF70F    je          004EF736
>004EF711    jmp         004EF71D
 004EF713    mov         eax,[007932EC];Application:TApplication
 004EF718    call        TApplication.HandleMessage
 004EF71D    push        0FF
 004EF722    push        0FF
 004EF724    push        0
 004EF726    lea         eax,[esp+0C]
 004EF72A    push        eax
 004EF72B    push        1
 004EF72D    call        user32.MsgWaitForMultipleObjects
 004EF732    test        eax,eax
>004EF734    jne         004EF713
 004EF736    mov         eax,dword ptr [esp]
 004EF739    push        eax
 004EF73A    call        kernel32.CloseHandle
 004EF73F    pop         edx
 004EF740    ret
*}
end;

//004EF744
function GetAnimation:Boolean;
begin
{*
 004EF744    push        ebx
 004EF745    add         esp,0FFFFFFF8
 004EF748    mov         ebx,8
 004EF74D    mov         dword ptr [esp],ebx
 004EF750    push        0
 004EF752    lea         eax,[esp+4]
 004EF756    push        eax
 004EF757    push        ebx
 004EF758    push        48
 004EF75A    call        user32.SystemParametersInfoW
 004EF75F    test        eax,eax
>004EF761    je          004EF76D
 004EF763    cmp         dword ptr [esp+4],0
 004EF768    setne       al
>004EF76B    jmp         004EF76F
 004EF76D    xor         eax,eax
 004EF76F    pop         ecx
 004EF770    pop         edx
 004EF771    pop         ebx
 004EF772    ret
*}
end;

//004EF774
procedure SetAnimation(Value:Boolean);
begin
{*
 004EF774    add         esp,0FFFFFFF8
 004EF777    mov         dword ptr [esp],8
 004EF77E    cmp         al,1
 004EF780    cmc
 004EF781    sbb         eax,eax
 004EF783    mov         dword ptr [esp+4],eax
 004EF787    push        0
 004EF789    lea         eax,[esp+4]
 004EF78D    push        eax
 004EF78E    mov         eax,dword ptr [esp+8]
 004EF792    push        eax
 004EF793    push        49
 004EF795    call        user32.SystemParametersInfoW
 004EF79A    pop         ecx
 004EF79B    pop         edx
 004EF79C    ret
*}
end;

//004EF7A0
procedure ShowWinNoAnimate(Handle:HWND; CmdShow:Integer);
begin
{*
 004EF7A0    push        ebx
 004EF7A1    push        esi
 004EF7A2    push        edi
 004EF7A3    mov         edi,edx
 004EF7A5    mov         esi,eax
 004EF7A7    call        GetAnimation
 004EF7AC    mov         ebx,eax
 004EF7AE    test        bl,bl
>004EF7B0    je          004EF7B9
 004EF7B2    xor         eax,eax
 004EF7B4    call        SetAnimation
 004EF7B9    push        edi
 004EF7BA    push        esi
 004EF7BB    call        user32.ShowWindow
 004EF7C0    test        bl,bl
>004EF7C2    je          004EF7CB
 004EF7C4    mov         al,1
 004EF7C6    call        SetAnimation
 004EF7CB    pop         edi
 004EF7CC    pop         esi
 004EF7CD    pop         ebx
 004EF7CE    ret
*}
end;

//004EF7D0
function TScreen.GetDesktopRect:TRect;
begin
{*
 004EF7D0    push        ebx
 004EF7D1    push        esi
 004EF7D2    mov         esi,edx
 004EF7D4    mov         ebx,eax
 004EF7D6    mov         eax,ebx
 004EF7D8    call        TScreen.GetDesktopHeight
 004EF7DD    push        eax
 004EF7DE    push        esi
 004EF7DF    mov         eax,ebx
 004EF7E1    call        TScreen.GetDesktopWidth
 004EF7E6    push        eax
 004EF7E7    mov         eax,ebx
 004EF7E9    call        TScreen.GetDesktopTop
 004EF7EE    push        eax
 004EF7EF    mov         eax,ebx
 004EF7F1    call        TScreen.GetDesktopLeft
 004EF7F6    pop         edx
 004EF7F7    pop         ecx
 004EF7F8    call        Bounds
 004EF7FD    pop         esi
 004EF7FE    pop         ebx
 004EF7FF    ret
*}
end;

//004EF800
function TScreen.GetWorkAreaHeight:Integer;
begin
{*
 004EF800    push        ebx
 004EF801    add         esp,0FFFFFFF0
 004EF804    mov         ebx,eax
 004EF806    mov         edx,esp
 004EF808    mov         eax,ebx
 004EF80A    call        TScreen.GetWorkAreaRect
 004EF80F    mov         eax,dword ptr [esp+0C]
 004EF813    sub         eax,dword ptr [esp+4]
 004EF817    add         esp,10
 004EF81A    pop         ebx
 004EF81B    ret
*}
end;

//004EF81C
function TScreen.GetWorkAreaLeft:Integer;
begin
{*
 004EF81C    push        ebx
 004EF81D    add         esp,0FFFFFFF0
 004EF820    mov         ebx,eax
 004EF822    mov         edx,esp
 004EF824    mov         eax,ebx
 004EF826    call        TScreen.GetWorkAreaRect
 004EF82B    mov         eax,dword ptr [esp]
 004EF82E    add         esp,10
 004EF831    pop         ebx
 004EF832    ret
*}
end;

//004EF834
function TScreen.GetWorkAreaRect:TRect;
begin
{*
 004EF834    push        0
 004EF836    push        edx
 004EF837    push        0
 004EF839    push        30
 004EF83B    call        user32.SystemParametersInfoW
 004EF840    ret
*}
end;

//004EF844
function TScreen.GetWorkAreaTop:Integer;
begin
{*
 004EF844    push        ebx
 004EF845    add         esp,0FFFFFFF0
 004EF848    mov         ebx,eax
 004EF84A    mov         edx,esp
 004EF84C    mov         eax,ebx
 004EF84E    call        TScreen.GetWorkAreaRect
 004EF853    mov         eax,dword ptr [esp+4]
 004EF857    add         esp,10
 004EF85A    pop         ebx
 004EF85B    ret
*}
end;

//004EF85C
function TScreen.GetWorkAreaWidth:Integer;
begin
{*
 004EF85C    push        ebx
 004EF85D    add         esp,0FFFFFFF0
 004EF860    mov         ebx,eax
 004EF862    mov         edx,esp
 004EF864    mov         eax,ebx
 004EF866    call        TScreen.GetWorkAreaRect
 004EF86B    mov         eax,dword ptr [esp+8]
 004EF86F    sub         eax,dword ptr [esp]
 004EF872    add         esp,10
 004EF875    pop         ebx
 004EF876    ret
*}
end;

//004EF878
function TScreen.MonitorFromPoint(Point:TPoint; MonitorDefault:TMonitorDefaultTo):TMonitor;
begin
{*
 004EF878    push        ebx
 004EF879    push        esi
 004EF87A    push        edi
 004EF87B    mov         ebx,ecx
 004EF87D    mov         esi,edx
 004EF87F    mov         edi,eax
 004EF881    movzx       eax,bl
 004EF884    mov         eax,dword ptr [eax*4+7867F8]
 004EF88B    push        eax
 004EF88C    push        dword ptr [esi+4]
 004EF88F    push        dword ptr [esi]
 004EF891    call        user32.MonitorFromPoint
 004EF896    mov         edx,eax
 004EF898    mov         eax,edi
 004EF89A    call        TScreen.FindMonitor
 004EF89F    pop         edi
 004EF8A0    pop         esi
 004EF8A1    pop         ebx
 004EF8A2    ret
*}
end;

//004EF8A4
function TScreen.MonitorFromRect(Rect:TRect; MonitorDefault:TMonitorDefaultTo):TMonitor;
begin
{*
 004EF8A4    push        ebx
 004EF8A5    push        esi
 004EF8A6    push        edi
 004EF8A7    mov         ebx,ecx
 004EF8A9    mov         esi,edx
 004EF8AB    mov         edi,eax
 004EF8AD    movzx       eax,bl
 004EF8B0    mov         eax,dword ptr [eax*4+7867F8]
 004EF8B7    push        eax
 004EF8B8    push        esi
 004EF8B9    call        user32.MonitorFromRect
 004EF8BE    mov         edx,eax
 004EF8C0    mov         eax,edi
 004EF8C2    call        TScreen.FindMonitor
 004EF8C7    pop         edi
 004EF8C8    pop         esi
 004EF8C9    pop         ebx
 004EF8CA    ret
*}
end;

//004EF8CC
function TScreen.MonitorFromWindow(Handle:Cardinal; MonitorDefault:TMonitorDefaultTo):TMonitor;
begin
{*
 004EF8CC    push        ebx
 004EF8CD    push        esi
 004EF8CE    push        edi
 004EF8CF    mov         ebx,ecx
 004EF8D1    mov         esi,edx
 004EF8D3    mov         edi,eax
 004EF8D5    movzx       eax,bl
 004EF8D8    mov         eax,dword ptr [eax*4+7867F8]
 004EF8DF    push        eax
 004EF8E0    push        esi
 004EF8E1    call        user32.MonitorFromWindow
 004EF8E6    mov         edx,eax
 004EF8E8    mov         eax,edi
 004EF8EA    call        TScreen.FindMonitor
 004EF8EF    pop         edi
 004EF8F0    pop         esi
 004EF8F1    pop         ebx
 004EF8F2    ret
*}
end;

//004EF8F4
procedure TScreen.ClearMonitors;
begin
{*
 004EF8F4    push        ebx
 004EF8F5    push        esi
 004EF8F6    push        edi
 004EF8F7    mov         edi,eax
 004EF8F9    mov         eax,dword ptr [edi+5C]
 004EF8FC    mov         ebx,dword ptr [eax+8]
 004EF8FF    dec         ebx
 004EF900    test        ebx,ebx
>004EF902    jl          004EF91A
 004EF904    inc         ebx
 004EF905    xor         esi,esi
 004EF907    mov         eax,dword ptr [edi+5C]
 004EF90A    mov         edx,esi
 004EF90C    call        TList.Get
 004EF911    call        TObject.Free
 004EF916    inc         esi
 004EF917    dec         ebx
>004EF918    jne         004EF907
 004EF91A    mov         eax,[007932F0];Screen:TScreen
 004EF91F    mov         eax,dword ptr [eax+5C]
 004EF922    mov         edx,dword ptr [eax]
 004EF924    call        dword ptr [edx+8]
 004EF927    pop         edi
 004EF928    pop         esi
 004EF929    pop         ebx
 004EF92A    ret
*}
end;

//004EF92C
procedure TScreen.GetMonitors;
begin
{*
 004EF92C    call        TScreen.ClearMonitors
 004EF931    mov         eax,[007932F0];Screen:TScreen
 004EF936    mov         eax,dword ptr [eax+5C]
 004EF939    push        eax
 004EF93A    mov         eax,4E916C;EnumMonitorsProc:Boolean
 004EF93F    push        eax
 004EF940    push        0
 004EF942    push        0
 004EF944    call        user32.EnumDisplayMonitors
 004EF949    ret
*}
end;

//004EF94C
function DoGetPrimaryMonitor:TMonitor;
begin
{*
 004EF94C    push        ebp
 004EF94D    mov         ebp,esp
 004EF94F    push        ebx
 004EF950    push        esi
 004EF951    push        edi
 004EF952    xor         edi,edi
 004EF954    mov         eax,dword ptr [ebp+8]
 004EF957    mov         eax,dword ptr [eax-4]
 004EF95A    call        TScreen.GetMonitorCount
 004EF95F    mov         esi,eax
 004EF961    dec         esi
 004EF962    test        esi,esi
>004EF964    jl          004EF994
 004EF966    inc         esi
 004EF967    xor         ebx,ebx
 004EF969    mov         eax,dword ptr [ebp+8]
 004EF96C    mov         eax,dword ptr [eax-4]
 004EF96F    mov         edx,ebx
 004EF971    call        TScreen.GetMonitor
 004EF976    call        TMonitor.GetPrimary
 004EF97B    test        al,al
>004EF97D    je          004EF990
 004EF97F    mov         eax,dword ptr [ebp+8]
 004EF982    mov         eax,dword ptr [eax-4]
 004EF985    mov         edx,ebx
 004EF987    call        TScreen.GetMonitor
 004EF98C    mov         edi,eax
>004EF98E    jmp         004EF994
 004EF990    inc         ebx
 004EF991    dec         esi
>004EF992    jne         004EF969
 004EF994    mov         eax,edi
 004EF996    pop         edi
 004EF997    pop         esi
 004EF998    pop         ebx
 004EF999    pop         ebp
 004EF99A    ret
*}
end;

//004EF99C
function TScreen.GetPrimaryMonitor:TMonitor;
begin
{*
 004EF99C    push        ebp
 004EF99D    mov         ebp,esp
 004EF99F    push        ecx
 004EF9A0    mov         dword ptr [ebp-4],eax
 004EF9A3    push        ebp
 004EF9A4    call        DoGetPrimaryMonitor
 004EF9A9    pop         ecx
 004EF9AA    test        eax,eax
>004EF9AC    jne         004EF9BD
 004EF9AE    mov         eax,dword ptr [ebp-4]
 004EF9B1    call        TScreen.GetMonitors
 004EF9B6    push        ebp
 004EF9B7    call        DoGetPrimaryMonitor
 004EF9BC    pop         ecx
 004EF9BD    pop         ecx
 004EF9BE    pop         ebp
 004EF9BF    ret
*}
end;

//004EF9DC
constructor TApplication.Create;
begin
{*
 004EF9DC    push        ebp
 004EF9DD    mov         ebp,esp
 004EF9DF    add         esp,0FFFFFDFC
 004EF9E5    push        ebx
 004EF9E6    push        esi
 004EF9E7    test        dl,dl
>004EF9E9    je          004EF9F3
 004EF9EB    add         esp,0FFFFFFF0
 004EF9EE    call        @ClassCreate
 004EF9F3    mov         byte ptr [ebp-1],dl
 004EF9F6    mov         ebx,eax
 004EF9F8    xor         edx,edx
 004EF9FA    mov         eax,ebx
 004EF9FC    call        TComponent.Create
 004EFA01    mov         eax,[0078CB94];^IsLibrary:Boolean
 004EFA06    cmp         byte ptr [eax],0
>004EFA09    jne         004EFA20
 004EFA0B    push        0
 004EFA0D    call        ole32.OleInitialize
 004EFA12    test        eax,80000000
 004EFA17    sete        al
 004EFA1A    mov         byte ptr [ebx+17C],al
 004EFA20    mov         eax,[0078D354]
 004EFA25    cmp         word ptr [eax+2],0
>004EFA2A    jne         004EFA3A
 004EFA2C    mov         eax,[0078D354]
 004EFA31    mov         dword ptr [eax+4],ebx
 004EFA34    mov         dword ptr [eax],4F1AA4;TApplication.HandleException
 004EFA3A    mov         eax,[0078D614]
 004EFA3F    cmp         word ptr [eax+2],0
>004EFA44    jne         004EFA54
 004EFA46    mov         eax,[0078D614]
 004EFA4B    mov         dword ptr [eax+4],ebx
 004EFA4E    mov         dword ptr [eax],4F1CA8;TApplication.ShowException
 004EFA54    mov         byte ptr [ebx+35],0
 004EFA58    mov         dl,1
 004EFA5A    mov         eax,[0045FAE8];TFont
 004EFA5F    call        TFont.Create
 004EFA64    mov         esi,eax
 004EFA66    mov         dword ptr [ebx+3C],esi
 004EFA69    mov         dword ptr [esi+0C],ebx
 004EFA6C    mov         dword ptr [esi+8],4F2220;TApplication.DefaultFontChanged
 004EFA73    mov         dl,1
 004EFA75    mov         eax,[00439644];TList
 004EFA7A    call        TObject.Create
 004EFA7F    mov         dword ptr [ebx+90],eax
 004EFA85    mov         dl,1
 004EFA87    mov         eax,[00439644];TList
 004EFA8C    call        TObject.Create
 004EFA91    mov         dword ptr [ebx+0B0],eax
 004EFA97    xor         eax,eax
 004EFA99    mov         dword ptr [ebx+60],eax
 004EFA9C    xor         eax,eax
 004EFA9E    mov         dword ptr [ebx+84],eax
 004EFAA4    mov         dword ptr [ebx+5C],0FF000018
 004EFAAB    mov         dword ptr [ebx+78],1F4
 004EFAB2    mov         byte ptr [ebx+7C],1
 004EFAB6    xor         eax,eax
 004EFAB8    mov         dword ptr [ebx+80],eax
 004EFABE    mov         dword ptr [ebx+74],9C4
 004EFAC5    mov         byte ptr [ebx+88],0
 004EFACC    mov         byte ptr [ebx+0A5],1
 004EFAD3    mov         byte ptr [ebx+0BC],1
 004EFADA    mov         dl,1
 004EFADC    mov         eax,[00464454];TIcon
 004EFAE1    call        TIcon.Create
 004EFAE6    mov         esi,eax
 004EFAE8    mov         dword ptr [ebx+0A0],esi
 004EFAEE    push        4EFC34
 004EFAF3    mov         eax,[0078D078];MainInstance:Cardinal
 004EFAF8    mov         eax,dword ptr [eax]
 004EFAFA    push        eax
 004EFAFB    call        user32.LoadIconW
 004EFB00    mov         edx,eax
 004EFB02    mov         eax,esi
 004EFB04    call        TIcon.SetHandle
 004EFB09    mov         eax,dword ptr [ebx+0A0]
 004EFB0F    mov         dword ptr [eax+14],ebx
 004EFB12    mov         dword ptr [eax+10],4F2508;TApplication.IconChanged
 004EFB19    mov         dl,1
 004EFB1B    mov         eax,[00439644];TList
 004EFB20    call        TObject.Create
 004EFB25    mov         dword ptr [ebx+98],eax
 004EFB2B    push        100
 004EFB30    lea         eax,[ebp-202]
 004EFB36    push        eax
 004EFB37    mov         eax,[0078D078];MainInstance:Cardinal
 004EFB3C    mov         eax,dword ptr [eax]
 004EFB3E    push        eax
 004EFB3F    call        kernel32.GetModuleFileNameW
 004EFB44    lea         eax,[ebp-202]
 004EFB4A    mov         dx,5C
 004EFB4E    call        StrRScan
 004EFB53    test        eax,eax
>004EFB55    je          004EFB65
 004EFB57    lea         edx,[eax+2]
 004EFB5A    lea         eax,[ebp-202]
 004EFB60    call        StrCopy
 004EFB65    lea         eax,[ebp-202]
 004EFB6B    mov         dx,2E
 004EFB6F    call        StrScan
 004EFB74    test        eax,eax
>004EFB76    je          004EFB7D
 004EFB78    mov         word ptr [eax],0
 004EFB7D    lea         eax,[ebp-202]
 004EFB83    push        eax
 004EFB84    call        user32.CharNextW
 004EFB89    push        eax
 004EFB8A    call        user32.CharLowerW
 004EFB8F    lea         eax,[ebx+8C]
 004EFB95    lea         edx,[ebp-202]
 004EFB9B    mov         ecx,100
 004EFBA0    call        @UStrFromWArray
 004EFBA5    push        ebx
 004EFBA6    push        4F1490;TApplication.PopupControlProc
 004EFBAB    call        AllocateHWnd
 004EFBB0    mov         dword ptr [ebx+178],eax
 004EFBB6    mov         byte ptr [ebx+0D0],0
 004EFBBD    mov         eax,[0078CB94];^IsLibrary:Boolean
 004EFBC2    cmp         byte ptr [eax],0
>004EFBC5    jne         004EFBCE
 004EFBC7    mov         eax,ebx
 004EFBC9    call        TApplication.CreateHandle
 004EFBCE    mov         byte ptr [ebx+59],1
 004EFBD2    mov         byte ptr [ebx+5A],1
 004EFBD6    mov         byte ptr [ebx+5B],1
 004EFBDA    mov         byte ptr [ebx+0A6],1
 004EFBE1    mov         byte ptr [ebx+0D1],0
 004EFBE8    mov         byte ptr [ebx+0DC],0
 004EFBEF    xor         eax,eax
 004EFBF1    mov         dword ptr [ebx+0D4],eax
 004EFBF7    mov         byte ptr [ebx+0D3],0
 004EFBFE    xor         eax,eax
 004EFC00    mov         dword ptr [ebx+0A8],eax
 004EFC06    mov         eax,ebx
 004EFC08    call        TApplication.ValidateHelpSystem
 004EFC0D    mov         eax,ebx
 004EFC0F    call        TApplication.HookSynchronizeWakeup
 004EFC14    mov         eax,ebx
 004EFC16    cmp         byte ptr [ebp-1],0
>004EFC1A    je          004EFC2B
 004EFC1C    call        @AfterConstruction
 004EFC21    pop         dword ptr fs:[0]
 004EFC28    add         esp,0C
 004EFC2B    mov         eax,ebx
 004EFC2D    pop         esi
 004EFC2E    pop         ebx
 004EFC2F    mov         esp,ebp
 004EFC31    pop         ebp
 004EFC32    ret
*}
end;

//004EFC48
destructor TApplication.Destroy();
begin
{*
 004EFC48    push        ebx
 004EFC49    push        esi
 004EFC4A    add         esp,0FFFFFFF0
 004EFC4D    call        @BeforeDestruction
 004EFC52    mov         ebx,edx
 004EFC54    mov         esi,eax
 004EFC56    mov         eax,esi
 004EFC58    call        TApplication.UnhookSynchronizeWakeup
 004EFC5D    mov         dword ptr [esp+4],esi
 004EFC61    mov         dword ptr [esp],4F1AA4;TApplication.HandleException
 004EFC68    mov         eax,[0078D354]
 004EFC6D    mov         eax,dword ptr [eax]
 004EFC6F    cmp         eax,dword ptr [esp]
>004EFC72    jne         004EFC80
 004EFC74    mov         eax,[0078D354]
 004EFC79    xor         edx,edx
 004EFC7B    mov         dword ptr [eax],edx
 004EFC7D    mov         dword ptr [eax+4],edx
 004EFC80    mov         dword ptr [esp+0C],esi
 004EFC84    mov         dword ptr [esp+8],4F1CA8;TApplication.ShowException
 004EFC8C    mov         eax,[0078D614]
 004EFC91    mov         eax,dword ptr [eax]
 004EFC93    cmp         eax,dword ptr [esp+8]
>004EFC97    jne         004EFCA5
 004EFC99    mov         eax,[0078D614]
 004EFC9E    xor         edx,edx
 004EFCA0    mov         dword ptr [eax],edx
 004EFCA2    mov         dword ptr [eax+4],edx
 004EFCA5    mov         eax,dword ptr [esi+0A8]
 004EFCAB    test        eax,eax
>004EFCAD    je          004EFCB5
 004EFCAF    push        eax
 004EFCB0    call        kernel32.FreeLibrary
 004EFCB5    mov         byte ptr [esi+0A5],0
 004EFCBC    mov         eax,esi
 004EFCBE    call        TApplication.CancelHint
 004EFCC3    xor         edx,edx
 004EFCC5    mov         eax,esi
 004EFCC7    call        TApplication.SetShowHint
 004EFCCC    mov         edx,ebx
 004EFCCE    and         dl,0FC
 004EFCD1    mov         eax,esi
 004EFCD3    call        TComponent.Destroy
 004EFCD8    mov         eax,dword ptr [esi+178]
 004EFCDE    test        eax,eax
>004EFCE0    je          004EFCE7
 004EFCE2    call        004E5764
 004EFCE7    push        esi
 004EFCE8    push        4F0504;TApplication.CheckIniChange:Boolean
 004EFCED    mov         eax,esi
 004EFCEF    call        TApplication.UnhookMainWindow
 004EFCF4    mov         eax,dword ptr [esi+170]
 004EFCFA    test        eax,eax
>004EFCFC    je          004EFD2D
 004EFCFE    cmp         byte ptr [esi+0AC],0
>004EFD05    je          004EFD2D
 004EFD07    mov         edx,dword ptr ds:[78D264];^NewStyleControls:Boolean
 004EFD0D    cmp         byte ptr [edx],0
>004EFD10    je          004EFD21
 004EFD12    push        0
 004EFD14    push        1
 004EFD16    push        80
 004EFD1B    push        eax
 004EFD1C    call        user32.SendMessageW
 004EFD21    mov         eax,dword ptr [esi+170]
 004EFD27    push        eax
 004EFD28    call        user32.DestroyWindow
 004EFD2D    cmp         dword ptr [esi+4C],0
>004EFD31    je          004EFD3B
 004EFD33    lea         eax,[esi+4C]
 004EFD36    call        @IntfClear
 004EFD3B    mov         eax,dword ptr [esi+174]
 004EFD41    test        eax,eax
>004EFD43    je          004EFD4A
 004EFD45    call        004E5748
 004EFD4A    mov         eax,dword ptr [esi+0B0]
 004EFD50    call        TObject.Free
 004EFD55    mov         eax,dword ptr [esi+90]
 004EFD5B    call        TObject.Free
 004EFD60    mov         eax,dword ptr [esi+98]
 004EFD66    call        TObject.Free
 004EFD6B    mov         eax,dword ptr [esi+0A0]
 004EFD71    call        TObject.Free
 004EFD76    lea         eax,[esi+3C]
 004EFD79    mov         edx,dword ptr [eax]
 004EFD7B    xor         ecx,ecx
 004EFD7D    mov         dword ptr [eax],ecx
 004EFD7F    mov         eax,edx
 004EFD81    call        TObject.Free
 004EFD86    cmp         byte ptr [esi+17C],0
>004EFD8D    je          004EFD94
 004EFD8F    call        ole32.OleUninitialize
 004EFD94    test        bl,bl
>004EFD96    jle         004EFD9F
 004EFD98    mov         eax,esi
 004EFD9A    call        @ClassDestroy
 004EFD9F    add         esp,10
 004EFDA2    pop         esi
 004EFDA3    pop         ebx
 004EFDA4    ret
*}
end;

//004EFDA8
procedure TApplication.CreateHandle;
begin
{*
 004EFDA8    push        ebp
 004EFDA9    mov         ebp,esp
 004EFDAB    add         esp,0FFFFFFD4
 004EFDAE    push        ebx
 004EFDAF    xor         edx,edx
 004EFDB1    mov         dword ptr [ebp-2C],edx
 004EFDB4    mov         ebx,eax
 004EFDB6    xor         eax,eax
 004EFDB8    push        ebp
 004EFDB9    push        4EFF51
 004EFDBE    push        dword ptr fs:[eax]
 004EFDC1    mov         dword ptr fs:[eax],esp
 004EFDC4    cmp         byte ptr [ebx+0AC],0
>004EFDCB    jne         004EFF3B
 004EFDD1    mov         eax,[0078D730];IsConsole:Boolean
 004EFDD6    cmp         byte ptr [eax],0
>004EFDD9    jne         004EFF3B
 004EFDDF    push        ebx
 004EFDE0    push        4F0690;TApplication.WndProc
 004EFDE5    call        MakeObjectInstance
 004EFDEA    mov         dword ptr [ebx+174],eax
 004EFDF0    mov         eax,40DD38;user32.DefWindowProcW:Integer
 004EFDF5    mov         [00786808],eax;^user32.DefWindowProcW:Integer
 004EFDFA    lea         eax,[ebp-28]
 004EFDFD    push        eax
 004EFDFE    mov         eax,[00786828]
 004EFE03    push        eax
 004EFE04    mov         eax,[00790C38];gvar_00790C38
 004EFE09    push        eax
 004EFE0A    call        user32.GetClassInfoW
 004EFE0F    test        eax,eax
>004EFE11    jne         004EFE4D
 004EFE13    mov         eax,[00790C38];gvar_00790C38
 004EFE18    mov         [00786814],eax
 004EFE1D    push        786804
 004EFE22    call        user32.RegisterClassW
 004EFE27    test        ax,ax
>004EFE2A    jne         004EFE4D
 004EFE2C    lea         edx,[ebp-2C]
 004EFE2F    mov         eax,[0078CDD0];^SResString199:TResStringRec
 004EFE34    call        LoadResString
 004EFE39    mov         ecx,dword ptr [ebp-2C]
 004EFE3C    mov         dl,1
 004EFE3E    mov         eax,[004391C8];EOutOfResources
 004EFE43    call        Exception.Create
 004EFE48    call        @RaiseExcept
 004EFE4D    push        84CA0000
 004EFE52    push        0
 004EFE54    call        user32.GetSystemMetrics
 004EFE59    sar         eax,1
>004EFE5B    jns         004EFE60
 004EFE5D    adc         eax,0
 004EFE60    push        eax
 004EFE61    push        1
 004EFE63    call        user32.GetSystemMetrics
 004EFE68    sar         eax,1
>004EFE6A    jns         004EFE6F
 004EFE6C    adc         eax,0
 004EFE6F    push        eax
 004EFE70    push        0
 004EFE72    push        0
 004EFE74    push        0
 004EFE76    push        0
 004EFE78    mov         eax,[00790C38];gvar_00790C38
 004EFE7D    push        eax
 004EFE7E    push        0
 004EFE80    mov         eax,dword ptr [ebx+8C]
 004EFE86    call        @UStrToPWChar
 004EFE8B    mov         ecx,eax
 004EFE8D    mov         edx,dword ptr ds:[786828]
 004EFE93    mov         eax,80
 004EFE98    call        CreateWindowEx
 004EFE9D    mov         dword ptr [ebx+170],eax
 004EFEA3    mov         byte ptr [ebx+0AC],1
 004EFEAA    mov         eax,dword ptr [ebx+174]
 004EFEB0    push        eax
 004EFEB1    push        0FC
 004EFEB3    mov         eax,dword ptr [ebx+170]
 004EFEB9    push        eax
 004EFEBA    call        user32.SetWindowLongW
 004EFEBF    mov         eax,[0078D264];^NewStyleControls:Boolean
 004EFEC4    cmp         byte ptr [eax],0
>004EFEC7    je          004EFEFA
 004EFEC9    mov         eax,ebx
 004EFECB    call        TApplication.GetIconHandle
 004EFED0    push        eax
 004EFED1    push        1
 004EFED3    push        80
 004EFED8    mov         eax,dword ptr [ebx+170]
 004EFEDE    push        eax
 004EFEDF    call        user32.SendMessageW
 004EFEE4    mov         eax,ebx
 004EFEE6    call        TApplication.GetIconHandle
 004EFEEB    push        eax
 004EFEEC    push        0F2
 004EFEEE    mov         eax,dword ptr [ebx+170]
 004EFEF4    push        eax
 004EFEF5    call        user32.SetClassLongW
 004EFEFA    push        0
 004EFEFC    mov         eax,dword ptr [ebx+170]
 004EFF02    push        eax
 004EFF03    call        user32.GetSystemMenu
 004EFF08    mov         ebx,eax
 004EFF0A    push        0
 004EFF0C    push        0F030
 004EFF11    push        ebx
 004EFF12    call        user32.DeleteMenu
 004EFF17    push        0
 004EFF19    push        0F000
 004EFF1E    push        ebx
 004EFF1F    call        user32.DeleteMenu
 004EFF24    mov         eax,[0078D264];^NewStyleControls:Boolean
 004EFF29    cmp         byte ptr [eax],0
>004EFF2C    je          004EFF3B
 004EFF2E    push        0
 004EFF30    push        0F010
 004EFF35    push        ebx
 004EFF36    call        user32.DeleteMenu
 004EFF3B    xor         eax,eax
 004EFF3D    pop         edx
 004EFF3E    pop         ecx
 004EFF3F    pop         ecx
 004EFF40    mov         dword ptr fs:[eax],edx
 004EFF43    push        4EFF58
 004EFF48    lea         eax,[ebp-2C]
 004EFF4B    call        @UStrClr
 004EFF50    ret
>004EFF51    jmp         @HandleFinally
>004EFF56    jmp         004EFF48
 004EFF58    pop         ebx
 004EFF59    mov         esp,ebp
 004EFF5B    pop         ebp
 004EFF5C    ret
*}
end;

//004EFF60
procedure TApplication.ControlDestroyed(Control:TControl);
begin
{*
 004EFF60    push        ebx
 004EFF61    push        esi
 004EFF62    mov         ecx,7932F0;Screen:TScreen
 004EFF67    cmp         edx,dword ptr [eax+44]
>004EFF6A    jne         004EFF71
 004EFF6C    xor         ebx,ebx
 004EFF6E    mov         dword ptr [eax+44],ebx
 004EFF71    cmp         edx,dword ptr [eax+48]
>004EFF74    jne         004EFF7B
 004EFF76    xor         ebx,ebx
 004EFF78    mov         dword ptr [eax+48],ebx
 004EFF7B    mov         ebx,dword ptr [ecx]
 004EFF7D    cmp         edx,dword ptr [ebx+60]
>004EFF80    jne         004EFF89
 004EFF82    mov         ebx,dword ptr [ecx]
 004EFF84    xor         esi,esi
 004EFF86    mov         dword ptr [ebx+60],esi
 004EFF89    mov         ebx,dword ptr [ecx]
 004EFF8B    cmp         edx,dword ptr [ebx+64]
>004EFF8E    jne         004EFF9E
 004EFF90    mov         ebx,dword ptr [ecx]
 004EFF92    xor         esi,esi
 004EFF94    mov         dword ptr [ebx+64],esi
 004EFF97    mov         ebx,dword ptr [ecx]
 004EFF99    xor         esi,esi
 004EFF9B    mov         dword ptr [ebx+68],esi
 004EFF9E    mov         ebx,dword ptr [ecx]
 004EFFA0    cmp         edx,dword ptr [ebx+74]
>004EFFA3    jne         004EFFAC
 004EFFA5    mov         ebx,dword ptr [ecx]
 004EFFA7    xor         esi,esi
 004EFFA9    mov         dword ptr [ebx+74],esi
 004EFFAC    cmp         edx,dword ptr [eax+60]
>004EFFAF    jne         004EFFB6
 004EFFB1    xor         edx,edx
 004EFFB3    mov         dword ptr [eax+60],edx
 004EFFB6    mov         eax,dword ptr [ecx]
 004EFFB8    call        TScreen.UpdateLastActive
 004EFFBD    pop         esi
 004EFFBE    pop         ebx
 004EFFBF    ret
*}
end;

//004EFFC0
function GetTopMostWindows(Handle:HWND; Info:Pointer):BOOL; stdcall;
begin
{*
 004EFFC0    push        ebp
 004EFFC1    mov         ebp,esp
 004EFFC3    push        ebx
 004EFFC4    push        esi
 004EFFC5    push        edi
 004EFFC6    mov         ebx,dword ptr [ebp+8]
 004EFFC9    or          edi,0FFFFFFFF
 004EFFCC    mov         eax,[007932EC];Application:TApplication
 004EFFD1    cmp         byte ptr [eax+0D3],0
>004EFFD8    je          004EFFF6
 004EFFDA    mov         eax,[007932EC];Application:TApplication
 004EFFDF    cmp         dword ptr [eax+44],0
>004EFFE3    je          004EFFF6
 004EFFE5    mov         eax,[007932EC];Application:TApplication
 004EFFEA    mov         eax,dword ptr [eax+44]
 004EFFED    call        TWinControl.GetHandle
 004EFFF2    mov         esi,eax
>004EFFF4    jmp         004F0001
 004EFFF6    mov         eax,[007932EC];Application:TApplication
 004EFFFB    mov         esi,dword ptr [eax+170]
 004F0001    cmp         dword ptr ds:[7932EC],0;Application:TApplication
>004F0008    je          004F006A
 004F000A    push        4
 004F000C    push        ebx
 004F000D    call        user32.GetWindow
 004F0012    cmp         esi,eax
>004F0014    jne         004F006A
 004F0016    push        0EC
 004F0018    push        ebx
 004F0019    call        user32.GetWindowLongW
 004F001E    test        al,8
>004F0020    je          004F0063
 004F0022    mov         eax,[007932EC];Application:TApplication
 004F0027    cmp         dword ptr [eax+44],0
>004F002B    je          004F004F
 004F002D    mov         eax,dword ptr [ebp+0C]
 004F0030    cmp         byte ptr [eax+4],0
>004F0034    jne         004F004F
 004F0036    mov         eax,[007932EC];Application:TApplication
 004F003B    mov         esi,dword ptr [eax+44]
 004F003E    test        byte ptr [esi+1C],8
>004F0042    jne         004F0063
 004F0044    mov         eax,esi
 004F0046    call        TWinControl.GetHandle
 004F004B    cmp         ebx,eax
>004F004D    je          004F0063
 004F004F    mov         eax,[007932EC];Application:TApplication
 004F0054    mov         eax,dword ptr [eax+90]
 004F005A    mov         edx,ebx
 004F005C    call        TList.Add
>004F0061    jmp         004F006A
 004F0063    mov         eax,dword ptr [ebp+0C]
 004F0066    mov         dword ptr [eax],ebx
 004F0068    xor         edi,edi
 004F006A    mov         eax,edi
 004F006C    pop         edi
 004F006D    pop         esi
 004F006E    pop         ebx
 004F006F    pop         ebp
 004F0070    ret         8
*}
end;

//004F0074
procedure TApplication.DoNormalizeTopMosts(IncludeMain:Boolean);
begin
{*
 004F0074    push        ebx
 004F0075    push        esi
 004F0076    add         esp,0FFFFFFF8
 004F0079    mov         ebx,eax
 004F007B    mov         eax,dword ptr [ebx+170]
 004F0081    test        eax,eax
>004F0083    je          004F0116
 004F0089    cmp         dword ptr [ebx+94],0
>004F0090    jne         004F0110
 004F0092    mov         dword ptr [esp],eax
 004F0095    mov         byte ptr [esp+4],dl
 004F0099    mov         eax,esp
 004F009B    push        eax
 004F009C    push        4EFFC0;GetTopMostWindows:BOOL
 004F00A1    call        user32.EnumWindows
 004F00A6    mov         eax,dword ptr [ebx+90]
 004F00AC    cmp         dword ptr [eax+8],0
>004F00B0    je          004F0110
 004F00B2    push        3
 004F00B4    mov         eax,dword ptr [esp+4]
 004F00B8    push        eax
 004F00B9    call        user32.GetWindow
 004F00BE    mov         esi,eax
 004F00C0    mov         dword ptr [esp],esi
 004F00C3    push        0EC
 004F00C5    push        esi
 004F00C6    call        user32.GetWindowLongW
 004F00CB    test        al,8
>004F00CD    je          004F00D6
 004F00CF    mov         dword ptr [esp],0FFFFFFFE
 004F00D6    mov         eax,dword ptr [ebx+90]
 004F00DC    mov         esi,dword ptr [eax+8]
 004F00DF    dec         esi
 004F00E0    cmp         esi,0
>004F00E3    jl          004F0110
 004F00E5    push        213
 004F00EA    push        0
 004F00EC    push        0
 004F00EE    push        0
 004F00F0    push        0
 004F00F2    mov         eax,dword ptr [esp+14]
 004F00F6    push        eax
 004F00F7    mov         edx,esi
 004F00F9    mov         eax,dword ptr [ebx+90]
 004F00FF    call        TList.Get
 004F0104    push        eax
 004F0105    call        user32.SetWindowPos
 004F010A    dec         esi
 004F010B    cmp         esi,0FFFFFFFF
>004F010E    jne         004F00E5
 004F0110    inc         dword ptr [ebx+94]
 004F0116    pop         ecx
 004F0117    pop         edx
 004F0118    pop         esi
 004F0119    pop         ebx
 004F011A    ret
*}
end;

//004F011C
procedure TApplication.ModalStarted;
begin
{*
 004F011C    push        ebx
 004F011D    inc         dword ptr [eax+0C4]
 004F0123    cmp         dword ptr [eax+0C4],1
>004F012A    jne         004F0146
 004F012C    cmp         word ptr [eax+112],0
>004F0134    je          004F0146
 004F0136    mov         ebx,eax
 004F0138    mov         edx,eax
 004F013A    mov         eax,dword ptr [ebx+114]
 004F0140    call        dword ptr [ebx+110]
 004F0146    pop         ebx
 004F0147    ret
*}
end;

//004F0148
procedure TApplication.ModalFinished;
begin
{*
 004F0148    push        ebx
 004F0149    dec         dword ptr [eax+0C4]
 004F014F    cmp         dword ptr [eax+0C4],0
>004F0156    jne         004F0172
 004F0158    cmp         word ptr [eax+11A],0
>004F0160    je          004F0172
 004F0162    mov         ebx,eax
 004F0164    mov         edx,eax
 004F0166    mov         eax,dword ptr [ebx+11C]
 004F016C    call        dword ptr [ebx+118]
 004F0172    pop         ebx
 004F0173    ret
*}
end;

//004F0174
procedure TApplication.NormalizeTopMosts;
begin
{*
 004F0174    xor         edx,edx
 004F0176    call        TApplication.DoNormalizeTopMosts
 004F017B    ret
*}
end;

//004F017C
procedure TApplication.NormalizeAllTopMosts;
begin
{*
 004F017C    mov         dl,1
 004F017E    call        TApplication.DoNormalizeTopMosts
 004F0183    ret
*}
end;

//004F0184
procedure TApplication.RemovePopupForm(APopupForm:TCustomForm);
begin
{*
 004F0184    push        ebx
 004F0185    push        esi
 004F0186    push        edi
 004F0187    mov         edi,edx
 004F0189    mov         ebx,eax
 004F018B    mov         eax,dword ptr [ebx+0CC]
 004F0191    call        @DynArrayHigh
 004F0196    mov         edx,eax
 004F0198    test        edx,edx
>004F019A    jl          004F01CD
 004F019C    inc         edx
 004F019D    xor         eax,eax
 004F019F    lea         esi,[eax+eax*2]
 004F01A2    mov         ecx,dword ptr [ebx+0CC]
 004F01A8    cmp         edi,dword ptr [ecx+esi*4+4]
>004F01AC    jne         004F01C9
 004F01AE    mov         edx,dword ptr [ebx+0CC]
 004F01B4    xor         ecx,ecx
 004F01B6    mov         dword ptr [edx+esi*4+4],ecx
 004F01BA    mov         eax,dword ptr [ebx+0CC]
 004F01C0    mov         dword ptr [eax+esi*4],0FFFFFFFF
>004F01C7    jmp         004F01CD
 004F01C9    inc         eax
 004F01CA    dec         edx
>004F01CB    jne         004F019F
 004F01CD    pop         edi
 004F01CE    pop         esi
 004F01CF    pop         ebx
 004F01D0    ret
*}
end;

//004F01D4
procedure TApplication.RestoreTopMosts;
begin
{*
 004F01D4    push        ebx
 004F01D5    push        esi
 004F01D6    mov         ebx,eax
 004F01D8    cmp         dword ptr [ebx+170],0
>004F01DF    je          004F023B
 004F01E1    cmp         dword ptr [ebx+94],0
>004F01E8    jle         004F023B
 004F01EA    dec         dword ptr [ebx+94]
 004F01F0    cmp         dword ptr [ebx+94],0
>004F01F7    jne         004F023B
 004F01F9    mov         eax,dword ptr [ebx+90]
 004F01FF    mov         esi,dword ptr [eax+8]
 004F0202    dec         esi
 004F0203    cmp         esi,0
>004F0206    jl          004F0230
 004F0208    push        213
 004F020D    push        0
 004F020F    push        0
 004F0211    push        0
 004F0213    push        0
 004F0215    push        0FF
 004F0217    mov         edx,esi
 004F0219    mov         eax,dword ptr [ebx+90]
 004F021F    call        TList.Get
 004F0224    push        eax
 004F0225    call        user32.SetWindowPos
 004F022A    dec         esi
 004F022B    cmp         esi,0FFFFFFFF
>004F022E    jne         004F0208
 004F0230    mov         eax,dword ptr [ebx+90]
 004F0236    mov         edx,dword ptr [eax]
 004F0238    call        dword ptr [edx+8]
 004F023B    pop         esi
 004F023C    pop         ebx
 004F023D    ret
*}
end;

//004F0240
function GetPopupOwnerWindows(Handle:HWND; Info:Pointer):BOOL; stdcall;
begin
{*
 004F0240    push        ebp
 004F0241    mov         ebp,esp
 004F0243    push        ecx
 004F0244    push        ebx
 004F0245    push        esi
 004F0246    push        edi
 004F0247    mov         esi,dword ptr [ebp+8]
 004F024A    or          edi,0FFFFFFFF
 004F024D    push        4
 004F024F    push        esi
 004F0250    call        user32.GetWindow
 004F0255    mov         ebx,eax
 004F0257    test        ebx,ebx
>004F0259    je          004F0274
 004F025B    mov         eax,[007932EC];Application:TApplication
 004F0260    cmp         ebx,dword ptr [eax+170]
>004F0266    je          004F0274
 004F0268    lea         eax,[ebp-4]
 004F026B    push        eax
 004F026C    push        ebx
 004F026D    call        user32.GetWindowThreadProcessId
>004F0272    jmp         004F0279
 004F0274    xor         eax,eax
 004F0276    mov         dword ptr [ebp-4],eax
 004F0279    call        kernel32.GetCurrentProcessId
 004F027E    cmp         eax,dword ptr [ebp-4]
>004F0281    jne         004F02AB
 004F0283    mov         eax,[007932EC];Application:TApplication
 004F0288    mov         eax,dword ptr [eax+98]
 004F028E    mov         edx,ebx
 004F0290    call        TList.IndexOf
 004F0295    test        eax,eax
>004F0297    jge         004F02AB
 004F0299    mov         eax,[007932EC];Application:TApplication
 004F029E    mov         eax,dword ptr [eax+98]
 004F02A4    mov         edx,ebx
 004F02A6    call        TList.Add
 004F02AB    test        ebx,ebx
>004F02AD    je          004F0327
 004F02AF    mov         eax,[007932EC];Application:TApplication
 004F02B4    cmp         esi,dword ptr [eax+170]
>004F02BA    je          004F0327
 004F02BC    mov         eax,[007932EC];Application:TApplication
 004F02C1    cmp         ebx,dword ptr [eax+170]
>004F02C7    jne         004F0327
 004F02C9    cmp         esi,dword ptr [ebp+0C]
>004F02CC    je          004F0327
 004F02CE    push        esi
 004F02CF    call        user32.IsWindowVisible
 004F02D4    test        eax,eax
>004F02D6    je          004F0327
 004F02D8    mov         eax,[007932EC];Application:TApplication
 004F02DD    mov         eax,dword ptr [eax+0D8]
 004F02E3    call        @DynArrayLength
 004F02E8    inc         eax
 004F02E9    push        eax
 004F02EA    mov         eax,[007932EC];Application:TApplication
 004F02EF    add         eax,0D8
 004F02F4    mov         ecx,1
 004F02F9    mov         edx,dword ptr ds:[4E3628];:TApplication.:1
 004F02FF    call        @DynArraySetLength
 004F0304    add         esp,4
 004F0307    mov         eax,[007932EC];Application:TApplication
 004F030C    mov         eax,dword ptr [eax+0D8]
 004F0312    call        @DynArrayLength
 004F0317    mov         edx,dword ptr ds:[7932EC];Application:TApplication
 004F031D    mov         edx,dword ptr [edx+0D8]
 004F0323    mov         dword ptr [edx+eax*4-4],esi
 004F0327    mov         eax,edi
 004F0329    pop         edi
 004F032A    pop         esi
 004F032B    pop         ebx
 004F032C    pop         ecx
 004F032D    pop         ebp
 004F032E    ret         8
*}
end;

//004F0334
procedure TApplication.DoShowOwnedPopups(Show:Boolean);
begin
{*
 004F0334    push        ebx
 004F0335    push        esi
 004F0336    push        edi
 004F0337    mov         ebx,edx
 004F0339    mov         esi,eax
 004F033B    mov         eax,[007932EC];Application:TApplication
 004F0340    cmp         dword ptr [eax+170],0
>004F0347    je          004F0499
 004F034D    test        bl,bl
>004F034F    jne         004F03E7
 004F0355    cmp         dword ptr [esi+9C],0
>004F035C    jne         004F03DC
 004F035E    mov         eax,esi
 004F0360    call        TApplication.GetMainFormHandle
 004F0365    push        eax
 004F0366    push        4F0240;GetPopupOwnerWindows:BOOL
 004F036B    call        user32.EnumWindows
 004F0370    cmp         dword ptr [esi+44],0
>004F0374    je          004F03AD
 004F0376    mov         eax,[007932EC];Application:TApplication
 004F037B    cmp         byte ptr [eax+0D3],0
>004F0382    je          004F03AD
 004F0384    mov         eax,dword ptr [esi+0D8]
 004F038A    call        @DynArrayHigh
 004F038F    mov         edi,eax
 004F0391    cmp         edi,0
>004F0394    jl          004F03AD
 004F0396    push        0
 004F0398    mov         eax,dword ptr [esi+0D8]
 004F039E    mov         eax,dword ptr [eax+edi*4]
 004F03A1    push        eax
 004F03A2    call        user32.ShowWindow
 004F03A7    dec         edi
 004F03A8    cmp         edi,0FFFFFFFF
>004F03AB    jne         004F0396
 004F03AD    mov         eax,dword ptr [esi+98]
 004F03B3    mov         edi,dword ptr [eax+8]
 004F03B6    dec         edi
 004F03B7    cmp         edi,0
>004F03BA    jl          004F03DC
 004F03BC    cmp         bl,1
 004F03BF    cmc
 004F03C0    sbb         eax,eax
 004F03C2    push        eax
 004F03C3    mov         edx,edi
 004F03C5    mov         eax,dword ptr [esi+98]
 004F03CB    call        TList.Get
 004F03D0    push        eax
 004F03D1    call        user32.ShowOwnedPopups
 004F03D6    dec         edi
 004F03D7    cmp         edi,0FFFFFFFF
>004F03DA    jne         004F03BC
 004F03DC    inc         dword ptr [esi+9C]
>004F03E2    jmp         004F0499
 004F03E7    cmp         dword ptr [esi+9C],0
>004F03EE    jle         004F0499
 004F03F4    dec         dword ptr [esi+9C]
 004F03FA    cmp         dword ptr [esi+9C],0
>004F0401    jne         004F0499
 004F0407    cmp         dword ptr [esi+44],0
>004F040B    je          004F0444
 004F040D    mov         eax,[007932EC];Application:TApplication
 004F0412    cmp         byte ptr [eax+0D3],0
>004F0419    je          004F0444
 004F041B    mov         eax,dword ptr [esi+0D8]
 004F0421    call        @DynArrayHigh
 004F0426    mov         edi,eax
 004F0428    cmp         edi,0
>004F042B    jl          004F0444
 004F042D    push        5
 004F042F    mov         eax,dword ptr [esi+0D8]
 004F0435    mov         eax,dword ptr [eax+edi*4]
 004F0438    push        eax
 004F0439    call        user32.ShowWindow
 004F043E    dec         edi
 004F043F    cmp         edi,0FFFFFFFF
>004F0442    jne         004F042D
 004F0444    mov         eax,dword ptr [esi+98]
 004F044A    mov         edi,dword ptr [eax+8]
 004F044D    dec         edi
 004F044E    cmp         edi,0
>004F0451    jl          004F0473
 004F0453    cmp         bl,1
 004F0456    cmc
 004F0457    sbb         eax,eax
 004F0459    push        eax
 004F045A    mov         edx,edi
 004F045C    mov         eax,dword ptr [esi+98]
 004F0462    call        TList.Get
 004F0467    push        eax
 004F0468    call        user32.ShowOwnedPopups
 004F046D    dec         edi
 004F046E    cmp         edi,0FFFFFFFF
>004F0471    jne         004F0453
 004F0473    mov         eax,dword ptr [esi+98]
 004F0479    mov         edx,dword ptr [eax]
 004F047B    call        dword ptr [edx+8]
 004F047E    push        0
 004F0480    lea         eax,[esi+0D8]
 004F0486    mov         ecx,1
 004F048B    mov         edx,dword ptr ds:[4E3628];:TApplication.:1
 004F0491    call        @DynArraySetLength
 004F0496    add         esp,4
 004F0499    pop         edi
 004F049A    pop         esi
 004F049B    pop         ebx
 004F049C    ret
*}
end;

//004F04A0
function TApplication.IsRightToLeft:Boolean;
begin
{*
 004F04A0    mov         edx,dword ptr ds:[78DB7C];SysLocale:TSysLocale
 004F04A6    cmp         byte ptr [edx+0D],0
>004F04AA    je          004F04B2
 004F04AC    cmp         byte ptr [eax+35],0
>004F04B0    jne         004F04B5
 004F04B2    xor         eax,eax
 004F04B4    ret
 004F04B5    mov         al,1
 004F04B7    ret
*}
end;

//004F04B8
function TApplication.UseRightToLeftReading:Boolean;
begin
{*
 004F04B8    mov         edx,dword ptr ds:[78DB7C];SysLocale:TSysLocale
 004F04BE    cmp         byte ptr [edx+0D],0
>004F04C2    je          004F04CA
 004F04C4    cmp         byte ptr [eax+35],0
>004F04C8    jne         004F04CD
 004F04CA    xor         eax,eax
 004F04CC    ret
 004F04CD    mov         al,1
 004F04CF    ret
*}
end;

//004F04D0
function TApplication.UseRightToLeftAlignment:Boolean;
begin
{*
 004F04D0    mov         edx,dword ptr ds:[78DB7C];SysLocale:TSysLocale
 004F04D6    cmp         byte ptr [edx+0D],0
>004F04DA    je          004F04E2
 004F04DC    cmp         byte ptr [eax+35],1
>004F04E0    je          004F04E5
 004F04E2    xor         eax,eax
 004F04E4    ret
 004F04E5    mov         al,1
 004F04E7    ret
*}
end;

//004F04E8
function TApplication.UseRightToLeftScrollBar:Boolean;
begin
{*
 004F04E8    mov         edx,dword ptr ds:[78DB7C];SysLocale:TSysLocale
 004F04EE    cmp         byte ptr [edx+0D],0
>004F04F2    je          004F04FD
 004F04F4    movzx       eax,byte ptr [eax+35]
 004F04F8    dec         eax
 004F04F9    sub         al,2
>004F04FB    jb          004F0500
 004F04FD    xor         eax,eax
 004F04FF    ret
 004F0500    mov         al,1
 004F0502    ret
*}
end;

//004F0504
function TApplication.CheckIniChange(var Message:TMessage):Boolean;
begin
{*
 004F0504    push        ebx
 004F0505    push        esi
 004F0506    push        edi
 004F0507    mov         esi,edx
 004F0509    mov         edi,eax
 004F050B    xor         ebx,ebx
 004F050D    mov         eax,dword ptr [esi]
 004F050F    cmp         eax,dword ptr ds:[7932F8]
>004F0515    je          004F051C
 004F0517    cmp         eax,1A
>004F051A    jne         004F057C
 004F051C    cmp         byte ptr [edi+59],0
>004F0520    je          004F0531
 004F0522    push        400
 004F0527    call        kernel32.SetThreadLocale
 004F052C    call        GetFormatSettings
 004F0531    cmp         byte ptr [edi+5A],0
>004F0535    je          004F0541
 004F0537    mov         eax,[007932F0];Screen:TScreen
 004F053C    call        TScreen.GetMetricSettings
 004F0541    mov         eax,dword ptr [esi]
 004F0543    cmp         eax,dword ptr ds:[7932F8]
>004F0549    jne         004F057C
 004F054B    mov         eax,[007932F0];Screen:TScreen
 004F0550    call        TScreen.ResetFonts
 004F0555    cmp         byte ptr [edi+0D3],0
>004F055C    je          004F057C
 004F055E    mov         cl,1
 004F0560    mov         dl,1
 004F0562    mov         eax,dword ptr [edi+170]
 004F0568    call        ChangeAppWindow
 004F056D    mov         cl,1
 004F056F    xor         edx,edx
 004F0571    mov         eax,dword ptr [edi+170]
 004F0577    call        ChangeAppWindow
 004F057C    mov         eax,ebx
 004F057E    pop         edi
 004F057F    pop         esi
 004F0580    pop         ebx
 004F0581    ret
*}
end;

//004F0584
procedure TApplication.SettingChange(var Message:TWMSettingChange);
begin
{*
 004F0584    push        ebp
 004F0585    mov         ebp,esp
 004F0587    add         esp,0FFFFFFF8
 004F058A    push        ebx
 004F058B    push        esi
 004F058C    xor         ecx,ecx
 004F058E    mov         dword ptr [ebp-8],ecx
 004F0591    mov         esi,edx
 004F0593    mov         ebx,eax
 004F0595    xor         eax,eax
 004F0597    push        ebp
 004F0598    push        4F05F3
 004F059D    push        dword ptr fs:[eax]
 004F05A0    mov         dword ptr fs:[eax],esp
 004F05A3    cmp         word ptr [ebx+16A],0
>004F05AB    je          004F05DD
 004F05AD    mov         eax,dword ptr [esi+0C]
 004F05B0    mov         dword ptr [ebp-4],eax
 004F05B3    lea         eax,[ebp-8]
 004F05B6    mov         edx,dword ptr [esi+8]
 004F05B9    call        @UStrFromPWChar
 004F05BE    mov         eax,dword ptr [ebp-8]
 004F05C1    push        eax
 004F05C2    lea         eax,[ebp-4]
 004F05C5    push        eax
 004F05C6    mov         ecx,dword ptr [esi+4]
 004F05C9    mov         edx,ebx
 004F05CB    mov         eax,dword ptr [ebx+16C]
 004F05D1    call        dword ptr [ebx+168]
 004F05D7    mov         eax,dword ptr [ebp-4]
 004F05DA    mov         dword ptr [esi+0C],eax
 004F05DD    xor         eax,eax
 004F05DF    pop         edx
 004F05E0    pop         ecx
 004F05E1    pop         ecx
 004F05E2    mov         dword ptr fs:[eax],edx
 004F05E5    push        4F05FA
 004F05EA    lea         eax,[ebp-8]
 004F05ED    call        @UStrClr
 004F05F2    ret
>004F05F3    jmp         @HandleFinally
>004F05F8    jmp         004F05EA
 004F05FA    pop         esi
 004F05FB    pop         ebx
 004F05FC    pop         ecx
 004F05FD    pop         ecx
 004F05FE    pop         ebp
 004F05FF    ret
*}
end;

//004F0600
procedure Default;
begin
{*
 004F0600    push        ebp
 004F0601    mov         ebp,esp
 004F0603    mov         eax,dword ptr [ebp+8]
 004F0606    mov         eax,dword ptr [eax-8]
 004F0609    mov         eax,dword ptr [eax+8]
 004F060C    push        eax
 004F060D    mov         eax,dword ptr [ebp+8]
 004F0610    mov         eax,dword ptr [eax-8]
 004F0613    mov         eax,dword ptr [eax+4]
 004F0616    push        eax
 004F0617    mov         eax,dword ptr [ebp+8]
 004F061A    mov         eax,dword ptr [eax-8]
 004F061D    mov         eax,dword ptr [eax]
 004F061F    push        eax
 004F0620    mov         eax,dword ptr [ebp+8]
 004F0623    mov         eax,dword ptr [eax-4]
 004F0626    mov         eax,dword ptr [eax+170]
 004F062C    push        eax
 004F062D    call        user32.DefWindowProcW
 004F0632    mov         edx,dword ptr [ebp+8]
 004F0635    mov         edx,dword ptr [edx-8]
 004F0638    mov         dword ptr [edx+0C],eax
 004F063B    pop         ebp
 004F063C    ret
*}
end;

//004F0640
procedure DrawAppIcon;
begin
{*
 004F0640    push        ebp
 004F0641    mov         ebp,esp
 004F0643    add         esp,0FFFFFFC0
 004F0646    push        ebx
 004F0647    lea         eax,[ebp-40]
 004F064A    push        eax
 004F064B    mov         eax,dword ptr [ebp+8]
 004F064E    mov         eax,dword ptr [eax-4]
 004F0651    mov         eax,dword ptr [eax+170]
 004F0657    push        eax
 004F0658    call        user32.BeginPaint
 004F065D    mov         ebx,eax
 004F065F    mov         eax,dword ptr [ebp+8]
 004F0662    mov         eax,dword ptr [eax-4]
 004F0665    call        TApplication.GetIconHandle
 004F066A    push        eax
 004F066B    push        0
 004F066D    push        0
 004F066F    push        ebx
 004F0670    call        user32.DrawIcon
 004F0675    lea         eax,[ebp-40]
 004F0678    push        eax
 004F0679    mov         eax,dword ptr [ebp+8]
 004F067C    mov         eax,dword ptr [eax-4]
 004F067F    mov         eax,dword ptr [eax+170]
 004F0685    push        eax
 004F0686    call        user32.EndPaint
 004F068B    pop         ebx
 004F068C    mov         esp,ebp
 004F068E    pop         ebp
 004F068F    ret
*}
end;

//004F0690
procedure TApplication.WndProc(var Message:TMessage);
begin
{*
 004F0690    push        ebp
 004F0691    mov         ebp,esp
 004F0693    add         esp,0FFFFFFB8
 004F0696    push        ebx
 004F0697    push        esi
 004F0698    push        edi
 004F0699    mov         dword ptr [ebp-8],edx
 004F069C    mov         dword ptr [ebp-4],eax
 004F069F    xor         edx,edx
 004F06A1    push        ebp
 004F06A2    push        4F0E12
 004F06A7    push        dword ptr fs:[edx]
 004F06AA    mov         dword ptr fs:[edx],esp
 004F06AD    mov         eax,dword ptr [ebp-8]
 004F06B0    xor         edx,edx
 004F06B2    mov         dword ptr [eax+0C],edx
 004F06B5    mov         eax,dword ptr [ebp-4]
 004F06B8    mov         eax,dword ptr [eax+0B0]
 004F06BE    mov         ebx,dword ptr [eax+8]
 004F06C1    dec         ebx
 004F06C2    test        ebx,ebx
>004F06C4    jl          004F06F8
 004F06C6    inc         ebx
 004F06C7    xor         esi,esi
 004F06C9    mov         eax,dword ptr [ebp-4]
 004F06CC    mov         eax,dword ptr [eax+0B0]
 004F06D2    mov         edx,esi
 004F06D4    call        TList.Get
 004F06D9    mov         edi,eax
 004F06DB    mov         edx,dword ptr [ebp-8]
 004F06DE    mov         eax,dword ptr [edi+4]
 004F06E1    call        dword ptr [edi]
 004F06E3    test        al,al
>004F06E5    je          004F06F4
 004F06E7    xor         eax,eax
 004F06E9    pop         edx
 004F06EA    pop         ecx
 004F06EB    pop         ecx
 004F06EC    mov         dword ptr fs:[eax],edx
>004F06EF    jmp         004F0E27
 004F06F4    inc         esi
 004F06F5    dec         ebx
>004F06F6    jne         004F06C9
 004F06F8    mov         edx,dword ptr [ebp-8]
 004F06FB    mov         eax,dword ptr [ebp-4]
 004F06FE    call        TApplication.CheckIniChange
 004F0703    mov         ebx,dword ptr [ebp-8]
 004F0706    mov         ebx,dword ptr [ebx]
 004F0708    mov         eax,ebx
 004F070A    cmp         eax,53
>004F070D    jg          004F07BA
>004F0713    je          004F0CCF
 004F0719    cmp         eax,11
>004F071C    jg          004F0778
>004F071E    je          004F0AE1
 004F0724    cmp         eax,10
>004F0727    ja          004F0E01
 004F072D    jmp         dword ptr [eax*4+4F0734]
 004F072D    dd          004F0DF8
 004F072D    dd          004F0E01
 004F072D    dd          004F0E01
 004F072D    dd          004F0E01
 004F072D    dd          004F0E01
 004F072D    dd          004F089A
 004F072D    dd          004F0E01
 004F072D    dd          004F091D
 004F072D    dd          004F0E01
 004F072D    dd          004F0E01
 004F072D    dd          004F09CE
 004F072D    dd          004F0E01
 004F072D    dd          004F0E01
 004F072D    dd          004F0E01
 004F072D    dd          004F0E01
 004F072D    dd          004F08CB
 004F072D    dd          004F08B3
 004F0778    cmp         eax,1C
>004F077B    jg          004F07A3
>004F077D    je          004F0941
 004F0783    sub         eax,14
>004F0786    je          004F08F5
 004F078C    sub         eax,2
>004F078F    je          004F0A86
 004F0795    sub         eax,4
>004F0798    je          004F0D53
>004F079E    jmp         004F0E01
 004F07A3    sub         eax,1D
>004F07A6    je          004F0D7C
 004F07AC    sub         eax,1A
>004F07AF    je          004F090A
>004F07B5    jmp         004F0E01
 004F07BA    cmp         eax,0B017
>004F07BF    jg          004F0810
>004F07C1    je          004F0B33
 004F07C7    cmp         eax,0B000
>004F07CC    jg          004F07F7
>004F07CE    je          004F0BCC
 004F07D4    sub         eax,112
>004F07D9    je          004F0859
 004F07DB    add         eax,0FFFFFFE0
 004F07DE    sub         eax,7
>004F07E1    jb          004F0A5A
 004F07E7    sub         eax,1E1
>004F07EC    je          004F0D8F
>004F07F2    jmp         004F0E01
 004F07F7    sub         eax,0B001
>004F07FC    je          004F0C4B
 004F0802    sub         eax,15
>004F0805    je          004F0B11
>004F080B    jmp         004F0E01
 004F0810    cmp         eax,0B031
>004F0815    jg          004F083D
>004F0817    je          004F0D22
 004F081D    sub         eax,0B01A
>004F0822    je          004F0C8B
 004F0828    sub         eax,5
>004F082B    je          004F0CCF
 004F0831    dec         eax
>004F0832    je          004F0CE9
>004F0838    jmp         004F0E01
 004F083D    add         eax,0FFFF4FC1
 004F0842    sub         eax,2
>004F0845    jb          004F0AF0
 004F084B    sub         eax,15
>004F084E    je          004F0DDD
>004F0854    jmp         004F0E01
 004F0859    mov         eax,dword ptr [ebp-8]
 004F085C    mov         eax,dword ptr [eax+4]
 004F085F    and         eax,0FFF0
 004F0864    sub         eax,0F020
>004F0869    je          004F0874
 004F086B    sub         eax,100
>004F0870    je          004F0881
>004F0872    jmp         004F088E
 004F0874    mov         eax,dword ptr [ebp-4]
 004F0877    call        TApplication.Minimize
>004F087C    jmp         004F0E08
 004F0881    mov         eax,dword ptr [ebp-4]
 004F0884    call        TApplication.Restore
>004F0889    jmp         004F0E08
 004F088E    push        ebp
 004F088F    call        Default
 004F0894    pop         ecx
>004F0895    jmp         004F0E08
 004F089A    mov         eax,dword ptr [ebp-8]
 004F089D    cmp         dword ptr [eax+4],1
>004F08A1    jne         004F0E08
 004F08A7    mov         eax,dword ptr [ebp-4]
 004F08AA    mov         byte ptr [eax+34],1
>004F08AE    jmp         004F0E08
 004F08B3    mov         eax,dword ptr [ebp-4]
 004F08B6    mov         eax,dword ptr [eax+44]
 004F08B9    test        eax,eax
>004F08BB    je          004F0E08
 004F08C1    call        TCustomForm.Close
>004F08C6    jmp         004F0E08
 004F08CB    mov         eax,dword ptr [ebp-4]
 004F08CE    mov         eax,dword ptr [eax+170]
 004F08D4    call        IsIconic
 004F08D9    test        eax,eax
>004F08DB    je          004F08E9
 004F08DD    push        ebp
 004F08DE    call        DrawAppIcon
 004F08E3    pop         ecx
>004F08E4    jmp         004F0E08
 004F08E9    push        ebp
 004F08EA    call        Default
 004F08EF    pop         ecx
>004F08F0    jmp         004F0E08
 004F08F5    mov         eax,dword ptr [ebp-8]
 004F08F8    mov         dword ptr [eax],27
 004F08FE    push        ebp
 004F08FF    call        Default
 004F0904    pop         ecx
>004F0905    jmp         004F0E08
 004F090A    mov         eax,dword ptr [ebp-4]
 004F090D    call        TApplication.GetIconHandle
 004F0912    mov         edx,dword ptr [ebp-8]
 004F0915    mov         dword ptr [edx+0C],eax
>004F0918    jmp         004F0E08
 004F091D    push        0
 004F091F    push        0
 004F0921    push        0B01A
 004F0926    mov         eax,dword ptr [ebp-4]
 004F0929    mov         eax,dword ptr [eax+170]
 004F092F    push        eax
 004F0930    call        user32.PostMessageW
 004F0935    push        ebp
 004F0936    call        Default
 004F093B    pop         ecx
>004F093C    jmp         004F0E08
 004F0941    push        ebp
 004F0942    call        Default
 004F0947    pop         ecx
 004F0948    mov         eax,dword ptr [ebp-8]
 004F094B    mov         esi,eax
 004F094D    lea         edi,[ebp-28]
 004F0950    movs        dword ptr [edi],dword ptr [esi]
 004F0951    movs        dword ptr [edi],dword ptr [esi]
 004F0952    movs        dword ptr [edi],dword ptr [esi]
 004F0953    movs        dword ptr [edi],dword ptr [esi]
 004F0954    cmp         dword ptr [ebp-24],1
 004F0958    sbb         eax,eax
 004F095A    inc         eax
 004F095B    mov         edx,dword ptr [ebp-4]
 004F095E    mov         byte ptr [edx+0A5],al
 004F0964    test        al,al
>004F0966    je          004F09A9
 004F0968    mov         eax,dword ptr [ebp-4]
 004F096B    cmp         byte ptr [eax+0D3],0
>004F0972    je          004F0984
 004F0974    mov         eax,dword ptr [ebp-4]
 004F0977    cmp         byte ptr [eax+34],0
>004F097B    je          004F0984
 004F097D    mov         eax,dword ptr [ebp-4]
 004F0980    mov         byte ptr [eax+34],0
 004F0984    mov         eax,dword ptr [ebp-4]
 004F0987    call        TApplication.RestoreTopMosts
 004F098C    push        0
 004F098E    push        0
 004F0990    push        0B000
 004F0995    mov         eax,dword ptr [ebp-4]
 004F0998    mov         eax,dword ptr [eax+170]
 004F099E    push        eax
 004F099F    call        user32.PostMessageW
>004F09A4    jmp         004F0E08
 004F09A9    mov         eax,dword ptr [ebp-4]
 004F09AC    call        TApplication.NormalizeTopMosts
 004F09B1    push        0
 004F09B3    push        0
 004F09B5    push        0B001
 004F09BA    mov         eax,dword ptr [ebp-4]
 004F09BD    mov         eax,dword ptr [eax+170]
 004F09C3    push        eax
 004F09C4    call        user32.PostMessageW
>004F09C9    jmp         004F0E08
 004F09CE    mov         eax,dword ptr [ebp-8]
 004F09D1    mov         esi,eax
 004F09D3    lea         edi,[ebp-38]
 004F09D6    movs        dword ptr [edi],dword ptr [esi]
 004F09D7    movs        dword ptr [edi],dword ptr [esi]
 004F09D8    movs        dword ptr [edi],dword ptr [esi]
 004F09D9    movs        dword ptr [edi],dword ptr [esi]
 004F09DA    cmp         dword ptr [ebp-34],0
>004F09DE    je          004F0A1A
 004F09E0    cmp         byte ptr ds:[78670C],0
>004F09E7    jne         004F0A0E
 004F09E9    mov         eax,dword ptr [ebp-4]
 004F09EC    call        TApplication.RestoreTopMosts
 004F09F1    mov         eax,dword ptr [ebp-4]
 004F09F4    mov         eax,dword ptr [eax+0B4]
 004F09FA    test        eax,eax
>004F09FC    je          004F0A0E
 004F09FE    call        EnableTaskWindows
 004F0A03    mov         eax,dword ptr [ebp-4]
 004F0A06    xor         edx,edx
 004F0A08    mov         dword ptr [eax+0B4],edx
 004F0A0E    push        ebp
 004F0A0F    call        Default
 004F0A14    pop         ecx
>004F0A15    jmp         004F0E08
 004F0A1A    push        ebp
 004F0A1B    call        Default
 004F0A20    pop         ecx
 004F0A21    mov         eax,dword ptr [ebp-4]
 004F0A24    cmp         dword ptr [eax+0B4],0
>004F0A2B    jne         004F0A4D
 004F0A2D    cmp         byte ptr ds:[78670C],0
>004F0A34    jne         004F0A4D
 004F0A36    mov         eax,dword ptr [ebp-4]
 004F0A39    mov         eax,dword ptr [eax+170]
 004F0A3F    call        DisableTaskWindows
 004F0A44    mov         edx,dword ptr [ebp-4]
 004F0A47    mov         dword ptr [edx+0B4],eax
 004F0A4D    mov         eax,dword ptr [ebp-4]
 004F0A50    call        TApplication.NormalizeAllTopMosts
>004F0A55    jmp         004F0E08
 004F0A5A    mov         esi,dword ptr [ebp-8]
 004F0A5D    mov         esi,dword ptr [esi+8]
 004F0A60    push        esi
 004F0A61    mov         eax,dword ptr [ebp-8]
 004F0A64    mov         eax,dword ptr [eax+4]
 004F0A67    push        eax
 004F0A68    mov         eax,dword ptr [ebp-8]
 004F0A6B    add         ebx,0BC00
 004F0A71    push        ebx
 004F0A72    mov         eax,dword ptr [ebp-8]
 004F0A75    push        esi
 004F0A76    call        user32.SendMessageW
 004F0A7B    mov         edx,dword ptr [ebp-8]
 004F0A7E    mov         dword ptr [edx+0C],eax
>004F0A81    jmp         004F0E08
 004F0A86    mov         eax,dword ptr [ebp-8]
 004F0A89    mov         esi,eax
 004F0A8B    lea         edi,[ebp-48]
 004F0A8E    movs        dword ptr [edi],dword ptr [esi]
 004F0A8F    movs        dword ptr [edi],dword ptr [esi]
 004F0A90    movs        dword ptr [edi],dword ptr [esi]
 004F0A91    movs        dword ptr [edi],dword ptr [esi]
 004F0A92    xor         eax,eax
 004F0A94    mov         dword ptr [ebp-3C],eax
 004F0A97    mov         eax,dword ptr [ebp-4]
 004F0A9A    mov         eax,dword ptr [eax+44]
 004F0A9D    test        eax,eax
>004F0A9F    je          004F0AC3
 004F0AA1    cmp         byte ptr [eax+29A],1
>004F0AA8    jne         004F0AC3
 004F0AAA    mov         eax,dword ptr [ebp-8]
 004F0AAD    mov         eax,dword ptr [eax+8]
 004F0AB0    push        eax
 004F0AB1    mov         ecx,dword ptr [ebp-8]
 004F0AB4    mov         ecx,dword ptr [ecx+4]
 004F0AB7    mov         dx,16
 004F0ABB    mov         eax,dword ptr [ebp-4]
 004F0ABE    call        TApplication.NotifyForms
 004F0AC3    cmp         dword ptr [ebp-44],0
>004F0AC7    je          004F0E08
 004F0ACD    mov         eax,[007932EC];Application:TApplication
 004F0AD2    call        TApplication.Terminate
 004F0AD7    call        @Halt0
>004F0ADC    jmp         004F0E08
 004F0AE1    mov         eax,dword ptr [ebp-8]
 004F0AE4    mov         dword ptr [eax+0C],1
>004F0AEB    jmp         004F0E08
 004F0AF0    mov         ecx,dword ptr [ebp-8]
 004F0AF3    mov         ecx,dword ptr [ecx+8]
 004F0AF6    mov         eax,dword ptr [ebp-8]
 004F0AF9    mov         edx,ebx
 004F0AFB    mov         eax,dword ptr [ebp-4]
 004F0AFE    call        TApplication.DispatchAction
 004F0B03    and         eax,7F
 004F0B06    mov         edx,dword ptr [ebp-8]
 004F0B09    mov         dword ptr [edx+0C],eax
>004F0B0C    jmp         004F0E08
 004F0B11    mov         edx,dword ptr [ebp-8]
 004F0B14    mov         eax,dword ptr [ebp-4]
 004F0B17    call        TApplication.IsShortCut
 004F0B1C    test        al,al
>004F0B1E    je          004F0E08
 004F0B24    mov         eax,dword ptr [ebp-8]
 004F0B27    mov         dword ptr [eax+0C],1
>004F0B2E    jmp         004F0E08
 004F0B33    mov         eax,dword ptr [ebp-4]
 004F0B36    mov         eax,dword ptr [eax+44]
 004F0B39    test        eax,eax
>004F0B3B    je          004F0E08
 004F0B41    mov         ebx,eax
 004F0B43    mov         eax,ebx
 004F0B45    call        TWinControl.GetHandle
 004F0B4A    test        eax,eax
>004F0B4C    je          004F0E08
 004F0B52    mov         eax,ebx
 004F0B54    call        TWinControl.GetHandle
 004F0B59    push        eax
 004F0B5A    call        user32.IsWindowEnabled
 004F0B5F    test        eax,eax
>004F0B61    je          004F0E08
 004F0B67    mov         eax,ebx
 004F0B69    call        TWinControl.GetHandle
 004F0B6E    push        eax
 004F0B6F    call        user32.IsWindowVisible
 004F0B74    test        eax,eax
>004F0B76    je          004F0E08
 004F0B7C    mov         byte ptr ds:[7866F8],0
 004F0B83    call        user32.GetFocus
 004F0B88    mov         esi,eax
 004F0B8A    mov         eax,ebx
 004F0B8C    call        TWinControl.GetHandle
 004F0B91    push        eax
 004F0B92    call        user32.SetFocus
 004F0B97    mov         eax,dword ptr [ebp-8]
 004F0B9A    mov         eax,dword ptr [eax+8]
 004F0B9D    push        eax
 004F0B9E    mov         ecx,dword ptr [ebp-8]
 004F0BA1    mov         ecx,dword ptr [ecx+4]
 004F0BA4    mov         edx,112
 004F0BA9    mov         eax,ebx
 004F0BAB    call        TControl.Perform
 004F0BB0    push        esi
 004F0BB1    call        user32.SetFocus
 004F0BB6    mov         byte ptr ds:[7866F8],1
 004F0BBD    mov         eax,dword ptr [ebp-8]
 004F0BC0    mov         dword ptr [eax+0C],1
>004F0BC7    jmp         004F0E08
 004F0BCC    mov         eax,dword ptr [ebp-4]
 004F0BCF    cmp         word ptr [eax+142],0
>004F0BD7    je          004F0BEB
 004F0BD9    mov         ebx,dword ptr [ebp-4]
 004F0BDC    mov         edx,dword ptr [ebp-4]
 004F0BDF    mov         eax,dword ptr [ebx+144]
 004F0BE5    call        dword ptr [ebx+140]
 004F0BEB    mov         eax,[007932EC];Application:TApplication
 004F0BF0    mov         ebx,dword ptr [eax+44]
 004F0BF3    test        ebx,ebx
>004F0BF5    je          004F0C3B
 004F0BF7    mov         eax,[007932EC];Application:TApplication
 004F0BFC    cmp         byte ptr [eax+0D3],0
>004F0C03    je          004F0C3B
 004F0C05    mov         eax,ebx
 004F0C07    call        TWinControl.GetHandle
 004F0C0C    push        eax
 004F0C0D    call        user32.IsWindowEnabled
 004F0C12    test        eax,eax
>004F0C14    jne         004F0C3B
 004F0C16    mov         eax,dword ptr [ebp-4]
 004F0C19    mov         eax,dword ptr [eax+44]
 004F0C1C    call        TWinControl.GetHandle
 004F0C21    mov         edx,dword ptr [ebp-4]
 004F0C24    cmp         eax,dword ptr [edx+0D4]
>004F0C2A    je          004F0C3B
 004F0C2C    mov         eax,dword ptr [ebp-4]
 004F0C2F    mov         eax,dword ptr [eax+0D4]
 004F0C35    push        eax
 004F0C36    call        user32.SetFocus
 004F0C3B    mov         eax,dword ptr [ebp-4]
 004F0C3E    xor         edx,edx
 004F0C40    mov         dword ptr [eax+0D4],edx
>004F0C46    jmp         004F0E08
 004F0C4B    mov         eax,dword ptr [ebp-4]
 004F0C4E    mov         eax,dword ptr [eax+170]
 004F0C54    push        eax
 004F0C55    call        user32.GetLastActivePopup
 004F0C5A    mov         edx,dword ptr [ebp-4]
 004F0C5D    mov         dword ptr [edx+0D4],eax
 004F0C63    mov         eax,dword ptr [ebp-4]
 004F0C66    cmp         word ptr [eax+13A],0
>004F0C6E    je          004F0E08
 004F0C74    mov         ebx,dword ptr [ebp-4]
 004F0C77    mov         edx,dword ptr [ebp-4]
 004F0C7A    mov         eax,dword ptr [ebx+13C]
 004F0C80    call        dword ptr [ebx+138]
>004F0C86    jmp         004F0E08
 004F0C8B    mov         eax,dword ptr [ebp-4]
 004F0C8E    mov         eax,dword ptr [eax+170]
 004F0C94    call        IsIconic
 004F0C99    test        eax,eax
>004F0C9B    jne         004F0E08
 004F0CA1    call        user32.GetFocus
 004F0CA6    mov         edx,dword ptr [ebp-4]
 004F0CA9    cmp         eax,dword ptr [edx+170]
>004F0CAF    jne         004F0E08
 004F0CB5    xor         eax,eax
 004F0CB7    call        FindTopMostWindow
 004F0CBC    test        eax,eax
>004F0CBE    je          004F0E08
 004F0CC4    push        eax
 004F0CC5    call        user32.SetFocus
>004F0CCA    jmp         004F0E08
 004F0CCF    mov         ecx,dword ptr [ebp-8]
 004F0CD2    mov         ecx,dword ptr [ecx+8]
 004F0CD5    mov         edx,dword ptr [ebp-8]
 004F0CD8    movzx       edx,word ptr [edx+4]
 004F0CDC    mov         eax,dword ptr [ebp-4]
 004F0CDF    call        TApplication.InvokeHelp
>004F0CE4    jmp         004F0E08
 004F0CE9    mov         eax,dword ptr [ebp-8]
 004F0CEC    cmp         dword ptr [eax+4],0
>004F0CF0    jne         004F0D0A
 004F0CF2    mov         eax,dword ptr [ebp-8]
 004F0CF5    mov         eax,dword ptr [eax+8]
 004F0CF8    push        dword ptr [eax+4]
 004F0CFB    push        dword ptr [eax]
 004F0CFD    mov         eax,dword ptr [ebp-4]
 004F0D00    call        TApplication.HookMainWindow
>004F0D05    jmp         004F0E08
 004F0D0A    mov         eax,dword ptr [ebp-8]
 004F0D0D    mov         eax,dword ptr [eax+8]
 004F0D10    push        dword ptr [eax+4]
 004F0D13    push        dword ptr [eax]
 004F0D15    mov         eax,dword ptr [ebp-4]
 004F0D18    call        TApplication.UnhookMainWindow
>004F0D1D    jmp         004F0E08
 004F0D22    mov         eax,dword ptr [ebp-8]
 004F0D25    cmp         dword ptr [eax+4],1
>004F0D29    jne         004F0D3F
 004F0D2B    mov         eax,dword ptr [ebp-4]
 004F0D2E    mov         eax,dword ptr [eax+0B8]
 004F0D34    mov         edx,dword ptr [ebp-8]
 004F0D37    mov         dword ptr [edx+0C],eax
>004F0D3A    jmp         004F0E08
 004F0D3F    mov         eax,dword ptr [ebp-8]
 004F0D42    mov         eax,dword ptr [eax+8]
 004F0D45    mov         edx,dword ptr [ebp-4]
 004F0D48    mov         dword ptr [edx+0B8],eax
>004F0D4E    jmp         004F0E08
 004F0D53    mov         edx,dword ptr [ebp-8]
 004F0D56    mov         edx,dword ptr [edx+4]
 004F0D59    mov         eax,[0078DA48];^Mouse:TMouse
 004F0D5E    mov         eax,dword ptr [eax]
 004F0D60    call        TMouse.SettingChanged
 004F0D65    mov         edx,dword ptr [ebp-8]
 004F0D68    mov         eax,dword ptr [ebp-4]
 004F0D6B    call        TApplication.SettingChange
 004F0D70    push        ebp
 004F0D71    call        Default
 004F0D76    pop         ecx
>004F0D77    jmp         004F0E08
 004F0D7C    mov         eax,[007932F0];Screen:TScreen
 004F0D81    call        TScreen.ResetFonts
 004F0D86    push        ebp
 004F0D87    call        Default
 004F0D8C    pop         ecx
>004F0D8D    jmp         004F0E08
 004F0D8F    call        ThemeServices
 004F0D94    call        TThemeServices.ApplyThemeChange
 004F0D99    mov         dword ptr [ebp-18],0B051
 004F0DA0    xor         eax,eax
 004F0DA2    mov         dword ptr [ebp-14],eax
 004F0DA5    xor         eax,eax
 004F0DA7    mov         dword ptr [ebp-10],eax
 004F0DAA    xor         eax,eax
 004F0DAC    mov         dword ptr [ebp-0C],eax
 004F0DAF    mov         eax,[007932F0];Screen:TScreen
 004F0DB4    call        TScreen.GetFormCount
 004F0DB9    mov         ebx,eax
 004F0DBB    dec         ebx
 004F0DBC    test        ebx,ebx
>004F0DBE    jl          004F0E08
 004F0DC0    inc         ebx
 004F0DC1    xor         esi,esi
 004F0DC3    mov         edx,esi
 004F0DC5    mov         eax,[007932F0];Screen:TScreen
 004F0DCA    call        TScreen.GetForm
 004F0DCF    lea         edx,[ebp-18]
 004F0DD2    call        TWinControl.Broadcast
 004F0DD7    inc         esi
 004F0DD8    dec         ebx
>004F0DD9    jne         004F0DC3
>004F0DDB    jmp         004F0E08
 004F0DDD    mov         eax,dword ptr [ebp-8]
 004F0DE0    mov         eax,dword ptr [eax+8]
 004F0DE3    push        eax
 004F0DE4    mov         ecx,dword ptr [ebp-8]
 004F0DE7    mov         ecx,dword ptr [ecx+4]
 004F0DEA    mov         dx,0B056
 004F0DEE    mov         eax,dword ptr [ebp-4]
 004F0DF1    call        TApplication.NotifyForms
>004F0DF6    jmp         004F0E08
 004F0DF8    xor         eax,eax
 004F0DFA    call        CheckSynchronize
>004F0DFF    jmp         004F0E08
 004F0E01    push        ebp
 004F0E02    call        Default
 004F0E07    pop         ecx
 004F0E08    xor         eax,eax
 004F0E0A    pop         edx
 004F0E0B    pop         ecx
 004F0E0C    pop         ecx
 004F0E0D    mov         dword ptr fs:[eax],edx
>004F0E10    jmp         004F0E27
>004F0E12    jmp         @HandleAnyException
 004F0E17    mov         edx,dword ptr [ebp-4]
 004F0E1A    mov         eax,dword ptr [ebp-4]
 004F0E1D    call        TApplication.HandleException
 004F0E22    call        @DoneExcept
 004F0E27    pop         edi
 004F0E28    pop         esi
 004F0E29    pop         ebx
 004F0E2A    mov         esp,ebp
 004F0E2C    pop         ebp
 004F0E2D    ret
*}
end;

//004F0E30
function TApplication.GetIconHandle:HICON;
begin
{*
 004F0E30    mov         eax,dword ptr [eax+0A0]
 004F0E36    call        TIcon.GetHandle
 004F0E3B    test        eax,eax
>004F0E3D    jne         004F0E4B
 004F0E3F    push        7F00
 004F0E44    push        0
 004F0E46    call        user32.LoadIconW
 004F0E4B    ret
*}
end;

//004F0E4C
procedure TApplication.Minimize;
begin
{*
 004F0E4C    push        ebx
 004F0E4D    mov         ebx,eax
 004F0E4F    mov         eax,dword ptr [ebx+170]
 004F0E55    call        IsIconic
 004F0E5A    test        eax,eax
>004F0E5C    jne         004F0F4E
 004F0E62    mov         eax,ebx
 004F0E64    call        TApplication.NormalizeTopMosts
 004F0E69    cmp         byte ptr [ebx+0D3],0
>004F0E70    jne         004F0E7E
 004F0E72    mov         eax,dword ptr [ebx+170]
 004F0E78    push        eax
 004F0E79    call        user32.SetActiveWindow
 004F0E7E    mov         byte ptr [ebx+34],1
 004F0E82    xor         edx,edx
 004F0E84    mov         eax,ebx
 004F0E86    call        TApplication.DoShowOwnedPopups
 004F0E8B    cmp         byte ptr [ebx+0D3],0
>004F0E92    je          004F0EB3
 004F0E94    mov         eax,dword ptr [ebx+44]
 004F0E97    test        eax,eax
>004F0E99    je          004F0EA7
 004F0E9B    mov         dl,1
 004F0E9D    call        TCustomForm.SetWindowState
>004F0EA2    jmp         004F0F36
 004F0EA7    mov         byte ptr [ebx+0DC],1
>004F0EAE    jmp         004F0F36
 004F0EB3    cmp         dword ptr [ebx+44],0
>004F0EB7    je          004F0F26
 004F0EB9    cmp         byte ptr [ebx+5B],0
>004F0EBD    jne         004F0EC8
 004F0EBF    mov         eax,dword ptr [ebx+44]
 004F0EC2    cmp         byte ptr [eax+59],0
>004F0EC6    je          004F0F26
 004F0EC8    mov         eax,dword ptr [ebx+44]
 004F0ECB    call        TWinControl.GetHandle
 004F0ED0    push        eax
 004F0ED1    call        user32.IsWindowEnabled
 004F0ED6    test        eax,eax
>004F0ED8    je          004F0F26
 004F0EDA    push        40
 004F0EDC    push        0
 004F0EDE    mov         eax,dword ptr [ebx+44]
 004F0EE1    mov         eax,dword ptr [eax+48]
 004F0EE4    push        eax
 004F0EE5    mov         eax,dword ptr [ebx+44]
 004F0EE8    call        TCustomForm.GetTop
 004F0EED    push        eax
 004F0EEE    mov         eax,dword ptr [ebx+44]
 004F0EF1    call        TCustomForm.GetLeft
 004F0EF6    push        eax
 004F0EF7    mov         eax,dword ptr [ebx+44]
 004F0EFA    call        TWinControl.GetHandle
 004F0EFF    push        eax
 004F0F00    mov         eax,dword ptr [ebx+170]
 004F0F06    push        eax
 004F0F07    call        user32.SetWindowPos
 004F0F0C    push        0
 004F0F0E    push        0F020
 004F0F13    push        112
 004F0F18    mov         eax,dword ptr [ebx+170]
 004F0F1E    push        eax
 004F0F1F    call        user32.DefWindowProcW
>004F0F24    jmp         004F0F36
 004F0F26    mov         edx,6
 004F0F2B    mov         eax,dword ptr [ebx+170]
 004F0F31    call        ShowWinNoAnimate
 004F0F36    cmp         word ptr [ebx+14A],0
>004F0F3E    je          004F0F4E
 004F0F40    mov         edx,ebx
 004F0F42    mov         eax,dword ptr [ebx+14C]
 004F0F48    call        dword ptr [ebx+148]
 004F0F4E    pop         ebx
 004F0F4F    ret
*}
end;

//004F0F50
procedure TApplication.Restore;
begin
{*
 004F0F50    push        ebx
 004F0F51    push        esi
 004F0F52    mov         ebx,eax
 004F0F54    mov         eax,dword ptr [ebx+170]
 004F0F5A    call        IsIconic
 004F0F5F    test        eax,eax
>004F0F61    je          004F107F
 004F0F67    mov         byte ptr [ebx+34],0
 004F0F6B    mov         eax,dword ptr [ebx+170]
 004F0F71    push        eax
 004F0F72    call        user32.SetActiveWindow
 004F0F77    mov         esi,dword ptr [ebx+44]
 004F0F7A    test        esi,esi
>004F0F7C    je          004F1019
 004F0F82    cmp         byte ptr [ebx+0D3],0
>004F0F89    je          004F0F9C
 004F0F8B    push        9
 004F0F8D    mov         eax,esi
 004F0F8F    call        TWinControl.GetHandle
 004F0F94    push        eax
 004F0F95    call        user32.ShowWindow
>004F0F9A    jmp         004F1019
 004F0F9C    cmp         byte ptr [ebx+5B],0
>004F0FA0    jne         004F0FAB
 004F0FA2    mov         eax,dword ptr [ebx+44]
 004F0FA5    cmp         byte ptr [eax+59],0
>004F0FA9    je          004F0FD7
 004F0FAB    mov         eax,dword ptr [ebx+44]
 004F0FAE    call        TWinControl.GetHandle
 004F0FB3    push        eax
 004F0FB4    call        user32.IsWindowEnabled
 004F0FB9    test        eax,eax
>004F0FBB    je          004F0FD7
 004F0FBD    push        0
 004F0FBF    push        0F120
 004F0FC4    push        112
 004F0FC9    mov         eax,dword ptr [ebx+170]
 004F0FCF    push        eax
 004F0FD0    call        user32.DefWindowProcW
>004F0FD5    jmp         004F0FE7
 004F0FD7    mov         edx,9
 004F0FDC    mov         eax,dword ptr [ebx+170]
 004F0FE2    call        ShowWinNoAnimate
 004F0FE7    push        40
 004F0FE9    push        0
 004F0FEB    push        0
 004F0FED    push        1
 004F0FEF    call        user32.GetSystemMetrics
 004F0FF4    sar         eax,1
>004F0FF6    jns         004F0FFB
 004F0FF8    adc         eax,0
 004F0FFB    push        eax
 004F0FFC    push        0
 004F0FFE    call        user32.GetSystemMetrics
 004F1003    sar         eax,1
>004F1005    jns         004F100A
 004F1007    adc         eax,0
 004F100A    push        eax
 004F100B    push        0
 004F100D    mov         eax,dword ptr [ebx+170]
 004F1013    push        eax
 004F1014    call        user32.SetWindowPos
 004F1019    mov         eax,dword ptr [ebx+44]
 004F101C    test        eax,eax
>004F101E    je          004F103E
 004F1020    cmp         byte ptr [eax+29A],1
>004F1027    jne         004F103E
 004F1029    cmp         byte ptr [eax+59],0
>004F102D    jne         004F103E
 004F102F    xor         edx,edx
 004F1031    call        TCustomForm.SetWindowState
 004F1036    mov         eax,dword ptr [ebx+44]
 004F1039    call        TCustomForm.Show
 004F103E    mov         eax,ebx
 004F1040    call        TApplication.RestoreTopMosts
 004F1045    mov         dl,1
 004F1047    mov         eax,ebx
 004F1049    call        TApplication.DoShowOwnedPopups
 004F104E    mov         eax,[007932F0];Screen:TScreen
 004F1053    mov         esi,dword ptr [eax+60]
 004F1056    test        esi,esi
>004F1058    je          004F1067
 004F105A    mov         eax,esi
 004F105C    call        TWinControl.GetHandle
 004F1061    push        eax
 004F1062    call        user32.SetFocus
 004F1067    cmp         word ptr [ebx+152],0
>004F106F    je          004F107F
 004F1071    mov         edx,ebx
 004F1073    mov         eax,dword ptr [ebx+154]
 004F1079    call        dword ptr [ebx+150]
 004F107F    pop         esi
 004F1080    pop         ebx
 004F1081    ret
*}
end;

//004F1084
procedure TApplication.BringToFront;
begin
{*
 004F1084    push        ebx
 004F1085    push        esi
 004F1086    mov         ebx,eax
 004F1088    cmp         byte ptr [ebx+0D3],0
>004F108F    je          004F10A1
 004F1091    cmp         dword ptr [ebx+44],0
>004F1095    je          004F10A1
 004F1097    mov         eax,dword ptr [ebx+44]
 004F109A    call        TWinControl.GetHandle
>004F109F    jmp         004F10A7
 004F10A1    mov         eax,dword ptr [ebx+170]
 004F10A7    test        eax,eax
>004F10A9    je          004F10D9
 004F10AB    push        eax
 004F10AC    call        user32.GetLastActivePopup
 004F10B1    mov         esi,eax
 004F10B3    test        esi,esi
>004F10B5    je          004F10D9
 004F10B7    cmp         esi,dword ptr [ebx+170]
>004F10BD    je          004F10D9
 004F10BF    push        esi
 004F10C0    call        user32.IsWindowVisible
 004F10C5    test        eax,eax
>004F10C7    je          004F10D9
 004F10C9    push        esi
 004F10CA    call        user32.IsWindowEnabled
 004F10CF    test        eax,eax
>004F10D1    je          004F10D9
 004F10D3    push        esi
 004F10D4    call        user32.SetForegroundWindow
 004F10D9    pop         esi
 004F10DA    pop         ebx
 004F10DB    ret
*}
end;

//004F10DC
function TApplication.GetTitle:UnicodeString;
begin
{*
 004F10DC    push        ebx
 004F10DD    push        esi
 004F10DE    add         esp,0FFFFFDFC
 004F10E4    mov         esi,edx
 004F10E6    mov         ebx,eax
 004F10E8    cmp         byte ptr [ebx+0AC],0
>004F10EF    je          004F1147
 004F10F1    cmp         byte ptr [ebx+0D3],0
>004F10F8    jne         004F1147
 004F10FA    push        100
 004F10FF    lea         eax,[esp+4]
 004F1103    push        eax
 004F1104    mov         eax,dword ptr [ebx+170]
 004F110A    push        eax
 004F110B    call        user32.GetWindowTextW
 004F1110    mov         ecx,eax
 004F1112    mov         edx,esp
 004F1114    mov         eax,esi
 004F1116    call        @UStrFromPWCharLen
 004F111B    mov         eax,dword ptr [esi]
 004F111D    mov         dword ptr [esp+200],eax
 004F1124    mov         eax,dword ptr [esp+200]
 004F112B    test        eax,eax
>004F112D    je          004F1134
 004F112F    sub         eax,4
 004F1132    mov         eax,dword ptr [eax]
 004F1134    test        eax,eax
>004F1136    jne         004F1154
 004F1138    mov         eax,esi
 004F113A    mov         edx,dword ptr [ebx+8C]
 004F1140    call        @UStrAsg
>004F1145    jmp         004F1154
 004F1147    mov         eax,esi
 004F1149    mov         edx,dword ptr [ebx+8C]
 004F114F    call        @UStrAsg
 004F1154    add         esp,204
 004F115A    pop         esi
 004F115B    pop         ebx
 004F115C    ret
*}
end;

//004F1160
procedure TApplication.SetIcon(Value:TIcon);
begin
{*
 004F1160    mov         eax,dword ptr [eax+0A0]
 004F1166    mov         ecx,dword ptr [eax]
 004F1168    call        dword ptr [ecx+8]
 004F116B    ret
*}
end;

//004F116C
procedure TApplication.SetBiDiMode(Value:TBiDiMode);
begin
{*
 004F116C    push        ebx
 004F116D    push        esi
 004F116E    cmp         dl,byte ptr [eax+35]
>004F1171    je          004F11A8
 004F1173    mov         byte ptr [eax+35],dl
 004F1176    mov         eax,[007932F0];Screen:TScreen
 004F117B    call        TScreen.GetFormCount
 004F1180    mov         ebx,eax
 004F1182    dec         ebx
 004F1183    test        ebx,ebx
>004F1185    jl          004F11A8
 004F1187    inc         ebx
 004F1188    xor         esi,esi
 004F118A    push        0
 004F118C    mov         edx,esi
 004F118E    mov         eax,[007932F0];Screen:TScreen
 004F1193    call        TScreen.GetForm
 004F1198    xor         ecx,ecx
 004F119A    mov         edx,0B03D
 004F119F    call        TControl.Perform
 004F11A4    inc         esi
 004F11A5    dec         ebx
>004F11A6    jne         004F118A
 004F11A8    pop         esi
 004F11A9    pop         ebx
 004F11AA    ret
*}
end;

//004F11AC
procedure TApplication.SetDefaultFont(Value:TFont);
begin
{*
 004F11AC    push        esi
 004F11AD    mov         esi,eax
 004F11AF    mov         eax,dword ptr [esi+3C]
 004F11B2    mov         ecx,dword ptr [eax]
 004F11B4    call        dword ptr [ecx+8]
 004F11B7    pop         esi
 004F11B8    ret
*}
end;

//004F11BC
procedure TApplication.SetTitle(const Value:UnicodeString);
begin
{*
 004F11BC    push        ebx
 004F11BD    push        esi
 004F11BE    mov         esi,edx
 004F11C0    mov         ebx,eax
 004F11C2    mov         eax,dword ptr [ebx+8C]
 004F11C8    mov         edx,esi
 004F11CA    call        @UStrEqual
>004F11CF    je          004F1214
 004F11D1    cmp         byte ptr [ebx+0AC],0
>004F11D8    je          004F1207
 004F11DA    cmp         byte ptr [ebx+0D3],0
>004F11E1    je          004F11F3
 004F11E3    push        0
 004F11E5    mov         eax,dword ptr [ebx+170]
 004F11EB    push        eax
 004F11EC    call        user32.SetWindowTextW
>004F11F1    jmp         004F1207
 004F11F3    mov         eax,esi
 004F11F5    call        @UStrToPWChar
 004F11FA    push        eax
 004F11FB    mov         eax,dword ptr [ebx+170]
 004F1201    push        eax
 004F1202    call        user32.SetWindowTextW
 004F1207    lea         eax,[ebx+8C]
 004F120D    mov         edx,esi
 004F120F    call        @UStrAsg
 004F1214    pop         esi
 004F1215    pop         ebx
 004F1216    ret
*}
end;

//004F1218
procedure TApplication.SetHandle(Value:HWND);
begin
{*
 004F1218    push        ebx
 004F1219    push        esi
 004F121A    mov         esi,edx
 004F121C    mov         ebx,eax
 004F121E    cmp         byte ptr [ebx+0AC],0
>004F1225    jne         004F125C
 004F1227    cmp         esi,dword ptr [ebx+170]
>004F122D    je          004F125C
 004F122F    cmp         dword ptr [ebx+170],0
>004F1236    je          004F1245
 004F1238    push        ebx
 004F1239    push        4F0504;TApplication.CheckIniChange:Boolean
 004F123E    mov         eax,ebx
 004F1240    call        TApplication.UnhookMainWindow
 004F1245    mov         dword ptr [ebx+170],esi
 004F124B    test        esi,esi
>004F124D    je          004F125C
 004F124F    push        ebx
 004F1250    push        4F0504;TApplication.CheckIniChange:Boolean
 004F1255    mov         eax,ebx
 004F1257    call        TApplication.HookMainWindow
 004F125C    pop         esi
 004F125D    pop         ebx
 004F125E    ret
*}
end;

//004F1260
function TApplication.IsDlgMsg(var Msg:TMsg):Boolean;
begin
{*
 004F1260    push        ebx
 004F1261    push        esi
 004F1262    mov         esi,edx
 004F1264    mov         ebx,eax
 004F1266    xor         eax,eax
 004F1268    cmp         dword ptr [ebx+0B8],0
>004F126F    je          004F12A5
 004F1271    mov         eax,dword ptr [esi]
 004F1273    push        eax
 004F1274    call        user32.IsWindowUnicode
 004F1279    test        eax,eax
>004F127B    je          004F1292
 004F127D    push        esi
 004F127E    mov         eax,dword ptr [ebx+0B8]
 004F1284    push        eax
 004F1285    call        user32.IsDialogMessageW
 004F128A    cmp         eax,1
 004F128D    sbb         eax,eax
 004F128F    inc         eax
>004F1290    jmp         004F12A5
 004F1292    push        esi
 004F1293    mov         eax,dword ptr [ebx+0B8]
 004F1299    push        eax
 004F129A    call        user32.IsDialogMessageA
 004F129F    cmp         eax,1
 004F12A2    sbb         eax,eax
 004F12A4    inc         eax
 004F12A5    pop         esi
 004F12A6    pop         ebx
 004F12A7    ret
*}
end;

//004F12A8
function TApplication.IsMDIMsg(var Msg:TMsg):Boolean;
begin
{*
 004F12A8    push        ebx
 004F12A9    push        esi
 004F12AA    push        edi
 004F12AB    mov         edi,edx
 004F12AD    mov         ebx,eax
 004F12AF    xor         eax,eax
 004F12B1    mov         esi,dword ptr [ebx+44]
 004F12B4    test        esi,esi
>004F12B6    je          004F12F2
 004F12B8    cmp         byte ptr [esi+29E],2
>004F12BF    jne         004F12F2
 004F12C1    mov         edx,dword ptr ds:[7932F0];Screen:TScreen
 004F12C7    cmp         dword ptr [edx+68],0
>004F12CB    je          004F12F2
 004F12CD    mov         edx,dword ptr ds:[7932F0];Screen:TScreen
 004F12D3    mov         edx,dword ptr [edx+68]
 004F12D6    cmp         byte ptr [edx+29E],1
>004F12DD    jne         004F12F2
 004F12DF    push        edi
 004F12E0    mov         eax,dword ptr [esi+37C]
 004F12E6    push        eax
 004F12E7    call        user32.TranslateMDISysAccel
 004F12EC    cmp         eax,1
 004F12EF    sbb         eax,eax
 004F12F1    inc         eax
 004F12F2    pop         edi
 004F12F3    pop         esi
 004F12F4    pop         ebx
 004F12F5    ret
*}
end;

//004F12F8
function TApplication.IsKeyMsg(var Msg:TMsg):Boolean;
begin
{*
 004F12F8    push        ebx
 004F12F9    push        esi
 004F12FA    push        edi
 004F12FB    push        ebp
 004F12FC    add         esp,0FFFFFFF8
 004F12FF    mov         esi,edx
 004F1301    mov         edi,eax
 004F1303    xor         ebx,ebx
 004F1305    mov         eax,dword ptr [esi+4]
 004F1308    cmp         eax,100
>004F130D    jb          004F13E6
 004F1313    cmp         eax,109
>004F1318    ja          004F13E6
 004F131E    call        user32.GetCapture
 004F1323    mov         ebp,eax
 004F1325    test        ebp,ebp
>004F1327    jne         004F13A8
 004F1329    mov         ebp,dword ptr [esi]
 004F132B    mov         eax,dword ptr [edi+44]
 004F132E    test        eax,eax
>004F1330    je          004F134B
 004F1332    cmp         ebp,dword ptr [eax+37C]
>004F1338    jne         004F134B
 004F133A    call        TWinControl.GetHandle
 004F133F    mov         ebp,eax
>004F1341    jmp         004F1360
 004F1343    push        ebp
 004F1344    call        user32.GetParent
 004F1349    mov         ebp,eax
 004F134B    mov         eax,ebp
 004F134D    call        IsVCLControl
 004F1352    test        al,al
>004F1354    jne         004F135A
 004F1356    test        ebp,ebp
>004F1358    jne         004F1343
 004F135A    test        ebp,ebp
>004F135C    jne         004F1360
 004F135E    mov         ebp,dword ptr [esi]
 004F1360    push        ebp
 004F1361    call        user32.IsWindowUnicode
 004F1366    test        eax,eax
>004F1368    je          004F1389
 004F136A    mov         eax,dword ptr [esi+0C]
 004F136D    push        eax
 004F136E    mov         eax,dword ptr [esi+8]
 004F1371    push        eax
 004F1372    mov         eax,dword ptr [esi+4]
 004F1375    add         eax,0BC00
 004F137A    push        eax
 004F137B    push        ebp
 004F137C    call        user32.SendMessageW
 004F1381    test        eax,eax
>004F1383    je          004F13E6
 004F1385    mov         bl,1
>004F1387    jmp         004F13E6
 004F1389    mov         eax,dword ptr [esi+0C]
 004F138C    push        eax
 004F138D    mov         eax,dword ptr [esi+8]
 004F1390    push        eax
 004F1391    mov         eax,dword ptr [esi+4]
 004F1394    add         eax,0BC00
 004F1399    push        eax
 004F139A    push        ebp
 004F139B    call        user32.SendMessageA
 004F13A0    test        eax,eax
>004F13A2    je          004F13E6
 004F13A4    mov         bl,1
>004F13A6    jmp         004F13E6
 004F13A8    push        esp
 004F13A9    push        ebp
 004F13AA    call        user32.GetWindowThreadProcessId
 004F13AF    lea         eax,[esp+4]
 004F13B3    push        eax
 004F13B4    mov         eax,dword ptr [edi+170]
 004F13BA    push        eax
 004F13BB    call        user32.GetWindowThreadProcessId
 004F13C0    mov         eax,dword ptr [esp]
 004F13C3    cmp         eax,dword ptr [esp+4]
>004F13C7    jne         004F13E6
 004F13C9    mov         eax,dword ptr [esi+0C]
 004F13CC    push        eax
 004F13CD    mov         eax,dword ptr [esi+8]
 004F13D0    push        eax
 004F13D1    mov         eax,dword ptr [esi+4]
 004F13D4    add         eax,0BC00
 004F13D9    push        eax
 004F13DA    push        ebp
 004F13DB    call        user32.SendMessageW
 004F13E0    test        eax,eax
>004F13E2    je          004F13E6
 004F13E4    mov         bl,1
 004F13E6    mov         eax,ebx
 004F13E8    pop         ecx
 004F13E9    pop         edx
 004F13EA    pop         ebp
 004F13EB    pop         edi
 004F13EC    pop         esi
 004F13ED    pop         ebx
 004F13EE    ret
*}
end;

//004F13F0
function TApplication.IsHintMsg(var Msg:TMsg):Boolean;
begin
{*
 004F13F0    push        ebx
 004F13F1    push        esi
 004F13F2    push        edi
 004F13F3    push        ebp
 004F13F4    mov         edi,edx
 004F13F6    mov         ebp,eax
 004F13F8    xor         ebx,ebx
 004F13FA    mov         esi,dword ptr [ebp+84]
 004F1400    test        esi,esi
>004F1402    je          004F141B
 004F1404    mov         edx,edi
 004F1406    mov         eax,esi
 004F1408    mov         ecx,dword ptr [eax]
 004F140A    call        dword ptr [ecx+0F8]
 004F1410    test        al,al
>004F1412    je          004F141B
 004F1414    mov         eax,ebp
 004F1416    call        TApplication.CancelHint
 004F141B    mov         eax,ebx
 004F141D    pop         ebp
 004F141E    pop         edi
 004F141F    pop         esi
 004F1420    pop         ebx
 004F1421    ret
*}
end;

//004F1424
function TApplication.IsShortCut(var Message:TWMKey):Boolean;
begin
{*
 004F1424    push        ebx
 004F1425    push        esi
 004F1426    push        edi
 004F1427    push        ebp
 004F1428    push        ecx
 004F1429    mov         ebp,edx
 004F142B    mov         ebx,eax
 004F142D    mov         byte ptr [esp],0
 004F1431    cmp         word ptr [ebx+15A],0
>004F1439    je          004F144B
 004F143B    mov         ecx,esp
 004F143D    mov         edx,ebp
 004F143F    mov         eax,dword ptr [ebx+15C]
 004F1445    call        dword ptr [ebx+158]
 004F144B    cmp         byte ptr [esp],0
>004F144F    jne         004F147F
 004F1451    mov         edi,dword ptr [ebx+44]
 004F1454    test        edi,edi
>004F1456    je          004F147B
 004F1458    mov         eax,edi
 004F145A    call        TWinControl.GetHandle
 004F145F    push        eax
 004F1460    call        user32.IsWindowEnabled
 004F1465    test        eax,eax
>004F1467    je          004F147B
 004F1469    mov         edx,ebp
 004F146B    mov         eax,dword ptr [ebx+44]
 004F146E    mov         si,0FFA3
 004F1472    call        @CallDynaInst
 004F1477    test        al,al
>004F1479    jne         004F147F
 004F147B    xor         eax,eax
>004F147D    jmp         004F1481
 004F147F    mov         al,1
 004F1481    mov         byte ptr [esp],al
 004F1484    movzx       eax,byte ptr [esp]
 004F1488    pop         edx
 004F1489    pop         ebp
 004F148A    pop         edi
 004F148B    pop         esi
 004F148C    pop         ebx
 004F148D    ret
*}
end;

//004F1490
procedure TApplication.PopupControlProc(var Message:TMessage);
begin
{*
 004F1490    push        ebx
 004F1491    push        esi
 004F1492    push        edi
 004F1493    add         esp,0FFFFFFF0
 004F1496    mov         ebx,edx
 004F1498    mov         esi,eax
 004F149A    mov         edi,dword ptr [ebx]
 004F149C    mov         eax,edi
 004F149E    sub         eax,0B049
>004F14A3    jne         004F1532
 004F14A9    push        esi
 004F14AA    mov         esi,ebx
 004F14AC    lea         edi,[esp+4]
 004F14B0    movs        dword ptr [edi],dword ptr [esi]
 004F14B1    movs        dword ptr [edi],dword ptr [esi]
 004F14B2    movs        dword ptr [edi],dword ptr [esi]
 004F14B3    movs        dword ptr [edi],dword ptr [esi]
 004F14B4    pop         esi
 004F14B5    mov         eax,dword ptr [esi+0CC]
 004F14BB    call        @DynArrayHigh
 004F14C0    test        eax,eax
>004F14C2    jl          004F154A
 004F14C8    inc         eax
 004F14C9    xor         ebx,ebx
 004F14CB    lea         edi,[ebx+ebx*2]
 004F14CE    mov         edx,dword ptr [esi+0CC]
 004F14D4    mov         edx,dword ptr [edx+edi*4]
 004F14D7    cmp         edx,dword ptr [esp+4]
>004F14DB    jne         004F152C
 004F14DD    mov         edx,dword ptr [esi+0CC]
 004F14E3    cmp         dword ptr [edx+edi*4+4],0
>004F14E8    je          004F152C
 004F14EA    mov         eax,dword ptr [esi+0CC]
 004F14F0    cmp         byte ptr [eax+edi*4+8],0
>004F14F5    je          004F150C
 004F14F7    mov         eax,dword ptr [esi+0CC]
 004F14FD    mov         eax,dword ptr [eax+edi*4+4]
 004F1501    mov         edx,dword ptr [esp+8]
 004F1505    call        TCustomForm.RecreateAsPopup
>004F150A    jmp         004F154A
 004F150C    mov         eax,dword ptr [esi+0CC]
 004F1512    mov         eax,dword ptr [eax+edi*4+4]
 004F1516    call        TWinControl.HandleNeeded
 004F151B    mov         eax,dword ptr [esi+0CC]
 004F1521    mov         eax,dword ptr [eax+edi*4+4]
 004F1525    call        TWinControl.UpdateControlState
>004F152A    jmp         004F154A
 004F152C    inc         ebx
 004F152D    dec         eax
>004F152E    jne         004F14CB
>004F1530    jmp         004F154A
 004F1532    mov         eax,dword ptr [ebx+8]
 004F1535    push        eax
 004F1536    mov         eax,dword ptr [ebx+4]
 004F1539    push        eax
 004F153A    push        edi
 004F153B    mov         eax,dword ptr [esi+178]
 004F1541    push        eax
 004F1542    call        user32.DefWindowProcW
 004F1547    mov         dword ptr [ebx+0C],eax
 004F154A    add         esp,10
 004F154D    pop         edi
 004F154E    pop         esi
 004F154F    pop         ebx
 004F1550    ret
*}
end;

//004F1554
function TApplication.ProcessMessage(var Msg:TMsg):Boolean;
begin
{*
 004F1554    push        ebx
 004F1555    push        esi
 004F1556    push        edi
 004F1557    push        ebp
 004F1558    push        ecx
 004F1559    mov         edi,edx
 004F155B    mov         esi,eax
 004F155D    xor         ebx,ebx
 004F155F    push        0
 004F1561    push        0
 004F1563    push        0
 004F1565    push        0
 004F1567    push        edi
 004F1568    call        user32.PeekMessageW
 004F156D    test        eax,eax
>004F156F    je          004F165D
 004F1575    mov         ebp,dword ptr [edi]
 004F1577    test        ebp,ebp
>004F1579    je          004F1589
 004F157B    push        ebp
 004F157C    call        user32.IsWindowUnicode
 004F1581    test        eax,eax
>004F1583    jne         004F1589
 004F1585    xor         eax,eax
>004F1587    jmp         004F158B
 004F1589    mov         al,1
 004F158B    mov         byte ptr [esp+1],al
 004F158F    cmp         byte ptr [esp+1],0
>004F1594    je          004F15AC
 004F1596    push        1
 004F1598    push        0
 004F159A    push        0
 004F159C    push        0
 004F159E    push        edi
 004F159F    call        user32.PeekMessageW
 004F15A4    cmp         eax,1
 004F15A7    sbb         eax,eax
 004F15A9    inc         eax
>004F15AA    jmp         004F15C0
 004F15AC    push        1
 004F15AE    push        0
 004F15B0    push        0
 004F15B2    push        0
 004F15B4    push        edi
 004F15B5    call        user32.PeekMessageA
 004F15BA    cmp         eax,1
 004F15BD    sbb         eax,eax
 004F15BF    inc         eax
 004F15C0    test        al,al
>004F15C2    je          004F165D
 004F15C8    mov         bl,1
 004F15CA    cmp         dword ptr [edi+4],12
>004F15CE    je          004F1656
 004F15D4    mov         byte ptr [esp],0
 004F15D8    cmp         word ptr [esi+10A],0
>004F15E0    je          004F15F2
 004F15E2    mov         ecx,esp
 004F15E4    mov         edx,edi
 004F15E6    mov         eax,dword ptr [esi+10C]
 004F15EC    call        dword ptr [esi+108]
 004F15F2    mov         edx,edi
 004F15F4    mov         eax,esi
 004F15F6    call        TApplication.IsPreProcessMessage
 004F15FB    test        al,al
>004F15FD    jne         004F165D
 004F15FF    mov         edx,edi
 004F1601    mov         eax,esi
 004F1603    call        TApplication.IsHintMsg
 004F1608    test        al,al
>004F160A    jne         004F165D
 004F160C    cmp         byte ptr [esp],0
>004F1610    jne         004F165D
 004F1612    mov         edx,edi
 004F1614    mov         eax,esi
 004F1616    call        TApplication.IsMDIMsg
 004F161B    test        al,al
>004F161D    jne         004F165D
 004F161F    mov         edx,edi
 004F1621    mov         eax,esi
 004F1623    call        TApplication.IsKeyMsg
 004F1628    test        al,al
>004F162A    jne         004F165D
 004F162C    mov         edx,edi
 004F162E    mov         eax,esi
 004F1630    call        TApplication.IsDlgMsg
 004F1635    test        al,al
>004F1637    jne         004F165D
 004F1639    push        edi
 004F163A    call        user32.TranslateMessage
 004F163F    cmp         byte ptr [esp+1],0
>004F1644    je          004F164E
 004F1646    push        edi
 004F1647    call        user32.DispatchMessageW
>004F164C    jmp         004F165D
 004F164E    push        edi
 004F164F    call        user32.DispatchMessageA
>004F1654    jmp         004F165D
 004F1656    mov         byte ptr [esi+0A4],1
 004F165D    mov         eax,ebx
 004F165F    pop         edx
 004F1660    pop         ebp
 004F1661    pop         edi
 004F1662    pop         esi
 004F1663    pop         ebx
 004F1664    ret
*}
end;

//004F1668
procedure TApplication.ProcessMessages;
begin
{*
 004F1668    push        ebx
 004F1669    add         esp,0FFFFFFE4
 004F166C    mov         ebx,eax
 004F166E    mov         edx,esp
 004F1670    mov         eax,ebx
 004F1672    call        TApplication.ProcessMessage
 004F1677    test        al,al
>004F1679    jne         004F166E
 004F167B    add         esp,1C
 004F167E    pop         ebx
 004F167F    ret
*}
end;

//004F1680
procedure TApplication.HandleMessage;
begin
{*
 004F1680    push        ebx
 004F1681    add         esp,0FFFFFFE4
 004F1684    mov         ebx,eax
 004F1686    mov         edx,esp
 004F1688    mov         eax,ebx
 004F168A    call        TApplication.ProcessMessage
 004F168F    test        al,al
>004F1691    jne         004F169C
 004F1693    mov         edx,esp
 004F1695    mov         eax,ebx
 004F1697    call        TApplication.Idle
 004F169C    add         esp,1C
 004F169F    pop         ebx
 004F16A0    ret
*}
end;

//004F16A4
procedure TApplication.HookMainWindow(Hook:TWindowHook);
begin
{*
 004F16A4    push        ebp
 004F16A5    mov         ebp,esp
 004F16A7    push        ebx
 004F16A8    mov         ebx,eax
 004F16AA    cmp         byte ptr [ebx+0AC],0
>004F16B1    jne         004F16D0
 004F16B3    mov         eax,dword ptr [ebx+170]
 004F16B9    test        eax,eax
>004F16BB    je          004F16FD
 004F16BD    lea         edx,[ebp+8]
 004F16C0    push        edx
 004F16C1    push        0
 004F16C3    push        0B020
 004F16C8    push        eax
 004F16C9    call        user32.SendMessageW
>004F16CE    jmp         004F16FD
 004F16D0    mov         eax,dword ptr [ebx+0B0]
 004F16D6    call        TList.Expand
 004F16DB    mov         eax,8
 004F16E0    call        @GetMem
 004F16E5    mov         edx,dword ptr [ebp+8]
 004F16E8    mov         dword ptr [eax],edx
 004F16EA    mov         edx,dword ptr [ebp+0C]
 004F16ED    mov         dword ptr [eax+4],edx
 004F16F0    mov         edx,eax
 004F16F2    mov         eax,dword ptr [ebx+0B0]
 004F16F8    call        TList.Add
 004F16FD    pop         ebx
 004F16FE    pop         ebp
 004F16FF    ret         8
*}
end;

//004F1704
procedure TApplication.UnhookMainWindow(Hook:TWindowHook);
begin
{*
 004F1704    push        ebp
 004F1705    mov         ebp,esp
 004F1707    push        ebx
 004F1708    push        esi
 004F1709    push        edi
 004F170A    mov         ebx,eax
 004F170C    cmp         byte ptr [ebx+0AC],0
>004F1713    jne         004F1732
 004F1715    mov         eax,dword ptr [ebx+170]
 004F171B    test        eax,eax
>004F171D    je          004F177C
 004F171F    lea         edx,[ebp+8]
 004F1722    push        edx
 004F1723    push        1
 004F1725    push        0B020
 004F172A    push        eax
 004F172B    call        user32.SendMessageW
>004F1730    jmp         004F177C
 004F1732    mov         eax,dword ptr [ebx+0B0]
 004F1738    mov         edi,dword ptr [eax+8]
 004F173B    dec         edi
 004F173C    test        edi,edi
>004F173E    jl          004F177C
 004F1740    inc         edi
 004F1741    xor         esi,esi
 004F1743    mov         edx,esi
 004F1745    mov         eax,dword ptr [ebx+0B0]
 004F174B    call        TList.Get
 004F1750    mov         edx,dword ptr [eax]
 004F1752    cmp         edx,dword ptr [ebp+8]
>004F1755    jne         004F1778
 004F1757    mov         edx,dword ptr [ebp+0C]
 004F175A    cmp         edx,dword ptr [eax+4]
>004F175D    jne         004F1778
 004F175F    mov         edx,8
 004F1764    call        @FreeMem
 004F1769    mov         edx,esi
 004F176B    mov         eax,dword ptr [ebx+0B0]
 004F1771    call        TList.Delete
>004F1776    jmp         004F177C
 004F1778    inc         esi
 004F1779    dec         edi
>004F177A    jne         004F1743
 004F177C    pop         edi
 004F177D    pop         esi
 004F177E    pop         ebx
 004F177F    pop         ebp
 004F1780    ret         8
*}
end;

//004F1784
procedure TApplication.Initialize;
begin
{*
 004F1784    push        ebx
 004F1785    mov         eax,[0078D308];InitProc:Pointer
 004F178A    cmp         dword ptr [eax],0
>004F178D    je          004F1799
 004F178F    mov         ebx,dword ptr ds:[78D308];InitProc:Pointer
 004F1795    mov         ebx,dword ptr [ebx]
 004F1797    call        ebx
 004F1799    pop         ebx
 004F179A    ret
*}
end;

//004F179C
{*procedure TApplication.CreateForm(InstanceClass:TComponentClass; var Reference:?);
begin
 004F179C    push        ebp
 004F179D    mov         ebp,esp
 004F179F    add         esp,0FFFFFFF4
 004F17A2    push        ebx
 004F17A3    push        esi
 004F17A4    push        edi
 004F17A5    mov         dword ptr [ebp-8],ecx
 004F17A8    mov         ebx,edx
 004F17AA    mov         dword ptr [ebp-4],eax
 004F17AD    mov         eax,dword ptr [ebp-4]
 004F17B0    cmp         dword ptr [eax+44],0
>004F17B4    jne         004F17C7
 004F17B6    mov         edx,dword ptr ds:[4E0C38];TForm
 004F17BC    mov         eax,ebx
 004F17BE    call        TObject.InheritsFrom
 004F17C3    test        al,al
>004F17C5    jne         004F17CB
 004F17C7    xor         eax,eax
>004F17C9    jmp         004F17CD
 004F17CB    mov         al,1
 004F17CD    mov         edx,dword ptr [ebp-4]
 004F17D0    mov         byte ptr [edx+0D1],al
 004F17D6    xor         eax,eax
 004F17D8    mov         dword ptr [ebp-0C],eax
 004F17DB    xor         edx,edx
 004F17DD    push        ebp
 004F17DE    push        4F18DC
 004F17E3    push        dword ptr fs:[edx]
 004F17E6    mov         dword ptr fs:[edx],esp
 004F17E9    mov         eax,ebx
 004F17EB    call        dword ptr [eax-0C]
 004F17EE    mov         dword ptr [ebp-0C],eax
 004F17F1    mov         eax,dword ptr [ebp-8]
 004F17F4    mov         edx,dword ptr [ebp-0C]
 004F17F7    mov         dword ptr [eax],edx
 004F17F9    xor         eax,eax
 004F17FB    push        ebp
 004F17FC    push        4F181F
 004F1801    push        dword ptr fs:[eax]
 004F1804    mov         dword ptr fs:[eax],esp
 004F1807    mov         ecx,dword ptr [ebp-4]
 004F180A    or          edx,0FFFFFFFF
 004F180D    mov         eax,dword ptr [ebp-0C]
 004F1810    mov         ebx,dword ptr [eax]
 004F1812    call        dword ptr [ebx+2C]
 004F1815    xor         eax,eax
 004F1817    pop         edx
 004F1818    pop         ecx
 004F1819    pop         ecx
 004F181A    mov         dword ptr fs:[eax],edx
>004F181D    jmp         004F1835
>004F181F    jmp         @HandleAnyException
 004F1824    mov         eax,dword ptr [ebp-8]
 004F1827    xor         edx,edx
 004F1829    mov         dword ptr [eax],edx
 004F182B    call        @RaiseAgain
 004F1830    call        @DoneExcept
 004F1835    mov         eax,dword ptr [ebp-4]
 004F1838    cmp         dword ptr [eax+44],0
>004F183C    jne         004F18A9
 004F183E    mov         eax,dword ptr [ebp-0C]
 004F1841    mov         edx,dword ptr ds:[4E0C38];TForm
 004F1847    call        @IsClass
 004F184C    test        al,al
>004F184E    je          004F18A9
 004F1850    mov         ebx,dword ptr [ebp-0C]
 004F1853    mov         eax,ebx
 004F1855    call        TWinControl.HandleNeeded
 004F185A    mov         eax,dword ptr [ebp-4]
 004F185D    mov         dword ptr [eax+44],ebx
 004F1860    mov         eax,dword ptr [ebp-4]
 004F1863    cmp         byte ptr [eax+0D3],0
>004F186A    je          004F188B
 004F186C    push        0EC
 004F186E    mov         eax,dword ptr [ebp-4]
 004F1871    mov         ebx,dword ptr [eax+170]
 004F1877    push        ebx
 004F1878    call        user32.GetWindowLongW
 004F187D    or          eax,8000000
 004F1882    push        eax
 004F1883    push        0EC
 004F1885    push        ebx
 004F1886    call        user32.SetWindowLongW
 004F188B    mov         eax,dword ptr [ebp-4]
 004F188E    movzx       eax,byte ptr [eax+0D3]
 004F1895    xor         al,1
 004F1897    mov         ecx,eax
 004F1899    mov         edx,eax
 004F189B    mov         eax,dword ptr [ebp-4]
 004F189E    mov         eax,dword ptr [eax+170]
 004F18A4    call        ChangeAppWindow
 004F18A9    xor         eax,eax
 004F18AB    pop         edx
 004F18AC    pop         ecx
 004F18AD    pop         ecx
 004F18AE    mov         dword ptr fs:[eax],edx
 004F18B1    push        4F18E3
 004F18B6    mov         eax,dword ptr [ebp-4]
 004F18B9    cmp         dword ptr [eax+44],0
>004F18BD    jne         004F18DB
 004F18BF    mov         eax,dword ptr [ebp-0C]
 004F18C2    mov         edx,dword ptr ds:[4E0C38];TForm
 004F18C8    call        @IsClass
 004F18CD    test        al,al
>004F18CF    je          004F18DB
 004F18D1    mov         eax,dword ptr [ebp-0C]
 004F18D4    mov         byte ptr [eax+370],0
 004F18DB    ret
>004F18DC    jmp         @HandleFinally
>004F18E1    jmp         004F18B6
 004F18E3    pop         edi
 004F18E4    pop         esi
 004F18E5    pop         ebx
 004F18E6    mov         esp,ebp
 004F18E8    pop         ebp
 004F18E9    ret
end;*}

//004F18EC
procedure TApplication.Run;
begin
{*
 004F18EC    push        ebp
 004F18ED    mov         ebp,esp
 004F18EF    push        ecx
 004F18F0    push        ebx
 004F18F1    push        esi
 004F18F2    push        edi
 004F18F3    mov         dword ptr [ebp-4],eax
 004F18F6    mov         eax,dword ptr [ebp-4]
 004F18F9    mov         byte ptr [eax+0AD],1
 004F1900    xor         edx,edx
 004F1902    push        ebp
 004F1903    push        4F19FD
 004F1908    push        dword ptr fs:[edx]
 004F190B    mov         dword ptr fs:[edx],esp
 004F190E    mov         eax,4E53CC;DoneApplication
 004F1913    call        AddExitProc
 004F1918    mov         eax,dword ptr [ebp-4]
 004F191B    mov         eax,dword ptr [eax+44]
 004F191E    test        eax,eax
>004F1920    je          004F19E5
 004F1926    mov         edx,dword ptr ds:[78D4C8];CmdShow:Integer
 004F192C    mov         edx,dword ptr [edx]
 004F192E    sub         edx,3
>004F1931    je          004F1951
 004F1933    sub         edx,4
>004F1936    jne         004F1958
 004F1938    mov         eax,dword ptr [ebp-4]
 004F193B    mov         byte ptr [eax+0DC],1
 004F1942    mov         eax,dword ptr [ebp-4]
 004F1945    mov         eax,dword ptr [eax+44]
 004F1948    mov         byte ptr [eax+29A],1
>004F194F    jmp         004F1958
 004F1951    mov         dl,2
 004F1953    call        TCustomForm.SetWindowState
 004F1958    mov         eax,dword ptr [ebp-4]
 004F195B    cmp         byte ptr [eax+5B],0
>004F195F    je          004F19A4
 004F1961    mov         eax,dword ptr [ebp-4]
 004F1964    mov         eax,dword ptr [eax+44]
 004F1967    cmp         byte ptr [eax+29A],1
>004F196E    je          004F197C
 004F1970    mov         edx,dword ptr [ebp-4]
 004F1973    cmp         byte ptr [edx+0DC],1
>004F197A    jne         004F199D
 004F197C    mov         eax,dword ptr [ebp-4]
 004F197F    call        TApplication.Minimize
 004F1984    mov         eax,dword ptr [ebp-4]
 004F1987    cmp         byte ptr [eax+0DC],1
>004F198E    jne         004F19A4
 004F1990    mov         eax,dword ptr [ebp-4]
 004F1993    mov         eax,dword ptr [eax+44]
 004F1996    call        TCustomForm.Show
>004F199B    jmp         004F19A4
 004F199D    mov         dl,1
 004F199F    call        TCustomForm.SetVisible
 004F19A4    xor         eax,eax
 004F19A6    push        ebp
 004F19A7    push        4F19C4
 004F19AC    push        dword ptr fs:[eax]
 004F19AF    mov         dword ptr fs:[eax],esp
 004F19B2    mov         eax,dword ptr [ebp-4]
 004F19B5    call        TApplication.HandleMessage
 004F19BA    xor         eax,eax
 004F19BC    pop         edx
 004F19BD    pop         ecx
 004F19BE    pop         ecx
 004F19BF    mov         dword ptr fs:[eax],edx
>004F19C2    jmp         004F19D9
>004F19C4    jmp         @HandleAnyException
 004F19C9    mov         edx,dword ptr [ebp-4]
 004F19CC    mov         eax,dword ptr [ebp-4]
 004F19CF    call        TApplication.HandleException
 004F19D4    call        @DoneExcept
 004F19D9    mov         eax,dword ptr [ebp-4]
 004F19DC    cmp         byte ptr [eax+0A4],0
>004F19E3    je          004F19A4
 004F19E5    xor         eax,eax
 004F19E7    pop         edx
 004F19E8    pop         ecx
 004F19E9    pop         ecx
 004F19EA    mov         dword ptr fs:[eax],edx
 004F19ED    push        4F1A04
 004F19F2    mov         eax,dword ptr [ebp-4]
 004F19F5    mov         byte ptr [eax+0AD],0
 004F19FC    ret
>004F19FD    jmp         @HandleFinally
>004F1A02    jmp         004F19F2
 004F1A04    pop         edi
 004F1A05    pop         esi
 004F1A06    pop         ebx
 004F1A07    pop         ecx
 004F1A08    pop         ebp
 004F1A09    ret
*}
end;

//004F1A0C
procedure TApplication.Terminate;
begin
{*
 004F1A0C    call        CallTerminateProcs
 004F1A11    test        al,al
>004F1A13    je          004F1A1C
 004F1A15    push        0
 004F1A17    call        user32.PostQuitMessage
 004F1A1C    ret
*}
end;

//004F1A20
function IsClass(Obj:TObject; Cls:TClass):Boolean;
begin
{*
 004F1A20    push        ebp
 004F1A21    mov         ebp,esp
 004F1A23    push        0
 004F1A25    push        0
 004F1A27    push        ebx
 004F1A28    push        esi
 004F1A29    mov         esi,edx
 004F1A2B    xor         edx,edx
 004F1A2D    push        ebp
 004F1A2E    push        4F1A93
 004F1A33    push        dword ptr fs:[edx]
 004F1A36    mov         dword ptr fs:[edx],esp
 004F1A39    mov         eax,dword ptr [eax]
 004F1A3B    mov         edx,eax
 004F1A3D    mov         ebx,edx
>004F1A3F    jmp         004F1A4A
 004F1A41    mov         eax,ebx
 004F1A43    call        TObject.ClassParent
 004F1A48    mov         ebx,eax
 004F1A4A    test        ebx,ebx
>004F1A4C    je          004F1A71
 004F1A4E    lea         edx,[ebp-4]
 004F1A51    mov         eax,ebx
 004F1A53    call        TObject.ClassName
 004F1A58    mov         eax,dword ptr [ebp-4]
 004F1A5B    push        eax
 004F1A5C    lea         edx,[ebp-8]
 004F1A5F    mov         eax,esi
 004F1A61    call        TObject.ClassName
 004F1A66    mov         edx,dword ptr [ebp-8]
 004F1A69    pop         eax
 004F1A6A    call        @UStrEqual
>004F1A6F    jne         004F1A41
 004F1A71    test        ebx,ebx
 004F1A73    setne       al
 004F1A76    mov         ebx,eax
 004F1A78    xor         eax,eax
 004F1A7A    pop         edx
 004F1A7B    pop         ecx
 004F1A7C    pop         ecx
 004F1A7D    mov         dword ptr fs:[eax],edx
 004F1A80    push        4F1A9A
 004F1A85    lea         eax,[ebp-8]
 004F1A88    mov         edx,2
 004F1A8D    call        @UStrArrayClr
 004F1A92    ret
>004F1A93    jmp         @HandleFinally
>004F1A98    jmp         004F1A85
 004F1A9A    mov         eax,ebx
 004F1A9C    pop         esi
 004F1A9D    pop         ebx
 004F1A9E    pop         ecx
 004F1A9F    pop         ecx
 004F1AA0    pop         ebp
 004F1AA1    ret
*}
end;

//004F1AA4
procedure TApplication.HandleException(Sender:TObject);
begin
{*
 004F1AA4    push        ebx
 004F1AA5    push        esi
 004F1AA6    push        edi
 004F1AA7    mov         edi,edx
 004F1AA9    mov         esi,eax
 004F1AAB    call        user32.GetCapture
 004F1AB0    test        eax,eax
>004F1AB2    je          004F1AC5
 004F1AB4    push        0
 004F1AB6    push        0
 004F1AB8    push        1F
 004F1ABA    call        user32.GetCapture
 004F1ABF    push        eax
 004F1AC0    call        user32.SendMessageW
 004F1AC5    call        ExceptObject
 004F1ACA    mov         ebx,eax
 004F1ACC    mov         edx,dword ptr ds:[418C04];Exception
 004F1AD2    mov         eax,ebx
 004F1AD4    call        IsClass
 004F1AD9    test        al,al
>004F1ADB    je          004F1B15
 004F1ADD    mov         edx,dword ptr ds:[4195F4];EAbort
 004F1AE3    mov         eax,ebx
 004F1AE5    call        IsClass
 004F1AEA    test        al,al
>004F1AEC    jne         004F1B23
 004F1AEE    cmp         word ptr [esi+0F2],0
>004F1AF6    je          004F1B0A
 004F1AF8    mov         ecx,ebx
 004F1AFA    mov         edx,edi
 004F1AFC    mov         eax,dword ptr [esi+0F4]
 004F1B02    call        dword ptr [esi+0F0]
>004F1B08    jmp         004F1B23
 004F1B0A    mov         edx,ebx
 004F1B0C    mov         eax,esi
 004F1B0E    call        TApplication.ShowException
>004F1B13    jmp         004F1B23
 004F1B15    call        ExceptAddr
 004F1B1A    mov         edx,eax
 004F1B1C    mov         eax,ebx
 004F1B1E    call        ShowException
 004F1B23    pop         edi
 004F1B24    pop         esi
 004F1B25    pop         ebx
 004F1B26    ret
*}
end;

//004F1B28
function TApplication.MessageBox(Text:PWideChar; Caption:PWideChar; Flags:Integer):Integer;
begin
{*
 004F1B28    push        ebp
 004F1B29    mov         ebp,esp
 004F1B2B    add         esp,0FFFFFFA8
 004F1B2E    push        ebx
 004F1B2F    push        esi
 004F1B30    push        edi
 004F1B31    mov         dword ptr [ebp-8],ecx
 004F1B34    mov         edi,edx
 004F1B36    mov         dword ptr [ebp-4],eax
 004F1B39    mov         esi,dword ptr [ebp+8]
 004F1B3C    mov         eax,dword ptr [ebp-4]
 004F1B3F    call        TApplication.GetActiveFormHandle
 004F1B44    mov         dword ptr [ebp-10],eax
 004F1B47    cmp         dword ptr [ebp-10],0
>004F1B4B    jne         004F1B58
 004F1B4D    mov         eax,dword ptr [ebp-4]
 004F1B50    mov         ebx,dword ptr [eax+170]
>004F1B56    jmp         004F1B5B
 004F1B58    mov         ebx,dword ptr [ebp-10]
 004F1B5B    push        2
 004F1B5D    mov         eax,dword ptr [ebp-10]
 004F1B60    push        eax
 004F1B61    call        user32.MonitorFromWindow
 004F1B66    mov         dword ptr [ebp-14],eax
 004F1B69    push        2
 004F1B6B    mov         eax,dword ptr [ebp-4]
 004F1B6E    mov         eax,dword ptr [eax+170]
 004F1B74    push        eax
 004F1B75    call        user32.MonitorFromWindow
 004F1B7A    mov         dword ptr [ebp-18],eax
 004F1B7D    mov         eax,dword ptr [ebp-14]
 004F1B80    cmp         eax,dword ptr [ebp-18]
>004F1B83    je          004F1BE7
 004F1B85    mov         dword ptr [ebp-48],28
 004F1B8C    lea         eax,[ebp-48]
 004F1B8F    push        eax
 004F1B90    mov         eax,dword ptr [ebp-14]
 004F1B93    push        eax
 004F1B94    call        user32.GetMonitorInfoW
 004F1B99    lea         eax,[ebp-58]
 004F1B9C    push        eax
 004F1B9D    mov         eax,dword ptr [ebp-4]
 004F1BA0    mov         eax,dword ptr [eax+170]
 004F1BA6    push        eax
 004F1BA7    call        user32.GetWindowRect
 004F1BAC    push        1D
 004F1BAE    push        0
 004F1BB0    push        0
 004F1BB2    mov         ecx,dword ptr [ebp-38]
 004F1BB5    mov         edx,dword ptr [ebp-40]
 004F1BB8    sub         ecx,edx
 004F1BBA    sar         ecx,1
>004F1BBC    jns         004F1BC1
 004F1BBE    adc         ecx,0
 004F1BC1    add         ecx,edx
 004F1BC3    push        ecx
 004F1BC4    mov         edx,dword ptr [ebp-3C]
 004F1BC7    mov         eax,dword ptr [ebp-44]
 004F1BCA    sub         edx,eax
 004F1BCC    sar         edx,1
>004F1BCE    jns         004F1BD3
 004F1BD0    adc         edx,0
 004F1BD3    add         edx,eax
 004F1BD5    push        edx
 004F1BD6    push        0
 004F1BD8    mov         eax,dword ptr [ebp-4]
 004F1BDB    mov         eax,dword ptr [eax+170]
 004F1BE1    push        eax
 004F1BE2    call        user32.SetWindowPos
 004F1BE7    mov         eax,dword ptr [ebp-10]
 004F1BEA    call        DisableTaskWindows
 004F1BEF    mov         dword ptr [ebp-20],eax
 004F1BF2    call        SaveFocusState
 004F1BF7    mov         dword ptr [ebp-1C],eax
 004F1BFA    mov         eax,dword ptr [ebp-4]
 004F1BFD    call        TApplication.UseRightToLeftReading
 004F1C02    test        al,al
>004F1C04    je          004F1C0C
 004F1C06    or          esi,100000
 004F1C0C    xor         ecx,ecx
 004F1C0E    push        ebp
 004F1C0F    push        4F1C93
 004F1C14    push        dword ptr fs:[ecx]
 004F1C17    mov         dword ptr fs:[ecx],esp
 004F1C1A    push        esi
 004F1C1B    mov         eax,dword ptr [ebp-8]
 004F1C1E    push        eax
 004F1C1F    push        edi
 004F1C20    push        ebx
 004F1C21    call        user32.MessageBoxW
 004F1C26    mov         dword ptr [ebp-0C],eax
 004F1C29    xor         eax,eax
 004F1C2B    pop         edx
 004F1C2C    pop         ecx
 004F1C2D    pop         ecx
 004F1C2E    mov         dword ptr fs:[eax],edx
 004F1C31    push        4F1C9A
 004F1C36    mov         eax,dword ptr [ebp-14]
 004F1C39    cmp         eax,dword ptr [ebp-18]
>004F1C3C    je          004F1C79
 004F1C3E    push        1D
 004F1C40    push        0
 004F1C42    push        0
 004F1C44    mov         ecx,dword ptr [ebp-4C]
 004F1C47    mov         edx,dword ptr [ebp-54]
 004F1C4A    sub         ecx,edx
 004F1C4C    sar         ecx,1
>004F1C4E    jns         004F1C53
 004F1C50    adc         ecx,0
 004F1C53    add         ecx,edx
 004F1C55    push        ecx
 004F1C56    mov         edx,dword ptr [ebp-50]
 004F1C59    mov         eax,dword ptr [ebp-58]
 004F1C5C    sub         edx,eax
 004F1C5E    sar         edx,1
>004F1C60    jns         004F1C65
 004F1C62    adc         edx,0
 004F1C65    add         edx,eax
 004F1C67    push        edx
 004F1C68    push        0
 004F1C6A    mov         eax,dword ptr [ebp-4]
 004F1C6D    mov         eax,dword ptr [eax+170]
 004F1C73    push        eax
 004F1C74    call        user32.SetWindowPos
 004F1C79    mov         eax,dword ptr [ebp-20]
 004F1C7C    call        EnableTaskWindows
 004F1C81    mov         eax,dword ptr [ebp-10]
 004F1C84    push        eax
 004F1C85    call        user32.SetActiveWindow
 004F1C8A    mov         eax,dword ptr [ebp-1C]
 004F1C8D    call        RestoreFocusState
 004F1C92    ret
>004F1C93    jmp         @HandleFinally
>004F1C98    jmp         004F1C36
 004F1C9A    mov         eax,dword ptr [ebp-0C]
 004F1C9D    pop         edi
 004F1C9E    pop         esi
 004F1C9F    pop         ebx
 004F1CA0    mov         esp,ebp
 004F1CA2    pop         ebp
 004F1CA3    ret         4
*}
end;

//004F1CA8
procedure TApplication.ShowException(E:Exception);
begin
{*
 004F1CA8    push        ebp
 004F1CA9    mov         ebp,esp
 004F1CAB    push        0
 004F1CAD    push        0
 004F1CAF    push        ebx
 004F1CB0    push        esi
 004F1CB1    push        edi
 004F1CB2    mov         ebx,edx
 004F1CB4    mov         edi,eax
 004F1CB6    xor         eax,eax
 004F1CB8    push        ebp
 004F1CB9    push        4F1D5D
 004F1CBE    push        dword ptr fs:[eax]
 004F1CC1    mov         dword ptr fs:[eax],esp
 004F1CC4    lea         eax,[ebp-4]
 004F1CC7    mov         edx,dword ptr [ebx+4]
 004F1CCA    call        @UStrLAsg
 004F1CCF    mov         eax,ebx
 004F1CD1    mov         edx,dword ptr [eax]
 004F1CD3    call        dword ptr [edx+4]
 004F1CD6    mov         esi,eax
 004F1CD8    cmp         ebx,esi
>004F1CDA    je          004F1CF1
 004F1CDC    mov         ebx,esi
 004F1CDE    cmp         dword ptr [ebx+4],0
>004F1CE2    je          004F1CCF
 004F1CE4    lea         eax,[ebp-4]
 004F1CE7    mov         edx,dword ptr [ebx+4]
 004F1CEA    call        @UStrLAsg
>004F1CEF    jmp         004F1CCF
 004F1CF1    cmp         dword ptr [ebp-4],0
>004F1CF5    je          004F1D1B
 004F1CF7    mov         eax,dword ptr [ebp-4]
 004F1CFA    test        eax,eax
>004F1CFC    je          004F1D03
 004F1CFE    sub         eax,4
 004F1D01    mov         eax,dword ptr [eax]
 004F1D03    mov         edx,dword ptr [ebp-4]
 004F1D06    cmp         word ptr [edx+eax*2-2],2E
>004F1D0C    jbe         004F1D1B
 004F1D0E    lea         eax,[ebp-4]
 004F1D11    mov         edx,4F1D78;'.'
 004F1D16    call        @UStrCat
 004F1D1B    push        10
 004F1D1D    lea         edx,[ebp-8]
 004F1D20    mov         eax,edi
 004F1D22    call        TApplication.GetTitle
 004F1D27    mov         eax,dword ptr [ebp-8]
 004F1D2A    call        @UStrToPWChar
 004F1D2F    push        eax
 004F1D30    mov         eax,dword ptr [ebp-4]
 004F1D33    call        @UStrToPWChar
 004F1D38    mov         edx,eax
 004F1D3A    mov         eax,edi
 004F1D3C    pop         ecx
 004F1D3D    call        TApplication.MessageBox
 004F1D42    xor         eax,eax
 004F1D44    pop         edx
 004F1D45    pop         ecx
 004F1D46    pop         ecx
 004F1D47    mov         dword ptr fs:[eax],edx
 004F1D4A    push        4F1D64
 004F1D4F    lea         eax,[ebp-8]
 004F1D52    mov         edx,2
 004F1D57    call        @UStrArrayClr
 004F1D5C    ret
>004F1D5D    jmp         @HandleFinally
>004F1D62    jmp         004F1D4F
 004F1D64    pop         edi
 004F1D65    pop         esi
 004F1D66    pop         ebx
 004F1D67    pop         ecx
 004F1D68    pop         ecx
 004F1D69    pop         ebp
 004F1D6A    ret
*}
end;

//004F1D7C
function TApplication.InvokeHelp(Command:Word; Data:LongInt):Boolean;
begin
{*
 004F1D7C    push        ebx
 004F1D7D    push        esi
 004F1D7E    push        edi
 004F1D7F    push        ebp
 004F1D80    add         esp,0FFFFFFF4
 004F1D83    mov         dword ptr [esp],ecx
 004F1D86    mov         ebp,edx
 004F1D88    mov         esi,eax
 004F1D8A    xor         edi,edi
 004F1D8C    mov         byte ptr [esp+4],1
 004F1D91    lea         eax,[esp+4]
 004F1D95    push        eax
 004F1D96    mov         ecx,dword ptr [esp+4]
 004F1D9A    mov         edx,ebp
 004F1D9C    mov         eax,esi
 004F1D9E    call        TApplication.DoOnHelp
 004F1DA3    mov         ebx,eax
 004F1DA5    test        bl,bl
>004F1DA7    jne         004F1DE5
 004F1DA9    mov         eax,[007932F0];Screen:TScreen
 004F1DAE    mov         edi,dword ptr [eax+64]
 004F1DB1    test        edi,edi
>004F1DB3    je          004F1DC0
 004F1DB5    test        byte ptr [edi+1C],10
>004F1DB9    je          004F1DC0
 004F1DBB    mov         byte ptr [esp+4],0
 004F1DC0    test        edi,edi
>004F1DC2    je          004F1DE5
 004F1DC4    mov         eax,edi
 004F1DC6    call        TWinControl.GetTabOrder
 004F1DCB    cmp         ax,0FFFFFFFF
>004F1DCF    jne         004F1DE5
 004F1DD1    cmp         byte ptr [edi+59],0
>004F1DD5    jne         004F1DE5
 004F1DD7    cmp         dword ptr [edi+290],0
>004F1DDE    jne         004F1DE5
 004F1DE0    mov         byte ptr [esp+4],0
 004F1DE5    cmp         byte ptr [esp+4],0
>004F1DEA    je          004F1EA4
 004F1DF0    test        edi,edi
>004F1DF2    je          004F1E3E
 004F1DF4    mov         eax,edi
 004F1DF6    call        TWinControl.HandleAllocated
 004F1DFB    test        al,al
>004F1DFD    je          004F1E3E
 004F1DFF    cmp         dword ptr [edi+2A8],0
>004F1E06    je          004F1E3E
 004F1E08    mov         eax,edi
 004F1E0A    call        TWinControl.GetHandle
 004F1E0F    mov         dword ptr [esp+8],eax
 004F1E13    mov         eax,esi
 004F1E15    call        TApplication.ValidateHelpSystem
 004F1E1A    test        al,al
>004F1E1C    je          004F1EA4
 004F1E22    push        ebp
 004F1E23    mov         eax,dword ptr [esp+4]
 004F1E27    push        eax
 004F1E28    mov         ecx,dword ptr [edi+2A8]
 004F1E2E    mov         edx,dword ptr [esp+10]
 004F1E32    mov         eax,dword ptr [esi+4C]
 004F1E35    mov         ebx,dword ptr [eax]
 004F1E37    call        dword ptr [ebx+20]
 004F1E3A    mov         ebx,eax
>004F1E3C    jmp         004F1EA4
 004F1E3E    cmp         dword ptr [esi+50],0
>004F1E42    je          004F1E82
 004F1E44    mov         eax,dword ptr [esi+170]
 004F1E4A    mov         dword ptr [esp+8],eax
 004F1E4E    mov         eax,dword ptr [esi+44]
 004F1E51    test        eax,eax
>004F1E53    je          004F1E5E
 004F1E55    call        TWinControl.GetHandle
 004F1E5A    mov         dword ptr [esp+8],eax
 004F1E5E    mov         eax,esi
 004F1E60    call        TApplication.ValidateHelpSystem
 004F1E65    test        al,al
>004F1E67    je          004F1EA4
 004F1E69    push        ebp
 004F1E6A    mov         eax,dword ptr [esp+4]
 004F1E6E    push        eax
 004F1E6F    mov         ecx,dword ptr [esi+50]
 004F1E72    mov         edx,dword ptr [esp+10]
 004F1E76    mov         eax,dword ptr [esi+4C]
 004F1E79    mov         ebx,dword ptr [eax]
 004F1E7B    call        dword ptr [ebx+20]
 004F1E7E    mov         ebx,eax
>004F1E80    jmp         004F1EA4
 004F1E82    cmp         byte ptr [esi+0AC],0
>004F1E89    jne         004F1EA4
 004F1E8B    mov         eax,dword ptr [esp]
 004F1E8E    push        eax
 004F1E8F    movzx       eax,bp
 004F1E92    push        eax
 004F1E93    push        0B01F
 004F1E98    mov         eax,dword ptr [esi+170]
 004F1E9E    push        eax
 004F1E9F    call        user32.PostMessageW
 004F1EA4    mov         eax,ebx
 004F1EA6    add         esp,0C
 004F1EA9    pop         ebp
 004F1EAA    pop         edi
 004F1EAB    pop         esi
 004F1EAC    pop         ebx
 004F1EAD    ret
*}
end;

//004F1EB0
function TApplication.DoOnHelp(Command:Word; Data:Integer; var CallHelp:Boolean):Boolean;
begin
{*
 004F1EB0    push        ebp
 004F1EB1    mov         ebp,esp
 004F1EB3    add         esp,0FFFFFFF4
 004F1EB6    push        ebx
 004F1EB7    push        esi
 004F1EB8    mov         dword ptr [ebp-0C],ecx
 004F1EBB    mov         word ptr [ebp-6],dx
 004F1EBF    mov         dword ptr [ebp-4],eax
 004F1EC2    xor         ebx,ebx
 004F1EC4    mov         eax,dword ptr [ebp+8]
 004F1EC7    mov         byte ptr [eax],1
 004F1ECA    xor         esi,esi
 004F1ECC    mov         eax,[007932F0];Screen:TScreen
 004F1ED1    mov         eax,dword ptr [eax+60]
 004F1ED4    test        eax,eax
>004F1ED6    je          004F1F08
 004F1ED8    xor         edx,edx
 004F1EDA    call        GetParentForm
 004F1EDF    mov         esi,eax
 004F1EE1    test        esi,esi
>004F1EE3    je          004F1F08
 004F1EE5    cmp         word ptr [esi+30A],0
>004F1EED    je          004F1F08
 004F1EEF    mov         eax,dword ptr [ebp+8]
 004F1EF2    push        eax
 004F1EF3    mov         ecx,dword ptr [ebp-0C]
 004F1EF6    movzx       edx,word ptr [ebp-6]
 004F1EFA    mov         eax,dword ptr [esi+30C]
 004F1F00    call        dword ptr [esi+308]
 004F1F06    mov         ebx,eax
 004F1F08    test        bl,bl
>004F1F0A    jne         004F1F72
 004F1F0C    mov         eax,[007932F0];Screen:TScreen
 004F1F11    mov         eax,dword ptr [eax+64]
 004F1F14    test        eax,eax
>004F1F16    je          004F1F45
 004F1F18    cmp         esi,eax
>004F1F1A    je          004F1F45
 004F1F1C    mov         esi,eax
 004F1F1E    test        esi,esi
>004F1F20    je          004F1F45
 004F1F22    cmp         word ptr [esi+30A],0
>004F1F2A    je          004F1F45
 004F1F2C    mov         eax,dword ptr [ebp+8]
 004F1F2F    push        eax
 004F1F30    mov         ecx,dword ptr [ebp-0C]
 004F1F33    movzx       edx,word ptr [ebp-6]
 004F1F37    mov         eax,dword ptr [esi+30C]
 004F1F3D    call        dword ptr [esi+308]
 004F1F43    mov         ebx,eax
 004F1F45    test        bl,bl
>004F1F47    jne         004F1F72
 004F1F49    mov         eax,dword ptr [ebp-4]
 004F1F4C    cmp         word ptr [eax+122],0
>004F1F54    je          004F1F72
 004F1F56    mov         eax,dword ptr [ebp+8]
 004F1F59    push        eax
 004F1F5A    mov         ebx,dword ptr [ebp-4]
 004F1F5D    mov         ecx,dword ptr [ebp-0C]
 004F1F60    movzx       edx,word ptr [ebp-6]
 004F1F64    mov         eax,dword ptr [ebx+124]
 004F1F6A    call        dword ptr [ebx+120]
 004F1F70    mov         ebx,eax
 004F1F72    mov         eax,ebx
 004F1F74    pop         esi
 004F1F75    pop         ebx
 004F1F76    mov         esp,ebp
 004F1F78    pop         ebp
 004F1F79    ret         4
*}
end;

//004F1F7C
function TApplication.HelpKeyword(Keyword:string):Boolean;
begin
{*
 004F1F7C    push        ebp
 004F1F7D    mov         ebp,esp
 004F1F7F    add         esp,0FFFFFFF8
 004F1F82    push        ebx
 004F1F83    push        esi
 004F1F84    push        edi
 004F1F85    xor         ecx,ecx
 004F1F87    mov         dword ptr [ebp-8],ecx
 004F1F8A    mov         edi,edx
 004F1F8C    mov         esi,eax
 004F1F8E    xor         eax,eax
 004F1F90    push        ebp
 004F1F91    push        4F1FFA
 004F1F96    push        dword ptr fs:[eax]
 004F1F99    mov         dword ptr fs:[eax],esp
 004F1F9C    lea         eax,[ebp-1]
 004F1F9F    push        eax
 004F1FA0    mov         eax,edi
 004F1FA2    call        @UStrToPWChar
 004F1FA7    mov         ecx,eax
 004F1FA9    mov         dx,102
 004F1FAD    mov         eax,esi
 004F1FAF    call        TApplication.DoOnHelp
 004F1FB4    mov         ebx,eax
 004F1FB6    cmp         byte ptr [ebp-1],0
>004F1FBA    je          004F1FE4
 004F1FBC    mov         eax,esi
 004F1FBE    call        TApplication.ValidateHelpSystem
 004F1FC3    test        al,al
>004F1FC5    je          004F1FE2
 004F1FC7    mov         bl,1
 004F1FC9    lea         edx,[ebp-8]
 004F1FCC    mov         eax,esi
 004F1FCE    call        TApplication.GetCurrentHelpFile
 004F1FD3    mov         ecx,dword ptr [ebp-8]
 004F1FD6    mov         edx,edi
 004F1FD8    mov         eax,dword ptr [esi+4C]
 004F1FDB    mov         esi,dword ptr [eax]
 004F1FDD    call        dword ptr [esi+0C]
>004F1FE0    jmp         004F1FE4
 004F1FE2    xor         ebx,ebx
 004F1FE4    xor         eax,eax
 004F1FE6    pop         edx
 004F1FE7    pop         ecx
 004F1FE8    pop         ecx
 004F1FE9    mov         dword ptr fs:[eax],edx
 004F1FEC    push        4F2001
 004F1FF1    lea         eax,[ebp-8]
 004F1FF4    call        @UStrClr
 004F1FF9    ret
>004F1FFA    jmp         @HandleFinally
>004F1FFF    jmp         004F1FF1
 004F2001    mov         eax,ebx
 004F2003    pop         edi
 004F2004    pop         esi
 004F2005    pop         ebx
 004F2006    pop         ecx
 004F2007    pop         ecx
 004F2008    pop         ebp
 004F2009    ret
*}
end;

//004F200C
function TApplication.HelpContext(Context:THelpContext):Boolean;
begin
{*
 004F200C    push        ebp
 004F200D    mov         ebp,esp
 004F200F    add         esp,0FFFFFFF8
 004F2012    push        ebx
 004F2013    push        esi
 004F2014    push        edi
 004F2015    xor         ecx,ecx
 004F2017    mov         dword ptr [ebp-8],ecx
 004F201A    mov         edi,edx
 004F201C    mov         esi,eax
 004F201E    xor         eax,eax
 004F2020    push        ebp
 004F2021    push        4F2083
 004F2026    push        dword ptr fs:[eax]
 004F2029    mov         dword ptr fs:[eax],esp
 004F202C    lea         eax,[ebp-1]
 004F202F    push        eax
 004F2030    mov         ecx,edi
 004F2032    mov         dx,1
 004F2036    mov         eax,esi
 004F2038    call        TApplication.DoOnHelp
 004F203D    mov         ebx,eax
 004F203F    cmp         byte ptr [ebp-1],0
>004F2043    je          004F206D
 004F2045    mov         eax,esi
 004F2047    call        TApplication.ValidateHelpSystem
 004F204C    test        al,al
>004F204E    je          004F206B
 004F2050    mov         bl,1
 004F2052    lea         edx,[ebp-8]
 004F2055    mov         eax,esi
 004F2057    call        TApplication.GetCurrentHelpFile
 004F205C    mov         ecx,dword ptr [ebp-8]
 004F205F    mov         edx,edi
 004F2061    mov         eax,dword ptr [esi+4C]
 004F2064    mov         esi,dword ptr [eax]
 004F2066    call        dword ptr [esi+10]
>004F2069    jmp         004F206D
 004F206B    xor         ebx,ebx
 004F206D    xor         eax,eax
 004F206F    pop         edx
 004F2070    pop         ecx
 004F2071    pop         ecx
 004F2072    mov         dword ptr fs:[eax],edx
 004F2075    push        4F208A
 004F207A    lea         eax,[ebp-8]
 004F207D    call        @UStrClr
 004F2082    ret
>004F2083    jmp         @HandleFinally
>004F2088    jmp         004F207A
 004F208A    mov         eax,ebx
 004F208C    pop         edi
 004F208D    pop         esi
 004F208E    pop         ebx
 004F208F    pop         ecx
 004F2090    pop         ecx
 004F2091    pop         ebp
 004F2092    ret
*}
end;

//004F2094
function TApplication.HelpCommand(Command:Integer; Data:Integer):Boolean;
begin
{*
 004F2094    call        TApplication.InvokeHelp
 004F2099    ret
*}
end;

//004F209C
function TApplication.HelpJump(JumpID:string):Boolean;
begin
{*
 004F209C    push        ebp
 004F209D    mov         ebp,esp
 004F209F    add         esp,0FFFFFFF8
 004F20A2    push        ebx
 004F20A3    push        esi
 004F20A4    push        edi
 004F20A5    xor         ecx,ecx
 004F20A7    mov         dword ptr [ebp-8],ecx
 004F20AA    mov         edi,edx
 004F20AC    mov         esi,eax
 004F20AE    xor         eax,eax
 004F20B0    push        ebp
 004F20B1    push        4F211A
 004F20B6    push        dword ptr fs:[eax]
 004F20B9    mov         dword ptr fs:[eax],esp
 004F20BC    lea         eax,[ebp-1]
 004F20BF    push        eax
 004F20C0    mov         eax,edi
 004F20C2    call        @UStrToPWChar
 004F20C7    mov         ecx,eax
 004F20C9    mov         dx,102
 004F20CD    mov         eax,esi
 004F20CF    call        TApplication.DoOnHelp
 004F20D4    mov         ebx,eax
 004F20D6    cmp         byte ptr [ebp-1],0
>004F20DA    je          004F2104
 004F20DC    mov         eax,esi
 004F20DE    call        TApplication.ValidateHelpSystem
 004F20E3    test        al,al
>004F20E5    je          004F2102
 004F20E7    mov         bl,1
 004F20E9    lea         edx,[ebp-8]
 004F20EC    mov         eax,esi
 004F20EE    call        TApplication.GetCurrentHelpFile
 004F20F3    mov         ecx,dword ptr [ebp-8]
 004F20F6    mov         edx,edi
 004F20F8    mov         eax,dword ptr [esi+4C]
 004F20FB    mov         esi,dword ptr [eax]
 004F20FD    call        dword ptr [esi+18]
>004F2100    jmp         004F2104
 004F2102    xor         ebx,ebx
 004F2104    xor         eax,eax
 004F2106    pop         edx
 004F2107    pop         ecx
 004F2108    pop         ecx
 004F2109    mov         dword ptr fs:[eax],edx
 004F210C    push        4F2121
 004F2111    lea         eax,[ebp-8]
 004F2114    call        @UStrClr
 004F2119    ret
>004F211A    jmp         @HandleFinally
>004F211F    jmp         004F2111
 004F2121    mov         eax,ebx
 004F2123    pop         edi
 004F2124    pop         esi
 004F2125    pop         ebx
 004F2126    pop         ecx
 004F2127    pop         ecx
 004F2128    pop         ebp
 004F2129    ret
*}
end;

//004F212C
function TApplication.HelpShowTableOfContents:Boolean;
begin
{*
 004F212C    push        ebp
 004F212D    mov         ebp,esp
 004F212F    push        0
 004F2131    push        ebx
 004F2132    push        esi
 004F2133    mov         esi,eax
 004F2135    xor         eax,eax
 004F2137    push        ebp
 004F2138    push        4F2187
 004F213D    push        dword ptr fs:[eax]
 004F2140    mov         dword ptr fs:[eax],esp
 004F2143    mov         eax,esi
 004F2145    call        TApplication.ValidateHelpSystem
 004F214A    mov         ebx,eax
 004F214C    test        bl,bl
>004F214E    je          004F2171
 004F2150    push        3
 004F2152    push        0
 004F2154    lea         edx,[ebp-4]
 004F2157    mov         eax,esi
 004F2159    call        TApplication.GetCurrentHelpFile
 004F215E    mov         ecx,dword ptr [ebp-4]
 004F2161    mov         edx,dword ptr [esi+170]
 004F2167    mov         eax,dword ptr [esi+4C]
 004F216A    mov         ebx,dword ptr [eax]
 004F216C    call        dword ptr [ebx+20]
 004F216F    mov         ebx,eax
 004F2171    xor         eax,eax
 004F2173    pop         edx
 004F2174    pop         ecx
 004F2175    pop         ecx
 004F2176    mov         dword ptr fs:[eax],edx
 004F2179    push        4F218E
 004F217E    lea         eax,[ebp-4]
 004F2181    call        @UStrClr
 004F2186    ret
>004F2187    jmp         @HandleFinally
>004F218C    jmp         004F217E
 004F218E    mov         eax,ebx
 004F2190    pop         esi
 004F2191    pop         ebx
 004F2192    pop         ecx
 004F2193    pop         ebp
 004F2194    ret
*}
end;

//004F2198
function TApplication.GetExeName:UnicodeString;
begin
{*
 004F2198    push        ebx
 004F2199    mov         ebx,edx
 004F219B    mov         edx,ebx
 004F219D    xor         eax,eax
 004F219F    call        ParamStr
 004F21A4    pop         ebx
 004F21A5    ret
*}
end;

//004F21A8
procedure TApplication.SetShowHint(Value:Boolean);
begin
{*
 004F21A8    push        ebx
 004F21A9    push        esi
 004F21AA    mov         ebx,eax
 004F21AC    cmp         dl,byte ptr [ebx+88]
>004F21B2    je          004F21FC
 004F21B4    mov         eax,edx
 004F21B6    mov         byte ptr [ebx+88],al
 004F21BC    test        al,al
>004F21BE    je          004F21E9
 004F21C0    cmp         dword ptr ds:[7866F0],0;'@ÞG'+#0+#0+#0+#0+#0+#1+#0+#0
>004F21C7    je          004F21FC
 004F21C9    mov         ecx,ebx
 004F21CB    mov         dl,1
 004F21CD    mov         eax,[007866F0];'@ÞG'+#0+#0+#0+#0+#0+#1+#0+#0
 004F21D2    call        dword ptr [eax+2C]
 004F21D5    mov         esi,eax
 004F21D7    mov         dword ptr [ebx+84],esi
 004F21DD    mov         edx,dword ptr [ebx+5C]
 004F21E0    mov         eax,esi
 004F21E2    call        TControl.SetColor
>004F21E7    jmp         004F21FC
 004F21E9    mov         eax,dword ptr [ebx+84]
 004F21EF    call        TObject.Free
 004F21F4    xor         eax,eax
 004F21F6    mov         dword ptr [ebx+84],eax
 004F21FC    pop         esi
 004F21FD    pop         ebx
 004F21FE    ret
*}
end;

//004F2200
procedure TApplication.SetHintColor(Value:TColor);
begin
{*
 004F2200    cmp         edx,dword ptr [eax+5C]
>004F2203    je          004F221C
 004F2205    mov         ecx,edx
 004F2207    mov         dword ptr [eax+5C],ecx
 004F220A    mov         edx,dword ptr [eax+84]
 004F2210    test        edx,edx
>004F2212    je          004F221C
 004F2214    mov         eax,ecx
 004F2216    xchg        eax,edx
 004F2217    call        TControl.SetColor
 004F221C    ret
*}
end;

//004F2220
procedure TApplication.DefaultFontChanged(Sender:TObject);
begin
{*
 004F2220    push        0
 004F2222    xor         ecx,ecx
 004F2224    mov         dx,0B008
 004F2228    call        TApplication.NotifyForms
 004F222D    ret
*}
end;

//004F2230
procedure TApplication.DoActionIdle;
begin
{*
 004F2230    push        ebx
 004F2231    push        esi
 004F2232    push        edi
 004F2233    mov         eax,[007932F0];Screen:TScreen
 004F2238    call        TScreen.GetCustomFormCount
 004F223D    mov         esi,eax
 004F223F    dec         esi
 004F2240    test        esi,esi
>004F2242    jl          004F2290
 004F2244    inc         esi
 004F2245    xor         edi,edi
 004F2247    mov         edx,edi
 004F2249    mov         eax,[007932F0];Screen:TScreen
 004F224E    call        TScreen.GetCustomForms
 004F2253    mov         ebx,eax
 004F2255    mov         eax,ebx
 004F2257    call        TWinControl.HandleAllocated
 004F225C    test        al,al
>004F225E    je          004F228C
 004F2260    mov         eax,ebx
 004F2262    call        TWinControl.GetHandle
 004F2267    push        eax
 004F2268    call        user32.IsWindowVisible
 004F226D    test        eax,eax
>004F226F    je          004F228C
 004F2271    mov         eax,ebx
 004F2273    call        TWinControl.GetHandle
 004F2278    push        eax
 004F2279    call        user32.IsWindowEnabled
 004F227E    test        eax,eax
>004F2280    je          004F228C
 004F2282    mov         eax,ebx
 004F2284    mov         edx,dword ptr [eax]
 004F2286    call        dword ptr [edx+104]
 004F228C    inc         edi
 004F228D    dec         esi
>004F228E    jne         004F2247
 004F2290    pop         edi
 004F2291    pop         esi
 004F2292    pop         ebx
 004F2293    ret
*}
end;

//004F2294
function TApplication.DoMouseIdle:TControl;
begin
{*
 004F2294    push        ebx
 004F2295    add         esp,0FFFFFFF8
 004F2298    mov         ebx,eax
 004F229A    push        esp
 004F229B    call        user32.GetCursorPos
 004F22A0    mov         eax,esp
 004F22A2    mov         dl,1
 004F22A4    call        FindDragTarget
 004F22A9    cmp         eax,dword ptr [ebx+48]
>004F22AC    je          004F22B1
 004F22AE    mov         dword ptr [ebx+48],eax
 004F22B1    pop         ecx
 004F22B2    pop         edx
 004F22B3    pop         ebx
 004F22B4    ret
*}
end;

//004F22B8
procedure IdleTimerProc(Wnd:HWND; Msg:LongInt; TimerID:LongInt; SysTime:LongInt); stdcall;
begin
{*
 004F22B8    push        ebp
 004F22B9    mov         ebp,esp
 004F22BB    push        ebx
 004F22BC    push        esi
 004F22BD    push        edi
 004F22BE    cmp         dword ptr ds:[7932EC],0;Application:TApplication
>004F22C5    je          004F2317
 004F22C7    xor         eax,eax
 004F22C9    push        ebp
 004F22CA    push        4F22FD
 004F22CF    push        dword ptr fs:[eax]
 004F22D2    mov         dword ptr fs:[eax],esp
 004F22D5    mov         eax,[0079330C]
 004F22DA    push        eax
 004F22DB    push        0
 004F22DD    call        user32.KillTimer
 004F22E2    xor         eax,eax
 004F22E4    mov         [0079330C],eax
 004F22E9    mov         eax,[007932EC];Application:TApplication
 004F22EE    call        TApplication.DoActionIdle
 004F22F3    xor         eax,eax
 004F22F5    pop         edx
 004F22F6    pop         ecx
 004F22F7    pop         ecx
 004F22F8    mov         dword ptr fs:[eax],edx
>004F22FB    jmp         004F2317
>004F22FD    jmp         @HandleAnyException
 004F2302    mov         edx,dword ptr ds:[7932EC];Application:TApplication
 004F2308    mov         eax,[007932EC];Application:TApplication
 004F230D    call        TApplication.HandleException
 004F2312    call        @DoneExcept
 004F2317    pop         edi
 004F2318    pop         esi
 004F2319    pop         ebx
 004F231A    pop         ebp
 004F231B    ret         10
*}
end;

//004F2320
procedure TApplication.Idle(const Msg:TMsg);
begin
{*
 004F2320    push        ebp
 004F2321    mov         ebp,esp
 004F2323    add         esp,0FFFFFFF0
 004F2326    push        ebx
 004F2327    push        esi
 004F2328    push        edi
 004F2329    xor         ecx,ecx
 004F232B    mov         dword ptr [ebp-0C],ecx
 004F232E    mov         dword ptr [ebp-10],ecx
 004F2331    mov         dword ptr [ebp-4],eax
 004F2334    xor         eax,eax
 004F2336    push        ebp
 004F2337    push        4F2489
 004F233C    push        dword ptr fs:[eax]
 004F233F    mov         dword ptr fs:[eax],esp
 004F2342    mov         eax,dword ptr [ebp-4]
 004F2345    call        TApplication.DoMouseIdle
 004F234A    mov         ebx,eax
 004F234C    mov         eax,dword ptr [ebp-4]
 004F234F    cmp         byte ptr [eax+88],0
>004F2356    je          004F2369
 004F2358    mov         eax,dword ptr [ebp-4]
 004F235B    cmp         dword ptr [eax+48],0
>004F235F    jne         004F2369
 004F2361    mov         eax,dword ptr [ebp-4]
 004F2364    call        TApplication.CancelHint
 004F2369    lea         edx,[ebp-10]
 004F236C    mov         eax,ebx
 004F236E    call        GetHint
 004F2373    mov         eax,dword ptr [ebp-10]
 004F2376    lea         edx,[ebp-0C]
 004F2379    call        GetLongHint
 004F237E    mov         edx,dword ptr [ebp-0C]
 004F2381    mov         eax,[007932EC];Application:TApplication
 004F2386    call        TApplication.SetHint
 004F238B    mov         byte ptr [ebp-5],1
 004F238F    xor         eax,eax
 004F2391    push        ebp
 004F2392    push        4F2430
 004F2397    push        dword ptr fs:[eax]
 004F239A    mov         dword ptr fs:[eax],esp
 004F239D    mov         eax,dword ptr [ebp-4]
 004F23A0    cmp         word ptr [eax+132],0
>004F23A8    je          004F23BF
 004F23AA    lea         ecx,[ebp-5]
 004F23AD    mov         ebx,dword ptr [ebp-4]
 004F23B0    mov         edx,dword ptr [ebp-4]
 004F23B3    mov         eax,dword ptr [ebx+134]
 004F23B9    call        dword ptr [ebx+130]
 004F23BF    cmp         byte ptr [ebp-5],0
>004F23C3    je          004F2426
 004F23C5    mov         eax,dword ptr [ebp-4]
 004F23C8    cmp         dword ptr [eax+0C0],0
>004F23CF    jg          004F23DB
 004F23D1    mov         eax,dword ptr [ebp-4]
 004F23D4    call        TApplication.DoActionIdle
>004F23D9    jmp         004F2426
 004F23DB    cmp         dword ptr ds:[79330C],0
>004F23E2    jne         004F2426
 004F23E4    cmp         dword ptr ds:[793310],0
>004F23EB    jne         004F23F7
 004F23ED    mov         dword ptr ds:[793310],4F22B8
 004F23F7    mov         eax,[00793310]
 004F23FC    push        eax
 004F23FD    mov         eax,dword ptr [ebp-4]
 004F2400    mov         eax,dword ptr [eax+0C0]
 004F2406    push        eax
 004F2407    push        0
 004F2409    push        0
 004F240B    call        user32.SetTimer
 004F2410    mov         [0079330C],eax
 004F2415    cmp         dword ptr ds:[79330C],0
>004F241C    jne         004F2426
 004F241E    mov         eax,dword ptr [ebp-4]
 004F2421    call        TApplication.DoActionIdle
 004F2426    xor         eax,eax
 004F2428    pop         edx
 004F2429    pop         ecx
 004F242A    pop         ecx
 004F242B    mov         dword ptr fs:[eax],edx
>004F242E    jmp         004F2445
>004F2430    jmp         @HandleAnyException
 004F2435    mov         edx,dword ptr [ebp-4]
 004F2438    mov         eax,dword ptr [ebp-4]
 004F243B    call        TApplication.HandleException
 004F2440    call        @DoneExcept
 004F2445    call        kernel32.GetCurrentThreadId
 004F244A    mov         edx,dword ptr ds:[78DB78];MainThreadID:Cardinal
 004F2450    cmp         eax,dword ptr [edx]
>004F2452    jne         004F2463
 004F2454    xor         eax,eax
 004F2456    call        CheckSynchronize
 004F245B    test        al,al
>004F245D    je          004F2463
 004F245F    mov         byte ptr [ebp-5],0
 004F2463    cmp         byte ptr [ebp-5],0
>004F2467    je          004F246E
 004F2469    call        user32.WaitMessage
 004F246E    xor         eax,eax
 004F2470    pop         edx
 004F2471    pop         ecx
 004F2472    pop         ecx
 004F2473    mov         dword ptr fs:[eax],edx
 004F2476    push        4F2490
 004F247B    lea         eax,[ebp-10]
 004F247E    mov         edx,2
 004F2483    call        @UStrArrayClr
 004F2488    ret
>004F2489    jmp         @HandleFinally
>004F248E    jmp         004F247B
 004F2490    pop         edi
 004F2491    pop         esi
 004F2492    pop         ebx
 004F2493    mov         esp,ebp
 004F2495    pop         ebp
 004F2496    ret
*}
end;

//004F2498
procedure TApplication.DoApplicationIdle;
begin
{*
 004F2498    add         esp,0FFFFFFE4
 004F249B    xor         edx,edx
 004F249D    mov         dword ptr [esp+4],edx
 004F24A1    xor         edx,edx
 004F24A3    mov         dword ptr [esp],edx
 004F24A6    xor         edx,edx
 004F24A8    mov         dword ptr [esp+8],edx
 004F24AC    xor         edx,edx
 004F24AE    mov         dword ptr [esp+0C],edx
 004F24B2    mov         edx,esp
 004F24B4    call        TApplication.Idle
 004F24B9    add         esp,1C
 004F24BC    ret
*}
end;

//004F24C0
procedure TApplication.NotifyForms(Msg:Word; WParam:WPARAM; LParam:LPARAM);
begin
{*
 004F24C0    push        ebp
 004F24C1    mov         ebp,esp
 004F24C3    push        ecx
 004F24C4    push        ebx
 004F24C5    push        esi
 004F24C6    push        edi
 004F24C7    mov         dword ptr [ebp-4],ecx
 004F24CA    mov         edi,edx
 004F24CC    mov         eax,[007932F0];Screen:TScreen
 004F24D1    call        TScreen.GetFormCount
 004F24D6    mov         ebx,eax
 004F24D8    dec         ebx
 004F24D9    test        ebx,ebx
>004F24DB    jl          004F24FF
 004F24DD    inc         ebx
 004F24DE    xor         esi,esi
 004F24E0    mov         eax,dword ptr [ebp+8]
 004F24E3    push        eax
 004F24E4    mov         edx,esi
 004F24E6    mov         eax,[007932F0];Screen:TScreen
 004F24EB    call        TScreen.GetForm
 004F24F0    movzx       edx,di
 004F24F3    mov         ecx,dword ptr [ebp-4]
 004F24F6    call        TControl.Perform
 004F24FB    inc         esi
 004F24FC    dec         ebx
>004F24FD    jne         004F24E0
 004F24FF    pop         edi
 004F2500    pop         esi
 004F2501    pop         ebx
 004F2502    pop         ecx
 004F2503    pop         ebp
 004F2504    ret         4
*}
end;

//004F2508
procedure TApplication.IconChanged(Sender:TObject);
begin
{*
 004F2508    push        ebx
 004F2509    mov         ebx,eax
 004F250B    mov         eax,[0078D264];^NewStyleControls:Boolean
 004F2510    cmp         byte ptr [eax],0
>004F2513    je          004F2548
 004F2515    mov         eax,ebx
 004F2517    call        TApplication.GetIconHandle
 004F251C    push        eax
 004F251D    push        1
 004F251F    push        80
 004F2524    mov         eax,dword ptr [ebx+170]
 004F252A    push        eax
 004F252B    call        user32.SendMessageW
 004F2530    mov         eax,ebx
 004F2532    call        TApplication.GetIconHandle
 004F2537    push        eax
 004F2538    push        0F2
 004F253A    mov         eax,dword ptr [ebx+170]
 004F2540    push        eax
 004F2541    call        user32.SetClassLongW
>004F2546    jmp         004F2567
 004F2548    mov         eax,dword ptr [ebx+170]
 004F254E    call        IsIconic
 004F2553    test        eax,eax
>004F2555    je          004F2567
 004F2557    push        0FF
 004F2559    push        0
 004F255B    mov         eax,dword ptr [ebx+170]
 004F2561    push        eax
 004F2562    call        user32.InvalidateRect
 004F2567    push        0
 004F2569    xor         ecx,ecx
 004F256B    mov         dx,0B01D
 004F256F    mov         eax,ebx
 004F2571    call        TApplication.NotifyForms
 004F2576    pop         ebx
 004F2577    ret
*}
end;

//004F2578
procedure TApplication.SetHint(const Value:UnicodeString);
begin
{*
 004F2578    push        ebp
 004F2579    mov         ebp,esp
 004F257B    push        ecx
 004F257C    push        ebx
 004F257D    push        esi
 004F257E    mov         esi,edx
 004F2580    mov         ebx,eax
 004F2582    mov         eax,dword ptr [ebx+54]
 004F2585    mov         edx,esi
 004F2587    call        @UStrEqual
>004F258C    je          004F2604
 004F258E    lea         eax,[ebx+54]
 004F2591    mov         edx,esi
 004F2593    call        @UStrAsg
 004F2598    cmp         word ptr [ebx+12A],0
>004F25A0    je          004F25B2
 004F25A2    mov         edx,ebx
 004F25A4    mov         eax,dword ptr [ebx+12C]
 004F25AA    call        dword ptr [ebx+128]
>004F25B0    jmp         004F2604
 004F25B2    mov         ecx,ebx
 004F25B4    mov         dl,1
 004F25B6    mov         eax,[004DE148];THintAction
 004F25BB    call        THintAction.Create
 004F25C0    mov         dword ptr [ebp-4],eax
 004F25C3    mov         edx,esi
 004F25C5    mov         eax,dword ptr [ebp-4]
 004F25C8    call        TCustomAction.SetHint
 004F25CD    xor         eax,eax
 004F25CF    push        ebp
 004F25D0    push        4F25FD
 004F25D5    push        dword ptr fs:[eax]
 004F25D8    mov         dword ptr fs:[eax],esp
 004F25DB    mov         eax,dword ptr [ebp-4]
 004F25DE    mov         si,0FFF0
 004F25E2    call        @CallDynaInst
 004F25E7    xor         eax,eax
 004F25E9    pop         edx
 004F25EA    pop         ecx
 004F25EB    pop         ecx
 004F25EC    mov         dword ptr fs:[eax],edx
 004F25EF    push        4F2604
 004F25F4    mov         eax,dword ptr [ebp-4]
 004F25F7    call        TObject.Free
 004F25FC    ret
>004F25FD    jmp         @HandleFinally
>004F2602    jmp         004F25F4
 004F2604    pop         esi
 004F2605    pop         ebx
 004F2606    pop         ecx
 004F2607    pop         ebp
 004F2608    ret
*}
end;

//004F260C
procedure SetVisible(Value:Boolean);
begin
{*
 004F260C    push        ebp
 004F260D    mov         ebp,esp
 004F260F    push        ebx
 004F2610    push        esi
 004F2611    mov         ebx,eax
 004F2613    mov         eax,dword ptr [ebp+8]
 004F2616    mov         eax,dword ptr [eax-4]
 004F2619    mov         eax,dword ptr [eax+170]
 004F261F    push        eax
 004F2620    call        user32.IsWindowVisible
 004F2625    cmp         eax,1
 004F2628    sbb         eax,eax
 004F262A    inc         eax
 004F262B    cmp         al,byte ptr ds:[78682C]
>004F2631    jne         004F26A6
 004F2633    cmp         bl,byte ptr ds:[78682C]
>004F2639    je          004F26A6
 004F263B    mov         eax,dword ptr [ebp+8]
 004F263E    mov         eax,dword ptr [eax-4]
 004F2641    cmp         byte ptr [eax+0D3],0
>004F2648    je          004F2678
 004F264A    cmp         byte ptr ds:[78682C],0
>004F2651    jne         004F2678
 004F2653    push        0EC
 004F2655    mov         eax,dword ptr [ebp+8]
 004F2658    mov         eax,dword ptr [eax-4]
 004F265B    mov         esi,dword ptr [eax+170]
 004F2661    push        esi
 004F2662    call        user32.GetWindowLongW
 004F2667    or          eax,8000000
 004F266C    push        eax
 004F266D    push        0EC
 004F266F    mov         eax,dword ptr [ebp+8]
 004F2672    push        esi
 004F2673    call        user32.SetWindowLongW
 004F2678    movzx       eax,bl
 004F267B    movzx       eax,word ptr [eax*2+78682E]
 004F2683    push        eax
 004F2684    push        0
 004F2686    push        0
 004F2688    push        0
 004F268A    push        0
 004F268C    push        0
 004F268E    mov         eax,dword ptr [ebp+8]
 004F2691    mov         eax,dword ptr [eax-4]
 004F2694    mov         eax,dword ptr [eax+170]
 004F269A    push        eax
 004F269B    call        user32.SetWindowPos
 004F26A0    mov         byte ptr ds:[78682C],bl
 004F26A6    pop         esi
 004F26A7    pop         ebx
 004F26A8    pop         ebp
 004F26A9    ret
*}
end;

//004F26AC
procedure TApplication.UpdateVisible;
begin
{*
 004F26AC    push        ebp
 004F26AD    mov         ebp,esp
 004F26AF    push        ecx
 004F26B0    push        ebx
 004F26B1    push        esi
 004F26B2    push        edi
 004F26B3    mov         dword ptr [ebp-4],eax
 004F26B6    mov         eax,dword ptr [ebp-4]
 004F26B9    cmp         dword ptr [eax+170],0
>004F26C0    je          004F272E
 004F26C2    mov         eax,[007932F0];Screen:TScreen
 004F26C7    call        TScreen.GetFormCount
 004F26CC    mov         esi,eax
 004F26CE    dec         esi
 004F26CF    test        esi,esi
>004F26D1    jl          004F2725
 004F26D3    inc         esi
 004F26D4    xor         edi,edi
 004F26D6    mov         edx,edi
 004F26D8    mov         eax,[007932F0];Screen:TScreen
 004F26DD    call        TScreen.GetForm
 004F26E2    mov         ebx,eax
 004F26E4    cmp         byte ptr [ebx+59],0
>004F26E8    je          004F2721
 004F26EA    cmp         dword ptr [ebx+1D4],0
>004F26F1    je          004F2716
 004F26F3    mov         eax,ebx
 004F26F5    call        TWinControl.HandleAllocated
 004F26FA    test        al,al
>004F26FC    je          004F2716
 004F26FE    mov         eax,dword ptr [ebx+1D4]
 004F2704    push        eax
 004F2705    mov         eax,ebx
 004F2707    call        TWinControl.GetHandle
 004F270C    push        eax
 004F270D    call        user32.IsChild
 004F2712    test        eax,eax
>004F2714    jne         004F2721
 004F2716    push        ebp
 004F2717    mov         al,1
 004F2719    call        SetVisible
 004F271E    pop         ecx
>004F271F    jmp         004F272E
 004F2721    inc         edi
 004F2722    dec         esi
>004F2723    jne         004F26D6
 004F2725    push        ebp
 004F2726    xor         eax,eax
 004F2728    call        SetVisible
 004F272D    pop         ecx
 004F272E    pop         edi
 004F272F    pop         esi
 004F2730    pop         ebx
 004F2731    pop         ecx
 004F2732    pop         ebp
 004F2733    ret
*}
end;

//004F2734
function TApplication.ValidateHelpSystem:Boolean;
begin
{*
 004F2734    push        ebx
 004F2735    mov         ebx,eax
 004F2737    cmp         dword ptr [ebx+4C],0
>004F273B    jne         004F274A
 004F273D    lea         eax,[ebx+4C]
 004F2740    call        @IntfClear
 004F2745    call        GetHelpSystem
 004F274A    cmp         dword ptr [ebx+4C],0
 004F274E    setne       al
 004F2751    pop         ebx
 004F2752    ret
*}
end;

//004F2754
procedure TApplication.StartHintTimer(Value:Integer; TimerMode:TTimerMode);
begin
{*
 004F2754    push        ebx
 004F2755    push        esi
 004F2756    push        edi
 004F2757    mov         ebx,ecx
 004F2759    mov         esi,edx
 004F275B    mov         edi,eax
 004F275D    mov         eax,edi
 004F275F    call        TApplication.StopHintTimer
 004F2764    mov         eax,[007867EC];^HintTimerProc
 004F2769    push        eax
 004F276A    push        esi
 004F276B    push        0
 004F276D    push        0
 004F276F    call        user32.SetTimer
 004F2774    mov         word ptr [edi+8A],ax
 004F277B    mov         byte ptr [edi+89],bl
 004F2781    cmp         word ptr [edi+8A],0
>004F2789    jne         004F2792
 004F278B    mov         eax,edi
 004F278D    call        TApplication.CancelHint
 004F2792    pop         edi
 004F2793    pop         esi
 004F2794    pop         ebx
 004F2795    ret
*}
end;

//004F2798
procedure TApplication.StopHintTimer;
begin
{*
 004F2798    push        ebx
 004F2799    mov         ebx,eax
 004F279B    movzx       eax,word ptr [ebx+8A]
 004F27A2    test        ax,ax
>004F27A5    je          004F27BB
 004F27A7    movzx       eax,ax
 004F27AA    push        eax
 004F27AB    push        0
 004F27AD    call        user32.KillTimer
 004F27B2    mov         word ptr [ebx+8A],0
 004F27BB    pop         ebx
 004F27BC    ret
*}
end;

//004F27C0
procedure TApplication.HintMouseMessage(Control:TControl; var Message:TMessage);
begin
{*
 004F27C0    push        ebx
 004F27C1    push        esi
 004F27C2    push        edi
 004F27C3    add         esp,0FFFFFFC4
 004F27C6    mov         edi,ecx
 004F27C8    mov         ebx,edx
 004F27CA    mov         esi,eax
 004F27CC    push        esi
 004F27CD    mov         esi,edi
 004F27CF    lea         edi,[esp+28]
 004F27D3    movs        dword ptr [edi],dword ptr [esi]
 004F27D4    movs        dword ptr [edi],dword ptr [esi]
 004F27D5    movs        dword ptr [edi],dword ptr [esi]
 004F27D6    movs        dword ptr [edi],dword ptr [esi]
 004F27D7    pop         esi
 004F27D8    mov         eax,dword ptr [esp+2C]
 004F27DC    mov         dword ptr [esp+0C],eax
 004F27E0    movsx       eax,word ptr [esp+0C]
 004F27E5    mov         dword ptr [esp+10],eax
 004F27E9    movsx       eax,word ptr [esp+0E]
 004F27EE    mov         dword ptr [esp+14],eax
 004F27F2    lea         ecx,[esp+34]
 004F27F6    lea         edx,[esp+10]
 004F27FA    mov         eax,ebx
 004F27FC    call        TControl.ClientToScreen
 004F2801    lea         eax,[esp+34]
 004F2805    mov         dl,1
 004F2807    call        FindDragTarget
 004F280C    call        GetHintControl
 004F2811    mov         edi,eax
 004F2813    test        edi,edi
>004F2815    je          004F2820
 004F2817    cmp         byte ptr [edi+89],0
>004F281E    jne         004F282C
 004F2820    mov         eax,esi
 004F2822    call        TApplication.CancelHint
>004F2827    jmp         004F28DB
 004F282C    cmp         edi,dword ptr [esi+60]
>004F282F    je          004F2835
 004F2831    mov         al,1
>004F2833    jmp         004F286C
 004F2835    mov         eax,dword ptr [esp+2C]
 004F2839    mov         dword ptr [esp+18],eax
 004F283D    movsx       eax,word ptr [esp+18]
 004F2842    mov         dword ptr [esp+1C],eax
 004F2846    movsx       eax,word ptr [esp+1A]
 004F284B    mov         dword ptr [esp+20],eax
 004F284F    lea         ecx,[esp+34]
 004F2853    lea         edx,[esp+1C]
 004F2857    mov         eax,ebx
 004F2859    call        TControl.ClientToScreen
 004F285E    lea         edx,[esp+34]
 004F2862    lea         eax,[esi+64]
 004F2865    call        PtInRect
 004F286A    xor         al,1
 004F286C    test        al,al
>004F286E    je          004F28DB
 004F2870    movzx       ebx,byte ptr [esi+58]
 004F2874    test        bl,bl
>004F2876    je          004F2883
 004F2878    mov         eax,dword ptr [esi+80]
 004F287E    mov         dword ptr [esp],eax
>004F2881    jmp         004F2889
 004F2883    mov         eax,dword ptr [esi+78]
 004F2886    mov         dword ptr [esp],eax
 004F2889    mov         eax,esp
 004F288B    push        eax
 004F288C    movzx       ecx,bl
 004F288F    mov         edx,0B041
 004F2894    mov         eax,edi
 004F2896    call        TControl.Perform
 004F289B    test        bl,bl
>004F289D    je          004F28C2
 004F289F    cmp         dword ptr [esp],0
>004F28A3    jne         004F28C2
 004F28A5    mov         byte ptr [esi+58],bl
 004F28A8    mov         dword ptr [esi+60],edi
 004F28AB    lea         eax,[esp+4]
 004F28AF    push        eax
 004F28B0    call        user32.GetCursorPos
 004F28B5    lea         edx,[esp+4]
 004F28B9    mov         eax,esi
 004F28BB    call        TApplication.ActivateHint
>004F28C0    jmp         004F28DB
 004F28C2    mov         eax,esi
 004F28C4    call        TApplication.CancelHint
 004F28C9    mov         byte ptr [esi+58],bl
 004F28CC    mov         dword ptr [esi+60],edi
 004F28CF    xor         ecx,ecx
 004F28D1    mov         edx,dword ptr [esp]
 004F28D4    mov         eax,esi
 004F28D6    call        TApplication.StartHintTimer
 004F28DB    add         esp,3C
 004F28DE    pop         edi
 004F28DF    pop         esi
 004F28E0    pop         ebx
 004F28E1    ret
*}
end;

//004F28E4
procedure TApplication.HintTimerExpired;
begin
{*
 004F28E4    push        ebx
 004F28E5    add         esp,0FFFFFFF8
 004F28E8    mov         ebx,eax
 004F28EA    mov         eax,ebx
 004F28EC    call        TApplication.StopHintTimer
 004F28F1    movzx       eax,byte ptr [ebx+89]
 004F28F8    sub         al,1
>004F28FA    jb          004F2907
>004F28FC    jne         004F2916
 004F28FE    mov         eax,ebx
 004F2900    call        TApplication.HideHint
>004F2905    jmp         004F2916
 004F2907    push        esp
 004F2908    call        user32.GetCursorPos
 004F290D    mov         edx,esp
 004F290F    mov         eax,ebx
 004F2911    call        TApplication.ActivateHint
 004F2916    pop         ecx
 004F2917    pop         edx
 004F2918    pop         ebx
 004F2919    ret
*}
end;

//004F291C
procedure TApplication.HideHint;
begin
{*
 004F291C    push        ebx
 004F291D    push        esi
 004F291E    mov         ebx,eax
 004F2920    mov         esi,dword ptr [ebx+84]
 004F2926    test        esi,esi
>004F2928    je          004F298A
 004F292A    mov         eax,esi
 004F292C    call        TWinControl.HandleAllocated
 004F2931    test        al,al
>004F2933    je          004F298A
 004F2935    mov         eax,dword ptr [ebx+84]
 004F293B    call        TWinControl.GetHandle
 004F2940    push        eax
 004F2941    call        user32.IsWindowVisible
 004F2946    test        eax,eax
>004F2948    je          004F298A
 004F294A    mov         eax,dword ptr [ebx+84]
 004F2950    mov         edx,dword ptr [eax]
 004F2952    call        dword ptr [edx+0FC]
 004F2958    test        al,al
>004F295A    je          004F297E
 004F295C    push        0
 004F295E    mov         eax,dword ptr [ebx+84]
 004F2964    call        TWinControl.GetHandle
 004F2969    push        eax
 004F296A    call        user32.ShowWindow
 004F296F    xor         edx,edx
 004F2971    mov         eax,dword ptr [ebx+84]
 004F2977    call        TControl.SetVisible
>004F297C    jmp         004F298A
 004F297E    mov         cl,1
 004F2980    mov         edx,dword ptr [ebx+74]
 004F2983    mov         eax,ebx
 004F2985    call        TApplication.StartHintTimer
 004F298A    pop         esi
 004F298B    pop         ebx
 004F298C    ret
*}
end;

//004F2990
procedure TApplication.CancelHint;
begin
{*
 004F2990    push        ebx
 004F2991    mov         ebx,eax
 004F2993    push        0
 004F2995    lea         eax,[ebx+60]
 004F2998    push        eax
 004F2999    call        kernel32.InterlockedExchange
 004F299E    test        eax,eax
>004F29A0    je          004F29B9
 004F29A2    mov         eax,ebx
 004F29A4    call        TApplication.HideHint
 004F29A9    mov         byte ptr [ebx+58],0
 004F29AD    call        UnhookHintHooks
 004F29B2    mov         eax,ebx
 004F29B4    call        TApplication.StopHintTimer
 004F29B9    pop         ebx
 004F29BA    ret
*}
end;

//004F29BC
function FindScanline(Source:Pointer; MaxLen:Cardinal; Value:Cardinal):Cardinal;
begin
{*
 004F29BC    push        ecx
 004F29BD    mov         ecx,edx
 004F29BF    mov         edx,edi
 004F29C1    mov         edi,eax
 004F29C3    pop         eax
 004F29C4    repe scas   byte ptr [edi]
 004F29C6    mov         eax,ecx
 004F29C8    mov         edi,edx
 004F29CA    ret
*}
end;

//004F29CC
function GetCursorHeightMargin:Integer;
begin
{*
 004F29CC    push        ebp
 004F29CD    mov         ebp,esp
 004F29CF    add         esp,0FFFFFFD8
 004F29D2    push        ebx
 004F29D3    push        esi
 004F29D4    push        edi
 004F29D5    push        0E
 004F29D7    call        user32.GetSystemMetrics
 004F29DC    mov         dword ptr [ebp-4],eax
 004F29DF    lea         eax,[ebp-28]
 004F29E2    push        eax
 004F29E3    call        user32.GetCursor
 004F29E8    push        eax
 004F29E9    call        user32.GetIconInfo
 004F29EE    test        eax,eax
>004F29F0    je          004F2B13
 004F29F6    xor         edx,edx
 004F29F8    push        ebp
 004F29F9    push        4F2B0C
 004F29FE    push        dword ptr fs:[edx]
 004F2A01    mov         dword ptr fs:[edx],esp
 004F2A04    lea         ecx,[ebp-0C]
 004F2A07    lea         edx,[ebp-8]
 004F2A0A    mov         eax,dword ptr [ebp-1C]
 004F2A0D    call        GetDIBSizes
 004F2A12    mov         eax,dword ptr [ebp-8]
 004F2A15    add         eax,dword ptr [ebp-0C]
 004F2A18    call        AllocMem
 004F2A1D    mov         dword ptr [ebp-10],eax
 004F2A20    xor         edx,edx
 004F2A22    push        ebp
 004F2A23    push        4F2ADD
 004F2A28    push        dword ptr fs:[edx]
 004F2A2B    mov         dword ptr fs:[edx],esp
 004F2A2E    mov         ebx,dword ptr [ebp-10]
 004F2A31    add         ebx,dword ptr [ebp-8]
 004F2A34    push        ebx
 004F2A35    mov         esi,dword ptr [ebp-10]
 004F2A38    mov         ecx,esi
 004F2A3A    xor         edx,edx
 004F2A3C    mov         eax,dword ptr [ebp-1C]
 004F2A3F    call        GetDIB
 004F2A44    test        al,al
>004F2A46    je          004F2AC1
 004F2A48    mov         eax,dword ptr [ebp-10]
 004F2A4B    cmp         word ptr [eax+0E],1
>004F2A50    jne         004F2AC1
 004F2A52    mov         eax,dword ptr [esi+4]
 004F2A55    mov         edx,eax
 004F2A57    movzx       ecx,word ptr [esi+0E]
 004F2A5B    imul        edx,ecx
 004F2A5E    add         edx,1F
 004F2A61    and         edx,0FFFFFFE0
 004F2A64    test        edx,edx
>004F2A66    jns         004F2A6B
 004F2A68    add         edx,7
 004F2A6B    sar         edx,3
 004F2A6E    mov         dword ptr [ebp-14],edx
 004F2A71    mov         edi,eax
 004F2A73    imul        edi,dword ptr [ebp-14]
 004F2A77    add         ebx,dword ptr [ebp-0C]
 004F2A7A    sub         ebx,edi
 004F2A7C    mov         ecx,0FF
 004F2A81    mov         edx,edi
 004F2A83    mov         eax,ebx
 004F2A85    call        FindScanline
 004F2A8A    mov         dword ptr [ebp-4],eax
 004F2A8D    cmp         dword ptr [ebp-4],0
>004F2A91    jne         004F2AAF
 004F2A93    mov         eax,dword ptr [esi+8]
 004F2A96    mov         edx,dword ptr [esi+4]
 004F2A99    add         edx,edx
 004F2A9B    cmp         eax,edx
>004F2A9D    jl          004F2AAF
 004F2A9F    mov         eax,ebx
 004F2AA1    sub         eax,edi
 004F2AA3    xor         ecx,ecx
 004F2AA5    mov         edx,edi
 004F2AA7    call        FindScanline
 004F2AAC    mov         dword ptr [ebp-4],eax
 004F2AAF    mov         ecx,dword ptr [ebp-14]
 004F2AB2    mov         eax,dword ptr [ebp-4]
 004F2AB5    cdq
 004F2AB6    idiv        eax,ecx
 004F2AB8    mov         dword ptr [ebp-4],eax
 004F2ABB    mov         eax,dword ptr [ebp-20]
 004F2ABE    sub         dword ptr [ebp-4],eax
 004F2AC1    xor         eax,eax
 004F2AC3    pop         edx
 004F2AC4    pop         ecx
 004F2AC5    pop         ecx
 004F2AC6    mov         dword ptr fs:[eax],edx
 004F2AC9    push        4F2AE4
 004F2ACE    mov         edx,dword ptr [ebp-8]
 004F2AD1    add         edx,dword ptr [ebp-0C]
 004F2AD4    mov         eax,dword ptr [ebp-10]
 004F2AD7    call        @FreeMem
 004F2ADC    ret
>004F2ADD    jmp         @HandleFinally
>004F2AE2    jmp         004F2ACE
 004F2AE4    xor         eax,eax
 004F2AE6    pop         edx
 004F2AE7    pop         ecx
 004F2AE8    pop         ecx
 004F2AE9    mov         dword ptr fs:[eax],edx
 004F2AEC    push        4F2B13
 004F2AF1    mov         eax,dword ptr [ebp-18]
 004F2AF4    test        eax,eax
>004F2AF6    je          004F2AFE
 004F2AF8    push        eax
 004F2AF9    call        gdi32.DeleteObject
 004F2AFE    mov         eax,dword ptr [ebp-1C]
 004F2B01    test        eax,eax
>004F2B03    je          004F2B0B
 004F2B05    push        eax
 004F2B06    call        gdi32.DeleteObject
 004F2B0B    ret
>004F2B0C    jmp         @HandleFinally
>004F2B11    jmp         004F2AF1
 004F2B13    mov         eax,dword ptr [ebp-4]
 004F2B16    pop         edi
 004F2B17    pop         esi
 004F2B18    pop         ebx
 004F2B19    mov         esp,ebp
 004F2B1B    pop         ebp
 004F2B1C    ret
*}
end;

//004F2B20
procedure ValidateHintWindow(HintClass:THintWindowClass);
begin
{*
 004F2B20    push        ebp
 004F2B21    mov         ebp,esp
 004F2B23    push        ebx
 004F2B24    push        esi
 004F2B25    mov         ebx,eax
 004F2B27    test        ebx,ebx
>004F2B29    jne         004F2B31
 004F2B2B    mov         ebx,dword ptr ds:[7866F0];'@ÞG'+#0+#0+#0+#0+#0+#1+#0+#0
 004F2B31    mov         eax,dword ptr [ebp+8]
 004F2B34    mov         eax,dword ptr [eax-4]
 004F2B37    mov         edx,dword ptr [eax+84]
 004F2B3D    test        edx,edx
>004F2B3F    jne         004F2B45
 004F2B41    mov         al,1
>004F2B43    jmp         004F2B53
 004F2B45    mov         eax,dword ptr [ebp+8]
 004F2B48    mov         eax,edx
 004F2B4A    mov         eax,dword ptr [eax]
 004F2B4C    mov         esi,eax
 004F2B4E    cmp         ebx,esi
 004F2B50    setne       al
 004F2B53    test        al,al
>004F2B55    je          004F2B7A
 004F2B57    mov         eax,dword ptr [ebp+8]
 004F2B5A    mov         eax,edx
 004F2B5C    call        TObject.Free
 004F2B61    mov         eax,dword ptr [ebp+8]
 004F2B64    mov         ecx,dword ptr [eax-4]
 004F2B67    mov         dl,1
 004F2B69    mov         eax,ebx
 004F2B6B    call        dword ptr [eax+2C]
 004F2B6E    mov         edx,dword ptr [ebp+8]
 004F2B71    mov         edx,dword ptr [edx-4]
 004F2B74    mov         dword ptr [edx+84],eax
 004F2B7A    pop         esi
 004F2B7B    pop         ebx
 004F2B7C    pop         ebp
 004F2B7D    ret
*}
end;

//004F2B80
function MultiLineWidth(const Value:UnicodeString):Integer;
begin
{*
 004F2B80    push        ebp
 004F2B81    mov         ebp,esp
 004F2B83    add         esp,0FFFFFFF8
 004F2B86    push        ebx
 004F2B87    push        esi
 004F2B88    push        edi
 004F2B89    xor         edx,edx
 004F2B8B    mov         dword ptr [ebp-4],edx
 004F2B8E    xor         edx,edx
 004F2B90    push        ebp
 004F2B91    push        4F2C2E
 004F2B96    push        dword ptr fs:[edx]
 004F2B99    mov         dword ptr fs:[edx],esp
 004F2B9C    xor         edx,edx
 004F2B9E    mov         dword ptr [ebp-8],edx
 004F2BA1    mov         ebx,eax
 004F2BA3    test        ebx,ebx
>004F2BA5    je          004F2C18
>004F2BA7    jmp         004F2C12
 004F2BA9    mov         esi,ebx
>004F2BAB    jmp         004F2BB6
 004F2BAD    mov         eax,ebx
 004F2BAF    call        StrNextChar
 004F2BB4    mov         ebx,eax
 004F2BB6    mov         edx,4F2C40
 004F2BBB    movzx       eax,word ptr [ebx]
 004F2BBE    call        CharInSet
 004F2BC3    test        al,al
>004F2BC5    je          004F2BAD
 004F2BC7    mov         ecx,ebx
 004F2BC9    sub         ecx,esi
 004F2BCB    sar         ecx,1
>004F2BCD    jns         004F2BD2
 004F2BCF    adc         ecx,0
 004F2BD2    lea         eax,[ebp-4]
 004F2BD5    mov         edx,esi
 004F2BD7    call        @UStrFromPWCharLen
 004F2BDC    mov         eax,dword ptr [ebp+8]
 004F2BDF    mov         eax,dword ptr [eax-4]
 004F2BE2    mov         eax,dword ptr [eax+84]
 004F2BE8    mov         eax,dword ptr [eax+270]
 004F2BEE    mov         edx,dword ptr [ebp-4]
 004F2BF1    call        TCustomCanvas.TextWidth
 004F2BF6    mov         edi,eax
 004F2BF8    cmp         edi,dword ptr [ebp-8]
>004F2BFB    jle         004F2C00
 004F2BFD    mov         dword ptr [ebp-8],edi
 004F2C00    cmp         word ptr [ebx],0D
>004F2C04    jne         004F2C09
 004F2C06    add         ebx,2
 004F2C09    cmp         word ptr [ebx],0A
>004F2C0D    jne         004F2C12
 004F2C0F    add         ebx,2
 004F2C12    cmp         word ptr [ebx],0
>004F2C16    jne         004F2BA9
 004F2C18    xor         eax,eax
 004F2C1A    pop         edx
 004F2C1B    pop         ecx
 004F2C1C    pop         ecx
 004F2C1D    mov         dword ptr fs:[eax],edx
 004F2C20    push        4F2C35
 004F2C25    lea         eax,[ebp-4]
 004F2C28    call        @UStrClr
 004F2C2D    ret
>004F2C2E    jmp         @HandleFinally
>004F2C33    jmp         004F2C25
 004F2C35    mov         eax,dword ptr [ebp-8]
 004F2C38    pop         edi
 004F2C39    pop         esi
 004F2C3A    pop         ebx
 004F2C3B    pop         ecx
 004F2C3C    pop         ecx
 004F2C3D    pop         ebp
 004F2C3E    ret
*}
end;

//004F2C60
procedure TApplication.ActivateHint(CursorPos:TPoint);
begin
{*
 004F2C60    push        ebp
 004F2C61    mov         ebp,esp
 004F2C63    add         esp,0FFFFFF70
 004F2C69    push        ebx
 004F2C6A    push        esi
 004F2C6B    push        edi
 004F2C6C    xor         ecx,ecx
 004F2C6E    mov         dword ptr [ebp-8C],ecx
 004F2C74    mov         dword ptr [ebp-90],ecx
 004F2C7A    mov         esi,edx
 004F2C7C    lea         edi,[ebp-4C]
 004F2C7F    movs        dword ptr [edi],dword ptr [esi]
 004F2C80    movs        dword ptr [edi],dword ptr [esi]
 004F2C81    mov         dword ptr [ebp-4],eax
 004F2C84    lea         eax,[ebp-44]
 004F2C87    mov         edx,dword ptr ds:[475E44];THintInfo
 004F2C8D    call        @InitializeRecord
 004F2C92    lea         ebx,[ebp-4]
 004F2C95    xor         eax,eax
 004F2C97    push        ebp
 004F2C98    push        4F2FFF
 004F2C9D    push        dword ptr fs:[eax]
 004F2CA0    mov         dword ptr fs:[eax],esp
 004F2CA3    mov         eax,dword ptr [ebx]
 004F2CA5    mov         byte ptr [eax+58],0
 004F2CA9    xor         eax,eax
 004F2CAB    mov         dword ptr [ebp-14],eax
 004F2CAE    mov         eax,dword ptr [ebx]
 004F2CB0    cmp         byte ptr [eax+88],0
>004F2CB7    je          004F2FB8
 004F2CBD    mov         eax,dword ptr [ebx]
 004F2CBF    cmp         dword ptr [eax+60],0
>004F2CC3    je          004F2FB8
 004F2CC9    mov         eax,dword ptr [ebx]
 004F2CCB    movzx       eax,byte ptr [eax+0D2]
 004F2CD2    call        ForegroundTaskCheck
 004F2CD7    test        al,al
>004F2CD9    je          004F2FB8
 004F2CDF    lea         eax,[ebp-4C]
 004F2CE2    mov         dl,1
 004F2CE4    call        FindDragTarget
 004F2CE9    call        GetHintControl
 004F2CEE    mov         edx,dword ptr [ebx]
 004F2CF0    cmp         eax,dword ptr [edx+60]
>004F2CF3    jne         004F2FB8
 004F2CF9    mov         eax,dword ptr [ebx]
 004F2CFB    mov         eax,dword ptr [eax+60]
 004F2CFE    call        TControl.GetCustomHint
 004F2D03    test        eax,eax
>004F2D05    jne         004F2FB8
 004F2D0B    mov         eax,dword ptr [ebx]
 004F2D0D    mov         eax,dword ptr [eax+60]
 004F2D10    mov         dword ptr [ebp-44],eax
 004F2D13    mov         eax,dword ptr [ebp-4C]
 004F2D16    mov         dword ptr [ebp-3C],eax
 004F2D19    mov         eax,dword ptr [ebp-48]
 004F2D1C    mov         dword ptr [ebp-38],eax
 004F2D1F    call        GetCursorHeightMargin
 004F2D24    add         dword ptr [ebp-38],eax
 004F2D27    mov         eax,[007932F0];Screen:TScreen
 004F2D2C    call        TScreen.GetWidth
 004F2D31    mov         dword ptr [ebp-34],eax
 004F2D34    mov         eax,dword ptr [ebx]
 004F2D36    mov         eax,dword ptr [eax+5C]
 004F2D39    mov         dword ptr [ebp-30],eax
 004F2D3C    lea         edx,[ebp-80]
 004F2D3F    mov         eax,dword ptr [ebx]
 004F2D41    mov         eax,dword ptr [eax+60]
 004F2D44    call        TControl.GetBoundsRect
 004F2D49    lea         esi,[ebp-80]
 004F2D4C    lea         edi,[ebp-2C]
 004F2D4F    movs        dword ptr [edi],dword ptr [esi]
 004F2D50    movs        dword ptr [edi],dword ptr [esi]
 004F2D51    movs        dword ptr [edi],dword ptr [esi]
 004F2D52    movs        dword ptr [edi],dword ptr [esi]
 004F2D53    lea         edx,[ebp-54]
 004F2D56    mov         eax,dword ptr [ebx]
 004F2D58    mov         eax,dword ptr [eax+60]
 004F2D5B    mov         ecx,dword ptr [eax]
 004F2D5D    call        dword ptr [ecx+50]
 004F2D60    xor         eax,eax
 004F2D62    mov         dword ptr [ebp-5C],eax
 004F2D65    xor         eax,eax
 004F2D67    mov         dword ptr [ebp-58],eax
 004F2D6A    mov         eax,dword ptr [ebx]
 004F2D6C    mov         eax,dword ptr [eax+60]
 004F2D6F    mov         esi,dword ptr [eax+34]
 004F2D72    test        esi,esi
>004F2D74    je          004F2D82
 004F2D76    lea         edx,[ebp-5C]
 004F2D79    mov         eax,esi
 004F2D7B    mov         ecx,dword ptr [eax]
 004F2D7D    call        dword ptr [ecx+50]
>004F2D80    jmp         004F2DB1
 004F2D82    mov         eax,dword ptr [ebx]
 004F2D84    mov         esi,dword ptr [eax+60]
 004F2D87    mov         eax,esi
 004F2D89    mov         edx,dword ptr ds:[47C4E8];TWinControl
 004F2D8F    call        @IsClass
 004F2D94    test        al,al
>004F2D96    je          004F2DB1
 004F2D98    cmp         dword ptr [esi+1D4],0
>004F2D9F    je          004F2DB1
 004F2DA1    lea         eax,[ebp-5C]
 004F2DA4    push        eax
 004F2DA5    mov         eax,dword ptr [esi+1D4]
 004F2DAB    push        eax
 004F2DAC    call        user32.ClientToScreen
 004F2DB1    mov         ecx,dword ptr [ebp-58]
 004F2DB4    sub         ecx,dword ptr [ebp-50]
 004F2DB7    mov         edx,dword ptr [ebp-5C]
 004F2DBA    sub         edx,dword ptr [ebp-54]
 004F2DBD    lea         eax,[ebp-2C]
 004F2DC0    call        OffsetRect
 004F2DC5    lea         ecx,[ebp-88]
 004F2DCB    lea         edx,[ebp-4C]
 004F2DCE    mov         eax,dword ptr [ebx]
 004F2DD0    mov         eax,dword ptr [eax+60]
 004F2DD3    call        TControl.ScreenToClient
 004F2DD8    mov         eax,dword ptr [ebp-88]
 004F2DDE    mov         dword ptr [ebp-1C],eax
 004F2DE1    mov         eax,dword ptr [ebp-84]
 004F2DE7    mov         dword ptr [ebp-18],eax
 004F2DEA    lea         edx,[ebp-90]
 004F2DF0    mov         eax,dword ptr [ebx]
 004F2DF2    mov         eax,dword ptr [eax+60]
 004F2DF5    call        GetHint
 004F2DFA    mov         eax,dword ptr [ebp-90]
 004F2E00    lea         edx,[ebp-8C]
 004F2E06    call        GetShortHint
 004F2E0B    mov         edx,dword ptr [ebp-8C]
 004F2E11    lea         eax,[ebp-0C]
 004F2E14    call        @UStrLAsg
 004F2E19    mov         eax,dword ptr [ebx]
 004F2E1B    mov         eax,dword ptr [eax+74]
 004F2E1E    mov         dword ptr [ebp-10],eax
 004F2E21    mov         eax,[007866F0];'@ÞG'+#0+#0+#0+#0+#0+#1+#0+#0
 004F2E26    mov         dword ptr [ebp-40],eax
 004F2E29    xor         eax,eax
 004F2E2B    mov         dword ptr [ebp-8],eax
 004F2E2E    lea         eax,[ebp-44]
 004F2E31    push        eax
 004F2E32    mov         eax,dword ptr [ebx]
 004F2E34    mov         eax,dword ptr [eax+60]
 004F2E37    xor         ecx,ecx
 004F2E39    mov         edx,0B030
 004F2E3E    call        TControl.Perform
 004F2E43    test        eax,eax
 004F2E45    sete        byte ptr [ebp-5D]
 004F2E49    cmp         byte ptr [ebp-5D],0
>004F2E4D    je          004F2E73
 004F2E4F    mov         eax,dword ptr [ebx]
 004F2E51    cmp         word ptr [eax+162],0
>004F2E59    je          004F2E73
 004F2E5B    lea         eax,[ebp-44]
 004F2E5E    push        eax
 004F2E5F    lea         ecx,[ebp-5D]
 004F2E62    lea         edx,[ebp-0C]
 004F2E65    mov         esi,dword ptr [ebx]
 004F2E67    mov         eax,dword ptr [esi+164]
 004F2E6D    call        dword ptr [esi+160]
 004F2E73    cmp         byte ptr [ebp-5D],0
>004F2E77    je          004F2E81
 004F2E79    mov         eax,dword ptr [ebx]
 004F2E7B    cmp         dword ptr [eax+60],0
>004F2E7F    jne         004F2E85
 004F2E81    xor         eax,eax
>004F2E83    jmp         004F2E87
 004F2E85    mov         al,1
 004F2E87    mov         edx,dword ptr [ebx]
 004F2E89    mov         byte ptr [edx+58],al
 004F2E8C    mov         eax,dword ptr [ebx]
 004F2E8E    cmp         byte ptr [eax+58],0
>004F2E92    je          004F2FB8
 004F2E98    cmp         dword ptr [ebp-0C],0
>004F2E9C    je          004F2FB8
 004F2EA2    push        ebp
 004F2EA3    mov         eax,dword ptr [ebp-40]
 004F2EA6    call        ValidateHintWindow
 004F2EAB    pop         ecx
 004F2EAC    mov         eax,dword ptr [ebx]
 004F2EAE    mov         eax,dword ptr [eax+60]
 004F2EB1    movzx       edx,byte ptr [eax+61]
 004F2EB5    mov         eax,dword ptr [ebx]
 004F2EB7    mov         eax,dword ptr [eax+84]
 004F2EBD    mov         ecx,dword ptr [eax]
 004F2EBF    call        dword ptr [ecx+80]
 004F2EC5    mov         eax,dword ptr [ebp-8]
 004F2EC8    push        eax
 004F2EC9    lea         eax,[ebp-70]
 004F2ECC    push        eax
 004F2ECD    mov         eax,dword ptr [ebx]
 004F2ECF    mov         eax,dword ptr [eax+84]
 004F2ED5    mov         ecx,dword ptr [ebp-0C]
 004F2ED8    mov         edx,dword ptr [ebp-34]
 004F2EDB    mov         esi,dword ptr [eax]
 004F2EDD    call        dword ptr [esi+104]
 004F2EE3    lea         eax,[ebp-70]
 004F2EE6    mov         ecx,dword ptr [ebp-38]
 004F2EE9    mov         edx,dword ptr [ebp-3C]
 004F2EEC    call        OffsetRect
 004F2EF1    mov         eax,dword ptr [ebx]
 004F2EF3    mov         eax,dword ptr [eax+84]
 004F2EF9    mov         si,0FFC7
 004F2EFD    call        @CallDynaInst
 004F2F02    test        al,al
>004F2F04    je          004F2F19
 004F2F06    push        ebp
 004F2F07    mov         eax,dword ptr [ebp-0C]
 004F2F0A    call        MultiLineWidth
 004F2F0F    pop         ecx
 004F2F10    add         eax,5
 004F2F13    sub         dword ptr [ebp-70],eax
 004F2F16    sub         dword ptr [ebp-68],eax
 004F2F19    lea         ecx,[ebp-88]
 004F2F1F    lea         edx,[ebp-2C]
 004F2F22    mov         eax,dword ptr [ebx]
 004F2F24    mov         eax,dword ptr [eax+60]
 004F2F27    call        TControl.ClientToScreen
 004F2F2C    mov         eax,dword ptr [ebx]
 004F2F2E    mov         edx,dword ptr [ebp-88]
 004F2F34    mov         dword ptr [eax+64],edx
 004F2F37    mov         edx,dword ptr [ebp-84]
 004F2F3D    mov         dword ptr [eax+68],edx
 004F2F40    lea         ecx,[ebp-88]
 004F2F46    lea         edx,[ebp-24]
 004F2F49    mov         eax,dword ptr [ebx]
 004F2F4B    mov         eax,dword ptr [eax+60]
 004F2F4E    call        TControl.ClientToScreen
 004F2F53    mov         eax,dword ptr [ebx]
 004F2F55    mov         edx,dword ptr [ebp-88]
 004F2F5B    mov         dword ptr [eax+6C],edx
 004F2F5E    mov         edx,dword ptr [ebp-84]
 004F2F64    mov         dword ptr [eax+70],edx
 004F2F67    mov         eax,dword ptr [ebx]
 004F2F69    mov         eax,dword ptr [eax+84]
 004F2F6F    mov         edx,dword ptr [ebp-30]
 004F2F72    call        TControl.SetColor
 004F2F77    mov         eax,dword ptr [ebp-8]
 004F2F7A    push        eax
 004F2F7B    mov         eax,dword ptr [ebx]
 004F2F7D    mov         eax,dword ptr [eax+84]
 004F2F83    mov         ecx,dword ptr [ebp-0C]
 004F2F86    lea         edx,[ebp-70]
 004F2F89    mov         esi,dword ptr [eax]
 004F2F8B    call        dword ptr [esi+100]
 004F2F91    call        HookHintHooks
 004F2F96    mov         eax,dword ptr [ebp-14]
 004F2F99    test        eax,eax
>004F2F9B    jle         004F2FAA
 004F2F9D    xor         ecx,ecx
 004F2F9F    mov         edx,eax
 004F2FA1    mov         eax,dword ptr [ebx]
 004F2FA3    call        TApplication.StartHintTimer
>004F2FA8    jmp         004F2FD3
 004F2FAA    mov         cl,1
 004F2FAC    mov         edx,dword ptr [ebp-10]
 004F2FAF    mov         eax,dword ptr [ebx]
 004F2FB1    call        TApplication.StartHintTimer
>004F2FB6    jmp         004F2FD3
 004F2FB8    mov         eax,dword ptr [ebp-14]
 004F2FBB    test        eax,eax
>004F2FBD    jle         004F2FCC
 004F2FBF    xor         ecx,ecx
 004F2FC1    mov         edx,eax
 004F2FC3    mov         eax,dword ptr [ebx]
 004F2FC5    call        TApplication.StartHintTimer
>004F2FCA    jmp         004F2FD3
 004F2FCC    mov         eax,dword ptr [ebx]
 004F2FCE    call        TApplication.CancelHint
 004F2FD3    xor         eax,eax
 004F2FD5    pop         edx
 004F2FD6    pop         ecx
 004F2FD7    pop         ecx
 004F2FD8    mov         dword ptr fs:[eax],edx
 004F2FDB    push        4F3006
 004F2FE0    lea         eax,[ebp-90]
 004F2FE6    mov         edx,2
 004F2FEB    call        @UStrArrayClr
 004F2FF0    lea         eax,[ebp-44]
 004F2FF3    mov         edx,dword ptr ds:[475E44];THintInfo
 004F2FF9    call        @FinalizeRecord
 004F2FFE    ret
>004F2FFF    jmp         @HandleFinally
>004F3004    jmp         004F2FE0
 004F3006    pop         edi
 004F3007    pop         esi
 004F3008    pop         ebx
 004F3009    mov         esp,ebp
 004F300B    pop         ebp
 004F300C    ret
*}
end;

//004F3010
function TApplication.AddPopupForm(APopupForm:TCustomForm):Integer;
begin
{*
 004F3010    push        ebx
 004F3011    push        esi
 004F3012    push        edi
 004F3013    push        ebp
 004F3014    push        ecx
 004F3015    mov         ebp,edx
 004F3017    mov         esi,eax
 004F3019    xor         ebx,ebx
>004F301B    jmp         004F304A
 004F301D    lea         edi,[ebx+ebx*2]
 004F3020    mov         eax,dword ptr [esi+0CC]
 004F3026    cmp         ebp,dword ptr [eax+edi*4+4]
>004F302A    jne         004F303D
 004F302C    mov         eax,dword ptr [esi+0CC]
 004F3032    mov         eax,dword ptr [eax+edi*4]
 004F3035    mov         dword ptr [esp],eax
>004F3038    jmp         004F30CE
 004F303D    mov         eax,dword ptr [esi+0CC]
 004F3043    cmp         dword ptr [eax+edi*4],0FFFFFFFF
>004F3047    je          004F3059
 004F3049    inc         ebx
 004F304A    mov         eax,dword ptr [esi+0CC]
 004F3050    call        @DynArrayLength
 004F3055    cmp         ebx,eax
>004F3057    jl          004F301D
 004F3059    mov         eax,dword ptr [esi+0C8]
 004F305F    mov         dword ptr [esp],eax
 004F3062    inc         dword ptr [esi+0C8]
 004F3068    mov         eax,dword ptr [esi+0CC]
 004F306E    call        @DynArrayLength
 004F3073    cmp         ebx,eax
>004F3075    jl          004F30A1
 004F3077    mov         eax,dword ptr [esi+0CC]
 004F307D    call        @DynArrayLength
 004F3082    mov         ebx,eax
 004F3084    lea         eax,[ebx+1]
 004F3087    push        eax
 004F3088    lea         eax,[esi+0CC]
 004F308E    mov         ecx,1
 004F3093    mov         edx,dword ptr ds:[4E32F0];TPopupFormArray
 004F3099    call        @DynArraySetLength
 004F309E    add         esp,4
 004F30A1    lea         eax,[ebx+ebx*2]
 004F30A4    mov         edx,dword ptr [esi+0CC]
 004F30AA    mov         ecx,dword ptr [esp]
 004F30AD    mov         dword ptr [edx+eax*4],ecx
 004F30B0    mov         edx,dword ptr [esi+0CC]
 004F30B6    mov         dword ptr [edx+eax*4+4],ebp
 004F30BA    mov         edx,dword ptr [esi+0CC]
 004F30C0    cmp         dword ptr [ebp+35C],0
 004F30C7    setne       cl
 004F30CA    mov         byte ptr [edx+eax*4+8],cl
 004F30CE    mov         eax,dword ptr [esp]
 004F30D1    pop         edx
 004F30D2    pop         ebp
 004F30D3    pop         edi
 004F30D4    pop         esi
 004F30D5    pop         ebx
 004F30D6    ret
*}
end;

//004F30D8
function TApplication.GetCurrentHelpFile:UnicodeString;
begin
{*
 004F30D8    push        ebx
 004F30D9    push        esi
 004F30DA    push        edi
 004F30DB    mov         edi,edx
 004F30DD    mov         esi,eax
 004F30DF    mov         eax,[007932F0];Screen:TScreen
 004F30E4    mov         ebx,dword ptr [eax+64]
 004F30E7    test        ebx,ebx
>004F30E9    je          004F3103
 004F30EB    cmp         dword ptr [ebx+2A8],0
>004F30F2    je          004F3103
 004F30F4    mov         eax,edi
 004F30F6    mov         edx,dword ptr [ebx+2A8]
 004F30FC    call        @UStrAsg
>004F3101    jmp         004F310D
 004F3103    mov         eax,edi
 004F3105    mov         edx,dword ptr [esi+50]
 004F3108    call        @UStrAsg
 004F310D    pop         edi
 004F310E    pop         esi
 004F310F    pop         ebx
 004F3110    ret
*}
end;

//004F3114
function TApplication.GetDialogHandle:HWND;
begin
{*
 004F3114    cmp         byte ptr [eax+0AC],0
>004F311B    jne         004F3133
 004F311D    push        0
 004F311F    push        1
 004F3121    push        0B031
 004F3126    mov         eax,dword ptr [eax+170]
 004F312C    push        eax
 004F312D    call        user32.SendMessageW
 004F3132    ret
 004F3133    mov         eax,dword ptr [eax+0B8]
 004F3139    ret
*}
end;

//004F313C
procedure TApplication.SetDialogHandle(Value:HWND);
begin
{*
 004F313C    push        ebx
 004F313D    push        esi
 004F313E    mov         esi,edx
 004F3140    mov         ebx,eax
 004F3142    cmp         byte ptr [ebx+0AC],0
>004F3149    jne         004F315F
 004F314B    push        esi
 004F314C    push        0
 004F314E    push        0B031
 004F3153    mov         eax,dword ptr [ebx+170]
 004F3159    push        eax
 004F315A    call        user32.SendMessageW
 004F315F    mov         dword ptr [ebx+0B8],esi
 004F3165    pop         esi
 004F3166    pop         ebx
 004F3167    ret
*}
end;

//004F3168
function TApplication.GetActiveFormHandle:HWND;
begin
{*
 004F3168    push        ebx
 004F3169    push        ecx
 004F316A    mov         ebx,eax
 004F316C    xor         eax,eax
 004F316E    mov         dword ptr [esp],eax
 004F3171    cmp         word ptr [ebx+0FA],0
>004F3179    je          004F3189
 004F317B    mov         edx,esp
 004F317D    mov         eax,dword ptr [ebx+0FC]
 004F3183    call        dword ptr [ebx+0F8]
 004F3189    cmp         dword ptr [esp],0
>004F318D    jne         004F3197
 004F318F    call        user32.GetActiveWindow
 004F3194    mov         dword ptr [esp],eax
 004F3197    cmp         dword ptr [esp],0
>004F319B    jne         004F31AC
 004F319D    mov         eax,dword ptr [ebx+170]
 004F31A3    push        eax
 004F31A4    call        user32.GetLastActivePopup
 004F31A9    mov         dword ptr [esp],eax
 004F31AC    mov         eax,dword ptr [esp]
 004F31AF    pop         edx
 004F31B0    pop         ebx
 004F31B1    ret
*}
end;

//004F31B4
function TApplication.GetMainFormHandle:HWND;
begin
{*
 004F31B4    push        ebx
 004F31B5    push        ecx
 004F31B6    mov         ebx,eax
 004F31B8    xor         eax,eax
 004F31BA    mov         dword ptr [esp],eax
 004F31BD    cmp         word ptr [ebx+102],0
>004F31C5    je          004F31D5
 004F31C7    mov         edx,esp
 004F31C9    mov         eax,dword ptr [ebx+104]
 004F31CF    call        dword ptr [ebx+100]
 004F31D5    cmp         dword ptr [esp],0
>004F31D9    jne         004F31EC
 004F31DB    cmp         dword ptr [ebx+44],0
>004F31DF    je          004F31EC
 004F31E1    mov         eax,dword ptr [ebx+44]
 004F31E4    call        TWinControl.GetHandle
 004F31E9    mov         dword ptr [esp],eax
 004F31EC    mov         eax,dword ptr [esp]
 004F31EF    pop         edx
 004F31F0    pop         ebx
 004F31F1    ret
*}
end;

//004F31F4
function TApplication.DispatchAction(Msg:LongInt; Action:TBasicAction):Boolean;
begin
{*
 004F31F4    push        ebx
 004F31F5    push        esi
 004F31F6    push        edi
 004F31F7    push        ebp
 004F31F8    add         esp,0FFFFFFF8
 004F31FB    mov         ebx,ecx
 004F31FD    mov         dword ptr [esp],edx
 004F3200    mov         esi,eax
 004F3202    mov         eax,[007932F0];Screen:TScreen
 004F3207    mov         edi,dword ptr [eax+64]
 004F320A    test        edi,edi
>004F320C    je          004F321F
 004F320E    push        ebx
 004F320F    xor         ecx,ecx
 004F3211    mov         edx,dword ptr [esp+4]
 004F3215    mov         eax,edi
 004F3217    call        TControl.Perform
 004F321C    dec         eax
>004F321D    je          004F323F
 004F321F    mov         ebp,dword ptr [esi+44]
 004F3222    cmp         edi,ebp
>004F3224    je          004F323B
 004F3226    test        ebp,ebp
>004F3228    je          004F323B
 004F322A    push        ebx
 004F322B    xor         ecx,ecx
 004F322D    mov         edx,dword ptr [esp+4]
 004F3231    mov         eax,ebp
 004F3233    call        TControl.Perform
 004F3238    dec         eax
>004F3239    je          004F323F
 004F323B    xor         eax,eax
>004F323D    jmp         004F3241
 004F323F    mov         al,1
 004F3241    mov         byte ptr [esp+4],al
 004F3245    cmp         byte ptr [esp+4],0
>004F324A    jne         004F327E
 004F324C    mov         eax,ebx
 004F324E    mov         edx,dword ptr ds:[4743FC];TCustomAction
 004F3254    call        @IsClass
 004F3259    test        al,al
>004F325B    je          004F327E
 004F325D    cmp         byte ptr [ebx+6A],0
>004F3261    je          004F327E
 004F3263    cmp         byte ptr [ebx+60],0
>004F3267    je          004F327E
 004F3269    test        byte ptr [ebx+1C],10
>004F326D    jne         004F327E
 004F326F    cmp         word ptr [ebx+42],0
 004F3274    setne       dl
 004F3277    mov         eax,ebx
 004F3279    call        TCustomAction.SetEnabled
 004F327E    movzx       eax,byte ptr [esp+4]
 004F3283    pop         ecx
 004F3284    pop         edx
 004F3285    pop         ebp
 004F3286    pop         edi
 004F3287    pop         esi
 004F3288    pop         ebx
 004F3289    ret
*}
end;

//004F328C
function TApplication.ExecuteAction(Action:TBasicAction):Boolean;
begin
{*
 004F328C    push        ebx
 004F328D    push        ecx
 004F328E    mov         byte ptr [esp],0
 004F3292    cmp         word ptr [eax+0E2],0
>004F329A    je          004F32AC
 004F329C    mov         ecx,esp
 004F329E    mov         ebx,eax
 004F32A0    mov         eax,dword ptr [ebx+0E4]
 004F32A6    call        dword ptr [ebx+0E0]
 004F32AC    movzx       eax,byte ptr [esp]
 004F32B0    pop         edx
 004F32B1    pop         ebx
 004F32B2    ret
*}
end;

//004F32B4
function TApplication.UpdateAction(Action:TBasicAction):Boolean;
begin
{*
 004F32B4    push        ebx
 004F32B5    push        ecx
 004F32B6    mov         byte ptr [esp],0
 004F32BA    cmp         word ptr [eax+0EA],0
>004F32C2    je          004F32D4
 004F32C4    mov         ecx,esp
 004F32C6    mov         ebx,eax
 004F32C8    mov         eax,dword ptr [ebx+0EC]
 004F32CE    call        dword ptr [ebx+0E8]
 004F32D4    movzx       eax,byte ptr [esp]
 004F32D8    pop         edx
 004F32D9    pop         ebx
 004F32DA    ret
*}
end;

//004F32DC
procedure InitProcs;
begin
{*
 004F32DC    push        ebx
 004F32DD    push        4F3300
 004F32E2    call        kernel32.GetModuleHandleW
 004F32E7    mov         ebx,eax
 004F32E9    test        ebx,ebx
>004F32EB    je          004F32FD
 004F32ED    push        4F3318
 004F32F2    push        ebx
 004F32F3    call        GetProcAddress
 004F32F8    mov         [007866F4],eax
 004F32FD    pop         ebx
 004F32FE    ret
*}
end;

//004F3350
procedure TApplication.WakeMainThread(Sender:TObject);
begin
{*
 004F3350    push        0
 004F3352    push        0
 004F3354    push        0
 004F3356    mov         eax,dword ptr [eax+170]
 004F335C    push        eax
 004F335D    call        user32.PostMessageW
 004F3362    ret
*}
end;

//004F3364
procedure TApplication.HookSynchronizeWakeup;
begin
{*
 004F3364    mov         edx,dword ptr ds:[78DA34]
 004F336A    mov         dword ptr [edx+4],eax
 004F336D    mov         dword ptr [edx],4F3350;TApplication.WakeMainThread
 004F3373    ret
*}
end;

//004F3374
procedure TApplication.UnhookSynchronizeWakeup;
begin
{*
 004F3374    mov         eax,[0078DA34]
 004F3379    xor         edx,edx
 004F337B    mov         dword ptr [eax],edx
 004F337D    mov         dword ptr [eax+4],edx
 004F3380    ret
*}
end;

//004F3384
function TApplication.IsPreProcessMessage(var Msg:TMsg):Boolean;
begin
{*
 004F3384    push        ebx
 004F3385    push        esi
 004F3386    push        edi
 004F3387    push        ebp
 004F3388    mov         edi,edx
 004F338A    mov         esi,eax
 004F338C    xor         ebx,ebx
 004F338E    call        user32.GetCapture
 004F3393    mov         ebp,eax
 004F3395    test        ebp,ebp
>004F3397    jne         004F33E7
 004F3399    mov         ebp,dword ptr [edi]
 004F339B    mov         eax,dword ptr [esi+44]
 004F339E    test        eax,eax
>004F33A0    je          004F33AE
 004F33A2    cmp         ebp,dword ptr [eax+37C]
>004F33A8    jne         004F33AE
 004F33AA    mov         esi,eax
>004F33AC    jmp         004F33D4
 004F33AE    mov         eax,ebp
 004F33B0    call        FindControl
 004F33B5    mov         esi,eax
 004F33B7    test        esi,esi
>004F33B9    jne         004F33D4
 004F33BB    push        ebp
 004F33BC    call        user32.GetParent
 004F33C1    mov         ebp,eax
 004F33C3    test        ebp,ebp
>004F33C5    je          004F33D4
 004F33C7    mov         eax,ebp
 004F33C9    call        FindControl
 004F33CE    mov         esi,eax
 004F33D0    test        esi,esi
>004F33D2    je          004F33BB
 004F33D4    test        esi,esi
>004F33D6    je          004F33E7
 004F33D8    mov         edx,edi
 004F33DA    mov         eax,esi
 004F33DC    mov         si,0FFB0
 004F33E0    call        @CallDynaInst
 004F33E5    mov         ebx,eax
 004F33E7    mov         eax,ebx
 004F33E9    pop         ebp
 004F33EA    pop         edi
 004F33EB    pop         esi
 004F33EC    pop         ebx
 004F33ED    ret
*}
end;

//004F33F0
procedure TApplication.InternalRestore;
begin
{*
 004F33F0    push        ebx
 004F33F1    push        esi
 004F33F2    mov         ebx,eax
 004F33F4    mov         byte ptr [ebx+34],0
 004F33F8    mov         eax,[007932F0];Screen:TScreen
 004F33FD    mov         eax,dword ptr [eax+68]
 004F3400    mov         esi,dword ptr [ebx+44]
 004F3403    cmp         eax,esi
>004F3405    je          004F3425
 004F3407    test        esi,esi
>004F3409    je          004F3425
 004F340B    cmp         byte ptr [esi+29E],2
>004F3412    je          004F3425
 004F3414    mov         eax,esi
 004F3416    call        TWinControl.GetHandle
 004F341B    mov         edx,9
 004F3420    call        ShowWinNoAnimate
 004F3425    mov         eax,dword ptr [ebx+170]
 004F342B    push        eax
 004F342C    call        user32.SetActiveWindow
 004F3431    mov         eax,ebx
 004F3433    call        TApplication.RestoreTopMosts
 004F3438    mov         dl,1
 004F343A    mov         eax,ebx
 004F343C    call        TApplication.DoShowOwnedPopups
 004F3441    mov         eax,[007932F0];Screen:TScreen
 004F3446    mov         esi,dword ptr [eax+60]
 004F3449    test        esi,esi
>004F344B    je          004F345A
 004F344D    mov         eax,esi
 004F344F    call        TWinControl.GetHandle
 004F3454    push        eax
 004F3455    call        user32.SetFocus
 004F345A    cmp         word ptr [ebx+152],0
>004F3462    je          004F3472
 004F3464    mov         edx,ebx
 004F3466    mov         eax,dword ptr [ebx+154]
 004F346C    call        dword ptr [ebx+150]
 004F3472    pop         esi
 004F3473    pop         ebx
 004F3474    ret
*}
end;

//004F3478
procedure TApplication.SetMainFormOnTaskBar(const Value:Boolean);
begin
{*
 004F3478    push        ebx
 004F3479    push        esi
 004F347A    push        edi
 004F347B    push        ecx
 004F347C    mov         ebx,edx
 004F347E    mov         esi,eax
 004F3480    cmp         bl,byte ptr [esi+0D3]
>004F3486    je          004F35B4
 004F348C    mov         byte ptr [esi+0D3],bl
 004F3492    mov         edi,dword ptr [esi+44]
 004F3495    test        edi,edi
>004F3497    je          004F3550
 004F349D    mov         eax,edi
 004F349F    call        TWinControl.HandleAllocated
 004F34A4    test        al,al
>004F34A6    je          004F3550
 004F34AC    mov         eax,dword ptr [esi+44]
 004F34AF    test        byte ptr [eax+1C],10
>004F34B3    jne         004F3550
 004F34B9    mov         eax,dword ptr [esi+44]
 004F34BC    test        byte ptr [eax+1C],2
>004F34C0    jne         004F3550
 004F34C6    test        bl,bl
>004F34C8    je          004F34F1
 004F34CA    xor         ecx,ecx
 004F34CC    xor         edx,edx
 004F34CE    mov         eax,dword ptr [esi+170]
 004F34D4    call        ChangeAppWindow
 004F34D9    mov         eax,dword ptr [esi+44]
 004F34DC    call        TWinControl.GetHandle
 004F34E1    mov         edx,dword ptr [esi+44]
 004F34E4    movzx       ecx,byte ptr [edx+59]
 004F34E8    mov         dl,1
 004F34EA    call        ChangeAppWindow
>004F34EF    jmp         004F353F
 004F34F1    mov         eax,dword ptr [esi+44]
 004F34F4    call        TWinControl.GetHandle
 004F34F9    mov         edi,eax
 004F34FB    call        user32.GetForegroundWindow
 004F3500    cmp         edi,eax
 004F3502    sete        byte ptr [esp]
 004F3506    mov         eax,dword ptr [esi+44]
 004F3509    call        TWinControl.GetHandle
 004F350E    mov         edx,dword ptr [esi+44]
 004F3511    movzx       ecx,byte ptr [edx+59]
 004F3515    xor         edx,edx
 004F3517    call        ChangeAppWindow
 004F351C    mov         cl,1
 004F351E    mov         dl,1
 004F3520    mov         eax,dword ptr [esi+170]
 004F3526    call        ChangeAppWindow
 004F352B    cmp         byte ptr [esp],0
>004F352F    je          004F353F
 004F3531    mov         eax,dword ptr [esi+44]
 004F3534    call        TWinControl.GetHandle
 004F3539    push        eax
 004F353A    call        user32.SetForegroundWindow
 004F353F    push        0
 004F3541    xor         ecx,ecx
 004F3543    mov         edx,0B033
 004F3548    mov         eax,dword ptr [esi+44]
 004F354B    call        TControl.Perform
 004F3550    test        bl,bl
>004F3552    je          004F3580
 004F3554    push        0EC
 004F3556    mov         ebx,dword ptr [esi+170]
 004F355C    push        ebx
 004F355D    call        user32.GetWindowLongW
 004F3562    or          eax,80
 004F3567    push        eax
 004F3568    push        0EC
 004F356A    push        ebx
 004F356B    call        user32.SetWindowLongW
 004F3570    push        0
 004F3572    mov         eax,dword ptr [esi+170]
 004F3578    push        eax
 004F3579    call        user32.SetWindowTextW
>004F357E    jmp         004F35B4
 004F3580    push        0EC
 004F3582    mov         ebx,dword ptr [esi+170]
 004F3588    push        ebx
 004F3589    call        user32.GetWindowLongW
 004F358E    and         eax,0FFFFFF7F
 004F3593    push        eax
 004F3594    push        0EC
 004F3596    push        ebx
 004F3597    call        user32.SetWindowLongW
 004F359C    mov         eax,dword ptr [esi+8C]
 004F35A2    call        @UStrToPWChar
 004F35A7    push        eax
 004F35A8    mov         eax,dword ptr [esi+170]
 004F35AE    push        eax
 004F35AF    call        user32.SetWindowTextW
 004F35B4    pop         edx
 004F35B5    pop         edi
 004F35B6    pop         esi
 004F35B7    pop         ebx
 004F35B8    ret
*}
end;

//004F35BC
constructor TGlassFrame.Create;
begin
{*
 004F35BC    push        ebx
 004F35BD    push        esi
 004F35BE    push        edi
 004F35BF    test        dl,dl
>004F35C1    je          004F35CB
 004F35C3    add         esp,0FFFFFFF0
 004F35C6    call        @ClassCreate
 004F35CB    mov         esi,ecx
 004F35CD    mov         ebx,edx
 004F35CF    mov         edi,eax
 004F35D1    xor         edx,edx
 004F35D3    mov         eax,edi
 004F35D5    call        TObject.Create
 004F35DA    mov         dword ptr [edi+4],esi
 004F35DD    xor         eax,eax
 004F35DF    mov         dword ptr [edi+0C],eax
 004F35E2    xor         eax,eax
 004F35E4    mov         dword ptr [edi+10],eax
 004F35E7    xor         eax,eax
 004F35E9    mov         dword ptr [edi+14],eax
 004F35EC    xor         eax,eax
 004F35EE    mov         dword ptr [edi+18],eax
 004F35F1    mov         byte ptr [edi+28],0
 004F35F5    mov         eax,edi
 004F35F7    test        bl,bl
>004F35F9    je          004F360A
 004F35FB    call        @AfterConstruction
 004F3600    pop         dword ptr fs:[0]
 004F3607    add         esp,0C
 004F360A    mov         eax,edi
 004F360C    pop         edi
 004F360D    pop         esi
 004F360E    pop         ebx
 004F360F    ret
*}
end;

//004F3610
procedure TGlassFrame.Assign(Source:TPersistent);
begin
{*
 004F3610    push        ebx
 004F3611    push        esi
 004F3612    mov         esi,edx
 004F3614    mov         ebx,eax
 004F3616    mov         eax,esi
 004F3618    mov         edx,dword ptr ds:[4DF478];TGlassFrame
 004F361E    call        @IsClass
 004F3623    test        al,al
>004F3625    je          004F3659
 004F3627    mov         eax,esi
 004F3629    movzx       edx,byte ptr [eax+8]
 004F362D    mov         byte ptr [ebx+8],dl
 004F3630    mov         edx,dword ptr [eax+0C]
 004F3633    mov         dword ptr [ebx+0C],edx
 004F3636    mov         edx,dword ptr [eax+10]
 004F3639    mov         dword ptr [ebx+10],edx
 004F363C    mov         edx,dword ptr [eax+14]
 004F363F    mov         dword ptr [ebx+14],edx
 004F3642    mov         edx,dword ptr [eax+18]
 004F3645    mov         dword ptr [ebx+18],edx
 004F3648    movzx       eax,byte ptr [eax+28]
 004F364C    mov         byte ptr [ebx+28],al
 004F364F    mov         eax,ebx
 004F3651    mov         edx,dword ptr [eax]
 004F3653    call        dword ptr [edx+0C]
 004F3656    pop         esi
 004F3657    pop         ebx
 004F3658    ret
 004F3659    mov         edx,esi
 004F365B    mov         eax,ebx
 004F365D    call        TPersistent.Assign
 004F3662    pop         esi
 004F3663    pop         ebx
 004F3664    ret
*}
end;

//004F3668
procedure TGlassFrame.Change;
begin
{*
 004F3668    push        ebx
 004F3669    push        esi
 004F366A    add         esp,0FFFFFFF0
 004F366D    mov         ebx,eax
 004F366F    mov         eax,dword ptr [ebx+4]
 004F3672    test        byte ptr [eax+1C],1
>004F3676    jne         004F36BB
 004F3678    cmp         word ptr [ebx+22],0
>004F367D    je          004F3687
 004F367F    mov         edx,ebx
 004F3681    mov         eax,dword ptr [ebx+24]
 004F3684    call        dword ptr [ebx+20]
 004F3687    mov         eax,dword ptr [ebx+4]
 004F368A    call        TControl.GetClientHeight
 004F368F    sub         eax,dword ptr [ebx+18]
 004F3692    push        eax
 004F3693    lea         eax,[esp+4]
 004F3697    push        eax
 004F3698    mov         esi,dword ptr [ebx+4]
 004F369B    mov         eax,esi
 004F369D    call        TControl.GetClientWidth
 004F36A2    mov         ecx,eax
 004F36A4    sub         ecx,dword ptr [ebx+14]
 004F36A7    mov         edx,dword ptr [ebx+10]
 004F36AA    mov         eax,dword ptr [ebx+0C]
 004F36AD    call        Rect
 004F36B2    mov         edx,esp
 004F36B4    mov         eax,esi
 004F36B6    call        TCustomForm.UpdateGlassFrameControls
 004F36BB    add         esp,10
 004F36BE    pop         esi
 004F36BF    pop         ebx
 004F36C0    ret
*}
end;

//004F36C4
function TGlassFrame.FrameExtended:Boolean;
begin
{*
 004F36C4    push        ebx
 004F36C5    mov         ebx,eax
 004F36C7    cmp         byte ptr [ebx+8],0
>004F36CB    je          004F36F4
 004F36CD    call        DwmCompositionEnabled
 004F36D2    test        al,al
>004F36D4    je          004F36F4
 004F36D6    cmp         byte ptr [ebx+28],0
>004F36DA    jne         004F36F8
 004F36DC    cmp         dword ptr [ebx+0C],0
>004F36E0    jne         004F36F8
 004F36E2    cmp         dword ptr [ebx+10],0
>004F36E6    jne         004F36F8
 004F36E8    cmp         dword ptr [ebx+14],0
>004F36EC    jne         004F36F8
 004F36EE    cmp         dword ptr [ebx+18],0
>004F36F2    jne         004F36F8
 004F36F4    xor         eax,eax
 004F36F6    pop         ebx
 004F36F7    ret
 004F36F8    mov         al,1
 004F36FA    pop         ebx
 004F36FB    ret
*}
end;

//004F36FC
function TGlassFrame.IntersectsControl(Control:TControl):Boolean;
begin
{*
 004F36FC    push        ebx
 004F36FD    push        esi
 004F36FE    push        edi
 004F36FF    add         esp,0FFFFFFC8
 004F3702    mov         edi,edx
 004F3704    mov         esi,eax
 004F3706    xor         ebx,ebx
 004F3708    cmp         byte ptr [esi+8],0
>004F370C    je          004F37D6
 004F3712    call        DwmCompositionEnabled
 004F3717    test        al,al
>004F3719    je          004F37D6
 004F371F    movzx       ebx,byte ptr [esi+28]
 004F3723    test        bl,bl
>004F3725    jne         004F37D6
 004F372B    mov         edx,esp
 004F372D    mov         eax,edi
 004F372F    mov         ecx,dword ptr [eax]
 004F3731    call        dword ptr [ecx+54]
 004F3734    lea         eax,[esp+20]
 004F3738    push        eax
 004F3739    lea         edx,[esp+4]
 004F373D    mov         ecx,dword ptr [esi+4]
 004F3740    mov         eax,edi
 004F3742    call        TControl.ClientToParent
 004F3747    mov         eax,dword ptr [esp+20]
 004F374B    mov         dword ptr [esp],eax
 004F374E    mov         eax,dword ptr [esp+24]
 004F3752    mov         dword ptr [esp+4],eax
 004F3756    lea         eax,[esp+20]
 004F375A    push        eax
 004F375B    lea         edx,[esp+0C]
 004F375F    mov         ecx,dword ptr [esi+4]
 004F3762    mov         eax,edi
 004F3764    call        TControl.ClientToParent
 004F3769    mov         eax,dword ptr [esp+20]
 004F376D    mov         dword ptr [esp+8],eax
 004F3771    mov         eax,dword ptr [esp+24]
 004F3775    mov         dword ptr [esp+0C],eax
 004F3779    lea         edx,[esp+10]
 004F377D    mov         eax,dword ptr [esi+4]
 004F3780    mov         ecx,dword ptr [eax]
 004F3782    call        dword ptr [ecx+54]
 004F3785    mov         eax,dword ptr [esp+1C]
 004F3789    sub         eax,dword ptr [esi+18]
 004F378C    push        eax
 004F378D    lea         eax,[esp+2C]
 004F3791    push        eax
 004F3792    mov         ecx,dword ptr [esp+20]
 004F3796    sub         ecx,dword ptr [esi+14]
 004F3799    mov         edx,dword ptr [esi+10]
 004F379C    mov         eax,dword ptr [esi+0C]
 004F379F    call        Rect
 004F37A4    lea         esi,[esp+28]
 004F37A8    lea         edi,[esp+10]
 004F37AC    movs        dword ptr [edi],dword ptr [esi]
 004F37AD    movs        dword ptr [edi],dword ptr [esi]
 004F37AE    movs        dword ptr [edi],dword ptr [esi]
 004F37AF    movs        dword ptr [edi],dword ptr [esi]
 004F37B0    mov         edx,esp
 004F37B2    lea         eax,[esp+10]
 004F37B6    call        PtInRect
 004F37BB    test        al,al
>004F37BD    je          004F37D4
 004F37BF    lea         edx,[esp+8]
 004F37C3    lea         eax,[esp+10]
 004F37C7    call        PtInRect
 004F37CC    test        al,al
>004F37CE    je          004F37D4
 004F37D0    xor         ebx,ebx
>004F37D2    jmp         004F37D6
 004F37D4    mov         bl,1
 004F37D6    mov         eax,ebx
 004F37D8    add         esp,38
 004F37DB    pop         edi
 004F37DC    pop         esi
 004F37DD    pop         ebx
 004F37DE    ret
*}
end;

//004F37E0
procedure TGlassFrame.SetEnabled(Value:Boolean);
begin
{*
 004F37E0    push        ebx
 004F37E1    mov         ebx,eax
 004F37E3    cmp         dl,byte ptr [ebx+8]
>004F37E6    je          004F380E
 004F37E8    mov         byte ptr [ebx+8],dl
 004F37EB    cmp         byte ptr [ebx+8],0
>004F37EF    je          004F3807
 004F37F1    mov         eax,dword ptr [ebx+4]
 004F37F4    cmp         byte ptr [eax+368],0
>004F37FB    je          004F3807
 004F37FD    xor         edx,edx
 004F37FF    mov         eax,dword ptr [ebx+4]
 004F3802    call        TCustomForm.SetTransparentColor
 004F3807    mov         eax,ebx
 004F3809    mov         edx,dword ptr [eax]
 004F380B    call        dword ptr [edx+0C]
 004F380E    pop         ebx
 004F380F    ret
*}
end;

//004F3810
procedure TGlassFrame.SetExtendedFrame(Index:Integer; Value:Integer);
begin
{*
 004F3810    push        esi
 004F3811    mov         esi,eax
 004F3813    sub         edx,1
>004F3816    jb          004F3822
>004F3818    je          004F3833
 004F381A    dec         edx
>004F381B    je          004F3844
 004F381D    dec         edx
>004F381E    je          004F3855
>004F3820    jmp         004F386B
 004F3822    cmp         ecx,dword ptr [esi+0C]
>004F3825    je          004F3864
 004F3827    mov         dword ptr [esi+0C],ecx
 004F382A    inc         ecx
>004F382B    jne         004F3864
 004F382D    mov         byte ptr [esi+28],1
>004F3831    jmp         004F3864
 004F3833    cmp         ecx,dword ptr [esi+10]
>004F3836    je          004F3864
 004F3838    mov         dword ptr [esi+10],ecx
 004F383B    inc         ecx
>004F383C    jne         004F3864
 004F383E    mov         byte ptr [esi+28],1
>004F3842    jmp         004F3864
 004F3844    cmp         ecx,dword ptr [esi+14]
>004F3847    je          004F3864
 004F3849    mov         dword ptr [esi+14],ecx
 004F384C    inc         ecx
>004F384D    jne         004F3864
 004F384F    mov         byte ptr [esi+28],1
>004F3853    jmp         004F3864
 004F3855    cmp         ecx,dword ptr [esi+18]
>004F3858    je          004F3864
 004F385A    mov         dword ptr [esi+18],ecx
 004F385D    inc         ecx
>004F385E    jne         004F3864
 004F3860    mov         byte ptr [esi+28],1
 004F3864    mov         eax,esi
 004F3866    mov         edx,dword ptr [eax]
 004F3868    call        dword ptr [edx+0C]
 004F386B    pop         esi
 004F386C    ret
*}
end;

//004F3870
procedure TGlassFrame.SetSheetOfGlass(Value:Boolean);
begin
{*
 004F3870    cmp         dl,byte ptr [eax+28]
>004F3873    je          004F389B
 004F3875    cmp         byte ptr [eax+28],0
>004F3879    je          004F3893
 004F387B    cmp         dword ptr [eax+0C],0FFFFFFFF
>004F387F    je          004F389B
 004F3881    cmp         dword ptr [eax+10],0FFFFFFFF
>004F3885    je          004F389B
 004F3887    cmp         dword ptr [eax+14],0FFFFFFFF
>004F388B    je          004F389B
 004F388D    cmp         dword ptr [eax+18],0FFFFFFFF
>004F3891    je          004F389B
 004F3893    mov         byte ptr [eax+28],dl
 004F3896    mov         edx,dword ptr [eax]
 004F3898    call        dword ptr [edx+0C]
 004F389B    ret
*}
end;

Initialization
//00780C18
{*
 00780C18    sub         dword ptr ds:[7932F4],1
>00780C1F    jae         00780C50
 00780C21    mov         eax,4F389C
 00780C26    call        @InitImports
 00780C2B    call        InitProcs
 00780C30    push        780C54
 00780C35    call        user32.RegisterWindowMessageW
 00780C3A    mov         [007932F8],eax
 00780C3F    mov         eax,4E56B4;FindGlobalComponent:TComponent
 00780C44    call        RegisterFindGlobalComponentProc
 00780C49    xor         eax,eax
 00780C4B    mov         [0079330C],eax
 00780C50    ret
*}
Finalization
//004F38AC
{*
 004F38AC    inc         dword ptr ds:[7932F4]
>004F38B2    jne         004F38E0
 004F38B4    cmp         dword ptr ds:[7932EC],0;Application:TApplication
>004F38BB    je          004F38C2
 004F38BD    call        DoneApplication
 004F38C2    cmp         dword ptr ds:[793300],0
>004F38C9    je          004F38D6
 004F38CB    mov         eax,[00793300]
 004F38D0    push        eax
 004F38D1    call        kernel32.CloseHandle
 004F38D6    mov         eax,4E56B4;FindGlobalComponent:TComponent
 004F38DB    call        UnregisterFindGlobalComponentProc
 004F38E0    ret
*}
end.