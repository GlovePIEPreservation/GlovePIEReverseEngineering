//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit ComCtrls;

interface

uses
  SysUtils, Classes, Graphics, ImgList, Menus, ComCtrls;

type
  THitTest = (htAbove, htBelow, htNowhere, htOnItem, htOnButton, htOnIcon, htOnIndent, htOnLabel, htOnRight, htOnStateIcon, htToLeft, htToRight);
  THitTests = set of THitTest;
  TTabChangingEvent = procedure(Sender:TObject; var AllowChange:Boolean) of object;;
  TTabPosition = (tpTop, tpBottom, tpLeft, tpRight);
  TTabStyle = (tsTabs, tsButtons, tsFlatButtons);
  TDrawTabEvent = procedure(Control:TCustomTabControl; TabIndex:Integer; const Rect:TRect; Active:Boolean) of object;;
  TTabGetImageEvent = procedure(Sender:TObject; TabIndex:Integer; var ImageIndex:Integer) of object;;
  TCustomTabControl = class(TWinControl)
  published
    function TabRect(Index:Integer):TRect;//004CE940
    function RowCount:Integer;//004CE960
    function GetHitTestInfoAt(X:Integer; Y:Integer):THitTests;//004CE894
    destructor Destroy();//004CDB84
    function IndexOfTabAt(X:Integer; Y:Integer):Integer;//004CE834
    procedure ScrollTabs(Delta:Integer);//004CE978
    constructor Create;//004CDAC4
  public
    FCanvas:TCanvas;//f270
    FHotTrack:Boolean;//f274
    FImageChangeLink:TChangeLink;//f278
    FImages:TCustomImageList;//f27C
    FMultiLine:Boolean;//f280
    FMultiSelect:Boolean;//f281
    FOwnerDraw:Boolean;//f282
    FRaggedRight:Boolean;//f283
    FSaveTabIndex:Integer;//f284
    FSaveTabs:TStringList;//f288
    FScrollOpposite:Boolean;//f28C
    FStyle:TTabStyle;//f28D
    FTabPosition:TTabPosition;//f28E
    FTabs:TStrings;//f290
    FTabSize:TSmallPoint;//f294
    FTabSize:SmallInt;//f296
    FUpdating:Boolean;//f298
    FSavedAdjustRect:TRect;//f29C
    FOnChange:TNotifyEvent;//f2B0
    FOnChanging:TTabChangingEvent;//f2B8
    FOnDrawTab:TDrawTabEvent;//f2C0
    FOnGetImageIndex:TTabGetImageEvent;//f2C8
    destructor Destroy(); virtual;//004CDB84
    procedure Loaded; virtual;//vC//004CDEAC
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//004CDEDC
    constructor Create; virtual;//v2C//004CDAC4
    procedure AdjustClientRect(var Rect:TRect); virtual;//vA0//004CE804
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004CDC48
    procedure CreateWnd; virtual;//vB4//004CDD60
    //function vEC:?; virtual;//vEC//004CDC24
    procedure DrawTab(TabIndex:Integer; const Rect:TRect; Active:Boolean); virtual;//vF0//004CDDF4
    function GetImageIndex(TabIndex:Integer):Integer; virtual;//vF4//004CDE68
    procedure SetTabIndex(Value:Integer); virtual;//vF8//004CE1CC
    procedure WMDestroy(var Message:TWMDestroy); message WM_DESTROY;//004CE5AC
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//004CE660
    procedure TCMAdjustRect(var Message:TTCMAdjustRect); dynamic;//004CEA34
    procedure CMDialogChar(var Message:TCMDialogChar); message CM_DIALOGCHAR;//004CE720
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//004CE680
    procedure CMTabStopChanged(var Message:TMessage); message CM_TABSTOPCHANGED;//004CE6D0
    procedure CNDrawItem(var Message:TWMDrawItem); dynamic;//004CE4B8
    procedure CNNotify(var Message:TWMNotify); dynamic;//004CE6DC
    procedure CanChange; dynamic;//004CDBF8
    function GetDisplayRect:TRect;//004CDE30
    function GetTabIndex:Integer;//004CDE90
    procedure SetHotTrack(Value:Boolean);//004CDEC8
    procedure SetImages(Value:TCustomImageList);//004CDF0C
    procedure ImageListChange(Sender:TObject);//004CDF7C
    function InternalSetMultiLine(Value:Boolean):Boolean;//004CDF9C
    procedure SetMultiLine(Value:Boolean);//004CE02C
    procedure SetOwnerDraw(Value:Boolean);//004CE04C
    procedure SetRaggedRight(Value:Boolean);//004CE060
    procedure SetScrollOpposite(Value:Boolean);//004CE07C
    procedure SetStyle(Value:TTabStyle);//004CE09C
    procedure SetTabHeight(Value:SmallInt);//004CE12C
    procedure SetTabPosition(Value:TTabPosition);//004CE1F0
    procedure SetTabWidth(Value:SmallInt);//004CE288
    procedure TabsChanged;//004CE340
    procedure UpdateTabSize;//004CE380
    procedure UpdateTabImages;//004CE3BC
    function GetTabs:TStrings;//004CEAB8
  end;
  TTabSheet = class(TWinControl)
  published
    constructor Create;//004CEACC
    destructor Destroy();//004CEB34
  public
    FImageIndex:TImageIndex;//f270
    FPageControl:TPageControl;//f274
    FTabVisible:Boolean;//f278
    FTabShowing:Boolean;//f279
    FHighlighted:Boolean;//f27A
    FOnHide:TNotifyEvent;//f280
    FOnShow:TNotifyEvent;//f288
    destructor Destroy(); virtual;//004CEB34
    procedure ReadState(Reader:TReader); virtual;//v14//004CEC48
    constructor Create; virtual;//v2C//004CEACC
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004CEC2C
    procedure UpdateControlOriginalParentSize(AControl:TControl; var AOriginalParentSize:TPoint); virtual;//vE4//004CEDC4
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//004CF088
    procedure WMNCPaint(var Message:TWMNCPaint); message WM_NCPAINT;//004CEF70
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//004CEE14
    procedure CMShowingChanged(var Message:TMessage); message CM_SHOWINGCHANGED;//004CEE2C
    procedure DoShow; dynamic;//004CEBA0
    procedure DoHide; dynamic;//004CEB80
    function GetPageIndex:Integer;//004CEBC0
    function GetTabIndex:Integer;//004CEBDC
    procedure SetImageIndex(Value:TImageIndex);//004CEC7C
    procedure SetPageControl(APageControl:TPageControl);//004CECA4
    procedure SetPageIndex(Value:Integer);//004CECD8
    procedure SetTabShowing(Value:Boolean);//004CED6C
    procedure SetTabVisible(Value:Boolean);//004CEDB0
    procedure UpdateTabShowing;//004CEDF4
    procedure SetHighlighted(Value:Boolean);//004CEED4
  end;
  TPageControl = class(TCustomTabControl)
  published
    function FindNextPage(CurPage:TTabSheet; GoForward:Boolean; CheckTabVisible:Boolean):TTabSheet;//004CF4C8
    constructor Create;//004CF154
    destructor Destroy();//004CF1A8
    procedure GetChildren(Root:TComponent; Proc:TGetChildProc);//004CF550
    procedure SelectNextPage(GoForward:Boolean; CheckTabVisible:Boolean);//004CF7C8
  public
    FPages:TList;//f2D0
    FActivePage:TTabSheet;//f2D4
    FNewDockSheet:TTabSheet;//f2D8
    FUndockingPage:TTabSheet;//f2DC
    FInSetActivePage:Boolean;//f2E0
    destructor Destroy(); virtual;//004CF1A8
    procedure Loaded; virtual;//vC//004CF248
    constructor Create; virtual;//v2C//004CF154
    procedure ShowControl(AControl:TControl); virtual;//vE0//004CF8B4
    function CanShowTab(TabIndex:Integer):Boolean; virtual;//vEC//004CF25C
    function GetImageIndex(TabIndex:Integer):Integer; virtual;//vF4//004CF590
    procedure SetTabIndex(Value:Integer); virtual;//vF8//004CFEB8
    procedure UpdateActivePage; virtual;//vFC//004CF948
    procedure WMEraseBkGnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//004CFF10
    procedure WMLButtonDown(var Message:TWMLButtonDown); message WM_LBUTTONDOWN;//004CFDC8
    procedure WMLButtonDblClk(var Message:TWMLButtonDblClk); message WM_LBUTTONDBLCLK;//004CFE1C
    procedure CMDialogKey(var Message:TCMDialogKey); message CM_DIALOGKEY;//004CF9EC
    procedure CMDesignHitTest(var Message:TCMDesignHitTest); message CM_DESIGNHITTEST;//004CF984
    procedure CMDockClient(var Message:TCMDockClient); message CM_DOCKCLIENT;//004CFA58
    procedure CMUnDockClient(var Message:TCMUnDockClient); message CM_UNDOCKCLIENT;//004CFD0C
    procedure CMDockNotification(var Message:TCMDockNotification); dynamic;//004CFBF4
    procedure DoClose; dynamic;//004CF280
    procedure GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean); dynamic;//004CF680
    procedure DoRemoveDockClient(Client:TControl); dynamic;//004CF494
    procedure DockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean); dynamic;//004CF440
    procedure DoAddDockClient(Client:TControl; const ARect:TRect); dynamic;//004CF42C
    procedure SetChildOrder(Child:TComponent; Order:Integer); dynamic;//004CF8A8
    procedure GetChildren(Root:TComponent; Proc:TGetChildProc); dynamic;//004CF550
    procedure UpdateTabHighlights;//004CF208
    procedure ChangeActivePage(Page:TTabSheet);//004CF2C8
    procedure DeleteTab(Page:TTabSheet; Index:Integer);//004CF3D0
    function GetPageFromDockClient(Client:TControl):TTabSheet;//004CF60C
    function GetPage(Index:Integer):TTabSheet;//004CF65C
    function GetPageCount:Integer;//004CF674
    procedure InsertPage(Page:TTabSheet);//004CF6C4
    procedure InsertTab(Page:TTabSheet);//004CF6E8
    procedure MoveTab(CurIndex:Integer; NewIndex:Integer);//004CF754
    procedure RemovePage(Page:TTabSheet);//004CF774
    procedure SetActivePage(Page:TTabSheet);//004CF814
    procedure UpdateTab(Page:TTabSheet);//004CF8E8
    function GetDockClientFromMousePos(MousePos:TPoint):TControl;//004CFD38
    function GetActivePageIndex:Integer;//004CFE68
    procedure SetActivePageIndex(const Value:Integer);//004CFE80
    function PageIndexFromTabIndex(TabIndex:Integer):Integer;//004CFF48
  end;
  TStatusPanelStyle = (psText, psOwnerDraw);
  TStatusPanelBevel = (pbNone, pbLowered, pbRaised);
  TStatusPanel = class(TCollectionItem)
  published
    function UseRightToLeftAlignment:Boolean;//004D00A4
    function UseRightToLeftReading:Boolean;//004D008C
    procedure ParentBiDiModeChanged;//004D0050
    constructor Create;//004CFF78
    procedure Assign(Source:TPersistent);//004CFFC4
  public
    FText:string;//fC
    FWidth:Integer;//f10
    FAlignment:TAlignment;//f14
    FBevel:TStatusPanelBevel;//f15
    FBiDiMode:TBiDiMode;//f16
    FParentBiDiMode:Boolean;//f17
    FStyle:TStatusPanelStyle;//f18
    FUpdateNeeded:Boolean;//f19
    procedure Assign(Source:TPersistent); virtual;//v8//004CFFC4
    constructor Create; virtual;//v1C//004CFF78
    procedure SetBiDiMode(Value:TBiDiMode);//004D0024
    procedure IsStoredBiDiMode(Value:TBiDiMode);//004D0038
    procedure SetParentBiDiMode(Value:Boolean);//004D0040
    procedure SetAlignment(Value:TAlignment);//004D00E0
    procedure SetBevel(Value:TStatusPanelBevel);//004D00F0
    procedure SetStyle(Value:TStatusPanelStyle);//004D0100
    procedure SetText(const Value:UnicodeString);//004D0110
    procedure SetWidth(Value:Integer);//004D0138
  end;
  TStatusPanels = class(TCollection)
  published
    function Insert(Index:Integer):TStatusPanel;//004D0240
    function AddItem(Item:TStatusPanel; Index:Integer):TStatusPanel;//004D01FC
    constructor Create;//004D0148
    function Add:TStatusPanel;//004D01A8
  public
    ..FStatusBar:TCustomStatusBar;//f18
    procedure Update(Item:TCollectionItem); virtual;//v1C//004D01CC
    procedure sub_00446E30; dynamic;//004D01C8
  end;
  TCustomDrawPanelEvent = procedure(StatusBar:TCustomStatusBar; Panel:TStatusPanel; const Rect:TRect) of object;;
  TSBCreatePanelClassEvent = procedure(Sender:TCustomStatusBar; var PanelClass:TStatusPanelClass) of object;;
  TCustomStatusBar = class(TWinControl)
  published
    constructor Create;//004D024C
    destructor Destroy();//004D0304
    procedure ExecuteAction(Action:TBasicAction);//004D0D40
    procedure FlipChildren(AllLevels:Boolean);//004D0678
    procedure SetBounds(ALeft:Integer; ATop:Integer; AHeight:Integer; AWidth:Integer);//004D0E18
  public
    FPanels:TStatusPanels;//f270
    FCanvas:TCanvas;//f274
    FSimpleText:string;//f278
    FSimplePanel:Boolean;//f27C
    FSizeGrip:Boolean;//f27D
    FSizeGripValid:Boolean;//f27E
    FUseSystemFont:Boolean;//f27F
    FAutoHint:Boolean;//f280
    FOnDrawPanel:TCustomDrawPanelEvent;//f288
    FOnHint:TNotifyEvent;//f290
    FOnCreatePanelClass:TSBCreatePanelClassEvent;//f298
    destructor Destroy(); virtual;//004D0304
    constructor Create; virtual;//v2C//004D024C
    procedure SetParent(AParent:TWinControl); virtual;//v78//004D0E3C
    procedure SetBounds(ALeft:Integer; ATop:Integer; AHeight:Integer; AWidth:Integer); virtual;//v98//004D0E18
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004D0340
    procedure CreateWnd; virtual;//vB4//004D03D8
    function CreatePanel:TStatusPanel; virtual;//vEC//004D0ED4
    function CreatePanels:TStatusPanels; virtual;//vF0//004D0F10
    function DoHint:Boolean; virtual;//vF4//004D045C
    constructor Create; virtual;//vF8//004D0F20
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//004D0C98
    procedure WMGetTextLength(var Message:TWMGetTextLength); message WM_GETTEXTLENGTH;//004D0C4C
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//004D0C78
    procedure WMEraseBkGnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//004D0F28
    procedure CMParentFontChanged(var Message:TCMParentFontChanged); message CM_PARENTFONTCHANGED;//004D0D1C
    procedure CMColorChanged(var Message:TMessage); message CM_COLORCHANGED;//004D0D08
    procedure CMSysColorChange(var Message:TMessage); message CM_SYSCOLORCHANGE;//004D0DC8
    procedure CMWinIniChange(var Message:TWMWinIniChange); message CM_WININICHANGE;//004D0B18
    procedure CMSysFontChanged(var Message:TMessage); message CM_SYSFONTCHANGED;//004D0DDC
    procedure CMBiDiModeChanged(var Message:TMessage); message CM_BIDIMODECHANGED;//004D0600
    //procedure sub_004D0B40(?:?); dynamic;//004D0B40
    procedure DrawPanel(Panel:TStatusPanel; const Rect:TRect); dynamic;//004D0480
    procedure FlipChildren(AllLevels:Boolean); dynamic;//004D0678
    procedure ChangeScale(M:Integer; D:Integer); dynamic;//004D0DF0
    procedure ExecuteAction(Action:TBasicAction); dynamic;//004D0D40
    procedure SetSimplePanel(Value:Boolean);//004D04C4
    procedure DoRightToLeftAlignment(var Str:UnicodeString; AAlignment:TAlignment; ARTLAlignment:Boolean);//004D0500
    procedure UpdateSimpleText;//004D0574
    procedure SetSimpleText(const Value:UnicodeString);//004D05D4
    procedure SetSizeGrip(Value:Boolean);//004D0828
    procedure SyncToSystemFont;//004D0840
    procedure UpdatePanel(Index:Integer; Repaint:Boolean);//004D086C
    procedure UpdatePanels(UpdateRects:Boolean; UpdateText:Boolean);//004D0A00
    function IsFontStored(Value:TFont):Boolean;//004D0CBC
    procedure SetUseSystemFont(const Value:Boolean);//004D0CD8
    procedure ValidateSizeGrip(ARecreate:Boolean);//004D0E44
  end;
  TDrawPanelEvent = procedure(StatusBar:TStatusBar; Panel:TStatusPanel; const Rect:TRect) of object;;
  TStatusBar = class(TCustomStatusBar)
    function GetOnDrawPanel:TDrawPanelEvent;//004D1078
    procedure SetOnDrawPanel(Value:TDrawPanelEvent);//004D108C
  end;
  TProgressBarState = (pbsNormal, pbsError, pbsPaused);
  TConversion = class(TObject)
  published
    procedure ConvertWriteStream(Stream:TStream; Buffer:TBytes; BufSize:Integer);//004D101C
    procedure ConvertReadStream(Stream:TStream; Buffer:TBytes; BufSize:Integer);//004D0FC0
    constructor Create();//004D0F88
  public
    constructor Create(); virtual;//v0//004D0F88
    procedure ConvertReadStream(Stream:TStream; Buffer:TBytes; BufSize:Integer); virtual;//v4//004D0FC0
    procedure ConvertWriteStream(Stream:TStream; Buffer:TBytes; BufSize:Integer); virtual;//v8//004D101C
  end;
  TConversionFormat = TConversionFormat = record//size=8
f4:string;//f4
end;
ConversionClass:TConversionClass;//f0
Extension:string;//f4
end;;
  TTabStrings = class(TStrings)
  published
    procedure Insert(Index:Integer; S:string);//004CD99C
    procedure Delete(Index:Integer);//004CD5C0
    procedure Clear;//004CD550
  public
    FTabControl:TCustomTabControl;//f2C
    function Get(Index:Integer):UnicodeString; virtual;//vC//004CD65C
    function GetCount:Integer; virtual;//v14//004CD760
    function GetObject(Index:Integer):TObject; virtual;//v18//004CD77C
    procedure Put(Index:Integer; const S:UnicodeString); virtual;//v20//004CD81C
    procedure PutObject(Index:Integer; AObject:TObject); virtual;//v24//004CD8FC
    procedure SetUpdateState(Updating:Boolean); virtual;//v30//004CDA7C
    procedure Clear; virtual;//v44//004CD550
    procedure Delete(Index:Integer); virtual;//v48//004CD5C0
    procedure Insert(Index:Integer; S:string); virtual;//v60//004CD99C
  end;
    function InitCommonControl(CC:Integer):Boolean;//004CD2CC
    procedure SetComCtlStyle(Ctl:TWinControl; Value:Integer; UseStyle:Boolean);//004CD2F8
    procedure TabControlError(const S:UnicodeString);//004CD538
    function Get(Index:Integer):UnicodeString;//004CD65C
    function GetCount:Integer;//004CD760
    function GetObject(Index:Integer):TObject;//004CD77C
    procedure Put(Index:Integer; const S:UnicodeString);//004CD81C
    procedure PutObject(Index:Integer; AObject:TObject);//004CD8FC
    procedure SetUpdateState(Updating:Boolean);//004CDA7C
    procedure CanChange;//004CDBF8
    //function sub_004CDC24:?;//004CDC24
    procedure DoClose;//004CDC28
    procedure CreateParams(var Params:TCreateParams);//004CDC48
    procedure CreateWnd;//004CDD60
    procedure DrawTab(TabIndex:Integer; const Rect:TRect; Active:Boolean);//004CDDF4
    function GetImageIndex(TabIndex:Integer):Integer;//004CDE68
    procedure Loaded;//004CDEAC
    procedure Notification(AComponent:TComponent; Operation:TOperation);//004CDEDC
    procedure SetTabIndex(Value:Integer);//004CE1CC
    procedure CNDrawItem(var Message:TWMDrawItem);//004CE4B8
    procedure WMDestroy(var Message:TWMDestroy);//004CE5AC
    procedure WMNotifyFormat(var Message:TWMNotifyFormat);//004CE63C
    procedure WMSize(var Message:TWMSize);//004CE660
    procedure CMFontChanged(var Message:TMessage);//004CE680
    procedure CMSysColorChange(var Message:TMessage);//004CE6A8
    procedure CMTabStopChanged(var Message:TMessage);//004CE6D0
    procedure CNNotify(var Message:TWMNotify);//004CE6DC
    procedure CMDialogChar(var Message:TCMDialogChar);//004CE720
    procedure AdjustClientRect(var Rect:TRect);//004CE804
    procedure TCMAdjustRect(var Message:TTCMAdjustRect);//004CEA34
    procedure DoHide;//004CEB80
    procedure DoShow;//004CEBA0
    procedure CreateParams(var Params:TCreateParams);//004CEC2C
    procedure ReadState(Reader:TReader);//004CEC48
    procedure UpdateControlOriginalParentSize(AControl:TControl; var AOriginalParentSize:TPoint);//004CEDC4
    procedure CMTextChanged(var Message:TMessage);//004CEE14
    procedure CMShowingChanged(var Message:TMessage);//004CEE2C
    procedure WMNCPaint(var Message:TWMNCPaint);//004CEF70
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//004CF088
    procedure Loaded;//004CF248
    function CanShowTab(TabIndex:Integer):Boolean;//004CF25C
    procedure DoClose;//004CF280
    procedure DoAddDockClient(Client:TControl; const ARect:TRect);//004CF42C
    procedure DockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);//004CF440
    procedure DoRemoveDockClient(Client:TControl);//004CF494
    function GetImageIndex(TabIndex:Integer):Integer;//004CF590
    procedure GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean);//004CF680
    procedure SetChildOrder(Child:TComponent; Order:Integer);//004CF8A8
    procedure ShowControl(AControl:TControl);//004CF8B4
    procedure UpdateActivePage;//004CF948
    procedure CMDesignHitTest(var Message:TCMDesignHitTest);//004CF984
    procedure CMDialogKey(var Message:TCMDialogKey);//004CF9EC
    procedure CMDockClient(var Message:TCMDockClient);//004CFA58
    procedure CMDockNotification(var Message:TCMDockNotification);//004CFBF4
    procedure CMUnDockClient(var Message:TCMUnDockClient);//004CFD0C
    procedure WMLButtonDown(var Message:TWMLButtonDown);//004CFDC8
    procedure WMLButtonDblClk(var Message:TWMLButtonDblClk);//004CFE1C
    procedure SetTabIndex(Value:Integer);//004CFEB8
    procedure WMEraseBkGnd(var Message:TWMEraseBkgnd);//004CFF10
    function GetDisplayName:UnicodeString;//004D00BC
    function GetItem(Index:Integer):TCoolBand;//004D01B4
    procedure sub_00446E30;//004D01C8
    procedure Update(Item:TCollectionItem);//004D01CC
    procedure CreateParams(var Params:TCreateParams);//004D0340
    procedure CreateWnd;//004D03D8
    function DoHint:Boolean;//004D045C
    procedure DrawPanel(Panel:TStatusPanel; const Rect:TRect);//004D0480
    procedure SetSections(Value:THeaderSections);//004D04B4
    procedure CMBiDiModeChanged(var Message:TMessage);//004D0600
    procedure CMWinIniChange(var Message:TWMWinIniChange);//004D0B18
    //procedure sub_004D0B40(?:?);//004D0B40
    procedure WMGetTextLength(var Message:TWMGetTextLength);//004D0C4C
    procedure WMPaint(var Message:TWMPaint);//004D0C78
    procedure WMSize(var Message:TWMSize);//004D0C98
    procedure CMColorChanged(var Message:TMessage);//004D0D08
    procedure CMParentFontChanged(var Message:TCMParentFontChanged);//004D0D1C
    procedure CMSysColorChange(var Message:TMessage);//004D0DC8
    procedure CMSysFontChanged(var Message:TMessage);//004D0DDC
    procedure ChangeScale(M:Integer; D:Integer);//004D0DF0
    procedure SetParent(AParent:TWinControl);//004D0E3C
    function CreatePanel:TStatusPanel;//004D0ED4
    function CreatePanels:TStatusPanels;//004D0F10
    constructor Create;//004D0F20
    procedure WMEraseBkGnd(var Message:TWMEraseBkgnd);//004D0F28
    procedure FreeConversionFormatList;//004D10A8

implementation

//004CD2CC
function InitCommonControl(CC:Integer):Boolean;
begin
{*
 004CD2CC    push        ebx
 004CD2CD    add         esp,0FFFFFFF8
 004CD2D0    mov         dword ptr [esp],8
 004CD2D7    mov         dword ptr [esp+4],eax
 004CD2DB    mov         eax,esp
 004CD2DD    call        InitCommonControlsEx
 004CD2E2    cmp         eax,1
 004CD2E5    sbb         ebx,ebx
 004CD2E7    inc         ebx
 004CD2E8    test        bl,bl
>004CD2EA    jne         004CD2F1
 004CD2EC    call        comctl32.InitCommonControls
 004CD2F1    mov         eax,ebx
 004CD2F3    pop         ecx
 004CD2F4    pop         edx
 004CD2F5    pop         ebx
 004CD2F6    ret
*}
end;

//004CD2F8
procedure SetComCtlStyle(Ctl:TWinControl; Value:Integer; UseStyle:Boolean);
begin
{*
 004CD2F8    push        ebx
 004CD2F9    push        esi
 004CD2FA    push        edi
 004CD2FB    push        ebp
 004CD2FC    mov         ebx,ecx
 004CD2FE    mov         edi,edx
 004CD300    mov         ebp,eax
 004CD302    mov         eax,ebp
 004CD304    call        TWinControl.HandleAllocated
 004CD309    test        al,al
>004CD30B    je          004CD33A
 004CD30D    push        0F0
 004CD30F    mov         eax,ebp
 004CD311    call        TWinControl.GetHandle
 004CD316    push        eax
 004CD317    call        user32.GetWindowLongW
 004CD31C    mov         esi,eax
 004CD31E    test        bl,bl
>004CD320    jne         004CD328
 004CD322    not         edi
 004CD324    and         esi,edi
>004CD326    jmp         004CD32A
 004CD328    or          esi,edi
 004CD32A    push        esi
 004CD32B    push        0F0
 004CD32D    mov         eax,ebp
 004CD32F    call        TWinControl.GetHandle
 004CD334    push        eax
 004CD335    call        user32.SetWindowLongW
 004CD33A    pop         ebp
 004CD33B    pop         edi
 004CD33C    pop         esi
 004CD33D    pop         ebx
 004CD33E    ret
*}
end;

//004CD538
procedure TabControlError(const S:UnicodeString);
begin
{*
 004CD538    push        ebx
 004CD539    mov         ebx,eax
 004CD53B    mov         ecx,ebx
 004CD53D    mov         dl,1
 004CD53F    mov         eax,[00438EC0];EListError
 004CD544    call        Exception.Create
 004CD549    call        @RaiseExcept
 004CD54E    pop         ebx
 004CD54F    ret
*}
end;

//004CD550
procedure TTabStrings.Clear;
begin
{*
 004CD550    push        ebp
 004CD551    mov         ebp,esp
 004CD553    push        0
 004CD555    push        ebx
 004CD556    mov         ebx,eax
 004CD558    xor         eax,eax
 004CD55A    push        ebp
 004CD55B    push        4CD5B4
 004CD560    push        dword ptr fs:[eax]
 004CD563    mov         dword ptr fs:[eax],esp
 004CD566    push        0
 004CD568    push        0
 004CD56A    push        1309
 004CD56F    mov         eax,dword ptr [ebx+2C]
 004CD572    call        TWinControl.GetHandle
 004CD577    push        eax
 004CD578    call        user32.SendMessageW
 004CD57D    test        eax,eax
>004CD57F    jne         004CD596
 004CD581    lea         edx,[ebp-4]
 004CD584    mov         eax,[0078D5A4];^SResString307:TResStringRec
 004CD589    call        LoadResString
 004CD58E    mov         eax,dword ptr [ebp-4]
 004CD591    call        TabControlError
 004CD596    mov         eax,dword ptr [ebx+2C]
 004CD599    call        TCustomTabControl.TabsChanged
 004CD59E    xor         eax,eax
 004CD5A0    pop         edx
 004CD5A1    pop         ecx
 004CD5A2    pop         ecx
 004CD5A3    mov         dword ptr fs:[eax],edx
 004CD5A6    push        4CD5BB
 004CD5AB    lea         eax,[ebp-4]
 004CD5AE    call        @UStrClr
 004CD5B3    ret
>004CD5B4    jmp         @HandleFinally
>004CD5B9    jmp         004CD5AB
 004CD5BB    pop         ebx
 004CD5BC    pop         ecx
 004CD5BD    pop         ebp
 004CD5BE    ret
*}
end;

//004CD5C0
procedure TTabStrings.Delete(Index:Integer);
begin
{*
 004CD5C0    push        ebp
 004CD5C1    mov         ebp,esp
 004CD5C3    add         esp,0FFFFFFF0
 004CD5C6    push        ebx
 004CD5C7    push        esi
 004CD5C8    xor         ecx,ecx
 004CD5CA    mov         dword ptr [ebp-4],ecx
 004CD5CD    mov         dword ptr [ebp-8],ecx
 004CD5D0    mov         esi,edx
 004CD5D2    mov         ebx,eax
 004CD5D4    xor         eax,eax
 004CD5D6    push        ebp
 004CD5D7    push        4CD64C
 004CD5DC    push        dword ptr fs:[eax]
 004CD5DF    mov         dword ptr fs:[eax],esp
 004CD5E2    push        0
 004CD5E4    push        esi
 004CD5E5    push        1308
 004CD5EA    mov         eax,dword ptr [ebx+2C]
 004CD5ED    call        TWinControl.GetHandle
 004CD5F2    push        eax
 004CD5F3    call        user32.SendMessageW
 004CD5F8    test        eax,eax
>004CD5FA    jne         004CD629
 004CD5FC    lea         eax,[ebp-4]
 004CD5FF    push        eax
 004CD600    lea         edx,[ebp-8]
 004CD603    mov         eax,[0078D4F4];^SResString308:TResStringRec
 004CD608    call        LoadResString
 004CD60D    mov         eax,dword ptr [ebp-8]
 004CD610    mov         dword ptr [ebp-10],esi
 004CD613    mov         byte ptr [ebp-0C],0
 004CD617    lea         edx,[ebp-10]
 004CD61A    xor         ecx,ecx
 004CD61C    call        Format
 004CD621    mov         eax,dword ptr [ebp-4]
 004CD624    call        TabControlError
 004CD629    mov         eax,dword ptr [ebx+2C]
 004CD62C    call        TCustomTabControl.TabsChanged
 004CD631    xor         eax,eax
 004CD633    pop         edx
 004CD634    pop         ecx
 004CD635    pop         ecx
 004CD636    mov         dword ptr fs:[eax],edx
 004CD639    push        4CD653
 004CD63E    lea         eax,[ebp-8]
 004CD641    mov         edx,2
 004CD646    call        @UStrArrayClr
 004CD64B    ret
>004CD64C    jmp         @HandleFinally
>004CD651    jmp         004CD63E
 004CD653    pop         esi
 004CD654    pop         ebx
 004CD655    mov         esp,ebp
 004CD657    pop         ebp
 004CD658    ret
*}
end;

//004CD65C
function TTabStrings.Get(Index:Integer):UnicodeString;
begin
{*
 004CD65C    push        ebp
 004CD65D    mov         ebp,esp
 004CD65F    push        eax
 004CD660    mov         eax,2
 004CD665    add         esp,0FFFFF004
 004CD66B    push        eax
 004CD66C    dec         eax
>004CD66D    jne         004CD665
 004CD66F    mov         eax,dword ptr [ebp-4]
 004CD672    add         esp,0FFFFFFD8
 004CD675    push        ebx
 004CD676    push        esi
 004CD677    push        edi
 004CD678    xor         ebx,ebx
 004CD67A    mov         dword ptr [ebp-2020],ebx
 004CD680    mov         dword ptr [ebp-2024],ebx
 004CD686    mov         edi,ecx
 004CD688    mov         esi,edx
 004CD68A    mov         ebx,eax
 004CD68C    xor         eax,eax
 004CD68E    push        ebp
 004CD68F    push        4CD750
 004CD694    push        dword ptr fs:[eax]
 004CD697    mov         dword ptr fs:[eax],esp
 004CD69A    mov         eax,dword ptr [ebx+2C]
 004CD69D    call        TControl.UseRightToLeftReading
 004CD6A2    and         eax,7F
 004CD6A5    mov         eax,dword ptr [eax*4+7863B0]
 004CD6AC    or          eax,1
 004CD6AF    mov         dword ptr [ebp-1C],eax
 004CD6B2    lea         eax,[ebp-201C]
 004CD6B8    mov         dword ptr [ebp-10],eax
 004CD6BB    mov         dword ptr [ebp-0C],1000
 004CD6C2    lea         eax,[ebp-1C]
 004CD6C5    push        eax
 004CD6C6    push        esi
 004CD6C7    push        133C
 004CD6CC    mov         eax,dword ptr [ebx+2C]
 004CD6CF    call        TWinControl.GetHandle
 004CD6D4    push        eax
 004CD6D5    call        user32.SendMessageW
 004CD6DA    test        eax,eax
>004CD6DC    jne         004CD720
 004CD6DE    lea         eax,[ebp-2020]
 004CD6E4    push        eax
 004CD6E5    lea         edx,[ebp-2024]
 004CD6EB    mov         eax,[0078D3A0];^SResString309:TResStringRec
 004CD6F0    call        LoadResString
 004CD6F5    mov         eax,dword ptr [ebp-2024]
 004CD6FB    mov         dword ptr [ebp-202C],esi
 004CD701    mov         byte ptr [ebp-2028],0
 004CD708    lea         edx,[ebp-202C]
 004CD70E    xor         ecx,ecx
 004CD710    call        Format
 004CD715    mov         eax,dword ptr [ebp-2020]
 004CD71B    call        TabControlError
 004CD720    mov         eax,edi
 004CD722    lea         edx,[ebp-201C]
 004CD728    mov         ecx,1000
 004CD72D    call        @UStrFromWArray
 004CD732    xor         eax,eax
 004CD734    pop         edx
 004CD735    pop         ecx
 004CD736    pop         ecx
 004CD737    mov         dword ptr fs:[eax],edx
 004CD73A    push        4CD757
 004CD73F    lea         eax,[ebp-2024]
 004CD745    mov         edx,2
 004CD74A    call        @UStrArrayClr
 004CD74F    ret
>004CD750    jmp         @HandleFinally
>004CD755    jmp         004CD73F
 004CD757    pop         edi
 004CD758    pop         esi
 004CD759    pop         ebx
 004CD75A    mov         esp,ebp
 004CD75C    pop         ebp
 004CD75D    ret
*}
end;

//004CD760
function TTabStrings.GetCount:Integer;
begin
{*
 004CD760    push        ebx
 004CD761    mov         ebx,eax
 004CD763    push        0
 004CD765    push        0
 004CD767    push        1304
 004CD76C    mov         eax,dword ptr [ebx+2C]
 004CD76F    call        TWinControl.GetHandle
 004CD774    push        eax
 004CD775    call        user32.SendMessageW
 004CD77A    pop         ebx
 004CD77B    ret
*}
end;

