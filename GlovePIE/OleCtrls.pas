//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit OleCtrls;

interface

uses
  SysUtils, Classes, OleCtrls;

type
  TEventDispatch = class(TObject)
  published
    constructor Create;//007077CC
  public
    FControl:TOleControl;//f4
    function Invoke(DispID:Integer; const IID:TGUID; LocaleID:Integer; Flags:Word; var Params:void ; VarResult:Pointer; ExcepInfo:Pointer; ArgErr:Pointer):HRESULT; virtual; stdcall;//v0//007078B4
    function _AddRef:Integer; stdcall;//0070785C
    function _Release:Integer; stdcall;//00707870
    function GetTypeInfoCount(var Count:Integer):HRESULT; stdcall;//00707884
    function GetTypeInfo(Index:Integer; LocaleID:Integer; var TypeInfo:void ):HRESULT; stdcall;//00707894
    function GetIDsOfNames(const IID:TGUID; Names:Pointer; NameCount:Integer; LocaleID:Integer; DispIDs:Pointer):HRESULT; stdcall;//007078A8
  end;
  TEnumValue = TEnumValue = record//size=8
f4:string;//f4
end;
Value:Integer;//f0
Ident:string;//f4
end;;
  TEnumValueList = array [1..32768] of TEnumValue;
  TEnumPropDesc = class(TObject)
  published
    function StringToValue(S:string):Integer;//00707B50
    function ValueToString(V:Integer):string;//00707C80
    procedure GetStrings(Proc:TGetStrProc);//00707A98
    constructor Create(TypeInfo:ITypeInfo; ValueCount:Integer);//007078FC
    destructor Destroy();//00707A58
  public
    FDispID:Integer;//f4
    FValueCount:Integer;//f8
    FValues:PEnumValueList;//fC
  end;
  TControlData = TControlData = record//size=50
ClassID:TGUID;//f0
EventIID:TGUID;//f10
EventCount:Integer;//f20
EventDispIDs:Pointer;//f24
LicenseKey:Pointer;//f28
Flags:Cardinal;//f2C
Version:Integer;//f30
FontCount:Integer;//f34
FontIDs:PDispIDList;//f38
PictureCount:Integer;//f3C
PictureIDs:PDispIDList;//f40
Reserved:Integer;//f44
InstanceCount:Integer;//f48
EnumPropDescs:TList;//f4C
end;;
  TServiceQuery = function(const rsid:TGUID; const iid:TGUID; obj:?):HRESULT of object;;
  TOleControl = class(TWinControl)
  published
    procedure SetPropDisplayString(DispID:Integer; Value:string);//0070A0F4
    procedure ShowAboutBox;//0070A3E4
    procedure SetBounds(ALeft:Integer; ATop:Integer; AHeight:Integer; AWidth:Integer);//00709D24
    function GetEnumPropDesc(DispID:Integer):TEnumPropDesc;//00708E84
    procedure DoObjectVerb(Verb:Integer);//00708DB8
    procedure GetObjectVerbs(List:TStrings);//0070927C
    function GetHelpContext(Member:string; var HelpCtx:Integer; var HelpFile:string):Boolean;//00709048
    destructor Destroy();//00707F70
    constructor Create;//00707D04
    //procedure DefaultHandler(var Message:?);//00708B18
    procedure BrowseProperties;//00708024
    procedure IsPropPageProperty(DispID:Integer);//00709B68
    function IsCustomProperty(DispID:Integer):Boolean;//00709B00
    function GetPropDisplayString(DispID:Integer):string;//00709430
    procedure GetPropDisplayStrings(DispID:Integer; List:TStrings);//007094B0
  public
    FControlData:PControlData;//f270
    FRefCount:Integer;//f274
    FEventDispatch:TEventDispatch;//f278
    FObjectData:Cardinal;//f27C
    FOleObject:IOleObject;//f280
    FPersistStream:IPersistStreamInit;//f284
    FOleControl:IOleControl;//f288
    FControlDispatch:IDispatch;//f28C
    FPropBrowsing:IPerPropertyBrowsing;//f290
    FOleInPlaceObject:IOleInPlaceObject;//f294
    FOleInPlaceActiveObject:IOleInPlaceActiveObject;//f298
    FPropConnection:Integer;//f29C
    FEventsConnection:Integer;//f2A0
    FMiscStatus:Integer;//f2A4
    FFonts:TList;//f2A8
    FPictures:TList;//f2AC
    FUpdatingPictures:Boolean;//f2B0
    FUpdatingColor:Boolean;//f2B1
    FUpdatingFont:Boolean;//f2B2
    FUpdatingEnabled:Boolean;//f2B3
    FServiceQuery:TServiceQuery;//f2B8
    FControlInfo:tagCONTROLINFO;//f2C0
    //procedure DefaultHandler(var Message:?); virtual;//00708B18
    destructor Destroy(); virtual;//00707F70
    procedure DefineProperties(Filer:TFiler); virtual;//v4//00708BD0
    procedure SetName(const Value:TComponentName); virtual;//v18//00709E3C
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; virtual; stdcall;//v28//0070AC24
    constructor Create; virtual;//v2C//00707D04
    procedure SetParent(AParent:TWinControl); virtual;//v78//00709F24
    procedure WndProc(var Message:TMessage); virtual;//v84//0070A604
    procedure SetBounds(ALeft:Integer; ATop:Integer; AHeight:Integer; AWidth:Integer); virtual;//v98//00709D24
    procedure CreateWnd; virtual;//vB4//00708A74
    procedure DestroyWindowHandle; virtual;//vC4//00708D6C
    procedure StandardEvent(DispID:TDispID; var Params:TDispParams); virtual;//vEC//0070A3F4
    procedure InvokeEvent(DispID:TDispID; var Params:TDispParams); virtual;//vF0//00709920
    procedure vF4; virtual; abstract;//vF4//00404A58
    procedure vF8; virtual;//vF8//00709A40
    function SuppressException(E:Exception):Boolean; virtual;//vFC//00708BA8
    //function v100(?:?):?; virtual;//v100//0070B360
    function SetStatusText(pszStatusText:POleStr):HRESULT; virtual; stdcall;//v104//0070B578
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//0070A814
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//0070A7F4
    procedure CMDialogKey(var Message:TMessage); message CM_DIALOGKEY;//0070AAF0
    procedure CMEnabledChanged(var Message:TMessage); message CM_ENABLEDCHANGED;//0070A964
    procedure CMColorChanged(var Message:TMessage); message CM_COLORCHANGED;//0070A8E0
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//0070A9F0
    procedure CMUIActivate(var Message:TMessage); message CM_UIACTIVATE;//0070AB8C
    procedure CMUIDeactivate(var Message:TMessage); message CM_UIDEACTIVATE;//0070ABDC
    procedure CMDocWindowActivate(var Message:TMessage); message CM_DOCWINDOWACTIVATE;//0070A884
    procedure PaletteChanged(Foreground:Boolean); dynamic;//00709BAC
    procedure CreateControl;//00708030
    procedure CreateEnumPropDescs;//0070870C
    procedure CreateInstance;//0070884C
    procedure CreateStorage;//00708994
    procedure DesignModified;//00708C84
    procedure DestroyControl;//00708CA4
    procedure DestroyEnumPropDescs;//00708D0C
    procedure DestroyStorage;//00708D4C
    procedure GetEventMethod(DispID:TDispID; var Method:TMethod);//00708EC4
    function GetIntegerProp(Index:Integer):Integer;//00709214
    function GetMainMenu:TMainMenu;//00709228
    function GetOleBoolProp(Index:Integer):TOleBool;//00709358
    function GetOleObject:Variant;//0070936C
    function GetDefaultDispatch:IDispatch;//007093DC
    function GetOleVariantProp(Index:Integer):OleVariant;//00709410
    procedure GetProperty(Index:Integer; var Value:TVarData);//007095AC
    function GetStringProp(Index:Integer):UnicodeString;//0070963C
    function GetVariantProp(Index:Integer):Variant;//00709698
    procedure HookControlWndProc;//007096B0
    procedure D2InvokeEvent(DispID:TDispID; var Params:TDispParams);//00709780
    procedure InvokeMethod(const DispInfo:void ; Result:Pointer);//00709A44
    procedure PictureChanged(Sender:TObject);//00709BFC
    procedure ReadData(Stream:TStream);//00709C68
    procedure SetColorProp(Index:Integer; Value:TColor);//00709E04
    procedure SetIDispatchProp(Index:Integer; const Value:IDispatch);//00709E0C
    procedure SetIntegerProp(Index:Integer; Value:Integer);//00709E24
    procedure SetOleBoolProp(Index:Integer; Value:TOleBool);//00709EF0
    procedure SetOleVariantProp(Index:Integer; const Value:OleVariant);//00709F1C
    procedure SetTPictureProp(Index:Integer; Value:TPicture);//0070A004
    procedure SetProperty(Index:Integer; const Value:TVarData);//0070A218
    procedure SetStringProp(Index:Integer; const Value:UnicodeString);//0070A2D0
    procedure SetUIActive(Active:Boolean);//0070A330
    procedure SetVariantProp(Index:Integer; const Value:Variant);//0070A388
    procedure WriteData(Stream:TStream);//0070A6EC
    function _AddRef:Integer; stdcall;//0070AC4C
    function _Release:Integer; stdcall;//0070AC64
    function CanInPlaceActivate:HRESULT; stdcall;//0070AC7C
    function GetMoniker(dwAssign:LongInt; dwWhichMoniker:LongInt; var mk:IMoniker):HRESULT; stdcall;//0070AC88
    function GetContainer(var container:IOleContainer):HRESULT; stdcall;//0070ACA0
    function ShowObject:HRESULT; stdcall;//0070ACB8
    function ContextSensitiveHelp(fEnterMode:BOOL):HRESULT; stdcall;//0070ACCC
    function RequestNewObjectLayout:HRESULT; stdcall;//0070ACD8
    function DiscardUndoState:HRESULT; stdcall;//0070AD7C
    function LockInPlaceActive(fLock:BOOL):HRESULT; stdcall;//0070AD88
    function GetExtendedControl(var disp:IDispatch):HRESULT; stdcall;//0070AD94
    function TransformCoords(var ptlHimetric:TPoint; var ptfContainer:TPointF; flags:LongInt):HRESULT; stdcall;//0070ADAC
    function OleControlSite_TranslateAccelerator(msg:PMsg; grfModifiers:LongInt):HRESULT; stdcall;//0070AE4C
    function OnFocus(fGotFocus:BOOL):HRESULT; stdcall;//0070AE58
    function OnControlInfoChanged:HRESULT; stdcall;//0070AE64
    function EnableModeless(fEnable:BOOL):HRESULT; stdcall;//0070AE70
    function OleInPlaceSite_GetWindow(var wnd:HWND):HRESULT; stdcall;//0070AE7C
    function SaveObject:HRESULT; stdcall;//0070AEA8
    function OnInPlaceActivate:HRESULT; stdcall;//0070AEB4
    function OnUIActivate:HRESULT; stdcall;//0070AF1C
    function GetWindowContext(var frame:IOleInPlaceFrame; var doc:IOleInPlaceUIWindow; var rcPosRect:TRect; var rcClipRect:TRect; var frameInfo:TOleInPlaceFrameInfo):HRESULT; stdcall;//0070AF30
    function Scroll(scrollExtent:TPoint):HRESULT; stdcall;//0070AFC4
    function OnUIDeactivate(fUndoable:BOOL):HRESULT; stdcall;//0070AFD0
    function OnInPlaceDeactivate:HRESULT; stdcall;//0070AFF4
    function ShowPropertyFrame:HRESULT; stdcall;//0070B018
    function DeactivateAndUndo:HRESULT; stdcall;//0070B024
    function OnPosRectChange(const rcPosRect:TRect):HRESULT; stdcall;//0070B03C
    function GetBorder(var rectBorder:TRect):HRESULT; stdcall;//0070B07C
    function RequestBorderSpace(const borderwidths:TRect):HRESULT; stdcall;//0070B088
    function SetBorderSpace(pborderwidths:PRect):HRESULT; stdcall;//0070B094
    function SetActiveObject(const activeObject:IOleInPlaceActiveObject; pszObjName:POleStr):HRESULT; stdcall;//0070B0A0
    function OleInPlaceFrame_GetWindow(var wnd:HWND):HRESULT; stdcall;//0070B0AC
    function InsertMenus(hmenuShared:HMENU; var menuWidths:TOleMenuGroupWidths):HRESULT; stdcall;//0070B0C8
    function SetMenu(hmenuShared:HMENU; holemenu:HMENU; hwndActiveObject:HWND):HRESULT; stdcall;//0070B108
    function RemoveMenus(hmenuShared:HMENU):HRESULT; stdcall;//0070B140
    function OnRequestEdit(dispid:TDispID):HRESULT; stdcall;//0070B168
    function OnShowWindow(fShow:BOOL):HRESULT; stdcall;//0070B174
    function OleInPlaceFrame_TranslateAccelerator(var msg:TMsg; wID:Word):HRESULT; stdcall;//0070B180
    function GetTypeInfoCount(var Count:Integer):HRESULT; stdcall;//0070B18C
    function GetTypeInfo(Index:Integer; LocaleID:Integer; var TypeInfo:void ):HRESULT; stdcall;//0070B19C
    function GetIDsOfNames(const IID:TGUID; Names:Pointer; NameCount:Integer; LocaleID:Integer; DispIDs:Pointer):HRESULT; stdcall;//0070B1B0
    function Invoke(DispID:Integer; const IID:TGUID; LocaleID:Integer; Flags:Word; var Params:void ; VarResult:Pointer; ExcepInfo:Pointer; ArgErr:Pointer):HRESULT; stdcall;//0070B1BC
    function PostMessageFilter(wnd:HWND; msg:Integer; wp:Integer; lp:Integer; var res:Integer; Cookie:LongInt):HRESULT; stdcall;//0070B584
    function PreMessageFilter(wnd:HWND; msg:Integer; wp:Integer; lp:Integer; var res:Integer; var Cookie:LongInt):HRESULT; stdcall;//0070B590
    function QueryService(const rsid:TGUID; const iid:TGUID; var obj:void ):HRESULT; stdcall;//0070B59C
  end;
    function FontToOleFont(Font:TFont):Variant;//007076E4
    procedure OleFontToFont(const OleFont:Variant; Font:TFont);//00707730
    function StringToVarOleStr(const S:UnicodeString):Variant;//007077AC
    //function sub_007077F0(?:?; ?:?; ?:?):?;//007077F0
    function Invoke(DispID:Integer; const IID:TGUID; LocaleID:Integer; Flags:Word; var Params:void ; VarResult:Pointer; ExcepInfo:Pointer; ArgErr:Pointer):HRESULT; stdcall;//007078B4
    procedure FreeList(var L:TList);//00707F38
    function FindMember(DispId:Integer):Boolean;//00708350
    procedure CreateEnum(TypeDesc:TTypeDesc; const TypeInfo:ITypeInfo; DispId:Integer);//0070838C
    procedure ProcessTypeInfo(const TypeInfo:ITypeInfo);//0070847C
    procedure LicenseCheck(Status:HRESULT; const Ident:UnicodeString);//007087CC
    procedure CreateWnd;//00708A74
    function SuppressException(E:Exception):Boolean;//00708BA8
    procedure DefineProperties(Filer:TFiler);//00708BD0
    procedure DestroyWindowHandle;//00708D6C
    procedure Exchange(var A:void ; var B:void );//00708F24
    function Find(const MemberStr:UnicodeString; var TypeInfo:ITypeInfo):Boolean;//00708F2C
    procedure CallEventMethod(const EventInfo:TEventInfo);//00709740
    procedure InvokeEvent(DispID:TDispID; var Params:TDispParams);//00709920
    procedure GetStringResult(BStr:TBStr; var Result:AnsiString);//00709A00
    procedure sub_00709A40;//00709A40
    procedure PaletteChanged(Foreground:Boolean);//00709BAC
    procedure SetName(const Value:TComponentName);//00709E3C
    procedure SetParent(AParent:TWinControl);//00709F24
    procedure StandardEvent(DispID:TDispID; var Params:TDispParams);//0070A3F4
    procedure WndProc(var Message:TMessage);//0070A604
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//0070A7F4
    procedure WMPaint(var Message:TWMPaint);//0070A814
    procedure CMDocWindowActivate(var Message:TMessage);//0070A884
    procedure CMColorChanged(var Message:TMessage);//0070A8E0
    procedure CMEnabledChanged(var Message:TMessage);//0070A964
    procedure CMFontChanged(var Message:TMessage);//0070A9F0
    procedure CMDialogKey(var Message:TMessage);//0070AAF0
    procedure CMUIActivate(var Message:TMessage);//0070AB8C
    procedure CMUIDeactivate(var Message:TMessage);//0070ABDC
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;//0070AC24
    //function sub_0070B360(?:?):?;//0070B360
    function SetStatusText(pszStatusText:POleStr):HRESULT; stdcall;//0070B578

implementation

//007076E4
function FontToOleFont(Font:TFont):Variant;
begin
{*
 007076E4    push        ebp
 007076E5    mov         ebp,esp
 007076E7    push        0
 007076E9    push        ebx
 007076EA    mov         ebx,edx
 007076EC    xor         edx,edx
 007076EE    push        ebp
 007076EF    push        707722
 007076F4    push        dword ptr fs:[edx]
 007076F7    mov         dword ptr fs:[edx],esp
 007076FA    lea         edx,[ebp-4]
 007076FD    call        GetOleFont
 00707702    mov         eax,ebx
 00707704    mov         edx,dword ptr [ebp-4]
 00707707    call        @VarFromDisp
 0070770C    xor         eax,eax
 0070770E    pop         edx
 0070770F    pop         ecx
 00707710    pop         ecx
 00707711    mov         dword ptr fs:[eax],edx
 00707714    push        707729
 00707719    lea         eax,[ebp-4]
 0070771C    call        @IntfClear
 00707721    ret
>00707722    jmp         @HandleFinally
>00707727    jmp         00707719
 00707729    pop         ebx
 0070772A    pop         ecx
 0070772B    pop         ebp
 0070772C    ret
*}
end;

//00707730
procedure OleFontToFont(const OleFont:Variant; Font:TFont);
begin
{*
 00707730    push        ebp
 00707731    mov         ebp,esp
 00707733    push        0
 00707735    push        0
 00707737    push        ebx
 00707738    push        esi
 00707739    mov         esi,edx
 0070773B    mov         ebx,eax
 0070773D    xor         eax,eax
 0070773F    push        ebp
 00707740    push        70778D
 00707745    push        dword ptr fs:[eax]
 00707748    mov         dword ptr fs:[eax],esp
 0070774B    lea         eax,[ebp-8]
 0070774E    mov         edx,ebx
 00707750    call        @VarToIntf
 00707755    mov         edx,dword ptr [ebp-8]
 00707758    lea         eax,[ebp-4]
 0070775B    mov         ecx,70779C
 00707760    call        @IntfCast
 00707765    mov         edx,dword ptr [ebp-4]
 00707768    mov         eax,esi
 0070776A    call        SetOleFont
 0070776F    xor         eax,eax
 00707771    pop         edx
 00707772    pop         ecx
 00707773    pop         ecx
 00707774    mov         dword ptr fs:[eax],edx
 00707777    push        707794
 0070777C    lea         eax,[ebp-8]
 0070777F    call        @IntfClear
 00707784    lea         eax,[ebp-4]
 00707787    call        @IntfClear
 0070778C    ret
>0070778D    jmp         @HandleFinally
>00707792    jmp         0070777C
 00707794    pop         esi
 00707795    pop         ebx
 00707796    pop         ecx
 00707797    pop         ecx
 00707798    pop         ebp
 00707799    ret
*}
end;

//007077AC
function StringToVarOleStr(const S:UnicodeString):Variant;
begin
{*
 007077AC    push        ebx
 007077AD    push        esi
 007077AE    mov         ebx,edx
 007077B0    mov         esi,eax
 007077B2    mov         eax,ebx
 007077B4    call        @VarClear
 007077B9    mov         eax,esi
 007077BB    call        00409460
 007077C0    mov         dword ptr [ebx+8],eax
 007077C3    mov         word ptr [ebx],8
 007077C8    pop         esi
 007077C9    pop         ebx
 007077CA    ret
*}
end;

//007077CC
constructor TEventDispatch.Create;
begin
{*
 007077CC    test        dl,dl
>007077CE    je          007077D8
 007077D0    add         esp,0FFFFFFF0
 007077D3    call        @ClassCreate
 007077D8    mov         dword ptr [eax+4],ecx
 007077DB    test        dl,dl
>007077DD    je          007077EE
 007077DF    call        @AfterConstruction
 007077E4    pop         dword ptr fs:[0]
 007077EB    add         esp,0C
 007077EE    ret
*}
end;

//007077F0
{*function sub_007077F0(?:?; ?:?; ?:?):?;
begin
 007077F0    push        ebp
 007077F1    mov         ebp,esp
 007077F3    push        ebx
 007077F4    push        esi
 007077F5    push        edi
 007077F6    mov         esi,dword ptr [ebp+0C]
 007077F9    mov         ebx,dword ptr [ebp+8]
 007077FC    mov         ecx,dword ptr [ebp+10]
 007077FF    mov         edx,esi
 00707801    mov         eax,ebx
 00707803    call        TObject.GetInterface
 00707808    test        al,al
>0070780A    je          00707810
 0070780C    xor         eax,eax
>0070780E    jmp         00707843
 00707810    mov         edi,dword ptr [ebx+4]
 00707813    test        edi,edi
>00707815    je          0070783E
 00707817    mov         eax,dword ptr [edi+270]
 0070781D    add         eax,10
 00707820    push        eax
 00707821    push        esi
 00707822    call        ole32.IsEqualGUID
 00707827    test        al,al
>00707829    je          0070783E
 0070782B    mov         ecx,dword ptr [ebp+10]
 0070782E    mov         edx,70784C;['{00020400-0000-0000-C000-000000000046}']
 00707833    mov         eax,ebx
 00707835    call        TObject.GetInterface
 0070783A    xor         eax,eax
>0070783C    jmp         00707843
 0070783E    mov         eax,80004002
 00707843    pop         edi
 00707844    pop         esi
 00707845    pop         ebx
 00707846    pop         ebp
 00707847    ret         0C
end;*}

//0070785C
function TEventDispatch._AddRef:Integer; stdcall;
begin
{*
 0070785C    push        ebp
 0070785D    mov         ebp,esp
 0070785F    mov         eax,dword ptr [ebp+8]
 00707862    mov         eax,dword ptr [eax+4]
 00707865    push        eax
 00707866    call        TOleControl._AddRef
 0070786B    pop         ebp
 0070786C    ret         4
*}
end;

//00707870
function TEventDispatch._Release:Integer; stdcall;
begin
{*
 00707870    push        ebp
 00707871    mov         ebp,esp
 00707873    mov         eax,dword ptr [ebp+8]
 00707876    mov         eax,dword ptr [eax+4]
 00707879    push        eax
 0070787A    call        TOleControl._Release
 0070787F    pop         ebp
 00707880    ret         4
*}
end;

//00707884
function TEventDispatch.GetTypeInfoCount(var Count:Integer):HRESULT; stdcall;
begin
{*
 00707884    push        ebp
 00707885    mov         ebp,esp
 00707887    mov         eax,dword ptr [ebp+0C]
 0070788A    xor         edx,edx
 0070788C    mov         dword ptr [eax],edx
 0070788E    xor         eax,eax
 00707890    pop         ebp
 00707891    ret         8
*}
end;

//00707894
function TEventDispatch.GetTypeInfo(Index:Integer; LocaleID:Integer; var TypeInfo:void ):HRESULT; stdcall;
begin
{*
 00707894    push        ebp
 00707895    mov         ebp,esp
 00707897    mov         eax,dword ptr [ebp+14]
 0070789A    xor         edx,edx
 0070789C    mov         dword ptr [eax],edx
 0070789E    mov         eax,80004001
 007078A3    pop         ebp
 007078A4    ret         10
*}
end;

//007078A8
function TEventDispatch.GetIDsOfNames(const IID:TGUID; Names:Pointer; NameCount:Integer; LocaleID:Integer; DispIDs:Pointer):HRESULT; stdcall;
begin
{*
 007078A8    push        ebp
 007078A9    mov         ebp,esp
 007078AB    mov         eax,80004001
 007078B0    pop         ebp
 007078B1    ret         18
*}
end;

//007078B4
function TEventDispatch.Invoke(DispID:Integer; const IID:TGUID; LocaleID:Integer; Flags:Word; var Params:void ; VarResult:Pointer; ExcepInfo:Pointer; ArgErr:Pointer):HRESULT; stdcall;
begin
{*
 007078B4    push        ebp
 007078B5    mov         ebp,esp
 007078B7    push        ebx
 007078B8    push        esi
 007078B9    push        edi
 007078BA    mov         edi,dword ptr [ebp+1C]
 007078BD    mov         eax,dword ptr [ebp+0C]
 007078C0    mov         esi,dword ptr [ebp+8]
 007078C3    cmp         eax,0FFFFFDA1
>007078C8    jl          007078E2
 007078CA    cmp         eax,0FFFFFDA8
>007078CF    jg          007078E2
 007078D1    mov         ecx,edi
 007078D3    mov         edx,eax
 007078D5    mov         eax,dword ptr [esi+4]
 007078D8    mov         ebx,dword ptr [eax]
 007078DA    call        dword ptr [ebx+0EC]
>007078E0    jmp         007078F1
 007078E2    mov         ecx,edi
 007078E4    mov         edx,eax
 007078E6    mov         eax,dword ptr [esi+4]
 007078E9    mov         ebx,dword ptr [eax]
 007078EB    call        dword ptr [ebx+0F0]
 007078F1    xor         eax,eax
 007078F3    pop         edi
 007078F4    pop         esi
 007078F5    pop         ebx
 007078F6    pop         ebp
 007078F7    ret         24
*}
end;

//007078FC
constructor TEnumPropDesc.Create(TypeInfo:ITypeInfo; ValueCount:Integer);
begin
{*
 007078FC    push        ebp
 007078FD    mov         ebp,esp
 007078FF    add         esp,0FFFFFFE8
 00707902    push        ebx
 00707903    xor         ebx,ebx
 00707905    mov         dword ptr [ebp-4],ebx
 00707908    test        dl,dl
>0070790A    je          00707914
 0070790C    add         esp,0FFFFFFF0
 0070790F    call        @ClassCreate
 00707914    mov         byte ptr [ebp-9],dl
 00707917    mov         dword ptr [ebp-8],eax
 0070791A    mov         ebx,dword ptr [ebp+0C]
 0070791D    xor         eax,eax
 0070791F    push        ebp
 00707920    push        707A2E
 00707925    push        dword ptr fs:[eax]
 00707928    mov         dword ptr fs:[eax],esp
 0070792B    mov         eax,dword ptr [ebp-8]
 0070792E    mov         dword ptr [eax+4],ecx
 00707931    mov         eax,dword ptr [ebp-8]
 00707934    mov         dword ptr [eax+8],ebx
 00707937    mov         eax,ebx
 00707939    add         eax,eax
 0070793B    add         eax,eax
 0070793D    add         eax,eax
 0070793F    call        AllocMem
 00707944    mov         edx,dword ptr [ebp-8]
 00707947    mov         dword ptr [edx+0C],eax
 0070794A    dec         ebx
 0070794B    test        ebx,ebx
>0070794D    jl          00707A18
 00707953    inc         ebx
 00707954    mov         dword ptr [ebp-18],ebx
 00707957    mov         dword ptr [ebp-10],0
 0070795E    lea         eax,[ebp-14]
 00707961    push        eax
 00707962    mov         eax,dword ptr [ebp-10]
 00707965    push        eax
 00707966    mov         eax,dword ptr [ebp+8]
 00707969    push        eax
 0070796A    mov         eax,dword ptr [eax]
 0070796C    call        dword ptr [eax+18]
 0070796F    call        OleCheck
 00707974    xor         eax,eax
 00707976    push        ebp
 00707977    push        707A05
 0070797C    push        dword ptr fs:[eax]
 0070797F    mov         dword ptr fs:[eax],esp
 00707982    push        0
 00707984    push        0
 00707986    push        0
 00707988    lea         eax,[ebp-4]
 0070798B    push        eax
 0070798C    mov         eax,dword ptr [ebp-14]
 0070798F    mov         eax,dword ptr [eax]
 00707991    push        eax
 00707992    mov         eax,dword ptr [ebp+8]
 00707995    push        eax
 00707996    mov         eax,dword ptr [eax]
 00707998    call        dword ptr [eax+30]
 0070799B    call        OleCheck
 007079A0    mov         eax,dword ptr [ebp-8]
 007079A3    mov         eax,dword ptr [eax+0C]
 007079A6    mov         edx,dword ptr [ebp-10]
 007079A9    lea         ebx,[eax+edx*8]
 007079AC    mov         eax,dword ptr [ebp-14]
 007079AF    mov         eax,dword ptr [eax+8]
 007079B2    mov         eax,dword ptr [eax+8]
 007079B5    mov         dword ptr [ebx],eax
 007079B7    lea         eax,[ebx+4]
 007079BA    mov         edx,dword ptr [ebp-4]
 007079BD    call        @UStrFromWStr
>007079C2    jmp         007079D6
 007079C4    lea         eax,[ebx+4]
 007079C7    mov         ecx,1
 007079CC    mov         edx,1
 007079D1    call        @UStrDelete
 007079D6    mov         eax,dword ptr [ebx+4]
 007079D9    call        @UStrLen
 007079DE    dec         eax
>007079DF    jle         007079EA
 007079E1    mov         eax,dword ptr [ebx+4]
 007079E4    cmp         word ptr [eax],5F
>007079E8    je          007079C4
 007079EA    xor         eax,eax
 007079EC    pop         edx
 007079ED    pop         ecx
 007079EE    pop         ecx
 007079EF    mov         dword ptr fs:[eax],edx
 007079F2    push        707A0C
 007079F7    mov         eax,dword ptr [ebp-14]
 007079FA    push        eax
 007079FB    mov         eax,dword ptr [ebp+8]
 007079FE    push        eax
 007079FF    mov         eax,dword ptr [eax]
 00707A01    call        dword ptr [eax+54]
 00707A04    ret
>00707A05    jmp         @HandleFinally
>00707A0A    jmp         007079F7
 00707A0C    inc         dword ptr [ebp-10]
 00707A0F    dec         dword ptr [ebp-18]
>00707A12    jne         0070795E
 00707A18    xor         eax,eax
 00707A1A    pop         edx
 00707A1B    pop         ecx
 00707A1C    pop         ecx
 00707A1D    mov         dword ptr fs:[eax],edx
 00707A20    push        707A35
 00707A25    lea         eax,[ebp-4]
 00707A28    call        @WStrClr
 00707A2D    ret
>00707A2E    jmp         @HandleFinally
>00707A33    jmp         00707A25
 00707A35    mov         eax,dword ptr [ebp-8]
 00707A38    cmp         byte ptr [ebp-9],0
>00707A3C    je          00707A4D
 00707A3E    call        @AfterConstruction
 00707A43    pop         dword ptr fs:[0]
 00707A4A    add         esp,0C
 00707A4D    mov         eax,dword ptr [ebp-8]
 00707A50    pop         ebx
 00707A51    mov         esp,ebp
 00707A53    pop         ebp
 00707A54    ret         8
*}
end;

//00707A58
destructor TEnumPropDesc.Destroy();
begin
{*
 00707A58    push        ebx
 00707A59    push        esi
 00707A5A    call        @BeforeDestruction
 00707A5F    mov         ebx,edx
 00707A61    mov         esi,eax
 00707A63    mov         eax,dword ptr [esi+0C]
 00707A66    test        eax,eax
>00707A68    je          00707A89
 00707A6A    mov         ecx,dword ptr [esi+8]
 00707A6D    mov         edx,dword ptr ds:[706278];TEnumValue
 00707A73    call        @FinalizeArray
 00707A78    mov         edx,dword ptr [esi+8]
 00707A7B    add         edx,edx
 00707A7D    add         edx,edx
 00707A7F    add         edx,edx
 00707A81    mov         eax,dword ptr [esi+0C]
 00707A84    call        @FreeMem
 00707A89    test        bl,bl
>00707A8B    jle         00707A94
 00707A8D    mov         eax,esi
 00707A8F    call        @ClassDestroy
 00707A94    pop         esi
 00707A95    pop         ebx
 00707A96    ret
*}
end;

//00707A98
procedure TEnumPropDesc.GetStrings(Proc:TGetStrProc);
begin
{*
 00707A98    push        ebp
 00707A99    mov         ebp,esp
 00707A9B    add         esp,0FFFFFFE4
 00707A9E    push        ebx
 00707A9F    push        esi
 00707AA0    xor         edx,edx
 00707AA2    mov         dword ptr [ebp-0C],edx
 00707AA5    mov         dword ptr [ebp-4],eax
 00707AA8    xor         eax,eax
 00707AAA    push        ebp
 00707AAB    push        707B23
 00707AB0    push        dword ptr fs:[eax]
 00707AB3    mov         dword ptr fs:[eax],esp
 00707AB6    mov         eax,dword ptr [ebp-4]
 00707AB9    mov         esi,dword ptr [eax+8]
 00707ABC    dec         esi
 00707ABD    test        esi,esi
>00707ABF    jl          00707B0D
 00707AC1    inc         esi
 00707AC2    mov         dword ptr [ebp-8],0
 00707AC9    mov         eax,dword ptr [ebp-4]
 00707ACC    mov         eax,dword ptr [eax+0C]
 00707ACF    mov         edx,dword ptr [ebp-8]
 00707AD2    lea         ebx,[eax+edx*8]
 00707AD5    lea         eax,[ebp-0C]
 00707AD8    push        eax
 00707AD9    mov         eax,dword ptr [ebx]
 00707ADB    mov         dword ptr [ebp-1C],eax
 00707ADE    mov         byte ptr [ebp-18],0
 00707AE2    mov         eax,dword ptr [ebx+4]
 00707AE5    mov         dword ptr [ebp-14],eax
 00707AE8    mov         byte ptr [ebp-10],11
 00707AEC    lea         edx,[ebp-1C]
 00707AEF    mov         ecx,1
 00707AF4    mov         eax,707B40;'%d - %s'
 00707AF9    call        Format
 00707AFE    mov         edx,dword ptr [ebp-0C]
 00707B01    mov         eax,dword ptr [ebp+0C]
 00707B04    call        dword ptr [ebp+8]
 00707B07    inc         dword ptr [ebp-8]
 00707B0A    dec         esi
>00707B0B    jne         00707AC9
 00707B0D    xor         eax,eax
 00707B0F    pop         edx
 00707B10    pop         ecx
 00707B11    pop         ecx
 00707B12    mov         dword ptr fs:[eax],edx
 00707B15    push        707B2A
 00707B1A    lea         eax,[ebp-0C]
 00707B1D    call        @UStrClr
 00707B22    ret
>00707B23    jmp         @HandleFinally
>00707B28    jmp         00707B1A
 00707B2A    pop         esi
 00707B2B    pop         ebx
 00707B2C    mov         esp,ebp
 00707B2E    pop         ebp
 00707B2F    ret         8
*}
end;

