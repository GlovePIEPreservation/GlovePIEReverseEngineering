//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit4;

interface

uses
  SysUtils, Classes;

type
  TErrorRec = TErrorRec = record//size=8
f4:string;//f4
end;
Code:Integer;//f0
Ident:string;//f4
end;;
  TUnitHashEntry = TUnitHashEntry = record//size=18
Next:PUnitHashEntry;//f0
Prev:PUnitHashEntry;//f4
LibModule:PLibModule;//f8
UnitName:PAnsiChar;//fC
DupsAllowed:Boolean;//f10
FullHash:Cardinal;//f14
end;;
  TModuleInfo = TModuleInfo = record//size=8
f4:TArray<SysUtils.TUnitHashEntry>;//f4
end;
Validated:Boolean;//f0
UnitHashArray:TArray<SysUtils.TUnitHashEntry>;//f4
end;;
  TArray<SysUtils.TUnitHashEntry> = array of TUnitHashEntry;
//elSize = 18;
    procedure sub_004259B0;//004259B0
    //procedure sub_004259BC(?:?);//004259BC
    //procedure sub_004259EC(?:?; ?:?);//004259EC
    procedure sub_00425A1C;//00425A1C
    procedure sub_00425A50;//00425A50
    function CheckWin32Version(AMajor:Integer; AMinor:Integer):Boolean;//00425AC0
    function GetFileVersion(const AFileName:UnicodeString):Cardinal;//00425AE0
    function ByteType(const S:UnicodeString; Index:Integer):TMbcsByteType;//00425BCC
    //procedure sub_00425C1C(?:?; ?:?);//00425C1C
    function ByteToCharLen(const S:UnicodeString; MaxLen:Integer):Integer;//00425C40
    //function sub_00425C48(?:?; ?:?):?;//00425C48
    procedure sub_00425CAC;//00425CAC
    //procedure sub_00425CB4(?:?; ?:?; ?:?; ?:?);//00425CB4
    //function sub_00425D40(?:?; ?:?):?;//00425D40
    function CharToByteIndex(const S:AnsiString; Index:Integer):Integer;//00425DB4
    //function sub_00425DBC(?:?; ?:?):?;//00425DBC
    function CharToByteLen(const S:UnicodeString; MaxLen:Integer):Integer;//00425E20
    function StrCharLength(const Str:PWideChar):Integer;//00425E28
    function StrNextChar(const Str:PWideChar):PWideChar;//00425E58
    function CharLength(const S:UnicodeString; Index:Integer):Integer;//00425E88
    function NextCharIndex(const S:UnicodeString; Index:Integer):Integer;//00425F74
    function IsPathDelimiter(const S:UnicodeString; Index:Integer):Boolean;//00426068
    function IsDelimiter(const Delimiters:UnicodeString; const S:UnicodeString; Index:Integer):Boolean;//004260B4
    function IncludeTrailingPathDelimiter(const S:UnicodeString):UnicodeString;//00426110
    function ExcludeTrailingPathDelimiter(const S:UnicodeString):UnicodeString;//00426160
    function AnsiPos(const Substr:UnicodeString; const S:UnicodeString):Integer;//004261B0
    function AnsiLowerCaseFileName(const S:UnicodeString):UnicodeString;//00426210
    function AnsiStrPos(Str:PAnsiChar; SubStr:PAnsiChar):PAnsiChar;//00426224
    function AnsiStrRScan(Str:PAnsiChar; Chr:AnsiChar):PAnsiChar;//0042622C
    function AnsiStrScan(Str:PWideChar; Chr:WideChar):PWideChar;//00426234
    procedure InitLeadBytes;//0042623C
    procedure InitSysLocale;//00426298
    procedure GetFormatSettings;//0042632C
    function StringReplace(const S:UnicodeString; const OldPattern:UnicodeString; const NewPattern:UnicodeString; Flags:TReplaceFlags):UnicodeString;//004264FC
    procedure sub_0042683C;//0042683C
    //procedure sub_00426874(?:?);//00426874
    procedure Sleep; stdcall;//0042698C
    procedure RaiseLastOSError;//00426994
    //procedure sub_004269A0(?:?);//004269A0
    function Win32Check(RetVal:BOOL):BOOL;//00426A38
    function CallTerminateProcs:Boolean;//00426A48
    procedure sub_00426A68;//00426A68
    procedure sub_00426A8C;//00426A8C
    destructor Destroy();//00426B08
    //function sub_00426B60:?;//00426B60
    procedure Open(var Thread:PThreadInfo);//00426B7C
    procedure Close(var Thread:PThreadInfo);//00426BF4
    procedure Delete(var Thread:PThreadInfo);//00426BFC
    //function sub_00426C0C(?:TThreadLocalCounter):?;//00426C0C
    constructor Create();//00426C50
    destructor Destroy();//00426CC4
    procedure sub_00426D0C(?:TMultiReadExclusiveWriteSynchronizer);//00426D0C
    procedure sub_00426D18(?:TMultiReadExclusiveWriteSynchronizer);//00426D18
    procedure sub_00426D24(?:TMultiReadExclusiveWriteSynchronizer);//00426D24
    procedure sub_00426D30(?:TMultiReadExclusiveWriteSynchronizer);//00426D30
    procedure sub_00426D40(?:TMultiReadExclusiveWriteSynchronizer);//00426D40
    function BeginWrite:Boolean;//00426D50
    procedure EndWrite;//00426DFC
    procedure BeginRead;//00426EE8
    procedure EndRead;//00426F58
    procedure FreeAndNil(var Obj:void );//00426FC0
    function Supports(const Instance:IInterface; const IID:TGUID; var Intf:void ):Boolean;//00426FD0
    function Supports(const Instance:TObject; const IID:TGUID; var Intf:void ):Boolean;//00426FF4
    function Supports(const Instance:TObject; const IID:TGUID):Boolean;//0042708C
    //function sub_004270E0(?:TPersistent; ?:?):?;//004270E0
    function EnumLocalesCallback(LocaleID:PChar):Integer; stdcall;//00427134
    function GetLocaleDataW(ID:LCID; Flag:DWORD):UnicodeString;//0042714C
    function LocalesCallback(LocaleID:PChar):Integer; stdcall;//00427184
    constructor Create();//0042730C
    destructor Destroy();//00427354
    function GetLocaleID(Index:Integer):LCID;//00427388
    function IndexOf(ID:Cardinal):Integer;//00427394
    function IndexOf(LocaleName:string):Integer;//004273C4

implementation

//004259B0
procedure sub_004259B0;
begin
{*
 004259B0    mov         eax,[0078D1F0];^gvar_0078E8CC
 004259B5    mov         dword ptr [eax],784E34
 004259BB    ret
*}
end;

//004259BC
{*procedure sub_004259BC(?:?);
begin
 004259BC    push        ebx
 004259BD    push        esi
 004259BE    push        edi
 004259BF    mov         esi,eax
 004259C1    mov         ebx,esi
 004259C3    test        ebx,ebx
>004259C5    je          004259E8
 004259C7    mov         esi,dword ptr [ebx]
 004259C9    mov         edi,dword ptr [ebx+4]
 004259CC    test        edi,edi
>004259CE    je          004259D6
 004259D0    push        edi
 004259D1    call        kernel32.CloseHandle
 004259D6    mov         edx,8
 004259DB    mov         eax,ebx
 004259DD    call        @FreeMem
 004259E2    mov         ebx,esi
 004259E4    test        ebx,ebx
>004259E6    jne         004259C7
 004259E8    pop         edi
 004259E9    pop         esi
 004259EA    pop         ebx
 004259EB    ret
end;*}

//004259EC
{*procedure sub_004259EC(?:?; ?:?);
begin
 004259EC    push        ebx
 004259ED    push        esi
 004259EE    mov         esi,edx
 004259F0    test        esi,esi
>004259F2    jl          00425A18
 004259F4    inc         esi
 004259F5    mov         ebx,eax
 004259F7    mov         eax,ebx
 004259F9    xor         ecx,ecx
 004259FB    mov         edx,1
 00425A00    call        0041E658
 00425A05    test        eax,eax
>00425A07    jne         004259F7
 00425A09    mov         eax,dword ptr [ebx+4]
 00425A0C    push        eax
 00425A0D    call        kernel32.CloseHandle
 00425A12    add         ebx,8
 00425A15    dec         esi
>00425A16    jne         004259F7
 00425A18    pop         esi
 00425A19    pop         ebx
 00425A1A    ret
end;*}

//00425A1C
procedure sub_00425A1C;
begin
{*
 00425A1C    mov         eax,790F1C;gvar_00790F1C
 00425A21    xor         edx,edx
 00425A23    call        0041E694
 00425A28    call        004259BC
 00425A2D    mov         eax,790F20;gvar_00790F20
 00425A32    xor         edx,edx
 00425A34    call        0041E694
 00425A39    call        004259BC
 00425A3E    mov         eax,790E1C;gvar_00790E1C
 00425A43    mov         edx,1F
 00425A48    call        004259EC
 00425A4D    ret
*}
end;

//00425A50
procedure sub_00425A50;
begin
{*
 00425A50    add         esp,0FFFFFEEC
 00425A56    mov         dword ptr [esp],114
 00425A5D    push        esp
 00425A5E    call        kernel32.GetVersionExW
 00425A63    test        eax,eax
>00425A65    je          00425AB7
 00425A67    mov         eax,dword ptr [esp+10]
 00425A6B    mov         [00784C7C],eax;gvar_00784C7C
 00425A70    mov         eax,dword ptr [esp+4]
 00425A74    mov         [00784C80],eax;gvar_00784C80
 00425A79    mov         eax,dword ptr [esp+8]
 00425A7D    mov         [00784C84],eax;gvar_00784C84
 00425A82    cmp         dword ptr ds:[784C7C],1;gvar_00784C7C
>00425A89    jne         00425A9B
 00425A8B    mov         eax,dword ptr [esp+0C]
 00425A8F    and         eax,0FFFF
 00425A94    mov         [00784C88],eax;gvar_00784C88
>00425A99    jmp         00425AA4
 00425A9B    mov         eax,dword ptr [esp+0C]
 00425A9F    mov         [00784C88],eax;gvar_00784C88
 00425AA4    mov         eax,784C8C;gvar_00784C8C
 00425AA9    lea         edx,[esp+14]
 00425AAD    mov         ecx,80
 00425AB2    call        @UStrFromWArray
 00425AB7    add         esp,114
 00425ABD    ret
*}
end;

//00425AC0
function CheckWin32Version(AMajor:Integer; AMinor:Integer):Boolean;
begin
{*
 00425AC0    cmp         eax,dword ptr ds:[784C80];gvar_00784C80
>00425AC6    jl          00425ADB
 00425AC8    cmp         eax,dword ptr ds:[784C80];gvar_00784C80
>00425ACE    jne         00425AD8
 00425AD0    cmp         edx,dword ptr ds:[784C84];gvar_00784C84
>00425AD6    jle         00425ADB
 00425AD8    xor         eax,eax
 00425ADA    ret
 00425ADB    mov         al,1
 00425ADD    ret
*}
end;

