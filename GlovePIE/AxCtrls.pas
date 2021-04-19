//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit AxCtrls;

interface

uses
  SysUtils, Classes, AxCtrls, Graphics;

type
  TCustomAdapter = class(TInterfacedObject)
  published
    destructor Destroy();//00704F68
    constructor Create();//00704F14
  public
    FOleObject:IInterface;//fC
    FConnection:Integer;//f10
    FNotifier:IInterface;//f14
    Updating:Boolean;//f18
    destructor Destroy(); virtual;//00704F68
    procedure Changed; virtual;//v0//00704F94
    procedure Update; virtual; abstract;//v4//00404A58
    procedure ConnectOleObject(OleObject:IUnknown);//00704FA0
    procedure ReleaseOleObject;//00705024
  end;
  TAdapterNotifier = class(TInterfacedObject)
  published
    constructor Create;//00705054
  public
    FAdapter:TCustomAdapter;//fC
    function OnChanged(dispid:TDispID):HRESULT; stdcall;//00705090
  end;
  TFontAdapter = class(TCustomAdapter)
  published
    constructor Create;//007050E4
  public
    FFont:TFont;//f1C
    procedure Changed; virtual;//v0//007052EC
    procedure Update; virtual;//v4//00705120
    procedure GetOleFont(var OleFont:IFontDisp);//00705490
    procedure SetOleFont(const OleFont:IFontDisp);//007055FC
  end;
  TPictureAdapter = class(TCustomAdapter)
  published
    constructor Create;//00705668
  public
    FPicture:TPicture;//f1C
    procedure Update; virtual;//v4//007056A4
    procedure GetOlePicture(var OlePicture:IPictureDisp);//00705730
    procedure SetOlePicture(const OlePicture:IPictureDisp);//00705964
  end;
  TOleGraphic = class(TGraphic)
  published
    procedure SaveToStream(Stream:TStream);//00705D40
    procedure LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);//00705DC4
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE);//00705E10
    procedure LoadFromStream(Stream:TStream);//00705CF0
    constructor Create();//00705978
    procedure Assign(Source:TPersistent);//007059B0
    procedure LoadFromFile(Filename:string);//00705CEC
  public
    FPicture:IPicture;//f28
    procedure Assign(Source:TPersistent); virtual;//v8//007059B0
    procedure Changed(Sender:TObject); virtual;//v10//007059E4
    procedure Draw(ACanvas:TCanvas; const Rect:TRect); virtual;//v14//007059E8
    function GetEmpty:Boolean; virtual;//v20//00705AF4
    function GetHeight:Integer; virtual;//v24//00705B68
    function GetPalette:HPALETTE; virtual;//v28//00705BC4
    function GetTransparent:Boolean; virtual;//v2C//00705BE0
    function GetWidth:Integer; virtual;//v30//00705C00
    procedure SetHeight(Value:Integer); virtual;//v38//00705C3C
    procedure SetPalette(Value:HPALETTE); virtual;//v3C//00705C84
    procedure SetWidth(Value:Integer); virtual;//v44//00705CA4
    constructor Create(); virtual;//v50//00705978
    procedure LoadFromFile(Filename:string); virtual;//v54//00705CEC
    procedure LoadFromStream(Stream:TStream); virtual;//v5C//00705CF0
    procedure SaveToStream(Stream:TStream); virtual;//v60//00705D40
    procedure LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE); virtual;//v64//00705DC4
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE); virtual;//v68//00705E10
    function GetMMHeight:Integer;//00705B8C
    function GetMMWidth:Integer;//00705BA8
  end;
    function HandleException:HRESULT;//00704D40
    function GetFontAccess(Font:TFont):IFontAccess;//00704D6C
    function GetPictureAccess(Picture:TPicture):IPictureAccess;//00704DBC
    procedure GetOleFont(Font:TFont; var OleFont:IFontDisp);//00704E0C
    procedure SetOleFont(Font:TFont; OleFont:IFontDisp);//00704E5C
    procedure GetOlePicture(Picture:TPicture; var OlePicture:IPictureDisp);//00704EC4
    procedure Changed;//00704F94
    function EnableModeless(fEnable:BOOL):HRESULT; stdcall;//007050D8
    procedure Update;//00705120
    procedure Changed;//007052EC
    procedure Update;//007056A4
    procedure Changed(Sender:TObject);//007059E4
    procedure Draw(ACanvas:TCanvas; const Rect:TRect);//007059E8
    function GetEmpty:Boolean;//00705AF4
    function HIMETRICtoDP(P:TPoint):TPoint;//00705B20
    function GetHeight:Integer;//00705B68
    function GetPalette:HPALETTE;//00705BC4
    function GetTransparent:Boolean;//00705BE0
    function GetWidth:Integer;//00705C00
    procedure InvalidOperation(const Str:UnicodeString);//00705C24
    procedure SetHeight(Value:Integer);//00705C3C
    procedure SetPalette(Value:HPALETTE);//00705C84
    procedure SetWidth(Value:Integer);//00705CA4
    procedure InitOlePro32;//00705E5C
    function OleCreateFontIndirect(const FontDesc:TFontDesc; const iid:TIID; var vObject:void ):HRESULT;//00705FB0
    function OleCreatePictureIndirect(const PictDesc:TPictDesc; const iid:TIID; fOwn:BOOL; var vObject:void ):HRESULT;//00705FCC
    function OleLoadPicture(stream:IStream; lSize:LongInt; fRunmode:BOOL; const iid:TIID; var vObject:void ):HRESULT;//00705FF4

implementation

//00704D40
function HandleException:HRESULT;
begin
{*
 00704D40    push        ebx
 00704D41    call        ExceptObject
 00704D46    mov         ebx,eax
 00704D48    mov         eax,ebx
 00704D4A    mov         edx,dword ptr ds:[52E794];EOleSysError
 00704D50    call        @IsClass
 00704D55    test        al,al
>00704D57    je          00704D64
 00704D59    cmp         dword ptr [ebx+18],0
>00704D5D    jge         00704D64
 00704D5F    mov         eax,dword ptr [ebx+18]
 00704D62    pop         ebx
 00704D63    ret
 00704D64    mov         eax,8000FFFF
 00704D69    pop         ebx
 00704D6A    ret
*}
end;

//00704D6C
function GetFontAccess(Font:TFont):IFontAccess;
begin
{*
 00704D6C    push        ebx
 00704D6D    push        esi
 00704D6E    mov         esi,edx
 00704D70    mov         ebx,eax
 00704D72    cmp         dword ptr [ebx+20],0
>00704D76    jne         00704D97
 00704D78    mov         ecx,ebx
 00704D7A    mov         dl,1
 00704D7C    mov         eax,[00704684];TFontAdapter
 00704D81    call        TFontAdapter.Create
 00704D86    mov         edx,eax
 00704D88    test        edx,edx
>00704D8A    je          00704D8F
 00704D8C    sub         edx,0FFFFFFDC
 00704D8F    lea         eax,[ebx+20]
 00704D92    call        @IntfCopy
 00704D97    mov         eax,esi
 00704D99    mov         edx,dword ptr [ebx+20]
 00704D9C    mov         ecx,704DAC
 00704DA1    call        @IntfCast
 00704DA6    pop         esi
 00704DA7    pop         ebx
 00704DA8    ret
*}
end;

//00704DBC
function GetPictureAccess(Picture:TPicture):IPictureAccess;
begin
{*
 00704DBC    push        ebx
 00704DBD    push        esi
 00704DBE    mov         esi,edx
 00704DC0    mov         ebx,eax
 00704DC2    cmp         dword ptr [ebx+18],0
>00704DC6    jne         00704DE7
 00704DC8    mov         ecx,ebx
 00704DCA    mov         dl,1
 00704DCC    mov         eax,[00704874];TPictureAdapter
 00704DD1    call        TPictureAdapter.Create
 00704DD6    mov         edx,eax
 00704DD8    test        edx,edx
>00704DDA    je          00704DDF
 00704DDC    sub         edx,0FFFFFFDC
 00704DDF    lea         eax,[ebx+18]
 00704DE2    call        @IntfCopy
 00704DE7    mov         eax,esi
 00704DE9    mov         edx,dword ptr [ebx+18]
 00704DEC    mov         ecx,704DFC
 00704DF1    call        @IntfCast
 00704DF6    pop         esi
 00704DF7    pop         ebx
 00704DF8    ret
*}
end;

//00704E0C
procedure GetOleFont(Font:TFont; var OleFont:IFontDisp);
begin
{*
 00704E0C    push        ebp
 00704E0D    mov         ebp,esp
 00704E0F    push        0
 00704E11    push        ebx
 00704E12    push        esi
 00704E13    mov         esi,edx
 00704E15    mov         ebx,eax
 00704E17    xor         eax,eax
 00704E19    push        ebp
 00704E1A    push        704E4F
 00704E1F    push        dword ptr fs:[eax]
 00704E22    mov         dword ptr fs:[eax],esp
 00704E25    lea         edx,[ebp-4]
 00704E28    mov         eax,ebx
 00704E2A    call        GetFontAccess
 00704E2F    mov         eax,dword ptr [ebp-4]
 00704E32    mov         edx,esi
 00704E34    mov         ecx,dword ptr [eax]
 00704E36    call        dword ptr [ecx+0C]
 00704E39    xor         eax,eax
 00704E3B    pop         edx
 00704E3C    pop         ecx
 00704E3D    pop         ecx
 00704E3E    mov         dword ptr fs:[eax],edx
 00704E41    push        704E56
 00704E46    lea         eax,[ebp-4]
 00704E49    call        @IntfClear
 00704E4E    ret
>00704E4F    jmp         @HandleFinally
>00704E54    jmp         00704E46
 00704E56    pop         esi
 00704E57    pop         ebx
 00704E58    pop         ecx
 00704E59    pop         ebp
 00704E5A    ret
*}
end;