//00707B50
function TEnumPropDesc.StringToValue(S:string):Integer;
begin
{*
 00707B50    push        ebp
 00707B51    mov         ebp,esp
 00707B53    add         esp,0FFFFFFE8
 00707B56    push        ebx
 00707B57    push        esi
 00707B58    push        edi
 00707B59    xor         ecx,ecx
 00707B5B    mov         dword ptr [ebp-10],ecx
 00707B5E    mov         esi,edx
 00707B60    mov         dword ptr [ebp-4],eax
 00707B63    xor         eax,eax
 00707B65    push        ebp
 00707B66    push        707C4F
 00707B6B    push        dword ptr fs:[eax]
 00707B6E    mov         dword ptr fs:[eax],esp
 00707B71    mov         ebx,1
>00707B76    jmp         00707B79
 00707B78    inc         ebx
 00707B79    mov         eax,esi
 00707B7B    call        @UStrLen
 00707B80    cmp         ebx,eax
>00707B82    jg          00707B97
 00707B84    mov         edx,707C60
 00707B89    movzx       eax,word ptr [esi+ebx*2-2]
 00707B8E    call        CharInSet
 00707B93    test        al,al
>00707B95    jne         00707B78
 00707B97    cmp         ebx,1
>00707B9A    jle         00707BDC
 00707B9C    lea         eax,[ebp-10]
 00707B9F    push        eax
 00707BA0    mov         ecx,ebx
 00707BA2    dec         ecx
 00707BA3    mov         edx,1
 00707BA8    mov         eax,esi
 00707BAA    call        @UStrCopy
 00707BAF    mov         eax,dword ptr [ebp-10]
 00707BB2    call        StrToInt
 00707BB7    mov         dword ptr [ebp-8],eax
 00707BBA    mov         eax,dword ptr [ebp-4]
 00707BBD    mov         edi,dword ptr [eax+8]
 00707BC0    dec         edi
 00707BC1    test        edi,edi
>00707BC3    jl          00707C15
 00707BC5    inc         edi
 00707BC6    xor         ebx,ebx
 00707BC8    mov         eax,dword ptr [ebp-4]
 00707BCB    mov         eax,dword ptr [eax+0C]
 00707BCE    mov         eax,dword ptr [eax+ebx*8]
 00707BD1    cmp         eax,dword ptr [ebp-8]
>00707BD4    je          00707C39
 00707BD6    inc         ebx
 00707BD7    dec         edi
>00707BD8    jne         00707BC8
>00707BDA    jmp         00707C15
 00707BDC    mov         eax,dword ptr [ebp-4]
 00707BDF    mov         edi,dword ptr [eax+8]
 00707BE2    dec         edi
 00707BE3    test        edi,edi
>00707BE5    jl          00707C15
 00707BE7    inc         edi
 00707BE8    xor         ebx,ebx
 00707BEA    mov         eax,dword ptr [ebp-4]
 00707BED    mov         eax,dword ptr [eax+0C]
 00707BF0    lea         eax,[eax+ebx*8]
 00707BF3    mov         dword ptr [ebp-0C],eax
 00707BF6    mov         eax,dword ptr [ebp-0C]
 00707BF9    mov         edx,dword ptr [eax+4]
 00707BFC    mov         eax,esi
 00707BFE    call        AnsiCompareText
 00707C03    test        eax,eax
>00707C05    jne         00707C11
 00707C07    mov         eax,dword ptr [ebp-0C]
 00707C0A    mov         eax,dword ptr [eax]
 00707C0C    mov         dword ptr [ebp-8],eax
>00707C0F    jmp         00707C39
 00707C11    inc         ebx
 00707C12    dec         edi
>00707C13    jne         00707BEA
 00707C15    mov         dword ptr [ebp-18],esi
 00707C18    mov         byte ptr [ebp-14],11
 00707C1C    lea         eax,[ebp-18]
 00707C1F    push        eax
 00707C20    push        0
 00707C22    mov         ecx,dword ptr ds:[78CE10];^SResString707:TResStringRec
 00707C28    mov         dl,1
 00707C2A    mov         eax,[0052E700];EOleError
 00707C2F    call        Exception.CreateResFmt
 00707C34    call        @RaiseExcept
 00707C39    xor         eax,eax
 00707C3B    pop         edx
 00707C3C    pop         ecx
 00707C3D    pop         ecx
 00707C3E    mov         dword ptr fs:[eax],edx
 00707C41    push        707C56
 00707C46    lea         eax,[ebp-10]
 00707C49    call        @UStrClr
 00707C4E    ret
>00707C4F    jmp         @HandleFinally
>00707C54    jmp         00707C46
 00707C56    mov         eax,dword ptr [ebp-8]
 00707C59    pop         edi
 00707C5A    pop         esi
 00707C5B    pop         ebx
 00707C5C    mov         esp,ebp
 00707C5E    pop         ebp
 00707C5F    ret
*}
end;

//00707C80
function TEnumPropDesc.ValueToString(V:Integer):string;
begin
{*
 00707C80    push        ebx
 00707C81    push        esi
 00707C82    push        edi
 00707C83    add         esp,0FFFFFFEC
 00707C86    mov         dword ptr [esp],ecx
 00707C89    mov         edi,edx
 00707C8B    mov         edx,dword ptr [eax+8]
 00707C8E    dec         edx
 00707C8F    test        edx,edx
>00707C91    jl          00707CD4
 00707C93    inc         edx
 00707C94    xor         esi,esi
 00707C96    mov         ecx,dword ptr [eax+0C]
 00707C99    lea         ebx,[ecx+esi*8]
 00707C9C    cmp         edi,dword ptr [ebx]
>00707C9E    jne         00707CD0
 00707CA0    mov         eax,dword ptr [esp]
 00707CA3    push        eax
 00707CA4    mov         eax,dword ptr [ebx]
 00707CA6    mov         dword ptr [esp+8],eax
 00707CAA    mov         byte ptr [esp+0C],0
 00707CAF    mov         eax,dword ptr [ebx+4]
 00707CB2    mov         dword ptr [esp+10],eax
 00707CB6    mov         byte ptr [esp+14],11
 00707CBB    lea         edx,[esp+8]
 00707CBF    mov         ecx,1
 00707CC4    mov         eax,707CF4;'%d - %s'
 00707CC9    call        Format
>00707CCE    jmp         00707CDE
 00707CD0    inc         esi
 00707CD1    dec         edx
>00707CD2    jne         00707C96
 00707CD4    mov         edx,dword ptr [esp]
 00707CD7    mov         eax,edi
 00707CD9    call        IntToStr
 00707CDE    add         esp,14
 00707CE1    pop         edi
 00707CE2    pop         esi
 00707CE3    pop         ebx
 00707CE4    ret
*}
end;

//00707D04
constructor TOleControl.Create;
begin
{*
 00707D04    push        ebp
 00707D05    mov         ebp,esp
 00707D07    push        ecx
 00707D08    push        ebx
 00707D09    push        esi
 00707D0A    push        edi
 00707D0B    test        dl,dl
>00707D0D    je          00707D17
 00707D0F    add         esp,0FFFFFFF0
 00707D12    call        @ClassCreate
 00707D17    mov         byte ptr [ebp-1],dl
 00707D1A    mov         ebx,eax
 00707D1C    xor         edx,edx
 00707D1E    mov         eax,ebx
 00707D20    call        TWinControl.Create
 00707D25    or          byte ptr [ebx+24],2
 00707D29    mov         eax,ebx
 00707D2B    mov         edx,dword ptr [eax]
 00707D2D    call        dword ptr [edx+0F4]
 00707D33    mov         eax,dword ptr [ebx+270]
 00707D39    inc         dword ptr [eax+48]
 00707D3C    mov         eax,dword ptr [ebx+270]
 00707D42    cmp         dword ptr [eax+34],0
>00707D46    jle         00707D9C
 00707D48    mov         dl,1
 00707D4A    mov         eax,[00439644];TList
 00707D4F    call        TObject.Create
 00707D54    mov         esi,eax
 00707D56    mov         dword ptr [ebx+2A8],esi
 00707D5C    mov         eax,dword ptr [ebx+270]
 00707D62    mov         edx,dword ptr [eax+34]
 00707D65    mov         eax,esi
 00707D67    call        TList.SetCount
 00707D6C    mov         eax,dword ptr [ebx+2A8]
 00707D72    mov         edi,dword ptr [eax+8]
 00707D75    dec         edi
 00707D76    test        edi,edi
>00707D78    jl          00707D9C
 00707D7A    inc         edi
 00707D7B    xor         esi,esi
 00707D7D    mov         dl,1
 00707D7F    mov         eax,[0045FAE8];TFont
 00707D84    call        TFont.Create
 00707D89    mov         ecx,eax
 00707D8B    mov         eax,dword ptr [ebx+2A8]
 00707D91    mov         edx,esi
 00707D93    call        TList.Put
 00707D98    inc         esi
 00707D99    dec         edi
>00707D9A    jne         00707D7D
 00707D9C    mov         eax,dword ptr [ebx+270]
 00707DA2    cmp         dword ptr [eax+3C],0
>00707DA6    jle         00707E13
 00707DA8    mov         dl,1
 00707DAA    mov         eax,[00439644];TList
 00707DAF    call        TObject.Create
 00707DB4    mov         esi,eax
 00707DB6    mov         dword ptr [ebx+2AC],esi
 00707DBC    mov         eax,dword ptr [ebx+270]
 00707DC2    mov         edx,dword ptr [eax+3C]
 00707DC5    mov         eax,esi
 00707DC7    call        TList.SetCount
 00707DCC    mov         eax,dword ptr [ebx+2AC]
 00707DD2    mov         edi,dword ptr [eax+8]
 00707DD5    dec         edi
 00707DD6    test        edi,edi
>00707DD8    jl          00707E13
 00707DDA    inc         edi
 00707DDB    xor         esi,esi
 00707DDD    mov         dl,1
 00707DDF    mov         eax,[0046279C];TPicture
 00707DE4    call        TPicture.Create
 00707DE9    mov         ecx,eax
 00707DEB    mov         eax,dword ptr [ebx+2AC]
 00707DF1    mov         edx,esi
 00707DF3    call        TList.Put
 00707DF8    mov         eax,dword ptr [ebx+2AC]
 00707DFE    mov         edx,esi
 00707E00    call        TList.Get
 00707E05    mov         dword ptr [eax+14],ebx
 00707E08    mov         dword ptr [eax+10],709BFC;TOleControl.PictureChanged
 00707E0F    inc         esi
 00707E10    dec         edi
>00707E11    jne         00707DDD
 00707E13    mov         ecx,ebx
 00707E15    mov         dl,1
 00707E17    mov         eax,[0070617C];TEventDispatch
 00707E1C    call        TEventDispatch.Create
 00707E21    mov         dword ptr [ebx+278],eax
 00707E27    mov         eax,ebx
 00707E29    call        TOleControl.CreateInstance
 00707E2E    mov         edx,dword ptr [ebx+280]
 00707E34    mov         eax,ebx
 00707E36    mov         ecx,dword ptr [eax]
 00707E38    call        dword ptr [ecx+0F8]
 00707E3E    lea         eax,[ebx+2A4]
 00707E44    push        eax
 00707E45    push        1
 00707E47    mov         eax,dword ptr [ebx+280]
 00707E4D    push        eax
 00707E4E    mov         eax,dword ptr [eax]
 00707E50    call        dword ptr [eax+58]
 00707E53    call        OleCheck
 00707E58    mov         eax,dword ptr [ebx+270]
 00707E5E    test        byte ptr [eax+44],2
>00707E62    jne         00707E96
 00707E64    test        byte ptr [ebx+2A6],2
>00707E6B    jne         00707E79
 00707E6D    mov         eax,dword ptr [ebx+270]
 00707E73    test        byte ptr [eax+44],1
>00707E77    je          00707E96
 00707E79    mov         eax,ebx
 00707E7B    test        eax,eax
>00707E7D    je          00707E84
 00707E7F    sub         eax,0FFFFFD14
 00707E84    push        eax
 00707E85    mov         eax,dword ptr [ebx+280]
 00707E8B    push        eax
 00707E8C    mov         eax,dword ptr [eax]
 00707E8E    call        dword ptr [eax+0C]
 00707E91    call        OleCheck
 00707E96    lea         eax,[ebx+284]
 00707E9C    call        @IntfClear
 00707EA1    push        eax
 00707EA2    push        707F20
 00707EA7    mov         eax,dword ptr [ebx+280]
 00707EAD    push        eax
 00707EAE    mov         eax,dword ptr [eax]
 00707EB0    call        dword ptr [eax]
 00707EB2    call        OleCheck
 00707EB7    test        byte ptr [ebx+2A5],4
>00707EBE    je          00707EC9
 00707EC0    xor         edx,edx
 00707EC2    mov         eax,ebx
 00707EC4    call        TControl.SetVisible
 00707EC9    test        byte ptr [ebx+2A6],1
>00707ED0    je          00707EDC
 00707ED2    mov         eax,[00707F30]
 00707ED7    mov         dword ptr [ebx+50],eax
>00707EDA    jmp         00707EE4
 00707EDC    mov         eax,[00707F34]
 00707EE1    mov         dword ptr [ebx+50],eax
 00707EE4    test        byte ptr [ebx+2A5],60
 00707EEB    sete        dl
 00707EEE    mov         eax,ebx
 00707EF0    call        TWinControl.SetTabStop
 00707EF5    push        ebx
 00707EF6    call        TOleControl.RequestNewObjectLayout
 00707EFB    call        OleCheck
 00707F00    mov         eax,ebx
 00707F02    cmp         byte ptr [ebp-1],0
>00707F06    je          00707F17
 00707F08    call        @AfterConstruction
 00707F0D    pop         dword ptr fs:[0]
 00707F14    add         esp,0C
 00707F17    mov         eax,ebx
 00707F19    pop         edi
 00707F1A    pop         esi
 00707F1B    pop         ebx
 00707F1C    pop         ecx
 00707F1D    pop         ebp
 00707F1E    ret
*}
end;

//00707F38
procedure FreeList(var L:TList);
begin
{*
 00707F38    push        ebx
 00707F39    push        esi
 00707F3A    push        edi
 00707F3B    mov         esi,eax
 00707F3D    cmp         dword ptr [esi],0
>00707F40    je          00707F6C
 00707F42    mov         eax,dword ptr [esi]
 00707F44    mov         ebx,dword ptr [eax+8]
 00707F47    dec         ebx
 00707F48    test        ebx,ebx
>00707F4A    jl          00707F61
 00707F4C    inc         ebx
 00707F4D    xor         edi,edi
 00707F4F    mov         eax,dword ptr [esi]
 00707F51    mov         edx,edi
 00707F53    call        TList.Get
 00707F58    call        TObject.Free
 00707F5D    inc         edi
 00707F5E    dec         ebx
>00707F5F    jne         00707F4F
 00707F61    mov         eax,dword ptr [esi]
 00707F63    call        TObject.Free
 00707F68    xor         eax,eax
 00707F6A    mov         dword ptr [esi],eax
 00707F6C    pop         edi
 00707F6D    pop         esi
 00707F6E    pop         ebx
 00707F6F    ret
*}
end;

//00707F70
destructor TOleControl.Destroy();
begin
{*
 00707F70    push        ebx
 00707F71    push        esi
 00707F72    call        @BeforeDestruction
 00707F77    mov         ebx,edx
 00707F79    mov         esi,eax
 00707F7B    cmp         dword ptr [esi+280],0
>00707F82    je          00707F92
 00707F84    push        1
 00707F86    mov         eax,dword ptr [esi+280]
 00707F8C    push        eax
 00707F8D    mov         eax,dword ptr [eax]
 00707F8F    call        dword ptr [eax+18]
 00707F92    mov         eax,esi
 00707F94    call        TOleControl.DestroyControl
 00707F99    mov         eax,esi
 00707F9B    call        TOleControl.DestroyStorage
 00707FA0    lea         eax,[esi+284]
 00707FA6    call        @IntfClear
 00707FAB    cmp         dword ptr [esi+280],0
>00707FB2    je          00707FC2
 00707FB4    push        0
 00707FB6    mov         eax,dword ptr [esi+280]
 00707FBC    push        eax
 00707FBD    mov         eax,dword ptr [eax]
 00707FBF    call        dword ptr [eax+0C]
 00707FC2    lea         eax,[esi+280]
 00707FC8    call        @IntfClear
 00707FCD    mov         eax,dword ptr [esi+278]
 00707FD3    call        TObject.Free
 00707FD8    lea         eax,[esi+2A8]
 00707FDE    call        FreeList
 00707FE3    lea         eax,[esi+2AC]
 00707FE9    call        FreeList
 00707FEE    mov         eax,dword ptr [esi+270]
 00707FF4    dec         dword ptr [eax+48]
 00707FF7    mov         eax,dword ptr [esi+270]
 00707FFD    cmp         dword ptr [eax+48],0
>00708001    jne         0070800A
 00708003    mov         eax,esi
 00708005    call        TOleControl.DestroyEnumPropDescs
 0070800A    mov         edx,ebx
 0070800C    and         dl,0FC
 0070800F    mov         eax,esi
 00708011    call        TWinControl.Destroy
 00708016    test        bl,bl
>00708018    jle         00708021
 0070801A    mov         eax,esi
 0070801C    call        @ClassDestroy
 00708021    pop         esi
 00708022    pop         ebx
 00708023    ret
*}
end;

//00708024
procedure TOleControl.BrowseProperties;
begin
{*
 00708024    mov         edx,0FFFFFFF9
 00708029    call        TOleControl.DoObjectVerb
 0070802E    ret
*}
end;

//00708030
procedure TOleControl.CreateControl;
begin
{*
 00708030    push        ebp
 00708031    mov         ebp,esp
 00708033    push        0
 00708035    push        0
 00708037    push        0
 00708039    push        ebx
 0070803A    push        esi
 0070803B    push        edi
 0070803C    mov         dword ptr [ebp-0C],eax
 0070803F    xor         eax,eax
 00708041    push        ebp
 00708042    push        708301
 00708047    push        dword ptr fs:[eax]
 0070804A    mov         dword ptr fs:[eax],esp
 0070804D    mov         eax,dword ptr [ebp-0C]
 00708050    cmp         dword ptr [eax+288],0
>00708057    jne         007082E3
 0070805D    xor         eax,eax
 0070805F    push        ebp
 00708060    push        7082CC
 00708065    push        dword ptr fs:[eax]
 00708068    mov         dword ptr fs:[eax],esp
 0070806B    xor         eax,eax
 0070806D    push        ebp
 0070806E    push        70809D
 00708073    push        dword ptr fs:[eax]
 00708076    mov         dword ptr fs:[eax],esp
 00708079    lea         eax,[ebp-8]
 0070807C    call        @IntfClear
 00708081    push        eax
 00708082    mov         eax,dword ptr [ebp-0C]
 00708085    mov         eax,dword ptr [eax+280]
 0070808B    push        eax
 0070808C    mov         eax,dword ptr [eax]
 0070808E    call        dword ptr [eax+10]
 00708091    mov         ebx,eax
 00708093    xor         eax,eax
 00708095    pop         edx
 00708096    pop         ecx
 00708097    pop         ecx
 00708098    mov         dword ptr fs:[eax],edx
>0070809B    jmp         007080AA
>0070809D    jmp         @HandleAnyException
 007080A2    or          ebx,0FFFFFFFF
 007080A5    call        @DoneExcept
 007080AA    test        ebx,ebx
>007080AC    jne         007080B4
 007080AE    cmp         dword ptr [ebp-8],0
>007080B2    jne         007080D5
 007080B4    mov         eax,dword ptr [ebp-0C]
 007080B7    test        eax,eax
>007080B9    je          007080C0
 007080BB    sub         eax,0FFFFFD14
 007080C0    push        eax
 007080C1    mov         eax,dword ptr [ebp-0C]
 007080C4    mov         eax,dword ptr [eax+280]
 007080CA    push        eax
 007080CB    mov         eax,dword ptr [eax]
 007080CD    call        dword ptr [eax+0C]
 007080D0    call        OleCheck
 007080D5    mov         eax,dword ptr [ebp-0C]
 007080D8    mov         ebx,dword ptr [eax+27C]
 007080DE    test        ebx,ebx
>007080E0    jne         00708104
 007080E2    mov         eax,dword ptr [ebp-0C]
 007080E5    cmp         dword ptr [eax+284],0
>007080EC    je          00708104
 007080EE    mov         eax,dword ptr [ebp-0C]
 007080F1    mov         eax,dword ptr [eax+284]
 007080F7    push        eax
 007080F8    mov         eax,dword ptr [eax]
 007080FA    call        dword ptr [eax+20]
 007080FD    call        OleCheck
>00708102    jmp         0070813A
 00708104    lea         eax,[ebp-4]
 00708107    call        @IntfClear
 0070810C    push        eax
 0070810D    push        0
 0070810F    push        ebx
 00708110    call        ole32.CreateStreamOnHGlobal
 00708115    call        OleCheck
 0070811A    mov         eax,dword ptr [ebp-4]
 0070811D    push        eax
 0070811E    mov         eax,dword ptr [ebp-0C]
 00708121    mov         eax,dword ptr [eax+284]
 00708127    push        eax
 00708128    mov         eax,dword ptr [eax]
 0070812A    call        dword ptr [eax+14]
 0070812D    call        OleCheck
 00708132    mov         eax,dword ptr [ebp-0C]
 00708135    call        TOleControl.DestroyStorage
 0070813A    mov         eax,dword ptr [ebp-0C]
 0070813D    add         eax,288
 00708142    call        @IntfClear
 00708147    push        eax
 00708148    push        708310
 0070814D    mov         eax,dword ptr [ebp-0C]
 00708150    mov         eax,dword ptr [eax+280]
 00708156    push        eax
 00708157    mov         eax,dword ptr [eax]
 00708159    call        dword ptr [eax]
 0070815B    call        OleCheck
 00708160    mov         eax,dword ptr [ebp-0C]
 00708163    mov         dword ptr [eax+2C0],10
 0070816D    mov         eax,dword ptr [ebp-0C]
 00708170    add         eax,2C0
 00708175    push        eax
 00708176    mov         eax,dword ptr [ebp-0C]
 00708179    mov         eax,dword ptr [eax+288]
 0070817F    push        eax
 00708180    mov         eax,dword ptr [eax]
 00708182    call        dword ptr [eax+0C]
 00708185    mov         eax,dword ptr [ebp-0C]
 00708188    add         eax,28C
 0070818D    call        @IntfClear
 00708192    push        eax
 00708193    push        708320
 00708198    mov         eax,dword ptr [ebp-0C]
 0070819B    mov         eax,dword ptr [eax+280]
 007081A1    push        eax
 007081A2    mov         eax,dword ptr [eax]
 007081A4    call        dword ptr [eax]
 007081A6    call        OleCheck
 007081AB    mov         eax,dword ptr [ebp-0C]
 007081AE    add         eax,290
 007081B3    call        @IntfClear
 007081B8    push        eax
 007081B9    push        708330
 007081BE    mov         eax,dword ptr [ebp-0C]
 007081C1    mov         eax,dword ptr [eax+280]
 007081C7    push        eax
 007081C8    mov         eax,dword ptr [eax]
 007081CA    call        dword ptr [eax]
 007081CC    mov         eax,dword ptr [ebp-0C]
 007081CF    add         eax,29C
 007081D4    push        eax
 007081D5    mov         ecx,dword ptr [ebp-0C]
 007081D8    test        ecx,ecx
>007081DA    je          007081E2
 007081DC    sub         ecx,0FFFFFD30
 007081E2    mov         edx,708340
 007081E7    mov         eax,dword ptr [ebp-0C]
 007081EA    mov         eax,dword ptr [eax+280]
 007081F0    call        InterfaceConnect
 007081F5    mov         eax,dword ptr [ebp-0C]
 007081F8    add         eax,2A0
 007081FD    push        eax
 007081FE    mov         eax,dword ptr [ebp-0C]
 00708201    mov         ecx,dword ptr [eax+278]
 00708207    test        ecx,ecx
>00708209    je          0070820E
 0070820B    sub         ecx,0FFFFFFF8
 0070820E    mov         eax,dword ptr [ebp-0C]
 00708211    mov         eax,dword ptr [eax+270]
 00708217    lea         edx,[eax+10]
 0070821A    mov         eax,dword ptr [ebp-0C]
 0070821D    mov         eax,dword ptr [eax+280]
 00708223    call        InterfaceConnect
 00708228    mov         eax,dword ptr [ebp-0C]
 0070822B    mov         eax,dword ptr [eax+270]
 00708231    test        byte ptr [eax+2C],1
>00708235    je          00708248
 00708237    push        0FFFFFE0B
 0070823C    mov         eax,dword ptr [ebp-0C]
 0070823F    push        eax
 00708240    mov         eax,dword ptr [eax]
 00708242    call        dword ptr [eax+100]
 00708248    mov         eax,dword ptr [ebp-0C]
 0070824B    mov         eax,dword ptr [eax+270]
 00708251    test        byte ptr [eax+2C],8
>00708255    je          00708268
 00708257    push        0FFFFFDFE
 0070825C    mov         eax,dword ptr [ebp-0C]
 0070825F    push        eax
 00708260    mov         eax,dword ptr [eax]
 00708262    call        dword ptr [eax+100]
 00708268    mov         eax,dword ptr [ebp-0C]
 0070826B    mov         eax,dword ptr [eax+270]
 00708271    test        byte ptr [eax+2C],4
>00708275    je          00708288
 00708277    push        0FFFFFE00
 0070827C    mov         eax,dword ptr [ebp-0C]
 0070827F    push        eax
 00708280    mov         eax,dword ptr [eax]
 00708282    call        dword ptr [eax+100]
 00708288    mov         eax,dword ptr [ebp-0C]
 0070828B    mov         eax,dword ptr [eax+270]
 00708291    test        byte ptr [eax+2C],2
>00708295    je          007082A8
 00708297    push        0FFFFFDFF
 0070829C    mov         eax,dword ptr [ebp-0C]
 0070829F    push        eax
 007082A0    mov         eax,dword ptr [eax]
 007082A2    call        dword ptr [eax+100]
 007082A8    push        0FF
 007082AA    mov         eax,dword ptr [ebp-0C]
 007082AD    mov         eax,dword ptr [eax+288]
 007082B3    push        eax
 007082B4    mov         eax,dword ptr [eax]
 007082B6    call        dword ptr [eax+14]
 007082B9    mov         eax,dword ptr [ebp-0C]
 007082BC    push        eax
 007082BD    call        TOleControl.RequestNewObjectLayout
 007082C2    xor         eax,eax
 007082C4    pop         edx
 007082C5    pop         ecx
 007082C6    pop         ecx
 007082C7    mov         dword ptr fs:[eax],edx
>007082CA    jmp         007082E3
>007082CC    jmp         @HandleAnyException
 007082D1    mov         eax,dword ptr [ebp-0C]
 007082D4    call        TOleControl.DestroyControl
 007082D9    call        @RaiseAgain
 007082DE    call        @DoneExcept
 007082E3    xor         eax,eax
 007082E5    pop         edx
 007082E6    pop         ecx
 007082E7    pop         ecx
 007082E8    mov         dword ptr fs:[eax],edx
 007082EB    push        708308
 007082F0    lea         eax,[ebp-8]
 007082F3    call        @IntfClear
 007082F8    lea         eax,[ebp-4]
 007082FB    call        @IntfClear
 00708300    ret
>00708301    jmp         @HandleFinally
>00708306    jmp         007082F0
 00708308    pop         edi
 00708309    pop         esi
 0070830A    pop         ebx
 0070830B    mov         esp,ebp
 0070830D    pop         ebp
 0070830E    ret
*}
end;

//00708350
function FindMember(DispId:Integer):Boolean;
begin
{*
 00708350    push        ebp
 00708351    mov         ebp,esp
 00708353    mov         edx,dword ptr [ebp+8]
 00708356    mov         edx,dword ptr [edx-4]
 00708359    mov         edx,dword ptr [edx+270]
 0070835F    mov         edx,dword ptr [edx+4C]
 00708362    mov         edx,dword ptr [edx+8]
 00708365    dec         edx
 00708366    test        edx,edx
>00708368    jl          00708386
 0070836A    inc         edx
 0070836B    mov         ecx,dword ptr [ebp+8]
 0070836E    mov         ecx,dword ptr [ecx-4]
 00708371    mov         ecx,dword ptr [ecx+270]
 00708377    mov         ecx,dword ptr [ecx+4C]
 0070837A    cmp         eax,dword ptr [ecx+4]
>0070837D    jne         00708383
 0070837F    mov         al,1
 00708381    pop         ebp
 00708382    ret
 00708383    dec         edx
>00708384    jne         0070836B
 00708386    xor         eax,eax
 00708388    pop         ebp
 00708389    ret
*}
end;

//0070838C
procedure CreateEnum(TypeDesc:TTypeDesc; const TypeInfo:ITypeInfo; DispId:Integer);
begin
{*
 0070838C    push        ebp
 0070838D    mov         ebp,esp
 0070838F    add         esp,0FFFFFFF0
 00708392    push        ebx
 00708393    push        esi
 00708394    push        edi
 00708395    xor         ebx,ebx
 00708397    mov         dword ptr [ebp-4],ebx
 0070839A    mov         esi,eax
 0070839C    lea         edi,[ebp-0C]
 0070839F    movs        dword ptr [edi],dword ptr [esi]
 007083A0    movs        dword ptr [edi],dword ptr [esi]
 007083A1    mov         esi,ecx
 007083A3    mov         ebx,edx
 007083A5    xor         eax,eax
 007083A7    push        ebp
 007083A8    push        70846C
 007083AD    push        dword ptr fs:[eax]
 007083B0    mov         dword ptr fs:[eax],esp
 007083B3    cmp         word ptr [ebp-8],1D
>007083B8    jne         00708456
 007083BE    lea         eax,[ebp-4]
 007083C1    call        @IntfClear
 007083C6    push        eax
 007083C7    mov         eax,dword ptr [ebp-0C]
 007083CA    push        eax
 007083CB    push        ebx
 007083CC    mov         eax,dword ptr [ebx]
 007083CE    call        dword ptr [eax+38]
 007083D1    call        OleCheck
 007083D6    lea         eax,[ebp-10]
 007083D9    push        eax
 007083DA    mov         eax,dword ptr [ebp-4]
 007083DD    push        eax
 007083DE    mov         eax,dword ptr [eax]
 007083E0    call        dword ptr [eax+0C]
 007083E3    call        OleCheck
 007083E8    xor         eax,eax
 007083EA    push        ebp
 007083EB    push        70844F
 007083F0    push        dword ptr fs:[eax]
 007083F3    mov         dword ptr fs:[eax],esp
 007083F6    mov         eax,dword ptr [ebp-10]
 007083F9    cmp         dword ptr [eax+28],0
>007083FD    jne         00708434
 007083FF    mov         eax,dword ptr [ebp-10]
 00708402    movzx       eax,word ptr [eax+2E]
 00708406    push        eax
 00708407    mov         eax,dword ptr [ebp-4]
 0070840A    push        eax
 0070840B    mov         ecx,esi
 0070840D    mov         dl,1
 0070840F    mov         eax,[00706308];TEnumPropDesc
 00708414    call        TEnumPropDesc.Create
 00708419    push        eax
 0070841A    mov         eax,dword ptr [ebp+8]
 0070841D    mov         eax,dword ptr [eax-4]
 00708420    mov         eax,dword ptr [eax+270]
 00708426    mov         eax,dword ptr [eax+4C]
 00708429    call        TList.Expand
 0070842E    pop         edx
 0070842F    call        TList.Add
 00708434    xor         eax,eax
 00708436    pop         edx
 00708437    pop         ecx
 00708438    pop         ecx
 00708439    mov         dword ptr fs:[eax],edx
 0070843C    push        708456
 00708441    mov         eax,dword ptr [ebp-10]
 00708444    push        eax
 00708445    mov         eax,dword ptr [ebp-4]
 00708448    push        eax
 00708449    mov         eax,dword ptr [eax]
 0070844B    call        dword ptr [eax+4C]
 0070844E    ret
>0070844F    jmp         @HandleFinally
>00708454    jmp         00708441
 00708456    xor         eax,eax
 00708458    pop         edx
 00708459    pop         ecx
 0070845A    pop         ecx
 0070845B    mov         dword ptr fs:[eax],edx
 0070845E    push        708473
 00708463    lea         eax,[ebp-4]
 00708466    call        @IntfClear
 0070846B    ret
>0070846C    jmp         @HandleFinally
>00708471    jmp         00708463
 00708473    pop         edi
 00708474    pop         esi
 00708475    pop         ebx
 00708476    mov         esp,ebp
 00708478    pop         ebp
 00708479    ret
*}
end;