//004CD77C
function TTabStrings.GetObject(Index:Integer):TObject;
begin
{*
 004CD77C    push        ebp
 004CD77D    mov         ebp,esp
 004CD77F    add         esp,0FFFFFFD4
 004CD782    push        ebx
 004CD783    push        esi
 004CD784    xor         ecx,ecx
 004CD786    mov         dword ptr [ebp-20],ecx
 004CD789    mov         dword ptr [ebp-24],ecx
 004CD78C    mov         esi,edx
 004CD78E    mov         ebx,eax
 004CD790    xor         eax,eax
 004CD792    push        ebp
 004CD793    push        4CD80C
 004CD798    push        dword ptr fs:[eax]
 004CD79B    mov         dword ptr fs:[eax],esp
 004CD79E    mov         dword ptr [ebp-1C],8
 004CD7A5    lea         eax,[ebp-1C]
 004CD7A8    push        eax
 004CD7A9    push        esi
 004CD7AA    push        133C
 004CD7AF    mov         eax,dword ptr [ebx+2C]
 004CD7B2    call        TWinControl.GetHandle
 004CD7B7    push        eax
 004CD7B8    call        user32.SendMessageW
 004CD7BD    test        eax,eax
>004CD7BF    jne         004CD7EE
 004CD7C1    lea         eax,[ebp-20]
 004CD7C4    push        eax
 004CD7C5    lea         edx,[ebp-24]
 004CD7C8    mov         eax,[0078D440];^SResString310:TResStringRec
 004CD7CD    call        LoadResString
 004CD7D2    mov         eax,dword ptr [ebp-24]
 004CD7D5    mov         dword ptr [ebp-2C],esi
 004CD7D8    mov         byte ptr [ebp-28],0
 004CD7DC    lea         edx,[ebp-2C]
 004CD7DF    xor         ecx,ecx
 004CD7E1    call        Format
 004CD7E6    mov         eax,dword ptr [ebp-20]
 004CD7E9    call        TabControlError
 004CD7EE    mov         ebx,dword ptr [ebp-4]
 004CD7F1    xor         eax,eax
 004CD7F3    pop         edx
 004CD7F4    pop         ecx
 004CD7F5    pop         ecx
 004CD7F6    mov         dword ptr fs:[eax],edx
 004CD7F9    push        4CD813
 004CD7FE    lea         eax,[ebp-24]
 004CD801    mov         edx,2
 004CD806    call        @UStrArrayClr
 004CD80B    ret
>004CD80C    jmp         @HandleFinally
>004CD811    jmp         004CD7FE
 004CD813    mov         eax,ebx
 004CD815    pop         esi
 004CD816    pop         ebx
 004CD817    mov         esp,ebp
 004CD819    pop         ebp
 004CD81A    ret
*}
end;

//004CD81C
procedure TTabStrings.Put(Index:Integer; const S:UnicodeString);
begin
{*
 004CD81C    push        ebp
 004CD81D    mov         ebp,esp
 004CD81F    add         esp,0FFFFFFCC
 004CD822    push        ebx
 004CD823    push        esi
 004CD824    push        edi
 004CD825    xor         ebx,ebx
 004CD827    mov         dword ptr [ebp-20],ebx
 004CD82A    mov         dword ptr [ebp-24],ebx
 004CD82D    mov         edi,ecx
 004CD82F    mov         esi,edx
 004CD831    mov         ebx,eax
 004CD833    xor         eax,eax
 004CD835    push        ebp
 004CD836    push        4CD8EE
 004CD83B    push        dword ptr fs:[eax]
 004CD83E    mov         dword ptr fs:[eax],esp
 004CD841    mov         eax,dword ptr [ebx+2C]
 004CD844    call        TControl.UseRightToLeftReading
 004CD849    and         eax,7F
 004CD84C    mov         eax,dword ptr [eax*4+7863B8]
 004CD853    or          eax,1
 004CD856    or          eax,2
 004CD859    mov         dword ptr [ebp-1C],eax
 004CD85C    mov         eax,edi
 004CD85E    call        @UStrToPWChar
 004CD863    mov         dword ptr [ebp-10],eax
 004CD866    mov         edx,esi
 004CD868    mov         eax,dword ptr [ebx+2C]
 004CD86B    mov         ecx,dword ptr [eax]
 004CD86D    call        dword ptr [ecx+0F4]
 004CD873    mov         dword ptr [ebp-8],eax
 004CD876    lea         eax,[ebp-1C]
 004CD879    push        eax
 004CD87A    mov         eax,dword ptr [ebx+2C]
 004CD87D    call        TWinControl.GetHandle
 004CD882    mov         ecx,esi
 004CD884    mov         edx,133D
 004CD889    call        SendStructMessage
 004CD88E    test        eax,eax
>004CD890    jne         004CD8CB
 004CD892    lea         eax,[ebp-20]
 004CD895    push        eax
 004CD896    lea         edx,[ebp-24]
 004CD899    mov         eax,[0078D80C];^SResString311:TResStringRec
 004CD89E    call        LoadResString
 004CD8A3    mov         eax,dword ptr [ebp-24]
 004CD8A6    push        eax
 004CD8A7    mov         dword ptr [ebp-34],edi
 004CD8AA    mov         byte ptr [ebp-30],11
 004CD8AE    mov         dword ptr [ebp-2C],esi
 004CD8B1    mov         byte ptr [ebp-28],0
 004CD8B5    lea         edx,[ebp-34]
 004CD8B8    mov         ecx,1
 004CD8BD    pop         eax
 004CD8BE    call        Format
 004CD8C3    mov         eax,dword ptr [ebp-20]
 004CD8C6    call        TabControlError
 004CD8CB    mov         eax,dword ptr [ebx+2C]
 004CD8CE    call        TCustomTabControl.TabsChanged
 004CD8D3    xor         eax,eax
 004CD8D5    pop         edx
 004CD8D6    pop         ecx
 004CD8D7    pop         ecx
 004CD8D8    mov         dword ptr fs:[eax],edx
 004CD8DB    push        4CD8F5
 004CD8E0    lea         eax,[ebp-24]
 004CD8E3    mov         edx,2
 004CD8E8    call        @UStrArrayClr
 004CD8ED    ret
>004CD8EE    jmp         @HandleFinally
>004CD8F3    jmp         004CD8E0
 004CD8F5    pop         edi
 004CD8F6    pop         esi
 004CD8F7    pop         ebx
 004CD8F8    mov         esp,ebp
 004CD8FA    pop         ebp
 004CD8FB    ret
*}
end;

//004CD8FC
procedure TTabStrings.PutObject(Index:Integer; AObject:TObject);
begin
{*
 004CD8FC    push        ebp
 004CD8FD    mov         ebp,esp
 004CD8FF    add         esp,0FFFFFFD4
 004CD902    push        ebx
 004CD903    push        esi
 004CD904    xor         ebx,ebx
 004CD906    mov         dword ptr [ebp-20],ebx
 004CD909    mov         dword ptr [ebp-24],ebx
 004CD90C    mov         esi,edx
 004CD90E    mov         ebx,eax
 004CD910    xor         eax,eax
 004CD912    push        ebp
 004CD913    push        4CD98C
 004CD918    push        dword ptr fs:[eax]
 004CD91B    mov         dword ptr fs:[eax],esp
 004CD91E    mov         dword ptr [ebp-1C],8
 004CD925    mov         dword ptr [ebp-4],ecx
 004CD928    lea         eax,[ebp-1C]
 004CD92B    push        eax
 004CD92C    push        esi
 004CD92D    push        133D
 004CD932    mov         eax,dword ptr [ebx+2C]
 004CD935    call        TWinControl.GetHandle
 004CD93A    push        eax
 004CD93B    call        user32.SendMessageW
 004CD940    test        eax,eax
>004CD942    jne         004CD971
 004CD944    lea         eax,[ebp-20]
 004CD947    push        eax
 004CD948    lea         edx,[ebp-24]
 004CD94B    mov         eax,[0078CCBC];^SResString312:TResStringRec
 004CD950    call        LoadResString
 004CD955    mov         eax,dword ptr [ebp-24]
 004CD958    mov         dword ptr [ebp-2C],esi
 004CD95B    mov         byte ptr [ebp-28],0
 004CD95F    lea         edx,[ebp-2C]
 004CD962    xor         ecx,ecx
 004CD964    call        Format
 004CD969    mov         eax,dword ptr [ebp-20]
 004CD96C    call        TabControlError
 004CD971    xor         eax,eax
 004CD973    pop         edx
 004CD974    pop         ecx
 004CD975    pop         ecx
 004CD976    mov         dword ptr fs:[eax],edx
 004CD979    push        4CD993
 004CD97E    lea         eax,[ebp-24]
 004CD981    mov         edx,2
 004CD986    call        @UStrArrayClr
 004CD98B    ret
>004CD98C    jmp         @HandleFinally
>004CD991    jmp         004CD97E
 004CD993    pop         esi
 004CD994    pop         ebx
 004CD995    mov         esp,ebp
 004CD997    pop         ebp
 004CD998    ret
*}
end;

//004CD99C
procedure TTabStrings.Insert(Index:Integer; S:string);
begin
{*
 004CD99C    push        ebp
 004CD99D    mov         ebp,esp
 004CD99F    add         esp,0FFFFFFCC
 004CD9A2    push        ebx
 004CD9A3    push        esi
 004CD9A4    push        edi
 004CD9A5    xor         ebx,ebx
 004CD9A7    mov         dword ptr [ebp-20],ebx
 004CD9AA    mov         dword ptr [ebp-24],ebx
 004CD9AD    mov         edi,ecx
 004CD9AF    mov         esi,edx
 004CD9B1    mov         ebx,eax
 004CD9B3    xor         eax,eax
 004CD9B5    push        ebp
 004CD9B6    push        4CDA6E
 004CD9BB    push        dword ptr fs:[eax]
 004CD9BE    mov         dword ptr fs:[eax],esp
 004CD9C1    mov         eax,dword ptr [ebx+2C]
 004CD9C4    call        TControl.UseRightToLeftReading
 004CD9C9    and         eax,7F
 004CD9CC    mov         eax,dword ptr [eax*4+7863C0]
 004CD9D3    or          eax,1
 004CD9D6    or          eax,2
 004CD9D9    mov         dword ptr [ebp-1C],eax
 004CD9DC    mov         eax,edi
 004CD9DE    call        @UStrToPWChar
 004CD9E3    mov         dword ptr [ebp-10],eax
 004CD9E6    mov         edx,esi
 004CD9E8    mov         eax,dword ptr [ebx+2C]
 004CD9EB    mov         ecx,dword ptr [eax]
 004CD9ED    call        dword ptr [ecx+0F4]
 004CD9F3    mov         dword ptr [ebp-8],eax
 004CD9F6    lea         eax,[ebp-1C]
 004CD9F9    push        eax
 004CD9FA    mov         eax,dword ptr [ebx+2C]
 004CD9FD    call        TWinControl.GetHandle
 004CDA02    mov         ecx,esi
 004CDA04    mov         edx,133E
 004CDA09    call        SendStructMessage
 004CDA0E    test        eax,eax
>004CDA10    jge         004CDA4B
 004CDA12    lea         eax,[ebp-20]
 004CDA15    push        eax
 004CDA16    lea         edx,[ebp-24]
 004CDA19    mov         eax,[0078D80C];^SResString311:TResStringRec
 004CDA1E    call        LoadResString
 004CDA23    mov         eax,dword ptr [ebp-24]
 004CDA26    push        eax
 004CDA27    mov         dword ptr [ebp-34],edi
 004CDA2A    mov         byte ptr [ebp-30],11
 004CDA2E    mov         dword ptr [ebp-2C],esi
 004CDA31    mov         byte ptr [ebp-28],0
 004CDA35    lea         edx,[ebp-34]
 004CDA38    mov         ecx,1
 004CDA3D    pop         eax
 004CDA3E    call        Format
 004CDA43    mov         eax,dword ptr [ebp-20]
 004CDA46    call        TabControlError
 004CDA4B    mov         eax,dword ptr [ebx+2C]
 004CDA4E    call        TCustomTabControl.TabsChanged
 004CDA53    xor         eax,eax
 004CDA55    pop         edx
 004CDA56    pop         ecx
 004CDA57    pop         ecx
 004CDA58    mov         dword ptr fs:[eax],edx
 004CDA5B    push        4CDA75
 004CDA60    lea         eax,[ebp-24]
 004CDA63    mov         edx,2
 004CDA68    call        @UStrArrayClr
 004CDA6D    ret
>004CDA6E    jmp         @HandleFinally
>004CDA73    jmp         004CDA60
 004CDA75    pop         edi
 004CDA76    pop         esi
 004CDA77    pop         ebx
 004CDA78    mov         esp,ebp
 004CDA7A    pop         ebp
 004CDA7B    ret
*}
end;

//004CDA7C
procedure TTabStrings.SetUpdateState(Updating:Boolean);
begin
{*
 004CDA7C    push        ebx
 004CDA7D    push        esi
 004CDA7E    push        edi
 004CDA7F    mov         ebx,edx
 004CDA81    mov         esi,eax
 004CDA83    mov         edi,dword ptr [esi+2C]
 004CDA86    mov         byte ptr [edi+298],bl
 004CDA8C    push        0
 004CDA8E    mov         eax,ebx
 004CDA90    xor         al,1
 004CDA92    and         eax,7F
 004CDA95    push        eax
 004CDA96    push        0B
 004CDA98    mov         eax,edi
 004CDA9A    call        TWinControl.GetHandle
 004CDA9F    push        eax
 004CDAA0    call        user32.SendMessageW
 004CDAA5    xor         bl,1
 004CDAA8    test        bl,bl
>004CDAAA    je          004CDABF
 004CDAAC    mov         eax,dword ptr [esi+2C]
 004CDAAF    mov         edx,dword ptr [eax]
 004CDAB1    call        dword ptr [edx+90]
 004CDAB7    mov         eax,dword ptr [esi+2C]
 004CDABA    call        TCustomTabControl.TabsChanged
 004CDABF    pop         edi
 004CDAC0    pop         esi
 004CDAC1    pop         ebx
 004CDAC2    ret
*}
end;

//004CDAC4
constructor TCustomTabControl.Create;
begin
{*
 004CDAC4    push        ebp
 004CDAC5    mov         ebp,esp
 004CDAC7    push        ecx
 004CDAC8    push        ebx
 004CDAC9    push        esi
 004CDACA    test        dl,dl
>004CDACC    je          004CDAD6
 004CDACE    add         esp,0FFFFFFF0
 004CDAD1    call        @ClassCreate
 004CDAD6    mov         byte ptr [ebp-1],dl
 004CDAD9    mov         ebx,eax
 004CDADB    xor         edx,edx
 004CDADD    mov         eax,ebx
 004CDADF    call        TWinControl.Create
 004CDAE4    mov         edx,121
 004CDAE9    mov         eax,ebx
 004CDAEB    call        TControl.SetWidth
 004CDAF0    mov         edx,0C1
 004CDAF5    mov         eax,ebx
 004CDAF7    call        TControl.SetHeight
 004CDAFC    mov         dl,1
 004CDAFE    mov         eax,ebx
 004CDB00    call        TWinControl.SetTabStop
 004CDB05    mov         eax,[004CDB80]
 004CDB0A    mov         dword ptr [ebx+50],eax
 004CDB0D    mov         dl,1
 004CDB0F    mov         eax,[004CD340];TTabStrings
 004CDB14    call        TStrings.Create
 004CDB19    mov         esi,eax
 004CDB1B    mov         dword ptr [ebx+290],esi
 004CDB21    mov         dword ptr [esi+2C],ebx
 004CDB24    mov         dl,1
 004CDB26    mov         eax,[00476D34];TControlCanvas
 004CDB2B    call        TCanvas.Create
 004CDB30    mov         esi,eax
 004CDB32    mov         dword ptr [ebx+270],esi
 004CDB38    mov         eax,esi
 004CDB3A    mov         edx,ebx
 004CDB3C    call        TControlCanvas.SetControl
 004CDB41    mov         dl,1
 004CDB43    mov         eax,[0049B438];TChangeLink
 004CDB48    call        TObject.Create
 004CDB4D    mov         esi,eax
 004CDB4F    mov         dword ptr [ebx+278],esi
 004CDB55    mov         dword ptr [esi+0C],ebx
 004CDB58    mov         dword ptr [esi+8],4CDF7C;TCustomTabControl.ImageListChange
 004CDB5F    mov         eax,ebx
 004CDB61    cmp         byte ptr [ebp-1],0
>004CDB65    je          004CDB76
 004CDB67    call        @AfterConstruction
 004CDB6C    pop         dword ptr fs:[0]
 004CDB73    add         esp,0C
 004CDB76    mov         eax,ebx
 004CDB78    pop         esi
 004CDB79    pop         ebx
 004CDB7A    pop         ecx
 004CDB7B    pop         ebp
 004CDB7C    ret
*}
end;

//004CDB84
destructor TCustomTabControl.Destroy();
begin
{*
 004CDB84    push        ebx
 004CDB85    push        esi
 004CDB86    call        @BeforeDestruction
 004CDB8B    mov         ebx,edx
 004CDB8D    mov         esi,eax
 004CDB8F    lea         eax,[esi+270]
 004CDB95    mov         edx,dword ptr [eax]
 004CDB97    xor         ecx,ecx
 004CDB99    mov         dword ptr [eax],ecx
 004CDB9B    mov         eax,edx
 004CDB9D    call        TObject.Free
 004CDBA2    lea         eax,[esi+290]
 004CDBA8    mov         edx,dword ptr [eax]
 004CDBAA    xor         ecx,ecx
 004CDBAC    mov         dword ptr [eax],ecx
 004CDBAE    mov         eax,edx
 004CDBB0    call        TObject.Free
 004CDBB5    lea         eax,[esi+288]
 004CDBBB    mov         edx,dword ptr [eax]
 004CDBBD    xor         ecx,ecx
 004CDBBF    mov         dword ptr [eax],ecx
 004CDBC1    mov         eax,edx
 004CDBC3    call        TObject.Free
 004CDBC8    lea         eax,[esi+278]
 004CDBCE    mov         edx,dword ptr [eax]
 004CDBD0    xor         ecx,ecx
 004CDBD2    mov         dword ptr [eax],ecx
 004CDBD4    mov         eax,edx
 004CDBD6    call        TObject.Free
 004CDBDB    mov         edx,ebx
 004CDBDD    and         dl,0FC
 004CDBE0    mov         eax,esi
 004CDBE2    call        TWinControl.Destroy
 004CDBE7    test        bl,bl
>004CDBE9    jle         004CDBF2
 004CDBEB    mov         eax,esi
 004CDBED    call        @ClassDestroy
 004CDBF2    pop         esi
 004CDBF3    pop         ebx
 004CDBF4    ret
*}
end;

//004CDBF8
procedure TCustomTabControl.CanChange;
begin
{*
 004CDBF8    push        ebx
 004CDBF9    push        ecx
 004CDBFA    mov         byte ptr [esp],1
 004CDBFE    cmp         word ptr [eax+2BA],0
>004CDC06    je          004CDC1A
 004CDC08    mov         ecx,esp
 004CDC0A    mov         ebx,eax
 004CDC0C    mov         edx,eax
 004CDC0E    mov         eax,dword ptr [ebx+2BC]
 004CDC14    call        dword ptr [ebx+2B8]
 004CDC1A    movzx       eax,byte ptr [esp]
 004CDC1E    pop         edx
 004CDC1F    pop         ebx
 004CDC20    ret
*}
end;

//004CDC24
{*function sub_004CDC24:?;
begin
 004CDC24    mov         al,1
 004CDC26    ret
end;*}

//004CDC28
procedure TAnimate.DoClose;
begin
{*
 004CDC28    push        ebx
 004CDC29    cmp         word ptr [eax+2B2],0
>004CDC31    je          004CDC43
 004CDC33    mov         ebx,eax
 004CDC35    mov         edx,eax
 004CDC37    mov         eax,dword ptr [ebx+2B4]
 004CDC3D    call        dword ptr [ebx+2B0]
 004CDC43    pop         ebx
 004CDC44    ret
*}
end;

//004CDC48
procedure TCustomTabControl.CreateParams(var Params:TCreateParams);
begin
{*
 004CDC48    push        ebx
 004CDC49    push        esi
 004CDC4A    push        edi
 004CDC4B    mov         edi,edx
 004CDC4D    mov         ebx,eax
 004CDC4F    mov         eax,8
 004CDC54    call        InitCommonControl
 004CDC59    mov         edx,edi
 004CDC5B    mov         eax,ebx
 004CDC5D    call        TWinControl.CreateParams
 004CDC62    mov         ecx,4CDD40
 004CDC67    mov         edx,edi
 004CDC69    mov         eax,ebx
 004CDC6B    call        TWinControl.CreateSubClass
 004CDC70    mov         eax,ebx
 004CDC72    mov         si,0FFC7
 004CDC76    call        @CallDynaInst
 004CDC7B    and         eax,7F
 004CDC7E    add         eax,eax
 004CDC80    lea         eax,[eax*8+7863C8]
 004CDC87    movzx       edx,byte ptr [ebx+28E]
 004CDC8E    mov         eax,dword ptr [eax+edx*4]
 004CDC91    mov         edx,dword ptr [edi+4]
 004CDC94    or          edx,2000000
 004CDC9A    or          eax,edx
 004CDC9C    movzx       edx,byte ptr [ebx+28D]
 004CDCA3    or          eax,dword ptr [edx*4+7863E8]
 004CDCAA    movzx       edx,byte ptr [ebx+283]
 004CDCB1    or          eax,dword ptr [edx*4+7863F4]
 004CDCB8    mov         dword ptr [edi+4],eax
 004CDCBB    cmp         byte ptr [ebx+1E8],0
>004CDCC2    jne         004CDCCB
 004CDCC4    or          dword ptr [edi+4],8000
 004CDCCB    cmp         byte ptr [ebx+280],0
>004CDCD2    je          004CDCDB
 004CDCD4    or          dword ptr [edi+4],200
 004CDCDB    cmp         byte ptr [ebx+281],0
>004CDCE2    je          004CDCE8
 004CDCE4    or          dword ptr [edi+4],4
 004CDCE8    cmp         byte ptr [ebx+282],0
>004CDCEF    je          004CDCFE
 004CDCF1    test        byte ptr [ebx+1C],10
>004CDCF5    jne         004CDCFE
 004CDCF7    or          dword ptr [edi+4],2000
 004CDCFE    cmp         word ptr [ebx+294],0
>004CDD06    je          004CDD0F
 004CDD08    or          dword ptr [edi+4],400
 004CDD0F    cmp         byte ptr [ebx+274],0
>004CDD16    je          004CDD22
 004CDD18    test        byte ptr [ebx+1C],10
>004CDD1C    jne         004CDD22
 004CDD1E    or          dword ptr [edi+4],40
 004CDD22    cmp         byte ptr [ebx+28C],0
>004CDD29    je          004CDD2F
 004CDD2B    or          dword ptr [edi+4],1
 004CDD2F    mov         eax,dword ptr [edi+24]
 004CDD32    and         eax,0FFFFFFFC
 004CDD35    or          eax,8
 004CDD38    mov         dword ptr [edi+24],eax
 004CDD3B    pop         edi
 004CDD3C    pop         esi
 004CDD3D    pop         ebx
 004CDD3E    ret
*}
end;

//004CDD60
procedure TCustomTabControl.CreateWnd;
begin
{*
 004CDD60    push        ebx
 004CDD61    push        esi
 004CDD62    push        edi
 004CDD63    mov         esi,eax
 004CDD65    mov         eax,esi
 004CDD67    call        TWinControl.CreateWnd
 004CDD6C    mov         ebx,dword ptr [esi+27C]
 004CDD72    test        ebx,ebx
>004CDD74    je          004CDD9B
 004CDD76    mov         eax,ebx
 004CDD78    call        TCustomImageList.HandleAllocated
 004CDD7D    test        al,al
>004CDD7F    je          004CDD9B
 004CDD81    mov         eax,dword ptr [esi+27C]
 004CDD87    call        TCustomImageList.GetHandle
 004CDD8C    push        eax
 004CDD8D    xor         ecx,ecx
 004CDD8F    mov         edx,1303
 004CDD94    mov         eax,esi
 004CDD96    call        TControl.Perform
 004CDD9B    cmp         word ptr [esi+294],0
>004CDDA3    jne         004CDDAF
 004CDDA5    cmp         word ptr [esi+296],0
>004CDDAD    je          004CDDB6
 004CDDAF    mov         eax,esi
 004CDDB1    call        TCustomTabControl.UpdateTabSize
 004CDDB6    mov         edi,dword ptr [esi+288]
 004CDDBC    test        edi,edi
>004CDDBE    je          004CDDF0
 004CDDC0    mov         edx,edi
 004CDDC2    mov         eax,dword ptr [esi+290]
 004CDDC8    mov         ecx,dword ptr [eax]
 004CDDCA    call        dword ptr [ecx+8]
 004CDDCD    mov         edx,dword ptr [esi+284]
 004CDDD3    mov         eax,esi
 004CDDD5    mov         ecx,dword ptr [eax]
 004CDDD7    call        dword ptr [ecx+0F8]
 004CDDDD    mov         eax,dword ptr [esi+288]
 004CDDE3    call        TObject.Free
 004CDDE8    xor         eax,eax
 004CDDEA    mov         dword ptr [esi+288],eax
 004CDDF0    pop         edi
 004CDDF1    pop         esi
 004CDDF2    pop         ebx
 004CDDF3    ret
*}
end;

//004CDDF4
procedure TCustomTabControl.DrawTab(TabIndex:Integer; const Rect:TRect; Active:Boolean);
begin
{*
 004CDDF4    push        ebp
 004CDDF5    mov         ebp,esp
 004CDDF7    push        esi
 004CDDF8    mov         esi,eax
 004CDDFA    cmp         word ptr [esi+2C2],0
>004CDE02    je          004CDE1E
 004CDE04    push        ecx
 004CDE05    movzx       eax,byte ptr [ebp+8]
 004CDE09    push        eax
 004CDE0A    mov         eax,esi
 004CDE0C    mov         ecx,edx
 004CDE0E    mov         edx,eax
 004CDE10    mov         eax,dword ptr [esi+2C4]
 004CDE16    call        dword ptr [esi+2C0]
>004CDE1C    jmp         004CDE2B
 004CDE1E    mov         edx,ecx
 004CDE20    mov         eax,dword ptr [esi+270]
 004CDE26    mov         ecx,dword ptr [eax]
 004CDE28    call        dword ptr [ecx+54]
 004CDE2B    pop         esi
 004CDE2C    pop         ebp
 004CDE2D    ret         4
*}
end;

//004CDE30
function TCustomTabControl.GetDisplayRect:TRect;
begin
{*
 004CDE30    push        ebx
 004CDE31    push        esi
 004CDE32    mov         esi,edx
 004CDE34    mov         ebx,eax
 004CDE36    mov         edx,esi
 004CDE38    mov         eax,ebx
 004CDE3A    mov         ecx,dword ptr [eax]
 004CDE3C    call        dword ptr [ecx+54]
 004CDE3F    push        esi
 004CDE40    push        1
 004CDE42    mov         eax,ebx
 004CDE44    call        TWinControl.GetHandle
 004CDE49    xor         ecx,ecx
 004CDE4B    mov         edx,1328
 004CDE50    call        SendGetStructMessage
 004CDE55    cmp         byte ptr [ebx+28E],0
>004CDE5C    jne         004CDE62
 004CDE5E    add         dword ptr [esi+4],2
 004CDE62    pop         esi
 004CDE63    pop         ebx
 004CDE64    ret
*}
end;

//004CDE68
function TCustomTabControl.GetImageIndex(TabIndex:Integer):Integer;
begin
{*
 004CDE68    push        ebx
 004CDE69    push        ecx
 004CDE6A    mov         dword ptr [esp],edx
 004CDE6D    cmp         word ptr [eax+2CA],0
>004CDE75    je          004CDE8A
 004CDE77    push        esp
 004CDE78    mov         ebx,eax
 004CDE7A    mov         ecx,edx
 004CDE7C    mov         edx,eax
 004CDE7E    mov         eax,dword ptr [ebx+2CC]
 004CDE84    call        dword ptr [ebx+2C8]
 004CDE8A    mov         eax,dword ptr [esp]
 004CDE8D    pop         edx
 004CDE8E    pop         ebx
 004CDE8F    ret
*}
end;

//004CDE90
function TCustomTabControl.GetTabIndex:Integer;
begin
{*
 004CDE90    push        ebx
 004CDE91    mov         ebx,eax
 004CDE93    push        0
 004CDE95    push        0
 004CDE97    push        130B
 004CDE9C    mov         eax,ebx
 004CDE9E    call        TWinControl.GetHandle
 004CDEA3    push        eax
 004CDEA4    call        user32.SendMessageW
 004CDEA9    pop         ebx
 004CDEAA    ret
*}
end;

//004CDEAC
procedure TCustomTabControl.Loaded;
begin
{*
 004CDEAC    push        ebx
 004CDEAD    mov         ebx,eax
 004CDEAF    mov         eax,ebx
 004CDEB1    call        TControl.Loaded
 004CDEB6    cmp         dword ptr [ebx+27C],0
>004CDEBD    je          004CDEC6
 004CDEBF    mov         eax,ebx
 004CDEC1    call        TCustomTabControl.UpdateTabImages
 004CDEC6    pop         ebx
 004CDEC7    ret
*}
end;

//004CDEC8
procedure TCustomTabControl.SetHotTrack(Value:Boolean);
begin
{*
 004CDEC8    cmp         dl,byte ptr [eax+274]
>004CDECE    je          004CDEDB
 004CDED0    mov         byte ptr [eax+274],dl
 004CDED6    call        TWinControl.RecreateWnd
 004CDEDB    ret
*}
end;

//004CDEDC
procedure TCustomTabControl.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 004CDEDC    push        ebx
 004CDEDD    push        esi
 004CDEDE    push        edi
 004CDEDF    mov         ebx,ecx
 004CDEE1    mov         esi,edx
 004CDEE3    mov         edi,eax
 004CDEE5    mov         ecx,ebx
 004CDEE7    mov         edx,esi
 004CDEE9    mov         eax,edi
 004CDEEB    call        TWinControl.Notification
 004CDEF0    cmp         bl,1
>004CDEF3    jne         004CDF06
 004CDEF5    cmp         esi,dword ptr [edi+27C]
>004CDEFB    jne         004CDF06
 004CDEFD    xor         edx,edx
 004CDEFF    mov         eax,edi
 004CDF01    call        TCustomTabControl.SetImages
 004CDF06    pop         edi
 004CDF07    pop         esi
 004CDF08    pop         ebx
 004CDF09    ret
*}
end;

//004CDF0C
procedure TCustomTabControl.SetImages(Value:TCustomImageList);
begin
{*
 004CDF0C    push        ebx
 004CDF0D    push        esi
 004CDF0E    mov         esi,edx
 004CDF10    mov         ebx,eax
 004CDF12    mov         eax,dword ptr [ebx+27C]
 004CDF18    test        eax,eax
>004CDF1A    je          004CDF27
 004CDF1C    mov         edx,dword ptr [ebx+278]
 004CDF22    call        TCustomImageList.UnRegisterChanges
 004CDF27    mov         eax,esi
 004CDF29    mov         dword ptr [ebx+27C],eax
 004CDF2F    test        eax,eax
>004CDF31    je          004CDF68
 004CDF33    mov         edx,dword ptr [ebx+278]
 004CDF39    call        TCustomImageList.RegisterChanges
 004CDF3E    mov         edx,ebx
 004CDF40    mov         eax,dword ptr [ebx+27C]
 004CDF46    call        TComponent.FreeNotification
 004CDF4B    mov         eax,dword ptr [ebx+27C]
 004CDF51    call        TCustomImageList.GetHandle
 004CDF56    push        eax
 004CDF57    xor         ecx,ecx
 004CDF59    mov         edx,1303
 004CDF5E    mov         eax,ebx
 004CDF60    call        TControl.Perform
 004CDF65    pop         esi
 004CDF66    pop         ebx
 004CDF67    ret
 004CDF68    push        0
 004CDF6A    xor         ecx,ecx
 004CDF6C    mov         edx,1303
 004CDF71    mov         eax,ebx
 004CDF73    call        TControl.Perform
 004CDF78    pop         esi
 004CDF79    pop         ebx
 004CDF7A    ret
*}
end;

//004CDF7C
procedure TCustomTabControl.ImageListChange(Sender:TObject);
begin
{*
 004CDF7C    push        ebx
 004CDF7D    push        esi
 004CDF7E    mov         esi,edx
 004CDF80    mov         ebx,eax
 004CDF82    mov         eax,esi
 004CDF84    call        TCustomImageList.GetHandle
 004CDF89    push        eax
 004CDF8A    xor         ecx,ecx
 004CDF8C    mov         edx,1303
 004CDF91    mov         eax,ebx
 004CDF93    call        TControl.Perform
 004CDF98    pop         esi
 004CDF99    pop         ebx
 004CDF9A    ret
*}
end;

//004CDF9C
function TCustomTabControl.InternalSetMultiLine(Value:Boolean):Boolean;
begin
{*
 004CDF9C    push        ebp
 004CDF9D    mov         ebp,esp
 004CDF9F    add         esp,0FFFFFFF8
 004CDFA2    push        ebx
 004CDFA3    push        esi
 004CDFA4    xor         ecx,ecx
 004CDFA6    mov         dword ptr [ebp-8],ecx
 004CDFA9    mov         ebx,edx
 004CDFAB    mov         esi,eax
 004CDFAD    xor         eax,eax
 004CDFAF    push        ebp
 004CDFB0    push        4CE01A
 004CDFB5    push        dword ptr fs:[eax]
 004CDFB8    mov         dword ptr fs:[eax],esp
 004CDFBB    cmp         bl,byte ptr [esi+280]
 004CDFC1    setne       byte ptr [ebp-1]
 004CDFC5    cmp         byte ptr [ebp-1],0
>004CDFC9    je          004CE004
 004CDFCB    test        bl,bl
>004CDFCD    jne         004CDFF3
 004CDFCF    movzx       eax,byte ptr [esi+28E]
 004CDFD6    cmp         al,2
>004CDFD8    je          004CDFDE
 004CDFDA    cmp         al,3
>004CDFDC    jne         004CDFF3
 004CDFDE    lea         edx,[ebp-8]
 004CDFE1    mov         eax,[0078D808];^SResString313:TResStringRec
 004CDFE6    call        LoadResString
 004CDFEB    mov         eax,dword ptr [ebp-8]
 004CDFEE    call        TabControlError
 004CDFF3    mov         byte ptr [esi+280],bl
 004CDFF9    test        bl,bl
>004CDFFB    jne         004CE004
 004CDFFD    mov         byte ptr [esi+28C],0
 004CE004    xor         eax,eax
 004CE006    pop         edx
 004CE007    pop         ecx
 004CE008    pop         ecx
 004CE009    mov         dword ptr fs:[eax],edx
 004CE00C    push        4CE021
 004CE011    lea         eax,[ebp-8]
 004CE014    call        @UStrClr
 004CE019    ret
>004CE01A    jmp         @HandleFinally
>004CE01F    jmp         004CE011
 004CE021    movzx       eax,byte ptr [ebp-1]
 004CE025    pop         esi
 004CE026    pop         ebx
 004CE027    pop         ecx
 004CE028    pop         ecx
 004CE029    pop         ebp
 004CE02A    ret
*}
end;

//004CE02C
procedure TCustomTabControl.SetMultiLine(Value:Boolean);
begin
{*
 004CE02C    push        ebx
 004CE02D    push        esi
 004CE02E    mov         ebx,edx
 004CE030    mov         esi,eax
 004CE032    mov         edx,ebx
 004CE034    mov         eax,esi
 004CE036    call        TCustomTabControl.InternalSetMultiLine
 004CE03B    test        al,al
>004CE03D    je          004CE046
 004CE03F    mov         eax,esi
 004CE041    call        TWinControl.RecreateWnd
 004CE046    pop         esi
 004CE047    pop         ebx
 004CE048    ret
*}
end;