//00704E5C
procedure SetOleFont(Font:TFont; OleFont:IFontDisp);
begin
{*
 00704E5C    push        ebp
 00704E5D    mov         ebp,esp
 00704E5F    add         esp,0FFFFFFF8
 00704E62    push        ebx
 00704E63    xor         ecx,ecx
 00704E65    mov         dword ptr [ebp-8],ecx
 00704E68    mov         dword ptr [ebp-4],edx
 00704E6B    mov         ebx,eax
 00704E6D    mov         eax,dword ptr [ebp-4]
 00704E70    call        @IntfAddRef
 00704E75    xor         eax,eax
 00704E77    push        ebp
 00704E78    push        704EB6
 00704E7D    push        dword ptr fs:[eax]
 00704E80    mov         dword ptr fs:[eax],esp
 00704E83    lea         edx,[ebp-8]
 00704E86    mov         eax,ebx
 00704E88    call        GetFontAccess
 00704E8D    mov         eax,dword ptr [ebp-8]
 00704E90    mov         edx,dword ptr [ebp-4]
 00704E93    mov         ecx,dword ptr [eax]
 00704E95    call        dword ptr [ecx+10]
 00704E98    xor         eax,eax
 00704E9A    pop         edx
 00704E9B    pop         ecx
 00704E9C    pop         ecx
 00704E9D    mov         dword ptr fs:[eax],edx
 00704EA0    push        704EBD
 00704EA5    lea         eax,[ebp-8]
 00704EA8    call        @IntfClear
 00704EAD    lea         eax,[ebp-4]
 00704EB0    call        @IntfClear
 00704EB5    ret
>00704EB6    jmp         @HandleFinally
>00704EBB    jmp         00704EA5
 00704EBD    pop         ebx
 00704EBE    pop         ecx
 00704EBF    pop         ecx
 00704EC0    pop         ebp
 00704EC1    ret
*}
end;

//00704EC4
procedure GetOlePicture(Picture:TPicture; var OlePicture:IPictureDisp);
begin
{*
 00704EC4    push        ebp
 00704EC5    mov         ebp,esp
 00704EC7    push        0
 00704EC9    push        ebx
 00704ECA    push        esi
 00704ECB    mov         esi,edx
 00704ECD    mov         ebx,eax
 00704ECF    xor         eax,eax
 00704ED1    push        ebp
 00704ED2    push        704F07
 00704ED7    push        dword ptr fs:[eax]
 00704EDA    mov         dword ptr fs:[eax],esp
 00704EDD    lea         edx,[ebp-4]
 00704EE0    mov         eax,ebx
 00704EE2    call        GetPictureAccess
 00704EE7    mov         eax,dword ptr [ebp-4]
 00704EEA    mov         edx,esi
 00704EEC    mov         ecx,dword ptr [eax]
 00704EEE    call        dword ptr [ecx+0C]
 00704EF1    xor         eax,eax
 00704EF3    pop         edx
 00704EF4    pop         ecx
 00704EF5    pop         ecx
 00704EF6    mov         dword ptr fs:[eax],edx
 00704EF9    push        704F0E
 00704EFE    lea         eax,[ebp-4]
 00704F01    call        @IntfClear
 00704F06    ret
>00704F07    jmp         @HandleFinally
>00704F0C    jmp         00704EFE
 00704F0E    pop         esi
 00704F0F    pop         ebx
 00704F10    pop         ecx
 00704F11    pop         ebp
 00704F12    ret
*}
end;

//00704F14
constructor TCustomAdapter.Create();
begin
{*
 00704F14    push        ebx
 00704F15    push        esi
 00704F16    test        dl,dl
>00704F18    je          00704F22
 00704F1A    add         esp,0FFFFFFF0
 00704F1D    call        @ClassCreate
 00704F22    mov         ebx,edx
 00704F24    mov         esi,eax
 00704F26    xor         edx,edx
 00704F28    mov         eax,esi
 00704F2A    call        TObject.Create
 00704F2F    mov         ecx,esi
 00704F31    mov         dl,1
 00704F33    mov         eax,[00704494];TAdapterNotifier
 00704F38    call        TAdapterNotifier.Create
 00704F3D    mov         edx,eax
 00704F3F    test        edx,edx
>00704F41    je          00704F46
 00704F43    sub         edx,0FFFFFFF8
 00704F46    lea         eax,[esi+14]
 00704F49    call        @IntfCopy
 00704F4E    mov         eax,esi
 00704F50    test        bl,bl
>00704F52    je          00704F63
 00704F54    call        @AfterConstruction
 00704F59    pop         dword ptr fs:[0]
 00704F60    add         esp,0C
 00704F63    mov         eax,esi
 00704F65    pop         esi
 00704F66    pop         ebx
 00704F67    ret
*}
end;

//00704F68
destructor TCustomAdapter.Destroy();
begin
{*
 00704F68    push        ebx
 00704F69    push        esi
 00704F6A    call        @BeforeDestruction
 00704F6F    mov         ebx,edx
 00704F71    mov         esi,eax
 00704F73    mov         eax,esi
 00704F75    call        TCustomAdapter.ReleaseOleObject
 00704F7A    mov         edx,ebx
 00704F7C    and         dl,0FC
 00704F7F    mov         eax,esi
 00704F81    call        TObject.Destroy
 00704F86    test        bl,bl
>00704F88    jle         00704F91
 00704F8A    mov         eax,esi
 00704F8C    call        @ClassDestroy
 00704F91    pop         esi
 00704F92    pop         ebx
 00704F93    ret
*}
end;

//00704F94
procedure TCustomAdapter.Changed;
begin
{*
 00704F94    cmp         byte ptr [eax+18],0
>00704F98    jne         00704F9F
 00704F9A    call        TCustomAdapter.ReleaseOleObject
 00704F9F    ret
*}
end;

//00704FA0
procedure TCustomAdapter.ConnectOleObject(OleObject:IUnknown);
begin
{*
 00704FA0    push        ebp
 00704FA1    mov         ebp,esp
 00704FA3    push        ecx
 00704FA4    push        ebx
 00704FA5    mov         dword ptr [ebp-4],edx
 00704FA8    mov         ebx,eax
 00704FAA    mov         eax,dword ptr [ebp-4]
 00704FAD    call        @IntfAddRef
 00704FB2    xor         eax,eax
 00704FB4    push        ebp
 00704FB5    push        705008
 00704FBA    push        dword ptr fs:[eax]
 00704FBD    mov         dword ptr fs:[eax],esp
 00704FC0    cmp         dword ptr [ebx+0C],0
>00704FC4    je          00704FCD
 00704FC6    mov         eax,ebx
 00704FC8    call        TCustomAdapter.ReleaseOleObject
 00704FCD    cmp         dword ptr [ebp-4],0
>00704FD1    je          00704FE7
 00704FD3    lea         eax,[ebx+10]
 00704FD6    push        eax
 00704FD7    mov         edx,705014
 00704FDC    mov         ecx,dword ptr [ebx+14]
 00704FDF    mov         eax,dword ptr [ebp-4]
 00704FE2    call        InterfaceConnect
 00704FE7    lea         eax,[ebx+0C]
 00704FEA    mov         edx,dword ptr [ebp-4]
 00704FED    call        @IntfCopy
 00704FF2    xor         eax,eax
 00704FF4    pop         edx
 00704FF5    pop         ecx
 00704FF6    pop         ecx
 00704FF7    mov         dword ptr fs:[eax],edx
 00704FFA    push        70500F
 00704FFF    lea         eax,[ebp-4]
 00705002    call        @IntfClear
 00705007    ret
>00705008    jmp         @HandleFinally
>0070500D    jmp         00704FFF
 0070500F    pop         ebx
 00705010    pop         ecx
 00705011    pop         ebp
 00705012    ret
*}
end;

//00705024
procedure TCustomAdapter.ReleaseOleObject;
begin
{*
 00705024    push        ebx
 00705025    mov         ebx,eax
 00705027    lea         ecx,[ebx+10]
 0070502A    mov         edx,705044
 0070502F    mov         eax,dword ptr [ebx+0C]
 00705032    call        InterfaceDisconnect
 00705037    lea         eax,[ebx+0C]
 0070503A    call        @IntfClear
 0070503F    pop         ebx
 00705040    ret
*}
end;

//00705054
constructor TAdapterNotifier.Create;
begin
{*
 00705054    push        ebx
 00705055    push        esi
 00705056    push        edi
 00705057    test        dl,dl
>00705059    je          00705063
 0070505B    add         esp,0FFFFFFF0
 0070505E    call        @ClassCreate
 00705063    mov         esi,ecx
 00705065    mov         ebx,edx
 00705067    mov         edi,eax
 00705069    xor         edx,edx
 0070506B    mov         eax,edi
 0070506D    call        TObject.Create
 00705072    mov         dword ptr [edi+0C],esi
 00705075    mov         eax,edi
 00705077    test        bl,bl
>00705079    je          0070508A
 0070507B    call        @AfterConstruction
 00705080    pop         dword ptr fs:[0]
 00705087    add         esp,0C
 0070508A    mov         eax,edi
 0070508C    pop         edi
 0070508D    pop         esi
 0070508E    pop         ebx
 0070508F    ret
*}
end;

//00705090
function TAdapterNotifier.OnChanged(dispid:TDispID):HRESULT; stdcall;
begin
{*
 00705090    push        ebp
 00705091    mov         ebp,esp
 00705093    push        ebx
 00705094    push        esi
 00705095    push        edi
 00705096    mov         eax,dword ptr [ebp+8]
 00705099    xor         edx,edx
 0070509B    push        ebp
 0070509C    push        7050BB
 007050A1    push        dword ptr fs:[edx]
 007050A4    mov         dword ptr fs:[edx],esp
 007050A7    mov         eax,dword ptr [eax+0C]
 007050AA    mov         edx,dword ptr [eax]
 007050AC    call        dword ptr [edx+4]
 007050AF    xor         ebx,ebx
 007050B1    xor         eax,eax
 007050B3    pop         edx
 007050B4    pop         ecx
 007050B5    pop         ecx
 007050B6    mov         dword ptr fs:[eax],edx
>007050B9    jmp         007050CC
>007050BB    jmp         @HandleAnyException
 007050C0    call        HandleException
 007050C5    mov         ebx,eax
 007050C7    call        @DoneExcept
 007050CC    mov         eax,ebx
 007050CE    pop         edi
 007050CF    pop         esi
 007050D0    pop         ebx
 007050D1    pop         ebp
 007050D2    ret         8
*}
end;