//0070847C
procedure ProcessTypeInfo(const TypeInfo:ITypeInfo);
begin
{*
 0070847C    push        ebp
 0070847D    mov         ebp,esp
 0070847F    add         esp,0FFFFFFE0
 00708482    xor         edx,edx
 00708484    mov         dword ptr [ebp-4],edx
 00708487    mov         dword ptr [ebp-8],eax
 0070848A    xor         eax,eax
 0070848C    push        ebp
 0070848D    push        7086EE
 00708492    push        dword ptr fs:[eax]
 00708495    mov         dword ptr fs:[eax],esp
 00708498    lea         eax,[ebp-10]
 0070849B    push        eax
 0070849C    mov         eax,dword ptr [ebp-8]
 0070849F    push        eax
 007084A0    mov         eax,dword ptr [eax]
 007084A2    call        dword ptr [eax+0C]
 007084A5    call        OleCheck
 007084AA    xor         edx,edx
 007084AC    push        ebp
 007084AD    push        7086D1
 007084B2    push        dword ptr fs:[edx]
 007084B5    mov         dword ptr fs:[edx],esp
 007084B8    mov         edx,7086FC
 007084BD    mov         eax,dword ptr [ebp-10]
 007084C0    call        IsEqualGUID
 007084C5    test        al,al
>007084C7    je          007084D3
 007084C9    call        @TryFinallyExit
>007084CE    jmp         007086D8
 007084D3    mov         eax,dword ptr [ebp-10]
 007084D6    cmp         dword ptr [eax+28],3
>007084DA    je          007084E5
 007084DC    mov         eax,dword ptr [ebp-10]
 007084DF    test        byte ptr [eax+36],40
>007084E3    je          0070852A
 007084E5    mov         eax,dword ptr [ebp-10]
 007084E8    test        byte ptr [eax+36],80
>007084EC    je          0070852A
 007084EE    lea         eax,[ebp-1C]
 007084F1    push        eax
 007084F2    push        0
 007084F4    mov         eax,dword ptr [ebp-8]
 007084F7    push        eax
 007084F8    mov         eax,dword ptr [eax]
 007084FA    call        dword ptr [eax+20]
 007084FD    call        OleCheck
 00708502    lea         eax,[ebp-4]
 00708505    call        @IntfClear
 0070850A    push        eax
 0070850B    mov         eax,dword ptr [ebp-1C]
 0070850E    push        eax
 0070850F    mov         eax,dword ptr [ebp-8]
 00708512    push        eax
 00708513    mov         eax,dword ptr [eax]
 00708515    call        dword ptr [eax+38]
 00708518    call        OleCheck
 0070851D    mov         eax,dword ptr [ebp+8]
 00708520    push        eax
 00708521    mov         eax,dword ptr [ebp-4]
 00708524    call        ProcessTypeInfo
 00708529    pop         ecx
 0070852A    mov         eax,dword ptr [ebp-10]
 0070852D    movzx       eax,word ptr [eax+2E]
 00708531    dec         eax
 00708532    test        eax,eax
>00708534    jl          007085A7
 00708536    inc         eax
 00708537    mov         dword ptr [ebp-20],eax
 0070853A    mov         dword ptr [ebp-0C],0
 00708541    lea         eax,[ebp-14]
 00708544    push        eax
 00708545    mov         eax,dword ptr [ebp-0C]
 00708548    push        eax
 00708549    mov         eax,dword ptr [ebp-8]
 0070854C    push        eax
 0070854D    mov         eax,dword ptr [eax]
 0070854F    call        dword ptr [eax+18]
 00708552    call        OleCheck
 00708557    xor         eax,eax
 00708559    push        ebp
 0070855A    push        708598
 0070855F    push        dword ptr fs:[eax]
 00708562    mov         dword ptr fs:[eax],esp
 00708565    mov         eax,dword ptr [ebp+8]
 00708568    push        eax
 00708569    mov         eax,dword ptr [ebp-14]
 0070856C    mov         ecx,dword ptr [eax]
 0070856E    mov         eax,dword ptr [ebp-14]
 00708571    add         eax,0C
 00708574    mov         edx,dword ptr [ebp-8]
 00708577    call        CreateEnum
 0070857C    pop         ecx
 0070857D    xor         eax,eax
 0070857F    pop         edx
 00708580    pop         ecx
 00708581    pop         ecx
 00708582    mov         dword ptr fs:[eax],edx
 00708585    push        70859F
 0070858A    mov         eax,dword ptr [ebp-14]
 0070858D    push        eax
 0070858E    mov         eax,dword ptr [ebp-8]
 00708591    push        eax
 00708592    mov         eax,dword ptr [eax]
 00708594    call        dword ptr [eax+54]
 00708597    ret
>00708598    jmp         @HandleFinally
>0070859D    jmp         0070858A
 0070859F    inc         dword ptr [ebp-0C]
 007085A2    dec         dword ptr [ebp-20]
>007085A5    jne         00708541
 007085A7    mov         eax,dword ptr [ebp-10]
 007085AA    movzx       eax,word ptr [eax+2C]
 007085AE    dec         eax
 007085AF    test        eax,eax
>007085B1    jl          007086B6
 007085B7    inc         eax
 007085B8    mov         dword ptr [ebp-20],eax
 007085BB    mov         dword ptr [ebp-0C],0
 007085C2    lea         eax,[ebp-18]
 007085C5    push        eax
 007085C6    mov         eax,dword ptr [ebp-0C]
 007085C9    push        eax
 007085CA    mov         eax,dword ptr [ebp-8]
 007085CD    push        eax
 007085CE    mov         eax,dword ptr [eax]
 007085D0    call        dword ptr [eax+14]
 007085D3    call        OleCheck
 007085D8    xor         edx,edx
 007085DA    push        ebp
 007085DB    push        7086A3
 007085E0    push        dword ptr fs:[edx]
 007085E3    mov         dword ptr fs:[edx],esp
 007085E6    mov         eax,dword ptr [ebp+8]
 007085E9    push        eax
 007085EA    mov         eax,dword ptr [ebp-18]
 007085ED    mov         eax,dword ptr [eax]
 007085EF    call        FindMember
 007085F4    pop         ecx
 007085F5    test        al,al
>007085F7    jne         00708688
 007085FD    mov         eax,dword ptr [ebp-18]
 00708600    mov         eax,dword ptr [eax+10]
 00708603    sub         eax,2
>00708606    je          00708614
 00708608    sub         eax,2
>0070860B    je          0070862E
 0070860D    sub         eax,4
>00708610    je          00708655
>00708612    jmp         00708688
 00708614    mov         eax,dword ptr [ebp+8]
 00708617    push        eax
 00708618    mov         eax,dword ptr [ebp-18]
 0070861B    mov         ecx,dword ptr [eax]
 0070861D    mov         eax,dword ptr [ebp-18]
 00708620    add         eax,20
 00708623    mov         edx,dword ptr [ebp-8]
 00708626    call        CreateEnum
 0070862B    pop         ecx
>0070862C    jmp         00708688
 0070862E    mov         eax,dword ptr [ebp+8]
 00708631    push        eax
 00708632    mov         eax,dword ptr [ebp-18]
 00708635    movsx       eax,word ptr [eax+18]
 00708639    add         eax,eax
 0070863B    mov         edx,dword ptr [ebp-18]
 0070863E    mov         edx,dword ptr [edx+8]
 00708641    lea         eax,[edx+eax*8-10]
 00708645    mov         edx,dword ptr [ebp-18]
 00708648    mov         ecx,dword ptr [edx]
 0070864A    mov         edx,dword ptr [ebp-8]
 0070864D    call        CreateEnum
 00708652    pop         ecx
>00708653    jmp         00708688
 00708655    mov         eax,dword ptr [ebp-18]
 00708658    movsx       eax,word ptr [eax+18]
 0070865C    add         eax,eax
 0070865E    mov         edx,dword ptr [ebp-18]
 00708661    mov         edx,dword ptr [edx+8]
 00708664    cmp         word ptr [edx+eax*8-0C],1A
>0070866A    jne         00708688
 0070866C    mov         edx,dword ptr [ebp+8]
 0070866F    push        edx
 00708670    mov         edx,dword ptr [ebp-18]
 00708673    mov         edx,dword ptr [edx+8]
 00708676    mov         eax,dword ptr [edx+eax*8-10]
 0070867A    mov         edx,dword ptr [ebp-18]
 0070867D    mov         ecx,dword ptr [edx]
 0070867F    mov         edx,dword ptr [ebp-8]
 00708682    call        CreateEnum
 00708687    pop         ecx
 00708688    xor         eax,eax
 0070868A    pop         edx
 0070868B    pop         ecx
 0070868C    pop         ecx
 0070868D    mov         dword ptr fs:[eax],edx
 00708690    push        7086AA
 00708695    mov         eax,dword ptr [ebp-18]
 00708698    push        eax
 00708699    mov         eax,dword ptr [ebp-8]
 0070869C    push        eax
 0070869D    mov         eax,dword ptr [eax]
 0070869F    call        dword ptr [eax+50]
 007086A2    ret
>007086A3    jmp         @HandleFinally
>007086A8    jmp         00708695
 007086AA    inc         dword ptr [ebp-0C]
 007086AD    dec         dword ptr [ebp-20]
>007086B0    jne         007085C2
 007086B6    xor         eax,eax
 007086B8    pop         edx
 007086B9    pop         ecx
 007086BA    pop         ecx
 007086BB    mov         dword ptr fs:[eax],edx
 007086BE    push        7086D8
 007086C3    mov         eax,dword ptr [ebp-10]
 007086C6    push        eax
 007086C7    mov         eax,dword ptr [ebp-8]
 007086CA    push        eax
 007086CB    mov         eax,dword ptr [eax]
 007086CD    call        dword ptr [eax+4C]
 007086D0    ret
>007086D1    jmp         @HandleFinally
>007086D6    jmp         007086C3
 007086D8    xor         eax,eax
 007086DA    pop         edx
 007086DB    pop         ecx
 007086DC    pop         ecx
 007086DD    mov         dword ptr fs:[eax],edx
 007086E0    push        7086F5
 007086E5    lea         eax,[ebp-4]
 007086E8    call        @IntfClear
 007086ED    ret
>007086EE    jmp         @HandleFinally
>007086F3    jmp         007086E5
 007086F5    mov         esp,ebp
 007086F7    pop         ebp
 007086F8    ret
*}
end;

//0070870C
procedure TOleControl.CreateEnumPropDescs;
begin
{*
 0070870C    push        ebp
 0070870D    mov         ebp,esp
 0070870F    add         esp,0FFFFFFF8
 00708712    push        ebx
 00708713    push        esi
 00708714    push        edi
 00708715    xor         edx,edx
 00708717    mov         dword ptr [ebp-8],edx
 0070871A    mov         dword ptr [ebp-4],eax
 0070871D    xor         eax,eax
 0070871F    push        ebp
 00708720    push        7087BB
 00708725    push        dword ptr fs:[eax]
 00708728    mov         dword ptr fs:[eax],esp
 0070872B    mov         eax,dword ptr [ebp-4]
 0070872E    call        TOleControl.CreateControl
 00708733    mov         dl,1
 00708735    mov         eax,[00439644];TList
 0070873A    call        TObject.Create
 0070873F    mov         edx,dword ptr [ebp-4]
 00708742    mov         edx,dword ptr [edx+270]
 00708748    mov         dword ptr [edx+4C],eax
 0070874B    xor         eax,eax
 0070874D    push        ebp
 0070874E    push        70878E
 00708753    push        dword ptr fs:[eax]
 00708756    mov         dword ptr fs:[eax],esp
 00708759    lea         eax,[ebp-8]
 0070875C    call        @IntfClear
 00708761    push        eax
 00708762    push        0
 00708764    push        0
 00708766    mov         eax,dword ptr [ebp-4]
 00708769    mov         eax,dword ptr [eax+28C]
 0070876F    push        eax
 00708770    mov         eax,dword ptr [eax]
 00708772    call        dword ptr [eax+10]
 00708775    call        OleCheck
 0070877A    push        ebp
 0070877B    mov         eax,dword ptr [ebp-8]
 0070877E    call        ProcessTypeInfo
 00708783    pop         ecx
 00708784    xor         eax,eax
 00708786    pop         edx
 00708787    pop         ecx
 00708788    pop         ecx
 00708789    mov         dword ptr fs:[eax],edx
>0070878C    jmp         007087A5
>0070878E    jmp         @HandleAnyException
 00708793    mov         eax,dword ptr [ebp-4]
 00708796    call        TOleControl.DestroyEnumPropDescs
 0070879B    call        @RaiseAgain
 007087A0    call        @DoneExcept
 007087A5    xor         eax,eax
 007087A7    pop         edx
 007087A8    pop         ecx
 007087A9    pop         ecx
 007087AA    mov         dword ptr fs:[eax],edx
 007087AD    push        7087C2
 007087B2    lea         eax,[ebp-8]
 007087B5    call        @IntfClear
 007087BA    ret
>007087BB    jmp         @HandleFinally
>007087C0    jmp         007087B2
 007087C2    pop         edi
 007087C3    pop         esi
 007087C4    pop         ebx
 007087C5    pop         ecx
 007087C6    pop         ecx
 007087C7    pop         ebp
 007087C8    ret
*}
end;

//007087CC
procedure LicenseCheck(Status:HRESULT; const Ident:UnicodeString);
begin
{*
 007087CC    push        ebp
 007087CD    mov         ebp,esp
 007087CF    add         esp,0FFFFFFF4
 007087D2    push        ebx
 007087D3    xor         ecx,ecx
 007087D5    mov         dword ptr [ebp-0C],ecx
 007087D8    mov         ebx,edx
 007087DA    xor         edx,edx
 007087DC    push        ebp
 007087DD    push        70883D
 007087E2    push        dword ptr fs:[edx]
 007087E5    mov         dword ptr fs:[edx],esp
 007087E8    cmp         eax,80040112
>007087ED    jne         00708822
 007087EF    lea         edx,[ebp-0C]
 007087F2    mov         eax,dword ptr [ebp+8]
 007087F5    mov         eax,dword ptr [eax-4]
 007087F8    mov         eax,dword ptr [eax]
 007087FA    call        TObject.ClassName
 007087FF    mov         eax,dword ptr [ebp-0C]
 00708802    mov         dword ptr [ebp-8],eax
 00708805    mov         byte ptr [ebp-4],11
 00708809    lea         eax,[ebp-8]
 0070880C    push        eax
 0070880D    push        0
 0070880F    mov         ecx,ebx
 00708811    mov         dl,1
 00708813    mov         eax,[0052E700];EOleError
 00708818    call        Exception.CreateFmt
 0070881D    call        @RaiseExcept
 00708822    call        OleCheck
 00708827    xor         eax,eax
 00708829    pop         edx
 0070882A    pop         ecx
 0070882B    pop         ecx
 0070882C    mov         dword ptr fs:[eax],edx
 0070882F    push        708844
 00708834    lea         eax,[ebp-0C]
 00708837    call        @UStrClr
 0070883C    ret
>0070883D    jmp         @HandleFinally
>00708842    jmp         00708834
 00708844    pop         ebx
 00708845    mov         esp,ebp
 00708847    pop         ebp
 00708848    ret
*}
end;

//0070884C
procedure TOleControl.CreateInstance;
begin
{*
 0070884C    push        ebp
 0070884D    mov         ebp,esp
 0070884F    xor         ecx,ecx
 00708851    push        ecx
 00708852    push        ecx
 00708853    push        ecx
 00708854    push        ecx
 00708855    push        ecx
 00708856    mov         dword ptr [ebp-4],eax
 00708859    xor         eax,eax
 0070885B    push        ebp
 0070885C    push        708966
 00708861    push        dword ptr fs:[eax]
 00708864    mov         dword ptr fs:[eax],esp
 00708867    mov         eax,dword ptr [ebp-4]
 0070886A    test        byte ptr [eax+1C],10
>0070886E    jne         007088FC
 00708874    mov         eax,dword ptr [ebp-4]
 00708877    mov         eax,dword ptr [eax+270]
 0070887D    cmp         dword ptr [eax+28],0
>00708881    je          007088FC
 00708883    lea         eax,[ebp-8]
 00708886    call        @IntfClear
 0070888B    push        eax
 0070888C    push        708974
 00708891    push        0
 00708893    push        5
 00708895    mov         eax,dword ptr [ebp-4]
 00708898    mov         eax,dword ptr [eax+270]
 0070889E    push        eax
 0070889F    call        ole32.CoGetClassObject
 007088A4    call        OleCheck
 007088A9    lea         eax,[ebp-0C]
 007088AC    mov         edx,dword ptr [ebp-4]
 007088AF    mov         edx,dword ptr [edx+270]
 007088B5    mov         edx,dword ptr [edx+28]
 007088B8    call        @WStrFromPWChar
 007088BD    push        ebp
 007088BE    lea         edx,[ebp-10]
 007088C1    mov         eax,[0078CCA8];^SResString710:TResStringRec
 007088C6    call        LoadResString
 007088CB    mov         eax,dword ptr [ebp-10]
 007088CE    push        eax
 007088CF    mov         eax,dword ptr [ebp-4]
 007088D2    add         eax,280
 007088D7    call        @IntfClear
 007088DC    push        eax
 007088DD    mov         eax,dword ptr [ebp-0C]
 007088E0    push        eax
 007088E1    push        708984
 007088E6    push        0
 007088E8    push        0
 007088EA    mov         eax,dword ptr [ebp-8]
 007088ED    push        eax
 007088EE    mov         eax,dword ptr [eax]
 007088F0    call        dword ptr [eax+1C]
 007088F3    pop         edx
 007088F4    call        LicenseCheck
 007088F9    pop         ecx
>007088FA    jmp         0070893B
 007088FC    push        ebp
 007088FD    lea         edx,[ebp-14]
 00708900    mov         eax,[0078D85C];^SResString711:TResStringRec
 00708905    call        LoadResString
 0070890A    mov         eax,dword ptr [ebp-14]
 0070890D    push        eax
 0070890E    mov         eax,dword ptr [ebp-4]
 00708911    add         eax,280
 00708916    call        @IntfClear
 0070891B    push        eax
 0070891C    push        708984
 00708921    push        5
 00708923    push        0
 00708925    mov         eax,dword ptr [ebp-4]
 00708928    mov         eax,dword ptr [eax+270]
 0070892E    push        eax
 0070892F    call        ole32.CoCreateInstance
 00708934    pop         edx
 00708935    call        LicenseCheck
 0070893A    pop         ecx
 0070893B    xor         eax,eax
 0070893D    pop         edx
 0070893E    pop         ecx
 0070893F    pop         ecx
 00708940    mov         dword ptr fs:[eax],edx
 00708943    push        70896D
 00708948    lea         eax,[ebp-14]
 0070894B    mov         edx,2
 00708950    call        @UStrArrayClr
 00708955    lea         eax,[ebp-0C]
 00708958    call        @WStrClr
 0070895D    lea         eax,[ebp-8]
 00708960    call        @IntfClear
 00708965    ret
>00708966    jmp         @HandleFinally
>0070896B    jmp         00708948
 0070896D    mov         esp,ebp
 0070896F    pop         ebp
 00708970    ret
*}
end;

//00708994
procedure TOleControl.CreateStorage;
begin
{*
 00708994    push        ebp
 00708995    mov         ebp,esp
 00708997    add         esp,0FFFFFFF8
 0070899A    push        ebx
 0070899B    push        esi
 0070899C    push        edi
 0070899D    xor         edx,edx
 0070899F    mov         dword ptr [ebp-4],edx
 007089A2    mov         dword ptr [ebp-8],eax
 007089A5    xor         eax,eax
 007089A7    push        ebp
 007089A8    push        708A66
 007089AD    push        dword ptr fs:[eax]
 007089B0    mov         dword ptr fs:[eax],esp
 007089B3    mov         eax,dword ptr [ebp-8]
 007089B6    call        TOleControl.DestroyStorage
 007089BB    mov         eax,dword ptr [ebp-8]
 007089BE    cmp         dword ptr [eax+284],0
>007089C5    je          00708A50
 007089CB    push        0
 007089CD    push        2
 007089CF    call        kernel32.GlobalAlloc
 007089D4    mov         ebx,eax
 007089D6    mov         eax,dword ptr [ebp-8]
 007089D9    mov         dword ptr [eax+27C],ebx
 007089DF    test        ebx,ebx
>007089E1    jne         007089E8
 007089E3    call        OutOfMemoryError
 007089E8    xor         eax,eax
 007089EA    push        ebp
 007089EB    push        708A39
 007089F0    push        dword ptr fs:[eax]
 007089F3    mov         dword ptr fs:[eax],esp
 007089F6    lea         eax,[ebp-4]
 007089F9    call        @IntfClear
 007089FE    push        eax
 007089FF    push        0
 00708A01    mov         eax,dword ptr [ebp-8]
 00708A04    mov         eax,dword ptr [eax+27C]
 00708A0A    push        eax
 00708A0B    call        ole32.CreateStreamOnHGlobal
 00708A10    call        OleCheck
 00708A15    push        0FF
 00708A17    mov         eax,dword ptr [ebp-4]
 00708A1A    push        eax
 00708A1B    mov         eax,dword ptr [ebp-8]
 00708A1E    mov         eax,dword ptr [eax+284]
 00708A24    push        eax
 00708A25    mov         eax,dword ptr [eax]
 00708A27    call        dword ptr [eax+18]
 00708A2A    call        OleCheck
 00708A2F    xor         eax,eax
 00708A31    pop         edx
 00708A32    pop         ecx
 00708A33    pop         ecx
 00708A34    mov         dword ptr fs:[eax],edx
>00708A37    jmp         00708A50
>00708A39    jmp         @HandleAnyException
 00708A3E    mov         eax,dword ptr [ebp-8]
 00708A41    call        TOleControl.DestroyStorage
 00708A46    call        @RaiseAgain
 00708A4B    call        @DoneExcept
 00708A50    xor         eax,eax
 00708A52    pop         edx
 00708A53    pop         ecx
 00708A54    pop         ecx
 00708A55    mov         dword ptr fs:[eax],edx
 00708A58    push        708A6D
 00708A5D    lea         eax,[ebp-4]
 00708A60    call        @IntfClear
 00708A65    ret
>00708A66    jmp         @HandleFinally
>00708A6B    jmp         00708A5D
 00708A6D    pop         edi
 00708A6E    pop         esi
 00708A6F    pop         ebx
 00708A70    pop         ecx
 00708A71    pop         ecx
 00708A72    pop         ebp
 00708A73    ret
*}
end;

//00708A74
procedure TOleControl.CreateWnd;
begin
{*
 00708A74    push        ebx
 00708A75    add         esp,0FFFFFFF0
 00708A78    mov         ebx,eax
 00708A7A    mov         eax,ebx
 00708A7C    call        TOleControl.CreateControl
 00708A81    test        byte ptr [ebx+2A5],4
>00708A88    jne         00708B09
 00708A8A    mov         edx,esp
 00708A8C    mov         eax,ebx
 00708A8E    call        TControl.GetBoundsRect
 00708A93    push        esp
 00708A94    mov         eax,ebx
 00708A96    call        TWinControl.GetParentHandle
 00708A9B    push        eax
 00708A9C    push        0
 00708A9E    mov         eax,ebx
 00708AA0    test        eax,eax
>00708AA2    je          00708AA9
 00708AA4    sub         eax,0FFFFFD14
 00708AA9    push        eax
 00708AAA    push        0
 00708AAC    push        0FB
 00708AAE    mov         eax,dword ptr [ebx+280]
 00708AB4    push        eax
 00708AB5    mov         eax,dword ptr [eax]
 00708AB7    call        dword ptr [eax+2C]
 00708ABA    cmp         dword ptr [ebx+294],0
>00708AC1    jne         00708ADA
 00708AC3    mov         ecx,dword ptr ds:[78D230];^SResString708:TResStringRec
 00708AC9    mov         dl,1
 00708ACB    mov         eax,[0052E700];EOleError
 00708AD0    call        Exception.CreateRes
 00708AD5    call        @RaiseExcept
 00708ADA    mov         eax,ebx
 00708ADC    call        TOleControl.HookControlWndProc
 00708AE1    cmp         byte ptr [ebx+59],0
>00708AE5    jne         00708B10
 00708AE7    mov         eax,ebx
 00708AE9    call        TWinControl.GetHandle
 00708AEE    push        eax
 00708AEF    call        user32.IsWindowVisible
 00708AF4    test        eax,eax
>00708AF6    je          00708B10
 00708AF8    push        0
 00708AFA    mov         eax,ebx
 00708AFC    call        TWinControl.GetHandle
 00708B01    push        eax
 00708B02    call        user32.ShowWindow
>00708B07    jmp         00708B10
 00708B09    mov         eax,ebx
 00708B0B    call        TWinControl.CreateWnd
 00708B10    add         esp,10
 00708B13    pop         ebx
 00708B14    ret
*}
end;

//00708B18
{*procedure TOleControl.DefaultHandler(var Message:?);
begin
 00708B18    push        ebp
 00708B19    mov         ebp,esp
 00708B1B    push        ebx
 00708B1C    push        esi
 00708B1D    push        edi
 00708B1E    mov         esi,edx
 00708B20    mov         ebx,eax
 00708B22    xor         edx,edx
 00708B24    push        ebp
 00708B25    push        708B99
 00708B2A    push        dword ptr fs:[edx]
 00708B2D    mov         dword ptr fs:[edx],esp
 00708B30    mov         eax,ebx
 00708B32    call        TWinControl.HandleAllocated
 00708B37    test        al,al
>00708B39    je          00708B86
 00708B3B    mov         eax,dword ptr [esi]
 00708B3D    cmp         eax,0BC00
>00708B42    jb          00708B51
 00708B44    cmp         eax,0C000
>00708B49    jae         00708B51
 00708B4B    sub         dword ptr [esi],9C00
 00708B51    test        byte ptr [ebx+2A6],1
>00708B58    jne         00708B86
 00708B5A    mov         eax,dword ptr [esi+8]
 00708B5D    push        eax
 00708B5E    mov         eax,dword ptr [esi+4]
 00708B61    push        eax
 00708B62    mov         eax,dword ptr [esi]
 00708B64    push        eax
 00708B65    mov         eax,ebx
 00708B67    call        TWinControl.GetHandle
 00708B6C    push        eax
 00708B6D    mov         eax,dword ptr [ebx+254]
 00708B73    push        eax
 00708B74    call        user32.CallWindowProcW
 00708B79    mov         dword ptr [esi+0C],eax
 00708B7C    xor         eax,eax
 00708B7E    pop         edx
 00708B7F    pop         ecx
 00708B80    pop         ecx
 00708B81    mov         dword ptr fs:[eax],edx
>00708B84    jmp         00708BA3
 00708B86    mov         edx,esi
 00708B88    mov         eax,ebx
 00708B8A    call        TWinControl.DefaultHandler
 00708B8F    xor         eax,eax
 00708B91    pop         edx
 00708B92    pop         ecx
 00708B93    pop         ecx
 00708B94    mov         dword ptr fs:[eax],edx
>00708B97    jmp         00708BA3
>00708B99    jmp         @HandleAnyException
 00708B9E    call        @DoneExcept
 00708BA3    pop         edi
 00708BA4    pop         esi
 00708BA5    pop         ebx
 00708BA6    pop         ebp
 00708BA7    ret
end;*}

//00708BA8
function TOleControl.SuppressException(E:Exception):Boolean;
begin
{*
 00708BA8    push        ebx
 00708BA9    push        esi
 00708BAA    mov         esi,edx
 00708BAC    mov         ebx,eax
 00708BAE    mov         eax,esi
 00708BB0    mov         edx,dword ptr ds:[52E794];EOleSysError
 00708BB6    call        @IsClass
 00708BBB    test        al,al
>00708BBD    je          00708BC9
 00708BBF    test        byte ptr [ebx+1C],10
 00708BC3    setne       al
 00708BC6    pop         esi
 00708BC7    pop         ebx
 00708BC8    ret
 00708BC9    xor         eax,eax
 00708BCB    pop         esi
 00708BCC    pop         ebx
 00708BCD    ret
*}
end;

//00708BD0
procedure TOleControl.DefineProperties(Filer:TFiler);
begin
{*
 00708BD0    push        ebp
 00708BD1    mov         ebp,esp
 00708BD3    push        ecx
 00708BD4    push        ebx
 00708BD5    push        esi
 00708BD6    push        edi
 00708BD7    mov         ebx,edx
 00708BD9    mov         dword ptr [ebp-4],eax
 00708BDC    xor         eax,eax
 00708BDE    push        ebp
 00708BDF    push        708C29
 00708BE4    push        dword ptr fs:[eax]
 00708BE7    mov         dword ptr fs:[eax],esp
 00708BEA    mov         edx,ebx
 00708BEC    mov         eax,dword ptr [ebp-4]
 00708BEF    call        TWinControl.DefineProperties
 00708BF4    mov         eax,dword ptr [ebp-4]
 00708BF7    push        eax
 00708BF8    push        709C68;TOleControl.ReadData
 00708BFD    mov         eax,dword ptr [ebp-4]
 00708C00    push        eax
 00708C01    push        70A6EC;TOleControl.WriteData
 00708C06    mov         eax,dword ptr [ebp-4]
 00708C09    cmp         dword ptr [eax+280],0
 00708C10    setne       cl
 00708C13    mov         edx,708C6C;'ControlData'
 00708C18    mov         eax,ebx
 00708C1A    mov         ebx,dword ptr [eax]
 00708C1C    call        dword ptr [ebx+8]
 00708C1F    xor         eax,eax
 00708C21    pop         edx
 00708C22    pop         ecx
 00708C23    pop         ecx
 00708C24    mov         dword ptr fs:[eax],edx
>00708C27    jmp         00708C57
>00708C29    jmp         @HandleOnException
 00708C2E    dd          1
 00708C32    dd          00418C04;Exception
 00708C36    dd          00708C3A
 00708C3A    mov         ebx,eax
 00708C3C    mov         edx,ebx
 00708C3E    mov         eax,dword ptr [ebp-4]
 00708C41    mov         ecx,dword ptr [eax]
 00708C43    call        dword ptr [ecx+0FC]
 00708C49    test        al,al
>00708C4B    jne         00708C52
 00708C4D    call        @RaiseAgain
 00708C52    call        @DoneExcept
 00708C57    pop         edi
 00708C58    pop         esi
 00708C59    pop         ebx
 00708C5A    pop         ecx
 00708C5B    pop         ebp
 00708C5C    ret
*}
end;

//00708C84
procedure TOleControl.DesignModified;
begin
{*
 00708C84    mov         dl,1
 00708C86    call        GetParentForm
 00708C8B    test        eax,eax
>00708C8D    je          00708CA3
 00708C8F    cmp         dword ptr [eax+2BC],0
>00708C96    je          00708CA3
 00708C98    mov         eax,dword ptr [eax+2BC]
 00708C9E    mov         edx,dword ptr [eax]
 00708CA0    call        dword ptr [edx+0C]
 00708CA3    ret
*}
end;

//00708CA4
procedure TOleControl.DestroyControl;
begin
{*
 00708CA4    push        ebx
 00708CA5    mov         ebx,eax
 00708CA7    lea         ecx,[ebx+2A0]
 00708CAD    mov         eax,dword ptr [ebx+270]
 00708CB3    lea         edx,[eax+10]
 00708CB6    mov         eax,dword ptr [ebx+280]
 00708CBC    call        InterfaceDisconnect
 00708CC1    lea         ecx,[ebx+29C]
 00708CC7    mov         edx,708CFC
 00708CCC    mov         eax,dword ptr [ebx+280]
 00708CD2    call        InterfaceDisconnect
 00708CD7    lea         eax,[ebx+290]
 00708CDD    call        @IntfClear
 00708CE2    lea         eax,[ebx+28C]
 00708CE8    call        @IntfClear
 00708CED    lea         eax,[ebx+288]
 00708CF3    call        @IntfClear
 00708CF8    pop         ebx
 00708CF9    ret
*}
end;

//00708D0C
procedure TOleControl.DestroyEnumPropDescs;
begin
{*
 00708D0C    push        ebx
 00708D0D    push        esi
 00708D0E    push        edi
 00708D0F    mov         ebx,dword ptr [eax+270]
 00708D15    mov         eax,dword ptr [ebx+4C]
 00708D18    test        eax,eax
>00708D1A    je          00708D47
 00708D1C    mov         esi,dword ptr [eax+8]
 00708D1F    dec         esi
 00708D20    test        esi,esi
>00708D22    jl          00708D3A
 00708D24    inc         esi
 00708D25    xor         edi,edi
 00708D27    mov         edx,edi
 00708D29    mov         eax,dword ptr [ebx+4C]
 00708D2C    call        TList.Get
 00708D31    call        TObject.Free
 00708D36    inc         edi
 00708D37    dec         esi
>00708D38    jne         00708D27
 00708D3A    mov         eax,dword ptr [ebx+4C]
 00708D3D    call        TObject.Free
 00708D42    xor         eax,eax
 00708D44    mov         dword ptr [ebx+4C],eax
 00708D47    pop         edi
 00708D48    pop         esi
 00708D49    pop         ebx
 00708D4A    ret
*}
end;

//00708D4C
procedure TOleControl.DestroyStorage;
begin
{*
 00708D4C    push        ebx
 00708D4D    mov         ebx,eax
 00708D4F    mov         eax,dword ptr [ebx+27C]
 00708D55    test        eax,eax
>00708D57    je          00708D67
 00708D59    push        eax
 00708D5A    call        kernel32.GlobalFree
 00708D5F    xor         eax,eax
 00708D61    mov         dword ptr [ebx+27C],eax
 00708D67    pop         ebx
 00708D68    ret
*}
end;

//00708D6C
procedure TOleControl.DestroyWindowHandle;
begin
{*
 00708D6C    push        ebx
 00708D6D    mov         ebx,eax
 00708D6F    test        byte ptr [ebx+2A5],4
>00708D76    jne         00708DAE
 00708D78    mov         eax,dword ptr [ebx+254]
 00708D7E    push        eax
 00708D7F    push        0FC
 00708D81    mov         eax,dword ptr [ebx+258]
 00708D87    push        eax
 00708D88    call        user32.SetWindowLongW
 00708D8D    cmp         dword ptr [ebx+280],0
>00708D94    je          00708DA4
 00708D96    push        1
 00708D98    mov         eax,dword ptr [ebx+280]
 00708D9E    push        eax
 00708D9F    mov         eax,dword ptr [eax]
 00708DA1    call        dword ptr [eax+18]
 00708DA4    xor         eax,eax
 00708DA6    mov         dword ptr [ebx+258],eax
 00708DAC    pop         ebx
 00708DAD    ret
 00708DAE    mov         eax,ebx
 00708DB0    call        TWinControl.DestroyWindowHandle
 00708DB5    pop         ebx
 00708DB6    ret
*}
end;

