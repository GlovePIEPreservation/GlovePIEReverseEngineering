//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit ComObj;

interface

uses
  SysUtils, Classes;

type
  EOleError = class(Exception)
  end;
  EOleSysError = class(EOleError)
  published
    constructor Create(HelpContext:Integer; ErrorCode:HRESULT);//0052ED74
  public
    FErrorCode:HRESULT;//f18
  end;
  EOleException = class(EOleSysError)
  published
    constructor Create(HelpContext:Integer; HelpFile:string; Source:string; ErrorCode:HRESULT);//0052EE48
  public
    FSource:string;//f1C
    FHelpFile:string;//f20
  end;
    function DoSetErrorInfo(const Description:WideString; HelpContext:Integer; ErrorCode:HRESULT; const ErrorIID:TGUID; const ProgID:WideString; const HelpFileName:WideString):HRESULT;//0052EAA4
    function HandleSafeCallException(ExceptObject:TObject; ExceptAddr:Pointer; const ErrorIID:TGUID; const ProgID:WideString; const HelpFileName:WideString):HRESULT;//0052EBCC
    function TrimPunctuation(const S:UnicodeString):UnicodeString;//0052ECF8
    procedure OleError(ErrorCode:HRESULT);//0052EEE0
    procedure OleCheck(Result:HRESULT);//0052EEFC
    function GUIDToString(const ClassID:TGUID):UnicodeString;//0052EF0C
    function ClassIDToProgID(const ClassID:TGUID):UnicodeString;//0052EF38
    function CreateComObject(const ClassID:TGUID):IUnknown;//0052EF64
    function CreateRemoteComObject(const MachineName:WideString; const ClassID:TGUID):IUnknown;//0052F090
    procedure InterfaceConnect(const Source:IUnknown; const IID:TIID; const Sink:IUnknown; var Connection:LongInt);//0052F1F8
    procedure InterfaceDisconnect(const Source:IUnknown; const IID:TIID; var Connection:LongInt);//0052F2AC
    procedure LoadComExProcs;//0052F368
    function CreateSafeCallErrorExceptionObject(ErrorCode:Integer):Exception;//0052F4EC
    procedure SafeCallError(ErrorCode:Integer; ErrorAddr:Pointer);//0052F610
    procedure DispatchInvoke(const Dispatch:IDispatch; CallDesc:PCallDesc; DispIDs:PDispIDList; Params:Pointer; Result:PVariant);//0052F620
    procedure RaiseNameException;//0052F95C
    procedure GetIDsOfNames(const Dispatch:IDispatch; Names:PAnsiChar; NameCount:Integer; DispIDs:PDispIDList);//0052F990
    procedure RaiseException;//0052FA74
    procedure VarDispInvoke(Result:PVariant; const Instance:Variant; CallDesc:PCallDesc; Params:Pointer); cdecl;//0052FA8C
    procedure DispCallError(Status:Integer; var ExcepInfo:TExcepInfo; ErrorAddr:Pointer; FinalizeExcepInfo:Boolean);//0052FB28
    procedure DispatchInvokeError(Status:Integer; const ExcepInfo:TExcepInfo);//0052FBFC
    procedure ClearExcepInfo(var ExcepInfo:TExcepInfo);//0052FC08
    procedure DispCall(const Dispatch:IDispatch; CallDesc:PCallDesc; DispID:Integer; NamedArgDispIDs:Pointer; Params:Pointer; Result:Pointer); stdcall;//0052FC18
    procedure DispCallByID(Result:Pointer; const Dispatch:IDispatch; DispDesc:PDispDesc; Params:Pointer); cdecl;//0052FCFC
    procedure InitComObj;//0052FDD8

implementation

//0052EAA4
function DoSetErrorInfo(const Description:WideString; HelpContext:Integer; ErrorCode:HRESULT; const ErrorIID:TGUID; const ProgID:WideString; const HelpFileName:WideString):HRESULT;
begin
{*
 0052EAA4    push        ebp
 0052EAA5    mov         ebp,esp
 0052EAA7    push        0
 0052EAA9    push        0
 0052EAAB    push        0
 0052EAAD    push        ebx
 0052EAAE    push        esi
 0052EAAF    push        edi
 0052EAB0    mov         dword ptr [ebp-0C],ecx
 0052EAB3    mov         edi,edx
 0052EAB5    mov         esi,eax
 0052EAB7    xor         eax,eax
 0052EAB9    push        ebp
 0052EABA    push        52EBA7
 0052EABF    push        dword ptr fs:[eax]
 0052EAC2    mov         dword ptr fs:[eax],esp
 0052EAC5    mov         ebx,8000FFFF
 0052EACA    lea         eax,[ebp-4]
 0052EACD    call        @IntfClear
 0052EAD2    push        eax
 0052EAD3    call        oleaut32.CreateErrorInfo
 0052EAD8    test        eax,80000000
 0052EADD    sete        al
 0052EAE0    test        al,al
>0052EAE2    je          0052EB89
 0052EAE8    mov         eax,dword ptr [ebp+10]
 0052EAEB    push        eax
 0052EAEC    mov         eax,dword ptr [ebp-4]
 0052EAEF    push        eax
 0052EAF0    mov         eax,dword ptr [eax]
 0052EAF2    call        dword ptr [eax+0C]
 0052EAF5    mov         eax,dword ptr [ebp+0C]
 0052EAF8    xor         edx,edx
 0052EAFA    call        @WStrEqual
>0052EAFF    je          0052EB13
 0052EB01    mov         eax,dword ptr [ebp+0C]
 0052EB04    call        @WStrToPWChar
 0052EB09    push        eax
 0052EB0A    mov         eax,dword ptr [ebp-4]
 0052EB0D    push        eax
 0052EB0E    mov         eax,dword ptr [eax]
 0052EB10    call        dword ptr [eax+10]
 0052EB13    mov         eax,dword ptr [ebp+8]
 0052EB16    xor         edx,edx
 0052EB18    call        @WStrEqual
>0052EB1D    je          0052EB31
 0052EB1F    mov         eax,dword ptr [ebp+8]
 0052EB22    call        @WStrToPWChar
 0052EB27    push        eax
 0052EB28    mov         eax,dword ptr [ebp-4]
 0052EB2B    push        eax
 0052EB2C    mov         eax,dword ptr [eax]
 0052EB2E    call        dword ptr [eax+18]
 0052EB31    mov         eax,esi
 0052EB33    xor         edx,edx
 0052EB35    call        @WStrEqual
>0052EB3A    je          0052EB4D
 0052EB3C    mov         eax,esi
 0052EB3E    call        @WStrToPWChar
 0052EB43    push        eax
 0052EB44    mov         eax,dword ptr [ebp-4]
 0052EB47    push        eax
 0052EB48    mov         eax,dword ptr [eax]
 0052EB4A    call        dword ptr [eax+14]
 0052EB4D    test        edi,edi
>0052EB4F    je          0052EB5B
 0052EB51    push        edi
 0052EB52    mov         eax,dword ptr [ebp-4]
 0052EB55    push        eax
 0052EB56    mov         eax,dword ptr [eax]
 0052EB58    call        dword ptr [eax+1C]
 0052EB5B    cmp         dword ptr [ebp-0C],0
>0052EB5F    je          0052EB64
 0052EB61    mov         ebx,dword ptr [ebp-0C]
 0052EB64    lea         eax,[ebp-8]
 0052EB67    call        @IntfClear
 0052EB6C    push        eax
 0052EB6D    push        52EBBC
 0052EB72    mov         eax,dword ptr [ebp-4]
 0052EB75    push        eax
 0052EB76    mov         eax,dword ptr [eax]
 0052EB78    call        dword ptr [eax]
 0052EB7A    test        eax,eax
>0052EB7C    jne         0052EB89
 0052EB7E    mov         eax,dword ptr [ebp-8]
 0052EB81    push        eax
 0052EB82    push        0
 0052EB84    call        oleaut32.SetErrorInfo
 0052EB89    xor         eax,eax
 0052EB8B    pop         edx
 0052EB8C    pop         ecx
 0052EB8D    pop         ecx
 0052EB8E    mov         dword ptr fs:[eax],edx
 0052EB91    push        52EBAE
 0052EB96    lea         eax,[ebp-8]
 0052EB99    call        @IntfClear
 0052EB9E    lea         eax,[ebp-4]
 0052EBA1    call        @IntfClear
 0052EBA6    ret
>0052EBA7    jmp         @HandleFinally
>0052EBAC    jmp         0052EB96
 0052EBAE    mov         eax,ebx
 0052EBB0    pop         edi
 0052EBB1    pop         esi
 0052EBB2    pop         ebx
 0052EBB3    mov         esp,ebp
 0052EBB5    pop         ebp
 0052EBB6    ret         0C
*}
end;

//0052EBCC
function HandleSafeCallException(ExceptObject:TObject; ExceptAddr:Pointer; const ErrorIID:TGUID; const ProgID:WideString; const HelpFileName:WideString):HRESULT;
begin
{*
 0052EBCC    push        ebp
 0052EBCD    mov         ebp,esp
 0052EBCF    push        0
 0052EBD1    push        ebx
 0052EBD2    push        esi
 0052EBD3    push        edi
 0052EBD4    mov         edi,ecx
 0052EBD6    xor         edx,edx
 0052EBD8    push        ebp
 0052EBD9    push        52EC79
 0052EBDE    push        dword ptr fs:[edx]
 0052EBE1    mov         dword ptr fs:[edx],esp
 0052EBE4    mov         ebx,eax
 0052EBE6    mov         eax,ebx
 0052EBE8    mov         edx,dword ptr ds:[418C04];Exception
 0052EBEE    call        @IsClass
 0052EBF3    test        al,al
>0052EBF5    je          0052EC3F
 0052EBF7    lea         eax,[ebp-4]
 0052EBFA    mov         esi,ebx
 0052EBFC    mov         edx,dword ptr [esi+4]
 0052EBFF    call        @WStrFromUStr
 0052EC04    mov         esi,dword ptr [esi+8]
 0052EC07    mov         eax,ebx
 0052EC09    mov         edx,dword ptr ds:[52E794];EOleSysError
 0052EC0F    call        @IsClass
 0052EC14    test        al,al
>0052EC16    je          0052EC23
 0052EC18    cmp         dword ptr [ebx+18],0
>0052EC1C    jge         0052EC23
 0052EC1E    mov         eax,dword ptr [ebx+18]
>0052EC21    jmp         0052EC4C
 0052EC23    mov         eax,ebx
 0052EC25    mov         edx,dword ptr ds:[4195F4];EAbort
 0052EC2B    call        @IsClass
 0052EC30    test        al,al
>0052EC32    je          0052EC3B
 0052EC34    mov         eax,0A0004004
>0052EC39    jmp         0052EC4C
 0052EC3B    xor         eax,eax
>0052EC3D    jmp         0052EC4C
 0052EC3F    lea         eax,[ebp-4]
 0052EC42    call        @WStrClr
 0052EC47    or          esi,0FFFFFFFF
 0052EC4A    xor         eax,eax
 0052EC4C    push        edi
 0052EC4D    mov         edx,dword ptr [ebp+0C]
 0052EC50    push        edx
 0052EC51    mov         edx,dword ptr [ebp+8]
 0052EC54    push        edx
 0052EC55    mov         ecx,eax
 0052EC57    mov         edx,esi
 0052EC59    mov         eax,dword ptr [ebp-4]
 0052EC5C    call        DoSetErrorInfo
 0052EC61    mov         ebx,eax
 0052EC63    xor         eax,eax
 0052EC65    pop         edx
 0052EC66    pop         ecx
 0052EC67    pop         ecx
 0052EC68    mov         dword ptr fs:[eax],edx
 0052EC6B    push        52EC80
 0052EC70    lea         eax,[ebp-4]
 0052EC73    call        @WStrClr
 0052EC78    ret
>0052EC79    jmp         @HandleFinally
>0052EC7E    jmp         0052EC70
 0052EC80    mov         eax,ebx
 0052EC82    pop         edi
 0052EC83    pop         esi
 0052EC84    pop         ebx
 0052EC85    pop         ecx
 0052EC86    pop         ebp
 0052EC87    ret         8
*}
end;