//004CE04C
procedure TCustomTabControl.SetOwnerDraw(Value:Boolean);
begin
{*
 004CE04C    cmp         dl,byte ptr [eax+282]
>004CE052    je          004CE05F
 004CE054    mov         byte ptr [eax+282],dl
 004CE05A    call        TWinControl.RecreateWnd
 004CE05F    ret
*}
end;

//004CE060
procedure TCustomTabControl.SetRaggedRight(Value:Boolean);
begin
{*
 004CE060    cmp         dl,byte ptr [eax+283]
>004CE066    je          004CE07A
 004CE068    mov         byte ptr [eax+283],dl
 004CE06E    mov         ecx,edx
 004CE070    mov         edx,800
 004CE075    call        SetComCtlStyle
 004CE07A    ret
*}
end;

//004CE07C
procedure TCustomTabControl.SetScrollOpposite(Value:Boolean);
begin
{*
 004CE07C    cmp         dl,byte ptr [eax+28C]
>004CE082    je          004CE099
 004CE084    mov         byte ptr [eax+28C],dl
 004CE08A    test        dl,dl
>004CE08C    je          004CE094
 004CE08E    mov         byte ptr [eax+280],dl
 004CE094    call        TWinControl.RecreateWnd
 004CE099    ret
*}
end;

//004CE09C
procedure TCustomTabControl.SetStyle(Value:TTabStyle);
begin
{*
 004CE09C    push        ebp
 004CE09D    mov         ebp,esp
 004CE09F    push        0
 004CE0A1    push        ebx
 004CE0A2    push        esi
 004CE0A3    mov         ebx,edx
 004CE0A5    mov         esi,eax
 004CE0A7    xor         eax,eax
 004CE0A9    push        ebp
 004CE0AA    push        4CE11D
 004CE0AF    push        dword ptr fs:[eax]
 004CE0B2    mov         dword ptr fs:[eax],esp
 004CE0B5    cmp         bl,byte ptr [esi+28D]
>004CE0BB    je          004CE107
 004CE0BD    test        bl,bl
>004CE0BF    je          004CE0EB
 004CE0C1    cmp         byte ptr [esi+28E],0
>004CE0C8    je          004CE0EB
 004CE0CA    lea         edx,[ebp-4]
 004CE0CD    mov         eax,[0078D380];^SResString178:TResStringRec
 004CE0D2    call        LoadResString
 004CE0D7    mov         ecx,dword ptr [ebp-4]
 004CE0DA    mov         dl,1
 004CE0DC    mov         eax,[00439268];EInvalidOperation
 004CE0E1    call        Exception.Create
 004CE0E6    call        @RaiseExcept
 004CE0EB    test        bl,bl
 004CE0ED    sete        dl
 004CE0F0    mov         eax,esi
 004CE0F2    mov         ecx,dword ptr [eax]
 004CE0F4    call        dword ptr [ecx+0D8]
 004CE0FA    mov         byte ptr [esi+28D],bl
 004CE100    mov         eax,esi
 004CE102    call        TWinControl.RecreateWnd
 004CE107    xor         eax,eax
 004CE109    pop         edx
 004CE10A    pop         ecx
 004CE10B    pop         ecx
 004CE10C    mov         dword ptr fs:[eax],edx
 004CE10F    push        4CE124
 004CE114    lea         eax,[ebp-4]
 004CE117    call        @UStrClr
 004CE11C    ret
>004CE11D    jmp         @HandleFinally
>004CE122    jmp         004CE114
 004CE124    pop         esi
 004CE125    pop         ebx
 004CE126    pop         ecx
 004CE127    pop         ebp
 004CE128    ret
*}
end;

//004CE12C
procedure TCustomTabControl.SetTabHeight(Value:SmallInt);
begin
{*
 004CE12C    push        ebp
 004CE12D    mov         ebp,esp
 004CE12F    add         esp,0FFFFFFF0
 004CE132    push        ebx
 004CE133    xor         ecx,ecx
 004CE135    mov         dword ptr [ebp-0C],ecx
 004CE138    mov         dword ptr [ebp-10],ecx
 004CE13B    mov         ebx,eax
 004CE13D    xor         eax,eax
 004CE13F    push        ebp
 004CE140    push        4CE1BD
 004CE145    push        dword ptr fs:[eax]
 004CE148    mov         dword ptr fs:[eax],esp
 004CE14B    cmp         dx,word ptr [ebx+296]
>004CE152    je          004CE1A2
 004CE154    test        dx,dx
>004CE157    jge         004CE194
 004CE159    lea         edx,[ebp-0C]
 004CE15C    mov         eax,dword ptr [ebx]
 004CE15E    call        TObject.ClassName
 004CE163    mov         eax,dword ptr [ebp-0C]
 004CE166    mov         dword ptr [ebp-8],eax
 004CE169    mov         byte ptr [ebp-4],11
 004CE16D    lea         eax,[ebp-8]
 004CE170    push        eax
 004CE171    push        0
 004CE173    lea         edx,[ebp-10]
 004CE176    mov         eax,[0078D0A0];^SResString207:TResStringRec
 004CE17B    call        LoadResString
 004CE180    mov         ecx,dword ptr [ebp-10]
 004CE183    mov         dl,1
 004CE185    mov         eax,[00439268];EInvalidOperation
 004CE18A    call        Exception.CreateFmt
 004CE18F    call        @RaiseExcept
 004CE194    mov         word ptr [ebx+296],dx
 004CE19B    mov         eax,ebx
 004CE19D    call        TCustomTabControl.UpdateTabSize
 004CE1A2    xor         eax,eax
 004CE1A4    pop         edx
 004CE1A5    pop         ecx
 004CE1A6    pop         ecx
 004CE1A7    mov         dword ptr fs:[eax],edx
 004CE1AA    push        4CE1C4
 004CE1AF    lea         eax,[ebp-10]
 004CE1B2    mov         edx,2
 004CE1B7    call        @UStrArrayClr
 004CE1BC    ret
>004CE1BD    jmp         @HandleFinally
>004CE1C2    jmp         004CE1AF
 004CE1C4    pop         ebx
 004CE1C5    mov         esp,ebp
 004CE1C7    pop         ebp
 004CE1C8    ret
*}
end;

//004CE1CC
procedure TCustomTabControl.SetTabIndex(Value:Integer);
begin
{*
 004CE1CC    push        ebx
 004CE1CD    push        esi
 004CE1CE    mov         esi,edx
 004CE1D0    mov         ebx,eax
 004CE1D2    test        byte ptr [ebx+1C],8
>004CE1D6    jne         004CE1ED
 004CE1D8    push        0
 004CE1DA    push        esi
 004CE1DB    push        130C
 004CE1E0    mov         eax,ebx
 004CE1E2    call        TWinControl.GetHandle
 004CE1E7    push        eax
 004CE1E8    call        user32.SendMessageW
 004CE1ED    pop         esi
 004CE1EE    pop         ebx
 004CE1EF    ret
*}
end;

//004CE1F0
procedure TCustomTabControl.SetTabPosition(Value:TTabPosition);
begin
{*
 004CE1F0    push        ebp
 004CE1F1    mov         ebp,esp
 004CE1F3    push        0
 004CE1F5    push        ebx
 004CE1F6    mov         ebx,eax
 004CE1F8    xor         eax,eax
 004CE1FA    push        ebp
 004CE1FB    push        4CE27B
 004CE200    push        dword ptr fs:[eax]
 004CE203    mov         dword ptr fs:[eax],esp
 004CE206    cmp         dl,byte ptr [ebx+28E]
>004CE20C    je          004CE265
 004CE20E    test        dl,dl
>004CE210    je          004CE23C
 004CE212    cmp         byte ptr [ebx+28D],0
>004CE219    je          004CE23C
 004CE21B    lea         edx,[ebp-4]
 004CE21E    mov         eax,[0078CCC0];^SResString177:TResStringRec
 004CE223    call        LoadResString
 004CE228    mov         ecx,dword ptr [ebp-4]
 004CE22B    mov         dl,1
 004CE22D    mov         eax,[00439268];EInvalidOperation
 004CE232    call        Exception.Create
 004CE237    call        @RaiseExcept
 004CE23C    mov         byte ptr [ebx+28E],dl
 004CE242    cmp         byte ptr [ebx+280],0
>004CE249    jne         004CE25E
 004CE24B    cmp         dl,2
>004CE24E    je          004CE255
 004CE250    cmp         dl,3
>004CE253    jne         004CE25E
 004CE255    mov         dl,1
 004CE257    mov         eax,ebx
 004CE259    call        TCustomTabControl.InternalSetMultiLine
 004CE25E    mov         eax,ebx
 004CE260    call        TWinControl.RecreateWnd
 004CE265    xor         eax,eax
 004CE267    pop         edx
 004CE268    pop         ecx
 004CE269    pop         ecx
 004CE26A    mov         dword ptr fs:[eax],edx
 004CE26D    push        4CE282
 004CE272    lea         eax,[ebp-4]
 004CE275    call        @UStrClr
 004CE27A    ret
>004CE27B    jmp         @HandleFinally
>004CE280    jmp         004CE272
 004CE282    pop         ebx
 004CE283    pop         ecx
 004CE284    pop         ebp
 004CE285    ret
*}
end;

//004CE288
procedure TCustomTabControl.SetTabWidth(Value:SmallInt);
begin
{*
 004CE288    push        ebp
 004CE289    mov         ebp,esp
 004CE28B    add         esp,0FFFFFFF0
 004CE28E    push        ebx
 004CE28F    xor         ecx,ecx
 004CE291    mov         dword ptr [ebp-0C],ecx
 004CE294    mov         dword ptr [ebp-10],ecx
 004CE297    mov         ebx,eax
 004CE299    xor         eax,eax
 004CE29B    push        ebp
 004CE29C    push        4CE333
 004CE2A1    push        dword ptr fs:[eax]
 004CE2A4    mov         dword ptr fs:[eax],esp
 004CE2A7    cmp         dx,word ptr [ebx+294]
>004CE2AE    je          004CE318
 004CE2B0    test        dx,dx
>004CE2B3    jge         004CE2F0
 004CE2B5    lea         edx,[ebp-0C]
 004CE2B8    mov         eax,dword ptr [ebx]
 004CE2BA    call        TObject.ClassName
 004CE2BF    mov         eax,dword ptr [ebp-0C]
 004CE2C2    mov         dword ptr [ebp-8],eax
 004CE2C5    mov         byte ptr [ebp-4],11
 004CE2C9    lea         eax,[ebp-8]
 004CE2CC    push        eax
 004CE2CD    push        0
 004CE2CF    lea         edx,[ebp-10]
 004CE2D2    mov         eax,[0078D0A0];^SResString207:TResStringRec
 004CE2D7    call        LoadResString
 004CE2DC    mov         ecx,dword ptr [ebp-10]
 004CE2DF    mov         dl,1
 004CE2E1    mov         eax,[00439268];EInvalidOperation
 004CE2E6    call        Exception.CreateFmt
 004CE2EB    call        @RaiseExcept
 004CE2F0    movzx       eax,word ptr [ebx+294]
 004CE2F7    mov         word ptr [ebx+294],dx
 004CE2FE    test        ax,ax
>004CE301    je          004CE308
 004CE303    test        dx,dx
>004CE306    jne         004CE311
 004CE308    mov         eax,ebx
 004CE30A    call        TWinControl.RecreateWnd
>004CE30F    jmp         004CE318
 004CE311    mov         eax,ebx
 004CE313    call        TCustomTabControl.UpdateTabSize
 004CE318    xor         eax,eax
 004CE31A    pop         edx
 004CE31B    pop         ecx
 004CE31C    pop         ecx
 004CE31D    mov         dword ptr fs:[eax],edx
 004CE320    push        4CE33A
 004CE325    lea         eax,[ebp-10]
 004CE328    mov         edx,2
 004CE32D    call        @UStrArrayClr
 004CE332    ret
>004CE333    jmp         @HandleFinally
>004CE338    jmp         004CE325
 004CE33A    pop         ebx
 004CE33B    mov         esp,ebp
 004CE33D    pop         ebp
 004CE33E    ret
*}
end;

//004CE340
procedure TCustomTabControl.TabsChanged;
begin
{*
 004CE340    push        ebx
 004CE341    mov         ebx,eax
 004CE343    cmp         byte ptr [ebx+298],0
>004CE34A    jne         004CE37D
 004CE34C    mov         eax,ebx
 004CE34E    call        TWinControl.HandleAllocated
 004CE353    test        al,al
>004CE355    je          004CE376
 004CE357    movzx       eax,word ptr [ebx+48]
 004CE35B    movzx       edx,word ptr [ebx+4C]
 004CE35F    shl         edx,10
 004CE362    or          eax,edx
 004CE364    push        eax
 004CE365    push        0
 004CE367    push        5
 004CE369    mov         eax,ebx
 004CE36B    call        TWinControl.GetHandle
 004CE370    push        eax
 004CE371    call        user32.SendMessageW
 004CE376    mov         eax,ebx
 004CE378    call        TWinControl.Realign
 004CE37D    pop         ebx
 004CE37E    ret
*}
end;

//004CE380
procedure TCustomTabControl.UpdateTabSize;
begin
{*
 004CE380    push        ebx
 004CE381    push        esi
 004CE382    mov         ebx,eax
 004CE384    lea         esi,[ebx+294]
 004CE38A    movzx       eax,word ptr [esi]
 004CE38D    movzx       eax,ax
 004CE390    movzx       edx,word ptr [esi+2]
 004CE394    movzx       edx,dx
 004CE397    shl         edx,10
 004CE39A    or          eax,edx
 004CE39C    push        eax
 004CE39D    push        0
 004CE39F    push        1329
 004CE3A4    mov         eax,ebx
 004CE3A6    call        TWinControl.GetHandle
 004CE3AB    push        eax
 004CE3AC    call        user32.SendMessageW
 004CE3B1    mov         eax,ebx
 004CE3B3    call        TCustomTabControl.TabsChanged
 004CE3B8    pop         esi
 004CE3B9    pop         ebx
 004CE3BA    ret
*}
end;

//004CE3BC
procedure TCustomTabControl.UpdateTabImages;
begin
{*
 004CE3BC    push        ebp
 004CE3BD    mov         ebp,esp
 004CE3BF    add         esp,0FFFFFFC4
 004CE3C2    push        ebx
 004CE3C3    push        esi
 004CE3C4    push        edi
 004CE3C5    xor         edx,edx
 004CE3C7    mov         dword ptr [ebp-24],edx
 004CE3CA    mov         dword ptr [ebp-38],edx
 004CE3CD    mov         dword ptr [ebp-3C],edx
 004CE3D0    mov         esi,eax
 004CE3D2    xor         eax,eax
 004CE3D4    push        ebp
 004CE3D5    push        4CE4A7
 004CE3DA    push        dword ptr fs:[eax]
 004CE3DD    mov         dword ptr fs:[eax],esp
 004CE3E0    mov         dword ptr [ebp-20],2
 004CE3E7    mov         eax,dword ptr [esi+290]
 004CE3ED    mov         edx,dword ptr [eax]
 004CE3EF    call        dword ptr [edx+14]
 004CE3F2    dec         eax
 004CE3F3    test        eax,eax
>004CE3F5    jl          004CE47D
 004CE3FB    inc         eax
 004CE3FC    mov         dword ptr [ebp-4],eax
 004CE3FF    xor         ebx,ebx
 004CE401    mov         edx,ebx
 004CE403    mov         eax,esi
 004CE405    mov         ecx,dword ptr [eax]
 004CE407    call        dword ptr [ecx+0F4]
 004CE40D    mov         dword ptr [ebp-0C],eax
 004CE410    lea         eax,[ebp-20]
 004CE413    push        eax
 004CE414    mov         eax,esi
 004CE416    call        TWinControl.GetHandle
 004CE41B    mov         ecx,ebx
 004CE41D    mov         edx,133D
 004CE422    call        SendStructMessage
 004CE427    test        eax,eax
>004CE429    jne         004CE477
 004CE42B    lea         eax,[ebp-24]
 004CE42E    push        eax
 004CE42F    lea         ecx,[ebp-38]
 004CE432    mov         edx,ebx
 004CE434    mov         eax,dword ptr [esi+290]
 004CE43A    mov         edi,dword ptr [eax]
 004CE43C    call        dword ptr [edi+0C]
 004CE43F    mov         eax,dword ptr [ebp-38]
 004CE442    mov         dword ptr [ebp-34],eax
 004CE445    mov         byte ptr [ebp-30],11
 004CE449    mov         dword ptr [ebp-2C],ebx
 004CE44C    mov         byte ptr [ebp-28],0
 004CE450    lea         eax,[ebp-34]
 004CE453    push        eax
 004CE454    lea         edx,[ebp-3C]
 004CE457    mov         eax,[0078D80C];^SResString311:TResStringRec
 004CE45C    call        LoadResString
 004CE461    mov         eax,dword ptr [ebp-3C]
 004CE464    mov         ecx,1
 004CE469    pop         edx
 004CE46A    call        Format
 004CE46F    mov         eax,dword ptr [ebp-24]
 004CE472    call        TabControlError
 004CE477    inc         ebx
 004CE478    dec         dword ptr [ebp-4]
>004CE47B    jne         004CE401
 004CE47D    mov         eax,esi
 004CE47F    call        TCustomTabControl.TabsChanged
 004CE484    xor         eax,eax
 004CE486    pop         edx
 004CE487    pop         ecx
 004CE488    pop         ecx
 004CE489    mov         dword ptr fs:[eax],edx
 004CE48C    push        4CE4AE
 004CE491    lea         eax,[ebp-3C]
 004CE494    mov         edx,2
 004CE499    call        @UStrArrayClr
 004CE49E    lea         eax,[ebp-24]
 004CE4A1    call        @UStrClr
 004CE4A6    ret
>004CE4A7    jmp         @HandleFinally
>004CE4AC    jmp         004CE491
 004CE4AE    pop         edi
 004CE4AF    pop         esi
 004CE4B0    pop         ebx
 004CE4B1    mov         esp,ebp
 004CE4B3    pop         ebp
 004CE4B4    ret
*}
end;

//004CE4B8
procedure TCustomTabControl.CNDrawItem(var Message:TWMDrawItem);
begin
{*
 004CE4B8    push        ebp
 004CE4B9    mov         ebp,esp
 004CE4BB    add         esp,0FFFFFFF0
 004CE4BE    push        ebx
 004CE4BF    mov         dword ptr [ebp-8],edx
 004CE4C2    mov         dword ptr [ebp-4],eax
 004CE4C5    mov         eax,dword ptr [ebp-8]
 004CE4C8    mov         eax,dword ptr [eax+8]
 004CE4CB    mov         dword ptr [ebp-10],eax
 004CE4CE    mov         eax,dword ptr [ebp-10]
 004CE4D1    mov         eax,dword ptr [eax+18]
 004CE4D4    push        eax
 004CE4D5    call        gdi32.SaveDC
 004CE4DA    mov         dword ptr [ebp-0C],eax
 004CE4DD    mov         eax,dword ptr [ebp-4]
 004CE4E0    mov         eax,dword ptr [eax+270]
 004CE4E6    call        TCustomCanvas.Lock
 004CE4EB    xor         eax,eax
 004CE4ED    push        ebp
 004CE4EE    push        4CE596
 004CE4F3    push        dword ptr fs:[eax]
 004CE4F6    mov         dword ptr fs:[eax],esp
 004CE4F9    mov         eax,dword ptr [ebp-10]
 004CE4FC    mov         edx,dword ptr [eax+18]
 004CE4FF    mov         eax,dword ptr [ebp-4]
 004CE502    mov         eax,dword ptr [eax+270]
 004CE508    call        TCanvas.SetHandle
 004CE50D    mov         eax,dword ptr [ebp-4]
 004CE510    mov         edx,dword ptr [eax+64]
 004CE513    mov         eax,dword ptr [ebp-4]
 004CE516    mov         eax,dword ptr [eax+270]
 004CE51C    call        TCanvas.SetFont
 004CE521    mov         eax,dword ptr [ebp-4]
 004CE524    mov         edx,dword ptr [eax+1C0]
 004CE52A    mov         eax,dword ptr [ebp-4]
 004CE52D    mov         eax,dword ptr [eax+270]
 004CE533    call        TCanvas.SetBrush
 004CE538    mov         eax,dword ptr [ebp-10]
 004CE53B    test        byte ptr [eax+10],1
 004CE53F    setne       al
 004CE542    push        eax
 004CE543    mov         eax,dword ptr [ebp-10]
 004CE546    lea         ecx,[eax+1C]
 004CE549    mov         eax,dword ptr [ebp-10]
 004CE54C    mov         edx,dword ptr [eax+8]
 004CE54F    mov         eax,dword ptr [ebp-4]
 004CE552    mov         ebx,dword ptr [eax]
 004CE554    call        dword ptr [ebx+0F0]
 004CE55A    xor         eax,eax
 004CE55C    pop         edx
 004CE55D    pop         ecx
 004CE55E    pop         ecx
 004CE55F    mov         dword ptr fs:[eax],edx
 004CE562    push        4CE59D
 004CE567    mov         eax,dword ptr [ebp-4]
 004CE56A    mov         eax,dword ptr [eax+270]
 004CE570    xor         edx,edx
 004CE572    call        TCanvas.SetHandle
 004CE577    mov         eax,dword ptr [ebp-4]
 004CE57A    mov         eax,dword ptr [eax+270]
 004CE580    call        TCustomCanvas.Unlock
 004CE585    mov         eax,dword ptr [ebp-0C]
 004CE588    push        eax
 004CE589    mov         eax,dword ptr [ebp-10]
 004CE58C    mov         eax,dword ptr [eax+18]
 004CE58F    push        eax
 004CE590    call        gdi32.RestoreDC
 004CE595    ret
>004CE596    jmp         @HandleFinally
>004CE59B    jmp         004CE567
 004CE59D    mov         eax,dword ptr [ebp-8]
 004CE5A0    mov         dword ptr [eax+0C],1
 004CE5A7    pop         ebx
 004CE5A8    mov         esp,ebp
 004CE5AA    pop         ebp
 004CE5AB    ret
*}
end;

//004CE5AC
procedure TCustomTabControl.WMDestroy(var Message:TWMDestroy);
begin
{*
 004CE5AC    push        ebx
 004CE5AD    push        esi
 004CE5AE    push        edi
 004CE5AF    mov         edi,edx
 004CE5B1    mov         ebx,eax
 004CE5B3    mov         esi,dword ptr [ebx+290]
 004CE5B9    test        esi,esi
>004CE5BB    je          004CE5F6
 004CE5BD    mov         eax,esi
 004CE5BF    mov         edx,dword ptr [eax]
 004CE5C1    call        dword ptr [edx+14]
 004CE5C4    test        eax,eax
>004CE5C6    jle         004CE5F6
 004CE5C8    mov         dl,1
 004CE5CA    mov         eax,[0043C7BC];TStringList
 004CE5CF    call        TStringList.Create
 004CE5D4    mov         esi,eax
 004CE5D6    mov         dword ptr [ebx+288],esi
 004CE5DC    mov         edx,dword ptr [ebx+290]
 004CE5E2    mov         eax,esi
 004CE5E4    mov         ecx,dword ptr [eax]
 004CE5E6    call        dword ptr [ecx+8]
 004CE5E9    mov         eax,ebx
 004CE5EB    call        TCustomTabControl.GetTabIndex
 004CE5F0    mov         dword ptr [ebx+284],eax
 004CE5F6    call        user32.GetFocus
 004CE5FB    mov         esi,eax
 004CE5FD    test        esi,esi
>004CE5FF    je          004CE625
 004CE601    mov         eax,ebx
 004CE603    call        TWinControl.GetHandle
 004CE608    cmp         esi,eax
>004CE60A    je          004CE61E
 004CE60C    push        esi
 004CE60D    mov         eax,ebx
 004CE60F    call        TWinControl.GetHandle
 004CE614    push        eax
 004CE615    call        user32.IsChild
 004CE61A    test        eax,eax
>004CE61C    je          004CE625
 004CE61E    push        0
 004CE620    call        user32.SetFocus
 004CE625    mov         edx,edi
 004CE627    mov         eax,ebx
 004CE629    call        TWinControl.WMDestroy
 004CE62E    xor         eax,eax
 004CE630    mov         dword ptr [ebx+258],eax
 004CE636    pop         edi
 004CE637    pop         esi
 004CE638    pop         ebx
 004CE639    ret
*}
end;

//004CE63C
procedure TCoolBar.WMNotifyFormat(var Message:TWMNotifyFormat);
begin
{*
 004CE63C    push        ebx
 004CE63D    push        esi
 004CE63E    mov         ebx,edx
 004CE640    mov         esi,eax
 004CE642    mov         eax,dword ptr [ebx+8]
 004CE645    push        eax
 004CE646    mov         eax,dword ptr [ebx+4]
 004CE649    push        eax
 004CE64A    mov         eax,dword ptr [ebx]
 004CE64C    push        eax
 004CE64D    mov         eax,esi
 004CE64F    call        TWinControl.GetHandle
 004CE654    push        eax
 004CE655    call        user32.DefWindowProcW
 004CE65A    mov         dword ptr [ebx+0C],eax
 004CE65D    pop         esi
 004CE65E    pop         ebx
 004CE65F    ret
*}
end;

//004CE660
procedure TCustomTabControl.WMSize(var Message:TWMSize);
begin
{*
 004CE660    push        ebx
 004CE661    mov         ebx,eax
 004CE663    mov         eax,ebx
 004CE665    call        TWinControl.WMSize
 004CE66A    push        5
 004CE66C    push        0
 004CE66E    push        0
 004CE670    mov         eax,ebx
 004CE672    call        TWinControl.GetHandle
 004CE677    push        eax
 004CE678    call        user32.RedrawWindow
 004CE67D    pop         ebx
 004CE67E    ret
*}
end;

//004CE680
procedure TCustomTabControl.CMFontChanged(var Message:TMessage);
begin
{*
 004CE680    push        ebx
 004CE681    mov         ebx,eax
 004CE683    mov         eax,ebx
 004CE685    call        TWinControl.CMFontChanged
 004CE68A    mov         eax,ebx
 004CE68C    call        TWinControl.HandleAllocated
 004CE691    test        al,al
>004CE693    je          004CE6A5
 004CE695    push        0
 004CE697    xor         ecx,ecx
 004CE699    mov         edx,5
 004CE69E    mov         eax,ebx
 004CE6A0    call        TControl.Perform
 004CE6A5    pop         ebx
 004CE6A6    ret
*}
end;

//004CE6A8
procedure TCoolBar.CMSysColorChange(var Message:TMessage);
begin
{*
 004CE6A8    push        ebx
 004CE6A9    push        esi
 004CE6AA    mov         esi,edx
 004CE6AC    mov         ebx,eax
 004CE6AE    mov         edx,esi
 004CE6B0    mov         eax,ebx
 004CE6B2    call        TWinControl.CMSysColorChange
 004CE6B7    test        byte ptr [ebx+1C],1
>004CE6BB    jne         004CE6CC
 004CE6BD    mov         dword ptr [esi],15
 004CE6C3    mov         edx,esi
 004CE6C5    mov         eax,ebx
 004CE6C7    mov         ecx,dword ptr [eax]
 004CE6C9    call        dword ptr [ecx-10]
 004CE6CC    pop         esi
 004CE6CD    pop         ebx
 004CE6CE    ret
*}
end;

//004CE6D0
procedure TCustomTabControl.CMTabStopChanged(var Message:TMessage);
begin
{*
 004CE6D0    test        byte ptr [eax+1C],10
>004CE6D4    jne         004CE6DB
 004CE6D6    call        TWinControl.RecreateWnd
 004CE6DB    ret
*}
end;

//004CE6DC
procedure TCustomTabControl.CNNotify(var Message:TWMNotify);
begin
{*
 004CE6DC    push        ebx
 004CE6DD    push        esi
 004CE6DE    push        edi
 004CE6DF    mov         edi,edx
 004CE6E1    mov         ebx,eax
 004CE6E3    mov         eax,dword ptr [edi+8]
 004CE6E6    mov         eax,dword ptr [eax+8]
 004CE6E9    sub         eax,0FFFFFDD8
>004CE6EE    je          004CE700
 004CE6F0    dec         eax
>004CE6F1    jne         004CE71B
 004CE6F3    mov         eax,ebx
 004CE6F5    mov         si,0FFAE
 004CE6F9    call        @CallDynaInst
>004CE6FE    jmp         004CE71B
 004CE700    mov         dword ptr [edi+0C],1
 004CE707    mov         eax,ebx
 004CE709    mov         si,0FFAF
 004CE70D    call        @CallDynaInst
 004CE712    test        al,al
>004CE714    je          004CE71B
 004CE716    xor         eax,eax
 004CE718    mov         dword ptr [edi+0C],eax
 004CE71B    pop         edi
 004CE71C    pop         esi
 004CE71D    pop         ebx
 004CE71E    ret
*}
end;

//004CE720
procedure TCustomTabControl.CMDialogChar(var Message:TCMDialogChar);
begin
{*
 004CE720    push        ebp
 004CE721    mov         ebp,esp
 004CE723    add         esp,0FFFFFFF4
 004CE726    push        ebx
 004CE727    push        esi
 004CE728    push        edi
 004CE729    xor         ecx,ecx
 004CE72B    mov         dword ptr [ebp-0C],ecx
 004CE72E    mov         dword ptr [ebp-4],edx
 004CE731    mov         ebx,eax
 004CE733    xor         eax,eax
 004CE735    push        ebp
 004CE736    push        4CE7F5
 004CE73B    push        dword ptr fs:[eax]
 004CE73E    mov         dword ptr fs:[eax],esp
 004CE741    mov         eax,dword ptr [ebx+290]
 004CE747    mov         edx,dword ptr [eax]
 004CE749    call        dword ptr [edx+14]
 004CE74C    dec         eax
 004CE74D    test        eax,eax
>004CE74F    jl          004CE7D5
 004CE755    inc         eax
 004CE756    mov         dword ptr [ebp-8],eax
 004CE759    xor         edi,edi
 004CE75B    lea         ecx,[ebp-0C]
 004CE75E    mov         edx,edi
 004CE760    mov         eax,dword ptr [ebx+290]
 004CE766    mov         esi,dword ptr [eax]
 004CE768    call        dword ptr [esi+0C]
 004CE76B    mov         edx,dword ptr [ebp-0C]
 004CE76E    mov         eax,dword ptr [ebp-4]
 004CE771    movzx       eax,word ptr [eax+4]
 004CE775    call        IsAccel
 004CE77A    test        al,al
>004CE77C    je          004CE7CF
 004CE77E    mov         edx,edi
 004CE780    mov         eax,ebx
 004CE782    mov         ecx,dword ptr [eax]
 004CE784    call        dword ptr [ecx+0EC]
 004CE78A    test        al,al
>004CE78C    je          004CE7CF
 004CE78E    mov         eax,ebx
 004CE790    mov         si,0FFB6
 004CE794    call        @CallDynaInst
 004CE799    test        al,al
>004CE79B    je          004CE7CF
 004CE79D    mov         eax,dword ptr [ebp-4]
 004CE7A0    mov         dword ptr [eax+0C],1
 004CE7A7    mov         eax,ebx
 004CE7A9    mov         si,0FFAF
 004CE7AD    call        @CallDynaInst
 004CE7B2    test        al,al
>004CE7B4    je          004CE7DF
 004CE7B6    mov         edx,edi
 004CE7B8    mov         eax,ebx
 004CE7BA    mov         ecx,dword ptr [eax]
 004CE7BC    call        dword ptr [ecx+0F8]
 004CE7C2    mov         eax,ebx
 004CE7C4    mov         si,0FFAE
 004CE7C8    call        @CallDynaInst
>004CE7CD    jmp         004CE7DF
 004CE7CF    inc         edi
 004CE7D0    dec         dword ptr [ebp-8]
>004CE7D3    jne         004CE75B
 004CE7D5    mov         edx,dword ptr [ebp-4]
 004CE7D8    mov         eax,ebx
 004CE7DA    call        TWinControl.CMDialogChar
 004CE7DF    xor         eax,eax
 004CE7E1    pop         edx
 004CE7E2    pop         ecx
 004CE7E3    pop         ecx
 004CE7E4    mov         dword ptr fs:[eax],edx
 004CE7E7    push        4CE7FC
 004CE7EC    lea         eax,[ebp-0C]
 004CE7EF    call        @UStrClr
 004CE7F4    ret
>004CE7F5    jmp         @HandleFinally
>004CE7FA    jmp         004CE7EC
 004CE7FC    pop         edi
 004CE7FD    pop         esi
 004CE7FE    pop         ebx
 004CE7FF    mov         esp,ebp
 004CE801    pop         ebp
 004CE802    ret
*}
end;

//004CE804
procedure TCustomTabControl.AdjustClientRect(var Rect:TRect);
begin
{*
 004CE804    push        ebx
 004CE805    push        esi
 004CE806    push        edi
 004CE807    add         esp,0FFFFFFF0
 004CE80A    mov         esi,edx
 004CE80C    mov         ebx,eax
 004CE80E    mov         edx,esp
 004CE810    mov         eax,ebx
 004CE812    call        TCustomTabControl.GetDisplayRect
 004CE817    push        esi
 004CE818    mov         edi,esi
 004CE81A    lea         esi,[esp+4]
 004CE81E    movs        dword ptr [edi],dword ptr [esi]
 004CE81F    movs        dword ptr [edi],dword ptr [esi]
 004CE820    movs        dword ptr [edi],dword ptr [esi]
 004CE821    movs        dword ptr [edi],dword ptr [esi]
 004CE822    pop         esi
 004CE823    mov         edx,esi
 004CE825    mov         eax,ebx
 004CE827    call        TWinControl.AdjustClientRect
 004CE82C    add         esp,10
 004CE82F    pop         edi
 004CE830    pop         esi
 004CE831    pop         ebx
 004CE832    ret
*}
end;

//004CE834
function TCustomTabControl.IndexOfTabAt(X:Integer; Y:Integer):Integer;
begin
{*
 004CE834    push        ebx
 004CE835    push        esi
 004CE836    push        edi
 004CE837    push        ebp
 004CE838    add         esp,0FFFFFFDC
 004CE83B    mov         edi,ecx
 004CE83D    mov         esi,edx
 004CE83F    mov         ebx,eax
 004CE841    or          ebp,0FFFFFFFF
 004CE844    mov         dword ptr [esp],esi
 004CE847    mov         dword ptr [esp+4],edi
 004CE84B    lea         edx,[esp+14]
 004CE84F    mov         eax,ebx
 004CE851    mov         ecx,dword ptr [eax]
 004CE853    call        dword ptr [ecx+54]
 004CE856    lea         eax,[esp+14]
 004CE85A    mov         edx,esp
 004CE85C    call        PtInRect
 004CE861    test        al,al
>004CE863    je          004CE888
 004CE865    mov         dword ptr [esp+8],esi
 004CE869    mov         dword ptr [esp+0C],edi
 004CE86D    mov         eax,ebx
 004CE86F    call        TWinControl.GetHandle
 004CE874    lea         edx,[esp+8]
 004CE878    push        edx
 004CE879    push        0
 004CE87B    push        130D
 004CE880    push        eax
 004CE881    call        user32.SendMessageW
 004CE886    mov         ebp,eax
 004CE888    mov         eax,ebp
 004CE88A    add         esp,24
 004CE88D    pop         ebp
 004CE88E    pop         edi
 004CE88F    pop         esi
 004CE890    pop         ebx
 004CE891    ret
*}
end;

