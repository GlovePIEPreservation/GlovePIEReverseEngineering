//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit20;

interface

uses
  SysUtils, Classes;

type
  TObjectList = class(TList)
  published
    function FindInstanceOf(AClass:TClass; AExact:Boolean; AStartAt:Integer):Integer;//0047219C
    procedure IndexOfItem(AObject:TObject; ADirection:TList.TDirection);//00472250
    procedure IndexOf(AObject:TObject);//00472248
    function Last:TObject;//00472260
    function First:TObject;//00472224
    procedure Insert(Index:Integer; AObject:TObject);//00472258
    procedure RemoveItem(AObject:TObject; ADirection:TList.TDirection);//004722A0
    procedure Add(AObject:TObject);//004720E8
    constructor Create;//0047212C
    constructor Create();//004720F0
    function Remove(AObject:TObject):Integer;//00472298
    procedure ExtractItem(Item:TObject; Direction:TList.TDirection);//00472184
    procedure Extract(Item:TObject);//00472170
  public
    ..FOwnsObjects:Boolean;//f10
    procedure Notify(Ptr:Pointer; Action:TListNotification); virtual;//v4//0047226C
    function GetItem(Index:Integer):TObject;//00472234
  end;
  TComponentList = class(TObjectList)
  published
    procedure IndexOfItem(AComponent:TComponent; ADirection:TList.TDirection);//0047250C
    procedure IndexOf(AComponent:TComponent);//00472504
    function First:TComponent;//004724E0
    procedure Insert(Index:Integer; AComponent:TComponent);//00472514
    function Last:TComponent;//0047251C
    procedure RemoveItem(AComponent:TComponent; ADirection:TList.TDirection);//00472598
    procedure Add(AComponent:TComponent);//0047247C
    destructor Destroy();//00472484
    procedure Extract(Item:TComponent);//004724B4
    function Remove(AComponent:TComponent):Integer;//00472590
    procedure ExtractItem(Item:TComponent; Direction:TList.TDirection);//004724C8
  public
    FNexus:TComponent;//f14
    destructor Destroy(); virtual;//00472484
    procedure Notify(Ptr:Pointer; Action:TListNotification); virtual;//v4//00472528
    procedure HandleFreeNotify(Sender:TObject; AComponent:TComponent);//004724F0
  end;
  TOrderedList = class(TObject)
  published
    function Push(AItem:Pointer):Pointer;//004725BC
    procedure Pop;//004725B4
    procedure Peek;//004725AC
    function AtLeast(ACount:Integer):Boolean;//004725A0
    constructor Create();//004725D4
    destructor Destroy();//00472618
    function Count:Integer;//004725CC
  public
    ..FList:TList;//f4
    destructor Destroy(); virtual;//00472618
    procedure PushItem; virtual; abstract;//v0//00404A58
    function PopItem:Pointer; virtual;//v4//0047265C
    function PeekItem:Pointer; virtual;//v8//00472648
  end;
  TStack = class(TOrderedList)
  public
    procedure PushItem(AItem:Pointer); virtual;//v0//0047267C
  end;
  TComponentListNexusEvent = procedure(Sender:TObject; AComponent:TComponent) of object;;
  TComponentListNexus = class(TComponent)
  public
    FOnFreeNotify:TComponentListNexusEvent;//f38
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0047244C
  end;
  _TBBUTTON = _TBBUTTON = record//size=14
iBitmap:Integer;//f0
idCommand:Integer;//f4
fsState:Byte;//f8
fsStyle:Byte;//f9
bReserved:?;//fA
dwData:Integer;//fC
iString:Integer;//f10
end;;
  TASKDIALOG_BUTTON = TASKDIALOG_BUTTON = record//size=8
nButtonID:Integer;//f0
pszButtonText:PWideChar;//f4
end;;
  _MARGINS = _MARGINS = record//size=10
cxLeftWidth:Integer;//f0
cxRightWidth:Integer;//f4
cyTopHeight:Integer;//f8
cyBottomHeight:Integer;//fC
end;;
    procedure Notify(Ptr:Pointer; Action:TListNotification);//0047226C
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0047244C
    procedure Notify(Ptr:Pointer; Action:TListNotification);//00472528
    function PeekItem:Pointer;//00472648
    function PopItem:Pointer;//0047265C
    procedure PushItem(AItem:Pointer);//0047267C
    function InitCommonControls:Boolean;//004727A4
    procedure InitComCtl;//004727AC
    function InitCommonControlsEx(var ICC:tagINITCOMMONCONTROLSEX):BOOL;//0047282C
    function ImageList_Create(CY:Integer; Flags:UINT; Initial:Integer; Grow:Integer):THandle; stdcall;//00472860
    function ImageList_Destroy:BOOL; stdcall;//00472868
    function ImageList_GetImageCount:Integer; stdcall;//00472870
    function ImageList_SetImageCount(uNewCount:UINT):Integer; stdcall;//00472878
    function ImageList_Add(Image:HBITMAP; Mask:HBITMAP):Integer; stdcall;//00472880
    function ImageList_ReplaceIcon(Index:Integer; Icon:HICON):Integer; stdcall;//00472888
    function ImageList_SetBkColor(ClrBk:TColorRef):TColorRef; stdcall;//00472890
    function ImageList_GetBkColor:TColorRef; stdcall;//00472898
    function ImageList_SetOverlayImage(Image:Integer; Overlay:Integer):BOOL; stdcall;//004728A0
    function ImageList_Draw(Index:Integer; Dest:HDC; X:Integer; Y:Integer; Style:UINT):BOOL; stdcall;//004728A8
    function ImageList_Replace(Index:Integer; Image:HBITMAP; Mask:HBITMAP):BOOL; stdcall;//004728B0
    function ImageList_DrawEx(Index:Integer; Dest:HDC; X:Integer; Y:Integer; DX:Integer; DY:Integer; Bk:TColorRef; Fg:TColorRef; Style:Cardinal):BOOL; stdcall;//004728B8
    function ImageList_Remove(Index:Integer):BOOL; stdcall;//004728C0
    function ImageList_GetIcon(Index:Integer; Flags:Cardinal):HICON; stdcall;//004728C8
    function ImageList_LoadImageW(Bmp:PWideChar; CX:Integer; Grow:Integer; Mask:TColorRef; pType:Cardinal; Flags:Cardinal):THandle; stdcall;//004728D0
    function ImageList_Copy(iDst:Integer; himlSrc:THandle; Src:Integer; uFlags:UINT):Integer; stdcall;//004728D8
    function ImageList_BeginDrag(Track:Integer; XHotSpot:Integer; YHotSpot:Integer):BOOL; stdcall;//004728E0
    function ImageList_EndDrag:BOOL;//004728E8
    function ImageList_DragEnter(X:Integer; Y:Integer):BOOL; stdcall;//004728F0
    function ImageList_DragLeave:BOOL; stdcall;//004728F8
    function ImageList_DragMove(Y:Integer):BOOL; stdcall;//00472900
    function ImageList_DragShowNolock:BOOL; stdcall;//00472908
    function ImageList_GetDragImage(HotSpot:PPoint):THandle; stdcall;//00472910
    function ImageList_Read:THandle; stdcall;//00472918
    function ImageList_Write(Stream:IStream):BOOL; stdcall;//00472920
    function ImageList_GetIconSize(var CX:Integer; var CY:Integer):BOOL; stdcall;//00472928
    function ImageList_SetIconSize(CX:Integer; CY:Integer):BOOL; stdcall;//00472930
    function ImageList_GetImageInfo(Index:Integer; var ImageInfo:_IMAGEINFO):BOOL; stdcall;//00472938
    function _TrackMouseEvent:BOOL; stdcall;//00472940
    function FlatSB_GetScrollInfo(BarFlag:Integer; var ScrollInfo:TScrollInfo):BOOL; stdcall;//00472948
    function FlatSB_GetScrollPos(nBar:Integer):Integer; stdcall;//00472950
    function FlatSB_SetScrollInfo(BarFlag:Integer; const ScrollInfo:TScrollInfo; Redraw:BOOL):Integer; stdcall;//00472958
    function FlatSB_SetScrollPos(nBar:Integer; nPos:Integer; bRedraw:BOOL):Integer; stdcall;//00472960
    function FlatSB_SetScrollProp(index:Integer; newValue:Integer; p4:BOOL):BOOL; stdcall;//00472968
    function InitializeFlatSB:BOOL; stdcall;//00472970
    function TaskDialogIndirect(const pTaskConfig:TASKDIALOGCONFIG; pnButton:PInteger; pnRadioButton:PInteger; pfVerificationFlagChecked:PBOOL):HRESULT;//00472978
    procedure dll;//00472AAC
    procedure $thunk_BeginBufferedAnimation;//00472ABC
    function DrawThemeTextEx(hTheme:THandle; hdc:HDC; iPartId:Integer; iStateId:Integer; pszText:LPCWSTR; cchText:Integer; dwTextFlags:DWORD; pRect:PRect; var pOptions:DTTOPTS):HRESULT; stdcall;//00472ACC
    procedure $thunk_BeginBufferedPaint;//00472AD4
    function BeginBufferedPaint(hdcTarget:HDC; const prcTarget:TRect; dwFormat:DWORD; pPaintParams:PBPPaintParams; var phdc:HDC):THandle; stdcall;//00472AE4
    procedure $thunk_BeginPanningFeedback;//00472AEC
    function EndBufferedPaint(hBufferedPaint:THandle; fUpdateTarget:BOOL):HRESULT; stdcall;//00472AFC
    procedure $thunk_BufferedPaintClear;//00472B04
    function BufferedPaintSetAlpha(hBufferedPaint:THandle; prc:PRect; alpha:Byte):HRESULT; stdcall;//00472B14
    procedure FreeThemeLibrary;//00472B1C
    function InitThemeLibrary:Boolean;//00472CDC
    function UseThemes:Boolean;//004737B0