//00425AE0
function GetFileVersion(const AFileName:UnicodeString):Cardinal;
begin
{*
 00425AE0    push        ebp
 00425AE1    mov         ebp,esp
 00425AE3    add         esp,0FFFFFFE8
 00425AE6    push        ebx
 00425AE7    xor         edx,edx
 00425AE9    mov         dword ptr [ebp-4],edx
 00425AEC    mov         ebx,eax
 00425AEE    xor         eax,eax
 00425AF0    push        ebp
 00425AF1    push        425BB6
 00425AF6    push        dword ptr fs:[eax]
 00425AF9    mov         dword ptr fs:[eax],esp
 00425AFC    mov         dword ptr [ebp-8],0FFFFFFFF
 00425B03    lea         eax,[ebp-4]
 00425B06    mov         edx,ebx
 00425B08    call        @UStrLAsg
 00425B0D    lea         eax,[ebp-4]
 00425B10    call        UniqueString
 00425B15    lea         eax,[ebp-0C]
 00425B18    push        eax
 00425B19    mov         eax,dword ptr [ebp-4]
 00425B1C    call        @UStrToPWChar
 00425B21    push        eax
 00425B22    call        version.GetFileVersionInfoSizeW
 00425B27    mov         ebx,eax
 00425B29    test        ebx,ebx
>00425B2B    je          00425BA0
 00425B2D    mov         eax,ebx
 00425B2F    call        @GetMem
 00425B34    mov         dword ptr [ebp-10],eax
 00425B37    xor         eax,eax
 00425B39    push        ebp
 00425B3A    push        425B99
 00425B3F    push        dword ptr fs:[eax]
 00425B42    mov         dword ptr fs:[eax],esp
 00425B45    mov         eax,dword ptr [ebp-10]
 00425B48    push        eax
 00425B49    push        ebx
 00425B4A    mov         eax,dword ptr [ebp-0C]
 00425B4D    push        eax
 00425B4E    mov         eax,dword ptr [ebp-4]
 00425B51    call        @UStrToPWChar
 00425B56    push        eax
 00425B57    call        version.GetFileVersionInfoW
 00425B5C    test        eax,eax
>00425B5E    je          00425B83
 00425B60    lea         eax,[ebp-18]
 00425B63    push        eax
 00425B64    lea         eax,[ebp-14]
 00425B67    push        eax
 00425B68    push        425BC8
 00425B6D    mov         eax,dword ptr [ebp-10]
 00425B70    push        eax
 00425B71    call        version.VerQueryValueW
 00425B76    test        eax,eax
>00425B78    je          00425B83
 00425B7A    mov         eax,dword ptr [ebp-14]
 00425B7D    mov         eax,dword ptr [eax+8]
 00425B80    mov         dword ptr [ebp-8],eax
 00425B83    xor         eax,eax
 00425B85    pop         edx
 00425B86    pop         ecx
 00425B87    pop         ecx
 00425B88    mov         dword ptr fs:[eax],edx
 00425B8B    push        425BA0
 00425B90    mov         eax,dword ptr [ebp-10]
 00425B93    call        @FreeMem
 00425B98    ret
>00425B99    jmp         @HandleFinally
>00425B9E    jmp         00425B90
 00425BA0    xor         eax,eax
 00425BA2    pop         edx
 00425BA3    pop         ecx
 00425BA4    pop         ecx
 00425BA5    mov         dword ptr fs:[eax],edx
 00425BA8    push        425BBD
 00425BAD    lea         eax,[ebp-4]
 00425BB0    call        @UStrClr
 00425BB5    ret
>00425BB6    jmp         @HandleFinally
>00425BBB    jmp         00425BAD
 00425BBD    mov         eax,dword ptr [ebp-8]
 00425BC0    pop         ebx
 00425BC1    mov         esp,ebp
 00425BC3    pop         ebp
 00425BC4    ret
*}
end;

//00425BCC
function ByteType(const S:UnicodeString; Index:Integer):TMbcsByteType;
begin
{*
 00425BCC    push        esi
 00425BCD    mov         esi,eax
 00425BCF    xor         eax,eax
 00425BD1    test        edx,edx
>00425BD3    jle         00425BE7
 00425BD5    mov         ecx,esi
 00425BD7    test        ecx,ecx
>00425BD9    je          00425BE0
 00425BDB    sub         ecx,4
 00425BDE    mov         ecx,dword ptr [ecx]
 00425BE0    cmp         ecx,edx
 00425BE2    setge       cl
>00425BE5    jmp         00425BE9
 00425BE7    xor         ecx,ecx
 00425BE9    test        cl,cl
>00425BEB    je          00425C17
 00425BED    movzx       ecx,word ptr [esi+edx*2-2]
 00425BF2    cmp         cx,0D800
>00425BF7    jb          00425C17
 00425BF9    cmp         cx,0DFFF
>00425BFE    ja          00425C17
 00425C00    movzx       eax,word ptr [esi+edx*2-2]
 00425C05    cmp         ax,0D800
>00425C09    jb          00425C15
 00425C0B    cmp         ax,0DBFF
>00425C0F    ja          00425C15
 00425C11    mov         al,1
>00425C13    jmp         00425C17
 00425C15    mov         al,2
 00425C17    pop         esi
 00425C18    ret
*}
end;

//00425C1C
{*procedure sub_00425C1C(?:?; ?:?);
begin
 00425C1C    push        ebx
 00425C1D    mov         ebx,eax
 00425C1F    mov         ecx,ebx
 00425C21    test        ecx,ecx
>00425C23    je          00425C2A
 00425C25    sub         ecx,4
 00425C28    mov         ecx,dword ptr [ecx]
 00425C2A    cmp         edx,ecx
>00425C2C    jle         00425C39
 00425C2E    mov         edx,ebx
 00425C30    test        edx,edx
>00425C32    je          00425C39
 00425C34    sub         edx,4
 00425C37    mov         edx,dword ptr [edx]
 00425C39    call        00425CAC
 00425C3E    pop         ebx
 00425C3F    ret
end;*}

//00425C40
function ByteToCharLen(const S:UnicodeString; MaxLen:Integer):Integer;
begin
{*
 00425C40    call        00425C1C
 00425C45    ret
*}
end;

//00425C48
{*function sub_00425C48(?:?; ?:?):?;
begin
 00425C48    push        ebx
 00425C49    push        esi
 00425C4A    push        edi
 00425C4B    push        ebp
 00425C4C    push        ecx
 00425C4D    mov         ebp,edx
 00425C4F    mov         esi,eax
 00425C51    xor         eax,eax
 00425C53    mov         dword ptr [esp],eax
 00425C56    test        ebp,ebp
>00425C58    jg          00425C5E
 00425C5A    mov         al,1
>00425C5C    jmp         00425C6E
 00425C5E    mov         eax,esi
 00425C60    test        eax,eax
>00425C62    je          00425C69
 00425C64    sub         eax,4
 00425C67    mov         eax,dword ptr [eax]
 00425C69    cmp         eax,ebp
 00425C6B    setl        al
 00425C6E    test        al,al
>00425C70    jne         00425CA3
 00425C72    mov         ebx,1
 00425C77    cmp         ebp,ebx
>00425C79    jl          00425CA3
 00425C7B    movzx       edi,word ptr [esi+ebx*2-2]
 00425C80    cmp         di,0D800
>00425C85    jb          00425C9B
 00425C87    cmp         di,0DFFF
>00425C8C    ja          00425C9B
 00425C8E    mov         edx,ebx
 00425C90    mov         eax,esi
 00425C92    call        NextCharIndex
 00425C97    mov         ebx,eax
>00425C99    jmp         00425C9C
 00425C9B    inc         ebx
 00425C9C    inc         dword ptr [esp]
 00425C9F    cmp         ebp,ebx
>00425CA1    jge         00425C7B
 00425CA3    mov         eax,dword ptr [esp]
 00425CA6    pop         edx
 00425CA7    pop         ebp
 00425CA8    pop         edi
 00425CA9    pop         esi
 00425CAA    pop         ebx
 00425CAB    ret
end;*}

//00425CAC
procedure sub_00425CAC;
begin
{*
 00425CAC    call        00425C48
 00425CB1    ret
*}
end;

//00425CB4
{*procedure sub_00425CB4(?:?; ?:?; ?:?; ?:?);
begin
 00425CB4    push        ebp
 00425CB5    mov         ebp,esp
 00425CB7    add         esp,0FFFFFFF8
 00425CBA    push        ebx
 00425CBB    push        esi
 00425CBC    push        edi
 00425CBD    mov         dword ptr [ebp-8],ecx
 00425CC0    mov         dword ptr [ebp-4],edx
 00425CC3    mov         edi,eax
 00425CC5    mov         eax,edi
 00425CC7    test        eax,eax
>00425CC9    je          00425CD0
 00425CCB    sub         eax,4
 00425CCE    mov         eax,dword ptr [eax]
 00425CD0    mov         esi,1
 00425CD5    mov         ebx,1
>00425CDA    jmp         00425CFC
 00425CDC    inc         esi
 00425CDD    movzx       edx,word ptr [edi+ebx*2-2]
 00425CE2    cmp         dx,0D800
>00425CE7    jb          00425CFB
 00425CE9    cmp         dx,0DFFF
>00425CEE    ja          00425CFB
 00425CF0    add         ebx,2
 00425CF3    cmp         eax,ebx
>00425CF5    jge         00425CFC
 00425CF7    dec         esi
 00425CF8    dec         ebx
>00425CF9    jmp         00425CFC
 00425CFB    inc         ebx
 00425CFC    cmp         eax,ebx
>00425CFE    jle         00425D05
 00425D00    cmp         esi,dword ptr [ebp-4]
>00425D03    jl          00425CDC
 00425D05    cmp         esi,dword ptr [ebp-4]
>00425D08    jne         00425D2B
 00425D0A    cmp         eax,ebx
>00425D0C    jle         00425D2B
 00425D0E    movzx       eax,word ptr [edi+ebx*2-2]
 00425D13    cmp         ax,0D800
>00425D17    jb          00425D2B
 00425D19    cmp         ax,0DFFF
>00425D1D    ja          00425D2B
 00425D1F    mov         edx,ebx
 00425D21    mov         eax,edi
 00425D23    call        NextCharIndex
 00425D28    dec         eax
 00425D29    mov         ebx,eax
 00425D2B    mov         eax,dword ptr [ebp-8]
 00425D2E    mov         dword ptr [eax],esi
 00425D30    mov         eax,dword ptr [ebp+8]
 00425D33    mov         dword ptr [eax],ebx
 00425D35    pop         edi
 00425D36    pop         esi
 00425D37    pop         ebx
 00425D38    pop         ecx
 00425D39    pop         ecx
 00425D3A    pop         ebp
 00425D3B    ret         4
end;*}

//00425D40
{*function sub_00425D40(?:?; ?:?):?;
begin
 00425D40    push        ebx
 00425D41    push        esi
 00425D42    push        edi
 00425D43    add         esp,0FFFFFFF8
 00425D46    mov         ebx,edx
 00425D48    mov         esi,eax
 00425D4A    xor         eax,eax
 00425D4C    mov         dword ptr [esp],eax
 00425D4F    test        ebx,ebx
>00425D51    jg          00425D57
 00425D53    mov         al,1
>00425D55    jmp         00425D67
 00425D57    mov         eax,esi
 00425D59    test        eax,eax
>00425D5B    je          00425D62
 00425D5D    sub         eax,4
 00425D60    mov         eax,dword ptr [eax]
 00425D62    cmp         eax,ebx
 00425D64    setl        al
 00425D67    test        al,al
>00425D69    jne         00425DA8
 00425D6B    push        esp
 00425D6C    lea         ecx,[esp+8]
 00425D70    mov         edi,ebx
 00425D72    dec         edi
 00425D73    mov         edx,edi
 00425D75    mov         eax,esi
 00425D77    call        00425CB4
 00425D7C    cmp         edi,dword ptr [esp+4]
>00425D80    jle         00425D86
 00425D82    mov         al,1
>00425D84    jmp         00425D97
 00425D86    mov         eax,esi
 00425D88    test        eax,eax
>00425D8A    je          00425D91
 00425D8C    sub         eax,4
 00425D8F    mov         eax,dword ptr [eax]
 00425D91    cmp         eax,dword ptr [esp]
 00425D94    setle       al
 00425D97    test        al,al
>00425D99    je          00425DA2
 00425D9B    xor         eax,eax
 00425D9D    mov         dword ptr [esp],eax
>00425DA0    jmp         00425DA8
 00425DA2    dec         ebx
>00425DA3    jle         00425DA8
 00425DA5    inc         dword ptr [esp]
 00425DA8    mov         eax,dword ptr [esp]
 00425DAB    pop         ecx
 00425DAC    pop         edx
 00425DAD    pop         edi
 00425DAE    pop         esi
 00425DAF    pop         ebx
 00425DB0    ret
end;*}

//00425DB4
function CharToByteIndex(const S:AnsiString; Index:Integer):Integer;
begin
{*
 00425DB4    call        00425D40
 00425DB9    ret
*}
end;

//00425DBC
{*function sub_00425DBC(?:?; ?:?):?;
begin
 00425DBC    push        ebx
 00425DBD    push        esi
 00425DBE    add         esp,0FFFFFFF8
 00425DC1    mov         ebx,eax
 00425DC3    xor         eax,eax
 00425DC5    mov         dword ptr [esp],eax
 00425DC8    test        edx,edx
>00425DCA    jle         00425E18
 00425DCC    mov         esi,ebx
 00425DCE    mov         eax,esi
 00425DD0    test        eax,eax
>00425DD2    je          00425DD9
 00425DD4    sub         eax,4
 00425DD7    mov         eax,dword ptr [eax]
 00425DD9    cmp         eax,edx
>00425DDB    jge         00425DEA
 00425DDD    mov         eax,esi
 00425DDF    test        eax,eax
>00425DE1    je          00425DE8
 00425DE3    sub         eax,4
 00425DE6    mov         eax,dword ptr [eax]
 00425DE8    mov         edx,eax
 00425DEA    push        esp
 00425DEB    lea         ecx,[esp+8]
 00425DEF    mov         eax,ebx
 00425DF1    call        00425CB4
 00425DF6    mov         eax,esi
 00425DF8    test        eax,eax
>00425DFA    je          00425E01
 00425DFC    sub         eax,4
 00425DFF    mov         eax,dword ptr [eax]
 00425E01    add         eax,eax
 00425E03    cmp         eax,dword ptr [esp]
>00425E06    jge         00425E18
 00425E08    mov         eax,esi
 00425E0A    test        eax,eax
>00425E0C    je          00425E13
 00425E0E    sub         eax,4
 00425E11    mov         eax,dword ptr [eax]
 00425E13    add         eax,eax
 00425E15    mov         dword ptr [esp],eax
 00425E18    mov         eax,dword ptr [esp]
 00425E1B    pop         ecx
 00425E1C    pop         edx
 00425E1D    pop         esi
 00425E1E    pop         ebx
 00425E1F    ret
end;*}