//004CE894
function TCustomTabControl.GetHitTestInfoAt(X:Integer; Y:Integer):THitTests;
begin
{*
 004CE894    push        ebx
 004CE895    push        esi
 004CE896    push        edi
 004CE897    push        ebp
 004CE898    add         esp,0FFFFFFDC
 004CE89B    mov         ebp,ecx
 004CE89D    mov         edi,edx
 004CE89F    mov         ebx,eax
 004CE8A1    movzx       esi,word ptr ds:[4CE938]
 004CE8A8    mov         dword ptr [esp],edi
 004CE8AB    mov         dword ptr [esp+4],ebp
 004CE8AF    lea         edx,[esp+14]
 004CE8B3    mov         eax,ebx
 004CE8B5    mov         ecx,dword ptr [eax]
 004CE8B7    call        dword ptr [ecx+54]
 004CE8BA    lea         eax,[esp+14]
 004CE8BE    mov         edx,esp
 004CE8C0    call        PtInRect
 004CE8C5    test        al,al
>004CE8C7    je          004CE92E
 004CE8C9    mov         dword ptr [esp+8],edi
 004CE8CD    mov         dword ptr [esp+0C],ebp
 004CE8D1    mov         eax,ebx
 004CE8D3    call        TWinControl.GetHandle
 004CE8D8    lea         edx,[esp+8]
 004CE8DC    push        edx
 004CE8DD    push        0
 004CE8DF    push        130D
 004CE8E4    push        eax
 004CE8E5    call        user32.SendMessageW
 004CE8EA    inc         eax
>004CE8EB    je          004CE927
 004CE8ED    mov         ebx,dword ptr [esp+10]
 004CE8F1    test        bl,1
>004CE8F4    je          004CE8FA
 004CE8F6    or          si,4
 004CE8FA    mov         eax,ebx
 004CE8FC    and         eax,6
 004CE8FF    cmp         eax,6
>004CE902    jne         004CE90A
 004CE904    or          si,8
>004CE908    jmp         004CE92E
 004CE90A    test        eax,eax
>004CE90C    je          004CE912
 004CE90E    or          si,8
 004CE912    test        bl,2
>004CE915    je          004CE91B
 004CE917    or          si,20
 004CE91B    test        bl,4
>004CE91E    je          004CE92E
 004CE920    or          si,80
>004CE925    jmp         004CE92E
 004CE927    movzx       esi,word ptr ds:[4CE93C]
 004CE92E    mov         eax,esi
 004CE930    add         esp,24
 004CE933    pop         ebp
 004CE934    pop         edi
 004CE935    pop         esi
 004CE936    pop         ebx
 004CE937    ret
*}
end;

//004CE940
function TCustomTabControl.TabRect(Index:Integer):TRect;
begin
{*
 004CE940    push        ebx
 004CE941    push        esi
 004CE942    push        edi
 004CE943    mov         edi,ecx
 004CE945    mov         esi,edx
 004CE947    call        TWinControl.GetHandle
 004CE94C    mov         ebx,eax
 004CE94E    push        edi
 004CE94F    push        esi
 004CE950    push        130A
 004CE955    push        ebx
 004CE956    call        user32.SendMessageW
 004CE95B    pop         edi
 004CE95C    pop         esi
 004CE95D    pop         ebx
 004CE95E    ret
*}
end;

//004CE960
function TCustomTabControl.RowCount:Integer;
begin
{*
 004CE960    call        TWinControl.GetHandle
 004CE965    push        0
 004CE967    push        0
 004CE969    push        132C
 004CE96E    push        eax
 004CE96F    call        user32.SendMessageW
 004CE974    ret
*}
end;

//004CE978
procedure TCustomTabControl.ScrollTabs(Delta:Integer);
begin
{*
 004CE978    push        ebx
 004CE979    push        esi
 004CE97A    push        edi
 004CE97B    add         esp,0FFFFFFE8
 004CE97E    mov         esi,edx
 004CE980    mov         ebx,eax
 004CE982    push        0
 004CE984    push        4CEA14
 004CE989    push        0
 004CE98B    mov         eax,ebx
 004CE98D    call        TWinControl.GetHandle
 004CE992    push        eax
 004CE993    call        user32.FindWindowExW
 004CE998    mov         ebx,eax
 004CE99A    test        ebx,ebx
>004CE99C    je          004CEA0A
 004CE99E    lea         eax,[esp+8]
 004CE9A2    push        eax
 004CE9A3    push        ebx
 004CE9A4    call        user32.GetClientRect
 004CE9A9    test        esi,esi
>004CE9AB    jge         004CE9B9
 004CE9AD    mov         eax,dword ptr [esp+8]
 004CE9B1    add         eax,2
 004CE9B4    mov         dword ptr [esp],eax
>004CE9B7    jmp         004CE9C3
 004CE9B9    mov         eax,dword ptr [esp+10]
 004CE9BD    sub         eax,2
 004CE9C0    mov         dword ptr [esp],eax
 004CE9C3    mov         eax,dword ptr [esp+0C]
 004CE9C7    add         eax,2
 004CE9CA    mov         dword ptr [esp+4],eax
 004CE9CE    mov         eax,esi
 004CE9D0    cdq
 004CE9D1    xor         eax,edx
 004CE9D3    sub         eax,edx
 004CE9D5    dec         eax
 004CE9D6    test        eax,eax
>004CE9D8    jl          004CEA0A
 004CE9DA    inc         eax
 004CE9DB    mov         esi,eax
 004CE9DD    movzx       edi,word ptr [esp]
 004CE9E1    movzx       eax,word ptr [esp+4]
 004CE9E6    shl         eax,10
 004CE9E9    or          edi,eax
 004CE9EB    push        edi
 004CE9EC    push        0
 004CE9EE    push        201
 004CE9F3    push        ebx
 004CE9F4    call        user32.SendMessageW
 004CE9F9    push        edi
 004CE9FA    push        0
 004CE9FC    push        202
 004CEA01    push        ebx
 004CEA02    call        user32.SendMessageW
 004CEA07    dec         esi
>004CEA08    jne         004CE9DD
 004CEA0A    add         esp,18
 004CEA0D    pop         edi
 004CEA0E    pop         esi
 004CEA0F    pop         ebx
 004CEA10    ret
*}
end;

//004CEA34
procedure TCustomTabControl.TCMAdjustRect(var Message:TTCMAdjustRect);
begin
{*
 004CEA34    push        ebp
 004CEA35    mov         ebp,esp
 004CEA37    add         esp,0FFFFFFF8
 004CEA3A    push        ebx
 004CEA3B    push        esi
 004CEA3C    push        edi
 004CEA3D    mov         dword ptr [ebp-8],edx
 004CEA40    mov         dword ptr [ebp-4],eax
 004CEA43    xor         eax,eax
 004CEA45    push        ebp
 004CEA46    push        4CEA90
 004CEA4B    push        dword ptr fs:[eax]
 004CEA4E    mov         dword ptr fs:[eax],esp
 004CEA51    mov         edx,dword ptr [ebp-8]
 004CEA54    mov         eax,dword ptr [ebp-4]
 004CEA57    mov         ecx,dword ptr [eax]
 004CEA59    call        dword ptr [ecx-10]
 004CEA5C    mov         eax,dword ptr [ebp-4]
 004CEA5F    cmp         byte ptr [eax+28E],0
>004CEA66    je          004CEA86
 004CEA68    mov         eax,dword ptr [ebp-8]
 004CEA6B    cmp         dword ptr [eax+4],0
>004CEA6F    jne         004CEA86
 004CEA71    mov         eax,dword ptr [ebp-8]
 004CEA74    mov         eax,dword ptr [eax+8]
 004CEA77    mov         edx,dword ptr [ebp-4]
 004CEA7A    mov         esi,eax
 004CEA7C    lea         edi,[edx+29C]
 004CEA82    movs        dword ptr [edi],dword ptr [esi]
 004CEA83    movs        dword ptr [edi],dword ptr [esi]
 004CEA84    movs        dword ptr [edi],dword ptr [esi]
 004CEA85    movs        dword ptr [edi],dword ptr [esi]
 004CEA86    xor         eax,eax
 004CEA88    pop         edx
 004CEA89    pop         ecx
 004CEA8A    pop         ecx
 004CEA8B    mov         dword ptr fs:[eax],edx
>004CEA8E    jmp         004CEAAF
>004CEA90    jmp         @HandleAnyException
 004CEA95    mov         eax,dword ptr [ebp-4]
 004CEA98    mov         edx,dword ptr [ebp-8]
 004CEA9B    mov         edx,dword ptr [edx+8]
 004CEA9E    lea         esi,[eax+29C]
 004CEAA4    mov         edi,edx
 004CEAA6    movs        dword ptr [edi],dword ptr [esi]
 004CEAA7    movs        dword ptr [edi],dword ptr [esi]
 004CEAA8    movs        dword ptr [edi],dword ptr [esi]
 004CEAA9    movs        dword ptr [edi],dword ptr [esi]
 004CEAAA    call        @DoneExcept
 004CEAAF    pop         edi
 004CEAB0    pop         esi
 004CEAB1    pop         ebx
 004CEAB2    pop         ecx
 004CEAB3    pop         ecx
 004CEAB4    pop         ebp
 004CEAB5    ret
*}
end;

//004CEAB8
function TCustomTabControl.GetTabs:TStrings;
begin
{*
 004CEAB8    mov         edx,dword ptr [eax+288]
 004CEABE    test        edx,edx
>004CEAC0    je          004CEAC5
 004CEAC2    mov         eax,edx
 004CEAC4    ret
 004CEAC5    mov         eax,dword ptr [eax+290]
 004CEACB    ret
*}
end;

//004CEACC
constructor TTabSheet.Create;
begin
{*
 004CEACC    push        ebx
 004CEACD    push        esi
 004CEACE    test        dl,dl
>004CEAD0    je          004CEADA
 004CEAD2    add         esp,0FFFFFFF0
 004CEAD5    call        @ClassCreate
 004CEADA    mov         ebx,edx
 004CEADC    mov         esi,eax
 004CEADE    xor         edx,edx
 004CEAE0    mov         eax,esi
 004CEAE2    call        TWinControl.Create
 004CEAE7    mov         dl,5
 004CEAE9    mov         eax,esi
 004CEAEB    call        TControl.SetAlign
 004CEAF0    mov         eax,dword ptr [esi+50]
 004CEAF3    or          eax,dword ptr ds:[4CEB30]
 004CEAF9    mov         dword ptr [esi+50],eax
 004CEAFC    xor         edx,edx
 004CEAFE    mov         eax,esi
 004CEB00    call        TControl.SetVisible
 004CEB05    mov         byte ptr [esi+278],1
 004CEB0C    mov         byte ptr [esi+27A],0
 004CEB13    mov         eax,esi
 004CEB15    test        bl,bl
>004CEB17    je          004CEB28
 004CEB19    call        @AfterConstruction
 004CEB1E    pop         dword ptr fs:[0]
 004CEB25    add         esp,0C
 004CEB28    mov         eax,esi
 004CEB2A    pop         esi
 004CEB2B    pop         ebx
 004CEB2C    ret
*}
end;

//004CEB34
destructor TTabSheet.Destroy();
begin
{*
 004CEB34    push        ebx
 004CEB35    push        esi
 004CEB36    call        @BeforeDestruction
 004CEB3B    mov         ebx,edx
 004CEB3D    mov         esi,eax
 004CEB3F    mov         eax,dword ptr [esi+274]
 004CEB45    test        eax,eax
>004CEB47    je          004CEB66
 004CEB49    cmp         esi,dword ptr [eax+2DC]
>004CEB4F    jne         004CEB59
 004CEB51    xor         edx,edx
 004CEB53    mov         dword ptr [eax+2DC],edx
 004CEB59    mov         eax,dword ptr [esi+274]
 004CEB5F    mov         edx,esi
 004CEB61    call        TPageControl.RemovePage
 004CEB66    mov         edx,ebx
 004CEB68    and         dl,0FC
 004CEB6B    mov         eax,esi
 004CEB6D    call        TWinControl.Destroy
 004CEB72    test        bl,bl
>004CEB74    jle         004CEB7D
 004CEB76    mov         eax,esi
 004CEB78    call        @ClassDestroy
 004CEB7D    pop         esi
 004CEB7E    pop         ebx
 004CEB7F    ret
*}
end;

//004CEB80
procedure TTabSheet.DoHide;
begin
{*
 004CEB80    push        ebx
 004CEB81    cmp         word ptr [eax+282],0
>004CEB89    je          004CEB9B
 004CEB8B    mov         ebx,eax
 004CEB8D    mov         edx,eax
 004CEB8F    mov         eax,dword ptr [ebx+284]
 004CEB95    call        dword ptr [ebx+280]
 004CEB9B    pop         ebx
 004CEB9C    ret
*}
end;

//004CEBA0
procedure TTabSheet.DoShow;
begin
{*
 004CEBA0    push        ebx
 004CEBA1    cmp         word ptr [eax+28A],0
>004CEBA9    je          004CEBBB
 004CEBAB    mov         ebx,eax
 004CEBAD    mov         edx,eax
 004CEBAF    mov         eax,dword ptr [ebx+28C]
 004CEBB5    call        dword ptr [ebx+288]
 004CEBBB    pop         ebx
 004CEBBC    ret
*}
end;

//004CEBC0
function TTabSheet.GetPageIndex:Integer;
begin
{*
 004CEBC0    mov         edx,dword ptr [eax+274]
 004CEBC6    test        edx,edx
>004CEBC8    je          004CEBD7
 004CEBCA    mov         edx,dword ptr [edx+2D0]
 004CEBD0    xchg        eax,edx
 004CEBD1    call        TList.IndexOf
 004CEBD6    ret
 004CEBD7    or          eax,0FFFFFFFF
 004CEBDA    ret
*}
end;

//004CEBDC
function TTabSheet.GetTabIndex:Integer;
begin
{*
 004CEBDC    push        ebx
 004CEBDD    push        esi
 004CEBDE    push        edi
 004CEBDF    push        ebp
 004CEBE0    mov         esi,eax
 004CEBE2    xor         ebp,ebp
 004CEBE4    cmp         byte ptr [esi+279],0
>004CEBEB    jne         004CEBF0
 004CEBED    dec         ebp
>004CEBEE    jmp         004CEC22
 004CEBF0    mov         eax,esi
 004CEBF2    call        TTabSheet.GetPageIndex
 004CEBF7    mov         ebx,eax
 004CEBF9    dec         ebx
 004CEBFA    test        ebx,ebx
>004CEBFC    jl          004CEC22
 004CEBFE    inc         ebx
 004CEBFF    xor         edi,edi
 004CEC01    mov         eax,dword ptr [esi+274]
 004CEC07    mov         eax,dword ptr [eax+2D0]
 004CEC0D    mov         edx,edi
 004CEC0F    call        TList.Get
 004CEC14    cmp         byte ptr [eax+279],0
>004CEC1B    je          004CEC1E
 004CEC1D    inc         ebp
 004CEC1E    inc         edi
 004CEC1F    dec         ebx
>004CEC20    jne         004CEC01
 004CEC22    mov         eax,ebp
 004CEC24    pop         ebp
 004CEC25    pop         edi
 004CEC26    pop         esi
 004CEC27    pop         ebx
 004CEC28    ret
*}
end;

//004CEC2C
procedure TTabSheet.CreateParams(var Params:TCreateParams);
begin
{*
 004CEC2C    push        ebx
 004CEC2D    mov         ebx,edx
 004CEC2F    mov         edx,ebx
 004CEC31    call        TWinControl.CreateParams
 004CEC36    call        ThemeServices
 004CEC3B    cmp         byte ptr [eax+5],0
>004CEC3F    jne         004CEC45
 004CEC41    and         dword ptr [ebx+24],0FFFFFFFC
 004CEC45    pop         ebx
 004CEC46    ret
*}
end;

//004CEC48
procedure TTabSheet.ReadState(Reader:TReader);
begin
{*
 004CEC48    push        ebx
 004CEC49    push        esi
 004CEC4A    push        edi
 004CEC4B    mov         esi,edx
 004CEC4D    mov         ebx,eax
 004CEC4F    mov         edx,esi
 004CEC51    mov         eax,ebx
 004CEC53    call        TWinControl.ReadState
 004CEC58    mov         edi,dword ptr [esi+2C]
 004CEC5B    mov         eax,edi
 004CEC5D    mov         edx,dword ptr ds:[4CAA88];TPageControl
 004CEC63    call        @IsClass
 004CEC68    test        al,al
>004CEC6A    je          004CEC75
 004CEC6C    mov         edx,edi
 004CEC6E    mov         eax,ebx
 004CEC70    call        TTabSheet.SetPageControl
 004CEC75    pop         edi
 004CEC76    pop         esi
 004CEC77    pop         ebx
 004CEC78    ret
*}
end;

//004CEC7C
procedure TTabSheet.SetImageIndex(Value:TImageIndex);
begin
{*
 004CEC7C    cmp         edx,dword ptr [eax+270]
>004CEC82    je          004CECA0
 004CEC84    mov         dword ptr [eax+270],edx
 004CEC8A    cmp         byte ptr [eax+279],0
>004CEC91    je          004CECA0
 004CEC93    mov         edx,eax
 004CEC95    mov         eax,dword ptr [eax+274]
 004CEC9B    call        TPageControl.UpdateTab
 004CECA0    ret
*}
end;

//004CECA4
procedure TTabSheet.SetPageControl(APageControl:TPageControl);
begin
{*
 004CECA4    push        ebx
 004CECA5    push        esi
 004CECA6    mov         esi,edx
 004CECA8    mov         ebx,eax
 004CECAA    mov         eax,dword ptr [ebx+274]
 004CECB0    cmp         esi,eax
>004CECB2    je          004CECD5
 004CECB4    test        eax,eax
>004CECB6    je          004CECBF
 004CECB8    mov         edx,ebx
 004CECBA    call        TPageControl.RemovePage
 004CECBF    mov         edx,esi
 004CECC1    mov         eax,ebx
 004CECC3    mov         ecx,dword ptr [eax]
 004CECC5    call        dword ptr [ecx+78]
 004CECC8    test        esi,esi
>004CECCA    je          004CECD5
 004CECCC    mov         edx,ebx
 004CECCE    mov         eax,esi
 004CECD0    call        TPageControl.InsertPage
 004CECD5    pop         esi
 004CECD6    pop         ebx
 004CECD7    ret
*}
end;

//004CECD8
procedure TTabSheet.SetPageIndex(Value:Integer);
begin
{*
 004CECD8    push        ebx
 004CECD9    push        esi
 004CECDA    push        edi
 004CECDB    add         esp,0FFFFFFF0
 004CECDE    mov         esi,edx
 004CECE0    mov         ebx,eax
 004CECE2    mov         eax,dword ptr [ebx+274]
 004CECE8    test        eax,eax
>004CECEA    je          004CED64
 004CECEC    mov         eax,dword ptr [eax+2D0]
 004CECF2    mov         edi,dword ptr [eax+8]
 004CECF5    dec         edi
 004CECF6    cmp         edi,esi
>004CECF8    jge         004CED25
 004CECFA    mov         dword ptr [esp],esi
 004CECFD    mov         byte ptr [esp+4],0
 004CED02    mov         dword ptr [esp+8],edi
 004CED06    mov         byte ptr [esp+0C],0
 004CED0B    push        esp
 004CED0C    push        1
 004CED0E    mov         ecx,dword ptr ds:[78CE0C];^SResString314:TResStringRec
 004CED14    mov         dl,1
 004CED16    mov         eax,[00438EC0];EListError
 004CED1B    call        Exception.CreateResFmt
 004CED20    call        @RaiseExcept
 004CED25    mov         eax,ebx
 004CED27    call        TTabSheet.GetTabIndex
 004CED2C    mov         edi,eax
 004CED2E    mov         eax,ebx
 004CED30    call        TTabSheet.GetPageIndex
 004CED35    mov         edx,eax
 004CED37    mov         eax,dword ptr [ebx+274]
 004CED3D    mov         eax,dword ptr [eax+2D0]
 004CED43    mov         ecx,esi
 004CED45    call        TList.Move
 004CED4A    test        edi,edi
>004CED4C    jl          004CED64
 004CED4E    mov         eax,ebx
 004CED50    call        TTabSheet.GetTabIndex
 004CED55    mov         ecx,eax
 004CED57    mov         edx,edi
 004CED59    mov         eax,dword ptr [ebx+274]
 004CED5F    call        TPageControl.MoveTab
 004CED64    add         esp,10
 004CED67    pop         edi
 004CED68    pop         esi
 004CED69    pop         ebx
 004CED6A    ret
*}
end;

//004CED6C
procedure TTabSheet.SetTabShowing(Value:Boolean);
begin
{*
 004CED6C    push        ebx
 004CED6D    mov         ebx,eax
 004CED6F    cmp         dl,byte ptr [ebx+279]
>004CED75    je          004CEDAE
 004CED77    test        dl,dl
>004CED79    je          004CED91
 004CED7B    mov         byte ptr [ebx+279],1
 004CED82    mov         edx,ebx
 004CED84    mov         eax,dword ptr [ebx+274]
 004CED8A    call        TPageControl.InsertTab
>004CED8F    jmp         004CEDAE
 004CED91    mov         eax,ebx
 004CED93    call        TTabSheet.GetTabIndex
 004CED98    mov         byte ptr [ebx+279],0
 004CED9F    mov         ecx,eax
 004CEDA1    mov         edx,ebx
 004CEDA3    mov         eax,dword ptr [ebx+274]
 004CEDA9    call        TPageControl.DeleteTab
 004CEDAE    pop         ebx
 004CEDAF    ret
*}
end;

//004CEDB0
procedure TTabSheet.SetTabVisible(Value:Boolean);
begin
{*
 004CEDB0    cmp         dl,byte ptr [eax+278]
>004CEDB6    je          004CEDC3
 004CEDB8    mov         byte ptr [eax+278],dl
 004CEDBE    call        TTabSheet.UpdateTabShowing
 004CEDC3    ret
*}
end;

//004CEDC4
procedure TTabSheet.UpdateControlOriginalParentSize(AControl:TControl; var AOriginalParentSize:TPoint);
begin
{*
 004CEDC4    push        ebx
 004CEDC5    push        esi
 004CEDC6    mov         esi,ecx
 004CEDC8    mov         ebx,eax
 004CEDCA    mov         ecx,esi
 004CEDCC    mov         eax,ebx
 004CEDCE    call        TWinControl.UpdateControlOriginalParentSize
 004CEDD3    test        byte ptr [ebx+1C],2
>004CEDD7    jne         004CEDEE
 004CEDD9    mov         eax,ebx
 004CEDDB    call        TWinControl.HandleAllocated
 004CEDE0    test        al,al
>004CEDE2    jne         004CEDEE
 004CEDE4    mov         eax,dword ptr [ebx+1B8]
 004CEDEA    add         eax,eax
 004CEDEC    sub         dword ptr [esi],eax
 004CEDEE    pop         esi
 004CEDEF    pop         ebx
 004CEDF0    ret
*}
end;

//004CEDF4
procedure TTabSheet.UpdateTabShowing;
begin
{*
 004CEDF4    cmp         dword ptr [eax+274],0
>004CEDFB    je          004CEE06
 004CEDFD    cmp         byte ptr [eax+278],0
>004CEE04    jne         004CEE0A
 004CEE06    xor         edx,edx
>004CEE08    jmp         004CEE0C
 004CEE0A    mov         dl,1
 004CEE0C    call        TTabSheet.SetTabShowing
 004CEE11    ret
*}
end;

//004CEE14
procedure TTabSheet.CMTextChanged(var Message:TMessage);
begin
{*
 004CEE14    cmp         byte ptr [eax+279],0
>004CEE1B    je          004CEE2A
 004CEE1D    mov         edx,eax
 004CEE1F    mov         eax,dword ptr [eax+274]
 004CEE25    call        TPageControl.UpdateTab
 004CEE2A    ret
*}
end;

//004CEE2C
procedure TTabSheet.CMShowingChanged(var Message:TMessage);
begin
{*
 004CEE2C    push        ebp
 004CEE2D    mov         ebp,esp
 004CEE2F    push        ecx
 004CEE30    push        ebx
 004CEE31    push        esi
 004CEE32    push        edi
 004CEE33    mov         dword ptr [ebp-4],eax
 004CEE36    mov         eax,dword ptr [ebp-4]
 004CEE39    call        TWinControl.CMShowingChanged
 004CEE3E    mov         eax,dword ptr [ebp-4]
 004CEE41    movzx       eax,byte ptr [eax+1EA]
 004CEE48    test        al,al
>004CEE4A    je          004CEE8B
 004CEE4C    xor         eax,eax
 004CEE4E    push        ebp
 004CEE4F    push        4CEE70
 004CEE54    push        dword ptr fs:[eax]
 004CEE57    mov         dword ptr fs:[eax],esp
 004CEE5A    mov         eax,dword ptr [ebp-4]
 004CEE5D    mov         si,0FFAE
 004CEE61    call        @CallDynaInst
 004CEE66    xor         eax,eax
 004CEE68    pop         edx
 004CEE69    pop         ecx
 004CEE6A    pop         ecx
 004CEE6B    mov         dword ptr fs:[eax],edx
>004CEE6E    jmp         004CEECC
>004CEE70    jmp         @HandleAnyException
 004CEE75    mov         eax,[0078D590];^Application:TApplication
 004CEE7A    mov         eax,dword ptr [eax]
 004CEE7C    mov         edx,dword ptr [ebp-4]
 004CEE7F    call        TApplication.HandleException
 004CEE84    call        @DoneExcept
>004CEE89    jmp         004CEECC
 004CEE8B    test        al,al
>004CEE8D    jne         004CEECC
 004CEE8F    xor         eax,eax
 004CEE91    push        ebp
 004CEE92    push        4CEEB3
 004CEE97    push        dword ptr fs:[eax]
 004CEE9A    mov         dword ptr fs:[eax],esp
 004CEE9D    mov         eax,dword ptr [ebp-4]
 004CEEA0    mov         si,0FFAF
 004CEEA4    call        @CallDynaInst
 004CEEA9    xor         eax,eax
 004CEEAB    pop         edx
 004CEEAC    pop         ecx
 004CEEAD    pop         ecx
 004CEEAE    mov         dword ptr fs:[eax],edx
>004CEEB1    jmp         004CEECC
>004CEEB3    jmp         @HandleAnyException
 004CEEB8    mov         eax,[0078D590];^Application:TApplication
 004CEEBD    mov         eax,dword ptr [eax]
 004CEEBF    mov         edx,dword ptr [ebp-4]
 004CEEC2    call        TApplication.HandleException
 004CEEC7    call        @DoneExcept
 004CEECC    pop         edi
 004CEECD    pop         esi
 004CEECE    pop         ebx
 004CEECF    pop         ecx
 004CEED0    pop         ebp
 004CEED1    ret
*}
end;

//004CEED4
procedure TTabSheet.SetHighlighted(Value:Boolean);
begin
{*
 004CEED4    push        ebp
 004CEED5    mov         ebp,esp
 004CEED7    push        0
 004CEED9    push        ebx
 004CEEDA    push        esi
 004CEEDB    push        edi
 004CEEDC    mov         ebx,edx
 004CEEDE    mov         esi,eax
 004CEEE0    xor         eax,eax
 004CEEE2    push        ebp
 004CEEE3    push        4CEF61
 004CEEE8    push        dword ptr fs:[eax]
 004CEEEB    mov         dword ptr fs:[eax],esp
 004CEEEE    test        byte ptr [esi+1C],2
>004CEEF2    jne         004CEF45
 004CEEF4    mov         edi,dword ptr [esi+274]
 004CEEFA    test        edi,edi
>004CEEFC    je          004CEF24
 004CEEFE    movzx       eax,bl
 004CEF01    movzx       eax,ax
 004CEF04    or          eax,0
 004CEF07    push        eax
 004CEF08    mov         eax,esi
 004CEF0A    call        TTabSheet.GetTabIndex
 004CEF0F    push        eax
 004CEF10    push        1333
 004CEF15    mov         eax,edi
 004CEF17    call        TWinControl.GetHandle
 004CEF1C    push        eax
 004CEF1D    call        user32.SendMessageW
>004CEF22    jmp         004CEF45
 004CEF24    lea         edx,[ebp-4]
 004CEF27    mov         eax,[0078D960];^SResString301:TResStringRec
 004CEF2C    call        LoadResString
 004CEF31    mov         ecx,dword ptr [ebp-4]
 004CEF34    mov         dl,1
 004CEF36    mov         eax,[00439268];EInvalidOperation
 004CEF3B    call        Exception.Create
 004CEF40    call        @RaiseExcept
 004CEF45    mov         byte ptr [esi+27A],bl
 004CEF4B    xor         eax,eax
 004CEF4D    pop         edx
 004CEF4E    pop         ecx
 004CEF4F    pop         ecx
 004CEF50    mov         dword ptr fs:[eax],edx
 004CEF53    push        4CEF68
 004CEF58    lea         eax,[ebp-4]
 004CEF5B    call        @UStrClr
 004CEF60    ret
>004CEF61    jmp         @HandleFinally
>004CEF66    jmp         004CEF58
 004CEF68    pop         edi
 004CEF69    pop         esi
 004CEF6A    pop         ebx
 004CEF6B    pop         ecx
 004CEF6C    pop         ebp
 004CEF6D    ret
*}
end;

//004CEF70
procedure TTabSheet.WMNCPaint(var Message:TWMNCPaint);
begin
{*
 004CEF70    push        ebp
 004CEF71    mov         ebp,esp
 004CEF73    add         esp,0FFFFFFD8
 004CEF76    push        ebx
 004CEF77    mov         dword ptr [ebp-8],edx
 004CEF7A    mov         dword ptr [ebp-4],eax
 004CEF7D    call        ThemeServices
 004CEF82    mov         ebx,eax
 004CEF84    mov         eax,ebx
 004CEF86    call        TThemeServices.GetThemesEnabled
 004CEF8B    test        al,al
>004CEF8D    je          004CF077
 004CEF93    mov         eax,dword ptr [ebp-4]
 004CEF96    cmp         dword ptr [eax+1B8],0
>004CEF9D    jbe         004CF077
 004CEFA3    mov         eax,dword ptr [ebp-4]
 004CEFA6    call        TWinControl.GetHandle
 004CEFAB    push        eax
 004CEFAC    call        user32.GetWindowDC
 004CEFB1    mov         dword ptr [ebp-0C],eax
 004CEFB4    xor         edx,edx
 004CEFB6    push        ebp
 004CEFB7    push        4CF066
 004CEFBC    push        dword ptr fs:[edx]
 004CEFBF    mov         dword ptr fs:[edx],esp
 004CEFC2    lea         edx,[ebp-1C]
 004CEFC5    mov         eax,dword ptr [ebp-4]
 004CEFC8    mov         ecx,dword ptr [eax]
 004CEFCA    call        dword ptr [ecx+54]
 004CEFCD    mov         eax,dword ptr [ebp-4]
 004CEFD0    mov         eax,dword ptr [eax+1B8]
 004CEFD6    mov         ecx,eax
 004CEFD8    mov         edx,eax
 004CEFDA    lea         eax,[ebp-1C]
 004CEFDD    call        OffsetRect
 004CEFE2    mov         eax,dword ptr [ebp-10]
 004CEFE5    push        eax
 004CEFE6    mov         eax,dword ptr [ebp-14]
 004CEFE9    push        eax
 004CEFEA    mov         eax,dword ptr [ebp-18]
 004CEFED    push        eax
 004CEFEE    mov         eax,dword ptr [ebp-1C]
 004CEFF1    push        eax
 004CEFF2    mov         eax,dword ptr [ebp-0C]
 004CEFF5    push        eax
 004CEFF6    call        gdi32.ExcludeClipRect
 004CEFFB    push        0
 004CEFFD    mov         eax,dword ptr [ebp-4]
 004CF000    mov         eax,dword ptr [eax+1B8]
 004CF006    neg         eax
 004CF008    push        eax
 004CF009    mov         edx,dword ptr [ebp-4]
 004CF00C    mov         edx,dword ptr [edx+1B8]
 004CF012    neg         edx
 004CF014    push        eax
 004CF015    mov         eax,dword ptr [ebp-0C]
 004CF018    push        eax
 004CF019    call        gdi32.SetWindowOrgEx
 004CF01E    lea         ecx,[ebp-28]
 004CF021    mov         dl,2B
 004CF023    mov         eax,ebx
 004CF025    call        TThemeServices.GetElementDetails
 004CF02A    lea         eax,[ebp-28]
 004CF02D    push        eax
 004CF02E    push        0
 004CF030    push        0
 004CF032    mov         eax,dword ptr [ebp-4]
 004CF035    call        TWinControl.GetHandle
 004CF03A    mov         edx,eax
 004CF03C    mov         ecx,dword ptr [ebp-0C]
 004CF03F    mov         eax,ebx
 004CF041    call        TThemeServices.DrawParentBackground
 004CF046    xor         eax,eax
 004CF048    pop         edx
 004CF049    pop         ecx
 004CF04A    pop         ecx
 004CF04B    mov         dword ptr fs:[eax],edx
 004CF04E    push        4CF06D
 004CF053    mov         eax,dword ptr [ebp-0C]
 004CF056    push        eax
 004CF057    mov         eax,dword ptr [ebp-4]
 004CF05A    call        TWinControl.GetHandle
 004CF05F    push        eax
 004CF060    call        user32.ReleaseDC
 004CF065    ret
>004CF066    jmp         @HandleFinally
>004CF06B    jmp         004CF053
 004CF06D    mov         eax,dword ptr [ebp-8]
 004CF070    xor         edx,edx
 004CF072    mov         dword ptr [eax+0C],edx
>004CF075    jmp         004CF082
 004CF077    mov         edx,dword ptr [ebp-8]
 004CF07A    mov         eax,dword ptr [ebp-4]
 004CF07D    call        TWinControl.WMNCPaint
 004CF082    pop         ebx
 004CF083    mov         esp,ebp
 004CF085    pop         ebp
 004CF086    ret
*}
end;

//004CF088
procedure TTabSheet.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 004CF088    push        ebx
 004CF089    push        esi
 004CF08A    push        edi
 004CF08B    add         esp,0FFFFFFD4
 004CF08E    mov         edi,edx
 004CF090    mov         ebx,eax
 004CF092    mov         esi,dword ptr [ebx+274]
 004CF098    test        esi,esi
>004CF09A    je          004CF142
 004CF0A0    cmp         byte ptr [esi+28D],0
>004CF0A7    jne         004CF142
 004CF0AD    call        ThemeServices
 004CF0B2    call        TThemeServices.GetThemesEnabled
 004CF0B7    test        al,al
>004CF0B9    je          004CF142
 004CF0BF    lea         eax,[esp+8]
 004CF0C3    push        eax
 004CF0C4    mov         eax,ebx
 004CF0C6    call        TWinControl.GetHandle
 004CF0CB    push        eax
 004CF0CC    call        user32.GetWindowRect
 004CF0D1    mov         ecx,dword ptr [esp+0C]
 004CF0D5    neg         ecx
 004CF0D7    mov         edx,dword ptr [esp+8]
 004CF0DB    neg         edx
 004CF0DD    lea         eax,[esp+8]
 004CF0E1    call        OffsetRect
 004CF0E6    xor         eax,eax
 004CF0E8    mov         dword ptr [esp],eax
 004CF0EB    xor         eax,eax
 004CF0ED    mov         dword ptr [esp+4],eax
 004CF0F1    lea         eax,[esp+24]
 004CF0F5    push        eax
 004CF0F6    lea         edx,[esp+4]
 004CF0FA    xor         ecx,ecx
 004CF0FC    mov         eax,ebx
 004CF0FE    call        TControl.ClientToParent
 004CF103    mov         eax,dword ptr [esp+24]
 004CF107    push        eax
 004CF108    push        eax
 004CF109    lea         eax,[esp+10]
 004CF10D    push        eax
 004CF10E    call        user32.InflateRect
 004CF113    call        ThemeServices
 004CF118    lea         ecx,[esp+18]
 004CF11C    mov         dl,2A
 004CF11E    call        TThemeServices.GetElementDetails
 004CF123    lea         eax,[esp+8]
 004CF127    push        eax
 004CF128    call        ThemeServices
 004CF12D    mov         edx,dword ptr [edi+4]
 004CF130    lea         ecx,[esp+1C]
 004CF134    call        TThemeServices.DrawElement
 004CF139    mov         dword ptr [edi+0C],1