//007050D8
function TActiveXControl.EnableModeless(fEnable:BOOL):HRESULT; stdcall;
begin
{*
 007050D8    push        ebp
 007050D9    mov         ebp,esp
 007050DB    xor         eax,eax
 007050DD    pop         ebp
 007050DE    ret         8
*}
end;

//007050E4
constructor TFontAdapter.Create;
begin
{*
 007050E4    push        ebx
 007050E5    push        esi
 007050E6    push        edi
 007050E7    test        dl,dl
>007050E9    je          007050F3
 007050EB    add         esp,0FFFFFFF0
 007050EE    call        @ClassCreate
 007050F3    mov         esi,ecx
 007050F5    mov         ebx,edx
 007050F7    mov         edi,eax
 007050F9    xor         edx,edx
 007050FB    mov         eax,edi
 007050FD    call        TCustomAdapter.Create
 00705102    mov         dword ptr [edi+1C],esi
 00705105    mov         eax,edi
 00705107    test        bl,bl
>00705109    je          0070511A
 0070510B    call        @AfterConstruction
 00705110    pop         dword ptr fs:[0]
 00705117    add         esp,0C
 0070511A    mov         eax,edi
 0070511C    pop         edi
 0070511D    pop         esi
 0070511E    pop         ebx
 0070511F    ret
*}
end;

//00705120
procedure TFontAdapter.Update;
begin
{*
 00705120    push        ebp
 00705121    mov         ebp,esp
 00705123    add         esp,0FFFFFFDC
 00705126    push        ebx
 00705127    xor         edx,edx
 00705129    mov         dword ptr [ebp-24],edx
 0070512C    mov         dword ptr [ebp-4],edx
 0070512F    mov         dword ptr [ebp-8],edx
 00705132    mov         dword ptr [ebp-0C],eax
 00705135    xor         eax,eax
 00705137    push        ebp
 00705138    push        7052C6
 0070513D    push        dword ptr fs:[eax]
 00705140    mov         dword ptr fs:[eax],esp
 00705143    mov         eax,dword ptr [ebp-0C]
 00705146    cmp         byte ptr [eax+18],0
>0070514A    jne         007052A0
 00705150    lea         eax,[ebp-8]
 00705153    mov         edx,dword ptr [ebp-0C]
 00705156    mov         edx,dword ptr [edx+0C]
 00705159    mov         ecx,7052D4
 0070515E    call        @IntfCast
 00705163    cmp         dword ptr [ebp-8],0
>00705167    je          007052A0
 0070516D    lea         eax,[ebp-4]
 00705170    call        @WStrClr
 00705175    push        eax
 00705176    mov         eax,dword ptr [ebp-8]
 00705179    push        eax
 0070517A    mov         eax,dword ptr [eax]
 0070517C    call        dword ptr [eax+0C]
 0070517F    lea         eax,[ebp-18]
 00705182    push        eax
 00705183    mov         eax,dword ptr [ebp-8]
 00705186    push        eax
 00705187    mov         eax,dword ptr [eax]
 00705189    call        dword ptr [eax+14]
 0070518C    movzx       ebx,byte ptr ds:[7052E4]
 00705193    lea         eax,[ebp-1C]
 00705196    push        eax
 00705197    mov         eax,dword ptr [ebp-8]
 0070519A    push        eax
 0070519B    mov         eax,dword ptr [eax]
 0070519D    call        dword ptr [eax+1C]
 007051A0    cmp         dword ptr [ebp-1C],0
>007051A4    je          007051A9
 007051A6    or          bl,1
 007051A9    lea         eax,[ebp-1C]
 007051AC    push        eax
 007051AD    mov         eax,dword ptr [ebp-8]
 007051B0    push        eax
 007051B1    mov         eax,dword ptr [eax]
 007051B3    call        dword ptr [eax+24]
 007051B6    cmp         dword ptr [ebp-1C],0
>007051BA    je          007051BF
 007051BC    or          bl,2
 007051BF    lea         eax,[ebp-1C]
 007051C2    push        eax
 007051C3    mov         eax,dword ptr [ebp-8]
 007051C6    push        eax
 007051C7    mov         eax,dword ptr [eax]
 007051C9    call        dword ptr [eax+2C]
 007051CC    cmp         dword ptr [ebp-1C],0
>007051D0    je          007051D5
 007051D2    or          bl,4
 007051D5    lea         eax,[ebp-1C]
 007051D8    push        eax
 007051D9    mov         eax,dword ptr [ebp-8]
 007051DC    push        eax
 007051DD    mov         eax,dword ptr [eax]
 007051DF    call        dword ptr [eax+34]
 007051E2    cmp         dword ptr [ebp-1C],0
>007051E6    je          007051EB
 007051E8    or          bl,8
 007051EB    lea         eax,[ebp-1E]
 007051EE    push        eax
 007051EF    mov         eax,dword ptr [ebp-8]
 007051F2    push        eax
 007051F3    mov         eax,dword ptr [eax]
 007051F5    call        dword ptr [eax+44]
 007051F8    mov         dl,1
 007051FA    mov         eax,[0045FAE8];TFont
 007051FF    call        TFont.Create
 00705204    mov         dword ptr [ebp-10],eax
 00705207    mov         eax,dword ptr [ebp-0C]
 0070520A    mov         byte ptr [eax+18],1
 0070520E    xor         eax,eax
 00705210    push        ebp
 00705211    push        705299
 00705216    push        dword ptr fs:[eax]
 00705219    mov         dword ptr fs:[eax],esp
 0070521C    mov         eax,dword ptr [ebp-0C]
 0070521F    mov         edx,dword ptr [eax+1C]
 00705222    mov         eax,dword ptr [ebp-10]
 00705225    mov         ecx,dword ptr [eax]
 00705227    call        dword ptr [ecx+8]
 0070522A    lea         eax,[ebp-24]
 0070522D    mov         edx,dword ptr [ebp-4]
 00705230    call        @UStrFromWStr
 00705235    mov         edx,dword ptr [ebp-24]
 00705238    mov         eax,dword ptr [ebp-10]
 0070523B    call        TFont.SetName
 00705240    fild        qword ptr [ebp-18]
 00705243    fdiv        dword ptr ds:[7052E8]
 00705249    call        @ROUND
 0070524E    mov         edx,eax
 00705250    mov         eax,dword ptr [ebp-10]
 00705253    call        TFont.SetSize
 00705258    mov         edx,ebx
 0070525A    mov         eax,dword ptr [ebp-10]
 0070525D    call        TFont.SetStyle
 00705262    movzx       edx,byte ptr [ebp-1E]
 00705266    mov         eax,dword ptr [ebp-10]
 00705269    call        TFont.SetCharset
 0070526E    mov         eax,dword ptr [ebp-0C]
 00705271    mov         eax,dword ptr [eax+1C]
 00705274    mov         edx,dword ptr [ebp-10]
 00705277    mov         ecx,dword ptr [eax]
 00705279    call        dword ptr [ecx+8]
 0070527C    xor         eax,eax
 0070527E    pop         edx
 0070527F    pop         ecx
 00705280    pop         ecx
 00705281    mov         dword ptr fs:[eax],edx
 00705284    push        7052A0
 00705289    mov         eax,dword ptr [ebp-0C]
 0070528C    mov         byte ptr [eax+18],0
 00705290    mov         eax,dword ptr [ebp-10]
 00705293    call        TObject.Free
 00705298    ret
>00705299    jmp         @HandleFinally
>0070529E    jmp         00705289
 007052A0    xor         eax,eax
 007052A2    pop         edx
 007052A3    pop         ecx
 007052A4    pop         ecx
 007052A5    mov         dword ptr fs:[eax],edx
 007052A8    push        7052CD
 007052AD    lea         eax,[ebp-24]
 007052B0    call        @UStrClr
 007052B5    lea         eax,[ebp-8]
 007052B8    call        @IntfClear
 007052BD    lea         eax,[ebp-4]
 007052C0    call        @WStrClr
 007052C5    ret
>007052C6    jmp         @HandleFinally
>007052CB    jmp         007052AD
 007052CD    pop         ebx
 007052CE    mov         esp,ebp
 007052D0    pop         ebp
 007052D1    ret
*}
end;