//00708DB8
procedure TOleControl.DoObjectVerb(Verb:Integer);
begin
{*
 00708DB8    push        ebp
 00708DB9    mov         ebp,esp
 00708DBB    add         esp,0FFFFFFE4
 00708DBE    push        ebx
 00708DBF    mov         ebx,edx
 00708DC1    mov         dword ptr [ebp-4],eax
 00708DC4    mov         eax,dword ptr [ebp-4]
 00708DC7    call        TOleControl.CreateControl
 00708DCC    call        user32.GetActiveWindow
 00708DD1    mov         dword ptr [ebp-8],eax
 00708DD4    xor         eax,eax
 00708DD6    call        DisableTaskWindows
 00708DDB    mov         dword ptr [ebp-0C],eax
 00708DDE    xor         eax,eax
 00708DE0    push        ebp
 00708DE1    push        708E52
 00708DE6    push        dword ptr fs:[eax]
 00708DE9    mov         dword ptr fs:[eax],esp
 00708DEC    lea         edx,[ebp-1C]
 00708DEF    mov         eax,dword ptr [ebp-4]
 00708DF2    call        TControl.GetBoundsRect
 00708DF7    lea         eax,[ebp-1C]
 00708DFA    push        eax
 00708DFB    mov         eax,dword ptr [ebp-4]
 00708DFE    call        TWinControl.GetParentHandle
 00708E03    push        eax
 00708E04    push        0
 00708E06    mov         eax,dword ptr [ebp-4]
 00708E09    test        eax,eax
>00708E0B    je          00708E12
 00708E0D    sub         eax,0FFFFFD14
 00708E12    push        eax
 00708E13    push        0
 00708E15    push        ebx
 00708E16    mov         eax,dword ptr [ebp-4]
 00708E19    mov         eax,dword ptr [eax+280]
 00708E1F    push        eax
 00708E20    mov         eax,dword ptr [eax]
 00708E22    call        dword ptr [eax+2C]
 00708E25    call        OleCheck
 00708E2A    xor         eax,eax
 00708E2C    pop         edx
 00708E2D    pop         ecx
 00708E2E    pop         ecx
 00708E2F    mov         dword ptr fs:[eax],edx
 00708E32    push        708E59
 00708E37    mov         eax,dword ptr [ebp-0C]
 00708E3A    call        EnableTaskWindows
 00708E3F    mov         eax,dword ptr [ebp-8]
 00708E42    push        eax
 00708E43    call        user32.SetActiveWindow
 00708E48    mov         eax,dword ptr [ebp-8]
 00708E4B    push        eax
 00708E4C    call        user32.SetFocus
 00708E51    ret
>00708E52    jmp         @HandleFinally
>00708E57    jmp         00708E37
 00708E59    mov         eax,dword ptr [ebp-4]
 00708E5C    cmp         dword ptr [eax+284],0
>00708E63    je          00708E7F
 00708E65    mov         eax,dword ptr [ebp-4]
 00708E68    mov         eax,dword ptr [eax+284]
 00708E6E    push        eax
 00708E6F    mov         eax,dword ptr [eax]
 00708E71    call        dword ptr [eax+10]
 00708E74    dec         eax
>00708E75    je          00708E7F
 00708E77    mov         eax,dword ptr [ebp-4]
 00708E7A    call        TOleControl.DesignModified
 00708E7F    pop         ebx
 00708E80    mov         esp,ebp
 00708E82    pop         ebp
 00708E83    ret
*}
end;

//00708E84
function TOleControl.GetEnumPropDesc(DispID:Integer):TEnumPropDesc;
begin
{*
 00708E84    push        ebx
 00708E85    push        esi
 00708E86    push        edi
 00708E87    push        ebp
 00708E88    mov         ebp,edx
 00708E8A    mov         edi,dword ptr [eax+270]
 00708E90    cmp         dword ptr [edi+4C],0
>00708E94    jne         00708E9B
 00708E96    call        TOleControl.CreateEnumPropDescs
 00708E9B    mov         eax,dword ptr [edi+4C]
 00708E9E    mov         ebx,dword ptr [eax+8]
 00708EA1    dec         ebx
 00708EA2    test        ebx,ebx
>00708EA4    jl          00708EBC
 00708EA6    inc         ebx
 00708EA7    xor         esi,esi
 00708EA9    mov         eax,dword ptr [edi+4C]
 00708EAC    mov         edx,esi
 00708EAE    call        TList.Get
 00708EB3    cmp         ebp,dword ptr [eax+4]
>00708EB6    je          00708EBE
 00708EB8    inc         esi
 00708EB9    dec         ebx
>00708EBA    jne         00708EA9
 00708EBC    xor         eax,eax
 00708EBE    pop         ebp
 00708EBF    pop         edi
 00708EC0    pop         esi
 00708EC1    pop         ebx
 00708EC2    ret
*}
end;

//00708EC4
procedure TOleControl.GetEventMethod(DispID:TDispID; var Method:TMethod);
begin
{*
 00708EC4    push        ebx
 00708EC5    push        esi
 00708EC6    push        edi
 00708EC7    push        ecx
 00708EC8    mov         ebx,eax
 00708ECA    mov         ecx,dword ptr [ebx+270]
 00708ED0    mov         edi,dword ptr [ecx+20]
 00708ED3    mov         esi,dword ptr [ecx+24]
 00708ED6    xor         eax,eax
>00708ED8    jmp         00708EE0
 00708EDA    cmp         edx,dword ptr [esi+eax*4]
>00708EDD    je          00708EEA
 00708EDF    inc         eax
 00708EE0    cmp         eax,edi
>00708EE2    jne         00708EDA
 00708EE4    xor         eax,eax
 00708EE6    xor         edx,edx
>00708EE8    jmp         00708F17
 00708EEA    push        eax
 00708EEB    cmp         dword ptr [ecx+30],191
>00708EF2    jb          00708EFB
 00708EF4    mov         eax,dword ptr [ecx+50]
 00708EF7    test        eax,eax
>00708EF9    jne         00708F0D
 00708EFB    mov         eax,dword ptr [ebx]
 00708EFD    call        TObject.ClassParent
 00708F02    call        TObject.InstanceSize
 00708F07    add         eax,7
 00708F0A    and         eax,0FFFFFFF8
 00708F0D    add         ebx,eax
 00708F0F    pop         eax
 00708F10    mov         edx,dword ptr [ebx+eax*8+4]
 00708F14    mov         eax,dword ptr [ebx+eax*8]
 00708F17    pop         ecx
 00708F18    mov         dword ptr [ecx],eax
 00708F1A    mov         dword ptr [ecx+4],edx
 00708F1D    pop         edi
 00708F1E    pop         esi
 00708F1F    pop         ebx
 00708F20    ret
*}
end;

//00708F24
procedure Exchange(var A:void ; var B:void );
begin
{*
 00708F24    mov         ecx,dword ptr [edx]
 00708F26    xchg        ecx,dword ptr [eax]
 00708F28    mov         dword ptr [edx],ecx
 00708F2A    ret
*}
end;

//00708F2C
function Find(const MemberStr:UnicodeString; var TypeInfo:ITypeInfo):Boolean;
begin
{*
 00708F2C    push        ebp
 00708F2D    mov         ebp,esp
 00708F2F    add         esp,0FFFFFFEC
 00708F32    push        ebx
 00708F33    push        esi
 00708F34    push        edi
 00708F35    xor         ecx,ecx
 00708F37    mov         dword ptr [ebp-4],ecx
 00708F3A    mov         esi,edx
 00708F3C    xor         eax,eax
 00708F3E    push        ebp
 00708F3F    push        709034
 00708F44    push        dword ptr fs:[eax]
 00708F47    mov         dword ptr fs:[eax],esp
 00708F4A    mov         byte ptr [ebp-5],0
 00708F4E    mov         eax,dword ptr [ebp+8]
 00708F51    mov         eax,dword ptr [eax-8]
 00708F54    call        00409460
 00708F59    mov         dword ptr [ebp-14],eax
 00708F5C    xor         eax,eax
 00708F5E    push        ebp
 00708F5F    push        709017
 00708F64    push        dword ptr fs:[eax]
 00708F67    mov         dword ptr fs:[eax],esp
 00708F6A    xor         ebx,ebx
 00708F6C    mov         eax,dword ptr [ebp+8]
 00708F6F    cmp         ebx,dword ptr [eax-0C]
>00708F72    jge         00709000
 00708F78    lea         eax,[ebp-0C]
 00708F7B    push        eax
 00708F7C    push        ebx
 00708F7D    mov         eax,dword ptr [esi]
 00708F7F    push        eax
 00708F80    mov         eax,dword ptr [eax]
 00708F82    call        dword ptr [eax+24]
 00708F85    call        OleCheck
 00708F8A    test        byte ptr [ebp-0C],3
>00708F8E    je          00708FF3
 00708F90    lea         eax,[ebp-10]
 00708F93    push        eax
 00708F94    push        ebx
 00708F95    mov         eax,dword ptr [esi]
 00708F97    push        eax
 00708F98    mov         eax,dword ptr [eax]
 00708F9A    call        dword ptr [eax+20]
 00708F9D    call        OleCheck
 00708FA2    lea         eax,[ebp-4]
 00708FA5    call        @IntfClear
 00708FAA    push        eax
 00708FAB    mov         eax,dword ptr [ebp-10]
 00708FAE    push        eax
 00708FAF    mov         eax,dword ptr [esi]
 00708FB1    push        eax
 00708FB2    mov         eax,dword ptr [eax]
 00708FB4    call        dword ptr [eax+38]
 00708FB7    call        OleCheck
 00708FBC    mov         eax,dword ptr [ebp+8]
 00708FBF    add         eax,0FFFFFFFC
 00708FC2    push        eax
 00708FC3    push        1
 00708FC5    lea         eax,[ebp-14]
 00708FC8    push        eax
 00708FC9    mov         eax,dword ptr [ebp-4]
 00708FCC    push        eax
 00708FCD    mov         eax,dword ptr [eax]
 00708FCF    call        dword ptr [eax+28]
 00708FD2    mov         edi,eax
 00708FD4    cmp         edi,80020006
>00708FDA    je          00708FF3
 00708FDC    mov         eax,edi
 00708FDE    call        OleCheck
 00708FE3    lea         edx,[ebp-4]
 00708FE6    mov         eax,esi
 00708FE8    call        Exchange
 00708FED    mov         byte ptr [ebp-5],1
>00708FF1    jmp         00709000
 00708FF3    inc         ebx
 00708FF4    mov         eax,dword ptr [ebp+8]
 00708FF7    cmp         ebx,dword ptr [eax-0C]
>00708FFA    jl          00708F78
 00709000    xor         eax,eax
 00709002    pop         edx
 00709003    pop         ecx
 00709004    pop         ecx
 00709005    mov         dword ptr fs:[eax],edx
 00709008    push        70901E
 0070900D    mov         eax,dword ptr [ebp-14]
 00709010    push        eax
 00709011    call        oleaut32.SysFreeString
 00709016    ret
>00709017    jmp         @HandleFinally
>0070901C    jmp         0070900D
 0070901E    xor         eax,eax
 00709020    pop         edx
 00709021    pop         ecx
 00709022    pop         ecx
 00709023    mov         dword ptr fs:[eax],edx
 00709026    push        70903B
 0070902B    lea         eax,[ebp-4]
 0070902E    call        @IntfClear
 00709033    ret
>00709034    jmp         @HandleFinally
>00709039    jmp         0070902B
 0070903B    movzx       eax,byte ptr [ebp-5]
 0070903F    pop         edi
 00709040    pop         esi
 00709041    pop         ebx
 00709042    mov         esp,ebp
 00709044    pop         ebp
 00709045    ret
*}
end;

//00709048
function TOleControl.GetHelpContext(Member:string; var HelpCtx:Integer; var HelpFile:string):Boolean;
begin
{*
 00709048    push        ebp
 00709049    mov         ebp,esp
 0070904B    add         esp,0FFFFFFE4
 0070904E    push        ebx
 0070904F    push        esi
 00709050    xor         ebx,ebx
 00709052    mov         dword ptr [ebp-1C],ebx
 00709055    mov         dword ptr [ebp-10],ebx
 00709058    mov         esi,ecx
 0070905A    mov         dword ptr [ebp-8],edx
 0070905D    mov         ebx,eax
 0070905F    mov         eax,dword ptr [ebp-8]
 00709062    call        @UStrAddRef
 00709067    xor         eax,eax
 00709069    push        ebp
 0070906A    push        7091DC
 0070906F    push        dword ptr fs:[eax]
 00709072    mov         dword ptr fs:[eax],esp
 00709075    xor         eax,eax
 00709077    mov         dword ptr [esi],eax
 00709079    mov         eax,dword ptr [ebp+8]
 0070907C    call        @UStrClr
 00709081    mov         eax,ebx
 00709083    call        TOleControl.CreateControl
 00709088    lea         eax,[ebp-10]
 0070908B    call        @IntfClear
 00709090    push        eax
 00709091    lea         eax,[ebp-1C]
 00709094    mov         edx,dword ptr [ebx+280]
 0070909A    mov         ecx,7091F0
 0070909F    call        @IntfCast
 007090A4    mov         eax,dword ptr [ebp-1C]
 007090A7    push        eax
 007090A8    mov         eax,dword ptr [eax]
 007090AA    call        dword ptr [eax+0C]
 007090AD    call        OleCheck
 007090B2    mov         dword ptr [ebp-4],0FFFFFFFF
 007090B9    mov         eax,dword ptr [ebp-8]
 007090BC    test        eax,eax
>007090BE    je          007090C5
 007090C0    sub         eax,4
 007090C3    mov         eax,dword ptr [eax]
 007090C5    test        eax,eax
>007090C7    jle         00709185
 007090CD    lea         eax,[ebp-18]
 007090D0    push        eax
 007090D1    mov         eax,dword ptr [ebp-10]
 007090D4    push        eax
 007090D5    mov         eax,dword ptr [eax]
 007090D7    call        dword ptr [eax+0C]
 007090DA    call        OleCheck
 007090DF    mov         eax,dword ptr [ebp-18]
 007090E2    movzx       eax,word ptr [eax+30]
 007090E6    mov         dword ptr [ebp-0C],eax
 007090E9    mov         eax,dword ptr [ebp-18]
 007090EC    push        eax
 007090ED    mov         eax,dword ptr [ebp-10]
 007090F0    push        eax
 007090F1    mov         eax,dword ptr [eax]
 007090F3    call        dword ptr [eax+4C]
 007090F6    push        ebp
 007090F7    lea         edx,[ebp-10]
 007090FA    mov         eax,dword ptr [ebp-8]
 007090FD    call        Find
 00709102    pop         ecx
 00709103    mov         ebx,eax
 00709105    test        bl,bl
>00709107    jne         0070914C
 00709109    mov         edx,dword ptr [ebp-8]
 0070910C    mov         eax,edx
 0070910E    test        eax,eax
>00709110    je          00709117
 00709112    sub         eax,4
 00709115    mov         eax,dword ptr [eax]
 00709117    mov         ecx,dword ptr [ebp-8]
 0070911A    cmp         word ptr [ecx+eax*2-2],5F
>00709120    jne         0070914C
 00709122    mov         eax,edx
 00709124    test        eax,eax
>00709126    je          0070912D
 00709128    sub         eax,4
 0070912B    mov         eax,dword ptr [eax]
 0070912D    mov         edx,eax
 0070912F    dec         edx
 00709130    lea         eax,[ebp-8]
 00709133    mov         ecx,1
 00709138    call        @UStrDelete
 0070913D    push        ebp
 0070913E    lea         edx,[ebp-10]
 00709141    mov         eax,dword ptr [ebp-8]
 00709144    call        Find
 00709149    pop         ecx
 0070914A    mov         ebx,eax
 0070914C    test        bl,bl
>0070914E    jne         00709181
 00709150    mov         edx,dword ptr [ebp-8]
 00709153    mov         eax,70920C;'On'
 00709158    call        Pos
 0070915D    dec         eax
>0070915E    jne         00709181
 00709160    lea         eax,[ebp-8]
 00709163    mov         ecx,2
 00709168    mov         edx,1
 0070916D    call        @UStrDelete
 00709172    push        ebp
 00709173    lea         edx,[ebp-10]
 00709176    mov         eax,dword ptr [ebp-8]
 00709179    call        Find
 0070917E    pop         ecx
 0070917F    mov         ebx,eax
 00709181    test        bl,bl
>00709183    je          007091B6
 00709185    lea         eax,[ebp-14]
 00709188    push        eax
 00709189    push        esi
 0070918A    push        0
 0070918C    push        0
 0070918E    mov         eax,dword ptr [ebp-4]
 00709191    push        eax
 00709192    mov         eax,dword ptr [ebp-10]
 00709195    push        eax
 00709196    mov         eax,dword ptr [eax]
 00709198    call        dword ptr [eax+30]
 0070919B    call        OleCheck
 007091A0    mov         edx,dword ptr [ebp+8]
 007091A3    mov         eax,dword ptr [ebp-14]
 007091A6    call        OleStrToString
 007091AB    mov         eax,dword ptr [ebp-14]
 007091AE    push        eax
 007091AF    call        oleaut32.SysFreeString
 007091B4    mov         bl,1
 007091B6    xor         eax,eax
 007091B8    pop         edx
 007091B9    pop         ecx
 007091BA    pop         ecx
 007091BB    mov         dword ptr fs:[eax],edx
 007091BE    push        7091E3
 007091C3    lea         eax,[ebp-1C]
 007091C6    call        @IntfClear
 007091CB    lea         eax,[ebp-10]
 007091CE    call        @IntfClear
 007091D3    lea         eax,[ebp-8]
 007091D6    call        @UStrClr
 007091DB    ret
>007091DC    jmp         @HandleFinally
>007091E1    jmp         007091C3
 007091E3    mov         eax,ebx
 007091E5    pop         esi
 007091E6    pop         ebx
 007091E7    mov         esp,ebp
 007091E9    pop         ebp
 007091EA    ret         4
*}
end;

//00709214
function TOleControl.GetIntegerProp(Index:Integer):Integer;
begin
{*
 00709214    add         esp,0FFFFFFF0
 00709217    mov         ecx,esp
 00709219    call        TOleControl.GetProperty
 0070921E    mov         eax,dword ptr [esp+8]
 00709222    add         esp,10
 00709225    ret
*}
end;

//00709228
function TOleControl.GetMainMenu:TMainMenu;
begin
{*
 00709228    push        ebx
 00709229    push        esi
 0070922A    xor         esi,esi
 0070922C    mov         dl,1
 0070922E    call        GetParentForm
 00709233    mov         ebx,eax
 00709235    test        ebx,ebx
>00709237    je          00709275
 00709239    mov         eax,ebx
 0070923B    mov         edx,dword ptr ds:[4E0C38];TForm
 00709241    call        @IsClass
 00709246    test        al,al
>00709248    je          0070925B
 0070924A    cmp         byte ptr [ebx+29E],1
>00709251    je          0070925B
 00709253    mov         esi,dword ptr [ebx+2B4]
>00709259    jmp         00709275
 0070925B    mov         eax,[0078D590];^Application:TApplication
 00709260    mov         eax,dword ptr [eax]
 00709262    mov         eax,dword ptr [eax+44]
 00709265    test        eax,eax
>00709267    je          00709275
 00709269    mov         edx,dword ptr ds:[78D590];^Application:TApplication
 0070926F    mov         esi,dword ptr [eax+2B4]
 00709275    mov         eax,esi
 00709277    pop         esi
 00709278    pop         ebx
 00709279    ret
*}
end;

//0070927C
procedure TOleControl.GetObjectVerbs(List:TStrings);
begin
{*
 0070927C    push        ebp
 0070927D    mov         ebp,esp
 0070927F    add         esp,0FFFFFFE0
 00709282    push        ebx
 00709283    xor         ecx,ecx
 00709285    mov         dword ptr [ebp-1C],ecx
 00709288    mov         dword ptr [ebp-20],ecx
 0070928B    mov         dword ptr [ebp-4],ecx
 0070928E    mov         dword ptr [ebp-8],edx
 00709291    mov         ebx,eax
 00709293    xor         eax,eax
 00709295    push        ebp
 00709296    push        709349
 0070929B    push        dword ptr fs:[eax]
 0070929E    mov         dword ptr fs:[eax],esp
 007092A1    mov         eax,ebx
 007092A3    call        TOleControl.CreateControl
 007092A8    mov         eax,dword ptr [ebp-8]
 007092AB    mov         edx,dword ptr [eax]
 007092AD    call        dword ptr [edx+44]
 007092B0    lea         eax,[ebp-4]
 007092B3    call        @IntfClear
 007092B8    push        eax
 007092B9    mov         eax,dword ptr [ebx+280]
 007092BF    push        eax
 007092C0    mov         eax,dword ptr [eax]
 007092C2    call        dword ptr [eax+30]
 007092C5    cmp         eax,40000
>007092CA    jne         007092E1
 007092CC    lea         eax,[ebp-4]
 007092CF    call        @IntfClear
 007092D4    push        eax
 007092D5    mov         eax,dword ptr [ebx+270]
 007092DB    push        eax
 007092DC    call        ole32.OleRegEnumVerbs
 007092E1    test        eax,eax
>007092E3    jne         00709326
>007092E5    jmp         00709311
 007092E7    test        byte ptr [ebp-0C],2
>007092EB    je          00709311
 007092ED    lea         eax,[ebp-20]
 007092F0    mov         edx,dword ptr [ebp-14]
 007092F3    call        @UStrFromPWChar
 007092F8    mov         eax,dword ptr [ebp-20]
 007092FB    lea         edx,[ebp-1C]
 007092FE    call        StripHotkey
 00709303    mov         edx,dword ptr [ebp-1C]
 00709306    mov         ecx,dword ptr [ebp-18]
 00709309    mov         eax,dword ptr [ebp-8]
 0070930C    mov         ebx,dword ptr [eax]
 0070930E    call        dword ptr [ebx+3C]
 00709311    push        0
 00709313    lea         eax,[ebp-18]
 00709316    push        eax
 00709317    push        1
 00709319    mov         eax,dword ptr [ebp-4]
 0070931C    push        eax
 0070931D    mov         eax,dword ptr [eax]
 0070931F    call        dword ptr [eax+0C]
 00709322    test        eax,eax
>00709324    je          007092E7
 00709326    xor         eax,eax
 00709328    pop         edx
 00709329    pop         ecx
 0070932A    pop         ecx
 0070932B    mov         dword ptr fs:[eax],edx
 0070932E    push        709350
 00709333    lea         eax,[ebp-20]
 00709336    mov         edx,2
 0070933B    call        @UStrArrayClr
 00709340    lea         eax,[ebp-4]
 00709343    call        @IntfClear
 00709348    ret
>00709349    jmp         @HandleFinally
>0070934E    jmp         00709333
 00709350    pop         ebx
 00709351    mov         esp,ebp
 00709353    pop         ebp
 00709354    ret
*}
end;

//00709358
function TOleControl.GetOleBoolProp(Index:Integer):TOleBool;
begin
{*
 00709358    add         esp,0FFFFFFF0
 0070935B    mov         ecx,esp
 0070935D    call        TOleControl.GetProperty
 00709362    movzx       eax,word ptr [esp+8]
 00709367    add         esp,10
 0070936A    ret
*}
end;

//0070936C
function TOleControl.GetOleObject:Variant;
begin
{*
 0070936C    push        ebp
 0070936D    mov         ebp,esp
 0070936F    push        0
 00709371    push        ebx
 00709372    push        esi
 00709373    mov         esi,edx
 00709375    mov         ebx,eax
 00709377    xor         eax,eax
 00709379    push        ebp
 0070937A    push        7093BF
 0070937F    push        dword ptr fs:[eax]
 00709382    mov         dword ptr fs:[eax],esp
 00709385    mov         eax,ebx
 00709387    call        TOleControl.CreateControl
 0070938C    lea         eax,[ebp-4]
 0070938F    mov         edx,dword ptr [ebx+280]
 00709395    mov         ecx,7093CC
 0070939A    call        @IntfCast
 0070939F    mov         edx,dword ptr [ebp-4]
 007093A2    mov         eax,esi
 007093A4    call        @VarFromDisp
 007093A9    xor         eax,eax
 007093AB    pop         edx
 007093AC    pop         ecx
 007093AD    pop         ecx
 007093AE    mov         dword ptr fs:[eax],edx
 007093B1    push        7093C6
 007093B6    lea         eax,[ebp-4]
 007093B9    call        @IntfClear
 007093BE    ret
>007093BF    jmp         @HandleFinally
>007093C4    jmp         007093B6
 007093C6    pop         esi
 007093C7    pop         ebx
 007093C8    pop         ecx
 007093C9    pop         ebp
 007093CA    ret
*}
end;

//007093DC
function TOleControl.GetDefaultDispatch:IDispatch;
begin
{*
 007093DC    push        ebx
 007093DD    push        esi
 007093DE    mov         esi,edx
 007093E0    mov         ebx,eax
 007093E2    mov         eax,ebx
 007093E4    call        TOleControl.CreateControl
 007093E9    mov         eax,esi
 007093EB    mov         edx,dword ptr [ebx+280]
 007093F1    mov         ecx,709400
 007093F6    call        @IntfCast
 007093FB    pop         esi
 007093FC    pop         ebx
 007093FD    ret
*}
end;

//00709410
function TOleControl.GetOleVariantProp(Index:Integer):OleVariant;
begin
{*
 00709410    push        ebx
 00709411    push        esi
 00709412    push        edi
 00709413    mov         esi,ecx
 00709415    mov         edi,edx
 00709417    mov         ebx,eax
 00709419    mov         eax,esi
 0070941B    call        @VarClear
 00709420    mov         ecx,esi
 00709422    mov         edx,edi
 00709424    mov         eax,ebx
 00709426    call        TOleControl.GetProperty
 0070942B    pop         edi
 0070942C    pop         esi
 0070942D    pop         ebx
 0070942E    ret
*}
end;

//00709430
function TOleControl.GetPropDisplayString(DispID:Integer):string;
begin
{*
 00709430    push        ebp
 00709431    mov         ebp,esp
 00709433    push        0
 00709435    push        ebx
 00709436    push        esi
 00709437    push        edi
 00709438    mov         edi,ecx
 0070943A    mov         esi,edx
 0070943C    mov         ebx,eax
 0070943E    xor         eax,eax
 00709440    push        ebp
 00709441    push        7094A3
 00709446    push        dword ptr fs:[eax]
 00709449    mov         dword ptr fs:[eax],esp
 0070944C    mov         eax,ebx
 0070944E    call        TOleControl.CreateControl
 00709453    cmp         dword ptr [ebx+290],0
>0070945A    je          00709482
 0070945C    lea         eax,[ebp-4]
 0070945F    call        @WStrClr
 00709464    push        eax
 00709465    push        esi
 00709466    mov         eax,dword ptr [ebx+290]
 0070946C    push        eax
 0070946D    mov         eax,dword ptr [eax]
 0070946F    call        dword ptr [eax+0C]
 00709472    test        eax,eax
>00709474    jne         00709482
 00709476    mov         eax,edi
 00709478    mov         edx,dword ptr [ebp-4]
 0070947B    call        @UStrFromWStr
>00709480    jmp         0070948D
 00709482    mov         ecx,edi
 00709484    mov         edx,esi
 00709486    mov         eax,ebx
 00709488    call        TOleControl.GetStringProp
 0070948D    xor         eax,eax
 0070948F    pop         edx
 00709490    pop         ecx
 00709491    pop         ecx
 00709492    mov         dword ptr fs:[eax],edx
 00709495    push        7094AA
 0070949A    lea         eax,[ebp-4]
 0070949D    call        @WStrClr
 007094A2    ret
>007094A3    jmp         @HandleFinally
>007094A8    jmp         0070949A
 007094AA    pop         edi
 007094AB    pop         esi
 007094AC    pop         ebx
 007094AD    pop         ecx
 007094AE    pop         ebp
 007094AF    ret
*}
end;

//007094B0
procedure TOleControl.GetPropDisplayStrings(DispID:Integer; List:TStrings);
begin
{*
 007094B0    push        ebp
 007094B1    mov         ebp,esp
 007094B3    add         esp,0FFFFFFE8
 007094B6    push        ebx
 007094B7    push        esi
 007094B8    push        edi
 007094B9    xor         ebx,ebx
 007094BB    mov         dword ptr [ebp-18],ebx
 007094BE    mov         dword ptr [ebp-4],ecx
 007094C1    mov         esi,edx
 007094C3    mov         ebx,eax
 007094C5    xor         eax,eax
 007094C7    push        ebp
 007094C8    push        70959C
 007094CD    push        dword ptr fs:[eax]
 007094D0    mov         dword ptr fs:[eax],esp
 007094D3    mov         eax,ebx
 007094D5    call        TOleControl.CreateControl
 007094DA    mov         eax,dword ptr [ebp-4]
 007094DD    mov         edx,dword ptr [eax]
 007094DF    call        dword ptr [edx+44]
 007094E2    cmp         dword ptr [ebx+290],0
>007094E9    je          00709586
 007094EF    lea         eax,[ebp-14]
 007094F2    push        eax
 007094F3    lea         eax,[ebp-0C]
 007094F6    push        eax
 007094F7    push        esi
 007094F8    mov         eax,dword ptr [ebx+290]
 007094FE    push        eax
 007094FF    mov         eax,dword ptr [eax]
 00709501    call        dword ptr [eax+14]
 00709504    test        eax,eax
>00709506    jne         00709586
 00709508    xor         eax,eax
 0070950A    push        ebp
 0070950B    push        70957F
 00709510    push        dword ptr fs:[eax]
 00709513    mov         dword ptr fs:[eax],esp
 00709516    mov         esi,dword ptr [ebp-0C]
 00709519    dec         esi
 0070951A    test        esi,esi
>0070951C    jl          00709544
 0070951E    inc         esi
 0070951F    xor         ebx,ebx
 00709521    lea         eax,[ebp-18]
 00709524    mov         edx,dword ptr [ebp-8]
 00709527    mov         edx,dword ptr [edx+ebx*4]
 0070952A    call        @UStrFromPWChar
 0070952F    mov         edx,dword ptr [ebp-18]
 00709532    mov         eax,dword ptr [ebp-10]
 00709535    mov         ecx,dword ptr [eax+ebx*4]
 00709538    mov         eax,dword ptr [ebp-4]
 0070953B    mov         edi,dword ptr [eax]
 0070953D    call        dword ptr [edi+3C]
 00709540    inc         ebx
 00709541    dec         esi
>00709542    jne         00709521
 00709544    xor         eax,eax
 00709546    pop         edx
 00709547    pop         ecx
 00709548    pop         ecx
 00709549    mov         dword ptr fs:[eax],edx
 0070954C    push        709586
 00709551    mov         esi,dword ptr [ebp-0C]
 00709554    dec         esi
 00709555    test        esi,esi
>00709557    jl          0070956C
 00709559    inc         esi
 0070955A    xor         ebx,ebx
 0070955C    mov         eax,dword ptr [ebp-8]
 0070955F    mov         eax,dword ptr [eax+ebx*4]
 00709562    push        eax
 00709563    call        ole32.CoTaskMemFree
 00709568    inc         ebx
 00709569    dec         esi
>0070956A    jne         0070955C
 0070956C    mov         eax,dword ptr [ebp-8]
 0070956F    push        eax
 00709570    call        ole32.CoTaskMemFree
 00709575    mov         eax,dword ptr [ebp-10]
 00709578    push        eax
 00709579    call        ole32.CoTaskMemFree
 0070957E    ret
>0070957F    jmp         @HandleFinally
>00709584    jmp         00709551
 00709586    xor         eax,eax
 00709588    pop         edx
 00709589    pop         ecx
 0070958A    pop         ecx
 0070958B    mov         dword ptr fs:[eax],edx
 0070958E    push        7095A3
 00709593    lea         eax,[ebp-18]
 00709596    call        @UStrClr
 0070959B    ret
>0070959C    jmp         @HandleFinally
>007095A1    jmp         00709593
 007095A3    pop         edi
 007095A4    pop         esi
 007095A5    pop         ebx
 007095A6    mov         esp,ebp
 007095A8    pop         ebp
 007095A9    ret
*}
end;

//007095AC
procedure TOleControl.GetProperty(Index:Integer; var Value:TVarData);
begin
{*
 007095AC    push        ebp
 007095AD    mov         ebp,esp
 007095AF    add         esp,0FFFFFFE0
 007095B2    push        ebx
 007095B3    push        esi
 007095B4    push        edi
 007095B5    mov         esi,ecx
 007095B7    mov         edi,edx
 007095B9    mov         ebx,eax
 007095BB    lea         eax,[ebp-20]
 007095BE    mov         edx,dword ptr ds:[42B130];tagEXCEPINFO
 007095C4    call        @InitializeRecord
 007095C9    xor         eax,eax
 007095CB    push        ebp
 007095CC    push        70962E
 007095D1    push        dword ptr fs:[eax]
 007095D4    mov         dword ptr fs:[eax],esp
 007095D7    mov         eax,ebx
 007095D9    call        TOleControl.CreateControl
 007095DE    mov         word ptr [esi],0
 007095E3    push        0
 007095E5    lea         eax,[ebp-20]
 007095E8    push        eax
 007095E9    push        esi
 007095EA    push        78C3C8
 007095EF    push        2
 007095F1    push        0
 007095F3    mov         eax,[0078D23C];^gvar_00784E50
 007095F8    push        eax
 007095F9    push        edi
 007095FA    mov         eax,dword ptr [ebx+28C]
 00709600    push        eax
 00709601    mov         eax,dword ptr [eax]
 00709603    call        dword ptr [eax+18]
 00709606    test        eax,eax
>00709608    je          00709612
 0070960A    lea         edx,[ebp-20]
 0070960D    call        DispatchInvokeError
 00709612    xor         eax,eax
 00709614    pop         edx
 00709615    pop         ecx
 00709616    pop         ecx
 00709617    mov         dword ptr fs:[eax],edx
 0070961A    push        709635
 0070961F    lea         eax,[ebp-20]
 00709622    mov         edx,dword ptr ds:[42B130];tagEXCEPINFO
 00709628    call        @FinalizeRecord
 0070962D    ret
>0070962E    jmp         @HandleFinally
>00709633    jmp         0070961F
 00709635    pop         edi
 00709636    pop         esi
 00709637    pop         ebx
 00709638    mov         esp,ebp
 0070963A    pop         ebp
 0070963B    ret
*}
end;