>004CF140    jmp         004CF14B
 004CF142    mov         edx,edi
 004CF144    mov         eax,ebx
 004CF146    call        TWinControl.WMEraseBkgnd
 004CF14B    add         esp,2C
 004CF14E    pop         edi
 004CF14F    pop         esi
 004CF150    pop         ebx
 004CF151    ret
*}
end;

//004CF154
constructor TPageControl.Create;
begin
{*
 004CF154    push        ebx
 004CF155    push        esi
 004CF156    test        dl,dl
>004CF158    je          004CF162
 004CF15A    add         esp,0FFFFFFF0
 004CF15D    call        @ClassCreate
 004CF162    mov         ebx,edx
 004CF164    mov         esi,eax
 004CF166    xor         edx,edx
 004CF168    mov         eax,esi
 004CF16A    call        TCustomTabControl.Create
 004CF16F    mov         eax,[004CF1A4]
 004CF174    mov         dword ptr [esi+50],eax
 004CF177    mov         dl,1
 004CF179    mov         eax,[00439644];TList
 004CF17E    call        TObject.Create
 004CF183    mov         dword ptr [esi+2D0],eax
 004CF189    mov         eax,esi
 004CF18B    test        bl,bl
>004CF18D    je          004CF19E
 004CF18F    call        @AfterConstruction
 004CF194    pop         dword ptr fs:[0]
 004CF19B    add         esp,0C
 004CF19E    mov         eax,esi
 004CF1A0    pop         esi
 004CF1A1    pop         ebx
 004CF1A2    ret
*}
end;

//004CF1A8
destructor TPageControl.Destroy();
begin
{*
 004CF1A8    push        ebx
 004CF1A9    push        esi
 004CF1AA    push        edi
 004CF1AB    push        ebp
 004CF1AC    call        @BeforeDestruction
 004CF1B1    mov         ebx,edx
 004CF1B3    mov         esi,eax
 004CF1B5    mov         eax,dword ptr [esi+2D0]
 004CF1BB    mov         ebp,dword ptr [eax+8]
 004CF1BE    dec         ebp
 004CF1BF    test        ebp,ebp
>004CF1C1    jl          004CF1DF
 004CF1C3    inc         ebp
 004CF1C4    xor         edi,edi
 004CF1C6    mov         eax,dword ptr [esi+2D0]
 004CF1CC    mov         edx,edi
 004CF1CE    call        TList.Get
 004CF1D3    xor         edx,edx
 004CF1D5    mov         dword ptr [eax+274],edx
 004CF1DB    inc         edi
 004CF1DC    dec         ebp
>004CF1DD    jne         004CF1C6
 004CF1DF    mov         eax,dword ptr [esi+2D0]
 004CF1E5    call        TObject.Free
 004CF1EA    mov         edx,ebx
 004CF1EC    and         dl,0FC
 004CF1EF    mov         eax,esi
 004CF1F1    call        TCustomTabControl.Destroy
 004CF1F6    test        bl,bl
>004CF1F8    jle         004CF201
 004CF1FA    mov         eax,esi
 004CF1FC    call        @ClassDestroy
 004CF201    pop         ebp
 004CF202    pop         edi
 004CF203    pop         esi
 004CF204    pop         ebx
 004CF205    ret
*}
end;

//004CF208
procedure TPageControl.UpdateTabHighlights;
begin
{*
 004CF208    push        ebx
 004CF209    push        esi
 004CF20A    push        edi
 004CF20B    mov         esi,eax
 004CF20D    mov         eax,esi
 004CF20F    call        TPageControl.GetPageCount
 004CF214    mov         edi,eax
 004CF216    dec         edi
 004CF217    test        edi,edi
>004CF219    jl          004CF242
 004CF21B    inc         edi
 004CF21C    xor         ebx,ebx
 004CF21E    mov         edx,ebx
 004CF220    mov         eax,esi
 004CF222    call        TPageControl.GetPage
 004CF227    movzx       eax,byte ptr [eax+27A]
 004CF22E    push        eax
 004CF22F    mov         edx,ebx
 004CF231    mov         eax,esi
 004CF233    call        TPageControl.GetPage
 004CF238    pop         edx
 004CF239    call        TTabSheet.SetHighlighted
 004CF23E    inc         ebx
 004CF23F    dec         edi
>004CF240    jne         004CF21E
 004CF242    pop         edi
 004CF243    pop         esi
 004CF244    pop         ebx
 004CF245    ret
*}
end;

//004CF248
procedure TPageControl.Loaded;
begin
{*
 004CF248    push        ebx
 004CF249    mov         ebx,eax
 004CF24B    mov         eax,ebx
 004CF24D    call        TCustomTabControl.Loaded
 004CF252    mov         eax,ebx
 004CF254    call        TPageControl.UpdateTabHighlights
 004CF259    pop         ebx
 004CF25A    ret
*}
end;

//004CF25C
function TPageControl.CanShowTab(TabIndex:Integer):Boolean;
begin
{*
 004CF25C    push        ebx
 004CF25D    push        esi
 004CF25E    mov         esi,edx
 004CF260    mov         ebx,eax
 004CF262    mov         edx,esi
 004CF264    mov         eax,ebx
 004CF266    call        TPageControl.PageIndexFromTabIndex
 004CF26B    mov         edx,eax
 004CF26D    mov         eax,dword ptr [ebx+2D0]
 004CF273    call        TList.Get
 004CF278    mov         edx,dword ptr [eax]
 004CF27A    call        dword ptr [edx+5C]
 004CF27D    pop         esi
 004CF27E    pop         ebx
 004CF27F    ret
*}
end;

//004CF280
procedure TPageControl.DoClose;
begin
{*
 004CF280    push        ebx
 004CF281    mov         ebx,eax
 004CF283    mov         eax,ebx
 004CF285    call        TCustomTabControl.GetTabIndex
 004CF28A    test        eax,eax
>004CF28C    jl          004CF298
 004CF28E    mov         eax,ebx
 004CF290    mov         edx,dword ptr [eax]
 004CF292    call        dword ptr [edx+0FC];TPageControl.UpdateActivePage
 004CF298    test        byte ptr [ebx+1C],10;TPageControl.FComponentState:TComponentState
>004CF29C    je          004CF2BF
 004CF29E    mov         dl,1
 004CF2A0    mov         eax,ebx
 004CF2A2    call        GetParentForm
 004CF2A7    test        eax,eax
>004CF2A9    je          004CF2BF
 004CF2AB    cmp         dword ptr [eax+2BC],0;TCustomForm.FDesigner:IDesignerHook
>004CF2B2    je          004CF2BF
 004CF2B4    mov         eax,dword ptr [eax+2BC];TCustomForm.FDesigner:IDesignerHook
 004CF2BA    mov         edx,dword ptr [eax]
 004CF2BC    call        dword ptr [edx+0C]
 004CF2BF    mov         eax,ebx
 004CF2C1    call        TAnimate.DoClose
 004CF2C6    pop         ebx
 004CF2C7    ret
*}
end;

//004CF2C8
procedure TPageControl.ChangeActivePage(Page:TTabSheet);
begin
{*
 004CF2C8    push        ebx
 004CF2C9    push        esi
 004CF2CA    push        edi
 004CF2CB    push        ebp
 004CF2CC    mov         ebp,edx
 004CF2CE    mov         ebx,eax
 004CF2D0    cmp         ebp,dword ptr [ebx+2D4]
>004CF2D6    je          004CF3CB
 004CF2DC    mov         dl,1
 004CF2DE    mov         eax,ebx
 004CF2E0    call        GetParentForm
 004CF2E5    mov         edi,eax
 004CF2E7    test        edi,edi
>004CF2E9    je          004CF33C
 004CF2EB    cmp         dword ptr [ebx+2D4],0
>004CF2F2    je          004CF33C
 004CF2F4    mov         edx,dword ptr [edi+290]
 004CF2FA    mov         eax,dword ptr [ebx+2D4]
 004CF300    call        TWinControl.ContainsControl
 004CF305    test        al,al
>004CF307    je          004CF33C
 004CF309    mov         edx,dword ptr [ebx+2D4]
 004CF30F    mov         eax,edi
 004CF311    call        TCustomForm.SetActiveControl
 004CF316    mov         esi,dword ptr [ebx+2D4]
 004CF31C    cmp         esi,dword ptr [edi+290]
>004CF322    je          004CF33C
 004CF324    mov         eax,esi
 004CF326    call        TTabSheet.GetTabIndex
 004CF32B    mov         edx,eax
 004CF32D    mov         eax,ebx
 004CF32F    mov         ecx,dword ptr [eax]
 004CF331    call        dword ptr [ecx+0F8]
>004CF337    jmp         004CF3CB
 004CF33C    test        ebp,ebp
>004CF33E    je          004CF38E
 004CF340    mov         eax,ebp
 004CF342    call        TControl.BringToFront
 004CF347    mov         dl,1
 004CF349    mov         eax,ebp
 004CF34B    call        TControl.SetVisible
 004CF350    test        edi,edi
>004CF352    je          004CF38E
 004CF354    cmp         dword ptr [ebx+2D4],0
>004CF35B    je          004CF38E
 004CF35D    mov         eax,dword ptr [edi+290]
 004CF363    cmp         eax,dword ptr [ebx+2D4]
>004CF369    jne         004CF38E
 004CF36B    mov         eax,ebp
 004CF36D    mov         si,0FFB6
 004CF371    call        @CallDynaInst
 004CF376    test        al,al
>004CF378    je          004CF385
 004CF37A    mov         edx,ebp
 004CF37C    mov         eax,edi
 004CF37E    call        TCustomForm.SetActiveControl
>004CF383    jmp         004CF38E
 004CF385    mov         edx,ebx
 004CF387    mov         eax,edi
 004CF389    call        TCustomForm.SetActiveControl
 004CF38E    mov         eax,dword ptr [ebx+2D4]
 004CF394    test        eax,eax
>004CF396    je          004CF39F
 004CF398    xor         edx,edx
 004CF39A    call        TControl.SetVisible
 004CF39F    mov         dword ptr [ebx+2D4],ebp
 004CF3A5    test        edi,edi
>004CF3A7    je          004CF3CB
 004CF3A9    cmp         dword ptr [ebx+2D4],0
>004CF3B0    je          004CF3CB
 004CF3B2    mov         eax,dword ptr [edi+290]
 004CF3B8    cmp         eax,dword ptr [ebx+2D4]
>004CF3BE    jne         004CF3CB
 004CF3C0    mov         eax,dword ptr [ebx+2D4]
 004CF3C6    call        TWinControl.SelectFirst
 004CF3CB    pop         ebp
 004CF3CC    pop         edi
 004CF3CD    pop         esi
 004CF3CE    pop         ebx
 004CF3CF    ret
*}
end;

//004CF3D0
procedure TPageControl.DeleteTab(Page:TTabSheet; Index:Integer);
begin
{*
 004CF3D0    push        ebx
 004CF3D1    push        esi
 004CF3D2    push        edi
 004CF3D3    mov         edi,ecx
 004CF3D5    mov         esi,eax
 004CF3D7    cmp         edx,dword ptr [esi+2D4]
 004CF3DD    sete        bl
 004CF3E0    mov         eax,esi
 004CF3E2    call        TCustomTabControl.GetTabs
 004CF3E7    mov         edx,edi
 004CF3E9    mov         ecx,dword ptr [eax]
 004CF3EB    call        dword ptr [ecx+48]
 004CF3EE    test        bl,bl
>004CF3F0    je          004CF41D
 004CF3F2    mov         eax,esi
 004CF3F4    call        TCustomTabControl.GetTabs
 004CF3F9    mov         edx,dword ptr [eax]
 004CF3FB    call        dword ptr [edx+14]
 004CF3FE    cmp         edi,eax
>004CF400    jl          004CF411
 004CF402    mov         eax,esi
 004CF404    call        TCustomTabControl.GetTabs
 004CF409    mov         edx,dword ptr [eax]
 004CF40B    call        dword ptr [edx+14]
 004CF40E    mov         edi,eax
 004CF410    dec         edi
 004CF411    mov         edx,edi
 004CF413    mov         eax,esi
 004CF415    mov         ecx,dword ptr [eax]
 004CF417    call        dword ptr [ecx+0F8]
 004CF41D    mov         eax,esi
 004CF41F    mov         edx,dword ptr [eax]
 004CF421    call        dword ptr [edx+0FC]
 004CF427    pop         edi
 004CF428    pop         esi
 004CF429    pop         ebx
 004CF42A    ret
*}
end;

//004CF42C
procedure TPageControl.DoAddDockClient(Client:TControl; const ARect:TRect);
begin
{*
 004CF42C    mov         ecx,dword ptr [eax+2D8]
 004CF432    test        ecx,ecx
>004CF434    je          004CF43E
 004CF436    mov         eax,ecx
 004CF438    xchg        eax,edx
 004CF439    mov         ecx,dword ptr [eax]
 004CF43B    call        dword ptr [ecx+78]
 004CF43E    ret
*}
end;

//004CF440
procedure TPageControl.DockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);
begin
{*
 004CF440    push        ebp
 004CF441    mov         ebp,esp
 004CF443    add         esp,0FFFFFFF0
 004CF446    push        ebx
 004CF447    push        esi
 004CF448    push        edi
 004CF449    mov         edi,ecx
 004CF44B    mov         esi,edx
 004CF44D    mov         ebx,eax
 004CF44F    lea         eax,[ebp-10]
 004CF452    push        eax
 004CF453    mov         eax,ebx
 004CF455    call        TWinControl.GetHandle
 004CF45A    push        eax
 004CF45B    call        user32.GetWindowRect
 004CF460    push        esi
 004CF461    push        edi
 004CF462    lea         edi,[esi+4C]
 004CF465    lea         esi,[ebp-10]
 004CF468    movs        dword ptr [edi],dword ptr [esi]
 004CF469    movs        dword ptr [edi],dword ptr [esi]
 004CF46A    movs        dword ptr [edi],dword ptr [esi]
 004CF46B    movs        dword ptr [edi],dword ptr [esi]
 004CF46C    pop         edi
 004CF46D    pop         esi
 004CF46E    mov         eax,dword ptr [ebp+10]
 004CF471    push        eax
 004CF472    movzx       eax,byte ptr [ebp+0C]
 004CF476    push        eax
 004CF477    mov         eax,dword ptr [ebp+8]
 004CF47A    push        eax
 004CF47B    mov         ecx,edi
 004CF47D    mov         edx,esi
 004CF47F    mov         eax,ebx
 004CF481    mov         si,0FFC2
 004CF485    call        @CallDynaInst
 004CF48A    pop         edi
 004CF48B    pop         esi
 004CF48C    pop         ebx
 004CF48D    mov         esp,ebp
 004CF48F    pop         ebp
 004CF490    ret         0C
*}
end;

//004CF494
procedure TPageControl.DoRemoveDockClient(Client:TControl);
begin
{*
 004CF494    push        ebx
 004CF495    mov         ebx,eax
 004CF497    cmp         dword ptr [ebx+2DC],0
>004CF49E    je          004CF4C4
 004CF4A0    test        byte ptr [ebx+1C],8
>004CF4A4    jne         004CF4C4
 004CF4A6    mov         cl,1
 004CF4A8    mov         dl,1
 004CF4AA    mov         eax,ebx
 004CF4AC    call        TPageControl.SelectNextPage
 004CF4B1    mov         eax,dword ptr [ebx+2DC]
 004CF4B7    call        TObject.Free
 004CF4BC    xor         eax,eax
 004CF4BE    mov         dword ptr [ebx+2DC],eax
 004CF4C4    pop         ebx
 004CF4C5    ret
*}
end;

//004CF4C8
function TPageControl.FindNextPage(CurPage:TTabSheet; GoForward:Boolean; CheckTabVisible:Boolean):TTabSheet;
begin
{*
 004CF4C8    push        ebp
 004CF4C9    mov         ebp,esp
 004CF4CB    push        ecx
 004CF4CC    push        ebx
 004CF4CD    push        esi
 004CF4CE    push        edi
 004CF4CF    mov         byte ptr [ebp-1],cl
 004CF4D2    mov         esi,eax
 004CF4D4    mov         eax,dword ptr [esi+2D0]
 004CF4DA    cmp         dword ptr [eax+8],0
>004CF4DE    je          004CF546
 004CF4E0    call        TList.IndexOf
 004CF4E5    mov         edi,eax
 004CF4E7    cmp         edi,0FFFFFFFF
>004CF4EA    jne         004CF500
 004CF4EC    cmp         byte ptr [ebp-1],0
>004CF4F0    je          004CF4FE
 004CF4F2    mov         eax,dword ptr [esi+2D0]
 004CF4F8    mov         edi,dword ptr [eax+8]
 004CF4FB    dec         edi
>004CF4FC    jmp         004CF500
 004CF4FE    xor         edi,edi
 004CF500    mov         ebx,edi
 004CF502    cmp         byte ptr [ebp-1],0
>004CF506    je          004CF518
 004CF508    inc         ebx
 004CF509    mov         eax,dword ptr [esi+2D0]
 004CF50F    cmp         ebx,dword ptr [eax+8]
>004CF512    jne         004CF526
 004CF514    xor         ebx,ebx
>004CF516    jmp         004CF526
 004CF518    test        ebx,ebx
>004CF51A    jne         004CF525
 004CF51C    mov         eax,dword ptr [esi+2D0]
 004CF522    mov         ebx,dword ptr [eax+8]
 004CF525    dec         ebx
 004CF526    mov         edx,ebx
 004CF528    mov         eax,dword ptr [esi+2D0]
 004CF52E    call        TList.Get
 004CF533    cmp         byte ptr [ebp+8],0
>004CF537    je          004CF548
 004CF539    cmp         byte ptr [eax+278],0
>004CF540    jne         004CF548
 004CF542    cmp         edi,ebx
>004CF544    jne         004CF502
 004CF546    xor         eax,eax
 004CF548    pop         edi
 004CF549    pop         esi
 004CF54A    pop         ebx
 004CF54B    pop         ecx
 004CF54C    pop         ebp
 004CF54D    ret         4
*}
end;

//004CF550
procedure TPageControl.GetChildren(Root:TComponent; Proc:TGetChildProc);
begin
{*
 004CF550    push        ebp
 004CF551    mov         ebp,esp
 004CF553    push        ecx
 004CF554    push        ebx
 004CF555    push        esi
 004CF556    mov         dword ptr [ebp-4],eax
 004CF559    mov         eax,dword ptr [ebp-4]
 004CF55C    mov         eax,dword ptr [eax+2D0]
 004CF562    mov         ebx,dword ptr [eax+8]
 004CF565    dec         ebx
 004CF566    test        ebx,ebx
>004CF568    jl          004CF589
 004CF56A    inc         ebx
 004CF56B    xor         esi,esi
 004CF56D    mov         eax,dword ptr [ebp-4]
 004CF570    mov         eax,dword ptr [eax+2D0]
 004CF576    mov         edx,esi
 004CF578    call        TList.Get
 004CF57D    mov         edx,eax
 004CF57F    mov         eax,dword ptr [ebp+0C]
 004CF582    call        dword ptr [ebp+8]
 004CF585    inc         esi
 004CF586    dec         ebx
>004CF587    jne         004CF56D
 004CF589    pop         esi
 004CF58A    pop         ebx
 004CF58B    pop         ecx
 004CF58C    pop         ebp
 004CF58D    ret         8
*}
end;

//004CF590
function TPageControl.GetImageIndex(TabIndex:Integer):Integer;
begin
{*
 004CF590    push        ebx
 004CF591    push        esi
 004CF592    push        edi
 004CF593    push        ebp
 004CF594    add         esp,0FFFFFFF8
 004CF597    mov         dword ptr [esp],edx
 004CF59A    mov         ebx,eax
 004CF59C    cmp         word ptr [ebx+2CA],0
>004CF5A4    je          004CF5B2
 004CF5A6    mov         edx,dword ptr [esp]
 004CF5A9    mov         eax,ebx
 004CF5AB    call        TCustomTabControl.GetImageIndex
>004CF5B0    jmp         004CF604
 004CF5B2    xor         ebp,ebp
 004CF5B4    xor         eax,eax
 004CF5B6    mov         dword ptr [esp+4],eax
 004CF5BA    mov         eax,dword ptr [ebx+2D0]
 004CF5C0    mov         esi,dword ptr [eax+8]
 004CF5C3    dec         esi
 004CF5C4    test        esi,esi
>004CF5C6    jl          004CF5F0
 004CF5C8    inc         esi
 004CF5C9    xor         edi,edi
 004CF5CB    mov         edx,edi
 004CF5CD    mov         eax,ebx
 004CF5CF    call        TPageControl.GetPage
 004CF5D4    cmp         byte ptr [eax+278],0
>004CF5DB    jne         004CF5E3
 004CF5DD    inc         dword ptr [esp+4]
>004CF5E1    jmp         004CF5E4
 004CF5E3    inc         ebp
 004CF5E4    mov         eax,dword ptr [esp]
 004CF5E7    inc         eax
 004CF5E8    cmp         ebp,eax
>004CF5EA    je          004CF5F0
 004CF5EC    inc         edi
 004CF5ED    dec         esi
>004CF5EE    jne         004CF5CB
 004CF5F0    mov         edx,dword ptr [esp]
 004CF5F3    add         edx,dword ptr [esp+4]
 004CF5F7    mov         eax,ebx
 004CF5F9    call        TPageControl.GetPage
 004CF5FE    mov         eax,dword ptr [eax+270]
 004CF604    pop         ecx
 004CF605    pop         edx
 004CF606    pop         ebp
 004CF607    pop         edi
 004CF608    pop         esi
 004CF609    pop         ebx
 004CF60A    ret
*}
end;

//004CF60C
function TPageControl.GetPageFromDockClient(Client:TControl):TTabSheet;
begin
{*
 004CF60C    push        ebx
 004CF60D    push        esi
 004CF60E    push        edi
 004CF60F    push        ebp
 004CF610    push        ecx
 004CF611    mov         ebp,edx
 004CF613    mov         ebx,eax
 004CF615    xor         eax,eax
 004CF617    mov         dword ptr [esp],eax
 004CF61A    mov         eax,ebx
 004CF61C    call        TPageControl.GetPageCount
 004CF621    mov         edi,eax
 004CF623    dec         edi
 004CF624    test        edi,edi
>004CF626    jl          004CF653
 004CF628    inc         edi
 004CF629    xor         esi,esi
 004CF62B    mov         edx,esi
 004CF62D    mov         eax,ebx
 004CF62F    call        TPageControl.GetPage
 004CF634    cmp         eax,dword ptr [ebp+34]
>004CF637    jne         004CF64F
 004CF639    cmp         ebx,dword ptr [ebp+90]
>004CF63F    jne         004CF64F
 004CF641    mov         edx,esi
 004CF643    mov         eax,ebx
 004CF645    call        TPageControl.GetPage
 004CF64A    mov         dword ptr [esp],eax
>004CF64D    jmp         004CF653
 004CF64F    inc         esi
 004CF650    dec         edi
>004CF651    jne         004CF62B
 004CF653    mov         eax,dword ptr [esp]
 004CF656    pop         edx
 004CF657    pop         ebp
 004CF658    pop         edi
 004CF659    pop         esi
 004CF65A    pop         ebx
 004CF65B    ret
*}
end;

//004CF65C
function TPageControl.GetPage(Index:Integer):TTabSheet;
begin
{*
 004CF65C    push        ebx
 004CF65D    push        esi
 004CF65E    mov         esi,edx
 004CF660    mov         ebx,eax
 004CF662    mov         edx,esi
 004CF664    mov         eax,dword ptr [ebx+2D0]
 004CF66A    call        TList.Get
 004CF66F    pop         esi
 004CF670    pop         ebx
 004CF671    ret
*}
end;

//004CF674
function TPageControl.GetPageCount:Integer;
begin
{*
 004CF674    mov         eax,dword ptr [eax+2D0]
 004CF67A    mov         eax,dword ptr [eax+8]
 004CF67D    ret
*}
end;

//004CF680
procedure TPageControl.GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean);
begin
{*
 004CF680    push        ebp
 004CF681    mov         ebp,esp
 004CF683    add         esp,0FFFFFFF4
 004CF686    push        ebx
 004CF687    push        esi
 004CF688    push        edi
 004CF689    mov         esi,dword ptr [ebp+0C]
 004CF68C    lea         edi,[ebp-0C]
 004CF68F    movs        dword ptr [edi],dword ptr [esi]
 004CF690    movs        dword ptr [edi],dword ptr [esi]
 004CF691    mov         dword ptr [ebp-4],ecx
 004CF694    mov         esi,edx
 004CF696    mov         ebx,eax
 004CF698    mov         edi,dword ptr [ebp+8]
 004CF69B    mov         edx,esi
 004CF69D    mov         eax,ebx
 004CF69F    call        TPageControl.GetPageFromDockClient
 004CF6A4    test        eax,eax
 004CF6A6    sete        byte ptr [edi]
 004CF6A9    lea         eax,[ebp-0C]
 004CF6AC    push        eax
 004CF6AD    push        edi
 004CF6AE    mov         ecx,dword ptr [ebp-4]
 004CF6B1    mov         edx,esi
 004CF6B3    mov         eax,ebx
 004CF6B5    call        TWinControl.GetSiteInfo
 004CF6BA    pop         edi
 004CF6BB    pop         esi
 004CF6BC    pop         ebx
 004CF6BD    mov         esp,ebp
 004CF6BF    pop         ebp
 004CF6C0    ret         8
*}
end;

//004CF6C4
procedure TPageControl.InsertPage(Page:TTabSheet);
begin
{*
 004CF6C4    push        ebx
 004CF6C5    push        esi
 004CF6C6    mov         esi,edx
 004CF6C8    mov         ebx,eax
 004CF6CA    mov         edx,esi
 004CF6CC    mov         eax,dword ptr [ebx+2D0]
 004CF6D2    call        TList.Add
 004CF6D7    mov         dword ptr [esi+274],ebx
 004CF6DD    mov         eax,esi
 004CF6DF    call        TTabSheet.UpdateTabShowing
 004CF6E4    pop         esi
 004CF6E5    pop         ebx
 004CF6E6    ret
*}
end;

//004CF6E8
procedure TPageControl.InsertTab(Page:TTabSheet);
begin
{*
 004CF6E8    push        ebp
 004CF6E9    mov         ebp,esp
 004CF6EB    push        0
 004CF6ED    push        ebx
 004CF6EE    push        esi
 004CF6EF    mov         esi,edx
 004CF6F1    mov         ebx,eax
 004CF6F3    xor         eax,eax
 004CF6F5    push        ebp
 004CF6F6    push        4CF746
 004CF6FB    push        dword ptr fs:[eax]
 004CF6FE    mov         dword ptr fs:[eax],esp
 004CF701    push        esi
 004CF702    lea         edx,[ebp-4]
 004CF705    mov         eax,esi
 004CF707    call        TControl.GetText
 004CF70C    mov         eax,dword ptr [ebp-4]
 004CF70F    push        eax
 004CF710    mov         eax,esi
 004CF712    call        TTabSheet.GetTabIndex
 004CF717    push        eax
 004CF718    mov         eax,ebx
 004CF71A    call        TCustomTabControl.GetTabs
 004CF71F    pop         edx
 004CF720    pop         ecx
 004CF721    mov         esi,dword ptr [eax]
 004CF723    call        dword ptr [esi+64]
 004CF726    mov         eax,ebx
 004CF728    mov         edx,dword ptr [eax]
 004CF72A    call        dword ptr [edx+0FC]
 004CF730    xor         eax,eax
 004CF732    pop         edx
 004CF733    pop         ecx
 004CF734    pop         ecx
 004CF735    mov         dword ptr fs:[eax],edx
 004CF738    push        4CF74D
 004CF73D    lea         eax,[ebp-4]
 004CF740    call        @UStrClr
 004CF745    ret
>004CF746    jmp         @HandleFinally
>004CF74B    jmp         004CF73D
 004CF74D    pop         esi
 004CF74E    pop         ebx
 004CF74F    pop         ecx
 004CF750    pop         ebp
 004CF751    ret
*}
end;

//004CF754
procedure TPageControl.MoveTab(CurIndex:Integer; NewIndex:Integer);
begin
{*
 004CF754    push        ebx
 004CF755    push        esi
 004CF756    push        edi
 004CF757    mov         edi,ecx
 004CF759    mov         esi,edx
 004CF75B    mov         ebx,eax
 004CF75D    mov         eax,ebx
 004CF75F    call        TCustomTabControl.GetTabs
 004CF764    mov         ecx,edi
 004CF766    mov         edx,esi
 004CF768    mov         ebx,dword ptr [eax]
 004CF76A    call        dword ptr [ebx+78]
 004CF76D    pop         edi
 004CF76E    pop         esi
 004CF76F    pop         ebx
 004CF770    ret
*}
end;

//004CF774
procedure TPageControl.RemovePage(Page:TTabSheet);
begin
{*
 004CF774    push        ebx
 004CF775    push        esi
 004CF776    push        edi
 004CF777    mov         esi,edx
 004CF779    mov         ebx,eax
 004CF77B    test        byte ptr [ebx+1C],10
 004CF77F    setne       al
 004CF782    xor         al,1
 004CF784    push        eax
 004CF785    mov         cl,1
 004CF787    mov         edx,esi
 004CF789    mov         eax,ebx
 004CF78B    call        TPageControl.FindNextPage
 004CF790    mov         edi,eax
 004CF792    cmp         esi,edi
>004CF794    jne         004CF798
 004CF796    xor         edi,edi
 004CF798    xor         edx,edx
 004CF79A    mov         eax,esi
 004CF79C    call        TTabSheet.SetTabShowing
 004CF7A1    xor         eax,eax
 004CF7A3    mov         dword ptr [esi+274],eax
 004CF7A9    mov         edx,esi
 004CF7AB    xor         ecx,ecx
 004CF7AD    mov         eax,dword ptr [ebx+2D0]
 004CF7B3    call        TList.RemoveItem
 004CF7B8    mov         edx,edi
 004CF7BA    mov         eax,ebx
 004CF7BC    call        TPageControl.SetActivePage
 004CF7C1    pop         edi
 004CF7C2    pop         esi
 004CF7C3    pop         ebx
 004CF7C4    ret
*}
end;

//004CF7C8
procedure TPageControl.SelectNextPage(GoForward:Boolean; CheckTabVisible:Boolean);
begin
{*
 004CF7C8    push        ebx
 004CF7C9    push        esi
 004CF7CA    push        edi
 004CF7CB    mov         edi,eax
 004CF7CD    push        ecx
 004CF7CE    mov         eax,edi
 004CF7D0    mov         ecx,dword ptr [edi+2D4]
 004CF7D6    xchg        ecx,edx
 004CF7D8    call        TPageControl.FindNextPage
 004CF7DD    mov         ebx,eax
 004CF7DF    test        ebx,ebx
>004CF7E1    je          004CF80E
 004CF7E3    cmp         ebx,dword ptr [edi+2D4]
>004CF7E9    je          004CF80E
 004CF7EB    mov         eax,edi
 004CF7ED    mov         si,0FFAF
 004CF7F1    call        @CallDynaInst
 004CF7F6    test        al,al
>004CF7F8    je          004CF80E
 004CF7FA    mov         edx,ebx
 004CF7FC    mov         eax,edi
 004CF7FE    call        TPageControl.SetActivePage
 004CF803    mov         eax,edi
 004CF805    mov         si,0FFAE
 004CF809    call        @CallDynaInst
 004CF80E    pop         edi
 004CF80F    pop         esi
 004CF810    pop         ebx
 004CF811    ret
*}
end;

//004CF814
procedure TPageControl.SetActivePage(Page:TTabSheet);
begin
{*
 004CF814    push        ebp
 004CF815    mov         ebp,esp
 004CF817    push        ecx
 004CF818    push        ebx
 004CF819    mov         ebx,edx
 004CF81B    mov         dword ptr [ebp-4],eax
 004CF81E    test        ebx,ebx
>004CF820    je          004CF82D
 004CF822    mov         eax,dword ptr [ebx+274]
 004CF828    cmp         eax,dword ptr [ebp-4]
>004CF82B    jne         004CF8A1
 004CF82D    mov         eax,dword ptr [ebp-4]
 004CF830    mov         byte ptr [eax+2E0],1
 004CF837    xor         eax,eax
 004CF839    push        ebp
 004CF83A    push        4CF89A
 004CF83F    push        dword ptr fs:[eax]
 004CF842    mov         dword ptr fs:[eax],esp
 004CF845    mov         edx,ebx
 004CF847    mov         eax,dword ptr [ebp-4]
 004CF84A    call        TPageControl.ChangeActivePage
 004CF84F    test        ebx,ebx
>004CF851    jne         004CF863
 004CF853    or          edx,0FFFFFFFF
 004CF856    mov         eax,dword ptr [ebp-4]
 004CF859    mov         ecx,dword ptr [eax]
 004CF85B    call        dword ptr [ecx+0F8]
>004CF861    jmp         004CF882
 004CF863    mov         eax,dword ptr [ebp-4]
 004CF866    cmp         ebx,dword ptr [eax+2D4]
>004CF86C    jne         004CF882
 004CF86E    mov         eax,ebx
 004CF870    call        TTabSheet.GetTabIndex
 004CF875    mov         edx,eax
 004CF877    mov         eax,dword ptr [ebp-4]
 004CF87A    mov         ecx,dword ptr [eax]
 004CF87C    call        dword ptr [ecx+0F8]
 004CF882    xor         eax,eax
 004CF884    pop         edx
 004CF885    pop         ecx
 004CF886    pop         ecx
 004CF887    mov         dword ptr fs:[eax],edx
 004CF88A    push        4CF8A1
 004CF88F    mov         eax,dword ptr [ebp-4]
 004CF892    mov         byte ptr [eax+2E0],0
 004CF899    ret
>004CF89A    jmp         @HandleFinally
>004CF89F    jmp         004CF88F
 004CF8A1    pop         ebx
 004CF8A2    pop         ecx
 004CF8A3    pop         ebp
 004CF8A4    ret
*}
end;

//004CF8A8
procedure TPageControl.SetChildOrder(Child:TComponent; Order:Integer);
begin
{*
 004CF8A8    mov         eax,edx
 004CF8AA    mov         edx,ecx
 004CF8AC    call        TTabSheet.SetPageIndex
 004CF8B1    ret
*}
end;

//004CF8B4
procedure TPageControl.ShowControl(AControl:TControl);
begin
{*
 004CF8B4    push        ebx
 004CF8B5    push        esi
 004CF8B6    mov         esi,edx
 004CF8B8    mov         ebx,eax
 004CF8BA    mov         eax,esi
 004CF8BC    mov         edx,dword ptr ds:[4CA0EC];TTabSheet
 004CF8C2    call        @IsClass
 004CF8C7    test        al,al
>004CF8C9    je          004CF8DC
 004CF8CB    cmp         ebx,dword ptr [esi+274]
>004CF8D1    jne         004CF8DC
 004CF8D3    mov         edx,esi
 004CF8D5    mov         eax,ebx
 004CF8D7    call        TPageControl.SetActivePage
 004CF8DC    mov         edx,esi
 004CF8DE    mov         eax,ebx
 004CF8E0    call        TWinControl.ShowControl
 004CF8E5    pop         esi
 004CF8E6    pop         ebx
 004CF8E7    ret
*}
end;

