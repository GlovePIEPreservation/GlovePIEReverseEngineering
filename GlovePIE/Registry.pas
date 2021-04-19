//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Registry;

interface

uses
  SysUtils, Classes;

type
  ERegistryException = class(Exception)
  end;
  TRegKeyInfo = TRegKeyInfo = record//size=1C
NumSubKeys:Integer;//f0
MaxSubKeyLen:Integer;//f4
NumValues:Integer;//f8
MaxValueLen:Integer;//fC
MaxDataLen:Integer;//f10
FileTime:_FILETIME;//f14
end;;
  TRegDataType = (rdUnknown, rdString, rdExpandString, rdInteger, rdBinary);
  TRegDataInfo = TRegDataInfo = record//size=8
RegData:TRegDataType;//f0
DataSize:Integer;//f4
end;;
  TRegistry = class(TObject)
  published
    procedure RenameValue(OldName:string; NewName:string);//0045E6F0
    function RegistryConnect(UNCName:string):Boolean;//0045E394
    function ReplaceKey(Key:string; FileName:string; BackUpFileName:string):Boolean;//0045E55C
    function SaveKey(Key:string; FileName:string):Boolean;//0045E600
    function RestoreKey(Key:string; FileName:string):Boolean;//0045E4E4
    procedure ReadTime(Name:string);//0045E14C
    function ReadDateTime(Name:string):TDateTime;//0045E0DC
    procedure ReadDate(Name:string);//0045E124
    function ReadFloat(Name:string):Double;//0045E04C
    function ReadString(Name:string):string;//0045DD68
    function ReadInteger(Name:string):Integer;//0045DFE4
    function UnLoadKey(Key:string):Boolean;//0045E460
    procedure WriteInteger(Name:string; Value:Integer);//0045DFD0
    procedure WriteFloat(Name:string; Value:Double);//0045E038
    procedure WriteString(Name:string; Value:string);//0045DD00
    //procedure WriteTime(Name:string; Value:TDateTime; ?:?);//0045E138
    procedure WriteExpandString(Name:string; Value:string);//0045DD34
    procedure WriteDateTime(Name:string; Value:TDateTime);//0045E0C8
    procedure WriteCurrency(Name:string; Value:Currency);//0045E080
    function ValueExists(Name:string):Boolean;//0045E2EC
    //procedure WriteBinaryData(Name:string; var Buffer:?; BufSize:Integer);//0045E160
    //procedure WriteDate(Name:string; Value:TDateTime; ?:?);//0045E110
    procedure WriteBool(Name:string; Value:Boolean);//0045E014
    function GetDataAsString(ValueName:string; PrefixType:Boolean):string;//0045DE1C
    function DeleteValue(Name:string):Boolean;//0045D894
    function GetDataInfo(ValueName:string; var Value:TRegDataInfo):Boolean;//0045DC5C
    function GetDataType(ValueName:string):TRegDataType;//0045DCD8
    function GetDataSize(ValueName:string):Integer;//0045DCB0
    function DeleteKey(Key:string):Boolean;//0045D708
    constructor Create;//0045D200
    constructor Create();//0045D1BC
    destructor Destroy();//0045D23C
    function CreateKey(Key:string):Boolean;//0045D30C
    procedure CloseKey;//0045D274
    function GetKeyInfo(var Value:TRegKeyInfo):Boolean;//0045D8B8
    function OpenKeyReadOnly(Key:string):Boolean;//0045D520
    function OpenKey(Key:string; CanCreate:Boolean):Boolean;//0045D3EC
    function ReadCurrency(Name:string):Currency;//0045E094
    function ReadBool(Name:string):Boolean;//0045E020
    //function ReadBinaryData(Name:string; var Buffer:?; BufSize:Integer):Integer;//0045E174
    procedure MoveKey(OldName:string; NewName:string; Delete:Boolean);//0045EC40
    procedure GetValueNames(Strings:TStrings);//0045DB94
    procedure GetKeyNames(Strings:TStrings);//0045D924
    function HasSubKeys:Boolean;//0045E2C8
    function LoadKey(Key:string; FileName:string):Boolean;//0045E3D0
    function KeyExists(Key:string):Boolean;//0045E678
  public
    FCurrentKey:HKEY;//f4
    FRootKey:HKEY;//f8
    FLazyWrite:Boolean;//fC
    FCurrentPath:string;//f10
    FCloseRootKey:Boolean;//f14
    FAccess:Cardinal;//f18
    FLastError:Integer;//f1C
    function CheckResult(RetVal:LongInt):Boolean;//0045D268
    procedure SetRootKey(Value:HKEY);//0045D2A4
    procedure ChangeKey(Value:HKEY; const Path:UnicodeString);//0045D2D0
    function GetBaseKey(Relative:Boolean):HKEY;//0045D2F4
    procedure SetCurrentKey(Value:HKEY);//0045D308
    function GetLastErrorMsg:UnicodeString;//0045D9EC
    function GetRootKeyName:UnicodeString;//0045DB5C
    procedure PutData(const Name:UnicodeString; Buffer:Pointer; BufSize:Integer; RegData:TRegDataType);//0045E1D8
    function GetData(const Name:UnicodeString; Buffer:Pointer; BufSize:Integer; var RegData:TRegDataType):Integer;//0045E24C
    function GetKey(const Key:UnicodeString):HKEY;//0045E2FC
  end;
  :TRegistry.:2 = array of Byte;
//elSize = 1
//varType equivalent: varByte;
    procedure ReadError(const Name:UnicodeString);//0045D03C
    function IsRelative(const Value:UnicodeString):Boolean;//0045D068
    function RegDataToDataType(Value:TRegDataType):Integer;//0045D080
    function DataTypeToRegData(Value:Integer):TRegDataType;//0045D0B0
    function BinaryToHexString(const BinaryData:array[$0..-$1] of System.Byte; const _Dv_:$0..-$1; const PrefixStr:UnicodeString):UnicodeString;//0045D0D8
    procedure MoveValue(SrcKey:HKEY; DestKey:HKEY; const Name:UnicodeString);//0045E78C
    procedure CopyValues(SrcKey:HKEY; DestKey:HKEY);//0045E8AC
    procedure CopyKeys(SrcKey:HKEY; DestKey:HKEY);//0045E9E4

implementation

//0045D03C
procedure ReadError(const Name:UnicodeString);
begin
{*
 0045D03C    push        ebx
 0045D03D    add         esp,0FFFFFFF8
 0045D040    mov         ebx,eax
 0045D042    mov         dword ptr [esp],ebx
 0045D045    mov         byte ptr [esp+4],11
 0045D04A    push        esp
 0045D04B    push        0
 0045D04D    mov         ecx,dword ptr ds:[78D140];^SResString129:TResStringRec
 0045D053    mov         dl,1
 0045D055    mov         eax,[0045BE8C];ERegistryException
 0045D05A    call        Exception.CreateResFmt
 0045D05F    call        @RaiseExcept
 0045D064    pop         ecx
 0045D065    pop         edx
 0045D066    pop         ebx
 0045D067    ret
*}
end;

//0045D068
function IsRelative(const Value:UnicodeString):Boolean;
begin
{*
 0045D068    push        ebx
 0045D069    mov         ebx,eax
 0045D06B    test        ebx,ebx
>0045D06D    je          0045D079
 0045D06F    cmp         word ptr [ebx],5C
>0045D073    jne         0045D079
 0045D075    xor         eax,eax
 0045D077    pop         ebx
 0045D078    ret
 0045D079    mov         al,1
 0045D07B    pop         ebx
 0045D07C    ret
*}
end;

//0045D080
function RegDataToDataType(Value:TRegDataType):Integer;
begin
{*
 0045D080    dec         al
>0045D082    je          0045D092
 0045D084    dec         al
>0045D086    je          0045D098
 0045D088    dec         al
>0045D08A    je          0045D09E
 0045D08C    dec         al
>0045D08E    je          0045D0A4
>0045D090    jmp         0045D0AA
 0045D092    mov         eax,1
 0045D097    ret
 0045D098    mov         eax,2
 0045D09D    ret
 0045D09E    mov         eax,4
 0045D0A3    ret
 0045D0A4    mov         eax,3
 0045D0A9    ret
 0045D0AA    xor         eax,eax
 0045D0AC    ret
*}
end;

//0045D0B0
function DataTypeToRegData(Value:Integer):TRegDataType;
begin
{*
 0045D0B0    cmp         eax,1
>0045D0B3    jne         0045D0B8
 0045D0B5    mov         al,1
 0045D0B7    ret
 0045D0B8    cmp         eax,2
>0045D0BB    jne         0045D0C1
 0045D0BD    mov         al,2
>0045D0BF    jmp         0045D0D5
 0045D0C1    cmp         eax,4
>0045D0C4    jne         0045D0CA
 0045D0C6    mov         al,3
>0045D0C8    jmp         0045D0D5
 0045D0CA    cmp         eax,3
>0045D0CD    jne         0045D0D3
 0045D0CF    mov         al,4
>0045D0D1    jmp         0045D0D5
 0045D0D3    xor         eax,eax
 0045D0D5    ret
*}
end;

//0045D0D8
function BinaryToHexString(const BinaryData:array[$0..-$1] of System.Byte; const _Dv_:$0..-$1; const PrefixStr:UnicodeString):UnicodeString;
begin
{*
 0045D0D8    push        ebp
 0045D0D9    mov         ebp,esp
 0045D0DB    add         esp,0FFFFFFE8
 0045D0DE    push        ebx
 0045D0DF    push        esi
 0045D0E0    push        edi
 0045D0E1    xor         ebx,ebx
 0045D0E3    mov         dword ptr [ebp-4],ebx
 0045D0E6    mov         edi,ecx
 0045D0E8    mov         dword ptr [ebp-0C],edx
 0045D0EB    mov         dword ptr [ebp-8],eax
 0045D0EE    mov         ebx,dword ptr [ebp+8]
 0045D0F1    xor         eax,eax
 0045D0F3    push        ebp
 0045D0F4    push        45D1A9
 0045D0F9    push        dword ptr fs:[eax]
 0045D0FC    mov         dword ptr fs:[eax],esp
 0045D0FF    xor         esi,esi
 0045D101    test        edi,edi
>0045D103    je          0045D11B
 0045D105    mov         eax,ebx
 0045D107    mov         edx,edi
 0045D109    call        @UStrAsg
 0045D10E    mov         eax,edi
 0045D110    test        eax,eax
>0045D112    je          0045D119
 0045D114    sub         eax,4
 0045D117    mov         eax,dword ptr [eax]
 0045D119    add         esi,eax
 0045D11B    mov         eax,dword ptr [ebp-0C]
 0045D11E    inc         eax
 0045D11F    mov         dword ptr [ebp-10],eax
 0045D122    mov         edx,dword ptr [ebp-10]
 0045D125    lea         edx,[edx+edx*2]
 0045D128    add         edx,esi
 0045D12A    dec         edx
 0045D12B    mov         eax,ebx
 0045D12D    call        @UStrSetLength
 0045D132    mov         eax,dword ptr [ebx]
 0045D134    call        @UStrToPWChar
 0045D139    mov         edi,eax
 0045D13B    mov         eax,dword ptr [ebp-10]
 0045D13E    dec         eax
 0045D13F    test        eax,eax
>0045D141    jl          0045D193
 0045D143    inc         eax
 0045D144    mov         dword ptr [ebp-18],eax
 0045D147    mov         dword ptr [ebp-14],0
 0045D14E    mov         ebx,dword ptr [ebp-8]
 0045D151    lea         ecx,[ebp-4]
 0045D154    movzx       eax,byte ptr [ebx]
 0045D157    mov         edx,2
 0045D15C    call        IntToHex
 0045D161    mov         eax,dword ptr [ebp-4]
 0045D164    movzx       eax,word ptr [eax]
 0045D167    mov         word ptr [edi+esi*2],ax
 0045D16B    mov         eax,dword ptr [ebp-4]
 0045D16E    movzx       eax,word ptr [eax+2]
 0045D172    mov         word ptr [edi+esi*2+2],ax
 0045D177    mov         eax,dword ptr [ebp-10]
 0045D17A    dec         eax
 0045D17B    cmp         eax,dword ptr [ebp-14]
>0045D17E    jle         0045D187
 0045D180    mov         word ptr [edi+esi*2+4],2C
 0045D187    add         esi,3
 0045D18A    inc         dword ptr [ebp-14]
 0045D18D    inc         ebx
 0045D18E    dec         dword ptr [ebp-18]
>0045D191    jne         0045D151
 0045D193    xor         eax,eax
 0045D195    pop         edx
 0045D196    pop         ecx
 0045D197    pop         ecx
 0045D198    mov         dword ptr fs:[eax],edx
 0045D19B    push        45D1B0
 0045D1A0    lea         eax,[ebp-4]
 0045D1A3    call        @UStrClr
 0045D1A8    ret
>0045D1A9    jmp         @HandleFinally
>0045D1AE    jmp         0045D1A0
 0045D1B0    pop         edi
 0045D1B1    pop         esi
 0045D1B2    pop         ebx
 0045D1B3    mov         esp,ebp
 0045D1B5    pop         ebp
 0045D1B6    ret         4
*}
end;

//0045D1BC
constructor TRegistry.Create();
begin
{*
 0045D1BC    push        ebx
 0045D1BD    push        esi
 0045D1BE    test        dl,dl
>0045D1C0    je          0045D1CA
 0045D1C2    add         esp,0FFFFFFF0
 0045D1C5    call        @ClassCreate
 0045D1CA    mov         ebx,edx
 0045D1CC    mov         esi,eax
 0045D1CE    mov         edx,80000001
 0045D1D3    mov         eax,esi
 0045D1D5    call        TRegistry.SetRootKey
 0045D1DA    mov         dword ptr [esi+18],0F003F
 0045D1E1    mov         byte ptr [esi+0C],1
 0045D1E5    mov         eax,esi
 0045D1E7    test        bl,bl
>0045D1E9    je          0045D1FA
 0045D1EB    call        @AfterConstruction
 0045D1F0    pop         dword ptr fs:[0]
 0045D1F7    add         esp,0C
 0045D1FA    mov         eax,esi
 0045D1FC    pop         esi
 0045D1FD    pop         ebx
 0045D1FE    ret
*}
end;

//0045D200
constructor TRegistry.Create;
begin
{*
 0045D200    push        ebx
 0045D201    push        esi
 0045D202    push        edi
 0045D203    test        dl,dl
>0045D205    je          0045D20F
 0045D207    add         esp,0FFFFFFF0
 0045D20A    call        @ClassCreate
 0045D20F    mov         esi,ecx
 0045D211    mov         ebx,edx
 0045D213    mov         edi,eax
 0045D215    xor         edx,edx
 0045D217    mov         eax,edi
 0045D219    call        TRegistry.Create
 0045D21E    mov         dword ptr [edi+18],esi
 0045D221    mov         eax,edi
 0045D223    test        bl,bl
>0045D225    je          0045D236
 0045D227    call        @AfterConstruction
 0045D22C    pop         dword ptr fs:[0]
 0045D233    add         esp,0C
 0045D236    mov         eax,edi
 0045D238    pop         edi
 0045D239    pop         esi
 0045D23A    pop         ebx
 0045D23B    ret
*}
end;

//0045D23C
destructor TRegistry.Destroy();
begin
{*
 0045D23C    push        ebx
 0045D23D    push        esi
 0045D23E    call        @BeforeDestruction
 0045D243    mov         ebx,edx
 0045D245    mov         esi,eax
 0045D247    mov         eax,esi
 0045D249    call        TRegistry.CloseKey
 0045D24E    mov         edx,ebx
 0045D250    and         dl,0FC
 0045D253    mov         eax,esi
 0045D255    call        TObject.Destroy
 0045D25A    test        bl,bl
>0045D25C    jle         0045D265
 0045D25E    mov         eax,esi
 0045D260    call        @ClassDestroy
 0045D265    pop         esi
 0045D266    pop         ebx
 0045D267    ret
*}
end;

//0045D268
function TRegistry.CheckResult(RetVal:LongInt):Boolean;
begin
{*
 0045D268    mov         dword ptr [eax+1C],edx
 0045D26B    test        edx,edx
 0045D26D    sete        al
 0045D270    ret
*}
end;