implementation

//004720E8
procedure TObjectList.Add(AObject:TObject);
begin
{*
 004720E8    call        TList.Add
 004720ED    ret
*}
end;

//004720F0
constructor TObjectList.Create();
begin
{*
 004720F0    push        ebx
 004720F1    push        esi
 004720F2    test        dl,dl
>004720F4    je          004720FE
 004720F6    add         esp,0FFFFFFF0
 004720F9    call        @ClassCreate
 004720FE    mov         ebx,edx
 00472100    mov         esi,eax
 00472102    xor         edx,edx
 00472104    mov         eax,esi
 00472106    call        TObject.Create
 0047210B    mov         byte ptr [esi+10],1
 0047210F    mov         eax,esi
 00472111    test        bl,bl
>00472113    je          00472124
 00472115    call        @AfterConstruction
 0047211A    pop         dword ptr fs:[0]
 00472121    add         esp,0C
 00472124    mov         eax,esi
 00472126    pop         esi
 00472127    pop         ebx
 00472128    ret
*}
end;

//0047212C
constructor TObjectList.Create;
begin
{*
 0047212C    push        ebp
 0047212D    mov         ebp,esp
 0047212F    push        ecx
 00472130    push        ebx
 00472131    push        esi
 00472132    test        dl,dl
>00472134    je          0047213E
 00472136    add         esp,0FFFFFFF0
 00472139    call        @ClassCreate
 0047213E    mov         ebx,ecx
 00472140    mov         byte ptr [ebp-1],dl
 00472143    mov         esi,eax
 00472145    xor         edx,edx
 00472147    mov         eax,esi
 00472149    call        TObject.Create
 0047214E    mov         byte ptr [esi+10],bl
 00472151    mov         eax,esi
 00472153    cmp         byte ptr [ebp-1],0
>00472157    je          00472168
 00472159    call        @AfterConstruction
 0047215E    pop         dword ptr fs:[0]
 00472165    add         esp,0C
 00472168    mov         eax,esi
 0047216A    pop         esi
 0047216B    pop         ebx
 0047216C    pop         ecx
 0047216D    pop         ebp
 0047216E    ret
*}
end;

//00472170
procedure TObjectList.Extract(Item:TObject);
begin
{*
 00472170    push        ebx
 00472171    push        esi
 00472172    mov         esi,edx
 00472174    mov         ebx,eax
 00472176    mov         edx,esi
 00472178    mov         eax,ebx
 0047217A    xor         ecx,ecx
 0047217C    call        TList.ExtractItem
 00472181    pop         esi
 00472182    pop         ebx
 00472183    ret
*}
end;

//00472184
procedure TObjectList.ExtractItem(Item:TObject; Direction:TList.TDirection);
begin
{*
 00472184    push        ebx
 00472185    push        esi
 00472186    push        edi
 00472187    mov         ebx,ecx
 00472189    mov         esi,edx
 0047218B    mov         edi,eax
 0047218D    mov         ecx,ebx
 0047218F    mov         edx,esi
 00472191    mov         eax,edi
 00472193    call        TList.ExtractItem
 00472198    pop         edi
 00472199    pop         esi
 0047219A    pop         ebx
 0047219B    ret
*}
end;

//0047219C
function TObjectList.FindInstanceOf(AClass:TClass; AExact:Boolean; AStartAt:Integer):Integer;
begin
{*
 0047219C    push        ebp
 0047219D    mov         ebp,esp
 0047219F    add         esp,0FFFFFFF4
 004721A2    push        ebx
 004721A3    push        esi
 004721A4    push        edi
 004721A5    mov         byte ptr [ebp-5],cl
 004721A8    mov         dword ptr [ebp-4],edx
 004721AB    mov         edi,eax
 004721AD    mov         dword ptr [ebp-0C],0FFFFFFFF
 004721B4    mov         ebx,dword ptr [ebp+8]
 004721B7    mov         esi,dword ptr [edi+8]
 004721BA    dec         esi
 004721BB    sub         esi,ebx
>004721BD    jl          00472215
 004721BF    inc         esi
 004721C0    cmp         byte ptr [ebp-5],0
>004721C4    je          004721DB
 004721C6    mov         edx,ebx
 004721C8    mov         eax,edi
 004721CA    call        TObjectList.GetItem
 004721CF    mov         eax,dword ptr [eax]
 004721D1    mov         edx,eax
 004721D3    cmp         edx,dword ptr [ebp-4]
 004721D6    sete        al
>004721D9    jmp         004721DD
 004721DB    xor         eax,eax
 004721DD    test        al,al
>004721DF    je          004721E5
 004721E1    mov         al,1
>004721E3    jmp         00472208
 004721E5    cmp         byte ptr [ebp-5],0
>004721E9    jne         00472202
 004721EB    mov         edx,ebx
 004721ED    mov         eax,edi
 004721EF    call        TObjectList.GetItem
 004721F4    mov         eax,dword ptr [eax]
 004721F6    mov         edx,dword ptr [ebp-4]
 004721F9    call        TObject.InheritsFrom
 004721FE    test        al,al
>00472200    jne         00472206
 00472202    xor         eax,eax
>00472204    jmp         00472208
 00472206    mov         al,1
 00472208    test        al,al
>0047220A    je          00472211
 0047220C    mov         dword ptr [ebp-0C],ebx
>0047220F    jmp         00472215
 00472211    inc         ebx
 00472212    dec         esi
>00472213    jne         004721C0
 00472215    mov         eax,dword ptr [ebp-0C]
 00472218    pop         edi
 00472219    pop         esi
 0047221A    pop         ebx
 0047221B    mov         esp,ebp
 0047221D    pop         ebp
 0047221E    ret         4
*}
end;