//004CF8E8
procedure TPageControl.UpdateTab(Page:TTabSheet);
begin
{*
 004CF8E8    push        ebp
 004CF8E9    mov         ebp,esp
 004CF8EB    push        0
 004CF8ED    push        ebx
 004CF8EE    push        esi
 004CF8EF    mov         esi,edx
 004CF8F1    mov         ebx,eax
 004CF8F3    xor         eax,eax
 004CF8F5    push        ebp
 004CF8F6    push        4CF93B
 004CF8FB    push        dword ptr fs:[eax]
 004CF8FE    mov         dword ptr fs:[eax],esp
 004CF901    lea         edx,[ebp-4]
 004CF904    mov         eax,esi
 004CF906    call        TControl.GetText
 004CF90B    mov         eax,dword ptr [ebp-4]
 004CF90E    push        eax
 004CF90F    mov         eax,esi
 004CF911    call        TTabSheet.GetTabIndex
 004CF916    push        eax
 004CF917    mov         eax,ebx
 004CF919    call        TCustomTabControl.GetTabs
 004CF91E    pop         edx
 004CF91F    pop         ecx
 004CF920    mov         ebx,dword ptr [eax]
 004CF922    call        dword ptr [ebx+20]
 004CF925    xor         eax,eax
 004CF927    pop         edx
 004CF928    pop         ecx
 004CF929    pop         ecx
 004CF92A    mov         dword ptr fs:[eax],edx
 004CF92D    push        4CF942
 004CF932    lea         eax,[ebp-4]
 004CF935    call        @UStrClr
 004CF93A    ret
>004CF93B    jmp         @HandleFinally
>004CF940    jmp         004CF932
 004CF942    pop         esi
 004CF943    pop         ebx
 004CF944    pop         ecx
 004CF945    pop         ebp
 004CF946    ret
*}
end;

//004CF948
procedure TPageControl.UpdateActivePage;
begin
{*
 004CF948    push        ebx
 004CF949    mov         ebx,eax
 004CF94B    mov         eax,ebx
 004CF94D    call        TCustomTabControl.GetTabIndex
 004CF952    test        eax,eax
>004CF954    jl          004CF976
 004CF956    mov         eax,ebx
 004CF958    call        TCustomTabControl.GetTabIndex
 004CF95D    push        eax
 004CF95E    mov         eax,ebx
 004CF960    call        TCustomTabControl.GetTabs
 004CF965    pop         edx
 004CF966    mov         ecx,dword ptr [eax]
 004CF968    call        dword ptr [ecx+18]
 004CF96B    mov         edx,eax
 004CF96D    mov         eax,ebx
 004CF96F    call        TPageControl.SetActivePage
 004CF974    pop         ebx
 004CF975    ret
 004CF976    xor         edx,edx
 004CF978    mov         eax,ebx
 004CF97A    call        TPageControl.SetActivePage
 004CF97F    pop         ebx
 004CF980    ret
*}
end;

//004CF984
procedure TPageControl.CMDesignHitTest(var Message:TCMDesignHitTest);
begin
{*
 004CF984    push        ebx
 004CF985    push        esi
 004CF986    push        edi
 004CF987    add         esp,0FFFFFFE8
 004CF98A    mov         edi,edx
 004CF98C    mov         ebx,eax
 004CF98E    mov         eax,dword ptr [edi+8]
 004CF991    mov         dword ptr [esp],eax
 004CF994    movsx       eax,word ptr [esp]
 004CF998    mov         dword ptr [esp+4],eax
 004CF99C    movsx       eax,word ptr [esp+2]
 004CF9A1    mov         dword ptr [esp+8],eax
 004CF9A5    mov         eax,dword ptr [esp+4]
 004CF9A9    mov         dword ptr [esp+0C],eax
 004CF9AD    mov         eax,dword ptr [esp+8]
 004CF9B1    mov         dword ptr [esp+10],eax
 004CF9B5    lea         eax,[esp+0C]
 004CF9B9    push        eax
 004CF9BA    mov         eax,ebx
 004CF9BC    call        TWinControl.GetHandle
 004CF9C1    xor         ecx,ecx
 004CF9C3    mov         edx,130D
 004CF9C8    call        SendStructMessage
 004CF9CD    mov         esi,eax
 004CF9CF    test        esi,esi
>004CF9D1    jl          004CF9E5
 004CF9D3    mov         eax,ebx
 004CF9D5    call        TCustomTabControl.GetTabIndex
 004CF9DA    cmp         esi,eax
>004CF9DC    je          004CF9E5
 004CF9DE    mov         dword ptr [edi+0C],1
 004CF9E5    add         esp,18
 004CF9E8    pop         edi
 004CF9E9    pop         esi
 004CF9EA    pop         ebx
 004CF9EB    ret
*}
end;

//004CF9EC
procedure TPageControl.CMDialogKey(var Message:TCMDialogKey);
begin
{*
 004CF9EC    push        ebx
 004CF9ED    push        esi
 004CF9EE    push        edi
 004CF9EF    mov         edi,edx
 004CF9F1    mov         ebx,eax
 004CF9F3    mov         eax,ebx
 004CF9F5    mov         si,0FFB3
 004CF9F9    call        @CallDynaInst
 004CF9FE    test        al,al
>004CFA00    jne         004CFA19
 004CFA02    call        user32.GetFocus
 004CFA07    push        eax
 004CFA08    mov         eax,ebx
 004CFA0A    call        TWinControl.GetHandle
 004CFA0F    push        eax
 004CFA10    call        user32.IsChild
 004CFA15    test        eax,eax
>004CFA17    je          004CFA4B
 004CFA19    cmp         word ptr [edi+4],9
>004CFA1E    jne         004CFA4B
 004CFA20    push        11
 004CFA22    call        user32.GetKeyState
 004CFA27    test        ax,ax
>004CFA2A    jge         004CFA4B
 004CFA2C    push        10
 004CFA2E    call        user32.GetKeyState
 004CFA33    test        ax,ax
 004CFA36    setge       dl
 004CFA39    mov         cl,1
 004CFA3B    mov         eax,ebx
 004CFA3D    call        TPageControl.SelectNextPage
 004CFA42    mov         dword ptr [edi+0C],1
>004CFA49    jmp         004CFA54
 004CFA4B    mov         edx,edi
 004CFA4D    mov         eax,ebx
 004CFA4F    call        TWinControl.CMDialogKey
 004CFA54    pop         edi
 004CFA55    pop         esi
 004CFA56    pop         ebx
 004CFA57    ret
*}
end;

//004CFA58
procedure TPageControl.CMDockClient(var Message:TCMDockClient);
begin
{*
 004CFA58    push        ebp
 004CFA59    mov         ebp,esp
 004CFA5B    add         esp,0FFFFFFF4
 004CFA5E    push        ebx
 004CFA5F    push        esi
 004CFA60    push        edi
 004CFA61    xor         ecx,ecx
 004CFA63    mov         dword ptr [ebp-0C],ecx
 004CFA66    mov         edi,edx
 004CFA68    mov         dword ptr [ebp-4],eax
 004CFA6B    xor         eax,eax
 004CFA6D    push        ebp
 004CFA6E    push        4CFBE6
 004CFA73    push        dword ptr fs:[eax]
 004CFA76    mov         dword ptr fs:[eax],esp
 004CFA79    xor         eax,eax
 004CFA7B    mov         dword ptr [edi+0C],eax
 004CFA7E    mov         eax,dword ptr [edi+4]
 004CFA81    mov         eax,dword ptr [eax+40]
 004CFA84    mov         dword ptr [ebp-8],eax
 004CFA87    mov         eax,dword ptr [ebp-4]
 004CFA8A    call        TPageControl.GetPageCount
 004CFA8F    mov         esi,eax
 004CFA91    dec         esi
 004CFA92    test        esi,esi
>004CFA94    jl          004CFAD0
 004CFA96    inc         esi
 004CFA97    xor         ebx,ebx
 004CFA99    mov         edx,ebx
 004CFA9B    mov         eax,dword ptr [ebp-4]
 004CFA9E    call        TPageControl.GetPage
 004CFAA3    mov         edx,dword ptr [ebp-8]
 004CFAA6    cmp         eax,dword ptr [edx+34]
>004CFAA9    jne         004CFACC
 004CFAAB    mov         edx,ebx
 004CFAAD    mov         eax,dword ptr [ebp-4]
 004CFAB0    call        TPageControl.GetPage
 004CFAB5    push        eax
 004CFAB6    mov         eax,dword ptr [ebp-4]
 004CFAB9    call        TPageControl.GetPageCount
 004CFABE    mov         edx,eax
 004CFAC0    dec         edx
 004CFAC1    pop         eax
 004CFAC2    call        TTabSheet.SetPageIndex
>004CFAC7    jmp         004CFBD0
 004CFACC    inc         ebx
 004CFACD    dec         esi
>004CFACE    jne         004CFA99
 004CFAD0    mov         ecx,dword ptr [ebp-4]
 004CFAD3    mov         dl,1
 004CFAD5    mov         eax,[004CA0EC];TTabSheet
 004CFADA    call        TTabSheet.Create
 004CFADF    mov         ebx,eax
 004CFAE1    mov         eax,dword ptr [ebp-4]
 004CFAE4    mov         dword ptr [eax+2D8],ebx
 004CFAEA    xor         eax,eax
 004CFAEC    push        ebp
 004CFAED    push        4CFBC9
 004CFAF2    push        dword ptr fs:[eax]
 004CFAF5    mov         dword ptr fs:[eax],esp
 004CFAF8    xor         eax,eax
 004CFAFA    push        ebp
 004CFAFB    push        4CFB5D
 004CFB00    push        dword ptr fs:[eax]
 004CFB03    mov         dword ptr fs:[eax],esp
 004CFB06    mov         eax,dword ptr [ebp-8]
 004CFB09    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 004CFB0F    call        @IsClass
 004CFB14    test        al,al
>004CFB16    je          004CFB2D
 004CFB18    lea         edx,[ebp-0C]
 004CFB1B    mov         eax,dword ptr [ebp-8]
 004CFB1E    call        TControl.GetText
 004CFB23    mov         edx,dword ptr [ebp-0C]
 004CFB26    mov         eax,ebx
 004CFB28    call        TControl.SetText
 004CFB2D    mov         eax,dword ptr [ebp-4]
 004CFB30    mov         eax,dword ptr [eax+2D8]
 004CFB36    mov         edx,dword ptr [ebp-4]
 004CFB39    call        TTabSheet.SetPageControl
 004CFB3E    mov         eax,dword ptr [edi+4]
 004CFB41    lea         ecx,[eax+4C]
 004CFB44    mov         edx,dword ptr [ebp-4]
 004CFB47    mov         eax,dword ptr [ebp-8]
 004CFB4A    mov         si,0FFCC
 004CFB4E    call        @CallDynaInst
 004CFB53    xor         eax,eax
 004CFB55    pop         edx
 004CFB56    pop         ecx
 004CFB57    pop         ecx
 004CFB58    mov         dword ptr fs:[eax],edx
>004CFB5B    jmp         004CFB7A
>004CFB5D    jmp         @HandleAnyException
 004CFB62    mov         eax,dword ptr [ebp-4]
 004CFB65    mov         eax,dword ptr [eax+2D8]
 004CFB6B    call        TObject.Free
 004CFB70    call        @RaiseAgain
 004CFB75    call        @DoneExcept
 004CFB7A    mov         eax,dword ptr [ebp-8]
 004CFB7D    movzx       ebx,byte ptr [eax+59]
 004CFB81    mov         eax,dword ptr [ebp-4]
 004CFB84    mov         eax,dword ptr [eax+2D8]
 004CFB8A    mov         edx,ebx
 004CFB8C    call        TTabSheet.SetTabVisible
 004CFB91    test        bl,bl
>004CFB93    je          004CFBA6
 004CFB95    mov         eax,dword ptr [ebp-4]
 004CFB98    mov         edx,dword ptr [eax+2D8]
 004CFB9E    mov         eax,dword ptr [ebp-4]
 004CFBA1    call        TPageControl.SetActivePage
 004CFBA6    mov         dl,5
 004CFBA8    mov         eax,dword ptr [ebp-8]
 004CFBAB    call        TControl.SetAlign
 004CFBB0    xor         eax,eax
 004CFBB2    pop         edx
 004CFBB3    pop         ecx
 004CFBB4    pop         ecx
 004CFBB5    mov         dword ptr fs:[eax],edx
 004CFBB8    push        4CFBD0
 004CFBBD    mov         eax,dword ptr [ebp-4]
 004CFBC0    xor         edx,edx
 004CFBC2    mov         dword ptr [eax+2D8],edx
 004CFBC8    ret
>004CFBC9    jmp         @HandleFinally
>004CFBCE    jmp         004CFBBD
 004CFBD0    xor         eax,eax
 004CFBD2    pop         edx
 004CFBD3    pop         ecx
 004CFBD4    pop         ecx
 004CFBD5    mov         dword ptr fs:[eax],edx
 004CFBD8    push        4CFBED
 004CFBDD    lea         eax,[ebp-0C]
 004CFBE0    call        @UStrClr
 004CFBE5    ret
>004CFBE6    jmp         @HandleFinally
>004CFBEB    jmp         004CFBDD
 004CFBED    pop         edi
 004CFBEE    pop         esi
 004CFBEF    pop         ebx
 004CFBF0    mov         esp,ebp
 004CFBF2    pop         ebp
 004CFBF3    ret
*}
end;

//004CFBF4
procedure TPageControl.CMDockNotification(var Message:TCMDockNotification);
begin
{*
 004CFBF4    push        ebp
 004CFBF5    mov         ebp,esp
 004CFBF7    add         esp,0FFFFFFF0
 004CFBFA    push        ebx
 004CFBFB    push        esi
 004CFBFC    push        edi
 004CFBFD    xor         ecx,ecx
 004CFBFF    mov         dword ptr [ebp-4],ecx
 004CFC02    mov         esi,edx
 004CFC04    mov         ebx,eax
 004CFC06    xor         eax,eax
 004CFC08    push        ebp
 004CFC09    push        4CFCDD
 004CFC0E    push        dword ptr fs:[eax]
 004CFC11    mov         dword ptr fs:[eax],esp
 004CFC14    mov         edx,dword ptr [esi+4]
 004CFC17    mov         eax,ebx
 004CFC19    call        TPageControl.GetPageFromDockClient
 004CFC1E    mov         edi,eax
 004CFC20    test        edi,edi
>004CFC22    je          004CFCBE
 004CFC28    mov         eax,dword ptr [esi+8]
 004CFC2B    mov         eax,dword ptr [eax]
 004CFC2D    sub         eax,0C
>004CFC30    je          004CFC3E
 004CFC32    sub         eax,0AFFF
>004CFC37    je          004CFCB1
>004CFC39    jmp         004CFCBE
 004CFC3E    lea         eax,[ebp-4]
 004CFC41    mov         edx,dword ptr [esi+8]
 004CFC44    mov         edx,dword ptr [edx+8]
 004CFC47    call        @UStrFromPWChar
 004CFC4C    mov         eax,dword ptr [ebp-4]
 004CFC4F    test        eax,eax
>004CFC51    je          004CFC58
 004CFC53    sub         eax,4
 004CFC56    mov         eax,dword ptr [eax]
 004CFC58    test        eax,eax
>004CFC5A    jle         004CFCA5
 004CFC5C    mov         dword ptr [ebp-0C],eax
 004CFC5F    mov         dword ptr [ebp-8],1
 004CFC66    mov         eax,4CFCEC
 004CFC6B    mov         dword ptr [ebp-10],eax
 004CFC6E    mov         eax,dword ptr [ebp-4]
 004CFC71    mov         edx,dword ptr [ebp-8]
 004CFC74    movzx       eax,word ptr [eax+edx*2-2]
 004CFC79    mov         edx,dword ptr [ebp-10]
 004CFC7C    cmp         ax,0FF
>004CFC80    ja          004CFC88
 004CFC82    movzx       eax,ax
 004CFC85    bt          dword ptr [edx],eax
 004CFC88    setb        al
 004CFC8B    test        al,al
>004CFC8D    je          004CFC9D
 004CFC8F    mov         edx,dword ptr [ebp-8]
 004CFC92    dec         edx
 004CFC93    lea         eax,[ebp-4]
 004CFC96    call        @UStrSetLength
>004CFC9B    jmp         004CFCA5
 004CFC9D    inc         dword ptr [ebp-8]
 004CFCA0    dec         dword ptr [ebp-0C]
>004CFCA3    jne         004CFC66
 004CFCA5    mov         edx,dword ptr [ebp-4]
 004CFCA8    mov         eax,edi
 004CFCAA    call        TControl.SetText
>004CFCAF    jmp         004CFCBE
 004CFCB1    mov         eax,dword ptr [esi+8]
 004CFCB4    mov         edx,dword ptr [eax+4]
 004CFCB7    mov         eax,edi
 004CFCB9    call        TTabSheet.SetTabVisible
 004CFCBE    mov         edx,esi
 004CFCC0    mov         eax,ebx
 004CFCC2    mov         ecx,dword ptr [eax]
 004CFCC4    call        dword ptr [ecx-10]
 004CFCC7    xor         eax,eax
 004CFCC9    pop         edx
 004CFCCA    pop         ecx
 004CFCCB    pop         ecx
 004CFCCC    mov         dword ptr fs:[eax],edx
 004CFCCF    push        4CFCE4
 004CFCD4    lea         eax,[ebp-4]
 004CFCD7    call        @UStrClr
 004CFCDC    ret
>004CFCDD    jmp         @HandleFinally
>004CFCE2    jmp         004CFCD4
 004CFCE4    pop         edi
 004CFCE5    pop         esi
 004CFCE6    pop         ebx
 004CFCE7    mov         esp,ebp
 004CFCE9    pop         ebp
 004CFCEA    ret
*}
end;

//004CFD0C
procedure TPageControl.CMUnDockClient(var Message:TCMUnDockClient);
begin
{*
 004CFD0C    push        ebx
 004CFD0D    push        esi
 004CFD0E    mov         esi,edx
 004CFD10    mov         ebx,eax
 004CFD12    xor         eax,eax
 004CFD14    mov         dword ptr [esi+0C],eax
 004CFD17    mov         edx,dword ptr [esi+8]
 004CFD1A    mov         eax,ebx
 004CFD1C    call        TPageControl.GetPageFromDockClient
 004CFD21    test        eax,eax
>004CFD23    je          004CFD35
 004CFD25    mov         dword ptr [ebx+2DC],eax
 004CFD2B    mov         eax,dword ptr [esi+8]
 004CFD2E    xor         edx,edx
 004CFD30    call        TControl.SetAlign
 004CFD35    pop         esi
 004CFD36    pop         ebx
 004CFD37    ret
*}
end;

//004CFD38
function TPageControl.GetDockClientFromMousePos(MousePos:TPoint):TControl;
begin
{*
 004CFD38    push        ebx
 004CFD39    push        esi
 004CFD3A    push        edi
 004CFD3B    push        ebp
 004CFD3C    add         esp,0FFFFFFEC
 004CFD3F    mov         esi,edx
 004CFD41    lea         edi,[esp]
 004CFD44    movs        dword ptr [edi],dword ptr [esi]
 004CFD45    movs        dword ptr [edi],dword ptr [esi]
 004CFD46    mov         ebx,eax
 004CFD48    xor         ebp,ebp
 004CFD4A    cmp         byte ptr [ebx+1EC],0
>004CFD51    je          004CFDBD
 004CFD53    mov         eax,dword ptr [esp]
 004CFD56    mov         dword ptr [esp+8],eax
 004CFD5A    mov         eax,dword ptr [esp+4]
 004CFD5E    mov         dword ptr [esp+0C],eax
 004CFD62    lea         eax,[esp+8]
 004CFD66    push        eax
 004CFD67    mov         eax,ebx
 004CFD69    call        TWinControl.GetHandle
 004CFD6E    xor         ecx,ecx
 004CFD70    mov         edx,130D
 004CFD75    call        SendStructMessage
 004CFD7A    test        eax,eax
>004CFD7C    jl          004CFDBD
 004CFD7E    xor         esi,esi
 004CFD80    mov         edi,eax
 004CFD82    test        edi,edi
>004CFD84    jl          004CFD99
 004CFD86    inc         edi
 004CFD87    push        1
 004CFD89    mov         cl,1
 004CFD8B    mov         edx,esi
 004CFD8D    mov         eax,ebx
 004CFD8F    call        TPageControl.FindNextPage
 004CFD94    mov         esi,eax
 004CFD96    dec         edi
>004CFD97    jne         004CFD87
 004CFD99    test        esi,esi
>004CFD9B    je          004CFDBD
 004CFD9D    mov         eax,esi
 004CFD9F    call        TWinControl.GetControlCount
 004CFDA4    test        eax,eax
>004CFDA6    jle         004CFDBD
 004CFDA8    xor         edx,edx
 004CFDAA    mov         eax,esi
 004CFDAC    call        TWinControl.GetControl
 004CFDB1    mov         ebp,eax
 004CFDB3    cmp         ebx,dword ptr [ebp+90]
>004CFDB9    je          004CFDBD
 004CFDBB    xor         ebp,ebp
 004CFDBD    mov         eax,ebp
 004CFDBF    add         esp,14
 004CFDC2    pop         ebp
 004CFDC3    pop         edi
 004CFDC4    pop         esi
 004CFDC5    pop         ebx
 004CFDC6    ret
*}
end;

//004CFDC8
procedure TPageControl.WMLButtonDown(var Message:TWMLButtonDown);
begin
{*
 004CFDC8    push        ebx
 004CFDC9    push        esi
 004CFDCA    add         esp,0FFFFFFF4
 004CFDCD    mov         esi,edx
 004CFDCF    mov         ebx,eax
 004CFDD1    mov         edx,esi
 004CFDD3    mov         eax,ebx
 004CFDD5    call        TControl.WMLButtonDown
 004CFDDA    mov         eax,dword ptr [esi+8]
 004CFDDD    mov         dword ptr [esp],eax
 004CFDE0    movsx       eax,word ptr [esp]
 004CFDE4    mov         dword ptr [esp+4],eax
 004CFDE8    movsx       eax,word ptr [esp+2]
 004CFDED    mov         dword ptr [esp+8],eax
 004CFDF1    lea         edx,[esp+4]
 004CFDF5    mov         eax,ebx
 004CFDF7    call        TPageControl.GetDockClientFromMousePos
 004CFDFC    test        eax,eax
>004CFDFE    je          004CFE13
 004CFE00    cmp         byte ptr [ebx+28D],0
>004CFE07    jne         004CFE13
 004CFE09    or          ecx,0FFFFFFFF
 004CFE0C    xor         edx,edx
 004CFE0E    call        TControl.BeginDrag
 004CFE13    add         esp,0C
 004CFE16    pop         esi
 004CFE17    pop         ebx
 004CFE18    ret
*}
end;

//004CFE1C
procedure TPageControl.WMLButtonDblClk(var Message:TWMLButtonDblClk);
begin
{*
 004CFE1C    push        ebx
 004CFE1D    push        esi
 004CFE1E    add         esp,0FFFFFFF4
 004CFE21    mov         esi,edx
 004CFE23    mov         ebx,eax
 004CFE25    mov         edx,esi
 004CFE27    mov         eax,ebx
 004CFE29    call        TControl.WMLButtonDblClk
 004CFE2E    mov         eax,dword ptr [esi+8]
 004CFE31    mov         dword ptr [esp],eax
 004CFE34    movsx       eax,word ptr [esp]
 004CFE38    mov         dword ptr [esp+4],eax
 004CFE3C    movsx       eax,word ptr [esp+2]
 004CFE41    mov         dword ptr [esp+8],eax
 004CFE45    lea         edx,[esp+4]
 004CFE49    mov         eax,ebx
 004CFE4B    call        TPageControl.GetDockClientFromMousePos
 004CFE50    test        eax,eax
>004CFE52    je          004CFE5F
 004CFE54    push        0
 004CFE56    xor         ecx,ecx
 004CFE58    xor         edx,edx
 004CFE5A    call        TControl.ManualDock
 004CFE5F    add         esp,0C
 004CFE62    pop         esi
 004CFE63    pop         ebx
 004CFE64    ret
*}
end;

//004CFE68
function TPageControl.GetActivePageIndex:Integer;
begin
{*
 004CFE68    mov         edx,dword ptr [eax+2D4]
 004CFE6E    test        edx,edx
>004CFE70    je          004CFE7A
 004CFE72    mov         eax,edx
 004CFE74    call        TTabSheet.GetPageIndex
 004CFE79    ret
 004CFE7A    or          eax,0FFFFFFFF
 004CFE7D    ret
*}
end;

//004CFE80
procedure TPageControl.SetActivePageIndex(const Value:Integer);
begin
{*
 004CFE80    push        ebx
 004CFE81    push        esi
 004CFE82    mov         esi,edx
 004CFE84    mov         ebx,eax
 004CFE86    cmp         esi,0FFFFFFFF
>004CFE89    jle         004CFEAB
 004CFE8B    mov         eax,ebx
 004CFE8D    call        TPageControl.GetPageCount
 004CFE92    cmp         esi,eax
>004CFE94    jge         004CFEAB
 004CFE96    mov         edx,esi
 004CFE98    mov         eax,ebx
 004CFE9A    call        TPageControl.GetPage
 004CFE9F    mov         edx,eax
 004CFEA1    mov         eax,ebx
 004CFEA3    call        TPageControl.SetActivePage
 004CFEA8    pop         esi
 004CFEA9    pop         ebx
 004CFEAA    ret
 004CFEAB    xor         edx,edx
 004CFEAD    mov         eax,ebx
 004CFEAF    call        TPageControl.SetActivePage
 004CFEB4    pop         esi
 004CFEB5    pop         ebx
 004CFEB6    ret
*}
end;

//004CFEB8
procedure TPageControl.SetTabIndex(Value:Integer);
begin
{*
 004CFEB8    push        ebx
 004CFEB9    push        esi
 004CFEBA    mov         esi,edx
 004CFEBC    mov         ebx,eax
 004CFEBE    mov         edx,esi
 004CFEC0    mov         eax,ebx
 004CFEC2    call        TCustomTabControl.SetTabIndex
 004CFEC7    cmp         byte ptr [ebx+2E0],0
>004CFECE    jne         004CFF0C
 004CFED0    test        esi,esi
>004CFED2    jl          004CFF0C
 004CFED4    mov         eax,dword ptr [ebx+2D0]
 004CFEDA    cmp         esi,dword ptr [eax+8]
>004CFEDD    jge         004CFF0C
 004CFEDF    mov         edx,esi
 004CFEE1    mov         eax,ebx
 004CFEE3    call        TPageControl.GetPage
 004CFEE8    cmp         byte ptr [eax+278],0
>004CFEEF    je          004CFF0C
 004CFEF1    mov         edx,esi
 004CFEF3    mov         eax,ebx
 004CFEF5    call        TPageControl.PageIndexFromTabIndex
 004CFEFA    mov         edx,eax
 004CFEFC    mov         eax,ebx
 004CFEFE    call        TPageControl.GetPage
 004CFF03    mov         edx,eax
 004CFF05    mov         eax,ebx
 004CFF07    call        TPageControl.SetActivePage
 004CFF0C    pop         esi
 004CFF0D    pop         ebx
 004CFF0E    ret
*}
end;

//004CFF10
procedure TPageControl.WMEraseBkGnd(var Message:TWMEraseBkgnd);
begin
{*
 004CFF10    push        ebx
 004CFF11    push        esi
 004CFF12    mov         esi,edx
 004CFF14    mov         ebx,eax
 004CFF16    call        ThemeServices
 004CFF1B    call        TThemeServices.GetThemesEnabled
 004CFF20    test        al,al
>004CFF22    je          004CFF2F
 004CFF24    mov         eax,ebx
 004CFF26    call        TWinControl.GetParentBackground
 004CFF2B    test        al,al
>004CFF2D    jne         004CFF3B
 004CFF2F    mov         edx,esi
 004CFF31    mov         eax,ebx
 004CFF33    call        TWinControl.WMEraseBkgnd
 004CFF38    pop         esi
 004CFF39    pop         ebx
 004CFF3A    ret
 004CFF3B    mov         dword ptr [esi+0C],1
 004CFF42    pop         esi
 004CFF43    pop         ebx
 004CFF44    ret
*}
end;

//004CFF48
function TPageControl.PageIndexFromTabIndex(TabIndex:Integer):Integer;
begin
{*
 004CFF48    push        ebx
 004CFF49    push        esi
 004CFF4A    push        edi
 004CFF4B    push        ebp
 004CFF4C    mov         edi,eax
 004CFF4E    mov         ebp,edx
 004CFF50    mov         ebx,edx
 004CFF52    test        ebx,ebx
>004CFF54    jl          004CFF70
 004CFF56    inc         ebx
 004CFF57    xor         esi,esi
 004CFF59    mov         edx,esi
 004CFF5B    mov         eax,edi
 004CFF5D    call        TPageControl.GetPage
 004CFF62    cmp         byte ptr [eax+278],0
>004CFF69    jne         004CFF6C
 004CFF6B    inc         ebp
 004CFF6C    inc         esi
 004CFF6D    dec         ebx
>004CFF6E    jne         004CFF59
 004CFF70    mov         eax,ebp
 004CFF72    pop         ebp
 004CFF73    pop         edi
 004CFF74    pop         esi
 004CFF75    pop         ebx
 004CFF76    ret
*}
end;

//004CFF78
constructor TStatusPanel.Create;
begin
{*
 004CFF78    push        ebx
 004CFF79    push        esi
 004CFF7A    test        dl,dl
>004CFF7C    je          004CFF86
 004CFF7E    add         esp,0FFFFFFF0
 004CFF81    call        @ClassCreate
 004CFF86    mov         ebx,edx
 004CFF88    mov         esi,eax
 004CFF8A    mov         dword ptr [esi+10],32
 004CFF91    mov         byte ptr [esi+15],1
 004CFF95    mov         byte ptr [esi+17],1
 004CFF99    xor         edx,edx
 004CFF9B    mov         eax,esi
 004CFF9D    call        TCollectionItem.Create
 004CFFA2    mov         eax,esi
 004CFFA4    call        TStatusPanel.ParentBiDiModeChanged
 004CFFA9    mov         eax,esi
 004CFFAB    test        bl,bl
>004CFFAD    je          004CFFBE
 004CFFAF    call        @AfterConstruction
 004CFFB4    pop         dword ptr fs:[0]
 004CFFBB    add         esp,0C
 004CFFBE    mov         eax,esi
 004CFFC0    pop         esi
 004CFFC1    pop         ebx
 004CFFC2    ret
*}
end;

//004CFFC4
procedure TStatusPanel.Assign(Source:TPersistent);
begin
{*
 004CFFC4    push        ebx
 004CFFC5    push        esi
 004CFFC6    push        edi
 004CFFC7    mov         esi,edx
 004CFFC9    mov         ebx,eax
 004CFFCB    mov         eax,esi
 004CFFCD    mov         edx,dword ptr ds:[4CB974];TStatusPanel
 004CFFD3    call        @IsClass
 004CFFD8    test        al,al
>004CFFDA    je          004D0015
 004CFFDC    mov         edi,esi
 004CFFDE    mov         edx,dword ptr [edi+0C]
 004CFFE1    mov         eax,ebx
 004CFFE3    call        TStatusPanel.SetText
 004CFFE8    mov         edx,dword ptr [edi+10]
 004CFFEB    mov         eax,ebx
 004CFFED    call        TStatusPanel.SetWidth
 004CFFF2    movzx       edx,byte ptr [edi+14]
 004CFFF6    mov         eax,ebx
 004CFFF8    call        TStatusPanel.SetAlignment
 004CFFFD    movzx       edx,byte ptr [edi+15]
 004D0001    mov         eax,ebx
 004D0003    call        TStatusPanel.SetBevel
 004D0008    movzx       edx,byte ptr [edi+18]
 004D000C    mov         eax,ebx
 004D000E    call        TStatusPanel.SetStyle
>004D0013    jmp         004D001E
 004D0015    mov         edx,esi
 004D0017    mov         eax,ebx
 004D0019    call        TPersistent.Assign
 004D001E    pop         edi
 004D001F    pop         esi
 004D0020    pop         ebx
 004D0021    ret
*}
end;

//004D0024
procedure TStatusPanel.SetBiDiMode(Value:TBiDiMode);
begin
{*
 004D0024    cmp         dl,byte ptr [eax+16]
>004D0027    je          004D0037
 004D0029    mov         byte ptr [eax+16],dl
 004D002C    mov         byte ptr [eax+17],0
 004D0030    xor         edx,edx
 004D0032    call        TCollectionItem.Changed
 004D0037    ret
*}
end;

//004D0038
procedure TStatusPanel.IsStoredBiDiMode(Value:TBiDiMode);
begin
{*
 004D0038    movzx       eax,byte ptr [eax+17];TStatusPanel.FParentBiDiMode:Boolean
 004D003C    xor         al,1
 004D003E    ret
*}
end;

//004D0040
procedure TStatusPanel.SetParentBiDiMode(Value:Boolean);
begin
{*
 004D0040    cmp         dl,byte ptr [eax+17]
>004D0043    je          004D004D
 004D0045    mov         byte ptr [eax+17],dl
 004D0048    call        TStatusPanel.ParentBiDiModeChanged
 004D004D    ret
*}
end;

//004D0050
procedure TStatusPanel.ParentBiDiModeChanged;
begin
{*
 004D0050    push        ebx
 004D0051    push        esi
 004D0052    mov         ebx,eax
 004D0054    cmp         byte ptr [ebx+17],0
>004D0058    je          004D0086
 004D005A    mov         eax,ebx
 004D005C    mov         si,0FFFF
 004D0060    call        @CallDynaInst
 004D0065    test        eax,eax
>004D0067    je          004D0086
 004D0069    mov         eax,ebx
 004D006B    mov         si,0FFFF
 004D006F    call        @CallDynaInst
 004D0074    mov         eax,dword ptr [eax+18]
 004D0077    movzx       edx,byte ptr [eax+61]
 004D007B    mov         eax,ebx
 004D007D    call        TStatusPanel.SetBiDiMode
 004D0082    mov         byte ptr [ebx+17],1
 004D0086    pop         esi
 004D0087    pop         ebx
 004D0088    ret
*}
end;

//004D008C
function TStatusPanel.UseRightToLeftReading:Boolean;
begin
{*
 004D008C    mov         edx,dword ptr ds:[78DB7C];SysLocale:TSysLocale
 004D0092    cmp         byte ptr [edx+0D],0
>004D0096    je          004D009E
 004D0098    cmp         byte ptr [eax+16],0
>004D009C    jne         004D00A1
 004D009E    xor         eax,eax
 004D00A0    ret
 004D00A1    mov         al,1
 004D00A3    ret
*}
end;

//004D00A4
function TStatusPanel.UseRightToLeftAlignment:Boolean;
begin
{*
 004D00A4    mov         edx,dword ptr ds:[78DB7C];SysLocale:TSysLocale
 004D00AA    cmp         byte ptr [edx+0D],0
>004D00AE    je          004D00B6
 004D00B0    cmp         byte ptr [eax+16],1
>004D00B4    je          004D00B9
 004D00B6    xor         eax,eax
 004D00B8    ret
 004D00B9    mov         al,1
 004D00BB    ret
*}
end;

//004D00BC
function THeaderSection.GetDisplayName:UnicodeString;
begin
{*
 004D00BC    push        ebx
 004D00BD    push        esi
 004D00BE    mov         esi,edx
 004D00C0    mov         ebx,eax
 004D00C2    mov         eax,esi
 004D00C4    mov         edx,dword ptr [ebx+0C]
 004D00C7    call        @UStrAsg
 004D00CC    cmp         dword ptr [esi],0
>004D00CF    jne         004D00DA
 004D00D1    mov         edx,esi
 004D00D3    mov         eax,ebx
 004D00D5    call        TCollectionItem.GetDisplayName
 004D00DA    pop         esi
 004D00DB    pop         ebx
 004D00DC    ret
*}
end;

