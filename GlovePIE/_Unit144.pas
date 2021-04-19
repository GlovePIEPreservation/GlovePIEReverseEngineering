//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit144;

interface

uses
  SysUtils, Classes;

type
  TDLLFunction = class(TProcedureExpression)
  published
    procedure FillClone(c:TExpression);//00701798
    function Execute(Background:Boolean):Boolean;//00700E54
    //procedure GetString(?:?);//007017D4
    procedure CreateClone;//00700E44
    function GetDataType:TDataType;//007017D0
    //procedure ToString(?:?);//00701814
    procedure GetValue;//007017F4
  public
    DLLName:string;//f20
    FunctionName:string;//f24
    ModuleHandle:Cardinal;//f28
    FunctionPointer:Pointer;//f2C
    ReturnResult:Integer;//f30
    Failed:Boolean;//f34
    //procedure ToString(?:?); virtual;//00701814
    procedure GetValue; virtual;//v2C//007017F4
    //procedure GetString(?:?); virtual;//v38//007017D4
    function GetDataType:TDataType; virtual;//v44//007017D0
    procedure CreateClone; virtual;//v80//00700E44
    procedure FillClone(c:TExpression); virtual;//v84//00701798
    function Execute(Background:Boolean):Boolean; virtual;//v98//00700E54
  end;
  CoDevice = class(TObject)
  published
    //procedure CreateRemote(MachineName:string; ?:?);//00701BF0
    //procedure Create(?:?);//00701B8C
  end;
  TSpaceBallValue = class(TObjectValue)
  published
    function GetPerUnits1:TUnits;//00702794
    function GetUnits:TUnits;//00702A70
    //procedure GetString(?:?);//00702A48
    function GetPerUnits2:TUnits;//007027A4
    function Module:TObject;//00703958
    procedure GetRotMat(m:TRotMat);//007027B4
    procedure GetVector(x:Double; y:Double; z:Double);//00703688
    procedure SetValue(NewValue:Double);//00703960
    function CanSet:Boolean;//007026FC
    function GetDataType:TDataType;//00702730
    //procedure ToString(?:?);//00703984
    procedure FillClone(c:TExpression);//00702710
    procedure CreateClone;//00702700
    procedure GetValue;//00702A80
  public
    ........................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//00703984
    procedure GetValue; virtual;//v2C//00702A80
    //procedure GetString(?:?); virtual;//v38//00702A48
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//00703688
    procedure GetRotMat(m:TRotMat); virtual;//v40//007027B4
    function GetDataType:TDataType; virtual;//v44//00702730
    function GetUnits:TUnits; virtual;//v48//00702A70
    function GetPerUnits1:TUnits; virtual;//v4C//00702794
    function GetPerUnits2:TUnits; virtual;//v50//007027A4
    procedure SetValue(NewValue:Double); virtual;//v58//00703960
    function CanSet:Boolean; virtual;//v68//007026FC
    procedure CreateClone; virtual;//v80//00702700
    procedure FillClone(c:TExpression); virtual;//v84//00702710
    function Module:TObject; virtual;//v98//00703958
  end;
  TModuleSpaceball = class(TPieModule)
  published
    procedure MonitorFrame;//007040D8
    procedure PrepareForMonitoring;//007041DC
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//007040BC
    function GetDefaultFormat(field:string):TGuiFormat;//00703F68
    procedure PrepareForGUI;//007041D8
    procedure StartGUI;//007041F0
    procedure StopGUI;//00704254
    procedure StartMonitoring;//00704218
    procedure StopMonitoring;//0070425C
    function GetGoodFields:TStringList;//00703FCC
    procedure StartCompiletime;//007041E4
    procedure StopCompiletime;//00704240
    procedure StartRuntime;//00704234
    procedure StopRuntime;//00704264
    constructor Create;//00703EB0
    procedure ClearRead;//00703EA8
    function Read:Boolean;//007041E0
    procedure AddFields;//00703BAC
    function CreateValue(Identifier:string):TExpression;//00703F14
  public
    function CreateValue(Identifier:string):TExpression; virtual;//v14//00703F14
    function GetGoodFields:TStringList; virtual;//v1C//00703FCC
    procedure AddFields; virtual;//v24//00703BAC
    procedure StartCompiletime; virtual;//v28//007041E4
    procedure StopCompiletime; virtual;//v2C//00704240
    procedure StartRuntime; virtual;//v30//00704234
    procedure StopRuntime; virtual;//v34//00704264
    procedure ClearRead; virtual;//v38//00703EA8
    function Read:Boolean; virtual;//v3C//007041E0
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//007040BC
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//00703F68
    procedure PrepareForGUI; virtual;//v50//007041D8
    procedure StartGUI; virtual;//v54//007041F0
    procedure StopGUI; virtual;//v58//00704254
    procedure PrepareForMonitoring; virtual;//v5C//007041DC
    procedure StartMonitoring; virtual;//v60//00704218
    procedure StopMonitoring; virtual;//v64//0070425C
    procedure MonitorFrame; virtual;//v68//007040D8
  end;
    //function sub_00700CC4(?:UnicodeString):?;//00700CC4
    //function sub_00701924(?:UnicodeString):?;//00701924
    //function sub_00702604(?:string):?;//00702604
    procedure sub_00703A08;//00703A08
    procedure sub_00703A10;//00703A10
    procedure sub_00703A14;//00703A14
    procedure sub_00703B78;//00703B78

implementation

//00700CC4
{*function sub_00700CC4(?:UnicodeString):?;
begin
 00700CC4    push        ebp
 00700CC5    mov         ebp,esp
 00700CC7    xor         ecx,ecx
 00700CC9    push        ecx
 00700CCA    push        ecx
 00700CCB    push        ecx
 00700CCC    push        ecx
 00700CCD    push        ecx
 00700CCE    push        ebx
 00700CCF    push        esi
 00700CD0    mov         dword ptr [ebp-4],eax
 00700CD3    mov         eax,dword ptr [ebp-4]
 00700CD6    call        @UStrAddRef
 00700CDB    xor         eax,eax
 00700CDD    push        ebp
 00700CDE    push        700DF4
 00700CE3    push        dword ptr fs:[eax]
 00700CE6    mov         dword ptr fs:[eax],esp
 00700CE9    xor         ebx,ebx
 00700CEB    lea         eax,[ebp-8]
 00700CEE    mov         edx,dword ptr [ebp-4]
 00700CF1    call        @UStrLAsg
 00700CF6    mov         eax,dword ptr [ebp-4]
 00700CF9    call        00701924
 00700CFE    test        al,al
>00700D00    je          00700DD9
 00700D06    lea         eax,[ebp-8]
 00700D09    mov         edx,700E10;'DLL.'
 00700D0E    call        004F9BD0
 00700D13    test        al,al
>00700D15    je          00700D5E
 00700D17    mov         edx,dword ptr [ebp-8]
 00700D1A    mov         eax,700E28;'.'
 00700D1F    call        Pos
 00700D24    mov         esi,eax
 00700D26    test        esi,esi
>00700D28    jle         00700DD9
 00700D2E    lea         eax,[ebp-0C]
 00700D31    push        eax
 00700D32    mov         ecx,esi
 00700D34    dec         ecx
 00700D35    mov         edx,1
 00700D3A    mov         eax,dword ptr [ebp-8]
 00700D3D    call        @UStrCopy
 00700D42    lea         eax,[ebp-8]
 00700D45    mov         ecx,esi
 00700D47    mov         edx,1
 00700D4C    call        @UStrDelete
 00700D51    lea         eax,[ebp-10]
 00700D54    mov         edx,dword ptr [ebp-8]
 00700D57    call        @UStrLAsg
>00700D5C    jmp         00700DAB
 00700D5E    lea         edx,[ebp-14]
 00700D61    mov         eax,dword ptr [ebp-8]
 00700D64    call        LowerCase
 00700D69    mov         edx,dword ptr [ebp-14]
 00700D6C    mov         eax,700E38;'.dll.'
 00700D71    call        Pos
 00700D76    mov         esi,eax
 00700D78    test        esi,esi
>00700D7A    jle         00700DD9
 00700D7C    lea         eax,[ebp-0C]
 00700D7F    push        eax
 00700D80    mov         ecx,esi
 00700D82    dec         ecx
 00700D83    mov         edx,1
 00700D88    mov         eax,dword ptr [ebp-8]
 00700D8B    call        @UStrCopy
 00700D90    lea         ecx,[esi+4]
 00700D93    lea         eax,[ebp-8]
 00700D96    mov         edx,1
 00700D9B    call        @UStrDelete
 00700DA0    lea         eax,[ebp-10]
 00700DA3    mov         edx,dword ptr [ebp-8]
 00700DA6    call        @UStrLAsg
 00700DAB    mov         dl,1
 00700DAD    mov         eax,[0070095C];TDLLFunction
 00700DB2    call        TMathsFunction.Create;TDLLFunction.Create
 00700DB7    mov         ebx,eax
 00700DB9    lea         eax,[ebx+20];TDLLFunction.DLLName:string
 00700DBC    mov         edx,dword ptr [ebp-0C]
 00700DBF    call        @UStrAsg
 00700DC4    lea         eax,[ebx+24];TDLLFunction.FunctionName:string
 00700DC7    mov         edx,dword ptr [ebp-10]
 00700DCA    call        @UStrAsg
 00700DCF    xor         eax,eax
 00700DD1    mov         dword ptr [ebx+28],eax;TDLLFunction.ModuleHandle:Cardinal
 00700DD4    xor         eax,eax
 00700DD6    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 00700DD9    xor         eax,eax
 00700DDB    pop         edx
 00700DDC    pop         ecx
 00700DDD    pop         ecx
 00700DDE    mov         dword ptr fs:[eax],edx
 00700DE1    push        700DFB
 00700DE6    lea         eax,[ebp-14]
 00700DE9    mov         edx,5
 00700DEE    call        @UStrArrayClr
 00700DF3    ret
>00700DF4    jmp         @HandleFinally
>00700DF9    jmp         00700DE6
 00700DFB    mov         eax,ebx
 00700DFD    pop         esi
 00700DFE    pop         ebx
 00700DFF    mov         esp,ebp
 00700E01    pop         ebp
 00700E02    ret
end;*}

//00700E44
procedure TDLLFunction.CreateClone;
begin
{*
 00700E44    mov         dl,1
 00700E46    mov         eax,[0070095C];TDLLFunction
 00700E4B    call        TMathsFunction.Create;TDLLFunction.Create
 00700E50    ret
*}
end;