//00472224
function TObjectList.First:TObject;
begin
{*
 00472224    push        ebx
 00472225    mov         ebx,eax
 00472227    mov         eax,ebx
 00472229    xor         edx,edx
 0047222B    call        TList.Get
 00472230    pop         ebx
 00472231    ret
*}
end;

//00472234
function TObjectList.GetItem(Index:Integer):TObject;
begin
{*
 00472234    push        ebx
 00472235    push        esi
 00472236    mov         esi,edx
 00472238    mov         ebx,eax
 0047223A    mov         edx,esi
 0047223C    mov         eax,ebx
 0047223E    call        TList.Get
 00472243    pop         esi
 00472244    pop         ebx
 00472245    ret
*}
end;

//00472248
procedure TObjectList.IndexOf(AObject:TObject);
begin
{*
 00472248    call        TList.IndexOf
 0047224D    ret
*}
end;

//00472250
procedure TObjectList.IndexOfItem(AObject:TObject; ADirection:TList.TDirection);
begin
{*
 00472250    call        TList.IndexOfItem
 00472255    ret
*}
end;

//00472258
procedure TObjectList.Insert(Index:Integer; AObject:TObject);
begin
{*
 00472258    call        TList.Insert
 0047225D    ret
*}
end;

//00472260
function TObjectList.Last:TObject;
begin
{*
 00472260    push        ebx
 00472261    mov         ebx,eax
 00472263    mov         eax,ebx
 00472265    call        TList.Last
 0047226A    pop         ebx
 0047226B    ret
*}
end;

//0047226C
procedure TObjectList.Notify(Ptr:Pointer; Action:TListNotification);
begin
{*
 0047226C    push        ebx
 0047226D    push        esi
 0047226E    push        edi
 0047226F    mov         ebx,ecx
 00472271    mov         edi,edx
 00472273    mov         esi,eax
 00472275    cmp         bl,2
>00472278    jne         00472287
 0047227A    cmp         byte ptr [esi+10],0
>0047227E    je          00472287
 00472280    mov         eax,edi
 00472282    call        TObject.Free
 00472287    mov         ecx,ebx
 00472289    mov         edx,edi
 0047228B    mov         eax,esi
 0047228D    call        TList.Notify
 00472292    pop         edi
 00472293    pop         esi
 00472294    pop         ebx
 00472295    ret
*}
end;

//00472298
function TObjectList.Remove(AObject:TObject):Integer;
begin
{*
 00472298    xor         ecx,ecx
 0047229A    call        TList.RemoveItem
 0047229F    ret
*}
end;

//004722A0
procedure TObjectList.RemoveItem(AObject:TObject; ADirection:TList.TDirection);
begin
{*
 004722A0    call        TList.RemoveItem
 004722A5    ret
*}
end;

//0047244C
procedure TComponentListNexus.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0047244C    push        ebx
 0047244D    push        esi
 0047244E    push        edi
 0047244F    mov         ebx,ecx
 00472451    mov         edi,edx
 00472453    mov         esi,eax
 00472455    cmp         bl,1
>00472458    jne         0047246B
 0047245A    cmp         word ptr [esi+3A],0
>0047245F    je          0047246B
 00472461    mov         ecx,edi
 00472463    mov         edx,esi
 00472465    mov         eax,dword ptr [esi+3C]
 00472468    call        dword ptr [esi+38]
 0047246B    mov         ecx,ebx
 0047246D    mov         edx,edi
 0047246F    mov         eax,esi
 00472471    call        TComponent.Notification
 00472476    pop         edi
 00472477    pop         esi
 00472478    pop         ebx
 00472479    ret
*}
end;

//0047247C
procedure TComponentList.Add(AComponent:TComponent);
begin
{*
 0047247C    call        TList.Add
 00472481    ret
*}
end;

//00472484
destructor TComponentList.Destroy();
begin
{*
 00472484    push        ebx
 00472485    push        esi
 00472486    call        @BeforeDestruction
 0047248B    mov         ebx,edx
 0047248D    mov         esi,eax
 0047248F    mov         edx,ebx
 00472491    and         dl,0FC
 00472494    mov         eax,esi
 00472496    call        TList.Destroy
 0047249B    mov         eax,dword ptr [esi+14]
 0047249E    call        TObject.Free
 004724A3    test        bl,bl
>004724A5    jle         004724AE
 004724A7    mov         eax,esi
 004724A9    call        @ClassDestroy
 004724AE    pop         esi
 004724AF    pop         ebx
 004724B0    ret
*}
end;

//004724B4
procedure TComponentList.Extract(Item:TComponent);
begin
{*
 004724B4    push        ebx
 004724B5    push        esi
 004724B6    mov         esi,edx
 004724B8    mov         ebx,eax
 004724BA    mov         edx,esi
 004724BC    mov         eax,ebx
 004724BE    xor         ecx,ecx
 004724C0    call        TList.ExtractItem
 004724C5    pop         esi
 004724C6    pop         ebx
 004724C7    ret
*}
end;

//004724C8
procedure TComponentList.ExtractItem(Item:TComponent; Direction:TList.TDirection);
begin
{*
 004724C8    push        ebx
 004724C9    push        esi
 004724CA    push        edi
 004724CB    mov         ebx,ecx
 004724CD    mov         esi,edx
 004724CF    mov         edi,eax
 004724D1    mov         edx,esi
 004724D3    mov         eax,edi
 004724D5    mov         ecx,ebx
 004724D7    call        TList.ExtractItem
 004724DC    pop         edi
 004724DD    pop         esi
 004724DE    pop         ebx
 004724DF    ret
*}
end;

//004724E0
function TComponentList.First:TComponent;
begin
{*
 004724E0    push        ebx
 004724E1    mov         ebx,eax
 004724E3    mov         eax,ebx
 004724E5    xor         edx,edx
 004724E7    call        TList.Get
 004724EC    pop         ebx
 004724ED    ret
*}
end;

//004724F0
procedure TComponentList.HandleFreeNotify(Sender:TObject; AComponent:TComponent);
begin
{*
 004724F0    push        ebx
 004724F1    push        esi
 004724F2    mov         esi,ecx
 004724F4    mov         ebx,eax
 004724F6    mov         edx,esi
 004724F8    mov         eax,ebx
 004724FA    xor         ecx,ecx
 004724FC    call        TList.ExtractItem
 00472501    pop         esi
 00472502    pop         ebx
 00472503    ret
*}
end;

//00472504
procedure TComponentList.IndexOf(AComponent:TComponent);
begin
{*
 00472504    call        TList.IndexOf
 00472509    ret
*}
end;

//0047250C
procedure TComponentList.IndexOfItem(AComponent:TComponent; ADirection:TList.TDirection);
begin
{*
 0047250C    call        TList.IndexOfItem
 00472511    ret
*}
end;

//00472514
procedure TComponentList.Insert(Index:Integer; AComponent:TComponent);
begin
{*
 00472514    call        TList.Insert
 00472519    ret
*}
end;

//0047251C
function TComponentList.Last:TComponent;
begin
{*
 0047251C    push        ebx
 0047251D    mov         ebx,eax
 0047251F    mov         eax,ebx
 00472521    call        TList.Last
 00472526    pop         ebx
 00472527    ret
*}
end;

