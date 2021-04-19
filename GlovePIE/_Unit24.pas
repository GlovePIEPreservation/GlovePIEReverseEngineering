//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit24;

interface

uses
  SysUtils, Classes, ImgList, Menus, Graphics, PieWiimoteForm, PieSixaxisForm, PieEditorUnit;

type
  TChangeLink = class(TObject)
  published
    procedure Change;//0049EDAC
    destructor Destroy();//0049ED78
  public
    FSender:TCustomImageList;//f4
    FOnChange:TNotifyEvent;//f8
    procedure Change; dynamic;//0049EDAC
  end;
  TDrawingStyle = (dsFocus, dsSelected, dsNormal, dsTransparent);
  TImageType = (itImage, itMask);
  TResType = (rtBitmap, rtCursor, rtIcon);
  TLoadResource = (lrDefaultColor, lrDefaultSize, lrFromFile, lrMap3DColors, lrTransparent, lrMonoChrome);
  TLoadResources = set of TLoadResource;
  TColorDepth = (cdDefault, cdDeviceDependent, cd4Bit, cd8Bit, cd16Bit, cd24Bit, cd32Bit);
  TCustomImageList = class(TComponent)
  published
    function HandleAllocated:Boolean;//0049CC5C
    function GetInstRes(Instance:Cardinal; ResType:TResType; MaskColor:TColor; LoadFlags:TLoadResources; Width:Integer; ResID:Cardinal):Boolean;//0049E214
    procedure Insert(Index:Integer; Image:TBitmap; Mask:TBitmap);//0049DE0C
    procedure InsertMasked(Index:Integer; Image:TBitmap; MaskColor:TColor);//0049DE20
    procedure InsertIcon(Index:Integer; Image:TIcon);//0049DE34
    function GetImageBitmap:HBITMAP;//0049CF98
    procedure GetIcon(Index:Integer; Image:TIcon; AImageType:TImageType; ADrawingStyle:TDrawingStyle);//0049D2C8
    function GetMaskBitmap:HBITMAP;//0049CFCC
    function GetInstRes(Instance:Cardinal; ResType:TResType; MaskColor:TColor; LoadFlags:TLoadResources; Width:Integer; Name:string):Boolean;//0049E234
    function GetResource(ResType:TResType; Name:string; MaskColor:TColor; LoadFlags:TLoadResources; Width:Integer):Boolean;//0049E2F8
    procedure ReplaceIcon(Index:Integer; Image:TIcon);//0049D678
    procedure Replace(Index:Integer; Image:TBitmap; Mask:TBitmap);//0049D330
    procedure ReplaceMasked(Index:Integer; NewImage:TBitmap; MaskColor:TColor);//0049D454
    procedure UnRegisterChanges(Value:TChangeLink);//0049E490
    procedure SetSize(AWidth:Integer; AHeight:Integer);//0049D804
    function Overlay(ImageIndex:Integer; Overlay:TOverlay):Boolean;//0049DB24
    procedure Move(CurIndex:Integer; NewIndex:Integer);//0049DF90
    procedure RegisterChanges(Value:TChangeLink);//0049E4D4
    function ResInstLoad(Instance:Cardinal; ResType:TResType; MaskColor:TColor; Name:string):Boolean;//0049E31C
    function ResourceLoad(ResType:TResType; Name:string; MaskColor:TColor):Boolean;//0049E344
    function AddImage(Value:TCustomImageList; Index:Integer):Integer;//0049DFF8
    function AddIcon(Image:TIcon):Integer;//0049D1E8
    procedure AddImages(Value:TCustomImageList);//0049E030
    procedure BeginUpdate;//0049ED54
    function AddMasked(Image:TBitmap; MaskColor:TColor):Integer;//0049D0CC
    constructor CreateSize(AHeight:Integer);//0049CAE0
    constructor Create;//0049CA94
    destructor Destroy();//0049CB34
    function Add(Image:TBitmap; Mask:TBitmap):Integer;//0049D000
    procedure Assign(Source:TPersistent);//0049E050
    procedure Clear;//0049D7A8
    function FileLoad(ResType:TResType; Name:string; MaskColor:TColor):Boolean;//0049E41C
    procedure EndUpdate;//0049ED58
    function GetBitmap(Index:Integer; Image:TBitmap):Boolean;//0049D238
    procedure GetIcon(Index:Integer; Image:TIcon);//0049D2B4
    function GetHotSpot:TPoint;//0049E1F4
    procedure Draw(Canvas:TCanvas; X:Integer; Enabled:Boolean; Index:Integer; Y:Integer);//0049DA38
    procedure Delete(Index:Integer);//0049D720
    procedure Draw(Canvas:TCanvas; X:Integer; Enabled:Boolean; AImageType:TImageType; ADrawingStyle:TDrawingStyle; Index:Integer; Y:Integer);//0049DA60
    procedure DrawOverlay(Canvas:TCanvas; X:Integer; Enabled:Boolean; AImageType:TImageType; ADrawingStyle:TDrawingStyle; Overlay:TOverlay; ImageIndex:Integer; Y:Integer);//0049DAC8
    procedure DrawOverlay(Canvas:TCanvas; X:Integer; Enabled:Boolean; Overlay:TOverlay; ImageIndex:Integer; Y:Integer);//0049DAA4
  public
    FHeight:Integer;//f34
    FWidth:Integer;//f38
    FAllocBy:Integer;//f3C
    FHandle:Cardinal;//f40
    FDrawingStyle:TDrawingStyle;//f44
    FMasked:Boolean;//f45
    FShareImages:Boolean;//f46
    FImageType:TImageType;//f47
    FBkColor:TColor;//f48
    FBlendColor:TColor;//f4C
    FClients:TList;//f50
    FBitmap:TBitmap;//f54
    FMonoBitmap:TBitmap;//f58
    FChanged:Boolean;//f5C
    FUpdateCount:Integer;//f60
    FOnChange:TNotifyEvent;//f68
    FColorDepth:TColorDepth;//f70
    destructor Destroy(); virtual;//0049CB34
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0049E0E0
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0049E678
    procedure Assign(Source:TPersistent); virtual;//v8//0049E050
    constructor Create; virtual;//v2C//0049CA94
    procedure DoDraw(Index:Integer; Canvas:TCanvas; X:Integer; Y:Integer; Style:Cardinal; Enabled:Boolean); virtual;//v34//0049D86C
    procedure Initialize; virtual;//v38//0049CBA0
    procedure ReadData(Stream:TStream); virtual;//v3C//0049EB34
    procedure WriteData(Stream:TStream); virtual;//v40//0049EBE4
    function GetHotSpot:TPoint; virtual;//v44//0049E1F4
    procedure Change; dynamic;//0049E440
    procedure HandleNeeded;//0049CC64
    procedure InitBitmap;//0049CC70
    procedure SetNewDimensions(Value:HIMAGELIST);//0049CD34
    procedure SetShareImages(Value:Boolean);//0049CD6C
    procedure SetWidth(Value:Integer);//0049CD78
    procedure SetHeight(Value:Integer);//0049CDB4
    procedure SetHandle(Value:HIMAGELIST);//0049CDF0
    function GetBitmapHandle(Bitmap:HBITMAP):HBITMAP;//0049CE1C
    function GetHandle:HIMAGELIST;//0049CE2C
    function GetImageHandle(Image:TBitmap; ImageLocal:TBitmap):HBITMAP;//0049CE3C
    procedure FreeHandle;//0049CEC4
    procedure CreateImageList;//0049CEF4
    function GetCount:Integer;//0049D314
    procedure SetBkColor(Value:TColor);//0049D7B4
    procedure SetColorDepth(Value:TColorDepth);//0049D7E4
    function GetBkColor:TColor;//0049D848
    procedure CopyImages(Value:HIMAGELIST; Index:Integer);//0049DB54
    procedure InsertImage(Index:Integer; Image:TBitmap; Mask:TBitmap; MaskColor:TColor);//0049DD08
    procedure CheckImage(Image:TGraphic);//0049E164
    procedure SetDrawingStyle(Value:TDrawingStyle);//0049E1DC
    function InternalGetInstRes(Instance:THandle; ResType:TResType; Name:PChar; Width:Integer; LoadFlags:TLoadResources; MaskColor:TColor):Boolean;//0049E268
    function Equal(IL:TCustomImageList):Boolean;//0049E52C
    procedure ReadD2Stream(Stream:TStream);//0049E6DC
    procedure ReadD3Stream(Stream:TStream);//0049E970
  end;
  EMenuError = class(Exception)
  end;
  TMenuBreak = (mbNone, mbBreak, mbBarBreak);
  TMenuChangeEvent = procedure(Sender:TObject; Source:TMenuItem; Rebuild:Boolean) of object;;
  TMenuDrawItemEvent = procedure(Sender:TObject; ACanvas:TCanvas; ARect:TRect; Selected:Boolean) of object;;
  TAdvancedMenuDrawItemEvent = procedure(Sender:TObject; ACanvas:TCanvas; ARect:TRect; State:TOwnerDrawState) of object;;
  TMenuMeasureItemEvent = procedure(Sender:TObject; ACanvas:TCanvas; var Width:Integer; var Height:Integer) of object;;
  TMenuItemAutoFlag = (maAutomatic, maManual, maParent);
  TMenuAutoFlag = (maAutomatic, maManual);
  TMenuActionLink = class(TActionLink)
  public
    FClient:TMenuItem;//f18
    procedure AssignClient(AClient:TObject); virtual;//v0//004A1BF8
    function IsOnExecuteLinked:Boolean; virtual;//v8//004A1DC0
    procedure SetOnExecute(Value:TNotifyEvent); virtual;//v10//004A1F08
    function IsCaptionLinked:Boolean; virtual;//v20//004A1C48
    function IsCheckedLinked:Boolean; virtual;//v24//004A1C74
    function IsEnabledLinked:Boolean; virtual;//v28//004A1C9C
    function IsGroupIndexLinked:Boolean; virtual;//v2C//004A1D14
    function IsHelpContextLinked:Boolean; virtual;//v30//004A1CC4
    function IsHintLinked:Boolean; virtual;//v38//004A1CE8
    function IsImageIndexLinked:Boolean; virtual;//v3C//004A1D44
    function IsShortCutLinked:Boolean; virtual;//v40//004A1D6C
    function IsVisibleLinked:Boolean; virtual;//v44//004A1D98
    procedure SetAutoCheck(Value:Boolean); virtual;//v48//004A1DE8
    procedure SetCaption(const Value:UnicodeString); virtual;//v4C//004A1E08
    procedure SetChecked(Value:Boolean); virtual;//v50//004A1E28
    procedure SetEnabled(Value:Boolean); virtual;//v54//004A1E48
    procedure SetHelpContext(Value:THelpContext); virtual;//v5C//004A1E68
    procedure SetHint(const Value:UnicodeString); virtual;//v68//004A1E84
    procedure SetImageIndex(Value:Integer); virtual;//v6C//004A1EA8
    procedure SetShortCut(Value:TShortCut); virtual;//v70//004A1EC8
    procedure SetVisible(Value:Boolean); virtual;//v74//004A1EE8
    function IsAutoCheckLinked:Boolean; virtual;//v78//004A1C14
  end;
  TMenuItemEnumerator = class(TObject)
  published
    function MoveNext:Boolean;//004A1F84
    function GetCurrent:TMenuItem;//004A1F78
    constructor Create;//004A1F34
  public
    FIndex:Integer;//f4
    FMenuItem:TMenuItem;//f8
  end;
  TMenuItem = class(TComponent)
  published
    function InsertNewLineAfter(AItem:TMenuItem):Integer;//004A66A8
    procedure Add(Item:TMenuItem);//004A56CC
    function NewBottomLine:Integer;//004A66C0
    function InsertNewLineBefore(AItem:TMenuItem):Integer;//004A66B4
    procedure Add(const AItems:array[$0..-$1] of TMenuItem; const _Dv_:$0..-$1);//004A5D08
    function RethinkLines:Boolean;//004A6898
    procedure SetParentComponent(Value:TComponent);//004A58BC
    procedure Remove(Item:TMenuItem);//004A56E8
    function RethinkHotkeys:Boolean;//004A6474
    function NewTopLine:Integer;//004A6704
    destructor Destroy();//004A2024
    procedure InitiateAction;//004A54C0
    function Find(ACaption:string):TMenuItem;//004A64D0
    constructor Create;//004A1FA0
    procedure Clear;//004A5D2C
    procedure Delete(Index:Integer);//004A558C
    procedure Insert(Index:Integer; Item:TMenuItem);//004A54D0
    procedure Click;//004A5604
    procedure GetParentComponent;//004A58A8
    function GetImageList:TCustomImageList;//004A4ABC
    procedure HasParent;//004A5194
    function GetParentMenu:TMenu;//004A5910
    function GetEnumerator:TMenuItemEnumerator;//004A4AAC
    function IndexOf(Item:TMenuItem):Integer;//004A56B4
    function IsLine:Boolean;//004A64A8
    procedure GetChildren(Root:TComponent; Proc:TGetChildProc);//004A540C
  public
    FCaption:string;//f34
    FChecked:Boolean;//f38
    FEnabled:Boolean;//f39
    FDefault:Boolean;//f3A
    FAutoHotkeys:TMenuItemAutoFlag;//f3B
    FAutoLineReduction:TMenuItemAutoFlag;//f3C
    FRadioItem:Boolean;//f3D
    FVisible:Boolean;//f3E
    FGroupIndex:Byte;//f3F
    FImageIndex:TImageIndex;//f40
    FActionLink:TMenuActionLink;//f44
    FBreak:TMenuBreak;//f48
    FBitmap:TBitmap;//f4C
    FCommand:Word;//f50
    FHelpContext:THelpContext;//f54
    FHint:string;//f58
    FItems:TList;//f5C
    FShortCut:TShortCut;//f60
    FParent:TMenuItem;//f64
    FMerged:TMenuItem;//f68
    FMergedWith:TMenuItem;//f6C
    FMenu:TMenu;//f70
    FStreamedRebuild:Boolean;//f74
    FImageChangeLink:TChangeLink;//f78
    FSubMenuImages:TCustomImageList;//f7C
    FOnChange:TMenuChangeEvent;//f80
    FOnClick:TNotifyEvent;//f88
    f8C:TEditorForm;//f8C
    FOnDrawItem:TMenuDrawItemEvent;//f90
    FOnAdvancedDrawItem:TAdvancedMenuDrawItemEvent;//f98
    FOnMeasureItem:TMenuMeasureItemEvent;//fA0
    FAutoCheck:Boolean;//fA8
    FHandle:HMENU;//fAC
    destructor Destroy(); virtual;//004A2024
    procedure AssignTo(Dest:TPersistent); virtual;//v0//004A5BB4
    procedure DefineProperties(Filer:TFiler); virtual;//v4//004A26DC
    procedure Loaded; virtual;//vC//004A2514
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//004A5C30
    constructor Create; virtual;//v2C//004A1FA0
    procedure AdvancedDrawItem(ACanvas:TCanvas; ARect:TRect; State:TOwnerDrawState; TopLevel:Boolean); virtual;//v34//004A4904
    procedure DrawItem(ACanvas:TCanvas; ARect:TRect; Selected:Boolean); virtual;//v38//004A2964
    procedure MeasureItem(ACanvas:TCanvas; var Width:Integer; var Height:Integer); virtual;//v3C//004A4F18
    procedure MenuChanged(Rebuild:Boolean); virtual;//v40//004A5710
    procedure InitiateAction; virtual;//v44//004A54C0
    procedure Click; virtual;//v48//004A5604
    procedure sub_004A533C; dynamic;//004A533C
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean); dynamic;//004A594C
    procedure HasParent; dynamic;//004A5194
    procedure GetParentComponent; dynamic;//004A58A8
    procedure SetParentComponent(Value:TComponent); dynamic;//004A58BC
    procedure SetChildOrder(Child:TComponent; Order:Integer); dynamic;//004A5444
    procedure GetChildren(Root:TComponent; Proc:TGetChildProc); dynamic;//004A540C
    procedure AppendTo(Menu:HMENU; ARightToLeft:Boolean);//004A20F8
    procedure PopulateMenu;//004A2410
    procedure ReadShortCutText(Reader:TReader);//004A2480
    procedure MergeWith(Menu:TMenuItem);//004A24D8
    procedure RebuildHandle;//004A2550
    procedure VerifyGroupIndex(Position:Integer; Value:Byte);//004A2624
    function GetHandle:HMENU;//004A2684
    procedure DoDrawText(ACanvas:TCanvas; const ACaption:UnicodeString; var Rect:TRect; Selected:Boolean; Flags:LongInt);//004A2730
    procedure SetBreak(Value:TMenuBreak);//004A5198
    procedure SetCaption(const Value:UnicodeString);//004A51A8
    procedure TurnSiblingsOff;//004A51D0
    procedure SetChecked(Value:Boolean);//004A521C
    procedure SetEnabled(Value:Boolean);//004A5270
    procedure SetGroupIndex(Value:Byte);//004A52E8
    function GetAction:TBasicAction;//004A532C
    function GetCount:Integer;//004A5344
    function GetItem(Index:Integer):TMenuItem;//004A5354
    procedure SetShortCut(Value:TShortCut);//004A5378
    procedure SetVisible(Value:Boolean);//004A538C
    procedure SetImageIndex(Value:TImageIndex);//004A539C
    function GetMenuIndex:Integer;//004A53AC
    procedure SetMenuIndex(Value:Integer);//004A53C4
    procedure SetDefault(Value:Boolean);//004A5464
    procedure SubItemChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);//004A5754
    function GetBitmap:TBitmap;//004A57B0
    procedure SetAction(Value:TBasicAction);//004A57D8
    procedure SetBitmap(Value:TBitmap);//004A5848
    procedure InitiateActions;//004A587C
    procedure SetRadioItem(Value:Boolean);//004A5920
    procedure DoActionChange(Sender:TObject);//004A5A70
    function IsCaptionStored(Value:string):Boolean;//004A5A94
    function IsCheckedStored(Value:Boolean):Boolean;//004A5AB4
    function IsEnabledStored(Value:Boolean):Boolean;//004A5AD4
    function IsHintStored(Value:string):Boolean;//004A5AF4
    function IsHelpContextStored(Value:THelpContext):Boolean;//004A5B14
    function IsImageIndexStored(Value:TImageIndex):Boolean;//004A5B34
    function IsShortCutStored(Value:TShortCut):Boolean;//004A5B54
    function IsVisibleStored(Value:Boolean):Boolean;//004A5B74
    function IsOnClickStored(Value:TNotifyEvent):Boolean;//004A5B94
    procedure SetSubMenuImages(Value:TCustomImageList);//004A5C84
    procedure ImageListChange(Sender:TObject);//004A5CC0
    procedure UpdateItems;//004A5CF4
    function InternalRethinkHotkeys(ForceRethink:Boolean):Boolean;//004A5FB8
    procedure SetAutoHotkeys(const Value:TMenuItemAutoFlag);//004A6498
    function InsertNewLine(ABefore:Boolean; AItem:TMenuItem):Integer;//004A659C
    function InternalRethinkLines(ForceRethink:Boolean):Boolean;//004A6740
    procedure SetAutoLineReduction(const Value:TMenuItemAutoFlag);//004A6888
    function GetAutoHotkeys:Boolean;//004A68BC
    function GetAutoLineReduction:Boolean;//004A68EC
  end;
  TFindItemKind = (fkCommand, fkHandle, fkShortCut);
  TMenu = class(TComponent)
  published
    procedure ParentBiDiModeChanged;//004A792C
    procedure IsShortCut(var Message:TWMKey);//004A7084
    procedure ProcessMenuChar(var Message:TWMMenuChar);//004A76E0
    procedure ParentBiDiModeChanged(AControl:TObject);//004A7954
    function IsRightToLeft:Boolean;//004A7584
    function DispatchCommand(ACommand:Word):Boolean;//004A6B94
    procedure CreateMenuItem;//004A69B8
    constructor Create;//004A691C
    destructor Destroy();//004A69C8
    procedure GetChildren(Root:TComponent; Proc:TGetChildProc);//004A6A00
    function GetHelpContext(Value:Integer; ByCommand:Boolean):THelpContext;//004A6B24
    function DispatchPopup(AHandle:HMENU):Boolean;//004A6BB0
    function FindItem(Value:Integer; Kind:TFindItemKind):TMenuItem;//004A6AF4
  public
    FBiDiMode:TBiDiMode;//f34
    FItems:TMenuItem;//f38
    FWindowHandle:HWND;//f3C
    FOwnerDraw:Boolean;//f40
    FParentBiDiMode:Boolean;//f41
    FImageChangeLink:TChangeLink;//f44
    FImages:TCustomImageList;//f48
    FOnChange:TMenuChangeEvent;//f50
    FMenuImage:string;//f58
    destructor Destroy(); virtual;//004A69C8
    procedure Loaded; virtual;//vC//004A74BC
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//004A7558
    constructor Create; virtual;//v2C//004A691C
    procedure DoChange(Source:TMenuItem; Rebuild:Boolean); virtual;//v34//004A74A4
    function GetHandle:HMENU; virtual;//v38//004A6A20
    procedure MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean); virtual;//v3C//004A74D4
    procedure IsShortCut(var Message:TWMKey); dynamic;//004A7084
    procedure CreateMenuItem; dynamic;//004A69B8
    procedure SetChildOrder(Child:TComponent; Order:Integer); dynamic;//004A6A2C
    procedure GetChildren(Root:TComponent; Proc:TGetChildProc); dynamic;//004A6A00
    procedure UpdateItems;//004A6A40
    function IsOwnerDraw:Boolean;//004A6C78
    procedure DoBiDiModeChanged;//004A7180
    function UpdateImage:Boolean;//004A7358
    procedure SetOwnerDraw(Value:Boolean);//004A73DC
    procedure AdjustBiDiBehavior;//004A73EC
    procedure SetWindowHandle(Value:HWND);//004A746C
    procedure ImageListChange(Sender:TObject);//004A7510
    procedure SetImages(Value:TCustomImageList);//004A751C
    function DoGetMenuString(Menu:HMENU; ItemID:UINT; Str:PChar; MaxCount:Integer; Flag:UINT):Integer;//004A785C
    procedure SetBiDiMode(Value:TBiDiMode);//004A7908
    procedure SetParentBiDiMode(Value:Boolean);//004A791C
    function GetAutoHotkeys:TMenuAutoFlag;//004A7980
    procedure SetAutoHotkeys(const Value:TMenuAutoFlag);//004A7990
    function GetAutoLineReduction:TMenuAutoFlag;//004A79A4
    procedure SetAutoLineReduction(const Value:TMenuAutoFlag);//004A79B4
  end;
  TMainMenu = class(TMenu)
  published
    procedure GetOle2AcceleratorTable(var AccelTable:HACCEL; var AccelCount:Integer; const Groups:array[$0..-$1] of System.Integer; const _Dv_:$0..-$1);//004A7B8C
    procedure SetOle2MenuHandle(Handle:HMENU);//004A7CAC
    procedure PopulateOle2Menu(SharedMenu:HMENU; const Groups:array[$0..-$1] of System.Integer; const _Dv_:$0..-$1; var Widths:array[$0..-$1] of System.LongInt; const _Dv_:$0..-$1);//004A7C5C
    procedure Merge(Menu:TMainMenu);//004A7A44
    procedure Unmerge(Menu:TMainMenu);//004A7A60
  public
    FOle2Menu:HMENU;//f60
    FAutoMerge:Boolean;//f64
    function GetHandle:HMENU; virtual;//v38//004A7AA8
    procedure MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean); virtual;//v3C//004A79E8
    procedure IsStoredBiDiMode(Value:TBiDiMode);//004A7178
    procedure SetAutoMerge(Value:Boolean);//004A79C8
    procedure ItemChanged;//004A7A7C
  end;
  TPopupAlignment = (paLeft, paRight, paCenter);
  TTrackButton = (tbRightButton, tbLeftButton);
  TMenuAnimations = (maLeftToRight, maRightToLeft, maTopToBottom, maBottomToTop, maNone);
  TMenuAnimation = set of TMenuAnimations;
  TPopupMenu = class(TMenu)
  published
    procedure CloseMenu;//004A8354
    procedure Popup(X:Integer; Y:Integer);//004A8418
    constructor Create;//004A82A8
    destructor Destroy();//004A8320
  public
    FPopupPoint:TPoint;//f60
    FAlignment:TPopupAlignment;//f68
    FAutoPopup:Boolean;//f69
    FPopupComponent:TComponent;//f6C
    FTrackButton:TTrackButton;//f70
    FMenuAnimation:TMenuAnimation;//f71
    FOnPopup:TNotifyEvent;//f78
    destructor Destroy(); virtual;//004A8320
    constructor Create; virtual;//v2C//004A82A8
    procedure DoPopup(Sender:TObject); virtual;//v40//004A835C
    procedure Popup(X:Integer; Y:Integer); virtual;//v44//004A8418
    function GetHelpContext:THelpContext;//004A8370
    procedure SetHelpContext(Value:THelpContext);//004A8378
    procedure SetBiDiModeFromPopupControl;//004A8380
    function UseRightToLeftAlignment:Boolean;//004A83CC
    procedure SetPopupPoint(APopupPoint:TPoint);//004A84C4
  end;
  TPopupList = class(TList)
  published
    procedure Remove(Popup:TPopupMenu);//004A828C
    procedure Add(Popup:TPopupMenu);//004A8264
  public
    FWindow:HWND;//f10
    procedure WndProc(var Message:TMessage); virtual;//v10//004A7D04
    procedure MainWndProc(var Message:TMessage);//004A7CB8
  end;
  TMenuItemStack = class(TStack)
  published
    procedure ClearItem(AItem:TMenuItem);//004A84E4
  end;
    function GetRGBColor(Value:TColor):DWORD;//0049CA54
    function GetColor(Value:DWORD):TColor;//0049CA74
    procedure Initialize;//0049CBA0
    procedure DoDraw(Index:Integer; Canvas:TCanvas; X:Integer; Y:Integer; Style:Cardinal; Enabled:Boolean);//0049D86C
    procedure AssignTo(Dest:TPersistent);//0049E0E0
    procedure Change;//0049E440
    function StreamsEqual(S1:TMemoryStream; S2:TMemoryStream):Boolean;//0049E4E8
    function DoWrite:Boolean;//0049E61C
    procedure DefineProperties(Filer:TFiler);//0049E678
    procedure ReadData(Stream:TStream);//0049EB34
    procedure WriteData(Stream:TStream);//0049EBE4
    function FindPopupControl(const Pos:TPoint):TControl;//004A15C8
    function ReturnAddr:Pointer;//004A15FC
    procedure Error(ResStr:PResStringRec);//004A1604
    function ShortCut(Key:Word; Shift:TShiftState):TShortCut;//004A1624
    procedure ShortCutToKey(ShortCut:TShortCut; var Key:Word; var Shift:TShiftState);//004A165C
    function GetSpecialName(ShortCut:TShortCut):UnicodeString;//004A1698
    function ShortCutToText(ShortCut:TShortCut):UnicodeString;//004A16E8
    function CompareFront(var Text:UnicodeString; const Front:UnicodeString):Boolean;//004A18E4
    function TextToShortCut(Text:UnicodeString):TShortCut;//004A196C
    function UniqueCommand:Word;//004A1A68
    function Iterate(var I:Integer; MenuItem:TMenuItem; AFunc:TIterator):Boolean;//004A1A88
    procedure IterateMenus(Func:TIterator; Menu1:TMenuItem; Menu2:TMenuItem);//004A1AEC
    procedure AssignClient(AClient:TObject);//004A1BF8
    function IsAutoCheckLinked:Boolean;//004A1C14
    function IsCaptionLinked:Boolean;//004A1C48
    function IsCheckedLinked:Boolean;//004A1C74
    function IsEnabledLinked:Boolean;//004A1C9C
    function IsHelpContextLinked:Boolean;//004A1CC4
    function IsHintLinked:Boolean;//004A1CE8
    function IsGroupIndexLinked:Boolean;//004A1D14
    function IsImageIndexLinked:Boolean;//004A1D44
    function IsShortCutLinked:Boolean;//004A1D6C
    function IsVisibleLinked:Boolean;//004A1D98
    function IsOnExecuteLinked:Boolean;//004A1DC0
    procedure SetAutoCheck(Value:Boolean);//004A1DE8
    procedure SetCaption(const Value:UnicodeString);//004A1E08
    procedure SetChecked(Value:Boolean);//004A1E28
    procedure SetEnabled(Value:Boolean);//004A1E48
    procedure SetHelpContext(Value:THelpContext);//004A1E68
    procedure SetHint(const Value:UnicodeString);//004A1E84
    procedure SetImageIndex(Value:Integer);//004A1EA8
    procedure SetShortCut(Value:TShortCut);//004A1EC8
    procedure SetVisible(Value:Boolean);//004A1EE8
    procedure SetOnExecute(Value:TNotifyEvent);//004A1F08
    function AddIn(MenuItem:TMenuItem):Boolean;//004A23F0
    procedure Loaded;//004A2514
    procedure DefineProperties(Filer:TFiler);//004A26DC
    procedure DrawItem(ACanvas:TCanvas; ARect:TRect; Selected:Boolean);//004A2964
    procedure DoDrawVistaText(MenuItem:TMenuItem; ACanvas:TCanvas; const ACaption:UnicodeString; var Rect:TRect; Selected:Boolean; Flags:LongInt);//004A29A4
    procedure VistaDraw(RightToLeft:Boolean);//004A2B44
    procedure NormalDraw;//004A35E4
    procedure BiDiDraw;//004A3F64
    procedure AdvancedDrawItem(ACanvas:TCanvas; ARect:TRect; State:TOwnerDrawState; TopLevel:Boolean);//004A4904
    procedure GetMenuSize;//004A4AEC
    procedure MeasureVistaMenuItem;//004A4B38
    procedure MeasureItem(ACanvas:TCanvas; var Width:Integer; var Height:Integer);//004A4F18
    procedure sub_004A533C;//004A533C
    procedure SetChildOrder(Child:TComponent; Order:Integer);//004A5444
    procedure MenuChanged(Rebuild:Boolean);//004A5710
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean);//004A594C
    procedure AssignTo(Dest:TPersistent);//004A5BB4
    procedure Notification(AComponent:TComponent; Operation:TOperation);//004A5C30
    function UpdateItem(MenuItem:TMenuItem):Boolean;//004A5CCC
    function IfHotkeyAvailable(const AHotkey:UnicodeString):Boolean;//004A5D58
    procedure CopyToBest;//004A5D88
    procedure InsertHotkeyFarEastFormat(var ACaption:UnicodeString; const AHotKey:UnicodeString; AColumn:Integer);//004A5E0C
    function GetHandle:HMENU;//004A6A20
    procedure SetChildOrder(Child:TComponent; Order:Integer);//004A6A2C
    function Find(Item:TMenuItem):Boolean;//004A6A58
    procedure GetAltGRStatus;//004A6C8C
    function IsAltGRPressed:Boolean;//004A6E94
    function ShortCutFromMessage(Message:TWMKey):TShortCut;//004A6ED0
    function NthParentOf(Item:TMenuItem; N:Integer):TMenuItem;//004A6F20
    function DoClick(var Item:TMenuItem; Level:Integer):TClickResult;//004A6F30
    procedure BuildImage(Menu:HMENU);//004A7288
    procedure DoChange(Source:TMenuItem; Rebuild:Boolean);//004A74A4
    procedure Loaded;//004A74BC
    procedure MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);//004A74D4
    procedure Notification(AComponent:TComponent; Operation:TOperation);//004A7558
    function IsAccelChar(Menu:HMENU; State:Word; I:Integer; C:Char):Boolean;//004A759C
    function IsInitialChar(Menu:HMENU; State:Word; I:Integer; C:Char):Boolean;//004A75F8
    procedure MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);//004A79E8
    function GetHandle:HMENU;//004A7AA8
    procedure ProcessAccels(Item:TMenuItem);//004A7AB8
    function ProcessAccelItems(Item:TMenuItem):Boolean;//004A7B54
    function AddOle2(Item:TMenuItem):Boolean;//004A7C10
    procedure WndProc(var Message:TMessage);//004A7D04
    procedure DoPopup(Sender:TObject);//004A835C
    function NewItem(const ACaption:UnicodeString; AShortCut:TShortCut; AChecked:Boolean; AEnabled:Boolean; AOnClick:TNotifyEvent; hCtx:THelpContext; const AName:UnicodeString):TMenuItem;//004A8520
    function NewLine:TMenuItem;//004A8594
    procedure DrawMenuItem(MenuItem:TMenuItem; ACanvas:TCanvas; ARect:TRect; State:TOwnerDrawState);//004A85C8
    function StripHotkey(const Text:UnicodeString):UnicodeString;//004A86B0
    function GetHotkey(const Text:UnicodeString):UnicodeString;//004A87CC
    function SameCaption(const Text1:UnicodeString; const Text2:UnicodeString):Boolean;//004A883C

implementation

//0049CA54
function GetRGBColor(Value:TColor):DWORD;
begin
{*
 0049CA54    call        ColorToRGB
 0049CA59    mov         edx,eax
 0049CA5B    sub         edx,1FFFFFFF
>0049CA61    je          0049CA68
 0049CA63    dec         edx
>0049CA64    je          0049CA6C
>0049CA66    jmp         0049CA71
 0049CA68    or          eax,0FFFFFFFF
 0049CA6B    ret
 0049CA6C    mov         eax,0FF000000
 0049CA71    ret
*}
end;

//0049CA74
function GetColor(Value:DWORD):TColor;
begin
{*
 0049CA74    mov         edx,eax
 0049CA76    sub         edx,0FF000000
>0049CA7C    je          0049CA8C
 0049CA7E    sub         edx,0FFFFFF
>0049CA84    jne         0049CA91
 0049CA86    mov         eax,1FFFFFFF
 0049CA8B    ret
 0049CA8C    mov         eax,20000000
 0049CA91    ret
*}
end;

//0049CA94
constructor TCustomImageList.Create;
begin
{*
 0049CA94    push        ebx
 0049CA95    push        esi
 0049CA96    test        dl,dl
>0049CA98    je          0049CAA2
 0049CA9A    add         esp,0FFFFFFF0
 0049CA9D    call        @ClassCreate
 0049CAA2    mov         ebx,edx
 0049CAA4    mov         esi,eax
 0049CAA6    xor         edx,edx
 0049CAA8    mov         eax,esi
 0049CAAA    call        TComponent.Create
 0049CAAF    mov         dword ptr [esi+38],10
 0049CAB6    mov         dword ptr [esi+34],10
 0049CABD    mov         eax,esi
 0049CABF    mov         edx,dword ptr [eax]
 0049CAC1    call        dword ptr [edx+38]
 0049CAC4    mov         eax,esi
 0049CAC6    test        bl,bl
>0049CAC8    je          0049CAD9
 0049CACA    call        @AfterConstruction
 0049CACF    pop         dword ptr fs:[0]
 0049CAD6    add         esp,0C
 0049CAD9    mov         eax,esi
 0049CADB    pop         esi
 0049CADC    pop         ebx
 0049CADD    ret
*}
end;

//0049CAE0
constructor TCustomImageList.CreateSize(AHeight:Integer);
begin
{*
 0049CAE0    push        ebp
 0049CAE1    mov         ebp,esp
 0049CAE3    push        ebx
 0049CAE4    push        esi
 0049CAE5    push        edi
 0049CAE6    test        dl,dl
>0049CAE8    je          0049CAF2
 0049CAEA    add         esp,0FFFFFFF0
 0049CAED    call        @ClassCreate
 0049CAF2    mov         esi,ecx
 0049CAF4    mov         ebx,edx
 0049CAF6    mov         edi,eax
 0049CAF8    xor         ecx,ecx
 0049CAFA    xor         edx,edx
 0049CAFC    mov         eax,edi
 0049CAFE    call        TComponent.Create
 0049CB03    mov         dword ptr [edi+38],esi
 0049CB06    mov         eax,dword ptr [ebp+8]
 0049CB09    mov         dword ptr [edi+34],eax
 0049CB0C    mov         eax,edi
 0049CB0E    mov         edx,dword ptr [eax]
 0049CB10    call        dword ptr [edx+38]
 0049CB13    mov         eax,edi
 0049CB15    test        bl,bl
>0049CB17    je          0049CB28
 0049CB19    call        @AfterConstruction
 0049CB1E    pop         dword ptr fs:[0]
 0049CB25    add         esp,0C
 0049CB28    mov         eax,edi
 0049CB2A    pop         edi
 0049CB2B    pop         esi
 0049CB2C    pop         ebx
 0049CB2D    pop         ebp
 0049CB2E    ret         4
*}
end;

//0049CB34
destructor TCustomImageList.Destroy();
begin
{*
 0049CB34    push        ebx
 0049CB35    push        esi
 0049CB36    push        edi
 0049CB37    call        @BeforeDestruction
 0049CB3C    mov         ebx,edx
 0049CB3E    mov         edi,eax
>0049CB40    jmp         0049CB52
 0049CB42    mov         eax,esi
 0049CB44    call        TList.Last
 0049CB49    mov         edx,eax
 0049CB4B    mov         eax,edi
 0049CB4D    call        TCustomImageList.UnRegisterChanges
 0049CB52    mov         esi,dword ptr [edi+50]
 0049CB55    cmp         dword ptr [esi+8],0
>0049CB59    jg          0049CB42
 0049CB5B    mov         eax,dword ptr [edi+54]
 0049CB5E    call        TObject.Free
 0049CB63    mov         eax,edi
 0049CB65    call        TCustomImageList.FreeHandle
 0049CB6A    mov         eax,dword ptr [edi+50]
 0049CB6D    call        TObject.Free
 0049CB72    xor         eax,eax
 0049CB74    mov         dword ptr [edi+50],eax
 0049CB77    mov         eax,dword ptr [edi+58]
 0049CB7A    test        eax,eax
>0049CB7C    je          0049CB83
 0049CB7E    call        TObject.Free
 0049CB83    mov         edx,ebx
 0049CB85    and         dl,0FC
 0049CB88    mov         eax,edi
 0049CB8A    call        TComponent.Destroy
 0049CB8F    test        bl,bl
>0049CB91    jle         0049CB9A
 0049CB93    mov         eax,edi
 0049CB95    call        @ClassDestroy
 0049CB9A    pop         edi
 0049CB9B    pop         esi
 0049CB9C    pop         ebx
 0049CB9D    ret
*}
end;

//0049CBA0
procedure TCustomImageList.Initialize;
begin
{*
 0049CBA0    push        ebp
 0049CBA1    mov         ebp,esp
 0049CBA3    push        0
 0049CBA5    push        ebx
 0049CBA6    mov         ebx,eax
 0049CBA8    xor         eax,eax
 0049CBAA    push        ebp
 0049CBAB    push        49CC51
 0049CBB0    push        dword ptr fs:[eax]
 0049CBB3    mov         dword ptr fs:[eax],esp
 0049CBB6    mov         dl,1
 0049CBB8    mov         eax,[00439644];TList
 0049CBBD    call        TObject.Create
 0049CBC2    mov         dword ptr [ebx+50],eax
 0049CBC5    mov         eax,dword ptr [ebx+34]
 0049CBC8    cmp         eax,1
>0049CBCB    jl          0049CBDA
 0049CBCD    cmp         eax,8000
>0049CBD2    jg          0049CBDA
 0049CBD4    cmp         dword ptr [ebx+38],1
>0049CBD8    jge         0049CBFB
 0049CBDA    lea         edx,[ebp-4]
 0049CBDD    mov         eax,[0078CFC4];^SResString192:TResStringRec
 0049CBE2    call        LoadResString
 0049CBE7    mov         ecx,dword ptr [ebp-4]
 0049CBEA    mov         dl,1
 0049CBEC    mov         eax,[00439268];EInvalidOperation
 0049CBF1    call        Exception.Create
 0049CBF6    call        @RaiseExcept
 0049CBFB    mov         dword ptr [ebx+3C],4
 0049CC02    mov         byte ptr [ebx+45],1
 0049CC06    mov         dl,2
 0049CC08    mov         eax,ebx
 0049CC0A    call        TCustomImageList.SetDrawingStyle
 0049CC0F    mov         byte ptr [ebx+47],0
 0049CC13    mov         dword ptr [ebx+48],1FFFFFFF
 0049CC1A    mov         dword ptr [ebx+4C],1FFFFFFF
 0049CC21    mov         byte ptr [ebx+70],1
 0049CC25    mov         dl,1
 0049CC27    mov         eax,[00463B28];TBitmap
 0049CC2C    call        TBitmap.Create
 0049CC31    mov         dword ptr [ebx+54],eax
 0049CC34    mov         eax,ebx
 0049CC36    call        TCustomImageList.InitBitmap
 0049CC3B    xor         eax,eax
 0049CC3D    pop         edx
 0049CC3E    pop         ecx
 0049CC3F    pop         ecx
 0049CC40    mov         dword ptr fs:[eax],edx
 0049CC43    push        49CC58
 0049CC48    lea         eax,[ebp-4]
 0049CC4B    call        @UStrClr
 0049CC50    ret
>0049CC51    jmp         @HandleFinally
>0049CC56    jmp         0049CC48
 0049CC58    pop         ebx
 0049CC59    pop         ecx
 0049CC5A    pop         ebp
 0049CC5B    ret
*}
end;

//0049CC5C
function TCustomImageList.HandleAllocated:Boolean;
begin
{*
 0049CC5C    cmp         dword ptr [eax+40],0
 0049CC60    setne       al
 0049CC63    ret
*}
end;

//0049CC64
procedure TCustomImageList.HandleNeeded;
begin
{*
 0049CC64    cmp         dword ptr [eax+40],0
>0049CC68    jne         0049CC6F
 0049CC6A    call        TCustomImageList.CreateImageList
 0049CC6F    ret
*}
end;

//0049CC70
procedure TCustomImageList.InitBitmap;
begin
{*
 0049CC70    push        ebp
 0049CC71    mov         ebp,esp
 0049CC73    add         esp,0FFFFFFE8
 0049CC76    push        ebx
 0049CC77    mov         dword ptr [ebp-4],eax
 0049CC7A    push        0
 0049CC7C    call        user32.GetDC
 0049CC81    mov         dword ptr [ebp-8],eax
 0049CC84    xor         eax,eax
 0049CC86    push        ebp
 0049CC87    push        49CD11
 0049CC8C    push        dword ptr fs:[eax]
 0049CC8F    mov         dword ptr fs:[eax],esp
 0049CC92    mov         eax,dword ptr [ebp-4]
 0049CC95    mov         ebx,dword ptr [eax+54]
 0049CC98    mov         eax,dword ptr [ebp-4]
 0049CC9B    mov         eax,dword ptr [eax+34]
 0049CC9E    push        eax
 0049CC9F    mov         eax,dword ptr [ebp-4]
 0049CCA2    mov         eax,dword ptr [eax+38]
 0049CCA5    push        eax
 0049CCA6    mov         eax,dword ptr [ebp-8]
 0049CCA9    push        eax
 0049CCAA    call        gdi32.CreateCompatibleBitmap
 0049CCAF    mov         edx,eax
 0049CCB1    mov         eax,ebx
 0049CCB3    call        TBitmap.SetHandle
 0049CCB8    mov         eax,ebx
 0049CCBA    call        TBitmap.GetCanvas
 0049CCBF    mov         eax,dword ptr [eax+48]
 0049CCC2    xor         edx,edx
 0049CCC4    call        TBrush.SetColor
 0049CCC9    mov         eax,ebx
 0049CCCB    mov         edx,dword ptr [eax]
 0049CCCD    call        dword ptr [edx+24]
 0049CCD0    push        eax
 0049CCD1    lea         eax,[ebp-18]
 0049CCD4    push        eax
 0049CCD5    mov         eax,ebx
 0049CCD7    mov         edx,dword ptr [eax]
 0049CCD9    call        dword ptr [edx+30]
 0049CCDC    mov         ecx,eax
 0049CCDE    xor         edx,edx
 0049CCE0    xor         eax,eax
 0049CCE2    call        Rect
 0049CCE7    lea         eax,[ebp-18]
 0049CCEA    push        eax
 0049CCEB    mov         eax,ebx
 0049CCED    call        TBitmap.GetCanvas
 0049CCF2    pop         edx
 0049CCF3    mov         ecx,dword ptr [eax]
 0049CCF5    call        dword ptr [ecx+54]
 0049CCF8    xor         eax,eax
 0049CCFA    pop         edx
 0049CCFB    pop         ecx
 0049CCFC    pop         ecx
 0049CCFD    mov         dword ptr fs:[eax],edx
 0049CD00    push        49CD18
 0049CD05    mov         eax,dword ptr [ebp-8]
 0049CD08    push        eax
 0049CD09    push        0
 0049CD0B    call        user32.ReleaseDC
 0049CD10    ret
>0049CD11    jmp         @HandleFinally
>0049CD16    jmp         0049CD05
 0049CD18    mov         eax,dword ptr [ebp-4]
 0049CD1B    mov         eax,dword ptr [eax+58]
 0049CD1E    test        eax,eax
>0049CD20    je          0049CD2F
 0049CD22    call        TObject.Free
 0049CD27    mov         eax,dword ptr [ebp-4]
 0049CD2A    xor         edx,edx
 0049CD2C    mov         dword ptr [eax+58],edx
 0049CD2F    pop         ebx
 0049CD30    mov         esp,ebp
 0049CD32    pop         ebp
 0049CD33    ret
*}
end;

//0049CD34
procedure TCustomImageList.SetNewDimensions(Value:HIMAGELIST);
begin
{*
 0049CD34    push        ebx
 0049CD35    add         esp,0FFFFFFF8
 0049CD38    mov         ebx,eax
 0049CD3A    mov         eax,dword ptr [ebx+38]
 0049CD3D    mov         dword ptr [esp+4],eax
 0049CD41    mov         eax,dword ptr [ebx+34]
 0049CD44    mov         dword ptr [esp],eax
 0049CD47    push        esp
 0049CD48    lea         eax,[esp+8]
 0049CD4C    push        eax
 0049CD4D    push        edx
 0049CD4E    call        comctl32.ImageList_GetIconSize
 0049CD53    mov         eax,dword ptr [esp+4]
 0049CD57    mov         dword ptr [ebx+38],eax
 0049CD5A    mov         eax,dword ptr [esp]
 0049CD5D    mov         dword ptr [ebx+34],eax
 0049CD60    mov         eax,ebx
 0049CD62    call        TCustomImageList.InitBitmap
 0049CD67    pop         ecx
 0049CD68    pop         edx
 0049CD69    pop         ebx
 0049CD6A    ret
*}
end;

//0049CD6C
procedure TCustomImageList.SetShareImages(Value:Boolean);
begin
{*
 0049CD6C    cmp         dl,byte ptr [eax+46]
>0049CD6F    je          0049CD74
 0049CD71    mov         byte ptr [eax+46],dl
 0049CD74    ret
*}
end;

//0049CD78
procedure TCustomImageList.SetWidth(Value:Integer);
begin
{*
 0049CD78    push        esi
 0049CD79    mov         esi,eax
 0049CD7B    cmp         edx,dword ptr [esi+38]
>0049CD7E    je          0049CDB0
 0049CD80    mov         ecx,edx
 0049CD82    mov         dword ptr [esi+38],ecx
 0049CD85    mov         eax,dword ptr [esi+40]
 0049CD88    test        eax,eax
>0049CD8A    je          0049CD97
 0049CD8C    mov         edx,dword ptr [esi+34]
 0049CD8F    push        edx
 0049CD90    push        ecx
 0049CD91    push        eax
 0049CD92    call        comctl32.ImageList_SetIconSize
 0049CD97    mov         eax,esi
 0049CD99    call        TCustomImageList.Clear
 0049CD9E    mov         eax,esi
 0049CDA0    call        TCustomImageList.InitBitmap
 0049CDA5    mov         eax,esi
 0049CDA7    mov         si,0FFF0
 0049CDAB    call        @CallDynaInst
 0049CDB0    pop         esi
 0049CDB1    ret
*}
end;

//0049CDB4
procedure TCustomImageList.SetHeight(Value:Integer);
begin
{*
 0049CDB4    push        esi
 0049CDB5    mov         esi,eax
 0049CDB7    cmp         edx,dword ptr [esi+34]
>0049CDBA    je          0049CDEC
 0049CDBC    mov         ecx,edx
 0049CDBE    mov         dword ptr [esi+34],ecx
 0049CDC1    mov         eax,dword ptr [esi+40]
 0049CDC4    test        eax,eax
>0049CDC6    je          0049CDD3
 0049CDC8    push        ecx
 0049CDC9    mov         edx,dword ptr [esi+38]
 0049CDCC    push        edx
 0049CDCD    push        eax
 0049CDCE    call        comctl32.ImageList_SetIconSize
 0049CDD3    mov         eax,esi
 0049CDD5    call        TCustomImageList.Clear
 0049CDDA    mov         eax,esi
 0049CDDC    call        TCustomImageList.InitBitmap
 0049CDE1    mov         eax,esi
 0049CDE3    mov         si,0FFF0
 0049CDE7    call        @CallDynaInst
 0049CDEC    pop         esi
 0049CDED    ret
*}
end;

//0049CDF0
procedure TCustomImageList.SetHandle(Value:HIMAGELIST);
begin
{*
 0049CDF0    push        ebx
 0049CDF1    push        esi
 0049CDF2    mov         esi,edx
 0049CDF4    mov         ebx,eax
 0049CDF6    mov         eax,ebx
 0049CDF8    call        TCustomImageList.FreeHandle
 0049CDFD    test        esi,esi
>0049CDFF    je          0049CE18
 0049CE01    mov         edx,esi
 0049CE03    mov         eax,ebx
 0049CE05    call        TCustomImageList.SetNewDimensions
 0049CE0A    mov         dword ptr [ebx+40],esi
 0049CE0D    mov         eax,ebx
 0049CE0F    mov         si,0FFF0
 0049CE13    call        @CallDynaInst
 0049CE18    pop         esi
 0049CE19    pop         ebx
 0049CE1A    ret
*}
end;

//0049CE1C
function TCustomImageList.GetBitmapHandle(Bitmap:HBITMAP):HBITMAP;
begin
{*
 0049CE1C    test        edx,edx
>0049CE1E    je          0049CE23
 0049CE20    mov         eax,edx
 0049CE22    ret
 0049CE23    mov         eax,dword ptr [eax+54]
 0049CE26    mov         edx,dword ptr [eax]
 0049CE28    call        dword ptr [edx+70]
 0049CE2B    ret
*}
end;

//0049CE2C
function TCustomImageList.GetHandle:HIMAGELIST;
begin
{*
 0049CE2C    push        ebx
 0049CE2D    mov         ebx,eax
 0049CE2F    mov         eax,ebx
 0049CE31    call        TCustomImageList.HandleNeeded
 0049CE36    mov         eax,dword ptr [ebx+40]
 0049CE39    pop         ebx
 0049CE3A    ret
*}
end;

//0049CE3C
function TCustomImageList.GetImageHandle(Image:TBitmap; ImageLocal:TBitmap):HBITMAP;
begin
{*
 0049CE3C    push        ebx
 0049CE3D    push        esi
 0049CE3E    push        edi
 0049CE3F    push        ebp
 0049CE40    mov         edi,ecx
 0049CE42    mov         ebx,edx
 0049CE44    mov         esi,eax
 0049CE46    mov         edx,ebx
 0049CE48    mov         eax,esi
 0049CE4A    call        TCustomImageList.CheckImage
 0049CE4F    test        ebx,ebx
>0049CE51    je          0049CEB4
 0049CE53    mov         eax,ebx
 0049CE55    call        TBitmap.GetPixelFormat
 0049CE5A    movzx       edx,byte ptr [esi+70]
 0049CE5E    cmp         al,byte ptr [edx+785BEC]
>0049CE64    jne         0049CE6F
 0049CE66    mov         eax,ebx
 0049CE68    mov         edx,dword ptr [eax]
 0049CE6A    call        dword ptr [edx+70]
>0049CE6D    jmp         0049CEBC
 0049CE6F    mov         eax,ebx
 0049CE71    mov         edx,dword ptr [eax]
 0049CE73    call        dword ptr [edx+24]
 0049CE76    push        eax
 0049CE77    mov         eax,ebx
 0049CE79    mov         edx,dword ptr [eax]
 0049CE7B    call        dword ptr [edx+30]
 0049CE7E    mov         edx,eax
 0049CE80    mov         eax,edi
 0049CE82    pop         ecx
 0049CE83    mov         ebp,dword ptr [eax]
 0049CE85    call        dword ptr [ebp+6C]
 0049CE88    movzx       eax,byte ptr [esi+70]
 0049CE8C    movzx       edx,byte ptr [eax+785BEC]
 0049CE93    mov         eax,edi
 0049CE95    call        TBitmap.SetPixelFormat
 0049CE9A    push        ebx
 0049CE9B    mov         eax,edi
 0049CE9D    call        TBitmap.GetCanvas
 0049CEA2    xor         ecx,ecx
 0049CEA4    xor         edx,edx
 0049CEA6    mov         ebx,dword ptr [eax]
 0049CEA8    call        dword ptr [ebx+44]
 0049CEAB    mov         eax,edi
 0049CEAD    mov         edx,dword ptr [eax]
 0049CEAF    call        dword ptr [edx+70]
>0049CEB2    jmp         0049CEBC
 0049CEB4    mov         eax,dword ptr [esi+54]
 0049CEB7    mov         edx,dword ptr [eax]
 0049CEB9    call        dword ptr [edx+70]
 0049CEBC    pop         ebp
 0049CEBD    pop         edi
 0049CEBE    pop         esi
 0049CEBF    pop         ebx
 0049CEC0    ret
*}
end;

//0049CEC4
procedure TCustomImageList.FreeHandle;
begin
{*
 0049CEC4    push        ebx
 0049CEC5    push        esi
 0049CEC6    mov         ebx,eax
 0049CEC8    cmp         dword ptr [ebx+40],0
>0049CECC    je          0049CEE1
 0049CECE    cmp         byte ptr [ebx+46],0
>0049CED2    jne         0049CEE1
 0049CED4    mov         eax,ebx
 0049CED6    call        TCustomImageList.GetHandle
 0049CEDB    push        eax
 0049CEDC    call        comctl32.ImageList_Destroy
 0049CEE1    xor         eax,eax
 0049CEE3    mov         dword ptr [ebx+40],eax
 0049CEE6    mov         eax,ebx
 0049CEE8    mov         si,0FFF0
 0049CEEC    call        @CallDynaInst
 0049CEF1    pop         esi
 0049CEF2    pop         ebx
 0049CEF3    ret
*}
end;

//0049CEF4
procedure TCustomImageList.CreateImageList;
begin
{*
 0049CEF4    push        ebp
 0049CEF5    mov         ebp,esp
 0049CEF7    push        0
 0049CEF9    push        ebx
 0049CEFA    push        esi
 0049CEFB    push        edi
 0049CEFC    mov         ebx,eax
 0049CEFE    xor         eax,eax
 0049CF00    push        ebp
 0049CF01    push        49CF88
 0049CF06    push        dword ptr fs:[eax]
 0049CF09    mov         dword ptr fs:[eax],esp
 0049CF0C    mov         esi,dword ptr [ebx+3C]
 0049CF0F    push        esi
 0049CF10    push        esi
 0049CF11    movzx       eax,byte ptr [ebx+70]
 0049CF15    mov         eax,dword ptr [eax*4+785BD0]
 0049CF1C    movzx       edx,byte ptr [ebx+45]
 0049CF20    or          eax,dword ptr [edx*4+785BF4]
 0049CF27    push        eax
 0049CF28    mov         eax,dword ptr [ebx+34]
 0049CF2B    push        eax
 0049CF2C    mov         eax,dword ptr [ebx+38]
 0049CF2F    push        eax
 0049CF30    call        comctl32.ImageList_Create
 0049CF35    mov         edi,eax
 0049CF37    mov         dword ptr [ebx+40],edi
 0049CF3A    test        edi,edi
>0049CF3C    jne         0049CF5F
 0049CF3E    lea         edx,[ebp-4]
 0049CF41    mov         eax,[0078D5EC];^SResString193:TResStringRec
 0049CF46    call        LoadResString
 0049CF4B    mov         ecx,dword ptr [ebp-4]
 0049CF4E    mov         dl,1
 0049CF50    mov         eax,[00439268];EInvalidOperation
 0049CF55    call        Exception.Create
 0049CF5A    call        @RaiseExcept
 0049CF5F    mov         eax,dword ptr [ebx+48]
 0049CF62    cmp         eax,1FFFFFFF
>0049CF67    je          0049CF72
 0049CF69    mov         edx,eax
 0049CF6B    mov         eax,ebx
 0049CF6D    call        TCustomImageList.SetBkColor
 0049CF72    xor         eax,eax
 0049CF74    pop         edx
 0049CF75    pop         ecx
 0049CF76    pop         ecx
 0049CF77    mov         dword ptr fs:[eax],edx
 0049CF7A    push        49CF8F
 0049CF7F    lea         eax,[ebp-4]
 0049CF82    call        @UStrClr
 0049CF87    ret
>0049CF88    jmp         @HandleFinally
>0049CF8D    jmp         0049CF7F
 0049CF8F    pop         edi
 0049CF90    pop         esi
 0049CF91    pop         ebx
 0049CF92    pop         ecx
 0049CF93    pop         ebp
 0049CF94    ret
*}
end;

//0049CF98
function TCustomImageList.GetImageBitmap:HBITMAP;
begin
{*
 0049CF98    push        ebx
 0049CF99    add         esp,0FFFFFFE0
 0049CF9C    mov         ebx,eax
 0049CF9E    mov         eax,ebx
 0049CFA0    call        TCustomImageList.GetCount
 0049CFA5    test        eax,eax
>0049CFA7    jle         0049CFC2
 0049CFA9    push        esp
 0049CFAA    push        0
 0049CFAC    mov         eax,ebx
 0049CFAE    call        TCustomImageList.GetHandle
 0049CFB3    push        eax
 0049CFB4    call        comctl32.ImageList_GetImageInfo
 0049CFB9    test        eax,eax
>0049CFBB    je          0049CFC2
 0049CFBD    mov         eax,dword ptr [esp]
>0049CFC0    jmp         0049CFC4
 0049CFC2    xor         eax,eax
 0049CFC4    add         esp,20
 0049CFC7    pop         ebx
 0049CFC8    ret
*}
end;

//0049CFCC
function TCustomImageList.GetMaskBitmap:HBITMAP;
begin
{*
 0049CFCC    push        ebx
 0049CFCD    add         esp,0FFFFFFE0
 0049CFD0    mov         ebx,eax
 0049CFD2    mov         eax,ebx
 0049CFD4    call        TCustomImageList.GetCount
 0049CFD9    test        eax,eax
>0049CFDB    jle         0049CFF7
 0049CFDD    push        esp
 0049CFDE    push        0
 0049CFE0    mov         eax,ebx
 0049CFE2    call        TCustomImageList.GetHandle
 0049CFE7    push        eax
 0049CFE8    call        comctl32.ImageList_GetImageInfo
 0049CFED    test        eax,eax
>0049CFEF    je          0049CFF7
 0049CFF1    mov         eax,dword ptr [esp+4]
>0049CFF5    jmp         0049CFF9
 0049CFF7    xor         eax,eax
 0049CFF9    add         esp,20
 0049CFFC    pop         ebx
 0049CFFD    ret
*}
end;

//0049D000
function TCustomImageList.Add(Image:TBitmap; Mask:TBitmap):Integer;
begin
{*
 0049D000    push        ebp
 0049D001    mov         ebp,esp
 0049D003    add         esp,0FFFFFFF0
 0049D006    push        ebx
 0049D007    push        esi
 0049D008    mov         esi,ecx
 0049D00A    mov         ebx,edx
 0049D00C    mov         dword ptr [ebp-4],eax
 0049D00F    mov         dl,1
 0049D011    mov         eax,[00463B28];TBitmap
 0049D016    call        TBitmap.Create
 0049D01B    mov         dword ptr [ebp-0C],eax
 0049D01E    xor         eax,eax
 0049D020    push        ebp
 0049D021    push        49D0AF
 0049D026    push        dword ptr fs:[eax]
 0049D029    mov         dword ptr fs:[eax],esp
 0049D02C    mov         dl,1
 0049D02E    mov         eax,[00463B28];TBitmap
 0049D033    call        TBitmap.Create
 0049D038    mov         dword ptr [ebp-10],eax
 0049D03B    xor         eax,eax
 0049D03D    push        ebp
 0049D03E    push        49D092
 0049D043    push        dword ptr fs:[eax]
 0049D046    mov         dword ptr fs:[eax],esp
 0049D049    mov         eax,dword ptr [ebp-4]
 0049D04C    call        TCustomImageList.HandleNeeded
 0049D051    mov         ecx,dword ptr [ebp-10]
 0049D054    mov         edx,esi
 0049D056    mov         eax,dword ptr [ebp-4]
 0049D059    call        TCustomImageList.GetImageHandle
 0049D05E    push        eax
 0049D05F    mov         ecx,dword ptr [ebp-0C]
 0049D062    mov         edx,ebx
 0049D064    mov         eax,dword ptr [ebp-4]
 0049D067    call        TCustomImageList.GetImageHandle
 0049D06C    push        eax
 0049D06D    mov         eax,dword ptr [ebp-4]
 0049D070    mov         eax,dword ptr [eax+40]
 0049D073    push        eax
 0049D074    call        comctl32.ImageList_Add
 0049D079    mov         dword ptr [ebp-8],eax
 0049D07C    xor         eax,eax
 0049D07E    pop         edx
 0049D07F    pop         ecx
 0049D080    pop         ecx
 0049D081    mov         dword ptr fs:[eax],edx
 0049D084    push        49D099
 0049D089    mov         eax,dword ptr [ebp-10]
 0049D08C    call        TObject.Free
 0049D091    ret
>0049D092    jmp         @HandleFinally
>0049D097    jmp         0049D089
 0049D099    xor         eax,eax
 0049D09B    pop         edx
 0049D09C    pop         ecx
 0049D09D    pop         ecx
 0049D09E    mov         dword ptr fs:[eax],edx
 0049D0A1    push        49D0B6
 0049D0A6    mov         eax,dword ptr [ebp-0C]
 0049D0A9    call        TObject.Free
 0049D0AE    ret
>0049D0AF    jmp         @HandleFinally
>0049D0B4    jmp         0049D0A6
 0049D0B6    mov         eax,dword ptr [ebp-4]
 0049D0B9    mov         si,0FFF0
 0049D0BD    call        @CallDynaInst
 0049D0C2    mov         eax,dword ptr [ebp-8]
 0049D0C5    pop         esi
 0049D0C6    pop         ebx
 0049D0C7    mov         esp,ebp
 0049D0C9    pop         ebp
 0049D0CA    ret
*}
end;

//0049D0CC
function TCustomImageList.AddMasked(Image:TBitmap; MaskColor:TColor):Integer;
begin
{*
 0049D0CC    push        ebp
 0049D0CD    mov         ebp,esp
 0049D0CF    add         esp,0FFFFFFF0
 0049D0D2    push        ebx
 0049D0D3    push        esi
 0049D0D4    mov         esi,ecx
 0049D0D6    mov         ebx,edx
 0049D0D8    mov         dword ptr [ebp-4],eax
 0049D0DB    mov         dl,1
 0049D0DD    mov         eax,[00463B28];TBitmap
 0049D0E2    call        TBitmap.Create
 0049D0E7    mov         dword ptr [ebp-0C],eax
 0049D0EA    xor         eax,eax
 0049D0EC    push        ebp
 0049D0ED    push        49D1CB
 0049D0F2    push        dword ptr fs:[eax]
 0049D0F5    mov         dword ptr fs:[eax],esp
 0049D0F8    mov         eax,dword ptr [ebp-4]
 0049D0FB    cmp         byte ptr [eax+45],0
>0049D0FF    je          0049D194
 0049D105    cmp         esi,0FFFFFFFF
>0049D108    je          0049D194
 0049D10E    mov         dl,1
 0049D110    mov         eax,[00463B28];TBitmap
 0049D115    call        TBitmap.Create
 0049D11A    mov         dword ptr [ebp-10],eax
 0049D11D    xor         eax,eax
 0049D11F    push        ebp
 0049D120    push        49D18D
 0049D125    push        dword ptr fs:[eax]
 0049D128    mov         dword ptr fs:[eax],esp
 0049D12B    mov         edx,ebx
 0049D12D    mov         eax,dword ptr [ebp-10]
 0049D130    mov         ecx,dword ptr [eax]
 0049D132    call        dword ptr [ecx+8]
 0049D135    mov         edx,esi
 0049D137    mov         eax,dword ptr [ebp-10]
 0049D13A    call        TBitmap.SetTransparentColor
 0049D13F    mov         eax,dword ptr [ebp-4]
 0049D142    call        TCustomImageList.HandleNeeded
 0049D147    mov         eax,dword ptr [ebp-10]
 0049D14A    mov         edx,dword ptr [eax]
 0049D14C    call        dword ptr [edx+74]
 0049D14F    mov         edx,eax
 0049D151    mov         eax,dword ptr [ebp-4]
 0049D154    call        TCustomImageList.GetBitmapHandle
 0049D159    push        eax
 0049D15A    mov         ecx,dword ptr [ebp-0C]
 0049D15D    mov         edx,ebx
 0049D15F    mov         eax,dword ptr [ebp-4]
 0049D162    call        TCustomImageList.GetImageHandle
 0049D167    push        eax
 0049D168    mov         eax,dword ptr [ebp-4]
 0049D16B    mov         eax,dword ptr [eax+40]
 0049D16E    push        eax
 0049D16F    call        comctl32.ImageList_Add
 0049D174    mov         dword ptr [ebp-8],eax
 0049D177    xor         eax,eax
 0049D179    pop         edx
 0049D17A    pop         ecx
 0049D17B    pop         ecx
 0049D17C    mov         dword ptr fs:[eax],edx
 0049D17F    push        49D1B5
 0049D184    mov         eax,dword ptr [ebp-10]
 0049D187    call        TObject.Free
 0049D18C    ret
>0049D18D    jmp         @HandleFinally
>0049D192    jmp         0049D184
 0049D194    push        0
 0049D196    mov         ecx,dword ptr [ebp-0C]
 0049D199    mov         edx,ebx
 0049D19B    mov         eax,dword ptr [ebp-4]
 0049D19E    call        TCustomImageList.GetImageHandle
 0049D1A3    push        eax
 0049D1A4    mov         eax,dword ptr [ebp-4]
 0049D1A7    call        TCustomImageList.GetHandle
 0049D1AC    push        eax
 0049D1AD    call        comctl32.ImageList_Add
 0049D1B2    mov         dword ptr [ebp-8],eax
 0049D1B5    xor         eax,eax
 0049D1B7    pop         edx
 0049D1B8    pop         ecx
 0049D1B9    pop         ecx
 0049D1BA    mov         dword ptr fs:[eax],edx
 0049D1BD    push        49D1D2
 0049D1C2    mov         eax,dword ptr [ebp-0C]
 0049D1C5    call        TObject.Free
 0049D1CA    ret
>0049D1CB    jmp         @HandleFinally
>0049D1D0    jmp         0049D1C2
 0049D1D2    mov         eax,dword ptr [ebp-4]
 0049D1D5    mov         si,0FFF0
 0049D1D9    call        @CallDynaInst
 0049D1DE    mov         eax,dword ptr [ebp-8]
 0049D1E1    pop         esi
 0049D1E2    pop         ebx
 0049D1E3    mov         esp,ebp
 0049D1E5    pop         ebp
 0049D1E6    ret
*}
end;

//0049D1E8
function TCustomImageList.AddIcon(Image:TIcon):Integer;
begin
{*
 0049D1E8    push        ebx
 0049D1E9    push        esi
 0049D1EA    push        edi
 0049D1EB    mov         esi,edx
 0049D1ED    mov         ebx,eax
 0049D1EF    test        esi,esi
>0049D1F1    jne         0049D202
 0049D1F3    xor         ecx,ecx
 0049D1F5    xor         edx,edx
 0049D1F7    mov         eax,ebx
 0049D1F9    call        TCustomImageList.Add
 0049D1FE    mov         edi,eax
>0049D200    jmp         0049D226
 0049D202    mov         edx,esi
 0049D204    mov         eax,ebx
 0049D206    call        TCustomImageList.CheckImage
 0049D20B    mov         eax,ebx
 0049D20D    call        TCustomImageList.GetHandle
 0049D212    mov         edi,eax
 0049D214    mov         eax,esi
 0049D216    call        TIcon.GetHandle
 0049D21B    push        eax
 0049D21C    push        0FF
 0049D21E    push        edi
 0049D21F    call        comctl32.ImageList_ReplaceIcon
 0049D224    mov         edi,eax
 0049D226    mov         eax,ebx
 0049D228    mov         si,0FFF0
 0049D22C    call        @CallDynaInst
 0049D231    mov         eax,edi
 0049D233    pop         edi
 0049D234    pop         esi
 0049D235    pop         ebx
 0049D236    ret
*}
end;

//0049D238
function TCustomImageList.GetBitmap(Index:Integer; Image:TBitmap):Boolean;
begin
{*
 0049D238    push        ebx
 0049D239    push        esi
 0049D23A    push        edi
 0049D23B    push        ecx
 0049D23C    mov         esi,ecx
 0049D23E    mov         dword ptr [esp],edx
 0049D241    mov         edi,eax
 0049D243    test        esi,esi
>0049D245    je          0049D250
 0049D247    cmp         dword ptr [edi+40],0
 0049D24B    setne       al
>0049D24E    jmp         0049D252
 0049D250    xor         eax,eax
 0049D252    test        al,al
>0049D254    je          0049D25F
 0049D256    cmp         dword ptr [esp],0FFFFFFFF
 0049D25A    setg        al
>0049D25D    jmp         0049D261
 0049D25F    xor         eax,eax
 0049D261    test        al,al
>0049D263    je          0049D274
 0049D265    mov         eax,edi
 0049D267    call        TCustomImageList.GetCount
 0049D26C    cmp         eax,dword ptr [esp]
 0049D26F    setg        al
>0049D272    jmp         0049D276
 0049D274    xor         eax,eax
 0049D276    mov         ebx,eax
 0049D278    test        bl,bl
>0049D27A    je          0049D2AB
 0049D27C    mov         edx,dword ptr [edi+34]
 0049D27F    mov         eax,esi
 0049D281    mov         ecx,dword ptr [eax]
 0049D283    call        dword ptr [ecx+38]
 0049D286    mov         edx,dword ptr [edi+38]
 0049D289    mov         eax,esi
 0049D28B    mov         ecx,dword ptr [eax]
 0049D28D    call        dword ptr [ecx+44]
 0049D290    push        0
 0049D292    mov         eax,dword ptr [esp+4]
 0049D296    push        eax
 0049D297    push        1
 0049D299    mov         eax,esi
 0049D29B    call        TBitmap.GetCanvas
 0049D2A0    mov         edx,eax
 0049D2A2    xor         ecx,ecx
 0049D2A4    mov         eax,edi
 0049D2A6    call        TCustomImageList.Draw
 0049D2AB    mov         eax,ebx
 0049D2AD    pop         edx
 0049D2AE    pop         edi
 0049D2AF    pop         esi
 0049D2B0    pop         ebx
 0049D2B1    ret
*}
end;

//0049D2B4
procedure TCustomImageList.GetIcon(Index:Integer; Image:TIcon);
begin
{*
 0049D2B4    push        ebx
 0049D2B5    movzx       ebx,byte ptr [eax+44]
 0049D2B9    push        ebx
 0049D2BA    movzx       ebx,byte ptr [eax+47]
 0049D2BE    push        ebx
 0049D2BF    call        TCustomImageList.GetIcon
 0049D2C4    pop         ebx
 0049D2C5    ret
*}
end;

//0049D2C8
procedure TCustomImageList.GetIcon(Index:Integer; Image:TIcon; AImageType:TImageType; ADrawingStyle:TDrawingStyle);
begin
{*
 0049D2C8    push        ebp
 0049D2C9    mov         ebp,esp
 0049D2CB    push        ebx
 0049D2CC    push        esi
 0049D2CD    push        edi
 0049D2CE    mov         esi,ecx
 0049D2D0    mov         edi,edx
 0049D2D2    mov         ebx,eax
 0049D2D4    test        esi,esi
>0049D2D6    je          0049D30C
 0049D2D8    cmp         dword ptr [ebx+40],0
>0049D2DC    je          0049D30C
 0049D2DE    movzx       eax,byte ptr [ebp+0C]
 0049D2E2    mov         eax,dword ptr [eax*4+785BB8]
 0049D2E9    movzx       edx,byte ptr [ebp+8]
 0049D2ED    or          eax,dword ptr [edx*4+785BC8]
 0049D2F4    push        eax
 0049D2F5    push        edi
 0049D2F6    mov         eax,ebx
 0049D2F8    call        TCustomImageList.GetHandle
 0049D2FD    push        eax
 0049D2FE    call        comctl32.ImageList_GetIcon
 0049D303    mov         edx,eax
 0049D305    mov         eax,esi
 0049D307    call        TIcon.SetHandle
 0049D30C    pop         edi
 0049D30D    pop         esi
 0049D30E    pop         ebx
 0049D30F    pop         ebp
 0049D310    ret         8
*}
end;

//0049D314
function TCustomImageList.GetCount:Integer;
begin
{*
 0049D314    push        ebx
 0049D315    mov         ebx,eax
 0049D317    cmp         dword ptr [ebx+40],0
>0049D31B    je          0049D32C
 0049D31D    mov         eax,ebx
 0049D31F    call        TCustomImageList.GetHandle
 0049D324    push        eax
 0049D325    call        comctl32.ImageList_GetImageCount
 0049D32A    pop         ebx
 0049D32B    ret
 0049D32C    xor         eax,eax
 0049D32E    pop         ebx
 0049D32F    ret
*}
end;

//0049D330
procedure TCustomImageList.Replace(Index:Integer; Image:TBitmap; Mask:TBitmap);
begin
{*
 0049D330    push        ebp
 0049D331    mov         ebp,esp
 0049D333    add         esp,0FFFFFFF0
 0049D336    push        ebx
 0049D337    push        esi
 0049D338    xor         ebx,ebx
 0049D33A    mov         dword ptr [ebp-10],ebx
 0049D33D    mov         esi,ecx
 0049D33F    mov         ebx,edx
 0049D341    mov         dword ptr [ebp-4],eax
 0049D344    xor         eax,eax
 0049D346    push        ebp
 0049D347    push        49D442
 0049D34C    push        dword ptr fs:[eax]
 0049D34F    mov         dword ptr fs:[eax],esp
 0049D352    mov         dl,1
 0049D354    mov         eax,[00463B28];TBitmap
 0049D359    call        TBitmap.Create
 0049D35E    mov         dword ptr [ebp-8],eax
 0049D361    xor         eax,eax
 0049D363    push        ebp
 0049D364    push        49D419
 0049D369    push        dword ptr fs:[eax]
 0049D36C    mov         dword ptr fs:[eax],esp
 0049D36F    mov         dl,1
 0049D371    mov         eax,[00463B28];TBitmap
 0049D376    call        TBitmap.Create
 0049D37B    mov         dword ptr [ebp-0C],eax
 0049D37E    xor         eax,eax
 0049D380    push        ebp
 0049D381    push        49D3FC
 0049D386    push        dword ptr fs:[eax]
 0049D389    mov         dword ptr fs:[eax],esp
 0049D38C    mov         eax,dword ptr [ebp-4]
 0049D38F    cmp         dword ptr [eax+40],0
>0049D393    je          0049D3E6
 0049D395    mov         ecx,dword ptr [ebp-0C]
 0049D398    mov         edx,dword ptr [ebp+8]
 0049D39B    mov         eax,dword ptr [ebp-4]
 0049D39E    call        TCustomImageList.GetImageHandle
 0049D3A3    push        eax
 0049D3A4    mov         ecx,dword ptr [ebp-8]
 0049D3A7    mov         edx,esi
 0049D3A9    mov         eax,dword ptr [ebp-4]
 0049D3AC    call        TCustomImageList.GetImageHandle
 0049D3B1    push        eax
 0049D3B2    push        ebx
 0049D3B3    mov         eax,dword ptr [ebp-4]
 0049D3B6    call        TCustomImageList.GetHandle
 0049D3BB    push        eax
 0049D3BC    call        comctl32.ImageList_Replace
 0049D3C1    test        eax,eax
>0049D3C3    jne         0049D3E6
 0049D3C5    lea         edx,[ebp-10]
 0049D3C8    mov         eax,[0078CE84];^SResString194:TResStringRec
 0049D3CD    call        LoadResString
 0049D3D2    mov         ecx,dword ptr [ebp-10]
 0049D3D5    mov         dl,1
 0049D3D7    mov         eax,[00439268];EInvalidOperation
 0049D3DC    call        Exception.Create
 0049D3E1    call        @RaiseExcept
 0049D3E6    xor         eax,eax
 0049D3E8    pop         edx
 0049D3E9    pop         ecx
 0049D3EA    pop         ecx
 0049D3EB    mov         dword ptr fs:[eax],edx
 0049D3EE    push        49D403
 0049D3F3    mov         eax,dword ptr [ebp-0C]
 0049D3F6    call        TObject.Free
 0049D3FB    ret
>0049D3FC    jmp         @HandleFinally
>0049D401    jmp         0049D3F3
 0049D403    xor         eax,eax
 0049D405    pop         edx
 0049D406    pop         ecx
 0049D407    pop         ecx
 0049D408    mov         dword ptr fs:[eax],edx
 0049D40B    push        49D420
 0049D410    mov         eax,dword ptr [ebp-8]
 0049D413    call        TObject.Free
 0049D418    ret
>0049D419    jmp         @HandleFinally
>0049D41E    jmp         0049D410
 0049D420    mov         eax,dword ptr [ebp-4]
 0049D423    mov         si,0FFF0
 0049D427    call        @CallDynaInst
 0049D42C    xor         eax,eax
 0049D42E    pop         edx
 0049D42F    pop         ecx
 0049D430    pop         ecx
 0049D431    mov         dword ptr fs:[eax],edx
 0049D434    push        49D449
 0049D439    lea         eax,[ebp-10]
 0049D43C    call        @UStrClr
 0049D441    ret
>0049D442    jmp         @HandleFinally
>0049D447    jmp         0049D439
 0049D449    pop         esi
 0049D44A    pop         ebx
 0049D44B    mov         esp,ebp
 0049D44D    pop         ebp
 0049D44E    ret         4
*}
end;

//0049D454
procedure TCustomImageList.ReplaceMasked(Index:Integer; NewImage:TBitmap; MaskColor:TColor);
begin
{*
 0049D454    push        ebp
 0049D455    mov         ebp,esp
 0049D457    add         esp,0FFFFFFE8
 0049D45A    push        ebx
 0049D45B    push        esi
 0049D45C    xor         ebx,ebx
 0049D45E    mov         dword ptr [ebp-18],ebx
 0049D461    mov         dword ptr [ebp-14],ebx
 0049D464    mov         esi,ecx
 0049D466    mov         ebx,edx
 0049D468    mov         dword ptr [ebp-4],eax
 0049D46B    xor         eax,eax
 0049D46D    push        ebp
 0049D46E    push        49D668
 0049D473    push        dword ptr fs:[eax]
 0049D476    mov         dword ptr fs:[eax],esp
 0049D479    mov         eax,dword ptr [ebp-4]
 0049D47C    cmp         dword ptr [eax+40],0
>0049D480    je          0049D641
 0049D486    mov         edx,esi
 0049D488    mov         eax,dword ptr [ebp-4]
 0049D48B    call        TCustomImageList.CheckImage
 0049D490    mov         ecx,dword ptr [ebp+8]
 0049D493    mov         edx,esi
 0049D495    mov         eax,dword ptr [ebp-4]
 0049D498    call        TCustomImageList.AddMasked
 0049D49D    mov         dword ptr [ebp-8],eax
 0049D4A0    cmp         dword ptr [ebp-8],0FFFFFFFF
>0049D4A4    je          0049D620
 0049D4AA    xor         eax,eax
 0049D4AC    push        ebp
 0049D4AD    push        49D619
 0049D4B2    push        dword ptr fs:[eax]
 0049D4B5    mov         dword ptr fs:[eax],esp
 0049D4B8    mov         dl,1
 0049D4BA    mov         eax,[00463B28];TBitmap
 0049D4BF    call        TBitmap.Create
 0049D4C4    mov         dword ptr [ebp-0C],eax
 0049D4C7    xor         eax,eax
 0049D4C9    push        ebp
 0049D4CA    push        49D5F9
 0049D4CF    push        dword ptr fs:[eax]
 0049D4D2    mov         dword ptr fs:[eax],esp
 0049D4D5    mov         eax,dword ptr [ebp-4]
 0049D4D8    mov         edx,dword ptr [eax+34]
 0049D4DB    mov         eax,dword ptr [ebp-0C]
 0049D4DE    mov         ecx,dword ptr [eax]
 0049D4E0    call        dword ptr [ecx+38]
 0049D4E3    mov         eax,dword ptr [ebp-4]
 0049D4E6    mov         edx,dword ptr [eax+38]
 0049D4E9    mov         eax,dword ptr [ebp-0C]
 0049D4EC    mov         ecx,dword ptr [eax]
 0049D4EE    call        dword ptr [ecx+44]
 0049D4F1    mov         dl,1
 0049D4F3    mov         eax,[00463B28];TBitmap
 0049D4F8    call        TBitmap.Create
 0049D4FD    mov         dword ptr [ebp-10],eax
 0049D500    xor         eax,eax
 0049D502    push        ebp
 0049D503    push        49D5DC
 0049D508    push        dword ptr fs:[eax]
 0049D50B    mov         dword ptr fs:[eax],esp
 0049D50E    mov         dl,1
 0049D510    mov         eax,dword ptr [ebp-10]
 0049D513    call        TBitmap.SetMonochrome
 0049D518    mov         eax,dword ptr [ebp-4]
 0049D51B    mov         edx,dword ptr [eax+34]
 0049D51E    mov         eax,dword ptr [ebp-10]
 0049D521    mov         ecx,dword ptr [eax]
 0049D523    call        dword ptr [ecx+38]
 0049D526    mov         eax,dword ptr [ebp-4]
 0049D529    mov         edx,dword ptr [eax+38]
 0049D52C    mov         eax,dword ptr [ebp-10]
 0049D52F    mov         ecx,dword ptr [eax]
 0049D531    call        dword ptr [ecx+44]
 0049D534    push        0
 0049D536    push        0
 0049D538    push        0
 0049D53A    mov         eax,dword ptr [ebp-0C]
 0049D53D    call        TBitmap.GetCanvas
 0049D542    call        TCanvas.GetHandle
 0049D547    push        eax
 0049D548    mov         eax,dword ptr [ebp-8]
 0049D54B    push        eax
 0049D54C    mov         eax,dword ptr [ebp-4]
 0049D54F    call        TCustomImageList.GetHandle
 0049D554    push        eax
 0049D555    call        comctl32.ImageList_Draw
 0049D55A    push        10
 0049D55C    push        0
 0049D55E    push        0
 0049D560    mov         eax,dword ptr [ebp-10]
 0049D563    call        TBitmap.GetCanvas
 0049D568    call        TCanvas.GetHandle
 0049D56D    push        eax
 0049D56E    mov         eax,dword ptr [ebp-8]
 0049D571    push        eax
 0049D572    mov         eax,dword ptr [ebp-4]
 0049D575    call        TCustomImageList.GetHandle
 0049D57A    push        eax
 0049D57B    call        comctl32.ImageList_Draw
 0049D580    mov         eax,dword ptr [ebp-10]
 0049D583    mov         edx,dword ptr [eax]
 0049D585    call        dword ptr [edx+70]
 0049D588    push        eax
 0049D589    mov         eax,dword ptr [ebp-0C]
 0049D58C    mov         edx,dword ptr [eax]
 0049D58E    call        dword ptr [edx+70]
 0049D591    push        eax
 0049D592    push        ebx
 0049D593    mov         eax,dword ptr [ebp-4]
 0049D596    call        TCustomImageList.GetHandle
 0049D59B    push        eax
 0049D59C    call        comctl32.ImageList_Replace
 0049D5A1    test        eax,eax
>0049D5A3    jne         0049D5C6
 0049D5A5    lea         edx,[ebp-14]
 0049D5A8    mov         eax,[0078CE84];^SResString194:TResStringRec
 0049D5AD    call        LoadResString
 0049D5B2    mov         ecx,dword ptr [ebp-14]
 0049D5B5    mov         dl,1
 0049D5B7    mov         eax,[00439268];EInvalidOperation
 0049D5BC    call        Exception.Create
 0049D5C1    call        @RaiseExcept
 0049D5C6    xor         eax,eax
 0049D5C8    pop         edx
 0049D5C9    pop         ecx
 0049D5CA    pop         ecx
 0049D5CB    mov         dword ptr fs:[eax],edx
 0049D5CE    push        49D5E3
 0049D5D3    mov         eax,dword ptr [ebp-10]
 0049D5D6    call        TObject.Free
 0049D5DB    ret
>0049D5DC    jmp         @HandleFinally
>0049D5E1    jmp         0049D5D3
 0049D5E3    xor         eax,eax
 0049D5E5    pop         edx
 0049D5E6    pop         ecx
 0049D5E7    pop         ecx
 0049D5E8    mov         dword ptr fs:[eax],edx
 0049D5EB    push        49D600
 0049D5F0    mov         eax,dword ptr [ebp-0C]
 0049D5F3    call        TObject.Free
 0049D5F8    ret
>0049D5F9    jmp         @HandleFinally
>0049D5FE    jmp         0049D5F0
 0049D600    xor         eax,eax
 0049D602    pop         edx
 0049D603    pop         ecx
 0049D604    pop         ecx
 0049D605    mov         dword ptr fs:[eax],edx
 0049D608    push        49D641
 0049D60D    mov         edx,dword ptr [ebp-8]
 0049D610    mov         eax,dword ptr [ebp-4]
 0049D613    call        TCustomImageList.Delete
 0049D618    ret
>0049D619    jmp         @HandleFinally
>0049D61E    jmp         0049D60D
 0049D620    lea         edx,[ebp-18]
 0049D623    mov         eax,[0078CE84];^SResString194:TResStringRec
 0049D628    call        LoadResString
 0049D62D    mov         ecx,dword ptr [ebp-18]
 0049D630    mov         dl,1
 0049D632    mov         eax,[00439268];EInvalidOperation
 0049D637    call        Exception.Create
 0049D63C    call        @RaiseExcept
 0049D641    mov         eax,dword ptr [ebp-4]
 0049D644    mov         si,0FFF0
 0049D648    call        @CallDynaInst
 0049D64D    xor         eax,eax
 0049D64F    pop         edx
 0049D650    pop         ecx
 0049D651    pop         ecx
 0049D652    mov         dword ptr fs:[eax],edx
 0049D655    push        49D66F
 0049D65A    lea         eax,[ebp-18]
 0049D65D    mov         edx,2
 0049D662    call        @UStrArrayClr
 0049D667    ret
>0049D668    jmp         @HandleFinally
>0049D66D    jmp         0049D65A
 0049D66F    pop         esi
 0049D670    pop         ebx
 0049D671    mov         esp,ebp
 0049D673    pop         ebp
 0049D674    ret         4
*}
end;

//0049D678
procedure TCustomImageList.ReplaceIcon(Index:Integer; Image:TIcon);
begin
{*
 0049D678    push        ebp
 0049D679    mov         ebp,esp
 0049D67B    push        0
 0049D67D    push        ebx
 0049D67E    push        esi
 0049D67F    push        edi
 0049D680    mov         esi,ecx
 0049D682    mov         edi,edx
 0049D684    mov         ebx,eax
 0049D686    xor         eax,eax
 0049D688    push        ebp
 0049D689    push        49D711
 0049D68E    push        dword ptr fs:[eax]
 0049D691    mov         dword ptr fs:[eax],esp
 0049D694    cmp         dword ptr [ebx+40],0
>0049D698    je          0049D6F0
 0049D69A    test        esi,esi
>0049D69C    jne         0049D6AD
 0049D69E    push        0
 0049D6A0    xor         ecx,ecx
 0049D6A2    mov         edx,edi
 0049D6A4    mov         eax,ebx
 0049D6A6    call        TCustomImageList.Replace
>0049D6AB    jmp         0049D6F0
 0049D6AD    mov         edx,esi
 0049D6AF    mov         eax,ebx
 0049D6B1    call        TCustomImageList.CheckImage
 0049D6B6    mov         eax,esi
 0049D6B8    call        TIcon.GetHandle
 0049D6BD    push        eax
 0049D6BE    push        edi
 0049D6BF    mov         eax,ebx
 0049D6C1    call        TCustomImageList.GetHandle
 0049D6C6    push        eax
 0049D6C7    call        comctl32.ImageList_ReplaceIcon
 0049D6CC    inc         eax
>0049D6CD    jne         0049D6F0
 0049D6CF    lea         edx,[ebp-4]
 0049D6D2    mov         eax,[0078CE84];^SResString194:TResStringRec
 0049D6D7    call        LoadResString
 0049D6DC    mov         ecx,dword ptr [ebp-4]
 0049D6DF    mov         dl,1
 0049D6E1    mov         eax,[00439268];EInvalidOperation
 0049D6E6    call        Exception.Create
 0049D6EB    call        @RaiseExcept
 0049D6F0    mov         eax,ebx
 0049D6F2    mov         si,0FFF0
 0049D6F6    call        @CallDynaInst
 0049D6FB    xor         eax,eax
 0049D6FD    pop         edx
 0049D6FE    pop         ecx
 0049D6FF    pop         ecx
 0049D700    mov         dword ptr fs:[eax],edx
 0049D703    push        49D718
 0049D708    lea         eax,[ebp-4]
 0049D70B    call        @UStrClr
 0049D710    ret
>0049D711    jmp         @HandleFinally
>0049D716    jmp         0049D708
 0049D718    pop         edi
 0049D719    pop         esi
 0049D71A    pop         ebx
 0049D71B    pop         ecx
 0049D71C    pop         ebp
 0049D71D    ret
*}
end;

//0049D720
procedure TCustomImageList.Delete(Index:Integer);
begin
{*
 0049D720    push        ebp
 0049D721    mov         ebp,esp
 0049D723    push        0
 0049D725    push        ebx
 0049D726    push        esi
 0049D727    mov         esi,edx
 0049D729    mov         ebx,eax
 0049D72B    xor         eax,eax
 0049D72D    push        ebp
 0049D72E    push        49D79A
 0049D733    push        dword ptr fs:[eax]
 0049D736    mov         dword ptr fs:[eax],esp
 0049D739    mov         eax,ebx
 0049D73B    call        TCustomImageList.GetCount
 0049D740    cmp         esi,eax
>0049D742    jl          0049D765
 0049D744    lea         edx,[ebp-4]
 0049D747    mov         eax,[0078CFDC];^SResString195:TResStringRec
 0049D74C    call        LoadResString
 0049D751    mov         ecx,dword ptr [ebp-4]
 0049D754    mov         dl,1
 0049D756    mov         eax,[00439268];EInvalidOperation
 0049D75B    call        Exception.Create
 0049D760    call        @RaiseExcept
 0049D765    cmp         dword ptr [ebx+40],0
>0049D769    je          0049D779
 0049D76B    push        esi
 0049D76C    mov         eax,ebx
 0049D76E    call        TCustomImageList.GetHandle
 0049D773    push        eax
 0049D774    call        comctl32.ImageList_Remove
 0049D779    mov         eax,ebx
 0049D77B    mov         si,0FFF0
 0049D77F    call        @CallDynaInst
 0049D784    xor         eax,eax
 0049D786    pop         edx
 0049D787    pop         ecx
 0049D788    pop         ecx
 0049D789    mov         dword ptr fs:[eax],edx
 0049D78C    push        49D7A1
 0049D791    lea         eax,[ebp-4]
 0049D794    call        @UStrClr
 0049D799    ret
>0049D79A    jmp         @HandleFinally
>0049D79F    jmp         0049D791
 0049D7A1    pop         esi
 0049D7A2    pop         ebx
 0049D7A3    pop         ecx
 0049D7A4    pop         ebp
 0049D7A5    ret
*}
end;

//0049D7A8
procedure TCustomImageList.Clear;
begin
{*
 0049D7A8    or          edx,0FFFFFFFF
 0049D7AB    call        TCustomImageList.Delete
 0049D7B0    ret
*}
end;

//0049D7B4
procedure TCustomImageList.SetBkColor(Value:TColor);
begin
{*
 0049D7B4    push        ebx
 0049D7B5    push        esi
 0049D7B6    push        edi
 0049D7B7    mov         esi,edx
 0049D7B9    mov         ebx,eax
 0049D7BB    mov         edi,dword ptr [ebx+40]
 0049D7BE    test        edi,edi
>0049D7C0    je          0049D7D2
 0049D7C2    mov         eax,esi
 0049D7C4    call        GetRGBColor
 0049D7C9    push        eax
 0049D7CA    push        edi
 0049D7CB    call        comctl32.ImageList_SetBkColor
>0049D7D0    jmp         0049D7D5
 0049D7D2    mov         dword ptr [ebx+48],esi
 0049D7D5    mov         eax,ebx
 0049D7D7    mov         si,0FFF0
 0049D7DB    call        @CallDynaInst
 0049D7E0    pop         edi
 0049D7E1    pop         esi
 0049D7E2    pop         ebx
 0049D7E3    ret
*}
end;

//0049D7E4
procedure TCustomImageList.SetColorDepth(Value:TColorDepth);
begin
{*
 0049D7E4    push        ebx
 0049D7E5    push        esi
 0049D7E6    mov         ebx,edx
 0049D7E8    mov         esi,eax
 0049D7EA    cmp         bl,byte ptr [esi+70]
>0049D7ED    je          0049D800
 0049D7EF    mov         eax,esi
 0049D7F1    call        TCustomImageList.FreeHandle
 0049D7F6    mov         byte ptr [esi+70],bl
 0049D7F9    mov         eax,esi
 0049D7FB    call        TCustomImageList.CreateImageList
 0049D800    pop         esi
 0049D801    pop         ebx
 0049D802    ret
*}
end;

//0049D804
procedure TCustomImageList.SetSize(AWidth:Integer; AHeight:Integer);
begin
{*
 0049D804    push        esi
 0049D805    mov         esi,eax
 0049D807    cmp         ecx,dword ptr [esi+34]
>0049D80A    jne         0049D811
 0049D80C    cmp         edx,dword ptr [esi+38]
>0049D80F    je          0049D844
 0049D811    mov         dword ptr [esi+34],ecx
 0049D814    mov         ecx,edx
 0049D816    mov         dword ptr [esi+38],ecx
 0049D819    mov         eax,dword ptr [esi+40]
 0049D81C    test        eax,eax
>0049D81E    je          0049D82B
 0049D820    mov         edx,dword ptr [esi+34]
 0049D823    push        edx
 0049D824    push        ecx
 0049D825    push        eax
 0049D826    call        comctl32.ImageList_SetIconSize
 0049D82B    mov         eax,esi
 0049D82D    call        TCustomImageList.Clear
 0049D832    mov         eax,esi
 0049D834    call        TCustomImageList.InitBitmap
 0049D839    mov         eax,esi
 0049D83B    mov         si,0FFF0
 0049D83F    call        @CallDynaInst
 0049D844    pop         esi
 0049D845    ret
*}
end;

//0049D848
function TCustomImageList.GetBkColor:TColor;
begin
{*
 0049D848    push        ebx
 0049D849    mov         ebx,eax
 0049D84B    cmp         dword ptr [ebx+40],0
>0049D84F    je          0049D865
 0049D851    mov         eax,ebx
 0049D853    call        TCustomImageList.GetHandle
 0049D858    push        eax
 0049D859    call        comctl32.ImageList_GetBkColor
 0049D85E    call        GetColor
 0049D863    pop         ebx
 0049D864    ret
 0049D865    mov         eax,dword ptr [ebx+48]
 0049D868    pop         ebx
 0049D869    ret
*}
end;

//0049D86C
procedure TCustomImageList.DoDraw(Index:Integer; Canvas:TCanvas; X:Integer; Y:Integer; Style:Cardinal; Enabled:Boolean);
begin
{*
 0049D86C    push        ebp
 0049D86D    mov         ebp,esp
 0049D86F    add         esp,0FFFFFFDC
 0049D872    push        ebx
 0049D873    push        esi
 0049D874    push        edi
 0049D875    mov         dword ptr [ebp-4],ecx
 0049D878    mov         esi,edx
 0049D87A    mov         ebx,eax
 0049D87C    cmp         dword ptr [ebx+40],0
>0049D880    je          0049DA2E
 0049D886    cmp         byte ptr [ebp+8],0
>0049D88A    je          0049D8CE
 0049D88C    mov         eax,dword ptr [ebp+0C]
 0049D88F    push        eax
 0049D890    mov         eax,dword ptr [ebx+4C]
 0049D893    call        GetRGBColor
 0049D898    push        eax
 0049D899    mov         eax,ebx
 0049D89B    call        TCustomImageList.GetBkColor
 0049D8A0    call        GetRGBColor
 0049D8A5    push        eax
 0049D8A6    push        0
 0049D8A8    push        0
 0049D8AA    mov         eax,dword ptr [ebp+10]
 0049D8AD    push        eax
 0049D8AE    mov         eax,dword ptr [ebp+14]
 0049D8B1    push        eax
 0049D8B2    mov         eax,dword ptr [ebp-4]
 0049D8B5    call        TCanvas.GetHandle
 0049D8BA    push        eax
 0049D8BB    push        esi
 0049D8BC    mov         eax,ebx
 0049D8BE    call        TCustomImageList.GetHandle
 0049D8C3    push        eax
 0049D8C4    call        comctl32.ImageList_DrawEx
>0049D8C9    jmp         0049DA2E
 0049D8CE    cmp         dword ptr [ebx+58],0
>0049D8D2    jne         0049D902
 0049D8D4    mov         dl,1
 0049D8D6    mov         eax,[00463B28];TBitmap
 0049D8DB    call        TBitmap.Create
 0049D8E0    mov         edi,eax
 0049D8E2    mov         dword ptr [ebx+58],edi
 0049D8E5    mov         dl,1
 0049D8E7    mov         eax,edi
 0049D8E9    call        TBitmap.SetMonochrome
 0049D8EE    mov         edx,dword ptr [ebx+38]
 0049D8F1    mov         eax,edi
 0049D8F3    mov         ecx,dword ptr [eax]
 0049D8F5    call        dword ptr [ecx+44]
 0049D8F8    mov         edx,dword ptr [ebx+34]
 0049D8FB    mov         eax,edi
 0049D8FD    mov         ecx,dword ptr [eax]
 0049D8FF    call        dword ptr [ecx+38]
 0049D902    mov         eax,dword ptr [ebx+58]
 0049D905    call        TBitmap.GetCanvas
 0049D90A    mov         eax,dword ptr [eax+48]
 0049D90D    mov         edx,0FFFFFF
 0049D912    call        TBrush.SetColor
 0049D917    mov         eax,dword ptr [ebx+34]
 0049D91A    push        eax
 0049D91B    lea         eax,[ebp-24]
 0049D91E    push        eax
 0049D91F    mov         ecx,dword ptr [ebx+38]
 0049D922    xor         edx,edx
 0049D924    xor         eax,eax
 0049D926    call        Rect
 0049D92B    lea         eax,[ebp-24]
 0049D92E    push        eax
 0049D92F    mov         eax,dword ptr [ebx+58]
 0049D932    call        TBitmap.GetCanvas
 0049D937    pop         edx
 0049D938    mov         ecx,dword ptr [eax]
 0049D93A    call        dword ptr [ecx+54]
 0049D93D    push        0
 0049D93F    push        0
 0049D941    push        0FF
 0049D943    push        0
 0049D945    push        0
 0049D947    push        0
 0049D949    push        0
 0049D94B    mov         eax,dword ptr [ebx+58]
 0049D94E    call        TBitmap.GetCanvas
 0049D953    call        TCanvas.GetHandle
 0049D958    push        eax
 0049D959    push        esi
 0049D95A    mov         eax,ebx
 0049D95C    call        TCustomImageList.GetHandle
 0049D961    push        eax
 0049D962    call        comctl32.ImageList_DrawEx
 0049D967    mov         eax,dword ptr [ebp+10]
 0049D96A    add         eax,dword ptr [ebx+34]
 0049D96D    push        eax
 0049D96E    lea         eax,[ebp-14]
 0049D971    push        eax
 0049D972    mov         ecx,dword ptr [ebp+14]
 0049D975    add         ecx,dword ptr [ebx+38]
 0049D978    mov         edx,dword ptr [ebp+10]
 0049D97B    mov         eax,dword ptr [ebp+14]
 0049D97E    call        Rect
 0049D983    mov         eax,dword ptr [ebx+58]
 0049D986    call        TBitmap.GetCanvas
 0049D98B    call        TCanvas.GetHandle
 0049D990    mov         edi,eax
 0049D992    mov         eax,dword ptr [ebp-4]
 0049D995    mov         eax,dword ptr [eax+48]
 0049D998    mov         edx,0FF000014
 0049D99D    call        TBrush.SetColor
 0049D9A2    mov         eax,dword ptr [ebp-4]
 0049D9A5    call        TCanvas.GetHandle
 0049D9AA    mov         esi,eax
 0049D9AC    push        0FFFFFF
 0049D9B1    push        esi
 0049D9B2    call        gdi32.SetTextColor
 0049D9B7    push        0
 0049D9B9    push        esi
 0049D9BA    call        gdi32.SetBkColor
 0049D9BF    push        0E20746
 0049D9C4    push        0
 0049D9C6    push        0
 0049D9C8    push        edi
 0049D9C9    mov         eax,dword ptr [ebx+34]
 0049D9CC    push        eax
 0049D9CD    mov         eax,dword ptr [ebx+38]
 0049D9D0    push        eax
 0049D9D1    mov         eax,dword ptr [ebp+10]
 0049D9D4    inc         eax
 0049D9D5    push        eax
 0049D9D6    mov         eax,dword ptr [ebp+14]
 0049D9D9    inc         eax
 0049D9DA    push        eax
 0049D9DB    push        esi
 0049D9DC    call        gdi32.BitBlt
 0049D9E1    mov         eax,dword ptr [ebp-4]
 0049D9E4    mov         eax,dword ptr [eax+48]
 0049D9E7    mov         edx,0FF000010
 0049D9EC    call        TBrush.SetColor
 0049D9F1    mov         eax,dword ptr [ebp-4]
 0049D9F4    call        TCanvas.GetHandle
 0049D9F9    mov         esi,eax
 0049D9FB    push        0FFFFFF
 0049DA00    push        esi
 0049DA01    call        gdi32.SetTextColor
 0049DA06    push        0
 0049DA08    push        esi
 0049DA09    call        gdi32.SetBkColor
 0049DA0E    push        0E20746
 0049DA13    push        0
 0049DA15    push        0
 0049DA17    push        edi
 0049DA18    mov         eax,dword ptr [ebx+34]
 0049DA1B    push        eax
 0049DA1C    mov         eax,dword ptr [ebx+38]
 0049DA1F    push        eax
 0049DA20    mov         eax,dword ptr [ebp+10]
 0049DA23    push        eax
 0049DA24    mov         eax,dword ptr [ebp+14]
 0049DA27    push        eax
 0049DA28    push        esi
 0049DA29    call        gdi32.BitBlt
 0049DA2E    pop         edi
 0049DA2F    pop         esi
 0049DA30    pop         ebx
 0049DA31    mov         esp,ebp
 0049DA33    pop         ebp
 0049DA34    ret         10
*}
end;

//0049DA38
procedure TCustomImageList.Draw(Canvas:TCanvas; X:Integer; Enabled:Boolean; Index:Integer; Y:Integer);
begin
{*
 0049DA38    push        ebp
 0049DA39    mov         ebp,esp
 0049DA3B    push        ebx
 0049DA3C    mov         ebx,dword ptr [ebp+10]
 0049DA3F    push        ebx
 0049DA40    mov         ebx,dword ptr [ebp+0C]
 0049DA43    push        ebx
 0049DA44    movzx       ebx,byte ptr [eax+44]
 0049DA48    push        ebx
 0049DA49    movzx       ebx,byte ptr [eax+47]
 0049DA4D    push        ebx
 0049DA4E    movzx       ebx,byte ptr [ebp+8]
 0049DA52    push        ebx
 0049DA53    call        TCustomImageList.Draw
 0049DA58    pop         ebx
 0049DA59    pop         ebp
 0049DA5A    ret         0C
*}
end;

//0049DA60
procedure TCustomImageList.Draw(Canvas:TCanvas; X:Integer; Enabled:Boolean; AImageType:TImageType; ADrawingStyle:TDrawingStyle; Index:Integer; Y:Integer);
begin
{*
 0049DA60    push        ebp
 0049DA61    mov         ebp,esp
 0049DA63    push        ebx
 0049DA64    push        esi
 0049DA65    push        edi
 0049DA66    mov         edi,edx
 0049DA68    mov         esi,eax
 0049DA6A    cmp         dword ptr [esi+40],0
>0049DA6E    je          0049DA9D
 0049DA70    push        ecx
 0049DA71    mov         eax,dword ptr [ebp+18]
 0049DA74    push        eax
 0049DA75    movzx       eax,byte ptr [ebp+10]
 0049DA79    mov         eax,dword ptr [eax*4+785BB8]
 0049DA80    movzx       edx,byte ptr [ebp+0C]
 0049DA84    or          eax,dword ptr [edx*4+785BC8]
 0049DA8B    push        eax
 0049DA8C    movzx       eax,byte ptr [ebp+8]
 0049DA90    push        eax
 0049DA91    mov         edx,dword ptr [ebp+14]
 0049DA94    mov         eax,esi
 0049DA96    mov         ecx,edi
 0049DA98    mov         ebx,dword ptr [eax]
 0049DA9A    call        dword ptr [ebx+34]
 0049DA9D    pop         edi
 0049DA9E    pop         esi
 0049DA9F    pop         ebx
 0049DAA0    pop         ebp
 0049DAA1    ret         14
*}
end;

//0049DAA4
procedure TCustomImageList.DrawOverlay(Canvas:TCanvas; X:Integer; Enabled:Boolean; Overlay:TOverlay; ImageIndex:Integer; Y:Integer);
begin
{*
 0049DAA4    push        ebp
 0049DAA5    mov         ebp,esp
 0049DAA7    push        ebx
 0049DAA8    mov         ebx,dword ptr [ebp+14]
 0049DAAB    push        ebx
 0049DAAC    mov         ebx,dword ptr [ebp+10]
 0049DAAF    push        ebx
 0049DAB0    movzx       ebx,byte ptr [ebp+0C]
 0049DAB4    push        ebx
 0049DAB5    push        2
 0049DAB7    push        0
 0049DAB9    movzx       ebx,byte ptr [ebp+8]
 0049DABD    push        ebx
 0049DABE    call        TCustomImageList.DrawOverlay
 0049DAC3    pop         ebx
 0049DAC4    pop         ebp
 0049DAC5    ret         10
*}
end;

//0049DAC8
procedure TCustomImageList.DrawOverlay(Canvas:TCanvas; X:Integer; Enabled:Boolean; AImageType:TImageType; ADrawingStyle:TDrawingStyle; Overlay:TOverlay; ImageIndex:Integer; Y:Integer);
begin
{*
 0049DAC8    push        ebp
 0049DAC9    mov         ebp,esp
 0049DACB    push        ecx
 0049DACC    push        ebx
 0049DACD    push        esi
 0049DACE    push        edi
 0049DACF    mov         dword ptr [ebp-4],ecx
 0049DAD2    mov         esi,eax
 0049DAD4    cmp         dword ptr [esi+40],0
>0049DAD8    je          0049DB1A
 0049DADA    movzx       edi,byte ptr [ebp+14]
 0049DADE    inc         edi
 0049DADF    shl         edi,8
 0049DAE2    mov         eax,dword ptr [ebp-4]
 0049DAE5    push        eax
 0049DAE6    mov         eax,dword ptr [ebp+1C]
 0049DAE9    push        eax
 0049DAEA    movzx       eax,byte ptr [ebp+10]
 0049DAEE    mov         eax,dword ptr [eax*4+785BB8]
 0049DAF5    movzx       ecx,byte ptr [ebp+0C]
 0049DAF9    or          eax,dword ptr [ecx*4+785BC8]
 0049DB00    and         edi,0F00
 0049DB06    or          eax,edi
 0049DB08    push        eax
 0049DB09    movzx       eax,byte ptr [ebp+8]
 0049DB0D    push        eax
 0049DB0E    mov         ecx,edx
 0049DB10    mov         eax,esi
 0049DB12    mov         edx,dword ptr [ebp+18]
 0049DB15    mov         ebx,dword ptr [eax]
 0049DB17    call        dword ptr [ebx+34]
 0049DB1A    pop         edi
 0049DB1B    pop         esi
 0049DB1C    pop         ebx
 0049DB1D    pop         ecx
 0049DB1E    pop         ebp
 0049DB1F    ret         18
*}
end;

//0049DB24
function TCustomImageList.Overlay(ImageIndex:Integer; Overlay:TOverlay):Boolean;
begin
{*
 0049DB24    push        ebx
 0049DB25    push        esi
 0049DB26    push        edi
 0049DB27    mov         ebx,ecx
 0049DB29    mov         esi,edx
 0049DB2B    mov         edi,eax
 0049DB2D    cmp         dword ptr [edi+40],0
>0049DB31    je          0049DB4E
 0049DB33    movzx       eax,bl
 0049DB36    inc         eax
 0049DB37    push        eax
 0049DB38    push        esi
 0049DB39    mov         eax,edi
 0049DB3B    call        TCustomImageList.GetHandle
 0049DB40    push        eax
 0049DB41    call        comctl32.ImageList_SetOverlayImage
 0049DB46    cmp         eax,1
 0049DB49    sbb         eax,eax
 0049DB4B    inc         eax
>0049DB4C    jmp         0049DB50
 0049DB4E    xor         eax,eax
 0049DB50    pop         edi
 0049DB51    pop         esi
 0049DB52    pop         ebx
 0049DB53    ret
*}
end;

//0049DB54
procedure TCustomImageList.CopyImages(Value:HIMAGELIST; Index:Integer);
begin
{*
 0049DB54    push        ebp
 0049DB55    mov         ebp,esp
 0049DB57    add         esp,0FFFFFFDC
 0049DB5A    push        ebx
 0049DB5B    push        esi
 0049DB5C    push        edi
 0049DB5D    mov         dword ptr [ebp-0C],ecx
 0049DB60    mov         dword ptr [ebp-8],edx
 0049DB63    mov         dword ptr [ebp-4],eax
 0049DB66    mov         eax,dword ptr [ebp-4]
 0049DB69    mov         eax,dword ptr [eax+34]
 0049DB6C    push        eax
 0049DB6D    lea         eax,[ebp-24]
 0049DB70    push        eax
 0049DB71    mov         eax,dword ptr [ebp-4]
 0049DB74    mov         ecx,dword ptr [eax+38]
 0049DB77    xor         edx,edx
 0049DB79    xor         eax,eax
 0049DB7B    call        Rect
 0049DB80    mov         eax,dword ptr [ebp-4]
 0049DB83    call        TCustomImageList.BeginUpdate
 0049DB88    xor         eax,eax
 0049DB8A    push        ebp
 0049DB8B    push        49DCF8
 0049DB90    push        dword ptr fs:[eax]
 0049DB93    mov         dword ptr fs:[eax],esp
 0049DB96    mov         dl,1
 0049DB98    mov         eax,[00463B28];TBitmap
 0049DB9D    call        TBitmap.Create
 0049DBA2    mov         dword ptr [ebp-10],eax
 0049DBA5    xor         eax,eax
 0049DBA7    push        ebp
 0049DBA8    push        49DCDB
 0049DBAD    push        dword ptr fs:[eax]
 0049DBB0    mov         dword ptr fs:[eax],esp
 0049DBB3    mov         eax,dword ptr [ebp-4]
 0049DBB6    movzx       eax,byte ptr [eax+70]
 0049DBBA    movzx       edx,byte ptr [eax+785BEC]
 0049DBC1    mov         eax,dword ptr [ebp-10]
 0049DBC4    call        TBitmap.SetPixelFormat
 0049DBC9    mov         eax,dword ptr [ebp-4]
 0049DBCC    mov         ecx,dword ptr [eax+34]
 0049DBCF    mov         eax,dword ptr [ebp-4]
 0049DBD2    mov         edx,dword ptr [eax+38]
 0049DBD5    mov         eax,dword ptr [ebp-10]
 0049DBD8    mov         ebx,dword ptr [eax]
 0049DBDA    call        dword ptr [ebx+6C]
 0049DBDD    mov         dl,1
 0049DBDF    mov         eax,[00463B28];TBitmap
 0049DBE4    call        TBitmap.Create
 0049DBE9    mov         dword ptr [ebp-14],eax
 0049DBEC    xor         eax,eax
 0049DBEE    push        ebp
 0049DBEF    push        49DCBE
 0049DBF4    push        dword ptr fs:[eax]
 0049DBF7    mov         dword ptr fs:[eax],esp
 0049DBFA    mov         dl,1
 0049DBFC    mov         eax,dword ptr [ebp-14]
 0049DBFF    call        TBitmap.SetMonochrome
 0049DC04    mov         eax,dword ptr [ebp-4]
 0049DC07    mov         edx,dword ptr [eax+34]
 0049DC0A    mov         eax,dword ptr [ebp-14]
 0049DC0D    mov         ecx,dword ptr [eax]
 0049DC0F    call        dword ptr [ecx+38]
 0049DC12    mov         eax,dword ptr [ebp-4]
 0049DC15    mov         edx,dword ptr [eax+38]
 0049DC18    mov         eax,dword ptr [ebp-14]
 0049DC1B    mov         ecx,dword ptr [eax]
 0049DC1D    call        dword ptr [ecx+44]
 0049DC20    mov         eax,dword ptr [ebp-8]
 0049DC23    push        eax
 0049DC24    call        comctl32.ImageList_GetImageCount
 0049DC29    mov         esi,eax
 0049DC2B    dec         esi
 0049DC2C    test        esi,esi
>0049DC2E    jl          0049DCA8
 0049DC30    inc         esi
 0049DC31    xor         ebx,ebx
 0049DC33    cmp         dword ptr [ebp-0C],0FFFFFFFF
>0049DC37    je          0049DC3E
 0049DC39    cmp         ebx,dword ptr [ebp-0C]
>0049DC3C    jne         0049DCA4
 0049DC3E    mov         eax,dword ptr [ebp-10]
 0049DC41    call        TBitmap.GetCanvas
 0049DC46    mov         edi,eax
 0049DC48    lea         edx,[ebp-24]
 0049DC4B    mov         eax,edi
 0049DC4D    mov         ecx,dword ptr [eax]
 0049DC4F    call        dword ptr [ecx+54]
 0049DC52    push        0
 0049DC54    push        0
 0049DC56    push        0
 0049DC58    mov         eax,edi
 0049DC5A    call        TCanvas.GetHandle
 0049DC5F    push        eax
 0049DC60    push        ebx
 0049DC61    mov         eax,dword ptr [ebp-8]
 0049DC64    push        eax
 0049DC65    call        comctl32.ImageList_Draw
 0049DC6A    mov         eax,dword ptr [ebp-14]
 0049DC6D    call        TBitmap.GetCanvas
 0049DC72    mov         edi,eax
 0049DC74    lea         edx,[ebp-24]
 0049DC77    mov         eax,edi
 0049DC79    mov         ecx,dword ptr [eax]
 0049DC7B    call        dword ptr [ecx+54]
 0049DC7E    push        10
 0049DC80    push        0
 0049DC82    push        0
 0049DC84    mov         eax,edi
 0049DC86    call        TCanvas.GetHandle
 0049DC8B    push        eax
 0049DC8C    push        ebx
 0049DC8D    mov         eax,dword ptr [ebp-8]
 0049DC90    push        eax
 0049DC91    call        comctl32.ImageList_Draw
 0049DC96    mov         ecx,dword ptr [ebp-14]
 0049DC99    mov         edx,dword ptr [ebp-10]
 0049DC9C    mov         eax,dword ptr [ebp-4]
 0049DC9F    call        TCustomImageList.Add
 0049DCA4    inc         ebx
 0049DCA5    dec         esi
>0049DCA6    jne         0049DC33
 0049DCA8    xor         eax,eax
 0049DCAA    pop         edx
 0049DCAB    pop         ecx
 0049DCAC    pop         ecx
 0049DCAD    mov         dword ptr fs:[eax],edx
 0049DCB0    push        49DCC5
 0049DCB5    mov         eax,dword ptr [ebp-14]
 0049DCB8    call        TObject.Free
 0049DCBD    ret
>0049DCBE    jmp         @HandleFinally
>0049DCC3    jmp         0049DCB5
 0049DCC5    xor         eax,eax
 0049DCC7    pop         edx
 0049DCC8    pop         ecx
 0049DCC9    pop         ecx
 0049DCCA    mov         dword ptr fs:[eax],edx
 0049DCCD    push        49DCE2
 0049DCD2    mov         eax,dword ptr [ebp-10]
 0049DCD5    call        TObject.Free
 0049DCDA    ret
>0049DCDB    jmp         @HandleFinally
>0049DCE0    jmp         0049DCD2
 0049DCE2    xor         eax,eax
 0049DCE4    pop         edx
 0049DCE5    pop         ecx
 0049DCE6    pop         ecx
 0049DCE7    mov         dword ptr fs:[eax],edx
 0049DCEA    push        49DCFF
 0049DCEF    mov         eax,dword ptr [ebp-4]
 0049DCF2    call        TCustomImageList.EndUpdate
 0049DCF7    ret
>0049DCF8    jmp         @HandleFinally
>0049DCFD    jmp         0049DCEF
 0049DCFF    pop         edi
 0049DD00    pop         esi
 0049DD01    pop         ebx
 0049DD02    mov         esp,ebp
 0049DD04    pop         ebp
 0049DD05    ret
*}
end;

//0049DD08
procedure TCustomImageList.InsertImage(Index:Integer; Image:TBitmap; Mask:TBitmap; MaskColor:TColor);
begin
{*
 0049DD08    push        ebp
 0049DD09    mov         ebp,esp
 0049DD0B    add         esp,0FFFFFFF8
 0049DD0E    push        ebx
 0049DD0F    push        esi
 0049DD10    push        edi
 0049DD11    xor         ebx,ebx
 0049DD13    mov         dword ptr [ebp-8],ebx
 0049DD16    mov         edi,ecx
 0049DD18    mov         ebx,edx
 0049DD1A    mov         dword ptr [ebp-4],eax
 0049DD1D    mov         esi,dword ptr [ebp+8]
 0049DD20    xor         eax,eax
 0049DD22    push        ebp
 0049DD23    push        49DDFA
 0049DD28    push        dword ptr fs:[eax]
 0049DD2B    mov         dword ptr fs:[eax],esp
 0049DD2E    mov         eax,dword ptr [ebp-4]
 0049DD31    call        TCustomImageList.BeginUpdate
 0049DD36    xor         eax,eax
 0049DD38    push        ebp
 0049DD39    push        49DDDD
 0049DD3E    push        dword ptr fs:[eax]
 0049DD41    mov         dword ptr fs:[eax],esp
 0049DD44    mov         eax,dword ptr [ebp-4]
 0049DD47    call        TCustomImageList.GetCount
 0049DD4C    cmp         ebx,eax
>0049DD4E    jle         0049DD71
 0049DD50    lea         edx,[ebp-8]
 0049DD53    mov         eax,[0078CFDC];^SResString195:TResStringRec
 0049DD58    call        LoadResString
 0049DD5D    mov         ecx,dword ptr [ebp-8]
 0049DD60    mov         dl,1
 0049DD62    mov         eax,[00439268];EInvalidOperation
 0049DD67    call        Exception.Create
 0049DD6C    call        @RaiseExcept
 0049DD71    cmp         esi,0FFFFFFFF
>0049DD74    je          0049DD84
 0049DD76    mov         ecx,esi
 0049DD78    mov         edx,edi
 0049DD7A    mov         eax,dword ptr [ebp-4]
 0049DD7D    call        TCustomImageList.AddMasked
>0049DD82    jmp         0049DD91
 0049DD84    mov         ecx,dword ptr [ebp+0C]
 0049DD87    mov         edx,edi
 0049DD89    mov         eax,dword ptr [ebp-4]
 0049DD8C    call        TCustomImageList.Add
 0049DD91    mov         eax,dword ptr [ebp-4]
 0049DD94    call        TCustomImageList.GetCount
 0049DD99    sub         eax,2
 0049DD9C    mov         esi,ebx
 0049DD9E    sub         esi,eax
>0049DDA0    jg          0049DDC7
 0049DDA2    dec         esi
 0049DDA3    mov         ebx,eax
 0049DDA5    push        1
 0049DDA7    lea         eax,[ebx+1]
 0049DDAA    push        eax
 0049DDAB    mov         eax,dword ptr [ebp-4]
 0049DDAE    call        TCustomImageList.GetHandle
 0049DDB3    push        eax
 0049DDB4    push        ebx
 0049DDB5    mov         eax,dword ptr [ebp-4]
 0049DDB8    call        TCustomImageList.GetHandle
 0049DDBD    push        eax
 0049DDBE    call        comctl32.ImageList_Copy
 0049DDC3    dec         ebx
 0049DDC4    inc         esi
>0049DDC5    jne         0049DDA5
 0049DDC7    xor         eax,eax
 0049DDC9    pop         edx
 0049DDCA    pop         ecx
 0049DDCB    pop         ecx
 0049DDCC    mov         dword ptr fs:[eax],edx
 0049DDCF    push        49DDE4
 0049DDD4    mov         eax,dword ptr [ebp-4]
 0049DDD7    call        TCustomImageList.EndUpdate
 0049DDDC    ret
>0049DDDD    jmp         @HandleFinally
>0049DDE2    jmp         0049DDD4
 0049DDE4    xor         eax,eax
 0049DDE6    pop         edx
 0049DDE7    pop         ecx
 0049DDE8    pop         ecx
 0049DDE9    mov         dword ptr fs:[eax],edx
 0049DDEC    push        49DE01
 0049DDF1    lea         eax,[ebp-8]
 0049DDF4    call        @UStrClr
 0049DDF9    ret
>0049DDFA    jmp         @HandleFinally
>0049DDFF    jmp         0049DDF1
 0049DE01    pop         edi
 0049DE02    pop         esi
 0049DE03    pop         ebx
 0049DE04    pop         ecx
 0049DE05    pop         ecx
 0049DE06    pop         ebp
 0049DE07    ret         8
*}
end;

//0049DE0C
procedure TCustomImageList.Insert(Index:Integer; Image:TBitmap; Mask:TBitmap);
begin
{*
 0049DE0C    push        ebp
 0049DE0D    mov         ebp,esp
 0049DE0F    push        ebx
 0049DE10    mov         ebx,dword ptr [ebp+8]
 0049DE13    push        ebx
 0049DE14    push        0FF
 0049DE16    call        TCustomImageList.InsertImage
 0049DE1B    pop         ebx
 0049DE1C    pop         ebp
 0049DE1D    ret         4
*}
end;

//0049DE20
procedure TCustomImageList.InsertMasked(Index:Integer; Image:TBitmap; MaskColor:TColor);
begin
{*
 0049DE20    push        ebp
 0049DE21    mov         ebp,esp
 0049DE23    push        ebx
 0049DE24    push        0
 0049DE26    mov         ebx,dword ptr [ebp+8]
 0049DE29    push        ebx
 0049DE2A    call        TCustomImageList.InsertImage
 0049DE2F    pop         ebx
 0049DE30    pop         ebp
 0049DE31    ret         4
*}
end;

//0049DE34
procedure TCustomImageList.InsertIcon(Index:Integer; Image:TIcon);
begin
{*
 0049DE34    push        ebp
 0049DE35    mov         ebp,esp
 0049DE37    add         esp,0FFFFFFEC
 0049DE3A    push        ebx
 0049DE3B    push        esi
 0049DE3C    push        edi
 0049DE3D    xor         ebx,ebx
 0049DE3F    mov         dword ptr [ebp-14],ebx
 0049DE42    mov         dword ptr [ebp-8],ecx
 0049DE45    mov         edi,edx
 0049DE47    mov         dword ptr [ebp-4],eax
 0049DE4A    xor         eax,eax
 0049DE4C    push        ebp
 0049DE4D    push        49DF7F
 0049DE52    push        dword ptr fs:[eax]
 0049DE55    mov         dword ptr fs:[eax],esp
 0049DE58    xor         eax,eax
 0049DE5A    mov         dword ptr [ebp-10],eax
 0049DE5D    xor         eax,eax
 0049DE5F    mov         dword ptr [ebp-0C],eax
 0049DE62    mov         eax,dword ptr [ebp-4]
 0049DE65    call        TCustomImageList.BeginUpdate
 0049DE6A    xor         eax,eax
 0049DE6C    push        ebp
 0049DE6D    push        49DF62
 0049DE72    push        dword ptr fs:[eax]
 0049DE75    mov         dword ptr fs:[eax],esp
 0049DE78    push        5
 0049DE7A    mov         ecx,5
 0049DE7F    mov         dl,1
 0049DE81    mov         eax,[0049B7BC];TCustomImageList
 0049DE86    call        TCustomImageList.CreateSize
 0049DE8B    mov         dword ptr [ebp-0C],eax
 0049DE8E    mov         edx,dword ptr [ebp-4]
 0049DE91    mov         eax,dword ptr [ebp-0C]
 0049DE94    mov         ecx,dword ptr [eax]
 0049DE96    call        dword ptr [ecx+8]
 0049DE99    mov         eax,dword ptr [ebp-4]
 0049DE9C    call        TCustomImageList.Clear
 0049DEA1    mov         eax,dword ptr [ebp-0C]
 0049DEA4    call        TCustomImageList.GetCount
 0049DEA9    cmp         edi,eax
>0049DEAB    jle         0049DECE
 0049DEAD    lea         edx,[ebp-14]
 0049DEB0    mov         eax,[0078CFDC];^SResString195:TResStringRec
 0049DEB5    call        LoadResString
 0049DEBA    mov         ecx,dword ptr [ebp-14]
 0049DEBD    mov         dl,1
 0049DEBF    mov         eax,[00439268];EInvalidOperation
 0049DEC4    call        Exception.Create
 0049DEC9    call        @RaiseExcept
 0049DECE    mov         dl,1
 0049DED0    mov         eax,[00464454];TIcon
 0049DED5    call        TIcon.Create
 0049DEDA    mov         dword ptr [ebp-10],eax
 0049DEDD    mov         ebx,edi
 0049DEDF    dec         ebx
 0049DEE0    test        ebx,ebx
>0049DEE2    jl          0049DF03
 0049DEE4    inc         ebx
 0049DEE5    xor         esi,esi
 0049DEE7    mov         ecx,dword ptr [ebp-10]
 0049DEEA    mov         edx,esi
 0049DEEC    mov         eax,dword ptr [ebp-0C]
 0049DEEF    call        TCustomImageList.GetIcon
 0049DEF4    mov         edx,dword ptr [ebp-10]
 0049DEF7    mov         eax,dword ptr [ebp-4]
 0049DEFA    call        TCustomImageList.AddIcon
 0049DEFF    inc         esi
 0049DF00    dec         ebx
>0049DF01    jne         0049DEE7
 0049DF03    mov         edx,dword ptr [ebp-8]
 0049DF06    mov         eax,dword ptr [ebp-4]
 0049DF09    call        TCustomImageList.AddIcon
 0049DF0E    mov         esi,edi
 0049DF10    mov         eax,dword ptr [ebp-0C]
 0049DF13    call        TCustomImageList.GetCount
 0049DF18    mov         ebx,eax
 0049DF1A    dec         ebx
 0049DF1B    sub         ebx,esi
>0049DF1D    jl          0049DF3C
 0049DF1F    inc         ebx
 0049DF20    mov         ecx,dword ptr [ebp-10]
 0049DF23    mov         edx,esi
 0049DF25    mov         eax,dword ptr [ebp-0C]
 0049DF28    call        TCustomImageList.GetIcon
 0049DF2D    mov         edx,dword ptr [ebp-10]
 0049DF30    mov         eax,dword ptr [ebp-4]
 0049DF33    call        TCustomImageList.AddIcon
 0049DF38    inc         esi
 0049DF39    dec         ebx
>0049DF3A    jne         0049DF20
 0049DF3C    xor         eax,eax
 0049DF3E    pop         edx
 0049DF3F    pop         ecx
 0049DF40    pop         ecx
 0049DF41    mov         dword ptr fs:[eax],edx
 0049DF44    push        49DF69
 0049DF49    mov         eax,dword ptr [ebp-4]
 0049DF4C    call        TCustomImageList.EndUpdate
 0049DF51    mov         eax,dword ptr [ebp-10]
 0049DF54    call        TObject.Free
 0049DF59    mov         eax,dword ptr [ebp-0C]
 0049DF5C    call        TObject.Free
 0049DF61    ret
>0049DF62    jmp         @HandleFinally
>0049DF67    jmp         0049DF49
 0049DF69    xor         eax,eax
 0049DF6B    pop         edx
 0049DF6C    pop         ecx
 0049DF6D    pop         ecx
 0049DF6E    mov         dword ptr fs:[eax],edx
 0049DF71    push        49DF86
 0049DF76    lea         eax,[ebp-14]
 0049DF79    call        @UStrClr
 0049DF7E    ret
>0049DF7F    jmp         @HandleFinally
>0049DF84    jmp         0049DF76
 0049DF86    pop         edi
 0049DF87    pop         esi
 0049DF88    pop         ebx
 0049DF89    mov         esp,ebp
 0049DF8B    pop         ebp
 0049DF8C    ret
*}
end;

//0049DF90
procedure TCustomImageList.Move(CurIndex:Integer; NewIndex:Integer);
begin
{*
 0049DF90    push        ebx
 0049DF91    push        esi
 0049DF92    push        edi
 0049DF93    push        ebp
 0049DF94    mov         ebp,edx
 0049DF96    mov         esi,eax
 0049DF98    cmp         ecx,ebp
>0049DF9A    jge         0049DFC5
 0049DF9C    mov         edi,ecx
 0049DF9E    mov         ebx,ebp
 0049DFA0    dec         ebx
 0049DFA1    sub         ebx,edi
>0049DFA3    jl          0049DFF0
 0049DFA5    inc         ebx
 0049DFA6    push        1
 0049DFA8    push        ebp
 0049DFA9    mov         eax,esi
 0049DFAB    call        TCustomImageList.GetHandle
 0049DFB0    push        eax
 0049DFB1    push        edi
 0049DFB2    mov         eax,esi
 0049DFB4    call        TCustomImageList.GetHandle
 0049DFB9    push        eax
 0049DFBA    call        comctl32.ImageList_Copy
 0049DFBF    inc         edi
 0049DFC0    dec         ebx
>0049DFC1    jne         0049DFA6
>0049DFC3    jmp         0049DFF0
 0049DFC5    cmp         ecx,ebp
>0049DFC7    jle         0049DFF0
 0049DFC9    mov         edi,ecx
 0049DFCB    lea         ebx,[ebp+1]
 0049DFCE    sub         ebx,edi
>0049DFD0    jg          0049DFF0
 0049DFD2    dec         ebx
 0049DFD3    push        1
 0049DFD5    push        ebp
 0049DFD6    mov         eax,esi
 0049DFD8    call        TCustomImageList.GetHandle
 0049DFDD    push        eax
 0049DFDE    push        edi
 0049DFDF    mov         eax,esi
 0049DFE1    call        TCustomImageList.GetHandle
 0049DFE6    push        eax
 0049DFE7    call        comctl32.ImageList_Copy
 0049DFEC    dec         edi
 0049DFED    inc         ebx
>0049DFEE    jne         0049DFD3
 0049DFF0    pop         ebp
 0049DFF1    pop         edi
 0049DFF2    pop         esi
 0049DFF3    pop         ebx
 0049DFF4    ret
*}
end;

//0049DFF8
function TCustomImageList.AddImage(Value:TCustomImageList; Index:Integer):Integer;
begin
{*
 0049DFF8    push        ebx
 0049DFF9    push        esi
 0049DFFA    push        edi
 0049DFFB    push        ebp
 0049DFFC    mov         ebp,ecx
 0049DFFE    mov         esi,edx
 0049E000    mov         ebx,eax
 0049E002    test        esi,esi
>0049E004    je          0049E023
 0049E006    mov         eax,ebx
 0049E008    call        TCustomImageList.GetCount
 0049E00D    mov         edi,eax
 0049E00F    mov         eax,esi
 0049E011    call        TCustomImageList.GetHandle
 0049E016    mov         edx,eax
 0049E018    mov         ecx,ebp
 0049E01A    mov         eax,ebx
 0049E01C    call        TCustomImageList.CopyImages
>0049E021    jmp         0049E026
 0049E023    or          edi,0FFFFFFFF
 0049E026    mov         eax,edi
 0049E028    pop         ebp
 0049E029    pop         edi
 0049E02A    pop         esi
 0049E02B    pop         ebx
 0049E02C    ret
*}
end;

//0049E030
procedure TCustomImageList.AddImages(Value:TCustomImageList);
begin
{*
 0049E030    push        ebx
 0049E031    push        esi
 0049E032    mov         esi,edx
 0049E034    mov         ebx,eax
 0049E036    test        esi,esi
>0049E038    je          0049E04D
 0049E03A    mov         eax,esi
 0049E03C    call        TCustomImageList.GetHandle
 0049E041    mov         edx,eax
 0049E043    or          ecx,0FFFFFFFF
 0049E046    mov         eax,ebx
 0049E048    call        TCustomImageList.CopyImages
 0049E04D    pop         esi
 0049E04E    pop         ebx
 0049E04F    ret
*}
end;

//0049E050
procedure TCustomImageList.Assign(Source:TPersistent);
begin
{*
 0049E050    push        ebp
 0049E051    mov         ebp,esp
 0049E053    push        ecx
 0049E054    push        ebx
 0049E055    push        esi
 0049E056    mov         esi,edx
 0049E058    mov         ebx,eax
 0049E05A    test        esi,esi
>0049E05C    jne         0049E067
 0049E05E    mov         eax,ebx
 0049E060    call        TCustomImageList.FreeHandle
>0049E065    jmp         0049E0DB
 0049E067    mov         eax,esi
 0049E069    mov         edx,dword ptr ds:[49B7BC];TCustomImageList
 0049E06F    call        @IsClass
 0049E074    test        al,al
>0049E076    je          0049E0D2
 0049E078    mov         dl,1
 0049E07A    mov         eax,[0043DAFC];TMemoryStream
 0049E07F    call        TObject.Create
 0049E084    mov         dword ptr [ebp-4],eax
 0049E087    xor         eax,eax
 0049E089    push        ebp
 0049E08A    push        49E0CB
 0049E08F    push        dword ptr fs:[eax]
 0049E092    mov         dword ptr fs:[eax],esp
 0049E095    mov         edx,dword ptr [ebp-4]
 0049E098    mov         eax,esi
 0049E09A    mov         ecx,dword ptr [eax]
 0049E09C    call        dword ptr [ecx+40]
 0049E09F    push        0
 0049E0A1    push        0
 0049E0A3    mov         eax,dword ptr [ebp-4]
 0049E0A6    call        TStream.SetPosition
 0049E0AB    mov         edx,dword ptr [ebp-4]
 0049E0AE    mov         eax,ebx
 0049E0B0    mov         ecx,dword ptr [eax]
 0049E0B2    call        dword ptr [ecx+3C]
 0049E0B5    xor         eax,eax
 0049E0B7    pop         edx
 0049E0B8    pop         ecx
 0049E0B9    pop         ecx
 0049E0BA    mov         dword ptr fs:[eax],edx
 0049E0BD    push        49E0DB
 0049E0C2    mov         eax,dword ptr [ebp-4]
 0049E0C5    call        TObject.Free
 0049E0CA    ret
>0049E0CB    jmp         @HandleFinally
>0049E0D0    jmp         0049E0C2
 0049E0D2    mov         edx,esi
 0049E0D4    mov         eax,ebx
 0049E0D6    call        TPersistent.Assign
 0049E0DB    pop         esi
 0049E0DC    pop         ebx
 0049E0DD    pop         ecx
 0049E0DE    pop         ebp
 0049E0DF    ret
*}
end;

//0049E0E0
procedure TCustomImageList.AssignTo(Dest:TPersistent);
begin
{*
 0049E0E0    push        ebp
 0049E0E1    mov         ebp,esp
 0049E0E3    push        ecx
 0049E0E4    push        ebx
 0049E0E5    push        esi
 0049E0E6    mov         esi,edx
 0049E0E8    mov         ebx,eax
 0049E0EA    mov         eax,esi
 0049E0EC    mov         edx,dword ptr ds:[49B7BC];TCustomImageList
 0049E0F2    call        @IsClass
 0049E0F7    test        al,al
>0049E0F9    je          0049E155
 0049E0FB    mov         dl,1
 0049E0FD    mov         eax,[0043DAFC];TMemoryStream
 0049E102    call        TObject.Create
 0049E107    mov         dword ptr [ebp-4],eax
 0049E10A    xor         eax,eax
 0049E10C    push        ebp
 0049E10D    push        49E14E
 0049E112    push        dword ptr fs:[eax]
 0049E115    mov         dword ptr fs:[eax],esp
 0049E118    mov         edx,dword ptr [ebp-4]
 0049E11B    mov         eax,ebx
 0049E11D    mov         ecx,dword ptr [eax]
 0049E11F    call        dword ptr [ecx+40]
 0049E122    push        0
 0049E124    push        0
 0049E126    mov         eax,dword ptr [ebp-4]
 0049E129    call        TStream.SetPosition
 0049E12E    mov         edx,dword ptr [ebp-4]
 0049E131    mov         eax,esi
 0049E133    mov         ecx,dword ptr [eax]
 0049E135    call        dword ptr [ecx+3C]
 0049E138    xor         eax,eax
 0049E13A    pop         edx
 0049E13B    pop         ecx
 0049E13C    pop         ecx
 0049E13D    mov         dword ptr fs:[eax],edx
 0049E140    push        49E15E
 0049E145    mov         eax,dword ptr [ebp-4]
 0049E148    call        TObject.Free
 0049E14D    ret
>0049E14E    jmp         @HandleFinally
>0049E153    jmp         0049E145
 0049E155    mov         edx,esi
 0049E157    mov         eax,ebx
 0049E159    call        TPersistent.AssignTo
 0049E15E    pop         esi
 0049E15F    pop         ebx
 0049E160    pop         ecx
 0049E161    pop         ebp
 0049E162    ret
*}
end;

//0049E164
procedure TCustomImageList.CheckImage(Image:TGraphic);
begin
{*
 0049E164    push        ebp
 0049E165    mov         ebp,esp
 0049E167    push        0
 0049E169    push        ebx
 0049E16A    push        esi
 0049E16B    mov         esi,edx
 0049E16D    mov         ebx,eax
 0049E16F    xor         eax,eax
 0049E171    push        ebp
 0049E172    push        49E1D0
 0049E177    push        dword ptr fs:[eax]
 0049E17A    mov         dword ptr fs:[eax],esp
 0049E17D    test        esi,esi
>0049E17F    je          0049E1BA
 0049E181    mov         eax,esi
 0049E183    mov         edx,dword ptr [eax]
 0049E185    call        dword ptr [edx+24]
 0049E188    cmp         eax,dword ptr [ebx+34]
>0049E18B    jl          0049E199
 0049E18D    mov         eax,esi
 0049E18F    mov         edx,dword ptr [eax]
 0049E191    call        dword ptr [edx+30]
 0049E194    cmp         eax,dword ptr [ebx+38]
>0049E197    jge         0049E1BA
 0049E199    lea         edx,[ebp-4]
 0049E19C    mov         eax,[0078CFC4];^SResString192:TResStringRec
 0049E1A1    call        LoadResString
 0049E1A6    mov         ecx,dword ptr [ebp-4]
 0049E1A9    mov         dl,1
 0049E1AB    mov         eax,[00439268];EInvalidOperation
 0049E1B0    call        Exception.Create
 0049E1B5    call        @RaiseExcept
 0049E1BA    xor         eax,eax
 0049E1BC    pop         edx
 0049E1BD    pop         ecx
 0049E1BE    pop         ecx
 0049E1BF    mov         dword ptr fs:[eax],edx
 0049E1C2    push        49E1D7
 0049E1C7    lea         eax,[ebp-4]
 0049E1CA    call        @UStrClr
 0049E1CF    ret
>0049E1D0    jmp         @HandleFinally
>0049E1D5    jmp         0049E1C7
 0049E1D7    pop         esi
 0049E1D8    pop         ebx
 0049E1D9    pop         ecx
 0049E1DA    pop         ebp
 0049E1DB    ret
*}
end;

//0049E1DC
procedure TCustomImageList.SetDrawingStyle(Value:TDrawingStyle);
begin
{*
 0049E1DC    push        esi
 0049E1DD    mov         esi,eax
 0049E1DF    cmp         dl,byte ptr [esi+44]
>0049E1E2    je          0049E1F2
 0049E1E4    mov         byte ptr [esi+44],dl
 0049E1E7    mov         eax,esi
 0049E1E9    mov         si,0FFF0
 0049E1ED    call        @CallDynaInst
 0049E1F2    pop         esi
 0049E1F3    ret
*}
end;

//0049E1F4
function TCustomImageList.GetHotSpot:TPoint;
begin
{*
 0049E1F4    add         esp,0FFFFFFF8
 0049E1F7    xor         eax,eax
 0049E1F9    mov         dword ptr [esp],eax
 0049E1FC    xor         eax,eax
 0049E1FE    mov         dword ptr [esp+4],eax
 0049E202    mov         eax,dword ptr [esp]
 0049E205    mov         dword ptr [edx],eax
 0049E207    mov         eax,dword ptr [esp+4]
 0049E20B    mov         dword ptr [edx+4],eax
 0049E20E    pop         ecx
 0049E20F    pop         edx
 0049E210    ret
*}
end;

//0049E214
function TCustomImageList.GetInstRes(Instance:Cardinal; ResType:TResType; MaskColor:TColor; LoadFlags:TLoadResources; Width:Integer; ResID:Cardinal):Boolean;
begin
{*
 0049E214    push        ebp
 0049E215    mov         ebp,esp
 0049E217    push        ebx
 0049E218    mov         ebx,dword ptr [ebp+14]
 0049E21B    push        ebx
 0049E21C    mov         ebx,dword ptr [ebp+10]
 0049E21F    push        ebx
 0049E220    movzx       ebx,byte ptr [ebp+0C]
 0049E224    push        ebx
 0049E225    mov         ebx,dword ptr [ebp+8]
 0049E228    push        ebx
 0049E229    call        TCustomImageList.InternalGetInstRes
 0049E22E    pop         ebx
 0049E22F    pop         ebp
 0049E230    ret         10
*}
end;

//0049E234
function TCustomImageList.GetInstRes(Instance:Cardinal; ResType:TResType; MaskColor:TColor; LoadFlags:TLoadResources; Width:Integer; Name:string):Boolean;
begin
{*
 0049E234    push        ebp
 0049E235    mov         ebp,esp
 0049E237    push        ebx
 0049E238    push        esi
 0049E239    push        edi
 0049E23A    mov         ebx,ecx
 0049E23C    mov         esi,edx
 0049E23E    mov         edi,eax
 0049E240    mov         eax,dword ptr [ebp+14]
 0049E243    call        @UStrToPWChar
 0049E248    push        eax
 0049E249    mov         eax,dword ptr [ebp+10]
 0049E24C    push        eax
 0049E24D    movzx       eax,byte ptr [ebp+0C]
 0049E251    push        eax
 0049E252    mov         eax,dword ptr [ebp+8]
 0049E255    push        eax
 0049E256    mov         ecx,ebx
 0049E258    mov         edx,esi
 0049E25A    mov         eax,edi
 0049E25C    call        TCustomImageList.InternalGetInstRes
 0049E261    pop         edi
 0049E262    pop         esi
 0049E263    pop         ebx
 0049E264    pop         ebp
 0049E265    ret         10
*}
end;

//0049E268
function TCustomImageList.InternalGetInstRes(Instance:THandle; ResType:TResType; Name:PChar; Width:Integer; LoadFlags:TLoadResources; MaskColor:TColor):Boolean;
begin
{*
 0049E268    push        ebp
 0049E269    mov         ebp,esp
 0049E26B    add         esp,0FFFFFFF8
 0049E26E    push        ebx
 0049E26F    push        esi
 0049E270    push        edi
 0049E271    mov         byte ptr [ebp-5],cl
 0049E274    mov         dword ptr [ebp-4],edx
 0049E277    mov         edi,eax
 0049E279    mov         eax,dword ptr [ebp+0C]
 0049E27C    xor         esi,esi
 0049E27E    test        al,1
>0049E280    je          0049E285
 0049E282    or          esi,0
 0049E285    test        al,2
>0049E287    je          0049E28C
 0049E289    or          esi,40
 0049E28C    test        al,4
>0049E28E    je          0049E293
 0049E290    or          esi,10
 0049E293    test        al,8
>0049E295    je          0049E29D
 0049E297    or          esi,1000
 0049E29D    test        al,10
>0049E29F    je          0049E2A4
 0049E2A1    or          esi,20
 0049E2A4    test        al,20
>0049E2A6    je          0049E2AB
 0049E2A8    or          esi,1
 0049E2AB    push        esi
 0049E2AC    movzx       eax,byte ptr [ebp-5]
 0049E2B0    mov         eax,dword ptr [eax*4+785BFC]
 0049E2B7    push        eax
 0049E2B8    mov         eax,dword ptr [ebp+8]
 0049E2BB    push        eax
 0049E2BC    mov         eax,dword ptr [edi+3C]
 0049E2BF    push        eax
 0049E2C0    mov         eax,dword ptr [ebp+10]
 0049E2C3    push        eax
 0049E2C4    mov         eax,dword ptr [ebp+14]
 0049E2C7    push        eax
 0049E2C8    mov         eax,dword ptr [ebp-4]
 0049E2CB    push        eax
 0049E2CC    call        comctl32.ImageList_LoadImageW
 0049E2D1    mov         ebx,eax
 0049E2D3    test        ebx,ebx
>0049E2D5    je          0049E2ED
 0049E2D7    or          ecx,0FFFFFFFF
 0049E2DA    mov         edx,ebx
 0049E2DC    mov         eax,edi
 0049E2DE    call        TCustomImageList.CopyImages
 0049E2E3    push        ebx
 0049E2E4    call        comctl32.ImageList_Destroy
 0049E2E9    mov         al,1
>0049E2EB    jmp         0049E2EF
 0049E2ED    xor         eax,eax
 0049E2EF    pop         edi
 0049E2F0    pop         esi
 0049E2F1    pop         ebx
 0049E2F2    pop         ecx
 0049E2F3    pop         ecx
 0049E2F4    pop         ebp
 0049E2F5    ret         10
*}
end;

//0049E2F8
function TCustomImageList.GetResource(ResType:TResType; Name:string; MaskColor:TColor; LoadFlags:TLoadResources; Width:Integer):Boolean;
begin
{*
 0049E2F8    push        ebp
 0049E2F9    mov         ebp,esp
 0049E2FB    push        ecx
 0049E2FC    mov         ecx,dword ptr [ebp+10]
 0049E2FF    push        ecx
 0049E300    movzx       ecx,byte ptr [ebp+0C]
 0049E304    push        ecx
 0049E305    mov         ecx,dword ptr [ebp+8]
 0049E308    push        ecx
 0049E309    mov         ecx,dword ptr ds:[78D078];MainInstance:Cardinal
 0049E30F    mov         ecx,dword ptr [ecx]
 0049E311    xchg        ecx,edx
 0049E313    call        TCustomImageList.GetInstRes
 0049E318    pop         ebp
 0049E319    ret         0C
*}
end;

//0049E31C
function TCustomImageList.ResInstLoad(Instance:Cardinal; ResType:TResType; MaskColor:TColor; Name:string):Boolean;
begin
{*
 0049E31C    push        ebp
 0049E31D    mov         ebp,esp
 0049E31F    push        ebx
 0049E320    mov         ebx,dword ptr [ebp+0C]
 0049E323    push        ebx
 0049E324    mov         ebx,dword ptr [eax+38]
 0049E327    push        ebx
 0049E328    movzx       ebx,byte ptr ds:[49E340]
 0049E32F    push        ebx
 0049E330    mov         ebx,dword ptr [ebp+8]
 0049E333    push        ebx
 0049E334    call        TCustomImageList.GetInstRes
 0049E339    pop         ebx
 0049E33A    pop         ebp
 0049E33B    ret         8
*}
end;

//0049E344
function TCustomImageList.ResourceLoad(ResType:TResType; Name:string; MaskColor:TColor):Boolean;
begin
{*
 0049E344    push        ebp
 0049E345    mov         ebp,esp
 0049E347    add         esp,0FFFFFFF4
 0049E34A    push        ebx
 0049E34B    push        esi
 0049E34C    push        edi
 0049E34D    mov         dword ptr [ebp-0C],ecx
 0049E350    mov         byte ptr [ebp-5],dl
 0049E353    mov         dword ptr [ebp-4],eax
 0049E356    xor         ebx,ebx
 0049E358    mov         eax,[0078D078];MainInstance:Cardinal
 0049E35D    mov         eax,dword ptr [eax]
 0049E35F    cmp         eax,dword ptr ds:[790C38];gvar_00790C38
>0049E365    jne         0049E396
 0049E367    mov         eax,dword ptr [ebp-0C]
 0049E36A    push        eax
 0049E36B    mov         eax,dword ptr [ebp-4]
 0049E36E    mov         eax,dword ptr [eax+38]
 0049E371    push        eax
 0049E372    movzx       eax,byte ptr ds:[49E418]
 0049E379    push        eax
 0049E37A    mov         eax,dword ptr [ebp+8]
 0049E37D    push        eax
 0049E37E    mov         edx,dword ptr ds:[78D078];MainInstance:Cardinal
 0049E384    mov         edx,dword ptr [edx]
 0049E386    movzx       ecx,byte ptr [ebp-5]
 0049E38A    mov         eax,dword ptr [ebp-4]
 0049E38D    call        TCustomImageList.GetInstRes
 0049E392    mov         ebx,eax
>0049E394    jmp         0049E40A
 0049E396    mov         esi,dword ptr ds:[78D8B8];^gvar_00784034
 0049E39C    mov         esi,dword ptr [esi]
 0049E39E    test        esi,esi
>0049E3A0    je          0049E40A
 0049E3A2    mov         edi,esi
 0049E3A4    mov         eax,dword ptr [ebp-0C]
 0049E3A7    push        eax
 0049E3A8    mov         eax,dword ptr [ebp-4]
 0049E3AB    mov         eax,dword ptr [eax+38]
 0049E3AE    push        eax
 0049E3AF    movzx       eax,byte ptr ds:[49E418]
 0049E3B6    push        eax
 0049E3B7    mov         eax,dword ptr [ebp+8]
 0049E3BA    push        eax
 0049E3BB    movzx       ecx,byte ptr [ebp-5]
 0049E3BF    mov         edx,dword ptr [edi+10]
 0049E3C2    mov         eax,dword ptr [ebp-4]
 0049E3C5    call        TCustomImageList.GetInstRes
 0049E3CA    mov         ebx,eax
 0049E3CC    test        bl,bl
>0049E3CE    jne         0049E400
 0049E3D0    mov         eax,dword ptr [edi+4]
 0049E3D3    cmp         eax,dword ptr [edi+10]
>0049E3D6    je          0049E400
 0049E3D8    mov         eax,dword ptr [ebp-0C]
 0049E3DB    push        eax
 0049E3DC    mov         eax,dword ptr [ebp-4]
 0049E3DF    mov         eax,dword ptr [eax+38]
 0049E3E2    push        eax
 0049E3E3    movzx       eax,byte ptr ds:[49E418]
 0049E3EA    push        eax
 0049E3EB    mov         eax,dword ptr [ebp+8]
 0049E3EE    push        eax
 0049E3EF    movzx       ecx,byte ptr [ebp-5]
 0049E3F3    mov         edx,dword ptr [edi+4]
 0049E3F6    mov         eax,dword ptr [ebp-4]
 0049E3F9    call        TCustomImageList.GetInstRes
 0049E3FE    mov         ebx,eax
 0049E400    test        bl,bl
>0049E402    jne         0049E40A
 0049E404    mov         esi,dword ptr [esi]
 0049E406    test        esi,esi
>0049E408    jne         0049E3A2
 0049E40A    mov         eax,ebx
 0049E40C    pop         edi
 0049E40D    pop         esi
 0049E40E    pop         ebx
 0049E40F    mov         esp,ebp
 0049E411    pop         ebp
 0049E412    ret         4
*}
end;

//0049E41C
function TCustomImageList.FileLoad(ResType:TResType; Name:string; MaskColor:TColor):Boolean;
begin
{*
 0049E41C    push        ebp
 0049E41D    mov         ebp,esp
 0049E41F    push        ebx
 0049E420    mov         ebx,dword ptr [eax+38]
 0049E423    push        ebx
 0049E424    movzx       ebx,byte ptr ds:[49E43C]
 0049E42B    push        ebx
 0049E42C    mov         ebx,dword ptr [ebp+8]
 0049E42F    push        ebx
 0049E430    call        TCustomImageList.GetResource
 0049E435    pop         ebx
 0049E436    pop         ebp
 0049E437    ret         4
*}
end;

//0049E440
procedure TCustomImageList.Change;
begin
{*
 0049E440    push        ebx
 0049E441    push        esi
 0049E442    push        edi
 0049E443    push        ebp
 0049E444    mov         ebx,eax
 0049E446    mov         byte ptr [ebx+5C],1
 0049E44A    cmp         dword ptr [ebx+60],0
>0049E44E    jg          0049E488
 0049E450    mov         eax,dword ptr [ebx+50]
 0049E453    test        eax,eax
>0049E455    je          0049E479
 0049E457    mov         edi,dword ptr [eax+8]
 0049E45A    dec         edi
 0049E45B    test        edi,edi
>0049E45D    jl          0049E479
 0049E45F    inc         edi
 0049E460    xor         ebp,ebp
 0049E462    mov         edx,ebp
 0049E464    mov         eax,dword ptr [ebx+50]
 0049E467    call        TList.Get
 0049E46C    mov         si,0FFFF
 0049E470    call        @CallDynaInst
 0049E475    inc         ebp
 0049E476    dec         edi
>0049E477    jne         0049E462
 0049E479    cmp         word ptr [ebx+6A],0
>0049E47E    je          0049E488
 0049E480    mov         edx,ebx
 0049E482    mov         eax,dword ptr [ebx+6C]
 0049E485    call        dword ptr [ebx+68]
 0049E488    pop         ebp
 0049E489    pop         edi
 0049E48A    pop         esi
 0049E48B    pop         ebx
 0049E48C    ret
*}
end;

//0049E490
procedure TCustomImageList.UnRegisterChanges(Value:TChangeLink);
begin
{*
 0049E490    push        ebx
 0049E491    push        esi
 0049E492    push        edi
 0049E493    push        ebp
 0049E494    mov         ebp,edx
 0049E496    mov         ebx,eax
 0049E498    mov         eax,dword ptr [ebx+50]
 0049E49B    test        eax,eax
>0049E49D    je          0049E4CD
 0049E49F    mov         edi,dword ptr [eax+8]
 0049E4A2    dec         edi
 0049E4A3    test        edi,edi
>0049E4A5    jl          0049E4CD
 0049E4A7    inc         edi
 0049E4A8    xor         esi,esi
 0049E4AA    mov         edx,esi
 0049E4AC    mov         eax,dword ptr [ebx+50]
 0049E4AF    call        TList.Get
 0049E4B4    cmp         ebp,eax
>0049E4B6    jne         0049E4C9
 0049E4B8    xor         eax,eax
 0049E4BA    mov         dword ptr [ebp+4],eax
 0049E4BD    mov         edx,esi
 0049E4BF    mov         eax,dword ptr [ebx+50]
 0049E4C2    call        TList.Delete
>0049E4C7    jmp         0049E4CD
 0049E4C9    inc         esi
 0049E4CA    dec         edi
>0049E4CB    jne         0049E4AA
 0049E4CD    pop         ebp
 0049E4CE    pop         edi
 0049E4CF    pop         esi
 0049E4D0    pop         ebx
 0049E4D1    ret
*}
end;

//0049E4D4
procedure TCustomImageList.RegisterChanges(Value:TChangeLink);
begin
{*
 0049E4D4    mov         dword ptr [edx+4],eax
 0049E4D7    mov         ecx,dword ptr [eax+50]
 0049E4DA    test        ecx,ecx
>0049E4DC    je          0049E4E5
 0049E4DE    mov         eax,ecx
 0049E4E0    call        TList.Add
 0049E4E5    ret
*}
end;

//0049E4E8
function StreamsEqual(S1:TMemoryStream; S2:TMemoryStream):Boolean;
begin
{*
 0049E4E8    push        ebx
 0049E4E9    push        esi
 0049E4EA    mov         esi,edx
 0049E4EC    mov         ebx,eax
 0049E4EE    mov         eax,ebx
 0049E4F0    mov         edx,dword ptr [eax]
 0049E4F2    call        dword ptr [edx]
 0049E4F4    push        edx
 0049E4F5    push        eax
 0049E4F6    mov         eax,esi
 0049E4F8    mov         edx,dword ptr [eax]
 0049E4FA    call        dword ptr [edx]
 0049E4FC    cmp         edx,dword ptr [esp+4]
>0049E500    jne         0049E505
 0049E502    cmp         eax,dword ptr [esp]
 0049E505    pop         edx
 0049E506    pop         eax
>0049E507    jne         0049E520
 0049E509    mov         eax,ebx
 0049E50B    mov         edx,dword ptr [eax]
 0049E50D    call        dword ptr [edx]
 0049E50F    mov         ecx,eax
 0049E511    mov         edx,dword ptr [esi+4]
 0049E514    mov         eax,dword ptr [ebx+4]
 0049E517    call        CompareMem
 0049E51C    test        al,al
>0049E51E    jne         0049E525
 0049E520    xor         eax,eax
 0049E522    pop         esi
 0049E523    pop         ebx
 0049E524    ret
 0049E525    mov         al,1
 0049E527    pop         esi
 0049E528    pop         ebx
 0049E529    ret
*}
end;

//0049E52C
function TCustomImageList.Equal(IL:TCustomImageList):Boolean;
begin
{*
 0049E52C    push        ebp
 0049E52D    mov         ebp,esp
 0049E52F    add         esp,0FFFFFFF4
 0049E532    push        ebx
 0049E533    push        esi
 0049E534    push        edi
 0049E535    mov         edi,edx
 0049E537    mov         esi,eax
 0049E539    test        edi,edi
>0049E53B    je          0049E551
 0049E53D    mov         eax,esi
 0049E53F    call        TCustomImageList.GetCount
 0049E544    mov         ebx,eax
 0049E546    mov         eax,edi
 0049E548    call        TCustomImageList.GetCount
 0049E54D    cmp         ebx,eax
>0049E54F    je          0049E55A
 0049E551    mov         byte ptr [ebp-1],0
>0049E555    jmp         0049E60F
 0049E55A    mov         eax,esi
 0049E55C    call        TCustomImageList.GetCount
 0049E561    test        eax,eax
>0049E563    jne         0049E579
 0049E565    mov         eax,edi
 0049E567    call        TCustomImageList.GetCount
 0049E56C    test        eax,eax
>0049E56E    jne         0049E579
 0049E570    mov         byte ptr [ebp-1],1
>0049E574    jmp         0049E60F
 0049E579    mov         dl,1
 0049E57B    mov         eax,[0043DAFC];TMemoryStream
 0049E580    call        TObject.Create
 0049E585    mov         dword ptr [ebp-8],eax
 0049E588    xor         eax,eax
 0049E58A    push        ebp
 0049E58B    push        49E608
 0049E590    push        dword ptr fs:[eax]
 0049E593    mov         dword ptr fs:[eax],esp
 0049E596    mov         edx,dword ptr [ebp-8]
 0049E599    mov         eax,esi
 0049E59B    mov         ecx,dword ptr [eax]
 0049E59D    call        dword ptr [ecx+40]
 0049E5A0    mov         dl,1
 0049E5A2    mov         eax,[0043DAFC];TMemoryStream
 0049E5A7    call        TObject.Create
 0049E5AC    mov         dword ptr [ebp-0C],eax
 0049E5AF    xor         eax,eax
 0049E5B1    push        ebp
 0049E5B2    push        49E5EB
 0049E5B7    push        dword ptr fs:[eax]
 0049E5BA    mov         dword ptr fs:[eax],esp
 0049E5BD    mov         edx,dword ptr [ebp-0C]
 0049E5C0    mov         eax,edi
 0049E5C2    mov         ecx,dword ptr [eax]
 0049E5C4    call        dword ptr [ecx+40]
 0049E5C7    mov         edx,dword ptr [ebp-0C]
 0049E5CA    mov         eax,dword ptr [ebp-8]
 0049E5CD    call        StreamsEqual
 0049E5D2    mov         byte ptr [ebp-1],al
 0049E5D5    xor         eax,eax
 0049E5D7    pop         edx
 0049E5D8    pop         ecx
 0049E5D9    pop         ecx
 0049E5DA    mov         dword ptr fs:[eax],edx
 0049E5DD    push        49E5F2
 0049E5E2    mov         eax,dword ptr [ebp-0C]
 0049E5E5    call        TObject.Free
 0049E5EA    ret
>0049E5EB    jmp         @HandleFinally
>0049E5F0    jmp         0049E5E2
 0049E5F2    xor         eax,eax
 0049E5F4    pop         edx
 0049E5F5    pop         ecx
 0049E5F6    pop         ecx
 0049E5F7    mov         dword ptr fs:[eax],edx
 0049E5FA    push        49E60F
 0049E5FF    mov         eax,dword ptr [ebp-8]
 0049E602    call        TObject.Free
 0049E607    ret
>0049E608    jmp         @HandleFinally
>0049E60D    jmp         0049E5FF
 0049E60F    movzx       eax,byte ptr [ebp-1]
 0049E613    pop         edi
 0049E614    pop         esi
 0049E615    pop         ebx
 0049E616    mov         esp,ebp
 0049E618    pop         ebp
 0049E619    ret
*}
end;

//0049E61C
function DoWrite:Boolean;
begin
{*
 0049E61C    push        ebp
 0049E61D    mov         ebp,esp
 0049E61F    push        ebx
 0049E620    mov         eax,dword ptr [ebp+8]
 0049E623    mov         eax,dword ptr [eax-4]
 0049E626    cmp         dword ptr [eax+20],0
>0049E62A    je          0049E663
 0049E62C    mov         eax,dword ptr [ebp+8]
 0049E62F    mov         eax,dword ptr [eax-4]
 0049E632    mov         ebx,dword ptr [eax+20]
 0049E635    mov         eax,ebx
 0049E637    mov         edx,dword ptr ds:[49B7BC];TCustomImageList
 0049E63D    call        @IsClass
 0049E642    test        al,al
>0049E644    je          0049E65E
 0049E646    mov         eax,dword ptr [ebp+8]
 0049E649    mov         edx,ebx
 0049E64B    mov         eax,dword ptr [ebp+8]
 0049E64E    mov         eax,dword ptr [eax-8]
 0049E651    call        TCustomImageList.Equal
 0049E656    test        al,al
>0049E658    je          0049E65E
 0049E65A    xor         eax,eax
>0049E65C    jmp         0049E673
 0049E65E    mov         al,1
 0049E660    pop         ebx
 0049E661    pop         ebp
 0049E662    ret
 0049E663    mov         eax,dword ptr [ebp+8]
 0049E666    mov         eax,dword ptr [eax-8]
 0049E669    call        TCustomImageList.GetCount
 0049E66E    test        eax,eax
 0049E670    setg        al
 0049E673    pop         ebx
 0049E674    pop         ebp
 0049E675    ret
*}
end;

//0049E678
procedure TCustomImageList.DefineProperties(Filer:TFiler);
begin
{*
 0049E678    push        ebp
 0049E679    mov         ebp,esp
 0049E67B    add         esp,0FFFFFFF8
 0049E67E    push        ebx
 0049E67F    mov         dword ptr [ebp-4],edx
 0049E682    mov         dword ptr [ebp-8],eax
 0049E685    mov         edx,dword ptr [ebp-4]
 0049E688    mov         eax,dword ptr [ebp-8]
 0049E68B    call        TComponent.DefineProperties
 0049E690    mov         eax,dword ptr [ebp-8]
 0049E693    push        eax
 0049E694    mov         eax,dword ptr [eax]
 0049E696    mov         eax,dword ptr [eax+3C]
 0049E699    push        eax
 0049E69A    mov         eax,dword ptr [ebp-8]
 0049E69D    push        eax
 0049E69E    mov         eax,dword ptr [eax]
 0049E6A0    mov         eax,dword ptr [eax+40]
 0049E6A3    push        eax
 0049E6A4    push        ebp
 0049E6A5    call        DoWrite
 0049E6AA    pop         ecx
 0049E6AB    mov         ecx,eax
 0049E6AD    mov         edx,49E6CC;'Bitmap'
 0049E6B2    mov         eax,dword ptr [ebp-4]
 0049E6B5    mov         ebx,dword ptr [eax]
 0049E6B7    call        dword ptr [ebx+8]
 0049E6BA    pop         ebx
 0049E6BB    pop         ecx
 0049E6BC    pop         ecx
 0049E6BD    pop         ebp
 0049E6BE    ret
*}
end;

//0049E6DC
procedure TCustomImageList.ReadD2Stream(Stream:TStream);
begin
{*
 0049E6DC    push        ebp
 0049E6DD    mov         ebp,esp
 0049E6DF    add         esp,0FFFFFFC0
 0049E6E2    push        ebx
 0049E6E3    push        esi
 0049E6E4    push        edi
 0049E6E5    mov         esi,edx
 0049E6E7    mov         dword ptr [ebp-4],eax
 0049E6EA    lea         edx,[ebp-18]
 0049E6ED    mov         ecx,4
 0049E6F2    mov         eax,esi
 0049E6F4    call        TStream.ReadBuffer
 0049E6F9    lea         edx,[ebp-1C]
 0049E6FC    mov         ecx,4
 0049E701    mov         eax,esi
 0049E703    call        TStream.ReadBuffer
 0049E708    mov         dl,1
 0049E70A    mov         eax,[00463B28];TBitmap
 0049E70F    call        TBitmap.Create
 0049E714    mov         dword ptr [ebp-8],eax
 0049E717    xor         eax,eax
 0049E719    push        ebp
 0049E71A    push        49E960
 0049E71F    push        dword ptr fs:[eax]
 0049E722    mov         dword ptr fs:[eax],esp
 0049E725    mov         eax,esi
 0049E727    call        TStream.GetPosition
 0049E72C    mov         ebx,eax
 0049E72E    mov         edx,esi
 0049E730    mov         eax,dword ptr [ebp-8]
 0049E733    mov         ecx,dword ptr [eax]
 0049E735    call        dword ptr [ecx+5C]
 0049E738    mov         eax,dword ptr [ebp-18]
 0049E73B    add         eax,ebx
 0049E73D    cdq
 0049E73E    push        edx
 0049E73F    push        eax
 0049E740    mov         eax,esi
 0049E742    call        TStream.SetPosition
 0049E747    mov         dl,1
 0049E749    mov         eax,[00463B28];TBitmap
 0049E74E    call        TBitmap.Create
 0049E753    mov         dword ptr [ebp-10],eax
 0049E756    xor         eax,eax
 0049E758    push        ebp
 0049E759    push        49E943
 0049E75E    push        dword ptr fs:[eax]
 0049E761    mov         dword ptr fs:[eax],esp
 0049E764    mov         edx,esi
 0049E766    mov         eax,dword ptr [ebp-10]
 0049E769    mov         ecx,dword ptr [eax]
 0049E76B    call        dword ptr [ecx+5C]
 0049E76E    mov         dl,1
 0049E770    mov         eax,[00463B28];TBitmap
 0049E775    call        TBitmap.Create
 0049E77A    mov         dword ptr [ebp-0C],eax
 0049E77D    mov         eax,dword ptr [ebp-4]
 0049E780    mov         edx,dword ptr [eax+38]
 0049E783    mov         eax,dword ptr [ebp-0C]
 0049E786    mov         ecx,dword ptr [eax]
 0049E788    call        dword ptr [ecx+44]
 0049E78B    mov         eax,dword ptr [ebp-4]
 0049E78E    mov         edx,dword ptr [eax+34]
 0049E791    mov         eax,dword ptr [ebp-0C]
 0049E794    mov         ecx,dword ptr [eax]
 0049E796    call        dword ptr [ecx+38]
 0049E799    mov         dl,1
 0049E79B    mov         eax,[00463B28];TBitmap
 0049E7A0    call        TBitmap.Create
 0049E7A5    mov         dword ptr [ebp-14],eax
 0049E7A8    mov         dl,1
 0049E7AA    mov         eax,dword ptr [ebp-14]
 0049E7AD    call        TBitmap.SetMonochrome
 0049E7B2    mov         eax,dword ptr [ebp-4]
 0049E7B5    mov         edx,dword ptr [eax+38]
 0049E7B8    mov         eax,dword ptr [ebp-14]
 0049E7BB    mov         ecx,dword ptr [eax]
 0049E7BD    call        dword ptr [ecx+44]
 0049E7C0    mov         eax,dword ptr [ebp-4]
 0049E7C3    mov         edx,dword ptr [eax+34]
 0049E7C6    mov         eax,dword ptr [ebp-14]
 0049E7C9    mov         ecx,dword ptr [eax]
 0049E7CB    call        dword ptr [ecx+38]
 0049E7CE    mov         eax,dword ptr [ebp-4]
 0049E7D1    mov         eax,dword ptr [eax+34]
 0049E7D4    push        eax
 0049E7D5    lea         eax,[ebp-30]
 0049E7D8    push        eax
 0049E7D9    mov         eax,dword ptr [ebp-4]
 0049E7DC    mov         ecx,dword ptr [eax+38]
 0049E7DF    xor         edx,edx
 0049E7E1    xor         eax,eax
 0049E7E3    call        Rect
 0049E7E8    mov         eax,dword ptr [ebp-4]
 0049E7EB    call        TCustomImageList.BeginUpdate
 0049E7F0    xor         eax,eax
 0049E7F2    push        ebp
 0049E7F3    push        49E926
 0049E7F8    push        dword ptr fs:[eax]
 0049E7FB    mov         dword ptr fs:[eax],esp
 0049E7FE    mov         eax,dword ptr [ebp-8]
 0049E801    mov         edx,dword ptr [eax]
 0049E803    call        dword ptr [edx+24]
 0049E806    mov         edx,dword ptr [ebp-4]
 0049E809    mov         ecx,dword ptr [edx+34]
 0049E80C    cdq
 0049E80D    idiv        eax,ecx
 0049E80F    dec         eax
 0049E810    test        eax,eax
>0049E812    jl          0049E900
 0049E818    inc         eax
 0049E819    mov         dword ptr [ebp-20],eax
 0049E81C    xor         edi,edi
 0049E81E    cmp         dword ptr [ebp-1C],0
>0049E822    je          0049E900
 0049E828    mov         eax,dword ptr [ebp-8]
 0049E82B    mov         edx,dword ptr [eax]
 0049E82D    call        dword ptr [edx+30]
 0049E830    mov         edx,dword ptr [ebp-4]
 0049E833    mov         ecx,dword ptr [edx+38]
 0049E836    cdq
 0049E837    idiv        eax,ecx
 0049E839    mov         esi,eax
 0049E83B    dec         esi
 0049E83C    test        esi,esi
>0049E83E    jl          0049E8F6
 0049E844    inc         esi
 0049E845    xor         ebx,ebx
 0049E847    cmp         dword ptr [ebp-1C],0
>0049E84B    je          0049E8F6
 0049E851    mov         eax,dword ptr [ebp-4]
 0049E854    mov         eax,dword ptr [eax+34]
 0049E857    push        eax
 0049E858    lea         eax,[ebp-40]
 0049E85B    push        eax
 0049E85C    mov         eax,dword ptr [ebp-4]
 0049E85F    mov         ecx,dword ptr [eax+38]
 0049E862    mov         eax,dword ptr [ebp-4]
 0049E865    mov         edx,dword ptr [eax+34]
 0049E868    imul        edx,edi
 0049E86B    mov         eax,dword ptr [ebp-4]
 0049E86E    mov         eax,dword ptr [eax+38]
 0049E871    imul        eax,ebx
 0049E874    call        Bounds
 0049E879    lea         eax,[ebp-40]
 0049E87C    push        eax
 0049E87D    mov         eax,dword ptr [ebp-8]
 0049E880    call        TBitmap.GetCanvas
 0049E885    push        eax
 0049E886    mov         eax,dword ptr [ebp-0C]
 0049E889    call        TBitmap.GetCanvas
 0049E88E    lea         edx,[ebp-30]
 0049E891    pop         ecx
 0049E892    call        TCanvas.CopyRect
 0049E897    mov         eax,dword ptr [ebp-4]
 0049E89A    mov         eax,dword ptr [eax+34]
 0049E89D    push        eax
 0049E89E    lea         eax,[ebp-40]
 0049E8A1    push        eax
 0049E8A2    mov         eax,dword ptr [ebp-4]
 0049E8A5    mov         ecx,dword ptr [eax+38]
 0049E8A8    mov         eax,dword ptr [ebp-4]
 0049E8AB    mov         edx,dword ptr [eax+34]
 0049E8AE    imul        edx,edi
 0049E8B1    mov         eax,dword ptr [ebp-4]
 0049E8B4    mov         eax,dword ptr [eax+38]
 0049E8B7    imul        eax,ebx
 0049E8BA    call        Bounds
 0049E8BF    lea         eax,[ebp-40]
 0049E8C2    push        eax
 0049E8C3    mov         eax,dword ptr [ebp-10]
 0049E8C6    call        TBitmap.GetCanvas
 0049E8CB    push        eax
 0049E8CC    mov         eax,dword ptr [ebp-14]
 0049E8CF    call        TBitmap.GetCanvas
 0049E8D4    lea         edx,[ebp-30]
 0049E8D7    pop         ecx
 0049E8D8    call        TCanvas.CopyRect
 0049E8DD    mov         ecx,dword ptr [ebp-14]
 0049E8E0    mov         edx,dword ptr [ebp-0C]
 0049E8E3    mov         eax,dword ptr [ebp-4]
 0049E8E6    call        TCustomImageList.Add
 0049E8EB    dec         dword ptr [ebp-1C]
 0049E8EE    inc         ebx
 0049E8EF    dec         esi
>0049E8F0    jne         0049E847
 0049E8F6    inc         edi
 0049E8F7    dec         dword ptr [ebp-20]
>0049E8FA    jne         0049E81E
 0049E900    xor         eax,eax
 0049E902    pop         edx
 0049E903    pop         ecx
 0049E904    pop         ecx
 0049E905    mov         dword ptr fs:[eax],edx
 0049E908    push        49E92D
 0049E90D    mov         eax,dword ptr [ebp-0C]
 0049E910    call        TObject.Free
 0049E915    mov         eax,dword ptr [ebp-14]
 0049E918    call        TObject.Free
 0049E91D    mov         eax,dword ptr [ebp-4]
 0049E920    call        TCustomImageList.EndUpdate
 0049E925    ret
>0049E926    jmp         @HandleFinally
>0049E92B    jmp         0049E90D
 0049E92D    xor         eax,eax
 0049E92F    pop         edx
 0049E930    pop         ecx
 0049E931    pop         ecx
 0049E932    mov         dword ptr fs:[eax],edx
 0049E935    push        49E94A
 0049E93A    mov         eax,dword ptr [ebp-10]
 0049E93D    call        TObject.Free
 0049E942    ret
>0049E943    jmp         @HandleFinally
>0049E948    jmp         0049E93A
 0049E94A    xor         eax,eax
 0049E94C    pop         edx
 0049E94D    pop         ecx
 0049E94E    pop         ecx
 0049E94F    mov         dword ptr fs:[eax],edx
 0049E952    push        49E967
 0049E957    mov         eax,dword ptr [ebp-8]
 0049E95A    call        TObject.Free
 0049E95F    ret
>0049E960    jmp         @HandleFinally
>0049E965    jmp         0049E957
 0049E967    pop         edi
 0049E968    pop         esi
 0049E969    pop         ebx
 0049E96A    mov         esp,ebp
 0049E96C    pop         ebp
 0049E96D    ret
*}
end;

//0049E970
procedure TCustomImageList.ReadD3Stream(Stream:TStream);
begin
{*
 0049E970    push        ebp
 0049E971    mov         ebp,esp
 0049E973    add         esp,0FFFFFFEC
 0049E976    push        ebx
 0049E977    push        esi
 0049E978    mov         dword ptr [ebp-8],edx
 0049E97B    mov         dword ptr [ebp-4],eax
 0049E97E    push        0
 0049E980    mov         ecx,dword ptr [ebp-8]
 0049E983    mov         dl,1
 0049E985    mov         eax,[0043E568];TStreamAdapter
 0049E98A    call        TStreamAdapter.Create
 0049E98F    mov         dword ptr [ebp-0C],eax
 0049E992    xor         eax,eax
 0049E994    push        ebp
 0049E995    push        49E9D0
 0049E99A    push        dword ptr fs:[eax]
 0049E99D    mov         dword ptr fs:[eax],esp
 0049E9A0    mov         eax,dword ptr [ebp-0C]
 0049E9A3    test        eax,eax
>0049E9A5    je          0049E9AA
 0049E9A7    sub         eax,0FFFFFFEC
 0049E9AA    push        eax
 0049E9AB    call        comctl32.ImageList_Read
 0049E9B0    mov         edx,eax
 0049E9B2    mov         eax,dword ptr [ebp-4]
 0049E9B5    call        TCustomImageList.SetHandle
 0049E9BA    xor         eax,eax
 0049E9BC    pop         edx
 0049E9BD    pop         ecx
 0049E9BE    pop         ecx
 0049E9BF    mov         dword ptr fs:[eax],edx
 0049E9C2    push        49E9D7
 0049E9C7    mov         eax,dword ptr [ebp-0C]
 0049E9CA    call        TObject.Free
 0049E9CF    ret
>0049E9D0    jmp         @HandleFinally
>0049E9D5    jmp         0049E9C7
 0049E9D7    mov         eax,dword ptr [ebp-4]
 0049E9DA    cmp         dword ptr [eax+40],0
>0049E9DE    jne         0049EB2B
 0049E9E4    xor         ebx,ebx
 0049E9E6    mov         dl,1
 0049E9E8    mov         eax,[0043DAFC];TMemoryStream
 0049E9ED    call        TObject.Create
 0049E9F2    mov         dword ptr [ebp-10],eax
 0049E9F5    xor         eax,eax
 0049E9F7    push        ebp
 0049E9F8    push        49EB04
 0049E9FD    push        dword ptr fs:[eax]
 0049EA00    mov         dword ptr fs:[eax],esp
 0049EA03    push        0
 0049EA05    push        0
 0049EA07    mov         eax,dword ptr [ebp-8]
 0049EA0A    call        TStream.SetPosition
 0049EA0F    mov         edx,dword ptr [ebp-8]
 0049EA12    mov         eax,dword ptr [ebp-10]
 0049EA15    call        TMemoryStream.LoadFromStream
 0049EA1A    push        0
 0049EA1C    push        12
 0049EA1E    mov         eax,dword ptr [ebp-10]
 0049EA21    call        TStream.SetPosition
 0049EA26    lea         edx,[ebp-11]
 0049EA29    mov         ecx,1
 0049EA2E    mov         eax,dword ptr [ebp-10]
 0049EA31    mov         esi,dword ptr [eax]
 0049EA33    call        dword ptr [esi+0C]
 0049EA36    dec         eax
>0049EA37    jne         0049EA85
 0049EA39    cmp         byte ptr [ebp-11],1
>0049EA3D    jne         0049EA85
 0049EA3F    push        0
 0049EA41    push        38
 0049EA43    mov         eax,dword ptr [ebp-10]
 0049EA46    call        TStream.SetPosition
 0049EA4B    lea         edx,[ebp-12]
 0049EA4E    mov         ecx,1
 0049EA53    mov         eax,dword ptr [ebp-10]
 0049EA56    mov         esi,dword ptr [eax]
 0049EA58    call        dword ptr [esi+0C]
 0049EA5B    dec         eax
>0049EA5C    jne         0049EA85
 0049EA5E    movzx       eax,byte ptr [ebp-12]
 0049EA62    or          byte ptr [ebp-11],al
 0049EA65    push        0
 0049EA67    push        12
 0049EA69    mov         eax,dword ptr [ebp-10]
 0049EA6C    call        TStream.SetPosition
 0049EA71    lea         edx,[ebp-11]
 0049EA74    mov         ecx,1
 0049EA79    mov         eax,dword ptr [ebp-10]
 0049EA7C    mov         ebx,dword ptr [eax]
 0049EA7E    call        dword ptr [ebx+10]
 0049EA81    dec         eax
 0049EA82    sete        bl
 0049EA85    test        bl,bl
>0049EA87    je          0049EAEE
 0049EA89    push        0
 0049EA8B    push        0
 0049EA8D    mov         eax,dword ptr [ebp-10]
 0049EA90    call        TStream.SetPosition
 0049EA95    push        0
 0049EA97    mov         ecx,dword ptr [ebp-10]
 0049EA9A    mov         dl,1
 0049EA9C    mov         eax,[0043E568];TStreamAdapter
 0049EAA1    call        TStreamAdapter.Create
 0049EAA6    mov         dword ptr [ebp-0C],eax
 0049EAA9    xor         eax,eax
 0049EAAB    push        ebp
 0049EAAC    push        49EAE7
 0049EAB1    push        dword ptr fs:[eax]
 0049EAB4    mov         dword ptr fs:[eax],esp
 0049EAB7    mov         eax,dword ptr [ebp-0C]
 0049EABA    test        eax,eax
>0049EABC    je          0049EAC1
 0049EABE    sub         eax,0FFFFFFEC
 0049EAC1    push        eax
 0049EAC2    call        comctl32.ImageList_Read
 0049EAC7    mov         edx,eax
 0049EAC9    mov         eax,dword ptr [ebp-4]
 0049EACC    call        TCustomImageList.SetHandle
 0049EAD1    xor         eax,eax
 0049EAD3    pop         edx
 0049EAD4    pop         ecx
 0049EAD5    pop         ecx
 0049EAD6    mov         dword ptr fs:[eax],edx
 0049EAD9    push        49EAEE
 0049EADE    mov         eax,dword ptr [ebp-0C]
 0049EAE1    call        TObject.Free
 0049EAE6    ret
>0049EAE7    jmp         @HandleFinally
>0049EAEC    jmp         0049EADE
 0049EAEE    xor         eax,eax
 0049EAF0    pop         edx
 0049EAF1    pop         ecx
 0049EAF2    pop         ecx
 0049EAF3    mov         dword ptr fs:[eax],edx
 0049EAF6    push        49EB0B
 0049EAFB    mov         eax,dword ptr [ebp-10]
 0049EAFE    call        TObject.Free
 0049EB03    ret
>0049EB04    jmp         @HandleFinally
>0049EB09    jmp         0049EAFB
 0049EB0B    mov         eax,dword ptr [ebp-4]
 0049EB0E    cmp         dword ptr [eax+40],0
>0049EB12    jne         0049EB2B
 0049EB14    mov         ecx,dword ptr ds:[78D6F4];^SResString196:TResStringRec
 0049EB1A    mov         dl,1
 0049EB1C    mov         eax,[00438BC0];EReadError
 0049EB21    call        Exception.CreateRes
 0049EB26    call        @RaiseExcept
 0049EB2B    pop         esi
 0049EB2C    pop         ebx
 0049EB2D    mov         esp,ebp
 0049EB2F    pop         ebp
 0049EB30    ret
*}
end;

//0049EB34
procedure TCustomImageList.ReadData(Stream:TStream);
begin
{*
 0049EB34    push        ebx
 0049EB35    push        esi
 0049EB36    push        edi
 0049EB37    add         esp,0FFFFFFF0
 0049EB3A    mov         edi,edx
 0049EB3C    mov         esi,eax
 0049EB3E    mov         eax,esi
 0049EB40    call        TCustomImageList.FreeHandle
 0049EB45    mov         eax,edi
 0049EB47    call        TStream.GetPosition
 0049EB4C    mov         dword ptr [esp+0C],eax
 0049EB50    mov         edx,esp
 0049EB52    mov         ecx,4
 0049EB57    mov         eax,edi
 0049EB59    mov         ebx,dword ptr [eax]
 0049EB5B    call        dword ptr [ebx+0C]
 0049EB5E    lea         edx,[esp+4]
 0049EB62    mov         ecx,4
 0049EB67    mov         eax,edi
 0049EB69    mov         ebx,dword ptr [eax]
 0049EB6B    call        dword ptr [ebx+0C]
 0049EB6E    movzx       ebx,byte ptr [esp]
 0049EB72    movzx       eax,word ptr [esp]
 0049EB76    shr         eax,8
 0049EB79    mov         byte ptr [esp+8],al
 0049EB7D    mov         eax,dword ptr [esp+0C]
 0049EB81    cdq
 0049EB82    push        edx
 0049EB83    push        eax
 0049EB84    mov         eax,edi
 0049EB86    call        TStream.SetPosition
 0049EB8B    mov         eax,dword ptr [esp]
 0049EB8E    cmp         eax,dword ptr [esp+4]
>0049EB92    je          0049EBAB
 0049EB94    cmp         bl,49
>0049EB97    jne         0049EBAB
 0049EB99    cmp         byte ptr [esp+8],4C
>0049EB9E    jne         0049EBAB
 0049EBA0    mov         edx,edi
 0049EBA2    mov         eax,esi
 0049EBA4    call        TCustomImageList.ReadD3Stream
>0049EBA9    jmp         0049EBB4
 0049EBAB    mov         edx,edi
 0049EBAD    mov         eax,esi
 0049EBAF    call        TCustomImageList.ReadD2Stream
 0049EBB4    call        ThemeServices
 0049EBB9    call        TThemeServices.GetThemesEnabled
 0049EBBE    test        al,al
>0049EBC0    jne         0049EBDD
 0049EBC2    mov         eax,esi
 0049EBC4    call        TCustomImageList.GetHandle
 0049EBC9    push        eax
 0049EBCA    call        comctl32.ImageList_GetImageCount
 0049EBCF    push        eax
 0049EBD0    mov         eax,esi
 0049EBD2    call        TCustomImageList.GetHandle
 0049EBD7    push        eax
 0049EBD8    call        comctl32.ImageList_SetImageCount
 0049EBDD    add         esp,10
 0049EBE0    pop         edi
 0049EBE1    pop         esi
 0049EBE2    pop         ebx
 0049EBE3    ret
*}
end;

//0049EBE4
procedure TCustomImageList.WriteData(Stream:TStream);
begin
{*
 0049EBE4    push        ebp
 0049EBE5    mov         ebp,esp
 0049EBE7    push        ecx
 0049EBE8    push        ebx
 0049EBE9    push        esi
 0049EBEA    push        edi
 0049EBEB    mov         esi,edx
 0049EBED    mov         ebx,eax
 0049EBEF    cmp         dword ptr ds:[793224],0
>0049EBF6    jne         0049EC33
 0049EBF8    mov         eax,49ECF8;'comctl32.dll'
 0049EBFD    call        GetFileVersion
 0049EC02    mov         [00793224],eax
 0049EC07    cmp         dword ptr ds:[793224],60000
>0049EC11    jb          0049EC33
 0049EC13    push        49ED14
 0049EC18    call        kernel32.GetModuleHandleW
 0049EC1D    mov         edi,eax
 0049EC1F    test        edi,edi
>0049EC21    je          0049EC33
 0049EC23    push        49ED30
 0049EC28    push        edi
 0049EC29    call        GetProcAddress
 0049EC2E    mov         [00793228],eax
 0049EC33    push        0
 0049EC35    mov         ecx,esi
 0049EC37    mov         dl,1
 0049EC39    mov         eax,[0043E568];TStreamAdapter
 0049EC3E    call        TStreamAdapter.Create
 0049EC43    mov         dword ptr [ebp-4],eax
 0049EC46    xor         eax,eax
 0049EC48    push        ebp
 0049EC49    push        49ECDE
 0049EC4E    push        dword ptr fs:[eax]
 0049EC51    mov         dword ptr fs:[eax],esp
 0049EC54    cmp         dword ptr ds:[793228],0
>0049EC5B    je          0049EC95
 0049EC5D    mov         eax,dword ptr [ebp-4]
 0049EC60    test        eax,eax
>0049EC62    je          0049EC67
 0049EC64    sub         eax,0FFFFFFEC
 0049EC67    push        eax
 0049EC68    push        1
 0049EC6A    mov         eax,ebx
 0049EC6C    call        TCustomImageList.GetHandle
 0049EC71    push        eax
 0049EC72    call        dword ptr ds:[793228]
 0049EC78    test        eax,eax
>0049EC7A    je          0049ECC8
 0049EC7C    mov         ecx,dword ptr ds:[78D13C];^SResString197:TResStringRec
 0049EC82    mov         dl,1
 0049EC84    mov         eax,[00438C54];EWriteError
 0049EC89    call        Exception.CreateRes
 0049EC8E    call        @RaiseExcept
>0049EC93    jmp         0049ECC8
 0049EC95    mov         eax,dword ptr [ebp-4]
 0049EC98    test        eax,eax
>0049EC9A    je          0049EC9F
 0049EC9C    sub         eax,0FFFFFFEC
 0049EC9F    push        eax
 0049ECA0    mov         eax,ebx
 0049ECA2    call        TCustomImageList.GetHandle
 0049ECA7    push        eax
 0049ECA8    call        comctl32.ImageList_Write
 0049ECAD    test        eax,eax
>0049ECAF    jne         0049ECC8
 0049ECB1    mov         ecx,dword ptr ds:[78D13C];^SResString197:TResStringRec
 0049ECB7    mov         dl,1
 0049ECB9    mov         eax,[00438C54];EWriteError
 0049ECBE    call        Exception.CreateRes
 0049ECC3    call        @RaiseExcept
 0049ECC8    xor         eax,eax
 0049ECCA    pop         edx
 0049ECCB    pop         ecx
 0049ECCC    pop         ecx
 0049ECCD    mov         dword ptr fs:[eax],edx
 0049ECD0    push        49ECE5
 0049ECD5    mov         eax,dword ptr [ebp-4]
 0049ECD8    call        TObject.Free
 0049ECDD    ret
>0049ECDE    jmp         @HandleFinally
>0049ECE3    jmp         0049ECD5
 0049ECE5    pop         edi
 0049ECE6    pop         esi
 0049ECE7    pop         ebx
 0049ECE8    pop         ecx
 0049ECE9    pop         ebp
 0049ECEA    ret
*}
end;

//0049ED54
procedure TCustomImageList.BeginUpdate;
begin
{*
 0049ED54    inc         dword ptr [eax+60]
 0049ED57    ret
*}
end;

//0049ED58
procedure TCustomImageList.EndUpdate;
begin
{*
 0049ED58    push        esi
 0049ED59    cmp         dword ptr [eax+60],0
>0049ED5D    jle         0049ED62
 0049ED5F    dec         dword ptr [eax+60]
 0049ED62    cmp         byte ptr [eax+5C],0
>0049ED66    je          0049ED75
 0049ED68    mov         byte ptr [eax+5C],0
 0049ED6C    mov         si,0FFF0
 0049ED70    call        @CallDynaInst
 0049ED75    pop         esi
 0049ED76    ret
*}
end;

//0049ED78
destructor TChangeLink.Destroy();
begin
{*
 0049ED78    push        ebx
 0049ED79    push        esi
 0049ED7A    call        @BeforeDestruction
 0049ED7F    mov         ebx,edx
 0049ED81    mov         esi,eax
 0049ED83    mov         eax,dword ptr [esi+4]
 0049ED86    test        eax,eax
>0049ED88    je          0049ED91
 0049ED8A    mov         edx,esi
 0049ED8C    call        TCustomImageList.UnRegisterChanges
 0049ED91    mov         edx,ebx
 0049ED93    and         dl,0FC
 0049ED96    mov         eax,esi
 0049ED98    call        TObject.Destroy
 0049ED9D    test        bl,bl
>0049ED9F    jle         0049EDA8
 0049EDA1    mov         eax,esi
 0049EDA3    call        @ClassDestroy
 0049EDA8    pop         esi
 0049EDA9    pop         ebx
 0049EDAA    ret
*}
end;

//0049EDAC
procedure TChangeLink.Change;
begin
{*
 0049EDAC    push        ebx
 0049EDAD    cmp         word ptr [eax+0A],0
>0049EDB2    je          0049EDBF
 0049EDB4    mov         ebx,eax
 0049EDB6    mov         edx,dword ptr [eax+4]
 0049EDB9    mov         eax,dword ptr [ebx+0C]
 0049EDBC    call        dword ptr [ebx+8]
 0049EDBF    pop         ebx
 0049EDC0    ret
*}
end;

//004A15C8
function FindPopupControl(const Pos:TPoint):TControl;
begin
{*
 004A15C8    push        ebx
 004A15C9    push        esi
 004A15CA    push        edi
 004A15CB    mov         edi,eax
 004A15CD    xor         esi,esi
 004A15CF    mov         eax,edi
 004A15D1    call        FindVCLWindow
 004A15D6    mov         ebx,eax
 004A15D8    test        ebx,ebx
>004A15DA    je          004A15F3
 004A15DC    push        0
 004A15DE    push        0
 004A15E0    mov         edx,edi
 004A15E2    xor         ecx,ecx
 004A15E4    mov         eax,ebx
 004A15E6    call        TWinControl.ControlAtPos
 004A15EB    mov         esi,eax
 004A15ED    test        esi,esi
>004A15EF    jne         004A15F3
 004A15F1    mov         esi,ebx
 004A15F3    mov         eax,esi
 004A15F5    pop         edi
 004A15F6    pop         esi
 004A15F7    pop         ebx
 004A15F8    ret
*}
end;

//004A15FC
function ReturnAddr:Pointer;
begin
{*
 004A15FC    mov         eax,dword ptr [esp+8]
 004A1600    ret
*}
end;

//004A1604
procedure Error(ResStr:PResStringRec);
begin
{*
 004A1604    push        ebx
 004A1605    mov         ebx,eax
 004A1607    call        ReturnAddr
 004A160C    push        eax
 004A160D    mov         ecx,ebx
 004A160F    mov         dl,1
 004A1611    mov         eax,[0049EDC4];EMenuError
 004A1616    call        Exception.CreateRes
>004A161B    jmp         @RaiseExcept
 004A1620    pop         ebx
 004A1621    ret
*}
end;

//004A1624
function ShortCut(Key:Word; Shift:TShiftState):TShortCut;
begin
{*
 004A1624    push        ecx
 004A1625    mov         word ptr [esp],dx
 004A1629    xor         edx,edx
 004A162B    movzx       ecx,ax
 004A162E    shr         ecx,8
 004A1631    test        cl,cl
>004A1633    jne         004A1658
 004A1635    mov         edx,eax
 004A1637    test        byte ptr [esp],1
>004A163B    je          004A1642
 004A163D    add         dx,2000
 004A1642    test        byte ptr [esp],4
>004A1646    je          004A164D
 004A1648    add         dx,4000
 004A164D    test        byte ptr [esp],2
>004A1651    je          004A1658
 004A1653    add         dx,8000
 004A1658    mov         eax,edx
 004A165A    pop         edx
 004A165B    ret
*}
end;

//004A165C
procedure ShortCutToKey(ShortCut:TShortCut; var Key:Word; var Shift:TShiftState);
begin
{*
 004A165C    push        ebx
 004A165D    push        esi
 004A165E    mov         esi,ecx
 004A1660    mov         ebx,eax
 004A1662    mov         eax,ebx
 004A1664    and         ax,1FFF
 004A1668    mov         word ptr [edx],ax
 004A166B    movzx       eax,word ptr ds:[4A1694]
 004A1672    mov         word ptr [esi],ax
 004A1675    test        bh,20
>004A1678    je          004A167E
 004A167A    or          word ptr [esi],1
 004A167E    test        bh,40
>004A1681    je          004A1687
 004A1683    or          word ptr [esi],4
 004A1687    test        bh,80
>004A168A    je          004A1690
 004A168C    or          word ptr [esi],2
 004A1690    pop         esi
 004A1691    pop         ebx
 004A1692    ret
*}
end;

//004A1698
function GetSpecialName(ShortCut:TShortCut):UnicodeString;
begin
{*
 004A1698    push        ebx
 004A1699    push        esi
 004A169A    add         esp,0FFFFFE00
 004A16A0    mov         ebx,edx
 004A16A2    mov         esi,eax
 004A16A4    mov         eax,ebx
 004A16A6    call        @UStrClr
 004A16AB    push        0
 004A16AD    mov         eax,esi
 004A16AF    movzx       eax,al
 004A16B2    push        eax
 004A16B3    call        user32.MapVirtualKeyW
 004A16B8    shl         eax,10
 004A16BB    test        eax,eax
>004A16BD    je          004A16DD
 004A16BF    push        100
 004A16C4    lea         edx,[esp+4]
 004A16C8    push        edx
 004A16C9    push        eax
 004A16CA    call        user32.GetKeyNameTextW
 004A16CF    mov         eax,ebx
 004A16D1    mov         edx,esp
 004A16D3    mov         ecx,100
 004A16D8    call        @UStrFromWArray
 004A16DD    add         esp,200
 004A16E3    pop         esi
 004A16E4    pop         ebx
 004A16E5    ret
*}
end;

//004A16E8
function ShortCutToText(ShortCut:TShortCut):UnicodeString;
begin
{*
 004A16E8    push        ebp
 004A16E9    mov         ebp,esp
 004A16EB    push        0
 004A16ED    push        0
 004A16EF    push        ebx
 004A16F0    push        esi
 004A16F1    push        edi
 004A16F2    mov         esi,edx
 004A16F4    mov         edi,eax
 004A16F6    xor         eax,eax
 004A16F8    push        ebp
 004A16F9    push        4A18C3
 004A16FE    push        dword ptr fs:[eax]
 004A1701    mov         dword ptr fs:[eax],esp
 004A1704    mov         ebx,edi
 004A1706    movzx       eax,bl
 004A1709    cmp         eax,2D
>004A170C    jge         004A1735
 004A170E    add         eax,0FFFFFFF8
 004A1711    sub         eax,2
>004A1714    jb          004A177E
 004A1716    sub         eax,3
>004A1719    je          004A1795
 004A171B    sub         eax,0E
>004A171E    je          004A17A8
 004A1724    add         eax,0FFFFFFFB
 004A1727    sub         eax,9
>004A172A    jb          004A17BB
>004A1730    jmp         004A1842
 004A1735    cmp         eax,41
>004A1738    jge         004A1755
 004A173A    add         eax,0FFFFFFD3
 004A173D    sub         eax,2
>004A1740    jb          004A17D2
 004A1746    dec         eax
 004A1747    sub         eax,0A
>004A174A    jb          004A17E9
>004A1750    jmp         004A1842
 004A1755    add         eax,0FFFFFFBF
 004A1758    sub         eax,1A
>004A175B    jb          004A17FC
 004A1761    add         eax,0FFFFFFFB
 004A1764    sub         eax,0A
>004A1767    jb          004A180F
 004A176D    add         eax,0FFFFFFFA
 004A1770    sub         eax,18
>004A1773    jb          004A1822
>004A1779    jmp         004A1842
 004A177E    lea         eax,[ebp-4]
 004A1781    movzx       edx,bl
 004A1784    mov         edx,dword ptr [edx*4+785BF8]
 004A178B    call        @UStrLAsg
>004A1790    jmp         004A184C
 004A1795    lea         eax,[ebp-4]
 004A1798    mov         edx,dword ptr ds:[785C24]
 004A179E    call        @UStrLAsg
>004A17A3    jmp         004A184C
 004A17A8    lea         eax,[ebp-4]
 004A17AB    mov         edx,dword ptr ds:[785C20]
 004A17B1    call        @UStrLAsg
>004A17B6    jmp         004A184C
 004A17BB    lea         eax,[ebp-4]
 004A17BE    add         bl,4
 004A17C1    movzx       edx,bl
 004A17C4    mov         edx,dword ptr [edx*4+785B98]
 004A17CB    call        @UStrLAsg
>004A17D0    jmp         004A184C
 004A17D2    lea         eax,[ebp-4]
 004A17D5    add         bl,0D
 004A17D8    movzx       edx,bl
 004A17DB    mov         edx,dword ptr [edx*4+785B64]
 004A17E2    call        @UStrLAsg
>004A17E7    jmp         004A184C
 004A17E9    lea         eax,[ebp-4]
 004A17EC    movzx       edx,bl
 004A17EF    sub         edx,30
 004A17F2    add         edx,30
 004A17F5    call        @UStrFromWChar
>004A17FA    jmp         004A184C
 004A17FC    lea         eax,[ebp-4]
 004A17FF    movzx       edx,bl
 004A1802    sub         edx,41
 004A1805    add         edx,41
 004A1808    call        @UStrFromWChar
>004A180D    jmp         004A184C
 004A180F    lea         eax,[ebp-4]
 004A1812    movzx       edx,bl
 004A1815    sub         edx,60
 004A1818    add         edx,30
 004A181B    call        @UStrFromWChar
>004A1820    jmp         004A184C
 004A1822    lea         edx,[ebp-8]
 004A1825    movzx       eax,bl
 004A1828    sub         eax,6F
 004A182B    call        IntToStr
 004A1830    mov         ecx,dword ptr [ebp-8]
 004A1833    lea         eax,[ebp-4]
 004A1836    mov         edx,4A18E0;'F'
 004A183B    call        @UStrCat3
>004A1840    jmp         004A184C
 004A1842    lea         edx,[ebp-4]
 004A1845    mov         eax,edi
 004A1847    call        GetSpecialName
 004A184C    cmp         dword ptr [ebp-4],0
>004A1850    je          004A18A1
 004A1852    mov         eax,esi
 004A1854    call        @UStrClr
 004A1859    test        di,2000
>004A185E    je          004A186D
 004A1860    mov         eax,esi
 004A1862    mov         edx,dword ptr ds:[785C54]
 004A1868    call        @UStrCat
 004A186D    test        di,4000
>004A1872    je          004A1881
 004A1874    mov         eax,esi
 004A1876    mov         edx,dword ptr ds:[785C58]
 004A187C    call        @UStrCat
 004A1881    test        di,8000
>004A1886    je          004A1895
 004A1888    mov         eax,esi
 004A188A    mov         edx,dword ptr ds:[785C5C]
 004A1890    call        @UStrCat
 004A1895    mov         eax,esi
 004A1897    mov         edx,dword ptr [ebp-4]
 004A189A    call        @UStrCat
>004A189F    jmp         004A18A8
 004A18A1    mov         eax,esi
 004A18A3    call        @UStrClr
 004A18A8    xor         eax,eax
 004A18AA    pop         edx
 004A18AB    pop         ecx
 004A18AC    pop         ecx
 004A18AD    mov         dword ptr fs:[eax],edx
 004A18B0    push        4A18CA
 004A18B5    lea         eax,[ebp-8]
 004A18B8    mov         edx,2
 004A18BD    call        @UStrArrayClr
 004A18C2    ret
>004A18C3    jmp         @HandleFinally
>004A18C8    jmp         004A18B5
 004A18CA    pop         edi
 004A18CB    pop         esi
 004A18CC    pop         ebx
 004A18CD    pop         ecx
 004A18CE    pop         ecx
 004A18CF    pop         ebp
 004A18D0    ret
*}
end;

//004A18E4
function CompareFront(var Text:UnicodeString; const Front:UnicodeString):Boolean;
begin
{*
 004A18E4    push        ebp
 004A18E5    mov         ebp,esp
 004A18E7    add         esp,0FFFFFFF4
 004A18EA    push        ebx
 004A18EB    push        esi
 004A18EC    mov         ebx,edx
 004A18EE    mov         dword ptr [ebp-4],eax
 004A18F1    mov         byte ptr [ebp-5],0
 004A18F5    mov         eax,dword ptr [ebp-4]
 004A18F8    mov         eax,dword ptr [eax]
 004A18FA    mov         dword ptr [ebp-0C],eax
 004A18FD    mov         eax,dword ptr [ebp-0C]
 004A1900    test        eax,eax
>004A1902    je          004A1909
 004A1904    sub         eax,4
 004A1907    mov         eax,dword ptr [eax]
 004A1909    mov         edx,ebx
 004A190B    test        edx,edx
>004A190D    je          004A1914
 004A190F    sub         edx,4
 004A1912    mov         edx,dword ptr [edx]
 004A1914    cmp         edx,eax
>004A1916    jg          004A1960
 004A1918    mov         esi,ebx
 004A191A    test        esi,esi
>004A191C    je          004A1923
 004A191E    sub         esi,4
 004A1921    mov         esi,dword ptr [esi]
 004A1923    mov         eax,ebx
 004A1925    call        @UStrToPWChar
 004A192A    push        eax
 004A192B    mov         eax,dword ptr [ebp-4]
 004A192E    mov         eax,dword ptr [eax]
 004A1930    call        @UStrToPWChar
 004A1935    mov         ecx,esi
 004A1937    pop         edx
 004A1938    call        AnsiStrLIComp
 004A193D    test        eax,eax
>004A193F    jne         004A1960
 004A1941    mov         byte ptr [ebp-5],1
 004A1945    mov         eax,ebx
 004A1947    test        eax,eax
>004A1949    je          004A1950
 004A194B    sub         eax,4
 004A194E    mov         eax,dword ptr [eax]
 004A1950    mov         edx,dword ptr [ebp-4]
 004A1953    mov         ecx,eax
 004A1955    mov         eax,1
 004A195A    xchg        eax,edx
 004A195B    call        @UStrDelete
 004A1960    movzx       eax,byte ptr [ebp-5]
 004A1964    pop         esi
 004A1965    pop         ebx
 004A1966    mov         esp,ebp
 004A1968    pop         ebp
 004A1969    ret
*}
end;

//004A196C
function TextToShortCut(Text:UnicodeString):TShortCut;
begin
{*
 004A196C    push        ebp
 004A196D    mov         ebp,esp
 004A196F    add         esp,0FFFFFFF8
 004A1972    push        ebx
 004A1973    push        esi
 004A1974    push        edi
 004A1975    xor         edx,edx
 004A1977    mov         dword ptr [ebp-8],edx
 004A197A    mov         dword ptr [ebp-4],eax
 004A197D    mov         eax,dword ptr [ebp-4]
 004A1980    call        @UStrAddRef
 004A1985    xor         eax,eax
 004A1987    push        ebp
 004A1988    push        4A1A47
 004A198D    push        dword ptr fs:[eax]
 004A1990    mov         dword ptr fs:[eax],esp
 004A1993    xor         edi,edi
 004A1995    xor         esi,esi
 004A1997    lea         eax,[ebp-4]
 004A199A    mov         edx,dword ptr ds:[785C54]
 004A19A0    call        CompareFront
 004A19A5    test        al,al
>004A19A7    je          004A19B0
 004A19A9    or          si,2000
>004A19AE    jmp         004A1997
 004A19B0    lea         eax,[ebp-4]
 004A19B3    mov         edx,4A1A64;'^'
 004A19B8    call        CompareFront
 004A19BD    test        al,al
>004A19BF    je          004A19C8
 004A19C1    or          si,4000
>004A19C6    jmp         004A1997
 004A19C8    lea         eax,[ebp-4]
 004A19CB    mov         edx,dword ptr ds:[785C58]
 004A19D1    call        CompareFront
 004A19D6    test        al,al
>004A19D8    je          004A19E1
 004A19DA    or          si,4000
>004A19DF    jmp         004A1997
 004A19E1    lea         eax,[ebp-4]
 004A19E4    mov         edx,dword ptr ds:[785C5C]
 004A19EA    call        CompareFront
 004A19EF    test        al,al
>004A19F1    je          004A19FA
 004A19F3    or          si,8000
>004A19F8    jmp         004A1997
 004A19FA    cmp         dword ptr [ebp-4],0
>004A19FE    je          004A1A2C
 004A1A00    mov         bx,8
 004A1A04    lea         edx,[ebp-8]
 004A1A07    mov         eax,ebx
 004A1A09    call        ShortCutToText
 004A1A0E    mov         edx,dword ptr [ebp-8]
 004A1A11    mov         eax,dword ptr [ebp-4]
 004A1A14    call        AnsiCompareText
 004A1A19    test        eax,eax
>004A1A1B    jne         004A1A24
 004A1A1D    mov         edi,esi
 004A1A1F    or          di,bx
>004A1A22    jmp         004A1A2C
 004A1A24    inc         ebx
 004A1A25    cmp         bx,256
>004A1A2A    jne         004A1A04
 004A1A2C    xor         eax,eax
 004A1A2E    pop         edx
 004A1A2F    pop         ecx
 004A1A30    pop         ecx
 004A1A31    mov         dword ptr fs:[eax],edx
 004A1A34    push        4A1A4E
 004A1A39    lea         eax,[ebp-8]
 004A1A3C    mov         edx,2
 004A1A41    call        @UStrArrayClr
 004A1A46    ret
>004A1A47    jmp         @HandleFinally
>004A1A4C    jmp         004A1A39
 004A1A4E    mov         eax,edi
 004A1A50    pop         edi
 004A1A51    pop         esi
 004A1A52    pop         ebx
 004A1A53    pop         ecx
 004A1A54    pop         ecx
 004A1A55    pop         ebp
 004A1A56    ret
*}
end;

//004A1A68
function UniqueCommand:Word;
begin
{*
 004A1A68    push        ebx
 004A1A69    mov         eax,[00793238]
 004A1A6E    call        TBits.OpenBit
 004A1A73    mov         ebx,eax
 004A1A75    movzx       edx,bx
 004A1A78    mov         cl,1
 004A1A7A    mov         eax,[00793238]
 004A1A7F    call        TBits.SetBit
 004A1A84    mov         eax,ebx
 004A1A86    pop         ebx
 004A1A87    ret
*}
end;

//004A1A88
function Iterate(var I:Integer; MenuItem:TMenuItem; AFunc:TIterator):Boolean;
begin
{*
 004A1A88    push        ebp
 004A1A89    mov         ebp,esp
 004A1A8B    add         esp,0FFFFFFF4
 004A1A8E    push        ebx
 004A1A8F    push        esi
 004A1A90    mov         dword ptr [ebp-8],ecx
 004A1A93    mov         esi,edx
 004A1A95    mov         ebx,eax
 004A1A97    mov         byte ptr [ebp-9],0
 004A1A9B    test        esi,esi
>004A1A9D    je          004A1AE0
>004A1A9F    jmp         004A1ACF
 004A1AA1    mov         edx,dword ptr [ebx]
 004A1AA3    mov         eax,esi
 004A1AA5    call        TMenuItem.GetItem
 004A1AAA    mov         dword ptr [ebp-4],eax
 004A1AAD    mov         eax,dword ptr [ebp-4]
 004A1AB0    movzx       eax,byte ptr [eax+3F]
 004A1AB4    mov         edx,dword ptr [ebp+8]
 004A1AB7    cmp         al,byte ptr [edx-1]
>004A1ABA    ja          004A1AE0
 004A1ABC    mov         eax,dword ptr [ebp-4]
 004A1ABF    mov         edx,dword ptr [ebp+8]
 004A1AC2    push        dword ptr [edx]
 004A1AC4    call        dword ptr [ebp-8]
 004A1AC7    add         esp,4
 004A1ACA    mov         byte ptr [ebp-9],al
 004A1ACD    inc         dword ptr [ebx]
 004A1ACF    cmp         byte ptr [ebp-9],0
>004A1AD3    jne         004A1AE0
 004A1AD5    mov         eax,esi
 004A1AD7    call        TMenuItem.GetCount
 004A1ADC    cmp         eax,dword ptr [ebx]
>004A1ADE    jg          004A1AA1
 004A1AE0    movzx       eax,byte ptr [ebp-9]
 004A1AE4    pop         esi
 004A1AE5    pop         ebx
 004A1AE6    mov         esp,ebp
 004A1AE8    pop         ebp
 004A1AE9    ret
*}
end;

//004A1AEC
procedure IterateMenus(Func:TIterator; Menu1:TMenuItem; Menu2:TMenuItem);
begin
{*
 004A1AEC    push        ebp
 004A1AED    mov         ebp,esp
 004A1AEF    add         esp,0FFFFFFE8
 004A1AF2    push        ebx
 004A1AF3    push        esi
 004A1AF4    push        edi
 004A1AF5    mov         dword ptr [ebp-0C],ecx
 004A1AF8    mov         edi,edx
 004A1AFA    mov         dword ptr [ebp-8],eax
 004A1AFD    xor         eax,eax
 004A1AFF    mov         dword ptr [ebp-10],eax
 004A1B02    xor         eax,eax
 004A1B04    mov         dword ptr [ebp-14],eax
 004A1B07    xor         ebx,ebx
 004A1B09    xor         esi,esi
 004A1B0B    test        edi,edi
>004A1B0D    je          004A1B18
 004A1B0F    mov         eax,edi
 004A1B11    call        TMenuItem.GetCount
 004A1B16    mov         ebx,eax
 004A1B18    cmp         dword ptr [ebp-0C],0
>004A1B1C    je          004A1B28
 004A1B1E    mov         eax,dword ptr [ebp-0C]
 004A1B21    call        TMenuItem.GetCount
 004A1B26    mov         esi,eax
 004A1B28    mov         byte ptr [ebp-16],0
>004A1B2C    jmp         004A1BD8
 004A1B31    mov         byte ptr [ebp-1],0FF
 004A1B35    mov         byte ptr [ebp-15],0FF
 004A1B39    cmp         ebx,dword ptr [ebp-10]
>004A1B3C    jle         004A1B4F
 004A1B3E    mov         edx,dword ptr [ebp-10]
 004A1B41    mov         eax,edi
 004A1B43    call        TMenuItem.GetItem
 004A1B48    movzx       eax,byte ptr [eax+3F]
 004A1B4C    mov         byte ptr [ebp-1],al
 004A1B4F    cmp         esi,dword ptr [ebp-14]
>004A1B52    jle         004A1B66
 004A1B54    mov         edx,dword ptr [ebp-14]
 004A1B57    mov         eax,dword ptr [ebp-0C]
 004A1B5A    call        TMenuItem.GetItem
 004A1B5F    movzx       eax,byte ptr [eax+3F]
 004A1B63    mov         byte ptr [ebp-15],al
 004A1B66    movzx       eax,byte ptr [ebp-1]
 004A1B6A    cmp         al,byte ptr [ebp-15]
>004A1B6D    ja          004A1B83
 004A1B6F    push        ebp
 004A1B70    lea         eax,[ebp-10]
 004A1B73    mov         ecx,dword ptr [ebp-8]
 004A1B76    mov         edx,edi
 004A1B78    call        Iterate
 004A1B7D    pop         ecx
 004A1B7E    mov         byte ptr [ebp-16],al
>004A1B81    jmp         004A1BA2
 004A1B83    movzx       eax,byte ptr [ebp-15]
 004A1B87    mov         byte ptr [ebp-1],al
 004A1B8A    push        ebp
 004A1B8B    lea         eax,[ebp-14]
 004A1B8E    mov         ecx,dword ptr [ebp-8]
 004A1B91    mov         edx,dword ptr [ebp-0C]
 004A1B94    call        Iterate
 004A1B99    pop         ecx
 004A1B9A    mov         byte ptr [ebp-16],al
>004A1B9D    jmp         004A1BA2
 004A1B9F    inc         dword ptr [ebp-10]
 004A1BA2    cmp         ebx,dword ptr [ebp-10]
>004A1BA5    jle         004A1BBF
 004A1BA7    mov         edx,dword ptr [ebp-10]
 004A1BAA    mov         eax,edi
 004A1BAC    call        TMenuItem.GetItem
 004A1BB1    movzx       eax,byte ptr [eax+3F]
 004A1BB5    cmp         al,byte ptr [ebp-1]
>004A1BB8    jbe         004A1B9F
>004A1BBA    jmp         004A1BBF
 004A1BBC    inc         dword ptr [ebp-14]
 004A1BBF    cmp         esi,dword ptr [ebp-14]
>004A1BC2    jle         004A1BD8
 004A1BC4    mov         edx,dword ptr [ebp-14]
 004A1BC7    mov         eax,dword ptr [ebp-0C]
 004A1BCA    call        TMenuItem.GetItem
 004A1BCF    movzx       eax,byte ptr [eax+3F]
 004A1BD3    cmp         al,byte ptr [ebp-1]
>004A1BD6    jbe         004A1BBC
 004A1BD8    cmp         byte ptr [ebp-16],0
>004A1BDC    jne         004A1BF0
 004A1BDE    cmp         ebx,dword ptr [ebp-10]
>004A1BE1    jg          004A1B31
 004A1BE7    cmp         esi,dword ptr [ebp-14]
>004A1BEA    jg          004A1B31
 004A1BF0    pop         edi
 004A1BF1    pop         esi
 004A1BF2    pop         ebx
 004A1BF3    mov         esp,ebp
 004A1BF5    pop         ebp
 004A1BF6    ret
*}
end;

//004A1BF8
procedure TMenuActionLink.AssignClient(AClient:TObject);
begin
{*
 004A1BF8    push        ebx
 004A1BF9    push        esi
 004A1BFA    mov         esi,edx
 004A1BFC    mov         ebx,eax
 004A1BFE    mov         eax,esi
 004A1C00    mov         edx,dword ptr ds:[49F488];TMenuItem
 004A1C06    call        @AsClass
 004A1C0B    mov         dword ptr [ebx+18],eax
 004A1C0E    pop         esi
 004A1C0F    pop         ebx
 004A1C10    ret
*}
end;

//004A1C14
function TMenuActionLink.IsAutoCheckLinked:Boolean;
begin
{*
 004A1C14    push        ebx
 004A1C15    push        esi
 004A1C16    mov         ebx,eax
 004A1C18    mov         esi,dword ptr [ebx+10]
 004A1C1B    mov         eax,esi
 004A1C1D    mov         edx,dword ptr ds:[4743FC];TCustomAction
 004A1C23    call        @IsClass
 004A1C28    test        al,al
>004A1C2A    je          004A1C3E
 004A1C2C    mov         eax,dword ptr [ebx+18]
 004A1C2F    movzx       eax,byte ptr [eax+0A8]
 004A1C36    cmp         al,byte ptr [esi+95]
>004A1C3C    je          004A1C43
 004A1C3E    xor         eax,eax
 004A1C40    pop         esi
 004A1C41    pop         ebx
 004A1C42    ret
 004A1C43    mov         al,1
 004A1C45    pop         esi
 004A1C46    pop         ebx
 004A1C47    ret
*}
end;

//004A1C48
function TMenuActionLink.IsCaptionLinked:Boolean;
begin
{*
 004A1C48    push        ebx
 004A1C49    mov         ebx,eax
 004A1C4B    mov         eax,ebx
 004A1C4D    call        TActionLink.IsCaptionLinked
 004A1C52    test        al,al
>004A1C54    je          004A1C6B
 004A1C56    mov         eax,dword ptr [ebx+10]
 004A1C59    mov         edx,dword ptr [eax+64]
 004A1C5C    mov         eax,dword ptr [ebx+18]
 004A1C5F    mov         eax,dword ptr [eax+34]
 004A1C62    call        SameCaption
 004A1C67    test        al,al
>004A1C69    jne         004A1C6F
 004A1C6B    xor         eax,eax
 004A1C6D    pop         ebx
 004A1C6E    ret
 004A1C6F    mov         al,1
 004A1C71    pop         ebx
 004A1C72    ret
*}
end;

//004A1C74
function TMenuActionLink.IsCheckedLinked:Boolean;
begin
{*
 004A1C74    push        ebx
 004A1C75    mov         ebx,eax
 004A1C77    mov         eax,ebx
 004A1C79    call        TActionLink.IsCheckedLinked
 004A1C7E    test        al,al
>004A1C80    je          004A1C91
 004A1C82    mov         eax,dword ptr [ebx+18]
 004A1C85    movzx       eax,byte ptr [eax+38]
 004A1C89    mov         edx,dword ptr [ebx+10]
 004A1C8C    cmp         al,byte ptr [edx+69]
>004A1C8F    je          004A1C95
 004A1C91    xor         eax,eax
 004A1C93    pop         ebx
 004A1C94    ret
 004A1C95    mov         al,1
 004A1C97    pop         ebx
 004A1C98    ret
*}
end;

//004A1C9C
function TMenuActionLink.IsEnabledLinked:Boolean;
begin
{*
 004A1C9C    push        ebx
 004A1C9D    mov         ebx,eax
 004A1C9F    mov         eax,ebx
 004A1CA1    call        TActionLink.IsEnabledLinked
 004A1CA6    test        al,al
>004A1CA8    je          004A1CB9
 004A1CAA    mov         eax,dword ptr [ebx+18]
 004A1CAD    movzx       eax,byte ptr [eax+39]
 004A1CB1    mov         edx,dword ptr [ebx+10]
 004A1CB4    cmp         al,byte ptr [edx+6A]
>004A1CB7    je          004A1CBD
 004A1CB9    xor         eax,eax
 004A1CBB    pop         ebx
 004A1CBC    ret
 004A1CBD    mov         al,1
 004A1CBF    pop         ebx
 004A1CC0    ret
*}
end;

//004A1CC4
function TMenuActionLink.IsHelpContextLinked:Boolean;
begin
{*
 004A1CC4    push        ebx
 004A1CC5    mov         ebx,eax
 004A1CC7    mov         eax,ebx
 004A1CC9    call        TActionLink.IsHelpContextLinked
 004A1CCE    test        al,al
>004A1CD0    je          004A1CE0
 004A1CD2    mov         eax,dword ptr [ebx+18]
 004A1CD5    mov         eax,dword ptr [eax+54]
 004A1CD8    mov         edx,dword ptr [ebx+10]
 004A1CDB    cmp         eax,dword ptr [edx+74]
>004A1CDE    je          004A1CE4
 004A1CE0    xor         eax,eax
 004A1CE2    pop         ebx
 004A1CE3    ret
 004A1CE4    mov         al,1
 004A1CE6    pop         ebx
 004A1CE7    ret
*}
end;

//004A1CE8
function TMenuActionLink.IsHintLinked:Boolean;
begin
{*
 004A1CE8    push        ebx
 004A1CE9    mov         ebx,eax
 004A1CEB    mov         eax,ebx
 004A1CED    call        TActionLink.IsHintLinked
 004A1CF2    test        al,al
>004A1CF4    je          004A1D09
 004A1CF6    mov         eax,dword ptr [ebx+18]
 004A1CF9    mov         eax,dword ptr [eax+58]
 004A1CFC    mov         edx,dword ptr [ebx+10]
 004A1CFF    mov         edx,dword ptr [edx+7C]
 004A1D02    call        @UStrEqual
>004A1D07    je          004A1D0D
 004A1D09    xor         eax,eax
 004A1D0B    pop         ebx
 004A1D0C    ret
 004A1D0D    mov         al,1
 004A1D0F    pop         ebx
 004A1D10    ret
*}
end;

//004A1D14
function TMenuActionLink.IsGroupIndexLinked:Boolean;
begin
{*
 004A1D14    push        ebx
 004A1D15    mov         ebx,eax
 004A1D17    mov         eax,ebx
 004A1D19    call        TActionLink.IsGroupIndexLinked
 004A1D1E    test        al,al
>004A1D20    je          004A1D3A
 004A1D22    mov         eax,dword ptr [ebx+18]
 004A1D25    cmp         byte ptr [eax+3D],0
>004A1D29    je          004A1D3A
 004A1D2B    mov         eax,dword ptr [ebx+18]
 004A1D2E    movzx       eax,byte ptr [eax+3F]
 004A1D32    mov         edx,dword ptr [ebx+10]
 004A1D35    cmp         eax,dword ptr [edx+6C]
>004A1D38    je          004A1D3E
 004A1D3A    xor         eax,eax
 004A1D3C    pop         ebx
 004A1D3D    ret
 004A1D3E    mov         al,1
 004A1D40    pop         ebx
 004A1D41    ret
*}
end;

//004A1D44
function TMenuActionLink.IsImageIndexLinked:Boolean;
begin
{*
 004A1D44    push        ebx
 004A1D45    mov         ebx,eax
 004A1D47    mov         eax,ebx
 004A1D49    call        TActionLink.IsImageIndexLinked
 004A1D4E    test        al,al
>004A1D50    je          004A1D63
 004A1D52    mov         eax,dword ptr [ebx+18]
 004A1D55    mov         eax,dword ptr [eax+40]
 004A1D58    mov         edx,dword ptr [ebx+10]
 004A1D5B    cmp         eax,dword ptr [edx+80]
>004A1D61    je          004A1D67
 004A1D63    xor         eax,eax
 004A1D65    pop         ebx
 004A1D66    ret
 004A1D67    mov         al,1
 004A1D69    pop         ebx
 004A1D6A    ret
*}
end;

//004A1D6C
function TMenuActionLink.IsShortCutLinked:Boolean;
begin
{*
 004A1D6C    push        ebx
 004A1D6D    mov         ebx,eax
 004A1D6F    mov         eax,ebx
 004A1D71    call        TActionLink.IsShortCutLinked
 004A1D76    test        al,al
>004A1D78    je          004A1D8D
 004A1D7A    mov         eax,dword ptr [ebx+18]
 004A1D7D    movzx       eax,word ptr [eax+60]
 004A1D81    mov         edx,dword ptr [ebx+10]
 004A1D84    cmp         ax,word ptr [edx+84]
>004A1D8B    je          004A1D91
 004A1D8D    xor         eax,eax
 004A1D8F    pop         ebx
 004A1D90    ret
 004A1D91    mov         al,1
 004A1D93    pop         ebx
 004A1D94    ret
*}
end;

//004A1D98
function TMenuActionLink.IsVisibleLinked:Boolean;
begin
{*
 004A1D98    push        ebx
 004A1D99    mov         ebx,eax
 004A1D9B    mov         eax,ebx
 004A1D9D    call        TActionLink.IsVisibleLinked
 004A1DA2    test        al,al
>004A1DA4    je          004A1DB8
 004A1DA6    mov         eax,dword ptr [ebx+18]
 004A1DA9    movzx       eax,byte ptr [eax+3E]
 004A1DAD    mov         edx,dword ptr [ebx+10]
 004A1DB0    cmp         al,byte ptr [edx+86]
>004A1DB6    je          004A1DBC
 004A1DB8    xor         eax,eax
 004A1DBA    pop         ebx
 004A1DBB    ret
 004A1DBC    mov         al,1
 004A1DBE    pop         ebx
 004A1DBF    ret
*}
end;

//004A1DC0
function TMenuActionLink.IsOnExecuteLinked:Boolean;
begin
{*
 004A1DC0    push        ebx
 004A1DC1    mov         ebx,eax
 004A1DC3    mov         eax,ebx
 004A1DC5    call        TBasicActionLink.IsOnExecuteLinked
 004A1DCA    test        al,al
>004A1DCC    je          004A1DDF
 004A1DCE    mov         eax,dword ptr [ebx+18]
 004A1DD1    mov         eax,dword ptr [eax+88]
 004A1DD7    mov         edx,dword ptr [ebx+10]
 004A1DDA    cmp         eax,dword ptr [edx+40]
>004A1DDD    je          004A1DE3
 004A1DDF    xor         eax,eax
 004A1DE1    pop         ebx
 004A1DE2    ret
 004A1DE3    mov         al,1
 004A1DE5    pop         ebx
 004A1DE6    ret
*}
end;

//004A1DE8
procedure TMenuActionLink.SetAutoCheck(Value:Boolean);
begin
{*
 004A1DE8    push        ebx
 004A1DE9    push        esi
 004A1DEA    mov         ebx,edx
 004A1DEC    mov         esi,eax
 004A1DEE    mov         eax,esi
 004A1DF0    mov         edx,dword ptr [eax]
 004A1DF2    call        dword ptr [edx+78]
 004A1DF5    test        al,al
>004A1DF7    je          004A1E02
 004A1DF9    mov         eax,dword ptr [esi+18]
 004A1DFC    mov         byte ptr [eax+0A8],bl
 004A1E02    pop         esi
 004A1E03    pop         ebx
 004A1E04    ret
*}
end;

//004A1E08
procedure TMenuActionLink.SetCaption(const Value:UnicodeString);
begin
{*
 004A1E08    push        ebx
 004A1E09    push        esi
 004A1E0A    mov         esi,edx
 004A1E0C    mov         ebx,eax
 004A1E0E    mov         eax,ebx
 004A1E10    mov         edx,dword ptr [eax]
 004A1E12    call        dword ptr [edx+20]
 004A1E15    test        al,al
>004A1E17    je          004A1E23
 004A1E19    mov         edx,esi
 004A1E1B    mov         eax,dword ptr [ebx+18]
 004A1E1E    call        TMenuItem.SetCaption
 004A1E23    pop         esi
 004A1E24    pop         ebx
 004A1E25    ret
*}
end;

//004A1E28
procedure TMenuActionLink.SetChecked(Value:Boolean);
begin
{*
 004A1E28    push        ebx
 004A1E29    push        esi
 004A1E2A    mov         ebx,edx
 004A1E2C    mov         esi,eax
 004A1E2E    mov         eax,esi
 004A1E30    mov         edx,dword ptr [eax]
 004A1E32    call        dword ptr [edx+24]
 004A1E35    test        al,al
>004A1E37    je          004A1E43
 004A1E39    mov         edx,ebx
 004A1E3B    mov         eax,dword ptr [esi+18]
 004A1E3E    call        TMenuItem.SetChecked
 004A1E43    pop         esi
 004A1E44    pop         ebx
 004A1E45    ret
*}
end;

//004A1E48
procedure TMenuActionLink.SetEnabled(Value:Boolean);
begin
{*
 004A1E48    push        ebx
 004A1E49    push        esi
 004A1E4A    mov         ebx,edx
 004A1E4C    mov         esi,eax
 004A1E4E    mov         eax,esi
 004A1E50    mov         edx,dword ptr [eax]
 004A1E52    call        dword ptr [edx+28]
 004A1E55    test        al,al
>004A1E57    je          004A1E63
 004A1E59    mov         edx,ebx
 004A1E5B    mov         eax,dword ptr [esi+18]
 004A1E5E    call        TMenuItem.SetEnabled
 004A1E63    pop         esi
 004A1E64    pop         ebx
 004A1E65    ret
*}
end;

//004A1E68
procedure TMenuActionLink.SetHelpContext(Value:THelpContext);
begin
{*
 004A1E68    push        ebx
 004A1E69    push        esi
 004A1E6A    mov         esi,edx
 004A1E6C    mov         ebx,eax
 004A1E6E    mov         eax,ebx
 004A1E70    mov         edx,dword ptr [eax]
 004A1E72    call        dword ptr [edx+30]
 004A1E75    test        al,al
>004A1E77    je          004A1E7F
 004A1E79    mov         eax,dword ptr [ebx+18]
 004A1E7C    mov         dword ptr [eax+54],esi
 004A1E7F    pop         esi
 004A1E80    pop         ebx
 004A1E81    ret
*}
end;

//004A1E84
procedure TMenuActionLink.SetHint(const Value:UnicodeString);
begin
{*
 004A1E84    push        ebx
 004A1E85    push        esi
 004A1E86    mov         esi,edx
 004A1E88    mov         ebx,eax
 004A1E8A    mov         eax,ebx
 004A1E8C    mov         edx,dword ptr [eax]
 004A1E8E    call        dword ptr [edx+38]
 004A1E91    test        al,al
>004A1E93    je          004A1EA2
 004A1E95    mov         eax,dword ptr [ebx+18]
 004A1E98    add         eax,58
 004A1E9B    mov         edx,esi
 004A1E9D    call        @UStrAsg
 004A1EA2    pop         esi
 004A1EA3    pop         ebx
 004A1EA4    ret
*}
end;

//004A1EA8
procedure TMenuActionLink.SetImageIndex(Value:Integer);
begin
{*
 004A1EA8    push        ebx
 004A1EA9    push        esi
 004A1EAA    mov         esi,edx
 004A1EAC    mov         ebx,eax
 004A1EAE    mov         eax,ebx
 004A1EB0    mov         edx,dword ptr [eax]
 004A1EB2    call        dword ptr [edx+3C]
 004A1EB5    test        al,al
>004A1EB7    je          004A1EC3
 004A1EB9    mov         edx,esi
 004A1EBB    mov         eax,dword ptr [ebx+18]
 004A1EBE    call        TMenuItem.SetImageIndex
 004A1EC3    pop         esi
 004A1EC4    pop         ebx
 004A1EC5    ret
*}
end;

//004A1EC8
procedure TMenuActionLink.SetShortCut(Value:TShortCut);
begin
{*
 004A1EC8    push        ebx
 004A1EC9    push        esi
 004A1ECA    mov         esi,edx
 004A1ECC    mov         ebx,eax
 004A1ECE    mov         eax,ebx
 004A1ED0    mov         edx,dword ptr [eax]
 004A1ED2    call        dword ptr [edx+40]
 004A1ED5    test        al,al
>004A1ED7    je          004A1EE3
 004A1ED9    mov         edx,esi
 004A1EDB    mov         eax,dword ptr [ebx+18]
 004A1EDE    call        TMenuItem.SetShortCut
 004A1EE3    pop         esi
 004A1EE4    pop         ebx
 004A1EE5    ret
*}
end;

//004A1EE8
procedure TMenuActionLink.SetVisible(Value:Boolean);
begin
{*
 004A1EE8    push        ebx
 004A1EE9    push        esi
 004A1EEA    mov         ebx,edx
 004A1EEC    mov         esi,eax
 004A1EEE    mov         eax,esi
 004A1EF0    mov         edx,dword ptr [eax]
 004A1EF2    call        dword ptr [edx+44]
 004A1EF5    test        al,al
>004A1EF7    je          004A1F03
 004A1EF9    mov         edx,ebx
 004A1EFB    mov         eax,dword ptr [esi+18]
 004A1EFE    call        TMenuItem.SetVisible
 004A1F03    pop         esi
 004A1F04    pop         ebx
 004A1F05    ret
*}
end;

//004A1F08
procedure TMenuActionLink.SetOnExecute(Value:TNotifyEvent);
begin
{*
 004A1F08    push        ebp
 004A1F09    mov         ebp,esp
 004A1F0B    push        ebx
 004A1F0C    mov         ebx,eax
 004A1F0E    mov         eax,ebx
 004A1F10    mov         edx,dword ptr [eax]
 004A1F12    call        dword ptr [edx+8]
 004A1F15    test        al,al
>004A1F17    je          004A1F2E
 004A1F19    mov         eax,dword ptr [ebx+18]
 004A1F1C    mov         edx,dword ptr [ebp+8]
 004A1F1F    mov         dword ptr [eax+88],edx
 004A1F25    mov         edx,dword ptr [ebp+0C]
 004A1F28    mov         dword ptr [eax+8C],edx
 004A1F2E    pop         ebx
 004A1F2F    pop         ebp
 004A1F30    ret         8
*}
end;

//004A1F34
constructor TMenuItemEnumerator.Create;
begin
{*
 004A1F34    push        ebx
 004A1F35    push        esi
 004A1F36    push        edi
 004A1F37    test        dl,dl
>004A1F39    je          004A1F43
 004A1F3B    add         esp,0FFFFFFF0
 004A1F3E    call        @ClassCreate
 004A1F43    mov         esi,ecx
 004A1F45    mov         ebx,edx
 004A1F47    mov         edi,eax
 004A1F49    xor         edx,edx
 004A1F4B    mov         eax,edi
 004A1F4D    call        TObject.Create
 004A1F52    mov         dword ptr [edi+4],0FFFFFFFF
 004A1F59    mov         dword ptr [edi+8],esi
 004A1F5C    mov         eax,edi
 004A1F5E    test        bl,bl
>004A1F60    je          004A1F71
 004A1F62    call        @AfterConstruction
 004A1F67    pop         dword ptr fs:[0]
 004A1F6E    add         esp,0C
 004A1F71    mov         eax,edi
 004A1F73    pop         edi
 004A1F74    pop         esi
 004A1F75    pop         ebx
 004A1F76    ret
*}
end;

//004A1F78
function TMenuItemEnumerator.GetCurrent:TMenuItem;
begin
{*
 004A1F78    mov         edx,dword ptr [eax+4]
 004A1F7B    mov         eax,dword ptr [eax+8]
 004A1F7E    call        TMenuItem.GetItem
 004A1F83    ret
*}
end;

//004A1F84
function TMenuItemEnumerator.MoveNext:Boolean;
begin
{*
 004A1F84    push        ebx
 004A1F85    mov         ebx,eax
 004A1F87    mov         eax,dword ptr [ebx+8]
 004A1F8A    call        TMenuItem.GetCount
 004A1F8F    dec         eax
 004A1F90    cmp         eax,dword ptr [ebx+4]
 004A1F93    setg        al
 004A1F96    test        al,al
>004A1F98    je          004A1F9D
 004A1F9A    inc         dword ptr [ebx+4]
 004A1F9D    pop         ebx
 004A1F9E    ret
*}
end;

//004A1FA0
constructor TMenuItem.Create;
begin
{*
 004A1FA0    push        ebp
 004A1FA1    mov         ebp,esp
 004A1FA3    push        ecx
 004A1FA4    push        ebx
 004A1FA5    push        esi
 004A1FA6    test        dl,dl
>004A1FA8    je          004A1FB2
 004A1FAA    add         esp,0FFFFFFF0
 004A1FAD    call        @ClassCreate
 004A1FB2    mov         byte ptr [ebp-1],dl
 004A1FB5    mov         ebx,eax
 004A1FB7    xor         edx,edx
 004A1FB9    mov         eax,ebx
 004A1FBB    call        TComponent.Create
 004A1FC0    mov         byte ptr [ebx+3E],1
 004A1FC4    mov         byte ptr [ebx+39],1
 004A1FC8    mov         byte ptr [ebx+3B],2
 004A1FCC    mov         byte ptr [ebx+3C],2
 004A1FD0    call        UniqueCommand
 004A1FD5    mov         word ptr [ebx+50],ax
 004A1FD9    mov         dword ptr [ebx+40],0FFFFFFFF
 004A1FE0    lea         eax,[ebx+58]
 004A1FE3    call        @UStrClr
 004A1FE8    mov         dl,1
 004A1FEA    mov         eax,[0049B438];TChangeLink
 004A1FEF    call        TObject.Create
 004A1FF4    mov         esi,eax
 004A1FF6    mov         dword ptr [ebx+78],esi
 004A1FF9    mov         dword ptr [esi+0C],ebx
 004A1FFC    mov         dword ptr [esi+8],4A5CC0;TMenuItem.ImageListChange
 004A2003    mov         eax,ebx
 004A2005    cmp         byte ptr [ebp-1],0
>004A2009    je          004A201A
 004A200B    call        @AfterConstruction
 004A2010    pop         dword ptr fs:[0]
 004A2017    add         esp,0C
 004A201A    mov         eax,ebx
 004A201C    pop         esi
 004A201D    pop         ebx
 004A201E    pop         ecx
 004A201F    pop         ebp
 004A2020    ret
*}
end;

//004A2024
destructor TMenuItem.Destroy();
begin
{*
 004A2024    push        ebx
 004A2025    push        esi
 004A2026    call        @BeforeDestruction
 004A202B    mov         ebx,edx
 004A202D    mov         esi,eax
 004A202F    mov         edx,esi
 004A2031    mov         eax,[00793230]
 004A2036    call        TMenuItemStack.ClearItem
 004A203B    mov         eax,dword ptr [esi+64]
 004A203E    test        eax,eax
>004A2040    je          004A205E
 004A2042    mov         edx,esi
 004A2044    call        TMenuItem.Remove
 004A2049    xor         eax,eax
 004A204B    mov         dword ptr [esi+64],eax
>004A204E    jmp         004A205E
 004A2050    xor         edx,edx
 004A2052    mov         eax,esi
 004A2054    call        TMenuItem.GetItem
 004A2059    call        TObject.Free
 004A205E    mov         eax,esi
 004A2060    call        TMenuItem.GetCount
 004A2065    test        eax,eax
>004A2067    jg          004A2050
 004A2069    cmp         dword ptr [esi+0AC],0
>004A2070    je          004A2087
 004A2072    xor         edx,edx
 004A2074    mov         eax,esi
 004A2076    call        TMenuItem.MergeWith
 004A207B    mov         eax,dword ptr [esi+0AC]
 004A2081    push        eax
 004A2082    call        user32.DestroyMenu
 004A2087    lea         eax,[esi+5C]
 004A208A    mov         edx,dword ptr [eax]
 004A208C    xor         ecx,ecx
 004A208E    mov         dword ptr [eax],ecx
 004A2090    mov         eax,edx
 004A2092    call        TObject.Free
 004A2097    lea         eax,[esi+44]
 004A209A    mov         edx,dword ptr [eax]
 004A209C    xor         ecx,ecx
 004A209E    mov         dword ptr [eax],ecx
 004A20A0    mov         eax,edx
 004A20A2    call        TObject.Free
 004A20A7    lea         eax,[esi+78]
 004A20AA    mov         edx,dword ptr [eax]
 004A20AC    xor         ecx,ecx
 004A20AE    mov         dword ptr [eax],ecx
 004A20B0    mov         eax,edx
 004A20B2    call        TObject.Free
 004A20B7    movzx       eax,word ptr [esi+50]
 004A20BB    test        ax,ax
>004A20BE    je          004A20CF
 004A20C0    movzx       edx,ax
 004A20C3    xor         ecx,ecx
 004A20C5    mov         eax,[00793238]
 004A20CA    call        TBits.SetBit
 004A20CF    mov         eax,dword ptr [esi+4C]
 004A20D2    test        eax,eax
>004A20D4    je          004A20DB
 004A20D6    call        TObject.Free
 004A20DB    mov         edx,ebx
 004A20DD    and         dl,0FC
 004A20E0    mov         eax,esi
 004A20E2    call        TComponent.Destroy
 004A20E7    test        bl,bl
>004A20E9    jle         004A20F2
 004A20EB    mov         eax,esi
 004A20ED    call        @ClassDestroy
 004A20F2    pop         esi
 004A20F3    pop         ebx
 004A20F4    ret
*}
end;

//004A20F8
procedure TMenuItem.AppendTo(Menu:HMENU; ARightToLeft:Boolean);
begin
{*
 004A20F8    push        ebp
 004A20F9    mov         ebp,esp
 004A20FB    add         esp,0FFFFFFBC
 004A20FE    push        ebx
 004A20FF    push        esi
 004A2100    push        edi
 004A2101    xor         ebx,ebx
 004A2103    mov         dword ptr [ebp-44],ebx
 004A2106    mov         dword ptr [ebp-4],ebx
 004A2109    mov         byte ptr [ebp-9],cl
 004A210C    mov         dword ptr [ebp-8],edx
 004A210F    mov         edi,eax
 004A2111    xor         eax,eax
 004A2113    push        ebp
 004A2114    push        4A23C0
 004A2119    push        dword ptr fs:[eax]
 004A211C    mov         dword ptr fs:[eax],esp
 004A211F    cmp         byte ptr [edi+3E],0
>004A2123    je          004A23A2
 004A2129    lea         eax,[ebp-4]
 004A212C    mov         edx,dword ptr [edi+34]
 004A212F    call        @UStrLAsg
 004A2134    mov         eax,edi
 004A2136    call        TMenuItem.GetCount
 004A213B    test        eax,eax
>004A213D    jle         004A214B
 004A213F    mov         eax,edi
 004A2141    call        TMenuItem.GetHandle
 004A2146    mov         dword ptr [ebp-2C],eax
>004A2149    jmp         004A2195
 004A214B    cmp         word ptr [edi+60],0
>004A2150    je          004A2195
 004A2152    mov         ebx,dword ptr [edi+64]
 004A2155    test        ebx,ebx
>004A2157    je          004A2171
 004A2159    cmp         dword ptr [ebx+64],0
>004A215D    jne         004A2171
 004A215F    mov         eax,dword ptr [ebx+4]
 004A2162    mov         edx,dword ptr ds:[4A09B4];TMainMenu
 004A2168    call        @IsClass
 004A216D    test        al,al
>004A216F    jne         004A2195
 004A2171    push        dword ptr [ebp-4]
 004A2174    push        4A23DC;'	'
 004A2179    lea         edx,[ebp-44]
 004A217C    movzx       eax,word ptr [edi+60]
 004A2180    call        ShortCutToText
 004A2185    push        dword ptr [ebp-44]
 004A2188    lea         eax,[ebp-4]
 004A218B    mov         edx,3
 004A2190    call        @UStrCatN
 004A2195    call        kernel32.GetVersion
 004A219A    cmp         al,4
>004A219C    jb          004A2318
 004A21A2    mov         eax,[0078DB58];^gvar_00784C7C
 004A21A7    cmp         dword ptr [eax],1
>004A21AA    jne         004A21B6
 004A21AC    mov         eax,[0078D080];^gvar_00784C80
 004A21B1    cmp         dword ptr [eax],4
>004A21B4    jle         004A21BF
 004A21B6    mov         dword ptr [ebp-40],30
>004A21BD    jmp         004A21C6
 004A21BF    mov         dword ptr [ebp-40],2C
 004A21C6    mov         dword ptr [ebp-3C],3F
 004A21CD    mov         eax,edi
 004A21CF    call        TMenuItem.GetParentMenu
 004A21D4    mov         esi,eax
 004A21D6    mov         eax,edi
 004A21D8    call        TMenuItem.GetImageList
 004A21DD    mov         dword ptr [ebp-10],eax
 004A21E0    test        esi,esi
>004A21E2    je          004A21F0
 004A21E4    cmp         byte ptr [esi+40],0
>004A21E8    jne         004A2206
 004A21EA    cmp         dword ptr [ebp-10],0
>004A21EE    jne         004A2206
 004A21F0    mov         ebx,dword ptr [edi+4C]
 004A21F3    test        ebx,ebx
>004A21F5    je          004A2202
 004A21F7    mov         eax,ebx
 004A21F9    mov         edx,dword ptr [eax]
 004A21FB    call        dword ptr [edx+20]
 004A21FE    test        al,al
>004A2200    je          004A2206
 004A2202    xor         eax,eax
>004A2204    jmp         004A2208
 004A2206    mov         al,1
 004A2208    mov         ebx,eax
 004A220A    mov         eax,dword ptr [edi+64]
 004A220D    mov         eax,dword ptr [eax+4]
 004A2210    mov         edx,dword ptr ds:[4A09B4];TMainMenu
 004A2216    call        @IsClass
 004A221B    test        al,al
>004A221D    je          004A225E
 004A221F    xor         edx,edx
 004A2221    mov         eax,6
 004A2226    call        CheckWin32Version
 004A222B    test        al,al
>004A222D    je          004A225E
 004A222F    call        ThemeServices
 004A2234    cmp         byte ptr [eax+5],0
>004A2238    je          004A225E
 004A223A    test        bl,bl
>004A223C    je          004A2256
 004A223E    cmp         dword ptr [ebp-10],0
>004A2242    je          004A224A
 004A2244    cmp         dword ptr [edi+40],0FFFFFFFF
>004A2248    jne         004A225A
 004A224A    cmp         dword ptr [edi+4C],0
>004A224E    jne         004A225A
 004A2250    cmp         byte ptr [esi+40],0
>004A2254    jne         004A225A
 004A2256    xor         eax,eax
>004A2258    jmp         004A225C
 004A225A    mov         al,1
 004A225C    mov         ebx,eax
 004A225E    mov         eax,dword ptr [edi+34]
 004A2261    mov         edx,4A23EC;'-'
 004A2266    call        @UStrEqual
 004A226B    sete        al
 004A226E    and         eax,7F
 004A2271    mov         eax,dword ptr [eax*4+785CB0]
 004A2278    movzx       edx,byte ptr [edi+3D]
 004A227C    mov         edx,dword ptr [edx*4+785CA8]
 004A2283    movzx       ecx,byte ptr [edi+48]
 004A2287    or          edx,dword ptr [ecx*4+785C84]
 004A228E    or          eax,edx
 004A2290    movzx       edx,byte ptr [ebp-9]
 004A2294    or          eax,dword ptr [edx*4+785CB8]
 004A229B    movzx       edx,bl
 004A229E    or          eax,dword ptr [edx*4+785CC0]
 004A22A5    mov         dword ptr [ebp-38],eax
 004A22A8    movzx       eax,byte ptr [edi+38]
 004A22AC    mov         eax,dword ptr [eax*4+785C90]
 004A22B3    movzx       edx,byte ptr [edi+39]
 004A22B7    or          eax,dword ptr [edx*4+785CA0]
 004A22BE    movzx       edx,byte ptr [edi+3A]
 004A22C2    or          eax,dword ptr [edx*4+785C98]
 004A22C9    mov         dword ptr [ebp-34],eax
 004A22CC    movzx       eax,word ptr [edi+50]
 004A22D0    mov         dword ptr [ebp-30],eax
 004A22D3    xor         eax,eax
 004A22D5    mov         dword ptr [ebp-2C],eax
 004A22D8    xor         eax,eax
 004A22DA    mov         dword ptr [ebp-28],eax
 004A22DD    xor         eax,eax
 004A22DF    mov         dword ptr [ebp-24],eax
 004A22E2    mov         eax,edi
 004A22E4    call        TMenuItem.GetCount
 004A22E9    test        eax,eax
>004A22EB    jle         004A22F7
 004A22ED    mov         eax,edi
 004A22EF    call        TMenuItem.GetHandle
 004A22F4    mov         dword ptr [ebp-2C],eax
 004A22F7    mov         eax,dword ptr [ebp-4]
 004A22FA    call        @UStrToPWChar
 004A22FF    mov         dword ptr [ebp-1C],eax
 004A2302    lea         eax,[ebp-40]
 004A2305    push        eax
 004A2306    push        0FF
 004A2308    push        0FF
 004A230A    mov         eax,dword ptr [ebp-8]
 004A230D    push        eax
 004A230E    call        user32.InsertMenuItemW
>004A2313    jmp         004A23A2
 004A2318    mov         eax,dword ptr [edi+34]
 004A231B    mov         edx,4A23EC;'-'
 004A2320    call        @UStrEqual
 004A2325    sete        al
 004A2328    and         eax,7F
 004A232B    mov         ebx,dword ptr [eax*4+785C7C]
 004A2332    movzx       eax,byte ptr [edi+48]
 004A2336    mov         eax,dword ptr [eax*4+785C70]
 004A233D    movzx       edx,byte ptr [edi+38]
 004A2341    or          eax,dword ptr [edx*4+785C60]
 004A2348    movzx       edx,byte ptr [edi+39]
 004A234C    or          eax,dword ptr [edx*4+785C68]
 004A2353    or          ebx,eax
 004A2355    or          ebx,400
 004A235B    mov         eax,edi
 004A235D    call        TMenuItem.GetCount
 004A2362    test        eax,eax
>004A2364    jle         004A2388
 004A2366    mov         eax,dword ptr [edi+34]
 004A2369    call        @UStrToPWChar
 004A236E    push        eax
 004A236F    mov         eax,edi
 004A2371    call        TMenuItem.GetHandle
 004A2376    push        eax
 004A2377    or          ebx,10
 004A237A    push        ebx
 004A237B    push        0FF
 004A237D    mov         eax,dword ptr [ebp-8]
 004A2380    push        eax
 004A2381    call        user32.InsertMenuW
>004A2386    jmp         004A23A2
 004A2388    mov         eax,dword ptr [ebp-4]
 004A238B    call        @UStrToPWChar
 004A2390    push        eax
 004A2391    movzx       eax,word ptr [edi+50]
 004A2395    push        eax
 004A2396    push        ebx
 004A2397    push        0FF
 004A2399    mov         eax,dword ptr [ebp-8]
 004A239C    push        eax
 004A239D    call        user32.InsertMenuW
 004A23A2    xor         eax,eax
 004A23A4    pop         edx
 004A23A5    pop         ecx
 004A23A6    pop         ecx
 004A23A7    mov         dword ptr fs:[eax],edx
 004A23AA    push        4A23C7
 004A23AF    lea         eax,[ebp-44]
 004A23B2    call        @UStrClr
 004A23B7    lea         eax,[ebp-4]
 004A23BA    call        @UStrClr
 004A23BF    ret
>004A23C0    jmp         @HandleFinally
>004A23C5    jmp         004A23AF
 004A23C7    pop         edi
 004A23C8    pop         esi
 004A23C9    pop         ebx
 004A23CA    mov         esp,ebp
 004A23CC    pop         ebp
 004A23CD    ret
*}
end;

//004A23F0
function AddIn(MenuItem:TMenuItem):Boolean;
begin
{*
 004A23F0    push        ebp
 004A23F1    mov         ebp,esp
 004A23F3    mov         edx,dword ptr [ebp+8]
 004A23F6    movzx       ecx,byte ptr [edx-5]
 004A23FA    mov         edx,dword ptr [ebp+8]
 004A23FD    mov         edx,dword ptr [edx-4]
 004A2400    mov         edx,dword ptr [edx+0AC]
 004A2406    call        TMenuItem.AppendTo
 004A240B    xor         eax,eax
 004A240D    pop         ebp
 004A240E    ret
*}
end;

//004A2410
procedure TMenuItem.PopulateMenu;
begin
{*
 004A2410    push        ebp
 004A2411    mov         ebp,esp
 004A2413    add         esp,0FFFFFFF8
 004A2416    push        ebx
 004A2417    mov         dword ptr [ebp-4],eax
 004A241A    mov         eax,dword ptr [ebp-4]
 004A241D    mov         ebx,dword ptr [eax+70]
 004A2420    test        ebx,ebx
>004A2422    je          004A2449
 004A2424    mov         eax,ebx
 004A2426    mov         edx,dword ptr ds:[4A09B4];TMainMenu
 004A242C    call        @IsClass
 004A2431    test        al,al
>004A2433    je          004A2449
 004A2435    xor         edx,edx
 004A2437    mov         eax,dword ptr [ebp-4]
 004A243A    call        TMenuItem.InternalRethinkHotkeys
 004A243F    xor         edx,edx
 004A2441    mov         eax,dword ptr [ebp-4]
 004A2444    call        TMenuItem.InternalRethinkLines
 004A2449    mov         eax,dword ptr [ebp-4]
 004A244C    mov         ebx,dword ptr [eax+70]
 004A244F    test        ebx,ebx
>004A2451    je          004A245E
 004A2453    mov         eax,ebx
 004A2455    call        TMenu.IsRightToLeft
 004A245A    test        al,al
>004A245C    jne         004A2462
 004A245E    xor         eax,eax
>004A2460    jmp         004A2464
 004A2462    mov         al,1
 004A2464    mov         byte ptr [ebp-5],al
 004A2467    mov         eax,dword ptr [ebp-4]
 004A246A    mov         edx,dword ptr [eax+68]
 004A246D    mov         eax,4A23F0;AddIn:Boolean
 004A2472    mov         ecx,dword ptr [ebp-4]
 004A2475    call        IterateMenus
 004A247A    pop         ebx
 004A247B    pop         ecx
 004A247C    pop         ecx
 004A247D    pop         ebp
 004A247E    ret
*}
end;

//004A2480
procedure TMenuItem.ReadShortCutText(Reader:TReader);
begin
{*
 004A2480    push        ebp
 004A2481    mov         ebp,esp
 004A2483    push        0
 004A2485    push        ebx
 004A2486    push        esi
 004A2487    mov         esi,edx
 004A2489    mov         ebx,eax
 004A248B    xor         eax,eax
 004A248D    push        ebp
 004A248E    push        4A24CA
 004A2493    push        dword ptr fs:[eax]
 004A2496    mov         dword ptr fs:[eax],esp
 004A2499    lea         edx,[ebp-4]
 004A249C    mov         eax,esi
 004A249E    call        TReader.ReadString
 004A24A3    mov         eax,dword ptr [ebp-4]
 004A24A6    call        TextToShortCut
 004A24AB    mov         edx,eax
 004A24AD    mov         eax,ebx
 004A24AF    call        TMenuItem.SetShortCut
 004A24B4    xor         eax,eax
 004A24B6    pop         edx
 004A24B7    pop         ecx
 004A24B8    pop         ecx
 004A24B9    mov         dword ptr fs:[eax],edx
 004A24BC    push        4A24D1
 004A24C1    lea         eax,[ebp-4]
 004A24C4    call        @UStrClr
 004A24C9    ret
>004A24CA    jmp         @HandleFinally
>004A24CF    jmp         004A24C1
 004A24D1    pop         esi
 004A24D2    pop         ebx
 004A24D3    pop         ecx
 004A24D4    pop         ebp
 004A24D5    ret
*}
end;

//004A24D8
procedure TMenuItem.MergeWith(Menu:TMenuItem);
begin
{*
 004A24D8    push        ebx
 004A24D9    mov         ebx,eax
 004A24DB    test        edx,edx
>004A24DD    je          004A24E5
 004A24DF    test        byte ptr [edx+1C],8
>004A24E3    jne         004A250F
 004A24E5    mov         eax,dword ptr [ebx+68]
 004A24E8    cmp         edx,eax
>004A24EA    je          004A250F
 004A24EC    test        eax,eax
>004A24EE    je          004A24F5
 004A24F0    xor         ecx,ecx
 004A24F2    mov         dword ptr [eax+6C],ecx
 004A24F5    mov         eax,edx
 004A24F7    mov         dword ptr [ebx+68],eax
 004A24FA    test        eax,eax
>004A24FC    je          004A2508
 004A24FE    mov         dword ptr [eax+6C],ebx
 004A2501    mov         edx,ebx
 004A2503    call        TComponent.FreeNotification
 004A2508    mov         eax,ebx
 004A250A    call        TMenuItem.RebuildHandle
 004A250F    pop         ebx
 004A2510    ret
*}
end;

//004A2514
procedure TMenuItem.Loaded;
begin
{*
 004A2514    push        ebx
 004A2515    push        esi
 004A2516    mov         ebx,eax
 004A2518    mov         eax,ebx
 004A251A    call        TComponent.Loaded
 004A251F    mov         eax,ebx
 004A2521    call        TMenuItem.GetAction
 004A2526    test        eax,eax
>004A2528    je          004A2540
 004A252A    mov         eax,ebx
 004A252C    call        TMenuItem.GetAction
 004A2531    mov         edx,eax
 004A2533    mov         cl,1
 004A2535    mov         eax,ebx
 004A2537    mov         si,0FFF0
 004A253B    call        @CallDynaInst
 004A2540    cmp         byte ptr [ebx+74],0
>004A2544    je          004A254D
 004A2546    mov         eax,ebx
 004A2548    call        TMenuItem.RebuildHandle
 004A254D    pop         esi
 004A254E    pop         ebx
 004A254F    ret
*}
end;

//004A2550
procedure TMenuItem.RebuildHandle;
begin
{*
 004A2550    push        ebx
 004A2551    push        esi
 004A2552    push        edi
 004A2553    push        ebp
 004A2554    mov         ebp,eax
 004A2556    test        byte ptr [ebp+1C],8
>004A255A    jne         004A261F
 004A2560    test        byte ptr [ebp+1C],2
>004A2564    je          004A256F
 004A2566    mov         byte ptr [ebp+74],1
>004A256A    jmp         004A261F
 004A256F    mov         eax,dword ptr [ebp+6C]
 004A2572    test        eax,eax
>004A2574    je          004A2580
 004A2576    call        TMenuItem.RebuildHandle
>004A257B    jmp         004A261F
 004A2580    mov         eax,ebp
 004A2582    call        TMenuItem.GetHandle
 004A2587    push        eax
 004A2588    call        user32.GetMenuItemCount
 004A258D    mov         esi,eax
 004A258F    test        esi,esi
 004A2591    sete        bl
 004A2594    test        esi,esi
>004A2596    jle         004A25CC
 004A2598    push        400
 004A259D    mov         edi,esi
 004A259F    dec         edi
 004A25A0    push        edi
 004A25A1    mov         eax,ebp
 004A25A3    call        TMenuItem.GetHandle
 004A25A8    push        eax
 004A25A9    call        user32.GetMenuState
 004A25AE    test        al,4
>004A25B0    jne         004A25C7
 004A25B2    push        400
 004A25B7    push        edi
 004A25B8    mov         eax,ebp
 004A25BA    call        TMenuItem.GetHandle
 004A25BF    push        eax
 004A25C0    call        user32.RemoveMenu
 004A25C5    mov         bl,1
 004A25C7    dec         esi
 004A25C8    test        esi,esi
>004A25CA    jg          004A2598
 004A25CC    test        bl,bl
>004A25CE    je          004A261F
 004A25D0    cmp         dword ptr [ebp+64],0
>004A25D4    jne         004A260F
 004A25D6    mov         eax,dword ptr [ebp+70]
 004A25D9    mov         edx,dword ptr ds:[4A09B4];TMainMenu
 004A25DF    call        @IsClass
 004A25E4    test        al,al
>004A25E6    je          004A260F
 004A25E8    mov         eax,ebp
 004A25EA    call        TMenuItem.GetHandle
 004A25EF    push        eax
 004A25F0    call        user32.GetMenuItemCount
 004A25F5    test        eax,eax
>004A25F7    jne         004A260F
 004A25F9    mov         eax,dword ptr [ebp+0AC]
 004A25FF    push        eax
 004A2600    call        user32.DestroyMenu
 004A2605    xor         eax,eax
 004A2607    mov         dword ptr [ebp+0AC],eax
>004A260D    jmp         004A2616
 004A260F    mov         eax,ebp
 004A2611    call        TMenuItem.PopulateMenu
 004A2616    xor         edx,edx
 004A2618    mov         eax,ebp
 004A261A    mov         ecx,dword ptr [eax]
 004A261C    call        dword ptr [ecx+40]
 004A261F    pop         ebp
 004A2620    pop         edi
 004A2621    pop         esi
 004A2622    pop         ebx
 004A2623    ret
*}
end;

//004A2624
procedure TMenuItem.VerifyGroupIndex(Position:Integer; Value:Byte);
begin
{*
 004A2624    push        ebx
 004A2625    push        esi
 004A2626    push        edi
 004A2627    push        ebp
 004A2628    push        ecx
 004A2629    mov         ebx,ecx
 004A262B    mov         dword ptr [esp],edx
 004A262E    mov         edi,eax
 004A2630    mov         eax,edi
 004A2632    call        TMenuItem.GetCount
 004A2637    mov         esi,eax
 004A2639    dec         esi
 004A263A    test        esi,esi
>004A263C    jl          004A267E
 004A263E    inc         esi
 004A263F    xor         ebp,ebp
 004A2641    cmp         ebp,dword ptr [esp]
>004A2644    jge         004A2660
 004A2646    mov         edx,ebp
 004A2648    mov         eax,edi
 004A264A    call        TMenuItem.GetItem
 004A264F    cmp         bl,byte ptr [eax+3F]
>004A2652    jae         004A267A
 004A2654    mov         eax,[0078CE44];^SResString217:TResStringRec
 004A2659    call        Error
>004A265E    jmp         004A267A
 004A2660    mov         edx,ebp
 004A2662    mov         eax,edi
 004A2664    call        TMenuItem.GetItem
 004A2669    cmp         bl,byte ptr [eax+3F]
>004A266C    jbe         004A267A
 004A266E    mov         edx,ebp
 004A2670    mov         eax,edi
 004A2672    call        TMenuItem.GetItem
 004A2677    mov         byte ptr [eax+3F],bl
 004A267A    inc         ebp
 004A267B    dec         esi
>004A267C    jne         004A2641
 004A267E    pop         edx
 004A267F    pop         ebp
 004A2680    pop         edi
 004A2681    pop         esi
 004A2682    pop         ebx
 004A2683    ret
*}
end;

//004A2684
function TMenuItem.GetHandle:HMENU;
begin
{*
 004A2684    push        ebx
 004A2685    mov         ebx,eax
 004A2687    cmp         dword ptr [ebx+0AC],0
>004A268E    jne         004A26D4
 004A2690    mov         eax,dword ptr [ebx+4]
 004A2693    mov         edx,dword ptr ds:[4A0E2C];TPopupMenu
 004A2699    call        @IsClass
 004A269E    test        al,al
>004A26A0    je          004A26AF
 004A26A2    call        user32.CreatePopupMenu
 004A26A7    mov         dword ptr [ebx+0AC],eax
>004A26AD    jmp         004A26BA
 004A26AF    call        user32.CreateMenu
 004A26B4    mov         dword ptr [ebx+0AC],eax
 004A26BA    cmp         dword ptr [ebx+0AC],0
>004A26C1    jne         004A26CD
 004A26C3    mov         eax,[0078CD74];^SResString190:TResStringRec
 004A26C8    call        Error
 004A26CD    mov         eax,ebx
 004A26CF    call        TMenuItem.PopulateMenu
 004A26D4    mov         eax,dword ptr [ebx+0AC]
 004A26DA    pop         ebx
 004A26DB    ret
*}
end;

//004A26DC
procedure TMenuItem.DefineProperties(Filer:TFiler);
begin
{*
 004A26DC    push        ebx
 004A26DD    push        esi
 004A26DE    mov         esi,edx
 004A26E0    mov         ebx,eax
 004A26E2    mov         edx,esi
 004A26E4    mov         eax,ebx
 004A26E6    call        TComponent.DefineProperties
 004A26EB    push        ebx
 004A26EC    push        4A2480;TMenuItem.ReadShortCutText
 004A26F1    push        0
 004A26F3    push        0
 004A26F5    xor         ecx,ecx
 004A26F7    mov         edx,4A2714;'ShortCutText'
 004A26FC    mov         eax,esi
 004A26FE    mov         ebx,dword ptr [eax]
 004A2700    call        dword ptr [ebx+4]
 004A2703    pop         esi
 004A2704    pop         ebx
 004A2705    ret
*}
end;

//004A2730
procedure TMenuItem.DoDrawText(ACanvas:TCanvas; const ACaption:UnicodeString; var Rect:TRect; Selected:Boolean; Flags:LongInt);
begin
{*
 004A2730    push        ebp
 004A2731    mov         ebp,esp
 004A2733    add         esp,0FFFFFFE0
 004A2736    push        ebx
 004A2737    push        esi
 004A2738    push        edi
 004A2739    xor         ebx,ebx
 004A273B    mov         dword ptr [ebp-4],ebx
 004A273E    mov         dword ptr [ebp-0C],ecx
 004A2741    mov         dword ptr [ebp-8],edx
 004A2744    mov         esi,eax
 004A2746    mov         ebx,dword ptr [ebp+8]
 004A2749    xor         eax,eax
 004A274B    push        ebp
 004A274C    push        4A292D
 004A2751    push        dword ptr fs:[eax]
 004A2754    mov         dword ptr fs:[eax],esp
 004A2757    mov         eax,esi
 004A2759    call        TMenuItem.GetParentMenu
 004A275E    mov         edi,eax
 004A2760    test        edi,edi
>004A2762    je          004A2792
 004A2764    mov         eax,edi
 004A2766    call        TMenu.IsRightToLeft
 004A276B    test        al,al
>004A276D    je          004A2792
 004A276F    test        bl,0
>004A2772    jne         004A277C
 004A2774    and         ebx,0FFFFFFFF
 004A2777    or          ebx,2
>004A277A    jmp         004A278C
 004A277C    mov         eax,ebx
 004A277E    and         eax,2
 004A2781    cmp         eax,2
>004A2784    jne         004A278C
 004A2786    and         ebx,0FFFFFFFD
 004A2789    or          ebx,0
 004A278C    or          ebx,20000
 004A2792    lea         eax,[ebp-4]
 004A2795    mov         edx,dword ptr [ebp-0C]
 004A2798    call        @UStrLAsg
 004A279D    test        bh,4
>004A27A0    je          004A27C8
 004A27A2    cmp         dword ptr [ebp-4],0
>004A27A6    je          004A27BB
 004A27A8    mov         eax,dword ptr [ebp-4]
 004A27AB    cmp         word ptr [eax],26
>004A27AF    jne         004A27C8
 004A27B1    mov         eax,dword ptr [ebp-4]
 004A27B4    cmp         word ptr [eax+2],0
>004A27B9    jne         004A27C8
 004A27BB    lea         eax,[ebp-4]
 004A27BE    mov         edx,4A294C;' '
 004A27C3    call        @UStrCat
 004A27C8    mov         eax,dword ptr [ebp-4]
 004A27CB    mov         edx,4A295C;'-'
 004A27D0    call        @UStrEqual
>004A27D5    jne         004A280B
 004A27D7    test        bh,4
>004A27DA    jne         004A2917
 004A27E0    mov         eax,dword ptr [ebp+10]
 004A27E3    mov         esi,eax
 004A27E5    lea         edi,[ebp-20]
 004A27E8    movs        dword ptr [edi],dword ptr [esi]
 004A27E9    movs        dword ptr [edi],dword ptr [esi]
 004A27EA    movs        dword ptr [edi],dword ptr [esi]
 004A27EB    movs        dword ptr [edi],dword ptr [esi]
 004A27EC    add         dword ptr [ebp-1C],4
 004A27F0    push        2
 004A27F2    push        6
 004A27F4    lea         eax,[ebp-20]
 004A27F7    push        eax
 004A27F8    mov         eax,dword ptr [ebp-8]
 004A27FB    call        TCanvas.GetHandle
 004A2800    push        eax
 004A2801    call        user32.DrawEdge
>004A2806    jmp         004A2917
 004A280B    mov         eax,dword ptr [ebp-8]
 004A280E    mov         eax,dword ptr [eax+48]
 004A2811    mov         dl,1
 004A2813    call        TBrush.SetStyle
 004A2818    cmp         byte ptr [esi+3A],0
>004A281C    je          004A283F
 004A281E    mov         eax,dword ptr [ebp-8]
 004A2821    mov         edi,dword ptr [eax+40]
 004A2824    mov         eax,dword ptr [edi+10]
 004A2827    movzx       eax,byte ptr [eax+21]
 004A282B    mov         byte ptr [ebp-0D],al
 004A282E    movzx       edx,byte ptr ds:[4A2960]
 004A2835    or          dl,byte ptr [ebp-0D]
 004A2838    mov         eax,edi
 004A283A    call        TFont.SetStyle
 004A283F    cmp         byte ptr [esi+39],0
>004A2843    jne         004A28EC
 004A2849    cmp         byte ptr [ebp+0C],0
>004A284D    jne         004A28AA
 004A284F    mov         eax,dword ptr [ebp+10]
 004A2852    mov         ecx,1
 004A2857    mov         edx,1
 004A285C    call        OffsetRect
 004A2861    mov         eax,dword ptr [ebp-8]
 004A2864    mov         eax,dword ptr [eax+40]
 004A2867    mov         edx,0FF000014
 004A286C    call        TFont.SetColor
 004A2871    mov         eax,dword ptr [ebp-8]
 004A2874    call        TCanvas.GetHandle
 004A2879    mov         edi,eax
 004A287B    mov         esi,dword ptr [ebp-4]
 004A287E    test        esi,esi
>004A2880    je          004A2887
 004A2882    sub         esi,4
 004A2885    mov         esi,dword ptr [esi]
 004A2887    push        ebx
 004A2888    mov         eax,dword ptr [ebp+10]
 004A288B    push        eax
 004A288C    push        esi
 004A288D    mov         eax,dword ptr [ebp-4]
 004A2890    call        @UStrToPWChar
 004A2895    push        eax
 004A2896    push        edi
 004A2897    call        user32.DrawTextW
 004A289C    mov         eax,dword ptr [ebp+10]
 004A289F    or          ecx,0FFFFFFFF
 004A28A2    or          edx,0FFFFFFFF
 004A28A5    call        OffsetRect
 004A28AA    cmp         byte ptr [ebp+0C],0
>004A28AE    je          004A28DC
 004A28B0    mov         eax,0FF00000D
 004A28B5    call        ColorToRGB
 004A28BA    mov         esi,eax
 004A28BC    mov         eax,0FF000010
 004A28C1    call        ColorToRGB
 004A28C6    cmp         esi,eax
>004A28C8    jne         004A28DC
 004A28CA    mov         eax,dword ptr [ebp-8]
 004A28CD    mov         eax,dword ptr [eax+40]
 004A28D0    mov         edx,0FF000014
 004A28D5    call        TFont.SetColor
>004A28DA    jmp         004A28EC
 004A28DC    mov         eax,dword ptr [ebp-8]
 004A28DF    mov         eax,dword ptr [eax+40]
 004A28E2    mov         edx,0FF000010
 004A28E7    call        TFont.SetColor
 004A28EC    mov         eax,dword ptr [ebp-8]
 004A28EF    call        TCanvas.GetHandle
 004A28F4    mov         edi,eax
 004A28F6    mov         esi,dword ptr [ebp-4]
 004A28F9    test        esi,esi
>004A28FB    je          004A2902
 004A28FD    sub         esi,4
 004A2900    mov         esi,dword ptr [esi]
 004A2902    push        ebx
 004A2903    mov         eax,dword ptr [ebp+10]
 004A2906    push        eax
 004A2907    push        esi
 004A2908    mov         eax,dword ptr [ebp-4]
 004A290B    call        @UStrToPWChar
 004A2910    push        eax
 004A2911    push        edi
 004A2912    call        user32.DrawTextW
 004A2917    xor         eax,eax
 004A2919    pop         edx
 004A291A    pop         ecx
 004A291B    pop         ecx
 004A291C    mov         dword ptr fs:[eax],edx
 004A291F    push        4A2934
 004A2924    lea         eax,[ebp-4]
 004A2927    call        @UStrClr
 004A292C    ret
>004A292D    jmp         @HandleFinally
>004A2932    jmp         004A2924
 004A2934    pop         edi
 004A2935    pop         esi
 004A2936    pop         ebx
 004A2937    mov         esp,ebp
 004A2939    pop         ebp
 004A293A    ret         0C
*}
end;

//004A2964
procedure TMenuItem.DrawItem(ACanvas:TCanvas; ARect:TRect; Selected:Boolean);
begin
{*
 004A2964    push        ebp
 004A2965    mov         ebp,esp
 004A2967    add         esp,0FFFFFFF0
 004A296A    push        ebx
 004A296B    push        esi
 004A296C    push        edi
 004A296D    mov         esi,ecx
 004A296F    lea         edi,[ebp-10]
 004A2972    movs        dword ptr [edi],dword ptr [esi]
 004A2973    movs        dword ptr [edi],dword ptr [esi]
 004A2974    movs        dword ptr [edi],dword ptr [esi]
 004A2975    movs        dword ptr [edi],dword ptr [esi]
 004A2976    cmp         word ptr [eax+92],0
>004A297E    je          004A299B
 004A2980    lea         ecx,[ebp-10]
 004A2983    push        ecx
 004A2984    movzx       ecx,byte ptr [ebp+8]
 004A2988    push        ecx
 004A2989    mov         ebx,eax
 004A298B    mov         ecx,edx
 004A298D    mov         edx,eax
 004A298F    mov         eax,dword ptr [ebx+94]
 004A2995    call        dword ptr [ebx+90]
 004A299B    pop         edi
 004A299C    pop         esi
 004A299D    pop         ebx
 004A299E    mov         esp,ebp
 004A29A0    pop         ebp
 004A29A1    ret         4
*}
end;

//004A29A4
procedure DoDrawVistaText(MenuItem:TMenuItem; ACanvas:TCanvas; const ACaption:UnicodeString; var Rect:TRect; Selected:Boolean; Flags:LongInt);
begin
{*
 004A29A4    push        ebp
 004A29A5    mov         ebp,esp
 004A29A7    add         esp,0FFFFFFA8
 004A29AA    push        ebx
 004A29AB    push        esi
 004A29AC    push        edi
 004A29AD    xor         ebx,ebx
 004A29AF    mov         dword ptr [ebp-4],ebx
 004A29B2    mov         dword ptr [ebp-0C],ecx
 004A29B5    mov         esi,edx
 004A29B7    mov         dword ptr [ebp-8],eax
 004A29BA    mov         ebx,dword ptr [ebp+8]
 004A29BD    xor         eax,eax
 004A29BF    push        ebp
 004A29C0    push        4A2B1D
 004A29C5    push        dword ptr fs:[eax]
 004A29C8    mov         dword ptr fs:[eax],esp
 004A29CB    lea         eax,[ebp-58]
 004A29CE    xor         ecx,ecx
 004A29D0    mov         edx,40
 004A29D5    call        @FillChar
 004A29DA    mov         dword ptr [ebp-58],40
 004A29E1    mov         dword ptr [ebp-54],2001
 004A29E8    mov         eax,ebx
 004A29EA    and         eax,400
 004A29EF    cmp         eax,400
>004A29F4    jne         004A29FD
 004A29F6    or          dword ptr [ebp-54],200
 004A29FD    mov         eax,dword ptr [esi+40]
 004A2A00    mov         eax,dword ptr [eax+18]
 004A2A03    call        ColorToRGB
 004A2A08    mov         dword ptr [ebp-50],eax
 004A2A0B    mov         eax,dword ptr [ebp-8]
 004A2A0E    call        TMenuItem.GetParentMenu
 004A2A13    mov         edi,eax
 004A2A15    test        edi,edi
>004A2A17    je          004A2A47
 004A2A19    mov         eax,edi
 004A2A1B    call        TMenu.IsRightToLeft
 004A2A20    test        al,al
>004A2A22    je          004A2A47
 004A2A24    test        bl,0
>004A2A27    jne         004A2A31
 004A2A29    and         ebx,0FFFFFFFF
 004A2A2C    or          ebx,2
>004A2A2F    jmp         004A2A41
 004A2A31    mov         eax,ebx
 004A2A33    and         eax,2
 004A2A36    cmp         eax,2
>004A2A39    jne         004A2A41
 004A2A3B    and         ebx,0FFFFFFFD
 004A2A3E    or          ebx,0
 004A2A41    or          ebx,20000
 004A2A47    lea         eax,[ebp-4]
 004A2A4A    mov         edx,dword ptr [ebp-0C]
 004A2A4D    call        @UStrLAsg
 004A2A52    test        bh,4
>004A2A55    je          004A2A7D
 004A2A57    cmp         dword ptr [ebp-4],0
>004A2A5B    je          004A2A70
 004A2A5D    mov         eax,dword ptr [ebp-4]
 004A2A60    cmp         word ptr [eax],26
>004A2A64    jne         004A2A7D
 004A2A66    mov         eax,dword ptr [ebp-4]
 004A2A69    cmp         word ptr [eax+2],0
>004A2A6E    jne         004A2A7D
 004A2A70    lea         eax,[ebp-4]
 004A2A73    mov         edx,4A2B3C;' '
 004A2A78    call        @UStrCat
 004A2A7D    mov         dl,1
 004A2A7F    mov         eax,dword ptr [esi+48]
 004A2A82    call        TBrush.SetStyle
 004A2A87    mov         eax,dword ptr [ebp-8]
 004A2A8A    cmp         byte ptr [eax+3A],0
>004A2A8E    je          004A2AAF
 004A2A90    mov         eax,dword ptr [esi+40]
 004A2A93    mov         eax,dword ptr [eax+10]
 004A2A96    movzx       eax,byte ptr [eax+21]
 004A2A9A    mov         byte ptr [ebp-0D],al
 004A2A9D    movzx       edx,byte ptr ds:[4A2B40]
 004A2AA4    or          dl,byte ptr [ebp-0D]
 004A2AA7    mov         eax,dword ptr [esi+40]
 004A2AAA    call        TFont.SetStyle
 004A2AAF    call        ThemeServices
 004A2AB4    mov         dl,7
 004A2AB6    call        TThemeServices.GetTheme
 004A2ABB    mov         dword ptr [ebp-14],eax
 004A2ABE    mov         eax,esi
 004A2AC0    call        TCanvas.GetHandle
 004A2AC5    mov         edi,eax
 004A2AC7    mov         esi,dword ptr [ebp-4]
 004A2ACA    test        esi,esi
>004A2ACC    je          004A2AD3
 004A2ACE    sub         esi,4
 004A2AD1    mov         esi,dword ptr [esi]
 004A2AD3    mov         eax,dword ptr [ebp-8]
 004A2AD6    movzx       eax,byte ptr [eax+39]
 004A2ADA    mov         eax,dword ptr [eax*4+785CC8];MENUSTATES
 004A2AE1    mov         dword ptr [ebp-18],eax
 004A2AE4    lea         eax,[ebp-58]
 004A2AE7    push        eax
 004A2AE8    mov         eax,dword ptr [ebp+10]
 004A2AEB    push        eax
 004A2AEC    push        ebx
 004A2AED    push        esi
 004A2AEE    mov         eax,dword ptr [ebp-4]
 004A2AF1    call        @UStrToPWChar
 004A2AF6    push        eax
 004A2AF7    mov         eax,dword ptr [ebp-18]
 004A2AFA    push        eax
 004A2AFB    push        0E
 004A2AFD    push        edi
 004A2AFE    mov         eax,dword ptr [ebp-14]
 004A2B01    push        eax
 004A2B02    call        DrawThemeTextEx
 004A2B07    xor         eax,eax
 004A2B09    pop         edx
 004A2B0A    pop         ecx
 004A2B0B    pop         ecx
 004A2B0C    mov         dword ptr fs:[eax],edx
 004A2B0F    push        4A2B24
 004A2B14    lea         eax,[ebp-4]
 004A2B17    call        @UStrClr
 004A2B1C    ret
>004A2B1D    jmp         @HandleFinally
>004A2B22    jmp         004A2B14
 004A2B24    pop         edi
 004A2B25    pop         esi
 004A2B26    pop         ebx
 004A2B27    mov         esp,ebp
 004A2B29    pop         ebp
 004A2B2A    ret         0C
*}
end;

//004A2B44
procedure VistaDraw(RightToLeft:Boolean);
begin
{*
 004A2B44    push        ebp
 004A2B45    mov         ebp,esp
 004A2B47    add         esp,0FFFFFF98
 004A2B4A    push        ebx
 004A2B4B    push        esi
 004A2B4C    push        edi
 004A2B4D    xor         edx,edx
 004A2B4F    mov         dword ptr [ebp-4],edx
 004A2B52    mov         ebx,eax
 004A2B54    mov         esi,dword ptr [ebp+8]
 004A2B57    add         esi,0FFFFFFDC
 004A2B5A    xor         eax,eax
 004A2B5C    push        ebp
 004A2B5D    push        4A35C3
 004A2B62    push        dword ptr fs:[eax]
 004A2B65    mov         dword ptr fs:[eax],esp
 004A2B68    mov         eax,dword ptr [ebp+8]
 004A2B6B    cmp         byte ptr [eax+8],0
>004A2B6F    je          004A2C48
 004A2B75    mov         eax,dword ptr [ebp+8]
 004A2B78    test        byte ptr [eax+0C],1
>004A2B7C    jne         004A2B8B
 004A2B7E    mov         eax,dword ptr [ebp+8]
 004A2B81    test        byte ptr [eax+0C],40
>004A2B85    je          004A2C22
 004A2B8B    lea         eax,[ebp-8]
 004A2B8E    push        eax
 004A2B8F    push        0EDB
 004A2B94    mov         eax,dword ptr [esi]
 004A2B96    movzx       eax,byte ptr [eax+39]
 004A2B9A    mov         eax,dword ptr [eax*4+785CF8]
 004A2BA1    push        eax
 004A2BA2    push        8
 004A2BA4    call        ThemeServices
 004A2BA9    mov         dl,7
 004A2BAB    call        TThemeServices.GetTheme
 004A2BB0    push        eax
 004A2BB1    mov         eax,[0078D79C];GetThemeColor:function(val hTheme:Windows.THandle;val iPartId:System.Inte...
 004A2BB6    mov         eax,dword ptr [eax]
 004A2BB8    call        eax
 004A2BBA    mov         eax,dword ptr [ebp+8]
 004A2BBD    mov         eax,dword ptr [eax-28]
 004A2BC0    mov         eax,dword ptr [eax+40]
 004A2BC3    mov         edx,dword ptr [ebp-8]
 004A2BC6    call        TFont.SetColor
 004A2BCB    push        0
 004A2BCD    mov         eax,dword ptr [ebp+8]
 004A2BD0    add         eax,0FFFFFFF0
 004A2BD3    push        eax
 004A2BD4    mov         eax,dword ptr [ebp+8]
 004A2BD7    test        byte ptr [eax+0C],1
 004A2BDB    setne       al
 004A2BDE    and         eax,7F
 004A2BE1    mov         edx,dword ptr [ebp+8]
 004A2BE4    test        byte ptr [edx+0C],40
 004A2BE8    setne       dl
 004A2BEB    and         edx,7F
 004A2BEE    lea         edx,[edx*8+785CE0];MENUSTATES
 004A2BF5    mov         eax,dword ptr [edx+eax*4]
 004A2BF8    push        eax
 004A2BF9    push        8
 004A2BFB    mov         eax,dword ptr [ebp+8]
 004A2BFE    mov         eax,dword ptr [eax-28]
 004A2C01    call        TCanvas.GetHandle
 004A2C06    push        eax
 004A2C07    call        ThemeServices
 004A2C0C    mov         dl,7
 004A2C0E    call        TThemeServices.GetTheme
 004A2C13    push        eax
 004A2C14    mov         eax,[0078D2E8];DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 004A2C19    mov         eax,dword ptr [eax]
 004A2C1B    call        eax
>004A2C1D    jmp         004A2CB7
 004A2C22    mov         eax,dword ptr [ebp+8]
 004A2C25    mov         eax,dword ptr [eax-28]
 004A2C28    mov         eax,dword ptr [eax+48]
 004A2C2B    mov         edx,0FF00001E
 004A2C30    call        TBrush.SetColor
 004A2C35    mov         eax,dword ptr [ebp+8]
 004A2C38    lea         edx,[eax-10]
 004A2C3B    mov         eax,dword ptr [ebp+8]
 004A2C3E    mov         eax,dword ptr [eax-28]
 004A2C41    mov         ecx,dword ptr [eax]
 004A2C43    call        dword ptr [ecx+54]
>004A2C46    jmp         004A2CB7
 004A2C48    push        0
 004A2C4A    mov         eax,dword ptr [ebp+8]
 004A2C4D    add         eax,0FFFFFFF0
 004A2C50    push        eax
 004A2C51    push        0
 004A2C53    push        9
 004A2C55    mov         eax,dword ptr [ebp+8]
 004A2C58    mov         eax,dword ptr [eax-28]
 004A2C5B    call        TCanvas.GetHandle
 004A2C60    push        eax
 004A2C61    call        ThemeServices
 004A2C66    mov         dl,7
 004A2C68    call        TThemeServices.GetTheme
 004A2C6D    push        eax
 004A2C6E    mov         eax,[0078D2E8];DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 004A2C73    mov         eax,dword ptr [eax]
 004A2C75    call        eax
 004A2C77    lea         eax,[ebp-8]
 004A2C7A    push        eax
 004A2C7B    push        0EDB
 004A2C80    mov         eax,dword ptr [esi]
 004A2C82    movzx       eax,byte ptr [eax+39]
 004A2C86    mov         eax,dword ptr [eax*4+785CF0];ITEMSTATES
 004A2C8D    push        eax
 004A2C8E    push        0E
 004A2C90    call        ThemeServices
 004A2C95    mov         dl,7
 004A2C97    call        TThemeServices.GetTheme
 004A2C9C    push        eax
 004A2C9D    mov         eax,[0078D79C];GetThemeColor:function(val hTheme:Windows.THandle;val iPartId:System.Inte...
 004A2CA2    mov         eax,dword ptr [eax]
 004A2CA4    call        eax
 004A2CA6    mov         eax,dword ptr [ebp+8]
 004A2CA9    mov         eax,dword ptr [eax-28]
 004A2CAC    mov         eax,dword ptr [eax+40]
 004A2CAF    mov         edx,dword ptr [ebp-8]
 004A2CB2    call        TFont.SetColor
 004A2CB7    lea         eax,[ebp-18]
 004A2CBA    push        eax
 004A2CBB    push        1
 004A2CBD    push        0
 004A2CBF    mov         eax,dword ptr [esi]
 004A2CC1    movzx       eax,byte ptr [eax+3D]
 004A2CC5    mov         edx,dword ptr [esi]
 004A2CC7    movzx       edx,byte ptr [edx+39]
 004A2CCB    lea         edx,[edx*8+785D08]
 004A2CD2    mov         eax,dword ptr [edx+eax*4]
 004A2CD5    push        eax
 004A2CD6    push        0B
 004A2CD8    mov         eax,dword ptr [ebp+8]
 004A2CDB    mov         eax,dword ptr [eax-28]
 004A2CDE    call        TCanvas.GetHandle
 004A2CE3    push        eax
 004A2CE4    call        ThemeServices
 004A2CE9    mov         dl,7
 004A2CEB    call        TThemeServices.GetTheme
 004A2CF0    push        eax
 004A2CF1    mov         eax,[0078D2E4];GetThemePartSize:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A2CF6    mov         eax,dword ptr [eax]
 004A2CF8    call        eax
 004A2CFA    lea         eax,[ebp-38]
 004A2CFD    push        eax
 004A2CFE    push        0
 004A2D00    push        0E12
 004A2D05    mov         eax,dword ptr [esi]
 004A2D07    movzx       eax,byte ptr [eax+3D]
 004A2D0B    mov         edx,dword ptr [esi]
 004A2D0D    movzx       edx,byte ptr [edx+39]
 004A2D11    lea         edx,[edx*8+785D08]
 004A2D18    mov         eax,dword ptr [edx+eax*4]
 004A2D1B    push        eax
 004A2D1C    push        0B
 004A2D1E    mov         eax,dword ptr [ebp+8]
 004A2D21    mov         eax,dword ptr [eax-28]
 004A2D24    call        TCanvas.GetHandle
 004A2D29    push        eax
 004A2D2A    call        ThemeServices
 004A2D2F    mov         dl,7
 004A2D31    call        TThemeServices.GetTheme
 004A2D36    push        eax
 004A2D37    mov         eax,[0078D498];^GetThemeMargins:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A2D3C    mov         eax,dword ptr [eax]
 004A2D3E    call        eax
 004A2D40    mov         eax,ebx
 004A2D42    xor         al,1
 004A2D44    test        al,al
>004A2D46    je          004A2D7F
 004A2D48    mov         eax,dword ptr [ebp+8]
 004A2D4B    mov         eax,dword ptr [eax-0C]
 004A2D4E    add         eax,dword ptr [ebp-14]
 004A2D51    add         eax,dword ptr [ebp-2C]
 004A2D54    add         eax,dword ptr [ebp-2C]
 004A2D57    push        eax
 004A2D58    lea         eax,[ebp-58]
 004A2D5B    push        eax
 004A2D5C    mov         eax,dword ptr [ebp+8]
 004A2D5F    mov         edi,dword ptr [eax-10]
 004A2D62    mov         ecx,edi
 004A2D64    add         ecx,dword ptr [ebp-18]
 004A2D67    add         ecx,dword ptr [ebp-34]
 004A2D6A    add         ecx,dword ptr [ebp-34]
 004A2D6D    mov         eax,dword ptr [ebp+8]
 004A2D70    mov         edx,dword ptr [eax-0C]
 004A2D73    mov         eax,dword ptr [ebp+8]
 004A2D76    mov         eax,edi
 004A2D78    call        Rect
>004A2D7D    jmp         004A2DB4
 004A2D7F    mov         eax,dword ptr [ebp+8]
 004A2D82    mov         eax,dword ptr [eax-0C]
 004A2D85    add         eax,dword ptr [ebp-14]
 004A2D88    add         eax,dword ptr [ebp-2C]
 004A2D8B    add         eax,dword ptr [ebp-2C]
 004A2D8E    push        eax
 004A2D8F    lea         eax,[ebp-58]
 004A2D92    push        eax
 004A2D93    mov         eax,dword ptr [ebp+8]
 004A2D96    mov         ecx,dword ptr [eax-8]
 004A2D99    mov         eax,dword ptr [ebp+8]
 004A2D9C    mov         edx,dword ptr [eax-0C]
 004A2D9F    mov         eax,dword ptr [ebp+8]
 004A2DA2    mov         eax,dword ptr [eax-8]
 004A2DA5    sub         eax,dword ptr [ebp-18]
 004A2DA8    mov         edi,dword ptr [ebp-34]
 004A2DAB    sub         eax,edi
 004A2DAD    sub         eax,edi
 004A2DAF    call        Rect
 004A2DB4    mov         eax,dword ptr [ebp+8]
 004A2DB7    push        esi
 004A2DB8    lea         edi,[eax-20]
 004A2DBB    lea         esi,[ebp-58]
 004A2DBE    movs        dword ptr [edi],dword ptr [esi]
 004A2DBF    movs        dword ptr [edi],dword ptr [esi]
 004A2DC0    movs        dword ptr [edi],dword ptr [esi]
 004A2DC1    movs        dword ptr [edi],dword ptr [esi]
 004A2DC2    pop         esi
 004A2DC3    mov         eax,dword ptr [ebp+8]
 004A2DC6    cmp         dword ptr [eax-2C],0
>004A2DCA    je          004A2E40
 004A2DCC    mov         eax,dword ptr [ebp+8]
 004A2DCF    mov         eax,dword ptr [eax-2C]
 004A2DD2    mov         eax,dword ptr [eax+34]
 004A2DD5    mov         edx,dword ptr [ebp-14]
 004A2DD8    cmp         eax,edx
>004A2DDA    jle         004A2DE7
 004A2DDC    mov         ecx,dword ptr [ebp+8]
 004A2DDF    sub         eax,edx
 004A2DE1    mov         edx,dword ptr [ebp+8]
 004A2DE4    add         dword ptr [edx-14],eax
 004A2DE7    mov         eax,dword ptr [ebp+8]
 004A2DEA    mov         eax,dword ptr [eax-2C]
 004A2DED    mov         eax,dword ptr [eax+38]
 004A2DF0    mov         edx,dword ptr [ebp-18]
 004A2DF3    cmp         eax,edx
>004A2DF5    jle         004A2E18
 004A2DF7    mov         ecx,ebx
 004A2DF9    xor         cl,1
 004A2DFC    test        cl,cl
>004A2DFE    je          004A2E0D
 004A2E00    mov         ecx,dword ptr [ebp+8]
 004A2E03    sub         eax,edx
 004A2E05    mov         edx,dword ptr [ebp+8]
 004A2E08    add         dword ptr [edx-18],eax
>004A2E0B    jmp         004A2E18
 004A2E0D    mov         ecx,dword ptr [ebp+8]
 004A2E10    sub         eax,edx
 004A2E12    mov         edx,dword ptr [ebp+8]
 004A2E15    sub         dword ptr [edx-20],eax
 004A2E18    mov         eax,dword ptr [ebp+8]
 004A2E1B    mov         ecx,dword ptr [eax-14]
 004A2E1E    sub         ecx,dword ptr [ebp-4C]
 004A2E21    sar         ecx,1
>004A2E23    jns         004A2E28
 004A2E25    adc         ecx,0
 004A2E28    mov         eax,dword ptr [ebp+8]
 004A2E2B    mov         edx,dword ptr [eax-18]
 004A2E2E    sub         edx,dword ptr [ebp-50]
 004A2E31    sar         edx,1
>004A2E33    jns         004A2E38
 004A2E35    adc         edx,0
 004A2E38    lea         eax,[ebp-58]
 004A2E3B    call        OffsetRect
 004A2E40    mov         eax,dword ptr [ebp+8]
 004A2E43    push        esi
 004A2E44    lea         esi,[eax-20]
 004A2E47    lea         edi,[ebp-48]
 004A2E4A    movs        dword ptr [edi],dword ptr [esi]
 004A2E4B    movs        dword ptr [edi],dword ptr [esi]
 004A2E4C    movs        dword ptr [edi],dword ptr [esi]
 004A2E4D    movs        dword ptr [edi],dword ptr [esi]
 004A2E4E    pop         esi
 004A2E4F    test        bl,bl
>004A2E51    je          004A2E5C
 004A2E53    mov         eax,dword ptr [ebp+8]
 004A2E56    mov         eax,dword ptr [eax-20]
 004A2E59    mov         dword ptr [ebp-40],eax
 004A2E5C    lea         eax,[ebp-10]
 004A2E5F    push        eax
 004A2E60    push        1
 004A2E62    push        0
 004A2E64    push        0
 004A2E66    push        0D
 004A2E68    mov         eax,dword ptr [ebp+8]
 004A2E6B    mov         eax,dword ptr [eax-28]
 004A2E6E    call        TCanvas.GetHandle
 004A2E73    push        eax
 004A2E74    call        ThemeServices
 004A2E79    mov         dl,7
 004A2E7B    call        TThemeServices.GetTheme
 004A2E80    push        eax
 004A2E81    mov         eax,[0078D2E4];GetThemePartSize:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A2E86    mov         eax,dword ptr [eax]
 004A2E88    call        eax
 004A2E8A    lea         eax,[ebp-28]
 004A2E8D    push        eax
 004A2E8E    push        0
 004A2E90    push        0E11
 004A2E95    push        0
 004A2E97    push        0D
 004A2E99    mov         eax,dword ptr [ebp+8]
 004A2E9C    mov         eax,dword ptr [eax-28]
 004A2E9F    call        TCanvas.GetHandle
 004A2EA4    push        eax
 004A2EA5    call        ThemeServices
 004A2EAA    mov         dl,7
 004A2EAC    call        TThemeServices.GetTheme
 004A2EB1    push        eax
 004A2EB2    mov         eax,[0078D498];^GetThemeMargins:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A2EB7    mov         eax,dword ptr [eax]
 004A2EB9    call        eax
 004A2EBB    mov         eax,ebx
 004A2EBD    xor         al,1
 004A2EBF    test        al,al
>004A2EC1    je          004A2ED4
 004A2EC3    mov         eax,dword ptr [ebp-10]
 004A2EC6    add         eax,dword ptr [ebp-38]
 004A2EC9    add         dword ptr [ebp-40],eax
 004A2ECC    mov         eax,dword ptr [ebp-28]
 004A2ECF    add         dword ptr [ebp-40],eax
>004A2ED2    jmp         004A2EE3
 004A2ED4    mov         eax,dword ptr [ebp-10]
 004A2ED7    add         eax,dword ptr [ebp-34]
 004A2EDA    sub         dword ptr [ebp-48],eax
 004A2EDD    mov         eax,dword ptr [ebp-24]
 004A2EE0    sub         dword ptr [ebp-40],eax
 004A2EE3    mov         eax,dword ptr [ebp+8]
 004A2EE6    cmp         byte ptr [eax+8],0
>004A2EEA    jne         004A2F18
 004A2EEC    push        0
 004A2EEE    lea         eax,[ebp-48]
 004A2EF1    push        eax
 004A2EF2    push        0
 004A2EF4    push        0D
 004A2EF6    mov         eax,dword ptr [ebp+8]
 004A2EF9    mov         eax,dword ptr [eax-28]
 004A2EFC    call        TCanvas.GetHandle
 004A2F01    push        eax
 004A2F02    call        ThemeServices
 004A2F07    mov         dl,7
 004A2F09    call        TThemeServices.GetTheme
 004A2F0E    push        eax
 004A2F0F    mov         eax,[0078D2E8];DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 004A2F14    mov         eax,dword ptr [eax]
 004A2F16    call        eax
 004A2F18    mov         eax,dword ptr [ebp+8]
 004A2F1B    cmp         dword ptr [eax-30],0
>004A2F1F    je          004A2F2A
 004A2F21    mov         eax,dword ptr [ebp+8]
 004A2F24    mov         byte ptr [eax-31],0
>004A2F28    jmp         004A2F58
 004A2F2A    mov         eax,dword ptr [ebp+8]
 004A2F2D    mov         eax,dword ptr [eax-30]
 004A2F30    mov         edx,dword ptr ds:[4A0E2C];TPopupMenu
 004A2F36    call        @IsClass
 004A2F3B    test        al,al
>004A2F3D    je          004A2F51
 004A2F3F    mov         eax,dword ptr [ebp+8]
 004A2F42    mov         eax,dword ptr [eax-30]
 004A2F45    movzx       eax,byte ptr [eax+68]
 004A2F49    mov         edx,dword ptr [ebp+8]
 004A2F4C    mov         byte ptr [edx-31],al
>004A2F4F    jmp         004A2F58
 004A2F51    mov         eax,dword ptr [ebp+8]
 004A2F54    mov         byte ptr [eax-31],0
 004A2F58    mov         eax,dword ptr [ebp+8]
 004A2F5B    cmp         byte ptr [eax-32],0
>004A2F5F    je          004A2FD2
 004A2F61    mov         eax,dword ptr [ebp+8]
 004A2F64    cmp         byte ptr [eax+8],0
>004A2F68    jne         004A2FD2
 004A2F6A    mov         eax,dword ptr [esi]
 004A2F6C    cmp         byte ptr [eax+39],0
>004A2F70    je          004A2FA3
 004A2F72    push        0
 004A2F74    mov         eax,dword ptr [ebp+8]
 004A2F77    add         eax,0FFFFFFF0
 004A2F7A    push        eax
 004A2F7B    push        2
 004A2F7D    push        0E
 004A2F7F    mov         eax,dword ptr [ebp+8]
 004A2F82    mov         eax,dword ptr [eax-28]
 004A2F85    call        TCanvas.GetHandle
 004A2F8A    push        eax
 004A2F8B    call        ThemeServices
 004A2F90    mov         dl,7
 004A2F92    call        TThemeServices.GetTheme
 004A2F97    push        eax
 004A2F98    mov         eax,[0078D2E8];DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 004A2F9D    mov         eax,dword ptr [eax]
 004A2F9F    call        eax
>004A2FA1    jmp         004A2FD2
 004A2FA3    push        0
 004A2FA5    mov         eax,dword ptr [ebp+8]
 004A2FA8    add         eax,0FFFFFFF0
 004A2FAB    push        eax
 004A2FAC    push        4
 004A2FAE    push        0E
 004A2FB0    mov         eax,dword ptr [ebp+8]
 004A2FB3    mov         eax,dword ptr [eax-28]
 004A2FB6    call        TCanvas.GetHandle
 004A2FBB    push        eax
 004A2FBC    call        ThemeServices
 004A2FC1    mov         dl,7
 004A2FC3    call        TThemeServices.GetTheme
 004A2FC8    push        eax
 004A2FC9    mov         eax,[0078D2E8];DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 004A2FCE    mov         eax,dword ptr [eax]
 004A2FD0    call        eax
 004A2FD2    mov         eax,dword ptr [esi]
 004A2FD4    mov         eax,dword ptr [eax+34]
 004A2FD7    mov         edx,4A35E0;'-'
 004A2FDC    call        @UStrEqual
>004A2FE1    je          004A3257
 004A2FE7    mov         eax,dword ptr [ebp+8]
 004A2FEA    cmp         dword ptr [eax-2C],0
>004A2FEE    je          004A3027
 004A2FF0    mov         eax,dword ptr [esi]
 004A2FF2    mov         edi,dword ptr [eax+40]
 004A2FF5    cmp         edi,0FFFFFFFF
>004A2FF8    jle         004A3009
 004A2FFA    mov         eax,dword ptr [ebp+8]
 004A2FFD    mov         eax,dword ptr [eax-2C]
 004A3000    call        TCustomImageList.GetCount
 004A3005    cmp         edi,eax
>004A3007    jl          004A302B
 004A3009    mov         eax,dword ptr [esi]
 004A300B    cmp         byte ptr [eax+38],0
>004A300F    je          004A3027
 004A3011    mov         eax,dword ptr [esi]
 004A3013    cmp         dword ptr [eax+4C],0
>004A3017    je          004A302B
 004A3019    mov         eax,dword ptr [esi]
 004A301B    mov         eax,dword ptr [eax+4C]
 004A301E    mov         edx,dword ptr [eax]
 004A3020    call        dword ptr [edx+20]
 004A3023    test        al,al
>004A3025    jne         004A302B
 004A3027    xor         eax,eax
>004A3029    jmp         004A302D
 004A302B    mov         al,1
 004A302D    mov         edx,dword ptr [ebp+8]
 004A3030    mov         byte ptr [edx-33],al
 004A3033    mov         eax,dword ptr [ebp+8]
 004A3036    cmp         byte ptr [eax-33],0
>004A303A    jne         004A3058
 004A303C    mov         eax,dword ptr [esi]
 004A303E    mov         edi,dword ptr [eax+4C]
 004A3041    test        edi,edi
>004A3043    je          004A3257
 004A3049    mov         eax,edi
 004A304B    mov         edx,dword ptr [eax]
 004A304D    call        dword ptr [edx+20]
 004A3050    test        al,al
>004A3052    jne         004A3257
 004A3058    mov         eax,dword ptr [ebp+8]
 004A305B    cmp         byte ptr [eax-33],0
>004A305F    je          004A3173
 004A3065    mov         eax,dword ptr [esi]
 004A3067    mov         edi,dword ptr [eax+40]
 004A306A    cmp         edi,0FFFFFFFF
>004A306D    jle         004A30E8
 004A306F    mov         eax,dword ptr [ebp+8]
 004A3072    mov         eax,dword ptr [eax-2C]
 004A3075    call        TCustomImageList.GetCount
 004A307A    cmp         edi,eax
>004A307C    jge         004A30E8
 004A307E    mov         ecx,dword ptr [ebp+8]
 004A3081    mov         ecx,dword ptr [ecx-14]
 004A3084    mov         edx,dword ptr [ebp+8]
 004A3087    mov         edx,dword ptr [edx-1C]
 004A308A    sub         ecx,edx
 004A308C    mov         edi,dword ptr [ebp+8]
 004A308F    mov         edi,dword ptr [edi-2C]
 004A3092    sub         ecx,dword ptr [edi+34]
 004A3095    sar         ecx,1
>004A3097    jns         004A309C
 004A3099    adc         ecx,0
 004A309C    mov         edi,dword ptr [ebp+8]
 004A309F    add         ecx,edx
 004A30A1    push        ecx
 004A30A2    mov         edx,dword ptr [esi]
 004A30A4    mov         edx,dword ptr [edx+40]
 004A30A7    push        edx
 004A30A8    mov         edx,dword ptr [esi]
 004A30AA    movzx       edx,byte ptr [edx+39]
 004A30AE    push        edx
 004A30AF    mov         edx,dword ptr [ebp+8]
 004A30B2    mov         ecx,dword ptr [edx-18]
 004A30B5    mov         eax,dword ptr [ebp+8]
 004A30B8    mov         eax,dword ptr [eax-20]
 004A30BB    sub         ecx,eax
 004A30BD    mov         edx,dword ptr [ebp+8]
 004A30C0    mov         edx,dword ptr [edx-2C]
 004A30C3    sub         ecx,dword ptr [edx+38]
 004A30C6    sar         ecx,1
>004A30C8    jns         004A30CD
 004A30CA    adc         ecx,0
 004A30CD    mov         edx,dword ptr [ebp+8]
 004A30D0    add         ecx,eax
 004A30D2    mov         eax,dword ptr [ebp+8]
 004A30D5    mov         eax,dword ptr [eax-2C]
 004A30D8    mov         edx,dword ptr [ebp+8]
 004A30DB    mov         edx,dword ptr [edx-28]
 004A30DE    call        TCustomImageList.Draw
>004A30E3    jmp         004A3257
 004A30E8    mov         eax,dword ptr [ebp+8]
 004A30EB    cmp         byte ptr [eax+8],0
>004A30EF    jne         004A3257
 004A30F5    push        0
 004A30F7    lea         eax,[ebp-58]
 004A30FA    push        eax
 004A30FB    mov         eax,dword ptr [esi]
 004A30FD    movzx       eax,byte ptr [eax+39]
 004A3101    mov         eax,dword ptr [eax*4+785D00]
 004A3108    push        eax
 004A3109    push        0C
 004A310B    mov         eax,dword ptr [ebp+8]
 004A310E    mov         eax,dword ptr [eax-28]
 004A3111    call        TCanvas.GetHandle
 004A3116    push        eax
 004A3117    call        ThemeServices
 004A311C    mov         dl,7
 004A311E    call        TThemeServices.GetTheme
 004A3123    push        eax
 004A3124    mov         eax,[0078D2E8];DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 004A3129    mov         eax,dword ptr [eax]
 004A312B    call        eax
 004A312D    push        0
 004A312F    lea         eax,[ebp-58]
 004A3132    push        eax
 004A3133    mov         eax,dword ptr [esi]
 004A3135    movzx       eax,byte ptr [eax+3D]
 004A3139    mov         edx,dword ptr [esi]
 004A313B    movzx       edx,byte ptr [edx+39]
 004A313F    lea         edx,[edx*8+785D08]
 004A3146    mov         eax,dword ptr [edx+eax*4]
 004A3149    push        eax
 004A314A    push        0B
 004A314C    mov         eax,dword ptr [ebp+8]
 004A314F    mov         eax,dword ptr [eax-28]
 004A3152    call        TCanvas.GetHandle
 004A3157    push        eax
 004A3158    call        ThemeServices
 004A315D    mov         dl,7
 004A315F    call        TThemeServices.GetTheme
 004A3164    push        eax
 004A3165    mov         eax,[0078D2E8];DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 004A316A    mov         eax,dword ptr [eax]
 004A316C    call        eax
>004A316E    jmp         004A3257
 004A3173    push        10
 004A3175    lea         eax,[ebp-68]
 004A3178    push        eax
 004A3179    mov         ecx,10
 004A317E    xor         edx,edx
 004A3180    xor         eax,eax
 004A3182    call        Rect
 004A3187    mov         ecx,dword ptr [ebp+8]
 004A318A    mov         ecx,dword ptr [ecx-14]
 004A318D    mov         edx,dword ptr [ebp+8]
 004A3190    mov         edx,dword ptr [edx-1C]
 004A3193    sub         ecx,edx
 004A3195    sub         ecx,10
 004A3198    sar         ecx,1
>004A319A    jns         004A319F
 004A319C    adc         ecx,0
 004A319F    mov         edi,dword ptr [ebp+8]
 004A31A2    add         ecx,edx
 004A31A4    push        ecx
 004A31A5    mov         edx,dword ptr [ebp+8]
 004A31A8    mov         edx,dword ptr [edx-18]
 004A31AB    mov         eax,dword ptr [ebp+8]
 004A31AE    mov         eax,dword ptr [eax-20]
 004A31B1    sub         edx,eax
 004A31B3    sub         edx,10
 004A31B6    sar         edx,1
>004A31B8    jns         004A31BD
 004A31BA    adc         edx,0
 004A31BD    mov         ecx,dword ptr [ebp+8]
 004A31C0    add         edx,eax
 004A31C2    lea         eax,[ebp-68]
 004A31C5    pop         ecx
 004A31C6    call        OffsetRect
 004A31CB    mov         eax,dword ptr [esi]
 004A31CD    mov         eax,dword ptr [eax+4C]
 004A31D0    mov         edx,dword ptr [eax]
 004A31D2    call        dword ptr [edx+30]
 004A31D5    cmp         eax,dword ptr [ebp-18]
>004A31D8    jge         004A3206
 004A31DA    mov         eax,dword ptr [esi]
 004A31DC    mov         eax,dword ptr [eax+4C]
 004A31DF    mov         edx,dword ptr [eax]
 004A31E1    call        dword ptr [edx+30]
 004A31E4    mov         edx,dword ptr [ebp-60]
 004A31E7    sub         edx,dword ptr [ebp-68]
 004A31EA    sub         edx,eax
 004A31EC    sar         edx,1
>004A31EE    jns         004A31F3
 004A31F0    adc         edx,0
 004A31F3    add         dword ptr [ebp-68],edx
 004A31F6    mov         eax,dword ptr [esi]
 004A31F8    mov         eax,dword ptr [eax+4C]
 004A31FB    mov         edx,dword ptr [eax]
 004A31FD    call        dword ptr [edx+30]
 004A3200    add         eax,dword ptr [ebp-68]
 004A3203    mov         dword ptr [ebp-60],eax
 004A3206    mov         eax,dword ptr [esi]
 004A3208    mov         eax,dword ptr [eax+4C]
 004A320B    mov         edx,dword ptr [eax]
 004A320D    call        dword ptr [edx+24]
 004A3210    cmp         eax,dword ptr [ebp-14]
>004A3213    jge         004A3241
 004A3215    mov         eax,dword ptr [esi]
 004A3217    mov         eax,dword ptr [eax+4C]
 004A321A    mov         edx,dword ptr [eax]
 004A321C    call        dword ptr [edx+24]
 004A321F    mov         edx,dword ptr [ebp-5C]
 004A3222    sub         edx,dword ptr [ebp-64]
 004A3225    sub         edx,eax
 004A3227    sar         edx,1
>004A3229    jns         004A322E
 004A322B    adc         edx,0
 004A322E    add         dword ptr [ebp-64],edx
 004A3231    mov         eax,dword ptr [esi]
 004A3233    mov         eax,dword ptr [eax+4C]
 004A3236    mov         edx,dword ptr [eax]
 004A3238    call        dword ptr [edx+24]
 004A323B    add         eax,dword ptr [ebp-64]
 004A323E    mov         dword ptr [ebp-5C],eax
 004A3241    mov         eax,dword ptr [esi]
 004A3243    mov         ecx,dword ptr [eax+4C]
 004A3246    lea         edx,[ebp-68]
 004A3249    mov         eax,dword ptr [ebp+8]
 004A324C    mov         eax,dword ptr [eax-28]
 004A324F    mov         edi,dword ptr [eax]
 004A3251    call        dword ptr [edi+88]
 004A3257    lea         eax,[ebp-28]
 004A325A    push        eax
 004A325B    push        0
 004A325D    push        0E11
 004A3262    push        1
 004A3264    push        0E
 004A3266    mov         eax,dword ptr [ebp+8]
 004A3269    mov         eax,dword ptr [eax-28]
 004A326C    call        TCanvas.GetHandle
 004A3271    push        eax
 004A3272    call        ThemeServices
 004A3277    mov         dl,7
 004A3279    call        TThemeServices.GetTheme
 004A327E    push        eax
 004A327F    mov         eax,[0078D498];^GetThemeMargins:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A3284    mov         eax,dword ptr [eax]
 004A3286    call        eax
 004A3288    mov         eax,dword ptr [ebp+8]
 004A328B    cmp         byte ptr [eax+8],0
>004A328F    jne         004A3324
 004A3295    mov         eax,ebx
 004A3297    xor         al,1
 004A3299    test        al,al
>004A329B    je          004A32B1
 004A329D    mov         eax,dword ptr [ebp+8]
 004A32A0    mov         edx,dword ptr [ebp-40]
 004A32A3    mov         dword ptr [eax-10],edx
 004A32A6    mov         eax,dword ptr [ebp+8]
 004A32A9    mov         edx,dword ptr [ebp-28]
 004A32AC    add         dword ptr [eax-10],edx
>004A32AF    jmp         004A32C3
 004A32B1    mov         eax,dword ptr [ebp+8]
 004A32B4    mov         edx,dword ptr [ebp-48]
 004A32B7    mov         dword ptr [eax-8],edx
 004A32BA    mov         eax,dword ptr [ebp+8]
 004A32BD    mov         edx,dword ptr [ebp-28]
 004A32C0    sub         dword ptr [eax-8],edx
 004A32C3    mov         eax,dword ptr [esi]
 004A32C5    mov         eax,dword ptr [eax+34]
 004A32C8    mov         edx,4A35E0;'-'
 004A32CD    call        @UStrEqual
>004A32D2    je          004A3387
 004A32D8    lea         eax,[ebp-10]
 004A32DB    push        eax
 004A32DC    push        1
 004A32DE    push        0
 004A32E0    push        1
 004A32E2    push        10
 004A32E4    mov         eax,dword ptr [ebp+8]
 004A32E7    mov         eax,dword ptr [eax-28]
 004A32EA    call        TCanvas.GetHandle
 004A32EF    push        eax
 004A32F0    call        ThemeServices
 004A32F5    mov         dl,7
 004A32F7    call        TThemeServices.GetTheme
 004A32FC    push        eax
 004A32FD    mov         eax,[0078D2E4];GetThemePartSize:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A3302    mov         eax,dword ptr [eax]
 004A3304    call        eax
 004A3306    mov         eax,ebx
 004A3308    xor         al,1
 004A330A    test        al,al
>004A330C    je          004A3319
 004A330E    mov         eax,dword ptr [ebp+8]
 004A3311    mov         edx,dword ptr [ebp-10]
 004A3314    sub         dword ptr [eax-8],edx
>004A3317    jmp         004A3387
 004A3319    mov         eax,dword ptr [ebp+8]
 004A331C    mov         edx,dword ptr [ebp-10]
 004A331F    add         dword ptr [eax-10],edx
>004A3322    jmp         004A3387
 004A3324    mov         eax,dword ptr [ebp+8]
 004A3327    cmp         dword ptr [eax-2C],0
>004A332B    je          004A3335
 004A332D    mov         eax,dword ptr [esi]
 004A332F    cmp         dword ptr [eax+40],0FFFFFFFF
>004A3333    jne         004A333D
 004A3335    mov         eax,dword ptr [esi]
 004A3337    cmp         dword ptr [eax+4C],0
>004A333B    je          004A3369
 004A333D    test        bl,bl
>004A333F    jne         004A3355
 004A3341    mov         eax,dword ptr [ebp+8]
 004A3344    mov         eax,dword ptr [eax-18]
 004A3347    mov         edx,dword ptr [ebp+8]
 004A334A    sub         eax,dword ptr [edx-20]
 004A334D    mov         edx,dword ptr [ebp+8]
 004A3350    add         dword ptr [edx-10],eax
>004A3353    jmp         004A3387
 004A3355    mov         eax,dword ptr [ebp+8]
 004A3358    mov         eax,dword ptr [eax-18]
 004A335B    mov         edx,dword ptr [ebp+8]
 004A335E    sub         eax,dword ptr [edx-20]
 004A3361    mov         edx,dword ptr [ebp+8]
 004A3364    sub         dword ptr [edx-8],eax
>004A3367    jmp         004A3387
 004A3369    test        bl,bl
>004A336B    jne         004A337B
 004A336D    mov         eax,dword ptr [ebp-28]
 004A3370    add         eax,3
 004A3373    mov         edx,dword ptr [ebp+8]
 004A3376    add         dword ptr [edx-10],eax
>004A3379    jmp         004A3387
 004A337B    mov         eax,dword ptr [ebp-28]
 004A337E    add         eax,3
 004A3381    mov         edx,dword ptr [ebp+8]
 004A3384    sub         dword ptr [edx-8],eax
 004A3387    mov         eax,dword ptr [esi]
 004A3389    mov         eax,dword ptr [eax+34]
 004A338C    mov         edx,4A35E0;'-'
 004A3391    call        @UStrEqual
>004A3396    je          004A352A
 004A339C    mov         eax,dword ptr [ebp+8]
 004A339F    movzx       eax,byte ptr [eax-31]
 004A33A3    movzx       eax,word ptr [eax*2+785CD0]
 004A33AB    or          ax,60
 004A33AF    movzx       eax,ax
 004A33B2    mov         edx,dword ptr [ebp+8]
 004A33B5    mov         dword ptr [edx-38],eax
 004A33B8    mov         eax,dword ptr [ebp+8]
 004A33BB    test        byte ptr [eax+0D],1
>004A33BF    je          004A33CB
 004A33C1    mov         eax,dword ptr [ebp+8]
 004A33C4    or          dword ptr [eax-38],100000
 004A33CB    mov         eax,dword ptr [ebp+8]
 004A33CE    mov         edx,dword ptr [ebp+8]
 004A33D1    push        esi
 004A33D2    lea         esi,[eax-10]
 004A33D5    lea         edi,[edx-48]
 004A33D8    movs        dword ptr [edi],dword ptr [esi]
 004A33D9    movs        dword ptr [edi],dword ptr [esi]
 004A33DA    movs        dword ptr [edi],dword ptr [esi]
 004A33DB    movs        dword ptr [edi],dword ptr [esi]
 004A33DC    pop         esi
 004A33DD    mov         eax,dword ptr [ebp+8]
 004A33E0    add         eax,0FFFFFFF0
 004A33E3    push        eax
 004A33E4    mov         eax,dword ptr [ebp+8]
 004A33E7    movzx       eax,byte ptr [eax-32]
 004A33EB    push        eax
 004A33EC    mov         eax,dword ptr [ebp+8]
 004A33EF    mov         eax,dword ptr [eax-38]
 004A33F2    or          eax,400
 004A33F7    or          eax,100
 004A33FC    push        eax
 004A33FD    mov         eax,dword ptr [esi]
 004A33FF    mov         ecx,dword ptr [eax+34]
 004A3402    mov         eax,dword ptr [ebp+8]
 004A3405    mov         edx,dword ptr [eax-28]
 004A3408    mov         eax,dword ptr [esi]
 004A340A    call        DoDrawVistaText
 004A340F    test        bl,bl
>004A3411    je          004A342B
 004A3413    mov         eax,dword ptr [ebp+8]
 004A3416    mov         eax,dword ptr [eax-48]
 004A3419    mov         edx,dword ptr [ebp+8]
 004A341C    mov         dword ptr [edx-10],eax
 004A341F    mov         eax,dword ptr [ebp+8]
 004A3422    mov         eax,dword ptr [eax-40]
 004A3425    mov         edx,dword ptr [ebp+8]
 004A3428    mov         dword ptr [edx-8],eax
 004A342B    mov         eax,dword ptr [ebp+8]
 004A342E    mov         ecx,dword ptr [eax-3C]
 004A3431    mov         eax,dword ptr [ebp+8]
 004A3434    sub         ecx,dword ptr [eax-44]
 004A3437    mov         eax,dword ptr [ebp+8]
 004A343A    mov         eax,dword ptr [eax-4]
 004A343D    mov         edx,dword ptr [ebp+8]
 004A3440    sub         eax,dword ptr [edx-0C]
 004A3443    sub         ecx,eax
 004A3445    sar         ecx,1
>004A3447    jns         004A344C
 004A3449    adc         ecx,0
 004A344C    mov         eax,dword ptr [ebp+8]
 004A344F    add         eax,0FFFFFFF0
 004A3452    xor         edx,edx
 004A3454    call        OffsetRect
 004A3459    mov         eax,dword ptr [ebp+8]
 004A345C    add         eax,0FFFFFFF0
 004A345F    push        eax
 004A3460    mov         eax,dword ptr [ebp+8]
 004A3463    movzx       eax,byte ptr [eax-32]
 004A3467    push        eax
 004A3468    mov         eax,dword ptr [ebp+8]
 004A346B    mov         eax,dword ptr [eax-38]
 004A346E    push        eax
 004A346F    mov         eax,dword ptr [esi]
 004A3471    mov         ecx,dword ptr [eax+34]
 004A3474    mov         eax,dword ptr [ebp+8]
 004A3477    mov         edx,dword ptr [eax-28]
 004A347A    mov         eax,dword ptr [esi]
 004A347C    call        DoDrawVistaText
 004A3481    mov         eax,dword ptr [esi]
 004A3483    movzx       edi,word ptr [eax+60]
 004A3487    test        di,di
>004A348A    je          004A35AD
 004A3490    mov         eax,dword ptr [ebp+8]
 004A3493    cmp         byte ptr [eax+8],0
>004A3497    jne         004A35AD
 004A349D    mov         eax,dword ptr [esi]
 004A349F    cmp         dword ptr [eax+5C],0
>004A34A3    jne         004A35AD
 004A34A9    lea         edx,[ebp-4]
 004A34AC    mov         eax,edi
 004A34AE    call        ShortCutToText
 004A34B3    test        bl,bl
>004A34B5    jne         004A34D7
 004A34B7    mov         eax,dword ptr [ebp+8]
 004A34BA    mov         eax,dword ptr [eax-8]
 004A34BD    mov         edx,dword ptr [ebp+8]
 004A34C0    mov         dword ptr [edx-10],eax
 004A34C3    mov         eax,dword ptr [ebp+8]
 004A34C6    mov         eax,dword ptr [eax-40]
 004A34C9    sub         eax,dword ptr [ebp-10]
 004A34CC    sub         eax,dword ptr [ebp-28]
 004A34CF    mov         edx,dword ptr [ebp+8]
 004A34D2    mov         dword ptr [edx-8],eax
>004A34D5    jmp         004A3504
 004A34D7    mov         eax,dword ptr [ebp-10]
 004A34DA    mov         edx,eax
 004A34DC    add         edx,eax
 004A34DE    add         edx,dword ptr [ebp-28]
 004A34E1    add         edx,dword ptr [ebp-24]
 004A34E4    mov         eax,dword ptr [ebp+8]
 004A34E7    mov         dword ptr [eax-10],edx
 004A34EA    mov         eax,dword ptr [ebp+8]
 004A34ED    mov         eax,dword ptr [eax-28]
 004A34F0    mov         edx,dword ptr [ebp-4]
 004A34F3    call        TCustomCanvas.TextWidth
 004A34F8    mov         edx,dword ptr [ebp+8]
 004A34FB    add         eax,dword ptr [edx-10]
 004A34FE    mov         edx,dword ptr [ebp+8]
 004A3501    mov         dword ptr [edx-8],eax
 004A3504    mov         eax,dword ptr [ebp+8]
 004A3507    add         eax,0FFFFFFF0
 004A350A    push        eax
 004A350B    mov         eax,dword ptr [ebp+8]
 004A350E    movzx       eax,byte ptr [eax-32]
 004A3512    push        eax
 004A3513    push        2
 004A3515    mov         eax,dword ptr [ebp+8]
 004A3518    mov         edx,dword ptr [eax-28]
 004A351B    mov         eax,dword ptr [esi]
 004A351D    mov         ecx,dword ptr [ebp-4]
 004A3520    call        TMenuItem.DoDrawText
>004A3525    jmp         004A35AD
 004A352A    test        bl,bl
>004A352C    jne         004A353A
 004A352E    mov         eax,dword ptr [ebp-40]
 004A3531    inc         eax
 004A3532    mov         edx,dword ptr [ebp+8]
 004A3535    mov         dword ptr [edx-10],eax
>004A3538    jmp         004A3544
 004A353A    mov         eax,dword ptr [ebp-48]
 004A353D    dec         eax
 004A353E    mov         edx,dword ptr [ebp+8]
 004A3541    mov         dword ptr [edx-8],eax
 004A3544    lea         eax,[ebp-28]
 004A3547    push        eax
 004A3548    push        0
 004A354A    push        0E11
 004A354F    push        0
 004A3551    push        0F
 004A3553    mov         eax,dword ptr [ebp+8]
 004A3556    mov         eax,dword ptr [eax-28]
 004A3559    call        TCanvas.GetHandle
 004A355E    push        eax
 004A355F    call        ThemeServices
 004A3564    mov         dl,7
 004A3566    call        TThemeServices.GetTheme
 004A356B    push        eax
 004A356C    mov         eax,[0078D498];^GetThemeMargins:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A3571    mov         eax,dword ptr [eax]
 004A3573    call        eax
 004A3575    mov         eax,dword ptr [ebp+8]
 004A3578    mov         edx,dword ptr [ebp-1C]
 004A357B    sub         dword ptr [eax-4],edx
 004A357E    push        0
 004A3580    mov         eax,dword ptr [ebp+8]
 004A3583    add         eax,0FFFFFFF0
 004A3586    push        eax
 004A3587    push        0
 004A3589    push        0F
 004A358B    mov         eax,dword ptr [ebp+8]
 004A358E    mov         eax,dword ptr [eax-28]
 004A3591    call        TCanvas.GetHandle
 004A3596    push        eax
 004A3597    call        ThemeServices
 004A359C    mov         dl,7
 004A359E    call        TThemeServices.GetTheme
 004A35A3    push        eax
 004A35A4    mov         eax,[0078D2E8];DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 004A35A9    mov         eax,dword ptr [eax]
 004A35AB    call        eax
 004A35AD    xor         eax,eax
 004A35AF    pop         edx
 004A35B0    pop         ecx
 004A35B1    pop         ecx
 004A35B2    mov         dword ptr fs:[eax],edx
 004A35B5    push        4A35CA
 004A35BA    lea         eax,[ebp-4]
 004A35BD    call        @UStrClr
 004A35C2    ret
>004A35C3    jmp         @HandleFinally
>004A35C8    jmp         004A35BA
 004A35CA    pop         edi
 004A35CB    pop         esi
 004A35CC    pop         ebx
 004A35CD    mov         esp,ebp
 004A35CF    pop         ebp
 004A35D0    ret
*}
end;

//004A35E4
procedure NormalDraw;
begin
{*
 004A35E4    push        ebp
 004A35E5    mov         ebp,esp
 004A35E7    push        0
 004A35E9    push        ebx
 004A35EA    push        esi
 004A35EB    push        edi
 004A35EC    xor         eax,eax
 004A35EE    push        ebp
 004A35EF    push        4A3F43
 004A35F4    push        dword ptr fs:[eax]
 004A35F7    mov         dword ptr fs:[eax],esp
 004A35FA    mov         eax,dword ptr [ebp+8]
 004A35FD    cmp         byte ptr [eax-49],0
>004A3601    je          004A360C
 004A3603    mov         eax,dword ptr [ebp+8]
 004A3606    cmp         byte ptr [eax-4A],0
>004A360A    jne         004A3627
 004A360C    mov         eax,dword ptr [ebp+8]
 004A360F    cmp         byte ptr [eax-49],0
>004A3613    je          004A36A0
 004A3619    call        ThemeServices
 004A361E    call        TThemeServices.GetThemesEnabled
 004A3623    test        al,al
>004A3625    je          004A36A0
 004A3627    mov         eax,dword ptr [ebp+8]
 004A362A    test        byte ptr [eax+0C],1
>004A362E    jne         004A3639
 004A3630    mov         eax,dword ptr [ebp+8]
 004A3633    test        byte ptr [eax+0C],40
>004A3637    je          004A3684
 004A3639    call        ThemeServices
 004A363E    call        TThemeServices.GetThemesEnabled
 004A3643    test        al,al
>004A3645    je          004A365C
 004A3647    mov         eax,dword ptr [ebp+8]
 004A364A    mov         eax,dword ptr [eax-28]
 004A364D    mov         eax,dword ptr [eax+48]
 004A3650    mov         edx,0FF00001D
 004A3655    call        TBrush.SetColor
>004A365A    jmp         004A366F
 004A365C    mov         eax,dword ptr [ebp+8]
 004A365F    mov         eax,dword ptr [eax-28]
 004A3662    mov         eax,dword ptr [eax+48]
 004A3665    mov         edx,0FF00000D
 004A366A    call        TBrush.SetColor
 004A366F    mov         eax,dword ptr [ebp+8]
 004A3672    mov         eax,dword ptr [eax-28]
 004A3675    mov         eax,dword ptr [eax+40]
 004A3678    mov         edx,0FF00000E
 004A367D    call        TFont.SetColor
>004A3682    jmp         004A36A0
 004A3684    mov         eax,dword ptr [ebp+8]
 004A3687    cmp         byte ptr [eax+8],0
>004A368B    je          004A36A0
 004A368D    mov         eax,dword ptr [ebp+8]
 004A3690    mov         eax,dword ptr [eax-28]
 004A3693    mov         eax,dword ptr [eax+48]
 004A3696    mov         edx,0FF00001E
 004A369B    call        TBrush.SetColor
 004A36A0    mov         eax,dword ptr [ebp+8]
 004A36A3    cmp         byte ptr [eax-32],0
>004A36A7    je          004A36B2
 004A36A9    mov         eax,dword ptr [ebp+8]
 004A36AC    cmp         byte ptr [eax-49],0
>004A36B0    je          004A36C3
 004A36B2    mov         eax,dword ptr [ebp+8]
 004A36B5    lea         edx,[eax-10]
 004A36B8    mov         eax,dword ptr [ebp+8]
 004A36BB    mov         eax,dword ptr [eax-28]
 004A36BE    mov         ecx,dword ptr [eax]
 004A36C0    call        dword ptr [ecx+54]
 004A36C3    mov         eax,dword ptr [ebp+8]
 004A36C6    cmp         dword ptr [eax-30],0
>004A36CA    je          004A36D5
 004A36CC    mov         eax,dword ptr [ebp+8]
 004A36CF    mov         byte ptr [eax-31],0
>004A36D3    jmp         004A3703
 004A36D5    mov         eax,dword ptr [ebp+8]
 004A36D8    mov         eax,dword ptr [eax-30]
 004A36DB    mov         edx,dword ptr ds:[4A0E2C];TPopupMenu
 004A36E1    call        @IsClass
 004A36E6    test        al,al
>004A36E8    je          004A36FC
 004A36EA    mov         eax,dword ptr [ebp+8]
 004A36ED    mov         eax,dword ptr [eax-30]
 004A36F0    movzx       eax,byte ptr [eax+68]
 004A36F4    mov         edx,dword ptr [ebp+8]
 004A36F7    mov         byte ptr [edx-31],al
>004A36FA    jmp         004A3703
 004A36FC    mov         eax,dword ptr [ebp+8]
 004A36FF    mov         byte ptr [eax-31],0
 004A3703    mov         eax,dword ptr [ebp+8]
 004A3706    mov         eax,dword ptr [eax-10]
 004A3709    inc         eax
 004A370A    mov         edx,dword ptr [ebp+8]
 004A370D    mov         dword ptr [edx-20],eax
 004A3710    mov         eax,dword ptr [ebp+8]
 004A3713    mov         eax,dword ptr [eax-0C]
 004A3716    inc         eax
 004A3717    mov         edx,dword ptr [ebp+8]
 004A371A    mov         dword ptr [edx-1C],eax
 004A371D    mov         eax,dword ptr [ebp+8]
 004A3720    mov         eax,dword ptr [eax-24]
 004A3723    mov         eax,dword ptr [eax+34]
 004A3726    mov         edx,4A3F5C;'-'
 004A372B    call        @UStrEqual
>004A3730    jne         004A3761
 004A3732    mov         eax,dword ptr [ebp+8]
 004A3735    lea         edx,[eax-10]
 004A3738    mov         eax,dword ptr [ebp+8]
 004A373B    mov         eax,dword ptr [eax-28]
 004A373E    mov         ecx,dword ptr [eax]
 004A3740    call        dword ptr [ecx+54]
 004A3743    mov         eax,dword ptr [ebp+8]
 004A3746    xor         edx,edx
 004A3748    mov         dword ptr [eax-20],edx
 004A374B    mov         eax,dword ptr [ebp+8]
 004A374E    mov         dword ptr [eax-18],0FFFFFFFC
 004A3755    mov         eax,dword ptr [ebp+8]
 004A3758    mov         byte ptr [eax-4B],0
>004A375C    jmp         004A3C01
 004A3761    mov         eax,dword ptr [ebp+8]
 004A3764    cmp         dword ptr [eax-2C],0
>004A3768    je          004A37B1
 004A376A    mov         eax,dword ptr [ebp+8]
 004A376D    mov         eax,dword ptr [eax-24]
 004A3770    mov         ebx,dword ptr [eax+40]
 004A3773    cmp         ebx,0FFFFFFFF
>004A3776    jle         004A378A
 004A3778    mov         eax,dword ptr [ebp+8]
 004A377B    mov         eax,dword ptr [ebp+8]
 004A377E    mov         eax,dword ptr [eax-2C]
 004A3781    call        TCustomImageList.GetCount
 004A3786    cmp         ebx,eax
>004A3788    jl          004A37B5
 004A378A    mov         eax,dword ptr [ebp+8]
 004A378D    mov         eax,dword ptr [eax-24]
 004A3790    cmp         byte ptr [eax+38],0
>004A3794    je          004A37B1
 004A3796    mov         eax,dword ptr [ebp+8]
 004A3799    mov         eax,dword ptr [eax-24]
 004A379C    mov         esi,dword ptr [eax+4C]
 004A379F    test        esi,esi
>004A37A1    je          004A37B5
 004A37A3    mov         eax,dword ptr [ebp+8]
 004A37A6    mov         eax,esi
 004A37A8    mov         edx,dword ptr [eax]
 004A37AA    call        dword ptr [edx+20]
 004A37AD    test        al,al
>004A37AF    jne         004A37B5
 004A37B1    xor         eax,eax
>004A37B3    jmp         004A37B7
 004A37B5    mov         al,1
 004A37B7    mov         edx,dword ptr [ebp+8]
 004A37BA    mov         byte ptr [edx-33],al
 004A37BD    mov         eax,dword ptr [ebp+8]
 004A37C0    cmp         byte ptr [eax-33],0
>004A37C4    jne         004A37E9
 004A37C6    mov         eax,dword ptr [ebp+8]
 004A37C9    mov         eax,dword ptr [eax-24]
 004A37CC    mov         ebx,dword ptr [eax+4C]
 004A37CF    test        ebx,ebx
>004A37D1    je          004A3BA4
 004A37D7    mov         eax,dword ptr [ebp+8]
 004A37DA    mov         eax,ebx
 004A37DC    mov         edx,dword ptr [eax]
 004A37DE    call        dword ptr [edx+20]
 004A37E1    test        al,al
>004A37E3    jne         004A3BA4
 004A37E9    mov         eax,dword ptr [ebp+8]
 004A37EC    mov         byte ptr [eax-4B],1
 004A37F0    mov         eax,dword ptr [ebp+8]
 004A37F3    cmp         byte ptr [eax-33],0
>004A37F7    je          004A3825
 004A37F9    mov         eax,dword ptr [ebp+8]
 004A37FC    mov         eax,dword ptr [eax-20]
 004A37FF    mov         edx,dword ptr [ebp+8]
 004A3802    mov         edx,dword ptr [edx-2C]
 004A3805    add         eax,dword ptr [edx+38]
 004A3808    mov         edx,dword ptr [ebp+8]
 004A380B    mov         dword ptr [edx-18],eax
 004A380E    mov         eax,dword ptr [ebp+8]
 004A3811    mov         eax,dword ptr [eax-1C]
 004A3814    mov         edx,dword ptr [ebp+8]
 004A3817    mov         edx,dword ptr [edx-2C]
 004A381A    add         eax,dword ptr [edx+34]
 004A381D    mov         edx,dword ptr [ebp+8]
 004A3820    mov         dword ptr [edx-14],eax
>004A3823    jmp         004A3843
 004A3825    mov         eax,dword ptr [ebp+8]
 004A3828    mov         eax,dword ptr [eax-20]
 004A382B    add         eax,10
 004A382E    mov         edx,dword ptr [ebp+8]
 004A3831    mov         dword ptr [edx-18],eax
 004A3834    mov         eax,dword ptr [ebp+8]
 004A3837    mov         eax,dword ptr [eax-1C]
 004A383A    add         eax,10
 004A383D    mov         edx,dword ptr [ebp+8]
 004A3840    mov         dword ptr [edx-14],eax
 004A3843    mov         eax,dword ptr [ebp+8]
 004A3846    mov         eax,dword ptr [eax-24]
 004A3849    cmp         byte ptr [eax+38],0
>004A384D    je          004A3915
 004A3853    mov         eax,dword ptr [ebp+8]
 004A3856    cmp         byte ptr [eax-49],0
>004A385A    jne         004A3915
 004A3860    mov         eax,dword ptr [ebp+8]
 004A3863    inc         dword ptr [eax-18]
 004A3866    mov         eax,dword ptr [ebp+8]
 004A3869    inc         dword ptr [eax-14]
 004A386C    mov         eax,dword ptr [ebp+8]
 004A386F    mov         eax,dword ptr [eax-28]
 004A3872    mov         eax,dword ptr [eax+48]
 004A3875    mov         eax,dword ptr [eax+10]
 004A3878    mov         eax,dword ptr [eax+18]
 004A387B    mov         edx,dword ptr [ebp+8]
 004A387E    mov         dword ptr [edx-50],eax
 004A3881    mov         eax,dword ptr [ebp+8]
 004A3884    test        byte ptr [eax+0C],1
>004A3888    jne         004A38D1
 004A388A    mov         eax,dword ptr [ebp+8]
 004A388D    mov         eax,dword ptr [eax-28]
 004A3890    mov         eax,dword ptr [eax+48]
 004A3893    mov         eax,dword ptr [eax+10]
 004A3896    mov         eax,dword ptr [eax+18]
 004A3899    mov         edx,dword ptr [ebp+8]
 004A389C    mov         dword ptr [edx-50],eax
 004A389F    mov         edx,0FF000014
 004A38A4    mov         eax,0FF00000F
 004A38A9    call        AllocPatternBitmap
 004A38AE    mov         edx,eax
 004A38B0    mov         eax,dword ptr [ebp+8]
 004A38B3    mov         eax,dword ptr [eax-28]
 004A38B6    mov         eax,dword ptr [eax+48]
 004A38B9    call        TBrush.SetBitmap
 004A38BE    mov         eax,dword ptr [ebp+8]
 004A38C1    lea         edx,[eax-20]
 004A38C4    mov         eax,dword ptr [ebp+8]
 004A38C7    mov         eax,dword ptr [eax-28]
 004A38CA    mov         ecx,dword ptr [eax]
 004A38CC    call        dword ptr [ecx+54]
>004A38CF    jmp         004A38F5
 004A38D1    mov         eax,dword ptr [ebp+8]
 004A38D4    mov         eax,dword ptr [eax-28]
 004A38D7    mov         eax,dword ptr [eax+48]
 004A38DA    mov         edx,0FF00000F
 004A38DF    call        TBrush.SetColor
 004A38E4    mov         eax,dword ptr [ebp+8]
 004A38E7    lea         edx,[eax-20]
 004A38EA    mov         eax,dword ptr [ebp+8]
 004A38ED    mov         eax,dword ptr [eax-28]
 004A38F0    mov         ecx,dword ptr [eax]
 004A38F2    call        dword ptr [ecx+54]
 004A38F5    mov         eax,dword ptr [ebp+8]
 004A38F8    mov         edx,dword ptr [eax-50]
 004A38FB    mov         eax,dword ptr [ebp+8]
 004A38FE    mov         eax,dword ptr [eax-28]
 004A3901    mov         eax,dword ptr [eax+48]
 004A3904    call        TBrush.SetColor
 004A3909    mov         eax,dword ptr [ebp+8]
 004A390C    inc         dword ptr [eax-20]
 004A390F    mov         eax,dword ptr [ebp+8]
 004A3912    inc         dword ptr [eax-1C]
 004A3915    mov         eax,dword ptr [ebp+8]
 004A3918    cmp         byte ptr [eax-33],0
>004A391C    je          004A3A7D
 004A3922    mov         eax,dword ptr [ebp+8]
 004A3925    mov         eax,dword ptr [eax-24]
 004A3928    mov         ebx,dword ptr [eax+40]
 004A392B    cmp         ebx,0FFFFFFFF
>004A392E    jle         004A397A
 004A3930    mov         eax,dword ptr [ebp+8]
 004A3933    mov         eax,dword ptr [ebp+8]
 004A3936    mov         eax,dword ptr [eax-2C]
 004A3939    call        TCustomImageList.GetCount
 004A393E    cmp         ebx,eax
>004A3940    jge         004A397A
 004A3942    mov         eax,dword ptr [ebp+8]
 004A3945    mov         eax,dword ptr [eax-1C]
 004A3948    push        eax
 004A3949    mov         eax,dword ptr [ebp+8]
 004A394C    mov         eax,dword ptr [eax-24]
 004A394F    mov         eax,dword ptr [eax+40]
 004A3952    push        eax
 004A3953    mov         eax,dword ptr [ebp+8]
 004A3956    mov         eax,dword ptr [eax-24]
 004A3959    movzx       eax,byte ptr [eax+39]
 004A395D    push        eax
 004A395E    mov         eax,dword ptr [ebp+8]
 004A3961    mov         ecx,dword ptr [eax-20]
 004A3964    mov         eax,dword ptr [ebp+8]
 004A3967    mov         edx,dword ptr [eax-28]
 004A396A    mov         eax,dword ptr [ebp+8]
 004A396D    mov         eax,dword ptr [eax-2C]
 004A3970    call        TCustomImageList.Draw
>004A3975    jmp         004A3B8A
 004A397A    mov         dl,1
 004A397C    mov         eax,[00463B28];TBitmap
 004A3981    call        TBitmap.Create
 004A3986    mov         edx,dword ptr [ebp+8]
 004A3989    mov         dword ptr [edx-54],eax
 004A398C    xor         eax,eax
 004A398E    push        ebp
 004A398F    push        4A3A76
 004A3994    push        dword ptr fs:[eax]
 004A3997    mov         dword ptr fs:[eax],esp
 004A399A    mov         eax,dword ptr [ebp+8]
 004A399D    mov         eax,dword ptr [eax-54]
 004A39A0    mov         dl,1
 004A39A2    mov         ecx,dword ptr [eax]
 004A39A4    call        dword ptr [ecx+40]
 004A39A7    push        7FF8
 004A39AC    push        0
 004A39AE    call        user32.LoadBitmapW
 004A39B3    mov         edx,eax
 004A39B5    mov         eax,dword ptr [ebp+8]
 004A39B8    mov         eax,dword ptr [eax-54]
 004A39BB    call        TBitmap.SetHandle
 004A39C0    mov         eax,dword ptr [ebp+8]
 004A39C3    mov         eax,dword ptr [eax-28]
 004A39C6    mov         eax,dword ptr [eax+40]
 004A39C9    mov         eax,dword ptr [eax+18]
 004A39CC    mov         edx,dword ptr [ebp+8]
 004A39CF    mov         dword ptr [edx-50],eax
 004A39D2    mov         eax,dword ptr [ebp+8]
 004A39D5    mov         eax,dword ptr [eax-28]
 004A39D8    mov         eax,dword ptr [eax+40]
 004A39DB    mov         edx,0FF000012
 004A39E0    call        TFont.SetColor
 004A39E5    mov         eax,dword ptr [ebp+8]
 004A39E8    mov         eax,dword ptr [eax-54]
 004A39EB    push        eax
 004A39EC    mov         eax,dword ptr [ebp+8]
 004A39EF    mov         eax,dword ptr [eax-54]
 004A39F2    mov         edx,dword ptr [eax]
 004A39F4    call        dword ptr [edx+24]
 004A39F7    mov         edx,dword ptr [ebp+8]
 004A39FA    mov         edx,dword ptr [edx-14]
 004A39FD    mov         ecx,dword ptr [ebp+8]
 004A3A00    mov         esi,dword ptr [ecx-1C]
 004A3A03    sub         edx,esi
 004A3A05    sub         edx,eax
 004A3A07    sar         edx,1
>004A3A09    jns         004A3A0E
 004A3A0B    adc         edx,0
 004A3A0E    mov         eax,dword ptr [ebp+8]
 004A3A11    add         edx,esi
 004A3A13    inc         edx
 004A3A14    push        edx
 004A3A15    mov         eax,dword ptr [ebp+8]
 004A3A18    mov         eax,dword ptr [eax-54]
 004A3A1B    mov         edx,dword ptr [eax]
 004A3A1D    call        dword ptr [edx+30]
 004A3A20    mov         edx,dword ptr [ebp+8]
 004A3A23    mov         edx,dword ptr [edx-18]
 004A3A26    mov         ecx,dword ptr [ebp+8]
 004A3A29    mov         ebx,dword ptr [ecx-20]
 004A3A2C    sub         edx,ebx
 004A3A2E    sub         edx,eax
 004A3A30    sar         edx,1
>004A3A32    jns         004A3A37
 004A3A34    adc         edx,0
 004A3A37    mov         eax,dword ptr [ebp+8]
 004A3A3A    add         edx,ebx
 004A3A3C    inc         edx
 004A3A3D    mov         eax,dword ptr [ebp+8]
 004A3A40    mov         eax,dword ptr [eax-28]
 004A3A43    pop         ecx
 004A3A44    mov         ebx,dword ptr [eax]
 004A3A46    call        dword ptr [ebx+44]
 004A3A49    mov         eax,dword ptr [ebp+8]
 004A3A4C    mov         edx,dword ptr [eax-50]
 004A3A4F    mov         eax,dword ptr [ebp+8]
 004A3A52    mov         eax,dword ptr [eax-28]
 004A3A55    mov         eax,dword ptr [eax+40]
 004A3A58    call        TFont.SetColor
 004A3A5D    xor         eax,eax
 004A3A5F    pop         edx
 004A3A60    pop         ecx
 004A3A61    pop         ecx
 004A3A62    mov         dword ptr fs:[eax],edx
 004A3A65    push        4A3B8A
 004A3A6A    mov         eax,dword ptr [ebp+8]
 004A3A6D    mov         eax,dword ptr [eax-54]
 004A3A70    call        TObject.Free
 004A3A75    ret
>004A3A76    jmp         @HandleFinally
>004A3A7B    jmp         004A3A6A
 004A3A7D    mov         eax,dword ptr [ebp+8]
 004A3A80    mov         edx,dword ptr [ebp+8]
 004A3A83    lea         esi,[eax-20]
 004A3A86    lea         edi,[edx-48]
 004A3A89    movs        dword ptr [edi],dword ptr [esi]
 004A3A8A    movs        dword ptr [edi],dword ptr [esi]
 004A3A8B    movs        dword ptr [edi],dword ptr [esi]
 004A3A8C    movs        dword ptr [edi],dword ptr [esi]
 004A3A8D    mov         eax,dword ptr [ebp+8]
 004A3A90    mov         eax,dword ptr [eax-24]
 004A3A93    mov         eax,dword ptr [eax+4C]
 004A3A96    mov         edx,dword ptr [eax]
 004A3A98    call        dword ptr [edx+30]
 004A3A9B    mov         edx,dword ptr [ebp+8]
 004A3A9E    mov         edx,dword ptr [edx-18]
 004A3AA1    mov         ecx,dword ptr [ebp+8]
 004A3AA4    sub         edx,dword ptr [ecx-20]
 004A3AA7    cmp         eax,edx
>004A3AA9    jge         004A3AF5
 004A3AAB    mov         eax,dword ptr [ebp+8]
 004A3AAE    mov         eax,dword ptr [eax-24]
 004A3AB1    mov         eax,dword ptr [eax+4C]
 004A3AB4    mov         edx,dword ptr [eax]
 004A3AB6    call        dword ptr [edx+30]
 004A3AB9    mov         edx,dword ptr [ebp+8]
 004A3ABC    mov         edx,dword ptr [edx-18]
 004A3ABF    mov         ecx,dword ptr [ebp+8]
 004A3AC2    sub         edx,dword ptr [ecx-20]
 004A3AC5    sub         edx,eax
 004A3AC7    sar         edx,1
>004A3AC9    jns         004A3ACE
 004A3ACB    adc         edx,0
 004A3ACE    mov         eax,dword ptr [ebp+8]
 004A3AD1    add         edx,dword ptr [eax-20]
 004A3AD4    inc         edx
 004A3AD5    mov         eax,dword ptr [ebp+8]
 004A3AD8    mov         dword ptr [eax-20],edx
 004A3ADB    mov         eax,dword ptr [ebp+8]
 004A3ADE    mov         eax,dword ptr [eax-24]
 004A3AE1    mov         eax,dword ptr [eax+4C]
 004A3AE4    mov         edx,dword ptr [eax]
 004A3AE6    call        dword ptr [edx+30]
 004A3AE9    mov         edx,dword ptr [ebp+8]
 004A3AEC    add         eax,dword ptr [edx-20]
 004A3AEF    mov         edx,dword ptr [ebp+8]
 004A3AF2    mov         dword ptr [edx-18],eax
 004A3AF5    mov         eax,dword ptr [ebp+8]
 004A3AF8    mov         eax,dword ptr [eax-24]
 004A3AFB    mov         eax,dword ptr [eax+4C]
 004A3AFE    mov         edx,dword ptr [eax]
 004A3B00    call        dword ptr [edx+24]
 004A3B03    mov         edx,dword ptr [ebp+8]
 004A3B06    mov         edx,dword ptr [edx-14]
 004A3B09    mov         ecx,dword ptr [ebp+8]
 004A3B0C    sub         edx,dword ptr [ecx-1C]
 004A3B0F    cmp         eax,edx
>004A3B11    jge         004A3B5D
 004A3B13    mov         eax,dword ptr [ebp+8]
 004A3B16    mov         eax,dword ptr [eax-24]
 004A3B19    mov         eax,dword ptr [eax+4C]
 004A3B1C    mov         edx,dword ptr [eax]
 004A3B1E    call        dword ptr [edx+24]
 004A3B21    mov         edx,dword ptr [ebp+8]
 004A3B24    mov         edx,dword ptr [edx-14]
 004A3B27    mov         ecx,dword ptr [ebp+8]
 004A3B2A    sub         edx,dword ptr [ecx-1C]
 004A3B2D    sub         edx,eax
 004A3B2F    sar         edx,1
>004A3B31    jns         004A3B36
 004A3B33    adc         edx,0
 004A3B36    mov         eax,dword ptr [ebp+8]
 004A3B39    add         edx,dword ptr [eax-1C]
 004A3B3C    inc         edx
 004A3B3D    mov         eax,dword ptr [ebp+8]
 004A3B40    mov         dword ptr [eax-1C],edx
 004A3B43    mov         eax,dword ptr [ebp+8]
 004A3B46    mov         eax,dword ptr [eax-24]
 004A3B49    mov         eax,dword ptr [eax+4C]
 004A3B4C    mov         edx,dword ptr [eax]
 004A3B4E    call        dword ptr [edx+24]
 004A3B51    mov         edx,dword ptr [ebp+8]
 004A3B54    add         eax,dword ptr [edx-1C]
 004A3B57    mov         edx,dword ptr [ebp+8]
 004A3B5A    mov         dword ptr [edx-14],eax
 004A3B5D    mov         eax,dword ptr [ebp+8]
 004A3B60    mov         eax,dword ptr [eax-24]
 004A3B63    mov         ecx,dword ptr [eax+4C]
 004A3B66    mov         eax,dword ptr [ebp+8]
 004A3B69    lea         edx,[eax-20]
 004A3B6C    mov         eax,dword ptr [ebp+8]
 004A3B6F    mov         eax,dword ptr [eax-28]
 004A3B72    mov         ebx,dword ptr [eax]
 004A3B74    call        dword ptr [ebx+88]
 004A3B7A    mov         eax,dword ptr [ebp+8]
 004A3B7D    mov         edx,dword ptr [ebp+8]
 004A3B80    lea         esi,[eax-48]
 004A3B83    lea         edi,[edx-20]
 004A3B86    movs        dword ptr [edi],dword ptr [esi]
 004A3B87    movs        dword ptr [edi],dword ptr [esi]
 004A3B88    movs        dword ptr [edi],dword ptr [esi]
 004A3B89    movs        dword ptr [edi],dword ptr [esi]
 004A3B8A    mov         eax,dword ptr [ebp+8]
 004A3B8D    mov         eax,dword ptr [eax-24]
 004A3B90    cmp         byte ptr [eax+38],0
>004A3B94    je          004A3C01
 004A3B96    mov         eax,dword ptr [ebp+8]
 004A3B99    dec         dword ptr [eax-18]
 004A3B9C    mov         eax,dword ptr [ebp+8]
 004A3B9F    dec         dword ptr [eax-14]
>004A3BA2    jmp         004A3C01
 004A3BA4    mov         eax,dword ptr [ebp+8]
 004A3BA7    cmp         dword ptr [eax-2C],0
>004A3BAB    je          004A3BE2
 004A3BAD    mov         eax,dword ptr [ebp+8]
 004A3BB0    cmp         byte ptr [eax+8],0
>004A3BB4    jne         004A3BE2
 004A3BB6    mov         eax,dword ptr [ebp+8]
 004A3BB9    mov         eax,dword ptr [eax-20]
 004A3BBC    mov         edx,dword ptr [ebp+8]
 004A3BBF    mov         edx,dword ptr [edx-2C]
 004A3BC2    add         eax,dword ptr [edx+38]
 004A3BC5    mov         edx,dword ptr [ebp+8]
 004A3BC8    mov         dword ptr [edx-18],eax
 004A3BCB    mov         eax,dword ptr [ebp+8]
 004A3BCE    mov         eax,dword ptr [eax-1C]
 004A3BD1    mov         edx,dword ptr [ebp+8]
 004A3BD4    mov         edx,dword ptr [edx-2C]
 004A3BD7    add         eax,dword ptr [edx+34]
 004A3BDA    mov         edx,dword ptr [ebp+8]
 004A3BDD    mov         dword ptr [edx-14],eax
>004A3BE0    jmp         004A3BFA
 004A3BE2    mov         eax,dword ptr [ebp+8]
 004A3BE5    mov         eax,dword ptr [eax-20]
 004A3BE8    mov         edx,dword ptr [ebp+8]
 004A3BEB    mov         dword ptr [edx-18],eax
 004A3BEE    mov         eax,dword ptr [ebp+8]
 004A3BF1    mov         eax,dword ptr [eax-1C]
 004A3BF4    mov         edx,dword ptr [ebp+8]
 004A3BF7    mov         dword ptr [edx-14],eax
 004A3BFA    mov         eax,dword ptr [ebp+8]
 004A3BFD    mov         byte ptr [eax-4B],0
 004A3C01    mov         eax,dword ptr [ebp+8]
 004A3C04    dec         dword ptr [eax-20]
 004A3C07    mov         eax,dword ptr [ebp+8]
 004A3C0A    dec         dword ptr [eax-1C]
 004A3C0D    mov         eax,dword ptr [ebp+8]
 004A3C10    add         dword ptr [eax-18],2
 004A3C14    mov         eax,dword ptr [ebp+8]
 004A3C17    add         dword ptr [eax-14],2
 004A3C1B    mov         eax,dword ptr [ebp+8]
 004A3C1E    mov         eax,dword ptr [eax-24]
 004A3C21    cmp         byte ptr [eax+38],0
>004A3C25    jne         004A3C39
 004A3C27    mov         eax,dword ptr [ebp+8]
 004A3C2A    cmp         byte ptr [eax-32],0
>004A3C2E    je          004A3C6E
 004A3C30    mov         eax,dword ptr [ebp+8]
 004A3C33    cmp         byte ptr [eax-4B],0
>004A3C37    je          004A3C6E
 004A3C39    mov         eax,dword ptr [ebp+8]
 004A3C3C    cmp         byte ptr [eax-49],0
>004A3C40    jne         004A3C6E
 004A3C42    push        0F
 004A3C44    mov         eax,dword ptr [ebp+8]
 004A3C47    mov         eax,dword ptr [eax-24]
 004A3C4A    movzx       eax,byte ptr [eax+38]
 004A3C4E    mov         eax,dword ptr [eax*4+785CD8]
 004A3C55    push        eax
 004A3C56    mov         eax,dword ptr [ebp+8]
 004A3C59    add         eax,0FFFFFFE0
 004A3C5C    push        eax
 004A3C5D    mov         eax,dword ptr [ebp+8]
 004A3C60    mov         eax,dword ptr [eax-28]
 004A3C63    call        TCanvas.GetHandle
 004A3C68    push        eax
 004A3C69    call        user32.DrawEdge
 004A3C6E    mov         eax,dword ptr [ebp+8]
 004A3C71    cmp         byte ptr [eax-32],0
>004A3C75    je          004A3CC3
 004A3C77    mov         eax,dword ptr [ebp+8]
 004A3C7A    cmp         byte ptr [eax-4B],0
>004A3C7E    je          004A3C8D
 004A3C80    mov         eax,dword ptr [ebp+8]
 004A3C83    mov         eax,dword ptr [eax-18]
 004A3C86    inc         eax
 004A3C87    mov         edx,dword ptr [ebp+8]
 004A3C8A    mov         dword ptr [edx-10],eax
 004A3C8D    mov         eax,dword ptr [ebp+8]
 004A3C90    cmp         byte ptr [eax-55],0
>004A3C94    je          004A3C9F
 004A3C96    mov         eax,dword ptr [ebp+8]
 004A3C99    cmp         byte ptr [eax+8],0
>004A3C9D    jne         004A3CB2
 004A3C9F    mov         eax,dword ptr [ebp+8]
 004A3CA2    mov         eax,dword ptr [eax-28]
 004A3CA5    mov         eax,dword ptr [eax+48]
 004A3CA8    mov         edx,0FF00000D
 004A3CAD    call        TBrush.SetColor
 004A3CB2    mov         eax,dword ptr [ebp+8]
 004A3CB5    lea         edx,[eax-10]
 004A3CB8    mov         eax,dword ptr [ebp+8]
 004A3CBB    mov         eax,dword ptr [eax-28]
 004A3CBE    mov         ecx,dword ptr [eax]
 004A3CC0    call        dword ptr [ecx+54]
 004A3CC3    mov         eax,dword ptr [ebp+8]
 004A3CC6    cmp         byte ptr [eax+8],0
>004A3CCA    je          004A3D50
 004A3CD0    mov         eax,dword ptr [ebp+8]
 004A3CD3    cmp         byte ptr [eax-55],0
>004A3CD7    je          004A3D50
 004A3CD9    mov         eax,dword ptr [ebp+8]
 004A3CDC    cmp         byte ptr [eax-49],0
>004A3CE0    je          004A3CEB
 004A3CE2    mov         eax,dword ptr [ebp+8]
 004A3CE5    cmp         byte ptr [eax-4A],0
>004A3CE9    jne         004A3D50
 004A3CEB    mov         eax,dword ptr [ebp+8]
 004A3CEE    cmp         byte ptr [eax-32],0
>004A3CF2    je          004A3D12
 004A3CF4    push        0F
 004A3CF6    push        2
 004A3CF8    mov         eax,dword ptr [ebp+8]
 004A3CFB    add         eax,0FFFFFFF0
 004A3CFE    push        eax
 004A3CFF    mov         eax,dword ptr [ebp+8]
 004A3D02    mov         eax,dword ptr [eax-28]
 004A3D05    call        TCanvas.GetHandle
 004A3D0A    push        eax
 004A3D0B    call        user32.DrawEdge
>004A3D10    jmp         004A3D37
 004A3D12    mov         eax,dword ptr [ebp+8]
 004A3D15    test        byte ptr [eax+0C],40
>004A3D19    je          004A3D37
 004A3D1B    push        0F
 004A3D1D    push        4
 004A3D1F    mov         eax,dword ptr [ebp+8]
 004A3D22    add         eax,0FFFFFFF0
 004A3D25    push        eax
 004A3D26    mov         eax,dword ptr [ebp+8]
 004A3D29    mov         eax,dword ptr [eax-28]
 004A3D2C    call        TCanvas.GetHandle
 004A3D31    push        eax
 004A3D32    call        user32.DrawEdge
 004A3D37    mov         eax,dword ptr [ebp+8]
 004A3D3A    cmp         byte ptr [eax-32],0
>004A3D3E    jne         004A3D50
 004A3D40    mov         eax,dword ptr [ebp+8]
 004A3D43    add         eax,0FFFFFFF0
 004A3D46    or          ecx,0FFFFFFFF
 004A3D49    xor         edx,edx
 004A3D4B    call        OffsetRect
 004A3D50    mov         eax,dword ptr [ebp+8]
 004A3D53    cmp         byte ptr [eax-32],0
>004A3D57    je          004A3D62
 004A3D59    mov         eax,dword ptr [ebp+8]
 004A3D5C    cmp         byte ptr [eax-4B],0
>004A3D60    jne         004A3D6F
 004A3D62    mov         eax,dword ptr [ebp+8]
 004A3D65    mov         eax,dword ptr [eax-18]
 004A3D68    inc         eax
 004A3D69    mov         edx,dword ptr [ebp+8]
 004A3D6C    mov         dword ptr [edx-10],eax
 004A3D6F    mov         eax,dword ptr [ebp+8]
 004A3D72    add         dword ptr [eax-10],2
 004A3D76    mov         eax,dword ptr [ebp+8]
 004A3D79    dec         dword ptr [eax-8]
 004A3D7C    mov         eax,dword ptr [ebp+8]
 004A3D7F    movzx       eax,byte ptr [eax-31]
 004A3D83    movzx       eax,word ptr [eax*2+785CD0]
 004A3D8B    or          ax,60
 004A3D8F    movzx       eax,ax
 004A3D92    mov         edx,dword ptr [ebp+8]
 004A3D95    mov         dword ptr [edx-38],eax
 004A3D98    mov         eax,dword ptr [ebp+8]
 004A3D9B    cmp         byte ptr [eax-56],0
>004A3D9F    je          004A3DB4
 004A3DA1    mov         eax,dword ptr [ebp+8]
 004A3DA4    test        byte ptr [eax+0D],1
>004A3DA8    je          004A3DB4
 004A3DAA    mov         eax,dword ptr [ebp+8]
 004A3DAD    or          dword ptr [eax-38],100000
 004A3DB4    mov         eax,dword ptr [ebp+8]
 004A3DB7    mov         edx,dword ptr [ebp+8]
 004A3DBA    lea         esi,[eax-10]
 004A3DBD    lea         edi,[edx-48]
 004A3DC0    movs        dword ptr [edi],dword ptr [esi]
 004A3DC1    movs        dword ptr [edi],dword ptr [esi]
 004A3DC2    movs        dword ptr [edi],dword ptr [esi]
 004A3DC3    movs        dword ptr [edi],dword ptr [esi]
 004A3DC4    mov         eax,dword ptr [ebp+8]
 004A3DC7    test        byte ptr [eax+0C],20
>004A3DCB    je          004A3DE2
 004A3DCD    mov         eax,dword ptr [ebp+8]
 004A3DD0    mov         eax,dword ptr [eax-28]
 004A3DD3    mov         eax,dword ptr [eax+40]
 004A3DD6    movzx       edx,byte ptr ds:[4A3F60]
 004A3DDD    call        TFont.SetStyle
 004A3DE2    mov         eax,dword ptr [ebp+8]
 004A3DE5    add         eax,0FFFFFFF0
 004A3DE8    push        eax
 004A3DE9    mov         eax,dword ptr [ebp+8]
 004A3DEC    movzx       eax,byte ptr [eax-32]
 004A3DF0    push        eax
 004A3DF1    mov         eax,dword ptr [ebp+8]
 004A3DF4    mov         eax,dword ptr [eax-38]
 004A3DF7    or          eax,400
 004A3DFC    or          eax,100
 004A3E01    push        eax
 004A3E02    mov         eax,dword ptr [ebp+8]
 004A3E05    mov         eax,dword ptr [eax-24]
 004A3E08    mov         ecx,dword ptr [eax+34]
 004A3E0B    mov         eax,dword ptr [ebp+8]
 004A3E0E    mov         edx,dword ptr [eax-28]
 004A3E11    mov         eax,dword ptr [ebp+8]
 004A3E14    mov         eax,dword ptr [eax-24]
 004A3E17    call        TMenuItem.DoDrawText
 004A3E1C    mov         eax,dword ptr [ebp+8]
 004A3E1F    mov         ecx,dword ptr [eax-3C]
 004A3E22    mov         eax,dword ptr [ebp+8]
 004A3E25    sub         ecx,dword ptr [eax-44]
 004A3E28    mov         eax,dword ptr [ebp+8]
 004A3E2B    mov         eax,dword ptr [eax-4]
 004A3E2E    mov         edx,dword ptr [ebp+8]
 004A3E31    sub         eax,dword ptr [edx-0C]
 004A3E34    sub         ecx,eax
 004A3E36    sar         ecx,1
>004A3E38    jns         004A3E3D
 004A3E3A    adc         ecx,0
 004A3E3D    mov         eax,dword ptr [ebp+8]
 004A3E40    add         eax,0FFFFFFF0
 004A3E43    xor         edx,edx
 004A3E45    call        OffsetRect
 004A3E4A    mov         eax,dword ptr [ebp+8]
 004A3E4D    cmp         byte ptr [eax+8],0
>004A3E51    je          004A3E80
 004A3E53    mov         eax,dword ptr [ebp+8]
 004A3E56    cmp         byte ptr [eax-32],0
>004A3E5A    je          004A3E80
 004A3E5C    mov         eax,dword ptr [ebp+8]
 004A3E5F    cmp         byte ptr [eax-55],0
>004A3E63    je          004A3E80
 004A3E65    mov         eax,dword ptr [ebp+8]
 004A3E68    cmp         byte ptr [eax-49],0
>004A3E6C    jne         004A3E80
 004A3E6E    mov         eax,dword ptr [ebp+8]
 004A3E71    add         eax,0FFFFFFF0
 004A3E74    xor         ecx,ecx
 004A3E76    mov         edx,1
 004A3E7B    call        OffsetRect
 004A3E80    mov         eax,dword ptr [ebp+8]
 004A3E83    add         eax,0FFFFFFF0
 004A3E86    push        eax
 004A3E87    mov         eax,dword ptr [ebp+8]
 004A3E8A    movzx       eax,byte ptr [eax-32]
 004A3E8E    push        eax
 004A3E8F    mov         eax,dword ptr [ebp+8]
 004A3E92    mov         eax,dword ptr [eax-38]
 004A3E95    push        eax
 004A3E96    mov         eax,dword ptr [ebp+8]
 004A3E99    mov         eax,dword ptr [eax-24]
 004A3E9C    mov         ecx,dword ptr [eax+34]
 004A3E9F    mov         eax,dword ptr [ebp+8]
 004A3EA2    mov         edx,dword ptr [eax-28]
 004A3EA5    mov         eax,dword ptr [ebp+8]
 004A3EA8    mov         eax,dword ptr [eax-24]
 004A3EAB    call        TMenuItem.DoDrawText
 004A3EB0    mov         eax,dword ptr [ebp+8]
 004A3EB3    mov         eax,dword ptr [eax-24]
 004A3EB6    cmp         word ptr [eax+60],0
>004A3EBB    je          004A3F2D
 004A3EBD    mov         eax,dword ptr [ebp+8]
 004A3EC0    cmp         byte ptr [eax+8],0
>004A3EC4    jne         004A3F2D
 004A3EC6    mov         eax,dword ptr [ebp+8]
 004A3EC9    cmp         byte ptr [eax-57],0
>004A3ECD    je          004A3EDB
 004A3ECF    mov         eax,dword ptr [ebp+8]
 004A3ED2    mov         eax,dword ptr [eax-24]
 004A3ED5    cmp         dword ptr [eax+5C],0
>004A3ED9    jne         004A3F2D
 004A3EDB    mov         eax,dword ptr [ebp+8]
 004A3EDE    mov         eax,dword ptr [eax-8]
 004A3EE1    mov         edx,dword ptr [ebp+8]
 004A3EE4    mov         dword ptr [edx-10],eax
 004A3EE7    mov         eax,dword ptr [ebp+8]
 004A3EEA    mov         eax,dword ptr [eax-40]
 004A3EED    sub         eax,0A
 004A3EF0    mov         edx,dword ptr [ebp+8]
 004A3EF3    mov         dword ptr [edx-8],eax
 004A3EF6    mov         eax,dword ptr [ebp+8]
 004A3EF9    add         eax,0FFFFFFF0
 004A3EFC    push        eax
 004A3EFD    mov         eax,dword ptr [ebp+8]
 004A3F00    movzx       eax,byte ptr [eax-32]
 004A3F04    push        eax
 004A3F05    push        2
 004A3F07    lea         edx,[ebp-4]
 004A3F0A    mov         eax,dword ptr [ebp+8]
 004A3F0D    mov         eax,dword ptr [eax-24]
 004A3F10    movzx       eax,word ptr [eax+60]
 004A3F14    call        ShortCutToText
 004A3F19    mov         ecx,dword ptr [ebp-4]
 004A3F1C    mov         eax,dword ptr [ebp+8]
 004A3F1F    mov         edx,dword ptr [eax-28]
 004A3F22    mov         eax,dword ptr [ebp+8]
 004A3F25    mov         eax,dword ptr [eax-24]
 004A3F28    call        TMenuItem.DoDrawText
 004A3F2D    xor         eax,eax
 004A3F2F    pop         edx
 004A3F30    pop         ecx
 004A3F31    pop         ecx
 004A3F32    mov         dword ptr fs:[eax],edx
 004A3F35    push        4A3F4A
 004A3F3A    lea         eax,[ebp-4]
 004A3F3D    call        @UStrClr
 004A3F42    ret
>004A3F43    jmp         @HandleFinally
>004A3F48    jmp         004A3F3A
 004A3F4A    pop         edi
 004A3F4B    pop         esi
 004A3F4C    pop         ebx
 004A3F4D    pop         ecx
 004A3F4E    pop         ebp
 004A3F4F    ret
*}
end;

//004A3F64
procedure BiDiDraw;
begin
{*
 004A3F64    push        ebp
 004A3F65    mov         ebp,esp
 004A3F67    push        0
 004A3F69    push        ebx
 004A3F6A    push        esi
 004A3F6B    push        edi
 004A3F6C    xor         eax,eax
 004A3F6E    push        ebp
 004A3F6F    push        4A48E3
 004A3F74    push        dword ptr fs:[eax]
 004A3F77    mov         dword ptr fs:[eax],esp
 004A3F7A    mov         eax,dword ptr [ebp+8]
 004A3F7D    cmp         byte ptr [eax-49],0
>004A3F81    je          004A3F8C
 004A3F83    mov         eax,dword ptr [ebp+8]
 004A3F86    cmp         byte ptr [eax-4A],0
>004A3F8A    jne         004A3FA7
 004A3F8C    mov         eax,dword ptr [ebp+8]
 004A3F8F    cmp         byte ptr [eax-49],0
>004A3F93    je          004A4020
 004A3F99    call        ThemeServices
 004A3F9E    call        TThemeServices.GetThemesEnabled
 004A3FA3    test        al,al
>004A3FA5    je          004A4020
 004A3FA7    mov         eax,dword ptr [ebp+8]
 004A3FAA    test        byte ptr [eax+0C],1
>004A3FAE    jne         004A3FB9
 004A3FB0    mov         eax,dword ptr [ebp+8]
 004A3FB3    test        byte ptr [eax+0C],40
>004A3FB7    je          004A4004
 004A3FB9    call        ThemeServices
 004A3FBE    call        TThemeServices.GetThemesEnabled
 004A3FC3    test        al,al
>004A3FC5    je          004A3FDC
 004A3FC7    mov         eax,dword ptr [ebp+8]
 004A3FCA    mov         eax,dword ptr [eax-28]
 004A3FCD    mov         eax,dword ptr [eax+48]
 004A3FD0    mov         edx,0FF00001D
 004A3FD5    call        TBrush.SetColor
>004A3FDA    jmp         004A3FEF
 004A3FDC    mov         eax,dword ptr [ebp+8]
 004A3FDF    mov         eax,dword ptr [eax-28]
 004A3FE2    mov         eax,dword ptr [eax+48]
 004A3FE5    mov         edx,0FF00000D
 004A3FEA    call        TBrush.SetColor
 004A3FEF    mov         eax,dword ptr [ebp+8]
 004A3FF2    mov         eax,dword ptr [eax-28]
 004A3FF5    mov         eax,dword ptr [eax+40]
 004A3FF8    mov         edx,0FF00000E
 004A3FFD    call        TFont.SetColor
>004A4002    jmp         004A4020
 004A4004    mov         eax,dword ptr [ebp+8]
 004A4007    cmp         byte ptr [eax+8],0
>004A400B    je          004A4020
 004A400D    mov         eax,dword ptr [ebp+8]
 004A4010    mov         eax,dword ptr [eax-28]
 004A4013    mov         eax,dword ptr [eax+48]
 004A4016    mov         edx,0FF00001E
 004A401B    call        TBrush.SetColor
 004A4020    mov         eax,dword ptr [ebp+8]
 004A4023    cmp         byte ptr [eax-32],0
>004A4027    je          004A403E
 004A4029    mov         eax,dword ptr [ebp+8]
 004A402C    cmp         byte ptr [eax-49],0
>004A4030    je          004A404F
 004A4032    mov         eax,dword ptr [ebp+8]
 004A4035    mov         eax,dword ptr [eax-24]
 004A4038    cmp         byte ptr [eax+38],0
>004A403C    jne         004A404F
 004A403E    mov         eax,dword ptr [ebp+8]
 004A4041    lea         edx,[eax-10]
 004A4044    mov         eax,dword ptr [ebp+8]
 004A4047    mov         eax,dword ptr [eax-28]
 004A404A    mov         ecx,dword ptr [eax]
 004A404C    call        dword ptr [ecx+54]
 004A404F    mov         eax,dword ptr [ebp+8]
 004A4052    cmp         dword ptr [eax-30],0
>004A4056    je          004A4061
 004A4058    mov         eax,dword ptr [ebp+8]
 004A405B    mov         byte ptr [eax-31],0
>004A405F    jmp         004A408F
 004A4061    mov         eax,dword ptr [ebp+8]
 004A4064    mov         eax,dword ptr [eax-30]
 004A4067    mov         edx,dword ptr ds:[4A0E2C];TPopupMenu
 004A406D    call        @IsClass
 004A4072    test        al,al
>004A4074    je          004A4088
 004A4076    mov         eax,dword ptr [ebp+8]
 004A4079    mov         eax,dword ptr [eax-30]
 004A407C    movzx       eax,byte ptr [eax+68]
 004A4080    mov         edx,dword ptr [ebp+8]
 004A4083    mov         byte ptr [edx-31],al
>004A4086    jmp         004A408F
 004A4088    mov         eax,dword ptr [ebp+8]
 004A408B    mov         byte ptr [eax-31],0
 004A408F    mov         eax,dword ptr [ebp+8]
 004A4092    mov         eax,dword ptr [eax-8]
 004A4095    dec         eax
 004A4096    mov         edx,dword ptr [ebp+8]
 004A4099    mov         dword ptr [edx-18],eax
 004A409C    mov         eax,dword ptr [ebp+8]
 004A409F    mov         eax,dword ptr [eax-0C]
 004A40A2    inc         eax
 004A40A3    mov         edx,dword ptr [ebp+8]
 004A40A6    mov         dword ptr [edx-1C],eax
 004A40A9    mov         eax,dword ptr [ebp+8]
 004A40AC    mov         eax,dword ptr [eax-24]
 004A40AF    mov         eax,dword ptr [eax+34]
 004A40B2    mov         edx,4A48FC;'-'
 004A40B7    call        @UStrEqual
>004A40BC    jne         004A40F2
 004A40BE    mov         eax,dword ptr [ebp+8]
 004A40C1    lea         edx,[eax-10]
 004A40C4    mov         eax,dword ptr [ebp+8]
 004A40C7    mov         eax,dword ptr [eax-28]
 004A40CA    mov         ecx,dword ptr [eax]
 004A40CC    call        dword ptr [ecx+54]
 004A40CF    mov         eax,dword ptr [ebp+8]
 004A40D2    mov         eax,dword ptr [eax-18]
 004A40D5    add         eax,2
 004A40D8    mov         edx,dword ptr [ebp+8]
 004A40DB    mov         dword ptr [edx-20],eax
 004A40DE    mov         eax,dword ptr [ebp+8]
 004A40E1    xor         edx,edx
 004A40E3    mov         dword ptr [eax-18],edx
 004A40E6    mov         eax,dword ptr [ebp+8]
 004A40E9    mov         byte ptr [eax-4B],0
>004A40ED    jmp         004A4589
 004A40F2    mov         eax,dword ptr [ebp+8]
 004A40F5    cmp         dword ptr [eax-2C],0
>004A40F9    je          004A4142
 004A40FB    mov         eax,dword ptr [ebp+8]
 004A40FE    mov         eax,dword ptr [eax-24]
 004A4101    mov         ebx,dword ptr [eax+40]
 004A4104    cmp         ebx,0FFFFFFFF
>004A4107    jle         004A411B
 004A4109    mov         eax,dword ptr [ebp+8]
 004A410C    mov         eax,dword ptr [ebp+8]
 004A410F    mov         eax,dword ptr [eax-2C]
 004A4112    call        TCustomImageList.GetCount
 004A4117    cmp         ebx,eax
>004A4119    jl          004A4146
 004A411B    mov         eax,dword ptr [ebp+8]
 004A411E    mov         eax,dword ptr [eax-24]
 004A4121    cmp         byte ptr [eax+38],0
>004A4125    je          004A4142
 004A4127    mov         eax,dword ptr [ebp+8]
 004A412A    mov         eax,dword ptr [eax-24]
 004A412D    mov         esi,dword ptr [eax+4C]
 004A4130    test        esi,esi
>004A4132    je          004A4146
 004A4134    mov         eax,dword ptr [ebp+8]
 004A4137    mov         eax,esi
 004A4139    mov         edx,dword ptr [eax]
 004A413B    call        dword ptr [edx+20]
 004A413E    test        al,al
>004A4140    jne         004A4146
 004A4142    xor         eax,eax
>004A4144    jmp         004A4148
 004A4146    mov         al,1
 004A4148    mov         edx,dword ptr [ebp+8]
 004A414B    mov         byte ptr [edx-33],al
 004A414E    mov         eax,dword ptr [ebp+8]
 004A4151    cmp         byte ptr [eax-33],0
>004A4155    jne         004A417A
 004A4157    mov         eax,dword ptr [ebp+8]
 004A415A    mov         eax,dword ptr [eax-24]
 004A415D    mov         ebx,dword ptr [eax+4C]
 004A4160    test        ebx,ebx
>004A4162    je          004A452C
 004A4168    mov         eax,dword ptr [ebp+8]
 004A416B    mov         eax,ebx
 004A416D    mov         edx,dword ptr [eax]
 004A416F    call        dword ptr [edx+20]
 004A4172    test        al,al
>004A4174    jne         004A452C
 004A417A    mov         eax,dword ptr [ebp+8]
 004A417D    mov         byte ptr [eax-4B],1
 004A4181    mov         eax,dword ptr [ebp+8]
 004A4184    cmp         byte ptr [eax-33],0
>004A4188    je          004A41B6
 004A418A    mov         eax,dword ptr [ebp+8]
 004A418D    mov         eax,dword ptr [eax-18]
 004A4190    mov         edx,dword ptr [ebp+8]
 004A4193    mov         edx,dword ptr [edx-2C]
 004A4196    sub         eax,dword ptr [edx+38]
 004A4199    mov         edx,dword ptr [ebp+8]
 004A419C    mov         dword ptr [edx-20],eax
 004A419F    mov         eax,dword ptr [ebp+8]
 004A41A2    mov         eax,dword ptr [eax-1C]
 004A41A5    mov         edx,dword ptr [ebp+8]
 004A41A8    mov         edx,dword ptr [edx-2C]
 004A41AB    add         eax,dword ptr [edx+34]
 004A41AE    mov         edx,dword ptr [ebp+8]
 004A41B1    mov         dword ptr [edx-14],eax
>004A41B4    jmp         004A41D4
 004A41B6    mov         eax,dword ptr [ebp+8]
 004A41B9    mov         eax,dword ptr [eax-18]
 004A41BC    sub         eax,10
 004A41BF    mov         edx,dword ptr [ebp+8]
 004A41C2    mov         dword ptr [edx-20],eax
 004A41C5    mov         eax,dword ptr [ebp+8]
 004A41C8    mov         eax,dword ptr [eax-1C]
 004A41CB    add         eax,10
 004A41CE    mov         edx,dword ptr [ebp+8]
 004A41D1    mov         dword ptr [edx-14],eax
 004A41D4    mov         eax,dword ptr [ebp+8]
 004A41D7    mov         eax,dword ptr [eax-24]
 004A41DA    cmp         byte ptr [eax+38],0
>004A41DE    je          004A4299
 004A41E4    mov         eax,dword ptr [ebp+8]
 004A41E7    dec         dword ptr [eax-20]
 004A41EA    mov         eax,dword ptr [ebp+8]
 004A41ED    inc         dword ptr [eax-14]
 004A41F0    mov         eax,dword ptr [ebp+8]
 004A41F3    mov         eax,dword ptr [eax-28]
 004A41F6    mov         eax,dword ptr [eax+48]
 004A41F9    mov         eax,dword ptr [eax+10]
 004A41FC    mov         eax,dword ptr [eax+18]
 004A41FF    mov         edx,dword ptr [ebp+8]
 004A4202    mov         dword ptr [edx-50],eax
 004A4205    mov         eax,dword ptr [ebp+8]
 004A4208    test        byte ptr [eax+0C],1
>004A420C    jne         004A4255
 004A420E    mov         eax,dword ptr [ebp+8]
 004A4211    mov         eax,dword ptr [eax-28]
 004A4214    mov         eax,dword ptr [eax+48]
 004A4217    mov         eax,dword ptr [eax+10]
 004A421A    mov         eax,dword ptr [eax+18]
 004A421D    mov         edx,dword ptr [ebp+8]
 004A4220    mov         dword ptr [edx-50],eax
 004A4223    mov         edx,0FF000014
 004A4228    mov         eax,0FF00000F
 004A422D    call        AllocPatternBitmap
 004A4232    mov         edx,eax
 004A4234    mov         eax,dword ptr [ebp+8]
 004A4237    mov         eax,dword ptr [eax-28]
 004A423A    mov         eax,dword ptr [eax+48]
 004A423D    call        TBrush.SetBitmap
 004A4242    mov         eax,dword ptr [ebp+8]
 004A4245    lea         edx,[eax-20]
 004A4248    mov         eax,dword ptr [ebp+8]
 004A424B    mov         eax,dword ptr [eax-28]
 004A424E    mov         ecx,dword ptr [eax]
 004A4250    call        dword ptr [ecx+54]
>004A4253    jmp         004A4279
 004A4255    mov         eax,dword ptr [ebp+8]
 004A4258    mov         eax,dword ptr [eax-28]
 004A425B    mov         eax,dword ptr [eax+48]
 004A425E    mov         edx,0FF00000F
 004A4263    call        TBrush.SetColor
 004A4268    mov         eax,dword ptr [ebp+8]
 004A426B    lea         edx,[eax-20]
 004A426E    mov         eax,dword ptr [ebp+8]
 004A4271    mov         eax,dword ptr [eax-28]
 004A4274    mov         ecx,dword ptr [eax]
 004A4276    call        dword ptr [ecx+54]
 004A4279    mov         eax,dword ptr [ebp+8]
 004A427C    mov         edx,dword ptr [eax-50]
 004A427F    mov         eax,dword ptr [ebp+8]
 004A4282    mov         eax,dword ptr [eax-28]
 004A4285    mov         eax,dword ptr [eax+48]
 004A4288    call        TBrush.SetColor
 004A428D    mov         eax,dword ptr [ebp+8]
 004A4290    dec         dword ptr [eax-18]
 004A4293    mov         eax,dword ptr [ebp+8]
 004A4296    inc         dword ptr [eax-1C]
 004A4299    mov         eax,dword ptr [ebp+8]
 004A429C    cmp         byte ptr [eax-33],0
>004A42A0    je          004A4401
 004A42A6    mov         eax,dword ptr [ebp+8]
 004A42A9    mov         eax,dword ptr [eax-24]
 004A42AC    mov         ebx,dword ptr [eax+40]
 004A42AF    cmp         ebx,0FFFFFFFF
>004A42B2    jle         004A42FE
 004A42B4    mov         eax,dword ptr [ebp+8]
 004A42B7    mov         eax,dword ptr [ebp+8]
 004A42BA    mov         eax,dword ptr [eax-2C]
 004A42BD    call        TCustomImageList.GetCount
 004A42C2    cmp         ebx,eax
>004A42C4    jge         004A42FE
 004A42C6    mov         eax,dword ptr [ebp+8]
 004A42C9    mov         eax,dword ptr [eax-1C]
 004A42CC    push        eax
 004A42CD    mov         eax,dword ptr [ebp+8]
 004A42D0    mov         eax,dword ptr [eax-24]
 004A42D3    mov         eax,dword ptr [eax+40]
 004A42D6    push        eax
 004A42D7    mov         eax,dword ptr [ebp+8]
 004A42DA    mov         eax,dword ptr [eax-24]
 004A42DD    movzx       eax,byte ptr [eax+39]
 004A42E1    push        eax
 004A42E2    mov         eax,dword ptr [ebp+8]
 004A42E5    mov         ecx,dword ptr [eax-20]
 004A42E8    mov         eax,dword ptr [ebp+8]
 004A42EB    mov         edx,dword ptr [eax-28]
 004A42EE    mov         eax,dword ptr [ebp+8]
 004A42F1    mov         eax,dword ptr [eax-2C]
 004A42F4    call        TCustomImageList.Draw
>004A42F9    jmp         004A4512
 004A42FE    mov         dl,1
 004A4300    mov         eax,[00463B28];TBitmap
 004A4305    call        TBitmap.Create
 004A430A    mov         edx,dword ptr [ebp+8]
 004A430D    mov         dword ptr [edx-54],eax
 004A4310    xor         eax,eax
 004A4312    push        ebp
 004A4313    push        4A43FA
 004A4318    push        dword ptr fs:[eax]
 004A431B    mov         dword ptr fs:[eax],esp
 004A431E    mov         eax,dword ptr [ebp+8]
 004A4321    mov         eax,dword ptr [eax-54]
 004A4324    mov         dl,1
 004A4326    mov         ecx,dword ptr [eax]
 004A4328    call        dword ptr [ecx+40]
 004A432B    push        7FF8
 004A4330    push        0
 004A4332    call        user32.LoadBitmapW
 004A4337    mov         edx,eax
 004A4339    mov         eax,dword ptr [ebp+8]
 004A433C    mov         eax,dword ptr [eax-54]
 004A433F    call        TBitmap.SetHandle
 004A4344    mov         eax,dword ptr [ebp+8]
 004A4347    mov         eax,dword ptr [eax-28]
 004A434A    mov         eax,dword ptr [eax+40]
 004A434D    mov         eax,dword ptr [eax+18]
 004A4350    mov         edx,dword ptr [ebp+8]
 004A4353    mov         dword ptr [edx-50],eax
 004A4356    mov         eax,dword ptr [ebp+8]
 004A4359    mov         eax,dword ptr [eax-28]
 004A435C    mov         eax,dword ptr [eax+40]
 004A435F    mov         edx,0FF000012
 004A4364    call        TFont.SetColor
 004A4369    mov         eax,dword ptr [ebp+8]
 004A436C    mov         eax,dword ptr [eax-54]
 004A436F    push        eax
 004A4370    mov         eax,dword ptr [ebp+8]
 004A4373    mov         eax,dword ptr [eax-54]
 004A4376    mov         edx,dword ptr [eax]
 004A4378    call        dword ptr [edx+24]
 004A437B    mov         edx,dword ptr [ebp+8]
 004A437E    mov         edx,dword ptr [edx-14]
 004A4381    mov         ecx,dword ptr [ebp+8]
 004A4384    mov         esi,dword ptr [ecx-1C]
 004A4387    sub         edx,esi
 004A4389    sub         edx,eax
 004A438B    sar         edx,1
>004A438D    jns         004A4392
 004A438F    adc         edx,0
 004A4392    mov         eax,dword ptr [ebp+8]
 004A4395    add         edx,esi
 004A4397    inc         edx
 004A4398    push        edx
 004A4399    mov         eax,dword ptr [ebp+8]
 004A439C    mov         eax,dword ptr [eax-54]
 004A439F    mov         edx,dword ptr [eax]
 004A43A1    call        dword ptr [edx+30]
 004A43A4    mov         edx,dword ptr [ebp+8]
 004A43A7    mov         edx,dword ptr [edx-18]
 004A43AA    mov         ecx,dword ptr [ebp+8]
 004A43AD    mov         ebx,dword ptr [ecx-20]
 004A43B0    sub         edx,ebx
 004A43B2    sub         edx,eax
 004A43B4    sar         edx,1
>004A43B6    jns         004A43BB
 004A43B8    adc         edx,0
 004A43BB    mov         eax,dword ptr [ebp+8]
 004A43BE    add         edx,ebx
 004A43C0    inc         edx
 004A43C1    mov         eax,dword ptr [ebp+8]
 004A43C4    mov         eax,dword ptr [eax-28]
 004A43C7    pop         ecx
 004A43C8    mov         ebx,dword ptr [eax]
 004A43CA    call        dword ptr [ebx+44]
 004A43CD    mov         eax,dword ptr [ebp+8]
 004A43D0    mov         edx,dword ptr [eax-50]
 004A43D3    mov         eax,dword ptr [ebp+8]
 004A43D6    mov         eax,dword ptr [eax-28]
 004A43D9    mov         eax,dword ptr [eax+40]
 004A43DC    call        TFont.SetColor
 004A43E1    xor         eax,eax
 004A43E3    pop         edx
 004A43E4    pop         ecx
 004A43E5    pop         ecx
 004A43E6    mov         dword ptr fs:[eax],edx
 004A43E9    push        4A4512
 004A43EE    mov         eax,dword ptr [ebp+8]
 004A43F1    mov         eax,dword ptr [eax-54]
 004A43F4    call        TObject.Free
 004A43F9    ret
>004A43FA    jmp         @HandleFinally
>004A43FF    jmp         004A43EE
 004A4401    mov         eax,dword ptr [ebp+8]
 004A4404    mov         edx,dword ptr [ebp+8]
 004A4407    lea         esi,[eax-20]
 004A440A    lea         edi,[edx-48]
 004A440D    movs        dword ptr [edi],dword ptr [esi]
 004A440E    movs        dword ptr [edi],dword ptr [esi]
 004A440F    movs        dword ptr [edi],dword ptr [esi]
 004A4410    movs        dword ptr [edi],dword ptr [esi]
 004A4411    mov         eax,dword ptr [ebp+8]
 004A4414    mov         eax,dword ptr [eax-24]
 004A4417    mov         eax,dword ptr [eax+4C]
 004A441A    mov         edx,dword ptr [eax]
 004A441C    call        dword ptr [edx+30]
 004A441F    mov         edx,dword ptr [ebp+8]
 004A4422    mov         edx,dword ptr [edx-18]
 004A4425    mov         ecx,dword ptr [ebp+8]
 004A4428    sub         edx,dword ptr [ecx-20]
 004A442B    cmp         eax,edx
>004A442D    jge         004A447D
 004A442F    mov         eax,dword ptr [ebp+8]
 004A4432    mov         eax,dword ptr [eax-24]
 004A4435    mov         eax,dword ptr [eax+4C]
 004A4438    mov         edx,dword ptr [eax]
 004A443A    call        dword ptr [edx+30]
 004A443D    mov         edx,dword ptr [ebp+8]
 004A4440    mov         edx,dword ptr [edx-18]
 004A4443    mov         ecx,dword ptr [ebp+8]
 004A4446    sub         edx,dword ptr [ecx-20]
 004A4449    sub         edx,eax
 004A444B    sar         edx,1
>004A444D    jns         004A4452
 004A444F    adc         edx,0
 004A4452    mov         eax,dword ptr [ebp+8]
 004A4455    mov         eax,dword ptr [eax-18]
 004A4458    sub         eax,edx
 004A445A    inc         eax
 004A445B    mov         edx,dword ptr [ebp+8]
 004A445E    mov         dword ptr [edx-18],eax
 004A4461    mov         eax,dword ptr [ebp+8]
 004A4464    mov         eax,dword ptr [eax-24]
 004A4467    mov         eax,dword ptr [eax+4C]
 004A446A    mov         edx,dword ptr [eax]
 004A446C    call        dword ptr [edx+30]
 004A446F    mov         edx,dword ptr [ebp+8]
 004A4472    mov         edx,dword ptr [edx-18]
 004A4475    sub         edx,eax
 004A4477    mov         eax,dword ptr [ebp+8]
 004A447A    mov         dword ptr [eax-20],edx
 004A447D    mov         eax,dword ptr [ebp+8]
 004A4480    mov         eax,dword ptr [eax-24]
 004A4483    mov         eax,dword ptr [eax+4C]
 004A4486    mov         edx,dword ptr [eax]
 004A4488    call        dword ptr [edx+24]
 004A448B    mov         edx,dword ptr [ebp+8]
 004A448E    mov         edx,dword ptr [edx-14]
 004A4491    mov         ecx,dword ptr [ebp+8]
 004A4494    sub         edx,dword ptr [ecx-1C]
 004A4497    cmp         eax,edx
>004A4499    jge         004A44E5
 004A449B    mov         eax,dword ptr [ebp+8]
 004A449E    mov         eax,dword ptr [eax-24]
 004A44A1    mov         eax,dword ptr [eax+4C]
 004A44A4    mov         edx,dword ptr [eax]
 004A44A6    call        dword ptr [edx+24]
 004A44A9    mov         edx,dword ptr [ebp+8]
 004A44AC    mov         edx,dword ptr [edx-14]
 004A44AF    mov         ecx,dword ptr [ebp+8]
 004A44B2    sub         edx,dword ptr [ecx-1C]
 004A44B5    sub         edx,eax
 004A44B7    sar         edx,1
>004A44B9    jns         004A44BE
 004A44BB    adc         edx,0
 004A44BE    mov         eax,dword ptr [ebp+8]
 004A44C1    add         edx,dword ptr [eax-1C]
 004A44C4    inc         edx
 004A44C5    mov         eax,dword ptr [ebp+8]
 004A44C8    mov         dword ptr [eax-1C],edx
 004A44CB    mov         eax,dword ptr [ebp+8]
 004A44CE    mov         eax,dword ptr [eax-24]
 004A44D1    mov         eax,dword ptr [eax+4C]
 004A44D4    mov         edx,dword ptr [eax]
 004A44D6    call        dword ptr [edx+24]
 004A44D9    mov         edx,dword ptr [ebp+8]
 004A44DC    add         eax,dword ptr [edx-1C]
 004A44DF    mov         edx,dword ptr [ebp+8]
 004A44E2    mov         dword ptr [edx-14],eax
 004A44E5    mov         eax,dword ptr [ebp+8]
 004A44E8    mov         eax,dword ptr [eax-24]
 004A44EB    mov         ecx,dword ptr [eax+4C]
 004A44EE    mov         eax,dword ptr [ebp+8]
 004A44F1    lea         edx,[eax-20]
 004A44F4    mov         eax,dword ptr [ebp+8]
 004A44F7    mov         eax,dword ptr [eax-28]
 004A44FA    mov         ebx,dword ptr [eax]
 004A44FC    call        dword ptr [ebx+88]
 004A4502    mov         eax,dword ptr [ebp+8]
 004A4505    mov         edx,dword ptr [ebp+8]
 004A4508    lea         esi,[eax-48]
 004A450B    lea         edi,[edx-20]
 004A450E    movs        dword ptr [edi],dword ptr [esi]
 004A450F    movs        dword ptr [edi],dword ptr [esi]
 004A4510    movs        dword ptr [edi],dword ptr [esi]
 004A4511    movs        dword ptr [edi],dword ptr [esi]
 004A4512    mov         eax,dword ptr [ebp+8]
 004A4515    mov         eax,dword ptr [eax-24]
 004A4518    cmp         byte ptr [eax+38],0
>004A451C    je          004A4589
 004A451E    mov         eax,dword ptr [ebp+8]
 004A4521    dec         dword ptr [eax-18]
 004A4524    mov         eax,dword ptr [ebp+8]
 004A4527    dec         dword ptr [eax-14]
>004A452A    jmp         004A4589
 004A452C    mov         eax,dword ptr [ebp+8]
 004A452F    cmp         dword ptr [eax-2C],0
>004A4533    je          004A456A
 004A4535    mov         eax,dword ptr [ebp+8]
 004A4538    cmp         byte ptr [eax+8],0
>004A453C    jne         004A456A
 004A453E    mov         eax,dword ptr [ebp+8]
 004A4541    mov         eax,dword ptr [eax-18]
 004A4544    mov         edx,dword ptr [ebp+8]
 004A4547    mov         edx,dword ptr [edx-2C]
 004A454A    sub         eax,dword ptr [edx+38]
 004A454D    mov         edx,dword ptr [ebp+8]
 004A4550    mov         dword ptr [edx-20],eax
 004A4553    mov         eax,dword ptr [ebp+8]
 004A4556    mov         eax,dword ptr [eax-1C]
 004A4559    mov         edx,dword ptr [ebp+8]
 004A455C    mov         edx,dword ptr [edx-2C]
 004A455F    add         eax,dword ptr [edx+34]
 004A4562    mov         edx,dword ptr [ebp+8]
 004A4565    mov         dword ptr [edx-14],eax
>004A4568    jmp         004A4582
 004A456A    mov         eax,dword ptr [ebp+8]
 004A456D    mov         eax,dword ptr [eax-18]
 004A4570    mov         edx,dword ptr [ebp+8]
 004A4573    mov         dword ptr [edx-20],eax
 004A4576    mov         eax,dword ptr [ebp+8]
 004A4579    mov         eax,dword ptr [eax-1C]
 004A457C    mov         edx,dword ptr [ebp+8]
 004A457F    mov         dword ptr [edx-14],eax
 004A4582    mov         eax,dword ptr [ebp+8]
 004A4585    mov         byte ptr [eax-4B],0
 004A4589    mov         eax,dword ptr [ebp+8]
 004A458C    dec         dword ptr [eax-20]
 004A458F    mov         eax,dword ptr [ebp+8]
 004A4592    dec         dword ptr [eax-1C]
 004A4595    mov         eax,dword ptr [ebp+8]
 004A4598    add         dword ptr [eax-18],2
 004A459C    mov         eax,dword ptr [ebp+8]
 004A459F    add         dword ptr [eax-14],2
 004A45A3    mov         eax,dword ptr [ebp+8]
 004A45A6    mov         eax,dword ptr [eax-24]
 004A45A9    cmp         byte ptr [eax+38],0
>004A45AD    jne         004A45CA
 004A45AF    mov         eax,dword ptr [ebp+8]
 004A45B2    cmp         byte ptr [eax-32],0
>004A45B6    je          004A45F6
 004A45B8    mov         eax,dword ptr [ebp+8]
 004A45BB    cmp         byte ptr [eax-4B],0
>004A45BF    je          004A45F6
 004A45C1    mov         eax,dword ptr [ebp+8]
 004A45C4    cmp         byte ptr [eax-49],0
>004A45C8    jne         004A45F6
 004A45CA    push        0F
 004A45CC    mov         eax,dword ptr [ebp+8]
 004A45CF    mov         eax,dword ptr [eax-24]
 004A45D2    movzx       eax,byte ptr [eax+38]
 004A45D6    mov         eax,dword ptr [eax*4+785CD8]
 004A45DD    push        eax
 004A45DE    mov         eax,dword ptr [ebp+8]
 004A45E1    add         eax,0FFFFFFE0
 004A45E4    push        eax
 004A45E5    mov         eax,dword ptr [ebp+8]
 004A45E8    mov         eax,dword ptr [eax-28]
 004A45EB    call        TCanvas.GetHandle
 004A45F0    push        eax
 004A45F1    call        user32.DrawEdge
 004A45F6    mov         eax,dword ptr [ebp+8]
 004A45F9    cmp         byte ptr [eax-32],0
>004A45FD    je          004A464B
 004A45FF    mov         eax,dword ptr [ebp+8]
 004A4602    cmp         byte ptr [eax-4B],0
>004A4606    je          004A4615
 004A4608    mov         eax,dword ptr [ebp+8]
 004A460B    mov         eax,dword ptr [eax-20]
 004A460E    dec         eax
 004A460F    mov         edx,dword ptr [ebp+8]
 004A4612    mov         dword ptr [edx-8],eax
 004A4615    mov         eax,dword ptr [ebp+8]
 004A4618    cmp         byte ptr [eax-55],0
>004A461C    je          004A4627
 004A461E    mov         eax,dword ptr [ebp+8]
 004A4621    cmp         byte ptr [eax+8],0
>004A4625    jne         004A463A
 004A4627    mov         eax,dword ptr [ebp+8]
 004A462A    mov         eax,dword ptr [eax-28]
 004A462D    mov         eax,dword ptr [eax+48]
 004A4630    mov         edx,0FF00000D
 004A4635    call        TBrush.SetColor
 004A463A    mov         eax,dword ptr [ebp+8]
 004A463D    lea         edx,[eax-10]
 004A4640    mov         eax,dword ptr [ebp+8]
 004A4643    mov         eax,dword ptr [eax-28]
 004A4646    mov         ecx,dword ptr [eax]
 004A4648    call        dword ptr [ecx+54]
 004A464B    mov         eax,dword ptr [ebp+8]
 004A464E    cmp         byte ptr [eax+8],0
>004A4652    je          004A46D8
 004A4658    mov         eax,dword ptr [ebp+8]
 004A465B    cmp         byte ptr [eax-55],0
>004A465F    je          004A46D8
 004A4661    mov         eax,dword ptr [ebp+8]
 004A4664    cmp         byte ptr [eax-49],0
>004A4668    je          004A4673
 004A466A    mov         eax,dword ptr [ebp+8]
 004A466D    cmp         byte ptr [eax-4A],0
>004A4671    jne         004A46D8
 004A4673    mov         eax,dword ptr [ebp+8]
 004A4676    cmp         byte ptr [eax-32],0
>004A467A    je          004A469A
 004A467C    push        0F
 004A467E    push        2
 004A4680    mov         eax,dword ptr [ebp+8]
 004A4683    add         eax,0FFFFFFF0
 004A4686    push        eax
 004A4687    mov         eax,dword ptr [ebp+8]
 004A468A    mov         eax,dword ptr [eax-28]
 004A468D    call        TCanvas.GetHandle
 004A4692    push        eax
 004A4693    call        user32.DrawEdge
>004A4698    jmp         004A46BF
 004A469A    mov         eax,dword ptr [ebp+8]
 004A469D    test        byte ptr [eax+0C],40
>004A46A1    je          004A46BF
 004A46A3    push        0F
 004A46A5    push        4
 004A46A7    mov         eax,dword ptr [ebp+8]
 004A46AA    add         eax,0FFFFFFF0
 004A46AD    push        eax
 004A46AE    mov         eax,dword ptr [ebp+8]
 004A46B1    mov         eax,dword ptr [eax-28]
 004A46B4    call        TCanvas.GetHandle
 004A46B9    push        eax
 004A46BA    call        user32.DrawEdge
 004A46BF    mov         eax,dword ptr [ebp+8]
 004A46C2    cmp         byte ptr [eax-32],0
>004A46C6    jne         004A46D8
 004A46C8    mov         eax,dword ptr [ebp+8]
 004A46CB    add         eax,0FFFFFFF0
 004A46CE    or          ecx,0FFFFFFFF
 004A46D1    xor         edx,edx
 004A46D3    call        OffsetRect
 004A46D8    mov         eax,dword ptr [ebp+8]
 004A46DB    cmp         byte ptr [eax-32],0
>004A46DF    je          004A46EA
 004A46E1    mov         eax,dword ptr [ebp+8]
 004A46E4    cmp         byte ptr [eax-4B],0
>004A46E8    jne         004A46F7
 004A46EA    mov         eax,dword ptr [ebp+8]
 004A46ED    mov         eax,dword ptr [eax-20]
 004A46F0    dec         eax
 004A46F1    mov         edx,dword ptr [ebp+8]
 004A46F4    mov         dword ptr [edx-8],eax
 004A46F7    mov         eax,dword ptr [ebp+8]
 004A46FA    add         dword ptr [eax-10],2
 004A46FE    mov         eax,dword ptr [ebp+8]
 004A4701    dec         dword ptr [eax-8]
 004A4704    mov         eax,dword ptr [ebp+8]
 004A4707    movzx       eax,byte ptr [eax-31]
 004A470B    movzx       eax,word ptr [eax*2+785CD0]
 004A4713    or          ax,60
 004A4717    movzx       eax,ax
 004A471A    mov         edx,dword ptr [ebp+8]
 004A471D    mov         dword ptr [edx-38],eax
 004A4720    mov         eax,dword ptr [ebp+8]
 004A4723    cmp         byte ptr [eax-56],0
>004A4727    je          004A473C
 004A4729    mov         eax,dword ptr [ebp+8]
 004A472C    test        byte ptr [eax+0D],1
>004A4730    je          004A473C
 004A4732    mov         eax,dword ptr [ebp+8]
 004A4735    or          dword ptr [eax-38],100000
 004A473C    mov         eax,dword ptr [ebp+8]
 004A473F    mov         edx,dword ptr [ebp+8]
 004A4742    lea         esi,[eax-10]
 004A4745    lea         edi,[edx-48]
 004A4748    movs        dword ptr [edi],dword ptr [esi]
 004A4749    movs        dword ptr [edi],dword ptr [esi]
 004A474A    movs        dword ptr [edi],dword ptr [esi]
 004A474B    movs        dword ptr [edi],dword ptr [esi]
 004A474C    mov         eax,dword ptr [ebp+8]
 004A474F    test        byte ptr [eax+0C],20
>004A4753    je          004A476A
 004A4755    mov         eax,dword ptr [ebp+8]
 004A4758    mov         eax,dword ptr [eax-28]
 004A475B    mov         eax,dword ptr [eax+40]
 004A475E    movzx       edx,byte ptr ds:[4A4900]
 004A4765    call        TFont.SetStyle
 004A476A    mov         eax,dword ptr [ebp+8]
 004A476D    add         eax,0FFFFFFF0
 004A4770    push        eax
 004A4771    mov         eax,dword ptr [ebp+8]
 004A4774    movzx       eax,byte ptr [eax-32]
 004A4778    push        eax
 004A4779    mov         eax,dword ptr [ebp+8]
 004A477C    mov         eax,dword ptr [eax-38]
 004A477F    or          eax,400
 004A4784    or          eax,100
 004A4789    push        eax
 004A478A    mov         eax,dword ptr [ebp+8]
 004A478D    mov         eax,dword ptr [eax-24]
 004A4790    mov         ecx,dword ptr [eax+34]
 004A4793    mov         eax,dword ptr [ebp+8]
 004A4796    mov         edx,dword ptr [eax-28]
 004A4799    mov         eax,dword ptr [ebp+8]
 004A479C    mov         eax,dword ptr [eax-24]
 004A479F    call        TMenuItem.DoDrawText
 004A47A4    mov         eax,dword ptr [ebp+8]
 004A47A7    mov         eax,dword ptr [eax-48]
 004A47AA    mov         edx,dword ptr [ebp+8]
 004A47AD    mov         dword ptr [edx-10],eax
 004A47B0    mov         eax,dword ptr [ebp+8]
 004A47B3    mov         eax,dword ptr [eax-40]
 004A47B6    mov         edx,dword ptr [ebp+8]
 004A47B9    mov         dword ptr [edx-8],eax
 004A47BC    mov         eax,dword ptr [ebp+8]
 004A47BF    mov         ecx,dword ptr [eax-3C]
 004A47C2    mov         eax,dword ptr [ebp+8]
 004A47C5    sub         ecx,dword ptr [eax-44]
 004A47C8    mov         eax,dword ptr [ebp+8]
 004A47CB    mov         eax,dword ptr [eax-4]
 004A47CE    mov         edx,dword ptr [ebp+8]
 004A47D1    sub         eax,dword ptr [edx-0C]
 004A47D4    sub         ecx,eax
 004A47D6    sar         ecx,1
>004A47D8    jns         004A47DD
 004A47DA    adc         ecx,0
 004A47DD    mov         eax,dword ptr [ebp+8]
 004A47E0    add         eax,0FFFFFFF0
 004A47E3    xor         edx,edx
 004A47E5    call        OffsetRect
 004A47EA    mov         eax,dword ptr [ebp+8]
 004A47ED    cmp         byte ptr [eax+8],0
>004A47F1    je          004A4817
 004A47F3    mov         eax,dword ptr [ebp+8]
 004A47F6    cmp         byte ptr [eax-32],0
>004A47FA    je          004A4817
 004A47FC    mov         eax,dword ptr [ebp+8]
 004A47FF    cmp         byte ptr [eax-55],0
>004A4803    je          004A4817
 004A4805    mov         eax,dword ptr [ebp+8]
 004A4808    add         eax,0FFFFFFF0
 004A480B    xor         ecx,ecx
 004A480D    mov         edx,1
 004A4812    call        OffsetRect
 004A4817    mov         eax,dword ptr [ebp+8]
 004A481A    add         eax,0FFFFFFF0
 004A481D    push        eax
 004A481E    mov         eax,dword ptr [ebp+8]
 004A4821    movzx       eax,byte ptr [eax-32]
 004A4825    push        eax
 004A4826    mov         eax,dword ptr [ebp+8]
 004A4829    mov         eax,dword ptr [eax-38]
 004A482C    push        eax
 004A482D    mov         eax,dword ptr [ebp+8]
 004A4830    mov         eax,dword ptr [eax-24]
 004A4833    mov         ecx,dword ptr [eax+34]
 004A4836    mov         eax,dword ptr [ebp+8]
 004A4839    mov         edx,dword ptr [eax-28]
 004A483C    mov         eax,dword ptr [ebp+8]
 004A483F    mov         eax,dword ptr [eax-24]
 004A4842    call        TMenuItem.DoDrawText
 004A4847    mov         eax,dword ptr [ebp+8]
 004A484A    mov         eax,dword ptr [eax-24]
 004A484D    cmp         word ptr [eax+60],0
>004A4852    je          004A48CD
 004A4854    mov         eax,dword ptr [ebp+8]
 004A4857    cmp         byte ptr [eax+8],0
>004A485B    jne         004A48CD
 004A485D    mov         eax,dword ptr [ebp+8]
 004A4860    cmp         byte ptr [eax-57],0
>004A4864    je          004A4872
 004A4866    mov         eax,dword ptr [ebp+8]
 004A4869    mov         eax,dword ptr [eax-24]
 004A486C    cmp         dword ptr [eax+5C],0
>004A4870    jne         004A48CD
 004A4872    lea         edx,[ebp-4]
 004A4875    mov         eax,dword ptr [ebp+8]
 004A4878    mov         eax,dword ptr [eax-24]
 004A487B    movzx       eax,word ptr [eax+60]
 004A487F    call        ShortCutToText
 004A4884    mov         eax,dword ptr [ebp+8]
 004A4887    mov         dword ptr [eax-10],0A
 004A488E    mov         eax,dword ptr [ebp+8]
 004A4891    mov         eax,dword ptr [eax-28]
 004A4894    mov         edx,dword ptr [ebp-4]
 004A4897    call        TCustomCanvas.TextWidth
 004A489C    mov         edx,dword ptr [ebp+8]
 004A489F    add         eax,dword ptr [edx-10]
 004A48A2    mov         edx,dword ptr [ebp+8]
 004A48A5    mov         dword ptr [edx-8],eax
 004A48A8    mov         eax,dword ptr [ebp+8]
 004A48AB    add         eax,0FFFFFFF0
 004A48AE    push        eax
 004A48AF    mov         eax,dword ptr [ebp+8]
 004A48B2    movzx       eax,byte ptr [eax-32]
 004A48B6    push        eax
 004A48B7    push        2
 004A48B9    mov         eax,dword ptr [ebp+8]
 004A48BC    mov         edx,dword ptr [eax-28]
 004A48BF    mov         eax,dword ptr [ebp+8]
 004A48C2    mov         eax,dword ptr [eax-24]
 004A48C5    mov         ecx,dword ptr [ebp-4]
 004A48C8    call        TMenuItem.DoDrawText
 004A48CD    xor         eax,eax
 004A48CF    pop         edx
 004A48D0    pop         ecx
 004A48D1    pop         ecx
 004A48D2    mov         dword ptr fs:[eax],edx
 004A48D5    push        4A48EA
 004A48DA    lea         eax,[ebp-4]
 004A48DD    call        @UStrClr
 004A48E2    ret
>004A48E3    jmp         @HandleFinally
>004A48E8    jmp         004A48DA
 004A48EA    pop         edi
 004A48EB    pop         esi
 004A48EC    pop         ebx
 004A48ED    pop         ecx
 004A48EE    pop         ebp
 004A48EF    ret
*}
end;

//004A4904
procedure TMenuItem.AdvancedDrawItem(ACanvas:TCanvas; ARect:TRect; State:TOwnerDrawState; TopLevel:Boolean);
begin
{*
 004A4904    push        ebp
 004A4905    mov         ebp,esp
 004A4907    add         esp,0FFFFFFA8
 004A490A    push        ebx
 004A490B    push        esi
 004A490C    push        edi
 004A490D    mov         esi,ecx
 004A490F    lea         edi,[ebp-10]
 004A4912    movs        dword ptr [edi],dword ptr [esi]
 004A4913    movs        dword ptr [edi],dword ptr [esi]
 004A4914    movs        dword ptr [edi],dword ptr [esi]
 004A4915    movs        dword ptr [edi],dword ptr [esi]
 004A4916    mov         dword ptr [ebp-28],edx
 004A4919    mov         dword ptr [ebp-24],eax
 004A491C    mov         eax,dword ptr [ebp-24]
 004A491F    call        TMenuItem.GetParentMenu
 004A4924    mov         dword ptr [ebp-30],eax
 004A4927    mov         eax,dword ptr [ebp-24]
 004A492A    call        TMenuItem.GetImageList
 004A492F    mov         dword ptr [ebp-2C],eax
 004A4932    test        byte ptr [ebp+0C],1
 004A4936    setne       al
 004A4939    mov         byte ptr [ebp-32],al
 004A493C    mov         eax,[0078D080];^gvar_00784C80
 004A4941    cmp         dword ptr [eax],4
>004A4944    jg          004A495E
 004A4946    mov         eax,[0078D080];^gvar_00784C80
 004A494B    cmp         dword ptr [eax],4
>004A494E    jne         004A495A
 004A4950    mov         eax,[0078D6F0];^gvar_00784C84
 004A4955    cmp         dword ptr [eax],0
>004A4958    jg          004A495E
 004A495A    xor         eax,eax
>004A495C    jmp         004A4960
 004A495E    mov         al,1
 004A4960    mov         byte ptr [ebp-55],al
 004A4963    mov         eax,[0078D080];^gvar_00784C80
 004A4968    cmp         dword ptr [eax],4
>004A496B    jle         004A4977
 004A496D    mov         eax,[0078DB58];^gvar_00784C7C
 004A4972    cmp         dword ptr [eax],2
>004A4975    je          004A497B
 004A4977    xor         eax,eax
>004A4979    jmp         004A497D
 004A497B    mov         al,1
 004A497D    mov         byte ptr [ebp-56],al
 004A4980    mov         edx,1
 004A4985    mov         eax,5
 004A498A    call        CheckWin32Version
 004A498F    mov         byte ptr [ebp-49],al
 004A4992    cmp         byte ptr [ebp-49],0
>004A4996    je          004A49BE
 004A4998    call        ThemeServices
 004A499D    cmp         byte ptr [eax+5],0
>004A49A1    je          004A49BE
 004A49A3    push        3E9
 004A49A8    push        0
 004A49AA    mov         eax,[0078CF7C];GetThemeSysBool:function(val hTheme:Windows.THandle;val iBoolId:System.In...
 004A49AF    mov         eax,dword ptr [eax]
 004A49B1    call        eax
 004A49B3    cmp         eax,1
 004A49B6    sbb         eax,eax
 004A49B8    inc         eax
 004A49B9    mov         byte ptr [ebp-4A],al
>004A49BC    jmp         004A49C2
 004A49BE    mov         byte ptr [ebp-4A],0
 004A49C2    cmp         dword ptr [ebp-30],0
>004A49C6    je          004A4A35
 004A49C8    mov         eax,dword ptr [ebp-30]
 004A49CB    cmp         byte ptr [eax+40],0
>004A49CF    jne         004A49D7
 004A49D1    cmp         dword ptr [ebp-2C],0
>004A49D5    je          004A4A35
 004A49D7    mov         eax,dword ptr [ebp-24]
 004A49DA    cmp         word ptr [eax+9A],0
>004A49E2    jne         004A49F1
 004A49E4    mov         eax,dword ptr [ebp-24]
 004A49E7    cmp         word ptr [eax+92],0
>004A49EF    je          004A4A35
 004A49F1    movzx       eax,byte ptr [ebp-32]
 004A49F5    push        eax
 004A49F6    lea         ecx,[ebp-10]
 004A49F9    mov         edx,dword ptr [ebp-28]
 004A49FC    mov         eax,dword ptr [ebp-24]
 004A49FF    mov         ebx,dword ptr [eax]
 004A4A01    call        dword ptr [ebx+38]
 004A4A04    mov         eax,dword ptr [ebp-24]
 004A4A07    cmp         word ptr [eax+9A],0
>004A4A0F    je          004A4AA1
 004A4A15    lea         eax,[ebp-10]
 004A4A18    push        eax
 004A4A19    movzx       eax,word ptr [ebp+0C]
 004A4A1D    push        eax
 004A4A1E    mov         ebx,dword ptr [ebp-24]
 004A4A21    mov         ecx,dword ptr [ebp-28]
 004A4A24    mov         edx,dword ptr [ebp-24]
 004A4A27    mov         eax,dword ptr [ebx+9C]
 004A4A2D    call        dword ptr [ebx+98]
>004A4A33    jmp         004A4AA1
 004A4A35    xor         ebx,ebx
 004A4A37    xor         edx,edx
 004A4A39    mov         eax,6
 004A4A3E    call        CheckWin32Version
 004A4A43    mov         byte ptr [ebp-57],al
 004A4A46    cmp         byte ptr [ebp-57],0
>004A4A4A    je          004A4A5A
 004A4A4C    call        ThemeServices
 004A4A51    mov         dl,7
 004A4A53    call        TThemeServices.GetTheme
 004A4A58    mov         ebx,eax
 004A4A5A    test        ebx,ebx
>004A4A5C    je          004A4A7F
 004A4A5E    push        ebp
 004A4A5F    cmp         dword ptr [ebp-30],0
>004A4A63    je          004A4A71
 004A4A65    mov         eax,dword ptr [ebp-30]
 004A4A68    call        TMenu.IsRightToLeft
 004A4A6D    test        al,al
>004A4A6F    jne         004A4A75
 004A4A71    xor         eax,eax
>004A4A73    jmp         004A4A77
 004A4A75    mov         al,1
 004A4A77    call        VistaDraw
 004A4A7C    pop         ecx
>004A4A7D    jmp         004A4AA1
 004A4A7F    cmp         dword ptr [ebp-30],0
>004A4A83    je          004A4A9A
 004A4A85    mov         eax,dword ptr [ebp-30]
 004A4A88    call        TMenu.IsRightToLeft
 004A4A8D    test        al,al
>004A4A8F    jne         004A4A9A
 004A4A91    push        ebp
 004A4A92    call        NormalDraw
 004A4A97    pop         ecx
>004A4A98    jmp         004A4AA1
 004A4A9A    push        ebp
 004A4A9B    call        BiDiDraw
 004A4AA0    pop         ecx
 004A4AA1    pop         edi
 004A4AA2    pop         esi
 004A4AA3    pop         ebx
 004A4AA4    mov         esp,ebp
 004A4AA6    pop         ebp
 004A4AA7    ret         8
*}
end;

//004A4AAC
function TMenuItem.GetEnumerator:TMenuItemEnumerator;
begin
{*
 004A4AAC    mov         ecx,eax
 004A4AAE    mov         dl,1
 004A4AB0    mov         eax,[0049F2EC];TMenuItemEnumerator
 004A4AB5    call        TMenuItemEnumerator.Create
 004A4ABA    ret
*}
end;

//004A4ABC
function TMenuItem.GetImageList:TCustomImageList;
begin
{*
 004A4ABC    push        ebx
 004A4ABD    xor         ebx,ebx
 004A4ABF    mov         edx,dword ptr [eax+64]
>004A4AC2    jmp         004A4AC7
 004A4AC4    mov         edx,dword ptr [edx+64]
 004A4AC7    test        edx,edx
>004A4AC9    je          004A4AD1
 004A4ACB    cmp         dword ptr [edx+7C],0
>004A4ACF    je          004A4AC4
 004A4AD1    test        edx,edx
>004A4AD3    je          004A4ADA
 004A4AD5    mov         ebx,dword ptr [edx+7C]
>004A4AD8    jmp         004A4AE6
 004A4ADA    call        TMenuItem.GetParentMenu
 004A4ADF    test        eax,eax
>004A4AE1    je          004A4AE6
 004A4AE3    mov         ebx,dword ptr [eax+48]
 004A4AE6    mov         eax,ebx
 004A4AE8    pop         ebx
 004A4AE9    ret
*}
end;

//004A4AEC
procedure GetMenuSize;
begin
{*
 004A4AEC    push        ebp
 004A4AED    mov         ebp,esp
 004A4AEF    add         esp,0FFFFFE08
 004A4AF5    call        tagNONCLIENTMETRICSW.SizeOf
 004A4AFA    mov         dword ptr [ebp-1F8],eax
 004A4B00    push        0
 004A4B02    lea         eax,[ebp-1F8]
 004A4B08    push        eax
 004A4B09    push        0
 004A4B0B    push        29
 004A4B0D    call        user32.SystemParametersInfoW
 004A4B12    test        eax,eax
>004A4B14    je          004A4B32
 004A4B16    mov         eax,dword ptr [ebp+8]
 004A4B19    mov         eax,dword ptr [eax-14]
 004A4B1C    mov         edx,dword ptr [ebp-120]
 004A4B22    mov         dword ptr [eax],edx
 004A4B24    mov         eax,dword ptr [ebp+8]
 004A4B27    mov         eax,dword ptr [eax+8]
 004A4B2A    mov         edx,dword ptr [ebp-11C]
 004A4B30    mov         dword ptr [eax],edx
 004A4B32    mov         esp,ebp
 004A4B34    pop         ebp
 004A4B35    ret
*}
end;

//004A4B38
procedure MeasureVistaMenuItem;
begin
{*
 004A4B38    push        ebp
 004A4B39    mov         ebp,esp
 004A4B3B    add         esp,0FFFFFFDC
 004A4B3E    push        ebx
 004A4B3F    push        esi
 004A4B40    xor         eax,eax
 004A4B42    mov         dword ptr [ebp-24],eax
 004A4B45    mov         ebx,dword ptr [ebp+8]
 004A4B48    add         ebx,0FFFFFFE4
 004A4B4B    xor         eax,eax
 004A4B4D    push        ebp
 004A4B4E    push        4A4EF9
 004A4B53    push        dword ptr fs:[eax]
 004A4B56    mov         dword ptr fs:[eax],esp
 004A4B59    mov         eax,dword ptr [ebp+8]
 004A4B5C    mov         eax,dword ptr [eax+8]
 004A4B5F    xor         edx,edx
 004A4B61    mov         dword ptr [eax],edx
 004A4B63    mov         eax,dword ptr [ebp+8]
 004A4B66    mov         eax,dword ptr [eax-14]
 004A4B69    xor         edx,edx
 004A4B6B    mov         dword ptr [eax],edx
 004A4B6D    lea         eax,[ebp-10]
 004A4B70    push        eax
 004A4B71    push        1
 004A4B73    push        0
 004A4B75    mov         eax,dword ptr [ebx]
 004A4B77    movzx       eax,byte ptr [eax+3D]
 004A4B7B    mov         edx,dword ptr [ebx]
 004A4B7D    movzx       edx,byte ptr [edx+39]
 004A4B81    lea         edx,[edx*8+785D20]
 004A4B88    mov         eax,dword ptr [edx+eax*4]
 004A4B8B    push        eax
 004A4B8C    push        0B
 004A4B8E    mov         eax,dword ptr [ebx]
 004A4B90    call        TMenuItem.GetHandle
 004A4B95    push        eax
 004A4B96    mov         eax,dword ptr [ebp+8]
 004A4B99    mov         eax,dword ptr [eax-18]
 004A4B9C    push        eax
 004A4B9D    mov         eax,[0078D2E4];GetThemePartSize:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A4BA2    mov         eax,dword ptr [eax]
 004A4BA4    call        eax
 004A4BA6    mov         eax,dword ptr [ebp+8]
 004A4BA9    cmp         dword ptr [eax-20],0
>004A4BAD    je          004A4BC9
 004A4BAF    mov         eax,dword ptr [ebp+8]
 004A4BB2    mov         eax,dword ptr [eax-20]
 004A4BB5    mov         eax,dword ptr [eax+34]
 004A4BB8    cmp         eax,dword ptr [ebp-0C]
>004A4BBB    jle         004A4BC9
 004A4BBD    mov         eax,dword ptr [ebp+8]
 004A4BC0    mov         eax,dword ptr [eax-20]
 004A4BC3    mov         eax,dword ptr [eax+34]
 004A4BC6    mov         dword ptr [ebp-0C],eax
 004A4BC9    mov         eax,dword ptr [ebp+8]
 004A4BCC    cmp         dword ptr [eax-20],0
>004A4BD0    je          004A4BEC
 004A4BD2    mov         eax,dword ptr [ebp+8]
 004A4BD5    mov         eax,dword ptr [eax-20]
 004A4BD8    mov         eax,dword ptr [eax+38]
 004A4BDB    cmp         eax,dword ptr [ebp-10]
>004A4BDE    jle         004A4BEC
 004A4BE0    mov         eax,dword ptr [ebp+8]
 004A4BE3    mov         eax,dword ptr [eax-20]
 004A4BE6    mov         eax,dword ptr [eax+38]
 004A4BE9    mov         dword ptr [ebp-10],eax
 004A4BEC    mov         eax,dword ptr [ebp+8]
 004A4BEF    cmp         byte ptr [eax-21],0
>004A4BF3    je          004A4C4D
 004A4BF5    mov         eax,dword ptr [ebp+8]
 004A4BF8    cmp         dword ptr [eax-20],0
>004A4BFC    je          004A4C06
 004A4BFE    mov         eax,dword ptr [ebx]
 004A4C00    cmp         dword ptr [eax+40],0FFFFFFFF
>004A4C04    jne         004A4C0E
 004A4C06    mov         eax,dword ptr [ebx]
 004A4C08    cmp         dword ptr [eax+4C],0
>004A4C0C    je          004A4C19
 004A4C0E    mov         eax,dword ptr [ebp+8]
 004A4C11    mov         eax,dword ptr [eax-14]
 004A4C14    mov         edx,dword ptr [ebp-10]
 004A4C17    add         dword ptr [eax],edx
 004A4C19    lea         eax,[ebp-8]
 004A4C1C    push        eax
 004A4C1D    push        1
 004A4C1F    push        0
 004A4C21    push        1
 004A4C23    push        8
 004A4C25    mov         eax,dword ptr [ebx]
 004A4C27    call        TMenuItem.GetHandle
 004A4C2C    push        eax
 004A4C2D    mov         eax,dword ptr [ebp+8]
 004A4C30    mov         eax,dword ptr [eax-18]
 004A4C33    push        eax
 004A4C34    mov         eax,[0078D2E4];GetThemePartSize:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A4C39    mov         eax,dword ptr [eax]
 004A4C3B    call        eax
 004A4C3D    mov         eax,dword ptr [ebp+8]
 004A4C40    mov         eax,dword ptr [eax+8]
 004A4C43    mov         edx,dword ptr [ebp-4]
 004A4C46    add         dword ptr [eax],edx
>004A4C48    jmp         004A4DF8
 004A4C4D    mov         eax,dword ptr [ebp+8]
 004A4C50    mov         eax,dword ptr [eax+8]
 004A4C53    mov         edx,dword ptr [ebp-0C]
 004A4C56    add         dword ptr [eax],edx
 004A4C58    mov         eax,dword ptr [ebp+8]
 004A4C5B    mov         eax,dword ptr [eax-14]
 004A4C5E    mov         edx,dword ptr [ebp-10]
 004A4C61    add         dword ptr [eax],edx
 004A4C63    lea         eax,[ebp-20]
 004A4C66    push        eax
 004A4C67    push        0
 004A4C69    push        0E12
 004A4C6E    mov         eax,dword ptr [ebx]
 004A4C70    movzx       eax,byte ptr [eax+3D]
 004A4C74    mov         edx,dword ptr [ebx]
 004A4C76    movzx       edx,byte ptr [edx+39]
 004A4C7A    lea         edx,[edx*8+785D20]
 004A4C81    mov         eax,dword ptr [edx+eax*4]
 004A4C84    push        eax
 004A4C85    push        0B
 004A4C87    mov         eax,dword ptr [ebx]
 004A4C89    call        TMenuItem.GetHandle
 004A4C8E    push        eax
 004A4C8F    mov         eax,dword ptr [ebp+8]
 004A4C92    mov         eax,dword ptr [eax-18]
 004A4C95    push        eax
 004A4C96    mov         eax,[0078D498];^GetThemeMargins:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A4C9B    mov         eax,dword ptr [eax]
 004A4C9D    call        eax
 004A4C9F    mov         eax,dword ptr [ebp-18]
 004A4CA2    add         eax,dword ptr [ebp-14]
 004A4CA5    mov         edx,dword ptr [ebp+8]
 004A4CA8    mov         edx,dword ptr [edx+8]
 004A4CAB    add         dword ptr [edx],eax
 004A4CAD    mov         eax,dword ptr [ebp-20]
 004A4CB0    add         eax,dword ptr [ebp-1C]
 004A4CB3    mov         edx,dword ptr [ebp+8]
 004A4CB6    mov         edx,dword ptr [edx-14]
 004A4CB9    add         dword ptr [edx],eax
 004A4CBB    lea         eax,[ebp-8]
 004A4CBE    push        eax
 004A4CBF    push        1
 004A4CC1    push        0
 004A4CC3    push        0
 004A4CC5    push        0D
 004A4CC7    mov         eax,dword ptr [ebx]
 004A4CC9    call        TMenuItem.GetHandle
 004A4CCE    push        eax
 004A4CCF    mov         eax,dword ptr [ebp+8]
 004A4CD2    mov         eax,dword ptr [eax-18]
 004A4CD5    push        eax
 004A4CD6    mov         eax,[0078D2E4];GetThemePartSize:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A4CDB    mov         eax,dword ptr [eax]
 004A4CDD    call        eax
 004A4CDF    mov         eax,dword ptr [ebp+8]
 004A4CE2    mov         eax,dword ptr [eax-14]
 004A4CE5    mov         edx,dword ptr [ebp-8]
 004A4CE8    add         dword ptr [eax],edx
 004A4CEA    lea         eax,[ebp-20]
 004A4CED    push        eax
 004A4CEE    push        0
 004A4CF0    push        0E11
 004A4CF5    push        0
 004A4CF7    push        0D
 004A4CF9    mov         eax,dword ptr [ebx]
 004A4CFB    call        TMenuItem.GetHandle
 004A4D00    push        eax
 004A4D01    mov         eax,dword ptr [ebp+8]
 004A4D04    mov         eax,dword ptr [eax-18]
 004A4D07    push        eax
 004A4D08    mov         eax,[0078D498];^GetThemeMargins:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A4D0D    mov         eax,dword ptr [eax]
 004A4D0F    call        eax
 004A4D11    mov         eax,dword ptr [ebp-20]
 004A4D14    add         eax,dword ptr [ebp-1C]
 004A4D17    mov         edx,dword ptr [ebp+8]
 004A4D1A    mov         edx,dword ptr [edx-14]
 004A4D1D    add         dword ptr [edx],eax
 004A4D1F    lea         eax,[ebp-20]
 004A4D22    push        eax
 004A4D23    push        0
 004A4D25    push        0E11
 004A4D2A    push        1
 004A4D2C    push        0E
 004A4D2E    mov         eax,dword ptr [ebx]
 004A4D30    call        TMenuItem.GetHandle
 004A4D35    push        eax
 004A4D36    mov         eax,dword ptr [ebp+8]
 004A4D39    mov         eax,dword ptr [eax-18]
 004A4D3C    push        eax
 004A4D3D    mov         eax,[0078D498];^GetThemeMargins:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A4D42    mov         eax,dword ptr [eax]
 004A4D44    call        eax
 004A4D46    mov         eax,dword ptr [ebp-20]
 004A4D49    add         eax,dword ptr [ebp-1C]
 004A4D4C    mov         edx,dword ptr [ebp+8]
 004A4D4F    mov         edx,dword ptr [edx-14]
 004A4D52    add         dword ptr [edx],eax
 004A4D54    lea         eax,[ebp-8]
 004A4D57    push        eax
 004A4D58    push        1
 004A4D5A    push        0
 004A4D5C    push        1
 004A4D5E    push        10
 004A4D60    mov         eax,dword ptr [ebx]
 004A4D62    call        TMenuItem.GetHandle
 004A4D67    push        eax
 004A4D68    mov         eax,dword ptr [ebp+8]
 004A4D6B    mov         eax,dword ptr [eax-18]
 004A4D6E    push        eax
 004A4D6F    mov         eax,[0078D2E4];GetThemePartSize:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A4D74    mov         eax,dword ptr [eax]
 004A4D76    call        eax
 004A4D78    mov         eax,dword ptr [ebp+8]
 004A4D7B    mov         eax,dword ptr [eax-14]
 004A4D7E    mov         edx,dword ptr [ebp-8]
 004A4D81    add         dword ptr [eax],edx
 004A4D83    mov         eax,dword ptr [ebx]
 004A4D85    mov         eax,dword ptr [eax+34]
 004A4D88    mov         edx,4A4F14;'-'
 004A4D8D    call        @UStrEqual
>004A4D92    jne         004A4DF8
 004A4D94    lea         eax,[ebp-8]
 004A4D97    push        eax
 004A4D98    push        1
 004A4D9A    push        0
 004A4D9C    push        0
 004A4D9E    push        0F
 004A4DA0    mov         eax,dword ptr [ebx]
 004A4DA2    call        TMenuItem.GetHandle
 004A4DA7    push        eax
 004A4DA8    mov         eax,dword ptr [ebp+8]
 004A4DAB    mov         eax,dword ptr [eax-18]
 004A4DAE    push        eax
 004A4DAF    mov         eax,[0078D2E4];GetThemePartSize:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A4DB4    mov         eax,dword ptr [eax]
 004A4DB6    call        eax
 004A4DB8    lea         eax,[ebp-20]
 004A4DBB    push        eax
 004A4DBC    push        0
 004A4DBE    push        0E11
 004A4DC3    push        0
 004A4DC5    push        0F
 004A4DC7    mov         eax,dword ptr [ebx]
 004A4DC9    call        TMenuItem.GetHandle
 004A4DCE    push        eax
 004A4DCF    mov         eax,dword ptr [ebp+8]
 004A4DD2    mov         eax,dword ptr [eax-18]
 004A4DD5    push        eax
 004A4DD6    mov         eax,[0078D498];^GetThemeMargins:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 004A4DDB    mov         eax,dword ptr [eax]
 004A4DDD    call        eax
 004A4DDF    mov         eax,dword ptr [ebp-4]
 004A4DE2    add         eax,dword ptr [ebp-14]
 004A4DE5    mov         edx,dword ptr [ebp+8]
 004A4DE8    mov         edx,dword ptr [edx+8]
 004A4DEB    mov         dword ptr [edx],eax
 004A4DED    mov         eax,dword ptr [ebp+8]
 004A4DF0    mov         eax,dword ptr [eax-14]
 004A4DF3    mov         edx,dword ptr [ebp-8]
 004A4DF6    add         dword ptr [eax],edx
 004A4DF8    mov         eax,dword ptr [ebp+8]
 004A4DFB    add         eax,0FFFFFFF0
 004A4DFE    xor         ecx,ecx
 004A4E00    mov         edx,10
 004A4E05    call        @FillChar
 004A4E0A    mov         eax,dword ptr [ebp+8]
 004A4E0D    cmp         dword ptr [eax-28],0
>004A4E11    je          004A4E1C
 004A4E13    mov         eax,dword ptr [ebp+8]
 004A4E16    mov         byte ptr [eax-29],0
>004A4E1A    jmp         004A4E4A
 004A4E1C    mov         eax,dword ptr [ebp+8]
 004A4E1F    mov         eax,dword ptr [eax-28]
 004A4E22    mov         edx,dword ptr ds:[4A0E2C];TPopupMenu
 004A4E28    call        @IsClass
 004A4E2D    test        al,al
>004A4E2F    je          004A4E43
 004A4E31    mov         eax,dword ptr [ebp+8]
 004A4E34    mov         eax,dword ptr [eax-28]
 004A4E37    movzx       eax,byte ptr [eax+68]
 004A4E3B    mov         edx,dword ptr [ebp+8]
 004A4E3E    mov         byte ptr [edx-29],al
>004A4E41    jmp         004A4E4A
 004A4E43    mov         eax,dword ptr [ebp+8]
 004A4E46    mov         byte ptr [eax-29],0
 004A4E4A    mov         eax,dword ptr [ebx]
 004A4E4C    movzx       esi,word ptr [eax+60]
 004A4E50    test        si,si
>004A4E53    je          004A4E74
 004A4E55    lea         edx,[ebp-24]
 004A4E58    mov         eax,esi
 004A4E5A    call        ShortCutToText
 004A4E5F    mov         ecx,dword ptr [ebp-24]
 004A4E62    mov         eax,dword ptr [ebx]
 004A4E64    mov         edx,dword ptr [eax+34]
 004A4E67    mov         eax,dword ptr [ebp+8]
 004A4E6A    add         eax,0FFFFFFD0
 004A4E6D    call        @UStrCat3
>004A4E72    jmp         004A4E84
 004A4E74    mov         eax,dword ptr [ebp+8]
 004A4E77    add         eax,0FFFFFFD0
 004A4E7A    mov         edx,dword ptr [ebx]
 004A4E7C    mov         edx,dword ptr [edx+34]
 004A4E7F    call        @UStrLAsg
 004A4E84    mov         eax,dword ptr [ebp+8]
 004A4E87    movzx       eax,byte ptr [eax-29]
 004A4E8B    movzx       eax,word ptr [eax*2+785D18]
 004A4E93    or          ax,40
 004A4E97    or          ax,20
 004A4E9B    or          ax,100
 004A4E9F    or          ax,400
 004A4EA3    movzx       eax,ax
 004A4EA6    mov         edx,dword ptr [ebp+8]
 004A4EA9    mov         dword ptr [edx-34],eax
 004A4EAC    mov         eax,dword ptr [ebp+8]
 004A4EAF    add         eax,0FFFFFFF0
 004A4EB2    push        eax
 004A4EB3    push        0
 004A4EB5    mov         eax,dword ptr [ebp+8]
 004A4EB8    mov         eax,dword ptr [eax-34]
 004A4EBB    push        eax
 004A4EBC    mov         eax,dword ptr [ebp+8]
 004A4EBF    mov         ecx,dword ptr [eax-30]
 004A4EC2    mov         eax,dword ptr [ebp+8]
 004A4EC5    mov         edx,dword ptr [eax-38]
 004A4EC8    mov         eax,dword ptr [ebx]
 004A4ECA    call        DoDrawVistaText
 004A4ECF    mov         eax,dword ptr [ebp+8]
 004A4ED2    mov         eax,dword ptr [eax-8]
 004A4ED5    mov         edx,dword ptr [ebp+8]
 004A4ED8    sub         eax,dword ptr [edx-10]
 004A4EDB    mov         edx,dword ptr [ebp+8]
 004A4EDE    mov         edx,dword ptr [edx-14]
 004A4EE1    add         dword ptr [edx],eax
 004A4EE3    xor         eax,eax
 004A4EE5    pop         edx
 004A4EE6    pop         ecx
 004A4EE7    pop         ecx
 004A4EE8    mov         dword ptr fs:[eax],edx
 004A4EEB    push        4A4F00
 004A4EF0    lea         eax,[ebp-24]
 004A4EF3    call        @UStrClr
 004A4EF8    ret
>004A4EF9    jmp         @HandleFinally
>004A4EFE    jmp         004A4EF0
 004A4F00    pop         esi
 004A4F01    pop         ebx
 004A4F02    mov         esp,ebp
 004A4F04    pop         ebp
 004A4F05    ret
*}
end;

//004A4F18
procedure TMenuItem.MeasureItem(ACanvas:TCanvas; var Width:Integer; var Height:Integer);
begin
{*
 004A4F18    push        ebp
 004A4F19    mov         ebp,esp
 004A4F1B    add         esp,0FFFFFFC4
 004A4F1E    push        ebx
 004A4F1F    push        esi
 004A4F20    xor         ebx,ebx
 004A4F22    mov         dword ptr [ebp-3C],ebx
 004A4F25    mov         dword ptr [ebp-30],ebx
 004A4F28    mov         dword ptr [ebp-14],ecx
 004A4F2B    mov         dword ptr [ebp-38],edx
 004A4F2E    mov         dword ptr [ebp-1C],eax
 004A4F31    xor         eax,eax
 004A4F33    push        ebp
 004A4F34    push        4A5172
 004A4F39    push        dword ptr fs:[eax]
 004A4F3C    mov         dword ptr fs:[eax],esp
 004A4F3F    mov         eax,dword ptr [ebp-1C]
 004A4F42    mov         si,0FFF2
 004A4F46    call        @CallDynaInst
 004A4F4B    mov         edx,dword ptr ds:[4A09B4];TMainMenu
 004A4F51    call        @IsClass
 004A4F56    test        al,al
>004A4F58    je          004A4F67
 004A4F5A    mov         byte ptr [ebp-21],1
 004A4F5E    push        ebp
 004A4F5F    call        GetMenuSize
 004A4F64    pop         ecx
>004A4F65    jmp         004A4F6B
 004A4F67    mov         byte ptr [ebp-21],0
 004A4F6B    mov         eax,dword ptr [ebp-1C]
 004A4F6E    call        TMenuItem.GetImageList
 004A4F73    mov         dword ptr [ebp-20],eax
 004A4F76    mov         eax,dword ptr [ebp-1C]
 004A4F79    call        TMenuItem.GetParentMenu
 004A4F7E    mov         dword ptr [ebp-28],eax
 004A4F81    xor         eax,eax
 004A4F83    mov         dword ptr [ebp-18],eax
 004A4F86    xor         edx,edx
 004A4F88    mov         eax,6
 004A4F8D    call        CheckWin32Version
 004A4F92    test        al,al
>004A4F94    je          004A4FA5
 004A4F96    call        ThemeServices
 004A4F9B    mov         dl,7
 004A4F9D    call        TThemeServices.GetTheme
 004A4FA2    mov         dword ptr [ebp-18],eax
 004A4FA5    cmp         dword ptr [ebp-18],0
>004A4FA9    je          004A4FB7
 004A4FAB    push        ebp
 004A4FAC    call        MeasureVistaMenuItem
 004A4FB1    pop         ecx
>004A4FB2    jmp         004A512A
 004A4FB7    mov         eax,dword ptr [ebp-1C]
 004A4FBA    mov         eax,dword ptr [eax+34]
 004A4FBD    mov         edx,4A5190;'-'
 004A4FC2    call        @UStrEqual
>004A4FC7    jne         004A4FDF
 004A4FC9    mov         eax,dword ptr [ebp+8]
 004A4FCC    mov         dword ptr [eax],5
 004A4FD2    mov         eax,dword ptr [ebp-14]
 004A4FD5    mov         dword ptr [eax],0FFFFFFFE
 004A4FDB    xor         eax,eax
>004A4FDD    jmp         004A5050
 004A4FDF    cmp         dword ptr [ebp-20],0
>004A4FE3    je          004A5014
 004A4FE5    mov         eax,dword ptr [ebp-1C]
 004A4FE8    cmp         dword ptr [eax+40],0FFFFFFFF
>004A4FEC    jg          004A4FF4
 004A4FEE    cmp         byte ptr [ebp-21],0
>004A4FF2    jne         004A5014
 004A4FF4    mov         eax,dword ptr [ebp-20]
 004A4FF7    mov         eax,dword ptr [eax+38]
 004A4FFA    mov         edx,dword ptr [ebp-14]
 004A4FFD    mov         dword ptr [edx],eax
 004A4FFF    cmp         byte ptr [ebp-21],0
>004A5003    jne         004A5010
 004A5005    mov         eax,dword ptr [ebp-20]
 004A5008    mov         eax,dword ptr [eax+34]
 004A500B    mov         edx,dword ptr [ebp+8]
 004A500E    mov         dword ptr [edx],eax
 004A5010    mov         al,1
>004A5012    jmp         004A5050
 004A5014    mov         eax,dword ptr [ebp-1C]
 004A5017    mov         ebx,dword ptr [eax+4C]
 004A501A    test        ebx,ebx
>004A501C    je          004A5045
 004A501E    mov         eax,ebx
 004A5020    mov         edx,dword ptr [eax]
 004A5022    call        dword ptr [edx+20]
 004A5025    test        al,al
>004A5027    jne         004A5045
 004A5029    mov         eax,dword ptr [ebp-14]
 004A502C    mov         dword ptr [eax],10
 004A5032    cmp         byte ptr [ebp-21],0
>004A5036    jne         004A5041
 004A5038    mov         eax,dword ptr [ebp+8]
 004A503B    mov         dword ptr [eax],10
 004A5041    mov         al,1
>004A5043    jmp         004A5050
 004A5045    mov         eax,dword ptr [ebp-14]
 004A5048    mov         dword ptr [eax],0FFFFFFF9
 004A504E    xor         eax,eax
 004A5050    test        al,al
>004A5052    je          004A5060
 004A5054    cmp         byte ptr [ebp-21],0
>004A5058    jne         004A5060
 004A505A    mov         eax,dword ptr [ebp-14]
 004A505D    add         dword ptr [eax],0F
 004A5060    cmp         byte ptr [ebp-21],0
>004A5064    jne         004A506C
 004A5066    mov         eax,dword ptr [ebp+8]
 004A5069    add         dword ptr [eax],3
 004A506C    push        0
 004A506E    lea         eax,[ebp-10]
 004A5071    push        eax
 004A5072    xor         ecx,ecx
 004A5074    xor         edx,edx
 004A5076    xor         eax,eax
 004A5078    call        Rect
 004A507D    cmp         dword ptr [ebp-28],0
>004A5081    je          004A5089
 004A5083    mov         byte ptr [ebp-29],0
>004A5087    jmp         004A50AB
 004A5089    mov         eax,dword ptr [ebp-28]
 004A508C    mov         edx,dword ptr ds:[4A0E2C];TPopupMenu
 004A5092    call        @IsClass
 004A5097    test        al,al
>004A5099    je          004A50A7
 004A509B    mov         eax,dword ptr [ebp-28]
 004A509E    movzx       eax,byte ptr [eax+68]
 004A50A2    mov         byte ptr [ebp-29],al
>004A50A5    jmp         004A50AB
 004A50A7    mov         byte ptr [ebp-29],0
 004A50AB    mov         eax,dword ptr [ebp-1C]
 004A50AE    movzx       ebx,word ptr [eax+60]
 004A50B2    test        bx,bx
>004A50B5    je          004A50D4
 004A50B7    lea         edx,[ebp-3C]
 004A50BA    mov         eax,ebx
 004A50BC    call        ShortCutToText
 004A50C1    mov         ecx,dword ptr [ebp-3C]
 004A50C4    mov         eax,dword ptr [ebp-1C]
 004A50C7    mov         edx,dword ptr [eax+34]
 004A50CA    lea         eax,[ebp-30]
 004A50CD    call        @UStrCat3
>004A50D2    jmp         004A50E2
 004A50D4    lea         eax,[ebp-30]
 004A50D7    mov         edx,dword ptr [ebp-1C]
 004A50DA    mov         edx,dword ptr [edx+34]
 004A50DD    call        @UStrLAsg
 004A50E2    movzx       eax,byte ptr [ebp-29]
 004A50E6    movzx       eax,word ptr [eax*2+785D18]
 004A50EE    or          ax,40
 004A50F2    or          ax,20
 004A50F6    or          ax,100
 004A50FA    or          ax,400
 004A50FE    movzx       eax,ax
 004A5101    mov         dword ptr [ebp-34],eax
 004A5104    lea         eax,[ebp-10]
 004A5107    push        eax
 004A5108    push        0
 004A510A    mov         eax,dword ptr [ebp-34]
 004A510D    push        eax
 004A510E    mov         ecx,dword ptr [ebp-30]
 004A5111    mov         edx,dword ptr [ebp-38]
 004A5114    mov         eax,dword ptr [ebp-1C]
 004A5117    call        TMenuItem.DoDrawText
 004A511C    mov         eax,dword ptr [ebp-8]
 004A511F    sub         eax,dword ptr [ebp-10]
 004A5122    add         eax,7
 004A5125    mov         edx,dword ptr [ebp-14]
 004A5128    add         dword ptr [edx],eax
 004A512A    mov         eax,dword ptr [ebp-1C]
 004A512D    cmp         word ptr [eax+0A2],0
>004A5135    je          004A5154
 004A5137    mov         eax,dword ptr [ebp-14]
 004A513A    push        eax
 004A513B    mov         eax,dword ptr [ebp+8]
 004A513E    push        eax
 004A513F    mov         ebx,dword ptr [ebp-1C]
 004A5142    mov         ecx,dword ptr [ebp-38]
 004A5145    mov         edx,dword ptr [ebp-1C]
 004A5148    mov         eax,dword ptr [ebx+0A4]
 004A514E    call        dword ptr [ebx+0A0]
 004A5154    xor         eax,eax
 004A5156    pop         edx
 004A5157    pop         ecx
 004A5158    pop         ecx
 004A5159    mov         dword ptr fs:[eax],edx
 004A515C    push        4A5179
 004A5161    lea         eax,[ebp-3C]
 004A5164    call        @UStrClr
 004A5169    lea         eax,[ebp-30]
 004A516C    call        @UStrClr
 004A5171    ret
>004A5172    jmp         @HandleFinally
>004A5177    jmp         004A5161
 004A5179    pop         esi
 004A517A    pop         ebx
 004A517B    mov         esp,ebp
 004A517D    pop         ebp
 004A517E    ret         4
*}
end;

//004A5194
procedure TMenuItem.HasParent;
begin
{*
 004A5194    mov         al,1
 004A5196    ret
*}
end;

//004A5198
procedure TMenuItem.SetBreak(Value:TMenuBreak);
begin
{*
 004A5198    cmp         dl,byte ptr [eax+48]
>004A519B    je          004A51A7
 004A519D    mov         byte ptr [eax+48],dl
 004A51A0    mov         dl,1
 004A51A2    mov         ecx,dword ptr [eax]
 004A51A4    call        dword ptr [ecx+40]
 004A51A7    ret
*}
end;

//004A51A8
procedure TMenuItem.SetCaption(const Value:UnicodeString);
begin
{*
 004A51A8    push        ebx
 004A51A9    push        esi
 004A51AA    mov         esi,edx
 004A51AC    mov         ebx,eax
 004A51AE    mov         eax,dword ptr [ebx+34]
 004A51B1    mov         edx,esi
 004A51B3    call        @UStrEqual
>004A51B8    je          004A51CD
 004A51BA    lea         eax,[ebx+34]
 004A51BD    mov         edx,esi
 004A51BF    call        @UStrAsg
 004A51C4    mov         dl,1
 004A51C6    mov         eax,ebx
 004A51C8    mov         ecx,dword ptr [eax]
 004A51CA    call        dword ptr [ecx+40]
 004A51CD    pop         esi
 004A51CE    pop         ebx
 004A51CF    ret
*}
end;

//004A51D0
procedure TMenuItem.TurnSiblingsOff;
begin
{*
 004A51D0    push        ebx
 004A51D1    push        esi
 004A51D2    push        edi
 004A51D3    mov         ebx,eax
 004A51D5    mov         esi,dword ptr [ebx+64]
 004A51D8    test        esi,esi
>004A51DA    je          004A5215
 004A51DC    mov         eax,esi
 004A51DE    call        TMenuItem.GetCount
 004A51E3    dec         eax
 004A51E4    test        eax,eax
>004A51E6    jl          004A5215
 004A51E8    inc         eax
 004A51E9    mov         esi,eax
 004A51EB    xor         edi,edi
 004A51ED    mov         edx,edi
 004A51EF    mov         eax,dword ptr [ebx+64]
 004A51F2    call        TMenuItem.GetItem
 004A51F7    cmp         ebx,eax
>004A51F9    je          004A5211
 004A51FB    cmp         byte ptr [eax+3D],0
>004A51FF    je          004A5211
 004A5201    movzx       edx,byte ptr [eax+3F]
 004A5205    cmp         dl,byte ptr [ebx+3F]
>004A5208    jne         004A5211
 004A520A    xor         edx,edx
 004A520C    call        TMenuItem.SetChecked
 004A5211    inc         edi
 004A5212    dec         esi
>004A5213    jne         004A51ED
 004A5215    pop         edi
 004A5216    pop         esi
 004A5217    pop         ebx
 004A5218    ret
*}
end;

//004A521C
procedure TMenuItem.SetChecked(Value:Boolean);
begin
{*
 004A521C    push        ebx
 004A521D    push        esi
 004A521E    push        edi
 004A521F    mov         ebx,edx
 004A5221    mov         esi,eax
 004A5223    cmp         bl,byte ptr [esi+38]
>004A5226    je          004A5269
 004A5228    mov         byte ptr [esi+38],bl
 004A522B    mov         edi,dword ptr [esi+64]
 004A522E    test        edi,edi
>004A5230    je          004A5258
 004A5232    test        byte ptr [esi+1C],2
>004A5236    jne         004A5258
 004A5238    movzx       eax,bl
 004A523B    mov         eax,dword ptr [eax*4+785C60]
 004A5242    or          eax,0
 004A5245    push        eax
 004A5246    movzx       eax,word ptr [esi+50]
 004A524A    push        eax
 004A524B    mov         eax,edi
 004A524D    call        TMenuItem.GetHandle
 004A5252    push        eax
 004A5253    call        user32.CheckMenuItem
 004A5258    test        bl,bl
>004A525A    je          004A5269
 004A525C    cmp         byte ptr [esi+3D],0
>004A5260    je          004A5269
 004A5262    mov         eax,esi
 004A5264    call        TMenuItem.TurnSiblingsOff
 004A5269    pop         edi
 004A526A    pop         esi
 004A526B    pop         ebx
 004A526C    ret
*}
end;

//004A5270
procedure TMenuItem.SetEnabled(Value:Boolean);
begin
{*
 004A5270    push        ebx
 004A5271    push        esi
 004A5272    push        edi
 004A5273    mov         ebx,edx
 004A5275    mov         esi,eax
 004A5277    cmp         bl,byte ptr [esi+39]
>004A527A    je          004A52E2
 004A527C    mov         byte ptr [esi+39],bl
 004A527F    mov         eax,[0078DB58];^gvar_00784C7C
 004A5284    cmp         dword ptr [eax],2
>004A5287    jne         004A5294
 004A5289    mov         eax,esi
 004A528B    call        TMenuItem.GetCount
 004A5290    test        eax,eax
>004A5292    jne         004A52A1
 004A5294    mov         edi,dword ptr [esi+64]
 004A5297    test        edi,edi
>004A5299    je          004A52AC
 004A529B    cmp         dword ptr [edi+6C],0
>004A529F    je          004A52AC
 004A52A1    mov         dl,1
 004A52A3    mov         eax,esi
 004A52A5    mov         ecx,dword ptr [eax]
 004A52A7    call        dword ptr [ecx+40]
>004A52AA    jmp         004A52E2
 004A52AC    mov         edi,dword ptr [esi+64]
 004A52AF    test        edi,edi
>004A52B1    je          004A52D9
 004A52B3    test        byte ptr [esi+1C],2
>004A52B7    jne         004A52D9
 004A52B9    movzx       eax,bl
 004A52BC    mov         eax,dword ptr [eax*4+785C68]
 004A52C3    or          eax,0
 004A52C6    push        eax
 004A52C7    movzx       eax,word ptr [esi+50]
 004A52CB    push        eax
 004A52CC    mov         eax,edi
 004A52CE    call        TMenuItem.GetHandle
 004A52D3    push        eax
 004A52D4    call        user32.EnableMenuItem
 004A52D9    xor         edx,edx
 004A52DB    mov         eax,esi
 004A52DD    mov         ecx,dword ptr [eax]
 004A52DF    call        dword ptr [ecx+40]
 004A52E2    pop         edi
 004A52E3    pop         esi
 004A52E4    pop         ebx
 004A52E5    ret
*}
end;

//004A52E8
procedure TMenuItem.SetGroupIndex(Value:Byte);
begin
{*
 004A52E8    push        ebx
 004A52E9    push        esi
 004A52EA    push        edi
 004A52EB    mov         ebx,edx
 004A52ED    mov         esi,eax
 004A52EF    cmp         bl,byte ptr [esi+3F]
>004A52F2    je          004A5325
 004A52F4    mov         edi,dword ptr [esi+64]
 004A52F7    test        edi,edi
>004A52F9    je          004A530F
 004A52FB    mov         edx,esi
 004A52FD    mov         eax,edi
 004A52FF    call        TMenuItem.IndexOf
 004A5304    mov         edx,eax
 004A5306    mov         ecx,ebx
 004A5308    mov         eax,edi
 004A530A    call        TMenuItem.VerifyGroupIndex
 004A530F    mov         byte ptr [esi+3F],bl
 004A5312    cmp         byte ptr [esi+38],0
>004A5316    je          004A5325
 004A5318    cmp         byte ptr [esi+3D],0
>004A531C    je          004A5325
 004A531E    mov         eax,esi
 004A5320    call        TMenuItem.TurnSiblingsOff
 004A5325    pop         edi
 004A5326    pop         esi
 004A5327    pop         ebx
 004A5328    ret
*}
end;

//004A532C
function TMenuItem.GetAction:TBasicAction;
begin
{*
 004A532C    mov         edx,dword ptr [eax+44]
 004A532F    test        edx,edx
>004A5331    je          004A5337
 004A5333    mov         eax,dword ptr [edx+10]
 004A5336    ret
 004A5337    xor         eax,eax
 004A5339    ret
*}
end;

//004A533C
procedure TMenuItem.sub_004A533C;
begin
{*
 004A533C    mov         eax,[0049F1C0];TMenuActionLink
 004A5341    ret
*}
end;

//004A5344
function TMenuItem.GetCount:Integer;
begin
{*
 004A5344    mov         edx,dword ptr [eax+5C]
 004A5347    test        edx,edx
>004A5349    jne         004A534E
 004A534B    xor         eax,eax
 004A534D    ret
 004A534E    mov         eax,dword ptr [edx+8]
 004A5351    ret
*}
end;

//004A5354
function TMenuItem.GetItem(Index:Integer):TMenuItem;
begin
{*
 004A5354    push        ebx
 004A5355    push        esi
 004A5356    mov         esi,edx
 004A5358    mov         ebx,eax
 004A535A    cmp         dword ptr [ebx+5C],0
>004A535E    jne         004A536A
 004A5360    mov         eax,[0078D198];^SResString208:TResStringRec
 004A5365    call        Error
 004A536A    mov         edx,esi
 004A536C    mov         eax,dword ptr [ebx+5C]
 004A536F    call        TList.Get
 004A5374    pop         esi
 004A5375    pop         ebx
 004A5376    ret
*}
end;

//004A5378
procedure TMenuItem.SetShortCut(Value:TShortCut);
begin
{*
 004A5378    cmp         dx,word ptr [eax+60]
>004A537C    je          004A5389
 004A537E    mov         word ptr [eax+60],dx
 004A5382    mov         dl,1
 004A5384    mov         ecx,dword ptr [eax]
 004A5386    call        dword ptr [ecx+40]
 004A5389    ret
*}
end;

//004A538C
procedure TMenuItem.SetVisible(Value:Boolean);
begin
{*
 004A538C    cmp         dl,byte ptr [eax+3E]
>004A538F    je          004A539B
 004A5391    mov         byte ptr [eax+3E],dl
 004A5394    mov         dl,1
 004A5396    mov         ecx,dword ptr [eax]
 004A5398    call        dword ptr [ecx+40]
 004A539B    ret
*}
end;

//004A539C
procedure TMenuItem.SetImageIndex(Value:TImageIndex);
begin
{*
 004A539C    cmp         edx,dword ptr [eax+40]
>004A539F    je          004A53AB
 004A53A1    mov         dword ptr [eax+40],edx
 004A53A4    mov         dl,1
 004A53A6    mov         ecx,dword ptr [eax]
 004A53A8    call        dword ptr [ecx+40]
 004A53AB    ret
*}
end;

//004A53AC
function TMenuItem.GetMenuIndex:Integer;
begin
{*
 004A53AC    or          edx,0FFFFFFFF
 004A53AF    mov         ecx,dword ptr [eax+64]
 004A53B2    test        ecx,ecx
>004A53B4    je          004A53C1
 004A53B6    mov         edx,eax
 004A53B8    mov         eax,ecx
 004A53BA    call        TMenuItem.IndexOf
 004A53BF    mov         edx,eax
 004A53C1    mov         eax,edx
 004A53C3    ret
*}
end;

//004A53C4
procedure TMenuItem.SetMenuIndex(Value:Integer);
begin
{*
 004A53C4    push        ebx
 004A53C5    push        esi
 004A53C6    push        edi
 004A53C7    mov         esi,edx
 004A53C9    mov         ebx,eax
 004A53CB    mov         eax,dword ptr [ebx+64]
 004A53CE    test        eax,eax
>004A53D0    je          004A5406
 004A53D2    call        TMenuItem.GetCount
 004A53D7    test        esi,esi
>004A53D9    jge         004A53DD
 004A53DB    xor         esi,esi
 004A53DD    cmp         eax,esi
>004A53DF    jg          004A53E4
 004A53E1    mov         esi,eax
 004A53E3    dec         esi
 004A53E4    mov         eax,ebx
 004A53E6    call        TMenuItem.GetMenuIndex
 004A53EB    cmp         esi,eax
>004A53ED    je          004A5406
 004A53EF    mov         edi,dword ptr [ebx+64]
 004A53F2    mov         edx,ebx
 004A53F4    mov         eax,edi
 004A53F6    call        TMenuItem.Remove
 004A53FB    mov         ecx,ebx
 004A53FD    mov         edx,esi
 004A53FF    mov         eax,edi
 004A5401    call        TMenuItem.Insert
 004A5406    pop         edi
 004A5407    pop         esi
 004A5408    pop         ebx
 004A5409    ret
*}
end;

//004A540C
procedure TMenuItem.GetChildren(Root:TComponent; Proc:TGetChildProc);
begin
{*
 004A540C    push        ebp
 004A540D    mov         ebp,esp
 004A540F    push        ecx
 004A5410    push        ebx
 004A5411    push        esi
 004A5412    mov         dword ptr [ebp-4],eax
 004A5415    mov         eax,dword ptr [ebp-4]
 004A5418    call        TMenuItem.GetCount
 004A541D    mov         ebx,eax
 004A541F    dec         ebx
 004A5420    test        ebx,ebx
>004A5422    jl          004A543D
 004A5424    inc         ebx
 004A5425    xor         esi,esi
 004A5427    mov         edx,esi
 004A5429    mov         eax,dword ptr [ebp-4]
 004A542C    call        TMenuItem.GetItem
 004A5431    mov         edx,eax
 004A5433    mov         eax,dword ptr [ebp+0C]
 004A5436    call        dword ptr [ebp+8]
 004A5439    inc         esi
 004A543A    dec         ebx
>004A543B    jne         004A5427
 004A543D    pop         esi
 004A543E    pop         ebx
 004A543F    pop         ecx
 004A5440    pop         ebp
 004A5441    ret         8
*}
end;

//004A5444
procedure TMenuItem.SetChildOrder(Child:TComponent; Order:Integer);
begin
{*
 004A5444    push        ebx
 004A5445    push        esi
 004A5446    mov         esi,ecx
 004A5448    mov         ebx,edx
 004A544A    mov         eax,ebx
 004A544C    mov         edx,dword ptr ds:[49F488];TMenuItem
 004A5452    call        @AsClass
 004A5457    mov         edx,esi
 004A5459    call        TMenuItem.SetMenuIndex
 004A545E    pop         esi
 004A545F    pop         ebx
 004A5460    ret
*}
end;

//004A5464
procedure TMenuItem.SetDefault(Value:Boolean);
begin
{*
 004A5464    push        ebx
 004A5465    push        esi
 004A5466    push        edi
 004A5467    push        ebp
 004A5468    mov         ebx,edx
 004A546A    mov         ebp,eax
 004A546C    cmp         bl,byte ptr [ebp+3A]
>004A546F    je          004A54BB
 004A5471    test        bl,bl
>004A5473    je          004A54AF
 004A5475    cmp         dword ptr [ebp+64],0
>004A5479    je          004A54AF
 004A547B    mov         eax,dword ptr [ebp+64]
 004A547E    call        TMenuItem.GetCount
 004A5483    mov         edi,eax
 004A5485    dec         edi
 004A5486    test        edi,edi
>004A5488    jl          004A54AF
 004A548A    inc         edi
 004A548B    xor         esi,esi
 004A548D    mov         edx,esi
 004A548F    mov         eax,dword ptr [ebp+64]
 004A5492    call        TMenuItem.GetItem
 004A5497    cmp         byte ptr [eax+3A],0
>004A549B    je          004A54AB
 004A549D    mov         edx,esi
 004A549F    mov         eax,dword ptr [ebp+64]
 004A54A2    call        TMenuItem.GetItem
 004A54A7    mov         byte ptr [eax+3A],0
 004A54AB    inc         esi
 004A54AC    dec         edi
>004A54AD    jne         004A548D
 004A54AF    mov         byte ptr [ebp+3A],bl
 004A54B2    mov         dl,1
 004A54B4    mov         eax,ebp
 004A54B6    mov         ecx,dword ptr [eax]
 004A54B8    call        dword ptr [ecx+40]
 004A54BB    pop         ebp
 004A54BC    pop         edi
 004A54BD    pop         esi
 004A54BE    pop         ebx
 004A54BF    ret
*}
end;

//004A54C0
procedure TMenuItem.InitiateAction;
begin
{*
 004A54C0    mov         edx,dword ptr [eax+44]
 004A54C3    test        edx,edx
>004A54C5    je          004A54CE
 004A54C7    mov         eax,edx
 004A54C9    mov         edx,dword ptr [eax]
 004A54CB    call        dword ptr [edx+1C]
 004A54CE    ret
*}
end;

//004A54D0
procedure TMenuItem.Insert(Index:Integer; Item:TMenuItem);
begin
{*
 004A54D0    push        ebx
 004A54D1    push        esi
 004A54D2    push        edi
 004A54D3    push        ebp
 004A54D4    mov         esi,ecx
 004A54D6    mov         edi,edx
 004A54D8    mov         ebx,eax
 004A54DA    cmp         dword ptr [esi+64],0
>004A54DE    je          004A54EA
 004A54E0    mov         eax,[0078DB3C];^SResString209:TResStringRec
 004A54E5    call        Error
 004A54EA    cmp         dword ptr [ebx+5C],0
>004A54EE    jne         004A54FF
 004A54F0    mov         dl,1
 004A54F2    mov         eax,[00439644];TList
 004A54F7    call        TObject.Create
 004A54FC    mov         dword ptr [ebx+5C],eax
 004A54FF    mov         ebp,edi
 004A5501    dec         ebp
 004A5502    test        ebp,ebp
>004A5504    jl          004A5536
 004A5506    mov         eax,dword ptr [ebx+5C]
 004A5509    cmp         ebp,dword ptr [eax+8]
>004A550C    jge         004A5536
 004A550E    mov         edx,ebp
 004A5510    mov         eax,dword ptr [ebx+5C]
 004A5513    call        TList.Get
 004A5518    movzx       eax,byte ptr [eax+3F]
 004A551C    cmp         al,byte ptr [esi+3F]
>004A551F    jbe         004A5536
 004A5521    mov         edx,ebp
 004A5523    mov         eax,dword ptr [ebx+5C]
 004A5526    call        TList.Get
 004A552B    movzx       edx,byte ptr [eax+3F]
 004A552F    mov         eax,esi
 004A5531    call        TMenuItem.SetGroupIndex
 004A5536    movzx       ecx,byte ptr [esi+3F]
 004A553A    mov         edx,edi
 004A553C    mov         eax,ebx
 004A553E    call        TMenuItem.VerifyGroupIndex
 004A5543    mov         ecx,esi
 004A5545    mov         edx,edi
 004A5547    mov         eax,dword ptr [ebx+5C]
 004A554A    call        TList.Insert
 004A554F    mov         dword ptr [esi+64],ebx
 004A5552    mov         dword ptr [esi+84],ebx
 004A5558    mov         dword ptr [esi+80],4A5754;TMenuItem.SubItemChanged
 004A5562    cmp         dword ptr [ebx+0AC],0
>004A5569    je          004A5572
 004A556B    mov         eax,ebx
 004A556D    call        TMenuItem.RebuildHandle
 004A5572    mov         eax,ebx
 004A5574    call        TMenuItem.GetCount
 004A5579    dec         eax
 004A557A    sete        dl
 004A557D    mov         eax,ebx
 004A557F    mov         ecx,dword ptr [eax]
 004A5581    call        dword ptr [ecx+40]
 004A5584    pop         ebp
 004A5585    pop         edi
 004A5586    pop         esi
 004A5587    pop         ebx
 004A5588    ret
*}
end;

//004A558C
procedure TMenuItem.Delete(Index:Integer);
begin
{*
 004A558C    push        ebx
 004A558D    push        esi
 004A558E    push        edi
 004A558F    mov         esi,edx
 004A5591    mov         ebx,eax
 004A5593    test        esi,esi
>004A5595    jl          004A55A8
 004A5597    cmp         dword ptr [ebx+5C],0
>004A559B    je          004A55A8
 004A559D    mov         eax,ebx
 004A559F    call        TMenuItem.GetCount
 004A55A4    cmp         esi,eax
>004A55A6    jl          004A55B2
 004A55A8    mov         eax,[0078D198];^SResString208:TResStringRec
 004A55AD    call        Error
 004A55B2    mov         edx,esi
 004A55B4    mov         eax,dword ptr [ebx+5C]
 004A55B7    call        TList.Get
 004A55BC    mov         edi,eax
 004A55BE    mov         edx,esi
 004A55C0    mov         eax,dword ptr [ebx+5C]
 004A55C3    call        TList.Delete
 004A55C8    xor         eax,eax
 004A55CA    mov         dword ptr [edi+64],eax
 004A55CD    xor         eax,eax
 004A55CF    mov         dword ptr [edi+80],eax
 004A55D5    mov         dword ptr [edi+84],eax
 004A55DB    cmp         dword ptr [ebx+0AC],0
>004A55E2    je          004A55EB
 004A55E4    mov         eax,ebx
 004A55E6    call        TMenuItem.RebuildHandle
 004A55EB    mov         eax,ebx
 004A55ED    call        TMenuItem.GetCount
 004A55F2    test        eax,eax
 004A55F4    sete        dl
 004A55F7    mov         eax,ebx
 004A55F9    mov         ecx,dword ptr [eax]
 004A55FB    call        dword ptr [ecx+40]
 004A55FE    pop         edi
 004A55FF    pop         esi
 004A5600    pop         ebx
 004A5601    ret
*}
end;

//004A5604
procedure TMenuItem.Click;
begin
{*
 004A5604    push        ebx
 004A5605    push        esi
 004A5606    mov         ebx,eax
 004A5608    cmp         byte ptr [ebx+39],0
>004A560C    je          004A56B1
 004A5612    cmp         dword ptr [ebx+44],0
>004A5616    jne         004A5621
 004A5618    cmp         byte ptr [ebx+0A8],0
>004A561F    jne         004A563C
 004A5621    mov         esi,dword ptr [ebx+44]
 004A5624    test        esi,esi
>004A5626    je          004A564A
 004A5628    mov         eax,esi
 004A562A    mov         edx,dword ptr [eax]
 004A562C    call        dword ptr [edx+78]
 004A562F    test        al,al
>004A5631    jne         004A564A
 004A5633    cmp         byte ptr [ebx+0A8],0
>004A563A    je          004A564A
 004A563C    movzx       edx,byte ptr [ebx+38]
 004A5640    xor         dl,1
 004A5643    mov         eax,ebx
 004A5645    call        TMenuItem.SetChecked
 004A564A    cmp         word ptr [ebx+8A],0
>004A5652    je          004A5681
 004A5654    mov         eax,ebx
 004A5656    call        TMenuItem.GetAction
 004A565B    test        eax,eax
>004A565D    je          004A5681
 004A565F    mov         eax,ebx
 004A5661    call        TMenuItem.GetAction
 004A5666    mov         eax,dword ptr [eax+40]
 004A5669    cmp         eax,dword ptr [ebx+88]
>004A566F    je          004A5681
 004A5671    mov         edx,ebx
 004A5673    mov         eax,dword ptr [ebx+8C]
 004A5679    call        dword ptr [ebx+88]
>004A567F    jmp         004A56B1
 004A5681    test        byte ptr [ebx+1C],10
>004A5685    jne         004A5699
 004A5687    cmp         dword ptr [ebx+44],0
>004A568B    je          004A5699
 004A568D    mov         edx,ebx
 004A568F    mov         eax,dword ptr [ebx+44]
 004A5692    mov         ecx,dword ptr [eax]
 004A5694    call        dword ptr [ecx+18]
>004A5697    jmp         004A56B1
 004A5699    cmp         word ptr [ebx+8A],0
>004A56A1    je          004A56B1
 004A56A3    mov         edx,ebx
 004A56A5    mov         eax,dword ptr [ebx+8C]
 004A56AB    call        dword ptr [ebx+88]
 004A56B1    pop         esi
 004A56B2    pop         ebx
 004A56B3    ret
*}
end;

//004A56B4
function TMenuItem.IndexOf(Item:TMenuItem):Integer;
begin
{*
 004A56B4    push        esi
 004A56B5    or          ecx,0FFFFFFFF
 004A56B8    mov         esi,dword ptr [eax+5C]
 004A56BB    test        esi,esi
>004A56BD    je          004A56C8
 004A56BF    mov         eax,esi
 004A56C1    call        TList.IndexOf
 004A56C6    mov         ecx,eax
 004A56C8    mov         eax,ecx
 004A56CA    pop         esi
 004A56CB    ret
*}
end;

//004A56CC
procedure TMenuItem.Add(Item:TMenuItem);
begin
{*
 004A56CC    push        ebx
 004A56CD    push        esi
 004A56CE    mov         esi,edx
 004A56D0    mov         ebx,eax
 004A56D2    mov         eax,ebx
 004A56D4    call        TMenuItem.GetCount
 004A56D9    mov         edx,eax
 004A56DB    mov         ecx,esi
 004A56DD    mov         eax,ebx
 004A56DF    call        TMenuItem.Insert
 004A56E4    pop         esi
 004A56E5    pop         ebx
 004A56E6    ret
*}
end;

//004A56E8
procedure TMenuItem.Remove(Item:TMenuItem);
begin
{*
 004A56E8    push        ebx
 004A56E9    push        esi
 004A56EA    mov         ebx,eax
 004A56EC    mov         eax,ebx
 004A56EE    call        TMenuItem.IndexOf
 004A56F3    mov         esi,eax
 004A56F5    cmp         esi,0FFFFFFFF
>004A56F8    jne         004A5704
 004A56FA    mov         eax,[0078D8D8];^SResString210:TResStringRec
 004A56FF    call        Error
 004A5704    mov         edx,esi
 004A5706    mov         eax,ebx
 004A5708    call        TMenuItem.Delete
 004A570D    pop         esi
 004A570E    pop         ebx
 004A570F    ret
*}
end;

//004A5710
procedure TMenuItem.MenuChanged(Rebuild:Boolean);
begin
{*
 004A5710    push        ebx
 004A5711    push        esi
 004A5712    mov         ebx,edx
 004A5714    mov         esi,eax
 004A5716    cmp         dword ptr [esi+64],0
>004A571A    jne         004A5732
 004A571C    mov         eax,dword ptr [esi+4]
 004A571F    mov         edx,dword ptr ds:[4A02F4];TMenu
 004A5725    call        @IsClass
 004A572A    test        al,al
>004A572C    je          004A5732
 004A572E    xor         eax,eax
>004A5730    jmp         004A5734
 004A5732    mov         eax,esi
 004A5734    cmp         word ptr [esi+82],0
>004A573C    je          004A574F
 004A573E    push        ebx
 004A573F    mov         ecx,eax
 004A5741    mov         edx,esi
 004A5743    mov         eax,dword ptr [esi+84]
 004A5749    call        dword ptr [esi+80]
 004A574F    pop         esi
 004A5750    pop         ebx
 004A5751    ret
*}
end;

//004A5754
procedure TMenuItem.SubItemChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);
begin
{*
 004A5754    push        ebp
 004A5755    mov         ebp,esp
 004A5757    push        ebx
 004A5758    push        esi
 004A5759    mov         esi,ecx
 004A575B    mov         ebx,eax
 004A575D    cmp         byte ptr [ebp+8],0
>004A5761    je          004A5779
 004A5763    cmp         dword ptr [ebx+0AC],0
>004A576A    jne         004A5772
 004A576C    cmp         dword ptr [ebx+6C],0
>004A5770    je          004A5779
 004A5772    mov         eax,ebx
 004A5774    call        TMenuItem.RebuildHandle
 004A5779    mov         eax,dword ptr [ebx+64]
 004A577C    test        eax,eax
>004A577E    je          004A578D
 004A5780    push        0
 004A5782    mov         ecx,esi
 004A5784    mov         edx,ebx
 004A5786    call        TMenuItem.SubItemChanged
>004A578B    jmp         004A57A8
 004A578D    mov         esi,dword ptr [ebx+4]
 004A5790    mov         eax,esi
 004A5792    mov         edx,dword ptr ds:[4A09B4];TMainMenu
 004A5798    call        @IsClass
 004A579D    test        al,al
>004A579F    je          004A57A8
 004A57A1    mov         eax,esi
 004A57A3    call        TMainMenu.ItemChanged
 004A57A8    pop         esi
 004A57A9    pop         ebx
 004A57AA    pop         ebp
 004A57AB    ret         4
*}
end;

//004A57B0
function TMenuItem.GetBitmap:TBitmap;
begin
{*
 004A57B0    push        ebx
 004A57B1    mov         ebx,eax
 004A57B3    cmp         dword ptr [ebx+4C],0
>004A57B7    jne         004A57C8
 004A57B9    mov         dl,1
 004A57BB    mov         eax,[00463B28];TBitmap
 004A57C0    call        TBitmap.Create
 004A57C5    mov         dword ptr [ebx+4C],eax
 004A57C8    mov         dl,1
 004A57CA    mov         eax,dword ptr [ebx+4C]
 004A57CD    mov         ecx,dword ptr [eax]
 004A57CF    call        dword ptr [ecx+40]
 004A57D2    mov         eax,dword ptr [ebx+4C]
 004A57D5    pop         ebx
 004A57D6    ret
*}
end;

//004A57D8
procedure TMenuItem.SetAction(Value:TBasicAction);
begin
{*
 004A57D8    push        ebx
 004A57D9    push        esi
 004A57DA    push        edi
 004A57DB    mov         edi,edx
 004A57DD    mov         ebx,eax
 004A57DF    test        edi,edi
>004A57E1    jne         004A57F2
 004A57E3    mov         eax,dword ptr [ebx+44]
 004A57E6    call        TObject.Free
 004A57EB    xor         eax,eax
 004A57ED    mov         dword ptr [ebx+44],eax
>004A57F0    jmp         004A5841
 004A57F2    cmp         dword ptr [ebx+44],0
>004A57F6    jne         004A580D
 004A57F8    mov         eax,ebx
 004A57FA    mov         si,0FFEF
 004A57FE    call        @CallDynaInst
 004A5803    mov         ecx,ebx
 004A5805    mov         dl,1
 004A5807    call        dword ptr [eax+14]
 004A580A    mov         dword ptr [ebx+44],eax
 004A580D    mov         edx,edi
 004A580F    mov         eax,dword ptr [ebx+44]
 004A5812    mov         ecx,dword ptr [eax]
 004A5814    call        dword ptr [ecx+0C]
 004A5817    mov         eax,dword ptr [ebx+44]
 004A581A    mov         dword ptr [eax+0C],ebx
 004A581D    mov         dword ptr [eax+8],4A5A70;TMenuItem.DoActionChange
 004A5824    test        byte ptr [edi+1C],1
 004A5828    setne       cl
 004A582B    mov         edx,edi
 004A582D    mov         eax,ebx
 004A582F    mov         si,0FFF0
 004A5833    call        @CallDynaInst
 004A5838    mov         edx,ebx
 004A583A    mov         eax,edi
 004A583C    call        TComponent.FreeNotification
 004A5841    pop         edi
 004A5842    pop         esi
 004A5843    pop         ebx
 004A5844    ret
*}
end;

//004A5848
procedure TMenuItem.SetBitmap(Value:TBitmap);
begin
{*
 004A5848    push        ebx
 004A5849    push        esi
 004A584A    mov         ebx,edx
 004A584C    mov         esi,eax
 004A584E    cmp         dword ptr [esi+4C],0
>004A5852    jne         004A5863
 004A5854    mov         dl,1
 004A5856    mov         eax,[00463B28];TBitmap
 004A585B    call        TBitmap.Create
 004A5860    mov         dword ptr [esi+4C],eax
 004A5863    mov         edx,ebx
 004A5865    mov         eax,dword ptr [esi+4C]
 004A5868    mov         ecx,dword ptr [eax]
 004A586A    call        dword ptr [ecx+8]
 004A586D    mov         dl,1
 004A586F    mov         eax,esi
 004A5871    mov         ecx,dword ptr [eax]
 004A5873    call        dword ptr [ecx+40]
 004A5876    pop         esi
 004A5877    pop         ebx
 004A5878    ret
*}
end;

//004A587C
procedure TMenuItem.InitiateActions;
begin
{*
 004A587C    push        ebx
 004A587D    push        esi
 004A587E    push        edi
 004A587F    mov         edi,eax
 004A5881    mov         eax,edi
 004A5883    call        TMenuItem.GetCount
 004A5888    mov         ebx,eax
 004A588A    dec         ebx
 004A588B    test        ebx,ebx
>004A588D    jl          004A58A4
 004A588F    inc         ebx
 004A5890    xor         esi,esi
 004A5892    mov         edx,esi
 004A5894    mov         eax,edi
 004A5896    call        TMenuItem.GetItem
 004A589B    mov         edx,dword ptr [eax]
 004A589D    call        dword ptr [edx+44]
 004A58A0    inc         esi
 004A58A1    dec         ebx
>004A58A2    jne         004A5892
 004A58A4    pop         edi
 004A58A5    pop         esi
 004A58A6    pop         ebx
 004A58A7    ret
*}
end;

//004A58A8
procedure TMenuItem.GetParentComponent;
begin
{*
 004A58A8    mov         edx,dword ptr [eax+64]
 004A58AB    test        edx,edx
>004A58AD    je          004A58B9
 004A58AF    cmp         dword ptr [edx+70],0
>004A58B3    je          004A58B9
 004A58B5    mov         eax,dword ptr [edx+70]
 004A58B8    ret
 004A58B9    mov         eax,edx
 004A58BB    ret
*}
end;

//004A58BC
procedure TMenuItem.SetParentComponent(Value:TComponent);
begin
{*
 004A58BC    push        ebx
 004A58BD    push        esi
 004A58BE    mov         esi,edx
 004A58C0    mov         ebx,eax
 004A58C2    mov         eax,dword ptr [ebx+64]
 004A58C5    test        eax,eax
>004A58C7    je          004A58D0
 004A58C9    mov         edx,ebx
 004A58CB    call        TMenuItem.Remove
 004A58D0    test        esi,esi
>004A58D2    je          004A590B
 004A58D4    mov         eax,esi
 004A58D6    mov         edx,dword ptr ds:[4A02F4];TMenu
 004A58DC    call        @IsClass
 004A58E1    test        al,al
>004A58E3    je          004A58F1
 004A58E5    mov         eax,dword ptr [esi+38]
 004A58E8    mov         edx,ebx
 004A58EA    call        TMenuItem.Add
>004A58EF    jmp         004A590B
 004A58F1    mov         eax,esi
 004A58F3    mov         edx,dword ptr ds:[49F488];TMenuItem
 004A58F9    call        @IsClass
 004A58FE    test        al,al
>004A5900    je          004A590B
 004A5902    mov         edx,ebx
 004A5904    mov         eax,esi
 004A5906    call        TMenuItem.Add
 004A590B    pop         esi
 004A590C    pop         ebx
 004A590D    ret
*}
end;

//004A5910
function TMenuItem.GetParentMenu:TMenu;
begin
{*
>004A5910    jmp         004A5914
 004A5912    mov         eax,edx
 004A5914    mov         edx,dword ptr [eax+64]
 004A5917    test        edx,edx
>004A5919    jne         004A5912
 004A591B    mov         eax,dword ptr [eax+70]
 004A591E    ret
*}
end;

//004A5920
procedure TMenuItem.SetRadioItem(Value:Boolean);
begin
{*
 004A5920    push        ebx
 004A5921    mov         ebx,eax
 004A5923    cmp         dl,byte ptr [ebx+3D]
>004A5926    je          004A5947
 004A5928    mov         byte ptr [ebx+3D],dl
 004A592B    cmp         byte ptr [ebx+38],0
>004A592F    je          004A593E
 004A5931    cmp         byte ptr [ebx+3D],0
>004A5935    je          004A593E
 004A5937    mov         eax,ebx
 004A5939    call        TMenuItem.TurnSiblingsOff
 004A593E    mov         dl,1
 004A5940    mov         eax,ebx
 004A5942    mov         ecx,dword ptr [eax]
 004A5944    call        dword ptr [ecx+40]
 004A5947    pop         ebx
 004A5948    ret
*}
end;

//004A594C
procedure TMenuItem.ActionChange(Sender:TObject; CheckDefaults:Boolean);
begin
{*
 004A594C    push        ebx
 004A594D    push        esi
 004A594E    push        edi
 004A594F    mov         ebx,ecx
 004A5951    mov         edi,edx
 004A5953    mov         esi,eax
 004A5955    mov         eax,edi
 004A5957    mov         edx,dword ptr ds:[4743FC];TCustomAction
 004A595D    call        @IsClass
 004A5962    test        al,al
>004A5964    je          004A5A6A
 004A596A    test        bl,bl
>004A596C    je          004A5977
 004A596E    cmp         byte ptr [esi+0A8],0
>004A5975    jne         004A5984
 004A5977    movzx       eax,byte ptr [edi+95]
 004A597E    mov         byte ptr [esi+0A8],al
 004A5984    test        bl,bl
>004A5986    je          004A598E
 004A5988    cmp         dword ptr [esi+34],0
>004A598C    jne         004A5998
 004A598E    mov         edx,dword ptr [edi+64]
 004A5991    mov         eax,esi
 004A5993    call        TMenuItem.SetCaption
 004A5998    test        bl,bl
>004A599A    je          004A59A2
 004A599C    cmp         byte ptr [esi+38],0
>004A59A0    jne         004A59AD
 004A59A2    movzx       edx,byte ptr [edi+69]
 004A59A6    mov         eax,esi
 004A59A8    call        TMenuItem.SetChecked
 004A59AD    test        bl,bl
>004A59AF    je          004A59B7
 004A59B1    cmp         byte ptr [esi+39],1
>004A59B5    jne         004A59C2
 004A59B7    movzx       edx,byte ptr [edi+6A]
 004A59BB    mov         eax,esi
 004A59BD    call        TMenuItem.SetEnabled
 004A59C2    test        bl,bl
>004A59C4    je          004A59CC
 004A59C6    cmp         dword ptr [esi+54],0
>004A59CA    jne         004A59D2
 004A59CC    mov         eax,dword ptr [edi+74]
 004A59CF    mov         dword ptr [esi+54],eax
 004A59D2    test        bl,bl
>004A59D4    je          004A59DC
 004A59D6    cmp         dword ptr [esi+58],0
>004A59DA    jne         004A59E7
 004A59DC    lea         eax,[esi+58]
 004A59DF    mov         edx,dword ptr [edi+7C]
 004A59E2    call        @UStrAsg
 004A59E7    cmp         byte ptr [esi+3D],0
>004A59EB    je          004A5A02
 004A59ED    test        bl,bl
>004A59EF    je          004A59F7
 004A59F1    cmp         byte ptr [esi+3F],0
>004A59F5    jne         004A5A02
 004A59F7    movzx       edx,byte ptr [edi+6C]
 004A59FB    mov         eax,esi
 004A59FD    call        TMenuItem.SetGroupIndex
 004A5A02    test        bl,bl
>004A5A04    je          004A5A0C
 004A5A06    cmp         dword ptr [esi+40],0FFFFFFFF
>004A5A0A    jne         004A5A19
 004A5A0C    mov         edx,dword ptr [edi+80]
 004A5A12    mov         eax,esi
 004A5A14    call        TMenuItem.SetImageIndex
 004A5A19    test        bl,bl
>004A5A1B    je          004A5A24
 004A5A1D    cmp         word ptr [esi+60],0
>004A5A22    jne         004A5A32
 004A5A24    movzx       edx,word ptr [edi+84]
 004A5A2B    mov         eax,esi
 004A5A2D    call        TMenuItem.SetShortCut
 004A5A32    test        bl,bl
>004A5A34    je          004A5A3C
 004A5A36    cmp         byte ptr [esi+3E],1
>004A5A3A    jne         004A5A4A
 004A5A3C    movzx       edx,byte ptr [edi+86]
 004A5A43    mov         eax,esi
 004A5A45    call        TMenuItem.SetVisible
 004A5A4A    test        bl,bl
>004A5A4C    je          004A5A58
 004A5A4E    cmp         word ptr [esi+8A],0
>004A5A56    jne         004A5A6A
 004A5A58    mov         eax,dword ptr [edi+40]
 004A5A5B    mov         dword ptr [esi+88],eax
 004A5A61    mov         eax,dword ptr [edi+44]
 004A5A64    mov         dword ptr [esi+8C],eax
 004A5A6A    pop         edi
 004A5A6B    pop         esi
 004A5A6C    pop         ebx
 004A5A6D    ret
*}
end;

//004A5A70
procedure TMenuItem.DoActionChange(Sender:TObject);
begin
{*
 004A5A70    push        esi
 004A5A71    push        edi
 004A5A72    mov         edi,edx
 004A5A74    mov         esi,eax
 004A5A76    mov         eax,esi
 004A5A78    call        TMenuItem.GetAction
 004A5A7D    cmp         edi,eax
>004A5A7F    jne         004A5A90
 004A5A81    xor         ecx,ecx
 004A5A83    mov         edx,edi
 004A5A85    mov         eax,esi
 004A5A87    mov         si,0FFF0
 004A5A8B    call        @CallDynaInst
 004A5A90    pop         edi
 004A5A91    pop         esi
 004A5A92    ret
*}
end;

//004A5A94
function TMenuItem.IsCaptionStored(Value:string):Boolean;
begin
{*
 004A5A94    push        ebx
 004A5A95    push        esi
 004A5A96    mov         ebx,eax
 004A5A98    mov         esi,dword ptr [ebx+44]
 004A5A9B    test        esi,esi
>004A5A9D    je          004A5AAF
 004A5A9F    mov         eax,esi
 004A5AA1    mov         edx,dword ptr [eax]
 004A5AA3    call        dword ptr [edx+20]
 004A5AA6    test        al,al
>004A5AA8    je          004A5AAF
 004A5AAA    xor         eax,eax
 004A5AAC    pop         esi
 004A5AAD    pop         ebx
 004A5AAE    ret
 004A5AAF    mov         al,1
 004A5AB1    pop         esi
 004A5AB2    pop         ebx
 004A5AB3    ret
*}
end;

//004A5AB4
function TMenuItem.IsCheckedStored(Value:Boolean):Boolean;
begin
{*
 004A5AB4    push        ebx
 004A5AB5    push        esi
 004A5AB6    mov         ebx,eax
 004A5AB8    mov         esi,dword ptr [ebx+44]
 004A5ABB    test        esi,esi
>004A5ABD    je          004A5ACF
 004A5ABF    mov         eax,esi
 004A5AC1    mov         edx,dword ptr [eax]
 004A5AC3    call        dword ptr [edx+24]
 004A5AC6    test        al,al
>004A5AC8    je          004A5ACF
 004A5ACA    xor         eax,eax
 004A5ACC    pop         esi
 004A5ACD    pop         ebx
 004A5ACE    ret
 004A5ACF    mov         al,1
 004A5AD1    pop         esi
 004A5AD2    pop         ebx
 004A5AD3    ret
*}
end;

//004A5AD4
function TMenuItem.IsEnabledStored(Value:Boolean):Boolean;
begin
{*
 004A5AD4    push        ebx
 004A5AD5    push        esi
 004A5AD6    mov         ebx,eax
 004A5AD8    mov         esi,dword ptr [ebx+44]
 004A5ADB    test        esi,esi
>004A5ADD    je          004A5AEF
 004A5ADF    mov         eax,esi
 004A5AE1    mov         edx,dword ptr [eax]
 004A5AE3    call        dword ptr [edx+28]
 004A5AE6    test        al,al
>004A5AE8    je          004A5AEF
 004A5AEA    xor         eax,eax
 004A5AEC    pop         esi
 004A5AED    pop         ebx
 004A5AEE    ret
 004A5AEF    mov         al,1
 004A5AF1    pop         esi
 004A5AF2    pop         ebx
 004A5AF3    ret
*}
end;

//004A5AF4
function TMenuItem.IsHintStored(Value:string):Boolean;
begin
{*
 004A5AF4    push        ebx
 004A5AF5    push        esi
 004A5AF6    mov         ebx,eax
 004A5AF8    mov         esi,dword ptr [ebx+44]
 004A5AFB    test        esi,esi
>004A5AFD    je          004A5B0F
 004A5AFF    mov         eax,esi
 004A5B01    mov         edx,dword ptr [eax]
 004A5B03    call        dword ptr [edx+38]
 004A5B06    test        al,al
>004A5B08    je          004A5B0F
 004A5B0A    xor         eax,eax
 004A5B0C    pop         esi
 004A5B0D    pop         ebx
 004A5B0E    ret
 004A5B0F    mov         al,1
 004A5B11    pop         esi
 004A5B12    pop         ebx
 004A5B13    ret
*}
end;

//004A5B14
function TMenuItem.IsHelpContextStored(Value:THelpContext):Boolean;
begin
{*
 004A5B14    push        ebx
 004A5B15    push        esi
 004A5B16    mov         ebx,eax
 004A5B18    mov         esi,dword ptr [ebx+44]
 004A5B1B    test        esi,esi
>004A5B1D    je          004A5B2F
 004A5B1F    mov         eax,esi
 004A5B21    mov         edx,dword ptr [eax]
 004A5B23    call        dword ptr [edx+30]
 004A5B26    test        al,al
>004A5B28    je          004A5B2F
 004A5B2A    xor         eax,eax
 004A5B2C    pop         esi
 004A5B2D    pop         ebx
 004A5B2E    ret
 004A5B2F    mov         al,1
 004A5B31    pop         esi
 004A5B32    pop         ebx
 004A5B33    ret
*}
end;

//004A5B34
function TMenuItem.IsImageIndexStored(Value:TImageIndex):Boolean;
begin
{*
 004A5B34    push        ebx
 004A5B35    push        esi
 004A5B36    mov         ebx,eax
 004A5B38    mov         esi,dword ptr [ebx+44]
 004A5B3B    test        esi,esi
>004A5B3D    je          004A5B4F
 004A5B3F    mov         eax,esi
 004A5B41    mov         edx,dword ptr [eax]
 004A5B43    call        dword ptr [edx+3C]
 004A5B46    test        al,al
>004A5B48    je          004A5B4F
 004A5B4A    xor         eax,eax
 004A5B4C    pop         esi
 004A5B4D    pop         ebx
 004A5B4E    ret
 004A5B4F    mov         al,1
 004A5B51    pop         esi
 004A5B52    pop         ebx
 004A5B53    ret
*}
end;

//004A5B54
function TMenuItem.IsShortCutStored(Value:TShortCut):Boolean;
begin
{*
 004A5B54    push        ebx
 004A5B55    push        esi
 004A5B56    mov         ebx,eax
 004A5B58    mov         esi,dword ptr [ebx+44]
 004A5B5B    test        esi,esi
>004A5B5D    je          004A5B6F
 004A5B5F    mov         eax,esi
 004A5B61    mov         edx,dword ptr [eax]
 004A5B63    call        dword ptr [edx+40]
 004A5B66    test        al,al
>004A5B68    je          004A5B6F
 004A5B6A    xor         eax,eax
 004A5B6C    pop         esi
 004A5B6D    pop         ebx
 004A5B6E    ret
 004A5B6F    mov         al,1
 004A5B71    pop         esi
 004A5B72    pop         ebx
 004A5B73    ret
*}
end;

//004A5B74
function TMenuItem.IsVisibleStored(Value:Boolean):Boolean;
begin
{*
 004A5B74    push        ebx
 004A5B75    push        esi
 004A5B76    mov         ebx,eax
 004A5B78    mov         esi,dword ptr [ebx+44]
 004A5B7B    test        esi,esi
>004A5B7D    je          004A5B8F
 004A5B7F    mov         eax,esi
 004A5B81    mov         edx,dword ptr [eax]
 004A5B83    call        dword ptr [edx+44]
 004A5B86    test        al,al
>004A5B88    je          004A5B8F
 004A5B8A    xor         eax,eax
 004A5B8C    pop         esi
 004A5B8D    pop         ebx
 004A5B8E    ret
 004A5B8F    mov         al,1
 004A5B91    pop         esi
 004A5B92    pop         ebx
 004A5B93    ret
*}
end;

//004A5B94
function TMenuItem.IsOnClickStored(Value:TNotifyEvent):Boolean;
begin
{*
 004A5B94    push        ebx
 004A5B95    push        esi
 004A5B96    mov         ebx,eax
 004A5B98    mov         esi,dword ptr [ebx+44]
 004A5B9B    test        esi,esi
>004A5B9D    je          004A5BAF
 004A5B9F    mov         eax,esi
 004A5BA1    mov         edx,dword ptr [eax]
 004A5BA3    call        dword ptr [edx+8]
 004A5BA6    test        al,al
>004A5BA8    je          004A5BAF
 004A5BAA    xor         eax,eax
 004A5BAC    pop         esi
 004A5BAD    pop         ebx
 004A5BAE    ret
 004A5BAF    mov         al,1
 004A5BB1    pop         esi
 004A5BB2    pop         ebx
 004A5BB3    ret
*}
end;

//004A5BB4
procedure TMenuItem.AssignTo(Dest:TPersistent);
begin
{*
 004A5BB4    push        ebx
 004A5BB5    push        esi
 004A5BB6    push        edi
 004A5BB7    mov         esi,edx
 004A5BB9    mov         ebx,eax
 004A5BBB    mov         eax,esi
 004A5BBD    mov         edx,dword ptr ds:[4743FC];TCustomAction
 004A5BC3    call        @IsClass
 004A5BC8    test        al,al
>004A5BCA    je          004A5C21
 004A5BCC    movzx       edx,byte ptr [ebx+39]
 004A5BD0    mov         edi,esi
 004A5BD2    mov         eax,edi
 004A5BD4    call        TCustomAction.SetEnabled
 004A5BD9    mov         edx,dword ptr [ebx+54]
 004A5BDC    mov         eax,edi
 004A5BDE    mov         ecx,dword ptr [eax]
 004A5BE0    call        dword ptr [ecx+4C]
 004A5BE3    mov         edx,dword ptr [ebx+58]
 004A5BE6    mov         eax,edi
 004A5BE8    call        TCustomAction.SetHint
 004A5BED    mov         edx,dword ptr [ebx+40]
 004A5BF0    mov         eax,edi
 004A5BF2    call        TCustomAction.SetImageIndex
 004A5BF7    mov         edx,dword ptr [ebx+34]
 004A5BFA    mov         eax,edi
 004A5BFC    call        TCustomAction.SetCaption
 004A5C01    movzx       edx,byte ptr [ebx+3E]
 004A5C05    mov         eax,edi
 004A5C07    call        TCustomAction.SetVisible
 004A5C0C    push        dword ptr [ebx+8C]
 004A5C12    push        dword ptr [ebx+88]
 004A5C18    mov         eax,edi
 004A5C1A    mov         edx,dword ptr [eax]
 004A5C1C    call        dword ptr [edx+38]
>004A5C1F    jmp         004A5C2A
 004A5C21    mov         edx,esi
 004A5C23    mov         eax,ebx
 004A5C25    call        TPersistent.AssignTo
 004A5C2A    pop         edi
 004A5C2B    pop         esi
 004A5C2C    pop         ebx
 004A5C2D    ret
*}
end;

//004A5C30
procedure TMenuItem.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 004A5C30    push        ebx
 004A5C31    push        esi
 004A5C32    push        edi
 004A5C33    mov         ebx,ecx
 004A5C35    mov         edi,edx
 004A5C37    mov         esi,eax
 004A5C39    mov         ecx,ebx
 004A5C3B    mov         edx,edi
 004A5C3D    mov         eax,esi
 004A5C3F    call        TComponent.Notification
 004A5C44    cmp         bl,1
>004A5C47    jne         004A5C7D
 004A5C49    mov         eax,esi
 004A5C4B    call        TMenuItem.GetAction
 004A5C50    cmp         edi,eax
>004A5C52    jne         004A5C5F
 004A5C54    xor         edx,edx
 004A5C56    mov         eax,esi
 004A5C58    call        TMenuItem.SetAction
>004A5C5D    jmp         004A5C7D
 004A5C5F    cmp         edi,dword ptr [esi+7C]
>004A5C62    jne         004A5C6F
 004A5C64    xor         edx,edx
 004A5C66    mov         eax,esi
 004A5C68    call        TMenuItem.SetSubMenuImages
>004A5C6D    jmp         004A5C7D
 004A5C6F    cmp         edi,dword ptr [esi+68]
>004A5C72    jne         004A5C7D
 004A5C74    xor         edx,edx
 004A5C76    mov         eax,esi
 004A5C78    call        TMenuItem.MergeWith
 004A5C7D    pop         edi
 004A5C7E    pop         esi
 004A5C7F    pop         ebx
 004A5C80    ret
*}
end;

//004A5C84
procedure TMenuItem.SetSubMenuImages(Value:TCustomImageList);
begin
{*
 004A5C84    push        ebx
 004A5C85    push        esi
 004A5C86    mov         esi,edx
 004A5C88    mov         ebx,eax
 004A5C8A    mov         eax,dword ptr [ebx+7C]
 004A5C8D    test        eax,eax
>004A5C8F    je          004A5C99
 004A5C91    mov         edx,dword ptr [ebx+78]
 004A5C94    call        TCustomImageList.UnRegisterChanges
 004A5C99    mov         eax,esi
 004A5C9B    mov         dword ptr [ebx+7C],eax
 004A5C9E    test        eax,eax
>004A5CA0    je          004A5CB4
 004A5CA2    mov         edx,dword ptr [ebx+78]
 004A5CA5    call        TCustomImageList.RegisterChanges
 004A5CAA    mov         edx,ebx
 004A5CAC    mov         eax,dword ptr [ebx+7C]
 004A5CAF    call        TComponent.FreeNotification
 004A5CB4    mov         eax,ebx
 004A5CB6    call        TMenuItem.UpdateItems
 004A5CBB    pop         esi
 004A5CBC    pop         ebx
 004A5CBD    ret
*}
end;

//004A5CC0
procedure TMenuItem.ImageListChange(Sender:TObject);
begin
{*
 004A5CC0    cmp         edx,dword ptr [eax+7C]
>004A5CC3    jne         004A5CCA
 004A5CC5    call        TMenuItem.UpdateItems
 004A5CCA    ret
*}
end;

//004A5CCC
function UpdateItem(MenuItem:TMenuItem):Boolean;
begin
{*
 004A5CCC    push        ebx
 004A5CCD    push        esi
 004A5CCE    mov         esi,eax
 004A5CD0    xor         ebx,ebx
 004A5CD2    mov         eax,4A5CCC;UpdateItem:Boolean
 004A5CD7    mov         ecx,esi
 004A5CD9    mov         edx,dword ptr [esi+68]
 004A5CDC    call        IterateMenus
 004A5CE1    push        1
 004A5CE3    mov         ecx,esi
 004A5CE5    mov         edx,esi
 004A5CE7    mov         eax,esi
 004A5CE9    call        TMenuItem.SubItemChanged
 004A5CEE    mov         eax,ebx
 004A5CF0    pop         esi
 004A5CF1    pop         ebx
 004A5CF2    ret
*}
end;

//004A5CF4
procedure TMenuItem.UpdateItems;
begin
{*
 004A5CF4    mov         edx,4A5CCC;UpdateItem:Boolean
 004A5CF9    mov         ecx,eax
 004A5CFB    mov         eax,dword ptr [eax+68]
 004A5CFE    xchg        eax,edx
 004A5CFF    call        IterateMenus
 004A5D04    ret
*}
end;

//004A5D08
procedure TMenuItem.Add(const AItems:array[$0..-$1] of TMenuItem; const _Dv_:$0..-$1);
begin
{*
 004A5D08    push        ebx
 004A5D09    push        esi
 004A5D0A    push        edi
 004A5D0B    mov         edi,eax
 004A5D0D    mov         esi,ecx
 004A5D0F    test        esi,esi
>004A5D11    jl          004A5D25
 004A5D13    inc         esi
 004A5D14    mov         ebx,edx
 004A5D16    mov         edx,dword ptr [ebx]
 004A5D18    mov         eax,edi
 004A5D1A    call        TMenuItem.Add
 004A5D1F    add         ebx,4
 004A5D22    dec         esi
>004A5D23    jne         004A5D16
 004A5D25    pop         edi
 004A5D26    pop         esi
 004A5D27    pop         ebx
 004A5D28    ret
*}
end;

//004A5D2C
procedure TMenuItem.Clear;
begin
{*
 004A5D2C    push        ebx
 004A5D2D    push        esi
 004A5D2E    mov         esi,eax
 004A5D30    mov         eax,esi
 004A5D32    call        TMenuItem.GetCount
 004A5D37    mov         ebx,eax
 004A5D39    dec         ebx
 004A5D3A    cmp         ebx,0
>004A5D3D    jl          004A5D53
 004A5D3F    mov         edx,ebx
 004A5D41    mov         eax,esi
 004A5D43    call        TMenuItem.GetItem
 004A5D48    call        TObject.Free
 004A5D4D    dec         ebx
 004A5D4E    cmp         ebx,0FFFFFFFF
>004A5D51    jne         004A5D3F
 004A5D53    pop         esi
 004A5D54    pop         ebx
 004A5D55    ret
*}
end;

//004A5D58
function IfHotkeyAvailable(const AHotkey:UnicodeString):Boolean;
begin
{*
 004A5D58    push        ebp
 004A5D59    mov         ebp,esp
 004A5D5B    push        ebx
 004A5D5C    mov         edx,dword ptr [ebp+8]
 004A5D5F    mov         edx,dword ptr [edx-4]
 004A5D62    call        Pos
 004A5D67    test        eax,eax
 004A5D69    setne       bl
 004A5D6C    test        bl,bl
>004A5D6E    je          004A5D81
 004A5D70    mov         edx,dword ptr [ebp+8]
 004A5D73    add         edx,0FFFFFFFC
 004A5D76    mov         ecx,1
 004A5D7B    xchg        eax,edx
 004A5D7C    call        @UStrDelete
 004A5D81    mov         eax,ebx
 004A5D83    pop         ebx
 004A5D84    pop         ebp
 004A5D85    ret
*}
end;

//004A5D88
procedure CopyToBest;
begin
{*
 004A5D88    push        ebp
 004A5D89    mov         ebp,esp
 004A5D8B    push        ebx
 004A5D8C    push        esi
 004A5D8D    push        edi
 004A5D8E    mov         eax,dword ptr [ebp+8]
 004A5D91    mov         edx,dword ptr [eax-0C]
 004A5D94    mov         eax,dword ptr [ebp+8]
 004A5D97    mov         eax,dword ptr [eax-8]
 004A5D9A    mov         ecx,dword ptr [eax]
 004A5D9C    call        dword ptr [ecx+8]
 004A5D9F    mov         eax,dword ptr [ebp+8]
 004A5DA2    mov         eax,dword ptr [eax-0C]
 004A5DA5    mov         edx,dword ptr [eax]
 004A5DA7    call        dword ptr [edx+14]
 004A5DAA    mov         edx,dword ptr [ebp+8]
 004A5DAD    mov         dword ptr [edx-10],eax
 004A5DB0    mov         eax,dword ptr [ebp+8]
 004A5DB3    mov         eax,dword ptr [eax-14]
 004A5DB6    mov         edx,dword ptr [eax]
 004A5DB8    call        dword ptr [edx+14]
 004A5DBB    mov         esi,eax
 004A5DBD    dec         esi
 004A5DBE    test        esi,esi
>004A5DC0    jl          004A5DF3
 004A5DC2    inc         esi
 004A5DC3    xor         ebx,ebx
 004A5DC5    mov         eax,dword ptr [ebp+8]
 004A5DC8    mov         eax,dword ptr [eax-14]
 004A5DCB    mov         edx,ebx
 004A5DCD    mov         ecx,dword ptr [eax]
 004A5DCF    call        dword ptr [ecx+18]
 004A5DD2    push        eax
 004A5DD3    mov         eax,dword ptr [ebp+8]
 004A5DD6    mov         eax,dword ptr [eax-14]
 004A5DD9    mov         edx,ebx
 004A5DDB    mov         ecx,dword ptr [eax]
 004A5DDD    call        dword ptr [ecx+18]
 004A5DE0    mov         edx,dword ptr [eax+34]
 004A5DE3    mov         eax,dword ptr [ebp+8]
 004A5DE6    mov         eax,dword ptr [eax-8]
 004A5DE9    pop         ecx
 004A5DEA    mov         edi,dword ptr [eax]
 004A5DEC    call        dword ptr [edi+3C]
 004A5DEF    inc         ebx
 004A5DF0    dec         esi
>004A5DF1    jne         004A5DC5
 004A5DF3    mov         eax,dword ptr [ebp+8]
 004A5DF6    add         eax,0FFFFFFE8
 004A5DF9    mov         edx,dword ptr [ebp+8]
 004A5DFC    mov         edx,dword ptr [edx-4]
 004A5DFF    call        @UStrLAsg
 004A5E04    pop         edi
 004A5E05    pop         esi
 004A5E06    pop         ebx
 004A5E07    pop         ebp
 004A5E08    ret
*}
end;

//004A5E0C
procedure InsertHotkeyFarEastFormat(var ACaption:UnicodeString; const AHotKey:UnicodeString; AColumn:Integer);
begin
{*
 004A5E0C    push        ebp
 004A5E0D    mov         ebp,esp
 004A5E0F    add         esp,0FFFFFFE8
 004A5E12    push        ebx
 004A5E13    push        esi
 004A5E14    push        edi
 004A5E15    xor         ebx,ebx
 004A5E17    mov         dword ptr [ebp-18],ebx
 004A5E1A    mov         dword ptr [ebp-14],ebx
 004A5E1D    mov         dword ptr [ebp-0C],ecx
 004A5E20    mov         dword ptr [ebp-8],edx
 004A5E23    mov         dword ptr [ebp-4],eax
 004A5E26    xor         eax,eax
 004A5E28    push        ebp
 004A5E29    push        4A5F64
 004A5E2E    push        dword ptr fs:[eax]
 004A5E31    mov         dword ptr fs:[eax],esp
 004A5E34    xor         ebx,ebx
 004A5E36    mov         eax,dword ptr [ebp-4]
 004A5E39    mov         eax,dword ptr [eax]
 004A5E3B    mov         dword ptr [ebp-10],eax
 004A5E3E    mov         eax,dword ptr [ebp-10]
 004A5E41    test        eax,eax
>004A5E43    je          004A5E4A
 004A5E45    sub         eax,4
 004A5E48    mov         eax,dword ptr [eax]
 004A5E4A    mov         edi,eax
 004A5E4C    test        edi,edi
>004A5E4E    jle         004A5E74
 004A5E50    mov         esi,1
 004A5E55    mov         eax,dword ptr [ebp-4]
 004A5E58    mov         eax,dword ptr [eax]
 004A5E5A    movzx       eax,word ptr [eax+esi*2-2]
 004A5E5F    call        TCharacter.GetUnicodeCategory
 004A5E64    cmp         al,7
>004A5E66    je          004A5E6C
 004A5E68    cmp         al,0F
>004A5E6A    jne         004A5E70
 004A5E6C    mov         bl,1
>004A5E6E    jmp         004A5E74
 004A5E70    inc         esi
 004A5E71    dec         edi
>004A5E72    jne         004A5E55
 004A5E74    test        bl,bl
>004A5E76    je          004A5F33
 004A5E7C    mov         eax,dword ptr [ebp-4]
 004A5E7F    mov         eax,dword ptr [eax]
 004A5E81    mov         dword ptr [ebp-10],eax
 004A5E84    mov         ebx,dword ptr [ebp-10]
 004A5E87    test        ebx,ebx
>004A5E89    je          004A5E90
 004A5E8B    sub         ebx,4
 004A5E8E    mov         ebx,dword ptr [ebx]
 004A5E90    lea         eax,[ebp-14]
 004A5E93    push        eax
 004A5E94    mov         edx,ebx
 004A5E96    sub         edx,3
 004A5E99    inc         edx
 004A5E9A    mov         eax,dword ptr [ebp-4]
 004A5E9D    mov         eax,dword ptr [eax]
 004A5E9F    mov         ecx,3
 004A5EA4    call        @UStrCopy
 004A5EA9    mov         eax,dword ptr [ebp-14]
 004A5EAC    mov         edx,4A5F80;'...'
 004A5EB1    call        @UStrEqual
>004A5EB6    jne         004A5F0D
 004A5EB8    mov         eax,dword ptr [ebp-4]
 004A5EBB    mov         eax,dword ptr [eax]
 004A5EBD    mov         dword ptr [ebp-10],eax
 004A5EC0    mov         ebx,dword ptr [ebp-10]
 004A5EC3    test        ebx,ebx
>004A5EC5    je          004A5ECC
 004A5EC7    sub         ebx,4
 004A5ECA    mov         ebx,dword ptr [ebx]
 004A5ECC    lea         eax,[ebp-18]
 004A5ECF    push        eax
 004A5ED0    mov         ecx,ebx
 004A5ED2    sub         ecx,3
 004A5ED5    mov         eax,dword ptr [ebp-4]
 004A5ED8    mov         eax,dword ptr [eax]
 004A5EDA    mov         edx,1
 004A5EDF    call        @UStrCopy
 004A5EE4    push        dword ptr [ebp-18]
 004A5EE7    push        4A5F94;'('
 004A5EEC    push        4A5FA4;'&'
 004A5EF1    push        dword ptr [ebp-8]
 004A5EF4    push        4A5FB4;')'
 004A5EF9    push        4A5F80;'...'
 004A5EFE    mov         eax,dword ptr [ebp-4]
 004A5F01    mov         edx,6
 004A5F06    call        @UStrCatN
>004A5F0B    jmp         004A5F49
 004A5F0D    mov         eax,dword ptr [ebp-4]
 004A5F10    push        dword ptr [eax]
 004A5F12    push        4A5F94;'('
 004A5F17    push        4A5FA4;'&'
 004A5F1C    push        dword ptr [ebp-8]
 004A5F1F    push        4A5FB4;')'
 004A5F24    mov         eax,dword ptr [ebp-4]
 004A5F27    mov         edx,5
 004A5F2C    call        @UStrCatN
>004A5F31    jmp         004A5F49
 004A5F33    cmp         dword ptr [ebp-0C],0
>004A5F37    je          004A5F49
 004A5F39    mov         edx,dword ptr [ebp-4]
 004A5F3C    mov         ecx,dword ptr [ebp-0C]
 004A5F3F    mov         eax,4A5FA4;'&'
 004A5F44    call        @UStrInsert
 004A5F49    xor         eax,eax
 004A5F4B    pop         edx
 004A5F4C    pop         ecx
 004A5F4D    pop         ecx
 004A5F4E    mov         dword ptr fs:[eax],edx
 004A5F51    push        4A5F6B
 004A5F56    lea         eax,[ebp-18]
 004A5F59    mov         edx,2
 004A5F5E    call        @UStrArrayClr
 004A5F63    ret
>004A5F64    jmp         @HandleFinally
>004A5F69    jmp         004A5F56
 004A5F6B    pop         edi
 004A5F6C    pop         esi
 004A5F6D    pop         ebx
 004A5F6E    mov         esp,ebp
 004A5F70    pop         ebp
 004A5F71    ret
*}
end;

//004A5FB8
function TMenuItem.InternalRethinkHotkeys(ForceRethink:Boolean):Boolean;
begin
{*
 004A5FB8    push        ebp
 004A5FB9    mov         ebp,esp
 004A5FBB    mov         ecx,8
 004A5FC0    push        0
 004A5FC2    push        0
 004A5FC4    dec         ecx
>004A5FC5    jne         004A5FC0
 004A5FC7    push        ecx
 004A5FC8    push        ebx
 004A5FC9    push        esi
 004A5FCA    push        edi
 004A5FCB    mov         byte ptr [ebp-25],dl
 004A5FCE    mov         ebx,eax
 004A5FD0    xor         eax,eax
 004A5FD2    push        ebp
 004A5FD3    push        4A6442
 004A5FD8    push        dword ptr fs:[eax]
 004A5FDB    mov         dword ptr fs:[eax],esp
 004A5FDE    mov         byte ptr [ebp-26],0
 004A5FE2    cmp         byte ptr [ebp-25],0
>004A5FE6    jne         004A6001
 004A5FE8    test        byte ptr [ebx+1C],10
>004A5FEC    jne         004A6412
 004A5FF2    mov         eax,ebx
 004A5FF4    call        TMenuItem.GetAutoHotkeys
 004A5FF9    test        al,al
>004A5FFB    je          004A6412
 004A6001    lea         eax,[ebp-4]
 004A6004    mov         edx,dword ptr ds:[785C08];^'1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ'
 004A600A    call        @UStrLAsg
 004A600F    xor         eax,eax
 004A6011    mov         dword ptr [ebp-0C],eax
 004A6014    xor         eax,eax
 004A6016    mov         dword ptr [ebp-14],eax
 004A6019    xor         eax,eax
 004A601B    mov         dword ptr [ebp-2C],eax
 004A601E    xor         eax,eax
 004A6020    mov         dword ptr [ebp-8],eax
 004A6023    xor         eax,eax
 004A6025    mov         dword ptr [ebp-10],eax
 004A6028    xor         edx,edx
 004A602A    push        ebp
 004A602B    push        4A640B
 004A6030    push        dword ptr fs:[edx]
 004A6033    mov         dword ptr fs:[edx],esp
 004A6036    mov         dl,1
 004A6038    mov         eax,[0043C7BC];TStringList
 004A603D    call        TStringList.Create
 004A6042    mov         dword ptr [ebp-0C],eax
 004A6045    mov         dl,1
 004A6047    mov         eax,[0043C7BC];TStringList
 004A604C    call        TStringList.Create
 004A6051    mov         dword ptr [ebp-14],eax
 004A6054    mov         dl,1
 004A6056    mov         eax,[0043C7BC];TStringList
 004A605B    call        TStringList.Create
 004A6060    mov         dword ptr [ebp-2C],eax
 004A6063    mov         dl,1
 004A6065    mov         eax,[0043C7BC];TStringList
 004A606A    call        TStringList.Create
 004A606F    mov         dword ptr [ebp-8],eax
 004A6072    mov         eax,ebx
 004A6074    call        TMenuItem.GetCount
 004A6079    dec         eax
 004A607A    test        eax,eax
>004A607C    jl          004A6185
 004A6082    inc         eax
 004A6083    mov         dword ptr [ebp-34],eax
 004A6086    xor         esi,esi
 004A6088    mov         edx,esi
 004A608A    mov         eax,ebx
 004A608C    call        TMenuItem.GetItem
 004A6091    cmp         byte ptr [eax+3E],0
>004A6095    je          004A617B
 004A609B    mov         edx,esi
 004A609D    mov         eax,ebx
 004A609F    call        TMenuItem.GetItem
 004A60A4    mov         eax,dword ptr [eax+34]
 004A60A7    mov         edx,4A6460;'-'
 004A60AC    call        @UStrEqual
>004A60B1    je          004A617B
 004A60B7    mov         edx,esi
 004A60B9    mov         eax,ebx
 004A60BB    call        TMenuItem.GetItem
 004A60C0    cmp         dword ptr [eax+34],0
>004A60C4    je          004A617B
 004A60CA    mov         edx,esi
 004A60CC    mov         eax,ebx
 004A60CE    call        TMenuItem.GetItem
 004A60D3    mov         eax,dword ptr [eax+34]
 004A60D6    lea         edx,[ebp-38]
 004A60D9    call        GetHotkey
 004A60DE    mov         eax,dword ptr [ebp-38]
 004A60E1    lea         edx,[ebp-1C]
 004A60E4    call        UpperCase
 004A60E9    cmp         dword ptr [ebp-1C],0
>004A60ED    jne         004A6111
 004A60EF    mov         edx,esi
 004A60F1    mov         eax,ebx
 004A60F3    call        TMenuItem.GetItem
 004A60F8    push        eax
 004A60F9    mov         edx,esi
 004A60FB    mov         eax,ebx
 004A60FD    call        TMenuItem.GetItem
 004A6102    mov         ecx,dword ptr [eax+34]
 004A6105    xor         edx,edx
 004A6107    mov         eax,dword ptr [ebp-2C]
 004A610A    mov         edi,dword ptr [eax]
 004A610C    call        dword ptr [edi+64]
>004A610F    jmp         004A617B
 004A6111    mov         edx,dword ptr ds:[785C08];^'1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ'
 004A6117    mov         eax,dword ptr [ebp-1C]
 004A611A    call        AnsiPos
 004A611F    test        eax,eax
>004A6121    je          004A617B
 004A6123    push        ebp
 004A6124    mov         eax,dword ptr [ebp-1C]
 004A6127    call        IfHotkeyAvailable
 004A612C    pop         ecx
 004A612D    test        al,al
>004A612F    jne         004A617B
 004A6131    mov         edx,esi
 004A6133    mov         eax,ebx
 004A6135    call        TMenuItem.GetItem
 004A613A    add         eax,34
 004A613D    push        eax
 004A613E    mov         edx,esi
 004A6140    mov         eax,ebx
 004A6142    call        TMenuItem.GetItem
 004A6147    mov         eax,dword ptr [eax+34]
 004A614A    lea         edx,[ebp-3C]
 004A614D    call        StripHotkey
 004A6152    mov         edx,dword ptr [ebp-3C]
 004A6155    pop         eax
 004A6156    call        @UStrAsg
 004A615B    mov         edx,esi
 004A615D    mov         eax,ebx
 004A615F    call        TMenuItem.GetItem
 004A6164    push        eax
 004A6165    mov         edx,esi
 004A6167    mov         eax,ebx
 004A6169    call        TMenuItem.GetItem
 004A616E    mov         ecx,dword ptr [eax+34]
 004A6171    xor         edx,edx
 004A6173    mov         eax,dword ptr [ebp-2C]
 004A6176    mov         edi,dword ptr [eax]
 004A6178    call        dword ptr [edi+64]
 004A617B    inc         esi
 004A617C    dec         dword ptr [ebp-34]
>004A617F    jne         004A6088
 004A6185    lea         eax,[ebp-24]
 004A6188    mov         edx,dword ptr [ebp-4]
 004A618B    call        @UStrLAsg
 004A6190    mov         eax,dword ptr [ebp-2C]
 004A6193    mov         edx,dword ptr [eax]
 004A6195    call        dword ptr [edx+14]
 004A6198    dec         eax
 004A6199    test        eax,eax
>004A619B    jl          004A6306
 004A61A1    inc         eax
 004A61A2    mov         dword ptr [ebp-34],eax
 004A61A5    lea         eax,[ebp-4]
 004A61A8    mov         edx,dword ptr [ebp-24]
 004A61AB    call        @UStrLAsg
 004A61B0    mov         edx,dword ptr [ebp-2C]
 004A61B3    mov         eax,dword ptr [ebp-14]
 004A61B6    mov         ecx,dword ptr [eax]
 004A61B8    call        dword ptr [ecx+8]
 004A61BB    mov         eax,dword ptr [ebp-0C]
 004A61BE    mov         edx,dword ptr [eax]
 004A61C0    call        dword ptr [edx+44]
 004A61C3    mov         eax,dword ptr [ebp-14]
 004A61C6    mov         edx,dword ptr [eax]
 004A61C8    call        dword ptr [edx+14]
 004A61CB    mov         esi,eax
 004A61CD    dec         esi
 004A61CE    cmp         esi,0
>004A61D1    jl          004A629C
 004A61D7    lea         ecx,[ebp-20]
 004A61DA    mov         edx,esi
 004A61DC    mov         eax,dword ptr [ebp-14]
 004A61DF    mov         ebx,dword ptr [eax]
 004A61E1    call        dword ptr [ebx+0C]
 004A61E4    mov         ebx,1
>004A61E9    jmp         004A6282
 004A61EE    mov         eax,dword ptr [ebp-20]
 004A61F1    cmp         word ptr [eax+ebx*2-2],0D800
>004A61F8    jb          004A6209
 004A61FA    mov         eax,dword ptr [ebp-20]
 004A61FD    cmp         word ptr [eax+ebx*2-2],0DFFF
>004A6204    ja          004A6209
 004A6206    inc         ebx
>004A6207    jmp         004A6281
 004A6209    lea         eax,[ebp-40]
 004A620C    push        eax
 004A620D    mov         ecx,1
 004A6212    mov         edx,ebx
 004A6214    mov         eax,dword ptr [ebp-20]
 004A6217    call        @UStrCopy
 004A621C    mov         eax,dword ptr [ebp-40]
 004A621F    lea         edx,[ebp-1C]
 004A6222    call        UpperCase
 004A6227    push        ebp
 004A6228    mov         eax,dword ptr [ebp-1C]
 004A622B    call        IfHotkeyAvailable
 004A6230    pop         ecx
 004A6231    test        al,al
>004A6233    je          004A6281
 004A6235    mov         eax,[0078DB7C];SysLocale:TSysLocale
 004A623A    cmp         byte ptr [eax+0C],0
>004A623E    je          004A624F
 004A6240    lea         eax,[ebp-20]
 004A6243    mov         ecx,ebx
 004A6245    mov         edx,dword ptr [ebp-1C]
 004A6248    call        InsertHotkeyFarEastFormat
>004A624D    jmp         004A625E
 004A624F    lea         edx,[ebp-20]
 004A6252    mov         ecx,ebx
 004A6254    mov         eax,4A6470;'&'
 004A6259    call        @UStrInsert
 004A625E    mov         edx,esi
 004A6260    mov         eax,dword ptr [ebp-14]
 004A6263    mov         ecx,dword ptr [eax]
 004A6265    call        dword ptr [ecx+18]
 004A6268    mov         ecx,eax
 004A626A    mov         edx,dword ptr [ebp-20]
 004A626D    mov         eax,dword ptr [ebp-0C]
 004A6270    mov         ebx,dword ptr [eax]
 004A6272    call        dword ptr [ebx+3C]
 004A6275    mov         edx,esi
 004A6277    mov         eax,dword ptr [ebp-14]
 004A627A    mov         ecx,dword ptr [eax]
 004A627C    call        dword ptr [ecx+48]
>004A627F    jmp         004A6292
 004A6281    inc         ebx
 004A6282    mov         eax,dword ptr [ebp-20]
 004A6285    call        @UStrLen
 004A628A    cmp         ebx,eax
>004A628C    jle         004A61EE
 004A6292    dec         esi
 004A6293    cmp         esi,0FFFFFFFF
>004A6296    jne         004A61D7
 004A629C    mov         eax,dword ptr [ebp-0C]
 004A629F    mov         edx,dword ptr [eax]
 004A62A1    call        dword ptr [edx+14]
 004A62A4    cmp         eax,dword ptr [ebp-10]
>004A62A7    jle         004A62B0
 004A62A9    push        ebp
 004A62AA    call        CopyToBest
 004A62AF    pop         ecx
 004A62B0    mov         eax,dword ptr [ebp-14]
 004A62B3    mov         edx,dword ptr [eax]
 004A62B5    call        dword ptr [edx+14]
 004A62B8    test        eax,eax
>004A62BA    jle         004A6306
 004A62BC    mov         eax,dword ptr [ebp-14]
 004A62BF    mov         edx,dword ptr [eax]
 004A62C1    call        dword ptr [edx+14]
 004A62C4    mov         ebx,eax
 004A62C6    dec         ebx
 004A62C7    test        ebx,ebx
>004A62C9    jl          004A62FD
 004A62CB    inc         ebx
 004A62CC    xor         esi,esi
 004A62CE    mov         edx,esi
 004A62D0    mov         eax,dword ptr [ebp-14]
 004A62D3    mov         ecx,dword ptr [eax]
 004A62D5    call        dword ptr [ecx+18]
 004A62D8    mov         edx,eax
 004A62DA    mov         eax,dword ptr [ebp-2C]
 004A62DD    mov         ecx,dword ptr [eax]
 004A62DF    call        dword ptr [ecx+5C]
 004A62E2    mov         edi,eax
 004A62E4    mov         eax,dword ptr [ebp-2C]
 004A62E7    mov         edx,dword ptr [eax]
 004A62E9    call        dword ptr [edx+14]
 004A62EC    mov         ecx,eax
 004A62EE    dec         ecx
 004A62EF    mov         edx,edi
 004A62F1    mov         eax,dword ptr [ebp-2C]
 004A62F4    mov         edi,dword ptr [eax]
 004A62F6    call        dword ptr [edi+78]
 004A62F9    inc         esi
 004A62FA    dec         ebx
>004A62FB    jne         004A62CE
 004A62FD    dec         dword ptr [ebp-34]
>004A6300    jne         004A61A5
 004A6306    cmp         dword ptr [ebp-10],0
>004A630A    jne         004A6313
 004A630C    push        ebp
 004A630D    call        CopyToBest
 004A6312    pop         ecx
 004A6313    mov         eax,dword ptr [ebp-8]
 004A6316    mov         edx,dword ptr [eax]
 004A6318    call        dword ptr [edx+14]
 004A631B    test        eax,eax
 004A631D    setg        byte ptr [ebp-26]
 004A6321    mov         eax,dword ptr [ebp-8]
 004A6324    mov         edx,dword ptr [eax]
 004A6326    call        dword ptr [edx+14]
 004A6329    dec         eax
 004A632A    test        eax,eax
>004A632C    jl          004A63DD
 004A6332    inc         eax
 004A6333    mov         dword ptr [ebp-34],eax
 004A6336    xor         esi,esi
 004A6338    lea         ecx,[ebp-20]
 004A633B    mov         edx,esi
 004A633D    mov         eax,dword ptr [ebp-8]
 004A6340    mov         ebx,dword ptr [eax]
 004A6342    call        dword ptr [ebx+0C]
 004A6345    mov         eax,[0078DB7C];SysLocale:TSysLocale
 004A634A    cmp         byte ptr [eax+0C],0
>004A634E    je          004A63BE
 004A6350    mov         edx,dword ptr [ebp-20]
 004A6353    mov         eax,4A6470;'&'
 004A6358    call        AnsiPos
 004A635D    test        eax,eax
>004A635F    jne         004A63BE
 004A6361    cmp         dword ptr [ebp-18],0
>004A6365    je          004A63BE
 004A6367    mov         edx,dword ptr [ebp-20]
 004A636A    mov         eax,4A6470;'&'
 004A636F    call        AnsiPos
 004A6374    test        eax,eax
>004A6376    jne         004A63BE
 004A6378    mov         ebx,dword ptr [ebp-18]
 004A637B    test        ebx,ebx
>004A637D    je          004A6384
 004A637F    sub         ebx,4
 004A6382    mov         ebx,dword ptr [ebx]
 004A6384    lea         eax,[ebp-44]
 004A6387    push        eax
 004A6388    mov         ecx,1
 004A638D    mov         edx,ebx
 004A638F    mov         eax,dword ptr [ebp-18]
 004A6392    call        @UStrCopy
 004A6397    mov         edx,dword ptr [ebp-44]
 004A639A    lea         eax,[ebp-20]
 004A639D    xor         ecx,ecx
 004A639F    call        InsertHotkeyFarEastFormat
 004A63A4    mov         eax,dword ptr [ebp-18]
 004A63A7    test        eax,eax
>004A63A9    je          004A63B0
 004A63AB    sub         eax,4
 004A63AE    mov         eax,dword ptr [eax]
 004A63B0    lea         edx,[ebp-18]
 004A63B3    mov         ecx,1
 004A63B8    xchg        eax,edx
 004A63B9    call        @UStrDelete
 004A63BE    mov         edx,esi
 004A63C0    mov         eax,dword ptr [ebp-8]
 004A63C3    mov         ecx,dword ptr [eax]
 004A63C5    call        dword ptr [ecx+18]
 004A63C8    add         eax,34
 004A63CB    mov         edx,dword ptr [ebp-20]
 004A63CE    call        @UStrAsg
 004A63D3    inc         esi
 004A63D4    dec         dword ptr [ebp-34]
>004A63D7    jne         004A6338
 004A63DD    xor         eax,eax
 004A63DF    pop         edx
 004A63E0    pop         ecx
 004A63E1    pop         ecx
 004A63E2    mov         dword ptr fs:[eax],edx
 004A63E5    push        4A6412
 004A63EA    mov         eax,dword ptr [ebp-8]
 004A63ED    call        TObject.Free
 004A63F2    mov         eax,dword ptr [ebp-2C]
 004A63F5    call        TObject.Free
 004A63FA    mov         eax,dword ptr [ebp-14]
 004A63FD    call        TObject.Free
 004A6402    mov         eax,dword ptr [ebp-0C]
 004A6405    call        TObject.Free
 004A640A    ret
>004A640B    jmp         @HandleFinally
>004A6410    jmp         004A63EA
 004A6412    xor         eax,eax
 004A6414    pop         edx
 004A6415    pop         ecx
 004A6416    pop         ecx
 004A6417    mov         dword ptr fs:[eax],edx
 004A641A    push        4A6449
 004A641F    lea         eax,[ebp-44]
 004A6422    mov         edx,4
 004A6427    call        @UStrArrayClr
 004A642C    lea         eax,[ebp-24]
 004A642F    mov         edx,4
 004A6434    call        @UStrArrayClr
 004A6439    lea         eax,[ebp-4]
 004A643C    call        @UStrClr
 004A6441    ret
>004A6442    jmp         @HandleFinally
>004A6447    jmp         004A641F
 004A6449    movzx       eax,byte ptr [ebp-26]
 004A644D    pop         edi
 004A644E    pop         esi
 004A644F    pop         ebx
 004A6450    mov         esp,ebp
 004A6452    pop         ebp
 004A6453    ret
*}
end;

//004A6474
function TMenuItem.RethinkHotkeys:Boolean;
begin
{*
 004A6474    push        ebx
 004A6475    push        esi
 004A6476    mov         esi,eax
 004A6478    mov         dl,1
 004A647A    mov         eax,esi
 004A647C    call        TMenuItem.InternalRethinkHotkeys
 004A6481    mov         ebx,eax
 004A6483    test        bl,bl
>004A6485    je          004A6490
 004A6487    mov         dl,1
 004A6489    mov         eax,esi
 004A648B    mov         ecx,dword ptr [eax]
 004A648D    call        dword ptr [ecx+40]
 004A6490    mov         eax,ebx
 004A6492    pop         esi
 004A6493    pop         ebx
 004A6494    ret
*}
end;

//004A6498
procedure TMenuItem.SetAutoHotkeys(const Value:TMenuItemAutoFlag);
begin
{*
 004A6498    cmp         dl,byte ptr [eax+3B]
>004A649B    je          004A64A7
 004A649D    mov         byte ptr [eax+3B],dl
 004A64A0    mov         dl,1
 004A64A2    mov         ecx,dword ptr [eax]
 004A64A4    call        dword ptr [ecx+40]
 004A64A7    ret
*}
end;

//004A64A8
function TMenuItem.IsLine:Boolean;
begin
{*
 004A64A8    push        ebx
 004A64A9    mov         ebx,eax
 004A64AB    mov         eax,dword ptr [ebx+34]
 004A64AE    mov         edx,4A64CC;'-'
 004A64B3    call        @UStrEqual
 004A64B8    sete        al
 004A64BB    pop         ebx
 004A64BC    ret
*}
end;

//004A64D0
function TMenuItem.Find(ACaption:string):TMenuItem;
begin
{*
 004A64D0    push        ebp
 004A64D1    mov         ebp,esp
 004A64D3    add         esp,0FFFFFFEC
 004A64D6    push        ebx
 004A64D7    push        esi
 004A64D8    push        edi
 004A64D9    xor         ecx,ecx
 004A64DB    mov         dword ptr [ebp-14],ecx
 004A64DE    mov         dword ptr [ebp-10],ecx
 004A64E1    mov         dword ptr [ebp-4],edx
 004A64E4    mov         edi,eax
 004A64E6    mov         eax,dword ptr [ebp-4]
 004A64E9    call        @UStrAddRef
 004A64EE    xor         eax,eax
 004A64F0    push        ebp
 004A64F1    push        4A658B
 004A64F6    push        dword ptr fs:[eax]
 004A64F9    mov         dword ptr fs:[eax],esp
 004A64FC    xor         eax,eax
 004A64FE    mov         dword ptr [ebp-8],eax
 004A6501    lea         edx,[ebp-10]
 004A6504    mov         eax,dword ptr [ebp-4]
 004A6507    call        StripHotkey
 004A650C    mov         edx,dword ptr [ebp-10]
 004A650F    lea         eax,[ebp-4]
 004A6512    call        @UStrLAsg
 004A6517    mov         eax,edi
 004A6519    call        TMenuItem.GetCount
 004A651E    mov         esi,eax
 004A6520    dec         esi
 004A6521    test        esi,esi
>004A6523    jl          004A6568
 004A6525    inc         esi
 004A6526    xor         ebx,ebx
 004A6528    mov         edx,ebx
 004A652A    mov         eax,edi
 004A652C    call        TMenuItem.GetItem
 004A6531    mov         eax,dword ptr [eax+34]
 004A6534    lea         edx,[ebp-14]
 004A6537    call        StripHotkey
 004A653C    mov         eax,dword ptr [ebp-14]
 004A653F    mov         dword ptr [ebp-0C],eax
 004A6542    mov         edx,dword ptr [ebp-0C]
 004A6545    mov         eax,dword ptr [ebp-4]
 004A6548    call        AnsiCompareText
 004A654D    test        eax,eax
 004A654F    sete        al
 004A6552    test        al,al
>004A6554    je          004A6564
 004A6556    mov         edx,ebx
 004A6558    mov         eax,edi
 004A655A    call        TMenuItem.GetItem
 004A655F    mov         dword ptr [ebp-8],eax
>004A6562    jmp         004A6568
 004A6564    inc         ebx
 004A6565    dec         esi
>004A6566    jne         004A6528
 004A6568    xor         eax,eax
 004A656A    pop         edx
 004A656B    pop         ecx
 004A656C    pop         ecx
 004A656D    mov         dword ptr fs:[eax],edx
 004A6570    push        4A6592
 004A6575    lea         eax,[ebp-14]
 004A6578    mov         edx,2
 004A657D    call        @UStrArrayClr
 004A6582    lea         eax,[ebp-4]
 004A6585    call        @UStrClr
 004A658A    ret
>004A658B    jmp         @HandleFinally
>004A6590    jmp         004A6575
 004A6592    mov         eax,dword ptr [ebp-8]
 004A6595    pop         edi
 004A6596    pop         esi
 004A6597    pop         ebx
 004A6598    mov         esp,ebp
 004A659A    pop         ebp
 004A659B    ret
*}
end;

//004A659C
function TMenuItem.InsertNewLine(ABefore:Boolean; AItem:TMenuItem):Integer;
begin
{*
 004A659C    push        ebx
 004A659D    push        esi
 004A659E    push        edi
 004A659F    push        ebp
 004A65A0    mov         ebp,ecx
 004A65A2    mov         ebx,edx
 004A65A4    mov         esi,eax
 004A65A6    cmp         esi,dword ptr [ebp+64]
>004A65A9    je          004A65B5
 004A65AB    mov         eax,[0078D8D8];^SResString210:TResStringRec
 004A65B0    call        Error
 004A65B5    test        bl,bl
>004A65B7    je          004A6627
 004A65B9    mov         eax,ebp
 004A65BB    call        TMenuItem.GetMenuIndex
 004A65C0    test        eax,eax
>004A65C2    jle         004A6605
 004A65C4    mov         eax,ebp
 004A65C6    call        TMenuItem.GetMenuIndex
 004A65CB    mov         edx,eax
 004A65CD    dec         edx
 004A65CE    mov         eax,esi
 004A65D0    call        TMenuItem.GetItem
 004A65D5    call        TMenuItem.IsLine
 004A65DA    test        al,al
>004A65DC    je          004A6605
 004A65DE    mov         eax,ebp
 004A65E0    call        TMenuItem.GetMenuIndex
 004A65E5    mov         edi,eax
 004A65E7    dec         edi
 004A65E8    mov         eax,ebp
 004A65EA    call        TMenuItem.GetMenuIndex
 004A65EF    mov         edx,eax
 004A65F1    dec         edx
 004A65F2    mov         eax,esi
 004A65F4    call        TMenuItem.GetItem
 004A65F9    mov         dl,1
 004A65FB    call        TMenuItem.SetVisible
>004A6600    jmp         004A66A0
 004A6605    mov         eax,ebp
 004A6607    call        TMenuItem.GetMenuIndex
 004A660C    mov         edi,eax
 004A660E    mov         eax,ebp
 004A6610    call        TMenuItem.GetMenuIndex
 004A6615    push        eax
 004A6616    call        NewLine
 004A661B    mov         ecx,eax
 004A661D    mov         eax,esi
 004A661F    pop         edx
 004A6620    call        TMenuItem.Insert
>004A6625    jmp         004A66A0
 004A6627    mov         eax,ebp
 004A6629    call        TMenuItem.GetMenuIndex
 004A662E    mov         ebx,eax
 004A6630    mov         eax,esi
 004A6632    call        TMenuItem.GetCount
 004A6637    dec         eax
 004A6638    cmp         ebx,eax
>004A663A    jge         004A667C
 004A663C    mov         eax,ebp
 004A663E    call        TMenuItem.GetMenuIndex
 004A6643    mov         edx,eax
 004A6645    inc         edx
 004A6646    mov         eax,esi
 004A6648    call        TMenuItem.GetItem
 004A664D    call        TMenuItem.IsLine
 004A6652    test        al,al
>004A6654    je          004A667C
 004A6656    mov         eax,ebp
 004A6658    call        TMenuItem.GetMenuIndex
 004A665D    mov         edi,eax
 004A665F    add         edi,2
 004A6662    mov         eax,ebp
 004A6664    call        TMenuItem.GetMenuIndex
 004A6669    mov         edx,eax
 004A666B    inc         edx
 004A666C    mov         eax,esi
 004A666E    call        TMenuItem.GetItem
 004A6673    mov         dl,1
 004A6675    call        TMenuItem.SetVisible
>004A667A    jmp         004A66A0
 004A667C    mov         eax,ebp
 004A667E    call        TMenuItem.GetMenuIndex
 004A6683    mov         edi,eax
 004A6685    add         edi,2
 004A6688    mov         eax,ebp
 004A668A    call        TMenuItem.GetMenuIndex
 004A668F    inc         eax
 004A6690    push        eax
 004A6691    call        NewLine
 004A6696    mov         ecx,eax
 004A6698    mov         eax,esi
 004A669A    pop         edx
 004A669B    call        TMenuItem.Insert
 004A66A0    mov         eax,edi
 004A66A2    pop         ebp
 004A66A3    pop         edi
 004A66A4    pop         esi
 004A66A5    pop         ebx
 004A66A6    ret
*}
end;

//004A66A8
function TMenuItem.InsertNewLineAfter(AItem:TMenuItem):Integer;
begin
{*
 004A66A8    mov         ecx,edx
 004A66AA    xor         edx,edx
 004A66AC    call        TMenuItem.InsertNewLine
 004A66B1    ret
*}
end;

//004A66B4
function TMenuItem.InsertNewLineBefore(AItem:TMenuItem):Integer;
begin
{*
 004A66B4    mov         ecx,edx
 004A66B6    mov         dl,1
 004A66B8    call        TMenuItem.InsertNewLine
 004A66BD    ret
*}
end;

//004A66C0
function TMenuItem.NewBottomLine:Integer;
begin
{*
 004A66C0    push        ebx
 004A66C1    push        esi
 004A66C2    mov         ebx,eax
 004A66C4    xor         esi,esi
 004A66C6    mov         eax,ebx
 004A66C8    call        TMenuItem.GetCount
 004A66CD    test        eax,eax
>004A66CF    jne         004A66E1
 004A66D1    call        NewLine
 004A66D6    mov         edx,eax
 004A66D8    mov         eax,ebx
 004A66DA    call        TMenuItem.Add
>004A66DF    jmp         004A66FF
 004A66E1    mov         eax,ebx
 004A66E3    call        TMenuItem.GetCount
 004A66E8    mov         edx,eax
 004A66EA    dec         edx
 004A66EB    mov         eax,ebx
 004A66ED    call        TMenuItem.GetItem
 004A66F2    mov         ecx,eax
 004A66F4    xor         edx,edx
 004A66F6    mov         eax,ebx
 004A66F8    call        TMenuItem.InsertNewLine
 004A66FD    mov         esi,eax
 004A66FF    mov         eax,esi
 004A6701    pop         esi
 004A6702    pop         ebx
 004A6703    ret
*}
end;

//004A6704
function TMenuItem.NewTopLine:Integer;
begin
{*
 004A6704    push        ebx
 004A6705    push        esi
 004A6706    mov         ebx,eax
 004A6708    xor         esi,esi
 004A670A    mov         eax,ebx
 004A670C    call        TMenuItem.GetCount
 004A6711    test        eax,eax
>004A6713    jne         004A6725
 004A6715    call        NewLine
 004A671A    mov         edx,eax
 004A671C    mov         eax,ebx
 004A671E    call        TMenuItem.Add
>004A6723    jmp         004A673B
 004A6725    xor         edx,edx
 004A6727    mov         eax,ebx
 004A6729    call        TMenuItem.GetItem
 004A672E    mov         ecx,eax
 004A6730    mov         dl,1
 004A6732    mov         eax,ebx
 004A6734    call        TMenuItem.InsertNewLine
 004A6739    mov         esi,eax
 004A673B    mov         eax,esi
 004A673D    pop         esi
 004A673E    pop         ebx
 004A673F    ret
*}
end;

//004A6740
function TMenuItem.InternalRethinkLines(ForceRethink:Boolean):Boolean;
begin
{*
 004A6740    push        ebx
 004A6741    push        esi
 004A6742    push        edi
 004A6743    push        ebp
 004A6744    add         esp,0FFFFFFF8
 004A6747    mov         ebx,edx
 004A6749    mov         esi,eax
 004A674B    mov         byte ptr [esp],0
 004A674F    test        bl,bl
>004A6751    jne         004A676C
 004A6753    test        byte ptr [esi+1C],10
>004A6757    jne         004A687D
 004A675D    mov         eax,esi
 004A675F    call        TMenuItem.GetAutoLineReduction
 004A6764    test        al,al
>004A6766    je          004A687D
 004A676C    xor         eax,eax
 004A676E    mov         dword ptr [esp+4],eax
 004A6772    xor         ebp,ebp
 004A6774    mov         ebx,dword ptr [esp+4]
 004A6778    mov         eax,esi
 004A677A    call        TMenuItem.GetCount
 004A677F    mov         edi,eax
 004A6781    dec         edi
 004A6782    sub         edi,ebx
>004A6784    jl          004A67C5
 004A6786    inc         edi
 004A6787    mov         edx,ebx
 004A6789    mov         eax,esi
 004A678B    call        TMenuItem.GetItem
 004A6790    cmp         byte ptr [eax+3E],0
>004A6794    je          004A67C1
 004A6796    mov         edx,ebx
 004A6798    mov         eax,esi
 004A679A    call        TMenuItem.GetItem
 004A679F    call        TMenuItem.IsLine
 004A67A4    test        al,al
>004A67A6    je          004A67BB
 004A67A8    mov         edx,ebx
 004A67AA    mov         eax,esi
 004A67AC    call        TMenuItem.GetItem
 004A67B1    mov         byte ptr [eax+3E],0
 004A67B5    mov         byte ptr [esp],1
>004A67B9    jmp         004A67C1
 004A67BB    mov         dword ptr [esp+4],ebx
>004A67BF    jmp         004A67C5
 004A67C1    inc         ebx
 004A67C2    dec         edi
>004A67C3    jne         004A6787
 004A67C5    mov         ebx,dword ptr [esp+4]
 004A67C9    mov         eax,esi
 004A67CB    call        TMenuItem.GetCount
 004A67D0    mov         edi,eax
 004A67D2    dec         edi
 004A67D3    sub         edi,ebx
>004A67D5    jl          004A6834
 004A67D7    inc         edi
 004A67D8    mov         edx,ebx
 004A67DA    mov         eax,esi
 004A67DC    call        TMenuItem.GetItem
 004A67E1    call        TMenuItem.IsLine
 004A67E6    test        al,al
>004A67E8    je          004A6809
 004A67EA    test        ebp,ebp
>004A67EC    je          004A67FC
 004A67EE    cmp         byte ptr [ebp+3E],0
>004A67F2    je          004A67FC
 004A67F4    mov         byte ptr [ebp+3E],0
 004A67F8    mov         byte ptr [esp],1
 004A67FC    mov         edx,ebx
 004A67FE    mov         eax,esi
 004A6800    call        TMenuItem.GetItem
 004A6805    mov         ebp,eax
>004A6807    jmp         004A6830
 004A6809    mov         edx,ebx
 004A680B    mov         eax,esi
 004A680D    call        TMenuItem.GetItem
 004A6812    cmp         byte ptr [eax+3E],0
>004A6816    je          004A6830
 004A6818    test        ebp,ebp
>004A681A    je          004A682A
 004A681C    cmp         byte ptr [ebp+3E],0
>004A6820    jne         004A682A
 004A6822    mov         byte ptr [ebp+3E],1
 004A6826    mov         byte ptr [esp],1
 004A682A    xor         ebp,ebp
 004A682C    mov         dword ptr [esp+4],ebx
 004A6830    inc         ebx
 004A6831    dec         edi
>004A6832    jne         004A67D8
 004A6834    mov         eax,esi
 004A6836    call        TMenuItem.GetCount
 004A683B    mov         ebx,eax
 004A683D    dec         ebx
 004A683E    mov         edi,dword ptr [esp+4]
 004A6842    sub         edi,ebx
>004A6844    jg          004A687D
 004A6846    dec         edi
 004A6847    mov         edx,ebx
 004A6849    mov         eax,esi
 004A684B    call        TMenuItem.GetItem
 004A6850    cmp         byte ptr [eax+3E],0
>004A6854    je          004A6879
 004A6856    mov         edx,ebx
 004A6858    mov         eax,esi
 004A685A    call        TMenuItem.GetItem
 004A685F    call        TMenuItem.IsLine
 004A6864    test        al,al
>004A6866    je          004A687D
 004A6868    mov         edx,ebx
 004A686A    mov         eax,esi
 004A686C    call        TMenuItem.GetItem
 004A6871    mov         byte ptr [eax+3E],0
 004A6875    mov         byte ptr [esp],1
 004A6879    dec         ebx
 004A687A    inc         edi
>004A687B    jne         004A6847
 004A687D    movzx       eax,byte ptr [esp]
 004A6881    pop         ecx
 004A6882    pop         edx
 004A6883    pop         ebp
 004A6884    pop         edi
 004A6885    pop         esi
 004A6886    pop         ebx
 004A6887    ret
*}
end;

//004A6888
procedure TMenuItem.SetAutoLineReduction(const Value:TMenuItemAutoFlag);
begin
{*
 004A6888    cmp         dl,byte ptr [eax+3C]
>004A688B    je          004A6897
 004A688D    mov         byte ptr [eax+3C],dl
 004A6890    mov         dl,1
 004A6892    mov         ecx,dword ptr [eax]
 004A6894    call        dword ptr [ecx+40]
 004A6897    ret
*}
end;

//004A6898
function TMenuItem.RethinkLines:Boolean;
begin
{*
 004A6898    push        ebx
 004A6899    push        esi
 004A689A    mov         esi,eax
 004A689C    mov         dl,1
 004A689E    mov         eax,esi
 004A68A0    call        TMenuItem.InternalRethinkLines
 004A68A5    mov         ebx,eax
 004A68A7    test        bl,bl
>004A68A9    je          004A68B4
 004A68AB    mov         dl,1
 004A68AD    mov         eax,esi
 004A68AF    mov         ecx,dword ptr [eax]
 004A68B1    call        dword ptr [ecx+40]
 004A68B4    mov         eax,ebx
 004A68B6    pop         esi
 004A68B7    pop         ebx
 004A68B8    ret
*}
end;

//004A68BC
function TMenuItem.GetAutoHotkeys:Boolean;
begin
{*
 004A68BC    push        ebx
 004A68BD    mov         ebx,eax
 004A68BF    movzx       eax,byte ptr [ebx+3B]
 004A68C3    cmp         al,2
>004A68C5    jne         004A68DF
 004A68C7    cmp         dword ptr [ebx+64],0
>004A68CB    je          004A68DF
 004A68CD    mov         eax,dword ptr [ebx+64]
 004A68D0    call        TMenuItem.GetAutoHotkeys
 004A68D5    and         eax,7F
 004A68D8    movzx       eax,byte ptr [eax+785C11]
 004A68DF    and         eax,7F
 004A68E2    movzx       eax,byte ptr [eax+785C13]
 004A68E9    pop         ebx
 004A68EA    ret
*}
end;

//004A68EC
function TMenuItem.GetAutoLineReduction:Boolean;
begin
{*
 004A68EC    push        ebx
 004A68ED    mov         ebx,eax
 004A68EF    movzx       eax,byte ptr [ebx+3C]
 004A68F3    cmp         al,2
>004A68F5    jne         004A690F
 004A68F7    cmp         dword ptr [ebx+64],0
>004A68FB    je          004A690F
 004A68FD    mov         eax,dword ptr [ebx+64]
 004A6900    call        TMenuItem.GetAutoLineReduction
 004A6905    and         eax,7F
 004A6908    movzx       eax,byte ptr [eax+785C11]
 004A690F    and         eax,7F
 004A6912    movzx       eax,byte ptr [eax+785C13]
 004A6919    pop         ebx
 004A691A    ret
*}
end;

//004A691C
constructor TMenu.Create;
begin
{*
 004A691C    push        ebp
 004A691D    mov         ebp,esp
 004A691F    push        ecx
 004A6920    push        ebx
 004A6921    push        esi
 004A6922    push        edi
 004A6923    test        dl,dl
>004A6925    je          004A692F
 004A6927    add         esp,0FFFFFFF0
 004A692A    call        @ClassCreate
 004A692F    mov         edi,ecx
 004A6931    mov         byte ptr [ebp-1],dl
 004A6934    mov         ebx,eax
 004A6936    mov         ecx,ebx
 004A6938    mov         dl,1
 004A693A    mov         eax,[0049F488];TMenuItem
 004A693F    call        TMenuItem.Create
 004A6944    mov         esi,eax
 004A6946    mov         dword ptr [ebx+38],esi
 004A6949    mov         dword ptr [esi+84],ebx
 004A694F    mov         eax,dword ptr [ebx]
 004A6951    mov         eax,dword ptr [eax+3C]
 004A6954    mov         dword ptr [esi+80],eax
 004A695A    mov         dword ptr [esi+70],ebx
 004A695D    mov         dl,1
 004A695F    mov         eax,[0049B438];TChangeLink
 004A6964    call        TObject.Create
 004A6969    mov         esi,eax
 004A696B    mov         dword ptr [ebx+44],esi
 004A696E    mov         dword ptr [esi+0C],ebx
 004A6971    mov         dword ptr [esi+8],4A7510;TMenu.ImageListChange
 004A6978    mov         byte ptr [ebx+41],1
 004A697C    mov         ecx,edi
 004A697E    xor         edx,edx
 004A6980    mov         eax,ebx
 004A6982    call        TComponent.Create
 004A6987    mov         eax,dword ptr [ebx+38]
 004A698A    mov         byte ptr [eax+3B],0
 004A698E    mov         byte ptr [eax+3C],0
 004A6992    mov         eax,ebx
 004A6994    call        TMenu.ParentBiDiModeChanged
 004A6999    mov         eax,ebx
 004A699B    cmp         byte ptr [ebp-1],0
>004A699F    je          004A69B0
 004A69A1    call        @AfterConstruction
 004A69A6    pop         dword ptr fs:[0]
 004A69AD    add         esp,0C
 004A69B0    mov         eax,ebx
 004A69B2    pop         edi
 004A69B3    pop         esi
 004A69B4    pop         ebx
 004A69B5    pop         ecx
 004A69B6    pop         ebp
 004A69B7    ret
*}
end;

//004A69B8
procedure TMenu.CreateMenuItem;
begin
{*
 004A69B8    mov         ecx,eax
 004A69BA    mov         dl,1
 004A69BC    mov         eax,[0049F488];TMenuItem
 004A69C1    call        TMenuItem.Create
 004A69C6    ret
*}
end;

//004A69C8
destructor TMenu.Destroy();
begin
{*
 004A69C8    push        ebx
 004A69C9    push        esi
 004A69CA    call        @BeforeDestruction
 004A69CF    mov         ebx,edx
 004A69D1    mov         esi,eax
 004A69D3    mov         eax,dword ptr [esi+38]
 004A69D6    call        TObject.Free
 004A69DB    mov         eax,dword ptr [esi+44]
 004A69DE    call        TObject.Free
 004A69E3    mov         edx,ebx
 004A69E5    and         dl,0FC
 004A69E8    mov         eax,esi
 004A69EA    call        TComponent.Destroy
 004A69EF    test        bl,bl
>004A69F1    jle         004A69FA
 004A69F3    mov         eax,esi
 004A69F5    call        @ClassDestroy
 004A69FA    pop         esi
 004A69FB    pop         ebx
 004A69FC    ret
*}
end;

//004A6A00
procedure TMenu.GetChildren(Root:TComponent; Proc:TGetChildProc);
begin
{*
 004A6A00    push        ebp
 004A6A01    mov         ebp,esp
 004A6A03    push        esi
 004A6A04    mov         esi,eax
 004A6A06    push        dword ptr [ebp+0C]
 004A6A09    push        dword ptr [ebp+8]
 004A6A0C    mov         eax,dword ptr [esi+38]
 004A6A0F    mov         si,0FFFD
 004A6A13    call        @CallDynaInst
 004A6A18    pop         esi
 004A6A19    pop         ebp
 004A6A1A    ret         8
*}
end;

//004A6A20
function TMenu.GetHandle:HMENU;
begin
{*
 004A6A20    mov         eax,dword ptr [eax+38]
 004A6A23    call        TMenuItem.GetHandle
 004A6A28    ret
*}
end;

//004A6A2C
procedure TMenu.SetChildOrder(Child:TComponent; Order:Integer);
begin
{*
 004A6A2C    push        esi
 004A6A2D    mov         esi,eax
 004A6A2F    mov         eax,dword ptr [esi+38]
 004A6A32    mov         si,0FFF9
 004A6A36    call        @CallDynaInst
 004A6A3B    pop         esi
 004A6A3C    ret
*}
end;

//004A6A40
procedure TMenu.UpdateItems;
begin
{*
 004A6A40    push        ebx
 004A6A41    mov         ecx,4A5CCC;UpdateItem:Boolean
 004A6A46    mov         edx,dword ptr [eax+38]
 004A6A49    mov         ebx,dword ptr [edx+68]
 004A6A4C    mov         eax,edx
 004A6A4E    xchg        eax,ecx
 004A6A4F    mov         edx,ebx
 004A6A51    call        IterateMenus
 004A6A56    pop         ebx
 004A6A57    ret
*}
end;

//004A6A58
function Find(Item:TMenuItem):Boolean;
begin
{*
 004A6A58    push        ebp
 004A6A59    mov         ebp,esp
 004A6A5B    push        ecx
 004A6A5C    push        ebx
 004A6A5D    push        esi
 004A6A5E    push        edi
 004A6A5F    mov         ebx,eax
 004A6A61    mov         byte ptr [ebp-1],0
 004A6A65    mov         eax,dword ptr [ebp+8]
 004A6A68    cmp         byte ptr [eax-1],0
>004A6A6C    jne         004A6A7C
 004A6A6E    mov         eax,dword ptr [ebp+8]
 004A6A71    mov         eax,dword ptr [eax-8]
 004A6A74    movzx       edx,word ptr [ebx+50]
 004A6A78    cmp         eax,edx
>004A6A7A    je          004A6AAA
 004A6A7C    mov         eax,dword ptr [ebp+8]
 004A6A7F    cmp         byte ptr [eax-1],1
>004A6A83    jne         004A6A93
 004A6A85    mov         eax,dword ptr [ebp+8]
 004A6A88    mov         eax,dword ptr [eax-8]
 004A6A8B    cmp         eax,dword ptr [ebx+0AC]
>004A6A91    je          004A6AAA
 004A6A93    mov         eax,dword ptr [ebp+8]
 004A6A96    cmp         byte ptr [eax-1],2
>004A6A9A    jne         004A6AB6
 004A6A9C    mov         eax,dword ptr [ebp+8]
 004A6A9F    mov         eax,dword ptr [eax-8]
 004A6AA2    movzx       edx,word ptr [ebx+60]
 004A6AA6    cmp         eax,edx
>004A6AA8    jne         004A6AB6
 004A6AAA    mov         eax,dword ptr [ebp+8]
 004A6AAD    mov         dword ptr [eax-0C],ebx
 004A6AB0    mov         byte ptr [ebp-1],1
>004A6AB4    jmp         004A6AE8
 004A6AB6    mov         eax,ebx
 004A6AB8    call        TMenuItem.GetCount
 004A6ABD    mov         esi,eax
 004A6ABF    dec         esi
 004A6AC0    test        esi,esi
>004A6AC2    jl          004A6AE8
 004A6AC4    inc         esi
 004A6AC5    xor         edi,edi
 004A6AC7    mov         eax,dword ptr [ebp+8]
 004A6ACA    push        eax
 004A6ACB    mov         edx,edi
 004A6ACD    mov         eax,ebx
 004A6ACF    call        TMenuItem.GetItem
 004A6AD4    call        Find
 004A6AD9    pop         ecx
 004A6ADA    test        al,al
>004A6ADC    je          004A6AE4
 004A6ADE    mov         byte ptr [ebp-1],1
>004A6AE2    jmp         004A6AE8
 004A6AE4    inc         edi
 004A6AE5    dec         esi
>004A6AE6    jne         004A6AC7
 004A6AE8    movzx       eax,byte ptr [ebp-1]
 004A6AEC    pop         edi
 004A6AED    pop         esi
 004A6AEE    pop         ebx
 004A6AEF    pop         ecx
 004A6AF0    pop         ebp
 004A6AF1    ret
*}
end;

//004A6AF4
function TMenu.FindItem(Value:Integer; Kind:TFindItemKind):TMenuItem;
begin
{*
 004A6AF4    push        ebp
 004A6AF5    mov         ebp,esp
 004A6AF7    add         esp,0FFFFFFF4
 004A6AFA    push        ebx
 004A6AFB    mov         byte ptr [ebp-1],cl
 004A6AFE    mov         dword ptr [ebp-8],edx
 004A6B01    xor         edx,edx
 004A6B03    mov         dword ptr [ebp-0C],edx
 004A6B06    mov         ecx,4A6A58;Find:Boolean
 004A6B0B    mov         edx,dword ptr [eax+38]
 004A6B0E    mov         ebx,dword ptr [edx+68]
 004A6B11    mov         eax,edx
 004A6B13    xchg        eax,ecx
 004A6B14    mov         edx,ebx
 004A6B16    call        IterateMenus
 004A6B1B    mov         eax,dword ptr [ebp-0C]
 004A6B1E    pop         ebx
 004A6B1F    mov         esp,ebp
 004A6B21    pop         ebp
 004A6B22    ret
*}
end;

//004A6B24
function TMenu.GetHelpContext(Value:Integer; ByCommand:Boolean):THelpContext;
begin
{*
 004A6B24    push        ebx
 004A6B25    push        esi
 004A6B26    push        edi
 004A6B27    push        ebp
 004A6B28    push        ecx
 004A6B29    mov         byte ptr [esp],cl
 004A6B2C    mov         ebp,edx
 004A6B2E    mov         esi,eax
 004A6B30    xor         edi,edi
 004A6B32    mov         bl,1
 004A6B34    cmp         byte ptr [esp],0
>004A6B38    je          004A6B3C
 004A6B3A    xor         ebx,ebx
 004A6B3C    cmp         bl,1
>004A6B3F    jne         004A6B68
 004A6B41    mov         eax,esi
 004A6B43    mov         edx,dword ptr ds:[4A0E2C];TPopupMenu
 004A6B49    call        @IsClass
 004A6B4E    test        al,al
>004A6B50    je          004A6B68
 004A6B52    mov         eax,esi
 004A6B54    mov         edx,dword ptr [eax]
 004A6B56    call        dword ptr [edx+38]
 004A6B59    cmp         ebp,eax
>004A6B5B    jne         004A6B68
 004A6B5D    mov         eax,esi
 004A6B5F    call        TPopupMenu.GetHelpContext
 004A6B64    mov         edi,eax
>004A6B66    jmp         004A6B89
 004A6B68    mov         ecx,ebx
 004A6B6A    mov         edx,ebp
 004A6B6C    mov         eax,esi
 004A6B6E    call        TMenu.FindItem
>004A6B73    jmp         004A6B78
 004A6B75    mov         eax,dword ptr [eax+64]
 004A6B78    test        eax,eax
>004A6B7A    je          004A6B82
 004A6B7C    cmp         dword ptr [eax+54],0
>004A6B80    je          004A6B75
 004A6B82    test        eax,eax
>004A6B84    je          004A6B89
 004A6B86    mov         edi,dword ptr [eax+54]
 004A6B89    mov         eax,edi
 004A6B8B    pop         edx
 004A6B8C    pop         ebp
 004A6B8D    pop         edi
 004A6B8E    pop         esi
 004A6B8F    pop         ebx
 004A6B90    ret
*}
end;

//004A6B94
function TMenu.DispatchCommand(ACommand:Word):Boolean;
begin
{*
 004A6B94    push        ebx
 004A6B95    xor         ebx,ebx
 004A6B97    movzx       edx,dx
 004A6B9A    xor         ecx,ecx
 004A6B9C    call        TMenu.FindItem
 004A6BA1    test        eax,eax
>004A6BA3    je          004A6BAC
 004A6BA5    mov         edx,dword ptr [eax]
 004A6BA7    call        dword ptr [edx+48]
 004A6BAA    mov         bl,1
 004A6BAC    mov         eax,ebx
 004A6BAE    pop         ebx
 004A6BAF    ret
*}
end;

//004A6BB0
function TMenu.DispatchPopup(AHandle:HMENU):Boolean;
begin
{*
 004A6BB0    push        ebx
 004A6BB1    push        esi
 004A6BB2    push        edi
 004A6BB3    mov         esi,eax
 004A6BB5    xor         ebx,ebx
 004A6BB7    mov         cl,1
 004A6BB9    mov         eax,esi
 004A6BBB    call        TMenu.FindItem
 004A6BC0    mov         edi,eax
 004A6BC2    test        edi,edi
>004A6BC4    je          004A6C50
 004A6BCA    test        byte ptr [edi+1C],10
>004A6BCE    jne         004A6BD7
 004A6BD0    mov         eax,edi
 004A6BD2    call        TMenuItem.InitiateActions
 004A6BD7    mov         eax,edi
 004A6BD9    mov         edx,dword ptr [eax]
 004A6BDB    call        dword ptr [edx+48]
 004A6BDE    xor         edx,edx
 004A6BE0    mov         eax,edi
 004A6BE2    call        TMenuItem.InternalRethinkHotkeys
 004A6BE7    mov         ebx,eax
 004A6BE9    xor         edx,edx
 004A6BEB    mov         eax,edi
 004A6BED    call        TMenuItem.InternalRethinkLines
 004A6BF2    or          bl,al
 004A6BF4    test        bl,bl
>004A6BF6    je          004A6BFF
 004A6BF8    mov         eax,edi
 004A6BFA    call        TMenuItem.RebuildHandle
 004A6BFF    mov         eax,[0078D590];^Application:TApplication
 004A6C04    mov         eax,dword ptr [eax]
 004A6C06    mov         eax,dword ptr [eax+44]
 004A6C09    test        eax,eax
>004A6C0B    je          004A6C4C
 004A6C0D    mov         edx,dword ptr ds:[78D590];^Application:TApplication
 004A6C13    mov         ebx,eax
 004A6C15    cmp         byte ptr [ebx+29E],2
>004A6C1C    jne         004A6C4C
 004A6C1E    cmp         edi,dword ptr [ebx+2C0]
>004A6C24    jne         004A6C4C
 004A6C26    push        0
 004A6C28    push        0
 004A6C2A    push        234
 004A6C2F    mov         eax,dword ptr [ebx+37C]
 004A6C35    push        eax
 004A6C36    call        user32.SendMessageW
 004A6C3B    test        eax,eax
>004A6C3D    je          004A6C4C
 004A6C3F    mov         eax,ebx
 004A6C41    call        TWinControl.GetHandle
 004A6C46    push        eax
 004A6C47    call        user32.DrawMenuBar
 004A6C4C    mov         bl,1
>004A6C4E    jmp         004A6C6F
 004A6C50    test        byte ptr [esi+1C],10
>004A6C54    jne         004A6C6F
 004A6C56    mov         eax,esi
 004A6C58    mov         edx,dword ptr ds:[4A0E2C];TPopupMenu
 004A6C5E    call        @IsClass
 004A6C63    test        al,al
>004A6C65    je          004A6C6F
 004A6C67    mov         eax,dword ptr [esi+38]
 004A6C6A    call        TMenuItem.InitiateActions
 004A6C6F    mov         eax,ebx
 004A6C71    pop         edi
 004A6C72    pop         esi
 004A6C73    pop         ebx
 004A6C74    ret
*}
end;

//004A6C78
function TMenu.IsOwnerDraw:Boolean;
begin
{*
 004A6C78    cmp         byte ptr [eax+40],0
>004A6C7C    jne         004A6C87
 004A6C7E    cmp         dword ptr [eax+48],0
>004A6C82    jne         004A6C87
 004A6C84    xor         eax,eax
 004A6C86    ret
 004A6C87    mov         al,1
 004A6C89    ret
*}
end;

//004A6C8C
procedure GetAltGRStatus;
begin
{*
 004A6C8C    push        ebp
 004A6C8D    mov         ebp,esp
 004A6C8F    add         esp,0FFFFFFD8
 004A6C92    push        ebx
 004A6C93    xor         eax,eax
 004A6C95    mov         dword ptr [ebp-24],eax
 004A6C98    mov         dword ptr [ebp-28],eax
 004A6C9B    mov         dword ptr [ebp-4],eax
 004A6C9E    xor         eax,eax
 004A6CA0    push        ebp
 004A6CA1    push        4A6DC5
 004A6CA6    push        dword ptr fs:[eax]
 004A6CA9    mov         dword ptr fs:[eax],esp
 004A6CAC    mov         word ptr [ebp-20],0
 004A6CB2    lea         eax,[ebp-20]
 004A6CB5    push        eax
 004A6CB6    call        user32.GetKeyboardLayoutNameW
 004A6CBB    mov         dl,1
 004A6CBD    mov         eax,[0045C080];TRegistry
 004A6CC2    call        TRegistry.Create
 004A6CC7    mov         dword ptr [ebp-0C],eax
 004A6CCA    xor         edx,edx
 004A6CCC    push        ebp
 004A6CCD    push        4A6D9B
 004A6CD2    push        dword ptr fs:[edx]
 004A6CD5    mov         dword ptr fs:[edx],esp
 004A6CD8    mov         edx,80000002
 004A6CDD    mov         eax,dword ptr [ebp-0C]
 004A6CE0    call        TRegistry.SetRootKey
 004A6CE5    lea         eax,[ebp-28]
 004A6CE8    lea         edx,[ebp-20]
 004A6CEB    mov         ecx,0A
 004A6CF0    call        @UStrFromWArray
 004A6CF5    mov         ecx,dword ptr [ebp-28]
 004A6CF8    lea         eax,[ebp-24]
 004A6CFB    mov         edx,4A6DE0;'\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\'
 004A6D00    call        @UStrCat3
 004A6D05    mov         edx,dword ptr [ebp-24]
 004A6D08    mov         eax,dword ptr [ebp-0C]
 004A6D0B    call        TRegistry.OpenKeyReadOnly
 004A6D10    test        al,al
>004A6D12    je          004A6D85
 004A6D14    lea         ecx,[ebp-4]
 004A6D17    mov         edx,4A6E54;'Layout File'
 004A6D1C    mov         eax,dword ptr [ebp-0C]
 004A6D1F    call        TRegistry.ReadString
 004A6D24    mov         edx,8000
 004A6D29    mov         eax,dword ptr [ebp-4]
 004A6D2C    call        SafeLoadLibrary
 004A6D31    mov         dword ptr [ebp-8],eax
 004A6D34    xor         edx,edx
 004A6D36    push        ebp
 004A6D37    push        4A6D7E
 004A6D3C    push        dword ptr fs:[edx]
 004A6D3F    mov         dword ptr fs:[edx],esp
 004A6D42    push        4A6E6C
 004A6D47    mov         eax,dword ptr [ebp-8]
 004A6D4A    push        eax
 004A6D4B    call        GetProcAddress
 004A6D50    mov         ebx,eax
 004A6D52    call        ebx
 004A6D54    movzx       eax,word ptr [eax+28]
 004A6D58    and         ax,1
 004A6D5C    cmp         ax,1
 004A6D60    sete        byte ptr ds:[785D34]
 004A6D67    xor         eax,eax
 004A6D69    pop         edx
 004A6D6A    pop         ecx
 004A6D6B    pop         ecx
 004A6D6C    mov         dword ptr fs:[eax],edx
 004A6D6F    push        4A6D85
 004A6D74    mov         eax,dword ptr [ebp-8]
 004A6D77    push        eax
 004A6D78    call        kernel32.FreeLibrary
 004A6D7D    ret
>004A6D7E    jmp         @HandleFinally
>004A6D83    jmp         004A6D74
 004A6D85    xor         eax,eax
 004A6D87    pop         edx
 004A6D88    pop         ecx
 004A6D89    pop         ecx
 004A6D8A    mov         dword ptr fs:[eax],edx
 004A6D8D    push        4A6DA2
 004A6D92    mov         eax,dword ptr [ebp-0C]
 004A6D95    call        TObject.Free
 004A6D9A    ret
>004A6D9B    jmp         @HandleFinally
>004A6DA0    jmp         004A6D92
 004A6DA2    xor         eax,eax
 004A6DA4    pop         edx
 004A6DA5    pop         ecx
 004A6DA6    pop         ecx
 004A6DA7    mov         dword ptr fs:[eax],edx
 004A6DAA    push        4A6DCC
 004A6DAF    lea         eax,[ebp-28]
 004A6DB2    mov         edx,2
 004A6DB7    call        @UStrArrayClr
 004A6DBC    lea         eax,[ebp-4]
 004A6DBF    call        @UStrClr
 004A6DC4    ret
>004A6DC5    jmp         @HandleFinally
>004A6DCA    jmp         004A6DAF
 004A6DCC    pop         ebx
 004A6DCD    mov         esp,ebp
 004A6DCF    pop         ebp
 004A6DD0    ret
*}
end;

//004A6E94
function IsAltGRPressed:Boolean;
begin
{*
 004A6E94    push        ebx
 004A6E95    xor         ebx,ebx
 004A6E97    push        0A5
 004A6E9C    call        user32.GetKeyState
 004A6EA1    test        ax,ax
>004A6EA4    jge         004A6EC9
 004A6EA6    push        0
 004A6EA8    call        user32.GetKeyboardLayout
 004A6EAD    mov         ebx,eax
 004A6EAF    cmp         ebx,dword ptr ds:[785D30]
>004A6EB5    je          004A6EC2
 004A6EB7    call        GetAltGRStatus
 004A6EBC    mov         dword ptr ds:[785D30],ebx
 004A6EC2    movzx       ebx,byte ptr ds:[785D34]
 004A6EC9    mov         eax,ebx
 004A6ECB    pop         ebx
 004A6ECC    ret
*}
end;

//004A6ED0
function ShortCutFromMessage(Message:TWMKey):TShortCut;
begin
{*
 004A6ED0    push        ebx
 004A6ED1    push        esi
 004A6ED2    push        edi
 004A6ED3    add         esp,0FFFFFFF0
 004A6ED6    mov         esi,eax
 004A6ED8    lea         edi,[esp]
 004A6EDB    movs        dword ptr [edi],dword ptr [esi]
 004A6EDC    movs        dword ptr [edi],dword ptr [esi]
 004A6EDD    movs        dword ptr [edi],dword ptr [esi]
 004A6EDE    movs        dword ptr [edi],dword ptr [esi]
 004A6EDF    movzx       ebx,byte ptr [esp+4]
 004A6EE4    test        bx,bx
>004A6EE7    je          004A6F17
 004A6EE9    push        10
 004A6EEB    call        user32.GetKeyState
 004A6EF0    test        ax,ax
>004A6EF3    jge         004A6EFA
 004A6EF5    add         bx,2000
 004A6EFA    push        11
 004A6EFC    call        user32.GetKeyState
 004A6F01    test        ax,ax
>004A6F04    jge         004A6F0B
 004A6F06    add         bx,4000
 004A6F0B    test        byte ptr [esp+0B],20
>004A6F10    je          004A6F17
 004A6F12    add         bx,8000
 004A6F17    mov         eax,ebx
 004A6F19    add         esp,10
 004A6F1C    pop         edi
 004A6F1D    pop         esi
 004A6F1E    pop         ebx
 004A6F1F    ret
*}
end;

//004A6F20
function NthParentOf(Item:TMenuItem; N:Integer):TMenuItem;
begin
{*
>004A6F20    jmp         004A6F26
 004A6F22    mov         eax,dword ptr [eax+64]
 004A6F25    dec         edx
 004A6F26    test        edx,edx
>004A6F28    jle         004A6F2E
 004A6F2A    test        eax,eax
>004A6F2C    jne         004A6F22
 004A6F2E    ret
*}
end;

//004A6F30
function DoClick(var Item:TMenuItem; Level:Integer):TClickResult;
begin
{*
 004A6F30    push        ebp
 004A6F31    mov         ebp,esp
 004A6F33    add         esp,0FFFFFFF8
 004A6F36    push        ebx
 004A6F37    push        esi
 004A6F38    push        edi
 004A6F39    mov         esi,edx
 004A6F3B    mov         ebx,eax
 004A6F3D    mov         byte ptr [ebp-1],1
 004A6F41    mov         eax,dword ptr [ebx]
 004A6F43    mov         eax,dword ptr [eax+64]
 004A6F46    mov         dword ptr [ebp-8],eax
 004A6F49    cmp         dword ptr [ebp-8],0
>004A6F4D    je          004A6F62
 004A6F4F    mov         eax,dword ptr [ebp+8]
 004A6F52    push        eax
 004A6F53    lea         edx,[esi+1]
 004A6F56    lea         eax,[ebp-8]
 004A6F59    call        DoClick
 004A6F5E    pop         ecx
 004A6F5F    mov         byte ptr [ebp-1],al
 004A6F62    movzx       eax,byte ptr [ebp-1]
 004A6F66    test        al,al
>004A6F68    je          004A7078
 004A6F6E    sub         al,3
>004A6F70    je          004A7078
 004A6F76    cmp         byte ptr [ebp-1],2
>004A6F7A    jne         004A6FF2
 004A6F7C    mov         eax,dword ptr [ebp+8]
 004A6F7F    cmp         dword ptr [eax-4],0
>004A6F83    je          004A6F98
 004A6F85    mov         eax,dword ptr [ebp+8]
 004A6F88    mov         eax,dword ptr [eax-4]
 004A6F8B    movzx       eax,word ptr [eax+60]
 004A6F8F    mov         edx,dword ptr [ebp+8]
 004A6F92    cmp         ax,word ptr [edx-6]
>004A6F96    je          004A6FC4
 004A6F98    mov         eax,dword ptr [ebp+8]
 004A6F9B    movzx       edx,word ptr [eax-6]
 004A6F9F    mov         eax,dword ptr [ebp+8]
 004A6FA2    mov         eax,dword ptr [eax-0C]
 004A6FA5    mov         cl,2
 004A6FA7    call        TMenu.FindItem
 004A6FAC    mov         edx,dword ptr [ebp+8]
 004A6FAF    mov         dword ptr [edx-4],eax
 004A6FB2    mov         eax,dword ptr [ebp+8]
 004A6FB5    cmp         dword ptr [eax-4],0
>004A6FB9    jne         004A6FC4
 004A6FBB    mov         byte ptr [ebp-1],3
>004A6FBF    jmp         004A7078
 004A6FC4    mov         eax,dword ptr [ebp+8]
 004A6FC7    mov         eax,dword ptr [eax-4]
 004A6FCA    mov         edx,esi
 004A6FCC    call        NthParentOf
 004A6FD1    mov         dword ptr [ebx],eax
 004A6FD3    cmp         dword ptr [ebx],0
>004A6FD6    je          004A7078
 004A6FDC    mov         eax,dword ptr [ebx]
 004A6FDE    mov         eax,dword ptr [eax+64]
 004A6FE1    cmp         eax,dword ptr [ebp-8]
>004A6FE4    jne         004A7078
 004A6FEA    test        esi,esi
>004A6FEC    jne         004A6FF2
 004A6FEE    mov         byte ptr [ebp-1],1
 004A6FF2    mov         eax,dword ptr [ebx]
 004A6FF4    cmp         byte ptr [eax+39],0
>004A6FF8    je          004A7074
 004A6FFA    xor         eax,eax
 004A6FFC    push        ebp
 004A6FFD    push        4A7056
 004A7002    push        dword ptr fs:[eax]
 004A7005    mov         dword ptr fs:[eax],esp
 004A7008    mov         eax,dword ptr [ebp+8]
 004A700B    mov         eax,dword ptr [eax-0C]
 004A700E    test        byte ptr [eax+1C],10
>004A7012    jne         004A701B
 004A7014    mov         eax,dword ptr [ebx]
 004A7016    call        TMenuItem.InitiateActions
 004A701B    mov         eax,dword ptr [ebx]
 004A701D    mov         edx,dword ptr [eax]
 004A701F    call        dword ptr [edx+48]
 004A7022    mov         eax,dword ptr [ebp+8]
 004A7025    cmp         dword ptr [eax-4],0
>004A7029    je          004A7048
 004A702B    mov         eax,dword ptr [ebx]
 004A702D    mov         edx,dword ptr [ebp+8]
 004A7030    cmp         eax,dword ptr [edx-4]
>004A7033    je          004A704C
 004A7035    mov         eax,dword ptr [ebp+8]
 004A7038    mov         eax,dword ptr [eax-4]
 004A703B    movzx       eax,word ptr [eax+60]
 004A703F    mov         edx,dword ptr [ebp+8]
 004A7042    cmp         ax,word ptr [edx-6]
>004A7046    je          004A704C
 004A7048    mov         byte ptr [ebp-1],2
 004A704C    xor         eax,eax
 004A704E    pop         edx
 004A704F    pop         ecx
 004A7050    pop         ecx
 004A7051    mov         dword ptr fs:[eax],edx
>004A7054    jmp         004A7078
>004A7056    jmp         @HandleAnyException
 004A705B    mov         eax,dword ptr [ebp+8]
 004A705E    mov         edx,dword ptr [eax-0C]
 004A7061    mov         eax,[0078D590];^Application:TApplication
 004A7066    mov         eax,dword ptr [eax]
 004A7068    call        TApplication.HandleException
 004A706D    call        @DoneExcept
>004A7072    jmp         004A7078
 004A7074    mov         byte ptr [ebp-1],0
 004A7078    movzx       eax,byte ptr [ebp-1]
 004A707C    pop         edi
 004A707D    pop         esi
 004A707E    pop         ebx
 004A707F    pop         ecx
 004A7080    pop         ecx
 004A7081    pop         ebp
 004A7082    ret
*}
end;

//004A7084
procedure TMenu.IsShortCut(var Message:TWMKey);
begin
{*
 004A7084    push        ebp
 004A7085    mov         ebp,esp
 004A7087    add         esp,0FFFFFFEC
 004A708A    push        ebx
 004A708B    push        esi
 004A708C    mov         esi,edx
 004A708E    mov         dword ptr [ebp-0C],eax
 004A7091    xor         ebx,ebx
 004A7093    call        IsAltGRPressed
 004A7098    test        al,al
>004A709A    jne         004A7170
 004A70A0    mov         eax,esi
 004A70A2    call        ShortCutFromMessage
 004A70A7    mov         word ptr [ebp-6],ax
 004A70AB    mov         eax,dword ptr [ebp-0C]
 004A70AE    mov         eax,dword ptr [eax+38]
 004A70B1    mov         dword ptr [ebp-14],eax
 004A70B4    lea         edx,[ebp-14]
 004A70B7    mov         eax,[00793230]
 004A70BC    call        TOrderedList.Push
 004A70C1    xor         edx,edx
 004A70C3    push        ebp
 004A70C4    push        4A7157
 004A70C9    push        dword ptr fs:[edx]
 004A70CC    mov         dword ptr fs:[edx],esp
 004A70CF    mov         byte ptr [ebp-0D],0
 004A70D3    movzx       edx,word ptr [ebp-6]
 004A70D7    mov         cl,2
 004A70D9    mov         eax,dword ptr [ebp-0C]
 004A70DC    call        TMenu.FindItem
 004A70E1    mov         dword ptr [ebp-4],eax
 004A70E4    cmp         dword ptr [ebp-4],0
>004A70E8    je          004A7133
 004A70EA    lea         edx,[ebp-4]
 004A70ED    mov         eax,[00793230]
 004A70F2    call        TOrderedList.Push
 004A70F7    xor         edx,edx
 004A70F9    push        ebp
 004A70FA    push        4A712C
 004A70FF    push        dword ptr fs:[edx]
 004A7102    mov         dword ptr fs:[edx],esp
 004A7105    push        ebp
 004A7106    lea         eax,[ebp-4]
 004A7109    xor         edx,edx
 004A710B    call        DoClick
 004A7110    pop         ecx
 004A7111    mov         byte ptr [ebp-0D],al
 004A7114    xor         eax,eax
 004A7116    pop         edx
 004A7117    pop         ecx
 004A7118    pop         ecx
 004A7119    mov         dword ptr fs:[eax],edx
 004A711C    push        4A7133
 004A7121    mov         eax,[00793230]
 004A7126    mov         edx,dword ptr [eax]
 004A7128    call        dword ptr [edx+4]
 004A712B    ret
>004A712C    jmp         @HandleFinally
>004A7131    jmp         004A7121
 004A7133    cmp         dword ptr [ebp-14],0
>004A7137    je          004A713F
 004A7139    cmp         byte ptr [ebp-0D],2
>004A713D    je          004A70CF
 004A713F    xor         eax,eax
 004A7141    pop         edx
 004A7142    pop         ecx
 004A7143    pop         ecx
 004A7144    mov         dword ptr fs:[eax],edx
 004A7147    push        4A715E
 004A714C    mov         eax,[00793230]
 004A7151    mov         edx,dword ptr [eax]
 004A7153    call        dword ptr [edx+4]
 004A7156    ret
>004A7157    jmp         @HandleFinally
>004A715C    jmp         004A714C
 004A715E    cmp         dword ptr [ebp-4],0
>004A7162    jne         004A716E
 004A7164    cmp         dword ptr [ebp-14],0
>004A7168    je          004A716E
 004A716A    xor         ebx,ebx
>004A716C    jmp         004A7170
 004A716E    mov         bl,1
 004A7170    mov         eax,ebx
 004A7172    pop         esi
 004A7173    pop         ebx
 004A7174    mov         esp,ebp
 004A7176    pop         ebp
 004A7177    ret
*}
end;

//004A7178
procedure TMainMenu.IsStoredBiDiMode(Value:TBiDiMode);
begin
{*
 004A7178    movzx       eax,byte ptr [eax+41];TMainMenu.FParentBiDiMode:Boolean
 004A717C    xor         al,1
 004A717E    ret
*}
end;

//004A7180
procedure TMenu.DoBiDiModeChanged;
begin
{*
 004A7180    push        ebp
 004A7181    mov         ebp,esp
 004A7183    add         esp,0FFFFFF30
 004A7189    push        ebx
 004A718A    push        esi
 004A718B    mov         ebx,eax
 004A718D    mov         eax,[0078DB7C];SysLocale:TSysLocale
 004A7192    cmp         byte ptr [eax+0D],0
>004A7196    je          004A7280
 004A719C    cmp         dword ptr [ebx+3C],0
>004A71A0    je          004A7280
 004A71A6    mov         eax,ebx
 004A71A8    mov         edx,dword ptr [eax]
 004A71AA    call        dword ptr [edx+38]
 004A71AD    mov         esi,eax
 004A71AF    mov         dword ptr [ebp-2C],10
 004A71B6    mov         dword ptr [ebp-8],50
 004A71BD    mov         eax,[0078DB58];^gvar_00784C7C
 004A71C2    cmp         dword ptr [eax],1
>004A71C5    jne         004A71D1
 004A71C7    mov         eax,[0078D080];^gvar_00784C80
 004A71CC    cmp         dword ptr [eax],4
>004A71CF    jle         004A71DA
 004A71D1    mov         dword ptr [ebp-30],30
>004A71D8    jmp         004A71E1
 004A71DA    mov         dword ptr [ebp-30],2C
 004A71E1    lea         eax,[ebp-0D0]
 004A71E7    mov         dword ptr [ebp-0C],eax
 004A71EA    xor         eax,eax
 004A71EC    push        ebp
 004A71ED    push        4A7279
 004A71F2    push        dword ptr fs:[eax]
 004A71F5    mov         dword ptr fs:[eax],esp
 004A71F8    lea         eax,[ebp-30]
 004A71FB    push        eax
 004A71FC    push        0FF
 004A71FE    push        0
 004A7200    push        esi
 004A7201    call        user32.GetMenuItemInfoW
 004A7206    test        eax,eax
>004A7208    je          004A726B
 004A720A    mov         eax,ebx
 004A720C    call        TMenu.IsRightToLeft
 004A7211    mov         edx,dword ptr [ebp-28]
 004A7214    and         edx,6000
 004A721A    cmp         edx,1
 004A721D    sbb         edx,edx
 004A721F    inc         edx
 004A7220    cmp         al,dl
>004A7222    jne         004A722B
 004A7224    call        @TryFinallyExit
>004A7229    jmp         004A7280
 004A722B    mov         eax,ebx
 004A722D    call        TMenu.IsRightToLeft
 004A7232    and         eax,7F
 004A7235    shl         eax,0D
 004A7238    lea         eax,[eax+eax*2]
 004A723B    mov         edx,dword ptr [ebp-28]
 004A723E    and         edx,0FFFF9FFF
 004A7244    or          eax,edx
 004A7246    mov         dword ptr [ebp-28],eax
 004A7249    mov         dword ptr [ebp-2C],10
 004A7250    lea         eax,[ebp-30]
 004A7253    push        eax
 004A7254    push        0FF
 004A7256    push        0
 004A7258    push        esi
 004A7259    call        user32.SetMenuItemInfoW
 004A725E    test        eax,eax
>004A7260    je          004A726B
 004A7262    mov         eax,dword ptr [ebx+3C]
 004A7265    push        eax
 004A7266    call        user32.DrawMenuBar
 004A726B    xor         eax,eax
 004A726D    pop         edx
 004A726E    pop         ecx
 004A726F    pop         ecx
 004A7270    mov         dword ptr fs:[eax],edx
 004A7273    push        4A7280
 004A7278    ret
>004A7279    jmp         @HandleFinally
>004A727E    jmp         004A7278
 004A7280    pop         esi
 004A7281    pop         ebx
 004A7282    mov         esp,ebp
 004A7284    pop         ebp
 004A7285    ret
*}
end;

//004A7288
procedure BuildImage(Menu:HMENU);
begin
{*
 004A7288    push        ebp
 004A7289    mov         ebp,esp
 004A728B    add         esp,0FFFFFFF4
 004A728E    push        ebx
 004A728F    push        esi
 004A7290    push        edi
 004A7291    mov         dword ptr [ebp-4],eax
 004A7294    mov         eax,dword ptr [ebp-4]
 004A7297    push        eax
 004A7298    call        user32.GetMenuItemCount
 004A729D    mov         dword ptr [ebp-0C],eax
 004A72A0    mov         eax,dword ptr [ebp+8]
 004A72A3    lea         ebx,[eax-400]
 004A72A9    mov         eax,dword ptr [ebp+8]
 004A72AC    add         eax,0FFFFFFF6
 004A72AF    mov         dword ptr [ebp-8],eax
 004A72B2    xor         esi,esi
>004A72B4    jmp         004A7343
 004A72B9    push        ebx
 004A72BA    mov         eax,dword ptr [ebp-8]
 004A72BD    sub         eax,ebx
 004A72BF    sar         eax,1
>004A72C1    jns         004A72C6
 004A72C3    adc         eax,0
 004A72C6    push        eax
 004A72C7    push        400
 004A72CC    mov         eax,dword ptr [ebp+8]
 004A72CF    mov         eax,dword ptr [eax-404]
 004A72D5    mov         ecx,esi
 004A72D7    mov         edx,dword ptr [ebp-4]
 004A72DA    call        TMenu.DoGetMenuString
 004A72DF    mov         eax,ebx
 004A72E1    call        StrEnd
 004A72E6    mov         ebx,eax
 004A72E8    push        400
 004A72ED    push        esi
 004A72EE    mov         eax,dword ptr [ebp-4]
 004A72F1    push        eax
 004A72F2    call        user32.GetMenuState
 004A72F7    mov         edi,eax
 004A72F9    test        di,2
>004A72FE    je          004A730D
 004A7300    mov         word ptr [ebx],24
 004A7305    add         ebx,2
 004A7308    mov         word ptr [ebx],0
 004A730D    test        di,40
>004A7312    je          004A7321
 004A7314    mov         word ptr [ebx],40
 004A7319    add         ebx,2
 004A731C    mov         word ptr [ebx],0
 004A7321    test        di,1
>004A7326    je          004A7335
 004A7328    mov         word ptr [ebx],23
 004A732D    add         ebx,2
 004A7330    mov         word ptr [ebx],0
 004A7335    mov         word ptr [ebx],3B
 004A733A    add         ebx,2
 004A733D    mov         word ptr [ebx],0
 004A7342    inc         esi
 004A7343    cmp         esi,dword ptr [ebp-0C]
>004A7346    jge         004A7351
 004A7348    cmp         ebx,dword ptr [ebp-8]
>004A734B    jb          004A72B9
 004A7351    pop         edi
 004A7352    pop         esi
 004A7353    pop         ebx
 004A7354    mov         esp,ebp
 004A7356    pop         ebp
 004A7357    ret
*}
end;

//004A7358
function TMenu.UpdateImage:Boolean;
begin
{*
 004A7358    push        ebp
 004A7359    mov         ebp,esp
 004A735B    add         esp,0FFFFFBFC
 004A7361    push        ebx
 004A7362    mov         dword ptr [ebp-404],eax
 004A7368    xor         ebx,ebx
 004A736A    mov         word ptr [ebp-400],0
 004A7373    mov         eax,dword ptr [ebp-404]
 004A7379    cmp         dword ptr [eax+3C],0
>004A737D    je          004A7391
 004A737F    push        ebp
 004A7380    mov         eax,dword ptr [ebp-404]
 004A7386    mov         edx,dword ptr [eax]
 004A7388    call        dword ptr [edx+38]
 004A738B    call        BuildImage
 004A7390    pop         ecx
 004A7391    mov         eax,dword ptr [ebp-404]
 004A7397    cmp         dword ptr [eax+58],0
>004A739B    je          004A73BA
 004A739D    mov         eax,dword ptr [ebp-404]
 004A73A3    mov         eax,dword ptr [eax+58]
 004A73A6    call        @UStrToPWChar
 004A73AB    lea         edx,[ebp-400]
 004A73B1    call        StrComp
 004A73B6    test        eax,eax
>004A73B8    je          004A73D5
 004A73BA    mov         bl,1
 004A73BC    mov         eax,dword ptr [ebp-404]
 004A73C2    add         eax,58
 004A73C5    lea         edx,[ebp-400]
 004A73CB    mov         ecx,200
 004A73D0    call        @UStrFromWArray
 004A73D5    mov         eax,ebx
 004A73D7    pop         ebx
 004A73D8    mov         esp,ebp
 004A73DA    pop         ebp
 004A73DB    ret
*}
end;

//004A73DC
procedure TMenu.SetOwnerDraw(Value:Boolean);
begin
{*
 004A73DC    cmp         dl,byte ptr [eax+40]
>004A73DF    je          004A73E9
 004A73E1    mov         byte ptr [eax+40],dl
 004A73E4    call        TMenu.UpdateItems
 004A73E9    ret
*}
end;

//004A73EC
procedure TMenu.AdjustBiDiBehavior;
begin
{*
 004A73EC    push        ebp
 004A73ED    mov         ebp,esp
 004A73EF    add         esp,0FFFFFFF8
 004A73F2    mov         dword ptr [ebp-4],eax
 004A73F5    mov         eax,[0078DB7C];SysLocale:TSysLocale
 004A73FA    cmp         byte ptr [eax+0D],0
>004A73FE    je          004A7467
 004A7400    mov         eax,dword ptr [ebp-4]
 004A7403    movzx       eax,byte ptr [eax+34]
 004A7407    mov         byte ptr [ebp-5],al
 004A740A    mov         edx,dword ptr [ebp-4]
 004A740D    movzx       edx,byte ptr [edx+41]
 004A7411    mov         byte ptr [ebp-6],dl
 004A7414    xor         edx,edx
 004A7416    push        ebp
 004A7417    push        4A7460
 004A741C    push        dword ptr fs:[edx]
 004A741F    mov         dword ptr fs:[edx],esp
 004A7422    test        al,al
>004A7424    jne         004A7432
 004A7426    mov         dl,1
 004A7428    mov         eax,dword ptr [ebp-4]
 004A742B    call        TMenu.SetBiDiMode
>004A7430    jmp         004A743C
 004A7432    xor         edx,edx
 004A7434    mov         eax,dword ptr [ebp-4]
 004A7437    call        TMenu.SetBiDiMode
 004A743C    xor         eax,eax
 004A743E    pop         edx
 004A743F    pop         ecx
 004A7440    pop         ecx
 004A7441    mov         dword ptr fs:[eax],edx
 004A7444    push        4A7467
 004A7449    movzx       edx,byte ptr [ebp-5]
 004A744D    mov         eax,dword ptr [ebp-4]
 004A7450    call        TMenu.SetBiDiMode
 004A7455    mov         eax,dword ptr [ebp-4]
 004A7458    movzx       edx,byte ptr [ebp-6]
 004A745C    mov         byte ptr [eax+41],dl
 004A745F    ret
>004A7460    jmp         @HandleFinally
>004A7465    jmp         004A7449
 004A7467    pop         ecx
 004A7468    pop         ecx
 004A7469    pop         ebp
 004A746A    ret
*}
end;

//004A746C
procedure TMenu.SetWindowHandle(Value:HWND);
begin
{*
 004A746C    push        ebx
 004A746D    push        esi
 004A746E    mov         esi,edx
 004A7470    mov         ebx,eax
 004A7472    mov         dword ptr [ebx+3C],esi
 004A7475    mov         eax,ebx
 004A7477    call        TMenu.UpdateImage
 004A747C    mov         eax,[0078DB7C];SysLocale:TSysLocale
 004A7481    cmp         byte ptr [eax+0D],0
>004A7485    je          004A74A1
 004A7487    test        esi,esi
>004A7489    je          004A74A1
 004A748B    cmp         byte ptr [ebx+41],0
>004A748F    je          004A749A
 004A7491    mov         eax,ebx
 004A7493    call        TMenu.ParentBiDiModeChanged
>004A7498    jmp         004A74A1
 004A749A    mov         eax,ebx
 004A749C    call        TMenu.AdjustBiDiBehavior
 004A74A1    pop         esi
 004A74A2    pop         ebx
 004A74A3    ret
*}
end;

//004A74A4
procedure TMenu.DoChange(Source:TMenuItem; Rebuild:Boolean);
begin
{*
 004A74A4    push        ebx
 004A74A5    cmp         word ptr [eax+52],0
>004A74AA    je          004A74B9
 004A74AC    push        ecx
 004A74AD    mov         ebx,eax
 004A74AF    mov         ecx,edx
 004A74B1    mov         edx,eax
 004A74B3    mov         eax,dword ptr [ebx+54]
 004A74B6    call        dword ptr [ebx+50]
 004A74B9    pop         ebx
 004A74BA    ret
*}
end;

//004A74BC
procedure TMenu.Loaded;
begin
{*
 004A74BC    push        ebx
 004A74BD    mov         ebx,eax
 004A74BF    mov         eax,ebx
 004A74C1    call        TComponent.Loaded
 004A74C6    xor         ecx,ecx
 004A74C8    xor         edx,edx
 004A74CA    mov         eax,ebx
 004A74CC    mov         ebx,dword ptr [eax]
 004A74CE    call        dword ptr [ebx+34]
 004A74D1    pop         ebx
 004A74D2    ret
*}
end;

//004A74D4
procedure TMenu.MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);
begin
{*
 004A74D4    push        ebp
 004A74D5    mov         ebp,esp
 004A74D7    push        ebx
 004A74D8    push        esi
 004A74D9    mov         esi,ecx
 004A74DB    mov         ebx,eax
 004A74DD    movzx       eax,word ptr ds:[4A7508]
 004A74E4    and         ax,word ptr [ebx+1C]
 004A74E8    movzx       edx,word ptr ds:[4A750C]
 004A74EF    cmp         dx,ax
>004A74F2    jne         004A7501
 004A74F4    movzx       ecx,byte ptr [ebp+8]
 004A74F8    mov         edx,esi
 004A74FA    mov         eax,ebx
 004A74FC    mov         ebx,dword ptr [eax]
 004A74FE    call        dword ptr [ebx+34]
 004A7501    pop         esi
 004A7502    pop         ebx
 004A7503    pop         ebp
 004A7504    ret         4
*}
end;

//004A7510
procedure TMenu.ImageListChange(Sender:TObject);
begin
{*
 004A7510    cmp         edx,dword ptr [eax+48]
>004A7513    jne         004A751A
 004A7515    call        TMenu.UpdateItems
 004A751A    ret
*}
end;

//004A751C
procedure TMenu.SetImages(Value:TCustomImageList);
begin
{*
 004A751C    push        ebx
 004A751D    push        esi
 004A751E    mov         esi,edx
 004A7520    mov         ebx,eax
 004A7522    mov         eax,dword ptr [ebx+48]
 004A7525    test        eax,eax
>004A7527    je          004A7531
 004A7529    mov         edx,dword ptr [ebx+44]
 004A752C    call        TCustomImageList.UnRegisterChanges
 004A7531    mov         eax,esi
 004A7533    mov         dword ptr [ebx+48],eax
 004A7536    test        eax,eax
>004A7538    je          004A754C
 004A753A    mov         edx,dword ptr [ebx+44]
 004A753D    call        TCustomImageList.RegisterChanges
 004A7542    mov         edx,ebx
 004A7544    mov         eax,dword ptr [ebx+48]
 004A7547    call        TComponent.FreeNotification
 004A754C    mov         eax,ebx
 004A754E    call        TMenu.UpdateItems
 004A7553    pop         esi
 004A7554    pop         ebx
 004A7555    ret
*}
end;

//004A7558
procedure TMenu.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 004A7558    push        ebx
 004A7559    push        esi
 004A755A    push        edi
 004A755B    mov         ebx,ecx
 004A755D    mov         esi,edx
 004A755F    mov         edi,eax
 004A7561    mov         ecx,ebx
 004A7563    mov         edx,esi
 004A7565    mov         eax,edi
 004A7567    call        TComponent.Notification
 004A756C    cmp         esi,dword ptr [edi+48]
>004A756F    jne         004A757F
 004A7571    cmp         bl,1
>004A7574    jne         004A757F
 004A7576    xor         edx,edx
 004A7578    mov         eax,edi
 004A757A    call        TMenu.SetImages
 004A757F    pop         edi
 004A7580    pop         esi
 004A7581    pop         ebx
 004A7582    ret
*}
end;

//004A7584
function TMenu.IsRightToLeft:Boolean;
begin
{*
 004A7584    mov         edx,dword ptr ds:[78DB7C];SysLocale:TSysLocale
 004A758A    cmp         byte ptr [edx+0D],0
>004A758E    je          004A7596
 004A7590    cmp         byte ptr [eax+34],0
>004A7594    jne         004A7599
 004A7596    xor         eax,eax
 004A7598    ret
 004A7599    mov         al,1
 004A759B    ret
*}
end;

//004A759C
function IsAccelChar(Menu:HMENU; State:Word; I:Integer; C:Char):Boolean;
begin
{*
 004A759C    push        ebp
 004A759D    mov         ebp,esp
 004A759F    push        esi
 004A75A0    xor         esi,esi
 004A75A2    test        dl,10
>004A75A5    je          004A75C0
 004A75A7    push        ecx
 004A75A8    push        eax
 004A75A9    call        user32.GetSubMenu
 004A75AE    mov         edx,dword ptr [ebp+0C]
 004A75B1    mov         edx,dword ptr [edx-4]
 004A75B4    mov         cl,1
 004A75B6    xchg        eax,edx
 004A75B7    call        TMenu.FindItem
 004A75BC    mov         esi,eax
>004A75BE    jmp         004A75DC
 004A75C0    push        ecx
 004A75C1    push        eax
 004A75C2    call        user32.GetMenuItemID
 004A75C7    cmp         eax,0FFFFFFFF
>004A75CA    je          004A75DC
 004A75CC    mov         edx,dword ptr [ebp+0C]
 004A75CF    mov         edx,dword ptr [edx-4]
 004A75D2    xor         ecx,ecx
 004A75D4    xchg        eax,edx
 004A75D5    call        TMenu.FindItem
 004A75DA    mov         esi,eax
 004A75DC    test        esi,esi
>004A75DE    je          004A75EE
 004A75E0    movzx       eax,word ptr [ebp+8]
 004A75E4    mov         edx,dword ptr [esi+34]
 004A75E7    call        IsAccel
>004A75EC    jmp         004A75F0
 004A75EE    xor         eax,eax
 004A75F0    pop         esi
 004A75F1    pop         ebp
 004A75F2    ret         4
*}
end;

//004A75F8
function IsInitialChar(Menu:HMENU; State:Word; I:Integer; C:Char):Boolean;
begin
{*
 004A75F8    push        ebp
 004A75F9    mov         ebp,esp
 004A75FB    push        0
 004A75FD    push        0
 004A75FF    push        0
 004A7601    push        0
 004A7603    push        ebx
 004A7604    push        esi
 004A7605    mov         esi,ecx
 004A7607    mov         word ptr [ebp-2],dx
 004A760B    xor         edx,edx
 004A760D    push        ebp
 004A760E    push        4A76CF
 004A7613    push        dword ptr fs:[edx]
 004A7616    mov         dword ptr fs:[edx],esp
 004A7619    test        byte ptr [ebp-2],10
>004A761D    je          004A7638
 004A761F    push        esi
 004A7620    push        eax
 004A7621    call        user32.GetSubMenu
 004A7626    mov         edx,dword ptr [ebp+0C]
 004A7629    mov         edx,dword ptr [edx-4]
 004A762C    mov         cl,1
 004A762E    xchg        eax,edx
 004A762F    call        TMenu.FindItem
 004A7634    mov         ebx,eax
>004A7636    jmp         004A7662
 004A7638    mov         edx,dword ptr [ebp+0C]
 004A763B    mov         edx,dword ptr [edx-4]
 004A763E    mov         cl,1
 004A7640    xchg        eax,edx
 004A7641    call        TMenu.FindItem
 004A7646    mov         ebx,eax
 004A7648    test        ebx,ebx
>004A764A    je          004A7662
 004A764C    mov         eax,ebx
 004A764E    call        TMenuItem.GetCount
 004A7653    cmp         esi,eax
>004A7655    jge         004A7662
 004A7657    mov         edx,esi
 004A7659    mov         eax,ebx
 004A765B    call        TMenuItem.GetItem
 004A7660    mov         ebx,eax
 004A7662    test        ebx,ebx
>004A7664    je          004A76B2
 004A7666    cmp         dword ptr [ebx+34],0
>004A766A    je          004A76B2
 004A766C    lea         eax,[ebp-8]
 004A766F    movzx       edx,word ptr [ebp+8]
 004A7673    call        @UStrFromWChar
 004A7678    mov         eax,dword ptr [ebp-8]
 004A767B    push        eax
 004A767C    lea         eax,[ebp-0C]
 004A767F    mov         edx,dword ptr [ebx+34]
 004A7682    movzx       edx,word ptr [edx]
 004A7685    call        @UStrFromWChar
 004A768A    mov         eax,dword ptr [ebp-0C]
 004A768D    pop         edx
 004A768E    call        AnsiCompareText
 004A7693    test        eax,eax
>004A7695    jne         004A76A8
 004A7697    lea         edx,[ebp-10]
 004A769A    mov         eax,dword ptr [ebx+34]
 004A769D    call        GetHotkey
 004A76A2    cmp         dword ptr [ebp-10],0
>004A76A6    je          004A76AC
 004A76A8    xor         eax,eax
>004A76AA    jmp         004A76AE
 004A76AC    mov         al,1
 004A76AE    mov         ebx,eax
>004A76B0    jmp         004A76B4
 004A76B2    xor         ebx,ebx
 004A76B4    xor         eax,eax
 004A76B6    pop         edx
 004A76B7    pop         ecx
 004A76B8    pop         ecx
 004A76B9    mov         dword ptr fs:[eax],edx
 004A76BC    push        4A76D6
 004A76C1    lea         eax,[ebp-10]
 004A76C4    mov         edx,3
 004A76C9    call        @UStrArrayClr
 004A76CE    ret
>004A76CF    jmp         @HandleFinally
>004A76D4    jmp         004A76C1
 004A76D6    mov         eax,ebx
 004A76D8    pop         esi
 004A76D9    pop         ebx
 004A76DA    mov         esp,ebp
 004A76DC    pop         ebp
 004A76DD    ret         4
*}
end;

//004A76E0
procedure TMenu.ProcessMenuChar(var Message:TWMMenuChar);
begin
{*
 004A76E0    push        ebp
 004A76E1    mov         ebp,esp
 004A76E3    add         esp,0FFFFFFE8
 004A76E6    push        ebx
 004A76E7    push        esi
 004A76E8    push        edi
 004A76E9    mov         ebx,edx
 004A76EB    mov         dword ptr [ebp-4],eax
 004A76EE    xor         eax,eax
 004A76F0    mov         dword ptr [ebx+0C],eax
 004A76F3    mov         dword ptr [ebp-0C],0FFFFFFFF
 004A76FA    mov         dword ptr [ebp-10],0FFFFFFFF
 004A7701    mov         dword ptr [ebp-14],0FFFFFFFF
 004A7708    mov         eax,dword ptr [ebx+8]
 004A770B    push        eax
 004A770C    call        user32.GetMenuItemCount
 004A7711    mov         dword ptr [ebp-8],eax
 004A7714    mov         eax,dword ptr [ebp-8]
 004A7717    dec         eax
 004A7718    test        eax,eax
>004A771A    jl          004A7794
 004A771C    inc         eax
 004A771D    mov         dword ptr [ebp-18],eax
 004A7720    xor         esi,esi
 004A7722    push        400
 004A7727    push        esi
 004A7728    mov         eax,dword ptr [ebx+8]
 004A772B    push        eax
 004A772C    call        user32.GetMenuState
 004A7731    mov         edi,eax
 004A7733    push        ebp
 004A7734    movzx       eax,word ptr [ebx+4]
 004A7738    push        eax
 004A7739    mov         eax,dword ptr [ebx+8]
 004A773C    mov         ecx,esi
 004A773E    mov         edx,edi
 004A7740    call        IsAccelChar
 004A7745    pop         ecx
 004A7746    test        al,al
>004A7748    je          004A778E
 004A774A    test        di,2
>004A774F    je          004A7760
 004A7751    cmp         dword ptr [ebp-0C],0
>004A7755    jge         004A778E
 004A7757    mov         dword ptr [ebp-0C],0FFFFFFFE
>004A775E    jmp         004A778E
 004A7760    cmp         dword ptr [ebp-0C],0
>004A7764    jge         004A7772
 004A7766    mov         dword ptr [ebp-0C],esi
 004A7769    mov         dword ptr [ebx+0C],2
>004A7770    jmp         004A7779
 004A7772    mov         dword ptr [ebx+0C],3
 004A7779    test        di,80
>004A777E    je          004A7785
 004A7780    mov         dword ptr [ebp-10],esi
>004A7783    jmp         004A778E
 004A7785    cmp         dword ptr [ebp-10],0
>004A7789    jl          004A778E
 004A778B    mov         dword ptr [ebp-14],esi
 004A778E    inc         esi
 004A778F    dec         dword ptr [ebp-18]
>004A7792    jne         004A7722
 004A7794    cmp         dword ptr [ebp-0C],0FFFFFFFF
>004A7798    jge         004A77A6
 004A779A    mov         dword ptr [ebx+0C],10000
>004A77A1    jmp         004A7853
 004A77A6    cmp         dword ptr [ebp-0C],0
>004A77AA    jge         004A7826
 004A77AC    mov         eax,dword ptr [ebp-8]
 004A77AF    dec         eax
 004A77B0    test        eax,eax
>004A77B2    jl          004A7826
 004A77B4    inc         eax
 004A77B5    mov         dword ptr [ebp-18],eax
 004A77B8    xor         esi,esi
 004A77BA    push        400
 004A77BF    push        esi
 004A77C0    mov         eax,dword ptr [ebx+8]
 004A77C3    push        eax
 004A77C4    call        user32.GetMenuState
 004A77C9    mov         edi,eax
 004A77CB    push        ebp
 004A77CC    movzx       eax,word ptr [ebx+4]
 004A77D0    push        eax
 004A77D1    mov         eax,dword ptr [ebx+8]
 004A77D4    mov         ecx,esi
 004A77D6    mov         edx,edi
 004A77D8    call        IsInitialChar
 004A77DD    pop         ecx
 004A77DE    test        al,al
>004A77E0    je          004A7820
 004A77E2    test        di,2
>004A77E7    je          004A77F2
 004A77E9    mov         dword ptr [ebx+0C],10000
>004A77F0    jmp         004A7853
 004A77F2    cmp         dword ptr [ebp-0C],0
>004A77F6    jge         004A7804
 004A77F8    mov         dword ptr [ebp-0C],esi
 004A77FB    mov         dword ptr [ebx+0C],2
>004A7802    jmp         004A780B
 004A7804    mov         dword ptr [ebx+0C],3
 004A780B    test        di,80
>004A7810    je          004A7817
 004A7812    mov         dword ptr [ebp-10],esi
>004A7815    jmp         004A7820
 004A7817    cmp         dword ptr [ebp-10],0
>004A781B    jl          004A7820
 004A781D    mov         dword ptr [ebp-14],esi
 004A7820    inc         esi
 004A7821    dec         dword ptr [ebp-18]
>004A7824    jne         004A77BA
 004A7826    mov         eax,dword ptr [ebx+0C]
 004A7829    cmp         eax,2
>004A782C    jne         004A7839
 004A782E    shl         eax,10
 004A7831    or          eax,dword ptr [ebp-0C]
 004A7834    mov         dword ptr [ebx+0C],eax
>004A7837    jmp         004A7853
 004A7839    cmp         eax,3
>004A783C    jne         004A7853
 004A783E    cmp         dword ptr [ebp-14],0
>004A7842    jge         004A784A
 004A7844    mov         edx,dword ptr [ebp-0C]
 004A7847    mov         dword ptr [ebp-14],edx
 004A784A    shl         eax,10
 004A784D    or          eax,dword ptr [ebp-14]
 004A7850    mov         dword ptr [ebx+0C],eax
 004A7853    pop         edi
 004A7854    pop         esi
 004A7855    pop         ebx
 004A7856    mov         esp,ebp
 004A7858    pop         ebp
 004A7859    ret
*}
end;

//004A785C
function TMenu.DoGetMenuString(Menu:HMENU; ItemID:UINT; Str:PChar; MaxCount:Integer; Flag:UINT):Integer;
begin
{*
 004A785C    push        ebp
 004A785D    mov         ebp,esp
 004A785F    push        ecx
 004A7860    push        ebx
 004A7861    push        esi
 004A7862    push        edi
 004A7863    mov         esi,ecx
 004A7865    mov         edi,edx
 004A7867    mov         ebx,eax
 004A7869    mov         eax,ebx
 004A786B    call        TMenu.IsOwnerDraw
 004A7870    test        al,al
>004A7872    je          004A78EA
 004A7874    xor         eax,eax
 004A7876    mov         dword ptr [ebp-4],eax
 004A7879    mov         eax,dword ptr [ebp+8]
 004A787C    push        eax
 004A787D    push        esi
 004A787E    push        edi
 004A787F    call        user32.GetMenuState
 004A7884    test        al,10
>004A7886    je          004A78A1
 004A7888    push        esi
 004A7889    push        edi
 004A788A    call        user32.GetSubMenu
 004A788F    mov         edi,eax
 004A7891    mov         cl,1
 004A7893    mov         edx,edi
 004A7895    mov         eax,ebx
 004A7897    call        TMenu.FindItem
 004A789C    mov         dword ptr [ebp-4],eax
>004A789F    jmp         004A78BD
 004A78A1    push        esi
 004A78A2    push        edi
 004A78A3    call        user32.GetMenuItemID
 004A78A8    mov         esi,eax
 004A78AA    cmp         esi,0FFFFFFFF
>004A78AD    je          004A78BD
 004A78AF    xor         ecx,ecx
 004A78B1    mov         edx,esi
 004A78B3    mov         eax,ebx
 004A78B5    call        TMenu.FindItem
 004A78BA    mov         dword ptr [ebp-4],eax
 004A78BD    cmp         dword ptr [ebp-4],0
>004A78C1    je          004A78E6
 004A78C3    mov         eax,dword ptr [ebp+10]
 004A78C6    mov         word ptr [eax],0
 004A78CB    mov         eax,dword ptr [ebp-4]
 004A78CE    mov         edx,dword ptr [eax+34]
 004A78D1    mov         ecx,dword ptr [ebp+0C]
 004A78D4    mov         eax,dword ptr [ebp+10]
 004A78D7    call        StrPLCopy
 004A78DC    mov         eax,dword ptr [ebp+10]
 004A78DF    call        StrLen
>004A78E4    jmp         004A78FD
 004A78E6    xor         eax,eax
>004A78E8    jmp         004A78FD
 004A78EA    mov         eax,dword ptr [ebp+8]
 004A78ED    push        eax
 004A78EE    mov         eax,dword ptr [ebp+0C]
 004A78F1    push        eax
 004A78F2    mov         eax,dword ptr [ebp+10]
 004A78F5    push        eax
 004A78F6    push        esi
 004A78F7    push        edi
 004A78F8    call        user32.GetMenuStringW
 004A78FD    pop         edi
 004A78FE    pop         esi
 004A78FF    pop         ebx
 004A7900    pop         ecx
 004A7901    pop         ebp
 004A7902    ret         0C
*}
end;

//004A7908
procedure TMenu.SetBiDiMode(Value:TBiDiMode);
begin
{*
 004A7908    cmp         dl,byte ptr [eax+34]
>004A790B    je          004A7919
 004A790D    mov         byte ptr [eax+34],dl
 004A7910    mov         byte ptr [eax+41],0
 004A7914    call        TMenu.DoBiDiModeChanged
 004A7919    ret
*}
end;

//004A791C
procedure TMenu.SetParentBiDiMode(Value:Boolean);
begin
{*
 004A791C    cmp         dl,byte ptr [eax+41]
>004A791F    je          004A7929
 004A7921    mov         byte ptr [eax+41],dl
 004A7924    call        TMenu.ParentBiDiModeChanged
 004A7929    ret
*}
end;

//004A792C
procedure TMenu.ParentBiDiModeChanged;
begin
{*
 004A792C    push        ebx
 004A792D    mov         ebx,eax
 004A792F    cmp         byte ptr [ebx+41],0
>004A7933    je          004A7950
 004A7935    mov         eax,dword ptr [ebx+3C]
 004A7938    call        FindControl
 004A793D    test        eax,eax
>004A793F    je          004A7950
 004A7941    movzx       edx,byte ptr [eax+61]
 004A7945    mov         eax,ebx
 004A7947    call        TMenu.SetBiDiMode
 004A794C    mov         byte ptr [ebx+41],1
 004A7950    pop         ebx
 004A7951    ret
*}
end;

//004A7954
procedure TMenu.ParentBiDiModeChanged(AControl:TObject);
begin
{*
 004A7954    push        ebx
 004A7955    push        esi
 004A7956    mov         esi,edx
 004A7958    mov         ebx,eax
 004A795A    cmp         byte ptr [ebx+41],0
>004A795E    je          004A797C
 004A7960    mov         eax,esi
 004A7962    mov         edx,dword ptr ds:[47A16C];TControl
 004A7968    call        @AsClass
 004A796D    movzx       edx,byte ptr [eax+61]
 004A7971    mov         eax,ebx
 004A7973    call        TMenu.SetBiDiMode
 004A7978    mov         byte ptr [ebx+41],1
 004A797C    pop         esi
 004A797D    pop         ebx
 004A797E    ret
*}
end;

//004A7980
function TMenu.GetAutoHotkeys:TMenuAutoFlag;
begin
{*
 004A7980    mov         eax,dword ptr [eax+38]
 004A7983    movzx       eax,byte ptr [eax+3B]
 004A7987    movzx       eax,byte ptr [eax+785C0E]
 004A798E    ret
*}
end;

//004A7990
procedure TMenu.SetAutoHotkeys(const Value:TMenuAutoFlag);
begin
{*
 004A7990    and         edx,7F
 004A7993    movzx       edx,byte ptr [edx+785C0C]
 004A799A    mov         eax,dword ptr [eax+38]
 004A799D    mov         byte ptr [eax+3B],dl
 004A79A0    ret
*}
end;

//004A79A4
function TMenu.GetAutoLineReduction:TMenuAutoFlag;
begin
{*
 004A79A4    mov         eax,dword ptr [eax+38]
 004A79A7    movzx       eax,byte ptr [eax+3C]
 004A79AB    movzx       eax,byte ptr [eax+785C0E]
 004A79B2    ret
*}
end;

//004A79B4
procedure TMenu.SetAutoLineReduction(const Value:TMenuAutoFlag);
begin
{*
 004A79B4    and         edx,7F
 004A79B7    movzx       edx,byte ptr [edx+785C0C]
 004A79BE    mov         eax,dword ptr [eax+38]
 004A79C1    mov         byte ptr [eax+3C],dl
 004A79C4    ret
*}
end;

//004A79C8
procedure TMainMenu.SetAutoMerge(Value:Boolean);
begin
{*
 004A79C8    cmp         dl,byte ptr [eax+64]
>004A79CB    je          004A79E6
 004A79CD    mov         byte ptr [eax+64],dl
 004A79D0    mov         edx,dword ptr [eax+3C]
 004A79D3    test        edx,edx
>004A79D5    je          004A79E6
 004A79D7    push        0
 004A79D9    push        0
 004A79DB    push        0B015
 004A79E0    push        edx
 004A79E1    call        user32.SendMessageW
 004A79E6    ret
*}
end;

//004A79E8
procedure TMainMenu.MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);
begin
{*
 004A79E8    push        ebp
 004A79E9    mov         ebp,esp
 004A79EB    push        ecx
 004A79EC    push        ebx
 004A79ED    push        esi
 004A79EE    push        edi
 004A79EF    mov         esi,ecx
 004A79F1    mov         dword ptr [ebp-4],edx
 004A79F4    mov         edi,eax
 004A79F6    cmp         dword ptr [edi+3C],0
>004A79FA    je          004A7A28
 004A79FC    mov         eax,edi
 004A79FE    call        TMenu.UpdateImage
 004A7A03    mov         ebx,eax
 004A7A05    test        esi,esi
>004A7A07    jne         004A7A1B
 004A7A09    push        0
 004A7A0B    push        0
 004A7A0D    push        0B015
 004A7A12    mov         eax,dword ptr [edi+3C]
 004A7A15    push        eax
 004A7A16    call        user32.SendMessageW
 004A7A1B    test        bl,bl
>004A7A1D    je          004A7A28
 004A7A1F    mov         eax,dword ptr [edi+3C]
 004A7A22    push        eax
 004A7A23    call        user32.DrawMenuBar
 004A7A28    movzx       eax,byte ptr [ebp+8]
 004A7A2C    push        eax
 004A7A2D    mov         ecx,esi
 004A7A2F    mov         edx,dword ptr [ebp-4]
 004A7A32    mov         eax,edi
 004A7A34    call        TMenu.MenuChanged
 004A7A39    pop         edi
 004A7A3A    pop         esi
 004A7A3B    pop         ebx
 004A7A3C    pop         ecx
 004A7A3D    pop         ebp
 004A7A3E    ret         4
*}
end;

//004A7A44
procedure TMainMenu.Merge(Menu:TMainMenu);
begin
{*
 004A7A44    test        edx,edx
>004A7A46    je          004A7A54
 004A7A48    mov         eax,dword ptr [eax+38]
 004A7A4B    mov         edx,dword ptr [edx+38]
 004A7A4E    call        TMenuItem.MergeWith
 004A7A53    ret
 004A7A54    xor         edx,edx
 004A7A56    mov         eax,dword ptr [eax+38]
 004A7A59    call        TMenuItem.MergeWith
 004A7A5E    ret
*}
end;

//004A7A60
procedure TMainMenu.Unmerge(Menu:TMainMenu);
begin
{*
 004A7A60    test        edx,edx
>004A7A62    je          004A7A79
 004A7A64    mov         ecx,dword ptr [eax+38]
 004A7A67    mov         ecx,dword ptr [ecx+68]
 004A7A6A    cmp         ecx,dword ptr [edx+38]
>004A7A6D    jne         004A7A79
 004A7A6F    xor         edx,edx
 004A7A71    mov         eax,dword ptr [eax+38]
 004A7A74    call        TMenuItem.MergeWith
 004A7A79    ret
*}
end;

//004A7A7C
procedure TMainMenu.ItemChanged;
begin
{*
 004A7A7C    push        ebx
 004A7A7D    push        esi
 004A7A7E    mov         ebx,eax
 004A7A80    push        0
 004A7A82    xor         ecx,ecx
 004A7A84    xor         edx,edx
 004A7A86    mov         eax,ebx
 004A7A88    mov         esi,dword ptr [eax]
 004A7A8A    call        dword ptr [esi+3C]
 004A7A8D    mov         eax,dword ptr [ebx+3C]
 004A7A90    test        eax,eax
>004A7A92    je          004A7AA3
 004A7A94    push        0
 004A7A96    push        0
 004A7A98    push        0B015
 004A7A9D    push        eax
 004A7A9E    call        user32.SendMessageW
 004A7AA3    pop         esi
 004A7AA4    pop         ebx
 004A7AA5    ret
*}
end;

//004A7AA8
function TMainMenu.GetHandle:HMENU;
begin
{*
 004A7AA8    mov         edx,dword ptr [eax+60]
 004A7AAB    test        edx,edx
>004A7AAD    je          004A7AB2
 004A7AAF    mov         eax,edx
 004A7AB1    ret
 004A7AB2    call        TMenu.GetHandle
 004A7AB7    ret
*}
end;

//004A7AB8
procedure ProcessAccels(Item:TMenuItem);
begin
{*
 004A7AB8    push        ebp
 004A7AB9    mov         ebp,esp
 004A7ABB    push        ebx
 004A7ABC    push        esi
 004A7ABD    push        edi
 004A7ABE    mov         esi,eax
 004A7AC0    movzx       edx,word ptr [esi+60]
 004A7AC4    test        dx,dx
>004A7AC7    je          004A7B26
 004A7AC9    mov         eax,dword ptr [ebp+8]
 004A7ACC    cmp         dword ptr [eax-4],0
>004A7AD0    je          004A7B1E
 004A7AD2    mov         al,3
 004A7AD4    test        dh,40
>004A7AD7    je          004A7ADB
 004A7AD9    or          al,8
 004A7ADB    test        dh,80
>004A7ADE    je          004A7AE2
 004A7AE0    or          al,10
 004A7AE2    test        dh,20
>004A7AE5    je          004A7AE9
 004A7AE7    or          al,4
 004A7AE9    movzx       eax,al
 004A7AEC    mov         edx,dword ptr [ebp+8]
 004A7AEF    mov         edx,dword ptr [edx-4]
 004A7AF2    mov         word ptr [edx],ax
 004A7AF5    movzx       eax,word ptr [esi+60]
 004A7AF9    and         ax,0FF
 004A7AFD    mov         edx,dword ptr [ebp+8]
 004A7B00    mov         edx,dword ptr [edx-4]
 004A7B03    mov         word ptr [edx+2],ax
 004A7B07    mov         eax,dword ptr [ebp+8]
 004A7B0A    mov         eax,dword ptr [eax-4]
 004A7B0D    movzx       edx,word ptr [esi+50]
 004A7B11    mov         word ptr [eax+4],dx
 004A7B15    mov         eax,dword ptr [ebp+8]
 004A7B18    add         dword ptr [eax-4],6
>004A7B1C    jmp         004A7B4E
 004A7B1E    mov         eax,dword ptr [ebp+8]
 004A7B21    inc         dword ptr [eax-8]
>004A7B24    jmp         004A7B4E
 004A7B26    mov         eax,esi
 004A7B28    call        TMenuItem.GetCount
 004A7B2D    mov         ebx,eax
 004A7B2F    dec         ebx
 004A7B30    test        ebx,ebx
>004A7B32    jl          004A7B4E
 004A7B34    inc         ebx
 004A7B35    xor         edi,edi
 004A7B37    mov         eax,dword ptr [ebp+8]
 004A7B3A    push        eax
 004A7B3B    mov         edx,edi
 004A7B3D    mov         eax,esi
 004A7B3F    call        TMenuItem.GetItem
 004A7B44    call        ProcessAccels
 004A7B49    pop         ecx
 004A7B4A    inc         edi
 004A7B4B    dec         ebx
>004A7B4C    jne         004A7B37
 004A7B4E    pop         edi
 004A7B4F    pop         esi
 004A7B50    pop         ebx
 004A7B51    pop         ebp
 004A7B52    ret
*}
end;

//004A7B54
function ProcessAccelItems(Item:TMenuItem):Boolean;
begin
{*
 004A7B54    push        ebp
 004A7B55    mov         ebp,esp
 004A7B57    push        ebx
 004A7B58    push        esi
 004A7B59    mov         edx,dword ptr [ebp+8]
 004A7B5C    mov         ecx,dword ptr [edx+8]
 004A7B5F    test        ecx,ecx
>004A7B61    jl          004A7B84
 004A7B63    inc         ecx
 004A7B64    mov         edx,dword ptr [ebp+8]
 004A7B67    mov         edx,dword ptr [edx+0C]
 004A7B6A    movzx       ebx,byte ptr [eax+3F]
 004A7B6E    cmp         ebx,dword ptr [edx]
>004A7B70    jne         004A7B7E
 004A7B72    mov         edx,dword ptr [ebp+8]
 004A7B75    push        edx
 004A7B76    call        ProcessAccels
 004A7B7B    pop         ecx
>004A7B7C    jmp         004A7B84
 004A7B7E    add         edx,4
 004A7B81    dec         ecx
>004A7B82    jne         004A7B6A
 004A7B84    xor         eax,eax
 004A7B86    pop         esi
 004A7B87    pop         ebx
 004A7B88    pop         ebp
 004A7B89    ret
*}
end;

//004A7B8C
procedure TMainMenu.GetOle2AcceleratorTable(var AccelTable:HACCEL; var AccelCount:Integer; const Groups:array[$0..-$1] of System.Integer; const _Dv_:$0..-$1);
begin
{*
 004A7B8C    push        ebp
 004A7B8D    mov         ebp,esp
 004A7B8F    add         esp,0FFFFFFF0
 004A7B92    push        ebx
 004A7B93    push        esi
 004A7B94    mov         dword ptr [ebp-10],ecx
 004A7B97    mov         dword ptr [ebp-0C],edx
 004A7B9A    mov         ebx,eax
 004A7B9C    xor         eax,eax
 004A7B9E    mov         dword ptr [ebp-8],eax
 004A7BA1    xor         eax,eax
 004A7BA3    mov         dword ptr [ebp-4],eax
 004A7BA6    mov         eax,dword ptr [ebx+38]
 004A7BA9    mov         edx,dword ptr [eax+68]
 004A7BAC    mov         ecx,4A7B54;ProcessAccelItems:Boolean
 004A7BB1    xchg        eax,ecx
 004A7BB2    call        IterateMenus
 004A7BB7    mov         eax,dword ptr [ebp-0C]
 004A7BBA    xor         edx,edx
 004A7BBC    mov         dword ptr [eax],edx
 004A7BBE    cmp         dword ptr [ebp-8],0
>004A7BC2    je          004A7BFD
 004A7BC4    mov         eax,dword ptr [ebp-8]
 004A7BC7    add         eax,eax
 004A7BC9    lea         eax,[eax+eax*2]
 004A7BCC    call        @GetMem
 004A7BD1    mov         esi,eax
 004A7BD3    mov         dword ptr [ebp-4],esi
 004A7BD6    mov         eax,dword ptr [ebx+38]
 004A7BD9    mov         edx,dword ptr [eax+68]
 004A7BDC    mov         ecx,4A7B54;ProcessAccelItems:Boolean
 004A7BE1    xchg        eax,ecx
 004A7BE2    call        IterateMenus
 004A7BE7    mov         eax,dword ptr [ebp-8]
 004A7BEA    push        eax
 004A7BEB    push        esi
 004A7BEC    call        user32.CreateAcceleratorTableW
 004A7BF1    mov         edx,dword ptr [ebp-0C]
 004A7BF4    mov         dword ptr [edx],eax
 004A7BF6    mov         eax,esi
 004A7BF8    call        @FreeMem
 004A7BFD    mov         eax,dword ptr [ebp-10]
 004A7C00    mov         edx,dword ptr [ebp-8]
 004A7C03    mov         dword ptr [eax],edx
 004A7C05    pop         esi
 004A7C06    pop         ebx
 004A7C07    mov         esp,ebp
 004A7C09    pop         ebp
 004A7C0A    ret         8
*}
end;

//004A7C10
function AddOle2(Item:TMenuItem):Boolean;
begin
{*
 004A7C10    push        ebp
 004A7C11    mov         ebp,esp
 004A7C13    push        ebx
 004A7C14    push        esi
 004A7C15    push        edi
 004A7C16    mov         edi,eax
 004A7C18    mov         eax,dword ptr [ebp+8]
 004A7C1B    mov         esi,dword ptr [eax-4]
 004A7C1E    test        esi,esi
>004A7C20    jl          004A7C54
 004A7C22    inc         esi
 004A7C23    mov         eax,dword ptr [ebp+8]
 004A7C26    mov         ebx,dword ptr [eax-8]
 004A7C29    movzx       eax,byte ptr [edi+3F]
 004A7C2D    cmp         eax,dword ptr [ebx]
>004A7C2F    jne         004A7C4E
 004A7C31    mov         edx,dword ptr [ebp+8]
 004A7C34    mov         edx,dword ptr [edx+0C]
 004A7C37    inc         dword ptr [edx+eax*4]
 004A7C3A    mov         eax,dword ptr [ebp+8]
 004A7C3D    movzx       ecx,byte ptr [eax-0D]
 004A7C41    mov         eax,dword ptr [ebp+8]
 004A7C44    mov         edx,dword ptr [eax-0C]
 004A7C47    mov         eax,edi
 004A7C49    call        TMenuItem.AppendTo
 004A7C4E    add         ebx,4
 004A7C51    dec         esi
>004A7C52    jne         004A7C29
 004A7C54    xor         eax,eax
 004A7C56    pop         edi
 004A7C57    pop         esi
 004A7C58    pop         ebx
 004A7C59    pop         ebp
 004A7C5A    ret
*}
end;

//004A7C5C
procedure TMainMenu.PopulateOle2Menu(SharedMenu:HMENU; const Groups:array[$0..-$1] of System.Integer; const _Dv_:$0..-$1; var Widths:array[$0..-$1] of System.LongInt; const _Dv_:$0..-$1);
begin
{*
 004A7C5C    push        ebp
 004A7C5D    mov         ebp,esp
 004A7C5F    add         esp,0FFFFFFF0
 004A7C62    push        ebx
 004A7C63    mov         dword ptr [ebp-8],ecx
 004A7C66    mov         dword ptr [ebp-0C],edx
 004A7C69    mov         ebx,eax
 004A7C6B    mov         eax,ebx
 004A7C6D    call        TMenu.IsRightToLeft
 004A7C72    mov         byte ptr [ebp-0D],al
 004A7C75    mov         eax,dword ptr [ebp+10]
 004A7C78    mov         dword ptr [ebp-4],eax
 004A7C7B    mov         edx,dword ptr [ebp+8]
 004A7C7E    test        edx,edx
>004A7C80    jl          004A7C90
 004A7C82    inc         edx
 004A7C83    mov         eax,dword ptr [ebp+0C]
 004A7C86    xor         ecx,ecx
 004A7C88    mov         dword ptr [eax],ecx
 004A7C8A    add         eax,4
 004A7C8D    dec         edx
>004A7C8E    jne         004A7C86
 004A7C90    mov         eax,dword ptr [ebx+38]
 004A7C93    mov         ecx,eax
 004A7C95    mov         edx,dword ptr [eax+68]
 004A7C98    mov         eax,4A7C10;AddOle2:Boolean
 004A7C9D    call        IterateMenus
 004A7CA2    pop         ebx
 004A7CA3    mov         esp,ebp
 004A7CA5    pop         ebp
 004A7CA6    ret         0C
*}
end;

//004A7CAC
procedure TMainMenu.SetOle2MenuHandle(Handle:HMENU);
begin
{*
 004A7CAC    mov         dword ptr [eax+60],edx
 004A7CAF    call        TMainMenu.ItemChanged
 004A7CB4    ret
*}
end;

//004A7CB8
procedure TPopupList.MainWndProc(var Message:TMessage);
begin
{*
 004A7CB8    push        ebp
 004A7CB9    mov         ebp,esp
 004A7CBB    push        ecx
 004A7CBC    push        ebx
 004A7CBD    push        esi
 004A7CBE    push        edi
 004A7CBF    mov         dword ptr [ebp-4],eax
 004A7CC2    xor         eax,eax
 004A7CC4    push        ebp
 004A7CC5    push        4A7CE2
 004A7CCA    push        dword ptr fs:[eax]
 004A7CCD    mov         dword ptr fs:[eax],esp
 004A7CD0    mov         eax,dword ptr [ebp-4]
 004A7CD3    mov         ecx,dword ptr [eax]
 004A7CD5    call        dword ptr [ecx+10]
 004A7CD8    xor         eax,eax
 004A7CDA    pop         edx
 004A7CDB    pop         ecx
 004A7CDC    pop         ecx
 004A7CDD    mov         dword ptr fs:[eax],edx
>004A7CE0    jmp         004A7CFB
>004A7CE2    jmp         @HandleAnyException
 004A7CE7    mov         eax,[0078D590];^Application:TApplication
 004A7CEC    mov         eax,dword ptr [eax]
 004A7CEE    mov         edx,dword ptr [ebp-4]
 004A7CF1    call        TApplication.HandleException
 004A7CF6    call        @DoneExcept
 004A7CFB    pop         edi
 004A7CFC    pop         esi
 004A7CFD    pop         ebx
 004A7CFE    pop         ecx
 004A7CFF    pop         ebp
 004A7D00    ret
*}
end;

//004A7D04
procedure TPopupList.WndProc(var Message:TMessage);
begin
{*
 004A7D04    push        ebp
 004A7D05    mov         ebp,esp
 004A7D07    add         esp,0FFFFFFC8
 004A7D0A    push        ebx
 004A7D0B    push        esi
 004A7D0C    push        edi
 004A7D0D    xor         ecx,ecx
 004A7D0F    mov         dword ptr [ebp-38],ecx
 004A7D12    mov         esi,edx
 004A7D14    mov         dword ptr [ebp-4],eax
 004A7D17    xor         eax,eax
 004A7D19    push        ebp
 004A7D1A    push        4A8256
 004A7D1F    push        dword ptr fs:[eax]
 004A7D22    mov         dword ptr fs:[eax],esp
 004A7D25    mov         eax,dword ptr [esi]
 004A7D27    cmp         eax,111
>004A7D2C    jg          004A7D4E
>004A7D2E    je          004A7D66
 004A7D30    sub         eax,2B
>004A7D33    je          004A7F74
 004A7D39    dec         eax
>004A7D3A    je          004A807F
 004A7D40    sub         eax,27
>004A7D43    je          004A7E72
>004A7D49    jmp         004A8226
 004A7D4E    sub         eax,117
>004A7D53    je          004A7D9C
 004A7D55    sub         eax,8
>004A7D58    je          004A7DD1
 004A7D5A    dec         eax
>004A7D5B    je          004A81DD
>004A7D61    jmp         004A8226
 004A7D66    mov         eax,dword ptr [ebp-4]
 004A7D69    mov         ebx,dword ptr [eax+8]
 004A7D6C    dec         ebx
 004A7D6D    test        ebx,ebx
>004A7D6F    jl          004A8226
 004A7D75    inc         ebx
 004A7D76    xor         edi,edi
 004A7D78    mov         edx,edi
 004A7D7A    mov         eax,dword ptr [ebp-4]
 004A7D7D    call        TList.Get
 004A7D82    movzx       edx,word ptr [esi+4]
 004A7D86    call        TMenu.DispatchCommand
 004A7D8B    test        al,al
>004A7D8D    jne         004A8240
 004A7D93    inc         edi
 004A7D94    dec         ebx
>004A7D95    jne         004A7D78
>004A7D97    jmp         004A8226
 004A7D9C    mov         eax,dword ptr [ebp-4]
 004A7D9F    mov         ebx,dword ptr [eax+8]
 004A7DA2    dec         ebx
 004A7DA3    test        ebx,ebx
>004A7DA5    jl          004A8226
 004A7DAB    inc         ebx
 004A7DAC    xor         edi,edi
 004A7DAE    mov         edx,edi
 004A7DB0    mov         eax,dword ptr [ebp-4]
 004A7DB3    call        TList.Get
 004A7DB8    mov         edx,dword ptr [esi+4]
 004A7DBB    call        TMenu.DispatchPopup
 004A7DC0    test        al,al
>004A7DC2    jne         004A8240
 004A7DC8    inc         edi
 004A7DC9    dec         ebx
>004A7DCA    jne         004A7DAE
>004A7DCC    jmp         004A8226
 004A7DD1    mov         byte ptr [ebp-0D],0
 004A7DD5    test        byte ptr [esi+6],10
>004A7DD9    je          004A7DDF
 004A7DDB    mov         byte ptr [ebp-0D],1
 004A7DDF    mov         eax,dword ptr [ebp-4]
 004A7DE2    mov         ebx,dword ptr [eax+8]
 004A7DE5    dec         ebx
 004A7DE6    test        ebx,ebx
>004A7DE8    jl          004A7E5F
 004A7DEA    inc         ebx
 004A7DEB    xor         edi,edi
 004A7DED    cmp         byte ptr [ebp-0D],1
>004A7DF1    jne         004A7E13
 004A7DF3    mov         eax,dword ptr [esi+8]
 004A7DF6    test        eax,eax
>004A7DF8    je          004A7E0A
 004A7DFA    movzx       edx,word ptr [esi+4]
 004A7DFE    push        edx
 004A7DFF    push        eax
 004A7E00    call        user32.GetSubMenu
 004A7E05    mov         dword ptr [ebp-8],eax
>004A7E08    jmp         004A7E1A
 004A7E0A    mov         dword ptr [ebp-8],0FFFFFFFF
>004A7E11    jmp         004A7E1A
 004A7E13    movzx       eax,word ptr [esi+4]
 004A7E17    mov         dword ptr [ebp-8],eax
 004A7E1A    mov         edx,edi
 004A7E1C    mov         eax,dword ptr [ebp-4]
 004A7E1F    call        TList.Get
 004A7E24    movzx       ecx,byte ptr [ebp-0D]
 004A7E28    mov         edx,dword ptr [ebp-8]
 004A7E2B    call        TMenu.FindItem
 004A7E30    mov         dword ptr [ebp-0C],eax
 004A7E33    cmp         dword ptr [ebp-0C],0
>004A7E37    je          004A7E5B
 004A7E39    lea         edx,[ebp-38]
 004A7E3C    mov         eax,dword ptr [ebp-0C]
 004A7E3F    mov         eax,dword ptr [eax+58]
 004A7E42    call        GetLongHint
 004A7E47    mov         edx,dword ptr [ebp-38]
 004A7E4A    mov         eax,[0078D590];^Application:TApplication
 004A7E4F    mov         eax,dword ptr [eax]
 004A7E51    call        TApplication.SetHint
>004A7E56    jmp         004A8240
 004A7E5B    inc         edi
 004A7E5C    dec         ebx
>004A7E5D    jne         004A7DED
 004A7E5F    mov         eax,[0078D590];^Application:TApplication
 004A7E64    mov         eax,dword ptr [eax]
 004A7E66    xor         edx,edx
 004A7E68    call        TApplication.SetHint
>004A7E6D    jmp         004A8226
 004A7E72    mov         eax,dword ptr [esi+8]
 004A7E75    mov         dword ptr [ebp-28],eax
 004A7E78    mov         eax,dword ptr [ebp-4]
 004A7E7B    mov         ebx,dword ptr [eax+8]
 004A7E7E    dec         ebx
 004A7E7F    test        ebx,ebx
>004A7E81    jl          004A8226
 004A7E87    inc         ebx
 004A7E88    xor         edi,edi
 004A7E8A    mov         edx,edi
 004A7E8C    mov         eax,dword ptr [ebp-4]
 004A7E8F    call        TList.Get
 004A7E94    mov         edx,dword ptr [eax]
 004A7E96    call        dword ptr [edx+38]
 004A7E99    mov         edx,dword ptr [ebp-28]
 004A7E9C    cmp         eax,dword ptr [edx+0C]
>004A7E9F    jne         004A7EB3
 004A7EA1    mov         edx,edi
 004A7EA3    mov         eax,dword ptr [ebp-4]
 004A7EA6    call        TList.Get
 004A7EAB    mov         eax,dword ptr [eax+38]
 004A7EAE    mov         dword ptr [ebp-0C],eax
>004A7EB1    jmp         004A7ECD
 004A7EB3    mov         edx,edi
 004A7EB5    mov         eax,dword ptr [ebp-4]
 004A7EB8    call        TList.Get
 004A7EBD    mov         edx,dword ptr [ebp-28]
 004A7EC0    mov         edx,dword ptr [edx+0C]
 004A7EC3    mov         cl,1
 004A7EC5    call        TMenu.FindItem
 004A7ECA    mov         dword ptr [ebp-0C],eax
 004A7ECD    cmp         dword ptr [ebp-0C],0
>004A7ED1    je          004A7F67
 004A7ED7    mov         edx,edi
 004A7ED9    mov         eax,dword ptr [ebp-4]
 004A7EDC    call        TList.Get
 004A7EE1    mov         edx,dword ptr [ebp-28]
 004A7EE4    mov         edx,dword ptr [edx+8]
 004A7EE7    mov         cl,1
 004A7EE9    call        TMenu.GetHelpContext
 004A7EEE    test        eax,eax
>004A7EF0    jne         004A7F09
 004A7EF2    mov         edx,edi
 004A7EF4    mov         eax,dword ptr [ebp-4]
 004A7EF7    call        TList.Get
 004A7EFC    mov         edx,dword ptr [ebp-28]
 004A7EFF    mov         edx,dword ptr [edx+0C]
 004A7F02    xor         ecx,ecx
 004A7F04    call        TMenu.GetHelpContext
 004A7F09    mov         edx,dword ptr ds:[78DB00];^Screen:TScreen
 004A7F0F    mov         edx,dword ptr [edx]
 004A7F11    mov         edx,dword ptr [edx+68]
 004A7F14    test        edx,edx
>004A7F16    je          004A8240
 004A7F1C    test        eax,eax
>004A7F1E    jne         004A7F2B
 004A7F20    mov         eax,[0078DB00];^Screen:TScreen
 004A7F25    mov         eax,dword ptr [edx+168]
 004A7F2B    mov         ecx,dword ptr ds:[78DB00];^Screen:TScreen
 004A7F31    test        byte ptr [edx+298],8
>004A7F38    je          004A7F54
 004A7F3A    mov         edx,dword ptr ds:[78D590];^Application:TApplication
 004A7F40    mov         edx,dword ptr [edx]
 004A7F42    mov         ecx,eax
 004A7F44    mov         eax,8
 004A7F49    xchg        eax,edx
 004A7F4A    call        TApplication.HelpCommand
>004A7F4F    jmp         004A8240
 004A7F54    mov         edx,dword ptr ds:[78D590];^Application:TApplication
 004A7F5A    mov         edx,dword ptr [edx]
 004A7F5C    xchg        eax,edx
 004A7F5D    call        TApplication.HelpContext
>004A7F62    jmp         004A8240
 004A7F67    inc         edi
 004A7F68    dec         ebx
>004A7F69    jne         004A7E8A
>004A7F6F    jmp         004A8226
 004A7F74    mov         eax,dword ptr [esi+8]
 004A7F77    mov         dword ptr [ebp-2C],eax
 004A7F7A    mov         eax,dword ptr [ebp-4]
 004A7F7D    mov         ebx,dword ptr [eax+8]
 004A7F80    dec         ebx
 004A7F81    test        ebx,ebx
>004A7F83    jl          004A8226
 004A7F89    inc         ebx
 004A7F8A    xor         edi,edi
 004A7F8C    mov         edx,edi
 004A7F8E    mov         eax,dword ptr [ebp-4]
 004A7F91    call        TList.Get
 004A7F96    mov         edx,dword ptr [ebp-2C]
 004A7F99    mov         edx,dword ptr [edx+8]
 004A7F9C    xor         ecx,ecx
 004A7F9E    call        TMenu.FindItem
 004A7FA3    mov         dword ptr [ebp-0C],eax
 004A7FA6    cmp         dword ptr [ebp-0C],0
>004A7FAA    je          004A8072
 004A7FB0    mov         dl,1
 004A7FB2    mov         eax,[00476D34];TControlCanvas
 004A7FB7    call        TCanvas.Create
 004A7FBC    mov         dword ptr [ebp-14],eax
 004A7FBF    xor         eax,eax
 004A7FC1    push        ebp
 004A7FC2    push        4A806B
 004A7FC7    push        dword ptr fs:[eax]
 004A7FCA    mov         dword ptr fs:[eax],esp
 004A7FCD    mov         eax,dword ptr [ebp-2C]
 004A7FD0    mov         eax,dword ptr [eax+18]
 004A7FD3    push        eax
 004A7FD4    call        gdi32.SaveDC
 004A7FD9    mov         dword ptr [ebp-18],eax
 004A7FDC    xor         eax,eax
 004A7FDE    push        ebp
 004A7FDF    push        4A804E
 004A7FE4    push        dword ptr fs:[eax]
 004A7FE7    mov         dword ptr fs:[eax],esp
 004A7FEA    mov         eax,dword ptr [ebp-2C]
 004A7FED    mov         edx,dword ptr [eax+18]
 004A7FF0    mov         eax,dword ptr [ebp-14]
 004A7FF3    call        TCanvas.SetHandle
 004A7FF8    mov         eax,[0078DB00];^Screen:TScreen
 004A7FFD    mov         eax,dword ptr [eax]
 004A7FFF    mov         edx,dword ptr [eax+84]
 004A8005    mov         eax,dword ptr [ebp-14]
 004A8008    call        TCanvas.SetFont
 004A800D    mov         eax,dword ptr [ebp-2C]
 004A8010    movzx       eax,word ptr [eax+10]
 004A8014    push        eax
 004A8015    mov         eax,dword ptr [ebp-2C]
 004A8018    lea         ecx,[eax+1C]
 004A801B    mov         edx,dword ptr [ebp-14]
 004A801E    mov         eax,dword ptr [ebp-0C]
 004A8021    call        DrawMenuItem
 004A8026    xor         eax,eax
 004A8028    pop         edx
 004A8029    pop         ecx
 004A802A    pop         ecx
 004A802B    mov         dword ptr fs:[eax],edx
 004A802E    push        4A8055
 004A8033    xor         edx,edx
 004A8035    mov         eax,dword ptr [ebp-14]
 004A8038    call        TCanvas.SetHandle
 004A803D    mov         eax,dword ptr [ebp-18]
 004A8040    push        eax
 004A8041    mov         eax,dword ptr [ebp-2C]
 004A8044    mov         eax,dword ptr [eax+18]
 004A8047    push        eax
 004A8048    call        gdi32.RestoreDC
 004A804D    ret
>004A804E    jmp         @HandleFinally
>004A8053    jmp         004A8033
 004A8055    xor         eax,eax
 004A8057    pop         edx
 004A8058    pop         ecx
 004A8059    pop         ecx
 004A805A    mov         dword ptr fs:[eax],edx
 004A805D    push        4A8240
 004A8062    mov         eax,dword ptr [ebp-14]
 004A8065    call        TObject.Free
 004A806A    ret
>004A806B    jmp         @HandleFinally
>004A8070    jmp         004A8062
 004A8072    inc         edi
 004A8073    dec         ebx
>004A8074    jne         004A7F8C
>004A807A    jmp         004A8226
 004A807F    mov         eax,dword ptr [esi+8]
 004A8082    mov         dword ptr [ebp-30],eax
 004A8085    mov         eax,dword ptr [ebp-4]
 004A8088    mov         ebx,dword ptr [eax+8]
 004A808B    dec         ebx
 004A808C    test        ebx,ebx
>004A808E    jl          004A8226
 004A8094    inc         ebx
 004A8095    xor         edi,edi
 004A8097    mov         edx,edi
 004A8099    mov         eax,dword ptr [ebp-4]
 004A809C    call        TList.Get
 004A80A1    mov         edx,dword ptr [ebp-30]
 004A80A4    mov         edx,dword ptr [edx+8]
 004A80A7    xor         ecx,ecx
 004A80A9    call        TMenu.FindItem
 004A80AE    mov         dword ptr [ebp-0C],eax
 004A80B1    cmp         dword ptr [ebp-0C],0
>004A80B5    je          004A81D3
 004A80BB    mov         eax,dword ptr [ebp-4]
 004A80BE    mov         eax,dword ptr [eax+10]
 004A80C1    push        eax
 004A80C2    call        user32.GetWindowDC
 004A80C7    mov         dword ptr [ebp-1C],eax
 004A80CA    xor         eax,eax
 004A80CC    push        ebp
 004A80CD    push        4A81CC
 004A80D2    push        dword ptr fs:[eax]
 004A80D5    mov         dword ptr fs:[eax],esp
 004A80D8    mov         dl,1
 004A80DA    mov         eax,[00476D34];TControlCanvas
 004A80DF    call        TCanvas.Create
 004A80E4    mov         dword ptr [ebp-14],eax
 004A80E7    xor         eax,eax
 004A80E9    push        ebp
 004A80EA    push        4A81A7
 004A80EF    push        dword ptr fs:[eax]
 004A80F2    mov         dword ptr fs:[eax],esp
 004A80F5    mov         eax,dword ptr [ebp-1C]
 004A80F8    push        eax
 004A80F9    call        gdi32.SaveDC
 004A80FE    mov         dword ptr [ebp-18],eax
 004A8101    xor         eax,eax
 004A8103    push        ebp
 004A8104    push        4A818A
 004A8109    push        dword ptr fs:[eax]
 004A810C    mov         dword ptr fs:[eax],esp
 004A810F    mov         edx,dword ptr [ebp-1C]
 004A8112    mov         eax,dword ptr [ebp-14]
 004A8115    call        TCanvas.SetHandle
 004A811A    mov         eax,[0078DB00];^Screen:TScreen
 004A811F    mov         eax,dword ptr [eax]
 004A8121    mov         edx,dword ptr [eax+84]
 004A8127    mov         eax,dword ptr [ebp-14]
 004A812A    call        TCanvas.SetFont
 004A812F    mov         eax,dword ptr [ebp-30]
 004A8132    mov         eax,dword ptr [eax+0C]
 004A8135    mov         dword ptr [ebp-20],eax
 004A8138    mov         eax,dword ptr [ebp-30]
 004A813B    mov         eax,dword ptr [eax+10]
 004A813E    mov         dword ptr [ebp-24],eax
 004A8141    lea         eax,[ebp-24]
 004A8144    push        eax
 004A8145    lea         ecx,[ebp-20]
 004A8148    mov         edx,dword ptr [ebp-14]
 004A814B    mov         eax,dword ptr [ebp-0C]
 004A814E    mov         ebx,dword ptr [eax]
 004A8150    call        dword ptr [ebx+3C]
 004A8153    mov         eax,dword ptr [ebp-30]
 004A8156    mov         edx,dword ptr [ebp-20]
 004A8159    mov         dword ptr [eax+0C],edx
 004A815C    mov         eax,dword ptr [ebp-30]
 004A815F    mov         edx,dword ptr [ebp-24]
 004A8162    mov         dword ptr [eax+10],edx
 004A8165    xor         eax,eax
 004A8167    pop         edx
 004A8168    pop         ecx
 004A8169    pop         ecx
 004A816A    mov         dword ptr fs:[eax],edx
 004A816D    push        4A8191
 004A8172    xor         edx,edx
 004A8174    mov         eax,dword ptr [ebp-14]
 004A8177    call        TCanvas.SetHandle
 004A817C    mov         eax,dword ptr [ebp-18]
 004A817F    push        eax
 004A8180    mov         eax,dword ptr [ebp-1C]
 004A8183    push        eax
 004A8184    call        gdi32.RestoreDC
 004A8189    ret
>004A818A    jmp         @HandleFinally
>004A818F    jmp         004A8172
 004A8191    xor         eax,eax
 004A8193    pop         edx
 004A8194    pop         ecx
 004A8195    pop         ecx
 004A8196    mov         dword ptr fs:[eax],edx
 004A8199    push        4A81AE
 004A819E    mov         eax,dword ptr [ebp-14]
 004A81A1    call        TObject.Free
 004A81A6    ret
>004A81A7    jmp         @HandleFinally
>004A81AC    jmp         004A819E
 004A81AE    xor         eax,eax
 004A81B0    pop         edx
 004A81B1    pop         ecx
 004A81B2    pop         ecx
 004A81B3    mov         dword ptr fs:[eax],edx
 004A81B6    push        4A8240
 004A81BB    mov         eax,dword ptr [ebp-1C]
 004A81BE    push        eax
 004A81BF    mov         eax,dword ptr [ebp-4]
 004A81C2    mov         eax,dword ptr [eax+10]
 004A81C5    push        eax
 004A81C6    call        user32.ReleaseDC
 004A81CB    ret
>004A81CC    jmp         @HandleFinally
>004A81D1    jmp         004A81BB
 004A81D3    inc         edi
 004A81D4    dec         ebx
>004A81D5    jne         004A8097
>004A81DB    jmp         004A8226
 004A81DD    mov         eax,dword ptr [ebp-4]
 004A81E0    mov         ebx,dword ptr [eax+8]
 004A81E3    dec         ebx
 004A81E4    test        ebx,ebx
>004A81E6    jl          004A8226
 004A81E8    inc         ebx
 004A81E9    xor         edi,edi
 004A81EB    mov         edx,edi
 004A81ED    mov         eax,dword ptr [ebp-4]
 004A81F0    call        TList.Get
 004A81F5    mov         dword ptr [ebp-34],eax
 004A81F8    mov         eax,dword ptr [ebp-34]
 004A81FB    mov         edx,dword ptr [eax]
 004A81FD    call        dword ptr [edx+38]
 004A8200    cmp         eax,dword ptr [esi+8]
>004A8203    je          004A8216
 004A8205    mov         edx,dword ptr [esi+8]
 004A8208    mov         cl,1
 004A820A    mov         eax,dword ptr [ebp-34]
 004A820D    call        TMenu.FindItem
 004A8212    test        eax,eax
>004A8214    je          004A8222
 004A8216    mov         edx,esi
 004A8218    mov         eax,dword ptr [ebp-34]
 004A821B    call        TMenu.ProcessMenuChar
>004A8220    jmp         004A8240
 004A8222    inc         edi
 004A8223    dec         ebx
>004A8224    jne         004A81EB
 004A8226    mov         eax,dword ptr [esi+8]
 004A8229    push        eax
 004A822A    mov         eax,dword ptr [esi+4]
 004A822D    push        eax
 004A822E    mov         eax,dword ptr [esi]
 004A8230    push        eax
 004A8231    mov         eax,dword ptr [ebp-4]
 004A8234    mov         eax,dword ptr [eax+10]
 004A8237    push        eax
 004A8238    call        user32.DefWindowProcW
 004A823D    mov         dword ptr [esi+0C],eax
 004A8240    xor         eax,eax
 004A8242    pop         edx
 004A8243    pop         ecx
 004A8244    pop         ecx
 004A8245    mov         dword ptr fs:[eax],edx
 004A8248    push        4A825D
 004A824D    lea         eax,[ebp-38]
 004A8250    call        @UStrClr
 004A8255    ret
>004A8256    jmp         @HandleFinally
>004A825B    jmp         004A824D
 004A825D    pop         edi
 004A825E    pop         esi
 004A825F    pop         ebx
 004A8260    mov         esp,ebp
 004A8262    pop         ebp
 004A8263    ret
*}
end;

//004A8264
procedure TPopupList.Add(Popup:TPopupMenu);
begin
{*
 004A8264    push        ebx
 004A8265    push        esi
 004A8266    mov         esi,edx
 004A8268    mov         ebx,eax
 004A826A    cmp         dword ptr [ebx+8],0
>004A826E    jne         004A827E
 004A8270    push        ebx
 004A8271    push        4A7CB8;TPopupList.MainWndProc
 004A8276    call        AllocateHWnd
 004A827B    mov         dword ptr [ebx+10],eax
 004A827E    mov         edx,esi
 004A8280    mov         eax,ebx
 004A8282    call        TList.Add
 004A8287    pop         esi
 004A8288    pop         ebx
 004A8289    ret
*}
end;

//004A828C
procedure TPopupList.Remove(Popup:TPopupMenu);
begin
{*
 004A828C    push        ebx
 004A828D    mov         ebx,eax
 004A828F    mov         eax,ebx
 004A8291    xor         ecx,ecx
 004A8293    call        TList.RemoveItem
 004A8298    cmp         dword ptr [ebx+8],0
>004A829C    jne         004A82A6
 004A829E    mov         eax,dword ptr [ebx+10]
 004A82A1    call        DeallocateHWnd
 004A82A6    pop         ebx
 004A82A7    ret
*}
end;

//004A82A8
constructor TPopupMenu.Create;
begin
{*
 004A82A8    push        ebx
 004A82A9    push        esi
 004A82AA    test        dl,dl
>004A82AC    je          004A82B6
 004A82AE    add         esp,0FFFFFFF0
 004A82B1    call        @ClassCreate
 004A82B6    mov         ebx,edx
 004A82B8    mov         esi,eax
 004A82BA    xor         edx,edx
 004A82BC    mov         eax,esi
 004A82BE    call        TMenu.Create
 004A82C3    mov         dword ptr [esi+60],0FFFFFFFF
 004A82CA    mov         dword ptr [esi+64],0FFFFFFFF
 004A82D1    mov         eax,dword ptr [esi+38]
 004A82D4    mov         dword ptr [eax+8C],esi
 004A82DA    mov         edx,dword ptr [esi]
 004A82DC    mov         edx,dword ptr [edx+40]
 004A82DF    mov         dword ptr [eax+88],edx
 004A82E5    mov         eax,[0078D590];^Application:TApplication
 004A82EA    mov         eax,dword ptr [eax]
 004A82EC    mov         eax,dword ptr [eax+170]
 004A82F2    mov         dword ptr [esi+3C],eax
 004A82F5    mov         byte ptr [esi+69],1
 004A82F9    mov         edx,esi
 004A82FB    mov         eax,[0079322C]
 004A8300    call        TPopupList.Add
 004A8305    mov         eax,esi
 004A8307    test        bl,bl
>004A8309    je          004A831A
 004A830B    call        @AfterConstruction
 004A8310    pop         dword ptr fs:[0]
 004A8317    add         esp,0C
 004A831A    mov         eax,esi
 004A831C    pop         esi
 004A831D    pop         ebx
 004A831E    ret
*}
end;

//004A8320
destructor TPopupMenu.Destroy();
begin
{*
 004A8320    push        ebx
 004A8321    push        esi
 004A8322    call        @BeforeDestruction
 004A8327    mov         ebx,edx
 004A8329    mov         esi,eax
 004A832B    mov         edx,esi
 004A832D    mov         eax,[0079322C]
 004A8332    call        TPopupList.Remove
 004A8337    mov         edx,ebx
 004A8339    and         dl,0FC
 004A833C    mov         eax,esi
 004A833E    call        TMenu.Destroy
 004A8343    test        bl,bl
>004A8345    jle         004A834E
 004A8347    mov         eax,esi
 004A8349    call        @ClassDestroy
 004A834E    pop         esi
 004A834F    pop         ebx
 004A8350    ret
*}
end;

//004A8354
procedure TPopupMenu.CloseMenu;
begin
{*
 004A8354    call        user32.EndMenu
 004A8359    ret
*}
end;

//004A835C
procedure TPopupMenu.DoPopup(Sender:TObject);
begin
{*
 004A835C    push        ebx
 004A835D    cmp         word ptr [eax+7A],0
>004A8362    je          004A836C
 004A8364    mov         ebx,eax
 004A8366    mov         eax,dword ptr [ebx+7C]
 004A8369    call        dword ptr [ebx+78]
 004A836C    pop         ebx
 004A836D    ret
*}
end;

//004A8370
function TPopupMenu.GetHelpContext:THelpContext;
begin
{*
 004A8370    mov         eax,dword ptr [eax+38]
 004A8373    mov         eax,dword ptr [eax+54]
 004A8376    ret
*}
end;

//004A8378
procedure TPopupMenu.SetHelpContext(Value:THelpContext);
begin
{*
 004A8378    mov         eax,dword ptr [eax+38];TPopupMenu.FItems:TMenuItem
 004A837B    mov         dword ptr [eax+54],edx;TMenuItem.FHelpContext:THelpContext
 004A837E    ret
*}
end;

//004A8380
procedure TPopupMenu.SetBiDiModeFromPopupControl;
begin
{*
 004A8380    push        ebx
 004A8381    mov         ebx,eax
 004A8383    mov         eax,[0078DB7C];SysLocale:TSysLocale
 004A8388    cmp         byte ptr [eax+0D],0
>004A838C    je          004A83C7
 004A838E    cmp         byte ptr [ebx+41],0
>004A8392    je          004A83C7
 004A8394    lea         eax,[ebx+60]
 004A8397    call        FindPopupControl
 004A839C    test        eax,eax
>004A839E    je          004A83B1
 004A83A0    movzx       edx,byte ptr [eax+61]
 004A83A4    mov         eax,ebx
 004A83A6    call        TMenu.SetBiDiMode
 004A83AB    mov         byte ptr [ebx+41],1
>004A83AF    jmp         004A83C7
 004A83B1    mov         eax,[0078D590];^Application:TApplication
 004A83B6    mov         eax,dword ptr [eax]
 004A83B8    movzx       edx,byte ptr [eax+35]
 004A83BC    mov         eax,ebx
 004A83BE    call        TMenu.SetBiDiMode
 004A83C3    mov         byte ptr [ebx+41],1
 004A83C7    pop         ebx
 004A83C8    ret
*}
end;

//004A83CC
function TPopupMenu.UseRightToLeftAlignment:Boolean;
begin
{*
 004A83CC    push        esi
 004A83CD    xor         edx,edx
 004A83CF    mov         ecx,dword ptr ds:[78DB7C];SysLocale:TSysLocale
 004A83D5    cmp         byte ptr [ecx+0D],0
>004A83D9    je          004A8411
 004A83DB    cmp         byte ptr [eax+41],0
>004A83DF    je          004A840A
 004A83E1    add         eax,60
 004A83E4    call        FindPopupControl
 004A83E9    test        eax,eax
>004A83EB    je          004A83FA
 004A83ED    mov         si,0FFC7
 004A83F1    call        @CallDynaInst
 004A83F6    mov         edx,eax
>004A83F8    jmp         004A8411
 004A83FA    mov         eax,[0078D590];^Application:TApplication
 004A83FF    mov         eax,dword ptr [eax]
 004A8401    call        TApplication.UseRightToLeftAlignment
 004A8406    mov         edx,eax
>004A8408    jmp         004A8411
 004A840A    cmp         byte ptr [eax+34],1
 004A840E    sete        dl
 004A8411    mov         eax,edx
 004A8413    pop         esi
 004A8414    ret
*}
end;

//004A8418
procedure TPopupMenu.Popup(X:Integer; Y:Integer);
begin
{*
 004A8418    push        ebx
 004A8419    push        esi
 004A841A    push        edi
 004A841B    push        ebp
 004A841C    add         esp,0FFFFFFF8
 004A841F    mov         edi,ecx
 004A8421    mov         esi,edx
 004A8423    mov         ebx,eax
 004A8425    mov         dword ptr [esp],esi
 004A8428    mov         dword ptr [esp+4],edi
 004A842C    mov         edx,esp
 004A842E    mov         eax,ebx
 004A8430    call        TPopupMenu.SetPopupPoint
 004A8435    mov         eax,ebx
 004A8437    call        TPopupMenu.SetBiDiModeFromPopupControl
 004A843C    mov         edx,ebx
 004A843E    mov         eax,ebx
 004A8440    mov         ecx,dword ptr [eax]
 004A8442    call        dword ptr [ecx+40]
 004A8445    xor         edx,edx
 004A8447    mov         eax,dword ptr [ebx+38]
 004A844A    call        TMenuItem.InternalRethinkHotkeys
 004A844F    xor         edx,edx
 004A8451    mov         eax,dword ptr [ebx+38]
 004A8454    call        TMenuItem.InternalRethinkLines
 004A8459    mov         eax,dword ptr [ebx+38]
 004A845C    call        TMenuItem.RebuildHandle
 004A8461    mov         eax,ebx
 004A8463    call        TMenu.AdjustBiDiBehavior
 004A8468    mov         eax,ebx
 004A846A    call        TPopupMenu.UseRightToLeftAlignment
 004A846F    and         eax,7F
 004A8472    lea         eax,[eax+eax*2]
 004A8475    lea         eax,[eax*2+785D36]
 004A847C    movzx       edx,byte ptr [ebx+68]
 004A8480    movzx       ebp,word ptr [eax+edx*2]
 004A8484    movzx       eax,byte ptr [ebx+70]
 004A8488    or          bp,word ptr [eax*2+785D42]
 004A8490    movzx       ebp,bp
 004A8493    movzx       eax,byte ptr [ebx+71]
 004A8497    shl         eax,0A
 004A849A    or          ebp,eax
 004A849C    push        0
 004A849E    mov         eax,[0079322C]
 004A84A3    mov         eax,dword ptr [eax+10]
 004A84A6    push        eax
 004A84A7    push        0
 004A84A9    push        edi
 004A84AA    push        esi
 004A84AB    push        ebp
 004A84AC    mov         eax,dword ptr [ebx+38]
 004A84AF    call        TMenuItem.GetHandle
 004A84B4    push        eax
 004A84B5    call        user32.TrackPopupMenu
 004A84BA    pop         ecx
 004A84BB    pop         edx
 004A84BC    pop         ebp
 004A84BD    pop         edi
 004A84BE    pop         esi
 004A84BF    pop         ebx
 004A84C0    ret
*}
end;

//004A84C4
procedure TPopupMenu.SetPopupPoint(APopupPoint:TPoint);
begin
{*
 004A84C4    push        esi
 004A84C5    push        edi
 004A84C6    add         esp,0FFFFFFF8
 004A84C9    mov         esi,edx
 004A84CB    lea         edi,[esp]
 004A84CE    movs        dword ptr [edi],dword ptr [esi]
 004A84CF    movs        dword ptr [edi],dword ptr [esi]
 004A84D0    mov         edx,dword ptr [esp]
 004A84D3    mov         dword ptr [eax+60],edx
 004A84D6    mov         edx,dword ptr [esp+4]
 004A84DA    mov         dword ptr [eax+64],edx
 004A84DD    pop         ecx
 004A84DE    pop         edx
 004A84DF    pop         edi
 004A84E0    pop         esi
 004A84E1    ret
*}
end;

//004A84E4
procedure TMenuItemStack.ClearItem(AItem:TMenuItem);
begin
{*
 004A84E4    push        ebx
 004A84E5    push        esi
 004A84E6    push        edi
 004A84E7    push        ebp
 004A84E8    mov         ebp,edx
 004A84EA    mov         edi,eax
 004A84EC    mov         eax,dword ptr [edi+4]
 004A84EF    mov         esi,dword ptr [eax+8]
 004A84F2    dec         esi
 004A84F3    test        esi,esi
>004A84F5    jl          004A851A
 004A84F7    inc         esi
 004A84F8    xor         ebx,ebx
 004A84FA    mov         eax,dword ptr [edi+4]
 004A84FD    mov         edx,ebx
 004A84FF    call        TList.Get
 004A8504    cmp         ebp,dword ptr [eax]
>004A8506    jne         004A8516
 004A8508    mov         eax,dword ptr [edi+4]
 004A850B    mov         edx,ebx
 004A850D    call        TList.Get
 004A8512    xor         edx,edx
 004A8514    mov         dword ptr [eax],edx
 004A8516    inc         ebx
 004A8517    dec         esi
>004A8518    jne         004A84FA
 004A851A    pop         ebp
 004A851B    pop         edi
 004A851C    pop         esi
 004A851D    pop         ebx
 004A851E    ret
*}
end;

//004A8520
function NewItem(const ACaption:UnicodeString; AShortCut:TShortCut; AChecked:Boolean; AEnabled:Boolean; AOnClick:TNotifyEvent; hCtx:THelpContext; const AName:UnicodeString):TMenuItem;
begin
{*
 004A8520    push        ebp
 004A8521    mov         ebp,esp
 004A8523    push        ecx
 004A8524    push        ebx
 004A8525    push        esi
 004A8526    push        edi
 004A8527    mov         byte ptr [ebp-1],cl
 004A852A    mov         edi,edx
 004A852C    mov         esi,eax
 004A852E    xor         ecx,ecx
 004A8530    mov         dl,1
 004A8532    mov         eax,[0049F488];TMenuItem
 004A8537    call        TMenuItem.Create
 004A853C    mov         ebx,eax
 004A853E    mov         edx,esi
 004A8540    mov         eax,ebx
 004A8542    call        TMenuItem.SetCaption
 004A8547    mov         edx,edi
 004A8549    mov         eax,ebx
 004A854B    call        TMenuItem.SetShortCut
 004A8550    mov         eax,dword ptr [ebp+10]
 004A8553    mov         dword ptr [ebx+88],eax
 004A8559    mov         eax,dword ptr [ebp+14]
 004A855C    mov         dword ptr [ebx+8C],eax
 004A8562    mov         eax,dword ptr [ebp+0C]
 004A8565    mov         dword ptr [ebx+54],eax
 004A8568    movzx       edx,byte ptr [ebp-1]
 004A856C    mov         eax,ebx
 004A856E    call        TMenuItem.SetChecked
 004A8573    movzx       edx,byte ptr [ebp+18]
 004A8577    mov         eax,ebx
 004A8579    call        TMenuItem.SetEnabled
 004A857E    mov         edx,dword ptr [ebp+8]
 004A8581    mov         eax,ebx
 004A8583    mov         ecx,dword ptr [eax]
 004A8585    call        dword ptr [ecx+18]
 004A8588    mov         eax,ebx
 004A858A    pop         edi
 004A858B    pop         esi
 004A858C    pop         ebx
 004A858D    pop         ecx
 004A858E    pop         ebp
 004A858F    ret         14
*}
end;

//004A8594
function NewLine:TMenuItem;
begin
{*
 004A8594    push        ebx
 004A8595    xor         ecx,ecx
 004A8597    mov         dl,1
 004A8599    mov         eax,[0049F488];TMenuItem
 004A859E    call        TMenuItem.Create
 004A85A3    mov         ebx,eax
 004A85A5    mov         edx,4A85C4;'-'
 004A85AA    mov         eax,ebx
 004A85AC    call        TMenuItem.SetCaption
 004A85B1    mov         eax,ebx
 004A85B3    pop         ebx
 004A85B4    ret
*}
end;

//004A85C8
procedure DrawMenuItem(MenuItem:TMenuItem; ACanvas:TCanvas; ARect:TRect; State:TOwnerDrawState);
begin
{*
 004A85C8    push        ebp
 004A85C9    mov         ebp,esp
 004A85CB    add         esp,0FFFFFFE8
 004A85CE    push        ebx
 004A85CF    push        esi
 004A85D0    push        edi
 004A85D1    mov         esi,ecx
 004A85D3    lea         edi,[ebp-18]
 004A85D6    movs        dword ptr [edi],dword ptr [esi]
 004A85D7    movs        dword ptr [edi],dword ptr [esi]
 004A85D8    movs        dword ptr [edi],dword ptr [esi]
 004A85D9    movs        dword ptr [edi],dword ptr [esi]
 004A85DA    mov         edi,edx
 004A85DC    mov         dword ptr [ebp-4],eax
 004A85DF    mov         eax,[0078D080];^gvar_00784C80
 004A85E4    cmp         dword ptr [eax],4
>004A85E7    jg          004A8601
 004A85E9    mov         eax,[0078D080];^gvar_00784C80
 004A85EE    cmp         dword ptr [eax],4
>004A85F1    jne         004A85FD
 004A85F3    mov         eax,[0078D6F0];^gvar_00784C84
 004A85F8    cmp         dword ptr [eax],0
>004A85FB    jg          004A8601
 004A85FD    xor         ebx,ebx
>004A85FF    jmp         004A8603
 004A8601    mov         bl,1
 004A8603    mov         eax,dword ptr [ebp-4]
 004A8606    mov         si,0FFF2
 004A860A    call        @CallDynaInst
 004A860F    mov         edx,dword ptr ds:[4A09B4];TMainMenu
 004A8615    call        @IsClass
 004A861A    mov         byte ptr [ebp-5],al
 004A861D    test        byte ptr [ebp+8],1
>004A8621    je          004A864F
 004A8623    cmp         byte ptr [ebp-5],0
>004A8627    je          004A8633
 004A8629    cmp         byte ptr [ebp-5],0
>004A862D    je          004A864F
 004A862F    test        bl,bl
>004A8631    jne         004A864F
 004A8633    mov         edx,0FF00000D
 004A8638    mov         eax,dword ptr [edi+48]
 004A863B    call        TBrush.SetColor
 004A8640    mov         edx,0FF00000E
 004A8645    mov         eax,dword ptr [edi+40]
 004A8648    call        TFont.SetColor
>004A864D    jmp         004A868F
 004A864F    test        bl,bl
>004A8651    je          004A8675
 004A8653    test        byte ptr [ebp+8],80
>004A8657    je          004A8675
 004A8659    mov         edx,0FF000004
 004A865E    mov         eax,dword ptr [edi+48]
 004A8661    call        TBrush.SetColor
 004A8666    mov         edx,0FF000011
 004A866B    mov         eax,dword ptr [edi+40]
 004A866E    call        TFont.SetColor
>004A8673    jmp         004A868F
 004A8675    mov         edx,0FF000004
 004A867A    mov         eax,dword ptr [edi+48]
 004A867D    call        TBrush.SetColor
 004A8682    mov         edx,0FF000007
 004A8687    mov         eax,dword ptr [edi+40]
 004A868A    call        TFont.SetColor
 004A868F    movzx       eax,word ptr [ebp+8]
 004A8693    push        eax
 004A8694    movzx       eax,byte ptr [ebp-5]
 004A8698    push        eax
 004A8699    lea         ecx,[ebp-18]
 004A869C    mov         edx,edi
 004A869E    mov         eax,dword ptr [ebp-4]
 004A86A1    mov         ebx,dword ptr [eax]
 004A86A3    call        dword ptr [ebx+34]
 004A86A6    pop         edi
 004A86A7    pop         esi
 004A86A8    pop         ebx
 004A86A9    mov         esp,ebp
 004A86AB    pop         ebp
 004A86AC    ret         4
*}
end;

//004A86B0
function StripHotkey(const Text:UnicodeString):UnicodeString;
begin
{*
 004A86B0    push        ebx
 004A86B1    push        esi
 004A86B2    push        edi
 004A86B3    push        ebp
 004A86B4    add         esp,0FFFFFFF4
 004A86B7    mov         esi,edx
 004A86B9    mov         ebx,eax
 004A86BB    mov         eax,esi
 004A86BD    mov         edx,ebx
 004A86BF    call        @UStrAsg
 004A86C4    mov         ebp,1
>004A86C9    jmp         004A87B3
 004A86CE    mov         eax,dword ptr [esi]
 004A86D0    movzx       edi,word ptr [eax+ebp*2-2]
 004A86D5    cmp         di,0D800
>004A86DA    jb          004A86E3
 004A86DC    cmp         di,0DFFF
>004A86E1    jbe         004A86E7
 004A86E3    xor         ebx,ebx
>004A86E5    jmp         004A86E9
 004A86E7    mov         bl,1
 004A86E9    test        bl,bl
>004A86EB    je          004A86F3
 004A86ED    inc         ebp
>004A86EE    jmp         004A87B2
 004A86F3    mov         eax,dword ptr [esi]
 004A86F5    cmp         word ptr [eax+ebp*2-2],26
>004A86FB    jne         004A87B2
 004A8701    mov         eax,[0078DB7C];SysLocale:TSysLocale
 004A8706    cmp         byte ptr [eax+0C],0
>004A870A    je          004A8787
 004A870C    cmp         ebp,1
>004A870F    jle         004A8741
 004A8711    mov         eax,dword ptr [esi]
 004A8713    mov         dword ptr [esp],eax
 004A8716    mov         eax,dword ptr [esp]
 004A8719    mov         dword ptr [esp+4],eax
 004A871D    cmp         dword ptr [esp+4],0
>004A8722    je          004A8731
 004A8724    mov         eax,dword ptr [esp+4]
 004A8728    sub         eax,4
 004A872B    mov         eax,dword ptr [eax]
 004A872D    mov         dword ptr [esp+4],eax
 004A8731    mov         eax,dword ptr [esp+4]
 004A8735    sub         eax,ebp
 004A8737    cmp         eax,2
 004A873A    setge       byte ptr [esp+8]
>004A873F    jmp         004A8746
 004A8741    mov         byte ptr [esp+8],0
 004A8746    cmp         byte ptr [esp+8],0
>004A874B    je          004A875C
 004A874D    mov         eax,dword ptr [esi]
 004A874F    cmp         word ptr [eax+ebp*2-4],28
 004A8755    sete        byte ptr [esp+9]
>004A875A    jmp         004A8761
 004A875C    mov         byte ptr [esp+9],0
 004A8761    cmp         byte ptr [esp+9],0
>004A8766    je          004A8777
 004A8768    mov         eax,dword ptr [esi]
 004A876A    cmp         word ptr [eax+ebp*2+2],29
 004A8770    sete        byte ptr [esp+0A]
>004A8775    jmp         004A877C
 004A8777    mov         byte ptr [esp+0A],0
 004A877C    movzx       eax,byte ptr [esp+0A]
 004A8781    mov         byte ptr [esp+0B],al
>004A8785    jmp         004A878C
 004A8787    mov         byte ptr [esp+0B],0
 004A878C    cmp         byte ptr [esp+0B],0
>004A8791    je          004A87A4
 004A8793    mov         edx,ebp
 004A8795    dec         edx
 004A8796    mov         eax,esi
 004A8798    mov         ecx,4
 004A879D    call        @UStrDelete
>004A87A2    jmp         004A87B2
 004A87A4    mov         eax,esi
 004A87A6    mov         ecx,1
 004A87AB    mov         edx,ebp
 004A87AD    call        @UStrDelete
 004A87B2    inc         ebp
 004A87B3    mov         eax,dword ptr [esi]
 004A87B5    call        @UStrLen
 004A87BA    cmp         ebp,eax
>004A87BC    jle         004A86CE
 004A87C2    add         esp,0C
 004A87C5    pop         ebp
 004A87C6    pop         edi
 004A87C7    pop         esi
 004A87C8    pop         ebx
 004A87C9    ret
*}
end;

//004A87CC
function GetHotkey(const Text:UnicodeString):UnicodeString;
begin
{*
 004A87CC    push        ebx
 004A87CD    push        esi
 004A87CE    push        edi
 004A87CF    push        ebp
 004A87D0    push        ecx
 004A87D1    mov         dword ptr [esp],edx
 004A87D4    mov         esi,eax
 004A87D6    mov         eax,dword ptr [esp]
 004A87D9    call        @UStrClr
 004A87DE    mov         ebx,1
 004A87E3    mov         eax,esi
 004A87E5    test        eax,eax
>004A87E7    je          004A87EE
 004A87E9    sub         eax,4
 004A87EC    mov         eax,dword ptr [eax]
 004A87EE    mov         ebp,eax
 004A87F0    cmp         ebp,ebx
>004A87F2    jl          004A8834
 004A87F4    movzx       edi,word ptr [esi+ebx*2-2]
 004A87F9    cmp         di,0D800
>004A87FE    jb          004A880A
 004A8800    cmp         di,0DFFF
>004A8805    ja          004A880A
 004A8807    inc         ebx
>004A8808    jmp         004A882F
 004A880A    cmp         word ptr [esi+ebx*2-2],26
>004A8810    jne         004A882F
 004A8812    mov         eax,ebp
 004A8814    sub         eax,ebx
 004A8816    dec         eax
>004A8817    jl          004A882F
 004A8819    inc         ebx
 004A881A    cmp         word ptr [esi+ebx*2-2],26
>004A8820    je          004A882F
 004A8822    mov         eax,dword ptr [esp]
 004A8825    movzx       edx,word ptr [esi+ebx*2-2]
 004A882A    call        @UStrFromWChar
 004A882F    inc         ebx
 004A8830    cmp         ebp,ebx
>004A8832    jge         004A87F4
 004A8834    pop         edx
 004A8835    pop         ebp
 004A8836    pop         edi
 004A8837    pop         esi
 004A8838    pop         ebx
 004A8839    ret
*}
end;

//004A883C
function SameCaption(const Text1:UnicodeString; const Text2:UnicodeString):Boolean;
begin
{*
 004A883C    push        ebp
 004A883D    mov         ebp,esp
 004A883F    add         esp,0FFFFFFF0
 004A8842    push        ebx
 004A8843    push        esi
 004A8844    xor         ecx,ecx
 004A8846    mov         dword ptr [ebp-8],ecx
 004A8849    mov         dword ptr [ebp-4],ecx
 004A884C    mov         esi,edx
 004A884E    mov         ebx,eax
 004A8850    xor         eax,eax
 004A8852    push        ebp
 004A8853    push        4A88AB
 004A8858    push        dword ptr fs:[eax]
 004A885B    mov         dword ptr fs:[eax],esp
 004A885E    lea         edx,[ebp-4]
 004A8861    mov         eax,ebx
 004A8863    call        StripHotkey
 004A8868    mov         ebx,dword ptr [ebp-4]
 004A886B    lea         edx,[ebp-8]
 004A886E    mov         eax,esi
 004A8870    call        StripHotkey
 004A8875    mov         esi,dword ptr [ebp-8]
 004A8878    mov         dword ptr [ebp-0C],esi
 004A887B    mov         edx,dword ptr [ebp-0C]
 004A887E    mov         dword ptr [ebp-10],ebx
 004A8881    mov         eax,dword ptr [ebp-10]
 004A8884    call        AnsiCompareText
 004A8889    test        eax,eax
 004A888B    sete        al
 004A888E    mov         ebx,eax
 004A8890    xor         eax,eax
 004A8892    pop         edx
 004A8893    pop         ecx
 004A8894    pop         ecx
 004A8895    mov         dword ptr fs:[eax],edx
 004A8898    push        4A88B2
 004A889D    lea         eax,[ebp-8]
 004A88A0    mov         edx,2
 004A88A5    call        @UStrArrayClr
 004A88AA    ret
>004A88AB    jmp         @HandleFinally
>004A88B0    jmp         004A889D
 004A88B2    mov         eax,ebx
 004A88B4    pop         esi
 004A88B5    pop         ebx
 004A88B6    mov         esp,ebp
 004A88B8    pop         ebp
 004A88B9    ret
*}
end;

Initialization
//007809A0
{*
 007809A0    sub         dword ptr ds:[793234],1
>007809A7    jae         00780A24
 007809A9    mov         eax,4A88BC
 007809AE    call        @InitResStringImports
 007809B3    mov         eax,[0047A16C];TControl
 007809B8    call        StartClassGroup
 007809BD    mov         eax,[0047A16C];TControl
 007809C2    call        ActivateClassGroup
 007809C7    mov         edx,dword ptr ds:[47A16C];TControl
 007809CD    mov         eax,[0049F488];TMenuItem
 007809D2    call        GroupDescendentsWith
 007809D7    mov         edx,dword ptr ds:[47A16C];TControl
 007809DD    mov         eax,[004A02F4];TMenu
 007809E2    call        GroupDescendentsWith
 007809E7    mov         eax,[0049F488];TMenuItem
 007809EC    call        RegisterClass
 007809F1    mov         dl,1
 007809F3    mov         eax,[0043A874];TBits
 007809F8    call        TObject.Create
 007809FD    mov         [00793238],eax
 00780A02    mov         dl,1
 00780A04    mov         eax,[004A132C];TPopupList
 00780A09    call        TObject.Create
 00780A0E    mov         [0079322C],eax
 00780A13    mov         dl,1
 00780A15    mov         eax,[004A148C];TMenuItemStack
 00780A1A    call        TOrderedList.Create
 00780A1F    mov         [00793230],eax
 00780A24    ret
*}
Finalization
//004A8998
{*
 004A8998    push        ebp
 004A8999    mov         ebp,esp
 004A899B    xor         eax,eax
 004A899D    push        ebp
 004A899E    push        4A89FC
 004A89A3    push        dword ptr fs:[eax]
 004A89A6    mov         dword ptr fs:[eax],esp
 004A89A9    inc         dword ptr ds:[793234]
>004A89AF    jne         004A89EE
 004A89B1    mov         eax,[00793230]
 004A89B6    call        TObject.Free
 004A89BB    mov         eax,[0079322C]
 004A89C0    call        TObject.Free
 004A89C5    mov         eax,[00793238]
 004A89CA    call        TObject.Free
 004A89CF    mov         eax,785C08;^'1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ'
 004A89D4    call        @UStrClr
 004A89D9    mov         eax,785C18
 004A89DE    mov         ecx,12
 004A89E3    mov         edx,dword ptr ds:[40128C];string
 004A89E9    call        @FinalizeArray
 004A89EE    xor         eax,eax
 004A89F0    pop         edx
 004A89F1    pop         ecx
 004A89F2    pop         ecx
 004A89F3    mov         dword ptr fs:[eax],edx
 004A89F6    push        4A8A03
 004A89FB    ret
>004A89FC    jmp         @HandleFinally
>004A8A01    jmp         004A89FB
 004A8A03    pop         ebp
 004A8A04    ret
*}
end.