//0045D274
procedure TRegistry.CloseKey;
begin
{*
 0045D274    push        ebx
 0045D275    mov         ebx,eax
 0045D277    mov         eax,dword ptr [ebx+4]
 0045D27A    test        eax,eax
>0045D27C    je          0045D2A0
 0045D27E    cmp         byte ptr [ebx+0C],0
>0045D282    jne         0045D28A
 0045D284    push        eax
 0045D285    call        advapi32.RegFlushKey
 0045D28A    mov         eax,dword ptr [ebx+4]
 0045D28D    push        eax
 0045D28E    call        advapi32.RegCloseKey
 0045D293    xor         eax,eax
 0045D295    mov         dword ptr [ebx+4],eax
 0045D298    lea         eax,[ebx+10]
 0045D29B    call        @UStrClr
 0045D2A0    pop         ebx
 0045D2A1    ret
*}
end;

//0045D2A4
procedure TRegistry.SetRootKey(Value:HKEY);
begin
{*
 0045D2A4    push        ebx
 0045D2A5    push        esi
 0045D2A6    mov         esi,edx
 0045D2A8    mov         ebx,eax
 0045D2AA    mov         eax,dword ptr [ebx+8]
 0045D2AD    cmp         esi,eax
>0045D2AF    je          0045D2CB
 0045D2B1    cmp         byte ptr [ebx+14],0
>0045D2B5    je          0045D2C1
 0045D2B7    push        eax
 0045D2B8    call        advapi32.RegCloseKey
 0045D2BD    mov         byte ptr [ebx+14],0
 0045D2C1    mov         dword ptr [ebx+8],esi
 0045D2C4    mov         eax,ebx
 0045D2C6    call        TRegistry.CloseKey
 0045D2CB    pop         esi
 0045D2CC    pop         ebx
 0045D2CD    ret
*}
end;

//0045D2D0
procedure TRegistry.ChangeKey(Value:HKEY; const Path:UnicodeString);
begin
{*
 0045D2D0    push        ebx
 0045D2D1    push        esi
 0045D2D2    push        edi
 0045D2D3    mov         edi,ecx
 0045D2D5    mov         esi,edx
 0045D2D7    mov         ebx,eax
 0045D2D9    mov         eax,ebx
 0045D2DB    call        TRegistry.CloseKey
 0045D2E0    mov         dword ptr [ebx+4],esi
 0045D2E3    lea         eax,[ebx+10]
 0045D2E6    mov         edx,edi
 0045D2E8    call        @UStrAsg
 0045D2ED    pop         edi
 0045D2EE    pop         esi
 0045D2EF    pop         ebx
 0045D2F0    ret
*}
end;

//0045D2F4
function TRegistry.GetBaseKey(Relative:Boolean):HKEY;
begin
{*
 0045D2F4    mov         ecx,dword ptr [eax+4]
 0045D2F7    test        ecx,ecx
>0045D2F9    je          0045D2FF
 0045D2FB    test        dl,dl
>0045D2FD    jne         0045D303
 0045D2FF    mov         eax,dword ptr [eax+8]
 0045D302    ret
 0045D303    mov         eax,ecx
 0045D305    ret
*}
end;

//0045D308
procedure TRegistry.SetCurrentKey(Value:HKEY);
begin
{*
 0045D308    mov         dword ptr [eax+4],edx
 0045D30B    ret
*}
end;

//0045D30C
function TRegistry.CreateKey(Key:string):Boolean;
begin
{*
 0045D30C    push        ebp
 0045D30D    mov         ebp,esp
 0045D30F    add         esp,0FFFFFFEC
 0045D312    push        ebx
 0045D313    push        esi
 0045D314    push        edi
 0045D315    xor         ecx,ecx
 0045D317    mov         dword ptr [ebp-4],ecx
 0045D31A    mov         edi,edx
 0045D31C    mov         esi,eax
 0045D31E    xor         eax,eax
 0045D320    push        ebp
 0045D321    push        45D3DC
 0045D326    push        dword ptr fs:[eax]
 0045D329    mov         dword ptr fs:[eax],esp
 0045D32C    xor         eax,eax
 0045D32E    mov         dword ptr [ebp-8],eax
 0045D331    lea         eax,[ebp-4]
 0045D334    mov         edx,edi
 0045D336    call        @UStrLAsg
 0045D33B    mov         eax,dword ptr [ebp-4]
 0045D33E    call        IsRelative
 0045D343    mov         ebx,eax
 0045D345    test        bl,bl
>0045D347    jne         0045D35B
 0045D349    lea         eax,[ebp-4]
 0045D34C    mov         ecx,1
 0045D351    mov         edx,1
 0045D356    call        @UStrDelete
 0045D35B    lea         eax,[ebp-0C]
 0045D35E    push        eax
 0045D35F    lea         eax,[ebp-8]
 0045D362    push        eax
 0045D363    push        0
 0045D365    push        0F003F
 0045D36A    push        0
 0045D36C    push        0
 0045D36E    push        0
 0045D370    mov         eax,dword ptr [ebp-4]
 0045D373    call        @UStrToPWChar
 0045D378    push        eax
 0045D379    mov         edx,ebx
 0045D37B    mov         eax,esi
 0045D37D    call        TRegistry.GetBaseKey
 0045D382    push        eax
 0045D383    call        advapi32.RegCreateKeyExW
 0045D388    mov         edx,eax
 0045D38A    mov         eax,esi
 0045D38C    call        TRegistry.CheckResult
 0045D391    mov         ebx,eax
 0045D393    test        bl,bl
>0045D395    je          0045D3A2
 0045D397    mov         eax,dword ptr [ebp-8]
 0045D39A    push        eax
 0045D39B    call        advapi32.RegCloseKey
>0045D3A0    jmp         0045D3C6
 0045D3A2    mov         dword ptr [ebp-14],edi
 0045D3A5    mov         byte ptr [ebp-10],11
 0045D3A9    lea         eax,[ebp-14]
 0045D3AC    push        eax
 0045D3AD    push        0
 0045D3AF    mov         ecx,dword ptr ds:[78CD04];^SResString138:TResStringRec
 0045D3B5    mov         dl,1
 0045D3B7    mov         eax,[0045BE8C];ERegistryException
 0045D3BC    call        Exception.CreateResFmt
 0045D3C1    call        @RaiseExcept
 0045D3C6    xor         eax,eax
 0045D3C8    pop         edx
 0045D3C9    pop         ecx
 0045D3CA    pop         ecx
 0045D3CB    mov         dword ptr fs:[eax],edx
 0045D3CE    push        45D3E3
 0045D3D3    lea         eax,[ebp-4]
 0045D3D6    call        @UStrClr
 0045D3DB    ret
>0045D3DC    jmp         @HandleFinally
>0045D3E1    jmp         0045D3D3
 0045D3E3    mov         eax,ebx
 0045D3E5    pop         edi
 0045D3E6    pop         esi
 0045D3E7    pop         ebx
 0045D3E8    mov         esp,ebp
 0045D3EA    pop         ebp
 0045D3EB    ret
*}
end;

//0045D3EC
function TRegistry.OpenKey(Key:string; CanCreate:Boolean):Boolean;
begin
{*
 0045D3EC    push        ebp
 0045D3ED    mov         ebp,esp
 0045D3EF    add         esp,0FFFFFFF0
 0045D3F2    push        ebx
 0045D3F3    push        esi
 0045D3F4    xor         ebx,ebx
 0045D3F6    mov         dword ptr [ebp-4],ebx
 0045D3F9    mov         byte ptr [ebp-5],cl
 0045D3FC    mov         ebx,edx
 0045D3FE    mov         esi,eax
 0045D400    xor         eax,eax
 0045D402    push        ebp
 0045D403    push        45D4FD
 0045D408    push        dword ptr fs:[eax]
 0045D40B    mov         dword ptr fs:[eax],esp
 0045D40E    lea         eax,[ebp-4]
 0045D411    mov         edx,ebx
 0045D413    call        @UStrLAsg
 0045D418    mov         eax,dword ptr [ebp-4]
 0045D41B    call        IsRelative
 0045D420    mov         ebx,eax
 0045D422    test        bl,bl
>0045D424    jne         0045D438
 0045D426    lea         eax,[ebp-4]
 0045D429    mov         ecx,1
 0045D42E    mov         edx,1
 0045D433    call        @UStrDelete
 0045D438    xor         eax,eax
 0045D43A    mov         dword ptr [ebp-0C],eax
 0045D43D    cmp         byte ptr [ebp-5],0
>0045D441    je          0045D449
 0045D443    cmp         dword ptr [ebp-4],0
>0045D447    jne         0045D479
 0045D449    lea         eax,[ebp-0C]
 0045D44C    push        eax
 0045D44D    mov         eax,dword ptr [esi+18]
 0045D450    push        eax
 0045D451    push        0
 0045D453    mov         eax,dword ptr [ebp-4]
 0045D456    call        @UStrToPWChar
 0045D45B    push        eax
 0045D45C    mov         edx,ebx
 0045D45E    mov         eax,esi
 0045D460    call        TRegistry.GetBaseKey
 0045D465    push        eax
 0045D466    call        advapi32.RegOpenKeyExW
 0045D46B    mov         edx,eax
 0045D46D    mov         eax,esi
 0045D46F    call        TRegistry.CheckResult
 0045D474    mov         byte ptr [ebp-6],al
>0045D477    jmp         0045D4B1
 0045D479    lea         eax,[ebp-10]
 0045D47C    push        eax
 0045D47D    lea         eax,[ebp-0C]
 0045D480    push        eax
 0045D481    push        0
 0045D483    mov         eax,dword ptr [esi+18]
 0045D486    push        eax
 0045D487    push        0
 0045D489    push        0
 0045D48B    push        0
 0045D48D    mov         eax,dword ptr [ebp-4]
 0045D490    call        @UStrToPWChar
 0045D495    push        eax
 0045D496    mov         edx,ebx
 0045D498    mov         eax,esi
 0045D49A    call        TRegistry.GetBaseKey
 0045D49F    push        eax
 0045D4A0    call        advapi32.RegCreateKeyExW
 0045D4A5    mov         edx,eax
 0045D4A7    mov         eax,esi
 0045D4A9    call        TRegistry.CheckResult
 0045D4AE    mov         byte ptr [ebp-6],al
 0045D4B1    cmp         byte ptr [ebp-6],0
>0045D4B5    je          0045D4E7
 0045D4B7    cmp         dword ptr [esi+4],0
 0045D4BB    setne       al
 0045D4BE    test        al,bl
>0045D4C0    je          0045D4DA
 0045D4C2    push        dword ptr [esi+10]
 0045D4C5    push        45D51C;'\'
 0045D4CA    push        dword ptr [ebp-4]
 0045D4CD    lea         eax,[ebp-4]
 0045D4D0    mov         edx,3
 0045D4D5    call        @UStrCatN
 0045D4DA    mov         ecx,dword ptr [ebp-4]
 0045D4DD    mov         edx,dword ptr [ebp-0C]
 0045D4E0    mov         eax,esi
 0045D4E2    call        TRegistry.ChangeKey
 0045D4E7    xor         eax,eax
 0045D4E9    pop         edx
 0045D4EA    pop         ecx
 0045D4EB    pop         ecx
 0045D4EC    mov         dword ptr fs:[eax],edx
 0045D4EF    push        45D504
 0045D4F4    lea         eax,[ebp-4]
 0045D4F7    call        @UStrClr
 0045D4FC    ret
>0045D4FD    jmp         @HandleFinally
>0045D502    jmp         0045D4F4
 0045D504    movzx       eax,byte ptr [ebp-6]
 0045D508    pop         esi
 0045D509    pop         ebx
 0045D50A    mov         esp,ebp
 0045D50C    pop         ebp
 0045D50D    ret
*}
end;

//0045D520
function TRegistry.OpenKeyReadOnly(Key:string):Boolean;
begin
{*
 0045D520    push        ebp
 0045D521    mov         ebp,esp
 0045D523    add         esp,0FFFFFFF4
 0045D526    push        ebx
 0045D527    push        esi
 0045D528    push        edi
 0045D529    xor         ecx,ecx
 0045D52B    mov         dword ptr [ebp-4],ecx
 0045D52E    mov         ebx,edx
 0045D530    mov         esi,eax
 0045D532    xor         eax,eax
 0045D534    push        ebp
 0045D535    push        45D6E3
 0045D53A    push        dword ptr fs:[eax]
 0045D53D    mov         dword ptr fs:[eax],esp
 0045D540    lea         eax,[ebp-4]
 0045D543    mov         edx,ebx
 0045D545    call        @UStrLAsg
 0045D54A    mov         eax,dword ptr [ebp-4]
 0045D54D    call        IsRelative
 0045D552    mov         ebx,eax
 0045D554    test        bl,bl
>0045D556    jne         0045D56A
 0045D558    lea         eax,[ebp-4]
 0045D55B    mov         ecx,1
 0045D560    mov         edx,1
 0045D565    call        @UStrDelete
 0045D56A    xor         eax,eax
 0045D56C    mov         dword ptr [ebp-0C],eax
 0045D56F    mov         edi,dword ptr [esi+18]
 0045D572    and         edi,300
 0045D578    lea         eax,[ebp-0C]
 0045D57B    push        eax
 0045D57C    mov         eax,edi
 0045D57E    or          eax,20019
 0045D583    push        eax
 0045D584    push        0
 0045D586    mov         eax,dword ptr [ebp-4]
 0045D589    call        @UStrToPWChar
 0045D58E    push        eax
 0045D58F    mov         edx,ebx
 0045D591    mov         eax,esi
 0045D593    call        TRegistry.GetBaseKey
 0045D598    push        eax
 0045D599    call        advapi32.RegOpenKeyExW
 0045D59E    mov         edx,eax
 0045D5A0    mov         eax,esi
 0045D5A2    call        TRegistry.CheckResult
 0045D5A7    mov         byte ptr [ebp-5],al
 0045D5AA    cmp         byte ptr [ebp-5],0
>0045D5AE    je          0045D5EE
 0045D5B0    or          edi,20019
 0045D5B6    mov         dword ptr [esi+18],edi
 0045D5B9    cmp         dword ptr [esi+4],0
 0045D5BD    setne       al
 0045D5C0    test        al,bl
>0045D5C2    je          0045D5DC
 0045D5C4    push        dword ptr [esi+10]
 0045D5C7    push        45D704;'\'
 0045D5CC    push        dword ptr [ebp-4]
 0045D5CF    lea         eax,[ebp-4]
 0045D5D2    mov         edx,3
 0045D5D7    call        @UStrCatN
 0045D5DC    mov         ecx,dword ptr [ebp-4]
 0045D5DF    mov         edx,dword ptr [ebp-0C]
 0045D5E2    mov         eax,esi
 0045D5E4    call        TRegistry.ChangeKey
>0045D5E9    jmp         0045D6CD
 0045D5EE    lea         eax,[ebp-0C]
 0045D5F1    push        eax
 0045D5F2    mov         eax,edi
 0045D5F4    or          eax,20009
 0045D5F9    push        eax
 0045D5FA    push        0
 0045D5FC    mov         eax,dword ptr [ebp-4]
 0045D5FF    call        @UStrToPWChar
 0045D604    push        eax
 0045D605    mov         edx,ebx
 0045D607    mov         eax,esi
 0045D609    call        TRegistry.GetBaseKey
 0045D60E    push        eax
 0045D60F    call        advapi32.RegOpenKeyExW
 0045D614    mov         edx,eax
 0045D616    mov         eax,esi
 0045D618    call        TRegistry.CheckResult
 0045D61D    mov         byte ptr [ebp-5],al
 0045D620    cmp         byte ptr [ebp-5],0
>0045D624    je          0045D661
 0045D626    or          edi,20009
 0045D62C    mov         dword ptr [esi+18],edi
 0045D62F    cmp         dword ptr [esi+4],0
 0045D633    setne       al
 0045D636    test        al,bl
>0045D638    je          0045D652
 0045D63A    push        dword ptr [esi+10]
 0045D63D    push        45D704;'\'
 0045D642    push        dword ptr [ebp-4]
 0045D645    lea         eax,[ebp-4]
 0045D648    mov         edx,3
 0045D64D    call        @UStrCatN
 0045D652    mov         ecx,dword ptr [ebp-4]
 0045D655    mov         edx,dword ptr [ebp-0C]
 0045D658    mov         eax,esi
 0045D65A    call        TRegistry.ChangeKey
>0045D65F    jmp         0045D6CD
 0045D661    lea         eax,[ebp-0C]
 0045D664    push        eax
 0045D665    mov         eax,edi
 0045D667    or          eax,1
 0045D66A    push        eax
 0045D66B    push        0
 0045D66D    mov         eax,dword ptr [ebp-4]
 0045D670    call        @UStrToPWChar
 0045D675    push        eax
 0045D676    mov         edx,ebx
 0045D678    mov         eax,esi
 0045D67A    call        TRegistry.GetBaseKey
 0045D67F    push        eax
 0045D680    call        advapi32.RegOpenKeyExW
 0045D685    mov         edx,eax
 0045D687    mov         eax,esi
 0045D689    call        TRegistry.CheckResult
 0045D68E    mov         byte ptr [ebp-5],al
 0045D691    cmp         byte ptr [ebp-5],0
>0045D695    je          0045D6CD
 0045D697    or          edi,1
 0045D69A    mov         dword ptr [esi+18],edi
 0045D69D    cmp         dword ptr [esi+4],0
 0045D6A1    setne       al
 0045D6A4    test        al,bl
>0045D6A6    je          0045D6C0
 0045D6A8    push        dword ptr [esi+10]
 0045D6AB    push        45D704;'\'
 0045D6B0    push        dword ptr [ebp-4]
 0045D6B3    lea         eax,[ebp-4]
 0045D6B6    mov         edx,3
 0045D6BB    call        @UStrCatN
 0045D6C0    mov         ecx,dword ptr [ebp-4]
 0045D6C3    mov         edx,dword ptr [ebp-0C]
 0045D6C6    mov         eax,esi
 0045D6C8    call        TRegistry.ChangeKey
 0045D6CD    xor         eax,eax
 0045D6CF    pop         edx
 0045D6D0    pop         ecx
 0045D6D1    pop         ecx
 0045D6D2    mov         dword ptr fs:[eax],edx
 0045D6D5    push        45D6EA
 0045D6DA    lea         eax,[ebp-4]
 0045D6DD    call        @UStrClr
 0045D6E2    ret
>0045D6E3    jmp         @HandleFinally
>0045D6E8    jmp         0045D6DA
 0045D6EA    movzx       eax,byte ptr [ebp-5]
 0045D6EE    pop         edi
 0045D6EF    pop         esi
 0045D6F0    pop         ebx
 0045D6F1    mov         esp,ebp
 0045D6F3    pop         ebp
 0045D6F4    ret
*}
end;