//007052EC
procedure TFontAdapter.Changed;
begin
{*
 007052EC    push        ebp
 007052ED    mov         ebp,esp
 007052EF    xor         ecx,ecx
 007052F1    push        ecx
 007052F2    push        ecx
 007052F3    push        ecx
 007052F4    push        ecx
 007052F5    push        ecx
 007052F6    mov         dword ptr [ebp-8],eax
 007052F9    xor         eax,eax
 007052FB    push        ebp
 007052FC    push        705470
 00705301    push        dword ptr fs:[eax]
 00705304    mov         dword ptr fs:[eax],esp
 00705307    mov         eax,dword ptr [ebp-8]
 0070530A    cmp         byte ptr [eax+18],0
>0070530E    jne         0070544A
 00705314    mov         eax,dword ptr [ebp-8]
 00705317    cmp         dword ptr [eax+0C],0
>0070531B    je          0070544A
 00705321    mov         eax,dword ptr [ebp-8]
 00705324    mov         byte ptr [eax+18],1
 00705328    xor         edx,edx
 0070532A    push        ebp
 0070532B    push        705443
 00705330    push        dword ptr fs:[edx]
 00705333    mov         dword ptr fs:[edx],esp
 00705336    lea         eax,[ebp-4]
 00705339    mov         edx,dword ptr [ebp-8]
 0070533C    mov         edx,dword ptr [edx+0C]
 0070533F    mov         ecx,70547C
 00705344    call        @IntfCast
 00705349    lea         edx,[ebp-10]
 0070534C    mov         eax,dword ptr [ebp-8]
 0070534F    mov         eax,dword ptr [eax+1C]
 00705352    call        TFont.GetName
 00705357    mov         edx,dword ptr [ebp-10]
 0070535A    lea         eax,[ebp-0C]
 0070535D    call        @WStrFromUStr
 00705362    mov         eax,dword ptr [ebp-0C]
 00705365    push        eax
 00705366    mov         eax,dword ptr [ebp-4]
 00705369    push        eax
 0070536A    mov         eax,dword ptr [eax]
 0070536C    call        dword ptr [eax+10]
 0070536F    mov         eax,dword ptr [ebp-8]
 00705372    mov         eax,dword ptr [eax+1C]
 00705375    call        TFont.GetSize
 0070537A    mov         dword ptr [ebp-14],eax
 0070537D    fild        dword ptr [ebp-14]
 00705380    fmul        dword ptr ds:[70548C]
 00705386    add         esp,0FFFFFFF8
 00705389    fistp       qword ptr [esp]
 0070538C    wait
 0070538D    mov         eax,dword ptr [ebp-4]
 00705390    push        eax
 00705391    mov         eax,dword ptr [eax]
 00705393    call        dword ptr [eax+18]
 00705396    mov         eax,dword ptr [ebp-8]
 00705399    mov         eax,dword ptr [eax+1C]
 0070539C    mov         eax,dword ptr [eax+10]
 0070539F    movzx       eax,byte ptr [eax+21]
 007053A3    test        al,1
 007053A5    setne       al
 007053A8    neg         al
 007053AA    sbb         eax,eax
 007053AC    push        eax
 007053AD    mov         eax,dword ptr [ebp-4]
 007053B0    push        eax
 007053B1    mov         eax,dword ptr [eax]
 007053B3    call        dword ptr [eax+20]
 007053B6    mov         eax,dword ptr [ebp-8]
 007053B9    mov         eax,dword ptr [eax+1C]
 007053BC    mov         eax,dword ptr [eax+10]
 007053BF    movzx       eax,byte ptr [eax+21]
 007053C3    test        al,2
 007053C5    setne       al
 007053C8    neg         al
 007053CA    sbb         eax,eax
 007053CC    push        eax
 007053CD    mov         eax,dword ptr [ebp-4]
 007053D0    push        eax
 007053D1    mov         eax,dword ptr [eax]
 007053D3    call        dword ptr [eax+28]
 007053D6    mov         eax,dword ptr [ebp-8]
 007053D9    mov         eax,dword ptr [eax+1C]
 007053DC    mov         eax,dword ptr [eax+10]
 007053DF    movzx       eax,byte ptr [eax+21]
 007053E3    test        al,4
 007053E5    setne       al
 007053E8    neg         al
 007053EA    sbb         eax,eax
 007053EC    push        eax
 007053ED    mov         eax,dword ptr [ebp-4]
 007053F0    push        eax
 007053F1    mov         eax,dword ptr [eax]
 007053F3    call        dword ptr [eax+30]
 007053F6    mov         eax,dword ptr [ebp-8]
 007053F9    mov         eax,dword ptr [eax+1C]
 007053FC    mov         eax,dword ptr [eax+10]
 007053FF    movzx       eax,byte ptr [eax+21]
 00705403    test        al,8
 00705405    setne       al
 00705408    neg         al
 0070540A    sbb         eax,eax
 0070540C    push        eax
 0070540D    mov         eax,dword ptr [ebp-4]
 00705410    push        eax
 00705411    mov         eax,dword ptr [eax]
 00705413    call        dword ptr [eax+38]
 00705416    mov         eax,dword ptr [ebp-8]
 00705419    mov         eax,dword ptr [eax+1C]
 0070541C    call        TFont.GetCharset
 00705421    movzx       eax,al
 00705424    push        eax
 00705425    mov         eax,dword ptr [ebp-4]
 00705428    push        eax
 00705429    mov         eax,dword ptr [eax]
 0070542B    call        dword ptr [eax+48]
 0070542E    xor         eax,eax
 00705430    pop         edx
 00705431    pop         ecx
 00705432    pop         ecx
 00705433    mov         dword ptr fs:[eax],edx
 00705436    push        70544A
 0070543B    mov         eax,dword ptr [ebp-8]
 0070543E    mov         byte ptr [eax+18],0
 00705442    ret
>00705443    jmp         @HandleFinally
>00705448    jmp         0070543B
 0070544A    xor         eax,eax
 0070544C    pop         edx
 0070544D    pop         ecx
 0070544E    pop         ecx
 0070544F    mov         dword ptr fs:[eax],edx
 00705452    push        705477
 00705457    lea         eax,[ebp-10]
 0070545A    call        @UStrClr
 0070545F    lea         eax,[ebp-0C]
 00705462    call        @WStrClr
 00705467    lea         eax,[ebp-4]
 0070546A    call        @IntfClear
 0070546F    ret
>00705470    jmp         @HandleFinally
>00705475    jmp         00705457
 00705477    mov         esp,ebp
 00705479    pop         ebp
 0070547A    ret
*}
end;

//00705490
procedure TFontAdapter.GetOleFont(var OleFont:IFontDisp);
begin
{*
 00705490    push        ebp
 00705491    mov         ebp,esp
 00705493    add         esp,0FFFFFFC8
 00705496    push        ebx
 00705497    push        esi
 00705498    xor         ecx,ecx
 0070549A    mov         dword ptr [ebp-34],ecx
 0070549D    mov         dword ptr [ebp-4],ecx
 007054A0    mov         dword ptr [ebp-8],ecx
 007054A3    mov         dword ptr [ebp-0C],edx
 007054A6    mov         ebx,eax
 007054A8    xor         eax,eax
 007054AA    push        ebp
 007054AB    push        7055C8
 007054B0    push        dword ptr fs:[eax]
 007054B3    mov         dword ptr fs:[eax],esp
 007054B6    cmp         dword ptr [ebx+0C],0
>007054BA    jne         00705592
 007054C0    lea         edx,[ebp-34]
 007054C3    mov         eax,dword ptr [ebx+1C]
 007054C6    call        TFont.GetName
 007054CB    mov         edx,dword ptr [ebp-34]
 007054CE    lea         eax,[ebp-4]
 007054D1    call        @WStrFromUStr
 007054D6    mov         dword ptr [ebp-30],20
 007054DD    mov         eax,dword ptr [ebp-4]
 007054E0    call        @WStrToPWChar
 007054E5    mov         dword ptr [ebp-2C],eax
 007054E8    mov         eax,dword ptr [ebx+1C]
 007054EB    call        TFont.GetSize
 007054F0    mov         dword ptr [ebp-38],eax
 007054F3    fild        dword ptr [ebp-38]
 007054F6    fmul        dword ptr ds:[7055D8]
 007054FC    fistp       qword ptr [ebp-28]
 007054FF    wait
 00705500    mov         esi,dword ptr [ebx+1C]
 00705503    mov         eax,dword ptr [esi+10]
 00705506    movzx       eax,byte ptr [eax+21]
 0070550A    test        al,1
>0070550C    je          00705516
 0070550E    mov         word ptr [ebp-20],2BC
>00705514    jmp         0070551C
 00705516    mov         word ptr [ebp-20],190
 0070551C    mov         eax,esi
 0070551E    call        TFont.GetCharset
 00705523    movzx       eax,al
 00705526    mov         word ptr [ebp-1E],ax
 0070552A    mov         eax,dword ptr [ebx+1C]
 0070552D    mov         eax,dword ptr [eax+10]
 00705530    movzx       eax,byte ptr [eax+21]
 00705534    test        al,2
 00705536    setne       al
 00705539    neg         al
 0070553B    sbb         eax,eax
 0070553D    mov         dword ptr [ebp-1C],eax
 00705540    mov         eax,dword ptr [ebx+1C]
 00705543    mov         eax,dword ptr [eax+10]
 00705546    movzx       eax,byte ptr [eax+21]
 0070554A    test        al,4
 0070554C    setne       al
 0070554F    neg         al
 00705551    sbb         eax,eax
 00705553    mov         dword ptr [ebp-18],eax
 00705556    mov         eax,dword ptr [ebx+1C]
 00705559    mov         eax,dword ptr [eax+10]
 0070555C    movzx       eax,byte ptr [eax+21]
 00705560    test        al,8
 00705562    setne       al
 00705565    neg         al
 00705567    sbb         eax,eax
 00705569    mov         dword ptr [ebp-14],eax
 0070556C    lea         eax,[ebp-8]
 0070556F    call        @IntfClear
 00705574    mov         ecx,eax
 00705576    mov         edx,7055DC
 0070557B    lea         eax,[ebp-30]
 0070557E    call        OleCreateFontIndirect
 00705583    call        OleCheck
 00705588    mov         edx,dword ptr [ebp-8]
 0070558B    mov         eax,ebx
 0070558D    call        TCustomAdapter.ConnectOleObject
 00705592    mov         eax,dword ptr [ebp-0C]
 00705595    mov         edx,dword ptr [ebx+0C]
 00705598    mov         ecx,7055EC
 0070559D    call        @IntfCast
 007055A2    xor         eax,eax
 007055A4    pop         edx
 007055A5    pop         ecx
 007055A6    pop         ecx
 007055A7    mov         dword ptr fs:[eax],edx
 007055AA    push        7055CF
 007055AF    lea         eax,[ebp-34]
 007055B2    call        @UStrClr
 007055B7    lea         eax,[ebp-8]
 007055BA    call        @IntfClear
 007055BF    lea         eax,[ebp-4]
 007055C2    call        @WStrClr
 007055C7    ret
>007055C8    jmp         @HandleFinally
>007055CD    jmp         007055AF
 007055CF    pop         esi
 007055D0    pop         ebx
 007055D1    mov         esp,ebp
 007055D3    pop         ebp
 007055D4    ret
*}
end;

//007055FC
procedure TFontAdapter.SetOleFont(const OleFont:IFontDisp);
begin
{*
 007055FC    push        ebp
 007055FD    mov         ebp,esp
 007055FF    push        0
 00705601    push        ebx
 00705602    push        esi
 00705603    mov         esi,edx
 00705605    mov         ebx,eax
 00705607    xor         eax,eax
 00705609    push        ebp
 0070560A    push        70564B
 0070560F    push        dword ptr fs:[eax]
 00705612    mov         dword ptr fs:[eax],esp
 00705615    lea         eax,[ebp-4]
 00705618    mov         edx,esi
 0070561A    mov         ecx,705658
 0070561F    call        @IntfCast
 00705624    mov         edx,dword ptr [ebp-4]
 00705627    mov         eax,ebx
 00705629    call        TCustomAdapter.ConnectOleObject
 0070562E    mov         eax,ebx
 00705630    mov         edx,dword ptr [eax]
 00705632    call        dword ptr [edx+4]
 00705635    xor         eax,eax
 00705637    pop         edx
 00705638    pop         ecx
 00705639    pop         ecx
 0070563A    mov         dword ptr fs:[eax],edx
 0070563D    push        705652
 00705642    lea         eax,[ebp-4]
 00705645    call        @IntfClear
 0070564A    ret
>0070564B    jmp         @HandleFinally
>00705650    jmp         00705642
 00705652    pop         esi
 00705653    pop         ebx
 00705654    pop         ecx
 00705655    pop         ebp
 00705656    ret
*}
end;