//0070963C
function TOleControl.GetStringProp(Index:Integer):UnicodeString;
begin
{*
 0070963C    push        ebp
 0070963D    mov         ebp,esp
 0070963F    push        0
 00709641    push        0
 00709643    push        0
 00709645    push        0
 00709647    push        ebx
 00709648    push        esi
 00709649    push        edi
 0070964A    mov         edi,ecx
 0070964C    mov         esi,edx
 0070964E    mov         ebx,eax
 00709650    xor         eax,eax
 00709652    push        ebp
 00709653    push        70968A
 00709658    push        dword ptr fs:[eax]
 0070965B    mov         dword ptr fs:[eax],esp
 0070965E    lea         ecx,[ebp-10]
 00709661    mov         edx,esi
 00709663    mov         eax,ebx
 00709665    call        TOleControl.GetVariantProp
 0070966A    lea         edx,[ebp-10]
 0070966D    mov         eax,edi
 0070966F    call        @VarToUStr
 00709674    xor         eax,eax
 00709676    pop         edx
 00709677    pop         ecx
 00709678    pop         ecx
 00709679    mov         dword ptr fs:[eax],edx
 0070967C    push        709691
 00709681    lea         eax,[ebp-10]
 00709684    call        @VarClr
 00709689    ret
>0070968A    jmp         @HandleFinally
>0070968F    jmp         00709681
 00709691    pop         edi
 00709692    pop         esi
 00709693    pop         ebx
 00709694    mov         esp,ebp
 00709696    pop         ebp
 00709697    ret
*}
end;

//00709698
function TOleControl.GetVariantProp(Index:Integer):Variant;
begin
{*
 00709698    push        ebx
 00709699    push        esi
 0070969A    push        edi
 0070969B    mov         edi,ecx
 0070969D    mov         esi,edx
 0070969F    mov         ebx,eax
 007096A1    mov         ecx,edi
 007096A3    mov         edx,esi
 007096A5    mov         eax,ebx
 007096A7    call        TOleControl.GetOleVariantProp
 007096AC    pop         edi
 007096AD    pop         esi
 007096AE    pop         ebx
 007096AF    ret
*}
end;

//007096B0
procedure TOleControl.HookControlWndProc;
begin
{*
 007096B0    push        ebx
 007096B1    push        esi
 007096B2    push        ecx
 007096B3    mov         ebx,eax
 007096B5    cmp         dword ptr [ebx+294],0
>007096BC    je          00709739
 007096BE    cmp         dword ptr [ebx+258],0
>007096C5    jne         00709739
 007096C7    xor         eax,eax
 007096C9    mov         dword ptr [esp],eax
 007096CC    push        esp
 007096CD    mov         eax,dword ptr [ebx+294]
 007096D3    push        eax
 007096D4    mov         eax,dword ptr [eax]
 007096D6    call        dword ptr [eax+0C]
 007096D9    cmp         dword ptr [esp],0
>007096DD    jne         007096F6
 007096DF    mov         ecx,dword ptr ds:[78DB8C];^SResString709:TResStringRec
 007096E5    mov         dl,1
 007096E7    mov         eax,[0052E700];EOleError
 007096EC    call        Exception.CreateRes
 007096F1    call        @RaiseExcept
 007096F6    mov         esi,dword ptr [esp]
 007096F9    mov         dword ptr [ebx+258],esi
 007096FF    push        0FC
 00709701    push        esi
 00709702    call        user32.GetWindowLongW
 00709707    mov         dword ptr [ebx+254],eax
 0070970D    mov         eax,[0078D3F4]
 00709712    mov         dword ptr [eax],ebx
 00709714    push        480E34;InitWndProc:LRESULT
 00709719    push        0FC
 0070971B    mov         eax,dword ptr [ebx+258]
 00709721    push        eax
 00709722    call        user32.SetWindowLongW
 00709727    push        0
 00709729    push        0
 0070972B    push        0
 0070972D    mov         eax,dword ptr [ebx+258]
 00709733    push        eax
 00709734    call        user32.SendMessageW
 00709739    pop         edx
 0070973A    pop         esi
 0070973B    pop         ebx
 0070973C    ret
*}
end;

//00709740
procedure CallEventMethod(const EventInfo:TEventInfo);
begin
{*
 00709740    push        ebx
 00709741    push        esi
 00709742    push        ebp
 00709743    mov         ebp,esp
 00709745    mov         ebx,eax
 00709747    mov         edx,dword ptr [ebx+0C]
 0070974A    test        edx,edx
>0070974C    je          00709772
 0070974E    xor         eax,eax
 00709750    lea         esi,[ebx+10]
 00709753    mov         al,byte ptr [esi]
 00709755    cmp         al,1
>00709757    ja          00709766
>00709759    je          00709769
 0070975B    test        ah,ah
>0070975D    jne         00709769
 0070975F    mov         ecx,dword ptr [esi+4]
 00709762    mov         ah,1
>00709764    jmp         0070976C
 00709766    push        dword ptr [esi+8]
 00709769    push        dword ptr [esi+4]
 0070976C    add         esi,0C
 0070976F    dec         edx
>00709770    jne         00709753
 00709772    mov         edx,dword ptr [ebx+8]
 00709775    mov         eax,dword ptr [ebx+4]
 00709778    call        dword ptr [ebx]
 0070977A    mov         esp,ebp
 0070977C    pop         ebp
 0070977D    pop         esi
 0070977E    pop         ebx
 0070977F    ret
*}
end;

//00709780
procedure TOleControl.D2InvokeEvent(DispID:TDispID; var Params:TDispParams);
begin
{*
 00709780    push        ebp
 00709781    mov         ebp,esp
 00709783    add         esp,0FFFFFD64
 00709789    push        ebx
 0070978A    push        esi
 0070978B    push        edi
 0070978C    mov         ebx,ecx
 0070978E    mov         dword ptr [ebp-4],eax
 00709791    lea         ecx,[ebp-29C]
 00709797    mov         eax,dword ptr [ebp-4]
 0070979A    call        TOleControl.GetEventMethod
 0070979F    cmp         dword ptr [ebp-29C],10000
>007097A9    jl          00709918
 007097AF    xor         eax,eax
 007097B1    mov         dword ptr [ebp-0C],eax
 007097B4    xor         ecx,ecx
 007097B6    push        ebp
 007097B7    push        7098E7
 007097BC    push        dword ptr fs:[ecx]
 007097BF    mov         dword ptr fs:[ecx],esp
 007097C2    mov         edx,dword ptr [ebx+8]
 007097C5    mov         eax,dword ptr [ebp-4]
 007097C8    mov         dword ptr [ebp-294],eax
 007097CE    mov         eax,edx
 007097D0    mov         dword ptr [ebp-290],eax
 007097D6    test        edx,edx
>007097D8    je          007098AD
 007097DE    add         eax,eax
 007097E0    mov         edx,dword ptr [ebx]
 007097E2    lea         eax,[edx+eax*8]
 007097E5    mov         ebx,eax
 007097E7    lea         esi,[ebp-28C]
 007097ED    xor         eax,eax
 007097EF    mov         dword ptr [ebp-8],eax
 007097F2    sub         ebx,10
 007097F5    mov         eax,dword ptr [ebx]
 007097F7    and         eax,0FFFF
 007097FC    mov         edx,eax
 007097FE    and         edx,0FFF
 00709804    cmp         edx,8
>00709807    jne         0070984F
 00709809    mov         byte ptr [esi],0
 0070980C    mov         edx,dword ptr [ebp-0C]
 0070980F    lea         edi,[ebp+edx*8-10C]
 00709816    xor         edx,edx
 00709818    mov         dword ptr [edi],edx
 0070981A    test        ah,40
>0070981D    je          00709836
 0070981F    mov         edx,edi
 00709821    mov         eax,dword ptr [ebx+8]
 00709824    mov         eax,dword ptr [eax]
 00709826    call        OleStrToStrVar
 0070982B    mov         eax,dword ptr [ebx+8]
 0070982E    mov         dword ptr [edi+4],eax
 00709831    mov         dword ptr [esi+4],edi
>00709834    jmp         0070984A
 00709836    mov         edx,edi
 00709838    mov         eax,dword ptr [ebx+8]
 0070983B    call        OleStrToStrVar
 00709840    xor         eax,eax
 00709842    mov         dword ptr [edi+4],eax
 00709845    mov         eax,dword ptr [edi]
 00709847    mov         dword ptr [esi+4],eax
 0070984A    inc         dword ptr [ebp-0C]
>0070984D    jmp         00709898
 0070984F    mov         edx,eax
 00709851    sub         edx,4
>00709854    je          00709861
 00709856    dec         edx
 00709857    sub         edx,3
>0070985A    jb          0070986C
 0070985C    dec         edx
>0070985D    je          0070987D
>0070985F    jmp         00709885
 00709861    mov         byte ptr [esi],1
 00709864    mov         eax,dword ptr [ebx+8]
 00709867    mov         dword ptr [esi+4],eax
>0070986A    jmp         00709898
 0070986C    mov         byte ptr [esi],2
 0070986F    mov         eax,dword ptr [ebx+8]
 00709872    mov         dword ptr [esi+4],eax
 00709875    mov         eax,dword ptr [ebx+0C]
 00709878    mov         dword ptr [esi+8],eax
>0070987B    jmp         00709898
 0070987D    mov         byte ptr [esi],0
 00709880    mov         dword ptr [esi+4],ebx
>00709883    jmp         00709898
 00709885    mov         byte ptr [esi],0
 00709888    test        ah,20
>0070988B    je          00709892
 0070988D    mov         dword ptr [esi+4],ebx
>00709890    jmp         00709898
 00709892    mov         eax,dword ptr [ebx+8]
 00709895    mov         dword ptr [esi+4],eax
 00709898    add         esi,0C
 0070989B    inc         dword ptr [ebp-8]
 0070989E    mov         eax,dword ptr [ebp-8]
 007098A1    cmp         eax,dword ptr [ebp-290]
>007098A7    jne         007097F2
 007098AD    lea         eax,[ebp-29C]
 007098B3    call        CallEventMethod
 007098B8    mov         ebx,dword ptr [ebp-0C]
 007098BB    test        ebx,ebx
>007098BD    je          007098DD
 007098BF    dec         ebx
 007098C0    lea         esi,[ebp+ebx*8-10C]
 007098C7    cmp         dword ptr [esi+4],0
>007098CB    je          007098D9
 007098CD    mov         eax,dword ptr [esi]
 007098CF    call        00409460
 007098D4    mov         edx,dword ptr [esi+4]
 007098D7    mov         dword ptr [edx],eax
 007098D9    test        ebx,ebx
>007098DB    jne         007098BF
 007098DD    xor         eax,eax
 007098DF    pop         edx
 007098E0    pop         ecx
 007098E1    pop         ecx
 007098E2    mov         dword ptr fs:[eax],edx
>007098E5    jmp         00709900
>007098E7    jmp         @HandleAnyException
 007098EC    mov         eax,[0078D590];^Application:TApplication
 007098F1    mov         eax,dword ptr [eax]
 007098F3    mov         edx,dword ptr [ebp-4]
 007098F6    call        TApplication.HandleException
 007098FB    call        @DoneExcept
 00709900    mov         ebx,dword ptr [ebp-0C]
 00709903    test        ebx,ebx
>00709905    je          00709918
 00709907    dec         ebx
 00709908    lea         eax,[ebp+ebx*8-10C]
 0070990F    call        @UStrClr
 00709914    test        ebx,ebx
>00709916    jne         00709907
 00709918    pop         edi
 00709919    pop         esi
 0070991A    pop         ebx
 0070991B    mov         esp,ebp
 0070991D    pop         ebp
 0070991E    ret
*}
end;

//00709920
procedure TOleControl.InvokeEvent(DispID:TDispID; var Params:TDispParams);
begin
{*
 00709920    push        ebp
 00709921    mov         ebp,esp
 00709923    add         esp,0FFFFFFF0
 00709926    push        ebx
 00709927    push        esi
 00709928    push        edi
 00709929    mov         dword ptr [ebp-4],ecx
 0070992C    mov         dword ptr [ebp-8],eax
 0070992F    mov         eax,dword ptr [ebp-8]
 00709932    mov         eax,dword ptr [eax+270]
 00709938    cmp         dword ptr [eax+30],12C
>0070993F    jge         00709951
 00709941    mov         ecx,dword ptr [ebp-4]
 00709944    mov         eax,dword ptr [ebp-8]
 00709947    call        TOleControl.D2InvokeEvent
>0070994C    jmp         007099F6
 00709951    lea         ecx,[ebp-10]
 00709954    mov         eax,dword ptr [ebp-8]
 00709957    call        TOleControl.GetEventMethod
 0070995C    cmp         dword ptr [ebp-10],10000
>00709963    jl          007099F6
 00709969    xor         eax,eax
 0070996B    push        ebp
 0070996C    push        7099DD
 00709971    push        dword ptr fs:[eax]
 00709974    mov         dword ptr fs:[eax],esp
 00709977    push        ebx
 00709978    push        esi
 00709979    mov         esi,dword ptr [ebp-4]
 0070997C    mov         ebx,dword ptr [esi+8]
 0070997F    test        ebx,ebx
>00709981    je          007099C8
 00709983    mov         esi,dword ptr [esi]
 00709985    mov         eax,ebx
 00709987    shl         eax,4
 0070998A    xor         edx,edx
 0070998C    add         esi,eax
 0070998E    sub         esi,10
 00709991    mov         eax,dword ptr [esi]
 00709993    cmp         ax,4
>00709997    ja          007099B9
>00709999    je          007099C2
 0070999B    test        dl,dl
>0070999D    jne         007099AF
 0070999F    mov         ecx,esi
 007099A1    inc         dl
 007099A3    test        eax,2000
>007099A8    jne         007099C5
 007099AA    mov         ecx,dword ptr [esi+8]
>007099AD    jmp         007099C5
 007099AF    test        eax,2000
>007099B4    je          007099C2
 007099B6    push        esi
>007099B7    jmp         007099C5
 007099B9    cmp         ax,7
>007099BD    ja          0070999B
 007099BF    push        dword ptr [esi+0C]
 007099C2    push        dword ptr [esi+8]
 007099C5    dec         ebx
>007099C6    jne         0070998E
 007099C8    mov         edx,dword ptr [ebp-8]
 007099CB    mov         eax,dword ptr [ebp-0C]
 007099CE    call        dword ptr [ebp-10]
 007099D1    pop         esi
 007099D2    pop         ebx
 007099D3    xor         eax,eax
 007099D5    pop         edx
 007099D6    pop         ecx
 007099D7    pop         ecx
 007099D8    mov         dword ptr fs:[eax],edx
>007099DB    jmp         007099F6
>007099DD    jmp         @HandleAnyException
 007099E2    mov         eax,[0078D590];^Application:TApplication
 007099E7    mov         eax,dword ptr [eax]
 007099E9    mov         edx,dword ptr [ebp-8]
 007099EC    call        TApplication.HandleException
 007099F1    call        @DoneExcept
 007099F6    pop         edi
 007099F7    pop         esi
 007099F8    pop         ebx
 007099F9    mov         esp,ebp
 007099FB    pop         ebp
 007099FC    ret
*}
end;

//00709A00
procedure GetStringResult(BStr:TBStr; var Result:AnsiString);
begin
{*
 00709A00    push        ebp
 00709A01    mov         ebp,esp
 00709A03    push        ecx
 00709A04    mov         dword ptr [ebp-4],eax
 00709A07    xor         eax,eax
 00709A09    push        ebp
 00709A0A    push        709A34
 00709A0F    push        dword ptr fs:[eax]
 00709A12    mov         dword ptr fs:[eax],esp
 00709A15    mov         eax,dword ptr [ebp-4]
 00709A18    call        OleStrToStrVar
 00709A1D    xor         eax,eax
 00709A1F    pop         edx
 00709A20    pop         ecx
 00709A21    pop         ecx
 00709A22    mov         dword ptr fs:[eax],edx
 00709A25    push        709A3B
 00709A2A    mov         eax,dword ptr [ebp-4]
 00709A2D    push        eax
 00709A2E    call        oleaut32.SysFreeString
 00709A33    ret
>00709A34    jmp         @HandleFinally
>00709A39    jmp         00709A2A
 00709A3B    pop         ecx
 00709A3C    pop         ebp
 00709A3D    ret
*}
end;

//00709A40
procedure sub_00709A40;
begin
{*
 00709A40    ret
*}
end;

//00709A44
procedure TOleControl.InvokeMethod(const DispInfo:void ; Result:Pointer);
begin
{*
 00709A44    push        ebx
 00709A45    push        esi
 00709A46    push        edi
 00709A47    mov         ebx,eax
 00709A49    mov         esi,edx
 00709A4B    mov         edi,ecx
 00709A4D    call        TOleControl.CreateControl
 00709A52    push        dword ptr [esi]
 00709A54    mov         ecx,esp
 00709A56    xor         eax,eax
 00709A58    push        eax
 00709A59    push        eax
 00709A5A    push        eax
 00709A5B    push        eax
 00709A5C    mov         edx,esp
 00709A5E    lea         eax,[ebp+10]
 00709A61    cmp         byte ptr [esi+4],8
>00709A65    je          00709A70
 00709A67    cmp         byte ptr [esi+4],0C
>00709A6B    je          00709A70
 00709A6D    lea         eax,[ebp+0C]
 00709A70    push        eax
 00709A71    push        edx
 00709A72    lea         edx,[esi+5]
 00709A75    mov         eax,dword ptr [ebx+28C]
 00709A7B    call        DispatchInvoke
 00709A80    xor         eax,eax
 00709A82    mov         al,byte ptr [esi+4]
 00709A85    jmp         dword ptr [eax*4+709A8C]
 00709A85    dd          00709AF6
 00709A85    dd          00709AF6
 00709A85    dd          00709AC0
 00709A85    dd          00709AF0
 00709A85    dd          00709AF0
 00709A85    dd          00709AE9
 00709A85    dd          00709AE9
 00709A85    dd          00709AE9
 00709A85    dd          00709ACA
 00709A85    dd          00709AF6
 00709A85    dd          00709AF6
 00709A85    dd          00709AC0
 00709A85    dd          00709AD7
 00709AC0    mov         ax,word ptr [esp+8]
 00709AC5    mov         word ptr [edi],ax
>00709AC8    jmp         00709AF6
 00709ACA    mov         eax,dword ptr [esp+8]
 00709ACE    mov         edx,edi
 00709AD0    call        GetStringResult
>00709AD5    jmp         00709AF6
 00709AD7    mov         eax,edi
 00709AD9    call        @VarClear
 00709ADE    mov         esi,esp
 00709AE0    mov         ecx,4
 00709AE5    rep movs    dword ptr [edi],dword ptr [esi]
>00709AE7    jmp         00709AF6
 00709AE9    mov         eax,dword ptr [esp+0C]
 00709AED    mov         dword ptr [edi+4],eax
 00709AF0    mov         eax,dword ptr [esp+8]
 00709AF4    mov         dword ptr [edi],eax
 00709AF6    add         esp,14
 00709AF9    pop         edi
 00709AFA    pop         esi
 00709AFB    pop         ebx
 00709AFC    ret
*}
end;

//00709B00
function TOleControl.IsCustomProperty(DispID:Integer):Boolean;
begin
{*
 00709B00    push        ebp
 00709B01    mov         ebp,esp
 00709B03    push        0
 00709B05    push        ebx
 00709B06    push        esi
 00709B07    mov         esi,edx
 00709B09    mov         ebx,eax
 00709B0B    xor         eax,eax
 00709B0D    push        ebp
 00709B0E    push        709B5A
 00709B13    push        dword ptr fs:[eax]
 00709B16    mov         dword ptr fs:[eax],esp
 00709B19    cmp         dword ptr [ebx+290],0
>00709B20    je          00709B3C
 00709B22    lea         eax,[ebp-4]
 00709B25    call        @WStrClr
 00709B2A    push        eax
 00709B2B    push        esi
 00709B2C    mov         eax,dword ptr [ebx+290]
 00709B32    push        eax
 00709B33    mov         eax,dword ptr [eax]
 00709B35    call        dword ptr [eax+0C]
 00709B38    test        eax,eax
>00709B3A    je          00709B40
 00709B3C    xor         eax,eax
>00709B3E    jmp         00709B42
 00709B40    mov         al,1
 00709B42    mov         ebx,eax
 00709B44    xor         eax,eax
 00709B46    pop         edx
 00709B47    pop         ecx
 00709B48    pop         ecx
 00709B49    mov         dword ptr fs:[eax],edx
 00709B4C    push        709B61
 00709B51    lea         eax,[ebp-4]
 00709B54    call        @WStrClr
 00709B59    ret
>00709B5A    jmp         @HandleFinally
>00709B5F    jmp         00709B51
 00709B61    mov         eax,ebx
 00709B63    pop         esi
 00709B64    pop         ebx
 00709B65    pop         ecx
 00709B66    pop         ebp
 00709B67    ret
*}
end;

//00709B68
procedure TOleControl.IsPropPageProperty(DispID:Integer);
begin
{*
 00709B68    push        ebx
 00709B69    push        esi
 00709B6A    add         esp,0FFFFFFF0
 00709B6D    mov         esi,edx
 00709B6F    mov         ebx,eax
 00709B71    cmp         dword ptr [ebx+290],0;TOleControl.FPropBrowsing:IPerPropertyBrowsing
>00709B78    je          00709B9F
 00709B7A    push        esp
 00709B7B    push        esi
 00709B7C    mov         eax,dword ptr [ebx+290];TOleControl.FPropBrowsing:IPerPropertyBrowsing
 00709B82    push        eax
 00709B83    mov         eax,dword ptr [eax]
 00709B85    call        dword ptr [eax+10]
 00709B88    dec         eax
>00709B89    jne         00709B9F
 00709B8B    mov         eax,[0078D23C];^gvar_00784E50
 00709B90    push        eax
 00709B91    lea         eax,[esp+4]
 00709B95    push        eax
 00709B96    call        ole32.IsEqualGUID
 00709B9B    test        al,al
>00709B9D    je          00709BA3
 00709B9F    xor         eax,eax
>00709BA1    jmp         00709BA5
 00709BA3    mov         al,1
 00709BA5    add         esp,10
 00709BA8    pop         esi
 00709BA9    pop         ebx
 00709BAA    ret
*}
end;

//00709BAC
procedure TOleControl.PaletteChanged(Foreground:Boolean);
begin
{*
 00709BAC    push        ebx
 00709BAD    push        esi
 00709BAE    push        ecx
 00709BAF    mov         byte ptr [esp],dl
 00709BB2    mov         esi,eax
 00709BB4    xor         ebx,ebx
 00709BB6    mov         eax,esi
 00709BB8    call        TWinControl.HandleAllocated
 00709BBD    and         al,byte ptr [esp]
>00709BC0    je          00709BE4
 00709BC2    push        0
 00709BC4    push        0
 00709BC6    push        30F
 00709BCB    mov         eax,esi
 00709BCD    call        TWinControl.GetHandle
 00709BD2    push        eax
 00709BD3    mov         eax,dword ptr [esi+254]
 00709BD9    push        eax
 00709BDA    call        user32.CallWindowProcW
 00709BDF    test        eax,eax
 00709BE1    setne       bl
 00709BE4    test        bl,bl
>00709BE6    jne         00709BF5
 00709BE8    movzx       edx,byte ptr [esp]
 00709BEC    mov         eax,esi
 00709BEE    call        TWinControl.PaletteChanged
 00709BF3    mov         ebx,eax
 00709BF5    mov         eax,ebx
 00709BF7    pop         edx
 00709BF8    pop         esi
 00709BF9    pop         ebx
 00709BFA    ret
*}
end;

//00709BFC
procedure TOleControl.PictureChanged(Sender:TObject);
begin
{*
 00709BFC    push        ebx
 00709BFD    push        esi
 00709BFE    push        edi
 00709BFF    push        ebp
 00709C00    mov         ebp,edx
 00709C02    mov         esi,eax
 00709C04    mov         ebx,dword ptr [esi+2AC]
 00709C0A    test        ebx,ebx
>00709C0C    je          00709C60
 00709C0E    mov         eax,ebp
 00709C10    mov         edx,dword ptr ds:[46279C];TPicture
 00709C16    call        @IsClass
 00709C1B    test        al,al
>00709C1D    je          00709C60
 00709C1F    mov         eax,dword ptr [ebx+8]
 00709C22    dec         eax
 00709C23    test        eax,eax
>00709C25    jl          00709C60
 00709C27    inc         eax
 00709C28    mov         ebx,eax
 00709C2A    xor         edi,edi
 00709C2C    mov         edx,edi
 00709C2E    mov         eax,dword ptr [esi+2AC]
 00709C34    call        TList.Get
 00709C39    cmp         ebp,eax
>00709C3B    jne         00709C5C
 00709C3D    mov         eax,ebp
 00709C3F    cmp         dword ptr [eax+18],0
>00709C43    je          00709C60
 00709C45    mov         edx,dword ptr [esi+270]
 00709C4B    mov         edx,dword ptr [edx+40]
 00709C4E    mov         edx,dword ptr [edx+edi*4]
 00709C51    mov         ecx,eax
 00709C53    mov         eax,esi
 00709C55    call        TOleControl.SetTPictureProp
>00709C5A    jmp         00709C60
 00709C5C    inc         edi
 00709C5D    dec         ebx
>00709C5E    jne         00709C2C
 00709C60    pop         ebp
 00709C61    pop         edi
 00709C62    pop         esi
 00709C63    pop         ebx
 00709C64    ret
*}
end;

//00709C68
procedure TOleControl.ReadData(Stream:TStream);
begin
{*
 00709C68    push        ebp
 00709C69    mov         ebp,esp
 00709C6B    push        ecx
 00709C6C    push        ebx
 00709C6D    push        esi
 00709C6E    push        edi
 00709C6F    mov         ebx,edx
 00709C71    mov         dword ptr [ebp-4],eax
 00709C74    mov         eax,dword ptr [ebp-4]
 00709C77    call        TOleControl.DestroyStorage
 00709C7C    xor         eax,eax
 00709C7E    push        ebp
 00709C7F    push        709D0A
 00709C84    push        dword ptr fs:[eax]
 00709C87    mov         dword ptr fs:[eax],esp
 00709C8A    mov         eax,ebx
 00709C8C    mov         edx,dword ptr [eax]
 00709C8E    call        dword ptr [edx]
 00709C90    push        eax
 00709C91    push        2
 00709C93    call        kernel32.GlobalAlloc
 00709C98    mov         esi,eax
 00709C9A    mov         eax,dword ptr [ebp-4]
 00709C9D    mov         dword ptr [eax+27C],esi
 00709CA3    test        esi,esi
>00709CA5    jne         00709CAC
 00709CA7    call        OutOfMemoryError
 00709CAC    mov         eax,dword ptr [ebp-4]
 00709CAF    mov         eax,dword ptr [eax+27C]
 00709CB5    push        eax
 00709CB6    call        kernel32.GlobalLock
 00709CBB    mov         esi,eax
 00709CBD    xor         eax,eax
 00709CBF    push        ebp
 00709CC0    push        709CF9
 00709CC5    push        dword ptr fs:[eax]
 00709CC8    mov         dword ptr fs:[eax],esp
 00709CCB    mov         eax,ebx
 00709CCD    mov         edx,dword ptr [eax]
 00709CCF    call        dword ptr [edx]
 00709CD1    mov         ecx,eax
 00709CD3    mov         edx,esi
 00709CD5    mov         eax,ebx
 00709CD7    mov         ebx,dword ptr [eax]
 00709CD9    call        dword ptr [ebx+0C]
 00709CDC    xor         eax,eax
 00709CDE    pop         edx
 00709CDF    pop         ecx
 00709CE0    pop         ecx
 00709CE1    mov         dword ptr fs:[eax],edx
 00709CE4    push        709D00
 00709CE9    mov         eax,dword ptr [ebp-4]
 00709CEC    mov         eax,dword ptr [eax+27C]
 00709CF2    push        eax
 00709CF3    call        kernel32.GlobalUnlock
 00709CF8    ret
>00709CF9    jmp         @HandleFinally
>00709CFE    jmp         00709CE9
 00709D00    xor         eax,eax
 00709D02    pop         edx
 00709D03    pop         ecx
 00709D04    pop         ecx
 00709D05    mov         dword ptr fs:[eax],edx
>00709D08    jmp         00709D1C
>00709D0A    jmp         @HandleAnyException
 00709D0F    mov         eax,dword ptr [ebp-4]
 00709D12    call        TOleControl.DestroyStorage
 00709D17    call        @DoneExcept
 00709D1C    pop         edi
 00709D1D    pop         esi
 00709D1E    pop         ebx
 00709D1F    pop         ecx
 00709D20    pop         ebp
 00709D21    ret
*}
end;

//00709D24
procedure TOleControl.SetBounds(ALeft:Integer; ATop:Integer; AHeight:Integer; AWidth:Integer);
begin
{*
 00709D24    push        ebp
 00709D25    mov         ebp,esp
 00709D27    add         esp,0FFFFFFE0
 00709D2A    push        ebx
 00709D2B    push        esi
 00709D2C    mov         dword ptr [ebp-8],ecx
 00709D2F    mov         dword ptr [ebp-4],edx
 00709D32    mov         ebx,eax
 00709D34    mov         esi,dword ptr [ebp+0C]
 00709D37    mov         eax,dword ptr [ebx+48]
 00709D3A    cmp         esi,eax
>00709D3C    je          00709D42
 00709D3E    test        eax,eax
>00709D40    jg          00709D56
 00709D42    mov         edx,dword ptr [ebx+4C]
 00709D45    cmp         edx,dword ptr [ebp+8]
>00709D48    je          00709DE9
 00709D4E    test        edx,edx
>00709D50    jle         00709DE9
 00709D56    test        byte ptr [ebx+2A5],4
>00709D5D    jne         00709DAE
 00709D5F    mov         eax,[0078DB00];^Screen:TScreen
 00709D64    mov         eax,dword ptr [eax]
 00709D66    mov         eax,dword ptr [eax+44]
 00709D69    push        eax
 00709D6A    push        9EC
 00709D6F    mov         eax,dword ptr [ebp+8]
 00709D72    push        eax
 00709D73    call        kernel32.MulDiv
 00709D78    push        eax
 00709D79    mov         eax,[0078DB00];^Screen:TScreen
 00709D7E    mov         eax,dword ptr [eax]
 00709D80    mov         eax,dword ptr [eax+44]
 00709D83    push        eax
 00709D84    push        9EC
 00709D89    push        esi
 00709D8A    call        kernel32.MulDiv
 00709D8F    lea         ecx,[ebp-20]
 00709D92    pop         edx
 00709D93    call        Point
 00709D98    lea         eax,[ebp-20]
 00709D9B    push        eax
 00709D9C    push        1
 00709D9E    mov         eax,dword ptr [ebx+280]
 00709DA4    push        eax
 00709DA5    mov         eax,dword ptr [eax]
 00709DA7    call        dword ptr [eax+44]
 00709DAA    test        eax,eax
>00709DAC    je          00709DB7
 00709DAE    mov         esi,dword ptr [ebx+48]
 00709DB1    mov         eax,dword ptr [ebx+4C]
 00709DB4    mov         dword ptr [ebp+8],eax
 00709DB7    cmp         dword ptr [ebx+294],0
>00709DBE    je          00709DE9
 00709DC0    mov         eax,dword ptr [ebp+8]
 00709DC3    push        eax
 00709DC4    lea         eax,[ebp-18]
 00709DC7    push        eax
 00709DC8    mov         ecx,esi
 00709DCA    mov         edx,dword ptr [ebx+44]
 00709DCD    mov         eax,dword ptr [ebx+40]
 00709DD0    call        Rect
 00709DD5    lea         eax,[ebp-18]
 00709DD8    push        eax
 00709DD9    lea         eax,[ebp-18]
 00709DDC    push        eax
 00709DDD    mov         eax,dword ptr [ebx+294]
 00709DE3    push        eax
 00709DE4    mov         eax,dword ptr [eax]
 00709DE6    call        dword ptr [eax+1C]
 00709DE9    push        esi
 00709DEA    mov         eax,dword ptr [ebp+8]
 00709DED    push        eax
 00709DEE    mov         ecx,dword ptr [ebp-8]
 00709DF1    mov         edx,dword ptr [ebp-4]
 00709DF4    mov         eax,ebx
 00709DF6    call        TWinControl.SetBounds
 00709DFB    pop         esi
 00709DFC    pop         ebx
 00709DFD    mov         esp,ebp
 00709DFF    pop         ebp
 00709E00    ret         8
*}
end;

//00709E04
procedure TOleControl.SetColorProp(Index:Integer; Value:TColor);
begin
{*
 00709E04    call        TOleControl.SetIntegerProp
 00709E09    ret
*}
end;

//00709E0C
procedure TOleControl.SetIDispatchProp(Index:Integer; const Value:IDispatch);
begin
{*
 00709E0C    add         esp,0FFFFFFF0
 00709E0F    mov         word ptr [esp],9
 00709E15    mov         dword ptr [esp+8],ecx
 00709E19    mov         ecx,esp
 00709E1B    call        TOleControl.SetProperty
 00709E20    add         esp,10
 00709E23    ret
*}
end;

//00709E24
procedure TOleControl.SetIntegerProp(Index:Integer; Value:Integer);
begin
{*
 00709E24    add         esp,0FFFFFFF0
 00709E27    mov         word ptr [esp],3
 00709E2D    mov         dword ptr [esp+8],ecx
 00709E31    mov         ecx,esp
 00709E33    call        TOleControl.SetProperty
 00709E38    add         esp,10
 00709E3B    ret
*}
end;