//00472528
procedure TComponentList.Notify(Ptr:Pointer; Action:TListNotification);
begin
{*
 00472528    push        ebx
 00472529    push        esi
 0047252A    push        edi
 0047252B    push        ebp
 0047252C    mov         ebx,ecx
 0047252E    mov         esi,edx
 00472530    mov         edi,eax
 00472532    cmp         dword ptr [edi+14],0
>00472536    jne         00472555
 00472538    xor         ecx,ecx
 0047253A    mov         dl,1
 0047253C    mov         eax,[00472328];TComponentListNexus
 00472541    call        TComponent.Create
 00472546    mov         ebp,eax
 00472548    mov         dword ptr [edi+14],ebp
 0047254B    mov         dword ptr [ebp+3C],edi
 0047254E    mov         dword ptr [ebp+38],4724F0;TComponentList.HandleFreeNotify
 00472555    mov         eax,ebx
 00472557    sub         al,1
>00472559    jb          00472561
 0047255B    sub         al,2
>0047255D    jb          00472571
>0047255F    jmp         0047257F
 00472561    test        esi,esi
>00472563    je          0047257F
 00472565    mov         edx,dword ptr [edi+14]
 00472568    mov         eax,esi
 0047256A    call        TComponent.FreeNotification
>0047256F    jmp         0047257F
 00472571    test        esi,esi
>00472573    je          0047257F
 00472575    mov         edx,dword ptr [edi+14]
 00472578    mov         eax,esi
 0047257A    call        TComponent.RemoveFreeNotification
 0047257F    mov         ecx,ebx
 00472581    mov         edx,esi
 00472583    mov         eax,edi
 00472585    call        TObjectList.Notify
 0047258A    pop         ebp
 0047258B    pop         edi
 0047258C    pop         esi
 0047258D    pop         ebx
 0047258E    ret
*}
end;

//00472590
function TComponentList.Remove(AComponent:TComponent):Integer;
begin
{*
 00472590    xor         ecx,ecx
 00472592    call        TList.RemoveItem
 00472597    ret
*}
end;

//00472598
procedure TComponentList.RemoveItem(AComponent:TComponent; ADirection:TList.TDirection);
begin
{*
 00472598    call        TList.RemoveItem
 0047259D    ret
*}
end;

//004725A0
function TOrderedList.AtLeast(ACount:Integer):Boolean;
begin
{*
 004725A0    mov         eax,dword ptr [eax+4]
 004725A3    cmp         edx,dword ptr [eax+8]
 004725A6    setle       al
 004725A9    ret
*}
end;

//004725AC
procedure TOrderedList.Peek;
begin
{*
 004725AC    mov         edx,dword ptr [eax]
 004725AE    call        dword ptr [edx+8];TOrderedList.PeekItem
 004725B1    ret
*}
end;

//004725B4
procedure TOrderedList.Pop;
begin
{*
 004725B4    mov         edx,dword ptr [eax]
 004725B6    call        dword ptr [edx+4];TOrderedList.PopItem
 004725B9    ret
*}
end;

//004725BC
function TOrderedList.Push(AItem:Pointer):Pointer;
begin
{*
 004725BC    push        ebx
 004725BD    mov         ebx,edx
 004725BF    mov         edx,ebx
 004725C1    mov         ecx,dword ptr [eax]
 004725C3    call        dword ptr [ecx]
 004725C5    mov         eax,ebx
 004725C7    pop         ebx
 004725C8    ret
*}
end;

//004725CC
function TOrderedList.Count:Integer;
begin
{*
 004725CC    mov         eax,dword ptr [eax+4];TOrderedList....FList:TList
 004725CF    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 004725D2    ret
*}
end;

//004725D4
constructor TOrderedList.Create();
begin
{*
 004725D4    push        ebx
 004725D5    push        esi
 004725D6    test        dl,dl
>004725D8    je          004725E2
 004725DA    add         esp,0FFFFFFF0
 004725DD    call        @ClassCreate
 004725E2    mov         ebx,edx
 004725E4    mov         esi,eax
 004725E6    xor         edx,edx
 004725E8    mov         eax,esi
 004725EA    call        TObject.Create
 004725EF    mov         dl,1
 004725F1    mov         eax,[00439644];TList
 004725F6    call        TObject.Create
 004725FB    mov         dword ptr [esi+4],eax
 004725FE    mov         eax,esi
 00472600    test        bl,bl
>00472602    je          00472613
 00472604    call        @AfterConstruction
 00472609    pop         dword ptr fs:[0]
 00472610    add         esp,0C
 00472613    mov         eax,esi
 00472615    pop         esi
 00472616    pop         ebx
 00472617    ret
*}
end;

//00472618
destructor TOrderedList.Destroy();
begin
{*
 00472618    push        ebx
 00472619    push        esi
 0047261A    call        @BeforeDestruction
 0047261F    mov         ebx,edx
 00472621    mov         esi,eax
 00472623    mov         eax,dword ptr [esi+4]
 00472626    call        TObject.Free
 0047262B    mov         edx,ebx
 0047262D    and         dl,0FC
 00472630    mov         eax,esi
 00472632    call        TObject.Destroy
 00472637    test        bl,bl
>00472639    jle         00472642
 0047263B    mov         eax,esi
 0047263D    call        @ClassDestroy
 00472642    pop         esi
 00472643    pop         ebx
 00472644    ret
*}
end;

//00472648
function TOrderedList.PeekItem:Pointer;
begin
{*
 00472648    mov         edx,dword ptr [eax+4]
 0047264B    mov         ecx,dword ptr [edx+8]
 0047264E    dec         ecx
 0047264F    mov         eax,edx
 00472651    mov         edx,ecx
 00472653    call        TList.Get
 00472658    ret
*}
end;

//0047265C
function TOrderedList.PopItem:Pointer;
begin
{*
 0047265C    push        ebx
 0047265D    push        esi
 0047265E    mov         ebx,eax
 00472660    mov         eax,ebx
 00472662    mov         edx,dword ptr [eax]
 00472664    call        dword ptr [edx+8]
 00472667    mov         esi,eax
 00472669    mov         eax,dword ptr [ebx+4]
 0047266C    mov         edx,dword ptr [eax+8]
 0047266F    dec         edx
 00472670    call        TList.Delete
 00472675    mov         eax,esi
 00472677    pop         esi
 00472678    pop         ebx
 00472679    ret
*}
end;

//0047267C
procedure TStack.PushItem(AItem:Pointer);
begin
{*
 0047267C    mov         eax,dword ptr [eax+4]
 0047267F    call        TList.Add
 00472684    ret
*}
end;

//004727A4
function comctl32.InitCommonControls:Boolean;
begin
{*
 004727A4    jmp         dword ptr ds:[8267F8]
*}
end;

//004727AC
procedure InitComCtl;
begin
{*
 004727AC    cmp         dword ptr ds:[7930B0],0
>004727B3    jne         004727E2
 004727B5    push        4727E4
 004727BA    call        kernel32.GetModuleHandleW
 004727BF    mov         [007930B0],eax
 004727C4    cmp         dword ptr ds:[7930B0],0
>004727CB    je          004727E2
 004727CD    push        472800
 004727D2    mov         eax,[007930B0]
 004727D7    push        eax
 004727D8    call        GetProcAddress
 004727DD    mov         [007930B4],eax
 004727E2    ret
*}
end;

//0047282C
function InitCommonControlsEx(var ICC:tagINITCOMMONCONTROLSEX):BOOL;
begin
{*
 0047282C    push        ebx
 0047282D    mov         ebx,eax
 0047282F    cmp         dword ptr ds:[7930B0],0
>00472836    jne         0047283D
 00472838    call        InitComCtl
 0047283D    cmp         dword ptr ds:[7930B4],0
>00472844    je          00472851
 00472846    push        ebx
 00472847    call        dword ptr ds:[7930B4]
 0047284D    test        eax,eax
>0047284F    jne         00472855
 00472851    xor         eax,eax
>00472853    jmp         00472857
 00472855    mov         al,1
 00472857    neg         al
 00472859    sbb         eax,eax
 0047285B    pop         ebx
 0047285C    ret
*}
end;