//00705668
constructor TPictureAdapter.Create;
begin
{*
 00705668    push        ebx
 00705669    push        esi
 0070566A    push        edi
 0070566B    test        dl,dl
>0070566D    je          00705677
 0070566F    add         esp,0FFFFFFF0
 00705672    call        @ClassCreate
 00705677    mov         esi,ecx
 00705679    mov         ebx,edx
 0070567B    mov         edi,eax
 0070567D    xor         edx,edx
 0070567F    mov         eax,edi
 00705681    call        TCustomAdapter.Create
 00705686    mov         dword ptr [edi+1C],esi
 00705689    mov         eax,edi
 0070568B    test        bl,bl
>0070568D    je          0070569E
 0070568F    call        @AfterConstruction
 00705694    pop         dword ptr fs:[0]
 0070569B    add         esp,0C
 0070569E    mov         eax,edi
 007056A0    pop         edi
 007056A1    pop         esi
 007056A2    pop         ebx
 007056A3    ret
*}
end;

//007056A4
procedure TPictureAdapter.Update;
begin
{*
 007056A4    push        ebp
 007056A5    mov         ebp,esp
 007056A7    add         esp,0FFFFFFF8
 007056AA    mov         dword ptr [ebp-4],eax
 007056AD    mov         eax,dword ptr [ebp-4]
 007056B0    mov         byte ptr [eax+18],1
 007056B4    mov         dl,1
 007056B6    mov         eax,[00704974];TOleGraphic
 007056BB    call        TOleGraphic.Create
 007056C0    mov         dword ptr [ebp-8],eax
 007056C3    xor         eax,eax
 007056C5    push        ebp
 007056C6    push        705712
 007056CB    push        dword ptr fs:[eax]
 007056CE    mov         dword ptr fs:[eax],esp
 007056D1    mov         eax,dword ptr [ebp-8]
 007056D4    add         eax,28
 007056D7    mov         edx,dword ptr [ebp-4]
 007056DA    mov         edx,dword ptr [edx+0C]
 007056DD    mov         ecx,705720
 007056E2    call        @IntfCast
 007056E7    mov         eax,dword ptr [ebp-4]
 007056EA    mov         eax,dword ptr [eax+1C]
 007056ED    mov         edx,dword ptr [ebp-8]
 007056F0    call        TPicture.SetGraphic
 007056F5    xor         eax,eax
 007056F7    pop         edx
 007056F8    pop         ecx
 007056F9    pop         ecx
 007056FA    mov         dword ptr fs:[eax],edx
 007056FD    push        705719
 00705702    mov         eax,dword ptr [ebp-4]
 00705705    mov         byte ptr [eax+18],0
 00705709    mov         eax,dword ptr [ebp-8]
 0070570C    call        TObject.Free
 00705711    ret
>00705712    jmp         @HandleFinally
>00705717    jmp         00705702
 00705719    pop         ecx
 0070571A    pop         ecx
 0070571B    pop         ebp
 0070571C    ret
*}
end;

//00705730
procedure TPictureAdapter.GetOlePicture(var OlePicture:IPictureDisp);
begin
{*
 00705730    push        ebp
 00705731    mov         ebp,esp
 00705733    add         esp,0FFFFFFD4
 00705736    push        ebx
 00705737    push        esi
 00705738    mov         dword ptr [ebp-8],edx
 0070573B    mov         dword ptr [ebp-4],eax
 0070573E    mov         eax,dword ptr [ebp-4]
 00705741    cmp         dword ptr [eax+0C],0
>00705745    jne         0070592A
 0070574B    mov         byte ptr [ebp-9],0
 0070574F    mov         dword ptr [ebp-2C],14
 00705756    mov         eax,dword ptr [ebp-4]
 00705759    mov         esi,dword ptr [eax+1C]
 0070575C    mov         ebx,dword ptr [esi+0C]
 0070575F    mov         eax,ebx
 00705761    mov         edx,dword ptr ds:[463B28];TBitmap
 00705767    call        @IsClass
 0070576C    test        al,al
>0070576E    je          007057DC
 00705770    mov         dword ptr [ebp-28],1
 00705777    mov         dl,1
 00705779    mov         eax,[00463B28];TBitmap
 0070577E    call        TBitmap.Create
 00705783    mov         dword ptr [ebp-14],eax
 00705786    xor         eax,eax
 00705788    push        ebp
 00705789    push        7057D5
 0070578E    push        dword ptr fs:[eax]
 00705791    mov         dword ptr fs:[eax],esp
 00705794    mov         eax,dword ptr [ebp-4]
 00705797    mov         eax,dword ptr [eax+1C]
 0070579A    mov         edx,dword ptr [eax+0C]
 0070579D    mov         eax,dword ptr [ebp-14]
 007057A0    mov         ecx,dword ptr [eax]
 007057A2    call        dword ptr [ecx+8]
 007057A5    mov         eax,dword ptr [ebp-14]
 007057A8    call        TBitmap.ReleaseHandle
 007057AD    mov         dword ptr [ebp-24],eax
 007057B0    mov         eax,dword ptr [ebp-14]
 007057B3    call        TBitmap.ReleasePalette
 007057B8    mov         dword ptr [ebp-20],eax
 007057BB    mov         byte ptr [ebp-9],1
 007057BF    xor         eax,eax
 007057C1    pop         edx
 007057C2    pop         ecx
 007057C3    pop         ecx
 007057C4    mov         dword ptr fs:[eax],edx
 007057C7    push        7058FB
 007057CC    mov         eax,dword ptr [ebp-14]
 007057CF    call        TObject.Free
 007057D4    ret
>007057D5    jmp         @HandleFinally
>007057DA    jmp         007057CC
 007057DC    mov         eax,ebx
 007057DE    mov         edx,dword ptr ds:[464454];TIcon
 007057E4    call        @IsClass
 007057E9    test        al,al
>007057EB    je          00705808
 007057ED    mov         dword ptr [ebp-28],3
 007057F4    mov         eax,esi
 007057F6    call        TPicture.GetIcon
 007057FB    call        TIcon.GetHandle
 00705800    mov         dword ptr [ebp-24],eax
>00705803    jmp         007058FB
 00705808    mov         dword ptr [ebp-28],4
 0070580F    mov         eax,ebx
 00705811    mov         edx,dword ptr ds:[4632EC];TMetafile
 00705817    call        @IsClass
 0070581C    test        al,al
>0070581E    jne         007058EC
 00705824    mov         dl,1
 00705826    mov         eax,[004632EC];TMetafile
 0070582B    call        TMetafile.Create
 00705830    mov         dword ptr [ebp-10],eax
 00705833    xor         eax,eax
 00705835    push        ebp
 00705836    push        7058E5
 0070583B    push        dword ptr fs:[eax]
 0070583E    mov         dword ptr fs:[eax],esp
 00705841    mov         eax,dword ptr [ebp-4]
 00705844    mov         eax,dword ptr [eax+1C]
 00705847    call        TPicture.GetWidth
 0070584C    mov         edx,eax
 0070584E    mov         eax,dword ptr [ebp-10]
 00705851    mov         ecx,dword ptr [eax]
 00705853    call        dword ptr [ecx+44]
 00705856    mov         eax,dword ptr [ebp-4]
 00705859    mov         eax,dword ptr [eax+1C]
 0070585C    call        TPicture.GetHeight
 00705861    mov         edx,eax
 00705863    mov         eax,dword ptr [ebp-10]
 00705866    mov         ecx,dword ptr [eax]
 00705868    call        dword ptr [ecx+38]
 0070586B    push        0
 0070586D    mov         ecx,dword ptr [ebp-10]
 00705870    mov         dl,1
 00705872    mov         eax,[00462E34];TMetafileCanvas
 00705877    call        TMetafileCanvas.Create
 0070587C    mov         dword ptr [ebp-18],eax
 0070587F    xor         eax,eax
 00705881    push        ebp
 00705882    push        7058B9
 00705887    push        dword ptr fs:[eax]
 0070588A    mov         dword ptr fs:[eax],esp
 0070588D    mov         eax,dword ptr [ebp-4]
 00705890    mov         eax,dword ptr [eax+1C]
 00705893    mov         eax,dword ptr [eax+0C]
 00705896    push        eax
 00705897    xor         ecx,ecx
 00705899    xor         edx,edx
 0070589B    mov         eax,dword ptr [ebp-18]
 0070589E    mov         ebx,dword ptr [eax]
 007058A0    call        dword ptr [ebx+44]
 007058A3    xor         eax,eax
 007058A5    pop         edx
 007058A6    pop         ecx
 007058A7    pop         ecx
 007058A8    mov         dword ptr fs:[eax],edx
 007058AB    push        7058C0
 007058B0    mov         eax,dword ptr [ebp-18]
 007058B3    call        TObject.Free
 007058B8    ret
>007058B9    jmp         @HandleFinally
>007058BE    jmp         007058B0
 007058C0    mov         eax,dword ptr [ebp-10]
 007058C3    call        TMetafile.ReleaseHandle
 007058C8    mov         dword ptr [ebp-24],eax
 007058CB    mov         byte ptr [ebp-9],1
 007058CF    xor         eax,eax
 007058D1    pop         edx
 007058D2    pop         ecx
 007058D3    pop         ecx
 007058D4    mov         dword ptr fs:[eax],edx
 007058D7    push        7058FB
 007058DC    mov         eax,dword ptr [ebp-10]
 007058DF    call        TObject.Free
 007058E4    ret
>007058E5    jmp         @HandleFinally
>007058EA    jmp         007058DC
 007058EC    mov         eax,esi
 007058EE    call        TPicture.GetMetafile
 007058F3    call        TMetafile.GetHandle
 007058F8    mov         dword ptr [ebp-24],eax
 007058FB    mov         eax,dword ptr [ebp-8]
 007058FE    call        @IntfClear
 00705903    push        eax
 00705904    cmp         byte ptr [ebp-9],1
 00705908    cmc
 00705909    sbb         ecx,ecx
 0070590B    mov         edx,705944
 00705910    lea         eax,[ebp-2C]
 00705913    call        OleCreatePictureIndirect
 00705918    call        OleCheck
 0070591D    mov         edx,dword ptr [ebp-8]
 00705920    mov         edx,dword ptr [edx]
 00705922    mov         eax,dword ptr [ebp-4]
 00705925    call        TCustomAdapter.ConnectOleObject
 0070592A    mov         eax,dword ptr [ebp-8]
 0070592D    mov         edx,dword ptr [ebp-4]
 00705930    mov         edx,dword ptr [edx+0C]
 00705933    mov         ecx,705954
 00705938    call        @IntfCast
 0070593D    pop         esi
 0070593E    pop         ebx
 0070593F    mov         esp,ebp
 00705941    pop         ebp
 00705942    ret
*}
end;