//00700E54
function TDLLFunction.Execute(Background:Boolean):Boolean;
begin
{*
 00700E54    push        ebp
 00700E55    mov         ebp,esp
 00700E57    mov         ecx,1E
 00700E5C    push        0
 00700E5E    push        0
 00700E60    dec         ecx
>00700E61    jne         00700E5C
 00700E63    push        ebx
 00700E64    push        esi
 00700E65    push        edi
 00700E66    mov         ebx,eax
 00700E68    xor         eax,eax
 00700E6A    push        ebp
 00700E6B    push        701754
 00700E70    push        dword ptr fs:[eax]
 00700E73    mov         dword ptr fs:[eax],esp
 00700E76    mov         byte ptr [ebp-35],0
 00700E7A    mov         dword ptr [ebx+30],2B;TDLLFunction.ReturnResult:Integer
 00700E81    cmp         byte ptr [ebx+34],0;TDLLFunction.Failed:Boolean
>00700E85    jne         00701729
 00700E8B    cmp         dword ptr [ebx+28],0;TDLLFunction.ModuleHandle:Cardinal
>00700E8F    jne         007014E8
 00700E95    mov         eax,dword ptr [ebx+20];TDLLFunction.DLLName:string
 00700E98    call        @UStrToPWChar
 00700E9D    push        eax
 00700E9E    call        kernel32.LoadLibraryW
 00700EA3    mov         esi,eax
 00700EA5    mov         dword ptr [ebx+28],esi;TDLLFunction.ModuleHandle:Cardinal
 00700EA8    test        esi,esi
>00700EAA    jne         00700EB5
 00700EAC    mov         byte ptr [ebx+34],1;TDLLFunction.Failed:Boolean
>00700EB0    jmp         00701729
 00700EB5    lea         eax,[ebp-14]
 00700EB8    mov         edx,dword ptr [ebx+24];TDLLFunction.FunctionName:string
 00700EBB    call        @UStrLAsg
 00700EC0    mov         eax,dword ptr [ebp-14]
 00700EC3    call        @UStrToPWChar
 00700EC8    push        eax
 00700EC9    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 00700ECC    push        eax
 00700ECD    call        GetProcAddress
 00700ED2    mov         esi,eax
 00700ED4    mov         dword ptr [ebx+2C],esi;TDLLFunction.FunctionPointer:Pointer
 00700ED7    test        esi,esi
>00700ED9    jne         00700EFB
 00700EDB    lea         edx,[ebp-44]
 00700EDE    mov         eax,dword ptr [ebp-14]
 00700EE1    call        LowerCase
 00700EE6    mov         eax,dword ptr [ebp-44]
 00700EE9    call        @UStrToPWChar
 00700EEE    push        eax
 00700EEF    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 00700EF2    push        eax
 00700EF3    call        GetProcAddress
 00700EF8    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 00700EFB    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>00700EFF    jne         00700F21
 00700F01    lea         edx,[ebp-48]
 00700F04    mov         eax,dword ptr [ebp-14]
 00700F07    call        UpperCase
 00700F0C    mov         eax,dword ptr [ebp-48]
 00700F0F    call        @UStrToPWChar
 00700F14    push        eax
 00700F15    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 00700F18    push        eax
 00700F19    call        GetProcAddress
 00700F1E    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 00700F21    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>00700F25    jne         00700F4C
 00700F27    lea         eax,[ebp-4C]
 00700F2A    mov         ecx,701774;'A'
 00700F2F    mov         edx,dword ptr [ebp-14]
 00700F32    call        @UStrCat3
 00700F37    mov         eax,dword ptr [ebp-4C]
 00700F3A    call        @UStrToPWChar
 00700F3F    push        eax
 00700F40    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 00700F43    push        eax
 00700F44    call        GetProcAddress
 00700F49    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 00700F4C    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>00700F50    jne         00700F82
 00700F52    lea         eax,[ebp-54]
 00700F55    mov         ecx,701774;'A'
 00700F5A    mov         edx,dword ptr [ebp-14]
 00700F5D    call        @UStrCat3
 00700F62    mov         eax,dword ptr [ebp-54]
 00700F65    lea         edx,[ebp-50]
 00700F68    call        LowerCase
 00700F6D    mov         eax,dword ptr [ebp-50]
 00700F70    call        @UStrToPWChar
 00700F75    push        eax
 00700F76    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 00700F79    push        eax
 00700F7A    call        GetProcAddress
 00700F7F    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 00700F82    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>00700F86    jne         00700FB8
 00700F88    lea         eax,[ebp-5C]
 00700F8B    mov         ecx,701774;'A'
 00700F90    mov         edx,dword ptr [ebp-14]
 00700F93    call        @UStrCat3
 00700F98    mov         eax,dword ptr [ebp-5C]
 00700F9B    lea         edx,[ebp-58]
 00700F9E    call        UpperCase
 00700FA3    mov         eax,dword ptr [ebp-58]
 00700FA6    call        @UStrToPWChar
 00700FAB    push        eax
 00700FAC    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 00700FAF    push        eax
 00700FB0    call        GetProcAddress
 00700FB5    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 00700FB8    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>00700FBC    jne         00700FE3
 00700FBE    lea         eax,[ebp-60]
 00700FC1    mov         ecx,dword ptr [ebp-14]
 00700FC4    mov         edx,701784;'_'
 00700FC9    call        @UStrCat3
 00700FCE    mov         eax,dword ptr [ebp-60]
 00700FD1    call        @UStrToPWChar
 00700FD6    push        eax
 00700FD7    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 00700FDA    push        eax
 00700FDB    call        GetProcAddress
 00700FE0    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 00700FE3    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>00700FE7    jne         00701019
 00700FE9    lea         eax,[ebp-68]
 00700FEC    mov         ecx,dword ptr [ebp-14]
 00700FEF    mov         edx,701784;'_'
 00700FF4    call        @UStrCat3
 00700FF9    mov         eax,dword ptr [ebp-68]
 00700FFC    lea         edx,[ebp-64]
 00700FFF    call        LowerCase
 00701004    mov         eax,dword ptr [ebp-64]
 00701007    call        @UStrToPWChar
 0070100C    push        eax
 0070100D    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 00701010    push        eax
 00701011    call        GetProcAddress
 00701016    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 00701019    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>0070101D    jne         0070104F
 0070101F    lea         eax,[ebp-70]
 00701022    mov         ecx,dword ptr [ebp-14]
 00701025    mov         edx,701784;'_'
 0070102A    call        @UStrCat3
 0070102F    mov         eax,dword ptr [ebp-70]
 00701032    lea         edx,[ebp-6C]
 00701035    call        UpperCase
 0070103A    mov         eax,dword ptr [ebp-6C]
 0070103D    call        @UStrToPWChar
 00701042    push        eax
 00701043    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 00701046    push        eax
 00701047    call        GetProcAddress
 0070104C    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 0070104F    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>00701053    jne         00701099
 00701055    push        701784;'_'
 0070105A    push        dword ptr [ebp-14]
 0070105D    push        701794;'@'
 00701062    lea         edx,[ebp-78]
 00701065    mov         eax,dword ptr [ebx+18];TDLLFunction.Parameters:TObjectList
 00701068    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 0070106B    add         eax,eax
 0070106D    add         eax,eax
 0070106F    call        IntToStr
 00701074    push        dword ptr [ebp-78]
 00701077    lea         eax,[ebp-74]
 0070107A    mov         edx,4
 0070107F    call        @UStrCatN
 00701084    mov         eax,dword ptr [ebp-74]
 00701087    call        @UStrToPWChar
 0070108C    push        eax
 0070108D    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 00701090    push        eax
 00701091    call        GetProcAddress
 00701096    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 00701099    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>0070109D    jne         007010F4
 0070109F    push        701784;'_'
 007010A4    push        dword ptr [ebp-14]
 007010A7    push        701794;'@'
 007010AC    lea         edx,[ebp-84]
 007010B2    mov         eax,dword ptr [ebx+18];TDLLFunction.Parameters:TObjectList
 007010B5    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 007010B8    add         eax,eax
 007010BA    add         eax,eax
 007010BC    call        IntToStr
 007010C1    push        dword ptr [ebp-84]
 007010C7    lea         eax,[ebp-80]
 007010CA    mov         edx,4
 007010CF    call        @UStrCatN
 007010D4    mov         eax,dword ptr [ebp-80]
 007010D7    lea         edx,[ebp-7C]
 007010DA    call        LowerCase
 007010DF    mov         eax,dword ptr [ebp-7C]
 007010E2    call        @UStrToPWChar
 007010E7    push        eax
 007010E8    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 007010EB    push        eax
 007010EC    call        GetProcAddress
 007010F1    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 007010F4    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>007010F8    jne         0070115B
 007010FA    push        701784;'_'
 007010FF    push        dword ptr [ebp-14]
 00701102    push        701794;'@'
 00701107    lea         edx,[ebp-90]
 0070110D    mov         eax,dword ptr [ebx+18];TDLLFunction.Parameters:TObjectList
 00701110    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 00701113    add         eax,eax
 00701115    add         eax,eax
 00701117    call        IntToStr
 0070111C    push        dword ptr [ebp-90]
 00701122    lea         eax,[ebp-8C]
 00701128    mov         edx,4
 0070112D    call        @UStrCatN
 00701132    mov         eax,dword ptr [ebp-8C]
 00701138    lea         edx,[ebp-88]
 0070113E    call        UpperCase
 00701143    mov         eax,dword ptr [ebp-88]
 00701149    call        @UStrToPWChar
 0070114E    push        eax
 0070114F    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 00701152    push        eax
 00701153    call        GetProcAddress
 00701158    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 0070115B    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>0070115F    jne         007011B1
 00701161    push        701794;'@'
 00701166    push        dword ptr [ebp-14]
 00701169    push        701794;'@'
 0070116E    lea         edx,[ebp-98]
 00701174    mov         eax,dword ptr [ebx+18];TDLLFunction.Parameters:TObjectList
 00701177    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 0070117A    add         eax,eax
 0070117C    add         eax,eax
 0070117E    call        IntToStr
 00701183    push        dword ptr [ebp-98]
 00701189    lea         eax,[ebp-94]
 0070118F    mov         edx,4
 00701194    call        @UStrCatN
 00701199    mov         eax,dword ptr [ebp-94]
 0070119F    call        @UStrToPWChar
 007011A4    push        eax
 007011A5    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 007011A8    push        eax
 007011A9    call        GetProcAddress
 007011AE    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 007011B1    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>007011B5    jne         00701218
 007011B7    push        701794;'@'
 007011BC    push        dword ptr [ebp-14]
 007011BF    push        701794;'@'
 007011C4    lea         edx,[ebp-0A4]
 007011CA    mov         eax,dword ptr [ebx+18];TDLLFunction.Parameters:TObjectList
 007011CD    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 007011D0    add         eax,eax
 007011D2    add         eax,eax
 007011D4    call        IntToStr
 007011D9    push        dword ptr [ebp-0A4]
 007011DF    lea         eax,[ebp-0A0]
 007011E5    mov         edx,4
 007011EA    call        @UStrCatN
 007011EF    mov         eax,dword ptr [ebp-0A0]
 007011F5    lea         edx,[ebp-9C]
 007011FB    call        LowerCase
 00701200    mov         eax,dword ptr [ebp-9C]
 00701206    call        @UStrToPWChar
 0070120B    push        eax
 0070120C    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 0070120F    push        eax
 00701210    call        GetProcAddress
 00701215    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 00701218    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>0070121C    jne         0070127F
 0070121E    push        701794;'@'
 00701223    push        dword ptr [ebp-14]
 00701226    push        701794;'@'
 0070122B    lea         edx,[ebp-0B0]
 00701231    mov         eax,dword ptr [ebx+18];TDLLFunction.Parameters:TObjectList
 00701234    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 00701237    add         eax,eax
 00701239    add         eax,eax
 0070123B    call        IntToStr
 00701240    push        dword ptr [ebp-0B0]
 00701246    lea         eax,[ebp-0AC]
 0070124C    mov         edx,4
 00701251    call        @UStrCatN
 00701256    mov         eax,dword ptr [ebp-0AC]
 0070125C    lea         edx,[ebp-0A8]
 00701262    call        UpperCase
 00701267    mov         eax,dword ptr [ebp-0A8]
 0070126D    call        @UStrToPWChar
 00701272    push        eax
 00701273    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 00701276    push        eax
 00701277    call        GetProcAddress
 0070127C    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 0070127F    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>00701283    jne         007012D8
 00701285    push        701794;'@'
 0070128A    push        dword ptr [ebp-14]
 0070128D    push        701794;'@'
 00701292    lea         edx,[ebp-0B8]
 00701298    mov         eax,dword ptr [ebx+18];TDLLFunction.Parameters:TObjectList
 0070129B    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 0070129E    add         eax,eax
 007012A0    add         eax,eax
 007012A2    add         eax,4
 007012A5    call        IntToStr
 007012AA    push        dword ptr [ebp-0B8]
 007012B0    lea         eax,[ebp-0B4]
 007012B6    mov         edx,4
 007012BB    call        @UStrCatN
 007012C0    mov         eax,dword ptr [ebp-0B4]
 007012C6    call        @UStrToPWChar
 007012CB    push        eax
 007012CC    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 007012CF    push        eax
 007012D0    call        GetProcAddress
 007012D5    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 007012D8    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>007012DC    jne         00701342
 007012DE    push        701794;'@'
 007012E3    push        dword ptr [ebp-14]
 007012E6    push        701794;'@'
 007012EB    lea         edx,[ebp-0C4]
 007012F1    mov         eax,dword ptr [ebx+18];TDLLFunction.Parameters:TObjectList
 007012F4    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 007012F7    add         eax,eax
 007012F9    add         eax,eax
 007012FB    add         eax,4
 007012FE    call        IntToStr
 00701303    push        dword ptr [ebp-0C4]
 00701309    lea         eax,[ebp-0C0]
 0070130F    mov         edx,4
 00701314    call        @UStrCatN
 00701319    mov         eax,dword ptr [ebp-0C0]
 0070131F    lea         edx,[ebp-0BC]
 00701325    call        LowerCase
 0070132A    mov         eax,dword ptr [ebp-0BC]
 00701330    call        @UStrToPWChar
 00701335    push        eax
 00701336    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 00701339    push        eax
 0070133A    call        GetProcAddress
 0070133F    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 00701342    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>00701346    jne         007013AC
 00701348    push        701794;'@'
 0070134D    push        dword ptr [ebp-14]
 00701350    push        701794;'@'
 00701355    lea         edx,[ebp-0D0]
 0070135B    mov         eax,dword ptr [ebx+18];TDLLFunction.Parameters:TObjectList
 0070135E    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 00701361    add         eax,eax
 00701363    add         eax,eax
 00701365    add         eax,4
 00701368    call        IntToStr
 0070136D    push        dword ptr [ebp-0D0]
 00701373    lea         eax,[ebp-0CC]
 00701379    mov         edx,4
 0070137E    call        @UStrCatN
 00701383    mov         eax,dword ptr [ebp-0CC]
 00701389    lea         edx,[ebp-0C8]
 0070138F    call        UpperCase
 00701394    mov         eax,dword ptr [ebp-0C8]
 0070139A    call        @UStrToPWChar
 0070139F    push        eax
 007013A0    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 007013A3    push        eax
 007013A4    call        GetProcAddress
 007013A9    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 007013AC    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>007013B0    jne         00701405
 007013B2    push        701794;'@'
 007013B7    push        dword ptr [ebp-14]
 007013BA    push        701794;'@'
 007013BF    lea         edx,[ebp-0D8]
 007013C5    mov         eax,dword ptr [ebx+18];TDLLFunction.Parameters:TObjectList
 007013C8    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 007013CB    add         eax,eax
 007013CD    add         eax,eax
 007013CF    add         eax,8
 007013D2    call        IntToStr
 007013D7    push        dword ptr [ebp-0D8]
 007013DD    lea         eax,[ebp-0D4]
 007013E3    mov         edx,4
 007013E8    call        @UStrCatN
 007013ED    mov         eax,dword ptr [ebp-0D4]
 007013F3    call        @UStrToPWChar
 007013F8    push        eax
 007013F9    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 007013FC    push        eax
 007013FD    call        GetProcAddress
 00701402    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 00701405    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>00701409    jne         0070146F
 0070140B    push        701794;'@'
 00701410    push        dword ptr [ebp-14]
 00701413    push        701794;'@'
 00701418    lea         edx,[ebp-0E4]
 0070141E    mov         eax,dword ptr [ebx+18];TDLLFunction.Parameters:TObjectList
 00701421    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 00701424    add         eax,eax
 00701426    add         eax,eax
 00701428    add         eax,8
 0070142B    call        IntToStr
 00701430    push        dword ptr [ebp-0E4]
 00701436    lea         eax,[ebp-0E0]
 0070143C    mov         edx,4
 00701441    call        @UStrCatN
 00701446    mov         eax,dword ptr [ebp-0E0]
 0070144C    lea         edx,[ebp-0DC]
 00701452    call        LowerCase
 00701457    mov         eax,dword ptr [ebp-0DC]
 0070145D    call        @UStrToPWChar
 00701462    push        eax
 00701463    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 00701466    push        eax
 00701467    call        GetProcAddress
 0070146C    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 0070146F    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>00701473    jne         007014D9
 00701475    push        701794;'@'
 0070147A    push        dword ptr [ebp-14]
 0070147D    push        701794;'@'
 00701482    lea         edx,[ebp-0F0]
 00701488    mov         eax,dword ptr [ebx+18];TDLLFunction.Parameters:TObjectList
 0070148B    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 0070148E    add         eax,eax
 00701490    add         eax,eax
 00701492    add         eax,8
 00701495    call        IntToStr
 0070149A    push        dword ptr [ebp-0F0]
 007014A0    lea         eax,[ebp-0EC]
 007014A6    mov         edx,4
 007014AB    call        @UStrCatN
 007014B0    mov         eax,dword ptr [ebp-0EC]
 007014B6    lea         edx,[ebp-0E8]
 007014BC    call        UpperCase
 007014C1    mov         eax,dword ptr [ebp-0E8]
 007014C7    call        @UStrToPWChar
 007014CC    push        eax
 007014CD    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 007014D0    push        eax
 007014D1    call        GetProcAddress
 007014D6    mov         dword ptr [ebx+2C],eax;TDLLFunction.FunctionPointer:Pointer
 007014D9    cmp         dword ptr [ebx+2C],0;TDLLFunction.FunctionPointer:Pointer
>007014DD    jne         007014E8
 007014DF    mov         byte ptr [ebx+34],1;TDLLFunction.Failed:Boolean
>007014E3    jmp         00701729
 007014E8    mov         eax,dword ptr [ebx+2C];TDLLFunction.FunctionPointer:Pointer
 007014EB    mov         dword ptr [ebp-0C],eax
 007014EE    mov         ax,133F
 007014F2    call        Set8087CW
 007014F7    mov         dword ptr ds:[78C3B0],esp;gvar_0078C3B0
 007014FD    mov         dword ptr ds:[78C3B4],ebp;gvar_0078C3B4
 00701503    xor         cx,cx
 00701506    push        cx
 00701508    push        cx
 0070150A    push        cx
 0070150C    push        cx
 0070150E    push        cx
 00701510    push        cx
 00701512    push        cx
 00701514    push        cx
 00701516    push        cx
 00701518    push        cx
 0070151A    push        cx
 0070151C    push        cx
 0070151E    push        cx
 00701520    push        cx
 00701522    push        cx
 00701524    push        cx
 00701526    push        cx
 00701528    push        cx
 0070152A    push        cx
 0070152C    push        cx
 0070152E    xor         eax,eax
 00701530    mov         dword ptr [ebp-4],eax
 00701533    xor         eax,eax
 00701535    mov         dword ptr [ebp-8],eax
 00701538    xor         eax,eax
 0070153A    mov         dword ptr [ebp-40],eax
 0070153D    mov         eax,dword ptr [ebx+18];TDLLFunction.Parameters:TObjectList
 00701540    mov         esi,dword ptr [eax+8];TObjectList.FCount:Integer
 00701543    dec         esi
 00701544    cmp         esi,0
>00701547    jl          007016D2
 0070154D    mov         edx,esi
 0070154F    mov         eax,dword ptr [ebx+18];TDLLFunction.Parameters:TObjectList
 00701552    call        TList.Get
 00701557    mov         edi,eax
 00701559    mov         eax,edi
 0070155B    mov         edx,dword ptr [eax]
 0070155D    call        dword ptr [edx+44]
 00701560    sub         al,2
>00701562    jb          00701597
 00701564    dec         al
>00701566    je          00701576
 00701568    dec         al
>0070156A    je          007015AE
 0070156C    dec         eax
 0070156D    sub         al,2
>0070156F    jb          00701597
>00701571    jmp         007016B0
 00701576    mov         eax,edi
 00701578    mov         edx,dword ptr [eax]
 0070157A    call        dword ptr [edx+4]
 0070157D    test        al,al
>0070157F    je          0070158D
 00701581    mov         dword ptr [ebp-4],1
>00701588    jmp         007016BA
 0070158D    xor         eax,eax
 0070158F    mov         dword ptr [ebp-4],eax
>00701592    jmp         007016BA
 00701597    mov         eax,edi
 00701599    mov         edx,dword ptr [eax]
 0070159B    call        dword ptr [edx]
 0070159D    fstp        dword ptr [ebp-3C]
 007015A0    wait
 007015A1    lea         eax,[ebp-3C]
 007015A4    mov         eax,dword ptr [eax]
 007015A6    mov         dword ptr [ebp-4],eax
>007015A9    jmp         007016BA
 007015AE    inc         dword ptr [ebp-40]
 007015B1    mov         eax,dword ptr [ebp-40]
 007015B4    cmp         eax,8
>007015B7    ja          007016A9
 007015BD    jmp         dword ptr [eax*4+7015C4]
 007015BD    dd          007016A9
 007015BD    dd          007015E8
 007015BD    dd          00701602
 007015BD    dd          0070161C
 007015BD    dd          00701636
 007015BD    dd          0070164D
 007015BD    dd          00701664
 007015BD    dd          0070167B
 007015BD    dd          00701692
 007015E8    lea         edx,[ebp-18]
 007015EB    mov         eax,edi
 007015ED    mov         ecx,dword ptr [eax]
 007015EF    call        dword ptr [ecx+0C]
 007015F2    mov         eax,dword ptr [ebp-18]
 007015F5    call        @UStrToPWChar
 007015FA    mov         dword ptr [ebp-4],eax
>007015FD    jmp         007016BA
 00701602    lea         edx,[ebp-1C]
 00701605    mov         eax,edi
 00701607    mov         ecx,dword ptr [eax]
 00701609    call        dword ptr [ecx+0C]
 0070160C    mov         eax,dword ptr [ebp-1C]
 0070160F    call        @UStrToPWChar
 00701614    mov         dword ptr [ebp-4],eax
>00701617    jmp         007016BA
 0070161C    lea         edx,[ebp-20]
 0070161F    mov         eax,edi
 00701621    mov         ecx,dword ptr [eax]
 00701623    call        dword ptr [ecx+0C]
 00701626    mov         eax,dword ptr [ebp-20]
 00701629    call        @UStrToPWChar
 0070162E    mov         dword ptr [ebp-4],eax
>00701631    jmp         007016BA
 00701636    lea         edx,[ebp-24]
 00701639    mov         eax,edi
 0070163B    mov         ecx,dword ptr [eax]
 0070163D    call        dword ptr [ecx+0C]
 00701640    mov         eax,dword ptr [ebp-24]
 00701643    call        @UStrToPWChar
 00701648    mov         dword ptr [ebp-4],eax
>0070164B    jmp         007016BA
 0070164D    lea         edx,[ebp-28]
 00701650    mov         eax,edi
 00701652    mov         ecx,dword ptr [eax]
 00701654    call        dword ptr [ecx+0C]
 00701657    mov         eax,dword ptr [ebp-28]
 0070165A    call        @UStrToPWChar
 0070165F    mov         dword ptr [ebp-4],eax
>00701662    jmp         007016BA
 00701664    lea         edx,[ebp-2C]
 00701667    mov         eax,edi
 00701669    mov         ecx,dword ptr [eax]
 0070166B    call        dword ptr [ecx+0C]
 0070166E    mov         eax,dword ptr [ebp-2C]
 00701671    call        @UStrToPWChar
 00701676    mov         dword ptr [ebp-4],eax
>00701679    jmp         007016BA
 0070167B    lea         edx,[ebp-30]
 0070167E    mov         eax,edi
 00701680    mov         ecx,dword ptr [eax]
 00701682    call        dword ptr [ecx+0C]
 00701685    mov         eax,dword ptr [ebp-30]
 00701688    call        @UStrToPWChar
 0070168D    mov         dword ptr [ebp-4],eax
>00701690    jmp         007016BA
 00701692    lea         edx,[ebp-34]
 00701695    mov         eax,edi
 00701697    mov         ecx,dword ptr [eax]
 00701699    call        dword ptr [ecx+0C]
 0070169C    mov         eax,dword ptr [ebp-34]
 0070169F    call        @UStrToPWChar
 007016A4    mov         dword ptr [ebp-4],eax
>007016A7    jmp         007016BA
 007016A9    xor         eax,eax
 007016AB    mov         dword ptr [ebp-4],eax
>007016AE    jmp         007016BA
 007016B0    mov         eax,edi
 007016B2    mov         edx,dword ptr [eax]
 007016B4    call        dword ptr [edx+8]
 007016B7    mov         dword ptr [ebp-4],eax
 007016BA    cmp         esi,1
>007016BD    jne         007016C5
 007016BF    mov         eax,dword ptr [ebp-4]
 007016C2    mov         dword ptr [ebp-8],eax
 007016C5    push        dword ptr [ebp-4]
 007016C8    dec         esi
 007016C9    cmp         esi,0FFFFFFFF
>007016CC    jne         0070154D
 007016D2    mov         dword ptr ds:[8229A8],ebx;gvar_008229A8:TDLLFunction
 007016D8    mov         dword ptr ds:[8229AC],esi;gvar_008229AC
 007016DE    mov         dword ptr ds:[8229B0],edi;gvar_008229B0
 007016E4    mov         eax,dword ptr [ebp-4]
 007016E7    mov         ecx,eax
 007016E9    mov         edx,dword ptr [ebp-8]
 007016EC    call        dword ptr [ebp-0C]
 007016EF    mov         esp,dword ptr ds:[78C3B0];0x0 gvar_0078C3B0
 007016F5    mov         ebp,dword ptr ds:[78C3B4];0x0 gvar_0078C3B4
 007016FB    mov         ebx,dword ptr ds:[8229A8];gvar_008229A8:TDLLFunction
 00701701    mov         esi,dword ptr ds:[8229AC];gvar_008229AC
 00701707    mov         edi,dword ptr ds:[8229B0];gvar_008229B0
 0070170D    cld
 0070170E    mov         dword ptr [ebp-10],eax
 00701711    mov         ax,133F
 00701715    call        Set8087CW
 0070171A    mov         eax,dword ptr [ebp-10]
 0070171D    mov         dword ptr [ebx+30],eax
 00701720    movzx       eax,byte ptr [ebx+34]
 00701724    xor         al,1
 00701726    mov         byte ptr [ebp-35],al
 00701729    xor         eax,eax
 0070172B    pop         edx
 0070172C    pop         ecx
 0070172D    pop         ecx
 0070172E    mov         dword ptr fs:[eax],edx
 00701731    push        70175B
 00701736    lea         eax,[ebp-0F0]
 0070173C    mov         edx,2C
 00701741    call        @UStrArrayClr
 00701746    lea         eax,[ebp-34]
 00701749    mov         edx,9
 0070174E    call        @UStrArrayClr
 00701753    ret
>00701754    jmp         @HandleFinally
>00701759    jmp         00701736
 0070175B    movzx       eax,byte ptr [ebp-35]
 0070175F    pop         edi
 00701760    pop         esi
 00701761    pop         ebx
 00701762    mov         esp,ebp
 00701764    pop         ebp
 00701765    ret
*}
end;