//0045D708
function TRegistry.DeleteKey(Key:string):Boolean;
begin
{*
 0045D708    push        ebp
 0045D709    mov         ebp,esp
 0045D70B    add         esp,0FFFFFFC4
 0045D70E    push        ebx
 0045D70F    xor         ecx,ecx
 0045D711    mov         dword ptr [ebp-3C],ecx
 0045D714    mov         dword ptr [ebp-4],ecx
 0045D717    mov         dword ptr [ebp-8],ecx
 0045D71A    mov         ebx,edx
 0045D71C    mov         dword ptr [ebp-0C],eax
 0045D71F    xor         eax,eax
 0045D721    push        ebp
 0045D722    push        45D883
 0045D727    push        dword ptr fs:[eax]
 0045D72A    mov         dword ptr fs:[eax],esp
 0045D72D    lea         eax,[ebp-4]
 0045D730    mov         edx,ebx
 0045D732    call        @UStrLAsg
 0045D737    mov         eax,dword ptr [ebp-4]
 0045D73A    call        IsRelative
 0045D73F    mov         byte ptr [ebp-11],al
 0045D742    cmp         byte ptr [ebp-11],0
>0045D746    jne         0045D75A
 0045D748    lea         eax,[ebp-4]
 0045D74B    mov         ecx,1
 0045D750    mov         edx,1
 0045D755    call        @UStrDelete
 0045D75A    mov         eax,dword ptr [ebp-0C]
 0045D75D    mov         eax,dword ptr [eax+4]
 0045D760    mov         dword ptr [ebp-18],eax
 0045D763    mov         edx,ebx
 0045D765    mov         eax,dword ptr [ebp-0C]
 0045D768    call        TRegistry.GetKey
 0045D76D    mov         dword ptr [ebp-1C],eax
 0045D770    cmp         dword ptr [ebp-1C],0
>0045D774    je          0045D839
 0045D77A    xor         eax,eax
 0045D77C    push        ebp
 0045D77D    push        45D832
 0045D782    push        dword ptr fs:[eax]
 0045D785    mov         dword ptr fs:[eax],esp
 0045D788    mov         edx,dword ptr [ebp-1C]
 0045D78B    mov         eax,dword ptr [ebp-0C]
 0045D78E    call        TRegistry.SetCurrentKey
 0045D793    lea         edx,[ebp-38]
 0045D796    mov         eax,dword ptr [ebp-0C]
 0045D799    call        TRegistry.GetKeyInfo
 0045D79E    test        al,al
>0045D7A0    je          0045D810
 0045D7A2    mov         ecx,dword ptr [ebp-34]
 0045D7A5    inc         ecx
 0045D7A6    lea         eax,[ebp-8]
 0045D7A9    xor         edx,edx
 0045D7AB    call        @UStrFromPWCharLen
 0045D7B0    mov         ebx,dword ptr [ebp-38]
 0045D7B3    dec         ebx
 0045D7B4    cmp         ebx,0
>0045D7B7    jl          0045D810
 0045D7B9    mov         eax,dword ptr [ebp-34]
 0045D7BC    inc         eax
 0045D7BD    mov         dword ptr [ebp-10],eax
 0045D7C0    push        0
 0045D7C2    push        0
 0045D7C4    push        0
 0045D7C6    push        0
 0045D7C8    lea         eax,[ebp-10]
 0045D7CB    push        eax
 0045D7CC    mov         eax,dword ptr [ebp-8]
 0045D7CF    call        @UStrToPWChar
 0045D7D4    push        eax
 0045D7D5    push        ebx
 0045D7D6    mov         eax,dword ptr [ebp-1C]
 0045D7D9    push        eax
 0045D7DA    call        advapi32.RegEnumKeyExW
 0045D7DF    mov         edx,eax
 0045D7E1    mov         eax,dword ptr [ebp-0C]
 0045D7E4    call        TRegistry.CheckResult
 0045D7E9    test        al,al
>0045D7EB    je          0045D80A
 0045D7ED    mov         eax,dword ptr [ebp-8]
 0045D7F0    call        @UStrToPWChar
 0045D7F5    mov         edx,eax
 0045D7F7    lea         eax,[ebp-3C]
 0045D7FA    call        @UStrFromPWChar
 0045D7FF    mov         edx,dword ptr [ebp-3C]
 0045D802    mov         eax,dword ptr [ebp-0C]
 0045D805    call        TRegistry.DeleteKey
 0045D80A    dec         ebx
 0045D80B    cmp         ebx,0FFFFFFFF
>0045D80E    jne         0045D7B9
 0045D810    xor         eax,eax
 0045D812    pop         edx
 0045D813    pop         ecx
 0045D814    pop         ecx
 0045D815    mov         dword ptr fs:[eax],edx
 0045D818    push        45D839
 0045D81D    mov         edx,dword ptr [ebp-18]
 0045D820    mov         eax,dword ptr [ebp-0C]
 0045D823    call        TRegistry.SetCurrentKey
 0045D828    mov         eax,dword ptr [ebp-1C]
 0045D82B    push        eax
 0045D82C    call        advapi32.RegCloseKey
 0045D831    ret
>0045D832    jmp         @HandleFinally
>0045D837    jmp         0045D81D
 0045D839    mov         eax,dword ptr [ebp-4]
 0045D83C    call        @UStrToPWChar
 0045D841    push        eax
 0045D842    movzx       edx,byte ptr [ebp-11]
 0045D846    mov         eax,dword ptr [ebp-0C]
 0045D849    call        TRegistry.GetBaseKey
 0045D84E    push        eax
 0045D84F    call        advapi32.RegDeleteKeyW
 0045D854    mov         edx,eax
 0045D856    mov         eax,dword ptr [ebp-0C]
 0045D859    call        TRegistry.CheckResult
 0045D85E    mov         ebx,eax
 0045D860    xor         eax,eax
 0045D862    pop         edx
 0045D863    pop         ecx
 0045D864    pop         ecx
 0045D865    mov         dword ptr fs:[eax],edx
 0045D868    push        45D88A
 0045D86D    lea         eax,[ebp-3C]
 0045D870    call        @UStrClr
 0045D875    lea         eax,[ebp-8]
 0045D878    mov         edx,2
 0045D87D    call        @UStrArrayClr
 0045D882    ret
>0045D883    jmp         @HandleFinally
>0045D888    jmp         0045D86D
 0045D88A    mov         eax,ebx
 0045D88C    pop         ebx
 0045D88D    mov         esp,ebp
 0045D88F    pop         ebp
 0045D890    ret
*}
end;

//0045D894
function TRegistry.DeleteValue(Name:string):Boolean;
begin
{*
 0045D894    push        ebx
 0045D895    push        esi
 0045D896    mov         esi,edx
 0045D898    mov         ebx,eax
 0045D89A    mov         eax,esi
 0045D89C    call        @UStrToPWChar
 0045D8A1    push        eax
 0045D8A2    mov         eax,dword ptr [ebx+4]
 0045D8A5    push        eax
 0045D8A6    call        advapi32.RegDeleteValueW
 0045D8AB    mov         edx,eax
 0045D8AD    mov         eax,ebx
 0045D8AF    call        TRegistry.CheckResult
 0045D8B4    pop         esi
 0045D8B5    pop         ebx
 0045D8B6    ret
*}
end;

//0045D8B8
function TRegistry.GetKeyInfo(var Value:TRegKeyInfo):Boolean;
begin
{*
 0045D8B8    push        ebx
 0045D8B9    push        esi
 0045D8BA    mov         ebx,edx
 0045D8BC    mov         esi,eax
 0045D8BE    mov         eax,ebx
 0045D8C0    xor         ecx,ecx
 0045D8C2    mov         edx,1C
 0045D8C7    call        @FillChar
 0045D8CC    lea         eax,[ebx+14]
 0045D8CF    push        eax
 0045D8D0    push        0
 0045D8D2    lea         eax,[ebx+10]
 0045D8D5    push        eax
 0045D8D6    lea         eax,[ebx+0C]
 0045D8D9    push        eax
 0045D8DA    lea         eax,[ebx+8]
 0045D8DD    push        eax
 0045D8DE    push        0
 0045D8E0    lea         eax,[ebx+4]
 0045D8E3    push        eax
 0045D8E4    push        ebx
 0045D8E5    push        0
 0045D8E7    push        0
 0045D8E9    push        0
 0045D8EB    mov         eax,dword ptr [esi+4]
 0045D8EE    push        eax
 0045D8EF    call        advapi32.RegQueryInfoKeyW
 0045D8F4    mov         edx,eax
 0045D8F6    mov         eax,esi
 0045D8F8    call        TRegistry.CheckResult
 0045D8FD    mov         edx,dword ptr ds:[78DB7C];SysLocale:TSysLocale
 0045D903    cmp         byte ptr [edx+0C],0
>0045D907    je          0045D920
 0045D909    mov         edx,dword ptr ds:[78DB58];^gvar_00784C7C
 0045D90F    cmp         dword ptr [edx],2
>0045D912    jne         0045D920
 0045D914    mov         edx,dword ptr [ebx+4]
 0045D917    add         dword ptr [ebx+4],edx
 0045D91A    mov         edx,dword ptr [ebx+0C]
 0045D91D    add         dword ptr [ebx+0C],edx
 0045D920    pop         esi
 0045D921    pop         ebx
 0045D922    ret
*}
end;

//0045D924
procedure TRegistry.GetKeyNames(Strings:TStrings);
begin
{*
 0045D924    push        ebp
 0045D925    mov         ebp,esp
 0045D927    add         esp,0FFFFFFD4
 0045D92A    push        ebx
 0045D92B    push        esi
 0045D92C    push        edi
 0045D92D    xor         ecx,ecx
 0045D92F    mov         dword ptr [ebp-2C],ecx
 0045D932    mov         dword ptr [ebp-4],ecx
 0045D935    mov         dword ptr [ebp-8],edx
 0045D938    mov         edi,eax
 0045D93A    xor         eax,eax
 0045D93C    push        ebp
 0045D93D    push        45D9DC
 0045D942    push        dword ptr fs:[eax]
 0045D945    mov         dword ptr fs:[eax],esp
 0045D948    mov         eax,dword ptr [ebp-8]
 0045D94B    mov         edx,dword ptr [eax]
 0045D94D    call        dword ptr [edx+44]
 0045D950    lea         edx,[ebp-28]
 0045D953    mov         eax,edi
 0045D955    call        TRegistry.GetKeyInfo
 0045D95A    test        al,al
>0045D95C    je          0045D9BE
 0045D95E    mov         ecx,dword ptr [ebp-24]
 0045D961    inc         ecx
 0045D962    lea         eax,[ebp-4]
 0045D965    xor         edx,edx
 0045D967    call        @UStrFromPWCharLen
 0045D96C    mov         ebx,dword ptr [ebp-28]
 0045D96F    dec         ebx
 0045D970    test        ebx,ebx
>0045D972    jl          0045D9BE
 0045D974    inc         ebx
 0045D975    xor         esi,esi
 0045D977    mov         eax,dword ptr [ebp-24]
 0045D97A    inc         eax
 0045D97B    mov         dword ptr [ebp-0C],eax
 0045D97E    push        0
 0045D980    push        0
 0045D982    push        0
 0045D984    push        0
 0045D986    lea         eax,[ebp-0C]
 0045D989    push        eax
 0045D98A    mov         eax,dword ptr [ebp-4]
 0045D98D    call        @UStrToPWChar
 0045D992    push        eax
 0045D993    push        esi
 0045D994    mov         eax,dword ptr [edi+4]
 0045D997    push        eax
 0045D998    call        advapi32.RegEnumKeyExW
 0045D99D    mov         eax,dword ptr [ebp-4]
 0045D9A0    call        @UStrToPWChar
 0045D9A5    mov         edx,eax
 0045D9A7    lea         eax,[ebp-2C]
 0045D9AA    call        @UStrFromPWChar
 0045D9AF    mov         edx,dword ptr [ebp-2C]
 0045D9B2    mov         eax,dword ptr [ebp-8]
 0045D9B5    mov         ecx,dword ptr [eax]
 0045D9B7    call        dword ptr [ecx+38]
 0045D9BA    inc         esi
 0045D9BB    dec         ebx
>0045D9BC    jne         0045D977
 0045D9BE    xor         eax,eax
 0045D9C0    pop         edx
 0045D9C1    pop         ecx
 0045D9C2    pop         ecx
 0045D9C3    mov         dword ptr fs:[eax],edx
 0045D9C6    push        45D9E3
 0045D9CB    lea         eax,[ebp-2C]
 0045D9CE    call        @UStrClr
 0045D9D3    lea         eax,[ebp-4]
 0045D9D6    call        @UStrClr
 0045D9DB    ret
>0045D9DC    jmp         @HandleFinally
>0045D9E1    jmp         0045D9CB
 0045D9E3    pop         edi
 0045D9E4    pop         esi
 0045D9E5    pop         ebx
 0045D9E6    mov         esp,ebp
 0045D9E8    pop         ebp
 0045D9E9    ret
*}
end;

//0045D9EC
function TRegistry.GetLastErrorMsg:UnicodeString;
begin
{*
 0045D9EC    push        ebx
 0045D9ED    push        esi
 0045D9EE    push        edi
 0045D9EF    mov         esi,edx
 0045D9F1    mov         ebx,eax
 0045D9F3    mov         edi,dword ptr [ebx+1C]
 0045D9F6    test        edi,edi
>0045D9F8    je          0045DA05
 0045D9FA    mov         edx,esi
 0045D9FC    mov         eax,edi
 0045D9FE    call        SysErrorMessage
>0045DA03    jmp         0045DA0C
 0045DA05    mov         eax,esi
 0045DA07    call        @UStrClr
 0045DA0C    pop         edi
 0045DA0D    pop         esi
 0045DA0E    pop         ebx
 0045DA0F    ret
*}
end;

