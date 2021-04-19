//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit8;

interface

uses
  SysUtils, Classes;

type
  tagMULTI_QI = tagMULTI_QI = record//size=C
f4:IInterface;//f4
end;
IID:PGUID;//f0
Itf:IInterface;//f4
hr:HRESULT;//f8
end;;
  tagSAFEARRAY = tagSAFEARRAY = record//size=18
cDims:Word;//f0
fFeatures:Word;//f2
cbElements:Integer;//f4
cLocks:Integer;//f8
pvData:Pointer;//fC
rgsabound:?;//f10
end;;
  tagCONTROLINFO = tagCONTROLINFO = record//size=10
cb:Integer;//f0
hAccel:HACCEL;//f4
cAccel:Word;//f8
dwFlags:Integer;//fC
end;;
  tagSTATSTG = tagSTATSTG = record//size=48
pwcsName:PWideChar;//f0
dwType:Integer;//f4
cbSize:Int64;//f8
mtime:_FILETIME;//f10
ctime:_FILETIME;//f18
atime:_FILETIME;//f20
grfMode:Integer;//f28
grfLocksSupported:Integer;//f2C
clsid:TGUID;//f30
grfStateBits:Integer;//f40
reserved:Integer;//f44
end;;
  TDispIDList = array [1..65536] of Integer;
  tagEXCEPINFO = tagEXCEPINFO = record//size=20
f4:WideString;//f4
f8:WideString;//f8
fC:WideString;//fC
end;
wCode:Word;//f0
wReserved:Word;//f2
bstrSource:WideString;//f4
bstrDescription:WideString;//f8
bstrHelpFile:WideString;//fC
dwHelpContext:Integer;//f10
pvReserved:Pointer;//f14
pfnDeferredFillIn:TFNDeferredFillIn;//f18
scode:HRESULT;//f1C
end;;
    function IsEqualGUID(const Guid2:TGUID):Boolean;//0042B608
    function IsEqualGUID(const Guid2:TGUID):Boolean;//0042B610
    function IsEqualGUID(const Guid2:TGUID):Boolean;//0042B618
    function CoInitialize:HRESULT; stdcall;//0042B620
    procedure CoUninitialize;//0042B628
    function CoGetClassObject(dwClsContext:LongInt; pvReserved:Pointer; const iid:TGUID; var pv:void ):HRESULT; stdcall;//0042B630
    function CoCreateInstance(unkOuter:IUnknown; dwClsContext:LongInt; const iid:TGUID; var pv:void ):HRESULT; stdcall;//0042B638
    function StringFromCLSID(var psz:PWideChar):HRESULT; stdcall;//0042B640
    function ProgIDFromCLSID(var pszProgID:PWideChar):HRESULT; stdcall;//0042B648
    function CoTaskMemAlloc:Pointer; stdcall;//0042B650
    procedure CoTaskMemFree; stdcall;//0042B658
    function OleInitialize:HRESULT; stdcall;//0042B660
    procedure OleUninitialize;//0042B668
    function OleSetMenuDescriptor(hwndFrame:HWND; hwndActiveObject:HWND; frame:IOleInPlaceFrame; activeObj:IOleInPlaceActiveObject):HRESULT; stdcall;//0042B670
    function OleDraw(dwAspect:LongInt; hdcDraw:HDC; const rcBounds:TRect):HRESULT; stdcall;//0042B678
    function IsAccelerator(cAccelEntries:Integer; msg:PMsg; var pwCmd:Word):BOOL; stdcall;//0042B680
    function OleRegEnumVerbs(var Enum:IEnumOLEVERB):HRESULT; stdcall;//0042B688
    function CreateStreamOnHGlobal(fDeleteOnRelease:BOOL; var stm:IStream):HRESULT; stdcall;//0042B690
    procedure SysFreeString; stdcall;//0042B698
    function GetActiveObject(pvReserved:Pointer; var unk:IUnknown):HRESULT; stdcall;//0042B6A0
    function SetErrorInfo(errinfo:IErrorInfo):HRESULT; stdcall;//0042B6A8
    function GetErrorInfo(var errinfo:IErrorInfo):HRESULT; stdcall;//0042B6B0
    function CreateErrorInfo:HRESULT; stdcall;//0042B6B8
    procedure VariantInit; stdcall;//0042B6C0
    procedure VariantClear;//0042B6C8
    function VariantCopy(const vargSrc:Variant):HRESULT; stdcall;//0042B6D0
    function VariantCopyInd(const vargSrc:Variant):HRESULT; stdcall;//0042B6D8
    function VariantChangeType(const vargSrc:Variant; wFlags:Word; vt:Word):HRESULT; stdcall;//0042B6E0
    //function sub_0042B6E8(?:?; ?:?; ?:?; ?:?; ?:?):?;//0042B6E8
    //function sub_0042B730:?;//0042B730
    //function sub_0042B73C:?;//0042B73C
    //function sub_0042B748:?;//0042B748
    function SafeArrayCreate(cDims:Integer; const rgsabound:void ):PSafeArray; stdcall;//0042BB5C
    function SafeArrayGetLBound(nDim:Integer; var lLbound:LongInt):HRESULT; stdcall;//0042BB64
    function SafeArrayGetUBound(nDim:Integer; var lUbound:LongInt):HRESULT; stdcall;//0042BB6C
    function SafeArrayPtrOfIndex(var rgIndices:void ; var pvData:Pointer):HRESULT; stdcall;//0042BB74
    //function sub_0042BB7C(?:?; ?:?; ?:?):?;//0042BB7C
    procedure sub_0042BBA8;//0042BBA8