//00472860
function comctl32.ImageList_Create(CY:Integer; Flags:UINT; Initial:Integer; Grow:Integer):THandle; stdcall;
begin
{*
 00472860    jmp         dword ptr ds:[8267F4]
*}
end;

//00472868
function comctl32.ImageList_Destroy:BOOL; stdcall;
begin
{*
 00472868    jmp         dword ptr ds:[8267F0]
*}
end;

//00472870
function comctl32.ImageList_GetImageCount:Integer; stdcall;
begin
{*
 00472870    jmp         dword ptr ds:[8267EC]
*}
end;

//00472878
function comctl32.ImageList_SetImageCount(uNewCount:UINT):Integer; stdcall;
begin
{*
 00472878    jmp         dword ptr ds:[8267E8]
*}
end;

//00472880
function comctl32.ImageList_Add(Image:HBITMAP; Mask:HBITMAP):Integer; stdcall;
begin
{*
 00472880    jmp         dword ptr ds:[8267E4]
*}
end;

//00472888
function comctl32.ImageList_ReplaceIcon(Index:Integer; Icon:HICON):Integer; stdcall;
begin
{*
 00472888    jmp         dword ptr ds:[8267E0]
*}
end;

//00472890
function comctl32.ImageList_SetBkColor(ClrBk:TColorRef):TColorRef; stdcall;
begin
{*
 00472890    jmp         dword ptr ds:[8267DC]
*}
end;

//00472898
function comctl32.ImageList_GetBkColor:TColorRef; stdcall;
begin
{*
 00472898    jmp         dword ptr ds:[8267D8]
*}
end;

//004728A0
function comctl32.ImageList_SetOverlayImage(Image:Integer; Overlay:Integer):BOOL; stdcall;
begin
{*
 004728A0    jmp         dword ptr ds:[8267D4]
*}
end;

//004728A8
function comctl32.ImageList_Draw(Index:Integer; Dest:HDC; X:Integer; Y:Integer; Style:UINT):BOOL; stdcall;
begin
{*
 004728A8    jmp         dword ptr ds:[8267D0]
*}
end;

//004728B0
function comctl32.ImageList_Replace(Index:Integer; Image:HBITMAP; Mask:HBITMAP):BOOL; stdcall;
begin
{*
 004728B0    jmp         dword ptr ds:[8267CC]
*}
end;

//004728B8
function comctl32.ImageList_DrawEx(Index:Integer; Dest:HDC; X:Integer; Y:Integer; DX:Integer; DY:Integer; Bk:TColorRef; Fg:TColorRef; Style:Cardinal):BOOL; stdcall;
begin
{*
 004728B8    jmp         dword ptr ds:[8267C8]
*}
end;

//004728C0
function comctl32.ImageList_Remove(Index:Integer):BOOL; stdcall;
begin
{*
 004728C0    jmp         dword ptr ds:[8267C4]
*}
end;

//004728C8
function comctl32.ImageList_GetIcon(Index:Integer; Flags:Cardinal):HICON; stdcall;
begin
{*
 004728C8    jmp         dword ptr ds:[8267C0]
*}
end;

//004728D0
function comctl32.ImageList_LoadImageW(Bmp:PWideChar; CX:Integer; Grow:Integer; Mask:TColorRef; pType:Cardinal; Flags:Cardinal):THandle; stdcall;
begin
{*
 004728D0    jmp         dword ptr ds:[8267BC]
*}
end;

//004728D8
function comctl32.ImageList_Copy(iDst:Integer; himlSrc:THandle; Src:Integer; uFlags:UINT):Integer; stdcall;
begin
{*
 004728D8    jmp         dword ptr ds:[8267B8]
*}
end;

//004728E0
function comctl32.ImageList_BeginDrag(Track:Integer; XHotSpot:Integer; YHotSpot:Integer):BOOL; stdcall;
begin
{*
 004728E0    jmp         dword ptr ds:[8267B4]
*}
end;

//004728E8
function comctl32.ImageList_EndDrag:BOOL;
begin
{*
 004728E8    jmp         dword ptr ds:[8267B0]
*}
end;

//004728F0
function comctl32.ImageList_DragEnter(X:Integer; Y:Integer):BOOL; stdcall;
begin
{*
 004728F0    jmp         dword ptr ds:[8267AC]
*}
end;

//004728F8
function comctl32.ImageList_DragLeave:BOOL; stdcall;
begin
{*
 004728F8    jmp         dword ptr ds:[8267A8]
*}
end;

//00472900
function comctl32.ImageList_DragMove(Y:Integer):BOOL; stdcall;
begin
{*
 00472900    jmp         dword ptr ds:[8267A4]
*}
end;

//00472908
function comctl32.ImageList_DragShowNolock:BOOL; stdcall;
begin
{*
 00472908    jmp         dword ptr ds:[8267A0]
*}
end;

//00472910
function comctl32.ImageList_GetDragImage(HotSpot:PPoint):THandle; stdcall;
begin
{*
 00472910    jmp         dword ptr ds:[82679C]
*}
end;

//00472918
function comctl32.ImageList_Read:THandle; stdcall;
begin
{*
 00472918    jmp         dword ptr ds:[826798]
*}
end;

//00472920
function comctl32.ImageList_Write(Stream:IStream):BOOL; stdcall;
begin
{*
 00472920    jmp         dword ptr ds:[826794]
*}
end;

//00472928
function comctl32.ImageList_GetIconSize(var CX:Integer; var CY:Integer):BOOL; stdcall;
begin
{*
 00472928    jmp         dword ptr ds:[826790]
*}
end;

//00472930
function comctl32.ImageList_SetIconSize(CX:Integer; CY:Integer):BOOL; stdcall;
begin
{*
 00472930    jmp         dword ptr ds:[82678C]
*}
end;

//00472938
function comctl32.ImageList_GetImageInfo(Index:Integer; var ImageInfo:_IMAGEINFO):BOOL; stdcall;
begin
{*
 00472938    jmp         dword ptr ds:[826788]
*}
end;

//00472940
function comctl32._TrackMouseEvent:BOOL; stdcall;
begin
{*
 00472940    jmp         dword ptr ds:[826784]
*}
end;

//00472948
function comctl32.FlatSB_GetScrollInfo(BarFlag:Integer; var ScrollInfo:TScrollInfo):BOOL; stdcall;
begin
{*
 00472948    jmp         dword ptr ds:[826780]
*}
end;

//00472950
function comctl32.FlatSB_GetScrollPos(nBar:Integer):Integer; stdcall;
begin
{*
 00472950    jmp         dword ptr ds:[82677C]
*}
end;

//00472958
function comctl32.FlatSB_SetScrollInfo(BarFlag:Integer; const ScrollInfo:TScrollInfo; Redraw:BOOL):Integer; stdcall;
begin
{*
 00472958    jmp         dword ptr ds:[826778]
*}
end;

//00472960
function comctl32.FlatSB_SetScrollPos(nBar:Integer; nPos:Integer; bRedraw:BOOL):Integer; stdcall;
begin
{*
 00472960    jmp         dword ptr ds:[826774]
*}
end;

//00472968
function comctl32.FlatSB_SetScrollProp(index:Integer; newValue:Integer; p4:BOOL):BOOL; stdcall;
begin
{*
 00472968    jmp         dword ptr ds:[826770]
*}
end;

//00472970
function comctl32.InitializeFlatSB:BOOL; stdcall;
begin
{*
 00472970    jmp         dword ptr ds:[82676C]
*}
end;