//004D00E0
procedure TStatusPanel.SetAlignment(Value:TAlignment);
begin
{*
 004D00E0    cmp         dl,byte ptr [eax+14]
>004D00E3    je          004D00EF
 004D00E5    mov         byte ptr [eax+14],dl
 004D00E8    xor         edx,edx
 004D00EA    call        TCollectionItem.Changed
 004D00EF    ret
*}
end;

//004D00F0
procedure TStatusPanel.SetBevel(Value:TStatusPanelBevel);
begin
{*
 004D00F0    cmp         dl,byte ptr [eax+15]
>004D00F3    je          004D00FF
 004D00F5    mov         byte ptr [eax+15],dl
 004D00F8    xor         edx,edx
 004D00FA    call        TCollectionItem.Changed
 004D00FF    ret
*}
end;

//004D0100
procedure TStatusPanel.SetStyle(Value:TStatusPanelStyle);
begin
{*
 004D0100    cmp         dl,byte ptr [eax+18]
>004D0103    je          004D010F
 004D0105    mov         byte ptr [eax+18],dl
 004D0108    xor         edx,edx
 004D010A    call        TCollectionItem.Changed
 004D010F    ret
*}
end;

//004D0110
procedure TStatusPanel.SetText(const Value:UnicodeString);
begin
{*
 004D0110    push        ebx
 004D0111    push        esi
 004D0112    mov         esi,edx
 004D0114    mov         ebx,eax
 004D0116    mov         eax,dword ptr [ebx+0C]
 004D0119    mov         edx,esi
 004D011B    call        @UStrEqual
>004D0120    je          004D0135
 004D0122    lea         eax,[ebx+0C]
 004D0125    mov         edx,esi
 004D0127    call        @UStrAsg
 004D012C    xor         edx,edx
 004D012E    mov         eax,ebx
 004D0130    call        TCollectionItem.Changed
 004D0135    pop         esi
 004D0136    pop         ebx
 004D0137    ret
*}
end;

//004D0138
procedure TStatusPanel.SetWidth(Value:Integer);
begin
{*
 004D0138    cmp         edx,dword ptr [eax+10]
>004D013B    je          004D0147
 004D013D    mov         dword ptr [eax+10],edx
 004D0140    mov         dl,1
 004D0142    call        TCollectionItem.Changed
 004D0147    ret
*}
end;

//004D0148
constructor TStatusPanels.Create;
begin
{*
 004D0148    push        ebx
 004D0149    push        esi
 004D014A    push        edi
 004D014B    test        dl,dl
>004D014D    je          004D0157
 004D014F    add         esp,0FFFFFFF0
 004D0152    call        @ClassCreate
 004D0157    mov         esi,ecx
 004D0159    mov         ebx,edx
 004D015B    mov         edi,eax
 004D015D    test        esi,esi
>004D015F    je          004D0178
 004D0161    mov         eax,esi
 004D0163    mov         edx,dword ptr [eax]
 004D0165    call        dword ptr [edx+0F8]
 004D016B    mov         ecx,eax
 004D016D    xor         edx,edx
 004D016F    mov         eax,edi
 004D0171    call        TCollection.Create
>004D0176    jmp         004D0187
 004D0178    mov         ecx,dword ptr ds:[4CB974];TStatusPanel
 004D017E    xor         edx,edx
 004D0180    mov         eax,edi
 004D0182    call        TCollection.Create
 004D0187    mov         dword ptr [edi+18],esi
 004D018A    mov         eax,edi
 004D018C    test        bl,bl
>004D018E    je          004D019F
 004D0190    call        @AfterConstruction
 004D0195    pop         dword ptr fs:[0]
 004D019C    add         esp,0C
 004D019F    mov         eax,edi
 004D01A1    pop         edi
 004D01A2    pop         esi
 004D01A3    pop         ebx
 004D01A4    ret
*}
end;

//004D01A8
function TStatusPanels.Add:TStatusPanel;
begin
{*
 004D01A8    push        ebx
 004D01A9    mov         ebx,eax
 004D01AB    mov         eax,ebx
 004D01AD    call        TCollection.Add
 004D01B2    pop         ebx
 004D01B3    ret
*}
end;

//004D01B4
function TCoolBands.GetItem(Index:Integer):TCoolBand;
begin
{*
 004D01B4    push        ebx
 004D01B5    push        esi
 004D01B6    mov         esi,edx
 004D01B8    mov         ebx,eax
 004D01BA    mov         edx,esi
 004D01BC    mov         eax,ebx
 004D01BE    call        TCollection.GetItem
 004D01C3    pop         esi
 004D01C4    pop         ebx
 004D01C5    ret
*}
end;

//004D01C8
procedure TStatusPanels.sub_00446E30;
begin
{*
 004D01C8    mov         eax,dword ptr [eax+18];TStatusPanels....FStatusBar:TCustomStatusBar
 004D01CB    ret
*}
end;

//004D01CC
procedure TStatusPanels.Update(Item:TCollectionItem);
begin
{*
 004D01CC    push        ebx
 004D01CD    push        esi
 004D01CE    mov         esi,edx
 004D01D0    mov         ebx,eax
 004D01D2    test        esi,esi
>004D01D4    je          004D01EC
 004D01D6    mov         eax,esi
 004D01D8    call        TCollectionItem.GetIndex
 004D01DD    mov         edx,eax
 004D01DF    xor         ecx,ecx
 004D01E1    mov         eax,dword ptr [ebx+18]
 004D01E4    call        TCustomStatusBar.UpdatePanel
 004D01E9    pop         esi
 004D01EA    pop         ebx
 004D01EB    ret
 004D01EC    xor         ecx,ecx
 004D01EE    mov         dl,1
 004D01F0    mov         eax,dword ptr [ebx+18]
 004D01F3    call        TCustomStatusBar.UpdatePanels
 004D01F8    pop         esi
 004D01F9    pop         ebx
 004D01FA    ret
*}
end;

//004D01FC
function TStatusPanels.AddItem(Item:TStatusPanel; Index:Integer):TStatusPanel;
begin
{*
 004D01FC    push        ebx
 004D01FD    push        esi
 004D01FE    push        edi
 004D01FF    mov         edi,ecx
 004D0201    mov         esi,eax
 004D0203    test        edx,edx
>004D0205    jne         004D0216
 004D0207    mov         eax,dword ptr [esi+18]
 004D020A    mov         edx,dword ptr [eax]
 004D020C    call        dword ptr [edx+0EC]
 004D0212    mov         ebx,eax
>004D0214    jmp         004D0218
 004D0216    mov         ebx,edx
 004D0218    test        ebx,ebx
>004D021A    je          004D0239
 004D021C    mov         edx,esi
 004D021E    mov         eax,ebx
 004D0220    mov         ecx,dword ptr [eax]
 004D0222    call        dword ptr [ecx+10]
 004D0225    test        edi,edi
>004D0227    jge         004D0230
 004D0229    mov         eax,dword ptr [esi+8]
 004D022C    mov         edi,dword ptr [eax+8]
 004D022F    dec         edi
 004D0230    mov         edx,edi
 004D0232    mov         eax,ebx
 004D0234    mov         ecx,dword ptr [eax]
 004D0236    call        dword ptr [ecx+14]
 004D0239    mov         eax,ebx
 004D023B    pop         edi
 004D023C    pop         esi
 004D023D    pop         ebx
 004D023E    ret
*}
end;

//004D0240
function TStatusPanels.Insert(Index:Integer):TStatusPanel;
begin
{*
 004D0240    mov         ecx,edx
 004D0242    xor         edx,edx
 004D0244    call        TStatusPanels.AddItem
 004D0249    ret
*}
end;

//004D024C
constructor TCustomStatusBar.Create;
begin
{*
 004D024C    push        ebp
 004D024D    mov         ebp,esp
 004D024F    push        ecx
 004D0250    push        ebx
 004D0251    push        esi
 004D0252    test        dl,dl
>004D0254    je          004D025E
 004D0256    add         esp,0FFFFFFF0
 004D0259    call        @ClassCreate
 004D025E    mov         byte ptr [ebp-1],dl
 004D0261    mov         ebx,eax
 004D0263    xor         edx,edx
 004D0265    mov         eax,ebx
 004D0267    call        TWinControl.Create
 004D026C    mov         eax,[004D0300]
 004D0271    mov         dword ptr [ebx+50],eax
 004D0274    mov         edx,0FF00000F
 004D0279    mov         eax,ebx
 004D027B    call        TControl.SetColor
 004D0280    mov         edx,13
 004D0285    mov         eax,ebx
 004D0287    call        TControl.SetHeight
 004D028C    mov         dl,2
 004D028E    mov         eax,ebx
 004D0290    call        TControl.SetAlign
 004D0295    mov         eax,ebx
 004D0297    mov         edx,dword ptr [eax]
 004D0299    call        dword ptr [edx+0F0]
 004D029F    mov         dword ptr [ebx+270],eax
 004D02A5    mov         dl,1
 004D02A7    mov         eax,[00476D34];TControlCanvas
 004D02AC    call        TCanvas.Create
 004D02B1    mov         esi,eax
 004D02B3    mov         dword ptr [ebx+274],esi
 004D02B9    mov         eax,esi
 004D02BB    mov         edx,ebx
 004D02BD    call        TControlCanvas.SetControl
 004D02C2    mov         byte ptr [ebx+27D],1
 004D02C9    xor         edx,edx
 004D02CB    mov         eax,ebx
 004D02CD    call        TControl.SetParentFont
 004D02D2    mov         byte ptr [ebx+27F],1
 004D02D9    mov         eax,ebx
 004D02DB    call        TCustomStatusBar.SyncToSystemFont
 004D02E0    mov         eax,ebx
 004D02E2    cmp         byte ptr [ebp-1],0
>004D02E6    je          004D02F7
 004D02E8    call        @AfterConstruction
 004D02ED    pop         dword ptr fs:[0]
 004D02F4    add         esp,0C
 004D02F7    mov         eax,ebx
 004D02F9    pop         esi
 004D02FA    pop         ebx
 004D02FB    pop         ecx
 004D02FC    pop         ebp
 004D02FD    ret
*}
end;

//004D0304
destructor TCustomStatusBar.Destroy();
begin
{*
 004D0304    push        ebx
 004D0305    push        esi
 004D0306    call        @BeforeDestruction
 004D030B    mov         ebx,edx
 004D030D    mov         esi,eax
 004D030F    mov         eax,dword ptr [esi+274]
 004D0315    call        TObject.Free
 004D031A    mov         eax,dword ptr [esi+270]
 004D0320    call        TObject.Free
 004D0325    mov         edx,ebx
 004D0327    and         dl,0FC
 004D032A    mov         eax,esi
 004D032C    call        TWinControl.Destroy
 004D0331    test        bl,bl
>004D0333    jle         004D033C
 004D0335    mov         eax,esi
 004D0337    call        @ClassDestroy
 004D033C    pop         esi
 004D033D    pop         ebx
 004D033E    ret
*}
end;

//004D0340
procedure TCustomStatusBar.CreateParams(var Params:TCreateParams);
begin
{*
 004D0340    push        ebx
 004D0341    push        esi
 004D0342    mov         esi,edx
 004D0344    mov         ebx,eax
 004D0346    mov         eax,4
 004D034B    call        InitCommonControl
 004D0350    mov         edx,esi
 004D0352    mov         eax,ebx
 004D0354    call        TWinControl.CreateParams
 004D0359    mov         ecx,4D03B0
 004D035E    mov         edx,esi
 004D0360    mov         eax,ebx
 004D0362    call        TWinControl.CreateSubClass
 004D0367    cmp         byte ptr [ebx+27D],0
>004D036E    je          004D0379
 004D0370    cmp         byte ptr [ebx+27E],0
>004D0377    jne         004D037D
 004D0379    xor         eax,eax
>004D037B    jmp         004D037F
 004D037D    mov         al,1
 004D037F    and         eax,7F
 004D0382    mov         eax,dword ptr [eax*4+7863FC]
 004D0389    or          dword ptr [esi+4],eax
 004D038C    call        ThemeServices
 004D0391    call        TThemeServices.GetThemesEnabled
 004D0396    test        al,al
>004D0398    je          004D03A9
 004D039A    mov         eax,dword ptr [esi+24]
 004D039D    or          eax,2
 004D03A0    or          eax,1
 004D03A3    mov         dword ptr [esi+24],eax
 004D03A6    pop         esi
 004D03A7    pop         ebx
 004D03A8    ret
 004D03A9    and         dword ptr [esi+24],0FFFFFFFC
 004D03AD    pop         esi
 004D03AE    pop         ebx
 004D03AF    ret
*}
end;

//004D03D8
procedure TCustomStatusBar.CreateWnd;
begin
{*
 004D03D8    push        ebx
 004D03D9    mov         ebx,eax
 004D03DB    xor         edx,edx
 004D03DD    mov         eax,ebx
 004D03DF    call        TCustomStatusBar.ValidateSizeGrip
 004D03E4    mov         eax,ebx
 004D03E6    call        TWinControl.CreateWnd
 004D03EB    mov         eax,dword ptr [ebx+6C]
 004D03EE    call        ColorToRGB
 004D03F3    push        eax
 004D03F4    push        0
 004D03F6    push        2001
 004D03FB    mov         eax,ebx
 004D03FD    call        TWinControl.GetHandle
 004D0402    push        eax
 004D0403    call        user32.SendMessageW
 004D0408    xor         ecx,ecx
 004D040A    mov         dl,1
 004D040C    mov         eax,ebx
 004D040E    call        TCustomStatusBar.UpdatePanels
 004D0413    cmp         dword ptr [ebx+278],0
>004D041A    je          004D0439
 004D041C    mov         eax,dword ptr [ebx+278]
 004D0422    push        eax
 004D0423    mov         eax,ebx
 004D0425    call        TWinControl.GetHandle
 004D042A    mov         ecx,0FF
 004D042F    mov         edx,40B
 004D0434    call        SendTextMessage
 004D0439    cmp         byte ptr [ebx+27C],0
>004D0440    je          004D0458
 004D0442    push        0
 004D0444    push        1
 004D0446    push        409
 004D044B    mov         eax,ebx
 004D044D    call        TWinControl.GetHandle
 004D0452    push        eax
 004D0453    call        user32.SendMessageW
 004D0458    pop         ebx
 004D0459    ret
*}
end;

//004D045C
function TCustomStatusBar.DoHint:Boolean;
begin
{*
 004D045C    push        ebx
 004D045D    cmp         word ptr [eax+292],0
>004D0465    je          004D047B
 004D0467    mov         ebx,eax
 004D0469    mov         edx,eax
 004D046B    mov         eax,dword ptr [ebx+294]
 004D0471    call        dword ptr [ebx+290]
 004D0477    mov         al,1
 004D0479    pop         ebx
 004D047A    ret
 004D047B    xor         eax,eax
 004D047D    pop         ebx
 004D047E    ret
*}
end;

//004D0480
procedure TCustomStatusBar.DrawPanel(Panel:TStatusPanel; const Rect:TRect);
begin
{*
 004D0480    push        esi
 004D0481    mov         esi,eax
 004D0483    cmp         word ptr [esi+28A],0
>004D048B    je          004D04A2
 004D048D    push        ecx
 004D048E    mov         eax,esi
 004D0490    mov         ecx,edx
 004D0492    mov         edx,eax
 004D0494    mov         eax,dword ptr [esi+28C]
 004D049A    call        dword ptr [esi+288]
 004D04A0    pop         esi
 004D04A1    ret
 004D04A2    mov         edx,ecx
 004D04A4    mov         eax,dword ptr [esi+274]
 004D04AA    mov         ecx,dword ptr [eax]
 004D04AC    call        dword ptr [ecx+54]
 004D04AF    pop         esi
 004D04B0    ret
*}
end;

//004D04B4
procedure TCustomHeaderControl.SetSections(Value:THeaderSections);
begin
{*
 004D04B4    push        esi
 004D04B5    mov         esi,eax
 004D04B7    mov         eax,dword ptr [esi+270]
 004D04BD    mov         ecx,dword ptr [eax]
 004D04BF    call        dword ptr [ecx+8]
 004D04C2    pop         esi
 004D04C3    ret
*}
end;

//004D04C4
procedure TCustomStatusBar.SetSimplePanel(Value:Boolean);
begin
{*
 004D04C4    push        ebx
 004D04C5    mov         ebx,eax
 004D04C7    cmp         dl,byte ptr [ebx+27C]
>004D04CD    je          004D04FC
 004D04CF    mov         byte ptr [ebx+27C],dl
 004D04D5    mov         eax,ebx
 004D04D7    call        TWinControl.HandleAllocated
 004D04DC    test        al,al
>004D04DE    je          004D04FC
 004D04E0    push        0
 004D04E2    movzx       eax,byte ptr [ebx+27C]
 004D04E9    push        eax
 004D04EA    push        409
 004D04EF    mov         eax,ebx
 004D04F1    call        TWinControl.GetHandle
 004D04F6    push        eax
 004D04F7    call        user32.SendMessageW
 004D04FC    pop         ebx
 004D04FD    ret
*}
end;

//004D0500
procedure TCustomStatusBar.DoRightToLeftAlignment(var Str:UnicodeString; AAlignment:TAlignment; ARTLAlignment:Boolean);
begin
{*
 004D0500    push        ebp
 004D0501    mov         ebp,esp
 004D0503    push        ecx
 004D0504    push        ebx
 004D0505    mov         byte ptr [ebp-1],cl
 004D0508    mov         ebx,edx
 004D050A    cmp         byte ptr [ebp+8],0
>004D050E    je          004D0518
 004D0510    lea         eax,[ebp-1]
 004D0513    call        ChangeBiDiModeAlignment
 004D0518    movzx       eax,byte ptr [ebp-1]
 004D051C    dec         al
>004D051E    je          004D0537
 004D0520    dec         al
>004D0522    jne         004D0548
 004D0524    mov         edx,ebx
 004D0526    mov         ecx,1
 004D052B    mov         eax,4D055C;'	'
 004D0530    call        @UStrInsert
>004D0535    jmp         004D0548
 004D0537    mov         edx,ebx
 004D0539    mov         ecx,1
 004D053E    mov         eax,4D056C;'		'
 004D0543    call        @UStrInsert
 004D0548    pop         ebx
 004D0549    pop         ecx
 004D054A    pop         ebp
 004D054B    ret         4
*}
end;

//004D0574
procedure TCustomStatusBar.UpdateSimpleText;
begin
{*
 004D0574    push        ebx
 004D0575    push        esi
 004D0576    mov         ebx,eax
 004D0578    mov         eax,ebx
 004D057A    mov         si,0FFC7
 004D057E    call        @CallDynaInst
 004D0583    push        eax
 004D0584    lea         edx,[ebx+278]
 004D058A    xor         ecx,ecx
 004D058C    mov         eax,ebx
 004D058E    call        TCustomStatusBar.DoRightToLeftAlignment
 004D0593    mov         eax,ebx
 004D0595    call        TWinControl.HandleAllocated
 004D059A    test        al,al
>004D059C    je          004D05CE
 004D059E    mov         eax,dword ptr [ebx+278]
 004D05A4    push        eax
 004D05A5    mov         eax,ebx
 004D05A7    call        TControl.UseRightToLeftReading
 004D05AC    and         eax,7F
 004D05AF    mov         eax,dword ptr [eax*4+786404]
 004D05B6    or          eax,0FF
 004D05BB    push        eax
 004D05BC    mov         eax,ebx
 004D05BE    call        TWinControl.GetHandle
 004D05C3    mov         edx,40B
 004D05C8    pop         ecx
 004D05C9    call        SendTextMessage
 004D05CE    pop         esi
 004D05CF    pop         ebx
 004D05D0    ret
*}
end;

//004D05D4
procedure TCustomStatusBar.SetSimpleText(const Value:UnicodeString);
begin
{*
 004D05D4    push        ebx
 004D05D5    push        esi
 004D05D6    mov         esi,edx
 004D05D8    mov         ebx,eax
 004D05DA    mov         eax,dword ptr [ebx+278]
 004D05E0    mov         edx,esi
 004D05E2    call        @UStrEqual
>004D05E7    je          004D05FD
 004D05E9    lea         eax,[ebx+278]
 004D05EF    mov         edx,esi
 004D05F1    call        @UStrAsg
 004D05F6    mov         eax,ebx
 004D05F8    call        TCustomStatusBar.UpdateSimpleText
 004D05FD    pop         esi
 004D05FE    pop         ebx
 004D05FF    ret
*}
end;

//004D0600
procedure TCustomStatusBar.CMBiDiModeChanged(var Message:TMessage);
begin
{*
 004D0600    push        ebx
 004D0601    push        esi
 004D0602    push        edi
 004D0603    mov         ebx,eax
 004D0605    mov         eax,ebx
 004D0607    call        TWinControl.CMBiDiModeChanged
 004D060C    mov         eax,ebx
 004D060E    call        TWinControl.HandleAllocated
 004D0613    test        al,al
>004D0615    je          004D0671
 004D0617    cmp         byte ptr [ebx+27C],0;TCustomStatusBar.FSimplePanel:Boolean
>004D061E    jne         004D066A
 004D0620    mov         eax,dword ptr [ebx+270];TCustomStatusBar.FPanels:TStatusPanels
 004D0626    mov         eax,dword ptr [eax+8];TStatusPanels.FItems:TList
 004D0629    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 004D062C    dec         edi
 004D062D    test        edi,edi
>004D062F    jl          004D065D
 004D0631    inc         edi
 004D0632    xor         esi,esi
 004D0634    mov         edx,esi
 004D0636    mov         eax,dword ptr [ebx+270];TCustomStatusBar.FPanels:TStatusPanels
 004D063C    call        TCoolBands.GetItem
 004D0641    cmp         byte ptr [eax+17],0;TCoolBand.FImageIndex:TImageIndex
>004D0645    je          004D0659
 004D0647    mov         edx,esi
 004D0649    mov         eax,dword ptr [ebx+270];TCustomStatusBar.FPanels:TStatusPanels
 004D064F    call        TCoolBands.GetItem
 004D0654    call        TStatusPanel.ParentBiDiModeChanged
 004D0659    inc         esi
 004D065A    dec         edi
>004D065B    jne         004D0634
 004D065D    mov         cl,1
 004D065F    mov         dl,1
 004D0661    mov         eax,ebx
 004D0663    call        TCustomStatusBar.UpdatePanels
>004D0668    jmp         004D0671
 004D066A    mov         eax,ebx
 004D066C    call        TCustomStatusBar.UpdateSimpleText
 004D0671    pop         edi
 004D0672    pop         esi
 004D0673    pop         ebx
 004D0674    ret
*}
end;

//004D0678
procedure TCustomStatusBar.FlipChildren(AllLevels:Boolean);
begin
{*
 004D0678    push        ebp
 004D0679    mov         ebp,esp
 004D067B    add         esp,0FFFFFFF0
 004D067E    push        ebx
 004D067F    push        esi
 004D0680    push        edi
 004D0681    mov         dword ptr [ebp-4],eax
 004D0684    mov         eax,dword ptr [ebp-4]
 004D0687    call        TWinControl.HandleAllocated
 004D068C    test        al,al
>004D068E    je          004D081F
 004D0694    mov         eax,dword ptr [ebp-4]
 004D0697    cmp         byte ptr [eax+27C],0;TCustomStatusBar.FSimplePanel:Boolean
>004D069E    jne         004D081F
 004D06A4    mov         eax,dword ptr [ebp-4]
 004D06A7    mov         eax,dword ptr [eax+270];TCustomStatusBar.FPanels:TStatusPanels
 004D06AD    mov         eax,dword ptr [eax+8];TStatusPanels.FItems:TList
 004D06B0    cmp         dword ptr [eax+8],0;TList.FCount:Integer
>004D06B4    jle         004D081F
 004D06BA    mov         eax,dword ptr [ebp-4]
 004D06BD    call        TControl.GetClientWidth
 004D06C2    mov         dword ptr [ebp-0C],eax
 004D06C5    mov         eax,dword ptr [ebp-4]
 004D06C8    mov         eax,dword ptr [eax+270];TCustomStatusBar.FPanels:TStatusPanels
 004D06CE    xor         edx,edx
 004D06D0    call        TCoolBands.GetItem
 004D06D5    mov         eax,dword ptr [eax+10];TCoolBand.FHorizontalOnly:Boolean
 004D06D8    mov         dword ptr [ebp-8],eax
 004D06DB    mov         eax,dword ptr [ebp-4]
 004D06DE    mov         eax,dword ptr [eax+270];TCustomStatusBar.FPanels:TStatusPanels
 004D06E4    mov         eax,dword ptr [eax+8];TStatusPanels.FItems:TList
 004D06E7    mov         ebx,dword ptr [eax+8];TList.FCount:Integer
 004D06EA    sub         ebx,2
 004D06ED    test        ebx,ebx
>004D06EF    jl          004D070E
 004D06F1    inc         ebx
 004D06F2    xor         esi,esi
 004D06F4    mov         eax,dword ptr [ebp-4]
 004D06F7    mov         eax,dword ptr [eax+270];TCustomStatusBar.FPanels:TStatusPanels
 004D06FD    mov         edx,esi
 004D06FF    call        TCoolBands.GetItem
 004D0704    mov         eax,dword ptr [eax+10];TCoolBand.FHorizontalOnly:Boolean
 004D0707    sub         dword ptr [ebp-0C],eax
 004D070A    inc         esi
 004D070B    dec         ebx
>004D070C    jne         004D06F4
 004D070E    mov         ecx,dword ptr [ebp-4]
 004D0711    mov         dl,1
 004D0713    mov         eax,[004CBD44];TStatusPanels
 004D0718    call        TStatusPanels.Create;TStatusPanels.Create
 004D071D    mov         dword ptr [ebp-10],eax
 004D0720    xor         eax,eax
 004D0722    push        ebp
 004D0723    push        4D07CE
 004D0728    push        dword ptr fs:[eax]
 004D072B    mov         dword ptr fs:[eax],esp
 004D072E    mov         eax,dword ptr [ebp-4]
 004D0731    mov         eax,dword ptr [eax+270];TCustomStatusBar.FPanels:TStatusPanels
 004D0737    mov         eax,dword ptr [eax+8];TStatusPanels.FItems:TList
 004D073A    mov         ebx,dword ptr [eax+8];TList.FCount:Integer
 004D073D    dec         ebx
 004D073E    test        ebx,ebx
>004D0740    jl          004D076C
 004D0742    inc         ebx
 004D0743    xor         esi,esi
 004D0745    mov         eax,dword ptr [ebp-10]
 004D0748    call        TStatusPanels.Add
 004D074D    mov         edi,eax
 004D074F    mov         eax,dword ptr [ebp-4]
 004D0752    mov         eax,dword ptr [eax+270];TCustomStatusBar.FPanels:TStatusPanels
 004D0758    mov         edx,esi
 004D075A    call        TCoolBands.GetItem
 004D075F    mov         edx,eax
 004D0761    mov         eax,edi
 004D0763    mov         ecx,dword ptr [eax]
 004D0765    call        dword ptr [ecx+8];TStatusPanel.Assign
 004D0768    inc         esi
 004D0769    dec         ebx
>004D076A    jne         004D0745
 004D076C    mov         eax,dword ptr [ebp-4]
 004D076F    mov         eax,dword ptr [eax+270];TCustomStatusBar.FPanels:TStatusPanels
 004D0775    mov         eax,dword ptr [eax+8];TStatusPanels.FItems:TList
 004D0778    mov         ebx,dword ptr [eax+8];TList.FCount:Integer
 004D077B    dec         ebx
 004D077C    test        ebx,ebx
>004D077E    jl          004D07B8
 004D0780    inc         ebx
 004D0781    xor         esi,esi
 004D0783    mov         eax,dword ptr [ebp-4]
 004D0786    mov         eax,dword ptr [eax+270];TCustomStatusBar.FPanels:TStatusPanels
 004D078C    mov         eax,dword ptr [eax+8];TStatusPanels.FItems:TList
 004D078F    mov         edx,dword ptr [eax+8];TList.FCount:Integer
 004D0792    sub         edx,esi
 004D0794    dec         edx
 004D0795    mov         eax,dword ptr [ebp-10]
 004D0798    call        TCoolBands.GetItem
 004D079D    push        eax
 004D079E    mov         eax,dword ptr [ebp-4]
 004D07A1    mov         eax,dword ptr [eax+270];TCustomStatusBar.FPanels:TStatusPanels
 004D07A7    mov         edx,esi
 004D07A9    call        TCoolBands.GetItem
 004D07AE    pop         edx
 004D07AF    mov         ecx,dword ptr [eax]
 004D07B1    call        dword ptr [ecx+8]
 004D07B4    inc         esi
 004D07B5    dec         ebx
>004D07B6    jne         004D0783
 004D07B8    xor         eax,eax
 004D07BA    pop         edx
 004D07BB    pop         ecx
 004D07BC    pop         ecx
 004D07BD    mov         dword ptr fs:[eax],edx
 004D07C0    push        4D07D5
 004D07C5    mov         eax,dword ptr [ebp-10]
 004D07C8    call        TObject.Free
 004D07CD    ret
>004D07CE    jmp         @HandleFinally
>004D07D3    jmp         004D07C5
 004D07D5    mov         eax,dword ptr [ebp-4]
 004D07D8    mov         ebx,dword ptr [eax+270];TCustomStatusBar.FPanels:TStatusPanels
 004D07DE    mov         eax,dword ptr [ebx+8];TStatusPanels.FItems:TList
 004D07E1    mov         esi,dword ptr [eax+8];TList.FCount:Integer
 004D07E4    cmp         esi,1
>004D07E7    jle         004D0813
 004D07E9    mov         edx,esi
 004D07EB    dec         edx
 004D07EC    mov         eax,ebx
 004D07EE    call        TCoolBands.GetItem
 004D07F3    mov         edx,dword ptr [ebp-8]
 004D07F6    call        TStatusPanel.SetWidth
 004D07FB    mov         eax,dword ptr [ebp-4]
 004D07FE    mov         eax,dword ptr [eax+270];TCustomStatusBar.FPanels:TStatusPanels
 004D0804    xor         edx,edx
 004D0806    call        TCoolBands.GetItem
 004D080B    mov         edx,dword ptr [ebp-0C]
 004D080E    call        TStatusPanel.SetWidth
 004D0813    mov         cl,1
 004D0815    mov         dl,1
 004D0817    mov         eax,dword ptr [ebp-4]
 004D081A    call        TCustomStatusBar.UpdatePanels
 004D081F    pop         edi
 004D0820    pop         esi
 004D0821    pop         ebx
 004D0822    mov         esp,ebp
 004D0824    pop         ebp
 004D0825    ret
*}
end;

//004D0828
procedure TCustomStatusBar.SetSizeGrip(Value:Boolean);
begin
{*
 004D0828    cmp         dl,byte ptr [eax+27D]
>004D082E    je          004D083D
 004D0830    mov         byte ptr [eax+27D],dl
 004D0836    mov         dl,1
 004D0838    call        TCustomStatusBar.ValidateSizeGrip
 004D083D    ret
*}
end;

//004D0840
procedure TCustomStatusBar.SyncToSystemFont;
begin
{*
 004D0840    push        ebx
 004D0841    mov         ebx,eax
 004D0843    cmp         byte ptr [ebx+27F],0
>004D084A    je          004D086A
 004D084C    mov         eax,[0078DB00];^Screen:TScreen
 004D0851    mov         eax,dword ptr [eax]
 004D0853    mov         edx,dword ptr [eax+7C]
 004D0856    mov         eax,ebx
 004D0858    call        TControl.SetFont
 004D085D    mov         edx,0FF000012
 004D0862    mov         eax,dword ptr [ebx+64]
 004D0865    call        TFont.SetColor
 004D086A    pop         ebx
 004D086B    ret
*}
end;

//004D086C
procedure TCustomStatusBar.UpdatePanel(Index:Integer; Repaint:Boolean);
begin
{*
 004D086C    push        ebp
 004D086D    mov         ebp,esp
 004D086F    add         esp,0FFFFFFE8
 004D0872    push        ebx
 004D0873    push        esi
 004D0874    push        edi
 004D0875    xor         ebx,ebx
 004D0877    mov         dword ptr [ebp-4],ebx
 004D087A    mov         byte ptr [ebp-5],cl
 004D087D    mov         ebx,edx
 004D087F    mov         esi,eax
 004D0881    xor         eax,eax
 004D0883    push        ebp
 004D0884    push        4D09CC
 004D0889    push        dword ptr fs:[eax]
 004D088C    mov         dword ptr fs:[eax],esp
 004D088F    mov         eax,esi
 004D0891    call        TWinControl.HandleAllocated
 004D0896    test        al,al
>004D0898    je          004D09B6
 004D089E    mov         edx,ebx
 004D08A0    mov         eax,dword ptr [esi+270]
 004D08A6    call        TCoolBands.GetItem
 004D08AB    mov         ebx,eax
 004D08AD    cmp         byte ptr [ebp-5],0
>004D08B1    jne         004D08EF
 004D08B3    mov         byte ptr [ebx+19],1
 004D08B7    lea         eax,[ebp-18]
 004D08BA    push        eax
 004D08BB    push        0
 004D08BD    mov         eax,ebx
 004D08BF    call        TCollectionItem.GetIndex
 004D08C4    push        eax
 004D08C5    mov         eax,esi
 004D08C7    call        TWinControl.GetHandle
 004D08CC    mov         edx,40A
 004D08D1    pop         ecx
 004D08D2    call        SendGetStructMessage
 004D08D7    push        0FF
 004D08D9    lea         eax,[ebp-18]
 004D08DC    push        eax
 004D08DD    mov         eax,esi
 004D08DF    call        TWinControl.GetHandle
 004D08E4    push        eax
 004D08E5    call        user32.InvalidateRect
>004D08EA    jmp         004D09B6
 004D08EF    cmp         byte ptr [ebx+19],0
>004D08F3    je          004D09B6
 004D08F9    mov         byte ptr [ebx+19],0
 004D08FD    xor         edi,edi
 004D08FF    movzx       eax,byte ptr [ebx+15]
 004D0903    sub         al,1
>004D0905    jb          004D090D
 004D0907    dec         al
>004D0909    je          004D0914
>004D090B    jmp         004D0919
 004D090D    mov         edi,100
>004D0912    jmp         004D0919
 004D0914    mov         edi,200
 004D0919    mov         eax,ebx
 004D091B    call        TStatusPanel.UseRightToLeftReading
 004D0920    test        al,al
>004D0922    je          004D092A
 004D0924    or          edi,400
 004D092A    cmp         byte ptr [ebx+18],1
>004D092E    jne         004D0936
 004D0930    or          edi,1000
 004D0936    lea         eax,[ebp-4]
 004D0939    mov         edx,dword ptr [ebx+0C]
 004D093C    call        @UStrLAsg
 004D0941    mov         eax,ebx
 004D0943    call        TStatusPanel.UseRightToLeftAlignment
 004D0948    test        al,al
>004D094A    je          004D0964
 004D094C    mov         eax,ebx
 004D094E    call        TStatusPanel.UseRightToLeftAlignment
 004D0953    push        eax
 004D0954    lea         edx,[ebp-4]
 004D0957    movzx       ecx,byte ptr [ebx+14]
 004D095B    mov         eax,esi
 004D095D    call        TCustomStatusBar.DoRightToLeftAlignment
>004D0962    jmp         004D0996
 004D0964    movzx       eax,byte ptr [ebx+14]
 004D0968    dec         al
>004D096A    je          004D0984
 004D096C    dec         al
>004D096E    jne         004D0996
 004D0970    lea         edx,[ebp-4]
 004D0973    mov         ecx,1
 004D0978    mov         eax,4D09E8;'	'
 004D097D    call        @UStrInsert
>004D0982    jmp         004D0996
 004D0984    lea         edx,[ebp-4]
 004D0987    mov         ecx,1
 004D098C    mov         eax,4D09F8;'		'
 004D0991    call        @UStrInsert
 004D0996    mov         eax,dword ptr [ebp-4]
 004D0999    push        eax
 004D099A    mov         eax,ebx
 004D099C    call        TCollectionItem.GetIndex
 004D09A1    or          edi,eax
 004D09A3    push        edi
 004D09A4    mov         eax,esi
 004D09A6    call        TWinControl.GetHandle
 004D09AB    mov         edx,40B
 004D09B0    pop         ecx
 004D09B1    call        SendTextMessage
 004D09B6    xor         eax,eax
 004D09B8    pop         edx
 004D09B9    pop         ecx
 004D09BA    pop         ecx
 004D09BB    mov         dword ptr fs:[eax],edx
 004D09BE    push        4D09D3
 004D09C3    lea         eax,[ebp-4]
 004D09C6    call        @UStrClr
 004D09CB    ret
>004D09CC    jmp         @HandleFinally
>004D09D1    jmp         004D09C3
 004D09D3    pop         edi
 004D09D4    pop         esi
 004D09D5    pop         ebx
 004D09D6    mov         esp,ebp
 004D09D8    pop         ebp
 004D09D9    ret
*}
end;