//00701798
procedure TDLLFunction.FillClone(c:TExpression);
begin
{*
 00701798    push        ebx
 00701799    push        esi
 0070179A    push        edi
 0070179B    mov         esi,edx
 0070179D    mov         ebx,eax
 0070179F    mov         edx,esi
 007017A1    mov         eax,ebx
 007017A3    call        TProcedureExpression.FillClone
 007017A8    mov         edi,esi
 007017AA    lea         eax,[edi+24]
 007017AD    mov         edx,dword ptr [ebx+24];TDLLFunction.FunctionName:string
 007017B0    call        @UStrAsg
 007017B5    lea         eax,[edi+20]
 007017B8    mov         edx,dword ptr [ebx+20];TDLLFunction.DLLName:string
 007017BB    call        @UStrAsg
 007017C0    mov         eax,dword ptr [ebx+28];TDLLFunction.ModuleHandle:Cardinal
 007017C3    mov         dword ptr [edi+28],eax
 007017C6    mov         eax,dword ptr [ebx+2C];TDLLFunction.FunctionPointer:Pointer
 007017C9    mov         dword ptr [edi+2C],eax
 007017CC    pop         edi
 007017CD    pop         esi
 007017CE    pop         ebx
 007017CF    ret
*}
end;

//007017D0
function TDLLFunction.GetDataType:TDataType;
begin
{*
 007017D0    mov         al,2
 007017D2    ret
*}
end;

//007017D4
{*procedure TDLLFunction.GetString(?:?);
begin
 007017D4    push        ebx
 007017D5    push        esi
 007017D6    mov         esi,edx
 007017D8    mov         ebx,eax
 007017DA    xor         edx,edx
 007017DC    mov         eax,ebx
 007017DE    mov         ecx,dword ptr [eax]
 007017E0    call        dword ptr [ecx+98];TDLLFunction.Execute
 007017E6    mov         edx,esi
 007017E8    mov         eax,dword ptr [ebx+30];TDLLFunction.ReturnResult:Integer
 007017EB    call        IntToStr
 007017F0    pop         esi
 007017F1    pop         ebx
 007017F2    ret
end;*}

//007017F4
procedure TDLLFunction.GetValue;
begin
{*
 007017F4    push        ebx
 007017F5    add         esp,0FFFFFFF8
 007017F8    mov         ebx,eax
 007017FA    xor         edx,edx
 007017FC    mov         eax,ebx
 007017FE    mov         ecx,dword ptr [eax]
 00701800    call        dword ptr [ecx+98];TDLLFunction.Execute
 00701806    fild        dword ptr [ebx+30];TDLLFunction.ReturnResult:Integer
 00701809    fstp        qword ptr [esp]
 0070180C    wait
 0070180D    fld         qword ptr [esp]
 00701810    pop         ecx
 00701811    pop         edx
 00701812    pop         ebx
 00701813    ret
*}
end;

//00701814
{*procedure TDLLFunction.ToString(?:?);
begin
 00701814    push        ebp
 00701815    mov         ebp,esp
 00701817    add         esp,0FFFFFFF8
 0070181A    push        ebx
 0070181B    push        esi
 0070181C    push        edi
 0070181D    xor         ecx,ecx
 0070181F    mov         dword ptr [ebp-8],ecx
 00701822    mov         ebx,edx
 00701824    mov         esi,eax
 00701826    xor         eax,eax
 00701828    push        ebp
 00701829    push        7018C7
 0070182E    push        dword ptr fs:[eax]
 00701831    mov         dword ptr fs:[eax],esp
 00701834    push        dword ptr [esi+20];TDLLFunction.DLLName:string
 00701837    push        7018E4;'.DLL.'
 0070183C    push        dword ptr [esi+24];TDLLFunction.FunctionName:string
 0070183F    push        7018FC;'('
 00701844    mov         eax,ebx
 00701846    mov         edx,4
 0070184B    call        @UStrCatN
 00701850    mov         eax,dword ptr [esi+18];TDLLFunction.Parameters:TObjectList
 00701853    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 00701856    dec         eax
 00701857    test        eax,eax
>00701859    jl          007018A5
 0070185B    inc         eax
 0070185C    mov         dword ptr [ebp-4],eax
 0070185F    xor         edi,edi
 00701861    mov         edx,edi
 00701863    mov         eax,dword ptr [esi+18];TDLLFunction.Parameters:TObjectList
 00701866    call        TList.Get
 0070186B    mov         edx,dword ptr ds:[67DB04];TExpression
 00701871    call        @AsClass
 00701876    lea         edx,[ebp-8]
 00701879    mov         ecx,dword ptr [eax]
 0070187B    call        dword ptr [ecx-24];TExpression.ToString
 0070187E    mov         edx,dword ptr [ebp-8]
 00701881    mov         eax,ebx
 00701883    call        @UStrCat
 00701888    mov         eax,dword ptr [esi+18];TDLLFunction.Parameters:TObjectList
 0070188B    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 0070188E    dec         eax
 0070188F    cmp         edi,eax
>00701891    je          0070189F
 00701893    mov         eax,ebx
 00701895    mov         edx,70190C;', '
 0070189A    call        @UStrCat
 0070189F    inc         edi
 007018A0    dec         dword ptr [ebp-4]
>007018A3    jne         00701861
 007018A5    mov         eax,ebx
 007018A7    mov         edx,701920;')'
 007018AC    call        @UStrCat
 007018B1    xor         eax,eax
 007018B3    pop         edx
 007018B4    pop         ecx
 007018B5    pop         ecx
 007018B6    mov         dword ptr fs:[eax],edx
 007018B9    push        7018CE
 007018BE    lea         eax,[ebp-8]
 007018C1    call        @UStrClr
 007018C6    ret
>007018C7    jmp         @HandleFinally
>007018CC    jmp         007018BE
 007018CE    pop         edi
 007018CF    pop         esi
 007018D0    pop         ebx
 007018D1    pop         ecx
 007018D2    pop         ecx
 007018D3    pop         ebp
 007018D4    ret
end;*}

//00701924
{*function sub_00701924(?:UnicodeString):?;
begin
 00701924    push        ebp
 00701925    mov         ebp,esp
 00701927    push        0
 00701929    push        ebx
 0070192A    mov         ebx,eax
 0070192C    xor         eax,eax
 0070192E    push        ebp
 0070192F    push        701983
 00701934    push        dword ptr fs:[eax]
 00701937    mov         dword ptr fs:[eax],esp
 0070193A    lea         edx,[ebp-4]
 0070193D    mov         eax,ebx
 0070193F    call        LowerCase
 00701944    mov         edx,dword ptr [ebp-4]
 00701947    mov         eax,70199C;'.dll.'
 0070194C    call        Pos
 00701951    test        eax,eax
>00701953    jg          00701969
 00701955    mov         edx,7019B4;'DLL.'
 0070195A    mov         eax,ebx
 0070195C    call        004F9A58
 00701961    test        al,al
>00701963    jne         00701969
 00701965    xor         eax,eax
>00701967    jmp         0070196B
 00701969    mov         al,1
 0070196B    mov         ebx,eax
 0070196D    xor         eax,eax
 0070196F    pop         edx
 00701970    pop         ecx
 00701971    pop         ecx
 00701972    mov         dword ptr fs:[eax],edx
 00701975    push        70198A
 0070197A    lea         eax,[ebp-4]
 0070197D    call        @UStrClr
 00701982    ret
>00701983    jmp         @HandleFinally
>00701988    jmp         0070197A
 0070198A    mov         eax,ebx
 0070198C    pop         ebx
 0070198D    pop         ecx
 0070198E    pop         ebp
 0070198F    ret
end;*}

//00701B8C
{*procedure CoDevice.Create(?:?);
begin
 00701B8C    push        ebp
 00701B8D    mov         ebp,esp
 00701B8F    push        0
 00701B91    push        ebx
 00701B92    mov         ebx,edx
 00701B94    xor         eax,eax
 00701B96    push        ebp
 00701B97    push        701BD4
 00701B9C    push        dword ptr fs:[eax]
 00701B9F    mov         dword ptr fs:[eax],esp
 00701BA2    lea         edx,[ebp-4]
 00701BA5    mov         eax,78C3B8;['{82C5AB54-C92C-4D52-AAC5-27E25E22604C}']
 00701BAA    call        CreateComObject
 00701BAF    mov         edx,dword ptr [ebp-4]
 00701BB2    mov         eax,ebx
 00701BB4    mov         ecx,701BE0;['{CB3BF65E-0816-482A-BB11-64AF1E837812}']
 00701BB9    call        @IntfCast
 00701BBE    xor         eax,eax
 00701BC0    pop         edx
 00701BC1    pop         ecx
 00701BC2    pop         ecx
 00701BC3    mov         dword ptr fs:[eax],edx
 00701BC6    push        701BDB
 00701BCB    lea         eax,[ebp-4]
 00701BCE    call        @IntfClear
 00701BD3    ret
>00701BD4    jmp         @HandleFinally
>00701BD9    jmp         00701BCB
 00701BDB    pop         ebx
 00701BDC    pop         ecx
 00701BDD    pop         ebp
 00701BDE    ret
end;*}

//00701BF0
{*procedure CoDevice.CreateRemote(MachineName:string; ?:?);
begin
 00701BF0    push        ebp
 00701BF1    mov         ebp,esp
 00701BF3    push        0
 00701BF5    push        0
 00701BF7    push        ebx
 00701BF8    push        esi
 00701BF9    mov         esi,ecx
 00701BFB    mov         ebx,edx
 00701BFD    xor         eax,eax
 00701BFF    push        ebp
 00701C00    push        701C52
 00701C05    push        dword ptr fs:[eax]
 00701C08    mov         dword ptr fs:[eax],esp
 00701C0B    lea         eax,[ebp-8]
 00701C0E    mov         edx,ebx
 00701C10    call        @WStrFromUStr
 00701C15    mov         eax,dword ptr [ebp-8]
 00701C18    lea         ecx,[ebp-4]
 00701C1B    mov         edx,78C3B8;['{82C5AB54-C92C-4D52-AAC5-27E25E22604C}']
 00701C20    call        CreateRemoteComObject
 00701C25    mov         edx,dword ptr [ebp-4]
 00701C28    mov         eax,esi
 00701C2A    mov         ecx,701C60;['{CB3BF65E-0816-482A-BB11-64AF1E837812}']
 00701C2F    call        @IntfCast
 00701C34    xor         eax,eax
 00701C36    pop         edx
 00701C37    pop         ecx
 00701C38    pop         ecx
 00701C39    mov         dword ptr fs:[eax],edx
 00701C3C    push        701C59
 00701C41    lea         eax,[ebp-8]
 00701C44    call        @WStrClr
 00701C49    lea         eax,[ebp-4]
 00701C4C    call        @IntfClear
 00701C51    ret
>00701C52    jmp         @HandleFinally
>00701C57    jmp         00701C41
 00701C59    pop         esi
 00701C5A    pop         ebx
 00701C5B    pop         ecx
 00701C5C    pop         ecx
 00701C5D    pop         ebp
 00701C5E    ret
end;*}

//00702604
{*function sub_00702604(?:string):?;
begin
 00702604    push        ebp
 00702605    mov         ebp,esp
 00702607    add         esp,0FFFFFFF8
 0070260A    push        ebx
 0070260B    push        esi
 0070260C    push        edi
 0070260D    xor         edx,edx
 0070260F    mov         dword ptr [ebp-8],edx
 00702612    mov         dword ptr [ebp-4],eax
 00702615    mov         eax,dword ptr [ebp-4]
 00702618    call        @UStrAddRef
 0070261D    xor         eax,eax
 0070261F    push        ebp
 00702620    push        7026B9
 00702625    push        dword ptr fs:[eax]
 00702628    mov         dword ptr fs:[eax],esp
 0070262B    xor         ebx,ebx
 0070262D    lea         eax,[ebp-8]
 00702630    mov         edx,dword ptr [ebp-4]
 00702633    call        @UStrLAsg
 00702638    lea         eax,[ebp-8]
 0070263B    mov         edx,7026D8;'SpaceBall'
 00702640    call        004F9BD0
 00702645    test        al,al
>00702647    je          0070269E
 00702649    lea         eax,[ebp-8]
 0070264C    call        004F9D00
 00702651    mov         esi,eax
 00702653    lea         eax,[ebp-8]
 00702656    mov         edx,7026F8;'.'
 0070265B    call        004F9BD0
 00702660    test        al,al
>00702662    je          0070269E
 00702664    mov         eax,[008229BC];gvar_008229BC:TModuleSpaceball
 00702669    mov         eax,dword ptr [eax+1C]
 0070266C    mov         edx,dword ptr [ebp-8]
 0070266F    call        THashTable.Get
 00702674    mov         edi,eax
 00702676    test        edi,edi
>00702678    jl          0070269E
 0070267A    mov         dl,1
 0070267C    mov         eax,[00701C70];TSpaceBallValue
 00702681    call        TObject.Create;TSpaceBallValue.Create
 00702686    mov         ebx,eax
 00702688    mov         dword ptr [ebx+20],edi;TSpaceBallValue..........................Item:Integer
 0070268B    test        esi,esi
>0070268D    jg          00702694
 0070268F    mov         esi,1
 00702694    mov         dword ptr [ebx+18],esi;TSpaceBallValue.....................................................
 00702697    mov         byte ptr ds:[8229B4],1;gvar_008229B4
 0070269E    xor         eax,eax
 007026A0    pop         edx
 007026A1    pop         ecx
 007026A2    pop         ecx
 007026A3    mov         dword ptr fs:[eax],edx
 007026A6    push        7026C0
 007026AB    lea         eax,[ebp-8]
 007026AE    mov         edx,2
 007026B3    call        @UStrArrayClr
 007026B8    ret
>007026B9    jmp         @HandleFinally
>007026BE    jmp         007026AB
 007026C0    mov         eax,ebx
 007026C2    pop         edi
 007026C3    pop         esi
 007026C4    pop         ebx
 007026C5    pop         ecx
 007026C6    pop         ecx
 007026C7    pop         ebp
 007026C8    ret
end;*}

//007026FC
function TSpaceBallValue.CanSet:Boolean;
begin
{*
 007026FC    xor         eax,eax
 007026FE    ret
*}
end;

//00702700
procedure TSpaceBallValue.CreateClone;
begin
{*
 00702700    mov         dl,1
 00702702    mov         eax,[00701C70];TSpaceBallValue
 00702707    call        TObject.Create;TSpaceBallValue.Create
 0070270C    ret
*}
end;

//00702710
procedure TSpaceBallValue.FillClone(c:TExpression);
begin
{*
 00702710    push        ebx
 00702711    push        esi
 00702712    mov         esi,edx
 00702714    mov         ebx,eax
 00702716    mov         edx,esi
 00702718    mov         eax,ebx
 0070271A    call        TExpression.FillClone
 0070271F    mov         eax,esi
 00702721    mov         edx,dword ptr [ebx+20];TSpaceBallValue...........................Item:Integer
 00702724    mov         dword ptr [eax+20],edx
 00702727    mov         edx,dword ptr [ebx+18];TSpaceBallValue.....................................................
 0070272A    mov         dword ptr [eax+18],edx
 0070272D    pop         esi
 0070272E    pop         ebx
 0070272F    ret
*}
end;

