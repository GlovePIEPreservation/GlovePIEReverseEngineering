//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit28;

interface

uses
  SysUtils, Classes, Controls, DwmApi, StdCtrls, ShlObj, GraphUtil, Graphics, ImgList, Menus, mwCompletionProposal, JvTypes;

type
  _COMDLG_FILTERSPEC = _COMDLG_FILTERSPEC = record//size=8
pszName:PWideChar;//f0
pszSpec:PWideChar;//f4
end;;
  TComdlgFilterSpecArray = array of _COMDLG_FILTERSPEC;
//elSize = 8;
  TCustomGroupBox = class(TCustomControl)
  published
    constructor Create;//004B879C
  public
    constructor Create; virtual;//v2C//004B879C
    procedure AdjustClientRect(var Rect:TRect); virtual;//vA0//004B87F8
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004B8858
    procedure Paint; virtual;//vEC//004B8868
    procedure CMDialogChar(var Message:TCMDialogChar); message CM_DIALOGCHAR;//004B8C70
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//004B8D08
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//004B8CF0
  end;
  TGroupBox = class(TCustomGroupBox)
  end;
  TTextLayout = (tlTop, tlCenter, tlBottom);
  TEllipsisPosition = (epNone, epPathEllipsis, epEndEllipsis, epWordEllipsis);
  TFNDrawText = procedure(DC:HDC; const Text:string; var TextRect:TRect; TextFlags:Cardinal) of object;;
  TCustomLabel = class(TGraphicControl)
  published
    constructor Create;//004B8D40
  public
    FFocusControl:TWinControl;//f1B0
    FAlignment:TAlignment;//f1B4
    FAutoSize:Boolean;//f1B5
    FDrawTextProc:TFNDrawText;//f1B8
    FGlowSize:Integer;//f1C0
    FLayout:TTextLayout;//f1C4
    FWordWrap:Boolean;//f1C5
    FShowAccelChar:Boolean;//f1C6
    FTransparentSet:Boolean;//f1C7
    FEllipsisPosition:TEllipsisPosition;//f1C8
    procedure Loaded; virtual;//vC//004B9388
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//004B95F4
    constructor Create; virtual;//v2C//004B8D40
    procedure SetAutoSize(Value:Boolean); virtual;//v6C//004B94F0
    procedure Paint; virtual;//vA0//004B9284
    function GetLabelText:UnicodeString; virtual;//vA4//004B8DE0
    procedure CMDialogChar(var Message:TCMDialogChar); message CM_DIALOGCHAR;//004B966C
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//004B9654
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//004B9624
    procedure CMThemeChanged(var Message:TMessage); dynamic;//004B9640
    procedure DoDrawText(var Rect:TRect; Flags:LongInt); dynamic;//004B8EF4
    procedure AdjustBounds; dynamic;//004B93A4
    procedure DoDrawThemeTextEx(DC:HDC; const Text:UnicodeString; var TextRect:TRect; TextFlags:Cardinal);//004B8DF4
    procedure DoDrawNormalText(DC:HDC; const Text:UnicodeString; var TextRect:TRect; TextFlags:Cardinal);//004B8EC0
    procedure SetAlignment(Value:TAlignment);//004B94B8
    procedure SetEllipsisPosition(Value:TEllipsisPosition);//004B94D0
    function GetTransparent:Boolean;//004B9518
    procedure SetFocusControl(Value:TWinControl);//004B9524
    procedure SetGlowSize(const Value:Integer);//004B9538
    procedure SetShowAccelChar(Value:Boolean);//004B9550
    procedure SetTransparent(Value:Boolean);//004B9568
    procedure SetLayout(Value:TTextLayout);//004B95B0
    procedure SetWordWrap(Value:Boolean);//004B95C8
    procedure UpdateDrawTextProc;//004B9708
  end;
  TLabel = class(TCustomLabel)
  end;
  TEditCharCase = (ecNormal, ecUpperCase, ecLowerCase);
  TCustomEdit = class(TWinControl)
  published
    procedure SetSelTextBuf(Buffer:PWideChar);//004B9D54
    function GetSelTextBuf(Buffer:PWideChar; BufSize:Integer):Integer;//004B9CB4
    procedure CopyToClipboard;//004B9C0C
    procedure CutToClipboard;//004B9C28
    //procedure DefaultHandler(var Message:?);//004BA230
    constructor Create;//004B9748
    procedure Clear;//004B9BD8
    procedure ClearSelection;//004B9BF0
    procedure GetControlsAlignment;//004BA554
    procedure SetSelText(Value:string);//004B9E14
    procedure SelectAll;//004B9C98
    procedure ClearUndo;//004B9C7C
    procedure PasteFromClipboard;//004B9C44
    procedure Undo;//004B9C60
  public
    FAlignment:TAlignment;//f270
    FMaxLength:Integer;//f274
    FBorderStyle:TBorderStyle;//f278
    FPasswordChar:Char;//f27A
    FReadOnly:Boolean;//f27C
    FAutoSize:Boolean;//f27D
    FAutoSelect:Boolean;//f27E
    FHideSelection:Boolean;//f27F
    FOEMConvert:Boolean;//f280
    FCharCase:TEditCharCase;//f281
    FCreating:Boolean;//f282
    FModified:Boolean;//f283
    FInBufferedPrintClient:Boolean;//f284
    FOnChange:TNotifyEvent;//f288
    FOldSelLength:Integer;//f290
    FOldSelStart:Integer;//f294
    FNumbersOnly:Boolean;//f298
    FTextHint:string;//f29C
    //procedure DefaultHandler(var Message:?); virtual;//004BA230
    constructor Create; virtual;//v2C//004B9748
    procedure SetAutoSize(Value:Boolean); virtual;//v6C//004B98A4
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004B9E34
    procedure CreateWindowHandle(const Params:TCreateParams); virtual;//vB0//004B9F28
    procedure CreateWnd; virtual;//vB4//004B9F98
    procedure DestroyWnd; virtual;//vC8//004BA0B0
    procedure DoSetMaxLength(Value:Integer); virtual;//vEC//004B9824
    procedure DoSetTextHint(const Value:UnicodeString); virtual;//vF0//004B9844
    function GetSelLength:Integer; virtual;//vF4//004B9B44
    function GetSelStart:Integer; virtual;//vF8//004B9B00
    function GetSelText:UnicodeString; virtual;//vFC//004B9D74
    procedure SetSelLength(Value:Integer); virtual;//v100//004B9B74
    procedure SetSelStart(Value:Integer); virtual;//v104//004B9B24
    procedure Clear; virtual;//v108//004B9BD8
    function GetSelTextBuf(Buffer:PWideChar; BufSize:Integer):Integer; virtual;//v10C//004B9CB4
    procedure WMSetFont(var Message:TWMSetFont); message WM_SETFONT;//004BA2D4
    procedure WMContextMenu(var Message:TWMContextMenu); message WM_CONTEXTMENU;//004BA480
    procedure CMColorChanged(var Message:TMessage); message CM_COLORCHANGED;//004BA314
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//004BA378
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//004BA344
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//004BA448
    procedure CMEnter(var Message:TCMEnter); message CM_ENTER;//004BA40C
    procedure CNCommand(var Message:TWMCommand); dynamic;//004BA3E8
    procedure GetControlsAlignment; dynamic;//004BA554
    procedure SetAlignment(Value:TAlignment);//004B9890
    procedure SetBorderStyle(Value:TBorderStyle);//004B98B8
    procedure SetCharCase(Value:TEditCharCase);//004B98DC
    procedure SetTextHint(const Value:UnicodeString);//004B98F0
    procedure SetHideSelection(Value:Boolean);//004B992C
    procedure SetMaxLength(Value:Integer);//004B9940
    procedure SetOEMConvert(Value:Boolean);//004B9970
    function GetModified:Boolean;//004B9984
    function GetCanUndo:Boolean;//004B99BC
    procedure SetModified(Value:Boolean);//004B99F0
    procedure SetNumbersOnly(Value:Boolean);//004B9A28
    procedure SetPasswordChar(Value:Char);//004B9A9C
    procedure SetReadOnly(Value:Boolean);//004B9AC4
    procedure UpdateHeight;//004BA0EC
    procedure AdjustHeight;//004BA128
  end;
  TEdit = class(TCustomEdit)
  end;
  TScrollStyle = (ssNone, ssHorizontal, ssVertical, ssBoth);
  TCustomMemo = class(TCustomEdit)
  published
    destructor Destroy();//004BAA2C
    constructor Create;//004BA978
  public
    FLines:TStrings;//f2A0
    FScrollBars:TScrollStyle;//f2A4
    FWordWrap:Boolean;//f2A5
    FWantReturns:Boolean;//f2A6
    FWantTabs:Boolean;//f2A7
    destructor Destroy(); virtual;//004BAA2C
    procedure Loaded; virtual;//vC//004BACC0
    constructor Create; virtual;//v2C//004BA978
    procedure DoGetGestureOptions(var Gestures:TInteractiveGestures; var Options:TInteractiveGestureOptions); virtual;//v48//004BAA5C
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004BAA94
    procedure CreateWindowHandle(const Params:TCreateParams); virtual;//vB0//004BAAD0
    function GetCaretPos:TPoint; virtual;//v110//004BABDC
    procedure SetCaretPos(const Value:TPoint); virtual;//v114//004BAC84
    procedure WMNCDestroy(var Message:TWMNCDestroy); message WM_NCDESTROY;//004BAD4C
    procedure WMGetDlgCode(var Message:TWMGetDlgCode); message WM_GETDLGCODE;//004BAD18
    procedure KeyPress(var Key:Char); dynamic;//004BAD54
    procedure IsTouchPropertyStored(AProperty:TTouchProperty); dynamic;//004BAC38
    procedure SetLines(Value:TStrings);//004BACD8
    procedure SetScrollBars(Value:TScrollStyle);//004BACF0
    procedure SetWordWrap(Value:Boolean);//004BAD04
  end;
  TMemo = class(TCustomMemo)
  end;
  TDrawItemEvent = procedure(Control:TWinControl; Index:Integer; Rect:TRect; State:TOwnerDrawState) of object;;
  TMeasureItemEvent = procedure(Control:TWinControl; Index:Integer; var Height:Integer) of object;;
  TCustomComboBoxStrings = class(TStrings)
  published
    procedure Delete(Index:Integer);//004BAF7C
    function IndexOf(S:string):Integer;//004BAF9C
    procedure Clear;//004BAF0C
    constructor Create();//004BAD7C
    destructor Destroy();//004BADB4
  public
    FComboBox:TCustomCombo;//f2C
    destructor Destroy(); virtual;//004BADB4
    function Get(Index:Integer):UnicodeString; virtual;//vC//004BAEB0
    function GetCount:Integer; virtual;//v14//004BADDC
    function GetObject(Index:Integer):TObject; virtual;//v18//004BADF8
    procedure PutObject(Index:Integer; AObject:TObject); virtual;//v24//004BAE8C
    procedure SetUpdateState(Updating:Boolean); virtual;//v30//004BB004
    procedure Clear; virtual;//v44//004BAF0C
    procedure Delete(Index:Integer); virtual;//v48//004BAF7C
    function IndexOf(S:string):Integer; virtual;//v54//004BAF9C
    constructor Create(); virtual;//v90//004BAD7C
  end;
  TCustomCombo = class(TCustomListControl)
  published
    procedure Clear;//004BB2C4
    procedure ClearSelection;//004BC130
    procedure CopySelection(Destination:TCustomListControl);//004BC13C
    destructor Destroy();//004BB268
    procedure AddItem(Item:string; AObject:TObject);//004BC25C
    constructor Create;//004BB168
    function GetCount:Integer;//004BC1F4
    procedure SelectAll;//004BB314
    procedure DeleteSelected;//004BC1C8
    procedure Focused;//004BBF4C
  public
    FCanvas:TCanvas;//f270
    FMaxLength:Integer;//f274
    FDropDownCount:Integer;//f278
    FInBufferedPrintClient:Boolean;//f27C
    FItemIndex:Integer;//f280
    FOnChange:TNotifyEvent;//f288
    f28C:dword;//f28C
    FOnSelect:TNotifyEvent;//f290
    FOnDropDown:TNotifyEvent;//f298
    FOnCloseUp:TNotifyEvent;//f2A0
    FItemHeight:Integer;//f2A8
    FItems:TStrings;//f2AC
    FEditHandle:HWND;//f2B0
    FListHandle:HWND;//f2B4
    FDropHandle:HWND;//f2B8
    FDefEditProc:Pointer;//f2BC
    FDefListProc:Pointer;//f2C0
    FDroppingDown:Boolean;//f2C4
    FFocusChanged:Boolean;//f2C5
    FIsFocused:Boolean;//f2C6
    FSaveIndex:Integer;//f2C8
    FEditInstance:Pointer;//f2CC
    FListInstance:Pointer;//f2D0
    destructor Destroy(); virtual;//004BB268
    procedure Loaded; virtual;//vC//004BBF24
    constructor Create; virtual;//v2C//004BB168
    procedure WndProc(var Message:TMessage); virtual;//v84//004BBB14
    procedure CreateWnd; virtual;//vB4//004BBFD8
    procedure DestroyWindowHandle; virtual;//vC4//004BB2F0
    function GetItemIndex:Integer; virtual;//vEC//004BB39C
    procedure SetItemIndex(const Value:Integer); virtual;//vF0//004BB3C8
    procedure AddItem(Item:string; AObject:TObject); virtual;//vF4//004BC25C
    procedure Clear; virtual;//vF8//004BB2C4
    procedure ClearSelection; virtual;//vFC//004BC130
    procedure CopySelection(Destination:TCustomListControl); virtual;//v100//004BC13C
    procedure DeleteSelected; virtual;//v104//004BC1C8
    function GetCount:Integer; virtual;//v108//004BC1F4
    procedure SelectAll; virtual;//v110//004BB314
    procedure AdjustDropDown; virtual;//v114//004BC04C
    procedure ComboWndProc(var Message:TMessage; ComboWnd:HWND; ComboProc:TWindowProcPtr); virtual;//v118//004BB82C
    procedure EditWndProc(var Message:TMessage); virtual;//v11C//004BB644
    procedure SetItemHeight(Value:Integer); virtual;//v128//004BB520
    procedure SetDropDownCount(const Value:Integer); virtual;//v130//004BC200
    procedure SetItems(const Value:TStrings); virtual;//v134//004BC108
    function IsItemHeightStored:Boolean; virtual;//v138//004BC2B4
    procedure WMCreate(var Message:TWMCreate); message WM_CREATE;//004BB530
    procedure WMDrawItem(var Message:TWMDrawItem); message WM_DRAWITEM;//004BB55C
    procedure WMMeasureItem(var Message:TWMMeasureItem); message WM_MEASUREITEM;//004BB564
    procedure WMDeleteItem(var Message:TWMDeleteItem); message WM_DELETEITEM;//004BB56C
    procedure WMGetDlgCode(var Message:TWMGetDlgCode); message WM_GETDLGCODE;//004BB574
    procedure CMCancelMode(var Message:TCMCancelMode); message CM_CANCELMODE;//004BB598
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//004BB5AC
    procedure CNCommand(var Message:TWMCommand); dynamic;//004BBCA8
    procedure CloseUp; dynamic;//004BBF8C
    procedure DropDown; dynamic;//004BBF04
    procedure Select; dynamic;//004BBFAC
    procedure Focused; dynamic;//004BBF4C
    function GetDroppedDown:Boolean;//004BB334
    procedure SetDroppedDown(Value:Boolean);//004BB358
    function GetSelStart:Integer;//004BB404
    procedure SetSelStart(Value:Integer);//004BB42C
    function GetSelLength:Integer;//004BB460
    procedure SetSelLength(Value:Integer);//004BB48C
    procedure SetMaxLength(Value:Integer);//004BB4E0
    procedure ListWndProc(var Message:TMessage);//004BB7C8
  end;
  TComboBoxStyle = (csDropDown, csSimple, csDropDownList, csOwnerDrawFixed, csOwnerDrawVariable);
  TCustomComboBox = class(TCustomCombo)
  published
    destructor Destroy();//004BC350
    constructor Create;//004BC2C0
  public
    FAutoComplete:Boolean;//f2D8
    FAutoDropDown:Boolean;//f2D9
    FLastTime:Cardinal;//f2DC
    FFilter:string;//f2E0
    FCharCase:TEditCharCase;//f2E4
    FSorted:Boolean;//f2E5
    FStyle:TComboBoxStyle;//f2E6
    FSaveItems:TStringList;//f2E8
    FOnDrawItem:TDrawItemEvent;//f2F0
    FOnMeasureItem:TMeasureItemEvent;//f2F8
    FAutoCloseUp:Boolean;//f300
    FAutoCompleteDelay:Cardinal;//f304
    FTextHint:string;//f308
    destructor Destroy(); virtual;//004BC350
    constructor Create; virtual;//v2C//004BC2C0
    procedure WndProc(var Message:TMessage); virtual;//v84//004BD090
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004BC4CC
    procedure CreateWnd; virtual;//vB4//004BC538
    procedure DestroyWnd; virtual;//vC8//004BC68C
    constructor Create; virtual;//v120//004BD0E8
    function GetItemHt:Integer; virtual;//v124//004BC480
    function GetItemCount:Integer; virtual;//v12C//004BD0DC
    function IsItemHeightStored(Value:Integer):Boolean; virtual;//v138//004BC4A8
    procedure DoSetTextHint; virtual;//v13C//004BC6E0
    procedure DrawItem(Index:Integer; Rect:TRect; State:TOwnerDrawState); virtual;//v140//004BBE48
    procedure MeasureItem(Index:Integer; var Height:Integer); virtual;//v144//004BCEE0
    procedure SetStyle(Value:TComboBoxStyle); virtual;//v148//004BC440
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//004BD0F0
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//004BC758
    procedure WMLButtonDown(var Message:TWMLButtonDown); message WM_LBUTTONDOWN;//004BD014
    procedure CMParentColorChanged(var Message:TMessage); message CM_PARENTCOLORCHANGED;//004BB618
    procedure CNDrawItem(var Message:TWMDrawItem); dynamic;//004BCF00
    procedure CNMeasureItem(var Message:TWMMeasureItem); dynamic;//004BCFD8
    procedure KeyPress(var Key:Char); dynamic;//004BC898
    procedure SetCharCase(Value:TEditCharCase);//004BB7E0
    procedure SetTextHint(const Value:UnicodeString);//004BB7F4
    function GetSelText:UnicodeString;//004BC38C
    procedure SetSorted(Value:Boolean);//004BC400
    procedure SetSelText(const Value:UnicodeString);//004BC414
    function SelectItem(const AnItem:UnicodeString):Boolean;//004BCCF0
  end;
  TComboBox = class(TCustomComboBox)
  end;
  TButtonActionLink = class(TWinControlActionLink)
  public
    FClient:TButtonControl;//f28
    procedure AssignClient(AClient:TObject); virtual;//v0//004BD2BC
    function IsCheckedLinked:Boolean; virtual;//v24//004BD2E0
    procedure SetChecked(Value:Boolean); virtual;//v50//004BD30C
  end;
  TButtonControl = class(TWinControl)
  published
    constructor Create;//004BD370
  public
    FClicksDisabled:Boolean;//f270
    FWordWrap:Boolean;//f271
    constructor Create; virtual;//v2C//004BD370
    procedure WndProc(var Message:TMessage); virtual;//v84//004BD454
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004BD560
    //function vEC:?; virtual;//vEC//004BD42C
    procedure vF0; virtual;//vF0//004BD450
    procedure WMEraseBkGnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//004BD534
    procedure CNCtlColorStatic(var Message:TWMCtlColorStatic); dynamic;//004BD4CC
    procedure sub_0048751C; dynamic;//004BD424
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean); dynamic;//004BD3C4
    function IsCheckedStored(Value:Boolean):Boolean;//004BD430
    procedure SetWordWrap(const Value:Boolean);//004BD584
  end;
  TImageAlignment = (iaLeft, iaRight, iaTop, iaBottom, iaCenter);
  TImageMargins = class(TPersistent)
  published
    procedure Assign(Source:TPersistent);//004BD598
  public
    FRight:Integer;//f4
    FBottom:Integer;//f8
    FTop:Integer;//fC
    FLeft:Integer;//f10
    FOnChange:TNotifyEvent;//f18
    procedure Assign(Source:TPersistent); virtual;//v8//004BD598
    procedure Change; virtual;//vC//004BD5E0
    procedure SetMargin(Index:Integer; Value:Integer);//004BD5F4
  end;
  TPushButtonActionLink = class(TButtonActionLink)
  public
    function IsImageIndexLinked:Boolean; virtual;//v3C//004BD63C
    procedure SetImageIndex(Value:Integer); virtual;//v6C//004BD668
  end;
  TCustomButton.TButtonStyle = (bsPushButton, bsCommandLink, bsSplitButton);
  TCustomButton = class(TButtonControl)
  published
    procedure Click;//004BD7D8
    procedure UseRightToLeftAlignment;//004BDAE4
    constructor Create;//004BD688
    destructor Destroy();//004BE144
  public
    FActive:Boolean;//f278
    FCancel:Boolean;//f279
    FCommandLinkHint:string;//f27C
    FDefault:Boolean;//f280
    FDisabledImageIndex:TImageIndex;//f284
    FDropDownMenu:TPopupMenu;//f288
    FElevationRequired:Boolean;//f28C
    FHotImageIndex:TImageIndex;//f290
    FImageAlignment:TImageAlignment;//f294
    FImageChangeLink:TChangeLink;//f298
    FImageIndex:TImageIndex;//f29C
    FImageMargins:TImageMargins;//f2A0
    FImages:TCustomImageList;//f2A4
    FInternalImageList:TImageList;//f2A8
    FModalResult:TModalResult;//f2AC
    FPressedImageIndex:TImageIndex;//f2B0
    FSelectedImageIndex:TImageIndex;//f2B4
    FStyle:TButtonStyle;//f2B8
    FStylusHotImageIndex:TImageIndex;//f2BC
    FOnDropDownClick:TNotifyEvent;//f2C0
    destructor Destroy(); virtual;//004BE144
    procedure Loaded; virtual;//vC//004BE25C
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//004BE28C
    constructor Create; virtual;//v2C//004BD688
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004BE06C
    procedure CreateWnd; virtual;//vB4//004BE104
    procedure SetButtonStyle(ADefault:Boolean); virtual;//vF4//004BDAE8
    procedure UpdateImageList; virtual;//vF8//004BD820
    procedure UpdateImages; virtual;//vFC//004BD964
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//004BE440
    procedure CMDialogKey(var Message:TCMDialogKey); message CM_DIALOGKEY;//004BE2EC
    procedure CMDialogChar(var Message:TCMDialogChar); message CM_DIALOGCHAR;//004BE35C
    procedure CMFocusChanged(var Message:TCMFocusChanged); message CM_FOCUSCHANGED;//004BE3EC
    procedure CNNotify(var Message:TWMNotify); dynamic;//004BE4D4
    procedure CNCommand(var Message:TWMCommand); dynamic;//004BE2D4
    procedure CNCtlColorBtn(var Message:TWMCtlColorBtn); dynamic;//004BE46C
    procedure UseRightToLeftAlignment; dynamic;//004BDAE4
    procedure sub_0048751C; dynamic;//004BE1AC
    procedure Click; dynamic;//004BD7D8
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean); dynamic;//004BD794
    procedure SetCommandLinkHint(const Value:UnicodeString);//004BDB74
    procedure SetDefault(Value:Boolean);//004BDBB4
    procedure SetDisabledImageIndex(const Value:TImageIndex);//004BDBEC
    procedure SetDropDownMenu(const Value:TPopupMenu);//004BDC1C
    procedure SetElevationRequired(const Value:Boolean);//004BDC38
    procedure SetElevationRequiredState;//004BDC70
    procedure SetHotImageIndex(const Value:TImageIndex);//004BDCB0
    procedure SetImageAlignment(const Value:TImageAlignment);//004BDCE0
    procedure SetImageIndex(const Value:TImageIndex);//004BDD1C
    procedure SetImageList(AHandle:HIMAGELIST);//004BDD84
    procedure SetImageMargins(const Value:TImageMargins);//004BDE20
    procedure SetImages(const Value:TCustomImageList);//004BDE2C
    procedure SetPressedImageIndex(const Value:TImageIndex);//004BDE7C
    procedure SetSelectedImageIndex(const Value:TImageIndex);//004BDEAC
    procedure SetStyle(const Value:TButtonStyle);//004BDEDC
    procedure SetStylusHotImageIndex(const Value:TImageIndex);//004BE03C
    procedure UpdateCommandLinkHint;//004BE1B4
    procedure ImageListChange(Sender:TObject);//004BE1E8
    procedure ImageMarginsChange(Sender:TObject);//004BE204
    function IsImageIndexStored(Value:TImageIndex):Boolean;//004BE23C
  end;
  TButton = class(TCustomButton)
  end;
  TCheckBoxState = (cbUnchecked, cbChecked, cbGrayed);
  TCustomCheckBox = class(TButtonControl)
  published
    constructor Create;//004BE550
    procedure GetControlsAlignment;//004BE5BC
  public
    FAlignment:TLeftRight;//f278
    FAllowGrayed:Boolean;//f279
    FState:TCheckBoxState;//f27A
    constructor Create; virtual;//v2C//004BE550
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004BE6C0
    procedure CreateWnd; virtual;//vB4//004BE720
    function GetChecked:Boolean; virtual;//vEC//004BE63C
    procedure SetChecked(Value:Boolean); virtual;//vF0//004BE65C
    procedure Toggle; virtual;//vF4//004BE5E8
    procedure CMDialogChar(var Message:TCMDialogChar); message CM_DIALOGCHAR;//004BE768
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//004BE760
    procedure CNCommand(var Message:TWMCommand); dynamic;//004BE804
    procedure GetControlsAlignment; dynamic;//004BE5BC
    procedure Click; dynamic;//004BE628
    procedure SetAlignment(Value:TLeftRight);//004BE648
    procedure SetState(Value:TCheckBoxState);//004BE670
  end;
  TCheckBox = class(TCustomCheckBox)
  end;
  TRadioButton = class(TButtonControl)
  published
    constructor Create;//004BE814
    procedure GetControlsAlignment;//004BE87C
  public
    FAlignment:TLeftRight;//f278
    FChecked:Boolean;//f279
    constructor Create; virtual;//v2C//004BE814
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004BEA04
    procedure CreateWnd; virtual;//vB4//004BEA60
    function GetChecked:Boolean; virtual;//vEC//004BE874
    procedure SetChecked(Value:Boolean); virtual;//vF0//004BE978
    procedure CMDialogChar(var Message:TCMDialogChar); message CM_DIALOGCHAR;//004BEA90
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//004BEA88
    procedure CNCommand(var Message:TWMCommand); dynamic;//004BEB14
    procedure GetControlsAlignment; dynamic;//004BE87C
  end;
  TListBoxStyle = (lbStandard, lbOwnerDrawFixed, lbOwnerDrawVariable, lbVirtual, lbVirtualOwnerDraw);
  TLBGetDataEvent = procedure(Control:TWinControl; Index:Integer; var Data:string) of object;;
  TLBGetDataObjectEvent = procedure(Control:TWinControl; Index:Integer; var DataObject:TObject) of object;;
  TLBFindDataEvent = function(Control:TWinControl; FindString:string):Integer of object;;
  :TCustomListBox.:1 = array of Boolean;
//elSize = 1;
  TCustomListBox = class(TCustomMultiSelectListControl)
  published
    procedure AddItem(Item:string; AObject:TObject);//004BF2F0
    destructor Destroy();//004BF2A8
    constructor Create;//004BF1AC
    function ItemAtPos(Pos:TPoint; Existing:Boolean):Integer;//004BFBD0
    function GetCount:Integer;//004BF710
    procedure SelectAll;//004C0840
    function ItemRect(Index:Integer):TRect;//004BFC58
    procedure ClearSelection;//004BF444
    procedure Clear;//004BF434
    procedure DeleteSelected;//004BF5B4
    procedure CopySelection(Destination:TCustomListControl);//004BF48C
  public
    FAutoComplete:Boolean;//f278
    FCount:Integer;//f27C
    FItems:TStrings;//f280
    FFilter:string;//f284
    FLastTime:Cardinal;//f288
    FBorderStyle:TBorderStyle;//f28C
    FCanvas:TCanvas;//f290
    FColumns:Integer;//f294
    FItemHeight:Integer;//f298
    FOldCount:Integer;//f29C
    FStyle:TListBoxStyle;//f2A0
    FIntegralHeight:Boolean;//f2A1
    FSorted:Boolean;//f2A2
    FExtendedSelect:Boolean;//f2A3
    FTabWidth:Integer;//f2A4
    FSaveItems:TStringList;//f2A8
    FSaveTopIndex:Integer;//f2AC
    FSaveItemIndex:Integer;//f2B0
    FSaveScrollWidth:Integer;//f2B4
    FSaveSelection::1;//f2B8
    FOnDrawItem:TDrawItemEvent;//f2C0
    FOnMeasureItem:TMeasureItemEvent;//f2C8
    FOnData:TLBGetDataEvent;//f2D0
    FOnDataFind:TLBFindDataEvent;//f2D8
    FOnDataObject:TLBGetDataObjectEvent;//f2E0
    FAutoCompleteDelay:Cardinal;//f2E8
    FInBufferedPrintClient:Boolean;//f2EC
    FMoving:Boolean;//f2ED
    destructor Destroy(); virtual;//004BF2A8
    constructor Create; virtual;//v2C//004BF1AC
    procedure WndProc(var Message:TMessage); virtual;//v84//004C002C
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004BFCB4
    procedure CreateWnd; virtual;//vB4//004BFDE0
    procedure DestroyWnd; virtual;//vC8//004BFF3C
    function GetItemIndex:Integer; virtual;//vEC//004BF6B8
    procedure SetItemIndex(const Value:Integer); virtual;//vF0//004BF750
    procedure AddItem(Item:string; AObject:TObject); virtual;//vF4//004BF2F0
    procedure Clear; virtual;//vF8//004BF434
    procedure ClearSelection; virtual;//vFC//004BF444
    procedure CopySelection(Destination:TCustomListControl); virtual;//v100//004BF48C
    procedure DeleteSelected; virtual;//v104//004BF5B4
    function GetCount:Integer; virtual;//v108//004BF710
    procedure SelectAll; virtual;//v110//004C0840
    function GetSelCount:Integer; virtual;//v114//004BF734
    procedure SetMultiSelect(Value:Boolean); virtual;//v118//004BF854
    procedure DrawItem(Index:Integer; Rect:TRect; State:TOwnerDrawState); virtual;//v11C//004C05E0
    procedure MeasureItem(Index:Integer; var Height:Integer); virtual;//v120//004C0704
    procedure LoadRecreateItems(RecreateItems:TStrings); virtual;//v124//004C0B50
    procedure SaveRecreateItems(RecreateItems:TStrings); virtual;//v128//004BF41C
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//004C0560
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//004C0530
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//004C021C
    procedure LBGetText(var Message:TMessage); dynamic;//004BF9E4
    procedure LBGetTextLen(var Message:TMessage); dynamic;//004BFAA0
    procedure WMLButtonDown(var Message:TWMLButtonDown); message WM_LBUTTONDOWN;//004C0234
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//004C0814
    procedure CNDrawItem(var Message:TWMDrawItem); dynamic;//004C0724
    procedure CNMeasureItem(var Message:TWMMeasureItem); dynamic;//004C07E0
    procedure CNCommand(var Message:TWMCommand); dynamic;//004C02F0
    procedure DeleteString(Index:Integer); dynamic;//004BF3D4
    procedure ResetContent; dynamic;//004BF3F4
    procedure SetItemData(Index:Integer; AData:TCustomLongData); dynamic;//004BF394
    procedure GetItemData(Index:Integer); dynamic;//004BF374
    procedure InternalSetItemData(Index:Integer; AData:TCustomLongData); dynamic;//004BF3C4
    procedure InternalGetItemData(Index:Integer); dynamic;//004BF3B8
    procedure KeyPress(var Key:Char); dynamic;//004C0960
    procedure DragCanceled; dynamic;//004C0574
    procedure SetColumnWidth;//004BF620
    procedure SetColumns(Value:Integer);//004BF674
    procedure SetExtendedSelect(Value:Boolean);//004BF79C
    procedure SetIntegralHeight(Value:Boolean);//004BF7B0
    function GetItemHeight:Integer;//004BF7D4
    function GetItemRect(Index:Integer):TRect;//004BF810
    procedure SetItemHeight(Value:Integer);//004BF820
    procedure SetTabWidth(Value:Integer);//004BF838
    function GetSelected(Index:Integer):Boolean;//004BF868
    procedure SetSelected(Index:Integer; Value:Boolean);//004BF8B8
    procedure SetSorted(Value:Boolean);//004BF968
    procedure SetStyle(Value:TListBoxStyle);//004BF98C
    function GetTopIndex:Integer;//004BF9C8
    procedure SetBorderStyle(Value:TBorderStyle);//004BFB48
    procedure SetTopIndex(Value:Integer);//004BFB5C
    procedure SetItems(Value:TStrings);//004BFB88
    procedure SetCount(const Value:Integer);//004C0B68
    function DoGetData(const Index:Integer):UnicodeString;//004C0C4C
    function DoGetDataObject(const Index:Integer):TObject;//004C0C6C
    function DoFindData(const Data:UnicodeString):Integer;//004C0C98
    function GetScrollWidth:Integer;//004C0CBC
    procedure SetScrollWidth(const Value:Integer);//004C0CD8
  end;
  TListBox = class(TCustomListBox)
  end;
  TScrollCode = (scLineUp, scLineDown, scPageUp, scPageDown, scPosition, scTrack, scTop, scBottom, scEndScroll);
  TScrollEvent = procedure(Sender:TObject; ScrollCode:TScrollCode; var ScrollPos:Integer) of object;;
  TScrollBar = class(TWinControl)
  published
    constructor Create;//004C0D04
    procedure SetParams(APosition:Integer; AMin:Integer; AMax:Integer);//004C0F60
  public
    FKind:TScrollBarKind;//f270
    FPosition:Integer;//f274
    FMin:Integer;//f278
    FMax:Integer;//f27C
    FPageSize:Integer;//f280
    FRTLFactor:Integer;//f284
    FSmallChange:TScrollBarInc;//f288
    FLargeChange:TScrollBarInc;//f28A
    FOnChange:TNotifyEvent;//f290
    f294:TCompletionProposalForm;//f294
    FOnScroll:TScrollEvent;//f298
    constructor Create; virtual;//v2C//004C0D04
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004C0DBC
    procedure CreateWnd; virtual;//vB4//004C0E48
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//004C12D4
    procedure sub_004C129C; dynamic;//004C129C
    procedure sub_004C12A4; dynamic;//004C12A4
    procedure CNCtlColorScrollBar(var Message:TMessage); dynamic;//004C12AC
    procedure Scroll(ScrollCode:TScrollCode; var ScrollPos:Integer); dynamic;//004C1164
    procedure Change; dynamic;//004C1140
    function NotRightToLeft:Boolean;//004C0F04
    procedure SetKind(Value:TScrollBarKind);//004C0F24
    procedure SetPosition(Value:Integer);//004C10A8
    procedure SetPageSize(Value:Integer);//004C10BC
    procedure SetMin(Value:Integer);//004C1114
    procedure SetMax(Value:Integer);//004C112C
    procedure DoScroll(var Message:TWMScroll);//004C1184
  end;
  TMemoStrings = class(TStrings)
  published
    procedure Insert(Index:Integer; S:string);//004BA690
    procedure Delete(Index:Integer);//004BA798
    procedure Clear;//004BA824
  public
    Memo:TCustomMemo;//f2C
    function Get(Index:Integer):UnicodeString; virtual;//vC//004BA5CC
    function GetCount:Integer; virtual;//v14//004BA55C
    function GetTextStr:UnicodeString; virtual;//v1C//004BA880
    procedure Put(Index:Integer; const S:UnicodeString); virtual;//v20//004BA624
    procedure SetTextStr(const Value:UnicodeString); virtual;//v2C//004BA894
    procedure SetUpdateState(Updating:Boolean); virtual;//v30//004BA830
    procedure Clear; virtual;//v44//004BA824
    procedure Delete(Index:Integer); virtual;//v48//004BA798
    procedure Insert(Index:Integer; S:string); virtual;//v60//004BA690
  end;
  TComboBoxStrings = class(TCustomComboBoxStrings)
  published
    procedure Insert(Index:Integer; S:string);//004BB0D0
    function Add(S:string):Integer;//004BB038
  public
    function Add(S:string):Integer; virtual;//v38//004BB038
    procedure Insert(Index:Integer; S:string); virtual;//v60//004BB0D0
  end;
  TListBoxStrings = class(TStrings)
  published
    function IndexOf(S:string):Integer;//004BF060
    procedure Insert(Index:Integer; S:string);//004BEE14
    procedure Move(CurIndex:Integer; NewIndex:Integer);//004BF09C
    procedure Exchange(Index1:Integer; Index2:Integer);//004BEEB8
    function Add(S:string):Integer;//004BED7C
    procedure Clear;//004BF01C
    procedure Delete(Index:Integer);//004BEEA8
  public
    ListBox:TCustomListBox;//f2C
    function Get(Index:Integer):UnicodeString; virtual;//vC//004BEB60
    function GetCount:Integer; virtual;//v14//004BEB44
    function GetObject(Index:Integer):TObject; virtual;//v18//004BEC34
    procedure Put(Index:Integer; const S:UnicodeString); virtual;//v20//004BECC8
    procedure PutObject(Index:Integer; AObject:TObject); virtual;//v24//004BED44
    procedure SetUpdateState(Updating:Boolean); virtual;//v30//004BF02C
    function Add(S:string):Integer; virtual;//v38//004BED7C
    procedure Clear; virtual;//v44//004BF01C
    procedure Delete(Index:Integer); virtual;//v48//004BEEA8
    procedure Exchange(Index1:Integer; Index2:Integer); virtual;//v4C//004BEEB8
    function IndexOf(S:string):Integer; virtual;//v54//004BF060
    procedure Insert(Index:Integer; S:string); virtual;//v60//004BEE14
    procedure Move(CurIndex:Integer; NewIndex:Integer); virtual;//v78//004BF09C
  end;
  tagOFNW = tagOFNW = record//size=58
lStructSize:Cardinal;//f0
hWndOwner:HWND;//f4
hInstance:Cardinal;//f8
lpstrFilter:PWideChar;//fC
lpstrCustomFilter:PWideChar;//f10
nMaxCustFilter:Cardinal;//f14
nFilterIndex:Cardinal;//f18
lpstrFile:PWideChar;//f1C
nMaxFile:Cardinal;//f20
lpstrFileTitle:PWideChar;//f24
nMaxFileTitle:Cardinal;//f28
lpstrInitialDir:PWideChar;//f2C
lpstrTitle:PWideChar;//f30
Flags:Cardinal;//f34
nFileOffset:Word;//f38
nFileExtension:Word;//f3A
lpstrDefExt:PWideChar;//f3C
lCustData:Integer;//f40
lpfnHook:?;//f44
lpTemplateName:PWideChar;//f48
pvReserved:Pointer;//f4C
dwReserved:Cardinal;//f50
FlagsEx:Cardinal;//f54
end;;
  tagFINDREPLACEW = tagFINDREPLACEW = record//size=28
lStructSize:Cardinal;//f0
hWndOwner:HWND;//f4
hInstance:Cardinal;//f8
Flags:Cardinal;//fC
lpstrFindWhat:PWideChar;//f10
lpstrReplaceWith:PWideChar;//f14
wFindWhatLen:Word;//f18
wReplaceWithLen:Word;//f1A
lCustData:Integer;//f1C
lpfnHook:?;//f20
lpTemplateName:PWideChar;//f24
end;;
    procedure DragAcceptFiles(Accept:BOOL); stdcall;//004ACC0C
    procedure DragFinish; stdcall;//004ACC14
    function DragQueryFileW(FileIndex:UINT; FileName:PWideChar; cb:UINT):UINT; stdcall;//004ACC1C
    function DragQueryPoint(var Point:TPoint):BOOL; stdcall;//004ACC24
    function Shell_NotifyIconW(lpData:PNotifyIconDataW):BOOL; stdcall;//004ACC2C
    function ShellExecuteW(Operation:PWideChar; FileName:PWideChar; Parameters:PWideChar; Directory:PWideChar; ShowCmd:Integer):HINST; stdcall;//004ACC34
    function SHGetPathFromIDListW(pszPath:PWideChar):BOOL; stdcall;//004ACE0C
    function SHGetSpecialFolderLocation(nFolder:Integer; var ppidl:PItemIDList):HRESULT; stdcall;//004ACE14
    function SHGetSpecialFolderPathW(lpszPath:PWideChar; nFolder:Integer; fCreate:BOOL):BOOL; stdcall;//004ACE1C
    function SHCreateItemFromParsingName(pszPath:LPCWSTR; const pbc:IBindCtx; const riid:TIID; var ppv:void ):HRESULT; stdcall;//004ACE44
    function HasPopup(Control:TControl):Boolean;//004B80D8
    procedure AdjustClientRect(var Rect:TRect);//004B87F8
    procedure CreateParams(var Params:TCreateParams);//004B8858
    procedure Paint;//004B8868
    procedure CMDialogChar(var Message:TCMDialogChar);//004B8C70
    procedure CMTextChanged(var Message:TMessage);//004B8CF0
    procedure CMCtl3DChanged(var Message:TMessage);//004B8D08
    procedure WMSize(var Message:TWMSize);//004B8D28
    function GetLabelText:UnicodeString;//004B8DE0
    procedure DoDrawText(var Rect:TRect; Flags:LongInt);//004B8EF4
    procedure FillGlassRect(Canvas:TCanvas; Rect:TRect);//004B91F4
    procedure Paint;//004B9284
    procedure Loaded;//004B9388
    procedure AdjustBounds;//004B93A4
    procedure SetAutoSize(Value:Boolean);//004B94F0
    procedure Notification(AComponent:TComponent; Operation:TOperation);//004B95F4
    procedure CMTextChanged(var Message:TMessage);//004B9624
    procedure CMThemeChanged(var Message:TMessage);//004B9640
    procedure CMFontChanged(var Message:TMessage);//004B9654
    procedure CMDialogChar(var Message:TCMDialogChar);//004B966C
    procedure DoSetMaxLength(Value:Integer);//004B9824
    procedure DoSetTextHint(const Value:UnicodeString);//004B9844
    procedure SetAutoSize(Value:Boolean);//004B98A4
    function GetSelStart:Integer;//004B9B00
    procedure SetSelStart(Value:Integer);//004B9B24
    function GetSelLength:Integer;//004B9B44
    procedure SetSelLength(Value:Integer);//004B9B74
    function GetSelText:UnicodeString;//004B9D74
    procedure CreateParams(var Params:TCreateParams);//004B9E34
    procedure CreateWindowHandle(const Params:TCreateParams);//004B9F28
    procedure CreateWnd;//004B9F98
    procedure DestroyWnd;//004BA0B0
    procedure Change;//004BA20C
    procedure WMSetFont(var Message:TWMSetFont);//004BA2D4
    procedure CMColorChanged(var Message:TMessage);//004BA314
    procedure CMCtl3DChanged(var Message:TMessage);//004BA344
    procedure CMFontChanged(var Message:TMessage);//004BA378
    procedure CMGestureManagerChanged(var Message:TMessage);//004BA3A0
    procedure CNCommand(var Message:TWMCommand);//004BA3E8
    procedure CMEnter(var Message:TCMEnter);//004BA40C
    procedure CMTextChanged(var Message:TMessage);//004BA448
    procedure WMContextMenu(var Message:TWMContextMenu);//004BA480
    function GetCount:Integer;//004BA55C
    function Get(Index:Integer):UnicodeString;//004BA5CC
    procedure Put(Index:Integer; const S:UnicodeString);//004BA624
    procedure SetUpdateState(Updating:Boolean);//004BA830
    function GetTextStr:UnicodeString;//004BA880
    procedure SetTextStr(const Value:UnicodeString);//004BA894
    procedure DoGetGestureOptions(var Gestures:TInteractiveGestures; var Options:TInteractiveGestureOptions);//004BAA5C
    procedure CreateParams(var Params:TCreateParams);//004BAA94
    procedure CreateWindowHandle(const Params:TCreateParams);//004BAAD0
    function GetCaretPos:TPoint;//004BABDC
    procedure IsTouchPropertyStored(AProperty:TTouchProperty);//004BAC38
    procedure SetCaretPos(const Value:TPoint);//004BAC84
    procedure Loaded;//004BACC0
    procedure WMGetDlgCode(var Message:TWMGetDlgCode);//004BAD18
    procedure WMNCDestroy(var Message:TWMNCDestroy);//004BAD4C
    procedure KeyPress(var Key:Char);//004BAD54
    function GetCount:Integer;//004BADDC
    function GetObject(Index:Integer):TObject;//004BADF8
    procedure PutObject(Index:Integer; AObject:TObject);//004BAE8C
    function Get(Index:Integer):UnicodeString;//004BAEB0
    procedure SetUpdateState(Updating:Boolean);//004BB004
    procedure DestroyWindowHandle;//004BB2F0
    function GetItemIndex:Integer;//004BB39C
    procedure SetItemIndex(const Value:Integer);//004BB3C8
    procedure SetItemHeight(Value:Integer);//004BB520
    procedure WMCreate(var Message:TWMCreate);//004BB530
    procedure WMDrawItem(var Message:TWMDrawItem);//004BB55C
    procedure WMMeasureItem(var Message:TWMMeasureItem);//004BB564
    procedure WMDeleteItem(var Message:TWMDeleteItem);//004BB56C
    procedure WMGetDlgCode(var Message:TWMGetDlgCode);//004BB574
    procedure CMCancelMode(var Message:TCMCancelMode);//004BB598
    procedure CMCtl3DChanged(var Message:TMessage);//004BB5AC
    procedure CMGestureManagerChanged(var Message:TMessage);//004BB5D0
    procedure CMParentColorChanged(var Message:TMessage);//004BB618
    procedure EditWndProc(var Message:TMessage);//004BB644
    procedure ComboWndProc(var Message:TMessage; ComboWnd:HWND; ComboProc:TWindowProcPtr);//004BB82C
    procedure WndProc(var Message:TMessage);//004BBB14
    procedure CNCommand(var Message:TWMCommand);//004BBCA8
    procedure Change;//004BBE24
    procedure DrawItem(Index:Integer; Rect:TRect; State:TOwnerDrawState);//004BBE48
    procedure DropDown;//004BBF04
    procedure Loaded;//004BBF24
    procedure CloseUp;//004BBF8C
    procedure Select;//004BBFAC
    procedure CreateWnd;//004BBFD8
    procedure AdjustDropDown;//004BC04C
    procedure SetItems(const Value:TStrings);//004BC108
    procedure SetDropDownCount(const Value:Integer);//004BC200
    function IsItemHeightStored:Boolean;//004BC2B4
    procedure SetStyle(Value:TComboBoxStyle);//004BC440
    function GetItemHt:Integer;//004BC480
    function IsItemHeightStored(Value:Integer):Boolean;//004BC4A8
    procedure CreateParams(var Params:TCreateParams);//004BC4CC
    procedure CreateWnd;//004BC538
    procedure DestroyWnd;//004BC68C
    procedure DoSetTextHint;//004BC6E0
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//004BC758
    function HasSelectedText(var StartPos:Integer; var EndPos:Integer):Boolean;//004BC7B0
    procedure DeleteSelectedText(const StartPos:DWORD; const EndPos:DWORD);//004BC7F4
    procedure KeyPress(var Key:Char);//004BC898
    procedure MeasureItem(Index:Integer; var Height:Integer);//004BCEE0
    procedure CNDrawItem(var Message:TWMDrawItem);//004BCF00
    procedure CNMeasureItem(var Message:TWMMeasureItem);//004BCFD8
    procedure WMLButtonDown(var Message:TWMLButtonDown);//004BD014
    procedure WndProc(var Message:TMessage);//004BD090
    function GetItemCount:Integer;//004BD0DC
    constructor Create;//004BD0E8
    procedure WMPaint(var Message:TWMPaint);//004BD0F0
    procedure AssignClient(AClient:TObject);//004BD2BC
    function IsCheckedLinked:Boolean;//004BD2E0
    procedure SetChecked(Value:Boolean);//004BD30C
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean);//004BD3C4
    procedure sub_0048751C;//004BD424
    //function sub_004BD42C:?;//004BD42C
    procedure sub_004BD450;//004BD450
    procedure WndProc(var Message:TMessage);//004BD454
    procedure CNCtlColorStatic(var Message:TWMCtlColorStatic);//004BD4CC
    procedure WMEraseBkGnd(var Message:TWMEraseBkgnd);//004BD534
    procedure CreateParams(var Params:TCreateParams);//004BD560
    procedure Change;//004BD5E0
    function IsImageIndexLinked:Boolean;//004BD63C
    procedure SetImageIndex(Value:Integer);//004BD668
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean);//004BD794
    function GetColor(Value:DWORD):TColor;//004BD800
    procedure UpdateImageList;//004BD820
    procedure UpdateImages;//004BD964
    procedure SetButtonStyle(ADefault:Boolean);//004BDAE8
    procedure CreateParams(var Params:TCreateParams);//004BE06C
    procedure CreateWnd;//004BE104
    procedure sub_0048751C;//004BE1AC
    procedure Loaded;//004BE25C
    procedure Notification(AComponent:TComponent; Operation:TOperation);//004BE28C
    procedure CNCommand(var Message:TWMCommand);//004BE2D4
    procedure CMDialogKey(var Message:TCMDialogKey);//004BE2EC
    procedure CMDialogChar(var Message:TCMDialogChar);//004BE35C
    procedure CMFocusChanged(var Message:TCMFocusChanged);//004BE3EC
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//004BE440
    procedure CNCtlColorBtn(var Message:TWMCtlColorBtn);//004BE46C
    procedure CNNotify(var Message:TWMNotify);//004BE4D4
    procedure Toggle;//004BE5E8
    procedure Click;//004BE628
    function GetChecked:Boolean;//004BE63C
    procedure SetChecked(Value:Boolean);//004BE65C
    procedure CreateParams(var Params:TCreateParams);//004BE6C0
    procedure CreateWnd;//004BE720
    procedure WMSize(var Message:TWMSize);//004BE748
    procedure CMCtl3DChanged(var Message:TMessage);//004BE760
    procedure CMDialogChar(var Message:TCMDialogChar);//004BE768
    procedure CNCommand(var Message:TWMCommand);//004BE804
    function GetChecked:Boolean;//004BE874
    procedure SetShowAccelChar(Value:Boolean);//004BE8A8
    procedure TurnSiblingsOff;//004BE8BC
    procedure SetChecked(Value:Boolean);//004BE978
    procedure CreateParams(var Params:TCreateParams);//004BEA04
    procedure CreateWnd;//004BEA60
    procedure CMCtl3DChanged(var Message:TMessage);//004BEA88
    procedure CMDialogChar(var Message:TCMDialogChar);//004BEA90
    procedure CNCommand(var Message:TWMCommand);//004BEB14
    function GetCount:Integer;//004BEB44
    function Get(Index:Integer):UnicodeString;//004BEB60
    function GetObject(Index:Integer):TObject;//004BEC34
    procedure Put(Index:Integer; const S:UnicodeString);//004BECC8
    procedure PutObject(Index:Integer; AObject:TObject);//004BED44
    procedure SetUpdateState(Updating:Boolean);//004BF02C
    procedure GetItemData(Index:Integer);//004BF374
    procedure SetItemData(Index:Integer; AData:TCustomLongData);//004BF394
    procedure InternalGetItemData(Index:Integer);//004BF3B8
    procedure InternalSetItemData(Index:Integer; AData:TCustomLongData);//004BF3C4
    procedure DeleteString(Index:Integer);//004BF3D4
    procedure ResetContent;//004BF3F4
    procedure SaveRecreateItems(RecreateItems:TStrings);//004BF41C
    function GetItemIndex:Integer;//004BF6B8
    function GetSelCount:Integer;//004BF734
    procedure SetItemIndex(const Value:Integer);//004BF750
    procedure SetMultiSelect(Value:Boolean);//004BF854
    procedure LBGetText(var Message:TMessage);//004BF9E4
    procedure LBGetTextLen(var Message:TMessage);//004BFAA0
    procedure CreateParams(var Params:TCreateParams);//004BFCB4
    procedure CreateWnd;//004BFDE0
    procedure DestroyWnd;//004BFF3C
    procedure WndProc(var Message:TMessage);//004C002C
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//004C021C
    procedure WMLButtonDown(var Message:TWMLButtonDown);//004C0234
    procedure CNCommand(var Message:TWMCommand);//004C02F0
    procedure PaintListBox;//004C0324
    procedure WMPaint(var Message:TWMPaint);//004C0530
    procedure WMSize(var Message:TWMSize);//004C0560
    procedure DragCanceled;//004C0574
    procedure DrawItem(Index:Integer; Rect:TRect; State:TOwnerDrawState);//004C05E0
    procedure MeasureItem(Index:Integer; var Height:Integer);//004C0704
    procedure CNDrawItem(var Message:TWMDrawItem);//004C0724
    procedure CNMeasureItem(var Message:TWMMeasureItem);//004C07E0
    procedure CMCtl3DChanged(var Message:TMessage);//004C0814
    procedure FindString;//004C0878
    procedure KeyPress(var Key:Char);//004C0960
    procedure LoadRecreateItems(RecreateItems:TStrings);//004C0B50
    procedure CreateParams(var Params:TCreateParams);//004C0DBC
    procedure CreateWnd;//004C0E48
    procedure Change;//004C1140
    procedure Scroll(ScrollCode:TScrollCode; var ScrollPos:Integer);//004C1164
    procedure sub_004C129C;//004C129C
    procedure sub_004C12A4;//004C12A4
    procedure CNCtlColorScrollBar(var Message:TMessage);//004C12AC
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//004C12D4
    function GetOpenFileNameW:BOOL; stdcall;//004C1648
    function GetSaveFileNameW:BOOL; stdcall;//004C1650
    function FindTextW:HWND; stdcall;//004C1658
    function ReplaceTextW:HWND; stdcall;//004C1660
    procedure ColorRGBToHLS(clrRGB:TColorRef; var Hue:Word; var Luminance:Word; var Saturation:Word);//004C2D90
    function HueToRGB(Lum:Double; Sat:Double; Hue:Double):Integer;//004C30D4
    function RoundColor(Value:Double):Integer;//004C31C4
    function ColorHLSToRGB(Hue:Word; Luminance:Word; Saturation:Word):TColorRef;//004C31F0
    function ColorAdjustLuma(clrRGB:TColor; n:Integer; fScale:BOOL):TColor;//004C3414
    function GetHighLightColor(const Color:TColor; Luminance:Integer):TColor;//004C34A0
    function GetShadowColor(const Color:TColor; Luminance:Integer):TColor;//004C3578
    procedure GradientFillCanvas(const ACanvas:TCanvas; const AStartColor:TColor; const AEndColor:TColor; const ARect:TRect; const Direction:TGradientDirection);//004C3650

implementation

//004ACC0C
procedure shell32.DragAcceptFiles(Accept:BOOL); stdcall;
begin
{*
 004ACC0C    jmp         dword ptr ds:[826848]
*}
end;

//004ACC14
procedure shell32.DragFinish; stdcall;
begin
{*
 004ACC14    jmp         dword ptr ds:[826844]
*}
end;

//004ACC1C
function shell32.DragQueryFileW(FileIndex:UINT; FileName:PWideChar; cb:UINT):UINT; stdcall;
begin
{*
 004ACC1C    jmp         dword ptr ds:[826840]
*}
end;

//004ACC24
function shell32.DragQueryPoint(var Point:TPoint):BOOL; stdcall;
begin
{*
 004ACC24    jmp         dword ptr ds:[82683C]
*}
end;

//004ACC2C
function shell32.Shell_NotifyIconW(lpData:PNotifyIconDataW):BOOL; stdcall;
begin
{*
 004ACC2C    jmp         dword ptr ds:[826838]
*}
end;

//004ACC34
function shell32.ShellExecuteW(Operation:PWideChar; FileName:PWideChar; Parameters:PWideChar; Directory:PWideChar; ShowCmd:Integer):HINST; stdcall;
begin
{*
 004ACC34    jmp         dword ptr ds:[826834]
*}
end;

//004ACE0C
function shell32.SHGetPathFromIDListW(pszPath:PWideChar):BOOL; stdcall;
begin
{*
 004ACE0C    jmp         dword ptr ds:[826858]
*}
end;

//004ACE14
function shell32.SHGetSpecialFolderLocation(nFolder:Integer; var ppidl:PItemIDList):HRESULT; stdcall;
begin
{*
 004ACE14    jmp         dword ptr ds:[826854]
*}
end;

//004ACE1C
function shell32.SHGetSpecialFolderPathW(lpszPath:PWideChar; nFolder:Integer; fCreate:BOOL):BOOL; stdcall;
begin
{*
 004ACE1C    jmp         dword ptr ds:[826850]
*}
end;

//004ACE44
function SHCreateItemFromParsingName(pszPath:LPCWSTR; const pbc:IBindCtx; const riid:TIID; var ppv:void ):HRESULT; stdcall;
begin
{*
 004ACE44    jmp         dword ptr ds:[82A110]
*}
end;

//004B80D8
function HasPopup(Control:TControl):Boolean;
begin
{*
 004B80D8    mov         dl,1
 004B80DA    test        eax,eax
>004B80DC    je          004B80EB
 004B80DE    cmp         dword ptr [eax+7C],0
>004B80E2    jne         004B80ED
 004B80E4    mov         eax,dword ptr [eax+34]
 004B80E7    test        eax,eax
>004B80E9    jne         004B80DE
 004B80EB    xor         edx,edx
 004B80ED    mov         eax,edx
 004B80EF    ret
*}
end;

//004B879C
constructor TCustomGroupBox.Create;
begin
{*
 004B879C    push        ebx
 004B879D    push        esi
 004B879E    test        dl,dl
>004B87A0    je          004B87AA
 004B87A2    add         esp,0FFFFFFF0
 004B87A5    call        @ClassCreate
 004B87AA    mov         ebx,edx
 004B87AC    mov         esi,eax
 004B87AE    xor         edx,edx
 004B87B0    mov         eax,esi
 004B87B2    call        TCustomControl.Create
 004B87B7    mov         eax,[004B87F4]
 004B87BC    mov         dword ptr [esi+50],eax
 004B87BF    mov         edx,0B9
 004B87C4    mov         eax,esi
 004B87C6    call        TControl.SetWidth
 004B87CB    mov         edx,69
 004B87D0    mov         eax,esi
 004B87D2    call        TControl.SetHeight
 004B87D7    mov         eax,esi
 004B87D9    test        bl,bl
>004B87DB    je          004B87EC
 004B87DD    call        @AfterConstruction
 004B87E2    pop         dword ptr fs:[0]
 004B87E9    add         esp,0C
 004B87EC    mov         eax,esi
 004B87EE    pop         esi
 004B87EF    pop         ebx
 004B87F0    ret
*}
end;

//004B87F8
procedure TCustomGroupBox.AdjustClientRect(var Rect:TRect);
begin
{*
 004B87F8    push        ebx
 004B87F9    push        esi
 004B87FA    mov         esi,edx
 004B87FC    mov         ebx,eax
 004B87FE    mov         edx,esi
 004B8800    mov         eax,ebx
 004B8802    call        TWinControl.AdjustClientRect
 004B8807    mov         edx,dword ptr [ebx+64]
 004B880A    mov         eax,dword ptr [ebx+270]
 004B8810    call        TCanvas.SetFont
 004B8815    mov         edx,4B8854;'0'
 004B881A    mov         eax,dword ptr [ebx+270]
 004B8820    call        TCustomCanvas.TextHeight
 004B8825    add         dword ptr [esi+4],eax
 004B8828    push        0FF
 004B882A    push        0FF
 004B882C    push        esi
 004B882D    call        user32.InflateRect
 004B8832    cmp         byte ptr [ebx+1E9],0
>004B8839    je          004B8845
 004B883B    push        0FF
 004B883D    push        0FF
 004B883F    push        esi
 004B8840    call        user32.InflateRect
 004B8845    pop         esi
 004B8846    pop         ebx
 004B8847    ret
*}
end;

//004B8858
procedure TCustomGroupBox.CreateParams(var Params:TCreateParams);
begin
{*
 004B8858    push        ebx
 004B8859    mov         ebx,edx
 004B885B    mov         edx,ebx
 004B885D    call        TWinControl.CreateParams
 004B8862    and         dword ptr [ebx+24],0FFFFFFFC
 004B8866    pop         ebx
 004B8867    ret
*}
end;

//004B8868
procedure TCustomGroupBox.Paint;
begin
{*
 004B8868    push        ebp
 004B8869    mov         ebp,esp
 004B886B    mov         ecx,13
 004B8870    push        0
 004B8872    push        0
 004B8874    dec         ecx
>004B8875    jne         004B8870
 004B8877    push        ecx
 004B8878    push        ebx
 004B8879    push        esi
 004B887A    push        edi
 004B887B    mov         ebx,eax
 004B887D    xor         eax,eax
 004B887F    push        ebp
 004B8880    push        4B8C52
 004B8885    push        dword ptr fs:[eax]
 004B8888    mov         dword ptr fs:[eax],esp
 004B888B    mov         edi,dword ptr [ebx+270]
 004B8891    mov         edx,dword ptr [ebx+64]
 004B8894    mov         eax,edi
 004B8896    call        TCanvas.SetFont
 004B889B    mov         eax,ebx
 004B889D    call        ThemeControl
 004B88A2    test        al,al
>004B88A4    je          004B8A35
 004B88AA    lea         edx,[ebp-68]
 004B88AD    mov         eax,ebx
 004B88AF    call        TControl.GetText
 004B88B4    cmp         dword ptr [ebp-68],0
>004B88B8    je          004B894E
 004B88BE    mov         eax,edi
 004B88C0    call        TCanvas.GetHandle
 004B88C5    mov         dword ptr [ebp-24],eax
 004B88C8    lea         edx,[ebp-4]
 004B88CB    mov         eax,ebx
 004B88CD    call        TControl.GetText
 004B88D2    lea         edx,[ebp-6C]
 004B88D5    mov         eax,ebx
 004B88D7    call        TControl.GetText
 004B88DC    mov         eax,dword ptr [ebp-6C]
 004B88DF    mov         dword ptr [ebp-70],eax
 004B88E2    mov         esi,dword ptr [ebp-70]
 004B88E5    test        esi,esi
>004B88E7    je          004B88EE
 004B88E9    sub         esi,4
 004B88EC    mov         esi,dword ptr [esi]
 004B88EE    lea         eax,[ebp-1C]
 004B88F1    push        eax
 004B88F2    push        esi
 004B88F3    mov         eax,dword ptr [ebp-4]
 004B88F6    call        @UStrToPWChar
 004B88FB    push        eax
 004B88FC    mov         eax,dword ptr [ebp-24]
 004B88FF    push        eax
 004B8900    call        gdi32.GetTextExtentPoint32W
 004B8905    mov         eax,dword ptr [ebp-18]
 004B8908    push        eax
 004B8909    lea         eax,[ebp-48]
 004B890C    push        eax
 004B890D    mov         ecx,dword ptr [ebp-1C]
 004B8910    xor         edx,edx
 004B8912    xor         eax,eax
 004B8914    call        Rect
 004B8919    mov         eax,ebx
 004B891B    mov         si,0FFC7
 004B891F    call        @CallDynaInst
 004B8924    test        al,al
>004B8926    jne         004B8937
 004B8928    push        0
 004B892A    push        8
 004B892C    lea         eax,[ebp-48]
 004B892F    push        eax
 004B8930    call        user32.OffsetRect
>004B8935    jmp         004B895F
 004B8937    push        0
 004B8939    mov         eax,dword ptr [ebx+48]
 004B893C    sub         eax,8
 004B893F    sub         eax,dword ptr [ebp-40]
 004B8942    push        eax
 004B8943    lea         eax,[ebp-48]
 004B8946    push        eax
 004B8947    call        user32.OffsetRect
>004B894C    jmp         004B895F
 004B894E    push        0
 004B8950    lea         eax,[ebp-48]
 004B8953    push        eax
 004B8954    xor         ecx,ecx
 004B8956    xor         edx,edx
 004B8958    xor         eax,eax
 004B895A    call        Rect
 004B895F    lea         edx,[ebp-58]
 004B8962    mov         eax,ebx
 004B8964    mov         ecx,dword ptr [eax]
 004B8966    call        dword ptr [ecx+54]
 004B8969    mov         eax,dword ptr [ebp-3C]
 004B896C    sub         eax,dword ptr [ebp-44]
 004B896F    sar         eax,1
>004B8971    jns         004B8976
 004B8973    adc         eax,0
 004B8976    mov         dword ptr [ebp-54],eax
 004B8979    mov         eax,dword ptr [ebp-3C]
 004B897C    push        eax
 004B897D    mov         eax,dword ptr [ebp-40]
 004B8980    push        eax
 004B8981    mov         eax,dword ptr [ebp-44]
 004B8984    push        eax
 004B8985    mov         eax,dword ptr [ebp-48]
 004B8988    push        eax
 004B8989    mov         eax,edi
 004B898B    call        TCanvas.GetHandle
 004B8990    push        eax
 004B8991    call        gdi32.ExcludeClipRect
 004B8996    mov         eax,ebx
 004B8998    mov         edx,dword ptr [eax]
 004B899A    call        dword ptr [edx+5C]
 004B899D    test        al,al
>004B899F    je          004B89A7
 004B89A1    mov         byte ptr [ebp-1D],1B
>004B89A5    jmp         004B89AB
 004B89A7    mov         byte ptr [ebp-1D],1C
 004B89AB    call        ThemeServices
 004B89B0    lea         ecx,[ebp-64]
 004B89B3    movzx       edx,byte ptr [ebp-1D]
 004B89B7    call        TThemeServices.GetElementDetails
 004B89BC    lea         eax,[ebp-58]
 004B89BF    push        eax
 004B89C0    mov         eax,edi
 004B89C2    call        TCanvas.GetHandle
 004B89C7    push        eax
 004B89C8    call        ThemeServices
 004B89CD    lea         ecx,[ebp-64]
 004B89D0    pop         edx
 004B89D1    call        TThemeServices.DrawElement
 004B89D6    push        0
 004B89D8    mov         eax,edi
 004B89DA    call        TCanvas.GetHandle
 004B89DF    push        eax
 004B89E0    call        gdi32.SelectClipRgn
 004B89E5    lea         edx,[ebp-74]
 004B89E8    mov         eax,ebx
 004B89EA    call        TControl.GetText
 004B89EF    cmp         dword ptr [ebp-74],0
>004B89F3    je          004B8BFD
 004B89F9    lea         edx,[ebp-7C]
 004B89FC    mov         eax,ebx
 004B89FE    call        TControl.GetText
 004B8A03    mov         edx,dword ptr [ebp-7C]
 004B8A06    lea         eax,[ebp-78]
 004B8A09    call        @WStrFromUStr
 004B8A0E    mov         eax,dword ptr [ebp-78]
 004B8A11    push        eax
 004B8A12    lea         eax,[ebp-48]
 004B8A15    push        eax
 004B8A16    push        0
 004B8A18    push        0
 004B8A1A    mov         eax,edi
 004B8A1C    call        TCanvas.GetHandle
 004B8A21    push        eax
 004B8A22    call        ThemeServices
 004B8A27    lea         ecx,[ebp-64]
 004B8A2A    pop         edx
 004B8A2B    call        TThemeServices.DrawText
>004B8A30    jmp         004B8BFD
 004B8A35    mov         edx,4B8C6C;'0'
 004B8A3A    mov         eax,edi
 004B8A3C    call        TCustomCanvas.TextHeight
 004B8A41    mov         dword ptr [ebp-10],eax
 004B8A44    mov         eax,dword ptr [ebx+4C]
 004B8A47    push        eax
 004B8A48    lea         eax,[ebp-38]
 004B8A4B    push        eax
 004B8A4C    mov         edx,dword ptr [ebp-10]
 004B8A4F    sar         edx,1
>004B8A51    jns         004B8A56
 004B8A53    adc         edx,0
 004B8A56    dec         edx
 004B8A57    mov         ecx,dword ptr [ebx+48]
 004B8A5A    xor         eax,eax
 004B8A5C    call        Rect
 004B8A61    cmp         byte ptr [ebx+1E9],0
>004B8A68    je          004B8AA3
 004B8A6A    inc         dword ptr [ebp-38]
 004B8A6D    inc         dword ptr [ebp-34]
 004B8A70    mov         edx,0FF000014
 004B8A75    mov         eax,dword ptr [edi+48]
 004B8A78    call        TBrush.SetColor
 004B8A7D    lea         edx,[ebp-38]
 004B8A80    mov         eax,edi
 004B8A82    mov         ecx,dword ptr [eax]
 004B8A84    call        dword ptr [ecx+5C]
 004B8A87    push        0FF
 004B8A89    push        0FF
 004B8A8B    lea         eax,[ebp-38]
 004B8A8E    push        eax
 004B8A8F    call        user32.OffsetRect
 004B8A94    mov         edx,0FF000010
 004B8A99    mov         eax,dword ptr [edi+48]
 004B8A9C    call        TBrush.SetColor
>004B8AA1    jmp         004B8AB0
 004B8AA3    mov         edx,0FF000006
 004B8AA8    mov         eax,dword ptr [edi+48]
 004B8AAB    call        TBrush.SetColor
 004B8AB0    lea         edx,[ebp-38]
 004B8AB3    mov         eax,edi
 004B8AB5    mov         ecx,dword ptr [eax]
 004B8AB7    call        dword ptr [ecx+5C]
 004B8ABA    lea         edx,[ebp-80]
 004B8ABD    mov         eax,ebx
 004B8ABF    call        TControl.GetText
 004B8AC4    cmp         dword ptr [ebp-80],0
>004B8AC8    je          004B8BFD
 004B8ACE    mov         eax,ebx
 004B8AD0    mov         si,0FFC7
 004B8AD4    call        @CallDynaInst
 004B8AD9    test        al,al
>004B8ADB    jne         004B8AF5
 004B8ADD    mov         eax,dword ptr [ebp-10]
 004B8AE0    push        eax
 004B8AE1    lea         eax,[ebp-38]
 004B8AE4    push        eax
 004B8AE5    xor         ecx,ecx
 004B8AE7    xor         edx,edx
 004B8AE9    mov         eax,8
 004B8AEE    call        Rect
>004B8AF3    jmp         004B8B40
 004B8AF5    mov         eax,dword ptr [ebp-10]
 004B8AF8    push        eax
 004B8AF9    lea         eax,[ebp-90]
 004B8AFF    push        eax
 004B8B00    lea         edx,[ebp-94]
 004B8B06    mov         eax,ebx
 004B8B08    call        TControl.GetText
 004B8B0D    mov         edx,dword ptr [ebp-94]
 004B8B13    mov         eax,dword ptr [ebx+270]
 004B8B19    call        TCustomCanvas.TextWidth
 004B8B1E    push        eax
 004B8B1F    mov         eax,dword ptr [ebp-30]
 004B8B22    pop         edx
 004B8B23    sub         eax,edx
 004B8B25    sub         eax,8
 004B8B28    xor         ecx,ecx
 004B8B2A    xor         edx,edx
 004B8B2C    call        Rect
 004B8B31    push        edi
 004B8B32    lea         esi,[ebp-90]
 004B8B38    lea         edi,[ebp-38]
 004B8B3B    movs        dword ptr [edi],dword ptr [esi]
 004B8B3C    movs        dword ptr [edi],dword ptr [esi]
 004B8B3D    movs        dword ptr [edi],dword ptr [esi]
 004B8B3E    movs        dword ptr [edi],dword ptr [esi]
 004B8B3F    pop         edi
 004B8B40    mov         edx,20
 004B8B45    mov         eax,ebx
 004B8B47    call        TControl.DrawTextBiDiModeFlags
 004B8B4C    mov         dword ptr [ebp-14],eax
 004B8B4F    mov         eax,edi
 004B8B51    call        TCanvas.GetHandle
 004B8B56    mov         dword ptr [ebp-28],eax
 004B8B59    lea         edx,[ebp-8]
 004B8B5C    mov         eax,ebx
 004B8B5E    call        TControl.GetText
 004B8B63    lea         edx,[ebp-98]
 004B8B69    mov         eax,ebx
 004B8B6B    call        TControl.GetText
 004B8B70    mov         eax,dword ptr [ebp-98]
 004B8B76    mov         dword ptr [ebp-70],eax
 004B8B79    mov         esi,dword ptr [ebp-70]
 004B8B7C    test        esi,esi
>004B8B7E    je          004B8B85
 004B8B80    sub         esi,4
 004B8B83    mov         esi,dword ptr [esi]
 004B8B85    mov         eax,dword ptr [ebp-14]
 004B8B88    or          eax,400
 004B8B8D    push        eax
 004B8B8E    lea         eax,[ebp-38]
 004B8B91    push        eax
 004B8B92    push        esi
 004B8B93    mov         eax,dword ptr [ebp-8]
 004B8B96    call        @UStrToPWChar
 004B8B9B    push        eax
 004B8B9C    mov         eax,dword ptr [ebp-28]
 004B8B9F    push        eax
 004B8BA0    call        user32.DrawTextW
 004B8BA5    mov         edx,dword ptr [ebx+6C]
 004B8BA8    mov         eax,dword ptr [edi+48]
 004B8BAB    call        TBrush.SetColor
 004B8BB0    mov         eax,edi
 004B8BB2    call        TCanvas.GetHandle
 004B8BB7    mov         esi,eax
 004B8BB9    lea         edx,[ebp-0C]
 004B8BBC    mov         eax,ebx
 004B8BBE    call        TControl.GetText
 004B8BC3    lea         edx,[ebp-9C]
 004B8BC9    mov         eax,ebx
 004B8BCB    call        TControl.GetText
 004B8BD0    mov         eax,dword ptr [ebp-9C]
 004B8BD6    mov         dword ptr [ebp-70],eax
 004B8BD9    mov         ebx,dword ptr [ebp-70]
 004B8BDC    test        ebx,ebx
>004B8BDE    je          004B8BE5
 004B8BE0    sub         ebx,4
 004B8BE3    mov         ebx,dword ptr [ebx]
 004B8BE5    mov         eax,dword ptr [ebp-14]
 004B8BE8    push        eax
 004B8BE9    lea         eax,[ebp-38]
 004B8BEC    push        eax
 004B8BED    push        ebx
 004B8BEE    mov         eax,dword ptr [ebp-0C]
 004B8BF1    call        @UStrToPWChar
 004B8BF6    push        eax
 004B8BF7    push        esi
 004B8BF8    call        user32.DrawTextW
 004B8BFD    xor         eax,eax
 004B8BFF    pop         edx
 004B8C00    pop         ecx
 004B8C01    pop         ecx
 004B8C02    mov         dword ptr fs:[eax],edx
 004B8C05    push        4B8C59
 004B8C0A    lea         eax,[ebp-9C]
 004B8C10    mov         edx,3
 004B8C15    call        @UStrArrayClr
 004B8C1A    lea         eax,[ebp-80]
 004B8C1D    mov         edx,2
 004B8C22    call        @UStrArrayClr
 004B8C27    lea         eax,[ebp-78]
 004B8C2A    call        @WStrClr
 004B8C2F    lea         eax,[ebp-74]
 004B8C32    call        @UStrClr
 004B8C37    lea         eax,[ebp-6C]
 004B8C3A    mov         edx,2
 004B8C3F    call        @UStrArrayClr
 004B8C44    lea         eax,[ebp-0C]
 004B8C47    mov         edx,3
 004B8C4C    call        @UStrArrayClr
 004B8C51    ret
>004B8C52    jmp         @HandleFinally
>004B8C57    jmp         004B8C0A
 004B8C59    pop         edi
 004B8C5A    pop         esi
 004B8C5B    pop         ebx
 004B8C5C    mov         esp,ebp
 004B8C5E    pop         ebp
 004B8C5F    ret
*}
end;

//004B8C70
procedure TCustomGroupBox.CMDialogChar(var Message:TCMDialogChar);
begin
{*
 004B8C70    push        ebp
 004B8C71    mov         ebp,esp
 004B8C73    push        0
 004B8C75    push        ebx
 004B8C76    push        esi
 004B8C77    push        edi
 004B8C78    mov         edi,edx
 004B8C7A    mov         ebx,eax
 004B8C7C    xor         eax,eax
 004B8C7E    push        ebp
 004B8C7F    push        4B8CE2
 004B8C84    push        dword ptr fs:[eax]
 004B8C87    mov         dword ptr fs:[eax],esp
 004B8C8A    lea         edx,[ebp-4]
 004B8C8D    mov         eax,ebx
 004B8C8F    call        TControl.GetText
 004B8C94    mov         edx,dword ptr [ebp-4]
 004B8C97    movzx       eax,word ptr [edi+4]
 004B8C9B    call        IsAccel
 004B8CA0    test        al,al
>004B8CA2    je          004B8CC3
 004B8CA4    mov         eax,ebx
 004B8CA6    mov         si,0FFB6
 004B8CAA    call        @CallDynaInst
 004B8CAF    test        al,al
>004B8CB1    je          004B8CC3
 004B8CB3    mov         eax,ebx
 004B8CB5    call        TWinControl.SelectFirst
 004B8CBA    mov         dword ptr [edi+0C],1
>004B8CC1    jmp         004B8CCC
 004B8CC3    mov         edx,edi
 004B8CC5    mov         eax,ebx
 004B8CC7    call        TWinControl.CMDialogChar
 004B8CCC    xor         eax,eax
 004B8CCE    pop         edx
 004B8CCF    pop         ecx
 004B8CD0    pop         ecx
 004B8CD1    mov         dword ptr fs:[eax],edx
 004B8CD4    push        4B8CE9
 004B8CD9    lea         eax,[ebp-4]
 004B8CDC    call        @UStrClr
 004B8CE1    ret
>004B8CE2    jmp         @HandleFinally
>004B8CE7    jmp         004B8CD9
 004B8CE9    pop         edi
 004B8CEA    pop         esi
 004B8CEB    pop         ebx
 004B8CEC    pop         ecx
 004B8CED    pop         ebp
 004B8CEE    ret
*}
end;

//004B8CF0
procedure TCustomGroupBox.CMTextChanged(var Message:TMessage);
begin
{*
 004B8CF0    push        ebx
 004B8CF1    mov         ebx,eax
 004B8CF3    mov         eax,ebx
 004B8CF5    mov         edx,dword ptr [eax]
 004B8CF7    call        dword ptr [edx+90]
 004B8CFD    mov         eax,ebx
 004B8CFF    call        TWinControl.Realign
 004B8D04    pop         ebx
 004B8D05    ret
*}
end;

//004B8D08
procedure TCustomGroupBox.CMCtl3DChanged(var Message:TMessage);
begin
{*
 004B8D08    push        ebx
 004B8D09    mov         ebx,eax
 004B8D0B    mov         eax,ebx
 004B8D0D    call        TWinControl.CMCtl3DChanged
 004B8D12    mov         eax,ebx
 004B8D14    mov         edx,dword ptr [eax]
 004B8D16    call        dword ptr [edx+90]
 004B8D1C    mov         eax,ebx
 004B8D1E    call        TWinControl.Realign
 004B8D23    pop         ebx
 004B8D24    ret
*}
end;

//004B8D28
procedure TCustomCheckBox.WMSize(var Message:TWMSize);
begin
{*
 004B8D28    push        esi
 004B8D29    mov         esi,eax
 004B8D2B    mov         eax,esi
 004B8D2D    call        TWinControl.WMSize
 004B8D32    mov         eax,esi
 004B8D34    mov         edx,dword ptr [eax]
 004B8D36    call        dword ptr [edx+90]
 004B8D3C    pop         esi
 004B8D3D    ret
*}
end;

//004B8D40
constructor TCustomLabel.Create;
begin
{*
 004B8D40    push        ebx
 004B8D41    push        esi
 004B8D42    test        dl,dl
>004B8D44    je          004B8D4E
 004B8D46    add         esp,0FFFFFFF0
 004B8D49    call        @ClassCreate
 004B8D4E    mov         ebx,edx
 004B8D50    mov         esi,eax
 004B8D52    xor         edx,edx
 004B8D54    mov         eax,esi
 004B8D56    call        TGraphicControl.Create
 004B8D5B    mov         eax,dword ptr [esi+50]
 004B8D5E    or          eax,dword ptr ds:[4B8DD8]
 004B8D64    mov         dword ptr [esi+50],eax
 004B8D67    mov         edx,41
 004B8D6C    mov         eax,esi
 004B8D6E    call        TControl.SetWidth
 004B8D73    mov         edx,11
 004B8D78    mov         eax,esi
 004B8D7A    call        TControl.SetHeight
 004B8D7F    mov         byte ptr [esi+1B5],1
 004B8D86    mov         byte ptr [esi+1C6],1
 004B8D8D    call        ThemeServices
 004B8D92    call        TThemeServices.GetThemesEnabled
 004B8D97    test        al,al
>004B8D99    je          004B8DAA
 004B8D9B    mov         eax,[004B8DDC]
 004B8DA0    not         eax
 004B8DA2    and         eax,dword ptr [esi+50]
 004B8DA5    mov         dword ptr [esi+50],eax
>004B8DA8    jmp         004B8DB6
 004B8DAA    mov         eax,dword ptr [esi+50]
 004B8DAD    or          eax,dword ptr ds:[4B8DDC]
 004B8DB3    mov         dword ptr [esi+50],eax
 004B8DB6    mov         eax,esi
 004B8DB8    call        TCustomLabel.UpdateDrawTextProc
 004B8DBD    mov         eax,esi
 004B8DBF    test        bl,bl
>004B8DC1    je          004B8DD2
 004B8DC3    call        @AfterConstruction
 004B8DC8    pop         dword ptr fs:[0]
 004B8DCF    add         esp,0C
 004B8DD2    mov         eax,esi
 004B8DD4    pop         esi
 004B8DD5    pop         ebx
 004B8DD6    ret
*}
end;

//004B8DE0
function TCustomLabel.GetLabelText:UnicodeString;
begin
{*
 004B8DE0    push        ebx
 004B8DE1    push        esi
 004B8DE2    mov         esi,edx
 004B8DE4    mov         ebx,eax
 004B8DE6    mov         edx,esi
 004B8DE8    mov         eax,ebx
 004B8DEA    call        TControl.GetText
 004B8DEF    pop         esi
 004B8DF0    pop         ebx
 004B8DF1    ret
*}
end;

//004B8DF4
procedure TCustomLabel.DoDrawThemeTextEx(DC:HDC; const Text:UnicodeString; var TextRect:TRect; TextFlags:Cardinal);
begin
{*
 004B8DF4    push        ebp
 004B8DF5    mov         ebp,esp
 004B8DF7    add         esp,0FFFFFFB0
 004B8DFA    push        ebx
 004B8DFB    push        esi
 004B8DFC    push        edi
 004B8DFD    mov         edi,ecx
 004B8DFF    mov         dword ptr [ebp-4],edx
 004B8E02    mov         ebx,eax
 004B8E04    lea         eax,[ebp-44]
 004B8E07    xor         ecx,ecx
 004B8E09    mov         edx,40
 004B8E0E    call        @FillChar
 004B8E13    mov         dword ptr [ebp-44],40
 004B8E1A    mov         dword ptr [ebp-40],801
 004B8E21    test        byte ptr [ebx+55],80
>004B8E25    je          004B8E2E
 004B8E27    or          dword ptr [ebp-40],2000
 004B8E2E    mov         eax,dword ptr [ebp+8]
 004B8E31    and         eax,400
 004B8E36    cmp         eax,400
>004B8E3B    jne         004B8E44
 004B8E3D    or          dword ptr [ebp-40],200
 004B8E44    mov         eax,dword ptr [ebx+1A8]
 004B8E4A    mov         eax,dword ptr [eax+40]
 004B8E4D    mov         eax,dword ptr [eax+18]
 004B8E50    call        ColorToRGB
 004B8E55    mov         dword ptr [ebp-3C],eax
 004B8E58    test        byte ptr [ebx+55],80
>004B8E5C    je          004B8E67
 004B8E5E    mov         eax,dword ptr [ebx+1C0]
 004B8E64    mov         dword ptr [ebp-10],eax
 004B8E67    call        ThemeServices
 004B8E6C    lea         ecx,[ebp-50]
 004B8E6F    mov         dl,2
 004B8E71    call        TThemeServices.GetElementDetails
 004B8E76    call        ThemeServices
 004B8E7B    mov         dl,3
 004B8E7D    call        TThemeServices.GetTheme
 004B8E82    mov         esi,eax
 004B8E84    mov         ebx,edi
 004B8E86    test        ebx,ebx
>004B8E88    je          004B8E8F
 004B8E8A    sub         ebx,4
 004B8E8D    mov         ebx,dword ptr [ebx]
 004B8E8F    lea         eax,[ebp-44]
 004B8E92    push        eax
 004B8E93    mov         eax,dword ptr [ebp+0C]
 004B8E96    push        eax
 004B8E97    mov         eax,dword ptr [ebp+8]
 004B8E9A    push        eax
 004B8E9B    push        ebx
 004B8E9C    mov         eax,edi
 004B8E9E    call        @UStrToPWChar
 004B8EA3    push        eax
 004B8EA4    mov         eax,dword ptr [ebp-48]
 004B8EA7    push        eax
 004B8EA8    mov         eax,dword ptr [ebp-4C]
 004B8EAB    push        eax
 004B8EAC    mov         eax,dword ptr [ebp-4]
 004B8EAF    push        eax
 004B8EB0    push        esi
 004B8EB1    call        DrawThemeTextEx
 004B8EB6    pop         edi
 004B8EB7    pop         esi
 004B8EB8    pop         ebx
 004B8EB9    mov         esp,ebp
 004B8EBB    pop         ebp
 004B8EBC    ret         8
*}
end;

//004B8EC0
procedure TCustomLabel.DoDrawNormalText(DC:HDC; const Text:UnicodeString; var TextRect:TRect; TextFlags:Cardinal);
begin
{*
 004B8EC0    push        ebp
 004B8EC1    mov         ebp,esp
 004B8EC3    push        ebx
 004B8EC4    push        esi
 004B8EC5    push        edi
 004B8EC6    mov         esi,ecx
 004B8EC8    mov         edi,edx
 004B8ECA    mov         ebx,esi
 004B8ECC    test        ebx,ebx
>004B8ECE    je          004B8ED5
 004B8ED0    sub         ebx,4
 004B8ED3    mov         ebx,dword ptr [ebx]
 004B8ED5    mov         eax,dword ptr [ebp+8]
 004B8ED8    push        eax
 004B8ED9    mov         eax,dword ptr [ebp+0C]
 004B8EDC    push        eax
 004B8EDD    push        ebx
 004B8EDE    mov         eax,esi
 004B8EE0    call        @UStrToPWChar
 004B8EE5    push        eax
 004B8EE6    push        edi
 004B8EE7    call        user32.DrawTextW
 004B8EEC    pop         edi
 004B8EED    pop         esi
 004B8EEE    pop         ebx
 004B8EEF    pop         ebp
 004B8EF0    ret         8
*}
end;

//004B8EF4
procedure TCustomLabel.DoDrawText(var Rect:TRect; Flags:LongInt);
begin
{*
 004B8EF4    push        ebp
 004B8EF5    mov         ebp,esp
 004B8EF7    add         esp,0FFFFFFE4
 004B8EFA    push        ebx
 004B8EFB    push        esi
 004B8EFC    push        edi
 004B8EFD    xor         ebx,ebx
 004B8EFF    mov         dword ptr [ebp-4],ebx
 004B8F02    mov         dword ptr [ebp-8],ebx
 004B8F05    mov         esi,ecx
 004B8F07    mov         dword ptr [ebp-0C],edx
 004B8F0A    mov         ebx,eax
 004B8F0C    xor         eax,eax
 004B8F0E    push        ebp
 004B8F0F    push        4B91AB
 004B8F14    push        dword ptr fs:[eax]
 004B8F17    mov         dword ptr fs:[eax],esp
 004B8F1A    lea         edx,[ebp-4]
 004B8F1D    mov         eax,ebx
 004B8F1F    mov         ecx,dword ptr [eax]
 004B8F21    call        dword ptr [ecx+0A4]
 004B8F27    test        esi,400
>004B8F2D    je          004B8F70
 004B8F2F    cmp         dword ptr [ebp-4],0
>004B8F33    jne         004B8F39
 004B8F35    mov         al,1
>004B8F37    jmp         004B8F5F
 004B8F39    cmp         byte ptr [ebx+1C6],0
>004B8F40    je          004B8F5D
 004B8F42    mov         eax,dword ptr [ebp-4]
 004B8F45    cmp         word ptr [eax],26
>004B8F49    jne         004B8F5D
 004B8F4B    mov         eax,dword ptr [ebp-4]
 004B8F4E    test        eax,eax
>004B8F50    je          004B8F57
 004B8F52    sub         eax,4
 004B8F55    mov         eax,dword ptr [eax]
 004B8F57    dec         eax
 004B8F58    sete        al
>004B8F5B    jmp         004B8F5F
 004B8F5D    xor         eax,eax
 004B8F5F    test        al,al
>004B8F61    je          004B8F70
 004B8F63    lea         eax,[ebp-4]
 004B8F66    mov         edx,4B91C8;' '
 004B8F6B    call        @UStrCat
 004B8F70    cmp         dword ptr [ebp-4],0
>004B8F74    je          004B9190
 004B8F7A    cmp         byte ptr [ebx+1C6],0
>004B8F81    jne         004B8F89
 004B8F83    or          esi,800
 004B8F89    mov         edx,esi
 004B8F8B    mov         eax,ebx
 004B8F8D    call        TControl.DrawTextBiDiModeFlags
 004B8F92    mov         esi,eax
 004B8F94    mov         edx,dword ptr [ebx+64]
 004B8F97    mov         eax,dword ptr [ebx+1A8]
 004B8F9D    call        TCanvas.SetFont
 004B8FA2    cmp         byte ptr [ebx+1C8],0
>004B8FA9    je          004B90DC
 004B8FAF    cmp         byte ptr [ebx+1B5],0
>004B8FB6    jne         004B90DC
 004B8FBC    lea         eax,[ebp-8]
 004B8FBF    mov         edx,dword ptr [ebp-4]
 004B8FC2    call        @UStrLAsg
 004B8FC7    and         esi,0FFFFFFBF
 004B8FCA    movzx       eax,byte ptr [ebx+1C8]
 004B8FD1    or          esi,dword ptr [eax*4+785D7C]
 004B8FD8    cmp         byte ptr [ebx+1C5],0
>004B8FDF    je          004B90CB
 004B8FE5    movzx       eax,byte ptr [ebx+1C8]
 004B8FEC    add         al,0FE
 004B8FEE    sub         al,2
>004B8FF0    jae         004B90CB
 004B8FF6    mov         eax,dword ptr [ebp-0C]
 004B8FF9    push        esi
 004B8FFA    mov         esi,eax
 004B8FFC    lea         edi,[ebp-1C]
 004B8FFF    movs        dword ptr [edi],dword ptr [esi]
 004B9000    movs        dword ptr [edi],dword ptr [esi]
 004B9001    movs        dword ptr [edi],dword ptr [esi]
 004B9002    movs        dword ptr [edi],dword ptr [esi]
 004B9003    pop         esi
 004B9004    mov         edx,4B91D8;'...'
 004B9009    mov         eax,dword ptr [ebx+1A8]
 004B900F    call        TCustomCanvas.TextWidth
 004B9014    sub         dword ptr [ebp-14],eax
 004B9017    lea         eax,[ebp-1C]
 004B901A    push        eax
 004B901B    mov         eax,esi
 004B901D    or          eax,400
 004B9022    push        eax
 004B9023    mov         eax,dword ptr [ebx+1A8]
 004B9029    call        TCanvas.GetHandle
 004B902E    mov         edx,eax
 004B9030    mov         ecx,dword ptr [ebp-8]
 004B9033    mov         eax,dword ptr [ebx+1BC]
 004B9039    call        dword ptr [ebx+1B8]
 004B903F    mov         edi,dword ptr [ebp-10]
 004B9042    sub         edi,dword ptr [ebp-18]
 004B9045    mov         eax,ebx
 004B9047    call        TControl.GetClientHeight
 004B904C    cmp         edi,eax
>004B904E    jle         004B9064
 004B9050    mov         eax,dword ptr [ebx+1A8]
 004B9056    mov         eax,dword ptr [eax+40]
 004B9059    mov         eax,dword ptr [eax+10]
 004B905C    cmp         edi,dword ptr [eax+18]
 004B905F    setg        al
>004B9062    jmp         004B9066
 004B9064    xor         eax,eax
 004B9066    test        al,al
>004B9068    je          004B90CB
 004B906A    mov         edx,dword ptr [ebp-4]
 004B906D    mov         eax,4B91EC;' 	'
 004B9072    call        LastDelimiter
 004B9077    mov         edi,eax
 004B9079    test        edi,edi
>004B907B    jne         004B908B
 004B907D    mov         eax,dword ptr [ebp-4]
 004B9080    test        eax,eax
>004B9082    je          004B9089
 004B9084    sub         eax,4
 004B9087    mov         eax,dword ptr [eax]
 004B9089    mov         edi,eax
 004B908B    dec         edi
 004B908C    mov         edx,edi
 004B908E    mov         eax,dword ptr [ebp-4]
 004B9091    call        ByteType
 004B9096    cmp         al,1
>004B9098    jne         004B909B
 004B909A    dec         edi
 004B909B    lea         eax,[ebp-4]
 004B909E    push        eax
 004B909F    mov         ecx,edi
 004B90A1    mov         edx,1
 004B90A6    mov         eax,dword ptr [ebp-4]
 004B90A9    call        @UStrCopy
 004B90AE    lea         eax,[ebp-8]
 004B90B1    push        eax
 004B90B2    mov         ecx,4B91D8;'...'
 004B90B7    mov         edx,dword ptr [ebp-4]
 004B90BA    pop         eax
 004B90BB    call        @UStrCat3
 004B90C0    cmp         dword ptr [ebp-4],0
>004B90C4    je          004B90CB
>004B90C6    jmp         004B8FF6
 004B90CB    cmp         dword ptr [ebp-4],0
>004B90CF    je          004B90DC
 004B90D1    lea         eax,[ebp-4]
 004B90D4    mov         edx,dword ptr [ebp-8]
 004B90D7    call        @UStrLAsg
 004B90DC    mov         eax,ebx
 004B90DE    mov         edx,dword ptr [eax]
 004B90E0    call        dword ptr [edx+5C]
 004B90E3    test        al,al
>004B90E5    jne         004B916F
 004B90EB    push        1
 004B90ED    push        1
 004B90EF    mov         eax,dword ptr [ebp-0C]
 004B90F2    push        eax
 004B90F3    call        user32.OffsetRect
 004B90F8    mov         eax,dword ptr [ebx+1A8]
 004B90FE    mov         eax,dword ptr [eax+40]
 004B9101    mov         edx,0FF000014
 004B9106    call        TFont.SetColor
 004B910B    mov         eax,dword ptr [ebp-0C]
 004B910E    push        eax
 004B910F    push        esi
 004B9110    mov         eax,dword ptr [ebx+1A8]
 004B9116    call        TCanvas.GetHandle
 004B911B    mov         edx,eax
 004B911D    mov         ecx,dword ptr [ebp-4]
 004B9120    mov         eax,dword ptr [ebx+1BC]
 004B9126    call        dword ptr [ebx+1B8]
 004B912C    push        0FF
 004B912E    push        0FF
 004B9130    mov         eax,dword ptr [ebp-0C]
 004B9133    push        eax
 004B9134    call        user32.OffsetRect
 004B9139    mov         eax,dword ptr [ebx+1A8]
 004B913F    mov         eax,dword ptr [eax+40]
 004B9142    mov         edx,0FF000010
 004B9147    call        TFont.SetColor
 004B914C    mov         eax,dword ptr [ebp-0C]
 004B914F    push        eax
 004B9150    push        esi
 004B9151    mov         eax,dword ptr [ebx+1A8]
 004B9157    call        TCanvas.GetHandle
 004B915C    mov         edx,eax
 004B915E    mov         ecx,dword ptr [ebp-4]
 004B9161    mov         eax,dword ptr [ebx+1BC]
 004B9167    call        dword ptr [ebx+1B8]
>004B916D    jmp         004B9190
 004B916F    mov         eax,dword ptr [ebp-0C]
 004B9172    push        eax
 004B9173    push        esi
 004B9174    mov         eax,dword ptr [ebx+1A8]
 004B917A    call        TCanvas.GetHandle
 004B917F    mov         edx,eax
 004B9181    mov         ecx,dword ptr [ebp-4]
 004B9184    mov         eax,dword ptr [ebx+1BC]
 004B918A    call        dword ptr [ebx+1B8]
 004B9190    xor         eax,eax
 004B9192    pop         edx
 004B9193    pop         ecx
 004B9194    pop         ecx
 004B9195    mov         dword ptr fs:[eax],edx
 004B9198    push        4B91B2
 004B919D    lea         eax,[ebp-8]
 004B91A0    mov         edx,2
 004B91A5    call        @UStrArrayClr
 004B91AA    ret
>004B91AB    jmp         @HandleFinally
>004B91B0    jmp         004B919D
 004B91B2    pop         edi
 004B91B3    pop         esi
 004B91B4    pop         ebx
 004B91B5    mov         esp,ebp
 004B91B7    pop         ebp
 004B91B8    ret
*}
end;

//004B91F4
procedure FillGlassRect(Canvas:TCanvas; Rect:TRect);
begin
{*
 004B91F4    push        ebp
 004B91F5    mov         ebp,esp
 004B91F7    add         esp,0FFFFFFE8
 004B91FA    push        ebx
 004B91FB    push        esi
 004B91FC    push        edi
 004B91FD    mov         esi,edx
 004B91FF    lea         edi,[ebp-18]
 004B9202    movs        dword ptr [edi],dword ptr [esi]
 004B9203    movs        dword ptr [edi],dword ptr [esi]
 004B9204    movs        dword ptr [edi],dword ptr [esi]
 004B9205    movs        dword ptr [edi],dword ptr [esi]
 004B9206    mov         ebx,eax
 004B9208    lea         eax,[ebp-4]
 004B920B    push        eax
 004B920C    push        0
 004B920E    push        2
 004B9210    lea         eax,[ebp-18]
 004B9213    push        eax
 004B9214    mov         eax,ebx
 004B9216    call        TCanvas.GetHandle
 004B921B    push        eax
 004B921C    call        BeginBufferedPaint
 004B9221    mov         dword ptr [ebp-8],eax
 004B9224    xor         eax,eax
 004B9226    push        ebp
 004B9227    push        4B9273
 004B922C    push        dword ptr fs:[eax]
 004B922F    mov         dword ptr fs:[eax],esp
 004B9232    mov         eax,dword ptr [ebx+48]
 004B9235    call        TBrush.GetHandle
 004B923A    push        eax
 004B923B    lea         eax,[ebp-18]
 004B923E    push        eax
 004B923F    mov         eax,dword ptr [ebp-4]
 004B9242    push        eax
 004B9243    call        user32.FillRect
 004B9248    push        0FF
 004B924D    lea         eax,[ebp-18]
 004B9250    push        eax
 004B9251    mov         eax,dword ptr [ebp-8]
 004B9254    push        eax
 004B9255    call        BufferedPaintSetAlpha
 004B925A    xor         eax,eax
 004B925C    pop         edx
 004B925D    pop         ecx
 004B925E    pop         ecx
 004B925F    mov         dword ptr fs:[eax],edx
 004B9262    push        4B927A
 004B9267    push        0FF
 004B9269    mov         eax,dword ptr [ebp-8]
 004B926C    push        eax
 004B926D    call        EndBufferedPaint
 004B9272    ret
>004B9273    jmp         @HandleFinally
>004B9278    jmp         004B9267
 004B927A    pop         edi
 004B927B    pop         esi
 004B927C    pop         ebx
 004B927D    mov         esp,ebp
 004B927F    pop         ebp
 004B9280    ret
*}
end;

//004B9284
procedure TCustomLabel.Paint;
begin
{*
 004B9284    push        ebx
 004B9285    push        esi
 004B9286    push        edi
 004B9287    add         esp,0FFFFFFE0
 004B928A    mov         ebx,eax
 004B928C    mov         esi,dword ptr [ebx+1A8]
 004B9292    mov         edx,esp
 004B9294    mov         eax,ebx
 004B9296    mov         ecx,dword ptr [eax]
 004B9298    call        dword ptr [ecx+54]
 004B929B    mov         eax,ebx
 004B929D    call        TCustomLabel.GetTransparent
 004B92A2    test        al,al
>004B92A4    jne         004B92D9
 004B92A6    mov         edx,dword ptr [ebx+6C]
 004B92A9    mov         eax,dword ptr [esi+48]
 004B92AC    call        TBrush.SetColor
 004B92B1    xor         edx,edx
 004B92B3    mov         eax,dword ptr [esi+48]
 004B92B6    call        TBrush.SetStyle
 004B92BB    test        byte ptr [ebx+55],80
>004B92BF    jne         004B92CC
 004B92C1    mov         edx,esp
 004B92C3    mov         eax,esi
 004B92C5    mov         ecx,dword ptr [eax]
 004B92C7    call        dword ptr [ecx+54]
>004B92CA    jmp         004B92D9
 004B92CC    mov         edx,esp
 004B92CE    mov         eax,dword ptr [ebx+1A8]
 004B92D4    call        FillGlassRect
 004B92D9    mov         dl,1
 004B92DB    mov         eax,dword ptr [esi+48]
 004B92DE    call        TBrush.SetStyle
 004B92E3    movzx       eax,byte ptr [ebx+1C5]
 004B92EA    movzx       edi,word ptr [eax*2+785D92]
 004B92F2    or          di,40
 004B92F6    movzx       eax,byte ptr [ebx+1B4]
 004B92FD    or          di,word ptr [eax*2+785D8C]
 004B9305    movzx       edi,di
 004B9308    cmp         byte ptr [ebx+1C4],0
>004B930F    je          004B9370
 004B9311    push        edi
 004B9312    lea         esi,[esp+4]
 004B9316    lea         edi,[esp+14]
 004B931A    movs        dword ptr [edi],dword ptr [esi]
 004B931B    movs        dword ptr [edi],dword ptr [esi]
 004B931C    movs        dword ptr [edi],dword ptr [esi]
 004B931D    movs        dword ptr [edi],dword ptr [esi]
 004B931E    pop         edi
 004B931F    mov         ecx,edi
 004B9321    or          ecx,400
 004B9327    lea         edx,[esp+10]
 004B932B    mov         eax,ebx
 004B932D    mov         si,0FFC5
 004B9331    call        @CallDynaInst
 004B9336    cmp         byte ptr [ebx+1C4],2
>004B933D    jne         004B9355
 004B933F    mov         eax,dword ptr [ebx+4C]
 004B9342    sub         eax,dword ptr [esp+1C]
 004B9346    push        eax
 004B9347    push        0
 004B9349    lea         eax,[esp+8]
 004B934D    push        eax
 004B934E    call        user32.OffsetRect
>004B9353    jmp         004B9370
 004B9355    mov         eax,dword ptr [ebx+4C]
 004B9358    sub         eax,dword ptr [esp+1C]
 004B935C    sar         eax,1
>004B935E    jns         004B9363
 004B9360    adc         eax,0
 004B9363    push        eax
 004B9364    push        0
 004B9366    lea         eax,[esp+8]
 004B936A    push        eax
 004B936B    call        user32.OffsetRect
 004B9370    mov         edx,esp
 004B9372    mov         ecx,edi
 004B9374    mov         eax,ebx
 004B9376    mov         si,0FFC5
 004B937A    call        @CallDynaInst
 004B937F    add         esp,20
 004B9382    pop         edi
 004B9383    pop         esi
 004B9384    pop         ebx
 004B9385    ret
*}
end;

//004B9388
procedure TCustomLabel.Loaded;
begin
{*
 004B9388    push        ebx
 004B9389    push        esi
 004B938A    mov         ebx,eax
 004B938C    mov         eax,ebx
 004B938E    call        TControl.Loaded
 004B9393    mov         eax,ebx
 004B9395    mov         si,0FFC6
 004B9399    call        @CallDynaInst
 004B939E    pop         esi
 004B939F    pop         ebx
 004B93A0    ret
*}
end;

//004B93A4
procedure TCustomLabel.AdjustBounds;
begin
{*
 004B93A4    push        ebp
 004B93A5    mov         ebp,esp
 004B93A7    add         esp,0FFFFFFE4
 004B93AA    push        ebx
 004B93AB    push        esi
 004B93AC    mov         dword ptr [ebp-4],eax
 004B93AF    mov         eax,dword ptr [ebp-4]
 004B93B2    test        byte ptr [eax+1C],2
>004B93B6    jne         004B94B0
 004B93BC    mov         eax,dword ptr [ebp-4]
 004B93BF    cmp         byte ptr [eax+1B5],0
>004B93C6    je          004B94B0
 004B93CC    lea         edx,[ebp-1C]
 004B93CF    mov         eax,dword ptr [ebp-4]
 004B93D2    mov         ecx,dword ptr [eax]
 004B93D4    call        dword ptr [ecx+54]
 004B93D7    push        0
 004B93D9    call        user32.GetDC
 004B93DE    mov         dword ptr [ebp-8],eax
 004B93E1    xor         eax,eax
 004B93E3    push        ebp
 004B93E4    push        4B9452
 004B93E9    push        dword ptr fs:[eax]
 004B93EC    mov         dword ptr fs:[eax],esp
 004B93EF    mov         eax,dword ptr [ebp-4]
 004B93F2    mov         eax,dword ptr [eax+1A8]
 004B93F8    mov         edx,dword ptr [ebp-8]
 004B93FB    call        TCanvas.SetHandle
 004B9400    mov         eax,dword ptr [ebp-4]
 004B9403    movzx       eax,byte ptr [eax+1C5]
 004B940A    movzx       ecx,word ptr [eax*2+785D96]
 004B9412    or          cx,440
 004B9417    movzx       ecx,cx
 004B941A    lea         edx,[ebp-1C]
 004B941D    mov         eax,dword ptr [ebp-4]
 004B9420    mov         si,0FFC5
 004B9424    call        @CallDynaInst
 004B9429    mov         eax,dword ptr [ebp-4]
 004B942C    mov         eax,dword ptr [eax+1A8]
 004B9432    xor         edx,edx
 004B9434    call        TCanvas.SetHandle
 004B9439    xor         eax,eax
 004B943B    pop         edx
 004B943C    pop         ecx
 004B943D    pop         ecx
 004B943E    mov         dword ptr fs:[eax],edx
 004B9441    push        4B9459
 004B9446    mov         eax,dword ptr [ebp-8]
 004B9449    push        eax
 004B944A    push        0
 004B944C    call        user32.ReleaseDC
 004B9451    ret
>004B9452    jmp         @HandleFinally
>004B9457    jmp         004B9446
 004B9459    mov         eax,dword ptr [ebp-4]
 004B945C    mov         ebx,dword ptr [eax+40]
 004B945F    mov         eax,dword ptr [ebp-4]
 004B9462    movzx       eax,byte ptr [eax+1B4]
 004B9469    mov         byte ptr [ebp-9],al
 004B946C    mov         eax,dword ptr [ebp-4]
 004B946F    mov         si,0FFC7
 004B9473    call        @CallDynaInst
 004B9478    test        al,al
>004B947A    je          004B9484
 004B947C    lea         eax,[ebp-9]
 004B947F    call        ChangeBiDiModeAlignment
 004B9484    cmp         byte ptr [ebp-9],1
>004B9488    jne         004B9495
 004B948A    mov         eax,dword ptr [ebp-4]
 004B948D    mov         eax,dword ptr [eax+48]
 004B9490    sub         eax,dword ptr [ebp-14]
 004B9493    add         ebx,eax
 004B9495    mov         eax,dword ptr [ebp-14]
 004B9498    push        eax
 004B9499    mov         eax,dword ptr [ebp-10]
 004B949C    push        eax
 004B949D    mov         eax,dword ptr [ebp-4]
 004B94A0    mov         ecx,dword ptr [eax+44]
 004B94A3    mov         edx,ebx
 004B94A5    mov         eax,dword ptr [ebp-4]
 004B94A8    mov         ebx,dword ptr [eax]
 004B94AA    call        dword ptr [ebx+98]
 004B94B0    pop         esi
 004B94B1    pop         ebx
 004B94B2    mov         esp,ebp
 004B94B4    pop         ebp
 004B94B5    ret
*}
end;

//004B94B8
procedure TCustomLabel.SetAlignment(Value:TAlignment);
begin
{*
 004B94B8    cmp         dl,byte ptr [eax+1B4]
>004B94BE    je          004B94CE
 004B94C0    mov         byte ptr [eax+1B4],dl
 004B94C6    mov         edx,dword ptr [eax]
 004B94C8    call        dword ptr [edx+90]
 004B94CE    ret
*}
end;

//004B94D0
procedure TCustomLabel.SetEllipsisPosition(Value:TEllipsisPosition);
begin
{*
 004B94D0    cmp         dl,byte ptr [eax+1C8]
>004B94D6    je          004B94ED
 004B94D8    mov         byte ptr [eax+1C8],dl
 004B94DE    mov         byte ptr [eax+1B5],0
 004B94E5    mov         edx,dword ptr [eax]
 004B94E7    call        dword ptr [edx+90]
 004B94ED    ret
*}
end;

//004B94F0
procedure TCustomLabel.SetAutoSize(Value:Boolean);
begin
{*
 004B94F0    push        esi
 004B94F1    mov         esi,eax
 004B94F3    cmp         dl,byte ptr [esi+1B5]
>004B94F9    je          004B9513
 004B94FB    mov         byte ptr [esi+1B5],dl
 004B9501    mov         byte ptr [esi+1C8],0
 004B9508    mov         eax,esi
 004B950A    mov         si,0FFC6
 004B950E    call        @CallDynaInst
 004B9513    pop         esi
 004B9514    ret
*}
end;

//004B9518
function TCustomLabel.GetTransparent:Boolean;
begin
{*
 004B9518    test        byte ptr [eax+50],40
 004B951C    setne       al
 004B951F    xor         al,1
 004B9521    ret
*}
end;

//004B9524
procedure TCustomLabel.SetFocusControl(Value:TWinControl);
begin
{*
 004B9524    mov         dword ptr [eax+1B0],edx
 004B952A    test        edx,edx
>004B952C    je          004B9534
 004B952E    xchg        eax,edx
 004B952F    call        TComponent.FreeNotification
 004B9534    ret
*}
end;

//004B9538
procedure TCustomLabel.SetGlowSize(const Value:Integer);
begin
{*
 004B9538    cmp         edx,dword ptr [eax+1C0]
>004B953E    je          004B954E
 004B9540    mov         dword ptr [eax+1C0],edx
 004B9546    mov         edx,dword ptr [eax]
 004B9548    call        dword ptr [edx+90]
 004B954E    ret
*}
end;

//004B9550
procedure TCustomLabel.SetShowAccelChar(Value:Boolean);
begin
{*
 004B9550    cmp         dl,byte ptr [eax+1C6]
>004B9556    je          004B9566
 004B9558    mov         byte ptr [eax+1C6],dl
 004B955E    mov         edx,dword ptr [eax]
 004B9560    call        dword ptr [edx+90]
 004B9566    ret
*}
end;

//004B9568
procedure TCustomLabel.SetTransparent(Value:Boolean);
begin
{*
 004B9568    push        ebx
 004B9569    push        esi
 004B956A    mov         ebx,edx
 004B956C    mov         esi,eax
 004B956E    mov         eax,esi
 004B9570    call        TCustomLabel.GetTransparent
 004B9575    cmp         bl,al
>004B9577    je          004B95A1
 004B9579    test        bl,bl
>004B957B    je          004B958C
 004B957D    mov         eax,[004B95AC]
 004B9582    not         eax
 004B9584    and         eax,dword ptr [esi+50]
 004B9587    mov         dword ptr [esi+50],eax
>004B958A    jmp         004B9597
 004B958C    mov         eax,[004B95AC]
 004B9591    or          eax,dword ptr [esi+50]
 004B9594    mov         dword ptr [esi+50],eax
 004B9597    mov         eax,esi
 004B9599    mov         edx,dword ptr [eax]
 004B959B    call        dword ptr [edx+90]
 004B95A1    mov         byte ptr [esi+1C7],1
 004B95A8    pop         esi
 004B95A9    pop         ebx
 004B95AA    ret
*}
end;

//004B95B0
procedure TCustomLabel.SetLayout(Value:TTextLayout);
begin
{*
 004B95B0    cmp         dl,byte ptr [eax+1C4]
>004B95B6    je          004B95C6
 004B95B8    mov         byte ptr [eax+1C4],dl
 004B95BE    mov         edx,dword ptr [eax]
 004B95C0    call        dword ptr [edx+90]
 004B95C6    ret
*}
end;

//004B95C8
procedure TCustomLabel.SetWordWrap(Value:Boolean);
begin
{*
 004B95C8    push        ebx
 004B95C9    push        esi
 004B95CA    mov         ebx,eax
 004B95CC    cmp         dl,byte ptr [ebx+1C5]
>004B95D2    je          004B95EF
 004B95D4    mov         byte ptr [ebx+1C5],dl
 004B95DA    mov         eax,ebx
 004B95DC    mov         si,0FFC6
 004B95E0    call        @CallDynaInst
 004B95E5    mov         eax,ebx
 004B95E7    mov         edx,dword ptr [eax]
 004B95E9    call        dword ptr [edx+90]
 004B95EF    pop         esi
 004B95F0    pop         ebx
 004B95F1    ret
*}
end;

//004B95F4
procedure TCustomLabel.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 004B95F4    push        ebx
 004B95F5    push        esi
 004B95F6    push        edi
 004B95F7    mov         ebx,ecx
 004B95F9    mov         esi,edx
 004B95FB    mov         edi,eax
 004B95FD    mov         ecx,ebx
 004B95FF    mov         edx,esi
 004B9601    mov         eax,edi
 004B9603    call        TControl.Notification
 004B9608    cmp         bl,1
>004B960B    jne         004B961D
 004B960D    cmp         esi,dword ptr [edi+1B0]
>004B9613    jne         004B961D
 004B9615    xor         eax,eax
 004B9617    mov         dword ptr [edi+1B0],eax
 004B961D    pop         edi
 004B961E    pop         esi
 004B961F    pop         ebx
 004B9620    ret
*}
end;

//004B9624
procedure TCustomLabel.CMTextChanged(var Message:TMessage);
begin
{*
 004B9624    push        ebx
 004B9625    push        esi
 004B9626    mov         ebx,eax
 004B9628    mov         eax,ebx
 004B962A    mov         edx,dword ptr [eax]
 004B962C    call        dword ptr [edx+90]
 004B9632    mov         eax,ebx
 004B9634    mov         si,0FFC6
 004B9638    call        @CallDynaInst
 004B963D    pop         esi
 004B963E    pop         ebx
 004B963F    ret
*}
end;

//004B9640
procedure TCustomLabel.CMThemeChanged(var Message:TMessage);
begin
{*
 004B9640    push        esi
 004B9641    mov         esi,eax
 004B9643    mov         eax,esi
 004B9645    mov         ecx,dword ptr [eax]
 004B9647    call        dword ptr [ecx-10]
 004B964A    mov         eax,esi
 004B964C    call        TCustomLabel.UpdateDrawTextProc
 004B9651    pop         esi
 004B9652    ret
*}
end;

//004B9654
procedure TCustomLabel.CMFontChanged(var Message:TMessage);
begin
{*
 004B9654    push        esi
 004B9655    mov         esi,eax
 004B9657    mov         eax,esi
 004B9659    call        TControl.CMEnabledChanged
 004B965E    mov         eax,esi
 004B9660    mov         si,0FFC6
 004B9664    call        @CallDynaInst;TCustomLabel.AdjustBounds
 004B9669    pop         esi
 004B966A    ret
*}
end;

//004B966C
procedure TCustomLabel.CMDialogChar(var Message:TCMDialogChar);
begin
{*
 004B966C    push        ebp
 004B966D    mov         ebp,esp
 004B966F    push        0
 004B9671    push        ebx
 004B9672    push        esi
 004B9673    push        edi
 004B9674    mov         edi,edx
 004B9676    mov         ebx,eax
 004B9678    xor         eax,eax
 004B967A    push        ebp
 004B967B    push        4B96F9
 004B9680    push        dword ptr fs:[eax]
 004B9683    mov         dword ptr fs:[eax],esp
 004B9686    cmp         dword ptr [ebx+1B0],0
>004B968D    je          004B96E3
 004B968F    mov         eax,ebx
 004B9691    mov         edx,dword ptr [eax]
 004B9693    call        dword ptr [edx+5C]
 004B9696    test        al,al
>004B9698    je          004B96E3
 004B969A    cmp         byte ptr [ebx+1C6],0
>004B96A1    je          004B96E3
 004B96A3    lea         edx,[ebp-4]
 004B96A6    mov         eax,ebx
 004B96A8    call        TControl.GetText
 004B96AD    mov         edx,dword ptr [ebp-4]
 004B96B0    movzx       eax,word ptr [edi+4]
 004B96B4    call        IsAccel
 004B96B9    test        al,al
>004B96BB    je          004B96E3
 004B96BD    mov         ebx,dword ptr [ebx+1B0]
 004B96C3    mov         eax,ebx
 004B96C5    mov         si,0FFB6
 004B96C9    call        @CallDynaInst
 004B96CE    test        al,al
>004B96D0    je          004B96E3
 004B96D2    mov         eax,ebx
 004B96D4    mov         edx,dword ptr [eax]
 004B96D6    call        dword ptr [edx+0E8]
 004B96DC    mov         dword ptr [edi+0C],1
 004B96E3    xor         eax,eax
 004B96E5    pop         edx
 004B96E6    pop         ecx
 004B96E7    pop         ecx
 004B96E8    mov         dword ptr fs:[eax],edx
 004B96EB    push        4B9700
 004B96F0    lea         eax,[ebp-4]
 004B96F3    call        @UStrClr
 004B96F8    ret
>004B96F9    jmp         @HandleFinally
>004B96FE    jmp         004B96F0
 004B9700    pop         edi
 004B9701    pop         esi
 004B9702    pop         ebx
 004B9703    pop         ecx
 004B9704    pop         ebp
 004B9705    ret
*}
end;

//004B9708
procedure TCustomLabel.UpdateDrawTextProc;
begin
{*
 004B9708    push        ebx
 004B9709    mov         ebx,eax
 004B970B    call        ThemeServices
 004B9710    call        TThemeServices.GetThemesEnabled
 004B9715    test        al,al
>004B9717    je          004B9735
 004B9719    mov         eax,[0078D080];^gvar_00784C80
 004B971E    cmp         dword ptr [eax],6
>004B9721    jl          004B9735
 004B9723    mov         dword ptr [ebx+1BC],ebx
 004B9729    mov         dword ptr [ebx+1B8],4B8DF4;TCustomLabel.DoDrawThemeTextEx
 004B9733    pop         ebx
 004B9734    ret
 004B9735    mov         dword ptr [ebx+1BC],ebx
 004B973B    mov         dword ptr [ebx+1B8],4B8EC0;TCustomLabel.DoDrawNormalText
 004B9745    pop         ebx
 004B9746    ret
*}
end;

//004B9748
constructor TCustomEdit.Create;
begin
{*
 004B9748    push        ebx
 004B9749    push        esi
 004B974A    test        dl,dl
>004B974C    je          004B9756
 004B974E    add         esp,0FFFFFFF0
 004B9751    call        @ClassCreate
 004B9756    mov         ebx,edx
 004B9758    mov         esi,eax
 004B975A    xor         edx,edx
 004B975C    mov         eax,esi
 004B975E    call        TWinControl.Create
 004B9763    mov         eax,[0078D264];^NewStyleControls:Boolean
 004B9768    cmp         byte ptr [eax],0
>004B976B    je          004B9777
 004B976D    mov         eax,[004B981C]
 004B9772    mov         dword ptr [esi+50],eax
>004B9775    jmp         004B977F
 004B9777    mov         eax,[004B9820]
 004B977C    mov         dword ptr [esi+50],eax
 004B977F    mov         edx,79
 004B9784    mov         eax,esi
 004B9786    call        TControl.SetWidth
 004B978B    mov         edx,19
 004B9790    mov         eax,esi
 004B9792    call        TControl.SetHeight
 004B9797    mov         dl,1
 004B9799    mov         eax,esi
 004B979B    call        TWinControl.SetTabStop
 004B97A0    xor         edx,edx
 004B97A2    mov         eax,esi
 004B97A4    call        TControl.SetParentColor
 004B97A9    mov         byte ptr [esi+278],1
 004B97B0    mov         byte ptr [esi+270],0
 004B97B7    mov         byte ptr [esi+27D],1
 004B97BE    mov         byte ptr [esi+27E],1
 004B97C5    mov         byte ptr [esi+27F],1
 004B97CC    mov         eax,esi
 004B97CE    call        TCustomEdit.AdjustHeight
 004B97D3    mov         dword ptr [esi+290],0FFFFFFFF
 004B97DD    mov         dword ptr [esi+294],0FFFFFFFF
 004B97E7    mov         byte ptr [esi+298],0
 004B97EE    lea         eax,[esi+29C]
 004B97F4    call        @UStrClr
 004B97F9    mov         byte ptr [esi+284],0
 004B9800    mov         eax,esi
 004B9802    test        bl,bl
>004B9804    je          004B9815
 004B9806    call        @AfterConstruction
 004B980B    pop         dword ptr fs:[0]
 004B9812    add         esp,0C
 004B9815    mov         eax,esi
 004B9817    pop         esi
 004B9818    pop         ebx
 004B9819    ret
*}
end;

//004B9824
procedure TCustomEdit.DoSetMaxLength(Value:Integer);
begin
{*
 004B9824    push        ebx
 004B9825    push        esi
 004B9826    mov         esi,edx
 004B9828    mov         ebx,eax
 004B982A    push        0
 004B982C    push        esi
 004B982D    push        0C5
 004B9832    mov         eax,ebx
 004B9834    call        TWinControl.GetHandle
 004B9839    push        eax
 004B983A    call        user32.SendMessageW
 004B983F    pop         esi
 004B9840    pop         ebx
 004B9841    ret
*}
end;

//004B9844
procedure TCustomEdit.DoSetTextHint(const Value:UnicodeString);
begin
{*
 004B9844    push        ebx
 004B9845    push        esi
 004B9846    mov         esi,edx
 004B9848    mov         ebx,eax
 004B984A    mov         edx,1
 004B984F    mov         eax,5
 004B9854    call        CheckWin32Version
 004B9859    test        al,al
>004B985B    je          004B988A
 004B985D    call        ThemeServices
 004B9862    call        TThemeServices.GetThemesEnabled
 004B9867    test        al,al
>004B9869    je          004B988A
 004B986B    mov         eax,ebx
 004B986D    call        TWinControl.HandleAllocated
 004B9872    test        al,al
>004B9874    je          004B988A
 004B9876    push        esi
 004B9877    mov         eax,ebx
 004B9879    call        TWinControl.GetHandle
 004B987E    xor         ecx,ecx
 004B9880    mov         edx,1501
 004B9885    call        SendTextMessage
 004B988A    pop         esi
 004B988B    pop         ebx
 004B988C    ret
*}
end;

//004B9890
procedure TCustomEdit.SetAlignment(Value:TAlignment);
begin
{*
 004B9890    cmp         dl,byte ptr [eax+270]
>004B9896    je          004B98A3
 004B9898    mov         byte ptr [eax+270],dl
 004B989E    call        TWinControl.RecreateWnd
 004B98A3    ret
*}
end;

//004B98A4
procedure TCustomEdit.SetAutoSize(Value:Boolean);
begin
{*
 004B98A4    cmp         dl,byte ptr [eax+27D]
>004B98AA    je          004B98B7
 004B98AC    mov         byte ptr [eax+27D],dl
 004B98B2    call        TCustomEdit.UpdateHeight
 004B98B7    ret
*}
end;

//004B98B8
procedure TCustomEdit.SetBorderStyle(Value:TBorderStyle);
begin
{*
 004B98B8    push        ebx
 004B98B9    mov         ebx,eax
 004B98BB    cmp         dl,byte ptr [ebx+278]
>004B98C1    je          004B98D7
 004B98C3    mov         byte ptr [ebx+278],dl
 004B98C9    mov         eax,ebx
 004B98CB    call        TCustomEdit.UpdateHeight
 004B98D0    mov         eax,ebx
 004B98D2    call        TWinControl.RecreateWnd
 004B98D7    pop         ebx
 004B98D8    ret
*}
end;

//004B98DC
procedure TCustomEdit.SetCharCase(Value:TEditCharCase);
begin
{*
 004B98DC    cmp         dl,byte ptr [eax+281]
>004B98E2    je          004B98EF
 004B98E4    mov         byte ptr [eax+281],dl
 004B98EA    call        TWinControl.RecreateWnd
 004B98EF    ret
*}
end;

//004B98F0
procedure TCustomEdit.SetTextHint(const Value:UnicodeString);
begin
{*
 004B98F0    push        ebx
 004B98F1    push        esi
 004B98F2    mov         ebx,edx
 004B98F4    mov         esi,eax
 004B98F6    mov         eax,dword ptr [esi+29C]
 004B98FC    mov         edx,ebx
 004B98FE    call        @UStrEqual
>004B9903    je          004B9928
 004B9905    lea         eax,[esi+29C]
 004B990B    mov         edx,ebx
 004B990D    call        @UStrAsg
 004B9912    test        byte ptr [esi+1C],1
>004B9916    jne         004B9928
 004B9918    mov         edx,dword ptr [esi+29C]
 004B991E    mov         eax,esi
 004B9920    mov         ecx,dword ptr [eax]
 004B9922    call        dword ptr [ecx+0F0]
 004B9928    pop         esi
 004B9929    pop         ebx
 004B992A    ret
*}
end;

//004B992C
procedure TCustomEdit.SetHideSelection(Value:Boolean);
begin
{*
 004B992C    cmp         dl,byte ptr [eax+27F]
>004B9932    je          004B993F
 004B9934    mov         byte ptr [eax+27F],dl
 004B993A    call        TWinControl.RecreateWnd
 004B993F    ret
*}
end;

//004B9940
procedure TCustomEdit.SetMaxLength(Value:Integer);
begin
{*
 004B9940    push        ebx
 004B9941    push        esi
 004B9942    mov         esi,edx
 004B9944    mov         ebx,eax
 004B9946    cmp         esi,dword ptr [ebx+274]
>004B994C    je          004B996B
 004B994E    mov         dword ptr [ebx+274],esi
 004B9954    mov         eax,ebx
 004B9956    call        TWinControl.HandleAllocated
 004B995B    test        al,al
>004B995D    je          004B996B
 004B995F    mov         edx,esi
 004B9961    mov         eax,ebx
 004B9963    mov         ecx,dword ptr [eax]
 004B9965    call        dword ptr [ecx+0EC]
 004B996B    pop         esi
 004B996C    pop         ebx
 004B996D    ret
*}
end;

//004B9970
procedure TCustomEdit.SetOEMConvert(Value:Boolean);
begin
{*
 004B9970    cmp         dl,byte ptr [eax+280]
>004B9976    je          004B9983
 004B9978    mov         byte ptr [eax+280],dl
 004B997E    call        TWinControl.RecreateWnd
 004B9983    ret
*}
end;

//004B9984
function TCustomEdit.GetModified:Boolean;
begin
{*
 004B9984    push        ebx
 004B9985    push        esi
 004B9986    mov         esi,eax
 004B9988    movzx       ebx,byte ptr [esi+283]
 004B998F    mov         eax,esi
 004B9991    call        TWinControl.HandleAllocated
 004B9996    test        al,al
>004B9998    je          004B99B5
 004B999A    push        0
 004B999C    push        0
 004B999E    push        0B8
 004B99A3    mov         eax,esi
 004B99A5    call        TWinControl.GetHandle
 004B99AA    push        eax
 004B99AB    call        user32.SendMessageW
 004B99B0    test        eax,eax
 004B99B2    setne       bl
 004B99B5    mov         eax,ebx
 004B99B7    pop         esi
 004B99B8    pop         ebx
 004B99B9    ret
*}
end;

//004B99BC
function TCustomEdit.GetCanUndo:Boolean;
begin
{*
 004B99BC    push        ebx
 004B99BD    push        esi
 004B99BE    mov         esi,eax
 004B99C0    xor         ebx,ebx
 004B99C2    mov         eax,esi
 004B99C4    call        TWinControl.HandleAllocated
 004B99C9    test        al,al
>004B99CB    je          004B99E8
 004B99CD    push        0
 004B99CF    push        0
 004B99D1    push        0C6
 004B99D6    mov         eax,esi
 004B99D8    call        TWinControl.GetHandle
 004B99DD    push        eax
 004B99DE    call        user32.SendMessageW
 004B99E3    test        eax,eax
 004B99E5    setne       bl
 004B99E8    mov         eax,ebx
 004B99EA    pop         esi
 004B99EB    pop         ebx
 004B99EC    ret
*}
end;

//004B99F0
procedure TCustomEdit.SetModified(Value:Boolean);
begin
{*
 004B99F0    push        ebx
 004B99F1    push        esi
 004B99F2    mov         ebx,edx
 004B99F4    mov         esi,eax
 004B99F6    mov         eax,esi
 004B99F8    call        TWinControl.HandleAllocated
 004B99FD    test        al,al
>004B99FF    je          004B9A1C
 004B9A01    push        0
 004B9A03    movzx       eax,bl
 004B9A06    push        eax
 004B9A07    push        0B9
 004B9A0C    mov         eax,esi
 004B9A0E    call        TWinControl.GetHandle
 004B9A13    push        eax
 004B9A14    call        user32.SendMessageW
 004B9A19    pop         esi
 004B9A1A    pop         ebx
 004B9A1B    ret
 004B9A1C    mov         byte ptr [esi+283],bl
 004B9A22    pop         esi
 004B9A23    pop         ebx
 004B9A24    ret
*}
end;

//004B9A28
procedure TCustomEdit.SetNumbersOnly(Value:Boolean);
begin
{*
 004B9A28    push        ebx
 004B9A29    mov         ebx,eax
 004B9A2B    cmp         dl,byte ptr [ebx+298]
>004B9A31    je          004B9A97
 004B9A33    mov         byte ptr [ebx+298],dl
 004B9A39    mov         eax,ebx
 004B9A3B    call        TWinControl.HandleAllocated
 004B9A40    test        al,al
>004B9A42    je          004B9A97
 004B9A44    cmp         byte ptr [ebx+298],0
>004B9A4B    je          004B9A73
 004B9A4D    push        0F0
 004B9A4F    mov         eax,ebx
 004B9A51    call        TWinControl.GetHandle
 004B9A56    push        eax
 004B9A57    call        user32.GetWindowLongW
 004B9A5C    or          eax,2000
 004B9A61    push        eax
 004B9A62    push        0F0
 004B9A64    mov         eax,ebx
 004B9A66    call        TWinControl.GetHandle
 004B9A6B    push        eax
 004B9A6C    call        user32.SetWindowLongW
>004B9A71    jmp         004B9A97
 004B9A73    push        0F0
 004B9A75    mov         eax,ebx
 004B9A77    call        TWinControl.GetHandle
 004B9A7C    push        eax
 004B9A7D    call        user32.GetWindowLongW
 004B9A82    and         eax,0FFFFDFFF
 004B9A87    push        eax
 004B9A88    push        0F0
 004B9A8A    mov         eax,ebx
 004B9A8C    call        TWinControl.GetHandle
 004B9A91    push        eax
 004B9A92    call        user32.SetWindowLongW
 004B9A97    pop         ebx
 004B9A98    ret
*}
end;

//004B9A9C
procedure TCustomEdit.SetPasswordChar(Value:Char);
begin
{*
 004B9A9C    push        ebx
 004B9A9D    mov         ebx,eax
 004B9A9F    cmp         dx,word ptr [ebx+27A]
>004B9AA6    je          004B9AC1
 004B9AA8    mov         word ptr [ebx+27A],dx
 004B9AAF    mov         eax,ebx
 004B9AB1    call        TWinControl.HandleAllocated
 004B9AB6    test        al,al
>004B9AB8    je          004B9AC1
 004B9ABA    mov         eax,ebx
 004B9ABC    call        TWinControl.RecreateWnd
 004B9AC1    pop         ebx
 004B9AC2    ret
*}
end;

//004B9AC4
procedure TCustomEdit.SetReadOnly(Value:Boolean);
begin
{*
 004B9AC4    push        ebx
 004B9AC5    push        esi
 004B9AC6    mov         ebx,edx
 004B9AC8    mov         esi,eax
 004B9ACA    cmp         bl,byte ptr [esi+27C]
>004B9AD0    je          004B9AFB
 004B9AD2    mov         byte ptr [esi+27C],bl
 004B9AD8    mov         eax,esi
 004B9ADA    call        TWinControl.HandleAllocated
 004B9ADF    test        al,al
>004B9AE1    je          004B9AFB
 004B9AE3    push        0
 004B9AE5    movzx       eax,bl
 004B9AE8    push        eax
 004B9AE9    push        0CF
 004B9AEE    mov         eax,esi
 004B9AF0    call        TWinControl.GetHandle
 004B9AF5    push        eax
 004B9AF6    call        user32.SendMessageW
 004B9AFB    pop         esi
 004B9AFC    pop         ebx
 004B9AFD    ret
*}
end;

//004B9B00
function TCustomEdit.GetSelStart:Integer;
begin
{*
 004B9B00    push        ebx
 004B9B01    push        ecx
 004B9B02    mov         ebx,eax
 004B9B04    push        0
 004B9B06    lea         eax,[esp+4]
 004B9B0A    push        eax
 004B9B0B    push        0B0
 004B9B10    mov         eax,ebx
 004B9B12    call        TWinControl.GetHandle
 004B9B17    push        eax
 004B9B18    call        user32.SendMessageW
 004B9B1D    mov         eax,dword ptr [esp]
 004B9B20    pop         edx
 004B9B21    pop         ebx
 004B9B22    ret
*}
end;

//004B9B24
procedure TCustomEdit.SetSelStart(Value:Integer);
begin
{*
 004B9B24    push        ebx
 004B9B25    push        esi
 004B9B26    mov         esi,edx
 004B9B28    mov         ebx,eax
 004B9B2A    push        esi
 004B9B2B    push        esi
 004B9B2C    push        0B1
 004B9B31    mov         eax,ebx
 004B9B33    call        TWinControl.GetHandle
 004B9B38    push        eax
 004B9B39    call        user32.SendMessageW
 004B9B3E    pop         esi
 004B9B3F    pop         ebx
 004B9B40    ret
*}
end;

//004B9B44
function TCustomEdit.GetSelLength:Integer;
begin
{*
 004B9B44    push        ebx
 004B9B45    add         esp,0FFFFFFF8
 004B9B48    mov         ebx,eax
 004B9B4A    lea         eax,[esp+4]
 004B9B4E    push        eax
 004B9B4F    lea         eax,[esp+4]
 004B9B53    push        eax
 004B9B54    push        0B0
 004B9B59    mov         eax,ebx
 004B9B5B    call        TWinControl.GetHandle
 004B9B60    push        eax
 004B9B61    call        user32.SendMessageW
 004B9B66    mov         eax,dword ptr [esp+4]
 004B9B6A    sub         eax,dword ptr [esp]
 004B9B6D    pop         ecx
 004B9B6E    pop         edx
 004B9B6F    pop         ebx
 004B9B70    ret
*}
end;

//004B9B74
procedure TCustomEdit.SetSelLength(Value:Integer);
begin
{*
 004B9B74    push        ebx
 004B9B75    push        esi
 004B9B76    add         esp,0FFFFFFF8
 004B9B79    mov         esi,edx
 004B9B7B    mov         ebx,eax
 004B9B7D    lea         eax,[esp+4]
 004B9B81    push        eax
 004B9B82    lea         eax,[esp+4]
 004B9B86    push        eax
 004B9B87    push        0B0
 004B9B8C    mov         eax,ebx
 004B9B8E    call        TWinControl.GetHandle
 004B9B93    push        eax
 004B9B94    call        user32.SendMessageW
 004B9B99    add         esi,dword ptr [esp]
 004B9B9C    mov         dword ptr [esp+4],esi
 004B9BA0    mov         eax,dword ptr [esp+4]
 004B9BA4    push        eax
 004B9BA5    mov         eax,dword ptr [esp+4]
 004B9BA9    push        eax
 004B9BAA    push        0B1
 004B9BAF    mov         eax,ebx
 004B9BB1    call        TWinControl.GetHandle
 004B9BB6    push        eax
 004B9BB7    call        user32.SendMessageW
 004B9BBC    push        0
 004B9BBE    push        0
 004B9BC0    push        0B7
 004B9BC5    mov         eax,ebx
 004B9BC7    call        TWinControl.GetHandle
 004B9BCC    push        eax
 004B9BCD    call        user32.SendMessageW
 004B9BD2    pop         ecx
 004B9BD3    pop         edx
 004B9BD4    pop         esi
 004B9BD5    pop         ebx
 004B9BD6    ret
*}
end;

//004B9BD8
procedure TCustomEdit.Clear;
begin
{*
 004B9BD8    push        ebx
 004B9BD9    call        TWinControl.GetHandle
 004B9BDE    mov         ebx,eax
 004B9BE0    xor         eax,eax
 004B9BE2    call        @UStrToPWChar
 004B9BE7    push        eax
 004B9BE8    push        ebx
 004B9BE9    call        user32.SetWindowTextW
 004B9BEE    pop         ebx
 004B9BEF    ret
*}
end;

//004B9BF0
procedure TCustomEdit.ClearSelection;
begin
{*
 004B9BF0    push        ebx
 004B9BF1    mov         ebx,eax
 004B9BF3    push        0
 004B9BF5    push        0
 004B9BF7    push        303
 004B9BFC    mov         eax,ebx
 004B9BFE    call        TWinControl.GetHandle
 004B9C03    push        eax
 004B9C04    call        user32.SendMessageW
 004B9C09    pop         ebx
 004B9C0A    ret
*}
end;

//004B9C0C
procedure TCustomEdit.CopyToClipboard;
begin
{*
 004B9C0C    push        ebx
 004B9C0D    mov         ebx,eax
 004B9C0F    push        0
 004B9C11    push        0
 004B9C13    push        301
 004B9C18    mov         eax,ebx
 004B9C1A    call        TWinControl.GetHandle
 004B9C1F    push        eax
 004B9C20    call        user32.SendMessageW
 004B9C25    pop         ebx
 004B9C26    ret
*}
end;

//004B9C28
procedure TCustomEdit.CutToClipboard;
begin
{*
 004B9C28    push        ebx
 004B9C29    mov         ebx,eax
 004B9C2B    push        0
 004B9C2D    push        0
 004B9C2F    push        300
 004B9C34    mov         eax,ebx
 004B9C36    call        TWinControl.GetHandle
 004B9C3B    push        eax
 004B9C3C    call        user32.SendMessageW
 004B9C41    pop         ebx
 004B9C42    ret
*}
end;

//004B9C44
procedure TCustomEdit.PasteFromClipboard;
begin
{*
 004B9C44    push        ebx
 004B9C45    mov         ebx,eax
 004B9C47    push        0
 004B9C49    push        0
 004B9C4B    push        302
 004B9C50    mov         eax,ebx
 004B9C52    call        TWinControl.GetHandle
 004B9C57    push        eax
 004B9C58    call        user32.SendMessageW
 004B9C5D    pop         ebx
 004B9C5E    ret
*}
end;

//004B9C60
procedure TCustomEdit.Undo;
begin
{*
 004B9C60    push        ebx
 004B9C61    mov         ebx,eax
 004B9C63    push        0
 004B9C65    push        0
 004B9C67    push        304
 004B9C6C    mov         eax,ebx
 004B9C6E    call        TWinControl.GetHandle
 004B9C73    push        eax
 004B9C74    call        user32.SendMessageW
 004B9C79    pop         ebx
 004B9C7A    ret
*}
end;

//004B9C7C
procedure TCustomEdit.ClearUndo;
begin
{*
 004B9C7C    push        ebx
 004B9C7D    mov         ebx,eax
 004B9C7F    push        0
 004B9C81    push        0
 004B9C83    push        0CD
 004B9C88    mov         eax,ebx
 004B9C8A    call        TWinControl.GetHandle
 004B9C8F    push        eax
 004B9C90    call        user32.SendMessageW
 004B9C95    pop         ebx
 004B9C96    ret
*}
end;

//004B9C98
procedure TCustomEdit.SelectAll;
begin
{*
 004B9C98    push        ebx
 004B9C99    mov         ebx,eax
 004B9C9B    push        0FF
 004B9C9D    push        0
 004B9C9F    push        0B1
 004B9CA4    mov         eax,ebx
 004B9CA6    call        TWinControl.GetHandle
 004B9CAB    push        eax
 004B9CAC    call        user32.SendMessageW
 004B9CB1    pop         ebx
 004B9CB2    ret
*}
end;

//004B9CB4
function TCustomEdit.GetSelTextBuf(Buffer:PWideChar; BufSize:Integer):Integer;
begin
{*
 004B9CB4    push        ebp
 004B9CB5    mov         ebp,esp
 004B9CB7    add         esp,0FFFFFFF4
 004B9CBA    push        ebx
 004B9CBB    push        esi
 004B9CBC    push        edi
 004B9CBD    mov         edi,ecx
 004B9CBF    mov         dword ptr [ebp-4],edx
 004B9CC2    mov         ebx,eax
 004B9CC4    mov         eax,ebx
 004B9CC6    mov         edx,dword ptr [eax]
 004B9CC8    call        dword ptr [edx+0F8]
 004B9CCE    mov         esi,eax
 004B9CD0    mov         eax,ebx
 004B9CD2    mov         edx,dword ptr [eax]
 004B9CD4    call        dword ptr [edx+0F4]
 004B9CDA    mov         dword ptr [ebp-8],eax
 004B9CDD    mov         eax,ebx
 004B9CDF    call        TControl.GetTextLen
 004B9CE4    inc         eax
 004B9CE5    call        StrAlloc
 004B9CEA    mov         dword ptr [ebp-0C],eax
 004B9CED    xor         eax,eax
 004B9CEF    push        ebp
 004B9CF0    push        4B9D40
 004B9CF5    push        dword ptr fs:[eax]
 004B9CF8    mov         dword ptr fs:[eax],esp
 004B9CFB    mov         eax,dword ptr [ebp-0C]
 004B9CFE    call        StrBufSize
 004B9D03    mov         ecx,eax
 004B9D05    mov         edx,dword ptr [ebp-0C]
 004B9D08    mov         eax,ebx
 004B9D0A    call        TControl.GetTextBuf
 004B9D0F    cmp         edi,dword ptr [ebp-8]
>004B9D12    jg          004B9D18
 004B9D14    dec         edi
 004B9D15    mov         dword ptr [ebp-8],edi
 004B9D18    mov         edx,esi
 004B9D1A    add         edx,edx
 004B9D1C    add         edx,dword ptr [ebp-0C]
 004B9D1F    mov         ecx,dword ptr [ebp-8]
 004B9D22    mov         eax,dword ptr [ebp-4]
 004B9D25    call        StrLCopy
 004B9D2A    xor         eax,eax
 004B9D2C    pop         edx
 004B9D2D    pop         ecx
 004B9D2E    pop         ecx
 004B9D2F    mov         dword ptr fs:[eax],edx
 004B9D32    push        4B9D47
 004B9D37    mov         eax,dword ptr [ebp-0C]
 004B9D3A    call        StrDispose
 004B9D3F    ret
>004B9D40    jmp         @HandleFinally
>004B9D45    jmp         004B9D37
 004B9D47    mov         eax,dword ptr [ebp-8]
 004B9D4A    pop         edi
 004B9D4B    pop         esi
 004B9D4C    pop         ebx
 004B9D4D    mov         esp,ebp
 004B9D4F    pop         ebp
 004B9D50    ret
*}
end;

//004B9D54
procedure TCustomEdit.SetSelTextBuf(Buffer:PWideChar);
begin
{*
 004B9D54    push        ebx
 004B9D55    push        esi
 004B9D56    mov         esi,edx
 004B9D58    mov         ebx,eax
 004B9D5A    push        esi
 004B9D5B    push        0
 004B9D5D    push        0C2
 004B9D62    mov         eax,ebx
 004B9D64    call        TWinControl.GetHandle
 004B9D69    push        eax
 004B9D6A    call        user32.SendMessageW
 004B9D6F    pop         esi
 004B9D70    pop         ebx
 004B9D71    ret
*}
end;

//004B9D74
function TCustomEdit.GetSelText:UnicodeString;
begin
{*
 004B9D74    push        ebp
 004B9D75    mov         ebp,esp
 004B9D77    add         esp,0FFFFFFF8
 004B9D7A    push        ebx
 004B9D7B    push        esi
 004B9D7C    push        edi
 004B9D7D    mov         edi,edx
 004B9D7F    mov         ebx,eax
 004B9D81    mov         eax,ebx
 004B9D83    mov         edx,dword ptr [eax]
 004B9D85    call        dword ptr [edx+0F8]
 004B9D8B    mov         dword ptr [ebp-8],eax
 004B9D8E    mov         eax,ebx
 004B9D90    mov         edx,dword ptr [eax]
 004B9D92    call        dword ptr [edx+0F4]
 004B9D98    mov         esi,eax
 004B9D9A    mov         eax,edi
 004B9D9C    mov         ecx,esi
 004B9D9E    xor         edx,edx
 004B9DA0    call        @UStrFromPWCharLen
 004B9DA5    test        esi,esi
>004B9DA7    je          004B9E0C
 004B9DA9    mov         eax,ebx
 004B9DAB    call        TControl.GetTextLen
 004B9DB0    inc         eax
 004B9DB1    call        StrAlloc
 004B9DB6    mov         dword ptr [ebp-4],eax
 004B9DB9    xor         eax,eax
 004B9DBB    push        ebp
 004B9DBC    push        4B9E05
 004B9DC1    push        dword ptr fs:[eax]
 004B9DC4    mov         dword ptr fs:[eax],esp
 004B9DC7    mov         eax,dword ptr [ebp-4]
 004B9DCA    call        StrBufSize
 004B9DCF    mov         ecx,eax
 004B9DD1    mov         edx,dword ptr [ebp-4]
 004B9DD4    mov         eax,ebx
 004B9DD6    call        TControl.GetTextBuf
 004B9DDB    mov         eax,dword ptr [ebp-4]
 004B9DDE    mov         edx,dword ptr [ebp-8]
 004B9DE1    lea         eax,[eax+edx*2]
 004B9DE4    mov         ecx,esi
 004B9DE6    add         ecx,ecx
 004B9DE8    mov         edx,dword ptr [edi]
 004B9DEA    call        Move
 004B9DEF    xor         eax,eax
 004B9DF1    pop         edx
 004B9DF2    pop         ecx
 004B9DF3    pop         ecx
 004B9DF4    mov         dword ptr fs:[eax],edx
 004B9DF7    push        4B9E0C
 004B9DFC    mov         eax,dword ptr [ebp-4]
 004B9DFF    call        StrDispose
 004B9E04    ret
>004B9E05    jmp         @HandleFinally
>004B9E0A    jmp         004B9DFC
 004B9E0C    pop         edi
 004B9E0D    pop         esi
 004B9E0E    pop         ebx
 004B9E0F    pop         ecx
 004B9E10    pop         ecx
 004B9E11    pop         ebp
 004B9E12    ret
*}
end;

//004B9E14
procedure TCustomEdit.SetSelText(Value:string);
begin
{*
 004B9E14    push        ebx
 004B9E15    push        esi
 004B9E16    mov         esi,edx
 004B9E18    mov         ebx,eax
 004B9E1A    push        esi
 004B9E1B    mov         eax,ebx
 004B9E1D    call        TWinControl.GetHandle
 004B9E22    xor         ecx,ecx
 004B9E24    mov         edx,0C2
 004B9E29    call        SendTextMessage
 004B9E2E    pop         esi
 004B9E2F    pop         ebx
 004B9E30    ret
*}
end;

//004B9E34
procedure TCustomEdit.CreateParams(var Params:TCreateParams);
begin
{*
 004B9E34    push        ebx
 004B9E35    push        esi
 004B9E36    push        edi
 004B9E37    mov         edi,edx
 004B9E39    mov         ebx,eax
 004B9E3B    mov         edx,edi
 004B9E3D    mov         eax,ebx
 004B9E3F    call        TWinControl.CreateParams
 004B9E44    mov         ecx,4B9F1C
 004B9E49    mov         edx,edi
 004B9E4B    mov         eax,ebx
 004B9E4D    call        TWinControl.CreateSubClass
 004B9E52    mov         eax,ebx
 004B9E54    mov         si,0FFC7
 004B9E58    call        @CallDynaInst
 004B9E5D    and         eax,7F
 004B9E60    lea         eax,[eax+eax*2]
 004B9E63    lea         eax,[eax*4+785D9C]
 004B9E6A    movzx       edx,byte ptr [ebx+270]
 004B9E71    mov         eax,dword ptr [eax+edx*4]
 004B9E74    mov         edx,dword ptr [edi+4]
 004B9E77    or          edx,0C0
 004B9E7D    or          eax,edx
 004B9E7F    movzx       edx,byte ptr [ebx+278]
 004B9E86    or          eax,dword ptr [edx*4+785D74]
 004B9E8D    cmp         word ptr [ebx+27A],0
 004B9E95    setne       dl
 004B9E98    and         edx,7F
 004B9E9B    or          eax,dword ptr [edx*4+785DB4]
 004B9EA2    movzx       edx,byte ptr [ebx+298]
 004B9EA9    or          eax,dword ptr [edx*4+785DE0]
 004B9EB0    movzx       edx,byte ptr [ebx+27C]
 004B9EB7    or          eax,dword ptr [edx*4+785DBC]
 004B9EBE    movzx       edx,byte ptr [ebx+281]
 004B9EC5    or          eax,dword ptr [edx*4+785DC4]
 004B9ECC    movzx       edx,byte ptr [ebx+27F]
 004B9ED3    or          eax,dword ptr [edx*4+785DD0]
 004B9EDA    movzx       edx,byte ptr [ebx+280]
 004B9EE1    or          eax,dword ptr [edx*4+785DD8]
 004B9EE8    mov         dword ptr [edi+4],eax
 004B9EEB    mov         eax,[0078D264];^NewStyleControls:Boolean
 004B9EF0    cmp         byte ptr [eax],0
>004B9EF3    je          004B9F15
 004B9EF5    cmp         byte ptr [ebx+1E9],0
>004B9EFC    je          004B9F15
 004B9EFE    cmp         byte ptr [ebx+278],1
>004B9F05    jne         004B9F15
 004B9F07    and         dword ptr [edi+4],0FF7FFFFF
 004B9F0E    or          dword ptr [edi+8],200
 004B9F15    pop         edi
 004B9F16    pop         esi
 004B9F17    pop         ebx
 004B9F18    ret
*}
end;

//004B9F28
procedure TCustomEdit.CreateWindowHandle(const Params:TCreateParams);
begin
{*
 004B9F28    push        ebx
 004B9F29    push        esi
 004B9F2A    push        edi
 004B9F2B    add         esp,0FFFFFF34
 004B9F31    mov         ebx,eax
 004B9F33    mov         eax,[0078DB7C];SysLocale:TSysLocale
 004B9F38    cmp         byte ptr [eax+0C],0
>004B9F3C    je          004B9F85
 004B9F3E    mov         eax,[0078DB58];^gvar_00784C7C
 004B9F43    cmp         dword ptr [eax],2
>004B9F46    je          004B9F85
 004B9F48    test        byte ptr [edx+5],8
>004B9F4C    je          004B9F85
 004B9F4E    mov         esi,edx
 004B9F50    mov         edi,esp
 004B9F52    mov         ecx,33
 004B9F57    rep movs    dword ptr [edi],dword ptr [esi]
 004B9F59    and         dword ptr [esp+4],0FFFFF7FF
 004B9F61    mov         edx,esp
 004B9F63    mov         eax,ebx
 004B9F65    call        TWinControl.CreateWindowHandle
 004B9F6A    mov         eax,dword ptr [ebx+258]
 004B9F70    test        eax,eax
>004B9F72    je          004B9F8C
 004B9F74    push        0
 004B9F76    push        1
 004B9F78    push        0CF
 004B9F7D    push        eax
 004B9F7E    call        user32.SendMessageW
>004B9F83    jmp         004B9F8C
 004B9F85    mov         eax,ebx
 004B9F87    call        TWinControl.CreateWindowHandle
 004B9F8C    add         esp,0CC
 004B9F92    pop         edi
 004B9F93    pop         esi
 004B9F94    pop         ebx
 004B9F95    ret
*}
end;

//004B9F98
procedure TCustomEdit.CreateWnd;
begin
{*
 004B9F98    push        ebp
 004B9F99    mov         ebp,esp
 004B9F9B    push        ecx
 004B9F9C    mov         dword ptr [ebp-4],eax
 004B9F9F    mov         eax,dword ptr [ebp-4]
 004B9FA2    mov         byte ptr [eax+282],1
 004B9FA9    xor         eax,eax
 004B9FAB    push        ebp
 004B9FAC    push        4B9FD7
 004B9FB1    push        dword ptr fs:[eax]
 004B9FB4    mov         dword ptr fs:[eax],esp
 004B9FB7    mov         eax,dword ptr [ebp-4]
 004B9FBA    call        TWinControl.CreateWnd
 004B9FBF    xor         eax,eax
 004B9FC1    pop         edx
 004B9FC2    pop         ecx
 004B9FC3    pop         ecx
 004B9FC4    mov         dword ptr fs:[eax],edx
 004B9FC7    push        4B9FDE
 004B9FCC    mov         eax,dword ptr [ebp-4]
 004B9FCF    mov         byte ptr [eax+282],0
 004B9FD6    ret
>004B9FD7    jmp         @HandleFinally
>004B9FDC    jmp         004B9FCC
 004B9FDE    mov         eax,dword ptr [ebp-4]
 004B9FE1    mov         edx,dword ptr [eax+274]
 004B9FE7    mov         eax,dword ptr [ebp-4]
 004B9FEA    mov         ecx,dword ptr [eax]
 004B9FEC    call        dword ptr [ecx+0EC]
 004B9FF2    mov         eax,dword ptr [ebp-4]
 004B9FF5    movzx       edx,byte ptr [eax+283]
 004B9FFC    mov         eax,dword ptr [ebp-4]
 004B9FFF    call        TCustomEdit.SetModified
 004BA004    mov         eax,dword ptr [ebp-4]
 004BA007    cmp         word ptr [eax+27A],0
>004BA00F    je          004BA04C
 004BA011    call        ThemeServices
 004BA016    call        TThemeServices.GetThemesEnabled
 004BA01B    test        al,al
>004BA01D    je          004BA02C
 004BA01F    mov         eax,dword ptr [ebp-4]
 004BA022    cmp         word ptr [eax+27A],2A
>004BA02A    je          004BA04C
 004BA02C    push        0
 004BA02E    mov         eax,dword ptr [ebp-4]
 004BA031    movzx       eax,word ptr [eax+27A]
 004BA038    push        eax
 004BA039    push        0CC
 004BA03E    mov         eax,dword ptr [ebp-4]
 004BA041    call        TWinControl.GetHandle
 004BA046    push        eax
 004BA047    call        user32.SendMessageW
 004BA04C    mov         eax,dword ptr [ebp-4]
 004BA04F    mov         eax,dword ptr [eax+294]
 004BA055    cmp         eax,0FFFFFFFF
>004BA058    je          004BA074
 004BA05A    mov         edx,eax
 004BA05C    mov         eax,dword ptr [ebp-4]
 004BA05F    mov         ecx,dword ptr [eax]
 004BA061    call        dword ptr [ecx+104]
 004BA067    mov         eax,dword ptr [ebp-4]
 004BA06A    mov         dword ptr [eax+294],0FFFFFFFF
 004BA074    mov         eax,dword ptr [ebp-4]
 004BA077    mov         eax,dword ptr [eax+290]
 004BA07D    cmp         eax,0FFFFFFFF
>004BA080    je          004BA08F
 004BA082    mov         edx,eax
 004BA084    mov         eax,dword ptr [ebp-4]
 004BA087    mov         ecx,dword ptr [eax]
 004BA089    call        dword ptr [ecx+100]
 004BA08F    mov         eax,dword ptr [ebp-4]
 004BA092    call        TCustomEdit.UpdateHeight
 004BA097    mov         eax,dword ptr [ebp-4]
 004BA09A    mov         edx,dword ptr [eax+29C]
 004BA0A0    mov         eax,dword ptr [ebp-4]
 004BA0A3    mov         ecx,dword ptr [eax]
 004BA0A5    call        dword ptr [ecx+0F0]
 004BA0AB    pop         ecx
 004BA0AC    pop         ebp
 004BA0AD    ret
*}
end;

//004BA0B0
procedure TCustomEdit.DestroyWnd;
begin
{*
 004BA0B0    push        ebx
 004BA0B1    mov         ebx,eax
 004BA0B3    mov         eax,ebx
 004BA0B5    call        TCustomEdit.GetModified
 004BA0BA    mov         byte ptr [ebx+283],al
 004BA0C0    mov         eax,ebx
 004BA0C2    mov         edx,dword ptr [eax]
 004BA0C4    call        dword ptr [edx+0F4]
 004BA0CA    mov         dword ptr [ebx+290],eax
 004BA0D0    mov         eax,ebx
 004BA0D2    mov         edx,dword ptr [eax]
 004BA0D4    call        dword ptr [edx+0F8]
 004BA0DA    mov         dword ptr [ebx+294],eax
 004BA0E0    mov         eax,ebx
 004BA0E2    call        TWinControl.DestroyWnd
 004BA0E7    pop         ebx
 004BA0E8    ret
*}
end;

//004BA0EC
procedure TCustomEdit.UpdateHeight;
begin
{*
 004BA0EC    push        ebx
 004BA0ED    mov         ebx,eax
 004BA0EF    cmp         byte ptr [ebx+27D],0
>004BA0F6    je          004BA115
 004BA0F8    cmp         byte ptr [ebx+278],1
>004BA0FF    jne         004BA115
 004BA101    mov         eax,[004BA124]
 004BA106    or          eax,dword ptr [ebx+50]
 004BA109    mov         dword ptr [ebx+50],eax
 004BA10C    mov         eax,ebx
 004BA10E    call        TCustomEdit.AdjustHeight
 004BA113    pop         ebx
 004BA114    ret
 004BA115    mov         eax,[004BA124]
 004BA11A    not         eax
 004BA11C    and         eax,dword ptr [ebx+50]
 004BA11F    mov         dword ptr [ebx+50],eax
 004BA122    pop         ebx
 004BA123    ret
*}
end;

//004BA128
procedure TCustomEdit.AdjustHeight;
begin
{*
 004BA128    push        ebp
 004BA129    mov         ebp,esp
 004BA12B    add         esp,0FFFFFF80
 004BA12E    push        ebx
 004BA12F    mov         dword ptr [ebp-4],eax
 004BA132    push        0
 004BA134    call        user32.GetDC
 004BA139    mov         dword ptr [ebp-8],eax
 004BA13C    xor         eax,eax
 004BA13E    push        ebp
 004BA13F    push        4BA19E
 004BA144    push        dword ptr fs:[eax]
 004BA147    mov         dword ptr fs:[eax],esp
 004BA14A    lea         eax,[ebp-44]
 004BA14D    push        eax
 004BA14E    mov         eax,dword ptr [ebp-8]
 004BA151    push        eax
 004BA152    call        gdi32.GetTextMetricsW
 004BA157    mov         eax,dword ptr [ebp-4]
 004BA15A    mov         eax,dword ptr [eax+64]
 004BA15D    call        TFont.GetHandle
 004BA162    push        eax
 004BA163    mov         eax,dword ptr [ebp-8]
 004BA166    push        eax
 004BA167    call        gdi32.SelectObject
 004BA16C    mov         ebx,eax
 004BA16E    lea         eax,[ebp-80]
 004BA171    push        eax
 004BA172    mov         eax,dword ptr [ebp-8]
 004BA175    push        eax
 004BA176    call        gdi32.GetTextMetricsW
 004BA17B    push        ebx
 004BA17C    mov         eax,dword ptr [ebp-8]
 004BA17F    push        eax
 004BA180    call        gdi32.SelectObject
 004BA185    xor         eax,eax
 004BA187    pop         edx
 004BA188    pop         ecx
 004BA189    pop         ecx
 004BA18A    mov         dword ptr fs:[eax],edx
 004BA18D    push        4BA1A5
 004BA192    mov         eax,dword ptr [ebp-8]
 004BA195    push        eax
 004BA196    push        0
 004BA198    call        user32.ReleaseDC
 004BA19D    ret
>004BA19E    jmp         @HandleFinally
>004BA1A3    jmp         004BA192
 004BA1A5    mov         eax,[0078D264];^NewStyleControls:Boolean
 004BA1AA    cmp         byte ptr [eax],0
>004BA1AD    je          004BA1D3
 004BA1AF    mov         eax,dword ptr [ebp-4]
 004BA1B2    cmp         byte ptr [eax+1E9],0
>004BA1B9    je          004BA1C2
 004BA1BB    mov         ebx,8
>004BA1C0    jmp         004BA1C7
 004BA1C2    mov         ebx,6
 004BA1C7    push        6
 004BA1C9    call        user32.GetSystemMetrics
 004BA1CE    imul        ebx,eax
>004BA1D1    jmp         004BA1F8
 004BA1D3    mov         ebx,dword ptr [ebp-44]
 004BA1D6    mov         eax,dword ptr [ebp-80]
 004BA1D9    cmp         ebx,eax
>004BA1DB    jle         004BA1DF
 004BA1DD    mov         ebx,eax
 004BA1DF    push        6
 004BA1E1    call        user32.GetSystemMetrics
 004BA1E6    add         eax,eax
 004BA1E8    add         eax,eax
 004BA1EA    test        ebx,ebx
>004BA1EC    jns         004BA1F1
 004BA1EE    add         ebx,3
 004BA1F1    sar         ebx,2
 004BA1F4    add         eax,ebx
 004BA1F6    mov         ebx,eax
 004BA1F8    mov         edx,dword ptr [ebp-80]
 004BA1FB    add         edx,ebx
 004BA1FD    mov         eax,dword ptr [ebp-4]
 004BA200    call        TControl.SetHeight
 004BA205    pop         ebx
 004BA206    mov         esp,ebp
 004BA208    pop         ebp
 004BA209    ret
*}
end;

//004BA20C
procedure TCustomCombo.Change;
begin
{*
 004BA20C    push        ebx
 004BA20D    mov         ebx,eax
 004BA20F    mov         eax,ebx
 004BA211    call        TControl.Changed
 004BA216    cmp         word ptr [ebx+28A],0
>004BA21E    je          004BA22E
 004BA220    mov         edx,ebx
 004BA222    mov         eax,dword ptr [ebx+28C]
 004BA228    call        dword ptr [ebx+288]
 004BA22E    pop         ebx
 004BA22F    ret
*}
end;

//004BA230
{*procedure TCustomEdit.DefaultHandler(var Message:?);
begin
 004BA230    push        ebx
 004BA231    push        esi
 004BA232    add         esp,0FFFFFFF0
 004BA235    mov         esi,edx
 004BA237    mov         ebx,eax
 004BA239    mov         eax,dword ptr [esi]
 004BA23B    sub         eax,7
>004BA23E    je          004BA250
 004BA240    sub         eax,0B046
>004BA245    je          004BA29C
 004BA247    sub         eax,0CE6
>004BA24C    je          004BA26E
>004BA24E    jmp         004BA2C3
 004BA250    mov         eax,[0078DB58];^gvar_00784C7C
 004BA255    cmp         dword ptr [eax],1
>004BA258    jne         004BA2C3
 004BA25A    mov         eax,dword ptr [esi+4]
 004BA25D    push        eax
 004BA25E    call        user32.IsWindow
 004BA263    test        eax,eax
>004BA265    jne         004BA2C3
 004BA267    xor         eax,eax
 004BA269    mov         dword ptr [esi+4],eax
>004BA26C    jmp         004BA2C3
 004BA26E    test        byte ptr [ebx+55],80
>004BA272    je          004BA2C3
 004BA274    cmp         byte ptr [ebx+284],0
>004BA27B    jne         004BA2C3
 004BA27D    mov         byte ptr [ebx+284],1
 004BA284    push        0
 004BA286    push        0
 004BA288    push        0B04D
 004BA28D    mov         eax,ebx
 004BA28F    call        TWinControl.GetHandle
 004BA294    push        eax
 004BA295    call        user32.PostMessageW
>004BA29A    jmp         004BA2C3
 004BA29C    cmp         byte ptr [ebx+284],0
>004BA2A3    je          004BA2C3
 004BA2A5    mov         edx,esp
 004BA2A7    mov         eax,ebx
 004BA2A9    mov         ecx,dword ptr [eax]
 004BA2AB    call        dword ptr [ecx+54]
 004BA2AE    push        esp
 004BA2AF    mov         eax,ebx
 004BA2B1    call        TWinControl.GetHandle
 004BA2B6    pop         edx
 004BA2B7    call        PerformBufferedPrintClient
 004BA2BC    mov         byte ptr [ebx+284],0
 004BA2C3    mov         edx,esi
 004BA2C5    mov         eax,ebx
 004BA2C7    call        TWinControl.DefaultHandler
 004BA2CC    add         esp,10
 004BA2CF    pop         esi
 004BA2D0    pop         ebx
 004BA2D1    ret
end;*}

//004BA2D4
procedure TCustomEdit.WMSetFont(var Message:TWMSetFont);
begin
{*
 004BA2D4    push        esi
 004BA2D5    mov         esi,eax
 004BA2D7    mov         eax,esi
 004BA2D9    mov         ecx,dword ptr [eax]
 004BA2DB    call        dword ptr [ecx-10]
 004BA2DE    mov         eax,[0078D264];^NewStyleControls:Boolean
 004BA2E3    cmp         byte ptr [eax],0
>004BA2E6    je          004BA311
 004BA2E8    push        0F0
 004BA2EA    mov         eax,esi
 004BA2EC    call        TWinControl.GetHandle
 004BA2F1    push        eax
 004BA2F2    call        user32.GetWindowLongW
 004BA2F7    test        al,4
>004BA2F9    jne         004BA311
 004BA2FB    push        0
 004BA2FD    push        3
 004BA2FF    push        0D3
 004BA304    mov         eax,esi
 004BA306    call        TWinControl.GetHandle
 004BA30B    push        eax
 004BA30C    call        user32.SendMessageW
 004BA311    pop         esi
 004BA312    ret
*}
end;

//004BA314
procedure TCustomEdit.CMColorChanged(var Message:TMessage);
begin
{*
 004BA314    push        ebx
 004BA315    mov         ebx,eax
 004BA317    mov         eax,ebx
 004BA319    call        TWinControl.CMColorChanged
 004BA31E    mov         eax,ebx
 004BA320    call        TWinControl.HandleAllocated
 004BA325    test        al,al
>004BA327    je          004BA33F
 004BA329    push        401
 004BA32E    push        0
 004BA330    push        0
 004BA332    mov         eax,ebx
 004BA334    call        TWinControl.GetHandle
 004BA339    push        eax
 004BA33A    call        user32.RedrawWindow
 004BA33F    pop         ebx
 004BA340    ret
*}
end;

//004BA344
procedure TCustomEdit.CMCtl3DChanged(var Message:TMessage);
begin
{*
 004BA344    push        ebx
 004BA345    push        esi
 004BA346    mov         esi,edx
 004BA348    mov         ebx,eax
 004BA34A    mov         eax,[0078D264];^NewStyleControls:Boolean
 004BA34F    cmp         byte ptr [eax],0
>004BA352    je          004BA36B
 004BA354    cmp         byte ptr [ebx+278],1
>004BA35B    jne         004BA36B
 004BA35D    mov         eax,ebx
 004BA35F    call        TCustomEdit.UpdateHeight
 004BA364    mov         eax,ebx
 004BA366    call        TWinControl.RecreateWnd
 004BA36B    mov         edx,esi
 004BA36D    mov         eax,ebx
 004BA36F    call        TWinControl.CMCtl3DChanged
 004BA374    pop         esi
 004BA375    pop         ebx
 004BA376    ret
*}
end;

//004BA378
procedure TCustomEdit.CMFontChanged(var Message:TMessage);
begin
{*
 004BA378    push        ebx
 004BA379    mov         ebx,eax
 004BA37B    mov         eax,ebx
 004BA37D    call        TWinControl.CMFontChanged
 004BA382    test        byte ptr [ebx+51],2
>004BA386    je          004BA39B
 004BA388    test        byte ptr [ebx+1C],10
>004BA38C    je          004BA394
 004BA38E    test        byte ptr [ebx+1C],1
>004BA392    jne         004BA39B
 004BA394    mov         eax,ebx
 004BA396    call        TCustomEdit.AdjustHeight
 004BA39B    pop         ebx
 004BA39C    ret
*}
end;

//004BA3A0
procedure TCustomCombo.CMGestureManagerChanged(var Message:TMessage);
begin
{*
 004BA3A0    push        ebx
 004BA3A1    mov         ebx,eax
 004BA3A3    test        byte ptr [ebx+1C],8
>004BA3A7    jne         004BA3E1
 004BA3A9    mov         eax,dword ptr [ebx+0AC]
 004BA3AF    cmp         dword ptr [eax+0C],0
>004BA3B3    je          004BA3C2
 004BA3B5    mov         eax,[004BA3E4]
 004BA3BA    or          eax,dword ptr [ebx+50]
 004BA3BD    mov         dword ptr [ebx+50],eax
>004BA3C0    jmp         004BA3CF
 004BA3C2    mov         eax,[004BA3E4]
 004BA3C7    not         eax
 004BA3C9    and         eax,dword ptr [ebx+50]
 004BA3CC    mov         dword ptr [ebx+50],eax
 004BA3CF    mov         eax,ebx
 004BA3D1    call        TWinControl.HandleAllocated
 004BA3D6    test        al,al
>004BA3D8    je          004BA3E1
 004BA3DA    mov         eax,ebx
 004BA3DC    call        TWinControl.RecreateWnd
 004BA3E1    pop         ebx
 004BA3E2    ret
*}
end;

//004BA3E8
procedure TCustomEdit.CNCommand(var Message:TWMCommand);
begin
{*
 004BA3E8    push        esi
 004BA3E9    mov         esi,eax
 004BA3EB    cmp         word ptr [edx+6],300
>004BA3F1    jne         004BA407
 004BA3F3    cmp         byte ptr [esi+282],0
>004BA3FA    jne         004BA407
 004BA3FC    mov         eax,esi
 004BA3FE    mov         si,0FFAF
 004BA402    call        @CallDynaInst
 004BA407    pop         esi
 004BA408    ret
*}
end;

//004BA40C
procedure TCustomEdit.CMEnter(var Message:TCMEnter);
begin
{*
 004BA40C    push        ebx
 004BA40D    push        esi
 004BA40E    mov         esi,edx
 004BA410    mov         ebx,eax
 004BA412    cmp         byte ptr [ebx+27E],0
>004BA419    je          004BA43B
 004BA41B    test        byte ptr [ebx+54],1
>004BA41F    jne         004BA43B
 004BA421    push        0F0
 004BA423    mov         eax,ebx
 004BA425    call        TWinControl.GetHandle
 004BA42A    push        eax
 004BA42B    call        user32.GetWindowLongW
 004BA430    test        al,4
>004BA432    jne         004BA43B
 004BA434    mov         eax,ebx
 004BA436    call        TCustomEdit.SelectAll
 004BA43B    mov         edx,esi
 004BA43D    mov         eax,ebx
 004BA43F    call        TWinControl.CMEnter
 004BA444    pop         esi
 004BA445    pop         ebx
 004BA446    ret
*}
end;

//004BA448
procedure TCustomEdit.CMTextChanged(var Message:TMessage);
begin
{*
 004BA448    push        esi
 004BA449    mov         esi,eax
 004BA44B    mov         eax,esi
 004BA44D    call        TWinControl.CMTextChanged
 004BA452    mov         eax,esi
 004BA454    call        TWinControl.HandleAllocated
 004BA459    test        al,al
>004BA45B    je          004BA470
 004BA45D    push        0F0
 004BA45F    mov         eax,esi
 004BA461    call        TWinControl.GetHandle
 004BA466    push        eax
 004BA467    call        user32.GetWindowLongW
 004BA46C    test        al,4
>004BA46E    je          004BA47B
 004BA470    mov         eax,esi
 004BA472    mov         si,0FFAF
 004BA476    call        @CallDynaInst
 004BA47B    pop         esi
 004BA47C    ret
*}
end;

//004BA480
procedure TCustomEdit.WMContextMenu(var Message:TWMContextMenu);
begin
{*
 004BA480    push        ebx
 004BA481    push        esi
 004BA482    push        edi
 004BA483    add         esp,0FFFFFFD0
 004BA486    mov         edi,edx
 004BA488    mov         ebx,eax
 004BA48A    mov         eax,ebx
 004BA48C    mov         edx,dword ptr [eax]
 004BA48E    call        dword ptr [edx+0E8]
 004BA494    cmp         dword ptr [ebx+7C],0
>004BA498    jne         004BA544
 004BA49E    mov         eax,dword ptr [edi+8]
 004BA4A1    mov         dword ptr [esp+0A],eax
 004BA4A5    movsx       eax,word ptr [esp+0A]
 004BA4AA    mov         dword ptr [esp+10],eax
 004BA4AE    movsx       eax,word ptr [esp+0C]
 004BA4B3    mov         dword ptr [esp+14],eax
 004BA4B7    mov         eax,dword ptr [esp+10]
 004BA4BB    mov         dword ptr [esp],eax
 004BA4BE    mov         eax,dword ptr [esp+14]
 004BA4C2    mov         dword ptr [esp+4],eax
 004BA4C6    mov         eax,esp
 004BA4C8    call        InvalidPoint
 004BA4CD    test        al,al
>004BA4CF    jne         004BA4ED
 004BA4D1    lea         ecx,[esp+28]
 004BA4D5    mov         edx,esp
 004BA4D7    mov         eax,ebx
 004BA4D9    call        TControl.ScreenToClient
 004BA4DE    mov         eax,dword ptr [esp+28]
 004BA4E2    mov         dword ptr [esp],eax
 004BA4E5    mov         eax,dword ptr [esp+2C]
 004BA4E9    mov         dword ptr [esp+4],eax
 004BA4ED    mov         byte ptr [esp+8],0
 004BA4F2    lea         ecx,[esp+8]
 004BA4F6    mov         edx,esp
 004BA4F8    mov         eax,ebx
 004BA4FA    mov         si,0FFE8
 004BA4FE    call        @CallDynaInst
 004BA503    movzx       eax,byte ptr [esp+8]
 004BA508    mov         dword ptr [edi+0C],eax
 004BA50B    cmp         byte ptr [esp+8],0
>004BA510    jne         004BA54D
 004BA512    mov         esi,edi
 004BA514    lea         edi,[esp+18]
 004BA518    movs        dword ptr [edi],dword ptr [esi]
 004BA519    movs        dword ptr [edi],dword ptr [esi]
 004BA51A    movs        dword ptr [edi],dword ptr [esi]
 004BA51B    movs        dword ptr [edi],dword ptr [esi]
 004BA51C    mov         eax,dword ptr [esp+20]
 004BA520    push        eax
 004BA521    mov         eax,dword ptr [esp+20]
 004BA525    push        eax
 004BA526    mov         eax,dword ptr [esp+20]
 004BA52A    push        eax
 004BA52B    mov         eax,dword ptr [ebx+258]
 004BA531    push        eax
 004BA532    mov         eax,dword ptr [ebx+254]
 004BA538    push        eax
 004BA539    call        user32.CallWindowProcW
 004BA53E    mov         dword ptr [esp+24],eax
>004BA542    jmp         004BA54D
 004BA544    mov         edx,edi
 004BA546    mov         eax,ebx
 004BA548    call        TWinControl.WMContextMenu
 004BA54D    add         esp,30
 004BA550    pop         edi
 004BA551    pop         esi
 004BA552    pop         ebx
 004BA553    ret
*}
end;

//004BA554
procedure TCustomEdit.GetControlsAlignment;
begin
{*
 004BA554    movzx       eax,byte ptr [eax+270]
 004BA55B    ret
*}
end;

//004BA55C
function TMemoStrings.GetCount:Integer;
begin
{*
 004BA55C    push        ebx
 004BA55D    push        esi
 004BA55E    mov         ebx,eax
 004BA560    xor         esi,esi
 004BA562    mov         eax,dword ptr [ebx+2C]
 004BA565    call        TWinControl.HandleAllocated
 004BA56A    test        al,al
>004BA56C    jne         004BA57A
 004BA56E    mov         eax,dword ptr [ebx+2C]
 004BA571    cmp         dword ptr [eax+174],0
>004BA578    je          004BA5C7
 004BA57A    push        0
 004BA57C    push        0
 004BA57E    push        0BA
 004BA583    mov         eax,dword ptr [ebx+2C]
 004BA586    call        TWinControl.GetHandle
 004BA58B    push        eax
 004BA58C    call        user32.SendMessageW
 004BA591    mov         esi,eax
 004BA593    push        0
 004BA595    push        0
 004BA597    mov         eax,esi
 004BA599    dec         eax
 004BA59A    push        eax
 004BA59B    push        0BB
 004BA5A0    mov         eax,dword ptr [ebx+2C]
 004BA5A3    call        TWinControl.GetHandle
 004BA5A8    push        eax
 004BA5A9    call        user32.SendMessageW
 004BA5AE    push        eax
 004BA5AF    push        0C1
 004BA5B4    mov         eax,dword ptr [ebx+2C]
 004BA5B7    call        TWinControl.GetHandle
 004BA5BC    push        eax
 004BA5BD    call        user32.SendMessageW
 004BA5C2    test        eax,eax
>004BA5C4    jne         004BA5C7
 004BA5C6    dec         esi
 004BA5C7    mov         eax,esi
 004BA5C9    pop         esi
 004BA5CA    pop         ebx
 004BA5CB    ret
*}
end;

//004BA5CC
function TMemoStrings.Get(Index:Integer):UnicodeString;
begin
{*
 004BA5CC    push        ebx
 004BA5CD    push        esi
 004BA5CE    push        edi
 004BA5CF    push        eax
 004BA5D0    mov         eax,2
 004BA5D5    add         esp,0FFFFF004
 004BA5DB    push        eax
 004BA5DC    dec         eax
>004BA5DD    jne         004BA5D5
 004BA5DF    mov         eax,dword ptr [esp+2000]
 004BA5E6    add         esp,4
 004BA5E9    mov         edi,ecx
 004BA5EB    mov         esi,edx
 004BA5ED    mov         ebx,eax
 004BA5EF    mov         eax,esp
 004BA5F1    mov         word ptr [eax],1000
 004BA5F6    mov         eax,esp
 004BA5F8    push        eax
 004BA5F9    push        esi
 004BA5FA    push        0C4
 004BA5FF    mov         eax,dword ptr [ebx+2C]
 004BA602    call        TWinControl.GetHandle
 004BA607    push        eax
 004BA608    call        user32.SendMessageW
 004BA60D    mov         ecx,eax
 004BA60F    mov         edx,esp
 004BA611    mov         eax,edi
 004BA613    call        @UStrFromPWCharLen
 004BA618    add         esp,2000
 004BA61E    pop         edi
 004BA61F    pop         esi
 004BA620    pop         ebx
 004BA621    ret
*}
end;

//004BA624
procedure TMemoStrings.Put(Index:Integer; const S:UnicodeString);
begin
{*
 004BA624    push        ebx
 004BA625    push        esi
 004BA626    push        edi
 004BA627    mov         edi,ecx
 004BA629    mov         esi,edx
 004BA62B    mov         ebx,eax
 004BA62D    push        0
 004BA62F    push        esi
 004BA630    push        0BB
 004BA635    mov         eax,dword ptr [ebx+2C]
 004BA638    call        TWinControl.GetHandle
 004BA63D    push        eax
 004BA63E    call        user32.SendMessageW
 004BA643    mov         esi,eax
 004BA645    test        esi,esi
>004BA647    jl          004BA68B
 004BA649    push        0
 004BA64B    push        esi
 004BA64C    push        0C1
 004BA651    mov         eax,dword ptr [ebx+2C]
 004BA654    call        TWinControl.GetHandle
 004BA659    push        eax
 004BA65A    call        user32.SendMessageW
 004BA65F    add         eax,esi
 004BA661    push        eax
 004BA662    push        esi
 004BA663    push        0B1
 004BA668    mov         eax,dword ptr [ebx+2C]
 004BA66B    call        TWinControl.GetHandle
 004BA670    push        eax
 004BA671    call        user32.SendMessageW
 004BA676    push        edi
 004BA677    mov         eax,dword ptr [ebx+2C]
 004BA67A    call        TWinControl.GetHandle
 004BA67F    xor         ecx,ecx
 004BA681    mov         edx,0C2
 004BA686    call        SendTextMessage
 004BA68B    pop         edi
 004BA68C    pop         esi
 004BA68D    pop         ebx
 004BA68E    ret
*}
end;

//004BA690
procedure TMemoStrings.Insert(Index:Integer; S:string);
begin
{*
 004BA690    push        ebp
 004BA691    mov         ebp,esp
 004BA693    add         esp,0FFFFFFF8
 004BA696    push        ebx
 004BA697    push        esi
 004BA698    push        edi
 004BA699    xor         ebx,ebx
 004BA69B    mov         dword ptr [ebp-4],ebx
 004BA69E    mov         dword ptr [ebp-8],ecx
 004BA6A1    mov         edi,edx
 004BA6A3    mov         esi,eax
 004BA6A5    xor         eax,eax
 004BA6A7    push        ebp
 004BA6A8    push        4BA775
 004BA6AD    push        dword ptr fs:[eax]
 004BA6B0    mov         dword ptr fs:[eax],esp
 004BA6B3    test        edi,edi
>004BA6B5    jl          004BA75F
 004BA6BB    push        0
 004BA6BD    push        edi
 004BA6BE    push        0BB
 004BA6C3    mov         eax,dword ptr [esi+2C]
 004BA6C6    call        TWinControl.GetHandle
 004BA6CB    push        eax
 004BA6CC    call        user32.SendMessageW
 004BA6D1    mov         ebx,eax
 004BA6D3    test        ebx,ebx
>004BA6D5    jl          004BA6E9
 004BA6D7    lea         eax,[ebp-4]
 004BA6DA    mov         ecx,4BA790;'
'
 004BA6DF    mov         edx,dword ptr [ebp-8]
 004BA6E2    call        @UStrCat3
>004BA6E7    jmp         004BA732
 004BA6E9    push        0
 004BA6EB    dec         edi
 004BA6EC    push        edi
 004BA6ED    push        0BB
 004BA6F2    mov         eax,dword ptr [esi+2C]
 004BA6F5    call        TWinControl.GetHandle
 004BA6FA    push        eax
 004BA6FB    call        user32.SendMessageW
 004BA700    mov         ebx,eax
 004BA702    test        ebx,ebx
>004BA704    jl          004BA75F
 004BA706    push        0
 004BA708    push        ebx
 004BA709    push        0C1
 004BA70E    mov         eax,dword ptr [esi+2C]
 004BA711    call        TWinControl.GetHandle
 004BA716    push        eax
 004BA717    call        user32.SendMessageW
 004BA71C    test        eax,eax
>004BA71E    je          004BA75F
 004BA720    add         ebx,eax
 004BA722    lea         eax,[ebp-4]
 004BA725    mov         ecx,dword ptr [ebp-8]
 004BA728    mov         edx,4BA790;'
'
 004BA72D    call        @UStrCat3
 004BA732    push        ebx
 004BA733    push        ebx
 004BA734    push        0B1
 004BA739    mov         eax,dword ptr [esi+2C]
 004BA73C    call        TWinControl.GetHandle
 004BA741    push        eax
 004BA742    call        user32.SendMessageW
 004BA747    mov         eax,dword ptr [ebp-4]
 004BA74A    push        eax
 004BA74B    mov         eax,dword ptr [esi+2C]
 004BA74E    call        TWinControl.GetHandle
 004BA753    xor         ecx,ecx
 004BA755    mov         edx,0C2
 004BA75A    call        SendTextMessage
 004BA75F    xor         eax,eax
 004BA761    pop         edx
 004BA762    pop         ecx
 004BA763    pop         ecx
 004BA764    mov         dword ptr fs:[eax],edx
 004BA767    push        4BA77C
 004BA76C    lea         eax,[ebp-4]
 004BA76F    call        @UStrClr
 004BA774    ret
>004BA775    jmp         @HandleFinally
>004BA77A    jmp         004BA76C
 004BA77C    pop         edi
 004BA77D    pop         esi
 004BA77E    pop         ebx
 004BA77F    pop         ecx
 004BA780    pop         ecx
 004BA781    pop         ebp
 004BA782    ret
*}
end;

//004BA798
procedure TMemoStrings.Delete(Index:Integer);
begin
{*
 004BA798    push        ebx
 004BA799    push        esi
 004BA79A    push        edi
 004BA79B    mov         edi,edx
 004BA79D    mov         ebx,eax
 004BA79F    push        0
 004BA7A1    push        edi
 004BA7A2    push        0BB
 004BA7A7    mov         eax,dword ptr [ebx+2C]
 004BA7AA    call        TWinControl.GetHandle
 004BA7AF    push        eax
 004BA7B0    call        user32.SendMessageW
 004BA7B5    mov         esi,eax
 004BA7B7    test        esi,esi
>004BA7B9    jl          004BA81D
 004BA7BB    push        0
 004BA7BD    inc         edi
 004BA7BE    push        edi
 004BA7BF    push        0BB
 004BA7C4    mov         eax,dword ptr [ebx+2C]
 004BA7C7    call        TWinControl.GetHandle
 004BA7CC    push        eax
 004BA7CD    call        user32.SendMessageW
 004BA7D2    mov         edi,eax
 004BA7D4    test        edi,edi
>004BA7D6    jge         004BA7F2
 004BA7D8    push        0
 004BA7DA    push        esi
 004BA7DB    push        0C1
 004BA7E0    mov         eax,dword ptr [ebx+2C]
 004BA7E3    call        TWinControl.GetHandle
 004BA7E8    push        eax
 004BA7E9    call        user32.SendMessageW
 004BA7EE    mov         edi,eax
 004BA7F0    add         edi,esi
 004BA7F2    push        edi
 004BA7F3    push        esi
 004BA7F4    push        0B1
 004BA7F9    mov         eax,dword ptr [ebx+2C]
 004BA7FC    call        TWinControl.GetHandle
 004BA801    push        eax
 004BA802    call        user32.SendMessageW
 004BA807    push        0
 004BA809    mov         eax,dword ptr [ebx+2C]
 004BA80C    call        TWinControl.GetHandle
 004BA811    xor         ecx,ecx
 004BA813    mov         edx,0C2
 004BA818    call        SendTextMessage
 004BA81D    pop         edi
 004BA81E    pop         esi
 004BA81F    pop         ebx
 004BA820    ret
*}
end;

//004BA824
procedure TMemoStrings.Clear;
begin
{*
 004BA824    mov         eax,dword ptr [eax+2C]
 004BA827    mov         edx,dword ptr [eax]
 004BA829    call        dword ptr [edx+108]
 004BA82F    ret
*}
end;

//004BA830
procedure TMemoStrings.SetUpdateState(Updating:Boolean);
begin
{*
 004BA830    push        ebx
 004BA831    push        esi
 004BA832    mov         ebx,edx
 004BA834    mov         esi,eax
 004BA836    mov         eax,dword ptr [esi+2C]
 004BA839    call        TWinControl.HandleAllocated
 004BA83E    test        al,al
>004BA840    je          004BA87C
 004BA842    push        0
 004BA844    mov         eax,ebx
 004BA846    xor         al,1
 004BA848    and         eax,7F
 004BA84B    push        eax
 004BA84C    push        0B
 004BA84E    mov         eax,dword ptr [esi+2C]
 004BA851    call        TWinControl.GetHandle
 004BA856    push        eax
 004BA857    call        user32.SendMessageW
 004BA85C    xor         bl,1
 004BA85F    test        bl,bl
>004BA861    je          004BA87C
 004BA863    push        0
 004BA865    xor         ecx,ecx
 004BA867    mov         edx,0B019
 004BA86C    mov         eax,dword ptr [esi+2C]
 004BA86F    call        TControl.Perform
 004BA874    mov         eax,dword ptr [esi+2C]
 004BA877    call        TControl.Refresh
 004BA87C    pop         esi
 004BA87D    pop         ebx
 004BA87E    ret
*}
end;

//004BA880
function TMemoStrings.GetTextStr:UnicodeString;
begin
{*
 004BA880    push        ebx
 004BA881    push        esi
 004BA882    mov         esi,edx
 004BA884    mov         ebx,eax
 004BA886    mov         edx,esi
 004BA888    mov         eax,dword ptr [ebx+2C]
 004BA88B    call        TControl.GetText
 004BA890    pop         esi
 004BA891    pop         ebx
 004BA892    ret
*}
end;

//004BA894
procedure TMemoStrings.SetTextStr(const Value:UnicodeString);
begin
{*
 004BA894    push        ebp
 004BA895    mov         ebp,esp
 004BA897    push        0
 004BA899    push        0
 004BA89B    push        0
 004BA89D    push        ebx
 004BA89E    push        esi
 004BA89F    mov         ebx,edx
 004BA8A1    mov         esi,eax
 004BA8A3    xor         eax,eax
 004BA8A5    push        ebp
 004BA8A6    push        4BA96A
 004BA8AB    push        dword ptr fs:[eax]
 004BA8AE    mov         dword ptr fs:[eax],esp
 004BA8B1    lea         ecx,[ebp-4]
 004BA8B4    mov         dl,1
 004BA8B6    mov         eax,ebx
 004BA8B8    call        AdjustLineBreaks
 004BA8BD    mov         ebx,dword ptr [ebp-4]
 004BA8C0    test        ebx,ebx
>004BA8C2    je          004BA8C9
 004BA8C4    sub         ebx,4
 004BA8C7    mov         ebx,dword ptr [ebx]
 004BA8C9    mov         eax,dword ptr [esi+2C]
 004BA8CC    call        TControl.GetTextLen
 004BA8D1    cmp         ebx,eax
>004BA8D3    je          004BA8D9
 004BA8D5    mov         al,1
>004BA8D7    jmp         004BA8F2
 004BA8D9    lea         edx,[ebp-8]
 004BA8DC    mov         eax,dword ptr [esi+2C]
 004BA8DF    call        TControl.GetText
 004BA8E4    mov         edx,dword ptr [ebp-8]
 004BA8E7    mov         eax,dword ptr [ebp-4]
 004BA8EA    call        @UStrEqual
 004BA8EF    setne       al
 004BA8F2    test        al,al
>004BA8F4    je          004BA944
 004BA8F6    mov         eax,dword ptr [ebp-4]
 004BA8F9    push        eax
 004BA8FA    mov         eax,dword ptr [esi+2C]
 004BA8FD    call        TWinControl.GetHandle
 004BA902    xor         ecx,ecx
 004BA904    mov         edx,0C
 004BA909    call        SendTextMessage
 004BA90E    test        eax,eax
>004BA910    jne         004BA933
 004BA912    lea         edx,[ebp-0C]
 004BA915    mov         eax,[0078D724];^SResString284:TResStringRec
 004BA91A    call        LoadResString
 004BA91F    mov         ecx,dword ptr [ebp-0C]
 004BA922    mov         dl,1
 004BA924    mov         eax,[00439268];EInvalidOperation
 004BA929    call        Exception.Create
 004BA92E    call        @RaiseExcept
 004BA933    push        0
 004BA935    mov         eax,dword ptr [esi+2C]
 004BA938    xor         ecx,ecx
 004BA93A    mov         edx,0B012
 004BA93F    call        TControl.Perform
 004BA944    xor         eax,eax
 004BA946    pop         edx
 004BA947    pop         ecx
 004BA948    pop         ecx
 004BA949    mov         dword ptr fs:[eax],edx
 004BA94C    push        4BA971
 004BA951    lea         eax,[ebp-0C]
 004BA954    call        @UStrClr
 004BA959    lea         eax,[ebp-8]
 004BA95C    call        @UStrClr
 004BA961    lea         eax,[ebp-4]
 004BA964    call        @UStrClr
 004BA969    ret
>004BA96A    jmp         @HandleFinally
>004BA96F    jmp         004BA951
 004BA971    pop         esi
 004BA972    pop         ebx
 004BA973    mov         esp,ebp
 004BA975    pop         ebp
 004BA976    ret
*}
end;

//004BA978
constructor TCustomMemo.Create;
begin
{*
 004BA978    push        ebp
 004BA979    mov         ebp,esp
 004BA97B    push        ecx
 004BA97C    push        ebx
 004BA97D    push        esi
 004BA97E    test        dl,dl
>004BA980    je          004BA98A
 004BA982    add         esp,0FFFFFFF0
 004BA985    call        @ClassCreate
 004BA98A    mov         byte ptr [ebp-1],dl
 004BA98D    mov         ebx,eax
 004BA98F    xor         edx,edx
 004BA991    mov         eax,ebx
 004BA993    call        TCustomEdit.Create
 004BA998    mov         edx,0B9
 004BA99D    mov         eax,ebx
 004BA99F    call        TControl.SetWidth
 004BA9A4    mov         edx,59
 004BA9A9    mov         eax,ebx
 004BA9AB    call        TControl.SetHeight
 004BA9B0    xor         edx,edx
 004BA9B2    mov         eax,ebx
 004BA9B4    mov         ecx,dword ptr [eax]
 004BA9B6    call        dword ptr [ecx+6C]
 004BA9B9    mov         byte ptr [ebx+2A5],1
 004BA9C0    mov         byte ptr [ebx+2A6],1
 004BA9C7    mov         dl,1
 004BA9C9    mov         eax,[004B80F0];TMemoStrings
 004BA9CE    call        TStrings.Create
 004BA9D3    mov         esi,eax
 004BA9D5    mov         dword ptr [ebx+2A0],esi
 004BA9DB    mov         dword ptr [esi+2C],ebx
 004BA9DE    xor         edx,edx
 004BA9E0    mov         eax,ebx
 004BA9E2    mov         ecx,dword ptr [eax]
 004BA9E4    call        dword ptr [ecx+0D8]
 004BA9EA    mov         eax,dword ptr [ebx+0AC]
 004BA9F0    movzx       edx,byte ptr ds:[4BAA24]
 004BA9F7    mov         byte ptr [eax+10],dl
 004BA9FA    movzx       edx,byte ptr ds:[4BAA28]
 004BAA01    mov         byte ptr [eax+11],dl
 004BAA04    mov         eax,ebx
 004BAA06    cmp         byte ptr [ebp-1],0
>004BAA0A    je          004BAA1B
 004BAA0C    call        @AfterConstruction
 004BAA11    pop         dword ptr fs:[0]
 004BAA18    add         esp,0C
 004BAA1B    mov         eax,ebx
 004BAA1D    pop         esi
 004BAA1E    pop         ebx
 004BAA1F    pop         ecx
 004BAA20    pop         ebp
 004BAA21    ret
*}
end;

//004BAA2C
destructor TCustomMemo.Destroy();
begin
{*
 004BAA2C    push        ebx
 004BAA2D    push        esi
 004BAA2E    call        @BeforeDestruction
 004BAA33    mov         ebx,edx
 004BAA35    mov         esi,eax
 004BAA37    mov         eax,dword ptr [esi+2A0]
 004BAA3D    call        TObject.Free
 004BAA42    mov         edx,ebx
 004BAA44    and         dl,0FC
 004BAA47    mov         eax,esi
 004BAA49    call        TWinControl.Destroy
 004BAA4E    test        bl,bl
>004BAA50    jle         004BAA59
 004BAA52    mov         eax,esi
 004BAA54    call        @ClassDestroy
 004BAA59    pop         esi
 004BAA5A    pop         ebx
 004BAA5B    ret
*}
end;

//004BAA5C
procedure TCustomMemo.DoGetGestureOptions(var Gestures:TInteractiveGestures; var Options:TInteractiveGestureOptions);
begin
{*
 004BAA5C    push        ebx
 004BAA5D    push        esi
 004BAA5E    mov         esi,edx
 004BAA60    mov         ebx,eax
 004BAA62    mov         edx,esi
 004BAA64    mov         eax,ebx
 004BAA66    call        TControl.DoGetGestureOptions
 004BAA6B    test        byte ptr [esi],2
>004BAA6E    je          004BAA8C
 004BAA70    movzx       eax,byte ptr [ebx+2A4]
 004BAA77    test        al,al
>004BAA79    je          004BAA7F
 004BAA7B    cmp         al,1
>004BAA7D    jne         004BAA8C
 004BAA7F    movzx       eax,byte ptr ds:[4BAA90]
 004BAA86    not         eax
 004BAA88    and         al,byte ptr [esi]
 004BAA8A    mov         byte ptr [esi],al
 004BAA8C    pop         esi
 004BAA8D    pop         ebx
 004BAA8E    ret
*}
end;

//004BAA94
procedure TCustomMemo.CreateParams(var Params:TCreateParams);
begin
{*
 004BAA94    push        ebx
 004BAA95    push        esi
 004BAA96    mov         esi,edx
 004BAA98    mov         ebx,eax
 004BAA9A    mov         edx,esi
 004BAA9C    mov         eax,ebx
 004BAA9E    call        TCustomEdit.CreateParams
 004BAAA3    mov         eax,dword ptr [esi+4]
 004BAAA6    movzx       edx,byte ptr [ebx+2A5]
 004BAAAD    mov         edx,dword ptr [edx*4+785DF8]
 004BAAB4    not         edx
 004BAAB6    and         eax,edx
 004BAAB8    or          eax,4
 004BAABB    movzx       edx,byte ptr [ebx+2A4]
 004BAAC2    or          eax,dword ptr [edx*4+785DE8]
 004BAAC9    mov         dword ptr [esi+4],eax
 004BAACC    pop         esi
 004BAACD    pop         ebx
 004BAACE    ret
*}
end;

//004BAAD0
procedure TCustomMemo.CreateWindowHandle(const Params:TCreateParams);
begin
{*
 004BAAD0    push        ebp
 004BAAD1    mov         ebp,esp
 004BAAD3    push        0
 004BAAD5    push        ebx
 004BAAD6    push        esi
 004BAAD7    push        edi
 004BAAD8    mov         ebx,edx
 004BAADA    mov         esi,eax
 004BAADC    xor         eax,eax
 004BAADE    push        ebp
 004BAADF    push        4BABCB
 004BAAE4    push        dword ptr fs:[eax]
 004BAAE7    mov         dword ptr fs:[eax],esp
 004BAAEA    mov         eax,[0078DB7C];SysLocale:TSysLocale
 004BAAEF    cmp         byte ptr [eax+0C],0
>004BAAF3    je          004BAB5B
 004BAAF5    mov         eax,[0078DB58];^gvar_00784C7C
 004BAAFA    cmp         dword ptr [eax],2
>004BAAFD    je          004BAB5B
 004BAAFF    test        byte ptr [ebx+5],8
>004BAB03    je          004BAB5B
 004BAB05    mov         eax,dword ptr [ebx+4]
 004BAB08    and         eax,0FFFFF7FF
 004BAB0D    push        eax
 004BAB0E    mov         eax,dword ptr [ebx+0C]
 004BAB11    push        eax
 004BAB12    mov         eax,dword ptr [ebx+10]
 004BAB15    push        eax
 004BAB16    mov         eax,dword ptr [ebx+14]
 004BAB19    push        eax
 004BAB1A    mov         eax,dword ptr [ebx+18]
 004BAB1D    push        eax
 004BAB1E    mov         eax,dword ptr [ebx+1C]
 004BAB21    push        eax
 004BAB22    push        0
 004BAB24    mov         eax,[00790C38];gvar_00790C38
 004BAB29    push        eax
 004BAB2A    mov         eax,dword ptr [ebx+20]
 004BAB2D    push        eax
 004BAB2E    mov         ecx,4BABD8
 004BAB33    lea         edx,[ebx+4C]
 004BAB36    mov         eax,dword ptr [ebx+8]
 004BAB39    call        CreateWindowEx
 004BAB3E    mov         edi,eax
 004BAB40    mov         dword ptr [esi+258],edi
 004BAB46    test        edi,edi
>004BAB48    je          004BAB95
 004BAB4A    push        0
 004BAB4C    push        1
 004BAB4E    push        0CF
 004BAB53    push        edi
 004BAB54    call        user32.SendMessageW
>004BAB59    jmp         004BAB95
 004BAB5B    mov         eax,dword ptr [ebx+4]
 004BAB5E    push        eax
 004BAB5F    mov         eax,dword ptr [ebx+0C]
 004BAB62    push        eax
 004BAB63    mov         eax,dword ptr [ebx+10]
 004BAB66    push        eax
 004BAB67    mov         eax,dword ptr [ebx+14]
 004BAB6A    push        eax
 004BAB6B    mov         eax,dword ptr [ebx+18]
 004BAB6E    push        eax
 004BAB6F    mov         eax,dword ptr [ebx+1C]
 004BAB72    push        eax
 004BAB73    push        0
 004BAB75    mov         eax,[00790C38];gvar_00790C38
 004BAB7A    push        eax
 004BAB7B    mov         eax,dword ptr [ebx+20]
 004BAB7E    push        eax
 004BAB7F    mov         ecx,4BABD8
 004BAB84    lea         edx,[ebx+4C]
 004BAB87    mov         eax,dword ptr [ebx+8]
 004BAB8A    call        CreateWindowEx
 004BAB8F    mov         dword ptr [esi+258],eax
 004BAB95    lea         eax,[ebp-4]
 004BAB98    mov         edx,dword ptr [ebx]
 004BAB9A    call        @UStrFromPWChar
 004BAB9F    mov         eax,dword ptr [ebp-4]
 004BABA2    push        eax
 004BABA3    xor         ecx,ecx
 004BABA5    mov         edx,0C
 004BABAA    mov         eax,dword ptr [esi+258]
 004BABB0    call        SendTextMessage
 004BABB5    xor         eax,eax
 004BABB7    pop         edx
 004BABB8    pop         ecx
 004BABB9    pop         ecx
 004BABBA    mov         dword ptr fs:[eax],edx
 004BABBD    push        4BABD2
 004BABC2    lea         eax,[ebp-4]
 004BABC5    call        @UStrClr
 004BABCA    ret
>004BABCB    jmp         @HandleFinally
>004BABD0    jmp         004BABC2
 004BABD2    pop         edi
 004BABD3    pop         esi
 004BABD4    pop         ebx
 004BABD5    pop         ecx
 004BABD6    pop         ebp
 004BABD7    ret
*}
end;

//004BABDC
function TCustomMemo.GetCaretPos:TPoint;
begin
{*
 004BABDC    push        ebx
 004BABDD    push        esi
 004BABDE    mov         esi,edx
 004BABE0    mov         ebx,eax
 004BABE2    push        0
 004BABE4    push        0
 004BABE6    push        0B0
 004BABEB    mov         eax,ebx
 004BABED    call        TWinControl.GetHandle
 004BABF2    push        eax
 004BABF3    call        user32.SendMessageW
 004BABF8    shr         eax,10
 004BABFB    and         eax,0FFFF
 004BAC00    mov         dword ptr [esi],eax
 004BAC02    push        0
 004BAC04    mov         eax,dword ptr [esi]
 004BAC06    push        eax
 004BAC07    push        0C9
 004BAC0C    mov         eax,ebx
 004BAC0E    call        TWinControl.GetHandle
 004BAC13    push        eax
 004BAC14    call        user32.SendMessageW
 004BAC19    mov         dword ptr [esi+4],eax
 004BAC1C    push        0
 004BAC1E    push        0FF
 004BAC20    push        0BB
 004BAC25    mov         eax,ebx
 004BAC27    call        TWinControl.GetHandle
 004BAC2C    push        eax
 004BAC2D    call        user32.SendMessageW
 004BAC32    sub         dword ptr [esi],eax
 004BAC34    pop         esi
 004BAC35    pop         ebx
 004BAC36    ret
*}
end;

//004BAC38
procedure TCustomMemo.IsTouchPropertyStored(AProperty:TTouchProperty);
begin
{*
 004BAC38    push        ebx
 004BAC39    push        esi
 004BAC3A    mov         ebx,edx
 004BAC3C    mov         esi,eax
 004BAC3E    mov         edx,ebx
 004BAC40    mov         eax,esi
 004BAC42    call        TControl.IsTouchPropertyStored
 004BAC47    sub         bl,1
>004BAC4A    jb          004BAC50
>004BAC4C    je          004BAC66
>004BAC4E    jmp         004BAC79
 004BAC50    mov         eax,dword ptr [esi+0AC]
 004BAC56    movzx       edx,byte ptr ds:[4BAC7C]
 004BAC5D    cmp         dl,byte ptr [eax+10]
 004BAC60    setne       al
 004BAC63    pop         esi
 004BAC64    pop         ebx
 004BAC65    ret
 004BAC66    mov         eax,dword ptr [esi+0AC]
 004BAC6C    movzx       edx,byte ptr ds:[4BAC80]
 004BAC73    cmp         dl,byte ptr [eax+11]
 004BAC76    setne       al
 004BAC79    pop         esi
 004BAC7A    pop         ebx
 004BAC7B    ret
*}
end;

//004BAC84
procedure TCustomMemo.SetCaretPos(const Value:TPoint);
begin
{*
 004BAC84    push        ebx
 004BAC85    push        esi
 004BAC86    mov         esi,edx
 004BAC88    mov         ebx,eax
 004BAC8A    push        0
 004BAC8C    mov         eax,dword ptr [esi+4]
 004BAC8F    push        eax
 004BAC90    push        0BB
 004BAC95    mov         eax,ebx
 004BAC97    call        TWinControl.GetHandle
 004BAC9C    push        eax
 004BAC9D    call        user32.SendMessageW
 004BACA2    add         eax,dword ptr [esi]
 004BACA4    mov         esi,eax
 004BACA6    push        esi
 004BACA7    push        esi
 004BACA8    push        0B1
 004BACAD    mov         eax,ebx
 004BACAF    call        TWinControl.GetHandle
 004BACB4    push        eax
 004BACB5    call        user32.SendMessageW
 004BACBA    pop         esi
 004BACBB    pop         ebx
 004BACBC    ret
*}
end;

//004BACC0
procedure TCustomMemo.Loaded;
begin
{*
 004BACC0    push        ebx
 004BACC1    mov         ebx,eax
 004BACC3    mov         eax,ebx
 004BACC5    call        TControl.Loaded
 004BACCA    xor         edx,edx
 004BACCC    mov         eax,ebx
 004BACCE    call        TCustomEdit.SetModified
 004BACD3    pop         ebx
 004BACD4    ret
*}
end;

//004BACD8
procedure TCustomMemo.SetLines(Value:TStrings);
begin
{*
 004BACD8    push        esi
 004BACD9    push        edi
 004BACDA    mov         edi,edx
 004BACDC    mov         esi,eax
 004BACDE    mov         edx,edi
 004BACE0    mov         eax,dword ptr [esi+2A0]
 004BACE6    mov         ecx,dword ptr [eax]
 004BACE8    call        dword ptr [ecx+8]
 004BACEB    pop         edi
 004BACEC    pop         esi
 004BACED    ret
*}
end;

//004BACF0
procedure TCustomMemo.SetScrollBars(Value:TScrollStyle);
begin
{*
 004BACF0    cmp         dl,byte ptr [eax+2A4]
>004BACF6    je          004BAD03
 004BACF8    mov         byte ptr [eax+2A4],dl
 004BACFE    call        TWinControl.RecreateWnd
 004BAD03    ret
*}
end;

//004BAD04
procedure TCustomMemo.SetWordWrap(Value:Boolean);
begin
{*
 004BAD04    cmp         dl,byte ptr [eax+2A5]
>004BAD0A    je          004BAD17
 004BAD0C    mov         byte ptr [eax+2A5],dl
 004BAD12    call        TWinControl.RecreateWnd
 004BAD17    ret
*}
end;

//004BAD18
procedure TCustomMemo.WMGetDlgCode(var Message:TWMGetDlgCode);
begin
{*
 004BAD18    push        ebx
 004BAD19    push        esi
 004BAD1A    mov         esi,edx
 004BAD1C    mov         ebx,eax
 004BAD1E    mov         edx,esi
 004BAD20    mov         eax,ebx
 004BAD22    mov         ecx,dword ptr [eax]
 004BAD24    call        dword ptr [ecx-10]
 004BAD27    cmp         byte ptr [ebx+2A7],0
>004BAD2E    je          004BAD36
 004BAD30    or          dword ptr [esi+0C],2
>004BAD34    jmp         004BAD3A
 004BAD36    and         dword ptr [esi+0C],0FFFFFFFD
 004BAD3A    cmp         byte ptr [ebx+2A6],0
>004BAD41    jne         004BAD47
 004BAD43    and         dword ptr [esi+0C],0FFFFFFFB
 004BAD47    pop         esi
 004BAD48    pop         ebx
 004BAD49    ret
*}
end;

//004BAD4C
procedure TCustomMemo.WMNCDestroy(var Message:TWMNCDestroy);
begin
{*
 004BAD4C    call        TWinControl.WMNCDestroy
 004BAD51    ret
*}
end;

//004BAD54
procedure TCustomMemo.KeyPress(var Key:Char);
begin
{*
 004BAD54    push        ebx
 004BAD55    push        esi
 004BAD56    mov         esi,edx
 004BAD58    mov         ebx,eax
 004BAD5A    mov         edx,esi
 004BAD5C    mov         eax,ebx
 004BAD5E    call        TWinControl.KeyPress
 004BAD63    cmp         word ptr [esi],0D
>004BAD67    jne         004BAD77
 004BAD69    cmp         byte ptr [ebx+2A6],0
>004BAD70    jne         004BAD77
 004BAD72    mov         word ptr [esi],0
 004BAD77    pop         esi
 004BAD78    pop         ebx
 004BAD79    ret
*}
end;

//004BAD7C
constructor TCustomComboBoxStrings.Create();
begin
{*
 004BAD7C    push        ebx
 004BAD7D    push        esi
 004BAD7E    test        dl,dl
>004BAD80    je          004BAD8A
 004BAD82    add         esp,0FFFFFFF0
 004BAD85    call        @ClassCreate
 004BAD8A    mov         ebx,edx
 004BAD8C    mov         esi,eax
 004BAD8E    xor         edx,edx
 004BAD90    mov         eax,esi
 004BAD92    call        TStrings.Create
 004BAD97    mov         eax,esi
 004BAD99    test        bl,bl
>004BAD9B    je          004BADAC
 004BAD9D    call        @AfterConstruction
 004BADA2    pop         dword ptr fs:[0]
 004BADA9    add         esp,0C
 004BADAC    mov         eax,esi
 004BADAE    pop         esi
 004BADAF    pop         ebx
 004BADB0    ret
*}
end;

//004BADB4
destructor TCustomComboBoxStrings.Destroy();
begin
{*
 004BADB4    push        ebx
 004BADB5    push        esi
 004BADB6    call        @BeforeDestruction
 004BADBB    mov         ebx,edx
 004BADBD    mov         esi,eax
 004BADBF    mov         edx,ebx
 004BADC1    and         dl,0FC
 004BADC4    mov         eax,esi
 004BADC6    call        TStrings.Destroy
 004BADCB    test        bl,bl
>004BADCD    jle         004BADD6
 004BADCF    mov         eax,esi
 004BADD1    call        @ClassDestroy
 004BADD6    pop         esi
 004BADD7    pop         ebx
 004BADD8    ret
*}
end;

//004BADDC
function TCustomComboBoxStrings.GetCount:Integer;
begin
{*
 004BADDC    push        ebx
 004BADDD    mov         ebx,eax
 004BADDF    push        0
 004BADE1    push        0
 004BADE3    push        146
 004BADE8    mov         eax,dword ptr [ebx+2C]
 004BADEB    call        TWinControl.GetHandle
 004BADF0    push        eax
 004BADF1    call        user32.SendMessageW
 004BADF6    pop         ebx
 004BADF7    ret
*}
end;

//004BADF8
function TCustomComboBoxStrings.GetObject(Index:Integer):TObject;
begin
{*
 004BADF8    push        ebp
 004BADF9    mov         ebp,esp
 004BADFB    push        0
 004BADFD    push        ebx
 004BADFE    push        esi
 004BADFF    push        edi
 004BAE00    mov         esi,edx
 004BAE02    mov         ebx,eax
 004BAE04    xor         eax,eax
 004BAE06    push        ebp
 004BAE07    push        4BAE7A
 004BAE0C    push        dword ptr fs:[eax]
 004BAE0F    mov         dword ptr fs:[eax],esp
 004BAE12    push        0
 004BAE14    push        esi
 004BAE15    push        150
 004BAE1A    mov         eax,dword ptr [ebx+2C]
 004BAE1D    call        TWinControl.GetHandle
 004BAE22    push        eax
 004BAE23    call        user32.SendMessageW
 004BAE28    mov         edi,eax
 004BAE2A    cmp         edi,0FFFFFFFF
>004BAE2D    jne         004BAE62
 004BAE2F    mov         eax,ebx
 004BAE31    mov         edx,dword ptr [eax]
 004BAE33    call        dword ptr [edx+14]
 004BAE36    test        eax,eax
>004BAE38    je          004BAE49
 004BAE3A    test        esi,esi
>004BAE3C    jl          004BAE49
 004BAE3E    mov         eax,ebx
 004BAE40    mov         edx,dword ptr [eax]
 004BAE42    call        dword ptr [edx+14]
 004BAE45    cmp         esi,eax
>004BAE47    jle         004BAE62
 004BAE49    lea         edx,[ebp-4]
 004BAE4C    mov         eax,[0078D7A0];^SResString132:TResStringRec
 004BAE51    call        LoadResString
 004BAE56    mov         edx,dword ptr [ebp-4]
 004BAE59    mov         ecx,esi
 004BAE5B    mov         eax,ebx
 004BAE5D    call        TStrings.Error
 004BAE62    mov         ebx,edi
 004BAE64    xor         eax,eax
 004BAE66    pop         edx
 004BAE67    pop         ecx
 004BAE68    pop         ecx
 004BAE69    mov         dword ptr fs:[eax],edx
 004BAE6C    push        4BAE81
 004BAE71    lea         eax,[ebp-4]
 004BAE74    call        @UStrClr
 004BAE79    ret
>004BAE7A    jmp         @HandleFinally
>004BAE7F    jmp         004BAE71
 004BAE81    mov         eax,ebx
 004BAE83    pop         edi
 004BAE84    pop         esi
 004BAE85    pop         ebx
 004BAE86    pop         ecx
 004BAE87    pop         ebp
 004BAE88    ret
*}
end;

//004BAE8C
procedure TCustomComboBoxStrings.PutObject(Index:Integer; AObject:TObject);
begin
{*
 004BAE8C    push        ebx
 004BAE8D    push        esi
 004BAE8E    push        edi
 004BAE8F    mov         edi,ecx
 004BAE91    mov         esi,edx
 004BAE93    mov         ebx,eax
 004BAE95    push        edi
 004BAE96    push        esi
 004BAE97    push        151
 004BAE9C    mov         eax,dword ptr [ebx+2C]
 004BAE9F    call        TWinControl.GetHandle
 004BAEA4    push        eax
 004BAEA5    call        user32.SendMessageW
 004BAEAA    pop         edi
 004BAEAB    pop         esi
 004BAEAC    pop         ebx
 004BAEAD    ret
*}
end;

//004BAEB0
function TCustomComboBoxStrings.Get(Index:Integer):UnicodeString;
begin
{*
 004BAEB0    push        ebx
 004BAEB1    push        esi
 004BAEB2    push        edi
 004BAEB3    mov         esi,ecx
 004BAEB5    mov         edi,edx
 004BAEB7    mov         ebx,eax
 004BAEB9    push        0
 004BAEBB    push        edi
 004BAEBC    push        149
 004BAEC1    mov         eax,dword ptr [ebx+2C]
 004BAEC4    call        TWinControl.GetHandle
 004BAEC9    push        eax
 004BAECA    call        user32.SendMessageW
 004BAECF    cmp         eax,0FFFFFFFF
>004BAED2    je          004BAEFE
 004BAED4    test        eax,eax
>004BAED6    jle         004BAEFE
 004BAED8    mov         edx,esi
 004BAEDA    xchg        eax,edx
 004BAEDB    call        @UStrSetLength
 004BAEE0    mov         eax,dword ptr [esi]
 004BAEE2    call        @UStrToPWChar
 004BAEE7    push        eax
 004BAEE8    push        edi
 004BAEE9    push        148
 004BAEEE    mov         eax,dword ptr [ebx+2C]
 004BAEF1    call        TWinControl.GetHandle
 004BAEF6    push        eax
 004BAEF7    call        user32.SendMessageW
>004BAEFC    jmp         004BAF07
 004BAEFE    mov         eax,esi
 004BAF00    xor         edx,edx
 004BAF02    call        @UStrSetLength
 004BAF07    pop         edi
 004BAF08    pop         esi
 004BAF09    pop         ebx
 004BAF0A    ret
*}
end;

//004BAF0C
procedure TCustomComboBoxStrings.Clear;
begin
{*
 004BAF0C    push        ebp
 004BAF0D    mov         ebp,esp
 004BAF0F    push        0
 004BAF11    push        ebx
 004BAF12    mov         ebx,eax
 004BAF14    xor         eax,eax
 004BAF16    push        ebp
 004BAF17    push        4BAF70
 004BAF1C    push        dword ptr fs:[eax]
 004BAF1F    mov         dword ptr fs:[eax],esp
 004BAF22    lea         edx,[ebp-4]
 004BAF25    mov         eax,dword ptr [ebx+2C]
 004BAF28    call        TControl.GetText
 004BAF2D    push        0
 004BAF2F    push        0
 004BAF31    push        14B
 004BAF36    mov         eax,dword ptr [ebx+2C]
 004BAF39    call        TWinControl.GetHandle
 004BAF3E    push        eax
 004BAF3F    call        user32.SendMessageW
 004BAF44    mov         edx,dword ptr [ebp-4]
 004BAF47    mov         eax,dword ptr [ebx+2C]
 004BAF4A    call        TControl.SetText
 004BAF4F    mov         eax,dword ptr [ebx+2C]
 004BAF52    mov         edx,dword ptr [eax]
 004BAF54    call        dword ptr [edx+9C]
 004BAF5A    xor         eax,eax
 004BAF5C    pop         edx
 004BAF5D    pop         ecx
 004BAF5E    pop         ecx
 004BAF5F    mov         dword ptr fs:[eax],edx
 004BAF62    push        4BAF77
 004BAF67    lea         eax,[ebp-4]
 004BAF6A    call        @UStrClr
 004BAF6F    ret
>004BAF70    jmp         @HandleFinally
>004BAF75    jmp         004BAF67
 004BAF77    pop         ebx
 004BAF78    pop         ecx
 004BAF79    pop         ebp
 004BAF7A    ret
*}
end;

//004BAF7C
procedure TCustomComboBoxStrings.Delete(Index:Integer);
begin
{*
 004BAF7C    push        ebx
 004BAF7D    push        esi
 004BAF7E    mov         esi,edx
 004BAF80    mov         ebx,eax
 004BAF82    push        0
 004BAF84    push        esi
 004BAF85    push        144
 004BAF8A    mov         eax,dword ptr [ebx+2C]
 004BAF8D    call        TWinControl.GetHandle
 004BAF92    push        eax
 004BAF93    call        user32.SendMessageW
 004BAF98    pop         esi
 004BAF99    pop         ebx
 004BAF9A    ret
*}
end;

//004BAF9C
function TCustomComboBoxStrings.IndexOf(S:string):Integer;
begin
{*
 004BAF9C    push        ebx
 004BAF9D    push        esi
 004BAF9E    push        edi
 004BAF9F    mov         ebx,edx
 004BAFA1    mov         esi,eax
 004BAFA3    test        ebx,ebx
>004BAFA5    je          004BAFC1
 004BAFA7    push        ebx
 004BAFA8    mov         eax,dword ptr [esi+2C]
 004BAFAB    call        TWinControl.GetHandle
 004BAFB0    or          ecx,0FFFFFFFF
 004BAFB3    mov         edx,158
 004BAFB8    call        SendTextMessage
 004BAFBD    mov         edi,eax
>004BAFBF    jmp         004BAFFC
 004BAFC1    xor         ebx,ebx
 004BAFC3    xor         edi,edi
>004BAFC5    jmp         004BAFE6
 004BAFC7    push        0
 004BAFC9    push        edi
 004BAFCA    push        149
 004BAFCF    mov         eax,dword ptr [esi+2C]
 004BAFD2    call        TWinControl.GetHandle
 004BAFD7    push        eax
 004BAFD8    call        user32.SendMessageW
 004BAFDD    test        eax,eax
>004BAFDF    jne         004BAFE5
 004BAFE1    mov         bl,1
>004BAFE3    jmp         004BAFE6
 004BAFE5    inc         edi
 004BAFE6    test        bl,bl
>004BAFE8    jne         004BAFF5
 004BAFEA    mov         eax,esi
 004BAFEC    mov         edx,dword ptr [eax]
 004BAFEE    call        dword ptr [edx+14]
 004BAFF1    cmp         edi,eax
>004BAFF3    jl          004BAFC7
 004BAFF5    test        bl,bl
>004BAFF7    jne         004BAFFC
 004BAFF9    or          edi,0FFFFFFFF
 004BAFFC    mov         eax,edi
 004BAFFE    pop         edi
 004BAFFF    pop         esi
 004BB000    pop         ebx
 004BB001    ret
*}
end;

//004BB004
procedure TCustomComboBoxStrings.SetUpdateState(Updating:Boolean);
begin
{*
 004BB004    push        ebx
 004BB005    push        esi
 004BB006    mov         ebx,edx
 004BB008    mov         esi,eax
 004BB00A    push        0
 004BB00C    mov         eax,ebx
 004BB00E    xor         al,1
 004BB010    and         eax,7F
 004BB013    push        eax
 004BB014    push        0B
 004BB016    mov         eax,dword ptr [esi+2C]
 004BB019    call        TWinControl.GetHandle
 004BB01E    push        eax
 004BB01F    call        user32.SendMessageW
 004BB024    xor         bl,1
 004BB027    test        bl,bl
>004BB029    je          004BB033
 004BB02B    mov         eax,dword ptr [esi+2C]
 004BB02E    call        TControl.Refresh
 004BB033    pop         esi
 004BB034    pop         ebx
 004BB035    ret
*}
end;

//004BB038
function TComboBoxStrings.Add(S:string):Integer;
begin
{*
 004BB038    push        ebp
 004BB039    mov         ebp,esp
 004BB03B    push        0
 004BB03D    push        0
 004BB03F    push        ebx
 004BB040    push        esi
 004BB041    mov         esi,edx
 004BB043    mov         ebx,eax
 004BB045    xor         eax,eax
 004BB047    push        ebp
 004BB048    push        4BB0BF
 004BB04D    push        dword ptr fs:[eax]
 004BB050    mov         dword ptr fs:[eax],esp
 004BB053    lea         eax,[ebp-4]
 004BB056    mov         edx,esi
 004BB058    call        @UStrLAsg
 004BB05D    lea         eax,[ebp-4]
 004BB060    call        UniqueString
 004BB065    mov         eax,dword ptr [ebp-4]
 004BB068    push        eax
 004BB069    mov         eax,dword ptr [ebx+2C]
 004BB06C    call        TWinControl.GetHandle
 004BB071    xor         ecx,ecx
 004BB073    mov         edx,143
 004BB078    call        SendTextMessage
 004BB07D    mov         ebx,eax
 004BB07F    test        ebx,ebx
>004BB081    jge         004BB0A4
 004BB083    lea         edx,[ebp-8]
 004BB086    mov         eax,[0078CF84];^SResString280:TResStringRec
 004BB08B    call        LoadResString
 004BB090    mov         ecx,dword ptr [ebp-8]
 004BB093    mov         dl,1
 004BB095    mov         eax,[004391C8];EOutOfResources
 004BB09A    call        Exception.Create
 004BB09F    call        @RaiseExcept
 004BB0A4    xor         eax,eax
 004BB0A6    pop         edx
 004BB0A7    pop         ecx
 004BB0A8    pop         ecx
 004BB0A9    mov         dword ptr fs:[eax],edx
 004BB0AC    push        4BB0C6
 004BB0B1    lea         eax,[ebp-8]
 004BB0B4    mov         edx,2
 004BB0B9    call        @UStrArrayClr
 004BB0BE    ret
>004BB0BF    jmp         @HandleFinally
>004BB0C4    jmp         004BB0B1
 004BB0C6    mov         eax,ebx
 004BB0C8    pop         esi
 004BB0C9    pop         ebx
 004BB0CA    pop         ecx
 004BB0CB    pop         ecx
 004BB0CC    pop         ebp
 004BB0CD    ret
*}
end;

//004BB0D0
procedure TComboBoxStrings.Insert(Index:Integer; S:string);
begin
{*
 004BB0D0    push        ebp
 004BB0D1    mov         ebp,esp
 004BB0D3    push        0
 004BB0D5    push        0
 004BB0D7    push        ebx
 004BB0D8    push        esi
 004BB0D9    push        edi
 004BB0DA    mov         edi,ecx
 004BB0DC    mov         esi,edx
 004BB0DE    mov         ebx,eax
 004BB0E0    xor         eax,eax
 004BB0E2    push        ebp
 004BB0E3    push        4BB158
 004BB0E8    push        dword ptr fs:[eax]
 004BB0EB    mov         dword ptr fs:[eax],esp
 004BB0EE    lea         eax,[ebp-4]
 004BB0F1    mov         edx,edi
 004BB0F3    call        @UStrLAsg
 004BB0F8    lea         eax,[ebp-4]
 004BB0FB    call        UniqueString
 004BB100    mov         eax,dword ptr [ebp-4]
 004BB103    push        eax
 004BB104    mov         eax,dword ptr [ebx+2C]
 004BB107    call        TWinControl.GetHandle
 004BB10C    mov         ecx,esi
 004BB10E    mov         edx,14A
 004BB113    call        SendTextMessage
 004BB118    test        eax,eax
>004BB11A    jge         004BB13D
 004BB11C    lea         edx,[ebp-8]
 004BB11F    mov         eax,[0078CF84];^SResString280:TResStringRec
 004BB124    call        LoadResString
 004BB129    mov         ecx,dword ptr [ebp-8]
 004BB12C    mov         dl,1
 004BB12E    mov         eax,[004391C8];EOutOfResources
 004BB133    call        Exception.Create
 004BB138    call        @RaiseExcept
 004BB13D    xor         eax,eax
 004BB13F    pop         edx
 004BB140    pop         ecx
 004BB141    pop         ecx
 004BB142    mov         dword ptr fs:[eax],edx
 004BB145    push        4BB15F
 004BB14A    lea         eax,[ebp-8]
 004BB14D    mov         edx,2
 004BB152    call        @UStrArrayClr
 004BB157    ret
>004BB158    jmp         @HandleFinally
>004BB15D    jmp         004BB14A
 004BB15F    pop         edi
 004BB160    pop         esi
 004BB161    pop         ebx
 004BB162    pop         ecx
 004BB163    pop         ecx
 004BB164    pop         ebp
 004BB165    ret
*}
end;

//004BB168
constructor TCustomCombo.Create;
begin
{*
 004BB168    push        ebp
 004BB169    mov         ebp,esp
 004BB16B    push        ecx
 004BB16C    push        ebx
 004BB16D    push        esi
 004BB16E    test        dl,dl
>004BB170    je          004BB17A
 004BB172    add         esp,0FFFFFFF0
 004BB175    call        @ClassCreate
 004BB17A    mov         byte ptr [ebp-1],dl
 004BB17D    mov         ebx,eax
 004BB17F    xor         edx,edx
 004BB181    mov         eax,ebx
 004BB183    call        TCustomListControl.Create
 004BB188    mov         eax,[0078D264];^NewStyleControls:Boolean
 004BB18D    cmp         byte ptr [eax],0
>004BB190    je          004BB19C
 004BB192    mov         eax,[004BB260]
 004BB197    mov         dword ptr [ebx+50],eax
>004BB19A    jmp         004BB1A4
 004BB19C    mov         eax,[004BB264]
 004BB1A1    mov         dword ptr [ebx+50],eax
 004BB1A4    mov         edx,91
 004BB1A9    mov         eax,ebx
 004BB1AB    call        TControl.SetWidth
 004BB1B0    mov         edx,19
 004BB1B5    mov         eax,ebx
 004BB1B7    call        TControl.SetHeight
 004BB1BC    mov         dl,1
 004BB1BE    mov         eax,ebx
 004BB1C0    call        TWinControl.SetTabStop
 004BB1C5    xor         edx,edx
 004BB1C7    mov         eax,ebx
 004BB1C9    call        TControl.SetParentColor
 004BB1CE    mov         dl,1
 004BB1D0    mov         eax,[00476D34];TControlCanvas
 004BB1D5    call        TCanvas.Create
 004BB1DA    mov         esi,eax
 004BB1DC    mov         dword ptr [ebx+270],esi
 004BB1E2    mov         eax,esi
 004BB1E4    mov         edx,ebx
 004BB1E6    call        TControlCanvas.SetControl
 004BB1EB    mov         dword ptr [ebx+2A8],10
 004BB1F5    push        ebx
 004BB1F6    mov         eax,dword ptr [ebx]
 004BB1F8    mov         eax,dword ptr [eax+11C]
 004BB1FE    push        eax
 004BB1FF    call        MakeObjectInstance
 004BB204    mov         dword ptr [ebx+2CC],eax
 004BB20A    push        ebx
 004BB20B    push        4BB7C8;TCustomCombo.ListWndProc
 004BB210    call        MakeObjectInstance
 004BB215    mov         dword ptr [ebx+2D0],eax
 004BB21B    mov         dword ptr [ebx+278],8
 004BB225    mov         dword ptr [ebx+280],0FFFFFFFF
 004BB22F    mov         dword ptr [ebx+2C8],0FFFFFFFF
 004BB239    mov         byte ptr [ebx+27C],0
 004BB240    mov         eax,ebx
 004BB242    cmp         byte ptr [ebp-1],0
>004BB246    je          004BB257
 004BB248    call        @AfterConstruction
 004BB24D    pop         dword ptr fs:[0]
 004BB254    add         esp,0C
 004BB257    mov         eax,ebx
 004BB259    pop         esi
 004BB25A    pop         ebx
 004BB25B    pop         ecx
 004BB25C    pop         ebp
 004BB25D    ret
*}
end;

//004BB268
destructor TCustomCombo.Destroy();
begin
{*
 004BB268    push        ebx
 004BB269    push        esi
 004BB26A    call        @BeforeDestruction
 004BB26F    mov         ebx,edx
 004BB271    mov         esi,eax
 004BB273    mov         eax,esi
 004BB275    call        TWinControl.HandleAllocated
 004BB27A    test        al,al
>004BB27C    je          004BB288
 004BB27E    mov         eax,esi
 004BB280    mov         edx,dword ptr [eax]
 004BB282    call        dword ptr [edx+0C4]
 004BB288    mov         eax,dword ptr [esi+2D0]
 004BB28E    call        FreeObjectInstance
 004BB293    mov         eax,dword ptr [esi+2CC]
 004BB299    call        FreeObjectInstance
 004BB29E    mov         eax,dword ptr [esi+270]
 004BB2A4    call        TObject.Free
 004BB2A9    mov         edx,ebx
 004BB2AB    and         dl,0FC
 004BB2AE    mov         eax,esi
 004BB2B0    call        TWinControl.Destroy
 004BB2B5    test        bl,bl
>004BB2B7    jle         004BB2C0
 004BB2B9    mov         eax,esi
 004BB2BB    call        @ClassDestroy
 004BB2C0    pop         esi
 004BB2C1    pop         ebx
 004BB2C2    ret
*}
end;

//004BB2C4
procedure TCustomCombo.Clear;
begin
{*
 004BB2C4    push        ebx
 004BB2C5    mov         ebx,eax
 004BB2C7    mov         edx,4BB2EC
 004BB2CC    mov         eax,ebx
 004BB2CE    call        TControl.SetTextBuf
 004BB2D3    mov         eax,dword ptr [ebx+2AC]
 004BB2D9    mov         edx,dword ptr [eax]
 004BB2DB    call        dword ptr [edx+44]
 004BB2DE    mov         dword ptr [ebx+2C8],0FFFFFFFF
 004BB2E8    pop         ebx
 004BB2E9    ret
*}
end;

//004BB2F0
procedure TCustomCombo.DestroyWindowHandle;
begin
{*
 004BB2F0    push        ebx
 004BB2F1    mov         ebx,eax
 004BB2F3    mov         eax,ebx
 004BB2F5    call        TWinControl.DestroyWindowHandle
 004BB2FA    xor         eax,eax
 004BB2FC    mov         dword ptr [ebx+2B0],eax
 004BB302    xor         eax,eax
 004BB304    mov         dword ptr [ebx+2B4],eax
 004BB30A    xor         eax,eax
 004BB30C    mov         dword ptr [ebx+2B8],eax
 004BB312    pop         ebx
 004BB313    ret
*}
end;

//004BB314
procedure TCustomCombo.SelectAll;
begin
{*
 004BB314    push        ebx
 004BB315    mov         ebx,eax
 004BB317    push        0FFFF0000
 004BB31C    push        0
 004BB31E    push        142
 004BB323    mov         eax,ebx
 004BB325    call        TWinControl.GetHandle
 004BB32A    push        eax
 004BB32B    call        user32.SendMessageW
 004BB330    pop         ebx
 004BB331    ret
*}
end;

//004BB334
function TCustomCombo.GetDroppedDown:Boolean;
begin
{*
 004BB334    push        ebx
 004BB335    mov         ebx,eax
 004BB337    push        0
 004BB339    push        0
 004BB33B    push        157
 004BB340    mov         eax,ebx
 004BB342    call        TWinControl.GetHandle
 004BB347    push        eax
 004BB348    call        user32.SendMessageW
 004BB34D    cmp         eax,1
 004BB350    sbb         eax,eax
 004BB352    inc         eax
 004BB353    pop         ebx
 004BB354    ret
*}
end;

//004BB358
procedure TCustomCombo.SetDroppedDown(Value:Boolean);
begin
{*
 004BB358    push        ebx
 004BB359    push        esi
 004BB35A    add         esp,0FFFFFFF0
 004BB35D    mov         ebx,edx
 004BB35F    mov         esi,eax
 004BB361    push        0
 004BB363    movzx       eax,bl
 004BB366    push        eax
 004BB367    push        14F
 004BB36C    mov         eax,esi
 004BB36E    call        TWinControl.GetHandle
 004BB373    push        eax
 004BB374    call        user32.SendMessageW
 004BB379    mov         edx,esp
 004BB37B    mov         eax,esi
 004BB37D    mov         ecx,dword ptr [eax]
 004BB37F    call        dword ptr [ecx+54]
 004BB382    push        0FF
 004BB384    lea         eax,[esp+4]
 004BB388    push        eax
 004BB389    mov         eax,esi
 004BB38B    call        TWinControl.GetHandle
 004BB390    push        eax
 004BB391    call        user32.InvalidateRect
 004BB396    add         esp,10
 004BB399    pop         esi
 004BB39A    pop         ebx
 004BB39B    ret
*}
end;

//004BB39C
function TCustomCombo.GetItemIndex:Integer;
begin
{*
 004BB39C    push        ebx
 004BB39D    mov         ebx,eax
 004BB39F    test        byte ptr [ebx+1C],1
>004BB3A3    je          004BB3AD
 004BB3A5    mov         eax,dword ptr [ebx+280]
 004BB3AB    pop         ebx
 004BB3AC    ret
 004BB3AD    push        0
 004BB3AF    push        0
 004BB3B1    push        147
 004BB3B6    mov         eax,ebx
 004BB3B8    call        TWinControl.GetHandle
 004BB3BD    push        eax
 004BB3BE    call        user32.SendMessageW
 004BB3C3    pop         ebx
 004BB3C4    ret
*}
end;

//004BB3C8
procedure TCustomCombo.SetItemIndex(const Value:Integer);
begin
{*
 004BB3C8    push        ebx
 004BB3C9    push        esi
 004BB3CA    mov         esi,edx
 004BB3CC    mov         ebx,eax
 004BB3CE    test        byte ptr [ebx+1C],1
>004BB3D2    je          004BB3DD
 004BB3D4    mov         dword ptr [ebx+280],esi
 004BB3DA    pop         esi
 004BB3DB    pop         ebx
 004BB3DC    ret
 004BB3DD    mov         eax,ebx
 004BB3DF    mov         edx,dword ptr [eax]
 004BB3E1    call        dword ptr [edx+0EC]
 004BB3E7    cmp         esi,eax
>004BB3E9    je          004BB400
 004BB3EB    push        0
 004BB3ED    push        esi
 004BB3EE    push        14E
 004BB3F3    mov         eax,ebx
 004BB3F5    call        TWinControl.GetHandle
 004BB3FA    push        eax
 004BB3FB    call        user32.SendMessageW
 004BB400    pop         esi
 004BB401    pop         ebx
 004BB402    ret
*}
end;

//004BB404
function TCustomCombo.GetSelStart:Integer;
begin
{*
 004BB404    push        ebx
 004BB405    add         esp,0FFFFFFF8
 004BB408    mov         ebx,eax
 004BB40A    lea         eax,[esp+4]
 004BB40E    push        eax
 004BB40F    mov         eax,ebx
 004BB411    call        TWinControl.GetHandle
 004BB416    lea         ecx,[esp+4]
 004BB41A    mov         edx,140
 004BB41F    call        SendGetIntMessage
 004BB424    mov         eax,dword ptr [esp]
 004BB427    pop         ecx
 004BB428    pop         edx
 004BB429    pop         ebx
 004BB42A    ret
*}
end;

//004BB42C
procedure TCustomCombo.SetSelStart(Value:Integer);
begin
{*
 004BB42C    push        ebx
 004BB42D    add         esp,0FFFFFFF8
 004BB430    mov         ebx,eax
 004BB432    mov         dword ptr [esp],edx
 004BB435    mov         dword ptr [esp+4],edx
 004BB439    movzx       eax,word ptr [esp]
 004BB43D    movzx       edx,word ptr [esp+4]
 004BB442    shl         edx,10
 004BB445    or          eax,edx
 004BB447    push        eax
 004BB448    push        0
 004BB44A    push        142
 004BB44F    mov         eax,ebx
 004BB451    call        TWinControl.GetHandle
 004BB456    push        eax
 004BB457    call        user32.SendMessageW
 004BB45C    pop         ecx
 004BB45D    pop         edx
 004BB45E    pop         ebx
 004BB45F    ret
*}
end;

//004BB460
function TCustomCombo.GetSelLength:Integer;
begin
{*
 004BB460    push        ebx
 004BB461    add         esp,0FFFFFFF8
 004BB464    mov         ebx,eax
 004BB466    lea         eax,[esp+4]
 004BB46A    push        eax
 004BB46B    mov         eax,ebx
 004BB46D    call        TWinControl.GetHandle
 004BB472    lea         ecx,[esp+4]
 004BB476    mov         edx,140
 004BB47B    call        SendGetIntMessage
 004BB480    mov         eax,dword ptr [esp+4]
 004BB484    sub         eax,dword ptr [esp]
 004BB487    pop         ecx
 004BB488    pop         edx
 004BB489    pop         ebx
 004BB48A    ret
*}
end;

//004BB48C
procedure TCustomCombo.SetSelLength(Value:Integer);
begin
{*
 004BB48C    push        ebx
 004BB48D    push        esi
 004BB48E    add         esp,0FFFFFFF8
 004BB491    mov         esi,edx
 004BB493    mov         ebx,eax
 004BB495    lea         eax,[esp+4]
 004BB499    push        eax
 004BB49A    mov         eax,ebx
 004BB49C    call        TWinControl.GetHandle
 004BB4A1    lea         ecx,[esp+4]
 004BB4A5    mov         edx,140
 004BB4AA    call        SendGetIntMessage
 004BB4AF    add         esi,dword ptr [esp]
 004BB4B2    mov         dword ptr [esp+4],esi
 004BB4B6    movzx       eax,word ptr [esp]
 004BB4BA    movzx       edx,word ptr [esp+4]
 004BB4BF    shl         edx,10
 004BB4C2    or          eax,edx
 004BB4C4    push        eax
 004BB4C5    push        0
 004BB4C7    push        142
 004BB4CC    mov         eax,ebx
 004BB4CE    call        TWinControl.GetHandle
 004BB4D3    push        eax
 004BB4D4    call        user32.SendMessageW
 004BB4D9    pop         ecx
 004BB4DA    pop         edx
 004BB4DB    pop         esi
 004BB4DC    pop         ebx
 004BB4DD    ret
*}
end;

//004BB4E0
procedure TCustomCombo.SetMaxLength(Value:Integer);
begin
{*
 004BB4E0    push        ebx
 004BB4E1    push        esi
 004BB4E2    mov         esi,edx
 004BB4E4    mov         ebx,eax
 004BB4E6    test        esi,esi
>004BB4E8    jge         004BB4EC
 004BB4EA    xor         esi,esi
 004BB4EC    cmp         esi,dword ptr [ebx+274]
>004BB4F2    je          004BB51A
 004BB4F4    mov         dword ptr [ebx+274],esi
 004BB4FA    mov         eax,ebx
 004BB4FC    call        TWinControl.HandleAllocated
 004BB501    test        al,al
>004BB503    je          004BB51A
 004BB505    push        0
 004BB507    push        esi
 004BB508    push        141
 004BB50D    mov         eax,ebx
 004BB50F    call        TWinControl.GetHandle
 004BB514    push        eax
 004BB515    call        user32.SendMessageW
 004BB51A    pop         esi
 004BB51B    pop         ebx
 004BB51C    ret
*}
end;

//004BB520
procedure TCustomCombo.SetItemHeight(Value:Integer);
begin
{*
 004BB520    test        edx,edx
>004BB522    jle         004BB52F
 004BB524    mov         dword ptr [eax+2A8],edx
 004BB52A    call        TWinControl.RecreateWnd
 004BB52F    ret
*}
end;

//004BB530
procedure TCustomCombo.WMCreate(var Message:TWMCreate);
begin
{*
 004BB530    push        esi
 004BB531    mov         esi,eax
 004BB533    mov         eax,esi
 004BB535    mov         ecx,dword ptr [eax]
 004BB537    call        dword ptr [ecx-10]
 004BB53A    cmp         dword ptr [esi+174],0
>004BB541    je          004BB557
 004BB543    mov         eax,dword ptr [esi+174]
 004BB549    push        eax
 004BB54A    mov         eax,esi
 004BB54C    call        TWinControl.GetHandle
 004BB551    push        eax
 004BB552    call        user32.SetWindowTextW
 004BB557    pop         esi
 004BB558    ret
*}
end;

//004BB55C
procedure TCustomCombo.WMDrawItem(var Message:TWMDrawItem);
begin
{*
 004BB55C    mov         ecx,dword ptr [eax]
 004BB55E    call        dword ptr [ecx-10];TWinControl.DefaultHandler
 004BB561    ret
*}
end;

//004BB564
procedure TCustomCombo.WMMeasureItem(var Message:TWMMeasureItem);
begin
{*
 004BB564    mov         ecx,dword ptr [eax]
 004BB566    call        dword ptr [ecx-10];TWinControl.DefaultHandler
 004BB569    ret
*}
end;

//004BB56C
procedure TCustomCombo.WMDeleteItem(var Message:TWMDeleteItem);
begin
{*
 004BB56C    mov         ecx,dword ptr [eax]
 004BB56E    call        dword ptr [ecx-10];TWinControl.DefaultHandler
 004BB571    ret
*}
end;

//004BB574
procedure TCustomCombo.WMGetDlgCode(var Message:TWMGetDlgCode);
begin
{*
 004BB574    push        ebx
 004BB575    push        esi
 004BB576    mov         esi,edx
 004BB578    mov         ebx,eax
 004BB57A    mov         edx,esi
 004BB57C    mov         eax,ebx
 004BB57E    mov         ecx,dword ptr [eax]
 004BB580    call        dword ptr [ecx-10]
 004BB583    mov         eax,ebx
 004BB585    call        TCustomCombo.GetDroppedDown
 004BB58A    test        al,al
>004BB58C    je          004BB592
 004BB58E    or          dword ptr [esi+0C],4
 004BB592    pop         esi
 004BB593    pop         ebx
 004BB594    ret
*}
end;

//004BB598
procedure TCustomCombo.CMCancelMode(var Message:TCMCancelMode);
begin
{*
 004BB598    cmp         eax,dword ptr [edx+8]
>004BB59B    je          004BB5AB
 004BB59D    push        0
 004BB59F    xor         ecx,ecx
 004BB5A1    mov         edx,14F
 004BB5A6    call        TControl.Perform
 004BB5AB    ret
*}
end;

//004BB5AC
procedure TCustomCombo.CMCtl3DChanged(var Message:TMessage);
begin
{*
 004BB5AC    push        ebx
 004BB5AD    push        esi
 004BB5AE    mov         esi,edx
 004BB5B0    mov         ebx,eax
 004BB5B2    mov         eax,[0078D264];^NewStyleControls:Boolean
 004BB5B7    cmp         byte ptr [eax],0
>004BB5BA    je          004BB5C3
 004BB5BC    mov         eax,ebx
 004BB5BE    call        TWinControl.RecreateWnd
 004BB5C3    mov         edx,esi
 004BB5C5    mov         eax,ebx
 004BB5C7    call        TWinControl.CMCtl3DChanged
 004BB5CC    pop         esi
 004BB5CD    pop         ebx
 004BB5CE    ret
*}
end;

//004BB5D0
procedure TCustomEdit.CMGestureManagerChanged(var Message:TMessage);
begin
{*
 004BB5D0    push        ebx
 004BB5D1    mov         ebx,eax
 004BB5D3    test        byte ptr [ebx+1C],8
>004BB5D7    jne         004BB611
 004BB5D9    mov         eax,dword ptr [ebx+0AC]
 004BB5DF    cmp         dword ptr [eax+0C],0
>004BB5E3    je          004BB5F2
 004BB5E5    mov         eax,[004BB614]
 004BB5EA    or          eax,dword ptr [ebx+50]
 004BB5ED    mov         dword ptr [ebx+50],eax
>004BB5F0    jmp         004BB5FF
 004BB5F2    mov         eax,[004BB614]
 004BB5F7    not         eax
 004BB5F9    and         eax,dword ptr [ebx+50]
 004BB5FC    mov         dword ptr [ebx+50],eax
 004BB5FF    mov         eax,ebx
 004BB601    call        TWinControl.HandleAllocated
 004BB606    test        al,al
>004BB608    je          004BB611
 004BB60A    mov         eax,ebx
 004BB60C    call        TWinControl.RecreateWnd
 004BB611    pop         ebx
 004BB612    ret
*}
end;

//004BB618
procedure TCustomComboBox.CMParentColorChanged(var Message:TMessage);
begin
{*
 004BB618    push        esi
 004BB619    mov         esi,eax
 004BB61B    mov         eax,esi
 004BB61D    call        TControl.CMParentColorChanged
 004BB622    mov         eax,[0078D264];^NewStyleControls:Boolean
 004BB627    cmp         byte ptr [eax],0
>004BB62A    jne         004BB63F
 004BB62C    cmp         byte ptr [esi+2E6],2
>004BB633    jae         004BB63F
 004BB635    mov         eax,esi
 004BB637    mov         edx,dword ptr [eax]
 004BB639    call        dword ptr [edx+90]
 004BB63F    pop         esi
 004BB640    ret
*}
end;

//004BB644
procedure TCustomCombo.EditWndProc(var Message:TMessage);
begin
{*
 004BB644    push        ebx
 004BB645    push        esi
 004BB646    push        edi
 004BB647    add         esp,0FFFFFFE0
 004BB64A    mov         esi,edx
 004BB64C    mov         ebx,eax
 004BB64E    cmp         dword ptr [esi],112
>004BB654    jne         004BB667
 004BB656    mov         edx,esi
 004BB658    mov         eax,ebx
 004BB65A    mov         ecx,dword ptr [eax]
 004BB65C    call        dword ptr [ecx+84]
>004BB662    jmp         004BB7C0
 004BB667    mov         eax,dword ptr [esi]
 004BB669    cmp         eax,100
>004BB66E    jb          004BB69C
 004BB670    cmp         eax,109
>004BB675    ja          004BB69C
 004BB677    mov         dl,1
 004BB679    mov         eax,ebx
 004BB67B    call        GetParentForm
 004BB680    mov         edi,eax
 004BB682    test        edi,edi
>004BB684    je          004BB69C
 004BB686    mov         ecx,esi
 004BB688    mov         edx,ebx
 004BB68A    mov         eax,edi
 004BB68C    mov         edi,dword ptr [eax]
 004BB68E    call        dword ptr [edi+118]
 004BB694    test        al,al
>004BB696    jne         004BB7C0
 004BB69C    mov         eax,dword ptr [ebx+2BC]
 004BB6A2    push        eax
 004BB6A3    mov         edx,esi
 004BB6A5    mov         ecx,dword ptr [ebx+2B0]
 004BB6AB    mov         eax,ebx
 004BB6AD    mov         edi,dword ptr [eax]
 004BB6AF    call        dword ptr [edi+118]
 004BB6B5    mov         eax,dword ptr [esi]
 004BB6B7    mov         edx,eax
 004BB6B9    cmp         edx,201
>004BB6BF    jg          004BB6D9
>004BB6C1    je          004BB6F2
 004BB6C3    sub         edx,30
>004BB6C6    je          004BB75A
 004BB6CC    sub         edx,1D0
>004BB6D2    je          004BB748
>004BB6D4    jmp         004BB7C0
 004BB6D9    sub         edx,203
>004BB6DF    je          004BB6F2
 004BB6E1    sub         edx,0AE4A
>004BB6E7    je          004BB77B
>004BB6ED    jmp         004BB7C0
 004BB6F2    mov         eax,ebx
 004BB6F4    call        TControl.GetDragMode
 004BB6F9    cmp         al,1
>004BB6FB    jne         004BB7C0
 004BB701    push        esp
 004BB702    call        user32.GetCursorPos
 004BB707    lea         ecx,[esp+8]
 004BB70B    mov         edx,esp
 004BB70D    mov         eax,ebx
 004BB70F    call        TControl.ScreenToClient
 004BB714    mov         eax,dword ptr [esp+8]
 004BB718    and         eax,0FFFF
 004BB71D    mov         edx,dword ptr [esp+0C]
 004BB721    shl         edx,10
 004BB724    or          eax,edx
 004BB726    push        eax
 004BB727    push        0
 004BB729    push        202
 004BB72E    mov         eax,dword ptr [ebx+2B0]
 004BB734    push        eax
 004BB735    call        user32.SendMessageW
 004BB73A    or          ecx,0FFFFFFFF
 004BB73D    xor         edx,edx
 004BB73F    mov         eax,ebx
 004BB741    call        TControl.BeginDrag
>004BB746    jmp         004BB7C0
 004BB748    mov         edx,dword ptr [esi+8]
 004BB74B    push        edx
 004BB74C    mov         ecx,dword ptr [esi+4]
 004BB74F    mov         edx,eax
 004BB751    mov         eax,ebx
 004BB753    call        TControl.Perform
>004BB758    jmp         004BB7C0
 004BB75A    mov         eax,[0078D264];^NewStyleControls:Boolean
 004BB75F    cmp         byte ptr [eax],0
>004BB762    je          004BB7C0
 004BB764    push        0
 004BB766    push        3
 004BB768    push        0D3
 004BB76D    mov         eax,dword ptr [ebx+2B0]
 004BB773    push        eax
 004BB774    call        user32.SendMessageW
>004BB779    jmp         004BB7C0
 004BB77B    cmp         byte ptr [ebx+27C],0
>004BB782    je          004BB7C0
 004BB784    lea         eax,[esp+10]
 004BB788    push        eax
 004BB789    mov         eax,dword ptr [ebx+2B0]
 004BB78F    push        eax
 004BB790    call        user32.GetWindowRect
 004BB795    push        2
 004BB797    lea         eax,[esp+14]
 004BB79B    push        eax
 004BB79C    mov         eax,dword ptr [ebx+2B0]
 004BB7A2    push        eax
 004BB7A3    push        0
 004BB7A5    call        user32.MapWindowPoints
 004BB7AA    lea         edx,[esp+10]
 004BB7AE    mov         eax,dword ptr [ebx+2B0]
 004BB7B4    call        PerformBufferedPrintClient
 004BB7B9    mov         byte ptr [ebx+27C],0
 004BB7C0    add         esp,20
 004BB7C3    pop         edi
 004BB7C4    pop         esi
 004BB7C5    pop         ebx
 004BB7C6    ret
*}
end;

//004BB7C8
procedure TCustomCombo.ListWndProc(var Message:TMessage);
begin
{*
 004BB7C8    push        ebx
 004BB7C9    mov         ecx,dword ptr [eax+2C0]
 004BB7CF    push        ecx
 004BB7D0    mov         ecx,dword ptr [eax+2B4]
 004BB7D6    mov         ebx,dword ptr [eax]
 004BB7D8    call        dword ptr [ebx+118]
 004BB7DE    pop         ebx
 004BB7DF    ret
*}
end;

//004BB7E0
procedure TCustomComboBox.SetCharCase(Value:TEditCharCase);
begin
{*
 004BB7E0    cmp         dl,byte ptr [eax+2E4]
>004BB7E6    je          004BB7F3
 004BB7E8    mov         byte ptr [eax+2E4],dl
 004BB7EE    call        TWinControl.RecreateWnd
 004BB7F3    ret
*}
end;

//004BB7F4
procedure TCustomComboBox.SetTextHint(const Value:UnicodeString);
begin
{*
 004BB7F4    push        ebx
 004BB7F5    push        esi
 004BB7F6    mov         esi,edx
 004BB7F8    mov         ebx,eax
 004BB7FA    mov         eax,dword ptr [ebx+308]
 004BB800    mov         edx,esi
 004BB802    call        @UStrEqual
>004BB807    je          004BB826
 004BB809    lea         eax,[ebx+308]
 004BB80F    mov         edx,esi
 004BB811    call        @UStrAsg
 004BB816    test        byte ptr [ebx+1C],1
>004BB81A    jne         004BB826
 004BB81C    mov         eax,ebx
 004BB81E    mov         edx,dword ptr [eax]
 004BB820    call        dword ptr [edx+13C]
 004BB826    pop         esi
 004BB827    pop         ebx
 004BB828    ret
*}
end;

//004BB82C
procedure TCustomCombo.ComboWndProc(var Message:TMessage; ComboWnd:HWND; ComboProc:TWindowProcPtr);
begin
{*
 004BB82C    push        ebp
 004BB82D    mov         ebp,esp
 004BB82F    add         esp,0FFFFFFF0
 004BB832    push        ebx
 004BB833    push        esi
 004BB834    push        edi
 004BB835    mov         esi,ecx
 004BB837    mov         ebx,edx
 004BB839    mov         dword ptr [ebp-4],eax
 004BB83C    xor         eax,eax
 004BB83E    push        ebp
 004BB83F    push        4BBAF1
 004BB844    push        dword ptr fs:[eax]
 004BB847    mov         dword ptr fs:[eax],esp
 004BB84A    mov         eax,dword ptr [ebx]
 004BB84C    cmp         eax,104
>004BB851    jg          004BB8A2
>004BB853    je          004BB945
 004BB859    cmp         eax,87
>004BB85E    jg          004BB884
>004BB860    je          004BBA61
 004BB866    sub         eax,7
>004BB869    je          004BB8F5
 004BB86F    dec         eax
>004BB870    je          004BB92B
 004BB876    sub         eax,7C
>004BB879    je          004BBA81
>004BB87F    jmp         004BBAB2
 004BB884    sub         eax,100
>004BB889    je          004BB945
 004BB88F    dec         eax
>004BB890    je          004BB9C9
 004BB896    dec         eax
>004BB897    je          004BB973
>004BB89D    jmp         004BBAB2
 004BB8A2    cmp         eax,0BD00
>004BB8A7    jg          004BB8D3
>004BB8A9    je          004BBA9B
 004BB8AF    sub         eax,105
>004BB8B4    je          004BB9C9
 004BB8BA    sub         eax,0FB
>004BB8BF    je          004BB9E8
 004BB8C5    sub         eax,5
>004BB8C8    je          004BB9FE
>004BB8CE    jmp         004BBAB2
 004BB8D3    sub         eax,0BD02
>004BB8D8    je          004BBA9B
 004BB8DE    sub         eax,2
>004BB8E1    je          004BBA9B
 004BB8E7    sub         eax,2
>004BB8EA    je          004BBA9B
>004BB8F0    jmp         004BBAB2
 004BB8F5    mov         dl,1
 004BB8F7    mov         eax,dword ptr [ebp-4]
 004BB8FA    call        GetParentForm
 004BB8FF    mov         edi,eax
 004BB901    test        edi,edi
>004BB903    je          004BBAB2
 004BB909    mov         edx,dword ptr [ebp-4]
 004BB90C    mov         eax,edi
 004BB90E    mov         ecx,dword ptr [eax]
 004BB910    call        dword ptr [ecx+110]
 004BB916    test        al,al
>004BB918    jne         004BBAB2
 004BB91E    xor         eax,eax
 004BB920    pop         edx
 004BB921    pop         ecx
 004BB922    pop         ecx
 004BB923    mov         dword ptr fs:[eax],edx
>004BB926    jmp         004BBB0A
 004BB92B    mov         eax,dword ptr [ebp-4]
 004BB92E    test        byte ptr [eax+54],20
>004BB932    je          004BBAB2
 004BB938    xor         eax,eax
 004BB93A    pop         edx
 004BB93B    pop         ecx
 004BB93C    pop         ecx
 004BB93D    mov         dword ptr fs:[eax],edx
>004BB940    jmp         004BBB0A
 004BB945    mov         eax,dword ptr [ebp-4]
 004BB948    cmp         esi,dword ptr [eax+2B4]
>004BB94E    je          004BBAB2
 004BB954    mov         edx,ebx
 004BB956    mov         eax,dword ptr [ebp-4]
 004BB959    call        TWinControl.DoKeyDown
 004BB95E    test        al,al
>004BB960    je          004BBAB2
 004BB966    xor         eax,eax
 004BB968    pop         edx
 004BB969    pop         ecx
 004BB96A    pop         ecx
 004BB96B    mov         dword ptr fs:[eax],edx
>004BB96E    jmp         004BBB0A
 004BB973    mov         edx,ebx
 004BB975    mov         eax,dword ptr [ebp-4]
 004BB978    call        TWinControl.DoKeyPress
 004BB97D    test        al,al
>004BB97F    je          004BB98E
 004BB981    xor         eax,eax
 004BB983    pop         edx
 004BB984    pop         ecx
 004BB985    pop         ecx
 004BB986    mov         dword ptr fs:[eax],edx
>004BB989    jmp         004BBB0A
 004BB98E    movzx       edi,word ptr [ebx+4]
 004BB992    cmp         di,0D
>004BB996    je          004BB9A2
 004BB998    cmp         di,1B
>004BB99C    jne         004BBAB2
 004BB9A2    mov         eax,dword ptr [ebp-4]
 004BB9A5    call        TCustomCombo.GetDroppedDown
 004BB9AA    test        al,al
>004BB9AC    je          004BBAB2
 004BB9B2    xor         edx,edx
 004BB9B4    mov         eax,dword ptr [ebp-4]
 004BB9B7    call        TCustomCombo.SetDroppedDown
 004BB9BC    xor         eax,eax
 004BB9BE    pop         edx
 004BB9BF    pop         ecx
 004BB9C0    pop         ecx
 004BB9C1    mov         dword ptr fs:[eax],edx
>004BB9C4    jmp         004BBB0A
 004BB9C9    mov         edx,ebx
 004BB9CB    mov         eax,dword ptr [ebp-4]
 004BB9CE    call        TWinControl.DoKeyUp
 004BB9D3    test        al,al
>004BB9D5    je          004BBAB2
 004BB9DB    xor         eax,eax
 004BB9DD    pop         edx
 004BB9DE    pop         ecx
 004BB9DF    pop         ecx
 004BB9E0    mov         dword ptr fs:[eax],edx
>004BB9E3    jmp         004BBB0A
 004BB9E8    mov         ecx,ebx
 004BB9EA    mov         eax,[0078D590];^Application:TApplication
 004BB9EF    mov         eax,dword ptr [eax]
 004BB9F1    mov         edx,dword ptr [ebp-4]
 004BB9F4    call        TApplication.HintMouseMessage
>004BB9F9    jmp         004BBAB2
 004BB9FE    mov         eax,dword ptr [ebp-4]
 004BBA01    call        HasPopup
 004BBA06    test        al,al
>004BBA08    je          004BBAB2
 004BBA0E    movsx       eax,word ptr [ebx+8]
 004BBA12    mov         dword ptr [ebp-0C],eax
 004BBA15    movsx       eax,word ptr [ebx+0A]
 004BBA19    mov         dword ptr [ebp-8],eax
 004BBA1C    push        1
 004BBA1E    lea         eax,[ebp-0C]
 004BBA21    push        eax
 004BBA22    mov         eax,dword ptr [ebp-4]
 004BBA25    call        TWinControl.GetHandle
 004BBA2A    push        eax
 004BBA2B    push        esi
 004BBA2C    call        user32.MapWindowPoints
 004BBA31    movzx       eax,word ptr [ebp-0C]
 004BBA35    mov         word ptr [ebp-10],ax
 004BBA39    movzx       eax,word ptr [ebp-8]
 004BBA3D    mov         word ptr [ebp-0E],ax
 004BBA41    mov         eax,dword ptr [ebp-10]
 004BBA44    mov         dword ptr [ebx+8],eax
 004BBA47    mov         edx,ebx
 004BBA49    mov         eax,dword ptr [ebp-4]
 004BBA4C    mov         ecx,dword ptr [eax]
 004BBA4E    call        dword ptr [ecx+84]
 004BBA54    xor         eax,eax
 004BBA56    pop         edx
 004BBA57    pop         ecx
 004BBA58    pop         ecx
 004BBA59    mov         dword ptr fs:[eax],edx
>004BBA5C    jmp         004BBB0A
 004BBA61    mov         eax,dword ptr [ebp-4]
 004BBA64    call        TCustomCombo.GetDroppedDown
 004BBA69    test        al,al
>004BBA6B    je          004BBAB2
 004BBA6D    mov         dword ptr [ebx+0C],4
 004BBA74    xor         eax,eax
 004BBA76    pop         edx
 004BBA77    pop         ecx
 004BBA78    pop         ecx
 004BBA79    mov         dword ptr fs:[eax],edx
>004BBA7C    jmp         004BBB0A
 004BBA81    mov         eax,dword ptr [ebp-4]
 004BBA84    test        byte ptr [eax+1C],10
>004BBA88    je          004BBAB2
 004BBA8A    mov         dword ptr [ebx+0C],0FFFFFFFF
 004BBA91    xor         eax,eax
 004BBA93    pop         edx
 004BBA94    pop         ecx
 004BBA95    pop         ecx
 004BBA96    mov         dword ptr fs:[eax],edx
>004BBA99    jmp         004BBB0A
 004BBA9B    mov         edx,ebx
 004BBA9D    mov         eax,dword ptr [ebp-4]
 004BBAA0    mov         ecx,dword ptr [eax]
 004BBAA2    call        dword ptr [ecx+84]
 004BBAA8    xor         eax,eax
 004BBAAA    pop         edx
 004BBAAB    pop         ecx
 004BBAAC    pop         ecx
 004BBAAD    mov         dword ptr fs:[eax],edx
>004BBAB0    jmp         004BBB0A
 004BBAB2    mov         eax,dword ptr [ebx+8]
 004BBAB5    push        eax
 004BBAB6    mov         eax,dword ptr [ebx+4]
 004BBAB9    push        eax
 004BBABA    mov         eax,dword ptr [ebx]
 004BBABC    push        eax
 004BBABD    push        esi
 004BBABE    mov         eax,dword ptr [ebp+8]
 004BBAC1    push        eax
 004BBAC2    call        user32.CallWindowProcW
 004BBAC7    mov         dword ptr [ebx+0C],eax
 004BBACA    cmp         dword ptr [ebx],203
>004BBAD0    jne         004BBAE7
 004BBAD2    mov         eax,dword ptr [ebp-4]
 004BBAD5    test        byte ptr [eax+50],80
>004BBAD9    je          004BBAE7
 004BBADB    mov         eax,dword ptr [ebp-4]
 004BBADE    mov         si,0FFEB
 004BBAE2    call        @CallDynaInst
 004BBAE7    xor         eax,eax
 004BBAE9    pop         edx
 004BBAEA    pop         ecx
 004BBAEB    pop         ecx
 004BBAEC    mov         dword ptr fs:[eax],edx
>004BBAEF    jmp         004BBB0A
>004BBAF1    jmp         @HandleAnyException
 004BBAF6    mov         eax,[0078D590];^Application:TApplication
 004BBAFB    mov         eax,dword ptr [eax]
 004BBAFD    mov         edx,dword ptr [ebp-4]
 004BBB00    call        TApplication.HandleException
 004BBB05    call        @DoneExcept
 004BBB0A    pop         edi
 004BBB0B    pop         esi
 004BBB0C    pop         ebx
 004BBB0D    mov         esp,ebp
 004BBB0F    pop         ebp
 004BBB10    ret         4
*}
end;

//004BBB14
procedure TCustomCombo.WndProc(var Message:TMessage);
begin
{*
 004BBB14    push        ebx
 004BBB15    push        esi
 004BBB16    push        edi
 004BBB17    mov         edi,edx
 004BBB19    mov         esi,eax
 004BBB1B    test        byte ptr [esi+1C],10
>004BBB1F    jne         004BBB73
 004BBB21    mov         ebx,dword ptr [edi]
 004BBB23    cmp         ebx,201
>004BBB29    je          004BBB33
 004BBB2B    cmp         ebx,203
>004BBB31    jne         004BBB73
 004BBB33    mov         eax,esi
 004BBB35    call        TControl.Dragging
 004BBB3A    test        al,al
>004BBB3C    jne         004BBB73
 004BBB3E    mov         eax,esi
 004BBB40    call        TControl.GetDragMode
 004BBB45    cmp         al,1
>004BBB47    jne         004BBB73
 004BBB49    mov         edx,edi
 004BBB4B    mov         eax,esi
 004BBB4D    call        TWinControl.IsControlMouseMsg
 004BBB52    test        al,al
>004BBB54    jne         004BBCA0
 004BBB5A    mov         eax,[004BBCA4]
 004BBB5F    or          eax,dword ptr [esi+54]
 004BBB62    mov         dword ptr [esi+54],eax
 004BBB65    mov         edx,edi
 004BBB67    mov         eax,esi
 004BBB69    mov         ecx,dword ptr [eax]
 004BBB6B    call        dword ptr [ecx-14]
>004BBB6E    jmp         004BBCA0
 004BBB73    mov         ebx,dword ptr [edi]
 004BBB75    mov         eax,ebx
 004BBB77    cmp         eax,83
>004BBB7C    jg          004BBB97
>004BBB7E    je          004BBCA0
 004BBB84    sub         eax,5
>004BBB87    je          004BBBAF
 004BBB89    sub         eax,76
>004BBB8C    je          004BBC70
>004BBB92    jmp         004BBC97
 004BBB97    sub         eax,102
>004BBB9C    je          004BBC3D
 004BBBA2    add         eax,0FFFFFFD0
 004BBBA5    sub         eax,7
>004BBBA8    jb          004BBBCA
>004BBBAA    jmp         004BBC97
 004BBBAF    cmp         byte ptr [esi+2C4],0
>004BBBB6    je          004BBC97
 004BBBBC    mov         edx,edi
 004BBBBE    mov         eax,esi
 004BBBC0    mov         ecx,dword ptr [eax]
 004BBBC2    call        dword ptr [ecx-10]
>004BBBC5    jmp         004BBCA0
 004BBBCA    mov         eax,dword ptr [esi+64]
 004BBBCD    mov         eax,dword ptr [eax+18]
 004BBBD0    call        ColorToRGB
 004BBBD5    push        eax
 004BBBD6    mov         eax,dword ptr [edi+4]
 004BBBD9    push        eax
 004BBBDA    call        gdi32.SetTextColor
 004BBBDF    mov         eax,dword ptr [esi+1C0]
 004BBBE5    mov         eax,dword ptr [eax+10]
 004BBBE8    mov         eax,dword ptr [eax+18]
 004BBBEB    call        ColorToRGB
 004BBBF0    push        eax
 004BBBF1    mov         eax,dword ptr [edi+4]
 004BBBF4    push        eax
 004BBBF5    call        gdi32.SetBkColor
 004BBBFA    mov         eax,dword ptr [esi+1C0]
 004BBC00    call        TBrush.GetHandle
 004BBC05    mov         dword ptr [edi+0C],eax
 004BBC08    test        byte ptr [esi+55],80
>004BBC0C    je          004BBCA0
 004BBC12    cmp         byte ptr [esi+27C],0
>004BBC19    jne         004BBCA0
 004BBC1F    mov         byte ptr [esi+27C],1
 004BBC26    push        0
 004BBC28    push        0
 004BBC2A    push        0B04D
 004BBC2F    mov         eax,dword ptr [esi+2B0]
 004BBC35    push        eax
 004BBC36    call        user32.PostMessageW
>004BBC3B    jmp         004BBCA0
 004BBC3D    mov         edx,edi
 004BBC3F    mov         eax,esi
 004BBC41    call        TWinControl.DoKeyPress
 004BBC46    test        al,al
>004BBC48    jne         004BBCA0
 004BBC4A    movzx       ebx,word ptr [edi+4]
 004BBC4E    cmp         bx,0D
>004BBC52    je          004BBC5A
 004BBC54    cmp         bx,1B
>004BBC58    jne         004BBC97
 004BBC5A    mov         eax,esi
 004BBC5C    call        TCustomCombo.GetDroppedDown
 004BBC61    test        al,al
>004BBC63    je          004BBC97
 004BBC65    xor         edx,edx
 004BBC67    mov         eax,esi
 004BBC69    call        TCustomCombo.SetDroppedDown
>004BBC6E    jmp         004BBCA0
 004BBC70    cmp         dword ptr [esi+7C],0
>004BBC74    jne         004BBC97
 004BBC76    mov         eax,dword ptr [edi+8]
 004BBC79    push        eax
 004BBC7A    mov         eax,dword ptr [edi+4]
 004BBC7D    push        eax
 004BBC7E    push        ebx
 004BBC7F    mov         eax,dword ptr [esi+2B0]
 004BBC85    push        eax
 004BBC86    mov         eax,dword ptr [esi+2BC]
 004BBC8C    push        eax
 004BBC8D    call        user32.CallWindowProcW
 004BBC92    mov         dword ptr [edi+0C],eax
>004BBC95    jmp         004BBCA0
 004BBC97    mov         edx,edi
 004BBC99    mov         eax,esi
 004BBC9B    call        TWinControl.WndProc
 004BBCA0    pop         edi
 004BBCA1    pop         esi
 004BBCA2    pop         ebx
 004BBCA3    ret
*}
end;

//004BBCA8
procedure TCustomCombo.CNCommand(var Message:TWMCommand);
begin
{*
 004BBCA8    push        ebp
 004BBCA9    mov         ebp,esp
 004BBCAB    push        0
 004BBCAD    push        ebx
 004BBCAE    push        esi
 004BBCAF    push        edi
 004BBCB0    mov         edi,eax
 004BBCB2    xor         eax,eax
 004BBCB4    push        ebp
 004BBCB5    push        4BBE14
 004BBCBA    push        dword ptr fs:[eax]
 004BBCBD    mov         dword ptr fs:[eax],esp
 004BBCC0    movzx       eax,word ptr [edx+6]
 004BBCC4    cmp         eax,8
>004BBCC7    ja          004BBDFE
 004BBCCD    jmp         dword ptr [eax*4+4BBCD4]
 004BBCCD    dd          004BBDFE
 004BBCCD    dd          004BBD7C
 004BBCCD    dd          004BBCF8
 004BBCCD    dd          004BBDD2
 004BBCCD    dd          004BBDE9
 004BBCCD    dd          004BBD08
 004BBCCD    dd          004BBDFE
 004BBCCD    dd          004BBD18
 004BBCCD    dd          004BBDC5
 004BBCF8    mov         eax,edi
 004BBCFA    mov         si,0FFEB
 004BBCFE    call        @CallDynaInst
>004BBD03    jmp         004BBDFE
 004BBD08    mov         eax,edi
 004BBD0A    mov         si,0FFAF
 004BBD0E    call        @CallDynaInst
>004BBD13    jmp         004BBDFE
 004BBD18    mov         byte ptr [edi+2C5],0
 004BBD1F    mov         eax,edi
 004BBD21    mov         si,0FFAD
 004BBD25    call        @CallDynaInst
 004BBD2A    mov         eax,edi
 004BBD2C    mov         edx,dword ptr [eax]
 004BBD2E    call        dword ptr [edx+114]
 004BBD34    cmp         byte ptr [edi+2C5],0
>004BBD3B    je          004BBDFE
 004BBD41    push        0
 004BBD43    push        0
 004BBD45    push        1F
 004BBD47    mov         eax,edi
 004BBD49    call        TWinControl.GetHandle
 004BBD4E    push        eax
 004BBD4F    call        user32.PostMessageW
 004BBD54    cmp         byte ptr [edi+2C6],0
>004BBD5B    jne         004BBDFE
 004BBD61    push        0
 004BBD63    push        0
 004BBD65    push        14F
 004BBD6A    mov         eax,edi
 004BBD6C    call        TWinControl.GetHandle
 004BBD71    push        eax
 004BBD72    call        user32.PostMessageW
>004BBD77    jmp         004BBDFE
 004BBD7C    mov         eax,edi
 004BBD7E    mov         edx,dword ptr [eax]
 004BBD80    call        dword ptr [edx+0EC]
 004BBD86    inc         eax
>004BBD87    je          004BBDFE
 004BBD89    mov         eax,edi
 004BBD8B    mov         edx,dword ptr [eax]
 004BBD8D    call        dword ptr [edx+0EC]
 004BBD93    mov         edx,eax
 004BBD95    lea         ecx,[ebp-4]
 004BBD98    mov         eax,dword ptr [edi+2AC]
 004BBD9E    mov         ebx,dword ptr [eax]
 004BBDA0    call        dword ptr [ebx+0C]
 004BBDA3    mov         edx,dword ptr [ebp-4]
 004BBDA6    mov         eax,edi
 004BBDA8    call        TControl.SetText
 004BBDAD    mov         eax,edi
 004BBDAF    mov         si,0FFEC
 004BBDB3    call        @CallDynaInst
 004BBDB8    mov         eax,edi
 004BBDBA    mov         si,0FFAE
 004BBDBE    call        @CallDynaInst
>004BBDC3    jmp         004BBDFE
 004BBDC5    mov         eax,edi
 004BBDC7    mov         si,0FFAC
 004BBDCB    call        @CallDynaInst
>004BBDD0    jmp         004BBDFE
 004BBDD2    mov         byte ptr [edi+2C6],1
 004BBDD9    mov         byte ptr [edi+2C5],1
 004BBDE0    mov         eax,edi
 004BBDE2    call        TWinControl.SetIme
>004BBDE7    jmp         004BBDFE
 004BBDE9    mov         byte ptr [edi+2C6],0
 004BBDF0    mov         byte ptr [edi+2C5],1
 004BBDF7    mov         eax,edi
 004BBDF9    call        TWinControl.ResetIme
 004BBDFE    xor         eax,eax
 004BBE00    pop         edx
 004BBE01    pop         ecx
 004BBE02    pop         ecx
 004BBE03    mov         dword ptr fs:[eax],edx
 004BBE06    push        4BBE1B
 004BBE0B    lea         eax,[ebp-4]
 004BBE0E    call        @UStrClr
 004BBE13    ret
>004BBE14    jmp         @HandleFinally
>004BBE19    jmp         004BBE0B
 004BBE1B    pop         edi
 004BBE1C    pop         esi
 004BBE1D    pop         ebx
 004BBE1E    pop         ecx
 004BBE1F    pop         ebp
 004BBE20    ret
*}
end;

//004BBE24
procedure TCustomEdit.Change;
begin
{*
 004BBE24    push        ebx
 004BBE25    mov         ebx,eax
 004BBE27    mov         eax,ebx
 004BBE29    call        TControl.Changed
 004BBE2E    cmp         word ptr [ebx+28A],0
>004BBE36    je          004BBE46
 004BBE38    mov         edx,ebx
 004BBE3A    mov         eax,dword ptr [ebx+28C]
 004BBE40    call        dword ptr [ebx+288]
 004BBE46    pop         ebx
 004BBE47    ret
*}
end;

//004BBE48
procedure TCustomComboBox.DrawItem(Index:Integer; Rect:TRect; State:TOwnerDrawState);
begin
{*
 004BBE48    push        ebp
 004BBE49    mov         ebp,esp
 004BBE4B    add         esp,0FFFFFFEC
 004BBE4E    push        ebx
 004BBE4F    push        esi
 004BBE50    push        edi
 004BBE51    xor         ebx,ebx
 004BBE53    mov         dword ptr [ebp-14],ebx
 004BBE56    mov         esi,ecx
 004BBE58    lea         edi,[ebp-10]
 004BBE5B    movs        dword ptr [edi],dword ptr [esi]
 004BBE5C    movs        dword ptr [edi],dword ptr [esi]
 004BBE5D    movs        dword ptr [edi],dword ptr [esi]
 004BBE5E    movs        dword ptr [edi],dword ptr [esi]
 004BBE5F    mov         edi,edx
 004BBE61    mov         esi,eax
 004BBE63    xor         eax,eax
 004BBE65    push        ebp
 004BBE66    push        4BBEF4
 004BBE6B    push        dword ptr fs:[eax]
 004BBE6E    mov         dword ptr fs:[eax],esp
 004BBE71    mov         eax,dword ptr [esi+270]
 004BBE77    call        TControlCanvas.UpdateTextFlags
 004BBE7C    cmp         word ptr [esi+2F2],0
>004BBE84    je          004BBEA1
 004BBE86    lea         eax,[ebp-10]
 004BBE89    push        eax
 004BBE8A    movzx       eax,word ptr [ebp+8]
 004BBE8E    push        eax
 004BBE8F    mov         ecx,edi
 004BBE91    mov         edx,esi
 004BBE93    mov         eax,dword ptr [esi+2F4]
 004BBE99    call        dword ptr [esi+2F0]
>004BBE9F    jmp         004BBEDE
 004BBEA1    lea         edx,[ebp-10]
 004BBEA4    mov         eax,dword ptr [esi+270]
 004BBEAA    mov         ecx,dword ptr [eax]
 004BBEAC    call        dword ptr [ecx+54]
 004BBEAF    test        edi,edi
>004BBEB1    jl          004BBEDE
 004BBEB3    lea         ecx,[ebp-14]
 004BBEB6    mov         edx,edi
 004BBEB8    mov         eax,dword ptr [esi+2AC]
 004BBEBE    mov         ebx,dword ptr [eax]
 004BBEC0    call        dword ptr [ebx+0C]
 004BBEC3    mov         eax,dword ptr [ebp-14]
 004BBEC6    push        eax
 004BBEC7    mov         edx,dword ptr [ebp-10]
 004BBECA    add         edx,2
 004BBECD    mov         ecx,dword ptr [ebp-0C]
 004BBED0    mov         eax,dword ptr [esi+270]
 004BBED6    mov         ebx,dword ptr [eax]
 004BBED8    call        dword ptr [ebx+90]
 004BBEDE    xor         eax,eax
 004BBEE0    pop         edx
 004BBEE1    pop         ecx
 004BBEE2    pop         ecx
 004BBEE3    mov         dword ptr fs:[eax],edx
 004BBEE6    push        4BBEFB
 004BBEEB    lea         eax,[ebp-14]
 004BBEEE    call        @UStrClr
 004BBEF3    ret
>004BBEF4    jmp         @HandleFinally
>004BBEF9    jmp         004BBEEB
 004BBEFB    pop         edi
 004BBEFC    pop         esi
 004BBEFD    pop         ebx
 004BBEFE    mov         esp,ebp
 004BBF00    pop         ebp
 004BBF01    ret         4
*}
end;

//004BBF04
procedure TCustomCombo.DropDown;
begin
{*
 004BBF04    push        ebx
 004BBF05    cmp         word ptr [eax+29A],0
>004BBF0D    je          004BBF1F
 004BBF0F    mov         ebx,eax
 004BBF11    mov         edx,eax
 004BBF13    mov         eax,dword ptr [ebx+29C]
 004BBF19    call        dword ptr [ebx+298]
 004BBF1F    pop         ebx
 004BBF20    ret
*}
end;

//004BBF24
procedure TCustomCombo.Loaded;
begin
{*
 004BBF24    push        esi
 004BBF25    push        edi
 004BBF26    mov         esi,eax
 004BBF28    mov         eax,esi
 004BBF2A    call        TControl.Loaded
 004BBF2F    mov         edi,dword ptr [esi+280]
 004BBF35    cmp         edi,0FFFFFFFF
>004BBF38    je          004BBF46
 004BBF3A    mov         edx,edi
 004BBF3C    mov         eax,esi
 004BBF3E    mov         ecx,dword ptr [eax]
 004BBF40    call        dword ptr [ecx+0F0]
 004BBF46    pop         edi
 004BBF47    pop         esi
 004BBF48    ret
*}
end;

//004BBF4C
procedure TCustomCombo.Focused;
begin
{*
 004BBF4C    push        ebx
 004BBF4D    push        esi
 004BBF4E    push        edi
 004BBF4F    mov         edi,eax
 004BBF51    xor         ebx,ebx
 004BBF53    mov         eax,edi
 004BBF55    call        TWinControl.HandleAllocated
 004BBF5A    test        al,al
>004BBF5C    je          004BBF86
 004BBF5E    call        user32.GetFocus
 004BBF63    mov         esi,eax
 004BBF65    cmp         esi,dword ptr [edi+2B0]
>004BBF6B    je          004BBF84
 004BBF6D    cmp         esi,dword ptr [edi+2B4]
>004BBF73    je          004BBF84
 004BBF75    mov         eax,edi
 004BBF77    call        TWinControl.GetHandle
 004BBF7C    cmp         esi,eax
>004BBF7E    je          004BBF84
 004BBF80    xor         ebx,ebx
>004BBF82    jmp         004BBF86
 004BBF84    mov         bl,1
 004BBF86    mov         eax,ebx
 004BBF88    pop         edi
 004BBF89    pop         esi
 004BBF8A    pop         ebx
 004BBF8B    ret
*}
end;

//004BBF8C
procedure TCustomCombo.CloseUp;
begin
{*
 004BBF8C    push        ebx
 004BBF8D    cmp         word ptr [eax+2A2],0
>004BBF95    je          004BBFA7
 004BBF97    mov         ebx,eax
 004BBF99    mov         edx,eax
 004BBF9B    mov         eax,dword ptr [ebx+2A4]
 004BBFA1    call        dword ptr [ebx+2A0]
 004BBFA7    pop         ebx
 004BBFA8    ret
*}
end;

//004BBFAC
procedure TCustomCombo.Select;
begin
{*
 004BBFAC    push        ebx
 004BBFAD    push        esi
 004BBFAE    cmp         word ptr [eax+292],0
>004BBFB6    je          004BBFCB
 004BBFB8    mov         ebx,eax
 004BBFBA    mov         edx,eax
 004BBFBC    mov         eax,dword ptr [ebx+294]
 004BBFC2    call        dword ptr [ebx+290]
 004BBFC8    pop         esi
 004BBFC9    pop         ebx
 004BBFCA    ret
 004BBFCB    mov         si,0FFAF
 004BBFCF    call        @CallDynaInst
 004BBFD4    pop         esi
 004BBFD5    pop         ebx
 004BBFD6    ret
*}
end;

//004BBFD8
procedure TCustomCombo.CreateWnd;
begin
{*
 004BBFD8    push        ebx
 004BBFD9    mov         ebx,eax
 004BBFDB    mov         eax,ebx
 004BBFDD    call        TWinControl.CreateWnd
 004BBFE2    push        0
 004BBFE4    mov         eax,dword ptr [ebx+274]
 004BBFEA    push        eax
 004BBFEB    push        141
 004BBFF0    mov         eax,ebx
 004BBFF2    call        TWinControl.GetHandle
 004BBFF7    push        eax
 004BBFF8    call        user32.SendMessageW
 004BBFFD    xor         eax,eax
 004BBFFF    mov         dword ptr [ebx+2B0],eax
 004BC005    xor         eax,eax
 004BC007    mov         dword ptr [ebx+2B4],eax
 004BC00D    mov         edx,1
 004BC012    mov         eax,5
 004BC017    call        CheckWin32Version
 004BC01C    test        al,al
>004BC01E    je          004BC049
 004BC020    call        ThemeServices
 004BC025    call        TThemeServices.GetThemesEnabled
 004BC02A    test        al,al
>004BC02C    je          004BC049
 004BC02E    push        0
 004BC030    mov         eax,dword ptr [ebx+278]
 004BC036    push        eax
 004BC037    push        1701
 004BC03C    mov         eax,ebx
 004BC03E    call        TWinControl.GetHandle
 004BC043    push        eax
 004BC044    call        user32.SendMessageW
 004BC049    pop         ebx
 004BC04A    ret
*}
end;

//004BC04C
procedure TCustomCombo.AdjustDropDown;
begin
{*
 004BC04C    push        ebp
 004BC04D    mov         ebp,esp
 004BC04F    push        ecx
 004BC050    push        ebx
 004BC051    mov         dword ptr [ebp-4],eax
 004BC054    mov         eax,dword ptr [ebp-4]
 004BC057    mov         edx,dword ptr [eax]
 004BC059    call        dword ptr [edx+12C]
 004BC05F    mov         ebx,eax
 004BC061    mov         eax,dword ptr [ebp-4]
 004BC064    mov         eax,dword ptr [eax+278]
 004BC06A    cmp         ebx,eax
>004BC06C    jle         004BC070
 004BC06E    mov         ebx,eax
 004BC070    cmp         ebx,1
>004BC073    jge         004BC07A
 004BC075    mov         ebx,1
 004BC07A    mov         eax,dword ptr [ebp-4]
 004BC07D    mov         byte ptr [eax+2C4],1
 004BC084    xor         eax,eax
 004BC086    push        ebp
 004BC087    push        4BC0E2
 004BC08C    push        dword ptr fs:[eax]
 004BC08F    mov         dword ptr fs:[eax],esp
 004BC092    push        9E
 004BC097    mov         eax,dword ptr [ebp-4]
 004BC09A    mov         edx,dword ptr [eax]
 004BC09C    call        dword ptr [edx+124]
 004BC0A2    imul        ebx
 004BC0A4    mov         edx,dword ptr [ebp-4]
 004BC0A7    add         eax,dword ptr [edx+4C]
 004BC0AA    add         eax,2
 004BC0AD    push        eax
 004BC0AE    mov         eax,dword ptr [ebp-4]
 004BC0B1    mov         eax,dword ptr [eax+48]
 004BC0B4    push        eax
 004BC0B5    push        0
 004BC0B7    push        0
 004BC0B9    push        0
 004BC0BB    mov         eax,dword ptr [ebp-4]
 004BC0BE    mov         eax,dword ptr [eax+2B8]
 004BC0C4    push        eax
 004BC0C5    call        user32.SetWindowPos
 004BC0CA    xor         eax,eax
 004BC0CC    pop         edx
 004BC0CD    pop         ecx
 004BC0CE    pop         ecx
 004BC0CF    mov         dword ptr fs:[eax],edx
 004BC0D2    push        4BC0E9
 004BC0D7    mov         eax,dword ptr [ebp-4]
 004BC0DA    mov         byte ptr [eax+2C4],0
 004BC0E1    ret
>004BC0E2    jmp         @HandleFinally
>004BC0E7    jmp         004BC0D7
 004BC0E9    push        57
 004BC0EB    push        0
 004BC0ED    push        0
 004BC0EF    push        0
 004BC0F1    push        0
 004BC0F3    push        0
 004BC0F5    mov         eax,dword ptr [ebp-4]
 004BC0F8    mov         eax,dword ptr [eax+2B8]
 004BC0FE    push        eax
 004BC0FF    call        user32.SetWindowPos
 004BC104    pop         ebx
 004BC105    pop         ecx
 004BC106    pop         ebp
 004BC107    ret
*}
end;

//004BC108
procedure TCustomCombo.SetItems(const Value:TStrings);
begin
{*
 004BC108    push        esi
 004BC109    push        edi
 004BC10A    push        ebp
 004BC10B    mov         edi,edx
 004BC10D    mov         esi,eax
 004BC10F    mov         ebp,dword ptr [esi+2AC]
 004BC115    test        ebp,ebp
>004BC117    je          004BC124
 004BC119    mov         edx,edi
 004BC11B    mov         eax,ebp
 004BC11D    mov         ecx,dword ptr [eax]
 004BC11F    call        dword ptr [ecx+8]
>004BC122    jmp         004BC12A
 004BC124    mov         dword ptr [esi+2AC],edi
 004BC12A    pop         ebp
 004BC12B    pop         edi
 004BC12C    pop         esi
 004BC12D    ret
*}
end;

//004BC130
procedure TCustomCombo.ClearSelection;
begin
{*
 004BC130    or          edx,0FFFFFFFF
 004BC133    mov         ecx,dword ptr [eax]
 004BC135    call        dword ptr [ecx+0F0]
 004BC13B    ret
*}
end;

//004BC13C
procedure TCustomCombo.CopySelection(Destination:TCustomListControl);
begin
{*
 004BC13C    push        ebp
 004BC13D    mov         ebp,esp
 004BC13F    push        0
 004BC141    push        ebx
 004BC142    push        esi
 004BC143    push        edi
 004BC144    mov         esi,edx
 004BC146    mov         ebx,eax
 004BC148    xor         eax,eax
 004BC14A    push        ebp
 004BC14B    push        4BC1BB
 004BC150    push        dword ptr fs:[eax]
 004BC153    mov         dword ptr fs:[eax],esp
 004BC156    mov         eax,ebx
 004BC158    mov         edx,dword ptr [eax]
 004BC15A    call        dword ptr [edx+0EC]
 004BC160    inc         eax
>004BC161    je          004BC1A5
 004BC163    mov         eax,ebx
 004BC165    mov         edx,dword ptr [eax]
 004BC167    call        dword ptr [edx+0EC]
 004BC16D    mov         edx,eax
 004BC16F    lea         ecx,[ebp-4]
 004BC172    mov         eax,dword ptr [ebx+2AC]
 004BC178    mov         edi,dword ptr [eax]
 004BC17A    call        dword ptr [edi+0C]
 004BC17D    mov         eax,dword ptr [ebp-4]
 004BC180    push        eax
 004BC181    mov         eax,ebx
 004BC183    mov         edx,dword ptr [eax]
 004BC185    call        dword ptr [edx+0EC]
 004BC18B    mov         edx,eax
 004BC18D    mov         eax,dword ptr [ebx+2AC]
 004BC193    mov         ecx,dword ptr [eax]
 004BC195    call        dword ptr [ecx+18]
 004BC198    mov         ecx,eax
 004BC19A    mov         eax,esi
 004BC19C    pop         edx
 004BC19D    mov         ebx,dword ptr [eax]
 004BC19F    call        dword ptr [ebx+0F4]
 004BC1A5    xor         eax,eax
 004BC1A7    pop         edx
 004BC1A8    pop         ecx
 004BC1A9    pop         ecx
 004BC1AA    mov         dword ptr fs:[eax],edx
 004BC1AD    push        4BC1C2
 004BC1B2    lea         eax,[ebp-4]
 004BC1B5    call        @UStrClr
 004BC1BA    ret
>004BC1BB    jmp         @HandleFinally
>004BC1C0    jmp         004BC1B2
 004BC1C2    pop         edi
 004BC1C3    pop         esi
 004BC1C4    pop         ebx
 004BC1C5    pop         ecx
 004BC1C6    pop         ebp
 004BC1C7    ret
*}
end;

//004BC1C8
procedure TCustomCombo.DeleteSelected;
begin
{*
 004BC1C8    push        esi
 004BC1C9    mov         esi,eax
 004BC1CB    mov         eax,esi
 004BC1CD    mov         edx,dword ptr [eax]
 004BC1CF    call        dword ptr [edx+0EC]
 004BC1D5    inc         eax
>004BC1D6    je          004BC1EF
 004BC1D8    mov         eax,esi
 004BC1DA    mov         edx,dword ptr [eax]
 004BC1DC    call        dword ptr [edx+0EC]
 004BC1E2    mov         edx,eax
 004BC1E4    mov         eax,dword ptr [esi+2AC]
 004BC1EA    mov         ecx,dword ptr [eax]
 004BC1EC    call        dword ptr [ecx+48]
 004BC1EF    pop         esi
 004BC1F0    ret
*}
end;

//004BC1F4
function TCustomCombo.GetCount:Integer;
begin
{*
 004BC1F4    mov         edx,dword ptr [eax]
 004BC1F6    call        dword ptr [edx+12C]
 004BC1FC    ret
*}
end;

//004BC200
procedure TCustomCombo.SetDropDownCount(const Value:Integer);
begin
{*
 004BC200    push        ebx
 004BC201    mov         ebx,eax
 004BC203    cmp         edx,dword ptr [ebx+278]
>004BC209    je          004BC258
 004BC20B    mov         dword ptr [ebx+278],edx
 004BC211    mov         eax,ebx
 004BC213    call        TWinControl.HandleAllocated
 004BC218    test        al,al
>004BC21A    je          004BC258
 004BC21C    mov         edx,1
 004BC221    mov         eax,5
 004BC226    call        CheckWin32Version
 004BC22B    test        al,al
>004BC22D    je          004BC258
 004BC22F    call        ThemeServices
 004BC234    call        TThemeServices.GetThemesEnabled
 004BC239    test        al,al
>004BC23B    je          004BC258
 004BC23D    push        0
 004BC23F    mov         eax,dword ptr [ebx+278]
 004BC245    push        eax
 004BC246    push        1701
 004BC24B    mov         eax,ebx
 004BC24D    call        TWinControl.GetHandle
 004BC252    push        eax
 004BC253    call        user32.SendMessageW
 004BC258    pop         ebx
 004BC259    ret
*}
end;

//004BC25C
procedure TCustomCombo.AddItem(Item:string; AObject:TObject);
begin
{*
 004BC25C    push        ebp
 004BC25D    mov         ebp,esp
 004BC25F    push        ecx
 004BC260    push        ebx
 004BC261    push        esi
 004BC262    mov         esi,ecx
 004BC264    mov         dword ptr [ebp-4],edx
 004BC267    mov         ebx,eax
 004BC269    mov         eax,dword ptr [ebp-4]
 004BC26C    call        @UStrAddRef
 004BC271    xor         eax,eax
 004BC273    push        ebp
 004BC274    push        4BC2A5
 004BC279    push        dword ptr fs:[eax]
 004BC27C    mov         dword ptr fs:[eax],esp
 004BC27F    mov         ecx,esi
 004BC281    mov         edx,dword ptr [ebp-4]
 004BC284    mov         eax,dword ptr [ebx+2AC]
 004BC28A    mov         ebx,dword ptr [eax]
 004BC28C    call        dword ptr [ebx+3C]
 004BC28F    xor         eax,eax
 004BC291    pop         edx
 004BC292    pop         ecx
 004BC293    pop         ecx
 004BC294    mov         dword ptr fs:[eax],edx
 004BC297    push        4BC2AC
 004BC29C    lea         eax,[ebp-4]
 004BC29F    call        @UStrClr
 004BC2A4    ret
>004BC2A5    jmp         @HandleFinally
>004BC2AA    jmp         004BC29C
 004BC2AC    pop         esi
 004BC2AD    pop         ebx
 004BC2AE    pop         ecx
 004BC2AF    pop         ebp
 004BC2B0    ret
*}
end;

//004BC2B4
function TCustomCombo.IsItemHeightStored:Boolean;
begin
{*
 004BC2B4    cmp         dword ptr [eax+2A8],10
 004BC2BB    setne       al
 004BC2BE    ret
*}
end;

//004BC2C0
constructor TCustomComboBox.Create;
begin
{*
 004BC2C0    push        ebp
 004BC2C1    mov         ebp,esp
 004BC2C3    push        ecx
 004BC2C4    push        ebx
 004BC2C5    push        esi
 004BC2C6    test        dl,dl
>004BC2C8    je          004BC2D2
 004BC2CA    add         esp,0FFFFFFF0
 004BC2CD    call        @ClassCreate
 004BC2D2    mov         byte ptr [ebp-1],dl
 004BC2D5    mov         ebx,eax
 004BC2D7    xor         edx,edx
 004BC2D9    mov         eax,ebx
 004BC2DB    call        TCustomCombo.Create
 004BC2E0    mov         eax,ebx
 004BC2E2    mov         edx,dword ptr [eax]
 004BC2E4    call        dword ptr [edx+120]
 004BC2EA    mov         dl,1
 004BC2EC    call        dword ptr [eax+90]
 004BC2F2    mov         esi,eax
 004BC2F4    mov         dword ptr [ebx+2AC],esi
 004BC2FA    mov         dword ptr [esi+2C],ebx
 004BC2FD    mov         byte ptr [ebx+2E6],0
 004BC304    xor         eax,eax
 004BC306    mov         dword ptr [ebx+2DC],eax
 004BC30C    mov         byte ptr [ebx+2D8],1
 004BC313    mov         byte ptr [ebx+300],0
 004BC31A    mov         dword ptr [ebx+304],1F4
 004BC324    lea         eax,[ebx+308]
 004BC32A    call        @UStrClr
 004BC32F    mov         eax,ebx
 004BC331    cmp         byte ptr [ebp-1],0
>004BC335    je          004BC346
 004BC337    call        @AfterConstruction
 004BC33C    pop         dword ptr fs:[0]
 004BC343    add         esp,0C
 004BC346    mov         eax,ebx
 004BC348    pop         esi
 004BC349    pop         ebx
 004BC34A    pop         ecx
 004BC34B    pop         ebp
 004BC34C    ret
*}
end;

//004BC350
destructor TCustomComboBox.Destroy();
begin
{*
 004BC350    push        ebx
 004BC351    push        esi
 004BC352    call        @BeforeDestruction
 004BC357    mov         ebx,edx
 004BC359    mov         esi,eax
 004BC35B    mov         eax,dword ptr [esi+2AC]
 004BC361    call        TObject.Free
 004BC366    mov         eax,dword ptr [esi+2E8]
 004BC36C    call        TObject.Free
 004BC371    mov         edx,ebx
 004BC373    and         dl,0FC
 004BC376    mov         eax,esi
 004BC378    call        TCustomCombo.Destroy
 004BC37D    test        bl,bl
>004BC37F    jle         004BC388
 004BC381    mov         eax,esi
 004BC383    call        @ClassDestroy
 004BC388    pop         esi
 004BC389    pop         ebx
 004BC38A    ret
*}
end;

//004BC38C
function TCustomComboBox.GetSelText:UnicodeString;
begin
{*
 004BC38C    push        ebp
 004BC38D    mov         ebp,esp
 004BC38F    push        0
 004BC391    push        ebx
 004BC392    push        esi
 004BC393    mov         esi,edx
 004BC395    mov         ebx,eax
 004BC397    xor         eax,eax
 004BC399    push        ebp
 004BC39A    push        4BC3F3
 004BC39F    push        dword ptr fs:[eax]
 004BC3A2    mov         dword ptr fs:[eax],esp
 004BC3A5    mov         eax,esi
 004BC3A7    call        @UStrClr
 004BC3AC    cmp         byte ptr [ebx+2E6],2
>004BC3B3    jae         004BC3DD
 004BC3B5    push        esi
 004BC3B6    lea         edx,[ebp-4]
 004BC3B9    mov         eax,ebx
 004BC3BB    call        TControl.GetText
 004BC3C0    mov         eax,dword ptr [ebp-4]
 004BC3C3    push        eax
 004BC3C4    mov         eax,ebx
 004BC3C6    call        TCustomCombo.GetSelLength
 004BC3CB    push        eax
 004BC3CC    mov         eax,ebx
 004BC3CE    call        TCustomCombo.GetSelStart
 004BC3D3    mov         edx,eax
 004BC3D5    inc         edx
 004BC3D6    pop         ecx
 004BC3D7    pop         eax
 004BC3D8    call        @UStrCopy
 004BC3DD    xor         eax,eax
 004BC3DF    pop         edx
 004BC3E0    pop         ecx
 004BC3E1    pop         ecx
 004BC3E2    mov         dword ptr fs:[eax],edx
 004BC3E5    push        4BC3FA
 004BC3EA    lea         eax,[ebp-4]
 004BC3ED    call        @UStrClr
 004BC3F2    ret
>004BC3F3    jmp         @HandleFinally
>004BC3F8    jmp         004BC3EA
 004BC3FA    pop         esi
 004BC3FB    pop         ebx
 004BC3FC    pop         ecx
 004BC3FD    pop         ebp
 004BC3FE    ret
*}
end;

//004BC400
procedure TCustomComboBox.SetSorted(Value:Boolean);
begin
{*
 004BC400    cmp         dl,byte ptr [eax+2E5]
>004BC406    je          004BC413
 004BC408    mov         byte ptr [eax+2E5],dl
 004BC40E    call        TWinControl.RecreateWnd
 004BC413    ret
*}
end;

//004BC414
procedure TCustomComboBox.SetSelText(const Value:UnicodeString);
begin
{*
 004BC414    push        ebx
 004BC415    push        esi
 004BC416    mov         esi,edx
 004BC418    mov         ebx,eax
 004BC41A    cmp         byte ptr [ebx+2E6],2
>004BC421    jae         004BC43D
 004BC423    mov         eax,ebx
 004BC425    call        TWinControl.HandleNeeded
 004BC42A    push        esi
 004BC42B    xor         ecx,ecx
 004BC42D    mov         edx,0C2
 004BC432    mov         eax,dword ptr [ebx+2B0]
 004BC438    call        SendTextMessage
 004BC43D    pop         esi
 004BC43E    pop         ebx
 004BC43F    ret
*}
end;

//004BC440
procedure TCustomComboBox.SetStyle(Value:TComboBoxStyle);
begin
{*
 004BC440    push        ebx
 004BC441    mov         ebx,eax
 004BC443    cmp         dl,byte ptr [ebx+2E6]
>004BC449    je          004BC477
 004BC44B    mov         byte ptr [ebx+2E6],dl
 004BC451    cmp         dl,1
>004BC454    jne         004BC465
 004BC456    mov         eax,[004BC47C]
 004BC45B    not         eax
 004BC45D    and         eax,dword ptr [ebx+50]
 004BC460    mov         dword ptr [ebx+50],eax
>004BC463    jmp         004BC470
 004BC465    mov         eax,[004BC47C]
 004BC46A    or          eax,dword ptr [ebx+50]
 004BC46D    mov         dword ptr [ebx+50],eax
 004BC470    mov         eax,ebx
 004BC472    call        TWinControl.RecreateWnd
 004BC477    pop         ebx
 004BC478    ret
*}
end;

//004BC480
function TCustomComboBox.GetItemHt:Integer;
begin
{*
 004BC480    movzx       edx,byte ptr [eax+2E6]
 004BC487    add         dl,0FD
 004BC48A    sub         dl,2
>004BC48D    jae         004BC496
 004BC48F    mov         eax,dword ptr [eax+2A8]
 004BC495    ret
 004BC496    push        0
 004BC498    xor         ecx,ecx
 004BC49A    mov         edx,154
 004BC49F    call        TControl.Perform
 004BC4A4    ret
*}
end;

//004BC4A8
function TCustomComboBox.IsItemHeightStored(Value:Integer):Boolean;
begin
{*
 004BC4A8    push        ebx
 004BC4A9    mov         ebx,eax
 004BC4AB    movzx       eax,byte ptr [ebx+2E6]
 004BC4B2    add         al,0FD
 004BC4B4    sub         al,2
>004BC4B6    jae         004BC4C3
 004BC4B8    mov         eax,ebx
 004BC4BA    call        TCustomCombo.IsItemHeightStored
 004BC4BF    test        al,al
>004BC4C1    jne         004BC4C7
 004BC4C3    xor         eax,eax
 004BC4C5    pop         ebx
 004BC4C6    ret
 004BC4C7    mov         al,1
 004BC4C9    pop         ebx
 004BC4CA    ret
*}
end;

//004BC4CC
procedure TCustomComboBox.CreateParams(var Params:TCreateParams);
begin
{*
 004BC4CC    push        ebx
 004BC4CD    push        esi
 004BC4CE    mov         esi,edx
 004BC4D0    mov         ebx,eax
 004BC4D2    mov         edx,esi
 004BC4D4    mov         eax,ebx
 004BC4D6    call        TWinControl.CreateParams
 004BC4DB    mov         ecx,4BC524
 004BC4E0    mov         edx,esi
 004BC4E2    mov         eax,ebx
 004BC4E4    call        TWinControl.CreateSubClass
 004BC4E9    mov         eax,dword ptr [esi+4]
 004BC4EC    or          eax,200240
 004BC4F1    movzx       edx,byte ptr [ebx+2E6]
 004BC4F8    or          eax,dword ptr [edx*4+785E00]
 004BC4FF    movzx       edx,byte ptr [ebx+2E5]
 004BC506    or          eax,dword ptr [edx*4+785E20]
 004BC50D    movzx       edx,byte ptr [ebx+2E4]
 004BC514    or          eax,dword ptr [edx*4+785E14]
 004BC51B    mov         dword ptr [esi+4],eax
 004BC51E    pop         esi
 004BC51F    pop         ebx
 004BC520    ret
*}
end;

//004BC538
procedure TCustomComboBox.CreateWnd;
begin
{*
 004BC538    push        ebx
 004BC539    push        esi
 004BC53A    push        edi
 004BC53B    mov         esi,eax
 004BC53D    mov         eax,esi
 004BC53F    call        TCustomCombo.CreateWnd
 004BC544    mov         eax,esi
 004BC546    call        TWinControl.GetHandle
 004BC54B    mov         dword ptr [esi+2B8],eax
 004BC551    mov         edi,dword ptr [esi+2E8]
 004BC557    test        edi,edi
>004BC559    je          004BC5CD
 004BC55B    mov         edx,edi
 004BC55D    mov         eax,dword ptr [esi+2AC]
 004BC563    mov         ecx,dword ptr [eax]
 004BC565    call        dword ptr [ecx+8]
 004BC568    mov         eax,dword ptr [esi+2E8]
 004BC56E    call        TObject.Free
 004BC573    xor         eax,eax
 004BC575    mov         dword ptr [esi+2E8],eax
 004BC57B    cmp         dword ptr [esi+2C8],0FFFFFFFF
>004BC582    je          004BC5CD
 004BC584    mov         eax,dword ptr [esi+2AC]
 004BC58A    mov         edx,dword ptr [eax]
 004BC58C    call        dword ptr [edx+14]
 004BC58F    cmp         eax,dword ptr [esi+2C8]
>004BC595    jge         004BC5A8
 004BC597    mov         eax,dword ptr [esi+2AC]
 004BC59D    mov         edx,dword ptr [eax]
 004BC59F    call        dword ptr [edx+14]
 004BC5A2    mov         dword ptr [esi+2C8],eax
 004BC5A8    push        0
 004BC5AA    mov         eax,dword ptr [esi+2C8]
 004BC5B0    push        eax
 004BC5B1    push        14E
 004BC5B6    mov         eax,esi
 004BC5B8    call        TWinControl.GetHandle
 004BC5BD    push        eax
 004BC5BE    call        user32.SendMessageW
 004BC5C3    mov         dword ptr [esi+2C8],0FFFFFFFF
 004BC5CD    movzx       eax,byte ptr [esi+2E6]
 004BC5D4    sub         al,2
>004BC5D6    jae         004BC656
 004BC5D8    push        5
 004BC5DA    mov         eax,esi
 004BC5DC    call        TWinControl.GetHandle
 004BC5E1    push        eax
 004BC5E2    call        user32.GetWindow
 004BC5E7    mov         ebx,eax
 004BC5E9    test        ebx,ebx
>004BC5EB    je          004BC656
 004BC5ED    cmp         byte ptr [esi+2E6],1
>004BC5F4    jne         004BC62B
 004BC5F6    mov         edi,ebx
 004BC5F8    mov         dword ptr [esi+2B4],edi
 004BC5FE    push        0FC
 004BC600    push        edi
 004BC601    call        user32.GetWindowLongW
 004BC606    mov         dword ptr [esi+2C0],eax
 004BC60C    mov         eax,dword ptr [esi+2D0]
 004BC612    push        eax
 004BC613    push        0FC
 004BC615    mov         eax,dword ptr [esi+2B4]
 004BC61B    push        eax
 004BC61C    call        user32.SetWindowLongW
 004BC621    push        2
 004BC623    push        ebx
 004BC624    call        user32.GetWindow
 004BC629    mov         ebx,eax
 004BC62B    mov         edi,ebx
 004BC62D    mov         dword ptr [esi+2B0],edi
 004BC633    push        0FC
 004BC635    push        edi
 004BC636    call        user32.GetWindowLongW
 004BC63B    mov         dword ptr [esi+2BC],eax
 004BC641    mov         eax,dword ptr [esi+2CC]
 004BC647    push        eax
 004BC648    push        0FC
 004BC64A    mov         eax,dword ptr [esi+2B0]
 004BC650    push        eax
 004BC651    call        user32.SetWindowLongW
 004BC656    mov         eax,[0078D264];^NewStyleControls:Boolean
 004BC65B    cmp         byte ptr [eax],0
>004BC65E    je          004BC67E
 004BC660    cmp         dword ptr [esi+2B0],0
>004BC667    je          004BC67E
 004BC669    push        0
 004BC66B    push        3
 004BC66D    push        0D3
 004BC672    mov         eax,dword ptr [esi+2B0]
 004BC678    push        eax
 004BC679    call        user32.SendMessageW
 004BC67E    mov         eax,esi
 004BC680    mov         edx,dword ptr [eax]
 004BC682    call        dword ptr [edx+13C]
 004BC688    pop         edi
 004BC689    pop         esi
 004BC68A    pop         ebx
 004BC68B    ret
*}
end;

//004BC68C
procedure TCustomComboBox.DestroyWnd;
begin
{*
 004BC68C    push        ebx
 004BC68D    push        esi
 004BC68E    mov         ebx,eax
 004BC690    mov         eax,dword ptr [ebx+2AC]
 004BC696    mov         edx,dword ptr [eax]
 004BC698    call        dword ptr [edx+14]
 004BC69B    test        eax,eax
>004BC69D    jle         004BC6D6
 004BC69F    test        byte ptr [ebx+55],20
>004BC6A3    je          004BC6D6
 004BC6A5    mov         eax,ebx
 004BC6A7    mov         edx,dword ptr [eax]
 004BC6A9    call        dword ptr [edx+0EC]
 004BC6AF    mov         dword ptr [ebx+2C8],eax
 004BC6B5    mov         dl,1
 004BC6B7    mov         eax,[0043C7BC];TStringList
 004BC6BC    call        TStringList.Create
 004BC6C1    mov         esi,eax
 004BC6C3    mov         dword ptr [ebx+2E8],esi
 004BC6C9    mov         edx,dword ptr [ebx+2AC]
 004BC6CF    mov         eax,esi
 004BC6D1    mov         ecx,dword ptr [eax]
 004BC6D3    call        dword ptr [ecx+8]
 004BC6D6    mov         eax,ebx
 004BC6D8    call        TWinControl.DestroyWnd
 004BC6DD    pop         esi
 004BC6DE    pop         ebx
 004BC6DF    ret
*}
end;

//004BC6E0
procedure TCustomComboBox.DoSetTextHint;
begin
{*
 004BC6E0    push        ebx
 004BC6E1    mov         ebx,eax
 004BC6E3    call        ThemeServices
 004BC6E8    call        TThemeServices.GetThemesEnabled
 004BC6ED    test        al,al
>004BC6EF    je          004BC754
 004BC6F1    mov         eax,ebx
 004BC6F3    call        TWinControl.HandleAllocated
 004BC6F8    test        al,al
>004BC6FA    je          004BC754
 004BC6FC    xor         edx,edx
 004BC6FE    mov         eax,6
 004BC703    call        CheckWin32Version
 004BC708    test        al,al
>004BC70A    je          004BC728
 004BC70C    mov         eax,dword ptr [ebx+308]
 004BC712    push        eax
 004BC713    mov         eax,ebx
 004BC715    call        TWinControl.GetHandle
 004BC71A    xor         ecx,ecx
 004BC71C    mov         edx,1703
 004BC721    call        SendTextMessage
>004BC726    jmp         004BC754
 004BC728    mov         edx,1
 004BC72D    mov         eax,5
 004BC732    call        CheckWin32Version
 004BC737    test        al,al
>004BC739    je          004BC754
 004BC73B    mov         eax,dword ptr [ebx+308]
 004BC741    push        eax
 004BC742    xor         ecx,ecx
 004BC744    mov         edx,1501
 004BC749    mov         eax,dword ptr [ebx+2B0]
 004BC74F    call        SendTextMessage
 004BC754    pop         ebx
 004BC755    ret
*}
end;

//004BC758
procedure TCustomComboBox.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 004BC758    push        ebx
 004BC759    push        esi
 004BC75A    add         esp,0FFFFFFF0
 004BC75D    mov         esi,edx
 004BC75F    mov         ebx,eax
 004BC761    cmp         byte ptr [ebx+2E6],1
>004BC768    jne         004BC7A1
 004BC76A    cmp         dword ptr [ebx+34],0
>004BC76E    je          004BC7A1
 004BC770    mov         eax,dword ptr [ebx+34]
 004BC773    mov         eax,dword ptr [eax+1C0]
 004BC779    call        TBrush.GetHandle
 004BC77E    push        eax
 004BC77F    lea         edx,[esp+4]
 004BC783    mov         eax,ebx
 004BC785    mov         ecx,dword ptr [eax]
 004BC787    call        dword ptr [ecx+54]
 004BC78A    lea         eax,[esp+4]
 004BC78E    push        eax
 004BC78F    mov         eax,dword ptr [esi+4]
 004BC792    push        eax
 004BC793    call        user32.FillRect
 004BC798    mov         dword ptr [esi+0C],1
>004BC79F    jmp         004BC7AA
 004BC7A1    mov         edx,esi
 004BC7A3    mov         eax,ebx
 004BC7A5    mov         ecx,dword ptr [eax]
 004BC7A7    call        dword ptr [ecx-10]
 004BC7AA    add         esp,10
 004BC7AD    pop         esi
 004BC7AE    pop         ebx
 004BC7AF    ret
*}
end;

//004BC7B0
function HasSelectedText(var StartPos:Integer; var EndPos:Integer):Boolean;
begin
{*
 004BC7B0    push        ebp
 004BC7B1    mov         ebp,esp
 004BC7B3    push        ebx
 004BC7B4    push        esi
 004BC7B5    mov         esi,edx
 004BC7B7    mov         ebx,eax
 004BC7B9    mov         eax,dword ptr [ebp+8]
 004BC7BC    mov         eax,dword ptr [eax-4]
 004BC7BF    movzx       eax,byte ptr [eax+2E6]
 004BC7C6    sub         al,2
>004BC7C8    jae         004BC7EB
 004BC7CA    push        esi
 004BC7CB    mov         eax,dword ptr [ebp+8]
 004BC7CE    mov         eax,dword ptr [eax-4]
 004BC7D1    call        TWinControl.GetHandle
 004BC7D6    mov         ecx,ebx
 004BC7D8    mov         edx,140
 004BC7DD    call        SendGetIntMessage
 004BC7E2    mov         eax,dword ptr [esi]
 004BC7E4    cmp         eax,dword ptr [ebx]
 004BC7E6    setg        al
>004BC7E9    jmp         004BC7ED
 004BC7EB    xor         eax,eax
 004BC7ED    pop         esi
 004BC7EE    pop         ebx
 004BC7EF    pop         ebp
 004BC7F0    ret
*}
end;

//004BC7F4
procedure DeleteSelectedText(const StartPos:DWORD; const EndPos:DWORD);
begin
{*
 004BC7F4    push        ebp
 004BC7F5    mov         ebp,esp
 004BC7F7    push        0
 004BC7F9    push        ebx
 004BC7FA    push        esi
 004BC7FB    mov         esi,edx
 004BC7FD    mov         ebx,eax
 004BC7FF    xor         eax,eax
 004BC801    push        ebp
 004BC802    push        4BC88B
 004BC807    push        dword ptr fs:[eax]
 004BC80A    mov         dword ptr fs:[eax],esp
 004BC80D    lea         edx,[ebp-4]
 004BC810    mov         eax,dword ptr [ebp+8]
 004BC813    mov         eax,dword ptr [eax-4]
 004BC816    call        TControl.GetText
 004BC81B    mov         ecx,esi
 004BC81D    sub         ecx,ebx
 004BC81F    lea         edx,[ebx+1]
 004BC822    lea         eax,[ebp-4]
 004BC825    call        @UStrDelete
 004BC82A    push        0
 004BC82C    push        0FF
 004BC82E    push        14E
 004BC833    mov         eax,dword ptr [ebp+8]
 004BC836    mov         eax,dword ptr [eax-4]
 004BC839    call        TWinControl.GetHandle
 004BC83E    push        eax
 004BC83F    call        user32.SendMessageW
 004BC844    mov         eax,dword ptr [ebp+8]
 004BC847    mov         eax,dword ptr [eax-4]
 004BC84A    mov         edx,dword ptr [ebp-4]
 004BC84D    call        TControl.SetText
 004BC852    movzx       esi,bx
 004BC855    mov         eax,esi
 004BC857    shl         esi,10
 004BC85A    or          eax,esi
 004BC85C    push        eax
 004BC85D    push        0
 004BC85F    push        142
 004BC864    mov         eax,dword ptr [ebp+8]
 004BC867    mov         eax,dword ptr [eax-4]
 004BC86A    call        TWinControl.GetHandle
 004BC86F    push        eax
 004BC870    call        user32.SendMessageW
 004BC875    xor         eax,eax
 004BC877    pop         edx
 004BC878    pop         ecx
 004BC879    pop         ecx
 004BC87A    mov         dword ptr fs:[eax],edx
 004BC87D    push        4BC892
 004BC882    lea         eax,[ebp-4]
 004BC885    call        @UStrClr
 004BC88A    ret
>004BC88B    jmp         @HandleFinally
>004BC890    jmp         004BC882
 004BC892    pop         esi
 004BC893    pop         ebx
 004BC894    pop         ecx
 004BC895    pop         ebp
 004BC896    ret
*}
end;

//004BC898
procedure TCustomComboBox.KeyPress(var Key:Char);
begin
{*
 004BC898    push        ebp
 004BC899    mov         ebp,esp
 004BC89B    mov         ecx,0C
 004BC8A0    push        0
 004BC8A2    push        0
 004BC8A4    dec         ecx
>004BC8A5    jne         004BC8A0
 004BC8A7    push        ebx
 004BC8A8    push        esi
 004BC8A9    push        edi
 004BC8AA    mov         ebx,edx
 004BC8AC    mov         dword ptr [ebp-4],eax
 004BC8AF    xor         eax,eax
 004BC8B1    push        ebp
 004BC8B2    push        4BCCE2
 004BC8B7    push        dword ptr fs:[eax]
 004BC8BA    mov         dword ptr fs:[eax],esp
 004BC8BD    mov         edx,ebx
 004BC8BF    mov         eax,dword ptr [ebp-4]
 004BC8C2    call        TWinControl.KeyPress
 004BC8C7    mov         eax,dword ptr [ebp-4]
 004BC8CA    cmp         byte ptr [eax+2D8],0
>004BC8D1    je          004BCC98
 004BC8D7    mov         eax,dword ptr [ebp-4]
 004BC8DA    movzx       eax,byte ptr [eax+2E6]
 004BC8E1    sub         al,2
>004BC8E3    jae         004BC902
 004BC8E5    lea         edx,[ebp-34]
 004BC8E8    mov         eax,dword ptr [ebp-4]
 004BC8EB    call        TControl.GetText
 004BC8F0    mov         edx,dword ptr [ebp-34]
 004BC8F3    mov         eax,dword ptr [ebp-4]
 004BC8F6    add         eax,2E0
 004BC8FB    call        @UStrAsg
>004BC900    jmp         004BC936
 004BC902    call        kernel32.GetTickCount
 004BC907    mov         edx,dword ptr [ebp-4]
 004BC90A    sub         eax,dword ptr [edx+2DC]
 004BC910    mov         edx,dword ptr [ebp-4]
 004BC913    cmp         eax,dword ptr [edx+304]
>004BC919    jb          004BC928
 004BC91B    mov         eax,dword ptr [ebp-4]
 004BC91E    add         eax,2E0
 004BC923    call        @UStrClr
 004BC928    call        kernel32.GetTickCount
 004BC92D    mov         edx,dword ptr [ebp-4]
 004BC930    mov         dword ptr [edx+2DC],eax
 004BC936    movzx       eax,word ptr [ebx]
 004BC939    sub         ax,8
>004BC93D    je          004BC982
 004BC93F    dec         ax
>004BC942    je          004BC953
 004BC944    sub         ax,12
>004BC948    jne         004BCB1D
>004BC94E    jmp         004BCC98
 004BC953    mov         eax,dword ptr [ebp-4]
 004BC956    cmp         byte ptr [eax+2D9],0
>004BC95D    je          004BCC98
 004BC963    mov         eax,dword ptr [ebp-4]
 004BC966    call        TCustomCombo.GetDroppedDown
 004BC96B    test        al,al
>004BC96D    je          004BCC98
 004BC973    xor         edx,edx
 004BC975    mov         eax,dword ptr [ebp-4]
 004BC978    call        TCustomCombo.SetDroppedDown
>004BC97D    jmp         004BCC98
 004BC982    push        ebp
 004BC983    lea         edx,[ebp-14]
 004BC986    lea         eax,[ebp-10]
 004BC989    call        HasSelectedText
 004BC98E    pop         ecx
 004BC98F    test        al,al
>004BC991    je          004BC9A5
 004BC993    push        ebp
 004BC994    mov         edx,dword ptr [ebp-14]
 004BC997    mov         eax,dword ptr [ebp-10]
 004BC99A    call        DeleteSelectedText
 004BC99F    pop         ecx
>004BC9A0    jmp         004BCB07
 004BC9A5    mov         eax,dword ptr [ebp-4]
 004BC9A8    movzx       eax,byte ptr [eax+2E6]
 004BC9AF    sub         al,2
>004BC9B1    jae         004BC9D7
 004BC9B3    lea         edx,[ebp-38]
 004BC9B6    mov         eax,dword ptr [ebp-4]
 004BC9B9    call        TControl.GetText
 004BC9BE    mov         eax,dword ptr [ebp-38]
 004BC9C1    mov         dword ptr [ebp-3C],eax
 004BC9C4    mov         eax,dword ptr [ebp-3C]
 004BC9C7    test        eax,eax
>004BC9C9    je          004BC9D0
 004BC9CB    sub         eax,4
 004BC9CE    mov         eax,dword ptr [eax]
 004BC9D0    test        eax,eax
 004BC9D2    setg        al
>004BC9D5    jmp         004BC9D9
 004BC9D7    xor         eax,eax
 004BC9D9    test        al,al
>004BC9DB    je          004BCABF
 004BC9E1    lea         edx,[ebp-0C]
 004BC9E4    mov         eax,dword ptr [ebp-4]
 004BC9E7    call        TControl.GetText
 004BC9EC    mov         esi,dword ptr [ebp-10]
>004BC9EF    jmp         004BC9F2
 004BC9F1    dec         esi
 004BC9F2    mov         edx,esi
 004BC9F4    mov         eax,dword ptr [ebp-0C]
 004BC9F7    call        ByteType
 004BC9FC    cmp         al,2
>004BC9FE    je          004BC9F1
 004BCA00    lea         eax,[ebp-8]
 004BCA03    push        eax
 004BCA04    mov         ecx,esi
 004BCA06    dec         ecx
 004BCA07    mov         edx,1
 004BCA0C    mov         eax,dword ptr [ebp-0C]
 004BCA0F    call        @UStrCopy
 004BCA14    push        0
 004BCA16    push        0FF
 004BCA18    push        14E
 004BCA1D    mov         eax,dword ptr [ebp-4]
 004BCA20    call        TWinControl.GetHandle
 004BCA25    push        eax
 004BCA26    call        user32.SendMessageW
 004BCA2B    lea         eax,[ebp-44]
 004BCA2E    push        eax
 004BCA2F    mov         edx,dword ptr [ebp-14]
 004BCA32    inc         edx
 004BCA33    mov         ecx,7FFFFFFF
 004BCA38    mov         eax,dword ptr [ebp-0C]
 004BCA3B    call        @UStrCopy
 004BCA40    mov         ecx,dword ptr [ebp-44]
 004BCA43    lea         eax,[ebp-40]
 004BCA46    mov         edx,dword ptr [ebp-8]
 004BCA49    call        @UStrCat3
 004BCA4E    mov         edx,dword ptr [ebp-40]
 004BCA51    mov         eax,dword ptr [ebp-4]
 004BCA54    call        TControl.SetText
 004BCA59    mov         edi,esi
 004BCA5B    dec         edi
 004BCA5C    movzx       edi,di
 004BCA5F    mov         eax,edi
 004BCA61    shl         edi,10
 004BCA64    or          eax,edi
 004BCA66    push        eax
 004BCA67    push        0
 004BCA69    push        142
 004BCA6E    mov         eax,dword ptr [ebp-4]
 004BCA71    call        TWinControl.GetHandle
 004BCA76    push        eax
 004BCA77    call        user32.SendMessageW
 004BCA7C    lea         edx,[ebp-48]
 004BCA7F    mov         eax,dword ptr [ebp-4]
 004BCA82    call        TControl.GetText
 004BCA87    mov         edx,dword ptr [ebp-48]
 004BCA8A    mov         eax,dword ptr [ebp-4]
 004BCA8D    add         eax,2E0
 004BCA92    call        @UStrAsg
>004BCA97    jmp         004BCB07
 004BCA99    mov         eax,dword ptr [ebp-4]
 004BCA9C    mov         esi,dword ptr [eax+2E0]
 004BCAA2    test        esi,esi
>004BCAA4    je          004BCAAB
 004BCAA6    sub         esi,4
 004BCAA9    mov         esi,dword ptr [esi]
 004BCAAB    mov         eax,dword ptr [ebp-4]
 004BCAAE    add         eax,2E0
 004BCAB3    mov         ecx,1
 004BCAB8    mov         edx,esi
 004BCABA    call        @UStrDelete
 004BCABF    mov         eax,dword ptr [ebp-4]
 004BCAC2    mov         eax,dword ptr [eax+2E0]
 004BCAC8    call        @UStrLen
 004BCACD    mov         edx,eax
 004BCACF    mov         eax,dword ptr [ebp-4]
 004BCAD2    mov         eax,dword ptr [eax+2E0]
 004BCAD8    call        ByteType
 004BCADD    cmp         al,2
>004BCADF    je          004BCA99
 004BCAE1    mov         eax,dword ptr [ebp-4]
 004BCAE4    mov         eax,dword ptr [eax+2E0]
 004BCAEA    test        eax,eax
>004BCAEC    je          004BCAF3
 004BCAEE    sub         eax,4
 004BCAF1    mov         eax,dword ptr [eax]
 004BCAF3    mov         edx,dword ptr [ebp-4]
 004BCAF6    add         edx,2E0
 004BCAFC    mov         ecx,1
 004BCB01    xchg        eax,edx
 004BCB02    call        @UStrDelete
 004BCB07    mov         word ptr [ebx],0
 004BCB0C    mov         eax,dword ptr [ebp-4]
 004BCB0F    mov         si,0FFAF
 004BCB13    call        @CallDynaInst
>004BCB18    jmp         004BCC98
 004BCB1D    mov         eax,dword ptr [ebp-4]
 004BCB20    cmp         byte ptr [eax+2D9],0
>004BCB27    je          004BCB3F
 004BCB29    mov         eax,dword ptr [ebp-4]
 004BCB2C    call        TCustomCombo.GetDroppedDown
 004BCB31    test        al,al
>004BCB33    jne         004BCB3F
 004BCB35    mov         dl,1
 004BCB37    mov         eax,dword ptr [ebp-4]
 004BCB3A    call        TCustomCombo.SetDroppedDown
 004BCB3F    push        ebp
 004BCB40    lea         edx,[ebp-14]
 004BCB43    lea         eax,[ebp-10]
 004BCB46    call        HasSelectedText
 004BCB4B    pop         ecx
 004BCB4C    mov         eax,dword ptr [ebp-4]
 004BCB4F    cmp         byte ptr [eax+2E6],2
>004BCB56    jae         004BCB72
 004BCB58    mov         eax,dword ptr [ebp-4]
 004BCB5B    mov         eax,dword ptr [eax+2E0]
 004BCB61    test        eax,eax
>004BCB63    je          004BCB6A
 004BCB65    sub         eax,4
 004BCB68    mov         eax,dword ptr [eax]
 004BCB6A    cmp         eax,dword ptr [ebp-10]
 004BCB6D    setg        al
>004BCB70    jmp         004BCB74
 004BCB72    xor         eax,eax
 004BCB74    test        al,al
>004BCB76    je          004BCBDF
 004BCB78    mov         eax,dword ptr [ebp-4]
 004BCB7B    mov         esi,dword ptr [eax+2E0]
 004BCB81    test        esi,esi
>004BCB83    je          004BCB8A
 004BCB85    sub         esi,4
 004BCB88    mov         esi,dword ptr [esi]
 004BCB8A    lea         eax,[ebp-4C]
 004BCB8D    push        eax
 004BCB8E    mov         eax,dword ptr [ebp-4]
 004BCB91    mov         eax,dword ptr [eax+2E0]
 004BCB97    mov         ecx,dword ptr [ebp-10]
 004BCB9A    mov         edx,1
 004BCB9F    call        @UStrCopy
 004BCBA4    push        dword ptr [ebp-4C]
 004BCBA7    lea         eax,[ebp-50]
 004BCBAA    movzx       edx,word ptr [ebx]
 004BCBAD    call        @UStrFromWChar
 004BCBB2    push        dword ptr [ebp-50]
 004BCBB5    lea         eax,[ebp-54]
 004BCBB8    push        eax
 004BCBB9    mov         edx,dword ptr [ebp-14]
 004BCBBC    inc         edx
 004BCBBD    mov         eax,dword ptr [ebp-4]
 004BCBC0    mov         eax,dword ptr [eax+2E0]
 004BCBC6    mov         ecx,esi
 004BCBC8    call        @UStrCopy
 004BCBCD    push        dword ptr [ebp-54]
 004BCBD0    lea         eax,[ebp-0C]
 004BCBD3    mov         edx,3
 004BCBD8    call        @UStrCatN
>004BCBDD    jmp         004BCBFE
 004BCBDF    lea         eax,[ebp-58]
 004BCBE2    movzx       edx,word ptr [ebx]
 004BCBE5    call        @UStrFromWChar
 004BCBEA    mov         ecx,dword ptr [ebp-58]
 004BCBED    mov         eax,dword ptr [ebp-4]
 004BCBF0    mov         edx,dword ptr [eax+2E0]
 004BCBF6    lea         eax,[ebp-0C]
 004BCBF9    call        @UStrCat3
 004BCBFE    movzx       eax,word ptr [ebx]
 004BCC01    cmp         ax,0D800
>004BCC05    jb          004BCC0D
 004BCC07    cmp         ax,0DFFF
>004BCC0B    jbe         004BCC11
 004BCC0D    xor         eax,eax
>004BCC0F    jmp         004BCC13
 004BCC11    mov         al,1
 004BCC13    test        al,al
>004BCC15    je          004BCC84
 004BCC17    push        0
 004BCC19    push        0
 004BCC1B    push        0
 004BCC1D    mov         eax,dword ptr [ebp-4]
 004BCC20    call        TWinControl.GetHandle
 004BCC25    push        eax
 004BCC26    lea         eax,[ebp-30]
 004BCC29    push        eax
 004BCC2A    call        user32.PeekMessageW
 004BCC2F    test        eax,eax
>004BCC31    je          004BCC98
 004BCC33    cmp         dword ptr [ebp-2C],102
>004BCC3A    jne         004BCC98
 004BCC3C    lea         eax,[ebp-60]
 004BCC3F    movzx       edx,word ptr [ebp-28]
 004BCC43    call        @UStrFromWChar
 004BCC48    mov         ecx,dword ptr [ebp-60]
 004BCC4B    lea         eax,[ebp-5C]
 004BCC4E    mov         edx,dword ptr [ebp-0C]
 004BCC51    call        @UStrCat3
 004BCC56    mov         edx,dword ptr [ebp-5C]
 004BCC59    mov         eax,dword ptr [ebp-4]
 004BCC5C    call        TCustomComboBox.SelectItem
 004BCC61    test        al,al
>004BCC63    je          004BCC98
 004BCC65    push        1
 004BCC67    push        0
 004BCC69    push        0
 004BCC6B    mov         eax,dword ptr [ebp-4]
 004BCC6E    call        TWinControl.GetHandle
 004BCC73    push        eax
 004BCC74    lea         eax,[ebp-30]
 004BCC77    push        eax
 004BCC78    call        user32.PeekMessageW
 004BCC7D    mov         word ptr [ebx],0
>004BCC82    jmp         004BCC98
 004BCC84    mov         edx,dword ptr [ebp-0C]
 004BCC87    mov         eax,dword ptr [ebp-4]
 004BCC8A    call        TCustomComboBox.SelectItem
 004BCC8F    test        al,al
>004BCC91    je          004BCC98
 004BCC93    mov         word ptr [ebx],0
 004BCC98    xor         eax,eax
 004BCC9A    pop         edx
 004BCC9B    pop         ecx
 004BCC9C    pop         ecx
 004BCC9D    mov         dword ptr fs:[eax],edx
 004BCCA0    push        4BCCE9
 004BCCA5    lea         eax,[ebp-60]
 004BCCA8    mov         edx,6
 004BCCAD    call        @UStrArrayClr
 004BCCB2    lea         eax,[ebp-48]
 004BCCB5    call        @UStrClr
 004BCCBA    lea         eax,[ebp-44]
 004BCCBD    mov         edx,2
 004BCCC2    call        @UStrArrayClr
 004BCCC7    lea         eax,[ebp-38]
 004BCCCA    mov         edx,2
 004BCCCF    call        @UStrArrayClr
 004BCCD4    lea         eax,[ebp-0C]
 004BCCD7    mov         edx,2
 004BCCDC    call        @UStrArrayClr
 004BCCE1    ret
>004BCCE2    jmp         @HandleFinally
>004BCCE7    jmp         004BCCA5
 004BCCE9    pop         edi
 004BCCEA    pop         esi
 004BCCEB    pop         ebx
 004BCCEC    mov         esp,ebp
 004BCCEE    pop         ebp
 004BCCEF    ret
*}
end;

//004BCCF0
function TCustomComboBox.SelectItem(const AnItem:UnicodeString):Boolean;
begin
{*
 004BCCF0    push        ebp
 004BCCF1    mov         ebp,esp
 004BCCF3    add         esp,0FFFFFFE0
 004BCCF6    push        ebx
 004BCCF7    push        esi
 004BCCF8    push        edi
 004BCCF9    xor         ecx,ecx
 004BCCFB    mov         dword ptr [ebp-1C],ecx
 004BCCFE    mov         dword ptr [ebp-14],ecx
 004BCD01    mov         dword ptr [ebp-18],ecx
 004BCD04    mov         dword ptr [ebp-4],ecx
 004BCD07    mov         ebx,edx
 004BCD09    mov         edi,eax
 004BCD0B    xor         eax,eax
 004BCD0D    push        ebp
 004BCD0E    push        4BCECB
 004BCD13    push        dword ptr fs:[eax]
 004BCD16    mov         dword ptr fs:[eax],esp
 004BCD19    mov         eax,ebx
 004BCD1B    test        eax,eax
>004BCD1D    je          004BCD24
 004BCD1F    sub         eax,4
 004BCD22    mov         eax,dword ptr [eax]
 004BCD24    test        eax,eax
>004BCD26    jne         004BCD49
 004BCD28    mov         byte ptr [ebp-5],0
 004BCD2C    or          edx,0FFFFFFFF
 004BCD2F    mov         eax,edi
 004BCD31    mov         ecx,dword ptr [eax]
 004BCD33    call        dword ptr [ecx+0F0]
 004BCD39    mov         eax,edi
 004BCD3B    mov         si,0FFAF
 004BCD3F    call        @CallDynaInst
>004BCD44    jmp         004BCEA0
 004BCD49    push        ebx
 004BCD4A    mov         eax,edi
 004BCD4C    call        TWinControl.GetHandle
 004BCD51    or          ecx,0FFFFFFFF
 004BCD54    mov         edx,14C
 004BCD59    call        SendTextMessage
 004BCD5E    mov         dword ptr [ebp-0C],eax
 004BCD61    cmp         dword ptr [ebp-0C],0FFFFFFFF
 004BCD65    setne       byte ptr [ebp-5]
 004BCD69    cmp         byte ptr [ebp-5],0
>004BCD6D    je          004BCEA0
 004BCD73    mov         eax,edi
 004BCD75    mov         edx,dword ptr [eax]
 004BCD77    call        dword ptr [edx+0EC]
 004BCD7D    cmp         eax,dword ptr [ebp-0C]
 004BCD80    setne       byte ptr [ebp-0D]
 004BCD84    cmp         byte ptr [edi+300],0
>004BCD8B    je          004BCDB3
 004BCD8D    mov         edx,ebx
 004BCD8F    mov         eax,dword ptr [edi+2AC]
 004BCD95    mov         ecx,dword ptr [eax]
 004BCD97    call        dword ptr [ecx+54]
 004BCD9A    inc         eax
>004BCD9B    je          004BCDB3
 004BCD9D    push        0
 004BCD9F    push        0
 004BCDA1    push        14F
 004BCDA6    mov         eax,edi
 004BCDA8    call        TWinControl.GetHandle
 004BCDAD    push        eax
 004BCDAE    call        user32.SendMessageW
 004BCDB3    push        0
 004BCDB5    mov         eax,dword ptr [ebp-0C]
 004BCDB8    push        eax
 004BCDB9    push        14E
 004BCDBE    mov         eax,edi
 004BCDC0    call        TWinControl.GetHandle
 004BCDC5    push        eax
 004BCDC6    call        user32.SendMessageW
 004BCDCB    movzx       eax,byte ptr [edi+2E6]
 004BCDD2    sub         al,2
>004BCDD4    jae         004BCE6A
 004BCDDA    lea         ecx,[ebp-4]
 004BCDDD    mov         edx,dword ptr [ebp-0C]
 004BCDE0    mov         eax,dword ptr [edi+2AC]
 004BCDE6    mov         esi,dword ptr [eax]
 004BCDE8    call        dword ptr [esi+0C]
 004BCDEB    mov         esi,ebx
 004BCDED    test        esi,esi
>004BCDEF    je          004BCDF6
 004BCDF1    sub         esi,4
 004BCDF4    mov         esi,dword ptr [esi]
 004BCDF6    lea         eax,[ebp-18]
 004BCDF9    push        eax
 004BCDFA    lea         edx,[esi+1]
 004BCDFD    mov         ecx,7FFFFFFF
 004BCE02    mov         eax,dword ptr [ebp-4]
 004BCE05    call        @UStrCopy
 004BCE0A    mov         ecx,dword ptr [ebp-18]
 004BCE0D    lea         eax,[ebp-14]
 004BCE10    mov         edx,ebx
 004BCE12    call        @UStrCat3
 004BCE17    mov         edx,dword ptr [ebp-14]
 004BCE1A    mov         eax,edi
 004BCE1C    call        TControl.SetText
 004BCE21    mov         eax,edi
 004BCE23    call        TWinControl.GetHandle
 004BCE28    mov         esi,eax
 004BCE2A    test        ebx,ebx
>004BCE2C    je          004BCE33
 004BCE2E    sub         ebx,4
 004BCE31    mov         ebx,dword ptr [ebx]
 004BCE33    lea         edx,[ebp-1C]
 004BCE36    mov         eax,edi
 004BCE38    call        TControl.GetText
 004BCE3D    mov         eax,dword ptr [ebp-1C]
 004BCE40    mov         dword ptr [ebp-20],eax
 004BCE43    mov         eax,dword ptr [ebp-20]
 004BCE46    test        eax,eax
>004BCE48    je          004BCE4F
 004BCE4A    sub         eax,4
 004BCE4D    mov         eax,dword ptr [eax]
 004BCE4F    movzx       edx,bx
 004BCE52    movzx       eax,ax
 004BCE55    shl         eax,10
 004BCE58    or          edx,eax
 004BCE5A    push        edx
 004BCE5B    push        0
 004BCE5D    push        142
 004BCE62    push        esi
 004BCE63    call        user32.SendMessageW
>004BCE68    jmp         004BCE84
 004BCE6A    mov         edx,dword ptr [ebp-0C]
 004BCE6D    mov         eax,edi
 004BCE6F    mov         ecx,dword ptr [eax]
 004BCE71    call        dword ptr [ecx+0F0]
 004BCE77    lea         eax,[edi+2E0]
 004BCE7D    mov         edx,ebx
 004BCE7F    call        @UStrAsg
 004BCE84    cmp         byte ptr [ebp-0D],0
>004BCE88    je          004BCEA0
 004BCE8A    mov         eax,edi
 004BCE8C    mov         si,0FFEC
 004BCE90    call        @CallDynaInst
 004BCE95    mov         eax,edi
 004BCE97    mov         si,0FFAE
 004BCE9B    call        @CallDynaInst
 004BCEA0    xor         eax,eax
 004BCEA2    pop         edx
 004BCEA3    pop         ecx
 004BCEA4    pop         ecx
 004BCEA5    mov         dword ptr fs:[eax],edx
 004BCEA8    push        4BCED2
 004BCEAD    lea         eax,[ebp-1C]
 004BCEB0    call        @UStrClr
 004BCEB5    lea         eax,[ebp-18]
 004BCEB8    mov         edx,2
 004BCEBD    call        @UStrArrayClr
 004BCEC2    lea         eax,[ebp-4]
 004BCEC5    call        @UStrClr
 004BCECA    ret
>004BCECB    jmp         @HandleFinally
>004BCED0    jmp         004BCEAD
 004BCED2    movzx       eax,byte ptr [ebp-5]
 004BCED6    pop         edi
 004BCED7    pop         esi
 004BCED8    pop         ebx
 004BCED9    mov         esp,ebp
 004BCEDB    pop         ebp
 004BCEDC    ret
*}
end;

//004BCEE0
procedure TCustomComboBox.MeasureItem(Index:Integer; var Height:Integer);
begin
{*
 004BCEE0    push        ebx
 004BCEE1    cmp         word ptr [eax+2FA],0
>004BCEE9    je          004BCEFE
 004BCEEB    push        ecx
 004BCEEC    mov         ebx,eax
 004BCEEE    mov         ecx,edx
 004BCEF0    mov         edx,eax
 004BCEF2    mov         eax,dword ptr [ebx+2FC]
 004BCEF8    call        dword ptr [ebx+2F8]
 004BCEFE    pop         ebx
 004BCEFF    ret
*}
end;

//004BCF00
procedure TCustomComboBox.CNDrawItem(var Message:TWMDrawItem);
begin
{*
 004BCF00    push        ebx
 004BCF01    push        esi
 004BCF02    push        edi
 004BCF03    push        ebp
 004BCF04    mov         esi,eax
 004BCF06    mov         ebx,dword ptr [edx+8]
 004BCF09    movzx       edi,word ptr [ebx+10]
 004BCF0D    mov         ebp,dword ptr [ebx+10]
 004BCF10    test        ebp,1000
>004BCF16    je          004BCF1D
 004BCF18    or          di,1000
 004BCF1D    test        ebp,20
>004BCF23    je          004BCF29
 004BCF25    or          di,20
 004BCF29    mov         edx,dword ptr [ebx+18]
 004BCF2C    mov         eax,dword ptr [esi+270]
 004BCF32    call        TCanvas.SetHandle
 004BCF37    mov         edx,dword ptr [esi+64]
 004BCF3A    mov         eax,dword ptr [esi+270]
 004BCF40    call        TCanvas.SetFont
 004BCF45    mov         edx,dword ptr [esi+1C0]
 004BCF4B    mov         eax,dword ptr [esi+270]
 004BCF51    call        TCanvas.SetBrush
 004BCF56    cmp         dword ptr [ebx+8],0
>004BCF5A    jl          004BCF89
 004BCF5C    test        di,1
>004BCF61    je          004BCF89
 004BCF63    mov         eax,dword ptr [esi+270]
 004BCF69    mov         eax,dword ptr [eax+48]
 004BCF6C    mov         edx,0FF00000D
 004BCF71    call        TBrush.SetColor
 004BCF76    mov         eax,dword ptr [esi+270]
 004BCF7C    mov         eax,dword ptr [eax+40]
 004BCF7F    mov         edx,0FF00000E
 004BCF84    call        TFont.SetColor
 004BCF89    mov         ebp,dword ptr [ebx+8]
 004BCF8C    test        ebp,ebp
>004BCF8E    jl          004BCFA2
 004BCF90    push        edi
 004BCF91    lea         ecx,[ebx+1C]
 004BCF94    mov         edx,ebp
 004BCF96    mov         eax,esi
 004BCF98    mov         ebp,dword ptr [eax]
 004BCF9A    call        dword ptr [ebp+140]
>004BCFA0    jmp         004BCFB0
 004BCFA2    lea         edx,[ebx+1C]
 004BCFA5    mov         eax,dword ptr [esi+270]
 004BCFAB    mov         ecx,dword ptr [eax]
 004BCFAD    call        dword ptr [ecx+54]
 004BCFB0    test        di,10
>004BCFB5    je          004BCFC4
 004BCFB7    lea         eax,[ebx+1C]
 004BCFBA    push        eax
 004BCFBB    mov         eax,dword ptr [ebx+18]
 004BCFBE    push        eax
 004BCFBF    call        user32.DrawFocusRect
 004BCFC4    xor         edx,edx
 004BCFC6    mov         eax,dword ptr [esi+270]
 004BCFCC    call        TCanvas.SetHandle
 004BCFD1    pop         ebp
 004BCFD2    pop         edi
 004BCFD3    pop         esi
 004BCFD4    pop         ebx
 004BCFD5    ret
*}
end;

//004BCFD8
procedure TCustomComboBox.CNMeasureItem(var Message:TWMMeasureItem);
begin
{*
 004BCFD8    push        ebx
 004BCFD9    push        esi
 004BCFDA    push        ecx
 004BCFDB    mov         edx,dword ptr [edx+8]
 004BCFDE    mov         ebx,edx
 004BCFE0    mov         edx,dword ptr [eax+2A8]
 004BCFE6    mov         dword ptr [ebx+10],edx
 004BCFE9    cmp         byte ptr [eax+2E6],4
>004BCFF0    jne         004BD00E
 004BCFF2    mov         edx,dword ptr [eax+2A8]
 004BCFF8    mov         dword ptr [esp],edx
 004BCFFB    mov         ecx,esp
 004BCFFD    mov         edx,dword ptr [ebx+8]
 004BD000    mov         esi,dword ptr [eax]
 004BD002    call        dword ptr [esi+144]
 004BD008    mov         eax,dword ptr [esp]
 004BD00B    mov         dword ptr [ebx+10],eax
 004BD00E    pop         edx
 004BD00F    pop         esi
 004BD010    pop         ebx
 004BD011    ret
*}
end;

//004BD014
procedure TCustomComboBox.WMLButtonDown(var Message:TWMLButtonDown);
begin
{*
 004BD014    push        ebx
 004BD015    push        esi
 004BD016    mov         esi,edx
 004BD018    mov         ebx,eax
 004BD01A    mov         eax,ebx
 004BD01C    call        TControl.GetDragMode
 004BD021    cmp         al,1
>004BD023    jne         004BD05B
 004BD025    cmp         byte ptr [ebx+2E6],2
>004BD02C    jne         004BD05B
 004BD02E    push        15
 004BD030    call        user32.GetSystemMetrics
 004BD035    mov         edx,dword ptr [ebx+48]
 004BD038    sub         edx,eax
 004BD03A    movsx       eax,word ptr [esi+8]
 004BD03E    cmp         edx,eax
>004BD040    jle         004BD05B
 004BD042    mov         eax,ebx
 004BD044    mov         edx,dword ptr [eax]
 004BD046    call        dword ptr [edx+0E8]
 004BD04C    or          ecx,0FFFFFFFF
 004BD04F    xor         edx,edx
 004BD051    mov         eax,ebx
 004BD053    call        TControl.BeginDrag
 004BD058    pop         esi
 004BD059    pop         ebx
 004BD05A    ret
 004BD05B    mov         edx,esi
 004BD05D    mov         eax,ebx
 004BD05F    call        TControl.WMLButtonDown
 004BD064    mov         eax,ebx
 004BD066    call        TControl.GetMouseCapture
 004BD06B    test        al,al
>004BD06D    je          004BD08D
 004BD06F    mov         dl,1
 004BD071    mov         eax,ebx
 004BD073    call        GetParentForm
 004BD078    test        eax,eax
>004BD07A    je          004BD08D
 004BD07C    cmp         ebx,dword ptr [eax+290]
>004BD082    je          004BD08D
 004BD084    xor         edx,edx
 004BD086    mov         eax,ebx
 004BD088    call        TControl.SetMouseCapture
 004BD08D    pop         esi
 004BD08E    pop         ebx
 004BD08F    ret
*}
end;

//004BD090
procedure TCustomComboBox.WndProc(var Message:TMessage);
begin
{*
 004BD090    push        ebx
 004BD091    push        esi
 004BD092    mov         esi,edx
 004BD094    mov         ebx,eax
 004BD096    mov         eax,dword ptr [esi]
 004BD098    add         eax,0FFFF42CE
 004BD09D    sub         eax,7
>004BD0A0    jae         004BD0CF
 004BD0A2    mov         eax,[0078D264];^NewStyleControls:Boolean
 004BD0A7    cmp         byte ptr [eax],0
>004BD0AA    jne         004BD0CF
 004BD0AC    cmp         byte ptr [ebx+2E6],2
>004BD0B3    jae         004BD0CF
 004BD0B5    cmp         dword ptr [ebx+34],0
>004BD0B9    je          004BD0CF
 004BD0BB    mov         eax,dword ptr [ebx+34]
 004BD0BE    mov         eax,dword ptr [eax+1C0]
 004BD0C4    call        TBrush.GetHandle
 004BD0C9    mov         dword ptr [esi+0C],eax
 004BD0CC    pop         esi
 004BD0CD    pop         ebx
 004BD0CE    ret
 004BD0CF    mov         edx,esi
 004BD0D1    mov         eax,ebx
 004BD0D3    call        TCustomCombo.WndProc
 004BD0D8    pop         esi
 004BD0D9    pop         ebx
 004BD0DA    ret
*}
end;

//004BD0DC
function TCustomComboBox.GetItemCount:Integer;
begin
{*
 004BD0DC    mov         eax,dword ptr [eax+2AC]
 004BD0E2    mov         edx,dword ptr [eax]
 004BD0E4    call        dword ptr [edx+14]
 004BD0E7    ret
*}
end;

//004BD0E8
constructor TComboBoxStrings.Create;
begin
{*
 004BD0E8    mov         eax,[004B82E0];TComboBoxStrings
 004BD0ED    ret
*}
end;

//004BD0F0
procedure TCustomComboBox.WMPaint(var Message:TWMPaint);
begin
{*
 004BD0F0    push        ebp
 004BD0F1    mov         ebp,esp
 004BD0F3    add         esp,0FFFFFFEC
 004BD0F6    push        ebx
 004BD0F7    mov         ebx,eax
 004BD0F9    mov         eax,ebx
 004BD0FB    call        TWinControl.WMPaint
 004BD100    cmp         byte ptr [ebx+1B1],0
>004BD107    je          004BD2B5
 004BD10D    mov         dl,1
 004BD10F    mov         eax,[00476D34];TControlCanvas
 004BD114    call        TCanvas.Create
 004BD119    mov         dword ptr [ebp-4],eax
 004BD11C    xor         edx,edx
 004BD11E    push        ebp
 004BD11F    push        4BD2AE
 004BD124    push        dword ptr fs:[edx]
 004BD127    mov         dword ptr fs:[edx],esp
 004BD12A    mov         edx,ebx
 004BD12C    mov         eax,dword ptr [ebp-4]
 004BD12F    call        TControlCanvas.SetControl
 004BD134    lea         edx,[ebp-14]
 004BD137    mov         eax,ebx
 004BD139    mov         ecx,dword ptr [eax]
 004BD13B    call        dword ptr [ecx+54]
 004BD13E    mov         edx,dword ptr [ebx+6C]
 004BD141    mov         eax,dword ptr [ebp-4]
 004BD144    mov         eax,dword ptr [eax+48]
 004BD147    call        TBrush.SetColor
 004BD14C    lea         edx,[ebp-14]
 004BD14F    mov         eax,dword ptr [ebp-4]
 004BD152    mov         ecx,dword ptr [eax]
 004BD154    call        dword ptr [ecx+5C]
 004BD157    push        0FF
 004BD159    push        0FF
 004BD15B    lea         eax,[ebp-14]
 004BD15E    push        eax
 004BD15F    call        user32.InflateRect
 004BD164    lea         edx,[ebp-14]
 004BD167    mov         eax,dword ptr [ebp-4]
 004BD16A    mov         ecx,dword ptr [eax]
 004BD16C    call        dword ptr [ecx+5C]
 004BD16F    cmp         byte ptr [ebx+1B1],0
>004BD176    je          004BD298
 004BD17C    xor         eax,eax
 004BD17E    cmp         byte ptr [ebx+1AF],0
>004BD185    je          004BD18F
 004BD187    mov         edx,dword ptr [ebx+1B4]
 004BD18D    add         eax,edx
 004BD18F    cmp         byte ptr [ebx+1B0],0
>004BD196    je          004BD1A0
 004BD198    mov         edx,dword ptr [ebx+1B4]
 004BD19E    add         eax,edx
 004BD1A0    test        eax,eax
>004BD1A2    jne         004BD1DF
 004BD1A4    lea         edx,[ebp-14]
 004BD1A7    mov         eax,ebx
 004BD1A9    mov         ecx,dword ptr [eax]
 004BD1AB    call        dword ptr [ecx+54]
 004BD1AE    mov         edx,dword ptr [ebx+6C]
 004BD1B1    mov         eax,dword ptr [ebp-4]
 004BD1B4    mov         eax,dword ptr [eax+48]
 004BD1B7    call        TBrush.SetColor
 004BD1BC    lea         edx,[ebp-14]
 004BD1BF    mov         eax,dword ptr [ebp-4]
 004BD1C2    mov         ecx,dword ptr [eax]
 004BD1C4    call        dword ptr [ecx+5C]
 004BD1C7    push        0FF
 004BD1C9    push        0FF
 004BD1CB    lea         eax,[ebp-14]
 004BD1CE    push        eax
 004BD1CF    call        user32.InflateRect
 004BD1D4    lea         edx,[ebp-14]
 004BD1D7    mov         eax,dword ptr [ebp-4]
 004BD1DA    mov         ecx,dword ptr [eax]
 004BD1DC    call        dword ptr [ecx+5C]
 004BD1DF    lea         edx,[ebp-14]
 004BD1E2    mov         eax,ebx
 004BD1E4    mov         ecx,dword ptr [eax]
 004BD1E6    call        dword ptr [ecx+54]
 004BD1E9    movzx       eax,byte ptr [ebx+1AE]
 004BD1F0    movzx       edx,byte ptr [ebx+1B1]
 004BD1F7    or          eax,dword ptr [edx*4+785E48]
 004BD1FE    movzx       edx,byte ptr [ebx+1E9]
 004BD205    or          eax,dword ptr [edx*4+785E58]
 004BD20C    or          eax,2000
 004BD211    push        eax
 004BD212    movzx       eax,byte ptr [ebx+1AF]
 004BD219    mov         eax,dword ptr [eax*4+785E28]
 004BD220    movzx       edx,byte ptr [ebx+1B0]
 004BD227    or          eax,dword ptr [edx*4+785E38]
 004BD22E    push        eax
 004BD22F    lea         eax,[ebp-14]
 004BD232    push        eax
 004BD233    mov         eax,dword ptr [ebp-4]
 004BD236    call        TCanvas.GetHandle
 004BD23B    push        eax
 004BD23C    call        user32.DrawEdge
 004BD241    push        0A
 004BD243    call        user32.GetSystemMetrics
 004BD248    mov         edx,dword ptr [ebp-0C]
 004BD24B    sub         edx,eax
 004BD24D    mov         dword ptr [ebp-14],edx
 004BD250    cmp         byte ptr [ebx+2E6],1
>004BD257    je          004BD298
 004BD259    mov         eax,ebx
 004BD25B    call        TCustomCombo.GetDroppedDown
 004BD260    test        al,al
>004BD262    je          004BD27F
 004BD264    push        4005
 004BD269    push        3
 004BD26B    lea         eax,[ebp-14]
 004BD26E    push        eax
 004BD26F    mov         eax,dword ptr [ebp-4]
 004BD272    call        TCanvas.GetHandle
 004BD277    push        eax
 004BD278    call        user32.DrawFrameControl
>004BD27D    jmp         004BD298
 004BD27F    push        4005
 004BD284    push        3
 004BD286    lea         eax,[ebp-14]
 004BD289    push        eax
 004BD28A    mov         eax,dword ptr [ebp-4]
 004BD28D    call        TCanvas.GetHandle
 004BD292    push        eax
 004BD293    call        user32.DrawFrameControl
 004BD298    xor         eax,eax
 004BD29A    pop         edx
 004BD29B    pop         ecx
 004BD29C    pop         ecx
 004BD29D    mov         dword ptr fs:[eax],edx
 004BD2A0    push        4BD2B5
 004BD2A5    mov         eax,dword ptr [ebp-4]
 004BD2A8    call        TObject.Free
 004BD2AD    ret
>004BD2AE    jmp         @HandleFinally
>004BD2B3    jmp         004BD2A5
 004BD2B5    pop         ebx
 004BD2B6    mov         esp,ebp
 004BD2B8    pop         ebp
 004BD2B9    ret
*}
end;

//004BD2BC
procedure TButtonActionLink.AssignClient(AClient:TObject);
begin
{*
 004BD2BC    push        ebx
 004BD2BD    push        esi
 004BD2BE    mov         esi,edx
 004BD2C0    mov         ebx,eax
 004BD2C2    mov         edx,esi
 004BD2C4    mov         eax,ebx
 004BD2C6    call        TWinControlActionLink.AssignClient
 004BD2CB    mov         eax,esi
 004BD2CD    mov         edx,dword ptr ds:[4B2BD0];TButtonControl
 004BD2D3    call        @AsClass
 004BD2D8    mov         dword ptr [ebx+28],eax
 004BD2DB    pop         esi
 004BD2DC    pop         ebx
 004BD2DD    ret
*}
end;

//004BD2E0
function TButtonActionLink.IsCheckedLinked:Boolean;
begin
{*
 004BD2E0    push        ebx
 004BD2E1    mov         ebx,eax
 004BD2E3    mov         eax,ebx
 004BD2E5    call        TActionLink.IsCheckedLinked
 004BD2EA    test        al,al
>004BD2EC    je          004BD301
 004BD2EE    mov         eax,dword ptr [ebx+28]
 004BD2F1    mov         edx,dword ptr [eax]
 004BD2F3    call        dword ptr [edx+0EC]
 004BD2F9    mov         edx,dword ptr [ebx+10]
 004BD2FC    cmp         al,byte ptr [edx+69]
>004BD2FF    je          004BD305
 004BD301    xor         eax,eax
 004BD303    pop         ebx
 004BD304    ret
 004BD305    mov         al,1
 004BD307    pop         ebx
 004BD308    ret
*}
end;

//004BD30C
procedure TButtonActionLink.SetChecked(Value:Boolean);
begin
{*
 004BD30C    push        ebp
 004BD30D    mov         ebp,esp
 004BD30F    push        ecx
 004BD310    push        ebx
 004BD311    mov         ebx,edx
 004BD313    mov         dword ptr [ebp-4],eax
 004BD316    mov         eax,dword ptr [ebp-4]
 004BD319    mov         edx,dword ptr [eax]
 004BD31B    call        dword ptr [edx+24]
 004BD31E    test        al,al
>004BD320    je          004BD369
 004BD322    mov         eax,dword ptr [ebp-4]
 004BD325    mov         eax,dword ptr [eax+28]
 004BD328    mov         byte ptr [eax+270],1
 004BD32F    xor         edx,edx
 004BD331    push        ebp
 004BD332    push        4BD362
 004BD337    push        dword ptr fs:[edx]
 004BD33A    mov         dword ptr fs:[edx],esp
 004BD33D    mov         edx,ebx
 004BD33F    mov         ecx,dword ptr [eax]
 004BD341    call        dword ptr [ecx+0F0]
 004BD347    xor         eax,eax
 004BD349    pop         edx
 004BD34A    pop         ecx
 004BD34B    pop         ecx
 004BD34C    mov         dword ptr fs:[eax],edx
 004BD34F    push        4BD369
 004BD354    mov         eax,dword ptr [ebp-4]
 004BD357    mov         eax,dword ptr [eax+28]
 004BD35A    mov         byte ptr [eax+270],0
 004BD361    ret
>004BD362    jmp         @HandleFinally
>004BD367    jmp         004BD354
 004BD369    pop         ebx
 004BD36A    pop         ecx
 004BD36B    pop         ebp
 004BD36C    ret
*}
end;

//004BD370
constructor TButtonControl.Create;
begin
{*
 004BD370    push        ebx
 004BD371    push        esi
 004BD372    test        dl,dl
>004BD374    je          004BD37E
 004BD376    add         esp,0FFFFFFF0
 004BD379    call        @ClassCreate
 004BD37E    mov         ebx,edx
 004BD380    mov         esi,eax
 004BD382    xor         edx,edx
 004BD384    mov         eax,esi
 004BD386    call        TWinControl.Create
 004BD38B    mov         eax,[0078DB7C];SysLocale:TSysLocale
 004BD390    cmp         byte ptr [eax+0C],0
>004BD394    je          004BD3A7
 004BD396    mov         eax,[0078DB58];^gvar_00784C7C
 004BD39B    cmp         dword ptr [eax],2
>004BD39E    jne         004BD3A7
 004BD3A0    mov         byte ptr [esi+1CC],0
 004BD3A7    mov         eax,esi
 004BD3A9    test        bl,bl
>004BD3AB    je          004BD3BC
 004BD3AD    call        @AfterConstruction
 004BD3B2    pop         dword ptr fs:[0]
 004BD3B9    add         esp,0C
 004BD3BC    mov         eax,esi
 004BD3BE    pop         esi
 004BD3BF    pop         ebx
 004BD3C0    ret
*}
end;

//004BD3C4
procedure TButtonControl.ActionChange(Sender:TObject; CheckDefaults:Boolean);
begin
{*
 004BD3C4    push        ebx
 004BD3C5    push        esi
 004BD3C6    push        edi
 004BD3C7    mov         ebx,ecx
 004BD3C9    mov         esi,edx
 004BD3CB    mov         edi,eax
 004BD3CD    mov         ecx,ebx
 004BD3CF    mov         edx,esi
 004BD3D1    mov         eax,edi
 004BD3D3    call        TWinControl.ActionChange
 004BD3D8    mov         eax,esi
 004BD3DA    mov         edx,dword ptr ds:[4743FC];TCustomAction
 004BD3E0    call        @IsClass
 004BD3E5    test        al,al
>004BD3E7    je          004BD41D
 004BD3E9    test        bl,bl
>004BD3EB    je          004BD3FB
 004BD3ED    mov         eax,edi
 004BD3EF    mov         edx,dword ptr [eax]
 004BD3F1    call        dword ptr [edx+0EC]
 004BD3F7    test        al,al
>004BD3F9    jne         004BD41D
 004BD3FB    movzx       ebx,byte ptr [edi+270]
 004BD402    mov         byte ptr [edi+270],1
 004BD409    movzx       edx,byte ptr [esi+69]
 004BD40D    mov         eax,edi
 004BD40F    mov         ecx,dword ptr [eax]
 004BD411    call        dword ptr [ecx+0F0]
 004BD417    mov         byte ptr [edi+270],bl
 004BD41D    pop         edi
 004BD41E    pop         esi
 004BD41F    pop         ebx
 004BD420    ret
*}
end;

//004BD424
procedure TButtonControl.sub_0048751C;
begin
{*
 004BD424    mov         eax,[004B2A84];TButtonActionLink
 004BD429    ret
*}
end;

//004BD42C
{*function sub_004BD42C:?;
begin
 004BD42C    xor         eax,eax
 004BD42E    ret
end;*}

//004BD430
function TButtonControl.IsCheckedStored(Value:Boolean):Boolean;
begin
{*
 004BD430    push        ebx
 004BD431    push        esi
 004BD432    mov         ebx,eax
 004BD434    mov         esi,dword ptr [ebx+68]
 004BD437    test        esi,esi
>004BD439    je          004BD44B
 004BD43B    mov         eax,esi
 004BD43D    mov         edx,dword ptr [eax]
 004BD43F    call        dword ptr [edx+24]
 004BD442    test        al,al
>004BD444    je          004BD44B
 004BD446    xor         eax,eax
 004BD448    pop         esi
 004BD449    pop         ebx
 004BD44A    ret
 004BD44B    mov         al,1
 004BD44D    pop         esi
 004BD44E    pop         ebx
 004BD44F    ret
*}
end;

//004BD450
procedure sub_004BD450;
begin
{*
 004BD450    ret
*}
end;

//004BD454
procedure TButtonControl.WndProc(var Message:TMessage);
begin
{*
 004BD454    push        ebx
 004BD455    push        esi
 004BD456    push        edi
 004BD457    mov         edi,edx
 004BD459    mov         ebx,eax
 004BD45B    mov         eax,dword ptr [edi]
 004BD45D    sub         eax,201
>004BD462    je          004BD472
 004BD464    sub         eax,2
>004BD467    je          004BD472
 004BD469    sub         eax,0BB0E
>004BD46E    je          004BD4B3
>004BD470    jmp         004BD4BC
 004BD472    test        byte ptr [ebx+1C],10
>004BD476    jne         004BD4BC
 004BD478    mov         eax,ebx
 004BD47A    mov         si,0FFB3
 004BD47E    call        @CallDynaInst
 004BD483    test        al,al
>004BD485    jne         004BD4BC
 004BD487    mov         byte ptr [ebx+270],1
 004BD48E    mov         eax,ebx
 004BD490    call        TWinControl.GetHandle
 004BD495    push        eax
 004BD496    call        user32.SetFocus
 004BD49B    mov         byte ptr [ebx+270],0
 004BD4A2    mov         eax,ebx
 004BD4A4    mov         si,0FFB3
 004BD4A8    call        @CallDynaInst
 004BD4AD    test        al,al
>004BD4AF    je          004BD4C5
>004BD4B1    jmp         004BD4BC
 004BD4B3    cmp         byte ptr [ebx+270],0
>004BD4BA    jne         004BD4C5
 004BD4BC    mov         edx,edi
 004BD4BE    mov         eax,ebx
 004BD4C0    call        TWinControl.WndProc
 004BD4C5    pop         edi
 004BD4C6    pop         esi
 004BD4C7    pop         ebx
 004BD4C8    ret
*}
end;

//004BD4CC
procedure TButtonControl.CNCtlColorStatic(var Message:TWMCtlColorStatic);
begin
{*
 004BD4CC    push        ebx
 004BD4CD    push        esi
 004BD4CE    push        edi
 004BD4CF    mov         esi,edx
 004BD4D1    mov         ebx,eax
 004BD4D3    call        ThemeServices
 004BD4D8    mov         edi,eax
 004BD4DA    mov         eax,ebx
 004BD4DC    call        ThemeControl
 004BD4E1    test        al,al
>004BD4E3    je          004BD526
 004BD4E5    mov         eax,dword ptr [ebx+34]
 004BD4E8    test        eax,eax
>004BD4EA    je          004BD501
 004BD4EC    cmp         byte ptr [eax+260],0
>004BD4F3    je          004BD501
 004BD4F5    mov         edx,dword ptr [esi+4]
 004BD4F8    mov         eax,ebx
 004BD4FA    call        PerformEraseBackground
>004BD4FF    jmp         004BD51A
 004BD501    push        0
 004BD503    push        0
 004BD505    push        0
 004BD507    mov         eax,ebx
 004BD509    call        TWinControl.GetHandle
 004BD50E    mov         edx,eax
 004BD510    mov         ecx,dword ptr [esi+4]
 004BD513    mov         eax,edi
 004BD515    call        TThemeServices.DrawParentBackground
 004BD51A    push        5
 004BD51C    call        gdi32.GetStockObject
 004BD521    mov         dword ptr [esi+0C],eax
>004BD524    jmp         004BD52F
 004BD526    mov         edx,esi
 004BD528    mov         eax,ebx
 004BD52A    mov         ecx,dword ptr [eax]
 004BD52C    call        dword ptr [ecx-10]
 004BD52F    pop         edi
 004BD530    pop         esi
 004BD531    pop         ebx
 004BD532    ret
*}
end;

//004BD534
procedure TButtonControl.WMEraseBkGnd(var Message:TWMEraseBkgnd);
begin
{*
 004BD534    push        ebx
 004BD535    push        esi
 004BD536    mov         esi,edx
 004BD538    mov         ebx,eax
 004BD53A    call        ThemeServices
 004BD53F    call        TThemeServices.GetThemesEnabled
 004BD544    test        al,al
>004BD546    je          004BD552
 004BD548    mov         dword ptr [esi+0C],1
 004BD54F    pop         esi
 004BD550    pop         ebx
 004BD551    ret
 004BD552    mov         edx,esi
 004BD554    mov         eax,ebx
 004BD556    call        TWinControl.WMEraseBkgnd
 004BD55B    pop         esi
 004BD55C    pop         ebx
 004BD55D    ret
*}
end;

//004BD560
procedure TButtonControl.CreateParams(var Params:TCreateParams);
begin
{*
 004BD560    push        ebx
 004BD561    push        esi
 004BD562    mov         esi,edx
 004BD564    mov         ebx,eax
 004BD566    mov         edx,esi
 004BD568    mov         eax,ebx
 004BD56A    call        TWinControl.CreateParams
 004BD56F    cmp         byte ptr [ebx+271],0
>004BD576    je          004BD57F
 004BD578    or          dword ptr [esi+4],2000
 004BD57F    pop         esi
 004BD580    pop         ebx
 004BD581    ret
*}
end;

//004BD584
procedure TButtonControl.SetWordWrap(const Value:Boolean);
begin
{*
 004BD584    cmp         dl,byte ptr [eax+271]
>004BD58A    je          004BD597
 004BD58C    mov         byte ptr [eax+271],dl
 004BD592    call        TWinControl.RecreateWnd
 004BD597    ret
*}
end;

//004BD598
procedure TImageMargins.Assign(Source:TPersistent);
begin
{*
 004BD598    push        ebx
 004BD599    push        esi
 004BD59A    mov         esi,edx
 004BD59C    mov         ebx,eax
 004BD59E    mov         eax,esi
 004BD5A0    mov         edx,dword ptr ds:[4B2E44];TImageMargins
 004BD5A6    call        @IsClass
 004BD5AB    test        al,al
>004BD5AD    je          004BD5D3
 004BD5AF    mov         eax,esi
 004BD5B1    mov         edx,dword ptr [eax+10]
 004BD5B4    mov         dword ptr [ebx+10],edx
 004BD5B7    mov         edx,dword ptr [eax+0C]
 004BD5BA    mov         dword ptr [ebx+0C],edx
 004BD5BD    mov         edx,dword ptr [eax+4]
 004BD5C0    mov         dword ptr [ebx+4],edx
 004BD5C3    mov         eax,dword ptr [eax+8]
 004BD5C6    mov         dword ptr [ebx+8],eax
 004BD5C9    mov         eax,ebx
 004BD5CB    mov         edx,dword ptr [eax]
 004BD5CD    call        dword ptr [edx+0C]
 004BD5D0    pop         esi
 004BD5D1    pop         ebx
 004BD5D2    ret
 004BD5D3    mov         edx,esi
 004BD5D5    mov         eax,ebx
 004BD5D7    call        TPersistent.Assign
 004BD5DC    pop         esi
 004BD5DD    pop         ebx
 004BD5DE    ret
*}
end;

//004BD5E0
procedure TImageMargins.Change;
begin
{*
 004BD5E0    push        ebx
 004BD5E1    cmp         word ptr [eax+1A],0
>004BD5E6    je          004BD5F2
 004BD5E8    mov         ebx,eax
 004BD5EA    mov         edx,eax
 004BD5EC    mov         eax,dword ptr [ebx+1C]
 004BD5EF    call        dword ptr [ebx+18]
 004BD5F2    pop         ebx
 004BD5F3    ret
*}
end;

//004BD5F4
procedure TImageMargins.SetMargin(Index:Integer; Value:Integer);
begin
{*
 004BD5F4    sub         edx,1
>004BD5F7    jb          004BD603
>004BD5F9    je          004BD611
 004BD5FB    dec         edx
>004BD5FC    je          004BD61F
 004BD5FE    dec         edx
>004BD5FF    je          004BD62D
>004BD601    jmp         004BD63A
 004BD603    cmp         ecx,dword ptr [eax+10]
>004BD606    je          004BD63A
 004BD608    mov         dword ptr [eax+10],ecx
 004BD60B    mov         edx,dword ptr [eax]
 004BD60D    call        dword ptr [edx+0C]
 004BD610    ret
 004BD611    cmp         ecx,dword ptr [eax+0C]
>004BD614    je          004BD63A
 004BD616    mov         dword ptr [eax+0C],ecx
 004BD619    mov         edx,dword ptr [eax]
 004BD61B    call        dword ptr [edx+0C]
 004BD61E    ret
 004BD61F    cmp         ecx,dword ptr [eax+4]
>004BD622    je          004BD63A
 004BD624    mov         dword ptr [eax+4],ecx
 004BD627    mov         edx,dword ptr [eax]
 004BD629    call        dword ptr [edx+0C]
 004BD62C    ret
 004BD62D    cmp         ecx,dword ptr [eax+8]
>004BD630    je          004BD63A
 004BD632    mov         dword ptr [eax+8],ecx
 004BD635    mov         edx,dword ptr [eax]
 004BD637    call        dword ptr [edx+0C]
 004BD63A    ret
*}
end;

//004BD63C
function TPushButtonActionLink.IsImageIndexLinked:Boolean;
begin
{*
 004BD63C    push        ebx
 004BD63D    mov         ebx,eax
 004BD63F    mov         eax,ebx
 004BD641    call        TActionLink.IsImageIndexLinked
 004BD646    test        al,al
>004BD648    je          004BD65E
 004BD64A    mov         eax,dword ptr [ebx+28]
 004BD64D    mov         eax,dword ptr [eax+29C]
 004BD653    mov         edx,dword ptr [ebx+10]
 004BD656    cmp         eax,dword ptr [edx+80]
>004BD65C    je          004BD662
 004BD65E    xor         eax,eax
 004BD660    pop         ebx
 004BD661    ret
 004BD662    mov         al,1
 004BD664    pop         ebx
 004BD665    ret
*}
end;

//004BD668
procedure TPushButtonActionLink.SetImageIndex(Value:Integer);
begin
{*
 004BD668    push        ebx
 004BD669    push        esi
 004BD66A    mov         esi,edx
 004BD66C    mov         ebx,eax
 004BD66E    mov         eax,ebx
 004BD670    mov         edx,dword ptr [eax]
 004BD672    call        dword ptr [edx+3C]
 004BD675    test        al,al
>004BD677    je          004BD683
 004BD679    mov         edx,esi
 004BD67B    mov         eax,dword ptr [ebx+28]
 004BD67E    call        TCustomButton.SetImageIndex
 004BD683    pop         esi
 004BD684    pop         ebx
 004BD685    ret
*}
end;

//004BD688
constructor TCustomButton.Create;
begin
{*
 004BD688    push        ebp
 004BD689    mov         ebp,esp
 004BD68B    push        ecx
 004BD68C    push        ebx
 004BD68D    push        esi
 004BD68E    test        dl,dl
>004BD690    je          004BD69A
 004BD692    add         esp,0FFFFFFF0
 004BD695    call        @ClassCreate
 004BD69A    mov         byte ptr [ebp-1],dl
 004BD69D    mov         ebx,eax
 004BD69F    xor         edx,edx
 004BD6A1    mov         eax,ebx
 004BD6A3    call        TButtonControl.Create
 004BD6A8    mov         eax,[004BD790]
 004BD6AD    mov         dword ptr [ebx+50],eax
 004BD6B0    mov         edx,4B
 004BD6B5    mov         eax,ebx
 004BD6B7    call        TControl.SetWidth
 004BD6BC    mov         edx,19
 004BD6C1    mov         eax,ebx
 004BD6C3    call        TControl.SetHeight
 004BD6C8    mov         dl,1
 004BD6CA    mov         eax,ebx
 004BD6CC    call        TWinControl.SetTabStop
 004BD6D1    mov         dl,1
 004BD6D3    mov         eax,[0049B438];TChangeLink
 004BD6D8    call        TObject.Create
 004BD6DD    mov         esi,eax
 004BD6DF    mov         dword ptr [ebx+298],esi
 004BD6E5    mov         dword ptr [esi+0C],ebx
 004BD6E8    mov         dword ptr [esi+8],4BE1E8;TCustomButton.ImageListChange
 004BD6EF    mov         dl,1
 004BD6F1    mov         eax,[004B2E44];TImageMargins
 004BD6F6    call        TObject.Create
 004BD6FB    mov         esi,eax
 004BD6FD    mov         dword ptr [ebx+2A0],esi
 004BD703    mov         dword ptr [esi+1C],ebx
 004BD706    mov         dword ptr [esi+18],4BE204;TCustomButton.ImageMarginsChange
 004BD70D    xor         eax,eax
 004BD70F    mov         dword ptr [ebx+2A8],eax
 004BD715    lea         eax,[ebx+27C]
 004BD71B    call        @UStrClr
 004BD720    mov         dword ptr [ebx+284],0FFFFFFFF
 004BD72A    mov         byte ptr [ebx+28C],0
 004BD731    mov         dword ptr [ebx+290],0FFFFFFFF
 004BD73B    mov         byte ptr [ebx+294],0
 004BD742    mov         dword ptr [ebx+29C],0FFFFFFFF
 004BD74C    mov         dword ptr [ebx+2B0],0FFFFFFFF
 004BD756    mov         dword ptr [ebx+2B4],0FFFFFFFF
 004BD760    mov         byte ptr [ebx+2B8],0
 004BD767    mov         dword ptr [ebx+2BC],0FFFFFFFF
 004BD771    mov         eax,ebx
 004BD773    cmp         byte ptr [ebp-1],0
>004BD777    je          004BD788
 004BD779    call        @AfterConstruction
 004BD77E    pop         dword ptr fs:[0]
 004BD785    add         esp,0C
 004BD788    mov         eax,ebx
 004BD78A    pop         esi
 004BD78B    pop         ebx
 004BD78C    pop         ecx
 004BD78D    pop         ebp
 004BD78E    ret
*}
end;

//004BD794
procedure TCustomButton.ActionChange(Sender:TObject; CheckDefaults:Boolean);
begin
{*
 004BD794    push        ebx
 004BD795    push        esi
 004BD796    push        edi
 004BD797    mov         ebx,ecx
 004BD799    mov         esi,edx
 004BD79B    mov         edi,eax
 004BD79D    mov         ecx,ebx
 004BD79F    mov         edx,esi
 004BD7A1    mov         eax,edi
 004BD7A3    call        TButtonControl.ActionChange
 004BD7A8    mov         eax,esi
 004BD7AA    mov         edx,dword ptr ds:[4743FC];TCustomAction
 004BD7B0    call        @IsClass
 004BD7B5    test        al,al
>004BD7B7    je          004BD7D3
 004BD7B9    test        bl,bl
>004BD7BB    je          004BD7C6
 004BD7BD    cmp         dword ptr [edi+29C],0FFFFFFFF
>004BD7C4    jne         004BD7D3
 004BD7C6    mov         edx,dword ptr [esi+80]
 004BD7CC    mov         eax,edi
 004BD7CE    call        TCustomButton.SetImageIndex
 004BD7D3    pop         edi
 004BD7D4    pop         esi
 004BD7D5    pop         ebx
 004BD7D6    ret
*}
end;

//004BD7D8
procedure TCustomButton.Click;
begin
{*
 004BD7D8    push        ebx
 004BD7D9    mov         ebx,eax
 004BD7DB    mov         dl,1
 004BD7DD    mov         eax,ebx
 004BD7DF    call        GetParentForm
 004BD7E4    test        eax,eax
>004BD7E6    je          004BD7F4
 004BD7E8    mov         edx,dword ptr [ebx+2AC]
 004BD7EE    mov         dword ptr [eax+2B8],edx
 004BD7F4    mov         eax,ebx
 004BD7F6    call        TControl.Click
 004BD7FB    pop         ebx
 004BD7FC    ret
*}
end;

//004BD800
function GetColor(Value:DWORD):TColor;
begin
{*
 004BD800    mov         edx,eax
 004BD802    sub         edx,0FF000000
>004BD808    je          004BD818
 004BD80A    sub         edx,0FFFFFF
>004BD810    jne         004BD81D
 004BD812    mov         eax,1FFFFFFF
 004BD817    ret
 004BD818    mov         eax,20000000
 004BD81D    ret
*}
end;

//004BD820
procedure TCustomButton.UpdateImageList;
begin
{*
 004BD820    push        ebx
 004BD821    push        esi
 004BD822    mov         ebx,eax
 004BD824    mov         edx,1
 004BD829    mov         eax,5
 004BD82E    call        CheckWin32Version
 004BD833    test        al,al
>004BD835    je          004BD958
 004BD83B    cmp         dword ptr [ebx+2A4],0
>004BD842    je          004BD958
 004BD848    mov         eax,ebx
 004BD84A    call        TWinControl.HandleAllocated
 004BD84F    test        al,al
>004BD851    je          004BD958
 004BD857    cmp         dword ptr [ebx+2A8],0
>004BD85E    jne         004BD874
 004BD860    xor         ecx,ecx
 004BD862    mov         dl,1
 004BD864    mov         eax,[0047E704];TImageList
 004BD869    call        TCustomImageList.Create
 004BD86E    mov         dword ptr [ebx+2A8],eax
 004BD874    mov         esi,dword ptr [ebx+2A8]
 004BD87A    mov         eax,dword ptr [ebx+2A4]
 004BD880    movzx       edx,byte ptr [eax+70]
 004BD884    mov         eax,esi
 004BD886    call        TCustomImageList.SetColorDepth
 004BD88B    mov         eax,dword ptr [ebx+2A4]
 004BD891    movzx       eax,byte ptr [eax+45]
 004BD895    mov         byte ptr [esi+45],al
 004BD898    mov         eax,dword ptr [ebx+2A4]
 004BD89E    movzx       eax,byte ptr [eax+47]
 004BD8A2    mov         byte ptr [esi+47],al
 004BD8A5    mov         eax,dword ptr [ebx+2A4]
 004BD8AB    movzx       edx,byte ptr [eax+44]
 004BD8AF    mov         eax,esi
 004BD8B1    call        TCustomImageList.SetDrawingStyle
 004BD8B6    mov         eax,dword ptr [ebx+2A4]
 004BD8BC    movzx       edx,byte ptr [eax+46]
 004BD8C0    mov         eax,esi
 004BD8C2    call        TCustomImageList.SetShareImages
 004BD8C7    mov         eax,dword ptr [ebx+2A4]
 004BD8CD    mov         ecx,dword ptr [eax+34]
 004BD8D0    mov         edx,dword ptr [eax+38]
 004BD8D3    mov         eax,esi
 004BD8D5    call        TCustomImageList.SetSize
 004BD8DA    mov         eax,esi
 004BD8DC    call        TCustomImageList.HandleAllocated
 004BD8E1    test        al,al
>004BD8E3    jne         004BD8EE
 004BD8E5    mov         eax,ebx
 004BD8E7    call        TWinControl.HandleNeeded
>004BD8EC    jmp         004BD903
 004BD8EE    mov         eax,dword ptr [esi+34]
 004BD8F1    push        eax
 004BD8F2    mov         eax,dword ptr [esi+38]
 004BD8F5    push        eax
 004BD8F6    mov         eax,esi
 004BD8F8    call        TCustomImageList.GetHandle
 004BD8FD    push        eax
 004BD8FE    call        comctl32.ImageList_SetIconSize
 004BD903    mov         eax,dword ptr [ebx+2A4]
 004BD909    call        TCustomImageList.GetHandle
 004BD90E    push        eax
 004BD90F    call        comctl32.ImageList_GetBkColor
 004BD914    call        GetColor
 004BD919    mov         edx,eax
 004BD91B    mov         eax,esi
 004BD91D    call        TCustomImageList.SetBkColor
 004BD922    mov         eax,dword ptr [ebx+2A4]
 004BD928    mov         eax,dword ptr [eax+4C]
 004BD92B    mov         dword ptr [esi+4C],eax
 004BD92E    mov         eax,ebx
 004BD930    mov         edx,dword ptr [eax]
 004BD932    call        dword ptr [edx+0FC]
 004BD938    cmp         dword ptr [ebx+29C],0FFFFFFFF
>004BD93F    je          004BD961
 004BD941    mov         eax,dword ptr [ebx+2A8]
 004BD947    call        TCustomImageList.GetHandle
 004BD94C    mov         edx,eax
 004BD94E    mov         eax,ebx
 004BD950    call        TCustomButton.SetImageList
 004BD955    pop         esi
 004BD956    pop         ebx
 004BD957    ret
 004BD958    xor         edx,edx
 004BD95A    mov         eax,ebx
 004BD95C    call        TCustomButton.SetImageList
 004BD961    pop         esi
 004BD962    pop         ebx
 004BD963    ret
*}
end;

//004BD964
procedure TCustomButton.UpdateImages;
begin
{*
 004BD964    push        ebx
 004BD965    mov         ebx,eax
 004BD967    mov         edx,1
 004BD96C    mov         eax,5
 004BD971    call        CheckWin32Version
 004BD976    test        al,al
>004BD978    je          004BDAE0
 004BD97E    cmp         dword ptr [ebx+29C],0FFFFFFFF
>004BD985    je          004BDAE0
 004BD98B    mov         eax,dword ptr [ebx+2A8]
 004BD991    call        TCustomImageList.Clear
 004BD996    mov         ecx,dword ptr [ebx+29C]
 004BD99C    mov         edx,dword ptr [ebx+2A4]
 004BD9A2    mov         eax,dword ptr [ebx+2A8]
 004BD9A8    call        TCustomImageList.AddImage
 004BD9AD    mov         eax,dword ptr [ebx+290]
 004BD9B3    cmp         eax,0FFFFFFFF
>004BD9B6    je          004BD9CD
 004BD9B8    mov         ecx,eax
 004BD9BA    mov         edx,dword ptr [ebx+2A4]
 004BD9C0    mov         eax,dword ptr [ebx+2A8]
 004BD9C6    call        TCustomImageList.AddImage
>004BD9CB    jmp         004BD9E4
 004BD9CD    mov         ecx,dword ptr [ebx+29C]
 004BD9D3    mov         edx,dword ptr [ebx+2A4]
 004BD9D9    mov         eax,dword ptr [ebx+2A8]
 004BD9DF    call        TCustomImageList.AddImage
 004BD9E4    mov         eax,dword ptr [ebx+2B0]
 004BD9EA    cmp         eax,0FFFFFFFF
>004BD9ED    je          004BDA04
 004BD9EF    mov         ecx,eax
 004BD9F1    mov         edx,dword ptr [ebx+2A4]
 004BD9F7    mov         eax,dword ptr [ebx+2A8]
 004BD9FD    call        TCustomImageList.AddImage
>004BDA02    jmp         004BDA1B
 004BDA04    mov         ecx,dword ptr [ebx+29C]
 004BDA0A    mov         edx,dword ptr [ebx+2A4]
 004BDA10    mov         eax,dword ptr [ebx+2A8]
 004BDA16    call        TCustomImageList.AddImage
 004BDA1B    mov         eax,dword ptr [ebx+284]
 004BDA21    cmp         eax,0FFFFFFFF
>004BDA24    je          004BDA3B
 004BDA26    mov         ecx,eax
 004BDA28    mov         edx,dword ptr [ebx+2A4]
 004BDA2E    mov         eax,dword ptr [ebx+2A8]
 004BDA34    call        TCustomImageList.AddImage
>004BDA39    jmp         004BDA52
 004BDA3B    mov         ecx,dword ptr [ebx+29C]
 004BDA41    mov         edx,dword ptr [ebx+2A4]
 004BDA47    mov         eax,dword ptr [ebx+2A8]
 004BDA4D    call        TCustomImageList.AddImage
 004BDA52    mov         eax,dword ptr [ebx+2B4]
 004BDA58    cmp         eax,0FFFFFFFF
>004BDA5B    je          004BDA72
 004BDA5D    mov         ecx,eax
 004BDA5F    mov         edx,dword ptr [ebx+2A4]
 004BDA65    mov         eax,dword ptr [ebx+2A8]
 004BDA6B    call        TCustomImageList.AddImage
>004BDA70    jmp         004BDA89
 004BDA72    mov         ecx,dword ptr [ebx+29C]
 004BDA78    mov         edx,dword ptr [ebx+2A4]
 004BDA7E    mov         eax,dword ptr [ebx+2A8]
 004BDA84    call        TCustomImageList.AddImage
 004BDA89    mov         eax,dword ptr [ebx+2BC]
 004BDA8F    cmp         eax,0FFFFFFFF
>004BDA92    je          004BDAA9
 004BDA94    mov         ecx,eax
 004BDA96    mov         edx,dword ptr [ebx+2A4]
 004BDA9C    mov         eax,dword ptr [ebx+2A8]
 004BDAA2    call        TCustomImageList.AddImage
>004BDAA7    jmp         004BDAE0
 004BDAA9    mov         eax,dword ptr [ebx+2B4]
 004BDAAF    cmp         eax,0FFFFFFFF
>004BDAB2    je          004BDAC9
 004BDAB4    mov         ecx,eax
 004BDAB6    mov         edx,dword ptr [ebx+2A4]
 004BDABC    mov         eax,dword ptr [ebx+2A8]
 004BDAC2    call        TCustomImageList.AddImage
>004BDAC7    jmp         004BDAE0
 004BDAC9    mov         ecx,dword ptr [ebx+29C]
 004BDACF    mov         edx,dword ptr [ebx+2A4]
 004BDAD5    mov         eax,dword ptr [ebx+2A8]
 004BDADB    call        TCustomImageList.AddImage
 004BDAE0    pop         ebx
 004BDAE1    ret
*}
end;

//004BDAE4
procedure TCustomButton.UseRightToLeftAlignment;
begin
{*
 004BDAE4    xor         eax,eax
 004BDAE6    ret
*}
end;

//004BDAE8
procedure TCustomButton.SetButtonStyle(ADefault:Boolean);
begin
{*
 004BDAE8    push        ebx
 004BDAE9    push        esi
 004BDAEA    push        edi
 004BDAEB    mov         ebx,edx
 004BDAED    mov         edi,eax
 004BDAEF    mov         eax,edi
 004BDAF1    call        TWinControl.HandleAllocated
 004BDAF6    test        al,al
>004BDAF8    je          004BDB6E
 004BDAFA    mov         eax,[0078D080];^gvar_00784C80
 004BDAFF    cmp         dword ptr [eax],6
>004BDB02    jl          004BDB39
 004BDB04    movzx       eax,byte ptr [edi+2B8]
 004BDB0B    dec         al
>004BDB0D    je          004BDB15
 004BDB0F    dec         al
>004BDB11    je          004BDB21
>004BDB13    jmp         004BDB2D
 004BDB15    movzx       eax,bl
 004BDB18    mov         esi,dword ptr [eax*4+785E68]
>004BDB1F    jmp         004BDB43
 004BDB21    movzx       eax,bl
 004BDB24    mov         esi,dword ptr [eax*4+785E70]
>004BDB2B    jmp         004BDB43
 004BDB2D    movzx       eax,bl
 004BDB30    mov         esi,dword ptr [eax*4+785E60]
>004BDB37    jmp         004BDB43
 004BDB39    movzx       eax,bl
 004BDB3C    mov         esi,dword ptr [eax*4+785E60]
 004BDB43    push        0F0
 004BDB45    mov         eax,edi
 004BDB47    call        TWinControl.GetHandle
 004BDB4C    push        eax
 004BDB4D    call        user32.GetWindowLongW
 004BDB52    and         eax,0F
 004BDB55    cmp         esi,eax
>004BDB57    je          004BDB6E
 004BDB59    push        1
 004BDB5B    push        esi
 004BDB5C    push        0F4
 004BDB61    mov         eax,edi
 004BDB63    call        TWinControl.GetHandle
 004BDB68    push        eax
 004BDB69    call        user32.SendMessageW
 004BDB6E    pop         edi
 004BDB6F    pop         esi
 004BDB70    pop         ebx
 004BDB71    ret
*}
end;

//004BDB74
procedure TCustomButton.SetCommandLinkHint(const Value:UnicodeString);
begin
{*
 004BDB74    push        ebx
 004BDB75    push        esi
 004BDB76    mov         esi,edx
 004BDB78    mov         ebx,eax
 004BDB7A    mov         eax,esi
 004BDB7C    mov         edx,dword ptr [ebx+27C]
 004BDB82    call        @UStrEqual
>004BDB87    je          004BDBB1
 004BDB89    lea         eax,[ebx+27C]
 004BDB8F    mov         edx,esi
 004BDB91    call        @UStrAsg
 004BDB96    mov         eax,ebx
 004BDB98    call        TWinControl.HandleAllocated
 004BDB9D    test        al,al
>004BDB9F    je          004BDBB1
 004BDBA1    cmp         byte ptr [ebx+2B8],1
>004BDBA8    jne         004BDBB1
 004BDBAA    mov         eax,ebx
 004BDBAC    call        TCustomButton.UpdateCommandLinkHint
 004BDBB1    pop         esi
 004BDBB2    pop         ebx
 004BDBB3    ret
*}
end;

//004BDBB4
procedure TCustomButton.SetDefault(Value:Boolean);
begin
{*
 004BDBB4    push        ebx
 004BDBB5    mov         ebx,eax
 004BDBB7    mov         byte ptr [ebx+280],dl
 004BDBBD    mov         eax,ebx
 004BDBBF    call        TWinControl.HandleAllocated
 004BDBC4    test        al,al
>004BDBC6    je          004BDBE8
 004BDBC8    mov         dl,1
 004BDBCA    mov         eax,ebx
 004BDBCC    call        GetParentForm
 004BDBD1    test        eax,eax
>004BDBD3    je          004BDBE8
 004BDBD5    mov         edx,dword ptr [eax+290]
 004BDBDB    push        edx
 004BDBDC    xor         ecx,ecx
 004BDBDE    mov         edx,0B007
 004BDBE3    call        TControl.Perform
 004BDBE8    pop         ebx
 004BDBE9    ret
*}
end;

//004BDBEC
procedure TCustomButton.SetDisabledImageIndex(const Value:TImageIndex);
begin
{*
 004BDBEC    push        esi
 004BDBED    mov         esi,eax
 004BDBEF    cmp         edx,dword ptr [esi+284]
>004BDBF5    je          004BDC1A
 004BDBF7    mov         dword ptr [esi+284],edx
 004BDBFD    cmp         dword ptr [esi+2A8],0
>004BDC04    je          004BDC1A
 004BDC06    mov         eax,esi
 004BDC08    mov         edx,dword ptr [eax]
 004BDC0A    call        dword ptr [edx+0FC]
 004BDC10    mov         eax,esi
 004BDC12    mov         edx,dword ptr [eax]
 004BDC14    call        dword ptr [edx+90]
 004BDC1A    pop         esi
 004BDC1B    ret
*}
end;

//004BDC1C
procedure TCustomButton.SetDropDownMenu(const Value:TPopupMenu);
begin
{*
 004BDC1C    cmp         edx,dword ptr [eax+288]
>004BDC22    je          004BDC34
 004BDC24    mov         dword ptr [eax+288],edx
 004BDC2A    test        edx,edx
>004BDC2C    je          004BDC34
 004BDC2E    xchg        eax,edx
 004BDC2F    call        TComponent.FreeNotification
 004BDC34    ret
*}
end;

//004BDC38
procedure TCustomButton.SetElevationRequired(const Value:Boolean);
begin
{*
 004BDC38    push        esi
 004BDC39    mov         esi,eax
 004BDC3B    cmp         dl,byte ptr [esi+28C]
>004BDC41    je          004BDC6E
 004BDC43    mov         byte ptr [esi+28C],dl
 004BDC49    mov         eax,esi
 004BDC4B    call        TWinControl.HandleAllocated
 004BDC50    test        al,al
>004BDC52    je          004BDC6E
 004BDC54    mov         eax,esi
 004BDC56    call        TCustomButton.SetElevationRequiredState
 004BDC5B    cmp         byte ptr [esi+28C],0
>004BDC62    jne         004BDC6E
 004BDC64    mov         eax,esi
 004BDC66    mov         edx,dword ptr [eax]
 004BDC68    call        dword ptr [edx+0F8]
 004BDC6E    pop         esi
 004BDC6F    ret
*}
end;

//004BDC70
procedure TCustomButton.SetElevationRequiredState;
begin
{*
 004BDC70    push        ebx
 004BDC71    mov         ebx,eax
 004BDC73    xor         edx,edx
 004BDC75    mov         eax,6
 004BDC7A    call        CheckWin32Version
 004BDC7F    test        al,al
>004BDC81    je          004BDCAD
 004BDC83    mov         eax,ebx
 004BDC85    call        TWinControl.HandleAllocated
 004BDC8A    test        al,al
>004BDC8C    je          004BDCAD
 004BDC8E    mov         eax,ebx
 004BDC90    call        TWinControl.GetHandle
 004BDC95    cmp         byte ptr [ebx+28C],1
 004BDC9C    cmc
 004BDC9D    sbb         edx,edx
 004BDC9F    push        edx
 004BDCA0    push        0
 004BDCA2    push        160C
 004BDCA7    push        eax
 004BDCA8    call        user32.SendMessageW
 004BDCAD    pop         ebx
 004BDCAE    ret
*}
end;

//004BDCB0
procedure TCustomButton.SetHotImageIndex(const Value:TImageIndex);
begin
{*
 004BDCB0    push        esi
 004BDCB1    mov         esi,eax
 004BDCB3    cmp         edx,dword ptr [esi+290]
>004BDCB9    je          004BDCDE
 004BDCBB    mov         dword ptr [esi+290],edx
 004BDCC1    cmp         dword ptr [esi+2A8],0
>004BDCC8    je          004BDCDE
 004BDCCA    mov         eax,esi
 004BDCCC    mov         edx,dword ptr [eax]
 004BDCCE    call        dword ptr [edx+0FC]
 004BDCD4    mov         eax,esi
 004BDCD6    mov         edx,dword ptr [eax]
 004BDCD8    call        dword ptr [edx+90]
 004BDCDE    pop         esi
 004BDCDF    ret
*}
end;

//004BDCE0
procedure TCustomButton.SetImageAlignment(const Value:TImageAlignment);
begin
{*
 004BDCE0    push        ebx
 004BDCE1    push        esi
 004BDCE2    mov         esi,eax
 004BDCE4    cmp         dl,byte ptr [esi+294]
>004BDCEA    je          004BDD16
 004BDCEC    mov         byte ptr [esi+294],dl
 004BDCF2    mov         ebx,dword ptr [esi+2A8]
 004BDCF8    test        ebx,ebx
>004BDCFA    je          004BDD0C
 004BDCFC    mov         eax,ebx
 004BDCFE    call        TCustomImageList.GetHandle
 004BDD03    mov         edx,eax
 004BDD05    mov         eax,esi
 004BDD07    call        TCustomButton.SetImageList
 004BDD0C    mov         eax,esi
 004BDD0E    mov         edx,dword ptr [eax]
 004BDD10    call        dword ptr [edx+90]
 004BDD16    pop         esi
 004BDD17    pop         ebx
 004BDD18    ret
*}
end;

//004BDD1C
procedure TCustomButton.SetImageIndex(const Value:TImageIndex);
begin
{*
 004BDD1C    push        ebx
 004BDD1D    push        esi
 004BDD1E    mov         esi,eax
 004BDD20    mov         eax,dword ptr [esi+29C]
 004BDD26    cmp         edx,eax
>004BDD28    je          004BDD7E
 004BDD2A    mov         ebx,eax
 004BDD2C    mov         eax,edx
 004BDD2E    mov         dword ptr [esi+29C],eax
 004BDD34    mov         edx,dword ptr [esi+2A8]
 004BDD3A    test        edx,edx
>004BDD3C    je          004BDD7E
 004BDD3E    inc         eax
>004BDD3F    je          004BDD64
 004BDD41    mov         eax,esi
 004BDD43    mov         edx,dword ptr [eax]
 004BDD45    call        dword ptr [edx+0FC]
 004BDD4B    inc         ebx
>004BDD4C    jne         004BDD74
 004BDD4E    mov         eax,dword ptr [esi+2A8]
 004BDD54    call        TCustomImageList.GetHandle
 004BDD59    mov         edx,eax
 004BDD5B    mov         eax,esi
 004BDD5D    call        TCustomButton.SetImageList
>004BDD62    jmp         004BDD74
 004BDD64    mov         eax,edx
 004BDD66    call        TCustomImageList.Clear
 004BDD6B    xor         edx,edx
 004BDD6D    mov         eax,esi
 004BDD6F    call        TCustomButton.SetImageList
 004BDD74    mov         eax,esi
 004BDD76    mov         edx,dword ptr [eax]
 004BDD78    call        dword ptr [edx+90]
 004BDD7E    pop         esi
 004BDD7F    pop         ebx
 004BDD80    ret
*}
end;

//004BDD84
procedure TCustomButton.SetImageList(AHandle:HIMAGELIST);
begin
{*
 004BDD84    push        ebx
 004BDD85    push        esi
 004BDD86    push        edi
 004BDD87    add         esp,0FFFFFFD8
 004BDD8A    mov         esi,edx
 004BDD8C    mov         ebx,eax
 004BDD8E    mov         eax,ebx
 004BDD90    call        TWinControl.HandleAllocated
 004BDD95    test        al,al
>004BDD97    je          004BDE18
 004BDD99    mov         eax,[0078D080];^gvar_00784C80
 004BDD9E    cmp         dword ptr [eax],6
>004BDDA1    jl          004BDDAE
 004BDDA3    movzx       eax,byte ptr [ebx+28C]
 004BDDAA    xor         al,1
>004BDDAC    jmp         004BDDBD
 004BDDAE    mov         edx,1
 004BDDB3    mov         eax,5
 004BDDB8    call        CheckWin32Version
 004BDDBD    test        al,al
>004BDDBF    je          004BDE18
 004BDDC1    mov         dword ptr [esp],esi
 004BDDC4    movzx       eax,byte ptr [ebx+294]
 004BDDCB    mov         eax,dword ptr [eax*4+785E78]
 004BDDD2    mov         dword ptr [esp+14],eax
 004BDDD6    mov         esi,dword ptr [ebx+2A0]
 004BDDDC    mov         eax,dword ptr [esi+8]
 004BDDDF    push        eax
 004BDDE0    lea         eax,[esp+1C]
 004BDDE4    push        eax
 004BDDE5    mov         ecx,dword ptr [esi+4]
 004BDDE8    mov         edx,dword ptr [esi+0C]
 004BDDEB    mov         eax,dword ptr [esi+10]
 004BDDEE    call        Rect
 004BDDF3    lea         esi,[esp+18]
 004BDDF7    lea         edi,[esp+4]
 004BDDFB    movs        dword ptr [edi],dword ptr [esi]
 004BDDFC    movs        dword ptr [edi],dword ptr [esi]
 004BDDFD    movs        dword ptr [edi],dword ptr [esi]
 004BDDFE    movs        dword ptr [edi],dword ptr [esi]
 004BDDFF    mov         eax,ebx
 004BDE01    call        TWinControl.GetHandle
 004BDE06    mov         ebx,eax
 004BDE08    mov         eax,esp
 004BDE0A    push        eax
 004BDE0B    push        0
 004BDE0D    push        1602
 004BDE12    push        ebx
 004BDE13    call        user32.SendMessageW
 004BDE18    add         esp,28
 004BDE1B    pop         edi
 004BDE1C    pop         esi
 004BDE1D    pop         ebx
 004BDE1E    ret
*}
end;

//004BDE20
procedure TCustomButton.SetImageMargins(const Value:TImageMargins);
begin
{*
 004BDE20    mov         eax,dword ptr [eax+2A0]
 004BDE26    mov         ecx,dword ptr [eax]
 004BDE28    call        dword ptr [ecx+8]
 004BDE2B    ret
*}
end;

//004BDE2C
procedure TCustomButton.SetImages(const Value:TCustomImageList);
begin
{*
 004BDE2C    push        ebx
 004BDE2D    push        esi
 004BDE2E    mov         ebx,edx
 004BDE30    mov         esi,eax
 004BDE32    mov         eax,dword ptr [esi+2A4]
 004BDE38    cmp         ebx,eax
>004BDE3A    je          004BDE79
 004BDE3C    test        eax,eax
>004BDE3E    je          004BDE4B
 004BDE40    mov         edx,dword ptr [esi+298]
 004BDE46    call        TCustomImageList.UnRegisterChanges
 004BDE4B    mov         eax,ebx
 004BDE4D    mov         dword ptr [esi+2A4],eax
 004BDE53    test        eax,eax
>004BDE55    je          004BDE6F
 004BDE57    mov         edx,dword ptr [esi+298]
 004BDE5D    call        TCustomImageList.RegisterChanges
 004BDE62    mov         edx,esi
 004BDE64    mov         eax,dword ptr [esi+2A4]
 004BDE6A    call        TComponent.FreeNotification
 004BDE6F    mov         eax,esi
 004BDE71    mov         edx,dword ptr [eax]
 004BDE73    call        dword ptr [edx+0F8]
 004BDE79    pop         esi
 004BDE7A    pop         ebx
 004BDE7B    ret
*}
end;

//004BDE7C
procedure TCustomButton.SetPressedImageIndex(const Value:TImageIndex);
begin
{*
 004BDE7C    push        esi
 004BDE7D    mov         esi,eax
 004BDE7F    cmp         edx,dword ptr [esi+2B0]
>004BDE85    je          004BDEAA
 004BDE87    mov         dword ptr [esi+2B0],edx
 004BDE8D    cmp         dword ptr [esi+2A8],0
>004BDE94    je          004BDEAA
 004BDE96    mov         eax,esi
 004BDE98    mov         edx,dword ptr [eax]
 004BDE9A    call        dword ptr [edx+0FC]
 004BDEA0    mov         eax,esi
 004BDEA2    mov         edx,dword ptr [eax]
 004BDEA4    call        dword ptr [edx+90]
 004BDEAA    pop         esi
 004BDEAB    ret
*}
end;

//004BDEAC
procedure TCustomButton.SetSelectedImageIndex(const Value:TImageIndex);
begin
{*
 004BDEAC    push        esi
 004BDEAD    mov         esi,eax
 004BDEAF    cmp         edx,dword ptr [esi+2B4]
>004BDEB5    je          004BDEDA
 004BDEB7    mov         dword ptr [esi+2B4],edx
 004BDEBD    cmp         dword ptr [esi+2A8],0
>004BDEC4    je          004BDEDA
 004BDEC6    mov         eax,esi
 004BDEC8    mov         edx,dword ptr [eax]
 004BDECA    call        dword ptr [edx+0FC]
 004BDED0    mov         eax,esi
 004BDED2    mov         edx,dword ptr [eax]
 004BDED4    call        dword ptr [edx+90]
 004BDEDA    pop         esi
 004BDEDB    ret
*}
end;

//004BDEDC
procedure TCustomButton.SetStyle(const Value:TButtonStyle);
begin
{*
 004BDEDC    push        ebp
 004BDEDD    mov         ebp,esp
 004BDEDF    add         esp,0FFFFFFF8
 004BDEE2    push        ebx
 004BDEE3    push        esi
 004BDEE4    mov         ebx,edx
 004BDEE6    mov         dword ptr [ebp-4],eax
 004BDEE9    mov         eax,dword ptr [ebp-4]
 004BDEEC    movzx       eax,byte ptr [eax+2B8]
 004BDEF3    cmp         bl,al
>004BDEF5    je          004BE032
 004BDEFB    mov         edx,dword ptr [ebp-4]
 004BDEFE    test        byte ptr [edx+1C],1
>004BDF02    je          004BDF12
 004BDF04    mov         eax,dword ptr [ebp-4]
 004BDF07    mov         byte ptr [eax+2B8],bl
>004BDF0D    jmp         004BE032
 004BDF12    mov         edx,ebx
 004BDF14    sub         dl,1
>004BDF17    jb          004BDF23
>004BDF19    je          004BDF68
 004BDF1B    dec         dl
>004BDF1D    jne         004BE032
 004BDF23    cmp         al,1
>004BDF25    jne         004BDF52
 004BDF27    mov         eax,dword ptr [ebp-4]
 004BDF2A    mov         eax,dword ptr [eax+19C]
 004BDF30    push        eax
 004BDF31    mov         eax,dword ptr [ebp-4]
 004BDF34    mov         eax,dword ptr [eax+1A0]
 004BDF3A    push        eax
 004BDF3B    mov         eax,dword ptr [ebp-4]
 004BDF3E    mov         ecx,dword ptr [eax+44]
 004BDF41    mov         eax,dword ptr [ebp-4]
 004BDF44    mov         edx,dword ptr [eax+40]
 004BDF47    mov         eax,dword ptr [ebp-4]
 004BDF4A    mov         esi,dword ptr [eax]
 004BDF4C    call        dword ptr [esi+98]
 004BDF52    mov         eax,dword ptr [ebp-4]
 004BDF55    mov         byte ptr [eax+2B8],bl
 004BDF5B    mov         eax,dword ptr [ebp-4]
 004BDF5E    call        TWinControl.RecreateWnd
>004BDF63    jmp         004BE032
 004BDF68    mov         eax,dword ptr [ebp-4]
 004BDF6B    test        byte ptr [eax+55],40
 004BDF6F    setne       al
 004BDF72    mov         byte ptr [ebp-5],al
 004BDF75    cmp         byte ptr [ebp-5],0
>004BDF79    jne         004BDF8D
 004BDF7B    mov         eax,dword ptr [ebp-4]
 004BDF7E    mov         eax,dword ptr [eax+54]
 004BDF81    or          eax,dword ptr ds:[4BE038]
 004BDF87    mov         edx,dword ptr [ebp-4]
 004BDF8A    mov         dword ptr [edx+54],eax
 004BDF8D    xor         eax,eax
 004BDF8F    push        ebp
 004BDF90    push        4BE02B
 004BDF95    push        dword ptr fs:[eax]
 004BDF98    mov         dword ptr fs:[eax],esp
 004BDF9B    mov         eax,dword ptr [ebp-4]
 004BDF9E    cmp         dword ptr [eax+27C],0
 004BDFA5    sete        al
 004BDFA8    and         eax,7F
 004BDFAB    mov         eax,dword ptr [eax*4+785E8C]
 004BDFB2    mov         edx,dword ptr [ebp-4]
 004BDFB5    cmp         eax,dword ptr [edx+4C]
>004BDFB8    jle         004BDFD9
 004BDFBA    mov         eax,dword ptr [ebp-4]
 004BDFBD    cmp         dword ptr [eax+27C],0
 004BDFC4    sete        al
 004BDFC7    and         eax,7F
 004BDFCA    mov         edx,dword ptr [eax*4+785E8C]
 004BDFD1    mov         eax,dword ptr [ebp-4]
 004BDFD4    call        TControl.SetHeight
 004BDFD9    mov         eax,dword ptr [ebp-4]
 004BDFDC    cmp         dword ptr [eax+48],0AF
>004BDFE3    jge         004BDFF2
 004BDFE5    mov         edx,0AF
 004BDFEA    mov         eax,dword ptr [ebp-4]
 004BDFED    call        TControl.SetWidth
 004BDFF2    mov         eax,dword ptr [ebp-4]
 004BDFF5    mov         byte ptr [eax+2B8],bl
 004BDFFB    mov         eax,dword ptr [ebp-4]
 004BDFFE    call        TWinControl.RecreateWnd
 004BE003    xor         eax,eax
 004BE005    pop         edx
 004BE006    pop         ecx
 004BE007    pop         ecx
 004BE008    mov         dword ptr fs:[eax],edx
 004BE00B    push        4BE032
 004BE010    cmp         byte ptr [ebp-5],0
>004BE014    jne         004BE02A
 004BE016    mov         eax,dword ptr [ebp-4]
 004BE019    mov         edx,dword ptr ds:[4BE038]
 004BE01F    not         edx
 004BE021    and         edx,dword ptr [eax+54]
 004BE024    mov         eax,dword ptr [ebp-4]
 004BE027    mov         dword ptr [eax+54],edx
 004BE02A    ret
>004BE02B    jmp         @HandleFinally
>004BE030    jmp         004BE010
 004BE032    pop         esi
 004BE033    pop         ebx
 004BE034    pop         ecx
 004BE035    pop         ecx
 004BE036    pop         ebp
 004BE037    ret
*}
end;

//004BE03C
procedure TCustomButton.SetStylusHotImageIndex(const Value:TImageIndex);
begin
{*
 004BE03C    push        esi
 004BE03D    mov         esi,eax
 004BE03F    cmp         edx,dword ptr [esi+2BC]
>004BE045    je          004BE06A
 004BE047    mov         dword ptr [esi+2BC],edx
 004BE04D    cmp         dword ptr [esi+2A8],0
>004BE054    je          004BE06A
 004BE056    mov         eax,esi
 004BE058    mov         edx,dword ptr [eax]
 004BE05A    call        dword ptr [edx+0FC]
 004BE060    mov         eax,esi
 004BE062    mov         edx,dword ptr [eax]
 004BE064    call        dword ptr [edx+90]
 004BE06A    pop         esi
 004BE06B    ret
*}
end;

//004BE06C
procedure TCustomButton.CreateParams(var Params:TCreateParams);
begin
{*
 004BE06C    push        ebx
 004BE06D    push        esi
 004BE06E    mov         esi,edx
 004BE070    mov         ebx,eax
 004BE072    mov         edx,esi
 004BE074    mov         eax,ebx
 004BE076    call        TButtonControl.CreateParams
 004BE07B    mov         ecx,4BE0F4
 004BE080    mov         edx,esi
 004BE082    mov         eax,ebx
 004BE084    call        TWinControl.CreateSubClass
 004BE089    mov         eax,[0078D080];^gvar_00784C80
 004BE08E    cmp         dword ptr [eax],6
>004BE091    jl          004BE0DE
 004BE093    movzx       eax,byte ptr [ebx+2B8]
 004BE09A    dec         al
>004BE09C    je          004BE0A4
 004BE09E    dec         al
>004BE0A0    je          004BE0B7
>004BE0A2    jmp         004BE0CA
 004BE0A4    movzx       eax,byte ptr [ebx+280]
 004BE0AB    mov         eax,dword ptr [eax*4+785E9C]
 004BE0B2    or          dword ptr [esi+4],eax
>004BE0B5    jmp         004BE0EF
 004BE0B7    movzx       eax,byte ptr [ebx+280]
 004BE0BE    mov         eax,dword ptr [eax*4+785EA4]
 004BE0C5    or          dword ptr [esi+4],eax
>004BE0C8    jmp         004BE0EF
 004BE0CA    movzx       eax,byte ptr [ebx+280]
 004BE0D1    mov         eax,dword ptr [eax*4+785E94]
 004BE0D8    or          dword ptr [esi+4],eax
 004BE0DB    pop         esi
 004BE0DC    pop         ebx
 004BE0DD    ret
 004BE0DE    movzx       eax,byte ptr [ebx+280]
 004BE0E5    mov         eax,dword ptr [eax*4+785E94]
 004BE0EC    or          dword ptr [esi+4],eax
 004BE0EF    pop         esi
 004BE0F0    pop         ebx
 004BE0F1    ret
*}
end;

//004BE104
procedure TCustomButton.CreateWnd;
begin
{*
 004BE104    push        ebx
 004BE105    mov         ebx,eax
 004BE107    mov         eax,ebx
 004BE109    call        TWinControl.CreateWnd
 004BE10E    movzx       eax,byte ptr [ebx+280]
 004BE115    mov         byte ptr [ebx+278],al
 004BE11B    test        byte ptr [ebx+1C],1
>004BE11F    jne         004BE142
 004BE121    mov         eax,ebx
 004BE123    call        TCustomButton.SetElevationRequiredState
 004BE128    mov         eax,ebx
 004BE12A    mov         edx,dword ptr [eax]
 004BE12C    call        dword ptr [edx+0F8]
 004BE132    cmp         byte ptr [ebx+2B8],1
>004BE139    jne         004BE142
 004BE13B    mov         eax,ebx
 004BE13D    call        TCustomButton.UpdateCommandLinkHint
 004BE142    pop         ebx
 004BE143    ret
*}
end;

//004BE144
destructor TCustomButton.Destroy();
begin
{*
 004BE144    push        ebx
 004BE145    push        esi
 004BE146    call        @BeforeDestruction
 004BE14B    mov         ebx,edx
 004BE14D    mov         esi,eax
 004BE14F    lea         eax,[esi+298]
 004BE155    mov         edx,dword ptr [eax]
 004BE157    xor         ecx,ecx
 004BE159    mov         dword ptr [eax],ecx
 004BE15B    mov         eax,edx
 004BE15D    call        TObject.Free
 004BE162    cmp         dword ptr [esi+2A8],0
>004BE169    je          004BE17E
 004BE16B    lea         eax,[esi+2A8]
 004BE171    mov         edx,dword ptr [eax]
 004BE173    xor         ecx,ecx
 004BE175    mov         dword ptr [eax],ecx
 004BE177    mov         eax,edx
 004BE179    call        TObject.Free
 004BE17E    lea         eax,[esi+2A0]
 004BE184    mov         edx,dword ptr [eax]
 004BE186    xor         ecx,ecx
 004BE188    mov         dword ptr [eax],ecx
 004BE18A    mov         eax,edx
 004BE18C    call        TObject.Free
 004BE191    mov         edx,ebx
 004BE193    and         dl,0FC
 004BE196    mov         eax,esi
 004BE198    call        TWinControl.Destroy
 004BE19D    test        bl,bl
>004BE19F    jle         004BE1A8
 004BE1A1    mov         eax,esi
 004BE1A3    call        @ClassDestroy
 004BE1A8    pop         esi
 004BE1A9    pop         ebx
 004BE1AA    ret
*}
end;

//004BE1AC
procedure TCustomButton.sub_0048751C;
begin
{*
 004BE1AC    mov         eax,[004B3050];TPushButtonActionLink
 004BE1B1    ret
*}
end;

//004BE1B4
procedure TCustomButton.UpdateCommandLinkHint;
begin
{*
 004BE1B4    push        ebx
 004BE1B5    push        esi
 004BE1B6    mov         ebx,eax
 004BE1B8    mov         eax,[0078D080];^gvar_00784C80
 004BE1BD    cmp         dword ptr [eax],6
>004BE1C0    jl          004BE1E4
 004BE1C2    mov         eax,ebx
 004BE1C4    call        TWinControl.GetHandle
 004BE1C9    mov         esi,eax
 004BE1CB    mov         eax,dword ptr [ebx+27C]
 004BE1D1    call        @UStrToPWChar
 004BE1D6    push        eax
 004BE1D7    push        0
 004BE1D9    push        1609
 004BE1DE    push        esi
 004BE1DF    call        user32.SendMessageW
 004BE1E4    pop         esi
 004BE1E5    pop         ebx
 004BE1E6    ret
*}
end;

//004BE1E8
procedure TCustomButton.ImageListChange(Sender:TObject);
begin
{*
 004BE1E8    push        esi
 004BE1E9    mov         esi,eax
 004BE1EB    mov         eax,esi
 004BE1ED    call        TWinControl.HandleAllocated
 004BE1F2    test        al,al
>004BE1F4    je          004BE200
 004BE1F6    mov         eax,esi
 004BE1F8    mov         edx,dword ptr [eax]
 004BE1FA    call        dword ptr [edx+0F8]
 004BE200    pop         esi
 004BE201    ret
*}
end;

//004BE204
procedure TCustomButton.ImageMarginsChange(Sender:TObject);
begin
{*
 004BE204    push        ebx
 004BE205    mov         ebx,eax
 004BE207    mov         eax,ebx
 004BE209    call        TWinControl.HandleAllocated
 004BE20E    test        al,al
>004BE210    je          004BE22F
 004BE212    cmp         dword ptr [ebx+2A8],0
>004BE219    je          004BE22F
 004BE21B    mov         eax,dword ptr [ebx+2A8]
 004BE221    call        TCustomImageList.GetHandle
 004BE226    mov         edx,eax
 004BE228    mov         eax,ebx
 004BE22A    call        TCustomButton.SetImageList
 004BE22F    mov         eax,ebx
 004BE231    mov         edx,dword ptr [eax]
 004BE233    call        dword ptr [edx+90]
 004BE239    pop         ebx
 004BE23A    ret
*}
end;

//004BE23C
function TCustomButton.IsImageIndexStored(Value:TImageIndex):Boolean;
begin
{*
 004BE23C    push        ebx
 004BE23D    push        esi
 004BE23E    mov         ebx,eax
 004BE240    mov         esi,dword ptr [ebx+68]
 004BE243    test        esi,esi
>004BE245    je          004BE257
 004BE247    mov         eax,esi
 004BE249    mov         edx,dword ptr [eax]
 004BE24B    call        dword ptr [edx+3C]
 004BE24E    test        al,al
>004BE250    je          004BE257
 004BE252    xor         eax,eax
 004BE254    pop         esi
 004BE255    pop         ebx
 004BE256    ret
 004BE257    mov         al,1
 004BE259    pop         esi
 004BE25A    pop         ebx
 004BE25B    ret
*}
end;

//004BE25C
procedure TCustomButton.Loaded;
begin
{*
 004BE25C    push        ebx
 004BE25D    mov         ebx,eax
 004BE25F    mov         eax,ebx
 004BE261    call        TControl.Loaded
 004BE266    mov         eax,ebx
 004BE268    call        TCustomButton.SetElevationRequiredState
 004BE26D    mov         eax,ebx
 004BE26F    mov         edx,dword ptr [eax]
 004BE271    call        dword ptr [edx+0F8]
 004BE277    cmp         byte ptr [ebx+2B8],1
>004BE27E    jne         004BE287
 004BE280    mov         eax,ebx
 004BE282    call        TCustomButton.UpdateCommandLinkHint
 004BE287    pop         ebx
 004BE288    ret
*}
end;

//004BE28C
procedure TCustomButton.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 004BE28C    push        ebx
 004BE28D    push        esi
 004BE28E    push        edi
 004BE28F    mov         ebx,ecx
 004BE291    mov         edi,edx
 004BE293    mov         esi,eax
 004BE295    mov         ecx,ebx
 004BE297    mov         edx,edi
 004BE299    mov         eax,esi
 004BE29B    call        TWinControl.Notification
 004BE2A0    cmp         bl,1
>004BE2A3    jne         004BE2CF
 004BE2A5    cmp         edi,dword ptr [esi+288]
>004BE2AB    jne         004BE2B5
 004BE2AD    xor         eax,eax
 004BE2AF    mov         dword ptr [esi+288],eax
 004BE2B5    cmp         edi,dword ptr [esi+2A4]
>004BE2BB    jne         004BE2CF
 004BE2BD    xor         eax,eax
 004BE2BF    mov         dword ptr [esi+2A4],eax
 004BE2C5    mov         eax,esi
 004BE2C7    mov         edx,dword ptr [eax]
 004BE2C9    call        dword ptr [edx+0F8]
 004BE2CF    pop         edi
 004BE2D0    pop         esi
 004BE2D1    pop         ebx
 004BE2D2    ret
*}
end;

//004BE2D4
procedure TCustomButton.CNCommand(var Message:TWMCommand);
begin
{*
 004BE2D4    push        esi
 004BE2D5    mov         esi,eax
 004BE2D7    cmp         word ptr [edx+6],0
>004BE2DC    jne         004BE2E9
 004BE2DE    mov         eax,esi
 004BE2E0    mov         si,0FFEC
 004BE2E4    call        @CallDynaInst
 004BE2E9    pop         esi
 004BE2EA    ret
*}
end;

//004BE2EC
procedure TCustomButton.CMDialogKey(var Message:TCMDialogKey);
begin
{*
 004BE2EC    push        esi
 004BE2ED    push        edi
 004BE2EE    push        ebp
 004BE2EF    mov         ebp,edx
 004BE2F1    mov         edi,eax
 004BE2F3    cmp         word ptr [ebp+4],0D
>004BE2F8    jne         004BE303
 004BE2FA    cmp         byte ptr [edi+278],0
>004BE301    jne         004BE313
 004BE303    cmp         word ptr [ebp+4],1B
>004BE308    jne         004BE34A
 004BE30A    cmp         byte ptr [edi+279],0
>004BE311    je          004BE34A
 004BE313    mov         eax,dword ptr [ebp+8]
 004BE316    call        KeyDataToShiftState
 004BE31B    movzx       edx,word ptr ds:[4BE358]
 004BE322    cmp         dx,ax
>004BE325    jne         004BE34A
 004BE327    mov         eax,edi
 004BE329    mov         si,0FFB6
 004BE32D    call        @CallDynaInst
 004BE332    test        al,al
>004BE334    je          004BE34A
 004BE336    mov         eax,edi
 004BE338    mov         si,0FFEC
 004BE33C    call        @CallDynaInst
 004BE341    mov         dword ptr [ebp+0C],1
>004BE348    jmp         004BE353
 004BE34A    mov         edx,ebp
 004BE34C    mov         eax,edi
 004BE34E    call        TWinControl.CMDialogKey
 004BE353    pop         ebp
 004BE354    pop         edi
 004BE355    pop         esi
 004BE356    ret
*}
end;

//004BE35C
procedure TCustomButton.CMDialogChar(var Message:TCMDialogChar);
begin
{*
 004BE35C    push        ebp
 004BE35D    mov         ebp,esp
 004BE35F    add         esp,0FFFFFFF8
 004BE362    push        esi
 004BE363    push        edi
 004BE364    xor         ecx,ecx
 004BE366    mov         dword ptr [ebp-8],ecx
 004BE369    mov         dword ptr [ebp-4],edx
 004BE36C    mov         edi,eax
 004BE36E    xor         eax,eax
 004BE370    push        ebp
 004BE371    push        4BE3DF
 004BE376    push        dword ptr fs:[eax]
 004BE379    mov         dword ptr fs:[eax],esp
 004BE37C    lea         edx,[ebp-8]
 004BE37F    mov         eax,edi
 004BE381    call        TControl.GetText
 004BE386    mov         edx,dword ptr [ebp-8]
 004BE389    mov         eax,dword ptr [ebp-4]
 004BE38C    movzx       eax,word ptr [eax+4]
 004BE390    call        IsAccel
 004BE395    test        al,al
>004BE397    je          004BE3BF
 004BE399    mov         eax,edi
 004BE39B    mov         si,0FFB6
 004BE39F    call        @CallDynaInst
 004BE3A4    test        al,al
>004BE3A6    je          004BE3BF
 004BE3A8    mov         eax,edi
 004BE3AA    mov         si,0FFEC
 004BE3AE    call        @CallDynaInst
 004BE3B3    mov         eax,dword ptr [ebp-4]
 004BE3B6    mov         dword ptr [eax+0C],1
>004BE3BD    jmp         004BE3C9
 004BE3BF    mov         edx,dword ptr [ebp-4]
 004BE3C2    mov         eax,edi
 004BE3C4    call        TWinControl.CMDialogChar
 004BE3C9    xor         eax,eax
 004BE3CB    pop         edx
 004BE3CC    pop         ecx
 004BE3CD    pop         ecx
 004BE3CE    mov         dword ptr fs:[eax],edx
 004BE3D1    push        4BE3E6
 004BE3D6    lea         eax,[ebp-8]
 004BE3D9    call        @UStrClr
 004BE3DE    ret
>004BE3DF    jmp         @HandleFinally
>004BE3E4    jmp         004BE3D6
 004BE3E6    pop         edi
 004BE3E7    pop         esi
 004BE3E8    pop         ecx
 004BE3E9    pop         ecx
 004BE3EA    pop         ebp
 004BE3EB    ret
*}
end;

//004BE3EC
procedure TCustomButton.CMFocusChanged(var Message:TCMFocusChanged);
begin
{*
 004BE3EC    push        ebx
 004BE3ED    push        esi
 004BE3EE    push        edi
 004BE3EF    mov         esi,edx
 004BE3F1    mov         ebx,eax
 004BE3F3    mov         edi,dword ptr [esi+8]
 004BE3F6    mov         eax,edi
 004BE3F8    mov         edx,dword ptr ds:[4B31EC];TCustomButton
 004BE3FE    call        @IsClass
 004BE403    test        al,al
>004BE405    je          004BE414
 004BE407    cmp         ebx,edi
 004BE409    sete        al
 004BE40C    mov         byte ptr [ebx+278],al
>004BE412    jmp         004BE421
 004BE414    movzx       eax,byte ptr [ebx+280]
 004BE41B    mov         byte ptr [ebx+278],al
 004BE421    movzx       edx,byte ptr [ebx+278]
 004BE428    mov         eax,ebx
 004BE42A    mov         ecx,dword ptr [eax]
 004BE42C    call        dword ptr [ecx+0F4]
 004BE432    mov         edx,esi
 004BE434    mov         eax,ebx
 004BE436    call        TWinControl.CMFocusChanged
 004BE43B    pop         edi
 004BE43C    pop         esi
 004BE43D    pop         ebx
 004BE43E    ret
*}
end;

//004BE440
procedure TCustomButton.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 004BE440    push        ebx
 004BE441    push        esi
 004BE442    mov         esi,edx
 004BE444    mov         ebx,eax
 004BE446    call        ThemeServices
 004BE44B    call        TThemeServices.GetThemesEnabled
 004BE450    test        al,al
>004BE452    je          004BE45E
 004BE454    mov         dword ptr [esi+0C],1
 004BE45B    pop         esi
 004BE45C    pop         ebx
 004BE45D    ret
 004BE45E    mov         edx,esi
 004BE460    mov         eax,ebx
 004BE462    mov         ecx,dword ptr [eax]
 004BE464    call        dword ptr [ecx-10]
 004BE467    pop         esi
 004BE468    pop         ebx
 004BE469    ret
*}
end;

//004BE46C
procedure TCustomButton.CNCtlColorBtn(var Message:TWMCtlColorBtn);
begin
{*
 004BE46C    push        ebx
 004BE46D    push        esi
 004BE46E    push        edi
 004BE46F    mov         edi,edx
 004BE471    mov         ebx,eax
 004BE473    call        ThemeServices
 004BE478    mov         esi,eax
 004BE47A    mov         eax,esi
 004BE47C    call        TThemeServices.GetThemesEnabled
 004BE481    test        al,al
>004BE483    je          004BE4C6
 004BE485    mov         eax,dword ptr [ebx+34]
 004BE488    test        eax,eax
>004BE48A    je          004BE4A1
 004BE48C    cmp         byte ptr [eax+260],0
>004BE493    je          004BE4A1
 004BE495    mov         edx,dword ptr [edi+4]
 004BE498    mov         eax,ebx
 004BE49A    call        PerformEraseBackground
>004BE49F    jmp         004BE4BA
 004BE4A1    push        0
 004BE4A3    push        0
 004BE4A5    push        0
 004BE4A7    mov         eax,ebx
 004BE4A9    call        TWinControl.GetHandle
 004BE4AE    mov         edx,eax
 004BE4B0    mov         ecx,dword ptr [edi+4]
 004BE4B3    mov         eax,esi
 004BE4B5    call        TThemeServices.DrawParentBackground
 004BE4BA    push        5
 004BE4BC    call        gdi32.GetStockObject
 004BE4C1    mov         dword ptr [edi+0C],eax
>004BE4C4    jmp         004BE4CF
 004BE4C6    mov         edx,edi
 004BE4C8    mov         eax,ebx
 004BE4CA    mov         ecx,dword ptr [eax]
 004BE4CC    call        dword ptr [ecx-10]
 004BE4CF    pop         edi
 004BE4D0    pop         esi
 004BE4D1    pop         ebx
 004BE4D2    ret
*}
end;

//004BE4D4
procedure TCustomButton.CNNotify(var Message:TWMNotify);
begin
{*
 004BE4D4    push        ebx
 004BE4D5    push        esi
 004BE4D6    push        edi
 004BE4D7    add         esp,0FFFFFFE0
 004BE4DA    mov         esi,edx
 004BE4DC    mov         ebx,eax
 004BE4DE    mov         eax,dword ptr [esi+8]
 004BE4E1    cmp         dword ptr [eax+8],0FFFFFB20
>004BE4E8    jne         004BE548
 004BE4EA    cmp         word ptr [ebx+2C2],0
>004BE4F2    je          004BE502
 004BE4F4    mov         edx,ebx
 004BE4F6    mov         eax,dword ptr [ebx+2C4]
 004BE4FC    call        dword ptr [ebx+2C0]
 004BE502    cmp         dword ptr [ebx+288],0
>004BE509    je          004BE548
 004BE50B    mov         eax,dword ptr [esi+8]
 004BE50E    lea         esi,[eax+0C]
 004BE511    lea         edi,[esp+10]
 004BE515    movs        dword ptr [edi],dword ptr [esi]
 004BE516    movs        dword ptr [edi],dword ptr [esi]
 004BE517    movs        dword ptr [edi],dword ptr [esi]
 004BE518    movs        dword ptr [edi],dword ptr [esi]
 004BE519    mov         eax,dword ptr [esp+10]
 004BE51D    mov         dword ptr [esp+8],eax
 004BE521    mov         eax,dword ptr [esp+1C]
 004BE525    mov         dword ptr [esp+0C],eax
 004BE529    mov         ecx,esp
 004BE52B    lea         edx,[esp+8]
 004BE52F    mov         eax,ebx
 004BE531    call        TControl.ClientToScreen
 004BE536    mov         ecx,dword ptr [esp+4]
 004BE53A    mov         edx,dword ptr [esp]
 004BE53D    mov         eax,dword ptr [ebx+288]
 004BE543    mov         ebx,dword ptr [eax]
 004BE545    call        dword ptr [ebx+44]
 004BE548    add         esp,20
 004BE54B    pop         edi
 004BE54C    pop         esi
 004BE54D    pop         ebx
 004BE54E    ret
*}
end;

//004BE550
constructor TCustomCheckBox.Create;
begin
{*
 004BE550    push        ebx
 004BE551    push        esi
 004BE552    test        dl,dl
>004BE554    je          004BE55E
 004BE556    add         esp,0FFFFFFF0
 004BE559    call        @ClassCreate
 004BE55E    mov         ebx,edx
 004BE560    mov         esi,eax
 004BE562    xor         edx,edx
 004BE564    mov         eax,esi
 004BE566    call        TButtonControl.Create
 004BE56B    mov         edx,61
 004BE570    mov         eax,esi
 004BE572    call        TControl.SetWidth
 004BE577    mov         edx,11
 004BE57C    mov         eax,esi
 004BE57E    call        TControl.SetHeight
 004BE583    mov         dl,1
 004BE585    mov         eax,esi
 004BE587    call        TWinControl.SetTabStop
 004BE58C    mov         eax,[004BE5B8]
 004BE591    mov         dword ptr [esi+50],eax
 004BE594    mov         byte ptr [esi+278],1
 004BE59B    mov         eax,esi
 004BE59D    test        bl,bl
>004BE59F    je          004BE5B0
 004BE5A1    call        @AfterConstruction
 004BE5A6    pop         dword ptr fs:[0]
 004BE5AD    add         esp,0C
 004BE5B0    mov         eax,esi
 004BE5B2    pop         esi
 004BE5B3    pop         ebx
 004BE5B4    ret
*}
end;

//004BE5BC
procedure TCustomCheckBox.GetControlsAlignment;
begin
{*
 004BE5BC    push        ebx
 004BE5BD    push        esi
 004BE5BE    mov         ebx,eax
 004BE5C0    mov         eax,ebx
 004BE5C2    mov         si,0FFC7
 004BE5C6    call        @CallDynaInst
 004BE5CB    test        al,al
>004BE5CD    jne         004BE5D4
 004BE5CF    mov         al,1
 004BE5D1    pop         esi
 004BE5D2    pop         ebx
 004BE5D3    ret
 004BE5D4    cmp         byte ptr [ebx+278],1
>004BE5DB    jne         004BE5E1
 004BE5DD    xor         eax,eax
>004BE5DF    jmp         004BE5E3
 004BE5E1    mov         al,1
 004BE5E3    pop         esi
 004BE5E4    pop         ebx
 004BE5E5    ret
*}
end;

//004BE5E8
procedure TCustomCheckBox.Toggle;
begin
{*
 004BE5E8    movzx       edx,byte ptr [eax+27A]
 004BE5EF    sub         dl,1
>004BE5F2    jb          004BE5FC
>004BE5F4    je          004BE616
 004BE5F6    dec         dl
>004BE5F8    je          004BE61E
>004BE5FA    jmp         004BE625
 004BE5FC    cmp         byte ptr [eax+279],0
>004BE603    je          004BE60E
 004BE605    mov         dl,2
 004BE607    call        TCustomCheckBox.SetState
>004BE60C    jmp         004BE625
 004BE60E    mov         dl,1
 004BE610    call        TCustomCheckBox.SetState
 004BE615    ret
 004BE616    xor         edx,edx
 004BE618    call        TCustomCheckBox.SetState
 004BE61D    ret
 004BE61E    mov         dl,1
 004BE620    call        TCustomCheckBox.SetState
 004BE625    ret
*}
end;

//004BE628
procedure TCustomCheckBox.Click;
begin
{*
 004BE628    push        ebx
 004BE629    mov         ebx,eax
 004BE62B    mov         eax,ebx
 004BE62D    call        TControl.Changed
 004BE632    mov         eax,ebx
 004BE634    call        TControl.Click
 004BE639    pop         ebx
 004BE63A    ret
*}
end;

//004BE63C
function TCustomCheckBox.GetChecked:Boolean;
begin
{*
 004BE63C    cmp         byte ptr [eax+27A],1
 004BE643    sete        al
 004BE646    ret
*}
end;

//004BE648
procedure TCustomCheckBox.SetAlignment(Value:TLeftRight);
begin
{*
 004BE648    cmp         dl,byte ptr [eax+278]
>004BE64E    je          004BE65B
 004BE650    mov         byte ptr [eax+278],dl
 004BE656    call        TWinControl.RecreateWnd
 004BE65B    ret
*}
end;

//004BE65C
procedure TCustomCheckBox.SetChecked(Value:Boolean);
begin
{*
 004BE65C    test        dl,dl
>004BE65E    je          004BE668
 004BE660    mov         dl,1
 004BE662    call        TCustomCheckBox.SetState
 004BE667    ret
 004BE668    xor         edx,edx
 004BE66A    call        TCustomCheckBox.SetState
 004BE66F    ret
*}
end;

//004BE670
procedure TCustomCheckBox.SetState(Value:TCheckBoxState);
begin
{*
 004BE670    push        ebx
 004BE671    push        esi
 004BE672    mov         ebx,eax
 004BE674    cmp         dl,byte ptr [ebx+27A]
>004BE67A    je          004BE6BD
 004BE67C    mov         byte ptr [ebx+27A],dl
 004BE682    mov         eax,ebx
 004BE684    call        TWinControl.HandleAllocated
 004BE689    test        al,al
>004BE68B    je          004BE6A9
 004BE68D    push        0
 004BE68F    movzx       eax,byte ptr [ebx+27A]
 004BE696    push        eax
 004BE697    push        0F1
 004BE69C    mov         eax,ebx
 004BE69E    call        TWinControl.GetHandle
 004BE6A3    push        eax
 004BE6A4    call        user32.SendMessageW
 004BE6A9    cmp         byte ptr [ebx+270],0
>004BE6B0    jne         004BE6BD
 004BE6B2    mov         eax,ebx
 004BE6B4    mov         si,0FFEC
 004BE6B8    call        @CallDynaInst
 004BE6BD    pop         esi
 004BE6BE    pop         ebx
 004BE6BF    ret
*}
end;

//004BE6C0
procedure TCustomCheckBox.CreateParams(var Params:TCreateParams);
begin
{*
 004BE6C0    push        ebx
 004BE6C1    push        esi
 004BE6C2    push        edi
 004BE6C3    mov         edi,edx
 004BE6C5    mov         ebx,eax
 004BE6C7    mov         edx,edi
 004BE6C9    mov         eax,ebx
 004BE6CB    call        TButtonControl.CreateParams
 004BE6D0    mov         ecx,4BE710
 004BE6D5    mov         edx,edi
 004BE6D7    mov         eax,ebx
 004BE6D9    call        TWinControl.CreateSubClass
 004BE6DE    mov         eax,ebx
 004BE6E0    mov         si,0FFC7
 004BE6E4    call        @CallDynaInst
 004BE6E9    and         eax,7F
 004BE6EC    lea         eax,[eax*8+785EAC]
 004BE6F3    movzx       edx,byte ptr [ebx+278]
 004BE6FA    mov         eax,dword ptr [eax+edx*4]
 004BE6FD    mov         edx,dword ptr [edi+4]
 004BE700    or          edx,5
 004BE703    or          eax,edx
 004BE705    mov         dword ptr [edi+4],eax
 004BE708    and         dword ptr [edi+24],0FFFFFFFC
 004BE70C    pop         edi
 004BE70D    pop         esi
 004BE70E    pop         ebx
 004BE70F    ret
*}
end;

//004BE720
procedure TCustomCheckBox.CreateWnd;
begin
{*
 004BE720    push        ebx
 004BE721    mov         ebx,eax
 004BE723    mov         eax,ebx
 004BE725    call        TWinControl.CreateWnd
 004BE72A    push        0
 004BE72C    movzx       eax,byte ptr [ebx+27A]
 004BE733    push        eax
 004BE734    push        0F1
 004BE739    mov         eax,ebx
 004BE73B    call        TWinControl.GetHandle
 004BE740    push        eax
 004BE741    call        user32.SendMessageW
 004BE746    pop         ebx
 004BE747    ret
*}
end;

//004BE748
procedure TCustomGroupBox.WMSize(var Message:TWMSize);
begin
{*
 004BE748    push        esi
 004BE749    mov         esi,eax
 004BE74B    mov         eax,esi
 004BE74D    call        TWinControl.WMSize
 004BE752    mov         eax,esi
 004BE754    mov         edx,dword ptr [eax]
 004BE756    call        dword ptr [edx+90]
 004BE75C    pop         esi
 004BE75D    ret
*}
end;

//004BE760
procedure TCustomCheckBox.CMCtl3DChanged(var Message:TMessage);
begin
{*
 004BE760    call        TWinControl.RecreateWnd
 004BE765    ret
*}
end;

//004BE768
procedure TCustomCheckBox.CMDialogChar(var Message:TCMDialogChar);
begin
{*
 004BE768    push        ebp
 004BE769    mov         ebp,esp
 004BE76B    push        0
 004BE76D    push        ebx
 004BE76E    push        esi
 004BE76F    push        edi
 004BE770    mov         edi,edx
 004BE772    mov         ebx,eax
 004BE774    xor         eax,eax
 004BE776    push        ebp
 004BE777    push        4BE7F6
 004BE77C    push        dword ptr fs:[eax]
 004BE77F    mov         dword ptr fs:[eax],esp
 004BE782    lea         edx,[ebp-4]
 004BE785    mov         eax,ebx
 004BE787    call        TControl.GetText
 004BE78C    mov         edx,dword ptr [ebp-4]
 004BE78F    movzx       eax,word ptr [edi+4]
 004BE793    call        IsAccel
 004BE798    test        al,al
>004BE79A    je          004BE7D7
 004BE79C    mov         eax,ebx
 004BE79E    mov         si,0FFB6
 004BE7A2    call        @CallDynaInst
 004BE7A7    test        al,al
>004BE7A9    je          004BE7D7
 004BE7AB    mov         eax,ebx
 004BE7AD    mov         edx,dword ptr [eax]
 004BE7AF    call        dword ptr [edx+0E8]
 004BE7B5    mov         eax,ebx
 004BE7B7    mov         si,0FFB3
 004BE7BB    call        @CallDynaInst
 004BE7C0    test        al,al
>004BE7C2    je          004BE7CE
 004BE7C4    mov         eax,ebx
 004BE7C6    mov         edx,dword ptr [eax]
 004BE7C8    call        dword ptr [edx+0F4]
 004BE7CE    mov         dword ptr [edi+0C],1
>004BE7D5    jmp         004BE7E0
 004BE7D7    mov         edx,edi
 004BE7D9    mov         eax,ebx
 004BE7DB    call        TWinControl.CMDialogChar
 004BE7E0    xor         eax,eax
 004BE7E2    pop         edx
 004BE7E3    pop         ecx
 004BE7E4    pop         ecx
 004BE7E5    mov         dword ptr fs:[eax],edx
 004BE7E8    push        4BE7FD
 004BE7ED    lea         eax,[ebp-4]
 004BE7F0    call        @UStrClr
 004BE7F5    ret
>004BE7F6    jmp         @HandleFinally
>004BE7FB    jmp         004BE7ED
 004BE7FD    pop         edi
 004BE7FE    pop         esi
 004BE7FF    pop         ebx
 004BE800    pop         ecx
 004BE801    pop         ebp
 004BE802    ret
*}
end;

//004BE804
procedure TCustomCheckBox.CNCommand(var Message:TWMCommand);
begin
{*
 004BE804    cmp         word ptr [edx+6],0
>004BE809    jne         004BE813
 004BE80B    mov         edx,dword ptr [eax]
 004BE80D    call        dword ptr [edx+0F4]
 004BE813    ret
*}
end;

//004BE814
constructor TRadioButton.Create;
begin
{*
 004BE814    push        ebx
 004BE815    push        esi
 004BE816    test        dl,dl
>004BE818    je          004BE822
 004BE81A    add         esp,0FFFFFFF0
 004BE81D    call        @ClassCreate
 004BE822    mov         ebx,edx
 004BE824    mov         esi,eax
 004BE826    xor         edx,edx
 004BE828    mov         eax,esi
 004BE82A    call        TButtonControl.Create
 004BE82F    mov         edx,71
 004BE834    mov         eax,esi
 004BE836    call        TControl.SetWidth
 004BE83B    mov         edx,11
 004BE840    mov         eax,esi
 004BE842    call        TControl.SetHeight
 004BE847    mov         eax,[004BE870]
 004BE84C    mov         dword ptr [esi+50],eax
 004BE84F    mov         byte ptr [esi+278],1
 004BE856    mov         eax,esi
 004BE858    test        bl,bl
>004BE85A    je          004BE86B
 004BE85C    call        @AfterConstruction
 004BE861    pop         dword ptr fs:[0]
 004BE868    add         esp,0C
 004BE86B    mov         eax,esi
 004BE86D    pop         esi
 004BE86E    pop         ebx
 004BE86F    ret
*}
end;

//004BE874
function TRadioButton.GetChecked:Boolean;
begin
{*
 004BE874    movzx       eax,byte ptr [eax+279]
 004BE87B    ret
*}
end;

//004BE87C
procedure TRadioButton.GetControlsAlignment;
begin
{*
 004BE87C    push        ebx
 004BE87D    push        esi
 004BE87E    mov         ebx,eax
 004BE880    mov         eax,ebx
 004BE882    mov         si,0FFC7
 004BE886    call        @CallDynaInst
 004BE88B    test        al,al
>004BE88D    jne         004BE894
 004BE88F    mov         al,1
 004BE891    pop         esi
 004BE892    pop         ebx
 004BE893    ret
 004BE894    cmp         byte ptr [ebx+278],1
>004BE89B    jne         004BE8A1
 004BE89D    xor         eax,eax
>004BE89F    jmp         004BE8A3
 004BE8A1    mov         al,1
 004BE8A3    pop         esi
 004BE8A4    pop         ebx
 004BE8A5    ret
*}
end;

//004BE8A8
procedure TCustomStaticText.SetShowAccelChar(Value:Boolean);
begin
{*
 004BE8A8    cmp         dl,byte ptr [eax+278]
>004BE8AE    je          004BE8BB
 004BE8B0    mov         byte ptr [eax+278],dl
 004BE8B6    call        TWinControl.RecreateWnd
 004BE8BB    ret
*}
end;

//004BE8BC
procedure TurnSiblingsOff;
begin
{*
 004BE8BC    push        ebp
 004BE8BD    mov         ebp,esp
 004BE8BF    add         esp,0FFFFFFF8
 004BE8C2    push        ebx
 004BE8C3    push        esi
 004BE8C4    push        edi
 004BE8C5    mov         eax,dword ptr [ebp+8]
 004BE8C8    mov         eax,dword ptr [eax-4]
 004BE8CB    mov         eax,dword ptr [eax+34]
 004BE8CE    test        eax,eax
>004BE8D0    je          004BE970
 004BE8D6    mov         edx,dword ptr [ebp+8]
 004BE8D9    mov         dword ptr [ebp-8],eax
 004BE8DC    mov         eax,dword ptr [ebp-8]
 004BE8DF    call        TWinControl.GetControlCount
 004BE8E4    mov         esi,eax
 004BE8E6    dec         esi
 004BE8E7    test        esi,esi
>004BE8E9    jl          004BE970
 004BE8EF    inc         esi
 004BE8F0    mov         dword ptr [ebp-4],0
 004BE8F7    mov         edx,dword ptr [ebp-4]
 004BE8FA    mov         eax,dword ptr [ebp-8]
 004BE8FD    call        TWinControl.GetControl
 004BE902    mov         ebx,eax
 004BE904    mov         eax,dword ptr [ebp+8]
 004BE907    cmp         ebx,dword ptr [eax-4]
>004BE90A    je          004BE96A
 004BE90C    mov         eax,ebx
 004BE90E    mov         edx,dword ptr ds:[4B5254];TRadioButton
 004BE914    call        @IsClass
 004BE919    test        al,al
>004BE91B    je          004BE96A
 004BE91D    mov         edi,ebx
 004BE91F    mov         eax,edi
 004BE921    mov         edx,dword ptr [eax]
 004BE923    call        dword ptr [edx+4C]
 004BE926    test        eax,eax
>004BE928    je          004BE95E
 004BE92A    mov         eax,edi
 004BE92C    mov         edx,dword ptr [eax]
 004BE92E    call        dword ptr [edx+4C]
 004BE931    mov         edx,dword ptr ds:[4743FC];TCustomAction
 004BE937    call        @IsClass
 004BE93C    test        al,al
>004BE93E    je          004BE95E
 004BE940    mov         eax,edi
 004BE942    mov         edx,dword ptr [eax]
 004BE944    call        dword ptr [edx+4C]
 004BE947    cmp         byte ptr [eax+95],0
>004BE94E    je          004BE95E
 004BE950    mov         eax,edi
 004BE952    mov         edx,dword ptr [eax]
 004BE954    call        dword ptr [edx+4C]
 004BE957    xor         edx,edx
 004BE959    call        TCustomAction.SetChecked
 004BE95E    xor         edx,edx
 004BE960    mov         eax,edi
 004BE962    mov         ecx,dword ptr [eax]
 004BE964    call        dword ptr [ecx+0F0]
 004BE96A    inc         dword ptr [ebp-4]
 004BE96D    dec         esi
>004BE96E    jne         004BE8F7
 004BE970    pop         edi
 004BE971    pop         esi
 004BE972    pop         ebx
 004BE973    pop         ecx
 004BE974    pop         ecx
 004BE975    pop         ebp
 004BE976    ret
*}
end;

//004BE978
procedure TRadioButton.SetChecked(Value:Boolean);
begin
{*
 004BE978    push        ebp
 004BE979    mov         ebp,esp
 004BE97B    push        ecx
 004BE97C    push        ebx
 004BE97D    push        esi
 004BE97E    mov         ebx,edx
 004BE980    mov         dword ptr [ebp-4],eax
 004BE983    mov         eax,dword ptr [ebp-4]
 004BE986    cmp         bl,byte ptr [eax+279]
>004BE98C    je          004BE9FC
 004BE98E    mov         eax,dword ptr [ebp-4]
 004BE991    mov         byte ptr [eax+279],bl
 004BE997    mov         edx,ebx
 004BE999    mov         eax,dword ptr [ebp-4]
 004BE99C    call        TWinControl.SetTabStop
 004BE9A1    mov         eax,dword ptr [ebp-4]
 004BE9A4    call        TWinControl.HandleAllocated
 004BE9A9    test        al,al
>004BE9AB    je          004BE9D1
 004BE9AD    push        0
 004BE9AF    mov         eax,dword ptr [ebp-4]
 004BE9B2    mov         edx,dword ptr [eax]
 004BE9B4    call        dword ptr [edx+0EC]
 004BE9BA    and         eax,7F
 004BE9BD    push        eax
 004BE9BE    push        0F1
 004BE9C3    mov         eax,dword ptr [ebp-4]
 004BE9C6    call        TWinControl.GetHandle
 004BE9CB    push        eax
 004BE9CC    call        user32.SendMessageW
 004BE9D1    test        bl,bl
>004BE9D3    je          004BE9FC
 004BE9D5    push        ebp
 004BE9D6    call        TurnSiblingsOff
 004BE9DB    pop         ecx
 004BE9DC    mov         eax,dword ptr [ebp-4]
 004BE9DF    call        TControl.Changed
 004BE9E4    mov         eax,dword ptr [ebp-4]
 004BE9E7    cmp         byte ptr [eax+270],0
>004BE9EE    jne         004BE9FC
 004BE9F0    mov         eax,dword ptr [ebp-4]
 004BE9F3    mov         si,0FFEC
 004BE9F7    call        @CallDynaInst
 004BE9FC    pop         esi
 004BE9FD    pop         ebx
 004BE9FE    pop         ecx
 004BE9FF    pop         ebp
 004BEA00    ret
*}
end;

//004BEA04
procedure TRadioButton.CreateParams(var Params:TCreateParams);
begin
{*
 004BEA04    push        ebx
 004BEA05    push        esi
 004BEA06    push        edi
 004BEA07    mov         edi,edx
 004BEA09    mov         ebx,eax
 004BEA0B    mov         edx,edi
 004BEA0D    mov         eax,ebx
 004BEA0F    call        TButtonControl.CreateParams
 004BEA14    mov         ecx,4BEA50
 004BEA19    mov         edx,edi
 004BEA1B    mov         eax,ebx
 004BEA1D    call        TWinControl.CreateSubClass
 004BEA22    mov         eax,ebx
 004BEA24    mov         si,0FFC7
 004BEA28    call        @CallDynaInst
 004BEA2D    and         eax,7F
 004BEA30    lea         eax,[eax*8+785EBC]
 004BEA37    movzx       edx,byte ptr [ebx+278]
 004BEA3E    mov         eax,dword ptr [eax+edx*4]
 004BEA41    mov         edx,dword ptr [edi+4]
 004BEA44    or          edx,4
 004BEA47    or          eax,edx
 004BEA49    mov         dword ptr [edi+4],eax
 004BEA4C    pop         edi
 004BEA4D    pop         esi
 004BEA4E    pop         ebx
 004BEA4F    ret
*}
end;

//004BEA60
procedure TRadioButton.CreateWnd;
begin
{*
 004BEA60    push        ebx
 004BEA61    mov         ebx,eax
 004BEA63    mov         eax,ebx
 004BEA65    call        TWinControl.CreateWnd
 004BEA6A    push        0
 004BEA6C    movzx       eax,byte ptr [ebx+279]
 004BEA73    push        eax
 004BEA74    push        0F1
 004BEA79    mov         eax,ebx
 004BEA7B    call        TWinControl.GetHandle
 004BEA80    push        eax
 004BEA81    call        user32.SendMessageW
 004BEA86    pop         ebx
 004BEA87    ret
*}
end;

//004BEA88
procedure TRadioButton.CMCtl3DChanged(var Message:TMessage);
begin
{*
 004BEA88    call        TWinControl.RecreateWnd
 004BEA8D    ret
*}
end;

//004BEA90
procedure TRadioButton.CMDialogChar(var Message:TCMDialogChar);
begin
{*
 004BEA90    push        ebp
 004BEA91    mov         ebp,esp
 004BEA93    push        0
 004BEA95    push        ebx
 004BEA96    push        esi
 004BEA97    push        edi
 004BEA98    mov         edi,edx
 004BEA9A    mov         ebx,eax
 004BEA9C    xor         eax,eax
 004BEA9E    push        ebp
 004BEA9F    push        4BEB05
 004BEAA4    push        dword ptr fs:[eax]
 004BEAA7    mov         dword ptr fs:[eax],esp
 004BEAAA    lea         edx,[ebp-4]
 004BEAAD    mov         eax,ebx
 004BEAAF    call        TControl.GetText
 004BEAB4    mov         edx,dword ptr [ebp-4]
 004BEAB7    movzx       eax,word ptr [edi+4]
 004BEABB    call        IsAccel
 004BEAC0    test        al,al
>004BEAC2    je          004BEAE6
 004BEAC4    mov         eax,ebx
 004BEAC6    mov         si,0FFB6
 004BEACA    call        @CallDynaInst
 004BEACF    test        al,al
>004BEAD1    je          004BEAE6
 004BEAD3    mov         eax,ebx
 004BEAD5    mov         edx,dword ptr [eax]
 004BEAD7    call        dword ptr [edx+0E8]
 004BEADD    mov         dword ptr [edi+0C],1
>004BEAE4    jmp         004BEAEF
 004BEAE6    mov         edx,edi
 004BEAE8    mov         eax,ebx
 004BEAEA    call        TWinControl.CMDialogChar
 004BEAEF    xor         eax,eax
 004BEAF1    pop         edx
 004BEAF2    pop         ecx
 004BEAF3    pop         ecx
 004BEAF4    mov         dword ptr fs:[eax],edx
 004BEAF7    push        4BEB0C
 004BEAFC    lea         eax,[ebp-4]
 004BEAFF    call        @UStrClr
 004BEB04    ret
>004BEB05    jmp         @HandleFinally
>004BEB0A    jmp         004BEAFC
 004BEB0C    pop         edi
 004BEB0D    pop         esi
 004BEB0E    pop         ebx
 004BEB0F    pop         ecx
 004BEB10    pop         ebp
 004BEB11    ret
*}
end;

//004BEB14
procedure TRadioButton.CNCommand(var Message:TWMCommand);
begin
{*
 004BEB14    push        esi
 004BEB15    mov         esi,eax
 004BEB17    movzx       eax,word ptr [edx+6]
 004BEB1B    sub         ax,1
>004BEB1F    jb          004BEB29
 004BEB21    sub         ax,4
>004BEB25    je          004BEB37
>004BEB27    jmp         004BEB42
 004BEB29    mov         dl,1
 004BEB2B    mov         eax,esi
 004BEB2D    mov         ecx,dword ptr [eax]
 004BEB2F    call        dword ptr [ecx+0F0]
 004BEB35    pop         esi
 004BEB36    ret
 004BEB37    mov         eax,esi
 004BEB39    mov         si,0FFEB
 004BEB3D    call        @CallDynaInst
 004BEB42    pop         esi
 004BEB43    ret
*}
end;

//004BEB44
function TListBoxStrings.GetCount:Integer;
begin
{*
 004BEB44    push        ebx
 004BEB45    mov         ebx,eax
 004BEB47    push        0
 004BEB49    push        0
 004BEB4B    push        18B
 004BEB50    mov         eax,dword ptr [ebx+2C]
 004BEB53    call        TWinControl.GetHandle
 004BEB58    push        eax
 004BEB59    call        user32.SendMessageW
 004BEB5E    pop         ebx
 004BEB5F    ret
*}
end;

//004BEB60
function TListBoxStrings.Get(Index:Integer):UnicodeString;
begin
{*
 004BEB60    push        ebp
 004BEB61    mov         ebp,esp
 004BEB63    add         esp,0FFFFFFF8
 004BEB66    push        ebx
 004BEB67    push        esi
 004BEB68    push        edi
 004BEB69    xor         ebx,ebx
 004BEB6B    mov         dword ptr [ebp-8],ebx
 004BEB6E    mov         dword ptr [ebp-4],ecx
 004BEB71    mov         edi,edx
 004BEB73    mov         ebx,eax
 004BEB75    xor         eax,eax
 004BEB77    push        ebp
 004BEB78    push        4BEC25
 004BEB7D    push        dword ptr fs:[eax]
 004BEB80    mov         dword ptr fs:[eax],esp
 004BEB83    mov         esi,dword ptr [ebx+2C]
 004BEB86    movzx       eax,byte ptr [esi+2A0]
 004BEB8D    add         al,0FD
 004BEB8F    sub         al,2
>004BEB91    jae         004BEBA1
 004BEB93    mov         ecx,dword ptr [ebp-4]
 004BEB96    mov         edx,edi
 004BEB98    mov         eax,esi
 004BEB9A    call        TCustomListBox.DoGetData
>004BEB9F    jmp         004BEC0F
 004BEBA1    push        0
 004BEBA3    push        edi
 004BEBA4    push        18A
 004BEBA9    mov         eax,esi
 004BEBAB    call        TWinControl.GetHandle
 004BEBB0    push        eax
 004BEBB1    call        user32.SendMessageW
 004BEBB6    mov         esi,eax
 004BEBB8    cmp         esi,0FFFFFFFF
>004BEBBB    jne         004BEBD6
 004BEBBD    lea         edx,[ebp-8]
 004BEBC0    mov         eax,[0078D7A0];^SResString132:TResStringRec
 004BEBC5    call        LoadResString
 004BEBCA    mov         edx,dword ptr [ebp-8]
 004BEBCD    mov         ecx,edi
 004BEBCF    mov         eax,ebx
 004BEBD1    call        TStrings.Error
 004BEBD6    mov         eax,dword ptr [ebp-4]
 004BEBD9    mov         edx,esi
 004BEBDB    call        @UStrSetLength
 004BEBE0    test        esi,esi
>004BEBE2    je          004BEC0F
 004BEBE4    mov         eax,dword ptr [ebp-4]
 004BEBE7    mov         eax,dword ptr [eax]
 004BEBE9    call        @UStrToPWChar
 004BEBEE    push        eax
 004BEBEF    push        edi
 004BEBF0    push        189
 004BEBF5    mov         eax,dword ptr [ebx+2C]
 004BEBF8    call        TWinControl.GetHandle
 004BEBFD    push        eax
 004BEBFE    call        user32.SendMessageW
 004BEC03    mov         esi,eax
 004BEC05    mov         eax,dword ptr [ebp-4]
 004BEC08    mov         edx,esi
 004BEC0A    call        @UStrSetLength
 004BEC0F    xor         eax,eax
 004BEC11    pop         edx
 004BEC12    pop         ecx
 004BEC13    pop         ecx
 004BEC14    mov         dword ptr fs:[eax],edx
 004BEC17    push        4BEC2C
 004BEC1C    lea         eax,[ebp-8]
 004BEC1F    call        @UStrClr
 004BEC24    ret
>004BEC25    jmp         @HandleFinally
>004BEC2A    jmp         004BEC1C
 004BEC2C    pop         edi
 004BEC2D    pop         esi
 004BEC2E    pop         ebx
 004BEC2F    pop         ecx
 004BEC30    pop         ecx
 004BEC31    pop         ebp
 004BEC32    ret
*}
end;

//004BEC34
function TListBoxStrings.GetObject(Index:Integer):TObject;
begin
{*
 004BEC34    push        ebp
 004BEC35    mov         ebp,esp
 004BEC37    add         esp,0FFFFFFF8
 004BEC3A    push        ebx
 004BEC3B    push        esi
 004BEC3C    push        edi
 004BEC3D    xor         ecx,ecx
 004BEC3F    mov         dword ptr [ebp-8],ecx
 004BEC42    mov         dword ptr [ebp-4],edx
 004BEC45    mov         ebx,eax
 004BEC47    xor         eax,eax
 004BEC49    push        ebp
 004BEC4A    push        4BECB8
 004BEC4F    push        dword ptr fs:[eax]
 004BEC52    mov         dword ptr fs:[eax],esp
 004BEC55    mov         edi,dword ptr [ebx+2C]
 004BEC58    movzx       eax,byte ptr [edi+2A0]
 004BEC5F    add         al,0FD
 004BEC61    sub         al,2
>004BEC63    jae         004BEC73
 004BEC65    mov         edx,dword ptr [ebp-4]
 004BEC68    mov         eax,edi
 004BEC6A    call        TCustomListBox.DoGetDataObject
 004BEC6F    mov         esi,eax
>004BEC71    jmp         004BECA2
 004BEC73    mov         edx,dword ptr [ebp-4]
 004BEC76    mov         eax,edi
 004BEC78    mov         si,0FFAD
 004BEC7C    call        @CallDynaInst
 004BEC81    mov         esi,eax
 004BEC83    cmp         esi,0FFFFFFFF
>004BEC86    jne         004BECA2
 004BEC88    lea         edx,[ebp-8]
 004BEC8B    mov         eax,[0078D7A0];^SResString132:TResStringRec
 004BEC90    call        LoadResString
 004BEC95    mov         edx,dword ptr [ebp-8]
 004BEC98    mov         ecx,dword ptr [ebp-4]
 004BEC9B    mov         eax,ebx
 004BEC9D    call        TStrings.Error
 004BECA2    xor         eax,eax
 004BECA4    pop         edx
 004BECA5    pop         ecx
 004BECA6    pop         ecx
 004BECA7    mov         dword ptr fs:[eax],edx
 004BECAA    push        4BECBF
 004BECAF    lea         eax,[ebp-8]
 004BECB2    call        @UStrClr
 004BECB7    ret
>004BECB8    jmp         @HandleFinally
>004BECBD    jmp         004BECAF
 004BECBF    mov         eax,esi
 004BECC1    pop         edi
 004BECC2    pop         esi
 004BECC3    pop         ebx
 004BECC4    pop         ecx
 004BECC5    pop         ecx
 004BECC6    pop         ebp
 004BECC7    ret
*}
end;

//004BECC8
procedure TListBoxStrings.Put(Index:Integer; const S:UnicodeString);
begin
{*
 004BECC8    push        ebx
 004BECC9    push        esi
 004BECCA    push        edi
 004BECCB    push        ebp
 004BECCC    add         esp,0FFFFFFF8
 004BECCF    mov         dword ptr [esp],ecx
 004BECD2    mov         edi,edx
 004BECD4    mov         ebx,eax
 004BECD6    mov         eax,dword ptr [ebx+2C]
 004BECD9    mov         edx,dword ptr [eax]
 004BECDB    call        dword ptr [edx+0EC]
 004BECE1    mov         ebp,eax
 004BECE3    mov         edx,edi
 004BECE5    mov         eax,dword ptr [ebx+2C]
 004BECE8    mov         si,0FFAF
 004BECEC    call        @CallDynaInst
 004BECF1    mov         dword ptr [esp+4],eax
 004BECF5    xor         ecx,ecx
 004BECF7    mov         edx,edi
 004BECF9    mov         eax,dword ptr [ebx+2C]
 004BECFC    mov         si,0FFAE
 004BED00    call        @CallDynaInst
 004BED05    mov         edx,edi
 004BED07    mov         eax,ebx
 004BED09    mov         ecx,dword ptr [eax]
 004BED0B    call        dword ptr [ecx+48]
 004BED0E    push        0
 004BED10    mov         ecx,dword ptr [esp+4]
 004BED14    mov         edx,edi
 004BED16    mov         eax,ebx
 004BED18    mov         esi,dword ptr [eax]
 004BED1A    call        dword ptr [esi+64]
 004BED1D    mov         ecx,dword ptr [esp+4]
 004BED21    mov         edx,edi
 004BED23    mov         eax,dword ptr [ebx+2C]
 004BED26    mov         si,0FFAE
 004BED2A    call        @CallDynaInst
 004BED2F    mov         edx,ebp
 004BED31    mov         eax,dword ptr [ebx+2C]
 004BED34    mov         ecx,dword ptr [eax]
 004BED36    call        dword ptr [ecx+0F0]
 004BED3C    pop         ecx
 004BED3D    pop         edx
 004BED3E    pop         ebp
 004BED3F    pop         edi
 004BED40    pop         esi
 004BED41    pop         ebx
 004BED42    ret
*}
end;

//004BED44
procedure TListBoxStrings.PutObject(Index:Integer; AObject:TObject);
begin
{*
 004BED44    push        ebx
 004BED45    push        esi
 004BED46    mov         esi,ecx
 004BED48    mov         ebx,eax
 004BED4A    mov         eax,dword ptr [ebx+2C]
 004BED4D    movzx       eax,byte ptr [eax+2A0]
 004BED54    add         al,0FD
 004BED56    sub         al,2
>004BED58    jb          004BED77
 004BED5A    cmp         edx,0FFFFFFFF
>004BED5D    jne         004BED69
 004BED5F    mov         eax,ebx
 004BED61    mov         edx,dword ptr [eax]
 004BED63    call        dword ptr [edx+14]
 004BED66    mov         edx,eax
 004BED68    dec         edx
 004BED69    mov         ecx,esi
 004BED6B    mov         eax,dword ptr [ebx+2C]
 004BED6E    mov         si,0FFAC
 004BED72    call        @CallDynaInst
 004BED77    pop         esi
 004BED78    pop         ebx
 004BED79    ret
*}
end;

//004BED7C
function TListBoxStrings.Add(S:string):Integer;
begin
{*
 004BED7C    push        ebp
 004BED7D    mov         ebp,esp
 004BED7F    add         esp,0FFFFFFF8
 004BED82    push        ebx
 004BED83    push        esi
 004BED84    push        edi
 004BED85    xor         ecx,ecx
 004BED87    mov         dword ptr [ebp-8],ecx
 004BED8A    mov         dword ptr [ebp-4],edx
 004BED8D    mov         ebx,eax
 004BED8F    xor         eax,eax
 004BED91    push        ebp
 004BED92    push        4BEE04
 004BED97    push        dword ptr fs:[eax]
 004BED9A    mov         dword ptr fs:[eax],esp
 004BED9D    or          esi,0FFFFFFFF
 004BEDA0    mov         edi,dword ptr [ebx+2C]
 004BEDA3    movzx       eax,byte ptr [edi+2A0]
 004BEDAA    add         al,0FD
 004BEDAC    sub         al,2
>004BEDAE    jb          004BEDEE
 004BEDB0    mov         eax,dword ptr [ebp-4]
 004BEDB3    push        eax
 004BEDB4    mov         eax,edi
 004BEDB6    call        TWinControl.GetHandle
 004BEDBB    xor         ecx,ecx
 004BEDBD    mov         edx,180
 004BEDC2    call        SendTextMessage
 004BEDC7    mov         esi,eax
 004BEDC9    test        esi,esi
>004BEDCB    jge         004BEDEE
 004BEDCD    lea         edx,[ebp-8]
 004BEDD0    mov         eax,[0078CF84];^SResString280:TResStringRec
 004BEDD5    call        LoadResString
 004BEDDA    mov         ecx,dword ptr [ebp-8]
 004BEDDD    mov         dl,1
 004BEDDF    mov         eax,[004391C8];EOutOfResources
 004BEDE4    call        Exception.Create
 004BEDE9    call        @RaiseExcept
 004BEDEE    xor         eax,eax
 004BEDF0    pop         edx
 004BEDF1    pop         ecx
 004BEDF2    pop         ecx
 004BEDF3    mov         dword ptr fs:[eax],edx
 004BEDF6    push        4BEE0B
 004BEDFB    lea         eax,[ebp-8]
 004BEDFE    call        @UStrClr
 004BEE03    ret
>004BEE04    jmp         @HandleFinally
>004BEE09    jmp         004BEDFB
 004BEE0B    mov         eax,esi
 004BEE0D    pop         edi
 004BEE0E    pop         esi
 004BEE0F    pop         ebx
 004BEE10    pop         ecx
 004BEE11    pop         ecx
 004BEE12    pop         ebp
 004BEE13    ret
*}
end;

//004BEE14
procedure TListBoxStrings.Insert(Index:Integer; S:string);
begin
{*
 004BEE14    push        ebp
 004BEE15    mov         ebp,esp
 004BEE17    add         esp,0FFFFFFF8
 004BEE1A    push        ebx
 004BEE1B    push        esi
 004BEE1C    push        edi
 004BEE1D    xor         ebx,ebx
 004BEE1F    mov         dword ptr [ebp-8],ebx
 004BEE22    mov         dword ptr [ebp-4],ecx
 004BEE25    mov         edi,edx
 004BEE27    mov         ebx,eax
 004BEE29    xor         eax,eax
 004BEE2B    push        ebp
 004BEE2C    push        4BEE99
 004BEE31    push        dword ptr fs:[eax]
 004BEE34    mov         dword ptr fs:[eax],esp
 004BEE37    mov         esi,dword ptr [ebx+2C]
 004BEE3A    movzx       eax,byte ptr [esi+2A0]
 004BEE41    add         al,0FD
 004BEE43    sub         al,2
>004BEE45    jb          004BEE83
 004BEE47    mov         eax,dword ptr [ebp-4]
 004BEE4A    push        eax
 004BEE4B    mov         eax,esi
 004BEE4D    call        TWinControl.GetHandle
 004BEE52    mov         ecx,edi
 004BEE54    mov         edx,181
 004BEE59    call        SendTextMessage
 004BEE5E    test        eax,eax
>004BEE60    jge         004BEE83
 004BEE62    lea         edx,[ebp-8]
 004BEE65    mov         eax,[0078CF84];^SResString280:TResStringRec
 004BEE6A    call        LoadResString
 004BEE6F    mov         ecx,dword ptr [ebp-8]
 004BEE72    mov         dl,1
 004BEE74    mov         eax,[004391C8];EOutOfResources
 004BEE79    call        Exception.Create
 004BEE7E    call        @RaiseExcept
 004BEE83    xor         eax,eax
 004BEE85    pop         edx
 004BEE86    pop         ecx
 004BEE87    pop         ecx
 004BEE88    mov         dword ptr fs:[eax],edx
 004BEE8B    push        4BEEA0
 004BEE90    lea         eax,[ebp-8]
 004BEE93    call        @UStrClr
 004BEE98    ret
>004BEE99    jmp         @HandleFinally
>004BEE9E    jmp         004BEE90
 004BEEA0    pop         edi
 004BEEA1    pop         esi
 004BEEA2    pop         ebx
 004BEEA3    pop         ecx
 004BEEA4    pop         ecx
 004BEEA5    pop         ebp
 004BEEA6    ret
*}
end;

//004BEEA8
procedure TListBoxStrings.Delete(Index:Integer);
begin
{*
 004BEEA8    push        esi
 004BEEA9    mov         eax,dword ptr [eax+2C]
 004BEEAC    mov         si,0FFAA
 004BEEB0    call        @CallDynaInst
 004BEEB5    pop         esi
 004BEEB6    ret
*}
end;

//004BEEB8
procedure TListBoxStrings.Exchange(Index1:Integer; Index2:Integer);
begin
{*
 004BEEB8    push        ebp
 004BEEB9    mov         ebp,esp
 004BEEBB    add         esp,0FFFFFFF0
 004BEEBE    push        ebx
 004BEEBF    push        esi
 004BEEC0    push        edi
 004BEEC1    xor         ebx,ebx
 004BEEC3    mov         dword ptr [ebp-10],ebx
 004BEEC6    mov         dword ptr [ebp-4],ebx
 004BEEC9    mov         edi,ecx
 004BEECB    mov         ebx,edx
 004BEECD    mov         dword ptr [ebp-8],eax
 004BEED0    xor         eax,eax
 004BEED2    push        ebp
 004BEED3    push        4BF00C
 004BEED8    push        dword ptr fs:[eax]
 004BEEDB    mov         dword ptr fs:[eax],esp
 004BEEDE    mov         eax,dword ptr [ebp-8]
 004BEEE1    mov         eax,dword ptr [eax+2C]
 004BEEE4    movzx       eax,byte ptr [eax+2A0]
 004BEEEB    add         al,0FD
 004BEEED    sub         al,2
>004BEEEF    jb          004BEFEE
 004BEEF5    mov         eax,dword ptr [ebp-8]
 004BEEF8    call        TStrings.BeginUpdate
 004BEEFD    xor         eax,eax
 004BEEFF    push        ebp
 004BEF00    push        4BEFE7
 004BEF05    push        dword ptr fs:[eax]
 004BEF08    mov         dword ptr fs:[eax],esp
 004BEF0B    lea         ecx,[ebp-4]
 004BEF0E    mov         edx,ebx
 004BEF10    mov         eax,dword ptr [ebp-8]
 004BEF13    mov         esi,dword ptr [eax]
 004BEF15    call        dword ptr [esi+0C]
 004BEF18    mov         eax,dword ptr [ebp-8]
 004BEF1B    mov         eax,dword ptr [eax+2C]
 004BEF1E    mov         edx,ebx
 004BEF20    mov         si,0FFAF
 004BEF24    call        @CallDynaInst
 004BEF29    mov         dword ptr [ebp-0C],eax
 004BEF2C    lea         ecx,[ebp-10]
 004BEF2F    mov         edx,edi
 004BEF31    mov         eax,dword ptr [ebp-8]
 004BEF34    mov         esi,dword ptr [eax]
 004BEF36    call        dword ptr [esi+0C]
 004BEF39    mov         ecx,dword ptr [ebp-10]
 004BEF3C    mov         edx,ebx
 004BEF3E    mov         eax,dword ptr [ebp-8]
 004BEF41    mov         esi,dword ptr [eax]
 004BEF43    call        dword ptr [esi+20]
 004BEF46    mov         eax,dword ptr [ebp-8]
 004BEF49    mov         eax,dword ptr [eax+2C]
 004BEF4C    mov         edx,edi
 004BEF4E    mov         si,0FFAF
 004BEF52    call        @CallDynaInst
 004BEF57    mov         ecx,eax
 004BEF59    mov         eax,dword ptr [ebp-8]
 004BEF5C    mov         eax,dword ptr [eax+2C]
 004BEF5F    mov         edx,ebx
 004BEF61    mov         si,0FFAE
 004BEF65    call        @CallDynaInst
 004BEF6A    mov         ecx,dword ptr [ebp-4]
 004BEF6D    mov         edx,edi
 004BEF6F    mov         eax,dword ptr [ebp-8]
 004BEF72    mov         esi,dword ptr [eax]
 004BEF74    call        dword ptr [esi+20]
 004BEF77    mov         eax,dword ptr [ebp-8]
 004BEF7A    mov         eax,dword ptr [eax+2C]
 004BEF7D    mov         ecx,dword ptr [ebp-0C]
 004BEF80    mov         edx,edi
 004BEF82    mov         si,0FFAE
 004BEF86    call        @CallDynaInst
 004BEF8B    mov         eax,dword ptr [ebp-8]
 004BEF8E    mov         eax,dword ptr [eax+2C]
 004BEF91    mov         edx,dword ptr [eax]
 004BEF93    call        dword ptr [edx+0EC]
 004BEF99    cmp         ebx,eax
>004BEF9B    jne         004BEFAF
 004BEF9D    mov         eax,dword ptr [ebp-8]
 004BEFA0    mov         eax,dword ptr [eax+2C]
 004BEFA3    mov         edx,edi
 004BEFA5    mov         ecx,dword ptr [eax]
 004BEFA7    call        dword ptr [ecx+0F0]
>004BEFAD    jmp         004BEFD1
 004BEFAF    mov         eax,dword ptr [ebp-8]
 004BEFB2    mov         eax,dword ptr [eax+2C]
 004BEFB5    mov         edx,dword ptr [eax]
 004BEFB7    call        dword ptr [edx+0EC]
 004BEFBD    cmp         edi,eax
>004BEFBF    jne         004BEFD1
 004BEFC1    mov         eax,dword ptr [ebp-8]
 004BEFC4    mov         eax,dword ptr [eax+2C]
 004BEFC7    mov         edx,ebx
 004BEFC9    mov         ecx,dword ptr [eax]
 004BEFCB    call        dword ptr [ecx+0F0]
 004BEFD1    xor         eax,eax
 004BEFD3    pop         edx
 004BEFD4    pop         ecx
 004BEFD5    pop         ecx
 004BEFD6    mov         dword ptr fs:[eax],edx
 004BEFD9    push        4BEFEE
 004BEFDE    mov         eax,dword ptr [ebp-8]
 004BEFE1    call        TStrings.EndUpdate
 004BEFE6    ret
>004BEFE7    jmp         @HandleFinally
>004BEFEC    jmp         004BEFDE
 004BEFEE    xor         eax,eax
 004BEFF0    pop         edx
 004BEFF1    pop         ecx
 004BEFF2    pop         ecx
 004BEFF3    mov         dword ptr fs:[eax],edx
 004BEFF6    push        4BF013
 004BEFFB    lea         eax,[ebp-10]
 004BEFFE    call        @UStrClr
 004BF003    lea         eax,[ebp-4]
 004BF006    call        @UStrClr
 004BF00B    ret
>004BF00C    jmp         @HandleFinally
>004BF011    jmp         004BEFFB
 004BF013    pop         edi
 004BF014    pop         esi
 004BF015    pop         ebx
 004BF016    mov         esp,ebp
 004BF018    pop         ebp
 004BF019    ret
*}
end;

//004BF01C
procedure TListBoxStrings.Clear;
begin
{*
 004BF01C    push        esi
 004BF01D    mov         eax,dword ptr [eax+2C]
 004BF020    mov         si,0FFAB
 004BF024    call        @CallDynaInst
 004BF029    pop         esi
 004BF02A    ret
*}
end;

//004BF02C
procedure TListBoxStrings.SetUpdateState(Updating:Boolean);
begin
{*
 004BF02C    push        ebx
 004BF02D    push        esi
 004BF02E    mov         ebx,edx
 004BF030    mov         esi,eax
 004BF032    push        0
 004BF034    mov         eax,ebx
 004BF036    xor         al,1
 004BF038    and         eax,7F
 004BF03B    push        eax
 004BF03C    push        0B
 004BF03E    mov         eax,dword ptr [esi+2C]
 004BF041    call        TWinControl.GetHandle
 004BF046    push        eax
 004BF047    call        user32.SendMessageW
 004BF04C    xor         bl,1
 004BF04F    test        bl,bl
>004BF051    je          004BF05B
 004BF053    mov         eax,dword ptr [esi+2C]
 004BF056    call        TControl.Refresh
 004BF05B    pop         esi
 004BF05C    pop         ebx
 004BF05D    ret
*}
end;

//004BF060
function TListBoxStrings.IndexOf(S:string):Integer;
begin
{*
 004BF060    push        ebx
 004BF061    push        esi
 004BF062    push        edi
 004BF063    mov         edi,edx
 004BF065    mov         ebx,eax
 004BF067    mov         esi,dword ptr [ebx+2C]
 004BF06A    movzx       eax,byte ptr [esi+2A0]
 004BF071    add         al,0FD
 004BF073    sub         al,2
>004BF075    jae         004BF082
 004BF077    mov         edx,edi
 004BF079    mov         eax,esi
 004BF07B    call        TCustomListBox.DoFindData
>004BF080    jmp         004BF097
 004BF082    push        edi
 004BF083    mov         eax,esi
 004BF085    call        TWinControl.GetHandle
 004BF08A    or          ecx,0FFFFFFFF
 004BF08D    mov         edx,1A2
 004BF092    call        SendTextMessage
 004BF097    pop         edi
 004BF098    pop         esi
 004BF099    pop         ebx
 004BF09A    ret
*}
end;

//004BF09C
procedure TListBoxStrings.Move(CurIndex:Integer; NewIndex:Integer);
begin
{*
 004BF09C    push        ebp
 004BF09D    mov         ebp,esp
 004BF09F    add         esp,0FFFFFFF4
 004BF0A2    push        ebx
 004BF0A3    push        esi
 004BF0A4    push        edi
 004BF0A5    xor         ebx,ebx
 004BF0A7    mov         dword ptr [ebp-4],ebx
 004BF0AA    mov         edi,ecx
 004BF0AC    mov         ebx,edx
 004BF0AE    mov         dword ptr [ebp-8],eax
 004BF0B1    xor         eax,eax
 004BF0B3    push        ebp
 004BF0B4    push        4BF19C
 004BF0B9    push        dword ptr fs:[eax]
 004BF0BC    mov         dword ptr fs:[eax],esp
 004BF0BF    mov         eax,dword ptr [ebp-8]
 004BF0C2    mov         eax,dword ptr [eax+2C]
 004BF0C5    movzx       eax,byte ptr [eax+2A0]
 004BF0CC    add         al,0FD
 004BF0CE    sub         al,2
>004BF0D0    jb          004BF186
 004BF0D6    mov         eax,dword ptr [ebp-8]
 004BF0D9    call        TStrings.BeginUpdate
 004BF0DE    mov         eax,dword ptr [ebp-8]
 004BF0E1    mov         eax,dword ptr [eax+2C]
 004BF0E4    mov         byte ptr [eax+2ED],1
 004BF0EB    xor         eax,eax
 004BF0ED    push        ebp
 004BF0EE    push        4BF17F
 004BF0F3    push        dword ptr fs:[eax]
 004BF0F6    mov         dword ptr fs:[eax],esp
 004BF0F9    cmp         edi,ebx
>004BF0FB    je          004BF15C
 004BF0FD    lea         ecx,[ebp-4]
 004BF100    mov         edx,ebx
 004BF102    mov         eax,dword ptr [ebp-8]
 004BF105    mov         esi,dword ptr [eax]
 004BF107    call        dword ptr [esi+0C]
 004BF10A    mov         eax,dword ptr [ebp-8]
 004BF10D    mov         eax,dword ptr [eax+2C]
 004BF110    mov         edx,ebx
 004BF112    mov         si,0FFAF
 004BF116    call        @CallDynaInst
 004BF11B    mov         dword ptr [ebp-0C],eax
 004BF11E    mov         eax,dword ptr [ebp-8]
 004BF121    mov         eax,dword ptr [eax+2C]
 004BF124    xor         ecx,ecx
 004BF126    mov         edx,ebx
 004BF128    mov         si,0FFAE
 004BF12C    call        @CallDynaInst
 004BF131    mov         edx,ebx
 004BF133    mov         eax,dword ptr [ebp-8]
 004BF136    mov         ecx,dword ptr [eax]
 004BF138    call        dword ptr [ecx+48]
 004BF13B    mov         ecx,dword ptr [ebp-4]
 004BF13E    mov         edx,edi
 004BF140    mov         eax,dword ptr [ebp-8]
 004BF143    mov         ebx,dword ptr [eax]
 004BF145    call        dword ptr [ebx+60]
 004BF148    mov         eax,dword ptr [ebp-8]
 004BF14B    mov         eax,dword ptr [eax+2C]
 004BF14E    mov         ecx,dword ptr [ebp-0C]
 004BF151    mov         edx,edi
 004BF153    mov         si,0FFAE
 004BF157    call        @CallDynaInst
 004BF15C    xor         eax,eax
 004BF15E    pop         edx
 004BF15F    pop         ecx
 004BF160    pop         ecx
 004BF161    mov         dword ptr fs:[eax],edx
 004BF164    push        4BF186
 004BF169    mov         eax,dword ptr [ebp-8]
 004BF16C    mov         eax,dword ptr [eax+2C]
 004BF16F    mov         byte ptr [eax+2ED],0
 004BF176    mov         eax,dword ptr [ebp-8]
 004BF179    call        TStrings.EndUpdate
 004BF17E    ret
>004BF17F    jmp         @HandleFinally
>004BF184    jmp         004BF169
 004BF186    xor         eax,eax
 004BF188    pop         edx
 004BF189    pop         ecx
 004BF18A    pop         ecx
 004BF18B    mov         dword ptr fs:[eax],edx
 004BF18E    push        4BF1A3
 004BF193    lea         eax,[ebp-4]
 004BF196    call        @UStrClr
 004BF19B    ret
>004BF19C    jmp         @HandleFinally
>004BF1A1    jmp         004BF193
 004BF1A3    pop         edi
 004BF1A4    pop         esi
 004BF1A5    pop         ebx
 004BF1A6    mov         esp,ebp
 004BF1A8    pop         ebp
 004BF1A9    ret
*}
end;

//004BF1AC
constructor TCustomListBox.Create;
begin
{*
 004BF1AC    push        ebp
 004BF1AD    mov         ebp,esp
 004BF1AF    push        ecx
 004BF1B0    push        ebx
 004BF1B1    push        esi
 004BF1B2    test        dl,dl
>004BF1B4    je          004BF1BE
 004BF1B6    add         esp,0FFFFFFF0
 004BF1B9    call        @ClassCreate
 004BF1BE    mov         byte ptr [ebp-1],dl
 004BF1C1    mov         ebx,eax
 004BF1C3    xor         edx,edx
 004BF1C5    mov         eax,ebx
 004BF1C7    call        TCustomListControl.Create
 004BF1CC    mov         eax,[0078D264];^NewStyleControls:Boolean
 004BF1D1    cmp         byte ptr [eax],0
>004BF1D4    je          004BF1E0
 004BF1D6    mov         eax,[004BF2A0]
 004BF1DB    mov         dword ptr [ebx+50],eax
>004BF1DE    jmp         004BF1E8
 004BF1E0    mov         eax,[004BF2A4]
 004BF1E5    mov         dword ptr [ebx+50],eax
 004BF1E8    mov         edx,79
 004BF1ED    mov         eax,ebx
 004BF1EF    call        TControl.SetWidth
 004BF1F4    mov         edx,61
 004BF1F9    mov         eax,ebx
 004BF1FB    call        TControl.SetHeight
 004BF200    mov         dl,1
 004BF202    mov         eax,ebx
 004BF204    call        TWinControl.SetTabStop
 004BF209    xor         edx,edx
 004BF20B    mov         eax,ebx
 004BF20D    call        TControl.SetParentColor
 004BF212    mov         byte ptr [ebx+278],1
 004BF219    mov         dl,1
 004BF21B    mov         eax,[004B8490];TListBoxStrings
 004BF220    call        TStrings.Create
 004BF225    mov         esi,eax
 004BF227    mov         dword ptr [ebx+280],esi
 004BF22D    mov         dword ptr [esi+2C],ebx
 004BF230    mov         dl,1
 004BF232    mov         eax,[00476D34];TControlCanvas
 004BF237    call        TCanvas.Create
 004BF23C    mov         esi,eax
 004BF23E    mov         dword ptr [ebx+290],esi
 004BF244    mov         eax,esi
 004BF246    mov         edx,ebx
 004BF248    call        TControlCanvas.SetControl
 004BF24D    mov         dword ptr [ebx+298],10
 004BF257    mov         byte ptr [ebx+28C],1
 004BF25E    mov         byte ptr [ebx+2A3],1
 004BF265    mov         dword ptr [ebx+29C],0FFFFFFFF
 004BF26F    mov         dword ptr [ebx+2E8],1F4
 004BF279    mov         byte ptr [ebx+2EC],0
 004BF280    mov         eax,ebx
 004BF282    cmp         byte ptr [ebp-1],0
>004BF286    je          004BF297
 004BF288    call        @AfterConstruction
 004BF28D    pop         dword ptr fs:[0]
 004BF294    add         esp,0C
 004BF297    mov         eax,ebx
 004BF299    pop         esi
 004BF29A    pop         ebx
 004BF29B    pop         ecx
 004BF29C    pop         ebp
 004BF29D    ret
*}
end;

//004BF2A8
destructor TCustomListBox.Destroy();
begin
{*
 004BF2A8    push        ebx
 004BF2A9    push        esi
 004BF2AA    call        @BeforeDestruction
 004BF2AF    mov         ebx,edx
 004BF2B1    mov         esi,eax
 004BF2B3    mov         eax,dword ptr [esi+290]
 004BF2B9    call        TObject.Free
 004BF2BE    mov         eax,dword ptr [esi+280]
 004BF2C4    call        TObject.Free
 004BF2C9    mov         eax,dword ptr [esi+2A8]
 004BF2CF    call        TObject.Free
 004BF2D4    mov         edx,ebx
 004BF2D6    and         dl,0FC
 004BF2D9    mov         eax,esi
 004BF2DB    call        TWinControl.Destroy
 004BF2E0    test        bl,bl
>004BF2E2    jle         004BF2EB
 004BF2E4    mov         eax,esi
 004BF2E6    call        @ClassDestroy
 004BF2EB    pop         esi
 004BF2EC    pop         ebx
 004BF2ED    ret
*}
end;

//004BF2F0
procedure TCustomListBox.AddItem(Item:string; AObject:TObject);
begin
{*
 004BF2F0    push        ebp
 004BF2F1    mov         ebp,esp
 004BF2F3    add         esp,0FFFFFFF8
 004BF2F6    push        ebx
 004BF2F7    push        esi
 004BF2F8    push        edi
 004BF2F9    xor         ebx,ebx
 004BF2FB    mov         dword ptr [ebp-8],ebx
 004BF2FE    mov         edi,ecx
 004BF300    mov         dword ptr [ebp-4],edx
 004BF303    mov         ebx,eax
 004BF305    mov         eax,dword ptr [ebp-4]
 004BF308    call        @UStrAddRef
 004BF30D    xor         eax,eax
 004BF30F    push        ebp
 004BF310    push        4BF363
 004BF315    push        dword ptr fs:[eax]
 004BF318    mov         dword ptr fs:[eax],esp
 004BF31B    mov         eax,dword ptr [ebp-4]
 004BF31E    call        @UStrToPWChar
 004BF323    mov         esi,eax
 004BF325    mov         eax,esi
 004BF327    call        StrLen
 004BF32C    push        eax
 004BF32D    mov         edx,esi
 004BF32F    lea         eax,[ebp-8]
 004BF332    pop         ecx
 004BF333    call        @UStrFromPWCharLen
 004BF338    mov         ecx,edi
 004BF33A    mov         edx,dword ptr [ebp-8]
 004BF33D    mov         eax,dword ptr [ebx+280]
 004BF343    mov         ebx,dword ptr [eax]
 004BF345    call        dword ptr [ebx+3C]
 004BF348    xor         eax,eax
 004BF34A    pop         edx
 004BF34B    pop         ecx
 004BF34C    pop         ecx
 004BF34D    mov         dword ptr fs:[eax],edx
 004BF350    push        4BF36A
 004BF355    lea         eax,[ebp-8]
 004BF358    mov         edx,2
 004BF35D    call        @UStrArrayClr
 004BF362    ret
>004BF363    jmp         @HandleFinally
>004BF368    jmp         004BF355
 004BF36A    pop         edi
 004BF36B    pop         esi
 004BF36C    pop         ebx
 004BF36D    pop         ecx
 004BF36E    pop         ecx
 004BF36F    pop         ebp
 004BF370    ret
*}
end;

//004BF374
procedure TCustomListBox.GetItemData(Index:Integer);
begin
{*
 004BF374    push        ebx
 004BF375    push        esi
 004BF376    mov         esi,edx
 004BF378    mov         ebx,eax
 004BF37A    push        0
 004BF37C    push        esi
 004BF37D    push        199
 004BF382    mov         eax,ebx
 004BF384    call        TWinControl.GetHandle
 004BF389    push        eax
 004BF38A    call        user32.SendMessageW
 004BF38F    pop         esi
 004BF390    pop         ebx
 004BF391    ret
*}
end;

//004BF394
procedure TCustomListBox.SetItemData(Index:Integer; AData:TCustomLongData);
begin
{*
 004BF394    push        ebx
 004BF395    push        esi
 004BF396    push        edi
 004BF397    mov         edi,ecx
 004BF399    mov         esi,edx
 004BF39B    mov         ebx,eax
 004BF39D    push        edi
 004BF39E    push        esi
 004BF39F    push        19A
 004BF3A4    mov         eax,ebx
 004BF3A6    call        TWinControl.GetHandle
 004BF3AB    push        eax
 004BF3AC    call        user32.SendMessageW
 004BF3B1    pop         edi
 004BF3B2    pop         esi
 004BF3B3    pop         ebx
 004BF3B4    ret
*}
end;

//004BF3B8
procedure TCustomListBox.InternalGetItemData(Index:Integer);
begin
{*
 004BF3B8    push        esi
 004BF3B9    mov         si,0FFAD
 004BF3BD    call        @CallDynaInst
 004BF3C2    pop         esi
 004BF3C3    ret
*}
end;

//004BF3C4
procedure TCustomListBox.InternalSetItemData(Index:Integer; AData:TCustomLongData);
begin
{*
 004BF3C4    push        esi
 004BF3C5    mov         esi,eax
 004BF3C7    mov         eax,esi
 004BF3C9    mov         si,0FFAC
 004BF3CD    call        @CallDynaInst
 004BF3D2    pop         esi
 004BF3D3    ret
*}
end;

//004BF3D4
procedure TCustomListBox.DeleteString(Index:Integer);
begin
{*
 004BF3D4    push        ebx
 004BF3D5    push        esi
 004BF3D6    mov         esi,edx
 004BF3D8    mov         ebx,eax
 004BF3DA    push        0
 004BF3DC    push        esi
 004BF3DD    push        182
 004BF3E2    mov         eax,ebx
 004BF3E4    call        TWinControl.GetHandle
 004BF3E9    push        eax
 004BF3EA    call        user32.SendMessageW
 004BF3EF    pop         esi
 004BF3F0    pop         ebx
 004BF3F1    ret
*}
end;

//004BF3F4
procedure TCustomListBox.ResetContent;
begin
{*
 004BF3F4    push        ebx
 004BF3F5    mov         ebx,eax
 004BF3F7    movzx       eax,byte ptr [ebx+2A0]
 004BF3FE    add         al,0FD
 004BF400    sub         al,2
>004BF402    jb          004BF41A
 004BF404    push        0
 004BF406    push        0
 004BF408    push        184
 004BF40D    mov         eax,ebx
 004BF40F    call        TWinControl.GetHandle
 004BF414    push        eax
 004BF415    call        user32.SendMessageW
 004BF41A    pop         ebx
 004BF41B    ret
*}
end;

//004BF41C
procedure TCustomListBox.SaveRecreateItems(RecreateItems:TStrings);
begin
{*
 004BF41C    push        esi
 004BF41D    push        edi
 004BF41E    mov         edi,edx
 004BF420    mov         esi,eax
 004BF422    mov         edx,dword ptr [esi+280]
 004BF428    mov         eax,edi
 004BF42A    mov         ecx,dword ptr [eax]
 004BF42C    call        dword ptr [ecx+8]
 004BF42F    pop         edi
 004BF430    pop         esi
 004BF431    ret
*}
end;

//004BF434
procedure TCustomListBox.Clear;
begin
{*
 004BF434    push        esi
 004BF435    mov         esi,eax
 004BF437    mov         eax,dword ptr [esi+280]
 004BF43D    mov         edx,dword ptr [eax]
 004BF43F    call        dword ptr [edx+44]
 004BF442    pop         esi
 004BF443    ret
*}
end;

//004BF444
procedure TCustomListBox.ClearSelection;
begin
{*
 004BF444    push        ebx
 004BF445    push        esi
 004BF446    push        edi
 004BF447    mov         esi,eax
 004BF449    cmp         byte ptr [esi+270],0
>004BF450    je          004BF478
 004BF452    mov         eax,dword ptr [esi+280]
 004BF458    mov         edx,dword ptr [eax]
 004BF45A    call        dword ptr [edx+14]
 004BF45D    mov         ebx,eax
 004BF45F    dec         ebx
 004BF460    test        ebx,ebx
>004BF462    jl          004BF485
 004BF464    inc         ebx
 004BF465    xor         edi,edi
 004BF467    xor         ecx,ecx
 004BF469    mov         edx,edi
 004BF46B    mov         eax,esi
 004BF46D    call        TCustomListBox.SetSelected
 004BF472    inc         edi
 004BF473    dec         ebx
>004BF474    jne         004BF467
>004BF476    jmp         004BF485
 004BF478    or          edx,0FFFFFFFF
 004BF47B    mov         eax,esi
 004BF47D    mov         ecx,dword ptr [eax]
 004BF47F    call        dword ptr [ecx+0F0]
 004BF485    pop         edi
 004BF486    pop         esi
 004BF487    pop         ebx
 004BF488    ret
*}
end;

//004BF48C
procedure TCustomListBox.CopySelection(Destination:TCustomListControl);
begin
{*
 004BF48C    push        ebp
 004BF48D    mov         ebp,esp
 004BF48F    xor         ecx,ecx
 004BF491    push        ecx
 004BF492    push        ecx
 004BF493    push        ecx
 004BF494    push        ecx
 004BF495    push        ecx
 004BF496    push        ecx
 004BF497    push        ebx
 004BF498    push        esi
 004BF499    push        edi
 004BF49A    mov         dword ptr [ebp-4],edx
 004BF49D    mov         ebx,eax
 004BF49F    xor         eax,eax
 004BF4A1    push        ebp
 004BF4A2    push        4BF5A3
 004BF4A7    push        dword ptr fs:[eax]
 004BF4AA    mov         dword ptr fs:[eax],esp
 004BF4AD    cmp         byte ptr [ebx+270],0
>004BF4B4    je          004BF526
 004BF4B6    mov         eax,dword ptr [ebx+280]
 004BF4BC    mov         edx,dword ptr [eax]
 004BF4BE    call        dword ptr [edx+14]
 004BF4C1    dec         eax
 004BF4C2    test        eax,eax
>004BF4C4    jl          004BF588
 004BF4CA    inc         eax
 004BF4CB    mov         dword ptr [ebp-8],eax
 004BF4CE    xor         esi,esi
 004BF4D0    mov         edx,esi
 004BF4D2    mov         eax,ebx
 004BF4D4    call        TCustomListBox.GetSelected
 004BF4D9    test        al,al
>004BF4DB    je          004BF51E
 004BF4DD    lea         ecx,[ebp-10]
 004BF4E0    mov         edx,esi
 004BF4E2    mov         eax,dword ptr [ebx+280]
 004BF4E8    mov         edi,dword ptr [eax]
 004BF4EA    call        dword ptr [edi+0C]
 004BF4ED    mov         eax,dword ptr [ebp-10]
 004BF4F0    call        @UStrToPWChar
 004BF4F5    mov         edx,eax
 004BF4F7    lea         eax,[ebp-0C]
 004BF4FA    call        @UStrFromPWChar
 004BF4FF    mov         eax,dword ptr [ebp-0C]
 004BF502    push        eax
 004BF503    mov         edx,esi
 004BF505    mov         eax,dword ptr [ebx+280]
 004BF50B    mov         ecx,dword ptr [eax]
 004BF50D    call        dword ptr [ecx+18]
 004BF510    mov         ecx,eax
 004BF512    mov         eax,dword ptr [ebp-4]
 004BF515    pop         edx
 004BF516    mov         edi,dword ptr [eax]
 004BF518    call        dword ptr [edi+0F4]
 004BF51E    inc         esi
 004BF51F    dec         dword ptr [ebp-8]
>004BF522    jne         004BF4D0
>004BF524    jmp         004BF588
 004BF526    mov         eax,ebx
 004BF528    mov         edx,dword ptr [eax]
 004BF52A    call        dword ptr [edx+0EC]
 004BF530    inc         eax
>004BF531    je          004BF588
 004BF533    mov         eax,ebx
 004BF535    mov         edx,dword ptr [eax]
 004BF537    call        dword ptr [edx+0EC]
 004BF53D    mov         edx,eax
 004BF53F    lea         ecx,[ebp-18]
 004BF542    mov         eax,dword ptr [ebx+280]
 004BF548    mov         esi,dword ptr [eax]
 004BF54A    call        dword ptr [esi+0C]
 004BF54D    mov         eax,dword ptr [ebp-18]
 004BF550    call        @UStrToPWChar
 004BF555    mov         edx,eax
 004BF557    lea         eax,[ebp-14]
 004BF55A    call        @UStrFromPWChar
 004BF55F    mov         eax,dword ptr [ebp-14]
 004BF562    push        eax
 004BF563    mov         eax,ebx
 004BF565    mov         edx,dword ptr [eax]
 004BF567    call        dword ptr [edx+0EC]
 004BF56D    mov         edx,eax
 004BF56F    mov         eax,dword ptr [ebx+280]
 004BF575    mov         ecx,dword ptr [eax]
 004BF577    call        dword ptr [ecx+18]
 004BF57A    mov         ecx,eax
 004BF57C    mov         eax,dword ptr [ebp-4]
 004BF57F    pop         edx
 004BF580    mov         ebx,dword ptr [eax]
 004BF582    call        dword ptr [ebx+0F4]
 004BF588    xor         eax,eax
 004BF58A    pop         edx
 004BF58B    pop         ecx
 004BF58C    pop         ecx
 004BF58D    mov         dword ptr fs:[eax],edx
 004BF590    push        4BF5AA
 004BF595    lea         eax,[ebp-18]
 004BF598    mov         edx,4
 004BF59D    call        @UStrArrayClr
 004BF5A2    ret
>004BF5A3    jmp         @HandleFinally
>004BF5A8    jmp         004BF595
 004BF5AA    pop         edi
 004BF5AB    pop         esi
 004BF5AC    pop         ebx
 004BF5AD    mov         esp,ebp
 004BF5AF    pop         ebp
 004BF5B0    ret
*}
end;

//004BF5B4
procedure TCustomListBox.DeleteSelected;
begin
{*
 004BF5B4    push        ebx
 004BF5B5    push        esi
 004BF5B6    mov         esi,eax
 004BF5B8    cmp         byte ptr [esi+270],0
>004BF5BF    je          004BF5F7
 004BF5C1    mov         eax,dword ptr [esi+280]
 004BF5C7    mov         edx,dword ptr [eax]
 004BF5C9    call        dword ptr [edx+14]
 004BF5CC    mov         ebx,eax
 004BF5CE    dec         ebx
 004BF5CF    cmp         ebx,0
>004BF5D2    jl          004BF61B
 004BF5D4    mov         edx,ebx
 004BF5D6    mov         eax,esi
 004BF5D8    call        TCustomListBox.GetSelected
 004BF5DD    test        al,al
>004BF5DF    je          004BF5EE
 004BF5E1    mov         edx,ebx
 004BF5E3    mov         eax,dword ptr [esi+280]
 004BF5E9    mov         ecx,dword ptr [eax]
 004BF5EB    call        dword ptr [ecx+48]
 004BF5EE    dec         ebx
 004BF5EF    cmp         ebx,0FFFFFFFF
>004BF5F2    jne         004BF5D4
 004BF5F4    pop         esi
 004BF5F5    pop         ebx
 004BF5F6    ret
 004BF5F7    mov         eax,esi
 004BF5F9    mov         edx,dword ptr [eax]
 004BF5FB    call        dword ptr [edx+0EC]
 004BF601    inc         eax
>004BF602    je          004BF61B
 004BF604    mov         eax,esi
 004BF606    mov         edx,dword ptr [eax]
 004BF608    call        dword ptr [edx+0EC]
 004BF60E    mov         edx,eax
 004BF610    mov         eax,dword ptr [esi+280]
 004BF616    mov         ecx,dword ptr [eax]
 004BF618    call        dword ptr [ecx+48]
 004BF61B    pop         esi
 004BF61C    pop         ebx
 004BF61D    ret
*}
end;

//004BF620
procedure TCustomListBox.SetColumnWidth;
begin
{*
 004BF620    push        ebx
 004BF621    push        esi
 004BF622    push        ecx
 004BF623    mov         ebx,eax
 004BF625    cmp         dword ptr [ebx+294],0
>004BF62C    jle         004BF66F
 004BF62E    cmp         dword ptr [ebx+48],0
>004BF632    jle         004BF66F
 004BF634    mov         eax,ebx
 004BF636    call        TControl.GetClientWidth
 004BF63B    mov         dword ptr [esp],eax
 004BF63E    fild        dword ptr [esp]
 004BF641    fild        dword ptr [ebx+294]
 004BF647    fdivp       st(1),st
 004BF649    call        @TRUNC
 004BF64E    mov         esi,eax
 004BF650    cmp         esi,1
>004BF653    jge         004BF65A
 004BF655    mov         esi,1
 004BF65A    push        0
 004BF65C    push        esi
 004BF65D    push        195
 004BF662    mov         eax,ebx
 004BF664    call        TWinControl.GetHandle
 004BF669    push        eax
 004BF66A    call        user32.SendMessageW
 004BF66F    pop         edx
 004BF670    pop         esi
 004BF671    pop         ebx
 004BF672    ret
*}
end;

//004BF674
procedure TCustomListBox.SetColumns(Value:Integer);
begin
{*
 004BF674    push        ebx
 004BF675    mov         ebx,eax
 004BF677    cmp         edx,dword ptr [ebx+294]
>004BF67D    je          004BF6B3
 004BF67F    cmp         dword ptr [ebx+294],0
>004BF686    je          004BF68C
 004BF688    test        edx,edx
>004BF68A    jne         004BF69B
 004BF68C    mov         dword ptr [ebx+294],edx
 004BF692    mov         eax,ebx
 004BF694    call        TWinControl.RecreateWnd
>004BF699    jmp         004BF6B3
 004BF69B    mov         dword ptr [ebx+294],edx
 004BF6A1    mov         eax,ebx
 004BF6A3    call        TWinControl.HandleAllocated
 004BF6A8    test        al,al
>004BF6AA    je          004BF6B3
 004BF6AC    mov         eax,ebx
 004BF6AE    call        TCustomListBox.SetColumnWidth
 004BF6B3    pop         ebx
 004BF6B4    ret
*}
end;

//004BF6B8
function TCustomListBox.GetItemIndex:Integer;
begin
{*
 004BF6B8    push        ebx
 004BF6B9    push        esi
 004BF6BA    mov         ebx,eax
 004BF6BC    cmp         byte ptr [ebx+270],0
>004BF6C3    jne         004BF6DF
 004BF6C5    push        0
 004BF6C7    push        0
 004BF6C9    push        188
 004BF6CE    mov         eax,ebx
 004BF6D0    call        TWinControl.GetHandle
 004BF6D5    push        eax
 004BF6D6    call        user32.SendMessageW
 004BF6DB    mov         esi,eax
>004BF6DD    jmp         004BF708
 004BF6DF    push        0
 004BF6E1    push        0
 004BF6E3    push        19F
 004BF6E8    mov         eax,ebx
 004BF6EA    call        TWinControl.GetHandle
 004BF6EF    push        eax
 004BF6F0    call        user32.SendMessageW
 004BF6F5    mov         esi,eax
 004BF6F7    mov         eax,ebx
 004BF6F9    mov         edx,dword ptr [eax]
 004BF6FB    call        dword ptr [edx+108]
 004BF701    cmp         esi,eax
>004BF703    jl          004BF708
 004BF705    or          esi,0FFFFFFFF
 004BF708    mov         eax,esi
 004BF70A    pop         esi
 004BF70B    pop         ebx
 004BF70C    ret
*}
end;

//004BF710
function TCustomListBox.GetCount:Integer;
begin
{*
 004BF710    movzx       edx,byte ptr [eax+2A0]
 004BF717    add         dl,0FD
 004BF71A    sub         dl,2
>004BF71D    jae         004BF726
 004BF71F    mov         eax,dword ptr [eax+27C]
 004BF725    ret
 004BF726    mov         eax,dword ptr [eax+280]
 004BF72C    mov         edx,dword ptr [eax]
 004BF72E    call        dword ptr [edx+14]
 004BF731    ret
*}
end;

//004BF734
function TCustomListBox.GetSelCount:Integer;
begin
{*
 004BF734    push        ebx
 004BF735    mov         ebx,eax
 004BF737    push        0
 004BF739    push        0
 004BF73B    push        190
 004BF740    mov         eax,ebx
 004BF742    call        TWinControl.GetHandle
 004BF747    push        eax
 004BF748    call        user32.SendMessageW
 004BF74D    pop         ebx
 004BF74E    ret
*}
end;

//004BF750
procedure TCustomListBox.SetItemIndex(const Value:Integer);
begin
{*
 004BF750    push        ebx
 004BF751    push        esi
 004BF752    mov         esi,edx
 004BF754    mov         ebx,eax
 004BF756    mov         eax,ebx
 004BF758    mov         edx,dword ptr [eax]
 004BF75A    call        dword ptr [edx+0EC]
 004BF760    cmp         esi,eax
>004BF762    je          004BF799
 004BF764    cmp         byte ptr [ebx+270],0
>004BF76B    je          004BF784
 004BF76D    push        0
 004BF76F    push        esi
 004BF770    push        19E
 004BF775    mov         eax,ebx
 004BF777    call        TWinControl.GetHandle
 004BF77C    push        eax
 004BF77D    call        user32.SendMessageW
>004BF782    jmp         004BF799
 004BF784    push        0
 004BF786    push        esi
 004BF787    push        186
 004BF78C    mov         eax,ebx
 004BF78E    call        TWinControl.GetHandle
 004BF793    push        eax
 004BF794    call        user32.SendMessageW
 004BF799    pop         esi
 004BF79A    pop         ebx
 004BF79B    ret
*}
end;

//004BF79C
procedure TCustomListBox.SetExtendedSelect(Value:Boolean);
begin
{*
 004BF79C    cmp         dl,byte ptr [eax+2A3]
>004BF7A2    je          004BF7AF
 004BF7A4    mov         byte ptr [eax+2A3],dl
 004BF7AA    call        TWinControl.RecreateWnd
 004BF7AF    ret
*}
end;

//004BF7B0
procedure TCustomListBox.SetIntegralHeight(Value:Boolean);
begin
{*
 004BF7B0    push        esi
 004BF7B1    mov         esi,eax
 004BF7B3    cmp         dl,byte ptr [esi+2A1]
>004BF7B9    je          004BF7CF
 004BF7BB    mov         byte ptr [esi+2A1],dl
 004BF7C1    mov         eax,esi
 004BF7C3    call        TWinControl.RecreateWnd
 004BF7C8    mov         eax,esi
 004BF7CA    mov         edx,dword ptr [eax]
 004BF7CC    call        dword ptr [edx+68]
 004BF7CF    pop         esi
 004BF7D0    ret
*}
end;

//004BF7D4
function TCustomListBox.GetItemHeight:Integer;
begin
{*
 004BF7D4    push        ebx
 004BF7D5    push        esi
 004BF7D6    add         esp,0FFFFFFF0
 004BF7D9    mov         ebx,eax
 004BF7DB    mov         esi,dword ptr [ebx+298]
 004BF7E1    mov         eax,ebx
 004BF7E3    call        TWinControl.HandleAllocated
 004BF7E8    test        al,al
>004BF7EA    je          004BF808
 004BF7EC    cmp         byte ptr [ebx+2A0],0
>004BF7F3    jne         004BF808
 004BF7F5    mov         ecx,esp
 004BF7F7    xor         edx,edx
 004BF7F9    mov         eax,ebx
 004BF7FB    call        TCustomListBox.GetItemRect
 004BF800    mov         esi,dword ptr [esp+0C]
 004BF804    sub         esi,dword ptr [esp+4]
 004BF808    mov         eax,esi
 004BF80A    add         esp,10
 004BF80D    pop         esi
 004BF80E    pop         ebx
 004BF80F    ret
*}
end;

//004BF810
function TCustomListBox.GetItemRect(Index:Integer):TRect;
begin
{*
 004BF810    push        ecx
 004BF811    mov         ecx,198
 004BF816    xchg        ecx,edx
 004BF818    call        TControl.Perform
 004BF81D    ret
*}
end;

//004BF820
procedure TCustomListBox.SetItemHeight(Value:Integer);
begin
{*
 004BF820    cmp         edx,dword ptr [eax+298]
>004BF826    je          004BF837
 004BF828    test        edx,edx
>004BF82A    jle         004BF837
 004BF82C    mov         dword ptr [eax+298],edx
 004BF832    call        TWinControl.RecreateWnd
 004BF837    ret
*}
end;

//004BF838
procedure TCustomListBox.SetTabWidth(Value:Integer);
begin
{*
 004BF838    test        edx,edx
>004BF83A    jge         004BF83E
 004BF83C    xor         edx,edx
 004BF83E    cmp         edx,dword ptr [eax+2A4]
>004BF844    je          004BF851
 004BF846    mov         dword ptr [eax+2A4],edx
 004BF84C    call        TWinControl.RecreateWnd
 004BF851    ret
*}
end;

//004BF854
procedure TCustomListBox.SetMultiSelect(Value:Boolean);
begin
{*
 004BF854    cmp         dl,byte ptr [eax+270]
>004BF85A    je          004BF867
 004BF85C    mov         byte ptr [eax+270],dl
 004BF862    call        TWinControl.RecreateWnd
 004BF867    ret
*}
end;

//004BF868
function TCustomListBox.GetSelected(Index:Integer):Boolean;
begin
{*
 004BF868    push        ebx
 004BF869    push        esi
 004BF86A    add         esp,0FFFFFFF8
 004BF86D    mov         esi,edx
 004BF86F    mov         ebx,eax
 004BF871    push        0
 004BF873    push        esi
 004BF874    push        187
 004BF879    mov         eax,ebx
 004BF87B    call        TWinControl.GetHandle
 004BF880    push        eax
 004BF881    call        user32.SendMessageW
 004BF886    cmp         eax,0FFFFFFFF
>004BF889    jne         004BF8AD
 004BF88B    mov         dword ptr [esp],esi
 004BF88E    mov         byte ptr [esp+4],0
 004BF893    push        esp
 004BF894    push        0
 004BF896    mov         ecx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 004BF89C    mov         dl,1
 004BF89E    mov         eax,[00438EC0];EListError
 004BF8A3    call        Exception.CreateResFmt
 004BF8A8    call        @RaiseExcept
 004BF8AD    cmp         eax,1
 004BF8B0    sbb         eax,eax
 004BF8B2    inc         eax
 004BF8B3    pop         ecx
 004BF8B4    pop         edx
 004BF8B5    pop         esi
 004BF8B6    pop         ebx
 004BF8B7    ret
*}
end;

//004BF8B8
procedure TCustomListBox.SetSelected(Index:Integer; Value:Boolean);
begin
{*
 004BF8B8    push        ebx
 004BF8B9    push        esi
 004BF8BA    push        edi
 004BF8BB    add         esp,0FFFFFFF8
 004BF8BE    mov         ebx,ecx
 004BF8C0    mov         esi,edx
 004BF8C2    mov         edi,eax
 004BF8C4    cmp         byte ptr [edi+270],0
>004BF8CB    je          004BF90B
 004BF8CD    push        esi
 004BF8CE    movzx       eax,bl
 004BF8D1    push        eax
 004BF8D2    push        185
 004BF8D7    mov         eax,edi
 004BF8D9    call        TWinControl.GetHandle
 004BF8DE    push        eax
 004BF8DF    call        user32.SendMessageW
 004BF8E4    inc         eax
>004BF8E5    jne         004BF961
 004BF8E7    mov         dword ptr [esp],esi
 004BF8EA    mov         byte ptr [esp+4],0
 004BF8EF    push        esp
 004BF8F0    push        0
 004BF8F2    mov         ecx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 004BF8F8    mov         dl,1
 004BF8FA    mov         eax,[00438EC0];EListError
 004BF8FF    call        Exception.CreateResFmt
 004BF904    call        @RaiseExcept
>004BF909    jmp         004BF961
 004BF90B    test        bl,bl
>004BF90D    je          004BF94B
 004BF90F    push        0
 004BF911    push        esi
 004BF912    push        186
 004BF917    mov         eax,edi
 004BF919    call        TWinControl.GetHandle
 004BF91E    push        eax
 004BF91F    call        user32.SendMessageW
 004BF924    inc         eax
>004BF925    jne         004BF961
 004BF927    mov         dword ptr [esp],esi
 004BF92A    mov         byte ptr [esp+4],0
 004BF92F    push        esp
 004BF930    push        0
 004BF932    mov         ecx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 004BF938    mov         dl,1
 004BF93A    mov         eax,[00438EC0];EListError
 004BF93F    call        Exception.CreateResFmt
 004BF944    call        @RaiseExcept
>004BF949    jmp         004BF961
 004BF94B    push        0
 004BF94D    push        0FF
 004BF94F    push        186
 004BF954    mov         eax,edi
 004BF956    call        TWinControl.GetHandle
 004BF95B    push        eax
 004BF95C    call        user32.SendMessageW
 004BF961    pop         ecx
 004BF962    pop         edx
 004BF963    pop         edi
 004BF964    pop         esi
 004BF965    pop         ebx
 004BF966    ret
*}
end;

//004BF968
procedure TCustomListBox.SetSorted(Value:Boolean);
begin
{*
 004BF968    movzx       ecx,byte ptr [eax+2A0]
 004BF96F    add         cl,0FD
 004BF972    sub         cl,2
>004BF975    jb          004BF98A
 004BF977    cmp         dl,byte ptr [eax+2A2]
>004BF97D    je          004BF98A
 004BF97F    mov         byte ptr [eax+2A2],dl
 004BF985    call        TWinControl.RecreateWnd
 004BF98A    ret
*}
end;

//004BF98C
procedure TCustomListBox.SetStyle(Value:TListBoxStyle);
begin
{*
 004BF98C    push        ebx
 004BF98D    push        esi
 004BF98E    mov         ebx,edx
 004BF990    mov         esi,eax
 004BF992    cmp         bl,byte ptr [esi+2A0]
>004BF998    je          004BF9C3
 004BF99A    mov         eax,ebx
 004BF99C    add         al,0FD
 004BF99E    sub         al,2
>004BF9A0    jae         004BF9B6
 004BF9A2    mov         eax,dword ptr [esi+280]
 004BF9A8    mov         edx,dword ptr [eax]
 004BF9AA    call        dword ptr [edx+44]
 004BF9AD    xor         edx,edx
 004BF9AF    mov         eax,esi
 004BF9B1    call        TCustomListBox.SetSorted
 004BF9B6    mov         byte ptr [esi+2A0],bl
 004BF9BC    mov         eax,esi
 004BF9BE    call        TWinControl.RecreateWnd
 004BF9C3    pop         esi
 004BF9C4    pop         ebx
 004BF9C5    ret
*}
end;

//004BF9C8
function TCustomListBox.GetTopIndex:Integer;
begin
{*
 004BF9C8    push        ebx
 004BF9C9    mov         ebx,eax
 004BF9CB    push        0
 004BF9CD    push        0
 004BF9CF    push        18E
 004BF9D4    mov         eax,ebx
 004BF9D6    call        TWinControl.GetHandle
 004BF9DB    push        eax
 004BF9DC    call        user32.SendMessageW
 004BF9E1    pop         ebx
 004BF9E2    ret
*}
end;

//004BF9E4
procedure TCustomListBox.LBGetText(var Message:TMessage);
begin
{*
 004BF9E4    push        ebp
 004BF9E5    mov         ebp,esp
 004BF9E7    push        0
 004BF9E9    push        ebx
 004BF9EA    push        esi
 004BF9EB    mov         esi,edx
 004BF9ED    mov         ebx,eax
 004BF9EF    xor         eax,eax
 004BF9F1    push        ebp
 004BF9F2    push        4BFA91
 004BF9F7    push        dword ptr fs:[eax]
 004BF9FA    mov         dword ptr fs:[eax],esp
 004BF9FD    movzx       eax,byte ptr [ebx+2A0]
 004BFA04    add         al,0FD
 004BFA06    sub         al,2
>004BFA08    jae         004BFA72
 004BFA0A    cmp         word ptr [ebx+2D2],0
>004BFA12    je          004BFA69
 004BFA14    cmp         dword ptr [esi+4],0FFFFFFFF
>004BFA18    jle         004BFA69
 004BFA1A    mov         eax,ebx
 004BFA1C    mov         edx,dword ptr [eax]
 004BFA1E    call        dword ptr [edx+108]
 004BFA24    cmp         eax,dword ptr [esi+4]
>004BFA27    jle         004BFA69
 004BFA29    lea         eax,[ebp-4]
 004BFA2C    call        @UStrClr
 004BFA31    lea         eax,[ebp-4]
 004BFA34    push        eax
 004BFA35    mov         ecx,dword ptr [esi+4]
 004BFA38    mov         edx,ebx
 004BFA3A    mov         eax,dword ptr [ebx+2D4]
 004BFA40    call        dword ptr [ebx+2D0]
 004BFA46    mov         eax,dword ptr [ebp-4]
 004BFA49    call        @UStrToPWChar
 004BFA4E    mov         edx,eax
 004BFA50    mov         eax,dword ptr [esi+8]
 004BFA53    call        StrCopy
 004BFA58    mov         eax,dword ptr [ebp-4]
 004BFA5B    test        eax,eax
>004BFA5D    je          004BFA64
 004BFA5F    sub         eax,4
 004BFA62    mov         eax,dword ptr [eax]
 004BFA64    mov         dword ptr [esi+0C],eax
>004BFA67    jmp         004BFA7B
 004BFA69    mov         dword ptr [esi+0C],0FFFFFFFF
>004BFA70    jmp         004BFA7B
 004BFA72    mov         edx,esi
 004BFA74    mov         eax,ebx
 004BFA76    mov         ecx,dword ptr [eax]
 004BFA78    call        dword ptr [ecx-10]
 004BFA7B    xor         eax,eax
 004BFA7D    pop         edx
 004BFA7E    pop         ecx
 004BFA7F    pop         ecx
 004BFA80    mov         dword ptr fs:[eax],edx
 004BFA83    push        4BFA98
 004BFA88    lea         eax,[ebp-4]
 004BFA8B    call        @UStrClr
 004BFA90    ret
>004BFA91    jmp         @HandleFinally
>004BFA96    jmp         004BFA88
 004BFA98    pop         esi
 004BFA99    pop         ebx
 004BFA9A    pop         ecx
 004BFA9B    pop         ebp
 004BFA9C    ret
*}
end;

//004BFAA0
procedure TCustomListBox.LBGetTextLen(var Message:TMessage);
begin
{*
 004BFAA0    push        ebp
 004BFAA1    mov         ebp,esp
 004BFAA3    push        0
 004BFAA5    push        ebx
 004BFAA6    push        esi
 004BFAA7    mov         esi,edx
 004BFAA9    mov         ebx,eax
 004BFAAB    xor         eax,eax
 004BFAAD    push        ebp
 004BFAAE    push        4BFB3B
 004BFAB3    push        dword ptr fs:[eax]
 004BFAB6    mov         dword ptr fs:[eax],esp
 004BFAB9    movzx       eax,byte ptr [ebx+2A0]
 004BFAC0    add         al,0FD
 004BFAC2    sub         al,2
>004BFAC4    jae         004BFB1C
 004BFAC6    cmp         word ptr [ebx+2D2],0
>004BFACE    je          004BFB13
 004BFAD0    cmp         dword ptr [esi+4],0FFFFFFFF
>004BFAD4    jle         004BFB13
 004BFAD6    mov         eax,ebx
 004BFAD8    mov         edx,dword ptr [eax]
 004BFADA    call        dword ptr [edx+108]
 004BFAE0    cmp         eax,dword ptr [esi+4]
>004BFAE3    jle         004BFB13
 004BFAE5    lea         eax,[ebp-4]
 004BFAE8    call        @UStrClr
 004BFAED    lea         eax,[ebp-4]
 004BFAF0    push        eax
 004BFAF1    mov         ecx,dword ptr [esi+4]
 004BFAF4    mov         edx,ebx
 004BFAF6    mov         eax,dword ptr [ebx+2D4]
 004BFAFC    call        dword ptr [ebx+2D0]
 004BFB02    mov         eax,dword ptr [ebp-4]
 004BFB05    test        eax,eax
>004BFB07    je          004BFB0E
 004BFB09    sub         eax,4
 004BFB0C    mov         eax,dword ptr [eax]
 004BFB0E    mov         dword ptr [esi+0C],eax
>004BFB11    jmp         004BFB25
 004BFB13    mov         dword ptr [esi+0C],0FFFFFFFF
>004BFB1A    jmp         004BFB25
 004BFB1C    mov         edx,esi
 004BFB1E    mov         eax,ebx
 004BFB20    mov         ecx,dword ptr [eax]
 004BFB22    call        dword ptr [ecx-10]
 004BFB25    xor         eax,eax
 004BFB27    pop         edx
 004BFB28    pop         ecx
 004BFB29    pop         ecx
 004BFB2A    mov         dword ptr fs:[eax],edx
 004BFB2D    push        4BFB42
 004BFB32    lea         eax,[ebp-4]
 004BFB35    call        @UStrClr
 004BFB3A    ret
>004BFB3B    jmp         @HandleFinally
>004BFB40    jmp         004BFB32
 004BFB42    pop         esi
 004BFB43    pop         ebx
 004BFB44    pop         ecx
 004BFB45    pop         ebp
 004BFB46    ret
*}
end;

//004BFB48
procedure TCustomListBox.SetBorderStyle(Value:TBorderStyle);
begin
{*
 004BFB48    cmp         dl,byte ptr [eax+28C]
>004BFB4E    je          004BFB5B
 004BFB50    mov         byte ptr [eax+28C],dl
 004BFB56    call        TWinControl.RecreateWnd
 004BFB5B    ret
*}
end;

//004BFB5C
procedure TCustomListBox.SetTopIndex(Value:Integer);
begin
{*
 004BFB5C    push        ebx
 004BFB5D    push        esi
 004BFB5E    mov         esi,edx
 004BFB60    mov         ebx,eax
 004BFB62    mov         eax,ebx
 004BFB64    call        TCustomListBox.GetTopIndex
 004BFB69    cmp         esi,eax
>004BFB6B    je          004BFB82
 004BFB6D    push        0
 004BFB6F    push        esi
 004BFB70    push        197
 004BFB75    mov         eax,ebx
 004BFB77    call        TWinControl.GetHandle
 004BFB7C    push        eax
 004BFB7D    call        user32.SendMessageW
 004BFB82    pop         esi
 004BFB83    pop         ebx
 004BFB84    ret
*}
end;

//004BFB88
procedure TCustomListBox.SetItems(Value:TStrings);
begin
{*
 004BFB88    push        esi
 004BFB89    push        edi
 004BFB8A    mov         edi,edx
 004BFB8C    mov         esi,eax
 004BFB8E    movzx       eax,byte ptr [esi+2A0]
 004BFB95    mov         edx,eax
 004BFB97    add         dl,0FD
 004BFB9A    sub         dl,2
>004BFB9D    jae         004BFBBD
 004BFB9F    sub         al,3
>004BFBA1    je          004BFBA9
 004BFBA3    dec         al
>004BFBA5    je          004BFBB4
>004BFBA7    jmp         004BFBBD
 004BFBA9    xor         edx,edx
 004BFBAB    mov         eax,esi
 004BFBAD    call        TCustomListBox.SetStyle
>004BFBB2    jmp         004BFBBD
 004BFBB4    mov         dl,1
 004BFBB6    mov         eax,esi
 004BFBB8    call        TCustomListBox.SetStyle
 004BFBBD    mov         edx,edi
 004BFBBF    mov         eax,dword ptr [esi+280]
 004BFBC5    mov         ecx,dword ptr [eax]
 004BFBC7    call        dword ptr [ecx+8]
 004BFBCA    pop         edi
 004BFBCB    pop         esi
 004BFBCC    ret
*}
end;

//004BFBD0
function TCustomListBox.ItemAtPos(Pos:TPoint; Existing:Boolean):Integer;
begin
{*
 004BFBD0    push        ebx
 004BFBD1    push        esi
 004BFBD2    push        edi
 004BFBD3    push        ebp
 004BFBD4    add         esp,0FFFFFFD8
 004BFBD7    mov         esi,edx
 004BFBD9    lea         edi,[esp]
 004BFBDC    movs        dword ptr [edi],dword ptr [esi]
 004BFBDD    movs        dword ptr [edi],dword ptr [esi]
 004BFBDE    mov         ebx,ecx
 004BFBE0    mov         esi,eax
 004BFBE2    push        dword ptr [esp+4]
 004BFBE6    push        dword ptr [esp+4]
 004BFBEA    lea         edx,[esp+20]
 004BFBEE    mov         eax,esi
 004BFBF0    mov         ecx,dword ptr [eax]
 004BFBF2    call        dword ptr [ecx+54]
 004BFBF5    lea         eax,[esp+20]
 004BFBF9    push        eax
 004BFBFA    call        user32.PtInRect
 004BFBFF    test        eax,eax
>004BFC01    je          004BFC49
 004BFC03    mov         eax,esi
 004BFC05    call        TCustomListBox.GetTopIndex
 004BFC0A    mov         ebp,eax
 004BFC0C    mov         eax,dword ptr [esi+280]
 004BFC12    mov         edx,dword ptr [eax]
 004BFC14    call        dword ptr [edx+14]
 004BFC17    mov         edi,eax
 004BFC19    cmp         edi,ebp
>004BFC1B    jle         004BFC45
 004BFC1D    lea         ecx,[esp+8]
 004BFC21    mov         edx,ebp
 004BFC23    mov         eax,esi
 004BFC25    call        TCustomListBox.GetItemRect
 004BFC2A    push        dword ptr [esp+4]
 004BFC2E    push        dword ptr [esp+4]
 004BFC32    lea         eax,[esp+10]
 004BFC36    push        eax
 004BFC37    call        user32.PtInRect
 004BFC3C    test        eax,eax
>004BFC3E    jne         004BFC4C
 004BFC40    inc         ebp
 004BFC41    cmp         edi,ebp
>004BFC43    jg          004BFC1D
 004BFC45    test        bl,bl
>004BFC47    je          004BFC4C
 004BFC49    or          ebp,0FFFFFFFF
 004BFC4C    mov         eax,ebp
 004BFC4E    add         esp,28
 004BFC51    pop         ebp
 004BFC52    pop         edi
 004BFC53    pop         esi
 004BFC54    pop         ebx
 004BFC55    ret
*}
end;

//004BFC58
function TCustomListBox.ItemRect(Index:Integer):TRect;
begin
{*
 004BFC58    push        ebx
 004BFC59    push        esi
 004BFC5A    push        edi
 004BFC5B    mov         edi,ecx
 004BFC5D    mov         ebx,edx
 004BFC5F    mov         esi,eax
 004BFC61    mov         eax,dword ptr [esi+280]
 004BFC67    mov         edx,dword ptr [eax]
 004BFC69    call        dword ptr [edx+14]
 004BFC6C    test        ebx,ebx
>004BFC6E    je          004BFC74
 004BFC70    cmp         eax,ebx
>004BFC72    jle         004BFC81
 004BFC74    mov         ecx,edi
 004BFC76    mov         edx,ebx
 004BFC78    mov         eax,esi
 004BFC7A    call        TCustomListBox.GetItemRect
>004BFC7F    jmp         004BFCB0
 004BFC81    cmp         eax,ebx
>004BFC83    jne         004BFCA2
 004BFC85    mov         ecx,edi
 004BFC87    mov         edx,ebx
 004BFC89    dec         edx
 004BFC8A    mov         eax,esi
 004BFC8C    call        TCustomListBox.GetItemRect
 004BFC91    mov         eax,dword ptr [edi+0C]
 004BFC94    sub         eax,dword ptr [edi+4]
 004BFC97    push        eax
 004BFC98    push        0
 004BFC9A    push        edi
 004BFC9B    call        user32.OffsetRect
>004BFCA0    jmp         004BFCB0
 004BFCA2    push        0
 004BFCA4    push        edi
 004BFCA5    xor         ecx,ecx
 004BFCA7    xor         edx,edx
 004BFCA9    xor         eax,eax
 004BFCAB    call        Rect
 004BFCB0    pop         edi
 004BFCB1    pop         esi
 004BFCB2    pop         ebx
 004BFCB3    ret
*}
end;

//004BFCB4
procedure TCustomListBox.CreateParams(var Params:TCreateParams);
begin
{*
 004BFCB4    push        ebx
 004BFCB5    push        esi
 004BFCB6    push        edi
 004BFCB7    mov         edi,edx
 004BFCB9    mov         ebx,eax
 004BFCBB    mov         edx,edi
 004BFCBD    mov         eax,ebx
 004BFCBF    call        TWinControl.CreateParams
 004BFCC4    mov         ecx,4BFDD0
 004BFCC9    mov         edx,edi
 004BFCCB    mov         eax,ebx
 004BFCCD    call        TWinControl.CreateSubClass
 004BFCD2    cmp         byte ptr [ebx+2A3],0
>004BFCD9    je          004BFCEB
 004BFCDB    movzx       eax,byte ptr [ebx+270]
 004BFCE2    mov         esi,dword ptr [eax*4+785EF0]
>004BFCE9    jmp         004BFCF9
 004BFCEB    movzx       eax,byte ptr [ebx+270]
 004BFCF2    mov         esi,dword ptr [eax*4+785EE8]
 004BFCF9    movzx       eax,byte ptr [ebx+2A0]
 004BFD00    mov         edx,eax
 004BFD02    add         dl,0FD
 004BFD05    sub         dl,2
 004BFD08    setb        dl
 004BFD0B    and         edx,7F
 004BFD0E    mov         edx,dword ptr [edx*4+785F18]
 004BFD15    or          edx,300000
 004BFD1B    or          edx,1
 004BFD1E    or          edx,dword ptr [edi+4]
 004BFD21    and         eax,7F
 004BFD24    or          edx,dword ptr [eax*4+785ECC]
 004BFD2B    movzx       eax,byte ptr [ebx+2A2]
 004BFD32    or          edx,dword ptr [eax*4+785EE0]
 004BFD39    or          esi,edx
 004BFD3B    movzx       eax,byte ptr [ebx+2A1]
 004BFD42    or          esi,dword ptr [eax*4+785EF8]
 004BFD49    cmp         dword ptr [ebx+294],0
 004BFD50    setne       al
 004BFD53    and         eax,7F
 004BFD56    or          esi,dword ptr [eax*4+785F00]
 004BFD5D    movzx       eax,byte ptr [ebx+28C]
 004BFD64    or          esi,dword ptr [eax*4+785D74]
 004BFD6B    cmp         dword ptr [ebx+2A4],0
 004BFD72    setne       al
 004BFD75    and         eax,7F
 004BFD78    or          esi,dword ptr [eax*4+785F08]
 004BFD7F    mov         dword ptr [edi+4],esi
 004BFD82    mov         eax,[0078D264];^NewStyleControls:Boolean
 004BFD87    cmp         byte ptr [eax],0
>004BFD8A    je          004BFDAC
 004BFD8C    cmp         byte ptr [ebx+1E9],0
>004BFD93    je          004BFDAC
 004BFD95    cmp         byte ptr [ebx+28C],1
>004BFD9C    jne         004BFDAC
 004BFD9E    and         dword ptr [edi+4],0FF7FFFFF
 004BFDA5    or          dword ptr [edi+8],200
 004BFDAC    mov         eax,ebx
 004BFDAE    mov         si,0FFC7
 004BFDB2    call        @CallDynaInst
 004BFDB7    and         eax,7F
 004BFDBA    mov         eax,dword ptr [eax*4+785F10]
 004BFDC1    or          eax,1
 004BFDC4    not         eax
 004BFDC6    and         dword ptr [edi+24],eax
 004BFDC9    pop         edi
 004BFDCA    pop         esi
 004BFDCB    pop         ebx
 004BFDCC    ret
*}
end;

//004BFDE0
procedure TCustomListBox.CreateWnd;
begin
{*
 004BFDE0    push        ebx
 004BFDE1    push        esi
 004BFDE2    push        edi
 004BFDE3    mov         ebx,eax
 004BFDE5    mov         esi,dword ptr [ebx+48]
 004BFDE8    mov         edi,dword ptr [ebx+4C]
 004BFDEB    mov         eax,ebx
 004BFDED    call        TWinControl.CreateWnd
 004BFDF2    push        14
 004BFDF4    push        edi
 004BFDF5    push        esi
 004BFDF6    mov         eax,dword ptr [ebx+44]
 004BFDF9    push        eax
 004BFDFA    mov         eax,dword ptr [ebx+40]
 004BFDFD    push        eax
 004BFDFE    push        0
 004BFE00    mov         eax,ebx
 004BFE02    call        TWinControl.GetHandle
 004BFE07    push        eax
 004BFE08    call        user32.SetWindowPos
 004BFE0D    cmp         dword ptr [ebx+2A4],0
>004BFE14    je          004BFE31
 004BFE16    lea         eax,[ebx+2A4]
 004BFE1C    push        eax
 004BFE1D    push        1
 004BFE1F    push        192
 004BFE24    mov         eax,ebx
 004BFE26    call        TWinControl.GetHandle
 004BFE2B    push        eax
 004BFE2C    call        user32.SendMessageW
 004BFE31    mov         eax,ebx
 004BFE33    call        TCustomListBox.SetColumnWidth
 004BFE38    mov         eax,dword ptr [ebx+2B4]
 004BFE3E    test        eax,eax
>004BFE40    je          004BFE4B
 004BFE42    mov         edx,eax
 004BFE44    mov         eax,ebx
 004BFE46    call        TCustomListBox.SetScrollWidth
 004BFE4B    mov         eax,dword ptr [ebx+29C]
 004BFE51    cmp         eax,0FFFFFFFF
>004BFE54    jne         004BFE63
 004BFE56    cmp         dword ptr [ebx+2A8],0
>004BFE5D    je          004BFF37
 004BFE63    movzx       edx,byte ptr [ebx+2A0]
 004BFE6A    add         dl,0FD
 004BFE6D    sub         dl,2
>004BFE70    jae         004BFE7B
 004BFE72    mov         edx,eax
 004BFE74    mov         eax,ebx
 004BFE76    call        TCustomListBox.SetCount
 004BFE7B    mov         eax,dword ptr [ebx+2A8]
 004BFE81    test        eax,eax
>004BFE83    je          004BFEA4
 004BFE85    mov         edx,eax
 004BFE87    mov         eax,ebx
 004BFE89    mov         ecx,dword ptr [eax]
 004BFE8B    call        dword ptr [ecx+124]
 004BFE91    lea         eax,[ebx+2A8]
 004BFE97    mov         edx,dword ptr [eax]
 004BFE99    xor         ecx,ecx
 004BFE9B    mov         dword ptr [eax],ecx
 004BFE9D    mov         eax,edx
 004BFE9F    call        TObject.Free
 004BFEA4    mov         edx,dword ptr [ebx+2AC]
 004BFEAA    mov         eax,ebx
 004BFEAC    call        TCustomListBox.SetTopIndex
 004BFEB1    mov         edx,dword ptr [ebx+2B0]
 004BFEB7    mov         eax,ebx
 004BFEB9    mov         ecx,dword ptr [eax]
 004BFEBB    call        dword ptr [ecx+0F0]
 004BFEC1    cmp         byte ptr [ebx+270],0
>004BFEC8    je          004BFF12
 004BFECA    mov         eax,dword ptr [ebx+280]
 004BFED0    mov         edx,dword ptr [eax]
 004BFED2    call        dword ptr [edx+14]
 004BFED5    mov         esi,eax
 004BFED7    mov         eax,dword ptr [ebx+2B8]
 004BFEDD    call        @DynArrayLength
 004BFEE2    cmp         esi,eax
>004BFEE4    jne         004BFF12
 004BFEE6    mov         eax,dword ptr [ebx+280]
 004BFEEC    mov         edx,dword ptr [eax]
 004BFEEE    call        dword ptr [edx+14]
 004BFEF1    mov         edi,eax
 004BFEF3    dec         edi
 004BFEF4    test        edi,edi
>004BFEF6    jl          004BFF12
 004BFEF8    inc         edi
 004BFEF9    xor         esi,esi
 004BFEFB    mov         eax,dword ptr [ebx+2B8]
 004BFF01    movzx       ecx,byte ptr [eax+esi]
 004BFF05    mov         edx,esi
 004BFF07    mov         eax,ebx
 004BFF09    call        TCustomListBox.SetSelected
 004BFF0E    inc         esi
 004BFF0F    dec         edi
>004BFF10    jne         004BFEFB
 004BFF12    push        0
 004BFF14    lea         eax,[ebx+2B8]
 004BFF1A    mov         ecx,1
 004BFF1F    mov         edx,dword ptr ds:[4B5EEC];:TCustomListBox.:1
 004BFF25    call        @DynArraySetLength
 004BFF2A    add         esp,4
 004BFF2D    mov         dword ptr [ebx+29C],0FFFFFFFF
 004BFF37    pop         edi
 004BFF38    pop         esi
 004BFF39    pop         ebx
 004BFF3A    ret
*}
end;

//004BFF3C
procedure TCustomListBox.DestroyWnd;
begin
{*
 004BFF3C    push        ebx
 004BFF3D    push        esi
 004BFF3E    push        edi
 004BFF3F    mov         ebx,eax
 004BFF41    test        byte ptr [ebx+55],20
>004BFF45    je          004C0021
 004BFF4B    mov         eax,ebx
 004BFF4D    call        TCustomListBox.GetScrollWidth
 004BFF52    mov         dword ptr [ebx+2B4],eax
 004BFF58    mov         eax,dword ptr [ebx+280]
 004BFF5E    mov         edx,dword ptr [eax]
 004BFF60    call        dword ptr [edx+14]
 004BFF63    test        eax,eax
>004BFF65    jle         004C0021
 004BFF6B    movzx       eax,byte ptr [ebx+2A0]
 004BFF72    add         al,0FD
 004BFF74    sub         al,2
>004BFF76    jae         004BFF8B
 004BFF78    mov         eax,dword ptr [ebx+280]
 004BFF7E    mov         edx,dword ptr [eax]
 004BFF80    call        dword ptr [edx+14]
 004BFF83    mov         dword ptr [ebx+29C],eax
>004BFF89    jmp         004C0004
 004BFF8B    mov         dl,1
 004BFF8D    mov         eax,[0043C7BC];TStringList
 004BFF92    call        TStringList.Create
 004BFF97    mov         esi,eax
 004BFF99    mov         dword ptr [ebx+2A8],esi
 004BFF9F    mov         edx,esi
 004BFFA1    mov         eax,ebx
 004BFFA3    mov         ecx,dword ptr [eax]
 004BFFA5    call        dword ptr [ecx+128]
 004BFFAB    cmp         byte ptr [ebx+270],0
>004BFFB2    je          004C0004
 004BFFB4    mov         eax,dword ptr [ebx+280]
 004BFFBA    mov         edx,dword ptr [eax]
 004BFFBC    call        dword ptr [edx+14]
 004BFFBF    push        eax
 004BFFC0    lea         eax,[ebx+2B8]
 004BFFC6    mov         ecx,1
 004BFFCB    mov         edx,dword ptr ds:[4B5EEC];:TCustomListBox.:1
 004BFFD1    call        @DynArraySetLength
 004BFFD6    add         esp,4
 004BFFD9    mov         eax,dword ptr [ebx+280]
 004BFFDF    mov         edx,dword ptr [eax]
 004BFFE1    call        dword ptr [edx+14]
 004BFFE4    mov         edi,eax
 004BFFE6    dec         edi
 004BFFE7    test        edi,edi
>004BFFE9    jl          004C0004
 004BFFEB    inc         edi
 004BFFEC    xor         esi,esi
 004BFFEE    mov         edx,esi
 004BFFF0    mov         eax,ebx
 004BFFF2    call        TCustomListBox.GetSelected
 004BFFF7    mov         edx,dword ptr [ebx+2B8]
 004BFFFD    mov         byte ptr [edx+esi],al
 004C0000    inc         esi
 004C0001    dec         edi
>004C0002    jne         004BFFEE
 004C0004    mov         eax,ebx
 004C0006    call        TCustomListBox.GetTopIndex
 004C000B    mov         dword ptr [ebx+2AC],eax
 004C0011    mov         eax,ebx
 004C0013    mov         edx,dword ptr [eax]
 004C0015    call        dword ptr [edx+0EC]
 004C001B    mov         dword ptr [ebx+2B0],eax
 004C0021    mov         eax,ebx
 004C0023    call        TWinControl.DestroyWnd
 004C0028    pop         edi
 004C0029    pop         esi
 004C002A    pop         ebx
 004C002B    ret
*}
end;

//004C002C
procedure TCustomListBox.WndProc(var Message:TMessage);
begin
{*
 004C002C    push        ebp
 004C002D    mov         ebp,esp
 004C002F    add         esp,0FFFFFFE4
 004C0032    push        ebx
 004C0033    mov         dword ptr [ebp-8],edx
 004C0036    mov         dword ptr [ebp-4],eax
 004C0039    mov         eax,dword ptr [ebp-4]
 004C003C    test        byte ptr [eax+1C],10
>004C0040    jne         004C00A7
 004C0042    mov         ebx,dword ptr [ebp-8]
 004C0045    mov         ebx,dword ptr [ebx]
 004C0047    cmp         ebx,201
>004C004D    je          004C005A
 004C004F    mov         eax,dword ptr [ebp-8]
 004C0052    cmp         ebx,203
>004C0058    jne         004C00A7
 004C005A    mov         eax,dword ptr [ebp-4]
 004C005D    call        TControl.Dragging
 004C0062    test        al,al
>004C0064    jne         004C00A7
 004C0066    mov         eax,dword ptr [ebp-4]
 004C0069    call        TControl.GetDragMode
 004C006E    cmp         al,1
>004C0070    jne         004C00A7
 004C0072    mov         edx,dword ptr [ebp-8]
 004C0075    mov         eax,dword ptr [ebp-4]
 004C0078    call        TWinControl.IsControlMouseMsg
 004C007D    test        al,al
>004C007F    jne         004C0212
 004C0085    mov         eax,dword ptr [ebp-4]
 004C0088    mov         eax,dword ptr [eax+54]
 004C008B    or          eax,dword ptr ds:[4C0218]
 004C0091    mov         edx,dword ptr [ebp-4]
 004C0094    mov         dword ptr [edx+54],eax
 004C0097    mov         edx,dword ptr [ebp-8]
 004C009A    mov         eax,dword ptr [ebp-4]
 004C009D    mov         ecx,dword ptr [eax]
 004C009F    call        dword ptr [ecx-14]
>004C00A2    jmp         004C0212
 004C00A7    mov         eax,dword ptr [ebp-8]
 004C00AA    mov         eax,dword ptr [eax]
 004C00AC    sub         eax,114
>004C00B1    je          004C0175
 004C00B7    sub         eax,0AEF9
>004C00BC    je          004C00CF
 004C00BE    sub         eax,40
>004C00C1    je          004C0139
 004C00C3    sub         eax,0CE7
>004C00C8    je          004C00F6
>004C00CA    jmp         004C0207
 004C00CF    mov         eax,dword ptr [ebp-4]
 004C00D2    call        TWinControl.HandleAllocated
 004C00D7    test        al,al
>004C00D9    je          004C0207
 004C00DF    push        0FF
 004C00E1    push        0
 004C00E3    mov         eax,dword ptr [ebp-4]
 004C00E6    call        TWinControl.GetHandle
 004C00EB    push        eax
 004C00EC    call        user32.InvalidateRect
>004C00F1    jmp         004C0207
 004C00F6    mov         eax,dword ptr [ebp-4]
 004C00F9    test        byte ptr [eax+55],80
>004C00FD    je          004C0207
 004C0103    mov         eax,dword ptr [ebp-4]
 004C0106    cmp         byte ptr [eax+2EC],0
>004C010D    jne         004C0207
 004C0113    mov         eax,dword ptr [ebp-4]
 004C0116    mov         byte ptr [eax+2EC],1
 004C011D    push        0
 004C011F    push        0
 004C0121    push        0B04D
 004C0126    mov         eax,dword ptr [ebp-4]
 004C0129    call        TWinControl.GetHandle
 004C012E    push        eax
 004C012F    call        user32.PostMessageW
>004C0134    jmp         004C0207
 004C0139    mov         eax,dword ptr [ebp-4]
 004C013C    cmp         byte ptr [eax+2EC],0
>004C0143    je          004C0207
 004C0149    lea         edx,[ebp-1C]
 004C014C    mov         eax,dword ptr [ebp-4]
 004C014F    mov         ecx,dword ptr [eax]
 004C0151    call        dword ptr [ecx+54]
 004C0154    lea         eax,[ebp-1C]
 004C0157    push        eax
 004C0158    mov         eax,dword ptr [ebp-4]
 004C015B    call        TWinControl.GetHandle
 004C0160    pop         edx
 004C0161    call        PerformBufferedPrintClient
 004C0166    mov         eax,dword ptr [ebp-4]
 004C0169    mov         byte ptr [eax+2EC],0
>004C0170    jmp         004C0207
 004C0175    mov         edx,dword ptr [ebp-8]
 004C0178    mov         eax,dword ptr [ebp-4]
 004C017B    call        TWinControl.WndProc
 004C0180    mov         edx,dword ptr [ebp-4]
 004C0183    cmp         byte ptr [edx+260],0
>004C018A    je          004C0207
 004C018C    mov         eax,dword ptr [ebp-8]
 004C018F    movzx       eax,word ptr [eax+4]
 004C0193    mov         edx,eax
 004C0195    and         dx,5
 004C0199    cmp         dx,5
>004C019D    je          004C01B3
 004C019F    mov         edx,dword ptr [ebp-8]
 004C01A2    test        al,0
>004C01A4    je          004C01B3
 004C01A6    mov         edx,dword ptr [ebp-8]
 004C01A9    and         ax,1
 004C01AD    cmp         ax,1
>004C01B1    jne         004C0207
 004C01B3    mov         eax,dword ptr [ebp-4]
 004C01B6    call        TWinControl.GetHandle
 004C01BB    push        eax
 004C01BC    call        user32.GetDC
 004C01C1    mov         dword ptr [ebp-0C],eax
 004C01C4    xor         eax,eax
 004C01C6    push        ebp
 004C01C7    push        4C0200
 004C01CC    push        dword ptr fs:[eax]
 004C01CF    mov         dword ptr fs:[eax],esp
 004C01D2    mov         edx,dword ptr [ebp-0C]
 004C01D5    mov         eax,dword ptr [ebp-4]
 004C01D8    mov         ecx,dword ptr [eax]
 004C01DA    call        dword ptr [ecx+0D4]
 004C01E0    xor         eax,eax
 004C01E2    pop         edx
 004C01E3    pop         ecx
 004C01E4    pop         ecx
 004C01E5    mov         dword ptr fs:[eax],edx
 004C01E8    push        4C0207
 004C01ED    mov         eax,dword ptr [ebp-0C]
 004C01F0    push        eax
 004C01F1    mov         eax,dword ptr [ebp-4]
 004C01F4    call        TWinControl.GetHandle
 004C01F9    push        eax
 004C01FA    call        user32.ReleaseDC
 004C01FF    ret
>004C0200    jmp         @HandleFinally
>004C0205    jmp         004C01ED
 004C0207    mov         edx,dword ptr [ebp-8]
 004C020A    mov         eax,dword ptr [ebp-4]
 004C020D    call        TWinControl.WndProc
 004C0212    pop         ebx
 004C0213    mov         esp,ebp
 004C0215    pop         ebp
 004C0216    ret
*}
end;

//004C021C
procedure TCustomListBox.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 004C021C    cmp         byte ptr [eax+260],0
>004C0223    je          004C022B
 004C0225    mov         ecx,dword ptr [eax]
 004C0227    call        dword ptr [ecx-10]
 004C022A    ret
 004C022B    call        TWinControl.WMEraseBkgnd
 004C0230    ret
*}
end;

//004C0234
procedure TCustomListBox.WMLButtonDown(var Message:TWMLButtonDown);
begin
{*
 004C0234    push        ebx
 004C0235    push        esi
 004C0236    push        edi
 004C0237    push        ebp
 004C0238    add         esp,0FFFFFFF4
 004C023B    mov         edi,edx
 004C023D    mov         ebx,eax
 004C023F    movzx       eax,word ptr [edi+4]
 004C0243    call        KeysToShiftState
 004C0248    mov         esi,eax
 004C024A    mov         eax,ebx
 004C024C    call        TControl.GetDragMode
 004C0251    cmp         al,1
>004C0253    jne         004C02B1
 004C0255    cmp         byte ptr [ebx+270],0
>004C025C    je          004C02B1
 004C025E    test        si,1
>004C0263    je          004C026C
 004C0265    test        si,4
>004C026A    je          004C02B1
 004C026C    mov         eax,dword ptr [edi+8]
 004C026F    mov         dword ptr [esp],eax
 004C0272    movsx       eax,word ptr [esp]
 004C0276    mov         dword ptr [esp+4],eax
 004C027A    movsx       eax,word ptr [esp+2]
 004C027F    mov         dword ptr [esp+8],eax
 004C0283    mov         cl,1
 004C0285    lea         edx,[esp+4]
 004C0289    mov         eax,ebx
 004C028B    call        TCustomListBox.ItemAtPos
 004C0290    mov         ebp,eax
 004C0292    test        ebp,ebp
>004C0294    jl          004C02B1
 004C0296    mov         edx,ebp
 004C0298    mov         eax,ebx
 004C029A    call        TCustomListBox.GetSelected
 004C029F    test        al,al
>004C02A1    je          004C02B1
 004C02A3    or          ecx,0FFFFFFFF
 004C02A6    xor         edx,edx
 004C02A8    mov         eax,ebx
 004C02AA    call        TControl.BeginDrag
>004C02AF    jmp         004C02E8
 004C02B1    mov         edx,edi
 004C02B3    mov         eax,ebx
 004C02B5    call        TControl.WMLButtonDown
 004C02BA    mov         eax,ebx
 004C02BC    call        TControl.GetDragMode
 004C02C1    cmp         al,1
>004C02C3    jne         004C02E8
 004C02C5    cmp         byte ptr [ebx+270],0
>004C02CC    je          004C02DC
 004C02CE    test        si,4
>004C02D3    jne         004C02E8
 004C02D5    test        si,1
>004C02DA    jne         004C02E8
 004C02DC    or          ecx,0FFFFFFFF
 004C02DF    xor         edx,edx
 004C02E1    mov         eax,ebx
 004C02E3    call        TControl.BeginDrag
 004C02E8    add         esp,0C
 004C02EB    pop         ebp
 004C02EC    pop         edi
 004C02ED    pop         esi
 004C02EE    pop         ebx
 004C02EF    ret
*}
end;

//004C02F0
procedure TCustomListBox.CNCommand(var Message:TWMCommand);
begin
{*
 004C02F0    push        esi
 004C02F1    mov         esi,eax
 004C02F3    movzx       eax,word ptr [edx+6]
 004C02F7    dec         ax
>004C02FA    je          004C0303
 004C02FC    dec         ax
>004C02FF    je          004C0317
>004C0301    jmp         004C0322
 004C0303    mov         eax,esi
 004C0305    call        TControl.Changed
 004C030A    mov         eax,esi
 004C030C    mov         si,0FFEC
 004C0310    call        @CallDynaInst
 004C0315    pop         esi
 004C0316    ret
 004C0317    mov         eax,esi
 004C0319    mov         si,0FFEB
 004C031D    call        @CallDynaInst
 004C0322    pop         esi
 004C0323    ret
*}
end;

//004C0324
procedure PaintListBox;
begin
{*
 004C0324    push        ebp
 004C0325    mov         ebp,esp
 004C0327    add         esp,0FFFFFF6C
 004C032D    push        ebx
 004C032E    push        esi
 004C032F    push        edi
 004C0330    mov         edi,dword ptr [ebp+8]
 004C0333    add         edi,0FFFFFFFC
 004C0336    mov         eax,dword ptr [edi]
 004C0338    mov         eax,dword ptr [eax+280]
 004C033E    mov         edx,dword ptr [eax]
 004C0340    call        dword ptr [edx+14]
 004C0343    test        eax,eax
>004C0345    jne         004C03BA
 004C0347    mov         dl,1
 004C0349    mov         eax,[00460070];TBrush
 004C034E    call        TBrush.Create
 004C0353    mov         dword ptr [ebp-0C],eax
 004C0356    xor         eax,eax
 004C0358    push        ebp
 004C0359    push        4C03B3
 004C035E    push        dword ptr fs:[eax]
 004C0361    mov         dword ptr fs:[eax],esp
 004C0364    mov         eax,dword ptr [edi]
 004C0366    mov         edx,dword ptr [eax+6C]
 004C0369    mov         eax,dword ptr [ebp-0C]
 004C036C    call        TBrush.SetColor
 004C0371    mov         eax,dword ptr [ebp-0C]
 004C0374    call        TBrush.GetHandle
 004C0379    push        eax
 004C037A    lea         edx,[ebp-94]
 004C0380    mov         eax,dword ptr [edi]
 004C0382    mov         ecx,dword ptr [eax]
 004C0384    call        dword ptr [ecx+54]
 004C0387    lea         eax,[ebp-94]
 004C038D    push        eax
 004C038E    mov         eax,dword ptr [ebp+8]
 004C0391    mov         eax,dword ptr [eax-8]
 004C0394    mov         eax,dword ptr [eax+4]
 004C0397    push        eax
 004C0398    call        user32.FillRect
 004C039D    xor         eax,eax
 004C039F    pop         edx
 004C03A0    pop         ecx
 004C03A1    pop         ecx
 004C03A2    mov         dword ptr fs:[eax],edx
 004C03A5    push        4C0527
 004C03AA    mov         eax,dword ptr [ebp-0C]
 004C03AD    call        TObject.Free
 004C03B2    ret
>004C03B3    jmp         @HandleFinally
>004C03B8    jmp         004C03AA
 004C03BA    xor         eax,eax
 004C03BC    push        ebp
 004C03BD    push        4C0520
 004C03C2    push        dword ptr fs:[eax]
 004C03C5    mov         dword ptr fs:[eax],esp
 004C03C8    lea         eax,[ebp-5C]
 004C03CB    mov         dword ptr [ebp-14],eax
 004C03CE    lea         eax,[ebp-74]
 004C03D1    mov         dword ptr [ebp-24],eax
 004C03D4    mov         dword ptr [ebp-1C],0BC2B
 004C03DB    mov         eax,dword ptr [edi]
 004C03DD    call        TWinControl.GetHandle
 004C03E2    mov         dword ptr [ebp-18],eax
 004C03E5    mov         dword ptr [ebp-5C],2
 004C03EC    mov         dword ptr [ebp-50],1
 004C03F3    xor         eax,eax
 004C03F5    mov         dword ptr [ebp-4C],eax
 004C03F8    mov         eax,dword ptr [ebp+8]
 004C03FB    mov         eax,dword ptr [eax-8]
 004C03FE    mov         eax,dword ptr [eax+4]
 004C0401    mov         dword ptr [ebp-44],eax
 004C0404    mov         eax,dword ptr [edi]
 004C0406    call        TWinControl.GetHandle
 004C040B    mov         dword ptr [ebp-58],eax
 004C040E    mov         eax,dword ptr [edi]
 004C0410    call        TWinControl.GetHandle
 004C0415    mov         dword ptr [ebp-48],eax
 004C0418    mov         dword ptr [ebp-2C],0BC2C
 004C041F    mov         eax,dword ptr [edi]
 004C0421    call        TWinControl.GetHandle
 004C0426    mov         dword ptr [ebp-28],eax
 004C0429    mov         dword ptr [ebp-74],2
 004C0430    mov         eax,dword ptr [edi]
 004C0432    call        TWinControl.GetHandle
 004C0437    mov         dword ptr [ebp-70],eax
 004C043A    xor         esi,esi
 004C043C    mov         eax,dword ptr [edi]
 004C043E    call        TCustomListBox.GetTopIndex
 004C0443    mov         ebx,eax
 004C0445    lea         eax,[ebp-84]
 004C044B    push        eax
 004C044C    mov         eax,dword ptr [ebp+8]
 004C044F    mov         eax,dword ptr [eax-8]
 004C0452    mov         eax,dword ptr [eax+4]
 004C0455    push        eax
 004C0456    call        gdi32.GetClipBox
 004C045B    mov         eax,dword ptr [edi]
 004C045D    mov         eax,dword ptr [eax+4C]
 004C0460    mov         dword ptr [ebp-4],eax
 004C0463    mov         eax,dword ptr [edi]
 004C0465    mov         eax,dword ptr [eax+48]
 004C0468    mov         dword ptr [ebp-8],eax
 004C046B    cmp         esi,dword ptr [ebp-4]
>004C046E    jge         004C0512
 004C0474    mov         dword ptr [ebp-6C],ebx
 004C0477    mov         eax,dword ptr [edi]
 004C0479    mov         eax,dword ptr [eax+280]
 004C047F    mov         edx,dword ptr [eax]
 004C0481    call        dword ptr [edx+14]
 004C0484    cmp         ebx,eax
>004C0486    jge         004C049A
 004C0488    mov         eax,dword ptr [edi]
 004C048A    mov         eax,dword ptr [eax+280]
 004C0490    mov         edx,ebx
 004C0492    mov         ecx,dword ptr [eax]
 004C0494    call        dword ptr [ecx+18]
 004C0497    mov         dword ptr [ebp-60],eax
 004C049A    mov         eax,dword ptr [ebp-8]
 004C049D    mov         dword ptr [ebp-68],eax
 004C04A0    mov         eax,dword ptr [edi]
 004C04A2    mov         eax,dword ptr [eax+298]
 004C04A8    mov         dword ptr [ebp-64],eax
 004C04AB    mov         eax,dword ptr [ebp-60]
 004C04AE    mov         dword ptr [ebp-30],eax
 004C04B1    mov         dword ptr [ebp-54],ebx
 004C04B4    lea         edx,[ebp-2C]
 004C04B7    mov         eax,dword ptr [edi]
 004C04B9    mov         ecx,dword ptr [eax]
 004C04BB    call        dword ptr [ecx-14]
 004C04BE    mov         eax,dword ptr [ebp-64]
 004C04C1    add         eax,esi
 004C04C3    push        eax
 004C04C4    lea         eax,[ebp-94]
 004C04CA    push        eax
 004C04CB    mov         ecx,dword ptr [ebp-68]
 004C04CE    mov         edx,esi
 004C04D0    xor         eax,eax
 004C04D2    call        Rect
 004C04D7    push        esi
 004C04D8    push        edi
 004C04D9    lea         esi,[ebp-94]
 004C04DF    lea         edi,[ebp-40]
 004C04E2    movs        dword ptr [edi],dword ptr [esi]
 004C04E3    movs        dword ptr [edi],dword ptr [esi]
 004C04E4    movs        dword ptr [edi],dword ptr [esi]
 004C04E5    movs        dword ptr [edi],dword ptr [esi]
 004C04E6    pop         edi
 004C04E7    pop         esi
 004C04E8    lea         edx,[ebp-1C]
 004C04EB    mov         eax,dword ptr [edi]
 004C04ED    mov         ecx,dword ptr [eax]
 004C04EF    call        dword ptr [ecx-14]
 004C04F2    mov         eax,dword ptr [ebp-64]
 004C04F5    add         esi,eax
 004C04F7    inc         ebx
 004C04F8    mov         eax,dword ptr [edi]
 004C04FA    mov         eax,dword ptr [eax+280]
 004C0500    mov         edx,dword ptr [eax]
 004C0502    call        dword ptr [edx+14]
 004C0505    cmp         ebx,eax
>004C0507    jge         004C0512
 004C0509    cmp         esi,dword ptr [ebp-4]
>004C050C    jl          004C0474
 004C0512    xor         eax,eax
 004C0514    pop         edx
 004C0515    pop         ecx
 004C0516    pop         ecx
 004C0517    mov         dword ptr fs:[eax],edx
 004C051A    push        4C0527
 004C051F    ret
>004C0520    jmp         @HandleFinally
>004C0525    jmp         004C051F
 004C0527    pop         edi
 004C0528    pop         esi
 004C0529    pop         ebx
 004C052A    mov         esp,ebp
 004C052C    pop         ebp
 004C052D    ret
*}
end;

//004C0530
procedure TCustomListBox.WMPaint(var Message:TWMPaint);
begin
{*
 004C0530    push        ebp
 004C0531    mov         ebp,esp
 004C0533    add         esp,0FFFFFFF8
 004C0536    mov         dword ptr [ebp-8],edx
 004C0539    mov         dword ptr [ebp-4],eax
 004C053C    mov         eax,dword ptr [ebp-8]
 004C053F    cmp         dword ptr [eax+4],0
>004C0543    je          004C054E
 004C0545    push        ebp
 004C0546    call        PaintListBox
 004C054B    pop         ecx
>004C054C    jmp         004C0559
 004C054E    mov         edx,dword ptr [ebp-8]
 004C0551    mov         eax,dword ptr [ebp-4]
 004C0554    call        TWinControl.WMPaint
 004C0559    pop         ecx
 004C055A    pop         ecx
 004C055B    pop         ebp
 004C055C    ret
*}
end;

//004C0560
procedure TCustomListBox.WMSize(var Message:TWMSize);
begin
{*
 004C0560    push        ebx
 004C0561    mov         ebx,eax
 004C0563    mov         eax,ebx
 004C0565    call        TWinControl.WMSize
 004C056A    mov         eax,ebx
 004C056C    call        TCustomListBox.SetColumnWidth
 004C0571    pop         ebx
 004C0572    ret
*}
end;

//004C0574
procedure TCustomListBox.DragCanceled;
begin
{*
 004C0574    push        ebx
 004C0575    add         esp,0FFFFFFDC
 004C0578    mov         ebx,eax
 004C057A    mov         dword ptr [esp+14],201
 004C0582    push        esp
 004C0583    call        user32.GetCursorPos
 004C0588    lea         ecx,[esp+8]
 004C058C    mov         edx,esp
 004C058E    mov         eax,ebx
 004C0590    call        TControl.ScreenToClient
 004C0595    movzx       eax,word ptr [esp+8]
 004C059A    mov         word ptr [esp+10],ax
 004C059F    movzx       eax,word ptr [esp+0C]
 004C05A4    mov         word ptr [esp+12],ax
 004C05A9    mov         eax,dword ptr [esp+10]
 004C05AD    mov         dword ptr [esp+1C],eax
 004C05B1    xor         eax,eax
 004C05B3    mov         dword ptr [esp+18],eax
 004C05B7    xor         eax,eax
 004C05B9    mov         dword ptr [esp+20],eax
 004C05BD    lea         edx,[esp+14]
 004C05C1    mov         eax,ebx
 004C05C3    mov         ecx,dword ptr [eax]
 004C05C5    call        dword ptr [ecx-10]
 004C05C8    mov         dword ptr [esp+14],202
 004C05D0    lea         edx,[esp+14]
 004C05D4    mov         eax,ebx
 004C05D6    mov         ecx,dword ptr [eax]
 004C05D8    call        dword ptr [ecx-10]
 004C05DB    add         esp,24
 004C05DE    pop         ebx
 004C05DF    ret
*}
end;

//004C05E0
procedure TCustomListBox.DrawItem(Index:Integer; Rect:TRect; State:TOwnerDrawState);
begin
{*
 004C05E0    push        ebp
 004C05E1    mov         ebp,esp
 004C05E3    add         esp,0FFFFFFE8
 004C05E6    push        ebx
 004C05E7    push        esi
 004C05E8    push        edi
 004C05E9    xor         ebx,ebx
 004C05EB    mov         dword ptr [ebp-4],ebx
 004C05EE    mov         esi,ecx
 004C05F0    lea         edi,[ebp-18]
 004C05F3    movs        dword ptr [edi],dword ptr [esi]
 004C05F4    movs        dword ptr [edi],dword ptr [esi]
 004C05F5    movs        dword ptr [edi],dword ptr [esi]
 004C05F6    movs        dword ptr [edi],dword ptr [esi]
 004C05F7    mov         edi,edx
 004C05F9    mov         ebx,eax
 004C05FB    xor         eax,eax
 004C05FD    push        ebp
 004C05FE    push        4C06F3
 004C0603    push        dword ptr fs:[eax]
 004C0606    mov         dword ptr fs:[eax],esp
 004C0609    cmp         word ptr [ebx+2C2],0
>004C0611    je          004C0631
 004C0613    lea         eax,[ebp-18]
 004C0616    push        eax
 004C0617    movzx       eax,word ptr [ebp+8]
 004C061B    push        eax
 004C061C    mov         ecx,edi
 004C061E    mov         edx,ebx
 004C0620    mov         eax,dword ptr [ebx+2C4]
 004C0626    call        dword ptr [ebx+2C0]
>004C062C    jmp         004C06DD
 004C0631    lea         edx,[ebp-18]
 004C0634    mov         eax,dword ptr [ebx+290]
 004C063A    mov         ecx,dword ptr [eax]
 004C063C    call        dword ptr [ecx+54]
 004C063F    mov         eax,ebx
 004C0641    mov         edx,dword ptr [eax]
 004C0643    call        dword ptr [edx+108]
 004C0649    cmp         edi,eax
>004C064B    jge         004C06DD
 004C0651    mov         edx,824
 004C0656    mov         eax,ebx
 004C0658    call        TControl.DrawTextBiDiModeFlags
 004C065D    mov         dword ptr [ebp-8],eax
 004C0660    mov         eax,ebx
 004C0662    mov         si,0FFC7
 004C0666    call        @CallDynaInst
 004C066B    test        al,al
>004C066D    jne         004C0675
 004C066F    add         dword ptr [ebp-18],2
>004C0673    jmp         004C0679
 004C0675    sub         dword ptr [ebp-10],2
 004C0679    lea         eax,[ebp-4]
 004C067C    call        @UStrClr
 004C0681    movzx       eax,byte ptr [ebx+2A0]
 004C0688    add         al,0FD
 004C068A    sub         al,2
>004C068C    jae         004C069C
 004C068E    lea         ecx,[ebp-4]
 004C0691    mov         edx,edi
 004C0693    mov         eax,ebx
 004C0695    call        TCustomListBox.DoGetData
>004C069A    jmp         004C06AC
 004C069C    lea         ecx,[ebp-4]
 004C069F    mov         edx,edi
 004C06A1    mov         eax,dword ptr [ebx+280]
 004C06A7    mov         esi,dword ptr [eax]
 004C06A9    call        dword ptr [esi+0C]
 004C06AC    mov         eax,dword ptr [ebx+290]
 004C06B2    call        TCanvas.GetHandle
 004C06B7    mov         esi,eax
 004C06B9    mov         ebx,dword ptr [ebp-4]
 004C06BC    test        ebx,ebx
>004C06BE    je          004C06C5
 004C06C0    sub         ebx,4
 004C06C3    mov         ebx,dword ptr [ebx]
 004C06C5    mov         eax,dword ptr [ebp-8]
 004C06C8    push        eax
 004C06C9    lea         eax,[ebp-18]
 004C06CC    push        eax
 004C06CD    push        ebx
 004C06CE    mov         eax,dword ptr [ebp-4]
 004C06D1    call        @UStrToPWChar
 004C06D6    push        eax
 004C06D7    push        esi
 004C06D8    call        user32.DrawTextW
 004C06DD    xor         eax,eax
 004C06DF    pop         edx
 004C06E0    pop         ecx
 004C06E1    pop         ecx
 004C06E2    mov         dword ptr fs:[eax],edx
 004C06E5    push        4C06FA
 004C06EA    lea         eax,[ebp-4]
 004C06ED    call        @UStrClr
 004C06F2    ret
>004C06F3    jmp         @HandleFinally
>004C06F8    jmp         004C06EA
 004C06FA    pop         edi
 004C06FB    pop         esi
 004C06FC    pop         ebx
 004C06FD    mov         esp,ebp
 004C06FF    pop         ebp
 004C0700    ret         4
*}
end;

//004C0704
procedure TCustomListBox.MeasureItem(Index:Integer; var Height:Integer);
begin
{*
 004C0704    push        ebx
 004C0705    cmp         word ptr [eax+2CA],0
>004C070D    je          004C0722
 004C070F    push        ecx
 004C0710    mov         ebx,eax
 004C0712    mov         ecx,edx
 004C0714    mov         edx,eax
 004C0716    mov         eax,dword ptr [ebx+2CC]
 004C071C    call        dword ptr [ebx+2C8]
 004C0722    pop         ebx
 004C0723    ret
*}
end;

//004C0724
procedure TCustomListBox.CNDrawItem(var Message:TWMDrawItem);
begin
{*
 004C0724    push        ebx
 004C0725    push        esi
 004C0726    push        edi
 004C0727    push        ebp
 004C0728    mov         ebx,eax
 004C072A    mov         esi,dword ptr [edx+8]
 004C072D    movzx       edi,word ptr [esi+10]
 004C0731    mov         edx,dword ptr [esi+18]
 004C0734    mov         eax,dword ptr [ebx+290]
 004C073A    call        TCanvas.SetHandle
 004C073F    mov         edx,dword ptr [ebx+64]
 004C0742    mov         eax,dword ptr [ebx+290]
 004C0748    call        TCanvas.SetFont
 004C074D    mov         edx,dword ptr [ebx+1C0]
 004C0753    mov         eax,dword ptr [ebx+290]
 004C0759    call        TCanvas.SetBrush
 004C075E    cmp         dword ptr [esi+8],0
>004C0762    jl          004C0791
 004C0764    test        di,1
>004C0769    je          004C0791
 004C076B    mov         eax,dword ptr [ebx+290]
 004C0771    mov         eax,dword ptr [eax+48]
 004C0774    mov         edx,0FF00000D
 004C0779    call        TBrush.SetColor
 004C077E    mov         eax,dword ptr [ebx+290]
 004C0784    mov         eax,dword ptr [eax+40]
 004C0787    mov         edx,0FF00000E
 004C078C    call        TFont.SetColor
 004C0791    mov         eax,dword ptr [esi+8]
 004C0794    test        eax,eax
>004C0796    jl          004C07AA
 004C0798    push        edi
 004C0799    lea         ecx,[esi+1C]
 004C079C    mov         edx,eax
 004C079E    mov         eax,ebx
 004C07A0    mov         ebp,dword ptr [eax]
 004C07A2    call        dword ptr [ebp+11C]
>004C07A8    jmp         004C07B8
 004C07AA    lea         edx,[esi+1C]
 004C07AD    mov         eax,dword ptr [ebx+290]
 004C07B3    mov         ecx,dword ptr [eax]
 004C07B5    call        dword ptr [ecx+54]
 004C07B8    test        di,10
>004C07BD    je          004C07CC
 004C07BF    lea         eax,[esi+1C]
 004C07C2    push        eax
 004C07C3    mov         eax,dword ptr [esi+18]
 004C07C6    push        eax
 004C07C7    call        user32.DrawFocusRect
 004C07CC    xor         edx,edx
 004C07CE    mov         eax,dword ptr [ebx+290]
 004C07D4    call        TCanvas.SetHandle
 004C07D9    pop         ebp
 004C07DA    pop         edi
 004C07DB    pop         esi
 004C07DC    pop         ebx
 004C07DD    ret
*}
end;

//004C07E0
procedure TCustomListBox.CNMeasureItem(var Message:TWMMeasureItem);
begin
{*
 004C07E0    push        ebx
 004C07E1    push        esi
 004C07E2    push        ecx
 004C07E3    mov         edx,dword ptr [edx+8]
 004C07E6    mov         ebx,edx
 004C07E8    mov         edx,dword ptr [eax+298]
 004C07EE    mov         dword ptr [ebx+10],edx
 004C07F1    cmp         byte ptr [eax+2A0],2
>004C07F8    jne         004C0810
 004C07FA    mov         dword ptr [esp],edx
 004C07FD    mov         ecx,esp
 004C07FF    mov         edx,dword ptr [ebx+8]
 004C0802    mov         esi,dword ptr [eax]
 004C0804    call        dword ptr [esi+120]
 004C080A    mov         eax,dword ptr [esp]
 004C080D    mov         dword ptr [ebx+10],eax
 004C0810    pop         edx
 004C0811    pop         esi
 004C0812    pop         ebx
 004C0813    ret
*}
end;

//004C0814
procedure TCustomListBox.CMCtl3DChanged(var Message:TMessage);
begin
{*
 004C0814    push        ebx
 004C0815    push        esi
 004C0816    mov         esi,edx
 004C0818    mov         ebx,eax
 004C081A    mov         eax,[0078D264];^NewStyleControls:Boolean
 004C081F    cmp         byte ptr [eax],0
>004C0822    je          004C0834
 004C0824    cmp         byte ptr [ebx+28C],1
>004C082B    jne         004C0834
 004C082D    mov         eax,ebx
 004C082F    call        TWinControl.RecreateWnd
 004C0834    mov         edx,esi
 004C0836    mov         eax,ebx
 004C0838    call        TWinControl.CMCtl3DChanged
 004C083D    pop         esi
 004C083E    pop         ebx
 004C083F    ret
*}
end;

//004C0840
procedure TCustomListBox.SelectAll;
begin
{*
 004C0840    push        ebx
 004C0841    push        esi
 004C0842    push        edi
 004C0843    mov         esi,eax
 004C0845    cmp         byte ptr [esi+270],0
>004C084C    je          004C0872
 004C084E    mov         eax,dword ptr [esi+280]
 004C0854    mov         edx,dword ptr [eax]
 004C0856    call        dword ptr [edx+14]
 004C0859    mov         ebx,eax
 004C085B    dec         ebx
 004C085C    test        ebx,ebx
>004C085E    jl          004C0872
 004C0860    inc         ebx
 004C0861    xor         edi,edi
 004C0863    mov         cl,1
 004C0865    mov         edx,edi
 004C0867    mov         eax,esi
 004C0869    call        TCustomListBox.SetSelected
 004C086E    inc         edi
 004C086F    dec         ebx
>004C0870    jne         004C0863
 004C0872    pop         edi
 004C0873    pop         esi
 004C0874    pop         ebx
 004C0875    ret
*}
end;

//004C0878
procedure FindString;
begin
{*
 004C0878    push        ebp
 004C0879    mov         ebp,esp
 004C087B    push        ebx
 004C087C    push        esi
 004C087D    mov         eax,dword ptr [ebp+8]
 004C0880    mov         eax,dword ptr [eax-4]
 004C0883    movzx       eax,byte ptr [eax+2A0]
 004C088A    add         al,0FD
 004C088C    sub         al,2
>004C088E    jae         004C08AB
 004C0890    mov         eax,dword ptr [ebp+8]
 004C0893    mov         eax,dword ptr [eax-4]
 004C0896    mov         edx,dword ptr [eax+284]
 004C089C    mov         eax,dword ptr [ebp+8]
 004C089F    mov         eax,dword ptr [eax-4]
 004C08A2    call        TCustomListBox.DoFindData
 004C08A7    mov         ebx,eax
>004C08A9    jmp         004C08D2
 004C08AB    mov         eax,dword ptr [ebp+8]
 004C08AE    mov         eax,dword ptr [eax-4]
 004C08B1    mov         eax,dword ptr [eax+284]
 004C08B7    push        eax
 004C08B8    mov         eax,dword ptr [ebp+8]
 004C08BB    mov         eax,dword ptr [eax-4]
 004C08BE    call        TWinControl.GetHandle
 004C08C3    or          ecx,0FFFFFFFF
 004C08C6    mov         edx,18F
 004C08CB    call        SendTextMessage
 004C08D0    mov         ebx,eax
 004C08D2    cmp         ebx,0FFFFFFFF
>004C08D5    je          004C0936
 004C08D7    mov         eax,dword ptr [ebp+8]
 004C08DA    mov         eax,dword ptr [eax-4]
 004C08DD    cmp         byte ptr [eax+270],0
>004C08E4    je          004C0917
 004C08E6    mov         eax,dword ptr [ebp+8]
 004C08E9    mov         eax,dword ptr [eax-4]
 004C08EC    mov         edx,dword ptr [eax]
 004C08EE    call        dword ptr [edx+0FC]
 004C08F4    movzx       esi,bx
 004C08F7    mov         eax,esi
 004C08F9    shl         esi,10
 004C08FC    or          eax,esi
 004C08FE    push        eax
 004C08FF    push        1
 004C0901    push        19B
 004C0906    mov         eax,dword ptr [ebp+8]
 004C0909    mov         eax,dword ptr [eax-4]
 004C090C    call        TWinControl.GetHandle
 004C0911    push        eax
 004C0912    call        user32.SendMessageW
 004C0917    mov         eax,dword ptr [ebp+8]
 004C091A    mov         eax,dword ptr [eax-4]
 004C091D    mov         edx,ebx
 004C091F    mov         ecx,dword ptr [eax]
 004C0921    call        dword ptr [ecx+0F0]
 004C0927    mov         eax,dword ptr [ebp+8]
 004C092A    mov         eax,dword ptr [eax-4]
 004C092D    mov         si,0FFEC
 004C0931    call        @CallDynaInst
 004C0936    mov         eax,dword ptr [ebp+8]
 004C0939    mov         eax,dword ptr [eax-8]
 004C093C    movzx       eax,word ptr [eax]
 004C093F    sub         ax,8
>004C0943    je          004C095C
 004C0945    sub         ax,5
>004C0949    je          004C095C
 004C094B    sub         ax,0E
>004C094F    je          004C095C
 004C0951    mov         eax,dword ptr [ebp+8]
 004C0954    mov         eax,dword ptr [eax-8]
 004C0957    mov         word ptr [eax],0
 004C095C    pop         esi
 004C095D    pop         ebx
 004C095E    pop         ebp
 004C095F    ret
*}
end;

//004C0960
procedure TCustomListBox.KeyPress(var Key:Char);
begin
{*
 004C0960    push        ebp
 004C0961    mov         ebp,esp
 004C0963    add         esp,0FFFFFFD0
 004C0966    push        ebx
 004C0967    push        esi
 004C0968    xor         ecx,ecx
 004C096A    mov         dword ptr [ebp-30],ecx
 004C096D    mov         dword ptr [ebp-28],ecx
 004C0970    mov         dword ptr [ebp-2C],ecx
 004C0973    mov         dword ptr [ebp-8],edx
 004C0976    mov         dword ptr [ebp-4],eax
 004C0979    lea         esi,[ebp-4]
 004C097C    xor         eax,eax
 004C097E    push        ebp
 004C097F    push        4C0B40
 004C0984    push        dword ptr fs:[eax]
 004C0987    mov         dword ptr fs:[eax],esp
 004C098A    mov         edx,dword ptr [ebp-8]
 004C098D    mov         eax,dword ptr [esi]
 004C098F    call        TWinControl.KeyPress
 004C0994    mov         eax,dword ptr [esi]
 004C0996    cmp         byte ptr [eax+278],0
>004C099D    je          004C0B25
 004C09A3    call        kernel32.GetTickCount
 004C09A8    mov         edx,dword ptr [esi]
 004C09AA    sub         eax,dword ptr [edx+288]
 004C09B0    mov         edx,dword ptr [esi]
 004C09B2    cmp         eax,dword ptr [edx+2E8]
>004C09B8    jb          004C09C6
 004C09BA    mov         eax,dword ptr [esi]
 004C09BC    add         eax,284
 004C09C1    call        @UStrClr
 004C09C6    call        kernel32.GetTickCount
 004C09CB    mov         edx,dword ptr [esi]
 004C09CD    mov         dword ptr [edx+288],eax
 004C09D3    mov         eax,dword ptr [ebp-8]
 004C09D6    movzx       eax,word ptr [eax]
 004C09D9    cmp         ax,8
>004C09DD    je          004C0AAC
 004C09E3    mov         eax,dword ptr [ebp-8]
 004C09E6    movzx       eax,word ptr [eax]
 004C09E9    cmp         ax,0D800
>004C09ED    jb          004C09F5
 004C09EF    cmp         ax,0DFFF
>004C09F3    jbe         004C09F9
 004C09F5    xor         eax,eax
>004C09F7    jmp         004C09FB
 004C09F9    mov         al,1
 004C09FB    test        al,al
>004C09FD    je          004C0A69
 004C09FF    push        1
 004C0A01    push        102
 004C0A06    push        102
 004C0A0B    mov         eax,dword ptr [esi]
 004C0A0D    call        TWinControl.GetHandle
 004C0A12    push        eax
 004C0A13    lea         eax,[ebp-24]
 004C0A16    push        eax
 004C0A17    call        user32.PeekMessageW
 004C0A1C    test        eax,eax
>004C0A1E    je          004C0AF0
 004C0A24    mov         eax,dword ptr [esi]
 004C0A26    push        dword ptr [eax+284]
 004C0A2C    lea         eax,[ebp-28]
 004C0A2F    mov         edx,dword ptr [ebp-8]
 004C0A32    movzx       edx,word ptr [edx]
 004C0A35    call        @UStrFromWChar
 004C0A3A    push        dword ptr [ebp-28]
 004C0A3D    lea         eax,[ebp-2C]
 004C0A40    mov         edx,dword ptr [ebp-1C]
 004C0A43    call        @UStrFromWChar
 004C0A48    push        dword ptr [ebp-2C]
 004C0A4B    mov         eax,dword ptr [esi]
 004C0A4D    add         eax,284
 004C0A52    mov         edx,3
 004C0A57    call        @UStrCatN
 004C0A5C    mov         eax,dword ptr [ebp-8]
 004C0A5F    mov         word ptr [eax],0
>004C0A64    jmp         004C0AF0
 004C0A69    lea         eax,[ebp-30]
 004C0A6C    mov         edx,dword ptr [ebp-8]
 004C0A6F    movzx       edx,word ptr [edx]
 004C0A72    call        @UStrFromWChar
 004C0A77    mov         edx,dword ptr [ebp-30]
 004C0A7A    mov         eax,dword ptr [esi]
 004C0A7C    add         eax,284
 004C0A81    call        @UStrCat
>004C0A86    jmp         004C0AF0
 004C0A88    mov         eax,dword ptr [esi]
 004C0A8A    mov         ebx,dword ptr [eax+284]
 004C0A90    test        ebx,ebx
>004C0A92    je          004C0A99
 004C0A94    sub         ebx,4
 004C0A97    mov         ebx,dword ptr [ebx]
 004C0A99    mov         eax,dword ptr [esi]
 004C0A9B    add         eax,284
 004C0AA0    mov         ecx,1
 004C0AA5    mov         edx,ebx
 004C0AA7    call        @UStrDelete
 004C0AAC    mov         eax,dword ptr [esi]
 004C0AAE    mov         eax,dword ptr [eax+284]
 004C0AB4    call        @UStrLen
 004C0AB9    mov         edx,eax
 004C0ABB    mov         eax,dword ptr [esi]
 004C0ABD    mov         eax,dword ptr [eax+284]
 004C0AC3    call        ByteType
 004C0AC8    cmp         al,2
>004C0ACA    je          004C0A88
 004C0ACC    mov         eax,dword ptr [esi]
 004C0ACE    mov         eax,dword ptr [eax+284]
 004C0AD4    test        eax,eax
>004C0AD6    je          004C0ADD
 004C0AD8    sub         eax,4
 004C0ADB    mov         eax,dword ptr [eax]
 004C0ADD    mov         edx,dword ptr [esi]
 004C0ADF    add         edx,284
 004C0AE5    mov         ecx,1
 004C0AEA    xchg        eax,edx
 004C0AEB    call        @UStrDelete
 004C0AF0    mov         eax,dword ptr [esi]
 004C0AF2    mov         eax,dword ptr [eax+284]
 004C0AF8    test        eax,eax
>004C0AFA    je          004C0B01
 004C0AFC    sub         eax,4
 004C0AFF    mov         eax,dword ptr [eax]
 004C0B01    test        eax,eax
>004C0B03    jle         004C0B0E
 004C0B05    push        ebp
 004C0B06    call        FindString
 004C0B0B    pop         ecx
>004C0B0C    jmp         004C0B25
 004C0B0E    xor         edx,edx
 004C0B10    mov         eax,dword ptr [esi]
 004C0B12    mov         ecx,dword ptr [eax]
 004C0B14    call        dword ptr [ecx+0F0]
 004C0B1A    mov         eax,dword ptr [esi]
 004C0B1C    mov         si,0FFEC
 004C0B20    call        @CallDynaInst
 004C0B25    xor         eax,eax
 004C0B27    pop         edx
 004C0B28    pop         ecx
 004C0B29    pop         ecx
 004C0B2A    mov         dword ptr fs:[eax],edx
 004C0B2D    push        4C0B47
 004C0B32    lea         eax,[ebp-30]
 004C0B35    mov         edx,3
 004C0B3A    call        @UStrArrayClr
 004C0B3F    ret
>004C0B40    jmp         @HandleFinally
>004C0B45    jmp         004C0B32
 004C0B47    pop         esi
 004C0B48    pop         ebx
 004C0B49    mov         esp,ebp
 004C0B4B    pop         ebp
 004C0B4C    ret
*}
end;

//004C0B50
procedure TCustomListBox.LoadRecreateItems(RecreateItems:TStrings);
begin
{*
 004C0B50    push        esi
 004C0B51    push        edi
 004C0B52    mov         edi,edx
 004C0B54    mov         esi,eax
 004C0B56    mov         edx,edi
 004C0B58    mov         eax,dword ptr [esi+280]
 004C0B5E    mov         ecx,dword ptr [eax]
 004C0B60    call        dword ptr [ecx+8]
 004C0B63    pop         edi
 004C0B64    pop         esi
 004C0B65    ret
*}
end;

//004C0B68
procedure TCustomListBox.SetCount(const Value:Integer);
begin
{*
 004C0B68    push        ebp
 004C0B69    mov         ebp,esp
 004C0B6B    add         esp,0FFFFFFF0
 004C0B6E    push        ebx
 004C0B6F    push        esi
 004C0B70    xor         ecx,ecx
 004C0B72    mov         dword ptr [ebp-10],ecx
 004C0B75    mov         dword ptr [ebp-0C],ecx
 004C0B78    mov         esi,edx
 004C0B7A    mov         ebx,eax
 004C0B7C    xor         eax,eax
 004C0B7E    push        ebp
 004C0B7F    push        4C0C3D
 004C0B84    push        dword ptr fs:[eax]
 004C0B87    mov         dword ptr fs:[eax],esp
 004C0B8A    movzx       eax,byte ptr [ebx+2A0]
 004C0B91    add         al,0FD
 004C0B93    sub         al,2
>004C0B95    jae         004C0BF1
 004C0B97    push        0
 004C0B99    push        esi
 004C0B9A    push        1A7
 004C0B9F    mov         eax,ebx
 004C0BA1    call        TWinControl.GetHandle
 004C0BA6    push        eax
 004C0BA7    call        user32.SendMessageW
 004C0BAC    cmp         eax,0FFFFFFFF
>004C0BAF    je          004C0BBE
 004C0BB1    cmp         eax,0FFFFFFFE
>004C0BB4    je          004C0BBE
 004C0BB6    mov         dword ptr [ebx+27C],esi
>004C0BBC    jmp         004C0C22
 004C0BBE    mov         eax,dword ptr [ebx+8]
 004C0BC1    mov         dword ptr [ebp-8],eax
 004C0BC4    mov         byte ptr [ebp-4],11
 004C0BC8    lea         eax,[ebp-8]
 004C0BCB    push        eax
 004C0BCC    push        0
 004C0BCE    lea         edx,[ebp-0C]
 004C0BD1    mov         eax,[0078D790];^SResString299:TResStringRec
 004C0BD6    call        LoadResString
 004C0BDB    mov         ecx,dword ptr [ebp-0C]
 004C0BDE    mov         dl,1
 004C0BE0    mov         eax,[00418C04];Exception
 004C0BE5    call        Exception.CreateFmt
 004C0BEA    call        @RaiseExcept
>004C0BEF    jmp         004C0C22
 004C0BF1    mov         eax,dword ptr [ebx+8]
 004C0BF4    mov         dword ptr [ebp-8],eax
 004C0BF7    mov         byte ptr [ebp-4],11
 004C0BFB    lea         eax,[ebp-8]
 004C0BFE    push        eax
 004C0BFF    push        0
 004C0C01    lea         edx,[ebp-10]
 004C0C04    mov         eax,[0078CFE4];^SResString300:TResStringRec
 004C0C09    call        LoadResString
 004C0C0E    mov         ecx,dword ptr [ebp-10]
 004C0C11    mov         dl,1
 004C0C13    mov         eax,[00418C04];Exception
 004C0C18    call        Exception.CreateFmt
 004C0C1D    call        @RaiseExcept
 004C0C22    xor         eax,eax
 004C0C24    pop         edx
 004C0C25    pop         ecx
 004C0C26    pop         ecx
 004C0C27    mov         dword ptr fs:[eax],edx
 004C0C2A    push        4C0C44
 004C0C2F    lea         eax,[ebp-10]
 004C0C32    mov         edx,2
 004C0C37    call        @UStrArrayClr
 004C0C3C    ret
>004C0C3D    jmp         @HandleFinally
>004C0C42    jmp         004C0C2F
 004C0C44    pop         esi
 004C0C45    pop         ebx
 004C0C46    mov         esp,ebp
 004C0C48    pop         ebp
 004C0C49    ret
*}
end;

//004C0C4C
function TCustomListBox.DoGetData(const Index:Integer):UnicodeString;
begin
{*
 004C0C4C    push        ebx
 004C0C4D    cmp         word ptr [eax+2D2],0
>004C0C55    je          004C0C6A
 004C0C57    push        ecx
 004C0C58    mov         ebx,eax
 004C0C5A    mov         ecx,edx
 004C0C5C    mov         edx,eax
 004C0C5E    mov         eax,dword ptr [ebx+2D4]
 004C0C64    call        dword ptr [ebx+2D0]
 004C0C6A    pop         ebx
 004C0C6B    ret
*}
end;

//004C0C6C
function TCustomListBox.DoGetDataObject(const Index:Integer):TObject;
begin
{*
 004C0C6C    push        ebx
 004C0C6D    push        ecx
 004C0C6E    xor         ecx,ecx
 004C0C70    mov         dword ptr [esp],ecx
 004C0C73    cmp         word ptr [eax+2E2],0
>004C0C7B    je          004C0C90
 004C0C7D    push        esp
 004C0C7E    mov         ebx,eax
 004C0C80    mov         ecx,edx
 004C0C82    mov         edx,eax
 004C0C84    mov         eax,dword ptr [ebx+2E4]
 004C0C8A    call        dword ptr [ebx+2E0]
 004C0C90    mov         eax,dword ptr [esp]
 004C0C93    pop         edx
 004C0C94    pop         ebx
 004C0C95    ret
*}
end;

//004C0C98
function TCustomListBox.DoFindData(const Data:UnicodeString):Integer;
begin
{*
 004C0C98    push        ebx
 004C0C99    cmp         word ptr [eax+2DA],0
>004C0CA1    je          004C0CB7
 004C0CA3    mov         ebx,eax
 004C0CA5    mov         ecx,edx
 004C0CA7    mov         edx,eax
 004C0CA9    mov         eax,dword ptr [ebx+2DC]
 004C0CAF    call        dword ptr [ebx+2D8]
 004C0CB5    pop         ebx
 004C0CB6    ret
 004C0CB7    or          eax,0FFFFFFFF
 004C0CBA    pop         ebx
 004C0CBB    ret
*}
end;

//004C0CBC
function TCustomListBox.GetScrollWidth:Integer;
begin
{*
 004C0CBC    push        ebx
 004C0CBD    mov         ebx,eax
 004C0CBF    push        0
 004C0CC1    push        0
 004C0CC3    push        193
 004C0CC8    mov         eax,ebx
 004C0CCA    call        TWinControl.GetHandle
 004C0CCF    push        eax
 004C0CD0    call        user32.SendMessageW
 004C0CD5    pop         ebx
 004C0CD6    ret
*}
end;

//004C0CD8
procedure TCustomListBox.SetScrollWidth(const Value:Integer);
begin
{*
 004C0CD8    push        ebx
 004C0CD9    push        esi
 004C0CDA    mov         esi,edx
 004C0CDC    mov         ebx,eax
 004C0CDE    mov         eax,ebx
 004C0CE0    call        TCustomListBox.GetScrollWidth
 004C0CE5    cmp         esi,eax
>004C0CE7    je          004C0CFE
 004C0CE9    push        0
 004C0CEB    push        esi
 004C0CEC    push        194
 004C0CF1    mov         eax,ebx
 004C0CF3    call        TWinControl.GetHandle
 004C0CF8    push        eax
 004C0CF9    call        user32.SendMessageW
 004C0CFE    pop         esi
 004C0CFF    pop         ebx
 004C0D00    ret
*}
end;

//004C0D04
constructor TScrollBar.Create;
begin
{*
 004C0D04    push        ebx
 004C0D05    push        esi
 004C0D06    test        dl,dl
>004C0D08    je          004C0D12
 004C0D0A    add         esp,0FFFFFFF0
 004C0D0D    call        @ClassCreate
 004C0D12    mov         ebx,edx
 004C0D14    mov         esi,eax
 004C0D16    xor         edx,edx
 004C0D18    mov         eax,esi
 004C0D1A    call        TWinControl.Create
 004C0D1F    mov         edx,79
 004C0D24    mov         eax,esi
 004C0D26    call        TControl.SetWidth
 004C0D2B    push        3
 004C0D2D    call        user32.GetSystemMetrics
 004C0D32    mov         edx,eax
 004C0D34    mov         eax,esi
 004C0D36    call        TControl.SetHeight
 004C0D3B    mov         dl,1
 004C0D3D    mov         eax,esi
 004C0D3F    call        TWinControl.SetTabStop
 004C0D44    mov         eax,[004C0DB8]
 004C0D49    mov         dword ptr [esi+50],eax
 004C0D4C    mov         byte ptr [esi+270],0
 004C0D53    xor         eax,eax
 004C0D55    mov         dword ptr [esi+274],eax
 004C0D5B    xor         eax,eax
 004C0D5D    mov         dword ptr [esi+278],eax
 004C0D63    mov         dword ptr [esi+27C],64
 004C0D6D    mov         word ptr [esi+288],1
 004C0D76    mov         word ptr [esi+28A],1
 004C0D7F    mov         eax,[0078DB7C];SysLocale:TSysLocale
 004C0D84    cmp         byte ptr [eax+0C],0
>004C0D88    je          004C0D9B
 004C0D8A    mov         eax,[0078DB58];^gvar_00784C7C
 004C0D8F    cmp         dword ptr [eax],2
>004C0D92    jne         004C0D9B
 004C0D94    mov         byte ptr [esi+1CC],0
 004C0D9B    mov         eax,esi
 004C0D9D    test        bl,bl
>004C0D9F    je          004C0DB0
 004C0DA1    call        @AfterConstruction
 004C0DA6    pop         dword ptr fs:[0]
 004C0DAD    add         esp,0C
 004C0DB0    mov         eax,esi
 004C0DB2    pop         esi
 004C0DB3    pop         ebx
 004C0DB4    ret
*}
end;

//004C0DBC
procedure TScrollBar.CreateParams(var Params:TCreateParams);
begin
{*
 004C0DBC    push        ebx
 004C0DBD    push        esi
 004C0DBE    push        edi
 004C0DBF    mov         edi,edx
 004C0DC1    mov         ebx,eax
 004C0DC3    mov         edx,edi
 004C0DC5    mov         eax,ebx
 004C0DC7    call        TWinControl.CreateParams
 004C0DCC    mov         ecx,4C0E34
 004C0DD1    mov         edx,edi
 004C0DD3    mov         eax,ebx
 004C0DD5    call        TWinControl.CreateSubClass
 004C0DDA    movzx       eax,byte ptr [ebx+270]
 004C0DE1    mov         eax,dword ptr [eax*4+785F20]
 004C0DE8    or          dword ptr [edi+4],eax
 004C0DEB    cmp         byte ptr [ebx+270],1
>004C0DF2    jne         004C0E0D
 004C0DF4    mov         eax,ebx
 004C0DF6    mov         si,0FFC7
 004C0DFA    call        @CallDynaInst
 004C0DFF    test        al,al
>004C0E01    jne         004C0E09
 004C0E03    or          dword ptr [edi+4],4
>004C0E07    jmp         004C0E0D
 004C0E09    or          dword ptr [edi+4],2
 004C0E0D    mov         eax,ebx
 004C0E0F    call        TScrollBar.NotRightToLeft
 004C0E14    test        al,al
>004C0E16    je          004C0E24
 004C0E18    mov         dword ptr [ebx+284],1
>004C0E22    jmp         004C0E2E
 004C0E24    mov         dword ptr [ebx+284],0FFFFFFFF
 004C0E2E    pop         edi
 004C0E2F    pop         esi
 004C0E30    pop         ebx
 004C0E31    ret
*}
end;

//004C0E48
procedure TScrollBar.CreateWnd;
begin
{*
 004C0E48    push        ebx
 004C0E49    add         esp,0FFFFFFD4
 004C0E4C    mov         ebx,eax
 004C0E4E    lea         edx,[esp+1C]
 004C0E52    mov         eax,ebx
 004C0E54    call        TControl.GetBoundsRect
 004C0E59    mov         eax,ebx
 004C0E5B    call        TWinControl.CreateWnd
 004C0E60    lea         edx,[esp+1C]
 004C0E64    mov         eax,ebx
 004C0E66    call        TControl.SetBoundsRect
 004C0E6B    push        0
 004C0E6D    mov         eax,dword ptr [ebx+27C]
 004C0E73    push        eax
 004C0E74    mov         eax,dword ptr [ebx+278]
 004C0E7A    push        eax
 004C0E7B    push        2
 004C0E7D    mov         eax,ebx
 004C0E7F    call        TWinControl.GetHandle
 004C0E84    push        eax
 004C0E85    call        user32.SetScrollRange
 004C0E8A    mov         dword ptr [esp],1C
 004C0E91    mov         eax,dword ptr [ebx+280]
 004C0E97    mov         dword ptr [esp+10],eax
 004C0E9B    mov         dword ptr [esp+4],2
 004C0EA3    push        0
 004C0EA5    lea         eax,[esp+4]
 004C0EA9    push        eax
 004C0EAA    push        2
 004C0EAC    mov         eax,ebx
 004C0EAE    call        TWinControl.GetHandle
 004C0EB3    push        eax
 004C0EB4    call        user32.SetScrollInfo
 004C0EB9    mov         eax,ebx
 004C0EBB    call        TScrollBar.NotRightToLeft
 004C0EC0    test        al,al
>004C0EC2    je          004C0EDE
 004C0EC4    push        0FF
 004C0EC6    mov         eax,dword ptr [ebx+274]
 004C0ECC    push        eax
 004C0ECD    push        2
 004C0ECF    mov         eax,ebx
 004C0ED1    call        TWinControl.GetHandle
 004C0ED6    push        eax
 004C0ED7    call        user32.SetScrollPos
>004C0EDC    jmp         004C0EFC
 004C0EDE    push        0FF
 004C0EE0    mov         eax,dword ptr [ebx+27C]
 004C0EE6    sub         eax,dword ptr [ebx+274]
 004C0EEC    push        eax
 004C0EED    push        2
 004C0EEF    mov         eax,ebx
 004C0EF1    call        TWinControl.GetHandle
 004C0EF6    push        eax
 004C0EF7    call        user32.SetScrollPos
 004C0EFC    add         esp,2C
 004C0EFF    pop         ebx
 004C0F00    ret
*}
end;

//004C0F04
function TScrollBar.NotRightToLeft:Boolean;
begin
{*
 004C0F04    push        ebx
 004C0F05    mov         ebx,eax
 004C0F07    mov         eax,ebx
 004C0F09    call        TControl.IsRightToLeft
 004C0F0E    test        al,al
>004C0F10    je          004C0F1F
 004C0F12    cmp         byte ptr [ebx+270],1
>004C0F19    je          004C0F1F
 004C0F1B    xor         eax,eax
 004C0F1D    pop         ebx
 004C0F1E    ret
 004C0F1F    mov         al,1
 004C0F21    pop         ebx
 004C0F22    ret
*}
end;

//004C0F24
procedure TScrollBar.SetKind(Value:TScrollBarKind);
begin
{*
 004C0F24    push        ebx
 004C0F25    push        esi
 004C0F26    mov         ebx,eax
 004C0F28    cmp         dl,byte ptr [ebx+270]
>004C0F2E    je          004C0F5B
 004C0F30    mov         byte ptr [ebx+270],dl
 004C0F36    test        byte ptr [ebx+1C],1
>004C0F3A    jne         004C0F54
 004C0F3C    mov         eax,dword ptr [ebx+4C]
 004C0F3F    push        eax
 004C0F40    mov         eax,dword ptr [ebx+48]
 004C0F43    push        eax
 004C0F44    mov         ecx,dword ptr [ebx+44]
 004C0F47    mov         edx,dword ptr [ebx+40]
 004C0F4A    mov         eax,ebx
 004C0F4C    mov         esi,dword ptr [eax]
 004C0F4E    call        dword ptr [esi+98]
 004C0F54    mov         eax,ebx
 004C0F56    call        TWinControl.RecreateWnd
 004C0F5B    pop         esi
 004C0F5C    pop         ebx
 004C0F5D    ret
*}
end;

//004C0F60
procedure TScrollBar.SetParams(APosition:Integer; AMin:Integer; AMax:Integer);
begin
{*
 004C0F60    push        ebp
 004C0F61    mov         ebp,esp
 004C0F63    add         esp,0FFFFFFF8
 004C0F66    push        ebx
 004C0F67    push        esi
 004C0F68    push        edi
 004C0F69    xor         ebx,ebx
 004C0F6B    mov         dword ptr [ebp-8],ebx
 004C0F6E    mov         dword ptr [ebp-4],ecx
 004C0F71    mov         edi,edx
 004C0F73    mov         ebx,eax
 004C0F75    mov         esi,dword ptr [ebp+8]
 004C0F78    xor         eax,eax
 004C0F7A    push        ebp
 004C0F7B    push        4C1097
 004C0F80    push        dword ptr fs:[eax]
 004C0F83    mov         dword ptr fs:[eax],esp
 004C0F86    cmp         esi,dword ptr [ebp-4]
>004C0F89    jl          004C0F93
 004C0F8B    cmp         esi,dword ptr [ebx+280]
>004C0F91    jge         004C0FB4
 004C0F93    lea         edx,[ebp-8]
 004C0F96    mov         eax,[0078D65C];^SResString206:TResStringRec
 004C0F9B    call        LoadResString
 004C0FA0    mov         ecx,dword ptr [ebp-8]
 004C0FA3    mov         dl,1
 004C0FA5    mov         eax,[00439268];EInvalidOperation
 004C0FAA    call        Exception.Create
 004C0FAF    call        @RaiseExcept
 004C0FB4    cmp         edi,dword ptr [ebp-4]
>004C0FB7    jge         004C0FBC
 004C0FB9    mov         edi,dword ptr [ebp-4]
 004C0FBC    cmp         esi,edi
>004C0FBE    jge         004C0FC2
 004C0FC0    mov         edi,esi
 004C0FC2    mov         eax,dword ptr [ebx+278]
 004C0FC8    cmp         eax,dword ptr [ebp-4]
>004C0FCB    jne         004C0FD5
 004C0FCD    cmp         esi,dword ptr [ebx+27C]
>004C0FD3    je          004C1011
 004C0FD5    mov         eax,dword ptr [ebp-4]
 004C0FD8    mov         dword ptr [ebx+278],eax
 004C0FDE    mov         dword ptr [ebx+27C],esi
 004C0FE4    mov         eax,ebx
 004C0FE6    call        TWinControl.HandleAllocated
 004C0FEB    test        al,al
>004C0FED    je          004C1011
 004C0FEF    cmp         edi,dword ptr [ebx+274]
 004C0FF5    sete        al
 004C0FF8    neg         al
 004C0FFA    sbb         eax,eax
 004C0FFC    push        eax
 004C0FFD    push        esi
 004C0FFE    mov         eax,dword ptr [ebp-4]
 004C1001    push        eax
 004C1002    push        2
 004C1004    mov         eax,ebx
 004C1006    call        TWinControl.GetHandle
 004C100B    push        eax
 004C100C    call        user32.SetScrollRange
 004C1011    cmp         edi,dword ptr [ebx+274]
>004C1017    je          004C1081
 004C1019    mov         dword ptr [ebx+274],edi
 004C101F    mov         eax,ebx
 004C1021    call        TWinControl.HandleAllocated
 004C1026    test        al,al
>004C1028    je          004C106D
 004C102A    mov         eax,ebx
 004C102C    call        TScrollBar.NotRightToLeft
 004C1031    test        al,al
>004C1033    je          004C104F
 004C1035    push        0FF
 004C1037    mov         eax,dword ptr [ebx+274]
 004C103D    push        eax
 004C103E    push        2
 004C1040    mov         eax,ebx
 004C1042    call        TWinControl.GetHandle
 004C1047    push        eax
 004C1048    call        user32.SetScrollPos
>004C104D    jmp         004C106D
 004C104F    push        0FF
 004C1051    mov         eax,dword ptr [ebx+27C]
 004C1057    sub         eax,dword ptr [ebx+274]
 004C105D    push        eax
 004C105E    push        2
 004C1060    mov         eax,ebx
 004C1062    call        TWinControl.GetHandle
 004C1067    push        eax
 004C1068    call        user32.SetScrollPos
 004C106D    mov         dl,1
 004C106F    mov         eax,ebx
 004C1071    mov         ecx,dword ptr [eax]
 004C1073    call        dword ptr [ecx+74]
 004C1076    mov         eax,ebx
 004C1078    mov         si,0FFAF
 004C107C    call        @CallDynaInst
 004C1081    xor         eax,eax
 004C1083    pop         edx
 004C1084    pop         ecx
 004C1085    pop         ecx
 004C1086    mov         dword ptr fs:[eax],edx
 004C1089    push        4C109E
 004C108E    lea         eax,[ebp-8]
 004C1091    call        @UStrClr
 004C1096    ret
>004C1097    jmp         @HandleFinally
>004C109C    jmp         004C108E
 004C109E    pop         edi
 004C109F    pop         esi
 004C10A0    pop         ebx
 004C10A1    pop         ecx
 004C10A2    pop         ecx
 004C10A3    pop         ebp
 004C10A4    ret         4
*}
end;

//004C10A8
procedure TScrollBar.SetPosition(Value:Integer);
begin
{*
 004C10A8    mov         ecx,dword ptr [eax+27C]
 004C10AE    push        ecx
 004C10AF    mov         ecx,dword ptr [eax+278]
 004C10B5    call        TScrollBar.SetParams
 004C10BA    ret
*}
end;

//004C10BC
procedure TScrollBar.SetPageSize(Value:Integer);
begin
{*
 004C10BC    push        ebx
 004C10BD    add         esp,0FFFFFFE4
 004C10C0    mov         ebx,eax
 004C10C2    cmp         edx,dword ptr [ebx+280]
>004C10C8    je          004C110C
 004C10CA    cmp         edx,dword ptr [ebx+27C]
>004C10D0    jg          004C110C
 004C10D2    mov         dword ptr [ebx+280],edx
 004C10D8    mov         dword ptr [esp],1C
 004C10DF    mov         dword ptr [esp+10],edx
 004C10E3    mov         dword ptr [esp+4],2
 004C10EB    mov         eax,ebx
 004C10ED    call        TWinControl.HandleAllocated
 004C10F2    test        al,al
>004C10F4    je          004C110C
 004C10F6    push        0FF
 004C10F8    lea         eax,[esp+4]
 004C10FC    push        eax
 004C10FD    push        2
 004C10FF    mov         eax,ebx
 004C1101    call        TWinControl.GetHandle
 004C1106    push        eax
 004C1107    call        user32.SetScrollInfo
 004C110C    add         esp,1C
 004C110F    pop         ebx
 004C1110    ret
*}
end;

//004C1114
procedure TScrollBar.SetMin(Value:Integer);
begin
{*
 004C1114    mov         ecx,dword ptr [eax+27C]
 004C111A    push        ecx
 004C111B    mov         ecx,edx
 004C111D    mov         edx,dword ptr [eax+274]
 004C1123    call        TScrollBar.SetParams
 004C1128    ret
*}
end;

//004C112C
procedure TScrollBar.SetMax(Value:Integer);
begin
{*
 004C112C    push        edx
 004C112D    mov         ecx,dword ptr [eax+278]
 004C1133    mov         edx,dword ptr [eax+274]
 004C1139    call        TScrollBar.SetParams
 004C113E    ret
*}
end;

//004C1140
procedure TScrollBar.Change;
begin
{*
 004C1140    push        ebx
 004C1141    mov         ebx,eax
 004C1143    mov         eax,ebx
 004C1145    call        TControl.Changed
 004C114A    cmp         word ptr [ebx+292],0
>004C1152    je          004C1162
 004C1154    mov         edx,ebx
 004C1156    mov         eax,dword ptr [ebx+294]
 004C115C    call        dword ptr [ebx+290]
 004C1162    pop         ebx
 004C1163    ret
*}
end;

//004C1164
procedure TScrollBar.Scroll(ScrollCode:TScrollCode; var ScrollPos:Integer);
begin
{*
 004C1164    push        ebx
 004C1165    cmp         word ptr [eax+29A],0
>004C116D    je          004C1182
 004C116F    push        ecx
 004C1170    mov         ebx,eax
 004C1172    mov         ecx,edx
 004C1174    mov         edx,eax
 004C1176    mov         eax,dword ptr [ebx+29C]
 004C117C    call        dword ptr [ebx+298]
 004C1182    pop         ebx
 004C1183    ret
*}
end;

//004C1184
procedure TScrollBar.DoScroll(var Message:TWMScroll);
begin
{*
 004C1184    push        ebx
 004C1185    push        esi
 004C1186    push        edi
 004C1187    add         esp,0FFFFFFE0
 004C118A    mov         edi,edx
 004C118C    mov         ebx,eax
 004C118E    mov         esi,dword ptr [ebx+274]
 004C1194    movzx       eax,byte ptr [edi+4]
 004C1198    cmp         eax,7
>004C119B    ja          004C125C
 004C11A1    jmp         dword ptr [eax*4+4C11A8]
 004C11A1    dd          004C11C8
 004C11A1    dd          004C11DC
 004C11A1    dd          004C11ED
 004C11A1    dd          004C11FE
 004C11A1    dd          004C120F
 004C11A1    dd          004C120F
 004C11A1    dd          004C124E
 004C11A1    dd          004C1256
 004C11C8    movzx       eax,word ptr [ebx+288]
 004C11CF    imul        dword ptr [ebx+284]
 004C11D5    sub         esi,eax
>004C11D7    jmp         004C125C
 004C11DC    movzx       eax,word ptr [ebx+288]
 004C11E3    imul        dword ptr [ebx+284]
 004C11E9    add         esi,eax
>004C11EB    jmp         004C125C
 004C11ED    movzx       eax,word ptr [ebx+28A]
 004C11F4    imul        dword ptr [ebx+284]
 004C11FA    sub         esi,eax
>004C11FC    jmp         004C125C
 004C11FE    movzx       eax,word ptr [ebx+28A]
 004C1205    imul        dword ptr [ebx+284]
 004C120B    add         esi,eax
>004C120D    jmp         004C125C
 004C120F    mov         dword ptr [esp+4],1C
 004C1217    mov         dword ptr [esp+8],17
 004C121F    lea         eax,[esp+4]
 004C1223    push        eax
 004C1224    push        2
 004C1226    mov         eax,ebx
 004C1228    call        TWinControl.GetHandle
 004C122D    push        eax
 004C122E    call        user32.GetScrollInfo
 004C1233    mov         esi,dword ptr [esp+1C]
 004C1237    mov         eax,ebx
 004C1239    call        TScrollBar.NotRightToLeft
 004C123E    test        al,al
>004C1240    jne         004C125C
 004C1242    mov         eax,dword ptr [ebx+27C]
 004C1248    sub         eax,esi
 004C124A    mov         esi,eax
>004C124C    jmp         004C125C
 004C124E    mov         esi,dword ptr [ebx+278]
>004C1254    jmp         004C125C
 004C1256    mov         esi,dword ptr [ebx+27C]
 004C125C    mov         eax,dword ptr [ebx+278]
 004C1262    cmp         esi,eax
>004C1264    jge         004C1268
 004C1266    mov         esi,eax
 004C1268    mov         eax,dword ptr [ebx+27C]
 004C126E    cmp         esi,eax
>004C1270    jle         004C1274
 004C1272    mov         esi,eax
 004C1274    mov         dword ptr [esp],esi
 004C1277    mov         ecx,esp
 004C1279    movzx       edx,byte ptr [edi+4]
 004C127D    mov         eax,ebx
 004C127F    mov         si,0FFAE
 004C1283    call        @CallDynaInst
 004C1288    mov         edx,dword ptr [esp]
 004C128B    mov         eax,ebx
 004C128D    call        TScrollBar.SetPosition
 004C1292    add         esp,20
 004C1295    pop         edi
 004C1296    pop         esi
 004C1297    pop         ebx
 004C1298    ret
*}
end;

//004C129C
procedure TScrollBar.sub_004C129C;
begin
{*
 004C129C    call        TScrollBar.DoScroll
 004C12A1    ret
*}
end;

//004C12A4
procedure TScrollBar.sub_004C12A4;
begin
{*
 004C12A4    call        TScrollBar.DoScroll
 004C12A9    ret
*}
end;

//004C12AC
procedure TScrollBar.CNCtlColorScrollBar(var Message:TMessage);
begin
{*
 004C12AC    push        ebx
 004C12AD    push        esi
 004C12AE    mov         esi,edx
 004C12B0    mov         ebx,eax
 004C12B2    mov         eax,dword ptr [esi+8]
 004C12B5    push        eax
 004C12B6    mov         eax,dword ptr [esi+4]
 004C12B9    push        eax
 004C12BA    mov         eax,dword ptr [esi]
 004C12BC    push        eax
 004C12BD    mov         eax,ebx
 004C12BF    call        TWinControl.GetHandle
 004C12C4    push        eax
 004C12C5    mov         eax,dword ptr [ebx+254]
 004C12CB    push        eax
 004C12CC    call        user32.CallWindowProcW
 004C12D1    pop         esi
 004C12D2    pop         ebx
 004C12D3    ret
*}
end;

//004C12D4
procedure TScrollBar.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 004C12D4    mov         ecx,dword ptr [eax]
 004C12D6    call        dword ptr [ecx-10];TWinControl.DefaultHandler
 004C12D9    ret
*}
end;

//004C1648
function comdlg32.GetOpenFileNameW:BOOL; stdcall;
begin
{*
 004C1648    jmp         dword ptr ds:[82686C]
*}
end;

//004C1650
function comdlg32.GetSaveFileNameW:BOOL; stdcall;
begin
{*
 004C1650    jmp         dword ptr ds:[826868]
*}
end;

//004C1658
function comdlg32.FindTextW:HWND; stdcall;
begin
{*
 004C1658    jmp         dword ptr ds:[826864]
*}
end;

//004C1660
function comdlg32.ReplaceTextW:HWND; stdcall;
begin
{*
 004C1660    jmp         dword ptr ds:[826860]
*}
end;

//004C2D90
procedure ColorRGBToHLS(clrRGB:TColorRef; var Hue:Word; var Luminance:Word; var Saturation:Word);
begin
{*
 004C2D90    push        ebp
 004C2D91    mov         ebp,esp
 004C2D93    add         esp,0FFFFFFBC
 004C2D96    push        ebx
 004C2D97    push        esi
 004C2D98    push        edi
 004C2D99    mov         dword ptr [ebp-8],ecx
 004C2D9C    mov         dword ptr [ebp-4],edx
 004C2D9F    mov         esi,eax
 004C2DA1    call        @GetTls
 004C2DA6    cmp         esi,dword ptr [eax+18];{CachedRGBToHLSclrRGB:TColorRef}
>004C2DAC    jne         004C2DE9
 004C2DAE    call        @GetTls
 004C2DB3    movzx       eax,word ptr [eax+1C];{CachedRGBToHLSHue:Word}
 004C2DBA    mov         edx,dword ptr [ebp-4]
 004C2DBD    mov         word ptr [edx],ax
 004C2DC0    call        @GetTls
 004C2DC5    movzx       eax,word ptr [eax+1E];{CachedRGBToHLSLum:Word}
 004C2DCC    mov         edx,dword ptr [ebp-8]
 004C2DCF    mov         word ptr [edx],ax
 004C2DD2    call        @GetTls
 004C2DD7    movzx       eax,word ptr [eax+20];{CachedRGBToHLSSat:Word}
 004C2DDE    mov         edx,dword ptr [ebp+8]
 004C2DE1    mov         word ptr [edx],ax
>004C2DE4    jmp         004C30A7
 004C2DE9    mov         ebx,esi
 004C2DEB    movzx       ebx,bl
 004C2DEE    mov         eax,esi
 004C2DF0    shr         eax,8
 004C2DF3    movzx       edi,al
 004C2DF6    mov         eax,esi
 004C2DF8    shr         eax,10
 004C2DFB    movzx       eax,al
 004C2DFE    mov         word ptr [ebp-22],ax
 004C2E02    movzx       edx,di
 004C2E05    movzx       eax,bx
 004C2E08    cmp         edx,eax
>004C2E0A    jge         004C2E10
 004C2E0C    mov         edx,eax
>004C2E0E    jmp         004C2E13
 004C2E10    movzx       edx,di
 004C2E13    movzx       ecx,word ptr [ebp-22]
 004C2E17    cmp         edx,ecx
>004C2E19    jg          004C2E1F
 004C2E1B    movzx       edx,word ptr [ebp-22]
 004C2E1F    mov         dword ptr [ebp-40],edx
 004C2E22    fild        dword ptr [ebp-40]
 004C2E25    fstp        qword ptr [ebp-30]
 004C2E28    wait
 004C2E29    movzx       edx,di
 004C2E2C    cmp         eax,edx
>004C2E2E    jl          004C2E33
 004C2E30    movzx       eax,di
 004C2E33    movzx       edx,word ptr [ebp-22]
 004C2E37    cmp         eax,edx
>004C2E39    jl          004C2E3F
 004C2E3B    movzx       eax,word ptr [ebp-22]
 004C2E3F    mov         dword ptr [ebp-40],eax
 004C2E42    fild        dword ptr [ebp-40]
 004C2E45    fstp        qword ptr [ebp-38]
 004C2E48    wait
 004C2E49    fld         qword ptr [ebp-30]
 004C2E4C    fadd        qword ptr [ebp-38]
 004C2E4F    fmul        dword ptr ds:[4C30B0]
 004C2E55    fadd        dword ptr ds:[4C30B4]
 004C2E5B    fdiv        dword ptr ds:[4C30B8]
 004C2E61    fstp        qword ptr [ebp-18]
 004C2E64    wait
 004C2E65    fld         qword ptr [ebp-18]
 004C2E68    call        @TRUNC
 004C2E6D    mov         edx,dword ptr [ebp-8]
 004C2E70    mov         word ptr [edx],ax
 004C2E73    fld         qword ptr [ebp-30]
 004C2E76    fcomp       qword ptr [ebp-38]
 004C2E79    wait
 004C2E7A    fnstsw      al
 004C2E7C    sahf
>004C2E7D    jne         004C2E94
 004C2E7F    mov         eax,dword ptr [ebp-4]
 004C2E82    mov         word ptr [eax],0A0
 004C2E87    mov         eax,dword ptr [ebp+8]
 004C2E8A    mov         word ptr [eax],0
>004C2E8F    jmp         004C3066
 004C2E94    mov         eax,dword ptr [ebp-8]
 004C2E97    movzx       eax,word ptr [eax]
 004C2E9A    mov         dword ptr [ebp-40],eax
 004C2E9D    fild        dword ptr [ebp-40]
 004C2EA0    fcomp       dword ptr ds:[4C30BC]
 004C2EA6    wait
 004C2EA7    fnstsw      al
 004C2EA9    sahf
>004C2EAA    ja          004C2ED4
 004C2EAC    fld         qword ptr [ebp-30]
 004C2EAF    fsub        qword ptr [ebp-38]
 004C2EB2    fmul        dword ptr ds:[4C30B0]
 004C2EB8    fld         qword ptr [ebp-30]
 004C2EBB    fadd        qword ptr [ebp-38]
 004C2EBE    fdiv        dword ptr ds:[4C30C0]
 004C2EC4    faddp       st(1),st
 004C2EC6    fld         qword ptr [ebp-30]
 004C2EC9    fadd        qword ptr [ebp-38]
 004C2ECC    fdivp       st(1),st
 004C2ECE    fstp        qword ptr [ebp-20]
 004C2ED1    wait
>004C2ED2    jmp         004C2F06
 004C2ED4    fld         qword ptr [ebp-30]
 004C2ED7    fsub        qword ptr [ebp-38]
 004C2EDA    fmul        dword ptr ds:[4C30B0]
 004C2EE0    fld         dword ptr ds:[4C30B8]
 004C2EE6    fsub        qword ptr [ebp-30]
 004C2EE9    fsub        qword ptr [ebp-38]
 004C2EEC    fdiv        dword ptr ds:[4C30C0]
 004C2EF2    faddp       st(1),st
 004C2EF4    fld         dword ptr ds:[4C30B8]
 004C2EFA    fsub        qword ptr [ebp-30]
 004C2EFD    fsub        qword ptr [ebp-38]
 004C2F00    fdivp       st(1),st
 004C2F02    fstp        qword ptr [ebp-20]
 004C2F05    wait
 004C2F06    movzx       eax,bx
 004C2F09    mov         dword ptr [ebp-40],eax
 004C2F0C    fild        dword ptr [ebp-40]
 004C2F0F    fsubr       qword ptr [ebp-30]
 004C2F12    fmul        dword ptr ds:[4C30C4]
 004C2F18    fld         qword ptr [ebp-30]
 004C2F1B    fsub        qword ptr [ebp-38]
 004C2F1E    fdiv        dword ptr ds:[4C30C0]
 004C2F24    faddp       st(1),st
 004C2F26    fld         qword ptr [ebp-30]
 004C2F29    fsub        qword ptr [ebp-38]
 004C2F2C    fdivp       st(1),st
 004C2F2E    call        @TRUNC
 004C2F33    mov         word ptr [ebp-3A],ax
 004C2F37    movzx       eax,di
 004C2F3A    mov         dword ptr [ebp-40],eax
 004C2F3D    fild        dword ptr [ebp-40]
 004C2F40    fsubr       qword ptr [ebp-30]
 004C2F43    fmul        dword ptr ds:[4C30C4]
 004C2F49    fld         qword ptr [ebp-30]
 004C2F4C    fsub        qword ptr [ebp-38]
 004C2F4F    fdiv        dword ptr ds:[4C30C0]
 004C2F55    faddp       st(1),st
 004C2F57    fld         qword ptr [ebp-30]
 004C2F5A    fsub        qword ptr [ebp-38]
 004C2F5D    fdivp       st(1),st
 004C2F5F    call        @TRUNC
 004C2F64    mov         word ptr [ebp-3C],ax
 004C2F68    movzx       eax,word ptr [ebp-22]
 004C2F6C    mov         dword ptr [ebp-40],eax
 004C2F6F    fild        dword ptr [ebp-40]
 004C2F72    fsubr       qword ptr [ebp-30]
 004C2F75    fmul        dword ptr ds:[4C30C4]
 004C2F7B    fld         qword ptr [ebp-30]
 004C2F7E    fsub        qword ptr [ebp-38]
 004C2F81    fdiv        dword ptr ds:[4C30C0]
 004C2F87    faddp       st(1),st
 004C2F89    fld         qword ptr [ebp-30]
 004C2F8C    fsub        qword ptr [ebp-38]
 004C2F8F    fdivp       st(1),st
 004C2F91    call        @TRUNC
 004C2F96    mov         edx,eax
 004C2F98    movzx       eax,bx
 004C2F9B    mov         dword ptr [ebp-40],eax
 004C2F9E    fild        dword ptr [ebp-40]
 004C2FA1    fcomp       qword ptr [ebp-30]
 004C2FA4    wait
 004C2FA5    fnstsw      al
 004C2FA7    sahf
>004C2FA8    jne         004C2FBF
 004C2FAA    movzx       eax,dx
 004C2FAD    movzx       edx,word ptr [ebp-3C]
 004C2FB1    sub         eax,edx
 004C2FB3    mov         dword ptr [ebp-40],eax
 004C2FB6    fild        dword ptr [ebp-40]
 004C2FB9    fstp        qword ptr [ebp-10]
 004C2FBC    wait
>004C2FBD    jmp         004C3012
 004C2FBF    movzx       eax,di
 004C2FC2    mov         dword ptr [ebp-40],eax
 004C2FC5    fild        dword ptr [ebp-40]
 004C2FC8    fcomp       qword ptr [ebp-30]
 004C2FCB    wait
 004C2FCC    fnstsw      al
 004C2FCE    sahf
>004C2FCF    jne         004C2FF2
 004C2FD1    movzx       eax,word ptr [ebp-3A]
 004C2FD5    mov         dword ptr [ebp-40],eax
 004C2FD8    fild        dword ptr [ebp-40]
 004C2FDB    fadd        dword ptr ds:[4C30C8]
 004C2FE1    movzx       eax,dx
 004C2FE4    mov         dword ptr [ebp-44],eax
 004C2FE7    fild        dword ptr [ebp-44]
 004C2FEA    fsubp       st(1),st
 004C2FEC    fstp        qword ptr [ebp-10]
 004C2FEF    wait
>004C2FF0    jmp         004C3012
 004C2FF2    movzx       eax,word ptr [ebp-3C]
 004C2FF6    mov         dword ptr [ebp-40],eax
 004C2FF9    fild        dword ptr [ebp-40]
 004C2FFC    fadd        dword ptr ds:[4C30CC]
 004C3002    movzx       eax,word ptr [ebp-3A]
 004C3006    mov         dword ptr [ebp-44],eax
 004C3009    fild        dword ptr [ebp-44]
 004C300C    fsubp       st(1),st
 004C300E    fstp        qword ptr [ebp-10]
 004C3011    wait
 004C3012    fld         qword ptr [ebp-10]
 004C3015    fcomp       dword ptr ds:[4C30D0]
 004C301B    wait
 004C301C    fnstsw      al
 004C301E    sahf
>004C301F    jae         004C302E
 004C3021    fld         qword ptr [ebp-10]
 004C3024    fadd        dword ptr ds:[4C30B0]
 004C302A    fstp        qword ptr [ebp-10]
 004C302D    wait
 004C302E    fld         qword ptr [ebp-10]
 004C3031    fcomp       dword ptr ds:[4C30B0]
 004C3037    wait
 004C3038    fnstsw      al
 004C303A    sahf
>004C303B    jbe         004C304A
 004C303D    fld         qword ptr [ebp-10]
 004C3040    fsub        dword ptr ds:[4C30B0]
 004C3046    fstp        qword ptr [ebp-10]
 004C3049    wait
 004C304A    fld         qword ptr [ebp-10]
 004C304D    call        @ROUND
 004C3052    mov         edx,dword ptr [ebp-4]
 004C3055    mov         word ptr [edx],ax
 004C3058    fld         qword ptr [ebp-20]
 004C305B    call        @TRUNC
 004C3060    mov         edx,dword ptr [ebp+8]
 004C3063    mov         word ptr [edx],ax
 004C3066    call        @GetTls
 004C306B    mov         dword ptr [eax+18],esi;{CachedRGBToHLSclrRGB:TColorRef}
 004C3071    call        @GetTls
 004C3076    mov         edx,dword ptr [ebp-4]
 004C3079    movzx       edx,word ptr [edx]
 004C307C    mov         word ptr [eax+1C],dx;{CachedRGBToHLSHue:Word}
 004C3083    call        @GetTls
 004C3088    mov         edx,dword ptr [ebp-8]
 004C308B    movzx       edx,word ptr [edx]
 004C308E    mov         word ptr [eax+1E],dx;{CachedRGBToHLSLum:Word}
 004C3095    call        @GetTls
 004C309A    mov         edx,dword ptr [ebp+8]
 004C309D    movzx       edx,word ptr [edx]
 004C30A0    mov         word ptr [eax+20],dx;{CachedRGBToHLSSat:Word}
 004C30A7    pop         edi
 004C30A8    pop         esi
 004C30A9    pop         ebx
 004C30AA    mov         esp,ebp
 004C30AC    pop         ebp
 004C30AD    ret         4
*}
end;

//004C30D4
function HueToRGB(Lum:Double; Sat:Double; Hue:Double):Integer;
begin
{*
 004C30D4    push        ebp
 004C30D5    mov         ebp,esp
 004C30D7    add         esp,0FFFFFFF8
 004C30DA    fld         qword ptr [ebp+8]
 004C30DD    fcomp       dword ptr ds:[4C31AC]
 004C30E3    wait
 004C30E4    fnstsw      al
 004C30E6    sahf
>004C30E7    jae         004C30F6
 004C30E9    fld         qword ptr [ebp+8]
 004C30EC    fadd        dword ptr ds:[4C31B0]
 004C30F2    fstp        qword ptr [ebp+8]
 004C30F5    wait
 004C30F6    fld         qword ptr [ebp+8]
 004C30F9    fcomp       dword ptr ds:[4C31B0]
 004C30FF    wait
 004C3100    fnstsw      al
 004C3102    sahf
>004C3103    jbe         004C3112
 004C3105    fld         qword ptr [ebp+8]
 004C3108    fsub        dword ptr ds:[4C31B0]
 004C310E    fstp        qword ptr [ebp+8]
 004C3111    wait
 004C3112    fld         qword ptr [ebp+8]
 004C3115    fcomp       dword ptr ds:[4C31B4]
 004C311B    wait
 004C311C    fnstsw      al
 004C311E    sahf
>004C311F    jae         004C313F
 004C3121    fld         qword ptr [ebp+10]
 004C3124    fsub        qword ptr [ebp+18]
 004C3127    fmul        qword ptr [ebp+8]
 004C312A    fadd        dword ptr ds:[4C31B8]
 004C3130    fdiv        dword ptr ds:[4C31B4]
 004C3136    fadd        qword ptr [ebp+18]
 004C3139    fstp        qword ptr [ebp-8]
 004C313C    wait
>004C313D    jmp         004C319D
 004C313F    fld         qword ptr [ebp+8]
 004C3142    fcomp       dword ptr ds:[4C31BC]
 004C3148    wait
 004C3149    fnstsw      al
 004C314B    sahf
>004C314C    jae         004C315C
 004C314E    mov         eax,dword ptr [ebp+10]
 004C3151    mov         dword ptr [ebp-8],eax
 004C3154    mov         eax,dword ptr [ebp+14]
 004C3157    mov         dword ptr [ebp-4],eax
>004C315A    jmp         004C319D
 004C315C    fld         qword ptr [ebp+8]
 004C315F    fcomp       dword ptr ds:[4C31C0]
 004C3165    wait
 004C3166    fnstsw      al
 004C3168    sahf
>004C3169    jae         004C3191
 004C316B    fld         qword ptr [ebp+10]
 004C316E    fsub        qword ptr [ebp+18]
 004C3171    fld         dword ptr ds:[4C31C0]
 004C3177    fsub        qword ptr [ebp+8]
 004C317A    fmulp       st(1),st
 004C317C    fadd        dword ptr ds:[4C31B8]
 004C3182    fdiv        dword ptr ds:[4C31B4]
 004C3188    fadd        qword ptr [ebp+18]
 004C318B    fstp        qword ptr [ebp-8]
 004C318E    wait
>004C318F    jmp         004C319D
 004C3191    mov         eax,dword ptr [ebp+18]
 004C3194    mov         dword ptr [ebp-8],eax
 004C3197    mov         eax,dword ptr [ebp+1C]
 004C319A    mov         dword ptr [ebp-4],eax
 004C319D    fld         qword ptr [ebp-8]
 004C31A0    call        @ROUND
 004C31A5    pop         ecx
 004C31A6    pop         ecx
 004C31A7    pop         ebp
 004C31A8    ret         18
*}
end;

//004C31C4
function RoundColor(Value:Double):Integer;
begin
{*
 004C31C4    push        ebp
 004C31C5    mov         ebp,esp
 004C31C7    fld         qword ptr [ebp+8]
 004C31CA    fcomp       dword ptr ds:[4C31EC]
 004C31D0    wait
 004C31D1    fnstsw      al
 004C31D3    sahf
>004C31D4    jbe         004C31DD
 004C31D6    mov         eax,0FF
>004C31DB    jmp         004C31E5
 004C31DD    fld         qword ptr [ebp+8]
 004C31E0    call        @ROUND
 004C31E5    pop         ebp
 004C31E6    ret         8
*}
end;

//004C31F0
function ColorHLSToRGB(Hue:Word; Luminance:Word; Saturation:Word):TColorRef;
begin
{*
 004C31F0    push        ebx
 004C31F1    push        esi
 004C31F2    push        edi
 004C31F3    add         esp,0FFFFFFCC
 004C31F6    mov         esi,eax
 004C31F8    test        cx,cx
>004C31FB    jne         004C3251
 004C31FD    movzx       eax,dx
 004C3200    mov         edx,eax
 004C3202    shl         eax,8
 004C3205    sub         eax,edx
 004C3207    mov         dword ptr [esp+2C],eax
 004C320B    fild        dword ptr [esp+2C]
 004C320F    fdiv        dword ptr ds:[4C3404]
 004C3215    fstp        qword ptr [esp]
 004C3218    wait
 004C3219    mov         eax,dword ptr [esp]
 004C321C    mov         dword ptr [esp+8],eax
 004C3220    mov         eax,dword ptr [esp+4]
 004C3224    mov         dword ptr [esp+0C],eax
 004C3228    mov         eax,dword ptr [esp]
 004C322B    mov         dword ptr [esp+10],eax
 004C322F    mov         eax,dword ptr [esp+4]
 004C3233    mov         dword ptr [esp+14],eax
 004C3237    movzx       eax,si
 004C323A    mov         dword ptr [esp+2C],eax
 004C323E    fild        dword ptr [esp+2C]
 004C3242    fcomp       dword ptr ds:[4C3408]
 004C3248    wait
 004C3249    fnstsw      al
 004C324B    sahf
>004C324C    jmp         004C33B8
 004C3251    movzx       eax,dx
 004C3254    mov         dword ptr [esp+2C],eax
 004C3258    fild        dword ptr [esp+2C]
 004C325C    fcomp       dword ptr ds:[4C340C]
 004C3262    wait
 004C3263    fnstsw      al
 004C3265    sahf
>004C3266    ja          004C3292
 004C3268    movzx       eax,dx
 004C326B    movzx       ecx,cx
 004C326E    add         ecx,0F0
 004C3274    imul        eax,ecx
 004C3277    mov         dword ptr [esp+2C],eax
 004C327B    fild        dword ptr [esp+2C]
 004C327F    fadd        dword ptr ds:[4C340C]
 004C3285    fdiv        dword ptr ds:[4C3404]
 004C328B    fstp        qword ptr [esp+20]
 004C328F    wait
>004C3290    jmp         004C32C2
 004C3292    movzx       eax,dx
 004C3295    mov         edi,eax
 004C3297    movzx       ebx,cx
 004C329A    add         edi,ebx
 004C329C    mov         dword ptr [esp+2C],edi
 004C32A0    fild        dword ptr [esp+2C]
 004C32A4    imul        eax,ebx
 004C32A7    mov         dword ptr [esp+30],eax
 004C32AB    fild        dword ptr [esp+30]
 004C32AF    fadd        dword ptr ds:[4C340C]
 004C32B5    fdiv        dword ptr ds:[4C3404]
 004C32BB    fsubp       st(1),st
 004C32BD    fstp        qword ptr [esp+20]
 004C32C1    wait
 004C32C2    movzx       eax,dx
 004C32C5    add         eax,eax
 004C32C7    mov         dword ptr [esp+2C],eax
 004C32CB    fild        dword ptr [esp+2C]
 004C32CF    fsub        qword ptr [esp+20]
 004C32D3    fstp        qword ptr [esp+18]
 004C32D7    wait
 004C32D8    push        dword ptr [esp+1C]
 004C32DC    push        dword ptr [esp+1C]
 004C32E0    push        dword ptr [esp+2C]
 004C32E4    push        dword ptr [esp+2C]
 004C32E8    movzx       eax,si
 004C32EB    mov         dword ptr [esp+3C],eax
 004C32EF    fild        dword ptr [esp+3C]
 004C32F3    fadd        dword ptr ds:[4C3410]
 004C32F9    add         esp,0FFFFFFF8
 004C32FC    fstp        qword ptr [esp]
 004C32FF    wait
 004C3300    call        HueToRGB
 004C3305    mov         edx,eax
 004C3307    shl         eax,8
 004C330A    sub         eax,edx
 004C330C    mov         dword ptr [esp+2C],eax
 004C3310    fild        dword ptr [esp+2C]
 004C3314    fadd        dword ptr ds:[4C340C]
 004C331A    fdiv        dword ptr ds:[4C3404]
 004C3320    fstp        qword ptr [esp]
 004C3323    wait
 004C3324    push        dword ptr [esp+1C]
 004C3328    push        dword ptr [esp+1C]
 004C332C    push        dword ptr [esp+2C]
 004C3330    push        dword ptr [esp+2C]
 004C3334    movzx       eax,si
 004C3337    mov         dword ptr [esp+3C],eax
 004C333B    fild        dword ptr [esp+3C]
 004C333F    add         esp,0FFFFFFF8
 004C3342    fstp        qword ptr [esp]
 004C3345    wait
 004C3346    call        HueToRGB
 004C334B    mov         edx,eax
 004C334D    shl         eax,8
 004C3350    sub         eax,edx
 004C3352    mov         dword ptr [esp+2C],eax
 004C3356    fild        dword ptr [esp+2C]
 004C335A    fadd        dword ptr ds:[4C340C]
 004C3360    fdiv        dword ptr ds:[4C3404]
 004C3366    fstp        qword ptr [esp+8]
 004C336A    wait
 004C336B    push        dword ptr [esp+1C]
 004C336F    push        dword ptr [esp+1C]
 004C3373    push        dword ptr [esp+2C]
 004C3377    push        dword ptr [esp+2C]
 004C337B    movzx       eax,si
 004C337E    mov         dword ptr [esp+3C],eax
 004C3382    fild        dword ptr [esp+3C]
 004C3386    fsub        dword ptr ds:[4C3410]
 004C338C    add         esp,0FFFFFFF8
 004C338F    fstp        qword ptr [esp]
 004C3392    wait
 004C3393    call        HueToRGB
 004C3398    mov         edx,eax
 004C339A    shl         eax,8
 004C339D    sub         eax,edx
 004C339F    mov         dword ptr [esp+2C],eax
 004C33A3    fild        dword ptr [esp+2C]
 004C33A7    fadd        dword ptr ds:[4C340C]
 004C33AD    fdiv        dword ptr ds:[4C3404]
 004C33B3    fstp        qword ptr [esp+10]
 004C33B7    wait
 004C33B8    push        dword ptr [esp+4]
 004C33BC    push        dword ptr [esp+4]
 004C33C0    call        RoundColor
 004C33C5    mov         ebx,eax
 004C33C7    push        dword ptr [esp+0C]
 004C33CB    push        dword ptr [esp+0C]
 004C33CF    call        RoundColor
 004C33D4    mov         byte ptr [esp+28],al
 004C33D8    push        dword ptr [esp+14]
 004C33DC    push        dword ptr [esp+14]
 004C33E0    call        RoundColor
 004C33E5    movzx       edx,bl
 004C33E8    movzx       ecx,byte ptr [esp+28]
 004C33ED    shl         ecx,8
 004C33F0    or          edx,ecx
 004C33F2    movzx       eax,al
 004C33F5    shl         eax,10
 004C33F8    or          edx,eax
 004C33FA    mov         eax,edx
 004C33FC    add         esp,34
 004C33FF    pop         edi
 004C3400    pop         esi
 004C3401    pop         ebx
 004C3402    ret
*}
end;

//004C3414
function ColorAdjustLuma(clrRGB:TColor; n:Integer; fScale:BOOL):TColor;
begin
{*
 004C3414    push        ebx
 004C3415    push        esi
 004C3416    push        edi
 004C3417    add         esp,0FFFFFFF8
 004C341A    mov         esi,edx
 004C341C    mov         ebx,eax
 004C341E    call        @GetTls
 004C3423    cmp         ebx,dword ptr [eax+3C];{CachedColorValue:Integer}
>004C3429    jne         004C3445
 004C342B    call        @GetTls
 004C3430    cmp         esi,dword ptr [eax+40];{CachedLumValue:Integer}
>004C3436    jne         004C3445
 004C3438    call        @GetTls
 004C343D    mov         edi,dword ptr [eax+44];{CachedColorAdjustLuma:TColor}
>004C3443    jmp         004C3497
 004C3445    lea         eax,[esp+4]
 004C3449    push        eax
 004C344A    mov         eax,ebx
 004C344C    call        ColorToRGB
 004C3451    lea         ecx,[esp+6]
 004C3455    lea         edx,[esp+4]
 004C3459    call        ColorRGBToHLS
 004C345E    movzx       edx,word ptr [esp+2]
 004C3463    add         dx,si
 004C3466    movzx       ecx,word ptr [esp+4]
 004C346B    movzx       eax,word ptr [esp]
 004C346F    call        ColorHLSToRGB
 004C3474    mov         edi,eax
 004C3476    call        @GetTls
 004C347B    mov         dword ptr [eax+3C],ebx;{CachedColorValue:Integer}
 004C3481    call        @GetTls
 004C3486    mov         dword ptr [eax+40],esi;{CachedLumValue:Integer}
 004C348C    call        @GetTls
 004C3491    mov         dword ptr [eax+44],edi;{CachedColorAdjustLuma:TColor}
 004C3497    mov         eax,edi
 004C3499    pop         ecx
 004C349A    pop         edx
 004C349B    pop         edi
 004C349C    pop         esi
 004C349D    pop         ebx
 004C349E    ret
*}
end;

//004C34A0
function GetHighLightColor(const Color:TColor; Luminance:Integer):TColor;
begin
{*
 004C34A0    push        ebx
 004C34A1    push        esi
 004C34A2    push        edi
 004C34A3    add         esp,0FFFFFFF8
 004C34A6    mov         ebx,edx
 004C34A8    mov         esi,eax
 004C34AA    call        @GetTls
 004C34AF    cmp         esi,dword ptr [eax+28];{CachedHighlightColor:TColor}
>004C34B5    jne         004C34D4
 004C34B7    call        @GetTls
 004C34BC    cmp         ebx,dword ptr [eax+24];{CachedHighlightLum:Integer}
>004C34C2    jne         004C34D4
 004C34C4    call        @GetTls
 004C34C9    mov         edi,dword ptr [eax+2C];{CachedHighlight:TColor}
>004C34CF    jmp         004C3570
 004C34D4    cmp         esi,0FF00000F
>004C34DA    jne         004C34EB
 004C34DC    cmp         ebx,13
>004C34DF    jne         004C34EB
 004C34E1    mov         edi,0FF000014
>004C34E6    jmp         004C3570
 004C34EB    mov         eax,esi
 004C34ED    call        ColorToRGB
 004C34F2    mov         edi,eax
 004C34F4    lea         eax,[esp+4]
 004C34F8    push        eax
 004C34F9    lea         ecx,[esp+6]
 004C34FD    lea         edx,[esp+4]
 004C3501    mov         eax,edi
 004C3503    call        ColorRGBToHLS
 004C3508    cmp         word ptr [esp+4],0DC
>004C350F    jbe         004C3542
 004C3511    movzx       eax,word ptr [esp+2]
 004C3516    sub         eax,ebx
>004C3518    js          004C3542
 004C351A    movzx       eax,word ptr [esp+2]
 004C351F    sub         eax,ebx
 004C3521    cmp         eax,0FFFF
>004C3526    jg          004C3542
 004C3528    movzx       edx,word ptr [esp+2]
 004C352D    sub         dx,bx
 004C3530    movzx       ecx,word ptr [esp+4]
 004C3535    movzx       eax,word ptr [esp]
 004C3539    call        ColorHLSToRGB
 004C353E    mov         edi,eax
>004C3540    jmp         004C354F
 004C3542    xor         ecx,ecx
 004C3544    mov         edx,ebx
 004C3546    mov         eax,edi
 004C3548    call        ColorAdjustLuma
 004C354D    mov         edi,eax
 004C354F    call        @GetTls
 004C3554    mov         dword ptr [eax+24],ebx;{CachedHighlightLum:Integer}
 004C355A    call        @GetTls
 004C355F    mov         dword ptr [eax+28],esi;{CachedHighlightColor:TColor}
 004C3565    call        @GetTls
 004C356A    mov         dword ptr [eax+2C],edi;{CachedHighlight:TColor}
 004C3570    mov         eax,edi
 004C3572    pop         ecx
 004C3573    pop         edx
 004C3574    pop         edi
 004C3575    pop         esi
 004C3576    pop         ebx
 004C3577    ret
*}
end;

//004C3578
function GetShadowColor(const Color:TColor; Luminance:Integer):TColor;
begin
{*
 004C3578    push        ebx
 004C3579    push        esi
 004C357A    push        edi
 004C357B    add         esp,0FFFFFFF8
 004C357E    mov         ebx,edx
 004C3580    mov         esi,eax
 004C3582    call        @GetTls
 004C3587    cmp         esi,dword ptr [eax+34];{CachedShadowColor:TColor}
>004C358D    jne         004C35AC
 004C358F    call        @GetTls
 004C3594    cmp         ebx,dword ptr [eax+30];{CachedShadowLum:Integer}
>004C359A    jne         004C35AC
 004C359C    call        @GetTls
 004C35A1    mov         edi,dword ptr [eax+38];{CachedShadow:TColor}
>004C35A7    jmp         004C3647
 004C35AC    cmp         esi,0FF00000F
>004C35B2    jne         004C35C0
 004C35B4    cmp         ebx,0FFFFFFCE
>004C35B7    jne         004C35C0
 004C35B9    mov         edi,0FF000010
>004C35BE    jmp         004C3626
 004C35C0    mov         eax,esi
 004C35C2    call        ColorToRGB
 004C35C7    mov         edi,eax
 004C35C9    lea         eax,[esp+4]
 004C35CD    push        eax
 004C35CE    lea         ecx,[esp+6]
 004C35D2    lea         edx,[esp+4]
 004C35D6    mov         eax,edi
 004C35D8    call        ColorRGBToHLS
 004C35DD    cmp         word ptr [esp+4],0A0
>004C35E4    jb          004C3619
 004C35E6    movzx       eax,word ptr [esp+2]
 004C35EB    add         eax,ebx
 004C35ED    test        eax,eax
>004C35EF    jl          004C3619
 004C35F1    movzx       eax,word ptr [esp+2]
 004C35F6    add         eax,ebx
 004C35F8    cmp         eax,0FFFF
>004C35FD    jg          004C3619
 004C35FF    movzx       edx,word ptr [esp+2]
 004C3604    add         dx,bx
 004C3607    movzx       ecx,word ptr [esp+4]
 004C360C    movzx       eax,word ptr [esp]
 004C3610    call        ColorHLSToRGB
 004C3615    mov         edi,eax
>004C3617    jmp         004C3626
 004C3619    xor         ecx,ecx
 004C361B    mov         edx,ebx
 004C361D    mov         eax,edi
 004C361F    call        ColorAdjustLuma
 004C3624    mov         edi,eax
 004C3626    call        @GetTls
 004C362B    mov         dword ptr [eax+30],ebx;{CachedShadowLum:Integer}
 004C3631    call        @GetTls
 004C3636    mov         dword ptr [eax+34],esi;{CachedShadowColor:TColor}
 004C363C    call        @GetTls
 004C3641    mov         dword ptr [eax+38],edi;{CachedShadow:TColor}
 004C3647    mov         eax,edi
 004C3649    pop         ecx
 004C364A    pop         edx
 004C364B    pop         edi
 004C364C    pop         esi
 004C364D    pop         ebx
 004C364E    ret
*}
end;

//004C3650
procedure GradientFillCanvas(const ACanvas:TCanvas; const AStartColor:TColor; const AEndColor:TColor; const ARect:TRect; const Direction:TGradientDirection);
begin
{*
 004C3650    push        ebp
 004C3651    mov         ebp,esp
 004C3653    add         esp,0FFFFFFD4
 004C3656    push        ebx
 004C3657    push        esi
 004C3658    push        edi
 004C3659    mov         dword ptr [ebp-4],ecx
 004C365C    mov         esi,edx
 004C365E    mov         edi,eax
 004C3660    mov         ebx,dword ptr [ebp+0C]
 004C3663    cmp         byte ptr ds:[793284],0;gvar_00793284
>004C366A    jne         004C36A0
 004C366C    push        4C376C
 004C3671    call        kernel32.LoadLibraryW
 004C3676    mov         [00793280],eax;gvar_00793280
 004C367B    cmp         dword ptr ds:[793280],0;gvar_00793280
>004C3682    je          004C3699
 004C3684    push        4C3784
 004C3689    mov         eax,[00793280];gvar_00793280
 004C368E    push        eax
 004C368F    call        kernel32.GetProcAddress
 004C3694    mov         [00793288],eax;gvar_00793288
 004C3699    mov         byte ptr ds:[793284],1;gvar_00793284
 004C36A0    cmp         dword ptr ds:[793288],0;gvar_00793288
>004C36A7    je          004C3763
 004C36AD    mov         eax,esi
 004C36AF    call        ColorToRGB
 004C36B4    mov         esi,eax
 004C36B6    mov         eax,dword ptr [ebp-4]
 004C36B9    call        ColorToRGB
 004C36BE    mov         edx,dword ptr [ebx]
 004C36C0    mov         dword ptr [ebp-2C],edx
 004C36C3    mov         edx,dword ptr [ebx+4]
 004C36C6    mov         dword ptr [ebp-28],edx
 004C36C9    mov         edx,esi
 004C36CB    movzx       edx,dl
 004C36CE    shl         edx,8
 004C36D1    mov         word ptr [ebp-24],dx
 004C36D5    mov         edx,esi
 004C36D7    shr         edx,10
 004C36DA    movzx       edx,dl
 004C36DD    shl         edx,8
 004C36E0    mov         word ptr [ebp-20],dx
 004C36E4    mov         edx,esi
 004C36E6    shr         edx,8
 004C36E9    movzx       edx,dl
 004C36EC    shl         edx,8
 004C36EF    mov         word ptr [ebp-22],dx
 004C36F3    mov         word ptr [ebp-1E],0
 004C36F9    mov         edx,dword ptr [ebx+8]
 004C36FC    mov         dword ptr [ebp-1C],edx
 004C36FF    mov         edx,dword ptr [ebx+0C]
 004C3702    mov         dword ptr [ebp-18],edx
 004C3705    movzx       edx,al
 004C3708    shl         edx,8
 004C370B    mov         word ptr [ebp-14],dx
 004C370F    mov         edx,eax
 004C3711    shr         edx,10
 004C3714    movzx       edx,dl
 004C3717    shl         edx,8
 004C371A    mov         word ptr [ebp-10],dx
 004C371E    shr         eax,8
 004C3721    movzx       eax,al
 004C3724    shl         eax,8
 004C3727    mov         word ptr [ebp-12],ax
 004C372B    mov         word ptr [ebp-0E],0
 004C3731    xor         eax,eax
 004C3733    mov         dword ptr [ebp-0C],eax
 004C3736    mov         dword ptr [ebp-8],1
 004C373D    movzx       eax,byte ptr [ebp+8]
 004C3741    mov         eax,dword ptr [eax*4+786378]
 004C3748    push        eax
 004C3749    push        1
 004C374B    lea         eax,[ebp-0C]
 004C374E    push        eax
 004C374F    push        2
 004C3751    lea         eax,[ebp-2C]
 004C3754    push        eax
 004C3755    mov         eax,edi
 004C3757    call        TCanvas.GetHandle
 004C375C    push        eax
 004C375D    call        dword ptr ds:[793288]
 004C3763    pop         edi
 004C3764    pop         esi
 004C3765    pop         ebx
 004C3766    mov         esp,ebp
 004C3768    pop         ebp
 004C3769    ret         8
*}
end;

Initialization
//00780A48
{*
 00780A48    sub         dword ptr ds:[79327C],1
>00780A4F    jae         00780ACD
 00780A51    call        @GetTls
 00780A56    xor         edx,edx
 00780A58    mov         dword ptr [eax+24],edx
 00780A5E    call        @GetTls
 00780A63    xor         edx,edx
 00780A65    mov         dword ptr [eax+28],edx
 00780A6B    call        @GetTls
 00780A70    xor         edx,edx
 00780A72    mov         dword ptr [eax+2C],edx
 00780A78    call        @GetTls
 00780A7D    xor         edx,edx
 00780A7F    mov         dword ptr [eax+30],edx
 00780A85    call        @GetTls
 00780A8A    xor         edx,edx
 00780A8C    mov         dword ptr [eax+34],edx
 00780A92    call        @GetTls
 00780A97    xor         edx,edx
 00780A99    mov         dword ptr [eax+38],edx
 00780A9F    call        @GetTls
 00780AA4    xor         edx,edx
 00780AA6    mov         dword ptr [eax+3C],edx
 00780AAC    call        @GetTls
 00780AB1    xor         edx,edx
 00780AB3    mov         dword ptr [eax+40],edx
 00780AB9    call        @GetTls
 00780ABE    xor         edx,edx
 00780AC0    mov         dword ptr [eax+44],edx
 00780AC6    xor         eax,eax
 00780AC8    mov         [00793288],eax;gvar_00793288
 00780ACD    ret
*}
Finalization
//004C3794
{*
 004C3794    push        ebp
 004C3795    mov         ebp,esp
 004C3797    xor         eax,eax
 004C3799    push        ebp
 004C379A    push        4C37ED
 004C379F    push        dword ptr fs:[eax]
 004C37A2    mov         dword ptr fs:[eax],esp
 004C37A5    inc         dword ptr ds:[79327C]
>004C37AB    jne         004C37DF
 004C37AD    cmp         byte ptr ds:[793284],0;gvar_00793284
>004C37B4    je          004C37CA
 004C37B6    cmp         dword ptr ds:[793280],0;gvar_00793280
>004C37BD    je          004C37CA
 004C37BF    mov         eax,[00793280];gvar_00793280
 004C37C4    push        eax
 004C37C5    call        kernel32.FreeLibrary
 004C37CA    mov         eax,785F28;gvar_00785F28:array[138] of ?
 004C37CF    mov         ecx,8A
 004C37D4    mov         edx,dword ptr ds:[4432AC];TIdentMapEntry
 004C37DA    call        @FinalizeArray
 004C37DF    xor         eax,eax
 004C37E1    pop         edx
 004C37E2    pop         ecx
 004C37E3    pop         ecx
 004C37E4    mov         dword ptr fs:[eax],edx
 004C37E7    push        4C37F4
 004C37EC    ret
>004C37ED    jmp         @HandleFinally
>004C37F2    jmp         004C37EC
 004C37F4    pop         ebp
 004C37F5    ret
*}
end.