//00705964
procedure TPictureAdapter.SetOlePicture(const OlePicture:IPictureDisp);
begin
{*
 00705964    push        ebx
 00705965    mov         ebx,eax
 00705967    mov         eax,ebx
 00705969    call        TCustomAdapter.ConnectOleObject
 0070596E    mov         eax,ebx
 00705970    mov         edx,dword ptr [eax]
 00705972    call        dword ptr [edx+4]
 00705975    pop         ebx
 00705976    ret
*}
end;

//00705978
constructor TOleGraphic.Create();
begin
{*
 00705978    push        ebx
 00705979    push        esi
 0070597A    test        dl,dl
>0070597C    je          00705986
 0070597E    add         esp,0FFFFFFF0
 00705981    call        @ClassCreate
 00705986    mov         ebx,edx
 00705988    mov         esi,eax
 0070598A    xor         edx,edx
 0070598C    mov         eax,esi
 0070598E    call        TGraphic.Create
 00705993    mov         eax,esi
 00705995    test        bl,bl
>00705997    je          007059A8
 00705999    call        @AfterConstruction
 0070599E    pop         dword ptr fs:[0]
 007059A5    add         esp,0C
 007059A8    mov         eax,esi
 007059AA    pop         esi
 007059AB    pop         ebx
 007059AC    ret
*}
end;

//007059B0
procedure TOleGraphic.Assign(Source:TPersistent);
begin
{*
 007059B0    push        ebx
 007059B1    push        esi
 007059B2    mov         esi,edx
 007059B4    mov         ebx,eax
 007059B6    mov         eax,esi
 007059B8    mov         edx,dword ptr ds:[704974];TOleGraphic
 007059BE    call        @IsClass
 007059C3    test        al,al
>007059C5    je          007059D5
 007059C7    lea         eax,[ebx+28]
 007059CA    mov         edx,dword ptr [esi+28]
 007059CD    call        @IntfCopy
 007059D2    pop         esi
 007059D3    pop         ebx
 007059D4    ret
 007059D5    mov         edx,esi
 007059D7    mov         eax,ebx
 007059D9    call        TPersistent.Assign
 007059DE    pop         esi
 007059DF    pop         ebx
 007059E0    ret
*}
end;

//007059E4
procedure TOleGraphic.Changed(Sender:TObject);
begin
{*
 007059E4    ret
*}
end;

//007059E8
procedure TOleGraphic.Draw(ACanvas:TCanvas; const Rect:TRect);
begin
{*
 007059E8    push        ebp
 007059E9    mov         ebp,esp
 007059EB    add         esp,0FFFFFFF0
 007059EE    push        ebx
 007059EF    push        esi
 007059F0    push        edi
 007059F1    mov         esi,ecx
 007059F3    mov         dword ptr [ebp-4],edx
 007059F6    mov         ebx,eax
 007059F8    cmp         dword ptr [ebx+28],0
>007059FC    je          00705AED
 00705A02    mov         eax,dword ptr [ebp-4]
 00705A05    call        TCustomCanvas.Lock
 00705A0A    xor         eax,eax
 00705A0C    push        ebp
 00705A0D    push        705AE6
 00705A12    push        dword ptr fs:[eax]
 00705A15    mov         dword ptr fs:[eax],esp
 00705A18    mov         eax,dword ptr [ebp-4]
 00705A1B    call        TCanvas.GetHandle
 00705A20    mov         edi,eax
 00705A22    mov         eax,ebx
 00705A24    mov         edx,dword ptr [eax]
 00705A26    call        dword ptr [edx+28]
 00705A29    mov         dword ptr [ebp-8],eax
 00705A2C    mov         byte ptr [ebp-9],0
 00705A30    cmp         dword ptr [ebp-8],0
>00705A34    je          00705A4F
 00705A36    push        0FF
 00705A38    mov         eax,dword ptr [ebp-8]
 00705A3B    push        eax
 00705A3C    push        edi
 00705A3D    call        gdi32.SelectPalette
 00705A42    mov         dword ptr [ebp-8],eax
 00705A45    push        edi
 00705A46    call        gdi32.RealizePalette
 00705A4B    mov         byte ptr [ebp-9],1
 00705A4F    lea         eax,[ebp-0C]
 00705A52    push        eax
 00705A53    mov         eax,dword ptr [ebx+28]
 00705A56    push        eax
 00705A57    mov         eax,dword ptr [eax]
 00705A59    call        dword ptr [eax+14]
 00705A5C    cmp         word ptr [ebp-0C],4
>00705A61    jne         00705A7D
 00705A63    lea         eax,[ebp-10]
 00705A66    push        eax
 00705A67    mov         eax,dword ptr [ebx+28]
 00705A6A    push        eax
 00705A6B    mov         eax,dword ptr [eax]
 00705A6D    call        dword ptr [eax+0C]
 00705A70    push        esi
 00705A71    mov         eax,dword ptr [ebp-10]
 00705A74    push        eax
 00705A75    push        edi
 00705A76    call        gdi32.PlayEnhMetaFile
>00705A7B    jmp         00705ABE
 00705A7D    push        esi
 00705A7E    mov         eax,ebx
 00705A80    call        TOleGraphic.GetMMHeight
 00705A85    neg         eax
 00705A87    push        eax
 00705A88    mov         eax,ebx
 00705A8A    call        TOleGraphic.GetMMWidth
 00705A8F    push        eax
 00705A90    mov         eax,ebx
 00705A92    call        TOleGraphic.GetMMHeight
 00705A97    dec         eax
 00705A98    push        eax
 00705A99    push        0
 00705A9B    mov         eax,dword ptr [esi+0C]
 00705A9E    sub         eax,dword ptr [esi+4]
 00705AA1    push        eax
 00705AA2    mov         eax,dword ptr [esi+8]
 00705AA5    sub         eax,dword ptr [esi]
 00705AA7    push        eax
 00705AA8    mov         eax,dword ptr [esi+4]
 00705AAB    push        eax
 00705AAC    mov         eax,dword ptr [esi]
 00705AAE    push        eax
 00705AAF    push        edi
 00705AB0    mov         eax,dword ptr [ebx+28]
 00705AB3    push        eax
 00705AB4    mov         eax,dword ptr [eax]
 00705AB6    call        dword ptr [eax+20]
 00705AB9    call        OleCheck
 00705ABE    cmp         byte ptr [ebp-9],0
>00705AC2    je          00705AD0
 00705AC4    push        0FF
 00705AC6    mov         eax,dword ptr [ebp-8]
 00705AC9    push        eax
 00705ACA    push        edi
 00705ACB    call        gdi32.SelectPalette
 00705AD0    xor         eax,eax
 00705AD2    pop         edx
 00705AD3    pop         ecx
 00705AD4    pop         ecx
 00705AD5    mov         dword ptr fs:[eax],edx
 00705AD8    push        705AED
 00705ADD    mov         eax,dword ptr [ebp-4]
 00705AE0    call        TCustomCanvas.Unlock
 00705AE5    ret
>00705AE6    jmp         @HandleFinally
>00705AEB    jmp         00705ADD
 00705AED    pop         edi
 00705AEE    pop         esi
 00705AEF    pop         ebx
 00705AF0    mov         esp,ebp
 00705AF2    pop         ebp
 00705AF3    ret
*}
end;

//00705AF4
function TOleGraphic.GetEmpty:Boolean;
begin
{*
 00705AF4    push        ebx
 00705AF5    push        ecx
 00705AF6    mov         ebx,eax
 00705AF8    cmp         dword ptr [ebx+28],0
>00705AFC    je          00705B18
 00705AFE    push        esp
 00705AFF    mov         eax,dword ptr [ebx+28]
 00705B02    push        eax
 00705B03    mov         eax,dword ptr [eax]
 00705B05    call        dword ptr [eax+14]
 00705B08    test        eax,eax
>00705B0A    jne         00705B18
 00705B0C    cmp         word ptr [esp],0
>00705B11    jle         00705B18
 00705B13    xor         eax,eax
 00705B15    pop         edx
 00705B16    pop         ebx
 00705B17    ret
 00705B18    mov         al,1
 00705B1A    pop         edx
 00705B1B    pop         ebx
 00705B1C    ret
*}
end;

//00705B20
function HIMETRICtoDP(P:TPoint):TPoint;
begin
{*
 00705B20    push        ebx
 00705B21    push        esi
 00705B22    push        edi
 00705B23    add         esp,0FFFFFFF8
 00705B26    mov         esi,eax
 00705B28    lea         edi,[esp]
 00705B2B    movs        dword ptr [edi],dword ptr [esi]
 00705B2C    movs        dword ptr [edi],dword ptr [esi]
 00705B2D    mov         ebx,edx
 00705B2F    push        0
 00705B31    call        user32.GetDC
 00705B36    mov         esi,eax
 00705B38    push        3
 00705B3A    push        esi
 00705B3B    call        gdi32.SetMapMode
 00705B40    mov         eax,dword ptr [esp]
 00705B43    mov         dword ptr [ebx],eax
 00705B45    mov         eax,dword ptr [esp+4]
 00705B49    mov         dword ptr [ebx+4],eax
 00705B4C    neg         dword ptr [ebx+4]
 00705B4F    push        1
 00705B51    push        ebx
 00705B52    push        esi
 00705B53    call        gdi32.LPtoDP
 00705B58    push        esi
 00705B59    push        0
 00705B5B    call        user32.ReleaseDC
 00705B60    pop         ecx
 00705B61    pop         edx
 00705B62    pop         edi
 00705B63    pop         esi
 00705B64    pop         ebx
 00705B65    ret
*}
end;