//00709E3C
procedure TOleControl.SetName(const Value:TComponentName);
begin
{*
 00709E3C    push        ebp
 00709E3D    mov         ebp,esp
 00709E3F    push        0
 00709E41    push        0
 00709E43    push        ebx
 00709E44    push        esi
 00709E45    push        edi
 00709E46    mov         esi,edx
 00709E48    mov         ebx,eax
 00709E4A    xor         eax,eax
 00709E4C    push        ebp
 00709E4D    push        709EE2
 00709E52    push        dword ptr fs:[eax]
 00709E55    mov         dword ptr fs:[eax],esp
 00709E58    lea         eax,[ebp-4]
 00709E5B    mov         edx,dword ptr [ebx+8]
 00709E5E    call        @UStrLAsg
 00709E63    mov         edx,esi
 00709E65    mov         eax,ebx
 00709E67    call        TControl.SetName
 00709E6C    cmp         dword ptr [ebx+288],0
>00709E73    je          00709EC7
 00709E75    push        0FFFFFD42
 00709E7A    mov         eax,dword ptr [ebx+288]
 00709E80    push        eax
 00709E81    mov         eax,dword ptr [eax]
 00709E83    call        dword ptr [eax+14]
 00709E86    mov         eax,dword ptr [ebx+270]
 00709E8C    mov         eax,dword ptr [eax+2C]
 00709E8F    test        al,30
>00709E91    je          00709EC7
 00709E93    test        al,10
>00709E95    je          00709E9E
 00709E97    mov         edi,0FFFFFDFA
>00709E9C    jmp         00709EA3
 00709E9E    mov         edi,0FFFFFDFB
 00709EA3    lea         ecx,[ebp-8]
 00709EA6    mov         edx,edi
 00709EA8    mov         eax,ebx
 00709EAA    call        TOleControl.GetStringProp
 00709EAF    mov         edx,dword ptr [ebp-8]
 00709EB2    mov         eax,dword ptr [ebp-4]
 00709EB5    call        @UStrEqual
>00709EBA    jne         00709EC7
 00709EBC    mov         ecx,esi
 00709EBE    mov         edx,edi
 00709EC0    mov         eax,ebx
 00709EC2    call        TOleControl.SetStringProp
 00709EC7    xor         eax,eax
 00709EC9    pop         edx
 00709ECA    pop         ecx
 00709ECB    pop         ecx
 00709ECC    mov         dword ptr fs:[eax],edx
 00709ECF    push        709EE9
 00709ED4    lea         eax,[ebp-8]
 00709ED7    mov         edx,2
 00709EDC    call        @UStrArrayClr
 00709EE1    ret
>00709EE2    jmp         @HandleFinally
>00709EE7    jmp         00709ED4
 00709EE9    pop         edi
 00709EEA    pop         esi
 00709EEB    pop         ebx
 00709EEC    pop         ecx
 00709EED    pop         ecx
 00709EEE    pop         ebp
 00709EEF    ret
*}
end;

//00709EF0
procedure TOleControl.SetOleBoolProp(Index:Integer; Value:TOleBool);
begin
{*
 00709EF0    add         esp,0FFFFFFF0
 00709EF3    mov         word ptr [esp],0B
 00709EF9    test        cx,cx
>00709EFC    je          00709F07
 00709EFE    mov         word ptr [esp+8],0FFFF
>00709F05    jmp         00709F0E
 00709F07    mov         word ptr [esp+8],0
 00709F0E    mov         ecx,esp
 00709F10    call        TOleControl.SetProperty
 00709F15    add         esp,10
 00709F18    ret
*}
end;

//00709F1C
procedure TOleControl.SetOleVariantProp(Index:Integer; const Value:OleVariant);
begin
{*
 00709F1C    call        TOleControl.SetProperty
 00709F21    ret
*}
end;

//00709F24
procedure TOleControl.SetParent(AParent:TWinControl);
begin
{*
 00709F24    push        ebp
 00709F25    mov         ebp,esp
 00709F27    add         esp,0FFFFFFF8
 00709F2A    push        ebx
 00709F2B    push        esi
 00709F2C    push        edi
 00709F2D    xor         ecx,ecx
 00709F2F    mov         dword ptr [ebp-4],ecx
 00709F32    mov         ebx,edx
 00709F34    mov         dword ptr [ebp-8],eax
 00709F37    xor         eax,eax
 00709F39    push        ebp
 00709F3A    push        709FF4
 00709F3F    push        dword ptr fs:[eax]
 00709F42    mov         dword ptr fs:[eax],esp
 00709F45    mov         edx,ebx
 00709F47    mov         eax,dword ptr [ebp-8]
 00709F4A    call        TWinControl.SetParent
 00709F4F    test        ebx,ebx
>00709F51    je          00709FDE
 00709F57    xor         eax,eax
 00709F59    push        ebp
 00709F5A    push        709F89
 00709F5F    push        dword ptr fs:[eax]
 00709F62    mov         dword ptr fs:[eax],esp
 00709F65    lea         eax,[ebp-4]
 00709F68    call        @IntfClear
 00709F6D    push        eax
 00709F6E    mov         eax,dword ptr [ebp-8]
 00709F71    mov         eax,dword ptr [eax+280]
 00709F77    push        eax
 00709F78    mov         eax,dword ptr [eax]
 00709F7A    call        dword ptr [eax+10]
 00709F7D    mov         ebx,eax
 00709F7F    xor         eax,eax
 00709F81    pop         edx
 00709F82    pop         ecx
 00709F83    pop         ecx
 00709F84    mov         dword ptr fs:[eax],edx
>00709F87    jmp         00709F96
>00709F89    jmp         @HandleAnyException
 00709F8E    or          ebx,0FFFFFFFF
 00709F91    call        @DoneExcept
 00709F96    test        ebx,ebx
>00709F98    jne         00709FA0
 00709F9A    cmp         dword ptr [ebp-4],0
>00709F9E    jne         00709FC1
 00709FA0    mov         eax,dword ptr [ebp-8]
 00709FA3    test        eax,eax
>00709FA5    je          00709FAC
 00709FA7    sub         eax,0FFFFFD14
 00709FAC    push        eax
 00709FAD    mov         eax,dword ptr [ebp-8]
 00709FB0    mov         eax,dword ptr [eax+280]
 00709FB6    push        eax
 00709FB7    mov         eax,dword ptr [eax]
 00709FB9    call        dword ptr [eax+0C]
 00709FBC    call        OleCheck
 00709FC1    mov         eax,dword ptr [ebp-8]
 00709FC4    cmp         dword ptr [eax+288],0
>00709FCB    je          00709FDE
 00709FCD    push        0FF
 00709FCF    mov         eax,dword ptr [ebp-8]
 00709FD2    mov         eax,dword ptr [eax+288]
 00709FD8    push        eax
 00709FD9    mov         eax,dword ptr [eax]
 00709FDB    call        dword ptr [eax+14]
 00709FDE    xor         eax,eax
 00709FE0    pop         edx
 00709FE1    pop         ecx
 00709FE2    pop         ecx
 00709FE3    mov         dword ptr fs:[eax],edx
 00709FE6    push        709FFB
 00709FEB    lea         eax,[ebp-4]
 00709FEE    call        @IntfClear
 00709FF3    ret
>00709FF4    jmp         @HandleFinally
>00709FF9    jmp         00709FEB
 00709FFB    pop         edi
 00709FFC    pop         esi
 00709FFD    pop         ebx
 00709FFE    pop         ecx
 00709FFF    pop         ecx
 0070A000    pop         ebp
 0070A001    ret
*}
end;

//0070A004
procedure TOleControl.SetTPictureProp(Index:Integer; Value:TPicture);
begin
{*
 0070A004    push        ebp
 0070A005    mov         ebp,esp
 0070A007    add         esp,0FFFFFFF0
 0070A00A    push        ebx
 0070A00B    push        esi
 0070A00C    push        edi
 0070A00D    xor         ebx,ebx
 0070A00F    mov         dword ptr [ebp-4],ebx
 0070A012    mov         dword ptr [ebp-10],ecx
 0070A015    mov         dword ptr [ebp-0C],edx
 0070A018    mov         dword ptr [ebp-8],eax
 0070A01B    xor         eax,eax
 0070A01D    push        ebp
 0070A01E    push        70A0E6
 0070A023    push        dword ptr fs:[eax]
 0070A026    mov         dword ptr fs:[eax],esp
 0070A029    mov         eax,dword ptr [ebp-8]
 0070A02C    cmp         byte ptr [eax+2B0],0
>0070A033    jne         0070A0D0
 0070A039    mov         eax,dword ptr [ebp-8]
 0070A03C    mov         byte ptr [eax+2B0],1
 0070A043    xor         eax,eax
 0070A045    push        ebp
 0070A046    push        70A0C9
 0070A04B    push        dword ptr fs:[eax]
 0070A04E    mov         dword ptr fs:[eax],esp
 0070A051    mov         eax,dword ptr [ebp-8]
 0070A054    mov         eax,dword ptr [eax+2AC]
 0070A05A    mov         esi,dword ptr [eax+8]
 0070A05D    dec         esi
 0070A05E    test        esi,esi
>0070A060    jl          0070A0B1
 0070A062    inc         esi
 0070A063    xor         ebx,ebx
 0070A065    mov         eax,dword ptr [ebp-8]
 0070A068    mov         eax,dword ptr [eax+270]
 0070A06E    mov         eax,dword ptr [eax+40]
 0070A071    mov         eax,dword ptr [eax+ebx*4]
 0070A074    cmp         eax,dword ptr [ebp-0C]
>0070A077    jne         0070A0AD
 0070A079    mov         eax,dword ptr [ebp-8]
 0070A07C    mov         eax,dword ptr [eax+2AC]
 0070A082    mov         edx,ebx
 0070A084    call        TList.Get
 0070A089    mov         edi,eax
 0070A08B    mov         edx,dword ptr [ebp-10]
 0070A08E    mov         eax,edi
 0070A090    mov         ecx,dword ptr [eax]
 0070A092    call        dword ptr [ecx+8]
 0070A095    lea         edx,[ebp-4]
 0070A098    mov         eax,edi
 0070A09A    call        GetOlePicture
 0070A09F    mov         ecx,dword ptr [ebp-4]
 0070A0A2    mov         edx,dword ptr [ebp-0C]
 0070A0A5    mov         eax,dword ptr [ebp-8]
 0070A0A8    call        TOleControl.SetIDispatchProp
 0070A0AD    inc         ebx
 0070A0AE    dec         esi
>0070A0AF    jne         0070A065
 0070A0B1    xor         eax,eax
 0070A0B3    pop         edx
 0070A0B4    pop         ecx
 0070A0B5    pop         ecx
 0070A0B6    mov         dword ptr fs:[eax],edx
 0070A0B9    push        70A0D0
 0070A0BE    mov         eax,dword ptr [ebp-8]
 0070A0C1    mov         byte ptr [eax+2B0],0
 0070A0C8    ret
>0070A0C9    jmp         @HandleFinally
>0070A0CE    jmp         0070A0BE
 0070A0D0    xor         eax,eax
 0070A0D2    pop         edx
 0070A0D3    pop         ecx
 0070A0D4    pop         ecx
 0070A0D5    mov         dword ptr fs:[eax],edx
 0070A0D8    push        70A0ED
 0070A0DD    lea         eax,[ebp-4]
 0070A0E0    call        @IntfClear
 0070A0E5    ret
>0070A0E6    jmp         @HandleFinally
>0070A0EB    jmp         0070A0DD
 0070A0ED    pop         edi
 0070A0EE    pop         esi
 0070A0EF    pop         ebx
 0070A0F0    mov         esp,ebp
 0070A0F2    pop         ebp
 0070A0F3    ret
*}
end;

//0070A0F4
procedure TOleControl.SetPropDisplayString(DispID:Integer; Value:string);
begin
{*
 0070A0F4    push        ebp
 0070A0F5    mov         ebp,esp
 0070A0F7    push        ecx
 0070A0F8    mov         ecx,4
 0070A0FD    push        0
 0070A0FF    push        0
 0070A101    dec         ecx
>0070A102    jne         0070A0FD
 0070A104    xchg        ecx,dword ptr [ebp-4]
 0070A107    push        ebx
 0070A108    push        esi
 0070A109    push        edi
 0070A10A    mov         dword ptr [ebp-1C],ecx
 0070A10D    mov         dword ptr [ebp-18],edx
 0070A110    mov         dword ptr [ebp-14],eax
 0070A113    xor         eax,eax
 0070A115    push        ebp
 0070A116    push        70A208
 0070A11B    push        dword ptr fs:[eax]
 0070A11E    mov         dword ptr fs:[eax],esp
 0070A121    mov         dl,1
 0070A123    mov         eax,[0043C7BC];TStringList
 0070A128    call        TStringList.Create
 0070A12D    mov         dword ptr [ebp-20],eax
 0070A130    xor         eax,eax
 0070A132    push        ebp
 0070A133    push        70A1D5
 0070A138    push        dword ptr fs:[eax]
 0070A13B    mov         dword ptr fs:[eax],esp
 0070A13E    mov         ecx,dword ptr [ebp-20]
 0070A141    mov         edx,dword ptr [ebp-18]
 0070A144    mov         eax,dword ptr [ebp-14]
 0070A147    call        TOleControl.GetPropDisplayStrings
 0070A14C    mov         eax,dword ptr [ebp-20]
 0070A14F    mov         edx,dword ptr [eax]
 0070A151    call        dword ptr [edx+14]
 0070A154    mov         esi,eax
 0070A156    dec         esi
 0070A157    test        esi,esi
>0070A159    jl          0070A1BF
 0070A15B    inc         esi
 0070A15C    xor         ebx,ebx
 0070A15E    lea         ecx,[ebp-24]
 0070A161    mov         edx,ebx
 0070A163    mov         eax,dword ptr [ebp-20]
 0070A166    mov         edi,dword ptr [eax]
 0070A168    call        dword ptr [edi+0C]
 0070A16B    mov         edx,dword ptr [ebp-24]
 0070A16E    mov         eax,dword ptr [ebp-1C]
 0070A171    call        AnsiCompareText
 0070A176    test        eax,eax
>0070A178    jne         0070A1BB
 0070A17A    lea         eax,[ebp-10]
 0070A17D    call        @VarClr
 0070A182    push        eax
 0070A183    mov         edx,ebx
 0070A185    mov         eax,dword ptr [ebp-20]
 0070A188    mov         ecx,dword ptr [eax]
 0070A18A    call        dword ptr [ecx+18]
 0070A18D    push        eax
 0070A18E    mov         eax,dword ptr [ebp-18]
 0070A191    push        eax
 0070A192    mov         eax,dword ptr [ebp-14]
 0070A195    mov         eax,dword ptr [eax+290]
 0070A19B    push        eax
 0070A19C    mov         eax,dword ptr [eax]
 0070A19E    call        dword ptr [eax+18]
 0070A1A1    call        OleCheck
 0070A1A6    lea         ecx,[ebp-10]
 0070A1A9    mov         edx,dword ptr [ebp-18]
 0070A1AC    mov         eax,dword ptr [ebp-14]
 0070A1AF    call        TOleControl.SetProperty
 0070A1B4    call        @TryFinallyExit
>0070A1B9    jmp         0070A1EA
 0070A1BB    inc         ebx
 0070A1BC    dec         esi
>0070A1BD    jne         0070A15E
 0070A1BF    xor         eax,eax
 0070A1C1    pop         edx
 0070A1C2    pop         ecx
 0070A1C3    pop         ecx
 0070A1C4    mov         dword ptr fs:[eax],edx
 0070A1C7    push        70A1DC
 0070A1CC    mov         eax,dword ptr [ebp-20]
 0070A1CF    call        TObject.Free
 0070A1D4    ret
>0070A1D5    jmp         @HandleFinally
>0070A1DA    jmp         0070A1CC
 0070A1DC    mov         ecx,dword ptr [ebp-1C]
 0070A1DF    mov         edx,dword ptr [ebp-18]
 0070A1E2    mov         eax,dword ptr [ebp-14]
 0070A1E5    call        TOleControl.SetStringProp
 0070A1EA    xor         eax,eax
 0070A1EC    pop         edx
 0070A1ED    pop         ecx
 0070A1EE    pop         ecx
 0070A1EF    mov         dword ptr fs:[eax],edx
 0070A1F2    push        70A20F
 0070A1F7    lea         eax,[ebp-24]
 0070A1FA    call        @UStrClr
 0070A1FF    lea         eax,[ebp-10]
 0070A202    call        @VarClr
 0070A207    ret
>0070A208    jmp         @HandleFinally
>0070A20D    jmp         0070A1F7
 0070A20F    pop         edi
 0070A210    pop         esi
 0070A211    pop         ebx
 0070A212    mov         esp,ebp
 0070A214    pop         ebp
 0070A215    ret
*}
end;

//0070A218
procedure TOleControl.SetProperty(Index:Integer; const Value:TVarData);
begin
{*
 0070A218    push        ebp
 0070A219    mov         ebp,esp
 0070A21B    add         esp,0FFFFFFD0
 0070A21E    push        ebx
 0070A21F    push        esi
 0070A220    push        edi
 0070A221    mov         esi,ecx
 0070A223    mov         edi,edx
 0070A225    mov         ebx,eax
 0070A227    lea         eax,[ebp-20]
 0070A22A    mov         edx,dword ptr ds:[42B130];tagEXCEPINFO
 0070A230    call        @InitializeRecord
 0070A235    xor         eax,eax
 0070A237    push        ebp
 0070A238    push        70A2BF
 0070A23D    push        dword ptr fs:[eax]
 0070A240    mov         dword ptr fs:[eax],esp
 0070A243    mov         eax,ebx
 0070A245    call        TOleControl.CreateControl
 0070A24A    mov         dword ptr [ebp-30],esi
 0070A24D    mov         eax,78C3D8
 0070A252    mov         dword ptr [ebp-2C],eax
 0070A255    mov         dword ptr [ebp-28],1
 0070A25C    mov         dword ptr [ebp-24],1
 0070A263    cmp         word ptr [esi],9
>0070A267    je          0070A270
 0070A269    mov         eax,4
>0070A26E    jmp         0070A275
 0070A270    mov         eax,8
 0070A275    push        0
 0070A277    lea         edx,[ebp-20]
 0070A27A    push        edx
 0070A27B    push        0
 0070A27D    lea         edx,[ebp-30]
 0070A280    push        edx
 0070A281    push        eax
 0070A282    push        0
 0070A284    mov         eax,[0078D23C];^gvar_00784E50
 0070A289    push        eax
 0070A28A    push        edi
 0070A28B    mov         eax,dword ptr [ebx+28C]
 0070A291    push        eax
 0070A292    mov         eax,dword ptr [eax]
 0070A294    call        dword ptr [eax+18]
 0070A297    test        eax,eax
>0070A299    je          0070A2A3
 0070A29B    lea         edx,[ebp-20]
 0070A29E    call        DispatchInvokeError
 0070A2A3    xor         eax,eax
 0070A2A5    pop         edx
 0070A2A6    pop         ecx
 0070A2A7    pop         ecx
 0070A2A8    mov         dword ptr fs:[eax],edx
 0070A2AB    push        70A2C6
 0070A2B0    lea         eax,[ebp-20]
 0070A2B3    mov         edx,dword ptr ds:[42B130];tagEXCEPINFO
 0070A2B9    call        @FinalizeRecord
 0070A2BE    ret
>0070A2BF    jmp         @HandleFinally
>0070A2C4    jmp         0070A2B0
 0070A2C6    pop         edi
 0070A2C7    pop         esi
 0070A2C8    pop         ebx
 0070A2C9    mov         esp,ebp
 0070A2CB    pop         ebp
 0070A2CC    ret
*}
end;

//0070A2D0
procedure TOleControl.SetStringProp(Index:Integer; const Value:UnicodeString);
begin
{*
 0070A2D0    push        ebp
 0070A2D1    mov         ebp,esp
 0070A2D3    add         esp,0FFFFFFF0
 0070A2D6    push        ebx
 0070A2D7    push        esi
 0070A2D8    push        edi
 0070A2D9    mov         edi,ecx
 0070A2DB    mov         esi,edx
 0070A2DD    mov         ebx,eax
 0070A2DF    mov         word ptr [ebp-10],8
 0070A2E5    mov         eax,edi
 0070A2E7    call        00409460
 0070A2EC    mov         dword ptr [ebp-8],eax
 0070A2EF    xor         eax,eax
 0070A2F1    push        ebp
 0070A2F2    push        70A320
 0070A2F7    push        dword ptr fs:[eax]
 0070A2FA    mov         dword ptr fs:[eax],esp
 0070A2FD    lea         ecx,[ebp-10]
 0070A300    mov         edx,esi
 0070A302    mov         eax,ebx
 0070A304    call        TOleControl.SetProperty
 0070A309    xor         eax,eax
 0070A30B    pop         edx
 0070A30C    pop         ecx
 0070A30D    pop         ecx
 0070A30E    mov         dword ptr fs:[eax],edx
 0070A311    push        70A327
 0070A316    mov         eax,dword ptr [ebp-8]
 0070A319    push        eax
 0070A31A    call        oleaut32.SysFreeString
 0070A31F    ret
>0070A320    jmp         @HandleFinally
>0070A325    jmp         0070A316
 0070A327    pop         edi
 0070A328    pop         esi
 0070A329    pop         ebx
 0070A32A    mov         esp,ebp
 0070A32C    pop         ebp
 0070A32D    ret
*}
end;

//0070A330
procedure TOleControl.SetUIActive(Active:Boolean);
begin
{*
 0070A330    push        ebx
 0070A331    push        esi
 0070A332    push        edi
 0070A333    mov         ebx,edx
 0070A335    mov         esi,eax
 0070A337    mov         dl,1
 0070A339    mov         eax,esi
 0070A33B    call        GetParentForm
 0070A340    mov         edi,eax
 0070A342    test        edi,edi
>0070A344    je          0070A382
 0070A346    test        bl,bl
>0070A348    je          0070A371
 0070A34A    mov         eax,dword ptr [edi+2E0]
 0070A350    test        eax,eax
>0070A352    je          0070A366
 0070A354    cmp         esi,eax
>0070A356    je          0070A366
 0070A358    push        0
 0070A35A    xor         ecx,ecx
 0070A35C    mov         edx,0B02A
 0070A361    call        TControl.Perform
 0070A366    mov         edx,esi
 0070A368    mov         eax,edi
 0070A36A    call        TCustomForm.SetActiveOleControl
>0070A36F    jmp         0070A382
 0070A371    cmp         esi,dword ptr [edi+2E0]
>0070A377    jne         0070A382
 0070A379    xor         edx,edx
 0070A37B    mov         eax,edi
 0070A37D    call        TCustomForm.SetActiveOleControl
 0070A382    pop         edi
 0070A383    pop         esi
 0070A384    pop         ebx
 0070A385    ret
*}
end;

//0070A388
procedure TOleControl.SetVariantProp(Index:Integer; const Value:Variant);
begin
{*
 0070A388    push        ebp
 0070A389    mov         ebp,esp
 0070A38B    push        0
 0070A38D    push        0
 0070A38F    push        0
 0070A391    push        0
 0070A393    push        ebx
 0070A394    push        esi
 0070A395    push        edi
 0070A396    mov         edi,ecx
 0070A398    mov         esi,edx
 0070A39A    mov         ebx,eax
 0070A39C    xor         eax,eax
 0070A39E    push        ebp
 0070A39F    push        70A3D6
 0070A3A4    push        dword ptr fs:[eax]
 0070A3A7    mov         dword ptr fs:[eax],esp
 0070A3AA    lea         eax,[ebp-10]
 0070A3AD    mov         edx,edi
 0070A3AF    call        @OleVarFromVar
 0070A3B4    lea         ecx,[ebp-10]
 0070A3B7    mov         edx,esi
 0070A3B9    mov         eax,ebx
 0070A3BB    call        TOleControl.SetOleVariantProp
 0070A3C0    xor         eax,eax
 0070A3C2    pop         edx
 0070A3C3    pop         ecx
 0070A3C4    pop         ecx
 0070A3C5    mov         dword ptr fs:[eax],edx
 0070A3C8    push        70A3DD
 0070A3CD    lea         eax,[ebp-10]
 0070A3D0    call        @VarClr
 0070A3D5    ret
>0070A3D6    jmp         @HandleFinally
>0070A3DB    jmp         0070A3CD
 0070A3DD    pop         edi
 0070A3DE    pop         esi
 0070A3DF    pop         ebx
 0070A3E0    mov         esp,ebp
 0070A3E2    pop         ebp
 0070A3E3    ret
*}
end;

//0070A3E4
procedure TOleControl.ShowAboutBox;
begin
{*
 0070A3E4    mov         edx,78C3DC
 0070A3E9    xor         ecx,ecx
 0070A3EB    call        TOleControl.InvokeMethod
 0070A3F0    ret
*}
end;

//0070A3F4
procedure TOleControl.StandardEvent(DispID:TDispID; var Params:TDispParams);
begin
{*
 0070A3F4    push        ebp
 0070A3F5    mov         ebp,esp
 0070A3F7    add         esp,0FFFFFFF0
 0070A3FA    push        ebx
 0070A3FB    push        esi
 0070A3FC    push        edi
 0070A3FD    mov         esi,edx
 0070A3FF    mov         dword ptr [ebp-4],eax
 0070A402    mov         ebx,dword ptr [ecx]
 0070A404    xor         eax,eax
 0070A406    push        ebp
 0070A407    push        70A5E1
 0070A40C    push        dword ptr fs:[eax]
 0070A40F    mov         dword ptr fs:[eax],esp
 0070A412    mov         eax,esi
 0070A414    add         eax,25F
 0070A419    cmp         eax,7
>0070A41C    ja          0070A5D7
 0070A422    jmp         dword ptr [eax*4+70A429]
 0070A422    dd          0070A523
 0070A422    dd          0070A523
 0070A422    dd          0070A523
 0070A422    dd          0070A46B
 0070A422    dd          0070A4E6
 0070A422    dd          0070A46B
 0070A422    dd          0070A45A
 0070A422    dd          0070A449
 0070A449    mov         eax,dword ptr [ebp-4]
 0070A44C    mov         si,0FFEC
 0070A450    call        @CallDynaInst
>0070A455    jmp         0070A5D7
 0070A45A    mov         eax,dword ptr [ebp-4]
 0070A45D    mov         si,0FFEB
 0070A461    call        @CallDynaInst
>0070A466    jmp         0070A5D7
 0070A46B    cmp         dword ptr [ecx+8],2
>0070A46F    jl          0070A5D7
 0070A475    lea         eax,[ebx+10]
 0070A478    call        @VarToInteger
 0070A47D    mov         word ptr [ebp-0E],ax
 0070A481    mov         eax,ebx
 0070A483    call        @VarToInteger
 0070A488    mov         edi,eax
 0070A48A    sub         esi,0FFFFFDA4
>0070A490    je          0070A4B3
 0070A492    sub         esi,2
>0070A495    jne         0070A4CD
 0070A497    and         edi,7
 0070A49A    movzx       ecx,word ptr [edi*2+78C3E4]
 0070A4A2    lea         edx,[ebp-0E]
 0070A4A5    mov         eax,dword ptr [ebp-4]
 0070A4A8    mov         si,0FFBA
 0070A4AC    call        @CallDynaInst
>0070A4B1    jmp         0070A4CD
 0070A4B3    and         edi,7
 0070A4B6    movzx       ecx,word ptr [edi*2+78C3E4]
 0070A4BE    lea         edx,[ebp-0E]
 0070A4C1    mov         eax,dword ptr [ebp-4]
 0070A4C4    mov         si,0FFB9
 0070A4C8    call        @CallDynaInst
 0070A4CD    test        byte ptr [ebx+11],40
>0070A4D1    je          0070A5D7
 0070A4D7    mov         eax,dword ptr [ebx+18]
 0070A4DA    movzx       edx,word ptr [ebp-0E]
 0070A4DE    mov         word ptr [eax],dx
>0070A4E1    jmp         0070A5D7
 0070A4E6    cmp         dword ptr [ecx+8],0
>0070A4EA    jle         0070A5D7
 0070A4F0    mov         eax,ebx
 0070A4F2    call        @VarToInteger
 0070A4F7    mov         word ptr [ebp-10],ax
 0070A4FB    lea         edx,[ebp-10]
 0070A4FE    mov         eax,dword ptr [ebp-4]
 0070A501    mov         si,0FFB8
 0070A505    call        @CallDynaInst
 0070A50A    test        byte ptr [ebx+1],40
>0070A50E    je          0070A5D7
 0070A514    mov         eax,dword ptr [ebx+8]
 0070A517    movzx       edx,word ptr [ebp-10]
 0070A51B    mov         word ptr [eax],dx
>0070A51E    jmp         0070A5D7
 0070A523    cmp         dword ptr [ecx+8],4
>0070A527    jl          0070A5D7
 0070A52D    lea         eax,[ebx+30]
 0070A530    call        @VarToInteger
 0070A535    mov         edi,eax
 0070A537    and         edi,7
 0070A53A    lea         eax,[ebx+20]
 0070A53D    call        @VarToInteger
 0070A542    and         eax,7
 0070A545    mov         dword ptr [ebp-0C],eax
 0070A548    movzx       eax,byte ptr [edi+78C404]
 0070A54F    mov         byte ptr [ebp-7],al
 0070A552    movzx       eax,word ptr [edi*2+78C3F4]
 0070A55A    mov         edx,dword ptr [ebp-0C]
 0070A55D    or          ax,word ptr [edx*2+78C3E4]
 0070A565    mov         word ptr [ebp-6],ax
 0070A569    lea         eax,[ebx+10]
 0070A56C    call        @VarToInteger
 0070A571    mov         edi,eax
 0070A573    mov         eax,ebx
 0070A575    call        @VarToInteger
 0070A57A    mov         dword ptr [ebp-0C],eax
 0070A57D    sub         esi,0FFFFFDA1
>0070A583    je          0070A5BE
 0070A585    dec         esi
>0070A586    je          0070A5A6
 0070A588    dec         esi
>0070A589    jne         0070A5D7
 0070A58B    push        edi
 0070A58C    mov         eax,dword ptr [ebp-0C]
 0070A58F    push        eax
 0070A590    movzx       ecx,word ptr [ebp-6]
 0070A594    movzx       edx,byte ptr [ebp-7]
 0070A598    mov         eax,dword ptr [ebp-4]
 0070A59B    mov         si,0FFD5
 0070A59F    call        @CallDynaInst
>0070A5A4    jmp         0070A5D7
 0070A5A6    mov         eax,dword ptr [ebp-0C]
 0070A5A9    push        eax
 0070A5AA    mov         ecx,edi
 0070A5AC    movzx       edx,word ptr [ebp-6]
 0070A5B0    mov         eax,dword ptr [ebp-4]
 0070A5B3    mov         si,0FFD4
 0070A5B7    call        @CallDynaInst
>0070A5BC    jmp         0070A5D7
 0070A5BE    push        edi
 0070A5BF    mov         eax,dword ptr [ebp-0C]
 0070A5C2    push        eax
 0070A5C3    movzx       ecx,word ptr [ebp-6]
 0070A5C7    movzx       edx,byte ptr [ebp-7]
 0070A5CB    mov         eax,dword ptr [ebp-4]
 0070A5CE    mov         si,0FFD3
 0070A5D2    call        @CallDynaInst
 0070A5D7    xor         eax,eax
 0070A5D9    pop         edx
 0070A5DA    pop         ecx
 0070A5DB    pop         ecx
 0070A5DC    mov         dword ptr fs:[eax],edx
>0070A5DF    jmp         0070A5FA
>0070A5E1    jmp         @HandleAnyException
 0070A5E6    mov         eax,[0078D590];^Application:TApplication
 0070A5EB    mov         eax,dword ptr [eax]
 0070A5ED    mov         edx,dword ptr [ebp-4]
 0070A5F0    call        TApplication.HandleException
 0070A5F5    call        @DoneExcept
 0070A5FA    pop         edi
 0070A5FB    pop         esi
 0070A5FC    pop         ebx
 0070A5FD    mov         esp,ebp
 0070A5FF    pop         ebp
 0070A600    ret
*}
end;

//0070A604
procedure TOleControl.WndProc(var Message:TMessage);
begin
{*
 0070A604    push        ebx
 0070A605    push        esi
 0070A606    add         esp,0FFFFFFE4
 0070A609    mov         esi,edx
 0070A60B    mov         ebx,eax
 0070A60D    mov         eax,dword ptr [esi]
 0070A60F    cmp         eax,0BD00
>0070A614    jb          0070A67C
 0070A616    cmp         eax,0BD09
>0070A61B    ja          0070A67C
 0070A61D    cmp         dword ptr [ebx+298],0
>0070A624    je          0070A67C
 0070A626    mov         eax,ebx
 0070A628    call        TWinControl.GetHandle
 0070A62D    mov         dword ptr [esp],eax
 0070A630    mov         eax,dword ptr [esi]
 0070A632    sub         eax,0BC00
 0070A637    mov         dword ptr [esp+4],eax
 0070A63B    mov         eax,dword ptr [esi+4]
 0070A63E    mov         dword ptr [esp+8],eax
 0070A642    mov         eax,dword ptr [esi+8]
 0070A645    mov         dword ptr [esp+0C],eax
 0070A649    call        user32.GetMessageTime
 0070A64E    mov         dword ptr [esp+10],eax
 0070A652    mov         dword ptr [esp+14],115DE1F1
 0070A65A    mov         dword ptr [esp+18],115DE1F1
 0070A662    push        esp
 0070A663    mov         eax,dword ptr [ebx+298]
 0070A669    push        eax
 0070A66A    mov         eax,dword ptr [eax]
 0070A66C    call        dword ptr [eax+14]
 0070A66F    test        eax,eax
>0070A671    jne         0070A67C
 0070A673    mov         dword ptr [esi+0C],1
>0070A67A    jmp         0070A6E6
 0070A67C    mov         eax,dword ptr [esi]
 0070A67E    sub         eax,0B008
>0070A683    je          0070A68A
 0070A685    dec         eax
>0070A686    je          0070A6BD
>0070A688    jmp         0070A6DD
 0070A68A    cmp         byte ptr [ebx+5B],0
>0070A68E    je          0070A6DD
 0070A690    cmp         dword ptr [ebx+288],0
>0070A697    je          0070A6DD
 0070A699    push        0FFFFFD41
 0070A69E    mov         eax,dword ptr [ebx+288]
 0070A6A4    push        eax
 0070A6A5    mov         eax,dword ptr [eax]
 0070A6A7    call        dword ptr [eax+14]
 0070A6AA    push        0FFFFFD40
 0070A6AF    mov         eax,dword ptr [ebx+288]
 0070A6B5    push        eax
 0070A6B6    mov         eax,dword ptr [eax]
 0070A6B8    call        dword ptr [eax+14]
>0070A6BB    jmp         0070A6DD
 0070A6BD    cmp         byte ptr [ebx+5C],0
>0070A6C1    je          0070A6DD
 0070A6C3    cmp         dword ptr [ebx+288],0
>0070A6CA    je          0070A6DD
 0070A6CC    push        0FFFFFD43
 0070A6D1    mov         eax,dword ptr [ebx+288]
 0070A6D7    push        eax
 0070A6D8    mov         eax,dword ptr [eax]
 0070A6DA    call        dword ptr [eax+14]
 0070A6DD    mov         edx,esi
 0070A6DF    mov         eax,ebx
 0070A6E1    call        TWinControl.WndProc
 0070A6E6    add         esp,1C
 0070A6E9    pop         esi
 0070A6EA    pop         ebx
 0070A6EB    ret
*}
end;