//0052ECF8
function TrimPunctuation(const S:UnicodeString):UnicodeString;
begin
{*
 0052ECF8    push        ebx
 0052ECF9    push        esi
 0052ECFA    mov         ebx,edx
 0052ECFC    mov         esi,eax
 0052ECFE    mov         eax,ebx
 0052ED00    mov         edx,esi
 0052ED02    call        @UStrAsg
 0052ED07    mov         eax,dword ptr [ebx]
 0052ED09    call        AnsiLastChar
 0052ED0E    mov         esi,eax
>0052ED10    jmp         0052ED34
 0052ED12    mov         eax,dword ptr [ebx]
 0052ED14    call        @UStrToPWChar
 0052ED19    mov         edx,esi
 0052ED1B    sub         edx,eax
 0052ED1D    sar         edx,1
>0052ED1F    jns         0052ED24
 0052ED21    adc         edx,0
 0052ED24    mov         eax,ebx
 0052ED26    call        @UStrSetLength
 0052ED2B    mov         eax,dword ptr [ebx]
 0052ED2D    call        AnsiLastChar
 0052ED32    mov         esi,eax
 0052ED34    mov         eax,dword ptr [ebx]
 0052ED36    call        @UStrLen
 0052ED3B    test        eax,eax
>0052ED3D    jle         0052ED50
 0052ED3F    mov         edx,52ED54
 0052ED44    movzx       eax,word ptr [esi]
 0052ED47    call        CharInSet
 0052ED4C    test        al,al
>0052ED4E    jne         0052ED12
 0052ED50    pop         esi
 0052ED51    pop         ebx
 0052ED52    ret
*}
end;

//0052ED74
constructor EOleSysError.Create(HelpContext:Integer; ErrorCode:HRESULT);
begin
{*
 0052ED74    push        ebp
 0052ED75    mov         ebp,esp
 0052ED77    add         esp,0FFFFFFEC
 0052ED7A    push        ebx
 0052ED7B    push        esi
 0052ED7C    push        edi
 0052ED7D    xor         ebx,ebx
 0052ED7F    mov         dword ptr [ebp-0C],ebx
 0052ED82    mov         dword ptr [ebp-4],ebx
 0052ED85    test        dl,dl
>0052ED87    je          0052ED91
 0052ED89    add         esp,0FFFFFFF0
 0052ED8C    call        @ClassCreate
 0052ED91    mov         edi,ecx
 0052ED93    mov         byte ptr [ebp-5],dl
 0052ED96    mov         ebx,eax
 0052ED98    mov         esi,dword ptr [ebp+0C]
 0052ED9B    xor         eax,eax
 0052ED9D    push        ebp
 0052ED9E    push        52EE1E
 0052EDA3    push        dword ptr fs:[eax]
 0052EDA6    mov         dword ptr fs:[eax],esp
 0052EDA9    lea         eax,[ebp-4]
 0052EDAC    mov         edx,edi
 0052EDAE    call        @UStrLAsg
 0052EDB3    cmp         dword ptr [ebp-4],0
>0052EDB7    jne         0052EDED
 0052EDB9    lea         edx,[ebp-4]
 0052EDBC    mov         eax,esi
 0052EDBE    call        SysErrorMessage
 0052EDC3    cmp         dword ptr [ebp-4],0
>0052EDC7    jne         0052EDED
 0052EDC9    push        0
 0052EDCB    lea         edx,[ebp-0C]
 0052EDCE    mov         eax,[0078CDA4];^SResString575:TResStringRec
 0052EDD3    call        LoadResString
 0052EDD8    mov         edx,dword ptr [ebp-0C]
 0052EDDB    mov         dword ptr [ebp-14],esi
 0052EDDE    mov         byte ptr [ebp-10],0
 0052EDE2    lea         ecx,[ebp-14]
 0052EDE5    lea         eax,[ebp-4]
 0052EDE8    call        FmtStr
 0052EDED    mov         eax,dword ptr [ebp+8]
 0052EDF0    push        eax
 0052EDF1    mov         ecx,dword ptr [ebp-4]
 0052EDF4    xor         edx,edx
 0052EDF6    mov         eax,ebx
 0052EDF8    call        Exception.CreateHelp
 0052EDFD    mov         dword ptr [ebx+18],esi
 0052EE00    xor         eax,eax
 0052EE02    pop         edx
 0052EE03    pop         ecx
 0052EE04    pop         ecx
 0052EE05    mov         dword ptr fs:[eax],edx
 0052EE08    push        52EE25
 0052EE0D    lea         eax,[ebp-0C]
 0052EE10    call        @UStrClr
 0052EE15    lea         eax,[ebp-4]
 0052EE18    call        @UStrClr
 0052EE1D    ret
>0052EE1E    jmp         @HandleFinally
>0052EE23    jmp         0052EE0D
 0052EE25    mov         eax,ebx
 0052EE27    cmp         byte ptr [ebp-5],0
>0052EE2B    je          0052EE3C
 0052EE2D    call        @AfterConstruction
 0052EE32    pop         dword ptr fs:[0]
 0052EE39    add         esp,0C
 0052EE3C    mov         eax,ebx
 0052EE3E    pop         edi
 0052EE3F    pop         esi
 0052EE40    pop         ebx
 0052EE41    mov         esp,ebp
 0052EE43    pop         ebp
 0052EE44    ret         8
*}
end;

//0052EE48
constructor EOleException.Create(HelpContext:Integer; HelpFile:string; Source:string; ErrorCode:HRESULT);
begin
{*
 0052EE48    push        ebp
 0052EE49    mov         ebp,esp
 0052EE4B    push        0
 0052EE4D    push        ebx
 0052EE4E    push        esi
 0052EE4F    push        edi
 0052EE50    test        dl,dl
>0052EE52    je          0052EE5C
 0052EE54    add         esp,0FFFFFFF0
 0052EE57    call        @ClassCreate
 0052EE5C    mov         esi,ecx
 0052EE5E    mov         ebx,edx
 0052EE60    mov         edi,eax
 0052EE62    xor         eax,eax
 0052EE64    push        ebp
 0052EE65    push        52EEBA
 0052EE6A    push        dword ptr fs:[eax]
 0052EE6D    mov         dword ptr fs:[eax],esp
 0052EE70    mov         eax,dword ptr [ebp+14]
 0052EE73    push        eax
 0052EE74    mov         eax,dword ptr [ebp+8]
 0052EE77    push        eax
 0052EE78    lea         edx,[ebp-4]
 0052EE7B    mov         eax,esi
 0052EE7D    call        TrimPunctuation
 0052EE82    mov         ecx,dword ptr [ebp-4]
 0052EE85    xor         edx,edx
 0052EE87    mov         eax,edi
 0052EE89    call        EOleSysError.Create
 0052EE8E    lea         eax,[edi+1C]
 0052EE91    mov         edx,dword ptr [ebp+10]
 0052EE94    call        @UStrAsg
 0052EE99    lea         eax,[edi+20]
 0052EE9C    mov         edx,dword ptr [ebp+0C]
 0052EE9F    call        @UStrAsg
 0052EEA4    xor         eax,eax
 0052EEA6    pop         edx
 0052EEA7    pop         ecx
 0052EEA8    pop         ecx
 0052EEA9    mov         dword ptr fs:[eax],edx
 0052EEAC    push        52EEC1
 0052EEB1    lea         eax,[ebp-4]
 0052EEB4    call        @UStrClr
 0052EEB9    ret
>0052EEBA    jmp         @HandleFinally
>0052EEBF    jmp         0052EEB1
 0052EEC1    mov         eax,edi
 0052EEC3    test        bl,bl
>0052EEC5    je          0052EED6
 0052EEC7    call        @AfterConstruction
 0052EECC    pop         dword ptr fs:[0]
 0052EED3    add         esp,0C
 0052EED6    mov         eax,edi
 0052EED8    pop         edi
 0052EED9    pop         esi
 0052EEDA    pop         ebx
 0052EEDB    pop         ecx
 0052EEDC    pop         ebp
 0052EEDD    ret         10
*}
end;

//0052EEE0
procedure OleError(ErrorCode:HRESULT);
begin
{*
 0052EEE0    push        ebx
 0052EEE1    mov         ebx,eax
 0052EEE3    push        ebx
 0052EEE4    push        0
 0052EEE6    xor         ecx,ecx
 0052EEE8    mov         dl,1
 0052EEEA    mov         eax,[0052E794];EOleSysError
 0052EEEF    call        EOleSysError.Create
 0052EEF4    call        @RaiseExcept
 0052EEF9    pop         ebx
 0052EEFA    ret
*}
end;

//0052EEFC
procedure OleCheck(Result:HRESULT);
begin
{*
 0052EEFC    test        eax,80000000
>0052EF01    je          0052EF08
 0052EF03    call        OleError
 0052EF08    ret
*}
end;