//00705B68
function TOleGraphic.GetHeight:Integer;
begin
{*
 00705B68    add         esp,0FFFFFFF0
 00705B6B    call        TOleGraphic.GetMMHeight
 00705B70    xor         edx,edx
 00705B72    mov         dword ptr [esp],edx
 00705B75    mov         dword ptr [esp+4],eax
 00705B79    lea         edx,[esp+8]
 00705B7D    mov         eax,esp
 00705B7F    call        HIMETRICtoDP
 00705B84    mov         eax,dword ptr [esp+0C]
 00705B88    add         esp,10
 00705B8B    ret
*}
end;

//00705B8C
function TOleGraphic.GetMMHeight:Integer;
begin
{*
 00705B8C    push        ecx
 00705B8D    xor         edx,edx
 00705B8F    mov         dword ptr [esp],edx
 00705B92    cmp         dword ptr [eax+28],0
>00705B96    je          00705BA2
 00705B98    push        esp
 00705B99    mov         eax,dword ptr [eax+28]
 00705B9C    push        eax
 00705B9D    mov         eax,dword ptr [eax]
 00705B9F    call        dword ptr [eax+1C]
 00705BA2    mov         eax,dword ptr [esp]
 00705BA5    pop         edx
 00705BA6    ret
*}
end;

//00705BA8
function TOleGraphic.GetMMWidth:Integer;
begin
{*
 00705BA8    push        ecx
 00705BA9    xor         edx,edx
 00705BAB    mov         dword ptr [esp],edx
 00705BAE    cmp         dword ptr [eax+28],0
>00705BB2    je          00705BBE
 00705BB4    push        esp
 00705BB5    mov         eax,dword ptr [eax+28]
 00705BB8    push        eax
 00705BB9    mov         eax,dword ptr [eax]
 00705BBB    call        dword ptr [eax+18]
 00705BBE    mov         eax,dword ptr [esp]
 00705BC1    pop         edx
 00705BC2    ret
*}
end;

//00705BC4
function TOleGraphic.GetPalette:HPALETTE;
begin
{*
 00705BC4    push        ecx
 00705BC5    xor         edx,edx
 00705BC7    cmp         dword ptr [eax+28],0
>00705BCB    je          00705BDA
 00705BCD    push        esp
 00705BCE    mov         eax,dword ptr [eax+28]
 00705BD1    push        eax
 00705BD2    mov         eax,dword ptr [eax]
 00705BD4    call        dword ptr [eax+10]
 00705BD7    mov         edx,dword ptr [esp]
 00705BDA    mov         eax,edx
 00705BDC    pop         edx
 00705BDD    ret
*}
end;

//00705BE0
function TOleGraphic.GetTransparent:Boolean;
begin
{*
 00705BE0    push        ecx
 00705BE1    xor         edx,edx
 00705BE3    cmp         dword ptr [eax+28],0
>00705BE7    je          00705BFA
 00705BE9    push        esp
 00705BEA    mov         eax,dword ptr [eax+28]
 00705BED    push        eax
 00705BEE    mov         eax,dword ptr [eax]
 00705BF0    call        dword ptr [eax+40]
 00705BF3    test        byte ptr [esp],2
 00705BF7    setne       dl
 00705BFA    mov         eax,edx
 00705BFC    pop         edx
 00705BFD    ret
*}
end;

//00705C00
function TOleGraphic.GetWidth:Integer;
begin
{*
 00705C00    add         esp,0FFFFFFF0
 00705C03    call        TOleGraphic.GetMMWidth
 00705C08    mov         dword ptr [esp],eax
 00705C0B    xor         eax,eax
 00705C0D    mov         dword ptr [esp+4],eax
 00705C11    lea         edx,[esp+8]
 00705C15    mov         eax,esp
 00705C17    call        HIMETRICtoDP
 00705C1C    mov         eax,dword ptr [esp+8]
 00705C20    add         esp,10
 00705C23    ret
*}
end;

//00705C24
procedure InvalidOperation(const Str:UnicodeString);
begin
{*
 00705C24    push        ebx
 00705C25    mov         ebx,eax
 00705C27    mov         ecx,ebx
 00705C29    mov         dl,1
 00705C2B    mov         eax,[0045F278];EInvalidGraphicOperation
 00705C30    call        Exception.Create
 00705C35    call        @RaiseExcept
 00705C3A    pop         ebx
 00705C3B    ret
*}
end;

//00705C3C
procedure TOleGraphic.SetHeight(Value:Integer);
begin
{*
 00705C3C    push        ebp
 00705C3D    mov         ebp,esp
 00705C3F    push        0
 00705C41    xor         eax,eax
 00705C43    push        ebp
 00705C44    push        705C7A
 00705C49    push        dword ptr fs:[eax]
 00705C4C    mov         dword ptr fs:[eax],esp
 00705C4F    lea         edx,[ebp-4]
 00705C52    mov         eax,[0078CC24];^SResString187:TResStringRec
 00705C57    call        LoadResString
 00705C5C    mov         eax,dword ptr [ebp-4]
 00705C5F    call        InvalidOperation
 00705C64    xor         eax,eax
 00705C66    pop         edx
 00705C67    pop         ecx
 00705C68    pop         ecx
 00705C69    mov         dword ptr fs:[eax],edx
 00705C6C    push        705C81
 00705C71    lea         eax,[ebp-4]
 00705C74    call        @UStrClr
 00705C79    ret
>00705C7A    jmp         @HandleFinally
>00705C7F    jmp         00705C71
 00705C81    pop         ecx
 00705C82    pop         ebp
 00705C83    ret
*}
end;

//00705C84
procedure TOleGraphic.SetPalette(Value:HPALETTE);
begin
{*
 00705C84    push        ebx
 00705C85    push        esi
 00705C86    mov         esi,edx
 00705C88    mov         ebx,eax
 00705C8A    cmp         dword ptr [ebx+28],0
>00705C8E    je          00705C9F
 00705C90    push        esi
 00705C91    mov         eax,dword ptr [ebx+28]
 00705C94    push        eax
 00705C95    mov         eax,dword ptr [eax]
 00705C97    call        dword ptr [eax+24]
 00705C9A    call        OleCheck
 00705C9F    pop         esi
 00705CA0    pop         ebx
 00705CA1    ret
*}
end;

//00705CA4
procedure TOleGraphic.SetWidth(Value:Integer);
begin
{*
 00705CA4    push        ebp
 00705CA5    mov         ebp,esp
 00705CA7    push        0
 00705CA9    xor         eax,eax
 00705CAB    push        ebp
 00705CAC    push        705CE2
 00705CB1    push        dword ptr fs:[eax]
 00705CB4    mov         dword ptr fs:[eax],esp
 00705CB7    lea         edx,[ebp-4]
 00705CBA    mov         eax,[0078CC24];^SResString187:TResStringRec
 00705CBF    call        LoadResString
 00705CC4    mov         eax,dword ptr [ebp-4]
 00705CC7    call        InvalidOperation
 00705CCC    xor         eax,eax
 00705CCE    pop         edx
 00705CCF    pop         ecx
 00705CD0    pop         ecx
 00705CD1    mov         dword ptr fs:[eax],edx
 00705CD4    push        705CE9
 00705CD9    lea         eax,[ebp-4]
 00705CDC    call        @UStrClr
 00705CE1    ret
>00705CE2    jmp         @HandleFinally
>00705CE7    jmp         00705CD9
 00705CE9    pop         ecx
 00705CEA    pop         ebp
 00705CEB    ret
*}
end;

//00705CEC
procedure TOleGraphic.LoadFromFile(Filename:string);
begin
{*
 00705CEC    ret
*}
end;

//00705CF0
procedure TOleGraphic.LoadFromStream(Stream:TStream);
begin
{*
 00705CF0    push        ebx
 00705CF1    push        esi
 00705CF2    mov         esi,edx
 00705CF4    mov         ebx,eax
 00705CF6    push        705D30
 00705CFB    lea         eax,[ebx+28]
 00705CFE    call        @IntfClear
 00705D03    push        eax
 00705D04    push        0
 00705D06    mov         ecx,esi
 00705D08    mov         dl,1
 00705D0A    mov         eax,[0043E568];TStreamAdapter
 00705D0F    call        TStreamAdapter.Create
 00705D14    test        eax,eax
>00705D16    je          00705D1B
 00705D18    sub         eax,0FFFFFFEC
 00705D1B    or          ecx,0FFFFFFFF
 00705D1E    xor         edx,edx
 00705D20    call        OleLoadPicture
 00705D25    call        OleCheck
 00705D2A    pop         esi
 00705D2B    pop         ebx
 00705D2C    ret
*}
end;

//00705D40
procedure TOleGraphic.SaveToStream(Stream:TStream);
begin
{*
 00705D40    push        ebp
 00705D41    mov         ebp,esp
 00705D43    push        0
 00705D45    push        ebx
 00705D46    push        esi
 00705D47    mov         esi,edx
 00705D49    mov         ebx,eax
 00705D4B    xor         eax,eax
 00705D4D    push        ebp
 00705D4E    push        705DA7
 00705D53    push        dword ptr fs:[eax]
 00705D56    mov         dword ptr fs:[eax],esp
 00705D59    push        0FF
 00705D5B    push        0
 00705D5D    mov         ecx,esi
 00705D5F    mov         dl,1
 00705D61    mov         eax,[0043E568];TStreamAdapter
 00705D66    call        TStreamAdapter.Create
 00705D6B    test        eax,eax
>00705D6D    je          00705D72
 00705D6F    sub         eax,0FFFFFFEC
 00705D72    push        eax
 00705D73    lea         eax,[ebp-4]
 00705D76    mov         edx,dword ptr [ebx+28]
 00705D79    mov         ecx,705DB4
 00705D7E    call        @IntfCast
 00705D83    mov         eax,dword ptr [ebp-4]
 00705D86    push        eax
 00705D87    mov         eax,dword ptr [eax]
 00705D89    call        dword ptr [eax+18]
 00705D8C    call        OleCheck
 00705D91    xor         eax,eax
 00705D93    pop         edx
 00705D94    pop         ecx
 00705D95    pop         ecx
 00705D96    mov         dword ptr fs:[eax],edx
 00705D99    push        705DAE
 00705D9E    lea         eax,[ebp-4]
 00705DA1    call        @IntfClear
 00705DA6    ret
>00705DA7    jmp         @HandleFinally
>00705DAC    jmp         00705D9E
 00705DAE    pop         esi
 00705DAF    pop         ebx
 00705DB0    pop         ecx
 00705DB1    pop         ebp
 00705DB2    ret
*}
end;