//0070A6EC
procedure TOleControl.WriteData(Stream:TStream);
begin
{*
 0070A6EC    push        ebp
 0070A6ED    mov         ebp,esp
 0070A6EF    add         esp,0FFFFFFF8
 0070A6F2    push        ebx
 0070A6F3    push        esi
 0070A6F4    push        edi
 0070A6F5    mov         esi,edx
 0070A6F7    mov         dword ptr [ebp-4],eax
 0070A6FA    mov         eax,dword ptr [ebp-4]
 0070A6FD    cmp         dword ptr [eax+27C],0
 0070A704    setne       byte ptr [ebp-5]
 0070A708    xor         eax,eax
 0070A70A    push        ebp
 0070A70B    push        70A7BC
 0070A710    push        dword ptr fs:[eax]
 0070A713    mov         dword ptr fs:[eax],esp
 0070A716    xor         eax,eax
 0070A718    push        ebp
 0070A719    push        70A7AB
 0070A71E    push        dword ptr fs:[eax]
 0070A721    mov         dword ptr fs:[eax],esp
 0070A724    cmp         byte ptr [ebp-5],0
>0070A728    jne         0070A732
 0070A72A    mov         eax,dword ptr [ebp-4]
 0070A72D    call        TOleControl.CreateStorage
 0070A732    mov         eax,dword ptr [ebp-4]
 0070A735    mov         eax,dword ptr [eax+27C]
 0070A73B    push        eax
 0070A73C    call        kernel32.GlobalLock
 0070A741    mov         ebx,eax
 0070A743    xor         eax,eax
 0070A745    push        ebp
 0070A746    push        70A788
 0070A74B    push        dword ptr fs:[eax]
 0070A74E    mov         dword ptr fs:[eax],esp
 0070A751    mov         eax,dword ptr [ebp-4]
 0070A754    mov         eax,dword ptr [eax+27C]
 0070A75A    push        eax
 0070A75B    call        kernel32.GlobalSize
 0070A760    mov         ecx,eax
 0070A762    mov         edx,ebx
 0070A764    mov         eax,esi
 0070A766    mov         ebx,dword ptr [eax]
 0070A768    call        dword ptr [ebx+10]
 0070A76B    xor         eax,eax
 0070A76D    pop         edx
 0070A76E    pop         ecx
 0070A76F    pop         ecx
 0070A770    mov         dword ptr fs:[eax],edx
 0070A773    push        70A78F
 0070A778    mov         eax,dword ptr [ebp-4]
 0070A77B    mov         eax,dword ptr [eax+27C]
 0070A781    push        eax
 0070A782    call        kernel32.GlobalUnlock
 0070A787    ret
>0070A788    jmp         @HandleFinally
>0070A78D    jmp         0070A778
 0070A78F    xor         eax,eax
 0070A791    pop         edx
 0070A792    pop         ecx
 0070A793    pop         ecx
 0070A794    mov         dword ptr fs:[eax],edx
 0070A797    push        70A7B2
 0070A79C    cmp         byte ptr [ebp-5],0
>0070A7A0    jne         0070A7AA
 0070A7A2    mov         eax,dword ptr [ebp-4]
 0070A7A5    call        TOleControl.DestroyStorage
 0070A7AA    ret
>0070A7AB    jmp         @HandleFinally
>0070A7B0    jmp         0070A79C
 0070A7B2    xor         eax,eax
 0070A7B4    pop         edx
 0070A7B5    pop         ecx
 0070A7B6    pop         ecx
 0070A7B7    mov         dword ptr fs:[eax],edx
>0070A7BA    jmp         0070A7EA
>0070A7BC    jmp         @HandleOnException
 0070A7C1    dd          1
 0070A7C5    dd          00418C04;Exception
 0070A7C9    dd          0070A7CD
 0070A7CD    mov         ebx,eax
 0070A7CF    mov         edx,ebx
 0070A7D1    mov         eax,dword ptr [ebp-4]
 0070A7D4    mov         ecx,dword ptr [eax]
 0070A7D6    call        dword ptr [ecx+0FC]
 0070A7DC    test        al,al
>0070A7DE    jne         0070A7E5
 0070A7E0    call        @RaiseAgain
 0070A7E5    call        @DoneExcept
 0070A7EA    pop         edi
 0070A7EB    pop         esi
 0070A7EC    pop         ebx
 0070A7ED    pop         ecx
 0070A7EE    pop         ecx
 0070A7EF    pop         ebp
 0070A7F0    ret
*}
end;

//0070A7F4
procedure TOleControl.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 0070A7F4    push        esi
 0070A7F5    mov         esi,eax
 0070A7F7    test        byte ptr [esi+2A5],4
>0070A7FE    jne         0070A809
 0070A800    mov         eax,esi
 0070A802    mov         ecx,dword ptr [eax]
 0070A804    call        dword ptr [ecx-10]
 0070A807    pop         esi
 0070A808    ret
 0070A809    mov         eax,esi
 0070A80B    call        TWinControl.WMEraseBkgnd
 0070A810    pop         esi
 0070A811    ret
*}
end;

//0070A814
procedure TOleControl.WMPaint(var Message:TWMPaint);
begin
{*
 0070A814    push        ebx
 0070A815    push        esi
 0070A816    push        edi
 0070A817    add         esp,0FFFFFFB0
 0070A81A    mov         edi,edx
 0070A81C    mov         ebx,eax
 0070A81E    test        byte ptr [ebx+2A5],4
>0070A825    je          0070A873
 0070A827    mov         esi,dword ptr [edi+4]
 0070A82A    test        esi,esi
>0070A82C    jne         0070A83E
 0070A82E    push        esp
 0070A82F    mov         eax,ebx
 0070A831    call        TWinControl.GetHandle
 0070A836    push        eax
 0070A837    call        user32.BeginPaint
 0070A83C    mov         esi,eax
 0070A83E    lea         edx,[esp+40]
 0070A842    mov         eax,ebx
 0070A844    mov         ecx,dword ptr [eax]
 0070A846    call        dword ptr [ecx+54]
 0070A849    lea         eax,[esp+40]
 0070A84D    push        eax
 0070A84E    push        esi
 0070A84F    push        1
 0070A851    mov         eax,dword ptr [ebx+280]
 0070A857    push        eax
 0070A858    call        ole32.OleDraw
 0070A85D    cmp         dword ptr [edi+4],0
>0070A861    jne         0070A87C
 0070A863    push        esp
 0070A864    mov         eax,ebx
 0070A866    call        TWinControl.GetHandle
 0070A86B    push        eax
 0070A86C    call        user32.EndPaint
>0070A871    jmp         0070A87C
 0070A873    mov         edx,edi
 0070A875    mov         eax,ebx
 0070A877    call        TWinControl.WMPaint
 0070A87C    add         esp,50
 0070A87F    pop         edi
 0070A880    pop         esi
 0070A881    pop         ebx
 0070A882    ret
*}
end;

//0070A884
procedure TOleControl.CMDocWindowActivate(var Message:TMessage);
begin
{*
 0070A884    push        ebx
 0070A885    push        esi
 0070A886    push        edi
 0070A887    push        ebp
 0070A888    mov         ebp,edx
 0070A88A    mov         esi,eax
 0070A88C    mov         dl,1
 0070A88E    mov         eax,esi
 0070A890    call        GetParentForm
 0070A895    mov         edi,eax
 0070A897    xor         ebx,ebx
 0070A899    mov         eax,edi
 0070A89B    mov         edx,dword ptr ds:[4E0C38];TForm
 0070A8A1    call        @IsClass
 0070A8A6    test        al,al
>0070A8A8    je          0070A8AC
 0070A8AA    mov         ebx,edi
 0070A8AC    test        ebx,ebx
>0070A8AE    je          0070A8DB
 0070A8B0    cmp         byte ptr [ebx+29E],1
>0070A8B7    jne         0070A8DB
 0070A8B9    mov         eax,dword ptr [ebp+4]
 0070A8BC    push        eax
 0070A8BD    mov         eax,dword ptr [esi+298]
 0070A8C3    push        eax
 0070A8C4    mov         eax,dword ptr [eax]
 0070A8C6    call        dword ptr [eax+1C]
 0070A8C9    cmp         dword ptr [ebp+4],0
>0070A8CD    jne         0070A8DB
 0070A8CF    push        0
 0070A8D1    push        0
 0070A8D3    push        0
 0070A8D5    push        esi
 0070A8D6    call        TOleControl.SetMenu
 0070A8DB    pop         ebp
 0070A8DC    pop         edi
 0070A8DD    pop         esi
 0070A8DE    pop         ebx
 0070A8DF    ret
*}
end;

//0070A8E0
procedure TOleControl.CMColorChanged(var Message:TMessage);
begin
{*
 0070A8E0    push        ebp
 0070A8E1    mov         ebp,esp
 0070A8E3    push        ecx
 0070A8E4    mov         dword ptr [ebp-4],eax
 0070A8E7    mov         eax,dword ptr [ebp-4]
 0070A8EA    call        TWinControl.CMColorChanged
 0070A8EF    mov         eax,dword ptr [ebp-4]
 0070A8F2    mov         eax,dword ptr [eax+270]
 0070A8F8    test        byte ptr [eax+2C],1
>0070A8FC    je          0070A960
 0070A8FE    mov         eax,dword ptr [ebp-4]
 0070A901    cmp         byte ptr [eax+2B1],0
>0070A908    jne         0070A960
 0070A90A    mov         eax,dword ptr [ebp-4]
 0070A90D    call        TWinControl.HandleAllocated
 0070A912    test        al,al
>0070A914    je          0070A960
 0070A916    mov         eax,dword ptr [ebp-4]
 0070A919    mov         byte ptr [eax+2B1],1
 0070A920    xor         eax,eax
 0070A922    push        ebp
 0070A923    push        70A959
 0070A928    push        dword ptr fs:[eax]
 0070A92B    mov         dword ptr fs:[eax],esp
 0070A92E    mov         eax,dword ptr [ebp-4]
 0070A931    mov         ecx,dword ptr [eax+6C]
 0070A934    mov         edx,0FFFFFE0B
 0070A939    mov         eax,dword ptr [ebp-4]
 0070A93C    call        TOleControl.SetColorProp
 0070A941    xor         eax,eax
 0070A943    pop         edx
 0070A944    pop         ecx
 0070A945    pop         ecx
 0070A946    mov         dword ptr fs:[eax],edx
 0070A949    push        70A960
 0070A94E    mov         eax,dword ptr [ebp-4]
 0070A951    mov         byte ptr [eax+2B1],0
 0070A958    ret
>0070A959    jmp         @HandleFinally
>0070A95E    jmp         0070A94E
 0070A960    pop         ecx
 0070A961    pop         ebp
 0070A962    ret
*}
end;

//0070A964
procedure TOleControl.CMEnabledChanged(var Message:TMessage);
begin
{*
 0070A964    push        ebp
 0070A965    mov         ebp,esp
 0070A967    push        ecx
 0070A968    mov         dword ptr [ebp-4],eax
 0070A96B    mov         eax,dword ptr [ebp-4]
 0070A96E    call        TWinControl.CMEnabledChanged
 0070A973    mov         eax,dword ptr [ebp-4]
 0070A976    mov         eax,dword ptr [eax+270];TOleControl.FControlData:PControlData
 0070A97C    test        byte ptr [eax+2C],8
>0070A980    je          0070A9EA
 0070A982    mov         eax,dword ptr [ebp-4]
 0070A985    cmp         byte ptr [eax+2B3],0;TOleControl.FUpdatingEnabled:Boolean
>0070A98C    jne         0070A9EA
 0070A98E    mov         eax,dword ptr [ebp-4]
 0070A991    call        TWinControl.HandleAllocated
 0070A996    test        al,al
>0070A998    je          0070A9EA
 0070A99A    mov         eax,dword ptr [ebp-4]
 0070A99D    mov         byte ptr [eax+2B3],1;TOleControl.FUpdatingEnabled:Boolean
 0070A9A4    xor         eax,eax
 0070A9A6    push        ebp
 0070A9A7    push        70A9E3
 0070A9AC    push        dword ptr fs:[eax]
 0070A9AF    mov         dword ptr fs:[eax],esp
 0070A9B2    mov         eax,dword ptr [ebp-4]
 0070A9B5    mov         edx,dword ptr [eax]
 0070A9B7    call        dword ptr [edx+5C];TGroupBox.GetEnabled
 0070A9BA    neg         al
 0070A9BC    sbb         ecx,ecx
 0070A9BE    mov         edx,0FFFFFDFE
 0070A9C3    mov         eax,dword ptr [ebp-4]
 0070A9C6    call        TOleControl.SetOleBoolProp
 0070A9CB    xor         eax,eax
 0070A9CD    pop         edx
 0070A9CE    pop         ecx
 0070A9CF    pop         ecx
 0070A9D0    mov         dword ptr fs:[eax],edx
 0070A9D3    push        70A9EA
 0070A9D8    mov         eax,dword ptr [ebp-4]
 0070A9DB    mov         byte ptr [eax+2B3],0;TOleControl.FUpdatingEnabled:Boolean
 0070A9E2    ret
>0070A9E3    jmp         @HandleFinally
>0070A9E8    jmp         0070A9D8
 0070A9EA    pop         ecx
 0070A9EB    pop         ebp
 0070A9EC    ret
*}
end;

//0070A9F0
procedure TOleControl.CMFontChanged(var Message:TMessage);
begin
{*
 0070A9F0    push        ebp
 0070A9F1    mov         ebp,esp
 0070A9F3    xor         ecx,ecx
 0070A9F5    push        ecx
 0070A9F6    push        ecx
 0070A9F7    push        ecx
 0070A9F8    push        ecx
 0070A9F9    push        ecx
 0070A9FA    mov         dword ptr [ebp-4],eax
 0070A9FD    xor         eax,eax
 0070A9FF    push        ebp
 0070AA00    push        70AAE5
 0070AA05    push        dword ptr fs:[eax]
 0070AA08    mov         dword ptr fs:[eax],esp
 0070AA0B    mov         eax,dword ptr [ebp-4]
 0070AA0E    call        TWinControl.CMFontChanged
 0070AA13    mov         eax,dword ptr [ebp-4]
 0070AA16    mov         eax,dword ptr [eax+270]
 0070AA1C    test        byte ptr [eax+2C],6
>0070AA20    je          0070AACF
 0070AA26    mov         eax,dword ptr [ebp-4]
 0070AA29    cmp         byte ptr [eax+2B2],0
>0070AA30    jne         0070AACF
 0070AA36    mov         eax,dword ptr [ebp-4]
 0070AA39    call        TWinControl.HandleAllocated
 0070AA3E    test        al,al
>0070AA40    je          0070AACF
 0070AA46    mov         eax,dword ptr [ebp-4]
 0070AA49    mov         byte ptr [eax+2B2],1
 0070AA50    xor         eax,eax
 0070AA52    push        ebp
 0070AA53    push        70AAC8
 0070AA58    push        dword ptr fs:[eax]
 0070AA5B    mov         dword ptr fs:[eax],esp
 0070AA5E    mov         eax,dword ptr [ebp-4]
 0070AA61    mov         eax,dword ptr [eax+270]
 0070AA67    test        byte ptr [eax+2C],2
>0070AA6B    je          0070AA83
 0070AA6D    mov         eax,dword ptr [ebp-4]
 0070AA70    mov         eax,dword ptr [eax+64]
 0070AA73    mov         ecx,dword ptr [eax+18]
 0070AA76    mov         edx,0FFFFFDFF
 0070AA7B    mov         eax,dword ptr [ebp-4]
 0070AA7E    call        TOleControl.SetIntegerProp
 0070AA83    mov         eax,dword ptr [ebp-4]
 0070AA86    mov         eax,dword ptr [eax+270]
 0070AA8C    test        byte ptr [eax+2C],4
>0070AA90    je          0070AAB0
 0070AA92    lea         edx,[ebp-14]
 0070AA95    mov         eax,dword ptr [ebp-4]
 0070AA98    mov         eax,dword ptr [eax+64]
 0070AA9B    call        FontToOleFont
 0070AAA0    lea         ecx,[ebp-14]
 0070AAA3    mov         edx,0FFFFFE00
 0070AAA8    mov         eax,dword ptr [ebp-4]
 0070AAAB    call        TOleControl.SetVariantProp
 0070AAB0    xor         eax,eax
 0070AAB2    pop         edx
 0070AAB3    pop         ecx
 0070AAB4    pop         ecx
 0070AAB5    mov         dword ptr fs:[eax],edx
 0070AAB8    push        70AACF
 0070AABD    mov         eax,dword ptr [ebp-4]
 0070AAC0    mov         byte ptr [eax+2B2],0
 0070AAC7    ret
>0070AAC8    jmp         @HandleFinally
>0070AACD    jmp         0070AABD
 0070AACF    xor         eax,eax
 0070AAD1    pop         edx
 0070AAD2    pop         ecx
 0070AAD3    pop         ecx
 0070AAD4    mov         dword ptr fs:[eax],edx
 0070AAD7    push        70AAEC
 0070AADC    lea         eax,[ebp-14]
 0070AADF    call        @VarClr
 0070AAE4    ret
>0070AAE5    jmp         @HandleFinally
>0070AAEA    jmp         0070AADC
 0070AAEC    mov         esp,ebp
 0070AAEE    pop         ebp
 0070AAEF    ret
*}
end;

//0070AAF0
procedure TOleControl.CMDialogKey(var Message:TMessage);
begin
{*
 0070AAF0    push        ebx
 0070AAF1    push        esi
 0070AAF2    push        edi
 0070AAF3    add         esp,0FFFFFFE0
 0070AAF6    mov         edi,edx
 0070AAF8    mov         ebx,eax
 0070AAFA    mov         eax,ebx
 0070AAFC    mov         si,0FFB6
 0070AB00    call        @CallDynaInst
 0070AB05    test        al,al
>0070AB07    je          0070AB7C
 0070AB09    cmp         word ptr [ebx+2C8],0
>0070AB11    je          0070AB7C
 0070AB13    lea         eax,[esp+2]
 0070AB17    xor         ecx,ecx
 0070AB19    mov         edx,1C
 0070AB1E    call        @FillChar
 0070AB23    mov         eax,ebx
 0070AB25    call        TWinControl.GetHandle
 0070AB2A    mov         dword ptr [esp+2],eax
 0070AB2E    mov         dword ptr [esp+6],100
 0070AB36    mov         eax,dword ptr [edi+4]
 0070AB39    mov         dword ptr [esp+0A],eax
 0070AB3D    mov         eax,dword ptr [edi+8]
 0070AB40    mov         dword ptr [esp+0E],eax
 0070AB44    push        esp
 0070AB45    lea         eax,[esp+6]
 0070AB49    push        eax
 0070AB4A    movzx       eax,word ptr [ebx+2C8]
 0070AB51    push        eax
 0070AB52    mov         eax,dword ptr [ebx+2C4]
 0070AB58    push        eax
 0070AB59    call        ole32.IsAccelerator
 0070AB5E    test        eax,eax
>0070AB60    je          0070AB7C
 0070AB62    lea         eax,[esp+2]
 0070AB66    push        eax
 0070AB67    mov         eax,dword ptr [ebx+288]
 0070AB6D    push        eax
 0070AB6E    mov         eax,dword ptr [eax]
 0070AB70    call        dword ptr [eax+10]
 0070AB73    mov         dword ptr [edi+0C],1
>0070AB7A    jmp         0070AB85
 0070AB7C    mov         edx,edi
 0070AB7E    mov         eax,ebx
 0070AB80    call        TWinControl.CMDialogKey
 0070AB85    add         esp,20
 0070AB88    pop         edi
 0070AB89    pop         esi
 0070AB8A    pop         ebx
 0070AB8B    ret
*}
end;

//0070AB8C
procedure TOleControl.CMUIActivate(var Message:TMessage);
begin
{*
 0070AB8C    push        ebx
 0070AB8D    add         esp,0FFFFFFF0
 0070AB90    mov         ebx,eax
 0070AB92    mov         dl,1
 0070AB94    mov         eax,ebx
 0070AB96    call        GetParentForm
 0070AB9B    test        eax,eax
>0070AB9D    je          0070ABA7
 0070AB9F    cmp         ebx,dword ptr [eax+2E0]
>0070ABA5    je          0070ABD7
 0070ABA7    mov         edx,esp
 0070ABA9    mov         eax,ebx
 0070ABAB    call        TControl.GetBoundsRect
 0070ABB0    push        esp
 0070ABB1    mov         eax,ebx
 0070ABB3    call        TWinControl.GetParentHandle
 0070ABB8    push        eax
 0070ABB9    push        0
 0070ABBB    mov         eax,ebx
 0070ABBD    test        eax,eax
>0070ABBF    je          0070ABC6
 0070ABC1    sub         eax,0FFFFFD14
 0070ABC6    push        eax
 0070ABC7    push        0
 0070ABC9    push        0FC
 0070ABCB    mov         eax,dword ptr [ebx+280]
 0070ABD1    push        eax
 0070ABD2    mov         eax,dword ptr [eax]
 0070ABD4    call        dword ptr [eax+2C]
 0070ABD7    add         esp,10
 0070ABDA    pop         ebx
 0070ABDB    ret
*}
end;

//0070ABDC
procedure TOleControl.CMUIDeactivate(var Message:TMessage);
begin
{*
 0070ABDC    push        ebx
 0070ABDD    push        esi
 0070ABDE    mov         ebx,eax
 0070ABE0    mov         dl,1
 0070ABE2    mov         eax,ebx
 0070ABE4    call        GetParentForm
 0070ABE9    mov         esi,eax
 0070ABEB    test        esi,esi
>0070ABED    je          0070ABF7
 0070ABEF    cmp         ebx,dword ptr [esi+2E0]
>0070ABF5    jne         0070AC20
 0070ABF7    cmp         dword ptr [ebx+294],0
>0070ABFE    je          0070AC0C
 0070AC00    mov         eax,dword ptr [ebx+294]
 0070AC06    push        eax
 0070AC07    mov         eax,dword ptr [eax]
 0070AC09    call        dword ptr [eax+18]
 0070AC0C    test        esi,esi
>0070AC0E    je          0070AC20
 0070AC10    cmp         ebx,dword ptr [esi+290]
>0070AC16    jne         0070AC20
 0070AC18    push        0
 0070AC1A    push        ebx
 0070AC1B    call        TOleControl.OnUIDeactivate
 0070AC20    pop         esi
 0070AC21    pop         ebx
 0070AC22    ret
*}
end;

//0070AC24
function TOleControl.QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;
begin
{*
 0070AC24    push        ebp
 0070AC25    mov         ebp,esp
 0070AC27    push        ebx
 0070AC28    mov         ebx,dword ptr [ebp+8]
 0070AC2B    mov         ecx,dword ptr [ebp+10]
 0070AC2E    mov         edx,dword ptr [ebp+0C]
 0070AC31    mov         eax,ebx
 0070AC33    call        TObject.GetInterface
 0070AC38    test        al,al
>0070AC3A    je          0070AC40
 0070AC3C    xor         eax,eax
>0070AC3E    jmp         0070AC45
 0070AC40    mov         eax,80004002
 0070AC45    pop         ebx
 0070AC46    pop         ebp
 0070AC47    ret         0C
*}
end;

//0070AC4C
function TOleControl._AddRef:Integer; stdcall;
begin
{*
 0070AC4C    push        ebp
 0070AC4D    mov         ebp,esp
 0070AC4F    mov         eax,dword ptr [ebp+8]
 0070AC52    inc         dword ptr [eax+274]
 0070AC58    mov         eax,dword ptr [eax+274]
 0070AC5E    pop         ebp
 0070AC5F    ret         4
*}
end;

//0070AC64
function TOleControl._Release:Integer; stdcall;
begin
{*
 0070AC64    push        ebp
 0070AC65    mov         ebp,esp
 0070AC67    mov         eax,dword ptr [ebp+8]
 0070AC6A    dec         dword ptr [eax+274]
 0070AC70    mov         eax,dword ptr [eax+274]
 0070AC76    pop         ebp
 0070AC77    ret         4
*}
end;

//0070AC7C
function TOleControl.CanInPlaceActivate:HRESULT; stdcall;
begin
{*
 0070AC7C    push        ebp
 0070AC7D    mov         ebp,esp
 0070AC7F    xor         eax,eax
 0070AC81    pop         ebp
 0070AC82    ret         4
*}
end;

//0070AC88
function TOleControl.GetMoniker(dwAssign:LongInt; dwWhichMoniker:LongInt; var mk:IMoniker):HRESULT; stdcall;
begin
{*
 0070AC88    push        ebp
 0070AC89    mov         ebp,esp
 0070AC8B    mov         eax,dword ptr [ebp+14]
 0070AC8E    test        eax,eax
>0070AC90    je          0070AC96
 0070AC92    xor         edx,edx
 0070AC94    mov         dword ptr [eax],edx
 0070AC96    mov         eax,80004001
 0070AC9B    pop         ebp
 0070AC9C    ret         10
*}
end;

//0070ACA0
function TOleControl.GetContainer(var container:IOleContainer):HRESULT; stdcall;
begin
{*
 0070ACA0    push        ebp
 0070ACA1    mov         ebp,esp
 0070ACA3    mov         eax,dword ptr [ebp+0C]
 0070ACA6    test        eax,eax
>0070ACA8    je          0070ACAE
 0070ACAA    xor         edx,edx
 0070ACAC    mov         dword ptr [eax],edx
 0070ACAE    mov         eax,80004002
 0070ACB3    pop         ebp
 0070ACB4    ret         8
*}
end;

//0070ACB8
function TOleControl.ShowObject:HRESULT; stdcall;
begin
{*
 0070ACB8    push        ebp
 0070ACB9    mov         ebp,esp
 0070ACBB    mov         eax,dword ptr [ebp+8]
 0070ACBE    call        TOleControl.HookControlWndProc
 0070ACC3    xor         eax,eax
 0070ACC5    pop         ebp
 0070ACC6    ret         4
*}
end;

//0070ACCC
function TOleControl.ContextSensitiveHelp(fEnterMode:BOOL):HRESULT; stdcall;
begin
{*
 0070ACCC    push        ebp
 0070ACCD    mov         ebp,esp
 0070ACCF    xor         eax,eax
 0070ACD1    pop         ebp
 0070ACD2    ret         8
*}
end;

//0070ACD8
function TOleControl.RequestNewObjectLayout:HRESULT; stdcall;
begin
{*
 0070ACD8    push        ebp
 0070ACD9    mov         ebp,esp
 0070ACDB    add         esp,0FFFFFFF4
 0070ACDE    push        ebx
 0070ACDF    push        esi
 0070ACE0    push        edi
 0070ACE1    mov         ebx,dword ptr [ebp+8]
 0070ACE4    lea         eax,[ebp-0C]
 0070ACE7    push        eax
 0070ACE8    push        1
 0070ACEA    mov         eax,dword ptr [ebx+280]
 0070ACF0    push        eax
 0070ACF1    mov         eax,dword ptr [eax]
 0070ACF3    call        dword ptr [eax+48]
 0070ACF6    mov         dword ptr [ebp-4],eax
 0070ACF9    cmp         dword ptr [ebp-4],0
>0070ACFD    jne         0070AD6D
 0070ACFF    push        9EC
 0070AD04    mov         eax,[0078DB00];^Screen:TScreen
 0070AD09    mov         eax,dword ptr [eax]
 0070AD0B    mov         eax,dword ptr [eax+44]
 0070AD0E    push        eax
 0070AD0F    mov         eax,dword ptr [ebp-0C]
 0070AD12    push        eax
 0070AD13    call        kernel32.MulDiv
 0070AD18    mov         esi,eax
 0070AD1A    push        9EC
 0070AD1F    mov         eax,[0078DB00];^Screen:TScreen
 0070AD24    mov         eax,dword ptr [eax]
 0070AD26    mov         eax,dword ptr [eax+44]
 0070AD29    push        eax
 0070AD2A    mov         eax,dword ptr [ebp-8]
 0070AD2D    push        eax
 0070AD2E    call        kernel32.MulDiv
 0070AD33    mov         edi,eax
 0070AD35    test        byte ptr [ebx+2A5],4
>0070AD3C    je          0070AD5B
 0070AD3E    cmp         dword ptr [ebx+288],0
>0070AD45    jne         0070AD5B
 0070AD47    cmp         esi,20
>0070AD4A    jle         0070AD51
 0070AD4C    mov         esi,20
 0070AD51    cmp         edi,20
>0070AD54    jle         0070AD5B
 0070AD56    mov         edi,20
 0070AD5B    push        esi
 0070AD5C    push        edi
 0070AD5D    mov         ecx,dword ptr [ebx+44]
 0070AD60    mov         edx,dword ptr [ebx+40]
 0070AD63    mov         eax,ebx
 0070AD65    mov         ebx,dword ptr [eax]
 0070AD67    call        dword ptr [ebx+98]
 0070AD6D    mov         eax,dword ptr [ebp-4]
 0070AD70    pop         edi
 0070AD71    pop         esi
 0070AD72    pop         ebx
 0070AD73    mov         esp,ebp
 0070AD75    pop         ebp
 0070AD76    ret         4
*}
end;

//0070AD7C
function TOleControl.DiscardUndoState:HRESULT; stdcall;
begin
{*
 0070AD7C    push        ebp
 0070AD7D    mov         ebp,esp
 0070AD7F    mov         eax,80004001
 0070AD84    pop         ebp
 0070AD85    ret         4
*}
end;

//0070AD88
function TOleControl.LockInPlaceActive(fLock:BOOL):HRESULT; stdcall;
begin
{*
 0070AD88    push        ebp
 0070AD89    mov         ebp,esp
 0070AD8B    mov         eax,80004001
 0070AD90    pop         ebp
 0070AD91    ret         8
*}
end;

//0070AD94
function TOleControl.GetExtendedControl(var disp:IDispatch):HRESULT; stdcall;
begin
{*
 0070AD94    push        ebp
 0070AD95    mov         ebp,esp
 0070AD97    mov         eax,dword ptr [ebp+0C]
 0070AD9A    test        eax,eax
>0070AD9C    je          0070ADA2
 0070AD9E    xor         edx,edx
 0070ADA0    mov         dword ptr [eax],edx
 0070ADA2    mov         eax,80004001
 0070ADA7    pop         ebp
 0070ADA8    ret         8
*}
end;

//0070ADAC
function TOleControl.TransformCoords(var ptlHimetric:TPoint; var ptfContainer:TPointF; flags:LongInt):HRESULT; stdcall;
begin
{*
 0070ADAC    push        ebp
 0070ADAD    mov         ebp,esp
 0070ADAF    push        ecx
 0070ADB0    push        ebx
 0070ADB1    push        esi
 0070ADB2    mov         esi,dword ptr [ebp+10]
 0070ADB5    mov         ebx,dword ptr [ebp+0C]
 0070ADB8    test        byte ptr [ebp+14],4
>0070ADBC    je          0070AE04
 0070ADBE    push        9EC
 0070ADC3    mov         eax,[0078DB00];^Screen:TScreen
 0070ADC8    mov         eax,dword ptr [eax]
 0070ADCA    mov         eax,dword ptr [eax+44]
 0070ADCD    push        eax
 0070ADCE    mov         eax,dword ptr [ebx]
 0070ADD0    push        eax
 0070ADD1    call        kernel32.MulDiv
 0070ADD6    mov         dword ptr [ebp-4],eax
 0070ADD9    fild        dword ptr [ebp-4]
 0070ADDC    fstp        dword ptr [esi]
 0070ADDE    wait
 0070ADDF    push        9EC
 0070ADE4    mov         eax,[0078DB00];^Screen:TScreen
 0070ADE9    mov         eax,dword ptr [eax]
 0070ADEB    mov         eax,dword ptr [eax+44]
 0070ADEE    push        eax
 0070ADEF    mov         eax,dword ptr [ebx+4]
 0070ADF2    push        eax
 0070ADF3    call        kernel32.MulDiv
 0070ADF8    mov         dword ptr [ebp-4],eax
 0070ADFB    fild        dword ptr [ebp-4]
 0070ADFE    fstp        dword ptr [esi+4]
 0070AE01    wait
>0070AE02    jmp         0070AE3C
 0070AE04    fld         dword ptr [esi]
 0070AE06    fmul        dword ptr ds:[70AE48]
 0070AE0C    mov         eax,[0078DB00];^Screen:TScreen
 0070AE11    mov         eax,dword ptr [eax]
 0070AE13    fild        dword ptr [eax+44]
 0070AE16    fdivp       st(1),st
 0070AE18    call        @ROUND
 0070AE1D    mov         dword ptr [ebx],eax
 0070AE1F    fld         dword ptr [esi+4]
 0070AE22    fmul        dword ptr ds:[70AE48]
 0070AE28    mov         eax,[0078DB00];^Screen:TScreen
 0070AE2D    mov         eax,dword ptr [eax]
 0070AE2F    fild        dword ptr [eax+44]
 0070AE32    fdivp       st(1),st
 0070AE34    call        @ROUND
 0070AE39    mov         dword ptr [ebx+4],eax
 0070AE3C    xor         eax,eax
 0070AE3E    pop         esi
 0070AE3F    pop         ebx
 0070AE40    pop         ecx
 0070AE41    pop         ebp
 0070AE42    ret         10
*}
end;

//0070AE4C
function TOleControl.OleControlSite_TranslateAccelerator(msg:PMsg; grfModifiers:LongInt):HRESULT; stdcall;
begin
{*
 0070AE4C    push        ebp
 0070AE4D    mov         ebp,esp
 0070AE4F    mov         eax,80004001
 0070AE54    pop         ebp
 0070AE55    ret         0C
*}
end;

//0070AE58
function TOleControl.OnFocus(fGotFocus:BOOL):HRESULT; stdcall;
begin
{*
 0070AE58    push        ebp
 0070AE59    mov         ebp,esp
 0070AE5B    mov         eax,80004001
 0070AE60    pop         ebp
 0070AE61    ret         8
*}
end;