//0052EF0C
function GUIDToString(const ClassID:TGUID):UnicodeString;
begin
{*
 0052EF0C    push        ebx
 0052EF0D    push        esi
 0052EF0E    push        ecx
 0052EF0F    mov         esi,edx
 0052EF11    mov         ebx,eax
 0052EF13    push        esp
 0052EF14    push        ebx
 0052EF15    call        ole32.StringFromCLSID
 0052EF1A    call        OleCheck
 0052EF1F    mov         eax,esi
 0052EF21    mov         edx,dword ptr [esp]
 0052EF24    call        @UStrFromPWChar
 0052EF29    mov         eax,dword ptr [esp]
 0052EF2C    push        eax
 0052EF2D    call        ole32.CoTaskMemFree
 0052EF32    pop         edx
 0052EF33    pop         esi
 0052EF34    pop         ebx
 0052EF35    ret
*}
end;

//0052EF38
function ClassIDToProgID(const ClassID:TGUID):UnicodeString;
begin
{*
 0052EF38    push        ebx
 0052EF39    push        esi
 0052EF3A    push        ecx
 0052EF3B    mov         esi,edx
 0052EF3D    mov         ebx,eax
 0052EF3F    push        esp
 0052EF40    push        ebx
 0052EF41    call        ole32.ProgIDFromCLSID
 0052EF46    call        OleCheck
 0052EF4B    mov         eax,esi
 0052EF4D    mov         edx,dword ptr [esp]
 0052EF50    call        @UStrFromPWChar
 0052EF55    mov         eax,dword ptr [esp]
 0052EF58    push        eax
 0052EF59    call        ole32.CoTaskMemFree
 0052EF5E    pop         edx
 0052EF5F    pop         esi
 0052EF60    pop         ebx
 0052EF61    ret
*}
end;

//0052EF64
function CreateComObject(const ClassID:TGUID):IUnknown;
begin
{*
 0052EF64    push        ebp
 0052EF65    mov         ebp,esp
 0052EF67    add         esp,0FFFFFFE4
 0052EF6A    push        ebx
 0052EF6B    push        esi
 0052EF6C    push        edi
 0052EF6D    xor         ecx,ecx
 0052EF6F    mov         dword ptr [ebp-8],ecx
 0052EF72    mov         dword ptr [ebp-1C],ecx
 0052EF75    mov         ebx,edx
 0052EF77    mov         dword ptr [ebp-4],eax
 0052EF7A    xor         eax,eax
 0052EF7C    push        ebp
 0052EF7D    push        52F044
 0052EF82    push        dword ptr fs:[eax]
 0052EF85    mov         dword ptr fs:[eax],esp
 0052EF88    xor         eax,eax
 0052EF8A    push        ebp
 0052EF8B    push        52EFBF
 0052EF90    push        dword ptr fs:[eax]
 0052EF93    mov         dword ptr fs:[eax],esp
 0052EF96    mov         eax,ebx
 0052EF98    call        @IntfClear
 0052EF9D    push        eax
 0052EF9E    push        52F054
 0052EFA3    push        5
 0052EFA5    push        0
 0052EFA7    mov         eax,dword ptr [ebp-4]
 0052EFAA    push        eax
 0052EFAB    call        ole32.CoCreateInstance
 0052EFB0    call        OleCheck
 0052EFB5    xor         eax,eax
 0052EFB7    pop         edx
 0052EFB8    pop         ecx
 0052EFB9    pop         ecx
 0052EFBA    mov         dword ptr fs:[eax],edx
>0052EFBD    jmp         0052F026
>0052EFBF    jmp         @HandleOnException
 0052EFC4    dd          1
 0052EFC8    dd          0052E794;EOleSysError
 0052EFCC    dd          0052EFD0
 0052EFD0    mov         ebx,eax
 0052EFD2    mov         eax,dword ptr [ebx+18]
 0052EFD5    push        eax
 0052EFD6    push        0
 0052EFD8    lea         eax,[ebp-8]
 0052EFDB    push        eax
 0052EFDC    mov         eax,dword ptr [ebx+4]
 0052EFDF    mov         dword ptr [ebp-18],eax
 0052EFE2    mov         byte ptr [ebp-14],11
 0052EFE6    lea         edx,[ebp-1C]
 0052EFE9    mov         eax,dword ptr [ebp-4]
 0052EFEC    call        GUIDToString
 0052EFF1    mov         eax,dword ptr [ebp-1C]
 0052EFF4    mov         dword ptr [ebp-10],eax
 0052EFF7    mov         byte ptr [ebp-0C],11
 0052EFFB    lea         edx,[ebp-18]
 0052EFFE    mov         ecx,1
 0052F003    mov         eax,52F070;'%s, ClassID: %s'
 0052F008    call        Format
 0052F00D    mov         ecx,dword ptr [ebp-8]
 0052F010    mov         dl,1
 0052F012    mov         eax,[0052E794];EOleSysError
 0052F017    call        EOleSysError.Create
 0052F01C    call        @RaiseExcept
 0052F021    call        @DoneExcept
 0052F026    xor         eax,eax
 0052F028    pop         edx
 0052F029    pop         ecx
 0052F02A    pop         ecx
 0052F02B    mov         dword ptr fs:[eax],edx
 0052F02E    push        52F04B
 0052F033    lea         eax,[ebp-1C]
 0052F036    call        @UStrClr
 0052F03B    lea         eax,[ebp-8]
 0052F03E    call        @UStrClr
 0052F043    ret
>0052F044    jmp         @HandleFinally
>0052F049    jmp         0052F033
 0052F04B    pop         edi
 0052F04C    pop         esi
 0052F04D    pop         ebx
 0052F04E    mov         esp,ebp
 0052F050    pop         ebp
 0052F051    ret
*}
end;

//0052F090
function CreateRemoteComObject(const MachineName:WideString; const ClassID:TGUID):IUnknown;
begin
{*
 0052F090    push        ebp
 0052F091    mov         ebp,esp
 0052F093    add         esp,0FFFFFFA4
 0052F096    push        ebx
 0052F097    push        esi
 0052F098    push        edi
 0052F099    xor         ebx,ebx
 0052F09B    mov         dword ptr [ebp-58],ebx
 0052F09E    mov         dword ptr [ebp-5C],ebx
 0052F0A1    mov         dword ptr [ebp-10],ecx
 0052F0A4    mov         esi,edx
 0052F0A6    mov         ebx,eax
 0052F0A8    lea         eax,[ebp-0C]
 0052F0AB    mov         edx,dword ptr ds:[42AD88];tagMULTI_QI
 0052F0B1    call        @InitializeRecord
 0052F0B6    xor         eax,eax
 0052F0B8    push        ebp
 0052F0B9    push        52F1DA
 0052F0BE    push        dword ptr fs:[eax]
 0052F0C1    mov         dword ptr fs:[eax],esp
 0052F0C4    cmp         dword ptr ds:[7870BC],0
>0052F0CB    jne         0052F0E4
 0052F0CD    mov         ecx,dword ptr ds:[78CC04];^SResString579:TResStringRec
 0052F0D3    mov         dl,1
 0052F0D5    mov         eax,[00418C04];Exception
 0052F0DA    call        Exception.CreateRes
 0052F0DF    call        @RaiseExcept
 0052F0E4    lea         eax,[ebp-24]
 0052F0E7    xor         ecx,ecx
 0052F0E9    mov         edx,10
 0052F0EE    call        @FillChar
 0052F0F3    mov         eax,ebx
 0052F0F5    call        @WStrToPWChar
 0052F0FA    mov         dword ptr [ebp-20],eax
 0052F0FD    push        esi
 0052F0FE    mov         esi,52F1E8
 0052F103    lea         edi,[ebp-34]
 0052F106    movs        dword ptr [edi],dword ptr [esi]
 0052F107    movs        dword ptr [edi],dword ptr [esi]
 0052F108    movs        dword ptr [edi],dword ptr [esi]
 0052F109    movs        dword ptr [edi],dword ptr [esi]
 0052F10A    pop         esi
 0052F10B    lea         eax,[ebp-34]
 0052F10E    mov         dword ptr [ebp-0C],eax
 0052F111    lea         eax,[ebp-8]
 0052F114    call        @IntfClear
 0052F119    xor         eax,eax
 0052F11B    mov         dword ptr [ebp-4],eax
 0052F11E    mov         eax,ebx
 0052F120    test        eax,eax
>0052F122    je          0052F12B
 0052F124    sub         eax,4
 0052F127    mov         eax,dword ptr [eax]
 0052F129    shr         eax,1
 0052F12B    test        eax,eax
>0052F12D    jle         0052F180
 0052F12F    mov         dword ptr [ebp-14],20
 0052F136    lea         eax,[ebp-14]
 0052F139    push        eax
 0052F13A    lea         eax,[ebp-54]
 0052F13D    push        eax
 0052F13E    call        kernel32.GetComputerNameW
 0052F143    test        eax,eax
>0052F145    je          0052F179
 0052F147    lea         eax,[ebp-58]
 0052F14A    mov         edx,ebx
 0052F14C    call        @UStrFromWStr
 0052F151    mov         eax,dword ptr [ebp-58]
 0052F154    push        eax
 0052F155    lea         eax,[ebp-5C]
 0052F158    lea         edx,[ebp-54]
 0052F15B    mov         ecx,10
 0052F160    call        @UStrFromWArray
 0052F165    mov         eax,dword ptr [ebp-5C]
 0052F168    pop         edx
 0052F169    call        AnsiCompareText
 0052F16E    test        eax,eax
>0052F170    jne         0052F179
 0052F172    mov         ebx,15
>0052F177    jmp         0052F185
 0052F179    mov         ebx,10
>0052F17E    jmp         0052F185
 0052F180    mov         ebx,15
 0052F185    lea         eax,[ebp-0C]
 0052F188    push        eax
 0052F189    push        1
 0052F18B    lea         eax,[ebp-24]
 0052F18E    push        eax
 0052F18F    push        ebx
 0052F190    push        0
 0052F192    push        esi
 0052F193    call        dword ptr ds:[7870BC]
 0052F199    call        OleCheck
 0052F19E    mov         eax,dword ptr [ebp-4]
 0052F1A1    call        OleCheck
 0052F1A6    mov         eax,dword ptr [ebp-10]
 0052F1A9    mov         edx,dword ptr [ebp-8]
 0052F1AC    call        @IntfCopy
 0052F1B1    xor         eax,eax
 0052F1B3    pop         edx
 0052F1B4    pop         ecx
 0052F1B5    pop         ecx
 0052F1B6    mov         dword ptr fs:[eax],edx
 0052F1B9    push        52F1E1
 0052F1BE    lea         eax,[ebp-5C]
 0052F1C1    mov         edx,2
 0052F1C6    call        @UStrArrayClr
 0052F1CB    lea         eax,[ebp-0C]
 0052F1CE    mov         edx,dword ptr ds:[42AD88];tagMULTI_QI
 0052F1D4    call        @FinalizeRecord
 0052F1D9    ret
>0052F1DA    jmp         @HandleFinally
>0052F1DF    jmp         0052F1BE
 0052F1E1    pop         edi
 0052F1E2    pop         esi
 0052F1E3    pop         ebx
 0052F1E4    mov         esp,ebp
 0052F1E6    pop         ebp
 0052F1E7    ret
*}
end;