//00702730
function TSpaceBallValue.GetDataType:TDataType;
begin
{*
 00702730    mov         eax,dword ptr [eax+20];TSpaceBallValue............................Item:Integer
 00702733    cmp         eax,0E
>00702736    ja          00702790
 00702738    jmp         dword ptr [eax*4+70273F]
 00702738    dd          00702790
 00702738    dd          0070277B
 00702738    dd          0070277E
 00702738    dd          0070277E
 00702738    dd          0070277E
 00702738    dd          00702787
 00702738    dd          00702790
 00702738    dd          00702781
 00702738    dd          00702784
 00702738    dd          00702787
 00702738    dd          0070277B
 00702738    dd          0070278A
 00702738    dd          0070278D
 00702738    dd          0070278D
 00702738    dd          0070278D
 0070277B    mov         al,2
 0070277D    ret
 0070277E    xor         eax,eax
 00702780    ret
 00702781    xor         eax,eax
 00702783    ret
 00702784    xor         eax,eax
 00702786    ret
 00702787    mov         al,5
 00702789    ret
 0070278A    mov         al,6
 0070278C    ret
 0070278D    xor         eax,eax
 0070278F    ret
 00702790    mov         al,3
 00702792    ret
*}
end;

//00702794
function TSpaceBallValue.GetPerUnits1:TUnits;
begin
{*
 00702794    mov         eax,dword ptr [eax+20];TSpaceBallValue.............................Item:Integer
 00702797    sub         eax,1
>0070279A    jae         0070279F
 0070279C    xor         eax,eax
 0070279E    ret
 0070279F    xor         eax,eax
 007027A1    ret
*}
end;

//007027A4
function TSpaceBallValue.GetPerUnits2:TUnits;
begin
{*
 007027A4    mov         eax,dword ptr [eax+20];TSpaceBallValue..............................Item:Integer
 007027A7    sub         eax,1
>007027AA    jae         007027AF
 007027AC    xor         eax,eax
 007027AE    ret
 007027AF    xor         eax,eax
 007027B1    ret
*}
end;

//007027B4
procedure TSpaceBallValue.GetRotMat(m:TRotMat);
begin
{*
 007027B4    push        ebp
 007027B5    mov         ebp,esp
 007027B7    add         esp,0FFFFFF7C
 007027BD    push        ebx
 007027BE    push        esi
 007027BF    xor         ecx,ecx
 007027C1    mov         dword ptr [ebp-80],ecx
 007027C4    mov         dword ptr [ebp-84],ecx
 007027CA    mov         dword ptr [ebp-78],ecx
 007027CD    mov         dword ptr [ebp-7C],ecx
 007027D0    mov         dword ptr [ebp-70],ecx
 007027D3    mov         dword ptr [ebp-74],ecx
 007027D6    mov         dword ptr [ebp-68],ecx
 007027D9    mov         dword ptr [ebp-6C],ecx
 007027DC    mov         dword ptr [ebp-4],edx
 007027DF    xor         edx,edx
 007027E1    push        ebp
 007027E2    push        702A20
 007027E7    push        dword ptr fs:[edx]
 007027EA    mov         dword ptr fs:[edx],esp
 007027ED    mov         edx,dword ptr [eax+18];TSpaceBallValue.....................................................
 007027F0    test        edx,edx
>007027F2    jl          00702800
 007027F4    dec         edx
>007027F5    jg          00702800
 007027F7    cmp         byte ptr ds:[8229B5],0;gvar_008229B5
>007027FE    jne         00702831
 00702800    xor         ecx,ecx
 00702802    mov         esi,dword ptr [ebp-4]
 00702805    xor         eax,eax
 00702807    mov         edx,esi
 00702809    cmp         eax,ecx
 0070280B    sete        bl
 0070280E    movsx       ebx,bl
 00702811    mov         dword ptr [ebp-5C],ebx
 00702814    fild        dword ptr [ebp-5C]
 00702817    fstp        qword ptr [edx]
 00702819    wait
 0070281A    inc         eax
 0070281B    add         edx,8
 0070281E    cmp         eax,3
>00702821    jne         00702809
 00702823    inc         ecx
 00702824    add         esi,18
 00702827    cmp         ecx,3
>0070282A    jne         00702805
>0070282C    jmp         007029CF
 00702831    mov         edx,dword ptr [eax+20];TSpaceBallValue...............................Item:Integer
 00702834    sub         edx,0B
>00702837    jne         007029C7
 0070283D    lea         eax,[ebp-64]
 00702840    push        eax
 00702841    lea         eax,[ebp-68]
 00702844    call        @IntfClear
 00702849    push        eax
 0070284A    lea         eax,[ebp-6C]
 0070284D    call        @IntfClear
 00702852    push        eax
 00702853    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702858    push        eax
 00702859    mov         eax,dword ptr [eax]
 0070285B    call        dword ptr [eax+24]
 0070285E    call        @CheckAutoResult
 00702863    mov         eax,dword ptr [ebp-6C]
 00702866    push        eax
 00702867    mov         eax,dword ptr [eax]
 00702869    call        dword ptr [eax+20]
 0070286C    call        @CheckAutoResult
 00702871    mov         eax,dword ptr [ebp-68]
 00702874    push        eax
 00702875    mov         eax,dword ptr [eax]
 00702877    call        dword ptr [eax+34]
 0070287A    call        @CheckAutoResult
 0070287F    fld         qword ptr [ebp-64]
 00702882    fdiv        dword ptr ds:[702A30];1600:Single
 00702888    fld         tbyte ptr ds:[702A34];3.14159265358979:Extended
 0070288E    fmulp       st(1),st
 00702890    fmul        dword ptr ds:[702A40];6:Single
 00702896    fdiv        dword ptr ds:[702A44];18:Single
 0070289C    fstp        dword ptr [ebp-8]
 0070289F    wait
 007028A0    lea         eax,[ebp-64]
 007028A3    push        eax
 007028A4    lea         eax,[ebp-70]
 007028A7    call        @IntfClear
 007028AC    push        eax
 007028AD    lea         eax,[ebp-74]
 007028B0    call        @IntfClear
 007028B5    push        eax
 007028B6    mov         eax,[008229C0];gvar_008229C0:IInterface
 007028BB    push        eax
 007028BC    mov         eax,dword ptr [eax]
 007028BE    call        dword ptr [eax+24]
 007028C1    call        @CheckAutoResult
 007028C6    mov         eax,dword ptr [ebp-74]
 007028C9    push        eax
 007028CA    mov         eax,dword ptr [eax]
 007028CC    call        dword ptr [eax+20]
 007028CF    call        @CheckAutoResult
 007028D4    mov         eax,dword ptr [ebp-70]
 007028D7    push        eax
 007028D8    mov         eax,dword ptr [eax]
 007028DA    call        dword ptr [eax+1C]
 007028DD    call        @CheckAutoResult
 007028E2    fld         qword ptr [ebp-64]
 007028E5    fchs
 007028E7    fstp        dword ptr [ebp-58]
 007028EA    wait
 007028EB    lea         eax,[ebp-64]
 007028EE    push        eax
 007028EF    lea         eax,[ebp-78]
 007028F2    call        @IntfClear
 007028F7    push        eax
 007028F8    lea         eax,[ebp-7C]
 007028FB    call        @IntfClear
 00702900    push        eax
 00702901    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702906    push        eax
 00702907    mov         eax,dword ptr [eax]
 00702909    call        dword ptr [eax+24]
 0070290C    call        @CheckAutoResult
 00702911    mov         eax,dword ptr [ebp-7C]
 00702914    push        eax
 00702915    mov         eax,dword ptr [eax]
 00702917    call        dword ptr [eax+20]
 0070291A    call        @CheckAutoResult
 0070291F    mov         eax,dword ptr [ebp-78]
 00702922    push        eax
 00702923    mov         eax,dword ptr [eax]
 00702925    call        dword ptr [eax+24]
 00702928    call        @CheckAutoResult
 0070292D    fld         qword ptr [ebp-64]
 00702930    fchs
 00702932    fstp        dword ptr [ebp-54]
 00702935    wait
 00702936    lea         eax,[ebp-64]
 00702939    push        eax
 0070293A    lea         eax,[ebp-80]
 0070293D    call        @IntfClear
 00702942    push        eax
 00702943    lea         eax,[ebp-84]
 00702949    call        @IntfClear
 0070294E    push        eax
 0070294F    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702954    push        eax
 00702955    mov         eax,dword ptr [eax]
 00702957    call        dword ptr [eax+24]
 0070295A    call        @CheckAutoResult
 0070295F    mov         eax,dword ptr [ebp-84]
 00702965    push        eax
 00702966    mov         eax,dword ptr [eax]
 00702968    call        dword ptr [eax+20]
 0070296B    call        @CheckAutoResult
 00702970    mov         eax,dword ptr [ebp-80]
 00702973    push        eax
 00702974    mov         eax,dword ptr [eax]
 00702976    call        dword ptr [eax+2C]
 00702979    call        @CheckAutoResult
 0070297E    fld         qword ptr [ebp-64]
 00702981    fstp        dword ptr [ebp-50]
 00702984    wait
 00702985    push        dword ptr [ebp-8]
 00702988    lea         eax,[ebp-58]
 0070298B    push        eax
 0070298C    lea         eax,[ebp-4C]
 0070298F    push        eax
 00702990    call        d3dx9_33.D3DXMatrixRotationAxis
 00702995    mov         ecx,3
 0070299A    lea         ebx,[ebp-4C]
 0070299D    mov         eax,dword ptr [ebp-4]
 007029A0    mov         dword ptr [ebp-0C],eax
 007029A3    mov         eax,3
 007029A8    mov         edx,ebx
 007029AA    mov         esi,dword ptr [ebp-0C]
 007029AD    fld         dword ptr [edx]
 007029AF    fstp        qword ptr [esi]
 007029B1    wait
 007029B2    add         esi,8
 007029B5    add         edx,4
 007029B8    dec         eax
>007029B9    jne         007029AD
 007029BB    add         dword ptr [ebp-0C],18
 007029BF    add         ebx,10
 007029C2    dec         ecx
>007029C3    jne         007029A3
>007029C5    jmp         007029CF
 007029C7    mov         edx,dword ptr [ebp-4]
 007029CA    call        TExpression.GetRotMat
 007029CF    xor         eax,eax
 007029D1    pop         edx
 007029D2    pop         ecx
 007029D3    pop         ecx
 007029D4    mov         dword ptr fs:[eax],edx
 007029D7    push        702A27
 007029DC    lea         eax,[ebp-84]
 007029E2    call        @IntfClear
 007029E7    lea         eax,[ebp-80]
 007029EA    call        @IntfClear
 007029EF    lea         eax,[ebp-7C]
 007029F2    call        @IntfClear
 007029F7    lea         eax,[ebp-78]
 007029FA    call        @IntfClear
 007029FF    lea         eax,[ebp-74]
 00702A02    call        @IntfClear
 00702A07    lea         eax,[ebp-70]
 00702A0A    call        @IntfClear
 00702A0F    lea         eax,[ebp-6C]
 00702A12    call        @IntfClear
 00702A17    lea         eax,[ebp-68]
 00702A1A    call        @IntfClear
 00702A1F    ret
>00702A20    jmp         @HandleFinally
>00702A25    jmp         007029DC
 00702A27    pop         esi
 00702A28    pop         ebx
 00702A29    mov         esp,ebp
 00702A2B    pop         ebp
 00702A2C    ret
*}
end;

//00702A48
{*procedure TSpaceBallValue.GetString(?:?);
begin
 00702A48    push        ebx
 00702A49    push        esi
 00702A4A    mov         esi,edx
 00702A4C    mov         ebx,eax
 00702A4E    mov         eax,dword ptr [ebx+20];TSpaceBallValue................................Item:Integer
 00702A51    sub         eax,1
>00702A54    jae         00702A62
 00702A56    mov         edx,esi
 00702A58    mov         eax,ebx
 00702A5A    call        TExpression.GetString
 00702A5F    pop         esi
 00702A60    pop         ebx
 00702A61    ret
 00702A62    mov         edx,esi
 00702A64    mov         eax,ebx
 00702A66    call        TExpression.GetString
 00702A6B    pop         esi
 00702A6C    pop         ebx
 00702A6D    ret
end;*}

//00702A70
function TSpaceBallValue.GetUnits:TUnits;
begin
{*
 00702A70    mov         eax,dword ptr [eax+20];TSpaceBallValue.................................Item:Integer
 00702A73    sub         eax,1
>00702A76    jae         00702A7B
 00702A78    xor         eax,eax
 00702A7A    ret
 00702A7B    xor         eax,eax
 00702A7D    ret
*}
end;