//0045DB5C
function TRegistry.GetRootKeyName:UnicodeString;
begin
{*
 0045DB5C    push        ebx
 0045DB5D    push        esi
 0045DB5E    push        edi
 0045DB5F    mov         edi,edx
 0045DB61    mov         ebx,eax
 0045DB63    mov         esi,dword ptr [ebx+8]
 0045DB66    cmp         esi,80000000
>0045DB6C    jb          0045DB86
 0045DB6E    cmp         esi,80000006
>0045DB74    ja          0045DB86
 0045DB76    mov         eax,edi
 0045DB78    mov         edx,dword ptr [esi*4+7855B0];^'HKEY_CLASSES_ROOT'
 0045DB7F    call        @UStrAsg
>0045DB84    jmp         0045DB8D
 0045DB86    mov         eax,edi
 0045DB88    call        @UStrClr
 0045DB8D    pop         edi
 0045DB8E    pop         esi
 0045DB8F    pop         ebx
 0045DB90    ret
*}
end;

//0045DB94
procedure TRegistry.GetValueNames(Strings:TStrings);
begin
{*
 0045DB94    push        ebp
 0045DB95    mov         ebp,esp
 0045DB97    add         esp,0FFFFFFD4
 0045DB9A    push        ebx
 0045DB9B    push        esi
 0045DB9C    push        edi
 0045DB9D    xor         ecx,ecx
 0045DB9F    mov         dword ptr [ebp-2C],ecx
 0045DBA2    mov         dword ptr [ebp-4],ecx
 0045DBA5    mov         dword ptr [ebp-8],edx
 0045DBA8    mov         edi,eax
 0045DBAA    xor         eax,eax
 0045DBAC    push        ebp
 0045DBAD    push        45DC4C
 0045DBB2    push        dword ptr fs:[eax]
 0045DBB5    mov         dword ptr fs:[eax],esp
 0045DBB8    mov         eax,dword ptr [ebp-8]
 0045DBBB    mov         edx,dword ptr [eax]
 0045DBBD    call        dword ptr [edx+44]
 0045DBC0    lea         edx,[ebp-28]
 0045DBC3    mov         eax,edi
 0045DBC5    call        TRegistry.GetKeyInfo
 0045DBCA    test        al,al
>0045DBCC    je          0045DC2E
 0045DBCE    mov         ecx,dword ptr [ebp-1C]
 0045DBD1    inc         ecx
 0045DBD2    lea         eax,[ebp-4]
 0045DBD5    xor         edx,edx
 0045DBD7    call        @UStrFromPWCharLen
 0045DBDC    mov         ebx,dword ptr [ebp-20]
 0045DBDF    dec         ebx
 0045DBE0    test        ebx,ebx
>0045DBE2    jl          0045DC2E
 0045DBE4    inc         ebx
 0045DBE5    xor         esi,esi
 0045DBE7    mov         eax,dword ptr [ebp-1C]
 0045DBEA    inc         eax
 0045DBEB    mov         dword ptr [ebp-0C],eax
 0045DBEE    push        0
 0045DBF0    push        0
 0045DBF2    push        0
 0045DBF4    push        0
 0045DBF6    lea         eax,[ebp-0C]
 0045DBF9    push        eax
 0045DBFA    mov         eax,dword ptr [ebp-4]
 0045DBFD    call        @UStrToPWChar
 0045DC02    push        eax
 0045DC03    push        esi
 0045DC04    mov         eax,dword ptr [edi+4]
 0045DC07    push        eax
 0045DC08    call        advapi32.RegEnumValueW
 0045DC0D    mov         eax,dword ptr [ebp-4]
 0045DC10    call        @UStrToPWChar
 0045DC15    mov         edx,eax
 0045DC17    lea         eax,[ebp-2C]
 0045DC1A    call        @UStrFromPWChar
 0045DC1F    mov         edx,dword ptr [ebp-2C]
 0045DC22    mov         eax,dword ptr [ebp-8]
 0045DC25    mov         ecx,dword ptr [eax]
 0045DC27    call        dword ptr [ecx+38]
 0045DC2A    inc         esi
 0045DC2B    dec         ebx
>0045DC2C    jne         0045DBE7
 0045DC2E    xor         eax,eax
 0045DC30    pop         edx
 0045DC31    pop         ecx
 0045DC32    pop         ecx
 0045DC33    mov         dword ptr fs:[eax],edx
 0045DC36    push        45DC53
 0045DC3B    lea         eax,[ebp-2C]
 0045DC3E    call        @UStrClr
 0045DC43    lea         eax,[ebp-4]
 0045DC46    call        @UStrClr
 0045DC4B    ret
>0045DC4C    jmp         @HandleFinally
>0045DC51    jmp         0045DC3B
 0045DC53    pop         edi
 0045DC54    pop         esi
 0045DC55    pop         ebx
 0045DC56    mov         esp,ebp
 0045DC58    pop         ebp
 0045DC59    ret
*}
end;

//0045DC5C
function TRegistry.GetDataInfo(ValueName:string; var Value:TRegDataInfo):Boolean;
begin
{*
 0045DC5C    push        ebx
 0045DC5D    push        esi
 0045DC5E    push        edi
 0045DC5F    push        ecx
 0045DC60    mov         esi,ecx
 0045DC62    mov         edi,edx
 0045DC64    mov         ebx,eax
 0045DC66    mov         eax,esi
 0045DC68    xor         ecx,ecx
 0045DC6A    mov         edx,8
 0045DC6F    call        @FillChar
 0045DC74    lea         eax,[esi+4]
 0045DC77    push        eax
 0045DC78    push        0
 0045DC7A    lea         eax,[esp+8]
 0045DC7E    push        eax
 0045DC7F    push        0
 0045DC81    mov         eax,edi
 0045DC83    call        @UStrToPWChar
 0045DC88    push        eax
 0045DC89    mov         eax,dword ptr [ebx+4]
 0045DC8C    push        eax
 0045DC8D    call        advapi32.RegQueryValueExW
 0045DC92    mov         edx,eax
 0045DC94    mov         eax,ebx
 0045DC96    call        TRegistry.CheckResult
 0045DC9B    mov         ebx,eax
 0045DC9D    mov         eax,dword ptr [esp]
 0045DCA0    call        DataTypeToRegData
 0045DCA5    mov         byte ptr [esi],al
 0045DCA7    mov         eax,ebx
 0045DCA9    pop         edx
 0045DCAA    pop         edi
 0045DCAB    pop         esi
 0045DCAC    pop         ebx
 0045DCAD    ret
*}
end;

//0045DCB0
function TRegistry.GetDataSize(ValueName:string):Integer;
begin
{*
 0045DCB0    push        ebx
 0045DCB1    push        esi
 0045DCB2    add         esp,0FFFFFFF8
 0045DCB5    mov         esi,edx
 0045DCB7    mov         ebx,eax
 0045DCB9    mov         ecx,esp
 0045DCBB    mov         edx,esi
 0045DCBD    mov         eax,ebx
 0045DCBF    call        TRegistry.GetDataInfo
 0045DCC4    test        al,al
>0045DCC6    je          0045DCCE
 0045DCC8    mov         eax,dword ptr [esp+4]
>0045DCCC    jmp         0045DCD1
 0045DCCE    or          eax,0FFFFFFFF
 0045DCD1    pop         ecx
 0045DCD2    pop         edx
 0045DCD3    pop         esi
 0045DCD4    pop         ebx
 0045DCD5    ret
*}
end;

//0045DCD8
function TRegistry.GetDataType(ValueName:string):TRegDataType;
begin
{*
 0045DCD8    push        ebx
 0045DCD9    push        esi
 0045DCDA    add         esp,0FFFFFFF8
 0045DCDD    mov         esi,edx
 0045DCDF    mov         ebx,eax
 0045DCE1    mov         ecx,esp
 0045DCE3    mov         edx,esi
 0045DCE5    mov         eax,ebx
 0045DCE7    call        TRegistry.GetDataInfo
 0045DCEC    test        al,al
>0045DCEE    je          0045DCF6
 0045DCF0    movzx       eax,byte ptr [esp]
>0045DCF4    jmp         0045DCF8
 0045DCF6    xor         eax,eax
 0045DCF8    pop         ecx
 0045DCF9    pop         edx
 0045DCFA    pop         esi
 0045DCFB    pop         ebx
 0045DCFC    ret
*}
end;

//0045DD00
procedure TRegistry.WriteString(Name:string; Value:string);
begin
{*
 0045DD00    push        ebx
 0045DD01    push        esi
 0045DD02    push        edi
 0045DD03    push        ebp
 0045DD04    mov         edi,ecx
 0045DD06    mov         ebp,edx
 0045DD08    mov         esi,eax
 0045DD0A    mov         ebx,edi
 0045DD0C    test        ebx,ebx
>0045DD0E    je          0045DD15
 0045DD10    sub         ebx,4
 0045DD13    mov         ebx,dword ptr [ebx]
 0045DD15    inc         ebx
 0045DD16    mov         eax,ebx
 0045DD18    add         eax,eax
 0045DD1A    push        eax
 0045DD1B    push        1
 0045DD1D    mov         eax,edi
 0045DD1F    call        @UStrToPWChar
 0045DD24    mov         ecx,eax
 0045DD26    mov         edx,ebp
 0045DD28    mov         eax,esi
 0045DD2A    call        TRegistry.PutData
 0045DD2F    pop         ebp
 0045DD30    pop         edi
 0045DD31    pop         esi
 0045DD32    pop         ebx
 0045DD33    ret
*}
end;

//0045DD34
procedure TRegistry.WriteExpandString(Name:string; Value:string);
begin
{*
 0045DD34    push        ebx
 0045DD35    push        esi
 0045DD36    push        edi
 0045DD37    push        ebp
 0045DD38    mov         edi,ecx
 0045DD3A    mov         ebp,edx
 0045DD3C    mov         esi,eax
 0045DD3E    mov         ebx,edi
 0045DD40    test        ebx,ebx
>0045DD42    je          0045DD49
 0045DD44    sub         ebx,4
 0045DD47    mov         ebx,dword ptr [ebx]
 0045DD49    inc         ebx
 0045DD4A    mov         eax,ebx
 0045DD4C    add         eax,eax
 0045DD4E    push        eax
 0045DD4F    push        2
 0045DD51    mov         eax,edi
 0045DD53    call        @UStrToPWChar
 0045DD58    mov         ecx,eax
 0045DD5A    mov         edx,ebp
 0045DD5C    mov         eax,esi
 0045DD5E    call        TRegistry.PutData
 0045DD63    pop         ebp
 0045DD64    pop         edi
 0045DD65    pop         esi
 0045DD66    pop         ebx
 0045DD67    ret
*}
end;

//0045DD68
function TRegistry.ReadString(Name:string):string;
begin
{*
 0045DD68    push        ebx
 0045DD69    push        esi
 0045DD6A    push        edi
 0045DD6B    push        ebp
 0045DD6C    push        ecx
 0045DD6D    mov         edi,ecx
 0045DD6F    mov         ebp,edx
 0045DD71    mov         esi,eax
 0045DD73    mov         edx,ebp
 0045DD75    mov         eax,esi
 0045DD77    call        TRegistry.GetDataSize
 0045DD7C    mov         ebx,eax
 0045DD7E    test        ebx,ebx
>0045DD80    jle         0045DDD8
 0045DD82    mov         ecx,ebx
 0045DD84    sar         ecx,1
>0045DD86    jns         0045DD8B
 0045DD88    adc         ecx,0
 0045DD8B    mov         eax,edi
 0045DD8D    xor         edx,edx
 0045DD8F    call        @UStrFromPWCharLen
 0045DD94    push        ebx
 0045DD95    lea         eax,[esp+4]
 0045DD99    push        eax
 0045DD9A    mov         eax,dword ptr [edi]
 0045DD9C    call        @UStrToPWChar
 0045DDA1    mov         ecx,eax
 0045DDA3    mov         edx,ebp
 0045DDA5    mov         eax,esi
 0045DDA7    call        TRegistry.GetData
 0045DDAC    cmp         byte ptr [esp],1
>0045DDB0    je          0045DDB8
 0045DDB2    cmp         byte ptr [esp],2
>0045DDB6    jne         0045DDCF
 0045DDB8    mov         eax,dword ptr [edi]
 0045DDBA    call        @UStrToPWChar
 0045DDBF    call        StrLen
 0045DDC4    mov         edx,eax
 0045DDC6    mov         eax,edi
 0045DDC8    call        @UStrSetLength
>0045DDCD    jmp         0045DDDF
 0045DDCF    mov         eax,ebp
 0045DDD1    call        ReadError
>0045DDD6    jmp         0045DDDF
 0045DDD8    mov         eax,edi
 0045DDDA    call        @UStrClr
 0045DDDF    pop         edx
 0045DDE0    pop         ebp
 0045DDE1    pop         edi
 0045DDE2    pop         esi
 0045DDE3    pop         ebx
 0045DDE4    ret
*}
end;

//0045DE1C
function TRegistry.GetDataAsString(ValueName:string; PrefixType:Boolean):string;
begin
{*
 0045DE1C    push        ebp
 0045DE1D    mov         ebp,esp
 0045DE1F    add         esp,0FFFFFFEC
 0045DE22    push        ebx
 0045DE23    push        esi
 0045DE24    push        edi
 0045DE25    xor         ebx,ebx
 0045DE27    mov         dword ptr [ebp-14],ebx
 0045DE2A    mov         dword ptr [ebp-4],ebx
 0045DE2D    mov         byte ptr [ebp-5],cl
 0045DE30    mov         edi,edx
 0045DE32    mov         ebx,eax
 0045DE34    mov         esi,dword ptr [ebp+8]
 0045DE37    xor         eax,eax
 0045DE39    push        ebp
 0045DE3A    push        45DF8B
 0045DE3F    push        dword ptr fs:[eax]
 0045DE42    mov         dword ptr fs:[eax],esp
 0045DE45    mov         eax,esi
 0045DE47    call        @UStrClr
 0045DE4C    lea         ecx,[ebp-10]
 0045DE4F    mov         edx,edi
 0045DE51    mov         eax,ebx
 0045DE53    call        TRegistry.GetDataInfo
 0045DE58    test        al,al
>0045DE5A    je          0045DF67
 0045DE60    cmp         dword ptr [ebp-0C],0
>0045DE64    jle         0045DF67
 0045DE6A    movzx       eax,byte ptr [ebp-10]
 0045DE6E    sub         al,1
>0045DE70    jb          0045DF08
 0045DE76    sub         al,2
>0045DE78    jb          0045DE89
>0045DE7A    je          0045DEC9
 0045DE7C    dec         al
>0045DE7E    je          0045DF08
>0045DE84    jmp         0045DF67
 0045DE89    mov         eax,esi
 0045DE8B    mov         ecx,dword ptr [ebp-0C]
 0045DE8E    xor         edx,edx
 0045DE90    call        @UStrFromPWCharLen
 0045DE95    mov         eax,dword ptr [ebp-0C]
 0045DE98    push        eax
 0045DE99    lea         eax,[ebp-10]
 0045DE9C    push        eax
 0045DE9D    mov         eax,dword ptr [esi]
 0045DE9F    call        @UStrToPWChar
 0045DEA4    mov         ecx,eax
 0045DEA6    mov         edx,edi
 0045DEA8    mov         eax,ebx
 0045DEAA    call        TRegistry.GetData
 0045DEAF    mov         eax,dword ptr [esi]
 0045DEB1    call        @UStrToPWChar
 0045DEB6    call        StrLen
 0045DEBB    mov         edx,eax
 0045DEBD    mov         eax,esi
 0045DEBF    call        @UStrSetLength
>0045DEC4    jmp         0045DF67
 0045DEC9    cmp         byte ptr [ebp-5],0
>0045DECD    je          0045DEF6
 0045DECF    mov         edx,edi
 0045DED1    mov         eax,ebx
 0045DED3    call        TRegistry.ReadInteger
 0045DED8    lea         ecx,[ebp-14]
 0045DEDB    mov         edx,8
 0045DEE0    call        IntToHex
 0045DEE5    mov         ecx,dword ptr [ebp-14]
 0045DEE8    mov         eax,esi
 0045DEEA    mov         edx,45DFA8;'dword:'
 0045DEEF    call        @UStrCat3
>0045DEF4    jmp         0045DF67
 0045DEF6    mov         edx,edi
 0045DEF8    mov         eax,ebx
 0045DEFA    call        TRegistry.ReadInteger
 0045DEFF    mov         edx,esi
 0045DF01    call        IntToStr
>0045DF06    jmp         0045DF67
 0045DF08    mov         eax,dword ptr [ebp-0C]
 0045DF0B    push        eax
 0045DF0C    lea         eax,[ebp-4]
 0045DF0F    mov         ecx,1
 0045DF14    mov         edx,dword ptr ds:[45DDE8];:TRegistry.:2
 0045DF1A    call        @DynArraySetLength
 0045DF1F    add         esp,4
 0045DF22    mov         eax,dword ptr [ebp-0C]
 0045DF25    push        eax
 0045DF26    mov         ecx,dword ptr [ebp-4]
 0045DF29    mov         edx,edi
 0045DF2B    mov         eax,ebx
 0045DF2D    call        TRegistry.ReadBinaryData
 0045DF32    cmp         byte ptr [ebp-5],0
>0045DF36    je          0045DF52
 0045DF38    push        esi
 0045DF39    mov         eax,dword ptr [ebp-4]
 0045DF3C    call        @DynArrayHigh
 0045DF41    mov         edx,eax
 0045DF43    mov         ecx,45DFC4;'hex:'
 0045DF48    mov         eax,dword ptr [ebp-4]
 0045DF4B    call        BinaryToHexString
>0045DF50    jmp         0045DF67
 0045DF52    push        esi
 0045DF53    mov         eax,dword ptr [ebp-4]
 0045DF56    call        @DynArrayHigh
 0045DF5B    mov         edx,eax
 0045DF5D    xor         ecx,ecx
 0045DF5F    mov         eax,dword ptr [ebp-4]
 0045DF62    call        BinaryToHexString
 0045DF67    xor         eax,eax
 0045DF69    pop         edx
 0045DF6A    pop         ecx
 0045DF6B    pop         ecx
 0045DF6C    mov         dword ptr fs:[eax],edx
 0045DF6F    push        45DF92
 0045DF74    lea         eax,[ebp-14]
 0045DF77    call        @UStrClr
 0045DF7C    lea         eax,[ebp-4]
 0045DF7F    mov         edx,dword ptr ds:[45DDE8];:TRegistry.:2
 0045DF85    call        @DynArrayClear
 0045DF8A    ret
>0045DF8B    jmp         @HandleFinally
>0045DF90    jmp         0045DF74
 0045DF92    pop         edi
 0045DF93    pop         esi
 0045DF94    pop         ebx
 0045DF95    mov         esp,ebp
 0045DF97    pop         ebp
 0045DF98    ret         4
*}
end;