//00425E20
function CharToByteLen(const S:UnicodeString; MaxLen:Integer):Integer;
begin
{*
 00425E20    call        00425DBC
 00425E25    ret
*}
end;

//00425E28
function StrCharLength(const Str:PWideChar):Integer;
begin
{*
 00425E28    movzx       edx,word ptr [eax]
 00425E2B    cmp         dx,0D800
>00425E30    jb          00425E4F
 00425E32    cmp         dx,0DBFF
>00425E37    ja          00425E4F
 00425E39    cmp         word ptr [eax+2],0DC00
>00425E3F    jb          00425E4F
 00425E41    cmp         word ptr [eax+2],0DFFF
>00425E47    ja          00425E4F
 00425E49    mov         eax,4
 00425E4E    ret
 00425E4F    mov         eax,2
 00425E54    ret
*}
end;

//00425E58
function StrNextChar(const Str:PWideChar):PWideChar;
begin
{*
 00425E58    movzx       edx,word ptr [eax]
 00425E5B    cmp         dx,0D800
>00425E60    jb          00425E7D
 00425E62    cmp         dx,0DBFF
>00425E67    ja          00425E7D
 00425E69    cmp         word ptr [eax+2],0DC00
>00425E6F    jb          00425E7D
 00425E71    cmp         word ptr [eax+2],0DFFF
>00425E77    ja          00425E7D
 00425E79    add         eax,4
 00425E7C    ret
 00425E7D    test        dx,dx
>00425E80    je          00425E85
 00425E82    add         eax,2
 00425E85    ret
*}
end;

//00425E88
function CharLength(const S:UnicodeString; Index:Integer):Integer;
begin
{*
 00425E88    push        ebx
 00425E89    push        esi
 00425E8A    push        edi
 00425E8B    mov         ebx,edx
 00425E8D    mov         esi,eax
 00425E8F    mov         edi,2
 00425E94    test        ebx,ebx
>00425E96    jle         00425EAA
 00425E98    mov         eax,esi
 00425E9A    test        eax,eax
>00425E9C    je          00425EA3
 00425E9E    sub         eax,4
 00425EA1    mov         eax,dword ptr [eax]
 00425EA3    cmp         eax,ebx
 00425EA5    setge       al
>00425EA8    jmp         00425EAC
 00425EAA    xor         eax,eax
 00425EAC    test        al,al
>00425EAE    jne         00425EC4
 00425EB0    mov         ecx,451B
 00425EB5    mov         edx,425F00;'C:\Builds\TP\rtl\sys\SysUtils.pas'
 00425EBA    mov         eax,425F50;'Assertion failure'
 00425EBF    call        @Assert
 00425EC4    movzx       eax,word ptr [esi+ebx*2-2]
 00425EC9    cmp         ax,0D800
>00425ECD    jb          00425EEC
 00425ECF    cmp         ax,0DFFF
>00425ED3    ja          00425EEC
 00425ED5    mov         eax,esi
 00425ED7    call        @UStrToPWChar
 00425EDC    mov         edx,ebx
 00425EDE    add         edx,edx
 00425EE0    add         eax,edx
 00425EE2    sub         eax,2
 00425EE5    call        StrCharLength
 00425EEA    mov         edi,eax
 00425EEC    mov         eax,edi
 00425EEE    pop         edi
 00425EEF    pop         esi
 00425EF0    pop         ebx
 00425EF1    ret
*}
end;

//00425F74
function NextCharIndex(const S:UnicodeString; Index:Integer):Integer;
begin
{*
 00425F74    push        ebx
 00425F75    push        esi
 00425F76    push        edi
 00425F77    mov         ebx,edx
 00425F79    mov         esi,eax
 00425F7B    lea         edi,[ebx+1]
 00425F7E    test        ebx,ebx
>00425F80    jle         00425F94
 00425F82    mov         eax,esi
 00425F84    test        eax,eax
>00425F86    je          00425F8D
 00425F88    sub         eax,4
 00425F8B    mov         eax,dword ptr [eax]
 00425F8D    cmp         eax,ebx
 00425F8F    setge       al
>00425F92    jmp         00425F96
 00425F94    xor         eax,eax
 00425F96    test        al,al
>00425F98    jne         00425FAE
 00425F9A    mov         ecx,452B
 00425F9F    mov         edx,425FF4;'C:\Builds\TP\rtl\sys\SysUtils.pas'
 00425FA4    mov         eax,426044;'Assertion failure'
 00425FA9    call        @Assert
 00425FAE    movzx       eax,word ptr [esi+ebx*2-2]
 00425FB3    cmp         ax,0D800
>00425FB7    jb          00425FDF
 00425FB9    cmp         ax,0DFFF
>00425FBD    ja          00425FDF
 00425FBF    mov         eax,esi
 00425FC1    call        @UStrToPWChar
 00425FC6    mov         edx,ebx
 00425FC8    add         edx,edx
 00425FCA    add         eax,edx
 00425FCC    sub         eax,2
 00425FCF    call        StrCharLength
 00425FD4    mov         edi,eax
 00425FD6    sar         edi,1
>00425FD8    jns         00425FDD
 00425FDA    adc         edi,0
 00425FDD    add         edi,ebx
 00425FDF    mov         eax,edi
 00425FE1    pop         edi
 00425FE2    pop         esi
 00425FE3    pop         ebx
 00425FE4    ret
*}
end;

//00426068
function IsPathDelimiter(const S:UnicodeString; Index:Integer):Boolean;
begin
{*
 00426068    push        ebx
 00426069    push        esi
 0042606A    mov         ebx,edx
 0042606C    mov         esi,eax
 0042606E    test        ebx,ebx
>00426070    jle         00426084
 00426072    mov         eax,esi
 00426074    test        eax,eax
>00426076    je          0042607D
 00426078    sub         eax,4
 0042607B    mov         eax,dword ptr [eax]
 0042607D    cmp         eax,ebx
 0042607F    setge       al
>00426082    jmp         00426086
 00426084    xor         eax,eax
 00426086    test        al,al
>00426088    je          00426095
 0042608A    cmp         word ptr [esi+ebx*2-2],5C
 00426090    sete        al
>00426093    jmp         00426097
 00426095    xor         eax,eax
 00426097    test        al,al
>00426099    je          004260AC
 0042609B    mov         edx,ebx
 0042609D    mov         eax,esi
 0042609F    call        ByteType
 004260A4    test        al,al
 004260A6    sete        al
 004260A9    pop         esi
 004260AA    pop         ebx
 004260AB    ret
 004260AC    xor         eax,eax
 004260AE    pop         esi
 004260AF    pop         ebx
 004260B0    ret
*}
end;

//004260B4
function IsDelimiter(const Delimiters:UnicodeString; const S:UnicodeString; Index:Integer):Boolean;
begin
{*
 004260B4    push        ebx
 004260B5    push        esi
 004260B6    push        edi
 004260B7    push        ebp
 004260B8    mov         edi,ecx
 004260BA    mov         esi,edx
 004260BC    mov         ebp,eax
 004260BE    xor         ebx,ebx
 004260C0    test        edi,edi
>004260C2    jg          004260C8
 004260C4    mov         al,1
>004260C6    jmp         004260D8
 004260C8    mov         eax,esi
 004260CA    test        eax,eax
>004260CC    je          004260D3
 004260CE    sub         eax,4
 004260D1    mov         eax,dword ptr [eax]
 004260D3    cmp         eax,edi
 004260D5    setl        al
 004260D8    test        al,al
>004260DA    je          004260E0
 004260DC    mov         al,1
>004260DE    jmp         004260EE
 004260E0    mov         edx,edi
 004260E2    mov         eax,esi
 004260E4    call        ByteType
 004260E9    test        al,al
 004260EB    setne       al
 004260EE    test        al,al
>004260F0    jne         00426108
 004260F2    mov         eax,ebp
 004260F4    call        @UStrToPWChar
 004260F9    movzx       edx,word ptr [esi+edi*2-2]
 004260FE    call        StrScan
 00426103    test        eax,eax
 00426105    setne       bl
 00426108    mov         eax,ebx
 0042610A    pop         ebp
 0042610B    pop         edi
 0042610C    pop         esi
 0042610D    pop         ebx
 0042610E    ret
*}
end;

//00426110
function IncludeTrailingPathDelimiter(const S:UnicodeString):UnicodeString;
begin
{*
 00426110    push        ebx
 00426111    push        esi
 00426112    push        ecx
 00426113    mov         ebx,edx
 00426115    mov         esi,eax
 00426117    mov         eax,ebx
 00426119    mov         edx,esi
 0042611B    call        @UStrAsg
 00426120    mov         eax,dword ptr [ebx]
 00426122    mov         dword ptr [esp],eax
 00426125    mov         esi,dword ptr [esp]
 00426128    test        esi,esi
>0042612A    je          00426131
 0042612C    sub         esi,4
 0042612F    mov         esi,dword ptr [esi]
 00426131    mov         eax,dword ptr [ebx]
 00426133    mov         edx,esi
 00426135    call        IsPathDelimiter
 0042613A    test        al,al
>0042613C    jne         0042614A
 0042613E    mov         eax,ebx
 00426140    mov         edx,42615C;'\'
 00426145    call        @UStrCat
 0042614A    pop         edx
 0042614B    pop         esi
 0042614C    pop         ebx
 0042614D    ret
*}
end;

//00426160
function ExcludeTrailingPathDelimiter(const S:UnicodeString):UnicodeString;
begin
{*
 00426160    push        ebx
 00426161    push        esi
 00426162    push        ecx
 00426163    mov         ebx,edx
 00426165    mov         esi,eax
 00426167    mov         eax,ebx
 00426169    mov         edx,esi
 0042616B    call        @UStrAsg
 00426170    mov         eax,dword ptr [ebx]
 00426172    mov         dword ptr [esp],eax
 00426175    mov         esi,dword ptr [esp]
 00426178    test        esi,esi
>0042617A    je          00426181
 0042617C    sub         esi,4
 0042617F    mov         esi,dword ptr [esi]
 00426181    mov         eax,dword ptr [ebx]
 00426183    mov         edx,esi
 00426185    call        IsPathDelimiter
 0042618A    test        al,al
>0042618C    je          004261A9
 0042618E    mov         eax,dword ptr [ebx]
 00426190    mov         dword ptr [esp],eax
 00426193    mov         eax,dword ptr [esp]
 00426196    test        eax,eax
>00426198    je          0042619F
 0042619A    sub         eax,4
 0042619D    mov         eax,dword ptr [eax]
 0042619F    mov         edx,eax
 004261A1    dec         edx
 004261A2    mov         eax,ebx
 004261A4    call        @UStrSetLength
 004261A9    pop         edx
 004261AA    pop         esi
 004261AB    pop         ebx
 004261AC    ret
*}
end;

//004261B0
function AnsiPos(const Substr:UnicodeString; const S:UnicodeString):Integer;
begin
{*
 004261B0    push        ebx
 004261B1    push        esi
 004261B2    push        edi
 004261B3    push        ebp
 004261B4    push        ecx
 004261B5    mov         edi,edx
 004261B7    mov         ebp,eax
 004261B9    xor         eax,eax
 004261BB    mov         dword ptr [esp],eax
 004261BE    mov         ebx,edi
 004261C0    test        ebx,ebx
>004261C2    je          004261C9
 004261C4    sub         ebx,4
 004261C7    mov         ebx,dword ptr [ebx]
 004261C9    mov         esi,ebp
 004261CB    test        esi,esi
>004261CD    je          004261D4
 004261CF    sub         esi,4
 004261D2    mov         esi,dword ptr [esi]
 004261D4    push        esi
 004261D5    mov         eax,ebp
 004261D7    call        @UStrToPWChar
 004261DC    push        eax
 004261DD    mov         eax,edi
 004261DF    call        @UStrToPWChar
 004261E4    mov         ecx,ebx
 004261E6    pop         edx
 004261E7    call        StrPosLen
 004261EC    mov         ebx,eax
 004261EE    test        ebx,ebx
>004261F0    je          00426206
 004261F2    mov         eax,edi
 004261F4    call        @UStrToPWChar
 004261F9    sub         ebx,eax
 004261FB    sar         ebx,1
>004261FD    jns         00426202
 004261FF    adc         ebx,0
 00426202    inc         ebx
 00426203    mov         dword ptr [esp],ebx
 00426206    mov         eax,dword ptr [esp]
 00426209    pop         edx
 0042620A    pop         ebp
 0042620B    pop         edi
 0042620C    pop         esi
 0042620D    pop         ebx
 0042620E    ret
*}
end;