//00702A80
procedure TSpaceBallValue.GetValue;
begin
{*
 00702A80    push        ebp
 00702A81    mov         ebp,esp
 00702A83    mov         ecx,2E
 00702A88    push        0
 00702A8A    push        0
 00702A8C    dec         ecx
>00702A8D    jne         00702A88
 00702A8F    push        ecx
 00702A90    push        ebx
 00702A91    push        esi
 00702A92    push        edi
 00702A93    xor         edx,edx
 00702A95    push        ebp
 00702A96    push        703659
 00702A9B    push        dword ptr fs:[edx]
 00702A9E    mov         dword ptr fs:[edx],esp
 00702AA1    mov         edx,dword ptr [eax+18];TSpaceBallValue.....................................................
 00702AA4    test        edx,edx
>00702AA6    jl          00702AB4
 00702AA8    dec         edx
>00702AA9    jg          00702AB4
 00702AAB    cmp         byte ptr ds:[8229B5],0;gvar_008229B5
>00702AB2    jne         00702AC1
 00702AB4    xor         eax,eax
 00702AB6    mov         dword ptr [ebp-8],eax
 00702AB9    mov         dword ptr [ebp-4],eax
>00702ABC    jmp         007034B4
 00702AC1    mov         edx,dword ptr [eax+20];TSpaceBallValue..................................Item:Integer
 00702AC4    mov         ecx,edx
 00702AC6    cmp         ecx,2D
>00702AC9    ja          007034AC
 00702ACF    movzx       ecx,byte ptr [ecx+702ADD]
 00702AD6    jmp         dword ptr [ecx*4+702B0B]
 00702AD6    db          1
 00702AD6    db          2
 00702AD6    db          3
 00702AD6    db          4
 00702AD6    db          5
 00702AD6    db          0
 00702AD6    db          8
 00702AD6    db          7
 00702AD6    db          6
 00702AD6    db          0
 00702AD6    db          9
 00702AD6    db          0
 00702AD6    db          12
 00702AD6    db          11
 00702AD6    db          13
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    db          10
 00702AD6    dd          007034AC
 00702AD6    dd          00702B43
 00702AD6    dd          00702B73
 00702AD6    dd          00702B82
 00702AD6    dd          00702BE2
 00702AD6    dd          00702C42
 00702AD6    dd          00702CA4
 00702AD6    dd          00702D04
 00702AD6    dd          00702D47
 00702AD6    dd          00702DA7
 00702AD6    dd          00702DEA
 00702AD6    dd          00702E6B
 00702AD6    dd          00703085
 00702AD6    dd          0070329A
 00702B43    lea         eax,[ebp-0D4]
 00702B49    push        eax
 00702B4A    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702B4F    push        eax
 00702B50    mov         eax,dword ptr [eax]
 00702B52    call        dword ptr [eax+30]
 00702B55    call        @CheckAutoResult
 00702B5A    cmp         word ptr [ebp-0D4],1
 00702B62    sbb         eax,eax
 00702B64    inc         eax
 00702B65    call        00686074
 00702B6A    fstp        qword ptr [ebp-8]
 00702B6D    wait
>00702B6E    jmp         007034B4
 00702B73    fild        dword ptr ds:[8229C4];gvar_008229C4:Single
 00702B79    fstp        qword ptr [ebp-8]
 00702B7C    wait
>00702B7D    jmp         007034B4
 00702B82    lea         eax,[ebp-0DC]
 00702B88    push        eax
 00702B89    lea         eax,[ebp-0E0]
 00702B8F    call        @IntfClear
 00702B94    push        eax
 00702B95    lea         eax,[ebp-0E4]
 00702B9B    call        @IntfClear
 00702BA0    push        eax
 00702BA1    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702BA6    push        eax
 00702BA7    mov         eax,dword ptr [eax]
 00702BA9    call        dword ptr [eax+24]
 00702BAC    call        @CheckAutoResult
 00702BB1    mov         eax,dword ptr [ebp-0E4]
 00702BB7    push        eax
 00702BB8    mov         eax,dword ptr [eax]
 00702BBA    call        dword ptr [eax+1C]
 00702BBD    call        @CheckAutoResult
 00702BC2    mov         eax,dword ptr [ebp-0E0]
 00702BC8    push        eax
 00702BC9    mov         eax,dword ptr [eax]
 00702BCB    call        dword ptr [eax+1C]
 00702BCE    call        @CheckAutoResult
 00702BD3    fld         qword ptr [ebp-0DC]
 00702BD9    fstp        qword ptr [ebp-8]
 00702BDC    wait
>00702BDD    jmp         007034B4
 00702BE2    lea         eax,[ebp-0DC]
 00702BE8    push        eax
 00702BE9    lea         eax,[ebp-0E8]
 00702BEF    call        @IntfClear
 00702BF4    push        eax
 00702BF5    lea         eax,[ebp-0EC]
 00702BFB    call        @IntfClear
 00702C00    push        eax
 00702C01    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702C06    push        eax
 00702C07    mov         eax,dword ptr [eax]
 00702C09    call        dword ptr [eax+24]
 00702C0C    call        @CheckAutoResult
 00702C11    mov         eax,dword ptr [ebp-0EC]
 00702C17    push        eax
 00702C18    mov         eax,dword ptr [eax]
 00702C1A    call        dword ptr [eax+1C]
 00702C1D    call        @CheckAutoResult
 00702C22    mov         eax,dword ptr [ebp-0E8]
 00702C28    push        eax
 00702C29    mov         eax,dword ptr [eax]
 00702C2B    call        dword ptr [eax+24]
 00702C2E    call        @CheckAutoResult
 00702C33    fld         qword ptr [ebp-0DC]
 00702C39    fstp        qword ptr [ebp-8]
 00702C3C    wait
>00702C3D    jmp         007034B4
 00702C42    lea         eax,[ebp-0DC]
 00702C48    push        eax
 00702C49    lea         eax,[ebp-0F0]
 00702C4F    call        @IntfClear
 00702C54    push        eax
 00702C55    lea         eax,[ebp-0F4]
 00702C5B    call        @IntfClear
 00702C60    push        eax
 00702C61    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702C66    push        eax
 00702C67    mov         eax,dword ptr [eax]
 00702C69    call        dword ptr [eax+24]
 00702C6C    call        @CheckAutoResult
 00702C71    mov         eax,dword ptr [ebp-0F4]
 00702C77    push        eax
 00702C78    mov         eax,dword ptr [eax]
 00702C7A    call        dword ptr [eax+1C]
 00702C7D    call        @CheckAutoResult
 00702C82    mov         eax,dword ptr [ebp-0F0]
 00702C88    push        eax
 00702C89    mov         eax,dword ptr [eax]
 00702C8B    call        dword ptr [eax+2C]
 00702C8E    call        @CheckAutoResult
 00702C93    fld         qword ptr [ebp-0DC]
 00702C99    fchs
 00702C9B    fstp        qword ptr [ebp-8]
 00702C9E    wait
>00702C9F    jmp         007034B4
 00702CA4    lea         eax,[ebp-0DC]
 00702CAA    push        eax
 00702CAB    lea         eax,[ebp-0F8]
 00702CB1    call        @IntfClear
 00702CB6    push        eax
 00702CB7    lea         eax,[ebp-0FC]
 00702CBD    call        @IntfClear
 00702CC2    push        eax
 00702CC3    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702CC8    push        eax
 00702CC9    mov         eax,dword ptr [eax]
 00702CCB    call        dword ptr [eax+24]
 00702CCE    call        @CheckAutoResult
 00702CD3    mov         eax,dword ptr [ebp-0FC]
 00702CD9    push        eax
 00702CDA    mov         eax,dword ptr [eax]
 00702CDC    call        dword ptr [eax+20]
 00702CDF    call        @CheckAutoResult
 00702CE4    mov         eax,dword ptr [ebp-0F8]
 00702CEA    push        eax
 00702CEB    mov         eax,dword ptr [eax]
 00702CED    call        dword ptr [eax+34]
 00702CF0    call        @CheckAutoResult
 00702CF5    fld         qword ptr [ebp-0DC]
 00702CFB    fstp        qword ptr [ebp-8]
 00702CFE    wait
>00702CFF    jmp         007034B4
 00702D04    lea         eax,[ebp-0DC]
 00702D0A    push        eax
 00702D0B    lea         eax,[ebp-100]
 00702D11    call        @IntfClear
 00702D16    push        eax
 00702D17    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702D1C    push        eax
 00702D1D    mov         eax,dword ptr [eax]
 00702D1F    call        dword ptr [eax+24]
 00702D22    call        @CheckAutoResult
 00702D27    mov         eax,dword ptr [ebp-100]
 00702D2D    push        eax
 00702D2E    mov         eax,dword ptr [eax]
 00702D30    call        dword ptr [eax+28]
 00702D33    call        @CheckAutoResult
 00702D38    fld         qword ptr [ebp-0DC]
 00702D3E    fstp        qword ptr [ebp-8]
 00702D41    wait
>00702D42    jmp         007034B4
 00702D47    lea         eax,[ebp-0DC]
 00702D4D    push        eax
 00702D4E    lea         eax,[ebp-104]
 00702D54    call        @IntfClear
 00702D59    push        eax
 00702D5A    lea         eax,[ebp-108]
 00702D60    call        @IntfClear
 00702D65    push        eax
 00702D66    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702D6B    push        eax
 00702D6C    mov         eax,dword ptr [eax]
 00702D6E    call        dword ptr [eax+24]
 00702D71    call        @CheckAutoResult
 00702D76    mov         eax,dword ptr [ebp-108]
 00702D7C    push        eax
 00702D7D    mov         eax,dword ptr [eax]
 00702D7F    call        dword ptr [eax+1C]
 00702D82    call        @CheckAutoResult
 00702D87    mov         eax,dword ptr [ebp-104]
 00702D8D    push        eax
 00702D8E    mov         eax,dword ptr [eax]
 00702D90    call        dword ptr [eax+34]
 00702D93    call        @CheckAutoResult
 00702D98    fld         qword ptr [ebp-0DC]
 00702D9E    fstp        qword ptr [ebp-8]
 00702DA1    wait
>00702DA2    jmp         007034B4
 00702DA7    lea         eax,[ebp-10C]
 00702DAD    push        eax
 00702DAE    lea         eax,[ebp-110]
 00702DB4    call        @IntfClear
 00702DB9    push        eax
 00702DBA    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702DBF    push        eax
 00702DC0    mov         eax,dword ptr [eax]
 00702DC2    call        dword ptr [eax+28]
 00702DC5    call        @CheckAutoResult
 00702DCA    mov         eax,dword ptr [ebp-110]
 00702DD0    push        eax
 00702DD1    mov         eax,dword ptr [eax]
 00702DD3    call        dword ptr [eax+1C]
 00702DD6    call        @CheckAutoResult
 00702DDB    fild        dword ptr [ebp-10C]
 00702DE1    fstp        qword ptr [ebp-8]
 00702DE4    wait
>00702DE5    jmp         007034B4
 00702DEA    mov         ebx,edx
 00702DEC    sub         ebx,0F
 00702DEF    inc         ebx
 00702DF0    xor         eax,eax
 00702DF2    push        ebp
 00702DF3    push        702E54
 00702DF8    push        dword ptr fs:[eax]
 00702DFB    mov         dword ptr fs:[eax],esp
 00702DFE    lea         eax,[ebp-0D4]
 00702E04    push        eax
 00702E05    push        ebx
 00702E06    lea         eax,[ebp-114]
 00702E0C    call        @IntfClear
 00702E11    push        eax
 00702E12    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702E17    push        eax
 00702E18    mov         eax,dword ptr [eax]
 00702E1A    call        dword ptr [eax+28]
 00702E1D    call        @CheckAutoResult
 00702E22    mov         eax,dword ptr [ebp-114]
 00702E28    push        eax
 00702E29    mov         eax,dword ptr [eax]
 00702E2B    call        dword ptr [eax+30]
 00702E2E    call        @CheckAutoResult
 00702E33    cmp         word ptr [ebp-0D4],1
 00702E3B    sbb         eax,eax
 00702E3D    inc         eax
 00702E3E    call        00686074
 00702E43    fstp        qword ptr [ebp-8]
 00702E46    wait
 00702E47    xor         eax,eax
 00702E49    pop         edx
 00702E4A    pop         ecx
 00702E4B    pop         ecx
 00702E4C    mov         dword ptr fs:[eax],edx
>00702E4F    jmp         007034B4
>00702E54    jmp         @HandleAnyException
 00702E59    xor         eax,eax
 00702E5B    mov         dword ptr [ebp-8],eax
 00702E5E    mov         dword ptr [ebp-4],eax
 00702E61    call        @DoneExcept
>00702E66    jmp         007034B4
 00702E6B    lea         eax,[ebp-0DC]
 00702E71    push        eax
 00702E72    lea         eax,[ebp-118]
 00702E78    call        @IntfClear
 00702E7D    push        eax
 00702E7E    lea         eax,[ebp-11C]
 00702E84    call        @IntfClear
 00702E89    push        eax
 00702E8A    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702E8F    push        eax
 00702E90    mov         eax,dword ptr [eax]
 00702E92    call        dword ptr [eax+24]
 00702E95    call        @CheckAutoResult
 00702E9A    mov         eax,dword ptr [ebp-11C]
 00702EA0    push        eax
 00702EA1    mov         eax,dword ptr [eax]
 00702EA3    call        dword ptr [eax+20]
 00702EA6    call        @CheckAutoResult
 00702EAB    mov         eax,dword ptr [ebp-118]
 00702EB1    push        eax
 00702EB2    mov         eax,dword ptr [eax]
 00702EB4    call        dword ptr [eax+34]
 00702EB7    call        @CheckAutoResult
 00702EBC    fld         qword ptr [ebp-0DC]
 00702EC2    fdiv        dword ptr ds:[703670];1600:Single
 00702EC8    fld         tbyte ptr ds:[703674];3.14159265358979:Extended
 00702ECE    fmulp       st(1),st
 00702ED0    fmul        dword ptr ds:[703680];6:Single
 00702ED6    fdiv        dword ptr ds:[703684];18:Single
 00702EDC    fstp        qword ptr [ebp-10]
 00702EDF    wait
 00702EE0    lea         eax,[ebp-0DC]
 00702EE6    push        eax
 00702EE7    lea         eax,[ebp-120]
 00702EED    call        @IntfClear
 00702EF2    push        eax
 00702EF3    lea         eax,[ebp-124]
 00702EF9    call        @IntfClear
 00702EFE    push        eax
 00702EFF    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702F04    push        eax
 00702F05    mov         eax,dword ptr [eax]
 00702F07    call        dword ptr [eax+24]
 00702F0A    call        @CheckAutoResult
 00702F0F    mov         eax,dword ptr [ebp-124]
 00702F15    push        eax
 00702F16    mov         eax,dword ptr [eax]
 00702F18    call        dword ptr [eax+20]
 00702F1B    call        @CheckAutoResult
 00702F20    mov         eax,dword ptr [ebp-120]
 00702F26    push        eax
 00702F27    mov         eax,dword ptr [eax]
 00702F29    call        dword ptr [eax+1C]
 00702F2C    call        @CheckAutoResult
 00702F31    fld         qword ptr [ebp-0DC]
 00702F37    fchs
 00702F39    fstp        dword ptr [ebp-44]
 00702F3C    wait
 00702F3D    lea         eax,[ebp-0DC]
 00702F43    push        eax
 00702F44    lea         eax,[ebp-128]
 00702F4A    call        @IntfClear
 00702F4F    push        eax
 00702F50    lea         eax,[ebp-12C]
 00702F56    call        @IntfClear
 00702F5B    push        eax
 00702F5C    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702F61    push        eax
 00702F62    mov         eax,dword ptr [eax]
 00702F64    call        dword ptr [eax+24]
 00702F67    call        @CheckAutoResult
 00702F6C    mov         eax,dword ptr [ebp-12C]
 00702F72    push        eax
 00702F73    mov         eax,dword ptr [eax]
 00702F75    call        dword ptr [eax+20]
 00702F78    call        @CheckAutoResult
 00702F7D    mov         eax,dword ptr [ebp-128]
 00702F83    push        eax
 00702F84    mov         eax,dword ptr [eax]
 00702F86    call        dword ptr [eax+24]
 00702F89    call        @CheckAutoResult
 00702F8E    fld         qword ptr [ebp-0DC]
 00702F94    fchs
 00702F96    fstp        dword ptr [ebp-40]
 00702F99    wait
 00702F9A    lea         eax,[ebp-0DC]
 00702FA0    push        eax
 00702FA1    lea         eax,[ebp-130]
 00702FA7    call        @IntfClear
 00702FAC    push        eax
 00702FAD    lea         eax,[ebp-134]
 00702FB3    call        @IntfClear
 00702FB8    push        eax
 00702FB9    mov         eax,[008229C0];gvar_008229C0:IInterface
 00702FBE    push        eax
 00702FBF    mov         eax,dword ptr [eax]
 00702FC1    call        dword ptr [eax+24]
 00702FC4    call        @CheckAutoResult
 00702FC9    mov         eax,dword ptr [ebp-134]
 00702FCF    push        eax
 00702FD0    mov         eax,dword ptr [eax]
 00702FD2    call        dword ptr [eax+20]
 00702FD5    call        @CheckAutoResult
 00702FDA    mov         eax,dword ptr [ebp-130]
 00702FE0    push        eax
 00702FE1    mov         eax,dword ptr [eax]
 00702FE3    call        dword ptr [eax+2C]
 00702FE6    call        @CheckAutoResult
 00702FEB    fld         qword ptr [ebp-0DC]
 00702FF1    fstp        dword ptr [ebp-3C]
 00702FF4    wait
 00702FF5    fld         qword ptr [ebp-10]
 00702FF8    add         esp,0FFFFFFFC
 00702FFB    fstp        dword ptr [esp]
 00702FFE    wait
 00702FFF    lea         eax,[ebp-44]
 00703002    push        eax
 00703003    lea         eax,[ebp-84]
 00703009    push        eax
 0070300A    call        d3dx9_33.D3DXMatrixRotationAxis
 0070300F    mov         ebx,3
 00703014    lea         eax,[ebp-84]
 0070301A    mov         dword ptr [ebp-2C],eax
 0070301D    lea         eax,[ebp-0D0]
 00703023    mov         dword ptr [ebp-30],eax
 00703026    mov         eax,3
 0070302B    mov         edx,dword ptr [ebp-2C]
 0070302E    mov         ecx,dword ptr [ebp-30]
 00703031    fld         dword ptr [edx]
 00703033    fstp        qword ptr [ecx]
 00703035    wait
 00703036    add         ecx,8
 00703039    add         edx,4
 0070303C    dec         eax
>0070303D    jne         00703031
 0070303F    add         dword ptr [ebp-30],18
 00703043    add         dword ptr [ebp-2C],10
 00703047    dec         ebx
>00703048    jne         00703026
 0070304A    lea         eax,[ebp-28]
 0070304D    push        eax
 0070304E    lea         ecx,[ebp-20]
 00703051    lea         edx,[ebp-18]
 00703054    lea         eax,[ebp-0D0]
 0070305A    call        005C3550
 0070305F    fld         qword ptr [ebp-18]
 00703062    fmul        dword ptr ds:[703670];1600:Single
 00703068    fld         tbyte ptr ds:[703674];3.14159265358979:Extended
 0070306E    fdivp       st(1),st
 00703070    fdiv        dword ptr ds:[703680];6:Single
 00703076    fmul        dword ptr ds:[703684];18:Single
 0070307C    fstp        qword ptr [ebp-8]
 0070307F    wait
>00703080    jmp         007034B4
 00703085    lea         eax,[ebp-0DC]
 0070308B    push        eax
 0070308C    lea         eax,[ebp-138]
 00703092    call        @IntfClear
 00703097    push        eax
 00703098    lea         eax,[ebp-13C]
 0070309E    call        @IntfClear
 007030A3    push        eax
 007030A4    mov         eax,[008229C0];gvar_008229C0:IInterface
 007030A9    push        eax
 007030AA    mov         eax,dword ptr [eax]
 007030AC    call        dword ptr [eax+24]
 007030AF    call        @CheckAutoResult
 007030B4    mov         eax,dword ptr [ebp-13C]
 007030BA    push        eax
 007030BB    mov         eax,dword ptr [eax]
 007030BD    call        dword ptr [eax+20]
 007030C0    call        @CheckAutoResult
 007030C5    mov         eax,dword ptr [ebp-138]
 007030CB    push        eax
 007030CC    mov         eax,dword ptr [eax]
 007030CE    call        dword ptr [eax+34]
 007030D1    call        @CheckAutoResult
 007030D6    fld         qword ptr [ebp-0DC]
 007030DC    fdiv        dword ptr ds:[703670];1600:Single
 007030E2    fld         tbyte ptr ds:[703674];3.14159265358979:Extended
 007030E8    fmulp       st(1),st
 007030EA    fmul        dword ptr ds:[703680];6:Single
 007030F0    fdiv        dword ptr ds:[703684];18:Single
 007030F6    fstp        qword ptr [ebp-10]
 007030F9    wait
 007030FA    lea         eax,[ebp-0DC]
 00703100    push        eax
 00703101    lea         eax,[ebp-140]
 00703107    call        @IntfClear
 0070310C    push        eax
 0070310D    lea         eax,[ebp-144]
 00703113    call        @IntfClear
 00703118    push        eax
 00703119    mov         eax,[008229C0];gvar_008229C0:IInterface
 0070311E    push        eax
 0070311F    mov         eax,dword ptr [eax]
 00703121    call        dword ptr [eax+24]
 00703124    call        @CheckAutoResult
 00703129    mov         eax,dword ptr [ebp-144]
 0070312F    push        eax
 00703130    mov         eax,dword ptr [eax]
 00703132    call        dword ptr [eax+20]
 00703135    call        @CheckAutoResult
 0070313A    mov         eax,dword ptr [ebp-140]
 00703140    push        eax
 00703141    mov         eax,dword ptr [eax]
 00703143    call        dword ptr [eax+1C]
 00703146    call        @CheckAutoResult
 0070314B    fld         qword ptr [ebp-0DC]
 00703151    fchs
 00703153    fstp        dword ptr [ebp-44]
 00703156    wait
 00703157    lea         eax,[ebp-0DC]
 0070315D    push        eax
 0070315E    lea         eax,[ebp-148]
 00703164    call        @IntfClear
 00703169    push        eax
 0070316A    lea         eax,[ebp-14C]
 00703170    call        @IntfClear
 00703175    push        eax
 00703176    mov         eax,[008229C0];gvar_008229C0:IInterface
 0070317B    push        eax
 0070317C    mov         eax,dword ptr [eax]
 0070317E    call        dword ptr [eax+24]
 00703181    call        @CheckAutoResult
 00703186    mov         eax,dword ptr [ebp-14C]
 0070318C    push        eax
 0070318D    mov         eax,dword ptr [eax]
 0070318F    call        dword ptr [eax+20]
 00703192    call        @CheckAutoResult
 00703197    mov         eax,dword ptr [ebp-148]
 0070319D    push        eax
 0070319E    mov         eax,dword ptr [eax]
 007031A0    call        dword ptr [eax+24]
 007031A3    call        @CheckAutoResult
 007031A8    fld         qword ptr [ebp-0DC]
 007031AE    fchs
 007031B0    fstp        dword ptr [ebp-40]
 007031B3    wait
 007031B4    lea         eax,[ebp-0DC]
 007031BA    push        eax
 007031BB    lea         eax,[ebp-150]
 007031C1    call        @IntfClear
 007031C6    push        eax
 007031C7    lea         eax,[ebp-154]
 007031CD    call        @IntfClear
 007031D2    push        eax
 007031D3    mov         eax,[008229C0];gvar_008229C0:IInterface
 007031D8    push        eax
 007031D9    mov         eax,dword ptr [eax]
 007031DB    call        dword ptr [eax+24]
 007031DE    call        @CheckAutoResult
 007031E3    mov         eax,dword ptr [ebp-154]
 007031E9    push        eax
 007031EA    mov         eax,dword ptr [eax]
 007031EC    call        dword ptr [eax+20]
 007031EF    call        @CheckAutoResult
 007031F4    mov         eax,dword ptr [ebp-150]
 007031FA    push        eax
 007031FB    mov         eax,dword ptr [eax]
 007031FD    call        dword ptr [eax+2C]
 00703200    call        @CheckAutoResult
 00703205    fld         qword ptr [ebp-0DC]
 0070320B    fstp        dword ptr [ebp-3C]
 0070320E    wait
 0070320F    fld         qword ptr [ebp-10]
 00703212    add         esp,0FFFFFFFC
 00703215    fstp        dword ptr [esp]
 00703218    wait
 00703219    lea         eax,[ebp-44]
 0070321C    push        eax
 0070321D    lea         eax,[ebp-84]
 00703223    push        eax
 00703224    call        d3dx9_33.D3DXMatrixRotationAxis
 00703229    mov         ebx,3
 0070322E    lea         edx,[ebp-84]
 00703234    lea         eax,[ebp-0D0]
 0070323A    mov         dword ptr [ebp-34],eax
 0070323D    mov         eax,3
 00703242    mov         esi,edx
 00703244    mov         ecx,dword ptr [ebp-34]
 00703247    fld         dword ptr [esi]
 00703249    fstp        qword ptr [ecx]
 0070324B    wait
 0070324C    add         ecx,8
 0070324F    add         esi,4
 00703252    dec         eax
>00703253    jne         00703247
 00703255    add         dword ptr [ebp-34],18
 00703259    add         edx,10
 0070325C    dec         ebx
>0070325D    jne         0070323D
 0070325F    lea         eax,[ebp-28]
 00703262    push        eax
 00703263    lea         ecx,[ebp-20]
 00703266    lea         edx,[ebp-18]
 00703269    lea         eax,[ebp-0D0]
 0070326F    call        005C3550
 00703274    fld         qword ptr [ebp-20]
 00703277    fmul        dword ptr ds:[703670];1600:Single
 0070327D    fld         tbyte ptr ds:[703674];3.14159265358979:Extended
 00703283    fdivp       st(1),st
 00703285    fdiv        dword ptr ds:[703680];6:Single
 0070328B    fmul        dword ptr ds:[703684];18:Single
 00703291    fstp        qword ptr [ebp-8]
 00703294    wait
>00703295    jmp         007034B4
 0070329A    lea         eax,[ebp-0DC]
 007032A0    push        eax
 007032A1    lea         eax,[ebp-158]
 007032A7    call        @IntfClear
 007032AC    push        eax
 007032AD    lea         eax,[ebp-15C]
 007032B3    call        @IntfClear
 007032B8    push        eax
 007032B9    mov         eax,[008229C0];gvar_008229C0:IInterface
 007032BE    push        eax
 007032BF    mov         eax,dword ptr [eax]
 007032C1    call        dword ptr [eax+24]
 007032C4    call        @CheckAutoResult
 007032C9    mov         eax,dword ptr [ebp-15C]
 007032CF    push        eax
 007032D0    mov         eax,dword ptr [eax]
 007032D2    call        dword ptr [eax+20]
 007032D5    call        @CheckAutoResult
 007032DA    mov         eax,dword ptr [ebp-158]
 007032E0    push        eax
 007032E1    mov         eax,dword ptr [eax]
 007032E3    call        dword ptr [eax+34]
 007032E6    call        @CheckAutoResult
 007032EB    fld         qword ptr [ebp-0DC]
 007032F1    fdiv        dword ptr ds:[703670];1600:Single
 007032F7    fld         tbyte ptr ds:[703674];3.14159265358979:Extended
 007032FD    fmulp       st(1),st
 007032FF    fmul        dword ptr ds:[703680];6:Single
 00703305    fdiv        dword ptr ds:[703684];18:Single
 0070330B    fstp        qword ptr [ebp-10]
 0070330E    wait
 0070330F    lea         eax,[ebp-0DC]
 00703315    push        eax
 00703316    lea         eax,[ebp-160]
 0070331C    call        @IntfClear
 00703321    push        eax
 00703322    lea         eax,[ebp-164]
 00703328    call        @IntfClear
 0070332D    push        eax
 0070332E    mov         eax,[008229C0];gvar_008229C0:IInterface
 00703333    push        eax
 00703334    mov         eax,dword ptr [eax]
 00703336    call        dword ptr [eax+24]
 00703339    call        @CheckAutoResult
 0070333E    mov         eax,dword ptr [ebp-164]
 00703344    push        eax
 00703345    mov         eax,dword ptr [eax]
 00703347    call        dword ptr [eax+20]
 0070334A    call        @CheckAutoResult
 0070334F    mov         eax,dword ptr [ebp-160]
 00703355    push        eax
 00703356    mov         eax,dword ptr [eax]
 00703358    call        dword ptr [eax+1C]
 0070335B    call        @CheckAutoResult
 00703360    fld         qword ptr [ebp-0DC]
 00703366    fchs
 00703368    fstp        dword ptr [ebp-44]
 0070336B    wait
 0070336C    lea         eax,[ebp-0DC]
 00703372    push        eax
 00703373    lea         eax,[ebp-168]
 00703379    call        @IntfClear
 0070337E    push        eax
 0070337F    lea         eax,[ebp-16C]
 00703385    call        @IntfClear
 0070338A    push        eax
 0070338B    mov         eax,[008229C0];gvar_008229C0:IInterface
 00703390    push        eax
 00703391    mov         eax,dword ptr [eax]
 00703393    call        dword ptr [eax+24]
 00703396    call        @CheckAutoResult
 0070339B    mov         eax,dword ptr [ebp-16C]
 007033A1    push        eax
 007033A2    mov         eax,dword ptr [eax]
 007033A4    call        dword ptr [eax+20]
 007033A7    call        @CheckAutoResult
 007033AC    mov         eax,dword ptr [ebp-168]
 007033B2    push        eax
 007033B3    mov         eax,dword ptr [eax]
 007033B5    call        dword ptr [eax+24]
 007033B8    call        @CheckAutoResult
 007033BD    fld         qword ptr [ebp-0DC]
 007033C3    fchs
 007033C5    fstp        dword ptr [ebp-40]
 007033C8    wait
 007033C9    lea         eax,[ebp-0DC]
 007033CF    push        eax
 007033D0    lea         eax,[ebp-170]
 007033D6    call        @IntfClear
 007033DB    push        eax
 007033DC    lea         eax,[ebp-174]
 007033E2    call        @IntfClear
 007033E7    push        eax
 007033E8    mov         eax,[008229C0];gvar_008229C0:IInterface
 007033ED    push        eax
 007033EE    mov         eax,dword ptr [eax]
 007033F0    call        dword ptr [eax+24]
 007033F3    call        @CheckAutoResult
 007033F8    mov         eax,dword ptr [ebp-174]
 007033FE    push        eax
 007033FF    mov         eax,dword ptr [eax]
 00703401    call        dword ptr [eax+20]
 00703404    call        @CheckAutoResult
 00703409    mov         eax,dword ptr [ebp-170]
 0070340F    push        eax
 00703410    mov         eax,dword ptr [eax]
 00703412    call        dword ptr [eax+2C]
 00703415    call        @CheckAutoResult
 0070341A    fld         qword ptr [ebp-0DC]
 00703420    fstp        dword ptr [ebp-3C]
 00703423    wait
 00703424    fld         qword ptr [ebp-10]
 00703427    add         esp,0FFFFFFFC
 0070342A    fstp        dword ptr [esp]
 0070342D    wait
 0070342E    lea         eax,[ebp-44]
 00703431    push        eax
 00703432    lea         eax,[ebp-84]
 00703438    push        eax
 00703439    call        d3dx9_33.D3DXMatrixRotationAxis
 0070343E    mov         ebx,3
 00703443    lea         edx,[ebp-84]
 00703449    lea         eax,[ebp-0D0]
 0070344F    mov         dword ptr [ebp-38],eax
 00703452    mov         eax,3
 00703457    mov         esi,edx
 00703459    mov         ecx,dword ptr [ebp-38]
 0070345C    fld         dword ptr [esi]
 0070345E    fstp        qword ptr [ecx]
 00703460    wait
 00703461    add         ecx,8
 00703464    add         esi,4
 00703467    dec         eax
>00703468    jne         0070345C
 0070346A    add         dword ptr [ebp-38],18
 0070346E    add         edx,10
 00703471    dec         ebx
>00703472    jne         00703452
 00703474    lea         eax,[ebp-28]
 00703477    push        eax
 00703478    lea         ecx,[ebp-20]
 0070347B    lea         edx,[ebp-18]
 0070347E    lea         eax,[ebp-0D0]
 00703484    call        005C3550
 00703489    fld         qword ptr [ebp-28]
 0070348C    fmul        dword ptr ds:[703670];1600:Single
 00703492    fld         tbyte ptr ds:[703674];3.14159265358979:Extended
 00703498    fdivp       st(1),st
 0070349A    fdiv        dword ptr ds:[703680];6:Single
 007034A0    fmul        dword ptr ds:[703684];18:Single
 007034A6    fstp        qword ptr [ebp-8]
 007034A9    wait
>007034AA    jmp         007034B4
 007034AC    xor         eax,eax
 007034AE    mov         dword ptr [ebp-8],eax
 007034B1    mov         dword ptr [ebp-4],eax
 007034B4    xor         eax,eax
 007034B6    pop         edx
 007034B7    pop         ecx
 007034B8    pop         ecx
 007034B9    mov         dword ptr fs:[eax],edx
 007034BC    push        703663
 007034C1    lea         eax,[ebp-174]
 007034C7    call        @IntfClear
 007034CC    lea         eax,[ebp-170]
 007034D2    call        @IntfClear
 007034D7    lea         eax,[ebp-16C]
 007034DD    call        @IntfClear
 007034E2    lea         eax,[ebp-168]
 007034E8    call        @IntfClear
 007034ED    lea         eax,[ebp-164]
 007034F3    call        @IntfClear
 007034F8    lea         eax,[ebp-160]
 007034FE    call        @IntfClear
 00703503    lea         eax,[ebp-15C]
 00703509    call        @IntfClear
 0070350E    lea         eax,[ebp-158]
 00703514    call        @IntfClear
 00703519    lea         eax,[ebp-154]
 0070351F    call        @IntfClear
 00703524    lea         eax,[ebp-150]
 0070352A    call        @IntfClear
 0070352F    lea         eax,[ebp-14C]
 00703535    call        @IntfClear
 0070353A    lea         eax,[ebp-148]
 00703540    call        @IntfClear
 00703545    lea         eax,[ebp-144]
 0070354B    call        @IntfClear
 00703550    lea         eax,[ebp-140]
 00703556    call        @IntfClear
 0070355B    lea         eax,[ebp-13C]
 00703561    call        @IntfClear
 00703566    lea         eax,[ebp-138]
 0070356C    call        @IntfClear
 00703571    lea         eax,[ebp-134]
 00703577    call        @IntfClear
 0070357C    lea         eax,[ebp-130]
 00703582    call        @IntfClear
 00703587    lea         eax,[ebp-12C]
 0070358D    call        @IntfClear
 00703592    lea         eax,[ebp-128]
 00703598    call        @IntfClear
 0070359D    lea         eax,[ebp-124]
 007035A3    call        @IntfClear
 007035A8    lea         eax,[ebp-120]
 007035AE    call        @IntfClear
 007035B3    lea         eax,[ebp-11C]
 007035B9    call        @IntfClear
 007035BE    lea         eax,[ebp-118]
 007035C4    call        @IntfClear
 007035C9    lea         eax,[ebp-114]
 007035CF    mov         edx,dword ptr ds:[7019F8];IKeyboard
 007035D5    mov         ecx,2
 007035DA    call        @FinalizeArray
 007035DF    lea         eax,[ebp-108]
 007035E5    call        @IntfClear
 007035EA    lea         eax,[ebp-104]
 007035F0    call        @IntfClear
 007035F5    lea         eax,[ebp-100]
 007035FB    mov         edx,dword ptr ds:[7019C0];ISensor
 00703601    mov         ecx,2
 00703606    call        @FinalizeArray
 0070360B    lea         eax,[ebp-0F8]
 00703611    call        @IntfClear
 00703616    lea         eax,[ebp-0F4]
 0070361C    call        @IntfClear
 00703621    lea         eax,[ebp-0F0]
 00703627    call        @IntfClear
 0070362C    lea         eax,[ebp-0EC]
 00703632    call        @IntfClear
 00703637    lea         eax,[ebp-0E8]
 0070363D    call        @IntfClear
 00703642    lea         eax,[ebp-0E4]
 00703648    call        @IntfClear
 0070364D    lea         eax,[ebp-0E0]
 00703653    call        @IntfClear
 00703658    ret
>00703659    jmp         @HandleFinally
>0070365E    jmp         007034C1
 00703663    fld         qword ptr [ebp-8]
 00703666    pop         edi
 00703667    pop         esi
 00703668    pop         ebx
 00703669    mov         esp,ebp
 0070366B    pop         ebp
 0070366C    ret
*}
end;