//0045DFD0
procedure TRegistry.WriteInteger(Name:string; Value:Integer);
begin
{*
 0045DFD0    push        ecx
 0045DFD1    mov         dword ptr [esp],ecx
 0045DFD4    push        4
 0045DFD6    push        3
 0045DFD8    lea         ecx,[esp+8]
 0045DFDC    call        TRegistry.PutData
 0045DFE1    pop         edx
 0045DFE2    ret
*}
end;

//0045DFE4
function TRegistry.ReadInteger(Name:string):Integer;
begin
{*
 0045DFE4    push        ebx
 0045DFE5    add         esp,0FFFFFFF8
 0045DFE8    mov         ebx,edx
 0045DFEA    push        4
 0045DFEC    lea         edx,[esp+8]
 0045DFF0    push        edx
 0045DFF1    lea         ecx,[esp+8]
 0045DFF5    mov         edx,ebx
 0045DFF7    call        TRegistry.GetData
 0045DFFC    cmp         byte ptr [esp+4],3
>0045E001    je          0045E00A
 0045E003    mov         eax,ebx
 0045E005    call        ReadError
 0045E00A    mov         eax,dword ptr [esp]
 0045E00D    pop         ecx
 0045E00E    pop         edx
 0045E00F    pop         ebx
 0045E010    ret
*}
end;

//0045E014
procedure TRegistry.WriteBool(Name:string; Value:Boolean);
begin
{*
 0045E014    and         ecx,7F
 0045E017    call        TRegistry.WriteInteger
 0045E01C    ret
*}
end;

//0045E020
function TRegistry.ReadBool(Name:string):Boolean;
begin
{*
 0045E020    push        ebx
 0045E021    push        esi
 0045E022    mov         esi,edx
 0045E024    mov         ebx,eax
 0045E026    mov         edx,esi
 0045E028    mov         eax,ebx
 0045E02A    call        TRegistry.ReadInteger
 0045E02F    test        eax,eax
 0045E031    setne       al
 0045E034    pop         esi
 0045E035    pop         ebx
 0045E036    ret
*}
end;

//0045E038
procedure TRegistry.WriteFloat(Name:string; Value:Double);
begin
{*
 0045E038    push        ebp
 0045E039    mov         ebp,esp
 0045E03B    push        8
 0045E03D    push        4
 0045E03F    lea         ecx,[ebp+8]
 0045E042    call        TRegistry.PutData
 0045E047    pop         ebp
 0045E048    ret         8
*}
end;

//0045E04C
function TRegistry.ReadFloat(Name:string):Double;
begin
{*
 0045E04C    push        ebx
 0045E04D    add         esp,0FFFFFFF4
 0045E050    mov         ebx,edx
 0045E052    push        8
 0045E054    lea         edx,[esp+0C]
 0045E058    push        edx
 0045E059    lea         ecx,[esp+8]
 0045E05D    mov         edx,ebx
 0045E05F    call        TRegistry.GetData
 0045E064    cmp         byte ptr [esp+8],4
>0045E069    jne         0045E070
 0045E06B    cmp         eax,8
>0045E06E    je          0045E077
 0045E070    mov         eax,ebx
 0045E072    call        ReadError
 0045E077    fld         qword ptr [esp]
 0045E07A    add         esp,0C
 0045E07D    pop         ebx
 0045E07E    ret
*}
end;

//0045E080
procedure TRegistry.WriteCurrency(Name:string; Value:Currency);
begin
{*
 0045E080    push        ebp
 0045E081    mov         ebp,esp
 0045E083    push        8
 0045E085    push        4
 0045E087    lea         ecx,[ebp+8]
 0045E08A    call        TRegistry.PutData
 0045E08F    pop         ebp
 0045E090    ret         8
*}
end;

//0045E094
function TRegistry.ReadCurrency(Name:string):Currency;
begin
{*
 0045E094    push        ebx
 0045E095    add         esp,0FFFFFFF4
 0045E098    mov         ebx,edx
 0045E09A    push        8
 0045E09C    lea         edx,[esp+0C]
 0045E0A0    push        edx
 0045E0A1    lea         ecx,[esp+8]
 0045E0A5    mov         edx,ebx
 0045E0A7    call        TRegistry.GetData
 0045E0AC    cmp         byte ptr [esp+8],4
>0045E0B1    jne         0045E0B8
 0045E0B3    cmp         eax,8
>0045E0B6    je          0045E0BF
 0045E0B8    mov         eax,ebx
 0045E0BA    call        ReadError
 0045E0BF    fild        qword ptr [esp]
 0045E0C2    add         esp,0C
 0045E0C5    pop         ebx
 0045E0C6    ret
*}
end;

//0045E0C8
procedure TRegistry.WriteDateTime(Name:string; Value:TDateTime);
begin
{*
 0045E0C8    push        ebp
 0045E0C9    mov         ebp,esp
 0045E0CB    push        8
 0045E0CD    push        4
 0045E0CF    lea         ecx,[ebp+8]
 0045E0D2    call        TRegistry.PutData
 0045E0D7    pop         ebp
 0045E0D8    ret         8
*}
end;

//0045E0DC
function TRegistry.ReadDateTime(Name:string):TDateTime;
begin
{*
 0045E0DC    push        ebx
 0045E0DD    add         esp,0FFFFFFF4
 0045E0E0    mov         ebx,edx
 0045E0E2    push        8
 0045E0E4    lea         edx,[esp+0C]
 0045E0E8    push        edx
 0045E0E9    lea         ecx,[esp+8]
 0045E0ED    mov         edx,ebx
 0045E0EF    call        TRegistry.GetData
 0045E0F4    cmp         byte ptr [esp+8],4
>0045E0F9    jne         0045E100
 0045E0FB    cmp         eax,8
>0045E0FE    je          0045E107
 0045E100    mov         eax,ebx
 0045E102    call        ReadError
 0045E107    fld         qword ptr [esp]
 0045E10A    add         esp,0C
 0045E10D    pop         ebx
 0045E10E    ret
*}
end;

//0045E110
{*procedure TRegistry.WriteDate(Name:string; Value:TDateTime; ?:?);
begin
 0045E110    push        ebp
 0045E111    mov         ebp,esp
 0045E113    push        dword ptr [ebp+0C]
 0045E116    push        dword ptr [ebp+8]
 0045E119    call        TRegistry.WriteDateTime
 0045E11E    pop         ebp
 0045E11F    ret         8
end;*}

//0045E124
procedure TRegistry.ReadDate(Name:string);
begin
{*
 0045E124    add         esp,0FFFFFFF8
 0045E127    call        TRegistry.ReadDateTime
 0045E12C    fstp        qword ptr [esp]
 0045E12F    wait
 0045E130    fld         qword ptr [esp]
 0045E133    pop         ecx
 0045E134    pop         edx
 0045E135    ret
*}
end;

//0045E138
{*procedure TRegistry.WriteTime(Name:string; Value:TDateTime; ?:?);
begin
 0045E138    push        ebp
 0045E139    mov         ebp,esp
 0045E13B    push        dword ptr [ebp+0C]
 0045E13E    push        dword ptr [ebp+8]
 0045E141    call        TRegistry.WriteDateTime
 0045E146    pop         ebp
 0045E147    ret         8
end;*}

//0045E14C
procedure TRegistry.ReadTime(Name:string);
begin
{*
 0045E14C    add         esp,0FFFFFFF8
 0045E14F    call        TRegistry.ReadDateTime
 0045E154    fstp        qword ptr [esp]
 0045E157    wait
 0045E158    fld         qword ptr [esp]
 0045E15B    pop         ecx
 0045E15C    pop         edx
 0045E15D    ret
*}
end;

//0045E160
{*procedure TRegistry.WriteBinaryData(Name:string; var Buffer:?; BufSize:Integer);
begin
 0045E160    push        ebp
 0045E161    mov         ebp,esp
 0045E163    push        ebx
 0045E164    mov         ebx,dword ptr [ebp+8]
 0045E167    push        ebx
 0045E168    push        4
 0045E16A    call        TRegistry.PutData
 0045E16F    pop         ebx
 0045E170    pop         ebp
 0045E171    ret         4
end;*}

//0045E174
{*function TRegistry.ReadBinaryData(Name:string; var Buffer:?; BufSize:Integer):Integer;
begin
 0045E174    push        ebp
 0045E175    mov         ebp,esp
 0045E177    add         esp,0FFFFFFF0
 0045E17A    push        ebx
 0045E17B    push        esi
 0045E17C    push        edi
 0045E17D    mov         dword ptr [ebp-4],ecx
 0045E180    mov         edi,edx
 0045E182    mov         ebx,eax
 0045E184    lea         ecx,[ebp-10]
 0045E187    mov         edx,edi
 0045E189    mov         eax,ebx
 0045E18B    call        TRegistry.GetDataInfo
 0045E190    test        al,al
>0045E192    je          0045E1CB
 0045E194    mov         esi,dword ptr [ebp-0C]
 0045E197    movzx       eax,byte ptr [ebp-10]
 0045E19B    mov         byte ptr [ebp-5],al
 0045E19E    cmp         byte ptr [ebp-5],4
>0045E1A2    je          0045E1AA
 0045E1A4    cmp         byte ptr [ebp-5],0
>0045E1A8    jne         0045E1C2
 0045E1AA    cmp         esi,dword ptr [ebp+8]
>0045E1AD    jg          0045E1C2
 0045E1AF    push        esi
 0045E1B0    lea         eax,[ebp-5]
 0045E1B3    push        eax
 0045E1B4    mov         ecx,dword ptr [ebp-4]
 0045E1B7    mov         edx,edi
 0045E1B9    mov         eax,ebx
 0045E1BB    call        TRegistry.GetData
>0045E1C0    jmp         0045E1CD
 0045E1C2    mov         eax,edi
 0045E1C4    call        ReadError
>0045E1C9    jmp         0045E1CD
 0045E1CB    xor         esi,esi
 0045E1CD    mov         eax,esi
 0045E1CF    pop         edi
 0045E1D0    pop         esi
 0045E1D1    pop         ebx
 0045E1D2    mov         esp,ebp
 0045E1D4    pop         ebp
 0045E1D5    ret         4
end;*}

//0045E1D8
procedure TRegistry.PutData(const Name:UnicodeString; Buffer:Pointer; BufSize:Integer; RegData:TRegDataType);
begin
{*
 0045E1D8    push        ebp
 0045E1D9    mov         ebp,esp
 0045E1DB    add         esp,0FFFFFFF4
 0045E1DE    push        ebx
 0045E1DF    push        esi
 0045E1E0    push        edi
 0045E1E1    mov         dword ptr [ebp-4],ecx
 0045E1E4    mov         edi,edx
 0045E1E6    mov         ebx,eax
 0045E1E8    movzx       eax,byte ptr [ebp+8]
 0045E1EC    call        RegDataToDataType
 0045E1F1    mov         esi,eax
 0045E1F3    mov         eax,dword ptr [ebp+0C]
 0045E1F6    push        eax
 0045E1F7    mov         eax,dword ptr [ebp-4]
 0045E1FA    push        eax
 0045E1FB    push        esi
 0045E1FC    push        0
 0045E1FE    mov         eax,edi
 0045E200    call        @UStrToPWChar
 0045E205    push        eax
 0045E206    mov         eax,dword ptr [ebx+4]
 0045E209    push        eax
 0045E20A    call        advapi32.RegSetValueExW
 0045E20F    mov         edx,eax
 0045E211    mov         eax,ebx
 0045E213    call        TRegistry.CheckResult
 0045E218    test        al,al
>0045E21A    jne         0045E240
 0045E21C    mov         dword ptr [ebp-0C],edi
 0045E21F    mov         byte ptr [ebp-8],11
 0045E223    lea         eax,[ebp-0C]
 0045E226    push        eax
 0045E227    push        0
 0045E229    mov         ecx,dword ptr ds:[78D3CC];^SResString140:TResStringRec
 0045E22F    mov         dl,1
 0045E231    mov         eax,[0045BE8C];ERegistryException
 0045E236    call        Exception.CreateResFmt
 0045E23B    call        @RaiseExcept
 0045E240    pop         edi
 0045E241    pop         esi
 0045E242    pop         ebx
 0045E243    mov         esp,ebp
 0045E245    pop         ebp
 0045E246    ret         8
*}
end;

//0045E24C
function TRegistry.GetData(const Name:UnicodeString; Buffer:Pointer; BufSize:Integer; var RegData:TRegDataType):Integer;
begin
{*
 0045E24C    push        ebp
 0045E24D    mov         ebp,esp
 0045E24F    add         esp,0FFFFFFF4
 0045E252    push        ebx
 0045E253    push        esi
 0045E254    push        edi
 0045E255    mov         edi,ecx
 0045E257    mov         esi,edx
 0045E259    mov         ebx,eax
 0045E25B    xor         eax,eax
 0045E25D    mov         dword ptr [ebp-4],eax
 0045E260    lea         eax,[ebp+0C]
 0045E263    push        eax
 0045E264    push        edi
 0045E265    lea         eax,[ebp-4]
 0045E268    push        eax
 0045E269    push        0
 0045E26B    mov         eax,esi
 0045E26D    call        @UStrToPWChar
 0045E272    push        eax
 0045E273    mov         eax,dword ptr [ebx+4]
 0045E276    push        eax
 0045E277    call        advapi32.RegQueryValueExW
 0045E27C    mov         edx,eax
 0045E27E    mov         eax,ebx
 0045E280    call        TRegistry.CheckResult
 0045E285    test        al,al
>0045E287    jne         0045E2AD
 0045E289    mov         dword ptr [ebp-0C],esi
 0045E28C    mov         byte ptr [ebp-8],11
 0045E290    lea         eax,[ebp-0C]
 0045E293    push        eax
 0045E294    push        0
 0045E296    mov         ecx,dword ptr ds:[78DBA4];^SResString139:TResStringRec
 0045E29C    mov         dl,1
 0045E29E    mov         eax,[0045BE8C];ERegistryException
 0045E2A3    call        Exception.CreateResFmt
 0045E2A8    call        @RaiseExcept
 0045E2AD    mov         ebx,dword ptr [ebp+0C]
 0045E2B0    mov         eax,dword ptr [ebp-4]
 0045E2B3    call        DataTypeToRegData
 0045E2B8    mov         edx,dword ptr [ebp+8]
 0045E2BB    mov         byte ptr [edx],al
 0045E2BD    mov         eax,ebx
 0045E2BF    pop         edi
 0045E2C0    pop         esi
 0045E2C1    pop         ebx
 0045E2C2    mov         esp,ebp
 0045E2C4    pop         ebp
 0045E2C5    ret         8
*}
end;