implementation

//0042B608
function ole32.IsEqualGUID(const Guid2:TGUID):Boolean;
begin
{*
 0042B608    jmp         dword ptr ds:[82673C]
*}
end;

//0042B610
function ole32.IsEqualGUID(const Guid2:TGUID):Boolean;
begin
{*
 0042B610    jmp         dword ptr ds:[82673C]
*}
end;

//0042B618
function ole32.IsEqualGUID(const Guid2:TGUID):Boolean;
begin
{*
 0042B618    jmp         dword ptr ds:[82673C]
*}
end;

//0042B620
function ole32.CoInitialize:HRESULT; stdcall;
begin
{*
 0042B620    jmp         dword ptr ds:[826738]
*}
end;

//0042B628
procedure ole32.CoUninitialize;
begin
{*
 0042B628    jmp         dword ptr ds:[826734]
*}
end;

//0042B630
function ole32.CoGetClassObject(dwClsContext:LongInt; pvReserved:Pointer; const iid:TGUID; var pv:void ):HRESULT; stdcall;
begin
{*
 0042B630    jmp         dword ptr ds:[826730]
*}
end;

//0042B638
function ole32.CoCreateInstance(unkOuter:IUnknown; dwClsContext:LongInt; const iid:TGUID; var pv:void ):HRESULT; stdcall;
begin
{*
 0042B638    jmp         dword ptr ds:[82672C]
*}
end;

//0042B640
function ole32.StringFromCLSID(var psz:PWideChar):HRESULT; stdcall;
begin
{*
 0042B640    jmp         dword ptr ds:[826728]
*}
end;

//0042B648
function ole32.ProgIDFromCLSID(var pszProgID:PWideChar):HRESULT; stdcall;
begin
{*
 0042B648    jmp         dword ptr ds:[826724]
*}
end;

//0042B650
function ole32.CoTaskMemAlloc:Pointer; stdcall;
begin
{*
 0042B650    jmp         dword ptr ds:[826720]
*}
end;

//0042B658
procedure ole32.CoTaskMemFree; stdcall;
begin
{*
 0042B658    jmp         dword ptr ds:[82671C]
*}
end;

//0042B660
function ole32.OleInitialize:HRESULT; stdcall;
begin
{*
 0042B660    jmp         dword ptr ds:[826718]
*}
end;

//0042B668
procedure ole32.OleUninitialize;
begin
{*
 0042B668    jmp         dword ptr ds:[826714]
*}
end;

//0042B670
function ole32.OleSetMenuDescriptor(hwndFrame:HWND; hwndActiveObject:HWND; frame:IOleInPlaceFrame; activeObj:IOleInPlaceActiveObject):HRESULT; stdcall;
begin
{*
 0042B670    jmp         dword ptr ds:[826710]
*}
end;

//0042B678
function ole32.OleDraw(dwAspect:LongInt; hdcDraw:HDC; const rcBounds:TRect):HRESULT; stdcall;
begin
{*
 0042B678    jmp         dword ptr ds:[82670C]
*}
end;

//0042B680
function ole32.IsAccelerator(cAccelEntries:Integer; msg:PMsg; var pwCmd:Word):BOOL; stdcall;
begin
{*
 0042B680    jmp         dword ptr ds:[826708]
*}
end;