//00703688
procedure TSpaceBallValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 00703688    push        ebp
 00703689    mov         ebp,esp
 0070368B    push        ecx
 0070368C    mov         ecx,7
 00703691    push        0
 00703693    push        0
 00703695    dec         ecx
>00703696    jne         00703691
 00703698    push        ecx
 00703699    xchg        ecx,dword ptr [ebp-4]
 0070369C    push        ebx
 0070369D    mov         dword ptr [ebp-8],ecx
 007036A0    mov         dword ptr [ebp-4],edx
 007036A3    xor         edx,edx
 007036A5    push        ebp
 007036A6    push        703949
 007036AB    push        dword ptr fs:[edx]
 007036AE    mov         dword ptr fs:[edx],esp
 007036B1    mov         edx,dword ptr [eax+18];TSpaceBallValue.....................................................
 007036B4    test        edx,edx
>007036B6    jl          007036C4
 007036B8    dec         edx
>007036B9    jg          007036C4
 007036BB    cmp         byte ptr ds:[8229B5],0;gvar_008229B5
>007036C2    jne         007036E7
 007036C4    mov         eax,dword ptr [ebp-4]
 007036C7    xor         edx,edx
 007036C9    mov         dword ptr [eax],edx
 007036CB    mov         dword ptr [eax+4],edx
 007036CE    mov         eax,dword ptr [ebp-8]
 007036D1    xor         edx,edx
 007036D3    mov         dword ptr [eax],edx
 007036D5    mov         dword ptr [eax+4],edx
 007036D8    mov         eax,dword ptr [ebp+8]
 007036DB    xor         edx,edx
 007036DD    mov         dword ptr [eax],edx
 007036DF    mov         dword ptr [eax+4],edx
>007036E2    jmp         007038DB
 007036E7    mov         edx,dword ptr [eax+20];TSpaceBallValue...................................Item:Integer
 007036EA    sub         edx,5
>007036ED    je          007036FD
 007036EF    sub         edx,4
>007036F2    je          007037E5
>007036F8    jmp         007038CC
 007036FD    lea         eax,[ebp-10]
 00703700    push        eax
 00703701    lea         eax,[ebp-14]
 00703704    call        @IntfClear
 00703709    push        eax
 0070370A    lea         eax,[ebp-18]
 0070370D    call        @IntfClear
 00703712    push        eax
 00703713    mov         eax,[008229C0];gvar_008229C0:IInterface
 00703718    push        eax
 00703719    mov         eax,dword ptr [eax]
 0070371B    call        dword ptr [eax+24]
 0070371E    call        @CheckAutoResult
 00703723    mov         eax,dword ptr [ebp-18]
 00703726    push        eax
 00703727    mov         eax,dword ptr [eax]
 00703729    call        dword ptr [eax+1C]
 0070372C    call        @CheckAutoResult
 00703731    mov         eax,dword ptr [ebp-14]
 00703734    push        eax
 00703735    mov         eax,dword ptr [eax]
 00703737    call        dword ptr [eax+1C]
 0070373A    call        @CheckAutoResult
 0070373F    fld         qword ptr [ebp-10]
 00703742    mov         eax,dword ptr [ebp-4]
 00703745    fstp        qword ptr [eax]
 00703747    wait
 00703748    lea         eax,[ebp-10]
 0070374B    push        eax
 0070374C    lea         eax,[ebp-1C]
 0070374F    call        @IntfClear
 00703754    push        eax
 00703755    lea         eax,[ebp-20]
 00703758    call        @IntfClear
 0070375D    push        eax
 0070375E    mov         eax,[008229C0];gvar_008229C0:IInterface
 00703763    push        eax
 00703764    mov         eax,dword ptr [eax]
 00703766    call        dword ptr [eax+24]
 00703769    call        @CheckAutoResult
 0070376E    mov         eax,dword ptr [ebp-20]
 00703771    push        eax
 00703772    mov         eax,dword ptr [eax]
 00703774    call        dword ptr [eax+1C]
 00703777    call        @CheckAutoResult
 0070377C    mov         eax,dword ptr [ebp-1C]
 0070377F    push        eax
 00703780    mov         eax,dword ptr [eax]
 00703782    call        dword ptr [eax+24]
 00703785    call        @CheckAutoResult
 0070378A    fld         qword ptr [ebp-10]
 0070378D    mov         eax,dword ptr [ebp-8]
 00703790    fstp        qword ptr [eax]
 00703792    wait
 00703793    lea         eax,[ebp-10]
 00703796    push        eax
 00703797    lea         eax,[ebp-24]
 0070379A    call        @IntfClear
 0070379F    push        eax
 007037A0    lea         eax,[ebp-28]
 007037A3    call        @IntfClear
 007037A8    push        eax
 007037A9    mov         eax,[008229C0];gvar_008229C0:IInterface
 007037AE    push        eax
 007037AF    mov         eax,dword ptr [eax]
 007037B1    call        dword ptr [eax+24]
 007037B4    call        @CheckAutoResult
 007037B9    mov         eax,dword ptr [ebp-28]
 007037BC    push        eax
 007037BD    mov         eax,dword ptr [eax]
 007037BF    call        dword ptr [eax+1C]
 007037C2    call        @CheckAutoResult
 007037C7    mov         eax,dword ptr [ebp-24]
 007037CA    push        eax
 007037CB    mov         eax,dword ptr [eax]
 007037CD    call        dword ptr [eax+2C]
 007037D0    call        @CheckAutoResult
 007037D5    fld         qword ptr [ebp-10]
 007037D8    fchs
 007037DA    mov         eax,dword ptr [ebp+8]
 007037DD    fstp        qword ptr [eax]
 007037DF    wait