//0045E2C8
function TRegistry.HasSubKeys:Boolean;
begin
{*
 0045E2C8    push        ebx
 0045E2C9    add         esp,0FFFFFFE4
 0045E2CC    mov         ebx,eax
 0045E2CE    mov         edx,esp
 0045E2D0    mov         eax,ebx
 0045E2D2    call        TRegistry.GetKeyInfo
 0045E2D7    test        al,al
>0045E2D9    je          0045E2E1
 0045E2DB    cmp         dword ptr [esp],0
>0045E2DF    jg          0045E2E5
 0045E2E1    xor         eax,eax
>0045E2E3    jmp         0045E2E7
 0045E2E5    mov         al,1
 0045E2E7    add         esp,1C
 0045E2EA    pop         ebx
 0045E2EB    ret
*}
end;

//0045E2EC
function TRegistry.ValueExists(Name:string):Boolean;
begin
{*
 0045E2EC    add         esp,0FFFFFFF8
 0045E2EF    mov         ecx,esp
 0045E2F1    call        TRegistry.GetDataInfo
 0045E2F6    pop         ecx
 0045E2F7    pop         edx
 0045E2F8    ret
*}
end;

//0045E2FC
function TRegistry.GetKey(const Key:UnicodeString):HKEY;
begin
{*
 0045E2FC    push        ebp
 0045E2FD    mov         ebp,esp
 0045E2FF    add         esp,0FFFFFFF8
 0045E302    push        ebx
 0045E303    push        esi
 0045E304    xor         ecx,ecx
 0045E306    mov         dword ptr [ebp-4],ecx
 0045E309    mov         ebx,edx
 0045E30B    mov         esi,eax
 0045E30D    xor         eax,eax
 0045E30F    push        ebp
 0045E310    push        45E382
 0045E315    push        dword ptr fs:[eax]
 0045E318    mov         dword ptr fs:[eax],esp
 0045E31B    lea         eax,[ebp-4]
 0045E31E    mov         edx,ebx
 0045E320    call        @UStrLAsg
 0045E325    mov         eax,dword ptr [ebp-4]
 0045E328    call        IsRelative
 0045E32D    mov         ebx,eax
 0045E32F    test        bl,bl
>0045E331    jne         0045E345
 0045E333    lea         eax,[ebp-4]
 0045E336    mov         ecx,1
 0045E33B    mov         edx,1
 0045E340    call        @UStrDelete
 0045E345    xor         eax,eax
 0045E347    mov         dword ptr [ebp-8],eax
 0045E34A    lea         eax,[ebp-8]
 0045E34D    push        eax
 0045E34E    mov         eax,dword ptr [esi+18]
 0045E351    push        eax
 0045E352    push        0
 0045E354    mov         eax,dword ptr [ebp-4]
 0045E357    call        @UStrToPWChar
 0045E35C    push        eax
 0045E35D    mov         edx,ebx
 0045E35F    mov         eax,esi
 0045E361    call        TRegistry.GetBaseKey
 0045E366    push        eax
 0045E367    call        advapi32.RegOpenKeyExW
 0045E36C    xor         eax,eax
 0045E36E    pop         edx
 0045E36F    pop         ecx
 0045E370    pop         ecx
 0045E371    mov         dword ptr fs:[eax],edx
 0045E374    push        45E389
 0045E379    lea         eax,[ebp-4]
 0045E37C    call        @UStrClr
 0045E381    ret
>0045E382    jmp         @HandleFinally
>0045E387    jmp         0045E379
 0045E389    mov         eax,dword ptr [ebp-8]
 0045E38C    pop         esi
 0045E38D    pop         ebx
 0045E38E    pop         ecx
 0045E38F    pop         ecx
 0045E390    pop         ebp
 0045E391    ret
*}
end;

//0045E394
function TRegistry.RegistryConnect(UNCName:string):Boolean;
begin
{*
 0045E394    push        ebx
 0045E395    push        esi
 0045E396    push        ecx
 0045E397    mov         ebx,edx
 0045E399    mov         esi,eax
 0045E39B    push        esp
 0045E39C    mov         eax,dword ptr [esi+8]
 0045E39F    push        eax
 0045E3A0    mov         eax,ebx
 0045E3A2    call        @UStrToPWChar
 0045E3A7    push        eax
 0045E3A8    call        advapi32.RegConnectRegistryW
 0045E3AD    mov         edx,eax
 0045E3AF    mov         eax,esi
 0045E3B1    call        TRegistry.CheckResult
 0045E3B6    mov         ebx,eax
 0045E3B8    test        bl,bl
>0045E3BA    je          0045E3CA
 0045E3BC    mov         edx,dword ptr [esp]
 0045E3BF    mov         eax,esi
 0045E3C1    call        TRegistry.SetRootKey
 0045E3C6    mov         byte ptr [esi+14],1
 0045E3CA    mov         eax,ebx
 0045E3CC    pop         edx
 0045E3CD    pop         esi
 0045E3CE    pop         ebx
 0045E3CF    ret
*}
end;

//0045E3D0
function TRegistry.LoadKey(Key:string; FileName:string):Boolean;
begin
{*
 0045E3D0    push        ebp
 0045E3D1    mov         ebp,esp
 0045E3D3    push        0
 0045E3D5    push        ebx
 0045E3D6    push        esi
 0045E3D7    push        edi
 0045E3D8    mov         edi,ecx
 0045E3DA    mov         esi,edx
 0045E3DC    mov         ebx,eax
 0045E3DE    xor         eax,eax
 0045E3E0    push        ebp
 0045E3E1    push        45E44F
 0045E3E6    push        dword ptr fs:[eax]
 0045E3E9    mov         dword ptr fs:[eax],esp
 0045E3EC    lea         eax,[ebp-4]
 0045E3EF    mov         edx,esi
 0045E3F1    call        @UStrLAsg
 0045E3F6    mov         eax,dword ptr [ebp-4]
 0045E3F9    call        IsRelative
 0045E3FE    test        al,al
>0045E400    jne         0045E414
 0045E402    lea         eax,[ebp-4]
 0045E405    mov         ecx,1
 0045E40A    mov         edx,1
 0045E40F    call        @UStrDelete
 0045E414    mov         eax,edi
 0045E416    call        @UStrToPWChar
 0045E41B    push        eax
 0045E41C    mov         eax,dword ptr [ebp-4]
 0045E41F    call        @UStrToPWChar
 0045E424    push        eax
 0045E425    mov         eax,dword ptr [ebx+8]
 0045E428    push        eax
 0045E429    call        advapi32.RegLoadKeyW
 0045E42E    mov         edx,eax
 0045E430    mov         eax,ebx
 0045E432    call        TRegistry.CheckResult
 0045E437    mov         ebx,eax
 0045E439    xor         eax,eax
 0045E43B    pop         edx
 0045E43C    pop         ecx
 0045E43D    pop         ecx
 0045E43E    mov         dword ptr fs:[eax],edx
 0045E441    push        45E456
 0045E446    lea         eax,[ebp-4]
 0045E449    call        @UStrClr
 0045E44E    ret
>0045E44F    jmp         @HandleFinally
>0045E454    jmp         0045E446
 0045E456    mov         eax,ebx
 0045E458    pop         edi
 0045E459    pop         esi
 0045E45A    pop         ebx
 0045E45B    pop         ecx
 0045E45C    pop         ebp
 0045E45D    ret
*}
end;

//0045E460
function TRegistry.UnLoadKey(Key:string):Boolean;
begin
{*
 0045E460    push        ebp
 0045E461    mov         ebp,esp
 0045E463    push        0
 0045E465    push        ebx
 0045E466    push        esi
 0045E467    mov         esi,edx
 0045E469    mov         ebx,eax
 0045E46B    xor         eax,eax
 0045E46D    push        ebp
 0045E46E    push        45E4D4
 0045E473    push        dword ptr fs:[eax]
 0045E476    mov         dword ptr fs:[eax],esp
 0045E479    lea         eax,[ebp-4]
 0045E47C    mov         edx,esi
 0045E47E    call        @UStrLAsg
 0045E483    mov         eax,dword ptr [ebp-4]
 0045E486    call        IsRelative
 0045E48B    test        al,al
>0045E48D    jne         0045E4A1
 0045E48F    lea         eax,[ebp-4]
 0045E492    mov         ecx,1
 0045E497    mov         edx,1
 0045E49C    call        @UStrDelete
 0045E4A1    mov         eax,dword ptr [ebp-4]
 0045E4A4    call        @UStrToPWChar
 0045E4A9    push        eax
 0045E4AA    mov         eax,dword ptr [ebx+8]
 0045E4AD    push        eax
 0045E4AE    call        advapi32.RegUnLoadKeyW
 0045E4B3    mov         edx,eax
 0045E4B5    mov         eax,ebx
 0045E4B7    call        TRegistry.CheckResult
 0045E4BC    mov         ebx,eax
 0045E4BE    xor         eax,eax
 0045E4C0    pop         edx
 0045E4C1    pop         ecx
 0045E4C2    pop         ecx
 0045E4C3    mov         dword ptr fs:[eax],edx
 0045E4C6    push        45E4DB
 0045E4CB    lea         eax,[ebp-4]
 0045E4CE    call        @UStrClr
 0045E4D3    ret
>0045E4D4    jmp         @HandleFinally
>0045E4D9    jmp         0045E4CB
 0045E4DB    mov         eax,ebx
 0045E4DD    pop         esi
 0045E4DE    pop         ebx
 0045E4DF    pop         ecx
 0045E4E0    pop         ebp
 0045E4E1    ret
*}
end;

//0045E4E4
function TRegistry.RestoreKey(Key:string; FileName:string):Boolean;
begin
{*
 0045E4E4    push        ebp
 0045E4E5    mov         ebp,esp
 0045E4E7    add         esp,0FFFFFFF8
 0045E4EA    push        ebx
 0045E4EB    push        esi
 0045E4EC    mov         esi,ecx
 0045E4EE    mov         ebx,eax
 0045E4F0    mov         byte ptr [ebp-1],0
 0045E4F4    mov         eax,ebx
 0045E4F6    call        TRegistry.GetKey
 0045E4FB    mov         dword ptr [ebp-8],eax
 0045E4FE    cmp         dword ptr [ebp-8],0
>0045E502    je          0045E54F
 0045E504    xor         eax,eax
 0045E506    push        ebp
 0045E507    push        45E548
 0045E50C    push        dword ptr fs:[eax]
 0045E50F    mov         dword ptr fs:[eax],esp
 0045E512    push        0
 0045E514    mov         eax,esi
 0045E516    call        @UStrToPWChar
 0045E51B    push        eax
 0045E51C    mov         eax,dword ptr [ebp-8]
 0045E51F    push        eax
 0045E520    call        advapi32.RegRestoreKeyW
 0045E525    mov         edx,eax
 0045E527    mov         eax,ebx
 0045E529    call        TRegistry.CheckResult
 0045E52E    mov         byte ptr [ebp-1],al
 0045E531    xor         eax,eax
 0045E533    pop         edx
 0045E534    pop         ecx
 0045E535    pop         ecx
 0045E536    mov         dword ptr fs:[eax],edx
 0045E539    push        45E54F
 0045E53E    mov         eax,dword ptr [ebp-8]
 0045E541    push        eax
 0045E542    call        advapi32.RegCloseKey
 0045E547    ret
>0045E548    jmp         @HandleFinally
>0045E54D    jmp         0045E53E
 0045E54F    movzx       eax,byte ptr [ebp-1]
 0045E553    pop         esi
 0045E554    pop         ebx
 0045E555    pop         ecx
 0045E556    pop         ecx
 0045E557    pop         ebp
 0045E558    ret
*}
end;

//0045E55C
function TRegistry.ReplaceKey(Key:string; FileName:string; BackUpFileName:string):Boolean;
begin
{*
 0045E55C    push        ebp
 0045E55D    mov         ebp,esp
 0045E55F    push        0
 0045E561    push        ebx
 0045E562    push        esi
 0045E563    push        edi
 0045E564    mov         edi,ecx
 0045E566    mov         ebx,edx
 0045E568    mov         esi,eax
 0045E56A    xor         eax,eax
 0045E56C    push        ebp
 0045E56D    push        45E5EC
 0045E572    push        dword ptr fs:[eax]
 0045E575    mov         dword ptr fs:[eax],esp
 0045E578    lea         eax,[ebp-4]
 0045E57B    mov         edx,ebx
 0045E57D    call        @UStrLAsg
 0045E582    mov         eax,dword ptr [ebp-4]
 0045E585    call        IsRelative
 0045E58A    mov         ebx,eax
 0045E58C    test        bl,bl
>0045E58E    jne         0045E5A2
 0045E590    lea         eax,[ebp-4]
 0045E593    mov         ecx,1
 0045E598    mov         edx,1
 0045E59D    call        @UStrDelete
 0045E5A2    mov         eax,dword ptr [ebp+8]
 0045E5A5    call        @UStrToPWChar
 0045E5AA    push        eax
 0045E5AB    mov         eax,edi
 0045E5AD    call        @UStrToPWChar
 0045E5B2    push        eax
 0045E5B3    mov         eax,dword ptr [ebp-4]
 0045E5B6    call        @UStrToPWChar
 0045E5BB    push        eax
 0045E5BC    mov         edx,ebx
 0045E5BE    mov         eax,esi
 0045E5C0    call        TRegistry.GetBaseKey
 0045E5C5    push        eax
 0045E5C6    call        advapi32.RegReplaceKeyW
 0045E5CB    mov         edx,eax
 0045E5CD    mov         eax,esi
 0045E5CF    call        TRegistry.CheckResult
 0045E5D4    mov         ebx,eax
 0045E5D6    xor         eax,eax
 0045E5D8    pop         edx
 0045E5D9    pop         ecx
 0045E5DA    pop         ecx
 0045E5DB    mov         dword ptr fs:[eax],edx
 0045E5DE    push        45E5F3
 0045E5E3    lea         eax,[ebp-4]
 0045E5E6    call        @UStrClr
 0045E5EB    ret
>0045E5EC    jmp         @HandleFinally
>0045E5F1    jmp         0045E5E3
 0045E5F3    mov         eax,ebx
 0045E5F5    pop         edi
 0045E5F6    pop         esi
 0045E5F7    pop         ebx
 0045E5F8    pop         ecx
 0045E5F9    pop         ebp
 0045E5FA    ret         4
*}
end;