//00472978
function TaskDialogIndirect(const pTaskConfig:TASKDIALOGCONFIG; pnButton:PInteger; pnRadioButton:PInteger; pfVerificationFlagChecked:PBOOL):HRESULT;
begin
{*
 00472978    push        ebp
 00472979    mov         ebp,esp
 0047297B    push        ecx
 0047297C    push        ebx
 0047297D    push        esi
 0047297E    push        edi
 0047297F    mov         dword ptr [ebp-4],ecx
 00472982    mov         edi,edx
 00472984    mov         esi,eax
 00472986    cmp         dword ptr ds:[7930B8],0
>0047298D    je          004729A3
 0047298F    mov         eax,dword ptr [ebp+8]
 00472992    push        eax
 00472993    mov         eax,dword ptr [ebp-4]
 00472996    push        eax
 00472997    push        edi
 00472998    push        esi
 00472999    call        dword ptr ds:[7930B8]
 0047299F    mov         ebx,eax
>004729A1    jmp         004729E6
 004729A3    call        InitComCtl
 004729A8    mov         ebx,80004001
 004729AD    cmp         dword ptr ds:[7930B0],0
>004729B4    je          004729E6
 004729B6    push        4729F0
 004729BB    mov         eax,[007930B0]
 004729C0    push        eax
 004729C1    call        GetProcAddress
 004729C6    mov         [007930B8],eax
 004729CB    cmp         dword ptr ds:[7930B8],0
>004729D2    je          004729E6
 004729D4    mov         eax,dword ptr [ebp+8]
 004729D7    push        eax
 004729D8    mov         eax,dword ptr [ebp-4]
 004729DB    push        eax
 004729DC    push        edi
 004729DD    push        esi
 004729DE    call        dword ptr ds:[7930B8]
 004729E4    mov         ebx,eax
 004729E6    mov         eax,ebx
 004729E8    pop         edi
 004729E9    pop         esi
 004729EA    pop         ebx
 004729EB    pop         ecx
 004729EC    pop         ebp
 004729ED    ret         4
*}
end;

//00472AAC
procedure uxtheme.dll;
begin
{*
 00472AAC    push        82A060
 00472AB1    call        @delayLoadHelper
 00472AB6    pop         ecx
 00472AB7    pop         edx
 00472AB8    xchg        eax,dword ptr [esp]
 00472ABB    ret
*}
end;

//00472ABC
procedure $thunk_BeginBufferedAnimation;
begin
{*
 00472ABC    push        eax
 00472ABD    push        edx
 00472ABE    push        ecx
 00472ABF    push        82A104;^$thunk_BeginBufferedAnimation
>00472AC4    jmp         uxtheme.dll
*}
end;

//00472ACC
function DrawThemeTextEx(hTheme:THandle; hdc:HDC; iPartId:Integer; iStateId:Integer; pszText:LPCWSTR; cchText:Integer; dwTextFlags:DWORD; pRect:PRect; var pOptions:DTTOPTS):HRESULT; stdcall;
begin
{*
 00472ACC    jmp         dword ptr ds:[82A104]
*}
end;

//00472AD4
procedure $thunk_BeginBufferedPaint;
begin
{*
 00472AD4    push        eax
 00472AD5    push        edx
 00472AD6    push        ecx
 00472AD7    push        82A100;^$thunk_BeginBufferedPaint
>00472ADC    jmp         uxtheme.dll
*}
end;

//00472AE4
function BeginBufferedPaint(hdcTarget:HDC; const prcTarget:TRect; dwFormat:DWORD; pPaintParams:PBPPaintParams; var phdc:HDC):THandle; stdcall;
begin
{*
 00472AE4    jmp         dword ptr ds:[82A100]
*}
end;

//00472AEC
procedure $thunk_BeginPanningFeedback;
begin
{*
 00472AEC    push        eax
 00472AED    push        edx
 00472AEE    push        ecx
 00472AEF    push        82A0FC;^$thunk_BeginPanningFeedback
>00472AF4    jmp         uxtheme.dll
*}
end;

//00472AFC
function EndBufferedPaint(hBufferedPaint:THandle; fUpdateTarget:BOOL):HRESULT; stdcall;
begin
{*
 00472AFC    jmp         dword ptr ds:[82A0FC]
*}
end;

//00472B04
procedure $thunk_BufferedPaintClear;
begin
{*
 00472B04    push        eax
 00472B05    push        edx
 00472B06    push        ecx
 00472B07    push        82A0F8;^$thunk_BufferedPaintClear
>00472B0C    jmp         uxtheme.dll
*}
end;

//00472B14
function BufferedPaintSetAlpha(hBufferedPaint:THandle; prc:PRect; alpha:Byte):HRESULT; stdcall;
begin
{*
 00472B14    jmp         dword ptr ds:[82A0F8]
*}
end;

//00472B1C
procedure FreeThemeLibrary;
begin
{*
 00472B1C    push        ebp
 00472B1D    mov         ebp,esp
 00472B1F    mov         eax,[00793184];gvar_00793184:TCriticalSection
 00472B24    call        TCriticalSection.Enter
 00472B29    xor         eax,eax
 00472B2B    push        ebp
 00472B2C    push        472CD3
 00472B31    push        dword ptr fs:[eax]
 00472B34    mov         dword ptr fs:[eax],esp
 00472B37    cmp         dword ptr ds:[793180],0;gvar_00793180
>00472B3E    jle         00472B46
 00472B40    dec         dword ptr ds:[793180];gvar_00793180
 00472B46    cmp         dword ptr ds:[79317C],0
>00472B4D    je          00472CBB
 00472B53    cmp         dword ptr ds:[793180],0;gvar_00793180
>00472B5A    jne         00472CBB
 00472B60    mov         eax,[0079317C]
 00472B65    push        eax
 00472B66    call        kernel32.FreeLibrary
 00472B6B    xor         eax,eax
 00472B6D    mov         [0079317C],eax
 00472B72    xor         eax,eax
 00472B74    mov         [007930BC],eax
 00472B79    xor         eax,eax
 00472B7B    mov         [007930C0],eax
 00472B80    xor         eax,eax
 00472B82    mov         [007930C4],eax
 00472B87    xor         eax,eax
 00472B89    mov         [007930C8],eax
 00472B8E    xor         eax,eax
 00472B90    mov         [007930CC],eax
 00472B95    xor         eax,eax
 00472B97    mov         [007930D0],eax
 00472B9C    xor         eax,eax
 00472B9E    mov         [007930D4],eax
 00472BA3    xor         eax,eax
 00472BA5    mov         [007930D8],eax
 00472BAA    xor         eax,eax
 00472BAC    mov         [007930DC],eax
 00472BB1    xor         eax,eax
 00472BB3    mov         [007930E0],eax
 00472BB8    xor         eax,eax
 00472BBA    mov         [007930E4],eax
 00472BBF    xor         eax,eax
 00472BC1    mov         [007930E8],eax
 00472BC6    xor         eax,eax
 00472BC8    mov         [007930EC],eax
 00472BCD    xor         eax,eax
 00472BCF    mov         [007930F0],eax
 00472BD4    xor         eax,eax
 00472BD6    mov         [007930F4],eax
 00472BDB    xor         eax,eax
 00472BDD    mov         [007930F8],eax
 00472BE2    xor         eax,eax
 00472BE4    mov         [007930FC],eax
 00472BE9    xor         eax,eax
 00472BEB    mov         [00793100],eax
 00472BF0    xor         eax,eax
 00472BF2    mov         [00793104],eax
 00472BF7    xor         eax,eax
 00472BF9    mov         [00793108],eax;gvar_00793108
 00472BFE    xor         eax,eax
 00472C00    mov         [0079310C],eax
 00472C05    xor         eax,eax
 00472C07    mov         [00793110],eax
 00472C0C    xor         eax,eax
 00472C0E    mov         [00793114],eax
 00472C13    xor         eax,eax
 00472C15    mov         [00793118],eax
 00472C1A    xor         eax,eax
 00472C1C    mov         [0079311C],eax;GetThemeMargins:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;v...
 00472C21    xor         eax,eax
 00472C23    mov         [00793120],eax
 00472C28    xor         eax,eax
 00472C2A    mov         [00793124],eax
 00472C2F    xor         eax,eax
 00472C31    mov         [00793128],eax
 00472C36    xor         eax,eax
 00472C38    mov         [0079312C],eax;gvar_0079312C
 00472C3D    xor         eax,eax
 00472C3F    mov         [00793130],eax
 00472C44    xor         eax,eax
 00472C46    mov         [00793134],eax
 00472C4B    xor         eax,eax
 00472C4D    mov         [00793138],eax
 00472C52    xor         eax,eax
 00472C54    mov         [0079313C],eax
 00472C59    xor         eax,eax
 00472C5B    mov         [00793140],eax
 00472C60    xor         eax,eax
 00472C62    mov         [00793144],eax
 00472C67    xor         eax,eax
 00472C69    mov         [00793148],eax
 00472C6E    xor         eax,eax
 00472C70    mov         [0079314C],eax;gvar_0079314C
 00472C75    xor         eax,eax
 00472C77    mov         [00793150],eax;gvar_00793150
 00472C7C    xor         eax,eax
 00472C7E    mov         [00793154],eax
 00472C83    xor         eax,eax
 00472C85    mov         [00793158],eax
 00472C8A    xor         eax,eax
 00472C8C    mov         [0079315C],eax
 00472C91    xor         eax,eax
 00472C93    mov         [00793160],eax
 00472C98    xor         eax,eax
 00472C9A    mov         [00793164],eax
 00472C9F    xor         eax,eax
 00472CA1    mov         [00793168],eax;gvar_00793168
 00472CA6    xor         eax,eax
 00472CA8    mov         [0079316C],eax
 00472CAD    xor         eax,eax
 00472CAF    mov         [00793170],eax
 00472CB4    xor         eax,eax
 00472CB6    mov         [00793174],eax
 00472CBB    xor         eax,eax
 00472CBD    pop         edx
 00472CBE    pop         ecx
 00472CBF    pop         ecx
 00472CC0    mov         dword ptr fs:[eax],edx
 00472CC3    push        472CDA
 00472CC8    mov         eax,[00793184];gvar_00793184:TCriticalSection
 00472CCD    call        TCriticalSection.Leave
 00472CD2    ret
>00472CD3    jmp         @HandleFinally
>00472CD8    jmp         00472CC8
 00472CDA    pop         ebp
 00472CDB    ret
*}
end;