//0052F1F8
procedure InterfaceConnect(const Source:IUnknown; const IID:TIID; const Sink:IUnknown; var Connection:LongInt);
begin
{*
 0052F1F8    push        ebp
 0052F1F9    mov         ebp,esp
 0052F1FB    push        0
 0052F1FD    push        0
 0052F1FF    push        0
 0052F201    push        ebx
 0052F202    push        esi
 0052F203    push        edi
 0052F204    mov         dword ptr [ebp-0C],ecx
 0052F207    mov         esi,edx
 0052F209    mov         edi,eax
 0052F20B    mov         ebx,dword ptr [ebp+8]
 0052F20E    xor         eax,eax
 0052F210    push        ebp
 0052F211    push        52F28A
 0052F216    push        dword ptr fs:[eax]
 0052F219    mov         dword ptr fs:[eax],esp
 0052F21C    xor         eax,eax
 0052F21E    mov         dword ptr [ebx],eax
 0052F220    lea         eax,[ebp-4]
 0052F223    call        @IntfClear
 0052F228    push        eax
 0052F229    push        52F29C
 0052F22E    push        edi
 0052F22F    mov         eax,dword ptr [edi]
 0052F231    call        dword ptr [eax]
 0052F233    test        eax,80000000
 0052F238    sete        al
 0052F23B    test        al,al
>0052F23D    je          0052F26C
 0052F23F    lea         eax,[ebp-8]
 0052F242    call        @IntfClear
 0052F247    push        eax
 0052F248    push        esi
 0052F249    mov         eax,dword ptr [ebp-4]
 0052F24C    push        eax
 0052F24D    mov         eax,dword ptr [eax]
 0052F24F    call        dword ptr [eax+10]
 0052F252    test        eax,80000000
 0052F257    sete        al
 0052F25A    test        al,al
>0052F25C    je          0052F26C
 0052F25E    push        ebx
 0052F25F    mov         eax,dword ptr [ebp-0C]
 0052F262    push        eax
 0052F263    mov         eax,dword ptr [ebp-8]
 0052F266    push        eax
 0052F267    mov         eax,dword ptr [eax]
 0052F269    call        dword ptr [eax+14]
 0052F26C    xor         eax,eax
 0052F26E    pop         edx
 0052F26F    pop         ecx
 0052F270    pop         ecx
 0052F271    mov         dword ptr fs:[eax],edx
 0052F274    push        52F291
 0052F279    lea         eax,[ebp-8]
 0052F27C    call        @IntfClear
 0052F281    lea         eax,[ebp-4]
 0052F284    call        @IntfClear
 0052F289    ret
>0052F28A    jmp         @HandleFinally
>0052F28F    jmp         0052F279
 0052F291    pop         edi
 0052F292    pop         esi
 0052F293    pop         ebx
 0052F294    mov         esp,ebp
 0052F296    pop         ebp
 0052F297    ret         4
*}
end;

//0052F2AC
procedure InterfaceDisconnect(const Source:IUnknown; const IID:TIID; var Connection:LongInt);
begin
{*
 0052F2AC    push        ebp
 0052F2AD    mov         ebp,esp
 0052F2AF    push        0
 0052F2B1    push        0
 0052F2B3    push        ebx
 0052F2B4    push        esi
 0052F2B5    push        edi
 0052F2B6    mov         ebx,ecx
 0052F2B8    mov         esi,edx
 0052F2BA    mov         edi,eax
 0052F2BC    xor         eax,eax
 0052F2BE    push        ebp
 0052F2BF    push        52F347
 0052F2C4    push        dword ptr fs:[eax]
 0052F2C7    mov         dword ptr fs:[eax],esp
 0052F2CA    cmp         dword ptr [ebx],0
>0052F2CD    je          0052F329
 0052F2CF    lea         eax,[ebp-4]
 0052F2D2    call        @IntfClear
 0052F2D7    push        eax
 0052F2D8    push        52F358
 0052F2DD    push        edi
 0052F2DE    mov         eax,dword ptr [edi]
 0052F2E0    call        dword ptr [eax]
 0052F2E2    test        eax,80000000
 0052F2E7    sete        al
 0052F2EA    test        al,al
>0052F2EC    je          0052F329
 0052F2EE    lea         eax,[ebp-8]
 0052F2F1    call        @IntfClear
 0052F2F6    push        eax
 0052F2F7    push        esi
 0052F2F8    mov         eax,dword ptr [ebp-4]
 0052F2FB    push        eax
 0052F2FC    mov         eax,dword ptr [eax]
 0052F2FE    call        dword ptr [eax+10]
 0052F301    test        eax,80000000
 0052F306    sete        al
 0052F309    test        al,al
>0052F30B    je          0052F329
 0052F30D    mov         eax,dword ptr [ebx]
 0052F30F    push        eax
 0052F310    mov         eax,dword ptr [ebp-8]
 0052F313    push        eax
 0052F314    mov         eax,dword ptr [eax]
 0052F316    call        dword ptr [eax+18]
 0052F319    test        eax,80000000
 0052F31E    sete        al
 0052F321    test        al,al
>0052F323    je          0052F329
 0052F325    xor         eax,eax
 0052F327    mov         dword ptr [ebx],eax
 0052F329    xor         eax,eax
 0052F32B    pop         edx
 0052F32C    pop         ecx
 0052F32D    pop         ecx
 0052F32E    mov         dword ptr fs:[eax],edx
 0052F331    push        52F34E
 0052F336    lea         eax,[ebp-8]
 0052F339    call        @IntfClear
 0052F33E    lea         eax,[ebp-4]
 0052F341    call        @IntfClear
 0052F346    ret
>0052F347    jmp         @HandleFinally
>0052F34C    jmp         0052F336
 0052F34E    pop         edi
 0052F34F    pop         esi
 0052F350    pop         ebx
 0052F351    pop         ecx
 0052F352    pop         ecx
 0052F353    pop         ebp
 0052F354    ret
*}
end;

//0052F368
procedure LoadComExProcs;
begin
{*
 0052F368    push        ebx
 0052F369    push        52F3DC
 0052F36E    call        kernel32.GetModuleHandleW
 0052F373    mov         ebx,eax
 0052F375    test        ebx,ebx
>0052F377    je          0052F3D9
 0052F379    push        52F3F0
 0052F37E    push        ebx
 0052F37F    call        GetProcAddress
 0052F384    mov         [007870BC],eax
 0052F389    push        52F418
 0052F38E    push        ebx
 0052F38F    call        GetProcAddress
 0052F394    mov         [007870C0],eax
 0052F399    push        52F438
 0052F39E    push        ebx
 0052F39F    call        GetProcAddress
 0052F3A4    mov         [007870C4],eax
 0052F3A9    push        52F464
 0052F3AE    push        ebx
 0052F3AF    call        GetProcAddress
 0052F3B4    mov         [007870C8],eax
 0052F3B9    push        52F494
 0052F3BE    push        ebx
 0052F3BF    call        GetProcAddress
 0052F3C4    mov         [007870CC],eax
 0052F3C9    push        52F4C0
 0052F3CE    push        ebx
 0052F3CF    call        GetProcAddress
 0052F3D4    mov         [007870D0],eax
 0052F3D9    pop         ebx
 0052F3DA    ret
*}
end;

//0052F4EC
function CreateSafeCallErrorExceptionObject(ErrorCode:Integer):Exception;
begin
{*
 0052F4EC    push        ebp
 0052F4ED    mov         ebp,esp
 0052F4EF    mov         ecx,4
 0052F4F4    push        0
 0052F4F6    push        0
 0052F4F8    dec         ecx
>0052F4F9    jne         0052F4F4
 0052F4FB    push        ecx
 0052F4FC    push        ebx
 0052F4FD    mov         ebx,eax
 0052F4FF    xor         eax,eax
 0052F501    push        ebp
 0052F502    push        52F602
 0052F507    push        dword ptr fs:[eax]
 0052F50A    mov         dword ptr fs:[eax],esp
 0052F50D    xor         eax,eax
 0052F50F    mov         dword ptr [ebp-14],eax
 0052F512    lea         eax,[ebp-4]
 0052F515    call        @IntfClear
 0052F51A    push        eax
 0052F51B    push        0
 0052F51D    call        oleaut32.GetErrorInfo
 0052F522    test        eax,eax
>0052F524    jne         0052F569
 0052F526    lea         eax,[ebp-8]
 0052F529    call        @WStrClr
 0052F52E    push        eax
 0052F52F    mov         eax,dword ptr [ebp-4]
 0052F532    push        eax
 0052F533    mov         eax,dword ptr [eax]
 0052F535    call        dword ptr [eax+10]
 0052F538    lea         eax,[ebp-0C]
 0052F53B    call        @WStrClr
 0052F540    push        eax
 0052F541    mov         eax,dword ptr [ebp-4]
 0052F544    push        eax
 0052F545    mov         eax,dword ptr [eax]
 0052F547    call        dword ptr [eax+14]
 0052F54A    lea         eax,[ebp-10]
 0052F54D    call        @WStrClr
 0052F552    push        eax
 0052F553    mov         eax,dword ptr [ebp-4]
 0052F556    push        eax
 0052F557    mov         eax,dword ptr [eax]
 0052F559    call        dword ptr [eax+18]
 0052F55C    lea         eax,[ebp-14]
 0052F55F    push        eax
 0052F560    mov         eax,dword ptr [ebp-4]
 0052F563    push        eax
 0052F564    mov         eax,dword ptr [eax]
 0052F566    call        dword ptr [eax+1C]
 0052F569    cmp         ebx,0A0004004
>0052F56F    jne         0052F593
 0052F571    mov         eax,dword ptr [ebp-14]
 0052F574    push        eax
 0052F575    lea         eax,[ebp-18]
 0052F578    mov         edx,dword ptr [ebp-0C]
 0052F57B    call        @UStrFromWStr
 0052F580    mov         ecx,dword ptr [ebp-18]
 0052F583    mov         dl,1
 0052F585    mov         eax,[004195F4];EAbort
 0052F58A    call        Exception.CreateHelp
 0052F58F    mov         ebx,eax
>0052F591    jmp         0052F5D2
 0052F593    push        ebx
 0052F594    lea         eax,[ebp-1C]
 0052F597    mov         edx,dword ptr [ebp-8]
 0052F59A    call        @UStrFromWStr
 0052F59F    mov         eax,dword ptr [ebp-1C]
 0052F5A2    push        eax
 0052F5A3    lea         eax,[ebp-20]
 0052F5A6    mov         edx,dword ptr [ebp-10]
 0052F5A9    call        @UStrFromWStr
 0052F5AE    mov         eax,dword ptr [ebp-20]
 0052F5B1    push        eax
 0052F5B2    mov         eax,dword ptr [ebp-14]
 0052F5B5    push        eax
 0052F5B6    lea         eax,[ebp-24]
 0052F5B9    mov         edx,dword ptr [ebp-0C]
 0052F5BC    call        @UStrFromWStr
 0052F5C1    mov         ecx,dword ptr [ebp-24]
 0052F5C4    mov         dl,1
 0052F5C6    mov         eax,[0052E8E0];EOleException
 0052F5CB    call        EOleException.Create
 0052F5D0    mov         ebx,eax
 0052F5D2    xor         eax,eax
 0052F5D4    pop         edx
 0052F5D5    pop         ecx
 0052F5D6    pop         ecx
 0052F5D7    mov         dword ptr fs:[eax],edx
 0052F5DA    push        52F609
 0052F5DF    lea         eax,[ebp-24]
 0052F5E2    mov         edx,4
 0052F5E7    call        @UStrArrayClr
 0052F5EC    lea         eax,[ebp-10]
 0052F5EF    mov         edx,3
 0052F5F4    call        @WStrArrayClr
 0052F5F9    lea         eax,[ebp-4]
 0052F5FC    call        @IntfClear
 0052F601    ret
>0052F602    jmp         @HandleFinally
>0052F607    jmp         0052F5DF
 0052F609    mov         eax,ebx
 0052F60B    pop         ebx
 0052F60C    mov         esp,ebp
 0052F60E    pop         ebp
 0052F60F    ret
*}
end;