//00426210
function AnsiLowerCaseFileName(const S:UnicodeString):UnicodeString;
begin
{*
 00426210    push        ebx
 00426211    push        esi
 00426212    mov         esi,edx
 00426214    mov         ebx,eax
 00426216    mov         edx,esi
 00426218    mov         eax,ebx
 0042621A    call        AnsiLowerCase
 0042621F    pop         esi
 00426220    pop         ebx
 00426221    ret
*}
end;

//00426224
function AnsiStrPos(Str:PAnsiChar; SubStr:PAnsiChar):PAnsiChar;
begin
{*
 00426224    call        StrPos
 00426229    ret
*}
end;

//0042622C
function AnsiStrRScan(Str:PAnsiChar; Chr:AnsiChar):PAnsiChar;
begin
{*
 0042622C    call        StrRScan
 00426231    ret
*}
end;

//00426234
function AnsiStrScan(Str:PWideChar; Chr:WideChar):PWideChar;
begin
{*
 00426234    call        StrScan
 00426239    ret
*}
end;

//0042623C
procedure InitLeadBytes;
begin
{*
 0042623C    push        ebp
 0042623D    mov         ebp,esp
 0042623F    push        ecx
 00426240    push        ebx
 00426241    push        esi
 00426242    push        edi
 00426243    mov         edi,dword ptr [ebp+8]
 00426246    add         edi,0FFFFFFEC
 00426249    push        edi
 0042624A    push        0
 0042624C    call        kernel32.GetCPInfo
 00426251    xor         esi,esi
>00426253    jmp         0042627F
 00426255    movzx       eax,byte ptr [edi+esi+6]
 0042625A    movzx       ebx,byte ptr [edi+esi+7]
 0042625F    sub         bl,al
>00426261    jb          0042627C
 00426263    inc         ebx
 00426264    mov         byte ptr [ebp-1],al
 00426267    movzx       eax,byte ptr [ebp-1]
 0042626B    movzx       eax,al
 0042626E    bts         dword ptr ds:[784CC0],eax
 00426275    inc         byte ptr [ebp-1]
 00426278    dec         bl
>0042627A    jne         00426267
 0042627C    add         esi,2
 0042627F    cmp         esi,0C
>00426282    jge         0042628F
 00426284    movzx       eax,byte ptr [edi+esi+6]
 00426289    or          al,byte ptr [edi+esi+7]
>0042628D    jne         00426255
 0042628F    pop         edi
 00426290    pop         esi
 00426291    pop         ebx
 00426292    pop         ecx
 00426293    pop         ebp
 00426294    ret
*}
end;

//00426298
procedure InitSysLocale;
begin
{*
 00426298    push        ebp
 00426299    mov         ebp,esp
 0042629B    add         esp,0FFFFFFEC
 0042629E    push        ebx
 0042629F    push        esi
 004262A0    push        edi
 004262A1    mov         ebx,790D9F
 004262A6    mov         dword ptr [ebx],409
 004262AC    mov         dword ptr [ebx+4],9
 004262B3    mov         dword ptr [ebx+8],1
 004262BA    call        kernel32.GetThreadLocale
 004262BF    test        eax,eax
>004262C1    je          004262C5
 004262C3    mov         dword ptr [ebx],eax
 004262C5    test        ax,ax
>004262C8    je          004262E0
 004262CA    mov         edx,eax
 004262CC    and         dx,3FF
 004262D1    movzx       edx,dx
 004262D4    mov         dword ptr [ebx+4],edx
 004262D7    movzx       eax,ax
 004262DA    shr         eax,0A
 004262DD    mov         dword ptr [ebx+8],eax
 004262E0    mov         esi,42630C
 004262E5    mov         edi,784CC0
 004262EA    mov         ecx,8
 004262EF    rep movs    dword ptr [edi],dword ptr [esi]
 004262F1    mov         byte ptr [ebx+0D],1
 004262F5    mov         al,1
 004262F7    mov         byte ptr [ebx+0C],al
 004262FA    test        al,al
>004262FC    je          00426305
 004262FE    push        ebp
 004262FF    call        InitLeadBytes
 00426304    pop         ecx
 00426305    pop         edi
 00426306    pop         esi
 00426307    pop         ebx
 00426308    mov         esp,ebp
 0042630A    pop         ebp
 0042630B    ret
*}
end;

//0042632C
procedure GetFormatSettings;
begin
{*
 0042632C    push        ebp
 0042632D    mov         ebp,esp
 0042632F    add         esp,0FFFFFF34
 00426335    push        ebx
 00426336    push        esi
 00426337    push        edi
 00426338    lea         eax,[ebp-0C4]
 0042633E    mov         edx,dword ptr ds:[41AB24];TFormatSettings
 00426344    call        @InitializeRecord
 00426349    xor         eax,eax
 0042634B    push        ebp
 0042634C    push        4264EB
 00426351    push        dword ptr fs:[eax]
 00426354    mov         dword ptr fs:[eax],esp
 00426357    call        InitSysLocale
 0042635C    cmp         byte ptr ds:[790DAB],0
>00426363    je          0042636A
 00426365    call        GetEraNamesAndYearOffsets
 0042636A    lea         edx,[ebp-0C4]
 00426370    xor         eax,eax
 00426372    call        TFormatSettings.Create
 00426377    movzx       eax,byte ptr [ebp-0C0]
 0042637E    mov         [00790CE0],al
 00426383    movzx       eax,byte ptr [ebp-2]
 00426387    mov         [00790D9E],al
 0042638C    movzx       eax,word ptr [ebp-8]
 00426390    mov         [00790D98],ax;gvar_00790D98
 00426396    movzx       eax,word ptr [ebp-6]
 0042639A    mov         [00790D9A],ax;gvar_00790D9A
 004263A0    movzx       eax,byte ptr [ebp-0BF]
 004263A7    mov         [00790CE1],al
 004263AC    movzx       eax,word ptr [ebp-0BE]
 004263B3    mov         [00790CE2],ax
 004263B9    movzx       eax,word ptr [ebp-0BC]
 004263C0    mov         [00790CE4],ax
 004263C6    movzx       eax,word ptr [ebp-0BA]
 004263CD    mov         [00790CE6],ax
 004263D3    mov         eax,790CDC;gvar_00790CDC:TFormatSettings
 004263D8    mov         edx,dword ptr [ebp-0C4]
 004263DE    call        @UStrAsg
 004263E3    mov         eax,790CE8;gvar_00790CE8:UnicodeString
 004263E8    mov         edx,dword ptr [ebp-0B8]
 004263EE    call        @UStrAsg
 004263F3    mov         eax,790CEC;gvar_00790CEC:UnicodeString
 004263F8    mov         edx,dword ptr [ebp-0B4]
 004263FE    call        @UStrAsg
 00426403    mov         eax,790CF0;gvar_00790CF0:UnicodeString
 00426408    mov         edx,dword ptr [ebp-0B0]
 0042640E    call        @UStrAsg
 00426413    mov         eax,790CF4;gvar_00790CF4:UnicodeString
 00426418    mov         edx,dword ptr [ebp-0AC]
 0042641E    call        @UStrAsg
 00426423    mov         eax,790CF8;gvar_00790CF8:UnicodeString
 00426428    mov         edx,dword ptr [ebp-0A8]
 0042642E    call        @UStrAsg
 00426433    mov         eax,790CFC;gvar_00790CFC:UnicodeString
 00426438    mov         edx,dword ptr [ebp-0A4]
 0042643E    call        @UStrAsg
 00426443    mov         esi,0C
 00426448    lea         ebx,[ebp-0A0]
 0042644E    mov         edi,790D00;gvar_00790D00:array[12] of ?
 00426453    mov         dword ptr [ebp-0C8],790D30;gvar_00790D30:array[12] of ?
 0042645D    mov         eax,edi
 0042645F    mov         edx,dword ptr [ebx]
 00426461    call        @UStrAsg
 00426466    mov         eax,dword ptr [ebp-0C8]
 0042646C    mov         edx,dword ptr [ebx+30]
 0042646F    call        @UStrAsg
 00426474    add         dword ptr [ebp-0C8],4
 0042647B    add         edi,4
 0042647E    add         ebx,4
 00426481    dec         esi
>00426482    jne         0042645D
 00426484    mov         esi,7
 00426489    lea         ebx,[ebp-40]
 0042648C    mov         edi,790D60;gvar_00790D60:array[7] of ?
 00426491    mov         dword ptr [ebp-0CC],790D7C;gvar_00790D7C:array[7] of ?
 0042649B    mov         eax,edi
 0042649D    mov         edx,dword ptr [ebx]
 0042649F    call        @UStrAsg
 004264A4    mov         eax,dword ptr [ebp-0CC]
 004264AA    mov         edx,dword ptr [ebx+1C]
 004264AD    call        @UStrAsg
 004264B2    add         dword ptr [ebp-0CC],4
 004264B9    add         edi,4
 004264BC    add         ebx,4
 004264BF    dec         esi
>004264C0    jne         0042649B
 004264C2    movzx       eax,word ptr [ebp-4]
 004264C6    mov         [00790D9C],ax
 004264CC    xor         eax,eax
 004264CE    pop         edx
 004264CF    pop         ecx
 004264D0    pop         ecx
 004264D1    mov         dword ptr fs:[eax],edx
 004264D4    push        4264F2
 004264D9    lea         eax,[ebp-0C4]
 004264DF    mov         edx,dword ptr ds:[41AB24];TFormatSettings
 004264E5    call        @FinalizeRecord
 004264EA    ret
>004264EB    jmp         @HandleFinally
>004264F0    jmp         004264D9
 004264F2    pop         edi
 004264F3    pop         esi
 004264F4    pop         ebx
 004264F5    mov         esp,ebp
 004264F7    pop         ebp
 004264F8    ret
*}
end;