>007037E0    jmp         007038DB
 007037E5    lea         eax,[ebp-10]
 007037E8    push        eax
 007037E9    lea         eax,[ebp-2C]
 007037EC    call        @IntfClear
 007037F1    push        eax
 007037F2    lea         eax,[ebp-30]
 007037F5    call        @IntfClear
 007037FA    push        eax
 007037FB    mov         eax,[008229C0];gvar_008229C0:IInterface
 00703800    push        eax
 00703801    mov         eax,dword ptr [eax]
 00703803    call        dword ptr [eax+24]
 00703806    call        @CheckAutoResult
 0070380B    mov         eax,dword ptr [ebp-30]
 0070380E    push        eax
 0070380F    mov         eax,dword ptr [eax]
 00703811    call        dword ptr [eax+20]
 00703814    call        @CheckAutoResult
 00703819    mov         eax,dword ptr [ebp-2C]
 0070381C    push        eax
 0070381D    mov         eax,dword ptr [eax]
 0070381F    call        dword ptr [eax+1C]
 00703822    call        @CheckAutoResult
 00703827    fld         qword ptr [ebp-10]
 0070382A    fchs
 0070382C    mov         eax,dword ptr [ebp-4]
 0070382F    fstp        qword ptr [eax]
 00703831    wait
 00703832    lea         eax,[ebp-10]
 00703835    push        eax
 00703836    lea         eax,[ebp-34]
 00703839    call        @IntfClear
 0070383E    push        eax
 0070383F    lea         eax,[ebp-38]
 00703842    call        @IntfClear
 00703847    push        eax
 00703848    mov         eax,[008229C0];gvar_008229C0:IInterface
 0070384D    push        eax
 0070384E    mov         eax,dword ptr [eax]
 00703850    call        dword ptr [eax+24]
 00703853    call        @CheckAutoResult
 00703858    mov         eax,dword ptr [ebp-38]
 0070385B    push        eax
 0070385C    mov         eax,dword ptr [eax]
 0070385E    call        dword ptr [eax+20]
 00703861    call        @CheckAutoResult
 00703866    mov         eax,dword ptr [ebp-34]
 00703869    push        eax
 0070386A    mov         eax,dword ptr [eax]
 0070386C    call        dword ptr [eax+24]
 0070386F    call        @CheckAutoResult
 00703874    fld         qword ptr [ebp-10]
 00703877    fchs
 00703879    mov         eax,dword ptr [ebp-8]
 0070387C    fstp        qword ptr [eax]
 0070387E    wait
 0070387F    lea         eax,[ebp-10]
 00703882    push        eax
 00703883    lea         eax,[ebp-3C]
 00703886    call        @IntfClear
 0070388B    push        eax
 0070388C    lea         eax,[ebp-40]
 0070388F    call        @IntfClear
 00703894    push        eax
 00703895    mov         eax,[008229C0];gvar_008229C0:IInterface
 0070389A    push        eax
 0070389B    mov         eax,dword ptr [eax]
 0070389D    call        dword ptr [eax+24]
 007038A0    call        @CheckAutoResult
 007038A5    mov         eax,dword ptr [ebp-40]
 007038A8    push        eax
 007038A9    mov         eax,dword ptr [eax]
 007038AB    call        dword ptr [eax+20]
 007038AE    call        @CheckAutoResult
 007038B3    mov         eax,dword ptr [ebp-3C]
 007038B6    push        eax
 007038B7    mov         eax,dword ptr [eax]
 007038B9    call        dword ptr [eax+2C]
 007038BC    call        @CheckAutoResult
 007038C1    fld         qword ptr [ebp-10]
 007038C4    mov         eax,dword ptr [ebp+8]
 007038C7    fstp        qword ptr [eax]
 007038C9    wait
>007038CA    jmp         007038DB
 007038CC    mov         edx,dword ptr [ebp+8]
 007038CF    push        edx
 007038D0    mov         ecx,dword ptr [ebp-8]
 007038D3    mov         edx,dword ptr [ebp-4]
 007038D6    call        TExpression.GetVector
 007038DB    xor         eax,eax
 007038DD    pop         edx
 007038DE    pop         ecx
 007038DF    pop         ecx
 007038E0    mov         dword ptr fs:[eax],edx
 007038E3    push        703950
 007038E8    lea         eax,[ebp-40]
 007038EB    call        @IntfClear
 007038F0    lea         eax,[ebp-3C]
 007038F3    call        @IntfClear
 007038F8    lea         eax,[ebp-38]
 007038FB    call        @IntfClear
 00703900    lea         eax,[ebp-34]
 00703903    call        @IntfClear
 00703908    lea         eax,[ebp-30]
 0070390B    call        @IntfClear
 00703910    lea         eax,[ebp-2C]
 00703913    call        @IntfClear
 00703918    lea         eax,[ebp-28]
 0070391B    call        @IntfClear
 00703920    lea         eax,[ebp-24]
 00703923    call        @IntfClear
 00703928    lea         eax,[ebp-20]
 0070392B    call        @IntfClear
 00703930    lea         eax,[ebp-1C]
 00703933    call        @IntfClear
 00703938    lea         eax,[ebp-18]
 0070393B    call        @IntfClear
 00703940    lea         eax,[ebp-14]
 00703943    call        @IntfClear
 00703948    ret
>00703949    jmp         @HandleFinally
>0070394E    jmp         007038E8
 00703950    pop         ebx
 00703951    mov         esp,ebp
 00703953    pop         ebp
 00703954    ret         4
*}
end;

//00703958
function TSpaceBallValue.Module:TObject;
begin
{*
 00703958    mov         eax,[008229BC];gvar_008229BC:TModuleSpaceball
 0070395D    ret
*}
end;

//00703960
procedure TSpaceBallValue.SetValue(NewValue:Double);
begin
{*
 00703960    push        ebp
 00703961    mov         ebp,esp
 00703963    mov         edx,dword ptr [eax+18];TSpaceBallValue.....................................................
 00703966    test        edx,edx
>00703968    jl          0070396D
 0070396A    dec         edx
>0070396B    jle         00703971
 0070396D    xor         eax,eax
>0070396F    jmp         0070397F
 00703971    mov         eax,dword ptr [eax+20];TSpaceBallValue....................................Item:Integer
 00703974    sub         eax,1
>00703977    jae         0070397D
 00703979    xor         eax,eax
>0070397B    jmp         0070397F
 0070397D    xor         eax,eax
 0070397F    pop         ebp
 00703980    ret         8
*}
end;

//00703984
{*procedure TSpaceBallValue.ToString(?:?);
begin
 00703984    push        ebp
 00703985    mov         ebp,esp
 00703987    push        0
 00703989    push        ebx
 0070398A    push        esi
 0070398B    mov         esi,edx
 0070398D    mov         ebx,eax
 0070398F    xor         eax,eax
 00703991    push        ebp
 00703992    push        7039D5
 00703997    push        dword ptr fs:[eax]
 0070399A    mov         dword ptr fs:[eax],esp
 0070399D    lea         ecx,[ebp-4]
 007039A0    mov         eax,[008229BC];gvar_008229BC:TModuleSpaceball
 007039A5    mov         eax,dword ptr [eax+1C]
 007039A8    mov         edx,dword ptr [ebx+20];TSpaceBallValue.....................................Item:Integer
 007039AB    call        THashTable.Get
 007039B0    mov         ecx,dword ptr [ebp-4]
 007039B3    mov         eax,esi
 007039B5    mov         edx,7039F0;'SpaceBall.'
 007039BA    call        @UStrCat3
 007039BF    xor         eax,eax
 007039C1    pop         edx
 007039C2    pop         ecx
 007039C3    pop         ecx
 007039C4    mov         dword ptr fs:[eax],edx
 007039C7    push        7039DC
 007039CC    lea         eax,[ebp-4]
 007039CF    call        @UStrClr
 007039D4    ret
>007039D5    jmp         @HandleFinally
>007039DA    jmp         007039CC
 007039DC    pop         esi
 007039DD    pop         ebx
 007039DE    pop         ecx
 007039DF    pop         ebp
 007039E0    ret
end;*}

//00703A08
procedure sub_00703A08;
begin
{*
 00703A08    mov         byte ptr ds:[8229B4],0;gvar_008229B4
 00703A0F    ret
*}
end;

//00703A10
procedure sub_00703A10;
begin
{*
 00703A10    ret
*}
end;

//00703A14
procedure sub_00703A14;
begin
{*
 00703A14    push        ebp
 00703A15    mov         ebp,esp
 00703A17    add         esp,0FFFFFFF4
 00703A1A    push        ebx
 00703A1B    push        esi
 00703A1C    push        edi
 00703A1D    xor         eax,eax
 00703A1F    mov         dword ptr [ebp-4],eax
 00703A22    xor         eax,eax
 00703A24    push        ebp
 00703A25    push        703B52
 00703A2A    push        dword ptr fs:[eax]
 00703A2D    mov         dword ptr fs:[eax],esp
 00703A30    cmp         byte ptr ds:[8229B4],0;gvar_008229B4
>00703A37    je          00703B3C
 00703A3D    xor         eax,eax
 00703A3F    push        ebp
 00703A40    push        703B13
 00703A45    push        dword ptr fs:[eax]
 00703A48    mov         dword ptr fs:[eax],esp
 00703A4B    lea         edx,[ebp-4]
 00703A4E    mov         eax,[00701A6C];CoDevice
 00703A53    call        CoDevice.Create
 00703A58    mov         edx,dword ptr [ebp-4]
 00703A5B    mov         eax,8229C0;gvar_008229C0:IInterface
 00703A60    call        @IntfCopy
 00703A65    cmp         dword ptr ds:[8229C0],0;gvar_008229C0:IInterface
>00703A6C    jne         00703A82
 00703A6E    mov         byte ptr ds:[8229B5],0;gvar_008229B5
 00703A75    xor         eax,eax
 00703A77    pop         edx
 00703A78    pop         ecx
 00703A79    pop         ecx
 00703A7A    mov         dword ptr fs:[eax],edx
>00703A7D    jmp         00703B3C
 00703A82    mov         eax,[008229C0];gvar_008229C0:IInterface
 00703A87    push        eax
 00703A88    mov         eax,dword ptr [eax]
 00703A8A    call        dword ptr [eax+1C]
 00703A8D    call        @CheckAutoResult
 00703A92    push        703B64
 00703A97    mov         eax,[008229C0];gvar_008229C0:IInterface
 00703A9C    push        eax
 00703A9D    mov         eax,dword ptr [eax]
 00703A9F    call        dword ptr [eax+34]
 00703AA2    call        @CheckAutoResult
 00703AA7    lea         eax,[ebp-8]
 00703AAA    push        eax
 00703AAB    mov         eax,[008229C0];gvar_008229C0:IInterface
 00703AB0    push        eax
 00703AB1    mov         eax,dword ptr [eax]
 00703AB3    call        dword ptr [eax+30]
 00703AB6    call        @CheckAutoResult
 00703ABB    cmp         word ptr [ebp-8],0
>00703AC0    jne         00703AED
 00703AC2    mov         eax,[008229C0];gvar_008229C0:IInterface
 00703AC7    push        eax
 00703AC8    mov         eax,dword ptr [eax]
 00703ACA    call        dword ptr [eax+20]
 00703ACD    call        @CheckAutoResult
 00703AD2    mov         eax,8229C0;gvar_008229C0:IInterface
 00703AD7    call        @IntfClear
 00703ADC    mov         byte ptr ds:[8229B5],0;gvar_008229B5
 00703AE3    xor         eax,eax
 00703AE5    pop         edx
 00703AE6    pop         ecx
 00703AE7    pop         ecx
 00703AE8    mov         dword ptr fs:[eax],edx
>00703AEB    jmp         00703B3C
 00703AED    lea         eax,[ebp-0C]
 00703AF0    push        eax
 00703AF1    mov         eax,[008229C0];gvar_008229C0:IInterface
 00703AF6    push        eax
 00703AF7    mov         eax,dword ptr [eax]
 00703AF9    call        dword ptr [eax+2C]
 00703AFC    call        @CheckAutoResult
 00703B01    mov         eax,dword ptr [ebp-0C]
 00703B04    mov         [008229C4],eax;gvar_008229C4:Single
 00703B09    xor         eax,eax
 00703B0B    pop         edx
 00703B0C    pop         ecx
 00703B0D    pop         ecx
 00703B0E    mov         dword ptr fs:[eax],edx
>00703B11    jmp         00703B35
>00703B13    jmp         @HandleAnyException
 00703B18    mov         eax,8229C0;gvar_008229C0:IInterface
 00703B1D    call        @IntfClear
 00703B22    mov         byte ptr ds:[8229B5],0;gvar_008229B5
 00703B29    call        @DoneExcept
>00703B2E    jmp         00703B3C
 00703B30    call        @DoneExcept
 00703B35    mov         byte ptr ds:[8229B5],1;gvar_008229B5
 00703B3C    xor         eax,eax
 00703B3E    pop         edx
 00703B3F    pop         ecx
 00703B40    pop         ecx
 00703B41    mov         dword ptr fs:[eax],edx
 00703B44    push        703B59
 00703B49    lea         eax,[ebp-4]
 00703B4C    call        @IntfClear
 00703B51    ret
>00703B52    jmp         @HandleFinally
>00703B57    jmp         00703B49
 00703B59    pop         edi
 00703B5A    pop         esi
 00703B5B    pop         ebx
 00703B5C    mov         esp,ebp
 00703B5E    pop         ebp
 00703B5F    ret
*}
end;

//00703B78
procedure sub_00703B78;
begin
{*
 00703B78    movzx       eax,byte ptr ds:[8229B4];gvar_008229B4
 00703B7F    and         al,byte ptr ds:[8229B5];gvar_008229B5
>00703B85    je          00703BA8
 00703B87    mov         eax,[008229C0];gvar_008229C0:IInterface
 00703B8C    push        eax
 00703B8D    mov         eax,dword ptr [eax]
 00703B8F    call        dword ptr [eax+20]
 00703B92    call        @CheckAutoResult
 00703B97    mov         eax,8229C0;gvar_008229C0:IInterface
 00703B9C    call        @IntfClear
 00703BA1    mov         byte ptr ds:[8229B5],0;gvar_008229B5
 00703BA8    ret
*}
end;

//00703BAC
procedure TModuleSpaceball.AddFields;
begin
{*
 00703BAC    push        ebp
 00703BAD    mov         ebp,esp
 00703BAF    push        0
 00703BB1    push        0
 00703BB3    push        ebx
 00703BB4    push        esi
 00703BB5    mov         ebx,eax
 00703BB7    xor         eax,eax
 00703BB9    push        ebp
 00703BBA    push        703D23
 00703BBF    push        dword ptr fs:[eax]
 00703BC2    mov         dword ptr fs:[eax],esp
 00703BC5    mov         eax,ebx
 00703BC7    call        TPieModule.AddFields
 00703BCC    xor         ecx,ecx
 00703BCE    mov         edx,703D3C;'Exists'
 00703BD3    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703BD6    call        THashTable.Add
 00703BDB    mov         ecx,2C
 00703BE0    mov         edx,703D58;'ApplicationPanel'
 00703BE5    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703BE8    call        THashTable.Add
 00703BED    mov         ecx,2D
 00703BF2    mov         edx,703D88;'Fit'
 00703BF7    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703BFA    call        THashTable.Add
 00703BFF    mov         esi,1
 00703C04    lea         edx,[ebp-8]
 00703C07    mov         eax,esi
 00703C09    call        IntToStr
 00703C0E    mov         ecx,dword ptr [ebp-8]
 00703C11    lea         eax,[ebp-4]
 00703C14    mov         edx,703D9C;'Button'
 00703C19    call        @UStrCat3
 00703C1E    mov         edx,dword ptr [ebp-4]
 00703C21    lea         ecx,[esi+0F]
 00703C24    dec         ecx
 00703C25    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703C28    call        THashTable.Add
 00703C2D    inc         esi
 00703C2E    cmp         esi,20
>00703C31    jne         00703C04
 00703C33    xor         ecx,ecx
 00703C35    mov         edx,703D3C;'Exists'
 00703C3A    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703C3D    call        THashTable.Add
 00703C42    mov         ecx,1
 00703C47    mov         edx,703DB8;'Type'
 00703C4C    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703C4F    call        THashTable.Add
 00703C54    mov         ecx,2
 00703C59    mov         edx,703DD0;'x'
 00703C5E    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703C61    call        THashTable.Add
 00703C66    mov         ecx,3
 00703C6B    mov         edx,703DE0;'y'
 00703C70    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703C73    call        THashTable.Add
 00703C78    mov         ecx,4
 00703C7D    mov         edx,703DF0;'z'
 00703C82    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703C85    call        THashTable.Add
 00703C8A    mov         ecx,0C
 00703C8F    mov         edx,703E00;'Pitch'
 00703C94    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703C97    call        THashTable.Add
 00703C9C    mov         ecx,0D
 00703CA1    mov         edx,703E18;'Yaw'
 00703CA6    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703CA9    call        THashTable.Add
 00703CAE    mov         ecx,0E
 00703CB3    mov         edx,703E2C;'Roll'
 00703CB8    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703CBB    call        THashTable.Add
 00703CC0    mov         ecx,0B
 00703CC5    mov         edx,703E44;'RotMat'
 00703CCA    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703CCD    call        THashTable.Add
 00703CD2    mov         ecx,9
 00703CD7    mov         edx,703E60;'Axis'
 00703CDC    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703CDF    call        THashTable.Add
 00703CE4    mov         ecx,8
 00703CE9    mov         edx,703E78;'AxisAngle'
 00703CEE    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703CF1    call        THashTable.Add
 00703CF6    mov         ecx,7
 00703CFB    mov         edx,703E98;'Period'
 00703D00    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703D03    call        THashTable.Add
 00703D08    xor         eax,eax
 00703D0A    pop         edx
 00703D0B    pop         ecx
 00703D0C    pop         ecx
 00703D0D    mov         dword ptr fs:[eax],edx
 00703D10    push        703D2A
 00703D15    lea         eax,[ebp-8]
 00703D18    mov         edx,2
 00703D1D    call        @UStrArrayClr
 00703D22    ret
>00703D23    jmp         @HandleFinally
>00703D28    jmp         00703D15
 00703D2A    pop         esi
 00703D2B    pop         ebx
 00703D2C    pop         ecx
 00703D2D    pop         ecx
 00703D2E    pop         ebp
 00703D2F    ret
*}
end;