//0045E600
function TRegistry.SaveKey(Key:string; FileName:string):Boolean;
begin
{*
 0045E600    push        ebp
 0045E601    mov         ebp,esp
 0045E603    add         esp,0FFFFFFF8
 0045E606    push        ebx
 0045E607    push        esi
 0045E608    mov         esi,ecx
 0045E60A    mov         ebx,eax
 0045E60C    mov         byte ptr [ebp-1],0
 0045E610    mov         eax,ebx
 0045E612    call        TRegistry.GetKey
 0045E617    mov         dword ptr [ebp-8],eax
 0045E61A    cmp         dword ptr [ebp-8],0
>0045E61E    je          0045E66B
 0045E620    xor         eax,eax
 0045E622    push        ebp
 0045E623    push        45E664
 0045E628    push        dword ptr fs:[eax]
 0045E62B    mov         dword ptr fs:[eax],esp
 0045E62E    push        0
 0045E630    mov         eax,esi
 0045E632    call        @UStrToPWChar
 0045E637    push        eax
 0045E638    mov         eax,dword ptr [ebp-8]
 0045E63B    push        eax
 0045E63C    call        advapi32.RegSaveKeyW
 0045E641    mov         edx,eax
 0045E643    mov         eax,ebx
 0045E645    call        TRegistry.CheckResult
 0045E64A    mov         byte ptr [ebp-1],al
 0045E64D    xor         eax,eax
 0045E64F    pop         edx
 0045E650    pop         ecx
 0045E651    pop         ecx
 0045E652    mov         dword ptr fs:[eax],edx
 0045E655    push        45E66B
 0045E65A    mov         eax,dword ptr [ebp-8]
 0045E65D    push        eax
 0045E65E    call        advapi32.RegCloseKey
 0045E663    ret
>0045E664    jmp         @HandleFinally
>0045E669    jmp         0045E65A
 0045E66B    movzx       eax,byte ptr [ebp-1]
 0045E66F    pop         esi
 0045E670    pop         ebx
 0045E671    pop         ecx
 0045E672    pop         ecx
 0045E673    pop         ebp
 0045E674    ret
*}
end;

//0045E678
function TRegistry.KeyExists(Key:string):Boolean;
begin
{*
 0045E678    push        ebp
 0045E679    mov         ebp,esp
 0045E67B    add         esp,0FFFFFFF4
 0045E67E    push        ebx
 0045E67F    mov         dword ptr [ebp-4],eax
 0045E682    mov         eax,dword ptr [ebp-4]
 0045E685    mov         eax,dword ptr [eax+18]
 0045E688    mov         dword ptr [ebp-0C],eax
 0045E68B    xor         eax,eax
 0045E68D    push        ebp
 0045E68E    push        45E6DD
 0045E693    push        dword ptr fs:[eax]
 0045E696    mov         dword ptr fs:[eax],esp
 0045E699    mov         eax,dword ptr [ebp-0C]
 0045E69C    and         eax,300
 0045E6A1    or          eax,20009
 0045E6A6    mov         ecx,dword ptr [ebp-4]
 0045E6A9    mov         dword ptr [ecx+18],eax
 0045E6AC    mov         eax,dword ptr [ebp-4]
 0045E6AF    call        TRegistry.GetKey
 0045E6B4    mov         ebx,eax
 0045E6B6    test        ebx,ebx
>0045E6B8    je          0045E6C0
 0045E6BA    push        ebx
 0045E6BB    call        advapi32.RegCloseKey
 0045E6C0    test        ebx,ebx
 0045E6C2    setne       byte ptr [ebp-5]
 0045E6C6    xor         eax,eax
 0045E6C8    pop         edx
 0045E6C9    pop         ecx
 0045E6CA    pop         ecx
 0045E6CB    mov         dword ptr fs:[eax],edx
 0045E6CE    push        45E6E4
 0045E6D3    mov         eax,dword ptr [ebp-4]
 0045E6D6    mov         edx,dword ptr [ebp-0C]
 0045E6D9    mov         dword ptr [eax+18],edx
 0045E6DC    ret
>0045E6DD    jmp         @HandleFinally
>0045E6E2    jmp         0045E6D3
 0045E6E4    movzx       eax,byte ptr [ebp-5]
 0045E6E8    pop         ebx
 0045E6E9    mov         esp,ebp
 0045E6EB    pop         ebp
 0045E6EC    ret
*}
end;

//0045E6F0
procedure TRegistry.RenameValue(OldName:string; NewName:string);
begin
{*
 0045E6F0    push        ebp
 0045E6F1    mov         ebp,esp
 0045E6F3    add         esp,0FFFFFFF4
 0045E6F6    push        ebx
 0045E6F7    push        esi
 0045E6F8    push        edi
 0045E6F9    mov         edi,ecx
 0045E6FB    mov         dword ptr [ebp-4],edx
 0045E6FE    mov         ebx,eax
 0045E700    mov         edx,edi
 0045E702    mov         eax,ebx
 0045E704    call        TRegistry.ValueExists
 0045E709    test        al,al
>0045E70B    jne         0045E782
 0045E70D    mov         edx,dword ptr [ebp-4]
 0045E710    mov         eax,ebx
 0045E712    call        TRegistry.GetDataSize
 0045E717    mov         esi,eax
 0045E719    test        esi,esi
>0045E71B    jle         0045E782
 0045E71D    mov         eax,esi
 0045E71F    call        AllocMem
 0045E724    mov         dword ptr [ebp-0C],eax
 0045E727    xor         eax,eax
 0045E729    push        ebp
 0045E72A    push        45E77B
 0045E72F    push        dword ptr fs:[eax]
 0045E732    mov         dword ptr fs:[eax],esp
 0045E735    push        esi
 0045E736    lea         eax,[ebp-5]
 0045E739    push        eax
 0045E73A    mov         ecx,dword ptr [ebp-0C]
 0045E73D    mov         edx,dword ptr [ebp-4]
 0045E740    mov         eax,ebx
 0045E742    call        TRegistry.GetData
 0045E747    mov         esi,eax
 0045E749    mov         edx,dword ptr [ebp-4]
 0045E74C    mov         eax,ebx
 0045E74E    call        TRegistry.DeleteValue
 0045E753    push        esi
 0045E754    movzx       eax,byte ptr [ebp-5]
 0045E758    push        eax
 0045E759    mov         ecx,dword ptr [ebp-0C]
 0045E75C    mov         edx,edi
 0045E75E    mov         eax,ebx
 0045E760    call        TRegistry.PutData
 0045E765    xor         eax,eax
 0045E767    pop         edx
 0045E768    pop         ecx
 0045E769    pop         ecx
 0045E76A    mov         dword ptr fs:[eax],edx
 0045E76D    push        45E782
 0045E772    mov         eax,dword ptr [ebp-0C]
 0045E775    call        @FreeMem
 0045E77A    ret
>0045E77B    jmp         @HandleFinally
>0045E780    jmp         0045E772
 0045E782    pop         edi
 0045E783    pop         esi
 0045E784    pop         ebx
 0045E785    mov         esp,ebp
 0045E787    pop         ebp
 0045E788    ret
*}
end;

//0045E78C
procedure MoveValue(SrcKey:HKEY; DestKey:HKEY; const Name:UnicodeString);
begin
{*
 0045E78C    push        ebp
 0045E78D    mov         ebp,esp
 0045E78F    add         esp,0FFFFFFEC
 0045E792    push        ebx
 0045E793    push        esi
 0045E794    mov         esi,ecx
 0045E796    mov         dword ptr [ebp-4],edx
 0045E799    mov         edx,dword ptr [ebp+8]
 0045E79C    mov         edx,dword ptr [edx-4]
 0045E79F    mov         edx,dword ptr [edx+4]
 0045E7A2    mov         dword ptr [ebp-8],edx
 0045E7A5    mov         edx,dword ptr [ebp+8]
 0045E7A8    mov         edx,dword ptr [edx-4]
 0045E7AB    xchg        eax,edx
 0045E7AC    call        TRegistry.SetCurrentKey
 0045E7B1    xor         eax,eax
 0045E7B3    push        ebp
 0045E7B4    push        45E89F
 0045E7B9    push        dword ptr fs:[eax]
 0045E7BC    mov         dword ptr fs:[eax],esp
 0045E7BF    mov         eax,dword ptr [ebp+8]
 0045E7C2    mov         eax,dword ptr [eax-4]
 0045E7C5    mov         edx,esi
 0045E7C7    call        TRegistry.GetDataSize
 0045E7CC    mov         ebx,eax
 0045E7CE    test        ebx,ebx
>0045E7D0    jle         0045E883
 0045E7D6    mov         eax,ebx
 0045E7D8    call        AllocMem
 0045E7DD    mov         dword ptr [ebp-10],eax
 0045E7E0    xor         eax,eax
 0045E7E2    push        ebp
 0045E7E3    push        45E87C
 0045E7E8    push        dword ptr fs:[eax]
 0045E7EB    mov         dword ptr fs:[eax],esp
 0045E7EE    push        ebx
 0045E7EF    lea         eax,[ebp-11]
 0045E7F2    push        eax
 0045E7F3    mov         eax,dword ptr [ebp+8]
 0045E7F6    mov         eax,dword ptr [eax-4]
 0045E7F9    mov         ecx,dword ptr [ebp-10]
 0045E7FC    mov         edx,esi
 0045E7FE    call        TRegistry.GetData
 0045E803    mov         ebx,eax
 0045E805    mov         eax,dword ptr [ebp+8]
 0045E808    mov         eax,dword ptr [eax-4]
 0045E80B    mov         eax,dword ptr [eax+4]
 0045E80E    mov         dword ptr [ebp-0C],eax
 0045E811    mov         eax,dword ptr [ebp+8]
 0045E814    mov         eax,dword ptr [eax-4]
 0045E817    mov         edx,dword ptr [ebp-4]
 0045E81A    call        TRegistry.SetCurrentKey
 0045E81F    xor         eax,eax
 0045E821    push        ebp
 0045E822    push        45E85F
 0045E827    push        dword ptr fs:[eax]
 0045E82A    mov         dword ptr fs:[eax],esp
 0045E82D    push        ebx
 0045E82E    movzx       eax,byte ptr [ebp-11]
 0045E832    push        eax
 0045E833    mov         eax,dword ptr [ebp+8]
 0045E836    mov         eax,dword ptr [eax-4]
 0045E839    mov         ecx,dword ptr [ebp-10]
 0045E83C    mov         edx,esi
 0045E83E    call        TRegistry.PutData
 0045E843    xor         eax,eax
 0045E845    pop         edx
 0045E846    pop         ecx
 0045E847    pop         ecx
 0045E848    mov         dword ptr fs:[eax],edx
 0045E84B    push        45E866
 0045E850    mov         eax,dword ptr [ebp+8]
 0045E853    mov         eax,dword ptr [eax-4]
 0045E856    mov         edx,dword ptr [ebp-0C]
 0045E859    call        TRegistry.SetCurrentKey
 0045E85E    ret
>0045E85F    jmp         @HandleFinally
>0045E864    jmp         0045E850
 0045E866    xor         eax,eax
 0045E868    pop         edx
 0045E869    pop         ecx
 0045E86A    pop         ecx
 0045E86B    mov         dword ptr fs:[eax],edx
 0045E86E    push        45E883
 0045E873    mov         eax,dword ptr [ebp-10]
 0045E876    call        @FreeMem
 0045E87B    ret
>0045E87C    jmp         @HandleFinally
>0045E881    jmp         0045E873
 0045E883    xor         eax,eax
 0045E885    pop         edx
 0045E886    pop         ecx
 0045E887    pop         ecx
 0045E888    mov         dword ptr fs:[eax],edx
 0045E88B    push        45E8A6
 0045E890    mov         eax,dword ptr [ebp+8]
 0045E893    mov         eax,dword ptr [eax-4]
 0045E896    mov         edx,dword ptr [ebp-8]
 0045E899    call        TRegistry.SetCurrentKey
 0045E89E    ret
>0045E89F    jmp         @HandleFinally
>0045E8A4    jmp         0045E890
 0045E8A6    pop         esi
 0045E8A7    pop         ebx
 0045E8A8    mov         esp,ebp
 0045E8AA    pop         ebp
 0045E8AB    ret
*}
end;

//0045E8AC
procedure CopyValues(SrcKey:HKEY; DestKey:HKEY);
begin
{*
 0045E8AC    push        ebp
 0045E8AD    mov         ebp,esp
 0045E8AF    add         esp,0FFFFFFD0
 0045E8B2    push        ebx
 0045E8B3    push        esi
 0045E8B4    push        edi
 0045E8B5    xor         ecx,ecx
 0045E8B7    mov         dword ptr [ebp-30],ecx
 0045E8BA    mov         dword ptr [ebp-4],ecx
 0045E8BD    mov         dword ptr [ebp-8],edx
 0045E8C0    mov         esi,eax
 0045E8C2    xor         eax,eax
 0045E8C4    push        ebp
 0045E8C5    push        45E9D4
 0045E8CA    push        dword ptr fs:[eax]
 0045E8CD    mov         dword ptr fs:[eax],esp
 0045E8D0    mov         eax,dword ptr [ebp+8]
 0045E8D3    mov         eax,dword ptr [eax-4]
 0045E8D6    mov         eax,dword ptr [eax+4]
 0045E8D9    mov         dword ptr [ebp-10],eax
 0045E8DC    mov         eax,dword ptr [ebp+8]
 0045E8DF    mov         eax,dword ptr [eax-4]
 0045E8E2    mov         edx,esi
 0045E8E4    call        TRegistry.SetCurrentKey
 0045E8E9    xor         eax,eax
 0045E8EB    push        ebp
 0045E8EC    push        45E9AF
 0045E8F1    push        dword ptr fs:[eax]
 0045E8F4    mov         dword ptr fs:[eax],esp
 0045E8F7    lea         edx,[ebp-2C]
 0045E8FA    mov         eax,dword ptr [ebp+8]
 0045E8FD    mov         eax,dword ptr [eax-4]
 0045E900    call        TRegistry.GetKeyInfo
 0045E905    test        al,al
>0045E907    je          0045E993
 0045E90D    mov         eax,dword ptr [ebp+8]
 0045E910    push        eax
 0045E911    xor         ecx,ecx
 0045E913    mov         edx,dword ptr [ebp-8]
 0045E916    mov         eax,esi
 0045E918    call        MoveValue
 0045E91D    pop         ecx
 0045E91E    mov         ecx,dword ptr [ebp-20]
 0045E921    inc         ecx
 0045E922    lea         eax,[ebp-4]
 0045E925    xor         edx,edx
 0045E927    call        @UStrFromPWCharLen
 0045E92C    mov         ebx,dword ptr [ebp-24]
 0045E92F    dec         ebx
 0045E930    test        ebx,ebx
>0045E932    jl          0045E993
 0045E934    inc         ebx
 0045E935    xor         edi,edi
 0045E937    mov         eax,dword ptr [ebp-20]
 0045E93A    inc         eax
 0045E93B    mov         dword ptr [ebp-0C],eax
 0045E93E    push        0
 0045E940    push        0
 0045E942    push        0
 0045E944    push        0
 0045E946    lea         eax,[ebp-0C]
 0045E949    push        eax
 0045E94A    mov         eax,dword ptr [ebp-4]
 0045E94D    call        @UStrToPWChar
 0045E952    push        eax
 0045E953    push        edi
 0045E954    push        esi
 0045E955    call        advapi32.RegEnumValueW
 0045E95A    mov         edx,eax
 0045E95C    mov         eax,dword ptr [ebp+8]
 0045E95F    mov         eax,dword ptr [eax-4]
 0045E962    call        TRegistry.CheckResult
 0045E967    test        al,al
>0045E969    je          0045E98F
 0045E96B    mov         eax,dword ptr [ebp+8]
 0045E96E    push        eax
 0045E96F    mov         eax,dword ptr [ebp-4]
 0045E972    call        @UStrToPWChar
 0045E977    mov         edx,eax
 0045E979    lea         eax,[ebp-30]
 0045E97C    call        @UStrFromPWChar
 0045E981    mov         ecx,dword ptr [ebp-30]
 0045E984    mov         edx,dword ptr [ebp-8]
 0045E987    mov         eax,esi
 0045E989    call        MoveValue
 0045E98E    pop         ecx
 0045E98F    inc         edi
 0045E990    dec         ebx
>0045E991    jne         0045E937
 0045E993    xor         eax,eax
 0045E995    pop         edx
 0045E996    pop         ecx
 0045E997    pop         ecx
 0045E998    mov         dword ptr fs:[eax],edx
 0045E99B    push        45E9B6
 0045E9A0    mov         eax,dword ptr [ebp+8]
 0045E9A3    mov         eax,dword ptr [eax-4]
 0045E9A6    mov         edx,dword ptr [ebp-10]
 0045E9A9    call        TRegistry.SetCurrentKey
 0045E9AE    ret
>0045E9AF    jmp         @HandleFinally
>0045E9B4    jmp         0045E9A0
 0045E9B6    xor         eax,eax
 0045E9B8    pop         edx
 0045E9B9    pop         ecx
 0045E9BA    pop         ecx
 0045E9BB    mov         dword ptr fs:[eax],edx
 0045E9BE    push        45E9DB
 0045E9C3    lea         eax,[ebp-30]
 0045E9C6    call        @UStrClr
 0045E9CB    lea         eax,[ebp-4]
 0045E9CE    call        @UStrClr
 0045E9D3    ret
>0045E9D4    jmp         @HandleFinally
>0045E9D9    jmp         0045E9C3
 0045E9DB    pop         edi
 0045E9DC    pop         esi
 0045E9DD    pop         ebx
 0045E9DE    mov         esp,ebp
 0045E9E0    pop         ebp
 0045E9E1    ret
*}
end;

