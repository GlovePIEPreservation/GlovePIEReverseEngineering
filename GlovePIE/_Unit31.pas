//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit31;

interface

uses
  SysUtils, Classes, Controls, DwmApi, System, Dialogs, WideStrUtils, Graphics, StdCtrls, ShlObj, GraphUtil;

type
  TCommonDialog = class(TComponent)
  published
    destructor Destroy();//004D6A88
    constructor Create;//004D6A40
    function Execute:Boolean;//004D6AD8
    //procedure DefaultHandler(var Message:?);//004D6B40
    procedure Execute(ParentWnd:HWND);//004D1908
  public
    FCtl3D:Boolean;//f34
    FHelpContext:THelpContext;//f38
    FHandle:HWND;//f3C
    FRedirector:TWinControl;//f40
    FTemplateModule:Cardinal;//f44
    FOnClose:TNotifyEvent;//f48
    FOnShow:TNotifyEvent;//f50
    FDefWndProc:Pointer;//f58
    FObjectInstance:Pointer;//f5C
    FTemplate:PWideChar;//f60
    //procedure DefaultHandler(var Message:?); virtual;//004D6B40
    destructor Destroy(); virtual;//004D6A88
    constructor Create; virtual;//v2C//004D6A40
    procedure WndProc(var Message:TMessage); virtual;//v34//004D6BC4
    function GetHandle:HWND; virtual;//v38//004D6B14
    function MessageHook(var Msg:TMessage):Boolean; virtual;//v3C//004D6B18
    function TaskModalDialog(DialogFunc:Pointer; var DialogData:void ):BOOL; virtual;//v40//004D6C14
    function Execute:Boolean; virtual;//v44//004D6AD8
    procedure Execute; virtual; abstract;//v48//00404A58
    procedure WMDestroy(var Message:TWMDestroy); message WM_DESTROY;//004D6BD0
    procedure WMNCDestroy(var Message:TWMNCDestroy); message WM_NCDESTROY;//004D6C00
    procedure WMInitDialog(var Message:TWMInitDialog); message WM_INITDIALOG;//004D6BE8
    procedure DoShow; dynamic;//004D6CEC
    procedure DoClose; dynamic;//004D6CD8
    procedure MainWndProc(var Message:TMessage);//004D6B78
  end;
  TOpenOption = (ofReadOnly, ofOverwritePrompt, ofHideReadOnly, ofNoChangeDir, ofShowHelp, ofNoValidate, ofAllowMultiSelect, ofExtensionDifferent, ofPathMustExist, ofFileMustExist, ofCreatePrompt, ofShareAware, ofNoReadOnlyReturn, ofNoTestFileCreate, ofNoNetworkButton, ofNoLongNames, ofOldStyleDialog, ofNoDereferenceLinks, ofEnableIncludeNotify, ofEnableSizing, ofDontAddToRecent, ofForceShowHidden);
  TOpenOptions = set of TOpenOption;
  TOpenOptionEx = (ofExNoPlacesBar);
  TOpenOptionsEx = set of TOpenOptionEx;
  TFileEditStyle = (fsEdit, fsComboBox);
  TOFNotifyEx = TOFNotifyEx = record//size=18
f10:IShellFolder;//f10
end;
hdr:tagNMHDR;//f0
lpOFN:POpenFilenameW;//fC
psf:IShellFolder;//f10
pidl:Pointer;//f14
end;;
  TIncludeItemEvent = procedure(const OFN:TOFNotifyEx; var Include:Boolean) of object;;
  TOpenDialog = class(TCommonDialog)
  published
    destructor Destroy();//004D789C
    constructor Create;//004D7810
    function Execute(ParentWnd:HWND):Boolean;//004D7F4C
  public
    FHistoryList:TStrings;//f68
    FOptions:TOpenOptions;//f6C
    FFilter:string;//f70
    FFilterIndex:Integer;//f74
    FCurrentFilterIndex:Integer;//f78
    FInitialDir:string;//f7C
    FTitle:string;//f80
    FDefaultExt:string;//f84
    FFileName:TFileName;//f88
    FFiles:TStrings;//f8C
    FFileEditStyle:TFileEditStyle;//f90
    FOnSelectionChange:TNotifyEvent;//f98
    FOnFolderChange:TNotifyEvent;//fA0
    FOnTypeChange:TNotifyEvent;//fA8
    FOnCanClose:TCloseQueryEvent;//fB0
    FOnIncludeItem:TIncludeItemEvent;//fB8
    FOptionsEx:TOpenOptionsEx;//fC0
    FInternalWrapper:TObject;//fC4
    destructor Destroy(); virtual;//004D789C
    procedure DefineProperties(Filer:TFiler); virtual;//v4//004D7AD8
    constructor Create; virtual;//v2C//004D7810
    procedure WndProc(var Message:TMessage); virtual;//v34//004D7904
    function GetHandle:HWND; virtual;//v38//004D7E4C
    function Execute(ParentWnd:HWND):Boolean; virtual;//v48//004D7F4C
    function GetStaticRect:TRect; virtual;//v4C//004D7D78
    procedure DoIncludeItem(const OFN:TOFNotifyEx; var Include:Boolean); dynamic;//004D83A0
    procedure DoSelectionChange; dynamic;//004D7A3C
    procedure DoCanClose; dynamic;//004D7A10
    function CanClose(var OpenFileName:TOpenFilename):Boolean;//004D78D4
    procedure ReadFileEditStyle(Reader:TReader);//004D7A9C
    procedure GetFileNames(var OpenFileName:TOpenFilename);//004D7CA4
    function GetFiles:TStrings;//004D7D70
    function GetFileName:TFileName;//004D7DCC
    function GetFilterIndex:Integer;//004D7E3C
    function GetInitialDir:UnicodeString;//004D7E64
    procedure SetFileName(Value:TFileName);//004D7E78
    procedure SetHistoryList(Value:TStrings);//004D7ED8
    procedure SetInitialDir(const Value:UnicodeString);//004D7EEC
    function DoExecute(Func:Pointer; ParentWnd:HWND):BOOL;//004D7FD0
  end;
  TSaveDialog = class(TOpenDialog)
  published
    function Execute(ParentWnd:HWND):Boolean;//004D83BC
  public
    function Execute(ParentWnd:HWND):Boolean; virtual;//v48//004D83BC
  end;
  TFindOption = (frDown, frFindNext, frHideMatchCase, frHideWholeWord, frHideUpDown, frMatchCase, frDisableMatchCase, frDisableUpDown, frDisableWholeWord, frReplace, frReplaceAll, frWholeWord, frShowHelp);
  TFindOptions = set of TFindOption;
  TFindDialog = class(TCommonDialog)
  published
    function Execute(ParentWnd:HWND):Boolean;//004D8690
    destructor Destroy();//004D8600
    constructor Create;//004D8554
    procedure CloseDialog;//004D863C
  public
    FOptions:TFindOptions;//f68
    f69:byte;//f69
    FPosition:TPoint;//f6C
    FOnFind:TNotifyEvent;//f78
    FOnReplace:TNotifyEvent;//f80
    FFindReplaceFunc:TFindReplaceFunc;//f88
    FFindHandle:HWND;//f8C
    FFindReplace:tagFINDREPLACEW;//f90
    FFindText:?;//fB8
    FReplaceText:?;//f2B8
    destructor Destroy(); virtual;//004D8600
    constructor Create; virtual;//v2C//004D8554
    function MessageHook(var Msg:TMessage):Boolean; virtual;//v3C//004D8810
    function Execute(ParentWnd:HWND):Boolean; virtual;//v48//004D8690
    procedure Replace; dynamic;//004D88F4
    function GetFindText:UnicodeString;//004D8774
    function GetLeft:Integer;//004D8790
    function GetPosition:TPoint;//004D87A8
    function GetReplaceText:UnicodeString;//004D87DC
    function GetTop:Integer;//004D87F8
    procedure SetFindText(const Value:UnicodeString);//004D8914
    procedure SetLeft(Value:Integer);//004D8938
    procedure SetPosition(const Value:TPoint);//004D8960
    procedure SetReplaceText(const Value:UnicodeString);//004D899C
    procedure SetTop(Value:Integer);//004D89C0
  end;
  TReplaceDialog = class(TFindDialog)
  published
    constructor Create;//004D89E8
  public
    constructor Create; virtual;//v2C//004D89E8
  end;
  EPlatformVersionException = class(Exception)
  end;
  TFileDialogOption = (fdoOverWritePrompt, fdoStrictFileTypes, fdoNoChangeDir, fdoPickFolders, fdoForceFileSystem, fdoAllNonStorageItems, fdoNoValidate, fdoAllowMultiSelect, fdoPathMustExist, fdoFileMustExist, fdoCreatePrompt, fdoShareAware, fdoNoReadOnlyReturn, fdoNoTestFileCreate, fdoHideMRUPlaces, fdoHidePinnedPlaces, fdoNoDereferenceLinks, fdoDontAddToRecent, fdoForceShowHidden, fdoDefaultNoMiniMode, fdoForcePreviewPaneOn);
  TFileDialogOptions = set of TFileDialogOption;
  TFileDialogOverwriteResponse = (forDefault, forAccept, forRefuse);
  TFileDialogShareViolationResponse = (fsrDefault, fsrAccept, fsrRefuse);
  TFileDialogCloseEvent = procedure(Sender:TObject; var CanClose:Boolean) of object;;
  TFileDialogFolderChangingEvent = procedure(Sender:TObject; var CanChange:Boolean) of object;;
  TFileDialogOverwriteEvent = procedure(Sender:TObject; var Response:TFileDialogOverwriteResponse) of object;;
  TFileDialogShareViolationEvent = procedure(Sender:TObject; var Response:TFileDialogShareViolationResponse) of object;;
  TFileTypeItem = class(TCollectionItem)
  published
    destructor Destroy();//004D8ADC
    constructor Create;//004D8A9C
  public
    FDisplayName:string;//fC
    FDisplayNameWStr:PWideChar;//f10
    FFileMask:string;//f14
    FFileMaskWStr:PWideChar;//f18
    destructor Destroy(); virtual;//004D8ADC
    constructor Create; virtual;//v1C//004D8A9C
    function GetDisplayNameWStr:LPCWSTR;//004D8B1C
    function GetFileMaskWStr:LPCWSTR;//004D8B68
  end;
  TFileTypeItems = class(TCollection)
  published
    function FilterSpecArray:TComdlgFilterSpecArray;//004D8B98
    function Add:TFileTypeItem;//004D8B8C
    function GetItem(Index:Integer):TFileTypeItem;//004D8C00
  end;
  TFavoriteLinkItem = class(TCollectionItem)
  public
    FLocation:string;//fC
  end;
  TFavoriteLinkItemsEnumerator = class(TObject)
  published
    function MoveNext:Boolean;//004D8C64
    function GetCurrent:TFavoriteLinkItem;//004D8C58
    constructor Create;//004D8C14
  public
    FIndex:Integer;//f4
    FCollection:TFavoriteLinkItems;//f8
  end;
  TFavoriteLinkItems = class(TCollection)
  published
    function GetEnumerator:TFavoriteLinkItemsEnumerator;//004D8CB4
    function Add:TFavoriteLinkItem;//004D8CA8
    function GetItem(Index:Integer):TFavoriteLinkItem;//004D8CC4
  end;
  TCustomFileDialog = class(TComponent)
  published
    function Execute:Boolean;//004D945C
    function Execute(ParentWnd:HWND):Boolean;//004D94AC
    constructor Create;//004D9268
    destructor Destroy();//004D9300
  public
    FClientGuid:string;//f34
    FDefaultExtension:string;//f38
    FDefaultFolder:string;//f3C
    FDialog:IFileDialog;//f40
    FFavoriteLinks:TFavoriteLinkItems;//f44
    FFileName:TFileName;//f48
    FFileNameLabel:string;//f4C
    FFiles:TStrings;//f50
    FFileTypeIndex:Cardinal;//f54
    FFileTypes:TFileTypeItems;//f58
    FHandle:HWND;//f5C
    FOkButtonLabel:string;//f60
    FOptions:TFileDialogOptions;//f64
    FShellItem:IShellItem;//f68
    FShellItems:IShellItemArray;//f6C
    FTitle:string;//f70
    FOnExecute:TNotifyEvent;//f78
    FOnFileOkClick:TFileDialogCloseEvent;//f80
    FOnFolderChange:TNotifyEvent;//f88
    FOnFolderChanging:TFileDialogFolderChangingEvent;//f90
    FOnOverwrite:TFileDialogOverwriteEvent;//f98
    FOnSelectionChange:TNotifyEvent;//fA0
    FOnShareViolation:TFileDialogShareViolationEvent;//fA8
    FOnTypeChange:TNotifyEvent;//fB0
    destructor Destroy(); virtual;//004D9300
    constructor Create; virtual;//v2C//004D9268
    procedure CreateFileDialog; virtual; abstract;//v34//00404A58
    function GetResults:HRESULT; virtual;//v38//004D9E40
    function Execute:Boolean; virtual;//v3C//004D945C
    function Execute(ParentWnd:HWND):Boolean; virtual;//v40//004D94AC
    procedure TypeChange; dynamic;//004DA12C
    procedure ShareViolation(psiFile:IShellItem; var Response:Cardinal); dynamic;//004DA08C
    procedure SelectionChange; dynamic;//004D9F98
    procedure Overwrite(psiFile:IShellItem; var Response:Cardinal); dynamic;//004D9EF8
    procedure FolderChanging(psiFolder:IShellItem); dynamic;//004D9A10
    procedure FolderChange; dynamic;//004D99B8
    procedure FileOkClick; dynamic;//004D997C
    procedure GetItemName(Item:IShellItem; var ItemName:TFileName); dynamic;//004D9D78
    procedure GetFileNames(Items:IShellItemArray); dynamic;//004D9C18
    procedure DoOnTypeChange; dynamic;//004D943C
    procedure DoOnShareViolation(var Response:TFileDialogShareViolationResponse); dynamic;//004D941C
    procedure DoOnOverwrite(var Response:TFileDialogOverwriteResponse); dynamic;//004D93DC
    procedure DoOnFolderChanging; dynamic;//004D93B0
    procedure DoOnFolderChange; dynamic;//004D9390
    procedure DoOnFileOkClick; dynamic;//004D9364
    function GetDefaultFolder:UnicodeString;//004D9AA0
    function GetFileName:TFileName;//004D9AB4
    function GetFiles:TStrings;//004D9D74
    procedure GetWindowHandle;//004D9E88
    procedure SetClientGuid(const Value:UnicodeString);//004D9FF0
    procedure SetDefaultFolder(const Value:UnicodeString);//004DA024
    procedure SetFileName(const Value:TFileName);//004DA044
    procedure SetFileTypes(const Value:TFileTypeItems);//004DA064
    procedure SetFavoriteLinks(const Value:TFavoriteLinkItems);//004DA078
  end;
  TCustomFileOpenDialog = class(TCustomFileDialog)
  public
    function CreateFileDialog:IFileDialog; virtual;//v34//004DA164
    function GetResults:HRESULT; virtual;//v38//004DA208
    procedure SelectionChange; dynamic;//004DA29C
  end;
  TFileOpenDialog = class(TCustomFileOpenDialog)
  end;
  TCustomFileSaveDialog = class(TCustomFileDialog)
  public
    function CreateFileDialog:IFileDialog; virtual;//v34//004DA35C
  end;
  TFileSaveDialog = class(TCustomFileSaveDialog)
  end;
  TTaskDialogFlag = (tfEnableHyperlinks, tfUseHiconMain, tfUseHiconFooter, tfAllowDialogCancellation, tfUseCommandLinks, tfUseCommandLinksNoIcon, tfExpandFooterArea, tfExpandedByDefault, tfVerificationFlagChecked, tfShowProgressBar, tfShowMarqueeProgressBar, tfCallbackTimer, tfPositionRelativeToWindow, tfRtlLayout, tfNoDefaultRadioButton, tfCanBeMinimized);
  TTaskDialogFlags = set of TTaskDialogFlag;
  TTaskDialogCommonButton = (tcbOk, tcbYes, tcbNo, tcbCancel, tcbRetry, tcbClose);
  TTaskDialogCommonButtons = set of TTaskDialogCommonButton;
  TTaskDialogProgressBar = class(TPersistent)
  published
    procedure Initialize;//004DA69C
    constructor Create;//004DA400
  public
    FClient:TCustomTaskDialog;//f4
    FMarqueeSpeed:Cardinal;//f8
    FMax:Integer;//fC
    FMin:Integer;//f10
    FPosition:Integer;//f14
    FState:TProgressBarState;//f18
    procedure SetMax(const Value:Integer);//004DA458
    procedure SetMin(const Value:Integer);//004DA514
    procedure SetPosition(const Value:Integer);//004DA5D0
    procedure SetState(const Value:TProgressBarState);//004DA640
    procedure SetMarqueeSpeed(const Value:Cardinal);//004DA670
  end;
  TTaskDialogBaseButtonItem = class(TCollectionItem)
  published
    procedure Click;//004DA804
    procedure SetInitialState;//004DA91C
    constructor Create;//004DA734
    destructor Destroy();//004DA794
  public
    FCaption:string;//fC
    FClient:TCustomTaskDialog;//f10
    FEnabled:Boolean;//f14
    FModalResult:TModalResult;//f18
    FTextWStr:PWideChar;//f1C
    destructor Destroy(); virtual;//004DA794
    function GetDisplayName:UnicodeString; virtual;//vC//004DA82C
    constructor Create; virtual;//v1C//004DA734
    procedure DoButtonClick; virtual;//v20//004DA7C8
    procedure DoSetEnabled; virtual;//v24//004DA7E4
    function GetButtonText:UnicodeString; virtual;//v28//004DA80C
    procedure SetInitialState; virtual;//v2C//004DA91C
    function GetDefault:Boolean;//004DA820
    function GetTextWStr:LPCWSTR;//004DA850
    procedure SetCaption(const Value:UnicodeString);//004DA8B4
    procedure SetDefault(const Value:Boolean);//004DA8F0
    procedure SetEnabled(const Value:Boolean);//004DA90C
  end;
  TTaskDialogButtonItem = class(TTaskDialogBaseButtonItem)
  published
    procedure SetInitialState;//004DAA5C
    constructor Create;//004DA928
  public
    FCommandLinkHint:string;//f20
    FElevationRequired:Boolean;//f24
    constructor Create; virtual;//v1C//004DA928
    function GetButtonText:UnicodeString; virtual;//v28//004DA9F8
    procedure SetInitialState; virtual;//v2C//004DAA5C
    procedure DoSetElevationRequired;//004DA9D8
    procedure SetElevationRequired(const Value:Boolean);//004DAA4C
  end;
  TTaskDialogRadioButtonItem = class(TTaskDialogBaseButtonItem)
  published
    constructor Create;//004DAA78
  public
    constructor Create; virtual;//v1C//004DAA78
    procedure DoButtonClick; virtual;//v20//004DAB24
    procedure DoSetEnabled; virtual;//v24//004DAB40
  end;
  TTaskDialogButtonList = array of TASKDIALOG_BUTTON;
//elSize = 8;
  TTaskDialogButtonsEnumerator = class(TObject)
  published
    function MoveNext:Boolean;//004DABB0
    function GetCurrent:TTaskDialogBaseButtonItem;//004DABA4
    constructor Create;//004DAB60
  public
    FIndex:Integer;//f4
    FCollection:TTaskDialogButtons;//f8
  end;
  TTaskDialogButtons = class(TOwnedCollection)
  published
    function GetEnumerator:TTaskDialogButtonsEnumerator;//004DACE4
    procedure SetInitialState;//004DAD14
    function FindButton(AModalResult:TModalResult):TTaskDialogBaseButtonItem;//004DAC68
    destructor Destroy();//004DABCC
    function Add:TTaskDialogBaseButtonItem;//004DABF4
    function Buttons:PTaskDialogButton;//004DAC00
  public
    FButtonList:TTaskDialogButtonList;//f1C
    FButtonListPtr:PTaskDialogButton;//f20
    FDefaultButton:TTaskDialogBaseButtonItem;//f24
    destructor Destroy(); virtual;//004DABCC
    procedure SetInitialState; dynamic;//004DAD14
    function GetItem(Index:Integer):TTaskDialogBaseButtonItem;//004DACF4
    procedure SetDefaultButton(const Value:TTaskDialogBaseButtonItem);//004DAD08
  end;
  TTaskDlgClickEvent = procedure(Sender:TObject; ModalResult:TModalResult; var CanClose:Boolean) of object;;
  TTaskDlgTimerEvent = procedure(Sender:TObject; TickCount:Cardinal; var Reset:Boolean) of object;;
  TCustomTaskDialog = class(TComponent)
  published
    procedure Execute;//004DB668
    procedure Execute(ParentWnd:HWND);//004DB6B8
    constructor Create;//004DAD78
    destructor Destroy();//004DAE40
  public
    FButton:TTaskDialogButtonItem;//f34
    FButtons:TTaskDialogButtons;//f38
    FCaption:string;//f3C
    FCommonButtons:TTaskDialogCommonButtons;//f40
    FCustomFooterIcon:TIcon;//f44
    FCustomMainIcon:TIcon;//f48
    FDefaultButton:TTaskDialogCommonButton;//f4C
    FExpandButtonCaption:string;//f50
    FExpanded:Boolean;//f54
    FExpandedText:string;//f58
    FFlags:TTaskDialogFlags;//f5C
    FFooterIcon:TTaskDialogIcon;//f60
    FFooterText:string;//f64
    FHandle:HWND;//f68
    FHelpContext:Integer;//f6C
    FMainIcon:TTaskDialogIcon;//f70
    FModalResult:TModalResult;//f74
    FProgressBar:TTaskDialogProgressBar;//f78
    FRadioButton:TTaskDialogRadioButtonItem;//f7C
    FRadioButtons:TTaskDialogButtons;//f80
    FText:string;//f84
    FTitle:string;//f88
    FURL:string;//f8C
    FVerificationText:string;//f90
    FOnButtonClicked:TTaskDlgClickEvent;//f98
    FOnDialogConstructed:TNotifyEvent;//fA0
    FOnDialogCreated:TNotifyEvent;//fA8
    FOnDialogDestroyed:TNotifyEvent;//fB0
    FOnExpanded:TNotifyEvent;//fB8
    FOnHyperlinkClicked:TNotifyEvent;//fC0
    FOnNavigated:TNotifyEvent;//fC8
    FOnRadioButtonClicked:TNotifyEvent;//fD0
    FOnTimer:TTaskDlgTimerEvent;//fD8
    FOnVerificationClicked:TNotifyEvent;//fE0
    destructor Destroy(); virtual;//004DAE40
    constructor Create; virtual;//v2C//004DAD78
    procedure Execute(ParentWnd:HWND); dynamic;//004DB6B8
    procedure Execute; dynamic;//004DB668
    procedure CallbackProc(hwnd:HWND; msg:UINT; wParam:WPARAM; lParam:LPARAM; lpRefData:LONG_PTR); dynamic;//004DAE90
    procedure ShowHelpException(E:Exception); dynamic;//004DB8D0
    procedure DoOnVerificationClicked(Checked:Boolean); dynamic;//004DB638
    procedure DoOnTimer(TickCount:Cardinal; var Reset:Boolean); dynamic;//004DB618
    procedure DoOnRadioButtonClicked(ButtonID:Integer); dynamic;//004DB5E4
    procedure DoOnNavigated; dynamic;//004DB5C4
    procedure DoOnHyperlinkClicked(const AURL:UnicodeString); dynamic;//004DB594
    procedure DoOnHelp; dynamic;//004DB52C
    procedure DoOnExpandButtonClicked(Expanded:Boolean); dynamic;//004DB50C
    procedure DoOnDialogDestroyed; dynamic;//004DB4CC
    procedure DoOnButtonClicked(AModalResult:Integer; var CanClose:Boolean); dynamic;//004DB474
    procedure DoExecute(ParentWnd:HWND); dynamic;//004DB050
    procedure SetButtons(const Value:TTaskDialogButtons);//004DB6D0
    procedure SetCustomFooterIcon(const Value:TIcon);//004DB6E8
    procedure SetCustomMainIcon(const Value:TIcon);//004DB6FC
    procedure SetExpandedText(const Value:UnicodeString);//004DB710
    procedure SetFlags(const Value:TTaskDialogFlags);//004DB74C
    procedure SetFooterIcon(const Value:TTaskDialogIcon);//004DB7A8
    procedure SetFooterText(const Value:UnicodeString);//004DB7D0
    procedure SetMainIcon(const Value:TTaskDialogIcon);//004DB80C
    procedure SetRadioButtons(const Value:TTaskDialogButtons);//004DB834
    procedure SetText(const Value:UnicodeString);//004DB84C
    procedure SetTitle(const Value:UnicodeString);//004DB88C
  end;
  TRedirectorWindow = class(TWinControl)
  public
    FCommonDialog:TCommonDialog;//f270
    FFormHandle:Cardinal;//f274
    procedure WndProc(var Message:TMessage); virtual;//v84//004D69CC
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004D69A8
    procedure CMRelease; message CM_RELEASE;//004D6A38
  end;
  TFileDialogWrapper = class(TObject)
  published
    function Execute(ParentWnd:HWND):Boolean;//004D72C0
    destructor Destroy();//004D7078
    constructor Create;//004D7030
  public
    FFileDialog:TCustomFileDialog;//f4
    FOpenDialog:TOpenDialog;//f8
    destructor Destroy(); virtual;//004D7078
    procedure CreateFileDialog; virtual; abstract;//v0//00404A58
    procedure AssignFileTypes;//004D70A8
    procedure AssignOptions;//004D7268
    function GetFileName:TFileName;//004D7504
    function GetHandle:HWND;//004D7518
    procedure HandleShareViolation(Sender:TObject; var Response:TFileDialogShareViolationResponse);//004D7520
    procedure OnFileOkEvent(Sender:TObject; var CanClose:Boolean);//004D7524
    procedure OnFolderChangeEvent(Sender:TObject);//004D75B0
    procedure OnSelectionChangeEvent(Sender:TObject);//004D7610
    procedure OnTypeChangeEvent(Sender:TObject);//004D7688
  end;
  TFileOpenDialogWrapper = class(TFileDialogWrapper)
  public
    function CreateFileDialog:TCustomFileDialog; virtual;//v0//004D76A8
    procedure OnExecuteEvent(Sender:TObject);//004D76C8
  end;
  TFileSaveDialogWrapper = class(TFileDialogWrapper)
  public
    function CreateFileDialog:TCustomFileDialog; virtual;//v0//004D7780
  end;
  TFileDialogEvents = class(TInterfacedObject)
  published
    function OnShareViolation(pfd:IFileDialog; psi:IShellItem; pResponse:Cardinal):HRESULT; stdcall;//004D9208
    function OnSelectionChange(pfd:IFileDialog):HRESULT; stdcall;//004D91C8
    function OnOverwrite(pfd:IFileDialog; psi:IShellItem; pResponse:Cardinal):HRESULT; stdcall;//004D9194
    function OnTypeChange(pfd:IFileDialog):HRESULT; stdcall;//004D923C
    function OnFileOk(pfd:IFileDialog):HRESULT; stdcall;//004D910C
    constructor Create;//004D90CC
    function OnFolderChange(pfd:IFileDialog):HRESULT; stdcall;//004D9138
    function OnFolderChanging(pfd:IFileDialog; psiFolder:IShellItem):HRESULT; stdcall;//004D9164
  public
    FFileDialog:TCustomFileDialog;//fC
    FRetrieveHandle:Boolean;//f10
  end;
  :TCustomFileDialog.:1 = array of IShellItem;
//elSize = 4
//varType equivalent: varUnknown;
  TMessageForm = class(TForm)
  published
    constructor CreateNew(Dummy:Integer);//004DBC40
  public
    Message:TLabel;//f388
    constructor CreateNew(Dummy:Integer); virtual;//v108//004DBC40
    procedure HelpButtonClick(Sender:TObject);//004DBC94
    procedure CustomKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);//004DBCAC
    procedure WriteToClipBoard(Text:UnicodeString);//004DBD1C
    function GetFormText:UnicodeString;//004DBE6C
  end;
  TTaskMessageDialog = class(TCustomTaskDialog)
  published
    procedure Execute(ParentWnd:HWND);//004DCCC4
  public
    FHelpFile:string;//fE8
    FParentWnd:HWND;//fEC
    FPosition:TPoint;//fF0
    procedure Execute(ParentWnd:HWND); dynamic;//004DCCC4
    procedure DoOnHelp; dynamic;//004DCBCC
    procedure DoOnDialogCreated; dynamic;//004DCB28
    procedure DoOnButtonClicked(AModalResult:Integer; var CanClose:Boolean); dynamic;//004DCB14
  end;
    function WStrAlloc(Size:Cardinal):PWideChar;//004D1188
    function WStrMove(Dest:PWideChar; const Source:PWideChar; Count:Cardinal):PWideChar;//004D11A0
    function WStrNew(const Str:PWideChar):PWideChar;//004D11B0
    function WStrLen(const Str:PWideChar):Cardinal;//004D11DC
    function WStrEnd(const Str:PWideChar):PWideChar;//004D11F8
    function WStrLCopy(Dest:PWideChar; const Source:PWideChar; MaxLen:Cardinal):PWideChar;//004D1204
    function WStrPLCopy(Dest:PWideChar; const Source:WideString; MaxLen:Cardinal):PWideChar;//004D122C
    function WStrScan(Str:PWideChar; Chr:WideChar):PWideChar;//004D124C
    function WideQuotedStr(const S:WideString; Quote:WideChar):WideString;//004D1264
    function WideExtractQuotedStr(var Src:PWideChar; Quote:WideChar):WideString;//004D13E4
    function InOpSet(W:WideChar; const Sets:CharSet):Boolean;//004D151C
    function ApplicationMainHandle:HWND;//004D668C
    procedure CenterWindow(Wnd:HWND);//004D66C4
    function DialogHook(Wnd:HWND; Msg:UINT; WParam:WPARAM; LParam:LPARAM):UINT; stdcall;//004D6778
    procedure CreateParams(var Params:TCreateParams);//004D69A8
    procedure WndProc(var Message:TMessage);//004D69CC
    procedure CMRelease;//004D6A38
    function GetHandle:HWND;//004D6B14
    function MessageHook(var Msg:TMessage):Boolean;//004D6B18
    procedure WndProc(var Message:TMessage);//004D6BC4
    procedure WMDestroy(var Message:TWMDestroy);//004D6BD0
    procedure WMInitDialog(var Message:TWMInitDialog);//004D6BE8
    procedure WMNCDestroy(var Message:TWMNCDestroy);//004D6C00
    function TaskModalDialog(DialogFunc:Pointer; var DialogData:void ):BOOL;//004D6C14
    procedure DoClose;//004D6CD8
    procedure DoShow;//004D6CEC
    function CreateFileDialog:TCustomFileDialog;//004D76A8
    function CreateFileDialog:TCustomFileDialog;//004D7780
    function ExplorerHook(Wnd:HWND; Msg:UINT; WParam:WPARAM; LParam:LPARAM):UINT; stdcall;//004D7790
    procedure WndProc(var Message:TMessage);//004D7904
    procedure DoCanClose;//004D7A10
    procedure DoSelectionChange;//004D7A3C
    procedure DoOnSelectionChange;//004D7A5C
    procedure DoOnDialogCreated;//004D7A7C
    procedure DefineProperties(Filer:TFiler);//004D7AD8
    function ExtractFileName(P:PChar; var S:TFileName):PChar;//004D7B2C
    procedure ExtractFileNames(P:PChar);//004D7B80
    function GetStaticRect:TRect;//004D7D78
    function GetHandle:HWND;//004D7E4C
    function AllocFilterStr(const S:UnicodeString):UnicodeString;//004D7F6C
    procedure DoIncludeItem(const OFN:TOFNotifyEx; var Include:Boolean);//004D83A0
    function CallDefWndProc:LongInt;//004D83DC
    function FindReplaceWndProc(Wnd:HWND; Msg:LongInt; WParam:LongInt; LParam:LongInt):LongInt; stdcall;//004D8418
    function FindReplaceDialogHook(Wnd:HWND; Msg:UINT; WParam:WPARAM; LParam:LPARAM):UINT; stdcall;//004D84CC
    function GetTopWindow(Wnd:THandle; var ReturnVar:THandle):BOOL; stdcall;//004D8654
    procedure DoOnExecute;//004D8760
    function MessageHook(var Msg:TMessage):Boolean;//004D8810
    procedure Replace;//004D88F4
    function AllocCoTaskMemStr(const S:UnicodeString):LPCWSTR;//004D8A28
    function GetDisplayName:UnicodeString;//004D8B40
    function GetDisplayName:UnicodeString;//004D8C80
    procedure Find;//004D9350
    procedure DoOnFileOkClick;//004D9364
    procedure DoOnFolderChange;//004D9390
    procedure DoOnFolderChanging;//004D93B0
    procedure DoOnOverwrite(var Response:TFileDialogOverwriteResponse);//004D93DC
    procedure DoOnDialogContructed;//004D93FC
    procedure DoOnShareViolation(var Response:TFileDialogShareViolationResponse);//004D941C
    procedure DoOnTypeChange;//004D943C
    procedure FileOkClick;//004D997C
    procedure FolderChange;//004D99B8
    procedure FolderChanging(psiFolder:IShellItem);//004D9A10
    procedure GetFileNames(Items:IShellItemArray);//004D9C18
    procedure GetItemName(Item:IShellItem; var ItemName:TFileName);//004D9D78
    function GetResults:HRESULT;//004D9E40
    procedure Overwrite(psiFile:IShellItem; var Response:Cardinal);//004D9EF8
    procedure SelectionChange;//004D9F98
    procedure ShareViolation(psiFile:IShellItem; var Response:Cardinal);//004DA08C
    procedure TypeChange;//004DA12C
    function CreateFileDialog:IFileDialog;//004DA164
    function GetResults:HRESULT;//004DA208
    procedure SelectionChange;//004DA29C
    function CreateFileDialog:IFileDialog;//004DA35C
    procedure DoButtonClick;//004DA7C8
    procedure DoSetEnabled;//004DA7E4
    function GetButtonText:UnicodeString;//004DA80C
    function GetDisplayName:UnicodeString;//004DA82C
    function GetButtonText:UnicodeString;//004DA9F8
    procedure DoButtonClick;//004DAB24
    procedure DoSetEnabled;//004DAB40
    procedure CallbackProc(hwnd:HWND; msg:UINT; wParam:WPARAM; lParam:LPARAM; lpRefData:LONG_PTR);//004DAE90
    function TaskDialogCallbackProc(hwnd:HWND; msg:UINT; wParam:WPARAM; lParam:LPARAM; lpRefData:LONG_PTR):HRESULT; stdcall;//004DB028
    procedure DoExecute(ParentWnd:HWND);//004DB050
    procedure DoOnButtonClicked(AModalResult:Integer; var CanClose:Boolean);//004DB474
    procedure DoTypeChange;//004DB4AC
    procedure DoOnDialogDestroyed;//004DB4CC
    procedure DoFolderChange;//004DB4EC
    procedure DoOnExpandButtonClicked(Expanded:Boolean);//004DB50C
    procedure DoOnHelp;//004DB52C
    procedure DoOnHyperlinkClicked(const AURL:UnicodeString);//004DB594
    procedure DoOnNavigated;//004DB5C4
    procedure DoOnRadioButtonClicked(ButtonID:Integer);//004DB5E4
    procedure DoOnTimer(TickCount:Cardinal; var Reset:Boolean);//004DB618
    procedure DoOnVerificationClicked(Checked:Boolean);//004DB638
    procedure ShowHelpException(E:Exception);//004DB8D0
    function GetAveCharSize(Canvas:TCanvas):TPoint;//004DB9CC
    function CreateMessageDialog(const Msg:UnicodeString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; DefaultButton:TMsgDlgBtn):TForm;//004DC1D0
    function CreateMessageDialog(const Msg:UnicodeString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons):TForm;//004DC7AC
    function MessageDlg(const Msg:UnicodeString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:LongInt):Integer;//004DC7D4
    function DoMessageDlgPosHelp(MessageDialog:TForm; HelpCtx:LongInt; X:Integer; Y:Integer; const HelpFileName:UnicodeString):Integer;//004DC7F4
    function MessageDlgPosHelp(const Msg:UnicodeString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:LongInt; X:Integer; Y:Integer; const HelpFileName:UnicodeString):Integer;//004DC890
    procedure ShowMessage(const Msg:UnicodeString);//004DC90C
    procedure ShowMessagePos(const Msg:UnicodeString; X:Integer; Y:Integer);//004DC918
    procedure DoOnButtonClicked(AModalResult:Integer; var CanClose:Boolean);//004DCB14
    procedure DoOnDialogCreated;//004DCB28
    procedure DoOnHelp;//004DCBCC
    function DoTaskMessageDlgPosHelp(const Instruction:UnicodeString; const Msg:UnicodeString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:LongInt; X:Integer; Y:Integer; const HelpFileName:UnicodeString; DefaultButton:TMsgDlgBtn):Integer;//004DCCD0
    function DoTaskMessageDlgPosHelp(const Instruction:UnicodeString; const Msg:UnicodeString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:LongInt; X:Integer; Y:Integer; const HelpFileName:UnicodeString):Integer;//004DCEBC
    procedure InitGlobals;//004DCF08

implementation

//004D1188
function WStrAlloc(Size:Cardinal):PWideChar;
begin
{*
 004D1188    push        ebx
 004D1189    mov         ebx,eax
 004D118B    add         ebx,ebx
 004D118D    add         ebx,4
 004D1190    mov         eax,ebx
 004D1192    call        @GetMem
 004D1197    mov         dword ptr [eax],ebx
 004D1199    add         eax,4
 004D119C    pop         ebx
 004D119D    ret
*}
end;

//004D11A0
function WStrMove(Dest:PWideChar; const Source:PWideChar; Count:Cardinal):PWideChar;
begin
{*
 004D11A0    push        esi
 004D11A1    mov         esi,eax
 004D11A3    add         ecx,ecx
 004D11A5    xchg        eax,edx
 004D11A6    call        Move
 004D11AB    mov         eax,esi
 004D11AD    pop         esi
 004D11AE    ret
*}
end;

//004D11B0
function WStrNew(const Str:PWideChar):PWideChar;
begin
{*
 004D11B0    push        ebx
 004D11B1    push        esi
 004D11B2    mov         ebx,eax
 004D11B4    test        ebx,ebx
>004D11B6    jne         004D11BD
 004D11B8    xor         eax,eax
 004D11BA    pop         esi
 004D11BB    pop         ebx
 004D11BC    ret
 004D11BD    mov         eax,ebx
 004D11BF    call        WStrLen
 004D11C4    mov         esi,eax
 004D11C6    inc         esi
 004D11C7    mov         eax,esi
 004D11C9    call        WStrAlloc
 004D11CE    mov         ecx,esi
 004D11D0    mov         edx,ebx
 004D11D2    call        WStrMove
 004D11D7    pop         esi
 004D11D8    pop         ebx
 004D11D9    ret
*}
end;

//004D11DC
function WStrLen(const Str:PWideChar):Cardinal;
begin
{*
 004D11DC    mov         edx,eax
>004D11DE    jmp         004D11E3
 004D11E0    add         edx,2
 004D11E3    cmp         word ptr [edx],0
>004D11E7    jne         004D11E0
 004D11E9    sub         edx,eax
 004D11EB    sar         edx,1
>004D11ED    jns         004D11F2
 004D11EF    adc         edx,0
 004D11F2    mov         eax,edx
 004D11F4    ret
*}
end;

//004D11F8
function WStrEnd(const Str:PWideChar):PWideChar;
begin
{*
>004D11F8    jmp         004D11FD
 004D11FA    add         eax,2
 004D11FD    cmp         word ptr [eax],0
>004D1201    jne         004D11FA
 004D1203    ret
*}
end;

//004D1204
function WStrLCopy(Dest:PWideChar; const Source:PWideChar; MaxLen:Cardinal):PWideChar;
begin
{*
 004D1204    push        esi
 004D1205    push        edi
 004D1206    mov         edi,eax
>004D1208    jmp         004D1214
 004D120A    mov         word ptr [eax],si
 004D120D    add         edx,2
 004D1210    add         eax,2
 004D1213    dec         ecx
 004D1214    movzx       esi,word ptr [edx]
 004D1217    test        si,si
>004D121A    je          004D1220
 004D121C    test        ecx,ecx
>004D121E    ja          004D120A
 004D1220    mov         word ptr [eax],0
 004D1225    mov         eax,edi
 004D1227    pop         edi
 004D1228    pop         esi
 004D1229    ret
*}
end;

//004D122C
function WStrPLCopy(Dest:PWideChar; const Source:WideString; MaxLen:Cardinal):PWideChar;
begin
{*
 004D122C    push        ebx
 004D122D    push        esi
 004D122E    push        edi
 004D122F    mov         edi,ecx
 004D1231    mov         esi,edx
 004D1233    mov         ebx,eax
 004D1235    mov         eax,esi
 004D1237    call        @WStrToPWChar
 004D123C    mov         edx,eax
 004D123E    mov         ecx,edi
 004D1240    mov         eax,ebx
 004D1242    call        WStrLCopy
 004D1247    pop         edi
 004D1248    pop         esi
 004D1249    pop         ebx
 004D124A    ret
*}
end;

//004D124C
function WStrScan(Str:PWideChar; Chr:WideChar):PWideChar;
begin
{*
>004D124C    jmp         004D1259
 004D124E    test        cx,cx
>004D1251    jne         004D1256
 004D1253    xor         eax,eax
 004D1255    ret
 004D1256    add         eax,2
 004D1259    movzx       ecx,word ptr [eax]
 004D125C    cmp         dx,cx
>004D125F    jne         004D124E
 004D1261    ret
*}
end;

//004D1264
function WideQuotedStr(const S:WideString; Quote:WideChar):WideString;
begin
{*
 004D1264    push        ebp
 004D1265    mov         ebp,esp
 004D1267    push        0
 004D1269    push        0
 004D126B    push        0
 004D126D    push        0
 004D126F    push        0
 004D1271    push        0
 004D1273    push        ebx
 004D1274    push        esi
 004D1275    push        edi
 004D1276    mov         edi,ecx
 004D1278    mov         word ptr [ebp-6],dx
 004D127C    mov         dword ptr [ebp-4],eax
 004D127F    xor         eax,eax
 004D1281    push        ebp
 004D1282    push        4D13D5
 004D1287    push        dword ptr fs:[eax]
 004D128A    mov         dword ptr fs:[eax],esp
 004D128D    xor         esi,esi
 004D128F    mov         eax,dword ptr [ebp-4]
 004D1292    call        @WStrToPWChar
 004D1297    movzx       edx,word ptr [ebp-6]
 004D129B    call        WStrScan
 004D12A0    mov         ebx,eax
 004D12A2    test        ebx,ebx
>004D12A4    je          004D12BB
 004D12A6    add         ebx,2
 004D12A9    inc         esi
 004D12AA    movzx       edx,word ptr [ebp-6]
 004D12AE    mov         eax,ebx
 004D12B0    call        WStrScan
 004D12B5    mov         ebx,eax
 004D12B7    test        ebx,ebx
>004D12B9    jne         004D12A6
 004D12BB    test        esi,esi
>004D12BD    jne         004D1307
 004D12BF    lea         eax,[ebp-10]
 004D12C2    movzx       edx,word ptr [ebp-6]
 004D12C6    call        @UStrFromWChar
 004D12CB    push        dword ptr [ebp-10]
 004D12CE    lea         eax,[ebp-14]
 004D12D1    mov         edx,dword ptr [ebp-4]
 004D12D4    call        @UStrFromWStr
 004D12D9    push        dword ptr [ebp-14]
 004D12DC    lea         eax,[ebp-18]
 004D12DF    movzx       edx,word ptr [ebp-6]
 004D12E3    call        @UStrFromWChar
 004D12E8    push        dword ptr [ebp-18]
 004D12EB    lea         eax,[ebp-0C]
 004D12EE    mov         edx,3
 004D12F3    call        @UStrCatN
 004D12F8    mov         edx,dword ptr [ebp-0C]
 004D12FB    mov         eax,edi
 004D12FD    call        @WStrFromUStr
>004D1302    jmp         004D13BA
 004D1307    mov         eax,dword ptr [ebp-4]
 004D130A    test        eax,eax
>004D130C    je          004D1315
 004D130E    sub         eax,4
 004D1311    mov         eax,dword ptr [eax]
 004D1313    shr         eax,1
 004D1315    lea         edx,[esi+eax+2]
 004D1319    mov         eax,edi
 004D131B    call        @WStrSetLength
 004D1320    mov         edi,dword ptr [edi]
 004D1322    movzx       eax,word ptr [ebp-6]
 004D1326    mov         word ptr [edi],ax
 004D1329    add         edi,2
 004D132C    mov         esi,dword ptr [ebp-4]
 004D132F    movzx       edx,word ptr [ebp-6]
 004D1333    mov         eax,esi
 004D1335    call        WStrScan
 004D133A    mov         ebx,eax
 004D133C    add         ebx,2
 004D133F    mov         eax,ebx
 004D1341    sub         eax,esi
 004D1343    sar         eax,1
>004D1345    jns         004D134A
 004D1347    adc         eax,0
 004D134A    mov         ecx,eax
 004D134C    add         ecx,ecx
 004D134E    mov         edx,edi
 004D1350    mov         eax,esi
 004D1352    call        Move
 004D1357    mov         eax,ebx
 004D1359    sub         eax,esi
 004D135B    sar         eax,1
>004D135D    jns         004D1362
 004D135F    adc         eax,0
 004D1362    add         eax,eax
 004D1364    add         edi,eax
 004D1366    movzx       eax,word ptr [ebp-6]
 004D136A    mov         word ptr [edi],ax
 004D136D    add         edi,2
 004D1370    mov         esi,ebx
 004D1372    movzx       edx,word ptr [ebp-6]
 004D1376    mov         eax,esi
 004D1378    call        WStrScan
 004D137D    mov         ebx,eax
 004D137F    test        ebx,ebx
>004D1381    jne         004D133C
 004D1383    mov         eax,esi
 004D1385    call        WStrEnd
 004D138A    mov         ebx,eax
 004D138C    mov         eax,ebx
 004D138E    sub         eax,esi
 004D1390    sar         eax,1
>004D1392    jns         004D1397
 004D1394    adc         eax,0
 004D1397    mov         ecx,eax
 004D1399    add         ecx,ecx
 004D139B    mov         edx,edi
 004D139D    mov         eax,esi
 004D139F    call        Move
 004D13A4    sub         ebx,esi
 004D13A6    sar         ebx,1
>004D13A8    jns         004D13AD
 004D13AA    adc         ebx,0
 004D13AD    mov         eax,ebx
 004D13AF    add         eax,eax
 004D13B1    add         edi,eax
 004D13B3    movzx       eax,word ptr [ebp-6]
 004D13B7    mov         word ptr [edi],ax
 004D13BA    xor         eax,eax
 004D13BC    pop         edx
 004D13BD    pop         ecx
 004D13BE    pop         ecx
 004D13BF    mov         dword ptr fs:[eax],edx
 004D13C2    push        4D13DC
 004D13C7    lea         eax,[ebp-18]
 004D13CA    mov         edx,4
 004D13CF    call        @UStrArrayClr
 004D13D4    ret
>004D13D5    jmp         @HandleFinally
>004D13DA    jmp         004D13C7
 004D13DC    pop         edi
 004D13DD    pop         esi
 004D13DE    pop         ebx
 004D13DF    mov         esp,ebp
 004D13E1    pop         ebp
 004D13E2    ret
*}
end;

//004D13E4
function WideExtractQuotedStr(var Src:PWideChar; Quote:WideChar):WideString;
begin
{*
 004D13E4    push        ebx
 004D13E5    push        esi
 004D13E6    push        edi
 004D13E7    push        ebp
 004D13E8    push        ecx
 004D13E9    mov         dword ptr [esp],ecx
 004D13EC    mov         edi,edx
 004D13EE    mov         ebx,eax
 004D13F0    mov         eax,dword ptr [esp]
 004D13F3    call        @WStrClr
 004D13F8    cmp         dword ptr [ebx],0
>004D13FB    je          004D1516
 004D1401    mov         eax,dword ptr [ebx]
 004D1403    cmp         di,word ptr [eax]
>004D1406    jne         004D1516
 004D140C    add         dword ptr [ebx],2
 004D140F    mov         ebp,1
 004D1414    mov         esi,dword ptr [ebx]
 004D1416    mov         eax,dword ptr [ebx]
 004D1418    mov         edx,edi
 004D141A    call        WStrScan
 004D141F    mov         dword ptr [ebx],eax
>004D1421    jmp         004D143C
 004D1423    add         dword ptr [ebx],2
 004D1426    mov         eax,dword ptr [ebx]
 004D1428    cmp         di,word ptr [eax]
>004D142B    jne         004D1441
 004D142D    add         dword ptr [ebx],2
 004D1430    inc         ebp
 004D1431    mov         eax,dword ptr [ebx]
 004D1433    mov         edx,edi
 004D1435    call        WStrScan
 004D143A    mov         dword ptr [ebx],eax
 004D143C    cmp         dword ptr [ebx],0
>004D143F    jne         004D1423
 004D1441    cmp         dword ptr [ebx],0
>004D1444    jne         004D144F
 004D1446    mov         eax,esi
 004D1448    call        WStrEnd
 004D144D    mov         dword ptr [ebx],eax
 004D144F    mov         eax,dword ptr [ebx]
 004D1451    sub         eax,esi
 004D1453    sar         eax,1
>004D1455    jns         004D145A
 004D1457    adc         eax,0
 004D145A    cmp         eax,1
>004D145D    jle         004D1516
 004D1463    mov         edx,eax
 004D1465    sub         edx,ebp
>004D1467    je          004D1516
 004D146D    cmp         ebp,1
>004D1470    jne         004D1484
 004D1472    mov         ecx,eax
 004D1474    dec         ecx
 004D1475    mov         eax,dword ptr [esp]
 004D1478    mov         edx,esi
 004D147A    call        @WStrFromPWCharLen
>004D147F    jmp         004D1516
 004D1484    mov         edx,eax
 004D1486    sub         edx,ebp
 004D1488    mov         eax,dword ptr [esp]
 004D148B    call        @WStrSetLength
 004D1490    mov         eax,dword ptr [esp]
 004D1493    mov         eax,dword ptr [eax]
 004D1495    call        @WStrToPWChar
 004D149A    mov         ebp,eax
 004D149C    mov         edx,edi
 004D149E    mov         eax,esi
 004D14A0    call        WStrScan
 004D14A5    mov         dword ptr [ebx],eax
>004D14A7    jmp         004D14EA
 004D14A9    add         dword ptr [ebx],2
 004D14AC    mov         eax,dword ptr [ebx]
 004D14AE    cmp         di,word ptr [eax]
>004D14B1    jne         004D14EF
 004D14B3    mov         eax,dword ptr [ebx]
 004D14B5    sub         eax,esi
 004D14B7    sar         eax,1
>004D14B9    jns         004D14BE
 004D14BB    adc         eax,0
 004D14BE    mov         ecx,eax
 004D14C0    add         ecx,ecx
 004D14C2    mov         edx,ebp
 004D14C4    mov         eax,esi
 004D14C6    call        Move
 004D14CB    mov         eax,dword ptr [ebx]
 004D14CD    sub         eax,esi
 004D14CF    sar         eax,1
>004D14D1    jns         004D14D6
 004D14D3    adc         eax,0
 004D14D6    add         eax,eax
 004D14D8    add         ebp,eax
 004D14DA    add         dword ptr [ebx],2
 004D14DD    mov         esi,dword ptr [ebx]
 004D14DF    mov         eax,dword ptr [ebx]
 004D14E1    mov         edx,edi
 004D14E3    call        WStrScan
 004D14E8    mov         dword ptr [ebx],eax
 004D14EA    cmp         dword ptr [ebx],0
>004D14ED    jne         004D14A9
 004D14EF    cmp         dword ptr [ebx],0
>004D14F2    jne         004D14FD
 004D14F4    mov         eax,esi
 004D14F6    call        WStrEnd
 004D14FB    mov         dword ptr [ebx],eax
 004D14FD    mov         eax,dword ptr [ebx]
 004D14FF    sub         eax,esi
 004D1501    sar         eax,1
>004D1503    jns         004D1508
 004D1505    adc         eax,0
 004D1508    dec         eax
 004D1509    mov         ecx,eax
 004D150B    add         ecx,ecx
 004D150D    mov         edx,ebp
 004D150F    mov         eax,esi
 004D1511    call        Move
 004D1516    pop         edx
 004D1517    pop         ebp
 004D1518    pop         edi
 004D1519    pop         esi
 004D151A    pop         ebx
 004D151B    ret
*}
end;

//004D151C
function InOpSet(W:WideChar; const Sets:CharSet):Boolean;
begin
{*
 004D151C    cmp         ax,0FF
>004D1520    ja          004D152C
 004D1522    movzx       eax,al
 004D1525    bt          dword ptr [edx],eax
 004D1528    setb        al
 004D152B    ret
 004D152C    xor         eax,eax
 004D152E    ret
*}
end;

//004D1908
procedure TCommonDialog.Execute(ParentWnd:HWND);
begin
{*
>004D1908    jmp         @AbstractError
*}
end;

//004D668C
function ApplicationMainHandle:HWND;
begin
{*
 004D668C    mov         eax,[0078D590];^Application:TApplication
 004D6691    mov         eax,dword ptr [eax]
 004D6693    cmp         byte ptr [eax+0D3],0
>004D669A    je          004D66B6
 004D669C    mov         eax,[0078D590];^Application:TApplication
 004D66A1    mov         eax,dword ptr [eax]
 004D66A3    cmp         dword ptr [eax+44],0
>004D66A7    je          004D66B6
 004D66A9    mov         eax,[0078D590];^Application:TApplication
 004D66AE    mov         eax,dword ptr [eax]
 004D66B0    call        TApplication.GetMainFormHandle
 004D66B5    ret
 004D66B6    mov         eax,[0078D590];^Application:TApplication
 004D66BB    mov         eax,dword ptr [eax]
 004D66BD    mov         eax,dword ptr [eax+170]
 004D66C3    ret
*}
end;

//004D66C4
procedure CenterWindow(Wnd:HWND);
begin
{*
 004D66C4    push        ebx
 004D66C5    push        esi
 004D66C6    push        edi
 004D66C7    add         esp,0FFFFFFF0
 004D66CA    mov         esi,eax
 004D66CC    push        esp
 004D66CD    push        esi
 004D66CE    call        user32.GetWindowRect
 004D66D3    mov         eax,[0078D590];^Application:TApplication
 004D66D8    mov         eax,dword ptr [eax]
 004D66DA    mov         edx,dword ptr [eax+44]
 004D66DD    test        edx,edx
>004D66DF    je          004D670E
 004D66E1    mov         eax,[0078DB00];^Screen:TScreen
 004D66E6    mov         eax,dword ptr [eax]
 004D66E8    mov         eax,dword ptr [eax+68]
 004D66EB    test        eax,eax
>004D66ED    je          004D66FE
 004D66EF    mov         edx,dword ptr ds:[78DB00];^Screen:TScreen
 004D66F5    call        TCustomForm.GetMonitor
 004D66FA    mov         ebx,eax
>004D66FC    jmp         004D671C
 004D66FE    mov         eax,[0078D590];^Application:TApplication
 004D6703    mov         eax,edx
 004D6705    call        TCustomForm.GetMonitor
 004D670A    mov         ebx,eax
>004D670C    jmp         004D671C
 004D670E    mov         eax,[0078DB00];^Screen:TScreen
 004D6713    mov         eax,dword ptr [eax]
 004D6715    call        TScreen.GetPrimaryMonitor
 004D671A    mov         ebx,eax
 004D671C    push        15
 004D671E    push        0
 004D6720    push        0
 004D6722    mov         eax,ebx
 004D6724    call        TMonitor.GetTop
 004D6729    mov         edi,eax
 004D672B    mov         eax,ebx
 004D672D    call        TMonitor.GetHeight
 004D6732    sub         eax,dword ptr [esp+18]
 004D6736    add         eax,dword ptr [esp+10]
 004D673A    mov         ecx,3
 004D673F    cdq
 004D6740    idiv        eax,ecx
 004D6742    add         edi,eax
 004D6744    push        edi
 004D6745    mov         eax,ebx
 004D6747    call        TMonitor.GetLeft
 004D674C    mov         edi,eax
 004D674E    mov         eax,ebx
 004D6750    call        TMonitor.GetWidth
 004D6755    sub         eax,dword ptr [esp+18]
 004D6759    add         eax,dword ptr [esp+10]
 004D675D    sar         eax,1
>004D675F    jns         004D6764
 004D6761    adc         eax,0
 004D6764    add         edi,eax
 004D6766    push        edi
 004D6767    push        0
 004D6769    push        esi
 004D676A    call        user32.SetWindowPos
 004D676F    add         esp,10
 004D6772    pop         edi
 004D6773    pop         esi
 004D6774    pop         ebx
 004D6775    ret
*}
end;

//004D6778
function DialogHook(Wnd:HWND; Msg:UINT; WParam:WPARAM; LParam:LPARAM):UINT; stdcall;
begin
{*
 004D6778    push        ebp
 004D6779    mov         ebp,esp
 004D677B    push        ebx
 004D677C    push        esi
 004D677D    push        edi
 004D677E    mov         esi,dword ptr [ebp+0C]
 004D6781    mov         ebx,dword ptr [ebp+8]
 004D6784    xor         edi,edi
 004D6786    cmp         esi,110
>004D678C    jne         004D67D6
 004D678E    mov         eax,ebx
 004D6790    call        CenterWindow
 004D6795    mov         eax,[00786410]
 004D679A    mov         dword ptr [eax+3C],ebx
 004D679D    mov         eax,[00786410]
 004D67A2    mov         eax,dword ptr [eax+5C]
 004D67A5    push        eax
 004D67A6    push        0FC
 004D67A8    push        ebx
 004D67A9    call        user32.SetWindowLongW
 004D67AE    mov         edx,dword ptr ds:[786410]
 004D67B4    mov         dword ptr [edx+58],eax
 004D67B7    mov         eax,dword ptr [ebp+14]
 004D67BA    push        eax
 004D67BB    mov         eax,dword ptr [ebp+10]
 004D67BE    push        eax
 004D67BF    push        esi
 004D67C0    push        ebx
 004D67C1    mov         eax,[00786410]
 004D67C6    mov         eax,dword ptr [eax+5C]
 004D67C9    push        eax
 004D67CA    call        user32.CallWindowProcW
 004D67CF    xor         eax,eax
 004D67D1    mov         [00786410],eax
 004D67D6    mov         eax,edi
 004D67D8    pop         edi
 004D67D9    pop         esi
 004D67DA    pop         ebx
 004D67DB    pop         ebp
 004D67DC    ret         10
*}
end;

//004D69A8
procedure TRedirectorWindow.CreateParams(var Params:TCreateParams);
begin
{*
 004D69A8    push        ebx
 004D69A9    push        esi
 004D69AA    mov         esi,edx
 004D69AC    mov         ebx,eax
 004D69AE    mov         edx,esi
 004D69B0    mov         eax,ebx
 004D69B2    call        TWinControl.CreateParams
 004D69B7    mov         dword ptr [esi+4],90000000
 004D69BE    mov         eax,dword ptr [ebx+274]
 004D69C4    mov         dword ptr [esi+1C],eax
 004D69C7    pop         esi
 004D69C8    pop         ebx
 004D69C9    ret
*}
end;

//004D69CC
procedure TRedirectorWindow.WndProc(var Message:TMessage);
begin
{*
 004D69CC    push        ebx
 004D69CD    push        esi
 004D69CE    mov         ebx,edx
 004D69D0    mov         esi,eax
 004D69D2    mov         edx,ebx
 004D69D4    mov         eax,esi
 004D69D6    call        TWinControl.WndProc
 004D69DB    cmp         dword ptr [ebx+0C],0
>004D69DF    jne         004D6A05
 004D69E1    cmp         dword ptr [ebx],0B021
>004D69E7    je          004D6A05
 004D69E9    cmp         dword ptr [esi+270],0
>004D69F0    je          004D6A05
 004D69F2    mov         edx,ebx
 004D69F4    mov         eax,dword ptr [esi+270]
 004D69FA    mov         ecx,dword ptr [eax]
 004D69FC    call        dword ptr [ecx+3C]
 004D69FF    and         eax,7F
 004D6A02    mov         dword ptr [ebx+0C],eax
 004D6A05    cmp         dword ptr [ebx+0C],0
>004D6A09    jne         004D6A32
 004D6A0B    cmp         dword ptr [ebx],7
>004D6A0E    jne         004D6A32
 004D6A10    cmp         dword ptr [esi+274],0
>004D6A17    je          004D6A32
 004D6A19    mov         eax,dword ptr [ebx+8]
 004D6A1C    push        eax
 004D6A1D    mov         eax,dword ptr [ebx+4]
 004D6A20    push        eax
 004D6A21    push        7
 004D6A23    mov         eax,dword ptr [esi+274]
 004D6A29    push        eax
 004D6A2A    call        user32.SendMessageW
 004D6A2F    mov         dword ptr [ebx+0C],eax
 004D6A32    pop         esi
 004D6A33    pop         ebx
 004D6A34    ret
*}
end;

//004D6A38
procedure TRedirectorWindow.CMRelease;
begin
{*
 004D6A38    call        TObject.Free
 004D6A3D    ret
*}
end;

//004D6A40
constructor TCommonDialog.Create;
begin
{*
 004D6A40    push        ebx
 004D6A41    push        esi
 004D6A42    test        dl,dl
>004D6A44    je          004D6A4E
 004D6A46    add         esp,0FFFFFFF0
 004D6A49    call        @ClassCreate
 004D6A4E    mov         ebx,edx
 004D6A50    mov         esi,eax
 004D6A52    xor         edx,edx
 004D6A54    mov         eax,esi
 004D6A56    call        TComponent.Create
 004D6A5B    mov         byte ptr [esi+34],1
 004D6A5F    push        esi
 004D6A60    push        4D6B78;TCommonDialog.MainWndProc
 004D6A65    call        MakeObjectInstance
 004D6A6A    mov         dword ptr [esi+5C],eax
 004D6A6D    mov         eax,esi
 004D6A6F    test        bl,bl
>004D6A71    je          004D6A82
 004D6A73    call        @AfterConstruction
 004D6A78    pop         dword ptr fs:[0]
 004D6A7F    add         esp,0C
 004D6A82    mov         eax,esi
 004D6A84    pop         esi
 004D6A85    pop         ebx
 004D6A86    ret
*}
end;

//004D6A88
destructor TCommonDialog.Destroy();
begin
{*
 004D6A88    push        ebx
 004D6A89    push        esi
 004D6A8A    call        @BeforeDestruction
 004D6A8F    mov         ebx,edx
 004D6A91    mov         esi,eax
 004D6A93    mov         eax,dword ptr [esi+5C]
 004D6A96    test        eax,eax
>004D6A98    je          004D6A9F
 004D6A9A    call        FreeObjectInstance
 004D6A9F    mov         eax,dword ptr [esi+40]
 004D6AA2    test        eax,eax
>004D6AA4    je          004D6ABE
 004D6AA6    xor         edx,edx
 004D6AA8    mov         dword ptr [eax+270],edx
 004D6AAE    lea         eax,[esi+40]
 004D6AB1    mov         edx,dword ptr [eax]
 004D6AB3    xor         ecx,ecx
 004D6AB5    mov         dword ptr [eax],ecx
 004D6AB7    mov         eax,edx
 004D6AB9    call        TObject.Free
 004D6ABE    mov         edx,ebx
 004D6AC0    and         dl,0FC
 004D6AC3    mov         eax,esi
 004D6AC5    call        TComponent.Destroy
 004D6ACA    test        bl,bl
>004D6ACC    jle         004D6AD5
 004D6ACE    mov         eax,esi
 004D6AD0    call        @ClassDestroy
 004D6AD5    pop         esi
 004D6AD6    pop         ebx
 004D6AD7    ret
*}
end;

//004D6AD8
function TCommonDialog.Execute:Boolean;
begin
{*
 004D6AD8    push        esi
 004D6AD9    mov         esi,eax
 004D6ADB    mov         eax,[0078D590];^Application:TApplication
 004D6AE0    mov         eax,dword ptr [eax]
 004D6AE2    cmp         byte ptr [eax+0D0],0
>004D6AE9    je          004D6B02
 004D6AEB    mov         eax,[0078D590];^Application:TApplication
 004D6AF0    mov         eax,dword ptr [eax]
 004D6AF2    call        TApplication.GetActiveFormHandle
 004D6AF7    test        eax,eax
>004D6AF9    jne         004D6B07
 004D6AFB    call        ApplicationMainHandle
>004D6B00    jmp         004D6B07
 004D6B02    call        ApplicationMainHandle
 004D6B07    mov         edx,eax
 004D6B09    mov         eax,esi
 004D6B0B    mov         ecx,dword ptr [eax]
 004D6B0D    call        dword ptr [ecx+48]
 004D6B10    pop         esi
 004D6B11    ret
*}
end;

//004D6B14
function TCommonDialog.GetHandle:HWND;
begin
{*
 004D6B14    mov         eax,dword ptr [eax+3C]
 004D6B17    ret
*}
end;

//004D6B18
function TCommonDialog.MessageHook(var Msg:TMessage):Boolean;
begin
{*
 004D6B18    xor         ecx,ecx
 004D6B1A    mov         edx,dword ptr [edx]
 004D6B1C    cmp         edx,dword ptr ds:[7932A8]
>004D6B22    jne         004D6B3D
 004D6B24    cmp         dword ptr [eax+38],0
>004D6B28    je          004D6B3D
 004D6B2A    mov         edx,dword ptr ds:[78D590];^Application:TApplication
 004D6B30    mov         edx,dword ptr [edx]
 004D6B32    mov         eax,dword ptr [eax+38]
 004D6B35    xchg        eax,edx
 004D6B36    call        TApplication.HelpContext
 004D6B3B    mov         cl,1
 004D6B3D    mov         eax,ecx
 004D6B3F    ret
*}
end;

//004D6B40
{*procedure TCommonDialog.DefaultHandler(var Message:?);
begin
 004D6B40    push        ebx
 004D6B41    push        esi
 004D6B42    push        edi
 004D6B43    mov         esi,edx
 004D6B45    mov         ebx,eax
 004D6B47    mov         edi,dword ptr [ebx+3C]
 004D6B4A    test        edi,edi
>004D6B4C    je          004D6B68
 004D6B4E    mov         eax,dword ptr [esi+8]
 004D6B51    push        eax
 004D6B52    mov         eax,dword ptr [esi+4]
 004D6B55    push        eax
 004D6B56    mov         eax,dword ptr [esi]
 004D6B58    push        eax
 004D6B59    push        edi
 004D6B5A    mov         eax,dword ptr [ebx+58]
 004D6B5D    push        eax
 004D6B5E    call        user32.CallWindowProcW
 004D6B63    mov         dword ptr [esi+0C],eax
>004D6B66    jmp         004D6B71
 004D6B68    mov         edx,esi
 004D6B6A    mov         eax,ebx
 004D6B6C    call        TObject.DefaultHandler
 004D6B71    pop         edi
 004D6B72    pop         esi
 004D6B73    pop         ebx
 004D6B74    ret
end;*}

//004D6B78
procedure TCommonDialog.MainWndProc(var Message:TMessage);
begin
{*
 004D6B78    push        ebp
 004D6B79    mov         ebp,esp
 004D6B7B    push        ecx
 004D6B7C    push        ebx
 004D6B7D    push        esi
 004D6B7E    push        edi
 004D6B7F    mov         dword ptr [ebp-4],eax
 004D6B82    xor         eax,eax
 004D6B84    push        ebp
 004D6B85    push        4D6BA2
 004D6B8A    push        dword ptr fs:[eax]
 004D6B8D    mov         dword ptr fs:[eax],esp
 004D6B90    mov         eax,dword ptr [ebp-4]
 004D6B93    mov         ecx,dword ptr [eax]
 004D6B95    call        dword ptr [ecx+34]
 004D6B98    xor         eax,eax
 004D6B9A    pop         edx
 004D6B9B    pop         ecx
 004D6B9C    pop         ecx
 004D6B9D    mov         dword ptr fs:[eax],edx
>004D6BA0    jmp         004D6BBB
>004D6BA2    jmp         @HandleAnyException
 004D6BA7    mov         eax,[0078D590];^Application:TApplication
 004D6BAC    mov         eax,dword ptr [eax]
 004D6BAE    mov         edx,dword ptr [ebp-4]
 004D6BB1    call        TApplication.HandleException
 004D6BB6    call        @DoneExcept
 004D6BBB    pop         edi
 004D6BBC    pop         esi
 004D6BBD    pop         ebx
 004D6BBE    pop         ecx
 004D6BBF    pop         ebp
 004D6BC0    ret
*}
end;

//004D6BC4
procedure TCommonDialog.WndProc(var Message:TMessage);
begin
{*
 004D6BC4    push        esi
 004D6BC5    mov         esi,eax
 004D6BC7    mov         eax,esi
 004D6BC9    mov         ecx,dword ptr [eax]
 004D6BCB    call        dword ptr [ecx-14]
 004D6BCE    pop         esi
 004D6BCF    ret
*}
end;

//004D6BD0
procedure TCommonDialog.WMDestroy(var Message:TWMDestroy);
begin
{*
 004D6BD0    push        esi
 004D6BD1    mov         esi,eax
 004D6BD3    mov         eax,esi
 004D6BD5    mov         ecx,dword ptr [eax]
 004D6BD7    call        dword ptr [ecx-10]
 004D6BDA    mov         eax,esi
 004D6BDC    mov         si,0FFF0
 004D6BE0    call        @CallDynaInst
 004D6BE5    pop         esi
 004D6BE6    ret
*}
end;

//004D6BE8
procedure TCommonDialog.WMInitDialog(var Message:TWMInitDialog);
begin
{*
 004D6BE8    push        ebx
 004D6BE9    push        esi
 004D6BEA    mov         ebx,edx
 004D6BEC    mov         si,0FFEF
 004D6BF0    call        @CallDynaInst
 004D6BF5    xor         eax,eax
 004D6BF7    mov         dword ptr [ebx+0C],eax
 004D6BFA    pop         esi
 004D6BFB    pop         ebx
 004D6BFC    ret
*}
end;

//004D6C00
procedure TCommonDialog.WMNCDestroy(var Message:TWMNCDestroy);
begin
{*
 004D6C00    push        esi
 004D6C01    mov         esi,eax
 004D6C03    mov         eax,esi
 004D6C05    mov         ecx,dword ptr [eax]
 004D6C07    call        dword ptr [ecx-10]
 004D6C0A    xor         eax,eax
 004D6C0C    mov         dword ptr [esi+3C],eax
 004D6C0F    pop         esi
 004D6C10    ret
*}
end;

//004D6C14
function TCommonDialog.TaskModalDialog(DialogFunc:Pointer; var DialogData:void ):BOOL;
begin
{*
 004D6C14    push        ebp
 004D6C15    mov         ebp,esp
 004D6C17    add         esp,0FFFFFFE8
 004D6C1A    push        ebx
 004D6C1B    push        esi
 004D6C1C    mov         ebx,ecx
 004D6C1E    mov         esi,edx
 004D6C20    mov         dword ptr [ebp-8],eax
 004D6C23    mov         eax,[0078D590];^Application:TApplication
 004D6C28    mov         eax,dword ptr [eax]
 004D6C2A    call        TApplication.GetActiveFormHandle
 004D6C2F    mov         dword ptr [ebp-10],eax
 004D6C32    mov         eax,dword ptr [ebx+4]
 004D6C35    call        DisableTaskWindows
 004D6C3A    mov         dword ptr [ebp-18],eax
 004D6C3D    call        SaveFocusState
 004D6C42    mov         dword ptr [ebp-14],eax
 004D6C45    xor         ecx,ecx
 004D6C47    push        ebp
 004D6C48    push        4D6CC6
 004D6C4D    push        dword ptr fs:[ecx]
 004D6C50    mov         dword ptr fs:[ecx],esp
 004D6C53    fnstcw      word ptr [ebp-2]
 004D6C56    xor         eax,eax
 004D6C58    push        ebp
 004D6C59    push        4D6C85
 004D6C5E    push        dword ptr fs:[eax]
 004D6C61    mov         dword ptr fs:[eax],esp
 004D6C64    mov         eax,dword ptr [ebp-8]
 004D6C67    mov         [00786410],eax
 004D6C6C    push        ebx
 004D6C6D    call        esi
 004D6C6F    mov         dword ptr [ebp-0C],eax
 004D6C72    xor         eax,eax
 004D6C74    pop         edx
 004D6C75    pop         ecx
 004D6C76    pop         ecx
 004D6C77    mov         dword ptr fs:[eax],edx
 004D6C7A    push        4D6C8C
 004D6C7F    fnclex
 004D6C81    fldcw       word ptr [ebp-2]
 004D6C84    ret
>004D6C85    jmp         @HandleFinally
>004D6C8A    jmp         004D6C7F
 004D6C8C    xor         eax,eax
 004D6C8E    pop         edx
 004D6C8F    pop         ecx
 004D6C90    pop         ecx
 004D6C91    mov         dword ptr fs:[eax],edx
 004D6C94    push        4D6CCD
 004D6C99    mov         eax,dword ptr [ebp-18]
 004D6C9C    call        EnableTaskWindows
 004D6CA1    mov         eax,dword ptr [ebp-10]
 004D6CA4    push        eax
 004D6CA5    call        user32.SetActiveWindow
 004D6CAA    mov         eax,dword ptr [ebp-14]
 004D6CAD    call        RestoreFocusState
 004D6CB2    mov         eax,dword ptr [ebp-8]
 004D6CB5    add         eax,40
 004D6CB8    mov         edx,dword ptr [eax]
 004D6CBA    xor         ecx,ecx
 004D6CBC    mov         dword ptr [eax],ecx
 004D6CBE    mov         eax,edx
 004D6CC0    call        TObject.Free
 004D6CC5    ret
>004D6CC6    jmp         @HandleFinally
>004D6CCB    jmp         004D6C99
 004D6CCD    mov         eax,dword ptr [ebp-0C]
 004D6CD0    pop         esi
 004D6CD1    pop         ebx
 004D6CD2    mov         esp,ebp
 004D6CD4    pop         ebp
 004D6CD5    ret
*}
end;

//004D6CD8
procedure TCommonDialog.DoClose;
begin
{*
 004D6CD8    push        ebx
 004D6CD9    cmp         word ptr [eax+4A],0
>004D6CDE    je          004D6CEA
 004D6CE0    mov         ebx,eax
 004D6CE2    mov         edx,eax
 004D6CE4    mov         eax,dword ptr [ebx+4C]
 004D6CE7    call        dword ptr [ebx+48]
 004D6CEA    pop         ebx
 004D6CEB    ret
*}
end;

//004D6CEC
procedure TCommonDialog.DoShow;
begin
{*
 004D6CEC    push        ebx
 004D6CED    cmp         word ptr [eax+52],0
>004D6CF2    je          004D6CFE
 004D6CF4    mov         ebx,eax
 004D6CF6    mov         edx,eax
 004D6CF8    mov         eax,dword ptr [ebx+54]
 004D6CFB    call        dword ptr [ebx+50]
 004D6CFE    pop         ebx
 004D6CFF    ret
*}
end;

//004D7030
constructor TFileDialogWrapper.Create;
begin
{*
 004D7030    push        ebx
 004D7031    push        esi
 004D7032    push        edi
 004D7033    test        dl,dl
>004D7035    je          004D703F
 004D7037    add         esp,0FFFFFFF0
 004D703A    call        @ClassCreate
 004D703F    mov         esi,ecx
 004D7041    mov         ebx,edx
 004D7043    mov         edi,eax
 004D7045    xor         edx,edx
 004D7047    mov         eax,edi
 004D7049    call        TObject.Create
 004D704E    mov         dword ptr [edi+8],esi
 004D7051    mov         eax,edi
 004D7053    mov         edx,dword ptr [eax]
 004D7055    call        dword ptr [edx]
 004D7057    mov         dword ptr [edi+4],eax
 004D705A    mov         eax,edi
 004D705C    test        bl,bl
>004D705E    je          004D706F
 004D7060    call        @AfterConstruction
 004D7065    pop         dword ptr fs:[0]
 004D706C    add         esp,0C
 004D706F    mov         eax,edi
 004D7071    pop         edi
 004D7072    pop         esi
 004D7073    pop         ebx
 004D7074    ret
*}
end;

//004D7078
destructor TFileDialogWrapper.Destroy();
begin
{*
 004D7078    push        ebx
 004D7079    push        esi
 004D707A    call        @BeforeDestruction
 004D707F    mov         ebx,edx
 004D7081    mov         esi,eax
 004D7083    mov         eax,dword ptr [esi+4]
 004D7086    call        TObject.Free
 004D708B    mov         edx,ebx
 004D708D    and         dl,0FC
 004D7090    mov         eax,esi
 004D7092    call        TObject.Destroy
 004D7097    test        bl,bl
>004D7099    jle         004D70A2
 004D709B    mov         eax,esi
 004D709D    call        @ClassDestroy
 004D70A2    pop         esi
 004D70A3    pop         ebx
 004D70A4    ret
*}
end;

//004D70A8
procedure TFileDialogWrapper.AssignFileTypes;
begin
{*
 004D70A8    push        ebp
 004D70A9    mov         ebp,esp
 004D70AB    add         esp,0FFFFFFE4
 004D70AE    push        ebx
 004D70AF    push        esi
 004D70B0    push        edi
 004D70B1    xor         edx,edx
 004D70B3    mov         dword ptr [ebp-1C],edx
 004D70B6    mov         dword ptr [ebp-18],edx
 004D70B9    mov         dword ptr [ebp-4],edx
 004D70BC    mov         dword ptr [ebp-8],eax
 004D70BF    xor         eax,eax
 004D70C1    push        ebp
 004D70C2    push        4D724A
 004D70C7    push        dword ptr fs:[eax]
 004D70CA    mov         dword ptr fs:[eax],esp
 004D70CD    lea         eax,[ebp-4]
 004D70D0    mov         edx,dword ptr [ebp-8]
 004D70D3    mov         edx,dword ptr [edx+8]
 004D70D6    mov         edx,dword ptr [edx+70]
 004D70D9    call        @UStrLAsg
 004D70DE    mov         ebx,1
 004D70E3    mov         edx,dword ptr [ebp-4]
 004D70E6    mov         eax,4D7264;'|'
 004D70EB    call        AnsiPos
 004D70F0    mov         esi,eax
 004D70F2    test        esi,esi
>004D70F4    je          004D7227
 004D70FA    mov         eax,dword ptr [ebp-8]
 004D70FD    mov         eax,dword ptr [eax+4]
 004D7100    mov         eax,dword ptr [eax+58]
 004D7103    call        TFileTypeItems.Add
 004D7108    mov         edi,eax
 004D710A    lea         eax,[edi+0C]
 004D710D    push        eax
 004D710E    mov         ecx,esi
 004D7110    sub         ecx,ebx
 004D7112    mov         edx,ebx
 004D7114    mov         eax,dword ptr [ebp-4]
 004D7117    call        @UStrCopy
 004D711C    mov         eax,[0078DB7C];SysLocale:TSysLocale
 004D7121    cmp         byte ptr [eax+0C],0
>004D7125    jne         004D713B
 004D7127    lea         ecx,[esi+1]
 004D712A    mov         edx,dword ptr [ebp-4]
 004D712D    mov         eax,4D7264;'|'
 004D7132    call        PosEx
 004D7137    mov         ebx,eax
>004D7139    jmp         004D7168
 004D713B    lea         eax,[ebp-18]
 004D713E    push        eax
 004D713F    lea         edx,[esi+1]
 004D7142    mov         ecx,7FFFFFFF
 004D7147    mov         eax,dword ptr [ebp-4]
 004D714A    call        @UStrCopy
 004D714F    mov         edx,dword ptr [ebp-18]
 004D7152    mov         eax,4D7264;'|'
 004D7157    call        AnsiPos
 004D715C    mov         ebx,eax
 004D715E    test        ebx,ebx
>004D7160    je          004D7168
 004D7162    lea         eax,[esi+1]
 004D7165    add         ebx,eax
 004D7167    dec         ebx
 004D7168    test        ebx,ebx
>004D716A    jne         004D7187
 004D716C    mov         eax,dword ptr [ebp-4]
 004D716F    mov         dword ptr [ebp-0C],eax
 004D7172    cmp         dword ptr [ebp-0C],0
>004D7176    je          004D7183
 004D7178    mov         eax,dword ptr [ebp-0C]
 004D717B    sub         eax,4
 004D717E    mov         eax,dword ptr [eax]
 004D7180    mov         dword ptr [ebp-0C],eax
 004D7183    mov         ebx,dword ptr [ebp-0C]
 004D7186    inc         ebx
 004D7187    lea         eax,[edi+14]
 004D718A    push        eax
 004D718B    mov         ecx,ebx
 004D718D    sub         ecx,esi
 004D718F    dec         ecx
 004D7190    lea         edx,[esi+1]
 004D7193    mov         eax,dword ptr [ebp-4]
 004D7196    call        @UStrCopy
 004D719B    inc         ebx
 004D719C    mov         eax,[0078DB7C];SysLocale:TSysLocale
 004D71A1    cmp         byte ptr [eax+0C],0
>004D71A5    jne         004D71BA
 004D71A7    mov         ecx,ebx
 004D71A9    mov         edx,dword ptr [ebp-4]
 004D71AC    mov         eax,4D7264;'|'
 004D71B1    call        PosEx
 004D71B6    mov         esi,eax
>004D71B8    jmp         004D721F
 004D71BA    lea         eax,[ebp-1C]
 004D71BD    push        eax
 004D71BE    mov         ecx,7FFFFFFF
 004D71C3    mov         edx,ebx
 004D71C5    mov         eax,dword ptr [ebp-4]
 004D71C8    call        @UStrCopy
 004D71CD    mov         edx,dword ptr [ebp-1C]
 004D71D0    mov         eax,4D7264;'|'
 004D71D5    call        AnsiPos
 004D71DA    mov         esi,eax
 004D71DC    test        esi,esi
>004D71DE    je          004D71E8
 004D71E0    lea         eax,[ebx+esi]
 004D71E3    dec         eax
 004D71E4    mov         esi,eax
>004D71E6    jmp         004D721F
 004D71E8    mov         eax,dword ptr [ebp-4]
 004D71EB    mov         dword ptr [ebp-10],eax
 004D71EE    cmp         dword ptr [ebp-10],0
>004D71F2    je          004D71FF
 004D71F4    mov         eax,dword ptr [ebp-10]
 004D71F7    sub         eax,4
 004D71FA    mov         eax,dword ptr [eax]
 004D71FC    mov         dword ptr [ebp-10],eax
 004D71FF    cmp         ebx,dword ptr [ebp-10]
>004D7202    jge         004D721F
 004D7204    mov         eax,dword ptr [ebp-4]
 004D7207    mov         dword ptr [ebp-14],eax
 004D720A    cmp         dword ptr [ebp-14],0
>004D720E    je          004D721B
 004D7210    mov         eax,dword ptr [ebp-14]
 004D7213    sub         eax,4
 004D7216    mov         eax,dword ptr [eax]
 004D7218    mov         dword ptr [ebp-14],eax
 004D721B    mov         esi,dword ptr [ebp-14]
 004D721E    inc         esi
 004D721F    test        esi,esi
>004D7221    jne         004D70FA
 004D7227    xor         eax,eax
 004D7229    pop         edx
 004D722A    pop         ecx
 004D722B    pop         ecx
 004D722C    mov         dword ptr fs:[eax],edx
 004D722F    push        4D7251
 004D7234    lea         eax,[ebp-1C]
 004D7237    mov         edx,2
 004D723C    call        @UStrArrayClr
 004D7241    lea         eax,[ebp-4]
 004D7244    call        @UStrClr
 004D7249    ret
>004D724A    jmp         @HandleFinally
>004D724F    jmp         004D7234
 004D7251    pop         edi
 004D7252    pop         esi
 004D7253    pop         ebx
 004D7254    mov         esp,ebp
 004D7256    pop         ebp
 004D7257    ret
*}
end;

//004D7268
procedure TFileDialogWrapper.AssignOptions;
begin
{*
 004D7268    push        ebx
 004D7269    push        esi
 004D726A    push        edi
 004D726B    push        ebp
 004D726C    mov         esi,eax
 004D726E    xor         ebx,ebx
 004D7270    mov         edi,786416
 004D7275    mov         eax,dword ptr [esi+8]
 004D7278    mov         edx,ebx
 004D727A    cmp         dl,1F
>004D727D    ja          004D7286
 004D727F    and         edx,7F
 004D7282    bt          dword ptr [eax+6C],edx
>004D7286    jae         004D7293
 004D7288    mov         eax,dword ptr [edi]
 004D728A    mov         ebp,dword ptr [esi+4]
 004D728D    or          eax,dword ptr [ebp+64]
 004D7290    mov         dword ptr [ebp+64],eax
 004D7293    inc         ebx
 004D7294    add         edi,4
 004D7297    cmp         bl,16
>004D729A    jne         004D7275
 004D729C    mov         eax,dword ptr [esi+8]
 004D729F    test        byte ptr [eax+0C0],1
>004D72A6    je          004D72B7
 004D72A8    mov         ebx,dword ptr [esi+4]
 004D72AB    mov         eax,dword ptr [ebx+64]
 004D72AE    or          eax,dword ptr ds:[4D72BC]
 004D72B4    mov         dword ptr [ebx+64],eax
 004D72B7    pop         ebp
 004D72B8    pop         edi
 004D72B9    pop         esi
 004D72BA    pop         ebx
 004D72BB    ret
*}
end;

//004D72C0
function TFileDialogWrapper.Execute(ParentWnd:HWND):Boolean;
begin
{*
 004D72C0    push        ebp
 004D72C1    mov         ebp,esp
 004D72C3    xor         ecx,ecx
 004D72C5    push        ecx
 004D72C6    push        ecx
 004D72C7    push        ecx
 004D72C8    push        ecx
 004D72C9    push        ecx
 004D72CA    push        ebx
 004D72CB    push        esi
 004D72CC    mov         esi,edx
 004D72CE    mov         dword ptr [ebp-4],eax
 004D72D1    xor         eax,eax
 004D72D3    push        ebp
 004D72D4    push        4D74F2
 004D72D9    push        dword ptr fs:[eax]
 004D72DC    mov         dword ptr fs:[eax],esp
 004D72DF    mov         eax,dword ptr [ebp-4]
 004D72E2    mov         eax,dword ptr [eax+4]
 004D72E5    add         eax,38
 004D72E8    mov         edx,dword ptr [ebp-4]
 004D72EB    mov         edx,dword ptr [edx+8]
 004D72EE    mov         edx,dword ptr [edx+84]
 004D72F4    call        @UStrAsg
 004D72F9    lea         edx,[ebp-0C]
 004D72FC    mov         eax,dword ptr [ebp-4]
 004D72FF    mov         eax,dword ptr [eax+8]
 004D7302    call        TOpenDialog.GetInitialDir
 004D7307    mov         edx,dword ptr [ebp-0C]
 004D730A    mov         eax,dword ptr [ebp-4]
 004D730D    mov         eax,dword ptr [eax+4]
 004D7310    call        TCustomFileDialog.SetDefaultFolder
 004D7315    lea         edx,[ebp-10]
 004D7318    mov         eax,dword ptr [ebp-4]
 004D731B    mov         eax,dword ptr [eax+8]
 004D731E    call        TOpenDialog.GetFileName
 004D7323    mov         edx,dword ptr [ebp-10]
 004D7326    mov         eax,dword ptr [ebp-4]
 004D7329    mov         eax,dword ptr [eax+4]
 004D732C    call        TCustomFileDialog.SetFileName
 004D7331    mov         eax,dword ptr [ebp-4]
 004D7334    mov         eax,dword ptr [eax+8]
 004D7337    call        TOpenDialog.GetFilterIndex
 004D733C    mov         edx,dword ptr [ebp-4]
 004D733F    mov         ebx,dword ptr [edx+4]
 004D7342    mov         dword ptr [ebx+54],eax
 004D7345    lea         eax,[ebx+70]
 004D7348    mov         edx,dword ptr [ebp-4]
 004D734B    mov         edx,dword ptr [edx+8]
 004D734E    mov         edx,dword ptr [edx+80]
 004D7354    call        @UStrAsg
 004D7359    mov         eax,dword ptr [ebp-4]
 004D735C    mov         eax,dword ptr [eax+8]
 004D735F    cmp         word ptr [eax+0B2],0
>004D7367    je          004D7382
 004D7369    mov         eax,dword ptr [ebp-4]
 004D736C    mov         eax,dword ptr [eax+4]
 004D736F    mov         edx,dword ptr [ebp-4]
 004D7372    mov         dword ptr [eax+84],edx
 004D7378    mov         dword ptr [eax+80],4D7524;TFileDialogWrapper.OnFileOkEvent
 004D7382    mov         eax,dword ptr [ebp-4]
 004D7385    mov         eax,dword ptr [eax+8]
 004D7388    cmp         word ptr [eax+0A2],0
>004D7390    je          004D73AB
 004D7392    mov         eax,dword ptr [ebp-4]
 004D7395    mov         eax,dword ptr [eax+4]
 004D7398    mov         edx,dword ptr [ebp-4]
 004D739B    mov         dword ptr [eax+8C],edx
 004D73A1    mov         dword ptr [eax+88],4D75B0;TFileDialogWrapper.OnFolderChangeEvent
 004D73AB    mov         eax,dword ptr [ebp-4]
 004D73AE    mov         eax,dword ptr [eax+8]
 004D73B1    cmp         word ptr [eax+9A],0
>004D73B9    je          004D73D4
 004D73BB    mov         eax,dword ptr [ebp-4]
 004D73BE    mov         eax,dword ptr [eax+4]
 004D73C1    mov         edx,dword ptr [ebp-4]
 004D73C4    mov         dword ptr [eax+0A4],edx
 004D73CA    mov         dword ptr [eax+0A0],4D7610;TFileDialogWrapper.OnSelectionChangeEvent
 004D73D4    mov         eax,dword ptr [ebp-4]
 004D73D7    mov         eax,dword ptr [eax+8]
 004D73DA    cmp         word ptr [eax+0AA],0
>004D73E2    je          004D73FD
 004D73E4    mov         eax,dword ptr [ebp-4]
 004D73E7    mov         eax,dword ptr [eax+4]
 004D73EA    mov         edx,dword ptr [ebp-4]
 004D73ED    mov         dword ptr [eax+0B4],edx
 004D73F3    mov         dword ptr [eax+0B0],4D7688;TFileDialogWrapper.OnTypeChangeEvent
 004D73FD    mov         eax,dword ptr [ebp-4]
 004D7400    mov         eax,dword ptr [eax+8]
 004D7403    test        byte ptr [eax+6D],8
>004D7407    je          004D7422
 004D7409    mov         eax,dword ptr [ebp-4]
 004D740C    mov         eax,dword ptr [eax+4]
 004D740F    mov         edx,dword ptr [ebp-4]
 004D7412    mov         dword ptr [eax+0AC],edx
 004D7418    mov         dword ptr [eax+0A8],4D7520;TFileDialogWrapper.HandleShareViolation
 004D7422    mov         eax,dword ptr [ebp-4]
 004D7425    call        TFileDialogWrapper.AssignFileTypes
 004D742A    mov         eax,dword ptr [ebp-4]
 004D742D    call        TFileDialogWrapper.AssignOptions
 004D7432    mov         eax,dword ptr [ebp-4]
 004D7435    mov         eax,dword ptr [eax+8]
 004D7438    mov         edx,dword ptr [ebp-4]
 004D743B    mov         dword ptr [eax+0C4],edx
 004D7441    xor         eax,eax
 004D7443    push        ebp
 004D7444    push        4D747B
 004D7449    push        dword ptr fs:[eax]
 004D744C    mov         dword ptr fs:[eax],esp
 004D744F    mov         eax,dword ptr [ebp-4]
 004D7452    mov         eax,dword ptr [eax+4]
 004D7455    mov         edx,esi
 004D7457    mov         ecx,dword ptr [eax]
 004D7459    call        dword ptr [ecx+40]
 004D745C    mov         byte ptr [ebp-5],al
 004D745F    xor         eax,eax
 004D7461    pop         edx
 004D7462    pop         ecx
 004D7463    pop         ecx
 004D7464    mov         dword ptr fs:[eax],edx
 004D7467    push        4D7482
 004D746C    mov         eax,dword ptr [ebp-4]
 004D746F    mov         ebx,dword ptr [eax+8]
 004D7472    xor         eax,eax
 004D7474    mov         dword ptr [ebx+0C4],eax
 004D747A    ret
>004D747B    jmp         @HandleFinally
>004D7480    jmp         004D746C
 004D7482    cmp         byte ptr [ebp-5],0
>004D7486    je          004D74CF
 004D7488    lea         edx,[ebp-14]
 004D748B    mov         eax,dword ptr [ebp-4]
 004D748E    mov         eax,dword ptr [eax+4]
 004D7491    call        TCustomFileDialog.GetFileName
 004D7496    mov         edx,dword ptr [ebp-14]
 004D7499    mov         eax,ebx
 004D749B    call        TOpenDialog.SetFileName
 004D74A0    mov         eax,dword ptr [ebp-4]
 004D74A3    mov         eax,dword ptr [eax+4]
 004D74A6    call        TCustomFileDialog.GetFiles
 004D74AB    push        eax
 004D74AC    mov         eax,dword ptr [ebp-4]
 004D74AF    mov         eax,dword ptr [eax+8]
 004D74B2    call        TOpenDialog.GetFiles
 004D74B7    pop         edx
 004D74B8    mov         ecx,dword ptr [eax]
 004D74BA    call        dword ptr [ecx+8]
 004D74BD    mov         eax,dword ptr [ebp-4]
 004D74C0    mov         eax,dword ptr [eax+4]
 004D74C3    mov         eax,dword ptr [eax+54]
 004D74C6    mov         edx,dword ptr [ebp-4]
 004D74C9    mov         edx,dword ptr [edx+8]
 004D74CC    mov         dword ptr [edx+74],eax
 004D74CF    xor         eax,eax
 004D74D1    pop         edx
 004D74D2    pop         ecx
 004D74D3    pop         ecx
 004D74D4    mov         dword ptr fs:[eax],edx
 004D74D7    push        4D74F9
 004D74DC    lea         eax,[ebp-14]
 004D74DF    mov         edx,2
 004D74E4    call        @UStrArrayClr
 004D74E9    lea         eax,[ebp-0C]
 004D74EC    call        @UStrClr
 004D74F1    ret
>004D74F2    jmp         @HandleFinally
>004D74F7    jmp         004D74DC
 004D74F9    movzx       eax,byte ptr [ebp-5]
 004D74FD    pop         esi
 004D74FE    pop         ebx
 004D74FF    mov         esp,ebp
 004D7501    pop         ebp
 004D7502    ret
*}
end;

//004D7504
function TFileDialogWrapper.GetFileName:TFileName;
begin
{*
 004D7504    push        ebx
 004D7505    push        esi
 004D7506    mov         esi,edx
 004D7508    mov         ebx,eax
 004D750A    mov         edx,esi
 004D750C    mov         eax,dword ptr [ebx+4]
 004D750F    call        TCustomFileDialog.GetFileName
 004D7514    pop         esi
 004D7515    pop         ebx
 004D7516    ret
*}
end;

//004D7518
function TFileDialogWrapper.GetHandle:HWND;
begin
{*
 004D7518    mov         eax,dword ptr [eax+4]
 004D751B    mov         eax,dword ptr [eax+5C]
 004D751E    ret
*}
end;

//004D7520
procedure TFileDialogWrapper.HandleShareViolation(Sender:TObject; var Response:TFileDialogShareViolationResponse);
begin
{*
 004D7520    mov         byte ptr [ecx],1
 004D7523    ret
*}
end;

//004D7524
procedure TFileDialogWrapper.OnFileOkEvent(Sender:TObject; var CanClose:Boolean);
begin
{*
 004D7524    push        ebp
 004D7525    mov         ebp,esp
 004D7527    add         esp,0FFFFFFF8
 004D752A    push        ebx
 004D752B    push        esi
 004D752C    push        edi
 004D752D    xor         ebx,ebx
 004D752F    mov         dword ptr [ebp-8],ebx
 004D7532    mov         dword ptr [ebp-4],ecx
 004D7535    mov         esi,eax
 004D7537    xor         eax,eax
 004D7539    push        ebp
 004D753A    push        4D759F
 004D753F    push        dword ptr fs:[eax]
 004D7542    mov         dword ptr fs:[eax],esp
 004D7545    mov         edi,dword ptr [esi+8]
 004D7548    lea         edx,[ebp-8]
 004D754B    mov         eax,dword ptr [esi+4]
 004D754E    call        TCustomFileDialog.GetFileName
 004D7553    mov         edx,dword ptr [ebp-8]
 004D7556    mov         eax,edi
 004D7558    call        TOpenDialog.SetFileName
 004D755D    mov         eax,dword ptr [esi+4]
 004D7560    call        TCustomFileDialog.GetFiles
 004D7565    push        eax
 004D7566    mov         eax,edi
 004D7568    call        TOpenDialog.GetFiles
 004D756D    pop         edx
 004D756E    mov         ecx,dword ptr [eax]
 004D7570    call        dword ptr [ecx+8]
 004D7573    mov         ecx,dword ptr [ebp-4]
 004D7576    mov         eax,dword ptr [esi+8]
 004D7579    mov         ebx,eax
 004D757B    mov         edx,eax
 004D757D    mov         eax,dword ptr [ebx+0B4]
 004D7583    call        dword ptr [ebx+0B0]
 004D7589    xor         eax,eax
 004D758B    pop         edx
 004D758C    pop         ecx
 004D758D    pop         ecx
 004D758E    mov         dword ptr fs:[eax],edx
 004D7591    push        4D75A6
 004D7596    lea         eax,[ebp-8]
 004D7599    call        @UStrClr
 004D759E    ret
>004D759F    jmp         @HandleFinally
>004D75A4    jmp         004D7596
 004D75A6    pop         edi
 004D75A7    pop         esi
 004D75A8    pop         ebx
 004D75A9    pop         ecx
 004D75AA    pop         ecx
 004D75AB    pop         ebp
 004D75AC    ret
*}
end;

//004D75B0
procedure TFileDialogWrapper.OnFolderChangeEvent(Sender:TObject);
begin
{*
 004D75B0    push        ebp
 004D75B1    mov         ebp,esp
 004D75B3    push        0
 004D75B5    push        ebx
 004D75B6    push        esi
 004D75B7    mov         ebx,eax
 004D75B9    xor         eax,eax
 004D75BB    push        ebp
 004D75BC    push        4D7604
 004D75C1    push        dword ptr fs:[eax]
 004D75C4    mov         dword ptr fs:[eax],esp
 004D75C7    mov         esi,dword ptr [ebx+8]
 004D75CA    lea         edx,[ebp-4]
 004D75CD    mov         eax,dword ptr [ebx+4]
 004D75D0    call        TCustomFileDialog.GetFileName
 004D75D5    mov         edx,dword ptr [ebp-4]
 004D75D8    mov         eax,esi
 004D75DA    call        TOpenDialog.SetFileName
 004D75DF    mov         edx,dword ptr [ebx+8]
 004D75E2    mov         eax,dword ptr [esi+0A4]
 004D75E8    call        dword ptr [esi+0A0]
 004D75EE    xor         eax,eax
 004D75F0    pop         edx
 004D75F1    pop         ecx
 004D75F2    pop         ecx
 004D75F3    mov         dword ptr fs:[eax],edx
 004D75F6    push        4D760B
 004D75FB    lea         eax,[ebp-4]
 004D75FE    call        @UStrClr
 004D7603    ret
>004D7604    jmp         @HandleFinally
>004D7609    jmp         004D75FB
 004D760B    pop         esi
 004D760C    pop         ebx
 004D760D    pop         ecx
 004D760E    pop         ebp
 004D760F    ret
*}
end;

//004D7610
procedure TFileDialogWrapper.OnSelectionChangeEvent(Sender:TObject);
begin
{*
 004D7610    push        ebp
 004D7611    mov         ebp,esp
 004D7613    push        0
 004D7615    push        ebx
 004D7616    push        esi
 004D7617    mov         ebx,eax
 004D7619    xor         eax,eax
 004D761B    push        ebp
 004D761C    push        4D767A
 004D7621    push        dword ptr fs:[eax]
 004D7624    mov         dword ptr fs:[eax],esp
 004D7627    mov         esi,dword ptr [ebx+8]
 004D762A    lea         edx,[ebp-4]
 004D762D    mov         eax,dword ptr [ebx+4]
 004D7630    call        TCustomFileDialog.GetFileName
 004D7635    mov         edx,dword ptr [ebp-4]
 004D7638    mov         eax,esi
 004D763A    call        TOpenDialog.SetFileName
 004D763F    mov         eax,dword ptr [ebx+4]
 004D7642    call        TCustomFileDialog.GetFiles
 004D7647    push        eax
 004D7648    mov         eax,esi
 004D764A    call        TOpenDialog.GetFiles
 004D764F    pop         edx
 004D7650    mov         ecx,dword ptr [eax]
 004D7652    call        dword ptr [ecx+8]
 004D7655    mov         edx,dword ptr [ebx+8]
 004D7658    mov         eax,dword ptr [esi+9C]
 004D765E    call        dword ptr [esi+98]
 004D7664    xor         eax,eax
 004D7666    pop         edx
 004D7667    pop         ecx
 004D7668    pop         ecx
 004D7669    mov         dword ptr fs:[eax],edx
 004D766C    push        4D7681
 004D7671    lea         eax,[ebp-4]
 004D7674    call        @UStrClr
 004D7679    ret
>004D767A    jmp         @HandleFinally
>004D767F    jmp         004D7671
 004D7681    pop         esi
 004D7682    pop         ebx
 004D7683    pop         ecx
 004D7684    pop         ebp
 004D7685    ret
*}
end;

//004D7688
procedure TFileDialogWrapper.OnTypeChangeEvent(Sender:TObject);
begin
{*
 004D7688    push        ebx
 004D7689    mov         edx,dword ptr [eax+8]
 004D768C    mov         ecx,dword ptr [eax+4]
 004D768F    mov         ecx,dword ptr [ecx+54]
 004D7692    mov         dword ptr [edx+74],ecx
 004D7695    mov         ebx,edx
 004D7697    mov         edx,dword ptr [eax+8]
 004D769A    mov         eax,dword ptr [ebx+0AC]
 004D76A0    call        dword ptr [ebx+0A8]
 004D76A6    pop         ebx
 004D76A7    ret
*}
end;

//004D76A8
function TFileOpenDialogWrapper.CreateFileDialog:TCustomFileDialog;
begin
{*
 004D76A8    push        ebx
 004D76A9    mov         ebx,eax
 004D76AB    xor         ecx,ecx
 004D76AD    mov         dl,1
 004D76AF    mov         eax,[004D40BC];TFileOpenDialog
 004D76B4    call        TCustomFileDialog.Create
 004D76B9    mov         dword ptr [eax+7C],ebx
 004D76BC    mov         dword ptr [eax+78],4D76C8;TFileOpenDialogWrapper.OnExecuteEvent
 004D76C3    pop         ebx
 004D76C4    ret
*}
end;

//004D76C8
procedure TFileOpenDialogWrapper.OnExecuteEvent(Sender:TObject);
begin
{*
 004D76C8    push        ebp
 004D76C9    mov         ebp,esp
 004D76CB    add         esp,0FFFFFFF8
 004D76CE    push        ebx
 004D76CF    xor         ecx,ecx
 004D76D1    mov         dword ptr [ebp-8],ecx
 004D76D4    mov         ebx,eax
 004D76D6    xor         eax,eax
 004D76D8    push        ebp
 004D76D9    push        4D773D
 004D76DE    push        dword ptr fs:[eax]
 004D76E1    mov         dword ptr fs:[eax],esp
 004D76E4    lea         edx,[ebp-8]
 004D76E7    mov         eax,dword ptr [ebx+8]
 004D76EA    mov         eax,dword ptr [eax]
 004D76EC    call        TObject.ClassName
 004D76F1    mov         eax,dword ptr [ebp-8]
 004D76F4    mov         edx,4D7758;'TOpenPictureDialog'
 004D76F9    call        @UStrEqual
>004D76FE    jne         004D7727
 004D7700    lea         eax,[ebp-4]
 004D7703    push        eax
 004D7704    mov         eax,dword ptr [ebx+4]
 004D7707    mov         eax,dword ptr [eax+40]
 004D770A    push        eax
 004D770B    mov         eax,dword ptr [eax]
 004D770D    call        dword ptr [eax+28]
 004D7710    or          dword ptr [ebp-4],40000000
 004D7717    mov         eax,dword ptr [ebp-4]
 004D771A    push        eax
 004D771B    mov         eax,dword ptr [ebx+4]
 004D771E    mov         eax,dword ptr [eax+40]
 004D7721    push        eax
 004D7722    mov         eax,dword ptr [eax]
 004D7724    call        dword ptr [eax+24]
 004D7727    xor         eax,eax
 004D7729    pop         edx
 004D772A    pop         ecx
 004D772B    pop         ecx
 004D772C    mov         dword ptr fs:[eax],edx
 004D772F    push        4D7744
 004D7734    lea         eax,[ebp-8]
 004D7737    call        @UStrClr
 004D773C    ret
>004D773D    jmp         @HandleFinally
>004D7742    jmp         004D7734
 004D7744    pop         ebx
 004D7745    pop         ecx
 004D7746    pop         ecx
 004D7747    pop         ebp
 004D7748    ret
*}
end;

//004D7780
function TFileSaveDialogWrapper.CreateFileDialog:TCustomFileDialog;
begin
{*
 004D7780    xor         ecx,ecx
 004D7782    mov         dl,1
 004D7784    mov         eax,[004D45BC];TFileSaveDialog
 004D7789    call        TCustomFileDialog.Create
 004D778E    ret
*}
end;

//004D7790
function ExplorerHook(Wnd:HWND; Msg:UINT; WParam:WPARAM; LParam:LPARAM):UINT; stdcall;
begin
{*
 004D7790    push        ebp
 004D7791    mov         ebp,esp
 004D7793    push        ebx
 004D7794    push        esi
 004D7795    push        edi
 004D7796    mov         ebx,dword ptr [ebp+0C]
 004D7799    mov         esi,dword ptr [ebp+8]
 004D779C    xor         edi,edi
 004D779E    cmp         ebx,110
>004D77A4    jne         004D77E9
 004D77A6    mov         eax,[00786410]
 004D77AB    mov         dword ptr [eax+3C],esi
 004D77AE    mov         eax,[00786410]
 004D77B3    mov         eax,dword ptr [eax+5C]
 004D77B6    push        eax
 004D77B7    push        0FC
 004D77B9    push        esi
 004D77BA    call        user32.SetWindowLongW
 004D77BF    mov         edx,dword ptr ds:[786410]
 004D77C5    mov         dword ptr [edx+58],eax
 004D77C8    mov         eax,dword ptr [ebp+14]
 004D77CB    push        eax
 004D77CC    mov         eax,dword ptr [ebp+10]
 004D77CF    push        eax
 004D77D0    push        ebx
 004D77D1    push        esi
 004D77D2    mov         eax,[00786410]
 004D77D7    mov         eax,dword ptr [eax+5C]
 004D77DA    push        eax
 004D77DB    call        user32.CallWindowProcW
 004D77E0    xor         eax,eax
 004D77E2    mov         [00786410],eax
>004D77E7    jmp         004D7807
 004D77E9    cmp         ebx,4E
>004D77EC    jne         004D7807
 004D77EE    mov         eax,dword ptr [ebp+14]
 004D77F1    cmp         dword ptr [eax+8],0FFFFFDA7
>004D77F8    jne         004D7807
 004D77FA    push        0F8
 004D77FC    push        esi
 004D77FD    call        user32.GetWindowLongW
 004D7802    call        CenterWindow
 004D7807    mov         eax,edi
 004D7809    pop         edi
 004D780A    pop         esi
 004D780B    pop         ebx
 004D780C    pop         ebp
 004D780D    ret         10
*}
end;

//004D7810
constructor TOpenDialog.Create;
begin
{*
 004D7810    push        ebx
 004D7811    push        esi
 004D7812    test        dl,dl
>004D7814    je          004D781E
 004D7816    add         esp,0FFFFFFF0
 004D7819    call        @ClassCreate
 004D781E    mov         ebx,edx
 004D7820    mov         esi,eax
 004D7822    xor         edx,edx
 004D7824    mov         eax,esi
 004D7826    call        TCommonDialog.Create
 004D782B    mov         dl,1
 004D782D    mov         eax,[0043C7BC];TStringList
 004D7832    call        TStringList.Create
 004D7837    mov         dword ptr [esi+68],eax
 004D783A    mov         eax,[004D7894]
 004D783F    mov         dword ptr [esi+6C],eax
 004D7842    movzx       eax,byte ptr ds:[4D7898]
 004D7849    mov         byte ptr [esi+0C0],al
 004D784F    mov         dl,1
 004D7851    mov         eax,[0043C7BC];TStringList
 004D7856    call        TStringList.Create
 004D785B    mov         dword ptr [esi+8C],eax
 004D7861    mov         dword ptr [esi+74],1
 004D7868    mov         byte ptr [esi+90],0
 004D786F    xor         eax,eax
 004D7871    mov         dword ptr [esi+0C4],eax
 004D7877    mov         eax,esi
 004D7879    test        bl,bl
>004D787B    je          004D788C
 004D787D    call        @AfterConstruction
 004D7882    pop         dword ptr fs:[0]
 004D7889    add         esp,0C
 004D788C    mov         eax,esi
 004D788E    pop         esi
 004D788F    pop         ebx
 004D7890    ret
*}
end;

//004D789C
destructor TOpenDialog.Destroy();
begin
{*
 004D789C    push        ebx
 004D789D    push        esi
 004D789E    call        @BeforeDestruction
 004D78A3    mov         ebx,edx
 004D78A5    mov         esi,eax
 004D78A7    mov         eax,dword ptr [esi+8C]
 004D78AD    call        TObject.Free
 004D78B2    mov         eax,dword ptr [esi+68]
 004D78B5    call        TObject.Free
 004D78BA    mov         edx,ebx
 004D78BC    and         dl,0FC
 004D78BF    mov         eax,esi
 004D78C1    call        TCommonDialog.Destroy
 004D78C6    test        bl,bl
>004D78C8    jle         004D78D1
 004D78CA    mov         eax,esi
 004D78CC    call        @ClassDestroy
 004D78D1    pop         esi
 004D78D2    pop         ebx
 004D78D3    ret
*}
end;

//004D78D4
function TOpenDialog.CanClose(var OpenFileName:TOpenFilename):Boolean;
begin
{*
 004D78D4    push        esi
 004D78D5    push        edi
 004D78D6    push        ecx
 004D78D7    mov         edi,eax
 004D78D9    mov         eax,edi
 004D78DB    call        TOpenDialog.GetFileNames
 004D78E0    mov         eax,edi
 004D78E2    mov         si,0FFEE
 004D78E6    call        @CallDynaInst
 004D78EB    mov         byte ptr [esp],al
 004D78EE    mov         eax,dword ptr [edi+8C]
 004D78F4    mov         edx,dword ptr [eax]
 004D78F6    call        dword ptr [edx+44]
 004D78F9    movzx       eax,byte ptr [esp]
 004D78FD    pop         edx
 004D78FE    pop         edi
 004D78FF    pop         esi
 004D7900    ret
*}
end;

//004D7904
procedure TOpenDialog.WndProc(var Message:TMessage);
begin
{*
 004D7904    push        ebx
 004D7905    push        esi
 004D7906    push        edi
 004D7907    push        ecx
 004D7908    mov         ebx,edx
 004D790A    mov         edi,eax
 004D790C    xor         eax,eax
 004D790E    mov         dword ptr [ebx+0C],eax
 004D7911    mov         eax,dword ptr [ebx]
 004D7913    cmp         eax,110
>004D7918    jne         004D7924
 004D791A    test        byte ptr [edi+6E],1
>004D791E    je          004D7A08
 004D7924    cmp         eax,4E
>004D7927    jne         004D79FF
 004D792D    mov         edx,dword ptr [ebx+8]
 004D7930    mov         eax,edx
 004D7932    mov         ecx,dword ptr [eax+8]
 004D7935    add         ecx,260
 004D793B    cmp         ecx,7
>004D793E    ja          004D79FF
 004D7944    jmp         dword ptr [ecx*4+4D794B]
 004D7944    dd          004D79DD
 004D7944    dd          004D79C2
 004D7944    dd          004D796B
 004D7944    dd          004D79FF
 004D7944    dd          004D79FF
 004D7944    dd          004D79B5
 004D7944    dd          004D79A8
 004D7944    dd          004D799B
 004D796B    mov         esi,dword ptr [eax+0C]
 004D796E    mov         edx,esi
 004D7970    mov         eax,edi
 004D7972    call        TOpenDialog.CanClose
 004D7977    test        al,al
>004D7979    jne         004D79FF
 004D797F    mov         dword ptr [ebx+0C],1
 004D7986    mov         eax,dword ptr [ebx+0C]
 004D7989    push        eax
 004D798A    push        0
 004D798C    mov         eax,edi
 004D798E    mov         edx,dword ptr [eax]
 004D7990    call        dword ptr [edx+38]
 004D7993    push        eax
 004D7994    call        user32.SetWindowLongW
>004D7999    jmp         004D7A08
 004D799B    mov         eax,edi
 004D799D    mov         si,0FFEF
 004D79A1    call        @CallDynaInst
>004D79A6    jmp         004D79FF
 004D79A8    mov         eax,edi
 004D79AA    mov         si,0FFED
 004D79AE    call        @CallDynaInst
>004D79B3    jmp         004D79FF
 004D79B5    mov         eax,edi
 004D79B7    mov         si,0FFEC
 004D79BB    call        @CallDynaInst
>004D79C0    jmp         004D79FF
 004D79C2    mov         esi,dword ptr [eax+0C]
 004D79C5    mov         eax,dword ptr [esi+18]
 004D79C8    cmp         eax,dword ptr [edi+78]
>004D79CB    je          004D79FF
 004D79CD    mov         dword ptr [edi+78],eax
 004D79D0    mov         eax,edi
 004D79D2    mov         si,0FFEB
 004D79D6    call        @CallDynaInst
>004D79DB    jmp         004D79FF
 004D79DD    cmp         dword ptr [ebx+8],0
>004D79E1    je          004D79FF
 004D79E3    mov         eax,edx
 004D79E5    mov         byte ptr [esp],1
 004D79E9    mov         ecx,esp
 004D79EB    mov         edx,eax
 004D79ED    mov         eax,edi
 004D79EF    mov         si,0FFEA
 004D79F3    call        @CallDynaInst
 004D79F8    movzx       eax,byte ptr [esp]
 004D79FC    mov         dword ptr [ebx+0C],eax
 004D79FF    mov         edx,ebx
 004D7A01    mov         eax,edi
 004D7A03    call        TCommonDialog.WndProc
 004D7A08    pop         edx
 004D7A09    pop         edi
 004D7A0A    pop         esi
 004D7A0B    pop         ebx
 004D7A0C    ret
*}
end;

//004D7A10
procedure TOpenDialog.DoCanClose;
begin
{*
 004D7A10    push        ebx
 004D7A11    push        ecx
 004D7A12    mov         byte ptr [esp],1
 004D7A16    cmp         word ptr [eax+0B2],0
>004D7A1E    je          004D7A32
 004D7A20    mov         ecx,esp
 004D7A22    mov         ebx,eax
 004D7A24    mov         edx,eax
 004D7A26    mov         eax,dword ptr [ebx+0B4]
 004D7A2C    call        dword ptr [ebx+0B0]
 004D7A32    movzx       eax,byte ptr [esp]
 004D7A36    pop         edx
 004D7A37    pop         ebx
 004D7A38    ret
*}
end;

//004D7A3C
procedure TOpenDialog.DoSelectionChange;
begin
{*
 004D7A3C    push        ebx
 004D7A3D    cmp         word ptr [eax+9A],0
>004D7A45    je          004D7A57
 004D7A47    mov         ebx,eax
 004D7A49    mov         edx,eax
 004D7A4B    mov         eax,dword ptr [ebx+9C]
 004D7A51    call        dword ptr [ebx+98]
 004D7A57    pop         ebx
 004D7A58    ret
*}
end;

//004D7A5C
procedure TCustomFileDialog.DoOnSelectionChange;
begin
{*
 004D7A5C    push        ebx
 004D7A5D    cmp         word ptr [eax+0A2],0
>004D7A65    je          004D7A77
 004D7A67    mov         ebx,eax
 004D7A69    mov         edx,eax
 004D7A6B    mov         eax,dword ptr [ebx+0A4]
 004D7A71    call        dword ptr [ebx+0A0]
 004D7A77    pop         ebx
 004D7A78    ret
*}
end;

//004D7A7C
procedure TCustomTaskDialog.DoOnDialogCreated;
begin
{*
 004D7A7C    push        ebx
 004D7A7D    cmp         word ptr [eax+0AA],0
>004D7A85    je          004D7A97
 004D7A87    mov         ebx,eax
 004D7A89    mov         edx,eax
 004D7A8B    mov         eax,dword ptr [ebx+0AC]
 004D7A91    call        dword ptr [ebx+0A8]
 004D7A97    pop         ebx
 004D7A98    ret
*}
end;

//004D7A9C
procedure TOpenDialog.ReadFileEditStyle(Reader:TReader);
begin
{*
 004D7A9C    push        ebp
 004D7A9D    mov         ebp,esp
 004D7A9F    push        0
 004D7AA1    xor         eax,eax
 004D7AA3    push        ebp
 004D7AA4    push        4D7ACE
 004D7AA9    push        dword ptr fs:[eax]
 004D7AAC    mov         dword ptr fs:[eax],esp
 004D7AAF    lea         eax,[ebp-4]
 004D7AB2    xchg        eax,edx
 004D7AB3    call        TReader.ReadIdent
 004D7AB8    xor         eax,eax
 004D7ABA    pop         edx
 004D7ABB    pop         ecx
 004D7ABC    pop         ecx
 004D7ABD    mov         dword ptr fs:[eax],edx
 004D7AC0    push        4D7AD5
 004D7AC5    lea         eax,[ebp-4]
 004D7AC8    call        @UStrClr
 004D7ACD    ret
>004D7ACE    jmp         @HandleFinally
>004D7AD3    jmp         004D7AC5
 004D7AD5    pop         ecx
 004D7AD6    pop         ebp
 004D7AD7    ret
*}
end;

//004D7AD8
procedure TOpenDialog.DefineProperties(Filer:TFiler);
begin
{*
 004D7AD8    push        ebx
 004D7AD9    push        esi
 004D7ADA    mov         esi,edx
 004D7ADC    mov         ebx,eax
 004D7ADE    mov         edx,esi
 004D7AE0    mov         eax,ebx
 004D7AE2    call        TComponent.DefineProperties
 004D7AE7    push        ebx
 004D7AE8    push        4D7A9C;TOpenDialog.ReadFileEditStyle
 004D7AED    push        0
 004D7AEF    push        0
 004D7AF1    xor         ecx,ecx
 004D7AF3    mov         edx,4D7B10;'FileEditStyle'
 004D7AF8    mov         eax,esi
 004D7AFA    mov         ebx,dword ptr [eax]
 004D7AFC    call        dword ptr [ebx+4]
 004D7AFF    pop         esi
 004D7B00    pop         ebx
 004D7B01    ret
*}
end;

//004D7B2C
function ExtractFileName(P:PChar; var S:TFileName):PChar;
begin
{*
 004D7B2C    push        ebp
 004D7B2D    mov         ebp,esp
 004D7B2F    push        ebx
 004D7B30    push        esi
 004D7B31    push        edi
 004D7B32    mov         edi,edx
 004D7B34    mov         esi,eax
 004D7B36    mov         eax,dword ptr [ebp+8]
 004D7B39    movzx       eax,word ptr [eax-2]
 004D7B3D    mov         edx,eax
 004D7B3F    mov         eax,esi
 004D7B41    call        StrScan
 004D7B46    mov         ebx,eax
 004D7B48    test        ebx,ebx
>004D7B4A    jne         004D7B60
 004D7B4C    mov         eax,edi
 004D7B4E    mov         edx,esi
 004D7B50    call        @UStrFromPWChar
 004D7B55    mov         eax,esi
 004D7B57    call        StrEnd
 004D7B5C    mov         ebx,eax
>004D7B5E    jmp         004D7B77
 004D7B60    mov         ecx,ebx
 004D7B62    sub         ecx,esi
 004D7B64    sar         ecx,1
>004D7B66    jns         004D7B6B
 004D7B68    adc         ecx,0
 004D7B6B    mov         eax,edi
 004D7B6D    mov         edx,esi
 004D7B6F    call        @UStrFromPWCharLen
 004D7B74    add         ebx,2
 004D7B77    mov         eax,ebx
 004D7B79    pop         edi
 004D7B7A    pop         esi
 004D7B7B    pop         ebx
 004D7B7C    pop         ebp
 004D7B7D    ret
*}
end;

//004D7B80
procedure ExtractFileNames(P:PChar);
begin
{*
 004D7B80    push        ebp
 004D7B81    mov         ebp,esp
 004D7B83    push        0
 004D7B85    push        0
 004D7B87    push        ebx
 004D7B88    mov         ebx,eax
 004D7B8A    xor         eax,eax
 004D7B8C    push        ebp
 004D7B8D    push        4D7C88
 004D7B92    push        dword ptr fs:[eax]
 004D7B95    mov         dword ptr fs:[eax],esp
 004D7B98    mov         eax,dword ptr [ebp+8]
 004D7B9B    push        eax
 004D7B9C    lea         edx,[ebp-4]
 004D7B9F    mov         eax,ebx
 004D7BA1    call        ExtractFileName
 004D7BA6    pop         ecx
 004D7BA7    mov         ebx,eax
 004D7BA9    mov         eax,dword ptr [ebp+8]
 004D7BAC    push        eax
 004D7BAD    lea         edx,[ebp-8]
 004D7BB0    mov         eax,ebx
 004D7BB2    call        ExtractFileName
 004D7BB7    pop         ecx
 004D7BB8    mov         ebx,eax
 004D7BBA    cmp         dword ptr [ebp-8],0
>004D7BBE    jne         004D7BD9
 004D7BC0    mov         eax,dword ptr [ebp+8]
 004D7BC3    mov         eax,dword ptr [eax-8]
 004D7BC6    mov         eax,dword ptr [eax+8C]
 004D7BCC    mov         edx,dword ptr [ebp-4]
 004D7BCF    mov         ecx,dword ptr [eax]
 004D7BD1    call        dword ptr [ecx+38]
>004D7BD4    jmp         004D7C6D
 004D7BD9    mov         eax,dword ptr [ebp-4]
 004D7BDC    call        AnsiLastChar
 004D7BE1    cmp         word ptr [eax],5C
>004D7BE5    je          004D7BF4
 004D7BE7    lea         eax,[ebp-4]
 004D7BEA    mov         edx,4D7CA0;'\'
 004D7BEF    call        @UStrCat
 004D7BF4    mov         eax,dword ptr [ebp-8]
 004D7BF7    cmp         word ptr [eax],5C
>004D7BFB    je          004D7C42
 004D7BFD    mov         eax,dword ptr [ebp-8]
 004D7C00    test        eax,eax
>004D7C02    je          004D7C09
 004D7C04    sub         eax,4
 004D7C07    mov         eax,dword ptr [eax]
 004D7C09    cmp         eax,3
>004D7C0C    jg          004D7C12
 004D7C0E    mov         al,1
>004D7C10    jmp         004D7C1D
 004D7C12    mov         eax,dword ptr [ebp-8]
 004D7C15    cmp         word ptr [eax+2],3A
 004D7C1A    setne       al
 004D7C1D    test        al,al
>004D7C1F    je          004D7C25
 004D7C21    mov         al,1
>004D7C23    jmp         004D7C30
 004D7C25    mov         eax,dword ptr [ebp-8]
 004D7C28    cmp         word ptr [eax+4],5C
 004D7C2D    setne       al
 004D7C30    test        al,al
>004D7C32    je          004D7C42
 004D7C34    lea         eax,[ebp-8]
 004D7C37    mov         ecx,dword ptr [ebp-8]
 004D7C3A    mov         edx,dword ptr [ebp-4]
 004D7C3D    call        @UStrCat3
 004D7C42    mov         eax,dword ptr [ebp+8]
 004D7C45    mov         eax,dword ptr [eax-8]
 004D7C48    mov         eax,dword ptr [eax+8C]
 004D7C4E    mov         edx,dword ptr [ebp-8]
 004D7C51    mov         ecx,dword ptr [eax]
 004D7C53    call        dword ptr [ecx+38]
 004D7C56    mov         eax,dword ptr [ebp+8]
 004D7C59    push        eax
 004D7C5A    lea         edx,[ebp-8]
 004D7C5D    mov         eax,ebx
 004D7C5F    call        ExtractFileName
 004D7C64    pop         ecx
 004D7C65    mov         ebx,eax
 004D7C67    cmp         dword ptr [ebp-8],0
>004D7C6B    jne         004D7BF4
 004D7C6D    xor         eax,eax
 004D7C6F    pop         edx
 004D7C70    pop         ecx
 004D7C71    pop         ecx
 004D7C72    mov         dword ptr fs:[eax],edx
 004D7C75    push        4D7C8F
 004D7C7A    lea         eax,[ebp-8]
 004D7C7D    mov         edx,2
 004D7C82    call        @UStrArrayClr
 004D7C87    ret
>004D7C88    jmp         @HandleFinally
>004D7C8D    jmp         004D7C7A
 004D7C8F    pop         ebx
 004D7C90    pop         ecx
 004D7C91    pop         ecx
 004D7C92    pop         ebp
 004D7C93    ret
*}
end;

//004D7CA4
procedure TOpenDialog.GetFileNames(var OpenFileName:TOpenFilename);
begin
{*
 004D7CA4    push        ebp
 004D7CA5    mov         ebp,esp
 004D7CA7    add         esp,0FFFFFFF4
 004D7CAA    push        ebx
 004D7CAB    xor         ecx,ecx
 004D7CAD    mov         dword ptr [ebp-0C],ecx
 004D7CB0    mov         dword ptr [ebp-8],eax
 004D7CB3    xor         eax,eax
 004D7CB5    push        ebp
 004D7CB6    push        4D7D61
 004D7CBB    push        dword ptr fs:[eax]
 004D7CBE    mov         dword ptr fs:[eax],esp
 004D7CC1    mov         word ptr [ebp-2],0
 004D7CC7    mov         eax,dword ptr [ebp-8]
 004D7CCA    test        byte ptr [eax+6C],40
>004D7CCE    je          004D7CE9
 004D7CD0    mov         eax,dword ptr [ebp-8]
 004D7CD3    test        byte ptr [eax+6E],1
>004D7CD7    jne         004D7CE3
 004D7CD9    mov         eax,[0078D264];^NewStyleControls:Boolean
 004D7CDE    cmp         byte ptr [eax],0
>004D7CE1    jne         004D7CE9
 004D7CE3    mov         word ptr [ebp-2],20
 004D7CE9    mov         eax,dword ptr [ebp-8]
 004D7CEC    test        byte ptr [eax+6C],40
>004D7CF0    je          004D7D21
 004D7CF2    push        ebp
 004D7CF3    mov         eax,dword ptr [edx+1C]
 004D7CF6    call        ExtractFileNames
 004D7CFB    pop         ecx
 004D7CFC    lea         ecx,[ebp-0C]
 004D7CFF    mov         eax,dword ptr [ebp-8]
 004D7D02    mov         eax,dword ptr [eax+8C]
 004D7D08    xor         edx,edx
 004D7D0A    mov         ebx,dword ptr [eax]
 004D7D0C    call        dword ptr [ebx+0C]
 004D7D0F    mov         edx,dword ptr [ebp-0C]
 004D7D12    mov         eax,dword ptr [ebp-8]
 004D7D15    add         eax,88
 004D7D1A    call        @UStrAsg
>004D7D1F    jmp         004D7D4B
 004D7D21    push        ebp
 004D7D22    mov         eax,dword ptr [edx+1C]
 004D7D25    mov         edx,dword ptr [ebp-8]
 004D7D28    add         edx,88
 004D7D2E    call        ExtractFileName
 004D7D33    pop         ecx
 004D7D34    mov         eax,dword ptr [ebp-8]
 004D7D37    mov         edx,dword ptr [eax+88]
 004D7D3D    mov         eax,dword ptr [ebp-8]
 004D7D40    mov         eax,dword ptr [eax+8C]
 004D7D46    mov         ecx,dword ptr [eax]
 004D7D48    call        dword ptr [ecx+38]
 004D7D4B    xor         eax,eax
 004D7D4D    pop         edx
 004D7D4E    pop         ecx
 004D7D4F    pop         ecx
 004D7D50    mov         dword ptr fs:[eax],edx
 004D7D53    push        4D7D68
 004D7D58    lea         eax,[ebp-0C]
 004D7D5B    call        @UStrClr
 004D7D60    ret
>004D7D61    jmp         @HandleFinally
>004D7D66    jmp         004D7D58
 004D7D68    pop         ebx
 004D7D69    mov         esp,ebp
 004D7D6B    pop         ebp
 004D7D6C    ret
*}
end;

//004D7D70
function TOpenDialog.GetFiles:TStrings;
begin
{*
 004D7D70    mov         eax,dword ptr [eax+8C]
 004D7D76    ret
*}
end;

//004D7D78
function TOpenDialog.GetStaticRect:TRect;
begin
{*
 004D7D78    push        ebx
 004D7D79    push        esi
 004D7D7A    push        edi
 004D7D7B    mov         esi,edx
 004D7D7D    mov         ebx,eax
 004D7D7F    mov         edi,dword ptr [ebx+3C]
 004D7D82    test        edi,edi
>004D7D84    je          004D7DB7
 004D7D86    test        byte ptr [ebx+6E],1
>004D7D8A    jne         004D7DAE
 004D7D8C    push        esi
 004D7D8D    push        45F
 004D7D92    push        edi
 004D7D93    call        user32.GetDlgItem
 004D7D98    push        eax
 004D7D99    call        user32.GetWindowRect
 004D7D9E    push        2
 004D7DA0    push        esi
 004D7DA1    mov         eax,dword ptr [ebx+3C]
 004D7DA4    push        eax
 004D7DA5    push        0
 004D7DA7    call        user32.MapWindowPoints
>004D7DAC    jmp         004D7DC5
 004D7DAE    push        esi
 004D7DAF    push        edi
 004D7DB0    call        user32.GetClientRect
>004D7DB5    jmp         004D7DC5
 004D7DB7    push        0
 004D7DB9    push        esi
 004D7DBA    xor         ecx,ecx
 004D7DBC    xor         edx,edx
 004D7DBE    xor         eax,eax
 004D7DC0    call        Rect
 004D7DC5    pop         edi
 004D7DC6    pop         esi
 004D7DC7    pop         ebx
 004D7DC8    ret
*}
end;

//004D7DCC
function TOpenDialog.GetFileName:TFileName;
begin
{*
 004D7DCC    push        ebx
 004D7DCD    push        esi
 004D7DCE    push        edi
 004D7DCF    add         esp,0FFFFFDF4
 004D7DD5    mov         esi,edx
 004D7DD7    mov         ebx,eax
 004D7DD9    mov         edi,dword ptr [ebx+0C4]
 004D7DDF    test        edi,edi
>004D7DE1    je          004D7DEE
 004D7DE3    mov         edx,esi
 004D7DE5    mov         eax,edi
 004D7DE7    call        TFileDialogWrapper.GetFileName
>004D7DEC    jmp         004D7E32
 004D7DEE    mov         eax,[0078D264];^NewStyleControls:Boolean
 004D7DF3    cmp         byte ptr [eax],0
>004D7DF6    je          004D7E25
 004D7DF8    cmp         dword ptr [ebx+3C],0
>004D7DFC    je          004D7E25
 004D7DFE    mov         eax,esp
 004D7E00    push        eax
 004D7E01    push        105
 004D7E06    push        465
 004D7E0B    mov         eax,dword ptr [ebx+3C]
 004D7E0E    push        eax
 004D7E0F    call        user32.GetParent
 004D7E14    push        eax
 004D7E15    call        user32.SendMessageW
 004D7E1A    mov         edx,esi
 004D7E1C    mov         eax,esp
 004D7E1E    call        StrPas
>004D7E23    jmp         004D7E32
 004D7E25    mov         eax,esi
 004D7E27    mov         edx,dword ptr [ebx+88]
 004D7E2D    call        @UStrAsg
 004D7E32    add         esp,20C
 004D7E38    pop         edi
 004D7E39    pop         esi
 004D7E3A    pop         ebx
 004D7E3B    ret
*}
end;

//004D7E3C
function TOpenDialog.GetFilterIndex:Integer;
begin
{*
 004D7E3C    cmp         dword ptr [eax+3C],0
>004D7E40    je          004D7E46
 004D7E42    mov         eax,dword ptr [eax+78]
 004D7E45    ret
 004D7E46    mov         eax,dword ptr [eax+74]
 004D7E49    ret
*}
end;

//004D7E4C
function TOpenDialog.GetHandle:HWND;
begin
{*
 004D7E4C    mov         edx,dword ptr [eax+0C4]
 004D7E52    test        edx,edx
>004D7E54    je          004D7E5E
 004D7E56    mov         eax,edx
 004D7E58    call        TFileDialogWrapper.GetHandle
 004D7E5D    ret
 004D7E5E    call        TCommonDialog.GetHandle
 004D7E63    ret
*}
end;

//004D7E64
function TOpenDialog.GetInitialDir:UnicodeString;
begin
{*
 004D7E64    push        ebx
 004D7E65    push        esi
 004D7E66    mov         esi,edx
 004D7E68    mov         ebx,eax
 004D7E6A    mov         eax,esi
 004D7E6C    mov         edx,dword ptr [ebx+7C]
 004D7E6F    call        @UStrAsg
 004D7E74    pop         esi
 004D7E75    pop         ebx
 004D7E76    ret
*}
end;

//004D7E78
procedure TOpenDialog.SetFileName(Value:TFileName);
begin
{*
 004D7E78    push        ebp
 004D7E79    mov         ebp,esp
 004D7E7B    push        ecx
 004D7E7C    push        ebx
 004D7E7D    mov         dword ptr [ebp-4],edx
 004D7E80    mov         ebx,eax
 004D7E82    mov         eax,dword ptr [ebp-4]
 004D7E85    call        @UStrAddRef
 004D7E8A    xor         eax,eax
 004D7E8C    push        ebp
 004D7E8D    push        4D7ECC
 004D7E92    push        dword ptr fs:[eax]
 004D7E95    mov         dword ptr fs:[eax],esp
 004D7E98    mov         eax,dword ptr [ebp-4]
 004D7E9B    mov         edx,dword ptr [ebx+88]
 004D7EA1    call        @UStrEqual
>004D7EA6    je          004D7EB6
 004D7EA8    lea         eax,[ebx+88]
 004D7EAE    mov         edx,dword ptr [ebp-4]
 004D7EB1    call        @UStrAsg
 004D7EB6    xor         eax,eax
 004D7EB8    pop         edx
 004D7EB9    pop         ecx
 004D7EBA    pop         ecx
 004D7EBB    mov         dword ptr fs:[eax],edx
 004D7EBE    push        4D7ED3
 004D7EC3    lea         eax,[ebp-4]
 004D7EC6    call        @UStrClr
 004D7ECB    ret
>004D7ECC    jmp         @HandleFinally
>004D7ED1    jmp         004D7EC3
 004D7ED3    pop         ebx
 004D7ED4    pop         ecx
 004D7ED5    pop         ebp
 004D7ED6    ret
*}
end;

//004D7ED8
procedure TOpenDialog.SetHistoryList(Value:TStrings);
begin
{*
 004D7ED8    push        esi
 004D7ED9    push        edi
 004D7EDA    mov         edi,edx
 004D7EDC    mov         esi,eax
 004D7EDE    mov         edx,edi
 004D7EE0    mov         eax,dword ptr [esi+68]
 004D7EE3    mov         ecx,dword ptr [eax]
 004D7EE5    call        dword ptr [ecx+8]
 004D7EE8    pop         edi
 004D7EE9    pop         esi
 004D7EEA    ret
*}
end;

//004D7EEC
procedure TOpenDialog.SetInitialDir(const Value:UnicodeString);
begin
{*
 004D7EEC    push        ebx
 004D7EED    push        esi
 004D7EEE    push        edi
 004D7EEF    mov         esi,edx
 004D7EF1    mov         edi,eax
 004D7EF3    mov         eax,esi
 004D7EF5    test        eax,eax
>004D7EF7    je          004D7EFE
 004D7EF9    sub         eax,4
 004D7EFC    mov         eax,dword ptr [eax]
 004D7EFE    mov         ebx,eax
 004D7F00    cmp         ebx,1
>004D7F03    jle         004D7F26
 004D7F05    mov         edx,ebx
 004D7F07    mov         eax,esi
 004D7F09    call        IsPathDelimiter
 004D7F0E    test        al,al
>004D7F10    je          004D7F26
 004D7F12    mov         ecx,ebx
 004D7F14    dec         ecx
 004D7F15    mov         edx,esi
 004D7F17    mov         eax,4D7F48;':'
 004D7F1C    call        IsDelimiter
 004D7F21    test        al,al
>004D7F23    jne         004D7F26
 004D7F25    dec         ebx
 004D7F26    lea         eax,[edi+7C]
 004D7F29    push        eax
 004D7F2A    mov         ecx,ebx
 004D7F2C    mov         edx,1
 004D7F31    mov         eax,esi
 004D7F33    call        @UStrCopy
 004D7F38    pop         edi
 004D7F39    pop         esi
 004D7F3A    pop         ebx
 004D7F3B    ret
*}
end;

//004D7F4C
function TOpenDialog.Execute(ParentWnd:HWND):Boolean;
begin
{*
 004D7F4C    push        ebx
 004D7F4D    push        esi
 004D7F4E    mov         esi,edx
 004D7F50    mov         ebx,eax
 004D7F52    mov         edx,4C1648;comdlg32.GetOpenFileNameW:BOOL
 004D7F57    mov         ecx,esi
 004D7F59    mov         eax,ebx
 004D7F5B    call        TOpenDialog.DoExecute
 004D7F60    cmp         eax,1
 004D7F63    sbb         eax,eax
 004D7F65    inc         eax
 004D7F66    pop         esi
 004D7F67    pop         ebx
 004D7F68    ret
*}
end;

//004D7F6C
function AllocFilterStr(const S:UnicodeString):UnicodeString;
begin
{*
 004D7F6C    push        ebx
 004D7F6D    push        esi
 004D7F6E    mov         ebx,edx
 004D7F70    mov         esi,eax
 004D7F72    mov         eax,ebx
 004D7F74    call        @UStrClr
 004D7F79    test        esi,esi
>004D7F7B    je          004D7FBA
 004D7F7D    mov         eax,ebx
 004D7F7F    mov         ecx,4D7FCC;''
 004D7F84    mov         edx,esi
 004D7F86    call        @UStrCat3
 004D7F8B    mov         eax,dword ptr [ebx]
 004D7F8D    call        @UStrToPWChar
 004D7F92    mov         dx,7C
 004D7F96    call        StrScan
 004D7F9B    mov         ebx,eax
 004D7F9D    test        ebx,ebx
>004D7F9F    je          004D7FBA
 004D7FA1    mov         word ptr [ebx],0
 004D7FA6    add         ebx,2
 004D7FA9    mov         dx,7C
 004D7FAD    mov         eax,ebx
 004D7FAF    call        StrScan
 004D7FB4    mov         ebx,eax
 004D7FB6    test        ebx,ebx
>004D7FB8    jne         004D7FA1
 004D7FBA    pop         esi
 004D7FBB    pop         ebx
 004D7FBC    ret
*}
end;

//004D7FD0
function TOpenDialog.DoExecute(Func:Pointer; ParentWnd:HWND):BOOL;
begin
{*
 004D7FD0    push        ebp
 004D7FD1    mov         ebp,esp
 004D7FD3    add         esp,0FFFFFF8C
 004D7FD6    push        ebx
 004D7FD7    push        esi
 004D7FD8    xor         ebx,ebx
 004D7FDA    mov         dword ptr [ebp-4],ebx
 004D7FDD    mov         dword ptr [ebp-8],ebx
 004D7FE0    mov         dword ptr [ebp-0C],ebx
 004D7FE3    mov         dword ptr [ebp-14],ecx
 004D7FE6    mov         dword ptr [ebp-10],edx
 004D7FE9    mov         ebx,eax
 004D7FEB    xor         eax,eax
 004D7FED    push        ebp
 004D7FEE    push        4D838B
 004D7FF3    push        dword ptr fs:[eax]
 004D7FF6    mov         dword ptr fs:[eax],esp
 004D7FF9    mov         eax,[0078D080];^gvar_00784C80
 004D7FFE    cmp         dword ptr [eax],6
>004D8001    jl          004D80A1
 004D8007    cmp         byte ptr ds:[78640D],0
>004D800E    je          004D80A1
 004D8014    cmp         dword ptr [ebx+60],0
>004D8018    jne         004D80A1
 004D801E    cmp         word ptr [ebx+0BA],0
>004D8026    jne         004D80A1
 004D8028    cmp         word ptr [ebx+4A],0
>004D802D    jne         004D80A1
 004D802F    cmp         word ptr [ebx+52],0
>004D8034    jne         004D80A1
 004D8036    mov         eax,4C1648;comdlg32.GetOpenFileNameW:BOOL
 004D803B    cmp         eax,dword ptr [ebp-10]
>004D803E    jne         004D8053
 004D8040    mov         ecx,ebx
 004D8042    mov         dl,1
 004D8044    mov         eax,[004D6EE0];TFileOpenDialogWrapper
 004D8049    call        TFileDialogWrapper.Create
 004D804E    mov         dword ptr [ebp-1C],eax
>004D8051    jmp         004D8064
 004D8053    mov         ecx,ebx
 004D8055    mov         dl,1
 004D8057    mov         eax,[004D6F88];TFileSaveDialogWrapper
 004D805C    call        TFileDialogWrapper.Create
 004D8061    mov         dword ptr [ebp-1C],eax
 004D8064    xor         eax,eax
 004D8066    push        ebp
 004D8067    push        4D809A
 004D806C    push        dword ptr fs:[eax]
 004D806F    mov         dword ptr fs:[eax],esp
 004D8072    mov         edx,dword ptr [ebp-14]
 004D8075    mov         eax,dword ptr [ebp-1C]
 004D8078    call        TFileDialogWrapper.Execute
 004D807D    neg         al
 004D807F    sbb         eax,eax
 004D8081    mov         dword ptr [ebp-18],eax
 004D8084    xor         eax,eax
 004D8086    pop         edx
 004D8087    pop         ecx
 004D8088    pop         ecx
 004D8089    mov         dword ptr fs:[eax],edx
 004D808C    push        4D8370
 004D8091    mov         eax,dword ptr [ebp-1C]
 004D8094    call        TObject.Free
 004D8099    ret
>004D809A    jmp         @HandleFinally
>004D809F    jmp         004D8091
 004D80A1    mov         eax,dword ptr [ebx+8C]
 004D80A7    mov         edx,dword ptr [eax]
 004D80A9    call        dword ptr [edx+44]
 004D80AC    lea         eax,[ebp-74]
 004D80AF    xor         ecx,ecx
 004D80B1    mov         edx,58
 004D80B6    call        @FillChar
 004D80BB    mov         eax,[0078D080];^gvar_00784C80
 004D80C0    cmp         dword ptr [eax],5
>004D80C3    jl          004D80CF
 004D80C5    mov         eax,[0078DB58];^gvar_00784C7C
 004D80CA    cmp         dword ptr [eax],2
>004D80CD    je          004D80ED
 004D80CF    mov         eax,[0078DB58];^gvar_00784C7C
 004D80D4    cmp         dword ptr [eax],1
>004D80D7    jne         004D80F6
 004D80D9    mov         eax,[0078D080];^gvar_00784C80
 004D80DE    cmp         dword ptr [eax],4
>004D80E1    jl          004D80F6
 004D80E3    mov         eax,[0078D6F0];^gvar_00784C84
 004D80E8    cmp         dword ptr [eax],5A
>004D80EB    jl          004D80F6
 004D80ED    mov         dword ptr [ebp-74],58
>004D80F4    jmp         004D80FD
 004D80F6    mov         dword ptr [ebp-74],4C
 004D80FD    mov         eax,[00790C38];gvar_00790C38
 004D8102    mov         dword ptr [ebp-6C],eax
 004D8105    lea         edx,[ebp-4]
 004D8108    mov         eax,dword ptr [ebx+70]
 004D810B    call        AllocFilterStr
 004D8110    mov         eax,dword ptr [ebp-4]
 004D8113    call        @UStrToPWChar
 004D8118    mov         dword ptr [ebp-68],eax
 004D811B    mov         eax,dword ptr [ebx+74]
 004D811E    mov         dword ptr [ebp-5C],eax
 004D8121    mov         dword ptr [ebx+78],eax
 004D8124    test        byte ptr [ebx+6C],40
>004D8128    je          004D8133
 004D812A    mov         dword ptr [ebp-54],0FFEF
>004D8131    jmp         004D813A
 004D8133    mov         dword ptr [ebp-54],104
 004D813A    mov         edx,dword ptr [ebp-54]
 004D813D    add         edx,2
 004D8140    lea         eax,[ebp-8]
 004D8143    call        @UStrSetLength
 004D8148    mov         eax,dword ptr [ebp-8]
 004D814B    call        @UStrToPWChar
 004D8150    mov         esi,eax
 004D8152    mov         dword ptr [ebp-58],esi
 004D8155    mov         eax,dword ptr [ebp-54]
 004D8158    add         eax,2
 004D815B    mov         edx,eax
 004D815D    add         edx,edx
 004D815F    mov         eax,esi
 004D8161    xor         ecx,ecx
 004D8163    call        @FillChar
 004D8168    mov         eax,dword ptr [ebx+88]
 004D816E    call        @UStrToPWChar
 004D8173    mov         edx,eax
 004D8175    mov         ecx,dword ptr [ebp-54]
 004D8178    mov         eax,dword ptr [ebp-58]
 004D817B    call        StrLCopy
 004D8180    cmp         dword ptr [ebx+7C],0
>004D8184    jne         004D8199
 004D8186    cmp         byte ptr ds:[78640C],0
>004D818D    je          004D8199
 004D818F    mov         eax,4D839C
 004D8194    mov         dword ptr [ebp-48],eax
>004D8197    jmp         004D81A4
 004D8199    mov         eax,dword ptr [ebx+7C]
 004D819C    call        @UStrToPWChar
 004D81A1    mov         dword ptr [ebp-48],eax
 004D81A4    mov         eax,dword ptr [ebx+80]
 004D81AA    call        @UStrToPWChar
 004D81AF    mov         dword ptr [ebp-44],eax
 004D81B2    mov         dword ptr [ebp-40],20
 004D81B9    xor         eax,eax
 004D81BB    mov         dword ptr [ebp-20],eax
 004D81BE    xor         eax,eax
 004D81C0    mov         esi,786470
 004D81C5    mov         edx,eax
 004D81C7    cmp         dl,1F
>004D81CA    ja          004D81D3
 004D81CC    and         edx,7F
 004D81CF    bt          dword ptr [ebx+6C],edx
>004D81D3    jae         004D81DA
 004D81D5    mov         edx,dword ptr [esi]
 004D81D7    or          dword ptr [ebp-40],edx
 004D81DA    inc         eax
 004D81DB    add         esi,4
 004D81DE    cmp         al,16
>004D81E0    jne         004D81C5
 004D81E2    mov         eax,[0078D264];^NewStyleControls:Boolean
 004D81E7    cmp         byte ptr [eax],0
>004D81EA    je          004D8251
 004D81EC    xor         dword ptr [ebp-40],80000
 004D81F3    mov         eax,[0078D080];^gvar_00784C80
 004D81F8    cmp         dword ptr [eax],5
>004D81FB    jl          004D8207
 004D81FD    mov         eax,[0078DB58];^gvar_00784C7C
 004D8202    cmp         dword ptr [eax],2
>004D8205    je          004D8225
 004D8207    mov         eax,[0078DB58];^gvar_00784C7C
 004D820C    cmp         dword ptr [eax],1
>004D820F    jne         004D8258
 004D8211    mov         eax,[0078D080];^gvar_00784C80
 004D8216    cmp         dword ptr [eax],4
>004D8219    jl          004D8258
 004D821B    mov         eax,[0078D6F0];^gvar_00784C84
 004D8220    cmp         dword ptr [eax],5A
>004D8223    jl          004D8258
 004D8225    xor         eax,eax
 004D8227    mov         esi,7864C8
 004D822C    mov         edx,eax
 004D822E    cmp         dl,7
>004D8231    ja          004D8240
 004D8233    and         edx,7F
 004D8236    movzx       ecx,byte ptr [ebx+0C0]
 004D823D    bt          ecx,edx
>004D8240    jae         004D8247
 004D8242    mov         edx,dword ptr [esi]
 004D8244    or          dword ptr [ebp-20],edx
 004D8247    inc         eax
 004D8248    add         esi,4
 004D824B    cmp         al,1
>004D824D    jne         004D822C
>004D824F    jmp         004D8258
 004D8251    and         dword ptr [ebp-40],0FFF7FFFF
 004D8258    lea         eax,[ebp-0C]
 004D825B    mov         edx,dword ptr [ebx+84]
 004D8261    call        @UStrLAsg
 004D8266    cmp         dword ptr [ebp-0C],0
>004D826A    jne         004D8292
 004D826C    test        byte ptr [ebp-3E],8
>004D8270    jne         004D8292
 004D8272    lea         edx,[ebp-0C]
 004D8275    mov         eax,dword ptr [ebx+88]
 004D827B    call        ExtractFileExt
 004D8280    lea         eax,[ebp-0C]
 004D8283    mov         ecx,1
 004D8288    mov         edx,1
 004D828D    call        @UStrDelete
 004D8292    cmp         dword ptr [ebp-0C],0
>004D8296    je          004D82A3
 004D8298    mov         eax,dword ptr [ebp-0C]
 004D829B    call        @UStrToPWChar
 004D82A0    mov         dword ptr [ebp-38],eax
 004D82A3    test        byte ptr [ebx+6E],1
>004D82A7    jne         004D82B3
 004D82A9    mov         eax,[0078D264];^NewStyleControls:Boolean
 004D82AE    cmp         byte ptr [eax],0
>004D82B1    jne         004D82BC
 004D82B3    mov         dword ptr [ebp-30],4D6778;DialogHook:UINT
>004D82BA    jmp         004D82C3
 004D82BC    mov         dword ptr [ebp-30],4D7790;ExplorerHook:UINT
 004D82C3    mov         eax,dword ptr [ebx+60]
 004D82C6    test        eax,eax
>004D82C8    je          004D82DB
 004D82CA    or          dword ptr [ebp-40],40
 004D82CE    mov         dword ptr [ebp-2C],eax
 004D82D1    mov         eax,dword ptr [ebx+44]
 004D82D4    test        eax,eax
>004D82D6    je          004D82DB
 004D82D8    mov         dword ptr [ebp-6C],eax
 004D82DB    mov         eax,[0078D590];^Application:TApplication
 004D82E0    mov         eax,dword ptr [eax]
 004D82E2    cmp         byte ptr [eax+0D0],0
>004D82E9    je          004D831C
 004D82EB    xor         ecx,ecx
 004D82ED    mov         dl,1
 004D82EF    mov         eax,[004D67E0];TRedirectorWindow
 004D82F4    call        TWinControl.Create
 004D82F9    mov         esi,eax
 004D82FB    mov         dword ptr [ebx+40],esi
 004D82FE    mov         eax,esi
 004D8300    mov         dword ptr [eax+270],ebx
 004D8306    mov         edx,dword ptr [ebp-14]
 004D8309    mov         dword ptr [eax+274],edx
 004D830F    mov         eax,dword ptr [ebx+40]
 004D8312    call        TWinControl.GetHandle
 004D8317    mov         dword ptr [ebp-70],eax
>004D831A    jmp         004D8324
 004D831C    call        ApplicationMainHandle
 004D8321    mov         dword ptr [ebp-70],eax
 004D8324    lea         ecx,[ebp-74]
 004D8327    mov         edx,dword ptr [ebp-10]
 004D832A    mov         eax,ebx
 004D832C    mov         esi,dword ptr [eax]
 004D832E    call        dword ptr [esi+40]
 004D8331    mov         dword ptr [ebp-18],eax
 004D8334    cmp         dword ptr [ebp-18],0
>004D8338    je          004D8370
 004D833A    lea         edx,[ebp-74]
 004D833D    mov         eax,ebx
 004D833F    call        TOpenDialog.GetFileNames
 004D8344    test        byte ptr [ebp-3F],4
>004D8348    je          004D8353
 004D834A    or          dword ptr [ebx+6C],80
>004D8351    jmp         004D835A
 004D8353    and         dword ptr [ebx+6C],0FFFFFF7F
 004D835A    test        byte ptr [ebp-40],1
>004D835E    je          004D8366
 004D8360    or          dword ptr [ebx+6C],1
>004D8364    jmp         004D836A
 004D8366    and         dword ptr [ebx+6C],0FFFFFFFE
 004D836A    mov         eax,dword ptr [ebp-5C]
 004D836D    mov         dword ptr [ebx+74],eax
 004D8370    xor         eax,eax
 004D8372    pop         edx
 004D8373    pop         ecx
 004D8374    pop         ecx
 004D8375    mov         dword ptr fs:[eax],edx
 004D8378    push        4D8392
 004D837D    lea         eax,[ebp-0C]
 004D8380    mov         edx,3
 004D8385    call        @UStrArrayClr
 004D838A    ret
>004D838B    jmp         @HandleFinally
>004D8390    jmp         004D837D
 004D8392    mov         eax,dword ptr [ebp-18]
 004D8395    pop         esi
 004D8396    pop         ebx
 004D8397    mov         esp,ebp
 004D8399    pop         ebp
 004D839A    ret
*}
end;

//004D83A0
procedure TOpenDialog.DoIncludeItem(const OFN:TOFNotifyEx; var Include:Boolean);
begin
{*
 004D83A0    push        ebx
 004D83A1    cmp         word ptr [eax+0BA],0
>004D83A9    je          004D83B9
 004D83AB    mov         ebx,eax
 004D83AD    mov         eax,dword ptr [ebx+0BC]
 004D83B3    call        dword ptr [ebx+0B8]
 004D83B9    pop         ebx
 004D83BA    ret
*}
end;

//004D83BC
function TSaveDialog.Execute(ParentWnd:HWND):Boolean;
begin
{*
 004D83BC    push        ebx
 004D83BD    push        esi
 004D83BE    mov         esi,edx
 004D83C0    mov         ebx,eax
 004D83C2    mov         edx,4C1650;comdlg32.GetSaveFileNameW:BOOL
 004D83C7    mov         ecx,esi
 004D83C9    mov         eax,ebx
 004D83CB    call        TOpenDialog.DoExecute
 004D83D0    cmp         eax,1
 004D83D3    sbb         eax,eax
 004D83D5    inc         eax
 004D83D6    pop         esi
 004D83D7    pop         ebx
 004D83D8    ret
*}
end;

//004D83DC
function CallDefWndProc:LongInt;
begin
{*
 004D83DC    push        ebp
 004D83DD    mov         ebp,esp
 004D83DF    mov         eax,dword ptr [ebp+8]
 004D83E2    mov         eax,dword ptr [eax+14]
 004D83E5    push        eax
 004D83E6    mov         eax,dword ptr [ebp+8]
 004D83E9    mov         eax,dword ptr [eax+10]
 004D83EC    push        eax
 004D83ED    mov         eax,dword ptr [ebp+8]
 004D83F0    mov         eax,dword ptr [eax+0C]
 004D83F3    push        eax
 004D83F4    mov         eax,dword ptr [ebp+8]
 004D83F7    mov         eax,dword ptr [eax+8]
 004D83FA    push        eax
 004D83FB    movzx       eax,word ptr ds:[786414]
 004D8402    push        eax
 004D8403    mov         eax,dword ptr [ebp+8]
 004D8406    mov         eax,dword ptr [eax+8]
 004D8409    push        eax
 004D840A    call        user32.GetPropW
 004D840F    push        eax
 004D8410    call        user32.CallWindowProcW
 004D8415    pop         ebp
 004D8416    ret
*}
end;

//004D8418
function FindReplaceWndProc(Wnd:HWND; Msg:LongInt; WParam:LongInt; LParam:LongInt):LongInt; stdcall;
begin
{*
 004D8418    push        ebp
 004D8419    mov         ebp,esp
 004D841B    push        ebx
 004D841C    mov         eax,dword ptr [ebp+0C]
 004D841F    sub         eax,2
>004D8422    je          004D8435
 004D8424    sub         eax,80
>004D8429    je          004D849E
 004D842B    sub         eax,4
>004D842E    je          004D8456
>004D8430    jmp         004D84BA
 004D8435    mov         eax,[0078D590];^Application:TApplication
 004D843A    mov         eax,dword ptr [eax]
 004D843C    call        TApplication.GetDialogHandle
 004D8441    cmp         eax,dword ptr [ebp+8]
>004D8444    jne         004D84BA
 004D8446    mov         eax,[0078D590];^Application:TApplication
 004D844B    mov         eax,dword ptr [eax]
 004D844D    xor         edx,edx
 004D844F    call        TApplication.SetDialogHandle
>004D8454    jmp         004D84BA
 004D8456    cmp         dword ptr [ebp+10],0
>004D845A    je          004D847D
 004D845C    mov         eax,[0078D590];^Application:TApplication
 004D8461    mov         eax,dword ptr [eax]
 004D8463    call        TApplication.GetDialogHandle
 004D8468    test        eax,eax
>004D846A    jne         004D84BA
 004D846C    mov         eax,[0078D590];^Application:TApplication
 004D8471    mov         eax,dword ptr [eax]
 004D8473    mov         edx,dword ptr [ebp+8]
 004D8476    call        TApplication.SetDialogHandle
>004D847B    jmp         004D84BA
 004D847D    mov         eax,[0078D590];^Application:TApplication
 004D8482    mov         eax,dword ptr [eax]
 004D8484    call        TApplication.GetDialogHandle
 004D8489    cmp         eax,dword ptr [ebp+8]
>004D848C    jne         004D84BA
 004D848E    mov         eax,[0078D590];^Application:TApplication
 004D8493    mov         eax,dword ptr [eax]
 004D8495    xor         edx,edx
 004D8497    call        TApplication.SetDialogHandle
>004D849C    jmp         004D84BA
 004D849E    push        ebp
 004D849F    call        CallDefWndProc
 004D84A4    pop         ecx
 004D84A5    mov         ebx,eax
 004D84A7    movzx       eax,word ptr ds:[786414]
 004D84AE    push        eax
 004D84AF    mov         eax,dword ptr [ebp+8]
 004D84B2    push        eax
 004D84B3    call        user32.RemovePropW
>004D84B8    jmp         004D84C3
 004D84BA    push        ebp
 004D84BB    call        CallDefWndProc
 004D84C0    pop         ecx
 004D84C1    mov         ebx,eax
 004D84C3    mov         eax,ebx
 004D84C5    pop         ebx
 004D84C6    pop         ebp
 004D84C7    ret         10
*}
end;

//004D84CC
function FindReplaceDialogHook(Wnd:HWND; Msg:UINT; WParam:WPARAM; LParam:LPARAM):UINT; stdcall;
begin
{*
 004D84CC    push        ebp
 004D84CD    mov         ebp,esp
 004D84CF    push        ebx
 004D84D0    push        esi
 004D84D1    push        edi
 004D84D2    mov         edi,dword ptr [ebp+14]
 004D84D5    mov         esi,dword ptr [ebp+0C]
 004D84D8    mov         ebx,dword ptr [ebp+8]
 004D84DB    push        edi
 004D84DC    mov         eax,dword ptr [ebp+10]
 004D84DF    push        eax
 004D84E0    push        esi
 004D84E1    push        ebx
 004D84E2    call        DialogHook
 004D84E7    cmp         esi,110
>004D84ED    jne         004D854D
 004D84EF    mov         esi,dword ptr [edi+1C]
 004D84F2    mov         eax,esi
 004D84F4    call        TFindDialog.GetLeft
 004D84F9    inc         eax
>004D84FA    jne         004D8506
 004D84FC    mov         eax,esi
 004D84FE    call        TFindDialog.GetTop
 004D8503    inc         eax
>004D8504    je          004D8524
 004D8506    push        15
 004D8508    push        0
 004D850A    push        0
 004D850C    mov         eax,esi
 004D850E    call        TFindDialog.GetTop
 004D8513    push        eax
 004D8514    mov         eax,esi
 004D8516    call        TFindDialog.GetLeft
 004D851B    push        eax
 004D851C    push        0
 004D851E    push        ebx
 004D851F    call        user32.SetWindowPos
 004D8524    push        0FC
 004D8526    push        ebx
 004D8527    call        user32.GetWindowLongW
 004D852C    push        eax
 004D852D    movzx       eax,word ptr ds:[786414]
 004D8534    push        eax
 004D8535    push        ebx
 004D8536    call        user32.SetPropW
 004D853B    push        4D8418;FindReplaceWndProc:LongInt
 004D8540    push        0FC
 004D8542    push        ebx
 004D8543    call        user32.SetWindowLongW
 004D8548    mov         eax,1
 004D854D    pop         edi
 004D854E    pop         esi
 004D854F    pop         ebx
 004D8550    pop         ebp
 004D8551    ret         10
*}
end;

//004D8554
constructor TFindDialog.Create;
begin
{*
 004D8554    push        ebp
 004D8555    mov         ebp,esp
 004D8557    push        ecx
 004D8558    push        ebx
 004D8559    push        esi
 004D855A    test        dl,dl
>004D855C    je          004D8566
 004D855E    add         esp,0FFFFFFF0
 004D8561    call        @ClassCreate
 004D8566    mov         byte ptr [ebp-1],dl
 004D8569    mov         ebx,eax
 004D856B    xor         edx,edx
 004D856D    mov         eax,ebx
 004D856F    call        TCommonDialog.Create
 004D8574    movzx       eax,word ptr ds:[4D85FC]
 004D857B    mov         word ptr [ebx+68],ax
 004D857F    mov         dword ptr [ebx+6C],0FFFFFFFF
 004D8586    mov         dword ptr [ebx+70],0FFFFFFFF
 004D858D    lea         esi,[ebx+90]
 004D8593    mov         dword ptr [esi],28
 004D8599    call        ApplicationMainHandle
 004D859E    mov         dword ptr [esi+4],eax
 004D85A1    mov         eax,[00790C38];gvar_00790C38
 004D85A6    mov         dword ptr [esi+8],eax
 004D85A9    lea         eax,[ebx+0B8]
 004D85AF    mov         dword ptr [esi+10],eax
 004D85B2    mov         word ptr [esi+18],200
 004D85B8    lea         eax,[ebx+2B8]
 004D85BE    mov         dword ptr [esi+14],eax
 004D85C1    mov         word ptr [esi+1A],200
 004D85C7    mov         dword ptr [esi+1C],ebx
 004D85CA    mov         dword ptr [esi+20],4D84CC;FindReplaceDialogHook:UINT
 004D85D1    mov         eax,4C1658;comdlg32.FindTextW:HWND
 004D85D6    mov         dword ptr [ebx+88],eax
 004D85DC    mov         eax,ebx
 004D85DE    cmp         byte ptr [ebp-1],0
>004D85E2    je          004D85F3
 004D85E4    call        @AfterConstruction
 004D85E9    pop         dword ptr fs:[0]
 004D85F0    add         esp,0C
 004D85F3    mov         eax,ebx
 004D85F5    pop         esi
 004D85F6    pop         ebx
 004D85F7    pop         ecx
 004D85F8    pop         ebp
 004D85F9    ret
*}
end;

//004D8600
destructor TFindDialog.Destroy();
begin
{*
 004D8600    push        ebx
 004D8601    push        esi
 004D8602    call        @BeforeDestruction
 004D8607    mov         ebx,edx
 004D8609    mov         esi,eax
 004D860B    mov         eax,dword ptr [esi+8C]
 004D8611    test        eax,eax
>004D8613    je          004D8621
 004D8615    push        0
 004D8617    push        0
 004D8619    push        10
 004D861B    push        eax
 004D861C    call        user32.SendMessageW
 004D8621    mov         edx,ebx
 004D8623    and         dl,0FC
 004D8626    mov         eax,esi
 004D8628    call        TCommonDialog.Destroy
 004D862D    test        bl,bl
>004D862F    jle         004D8638
 004D8631    mov         eax,esi
 004D8633    call        @ClassDestroy
 004D8638    pop         esi
 004D8639    pop         ebx
 004D863A    ret
*}
end;

//004D863C
procedure TFindDialog.CloseDialog;
begin
{*
 004D863C    mov         edx,dword ptr [eax+8C]
 004D8642    test        edx,edx
>004D8644    je          004D8652
 004D8646    push        0
 004D8648    push        0
 004D864A    push        10
 004D864C    push        edx
 004D864D    call        user32.PostMessageW
 004D8652    ret
*}
end;

//004D8654
function GetTopWindow(Wnd:THandle; var ReturnVar:THandle):BOOL; stdcall;
begin
{*
 004D8654    push        ebp
 004D8655    mov         ebp,esp
 004D8657    push        ebx
 004D8658    push        esi
 004D8659    push        edi
 004D865A    mov         esi,dword ptr [ebp+8]
 004D865D    mov         eax,esi
 004D865F    call        FindControl
 004D8664    mov         ebx,eax
 004D8666    or          edi,0FFFFFFFF
 004D8669    test        ebx,ebx
>004D866B    je          004D8685
 004D866D    mov         eax,ebx
 004D866F    mov         edx,dword ptr ds:[4E0C38];TForm
 004D8675    call        @IsClass
 004D867A    test        al,al
>004D867C    je          004D8685
 004D867E    mov         eax,dword ptr [ebp+0C]
 004D8681    mov         dword ptr [eax],esi
 004D8683    xor         edi,edi
 004D8685    mov         eax,edi
 004D8687    pop         edi
 004D8688    pop         esi
 004D8689    pop         ebx
 004D868A    pop         ebp
 004D868B    ret         8
*}
end;

//004D8690
function TFindDialog.Execute(ParentWnd:HWND):Boolean;
begin
{*
 004D8690    push        ebx
 004D8691    push        esi
 004D8692    mov         ebx,eax
 004D8694    mov         eax,dword ptr [ebx+8C]
 004D869A    test        eax,eax
>004D869C    je          004D86A9
 004D869E    push        eax
 004D869F    call        user32.BringWindowToTop
 004D86A4    mov         al,1
 004D86A6    pop         esi
 004D86A7    pop         ebx
 004D86A8    ret
 004D86A9    mov         dword ptr [ebx+9C],100
 004D86B3    mov         dword ptr [ebx+0B0],4D84CC;FindReplaceDialogHook:UINT
 004D86BD    xor         ecx,ecx
 004D86BF    mov         dl,1
 004D86C1    mov         eax,[004D67E0];TRedirectorWindow
 004D86C6    call        TWinControl.Create
 004D86CB    mov         esi,eax
 004D86CD    mov         dword ptr [ebx+40],esi
 004D86D0    mov         dword ptr [esi+270],ebx
 004D86D6    lea         eax,[esi+274]
 004D86DC    push        eax
 004D86DD    push        4D8654;GetTopWindow:BOOL
 004D86E2    call        kernel32.GetCurrentThreadId
 004D86E7    push        eax
 004D86E8    call        user32.EnumThreadWindows
 004D86ED    mov         eax,dword ptr [ebx+40]
 004D86F0    call        TWinControl.GetHandle
 004D86F5    mov         dword ptr [ebx+94],eax
 004D86FB    xor         eax,eax
 004D86FD    mov         esi,7864CC
 004D8702    mov         edx,eax
 004D8704    cmp         dl,0F
>004D8707    ja          004D8711
 004D8709    and         edx,7F
 004D870C    bt          word ptr [ebx+68],dx
>004D8711    jae         004D871B
 004D8713    mov         edx,dword ptr [esi]
 004D8715    or          dword ptr [ebx+9C],edx
 004D871B    inc         eax
 004D871C    add         esi,4
 004D871F    cmp         al,0D
>004D8721    jne         004D8702
 004D8723    cmp         dword ptr [ebx+60],0
>004D8727    je          004D873C
 004D8729    or          dword ptr [ebx+9C],200
 004D8733    mov         eax,dword ptr [ebx+60]
 004D8736    mov         dword ptr [ebx+0B4],eax
 004D873C    mov         dword ptr ds:[786410],ebx
 004D8742    lea         eax,[ebx+90]
 004D8748    push        eax
 004D8749    call        dword ptr [ebx+88]
 004D874F    mov         esi,eax
 004D8751    mov         dword ptr [ebx+8C],esi
 004D8757    test        esi,esi
 004D8759    setne       al
 004D875C    pop         esi
 004D875D    pop         ebx
 004D875E    ret
*}
end;

//004D8760
procedure TCustomFileDialog.DoOnExecute;
begin
{*
 004D8760    push        ebx
 004D8761    cmp         word ptr [eax+7A],0
>004D8766    je          004D8772
 004D8768    mov         ebx,eax
 004D876A    mov         edx,eax
 004D876C    mov         eax,dword ptr [ebx+7C]
 004D876F    call        dword ptr [ebx+78]
 004D8772    pop         ebx
 004D8773    ret
*}
end;

//004D8774
function TFindDialog.GetFindText:UnicodeString;
begin
{*
 004D8774    push        ebx
 004D8775    push        esi
 004D8776    mov         esi,edx
 004D8778    mov         ebx,eax
 004D877A    mov         eax,esi
 004D877C    lea         edx,[ebx+0B8]
 004D8782    mov         ecx,100
 004D8787    call        @UStrFromWArray
 004D878C    pop         esi
 004D878D    pop         ebx
 004D878E    ret
*}
end;

//004D8790
function TFindDialog.GetLeft:Integer;
begin
{*
 004D8790    push        ebx
 004D8791    add         esp,0FFFFFFF8
 004D8794    mov         ebx,eax
 004D8796    mov         edx,esp
 004D8798    mov         eax,ebx
 004D879A    call        TFindDialog.GetPosition
 004D879F    mov         eax,dword ptr [esp]
 004D87A2    pop         ecx
 004D87A3    pop         edx
 004D87A4    pop         ebx
 004D87A5    ret
*}
end;

//004D87A8
function TFindDialog.GetPosition:TPoint;
begin
{*
 004D87A8    push        ebx
 004D87A9    add         esp,0FFFFFFF0
 004D87AC    mov         ebx,edx
 004D87AE    mov         edx,dword ptr [eax+6C]
 004D87B1    mov         dword ptr [ebx],edx
 004D87B3    mov         edx,dword ptr [eax+70]
 004D87B6    mov         dword ptr [ebx+4],edx
 004D87B9    mov         edx,dword ptr [eax+8C]
 004D87BF    test        edx,edx
>004D87C1    je          004D87D6
 004D87C3    push        esp
 004D87C4    push        edx
 004D87C5    call        user32.GetWindowRect
 004D87CA    mov         eax,dword ptr [esp]
 004D87CD    mov         dword ptr [ebx],eax
 004D87CF    mov         eax,dword ptr [esp+4]
 004D87D3    mov         dword ptr [ebx+4],eax
 004D87D6    add         esp,10
 004D87D9    pop         ebx
 004D87DA    ret
*}
end;

//004D87DC
function TFindDialog.GetReplaceText:UnicodeString;
begin
{*
 004D87DC    push        ebx
 004D87DD    push        esi
 004D87DE    mov         esi,edx
 004D87E0    mov         ebx,eax
 004D87E2    mov         eax,esi
 004D87E4    lea         edx,[ebx+2B8]
 004D87EA    mov         ecx,100
 004D87EF    call        @UStrFromWArray
 004D87F4    pop         esi
 004D87F5    pop         ebx
 004D87F6    ret
*}
end;

//004D87F8
function TFindDialog.GetTop:Integer;
begin
{*
 004D87F8    push        ebx
 004D87F9    add         esp,0FFFFFFF8
 004D87FC    mov         ebx,eax
 004D87FE    mov         edx,esp
 004D8800    mov         eax,ebx
 004D8802    call        TFindDialog.GetPosition
 004D8807    mov         eax,dword ptr [esp+4]
 004D880B    pop         ecx
 004D880C    pop         edx
 004D880D    pop         ebx
 004D880E    ret
*}
end;

//004D8810
function TFindDialog.MessageHook(var Msg:TMessage):Boolean;
begin
{*
 004D8810    push        ebx
 004D8811    push        esi
 004D8812    push        edi
 004D8813    add         esp,0FFFFFFF0
 004D8816    mov         ebx,edx
 004D8818    mov         edi,eax
 004D881A    mov         edx,ebx
 004D881C    mov         eax,edi
 004D881E    call        TCommonDialog.MessageHook
 004D8823    test        al,al
>004D8825    jne         004D88E9
 004D882B    mov         edx,dword ptr [ebx]
 004D882D    cmp         edx,dword ptr ds:[7932AC]
>004D8833    jne         004D88E9
 004D8839    mov         edx,dword ptr [ebx+8]
 004D883C    lea         ecx,[edi+90]
 004D8842    cmp         edx,ecx
>004D8844    jne         004D88E9
 004D884A    movzx       eax,word ptr ds:[4D88F0]
 004D8851    mov         word ptr [edi+68],ax
 004D8855    xor         ebx,ebx
 004D8857    mov         esi,7864CC
 004D885C    mov         eax,dword ptr [edi+9C]
 004D8862    and         eax,dword ptr [esi]
>004D8864    je          004D8874
 004D8866    mov         eax,ebx
 004D8868    cmp         al,0F
>004D886A    ja          004D8874
 004D886C    and         eax,7F
 004D886F    bts         word ptr [edi+68],ax
 004D8874    inc         ebx
 004D8875    add         esi,4
 004D8878    cmp         bl,0D
>004D887B    jne         004D885C
 004D887D    mov         eax,dword ptr [edi+9C]
 004D8883    test        al,8
>004D8885    je          004D8894
 004D8887    mov         eax,edi
 004D8889    mov         si,0FFEE
 004D888D    call        @CallDynaInst
>004D8892    jmp         004D88E7
 004D8894    test        al,30
>004D8896    je          004D88A5
 004D8898    mov         eax,edi
 004D889A    mov         si,0FFED
 004D889E    call        @CallDynaInst
>004D88A3    jmp         004D88E7
 004D88A5    test        al,40
>004D88A7    je          004D88E7
 004D88A9    push        esp
 004D88AA    mov         eax,dword ptr [edi+8C]
 004D88B0    push        eax
 004D88B1    call        user32.GetWindowRect
 004D88B6    mov         eax,dword ptr [esp]
 004D88B9    mov         dword ptr [edi+6C],eax
 004D88BC    mov         eax,dword ptr [esp+4]
 004D88C0    mov         dword ptr [edi+70],eax
 004D88C3    xor         eax,eax
 004D88C5    mov         dword ptr [edi+8C],eax
 004D88CB    push        0
 004D88CD    push        0
 004D88CF    push        0B021
 004D88D4    mov         eax,dword ptr [edi+40]
 004D88D7    call        TWinControl.GetHandle
 004D88DC    push        eax
 004D88DD    call        user32.PostMessageW
 004D88E2    xor         eax,eax
 004D88E4    mov         dword ptr [edi+40],eax
 004D88E7    mov         al,1
 004D88E9    add         esp,10
 004D88EC    pop         edi
 004D88ED    pop         esi
 004D88EE    pop         ebx
 004D88EF    ret
*}
end;

//004D88F4
procedure TFindDialog.Replace;
begin
{*
 004D88F4    push        ebx
 004D88F5    cmp         word ptr [eax+82],0
>004D88FD    je          004D890F
 004D88FF    mov         ebx,eax
 004D8901    mov         edx,eax
 004D8903    mov         eax,dword ptr [ebx+84]
 004D8909    call        dword ptr [ebx+80]
 004D890F    pop         ebx
 004D8910    ret
*}
end;

//004D8914
procedure TFindDialog.SetFindText(const Value:UnicodeString);
begin
{*
 004D8914    push        ebx
 004D8915    push        esi
 004D8916    mov         esi,edx
 004D8918    mov         ebx,eax
 004D891A    mov         eax,esi
 004D891C    call        @UStrToPWChar
 004D8921    mov         edx,eax
 004D8923    lea         eax,[ebx+0B8]
 004D8929    mov         ecx,0FF
 004D892E    call        StrLCopy
 004D8933    pop         esi
 004D8934    pop         ebx
 004D8935    ret
*}
end;

//004D8938
procedure TFindDialog.SetLeft(Value:Integer);
begin
{*
 004D8938    push        ebx
 004D8939    push        esi
 004D893A    add         esp,0FFFFFFF8
 004D893D    mov         esi,edx
 004D893F    mov         ebx,eax
 004D8941    mov         eax,ebx
 004D8943    call        TFindDialog.GetTop
 004D8948    mov         dword ptr [esp],esi
 004D894B    mov         dword ptr [esp+4],eax
 004D894F    mov         edx,esp
 004D8951    mov         eax,ebx
 004D8953    call        TFindDialog.SetPosition
 004D8958    pop         ecx
 004D8959    pop         edx
 004D895A    pop         esi
 004D895B    pop         ebx
 004D895C    ret
*}
end;

//004D8960
procedure TFindDialog.SetPosition(const Value:TPoint);
begin
{*
 004D8960    push        ebx
 004D8961    mov         ecx,dword ptr [edx]
 004D8963    cmp         ecx,dword ptr [eax+6C]
>004D8966    jne         004D8970
 004D8968    mov         ecx,dword ptr [edx+4]
 004D896B    cmp         ecx,dword ptr [eax+70]
>004D896E    je          004D899A
 004D8970    mov         ecx,dword ptr [edx]
 004D8972    mov         dword ptr [eax+6C],ecx
 004D8975    mov         ecx,dword ptr [edx+4]
 004D8978    mov         dword ptr [eax+70],ecx
 004D897B    mov         ecx,dword ptr [eax+8C]
 004D8981    test        ecx,ecx
>004D8983    je          004D899A
 004D8985    push        15
 004D8987    push        0
 004D8989    push        0
 004D898B    mov         ebx,dword ptr [edx+4]
 004D898E    push        ebx
 004D898F    mov         edx,dword ptr [edx]
 004D8991    push        edx
 004D8992    push        0
 004D8994    push        ecx
 004D8995    call        user32.SetWindowPos
 004D899A    pop         ebx
 004D899B    ret
*}
end;

//004D899C
procedure TFindDialog.SetReplaceText(const Value:UnicodeString);
begin
{*
 004D899C    push        ebx
 004D899D    push        esi
 004D899E    mov         esi,edx
 004D89A0    mov         ebx,eax
 004D89A2    mov         eax,esi
 004D89A4    call        @UStrToPWChar
 004D89A9    mov         edx,eax
 004D89AB    lea         eax,[ebx+2B8]
 004D89B1    mov         ecx,0FF
 004D89B6    call        StrLCopy
 004D89BB    pop         esi
 004D89BC    pop         ebx
 004D89BD    ret
*}
end;

//004D89C0
procedure TFindDialog.SetTop(Value:Integer);
begin
{*
 004D89C0    push        ebx
 004D89C1    push        esi
 004D89C2    add         esp,0FFFFFFF8
 004D89C5    mov         esi,edx
 004D89C7    mov         ebx,eax
 004D89C9    mov         eax,ebx
 004D89CB    call        TFindDialog.GetLeft
 004D89D0    mov         dword ptr [esp],eax
 004D89D3    mov         dword ptr [esp+4],esi
 004D89D7    mov         edx,esp
 004D89D9    mov         eax,ebx
 004D89DB    call        TFindDialog.SetPosition
 004D89E0    pop         ecx
 004D89E1    pop         edx
 004D89E2    pop         esi
 004D89E3    pop         ebx
 004D89E4    ret
*}
end;

//004D89E8
constructor TReplaceDialog.Create;
begin
{*
 004D89E8    push        ebx
 004D89E9    push        esi
 004D89EA    test        dl,dl
>004D89EC    je          004D89F6
 004D89EE    add         esp,0FFFFFFF0
 004D89F1    call        @ClassCreate
 004D89F6    mov         ebx,edx
 004D89F8    mov         esi,eax
 004D89FA    xor         edx,edx
 004D89FC    mov         eax,esi
 004D89FE    call        TFindDialog.Create
 004D8A03    mov         eax,4C1660;comdlg32.ReplaceTextW:HWND
 004D8A08    mov         dword ptr [esi+88],eax
 004D8A0E    mov         eax,esi
 004D8A10    test        bl,bl
>004D8A12    je          004D8A23
 004D8A14    call        @AfterConstruction
 004D8A19    pop         dword ptr fs:[0]
 004D8A20    add         esp,0C
 004D8A23    mov         eax,esi
 004D8A25    pop         esi
 004D8A26    pop         ebx
 004D8A27    ret
*}
end;

//004D8A28
function AllocCoTaskMemStr(const S:UnicodeString):LPCWSTR;
begin
{*
 004D8A28    push        ebp
 004D8A29    mov         ebp,esp
 004D8A2B    push        0
 004D8A2D    push        ebx
 004D8A2E    push        esi
 004D8A2F    push        edi
 004D8A30    mov         edi,eax
 004D8A32    xor         eax,eax
 004D8A34    push        ebp
 004D8A35    push        4D8A8A
 004D8A3A    push        dword ptr fs:[eax]
 004D8A3D    mov         dword ptr fs:[eax],esp
 004D8A40    mov         eax,edi
 004D8A42    test        eax,eax
>004D8A44    je          004D8A4B
 004D8A46    sub         eax,4
 004D8A49    mov         eax,dword ptr [eax]
 004D8A4B    mov         esi,eax
 004D8A4D    mov         eax,esi
 004D8A4F    add         eax,eax
 004D8A51    add         eax,2
 004D8A54    push        eax
 004D8A55    call        ole32.CoTaskMemAlloc
 004D8A5A    mov         ebx,eax
 004D8A5C    lea         eax,[ebp-4]
 004D8A5F    mov         edx,edi
 004D8A61    call        @WStrFromUStr
 004D8A66    mov         edx,dword ptr [ebp-4]
 004D8A69    mov         ecx,esi
 004D8A6B    mov         eax,ebx
 004D8A6D    call        WStrPLCopy
 004D8A72    mov         ebx,eax
 004D8A74    xor         eax,eax
 004D8A76    pop         edx
 004D8A77    pop         ecx
 004D8A78    pop         ecx
 004D8A79    mov         dword ptr fs:[eax],edx
 004D8A7C    push        4D8A91
 004D8A81    lea         eax,[ebp-4]
 004D8A84    call        @WStrClr
 004D8A89    ret
>004D8A8A    jmp         @HandleFinally
>004D8A8F    jmp         004D8A81
 004D8A91    mov         eax,ebx
 004D8A93    pop         edi
 004D8A94    pop         esi
 004D8A95    pop         ebx
 004D8A96    pop         ecx
 004D8A97    pop         ebp
 004D8A98    ret
*}
end;

//004D8A9C
constructor TFileTypeItem.Create;
begin
{*
 004D8A9C    push        ebx
 004D8A9D    push        esi
 004D8A9E    test        dl,dl
>004D8AA0    je          004D8AAA
 004D8AA2    add         esp,0FFFFFFF0
 004D8AA5    call        @ClassCreate
 004D8AAA    mov         ebx,edx
 004D8AAC    mov         esi,eax
 004D8AAE    xor         edx,edx
 004D8AB0    mov         eax,esi
 004D8AB2    call        TCollectionItem.Create
 004D8AB7    xor         eax,eax
 004D8AB9    mov         dword ptr [esi+10],eax
 004D8ABC    xor         eax,eax
 004D8ABE    mov         dword ptr [esi+18],eax
 004D8AC1    mov         eax,esi
 004D8AC3    test        bl,bl
>004D8AC5    je          004D8AD6
 004D8AC7    call        @AfterConstruction
 004D8ACC    pop         dword ptr fs:[0]
 004D8AD3    add         esp,0C
 004D8AD6    mov         eax,esi
 004D8AD8    pop         esi
 004D8AD9    pop         ebx
 004D8ADA    ret
*}
end;

//004D8ADC
destructor TFileTypeItem.Destroy();
begin
{*
 004D8ADC    push        ebx
 004D8ADD    push        esi
 004D8ADE    call        @BeforeDestruction
 004D8AE3    mov         ebx,edx
 004D8AE5    mov         esi,eax
 004D8AE7    mov         eax,dword ptr [esi+10]
 004D8AEA    test        eax,eax
>004D8AEC    je          004D8AF4
 004D8AEE    push        eax
 004D8AEF    call        ole32.CoTaskMemFree
 004D8AF4    mov         eax,dword ptr [esi+18]
 004D8AF7    test        eax,eax
>004D8AF9    je          004D8B01
 004D8AFB    push        eax
 004D8AFC    call        ole32.CoTaskMemFree
 004D8B01    mov         edx,ebx
 004D8B03    and         dl,0FC
 004D8B06    mov         eax,esi
 004D8B08    call        TCollectionItem.Destroy
 004D8B0D    test        bl,bl
>004D8B0F    jle         004D8B18
 004D8B11    mov         eax,esi
 004D8B13    call        @ClassDestroy
 004D8B18    pop         esi
 004D8B19    pop         ebx
 004D8B1A    ret
*}
end;

//004D8B1C
function TFileTypeItem.GetDisplayNameWStr:LPCWSTR;
begin
{*
 004D8B1C    push        ebx
 004D8B1D    push        esi
 004D8B1E    mov         ebx,eax
 004D8B20    mov         eax,dword ptr [ebx+10]
 004D8B23    test        eax,eax
>004D8B25    je          004D8B2D
 004D8B27    push        eax
 004D8B28    call        ole32.CoTaskMemFree
 004D8B2D    mov         eax,dword ptr [ebx+0C]
 004D8B30    call        AllocCoTaskMemStr
 004D8B35    mov         esi,eax
 004D8B37    mov         dword ptr [ebx+10],esi
 004D8B3A    mov         eax,esi
 004D8B3C    pop         esi
 004D8B3D    pop         ebx
 004D8B3E    ret
*}
end;

//004D8B40
function TFavoriteLinkItem.GetDisplayName:UnicodeString;
begin
{*
 004D8B40    push        ebx
 004D8B41    push        esi
 004D8B42    mov         esi,edx
 004D8B44    mov         ebx,eax
 004D8B46    cmp         dword ptr [ebx+0C],0
>004D8B4A    je          004D8B59
 004D8B4C    mov         eax,esi
 004D8B4E    mov         edx,dword ptr [ebx+0C]
 004D8B51    call        @UStrAsg
 004D8B56    pop         esi
 004D8B57    pop         ebx
 004D8B58    ret
 004D8B59    mov         edx,esi
 004D8B5B    mov         eax,ebx
 004D8B5D    call        TCollectionItem.GetDisplayName
 004D8B62    pop         esi
 004D8B63    pop         ebx
 004D8B64    ret
*}
end;

//004D8B68
function TFileTypeItem.GetFileMaskWStr:LPCWSTR;
begin
{*
 004D8B68    push        ebx
 004D8B69    push        esi
 004D8B6A    mov         ebx,eax
 004D8B6C    mov         eax,dword ptr [ebx+18]
 004D8B6F    test        eax,eax
>004D8B71    je          004D8B79
 004D8B73    push        eax
 004D8B74    call        ole32.CoTaskMemFree
 004D8B79    mov         eax,dword ptr [ebx+14]
 004D8B7C    call        AllocCoTaskMemStr
 004D8B81    mov         esi,eax
 004D8B83    mov         dword ptr [ebx+18],esi
 004D8B86    mov         eax,esi
 004D8B88    pop         esi
 004D8B89    pop         ebx
 004D8B8A    ret
*}
end;

//004D8B8C
function TFileTypeItems.Add:TFileTypeItem;
begin
{*
 004D8B8C    push        ebx
 004D8B8D    mov         ebx,eax
 004D8B8F    mov         eax,ebx
 004D8B91    call        TCollection.Add
 004D8B96    pop         ebx
 004D8B97    ret
*}
end;

//004D8B98
function TFileTypeItems.FilterSpecArray:TComdlgFilterSpecArray;
begin
{*
 004D8B98    push        ebx
 004D8B99    push        esi
 004D8B9A    push        edi
 004D8B9B    push        ebp
 004D8B9C    mov         ebp,edx
 004D8B9E    mov         esi,eax
 004D8BA0    mov         ebx,esi
 004D8BA2    mov         eax,dword ptr [ebx+8]
 004D8BA5    mov         eax,dword ptr [eax+8]
 004D8BA8    push        eax
 004D8BA9    mov         eax,ebp
 004D8BAB    mov         ecx,1
 004D8BB0    mov         edx,dword ptr ds:[4ACD9C];TComdlgFilterSpecArray
 004D8BB6    call        @DynArraySetLength
 004D8BBB    add         esp,4
 004D8BBE    mov         eax,dword ptr [ebx+8]
 004D8BC1    mov         edi,dword ptr [eax+8]
 004D8BC4    dec         edi
 004D8BC5    test        edi,edi
>004D8BC7    jl          004D8BF9
 004D8BC9    inc         edi
 004D8BCA    xor         ebx,ebx
 004D8BCC    mov         edx,ebx
 004D8BCE    mov         eax,esi
 004D8BD0    call        TFileTypeItems.GetItem
 004D8BD5    call        TFileTypeItem.GetDisplayNameWStr
 004D8BDA    mov         edx,dword ptr [ebp]
 004D8BDD    mov         dword ptr [edx+ebx*8],eax
 004D8BE0    mov         edx,ebx
 004D8BE2    mov         eax,esi
 004D8BE4    call        TFileTypeItems.GetItem
 004D8BE9    call        TFileTypeItem.GetFileMaskWStr
 004D8BEE    mov         edx,dword ptr [ebp]
 004D8BF1    mov         dword ptr [edx+ebx*8+4],eax
 004D8BF5    inc         ebx
 004D8BF6    dec         edi
>004D8BF7    jne         004D8BCC
 004D8BF9    pop         ebp
 004D8BFA    pop         edi
 004D8BFB    pop         esi
 004D8BFC    pop         ebx
 004D8BFD    ret
*}
end;

//004D8C00
function TFileTypeItems.GetItem(Index:Integer):TFileTypeItem;
begin
{*
 004D8C00    push        ebx
 004D8C01    push        esi
 004D8C02    mov         esi,edx
 004D8C04    mov         ebx,eax
 004D8C06    mov         edx,esi
 004D8C08    mov         eax,ebx
 004D8C0A    call        TCollection.GetItem
 004D8C0F    pop         esi
 004D8C10    pop         ebx
 004D8C11    ret
*}
end;

//004D8C14
constructor TFavoriteLinkItemsEnumerator.Create;
begin
{*
 004D8C14    push        ebx
 004D8C15    push        esi
 004D8C16    push        edi
 004D8C17    test        dl,dl
>004D8C19    je          004D8C23
 004D8C1B    add         esp,0FFFFFFF0
 004D8C1E    call        @ClassCreate
 004D8C23    mov         esi,ecx
 004D8C25    mov         ebx,edx
 004D8C27    mov         edi,eax
 004D8C29    xor         edx,edx
 004D8C2B    mov         eax,edi
 004D8C2D    call        TObject.Create
 004D8C32    mov         dword ptr [edi+4],0FFFFFFFF
 004D8C39    mov         dword ptr [edi+8],esi
 004D8C3C    mov         eax,edi
 004D8C3E    test        bl,bl
>004D8C40    je          004D8C51
 004D8C42    call        @AfterConstruction
 004D8C47    pop         dword ptr fs:[0]
 004D8C4E    add         esp,0C
 004D8C51    mov         eax,edi
 004D8C53    pop         edi
 004D8C54    pop         esi
 004D8C55    pop         ebx
 004D8C56    ret
*}
end;

//004D8C58
function TFavoriteLinkItemsEnumerator.GetCurrent:TFavoriteLinkItem;
begin
{*
 004D8C58    mov         edx,dword ptr [eax+4]
 004D8C5B    mov         eax,dword ptr [eax+8]
 004D8C5E    call        TFavoriteLinkItems.GetItem
 004D8C63    ret
*}
end;

//004D8C64
function TFavoriteLinkItemsEnumerator.MoveNext:Boolean;
begin
{*
 004D8C64    mov         edx,dword ptr [eax+8]
 004D8C67    mov         edx,dword ptr [edx+8]
 004D8C6A    mov         edx,dword ptr [edx+8]
 004D8C6D    dec         edx
 004D8C6E    cmp         edx,dword ptr [eax+4]
 004D8C71    setg        dl
 004D8C74    test        dl,dl
>004D8C76    je          004D8C7B
 004D8C78    inc         dword ptr [eax+4]
 004D8C7B    mov         eax,edx
 004D8C7D    ret
*}
end;

//004D8C80
function TFileTypeItem.GetDisplayName:UnicodeString;
begin
{*
 004D8C80    push        ebx
 004D8C81    push        esi
 004D8C82    mov         esi,edx
 004D8C84    mov         ebx,eax
 004D8C86    cmp         dword ptr [ebx+0C],0
>004D8C8A    je          004D8C99
 004D8C8C    mov         eax,esi
 004D8C8E    mov         edx,dword ptr [ebx+0C]
 004D8C91    call        @UStrAsg
 004D8C96    pop         esi
 004D8C97    pop         ebx
 004D8C98    ret
 004D8C99    mov         edx,esi
 004D8C9B    mov         eax,ebx
 004D8C9D    call        TCollectionItem.GetDisplayName
 004D8CA2    pop         esi
 004D8CA3    pop         ebx
 004D8CA4    ret
*}
end;

//004D8CA8
function TFavoriteLinkItems.Add:TFavoriteLinkItem;
begin
{*
 004D8CA8    push        ebx
 004D8CA9    mov         ebx,eax
 004D8CAB    mov         eax,ebx
 004D8CAD    call        TCollection.Add
 004D8CB2    pop         ebx
 004D8CB3    ret
*}
end;

//004D8CB4
function TFavoriteLinkItems.GetEnumerator:TFavoriteLinkItemsEnumerator;
begin
{*
 004D8CB4    mov         ecx,eax
 004D8CB6    mov         dl,1
 004D8CB8    mov         eax,[004D33EC];TFavoriteLinkItemsEnumerator
 004D8CBD    call        TFavoriteLinkItemsEnumerator.Create
 004D8CC2    ret
*}
end;

//004D8CC4
function TFavoriteLinkItems.GetItem(Index:Integer):TFavoriteLinkItem;
begin
{*
 004D8CC4    push        ebx
 004D8CC5    push        esi
 004D8CC6    mov         esi,edx
 004D8CC8    mov         ebx,eax
 004D8CCA    mov         edx,esi
 004D8CCC    mov         eax,ebx
 004D8CCE    call        TCollection.GetItem
 004D8CD3    pop         esi
 004D8CD4    pop         ebx
 004D8CD5    ret
*}
end;

//004D90CC
constructor TFileDialogEvents.Create;
begin
{*
 004D90CC    push        ebx
 004D90CD    push        esi
 004D90CE    push        edi
 004D90CF    test        dl,dl
>004D90D1    je          004D90DB
 004D90D3    add         esp,0FFFFFFF0
 004D90D6    call        @ClassCreate
 004D90DB    mov         esi,ecx
 004D90DD    mov         ebx,edx
 004D90DF    mov         edi,eax
 004D90E1    xor         edx,edx
 004D90E3    mov         eax,edi
 004D90E5    call        TObject.Create
 004D90EA    mov         dword ptr [edi+0C],esi
 004D90ED    mov         byte ptr [edi+10],1
 004D90F1    mov         eax,edi
 004D90F3    test        bl,bl
>004D90F5    je          004D9106
 004D90F7    call        @AfterConstruction
 004D90FC    pop         dword ptr fs:[0]
 004D9103    add         esp,0C
 004D9106    mov         eax,edi
 004D9108    pop         edi
 004D9109    pop         esi
 004D910A    pop         ebx
 004D910B    ret
*}
end;

//004D910C
function TFileDialogEvents.OnFileOk(pfd:IFileDialog):HRESULT; stdcall;
begin
{*
 004D910C    push        ebp
 004D910D    mov         ebp,esp
 004D910F    push        esi
 004D9110    mov         eax,dword ptr [ebp+8]
 004D9113    mov         esi,dword ptr [eax+0C]
 004D9116    cmp         word ptr [esi+82],0
>004D911E    je          004D912D
 004D9120    mov         eax,esi
 004D9122    mov         si,0FFE6
 004D9126    call        @CallDynaInst
>004D912B    jmp         004D9132
 004D912D    mov         eax,80004001
 004D9132    pop         esi
 004D9133    pop         ebp
 004D9134    ret         8
*}
end;

//004D9138
function TFileDialogEvents.OnFolderChange(pfd:IFileDialog):HRESULT; stdcall;
begin
{*
 004D9138    push        ebp
 004D9139    mov         ebp,esp
 004D913B    push        esi
 004D913C    mov         eax,dword ptr [ebp+8]
 004D913F    mov         esi,dword ptr [eax+0C]
 004D9142    cmp         word ptr [esi+8A],0
>004D914A    je          004D9159
 004D914C    mov         eax,esi
 004D914E    mov         si,0FFE5
 004D9152    call        @CallDynaInst
>004D9157    jmp         004D915E
 004D9159    mov         eax,80004001
 004D915E    pop         esi
 004D915F    pop         ebp
 004D9160    ret         8
*}
end;

//004D9164
function TFileDialogEvents.OnFolderChanging(pfd:IFileDialog; psiFolder:IShellItem):HRESULT; stdcall;
begin
{*
 004D9164    push        ebp
 004D9165    mov         ebp,esp
 004D9167    push        esi
 004D9168    mov         eax,dword ptr [ebp+8]
 004D916B    mov         esi,dword ptr [eax+0C]
 004D916E    cmp         word ptr [esi+92],0
>004D9176    je          004D9188
 004D9178    mov         edx,dword ptr [ebp+10]
 004D917B    mov         eax,esi
 004D917D    mov         si,0FFE4
 004D9181    call        @CallDynaInst
>004D9186    jmp         004D918D
 004D9188    mov         eax,80004001
 004D918D    pop         esi
 004D918E    pop         ebp
 004D918F    ret         0C
*}
end;

//004D9194
function TFileDialogEvents.OnOverwrite(pfd:IFileDialog; psi:IShellItem; pResponse:Cardinal):HRESULT; stdcall;
begin
{*
 004D9194    push        ebp
 004D9195    mov         ebp,esp
 004D9197    push        esi
 004D9198    mov         eax,dword ptr [ebp+8]
 004D919B    mov         esi,dword ptr [eax+0C]
 004D919E    cmp         word ptr [esi+9A],0
>004D91A6    je          004D91BB
 004D91A8    mov         ecx,dword ptr [ebp+14]
 004D91AB    mov         edx,dword ptr [ebp+10]
 004D91AE    mov         eax,esi
 004D91B0    mov         si,0FFE3
 004D91B4    call        @CallDynaInst
>004D91B9    jmp         004D91C0
 004D91BB    mov         eax,80004001
 004D91C0    pop         esi
 004D91C1    pop         ebp
 004D91C2    ret         10
*}
end;

//004D91C8
function TFileDialogEvents.OnSelectionChange(pfd:IFileDialog):HRESULT; stdcall;
begin
{*
 004D91C8    push        ebp
 004D91C9    mov         ebp,esp
 004D91CB    push        ebx
 004D91CC    push        esi
 004D91CD    mov         ebx,dword ptr [ebp+8]
 004D91D0    cmp         byte ptr [ebx+10],0
>004D91D4    je          004D91E2
 004D91D6    mov         eax,dword ptr [ebx+0C]
 004D91D9    call        TCustomFileDialog.GetWindowHandle
 004D91DE    mov         byte ptr [ebx+10],0
 004D91E2    mov         esi,dword ptr [ebx+0C]
 004D91E5    cmp         word ptr [esi+0A2],0
>004D91ED    je          004D91FC
 004D91EF    mov         eax,esi
 004D91F1    mov         si,0FFE2
 004D91F5    call        @CallDynaInst
>004D91FA    jmp         004D9201
 004D91FC    mov         eax,80004001
 004D9201    pop         esi
 004D9202    pop         ebx
 004D9203    pop         ebp
 004D9204    ret         8
*}
end;

//004D9208
function TFileDialogEvents.OnShareViolation(pfd:IFileDialog; psi:IShellItem; pResponse:Cardinal):HRESULT; stdcall;
begin
{*
 004D9208    push        ebp
 004D9209    mov         ebp,esp
 004D920B    push        esi
 004D920C    mov         eax,dword ptr [ebp+8]
 004D920F    mov         esi,dword ptr [eax+0C]
 004D9212    cmp         word ptr [esi+0AA],0
>004D921A    je          004D922F
 004D921C    mov         ecx,dword ptr [ebp+14]
 004D921F    mov         edx,dword ptr [ebp+10]
 004D9222    mov         eax,esi
 004D9224    mov         si,0FFE1
 004D9228    call        @CallDynaInst
>004D922D    jmp         004D9234
 004D922F    mov         eax,80004001
 004D9234    pop         esi
 004D9235    pop         ebp
 004D9236    ret         10
*}
end;

//004D923C
function TFileDialogEvents.OnTypeChange(pfd:IFileDialog):HRESULT; stdcall;
begin
{*
 004D923C    push        ebp
 004D923D    mov         ebp,esp
 004D923F    push        ebx
 004D9240    push        esi
 004D9241    mov         ebx,dword ptr [ebp+8]
 004D9244    cmp         byte ptr [ebx+10],0
>004D9248    je          004D9256
 004D924A    mov         eax,dword ptr [ebx+0C]
 004D924D    call        TCustomFileDialog.GetWindowHandle
 004D9252    mov         byte ptr [ebx+10],0
 004D9256    mov         eax,dword ptr [ebx+0C]
 004D9259    mov         si,0FFE0
 004D925D    call        @CallDynaInst
 004D9262    pop         esi
 004D9263    pop         ebx
 004D9264    pop         ebp
 004D9265    ret         8
*}
end;

//004D9268
constructor TCustomFileDialog.Create;
begin
{*
 004D9268    push        ebx
 004D9269    push        esi
 004D926A    test        dl,dl
>004D926C    je          004D9276
 004D926E    add         esp,0FFFFFFF0
 004D9271    call        @ClassCreate
 004D9276    mov         ebx,edx
 004D9278    mov         esi,eax
 004D927A    xor         edx,edx
 004D927C    mov         eax,esi
 004D927E    call        TComponent.Create
 004D9283    mov         dl,1
 004D9285    mov         eax,[0043C7BC];TStringList
 004D928A    call        TStringList.Create
 004D928F    mov         dword ptr [esi+50],eax
 004D9292    mov         dword ptr [esi+54],1
 004D9299    mov         ecx,dword ptr ds:[4D2F44];TFileTypeItem
 004D929F    mov         dl,1
 004D92A1    mov         eax,[004D31A8];TFileTypeItems
 004D92A6    call        TCollection.Create
 004D92AB    mov         dword ptr [esi+58],eax
 004D92AE    xor         eax,eax
 004D92B0    mov         dword ptr [esi+5C],eax
 004D92B3    mov         eax,[004D92FC]
 004D92B8    mov         dword ptr [esi+64],eax
 004D92BB    mov         ecx,dword ptr ds:[4D32D4];TFavoriteLinkItem
 004D92C1    mov         dl,1
 004D92C3    mov         eax,[004D35A0];TFavoriteLinkItems
 004D92C8    call        TCollection.Create
 004D92CD    mov         dword ptr [esi+44],eax
 004D92D0    lea         eax,[esi+68]
 004D92D3    call        @IntfClear
 004D92D8    lea         eax,[esi+6C]
 004D92DB    call        @IntfClear
 004D92E0    mov         eax,esi
 004D92E2    test        bl,bl
>004D92E4    je          004D92F5
 004D92E6    call        @AfterConstruction
 004D92EB    pop         dword ptr fs:[0]
 004D92F2    add         esp,0C
 004D92F5    mov         eax,esi
 004D92F7    pop         esi
 004D92F8    pop         ebx
 004D92F9    ret
*}
end;

//004D9300
destructor TCustomFileDialog.Destroy();
begin
{*
 004D9300    push        ebx
 004D9301    push        esi
 004D9302    call        @BeforeDestruction
 004D9307    mov         ebx,edx
 004D9309    mov         esi,eax
 004D930B    mov         eax,dword ptr [esi+50]
 004D930E    call        TObject.Free
 004D9313    mov         eax,dword ptr [esi+58]
 004D9316    call        TObject.Free
 004D931B    mov         eax,dword ptr [esi+44]
 004D931E    call        TObject.Free
 004D9323    lea         eax,[esi+68]
 004D9326    call        @IntfClear
 004D932B    lea         eax,[esi+6C]
 004D932E    call        @IntfClear
 004D9333    mov         edx,ebx
 004D9335    and         dl,0FC
 004D9338    mov         eax,esi
 004D933A    call        TComponent.Destroy
 004D933F    test        bl,bl
>004D9341    jle         004D934A
 004D9343    mov         eax,esi
 004D9345    call        @ClassDestroy
 004D934A    pop         esi
 004D934B    pop         ebx
 004D934C    ret
*}
end;

//004D9350
procedure TFindDialog.Find;
begin
{*
 004D9350    push        ebx
 004D9351    cmp         word ptr [eax+7A],0
>004D9356    je          004D9362
 004D9358    mov         ebx,eax
 004D935A    mov         edx,eax
 004D935C    mov         eax,dword ptr [ebx+7C]
 004D935F    call        dword ptr [ebx+78]
 004D9362    pop         ebx
 004D9363    ret
*}
end;

//004D9364
procedure TCustomFileDialog.DoOnFileOkClick;
begin
{*
 004D9364    push        ebx
 004D9365    push        ecx
 004D9366    mov         byte ptr [esp],1
 004D936A    cmp         word ptr [eax+82],0
>004D9372    je          004D9386
 004D9374    mov         ecx,esp
 004D9376    mov         ebx,eax
 004D9378    mov         edx,eax
 004D937A    mov         eax,dword ptr [ebx+84]
 004D9380    call        dword ptr [ebx+80]
 004D9386    movzx       eax,byte ptr [esp]
 004D938A    pop         edx
 004D938B    pop         ebx
 004D938C    ret
*}
end;

//004D9390
procedure TCustomFileDialog.DoOnFolderChange;
begin
{*
 004D9390    push        ebx
 004D9391    cmp         word ptr [eax+8A],0
>004D9399    je          004D93AB
 004D939B    mov         ebx,eax
 004D939D    mov         edx,eax
 004D939F    mov         eax,dword ptr [ebx+8C]
 004D93A5    call        dword ptr [ebx+88]
 004D93AB    pop         ebx
 004D93AC    ret
*}
end;

//004D93B0
procedure TCustomFileDialog.DoOnFolderChanging;
begin
{*
 004D93B0    push        ebx
 004D93B1    push        ecx
 004D93B2    mov         byte ptr [esp],1
 004D93B6    cmp         word ptr [eax+92],0
>004D93BE    je          004D93D2
 004D93C0    mov         ecx,esp
 004D93C2    mov         ebx,eax
 004D93C4    mov         edx,eax
 004D93C6    mov         eax,dword ptr [ebx+94]
 004D93CC    call        dword ptr [ebx+90]
 004D93D2    movzx       eax,byte ptr [esp]
 004D93D6    pop         edx
 004D93D7    pop         ebx
 004D93D8    ret
*}
end;

//004D93DC
procedure TCustomFileDialog.DoOnOverwrite(var Response:TFileDialogOverwriteResponse);
begin
{*
 004D93DC    push        ebx
 004D93DD    cmp         word ptr [eax+9A],0
>004D93E5    je          004D93F9
 004D93E7    mov         ecx,edx
 004D93E9    mov         ebx,eax
 004D93EB    mov         edx,eax
 004D93ED    mov         eax,dword ptr [ebx+9C]
 004D93F3    call        dword ptr [ebx+98]
 004D93F9    pop         ebx
 004D93FA    ret
*}
end;

//004D93FC
procedure TCustomTaskDialog.DoOnDialogContructed;
begin
{*
 004D93FC    push        ebx
 004D93FD    cmp         word ptr [eax+0A2],0
>004D9405    je          004D9417
 004D9407    mov         ebx,eax
 004D9409    mov         edx,eax
 004D940B    mov         eax,dword ptr [ebx+0A4]
 004D9411    call        dword ptr [ebx+0A0]
 004D9417    pop         ebx
 004D9418    ret
*}
end;

//004D941C
procedure TCustomFileDialog.DoOnShareViolation(var Response:TFileDialogShareViolationResponse);
begin
{*
 004D941C    push        ebx
 004D941D    cmp         word ptr [eax+0AA],0
>004D9425    je          004D9439
 004D9427    mov         ecx,edx
 004D9429    mov         ebx,eax
 004D942B    mov         edx,eax
 004D942D    mov         eax,dword ptr [ebx+0AC]
 004D9433    call        dword ptr [ebx+0A8]
 004D9439    pop         ebx
 004D943A    ret
*}
end;

//004D943C
procedure TCustomFileDialog.DoOnTypeChange;
begin
{*
 004D943C    push        ebx
 004D943D    cmp         word ptr [eax+0B2],0
>004D9445    je          004D9457
 004D9447    mov         ebx,eax
 004D9449    mov         edx,eax
 004D944B    mov         eax,dword ptr [ebx+0B4]
 004D9451    call        dword ptr [ebx+0B0]
 004D9457    pop         ebx
 004D9458    ret
*}
end;

//004D945C
function TCustomFileDialog.Execute:Boolean;
begin
{*
 004D945C    push        esi
 004D945D    push        edi
 004D945E    mov         edi,eax
 004D9460    mov         eax,[0078D590];^Application:TApplication
 004D9465    mov         eax,dword ptr [eax]
 004D9467    cmp         byte ptr [eax+0D0],0
>004D946E    je          004D9491
 004D9470    mov         eax,[0078D590];^Application:TApplication
 004D9475    mov         eax,dword ptr [eax]
 004D9477    call        TApplication.GetActiveFormHandle
 004D947C    mov         esi,eax
 004D947E    test        esi,esi
>004D9480    jne         004D949E
 004D9482    mov         eax,[0078D590];^Application:TApplication
 004D9487    mov         eax,dword ptr [eax]
 004D9489    mov         esi,dword ptr [eax+170]
>004D948F    jmp         004D949E
 004D9491    mov         eax,[0078D590];^Application:TApplication
 004D9496    mov         eax,dword ptr [eax]
 004D9498    mov         esi,dword ptr [eax+170]
 004D949E    mov         edx,esi
 004D94A0    mov         eax,edi
 004D94A2    mov         ecx,dword ptr [eax]
 004D94A4    call        dword ptr [ecx+40]
 004D94A7    pop         edi
 004D94A8    pop         esi
 004D94A9    ret
*}
end;

//004D94AC
function TCustomFileDialog.Execute(ParentWnd:HWND):Boolean;
begin
{*
 004D94AC    push        ebp
 004D94AD    mov         ebp,esp
 004D94AF    mov         ecx,0C
 004D94B4    push        0
 004D94B6    push        0
 004D94B8    dec         ecx
>004D94B9    jne         004D94B4
 004D94BB    push        ecx
 004D94BC    push        ebx
 004D94BD    push        esi
 004D94BE    push        edi
 004D94BF    mov         dword ptr [ebp-10],edx
 004D94C2    mov         dword ptr [ebp-0C],eax
 004D94C5    xor         eax,eax
 004D94C7    push        ebp
 004D94C8    push        4D990C
 004D94CD    push        dword ptr fs:[eax]
 004D94D0    mov         dword ptr fs:[eax],esp
 004D94D3    mov         eax,[0078D080];^gvar_00784C80
 004D94D8    cmp         dword ptr [eax],6
>004D94DB    jge         004D9511
 004D94DD    lea         edx,[ebp-30]
 004D94E0    mov         eax,dword ptr [ebp-0C]
 004D94E3    mov         eax,dword ptr [eax]
 004D94E5    call        TObject.ClassName
 004D94EA    mov         eax,dword ptr [ebp-30]
 004D94ED    mov         dword ptr [ebp-2C],eax
 004D94F0    mov         byte ptr [ebp-28],11
 004D94F4    lea         eax,[ebp-2C]
 004D94F7    push        eax
 004D94F8    push        0
 004D94FA    mov         ecx,dword ptr ds:[78D36C];^SResString302:TResStringRec
 004D9500    mov         dl,1
 004D9502    mov         eax,[004D29EC];EPlatformVersionException
 004D9507    call        Exception.CreateResFmt
 004D950C    call        @RaiseExcept
 004D9511    mov         byte ptr [ebp-11],0
 004D9515    lea         edx,[ebp-34]
 004D9518    mov         eax,dword ptr [ebp-0C]
 004D951B    mov         ecx,dword ptr [eax]
 004D951D    call        dword ptr [ecx+34]
 004D9520    mov         edx,dword ptr [ebp-34]
 004D9523    mov         eax,dword ptr [ebp-0C]
 004D9526    add         eax,40
 004D9529    call        @IntfCopy
 004D952E    mov         eax,dword ptr [ebp-0C]
 004D9531    cmp         dword ptr [eax+40],0
>004D9535    je          004D98BB
 004D953B    xor         ecx,ecx
 004D953D    push        ebp
 004D953E    push        4D98B4
 004D9543    push        dword ptr fs:[ecx]
 004D9546    mov         dword ptr fs:[ecx],esp
 004D9549    lea         eax,[ebp-8]
 004D954C    mov         edx,dword ptr [ebp-0C]
 004D954F    mov         edx,dword ptr [edx+40]
 004D9552    call        @IntfCopy
 004D9557    mov         eax,dword ptr [ebp-0C]
 004D955A    cmp         dword ptr [eax+34],0
>004D955E    je          004D957B
 004D9560    lea         edx,[ebp-44]
 004D9563    mov         eax,dword ptr [ebp-0C]
 004D9566    mov         eax,dword ptr [eax+34]
 004D9569    call        StringToGUID
 004D956E    lea         eax,[ebp-44]
 004D9571    push        eax
 004D9572    mov         eax,dword ptr [ebp-8]
 004D9575    push        eax
 004D9576    mov         eax,dword ptr [eax]
 004D9578    call        dword ptr [eax+60]
 004D957B    mov         eax,dword ptr [ebp-0C]
 004D957E    cmp         dword ptr [eax+38],0
>004D9582    je          004D95A4
 004D9584    lea         eax,[ebp-48]
 004D9587    mov         edx,dword ptr [ebp-0C]
 004D958A    mov         edx,dword ptr [edx+38]
 004D958D    call        @WStrFromUStr
 004D9592    mov         eax,dword ptr [ebp-48]
 004D9595    call        @WStrToPWChar
 004D959A    push        eax
 004D959B    mov         eax,dword ptr [ebp-8]
 004D959E    push        eax
 004D959F    mov         eax,dword ptr [eax]
 004D95A1    call        dword ptr [eax+58]
 004D95A4    mov         eax,dword ptr [ebp-0C]
 004D95A7    cmp         dword ptr [eax+48],0
>004D95AB    je          004D95CD
 004D95AD    lea         eax,[ebp-4C]
 004D95B0    mov         edx,dword ptr [ebp-0C]
 004D95B3    mov         edx,dword ptr [edx+48]
 004D95B6    call        @WStrFromUStr
 004D95BB    mov         eax,dword ptr [ebp-4C]
 004D95BE    call        @WStrToPWChar
 004D95C3    push        eax
 004D95C4    mov         eax,dword ptr [ebp-8]
 004D95C7    push        eax
 004D95C8    mov         eax,dword ptr [eax]
 004D95CA    call        dword ptr [eax+3C]
 004D95CD    mov         eax,dword ptr [ebp-0C]
 004D95D0    cmp         dword ptr [eax+4C],0
>004D95D4    je          004D95F6
 004D95D6    lea         eax,[ebp-50]
 004D95D9    mov         edx,dword ptr [ebp-0C]
 004D95DC    mov         edx,dword ptr [edx+4C]
 004D95DF    call        @WStrFromUStr
 004D95E4    mov         eax,dword ptr [ebp-50]
 004D95E7    call        @WStrToPWChar
 004D95EC    push        eax
 004D95ED    mov         eax,dword ptr [ebp-8]
 004D95F0    push        eax
 004D95F1    mov         eax,dword ptr [eax]
 004D95F3    call        dword ptr [eax+4C]
 004D95F6    mov         eax,dword ptr [ebp-0C]
 004D95F9    cmp         dword ptr [eax+60],0
>004D95FD    je          004D961F
 004D95FF    lea         eax,[ebp-54]
 004D9602    mov         edx,dword ptr [ebp-0C]
 004D9605    mov         edx,dword ptr [edx+60]
 004D9608    call        @WStrFromUStr
 004D960D    mov         eax,dword ptr [ebp-54]
 004D9610    call        @WStrToPWChar
 004D9615    push        eax
 004D9616    mov         eax,dword ptr [ebp-8]
 004D9619    push        eax
 004D961A    mov         eax,dword ptr [eax]
 004D961C    call        dword ptr [eax+48]
 004D961F    mov         eax,dword ptr [ebp-0C]
 004D9622    cmp         dword ptr [eax+70],0
>004D9626    je          004D9648
 004D9628    lea         eax,[ebp-58]
 004D962B    mov         edx,dword ptr [ebp-0C]
 004D962E    mov         edx,dword ptr [edx+70]
 004D9631    call        @WStrFromUStr
 004D9636    mov         eax,dword ptr [ebp-58]
 004D9639    call        @WStrToPWChar
 004D963E    push        eax
 004D963F    mov         eax,dword ptr [ebp-8]
 004D9642    push        eax
 004D9643    mov         eax,dword ptr [eax]
 004D9645    call        dword ptr [eax+44]
 004D9648    mov         eax,dword ptr [ebp-0C]
 004D964B    cmp         dword ptr [eax+3C],0
>004D964F    je          004D96A2
 004D9651    lea         eax,[ebp-4]
 004D9654    call        @IntfClear
 004D9659    push        eax
 004D965A    lea         edx,[ebp-44]
 004D965D    mov         eax,4D992C;'{43826D1E-E718-42EE-BC55-A1E261C37BFE}'
 004D9662    call        StringToGUID
 004D9667    lea         eax,[ebp-44]
 004D966A    push        eax
 004D966B    push        0
 004D966D    lea         eax,[ebp-5C]
 004D9670    mov         edx,dword ptr [ebp-0C]
 004D9673    mov         edx,dword ptr [edx+3C]
 004D9676    call        @WStrFromUStr
 004D967B    mov         eax,dword ptr [ebp-5C]
 004D967E    call        @WStrToPWChar
 004D9683    push        eax
 004D9684    call        SHCreateItemFromParsingName
 004D9689    test        eax,80000000
 004D968E    sete        al
 004D9691    test        al,al
>004D9693    je          004D96A2
 004D9695    mov         eax,dword ptr [ebp-4]
 004D9698    push        eax
 004D9699    mov         eax,dword ptr [ebp-8]
 004D969C    push        eax
 004D969D    mov         eax,dword ptr [eax]
 004D969F    call        dword ptr [eax+30]
 004D96A2    mov         eax,dword ptr [ebp-0C]
 004D96A5    mov         esi,dword ptr [eax+58]
 004D96A8    mov         eax,dword ptr [esi+8]
 004D96AB    mov         ebx,dword ptr [eax+8]
 004D96AE    test        ebx,ebx
>004D96B0    jle         004D96DD
 004D96B2    lea         edx,[ebp-60]
 004D96B5    mov         eax,esi
 004D96B7    call        TFileTypeItems.FilterSpecArray
 004D96BC    mov         eax,dword ptr [ebp-60]
 004D96BF    push        eax
 004D96C0    push        ebx
 004D96C1    mov         eax,dword ptr [ebp-0C]
 004D96C4    mov         eax,dword ptr [eax+40]
 004D96C7    push        eax
 004D96C8    mov         eax,dword ptr [eax]
 004D96CA    call        dword ptr [eax+10]
 004D96CD    mov         eax,dword ptr [ebp-0C]
 004D96D0    mov         eax,dword ptr [eax+54]
 004D96D3    push        eax
 004D96D4    mov         eax,dword ptr [ebp-8]
 004D96D7    push        eax
 004D96D8    mov         eax,dword ptr [eax]
 004D96DA    call        dword ptr [eax+14]
 004D96DD    xor         esi,esi
 004D96DF    mov         eax,dword ptr [ebp-0C]
 004D96E2    mov         edx,dword ptr [eax+64]
 004D96E5    xor         eax,eax
 004D96E7    mov         edi,786500
 004D96EC    mov         ecx,eax
 004D96EE    cmp         cl,1F
>004D96F1    ja          004D96F9
 004D96F3    and         ecx,7F
 004D96F6    bt          edx,ecx
>004D96F9    jae         004D96FD
 004D96FB    or          esi,dword ptr [edi]
 004D96FD    inc         eax
 004D96FE    add         edi,4
 004D9701    cmp         al,15
>004D9703    jne         004D96EC
 004D9705    push        esi
 004D9706    mov         eax,dword ptr [ebp-8]
 004D9709    push        eax
 004D970A    mov         eax,dword ptr [eax]
 004D970C    call        dword ptr [eax+24]
 004D970F    mov         eax,dword ptr [ebp-0C]
 004D9712    mov         eax,dword ptr [eax+44]
 004D9715    call        TFavoriteLinkItems.GetEnumerator
 004D971A    mov         dword ptr [ebp-24],eax
 004D971D    xor         eax,eax
 004D971F    push        ebp
 004D9720    push        4D97B4
 004D9725    push        dword ptr fs:[eax]
 004D9728    mov         dword ptr fs:[eax],esp
>004D972B    jmp         004D978A
 004D972D    mov         eax,dword ptr [ebp-24]
 004D9730    call        TFavoriteLinkItemsEnumerator.GetCurrent
 004D9735    mov         edi,eax
 004D9737    lea         eax,[ebp-4]
 004D973A    call        @IntfClear
 004D973F    push        eax
 004D9740    lea         edx,[ebp-44]
 004D9743    mov         eax,4D992C;'{43826D1E-E718-42EE-BC55-A1E261C37BFE}'
 004D9748    call        StringToGUID
 004D974D    lea         eax,[ebp-44]
 004D9750    push        eax
 004D9751    push        0
 004D9753    lea         eax,[ebp-64]
 004D9756    mov         edx,dword ptr [edi+0C]
 004D9759    call        @WStrFromUStr
 004D975E    mov         eax,dword ptr [ebp-64]
 004D9761    call        @WStrToPWChar
 004D9766    push        eax
 004D9767    call        SHCreateItemFromParsingName
 004D976C    mov         esi,eax
 004D976E    test        esi,80000000
 004D9774    sete        bl
 004D9777    test        bl,bl
>004D9779    je          004D978A
 004D977B    push        0
 004D977D    mov         eax,dword ptr [ebp-4]
 004D9780    push        eax
 004D9781    mov         eax,dword ptr [ebp-8]
 004D9784    push        eax
 004D9785    mov         eax,dword ptr [eax]
 004D9787    call        dword ptr [eax+54]
 004D978A    mov         eax,dword ptr [ebp-24]
 004D978D    call        TFavoriteLinkItemsEnumerator.MoveNext
 004D9792    test        al,al
>004D9794    jne         004D972D
 004D9796    xor         eax,eax
 004D9798    pop         edx
 004D9799    pop         ecx
 004D979A    pop         ecx
 004D979B    mov         dword ptr fs:[eax],edx
 004D979E    push        4D97BB
 004D97A3    cmp         dword ptr [ebp-24],0
>004D97A7    je          004D97B3
 004D97A9    mov         dl,1
 004D97AB    mov         eax,dword ptr [ebp-24]
 004D97AE    mov         ecx,dword ptr [eax]
 004D97B0    call        dword ptr [ecx-4]
 004D97B3    ret
>004D97B4    jmp         @HandleFinally
>004D97B9    jmp         004D97A3
 004D97BB    mov         eax,dword ptr [ebp-0C]
 004D97BE    mov         si,0FFF0
 004D97C2    call        @CallDynaInst
 004D97C7    mov         eax,dword ptr [ebp-10]
 004D97CA    call        DisableTaskWindows
 004D97CF    mov         dword ptr [ebp-18],eax
 004D97D2    call        SaveFocusState
 004D97D7    mov         dword ptr [ebp-1C],eax
 004D97DA    xor         edx,edx
 004D97DC    push        ebp
 004D97DD    push        4D9894
 004D97E2    push        dword ptr fs:[edx]
 004D97E5    mov         dword ptr fs:[edx],esp
 004D97E8    mov         ecx,dword ptr [ebp-0C]
 004D97EB    mov         dl,1
 004D97ED    mov         eax,[004D8D8C];TFileDialogEvents
 004D97F2    call        TFileDialogEvents.Create
 004D97F7    lea         edx,[ebp-20]
 004D97FA    push        edx
 004D97FB    test        eax,eax
>004D97FD    je          004D9802
 004D97FF    sub         eax,0FFFFFFEC
 004D9802    push        eax
 004D9803    mov         eax,dword ptr [ebp-8]
 004D9806    push        eax
 004D9807    mov         eax,dword ptr [eax]
 004D9809    call        dword ptr [eax+1C]
 004D980C    xor         edx,edx
 004D980E    push        ebp
 004D980F    push        4D9866
 004D9814    push        dword ptr fs:[edx]
 004D9817    mov         dword ptr fs:[edx],esp
 004D981A    mov         eax,dword ptr [ebp-10]
 004D981D    push        eax
 004D981E    mov         eax,dword ptr [ebp-8]
 004D9821    push        eax
 004D9822    mov         eax,dword ptr [eax]
 004D9824    call        dword ptr [eax+0C]
 004D9827    test        eax,80000000
 004D982C    sete        al
 004D982F    mov         byte ptr [ebp-11],al
 004D9832    cmp         byte ptr [ebp-11],0
>004D9836    je          004D984B
 004D9838    mov         eax,dword ptr [ebp-0C]
 004D983B    mov         edx,dword ptr [eax]
 004D983D    call        dword ptr [edx+38]
 004D9840    test        eax,80000000
 004D9845    sete        al
 004D9848    mov         byte ptr [ebp-11],al
 004D984B    xor         eax,eax
 004D984D    pop         edx
 004D984E    pop         ecx
 004D984F    pop         ecx
 004D9850    mov         dword ptr fs:[eax],edx
 004D9853    push        4D986D
 004D9858    mov         eax,dword ptr [ebp-20]
 004D985B    push        eax
 004D985C    mov         eax,dword ptr [ebp-8]
 004D985F    push        eax
 004D9860    mov         eax,dword ptr [eax]
 004D9862    call        dword ptr [eax+20]
 004D9865    ret
>004D9866    jmp         @HandleFinally
>004D986B    jmp         004D9858
 004D986D    xor         eax,eax
 004D986F    pop         edx
 004D9870    pop         ecx
 004D9871    pop         ecx
 004D9872    mov         dword ptr fs:[eax],edx
 004D9875    push        4D989B
 004D987A    mov         eax,dword ptr [ebp-18]
 004D987D    call        EnableTaskWindows
 004D9882    mov         eax,dword ptr [ebp-10]
 004D9885    push        eax
 004D9886    call        user32.SetActiveWindow
 004D988B    mov         eax,dword ptr [ebp-1C]
 004D988E    call        RestoreFocusState
 004D9893    ret
>004D9894    jmp         @HandleFinally
>004D9899    jmp         004D987A
 004D989B    xor         eax,eax
 004D989D    pop         edx
 004D989E    pop         ecx
 004D989F    pop         ecx
 004D98A0    mov         dword ptr fs:[eax],edx
 004D98A3    push        4D98BB
 004D98A8    mov         eax,dword ptr [ebp-0C]
 004D98AB    add         eax,40
 004D98AE    call        @IntfClear
 004D98B3    ret
>004D98B4    jmp         @HandleFinally
>004D98B9    jmp         004D98A8
 004D98BB    xor         eax,eax
 004D98BD    pop         edx
 004D98BE    pop         ecx
 004D98BF    pop         ecx
 004D98C0    mov         dword ptr fs:[eax],edx
 004D98C3    push        4D9913
 004D98C8    lea         eax,[ebp-64]
 004D98CB    call        @WStrClr
 004D98D0    lea         eax,[ebp-60]
 004D98D3    mov         edx,dword ptr ds:[4ACD9C];TComdlgFilterSpecArray
 004D98D9    call        @DynArrayClear
 004D98DE    lea         eax,[ebp-5C]
 004D98E1    mov         edx,6
 004D98E6    call        @WStrArrayClr
 004D98EB    lea         eax,[ebp-34]
 004D98EE    call        @IntfClear
 004D98F3    lea         eax,[ebp-30]
 004D98F6    call        @UStrClr
 004D98FB    lea         eax,[ebp-8]
 004D98FE    call        @IntfClear
 004D9903    lea         eax,[ebp-4]
 004D9906    call        @IntfClear
 004D990B    ret
>004D990C    jmp         @HandleFinally
>004D9911    jmp         004D98C8
 004D9913    movzx       eax,byte ptr [ebp-11]
 004D9917    pop         edi
 004D9918    pop         esi
 004D9919    pop         ebx
 004D991A    mov         esp,ebp
 004D991C    pop         ebp
 004D991D    ret
*}
end;

//004D997C
procedure TCustomFileDialog.FileOkClick;
begin
{*
 004D997C    push        esi
 004D997D    push        edi
 004D997E    mov         edi,eax
 004D9980    mov         eax,edi
 004D9982    mov         edx,dword ptr [eax]
 004D9984    call        dword ptr [edx+38]
 004D9987    mov         esi,eax
 004D9989    test        esi,80000000
>004D998F    jne         004D99A6
 004D9991    mov         eax,edi
 004D9993    mov         si,0FFEF
 004D9997    call        @CallDynaInst
 004D999C    and         eax,7F
 004D999F    mov         esi,dword ptr [eax*4+786554]
 004D99A6    mov         eax,edi
 004D99A8    call        TCustomFileDialog.GetFiles
 004D99AD    mov         edx,dword ptr [eax]
 004D99AF    call        dword ptr [edx+44]
 004D99B2    mov         eax,esi
 004D99B4    pop         edi
 004D99B5    pop         esi
 004D99B6    ret
*}
end;

//004D99B8
procedure TCustomFileDialog.FolderChange;
begin
{*
 004D99B8    push        ebx
 004D99B9    push        esi
 004D99BA    push        edi
 004D99BB    mov         ebx,eax
 004D99BD    lea         eax,[ebx+48]
 004D99C0    call        @UStrClr
 004D99C5    lea         eax,[ebx+68]
 004D99C8    push        eax
 004D99C9    mov         eax,dword ptr [ebx+40]
 004D99CC    push        eax
 004D99CD    mov         eax,dword ptr [eax]
 004D99CF    call        dword ptr [eax+34]
 004D99D2    mov         edi,eax
 004D99D4    test        edi,80000000
>004D99DA    jne         004D9A02
 004D99DC    lea         ecx,[ebx+48]
 004D99DF    mov         edx,dword ptr [ebx+68]
 004D99E2    mov         eax,ebx
 004D99E4    mov         si,0FFE7
 004D99E8    call        @CallDynaInst
 004D99ED    mov         edi,eax
 004D99EF    test        edi,80000000
>004D99F5    jne         004D9A02
 004D99F7    mov         eax,ebx
 004D99F9    mov         si,0FFEE
 004D99FD    call        @CallDynaInst
 004D9A02    lea         eax,[ebx+68]
 004D9A05    call        @IntfClear
 004D9A0A    mov         eax,edi
 004D9A0C    pop         edi
 004D9A0D    pop         esi
 004D9A0E    pop         ebx
 004D9A0F    ret
*}
end;

//004D9A10
procedure TCustomFileDialog.FolderChanging(psiFolder:IShellItem);
begin
{*
 004D9A10    push        ebp
 004D9A11    mov         ebp,esp
 004D9A13    push        ecx
 004D9A14    push        ebx
 004D9A15    push        esi
 004D9A16    mov         dword ptr [ebp-4],edx
 004D9A19    mov         ebx,eax
 004D9A1B    mov         eax,dword ptr [ebp-4]
 004D9A1E    call        @IntfAddRef
 004D9A23    xor         eax,eax
 004D9A25    push        ebp
 004D9A26    push        4D9A92
 004D9A2B    push        dword ptr fs:[eax]
 004D9A2E    mov         dword ptr fs:[eax],esp
 004D9A31    lea         eax,[ebx+48]
 004D9A34    call        @UStrClr
 004D9A39    lea         eax,[ebx+68]
 004D9A3C    mov         edx,dword ptr [ebp-4]
 004D9A3F    call        @IntfCopy
 004D9A44    lea         ecx,[ebx+48]
 004D9A47    mov         edx,dword ptr [ebx+68]
 004D9A4A    mov         eax,ebx
 004D9A4C    mov         si,0FFE7
 004D9A50    call        @CallDynaInst
 004D9A55    mov         esi,eax
 004D9A57    test        esi,80000000
>004D9A5D    jne         004D9A74
 004D9A5F    mov         eax,ebx
 004D9A61    mov         si,0FFED
 004D9A65    call        @CallDynaInst
 004D9A6A    and         eax,7F
 004D9A6D    mov         esi,dword ptr [eax*4+78655C]
 004D9A74    lea         eax,[ebx+68]
 004D9A77    call        @IntfClear
 004D9A7C    xor         eax,eax
 004D9A7E    pop         edx
 004D9A7F    pop         ecx
 004D9A80    pop         ecx
 004D9A81    mov         dword ptr fs:[eax],edx
 004D9A84    push        4D9A99
 004D9A89    lea         eax,[ebp-4]
 004D9A8C    call        @IntfClear
 004D9A91    ret
>004D9A92    jmp         @HandleFinally
>004D9A97    jmp         004D9A89
 004D9A99    mov         eax,esi
 004D9A9B    pop         esi
 004D9A9C    pop         ebx
 004D9A9D    pop         ecx
 004D9A9E    pop         ebp
 004D9A9F    ret
*}
end;

//004D9AA0
function TCustomFileDialog.GetDefaultFolder:UnicodeString;
begin
{*
 004D9AA0    push        ebx
 004D9AA1    push        esi
 004D9AA2    mov         esi,edx
 004D9AA4    mov         ebx,eax
 004D9AA6    mov         eax,esi
 004D9AA8    mov         edx,dword ptr [ebx+3C]
 004D9AAB    call        @UStrAsg
 004D9AB0    pop         esi
 004D9AB1    pop         ebx
 004D9AB2    ret
*}
end;

//004D9AB4
function TCustomFileDialog.GetFileName:TFileName;
begin
{*
 004D9AB4    push        ebp
 004D9AB5    mov         ebp,esp
 004D9AB7    add         esp,0FFFFFFE8
 004D9ABA    push        esi
 004D9ABB    xor         ecx,ecx
 004D9ABD    mov         dword ptr [ebp-4],ecx
 004D9AC0    mov         dword ptr [ebp-8],ecx
 004D9AC3    mov         dword ptr [ebp-0C],ecx
 004D9AC6    mov         dword ptr [ebp-14],edx
 004D9AC9    mov         dword ptr [ebp-10],eax
 004D9ACC    xor         eax,eax
 004D9ACE    push        ebp
 004D9ACF    push        4D9BCE
 004D9AD4    push        dword ptr fs:[eax]
 004D9AD7    mov         dword ptr fs:[eax],esp
 004D9ADA    mov         eax,dword ptr [ebp-10]
 004D9ADD    cmp         dword ptr [eax+40],0
>004D9AE1    je          004D9B00
 004D9AE3    mov         eax,dword ptr [ebp-10]
 004D9AE6    add         eax,68
 004D9AE9    push        eax
 004D9AEA    mov         eax,dword ptr [ebp-10]
 004D9AED    mov         eax,dword ptr [eax+40]
 004D9AF0    push        eax
 004D9AF1    mov         eax,dword ptr [eax]
 004D9AF3    call        dword ptr [eax+34]
 004D9AF6    test        eax,80000000
 004D9AFB    sete        al
>004D9AFE    jmp         004D9B02
 004D9B00    xor         eax,eax
 004D9B02    test        al,al
>004D9B04    je          004D9B25
 004D9B06    lea         ecx,[ebp-4]
 004D9B09    mov         eax,dword ptr [ebp-10]
 004D9B0C    mov         edx,dword ptr [eax+68]
 004D9B0F    mov         eax,dword ptr [ebp-10]
 004D9B12    mov         si,0FFE7
 004D9B16    call        @CallDynaInst
 004D9B1B    test        eax,80000000
 004D9B20    sete        al
>004D9B23    jmp         004D9B27
 004D9B25    xor         eax,eax
 004D9B27    test        al,al
>004D9B29    je          004D9B9D
 004D9B2B    lea         eax,[ebp-18]
 004D9B2E    push        eax
 004D9B2F    mov         eax,dword ptr [ebp-10]
 004D9B32    mov         eax,dword ptr [eax+40]
 004D9B35    push        eax
 004D9B36    mov         eax,dword ptr [eax]
 004D9B38    call        dword ptr [eax+40]
 004D9B3B    test        eax,80000000
 004D9B40    sete        al
 004D9B43    test        al,al
>004D9B45    je          004D9B9D
 004D9B47    xor         eax,eax
 004D9B49    push        ebp
 004D9B4A    push        4D9B96
 004D9B4F    push        dword ptr fs:[eax]
 004D9B52    mov         dword ptr fs:[eax],esp
 004D9B55    lea         eax,[ebp-8]
 004D9B58    mov         edx,dword ptr [ebp-18]
 004D9B5B    call        @UStrFromPWChar
 004D9B60    lea         eax,[ebp-0C]
 004D9B63    push        eax
 004D9B64    mov         cl,1
 004D9B66    mov         edx,dword ptr [ebp-8]
 004D9B69    mov         eax,dword ptr [ebp-4]
 004D9B6C    call        TPath.DoCombine
 004D9B71    mov         eax,dword ptr [ebp-10]
 004D9B74    add         eax,48
 004D9B77    mov         edx,dword ptr [ebp-0C]
 004D9B7A    call        @UStrAsg
 004D9B7F    xor         eax,eax
 004D9B81    pop         edx
 004D9B82    pop         ecx
 004D9B83    pop         ecx
 004D9B84    mov         dword ptr fs:[eax],edx
 004D9B87    push        4D9B9D
 004D9B8C    mov         eax,dword ptr [ebp-18]
 004D9B8F    push        eax
 004D9B90    call        ole32.CoTaskMemFree
 004D9B95    ret
>004D9B96    jmp         @HandleFinally
>004D9B9B    jmp         004D9B8C
 004D9B9D    mov         eax,dword ptr [ebp-14]
 004D9BA0    mov         edx,dword ptr [ebp-10]
 004D9BA3    mov         edx,dword ptr [edx+48]
 004D9BA6    call        @UStrAsg
 004D9BAB    xor         eax,eax
 004D9BAD    pop         edx
 004D9BAE    pop         ecx
 004D9BAF    pop         ecx
 004D9BB0    mov         dword ptr fs:[eax],edx
 004D9BB3    push        4D9BD5
 004D9BB8    lea         eax,[ebp-0C]
 004D9BBB    mov         edx,2
 004D9BC0    call        @UStrArrayClr
 004D9BC5    lea         eax,[ebp-4]
 004D9BC8    call        @UStrClr
 004D9BCD    ret
>004D9BCE    jmp         @HandleFinally
>004D9BD3    jmp         004D9BB8
 004D9BD5    pop         esi
 004D9BD6    mov         esp,ebp
 004D9BD8    pop         ebp
 004D9BD9    ret
*}
end;

//004D9C18
procedure TCustomFileDialog.GetFileNames(Items:IShellItemArray);
begin
{*
 004D9C18    push        ebp
 004D9C19    mov         ebp,esp
 004D9C1B    add         esp,0FFFFFFE0
 004D9C1E    push        ebx
 004D9C1F    push        esi
 004D9C20    push        edi
 004D9C21    xor         ecx,ecx
 004D9C23    mov         dword ptr [ebp-20],ecx
 004D9C26    mov         dword ptr [ebp-8],ecx
 004D9C29    mov         dword ptr [ebp-0C],ecx
 004D9C2C    mov         dword ptr [ebp-4],edx
 004D9C2F    mov         ebx,eax
 004D9C31    mov         eax,dword ptr [ebp-4]
 004D9C34    call        @IntfAddRef
 004D9C39    xor         eax,eax
 004D9C3B    push        ebp
 004D9C3C    push        4D9D64
 004D9C41    push        dword ptr fs:[eax]
 004D9C44    mov         dword ptr fs:[eax],esp
 004D9C47    mov         eax,ebx
 004D9C49    call        TCustomFileDialog.GetFiles
 004D9C4E    mov         edx,dword ptr [eax]
 004D9C50    call        dword ptr [edx+44]
 004D9C53    lea         eax,[ebp-8]
 004D9C56    push        eax
 004D9C57    mov         eax,dword ptr [ebp-4]
 004D9C5A    push        eax
 004D9C5B    mov         eax,dword ptr [eax]
 004D9C5D    call        dword ptr [eax+24]
 004D9C60    mov         edi,eax
 004D9C62    test        edi,80000000
>004D9C68    jne         004D9D30
 004D9C6E    lea         eax,[ebp-18]
 004D9C71    push        eax
 004D9C72    mov         eax,dword ptr [ebp-4]
 004D9C75    push        eax
 004D9C76    mov         eax,dword ptr [eax]
 004D9C78    call        dword ptr [eax+1C]
 004D9C7B    mov         edi,eax
 004D9C7D    test        edi,80000000
>004D9C83    jne         004D9D04
 004D9C85    mov         eax,dword ptr [ebp-18]
 004D9C88    push        eax
 004D9C89    lea         eax,[ebp-0C]
 004D9C8C    mov         ecx,1
 004D9C91    mov         edx,dword ptr ds:[4D9BDC];:TCustomFileDialog.:1
 004D9C97    call        @DynArraySetLength
 004D9C9C    add         esp,4
 004D9C9F    lea         eax,[ebp-10]
 004D9CA2    push        eax
 004D9CA3    mov         eax,dword ptr [ebp-0C]
 004D9CA6    call        @IntfClear
 004D9CAB    push        eax
 004D9CAC    mov         eax,dword ptr [ebp-18]
 004D9CAF    push        eax
 004D9CB0    mov         eax,dword ptr [ebp-8]
 004D9CB3    push        eax
 004D9CB4    mov         eax,dword ptr [eax]
 004D9CB6    call        dword ptr [eax+0C]
 004D9CB9    mov         edi,eax
 004D9CBB    test        edi,80000000
>004D9CC1    jne         004D9D04
 004D9CC3    mov         eax,dword ptr [ebp-10]
 004D9CC6    dec         eax
 004D9CC7    test        eax,eax
>004D9CC9    jl          004D9D04
 004D9CCB    inc         eax
 004D9CCC    mov         dword ptr [ebp-1C],eax
 004D9CCF    mov         dword ptr [ebp-14],0
 004D9CD6    mov         eax,dword ptr [ebp-0C]
 004D9CD9    mov         edx,dword ptr [ebp-14]
 004D9CDC    mov         edx,dword ptr [eax+edx*4]
 004D9CDF    lea         ecx,[ebx+48]
 004D9CE2    mov         eax,ebx
 004D9CE4    mov         si,0FFE7
 004D9CE8    call        @CallDynaInst
 004D9CED    mov         eax,ebx
 004D9CEF    call        TCustomFileDialog.GetFiles
 004D9CF4    mov         edx,dword ptr [ebx+48]
 004D9CF7    mov         ecx,dword ptr [eax]
 004D9CF9    call        dword ptr [ecx+38]
 004D9CFC    inc         dword ptr [ebp-14]
 004D9CFF    dec         dword ptr [ebp-1C]
>004D9D02    jne         004D9CD6
 004D9D04    mov         eax,ebx
 004D9D06    call        TCustomFileDialog.GetFiles
 004D9D0B    mov         edx,dword ptr [eax]
 004D9D0D    call        dword ptr [edx+14]
 004D9D10    test        eax,eax
>004D9D12    jle         004D9D30
 004D9D14    mov         eax,ebx
 004D9D16    call        TCustomFileDialog.GetFiles
 004D9D1B    lea         ecx,[ebp-20]
 004D9D1E    xor         edx,edx
 004D9D20    mov         esi,dword ptr [eax]
 004D9D22    call        dword ptr [esi+0C]
 004D9D25    mov         edx,dword ptr [ebp-20]
 004D9D28    lea         eax,[ebx+48]
 004D9D2B    call        @UStrAsg
 004D9D30    xor         eax,eax
 004D9D32    pop         edx
 004D9D33    pop         ecx
 004D9D34    pop         ecx
 004D9D35    mov         dword ptr fs:[eax],edx
 004D9D38    push        4D9D6B
 004D9D3D    lea         eax,[ebp-20]
 004D9D40    call        @UStrClr
 004D9D45    lea         eax,[ebp-0C]
 004D9D48    mov         edx,dword ptr ds:[4D9BDC];:TCustomFileDialog.:1
 004D9D4E    call        @DynArrayClear
 004D9D53    lea         eax,[ebp-8]
 004D9D56    call        @IntfClear
 004D9D5B    lea         eax,[ebp-4]
 004D9D5E    call        @IntfClear
 004D9D63    ret
>004D9D64    jmp         @HandleFinally
>004D9D69    jmp         004D9D3D
 004D9D6B    mov         eax,edi
 004D9D6D    pop         edi
 004D9D6E    pop         esi
 004D9D6F    pop         ebx
 004D9D70    mov         esp,ebp
 004D9D72    pop         ebp
 004D9D73    ret
*}
end;

//004D9D74
function TCustomFileDialog.GetFiles:TStrings;
begin
{*
 004D9D74    mov         eax,dword ptr [eax+50]
 004D9D77    ret
*}
end;

//004D9D78
procedure TCustomFileDialog.GetItemName(Item:IShellItem; var ItemName:TFileName);
begin
{*
 004D9D78    push        ebp
 004D9D79    mov         ebp,esp
 004D9D7B    add         esp,0FFFFFFF0
 004D9D7E    push        ebx
 004D9D7F    xor         ebx,ebx
 004D9D81    mov         dword ptr [ebp-8],ebx
 004D9D84    mov         ebx,ecx
 004D9D86    mov         dword ptr [ebp-4],edx
 004D9D89    mov         eax,dword ptr [ebp-4]
 004D9D8C    call        @IntfAddRef
 004D9D91    xor         eax,eax
 004D9D93    push        ebp
 004D9D94    push        4D9E31
 004D9D99    push        dword ptr fs:[eax]
 004D9D9C    mov         dword ptr fs:[eax],esp
 004D9D9F    lea         eax,[ebp-10]
 004D9DA2    push        eax
 004D9DA3    push        80058000
 004D9DA8    mov         eax,dword ptr [ebp-4]
 004D9DAB    push        eax
 004D9DAC    mov         eax,dword ptr [eax]
 004D9DAE    call        dword ptr [eax+14]
 004D9DB1    mov         dword ptr [ebp-0C],eax
 004D9DB4    test        byte ptr [ebp-9],80
>004D9DB8    je          004D9DCC
 004D9DBA    lea         eax,[ebp-10]
 004D9DBD    push        eax
 004D9DBE    push        0
 004D9DC0    mov         eax,dword ptr [ebp-4]
 004D9DC3    push        eax
 004D9DC4    mov         eax,dword ptr [eax]
 004D9DC6    call        dword ptr [eax+14]
 004D9DC9    mov         dword ptr [ebp-0C],eax
 004D9DCC    test        byte ptr [ebp-9],80
>004D9DD0    jne         004D9E13
 004D9DD2    xor         eax,eax
 004D9DD4    push        ebp
 004D9DD5    push        4D9E0C
 004D9DDA    push        dword ptr fs:[eax]
 004D9DDD    mov         dword ptr fs:[eax],esp
 004D9DE0    lea         eax,[ebp-8]
 004D9DE3    mov         edx,dword ptr [ebp-10]
 004D9DE6    call        @UStrFromPWChar
 004D9DEB    mov         eax,ebx
 004D9DED    mov         edx,dword ptr [ebp-8]
 004D9DF0    call        @UStrAsg
 004D9DF5    xor         eax,eax
 004D9DF7    pop         edx
 004D9DF8    pop         ecx
 004D9DF9    pop         ecx
 004D9DFA    mov         dword ptr fs:[eax],edx
 004D9DFD    push        4D9E13
 004D9E02    mov         eax,dword ptr [ebp-10]
 004D9E05    push        eax
 004D9E06    call        ole32.CoTaskMemFree
 004D9E0B    ret
>004D9E0C    jmp         @HandleFinally
>004D9E11    jmp         004D9E02
 004D9E13    xor         eax,eax
 004D9E15    pop         edx
 004D9E16    pop         ecx
 004D9E17    pop         ecx
 004D9E18    mov         dword ptr fs:[eax],edx
 004D9E1B    push        4D9E38
 004D9E20    lea         eax,[ebp-8]
 004D9E23    call        @UStrClr
 004D9E28    lea         eax,[ebp-4]
 004D9E2B    call        @IntfClear
 004D9E30    ret
>004D9E31    jmp         @HandleFinally
>004D9E36    jmp         004D9E20
 004D9E38    mov         eax,dword ptr [ebp-0C]
 004D9E3B    pop         ebx
 004D9E3C    mov         esp,ebp
 004D9E3E    pop         ebp
 004D9E3F    ret
*}
end;

//004D9E40
function TCustomFileDialog.GetResults:HRESULT;
begin
{*
 004D9E40    push        ebx
 004D9E41    push        esi
 004D9E42    push        edi
 004D9E43    mov         edi,eax
 004D9E45    lea         eax,[edi+68]
 004D9E48    push        eax
 004D9E49    mov         eax,dword ptr [edi+40]
 004D9E4C    push        eax
 004D9E4D    mov         eax,dword ptr [eax]
 004D9E4F    call        dword ptr [eax+50]
 004D9E52    mov         ebx,eax
 004D9E54    test        ebx,80000000
>004D9E5A    jne         004D9E82
 004D9E5C    lea         ecx,[edi+48]
 004D9E5F    mov         edx,dword ptr [edi+68]
 004D9E62    mov         eax,edi
 004D9E64    mov         si,0FFE7
 004D9E68    call        @CallDynaInst
 004D9E6D    mov         ebx,eax
 004D9E6F    mov         eax,dword ptr [edi+50]
 004D9E72    mov         edx,dword ptr [eax]
 004D9E74    call        dword ptr [edx+44]
 004D9E77    mov         edx,dword ptr [edi+48]
 004D9E7A    mov         eax,dword ptr [edi+50]
 004D9E7D    mov         ecx,dword ptr [eax]
 004D9E7F    call        dword ptr [ecx+38]
 004D9E82    mov         eax,ebx
 004D9E84    pop         edi
 004D9E85    pop         esi
 004D9E86    pop         ebx
 004D9E87    ret
*}
end;

//004D9E88
procedure TCustomFileDialog.GetWindowHandle;
begin
{*
 004D9E88    push        ebp
 004D9E89    mov         ebp,esp
 004D9E8B    push        0
 004D9E8D    push        ebx
 004D9E8E    mov         ebx,eax
 004D9E90    xor         eax,eax
 004D9E92    push        ebp
 004D9E93    push        4D9EDC
 004D9E98    push        dword ptr fs:[eax]
 004D9E9B    mov         dword ptr fs:[eax],esp
 004D9E9E    lea         eax,[ebp-4]
 004D9EA1    call        @IntfClear
 004D9EA6    mov         ecx,eax
 004D9EA8    mov         edx,4D9EE8
 004D9EAD    mov         eax,dword ptr [ebx+40]
 004D9EB0    call        Supports
 004D9EB5    test        al,al
>004D9EB7    je          004D9EC6
 004D9EB9    lea         eax,[ebx+5C]
 004D9EBC    push        eax
 004D9EBD    mov         eax,dword ptr [ebp-4]
 004D9EC0    push        eax
 004D9EC1    mov         eax,dword ptr [eax]
 004D9EC3    call        dword ptr [eax+0C]
 004D9EC6    xor         eax,eax
 004D9EC8    pop         edx
 004D9EC9    pop         ecx
 004D9ECA    pop         ecx
 004D9ECB    mov         dword ptr fs:[eax],edx
 004D9ECE    push        4D9EE3
 004D9ED3    lea         eax,[ebp-4]
 004D9ED6    call        @IntfClear
 004D9EDB    ret
>004D9EDC    jmp         @HandleFinally
>004D9EE1    jmp         004D9ED3
 004D9EE3    pop         ebx
 004D9EE4    pop         ecx
 004D9EE5    pop         ebp
 004D9EE6    ret
*}
end;

//004D9EF8
procedure TCustomFileDialog.Overwrite(psiFile:IShellItem; var Response:Cardinal);
begin
{*
 004D9EF8    push        ebp
 004D9EF9    mov         ebp,esp
 004D9EFB    add         esp,0FFFFFFF4
 004D9EFE    push        ebx
 004D9EFF    push        esi
 004D9F00    push        edi
 004D9F01    mov         dword ptr [ebp-8],ecx
 004D9F04    mov         dword ptr [ebp-4],edx
 004D9F07    mov         ebx,eax
 004D9F09    mov         eax,dword ptr [ebp-4]
 004D9F0C    call        @IntfAddRef
 004D9F11    xor         eax,eax
 004D9F13    push        ebp
 004D9F14    push        4D9F86
 004D9F19    push        dword ptr fs:[eax]
 004D9F1C    mov         dword ptr fs:[eax],esp
 004D9F1F    lea         eax,[ebx+48]
 004D9F22    call        @UStrClr
 004D9F27    mov         byte ptr [ebp-9],1
 004D9F2B    lea         eax,[ebx+68]
 004D9F2E    mov         edx,dword ptr [ebp-4]
 004D9F31    call        @IntfCopy
 004D9F36    lea         ecx,[ebx+48]
 004D9F39    mov         edx,dword ptr [ebx+68]
 004D9F3C    mov         eax,ebx
 004D9F3E    mov         si,0FFE7
 004D9F42    call        @CallDynaInst
 004D9F47    mov         edi,eax
 004D9F49    test        edi,80000000
>004D9F4F    jne         004D9F5F
 004D9F51    lea         edx,[ebp-9]
 004D9F54    mov         eax,ebx
 004D9F56    mov         si,0FFEC
 004D9F5A    call        @CallDynaInst
 004D9F5F    movzx       eax,byte ptr [ebp-9]
 004D9F63    mov         edx,dword ptr [ebp-8]
 004D9F66    mov         dword ptr [edx],eax
 004D9F68    lea         eax,[ebx+68]
 004D9F6B    call        @IntfClear
 004D9F70    xor         eax,eax
 004D9F72    pop         edx
 004D9F73    pop         ecx
 004D9F74    pop         ecx
 004D9F75    mov         dword ptr fs:[eax],edx
 004D9F78    push        4D9F8D
 004D9F7D    lea         eax,[ebp-4]
 004D9F80    call        @IntfClear
 004D9F85    ret
>004D9F86    jmp         @HandleFinally
>004D9F8B    jmp         004D9F7D
 004D9F8D    mov         eax,edi
 004D9F8F    pop         edi
 004D9F90    pop         esi
 004D9F91    pop         ebx
 004D9F92    mov         esp,ebp
 004D9F94    pop         ebp
 004D9F95    ret
*}
end;

//004D9F98
procedure TCustomFileDialog.SelectionChange;
begin
{*
 004D9F98    push        ebx
 004D9F99    push        esi
 004D9F9A    push        edi
 004D9F9B    mov         ebx,eax
 004D9F9D    lea         eax,[ebx+48]
 004D9FA0    call        @UStrClr
 004D9FA5    lea         eax,[ebx+68]
 004D9FA8    push        eax
 004D9FA9    mov         eax,dword ptr [ebx+40]
 004D9FAC    push        eax
 004D9FAD    mov         eax,dword ptr [eax]
 004D9FAF    call        dword ptr [eax+38]
 004D9FB2    mov         edi,eax
 004D9FB4    test        edi,80000000
>004D9FBA    jne         004D9FE2
 004D9FBC    lea         ecx,[ebx+48]
 004D9FBF    mov         edx,dword ptr [ebx+68]
 004D9FC2    mov         eax,ebx
 004D9FC4    mov         si,0FFE7
 004D9FC8    call        @CallDynaInst
 004D9FCD    mov         edi,eax
 004D9FCF    test        edi,80000000
>004D9FD5    jne         004D9FE2
 004D9FD7    mov         eax,ebx
 004D9FD9    mov         si,0FFEB
 004D9FDD    call        @CallDynaInst
 004D9FE2    lea         eax,[ebx+68]
 004D9FE5    call        @IntfClear
 004D9FEA    mov         eax,edi
 004D9FEC    pop         edi
 004D9FED    pop         esi
 004D9FEE    pop         ebx
 004D9FEF    ret
*}
end;

//004D9FF0
procedure TCustomFileDialog.SetClientGuid(const Value:UnicodeString);
begin
{*
 004D9FF0    push        ebx
 004D9FF1    push        esi
 004D9FF2    add         esp,0FFFFFFF0
 004D9FF5    mov         esi,edx
 004D9FF7    mov         ebx,eax
 004D9FF9    mov         eax,esi
 004D9FFB    mov         edx,dword ptr [ebx+34]
 004D9FFE    call        @UStrEqual
>004DA003    je          004DA01C
 004DA005    test        esi,esi
>004DA007    je          004DA012
 004DA009    mov         edx,esp
 004DA00B    mov         eax,esi
 004DA00D    call        StringToGUID
 004DA012    lea         eax,[ebx+34]
 004DA015    mov         edx,esi
 004DA017    call        @UStrAsg
 004DA01C    add         esp,10
 004DA01F    pop         esi
 004DA020    pop         ebx
 004DA021    ret
*}
end;

//004DA024
procedure TCustomFileDialog.SetDefaultFolder(const Value:UnicodeString);
begin
{*
 004DA024    push        ebx
 004DA025    push        esi
 004DA026    mov         esi,edx
 004DA028    mov         ebx,eax
 004DA02A    mov         eax,dword ptr [ebx+3C]
 004DA02D    mov         edx,esi
 004DA02F    call        @UStrEqual
>004DA034    je          004DA040
 004DA036    lea         eax,[ebx+3C]
 004DA039    mov         edx,esi
 004DA03B    call        @UStrAsg
 004DA040    pop         esi
 004DA041    pop         ebx
 004DA042    ret
*}
end;

//004DA044
procedure TCustomFileDialog.SetFileName(const Value:TFileName);
begin
{*
 004DA044    push        ebx
 004DA045    push        esi
 004DA046    mov         esi,edx
 004DA048    mov         ebx,eax
 004DA04A    mov         eax,esi
 004DA04C    mov         edx,dword ptr [ebx+48]
 004DA04F    call        @UStrEqual
>004DA054    je          004DA060
 004DA056    lea         eax,[ebx+48]
 004DA059    mov         edx,esi
 004DA05B    call        @UStrAsg
 004DA060    pop         esi
 004DA061    pop         ebx
 004DA062    ret
*}
end;

//004DA064
procedure TCustomFileDialog.SetFileTypes(const Value:TFileTypeItems);
begin
{*
 004DA064    push        esi
 004DA065    mov         esi,eax
 004DA067    test        edx,edx
>004DA069    je          004DA073
 004DA06B    mov         eax,dword ptr [esi+58]
 004DA06E    mov         ecx,dword ptr [eax]
 004DA070    call        dword ptr [ecx+8]
 004DA073    pop         esi
 004DA074    ret
*}
end;

//004DA078
procedure TCustomFileDialog.SetFavoriteLinks(const Value:TFavoriteLinkItems);
begin
{*
 004DA078    push        esi
 004DA079    mov         esi,eax
 004DA07B    test        edx,edx
>004DA07D    je          004DA087
 004DA07F    mov         eax,dword ptr [esi+44]
 004DA082    mov         ecx,dword ptr [eax]
 004DA084    call        dword ptr [ecx+8]
 004DA087    pop         esi
 004DA088    ret
*}
end;

//004DA08C
procedure TCustomFileDialog.ShareViolation(psiFile:IShellItem; var Response:Cardinal);
begin
{*
 004DA08C    push        ebp
 004DA08D    mov         ebp,esp
 004DA08F    add         esp,0FFFFFFF4
 004DA092    push        ebx
 004DA093    push        esi
 004DA094    push        edi
 004DA095    mov         dword ptr [ebp-8],ecx
 004DA098    mov         dword ptr [ebp-4],edx
 004DA09B    mov         ebx,eax
 004DA09D    mov         eax,dword ptr [ebp-4]
 004DA0A0    call        @IntfAddRef
 004DA0A5    xor         eax,eax
 004DA0A7    push        ebp
 004DA0A8    push        4DA11A
 004DA0AD    push        dword ptr fs:[eax]
 004DA0B0    mov         dword ptr fs:[eax],esp
 004DA0B3    lea         eax,[ebx+48]
 004DA0B6    call        @UStrClr
 004DA0BB    mov         byte ptr [ebp-9],1
 004DA0BF    lea         eax,[ebx+68]
 004DA0C2    mov         edx,dword ptr [ebp-4]
 004DA0C5    call        @IntfCopy
 004DA0CA    lea         ecx,[ebx+48]
 004DA0CD    mov         edx,dword ptr [ebx+68]
 004DA0D0    mov         eax,ebx
 004DA0D2    mov         si,0FFE7
 004DA0D6    call        @CallDynaInst
 004DA0DB    mov         edi,eax
 004DA0DD    test        edi,80000000
>004DA0E3    jne         004DA0F3
 004DA0E5    lea         edx,[ebp-9]
 004DA0E8    mov         eax,ebx
 004DA0EA    mov         si,0FFEA
 004DA0EE    call        @CallDynaInst
 004DA0F3    movzx       eax,byte ptr [ebp-9]
 004DA0F7    mov         edx,dword ptr [ebp-8]
 004DA0FA    mov         dword ptr [edx],eax
 004DA0FC    lea         eax,[ebx+68]
 004DA0FF    call        @IntfClear
 004DA104    xor         eax,eax
 004DA106    pop         edx
 004DA107    pop         ecx
 004DA108    pop         ecx
 004DA109    mov         dword ptr fs:[eax],edx
 004DA10C    push        4DA121
 004DA111    lea         eax,[ebp-4]
 004DA114    call        @IntfClear
 004DA119    ret
>004DA11A    jmp         @HandleFinally
>004DA11F    jmp         004DA111
 004DA121    mov         eax,edi
 004DA123    pop         edi
 004DA124    pop         esi
 004DA125    pop         ebx
 004DA126    mov         esp,ebp
 004DA128    pop         ebp
 004DA129    ret
*}
end;

//004DA12C
procedure TCustomFileDialog.TypeChange;
begin
{*
 004DA12C    push        ebx
 004DA12D    push        esi
 004DA12E    push        edi
 004DA12F    mov         ebx,eax
 004DA131    lea         eax,[ebx+54]
 004DA134    push        eax
 004DA135    mov         eax,dword ptr [ebx+40]
 004DA138    push        eax
 004DA139    mov         eax,dword ptr [eax]
 004DA13B    call        dword ptr [eax+18]
 004DA13E    mov         edi,eax
 004DA140    cmp         word ptr [ebx+0B2],0
>004DA148    je          004DA15D
 004DA14A    test        edi,80000000
>004DA150    jne         004DA15D
 004DA152    mov         eax,ebx
 004DA154    mov         si,0FFE9
 004DA158    call        @CallDynaInst
 004DA15D    mov         eax,edi
 004DA15F    pop         edi
 004DA160    pop         esi
 004DA161    pop         ebx
 004DA162    ret
*}
end;

//004DA164
function TCustomFileOpenDialog.CreateFileDialog:IFileDialog;
begin
{*
 004DA164    push        ebx
 004DA165    push        esi
 004DA166    push        edi
 004DA167    add         esp,0FFFFFFE0
 004DA16A    mov         ebx,edx
 004DA16C    mov         eax,[0078D890]
 004DA171    mov         esi,eax
 004DA173    mov         edi,esp
 004DA175    movs        dword ptr [edi],dword ptr [esi]
 004DA176    movs        dword ptr [edi],dword ptr [esi]
 004DA177    movs        dword ptr [edi],dword ptr [esi]
 004DA178    movs        dword ptr [edi],dword ptr [esi]
 004DA179    mov         eax,ebx
 004DA17B    call        @IntfClear
 004DA180    push        eax
 004DA181    lea         edx,[esp+14]
 004DA185    mov         eax,4DA1B8;'{D57C7288-D4AD-4768-BE02-9D969532D960}'
 004DA18A    call        StringToGUID
 004DA18F    lea         eax,[esp+14]
 004DA193    push        eax
 004DA194    push        1
 004DA196    push        0
 004DA198    lea         eax,[esp+10]
 004DA19C    push        eax
 004DA19D    call        ole32.CoCreateInstance
 004DA1A2    add         esp,20
 004DA1A5    pop         edi
 004DA1A6    pop         esi
 004DA1A7    pop         ebx
 004DA1A8    ret
*}
end;

//004DA208
function TCustomFileOpenDialog.GetResults:HRESULT;
begin
{*
 004DA208    push        ebp
 004DA209    mov         ebp,esp
 004DA20B    push        0
 004DA20D    push        ebx
 004DA20E    push        esi
 004DA20F    mov         ebx,eax
 004DA211    xor         eax,eax
 004DA213    push        ebp
 004DA214    push        4DA27D
 004DA219    push        dword ptr fs:[eax]
 004DA21C    mov         dword ptr fs:[eax],esp
 004DA21F    test        byte ptr [ebx+64],80
>004DA223    jne         004DA230
 004DA225    mov         eax,ebx
 004DA227    call        TCustomFileDialog.GetResults
 004DA22C    mov         esi,eax
>004DA22E    jmp         004DA267
 004DA230    lea         eax,[ebx+6C]
 004DA233    push        eax
 004DA234    lea         eax,[ebp-4]
 004DA237    mov         edx,dword ptr [ebx+40]
 004DA23A    mov         ecx,4DA28C
 004DA23F    call        @IntfCast
 004DA244    mov         eax,dword ptr [ebp-4]
 004DA247    push        eax
 004DA248    mov         eax,dword ptr [eax]
 004DA24A    call        dword ptr [eax+6C]
 004DA24D    mov         esi,eax
 004DA24F    test        esi,80000000
>004DA255    jne         004DA267
 004DA257    mov         edx,dword ptr [ebx+6C]
 004DA25A    mov         eax,ebx
 004DA25C    mov         si,0FFE8
 004DA260    call        @CallDynaInst
 004DA265    mov         esi,eax
 004DA267    xor         eax,eax
 004DA269    pop         edx
 004DA26A    pop         ecx
 004DA26B    pop         ecx
 004DA26C    mov         dword ptr fs:[eax],edx
 004DA26F    push        4DA284
 004DA274    lea         eax,[ebp-4]
 004DA277    call        @IntfClear
 004DA27C    ret
>004DA27D    jmp         @HandleFinally
>004DA282    jmp         004DA274
 004DA284    mov         eax,esi
 004DA286    pop         esi
 004DA287    pop         ebx
 004DA288    pop         ecx
 004DA289    pop         ebp
 004DA28A    ret
*}
end;

//004DA29C
procedure TCustomFileOpenDialog.SelectionChange;
begin
{*
 004DA29C    push        ebp
 004DA29D    mov         ebp,esp
 004DA29F    push        0
 004DA2A1    push        ebx
 004DA2A2    push        esi
 004DA2A3    push        edi
 004DA2A4    mov         ebx,eax
 004DA2A6    xor         eax,eax
 004DA2A8    push        ebp
 004DA2A9    push        4DA33A
 004DA2AE    push        dword ptr fs:[eax]
 004DA2B1    mov         dword ptr fs:[eax],esp
 004DA2B4    test        byte ptr [ebx+64],80
>004DA2B8    jne         004DA2C5
 004DA2BA    mov         eax,ebx
 004DA2BC    call        TCustomFileDialog.SelectionChange
 004DA2C1    mov         edi,eax
>004DA2C3    jmp         004DA324
 004DA2C5    lea         eax,[ebx+6C]
 004DA2C8    push        eax
 004DA2C9    lea         eax,[ebp-4]
 004DA2CC    mov         edx,dword ptr [ebx+40]
 004DA2CF    mov         ecx,4DA34C
 004DA2D4    call        @IntfCast
 004DA2D9    mov         eax,dword ptr [ebp-4]
 004DA2DC    push        eax
 004DA2DD    mov         eax,dword ptr [eax]
 004DA2DF    call        dword ptr [eax+70]
 004DA2E2    mov         edi,eax
 004DA2E4    test        edi,80000000
>004DA2EA    jne         004DA324
 004DA2EC    mov         edx,dword ptr [ebx+6C]
 004DA2EF    mov         eax,ebx
 004DA2F1    mov         si,0FFE8
 004DA2F5    call        @CallDynaInst
 004DA2FA    mov         edi,eax
 004DA2FC    test        edi,80000000
>004DA302    jne         004DA31C
 004DA304    lea         eax,[ebx+68]
 004DA307    push        eax
 004DA308    mov         eax,dword ptr [ebx+40]
 004DA30B    push        eax
 004DA30C    mov         eax,dword ptr [eax]
 004DA30E    call        dword ptr [eax+38]
 004DA311    mov         eax,ebx
 004DA313    mov         si,0FFEB
 004DA317    call        @CallDynaInst
 004DA31C    lea         eax,[ebx+6C]
 004DA31F    call        @IntfClear
 004DA324    xor         eax,eax
 004DA326    pop         edx
 004DA327    pop         ecx
 004DA328    pop         ecx
 004DA329    mov         dword ptr fs:[eax],edx
 004DA32C    push        4DA341
 004DA331    lea         eax,[ebp-4]
 004DA334    call        @IntfClear
 004DA339    ret
>004DA33A    jmp         @HandleFinally
>004DA33F    jmp         004DA331
 004DA341    mov         eax,edi
 004DA343    pop         edi
 004DA344    pop         esi
 004DA345    pop         ebx
 004DA346    pop         ecx
 004DA347    pop         ebp
 004DA348    ret
*}
end;

//004DA35C
function TCustomFileSaveDialog.CreateFileDialog:IFileDialog;
begin
{*
 004DA35C    push        ebx
 004DA35D    push        esi
 004DA35E    push        edi
 004DA35F    add         esp,0FFFFFFE0
 004DA362    mov         ebx,edx
 004DA364    mov         eax,[0078D22C]
 004DA369    mov         esi,eax
 004DA36B    mov         edi,esp
 004DA36D    movs        dword ptr [edi],dword ptr [esi]
 004DA36E    movs        dword ptr [edi],dword ptr [esi]
 004DA36F    movs        dword ptr [edi],dword ptr [esi]
 004DA370    movs        dword ptr [edi],dword ptr [esi]
 004DA371    mov         eax,ebx
 004DA373    call        @IntfClear
 004DA378    push        eax
 004DA379    lea         edx,[esp+14]
 004DA37D    mov         eax,4DA3B0;'{84BCCD23-5FDE-4CDB-AEA4-AF64B83D78AB}'
 004DA382    call        StringToGUID
 004DA387    lea         eax,[esp+14]
 004DA38B    push        eax
 004DA38C    push        1
 004DA38E    push        0
 004DA390    lea         eax,[esp+10]
 004DA394    push        eax
 004DA395    call        ole32.CoCreateInstance
 004DA39A    add         esp,20
 004DA39D    pop         edi
 004DA39E    pop         esi
 004DA39F    pop         ebx
 004DA3A0    ret
*}
end;

//004DA400
constructor TTaskDialogProgressBar.Create;
begin
{*
 004DA400    push        ebx
 004DA401    push        esi
 004DA402    push        edi
 004DA403    test        dl,dl
>004DA405    je          004DA40F
 004DA407    add         esp,0FFFFFFF0
 004DA40A    call        @ClassCreate
 004DA40F    mov         esi,ecx
 004DA411    mov         ebx,edx
 004DA413    mov         edi,eax
 004DA415    xor         edx,edx
 004DA417    mov         eax,edi
 004DA419    call        TObject.Create
 004DA41E    mov         dword ptr [edi+4],esi
 004DA421    mov         dword ptr [edi+0C],64
 004DA428    xor         eax,eax
 004DA42A    mov         dword ptr [edi+10],eax
 004DA42D    xor         eax,eax
 004DA42F    mov         dword ptr [edi+14],eax
 004DA432    xor         eax,eax
 004DA434    mov         dword ptr [edi+8],eax
 004DA437    mov         byte ptr [edi+18],0
 004DA43B    mov         eax,edi
 004DA43D    test        bl,bl
>004DA43F    je          004DA450
 004DA441    call        @AfterConstruction
 004DA446    pop         dword ptr fs:[0]
 004DA44D    add         esp,0C
 004DA450    mov         eax,edi
 004DA452    pop         edi
 004DA453    pop         esi
 004DA454    pop         ebx
 004DA455    ret
*}
end;

//004DA458
procedure TTaskDialogProgressBar.SetMax(const Value:Integer);
begin
{*
 004DA458    push        ebp
 004DA459    mov         ebp,esp
 004DA45B    add         esp,0FFFFFFF0
 004DA45E    push        ebx
 004DA45F    push        esi
 004DA460    xor         ecx,ecx
 004DA462    mov         dword ptr [ebp-0C],ecx
 004DA465    mov         dword ptr [ebp-10],ecx
 004DA468    mov         ebx,eax
 004DA46A    xor         eax,eax
 004DA46C    push        ebp
 004DA46D    push        4DA506
 004DA472    push        dword ptr fs:[eax]
 004DA475    mov         dword ptr fs:[eax],esp
 004DA478    cmp         edx,dword ptr [ebx+0C]
>004DA47B    je          004DA4EB
 004DA47D    cmp         edx,dword ptr [ebx+10]
>004DA480    jge         004DA4BD
 004DA482    lea         edx,[ebp-0C]
 004DA485    mov         eax,dword ptr [ebx]
 004DA487    call        TObject.ClassName
 004DA48C    mov         eax,dword ptr [ebp-0C]
 004DA48F    mov         dword ptr [ebp-8],eax
 004DA492    mov         byte ptr [ebp-4],11
 004DA496    lea         eax,[ebp-8]
 004DA499    push        eax
 004DA49A    push        0
 004DA49C    lea         edx,[ebp-10]
 004DA49F    mov         eax,[0078D0A0];^SResString207:TResStringRec
 004DA4A4    call        LoadResString
 004DA4A9    mov         ecx,dword ptr [ebp-10]
 004DA4AC    mov         dl,1
 004DA4AE    mov         eax,[00439268];EInvalidOperation
 004DA4B3    call        Exception.CreateFmt
 004DA4B8    call        @RaiseExcept
 004DA4BD    mov         dword ptr [ebx+0C],edx
 004DA4C0    mov         eax,dword ptr [ebx+4]
 004DA4C3    mov         esi,dword ptr [eax+68]
 004DA4C6    test        esi,esi
>004DA4C8    je          004DA4EB
 004DA4CA    test        byte ptr [eax+5D],4
>004DA4CE    jne         004DA4EB
 004DA4D0    movzx       eax,word ptr [ebx+10]
 004DA4D4    movzx       edx,word ptr [ebx+0C]
 004DA4D8    shl         edx,10
 004DA4DB    or          eax,edx
 004DA4DD    push        eax
 004DA4DE    push        0
 004DA4E0    push        469
 004DA4E5    push        esi
 004DA4E6    call        user32.SendMessageW
 004DA4EB    xor         eax,eax
 004DA4ED    pop         edx
 004DA4EE    pop         ecx
 004DA4EF    pop         ecx
 004DA4F0    mov         dword ptr fs:[eax],edx
 004DA4F3    push        4DA50D
 004DA4F8    lea         eax,[ebp-10]
 004DA4FB    mov         edx,2
 004DA500    call        @UStrArrayClr
 004DA505    ret
>004DA506    jmp         @HandleFinally
>004DA50B    jmp         004DA4F8
 004DA50D    pop         esi
 004DA50E    pop         ebx
 004DA50F    mov         esp,ebp
 004DA511    pop         ebp
 004DA512    ret
*}
end;

//004DA514
procedure TTaskDialogProgressBar.SetMin(const Value:Integer);
begin
{*
 004DA514    push        ebp
 004DA515    mov         ebp,esp
 004DA517    add         esp,0FFFFFFF0
 004DA51A    push        ebx
 004DA51B    push        esi
 004DA51C    xor         ecx,ecx
 004DA51E    mov         dword ptr [ebp-0C],ecx
 004DA521    mov         dword ptr [ebp-10],ecx
 004DA524    mov         ebx,eax
 004DA526    xor         eax,eax
 004DA528    push        ebp
 004DA529    push        4DA5C2
 004DA52E    push        dword ptr fs:[eax]
 004DA531    mov         dword ptr fs:[eax],esp
 004DA534    cmp         edx,dword ptr [ebx+10]
>004DA537    je          004DA5A7
 004DA539    cmp         edx,dword ptr [ebx+0C]
>004DA53C    jle         004DA579
 004DA53E    lea         edx,[ebp-0C]
 004DA541    mov         eax,dword ptr [ebx]
 004DA543    call        TObject.ClassName
 004DA548    mov         eax,dword ptr [ebp-0C]
 004DA54B    mov         dword ptr [ebp-8],eax
 004DA54E    mov         byte ptr [ebp-4],11
 004DA552    lea         eax,[ebp-8]
 004DA555    push        eax
 004DA556    push        0
 004DA558    lea         edx,[ebp-10]
 004DA55B    mov         eax,[0078D0A0];^SResString207:TResStringRec
 004DA560    call        LoadResString
 004DA565    mov         ecx,dword ptr [ebp-10]
 004DA568    mov         dl,1
 004DA56A    mov         eax,[00439268];EInvalidOperation
 004DA56F    call        Exception.CreateFmt
 004DA574    call        @RaiseExcept
 004DA579    mov         dword ptr [ebx+10],edx
 004DA57C    mov         eax,dword ptr [ebx+4]
 004DA57F    mov         esi,dword ptr [eax+68]
 004DA582    test        esi,esi
>004DA584    je          004DA5A7
 004DA586    test        byte ptr [eax+5D],4
>004DA58A    jne         004DA5A7
 004DA58C    movzx       eax,word ptr [ebx+10]
 004DA590    movzx       edx,word ptr [ebx+0C]
 004DA594    shl         edx,10
 004DA597    or          eax,edx
 004DA599    push        eax
 004DA59A    push        0
 004DA59C    push        469
 004DA5A1    push        esi
 004DA5A2    call        user32.SendMessageW
 004DA5A7    xor         eax,eax
 004DA5A9    pop         edx
 004DA5AA    pop         ecx
 004DA5AB    pop         ecx
 004DA5AC    mov         dword ptr fs:[eax],edx
 004DA5AF    push        4DA5C9
 004DA5B4    lea         eax,[ebp-10]
 004DA5B7    mov         edx,2
 004DA5BC    call        @UStrArrayClr
 004DA5C1    ret
>004DA5C2    jmp         @HandleFinally
>004DA5C7    jmp         004DA5B4
 004DA5C9    pop         esi
 004DA5CA    pop         ebx
 004DA5CB    mov         esp,ebp
 004DA5CD    pop         ebp
 004DA5CE    ret
*}
end;

//004DA5D0
procedure TTaskDialogProgressBar.SetPosition(const Value:Integer);
begin
{*
 004DA5D0    push        esi
 004DA5D1    add         esp,0FFFFFFF0
 004DA5D4    cmp         edx,dword ptr [eax+14]
>004DA5D7    je          004DA63A
 004DA5D9    test        edx,edx
>004DA5DB    jl          004DA5E5
 004DA5DD    cmp         edx,0FFFF
>004DA5E3    jle         004DA616
 004DA5E5    xor         eax,eax
 004DA5E7    mov         dword ptr [esp],eax
 004DA5EA    mov         byte ptr [esp+4],0
 004DA5EF    mov         dword ptr [esp+8],0FFFF
 004DA5F7    mov         byte ptr [esp+0C],0
 004DA5FC    push        esp
 004DA5FD    push        1
 004DA5FF    mov         ecx,dword ptr ds:[78D1E0];^SResString278:TResStringRec
 004DA605    mov         dl,1
 004DA607    mov         eax,[00418C04];Exception
 004DA60C    call        Exception.CreateResFmt
 004DA611    call        @RaiseExcept
 004DA616    mov         dword ptr [eax+14],edx
 004DA619    mov         edx,dword ptr [eax+4]
 004DA61C    mov         esi,dword ptr [edx+68]
 004DA61F    test        esi,esi
>004DA621    je          004DA63A
 004DA623    test        byte ptr [edx+5D],4
>004DA627    jne         004DA63A
 004DA629    push        0
 004DA62B    mov         edx,dword ptr [eax+14]
 004DA62E    push        edx
 004DA62F    push        46A
 004DA634    push        esi
 004DA635    call        user32.SendMessageW
 004DA63A    add         esp,10
 004DA63D    pop         esi
 004DA63E    ret
*}
end;

//004DA640
procedure TTaskDialogProgressBar.SetState(const Value:TProgressBarState);
begin
{*
 004DA640    cmp         dl,byte ptr [eax+18]
>004DA643    je          004DA66C
 004DA645    mov         ecx,edx
 004DA647    mov         byte ptr [eax+18],cl
 004DA64A    mov         edx,dword ptr [eax+4]
 004DA64D    mov         edx,dword ptr [edx+68]
 004DA650    test        edx,edx
>004DA652    je          004DA66C
 004DA654    push        0
 004DA656    and         ecx,7F
 004DA659    mov         ecx,dword ptr [ecx*4+786564]
 004DA660    push        ecx
 004DA661    push        468
 004DA666    push        edx
 004DA667    call        user32.SendMessageW
 004DA66C    ret
*}
end;

//004DA670
procedure TTaskDialogProgressBar.SetMarqueeSpeed(const Value:Cardinal);
begin
{*
 004DA670    push        esi
 004DA671    cmp         edx,dword ptr [eax+8]
>004DA674    je          004DA69A
 004DA676    mov         dword ptr [eax+8],edx
 004DA679    mov         edx,dword ptr [eax+4]
 004DA67C    mov         esi,dword ptr [edx+68]
 004DA67F    test        esi,esi
>004DA681    je          004DA69A
 004DA683    test        byte ptr [edx+5D],4
>004DA687    je          004DA69A
 004DA689    mov         edx,dword ptr [eax+8]
 004DA68C    push        edx
 004DA68D    push        0FF
 004DA68F    push        46B
 004DA694    push        esi
 004DA695    call        user32.SendMessageW
 004DA69A    pop         esi
 004DA69B    ret
*}
end;

//004DA69C
procedure TTaskDialogProgressBar.Initialize;
begin
{*
 004DA69C    push        ebx
 004DA69D    mov         ebx,eax
 004DA69F    push        0
 004DA6A1    mov         eax,dword ptr [ebx+4]
 004DA6A4    test        byte ptr [eax+5D],4
 004DA6A8    setne       dl
 004DA6AB    neg         dl
 004DA6AD    sbb         edx,edx
 004DA6AF    push        edx
 004DA6B0    push        467
 004DA6B5    mov         eax,dword ptr [eax+68]
 004DA6B8    push        eax
 004DA6B9    call        user32.SendMessageW
 004DA6BE    mov         eax,dword ptr [ebx+4]
 004DA6C1    test        byte ptr [eax+5D],4
>004DA6C5    je          004DA6DD
 004DA6C7    mov         edx,dword ptr [ebx+8]
 004DA6CA    push        edx
 004DA6CB    push        0FF
 004DA6CD    push        46B
 004DA6D2    mov         eax,dword ptr [eax+68]
 004DA6D5    push        eax
 004DA6D6    call        user32.SendMessageW
>004DA6DB    jmp         004DA712
 004DA6DD    movzx       edx,word ptr [ebx+10]
 004DA6E1    movzx       ecx,word ptr [ebx+0C]
 004DA6E5    shl         ecx,10
 004DA6E8    or          edx,ecx
 004DA6EA    push        edx
 004DA6EB    push        0
 004DA6ED    push        469
 004DA6F2    mov         eax,dword ptr [eax+68]
 004DA6F5    push        eax
 004DA6F6    call        user32.SendMessageW
 004DA6FB    push        0
 004DA6FD    mov         eax,dword ptr [ebx+14]
 004DA700    push        eax
 004DA701    push        46A
 004DA706    mov         eax,dword ptr [ebx+4]
 004DA709    mov         eax,dword ptr [eax+68]
 004DA70C    push        eax
 004DA70D    call        user32.SendMessageW
 004DA712    push        0
 004DA714    movzx       eax,byte ptr [ebx+18]
 004DA718    mov         eax,dword ptr [eax*4+786564]
 004DA71F    push        eax
 004DA720    push        468
 004DA725    mov         eax,dword ptr [ebx+4]
 004DA728    mov         eax,dword ptr [eax+68]
 004DA72B    push        eax
 004DA72C    call        user32.SendMessageW
 004DA731    pop         ebx
 004DA732    ret
*}
end;

//004DA734
constructor TTaskDialogBaseButtonItem.Create;
begin
{*
 004DA734    push        ebx
 004DA735    push        esi
 004DA736    push        edi
 004DA737    test        dl,dl
>004DA739    je          004DA743
 004DA73B    add         esp,0FFFFFFF0
 004DA73E    call        @ClassCreate
 004DA743    mov         esi,ecx
 004DA745    mov         ebx,edx
 004DA747    mov         edi,eax
 004DA749    mov         ecx,esi
 004DA74B    xor         edx,edx
 004DA74D    mov         eax,edi
 004DA74F    call        TCollectionItem.Create
 004DA754    lea         eax,[edi+0C]
 004DA757    call        @UStrClr
 004DA75C    mov         eax,esi
 004DA75E    call        TCollection.Owner
 004DA763    mov         dword ptr [edi+10],eax
 004DA766    mov         byte ptr [edi+14],1
 004DA76A    mov         eax,dword ptr [edi+8]
 004DA76D    add         eax,64
 004DA770    mov         dword ptr [edi+18],eax
 004DA773    xor         eax,eax
 004DA775    mov         dword ptr [edi+1C],eax
 004DA778    mov         eax,edi
 004DA77A    test        bl,bl
>004DA77C    je          004DA78D
 004DA77E    call        @AfterConstruction
 004DA783    pop         dword ptr fs:[0]
 004DA78A    add         esp,0C
 004DA78D    mov         eax,edi
 004DA78F    pop         edi
 004DA790    pop         esi
 004DA791    pop         ebx
 004DA792    ret
*}
end;

//004DA794
destructor TTaskDialogBaseButtonItem.Destroy();
begin
{*
 004DA794    push        ebx
 004DA795    push        esi
 004DA796    call        @BeforeDestruction
 004DA79B    mov         ebx,edx
 004DA79D    mov         esi,eax
 004DA79F    mov         eax,dword ptr [esi+1C]
 004DA7A2    test        eax,eax
>004DA7A4    je          004DA7AC
 004DA7A6    push        eax
 004DA7A7    call        ole32.CoTaskMemFree
 004DA7AC    mov         edx,ebx
 004DA7AE    and         dl,0FC
 004DA7B1    mov         eax,esi
 004DA7B3    call        TCollectionItem.Destroy
 004DA7B8    test        bl,bl
>004DA7BA    jle         004DA7C3
 004DA7BC    mov         eax,esi
 004DA7BE    call        @ClassDestroy
 004DA7C3    pop         esi
 004DA7C4    pop         ebx
 004DA7C5    ret
*}
end;

//004DA7C8
procedure TTaskDialogBaseButtonItem.DoButtonClick;
begin
{*
 004DA7C8    mov         edx,dword ptr [eax+10]
 004DA7CB    mov         edx,dword ptr [edx+68]
 004DA7CE    test        edx,edx
>004DA7D0    je          004DA7E3
 004DA7D2    push        0
 004DA7D4    mov         ecx,dword ptr [eax+18]
 004DA7D7    push        ecx
 004DA7D8    push        466
 004DA7DD    push        edx
 004DA7DE    call        user32.SendMessageW
 004DA7E3    ret
*}
end;

//004DA7E4
procedure TTaskDialogBaseButtonItem.DoSetEnabled;
begin
{*
 004DA7E4    mov         edx,dword ptr [eax+10]
 004DA7E7    mov         edx,dword ptr [edx+68]
 004DA7EA    test        edx,edx
>004DA7EC    je          004DA802
 004DA7EE    movzx       ecx,byte ptr [eax+14]
 004DA7F2    push        ecx
 004DA7F3    mov         ecx,dword ptr [eax+18]
 004DA7F6    push        ecx
 004DA7F7    push        46F
 004DA7FC    push        edx
 004DA7FD    call        user32.SendMessageW
 004DA802    ret
*}
end;

//004DA804
procedure TTaskDialogBaseButtonItem.Click;
begin
{*
 004DA804    mov         edx,dword ptr [eax]
 004DA806    call        dword ptr [edx+20];TTaskDialogBaseButtonItem.DoButtonClick
 004DA809    ret
*}
end;

//004DA80C
function TTaskDialogBaseButtonItem.GetButtonText:UnicodeString;
begin
{*
 004DA80C    push        ebx
 004DA80D    push        esi
 004DA80E    mov         esi,edx
 004DA810    mov         ebx,eax
 004DA812    mov         eax,esi
 004DA814    mov         edx,dword ptr [ebx+0C]
 004DA817    call        @UStrAsg
 004DA81C    pop         esi
 004DA81D    pop         ebx
 004DA81E    ret
*}
end;

//004DA820
function TTaskDialogBaseButtonItem.GetDefault:Boolean;
begin
{*
 004DA820    mov         edx,dword ptr [eax+4]
 004DA823    cmp         eax,dword ptr [edx+24]
 004DA826    sete        al
 004DA829    ret
*}
end;

//004DA82C
function TTaskDialogBaseButtonItem.GetDisplayName:UnicodeString;
begin
{*
 004DA82C    push        ebx
 004DA82D    push        esi
 004DA82E    mov         esi,edx
 004DA830    mov         ebx,eax
 004DA832    mov         eax,esi
 004DA834    mov         edx,dword ptr [ebx+0C]
 004DA837    call        @UStrAsg
 004DA83C    cmp         dword ptr [esi],0
>004DA83F    jne         004DA84A
 004DA841    mov         edx,esi
 004DA843    mov         eax,ebx
 004DA845    call        TCollectionItem.GetDisplayName
 004DA84A    pop         esi
 004DA84B    pop         ebx
 004DA84C    ret
*}
end;

//004DA850
function TTaskDialogBaseButtonItem.GetTextWStr:LPCWSTR;
begin
{*
 004DA850    push        ebp
 004DA851    mov         ebp,esp
 004DA853    push        0
 004DA855    push        ebx
 004DA856    push        esi
 004DA857    mov         ebx,eax
 004DA859    xor         eax,eax
 004DA85B    push        ebp
 004DA85C    push        4DA8A3
 004DA861    push        dword ptr fs:[eax]
 004DA864    mov         dword ptr fs:[eax],esp
 004DA867    lea         edx,[ebp-4]
 004DA86A    mov         eax,ebx
 004DA86C    mov         ecx,dword ptr [eax]
 004DA86E    call        dword ptr [ecx+28]
 004DA871    mov         eax,dword ptr [ebx+1C]
 004DA874    test        eax,eax
>004DA876    je          004DA87E
 004DA878    push        eax
 004DA879    call        ole32.CoTaskMemFree
 004DA87E    mov         eax,dword ptr [ebp-4]
 004DA881    call        AllocCoTaskMemStr
 004DA886    mov         esi,eax
 004DA888    mov         dword ptr [ebx+1C],esi
 004DA88B    mov         ebx,esi
 004DA88D    xor         eax,eax
 004DA88F    pop         edx
 004DA890    pop         ecx
 004DA891    pop         ecx
 004DA892    mov         dword ptr fs:[eax],edx
 004DA895    push        4DA8AA
 004DA89A    lea         eax,[ebp-4]
 004DA89D    call        @UStrClr
 004DA8A2    ret
>004DA8A3    jmp         @HandleFinally
>004DA8A8    jmp         004DA89A
 004DA8AA    mov         eax,ebx
 004DA8AC    pop         esi
 004DA8AD    pop         ebx
 004DA8AE    pop         ecx
 004DA8AF    pop         ebp
 004DA8B0    ret
*}
end;

//004DA8B4
procedure TTaskDialogBaseButtonItem.SetCaption(const Value:UnicodeString);
begin
{*
 004DA8B4    push        ebx
 004DA8B5    push        esi
 004DA8B6    mov         esi,edx
 004DA8B8    mov         ebx,eax
 004DA8BA    mov         eax,esi
 004DA8BC    mov         edx,dword ptr [ebx+0C]
 004DA8BF    call        @UStrEqual
>004DA8C4    je          004DA8EB
 004DA8C6    test        esi,esi
>004DA8C8    jne         004DA8E1
 004DA8CA    mov         ecx,dword ptr ds:[78D530];^SResString306:TResStringRec
 004DA8D0    mov         dl,1
 004DA8D2    mov         eax,[00418C04];Exception
 004DA8D7    call        Exception.CreateRes
 004DA8DC    call        @RaiseExcept
 004DA8E1    lea         eax,[ebx+0C]
 004DA8E4    mov         edx,esi
 004DA8E6    call        @UStrAsg
 004DA8EB    pop         esi
 004DA8EC    pop         ebx
 004DA8ED    ret
*}
end;

//004DA8F0
procedure TTaskDialogBaseButtonItem.SetDefault(const Value:Boolean);
begin
{*
 004DA8F0    test        dl,dl
>004DA8F2    je          004DA8FF
 004DA8F4    mov         edx,eax
 004DA8F6    mov         eax,dword ptr [eax+4]
 004DA8F9    call        TTaskDialogButtons.SetDefaultButton
 004DA8FE    ret
 004DA8FF    xor         edx,edx
 004DA901    mov         eax,dword ptr [eax+4]
 004DA904    call        TTaskDialogButtons.SetDefaultButton
 004DA909    ret
*}
end;

//004DA90C
procedure TTaskDialogBaseButtonItem.SetEnabled(const Value:Boolean);
begin
{*
 004DA90C    cmp         dl,byte ptr [eax+14]
>004DA90F    je          004DA919
 004DA911    mov         byte ptr [eax+14],dl
 004DA914    mov         edx,dword ptr [eax]
 004DA916    call        dword ptr [edx+24]
 004DA919    ret
*}
end;

//004DA91C
procedure TTaskDialogBaseButtonItem.SetInitialState;
begin
{*
 004DA91C    cmp         byte ptr [eax+14],0
>004DA920    jne         004DA927
 004DA922    mov         edx,dword ptr [eax]
 004DA924    call        dword ptr [edx+24]
 004DA927    ret
*}
end;

//004DA928
constructor TTaskDialogButtonItem.Create;
begin
{*
 004DA928    push        ebp
 004DA929    mov         ebp,esp
 004DA92B    add         esp,0FFFFFFF0
 004DA92E    push        ebx
 004DA92F    push        esi
 004DA930    xor         ebx,ebx
 004DA932    mov         dword ptr [ebp-4],ebx
 004DA935    mov         dword ptr [ebp-8],ebx
 004DA938    test        dl,dl
>004DA93A    je          004DA944
 004DA93C    add         esp,0FFFFFFF0
 004DA93F    call        @ClassCreate
 004DA944    mov         ebx,edx
 004DA946    mov         esi,eax
 004DA948    xor         eax,eax
 004DA94A    push        ebp
 004DA94B    push        4DA9B1
 004DA950    push        dword ptr fs:[eax]
 004DA953    mov         dword ptr fs:[eax],esp
 004DA956    xor         edx,edx
 004DA958    mov         eax,esi
 004DA95A    call        TTaskDialogBaseButtonItem.Create
 004DA95F    lea         eax,[ebp-4]
 004DA962    push        eax
 004DA963    lea         edx,[ebp-8]
 004DA966    mov         eax,[0078D3E4];^SResString304:TResStringRec
 004DA96B    call        LoadResString
 004DA970    mov         eax,dword ptr [ebp-8]
 004DA973    mov         edx,dword ptr [esi+8]
 004DA976    inc         edx
 004DA977    mov         dword ptr [ebp-10],edx
 004DA97A    mov         byte ptr [ebp-0C],0
 004DA97E    lea         edx,[ebp-10]
 004DA981    xor         ecx,ecx
 004DA983    call        Format
 004DA988    mov         edx,dword ptr [ebp-4]
 004DA98B    mov         eax,esi
 004DA98D    call        TTaskDialogBaseButtonItem.SetCaption
 004DA992    mov         byte ptr [esi+24],0
 004DA996    xor         eax,eax
 004DA998    pop         edx
 004DA999    pop         ecx
 004DA99A    pop         ecx
 004DA99B    mov         dword ptr fs:[eax],edx
 004DA99E    push        4DA9B8
 004DA9A3    lea         eax,[ebp-8]
 004DA9A6    mov         edx,2
 004DA9AB    call        @UStrArrayClr
 004DA9B0    ret
>004DA9B1    jmp         @HandleFinally
>004DA9B6    jmp         004DA9A3
 004DA9B8    mov         eax,esi
 004DA9BA    test        bl,bl
>004DA9BC    je          004DA9CD
 004DA9BE    call        @AfterConstruction
 004DA9C3    pop         dword ptr fs:[0]
 004DA9CA    add         esp,0C
 004DA9CD    mov         eax,esi
 004DA9CF    pop         esi
 004DA9D0    pop         ebx
 004DA9D1    mov         esp,ebp
 004DA9D3    pop         ebp
 004DA9D4    ret
*}
end;

//004DA9D8
procedure TTaskDialogButtonItem.DoSetElevationRequired;
begin
{*
 004DA9D8    mov         edx,dword ptr [eax+10]
 004DA9DB    mov         edx,dword ptr [edx+68]
 004DA9DE    test        edx,edx
>004DA9E0    je          004DA9F6
 004DA9E2    movzx       ecx,byte ptr [eax+24]
 004DA9E6    push        ecx
 004DA9E7    mov         ecx,dword ptr [eax+18]
 004DA9EA    push        ecx
 004DA9EB    push        473
 004DA9F0    push        edx
 004DA9F1    call        user32.SendMessageW
 004DA9F6    ret
*}
end;

//004DA9F8
function TTaskDialogButtonItem.GetButtonText:UnicodeString;
begin
{*
 004DA9F8    push        ebx
 004DA9F9    push        esi
 004DA9FA    mov         esi,edx
 004DA9FC    mov         ebx,eax
 004DA9FE    cmp         dword ptr [ebx+20],0
>004DAA02    je          004DAA30
 004DAA04    mov         eax,dword ptr [ebx+10]
 004DAA07    test        byte ptr [eax+5C],10
>004DAA0B    jne         004DAA16
 004DAA0D    mov         eax,dword ptr [ebx+10]
 004DAA10    test        byte ptr [eax+5C],20
>004DAA14    je          004DAA30
 004DAA16    push        dword ptr [ebx+0C]
 004DAA19    push        4DAA48;'
'
 004DAA1E    push        dword ptr [ebx+20]
 004DAA21    mov         eax,esi
 004DAA23    mov         edx,3
 004DAA28    call        @UStrCatN
 004DAA2D    pop         esi
 004DAA2E    pop         ebx
 004DAA2F    ret
 004DAA30    mov         edx,esi
 004DAA32    mov         eax,ebx
 004DAA34    call        TTaskDialogBaseButtonItem.GetButtonText
 004DAA39    pop         esi
 004DAA3A    pop         ebx
 004DAA3B    ret
*}
end;

//004DAA4C
procedure TTaskDialogButtonItem.SetElevationRequired(const Value:Boolean);
begin
{*
 004DAA4C    cmp         dl,byte ptr [eax+24]
>004DAA4F    je          004DAA59
 004DAA51    mov         byte ptr [eax+24],dl
 004DAA54    call        TTaskDialogButtonItem.DoSetElevationRequired
 004DAA59    ret
*}
end;

//004DAA5C
procedure TTaskDialogButtonItem.SetInitialState;
begin
{*
 004DAA5C    push        ebx
 004DAA5D    mov         ebx,eax
 004DAA5F    mov         eax,ebx
 004DAA61    call        TTaskDialogBaseButtonItem.SetInitialState
 004DAA66    cmp         byte ptr [ebx+24],0
>004DAA6A    je          004DAA73
 004DAA6C    mov         eax,ebx
 004DAA6E    call        TTaskDialogButtonItem.DoSetElevationRequired
 004DAA73    pop         ebx
 004DAA74    ret
*}
end;

//004DAA78
constructor TTaskDialogRadioButtonItem.Create;
begin
{*
 004DAA78    push        ebp
 004DAA79    mov         ebp,esp
 004DAA7B    add         esp,0FFFFFFF0
 004DAA7E    push        ebx
 004DAA7F    push        esi
 004DAA80    xor         ebx,ebx
 004DAA82    mov         dword ptr [ebp-4],ebx
 004DAA85    mov         dword ptr [ebp-8],ebx
 004DAA88    test        dl,dl
>004DAA8A    je          004DAA94
 004DAA8C    add         esp,0FFFFFFF0
 004DAA8F    call        @ClassCreate
 004DAA94    mov         ebx,edx
 004DAA96    mov         esi,eax
 004DAA98    xor         eax,eax
 004DAA9A    push        ebp
 004DAA9B    push        4DAAFD
 004DAAA0    push        dword ptr fs:[eax]
 004DAAA3    mov         dword ptr fs:[eax],esp
 004DAAA6    xor         edx,edx
 004DAAA8    mov         eax,esi
 004DAAAA    call        TTaskDialogBaseButtonItem.Create
 004DAAAF    lea         eax,[ebp-4]
 004DAAB2    push        eax
 004DAAB3    lea         edx,[ebp-8]
 004DAAB6    mov         eax,[0078CFF4];^SResString305:TResStringRec
 004DAABB    call        LoadResString
 004DAAC0    mov         eax,dword ptr [ebp-8]
 004DAAC3    mov         edx,dword ptr [esi+8]
 004DAAC6    inc         edx
 004DAAC7    mov         dword ptr [ebp-10],edx
 004DAACA    mov         byte ptr [ebp-0C],0
 004DAACE    lea         edx,[ebp-10]
 004DAAD1    xor         ecx,ecx
 004DAAD3    call        Format
 004DAAD8    mov         edx,dword ptr [ebp-4]
 004DAADB    mov         eax,esi
 004DAADD    call        TTaskDialogBaseButtonItem.SetCaption
 004DAAE2    xor         eax,eax
 004DAAE4    pop         edx
 004DAAE5    pop         ecx
 004DAAE6    pop         ecx
 004DAAE7    mov         dword ptr fs:[eax],edx
 004DAAEA    push        4DAB04
 004DAAEF    lea         eax,[ebp-8]
 004DAAF2    mov         edx,2
 004DAAF7    call        @UStrArrayClr
 004DAAFC    ret
>004DAAFD    jmp         @HandleFinally
>004DAB02    jmp         004DAAEF
 004DAB04    mov         eax,esi
 004DAB06    test        bl,bl
>004DAB08    je          004DAB19
 004DAB0A    call        @AfterConstruction
 004DAB0F    pop         dword ptr fs:[0]
 004DAB16    add         esp,0C
 004DAB19    mov         eax,esi
 004DAB1B    pop         esi
 004DAB1C    pop         ebx
 004DAB1D    mov         esp,ebp
 004DAB1F    pop         ebp
 004DAB20    ret
*}
end;

//004DAB24
procedure TTaskDialogRadioButtonItem.DoButtonClick;
begin
{*
 004DAB24    mov         edx,dword ptr [eax+10]
 004DAB27    mov         edx,dword ptr [edx+68]
 004DAB2A    test        edx,edx
>004DAB2C    je          004DAB3F
 004DAB2E    push        0
 004DAB30    mov         ecx,dword ptr [eax+18]
 004DAB33    push        ecx
 004DAB34    push        46E
 004DAB39    push        edx
 004DAB3A    call        user32.SendMessageW
 004DAB3F    ret
*}
end;

//004DAB40
procedure TTaskDialogRadioButtonItem.DoSetEnabled;
begin
{*
 004DAB40    mov         edx,dword ptr [eax+10]
 004DAB43    mov         edx,dword ptr [edx+68]
 004DAB46    test        edx,edx
>004DAB48    je          004DAB5E
 004DAB4A    movzx       ecx,byte ptr [eax+14]
 004DAB4E    push        ecx
 004DAB4F    mov         ecx,dword ptr [eax+18]
 004DAB52    push        ecx
 004DAB53    push        470
 004DAB58    push        edx
 004DAB59    call        user32.SendMessageW
 004DAB5E    ret
*}
end;

//004DAB60
constructor TTaskDialogButtonsEnumerator.Create;
begin
{*
 004DAB60    push        ebx
 004DAB61    push        esi
 004DAB62    push        edi
 004DAB63    test        dl,dl
>004DAB65    je          004DAB6F
 004DAB67    add         esp,0FFFFFFF0
 004DAB6A    call        @ClassCreate
 004DAB6F    mov         esi,ecx
 004DAB71    mov         ebx,edx
 004DAB73    mov         edi,eax
 004DAB75    xor         edx,edx
 004DAB77    mov         eax,edi
 004DAB79    call        TObject.Create
 004DAB7E    mov         dword ptr [edi+4],0FFFFFFFF
 004DAB85    mov         dword ptr [edi+8],esi
 004DAB88    mov         eax,edi
 004DAB8A    test        bl,bl
>004DAB8C    je          004DAB9D
 004DAB8E    call        @AfterConstruction
 004DAB93    pop         dword ptr fs:[0]
 004DAB9A    add         esp,0C
 004DAB9D    mov         eax,edi
 004DAB9F    pop         edi
 004DABA0    pop         esi
 004DABA1    pop         ebx
 004DABA2    ret
*}
end;

//004DABA4
function TTaskDialogButtonsEnumerator.GetCurrent:TTaskDialogBaseButtonItem;
begin
{*
 004DABA4    mov         edx,dword ptr [eax+4]
 004DABA7    mov         eax,dword ptr [eax+8]
 004DABAA    call        TTaskDialogButtons.GetItem
 004DABAF    ret
*}
end;

//004DABB0
function TTaskDialogButtonsEnumerator.MoveNext:Boolean;
begin
{*
 004DABB0    mov         edx,dword ptr [eax+8]
 004DABB3    mov         edx,dword ptr [edx+8]
 004DABB6    mov         edx,dword ptr [edx+8]
 004DABB9    dec         edx
 004DABBA    cmp         edx,dword ptr [eax+4]
 004DABBD    setg        dl
 004DABC0    test        dl,dl
>004DABC2    je          004DABC7
 004DABC4    inc         dword ptr [eax+4]
 004DABC7    mov         eax,edx
 004DABC9    ret
*}
end;

//004DABCC
destructor TTaskDialogButtons.Destroy();
begin
{*
 004DABCC    push        ebx
 004DABCD    push        esi
 004DABCE    call        @BeforeDestruction
 004DABD3    mov         ebx,edx
 004DABD5    mov         esi,eax
 004DABD7    mov         edx,ebx
 004DABD9    and         dl,0FC
 004DABDC    mov         eax,esi
 004DABDE    call        TCollection.Destroy
 004DABE3    test        bl,bl
>004DABE5    jle         004DABEE
 004DABE7    mov         eax,esi
 004DABE9    call        @ClassDestroy
 004DABEE    pop         esi
 004DABEF    pop         ebx
 004DABF0    ret
*}
end;

//004DABF4
function TTaskDialogButtons.Add:TTaskDialogBaseButtonItem;
begin
{*
 004DABF4    push        ebx
 004DABF5    mov         ebx,eax
 004DABF7    mov         eax,ebx
 004DABF9    call        TCollection.Add
 004DABFE    pop         ebx
 004DABFF    ret
*}
end;

//004DAC00
function TTaskDialogButtons.Buttons:PTaskDialogButton;
begin
{*
 004DAC00    push        ebx
 004DAC01    push        esi
 004DAC02    push        edi
 004DAC03    mov         ebx,eax
 004DAC05    mov         esi,ebx
 004DAC07    mov         eax,dword ptr [esi+8]
 004DAC0A    mov         eax,dword ptr [eax+8]
 004DAC0D    push        eax
 004DAC0E    lea         eax,[ebx+1C]
 004DAC11    mov         ecx,1
 004DAC16    mov         edx,dword ptr ds:[4D550C];TTaskDialogButtonList
 004DAC1C    call        @DynArraySetLength
 004DAC21    add         esp,4
 004DAC24    mov         eax,dword ptr [esi+8]
 004DAC27    mov         edi,dword ptr [eax+8]
 004DAC2A    dec         edi
 004DAC2B    test        edi,edi
>004DAC2D    jl          004DAC5D
 004DAC2F    inc         edi
 004DAC30    xor         esi,esi
 004DAC32    mov         edx,esi
 004DAC34    mov         eax,ebx
 004DAC36    call        TTaskDialogButtons.GetItem
 004DAC3B    mov         eax,dword ptr [eax+18]
 004DAC3E    mov         edx,dword ptr [ebx+1C]
 004DAC41    mov         dword ptr [edx+esi*8],eax
 004DAC44    mov         edx,esi
 004DAC46    mov         eax,ebx
 004DAC48    call        TTaskDialogButtons.GetItem
 004DAC4D    call        TTaskDialogBaseButtonItem.GetTextWStr
 004DAC52    mov         edx,dword ptr [ebx+1C]
 004DAC55    mov         dword ptr [edx+esi*8+4],eax
 004DAC59    inc         esi
 004DAC5A    dec         edi
>004DAC5B    jne         004DAC32
 004DAC5D    mov         eax,dword ptr [ebx+1C]
 004DAC60    mov         dword ptr [ebx+20],eax
 004DAC63    pop         edi
 004DAC64    pop         esi
 004DAC65    pop         ebx
 004DAC66    ret
*}
end;

//004DAC68
function TTaskDialogButtons.FindButton(AModalResult:TModalResult):TTaskDialogBaseButtonItem;
begin
{*
 004DAC68    push        ebp
 004DAC69    mov         ebp,esp
 004DAC6B    add         esp,0FFFFFFF8
 004DAC6E    push        ebx
 004DAC6F    push        esi
 004DAC70    mov         esi,edx
 004DAC72    xor         edx,edx
 004DAC74    mov         dword ptr [ebp-4],edx
 004DAC77    call        TTaskDialogButtons.GetEnumerator
 004DAC7C    mov         dword ptr [ebp-8],eax
 004DAC7F    xor         eax,eax
 004DAC81    push        ebp
 004DAC82    push        4DACD2
 004DAC87    push        dword ptr fs:[eax]
 004DAC8A    mov         dword ptr fs:[eax],esp
>004DAC8D    jmp         004DACA8
 004DAC8F    mov         eax,dword ptr [ebp-8]
 004DAC92    call        TTaskDialogButtonsEnumerator.GetCurrent
 004DAC97    mov         ebx,eax
 004DAC99    cmp         esi,dword ptr [ebx+18]
>004DAC9C    jne         004DACA8
 004DAC9E    mov         dword ptr [ebp-4],ebx
 004DACA1    call        @TryFinallyExit
>004DACA6    jmp         004DACD9
 004DACA8    mov         eax,dword ptr [ebp-8]
 004DACAB    call        TTaskDialogButtonsEnumerator.MoveNext
 004DACB0    test        al,al
>004DACB2    jne         004DAC8F
 004DACB4    xor         eax,eax
 004DACB6    pop         edx
 004DACB7    pop         ecx
 004DACB8    pop         ecx
 004DACB9    mov         dword ptr fs:[eax],edx
 004DACBC    push        4DACD9
 004DACC1    cmp         dword ptr [ebp-8],0
>004DACC5    je          004DACD1
 004DACC7    mov         dl,1
 004DACC9    mov         eax,dword ptr [ebp-8]
 004DACCC    mov         ecx,dword ptr [eax]
 004DACCE    call        dword ptr [ecx-4]
 004DACD1    ret
>004DACD2    jmp         @HandleFinally
>004DACD7    jmp         004DACC1
 004DACD9    mov         eax,dword ptr [ebp-4]
 004DACDC    pop         esi
 004DACDD    pop         ebx
 004DACDE    pop         ecx
 004DACDF    pop         ecx
 004DACE0    pop         ebp
 004DACE1    ret
*}
end;

//004DACE4
function TTaskDialogButtons.GetEnumerator:TTaskDialogButtonsEnumerator;
begin
{*
 004DACE4    mov         ecx,eax
 004DACE6    mov         dl,1
 004DACE8    mov         eax,[004D5548];TTaskDialogButtonsEnumerator
 004DACED    call        TTaskDialogButtonsEnumerator.Create
 004DACF2    ret
*}
end;

//004DACF4
function TTaskDialogButtons.GetItem(Index:Integer):TTaskDialogBaseButtonItem;
begin
{*
 004DACF4    push        ebx
 004DACF5    push        esi
 004DACF6    mov         esi,edx
 004DACF8    mov         ebx,eax
 004DACFA    mov         edx,esi
 004DACFC    mov         eax,ebx
 004DACFE    call        TCollection.GetItem
 004DAD03    pop         esi
 004DAD04    pop         ebx
 004DAD05    ret
*}
end;

//004DAD08
procedure TTaskDialogButtons.SetDefaultButton(const Value:TTaskDialogBaseButtonItem);
begin
{*
 004DAD08    cmp         edx,dword ptr [eax+24]
>004DAD0B    je          004DAD10
 004DAD0D    mov         dword ptr [eax+24],edx
 004DAD10    ret
*}
end;

//004DAD14
procedure TTaskDialogButtons.SetInitialState;
begin
{*
 004DAD14    push        ebp
 004DAD15    mov         ebp,esp
 004DAD17    push        ecx
 004DAD18    push        ebx
 004DAD19    call        TTaskDialogButtons.GetEnumerator
 004DAD1E    mov         dword ptr [ebp-4],eax
 004DAD21    xor         eax,eax
 004DAD23    push        ebp
 004DAD24    push        4DAD6C
 004DAD29    push        dword ptr fs:[eax]
 004DAD2C    mov         dword ptr fs:[eax],esp
>004DAD2F    jmp         004DAD42
 004DAD31    mov         eax,dword ptr [ebp-4]
 004DAD34    call        TTaskDialogButtonsEnumerator.GetCurrent
 004DAD39    mov         ebx,eax
 004DAD3B    mov         eax,ebx
 004DAD3D    mov         edx,dword ptr [eax]
 004DAD3F    call        dword ptr [edx+2C]
 004DAD42    mov         eax,dword ptr [ebp-4]
 004DAD45    call        TTaskDialogButtonsEnumerator.MoveNext
 004DAD4A    test        al,al
>004DAD4C    jne         004DAD31
 004DAD4E    xor         eax,eax
 004DAD50    pop         edx
 004DAD51    pop         ecx
 004DAD52    pop         ecx
 004DAD53    mov         dword ptr fs:[eax],edx
 004DAD56    push        4DAD73
 004DAD5B    cmp         dword ptr [ebp-4],0
>004DAD5F    je          004DAD6B
 004DAD61    mov         dl,1
 004DAD63    mov         eax,dword ptr [ebp-4]
 004DAD66    mov         ecx,dword ptr [eax]
 004DAD68    call        dword ptr [ecx-4]
 004DAD6B    ret
>004DAD6C    jmp         @HandleFinally
>004DAD71    jmp         004DAD5B
 004DAD73    pop         ebx
 004DAD74    pop         ecx
 004DAD75    pop         ebp
 004DAD76    ret
*}
end;

//004DAD78
constructor TCustomTaskDialog.Create;
begin
{*
 004DAD78    push        ebx
 004DAD79    push        esi
 004DAD7A    test        dl,dl
>004DAD7C    je          004DAD86
 004DAD7E    add         esp,0FFFFFFF0
 004DAD81    call        @ClassCreate
 004DAD86    mov         ebx,edx
 004DAD88    mov         esi,eax
 004DAD8A    xor         edx,edx
 004DAD8C    mov         eax,esi
 004DAD8E    call        TComponent.Create
 004DAD93    mov         eax,[004D51B4];TTaskDialogButtonItem
 004DAD98    push        eax
 004DAD99    mov         ecx,esi
 004DAD9B    mov         dl,1
 004DAD9D    mov         eax,[004D56FC];TTaskDialogButtons
 004DADA2    call        TOwnedCollection.Create
 004DADA7    mov         dword ptr [esi+38],eax
 004DADAA    movzx       eax,byte ptr ds:[4DAE38]
 004DADB1    mov         byte ptr [esi+40],al
 004DADB4    mov         dl,1
 004DADB6    mov         eax,[00464454];TIcon
 004DADBB    call        TIcon.Create
 004DADC0    mov         dword ptr [esi+44],eax
 004DADC3    mov         dl,1
 004DADC5    mov         eax,[00464454];TIcon
 004DADCA    call        TIcon.Create
 004DADCF    mov         dword ptr [esi+48],eax
 004DADD2    mov         byte ptr [esi+4C],0
 004DADD6    movzx       eax,word ptr ds:[4DAE3C]
 004DADDD    mov         word ptr [esi+5C],ax
 004DADE1    xor         eax,eax
 004DADE3    mov         dword ptr [esi+60],eax
 004DADE6    xor         eax,eax
 004DADE8    mov         dword ptr [esi+68],eax
 004DADEB    mov         dword ptr [esi+70],3
 004DADF2    mov         ecx,esi
 004DADF4    mov         dl,1
 004DADF6    mov         eax,[004D4C3C];TTaskDialogProgressBar
 004DADFB    call        TTaskDialogProgressBar.Create
 004DAE00    mov         dword ptr [esi+78],eax
 004DAE03    mov         eax,[004D53E8];TTaskDialogRadioButtonItem
 004DAE08    push        eax
 004DAE09    mov         ecx,esi
 004DAE0B    mov         dl,1
 004DAE0D    mov         eax,[004D56FC];TTaskDialogButtons
 004DAE12    call        TOwnedCollection.Create
 004DAE17    mov         dword ptr [esi+80],eax
 004DAE1D    mov         eax,esi
 004DAE1F    test        bl,bl
>004DAE21    je          004DAE32
 004DAE23    call        @AfterConstruction
 004DAE28    pop         dword ptr fs:[0]
 004DAE2F    add         esp,0C
 004DAE32    mov         eax,esi
 004DAE34    pop         esi
 004DAE35    pop         ebx
 004DAE36    ret
*}
end;

//004DAE40
destructor TCustomTaskDialog.Destroy();
begin
{*
 004DAE40    push        ebx
 004DAE41    push        esi
 004DAE42    call        @BeforeDestruction
 004DAE47    mov         ebx,edx
 004DAE49    mov         esi,eax
 004DAE4B    mov         eax,dword ptr [esi+38]
 004DAE4E    call        TObject.Free
 004DAE53    mov         eax,dword ptr [esi+44]
 004DAE56    call        TObject.Free
 004DAE5B    mov         eax,dword ptr [esi+48]
 004DAE5E    call        TObject.Free
 004DAE63    mov         eax,dword ptr [esi+78]
 004DAE66    call        TObject.Free
 004DAE6B    mov         eax,dword ptr [esi+80]
 004DAE71    call        TObject.Free
 004DAE76    mov         edx,ebx
 004DAE78    and         dl,0FC
 004DAE7B    mov         eax,esi
 004DAE7D    call        TComponent.Destroy
 004DAE82    test        bl,bl
>004DAE84    jle         004DAE8D
 004DAE86    mov         eax,esi
 004DAE88    call        @ClassDestroy
 004DAE8D    pop         esi
 004DAE8E    pop         ebx
 004DAE8F    ret
*}
end;

//004DAE90
procedure TCustomTaskDialog.CallbackProc(hwnd:HWND; msg:UINT; wParam:WPARAM; lParam:LPARAM; lpRefData:LONG_PTR);
begin
{*
 004DAE90    push        ebp
 004DAE91    mov         ebp,esp
 004DAE93    add         esp,0FFFFFFF4
 004DAE96    push        ebx
 004DAE97    push        esi
 004DAE98    push        edi
 004DAE99    xor         ebx,ebx
 004DAE9B    mov         dword ptr [ebp-4],ebx
 004DAE9E    mov         edi,eax
 004DAEA0    xor         eax,eax
 004DAEA2    push        ebp
 004DAEA3    push        4DB015
 004DAEA8    push        dword ptr fs:[eax]
 004DAEAB    mov         dword ptr fs:[eax],esp
 004DAEAE    xor         eax,eax
 004DAEB0    mov         dword ptr [ebp-8],eax
 004DAEB3    cmp         ecx,0A
>004DAEB6    ja          004DAFFF
 004DAEBC    jmp         dword ptr [ecx*4+4DAEC3]
 004DAEBC    dd          004DAF1A
 004DAEBC    dd          004DAFAC
 004DAEBC    dd          004DAEEF
 004DAEBC    dd          004DAF91
 004DAEBC    dd          004DAFC9
 004DAEBC    dd          004DAF2A
 004DAEBC    dd          004DAFB9
 004DAEBC    dd          004DAF3A
 004DAEBC    dd          004DAFED
 004DAEBC    dd          004DAF84
 004DAEBC    dd          004DAF70
 004DAEEF    mov         byte ptr [ebp-9],1
 004DAEF3    lea         ecx,[ebp-9]
 004DAEF6    mov         edx,dword ptr [ebp+10]
 004DAEF9    mov         eax,edi
 004DAEFB    mov         si,0FFEF
 004DAEFF    call        @CallDynaInst
 004DAF04    cmp         byte ptr [ebp-9],0
>004DAF08    jne         004DAFFF
 004DAF0E    mov         dword ptr [ebp-8],1
>004DAF15    jmp         004DAFFF
 004DAF1A    mov         eax,edi
 004DAF1C    mov         si,0FFED
 004DAF20    call        @CallDynaInst
>004DAF25    jmp         004DAFFF
 004DAF2A    mov         eax,edi
 004DAF2C    mov         si,0FFEC
 004DAF30    call        @CallDynaInst
>004DAF35    jmp         004DAFFF
 004DAF3A    mov         dword ptr [edi+68],edx
 004DAF3D    mov         eax,dword ptr [edi+38]
 004DAF40    mov         si,0FFFA
 004DAF44    call        @CallDynaInst
 004DAF49    mov         eax,dword ptr [edi+80]
 004DAF4F    mov         si,0FFFA
 004DAF53    call        @CallDynaInst
 004DAF58    mov         eax,dword ptr [edi+78]
 004DAF5B    call        TTaskDialogProgressBar.Initialize
 004DAF60    mov         eax,edi
 004DAF62    mov         si,0FFEE
 004DAF66    call        @CallDynaInst
>004DAF6B    jmp         004DAFFF
 004DAF70    cmp         dword ptr [ebp+10],1
 004DAF74    sbb         edx,edx
 004DAF76    inc         edx
 004DAF77    mov         eax,edi
 004DAF79    mov         si,0FFEB
 004DAF7D    call        @CallDynaInst
>004DAF82    jmp         004DAFFF
 004DAF84    mov         eax,edi
 004DAF86    mov         si,0FFEA
 004DAF8A    call        @CallDynaInst
>004DAF8F    jmp         004DAFFF
 004DAF91    lea         eax,[ebp-4]
 004DAF94    mov         edx,dword ptr [ebp+0C]
 004DAF97    call        @UStrFromPWChar
 004DAF9C    mov         edx,dword ptr [ebp-4]
 004DAF9F    mov         eax,edi
 004DAFA1    mov         si,0FFE9
 004DAFA5    call        @CallDynaInst
>004DAFAA    jmp         004DAFFF
 004DAFAC    mov         eax,edi
 004DAFAE    mov         si,0FFE8
 004DAFB2    call        @CallDynaInst
>004DAFB7    jmp         004DAFFF
 004DAFB9    mov         edx,dword ptr [ebp+10]
 004DAFBC    mov         eax,edi
 004DAFBE    mov         si,0FFE7
 004DAFC2    call        @CallDynaInst
>004DAFC7    jmp         004DAFFF
 004DAFC9    mov         byte ptr [ebp-0A],0
 004DAFCD    lea         ecx,[ebp-0A]
 004DAFD0    mov         edx,dword ptr [ebp+10]
 004DAFD3    mov         eax,edi
 004DAFD5    mov         si,0FFE6
 004DAFD9    call        @CallDynaInst
 004DAFDE    cmp         byte ptr [ebp-0A],0
>004DAFE2    je          004DAFFF
 004DAFE4    mov         dword ptr [ebp-8],1
>004DAFEB    jmp         004DAFFF
 004DAFED    cmp         dword ptr [ebp+10],1
 004DAFF1    sete        dl
 004DAFF4    mov         eax,edi
 004DAFF6    mov         si,0FFE5
 004DAFFA    call        @CallDynaInst
 004DAFFF    xor         eax,eax
 004DB001    pop         edx
 004DB002    pop         ecx
 004DB003    pop         ecx
 004DB004    mov         dword ptr fs:[eax],edx
 004DB007    push        4DB01C
 004DB00C    lea         eax,[ebp-4]
 004DB00F    call        @UStrClr
 004DB014    ret
>004DB015    jmp         @HandleFinally
>004DB01A    jmp         004DB00C
 004DB01C    mov         eax,dword ptr [ebp-8]
 004DB01F    pop         edi
 004DB020    pop         esi
 004DB021    pop         ebx
 004DB022    mov         esp,ebp
 004DB024    pop         ebp
 004DB025    ret         0C
*}
end;

//004DB028
function TaskDialogCallbackProc(hwnd:HWND; msg:UINT; wParam:WPARAM; lParam:LPARAM; lpRefData:LONG_PTR):HRESULT; stdcall;
begin
{*
 004DB028    push        ebp
 004DB029    mov         ebp,esp
 004DB02B    push        esi
 004DB02C    mov         eax,dword ptr [ebp+10]
 004DB02F    push        eax
 004DB030    mov         eax,dword ptr [ebp+14]
 004DB033    push        eax
 004DB034    push        0
 004DB036    mov         ecx,dword ptr [ebp+0C]
 004DB039    mov         edx,dword ptr [ebp+8]
 004DB03C    mov         eax,dword ptr [ebp+18]
 004DB03F    mov         si,0FFE3
 004DB043    call        @CallDynaInst
 004DB048    pop         esi
 004DB049    pop         ebp
 004DB04A    ret         14
*}
end;

//004DB050
procedure TCustomTaskDialog.DoExecute(ParentWnd:HWND);
begin
{*
 004DB050    push        ebp
 004DB051    mov         ebp,esp
 004DB053    add         esp,0FFFFFF58
 004DB059    push        ebx
 004DB05A    push        esi
 004DB05B    push        edi
 004DB05C    xor         ecx,ecx
 004DB05E    mov         dword ptr [ebp-0A8],ecx
 004DB064    mov         dword ptr [ebp-0A4],ecx
 004DB06A    mov         dword ptr [ebp-0A0],ecx
 004DB070    mov         dword ptr [ebp-9C],ecx
 004DB076    mov         dword ptr [ebp-98],ecx
 004DB07C    mov         dword ptr [ebp-94],ecx
 004DB082    mov         dword ptr [ebp-90],ecx
 004DB088    mov         dword ptr [ebp-8C],ecx
 004DB08E    mov         dword ptr [ebp-88],ecx
 004DB094    mov         dword ptr [ebp-4],edx
 004DB097    mov         ebx,eax
 004DB099    lea         esi,[ebp-7C]
 004DB09C    xor         eax,eax
 004DB09E    push        ebp
 004DB09F    push        4DB45F
 004DB0A4    push        dword ptr fs:[eax]
 004DB0A7    mov         dword ptr fs:[eax],esp
 004DB0AA    mov         eax,[0078D080];^gvar_00784C80
 004DB0AF    cmp         dword ptr [eax],6
>004DB0B2    jge         004DB0F1
 004DB0B4    lea         edx,[ebp-88]
 004DB0BA    mov         eax,dword ptr [ebx]
 004DB0BC    call        TObject.ClassName
 004DB0C1    mov         eax,dword ptr [ebp-88]
 004DB0C7    mov         dword ptr [ebp-84],eax
 004DB0CD    mov         byte ptr [ebp-80],11
 004DB0D1    lea         eax,[ebp-84]
 004DB0D7    push        eax
 004DB0D8    push        0
 004DB0DA    mov         ecx,dword ptr ds:[78D36C];^SResString302:TResStringRec
 004DB0E0    mov         dl,1
 004DB0E2    mov         eax,[004D29EC];EPlatformVersionException
 004DB0E7    call        Exception.CreateResFmt
 004DB0EC    call        @RaiseExcept
 004DB0F1    call        ThemeServices
 004DB0F6    call        TThemeServices.GetThemesEnabled
 004DB0FB    test        al,al
>004DB0FD    jne         004DB13C
 004DB0FF    lea         edx,[ebp-8C]
 004DB105    mov         eax,dword ptr [ebx]
 004DB107    call        TObject.ClassName
 004DB10C    mov         eax,dword ptr [ebp-8C]
 004DB112    mov         dword ptr [ebp-84],eax
 004DB118    mov         byte ptr [ebp-80],11
 004DB11C    lea         eax,[ebp-84]
 004DB122    push        eax
 004DB123    push        0
 004DB125    mov         ecx,dword ptr ds:[78D368];^SResString303:TResStringRec
 004DB12B    mov         dl,1
 004DB12D    mov         eax,[00418C04];Exception
 004DB132    call        Exception.CreateResFmt
 004DB137    call        @RaiseExcept
 004DB13C    mov         eax,esi
 004DB13E    xor         ecx,ecx
 004DB140    mov         edx,60
 004DB145    call        @FillChar
 004DB14A    mov         dword ptr [esi],60
 004DB150    mov         eax,dword ptr [ebp-4]
 004DB153    mov         dword ptr [esi+4],eax
 004DB156    xor         eax,eax
 004DB158    mov         dword ptr [esi+0C],eax
 004DB15B    xor         eax,eax
 004DB15D    mov         edi,786584
 004DB162    mov         edx,eax
 004DB164    cmp         dl,0F
>004DB167    ja          004DB171
 004DB169    and         edx,7F
 004DB16C    bt          word ptr [ebx+5C],dx
>004DB171    jae         004DB178
 004DB173    mov         edx,dword ptr [edi]
 004DB175    or          dword ptr [esi+0C],edx
 004DB178    inc         eax
 004DB179    add         edi,4
 004DB17C    cmp         al,10
>004DB17E    jne         004DB162
 004DB180    xor         eax,eax
 004DB182    mov         dword ptr [esi+10],eax
 004DB185    xor         eax,eax
 004DB187    mov         edi,7865C4
 004DB18C    mov         edx,eax
 004DB18E    cmp         dl,7
>004DB191    ja          004DB19D
 004DB193    and         edx,7F
 004DB196    movzx       ecx,byte ptr [ebx+40]
 004DB19A    bt          ecx,edx
>004DB19D    jae         004DB1A4
 004DB19F    mov         edx,dword ptr [edi]
 004DB1A1    or          dword ptr [esi+10],edx
 004DB1A4    inc         eax
 004DB1A5    add         edi,4
 004DB1A8    cmp         al,6
>004DB1AA    jne         004DB18C
 004DB1AC    cmp         dword ptr [ebx+84],0
>004DB1B3    je          004DB1D4
 004DB1B5    lea         eax,[ebp-90]
 004DB1BB    mov         edx,dword ptr [ebx+84]
 004DB1C1    call        @WStrFromUStr
 004DB1C6    mov         eax,dword ptr [ebp-90]
 004DB1CC    call        @WStrToPWChar
 004DB1D1    mov         dword ptr [esi+20],eax
 004DB1D4    cmp         dword ptr [ebx+88],0
>004DB1DB    je          004DB1FC
 004DB1DD    lea         eax,[ebp-94]
 004DB1E3    mov         edx,dword ptr [ebx+88]
 004DB1E9    call        @WStrFromUStr
 004DB1EE    mov         eax,dword ptr [ebp-94]
 004DB1F4    call        @WStrToPWChar
 004DB1F9    mov         dword ptr [esi+1C],eax
 004DB1FC    cmp         dword ptr [ebx+3C],0
>004DB200    je          004DB21E
 004DB202    lea         eax,[ebp-98]
 004DB208    mov         edx,dword ptr [ebx+3C]
 004DB20B    call        @WStrFromUStr
 004DB210    mov         eax,dword ptr [ebp-98]
 004DB216    call        @WStrToPWChar
 004DB21B    mov         dword ptr [esi+14],eax
 004DB21E    test        byte ptr [ebx+5C],2
>004DB222    je          004DB231
 004DB224    mov         eax,dword ptr [ebx+48]
 004DB227    call        TIcon.GetHandle
 004DB22C    mov         dword ptr [esi+18],eax
>004DB22F    jmp         004DB24E
 004DB231    mov         eax,dword ptr [ebx+70]
 004DB234    mov         edx,eax
 004DB236    sub         edx,5
>004DB239    jae         004DB247
 004DB23B    mov         eax,dword ptr [eax*4+786570]
 004DB242    mov         dword ptr [esi+18],eax
>004DB245    jmp         004DB24E
 004DB247    movzx       eax,word ptr [ebx+70]
 004DB24B    mov         dword ptr [esi+18],eax
 004DB24E    movzx       eax,byte ptr [ebx+4C]
 004DB252    mov         eax,dword ptr [eax*4+7865DC]
 004DB259    mov         dword ptr [esi+2C],eax
 004DB25C    cmp         dword ptr [ebx+64],0
>004DB260    je          004DB27E
 004DB262    lea         eax,[ebp-9C]
 004DB268    mov         edx,dword ptr [ebx+64]
 004DB26B    call        @WStrFromUStr
 004DB270    mov         eax,dword ptr [ebp-9C]
 004DB276    call        @WStrToPWChar
 004DB27B    mov         dword ptr [esi+50],eax
 004DB27E    test        byte ptr [ebx+5C],4
>004DB282    je          004DB291
 004DB284    mov         eax,dword ptr [ebx+44]
 004DB287    call        TIcon.GetHandle
 004DB28C    mov         dword ptr [esi+4C],eax
>004DB28F    jmp         004DB2AE
 004DB291    mov         eax,dword ptr [ebx+60]
 004DB294    mov         edx,eax
 004DB296    sub         edx,5
>004DB299    jae         004DB2A7
 004DB29B    mov         eax,dword ptr [eax*4+786570]
 004DB2A2    mov         dword ptr [esi+4C],eax
>004DB2A5    jmp         004DB2AE
 004DB2A7    movzx       eax,word ptr [ebx+60]
 004DB2AB    mov         dword ptr [esi+4C],eax
 004DB2AE    cmp         dword ptr [ebx+90],0
>004DB2B5    je          004DB2D6
 004DB2B7    lea         eax,[ebp-0A0]
 004DB2BD    mov         edx,dword ptr [ebx+90]
 004DB2C3    call        @WStrFromUStr
 004DB2C8    mov         eax,dword ptr [ebp-0A0]
 004DB2CE    call        @WStrToPWChar
 004DB2D3    mov         dword ptr [esi+3C],eax
 004DB2D6    cmp         dword ptr [ebx+58],0
>004DB2DA    je          004DB2F8
 004DB2DC    lea         eax,[ebp-0A4]
 004DB2E2    mov         edx,dword ptr [ebx+58]
 004DB2E5    call        @WStrFromUStr
 004DB2EA    mov         eax,dword ptr [ebp-0A4]
 004DB2F0    call        @WStrToPWChar
 004DB2F5    mov         dword ptr [esi+40],eax
 004DB2F8    cmp         dword ptr [ebx+50],0
>004DB2FC    je          004DB31A
 004DB2FE    lea         eax,[ebp-0A8]
 004DB304    mov         edx,dword ptr [ebx+50]
 004DB307    call        @WStrFromUStr
 004DB30C    mov         eax,dword ptr [ebp-0A8]
 004DB312    call        @WStrToPWChar
 004DB317    mov         dword ptr [esi+48],eax
 004DB31A    mov         edi,dword ptr [ebx+38]
 004DB31D    mov         eax,dword ptr [edi+8]
 004DB320    mov         eax,dword ptr [eax+8]
 004DB323    mov         dword ptr [esi+24],eax
 004DB326    test        eax,eax
>004DB328    jbe         004DB334
 004DB32A    mov         eax,edi
 004DB32C    call        TTaskDialogButtons.Buttons
 004DB331    mov         dword ptr [esi+28],eax
 004DB334    mov         eax,dword ptr [ebx+38]
 004DB337    mov         eax,dword ptr [eax+24]
 004DB33A    test        eax,eax
>004DB33C    je          004DB344
 004DB33E    mov         eax,dword ptr [eax+18]
 004DB341    mov         dword ptr [esi+2C],eax
 004DB344    mov         edi,dword ptr [ebx+80]
 004DB34A    mov         eax,dword ptr [edi+8]
 004DB34D    mov         eax,dword ptr [eax+8]
 004DB350    mov         dword ptr [esi+30],eax
 004DB353    test        eax,eax
>004DB355    jbe         004DB361
 004DB357    mov         eax,edi
 004DB359    call        TTaskDialogButtons.Buttons
 004DB35E    mov         dword ptr [esi+34],eax
 004DB361    test        byte ptr [ebx+5D],40
>004DB365    jne         004DB382
 004DB367    mov         eax,dword ptr [ebx+80]
 004DB36D    cmp         dword ptr [eax+24],0
>004DB371    je          004DB382
 004DB373    mov         eax,dword ptr [ebx+80]
 004DB379    mov         eax,dword ptr [eax+24]
 004DB37C    mov         eax,dword ptr [eax+18]
 004DB37F    mov         dword ptr [esi+38],eax
 004DB382    mov         dword ptr [esi+58],ebx
 004DB385    mov         eax,4DB028;TaskDialogCallbackProc:HRESULT
 004DB38A    mov         dword ptr [esi+54],eax
 004DB38D    mov         eax,dword ptr [ebp-4]
 004DB390    call        DisableTaskWindows
 004DB395    mov         dword ptr [ebp-0C],eax
 004DB398    call        SaveFocusState
 004DB39D    mov         dword ptr [ebp-18],eax
 004DB3A0    xor         eax,eax
 004DB3A2    push        ebp
 004DB3A3    push        4DB42A
 004DB3A8    push        dword ptr fs:[eax]
 004DB3AB    mov         dword ptr fs:[eax],esp
 004DB3AE    lea         eax,[ebp-1C]
 004DB3B1    push        eax
 004DB3B2    lea         ecx,[ebp-14]
 004DB3B5    lea         edx,[ebp-10]
 004DB3B8    mov         eax,esi
 004DB3BA    call        TaskDialogIndirect
 004DB3BF    test        eax,eax
 004DB3C1    sete        byte ptr [ebp-5]
 004DB3C5    mov         esi,dword ptr [ebp-10]
 004DB3C8    mov         dword ptr [ebx+74],esi
 004DB3CB    cmp         byte ptr [ebp-5],0
>004DB3CF    je          004DB403
 004DB3D1    mov         edx,esi
 004DB3D3    mov         eax,dword ptr [ebx+38]
 004DB3D6    call        TTaskDialogButtons.FindButton
 004DB3DB    mov         dword ptr [ebx+34],eax
 004DB3DE    mov         eax,dword ptr [ebx+80]
 004DB3E4    mov         edx,dword ptr [ebp-14]
 004DB3E7    call        TTaskDialogButtons.FindButton
 004DB3EC    mov         dword ptr [ebx+7C],eax
 004DB3EF    cmp         dword ptr [ebp-1C],0
>004DB3F3    je          004DB3FD
 004DB3F5    or          word ptr [ebx+5C],100
>004DB3FB    jmp         004DB403
 004DB3FD    and         word ptr [ebx+5C],0FEFF
 004DB403    xor         eax,eax
 004DB405    pop         edx
 004DB406    pop         ecx
 004DB407    pop         ecx
 004DB408    mov         dword ptr fs:[eax],edx
 004DB40B    push        4DB431
 004DB410    mov         eax,dword ptr [ebp-0C]
 004DB413    call        EnableTaskWindows
 004DB418    mov         eax,dword ptr [ebp-4]
 004DB41B    push        eax
 004DB41C    call        user32.SetActiveWindow
 004DB421    mov         eax,dword ptr [ebp-18]
 004DB424    call        RestoreFocusState
 004DB429    ret
>004DB42A    jmp         @HandleFinally
>004DB42F    jmp         004DB410
 004DB431    xor         eax,eax
 004DB433    pop         edx
 004DB434    pop         ecx
 004DB435    pop         ecx
 004DB436    mov         dword ptr fs:[eax],edx
 004DB439    push        4DB466
 004DB43E    lea         eax,[ebp-0A8]
 004DB444    mov         edx,7
 004DB449    call        @WStrArrayClr
 004DB44E    lea         eax,[ebp-8C]
 004DB454    mov         edx,2
 004DB459    call        @UStrArrayClr
 004DB45E    ret
>004DB45F    jmp         @HandleFinally
>004DB464    jmp         004DB43E
 004DB466    movzx       eax,byte ptr [ebp-5]
 004DB46A    pop         edi
 004DB46B    pop         esi
 004DB46C    pop         ebx
 004DB46D    mov         esp,ebp
 004DB46F    pop         ebp
 004DB470    ret
*}
end;

//004DB474
procedure TCustomTaskDialog.DoOnButtonClicked(AModalResult:Integer; var CanClose:Boolean);
begin
{*
 004DB474    push        ebx
 004DB475    push        esi
 004DB476    push        edi
 004DB477    mov         edi,ecx
 004DB479    mov         esi,edx
 004DB47B    mov         ebx,eax
 004DB47D    cmp         word ptr [ebx+9A],0
>004DB485    je          004DB4A5
 004DB487    mov         edx,esi
 004DB489    mov         eax,dword ptr [ebx+38]
 004DB48C    call        TTaskDialogButtons.FindButton
 004DB491    mov         dword ptr [ebx+34],eax
 004DB494    push        edi
 004DB495    mov         ecx,esi
 004DB497    mov         edx,ebx
 004DB499    mov         eax,dword ptr [ebx+9C]
 004DB49F    call        dword ptr [ebx+98]
 004DB4A5    pop         edi
 004DB4A6    pop         esi
 004DB4A7    pop         ebx
 004DB4A8    ret
*}
end;

//004DB4AC
procedure TOpenDialog.DoTypeChange;
begin
{*
 004DB4AC    push        ebx
 004DB4AD    cmp         word ptr [eax+0AA],0
>004DB4B5    je          004DB4C7
 004DB4B7    mov         ebx,eax
 004DB4B9    mov         edx,eax
 004DB4BB    mov         eax,dword ptr [ebx+0AC]
 004DB4C1    call        dword ptr [ebx+0A8]
 004DB4C7    pop         ebx
 004DB4C8    ret
*}
end;

//004DB4CC
procedure TCustomTaskDialog.DoOnDialogDestroyed;
begin
{*
 004DB4CC    push        ebx
 004DB4CD    cmp         word ptr [eax+0B2],0
>004DB4D5    je          004DB4E7
 004DB4D7    mov         ebx,eax
 004DB4D9    mov         edx,eax
 004DB4DB    mov         eax,dword ptr [ebx+0B4]
 004DB4E1    call        dword ptr [ebx+0B0]
 004DB4E7    pop         ebx
 004DB4E8    ret
*}
end;

//004DB4EC
procedure TOpenDialog.DoFolderChange;
begin
{*
 004DB4EC    push        ebx
 004DB4ED    cmp         word ptr [eax+0A2],0
>004DB4F5    je          004DB507
 004DB4F7    mov         ebx,eax
 004DB4F9    mov         edx,eax
 004DB4FB    mov         eax,dword ptr [ebx+0A4]
 004DB501    call        dword ptr [ebx+0A0]
 004DB507    pop         ebx
 004DB508    ret
*}
end;

//004DB50C
procedure TCustomTaskDialog.DoOnExpandButtonClicked(Expanded:Boolean);
begin
{*
 004DB50C    push        ebx
 004DB50D    cmp         word ptr [eax+0BA],0
>004DB515    je          004DB52A
 004DB517    mov         byte ptr [eax+54],dl
 004DB51A    mov         ebx,eax
 004DB51C    mov         edx,eax
 004DB51E    mov         eax,dword ptr [ebx+0BC]
 004DB524    call        dword ptr [ebx+0B8]
 004DB52A    pop         ebx
 004DB52B    ret
*}
end;

//004DB52C
procedure TCustomTaskDialog.DoOnHelp;
begin
{*
 004DB52C    push        ebp
 004DB52D    mov         ebp,esp
 004DB52F    push        ecx
 004DB530    push        ebx
 004DB531    push        esi
 004DB532    push        edi
 004DB533    mov         dword ptr [ebp-4],eax
 004DB536    mov         eax,dword ptr [ebp-4]
 004DB539    mov         eax,dword ptr [eax+6C]
 004DB53C    test        eax,eax
>004DB53E    je          004DB58C
 004DB540    xor         edx,edx
 004DB542    push        ebp
 004DB543    push        4DB566
 004DB548    push        dword ptr fs:[edx]
 004DB54B    mov         dword ptr fs:[edx],esp
 004DB54E    mov         edx,eax
 004DB550    mov         eax,[0078D590];^Application:TApplication
 004DB555    mov         eax,dword ptr [eax]
 004DB557    call        TApplication.HelpContext
 004DB55C    xor         eax,eax
 004DB55E    pop         edx
 004DB55F    pop         ecx
 004DB560    pop         ecx
 004DB561    mov         dword ptr fs:[eax],edx
>004DB564    jmp         004DB58C
>004DB566    jmp         @HandleOnException
 004DB56B    dd          1
 004DB56F    dd          00418C04;Exception
 004DB573    dd          004DB577
 004DB577    mov         esi,eax
 004DB579    mov         edx,esi
 004DB57B    mov         eax,dword ptr [ebp-4]
 004DB57E    mov         si,0FFE4
 004DB582    call        @CallDynaInst
 004DB587    call        @DoneExcept
 004DB58C    pop         edi
 004DB58D    pop         esi
 004DB58E    pop         ebx
 004DB58F    pop         ecx
 004DB590    pop         ebp
 004DB591    ret
*}
end;

//004DB594
procedure TCustomTaskDialog.DoOnHyperlinkClicked(const AURL:UnicodeString);
begin
{*
 004DB594    push        ebx
 004DB595    push        esi
 004DB596    mov         esi,edx
 004DB598    mov         ebx,eax
 004DB59A    cmp         word ptr [ebx+0C2],0
>004DB5A2    je          004DB5BF
 004DB5A4    lea         eax,[ebx+8C]
 004DB5AA    mov         edx,esi
 004DB5AC    call        @UStrAsg
 004DB5B1    mov         edx,ebx
 004DB5B3    mov         eax,dword ptr [ebx+0C4]
 004DB5B9    call        dword ptr [ebx+0C0]
 004DB5BF    pop         esi
 004DB5C0    pop         ebx
 004DB5C1    ret
*}
end;

//004DB5C4
procedure TCustomTaskDialog.DoOnNavigated;
begin
{*
 004DB5C4    push        ebx
 004DB5C5    cmp         word ptr [eax+0CA],0
>004DB5CD    je          004DB5DF
 004DB5CF    mov         ebx,eax
 004DB5D1    mov         edx,eax
 004DB5D3    mov         eax,dword ptr [ebx+0CC]
 004DB5D9    call        dword ptr [ebx+0C8]
 004DB5DF    pop         ebx
 004DB5E0    ret
*}
end;

//004DB5E4
procedure TCustomTaskDialog.DoOnRadioButtonClicked(ButtonID:Integer);
begin
{*
 004DB5E4    push        ebx
 004DB5E5    push        esi
 004DB5E6    mov         esi,edx
 004DB5E8    mov         ebx,eax
 004DB5EA    cmp         word ptr [ebx+0D2],0
>004DB5F2    je          004DB612
 004DB5F4    mov         edx,esi
 004DB5F6    mov         eax,dword ptr [ebx+80]
 004DB5FC    call        TTaskDialogButtons.FindButton
 004DB601    mov         dword ptr [ebx+7C],eax
 004DB604    mov         edx,ebx
 004DB606    mov         eax,dword ptr [ebx+0D4]
 004DB60C    call        dword ptr [ebx+0D0]
 004DB612    pop         esi
 004DB613    pop         ebx
 004DB614    ret
*}
end;

//004DB618
procedure TCustomTaskDialog.DoOnTimer(TickCount:Cardinal; var Reset:Boolean);
begin
{*
 004DB618    push        ebx
 004DB619    cmp         word ptr [eax+0DA],0
>004DB621    je          004DB636
 004DB623    push        ecx
 004DB624    mov         ebx,eax
 004DB626    mov         ecx,edx
 004DB628    mov         edx,eax
 004DB62A    mov         eax,dword ptr [ebx+0DC]
 004DB630    call        dword ptr [ebx+0D8]
 004DB636    pop         ebx
 004DB637    ret
*}
end;

//004DB638
procedure TCustomTaskDialog.DoOnVerificationClicked(Checked:Boolean);
begin
{*
 004DB638    push        ebx
 004DB639    mov         ebx,eax
 004DB63B    cmp         word ptr [ebx+0E2],0
>004DB643    je          004DB665
 004DB645    test        dl,dl
>004DB647    je          004DB651
 004DB649    or          word ptr [ebx+5C],100
>004DB64F    jmp         004DB657
 004DB651    and         word ptr [ebx+5C],0FEFF
 004DB657    mov         edx,ebx
 004DB659    mov         eax,dword ptr [ebx+0E4]
 004DB65F    call        dword ptr [ebx+0E0]
 004DB665    pop         ebx
 004DB666    ret
*}
end;

//004DB668
procedure TCustomTaskDialog.Execute;
begin
{*
 004DB668    push        esi
 004DB669    push        edi
 004DB66A    mov         edi,eax
 004DB66C    mov         eax,[0078DB00];^Screen:TScreen
 004DB671    mov         eax,dword ptr [eax]
 004DB673    mov         eax,dword ptr [eax+68]
 004DB676    test        eax,eax
>004DB678    je          004DB689
 004DB67A    mov         edx,dword ptr ds:[78DB00];^Screen:TScreen
 004DB680    call        TWinControl.GetHandle
 004DB685    mov         esi,eax
>004DB687    jmp         004DB6A8
 004DB689    mov         eax,[0078D590];^Application:TApplication
 004DB68E    mov         eax,dword ptr [eax]
 004DB690    call        TApplication.GetActiveFormHandle
 004DB695    mov         esi,eax
 004DB697    test        esi,esi
>004DB699    jne         004DB6A8
 004DB69B    mov         eax,[0078D590];^Application:TApplication
 004DB6A0    mov         eax,dword ptr [eax]
 004DB6A2    mov         esi,dword ptr [eax+170]
 004DB6A8    mov         edx,esi
 004DB6AA    mov         eax,edi
 004DB6AC    mov         si,0FFE1
 004DB6B0    call        @CallDynaInst
 004DB6B5    pop         edi
 004DB6B6    pop         esi
 004DB6B7    ret
*}
end;

//004DB6B8
procedure TCustomTaskDialog.Execute(ParentWnd:HWND);
begin
{*
 004DB6B8    push        esi
 004DB6B9    mov         esi,eax
 004DB6BB    xor         eax,eax
 004DB6BD    mov         dword ptr [esi+74],eax
 004DB6C0    mov         eax,esi
 004DB6C2    mov         si,0FFF0
 004DB6C6    call        @CallDynaInst
 004DB6CB    pop         esi
 004DB6CC    ret
*}
end;

//004DB6D0
procedure TCustomTaskDialog.SetButtons(const Value:TTaskDialogButtons);
begin
{*
 004DB6D0    push        esi
 004DB6D1    push        edi
 004DB6D2    mov         esi,eax
 004DB6D4    mov         edi,dword ptr [esi+38]
 004DB6D7    cmp         edx,edi
>004DB6D9    je          004DB6E2
 004DB6DB    mov         eax,edi
 004DB6DD    mov         ecx,dword ptr [eax]
 004DB6DF    call        dword ptr [ecx+8]
 004DB6E2    pop         edi
 004DB6E3    pop         esi
 004DB6E4    ret
*}
end;

//004DB6E8
procedure TCustomTaskDialog.SetCustomFooterIcon(const Value:TIcon);
begin
{*
 004DB6E8    push        esi
 004DB6E9    mov         esi,dword ptr [eax+44]
 004DB6EC    cmp         edx,esi
>004DB6EE    je          004DB6F7
 004DB6F0    mov         eax,esi
 004DB6F2    mov         ecx,dword ptr [eax]
 004DB6F4    call        dword ptr [ecx+8]
 004DB6F7    pop         esi
 004DB6F8    ret
*}
end;

//004DB6FC
procedure TCustomTaskDialog.SetCustomMainIcon(const Value:TIcon);
begin
{*
 004DB6FC    push        esi
 004DB6FD    mov         esi,dword ptr [eax+48]
 004DB700    cmp         edx,esi
>004DB702    je          004DB70B
 004DB704    mov         eax,esi
 004DB706    mov         ecx,dword ptr [eax]
 004DB708    call        dword ptr [ecx+8]
 004DB70B    pop         esi
 004DB70C    ret
*}
end;

//004DB710
procedure TCustomTaskDialog.SetExpandedText(const Value:UnicodeString);
begin
{*
 004DB710    push        ebx
 004DB711    push        esi
 004DB712    mov         esi,edx
 004DB714    mov         ebx,eax
 004DB716    mov         eax,esi
 004DB718    mov         edx,dword ptr [ebx+58]
 004DB71B    call        @UStrEqual
>004DB720    je          004DB746
 004DB722    lea         eax,[ebx+58]
 004DB725    mov         edx,esi
 004DB727    call        @UStrAsg
 004DB72C    mov         eax,dword ptr [ebx+68]
 004DB72F    test        eax,eax
>004DB731    je          004DB746
 004DB733    mov         edx,dword ptr [ebx+58]
 004DB736    push        edx
 004DB737    mov         ecx,1
 004DB73C    mov         edx,472
 004DB741    call        SendTextMessage
 004DB746    pop         esi
 004DB747    pop         ebx
 004DB748    ret
*}
end;

//004DB74C
procedure TCustomTaskDialog.SetFlags(const Value:TTaskDialogFlags);
begin
{*
 004DB74C    push        esi
 004DB74D    push        ecx
 004DB74E    mov         word ptr [esp],dx
 004DB752    mov         esi,eax
 004DB754    movzx       eax,word ptr [esi+5C]
 004DB758    cmp         ax,word ptr [esp]
>004DB75C    je          004DB7A5
 004DB75E    test        byte ptr [esi+5D],1
 004DB762    setne       dl
 004DB765    test        byte ptr [esp+1],1
 004DB76A    setne       al
 004DB76D    test        al,al
>004DB76F    je          004DB777
 004DB771    cmp         dword ptr [esi+68],0
>004DB775    jne         004DB77B
 004DB777    xor         ecx,ecx
>004DB779    jmp         004DB77D
 004DB77B    mov         cl,1
 004DB77D    cmp         dl,cl
>004DB77F    je          004DB79D
 004DB781    push        0
 004DB783    test        byte ptr [esp+5],1
 004DB788    setne       dl
 004DB78B    and         eax,7F
 004DB78E    push        eax
 004DB78F    push        471
 004DB794    mov         eax,dword ptr [esi+68]
 004DB797    push        eax
 004DB798    call        user32.SendMessageW
 004DB79D    movzx       eax,word ptr [esp]
 004DB7A1    mov         word ptr [esi+5C],ax
 004DB7A5    pop         edx
 004DB7A6    pop         esi
 004DB7A7    ret
*}
end;

//004DB7A8
procedure TCustomTaskDialog.SetFooterIcon(const Value:TTaskDialogIcon);
begin
{*
 004DB7A8    cmp         edx,dword ptr [eax+60]
>004DB7AB    je          004DB7CE
 004DB7AD    mov         ecx,edx
 004DB7AF    mov         dword ptr [eax+60],ecx
 004DB7B2    mov         edx,dword ptr [eax+68]
 004DB7B5    test        edx,edx
>004DB7B7    je          004DB7CE
 004DB7B9    mov         ecx,dword ptr [ecx*4+786570]
 004DB7C0    push        ecx
 004DB7C1    push        1
 004DB7C3    push        474
 004DB7C8    push        edx
 004DB7C9    call        user32.SendMessageW
 004DB7CE    ret
*}
end;

//004DB7D0
procedure TCustomTaskDialog.SetFooterText(const Value:UnicodeString);
begin
{*
 004DB7D0    push        ebx
 004DB7D1    push        esi
 004DB7D2    mov         esi,edx
 004DB7D4    mov         ebx,eax
 004DB7D6    mov         eax,esi
 004DB7D8    mov         edx,dword ptr [ebx+64]
 004DB7DB    call        @UStrEqual
>004DB7E0    je          004DB806
 004DB7E2    lea         eax,[ebx+64]
 004DB7E5    mov         edx,esi
 004DB7E7    call        @UStrAsg
 004DB7EC    mov         eax,dword ptr [ebx+68]
 004DB7EF    test        eax,eax
>004DB7F1    je          004DB806
 004DB7F3    mov         edx,dword ptr [ebx+64]
 004DB7F6    push        edx
 004DB7F7    mov         ecx,2
 004DB7FC    mov         edx,472
 004DB801    call        SendTextMessage
 004DB806    pop         esi
 004DB807    pop         ebx
 004DB808    ret
*}
end;

//004DB80C
procedure TCustomTaskDialog.SetMainIcon(const Value:TTaskDialogIcon);
begin
{*
 004DB80C    cmp         edx,dword ptr [eax+70]
>004DB80F    je          004DB832
 004DB811    mov         ecx,edx
 004DB813    mov         dword ptr [eax+70],ecx
 004DB816    mov         edx,dword ptr [eax+68]
 004DB819    test        edx,edx
>004DB81B    je          004DB832
 004DB81D    mov         ecx,dword ptr [ecx*4+786570]
 004DB824    push        ecx
 004DB825    push        0
 004DB827    push        474
 004DB82C    push        edx
 004DB82D    call        user32.SendMessageW
 004DB832    ret
*}
end;

//004DB834
procedure TCustomTaskDialog.SetRadioButtons(const Value:TTaskDialogButtons);
begin
{*
 004DB834    push        esi
 004DB835    push        edi
 004DB836    mov         esi,eax
 004DB838    mov         edi,dword ptr [esi+80]
 004DB83E    cmp         edx,edi
>004DB840    je          004DB849
 004DB842    mov         eax,edi
 004DB844    mov         ecx,dword ptr [eax]
 004DB846    call        dword ptr [ecx+8]
 004DB849    pop         edi
 004DB84A    pop         esi
 004DB84B    ret
*}
end;

//004DB84C
procedure TCustomTaskDialog.SetText(const Value:UnicodeString);
begin
{*
 004DB84C    push        ebx
 004DB84D    push        esi
 004DB84E    mov         esi,edx
 004DB850    mov         ebx,eax
 004DB852    mov         eax,esi
 004DB854    mov         edx,dword ptr [ebx+84]
 004DB85A    call        @UStrEqual
>004DB85F    je          004DB888
 004DB861    lea         eax,[ebx+84]
 004DB867    mov         edx,esi
 004DB869    call        @UStrAsg
 004DB86E    mov         eax,dword ptr [ebx+68]
 004DB871    test        eax,eax
>004DB873    je          004DB888
 004DB875    mov         edx,dword ptr [ebx+84]
 004DB87B    push        edx
 004DB87C    xor         ecx,ecx
 004DB87E    mov         edx,472
 004DB883    call        SendTextMessage
 004DB888    pop         esi
 004DB889    pop         ebx
 004DB88A    ret
*}
end;

//004DB88C
procedure TCustomTaskDialog.SetTitle(const Value:UnicodeString);
begin
{*
 004DB88C    push        ebx
 004DB88D    push        esi
 004DB88E    mov         esi,edx
 004DB890    mov         ebx,eax
 004DB892    mov         eax,esi
 004DB894    mov         edx,dword ptr [ebx+88]
 004DB89A    call        @UStrEqual
>004DB89F    je          004DB8CB
 004DB8A1    lea         eax,[ebx+88]
 004DB8A7    mov         edx,esi
 004DB8A9    call        @UStrAsg
 004DB8AE    mov         eax,dword ptr [ebx+68]
 004DB8B1    test        eax,eax
>004DB8B3    je          004DB8CB
 004DB8B5    mov         edx,dword ptr [ebx+88]
 004DB8BB    push        edx
 004DB8BC    mov         ecx,3
 004DB8C1    mov         edx,472
 004DB8C6    call        SendTextMessage
 004DB8CB    pop         esi
 004DB8CC    pop         ebx
 004DB8CD    ret
*}
end;

//004DB8D0
procedure TCustomTaskDialog.ShowHelpException(E:Exception);
begin
{*
 004DB8D0    push        ebp
 004DB8D1    mov         ebp,esp
 004DB8D3    push        0
 004DB8D5    push        0
 004DB8D7    push        0
 004DB8D9    push        ebx
 004DB8DA    push        esi
 004DB8DB    push        edi
 004DB8DC    mov         ebx,edx
 004DB8DE    mov         dword ptr [ebp-8],eax
 004DB8E1    xor         eax,eax
 004DB8E3    push        ebp
 004DB8E4    push        4DB9AD
 004DB8E9    push        dword ptr fs:[eax]
 004DB8EC    mov         dword ptr fs:[eax],esp
 004DB8EF    mov         edi,10
 004DB8F4    mov         eax,[0078D590];^Application:TApplication
 004DB8F9    mov         eax,dword ptr [eax]
 004DB8FB    call        TApplication.UseRightToLeftReading
 004DB900    test        al,al
>004DB902    je          004DB90A
 004DB904    or          edi,100000
 004DB90A    lea         eax,[ebp-4]
 004DB90D    mov         edx,dword ptr [ebx+4]
 004DB910    call        @UStrLAsg
 004DB915    mov         eax,ebx
 004DB917    mov         edx,dword ptr [eax]
 004DB919    call        dword ptr [edx+4]
 004DB91C    mov         esi,eax
 004DB91E    cmp         ebx,esi
>004DB920    je          004DB937
 004DB922    mov         ebx,esi
 004DB924    cmp         dword ptr [ebx+4],0
>004DB928    je          004DB915
 004DB92A    lea         eax,[ebp-4]
 004DB92D    mov         edx,dword ptr [ebx+4]
 004DB930    call        @UStrLAsg
>004DB935    jmp         004DB915
 004DB937    cmp         dword ptr [ebp-4],0
>004DB93B    je          004DB961
 004DB93D    mov         eax,dword ptr [ebp-4]
 004DB940    test        eax,eax
>004DB942    je          004DB949
 004DB944    sub         eax,4
 004DB947    mov         eax,dword ptr [eax]
 004DB949    mov         edx,dword ptr [ebp-4]
 004DB94C    cmp         word ptr [edx+eax*2-2],2E
>004DB952    jbe         004DB961
 004DB954    lea         eax,[ebp-4]
 004DB957    mov         edx,4DB9C8;'.'
 004DB95C    call        @UStrCat
 004DB961    push        edi
 004DB962    lea         edx,[ebp-0C]
 004DB965    mov         eax,[0078D590];^Application:TApplication
 004DB96A    mov         eax,dword ptr [eax]
 004DB96C    call        TApplication.GetTitle
 004DB971    mov         eax,dword ptr [ebp-0C]
 004DB974    call        @UStrToPWChar
 004DB979    push        eax
 004DB97A    mov         eax,dword ptr [ebp-4]
 004DB97D    call        @UStrToPWChar
 004DB982    push        eax
 004DB983    mov         eax,dword ptr [ebp-8]
 004DB986    mov         eax,dword ptr [eax+68]
 004DB989    push        eax
 004DB98A    call        user32.MessageBoxW
 004DB98F    xor         eax,eax
 004DB991    pop         edx
 004DB992    pop         ecx
 004DB993    pop         ecx
 004DB994    mov         dword ptr fs:[eax],edx
 004DB997    push        4DB9B4
 004DB99C    lea         eax,[ebp-0C]
 004DB99F    call        @UStrClr
 004DB9A4    lea         eax,[ebp-4]
 004DB9A7    call        @UStrClr
 004DB9AC    ret
>004DB9AD    jmp         @HandleFinally
>004DB9B2    jmp         004DB99C
 004DB9B4    pop         edi
 004DB9B5    pop         esi
 004DB9B6    pop         ebx
 004DB9B7    mov         esp,ebp
 004DB9B9    pop         ebp
 004DB9BA    ret
*}
end;

//004DB9CC
function GetAveCharSize(Canvas:TCanvas):TPoint;
begin
{*
 004DB9CC    push        ebx
 004DB9CD    push        esi
 004DB9CE    add         esp,0FFFFFF98
 004DB9D1    mov         ebx,edx
 004DB9D3    mov         esi,eax
 004DB9D5    xor         eax,eax
 004DB9D7    mov         edx,esp
 004DB9D9    lea         ecx,[eax+41]
 004DB9DC    mov         word ptr [edx],cx
 004DB9DF    inc         eax
 004DB9E0    add         edx,2
 004DB9E3    cmp         eax,1A
>004DB9E6    jne         004DB9D9
 004DB9E8    xor         eax,eax
 004DB9EA    lea         edx,[esp+34]
 004DB9EE    lea         ecx,[eax+61]
 004DB9F1    mov         word ptr [edx],cx
 004DB9F4    inc         eax
 004DB9F5    add         edx,2
 004DB9F8    cmp         eax,1A
>004DB9FB    jne         004DB9EE
 004DB9FD    push        ebx
 004DB9FE    push        34
 004DBA00    lea         eax,[esp+8]
 004DBA04    push        eax
 004DBA05    mov         eax,esi
 004DBA07    call        TCanvas.GetHandle
 004DBA0C    push        eax
 004DBA0D    call        gdi32.GetTextExtentPointW
 004DBA12    mov         ecx,34
 004DBA17    mov         eax,dword ptr [ebx]
 004DBA19    cdq
 004DBA1A    idiv        eax,ecx
 004DBA1C    mov         dword ptr [ebx],eax
 004DBA1E    add         esp,68
 004DBA21    pop         esi
 004DBA22    pop         ebx
 004DBA23    ret
*}
end;

//004DBC40
constructor TMessageForm.CreateNew(Dummy:Integer);
begin
{*
 004DBC40    push        ebp
 004DBC41    mov         ebp,esp
 004DBC43    push        ebx
 004DBC44    push        esi
 004DBC45    test        dl,dl
>004DBC47    je          004DBC51
 004DBC49    add         esp,0FFFFFFF0
 004DBC4C    call        @ClassCreate
 004DBC51    mov         ebx,edx
 004DBC53    mov         esi,eax
 004DBC55    mov         eax,dword ptr [ebp+8]
 004DBC58    push        eax
 004DBC59    xor         edx,edx
 004DBC5B    mov         eax,esi
 004DBC5D    call        TCustomForm.CreateNew
 004DBC62    mov         eax,[0078DB00];^Screen:TScreen
 004DBC67    mov         eax,dword ptr [eax]
 004DBC69    mov         edx,dword ptr [eax+88]
 004DBC6F    mov         eax,dword ptr [esi+64]
 004DBC72    mov         ecx,dword ptr [eax]
 004DBC74    call        dword ptr [ecx+8]
 004DBC77    mov         eax,esi
 004DBC79    test        bl,bl
>004DBC7B    je          004DBC8C
 004DBC7D    call        @AfterConstruction
 004DBC82    pop         dword ptr fs:[0]
 004DBC89    add         esp,0C
 004DBC8C    mov         eax,esi
 004DBC8E    pop         esi
 004DBC8F    pop         ebx
 004DBC90    pop         ebp
 004DBC91    ret         4
*}
end;

//004DBC94
procedure TMessageForm.HelpButtonClick(Sender:TObject);
begin
{*
 004DBC94    mov         edx,dword ptr ds:[78D590];^Application:TApplication
 004DBC9A    mov         edx,dword ptr [edx]
 004DBC9C    mov         eax,dword ptr [eax+168]
 004DBCA2    xchg        eax,edx
 004DBCA3    call        TApplication.HelpContext
 004DBCA8    ret
*}
end;

//004DBCAC
procedure TMessageForm.CustomKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
{*
 004DBCAC    push        ebp
 004DBCAD    mov         ebp,esp
 004DBCAF    push        0
 004DBCB1    push        ebx
 004DBCB2    push        esi
 004DBCB3    mov         esi,ecx
 004DBCB5    mov         ebx,eax
 004DBCB7    xor         eax,eax
 004DBCB9    push        ebp
 004DBCBA    push        4DBD09
 004DBCBF    push        dword ptr fs:[eax]
 004DBCC2    mov         dword ptr fs:[eax],esp
 004DBCC5    movzx       eax,word ptr ds:[4DBD18]
 004DBCCC    cmp         ax,word ptr [ebp+8]
>004DBCD0    jne         004DBCF3
 004DBCD2    cmp         word ptr [esi],43
>004DBCD6    jne         004DBCF3
 004DBCD8    push        0
 004DBCDA    call        user32.MessageBeep
 004DBCDF    lea         edx,[ebp-4]
 004DBCE2    mov         eax,ebx
 004DBCE4    call        TMessageForm.GetFormText
 004DBCE9    mov         edx,dword ptr [ebp-4]
 004DBCEC    mov         eax,ebx
 004DBCEE    call        TMessageForm.WriteToClipBoard
 004DBCF3    xor         eax,eax
 004DBCF5    pop         edx
 004DBCF6    pop         ecx
 004DBCF7    pop         ecx
 004DBCF8    mov         dword ptr fs:[eax],edx
 004DBCFB    push        4DBD10
 004DBD00    lea         eax,[ebp-4]
 004DBD03    call        @UStrClr
 004DBD08    ret
>004DBD09    jmp         @HandleFinally
>004DBD0E    jmp         004DBD00
 004DBD10    pop         esi
 004DBD11    pop         ebx
 004DBD12    pop         ecx
 004DBD13    pop         ebp
 004DBD14    ret         4
*}
end;

//004DBD1C
procedure TMessageForm.WriteToClipBoard(Text:UnicodeString);
begin
{*
 004DBD1C    push        ebp
 004DBD1D    mov         ebp,esp
 004DBD1F    add         esp,0FFFFFFF8
 004DBD22    push        ebx
 004DBD23    push        esi
 004DBD24    push        edi
 004DBD25    mov         dword ptr [ebp-4],edx
 004DBD28    mov         eax,dword ptr [ebp-4]
 004DBD2B    call        @UStrAddRef
 004DBD30    xor         eax,eax
 004DBD32    push        ebp
 004DBD33    push        4DBE5B
 004DBD38    push        dword ptr fs:[eax]
 004DBD3B    mov         dword ptr fs:[eax],esp
 004DBD3E    push        0
 004DBD40    call        user32.OpenClipboard
 004DBD45    test        eax,eax
>004DBD47    je          004DBE2E
 004DBD4D    xor         edx,edx
 004DBD4F    push        ebp
 004DBD50    push        4DBE27
 004DBD55    push        dword ptr fs:[edx]
 004DBD58    mov         dword ptr fs:[edx],esp
 004DBD5B    mov         esi,dword ptr [ebp-4]
 004DBD5E    mov         eax,esi
 004DBD60    test        eax,eax
>004DBD62    je          004DBD69
 004DBD64    sub         eax,4
 004DBD67    mov         eax,dword ptr [eax]
 004DBD69    add         eax,eax
 004DBD6B    add         eax,2
 004DBD6E    push        eax
 004DBD6F    push        2002
 004DBD74    call        kernel32.GlobalAlloc
 004DBD79    mov         dword ptr [ebp-8],eax
 004DBD7C    xor         edx,edx
 004DBD7E    push        ebp
 004DBD7F    push        4DBDFC
 004DBD84    push        dword ptr fs:[edx]
 004DBD87    mov         dword ptr fs:[edx],esp
 004DBD8A    mov         eax,dword ptr [ebp-8]
 004DBD8D    push        eax
 004DBD8E    call        kernel32.GlobalLock
 004DBD93    mov         ebx,eax
 004DBD95    xor         edx,edx
 004DBD97    push        ebp
 004DBD98    push        4DBDEB
 004DBD9D    push        dword ptr fs:[edx]
 004DBDA0    mov         dword ptr fs:[edx],esp
 004DBDA3    mov         eax,esi
 004DBDA5    test        eax,eax
>004DBDA7    je          004DBDAE
 004DBDA9    sub         eax,4
 004DBDAC    mov         eax,dword ptr [eax]
 004DBDAE    mov         esi,eax
 004DBDB0    add         esi,esi
 004DBDB2    mov         eax,dword ptr [ebp-4]
 004DBDB5    call        @UStrToPWChar
 004DBDBA    lea         ecx,[esi+2]
 004DBDBD    mov         edx,ebx
 004DBDBF    call        Move
 004DBDC4    call        user32.EmptyClipboard
 004DBDC9    mov         eax,dword ptr [ebp-8]
 004DBDCC    push        eax
 004DBDCD    push        0D
 004DBDCF    call        user32.SetClipboardData
 004DBDD4    xor         eax,eax
 004DBDD6    pop         edx
 004DBDD7    pop         ecx
 004DBDD8    pop         ecx
 004DBDD9    mov         dword ptr fs:[eax],edx
 004DBDDC    push        4DBDF2
 004DBDE1    mov         eax,dword ptr [ebp-8]
 004DBDE4    push        eax
 004DBDE5    call        kernel32.GlobalUnlock
 004DBDEA    ret
>004DBDEB    jmp         @HandleFinally
>004DBDF0    jmp         004DBDE1
 004DBDF2    xor         eax,eax
 004DBDF4    pop         edx
 004DBDF5    pop         ecx
 004DBDF6    pop         ecx
 004DBDF7    mov         dword ptr fs:[eax],edx
>004DBDFA    jmp         004DBE14
>004DBDFC    jmp         @HandleAnyException
 004DBE01    mov         eax,dword ptr [ebp-8]
 004DBE04    push        eax
 004DBE05    call        kernel32.GlobalFree
 004DBE0A    call        @RaiseAgain
 004DBE0F    call        @DoneExcept
 004DBE14    xor         eax,eax
 004DBE16    pop         edx
 004DBE17    pop         ecx
 004DBE18    pop         ecx
 004DBE19    mov         dword ptr fs:[eax],edx
 004DBE1C    push        4DBE45
 004DBE21    call        user32.CloseClipboard
 004DBE26    ret
>004DBE27    jmp         @HandleFinally
>004DBE2C    jmp         004DBE21
 004DBE2E    mov         ecx,dword ptr ds:[78CD00];^SResString283:TResStringRec
 004DBE34    mov         dl,1
 004DBE36    mov         eax,[00418C04];Exception
 004DBE3B    call        Exception.CreateRes
 004DBE40    call        @RaiseExcept
 004DBE45    xor         eax,eax
 004DBE47    pop         edx
 004DBE48    pop         ecx
 004DBE49    pop         ecx
 004DBE4A    mov         dword ptr fs:[eax],edx
 004DBE4D    push        4DBE62
 004DBE52    lea         eax,[ebp-4]
 004DBE55    call        @UStrClr
 004DBE5A    ret
>004DBE5B    jmp         @HandleFinally
>004DBE60    jmp         004DBE52
 004DBE62    pop         edi
 004DBE63    pop         esi
 004DBE64    pop         ebx
 004DBE65    pop         ecx
 004DBE66    pop         ecx
 004DBE67    pop         ebp
 004DBE68    ret
*}
end;

//004DBE6C
function TMessageForm.GetFormText:UnicodeString;
begin
{*
 004DBE6C    push        ebp
 004DBE6D    mov         ebp,esp
 004DBE6F    add         esp,0FFFFFF8C
 004DBE72    push        ebx
 004DBE73    push        esi
 004DBE74    push        edi
 004DBE75    xor         ecx,ecx
 004DBE77    mov         dword ptr [ebp-70],ecx
 004DBE7A    mov         dword ptr [ebp-74],ecx
 004DBE7D    mov         dword ptr [ebp-1C],ecx
 004DBE80    mov         dword ptr [ebp-14],ecx
 004DBE83    mov         dword ptr [ebp-18],ecx
 004DBE86    mov         dword ptr [ebp-10],ecx
 004DBE89    mov         dword ptr [ebp-4],ecx
 004DBE8C    mov         dword ptr [ebp-8],ecx
 004DBE8F    mov         dword ptr [ebp-0C],edx
 004DBE92    mov         ebx,eax
 004DBE94    xor         eax,eax
 004DBE96    push        ebp
 004DBE97    push        4DC02B
 004DBE9C    push        dword ptr fs:[eax]
 004DBE9F    mov         dword ptr fs:[eax],esp
 004DBEA2    lea         ecx,[ebp-10]
 004DBEA5    mov         edx,1B
 004DBEAA    mov         ax,2D
 004DBEAE    call        StringOfChar
 004DBEB3    mov         edx,dword ptr [ebp-10]
 004DBEB6    lea         eax,[ebp-4]
 004DBEB9    mov         ecx,4DC048;'
'
 004DBEBE    call        @UStrCat3
 004DBEC3    mov         eax,ebx
 004DBEC5    call        TComponent.GetComponentCount
 004DBECA    mov         edi,eax
 004DBECC    dec         edi
 004DBECD    test        edi,edi
>004DBECF    jl          004DBF28
 004DBED1    inc         edi
 004DBED2    xor         esi,esi
 004DBED4    mov         edx,esi
 004DBED6    mov         eax,ebx
 004DBED8    call        TComponent.GetComponent
 004DBEDD    mov         edx,dword ptr ds:[4B3A00];TButton
 004DBEE3    call        @IsClass
 004DBEE8    test        al,al
>004DBEEA    je          004DBF24
 004DBEEC    push        dword ptr [ebp-8]
 004DBEEF    mov         edx,esi
 004DBEF1    mov         eax,ebx
 004DBEF3    call        TComponent.GetComponent
 004DBEF8    lea         edx,[ebp-14]
 004DBEFB    call        TControl.GetText
 004DBF00    push        dword ptr [ebp-14]
 004DBF03    lea         ecx,[ebp-18]
 004DBF06    mov         edx,3
 004DBF0B    mov         ax,20
 004DBF0F    call        StringOfChar
 004DBF14    push        dword ptr [ebp-18]
 004DBF17    lea         eax,[ebp-8]
 004DBF1A    mov         edx,3
 004DBF1F    call        @UStrCatN
 004DBF24    inc         esi
 004DBF25    dec         edi
>004DBF26    jne         004DBED4
 004DBF28    movzx       eax,byte ptr ds:[4DC050]
 004DBF2F    push        eax
 004DBF30    lea         eax,[ebp-1C]
 004DBF33    push        eax
 004DBF34    xor         ecx,ecx
 004DBF36    mov         edx,4DC060;'&'
 004DBF3B    mov         eax,dword ptr [ebp-8]
 004DBF3E    call        StringReplace
 004DBF43    mov         edx,dword ptr [ebp-1C]
 004DBF46    lea         eax,[ebp-8]
 004DBF49    call        @UStrLAsg
 004DBF4E    mov         eax,dword ptr [ebp-0C]
 004DBF51    push        eax
 004DBF52    mov         eax,dword ptr [ebp-4]
 004DBF55    mov         dword ptr [ebp-6C],eax
 004DBF58    mov         byte ptr [ebp-68],11
 004DBF5C    lea         edx,[ebp-70]
 004DBF5F    mov         eax,ebx
 004DBF61    call        TControl.GetText
 004DBF66    mov         eax,dword ptr [ebp-70]
 004DBF69    mov         dword ptr [ebp-64],eax
 004DBF6C    mov         byte ptr [ebp-60],11
 004DBF70    mov         eax,4DC070;#13+#10
 004DBF75    mov         dword ptr [ebp-5C],eax
 004DBF78    mov         byte ptr [ebp-58],0B
 004DBF7C    mov         eax,dword ptr [ebp-4]
 004DBF7F    mov         dword ptr [ebp-54],eax
 004DBF82    mov         byte ptr [ebp-50],11
 004DBF86    lea         edx,[ebp-74]
 004DBF89    mov         eax,dword ptr [ebx+388]
 004DBF8F    call        TControl.GetText
 004DBF94    mov         eax,dword ptr [ebp-74]
 004DBF97    mov         dword ptr [ebp-4C],eax
 004DBF9A    mov         byte ptr [ebp-48],11
 004DBF9E    mov         eax,4DC070;#13+#10
 004DBFA3    mov         dword ptr [ebp-44],eax
 004DBFA6    mov         byte ptr [ebp-40],0B
 004DBFAA    mov         eax,dword ptr [ebp-4]
 004DBFAD    mov         dword ptr [ebp-3C],eax
 004DBFB0    mov         byte ptr [ebp-38],11
 004DBFB4    mov         eax,dword ptr [ebp-8]
 004DBFB7    mov         dword ptr [ebp-34],eax
 004DBFBA    mov         byte ptr [ebp-30],11
 004DBFBE    mov         eax,4DC070;#13+#10
 004DBFC3    mov         dword ptr [ebp-2C],eax
 004DBFC6    mov         byte ptr [ebp-28],0B
 004DBFCA    mov         eax,dword ptr [ebp-4]
 004DBFCD    mov         dword ptr [ebp-24],eax
 004DBFD0    mov         byte ptr [ebp-20],11
 004DBFD4    lea         edx,[ebp-6C]
 004DBFD7    mov         ecx,9
 004DBFDC    mov         eax,4DC080;'%s%s%s%s%s%s%s%s%s%s'
 004DBFE1    call        Format
 004DBFE6    xor         eax,eax
 004DBFE8    pop         edx
 004DBFE9    pop         ecx
 004DBFEA    pop         ecx
 004DBFEB    mov         dword ptr fs:[eax],edx
 004DBFEE    push        4DC032
 004DBFF3    lea         eax,[ebp-74]
 004DBFF6    mov         edx,2
 004DBFFB    call        @UStrArrayClr
 004DC000    lea         eax,[ebp-1C]
 004DC003    mov         edx,2
 004DC008    call        @UStrArrayClr
 004DC00D    lea         eax,[ebp-14]
 004DC010    call        @UStrClr
 004DC015    lea         eax,[ebp-10]
 004DC018    call        @UStrClr
 004DC01D    lea         eax,[ebp-8]
 004DC020    mov         edx,2
 004DC025    call        @UStrArrayClr
 004DC02A    ret
>004DC02B    jmp         @HandleFinally
>004DC030    jmp         004DBFF3
 004DC032    pop         edi
 004DC033    pop         esi
 004DC034    pop         ebx
 004DC035    mov         esp,ebp
 004DC037    pop         ebp
 004DC038    ret
*}
end;

//004DC1D0
function CreateMessageDialog(const Msg:UnicodeString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; DefaultButton:TMsgDlgBtn):TForm;
begin
{*
 004DC1D0    push        ebp
 004DC1D1    mov         ebp,esp
 004DC1D3    add         esp,0FFFFFF8C
 004DC1D6    push        ebx
 004DC1D7    push        esi
 004DC1D8    push        edi
 004DC1D9    xor         ebx,ebx
 004DC1DB    mov         dword ptr [ebp-74],ebx
 004DC1DE    mov         dword ptr [ebp-70],ebx
 004DC1E1    mov         dword ptr [ebp-6C],ebx
 004DC1E4    mov         dword ptr [ebp-68],ebx
 004DC1E7    mov         word ptr [ebp-7],cx
 004DC1EB    mov         byte ptr [ebp-5],dl
 004DC1EE    mov         dword ptr [ebp-4],eax
 004DC1F1    xor         eax,eax
 004DC1F3    push        ebp
 004DC1F4    push        4DC763
 004DC1F9    push        dword ptr fs:[eax]
 004DC1FC    mov         dword ptr fs:[eax],esp
 004DC1FF    push        0
 004DC201    mov         ecx,dword ptr ds:[78D590];^Application:TApplication
 004DC207    mov         ecx,dword ptr [ecx]
 004DC209    mov         dl,1
 004DC20B    mov         eax,[004DBA24];TMessageForm
 004DC210    call        TMessageForm.CreateNew
 004DC215    mov         dword ptr [ebp-0C],eax
 004DC218    mov         eax,[0078D590];^Application:TApplication
 004DC21D    mov         eax,dword ptr [eax]
 004DC21F    movzx       edx,byte ptr [eax+35]
 004DC223    mov         eax,dword ptr [ebp-0C]
 004DC226    mov         ecx,dword ptr [eax]
 004DC228    call        dword ptr [ecx+80]
 004DC22E    mov         dl,3
 004DC230    mov         eax,dword ptr [ebp-0C]
 004DC233    call        TCustomForm.SetBorderStyle
 004DC238    mov         eax,dword ptr [ebp-0C]
 004DC23B    call        TCustomForm.GetCanvas
 004DC240    mov         edx,dword ptr [ebp-0C]
 004DC243    mov         edx,dword ptr [edx+64]
 004DC246    call        TCanvas.SetFont
 004DC24B    mov         eax,dword ptr [ebp-0C]
 004DC24E    mov         byte ptr [eax+29C],1
 004DC255    mov         dl,1
 004DC257    mov         eax,dword ptr [ebp-0C]
 004DC25A    call        TCustomForm.SetPopupMode
 004DC25F    xor         edx,edx
 004DC261    mov         eax,dword ptr [ebp-0C]
 004DC264    call        TCustomForm.SetPosition
 004DC269    mov         eax,dword ptr [ebp-0C]
 004DC26C    mov         edx,dword ptr [ebp-0C]
 004DC26F    mov         dword ptr [eax+21C],edx
 004DC275    mov         dword ptr [eax+218],4DBCAC;TMessageForm.CustomKeyDown
 004DC27F    mov         eax,dword ptr [ebp-0C]
 004DC282    call        TCustomForm.GetCanvas
 004DC287    lea         edx,[ebp-14]
 004DC28A    call        GetAveCharSize
 004DC28F    push        4
 004DC291    mov         ebx,dword ptr [ebp-14]
 004DC294    push        ebx
 004DC295    push        8
 004DC297    call        kernel32.MulDiv
 004DC29C    mov         dword ptr [ebp-18],eax
 004DC29F    push        8
 004DC2A1    mov         eax,dword ptr [ebp-10]
 004DC2A4    push        eax
 004DC2A5    push        8
 004DC2A7    call        kernel32.MulDiv
 004DC2AC    mov         dword ptr [ebp-1C],eax
 004DC2AF    push        4
 004DC2B1    push        ebx
 004DC2B2    push        0A
 004DC2B4    call        kernel32.MulDiv
 004DC2B9    mov         dword ptr [ebp-20],eax
 004DC2BC    push        8
 004DC2BE    mov         eax,dword ptr [ebp-10]
 004DC2C1    push        eax
 004DC2C2    push        0A
 004DC2C4    call        kernel32.MulDiv
 004DC2C9    mov         dword ptr [ebp-24],eax
 004DC2CC    push        4
 004DC2CE    push        ebx
 004DC2CF    push        32
 004DC2D1    call        kernel32.MulDiv
 004DC2D6    mov         dword ptr [ebp-28],eax
 004DC2D9    xor         ebx,ebx
 004DC2DB    mov         esi,7932B0
 004DC2E0    mov         dword ptr [ebp-50],78661C;^SResString248:TResStringRec
 004DC2E7    mov         eax,ebx
 004DC2E9    cmp         al,0F
>004DC2EB    ja          004DC2F5
 004DC2ED    and         eax,7F
 004DC2F0    bt          word ptr [ebp-7],ax
>004DC2F5    jae         004DC35F
 004DC2F7    cmp         dword ptr [esi],0
>004DC2FA    jne         004DC355
 004DC2FC    push        0
 004DC2FE    lea         eax,[ebp-64]
 004DC301    push        eax
 004DC302    xor         ecx,ecx
 004DC304    xor         edx,edx
 004DC306    xor         eax,eax
 004DC308    call        Rect
 004DC30D    mov         eax,dword ptr [ebp-0C]
 004DC310    call        TControl.DrawTextBiDiModeFlagsReadingOnly
 004DC315    or          eax,420
 004DC31A    push        eax
 004DC31B    lea         eax,[ebp-64]
 004DC31E    push        eax
 004DC31F    push        0FF
 004DC321    lea         edx,[ebp-68]
 004DC324    mov         eax,dword ptr [ebp-50]
 004DC327    mov         eax,dword ptr [eax]
 004DC329    call        LoadResString
 004DC32E    mov         eax,dword ptr [ebp-68]
 004DC331    call        @UStrToPWChar
 004DC336    push        eax
 004DC337    mov         eax,dword ptr [ebp-0C]
 004DC33A    call        TCustomForm.GetCanvas
 004DC33F    call        TCanvas.GetHandle
 004DC344    push        eax
 004DC345    call        user32.DrawTextW
 004DC34A    mov         eax,dword ptr [ebp-5C]
 004DC34D    sub         eax,dword ptr [ebp-64]
 004DC350    add         eax,8
 004DC353    mov         dword ptr [esi],eax
 004DC355    mov         eax,dword ptr [esi]
 004DC357    cmp         eax,dword ptr [ebp-28]
>004DC35A    jle         004DC35F
 004DC35C    mov         dword ptr [ebp-28],eax
 004DC35F    inc         ebx
 004DC360    add         dword ptr [ebp-50],4
 004DC364    add         esi,4
 004DC367    cmp         bl,0C
>004DC36A    jne         004DC2E7
 004DC370    push        8
 004DC372    mov         eax,dword ptr [ebp-10]
 004DC375    push        eax
 004DC376    push        0E
 004DC378    call        kernel32.MulDiv
 004DC37D    mov         dword ptr [ebp-2C],eax
 004DC380    push        4
 004DC382    mov         eax,dword ptr [ebp-14]
 004DC385    push        eax
 004DC386    push        4
 004DC388    call        kernel32.MulDiv
 004DC38D    mov         dword ptr [ebp-30],eax
 004DC390    push        0
 004DC392    mov         eax,[0078DB00];^Screen:TScreen
 004DC397    mov         eax,dword ptr [eax]
 004DC399    call        TScreen.GetWidth
 004DC39E    sar         eax,1
>004DC3A0    jns         004DC3A5
 004DC3A2    adc         eax,0
 004DC3A5    push        eax
 004DC3A6    push        0
 004DC3A8    push        0
 004DC3AA    lea         eax,[ebp-64]
 004DC3AD    push        eax
 004DC3AE    call        user32.SetRect
 004DC3B3    mov         eax,dword ptr [ebp-0C]
 004DC3B6    call        TCustomForm.GetCanvas
 004DC3BB    call        TCanvas.GetHandle
 004DC3C0    mov         esi,eax
 004DC3C2    mov         ebx,dword ptr [ebp-4]
 004DC3C5    test        ebx,ebx
>004DC3C7    je          004DC3CE
 004DC3C9    sub         ebx,4
 004DC3CC    mov         ebx,dword ptr [ebx]
 004DC3CE    mov         eax,dword ptr [ebp-0C]
 004DC3D1    call        TControl.DrawTextBiDiModeFlagsReadingOnly
 004DC3D6    mov         edi,eax
 004DC3D8    or          edi,450
 004DC3DE    push        edi
 004DC3DF    lea         eax,[ebp-64]
 004DC3E2    push        eax
 004DC3E3    inc         ebx
 004DC3E4    push        ebx
 004DC3E5    mov         eax,dword ptr [ebp-4]
 004DC3E8    call        @UStrToPWChar
 004DC3ED    push        eax
 004DC3EE    push        esi
 004DC3EF    call        user32.DrawTextW
 004DC3F4    mov         dword ptr [ebp-4C],eax
 004DC3F7    movzx       eax,byte ptr [ebp-5]
 004DC3FB    mov         edi,dword ptr [eax*4+786608]
 004DC402    mov         esi,dword ptr [ebp-5C]
 004DC405    mov         eax,dword ptr [ebp-58]
 004DC408    mov         dword ptr [ebp-34],eax
 004DC40B    test        edi,edi
>004DC40D    je          004DC424
 004DC40F    mov         eax,dword ptr [ebp-20]
 004DC412    add         eax,20
 004DC415    add         esi,eax
 004DC417    cmp         dword ptr [ebp-34],20
>004DC41B    jge         004DC424
 004DC41D    mov         dword ptr [ebp-34],20
 004DC424    xor         eax,eax
 004DC426    xor         ebx,ebx
 004DC428    mov         edx,ebx
 004DC42A    cmp         dl,0F
>004DC42D    ja          004DC437
 004DC42F    and         edx,7F
 004DC432    bt          word ptr [ebp-7],dx
>004DC437    jae         004DC43A
 004DC439    inc         eax
 004DC43A    inc         ebx
 004DC43B    cmp         bl,0C
>004DC43E    jne         004DC428
 004DC440    xor         ebx,ebx
 004DC442    test        eax,eax
>004DC444    je          004DC452
 004DC446    mov         ebx,dword ptr [ebp-28]
 004DC449    imul        ebx,eax
 004DC44C    dec         eax
 004DC44D    imul        dword ptr [ebp-30]
 004DC450    add         ebx,eax
 004DC452    cmp         ebx,esi
>004DC454    jge         004DC45A
 004DC456    mov         eax,esi
>004DC458    jmp         004DC45C
 004DC45A    mov         eax,ebx
 004DC45C    mov         edx,dword ptr [ebp-18]
 004DC45F    add         edx,edx
 004DC461    add         edx,eax
 004DC463    mov         eax,dword ptr [ebp-0C]
 004DC466    call        TCustomForm.SetClientWidth
 004DC46B    mov         edx,dword ptr [ebp-34]
 004DC46E    add         edx,dword ptr [ebp-2C]
 004DC471    add         edx,dword ptr [ebp-24]
 004DC474    mov         eax,dword ptr [ebp-1C]
 004DC477    add         eax,eax
 004DC479    add         edx,eax
 004DC47B    mov         eax,dword ptr [ebp-0C]
 004DC47E    call        TCustomForm.SetClientHeight
 004DC483    mov         eax,[0078DB00];^Screen:TScreen
 004DC488    mov         eax,dword ptr [eax]
 004DC48A    call        TScreen.GetWidth
 004DC48F    mov         edx,eax
 004DC491    sar         edx,1
>004DC493    jns         004DC498
 004DC495    adc         edx,0
 004DC498    mov         eax,dword ptr [ebp-0C]
 004DC49B    mov         eax,dword ptr [eax+48]
 004DC49E    sar         eax,1
>004DC4A0    jns         004DC4A5
 004DC4A2    adc         eax,0
 004DC4A5    sub         edx,eax
 004DC4A7    mov         eax,dword ptr [ebp-0C]
 004DC4AA    call        TCustomForm.SetLeft
 004DC4AF    mov         eax,[0078DB00];^Screen:TScreen
 004DC4B4    mov         eax,dword ptr [eax]
 004DC4B6    call        TScreen.GetHeight
 004DC4BB    mov         edx,eax
 004DC4BD    sar         edx,1
>004DC4BF    jns         004DC4C4
 004DC4C1    adc         edx,0
 004DC4C4    mov         eax,dword ptr [ebp-0C]
 004DC4C7    mov         eax,dword ptr [eax+4C]
 004DC4CA    sar         eax,1
>004DC4CC    jns         004DC4D1
 004DC4CE    adc         eax,0
 004DC4D1    sub         edx,eax
 004DC4D3    mov         eax,dword ptr [ebp-0C]
 004DC4D6    call        TCustomForm.SetTop
 004DC4DB    cmp         byte ptr [ebp-5],4
>004DC4DF    je          004DC501
 004DC4E1    lea         edx,[ebp-6C]
 004DC4E4    movzx       eax,byte ptr [ebp-5]
 004DC4E8    mov         eax,dword ptr [eax*4+7865F4];^SResString244:TResStringRec
 004DC4EF    call        LoadResString
 004DC4F4    mov         edx,dword ptr [ebp-6C]
 004DC4F7    mov         eax,dword ptr [ebp-0C]
 004DC4FA    call        TControl.SetText
>004DC4FF    jmp         004DC51B
 004DC501    lea         edx,[ebp-70]
 004DC504    mov         eax,[0078D590];^Application:TApplication
 004DC509    mov         eax,dword ptr [eax]
 004DC50B    call        TApplication.GetTitle
 004DC510    mov         edx,dword ptr [ebp-70]
 004DC513    mov         eax,dword ptr [ebp-0C]
 004DC516    call        TControl.SetText
 004DC51B    test        edi,edi
>004DC51D    je          004DC57B
 004DC51F    mov         ecx,dword ptr [ebp-0C]
 004DC522    mov         dl,1
 004DC524    mov         eax,[004C3F4C];TImage
 004DC529    call        TImage.Create
 004DC52E    mov         dword ptr [ebp-48],eax
 004DC531    mov         edx,4DC784;'Image'
 004DC536    mov         eax,dword ptr [ebp-48]
 004DC539    mov         ecx,dword ptr [eax]
 004DC53B    call        dword ptr [ecx+18]
 004DC53E    mov         edx,dword ptr [ebp-0C]
 004DC541    mov         eax,dword ptr [ebp-48]
 004DC544    mov         ecx,dword ptr [eax]
 004DC546    call        dword ptr [ecx+78]
 004DC549    push        edi
 004DC54A    push        0
 004DC54C    call        user32.LoadIconW
 004DC551    push        eax
 004DC552    mov         eax,dword ptr [ebp-48]
 004DC555    mov         eax,dword ptr [eax+1B0]
 004DC55B    call        TPicture.GetIcon
 004DC560    pop         edx
 004DC561    call        TIcon.SetHandle
 004DC566    push        20
 004DC568    push        20
 004DC56A    mov         ecx,dword ptr [ebp-1C]
 004DC56D    mov         edx,dword ptr [ebp-18]
 004DC570    mov         eax,dword ptr [ebp-48]
 004DC573    mov         edi,dword ptr [eax]
 004DC575    call        dword ptr [edi+98]
 004DC57B    mov         ecx,dword ptr [ebp-0C]
 004DC57E    mov         dl,1
 004DC580    mov         eax,[004ADEF4];TLabel
 004DC585    call        TCustomLabel.Create
 004DC58A    mov         edx,dword ptr [ebp-0C]
 004DC58D    mov         dword ptr [edx+388],eax
 004DC593    mov         eax,dword ptr [ebp-0C]
 004DC596    mov         edi,dword ptr [eax+388]
 004DC59C    mov         edx,4DC79C;'Message'
 004DC5A1    mov         eax,edi
 004DC5A3    mov         ecx,dword ptr [eax]
 004DC5A5    call        dword ptr [ecx+18]
 004DC5A8    mov         edx,dword ptr [ebp-0C]
 004DC5AB    mov         eax,edi
 004DC5AD    mov         ecx,dword ptr [eax]
 004DC5AF    call        dword ptr [ecx+78]
 004DC5B2    mov         dl,1
 004DC5B4    mov         eax,edi
 004DC5B6    call        TCustomLabel.SetWordWrap
 004DC5BB    mov         edx,dword ptr [ebp-4]
 004DC5BE    mov         eax,edi
 004DC5C0    call        TControl.SetText
 004DC5C5    lea         edx,[ebp-64]
 004DC5C8    mov         eax,edi
 004DC5CA    call        TControl.SetBoundsRect
 004DC5CF    mov         eax,dword ptr [ebp-0C]
 004DC5D2    movzx       edx,byte ptr [eax+61]
 004DC5D6    mov         eax,edi
 004DC5D8    mov         ecx,dword ptr [eax]
 004DC5DA    call        dword ptr [ecx+80]
 004DC5E0    sub         esi,dword ptr [ebp-5C]
 004DC5E3    add         esi,dword ptr [ebp-18]
 004DC5E6    mov         dword ptr [ebp-3C],esi
 004DC5E9    mov         eax,edi
 004DC5EB    mov         si,0FFC7
 004DC5EF    call        @CallDynaInst
 004DC5F4    test        al,al
>004DC5F6    je          004DC609
 004DC5F8    mov         eax,dword ptr [ebp-0C]
 004DC5FB    call        TControl.GetClientWidth
 004DC600    sub         eax,dword ptr [ebp-3C]
 004DC603    sub         eax,dword ptr [edi+48]
 004DC606    mov         dword ptr [ebp-3C],eax
 004DC609    mov         eax,dword ptr [ebp-5C]
 004DC60C    push        eax
 004DC60D    mov         eax,dword ptr [ebp-58]
 004DC610    push        eax
 004DC611    mov         ecx,dword ptr [ebp-1C]
 004DC614    mov         edx,dword ptr [ebp-3C]
 004DC617    mov         eax,edi
 004DC619    mov         esi,dword ptr [eax]
 004DC61B    call        dword ptr [esi+98]
 004DC621    test        byte ptr [ebp-7],8
>004DC625    je          004DC62D
 004DC627    mov         byte ptr [ebp-3D],3
>004DC62B    jmp         004DC63D
 004DC62D    test        byte ptr [ebp-7],2
>004DC631    je          004DC639
 004DC633    mov         byte ptr [ebp-3D],1
>004DC637    jmp         004DC63D
 004DC639    mov         byte ptr [ebp-3D],2
 004DC63D    mov         eax,dword ptr [ebp-0C]
 004DC640    call        TControl.GetClientWidth
 004DC645    sub         eax,ebx
 004DC647    sar         eax,1
>004DC649    jns         004DC64E
 004DC64B    adc         eax,0
 004DC64E    mov         dword ptr [ebp-38],eax
 004DC651    xor         ebx,ebx
 004DC653    mov         dword ptr [ebp-50],78664C;^'Yes'
 004DC65A    mov         esi,78661C;^SResString248:TResStringRec
 004DC65F    mov         dword ptr [ebp-54],78667C
 004DC666    mov         eax,ebx
 004DC668    cmp         al,0F
>004DC66A    ja          004DC674
 004DC66C    and         eax,7F
 004DC66F    bt          word ptr [ebp-7],ax
>004DC674    jae         004DC733
 004DC67A    mov         ecx,dword ptr [ebp-0C]
 004DC67D    mov         dl,1
 004DC67F    mov         eax,[004B3A00];TButton
 004DC684    call        TCustomButton.Create
 004DC689    mov         dword ptr [ebp-44],eax
 004DC68C    mov         eax,dword ptr [ebp-50]
 004DC68F    mov         edx,dword ptr [eax]
 004DC691    mov         eax,dword ptr [ebp-44]
 004DC694    mov         ecx,dword ptr [eax]
 004DC696    call        dword ptr [ecx+18]
 004DC699    mov         edx,dword ptr [ebp-0C]
 004DC69C    mov         eax,dword ptr [ebp-44]
 004DC69F    mov         ecx,dword ptr [eax]
 004DC6A1    call        dword ptr [ecx+78]
 004DC6A4    lea         edx,[ebp-74]
 004DC6A7    mov         eax,dword ptr [esi]
 004DC6A9    call        LoadResString
 004DC6AE    mov         edx,dword ptr [ebp-74]
 004DC6B1    mov         eax,dword ptr [ebp-44]
 004DC6B4    call        TControl.SetText
 004DC6B9    mov         eax,dword ptr [ebp-54]
 004DC6BC    mov         eax,dword ptr [eax]
 004DC6BE    mov         edx,dword ptr [ebp-44]
 004DC6C1    mov         dword ptr [edx+2AC],eax
 004DC6C7    cmp         bl,byte ptr [ebp+8]
>004DC6CA    jne         004DC6E1
 004DC6CC    mov         dl,1
 004DC6CE    mov         eax,dword ptr [ebp-44]
 004DC6D1    call        TCustomButton.SetDefault
 004DC6D6    mov         edx,dword ptr [ebp-44]
 004DC6D9    mov         eax,dword ptr [ebp-0C]
 004DC6DC    call        TCustomForm.SetActiveControl
 004DC6E1    cmp         bl,byte ptr [ebp-3D]
>004DC6E4    jne         004DC6F0
 004DC6E6    mov         eax,dword ptr [ebp-44]
 004DC6E9    mov         byte ptr [eax+279],1
 004DC6F0    mov         eax,dword ptr [ebp-28]
 004DC6F3    push        eax
 004DC6F4    mov         eax,dword ptr [ebp-2C]
 004DC6F7    push        eax
 004DC6F8    mov         ecx,dword ptr [ebp-34]
 004DC6FB    add         ecx,dword ptr [ebp-1C]
 004DC6FE    add         ecx,dword ptr [ebp-24]
 004DC701    mov         edx,dword ptr [ebp-38]
 004DC704    mov         eax,dword ptr [ebp-44]
 004DC707    mov         edi,dword ptr [eax]
 004DC709    call        dword ptr [edi+98]
 004DC70F    mov         eax,dword ptr [ebp-28]
 004DC712    add         eax,dword ptr [ebp-30]
 004DC715    add         dword ptr [ebp-38],eax
 004DC718    cmp         bl,0A
>004DC71B    jne         004DC733
 004DC71D    mov         eax,dword ptr [ebp-44]
 004DC720    mov         edx,dword ptr [ebp-0C]
 004DC723    mov         dword ptr [eax+114],edx
 004DC729    mov         dword ptr [eax+110],4DBC94;TMessageForm.HelpButtonClick
 004DC733    inc         ebx
 004DC734    add         dword ptr [ebp-54],4
 004DC738    add         esi,4
 004DC73B    add         dword ptr [ebp-50],4
 004DC73F    cmp         bl,0C
>004DC742    jne         004DC666
 004DC748    xor         eax,eax
 004DC74A    pop         edx
 004DC74B    pop         ecx
 004DC74C    pop         ecx
 004DC74D    mov         dword ptr fs:[eax],edx
 004DC750    push        4DC76A
 004DC755    lea         eax,[ebp-74]
 004DC758    mov         edx,4
 004DC75D    call        @UStrArrayClr
 004DC762    ret
>004DC763    jmp         @HandleFinally
>004DC768    jmp         004DC755
 004DC76A    mov         eax,dword ptr [ebp-0C]
 004DC76D    pop         edi
 004DC76E    pop         esi
 004DC76F    pop         ebx
 004DC770    mov         esp,ebp
 004DC772    pop         ebp
 004DC773    ret         4
*}
end;

//004DC7AC
function CreateMessageDialog(const Msg:UnicodeString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons):TForm;
begin
{*
 004DC7AC    push        ecx
 004DC7AD    mov         word ptr [esp],cx
 004DC7B1    test        byte ptr [esp],4
>004DC7B5    je          004DC7BB
 004DC7B7    mov         cl,2
>004DC7B9    jmp         004DC7C7
 004DC7BB    test        byte ptr [esp],1
>004DC7BF    je          004DC7C5
 004DC7C1    xor         ecx,ecx
>004DC7C3    jmp         004DC7C7
 004DC7C5    mov         cl,5
 004DC7C7    push        ecx
 004DC7C8    movzx       ecx,word ptr [esp+4]
 004DC7CD    call        CreateMessageDialog
 004DC7D2    pop         edx
 004DC7D3    ret
*}
end;

//004DC7D4
function MessageDlg(const Msg:UnicodeString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:LongInt):Integer;
begin
{*
 004DC7D4    push        ebp
 004DC7D5    mov         ebp,esp
 004DC7D7    push        ecx
 004DC7D8    mov         word ptr [ebp-2],cx
 004DC7DC    mov         ecx,dword ptr [ebp+8]
 004DC7DF    push        ecx
 004DC7E0    push        0FF
 004DC7E2    push        0FF
 004DC7E4    push        0
 004DC7E6    movzx       ecx,word ptr [ebp-2]
 004DC7EA    call        MessageDlgPosHelp
 004DC7EF    pop         ecx
 004DC7F0    pop         ebp
 004DC7F1    ret         4
*}
end;

//004DC7F4
function DoMessageDlgPosHelp(MessageDialog:TForm; HelpCtx:LongInt; X:Integer; Y:Integer; const HelpFileName:UnicodeString):Integer;
begin
{*
 004DC7F4    push        ebp
 004DC7F5    mov         ebp,esp
 004DC7F7    add         esp,0FFFFFFF8
 004DC7FA    push        ebx
 004DC7FB    push        esi
 004DC7FC    mov         ebx,ecx
 004DC7FE    mov         dword ptr [ebp-4],eax
 004DC801    mov         esi,dword ptr [ebp+0C]
 004DC804    xor         eax,eax
 004DC806    push        ebp
 004DC807    push        4DC87C
 004DC80C    push        dword ptr fs:[eax]
 004DC80F    mov         dword ptr fs:[eax],esp
 004DC812    mov         eax,dword ptr [ebp-4]
 004DC815    call        TControl.SetHelpKeyword
 004DC81A    mov         eax,dword ptr [ebp-4]
 004DC81D    add         eax,2A8
 004DC822    mov         edx,dword ptr [ebp+8]
 004DC825    call        @UStrAsg
 004DC82A    test        ebx,ebx
>004DC82C    jl          004DC838
 004DC82E    mov         edx,ebx
 004DC830    mov         eax,dword ptr [ebp-4]
 004DC833    call        TCustomForm.SetLeft
 004DC838    test        esi,esi
>004DC83A    jl          004DC846
 004DC83C    mov         edx,esi
 004DC83E    mov         eax,dword ptr [ebp-4]
 004DC841    call        TCustomForm.SetTop
 004DC846    test        esi,esi
>004DC848    jge         004DC858
 004DC84A    test        ebx,ebx
>004DC84C    jge         004DC858
 004DC84E    mov         dl,4
 004DC850    mov         eax,dword ptr [ebp-4]
 004DC853    call        TCustomForm.SetPosition
 004DC858    mov         eax,dword ptr [ebp-4]
 004DC85B    mov         edx,dword ptr [eax]
 004DC85D    call        dword ptr [edx+114]
 004DC863    mov         dword ptr [ebp-8],eax
 004DC866    xor         eax,eax
 004DC868    pop         edx
 004DC869    pop         ecx
 004DC86A    pop         ecx
 004DC86B    mov         dword ptr fs:[eax],edx
 004DC86E    push        4DC883
 004DC873    mov         eax,dword ptr [ebp-4]
 004DC876    call        TObject.Free
 004DC87B    ret
>004DC87C    jmp         @HandleFinally
>004DC881    jmp         004DC873
 004DC883    mov         eax,dword ptr [ebp-8]
 004DC886    pop         esi
 004DC887    pop         ebx
 004DC888    pop         ecx
 004DC889    pop         ecx
 004DC88A    pop         ebp
 004DC88B    ret         8
*}
end;

//004DC890
function MessageDlgPosHelp(const Msg:UnicodeString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:LongInt; X:Integer; Y:Integer; const HelpFileName:UnicodeString):Integer;
begin
{*
 004DC890    push        ebp
 004DC891    mov         ebp,esp
 004DC893    push        ecx
 004DC894    push        ebx
 004DC895    push        esi
 004DC896    push        edi
 004DC897    mov         word ptr [ebp-2],cx
 004DC89B    mov         ebx,edx
 004DC89D    mov         esi,eax
 004DC89F    mov         edi,dword ptr [ebp+14]
 004DC8A2    mov         eax,[0078D080];^gvar_00784C80
 004DC8A7    cmp         dword ptr [eax],6
>004DC8AA    jl          004DC8E2
 004DC8AC    cmp         byte ptr ds:[78640D],0
>004DC8B3    je          004DC8E2
 004DC8B5    call        ThemeServices
 004DC8BA    call        TThemeServices.GetThemesEnabled
 004DC8BF    test        al,al
>004DC8C1    je          004DC8E2
 004DC8C3    movzx       eax,word ptr [ebp-2]
 004DC8C7    push        eax
 004DC8C8    push        edi
 004DC8C9    mov         eax,dword ptr [ebp+10]
 004DC8CC    push        eax
 004DC8CD    mov         eax,dword ptr [ebp+0C]
 004DC8D0    push        eax
 004DC8D1    mov         eax,dword ptr [ebp+8]
 004DC8D4    push        eax
 004DC8D5    mov         ecx,ebx
 004DC8D7    mov         edx,esi
 004DC8D9    xor         eax,eax
 004DC8DB    call        DoTaskMessageDlgPosHelp
>004DC8E0    jmp         004DC901
 004DC8E2    mov         eax,dword ptr [ebp+0C]
 004DC8E5    push        eax
 004DC8E6    mov         eax,dword ptr [ebp+8]
 004DC8E9    push        eax
 004DC8EA    movzx       ecx,word ptr [ebp-2]
 004DC8EE    mov         edx,ebx
 004DC8F0    mov         eax,esi
 004DC8F2    call        CreateMessageDialog
 004DC8F7    mov         ecx,dword ptr [ebp+10]
 004DC8FA    mov         edx,edi
 004DC8FC    call        DoMessageDlgPosHelp
 004DC901    pop         edi
 004DC902    pop         esi
 004DC903    pop         ebx
 004DC904    pop         ecx
 004DC905    pop         ebp
 004DC906    ret         10
*}
end;

//004DC90C
procedure ShowMessage(const Msg:UnicodeString);
begin
{*
 004DC90C    or          ecx,0FFFFFFFF
 004DC90F    or          edx,0FFFFFFFF
 004DC912    call        ShowMessagePos
 004DC917    ret
*}
end;

//004DC918
procedure ShowMessagePos(const Msg:UnicodeString; X:Integer; Y:Integer);
begin
{*
 004DC918    push        0
 004DC91A    push        edx
 004DC91B    push        ecx
 004DC91C    push        0
 004DC91E    mov         dl,4
 004DC920    movzx       ecx,word ptr ds:[4DC930]
 004DC927    call        MessageDlgPosHelp
 004DC92C    ret
*}
end;

//004DCB14
procedure TTaskMessageDialog.DoOnButtonClicked(AModalResult:Integer; var CanClose:Boolean);
begin
{*
 004DCB14    push        esi
 004DCB15    inc         edx
>004DCB16    jne         004DCB24
 004DCB18    mov         byte ptr [ecx],0
 004DCB1B    mov         si,0FFEA
 004DCB1F    call        @CallDynaInst
 004DCB24    pop         esi
 004DCB25    ret
*}
end;

//004DCB28
procedure TTaskMessageDialog.DoOnDialogCreated;
begin
{*
 004DCB28    push        ebx
 004DCB29    push        esi
 004DCB2A    push        edi
 004DCB2B    push        ebp
 004DCB2C    add         esp,0FFFFFFC8
 004DCB2F    mov         ebx,eax
 004DCB31    mov         esi,dword ptr [ebx+0F0]
 004DCB37    mov         edi,dword ptr [ebx+0F4]
 004DCB3D    push        2
 004DCB3F    mov         eax,dword ptr [ebx+0EC]
 004DCB45    push        eax
 004DCB46    call        user32.MonitorFromWindow
 004DCB4B    mov         ebp,eax
 004DCB4D    mov         dword ptr [esp+10],28
 004DCB55    lea         eax,[esp+10]
 004DCB59    push        eax
 004DCB5A    push        ebp
 004DCB5B    call        user32.GetMonitorInfoW
 004DCB60    test        al,al
>004DCB62    je          004DCBC2
 004DCB64    push        esp
 004DCB65    mov         eax,dword ptr [ebx+68]
 004DCB68    push        eax
 004DCB69    call        user32.GetWindowRect
 004DCB6E    test        esi,esi
>004DCB70    jge         004DCB8A
 004DCB72    mov         esi,dword ptr [esp+2C]
 004DCB76    sub         esi,dword ptr [esp+24]
 004DCB7A    mov         eax,dword ptr [esp+8]
 004DCB7E    sub         eax,dword ptr [esp]
 004DCB81    sub         esi,eax
 004DCB83    sar         esi,1
>004DCB85    jns         004DCB8A
 004DCB87    adc         esi,0
 004DCB8A    test        edi,edi
>004DCB8C    jge         004DCBA7
 004DCB8E    mov         edi,dword ptr [esp+30]
 004DCB92    sub         edi,dword ptr [esp+28]
 004DCB96    mov         eax,dword ptr [esp+0C]
 004DCB9A    sub         eax,dword ptr [esp+4]
 004DCB9E    sub         edi,eax
 004DCBA0    sar         edi,1
>004DCBA2    jns         004DCBA7
 004DCBA4    adc         edi,0
 004DCBA7    add         esi,dword ptr [esp+24]
 004DCBAB    add         edi,dword ptr [esp+28]
 004DCBAF    push        15
 004DCBB1    push        0
 004DCBB3    push        0
 004DCBB5    push        edi
 004DCBB6    push        esi
 004DCBB7    push        0
 004DCBB9    mov         eax,dword ptr [ebx+68]
 004DCBBC    push        eax
 004DCBBD    call        user32.SetWindowPos
 004DCBC2    add         esp,38
 004DCBC5    pop         ebp
 004DCBC6    pop         edi
 004DCBC7    pop         esi
 004DCBC8    pop         ebx
 004DCBC9    ret
*}
end;

//004DCBCC
procedure TTaskMessageDialog.DoOnHelp;
begin
{*
 004DCBCC    push        ebp
 004DCBCD    mov         ebp,esp
 004DCBCF    push        0
 004DCBD1    push        0
 004DCBD3    push        0
 004DCBD5    push        ebx
 004DCBD6    push        esi
 004DCBD7    push        edi
 004DCBD8    mov         dword ptr [ebp-0C],eax
 004DCBDB    xor         eax,eax
 004DCBDD    push        ebp
 004DCBDE    push        4DCCB6
 004DCBE3    push        dword ptr fs:[eax]
 004DCBE6    mov         dword ptr fs:[eax],esp
 004DCBE9    mov         eax,dword ptr [ebp-0C]
 004DCBEC    cmp         dword ptr [eax+6C],0
>004DCBF0    je          004DCC98
 004DCBF6    mov         eax,dword ptr [ebp-0C]
 004DCBF9    cmp         dword ptr [eax+0E8],0
>004DCC00    jne         004DCC17
 004DCC02    lea         eax,[ebp-4]
 004DCC05    mov         edx,dword ptr ds:[78D590];^Application:TApplication
 004DCC0B    mov         edx,dword ptr [edx]
 004DCC0D    mov         edx,dword ptr [edx+50]
 004DCC10    call        @UStrLAsg
>004DCC15    jmp         004DCC28
 004DCC17    lea         eax,[ebp-4]
 004DCC1A    mov         edx,dword ptr [ebp-0C]
 004DCC1D    mov         edx,dword ptr [edx+0E8]
 004DCC23    call        @UStrLAsg
 004DCC28    lea         eax,[ebp-8]
 004DCC2B    call        @IntfClear
 004DCC30    call        GetHelpSystem
 004DCC35    test        al,al
>004DCC37    je          004DCC98
 004DCC39    xor         eax,eax
 004DCC3B    push        ebp
 004DCC3C    push        4DCC72
 004DCC41    push        dword ptr fs:[eax]
 004DCC44    mov         dword ptr fs:[eax],esp
 004DCC47    push        1
 004DCC49    mov         eax,dword ptr [ebp-0C]
 004DCC4C    mov         eax,dword ptr [eax+6C]
 004DCC4F    push        eax
 004DCC50    mov         eax,[0078D590];^Application:TApplication
 004DCC55    mov         eax,dword ptr [eax]
 004DCC57    mov         edx,dword ptr [eax+170]
 004DCC5D    mov         ecx,dword ptr [ebp-4]
 004DCC60    mov         eax,dword ptr [ebp-8]
 004DCC63    mov         ebx,dword ptr [eax]
 004DCC65    call        dword ptr [ebx+20]
 004DCC68    xor         eax,eax
 004DCC6A    pop         edx
 004DCC6B    pop         ecx
 004DCC6C    pop         ecx
 004DCC6D    mov         dword ptr fs:[eax],edx
>004DCC70    jmp         004DCC98
>004DCC72    jmp         @HandleOnException
 004DCC77    dd          1
 004DCC7B    dd          00418C04;Exception
 004DCC7F    dd          004DCC83
 004DCC83    mov         esi,eax
 004DCC85    mov         edx,esi
 004DCC87    mov         eax,dword ptr [ebp-0C]
 004DCC8A    mov         si,0FFE4
 004DCC8E    call        @CallDynaInst
 004DCC93    call        @DoneExcept
 004DCC98    xor         eax,eax
 004DCC9A    pop         edx
 004DCC9B    pop         ecx
 004DCC9C    pop         ecx
 004DCC9D    mov         dword ptr fs:[eax],edx
 004DCCA0    push        4DCCBD
 004DCCA5    lea         eax,[ebp-8]
 004DCCA8    call        @IntfClear
 004DCCAD    lea         eax,[ebp-4]
 004DCCB0    call        @UStrClr
 004DCCB5    ret
>004DCCB6    jmp         @HandleFinally
>004DCCBB    jmp         004DCCA5
 004DCCBD    pop         edi
 004DCCBE    pop         esi
 004DCCBF    pop         ebx
 004DCCC0    mov         esp,ebp
 004DCCC2    pop         ebp
 004DCCC3    ret
*}
end;

//004DCCC4
procedure TTaskMessageDialog.Execute(ParentWnd:HWND);
begin
{*
 004DCCC4    mov         dword ptr [eax+0EC],edx
 004DCCCA    call        TCustomTaskDialog.Execute
 004DCCCF    ret
*}
end;

//004DCCD0
function DoTaskMessageDlgPosHelp(const Instruction:UnicodeString; const Msg:UnicodeString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:LongInt; X:Integer; Y:Integer; const HelpFileName:UnicodeString; DefaultButton:TMsgDlgBtn):Integer;
begin
{*
 004DCCD0    push        ebp
 004DCCD1    mov         ebp,esp
 004DCCD3    add         esp,0FFFFFFD8
 004DCCD6    push        ebx
 004DCCD7    push        esi
 004DCCD8    push        edi
 004DCCD9    xor         ebx,ebx
 004DCCDB    mov         dword ptr [ebp-28],ebx
 004DCCDE    mov         dword ptr [ebp-24],ebx
 004DCCE1    mov         byte ptr [ebp-9],cl
 004DCCE4    mov         dword ptr [ebp-8],edx
 004DCCE7    mov         dword ptr [ebp-4],eax
 004DCCEA    xor         eax,eax
 004DCCEC    push        ebp
 004DCCED    push        4DCE9F
 004DCCF2    push        dword ptr fs:[eax]
 004DCCF5    mov         dword ptr fs:[eax],esp
 004DCCF8    xor         ecx,ecx
 004DCCFA    mov         dl,1
 004DCCFC    mov         eax,[004DC934];TTaskMessageDialog
 004DCD01    call        TCustomTaskDialog.Create
 004DCD06    mov         dword ptr [ebp-14],eax
 004DCD09    xor         eax,eax
 004DCD0B    push        ebp
 004DCD0C    push        4DCE7D
 004DCD11    push        dword ptr fs:[eax]
 004DCD14    mov         dword ptr fs:[eax],esp
 004DCD17    xor         ebx,ebx
 004DCD19    mov         esi,78661C;^SResString248:TResStringRec
 004DCD1E    mov         edi,7866C0
 004DCD23    mov         eax,ebx
 004DCD25    cmp         al,0F
>004DCD27    ja          004DCD31
 004DCD29    and         eax,7F
 004DCD2C    bt          word ptr [ebp+1C],ax
>004DCD31    jae         004DCD6C
 004DCD33    mov         eax,dword ptr [ebp-14]
 004DCD36    mov         eax,dword ptr [eax+38]
 004DCD39    call        TTaskDialogButtons.Add
 004DCD3E    mov         dword ptr [ebp-18],eax
 004DCD41    lea         edx,[ebp-24]
 004DCD44    mov         eax,dword ptr [esi]
 004DCD46    call        LoadResString
 004DCD4B    mov         edx,dword ptr [ebp-24]
 004DCD4E    mov         eax,dword ptr [ebp-18]
 004DCD51    call        TTaskDialogBaseButtonItem.SetCaption
 004DCD56    cmp         bl,byte ptr [ebp+8]
 004DCD59    sete        dl
 004DCD5C    mov         eax,dword ptr [ebp-18]
 004DCD5F    call        TTaskDialogBaseButtonItem.SetDefault
 004DCD64    mov         eax,dword ptr [edi]
 004DCD66    mov         edx,dword ptr [ebp-18]
 004DCD69    mov         dword ptr [edx+18],eax
 004DCD6C    inc         ebx
 004DCD6D    add         edi,4
 004DCD70    add         esi,4
 004DCD73    cmp         bl,0C
>004DCD76    jne         004DCD23
 004DCD78    cmp         byte ptr [ebp-9],4
>004DCD7C    je          004DCD96
 004DCD7E    mov         eax,dword ptr [ebp-14]
 004DCD81    lea         edx,[eax+3C]
 004DCD84    movzx       eax,byte ptr [ebp-9]
 004DCD88    mov         eax,dword ptr [eax*4+7865F4];^SResString244:TResStringRec
 004DCD8F    call        LoadResString
>004DCD94    jmp         004DCDB3
 004DCD96    lea         edx,[ebp-28]
 004DCD99    mov         eax,[0078D590];^Application:TApplication
 004DCD9E    mov         eax,dword ptr [eax]
 004DCDA0    call        TApplication.GetTitle
 004DCDA5    mov         edx,dword ptr [ebp-28]
 004DCDA8    mov         eax,dword ptr [ebp-14]
 004DCDAB    add         eax,3C
 004DCDAE    call        @UStrAsg
 004DCDB3    mov         eax,dword ptr [ebp-14]
 004DCDB6    movzx       edx,byte ptr ds:[4DCEB4]
 004DCDBD    mov         byte ptr [eax+40],dl
 004DCDC0    mov         eax,[0078D590];^Application:TApplication
 004DCDC5    mov         eax,dword ptr [eax]
 004DCDC7    call        TApplication.UseRightToLeftReading
 004DCDCC    test        al,al
>004DCDCE    je          004DCDE6
 004DCDD0    mov         eax,dword ptr [ebp-14]
 004DCDD3    movzx       edx,word ptr [eax+5C]
 004DCDD7    or          dx,word ptr ds:[4DCEB8]
 004DCDDE    mov         eax,dword ptr [ebp-14]
 004DCDE1    call        TCustomTaskDialog.SetFlags
 004DCDE6    mov         eax,dword ptr [ebp-14]
 004DCDE9    mov         edx,dword ptr [ebp+18]
 004DCDEC    mov         dword ptr [eax+6C],edx
 004DCDEF    mov         eax,dword ptr [ebp-14]
 004DCDF2    add         eax,0E8
 004DCDF7    mov         edx,dword ptr [ebp+0C]
 004DCDFA    call        @UStrAsg
 004DCDFF    movzx       eax,byte ptr [ebp-9]
 004DCE03    mov         edx,dword ptr [eax*4+7866AC]
 004DCE0A    mov         eax,dword ptr [ebp-14]
 004DCE0D    call        TCustomTaskDialog.SetMainIcon
 004DCE12    mov         eax,dword ptr [ebp+14]
 004DCE15    mov         dword ptr [ebp-20],eax
 004DCE18    mov         eax,dword ptr [ebp+10]
 004DCE1B    mov         dword ptr [ebp-1C],eax
 004DCE1E    mov         eax,dword ptr [ebp-14]
 004DCE21    mov         edx,dword ptr [ebp-20]
 004DCE24    mov         dword ptr [eax+0F0],edx
 004DCE2A    mov         edx,dword ptr [ebp-1C]
 004DCE2D    mov         dword ptr [eax+0F4],edx
 004DCE33    mov         edx,dword ptr [ebp-8]
 004DCE36    mov         eax,dword ptr [ebp-14]
 004DCE39    call        TCustomTaskDialog.SetText
 004DCE3E    mov         edx,dword ptr [ebp-4]
 004DCE41    mov         eax,dword ptr [ebp-14]
 004DCE44    call        TCustomTaskDialog.SetTitle
 004DCE49    xor         eax,eax
 004DCE4B    mov         dword ptr [ebp-10],eax
 004DCE4E    mov         eax,dword ptr [ebp-14]
 004DCE51    mov         si,0FFE2
 004DCE55    call        @CallDynaInst
 004DCE5A    test        al,al
>004DCE5C    je          004DCE67
 004DCE5E    mov         eax,dword ptr [ebp-14]
 004DCE61    mov         eax,dword ptr [eax+74]
 004DCE64    mov         dword ptr [ebp-10],eax
 004DCE67    xor         eax,eax
 004DCE69    pop         edx
 004DCE6A    pop         ecx
 004DCE6B    pop         ecx
 004DCE6C    mov         dword ptr fs:[eax],edx
 004DCE6F    push        4DCE84
 004DCE74    mov         eax,dword ptr [ebp-14]
 004DCE77    call        TObject.Free
 004DCE7C    ret
>004DCE7D    jmp         @HandleFinally
>004DCE82    jmp         004DCE74
 004DCE84    xor         eax,eax
 004DCE86    pop         edx
 004DCE87    pop         ecx
 004DCE88    pop         ecx
 004DCE89    mov         dword ptr fs:[eax],edx
 004DCE8C    push        4DCEA6
 004DCE91    lea         eax,[ebp-28]
 004DCE94    mov         edx,2
 004DCE99    call        @UStrArrayClr
 004DCE9E    ret
>004DCE9F    jmp         @HandleFinally
>004DCEA4    jmp         004DCE91
 004DCEA6    mov         eax,dword ptr [ebp-10]
 004DCEA9    pop         edi
 004DCEAA    pop         esi
 004DCEAB    pop         ebx
 004DCEAC    mov         esp,ebp
 004DCEAE    pop         ebp
 004DCEAF    ret         18
*}
end;

//004DCEBC
function DoTaskMessageDlgPosHelp(const Instruction:UnicodeString; const Msg:UnicodeString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:LongInt; X:Integer; Y:Integer; const HelpFileName:UnicodeString):Integer;
begin
{*
 004DCEBC    push        ebp
 004DCEBD    mov         ebp,esp
 004DCEBF    push        ecx
 004DCEC0    push        esi
 004DCEC1    push        edi
 004DCEC2    mov         byte ptr [ebp-1],cl
 004DCEC5    mov         edi,eax
 004DCEC7    mov         esi,dword ptr [ebp+18]
 004DCECA    test        si,4
>004DCECF    je          004DCED5
 004DCED1    mov         al,2
>004DCED3    jmp         004DCEE2
 004DCED5    test        si,1
>004DCEDA    je          004DCEE0
 004DCEDC    xor         eax,eax
>004DCEDE    jmp         004DCEE2
 004DCEE0    mov         al,5
 004DCEE2    push        esi
 004DCEE3    mov         ecx,dword ptr [ebp+14]
 004DCEE6    push        ecx
 004DCEE7    mov         ecx,dword ptr [ebp+10]
 004DCEEA    push        ecx
 004DCEEB    mov         ecx,dword ptr [ebp+0C]
 004DCEEE    push        ecx
 004DCEEF    mov         ecx,dword ptr [ebp+8]
 004DCEF2    push        ecx
 004DCEF3    push        eax
 004DCEF4    movzx       ecx,byte ptr [ebp-1]
 004DCEF8    mov         eax,edi
 004DCEFA    call        DoTaskMessageDlgPosHelp
 004DCEFF    pop         edi
 004DCF00    pop         esi
 004DCF01    pop         ecx
 004DCF02    pop         ebp
 004DCF03    ret         14
*}
end;

//004DCF08
procedure InitGlobals;
begin
{*
 004DCF08    add         esp,0FFFFFFB0
 004DCF0B    push        4DCF6C
 004DCF10    call        user32.RegisterWindowMessageW
 004DCF15    mov         [007932A8],eax
 004DCF1A    push        4DCF88
 004DCF1F    call        user32.RegisterWindowMessageW
 004DCF24    mov         [007932AC],eax
 004DCF29    push        1
 004DCF2B    mov         eax,[00790C38];gvar_00790C38
 004DCF30    mov         dword ptr [esp+44],eax
 004DCF34    mov         byte ptr [esp+48],0
 004DCF39    call        kernel32.GetCurrentThreadId
 004DCF3E    mov         dword ptr [esp+4C],eax
 004DCF42    mov         byte ptr [esp+50],0
 004DCF47    lea         ecx,[esp+44]
 004DCF4B    mov         edx,4DCFB0
 004DCF50    lea         eax,[esp+4]
 004DCF54    call        StrFmt
 004DCF59    push        eax
 004DCF5A    call        kernel32.GlobalAddAtomW
 004DCF5F    mov         [00786414],ax
 004DCF65    add         esp,50
 004DCF68    ret
*}
end;

Initialization
//00780B60
{*
 00780B60    sub         dword ptr ds:[7932A4],1
>00780B67    jae         00780B9C
 00780B69    mov         eax,4DCFD8
 00780B6E    call        @InitImports
 00780B73    call        InitGlobals
 00780B78    mov         eax,[0047A16C];TControl
 00780B7D    call        StartClassGroup
 00780B82    mov         eax,[0047A16C];TControl
 00780B87    call        ActivateClassGroup
 00780B8C    mov         edx,dword ptr ds:[47A16C];TControl
 00780B92    mov         eax,[004D1530];TCommonDialog
 00780B97    call        GroupDescendentsWith
 00780B9C    ret
*}
Finalization
//004DD09C
{*
 004DD09C    push        ebp
 004DD09D    mov         ebp,esp
 004DD09F    xor         eax,eax
 004DD0A1    push        ebp
 004DD0A2    push        4DD0EF
 004DD0A7    push        dword ptr fs:[eax]
 004DD0AA    mov         dword ptr fs:[eax],esp
 004DD0AD    inc         dword ptr ds:[7932A4]
>004DD0B3    jne         004DD0E1
 004DD0B5    cmp         word ptr ds:[786414],0
>004DD0BD    je          004DD0CC
 004DD0BF    movzx       eax,word ptr ds:[786414]
 004DD0C6    push        eax
 004DD0C7    call        kernel32.GlobalDeleteAtom
 004DD0CC    mov         eax,78664C;^'Yes'
 004DD0D1    mov         ecx,0C
 004DD0D6    mov         edx,dword ptr ds:[40128C];string
 004DD0DC    call        @FinalizeArray
 004DD0E1    xor         eax,eax
 004DD0E3    pop         edx
 004DD0E4    pop         ecx
 004DD0E5    pop         ecx
 004DD0E6    mov         dword ptr fs:[eax],edx
 004DD0E9    push        4DD0F6
 004DD0EE    ret
>004DD0EF    jmp         @HandleFinally
>004DD0F4    jmp         004DD0EE
 004DD0F6    pop         ebp
 004DD0F7    ret
*}
end.