//004D0A00
procedure TCustomStatusBar.UpdatePanels(UpdateRects:Boolean; UpdateText:Boolean);
begin
{*
 004D0A00    push        ebx
 004D0A01    push        esi
 004D0A02    push        edi
 004D0A03    push        ebp
 004D0A04    add         esp,0FFFFFDF4
 004D0A0A    mov         byte ptr [esp],cl
 004D0A0D    mov         ebx,edx
 004D0A0F    mov         esi,eax
 004D0A11    mov         eax,esi
 004D0A13    call        TWinControl.HandleAllocated
 004D0A18    test        al,al
>004D0A1A    je          004D0B0A
 004D0A20    mov         eax,dword ptr [esi+270]
 004D0A26    mov         eax,dword ptr [eax+8]
 004D0A29    mov         eax,dword ptr [eax+8]
 004D0A2C    mov         dword ptr [esp+4],eax
 004D0A30    test        bl,bl
>004D0A32    je          004D0AED
 004D0A38    cmp         dword ptr [esp+4],80
>004D0A40    jle         004D0A4A
 004D0A42    mov         dword ptr [esp+4],80
 004D0A4A    cmp         dword ptr [esp+4],0
>004D0A4F    jne         004D0A8B
 004D0A51    mov         dword ptr [esp+0C],0FFFFFFFF
 004D0A59    lea         eax,[esp+0C]
 004D0A5D    push        eax
 004D0A5E    mov         eax,esi
 004D0A60    call        TWinControl.GetHandle
 004D0A65    mov         ecx,1
 004D0A6A    mov         edx,404
 004D0A6F    call        SendStructMessage
 004D0A74    push        0
 004D0A76    mov         eax,esi
 004D0A78    call        TWinControl.GetHandle
 004D0A7D    xor         ecx,ecx
 004D0A7F    mov         edx,40B
 004D0A84    call        SendTextMessage
>004D0A89    jmp         004D0AED
 004D0A8B    xor         eax,eax
 004D0A8D    mov         dword ptr [esp+8],eax
 004D0A91    mov         ebx,dword ptr [esp+4]
 004D0A95    sub         ebx,2
 004D0A98    test        ebx,ebx
>004D0A9A    jl          004D0AC5
 004D0A9C    inc         ebx
 004D0A9D    xor         edi,edi
 004D0A9F    lea         ebp,[esp+0C]
 004D0AA3    mov         edx,edi
 004D0AA5    mov         eax,dword ptr [esi+270]
 004D0AAB    call        TCoolBands.GetItem
 004D0AB0    mov         eax,dword ptr [eax+10]
 004D0AB3    add         dword ptr [esp+8],eax
 004D0AB7    mov         eax,dword ptr [esp+8]
 004D0ABB    mov         dword ptr [ebp],eax
 004D0ABE    inc         edi
 004D0ABF    add         ebp,4
 004D0AC2    dec         ebx
>004D0AC3    jne         004D0AA3
 004D0AC5    mov         eax,dword ptr [esp+4]
 004D0AC9    mov         dword ptr [esp+eax*4+8],0FFFFFFFF
 004D0AD1    lea         eax,[esp+0C]
 004D0AD5    push        eax
 004D0AD6    mov         eax,dword ptr [esp+8]
 004D0ADA    push        eax
 004D0ADB    push        404
 004D0AE0    mov         eax,esi
 004D0AE2    call        TWinControl.GetHandle
 004D0AE7    push        eax
 004D0AE8    call        user32.SendMessageW
 004D0AED    mov         ebx,dword ptr [esp+4]
 004D0AF1    dec         ebx
 004D0AF2    test        ebx,ebx
>004D0AF4    jl          004D0B0A
 004D0AF6    inc         ebx
 004D0AF7    xor         edi,edi
 004D0AF9    movzx       ecx,byte ptr [esp]
 004D0AFD    mov         edx,edi
 004D0AFF    mov         eax,esi
 004D0B01    call        TCustomStatusBar.UpdatePanel
 004D0B06    inc         edi
 004D0B07    dec         ebx
>004D0B08    jne         004D0AF9
 004D0B0A    add         esp,20C
 004D0B10    pop         ebp
 004D0B11    pop         edi
 004D0B12    pop         esi
 004D0B13    pop         ebx
 004D0B14    ret
*}
end;

//004D0B18
procedure TCustomStatusBar.CMWinIniChange(var Message:TWMWinIniChange);
begin
{*
 004D0B18    push        ebx
 004D0B19    push        esi
 004D0B1A    mov         ebx,edx
 004D0B1C    mov         esi,eax
 004D0B1E    mov         edx,ebx
 004D0B20    mov         eax,esi
 004D0B22    call        TWinControl.CMWinIniChange
 004D0B27    mov         eax,dword ptr [ebx+4]
 004D0B2A    test        eax,eax
>004D0B2C    je          004D0B33
 004D0B2E    cmp         eax,2A
>004D0B31    jne         004D0B3A
 004D0B33    mov         eax,esi
 004D0B35    call        TCustomStatusBar.SyncToSystemFont
 004D0B3A    pop         esi
 004D0B3B    pop         ebx
 004D0B3C    ret
*}
end;

//004D0B40
{*procedure TCustomStatusBar.sub_004D0B40(?:?);
begin
 004D0B40    push        ebp
 004D0B41    mov         ebp,esp
 004D0B43    add         esp,0FFFFFFF0
 004D0B46    push        esi
 004D0B47    mov         dword ptr [ebp-8],edx
 004D0B4A    mov         dword ptr [ebp-4],eax
 004D0B4D    mov         eax,dword ptr [ebp-8]
 004D0B50    mov         eax,dword ptr [eax+8]
 004D0B53    mov         dword ptr [ebp-10],eax
 004D0B56    mov         eax,dword ptr [ebp-10]
 004D0B59    mov         eax,dword ptr [eax+18]
 004D0B5C    push        eax
 004D0B5D    call        gdi32.SaveDC
 004D0B62    mov         dword ptr [ebp-0C],eax
 004D0B65    mov         eax,dword ptr [ebp-4]
 004D0B68    mov         eax,dword ptr [eax+274];TCustomStatusBar.FCanvas:TCanvas
 004D0B6E    call        TCustomCanvas.Lock
 004D0B73    xor         eax,eax
 004D0B75    push        ebp
 004D0B76    push        4D0C36
 004D0B7B    push        dword ptr fs:[eax]
 004D0B7E    mov         dword ptr fs:[eax],esp
 004D0B81    mov         eax,dword ptr [ebp-10]
 004D0B84    mov         edx,dword ptr [eax+18]
 004D0B87    mov         eax,dword ptr [ebp-4]
 004D0B8A    mov         eax,dword ptr [eax+274];TCustomStatusBar.FCanvas:TCanvas
 004D0B90    call        TCanvas.SetHandle
 004D0B95    mov         eax,dword ptr [ebp-4]
 004D0B98    mov         edx,dword ptr [eax+64];TCustomStatusBar.FFont:TFont
 004D0B9B    mov         eax,dword ptr [ebp-4]
 004D0B9E    mov         eax,dword ptr [eax+274];TCustomStatusBar.FCanvas:TCanvas
 004D0BA4    call        TCanvas.SetFont
 004D0BA9    mov         eax,dword ptr [ebp-4]
 004D0BAC    mov         eax,dword ptr [eax+274];TCustomStatusBar.FCanvas:TCanvas
 004D0BB2    mov         eax,dword ptr [eax+48];TCanvas.FBrush:TBrush
 004D0BB5    mov         edx,0FF00000F
 004D0BBA    call        TBrush.SetColor
 004D0BBF    mov         eax,dword ptr [ebp-4]
 004D0BC2    mov         eax,dword ptr [eax+274];TCustomStatusBar.FCanvas:TCanvas
 004D0BC8    mov         eax,dword ptr [eax+48];TCanvas.FBrush:TBrush
 004D0BCB    xor         edx,edx
 004D0BCD    call        TBrush.SetStyle
 004D0BD2    mov         eax,dword ptr [ebp-10]
 004D0BD5    mov         edx,dword ptr [eax+8]
 004D0BD8    mov         eax,dword ptr [ebp-4]
 004D0BDB    mov         eax,dword ptr [eax+270];TCustomStatusBar.FPanels:TStatusPanels
 004D0BE1    call        TCoolBands.GetItem
 004D0BE6    mov         edx,eax
 004D0BE8    mov         eax,dword ptr [ebp-10]
 004D0BEB    lea         ecx,[eax+1C]
 004D0BEE    mov         eax,dword ptr [ebp-4]
 004D0BF1    mov         si,0FFAF
 004D0BF5    call        @CallDynaInst;TCustomStatusBar.DrawPanel
 004D0BFA    xor         eax,eax
 004D0BFC    pop         edx
 004D0BFD    pop         ecx
 004D0BFE    pop         ecx
 004D0BFF    mov         dword ptr fs:[eax],edx
 004D0C02    push        4D0C3D
 004D0C07    mov         eax,dword ptr [ebp-4]
 004D0C0A    mov         eax,dword ptr [eax+274];TCustomStatusBar.FCanvas:TCanvas
 004D0C10    xor         edx,edx
 004D0C12    call        TCanvas.SetHandle
 004D0C17    mov         eax,dword ptr [ebp-4]
 004D0C1A    mov         eax,dword ptr [eax+274];TCustomStatusBar.FCanvas:TCanvas
 004D0C20    call        TCustomCanvas.Unlock
 004D0C25    mov         eax,dword ptr [ebp-0C]
 004D0C28    push        eax
 004D0C29    mov         eax,dword ptr [ebp-10]
 004D0C2C    mov         eax,dword ptr [eax+18]
 004D0C2F    push        eax
 004D0C30    call        gdi32.RestoreDC
 004D0C35    ret
>004D0C36    jmp         @HandleFinally
>004D0C3B    jmp         004D0C07
 004D0C3D    mov         eax,dword ptr [ebp-8]
 004D0C40    mov         dword ptr [eax+0C],1
 004D0C47    pop         esi
 004D0C48    mov         esp,ebp
 004D0C4A    pop         ebp
 004D0C4B    ret
end;*}

//004D0C4C
procedure TCustomStatusBar.WMGetTextLength(var Message:TWMGetTextLength);
begin
{*
 004D0C4C    push        esi
 004D0C4D    mov         esi,eax
 004D0C4F    cmp         byte ptr [esi+27C],0
>004D0C56    je          004D0C6C
 004D0C58    mov         eax,dword ptr [esi+278]
 004D0C5E    test        eax,eax
>004D0C60    je          004D0C67
 004D0C62    sub         eax,4
 004D0C65    mov         eax,dword ptr [eax]
 004D0C67    mov         dword ptr [edx+0C],eax
 004D0C6A    pop         esi
 004D0C6B    ret
 004D0C6C    mov         eax,esi
 004D0C6E    mov         ecx,dword ptr [eax]
 004D0C70    call        dword ptr [ecx-10]
 004D0C73    pop         esi
 004D0C74    ret
*}
end;

//004D0C78
procedure TCustomStatusBar.WMPaint(var Message:TWMPaint);
begin
{*
 004D0C78    push        ebx
 004D0C79    push        esi
 004D0C7A    mov         esi,edx
 004D0C7C    mov         ebx,eax
 004D0C7E    mov         cl,1
 004D0C80    xor         edx,edx
 004D0C82    mov         eax,ebx
 004D0C84    call        TCustomStatusBar.UpdatePanels
 004D0C89    mov         edx,esi
 004D0C8B    mov         eax,ebx
 004D0C8D    call        TWinControl.WMPaint
 004D0C92    pop         esi
 004D0C93    pop         ebx
 004D0C94    ret
*}
end;

//004D0C98
procedure TCustomStatusBar.WMSize(var Message:TWMSize);
begin
{*
 004D0C98    push        esi
 004D0C99    push        edi
 004D0C9A    mov         edi,eax
 004D0C9C    test        byte ptr [edi+1C],1
>004D0CA0    jne         004D0CAD
 004D0CA2    mov         eax,edi
 004D0CA4    mov         si,0FFD0
 004D0CA8    call        @CallDynaInst
 004D0CAD    mov         eax,edi
 004D0CAF    mov         edx,dword ptr [eax]
 004D0CB1    call        dword ptr [edx+94]
 004D0CB7    pop         edi
 004D0CB8    pop         esi
 004D0CB9    ret
*}
end;

//004D0CBC
function TCustomStatusBar.IsFontStored(Value:TFont):Boolean;
begin
{*
 004D0CBC    cmp         byte ptr [eax+27F],0
>004D0CC3    jne         004D0CD1
 004D0CC5    cmp         byte ptr [eax+5B],0
>004D0CC9    jne         004D0CD1
 004D0CCB    cmp         byte ptr [eax+58],0
>004D0CCF    je          004D0CD4
 004D0CD1    xor         eax,eax
 004D0CD3    ret
 004D0CD4    mov         al,1
 004D0CD6    ret
*}
end;

//004D0CD8
procedure TCustomStatusBar.SetUseSystemFont(const Value:Boolean);
begin
{*
 004D0CD8    push        ebx
 004D0CD9    mov         ebx,eax
 004D0CDB    cmp         dl,byte ptr [ebx+27F]
>004D0CE1    je          004D0D03
 004D0CE3    mov         byte ptr [ebx+27F],dl
 004D0CE9    test        dl,dl
>004D0CEB    je          004D0D03
 004D0CED    cmp         byte ptr [ebx+5B],0
>004D0CF1    je          004D0CFC
 004D0CF3    xor         edx,edx
 004D0CF5    mov         eax,ebx
 004D0CF7    call        TControl.SetParentFont
 004D0CFC    mov         eax,ebx
 004D0CFE    call        TCustomStatusBar.SyncToSystemFont
 004D0D03    pop         ebx
 004D0D04    ret
*}
end;

//004D0D08
procedure TCustomStatusBar.CMColorChanged(var Message:TMessage);
begin
{*
 004D0D08    push        ebx
 004D0D09    mov         ebx,eax
 004D0D0B    mov         eax,ebx
 004D0D0D    call        TWinControl.CMColorChanged
 004D0D12    mov         eax,ebx
 004D0D14    call        TWinControl.RecreateWnd
 004D0D19    pop         ebx
 004D0D1A    ret
*}
end;

//004D0D1C
procedure TCustomStatusBar.CMParentFontChanged(var Message:TCMParentFontChanged);
begin
{*
 004D0D1C    push        ebx
 004D0D1D    mov         ebx,eax
 004D0D1F    mov         eax,ebx
 004D0D21    call        TControl.CMParentFontChanged
 004D0D26    cmp         byte ptr [ebx+27F],0
>004D0D2D    je          004D0D3C
 004D0D2F    cmp         byte ptr [ebx+5B],0
>004D0D33    je          004D0D3C
 004D0D35    mov         byte ptr [ebx+27F],0
 004D0D3C    pop         ebx
 004D0D3D    ret
*}
end;

//004D0D40
procedure TCustomStatusBar.ExecuteAction(Action:TBasicAction);
begin
{*
 004D0D40    push        ebx
 004D0D41    push        esi
 004D0D42    mov         esi,edx
 004D0D44    mov         ebx,eax
 004D0D46    cmp         byte ptr [ebx+280],0;TCustomStatusBar.FAutoHint:Boolean
>004D0D4D    je          004D0DBB
 004D0D4F    test        byte ptr [ebx+1C],10;TCustomStatusBar.FComponentState:TComponentState
>004D0D53    jne         004D0DBB
 004D0D55    mov         eax,esi
 004D0D57    mov         edx,dword ptr ds:[4DE148];THintAction
 004D0D5D    call        @IsClass
 004D0D62    test        al,al
>004D0D64    je          004D0DBB
 004D0D66    mov         eax,ebx
 004D0D68    mov         edx,dword ptr [eax]
 004D0D6A    call        dword ptr [edx+0F4];TCustomStatusBar.DoHint
 004D0D70    test        al,al
>004D0D72    jne         004D0DBB
 004D0D74    cmp         byte ptr [ebx+27C],0;TCustomStatusBar.FSimplePanel:Boolean
>004D0D7B    je          004D0D81
 004D0D7D    mov         al,1
>004D0D7F    jmp         004D0D91
 004D0D81    mov         eax,dword ptr [ebx+270];TCustomStatusBar.FPanels:TStatusPanels
 004D0D87    mov         eax,dword ptr [eax+8];TStatusPanels.FItems:TList
 004D0D8A    cmp         dword ptr [eax+8],0;TList.FCount:Integer
 004D0D8E    sete        al
 004D0D91    test        al,al
>004D0D93    je          004D0DA1
 004D0D95    mov         edx,dword ptr [esi+7C]
 004D0D98    mov         eax,ebx
 004D0D9A    call        TCustomStatusBar.SetSimpleText
>004D0D9F    jmp         004D0DB6
 004D0DA1    xor         edx,edx
 004D0DA3    mov         eax,dword ptr [ebx+270];TCustomStatusBar.FPanels:TStatusPanels
 004D0DA9    call        TCoolBands.GetItem
 004D0DAE    mov         edx,dword ptr [esi+7C]
 004D0DB1    call        TStatusPanel.SetText
 004D0DB6    mov         al,1
 004D0DB8    pop         esi
 004D0DB9    pop         ebx
 004D0DBA    ret
 004D0DBB    mov         edx,esi
 004D0DBD    mov         eax,ebx
 004D0DBF    call        TComponent.ExecuteAction
 004D0DC4    pop         esi
 004D0DC5    pop         ebx
 004D0DC6    ret
*}
end;

//004D0DC8
procedure TCustomStatusBar.CMSysColorChange(var Message:TMessage);
begin
{*
 004D0DC8    push        ebx
 004D0DC9    mov         ebx,eax
 004D0DCB    mov         eax,ebx
 004D0DCD    call        TWinControl.CMSysColorChange
 004D0DD2    mov         eax,ebx
 004D0DD4    call        TWinControl.RecreateWnd
 004D0DD9    pop         ebx
 004D0DDA    ret
*}
end;

//004D0DDC
procedure TCustomStatusBar.CMSysFontChanged(var Message:TMessage);
begin
{*
 004D0DDC    push        ebx
 004D0DDD    mov         ebx,eax
 004D0DDF    mov         eax,ebx
 004D0DE1    call        TWinControl.CMSysFontChanged
 004D0DE6    mov         eax,ebx
 004D0DE8    call        TCustomStatusBar.SyncToSystemFont
 004D0DED    pop         ebx
 004D0DEE    ret
*}
end;

//004D0DF0
procedure TCustomStatusBar.ChangeScale(M:Integer; D:Integer);
begin
{*
 004D0DF0    push        ebx
 004D0DF1    mov         ebx,ecx
 004D0DF3    cmp         byte ptr [eax+27F],0
>004D0DFA    je          004D0E09
 004D0DFC    movzx       ecx,byte ptr ds:[4D0E14]
 004D0E03    mov         byte ptr [eax+88],cl
 004D0E09    mov         ecx,ebx
 004D0E0B    call        TWinControl.ChangeScale
 004D0E10    pop         ebx
 004D0E11    ret
*}
end;

//004D0E18
procedure TCustomStatusBar.SetBounds(ALeft:Integer; ATop:Integer; AHeight:Integer; AWidth:Integer);
begin
{*
 004D0E18    push        ebp
 004D0E19    mov         ebp,esp
 004D0E1B    push        ebx
 004D0E1C    mov         ebx,eax
 004D0E1E    mov         eax,dword ptr [ebp+0C]
 004D0E21    push        eax
 004D0E22    mov         eax,dword ptr [ebp+8]
 004D0E25    push        eax
 004D0E26    mov         eax,ebx
 004D0E28    call        TWinControl.SetBounds
 004D0E2D    mov         dl,1
 004D0E2F    mov         eax,ebx
 004D0E31    call        TCustomStatusBar.ValidateSizeGrip
 004D0E36    pop         ebx
 004D0E37    pop         ebp
 004D0E38    ret         8
*}
end;

//004D0E3C
procedure TCustomStatusBar.SetParent(AParent:TWinControl);
begin
{*
 004D0E3C    call        TWinControl.SetParent
 004D0E41    ret
*}
end;

//004D0E44
procedure TCustomStatusBar.ValidateSizeGrip(ARecreate:Boolean);
begin
{*
 004D0E44    push        ebx
 004D0E45    push        esi
 004D0E46    push        edi
 004D0E47    add         esp,0FFFFFFEC
 004D0E4A    mov         byte ptr [esp],dl
 004D0E4D    mov         edi,eax
 004D0E4F    xor         ebx,ebx
 004D0E51    mov         dl,1
 004D0E53    mov         eax,edi
 004D0E55    call        GetParentForm
 004D0E5A    mov         esi,eax
 004D0E5C    test        esi,esi
>004D0E5E    je          004D0EAF
 004D0E60    movzx       eax,byte ptr [esi+299]
 004D0E67    sub         al,2
>004D0E69    je          004D0E6F
 004D0E6B    sub         al,3
>004D0E6D    jne         004D0EAF
 004D0E6F    mov         eax,dword ptr [edi+48]
 004D0E72    mov         dword ptr [esp+0C],eax
 004D0E76    mov         eax,dword ptr [edi+4C]
 004D0E79    mov         dword ptr [esp+10],eax
 004D0E7D    lea         eax,[esp+4]
 004D0E81    push        eax
 004D0E82    lea         edx,[esp+10]
 004D0E86    mov         ecx,esi
 004D0E88    mov         eax,edi
 004D0E8A    call        TControl.ClientToParent
 004D0E8F    mov         eax,esi
 004D0E91    call        TControl.GetClientWidth
 004D0E96    cmp         eax,dword ptr [esp+4]
>004D0E9A    jne         004D0EA9
 004D0E9C    mov         eax,esi
 004D0E9E    call        TControl.GetClientHeight
 004D0EA3    cmp         eax,dword ptr [esp+8]
>004D0EA7    je          004D0EAD
 004D0EA9    xor         ebx,ebx
>004D0EAB    jmp         004D0EAF
 004D0EAD    mov         bl,1
 004D0EAF    cmp         bl,byte ptr [edi+27E]
>004D0EB5    je          004D0ECA
 004D0EB7    mov         byte ptr [edi+27E],bl
 004D0EBD    cmp         byte ptr [esp],0
>004D0EC1    je          004D0ECA
 004D0EC3    mov         eax,edi
 004D0EC5    call        TWinControl.RecreateWnd
 004D0ECA    add         esp,14
 004D0ECD    pop         edi
 004D0ECE    pop         esi
 004D0ECF    pop         ebx
 004D0ED0    ret
*}
end;

//004D0ED4
function TCustomStatusBar.CreatePanel:TStatusPanel;
begin
{*
 004D0ED4    push        ebx
 004D0ED5    push        ecx
 004D0ED6    mov         ebx,eax
 004D0ED8    mov         eax,ebx
 004D0EDA    mov         edx,dword ptr [eax]
 004D0EDC    call        dword ptr [edx+0F8]
 004D0EE2    mov         dword ptr [esp],eax
 004D0EE5    cmp         word ptr [ebx+29A],0
>004D0EED    je          004D0EFF
 004D0EEF    mov         ecx,esp
 004D0EF1    mov         edx,ebx
 004D0EF3    mov         eax,dword ptr [ebx+29C]
 004D0EF9    call        dword ptr [ebx+298]
 004D0EFF    mov         ecx,dword ptr [ebx+270]
 004D0F05    mov         dl,1
 004D0F07    mov         eax,dword ptr [esp]
 004D0F0A    call        dword ptr [eax+1C]
 004D0F0D    pop         edx
 004D0F0E    pop         ebx
 004D0F0F    ret
*}
end;

//004D0F10
function TCustomStatusBar.CreatePanels:TStatusPanels;
begin
{*
 004D0F10    mov         ecx,eax
 004D0F12    mov         dl,1
 004D0F14    mov         eax,[004CBD44];TStatusPanels
 004D0F19    call        TStatusPanels.Create
 004D0F1E    ret
*}
end;

//004D0F20
constructor TStatusPanel.Create;
begin
{*
 004D0F20    mov         eax,[004CB974];TStatusPanel
 004D0F25    ret
*}
end;

//004D0F28
procedure TCustomStatusBar.WMEraseBkGnd(var Message:TWMEraseBkgnd);
begin
{*
 004D0F28    push        ebx
 004D0F29    push        esi
 004D0F2A    add         esp,0FFFFFFE4
 004D0F2D    mov         esi,edx
 004D0F2F    mov         ebx,eax
 004D0F31    call        ThemeServices
 004D0F36    call        TThemeServices.GetThemesEnabled
 004D0F3B    test        al,al
>004D0F3D    je          004D0F79
 004D0F3F    call        ThemeServices
 004D0F44    mov         ecx,esp
 004D0F46    mov         dl,1
 004D0F48    call        TThemeServices.GetElementDetails
 004D0F4D    lea         edx,[esp+0C]
 004D0F51    mov         eax,ebx
 004D0F53    mov         ecx,dword ptr [eax]
 004D0F55    call        dword ptr [ecx+54]
 004D0F58    lea         eax,[esp+0C]
 004D0F5C    push        eax
 004D0F5D    push        0
 004D0F5F    call        ThemeServices
 004D0F64    mov         edx,dword ptr [esi+4]
 004D0F67    lea         ecx,[esp+8]
 004D0F6B    call        TThemeServices.DrawElement
 004D0F70    mov         dword ptr [esi+0C],1
>004D0F77    jmp         004D0F82
 004D0F79    mov         edx,esi
 004D0F7B    mov         eax,ebx
 004D0F7D    call        TWinControl.WMEraseBkgnd
 004D0F82    add         esp,1C
 004D0F85    pop         esi
 004D0F86    pop         ebx
 004D0F87    ret
*}
end;

//004D0F88
constructor TConversion.Create();
begin
{*
 004D0F88    push        ebx
 004D0F89    push        esi
 004D0F8A    test        dl,dl
>004D0F8C    je          004D0F96
 004D0F8E    add         esp,0FFFFFFF0
 004D0F91    call        @ClassCreate
 004D0F96    mov         ebx,edx
 004D0F98    mov         esi,eax
 004D0F9A    xor         edx,edx
 004D0F9C    mov         eax,esi
 004D0F9E    call        TObject.Create
 004D0FA3    mov         eax,esi
 004D0FA5    test        bl,bl
>004D0FA7    je          004D0FB8
 004D0FA9    call        @AfterConstruction
 004D0FAE    pop         dword ptr fs:[0]
 004D0FB5    add         esp,0C
 004D0FB8    mov         eax,esi
 004D0FBA    pop         esi
 004D0FBB    pop         ebx
 004D0FBC    ret
*}
end;

//004D0FC0
procedure TConversion.ConvertReadStream(Stream:TStream; Buffer:TBytes; BufSize:Integer);
begin
{*
 004D0FC0    push        ebp
 004D0FC1    mov         ebp,esp
 004D0FC3    push        ecx
 004D0FC4    push        ebx
 004D0FC5    mov         dword ptr [ebp-4],ecx
 004D0FC8    mov         ebx,edx
 004D0FCA    mov         eax,dword ptr [ebp-4]
 004D0FCD    call        @DynArrayAddRef
 004D0FD2    xor         eax,eax
 004D0FD4    push        ebp
 004D0FD5    push        4D100B
 004D0FDA    push        dword ptr fs:[eax]
 004D0FDD    mov         dword ptr fs:[eax],esp
 004D0FE0    mov         edx,dword ptr [ebp-4]
 004D0FE3    mov         ecx,dword ptr [ebp+8]
 004D0FE6    mov         eax,ebx
 004D0FE8    mov         ebx,dword ptr [eax]
 004D0FEA    call        dword ptr [ebx+0C]
 004D0FED    mov         ebx,eax
 004D0FEF    xor         eax,eax
 004D0FF1    pop         edx
 004D0FF2    pop         ecx
 004D0FF3    pop         ecx
 004D0FF4    mov         dword ptr fs:[eax],edx
 004D0FF7    push        4D1012
 004D0FFC    lea         eax,[ebp-4]
 004D0FFF    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 004D1005    call        @DynArrayClear
 004D100A    ret
>004D100B    jmp         @HandleFinally
>004D1010    jmp         004D0FFC
 004D1012    mov         eax,ebx
 004D1014    pop         ebx
 004D1015    pop         ecx
 004D1016    pop         ebp
 004D1017    ret         4
*}
end;

//004D101C
procedure TConversion.ConvertWriteStream(Stream:TStream; Buffer:TBytes; BufSize:Integer);
begin
{*
 004D101C    push        ebp
 004D101D    mov         ebp,esp
 004D101F    push        ecx
 004D1020    push        ebx
 004D1021    mov         dword ptr [ebp-4],ecx
 004D1024    mov         ebx,edx
 004D1026    mov         eax,dword ptr [ebp-4]
 004D1029    call        @DynArrayAddRef
 004D102E    xor         eax,eax
 004D1030    push        ebp
 004D1031    push        4D1067
 004D1036    push        dword ptr fs:[eax]
 004D1039    mov         dword ptr fs:[eax],esp
 004D103C    mov         edx,dword ptr [ebp-4]
 004D103F    mov         ecx,dword ptr [ebp+8]
 004D1042    mov         eax,ebx
 004D1044    mov         ebx,dword ptr [eax]
 004D1046    call        dword ptr [ebx+10]
 004D1049    mov         ebx,eax
 004D104B    xor         eax,eax
 004D104D    pop         edx
 004D104E    pop         ecx
 004D104F    pop         ecx
 004D1050    mov         dword ptr fs:[eax],edx
 004D1053    push        4D106E
 004D1058    lea         eax,[ebp-4]
 004D105B    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 004D1061    call        @DynArrayClear
 004D1066    ret
>004D1067    jmp         @HandleFinally
>004D106C    jmp         004D1058
 004D106E    mov         eax,ebx
 004D1070    pop         ebx
 004D1071    pop         ecx
 004D1072    pop         ebp
 004D1073    ret         4
*}
end;

//004D1078
function TStatusBar.GetOnDrawPanel:TDrawPanelEvent;
begin
{*
 004D1078    mov         ecx,dword ptr [eax+288]
 004D107E    mov         dword ptr [edx],ecx
 004D1080    mov         ecx,dword ptr [eax+28C]
 004D1086    mov         dword ptr [edx+4],ecx
 004D1089    ret
*}
end;

//004D108C
procedure TStatusBar.SetOnDrawPanel(Value:TDrawPanelEvent);
begin
{*
 004D108C    push        ebp
 004D108D    mov         ebp,esp
 004D108F    mov         edx,dword ptr [ebp+8]
 004D1092    mov         dword ptr [eax+288],edx
 004D1098    mov         edx,dword ptr [ebp+0C]
 004D109B    mov         dword ptr [eax+28C],edx
 004D10A1    pop         ebp
 004D10A2    ret         8
*}
end;

//004D10A8
procedure FreeConversionFormatList;
begin
{*
 004D10A8    push        ebx
 004D10A9    push        esi
 004D10AA    push        edi
 004D10AB    mov         edi,793298
 004D10B0    cmp         dword ptr [edi],0
>004D10B3    je          004D1101
 004D10B5    mov         eax,dword ptr [edi]
 004D10B7    mov         edx,7863A0
 004D10BC    xor         ecx,ecx
 004D10BE    call        TList.RemoveItem
 004D10C3    mov         eax,dword ptr [edi]
 004D10C5    mov         edx,7863A8
 004D10CA    xor         ecx,ecx
 004D10CC    call        TList.RemoveItem
 004D10D1    mov         eax,dword ptr [edi]
 004D10D3    mov         ebx,dword ptr [eax+8]
 004D10D6    dec         ebx
 004D10D7    test        ebx,ebx
>004D10D9    jl          004D10F6
 004D10DB    inc         ebx
 004D10DC    xor         esi,esi
 004D10DE    mov         edx,esi
 004D10E0    mov         eax,dword ptr [edi]
 004D10E2    call        TList.Get
 004D10E7    mov         edx,dword ptr ds:[4CD244];TConversionFormat
 004D10ED    call        @Dispose
 004D10F2    inc         esi
 004D10F3    dec         ebx
>004D10F4    jne         004D10DE
 004D10F6    mov         eax,dword ptr [edi]
 004D10F8    xor         edx,edx
 004D10FA    mov         dword ptr [edi],edx
 004D10FC    call        TObject.Free
 004D1101    pop         edi
 004D1102    pop         esi
 004D1103    pop         ebx
 004D1104    ret
*}
end;

Initialization
//00780B24
{*
 00780B24    sub         dword ptr ds:[793294],1
>00780B2B    jae         00780B5C
 00780B2D    mov         dl,1
 00780B2F    mov         eax,[00439644];TList
 00780B34    call        TObject.Create
 00780B39    mov         [00793298],eax
 00780B3E    mov         edx,7863A8
 00780B43    mov         eax,[00793298]
 00780B48    call        TList.Add
 00780B4D    mov         edx,7863A0
 00780B52    mov         eax,[00793298]
 00780B57    call        TList.Add
 00780B5C    ret
*}
Finalization
//004D1108
{*
 004D1108    push        ebp
 004D1109    mov         ebp,esp
 004D110B    xor         eax,eax
 004D110D    push        ebp
 004D110E    push        4D117C
 004D1113    push        dword ptr fs:[eax]
 004D1116    mov         dword ptr fs:[eax],esp
 004D1119    inc         dword ptr ds:[793294]
>004D111F    jne         004D116E
 004D1121    cmp         dword ptr ds:[79329C],0
>004D1128    je          004D1135
 004D112A    mov         eax,[0079329C]
 004D112F    push        eax
 004D1130    call        kernel32.FreeLibrary
 004D1135    cmp         dword ptr ds:[7932A0],0
>004D113C    je          004D1149
 004D113E    mov         eax,[007932A0]
 004D1143    push        eax
 004D1144    call        kernel32.FreeLibrary
 004D1149    call        FreeConversionFormatList
 004D114E    mov         eax,7863A0
 004D1153    mov         edx,dword ptr ds:[4CD244];TConversionFormat
 004D1159    call        @FinalizeRecord
 004D115E    mov         eax,7863A8
 004D1163    mov         edx,dword ptr ds:[4CD244];TConversionFormat
 004D1169    call        @FinalizeRecord
 004D116E    xor         eax,eax
 004D1170    pop         edx
 004D1171    pop         ecx
 004D1172    pop         ecx
 004D1173    mov         dword ptr fs:[eax],edx
 004D1176    push        4D1183
 004D117B    ret
>004D117C    jmp         @HandleFinally
>004D1181    jmp         004D117B
 004D1183    pop         ebp
 004D1184    ret
*}
end.