//0070AE64
function TOleControl.OnControlInfoChanged:HRESULT; stdcall;
begin
{*
 0070AE64    push        ebp
 0070AE65    mov         ebp,esp
 0070AE67    mov         eax,80004001
 0070AE6C    pop         ebp
 0070AE6D    ret         4
*}
end;

//0070AE70
function TOleControl.EnableModeless(fEnable:BOOL):HRESULT; stdcall;
begin
{*
 0070AE70    push        ebp
 0070AE71    mov         ebp,esp
 0070AE73    xor         eax,eax
 0070AE75    pop         ebp
 0070AE76    ret         8
*}
end;

//0070AE7C
function TOleControl.OleInPlaceSite_GetWindow(var wnd:HWND):HRESULT; stdcall;
begin
{*
 0070AE7C    push        ebp
 0070AE7D    mov         ebp,esp
 0070AE7F    push        ebx
 0070AE80    push        esi
 0070AE81    push        edi
 0070AE82    mov         esi,dword ptr [ebp+0C]
 0070AE85    mov         ebx,dword ptr [ebp+8]
 0070AE88    xor         edi,edi
 0070AE8A    mov         eax,ebx
 0070AE8C    call        TWinControl.GetParentHandle
 0070AE91    mov         dword ptr [esi],eax
 0070AE93    cmp         dword ptr [esi],0
>0070AE96    jne         0070AE9D
 0070AE98    mov         edi,80004005
 0070AE9D    mov         eax,edi
 0070AE9F    pop         edi
 0070AEA0    pop         esi
 0070AEA1    pop         ebx
 0070AEA2    pop         ebp
 0070AEA3    ret         8
*}
end;

//0070AEA8
function TOleControl.SaveObject:HRESULT; stdcall;
begin
{*
 0070AEA8    push        ebp
 0070AEA9    mov         ebp,esp
 0070AEAB    xor         eax,eax
 0070AEAD    pop         ebp
 0070AEAE    ret         4
*}
end;

//0070AEB4
function TOleControl.OnInPlaceActivate:HRESULT; stdcall;
begin
{*
 0070AEB4    push        ebp
 0070AEB5    mov         ebp,esp
 0070AEB7    push        ebx
 0070AEB8    mov         ebx,dword ptr [ebp+8]
 0070AEBB    lea         eax,[ebx+294]
 0070AEC1    call        @IntfClear
 0070AEC6    push        eax
 0070AEC7    push        70AEFC
 0070AECC    mov         eax,dword ptr [ebx+280]
 0070AED2    push        eax
 0070AED3    mov         eax,dword ptr [eax]
 0070AED5    call        dword ptr [eax]
 0070AED7    lea         eax,[ebx+298]
 0070AEDD    call        @IntfClear
 0070AEE2    push        eax
 0070AEE3    push        70AF0C
 0070AEE8    mov         eax,dword ptr [ebx+280]
 0070AEEE    push        eax
 0070AEEF    mov         eax,dword ptr [eax]
 0070AEF1    call        dword ptr [eax]
 0070AEF3    xor         eax,eax
 0070AEF5    pop         ebx
 0070AEF6    pop         ebp
 0070AEF7    ret         4
*}
end;

//0070AF1C
function TOleControl.OnUIActivate:HRESULT; stdcall;
begin
{*
 0070AF1C    push        ebp
 0070AF1D    mov         ebp,esp
 0070AF1F    mov         eax,dword ptr [ebp+8]
 0070AF22    mov         dl,1
 0070AF24    call        TOleControl.SetUIActive
 0070AF29    xor         eax,eax
 0070AF2B    pop         ebp
 0070AF2C    ret         4
*}
end;

//0070AF30
function TOleControl.GetWindowContext(var frame:IOleInPlaceFrame; var doc:IOleInPlaceUIWindow; var rcPosRect:TRect; var rcClipRect:TRect; var frameInfo:TOleInPlaceFrameInfo):HRESULT; stdcall;
begin
{*
 0070AF30    push        ebp
 0070AF31    mov         ebp,esp
 0070AF33    add         esp,0FFFFFFF0
 0070AF36    push        ebx
 0070AF37    push        esi
 0070AF38    push        edi
 0070AF39    mov         esi,dword ptr [ebp+1C]
 0070AF3C    mov         ebx,dword ptr [ebp+8]
 0070AF3F    mov         eax,dword ptr [ebp+0C]
 0070AF42    test        eax,eax
>0070AF44    je          0070AF4A
 0070AF46    xor         edx,edx
 0070AF48    mov         dword ptr [eax],edx
 0070AF4A    mov         eax,dword ptr [ebp+10]
 0070AF4D    test        eax,eax
>0070AF4F    je          0070AF55
 0070AF51    xor         edx,edx
 0070AF53    mov         dword ptr [eax],edx
 0070AF55    mov         eax,dword ptr [ebp+0C]
 0070AF58    mov         edx,ebx
 0070AF5A    test        edx,edx
>0070AF5C    je          0070AF64
 0070AF5E    sub         edx,0FFFFFD20
 0070AF64    call        @IntfCopy
 0070AF69    mov         eax,dword ptr [ebp+10]
 0070AF6C    call        @IntfClear
 0070AF71    lea         edx,[ebp-10]
 0070AF74    mov         eax,ebx
 0070AF76    call        TControl.GetBoundsRect
 0070AF7B    mov         eax,dword ptr [ebp+14]
 0070AF7E    push        esi
 0070AF7F    lea         esi,[ebp-10]
 0070AF82    mov         edi,eax
 0070AF84    movs        dword ptr [edi],dword ptr [esi]
 0070AF85    movs        dword ptr [edi],dword ptr [esi]
 0070AF86    movs        dword ptr [edi],dword ptr [esi]
 0070AF87    movs        dword ptr [edi],dword ptr [esi]
 0070AF88    pop         esi
 0070AF89    push        7FFF
 0070AF8E    push        7FFF
 0070AF93    push        0
 0070AF95    push        0
 0070AF97    mov         eax,dword ptr [ebp+18]
 0070AF9A    push        eax
 0070AF9B    call        user32.SetRect
 0070AFA0    xor         eax,eax
 0070AFA2    mov         dword ptr [esi+4],eax
 0070AFA5    mov         eax,ebx
 0070AFA7    call        TWinControl.GetTopParentHandle
 0070AFAC    mov         dword ptr [esi+8],eax
 0070AFAF    xor         eax,eax
 0070AFB1    mov         dword ptr [esi+0C],eax
 0070AFB4    xor         eax,eax
 0070AFB6    mov         dword ptr [esi+10],eax
 0070AFB9    xor         eax,eax
 0070AFBB    pop         edi
 0070AFBC    pop         esi
 0070AFBD    pop         ebx
 0070AFBE    mov         esp,ebp
 0070AFC0    pop         ebp
 0070AFC1    ret         18
*}
end;

//0070AFC4
function TOleControl.Scroll(scrollExtent:TPoint):HRESULT; stdcall;
begin
{*
 0070AFC4    push        ebp
 0070AFC5    mov         ebp,esp
 0070AFC7    mov         eax,80004001
 0070AFCC    pop         ebp
 0070AFCD    ret         0C
*}
end;

//0070AFD0
function TOleControl.OnUIDeactivate(fUndoable:BOOL):HRESULT; stdcall;
begin
{*
 0070AFD0    push        ebp
 0070AFD1    mov         ebp,esp
 0070AFD3    push        ebx
 0070AFD4    mov         ebx,dword ptr [ebp+8]
 0070AFD7    push        0
 0070AFD9    push        0
 0070AFDB    push        0
 0070AFDD    push        ebx
 0070AFDE    call        TOleControl.SetMenu
 0070AFE3    xor         edx,edx
 0070AFE5    mov         eax,ebx
 0070AFE7    call        TOleControl.SetUIActive
 0070AFEC    xor         eax,eax
 0070AFEE    pop         ebx
 0070AFEF    pop         ebp
 0070AFF0    ret         8
*}
end;

//0070AFF4
function TOleControl.OnInPlaceDeactivate:HRESULT; stdcall;
begin
{*
 0070AFF4    push        ebp
 0070AFF5    mov         ebp,esp
 0070AFF7    push        ebx
 0070AFF8    mov         ebx,dword ptr [ebp+8]
 0070AFFB    lea         eax,[ebx+298]
 0070B001    call        @IntfClear
 0070B006    lea         eax,[ebx+294]
 0070B00C    call        @IntfClear
 0070B011    xor         eax,eax
 0070B013    pop         ebx
 0070B014    pop         ebp
 0070B015    ret         4
*}
end;

//0070B018
function TOleControl.ShowPropertyFrame:HRESULT; stdcall;
begin
{*
 0070B018    push        ebp
 0070B019    mov         ebp,esp
 0070B01B    mov         eax,80004001
 0070B020    pop         ebp
 0070B021    ret         4
*}
end;

//0070B024
function TOleControl.DeactivateAndUndo:HRESULT; stdcall;
begin
{*
 0070B024    push        ebp
 0070B025    mov         ebp,esp
 0070B027    mov         eax,dword ptr [ebp+8]
 0070B02A    mov         eax,dword ptr [eax+294]
 0070B030    push        eax
 0070B031    mov         eax,dword ptr [eax]
 0070B033    call        dword ptr [eax+18]
 0070B036    xor         eax,eax
 0070B038    pop         ebp
 0070B039    ret         4
*}
end;

//0070B03C
function TOleControl.OnPosRectChange(const rcPosRect:TRect):HRESULT; stdcall;
begin
{*
 0070B03C    push        ebp
 0070B03D    mov         ebp,esp
 0070B03F    add         esp,0FFFFFFF0
 0070B042    push        ebx
 0070B043    mov         ebx,dword ptr [ebp+8]
 0070B046    push        7FFF
 0070B04B    lea         eax,[ebp-10]
 0070B04E    push        eax
 0070B04F    mov         ecx,7FFF
 0070B054    xor         edx,edx
 0070B056    xor         eax,eax
 0070B058    call        Rect
 0070B05D    lea         eax,[ebp-10]
 0070B060    push        eax
 0070B061    mov         eax,dword ptr [ebp+0C]
 0070B064    push        eax
 0070B065    mov         eax,dword ptr [ebx+294]
 0070B06B    push        eax
 0070B06C    mov         eax,dword ptr [eax]
 0070B06E    call        dword ptr [eax+1C]
 0070B071    xor         eax,eax
 0070B073    pop         ebx
 0070B074    mov         esp,ebp
 0070B076    pop         ebp
 0070B077    ret         8
*}
end;

//0070B07C
function TOleControl.GetBorder(var rectBorder:TRect):HRESULT; stdcall;
begin
{*
 0070B07C    push        ebp
 0070B07D    mov         ebp,esp
 0070B07F    mov         eax,800401A1
 0070B084    pop         ebp
 0070B085    ret         8
*}
end;

//0070B088
function TOleControl.RequestBorderSpace(const borderwidths:TRect):HRESULT; stdcall;
begin
{*
 0070B088    push        ebp
 0070B089    mov         ebp,esp
 0070B08B    mov         eax,800401A1
 0070B090    pop         ebp
 0070B091    ret         8
*}
end;

//0070B094
function TOleControl.SetBorderSpace(pborderwidths:PRect):HRESULT; stdcall;
begin
{*
 0070B094    push        ebp
 0070B095    mov         ebp,esp
 0070B097    mov         eax,80004001
 0070B09C    pop         ebp
 0070B09D    ret         8
*}
end;

//0070B0A0
function TOleControl.SetActiveObject(const activeObject:IOleInPlaceActiveObject; pszObjName:POleStr):HRESULT; stdcall;
begin
{*
 0070B0A0    push        ebp
 0070B0A1    mov         ebp,esp
 0070B0A3    xor         eax,eax
 0070B0A5    pop         ebp
 0070B0A6    ret         0C
*}
end;

//0070B0AC
function TOleControl.OleInPlaceFrame_GetWindow(var wnd:HWND):HRESULT; stdcall;
begin
{*
 0070B0AC    push        ebp
 0070B0AD    mov         ebp,esp
 0070B0AF    push        ebx
 0070B0B0    mov         ebx,dword ptr [ebp+8]
 0070B0B3    mov         eax,ebx
 0070B0B5    call        TWinControl.GetTopParentHandle
 0070B0BA    mov         edx,dword ptr [ebp+0C]
 0070B0BD    mov         dword ptr [edx],eax
 0070B0BF    xor         eax,eax
 0070B0C1    pop         ebx
 0070B0C2    pop         ebp
 0070B0C3    ret         8
*}
end;

//0070B0C8
function TOleControl.InsertMenus(hmenuShared:HMENU; var menuWidths:TOleMenuGroupWidths):HRESULT; stdcall;
begin
{*
 0070B0C8    push        ebp
 0070B0C9    mov         ebp,esp
 0070B0CB    add         esp,0FFFFFFF4
 0070B0CE    mov         eax,dword ptr [ebp+8]
 0070B0D1    call        TOleControl.GetMainMenu
 0070B0D6    test        eax,eax
>0070B0D8    je          0070B100
 0070B0DA    push        2
 0070B0DC    mov         edx,dword ptr [ebp+10]
 0070B0DF    push        edx
 0070B0E0    push        5
 0070B0E2    xor         edx,edx
 0070B0E4    mov         dword ptr [ebp-0C],edx
 0070B0E7    mov         dword ptr [ebp-8],2
 0070B0EE    mov         dword ptr [ebp-4],4
 0070B0F5    lea         ecx,[ebp-0C]
 0070B0F8    mov         edx,dword ptr [ebp+0C]
 0070B0FB    call        TMainMenu.PopulateOle2Menu
 0070B100    xor         eax,eax
 0070B102    mov         esp,ebp
 0070B104    pop         ebp
 0070B105    ret         0C
*}
end;

//0070B108
function TOleControl.SetMenu(hmenuShared:HMENU; holemenu:HMENU; hwndActiveObject:HWND):HRESULT; stdcall;
begin
{*
 0070B108    push        ebp
 0070B109    mov         ebp,esp
 0070B10B    push        ebx
 0070B10C    mov         eax,dword ptr [ebp+8]
 0070B10F    call        TOleControl.GetMainMenu
 0070B114    mov         ebx,eax
 0070B116    xor         eax,eax
 0070B118    test        ebx,ebx
>0070B11A    je          0070B13B
 0070B11C    mov         edx,dword ptr [ebp+0C]
 0070B11F    mov         eax,ebx
 0070B121    call        TMainMenu.SetOle2MenuHandle
 0070B126    push        0
 0070B128    push        0
 0070B12A    mov         eax,dword ptr [ebp+14]
 0070B12D    push        eax
 0070B12E    mov         eax,dword ptr [ebx+3C]
 0070B131    push        eax
 0070B132    mov         eax,dword ptr [ebp+10]
 0070B135    push        eax
 0070B136    call        ole32.OleSetMenuDescriptor
 0070B13B    pop         ebx
 0070B13C    pop         ebp
 0070B13D    ret         10
*}
end;

//0070B140
function TOleControl.RemoveMenus(hmenuShared:HMENU):HRESULT; stdcall;
begin
{*
 0070B140    push        ebp
 0070B141    mov         ebp,esp
 0070B143    push        ebx
 0070B144    mov         ebx,dword ptr [ebp+0C]
>0070B147    jmp         0070B156
 0070B149    push        400
 0070B14E    push        0
 0070B150    push        ebx
 0070B151    call        user32.RemoveMenu
 0070B156    push        ebx
 0070B157    call        user32.GetMenuItemCount
 0070B15C    test        eax,eax
>0070B15E    jg          0070B149
 0070B160    xor         eax,eax
 0070B162    pop         ebx
 0070B163    pop         ebp
 0070B164    ret         8
*}
end;

//0070B168
function TOleControl.OnRequestEdit(dispid:TDispID):HRESULT; stdcall;
begin
{*
 0070B168    push        ebp
 0070B169    mov         ebp,esp
 0070B16B    xor         eax,eax
 0070B16D    pop         ebp
 0070B16E    ret         8
*}
end;

//0070B174
function TOleControl.OnShowWindow(fShow:BOOL):HRESULT; stdcall;
begin
{*
 0070B174    push        ebp
 0070B175    mov         ebp,esp
 0070B177    xor         eax,eax
 0070B179    pop         ebp
 0070B17A    ret         8
*}
end;

//0070B180
function TOleControl.OleInPlaceFrame_TranslateAccelerator(var msg:TMsg; wID:Word):HRESULT; stdcall;
begin
{*
 0070B180    push        ebp
 0070B181    mov         ebp,esp
 0070B183    mov         eax,1
 0070B188    pop         ebp
 0070B189    ret         0C
*}
end;

//0070B18C
function TOleControl.GetTypeInfoCount(var Count:Integer):HRESULT; stdcall;
begin
{*
 0070B18C    push        ebp
 0070B18D    mov         ebp,esp
 0070B18F    mov         eax,dword ptr [ebp+0C]
 0070B192    xor         edx,edx
 0070B194    mov         dword ptr [eax],edx
 0070B196    xor         eax,eax
 0070B198    pop         ebp
 0070B199    ret         8
*}
end;

//0070B19C
function TOleControl.GetTypeInfo(Index:Integer; LocaleID:Integer; var TypeInfo:void ):HRESULT; stdcall;
begin
{*
 0070B19C    push        ebp
 0070B19D    mov         ebp,esp
 0070B19F    mov         eax,dword ptr [ebp+14]
 0070B1A2    xor         edx,edx
 0070B1A4    mov         dword ptr [eax],edx
 0070B1A6    mov         eax,80004001
 0070B1AB    pop         ebp
 0070B1AC    ret         10
*}
end;

//0070B1B0
function TOleControl.GetIDsOfNames(const IID:TGUID; Names:Pointer; NameCount:Integer; LocaleID:Integer; DispIDs:Pointer):HRESULT; stdcall;
begin
{*
 0070B1B0    push        ebp
 0070B1B1    mov         ebp,esp
 0070B1B3    mov         eax,80004001
 0070B1B8    pop         ebp
 0070B1B9    ret         18
*}
end;

//0070B1BC
function TOleControl.Invoke(DispID:Integer; const IID:TGUID; LocaleID:Integer; Flags:Word; var Params:void ; VarResult:Pointer; ExcepInfo:Pointer; ArgErr:Pointer):HRESULT; stdcall;
begin
{*
 0070B1BC    push        ebp
 0070B1BD    mov         ebp,esp
 0070B1BF    xor         ecx,ecx
 0070B1C1    push        ecx
 0070B1C2    push        ecx
 0070B1C3    push        ecx
 0070B1C4    push        ecx
 0070B1C5    push        ecx
 0070B1C6    push        ecx
 0070B1C7    push        ecx
 0070B1C8    push        ecx
 0070B1C9    push        ebx
 0070B1CA    push        esi
 0070B1CB    push        edi
 0070B1CC    mov         ebx,dword ptr [ebp+20]
 0070B1CF    mov         esi,dword ptr [ebp+8]
 0070B1D2    xor         eax,eax
 0070B1D4    push        ebp
 0070B1D5    push        70B34B
 0070B1DA    push        dword ptr fs:[eax]
 0070B1DD    mov         dword ptr fs:[eax],esp
 0070B1E0    test        byte ptr [ebp+18],2
>0070B1E4    je          0070B325
 0070B1EA    test        ebx,ebx
>0070B1EC    je          0070B325
 0070B1F2    xor         edi,edi
 0070B1F4    mov         eax,dword ptr [ebp+0C]
 0070B1F7    add         eax,2CB
 0070B1FC    cmp         eax,0E
>0070B1FF    ja          0070B31E
 0070B205    jmp         dword ptr [eax*4+70B20C]
 0070B205    dd          0070B313
 0070B205    dd          0070B308
 0070B205    dd          0070B31E
 0070B205    dd          0070B2FD
 0070B205    dd          0070B2F2
 0070B205    dd          0070B2E2
 0070B205    dd          0070B2CF
 0070B205    dd          0070B31E
 0070B205    dd          0070B31E
 0070B205    dd          0070B2C4
 0070B205    dd          0070B2B2
 0070B205    dd          0070B2A1
 0070B205    dd          0070B273
 0070B205    dd          0070B259
 0070B205    dd          0070B248
 0070B248    mov         eax,ebx
 0070B24A    mov         edx,dword ptr [esi+6C]
 0070B24D    mov         cl,0FC
 0070B24F    call        @VarFromInt
>0070B254    jmp         0070B32A
 0070B259    lea         edx,[ebp-10]
 0070B25C    mov         eax,dword ptr [esi+8]
 0070B25F    call        StringToVarOleStr
 0070B264    lea         edx,[ebp-10]
 0070B267    mov         eax,ebx
 0070B269    call        @VarCopy
>0070B26E    jmp         0070B32A
 0070B273    mov         eax,dword ptr [esi+34]
 0070B276    test        eax,eax
>0070B278    je          0070B285
 0070B27A    cmp         byte ptr [esi+5B],0
>0070B27E    je          0070B285
 0070B280    mov         esi,dword ptr [eax+64]
>0070B283    jmp         0070B288
 0070B285    mov         esi,dword ptr [esi+64]
 0070B288    lea         edx,[ebp-20]
 0070B28B    mov         eax,esi
 0070B28D    call        FontToOleFont
 0070B292    lea         edx,[ebp-20]
 0070B295    mov         eax,ebx
 0070B297    call        @VarCopy
>0070B29C    jmp         0070B32A
 0070B2A1    mov         eax,ebx
 0070B2A3    mov         edx,dword ptr [esi+64]
 0070B2A6    mov         edx,dword ptr [edx+18]
 0070B2A9    mov         cl,0FC
 0070B2AB    call        @VarFromInt
>0070B2B0    jmp         0070B32A
 0070B2B2    call        kernel32.GetUserDefaultLCID
 0070B2B7    mov         edx,eax
 0070B2B9    mov         eax,ebx
 0070B2BB    mov         cl,0FC
 0070B2BD    call        @VarFromInt
>0070B2C2    jmp         0070B32A
 0070B2C4    mov         eax,ebx
 0070B2C6    mov         dl,1
 0070B2C8    call        @VarFromBool
>0070B2CD    jmp         0070B32A
 0070B2CF    mov         eax,ebx
 0070B2D1    test        byte ptr [esi+1C],10
 0070B2D5    setne       dl
 0070B2D8    xor         dl,1
 0070B2DB    call        @VarFromBool
>0070B2E0    jmp         0070B32A
 0070B2E2    mov         eax,ebx
 0070B2E4    test        byte ptr [esi+1C],10
 0070B2E8    setne       dl
 0070B2EB    call        @VarFromBool
>0070B2F0    jmp         0070B32A
 0070B2F2    mov         eax,ebx
 0070B2F4    xor         edx,edx
 0070B2F6    call        @VarFromBool
>0070B2FB    jmp         0070B32A
 0070B2FD    mov         eax,ebx
 0070B2FF    xor         edx,edx
 0070B301    call        @VarFromBool
>0070B306    jmp         0070B32A
 0070B308    mov         eax,ebx
 0070B30A    mov         dl,1
 0070B30C    call        @VarFromBool
>0070B311    jmp         0070B32A
 0070B313    mov         eax,ebx
 0070B315    mov         dl,1
 0070B317    call        @VarFromBool
>0070B31C    jmp         0070B32A
 0070B31E    mov         edi,80020003
>0070B323    jmp         0070B32A
 0070B325    mov         edi,80020003
 0070B32A    xor         eax,eax
 0070B32C    pop         edx
 0070B32D    pop         ecx
 0070B32E    pop         ecx
 0070B32F    mov         dword ptr fs:[eax],edx
 0070B332    push        70B352
 0070B337    lea         eax,[ebp-20]
 0070B33A    mov         edx,dword ptr ds:[4012C4];Variant
 0070B340    mov         ecx,2
 0070B345    call        @FinalizeArray
 0070B34A    ret
>0070B34B    jmp         @HandleFinally
>0070B350    jmp         0070B337
 0070B352    mov         eax,edi
 0070B354    pop         edi
 0070B355    pop         esi
 0070B356    pop         ebx
 0070B357    mov         esp,ebp
 0070B359    pop         ebp
 0070B35A    ret         24
*}
end;

//0070B360
{*function sub_0070B360(?:?):?;
begin
 0070B360    push        ebp
 0070B361    mov         ebp,esp
 0070B363    xor         ecx,ecx
 0070B365    push        ecx
 0070B366    push        ecx
 0070B367    push        ecx
 0070B368    push        ecx
 0070B369    push        ebx
 0070B36A    push        esi
 0070B36B    push        edi
 0070B36C    xor         eax,eax
 0070B36E    push        ebp
 0070B36F    push        70B564
 0070B374    push        dword ptr fs:[eax]
 0070B377    mov         dword ptr fs:[eax],esp
 0070B37A    xor         eax,eax
 0070B37C    push        ebp
 0070B37D    push        70B536
 0070B382    push        dword ptr fs:[eax]
 0070B385    mov         dword ptr fs:[eax],esp
 0070B388    mov         eax,dword ptr [ebp+0C]
 0070B38B    sub         eax,0FFFFFDFE
>0070B390    je          0070B407
 0070B392    dec         eax
>0070B393    je          0070B4CF
 0070B399    dec         eax
>0070B39A    je          0070B46A
 0070B3A0    sub         eax,0B
>0070B3A3    jne         0070B52C
 0070B3A9    mov         eax,dword ptr [ebp+8]
 0070B3AC    cmp         byte ptr [eax+2B1],0
>0070B3B3    jne         0070B52C
 0070B3B9    mov         eax,dword ptr [ebp+8]
 0070B3BC    mov         byte ptr [eax+2B1],1
 0070B3C3    xor         eax,eax
 0070B3C5    push        ebp
 0070B3C6    push        70B400
 0070B3CB    push        dword ptr fs:[eax]
 0070B3CE    mov         dword ptr fs:[eax],esp
 0070B3D1    mov         edx,0FFFFFE0B
 0070B3D6    mov         eax,dword ptr [ebp+8]
 0070B3D9    call        TOleControl.GetIntegerProp
 0070B3DE    mov         edx,eax
 0070B3E0    mov         eax,dword ptr [ebp+8]
 0070B3E3    call        TControl.SetColor
 0070B3E8    xor         eax,eax
 0070B3EA    pop         edx
 0070B3EB    pop         ecx
 0070B3EC    pop         ecx
 0070B3ED    mov         dword ptr fs:[eax],edx
 0070B3F0    push        70B52C
 0070B3F5    mov         eax,dword ptr [ebp+8]
 0070B3F8    mov         byte ptr [eax+2B1],0
 0070B3FF    ret
>0070B400    jmp         @HandleFinally
>0070B405    jmp         0070B3F5
 0070B407    mov         eax,dword ptr [ebp+8]
 0070B40A    cmp         byte ptr [eax+2B3],0
>0070B411    jne         0070B52C
 0070B417    mov         eax,dword ptr [ebp+8]
 0070B41A    mov         byte ptr [eax+2B3],1
 0070B421    xor         eax,eax
 0070B423    push        ebp
 0070B424    push        70B463
 0070B429    push        dword ptr fs:[eax]
 0070B42C    mov         dword ptr fs:[eax],esp
 0070B42F    mov         edx,0FFFFFDFE
 0070B434    mov         eax,dword ptr [ebp+8]
 0070B437    call        TOleControl.GetOleBoolProp
 0070B43C    cmp         ax,1
 0070B440    sbb         edx,edx
 0070B442    inc         edx
 0070B443    mov         eax,dword ptr [ebp+8]
 0070B446    mov         ecx,dword ptr [eax]
 0070B448    call        dword ptr [ecx+74]
 0070B44B    xor         eax,eax
 0070B44D    pop         edx
 0070B44E    pop         ecx
 0070B44F    pop         ecx
 0070B450    mov         dword ptr fs:[eax],edx
 0070B453    push        70B52C
 0070B458    mov         eax,dword ptr [ebp+8]
 0070B45B    mov         byte ptr [eax+2B3],0
 0070B462    ret
>0070B463    jmp         @HandleFinally
>0070B468    jmp         0070B458
 0070B46A    mov         eax,dword ptr [ebp+8]
 0070B46D    cmp         byte ptr [eax+2B2],0
>0070B474    jne         0070B52C
 0070B47A    mov         eax,dword ptr [ebp+8]
 0070B47D    mov         byte ptr [eax+2B2],1
 0070B484    xor         eax,eax
 0070B486    push        ebp
 0070B487    push        70B4C8
 0070B48C    push        dword ptr fs:[eax]
 0070B48F    mov         dword ptr fs:[eax],esp
 0070B492    lea         ecx,[ebp-10]
 0070B495    mov         edx,0FFFFFE00
 0070B49A    mov         eax,dword ptr [ebp+8]
 0070B49D    call        TOleControl.GetVariantProp
 0070B4A2    lea         eax,[ebp-10]
 0070B4A5    mov         edx,dword ptr [ebp+8]
 0070B4A8    mov         edx,dword ptr [edx+64]
 0070B4AB    call        OleFontToFont
 0070B4B0    xor         eax,eax
 0070B4B2    pop         edx
 0070B4B3    pop         ecx
 0070B4B4    pop         ecx
 0070B4B5    mov         dword ptr fs:[eax],edx
 0070B4B8    push        70B52C
 0070B4BD    mov         eax,dword ptr [ebp+8]
 0070B4C0    mov         byte ptr [eax+2B2],0
 0070B4C7    ret
>0070B4C8    jmp         @HandleFinally
>0070B4CD    jmp         0070B4BD
 0070B4CF    mov         eax,dword ptr [ebp+8]
 0070B4D2    cmp         byte ptr [eax+2B2],0
>0070B4D9    jne         0070B52C
 0070B4DB    mov         eax,dword ptr [ebp+8]
 0070B4DE    mov         byte ptr [eax+2B2],1
 0070B4E5    xor         eax,eax
 0070B4E7    push        ebp
 0070B4E8    push        70B525
 0070B4ED    push        dword ptr fs:[eax]
 0070B4F0    mov         dword ptr fs:[eax],esp
 0070B4F3    mov         edx,0FFFFFDFF
 0070B4F8    mov         eax,dword ptr [ebp+8]
 0070B4FB    call        TOleControl.GetIntegerProp
 0070B500    mov         edx,eax
 0070B502    mov         eax,dword ptr [ebp+8]
 0070B505    mov         eax,dword ptr [eax+64]
 0070B508    call        TFont.SetColor
 0070B50D    xor         eax,eax
 0070B50F    pop         edx
 0070B510    pop         ecx
 0070B511    pop         ecx
 0070B512    mov         dword ptr fs:[eax],edx
 0070B515    push        70B52C
 0070B51A    mov         eax,dword ptr [ebp+8]
 0070B51D    mov         byte ptr [eax+2B2],0
 0070B524    ret
>0070B525    jmp         @HandleFinally
>0070B52A    jmp         0070B51A
 0070B52C    xor         eax,eax
 0070B52E    pop         edx
 0070B52F    pop         ecx
 0070B530    pop         ecx
 0070B531    mov         dword ptr fs:[eax],edx
>0070B534    jmp         0070B54C
>0070B536    jmp         @HandleOnException
 0070B53B    dd          1
 0070B53F    dd          0052E700;EOleError
 0070B543    dd          0070B547
 0070B547    call        @DoneExcept
 0070B54C    xor         ebx,ebx
 0070B54E    xor         eax,eax
 0070B550    pop         edx
 0070B551    pop         ecx
 0070B552    pop         ecx
 0070B553    mov         dword ptr fs:[eax],edx
 0070B556    push        70B56B
 0070B55B    lea         eax,[ebp-10]
 0070B55E    call        @VarClr
 0070B563    ret
>0070B564    jmp         @HandleFinally
>0070B569    jmp         0070B55B
 0070B56B    mov         eax,ebx
 0070B56D    pop         edi
 0070B56E    pop         esi
 0070B56F    pop         ebx
 0070B570    mov         esp,ebp
 0070B572    pop         ebp
 0070B573    ret         8
end;*}

//0070B578
function TOleControl.SetStatusText(pszStatusText:POleStr):HRESULT; stdcall;
begin
{*
 0070B578    push        ebp
 0070B579    mov         ebp,esp
 0070B57B    xor         eax,eax
 0070B57D    pop         ebp
 0070B57E    ret         8
*}
end;

//0070B584
function TOleControl.PostMessageFilter(wnd:HWND; msg:Integer; wp:Integer; lp:Integer; var res:Integer; Cookie:LongInt):HRESULT; stdcall;
begin
{*
 0070B584    push        ebp
 0070B585    mov         ebp,esp
 0070B587    xor         eax,eax
 0070B589    pop         ebp
 0070B58A    ret         1C
*}
end;

//0070B590
function TOleControl.PreMessageFilter(wnd:HWND; msg:Integer; wp:Integer; lp:Integer; var res:Integer; var Cookie:LongInt):HRESULT; stdcall;
begin
{*
 0070B590    push        ebp
 0070B591    mov         ebp,esp
 0070B593    xor         eax,eax
 0070B595    pop         ebp
 0070B596    ret         1C
*}
end;

//0070B59C
function TOleControl.QueryService(const rsid:TGUID; const iid:TGUID; var obj:void ):HRESULT; stdcall;
begin
{*
 0070B59C    push        ebp
 0070B59D    mov         ebp,esp
 0070B59F    push        ebx
 0070B5A0    mov         eax,dword ptr [ebp+8]
 0070B5A3    cmp         word ptr [eax+2BA],0
>0070B5AB    je          0070B5C7
 0070B5AD    mov         edx,dword ptr [ebp+14]
 0070B5B0    push        edx
 0070B5B1    mov         ecx,dword ptr [ebp+10]
 0070B5B4    mov         edx,dword ptr [ebp+0C]
 0070B5B7    mov         ebx,eax
 0070B5B9    mov         eax,dword ptr [ebx+2BC]
 0070B5BF    call        dword ptr [ebx+2B8]
>0070B5C5    jmp         0070B5CC
 0070B5C7    mov         eax,80004001
 0070B5CC    pop         ebx
 0070B5CD    pop         ebp
 0070B5CE    ret         10
*}
end;

Initialization
//00782E18
{*
 00782E18    sub         dword ptr ds:[8229E4],1
>00782E1F    jae         00782E31
 00782E21    mov         edx,dword ptr ds:[47A16C];TControl
 00782E27    mov         eax,[00706D20];TOleControl
 00782E2C    call        GroupDescendentsWith
 00782E31    ret
*}
Finalization
end.