//0052F610
procedure SafeCallError(ErrorCode:Integer; ErrorAddr:Pointer);
begin
{*
 0052F610    mov         dword ptr [esp],edx
 0052F613    call        CreateSafeCallErrorExceptionObject
>0052F618    jmp         @RaiseExcept
 0052F61D    ret
*}
end;

//0052F620
procedure DispatchInvoke(const Dispatch:IDispatch; CallDesc:PCallDesc; DispIDs:PDispIDList; Params:Pointer; Result:PVariant);
begin
{*
 0052F620    push        ebp
 0052F621    mov         ebp,esp
 0052F623    add         esp,0FFFFF9B0
 0052F629    push        ebx
 0052F62A    push        esi
 0052F62B    push        edi
 0052F62C    mov         dword ptr [ebp-28],ecx
 0052F62F    mov         esi,edx
 0052F631    mov         dword ptr [ebp-24],eax
 0052F634    lea         eax,[ebp-20]
 0052F637    mov         edx,dword ptr ds:[42B130];tagEXCEPINFO
 0052F63D    call        @InitializeRecord
 0052F642    xor         eax,eax
 0052F644    push        ebp
 0052F645    push        52F94B
 0052F64A    push        dword ptr fs:[eax]
 0052F64D    mov         dword ptr fs:[eax],esp
 0052F650    xor         eax,eax
 0052F652    mov         dword ptr [ebp-30],eax
 0052F655    xor         ecx,ecx
 0052F657    push        ebp
 0052F658    push        52F928
 0052F65D    push        dword ptr fs:[ecx]
 0052F660    mov         dword ptr fs:[ecx],esp
 0052F663    movzx       edi,byte ptr [esi+1]
 0052F667    cmp         edi,40
>0052F66A    jle         0052F683
 0052F66C    mov         ecx,dword ptr ds:[78D0E4];^SResString578:TResStringRec
 0052F672    mov         dl,1
 0052F674    mov         eax,[0052E8E0];EOleException
 0052F679    call        Exception.CreateRes
 0052F67E    call        @RaiseExcept
 0052F683    test        edi,edi
>0052F685    je          0052F84C
 0052F68B    mov         eax,dword ptr [ebp+0C]
 0052F68E    mov         dword ptr [ebp-34],eax
 0052F691    mov         eax,edi
 0052F693    add         eax,eax
 0052F695    lea         eax,[ebp+eax*8-650]
 0052F69C    mov         dword ptr [ebp-38],eax
 0052F69F    xor         ebx,ebx
 0052F6A1    sub         dword ptr [ebp-38],10
 0052F6A5    movzx       eax,byte ptr [esi+ebx+3]
 0052F6AA    mov         edx,eax
 0052F6AC    and         dl,7F
 0052F6AF    movzx       edx,dl
 0052F6B2    mov         dword ptr [ebp-2C],edx
 0052F6B5    and         al,80
 0052F6B7    cmp         dword ptr [ebp-2C],0A
>0052F6BB    jne         0052F6D5
 0052F6BD    mov         eax,dword ptr [ebp-38]
 0052F6C0    mov         dword ptr [eax],0A
 0052F6C6    mov         eax,dword ptr [ebp-38]
 0052F6C9    mov         dword ptr [eax+8],80020004
>0052F6D0    jmp         0052F843
 0052F6D5    cmp         dword ptr [ebp-2C],48
>0052F6D9    jne         0052F74F
 0052F6DB    mov         edx,dword ptr [ebp-30]
 0052F6DE    lea         edx,[ebp+edx*8-250]
 0052F6E5    mov         dword ptr [ebp-3C],edx
 0052F6E8    test        al,al
>0052F6EA    je          0052F71C
 0052F6EC    mov         eax,dword ptr [ebp-34]
 0052F6EF    mov         eax,dword ptr [eax]
 0052F6F1    mov         eax,dword ptr [eax]
 0052F6F3    call        StringToOleStr
 0052F6F8    mov         edx,dword ptr [ebp-3C]
 0052F6FB    mov         dword ptr [edx],eax
 0052F6FD    mov         eax,dword ptr [ebp-34]
 0052F700    mov         eax,dword ptr [eax]
 0052F702    mov         edx,dword ptr [ebp-3C]
 0052F705    mov         dword ptr [edx+4],eax
 0052F708    mov         eax,dword ptr [ebp-38]
 0052F70B    mov         dword ptr [eax],4008
 0052F711    mov         eax,dword ptr [ebp-3C]
 0052F714    mov         edx,dword ptr [ebp-38]
 0052F717    mov         dword ptr [edx+8],eax
>0052F71A    jmp         0052F747
 0052F71C    mov         eax,dword ptr [ebp-34]
 0052F71F    mov         eax,dword ptr [eax]
 0052F721    call        StringToOleStr
 0052F726    mov         edx,dword ptr [ebp-3C]
 0052F729    mov         dword ptr [edx],eax
 0052F72B    mov         eax,dword ptr [ebp-3C]
 0052F72E    xor         edx,edx
 0052F730    mov         dword ptr [eax+4],edx
 0052F733    mov         eax,dword ptr [ebp-38]
 0052F736    mov         dword ptr [eax],8
 0052F73C    mov         eax,dword ptr [ebp-3C]
 0052F73F    mov         eax,dword ptr [eax]
 0052F741    mov         edx,dword ptr [ebp-38]
 0052F744    mov         dword ptr [edx+8],eax
 0052F747    inc         dword ptr [ebp-30]
>0052F74A    jmp         0052F83F
 0052F74F    test        al,al
>0052F751    je          0052F798
 0052F753    cmp         dword ptr [ebp-2C],0C
>0052F757    jne         0052F77B
 0052F759    mov         eax,dword ptr [ebp-34]
 0052F75C    mov         eax,dword ptr [eax]
 0052F75E    cmp         word ptr [eax],100
>0052F763    jne         0052F77B
 0052F765    mov         eax,dword ptr [ebp-34]
 0052F768    mov         eax,dword ptr [eax]
 0052F76A    mov         edx,eax
 0052F76C    mov         eax,dword ptr [ebp-34]
 0052F76F    mov         eax,dword ptr [eax]
 0052F771    mov         ecx,8
 0052F776    call        @VarCast
 0052F77B    mov         eax,dword ptr [ebp-2C]
 0052F77E    or          eax,4000
 0052F783    mov         edx,dword ptr [ebp-38]
 0052F786    mov         dword ptr [edx],eax
 0052F788    mov         eax,dword ptr [ebp-34]
 0052F78B    mov         eax,dword ptr [eax]
 0052F78D    mov         edx,dword ptr [ebp-38]
 0052F790    mov         dword ptr [edx+8],eax
>0052F793    jmp         0052F83F
 0052F798    cmp         dword ptr [ebp-2C],0C
>0052F79C    jne         0052F811
 0052F79E    mov         eax,dword ptr [ebp-34]
 0052F7A1    cmp         word ptr [eax],100
>0052F7A6    jne         0052F7E6
 0052F7A8    mov         eax,dword ptr [ebp-30]
 0052F7AB    lea         eax,[ebp+eax*8-250]
 0052F7B2    mov         dword ptr [ebp-40],eax
 0052F7B5    mov         eax,dword ptr [ebp-34]
 0052F7B8    mov         eax,dword ptr [eax+8]
 0052F7BB    call        StringToOleStr
 0052F7C0    mov         edx,dword ptr [ebp-40]
 0052F7C3    mov         dword ptr [edx],eax
 0052F7C5    mov         eax,dword ptr [ebp-40]
 0052F7C8    xor         edx,edx
 0052F7CA    mov         dword ptr [eax+4],edx
 0052F7CD    mov         eax,dword ptr [ebp-38]
 0052F7D0    mov         dword ptr [eax],8
 0052F7D6    mov         eax,dword ptr [ebp-40]
 0052F7D9    mov         eax,dword ptr [eax]
 0052F7DB    mov         edx,dword ptr [ebp-38]
 0052F7DE    mov         dword ptr [edx+8],eax
 0052F7E1    inc         dword ptr [ebp-30]
>0052F7E4    jmp         0052F83F
 0052F7E6    mov         eax,dword ptr [ebp-34]
 0052F7E9    mov         edx,dword ptr [eax]
 0052F7EB    mov         ecx,dword ptr [ebp-38]
 0052F7EE    mov         dword ptr [ecx],edx
 0052F7F0    mov         edx,dword ptr [eax+4]
 0052F7F3    mov         ecx,dword ptr [ebp-38]
 0052F7F6    mov         dword ptr [ecx+4],edx
 0052F7F9    mov         edx,dword ptr [eax+8]
 0052F7FC    mov         ecx,dword ptr [ebp-38]
 0052F7FF    mov         dword ptr [ecx+8],edx
 0052F802    mov         eax,dword ptr [eax+0C]
 0052F805    mov         edx,dword ptr [ebp-38]
 0052F808    mov         dword ptr [edx+0C],eax
 0052F80B    add         dword ptr [ebp-34],0C
>0052F80F    jmp         0052F83F
 0052F811    mov         eax,dword ptr [ebp-38]
 0052F814    mov         edx,dword ptr [ebp-2C]
 0052F817    mov         dword ptr [eax],edx
 0052F819    mov         eax,dword ptr [ebp-34]
 0052F81C    mov         eax,dword ptr [eax]
 0052F81E    mov         edx,dword ptr [ebp-38]
 0052F821    mov         dword ptr [edx+8],eax
 0052F824    cmp         dword ptr [ebp-2C],5
>0052F828    jl          0052F83F
 0052F82A    cmp         dword ptr [ebp-2C],7
>0052F82E    jg          0052F83F
 0052F830    add         dword ptr [ebp-34],4
 0052F834    mov         eax,dword ptr [ebp-34]
 0052F837    mov         eax,dword ptr [eax]
 0052F839    mov         edx,dword ptr [ebp-38]
 0052F83C    mov         dword ptr [edx+0C],eax
 0052F83F    add         dword ptr [ebp-34],4
 0052F843    inc         ebx
 0052F844    cmp         edi,ebx
>0052F846    jne         0052F6A1
 0052F84C    lea         eax,[ebp-650]
 0052F852    mov         dword ptr [ebp-50],eax
 0052F855    mov         eax,dword ptr [ebp-28]
 0052F858    add         eax,4
 0052F85B    mov         dword ptr [ebp-4C],eax
 0052F85E    mov         dword ptr [ebp-48],edi
 0052F861    movzx       eax,byte ptr [esi+2]
 0052F865    mov         dword ptr [ebp-44],eax
 0052F868    mov         eax,dword ptr [ebp-28]
 0052F86B    mov         edx,dword ptr [eax]
 0052F86D    movzx       eax,byte ptr [esi]
 0052F870    cmp         eax,4
>0052F873    jne         0052F89D
 0052F875    mov         ecx,dword ptr [ebp-650]
 0052F87B    and         ecx,0FFF
 0052F881    cmp         ecx,9
>0052F884    jne         0052F88B
 0052F886    mov         eax,8
 0052F88B    mov         ecx,dword ptr [ebp-28]
 0052F88E    mov         dword ptr [ecx],0FFFFFFFD
 0052F894    sub         dword ptr [ebp-4C],4
 0052F898    inc         dword ptr [ebp-44]
>0052F89B    jmp         0052F8B1
 0052F89D    cmp         eax,1
>0052F8A0    jne         0052F8B1
 0052F8A2    test        edi,edi
>0052F8A4    jne         0052F8B1
 0052F8A6    cmp         dword ptr [ebp+8],0
>0052F8AA    je          0052F8B1
 0052F8AC    mov         eax,3
 0052F8B1    push        0
 0052F8B3    lea         ecx,[ebp-20]
 0052F8B6    push        ecx
 0052F8B7    mov         ecx,dword ptr [ebp+8]
 0052F8BA    push        ecx
 0052F8BB    lea         ecx,[ebp-50]
 0052F8BE    push        ecx
 0052F8BF    push        eax
 0052F8C0    push        0
 0052F8C2    mov         eax,[0078D23C];^gvar_00784E50
 0052F8C7    push        eax
 0052F8C8    push        edx
 0052F8C9    mov         eax,dword ptr [ebp-24]
 0052F8CC    push        eax
 0052F8CD    mov         eax,dword ptr [eax]
 0052F8CF    call        dword ptr [eax+18]
 0052F8D2    test        eax,eax
>0052F8D4    je          0052F8DE
 0052F8D6    lea         edx,[ebp-20]
 0052F8D9    call        DispatchInvokeError
 0052F8DE    mov         ebx,dword ptr [ebp-30]
 0052F8E1    test        ebx,ebx
>0052F8E3    je          0052F901
 0052F8E5    dec         ebx
 0052F8E6    lea         esi,[ebp+ebx*8-250]
 0052F8ED    mov         edi,dword ptr [esi+4]
 0052F8F0    test        edi,edi
>0052F8F2    je          0052F8FD
 0052F8F4    mov         edx,edi
 0052F8F6    mov         eax,dword ptr [esi]
 0052F8F8    call        OleStrToStrVar
 0052F8FD    test        ebx,ebx
>0052F8FF    jne         0052F8E5
 0052F901    xor         eax,eax
 0052F903    pop         edx
 0052F904    pop         ecx
 0052F905    pop         ecx
 0052F906    mov         dword ptr fs:[eax],edx
 0052F909    push        52F92F
 0052F90E    mov         ebx,dword ptr [ebp-30]
 0052F911    test        ebx,ebx
>0052F913    je          0052F927
 0052F915    dec         ebx
 0052F916    mov         eax,dword ptr [ebp+ebx*8-250]
 0052F91D    push        eax
 0052F91E    call        oleaut32.SysFreeString
 0052F923    test        ebx,ebx
>0052F925    jne         0052F915
 0052F927    ret
>0052F928    jmp         @HandleFinally
>0052F92D    jmp         0052F90E
 0052F92F    xor         eax,eax
 0052F931    pop         edx
 0052F932    pop         ecx
 0052F933    pop         ecx
 0052F934    mov         dword ptr fs:[eax],edx
 0052F937    push        52F952
 0052F93C    lea         eax,[ebp-20]
 0052F93F    mov         edx,dword ptr ds:[42B130];tagEXCEPINFO
 0052F945    call        @FinalizeRecord
 0052F94A    ret
>0052F94B    jmp         @HandleFinally
>0052F950    jmp         0052F93C
 0052F952    pop         edi
 0052F953    pop         esi
 0052F954    pop         ebx
 0052F955    mov         esp,ebp
 0052F957    pop         ebp
 0052F958    ret         8
*}
end;