//004264FC
function StringReplace(const S:UnicodeString; const OldPattern:UnicodeString; const NewPattern:UnicodeString; Flags:TReplaceFlags):UnicodeString;
begin
{*
 004264FC    push        ebp
 004264FD    mov         ebp,esp
 004264FF    push        0
 00426501    push        0
 00426503    push        0
 00426505    push        0
 00426507    push        0
 00426509    push        0
 0042650B    push        0
 0042650D    push        ebx
 0042650E    push        esi
 0042650F    push        edi
 00426510    mov         dword ptr [ebp-14],ecx
 00426513    mov         dword ptr [ebp-10],edx
 00426516    mov         ebx,eax
 00426518    mov         esi,dword ptr [ebp+8]
 0042651B    xor         eax,eax
 0042651D    push        ebp
 0042651E    push        426645
 00426523    push        dword ptr fs:[eax]
 00426526    mov         dword ptr fs:[eax],esp
 00426529    test        byte ptr [ebp+0C],2
>0042652D    je          00426546
 0042652F    lea         edx,[ebp-4]
 00426532    mov         eax,ebx
 00426534    call        AnsiUpperCase
 00426539    lea         edx,[ebp-8]
 0042653C    mov         eax,dword ptr [ebp-10]
 0042653F    call        AnsiUpperCase
>00426544    jmp         0042655B
 00426546    lea         eax,[ebp-4]
 00426549    mov         edx,ebx
 0042654B    call        @UStrLAsg
 00426550    lea         eax,[ebp-8]
 00426553    mov         edx,dword ptr [ebp-10]
 00426556    call        @UStrLAsg
 0042655B    lea         eax,[ebp-0C]
 0042655E    mov         edx,ebx
 00426560    call        @UStrLAsg
 00426565    mov         eax,esi
 00426567    call        @UStrClr
>0042656C    jmp         00426618
 00426571    mov         edx,dword ptr [ebp-4]
 00426574    mov         eax,dword ptr [ebp-8]
 00426577    call        AnsiPos
 0042657C    mov         ebx,eax
 0042657E    test        ebx,ebx
>00426580    jne         00426591
 00426582    mov         eax,esi
 00426584    mov         edx,dword ptr [ebp-0C]
 00426587    call        @UStrCat
>0042658C    jmp         00426622
 00426591    push        dword ptr [esi]
 00426593    lea         eax,[ebp-1C]
 00426596    push        eax
 00426597    mov         ecx,ebx
 00426599    dec         ecx
 0042659A    mov         edx,1
 0042659F    mov         eax,dword ptr [ebp-0C]
 004265A2    call        @UStrCopy
 004265A7    push        dword ptr [ebp-1C]
 004265AA    push        dword ptr [ebp-14]
 004265AD    mov         eax,esi
 004265AF    mov         edx,3
 004265B4    call        @UStrCatN
 004265B9    mov         edi,dword ptr [ebp-10]
 004265BC    test        edi,edi
>004265BE    je          004265C5
 004265C0    sub         edi,4
 004265C3    mov         edi,dword ptr [edi]
 004265C5    lea         eax,[ebp-0C]
 004265C8    push        eax
 004265C9    lea         edx,[edi+ebx]
 004265CC    mov         ecx,7FFFFFFF
 004265D1    mov         eax,dword ptr [ebp-0C]
 004265D4    call        @UStrCopy
 004265D9    test        byte ptr [ebp+0C],1
>004265DD    jne         004265EB
 004265DF    mov         eax,esi
 004265E1    mov         edx,dword ptr [ebp-0C]
 004265E4    call        @UStrCat
>004265E9    jmp         00426622
 004265EB    mov         eax,dword ptr [ebp-8]
 004265EE    mov         dword ptr [ebp-18],eax
 004265F1    cmp         dword ptr [ebp-18],0
>004265F5    je          00426602
 004265F7    mov         eax,dword ptr [ebp-18]
 004265FA    sub         eax,4
 004265FD    mov         eax,dword ptr [eax]
 004265FF    mov         dword ptr [ebp-18],eax
 00426602    lea         eax,[ebp-4]
 00426605    push        eax
 00426606    mov         edx,dword ptr [ebp-18]
 00426609    add         edx,ebx
 0042660B    mov         ecx,7FFFFFFF
 00426610    mov         eax,dword ptr [ebp-4]
 00426613    call        @UStrCopy
 00426618    cmp         dword ptr [ebp-4],0
>0042661C    jne         00426571
 00426622    xor         eax,eax
 00426624    pop         edx
 00426625    pop         ecx
 00426626    pop         ecx
 00426627    mov         dword ptr fs:[eax],edx
 0042662A    push        42664C
 0042662F    lea         eax,[ebp-1C]
 00426632    call        @UStrClr
 00426637    lea         eax,[ebp-0C]
 0042663A    mov         edx,3
 0042663F    call        @UStrArrayClr
 00426644    ret
>00426645    jmp         @HandleFinally
>0042664A    jmp         0042662F
 0042664C    pop         edi
 0042664D    pop         esi
 0042664E    pop         ebx
 0042664F    mov         esp,ebp
 00426651    pop         ebp
 00426652    ret         8
*}
end;

//0042683C
procedure sub_0042683C;
begin
{*
 0042683C    push        esi
 0042683D    push        ebx
 0042683E    mov         esi,eax
 00426840    xor         eax,eax
 00426842    push        esi
 00426843    rol         eax,5
 00426846    mov         bl,byte ptr [esi]
 00426848    test        bl,80
>0042684B    jne         00426868
 0042684D    cmp         bl,0
>00426850    je          00426864
 00426852    cmp         bl,41
>00426855    jl          0042685F
 00426857    cmp         bl,5A
>0042685A    jg          0042685F
 0042685C    or          bl,20
 0042685F    xor         al,bl
 00426861    inc         esi
>00426862    jmp         00426843
 00426864    pop         ecx
 00426865    pop         ebx
 00426866    pop         esi
 00426867    ret
*}
end;

//00426874
{*procedure sub_00426874(?:?);
begin
 00426874    push        ebx
 00426875    push        esi
 00426876    push        edi
 00426877    push        ebp
 00426878    add         esp,0FFFFFFF4
 0042687B    mov         edx,dword ptr ds:[78D8B8];^gvar_00784034
 00426881    mov         edx,dword ptr [edx]
 00426883    test        edx,edx
>00426885    je          00426892
 00426887    cmp         eax,dword ptr [edx+4]
>0042688A    je          00426892
 0042688C    mov         edx,dword ptr [edx]
 0042688E    test        edx,edx
>00426890    jne         00426887
 00426892    mov         dword ptr [esp],edx
 00426895    cmp         dword ptr [esp],0
>00426899    je          00426984
 0042689F    mov         eax,dword ptr [esp]
 004268A2    cmp         dword ptr [eax+18],0
>004268A6    je          00426984
 004268AC    mov         eax,dword ptr [esp]
 004268AF    mov         ebx,dword ptr [eax+18]
 004268B2    cmp         byte ptr [ebx],0
>004268B5    je          004268C1
 004268B7    mov         dword ptr [esp+8],790F24
>004268BF    jmp         004268C9
 004268C1    mov         dword ptr [esp+8],791F18
 004268C9    mov         eax,dword ptr [ebx+4]
 004268CC    call        @DynArrayHigh
 004268D1    mov         ebp,eax
 004268D3    test        ebp,ebp
>004268D5    jl          0042696F
 004268DB    inc         ebp
 004268DC    xor         esi,esi
 004268DE    lea         edi,[esi+esi*2]
 004268E1    mov         eax,dword ptr [ebx+4]
 004268E4    cmp         dword ptr [eax+edi*8+4],0
>004268E9    je          004268FF
 004268EB    mov         eax,dword ptr [ebx+4]
 004268EE    mov         eax,dword ptr [eax+edi*8]
 004268F1    lea         edx,[esi+esi*2]
 004268F4    mov         ecx,dword ptr [ebx+4]
 004268F7    mov         edx,dword ptr [ecx+edx*8+4]
 004268FB    mov         dword ptr [edx],eax
>004268FD    jmp         0042694B
 004268FF    mov         eax,dword ptr [ebx+4]
 00426902    cmp         dword ptr [eax+edi*8+0C],0
>00426907    je          0042694B
 00426909    lea         eax,[esi+esi*2]
 0042690C    mov         edx,dword ptr [ebx+4]
 0042690F    mov         eax,dword ptr [edx+eax*8+0C]
 00426913    call        0042683C
 00426918    mov         ecx,3FD
 0042691D    xor         edx,edx
 0042691F    div         eax,ecx
 00426921    mov         dword ptr [esp+4],edx
 00426925    mov         eax,dword ptr [esp+8]
 00426929    mov         edx,dword ptr [esp+4]
 0042692D    mov         eax,dword ptr [eax+edx*4]
 00426930    mov         edx,dword ptr [ebx+4]
 00426933    lea         edx,[edx+edi*8]
 00426936    cmp         eax,edx
>00426938    jne         0042694B
 0042693A    mov         eax,dword ptr [ebx+4]
 0042693D    mov         eax,dword ptr [eax+edi*8]
 00426940    mov         edx,dword ptr [esp+8]
 00426944    mov         ecx,dword ptr [esp+4]
 00426948    mov         dword ptr [edx+ecx*4],eax
 0042694B    mov         eax,dword ptr [ebx+4]
 0042694E    cmp         dword ptr [eax+edi*8],0
>00426952    je          00426967
 00426954    mov         eax,dword ptr [ebx+4]
 00426957    mov         eax,dword ptr [eax+edi*8+4]
 0042695B    lea         edx,[esi+esi*2]
 0042695E    mov         ecx,dword ptr [ebx+4]
 00426961    mov         edx,dword ptr [ecx+edx*8]
 00426964    mov         dword ptr [edx+4],eax
 00426967    inc         esi
 00426968    dec         ebp
>00426969    jne         004268DE
 0042696F    mov         edx,dword ptr ds:[42670C];TModuleInfo
 00426975    mov         eax,ebx
 00426977    call        @Dispose
 0042697C    mov         eax,dword ptr [esp]
 0042697F    xor         edx,edx
 00426981    mov         dword ptr [eax+18],edx
 00426984    add         esp,0C
 00426987    pop         ebp
 00426988    pop         edi
 00426989    pop         esi
 0042698A    pop         ebx
 0042698B    ret
end;*}

//0042698C
procedure kernel32.Sleep; stdcall;
begin
{*
 0042698C    jmp         dword ptr ds:[8266E0]
*}
end;

//00426994
procedure RaiseLastOSError;
begin
{*
 00426994    call        kernel32.GetLastError
 00426999    call        004269A0
 0042699E    ret
*}
end;

//004269A0
{*procedure sub_004269A0(?:?);
begin
 004269A0    push        ebp
 004269A1    mov         ebp,esp
 004269A3    add         esp,0FFFFFFEC
 004269A6    push        ebx
 004269A7    xor         edx,edx
 004269A9    mov         dword ptr [ebp-14],edx
 004269AC    mov         ebx,eax
 004269AE    xor         eax,eax
 004269B0    push        ebp
 004269B1    push        426A2B
 004269B6    push        dword ptr fs:[eax]
 004269B9    mov         dword ptr fs:[eax],esp
 004269BC    test        ebx,ebx
>004269BE    je          004269F7
 004269C0    mov         dword ptr [ebp-10],ebx
 004269C3    mov         byte ptr [ebp-0C],0
 004269C7    lea         edx,[ebp-14]
 004269CA    mov         eax,ebx
 004269CC    call        SysErrorMessage
 004269D1    mov         eax,dword ptr [ebp-14]
 004269D4    mov         dword ptr [ebp-8],eax
 004269D7    mov         byte ptr [ebp-4],11
 004269DB    lea         eax,[ebp-10]
 004269DE    push        eax
 004269DF    push        1
 004269E1    mov         ecx,dword ptr ds:[78D654];^SResString61:TResStringRec
 004269E7    mov         dl,1
 004269E9    mov         eax,[0041A648];EOSError
 004269EE    call        Exception.CreateResFmt;EOSError.Create
 004269F3    mov         edx,eax
>004269F5    jmp         00426A0B
 004269F7    mov         ecx,dword ptr ds:[78DA14];^SResString62:TResStringRec
 004269FD    mov         dl,1
 004269FF    mov         eax,[0041A648];EOSError
 00426A04    call        Exception.CreateRes;EOSError.Create
 00426A09    mov         edx,eax
 00426A0B    mov         dword ptr [edx+18],ebx;EOSError....ErrorCode:Cardinal
 00426A0E    mov         eax,edx
 00426A10    call        @RaiseExcept
 00426A15    xor         eax,eax
 00426A17    pop         edx
 00426A18    pop         ecx
 00426A19    pop         ecx
 00426A1A    mov         dword ptr fs:[eax],edx
 00426A1D    push        426A32
 00426A22    lea         eax,[ebp-14]
 00426A25    call        @UStrClr
 00426A2A    ret
>00426A2B    jmp         @HandleFinally
>00426A30    jmp         00426A22
 00426A32    pop         ebx
 00426A33    mov         esp,ebp
 00426A35    pop         ebp
 00426A36    ret
end;*}

//00426A38
function Win32Check(RetVal:BOOL):BOOL;
begin
{*
 00426A38    push        ebx
 00426A39    mov         ebx,eax
 00426A3B    test        ebx,ebx
>00426A3D    jne         00426A44
 00426A3F    call        RaiseLastOSError
 00426A44    mov         eax,ebx
 00426A46    pop         ebx
 00426A47    ret
*}
end;

//00426A48
function CallTerminateProcs:Boolean;
begin
{*
 00426A48    push        ebx
 00426A49    push        esi
 00426A4A    mov         bl,1
 00426A4C    mov         esi,dword ptr ds:[784E48];gvar_00784E48
>00426A52    jmp         00426A5B
 00426A54    call        dword ptr [esi+4]
 00426A57    mov         ebx,eax
 00426A59    mov         esi,dword ptr [esi]
 00426A5B    test        bl,bl
>00426A5D    je          00426A63
 00426A5F    test        esi,esi
>00426A61    jne         00426A54
 00426A63    mov         eax,ebx
 00426A65    pop         esi
 00426A66    pop         ebx
 00426A67    ret
*}
end;

//00426A68
procedure sub_00426A68;
begin
{*
 00426A68    push        ebx
 00426A69    push        esi
 00426A6A    mov         esi,784E48;gvar_00784E48
>00426A6F    jmp         00426A83
 00426A71    mov         ebx,dword ptr [esi]
 00426A73    mov         eax,dword ptr [ebx]
 00426A75    mov         dword ptr [esi],eax
 00426A77    mov         edx,8
 00426A7C    mov         eax,ebx
 00426A7E    call        @FreeMem
 00426A83    cmp         dword ptr [esi],0
>00426A86    jne         00426A71
 00426A88    pop         esi
 00426A89    pop         ebx
 00426A8A    ret
*}
end;