//00703EA8
procedure TModuleSpaceball.ClearRead;
begin
{*
 00703EA8    call        TPieModule.ClearRead
 00703EAD    ret
*}
end;

//00703EB0
constructor TModuleSpaceball.Create;
begin
{*
 00703EB0    push        ebx
 00703EB1    push        esi
 00703EB2    test        dl,dl
>00703EB4    je          00703EBE
 00703EB6    add         esp,0FFFFFFF0
 00703EB9    call        @ClassCreate
 00703EBE    mov         ebx,edx
 00703EC0    mov         esi,eax
 00703EC2    push        0
 00703EC4    push        0
 00703EC6    push        0
 00703EC8    push        0
 00703ECA    mov         ecx,703F00;'Spaceball'
 00703ECF    xor         edx,edx
 00703ED1    mov         eax,esi
 00703ED3    call        005E4830
 00703ED8    mov         eax,esi
 00703EDA    test        bl,bl
>00703EDC    je          00703EED
 00703EDE    call        @AfterConstruction
 00703EE3    pop         dword ptr fs:[0]
 00703EEA    add         esp,0C
 00703EED    mov         eax,esi
 00703EEF    pop         esi
 00703EF0    pop         ebx
 00703EF1    ret
*}
end;

//00703F14
function TModuleSpaceball.CreateValue(Identifier:string):TExpression;
begin
{*
 00703F14    push        ebp
 00703F15    mov         ebp,esp
 00703F17    push        ecx
 00703F18    push        ebx
 00703F19    mov         dword ptr [ebp-4],edx
 00703F1C    mov         ebx,eax
 00703F1E    mov         eax,dword ptr [ebp-4]
 00703F21    call        @UStrAddRef
 00703F26    xor         eax,eax
 00703F28    push        ebp
 00703F29    push        703F58
 00703F2E    push        dword ptr fs:[eax]
 00703F31    mov         dword ptr fs:[eax],esp
 00703F34    mov         byte ptr [ebx+24],1;TModuleSpaceball.Used:Boolean
 00703F38    mov         eax,dword ptr [ebp-4]
 00703F3B    call        00702604
 00703F40    mov         ebx,eax
 00703F42    xor         eax,eax
 00703F44    pop         edx
 00703F45    pop         ecx
 00703F46    pop         ecx
 00703F47    mov         dword ptr fs:[eax],edx
 00703F4A    push        703F5F
 00703F4F    lea         eax,[ebp-4]
 00703F52    call        @UStrClr
 00703F57    ret
>00703F58    jmp         @HandleFinally
>00703F5D    jmp         00703F4F
 00703F5F    mov         eax,ebx
 00703F61    pop         ebx
 00703F62    pop         ecx
 00703F63    pop         ebp
 00703F64    ret
*}
end;

//00703F68
function TModuleSpaceball.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 00703F68    push        ebp
 00703F69    mov         ebp,esp
 00703F6B    push        ecx
 00703F6C    push        ebx
 00703F6D    mov         dword ptr [ebp-4],edx
 00703F70    mov         ebx,eax
 00703F72    mov         eax,dword ptr [ebp-4]
 00703F75    call        @UStrAddRef
 00703F7A    xor         eax,eax
 00703F7C    push        ebp
 00703F7D    push        703FBC
 00703F82    push        dword ptr fs:[eax]
 00703F85    mov         dword ptr fs:[eax],esp
 00703F88    mov         edx,dword ptr [ebp-4]
 00703F8B    mov         eax,dword ptr [ebx+1C];TModuleSpaceball.Fields:THashTable
 00703F8E    call        THashTable.Get
 00703F93    sub         eax,1
>00703F96    jb          00703FA0
 00703F98    add         eax,0FFFFFFF2
 00703F9B    sub         eax,1F
>00703F9E    jae         00703FA4
 00703FA0    xor         ebx,ebx
>00703FA2    jmp         00703FA6
 00703FA4    mov         bl,9
 00703FA6    xor         eax,eax
 00703FA8    pop         edx
 00703FA9    pop         ecx
 00703FAA    pop         ecx
 00703FAB    mov         dword ptr fs:[eax],edx
 00703FAE    push        703FC3
 00703FB3    lea         eax,[ebp-4]
 00703FB6    call        @UStrClr
 00703FBB    ret
>00703FBC    jmp         @HandleFinally
>00703FC1    jmp         00703FB3
 00703FC3    mov         eax,ebx
 00703FC5    pop         ebx
 00703FC6    pop         ecx
 00703FC7    pop         ebp
 00703FC8    ret
*}
end;

//00703FCC
function TModuleSpaceball.GetGoodFields:TStringList;
begin
{*
 00703FCC    push        ebx
 00703FCD    mov         dl,1
 00703FCF    mov         eax,[0043C7BC];TStringList
 00703FD4    call        TStringList.Create;TStringList.Create
 00703FD9    mov         ebx,eax
 00703FDB    mov         edx,704040;'x'
 00703FE0    mov         eax,ebx
 00703FE2    mov         ecx,dword ptr [eax]
 00703FE4    call        dword ptr [ecx+38];TStringList.Add
 00703FE7    mov         edx,704050;'y'
 00703FEC    mov         eax,ebx
 00703FEE    mov         ecx,dword ptr [eax]
 00703FF0    call        dword ptr [ecx+38];TStringList.Add
 00703FF3    mov         edx,704060;'z'
 00703FF8    mov         eax,ebx
 00703FFA    mov         ecx,dword ptr [eax]
 00703FFC    call        dword ptr [ecx+38];TStringList.Add
 00703FFF    mov         edx,704070;'yaw'
 00704004    mov         eax,ebx
 00704006    mov         ecx,dword ptr [eax]
 00704008    call        dword ptr [ecx+38];TStringList.Add
 0070400B    mov         edx,704084;'pitch'
 00704010    mov         eax,ebx
 00704012    mov         ecx,dword ptr [eax]
 00704014    call        dword ptr [ecx+38];TStringList.Add
 00704017    mov         edx,70409C;'roll'
 0070401C    mov         eax,ebx
 0070401E    mov         ecx,dword ptr [eax]
 00704020    call        dword ptr [ecx+38];TStringList.Add
 00704023    mov         edx,7040B4;'Fit'
 00704028    mov         eax,ebx
 0070402A    mov         ecx,dword ptr [eax]
 0070402C    call        dword ptr [ecx+38];TStringList.Add
 0070402F    mov         eax,ebx
 00704031    pop         ebx
 00704032    ret
*}
end;

//007040BC
procedure TModuleSpaceball.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 007040BC    push        ebp
 007040BD    mov         ebp,esp
 007040BF    mov         byte ptr [edx],1
 007040C2    mov         dword ptr [ecx],0FFFFFFFF
 007040C8    mov         eax,dword ptr [ebp+8]
 007040CB    mov         dword ptr [eax],0FFFFFFFF
 007040D1    pop         ebp
 007040D2    ret         4
*}
end;

//007040D8
procedure TModuleSpaceball.MonitorFrame;
begin
{*
 007040D8    push        ebp
 007040D9    mov         ebp,esp
 007040DB    xor         ecx,ecx
 007040DD    push        ecx
 007040DE    push        ecx
 007040DF    push        ecx
 007040E0    push        ecx
 007040E1    push        ebx
 007040E2    push        esi
 007040E3    mov         esi,eax
 007040E5    xor         eax,eax
 007040E7    push        ebp
 007040E8    push        7041A7
 007040ED    push        dword ptr fs:[eax]
 007040F0    mov         dword ptr fs:[eax],esp
 007040F3    cmp         byte ptr [esi+28],0;TModuleSpaceball.Monitoring:Boolean
>007040F7    je          00704184
 007040FD    mov         eax,esi
 007040FF    mov         edx,dword ptr [eax]
 00704101    call        dword ptr [edx+3C];TModuleSpaceball.Read
 00704104    test        al,al
>00704106    je          00704184
 00704108    cmp         byte ptr ds:[8229B5],0;gvar_008229B5
>0070410F    je          00704184
 00704111    mov         ebx,1
 00704116    lea         eax,[ebp-4]
 00704119    push        eax
 0070411A    push        ebx
 0070411B    lea         eax,[ebp-8]
 0070411E    call        @IntfClear
 00704123    push        eax
 00704124    mov         eax,[008229C0];gvar_008229C0:IInterface
 00704129    push        eax
 0070412A    mov         eax,dword ptr [eax]
 0070412C    call        dword ptr [eax+28]
 0070412F    call        @CheckAutoResult
 00704134    mov         eax,dword ptr [ebp-8]
 00704137    push        eax
 00704138    mov         eax,dword ptr [eax]
 0070413A    call        dword ptr [eax+30]
 0070413D    call        @CheckAutoResult
 00704142    cmp         word ptr [ebp-4],0
>00704147    je          00704177
 00704149    lea         ecx,[ebp-10]
 0070414C    lea         edx,[ebx+0F]
 0070414F    dec         edx
 00704150    mov         eax,[008229BC];gvar_008229BC:TModuleSpaceball
 00704155    mov         eax,dword ptr [eax+1C]
 00704158    call        THashTable.Get
 0070415D    mov         ecx,dword ptr [ebp-10]
 00704160    lea         eax,[ebp-0C]
 00704163    mov         edx,7041C0;'Spaceball.'
 00704168    call        @UStrCat3
 0070416D    mov         edx,dword ptr [ebp-0C]
 00704170    mov         eax,esi
 00704172    call        005E4F20
 00704177    inc         ebx
 00704178    cmp         ebx,20
>0070417B    jne         00704116
 0070417D    mov         eax,esi
 0070417F    call        005E509C
 00704184    xor         eax,eax
 00704186    pop         edx
 00704187    pop         ecx
 00704188    pop         ecx
 00704189    mov         dword ptr fs:[eax],edx
 0070418C    push        7041AE
 00704191    lea         eax,[ebp-10]
 00704194    mov         edx,2
 00704199    call        @UStrArrayClr
 0070419E    lea         eax,[ebp-8]
 007041A1    call        @IntfClear
 007041A6    ret
>007041A7    jmp         @HandleFinally
>007041AC    jmp         00704191
 007041AE    pop         esi
 007041AF    pop         ebx
 007041B0    mov         esp,ebp
 007041B2    pop         ebp
 007041B3    ret
*}
end;

//007041D8
procedure TModuleSpaceball.PrepareForGUI;
begin
{*
 007041D8    ret
*}
end;

//007041DC
procedure TModuleSpaceball.PrepareForMonitoring;
begin
{*
 007041DC    ret
*}
end;

//007041E0
function TModuleSpaceball.Read:Boolean;
begin
{*
 007041E0    mov         al,1
 007041E2    ret
*}
end;

//007041E4
procedure TModuleSpaceball.StartCompiletime;
begin
{*
 007041E4    call        TPieModule.StartCompiletime
 007041E9    call        00703A08
 007041EE    ret
*}
end;

//007041F0
procedure TModuleSpaceball.StartGUI;
begin
{*
 007041F0    push        ebx
 007041F1    mov         ebx,eax
 007041F3    mov         eax,ebx
 007041F5    mov         edx,dword ptr [eax]
 007041F7    call        dword ptr [edx+28];TModuleSpaceball.StartCompiletime
 007041FA    mov         byte ptr [ebx+24],1;TModuleSpaceball.Used:Boolean
 007041FE    mov         byte ptr ds:[8229B4],1;gvar_008229B4
 00704205    mov         eax,ebx
 00704207    mov         edx,dword ptr [eax]
 00704209    call        dword ptr [edx+2C];TModuleSpaceball.StopCompiletime
 0070420C    mov         eax,ebx
 0070420E    mov         edx,dword ptr [eax]
 00704210    call        dword ptr [edx+30];TModuleSpaceball.StartRuntime
 00704213    pop         ebx
 00704214    ret
*}
end;

//00704218
procedure TModuleSpaceball.StartMonitoring;
begin
{*
 00704218    push        ebx
 00704219    mov         ebx,eax
 0070421B    mov         byte ptr [ebx+28],1;TModuleSpaceball.Monitoring:Boolean
 0070421F    mov         eax,dword ptr [ebx+30];TModuleSpaceball.OldButtonsDown:TStringList
 00704222    mov         edx,dword ptr [eax]
 00704224    call        dword ptr [edx+44];TStringList.Clear
 00704227    mov         eax,dword ptr [ebx+2C];TModuleSpaceball.ButtonsDown:TStringList
 0070422A    mov         edx,dword ptr [eax]
 0070422C    call        dword ptr [edx+44];TStringList.Clear
 0070422F    pop         ebx
 00704230    ret
*}
end;

//00704234
procedure TModuleSpaceball.StartRuntime;
begin
{*
 00704234    call        TPieModule.StartRuntime
 00704239    call        00703A14
 0070423E    ret
*}
end;

//00704240
procedure TModuleSpaceball.StopCompiletime;
begin
{*
 00704240    push        ebx
 00704241    mov         ebx,eax
 00704243    call        00703A10
 00704248    mov         eax,ebx
 0070424A    call        TPieModule.StopCompiletime
 0070424F    pop         ebx
 00704250    ret
*}
end;

//00704254
procedure TModuleSpaceball.StopGUI;
begin
{*
 00704254    mov         edx,dword ptr [eax]
 00704256    call        dword ptr [edx+34];TModuleSpaceball.StopRuntime
 00704259    ret
*}
end;

//0070425C
procedure TModuleSpaceball.StopMonitoring;
begin
{*
 0070425C    mov         byte ptr [eax+28],0;TModuleSpaceball.Monitoring:Boolean
 00704260    ret
*}
end;

//00704264
procedure TModuleSpaceball.StopRuntime;
begin
{*
 00704264    push        ebx
 00704265    mov         ebx,eax
 00704267    call        00703B78
 0070426C    mov         eax,ebx
 0070426E    call        TPieModule.StopRuntime
 00704273    pop         ebx
 00704274    ret
*}
end;

Initialization
//00782DA8
{*
 00782DA8    push        ebp
 00782DA9    mov         ebp,esp
 00782DAB    xor         eax,eax
 00782DAD    push        ebp
 00782DAE    push        782DEB
 00782DB3    push        dword ptr fs:[eax]
 00782DB6    mov         dword ptr fs:[eax],esp
 00782DB9    sub         dword ptr ds:[8229B8],1
>00782DC0    jae         00782DDD
 00782DC2    mov         dl,1
 00782DC4    mov         eax,[007020D8];TModuleSpaceball
 00782DC9    call        TModuleSpaceball.Create;TModuleSpaceball.Create
 00782DCE    mov         [008229BC],eax;gvar_008229BC:TModuleSpaceball
 00782DD3    mov         eax,[008229BC];gvar_008229BC:TModuleSpaceball
 00782DD8    call        005E31AC
 00782DDD    xor         eax,eax
 00782DDF    pop         edx
 00782DE0    pop         ecx
 00782DE1    pop         ecx
 00782DE2    mov         dword ptr fs:[eax],edx
 00782DE5    push        782DF2
 00782DEA    ret
>00782DEB    jmp         @HandleFinally
>00782DF0    jmp         00782DEA
 00782DF2    pop         ebp
 00782DF3    ret
*}
Finalization
//00704278
{*
 00704278    push        ebp
 00704279    mov         ebp,esp
 0070427B    xor         eax,eax
 0070427D    push        ebp
 0070427E    push        7042A9
 00704283    push        dword ptr fs:[eax]
 00704286    mov         dword ptr fs:[eax],esp
 00704289    inc         dword ptr ds:[8229B8]
>0070428F    jne         0070429B
 00704291    mov         eax,8229C0;gvar_008229C0:IInterface
 00704296    call        @IntfClear
 0070429B    xor         eax,eax
 0070429D    pop         edx
 0070429E    pop         ecx
 0070429F    pop         ecx
 007042A0    mov         dword ptr fs:[eax],edx
 007042A3    push        7042B0
 007042A8    ret
>007042A9    jmp         @HandleFinally
>007042AE    jmp         007042A8
 007042B0    pop         ebp
 007042B1    ret
*}
end.