//00705DC4
procedure TOleGraphic.LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);
begin
{*
 00705DC4    push        ebp
 00705DC5    mov         ebp,esp
 00705DC7    push        0
 00705DC9    push        ebx
 00705DCA    xor         eax,eax
 00705DCC    push        ebp
 00705DCD    push        705E03
 00705DD2    push        dword ptr fs:[eax]
 00705DD5    mov         dword ptr fs:[eax],esp
 00705DD8    lea         edx,[ebp-4]
 00705DDB    mov         eax,[0078CC24];^SResString187:TResStringRec
 00705DE0    call        LoadResString
 00705DE5    mov         eax,dword ptr [ebp-4]
 00705DE8    call        InvalidOperation
 00705DED    xor         eax,eax
 00705DEF    pop         edx
 00705DF0    pop         ecx
 00705DF1    pop         ecx
 00705DF2    mov         dword ptr fs:[eax],edx
 00705DF5    push        705E0A
 00705DFA    lea         eax,[ebp-4]
 00705DFD    call        @UStrClr
 00705E02    ret
>00705E03    jmp         @HandleFinally
>00705E08    jmp         00705DFA
 00705E0A    pop         ebx
 00705E0B    pop         ecx
 00705E0C    pop         ebp
 00705E0D    ret         4
*}
end;

//00705E10
procedure TOleGraphic.SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE);
begin
{*
 00705E10    push        ebp
 00705E11    mov         ebp,esp
 00705E13    push        0
 00705E15    push        ebx
 00705E16    xor         eax,eax
 00705E18    push        ebp
 00705E19    push        705E4F
 00705E1E    push        dword ptr fs:[eax]
 00705E21    mov         dword ptr fs:[eax],esp
 00705E24    lea         edx,[ebp-4]
 00705E27    mov         eax,[0078CC24];^SResString187:TResStringRec
 00705E2C    call        LoadResString
 00705E31    mov         eax,dword ptr [ebp-4]
 00705E34    call        InvalidOperation
 00705E39    xor         eax,eax
 00705E3B    pop         edx
 00705E3C    pop         ecx
 00705E3D    pop         ecx
 00705E3E    mov         dword ptr fs:[eax],edx
 00705E41    push        705E56
 00705E46    lea         eax,[ebp-4]
 00705E49    call        @UStrClr
 00705E4E    ret
>00705E4F    jmp         @HandleFinally
>00705E54    jmp         00705E46
 00705E56    pop         ebx
 00705E57    pop         ecx
 00705E58    pop         ebp
 00705E59    ret         4
*}
end;

//00705E5C
procedure InitOlePro32;
begin
{*
 00705E5C    cmp         dword ptr ds:[8229D0],0;OlePro32DLL:THandle
>00705E63    jne         00705ED6
 00705E65    mov         edx,8000
 00705E6A    mov         eax,705EE4;'olepro32.dll'
 00705E6F    call        SafeLoadLibrary
 00705E74    mov         [008229D0],eax;OlePro32DLL:THandle
 00705E79    cmp         dword ptr ds:[8229D0],0;OlePro32DLL:THandle
>00705E80    je          00705ED6
 00705E82    push        705F00
 00705E87    mov         eax,[008229D0];OlePro32DLL:THandle
 00705E8C    push        eax
 00705E8D    call        GetProcAddress
 00705E92    mov         [008229D4],eax;_OleCreatePropertyFrame:function(val hwndOwner:Windows.HWND;val x:System....
 00705E97    push        705F30
 00705E9C    mov         eax,[008229D0];OlePro32DLL:THandle
 00705EA1    push        eax
 00705EA2    call        GetProcAddress
 00705EA7    mov         [008229D8],eax;_OleCreateFontIndirect:function(const FontDesc:ActiveX.TFontDesc;const ii...
 00705EAC    push        705F5C
 00705EB1    mov         eax,[008229D0];OlePro32DLL:THandle
 00705EB6    push        eax
 00705EB7    call        GetProcAddress
 00705EBC    mov         [008229DC],eax;_OleCreatePictureIndirect:function(const PictDesc:ActiveX.TPictDesc;const...
 00705EC1    push        705F90
 00705EC6    mov         eax,[008229D0];OlePro32DLL:THandle
 00705ECB    push        eax
 00705ECC    call        GetProcAddress
 00705ED1    mov         [008229E0],eax;_OleLoadPicture:function(val stream:ActiveX.IStream;val lSize:System.Long...
 00705ED6    ret
*}
end;

//00705FB0
function OleCreateFontIndirect(const FontDesc:TFontDesc; const iid:TIID; var vObject:void ):HRESULT;
begin
{*
 00705FB0    cmp         dword ptr ds:[8229D8],0;_OleCreateFontIndirect:function(const FontDesc:ActiveX.TFontDesc...
>00705FB7    je          00705FC3
 00705FB9    push        ecx
 00705FBA    push        edx
 00705FBB    push        eax
 00705FBC    call        dword ptr ds:[8229D8]
 00705FC2    ret
 00705FC3    mov         eax,8000FFFF
 00705FC8    ret
*}
end;

//00705FCC
function OleCreatePictureIndirect(const PictDesc:TPictDesc; const iid:TIID; fOwn:BOOL; var vObject:void ):HRESULT;
begin
{*
 00705FCC    push        ebp
 00705FCD    mov         ebp,esp
 00705FCF    push        ebx
 00705FD0    cmp         dword ptr ds:[8229DC],0;_OleCreatePictureIndirect:function(const PictDesc:ActiveX.TPictD...
>00705FD7    je          00705FE8
 00705FD9    mov         ebx,dword ptr [ebp+8]
 00705FDC    push        ebx
 00705FDD    push        ecx
 00705FDE    push        edx
 00705FDF    push        eax
 00705FE0    call        dword ptr ds:[8229DC]
>00705FE6    jmp         00705FED
 00705FE8    mov         eax,8000FFFF
 00705FED    pop         ebx
 00705FEE    pop         ebp
 00705FEF    ret         4
*}
end;

//00705FF4
function OleLoadPicture(stream:IStream; lSize:LongInt; fRunmode:BOOL; const iid:TIID; var vObject:void ):HRESULT;
begin
{*
 00705FF4    push        ebp
 00705FF5    mov         ebp,esp
 00705FF7    push        ecx
 00705FF8    push        ebx
 00705FF9    push        esi
 00705FFA    mov         esi,ecx
 00705FFC    mov         ebx,edx
 00705FFE    mov         dword ptr [ebp-4],eax
 00706001    mov         eax,dword ptr [ebp-4]
 00706004    call        @IntfAddRef
 00706009    xor         eax,eax
 0070600B    push        ebp
 0070600C    push        706053
 00706011    push        dword ptr fs:[eax]
 00706014    mov         dword ptr fs:[eax],esp
 00706017    cmp         dword ptr ds:[8229E0],0;_OleLoadPicture:function(val stream:ActiveX.IStream;val lSize:Sy...
>0070601E    je          00706038
 00706020    mov         eax,dword ptr [ebp+8]
 00706023    push        eax
 00706024    mov         eax,dword ptr [ebp+0C]
 00706027    push        eax
 00706028    push        esi
 00706029    push        ebx
 0070602A    mov         eax,dword ptr [ebp-4]
 0070602D    push        eax
 0070602E    call        dword ptr ds:[8229E0]
 00706034    mov         ebx,eax
>00706036    jmp         0070603D
 00706038    mov         ebx,8000FFFF
 0070603D    xor         eax,eax
 0070603F    pop         edx
 00706040    pop         ecx
 00706041    pop         ecx
 00706042    mov         dword ptr fs:[eax],edx
 00706045    push        70605A
 0070604A    lea         eax,[ebp-4]
 0070604D    call        @IntfClear
 00706052    ret
>00706053    jmp         @HandleFinally
>00706058    jmp         0070604A
 0070605A    mov         eax,ebx
 0070605C    pop         esi
 0070605D    pop         ebx
 0070605E    pop         ecx
 0070605F    pop         ebp
 00706060    ret         8
*}
end;

Initialization
//00782DF4
{*
 00782DF4    sub         dword ptr ds:[8229C8],1
>00782DFB    jae         00782E16
 00782DFD    mov         eax,[00704974];TOleGraphic
 00782E02    push        eax
 00782E03    xor         ecx,ecx
 00782E05    xor         edx,edx
 00782E07    mov         eax,[0046279C];TPicture
 00782E0C    call        TPicture.RegisterFileFormat
 00782E11    call        InitOlePro32
 00782E16    ret
*}
Finalization
//00706064
{*
 00706064    inc         dword ptr ds:[8229C8]
>0070606A    jne         007060AA
 0070606C    cmp         dword ptr ds:[8229CC],0;xParkingWindow:HWND
>00706073    je          00706096
 00706075    push        0
 00706077    push        0
 00706079    push        10
 0070607B    mov         eax,[008229CC];xParkingWindow:HWND
 00706080    push        eax
 00706081    call        user32.SendMessageW
 00706086    mov         eax,[00790C38];gvar_00790C38
 0070608B    push        eax
 0070608C    push        7060AC
 00706091    call        user32.UnregisterClassW
 00706096    cmp         dword ptr ds:[8229D0],0;OlePro32DLL:THandle
>0070609D    je          007060AA
 0070609F    mov         eax,[008229D0];OlePro32DLL:THandle
 007060A4    push        eax
 007060A5    call        kernel32.FreeLibrary
 007060AA    ret
*}
end.