//00426A8C
procedure sub_00426A8C;
begin
{*
 00426A8C    push        ebx
 00426A8D    push        426AC4;'kernel32.dll'
 00426A92    call        kernel32.GetModuleHandleW
 00426A97    mov         ebx,eax
 00426A99    test        ebx,ebx
>00426A9B    je          00426AAD
 00426A9D    push        426AE0;'GetDiskFreeSpaceExW'
 00426AA2    push        ebx
 00426AA3    call        GetProcAddress
 00426AA8    mov         [00784CE4],eax;gvar_00784CE4:BOOL
 00426AAD    cmp         dword ptr ds:[784CE4],0;gvar_00784CE4:BOOL
>00426AB4    jne         00426AC0
 00426AB6    mov         eax,4206B4;BackfillGetDiskFreeSpaceEx:BOOL
 00426ABB    mov         [00784CE4],eax;gvar_00784CE4:BOOL
 00426AC0    pop         ebx
 00426AC1    ret
*}
end;

//00426B08
destructor TThreadLocalCounter.Destroy();
begin
{*
 00426B08    push        ebx
 00426B09    push        esi
 00426B0A    push        edi
 00426B0B    push        ebp
 00426B0C    push        ecx
 00426B0D    call        @BeforeDestruction
 00426B12    mov         byte ptr [esp],dl
 00426B15    mov         ebp,eax
 00426B17    xor         edi,edi
 00426B19    mov         ebx,dword ptr [ebp+edi*4+4]
 00426B1D    xor         eax,eax
 00426B1F    mov         dword ptr [ebp+edi*4+4],eax
 00426B23    test        ebx,ebx
>00426B25    je          00426B36
 00426B27    mov         esi,ebx
 00426B29    mov         ebx,dword ptr [ebx]
 00426B2B    mov         eax,esi
 00426B2D    call        @FreeMem
 00426B32    test        ebx,ebx
>00426B34    jne         00426B27
 00426B36    inc         edi
 00426B37    cmp         edi,10
>00426B3A    jne         00426B19
 00426B3C    movzx       edx,byte ptr [esp]
 00426B40    and         dl,0FC
 00426B43    mov         eax,ebp
 00426B45    call        TObject.Destroy
 00426B4A    cmp         byte ptr [esp],0
>00426B4E    jle         00426B57
 00426B50    mov         eax,ebp
 00426B52    call        @ClassDestroy
 00426B57    pop         edx
 00426B58    pop         ebp
 00426B59    pop         edi
 00426B5A    pop         esi
 00426B5B    pop         ebx
 00426B5C    ret
*}
end;

//00426B60
{*function sub_00426B60:?;
begin
 00426B60    push        ebp
 00426B61    mov         ebp,esp
 00426B63    push        ecx
 00426B64    call        kernel32.GetCurrentThreadId
 00426B69    mov         word ptr [ebp-2],ax
 00426B6D    movzx       eax,byte ptr [ebp-2]
 00426B71    xor         al,byte ptr [ebp-1]
 00426B74    and         al,0F
 00426B76    pop         ecx
 00426B77    pop         ebp
 00426B78    ret
end;*}

//00426B7C
procedure TThreadLocalCounter.Open(var Thread:PThreadInfo);
begin
{*
 00426B7C    push        ebx
 00426B7D    push        esi
 00426B7E    push        edi
 00426B7F    push        ebp
 00426B80    push        ecx
 00426B81    mov         dword ptr [esp],edx
 00426B84    mov         edi,eax
 00426B86    mov         eax,edi
 00426B88    call        00426B60
 00426B8D    mov         ebx,eax
 00426B8F    call        kernel32.GetCurrentThreadId
 00426B94    mov         esi,eax
 00426B96    movzx       eax,bl
 00426B99    mov         ebp,dword ptr [edi+eax*4+4]
>00426B9D    jmp         00426BA2
 00426B9F    mov         ebp,dword ptr [ebp]
 00426BA2    test        ebp,ebp
>00426BA4    je          00426BAB
 00426BA6    cmp         esi,dword ptr [ebp+4]
>00426BA9    jne         00426B9F
 00426BAB    test        ebp,ebp
>00426BAD    jne         00426BE6
 00426BAF    mov         eax,edi
 00426BB1    call        00426C0C
 00426BB6    mov         ebp,eax
 00426BB8    test        ebp,ebp
>00426BBA    jne         00426BE6
 00426BBC    mov         eax,10
 00426BC1    call        AllocMem
 00426BC6    mov         ebp,eax
 00426BC8    mov         dword ptr [ebp+4],esi
 00426BCB    mov         dword ptr [ebp+8],7FFFFFFF
 00426BD2    mov         dword ptr [ebp],ebp
 00426BD5    movzx       eax,bl
 00426BD8    lea         eax,[edi+eax*4+4]
 00426BDC    mov         edx,ebp
 00426BDE    call        InterlockedExchange
 00426BE3    mov         dword ptr [ebp],eax
 00426BE6    mov         eax,dword ptr [esp]
 00426BE9    mov         dword ptr [eax],ebp
 00426BEB    pop         edx
 00426BEC    pop         ebp
 00426BED    pop         edi
 00426BEE    pop         esi
 00426BEF    pop         ebx
 00426BF0    ret
*}
end;

//00426BF4
procedure TThreadLocalCounter.Close(var Thread:PThreadInfo);
begin
{*
 00426BF4    xor         eax,eax
 00426BF6    mov         dword ptr [edx],eax
 00426BF8    ret
*}
end;

//00426BFC
procedure TThreadLocalCounter.Delete(var Thread:PThreadInfo);
begin
{*
 00426BFC    mov         eax,dword ptr [edx]
 00426BFE    xor         ecx,ecx
 00426C00    mov         dword ptr [eax+4],ecx
 00426C03    mov         eax,dword ptr [edx]
 00426C05    xor         edx,edx
 00426C07    mov         dword ptr [eax+8],edx
 00426C0A    ret
*}
end;

//00426C0C
{*function sub_00426C0C(?:TThreadLocalCounter):?;
begin
 00426C0C    push        ebx
 00426C0D    push        esi
 00426C0E    mov         ebx,eax
 00426C10    mov         eax,ebx
 00426C12    call        00426B60
 00426C17    movzx       eax,al
 00426C1A    mov         ebx,dword ptr [ebx+eax*4+4]
 00426C1E    test        ebx,ebx
>00426C20    je          00426C49
 00426C22    lea         eax,[ebx+8]
 00426C25    mov         edx,7FFFFFFF
 00426C2A    call        InterlockedExchange
 00426C2F    mov         esi,eax
 00426C31    cmp         esi,7FFFFFFF
>00426C37    je          00426C43
 00426C39    call        kernel32.GetCurrentThreadId
 00426C3E    mov         dword ptr [ebx+4],eax
>00426C41    jmp         00426C49
 00426C43    mov         ebx,dword ptr [ebx]
 00426C45    test        ebx,ebx
>00426C47    jne         00426C22
 00426C49    mov         eax,ebx
 00426C4B    pop         esi
 00426C4C    pop         ebx
 00426C4D    ret
end;*}

//00426C50
constructor TMultiReadExclusiveWriteSynchronizer.Create();
begin
{*
 00426C50    push        ebx
 00426C51    push        esi
 00426C52    test        dl,dl
>00426C54    je          00426C5E
 00426C56    add         esp,0FFFFFFF0
 00426C59    call        @ClassCreate
 00426C5E    mov         ebx,edx
 00426C60    mov         esi,eax
 00426C62    xor         edx,edx
 00426C64    mov         eax,esi
 00426C66    call        TObject.Create
 00426C6B    mov         dword ptr [esi+0C],0FFFF
 00426C72    push        0
 00426C74    push        0FF
 00426C76    push        0FF
 00426C78    push        0
 00426C7A    call        kernel32.CreateEventW
 00426C7F    mov         dword ptr [esi+10],eax
 00426C82    push        0
 00426C84    push        0
 00426C86    push        0
 00426C88    push        0
 00426C8A    call        kernel32.CreateEventW
 00426C8F    mov         dword ptr [esi+14],eax
 00426C92    mov         dword ptr [esi+18],0FFFFFFFF
 00426C99    mov         dl,1
 00426C9B    mov         eax,[0041AED4];TThreadLocalCounter
 00426CA0    call        TObject.Create
 00426CA5    mov         dword ptr [esi+20],eax
 00426CA8    mov         eax,esi
 00426CAA    test        bl,bl
>00426CAC    je          00426CBD
 00426CAE    call        @AfterConstruction
 00426CB3    pop         dword ptr fs:[0]
 00426CBA    add         esp,0C
 00426CBD    mov         eax,esi
 00426CBF    pop         esi
 00426CC0    pop         ebx
 00426CC1    ret
*}
end;

//00426CC4
destructor TMultiReadExclusiveWriteSynchronizer.Destroy();
begin
{*
 00426CC4    push        ebx
 00426CC5    push        esi
 00426CC6    call        @BeforeDestruction
 00426CCB    mov         ebx,edx
 00426CCD    mov         esi,eax
 00426CCF    mov         eax,esi
 00426CD1    call        TMultiReadExclusiveWriteSynchronizer.BeginWrite
 00426CD6    mov         edx,ebx
 00426CD8    and         dl,0FC
 00426CDB    mov         eax,esi
 00426CDD    call        TObject.Destroy
 00426CE2    mov         eax,dword ptr [esi+10];TMultiReadExclusiveWriteSynchronizer.FReadSignal:Cardinal
 00426CE5    push        eax
 00426CE6    call        kernel32.CloseHandle
 00426CEB    mov         eax,dword ptr [esi+14];TMultiReadExclusiveWriteSynchronizer.FWriteSignal:Cardinal
 00426CEE    push        eax
 00426CEF    call        kernel32.CloseHandle
 00426CF4    mov         eax,dword ptr [esi+20];TMultiReadExclusiveWriteSynchronizer.tls:TThreadLocalCounter
 00426CF7    call        TObject.Free
 00426CFC    test        bl,bl
>00426CFE    jle         00426D07
 00426D00    mov         eax,esi
 00426D02    call        @ClassDestroy
 00426D07    pop         esi
 00426D08    pop         ebx
 00426D09    ret
*}
end;

//00426D0C
procedure sub_00426D0C(?:TMultiReadExclusiveWriteSynchronizer);
begin
{*
 00426D0C    mov         eax,dword ptr [eax+10]
 00426D0F    push        eax
 00426D10    call        kernel32.ResetEvent
 00426D15    ret
*}
end;

//00426D18
procedure sub_00426D18(?:TMultiReadExclusiveWriteSynchronizer);
begin
{*
 00426D18    mov         eax,dword ptr [eax+10]
 00426D1B    push        eax
 00426D1C    call        kernel32.SetEvent
 00426D21    ret
*}
end;

//00426D24
procedure sub_00426D24(?:TMultiReadExclusiveWriteSynchronizer);
begin
{*
 00426D24    mov         eax,dword ptr [eax+14]
 00426D27    push        eax
 00426D28    call        kernel32.SetEvent
 00426D2D    ret
*}
end;

//00426D30
procedure sub_00426D30(?:TMultiReadExclusiveWriteSynchronizer);
begin
{*
 00426D30    mov         edx,dword ptr [eax+18]
 00426D33    push        edx
 00426D34    mov         eax,dword ptr [eax+10]
 00426D37    push        eax
 00426D38    call        kernel32.WaitForSingleObject
 00426D3D    ret
*}
end;

//00426D40
procedure sub_00426D40(?:TMultiReadExclusiveWriteSynchronizer);
begin
{*
 00426D40    mov         edx,dword ptr [eax+18]
 00426D43    push        edx
 00426D44    mov         eax,dword ptr [eax+14]
 00426D47    push        eax
 00426D48    call        kernel32.WaitForSingleObject
 00426D4D    ret
*}
end;