//0045E9E4
procedure CopyKeys(SrcKey:HKEY; DestKey:HKEY);
begin
{*
 0045E9E4    push        ebp
 0045E9E5    mov         ebp,esp
 0045E9E7    add         esp,0FFFFFFB0
 0045E9EA    xor         ecx,ecx
 0045E9EC    mov         dword ptr [ebp-50],ecx
 0045E9EF    mov         dword ptr [ebp-4C],ecx
 0045E9F2    mov         dword ptr [ebp-48],ecx
 0045E9F5    mov         dword ptr [ebp-4],ecx
 0045E9F8    mov         dword ptr [ebp-0C],edx
 0045E9FB    mov         dword ptr [ebp-8],eax
 0045E9FE    xor         eax,eax
 0045EA00    push        ebp
 0045EA01    push        45EC32
 0045EA06    push        dword ptr fs:[eax]
 0045EA09    mov         dword ptr fs:[eax],esp
 0045EA0C    mov         eax,dword ptr [ebp+8]
 0045EA0F    mov         eax,dword ptr [eax-4]
 0045EA12    mov         eax,dword ptr [eax+4]
 0045EA15    mov         dword ptr [ebp-18],eax
 0045EA18    mov         eax,dword ptr [ebp+8]
 0045EA1B    mov         eax,dword ptr [eax-4]
 0045EA1E    mov         edx,dword ptr [ebp-8]
 0045EA21    call        TRegistry.SetCurrentKey
 0045EA26    xor         eax,eax
 0045EA28    push        ebp
 0045EA29    push        45EC08
 0045EA2E    push        dword ptr fs:[eax]
 0045EA31    mov         dword ptr fs:[eax],esp
 0045EA34    lea         edx,[ebp-44]
 0045EA37    mov         eax,dword ptr [ebp+8]
 0045EA3A    mov         eax,dword ptr [eax-4]
 0045EA3D    call        TRegistry.GetKeyInfo
 0045EA42    test        al,al
>0045EA44    je          0045EBEC
 0045EA4A    mov         ecx,dword ptr [ebp-40]
 0045EA4D    inc         ecx
 0045EA4E    lea         eax,[ebp-4]
 0045EA51    xor         edx,edx
 0045EA53    call        @UStrFromPWCharLen
 0045EA58    mov         eax,dword ptr [ebp-44]
 0045EA5B    dec         eax
 0045EA5C    test        eax,eax
>0045EA5E    jl          0045EBEC
 0045EA64    inc         eax
 0045EA65    mov         dword ptr [ebp-28],eax
 0045EA68    mov         dword ptr [ebp-14],0
 0045EA6F    mov         eax,dword ptr [ebp-40]
 0045EA72    inc         eax
 0045EA73    mov         dword ptr [ebp-10],eax
 0045EA76    push        0
 0045EA78    push        0
 0045EA7A    push        0
 0045EA7C    push        0
 0045EA7E    lea         eax,[ebp-10]
 0045EA81    push        eax
 0045EA82    mov         eax,dword ptr [ebp-4]
 0045EA85    call        @UStrToPWChar
 0045EA8A    push        eax
 0045EA8B    mov         eax,dword ptr [ebp-14]
 0045EA8E    push        eax
 0045EA8F    mov         eax,dword ptr [ebp-8]
 0045EA92    push        eax
 0045EA93    call        advapi32.RegEnumKeyExW
 0045EA98    mov         edx,eax
 0045EA9A    mov         eax,dword ptr [ebp+8]
 0045EA9D    mov         eax,dword ptr [eax-4]
 0045EAA0    call        TRegistry.CheckResult
 0045EAA5    test        al,al
>0045EAA7    je          0045EBE0
 0045EAAD    mov         eax,dword ptr [ebp-4]
 0045EAB0    call        @UStrToPWChar
 0045EAB5    mov         edx,eax
 0045EAB7    lea         eax,[ebp-48]
 0045EABA    call        @UStrFromPWChar
 0045EABF    mov         edx,dword ptr [ebp-48]
 0045EAC2    mov         eax,dword ptr [ebp+8]
 0045EAC5    mov         eax,dword ptr [eax-4]
 0045EAC8    call        TRegistry.GetKey
 0045EACD    mov         dword ptr [ebp-20],eax
 0045EAD0    cmp         dword ptr [ebp-20],0
>0045EAD4    je          0045EBE0
 0045EADA    xor         eax,eax
 0045EADC    push        ebp
 0045EADD    push        45EBD9
 0045EAE2    push        dword ptr fs:[eax]
 0045EAE5    mov         dword ptr fs:[eax],esp
 0045EAE8    mov         eax,dword ptr [ebp+8]
 0045EAEB    mov         eax,dword ptr [eax-4]
 0045EAEE    mov         eax,dword ptr [eax+4]
 0045EAF1    mov         dword ptr [ebp-1C],eax
 0045EAF4    mov         eax,dword ptr [ebp+8]
 0045EAF7    mov         eax,dword ptr [eax-4]
 0045EAFA    mov         edx,dword ptr [ebp-0C]
 0045EAFD    call        TRegistry.SetCurrentKey
 0045EB02    xor         eax,eax
 0045EB04    push        ebp
 0045EB05    push        45EBBB
 0045EB0A    push        dword ptr fs:[eax]
 0045EB0D    mov         dword ptr fs:[eax],esp
 0045EB10    mov         eax,dword ptr [ebp-4]
 0045EB13    call        @UStrToPWChar
 0045EB18    mov         edx,eax
 0045EB1A    lea         eax,[ebp-4C]
 0045EB1D    call        @UStrFromPWChar
 0045EB22    mov         edx,dword ptr [ebp-4C]
 0045EB25    mov         eax,dword ptr [ebp+8]
 0045EB28    mov         eax,dword ptr [eax-4]
 0045EB2B    call        TRegistry.CreateKey
 0045EB30    mov         eax,dword ptr [ebp-4]
 0045EB33    call        @UStrToPWChar
 0045EB38    mov         edx,eax
 0045EB3A    lea         eax,[ebp-50]
 0045EB3D    call        @UStrFromPWChar
 0045EB42    mov         edx,dword ptr [ebp-50]
 0045EB45    mov         eax,dword ptr [ebp+8]
 0045EB48    mov         eax,dword ptr [eax-4]
 0045EB4B    call        TRegistry.GetKey
 0045EB50    mov         dword ptr [ebp-24],eax
 0045EB53    xor         eax,eax
 0045EB55    push        ebp
 0045EB56    push        45EB98
 0045EB5B    push        dword ptr fs:[eax]
 0045EB5E    mov         dword ptr fs:[eax],esp
 0045EB61    mov         eax,dword ptr [ebp+8]
 0045EB64    push        eax
 0045EB65    mov         edx,dword ptr [ebp-24]
 0045EB68    mov         eax,dword ptr [ebp-20]
 0045EB6B    call        CopyValues
 0045EB70    pop         ecx
 0045EB71    mov         eax,dword ptr [ebp+8]
 0045EB74    push        eax
 0045EB75    mov         edx,dword ptr [ebp-24]
 0045EB78    mov         eax,dword ptr [ebp-20]
 0045EB7B    call        CopyKeys
 0045EB80    pop         ecx
 0045EB81    xor         eax,eax
 0045EB83    pop         edx
 0045EB84    pop         ecx
 0045EB85    pop         ecx
 0045EB86    mov         dword ptr fs:[eax],edx
 0045EB89    push        45EB9F
 0045EB8E    mov         eax,dword ptr [ebp-24]
 0045EB91    push        eax
 0045EB92    call        advapi32.RegCloseKey
 0045EB97    ret
>0045EB98    jmp         @HandleFinally
>0045EB9D    jmp         0045EB8E
 0045EB9F    xor         eax,eax
 0045EBA1    pop         edx
 0045EBA2    pop         ecx
 0045EBA3    pop         ecx
 0045EBA4    mov         dword ptr fs:[eax],edx
 0045EBA7    push        45EBC2
 0045EBAC    mov         eax,dword ptr [ebp+8]
 0045EBAF    mov         eax,dword ptr [eax-4]
 0045EBB2    mov         edx,dword ptr [ebp-1C]
 0045EBB5    call        TRegistry.SetCurrentKey
 0045EBBA    ret
>0045EBBB    jmp         @HandleFinally
>0045EBC0    jmp         0045EBAC
 0045EBC2    xor         eax,eax
 0045EBC4    pop         edx
 0045EBC5    pop         ecx
 0045EBC6    pop         ecx
 0045EBC7    mov         dword ptr fs:[eax],edx
 0045EBCA    push        45EBE0
 0045EBCF    mov         eax,dword ptr [ebp-20]
 0045EBD2    push        eax
 0045EBD3    call        advapi32.RegCloseKey
 0045EBD8    ret
>0045EBD9    jmp         @HandleFinally
>0045EBDE    jmp         0045EBCF
 0045EBE0    inc         dword ptr [ebp-14]
 0045EBE3    dec         dword ptr [ebp-28]
>0045EBE6    jne         0045EA6F
 0045EBEC    xor         eax,eax
 0045EBEE    pop         edx
 0045EBEF    pop         ecx
 0045EBF0    pop         ecx
 0045EBF1    mov         dword ptr fs:[eax],edx
 0045EBF4    push        45EC0F
 0045EBF9    mov         eax,dword ptr [ebp+8]
 0045EBFC    mov         eax,dword ptr [eax-4]
 0045EBFF    mov         edx,dword ptr [ebp-18]
 0045EC02    call        TRegistry.SetCurrentKey
 0045EC07    ret
>0045EC08    jmp         @HandleFinally
>0045EC0D    jmp         0045EBF9
 0045EC0F    xor         eax,eax
 0045EC11    pop         edx
 0045EC12    pop         ecx
 0045EC13    pop         ecx
 0045EC14    mov         dword ptr fs:[eax],edx
 0045EC17    push        45EC39
 0045EC1C    lea         eax,[ebp-50]
 0045EC1F    mov         edx,3
 0045EC24    call        @UStrArrayClr
 0045EC29    lea         eax,[ebp-4]
 0045EC2C    call        @UStrClr
 0045EC31    ret
>0045EC32    jmp         @HandleFinally
>0045EC37    jmp         0045EC1C
 0045EC39    mov         esp,ebp
 0045EC3B    pop         ebp
 0045EC3C    ret
*}
end;

//0045EC40
procedure TRegistry.MoveKey(OldName:string; NewName:string; Delete:Boolean);
begin
{*
 0045EC40    push        ebp
 0045EC41    mov         ebp,esp
 0045EC43    add         esp,0FFFFFFF4
 0045EC46    push        ebx
 0045EC47    push        esi
 0045EC48    mov         esi,ecx
 0045EC4A    mov         ebx,edx
 0045EC4C    mov         dword ptr [ebp-4],eax
 0045EC4F    mov         edx,ebx
 0045EC51    mov         eax,dword ptr [ebp-4]
 0045EC54    call        TRegistry.KeyExists
 0045EC59    test        al,al
>0045EC5B    je          0045ED29
 0045EC61    mov         edx,esi
 0045EC63    mov         eax,dword ptr [ebp-4]
 0045EC66    call        TRegistry.KeyExists
 0045EC6B    test        al,al
>0045EC6D    jne         0045ED29
 0045EC73    mov         edx,ebx
 0045EC75    mov         eax,dword ptr [ebp-4]
 0045EC78    call        TRegistry.GetKey
 0045EC7D    mov         dword ptr [ebp-8],eax
 0045EC80    cmp         dword ptr [ebp-8],0
>0045EC84    je          0045ED29
 0045EC8A    xor         eax,eax
 0045EC8C    push        ebp
 0045EC8D    push        45ED22
 0045EC92    push        dword ptr fs:[eax]
 0045EC95    mov         dword ptr fs:[eax],esp
 0045EC98    mov         edx,esi
 0045EC9A    mov         eax,dword ptr [ebp-4]
 0045EC9D    call        TRegistry.CreateKey
 0045ECA2    mov         edx,esi
 0045ECA4    mov         eax,dword ptr [ebp-4]
 0045ECA7    call        TRegistry.GetKey
 0045ECAC    mov         dword ptr [ebp-0C],eax
 0045ECAF    cmp         dword ptr [ebp-0C],0
>0045ECB3    je          0045ED0B
 0045ECB5    xor         eax,eax
 0045ECB7    push        ebp
 0045ECB8    push        45ED04
 0045ECBD    push        dword ptr fs:[eax]
 0045ECC0    mov         dword ptr fs:[eax],esp
 0045ECC3    push        ebp
 0045ECC4    mov         edx,dword ptr [ebp-0C]
 0045ECC7    mov         eax,dword ptr [ebp-8]
 0045ECCA    call        CopyValues
 0045ECCF    pop         ecx
 0045ECD0    push        ebp
 0045ECD1    mov         edx,dword ptr [ebp-0C]
 0045ECD4    mov         eax,dword ptr [ebp-8]
 0045ECD7    call        CopyKeys
 0045ECDC    pop         ecx
 0045ECDD    cmp         byte ptr [ebp+8],0
>0045ECE1    je          0045ECED
 0045ECE3    mov         edx,ebx
 0045ECE5    mov         eax,dword ptr [ebp-4]
 0045ECE8    call        TRegistry.DeleteKey
 0045ECED    xor         eax,eax
 0045ECEF    pop         edx
 0045ECF0    pop         ecx
 0045ECF1    pop         ecx
 0045ECF2    mov         dword ptr fs:[eax],edx
 0045ECF5    push        45ED0B
 0045ECFA    mov         eax,dword ptr [ebp-0C]
 0045ECFD    push        eax
 0045ECFE    call        advapi32.RegCloseKey
 0045ED03    ret
>0045ED04    jmp         @HandleFinally
>0045ED09    jmp         0045ECFA
 0045ED0B    xor         eax,eax
 0045ED0D    pop         edx
 0045ED0E    pop         ecx
 0045ED0F    pop         ecx
 0045ED10    mov         dword ptr fs:[eax],edx
 0045ED13    push        45ED29
 0045ED18    mov         eax,dword ptr [ebp-8]
 0045ED1B    push        eax
 0045ED1C    call        advapi32.RegCloseKey
 0045ED21    ret
>0045ED22    jmp         @HandleFinally
>0045ED27    jmp         0045ED18
 0045ED29    pop         esi
 0045ED2A    pop         ebx
 0045ED2B    mov         esp,ebp
 0045ED2D    pop         ebp
 0045ED2E    ret         4
*}
end;

Initialization
Finalization
//0045ED54
{*
 0045ED54    push        ebp
 0045ED55    mov         ebp,esp
 0045ED57    xor         eax,eax
 0045ED59    push        ebp
 0045ED5A    push        45EDA5
 0045ED5F    push        dword ptr fs:[eax]
 0045ED62    mov         dword ptr fs:[eax],esp
 0045ED65    inc         dword ptr ds:[793048]
>0045ED6B    jne         0045ED97
 0045ED6D    mov         eax,7855B0;^'HKEY_CLASSES_ROOT'
 0045ED72    mov         ecx,7
 0045ED77    mov         edx,dword ptr ds:[40128C];string
 0045ED7D    call        @FinalizeArray
 0045ED82    mov         eax,7855CC;^'0'
 0045ED87    mov         ecx,2
 0045ED8C    mov         edx,dword ptr ds:[40128C];string
 0045ED92    call        @FinalizeArray
 0045ED97    xor         eax,eax
 0045ED99    pop         edx
 0045ED9A    pop         ecx
 0045ED9B    pop         ecx
 0045ED9C    mov         dword ptr fs:[eax],edx
 0045ED9F    push        45EDAC
 0045EDA4    ret
>0045EDA5    jmp         @HandleFinally
>0045EDAA    jmp         0045EDA4
 0045EDAC    pop         ebp
 0045EDAD    ret
*}
end.