//0052F95C
procedure RaiseNameException;
begin
{*
 0052F95C    push        ebp
 0052F95D    mov         ebp,esp
 0052F95F    add         esp,0FFFFFFF8
 0052F962    mov         eax,dword ptr [ebp+8]
 0052F965    mov         eax,dword ptr [eax-18]
 0052F968    mov         dword ptr [ebp-8],eax
 0052F96B    mov         byte ptr [ebp-4],6
 0052F96F    lea         eax,[ebp-8]
 0052F972    push        eax
 0052F973    push        0
 0052F975    mov         ecx,dword ptr ds:[78D728];^SResString576:TResStringRec
 0052F97B    mov         dl,1
 0052F97D    mov         eax,[0052E700];EOleError
 0052F982    call        Exception.CreateResFmt
 0052F987    call        @RaiseExcept
 0052F98C    pop         ecx
 0052F98D    pop         ecx
 0052F98E    pop         ebp
 0052F98F    ret
*}
end;

//0052F990
procedure GetIDsOfNames(const Dispatch:IDispatch; Names:PAnsiChar; NameCount:Integer; DispIDs:PDispIDList);
begin
{*
 0052F990    push        ebp
 0052F991    mov         ebp,esp
 0052F993    add         esp,0FFFFFFE4
 0052F996    push        ebx
 0052F997    push        esi
 0052F998    push        edi
 0052F999    mov         dword ptr [ebp-8],ecx
 0052F99C    mov         dword ptr [ebp-18],edx
 0052F99F    mov         dword ptr [ebp-1C],eax
 0052F9A2    mov         ebx,dword ptr [ebp-18]
 0052F9A5    xor         edi,edi
 0052F9A7    mov         dword ptr [ebp-4],esp
 0052F9AA    mov         eax,dword ptr [ebp-8]
 0052F9AD    inc         eax
 0052F9AE    shl         eax,2
 0052F9B1    sub         esp,eax
 0052F9B3    lea         eax,[ebp-0C]
 0052F9B6    mov         dword ptr [eax],esp
 0052F9B8    mov         eax,ebx
 0052F9BA    call        StrLen
 0052F9BF    mov         esi,eax
 0052F9C1    push        0
 0052F9C3    push        0
 0052F9C5    push        esi
 0052F9C6    push        ebx
 0052F9C7    push        0
 0052F9C9    push        0FDE9
 0052F9CE    call        kernel32.MultiByteToWideChar
 0052F9D3    inc         eax
 0052F9D4    mov         dword ptr [ebp-10],eax
 0052F9D7    mov         eax,dword ptr [ebp-10]
 0052F9DA    add         eax,eax
 0052F9DC    add         eax,3
 0052F9DF    and         eax,0FFFFFFFC
 0052F9E2    sub         esp,eax
 0052F9E4    lea         eax,[ebp-14]
 0052F9E7    mov         dword ptr [eax],esp
 0052F9E9    test        edi,edi
>0052F9EB    jne         0052F9F7
 0052F9ED    mov         eax,dword ptr [ebp-0C]
 0052F9F0    mov         edx,dword ptr [ebp-14]
 0052F9F3    mov         dword ptr [eax],edx
>0052F9F5    jmp         0052FA05
 0052F9F7    mov         eax,dword ptr [ebp-8]
 0052F9FA    sub         eax,edi
 0052F9FC    mov         edx,dword ptr [ebp-0C]
 0052F9FF    mov         ecx,dword ptr [ebp-14]
 0052FA02    mov         dword ptr [edx+eax*4],ecx
 0052FA05    mov         eax,dword ptr [ebp-10]
 0052FA08    push        eax
 0052FA09    mov         eax,dword ptr [ebp-14]
 0052FA0C    push        eax
 0052FA0D    push        esi
 0052FA0E    push        ebx
 0052FA0F    push        0
 0052FA11    push        0FDE9
 0052FA16    call        kernel32.MultiByteToWideChar
 0052FA1B    mov         eax,dword ptr [ebp-14]
 0052FA1E    mov         edx,dword ptr [ebp-10]
 0052FA21    mov         word ptr [eax+edx*2-2],0
 0052FA28    inc         esi
 0052FA29    add         ebx,esi
 0052FA2B    inc         edi
 0052FA2C    cmp         edi,dword ptr [ebp-8]
>0052FA2F    jne         0052F9B8
 0052FA31    mov         eax,dword ptr [ebp+8]
 0052FA34    push        eax
 0052FA35    call        kernel32.GetThreadLocale
 0052FA3A    push        eax
 0052FA3B    mov         eax,dword ptr [ebp-8]
 0052FA3E    push        eax
 0052FA3F    mov         eax,dword ptr [ebp-0C]
 0052FA42    push        eax
 0052FA43    mov         eax,[0078D23C];^gvar_00784E50
 0052FA48    push        eax
 0052FA49    mov         eax,dword ptr [ebp-1C]
 0052FA4C    push        eax
 0052FA4D    mov         eax,dword ptr [eax]
 0052FA4F    call        dword ptr [eax+14]
 0052FA52    cmp         eax,80020006
>0052FA57    jne         0052FA62
 0052FA59    push        ebp
 0052FA5A    call        RaiseNameException
 0052FA5F    pop         ecx
>0052FA60    jmp         0052FA67
 0052FA62    call        OleCheck
 0052FA67    mov         esp,dword ptr [ebp-4]
 0052FA6A    pop         edi
 0052FA6B    pop         esi
 0052FA6C    pop         ebx
 0052FA6D    mov         esp,ebp
 0052FA6F    pop         ebp
 0052FA70    ret         4
*}
end;