//00426D50
function TMultiReadExclusiveWriteSynchronizer.BeginWrite:Boolean;
begin
{*
 00426D50    push        ebx
 00426D51    push        esi
 00426D52    push        edi
 00426D53    push        ebp
 00426D54    add         esp,0FFFFFFF8
 00426D57    mov         ebp,eax
 00426D59    mov         bl,1
 00426D5B    call        kernel32.GetCurrentThreadId
 00426D60    mov         edi,eax
 00426D62    cmp         edi,dword ptr [ebp+24];TMultiReadExclusiveWriteSynchronizer.FWriterID:Cardinal
>00426D65    je          00426DEF
 00426D6B    mov         eax,ebp
 00426D6D    call        00426D0C
 00426D72    mov         eax,dword ptr [ebp+28];TMultiReadExclusiveWriteSynchronizer.FRevisionLevel:Cardinal
 00426D75    mov         dword ptr [esp+4],eax
 00426D79    mov         edx,esp
 00426D7B    mov         eax,dword ptr [ebp+20];TMultiReadExclusiveWriteSynchronizer.tls:TThreadLocalCounter
 00426D7E    call        TThreadLocalCounter.Open
 00426D83    mov         eax,dword ptr [esp]
 00426D86    cmp         dword ptr [eax+0C],0
 00426D8A    seta        bl
 00426D8D    test        bl,bl
>00426D8F    je          00426DB5
 00426D91    lea         eax,[ebp+0C];TMultiReadExclusiveWriteSynchronizer.FSentinel:Integer
 00426D94    call        InterlockedIncrement
>00426D99    jmp         00426DB5
 00426D9B    lea         eax,[ebp+0C];TMultiReadExclusiveWriteSynchronizer.FSentinel:Integer
 00426D9E    mov         edx,0FFFF
 00426DA3    call        0041E660
 00426DA8    mov         esi,eax
 00426DAA    test        esi,esi
>00426DAC    je          00426DB5
 00426DAE    mov         eax,ebp
 00426DB0    call        00426D40
 00426DB5    lea         eax,[ebp+0C];TMultiReadExclusiveWriteSynchronizer.FSentinel:Integer
 00426DB8    mov         edx,0FFFF0001
 00426DBD    call        0041E660
 00426DC2    cmp         eax,0FFFF
>00426DC7    jne         00426D9B
 00426DC9    mov         eax,ebp
 00426DCB    call        00426D0C
 00426DD0    test        bl,bl
>00426DD2    je          00426DDC
 00426DD4    lea         eax,[ebp+0C];TMultiReadExclusiveWriteSynchronizer.FSentinel:Integer
 00426DD7    call        InterlockedDecrement
 00426DDC    mov         dword ptr [ebp+24],edi;TMultiReadExclusiveWriteSynchronizer.FWriterID:Cardinal
 00426DDF    lea         eax,[ebp+28];TMultiReadExclusiveWriteSynchronizer.FRevisionLevel:Cardinal
 00426DE2    call        InterlockedIncrement
 00426DE7    dec         eax
 00426DE8    cmp         eax,dword ptr [esp+4]
 00426DEC    sete        bl
 00426DEF    inc         dword ptr [ebp+1C];TMultiReadExclusiveWriteSynchronizer.FWriteRecursionCount:Cardinal
 00426DF2    mov         eax,ebx
 00426DF4    pop         ecx
 00426DF5    pop         edx
 00426DF6    pop         ebp
 00426DF7    pop         edi
 00426DF8    pop         esi
 00426DF9    pop         ebx
 00426DFA    ret
*}
end;

//00426DFC
procedure TMultiReadExclusiveWriteSynchronizer.EndWrite;
begin
{*
 00426DFC    push        ebx
 00426DFD    push        ecx
 00426DFE    mov         ebx,eax
 00426E00    call        kernel32.GetCurrentThreadId
 00426E05    cmp         eax,dword ptr [ebx+24];TMultiReadExclusiveWriteSynchronizer.FWriterID:Cardinal
>00426E08    je          00426E1E
 00426E0A    mov         ecx,4C42
 00426E0F    mov         edx,426E74;'C:\Builds\TP\rtl\sys\SysUtils.pas'
 00426E14    mov         eax,426EC4;'Assertion failure'
 00426E19    call        @Assert
 00426E1E    mov         edx,esp
 00426E20    mov         eax,dword ptr [ebx+20];TMultiReadExclusiveWriteSynchronizer.tls:TThreadLocalCounter
 00426E23    call        TThreadLocalCounter.Open
 00426E28    dec         dword ptr [ebx+1C];TMultiReadExclusiveWriteSynchronizer.FWriteRecursionCount:Cardinal
 00426E2B    cmp         dword ptr [ebx+1C],0;TMultiReadExclusiveWriteSynchronizer.FWriteRecursionCount:Cardinal
>00426E2F    jne         00426E51
 00426E31    xor         eax,eax
 00426E33    mov         dword ptr [ebx+24],eax;TMultiReadExclusiveWriteSynchronizer.FWriterID:Cardinal
 00426E36    lea         eax,[ebx+0C];TMultiReadExclusiveWriteSynchronizer.FSentinel:Integer
 00426E39    mov         edx,0FFFF
 00426E3E    call        0041E660
 00426E43    mov         eax,ebx
 00426E45    call        00426D24
 00426E4A    mov         eax,ebx
 00426E4C    call        00426D18
 00426E51    mov         eax,dword ptr [esp]
 00426E54    cmp         dword ptr [eax+0C],0
>00426E58    jne         00426E64
 00426E5A    mov         edx,esp
 00426E5C    mov         eax,dword ptr [ebx+20];TMultiReadExclusiveWriteSynchronizer.tls:TThreadLocalCounter
 00426E5F    call        TThreadLocalCounter.Delete
 00426E64    pop         edx
 00426E65    pop         ebx
 00426E66    ret
*}
end;

//00426EE8
procedure TMultiReadExclusiveWriteSynchronizer.BeginRead;
begin
{*
 00426EE8    push        ebx
 00426EE9    push        esi
 00426EEA    push        edi
 00426EEB    push        ecx
 00426EEC    mov         edi,eax
 00426EEE    mov         edx,esp
 00426EF0    mov         eax,dword ptr [edi+20];TMultiReadExclusiveWriteSynchronizer.tls:TThreadLocalCounter
 00426EF3    call        TThreadLocalCounter.Open
 00426EF8    mov         eax,dword ptr [esp]
 00426EFB    inc         dword ptr [eax+0C]
 00426EFE    mov         eax,dword ptr [esp]
 00426F01    cmp         dword ptr [eax+0C],1
 00426F05    seta        bl
 00426F08    call        kernel32.GetCurrentThreadId
 00426F0D    cmp         eax,dword ptr [edi+24];TMultiReadExclusiveWriteSynchronizer.FWriterID:Cardinal
>00426F10    je          00426F52
 00426F12    test        bl,bl
>00426F14    jne         00426F52
 00426F16    mov         eax,edi
 00426F18    call        00426D30
>00426F1D    jmp         00426F46
 00426F1F    lea         eax,[edi+0C];TMultiReadExclusiveWriteSynchronizer.FSentinel:Integer
 00426F22    call        InterlockedIncrement
 00426F27    mov         esi,eax
 00426F29    cmp         esi,0FFFF
>00426F2F    jne         00426F38
 00426F31    mov         eax,edi
 00426F33    call        00426D24
 00426F38    push        0
 00426F3A    call        kernel32.Sleep
 00426F3F    mov         eax,edi
 00426F41    call        00426D30
 00426F46    lea         eax,[edi+0C];TMultiReadExclusiveWriteSynchronizer.FSentinel:Integer
 00426F49    call        InterlockedDecrement
 00426F4E    test        eax,eax
>00426F50    jle         00426F1F
 00426F52    pop         edx
 00426F53    pop         edi
 00426F54    pop         esi
 00426F55    pop         ebx
 00426F56    ret
*}
end;

//00426F58
procedure TMultiReadExclusiveWriteSynchronizer.EndRead;
begin
{*
 00426F58    push        ebx
 00426F59    push        ecx
 00426F5A    mov         ebx,eax
 00426F5C    mov         edx,esp
 00426F5E    mov         eax,dword ptr [ebx+20];TMultiReadExclusiveWriteSynchronizer.tls:TThreadLocalCounter
 00426F61    call        TThreadLocalCounter.Open
 00426F66    mov         eax,dword ptr [esp]
 00426F69    dec         dword ptr [eax+0C]
 00426F6C    mov         eax,dword ptr [esp]
 00426F6F    cmp         dword ptr [eax+0C],0
>00426F73    jne         00426FBD
 00426F75    mov         edx,esp
 00426F77    mov         eax,dword ptr [ebx+20];TMultiReadExclusiveWriteSynchronizer.tls:TThreadLocalCounter
 00426F7A    call        TThreadLocalCounter.Delete
 00426F7F    call        kernel32.GetCurrentThreadId
 00426F84    cmp         eax,dword ptr [ebx+24];TMultiReadExclusiveWriteSynchronizer.FWriterID:Cardinal
>00426F87    je          00426FBD
 00426F89    lea         eax,[ebx+0C];TMultiReadExclusiveWriteSynchronizer.FSentinel:Integer
 00426F8C    call        InterlockedIncrement
 00426F91    mov         ecx,eax
 00426F93    cmp         ecx,0FFFF
>00426F99    jne         00426FA4
 00426F9B    mov         eax,ebx
 00426F9D    call        00426D24
>00426FA2    jmp         00426FBD
 00426FA4    test        ecx,ecx
>00426FA6    jg          00426FBD
 00426FA8    mov         eax,ecx
 00426FAA    mov         ecx,0FFFF
 00426FAF    cdq
 00426FB0    idiv        eax,ecx
 00426FB2    test        edx,edx
>00426FB4    jne         00426FBD
 00426FB6    mov         eax,ebx
 00426FB8    call        00426D24
 00426FBD    pop         edx
 00426FBE    pop         ebx
 00426FBF    ret
*}
end;

//00426FC0
procedure FreeAndNil(var Obj:void );
begin
{*
 00426FC0    mov         edx,dword ptr [eax]
 00426FC2    xor         ecx,ecx
 00426FC4    mov         dword ptr [eax],ecx
 00426FC6    mov         eax,edx
 00426FC8    call        TObject.Free
 00426FCD    ret
*}
end;

//00426FD0
function Supports(const Instance:IInterface; const IID:TGUID; var Intf:void ):Boolean;
begin
{*
 00426FD0    push        ebx
 00426FD1    push        esi
 00426FD2    push        edi
 00426FD3    mov         edi,ecx
 00426FD5    mov         esi,edx
 00426FD7    mov         ebx,eax
 00426FD9    test        ebx,ebx
>00426FDB    je          00426FE8
 00426FDD    push        edi
 00426FDE    push        esi
 00426FDF    push        ebx
 00426FE0    mov         eax,dword ptr [ebx]
 00426FE2    call        dword ptr [eax]
 00426FE4    test        eax,eax
>00426FE6    je          00426FEC
 00426FE8    xor         eax,eax
>00426FEA    jmp         00426FEE
 00426FEC    mov         al,1
 00426FEE    pop         edi
 00426FEF    pop         esi
 00426FF0    pop         ebx
 00426FF1    ret
*}
end;

//00426FF4
function Supports(const Instance:TObject; const IID:TGUID; var Intf:void ):Boolean;
begin
{*
 00426FF4    push        ebp
 00426FF5    mov         ebp,esp
 00426FF7    push        0
 00426FF9    push        ebx
 00426FFA    push        esi
 00426FFB    push        edi
 00426FFC    mov         edi,ecx
 00426FFE    mov         esi,edx
 00427000    mov         ebx,eax
 00427002    xor         eax,eax
 00427004    push        ebp
 00427005    push        42706B
 0042700A    push        dword ptr fs:[eax]
 0042700D    mov         dword ptr fs:[eax],esp
 00427010    test        ebx,ebx
>00427012    je          0042704D
 00427014    lea         eax,[ebp-4]
 00427017    call        @IntfClear
 0042701C    mov         ecx,eax
 0042701E    mov         edx,42707C
 00427023    mov         eax,ebx
 00427025    call        TObject.GetInterface
 0042702A    test        al,al
>0042702C    je          0042703E
 0042702E    mov         ecx,edi
 00427030    mov         edx,esi
 00427032    mov         eax,dword ptr [ebp-4]
 00427035    call        Supports
 0042703A    test        al,al
>0042703C    jne         00427051
 0042703E    mov         ecx,edi
 00427040    mov         edx,esi
 00427042    mov         eax,ebx
 00427044    call        TObject.GetInterface
 00427049    test        al,al
>0042704B    jne         00427051
 0042704D    xor         eax,eax
>0042704F    jmp         00427053
 00427051    mov         al,1
 00427053    mov         ebx,eax
 00427055    xor         eax,eax
 00427057    pop         edx
 00427058    pop         ecx
 00427059    pop         ecx
 0042705A    mov         dword ptr fs:[eax],edx
 0042705D    push        427072
 00427062    lea         eax,[ebp-4]
 00427065    call        @IntfClear
 0042706A    ret
>0042706B    jmp         @HandleFinally
>00427070    jmp         00427062
 00427072    mov         eax,ebx
 00427074    pop         edi
 00427075    pop         esi
 00427076    pop         ebx
 00427077    pop         ecx
 00427078    pop         ebp
 00427079    ret
*}
end;