//0042B688
function ole32.OleRegEnumVerbs(var Enum:IEnumOLEVERB):HRESULT; stdcall;
begin
{*
 0042B688    jmp         dword ptr ds:[826704]
*}
end;

//0042B690
function ole32.CreateStreamOnHGlobal(fDeleteOnRelease:BOOL; var stm:IStream):HRESULT; stdcall;
begin
{*
 0042B690    jmp         dword ptr ds:[826700]
*}
end;

//0042B698
procedure oleaut32.SysFreeString; stdcall;
begin
{*
 0042B698    jmp         dword ptr ds:[8266F8]
*}
end;

//0042B6A0
function oleaut32.GetActiveObject(pvReserved:Pointer; var unk:IUnknown):HRESULT; stdcall;
begin
{*
 0042B6A0    jmp         dword ptr ds:[8266F4]
*}
end;

//0042B6A8
function oleaut32.SetErrorInfo(errinfo:IErrorInfo):HRESULT; stdcall;
begin
{*
 0042B6A8    jmp         dword ptr ds:[8266F0]
*}
end;

//0042B6B0
function oleaut32.GetErrorInfo(var errinfo:IErrorInfo):HRESULT; stdcall;
begin
{*
 0042B6B0    jmp         dword ptr ds:[8266EC]
*}
end;

//0042B6B8
function oleaut32.CreateErrorInfo:HRESULT; stdcall;
begin
{*
 0042B6B8    jmp         dword ptr ds:[8266E8]
*}
end;

//0042B6C0
procedure oleaut32.VariantInit; stdcall;
begin
{*
 0042B6C0    jmp         dword ptr ds:[826764]
*}
end;

//0042B6C8
procedure oleaut32.VariantClear;
begin
{*
 0042B6C8    jmp         dword ptr ds:[826760]
*}
end;

//0042B6D0
function oleaut32.VariantCopy(const vargSrc:Variant):HRESULT; stdcall;
begin
{*
 0042B6D0    jmp         dword ptr ds:[82675C]
*}
end;

//0042B6D8
function oleaut32.VariantCopyInd(const vargSrc:Variant):HRESULT; stdcall;
begin
{*
 0042B6D8    jmp         dword ptr ds:[826758]
*}
end;

//0042B6E0
function oleaut32.VariantChangeType(const vargSrc:Variant; wFlags:Word; vt:Word):HRESULT; stdcall;
begin
{*
 0042B6E0    jmp         dword ptr ds:[826754]
*}
end;