//0052FA74
procedure RaiseException;
begin
{*
 0052FA74    mov         ecx,dword ptr ds:[78D904];^SResString577:TResStringRec
 0052FA7A    mov         dl,1
 0052FA7C    mov         eax,[0052E700];EOleError
 0052FA81    call        Exception.CreateRes
 0052FA86    call        @RaiseExcept
 0052FA8B    ret
*}
end;

//0052FA8C
procedure VarDispInvoke(Result:PVariant; const Instance:Variant; CallDesc:PCallDesc; Params:Pointer); cdecl;
begin
{*
 0052FA8C    push        ebp
 0052FA8D    mov         ebp,esp
 0052FA8F    add         esp,0FFFFFEFC
 0052FA95    push        ebx
 0052FA96    push        esi
 0052FA97    mov         ebx,dword ptr [ebp+10]
 0052FA9A    mov         eax,dword ptr [ebp+0C]
 0052FA9D    mov         esi,dword ptr [ebp+8]
 0052FAA0    cmp         byte ptr [ebx+1],40
>0052FAA4    jbe         0052FABD
 0052FAA6    mov         ecx,dword ptr ds:[78D0E4];^SResString578:TResStringRec
 0052FAAC    mov         dl,1
 0052FAAE    mov         eax,[0052E700];EOleError
 0052FAB3    call        Exception.CreateRes
 0052FAB8    call        @RaiseExcept
 0052FABD    movzx       edx,word ptr [eax]
 0052FAC0    cmp         dx,9
>0052FAC4    jne         0052FACE
 0052FAC6    mov         eax,dword ptr [eax+8]
 0052FAC9    mov         dword ptr [ebp-4],eax
>0052FACC    jmp         0052FAE4
 0052FACE    cmp         dx,4009
>0052FAD3    jne         0052FADF
 0052FAD5    mov         eax,dword ptr [eax+8]
 0052FAD8    mov         eax,dword ptr [eax]
 0052FADA    mov         dword ptr [ebp-4],eax
>0052FADD    jmp         0052FAE4
 0052FADF    call        RaiseException
 0052FAE4    lea         eax,[ebp-104]
 0052FAEA    push        eax
 0052FAEB    movzx       ecx,byte ptr [ebx+2]
 0052FAEF    inc         ecx
 0052FAF0    movzx       eax,byte ptr [ebx+1]
 0052FAF4    lea         edx,[ebx+eax+3]
 0052FAF8    mov         eax,dword ptr [ebp-4]
 0052FAFB    call        GetIDsOfNames
 0052FB00    test        esi,esi
>0052FB02    je          0052FB0B
 0052FB04    mov         eax,esi
 0052FB06    call        @VarClear
 0052FB0B    mov         eax,dword ptr [ebp+14]
 0052FB0E    push        eax
 0052FB0F    push        esi
 0052FB10    lea         ecx,[ebp-104]
 0052FB16    mov         edx,ebx
 0052FB18    mov         eax,dword ptr [ebp-4]
 0052FB1B    call        DispatchInvoke
 0052FB20    pop         esi
 0052FB21    pop         ebx
 0052FB22    mov         esp,ebp
 0052FB24    pop         ebp
 0052FB25    ret
*}
end;

//0052FB28
procedure DispCallError(Status:Integer; var ExcepInfo:TExcepInfo; ErrorAddr:Pointer; FinalizeExcepInfo:Boolean);
begin
{*
 0052FB28    push        ebp
 0052FB29    mov         ebp,esp
 0052FB2B    push        0
 0052FB2D    push        0
 0052FB2F    push        0
 0052FB31    push        0
 0052FB33    push        ebx
 0052FB34    push        esi
 0052FB35    mov         dword ptr [ebp-4],ecx
 0052FB38    mov         ebx,edx
 0052FB3A    xor         edx,edx
 0052FB3C    push        ebp
 0052FB3D    push        52FBED
 0052FB42    push        dword ptr fs:[edx]
 0052FB45    mov         dword ptr fs:[edx],esp
 0052FB48    cmp         eax,80020009
>0052FB4D    jne         0052FBA6
 0052FB4F    mov         eax,dword ptr [ebx+1C]
 0052FB52    push        eax
 0052FB53    lea         eax,[ebp-8]
 0052FB56    mov         edx,dword ptr [ebx+4]
 0052FB59    call        @UStrFromWStr
 0052FB5E    mov         eax,dword ptr [ebp-8]
 0052FB61    push        eax
 0052FB62    lea         eax,[ebp-0C]
 0052FB65    mov         edx,dword ptr [ebx+0C]
 0052FB68    call        @UStrFromWStr
 0052FB6D    mov         eax,dword ptr [ebp-0C]
 0052FB70    push        eax
 0052FB71    mov         eax,dword ptr [ebx+10]
 0052FB74    push        eax
 0052FB75    lea         eax,[ebp-10]
 0052FB78    mov         edx,dword ptr [ebx+8]
 0052FB7B    call        @UStrFromWStr
 0052FB80    mov         ecx,dword ptr [ebp-10]
 0052FB83    mov         dl,1
 0052FB85    mov         eax,[0052E8E0];EOleException
 0052FB8A    call        EOleException.Create
 0052FB8F    mov         esi,eax
 0052FB91    cmp         byte ptr [ebp+8],0
>0052FB95    je          0052FBB9
 0052FB97    mov         eax,ebx
 0052FB99    mov         edx,dword ptr ds:[42B130];tagEXCEPINFO
 0052FB9F    call        @Finalize
>0052FBA4    jmp         0052FBB9
 0052FBA6    push        eax
 0052FBA7    push        0
 0052FBA9    xor         ecx,ecx
 0052FBAB    mov         dl,1
 0052FBAD    mov         eax,[0052E794];EOleSysError
 0052FBB2    call        EOleSysError.Create
 0052FBB7    mov         esi,eax
 0052FBB9    cmp         dword ptr [ebp-4],0
>0052FBBD    je          0052FBCB
 0052FBBF    push        dword ptr [ebp-4]
 0052FBC2    mov         eax,esi
>0052FBC4    jmp         @RaiseExcept
>0052FBC9    jmp         0052FBD2
 0052FBCB    mov         eax,esi
 0052FBCD    call        @RaiseExcept
 0052FBD2    xor         eax,eax
 0052FBD4    pop         edx
 0052FBD5    pop         ecx
 0052FBD6    pop         ecx
 0052FBD7    mov         dword ptr fs:[eax],edx
 0052FBDA    push        52FBF4
 0052FBDF    lea         eax,[ebp-10]
 0052FBE2    mov         edx,3
 0052FBE7    call        @UStrArrayClr
 0052FBEC    ret
>0052FBED    jmp         @HandleFinally
>0052FBF2    jmp         0052FBDF
 0052FBF4    pop         esi
 0052FBF5    pop         ebx
 0052FBF6    mov         esp,ebp
 0052FBF8    pop         ebp
 0052FBF9    ret         4
*}
end;

//0052FBFC
procedure DispatchInvokeError(Status:Integer; const ExcepInfo:TExcepInfo);
begin
{*
 0052FBFC    push        0
 0052FBFE    xor         ecx,ecx
 0052FC00    call        DispCallError
 0052FC05    ret
*}
end;

//0052FC08
procedure ClearExcepInfo(var ExcepInfo:TExcepInfo);
begin
{*
 0052FC08    xor         ecx,ecx
 0052FC0A    mov         edx,20
 0052FC0F    call        @FillChar
 0052FC14    ret
*}
end;

//0052FC18
procedure DispCall(const Dispatch:IDispatch; CallDesc:PCallDesc; DispID:Integer; NamedArgDispIDs:Pointer; Params:Pointer; Result:Pointer); stdcall;
begin
{*
 0052FC18    push        ebp
 0052FC19    mov         ebp,esp
 0052FC1B    add         esp,0FFFFFFD0
 0052FC1E    push        ebx
 0052FC1F    push        esi
 0052FC20    push        edi
 0052FC21    mov         ebx,dword ptr [ebp+0C]
 0052FC24    xor         edx,edx
 0052FC26    mov         edi,esp
 0052FC28    movzx       ecx,byte ptr [ebx+1]
 0052FC2C    mov         dword ptr [ebp-8],ecx
 0052FC2F    test        ecx,ecx
>0052FC31    je          0052FC7E
 0052FC33    add         ebx,3
 0052FC36    mov         esi,dword ptr [ebp+18]
 0052FC39    movzx       eax,byte ptr [ebx]
 0052FC3C    test        al,80
>0052FC3E    jne         0052FC68
 0052FC40    cmp         al,0C
>0052FC42    je          0052FC58
 0052FC44    cmp         al,5
>0052FC46    jb          0052FC6F
 0052FC48    cmp         al,7
>0052FC4A    ja          0052FC6F
 0052FC4C    push        dword ptr [esi+4]
 0052FC4F    push        dword ptr [esi]
 0052FC51    push        edx
 0052FC52    push        eax
 0052FC53    add         esi,8
>0052FC56    jmp         0052FC77
 0052FC58    push        dword ptr [esi+0C]
 0052FC5B    push        dword ptr [esi+8]
 0052FC5E    push        dword ptr [esi+4]
 0052FC61    push        dword ptr [esi]
 0052FC63    add         esi,10
>0052FC66    jmp         0052FC77
 0052FC68    and         al,7F
 0052FC6A    or          eax,4000
 0052FC6F    push        edx
 0052FC70    push        dword ptr [esi]
 0052FC72    push        edx
 0052FC73    push        eax
 0052FC74    add         esi,4
 0052FC77    inc         ebx
 0052FC78    dec         ecx
>0052FC79    jne         0052FC39
 0052FC7B    mov         ebx,dword ptr [ebp+0C]
 0052FC7E    mov         dword ptr [ebp-10],esp
 0052FC81    movzx       eax,byte ptr [ebx+2]
 0052FC85    mov         dword ptr [ebp-4],eax
 0052FC88    test        eax,eax
>0052FC8A    je          0052FC96
 0052FC8C    mov         esi,dword ptr [ebp+14]
 0052FC8F    push        dword ptr [esi+eax*4-4]
 0052FC93    dec         eax
>0052FC94    jne         0052FC8F
 0052FC96    movzx       ecx,byte ptr [ebx]
 0052FC99    cmp         ecx,4
>0052FC9C    jne         0052FCB4
 0052FC9E    push        0FD
 0052FCA0    inc         dword ptr [ebp-4]
 0052FCA3    cmp         byte ptr [ebx+3],9
>0052FCA7    je          0052FCAF
 0052FCA9    cmp         byte ptr [ebx+3],0D
>0052FCAD    jne         0052FCB4
 0052FCAF    mov         ecx,8
 0052FCB4    mov         dword ptr [ebp-0C],esp
 0052FCB7    push        edx
 0052FCB8    lea         eax,[ebp-30]
 0052FCBB    push        eax
 0052FCBC    push        ecx
 0052FCBD    push        edx
 0052FCBE    call        ClearExcepInfo
 0052FCC3    pop         edx
 0052FCC4    pop         ecx
 0052FCC5    push        dword ptr [ebp+1C]
 0052FCC8    lea         eax,[ebp-10]
 0052FCCB    push        eax
 0052FCCC    push        ecx
 0052FCCD    push        edx
 0052FCCE    push        784E50;gvar_00784E50
 0052FCD3    push        dword ptr [ebp+10]
 0052FCD6    mov         eax,dword ptr [ebp+8]
 0052FCD9    push        eax
 0052FCDA    mov         eax,dword ptr [eax]
 0052FCDC    call        dword ptr [eax+18]
 0052FCDF    test        eax,eax
>0052FCE1    je          0052FCF1
 0052FCE3    lea         edx,[ebp-30]
 0052FCE6    mov         cl,1
 0052FCE8    push        ecx
 0052FCE9    mov         ecx,dword ptr [ebp+4]
>0052FCEC    jmp         DispCallError
 0052FCF1    mov         esp,edi
 0052FCF3    pop         edi
 0052FCF4    pop         esi
 0052FCF5    pop         ebx
 0052FCF6    mov         esp,ebp
 0052FCF8    pop         ebp
 0052FCF9    ret         18
*}
end;