//0042708C
function Supports(const Instance:TObject; const IID:TGUID):Boolean;
begin
{*
 0042708C    push        ebp
 0042708D    mov         ebp,esp
 0042708F    push        0
 00427091    push        ebx
 00427092    push        esi
 00427093    mov         esi,edx
 00427095    mov         ebx,eax
 00427097    xor         eax,eax
 00427099    push        ebp
 0042709A    push        4270D0
 0042709F    push        dword ptr fs:[eax]
 004270A2    mov         dword ptr fs:[eax],esp
 004270A5    lea         eax,[ebp-4]
 004270A8    call        @IntfClear
 004270AD    mov         ecx,eax
 004270AF    mov         edx,esi
 004270B1    mov         eax,ebx
 004270B3    call        Supports
 004270B8    mov         ebx,eax
 004270BA    xor         eax,eax
 004270BC    pop         edx
 004270BD    pop         ecx
 004270BE    pop         ecx
 004270BF    mov         dword ptr fs:[eax],edx
 004270C2    push        4270D7
 004270C7    lea         eax,[ebp-4]
 004270CA    call        @IntfClear
 004270CF    ret
>004270D0    jmp         @HandleFinally
>004270D5    jmp         004270C7
 004270D7    mov         eax,ebx
 004270D9    pop         esi
 004270DA    pop         ebx
 004270DB    pop         ecx
 004270DC    pop         ebp
 004270DD    ret
*}
end;

//004270E0
{*function sub_004270E0(?:TPersistent; ?:?):?;
begin
 004270E0    push        ebp
 004270E1    mov         ebp,esp
 004270E3    push        0
 004270E5    push        ebx
 004270E6    push        esi
 004270E7    mov         esi,edx
 004270E9    mov         ebx,eax
 004270EB    xor         eax,eax
 004270ED    push        ebp
 004270EE    push        427124
 004270F3    push        dword ptr fs:[eax]
 004270F6    mov         dword ptr fs:[eax],esp
 004270F9    lea         eax,[ebp-4]
 004270FC    call        @IntfClear
 00427101    mov         ecx,eax
 00427103    mov         edx,esi
 00427105    mov         eax,ebx
 00427107    call        Supports
 0042710C    mov         ebx,eax
 0042710E    xor         eax,eax
 00427110    pop         edx
 00427111    pop         ecx
 00427112    pop         ecx
 00427113    mov         dword ptr fs:[eax],edx
 00427116    push        42712B
 0042711B    lea         eax,[ebp-4]
 0042711E    call        @IntfClear
 00427123    ret
>00427124    jmp         @HandleFinally
>00427129    jmp         0042711B
 0042712B    mov         eax,ebx
 0042712D    pop         esi
 0042712E    pop         ebx
 0042712F    pop         ecx
 00427130    pop         ebp
 00427131    ret
end;*}

//00427134
function EnumLocalesCallback(LocaleID:PChar):Integer; stdcall;
begin
{*
 00427134    push        ebp
 00427135    mov         ebp,esp
 00427137    mov         eax,dword ptr [ebp+8]
 0042713A    push        eax
 0042713B    mov         eax,[00792F0C]
 00427140    push        eax
 00427141    call        TLanguages.LocalesCallback
 00427146    pop         ebp
 00427147    ret         4
*}
end;

//0042714C
function GetLocaleDataW(ID:LCID; Flag:DWORD):UnicodeString;
begin
{*
 0042714C    push        ebx
 0042714D    add         esp,0FFFFF800
 00427153    mov         ebx,ecx
 00427155    mov         word ptr [esp],0
 0042715B    push        400
 00427160    lea         ecx,[esp+4]
 00427164    push        ecx
 00427165    push        edx
 00427166    push        eax
 00427167    call        kernel32.GetLocaleInfoW
 0042716C    mov         eax,ebx
 0042716E    mov         edx,esp
 00427170    mov         ecx,400
 00427175    call        @UStrFromWArray
 0042717A    add         esp,800
 00427180    pop         ebx
 00427181    ret
*}
end;

//00427184
function TLanguages.LocalesCallback(LocaleID:PChar):Integer; stdcall;
begin
{*
 00427184    push        ebp
 00427185    mov         ebp,esp
 00427187    mov         ecx,6
 0042718C    push        0
 0042718E    push        0
 00427190    dec         ecx
>00427191    jne         0042718C
 00427193    push        ebx
 00427194    push        esi
 00427195    mov         esi,dword ptr [ebp+8]
 00427198    xor         eax,eax
 0042719A    push        ebp
 0042719B    push        4272D3
 004271A0    push        dword ptr fs:[eax]
 004271A3    mov         dword ptr fs:[eax],esp
 004271A6    lea         eax,[ebp-0C]
 004271A9    push        eax
 004271AA    lea         eax,[ebp-10]
 004271AD    mov         edx,dword ptr [ebp+0C]
 004271B0    call        @UStrFromPWChar
 004271B5    mov         eax,dword ptr [ebp-10]
 004271B8    mov         ecx,4
 004271BD    mov         edx,5
 004271C2    call        @UStrCopy
 004271C7    mov         ecx,dword ptr [ebp-0C]
 004271CA    lea         eax,[ebp-8]
 004271CD    mov         edx,4272F0;'$'
 004271D2    call        @UStrCat3
 004271D7    mov         eax,dword ptr [ebp-8]
 004271DA    call        StrToInt
 004271DF    mov         ebx,eax
 004271E1    lea         ecx,[ebp-4]
 004271E4    mov         edx,3
 004271E9    mov         eax,ebx
 004271EB    call        GetLocaleDataW
 004271F0    cmp         dword ptr [ebp-4],0
>004271F4    je          004272A6
 004271FA    mov         eax,dword ptr [esi+4]
 004271FD    call        @DynArrayLength
 00427202    inc         eax
 00427203    push        eax
 00427204    lea         eax,[esi+4]
 00427207    mov         ecx,1
 0042720C    mov         edx,dword ptr ds:[41AA38];TArray<SysUtils.TLangRec>
 00427212    call        @DynArraySetLength
 00427217    add         esp,4
 0042721A    mov         eax,dword ptr [esi+4]
 0042721D    call        @DynArrayHigh
 00427222    add         eax,eax
 00427224    mov         edx,dword ptr [esi+4]
 00427227    lea         eax,[edx+eax*8]
 0042722A    mov         esi,eax
 0042722C    lea         ecx,[ebp-14]
 0042722F    mov         edx,2
 00427234    mov         eax,ebx
 00427236    call        GetLocaleDataW
 0042723B    mov         edx,dword ptr [ebp-14]
 0042723E    mov         eax,esi
 00427240    call        @UStrAsg
 00427245    mov         dword ptr [esi+4],ebx
 00427248    lea         eax,[esi+8]
 0042724B    mov         edx,dword ptr [ebp-4]
 0042724E    call        @UStrAsg
 00427253    lea         eax,[ebp-18]
 00427256    push        eax
 00427257    lea         ecx,[ebp-2C]
 0042725A    mov         edx,59
 0042725F    mov         eax,ebx
 00427261    call        GetLocaleDataW
 00427266    mov         eax,dword ptr [ebp-2C]
 00427269    mov         dword ptr [ebp-28],eax
 0042726C    mov         byte ptr [ebp-24],11
 00427270    lea         ecx,[ebp-30]
 00427273    mov         edx,5A
 00427278    mov         eax,ebx
 0042727A    call        GetLocaleDataW
 0042727F    mov         eax,dword ptr [ebp-30]
 00427282    mov         dword ptr [ebp-20],eax
 00427285    mov         byte ptr [ebp-1C],11
 00427289    lea         edx,[ebp-28]
 0042728C    mov         ecx,1
 00427291    mov         eax,427300;'%s-%s'
 00427296    call        Format
 0042729B    mov         edx,dword ptr [ebp-18]
 0042729E    lea         eax,[esi+0C]
 004272A1    call        @UStrAsg
 004272A6    mov         ebx,1
 004272AB    xor         eax,eax
 004272AD    pop         edx
 004272AE    pop         ecx
 004272AF    pop         ecx
 004272B0    mov         dword ptr fs:[eax],edx
 004272B3    push        4272DA
 004272B8    lea         eax,[ebp-30]
 004272BB    mov         edx,2
 004272C0    call        @UStrArrayClr
 004272C5    lea         eax,[ebp-18]
 004272C8    mov         edx,6
 004272CD    call        @UStrArrayClr
 004272D2    ret
>004272D3    jmp         @HandleFinally
>004272D8    jmp         004272B8
 004272DA    mov         eax,ebx
 004272DC    pop         esi
 004272DD    pop         ebx
 004272DE    mov         esp,ebp
 004272E0    pop         ebp
 004272E1    ret         8
*}
end;

//0042730C
constructor TLanguages.Create();
begin
{*
 0042730C    push        ebx
 0042730D    push        esi
 0042730E    test        dl,dl
>00427310    je          0042731A
 00427312    add         esp,0FFFFFFF0
 00427315    call        @ClassCreate
 0042731A    mov         ebx,edx
 0042731C    mov         esi,eax
 0042731E    xor         edx,edx
 00427320    mov         eax,esi
 00427322    call        TObject.Create
 00427327    mov         dword ptr ds:[792F0C],esi
 0042732D    push        2
 0042732F    push        427134;EnumLocalesCallback:Integer
 00427334    call        kernel32.EnumSystemLocalesW
 00427339    mov         eax,esi
 0042733B    test        bl,bl
>0042733D    je          0042734E
 0042733F    call        @AfterConstruction
 00427344    pop         dword ptr fs:[0]
 0042734B    add         esp,0C
 0042734E    mov         eax,esi
 00427350    pop         esi
 00427351    pop         ebx
 00427352    ret
*}
end;

//00427354
destructor TLanguages.Destroy();
begin
{*
 00427354    push        ebx
 00427355    push        esi
 00427356    call        @BeforeDestruction
 0042735B    mov         ebx,edx
 0042735D    mov         esi,eax
 0042735F    mov         edx,ebx
 00427361    and         dl,0FC
 00427364    mov         eax,esi
 00427366    call        TObject.Destroy
 0042736B    test        bl,bl
>0042736D    jle         00427376
 0042736F    mov         eax,esi
 00427371    call        @ClassDestroy
 00427376    pop         esi
 00427377    pop         ebx
 00427378    ret
*}
end;

//00427388
function TLanguages.GetLocaleID(Index:Integer):LCID;
begin
{*
 00427388    add         edx,edx
 0042738A    mov         eax,dword ptr [eax+4]
 0042738D    mov         eax,dword ptr [eax+edx*8+4]
 00427391    ret
*}
end;

//00427394
function TLanguages.IndexOf(ID:Cardinal):Integer;
begin
{*
 00427394    push        ebx
 00427395    push        esi
 00427396    push        edi
 00427397    mov         esi,edx
 00427399    mov         ebx,eax
 0042739B    mov         eax,dword ptr [ebx+4];TLanguages......FSysLangs:TArray<SysUtils.TLangRec>
 0042739E    call        @DynArrayHigh
 004273A3    test        eax,eax
>004273A5    jl          004273BB
 004273A7    inc         eax
 004273A8    xor         edx,edx
 004273AA    mov         ecx,edx
 004273AC    add         ecx,ecx
 004273AE    mov         edi,dword ptr [ebx+4];TLanguages.......FSysLangs:TArray<SysUtils.TLangRec>
 004273B1    cmp         esi,dword ptr [edi+ecx*8+4]
>004273B5    je          004273BE
 004273B7    inc         edx
 004273B8    dec         eax
>004273B9    jne         004273AA
 004273BB    or          edx,0FFFFFFFF
 004273BE    mov         eax,edx
 004273C0    pop         edi
 004273C1    pop         esi
 004273C2    pop         ebx
 004273C3    ret
*}
end;

//004273C4
function TLanguages.IndexOf(LocaleName:string):Integer;
begin
{*
 004273C4    push        ebx
 004273C5    push        esi
 004273C6    push        edi
 004273C7    push        ebp
 004273C8    mov         ebp,edx
 004273CA    mov         edi,eax
 004273CC    mov         eax,dword ptr [edi+4]
 004273CF    call        @DynArrayHigh
 004273D4    mov         ebx,eax
 004273D6    test        ebx,ebx
>004273D8    jl          004273F7
 004273DA    inc         ebx
 004273DB    xor         esi,esi
 004273DD    mov         eax,esi
 004273DF    add         eax,eax
 004273E1    mov         edx,dword ptr [edi+4]
 004273E4    mov         eax,dword ptr [edx+eax*8+0C]
 004273E8    mov         edx,ebp
 004273EA    call        CompareText
 004273EF    test        eax,eax
>004273F1    je          004273FA
 004273F3    inc         esi
 004273F4    dec         ebx
>004273F5    jne         004273DD
 004273F7    or          esi,0FFFFFFFF
 004273FA    mov         eax,esi
 004273FC    pop         ebp
 004273FD    pop         edi
 004273FE    pop         esi
 004273FF    pop         ebx
 00427400    ret
*}
end;

end.