//00472CDC
function InitThemeLibrary:Boolean;
begin
{*
 00472CDC    push        ebp
 00472CDD    mov         ebp,esp
 00472CDF    push        ecx
 00472CE0    push        ebx
 00472CE1    mov         ebx,79317C
 00472CE6    mov         eax,[00793184];gvar_00793184:TCriticalSection
 00472CEB    call        TCriticalSection.Enter
 00472CF0    xor         eax,eax
 00472CF2    push        ebp
 00472CF3    push        47308F
 00472CF8    push        dword ptr fs:[eax]
 00472CFB    mov         dword ptr fs:[eax],esp
 00472CFE    inc         dword ptr ds:[793180];gvar_00793180
 00472D04    cmp         dword ptr [ebx],0
>00472D07    jne         00473070
 00472D0D    push        4730A0
 00472D12    call        kernel32.LoadLibraryW
 00472D17    mov         dword ptr [ebx],eax
 00472D19    cmp         dword ptr [ebx],0
>00472D1C    jbe         00473070
 00472D22    push        4730B8
 00472D27    mov         eax,dword ptr [ebx]
 00472D29    push        eax
 00472D2A    call        GetProcAddress
 00472D2F    mov         [007930BC],eax
 00472D34    push        4730D4
 00472D39    mov         eax,dword ptr [ebx]
 00472D3B    push        eax
 00472D3C    call        GetProcAddress
 00472D41    mov         [007930C0],eax
 00472D46    push        4730F4
 00472D4B    mov         eax,dword ptr [ebx]
 00472D4D    push        eax
 00472D4E    call        GetProcAddress
 00472D53    mov         [007930C4],eax
 00472D58    push        47311C
 00472D5D    mov         eax,dword ptr [ebx]
 00472D5F    push        eax
 00472D60    call        GetProcAddress
 00472D65    mov         [007930C8],eax
 00472D6A    push        473138
 00472D6F    mov         eax,dword ptr [ebx]
 00472D71    push        eax
 00472D72    call        GetProcAddress
 00472D77    mov         [007930CC],eax
 00472D7C    push        473174
 00472D81    mov         eax,dword ptr [ebx]
 00472D83    push        eax
 00472D84    call        GetProcAddress
 00472D89    mov         [007930D0],eax
 00472D8E    push        4731A8
 00472D93    mov         eax,dword ptr [ebx]
 00472D95    push        eax
 00472D96    call        GetProcAddress
 00472D9B    mov         [007930D4],eax
 00472DA0    push        4731CC
 00472DA5    mov         eax,dword ptr [ebx]
 00472DA7    push        eax
 00472DA8    call        GetProcAddress
 00472DAD    mov         [007930D8],eax
 00472DB2    push        4731F4
 00472DB7    mov         eax,dword ptr [ebx]
 00472DB9    push        eax
 00472DBA    call        GetProcAddress
 00472DBF    mov         [007930DC],eax
 00472DC4    push        47321C
 00472DC9    mov         eax,dword ptr [ebx]
 00472DCB    push        eax
 00472DCC    call        GetProcAddress
 00472DD1    mov         [007930E0],eax
 00472DD6    push        473250
 00472DDB    mov         eax,dword ptr [ebx]
 00472DDD    push        eax
 00472DDE    call        GetProcAddress
 00472DE3    mov         [007930E4],eax
 00472DE8    push        473280
 00472DED    mov         eax,dword ptr [ebx]
 00472DEF    push        eax
 00472DF0    call        GetProcAddress
 00472DF5    mov         [007930E8],eax
 00472DFA    push        47329C
 00472DFF    mov         eax,dword ptr [ebx]
 00472E01    push        eax
 00472E02    call        GetProcAddress
 00472E07    mov         [007930EC],eax
 00472E0C    push        4732B8
 00472E11    mov         eax,dword ptr [ebx]
 00472E13    push        eax
 00472E14    call        GetProcAddress
 00472E19    mov         [007930F0],eax
 00472E1E    push        4732E0
 00472E23    mov         eax,dword ptr [ebx]
 00472E25    push        eax
 00472E26    call        GetProcAddress
 00472E2B    mov         [007930F4],eax
 00472E30    push        47332C
 00472E35    mov         eax,dword ptr [ebx]
 00472E37    push        eax
 00472E38    call        GetProcAddress
 00472E3D    mov         [007930F8],eax
 00472E42    push        473348
 00472E47    mov         eax,dword ptr [ebx]
 00472E49    push        eax
 00472E4A    call        GetProcAddress
 00472E4F    mov         [007930FC],eax
 00472E54    push        473368
 00472E59    mov         eax,dword ptr [ebx]
 00472E5B    push        eax
 00472E5C    call        GetProcAddress
 00472E61    mov         [00793100],eax
 00472E66    push        473388
 00472E6B    mov         eax,dword ptr [ebx]
 00472E6D    push        eax
 00472E6E    call        GetProcAddress
 00472E73    mov         [00793104],eax
 00472E78    push        4733A4
 00472E7D    mov         eax,dword ptr [ebx]
 00472E7F    push        eax
 00472E80    call        GetProcAddress
 00472E85    mov         [00793108],eax;gvar_00793108
 00472E8A    push        4733BC
 00472E8F    mov         eax,dword ptr [ebx]
 00472E91    push        eax
 00472E92    call        GetProcAddress
 00472E97    mov         [0079310C],eax
 00472E9C    push        4733E0
 00472EA1    mov         eax,dword ptr [ebx]
 00472EA3    push        eax
 00472EA4    call        GetProcAddress
 00472EA9    mov         [00793110],eax
 00472EAE    push        473404
 00472EB3    mov         eax,dword ptr [ebx]
 00472EB5    push        eax
 00472EB6    call        GetProcAddress
 00472EBB    mov         [00793114],eax
 00472EC0    push        473420
 00472EC5    mov         eax,dword ptr [ebx]
 00472EC7    push        eax
 00472EC8    call        GetProcAddress
 00472ECD    mov         [00793118],eax
 00472ED2    push        47343C
 00472ED7    mov         eax,dword ptr [ebx]
 00472ED9    push        eax
 00472EDA    call        GetProcAddress
 00472EDF    mov         [0079311C],eax;GetThemeMargins:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;v...
 00472EE4    push        47345C
 00472EE9    mov         eax,dword ptr [ebx]
 00472EEB    push        eax
 00472EEC    call        GetProcAddress
 00472EF1    mov         [00793120],eax
 00472EF6    push        47347C
 00472EFB    mov         eax,dword ptr [ebx]
 00472EFD    push        eax
 00472EFE    call        GetProcAddress
 00472F03    mov         [00793124],eax
 00472F08    push        4734AC
 00472F0D    mov         eax,dword ptr [ebx]
 00472F0F    push        eax
 00472F10    call        GetProcAddress
 00472F15    mov         [00793128],eax
 00472F1A    push        4734CC
 00472F1F    mov         eax,dword ptr [ebx]
 00472F21    push        eax
 00472F22    call        GetProcAddress
 00472F27    mov         [0079312C],eax;gvar_0079312C
 00472F2C    push        4734F0
 00472F31    mov         eax,dword ptr [ebx]
 00472F33    push        eax
 00472F34    call        GetProcAddress
 00472F39    mov         [00793130],eax
 00472F3E    push        473514
 00472F43    mov         eax,dword ptr [ebx]
 00472F45    push        eax
 00472F46    call        GetProcAddress
 00472F4B    mov         [00793134],eax
 00472F50    push        473540
 00472F55    mov         eax,dword ptr [ebx]
 00472F57    push        eax
 00472F58    call        GetProcAddress
 00472F5D    mov         [00793138],eax
 00472F62    push        473560
 00472F67    mov         eax,dword ptr [ebx]
 00472F69    push        eax
 00472F6A    call        GetProcAddress
 00472F6F    mov         [0079313C],eax
 00472F74    push        473580
 00472F79    mov         eax,dword ptr [ebx]
 00472F7B    push        eax
 00472F7C    call        GetProcAddress
 00472F81    mov         [00793140],eax
 00472F86    push        4735A0
 00472F8B    mov         eax,dword ptr [ebx]
 00472F8D    push        eax
 00472F8E    call        GetProcAddress
 00472F93    mov         [00793144],eax
 00472F98    push        4735C4
 00472F9D    mov         eax,dword ptr [ebx]
 00472F9F    push        eax
 00472FA0    call        GetProcAddress
 00472FA5    mov         [00793148],eax
 00472FAA    push        4735E4
 00472FAF    mov         eax,dword ptr [ebx]
 00472FB1    push        eax
 00472FB2    call        GetProcAddress
 00472FB7    mov         [0079314C],eax;gvar_0079314C
 00472FBC    push        473600
 00472FC1    mov         eax,dword ptr [ebx]
 00472FC3    push        eax
 00472FC4    call        GetProcAddress
 00472FC9    mov         [00793150],eax;gvar_00793150
 00472FCE    push        473618
 00472FD3    mov         eax,dword ptr [ebx]
 00472FD5    push        eax
 00472FD6    call        GetProcAddress
 00472FDB    mov         [00793154],eax
 00472FE0    push        473638
 00472FE5    mov         eax,dword ptr [ebx]
 00472FE7    push        eax
 00472FE8    call        GetProcAddress
 00472FED    mov         [00793158],eax
 00472FF2    push        47366C
 00472FF7    mov         eax,dword ptr [ebx]
 00472FF9    push        eax
 00472FFA    call        GetProcAddress
 00472FFF    mov         [0079315C],eax
 00473004    push        4736A4
 00473009    mov         eax,dword ptr [ebx]
 0047300B    push        eax
 0047300C    call        GetProcAddress
 00473011    mov         [00793160],eax
 00473016    push        4736D0
 0047301B    mov         eax,dword ptr [ebx]
 0047301D    push        eax
 0047301E    call        GetProcAddress
 00473023    mov         [00793164],eax
 00473028    push        4736FC
 0047302D    mov         eax,dword ptr [ebx]
 0047302F    push        eax
 00473030    call        GetProcAddress
 00473035    mov         [00793168],eax;gvar_00793168
 0047303A    push        473724
 0047303F    mov         eax,dword ptr [ebx]
 00473041    push        eax
 00473042    call        GetProcAddress
 00473047    mov         [0079316C],eax
 0047304C    push        473760
 00473051    mov         eax,dword ptr [ebx]
 00473053    push        eax
 00473054    call        GetProcAddress
 00473059    mov         [00793170],eax
 0047305E    push        473794
 00473063    mov         eax,dword ptr [ebx]
 00473065    push        eax
 00473066    call        GetProcAddress
 0047306B    mov         [00793174],eax
 00473070    cmp         dword ptr [ebx],0
 00473073    seta        byte ptr [ebp-1]
 00473077    xor         eax,eax
 00473079    pop         edx
 0047307A    pop         ecx
 0047307B    pop         ecx
 0047307C    mov         dword ptr fs:[eax],edx
 0047307F    push        473096
 00473084    mov         eax,[00793184];gvar_00793184:TCriticalSection
 00473089    call        TCriticalSection.Leave
 0047308E    ret
>0047308F    jmp         @HandleFinally
>00473094    jmp         00473084
 00473096    movzx       eax,byte ptr [ebp-1]
 0047309A    pop         ebx
 0047309B    pop         ecx
 0047309C    pop         ebp
 0047309D    ret
*}
end;

//004737B0
function UseThemes:Boolean;
begin
{*
 004737B0    cmp         dword ptr ds:[79317C],0
>004737B7    jbe         004737D4
 004737B9    call        dword ptr ds:[793150]
 004737BF    test        eax,eax
>004737C1    je          004737CD
 004737C3    call        dword ptr ds:[79314C]
 004737C9    test        eax,eax
>004737CB    jne         004737D1
 004737CD    xor         eax,eax
>004737CF    jmp         004737D6
 004737D1    mov         al,1
 004737D3    ret
 004737D4    xor         eax,eax
 004737D6    ret
*}
end;

Initialization
//007808C8
{*
 007808C8    sub         dword ptr ds:[793178],1
>007808CF    jae         007808E2
 007808D1    mov         dl,1
 007808D3    mov         eax,[00455FEC];TCriticalSection
 007808D8    call        TCriticalSection.Create;TCriticalSection.Create
 007808DD    mov         [00793184],eax;gvar_00793184:TCriticalSection
 007808E2    ret
*}
Finalization
end.