//0052FCFC
procedure DispCallByID(Result:Pointer; const Dispatch:IDispatch; DispDesc:PDispDesc; Params:Pointer); cdecl;
begin
{*
 0052FCFC    push        ebp
 0052FCFD    mov         ebp,esp
 0052FCFF    push        ebx
 0052FD00    mov         ebx,dword ptr [ebp+10]
 0052FD03    xor         eax,eax
 0052FD05    push        eax
 0052FD06    push        eax
 0052FD07    push        eax
 0052FD08    push        eax
 0052FD09    mov         eax,esp
 0052FD0B    push        eax
 0052FD0C    lea         eax,[ebp+14]
 0052FD0F    push        eax
 0052FD10    push        eax
 0052FD11    push        dword ptr [ebx]
 0052FD13    lea         eax,[ebx+5]
 0052FD16    push        eax
 0052FD17    push        dword ptr [ebp+0C]
 0052FD1A    call        DispCall
 0052FD1F    movzx       eax,byte ptr [ebx+4]
 0052FD23    mov         ebx,dword ptr [ebp+8]
 0052FD26    jmp         dword ptr [eax*4+52FD2D]
 0052FD26    dd          0052FDD2
 0052FD26    dd          0052FDD2
 0052FD26    dd          0052FDCE
 0052FD26    dd          0052FDCE
 0052FD26    dd          0052FD71
 0052FD26    dd          0052FD77
 0052FD26    dd          0052FD7D
 0052FD26    dd          0052FD77
 0052FD26    dd          0052FD83
 0052FD26    dd          0052FD97
 0052FD26    dd          0052FDD2
 0052FD26    dd          0052FDCE
 0052FD26    dd          0052FDAB
 0052FD26    dd          0052FD97
 0052FD26    dd          0052FDD2
 0052FD26    dd          0052FDD2
 0052FD26    dd          0052FDCE
 0052FD71    fld         dword ptr [esp+8]
>0052FD75    jmp         0052FDD2
 0052FD77    fld         qword ptr [esp+8]
>0052FD7B    jmp         0052FDD2
 0052FD7D    fild        qword ptr [esp+8]
>0052FD81    jmp         0052FDD2
 0052FD83    mov         eax,dword ptr [ebx]
 0052FD85    test        eax,eax
>0052FD87    je          0052FD8F
 0052FD89    push        eax
 0052FD8A    call        oleaut32.SysFreeString
 0052FD8F    mov         eax,dword ptr [esp+8]
 0052FD93    mov         dword ptr [ebx],eax
>0052FD95    jmp         0052FDD2
 0052FD97    mov         eax,dword ptr [ebx]
 0052FD99    test        eax,eax
>0052FD9B    je          0052FDA3
 0052FD9D    push        eax
 0052FD9E    mov         eax,dword ptr [eax]
 0052FDA0    call        dword ptr [eax+8]
 0052FDA3    mov         eax,dword ptr [esp+8]
 0052FDA7    mov         dword ptr [ebx],eax
>0052FDA9    jmp         0052FDD2
 0052FDAB    mov         eax,ebx
 0052FDAD    call        @VarClear
 0052FDB2    mov         eax,dword ptr [esp]
 0052FDB5    mov         dword ptr [ebx],eax
 0052FDB7    mov         eax,dword ptr [esp+4]
 0052FDBB    mov         dword ptr [ebx+4],eax
 0052FDBE    mov         eax,dword ptr [esp+8]
 0052FDC2    mov         dword ptr [ebx+8],eax
 0052FDC5    mov         eax,dword ptr [esp+0C]
 0052FDC9    mov         dword ptr [ebx+0C],eax
>0052FDCC    jmp         0052FDD2
 0052FDCE    mov         eax,dword ptr [esp+8]
 0052FDD2    add         esp,10
 0052FDD5    pop         ebx
 0052FDD6    pop         ebp
 0052FDD7    ret
*}
end;

//0052FDD8
procedure InitComObj;
begin
{*
 0052FDD8    cmp         dword ptr ds:[793B48],0
>0052FDDF    je          0052FDE7
 0052FDE1    call        dword ptr ds:[793B48]
 0052FDE7    cmp         dword ptr ds:[7870D4],0FFFFFFFF
>0052FDEE    je          0052FE3F
 0052FDF0    cmp         dword ptr ds:[7870C0],0
>0052FDF7    je          0052FE3F
 0052FDF9    mov         eax,[007870D4]
 0052FDFE    push        eax
 0052FDFF    push        0
 0052FE01    call        dword ptr ds:[7870C0]
 0052FE07    test        eax,80000000
 0052FE0C    sete        al
 0052FE0F    mov         [00793B4C],al
 0052FE14    mov         eax,[0078CEEC];IsMultiThread:Boolean
 0052FE19    cmp         byte ptr [eax],0
>0052FE1C    jne         0052FE34
 0052FE1E    test        byte ptr ds:[7870D4],2
>0052FE25    jne         0052FE34
 0052FE27    cmp         dword ptr ds:[7870D4],0
>0052FE2E    je          0052FE34
 0052FE30    xor         eax,eax
>0052FE32    jmp         0052FE36
 0052FE34    mov         al,1
 0052FE36    mov         edx,dword ptr ds:[78CEEC];IsMultiThread:Boolean
 0052FE3C    mov         byte ptr [edx],al
 0052FE3E    ret
 0052FE3F    push        0
 0052FE41    call        ole32.CoInitialize
 0052FE46    test        eax,80000000
 0052FE4B    sete        al
 0052FE4E    mov         [00793B4C],al
 0052FE53    ret
*}
end;

Initialization
//00780E78
{*
 00780E78    sub         dword ptr ds:[793B3C],1
>00780E7F    jae         00780ECC
 00780E81    call        LoadComExProcs
 00780E86    mov         eax,52FA8C;VarDispInvoke
 00780E8B    mov         edx,dword ptr ds:[78D650];VarDispProc:TVarDispProc
 00780E91    mov         dword ptr [edx],eax
 00780E93    mov         eax,[0078CD28];DispCallByIDProc:Pointer
 00780E98    mov         dword ptr [eax],52FCFC;DispCallByID
 00780E9E    mov         eax,52F610;SafeCallError
 00780EA3    mov         edx,dword ptr ds:[78D76C];SafeCallErrorProc:TSafeCallErrorProc
 00780EA9    mov         dword ptr [edx],eax
 00780EAB    mov         eax,[0078CB94];^IsLibrary:Boolean
 00780EB0    cmp         byte ptr [eax],0
>00780EB3    jne         00780ECC
 00780EB5    mov         eax,[0078D308];InitProc:Pointer
 00780EBA    mov         eax,dword ptr [eax]
 00780EBC    mov         [00793B48],eax
 00780EC1    mov         eax,[0078D308];InitProc:Pointer
 00780EC6    mov         dword ptr [eax],52FDD8;InitComObj
 00780ECC    ret
*}
Finalization
//0052FE54
{*
 0052FE54    push        ebp
 0052FE55    mov         ebp,esp
 0052FE57    xor         eax,eax
 0052FE59    push        ebp
 0052FE5A    push        52FECA
 0052FE5F    push        dword ptr fs:[eax]
 0052FE62    mov         dword ptr fs:[eax],esp
 0052FE65    inc         dword ptr ds:[793B3C]
>0052FE6B    jne         0052FEBC
 0052FE6D    mov         byte ptr ds:[793B40],1
 0052FE74    mov         eax,[00793B44]
 0052FE79    call        TObject.Free
 0052FE7E    mov         eax,[0078D76C];SafeCallErrorProc:TSafeCallErrorProc
 0052FE83    xor         edx,edx
 0052FE85    mov         dword ptr [eax],edx
 0052FE87    mov         eax,[0078CD28];DispCallByIDProc:Pointer
 0052FE8C    xor         edx,edx
 0052FE8E    mov         dword ptr [eax],edx
 0052FE90    mov         eax,[0078D650];VarDispProc:TVarDispProc
 0052FE95    xor         edx,edx
 0052FE97    mov         dword ptr [eax],edx
 0052FE99    cmp         byte ptr ds:[793B4C],0
>0052FEA0    je          0052FEA7
 0052FEA2    call        ole32.CoUninitialize
 0052FEA7    mov         eax,7870D8
 0052FEAC    mov         ecx,5
 0052FEB1    mov         edx,dword ptr ds:[40128C];string
 0052FEB7    call        @FinalizeArray
 0052FEBC    xor         eax,eax
 0052FEBE    pop         edx
 0052FEBF    pop         ecx
 0052FEC0    pop         ecx
 0052FEC1    mov         dword ptr fs:[eax],edx
 0052FEC4    push        52FED1
 0052FEC9    ret
>0052FECA    jmp         @HandleFinally
>0052FECF    jmp         0052FEC9
 0052FED1    pop         ebp
 0052FED2    ret
*}
end.