//0042B6E8
{*function sub_0042B6E8(?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 0042B6E8    push        ebp
 0042B6E9    mov         ebp,esp
 0042B6EB    push        ebx
 0042B6EC    mov         ebx,dword ptr [ebp+18]
 0042B6EF    cmp         dword ptr [ebp+10],400
>0042B6F6    je          0042B6FF
 0042B6F8    mov         eax,80004001
>0042B6FD    jmp         0042B72A
 0042B6FF    push        ebx
 0042B700    movzx       eax,word ptr [ebp+14]
 0042B704    push        eax
 0042B705    mov         eax,dword ptr [ebp+0C]
 0042B708    push        eax
 0042B709    mov         eax,dword ptr [ebp+8]
 0042B70C    push        eax
 0042B70D    call        oleaut32.VariantChangeType
 0042B712    cmp         eax,80020005
>0042B717    jne         0042B72A
 0042B719    and         bx,2000
 0042B71E    cmp         bx,2000
>0042B723    jne         0042B72A
 0042B725    mov         eax,80020008
 0042B72A    pop         ebx
 0042B72B    pop         ebp
 0042B72C    ret         14
end;*}

//0042B730
{*function sub_0042B730:?;
begin
 0042B730    push        ebp
 0042B731    mov         ebp,esp
 0042B733    mov         eax,80004001
 0042B738    pop         ebp
 0042B739    ret         8
end;*}

//0042B73C
{*function sub_0042B73C:?;
begin
 0042B73C    push        ebp
 0042B73D    mov         ebp,esp
 0042B73F    mov         eax,80004001
 0042B744    pop         ebp
 0042B745    ret         0C
end;*}

//0042B748
{*function sub_0042B748:?;
begin
 0042B748    push        ebp
 0042B749    mov         ebp,esp
 0042B74B    mov         eax,80004001
 0042B750    pop         ebp
 0042B751    ret         10
end;*}

//0042BB5C
function oleaut32.SafeArrayCreate(cDims:Integer; const rgsabound:void ):PSafeArray; stdcall;
begin
{*
 0042BB5C    jmp         dword ptr ds:[826750]
*}
end;

//0042BB64
function oleaut32.SafeArrayGetLBound(nDim:Integer; var lLbound:LongInt):HRESULT; stdcall;
begin
{*
 0042BB64    jmp         dword ptr ds:[82674C]
*}
end;

//0042BB6C
function oleaut32.SafeArrayGetUBound(nDim:Integer; var lUbound:LongInt):HRESULT; stdcall;
begin
{*
 0042BB6C    jmp         dword ptr ds:[826748]
*}
end;

//0042BB74
function oleaut32.SafeArrayPtrOfIndex(var rgIndices:void ; var pvData:Pointer):HRESULT; stdcall;
begin
{*
 0042BB74    jmp         dword ptr ds:[826744]
*}
end;

//0042BB7C
{*function sub_0042BB7C(?:?; ?:?; ?:?):?;
begin
 0042BB7C    push        ebp
 0042BB7D    mov         ebp,esp
 0042BB7F    push        ebx
 0042BB80    mov         ebx,edx
 0042BB82    mov         edx,ebx
 0042BB84    mov         ecx,dword ptr [ebp+8]
 0042BB87    cmp         dword ptr [ecx-4],0
>0042BB8B    je          0042BBA2
 0042BB8D    push        eax
 0042BB8E    mov         eax,dword ptr [ebp+8]
 0042BB91    mov         eax,dword ptr [eax-4]
 0042BB94    push        eax
 0042BB95    call        kernel32.GetProcAddress
 0042BB9A    mov         edx,eax
 0042BB9C    test        edx,edx
>0042BB9E    jne         0042BBA2
 0042BBA0    mov         edx,ebx
 0042BBA2    mov         eax,edx
 0042BBA4    pop         ebx
 0042BBA5    pop         ebp
 0042BBA6    ret
end;*}

//0042BBA8
procedure sub_0042BBA8;
begin
{*
 0042BBA8    push        ebp
 0042BBA9    mov         ebp,esp
 0042BBAB    push        ecx
 0042BBAC    push        42BDA0;'oleaut32.dll'
 0042BBB1    call        kernel32.GetModuleHandleW
 0042BBB6    mov         dword ptr [ebp-4],eax
 0042BBB9    push        ebp
 0042BBBA    mov         edx,42B6E8;sub_0042B6E8
 0042BBBF    mov         eax,42BDBC
 0042BBC4    call        0042BB7C
 0042BBC9    pop         ecx
 0042BBCA    mov         [00792F18],eax;gvar_00792F18
 0042BBCF    push        ebp
 0042BBD0    mov         edx,42B730;sub_0042B730
 0042BBD5    mov         eax,42BDD0
 0042BBDA    call        0042BB7C
 0042BBDF    pop         ecx
 0042BBE0    mov         [00792F1C],eax;gvar_00792F1C
 0042BBE5    push        ebp
 0042BBE6    mov         edx,42B730;sub_0042B730
 0042BBEB    mov         eax,42BDD8
 0042BBF0    call        0042BB7C
 0042BBF5    pop         ecx
 0042BBF6    mov         [00792F20],eax;gvar_00792F20
 0042BBFB    push        ebp
 0042BBFC    mov         edx,42B73C;sub_0042B73C
 0042BC01    mov         eax,42BDE0
 0042BC06    call        0042BB7C
 0042BC0B    pop         ecx
 0042BC0C    mov         [00792F24],eax;gvar_00792F24
 0042BC11    push        ebp
 0042BC12    mov         edx,42B73C;sub_0042B73C
 0042BC17    mov         eax,42BDE8
 0042BC1C    call        0042BB7C
 0042BC21    pop         ecx
 0042BC22    mov         [00792F28],eax;gvar_00792F28
 0042BC27    push        ebp
 0042BC28    mov         edx,42B73C;sub_0042B73C
 0042BC2D    mov         eax,42BDF0
 0042BC32    call        0042BB7C
 0042BC37    pop         ecx
 0042BC38    mov         [00792F2C],eax;gvar_00792F2C
 0042BC3D    push        ebp
 0042BC3E    mov         edx,42B73C;sub_0042B73C
 0042BC43    mov         eax,42BDF8
 0042BC48    call        0042BB7C
 0042BC4D    pop         ecx
 0042BC4E    mov         [00792F30],eax;gvar_00792F30
 0042BC53    push        ebp
 0042BC54    mov         edx,42B73C;sub_0042B73C
 0042BC59    mov         eax,42BE00
 0042BC5E    call        0042BB7C
 0042BC63    pop         ecx
 0042BC64    mov         [00792F34],eax;gvar_00792F34
 0042BC69    push        ebp
 0042BC6A    mov         edx,42B73C;sub_0042B73C
 0042BC6F    mov         eax,42BE08
 0042BC74    call        0042BB7C
 0042BC79    pop         ecx
 0042BC7A    mov         [00792F38],eax;gvar_00792F38
 0042BC7F    push        ebp
 0042BC80    mov         edx,42B73C;sub_0042B73C
 0042BC85    mov         eax,42BE10
 0042BC8A    call        0042BB7C
 0042BC8F    pop         ecx
 0042BC90    mov         [00792F3C],eax;gvar_00792F3C
 0042BC95    push        ebp
 0042BC96    mov         edx,42B73C;sub_0042B73C
 0042BC9B    mov         eax,42BE18
 0042BCA0    call        0042BB7C
 0042BCA5    pop         ecx
 0042BCA6    mov         [00792F40],eax;gvar_00792F40
 0042BCAB    push        ebp
 0042BCAC    mov         edx,42B73C;sub_0042B73C
 0042BCB1    mov         eax,42BE20
 0042BCB6    call        0042BB7C
 0042BCBB    pop         ecx
 0042BCBC    mov         [00792F44],eax;gvar_00792F44
 0042BCC1    push        ebp
 0042BCC2    mov         edx,42B748;sub_0042B748
 0042BCC7    mov         eax,42BE28
 0042BCCC    call        0042BB7C
 0042BCD1    pop         ecx
 0042BCD2    mov         [00792F48],eax;gvar_00792F48
 0042BCD7    push        ebp
 0042BCD8    mov         edx,42B754
 0042BCDD    mov         eax,42BE30
 0042BCE2    call        0042BB7C
 0042BCE7    pop         ecx
 0042BCE8    mov         [00792F4C],eax;gvar_00792F4C
 0042BCED    push        ebp
 0042BCEE    mov         edx,42B7C0
 0042BCF3    mov         eax,42BE40
 0042BCF8    call        0042BB7C
 0042BCFD    pop         ecx
 0042BCFE    mov         [00792F50],eax;gvar_00792F50
 0042BD03    push        ebp
 0042BD04    mov         edx,42B830
 0042BD09    mov         eax,42BE50
 0042BD0E    call        0042BB7C
 0042BD13    pop         ecx
 0042BD14    mov         [00792F54],eax;gvar_00792F54
 0042BD19    push        ebp
 0042BD1A    mov         edx,42B8A0
 0042BD1F    mov         eax,42BE60
 0042BD24    call        0042BB7C
 0042BD29    pop         ecx
 0042BD2A    mov         [00792F58],eax;gvar_00792F58
 0042BD2F    push        ebp
 0042BD30    mov         edx,42B910
 0042BD35    mov         eax,42BE70
 0042BD3A    call        0042BB7C
 0042BD3F    pop         ecx
 0042BD40    mov         [00792F5C],eax;gvar_00792F5C
 0042BD45    push        ebp
 0042BD46    mov         edx,42B980
 0042BD4B    mov         eax,42BE80
 0042BD50    call        0042BB7C
 0042BD55    pop         ecx
 0042BD56    mov         [00792F60],eax;gvar_00792F60
 0042BD5B    push        ebp
 0042BD5C    mov         edx,42BA00
 0042BD61    mov         eax,42BE90
 0042BD66    call        0042BB7C
 0042BD6B    pop         ecx
 0042BD6C    mov         [00792F64],eax;gvar_00792F64
 0042BD71    push        ebp
 0042BD72    mov         edx,42BA74
 0042BD77    mov         eax,42BEA0
 0042BD7C    call        0042BB7C
 0042BD81    pop         ecx
 0042BD82    mov         [00792F68],eax;gvar_00792F68
 0042BD87    push        ebp
 0042BD88    mov         edx,42BAE8
 0042BD8D    mov         eax,42BEB0
 0042BD92    call        0042BB7C
 0042BD97    pop         ecx
 0042BD98    mov         [00792F6C],eax;gvar_00792F6C
 0042BD9D    pop         ecx
 0042BD9E    pop         ebp
 0042BD9F    ret
*}
end;

Initialization
//007801A8
{*
 007801A8    sub         dword ptr ds:[792F70],1
>007801AF    jae         007801B6
 007801B1    call        0042BBA8
 007801B6    ret
*}
Finalization
end.