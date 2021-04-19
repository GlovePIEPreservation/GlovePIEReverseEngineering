//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit70;

interface

uses
  SysUtils, Classes, WideStrings, JvTranslateString, JclRTTI;

type
  TWideStringsEnumerator = class(TObject)
  published
    function MoveNext:Boolean;//00541250
    function GetCurrent:WideString;//00541238
    constructor Create;//005411F4
  public
    FIndex:Integer;//f4
    FStrings:TWideStrings;//f8
  end;
  TWideStrings = class(TPersistent)
  published
    procedure InsertObject(Index:Integer; S:WideString; AObject:TObject);//00541FDC
    procedure LoadFromFile(FileName:WideString);//0054200C
    procedure LoadFromFile(FileName:WideString; Encoding:TEncoding);//00542AA8
    procedure Insert(Index:Integer; S:WideString);//005411EC
    function IndexOf(S:WideString):Integer;//00541E48
    function IndexOfName(Name:WideString):Integer;//00541ED4
    function IndexOfObject(AObject:TObject):Integer;//00541FA8
    procedure LoadFromStream(Stream:TStream);//005420A4
    procedure SaveToStream(Stream:TStream);//005423CC
    procedure SaveToStream(Stream:TStream; Encoding:TEncoding);//00542300
    procedure SetText(Text:PWideChar);//005424AC
    procedure SaveToFile(FileName:WideString; Encoding:TEncoding);//0054225C
    procedure LoadFromStream(Stream:TStream; Encoding:TEncoding);//00542B44
    procedure Move(CurIndex:Integer; NewIndex:Integer);//005420B0
    procedure SaveToFile(FileName:WideString);//0054224C
    procedure AddStrings(Strings:TStrings);//005412F0
    procedure AddStrings(Strings:TWideStrings);//005413BC
    procedure Assign(Source:TPersistent);//00541474
    procedure Append(S:WideString);//005412E4
    destructor Destroy();//0054126C
    function Add(S:WideString):Integer;//0054129C
    function AddObject(S:WideString; AObject:TObject):Integer;//005412C0
    procedure BeginUpdate;//0054178C
    procedure Exchange(Index1:Integer; Index2:Integer);//00541910
    function GetEnumerator:TWideStringsEnumerator;//00541C94
    function GetText:PWideChar;//00541CA8
    function Equals(Strings:TWideStrings):Boolean;//00541868
    procedure Clear;//005411DC
    procedure Delete(Index:Integer);//005411E4
    procedure EndUpdate;//00541854
  public
    FDefined:TStringsDefined;//f4
    FDelimiter:Char;//f6
    FLineBreak:WideString;//f8
    FQuoteChar:Char;//fC
    FNameValueSeparator:Char;//fE
    FStrictDelimiter:Boolean;//f10
    FUpdateCount:Integer;//f14
    FAdapter:IWideStringsAdapter;//f18
    destructor Destroy(); virtual;//0054126C
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0054160C
    procedure DefineProperties(Filer:TFiler); virtual;//v4//005417FC
    procedure Assign(Source:TPersistent); virtual;//v8//00541474
    procedure vC; virtual; abstract;//vC//00404A58
    procedure v10; virtual;//v10//005419FC
    procedure v14; virtual; abstract;//v14//00404A58
    //function v18:?; virtual;//v18//00541CA4
    function GetTextStr:WideString; virtual;//v1C//00541CFC
    procedure Put(Index:Integer; const S:WideString); virtual;//v20//00542164
    procedure v24; virtual;//v24//00542194
    procedure v28; virtual;//v28//005423DC
    procedure SetTextStr(const Value:WideString); virtual;//v2C//005424FC
    procedure v30; virtual;//v30//005426C8
    function CompareStrings(const S1:WideString; const S2:WideString):Integer; virtual;//v34//00542A60
    function Add(S:WideString):Integer; virtual;//v38//0054129C
    function AddObject(S:WideString; AObject:TObject):Integer; virtual;//v3C//005412C0
    procedure AddStrings(Strings:TStrings); virtual;//v40//005412F0
    procedure AddStrings(Strings:TWideStrings); virtual;//v44//005413BC
    procedure v48; virtual; abstract;//v48//00404A58
    procedure v4C; virtual; abstract;//v4C//00404A58
    procedure Exchange(Index1:Integer; Index2:Integer); virtual;//v50//00541910
    function GetText:PWideChar; virtual;//v54//00541CA8
    function IndexOf(S:WideString):Integer; virtual;//v58//00541E48
    function IndexOfName(Name:WideString):Integer; virtual;//v5C//00541ED4
    function IndexOfObject(AObject:TObject):Integer; virtual;//v60//00541FA8
    procedure v64; virtual; abstract;//v64//00404A58
    procedure InsertObject(Index:Integer; S:WideString; AObject:TObject); virtual;//v68//00541FDC
    procedure LoadFromFile(FileName:WideString); virtual;//v6C//0054200C
    procedure LoadFromFile(FileName:WideString; Encoding:TEncoding); virtual;//v70//00542AA8
    procedure LoadFromStream(Stream:TStream); virtual;//v74//005420A4
    procedure LoadFromStream(Stream:TStream; Encoding:TEncoding); virtual;//v78//00542B44
    procedure Move(CurIndex:Integer; NewIndex:Integer); virtual;//v7C//005420B0
    procedure SaveToFile(FileName:WideString); virtual;//v80//0054224C
    procedure SaveToFile(FileName:WideString; Encoding:TEncoding); virtual;//v84//0054225C
    procedure SaveToStream(Stream:TStream); virtual;//v88//005423CC
    procedure SaveToStream(Stream:TStream; Encoding:TEncoding); virtual;//v8C//00542300
    procedure SetText(Text:PWideChar); virtual;//v90//005424AC
    function GetCommaText:WideString;//00541A04
    function GetDelimitedText:WideString;//00541AE8
    procedure ReadData(Reader:TReader);//00542198
    procedure SetCommaText(const Value:WideString);//005423E0
    procedure SetStringsAdapter(const Value:IWideStringsAdapter);//00542478
    procedure WriteData(Writer:TWriter);//005426CC
    procedure SetDelimitedText(const Value:WideString);//0054276C
    function GetDelimiter:WideChar;//00542954
    function GetLineBreak:WideString;//00542970
    function GetQuoteChar:WideChar;//005429A4
    function GetStrictDelimiter:Boolean;//005429C0
    procedure SetDelimiter(const Value:WideChar);//005429D8
    procedure SetLineBreak(const Value:WideString);//005429F8
    procedure SetQuoteChar(const Value:WideChar);//00542A24
    procedure SetStrictDelimiter(const Value:Boolean);//00542A44
    function GetNameValueSeparator:WideChar;//00542A6C
    procedure SetNameValueSeparator(const Value:WideChar);//00542A88
  end;
  TProcessCommandEvent = procedure(Sender:TObject; const Command:string; var CommandResult:string; var Changed:Boolean) of object;;
  TJvTranslateString = class(TJvComponent)
  published
    //procedure TranslateString(InString:string; ?:?);//00544174
    //procedure TranslateString(InString:string; var Changed:Boolean; ?:?);//005442E8
    constructor Create(AOwner:TComponent);//005431D8
  public
    FAppNameHandled:Boolean;//f38
    FAppName:string;//f3C
    FCompanyNameHandled:Boolean;//f40
    FCompanyName:string;//f44
    FFileVersionHandled:Boolean;//f48
    FFileVersion:string;//f4C
    FProductVersionHandled:Boolean;//f50
    FProductVersion:string;//f54
    FDateFormat:string;//f58
    FDateTimeFormat:string;//f5C
    FLeftDelimiter:string;//f60
    FRightDelimiter:string;//f64
    FTimeFormat:string;//f68
    FOnProcessCommand:TProcessCommandEvent;//f70
    constructor Create(AOwner:TComponent); virtual;//v2C//005431D8
    procedure SetDateTimeFormat(Value:string);//00544160
  end;
  TJclTypeInfo = class(TInterfacedObject)
  published
    function GetTypeInfo:PTypeInfo;//00547708
    function GetTypeKind:TTypeKind;//0054770C
    function GetTypeData:PTypeData;//00547704
    constructor Create(ATypeInfo:PTypeInfo);//005476A0
    //procedure GetName(?:?);//005476E8
  public
    FTypeData:PTypeData;//fC
    FTypeInfo:PTypeInfo;//f10
    //procedure v0(?:?); virtual;//v0//0054771C
    //procedure v4(?:?); virtual;//v4//00547808
  end;
  TJclOrdinalTypeInfo = class(TJclTypeInfo)
  published
    function GetOrdinalType:TOrdType;//00547894
  public
    //procedure v0(?:?); virtual;//v0//005478A4
  end;
  TJclOrdinalRangeTypeInfo = class(TJclOrdinalTypeInfo)
  published
    function GetMaxValue:Int64;//00547970
    function GetMinValue:Int64;//0054792C
  public
    //procedure v0(?:?); virtual;//v0//005479B4
    //procedure v4(?:?); virtual;//v4//00547A6C
  end;
  TJclEnumerationTypeInfo = class(TJclOrdinalRangeTypeInfo)
  published
    //procedure GetUnitName(?:?);//00547DB8
    function IndexOfName(Name:string):Integer;//00547E60
    //procedure GetBaseType(?:?);//00547CF0
    //procedure GetNames(I:Integer; ?:?);//00547D4C
  public
    //procedure v0(?:?); virtual;//v0//00547F08
    //procedure v4(?:?); virtual;//v4//0054804C
  end;
  TJclSetTypeInfo = class(TJclOrdinalTypeInfo)
  published
    //procedure SetAsList(Value:?; Strings:TStrings);//005486E0
    //procedure GetAsList(Value:?; WantRanges:Boolean; Strings:TStrings);//00548550
    //procedure GetBaseType(?:?);//0054828C
  public
    //procedure v0(?:?); virtual;//v0//005489DC
    //procedure v4(?:?); virtual;//v4//00548A90
  end;
  TJclFloatTypeInfo = class(TJclTypeInfo)
  published
    function GetFloatType:TFloatType;//00548C2C
  public
    //procedure v0(?:?); virtual;//v0//00548C3C
    //procedure v4(?:?); virtual;//v4//00548CC4
  end;
  TJclStringTypeInfo = class(TJclTypeInfo)
  published
    function GetMaxLength:Integer;//00548DA0
  public
    //procedure v0(?:?); virtual;//v0//00548DB0
    //procedure v4(?:?); virtual;//v4//00548E30
  end;
  TJclPropSpecKind = (pskNone, pskStaticMethod, pskVirtualMethod, pskField, pskConstant);
  TJclPropInfo = class(TInterfacedObject)
  published
    procedure GetStoredType;//005490B4
    procedure GetReaderValue;//005490CC
    procedure GetWriterType;//0054909C
    function GetSpecValue(Value:Cardinal):Cardinal;//00549050
    procedure GetReaderType;//00549084
    function HasDefault:Boolean;//00549120
    function HasIndex:Boolean;//00549134
    procedure IsStored(AInstance:TObject);//00549114
    procedure GetWriterValue;//005490E4
    procedure GetStoredValue;//005490FC
    function GetSpecKind(Value:Cardinal):TJclPropSpecKind;//00549024
    function GetReader:Pointer;//00548FA8
    function GetWriter:Pointer;//00548FB8
    //procedure GetPropType(?:?);//00548F8C
    constructor Create(APropInfo:PPropInfo);//00548F4C
    function GetPropInfo:PPropInfo;//00548F88
    function GetNameIndex:SmallInt;//00548FF8
    //procedure GetName(?:?);//00549008
    function GetDefault:Integer;//00548FE8
    function GetStoredProc:Pointer;//00548FC8
    function GetIndex:Integer;//00548FD8
  public
    ......FPropInfo:PPropInfo;//fC
  end;
  TJclClassTypeInfo = class(TJclTypeInfo)
  published
    //procedure GetProperties(PropIdx:Integer; ?:?);//0054926C
    //procedure GetPropNames(Name:string; ?:?);//00549358
    //procedure GetUnitName(?:?);//005493A0
    function GetPropertyCount:Integer;//005491FC
    function GetClassRef:TClass;//00549148
    //procedure GetParent(?:?);//00549158
    function GetTotalPropertyCount:Integer;//005491EC
  public
    //procedure v0(?:?); virtual;//v0//005493BC
    //procedure v4(?:?); virtual;//v4//00549D44
  end;
  TJclEventParamInfo = class(TInterfacedObject)
  published
    function GetRecSize:Integer;//0054A73C
    //procedure GetTypeName(?:?);//0054A7C4
    function GetParam:Pointer;//0054A7E4
    constructor Create(AParam:Pointer);//0054A6D4
    function GetFlags:TParamFlags;//0054A710
    //procedure GetName(?:?);//0054A724
  public
    ....FParam:Pointer;//fC
  end;
  TJclEventTypeInfo = class(TJclTypeInfo)
  published
    //procedure GetParameters(ParamIdx:Integer; ?:?);//0054A808
    //procedure GetResultTypeName(?:?);//0054A85C
    function GetMethodKind:TMethodKind;//0054A7E8
    function GetParameterCount:Integer;//0054A7F8
  public
    //procedure v0(?:?); virtual;//v0//0054A8F8
    //procedure v4(?:?); virtual;//v4//0054AB18
  end;
  TJclInterfaceTypeInfo = class(TJclTypeInfo)
  published
    function GetPropertyCount:Integer;//0054AF64
    //procedure GetUnitName(?:?);//0054AFD4
    //procedure GetGUID(?:?);//0054AF30
    //procedure GetParent(?:?);//0054AE8C
    function GetFlags:TIntfFlagsBase;//0054AF1C
  public
    //procedure v0(?:?); virtual;//v0//0054AFF0
    //procedure v4(?:?); virtual;//v4//0054B1B0
  end;
  TJclInt64TypeInfo = class(TJclTypeInfo)
  published
    procedure GetMaxValue;//0054B4CC
    procedure GetMinValue;//0054B4A8
  public
    //procedure v0(?:?); virtual;//v0//0054B4F4
    //procedure v4(?:?); virtual;//v4//0054B5AC
  end;
  TJclDynArrayTypeInfo = class(TJclTypeInfo)
  published
    function GetVarType:Integer;//0054B704
    //procedure GetUnitName(?:?);//0054B714
    function GetElementsNeedCleanup:Boolean;//0054B6F0
    function GetElementSize:Integer;//0054B688
    //procedure GetElementType(?:?);//0054B698
  public
    //procedure v0(?:?); virtual;//v0//0054B730
    //procedure v4(?:?); virtual;//v4//0054B9CC
  end;
  EJclRTTIError = class(EJclError)
  end;
    procedure AssignTo(Dest:TPersistent);//0054160C
    function DoWrite:Boolean;//005417A4
    procedure DefineProperties(Filer:TFiler);//005417FC
    procedure sub_005419FC;//005419FC
    function IsDelimiter(const ch:WideChar):Boolean;//00541A9C
    //function sub_00541CA4:?;//00541CA4
    function GetTextStr:WideString;//00541CFC
    procedure Put(Index:Integer; const S:WideString);//00542164
    procedure sub_00542194;//00542194
    procedure sub_005423DC;//005423DC
    procedure SetTextStr(const Value:WideString);//005424FC
    procedure sub_005426C8;//005426C8
    function CompareStrings(const S1:WideString; const S2:WideString):Integer;//00542A60
    //procedure sub_005432E8(?:?; ?:?; ?:?);//005432E8
    //procedure sub_00543338(?:?; ?:?);//00543338
    //procedure sub_00543394(?:?; ?:?; ?:?);//00543394
    //procedure sub_005433E4(?:?; ?:?);//005433E4
    //procedure sub_00543440(?:?; ?:?);//00543440
    //procedure sub_00543628(?:?; ?:?);//00543628
    //procedure sub_00543800(?:?; ?:?);//00543800
    //procedure sub_005439E0(?:?; ?:?);//005439E0
    //function sub_00543BC0(?:TJvTranslateString; ?:?; ?:?):?;//00543BC0
    //procedure sub_0054771C(?:?);//0054771C
    //procedure sub_00547808(?:?);//00547808
    //procedure sub_005478A4(?:?);//005478A4
    //procedure sub_005479B4(?:?);//005479B4
    //procedure sub_00547A6C(?:?);//00547A6C
    //procedure sub_00547F08(?:?);//00547F08
    //procedure sub_0054804C(?:?);//0054804C
    //procedure sub_005482FC(?:?);//005482FC
    //procedure sub_00548684(?:?);//00548684
    //procedure sub_005489DC(?:?);//005489DC
    //procedure sub_00548A90(?:?);//00548A90
    //procedure sub_00548C3C(?:?);//00548C3C
    //procedure sub_00548CC4(?:?);//00548CC4
    //procedure sub_00548DB0(?:?);//00548DB0
    //procedure sub_00548E30(?:?);//00548E30
    //procedure sub_005493BC(?:?);//005493BC
    //procedure sub_00549D44(?:?);//00549D44
    //procedure sub_0054A8F8(?:?);//0054A8F8
    //procedure sub_0054AB18(?:?);//0054AB18
    //procedure sub_0054AFF0(?:?);//0054AFF0
    //procedure sub_0054B1B0(?:?);//0054B1B0
    //procedure sub_0054B4F4(?:?);//0054B4F4
    //procedure sub_0054B5AC(?:?);//0054B5AC
    //procedure sub_0054B730(?:?);//0054B730
    //procedure sub_0054B9CC(?:?);//0054B9CC
    //procedure sub_0054BBB0(?:PPropInfo; ?:?);//0054BBB0
    //procedure sub_0054BD7C(?:?);//0054BD7C
    procedure sub_0054BDCC(?:Pointer);//0054BDCC
    procedure sub_0054BDF4;//0054BDF4
    //function sub_0054BE54(?:Pointer):?;//0054BE54
    //procedure sub_0054BEEC(?:?; ?:PTypeInfo; ?:?);//0054BEEC
    //procedure sub_0054C070(?:?; ?:TIntfFlagsBase; ?:?; ?:?; ?:?; ?:?);//0054C070
    //procedure sub_0054C1D0(?:?; ?:TIntfFlagsBase; ?:?; ?:?; ?:?);//0054C1D0
    //procedure sub_0054C238(?:?; ?:?; ?:?);//0054C238

implementation

//005411DC
procedure TWideStrings.Clear;
begin
{*
>005411DC    jmp         @AbstractError
*}
end;

//005411E4
procedure TWideStrings.Delete(Index:Integer);
begin
{*
>005411E4    jmp         @AbstractError
*}
end;

//005411EC
procedure TWideStrings.Insert(Index:Integer; S:WideString);
begin
{*
>005411EC    jmp         @AbstractError
*}
end;

//005411F4
constructor TWideStringsEnumerator.Create;
begin
{*
 005411F4    push        ebx
 005411F5    push        esi
 005411F6    push        edi
 005411F7    test        dl,dl
>005411F9    je          00541203
 005411FB    add         esp,0FFFFFFF0
 005411FE    call        @ClassCreate
 00541203    mov         esi,ecx
 00541205    mov         ebx,edx
 00541207    mov         edi,eax
 00541209    xor         edx,edx
 0054120B    mov         eax,edi
 0054120D    call        TObject.Create
 00541212    mov         dword ptr [edi+4],0FFFFFFFF
 00541219    mov         dword ptr [edi+8],esi
 0054121C    mov         eax,edi
 0054121E    test        bl,bl
>00541220    je          00541231
 00541222    call        @AfterConstruction
 00541227    pop         dword ptr fs:[0]
 0054122E    add         esp,0C
 00541231    mov         eax,edi
 00541233    pop         edi
 00541234    pop         esi
 00541235    pop         ebx
 00541236    ret
*}
end;

//00541238
function TWideStringsEnumerator.GetCurrent:WideString;
begin
{*
 00541238    push        ebx
 00541239    push        esi
 0054123A    mov         esi,edx
 0054123C    mov         ebx,eax
 0054123E    mov         ecx,esi
 00541240    mov         edx,dword ptr [ebx+4]
 00541243    mov         eax,dword ptr [ebx+8]
 00541246    mov         ebx,dword ptr [eax]
 00541248    call        dword ptr [ebx+0C]
 0054124B    pop         esi
 0054124C    pop         ebx
 0054124D    ret
*}
end;

//00541250
function TWideStringsEnumerator.MoveNext:Boolean;
begin
{*
 00541250    push        ebx
 00541251    mov         ebx,eax
 00541253    mov         eax,dword ptr [ebx+8]
 00541256    mov         edx,dword ptr [eax]
 00541258    call        dword ptr [edx+14]
 0054125B    dec         eax
 0054125C    cmp         eax,dword ptr [ebx+4]
 0054125F    setg        al
 00541262    test        al,al
>00541264    je          00541269
 00541266    inc         dword ptr [ebx+4]
 00541269    pop         ebx
 0054126A    ret
*}
end;

//0054126C
destructor TWideStrings.Destroy();
begin
{*
 0054126C    push        ebx
 0054126D    push        esi
 0054126E    call        @BeforeDestruction
 00541273    mov         ebx,edx
 00541275    mov         esi,eax
 00541277    xor         edx,edx
 00541279    mov         eax,esi
 0054127B    call        TWideStrings.SetStringsAdapter
 00541280    mov         edx,ebx
 00541282    and         dl,0FC
 00541285    mov         eax,esi
 00541287    call        TMemoryStream.Destroy
 0054128C    test        bl,bl
>0054128E    jle         00541297
 00541290    mov         eax,esi
 00541292    call        @ClassDestroy
 00541297    pop         esi
 00541298    pop         ebx
 00541299    ret
*}
end;

//0054129C
function TWideStrings.Add(S:WideString):Integer;
begin
{*
 0054129C    push        ebx
 0054129D    push        esi
 0054129E    push        edi
 0054129F    mov         edi,edx
 005412A1    mov         ebx,eax
 005412A3    mov         eax,ebx
 005412A5    mov         edx,dword ptr [eax]
 005412A7    call        dword ptr [edx+14]
 005412AA    mov         esi,eax
 005412AC    mov         ecx,edi
 005412AE    mov         edx,esi
 005412B0    mov         eax,ebx
 005412B2    mov         ebx,dword ptr [eax]
 005412B4    call        dword ptr [ebx+64]
 005412B7    mov         eax,esi
 005412B9    pop         edi
 005412BA    pop         esi
 005412BB    pop         ebx
 005412BC    ret
*}
end;

//005412C0
function TWideStrings.AddObject(S:WideString; AObject:TObject):Integer;
begin
{*
 005412C0    push        ebx
 005412C1    push        esi
 005412C2    push        edi
 005412C3    mov         edi,ecx
 005412C5    mov         esi,eax
 005412C7    mov         eax,esi
 005412C9    mov         ecx,dword ptr [eax]
 005412CB    call        dword ptr [ecx+38]
 005412CE    mov         ebx,eax
 005412D0    mov         ecx,edi
 005412D2    mov         edx,ebx
 005412D4    mov         eax,esi
 005412D6    mov         esi,dword ptr [eax]
 005412D8    call        dword ptr [esi+24]
 005412DB    mov         eax,ebx
 005412DD    pop         edi
 005412DE    pop         esi
 005412DF    pop         ebx
 005412E0    ret
*}
end;

//005412E4
procedure TWideStrings.Append(S:WideString);
begin
{*
 005412E4    push        esi
 005412E5    mov         esi,eax
 005412E7    mov         eax,esi
 005412E9    mov         ecx,dword ptr [eax]
 005412EB    call        dword ptr [ecx+38]
 005412EE    pop         esi
 005412EF    ret
*}
end;

//005412F0
procedure TWideStrings.AddStrings(Strings:TStrings);
begin
{*
 005412F0    push        ebp
 005412F1    mov         ebp,esp
 005412F3    add         esp,0FFFFFFF0
 005412F6    push        ebx
 005412F7    push        esi
 005412F8    push        edi
 005412F9    xor         ecx,ecx
 005412FB    mov         dword ptr [ebp-0C],ecx
 005412FE    mov         dword ptr [ebp-10],ecx
 00541301    mov         dword ptr [ebp-8],edx
 00541304    mov         dword ptr [ebp-4],eax
 00541307    xor         eax,eax
 00541309    push        ebp
 0054130A    push        5413AD
 0054130F    push        dword ptr fs:[eax]
 00541312    mov         dword ptr fs:[eax],esp
 00541315    mov         eax,dword ptr [ebp-4]
 00541318    call        TWideStrings.BeginUpdate
 0054131D    xor         eax,eax
 0054131F    push        ebp
 00541320    push        541388
 00541325    push        dword ptr fs:[eax]
 00541328    mov         dword ptr fs:[eax],esp
 0054132B    mov         eax,dword ptr [ebp-8]
 0054132E    mov         edx,dword ptr [eax]
 00541330    call        dword ptr [edx+14]
 00541333    mov         esi,eax
 00541335    dec         esi
 00541336    test        esi,esi
>00541338    jl          00541372
 0054133A    inc         esi
 0054133B    xor         ebx,ebx
 0054133D    lea         ecx,[ebp-10]
 00541340    mov         edx,ebx
 00541342    mov         eax,dword ptr [ebp-8]
 00541345    mov         edi,dword ptr [eax]
 00541347    call        dword ptr [edi+0C]
 0054134A    mov         edx,dword ptr [ebp-10]
 0054134D    lea         eax,[ebp-0C]
 00541350    call        @WStrFromUStr
 00541355    mov         eax,dword ptr [ebp-0C]
 00541358    push        eax
 00541359    mov         edx,ebx
 0054135B    mov         eax,dword ptr [ebp-8]
 0054135E    mov         ecx,dword ptr [eax]
 00541360    call        dword ptr [ecx+18]
 00541363    mov         ecx,eax
 00541365    mov         eax,dword ptr [ebp-4]
 00541368    pop         edx
 00541369    mov         edi,dword ptr [eax]
 0054136B    call        dword ptr [edi+3C]
 0054136E    inc         ebx
 0054136F    dec         esi
>00541370    jne         0054133D
 00541372    xor         eax,eax
 00541374    pop         edx
 00541375    pop         ecx
 00541376    pop         ecx
 00541377    mov         dword ptr fs:[eax],edx
 0054137A    push        54138F
 0054137F    mov         eax,dword ptr [ebp-4]
 00541382    call        TWideStrings.EndUpdate
 00541387    ret
>00541388    jmp         @HandleFinally
>0054138D    jmp         0054137F
 0054138F    xor         eax,eax
 00541391    pop         edx
 00541392    pop         ecx
 00541393    pop         ecx
 00541394    mov         dword ptr fs:[eax],edx
 00541397    push        5413B4
 0054139C    lea         eax,[ebp-10]
 0054139F    call        @UStrClr
 005413A4    lea         eax,[ebp-0C]
 005413A7    call        @WStrClr
 005413AC    ret
>005413AD    jmp         @HandleFinally
>005413B2    jmp         0054139C
 005413B4    pop         edi
 005413B5    pop         esi
 005413B6    pop         ebx
 005413B7    mov         esp,ebp
 005413B9    pop         ebp
 005413BA    ret
*}
end;

//005413BC
procedure TWideStrings.AddStrings(Strings:TWideStrings);
begin
{*
 005413BC    push        ebp
 005413BD    mov         ebp,esp
 005413BF    add         esp,0FFFFFFF4
 005413C2    push        ebx
 005413C3    push        esi
 005413C4    push        edi
 005413C5    xor         ecx,ecx
 005413C7    mov         dword ptr [ebp-0C],ecx
 005413CA    mov         dword ptr [ebp-8],edx
 005413CD    mov         dword ptr [ebp-4],eax
 005413D0    xor         eax,eax
 005413D2    push        ebp
 005413D3    push        541463
 005413D8    push        dword ptr fs:[eax]
 005413DB    mov         dword ptr fs:[eax],esp
 005413DE    mov         eax,dword ptr [ebp-4]
 005413E1    call        TWideStrings.BeginUpdate
 005413E6    xor         eax,eax
 005413E8    push        ebp
 005413E9    push        541446
 005413EE    push        dword ptr fs:[eax]
 005413F1    mov         dword ptr fs:[eax],esp
 005413F4    mov         eax,dword ptr [ebp-8]
 005413F7    mov         edx,dword ptr [eax]
 005413F9    call        dword ptr [edx+14]
 005413FC    mov         esi,eax
 005413FE    dec         esi
 005413FF    test        esi,esi
>00541401    jl          00541430
 00541403    inc         esi
 00541404    xor         ebx,ebx
 00541406    lea         ecx,[ebp-0C]
 00541409    mov         edx,ebx
 0054140B    mov         eax,dword ptr [ebp-8]
 0054140E    mov         edi,dword ptr [eax]
 00541410    call        dword ptr [edi+0C]
 00541413    mov         eax,dword ptr [ebp-0C]
 00541416    push        eax
 00541417    mov         edx,ebx
 00541419    mov         eax,dword ptr [ebp-8]
 0054141C    mov         ecx,dword ptr [eax]
 0054141E    call        dword ptr [ecx+18]
 00541421    mov         ecx,eax
 00541423    mov         eax,dword ptr [ebp-4]
 00541426    pop         edx
 00541427    mov         edi,dword ptr [eax]
 00541429    call        dword ptr [edi+3C]
 0054142C    inc         ebx
 0054142D    dec         esi
>0054142E    jne         00541406
 00541430    xor         eax,eax
 00541432    pop         edx
 00541433    pop         ecx
 00541434    pop         ecx
 00541435    mov         dword ptr fs:[eax],edx
 00541438    push        54144D
 0054143D    mov         eax,dword ptr [ebp-4]
 00541440    call        TWideStrings.EndUpdate
 00541445    ret
>00541446    jmp         @HandleFinally
>0054144B    jmp         0054143D
 0054144D    xor         eax,eax
 0054144F    pop         edx
 00541450    pop         ecx
 00541451    pop         ecx
 00541452    mov         dword ptr fs:[eax],edx
 00541455    push        54146A
 0054145A    lea         eax,[ebp-0C]
 0054145D    call        @WStrClr
 00541462    ret
>00541463    jmp         @HandleFinally
>00541468    jmp         0054145A
 0054146A    pop         edi
 0054146B    pop         esi
 0054146C    pop         ebx
 0054146D    mov         esp,ebp
 0054146F    pop         ebp
 00541470    ret
*}
end;

//00541474
procedure TWideStrings.Assign(Source:TPersistent);
begin
{*
 00541474    push        ebp
 00541475    mov         ebp,esp
 00541477    add         esp,0FFFFFFF8
 0054147A    push        ebx
 0054147B    push        esi
 0054147C    xor         ecx,ecx
 0054147E    mov         dword ptr [ebp-8],ecx
 00541481    mov         ebx,edx
 00541483    mov         dword ptr [ebp-4],eax
 00541486    xor         eax,eax
 00541488    push        ebp
 00541489    push        5415FE
 0054148E    push        dword ptr fs:[eax]
 00541491    mov         dword ptr fs:[eax],esp
 00541494    mov         eax,ebx
 00541496    mov         edx,dword ptr ds:[540610];TWideStrings
 0054149C    call        @IsClass
 005414A1    test        al,al
>005414A3    je          00541533
 005414A9    mov         eax,dword ptr [ebp-4]
 005414AC    call        TWideStrings.BeginUpdate
 005414B1    xor         eax,eax
 005414B3    push        ebp
 005414B4    push        54152C
 005414B9    push        dword ptr fs:[eax]
 005414BC    mov         dword ptr fs:[eax],esp
 005414BF    mov         eax,dword ptr [ebp-4]
 005414C2    mov         edx,dword ptr [eax]
 005414C4    call        dword ptr [edx+48]
 005414C7    mov         esi,ebx
 005414C9    movzx       eax,byte ptr [esi+4]
 005414CD    mov         edx,dword ptr [ebp-4]
 005414D0    mov         byte ptr [edx+4],al
 005414D3    movzx       eax,word ptr [esi+0E]
 005414D7    mov         edx,dword ptr [ebp-4]
 005414DA    mov         word ptr [edx+0E],ax
 005414DE    movzx       eax,word ptr [esi+0C]
 005414E2    mov         edx,dword ptr [ebp-4]
 005414E5    mov         word ptr [edx+0C],ax
 005414E9    movzx       eax,word ptr [esi+6]
 005414ED    mov         edx,dword ptr [ebp-4]
 005414F0    mov         word ptr [edx+6],ax
 005414F4    mov         eax,dword ptr [ebp-4]
 005414F7    add         eax,8
 005414FA    mov         edx,dword ptr [esi+8]
 005414FD    call        @WStrAsg
 00541502    movzx       eax,byte ptr [esi+10]
 00541506    mov         edx,dword ptr [ebp-4]
 00541509    mov         byte ptr [edx+10],al
 0054150C    mov         edx,esi
 0054150E    mov         eax,dword ptr [ebp-4]
 00541511    mov         ecx,dword ptr [eax]
 00541513    call        dword ptr [ecx+44]
 00541516    xor         eax,eax
 00541518    pop         edx
 00541519    pop         ecx
 0054151A    pop         ecx
 0054151B    mov         dword ptr fs:[eax],edx
 0054151E    push        5415E8
 00541523    mov         eax,dword ptr [ebp-4]
 00541526    call        TWideStrings.EndUpdate
 0054152B    ret
>0054152C    jmp         @HandleFinally
>00541531    jmp         00541523
 00541533    mov         eax,ebx
 00541535    mov         edx,dword ptr ds:[43B934];TStrings
 0054153B    call        @IsClass
 00541540    test        al,al
>00541542    je          005415DE
 00541548    mov         eax,dword ptr [ebp-4]
 0054154B    call        TWideStrings.BeginUpdate
 00541550    xor         eax,eax
 00541552    push        ebp
 00541553    push        5415D7
 00541558    push        dword ptr fs:[eax]
 0054155B    mov         dword ptr fs:[eax],esp
 0054155E    mov         eax,dword ptr [ebp-4]
 00541561    mov         edx,dword ptr [eax]
 00541563    call        dword ptr [edx+48]
 00541566    mov         esi,ebx
 00541568    mov         eax,esi
 0054156A    call        TStrings.GetNameValueSeparator
 0054156F    mov         edx,dword ptr [ebp-4]
 00541572    mov         word ptr [edx+0E],ax
 00541576    mov         eax,esi
 00541578    call        TStrings.GetQuoteChar
 0054157D    mov         edx,dword ptr [ebp-4]
 00541580    mov         word ptr [edx+0C],ax
 00541584    mov         eax,esi
 00541586    call        TStrings.GetDelimiter
 0054158B    mov         edx,dword ptr [ebp-4]
 0054158E    mov         word ptr [edx+6],ax
 00541592    lea         edx,[ebp-8]
 00541595    mov         eax,esi
 00541597    call        TStrings.GetLineBreak
 0054159C    mov         edx,dword ptr [ebp-8]
 0054159F    mov         eax,dword ptr [ebp-4]
 005415A2    add         eax,8
 005415A5    call        @WStrFromUStr
 005415AA    mov         eax,esi
 005415AC    call        TStrings.GetStrictDelimiter
 005415B1    mov         edx,dword ptr [ebp-4]
 005415B4    mov         byte ptr [edx+10],al
 005415B7    mov         edx,esi
 005415B9    mov         eax,dword ptr [ebp-4]
 005415BC    mov         ecx,dword ptr [eax]
 005415BE    call        dword ptr [ecx+40]
 005415C1    xor         eax,eax
 005415C3    pop         edx
 005415C4    pop         ecx
 005415C5    pop         ecx
 005415C6    mov         dword ptr fs:[eax],edx
 005415C9    push        5415E8
 005415CE    mov         eax,dword ptr [ebp-4]
 005415D1    call        TWideStrings.EndUpdate
 005415D6    ret
>005415D7    jmp         @HandleFinally
>005415DC    jmp         005415CE
 005415DE    mov         edx,ebx
 005415E0    mov         eax,dword ptr [ebp-4]
 005415E3    call        TPersistent.Assign
 005415E8    xor         eax,eax
 005415EA    pop         edx
 005415EB    pop         ecx
 005415EC    pop         ecx
 005415ED    mov         dword ptr fs:[eax],edx
 005415F0    push        541605
 005415F5    lea         eax,[ebp-8]
 005415F8    call        @UStrClr
 005415FD    ret
>005415FE    jmp         @HandleFinally
>00541603    jmp         005415F5
 00541605    pop         esi
 00541606    pop         ebx
 00541607    pop         ecx
 00541608    pop         ecx
 00541609    pop         ebp
 0054160A    ret
*}
end;

//0054160C
procedure TWideStrings.AssignTo(Dest:TPersistent);
begin
{*
 0054160C    push        ebp
 0054160D    mov         ebp,esp
 0054160F    xor         ecx,ecx
 00541611    push        ecx
 00541612    push        ecx
 00541613    push        ecx
 00541614    push        ecx
 00541615    push        ecx
 00541616    push        ecx
 00541617    push        ebx
 00541618    push        esi
 00541619    push        edi
 0054161A    mov         dword ptr [ebp-4],edx
 0054161D    mov         ebx,eax
 0054161F    xor         eax,eax
 00541621    push        ebp
 00541622    push        54177E
 00541627    push        dword ptr fs:[eax]
 0054162A    mov         dword ptr fs:[eax],esp
 0054162D    mov         eax,dword ptr [ebp-4]
 00541630    mov         edx,dword ptr ds:[540610];TWideStrings
 00541636    call        @IsClass
 0054163B    test        al,al
>0054163D    je          0054164E
 0054163F    mov         edx,ebx
 00541641    mov         eax,dword ptr [ebp-4]
 00541644    mov         ecx,dword ptr [eax]
 00541646    call        dword ptr [ecx+8]
>00541649    jmp         00541750
 0054164E    mov         eax,dword ptr [ebp-4]
 00541651    mov         edx,dword ptr ds:[43B934];TStrings
 00541657    call        @IsClass
 0054165C    test        al,al
>0054165E    je          00541746
 00541664    mov         esi,dword ptr [ebp-4]
 00541667    mov         eax,esi
 00541669    call        TStrings.BeginUpdate
 0054166E    xor         eax,eax
 00541670    push        ebp
 00541671    push        54173F
 00541676    push        dword ptr fs:[eax]
 00541679    mov         dword ptr fs:[eax],esp
 0054167C    mov         eax,esi
 0054167E    mov         edx,dword ptr [eax]
 00541680    call        dword ptr [edx+44]
 00541683    mov         eax,ebx
 00541685    call        TWideStrings.GetNameValueSeparator
 0054168A    mov         edx,eax
 0054168C    mov         eax,esi
 0054168E    call        TStrings.SetNameValueSeparator
 00541693    mov         eax,ebx
 00541695    call        TWideStrings.GetQuoteChar
 0054169A    mov         edx,eax
 0054169C    mov         eax,esi
 0054169E    call        TStrings.SetQuoteChar
 005416A3    mov         eax,ebx
 005416A5    call        TWideStrings.GetDelimiter
 005416AA    mov         edx,eax
 005416AC    mov         eax,esi
 005416AE    call        TStrings.SetDelimiter
 005416B3    lea         edx,[ebp-10]
 005416B6    mov         eax,ebx
 005416B8    call        TWideStrings.GetLineBreak
 005416BD    mov         edx,dword ptr [ebp-10]
 005416C0    lea         eax,[ebp-0C]
 005416C3    call        @UStrFromWStr
 005416C8    mov         edx,dword ptr [ebp-0C]
 005416CB    mov         eax,esi
 005416CD    call        TStrings.SetLineBreak
 005416D2    mov         eax,ebx
 005416D4    call        TWideStrings.GetStrictDelimiter
 005416D9    mov         edx,eax
 005416DB    mov         eax,esi
 005416DD    call        TStrings.SetStrictDelimiter
 005416E2    mov         eax,ebx
 005416E4    mov         edx,dword ptr [eax]
 005416E6    call        dword ptr [edx+14]
 005416E9    dec         eax
 005416EA    test        eax,eax
>005416EC    jl          00541729
 005416EE    inc         eax
 005416EF    mov         dword ptr [ebp-8],eax
 005416F2    xor         esi,esi
 005416F4    lea         ecx,[ebp-18]
 005416F7    mov         edx,esi
 005416F9    mov         eax,ebx
 005416FB    mov         edi,dword ptr [eax]
 005416FD    call        dword ptr [edi+0C]
 00541700    mov         edx,dword ptr [ebp-18]
 00541703    lea         eax,[ebp-14]
 00541706    call        @UStrFromWStr
 0054170B    mov         eax,dword ptr [ebp-14]
 0054170E    push        eax
 0054170F    mov         edx,esi
 00541711    mov         eax,ebx
 00541713    mov         ecx,dword ptr [eax]
 00541715    call        dword ptr [ecx+18]
 00541718    mov         ecx,eax
 0054171A    mov         eax,dword ptr [ebp-4]
 0054171D    pop         edx
 0054171E    mov         edi,dword ptr [eax]
 00541720    call        dword ptr [edi+3C]
 00541723    inc         esi
 00541724    dec         dword ptr [ebp-8]
>00541727    jne         005416F4
 00541729    xor         eax,eax
 0054172B    pop         edx
 0054172C    pop         ecx
 0054172D    pop         ecx
 0054172E    mov         dword ptr fs:[eax],edx
 00541731    push        541750
 00541736    mov         eax,dword ptr [ebp-4]
 00541739    call        TStrings.EndUpdate
 0054173E    ret
>0054173F    jmp         @HandleFinally
>00541744    jmp         00541736
 00541746    mov         edx,dword ptr [ebp-4]
 00541749    mov         eax,ebx
 0054174B    call        TPersistent.AssignTo
 00541750    xor         eax,eax
 00541752    pop         edx
 00541753    pop         ecx
 00541754    pop         ecx
 00541755    mov         dword ptr fs:[eax],edx
 00541758    push        541785
 0054175D    lea         eax,[ebp-18]
 00541760    call        @WStrClr
 00541765    lea         eax,[ebp-14]
 00541768    call        @UStrClr
 0054176D    lea         eax,[ebp-10]
 00541770    call        @WStrClr
 00541775    lea         eax,[ebp-0C]
 00541778    call        @UStrClr
 0054177D    ret
>0054177E    jmp         @HandleFinally
>00541783    jmp         0054175D
 00541785    pop         edi
 00541786    pop         esi
 00541787    pop         ebx
 00541788    mov         esp,ebp
 0054178A    pop         ebp
 0054178B    ret
*}
end;

//0054178C
procedure TWideStrings.BeginUpdate;
begin
{*
 0054178C    push        ebx
 0054178D    mov         ebx,eax
 0054178F    cmp         dword ptr [ebx+14],0
>00541793    jne         0054179E
 00541795    mov         dl,1
 00541797    mov         eax,ebx
 00541799    mov         ecx,dword ptr [eax]
 0054179B    call        dword ptr [ecx+30]
 0054179E    inc         dword ptr [ebx+14]
 005417A1    pop         ebx
 005417A2    ret
*}
end;

//005417A4
function DoWrite:Boolean;
begin
{*
 005417A4    push        ebp
 005417A5    mov         ebp,esp
 005417A7    push        ebx
 005417A8    push        esi
 005417A9    mov         eax,dword ptr [ebp+8]
 005417AC    mov         eax,dword ptr [eax-4]
 005417AF    mov         esi,dword ptr [eax+20]
 005417B2    test        esi,esi
>005417B4    je          005417E3
 005417B6    mov         bl,1
 005417B8    mov         eax,dword ptr [ebp+8]
 005417BB    mov         eax,esi
 005417BD    mov         edx,dword ptr ds:[540610];TWideStrings
 005417C3    call        @IsClass
 005417C8    test        al,al
>005417CA    je          005417F3
 005417CC    mov         eax,dword ptr [ebp+8]
 005417CF    mov         edx,esi
 005417D1    mov         eax,dword ptr [ebp+8]
 005417D4    mov         eax,dword ptr [eax-8]
 005417D7    call        TWideStrings.Equals
 005417DC    mov         ebx,eax
 005417DE    xor         bl,1
>005417E1    jmp         005417F3
 005417E3    mov         eax,dword ptr [ebp+8]
 005417E6    mov         eax,dword ptr [eax-8]
 005417E9    mov         edx,dword ptr [eax]
 005417EB    call        dword ptr [edx+14]
 005417EE    test        eax,eax
 005417F0    setg        bl
 005417F3    mov         eax,ebx
 005417F5    pop         esi
 005417F6    pop         ebx
 005417F7    pop         ebp
 005417F8    ret
*}
end;

//005417FC
procedure TWideStrings.DefineProperties(Filer:TFiler);
begin
{*
 005417FC    push        ebp
 005417FD    mov         ebp,esp
 005417FF    add         esp,0FFFFFFF8
 00541802    push        ebx
 00541803    mov         dword ptr [ebp-4],edx
 00541806    mov         dword ptr [ebp-8],eax
 00541809    mov         eax,dword ptr [ebp-8]
 0054180C    push        eax
 0054180D    push        542198;TWideStrings.ReadData
 00541812    mov         eax,dword ptr [ebp-8]
 00541815    push        eax
 00541816    push        5426CC;TWideStrings.WriteData
 0054181B    push        ebp
 0054181C    call        DoWrite
 00541821    pop         ecx
 00541822    mov         ecx,eax
 00541824    mov         edx,541844;'Strings'
 00541829    mov         eax,dword ptr [ebp-4]
 0054182C    mov         ebx,dword ptr [eax]
 0054182E    call        dword ptr [ebx+4]
 00541831    pop         ebx
 00541832    pop         ecx
 00541833    pop         ecx
 00541834    pop         ebp
 00541835    ret
*}
end;

//00541854
procedure TWideStrings.EndUpdate;
begin
{*
 00541854    dec         dword ptr [eax+14]
 00541857    cmp         dword ptr [eax+14],0
>0054185B    jne         00541864
 0054185D    xor         edx,edx
 0054185F    mov         ecx,dword ptr [eax]
 00541861    call        dword ptr [ecx+30]
 00541864    ret
*}
end;

//00541868
function TWideStrings.Equals(Strings:TWideStrings):Boolean;
begin
{*
 00541868    push        ebp
 00541869    mov         ebp,esp
 0054186B    add         esp,0FFFFFFEC
 0054186E    push        ebx
 0054186F    push        esi
 00541870    push        edi
 00541871    xor         ecx,ecx
 00541873    mov         dword ptr [ebp-10],ecx
 00541876    mov         dword ptr [ebp-14],ecx
 00541879    mov         dword ptr [ebp-8],edx
 0054187C    mov         dword ptr [ebp-4],eax
 0054187F    xor         eax,eax
 00541881    push        ebp
 00541882    push        5418FD
 00541887    push        dword ptr fs:[eax]
 0054188A    mov         dword ptr fs:[eax],esp
 0054188D    mov         byte ptr [ebp-9],0
 00541891    mov         eax,dword ptr [ebp-4]
 00541894    mov         edx,dword ptr [eax]
 00541896    call        dword ptr [edx+14]
 00541899    mov         ebx,eax
 0054189B    mov         eax,dword ptr [ebp-8]
 0054189E    mov         edx,dword ptr [eax]
 005418A0    call        dword ptr [edx+14]
 005418A3    cmp         ebx,eax
>005418A5    jne         005418E2
 005418A7    mov         esi,ebx
 005418A9    dec         esi
 005418AA    test        esi,esi
>005418AC    jl          005418DE
 005418AE    inc         esi
 005418AF    xor         ebx,ebx
 005418B1    lea         ecx,[ebp-10]
 005418B4    mov         edx,ebx
 005418B6    mov         eax,dword ptr [ebp-4]
 005418B9    mov         edi,dword ptr [eax]
 005418BB    call        dword ptr [edi+0C]
 005418BE    mov         eax,dword ptr [ebp-10]
 005418C1    push        eax
 005418C2    lea         ecx,[ebp-14]
 005418C5    mov         edx,ebx
 005418C7    mov         eax,dword ptr [ebp-8]
 005418CA    mov         edi,dword ptr [eax]
 005418CC    call        dword ptr [edi+0C]
 005418CF    mov         edx,dword ptr [ebp-14]
 005418D2    pop         eax
 005418D3    call        @WStrEqual
>005418D8    jne         005418E2
 005418DA    inc         ebx
 005418DB    dec         esi
>005418DC    jne         005418B1
 005418DE    mov         byte ptr [ebp-9],1
 005418E2    xor         eax,eax
 005418E4    pop         edx
 005418E5    pop         ecx
 005418E6    pop         ecx
 005418E7    mov         dword ptr fs:[eax],edx
 005418EA    push        541904
 005418EF    lea         eax,[ebp-14]
 005418F2    mov         edx,2
 005418F7    call        @WStrArrayClr
 005418FC    ret
>005418FD    jmp         @HandleFinally
>00541902    jmp         005418EF
 00541904    movzx       eax,byte ptr [ebp-9]
 00541908    pop         edi
 00541909    pop         esi
 0054190A    pop         ebx
 0054190B    mov         esp,ebp
 0054190D    pop         ebp
 0054190E    ret
*}
end;

//00541910
procedure TWideStrings.Exchange(Index1:Integer; Index2:Integer);
begin
{*
 00541910    push        ebp
 00541911    mov         ebp,esp
 00541913    add         esp,0FFFFFFF0
 00541916    push        ebx
 00541917    push        esi
 00541918    push        edi
 00541919    xor         ebx,ebx
 0054191B    mov         dword ptr [ebp-10],ebx
 0054191E    mov         dword ptr [ebp-4],ebx
 00541921    mov         esi,ecx
 00541923    mov         ebx,edx
 00541925    mov         dword ptr [ebp-8],eax
 00541928    xor         eax,eax
 0054192A    push        ebp
 0054192B    push        5419EB
 00541930    push        dword ptr fs:[eax]
 00541933    mov         dword ptr fs:[eax],esp
 00541936    mov         eax,dword ptr [ebp-8]
 00541939    call        TWideStrings.BeginUpdate
 0054193E    xor         eax,eax
 00541940    push        ebp
 00541941    push        5419C6
 00541946    push        dword ptr fs:[eax]
 00541949    mov         dword ptr fs:[eax],esp
 0054194C    lea         ecx,[ebp-4]
 0054194F    mov         edx,ebx
 00541951    mov         eax,dword ptr [ebp-8]
 00541954    mov         edi,dword ptr [eax]
 00541956    call        dword ptr [edi+0C]
 00541959    mov         edx,ebx
 0054195B    mov         eax,dword ptr [ebp-8]
 0054195E    mov         ecx,dword ptr [eax]
 00541960    call        dword ptr [ecx+18]
 00541963    mov         dword ptr [ebp-0C],eax
 00541966    lea         ecx,[ebp-10]
 00541969    mov         edx,esi
 0054196B    mov         eax,dword ptr [ebp-8]
 0054196E    mov         edi,dword ptr [eax]
 00541970    call        dword ptr [edi+0C]
 00541973    mov         ecx,dword ptr [ebp-10]
 00541976    mov         edx,ebx
 00541978    mov         eax,dword ptr [ebp-8]
 0054197B    mov         edi,dword ptr [eax]
 0054197D    call        dword ptr [edi+20]
 00541980    mov         edx,esi
 00541982    mov         eax,dword ptr [ebp-8]
 00541985    mov         ecx,dword ptr [eax]
 00541987    call        dword ptr [ecx+18]
 0054198A    mov         ecx,eax
 0054198C    mov         edx,ebx
 0054198E    mov         eax,dword ptr [ebp-8]
 00541991    mov         ebx,dword ptr [eax]
 00541993    call        dword ptr [ebx+24]
 00541996    mov         ecx,dword ptr [ebp-4]
 00541999    mov         edx,esi
 0054199B    mov         eax,dword ptr [ebp-8]
 0054199E    mov         ebx,dword ptr [eax]
 005419A0    call        dword ptr [ebx+20]
 005419A3    mov         ecx,dword ptr [ebp-0C]
 005419A6    mov         edx,esi
 005419A8    mov         eax,dword ptr [ebp-8]
 005419AB    mov         ebx,dword ptr [eax]
 005419AD    call        dword ptr [ebx+24]
 005419B0    xor         eax,eax
 005419B2    pop         edx
 005419B3    pop         ecx
 005419B4    pop         ecx
 005419B5    mov         dword ptr fs:[eax],edx
 005419B8    push        5419CD
 005419BD    mov         eax,dword ptr [ebp-8]
 005419C0    call        TWideStrings.EndUpdate
 005419C5    ret
>005419C6    jmp         @HandleFinally
>005419CB    jmp         005419BD
 005419CD    xor         eax,eax
 005419CF    pop         edx
 005419D0    pop         ecx
 005419D1    pop         ecx
 005419D2    mov         dword ptr fs:[eax],edx
 005419D5    push        5419F2
 005419DA    lea         eax,[ebp-10]
 005419DD    call        @WStrClr
 005419E2    lea         eax,[ebp-4]
 005419E5    call        @WStrClr
 005419EA    ret
>005419EB    jmp         @HandleFinally
>005419F0    jmp         005419DA
 005419F2    pop         edi
 005419F3    pop         esi
 005419F4    pop         ebx
 005419F5    mov         esp,ebp
 005419F7    pop         ebp
 005419F8    ret
*}
end;

//005419FC
procedure sub_005419FC;
begin
{*
 005419FC    mov         edx,dword ptr [eax]
 005419FE    call        dword ptr [edx+14];@AbstractError
 00541A01    ret
*}
end;

//00541A04
function TWideStrings.GetCommaText:WideString;
begin
{*
 00541A04    push        ebp
 00541A05    mov         ebp,esp
 00541A07    add         esp,0FFFFFFF4
 00541A0A    push        ebx
 00541A0B    mov         ebx,edx
 00541A0D    mov         dword ptr [ebp-4],eax
 00541A10    mov         eax,dword ptr [ebp-4]
 00541A13    movzx       eax,byte ptr [eax+4]
 00541A17    mov         byte ptr [ebp-5],al
 00541A1A    mov         eax,dword ptr [ebp-4]
 00541A1D    movzx       eax,word ptr [eax+6]
 00541A21    mov         word ptr [ebp-8],ax
 00541A25    mov         eax,dword ptr [ebp-4]
 00541A28    movzx       eax,word ptr [eax+0C]
 00541A2C    mov         word ptr [ebp-0A],ax
 00541A30    mov         dx,2C
 00541A34    mov         eax,dword ptr [ebp-4]
 00541A37    call        TWideStrings.SetDelimiter
 00541A3C    mov         dx,22
 00541A40    mov         eax,dword ptr [ebp-4]
 00541A43    call        TWideStrings.SetQuoteChar
 00541A48    xor         eax,eax
 00541A4A    push        ebp
 00541A4B    push        541A8E
 00541A50    push        dword ptr fs:[eax]
 00541A53    mov         dword ptr fs:[eax],esp
 00541A56    mov         edx,ebx
 00541A58    mov         eax,dword ptr [ebp-4]
 00541A5B    call        TWideStrings.GetDelimitedText
 00541A60    xor         eax,eax
 00541A62    pop         edx
 00541A63    pop         ecx
 00541A64    pop         ecx
 00541A65    mov         dword ptr fs:[eax],edx
 00541A68    push        541A95
 00541A6D    mov         eax,dword ptr [ebp-4]
 00541A70    movzx       edx,word ptr [ebp-8]
 00541A74    mov         word ptr [eax+6],dx
 00541A78    mov         eax,dword ptr [ebp-4]
 00541A7B    movzx       edx,word ptr [ebp-0A]
 00541A7F    mov         word ptr [eax+0C],dx
 00541A83    mov         eax,dword ptr [ebp-4]
 00541A86    movzx       edx,byte ptr [ebp-5]
 00541A8A    mov         byte ptr [eax+4],dl
 00541A8D    ret
>00541A8E    jmp         @HandleFinally
>00541A93    jmp         00541A6D
 00541A95    pop         ebx
 00541A96    mov         esp,ebp
 00541A98    pop         ebp
 00541A99    ret
*}
end;

//00541A9C
function IsDelimiter(const ch:WideChar):Boolean;
begin
{*
 00541A9C    push        ebp
 00541A9D    mov         ebp,esp
 00541A9F    push        ebx
 00541AA0    push        esi
 00541AA1    mov         esi,eax
 00541AA3    mov         bl,1
 00541AA5    mov         eax,dword ptr [ebp+8]
 00541AA8    mov         eax,dword ptr [eax-4]
 00541AAB    call        TWideStrings.GetStrictDelimiter
 00541AB0    test        al,al
>00541AB2    jne         00541ABA
 00541AB4    cmp         si,20
>00541AB8    jbe         00541AE1
 00541ABA    mov         eax,dword ptr [ebp+8]
 00541ABD    mov         eax,dword ptr [eax-4]
 00541AC0    call        TWideStrings.GetQuoteChar
 00541AC5    cmp         si,ax
>00541AC8    je          00541AE1
 00541ACA    mov         eax,dword ptr [ebp+8]
 00541ACD    mov         eax,dword ptr [eax-4]
 00541AD0    call        TWideStrings.GetDelimiter
 00541AD5    cmp         si,ax
>00541AD8    je          00541AE1
 00541ADA    test        si,si
>00541ADD    je          00541AE1
 00541ADF    xor         ebx,ebx
 00541AE1    mov         eax,ebx
 00541AE3    pop         esi
 00541AE4    pop         ebx
 00541AE5    pop         ebp
 00541AE6    ret
*}
end;

//00541AE8
function TWideStrings.GetDelimitedText:WideString;
begin
{*
 00541AE8    push        ebp
 00541AE9    mov         ebp,esp
 00541AEB    mov         ecx,6
 00541AF0    push        0
 00541AF2    push        0
 00541AF4    dec         ecx
>00541AF5    jne         00541AF0
 00541AF7    push        ebx
 00541AF8    push        esi
 00541AF9    push        edi
 00541AFA    mov         esi,edx
 00541AFC    mov         dword ptr [ebp-4],eax
 00541AFF    xor         eax,eax
 00541B01    push        ebp
 00541B02    push        541C86
 00541B07    push        dword ptr fs:[eax]
 00541B0A    mov         dword ptr fs:[eax],esp
 00541B0D    mov         eax,dword ptr [ebp-4]
 00541B10    mov         edx,dword ptr [eax]
 00541B12    call        dword ptr [edx+14]
 00541B15    mov         ebx,eax
 00541B17    cmp         ebx,1
>00541B1A    jne         00541B6D
 00541B1C    lea         ecx,[ebp-14]
 00541B1F    xor         edx,edx
 00541B21    mov         eax,dword ptr [ebp-4]
 00541B24    mov         edi,dword ptr [eax]
 00541B26    call        dword ptr [edi+0C]
 00541B29    mov         eax,dword ptr [ebp-14]
 00541B2C    xor         edx,edx
 00541B2E    call        @WStrEqual
>00541B33    jne         00541B6D
 00541B35    mov         eax,dword ptr [ebp-4]
 00541B38    call        TWideStrings.GetQuoteChar
 00541B3D    mov         edx,eax
 00541B3F    lea         eax,[ebp-18]
 00541B42    call        @WStrFromWChar
 00541B47    mov         eax,dword ptr [ebp-18]
 00541B4A    push        eax
 00541B4B    mov         eax,dword ptr [ebp-4]
 00541B4E    call        TWideStrings.GetQuoteChar
 00541B53    mov         edx,eax
 00541B55    lea         eax,[ebp-1C]
 00541B58    call        @WStrFromWChar
 00541B5D    mov         edx,dword ptr [ebp-1C]
 00541B60    mov         eax,esi
 00541B62    pop         ecx
 00541B63    call        @WStrCat3
>00541B68    jmp         00541C4B
 00541B6D    mov         eax,esi
 00541B6F    call        @WStrClr
 00541B74    dec         ebx
 00541B75    test        ebx,ebx
>00541B77    jl          00541C2B
 00541B7D    inc         ebx
 00541B7E    mov         dword ptr [ebp-10],ebx
 00541B81    mov         dword ptr [ebp-0C],0
 00541B88    lea         ecx,[ebp-8]
 00541B8B    mov         edx,dword ptr [ebp-0C]
 00541B8E    mov         eax,dword ptr [ebp-4]
 00541B91    mov         ebx,dword ptr [eax]
 00541B93    call        dword ptr [ebx+0C]
 00541B96    mov         eax,dword ptr [ebp-8]
 00541B99    call        @WStrToPWChar
 00541B9E    mov         ebx,eax
>00541BA0    jmp         00541BAA
 00541BA2    push        ebx
 00541BA3    call        user32.CharNextW
 00541BA8    mov         ebx,eax
 00541BAA    push        ebp
 00541BAB    movzx       eax,word ptr [ebx]
 00541BAE    call        IsDelimiter
 00541BB3    pop         ecx
 00541BB4    test        al,al
>00541BB6    je          00541BA2
 00541BB8    cmp         word ptr [ebx],0
>00541BBC    je          00541BDE
 00541BBE    mov         eax,dword ptr [ebp-4]
 00541BC1    call        TWideStrings.GetQuoteChar
 00541BC6    mov         edx,eax
 00541BC8    lea         ecx,[ebp-20]
 00541BCB    mov         eax,dword ptr [ebp-8]
 00541BCE    call        WideQuotedStr
 00541BD3    mov         edx,dword ptr [ebp-20]
 00541BD6    lea         eax,[ebp-8]
 00541BD9    call        @WStrLAsg
 00541BDE    mov         edx,dword ptr [esi]
 00541BE0    lea         eax,[ebp-28]
 00541BE3    mov         ecx,dword ptr [ebp-8]
 00541BE6    call        @WStrCat3
 00541BEB    mov         edx,dword ptr [ebp-28]
 00541BEE    lea         eax,[ebp-24]
 00541BF1    call        @UStrFromWStr
 00541BF6    lea         eax,[ebp-24]
 00541BF9    push        eax
 00541BFA    mov         eax,dword ptr [ebp-4]
 00541BFD    call        TWideStrings.GetDelimiter
 00541C02    mov         edx,eax
 00541C04    lea         eax,[ebp-2C]
 00541C07    call        @UStrFromWChar
 00541C0C    mov         edx,dword ptr [ebp-2C]
 00541C0F    pop         eax
 00541C10    call        @UStrCat
 00541C15    mov         edx,dword ptr [ebp-24]
 00541C18    mov         eax,esi
 00541C1A    call        @WStrFromUStr
 00541C1F    inc         dword ptr [ebp-0C]
 00541C22    dec         dword ptr [ebp-10]
>00541C25    jne         00541B88
 00541C2B    mov         eax,dword ptr [esi]
 00541C2D    mov         dword ptr [ebp-30],eax
 00541C30    mov         eax,dword ptr [ebp-30]
 00541C33    test        eax,eax
>00541C35    je          00541C3E
 00541C37    sub         eax,4
 00541C3A    mov         eax,dword ptr [eax]
 00541C3C    shr         eax,1
 00541C3E    mov         edx,esi
 00541C40    mov         ecx,1
 00541C45    xchg        eax,edx
 00541C46    call        @WStrDelete
 00541C4B    xor         eax,eax
 00541C4D    pop         edx
 00541C4E    pop         ecx
 00541C4F    pop         ecx
 00541C50    mov         dword ptr fs:[eax],edx
 00541C53    push        541C8D
 00541C58    lea         eax,[ebp-2C]
 00541C5B    call        @UStrClr
 00541C60    lea         eax,[ebp-28]
 00541C63    call        @WStrClr
 00541C68    lea         eax,[ebp-24]
 00541C6B    call        @UStrClr
 00541C70    lea         eax,[ebp-20]
 00541C73    mov         edx,4
 00541C78    call        @WStrArrayClr
 00541C7D    lea         eax,[ebp-8]
 00541C80    call        @WStrClr
 00541C85    ret
>00541C86    jmp         @HandleFinally
>00541C8B    jmp         00541C58
 00541C8D    pop         edi
 00541C8E    pop         esi
 00541C8F    pop         ebx
 00541C90    mov         esp,ebp
 00541C92    pop         ebp
 00541C93    ret
*}
end;

//00541C94
function TWideStrings.GetEnumerator:TWideStringsEnumerator;
begin
{*
 00541C94    mov         ecx,eax
 00541C96    mov         dl,1
 00541C98    mov         eax,[0054045C];TWideStringsEnumerator
 00541C9D    call        TWideStringsEnumerator.Create
 00541CA2    ret
*}
end;

//00541CA4
{*function sub_00541CA4:?;
begin
 00541CA4    xor         eax,eax
 00541CA6    ret
end;*}

//00541CA8
function TWideStrings.GetText:PWideChar;
begin
{*
 00541CA8    push        ebp
 00541CA9    mov         ebp,esp
 00541CAB    push        0
 00541CAD    push        ebx
 00541CAE    mov         ebx,eax
 00541CB0    xor         eax,eax
 00541CB2    push        ebp
 00541CB3    push        541CED
 00541CB8    push        dword ptr fs:[eax]
 00541CBB    mov         dword ptr fs:[eax],esp
 00541CBE    lea         edx,[ebp-4]
 00541CC1    mov         eax,ebx
 00541CC3    mov         ecx,dword ptr [eax]
 00541CC5    call        dword ptr [ecx+1C]
 00541CC8    mov         eax,dword ptr [ebp-4]
 00541CCB    call        @WStrToPWChar
 00541CD0    call        WStrNew
 00541CD5    mov         ebx,eax
 00541CD7    xor         eax,eax
 00541CD9    pop         edx
 00541CDA    pop         ecx
 00541CDB    pop         ecx
 00541CDC    mov         dword ptr fs:[eax],edx
 00541CDF    push        541CF4
 00541CE4    lea         eax,[ebp-4]
 00541CE7    call        @WStrClr
 00541CEC    ret
>00541CED    jmp         @HandleFinally
>00541CF2    jmp         00541CE4
 00541CF4    mov         eax,ebx
 00541CF6    pop         ebx
 00541CF7    pop         ecx
 00541CF8    pop         ebp
 00541CF9    ret
*}
end;

//00541CFC
function TWideStrings.GetTextStr:WideString;
begin
{*
 00541CFC    push        ebp
 00541CFD    mov         ebp,esp
 00541CFF    add         esp,0FFFFFFD8
 00541D02    push        ebx
 00541D03    push        esi
 00541D04    xor         ecx,ecx
 00541D06    mov         dword ptr [ebp-24],ecx
 00541D09    mov         dword ptr [ebp-4],ecx
 00541D0C    mov         dword ptr [ebp-8],ecx
 00541D0F    mov         dword ptr [ebp-10],edx
 00541D12    mov         dword ptr [ebp-0C],eax
 00541D15    xor         eax,eax
 00541D17    push        ebp
 00541D18    push        541E39
 00541D1D    push        dword ptr fs:[eax]
 00541D20    mov         dword ptr fs:[eax],esp
 00541D23    mov         eax,dword ptr [ebp-0C]
 00541D26    mov         edx,dword ptr [eax]
 00541D28    call        dword ptr [edx+14]
 00541D2B    mov         dword ptr [ebp-1C],eax
 00541D2E    xor         eax,eax
 00541D30    mov         dword ptr [ebp-18],eax
 00541D33    lea         edx,[ebp-8]
 00541D36    mov         eax,dword ptr [ebp-0C]
 00541D39    call        TWideStrings.GetLineBreak
 00541D3E    mov         esi,dword ptr [ebp-1C]
 00541D41    dec         esi
 00541D42    test        esi,esi
>00541D44    jl          00541D89
 00541D46    inc         esi
 00541D47    mov         dword ptr [ebp-14],0
 00541D4E    lea         ecx,[ebp-24]
 00541D51    mov         edx,dword ptr [ebp-14]
 00541D54    mov         eax,dword ptr [ebp-0C]
 00541D57    mov         ebx,dword ptr [eax]
 00541D59    call        dword ptr [ebx+0C]
 00541D5C    mov         eax,dword ptr [ebp-24]
 00541D5F    mov         dword ptr [ebp-28],eax
 00541D62    mov         eax,dword ptr [ebp-28]
 00541D65    test        eax,eax
>00541D67    je          00541D70
 00541D69    sub         eax,4
 00541D6C    mov         eax,dword ptr [eax]
 00541D6E    shr         eax,1
 00541D70    mov         edx,dword ptr [ebp-8]
 00541D73    test        edx,edx
>00541D75    je          00541D7E
 00541D77    sub         edx,4
 00541D7A    mov         edx,dword ptr [edx]
 00541D7C    shr         edx,1
 00541D7E    add         edx,eax
 00541D80    add         dword ptr [ebp-18],edx
 00541D83    inc         dword ptr [ebp-14]
 00541D86    dec         esi
>00541D87    jne         00541D4E
 00541D89    mov         eax,dword ptr [ebp-10]
 00541D8C    mov         ecx,dword ptr [ebp-18]
 00541D8F    xor         edx,edx
 00541D91    call        @WStrFromPWCharLen
 00541D96    mov         eax,dword ptr [ebp-10]
 00541D99    mov         eax,dword ptr [eax]
 00541D9B    mov         dword ptr [ebp-20],eax
 00541D9E    mov         esi,dword ptr [ebp-1C]
 00541DA1    dec         esi
 00541DA2    test        esi,esi
>00541DA4    jl          00541E16
 00541DA6    inc         esi
 00541DA7    mov         dword ptr [ebp-14],0
 00541DAE    lea         ecx,[ebp-4]
 00541DB1    mov         edx,dword ptr [ebp-14]
 00541DB4    mov         eax,dword ptr [ebp-0C]
 00541DB7    mov         ebx,dword ptr [eax]
 00541DB9    call        dword ptr [ebx+0C]
 00541DBC    mov         eax,dword ptr [ebp-4]
 00541DBF    test        eax,eax
>00541DC1    je          00541DCA
 00541DC3    sub         eax,4
 00541DC6    mov         eax,dword ptr [eax]
 00541DC8    shr         eax,1
 00541DCA    mov         ebx,eax
 00541DCC    test        ebx,ebx
>00541DCE    je          00541DE6
 00541DD0    mov         ecx,ebx
 00541DD2    add         ecx,ecx
 00541DD4    mov         edx,dword ptr [ebp-20]
 00541DD7    mov         eax,dword ptr [ebp-4]
 00541DDA    call        Move
 00541DDF    mov         eax,ebx
 00541DE1    add         eax,eax
 00541DE3    add         dword ptr [ebp-20],eax
 00541DE6    mov         eax,dword ptr [ebp-8]
 00541DE9    test        eax,eax
>00541DEB    je          00541DF4
 00541DED    sub         eax,4
 00541DF0    mov         eax,dword ptr [eax]
 00541DF2    shr         eax,1
 00541DF4    mov         ebx,eax
 00541DF6    test        ebx,ebx
>00541DF8    je          00541E10
 00541DFA    mov         ecx,ebx
 00541DFC    add         ecx,ecx
 00541DFE    mov         edx,dword ptr [ebp-20]
 00541E01    mov         eax,dword ptr [ebp-8]
 00541E04    call        Move
 00541E09    mov         eax,ebx
 00541E0B    add         eax,eax
 00541E0D    add         dword ptr [ebp-20],eax
 00541E10    inc         dword ptr [ebp-14]
 00541E13    dec         esi
>00541E14    jne         00541DAE
 00541E16    xor         eax,eax
 00541E18    pop         edx
 00541E19    pop         ecx
 00541E1A    pop         ecx
 00541E1B    mov         dword ptr fs:[eax],edx
 00541E1E    push        541E40
 00541E23    lea         eax,[ebp-24]
 00541E26    call        @WStrClr
 00541E2B    lea         eax,[ebp-8]
 00541E2E    mov         edx,2
 00541E33    call        @WStrArrayClr
 00541E38    ret
>00541E39    jmp         @HandleFinally
>00541E3E    jmp         00541E23
 00541E40    pop         esi
 00541E41    pop         ebx
 00541E42    mov         esp,ebp
 00541E44    pop         ebp
 00541E45    ret
*}
end;

//00541E48
function TWideStrings.IndexOf(S:WideString):Integer;
begin
{*
 00541E48    push        ebp
 00541E49    mov         ebp,esp
 00541E4B    add         esp,0FFFFFFF4
 00541E4E    push        ebx
 00541E4F    push        esi
 00541E50    push        edi
 00541E51    xor         ecx,ecx
 00541E53    mov         dword ptr [ebp-0C],ecx
 00541E56    mov         dword ptr [ebp-4],edx
 00541E59    mov         ebx,eax
 00541E5B    xor         eax,eax
 00541E5D    push        ebp
 00541E5E    push        541EC0
 00541E63    push        dword ptr fs:[eax]
 00541E66    mov         dword ptr fs:[eax],esp
 00541E69    mov         eax,ebx
 00541E6B    mov         edx,dword ptr [eax]
 00541E6D    call        dword ptr [edx+14]
 00541E70    mov         esi,eax
 00541E72    dec         esi
 00541E73    test        esi,esi
>00541E75    jl          00541EA3
 00541E77    inc         esi
 00541E78    mov         dword ptr [ebp-8],0
 00541E7F    lea         ecx,[ebp-0C]
 00541E82    mov         edx,dword ptr [ebp-8]
 00541E85    mov         eax,ebx
 00541E87    mov         edi,dword ptr [eax]
 00541E89    call        dword ptr [edi+0C]
 00541E8C    mov         edx,dword ptr [ebp-0C]
 00541E8F    mov         ecx,dword ptr [ebp-4]
 00541E92    mov         eax,ebx
 00541E94    mov         edi,dword ptr [eax]
 00541E96    call        dword ptr [edi+34]
 00541E99    test        eax,eax
>00541E9B    je          00541EAA
 00541E9D    inc         dword ptr [ebp-8]
 00541EA0    dec         esi
>00541EA1    jne         00541E7F
 00541EA3    mov         dword ptr [ebp-8],0FFFFFFFF
 00541EAA    xor         eax,eax
 00541EAC    pop         edx
 00541EAD    pop         ecx
 00541EAE    pop         ecx
 00541EAF    mov         dword ptr fs:[eax],edx
 00541EB2    push        541EC7
 00541EB7    lea         eax,[ebp-0C]
 00541EBA    call        @WStrClr
 00541EBF    ret
>00541EC0    jmp         @HandleFinally
>00541EC5    jmp         00541EB7
 00541EC7    mov         eax,dword ptr [ebp-8]
 00541ECA    pop         edi
 00541ECB    pop         esi
 00541ECC    pop         ebx
 00541ECD    mov         esp,ebp
 00541ECF    pop         ebp
 00541ED0    ret
*}
end;

//00541ED4
function TWideStrings.IndexOfName(Name:WideString):Integer;
begin
{*
 00541ED4    push        ebp
 00541ED5    mov         ebp,esp
 00541ED7    add         esp,0FFFFFFE8
 00541EDA    push        ebx
 00541EDB    push        esi
 00541EDC    xor         ecx,ecx
 00541EDE    mov         dword ptr [ebp-18],ecx
 00541EE1    mov         dword ptr [ebp-14],ecx
 00541EE4    mov         dword ptr [ebp-4],ecx
 00541EE7    mov         dword ptr [ebp-8],edx
 00541EEA    mov         ebx,eax
 00541EEC    xor         eax,eax
 00541EEE    push        ebp
 00541EEF    push        541F97
 00541EF4    push        dword ptr fs:[eax]
 00541EF7    mov         dword ptr fs:[eax],esp
 00541EFA    mov         eax,ebx
 00541EFC    mov         edx,dword ptr [eax]
 00541EFE    call        dword ptr [edx+14]
 00541F01    dec         eax
 00541F02    test        eax,eax
>00541F04    jl          00541F6D
 00541F06    inc         eax
 00541F07    mov         dword ptr [ebp-10],eax
 00541F0A    mov         dword ptr [ebp-0C],0
 00541F11    lea         ecx,[ebp-4]
 00541F14    mov         edx,dword ptr [ebp-0C]
 00541F17    mov         eax,ebx
 00541F19    mov         esi,dword ptr [eax]
 00541F1B    call        dword ptr [esi+0C]
 00541F1E    mov         eax,ebx
 00541F20    call        TWideStrings.GetNameValueSeparator
 00541F25    mov         edx,eax
 00541F27    lea         eax,[ebp-14]
 00541F2A    call        @WStrFromWChar
 00541F2F    mov         eax,dword ptr [ebp-14]
 00541F32    mov         edx,dword ptr [ebp-4]
 00541F35    call        Pos
 00541F3A    mov         esi,eax
 00541F3C    test        esi,esi
>00541F3E    je          00541F65
 00541F40    lea         eax,[ebp-18]
 00541F43    push        eax
 00541F44    mov         ecx,esi
 00541F46    dec         ecx
 00541F47    mov         edx,1
 00541F4C    mov         eax,dword ptr [ebp-4]
 00541F4F    call        @WStrCopy
 00541F54    mov         edx,dword ptr [ebp-18]
 00541F57    mov         ecx,dword ptr [ebp-8]
 00541F5A    mov         eax,ebx
 00541F5C    mov         esi,dword ptr [eax]
 00541F5E    call        dword ptr [esi+34]
 00541F61    test        eax,eax
>00541F63    je          00541F74
 00541F65    inc         dword ptr [ebp-0C]
 00541F68    dec         dword ptr [ebp-10]
>00541F6B    jne         00541F11
 00541F6D    mov         dword ptr [ebp-0C],0FFFFFFFF
 00541F74    xor         eax,eax
 00541F76    pop         edx
 00541F77    pop         ecx
 00541F78    pop         ecx
 00541F79    mov         dword ptr fs:[eax],edx
 00541F7C    push        541F9E
 00541F81    lea         eax,[ebp-18]
 00541F84    mov         edx,2
 00541F89    call        @WStrArrayClr
 00541F8E    lea         eax,[ebp-4]
 00541F91    call        @WStrClr
 00541F96    ret
>00541F97    jmp         @HandleFinally
>00541F9C    jmp         00541F81
 00541F9E    mov         eax,dword ptr [ebp-0C]
 00541FA1    pop         esi
 00541FA2    pop         ebx
 00541FA3    mov         esp,ebp
 00541FA5    pop         ebp
 00541FA6    ret
*}
end;

//00541FA8
function TWideStrings.IndexOfObject(AObject:TObject):Integer;
begin
{*
 00541FA8    push        ebx
 00541FA9    push        esi
 00541FAA    push        edi
 00541FAB    push        ebp
 00541FAC    mov         ebp,edx
 00541FAE    mov         edi,eax
 00541FB0    mov         eax,edi
 00541FB2    mov         edx,dword ptr [eax]
 00541FB4    call        dword ptr [edx+14]
 00541FB7    mov         ebx,eax
 00541FB9    dec         ebx
 00541FBA    test        ebx,ebx
>00541FBC    jl          00541FD2
 00541FBE    inc         ebx
 00541FBF    xor         esi,esi
 00541FC1    mov         edx,esi
 00541FC3    mov         eax,edi
 00541FC5    mov         ecx,dword ptr [eax]
 00541FC7    call        dword ptr [ecx+18]
 00541FCA    cmp         ebp,eax
>00541FCC    je          00541FD5
 00541FCE    inc         esi
 00541FCF    dec         ebx
>00541FD0    jne         00541FC1
 00541FD2    or          esi,0FFFFFFFF
 00541FD5    mov         eax,esi
 00541FD7    pop         ebp
 00541FD8    pop         edi
 00541FD9    pop         esi
 00541FDA    pop         ebx
 00541FDB    ret
*}
end;

//00541FDC
procedure TWideStrings.InsertObject(Index:Integer; S:WideString; AObject:TObject);
begin
{*
 00541FDC    push        ebp
 00541FDD    mov         ebp,esp
 00541FDF    push        ecx
 00541FE0    push        ebx
 00541FE1    push        esi
 00541FE2    push        edi
 00541FE3    mov         dword ptr [ebp-4],ecx
 00541FE6    mov         ebx,edx
 00541FE8    mov         esi,eax
 00541FEA    mov         ecx,dword ptr [ebp-4]
 00541FED    mov         edx,ebx
 00541FEF    mov         eax,esi
 00541FF1    mov         edi,dword ptr [eax]
 00541FF3    call        dword ptr [edi+64]
 00541FF6    mov         ecx,dword ptr [ebp+8]
 00541FF9    mov         edx,ebx
 00541FFB    mov         eax,esi
 00541FFD    mov         ebx,dword ptr [eax]
 00541FFF    call        dword ptr [ebx+24]
 00542002    pop         edi
 00542003    pop         esi
 00542004    pop         ebx
 00542005    pop         ecx
 00542006    pop         ebp
 00542007    ret         4
*}
end;

//0054200C
procedure TWideStrings.LoadFromFile(FileName:WideString);
begin
{*
 0054200C    push        ebp
 0054200D    mov         ebp,esp
 0054200F    add         esp,0FFFFFFF8
 00542012    push        ebx
 00542013    push        esi
 00542014    xor         ecx,ecx
 00542016    mov         dword ptr [ebp-8],ecx
 00542019    mov         esi,edx
 0054201B    mov         ebx,eax
 0054201D    xor         eax,eax
 0054201F    push        ebp
 00542020    push        542094
 00542025    push        dword ptr fs:[eax]
 00542028    mov         dword ptr fs:[eax],esp
 0054202B    push        20
 0054202D    lea         eax,[ebp-8]
 00542030    mov         edx,esi
 00542032    call        @UStrFromWStr
 00542037    mov         ecx,dword ptr [ebp-8]
 0054203A    mov         dl,1
 0054203C    mov         eax,[0043D6D0];TFileStream
 00542041    call        TFileStream.Create
 00542046    mov         dword ptr [ebp-4],eax
 00542049    xor         eax,eax
 0054204B    push        ebp
 0054204C    push        542077
 00542051    push        dword ptr fs:[eax]
 00542054    mov         dword ptr fs:[eax],esp
 00542057    mov         edx,dword ptr [ebp-4]
 0054205A    mov         eax,ebx
 0054205C    mov         ecx,dword ptr [eax]
 0054205E    call        dword ptr [ecx+74]
 00542061    xor         eax,eax
 00542063    pop         edx
 00542064    pop         ecx
 00542065    pop         ecx
 00542066    mov         dword ptr fs:[eax],edx
 00542069    push        54207E
 0054206E    mov         eax,dword ptr [ebp-4]
 00542071    call        TObject.Free
 00542076    ret
>00542077    jmp         @HandleFinally
>0054207C    jmp         0054206E
 0054207E    xor         eax,eax
 00542080    pop         edx
 00542081    pop         ecx
 00542082    pop         ecx
 00542083    mov         dword ptr fs:[eax],edx
 00542086    push        54209B
 0054208B    lea         eax,[ebp-8]
 0054208E    call        @UStrClr
 00542093    ret
>00542094    jmp         @HandleFinally
>00542099    jmp         0054208B
 0054209B    pop         esi
 0054209C    pop         ebx
 0054209D    pop         ecx
 0054209E    pop         ecx
 0054209F    pop         ebp
 005420A0    ret
*}
end;

//005420A4
procedure TWideStrings.LoadFromStream(Stream:TStream);
begin
{*
 005420A4    push        ebx
 005420A5    xor         ecx,ecx
 005420A7    mov         ebx,dword ptr [eax]
 005420A9    call        dword ptr [ebx+78]
 005420AC    pop         ebx
 005420AD    ret
*}
end;

//005420B0
procedure TWideStrings.Move(CurIndex:Integer; NewIndex:Integer);
begin
{*
 005420B0    push        ebp
 005420B1    mov         ebp,esp
 005420B3    add         esp,0FFFFFFF4
 005420B6    push        ebx
 005420B7    push        esi
 005420B8    push        edi
 005420B9    xor         ebx,ebx
 005420BB    mov         dword ptr [ebp-4],ebx
 005420BE    mov         edi,ecx
 005420C0    mov         esi,edx
 005420C2    mov         dword ptr [ebp-8],eax
 005420C5    xor         eax,eax
 005420C7    push        ebp
 005420C8    push        542155
 005420CD    push        dword ptr fs:[eax]
 005420D0    mov         dword ptr fs:[eax],esp
 005420D3    cmp         edi,esi
>005420D5    je          0054213F
 005420D7    mov         eax,dword ptr [ebp-8]
 005420DA    call        TWideStrings.BeginUpdate
 005420DF    xor         eax,eax
 005420E1    push        ebp
 005420E2    push        542138
 005420E7    push        dword ptr fs:[eax]
 005420EA    mov         dword ptr fs:[eax],esp
 005420ED    lea         ecx,[ebp-4]
 005420F0    mov         edx,esi
 005420F2    mov         eax,dword ptr [ebp-8]
 005420F5    mov         ebx,dword ptr [eax]
 005420F7    call        dword ptr [ebx+0C]
 005420FA    mov         edx,esi
 005420FC    mov         eax,dword ptr [ebp-8]
 005420FF    mov         ecx,dword ptr [eax]
 00542101    call        dword ptr [ecx+18]
 00542104    mov         dword ptr [ebp-0C],eax
 00542107    mov         edx,esi
 00542109    mov         eax,dword ptr [ebp-8]
 0054210C    mov         ecx,dword ptr [eax]
 0054210E    call        dword ptr [ecx+4C]
 00542111    mov         eax,dword ptr [ebp-0C]
 00542114    push        eax
 00542115    mov         ecx,dword ptr [ebp-4]
 00542118    mov         edx,edi
 0054211A    mov         eax,dword ptr [ebp-8]
 0054211D    mov         ebx,dword ptr [eax]
 0054211F    call        dword ptr [ebx+68]
 00542122    xor         eax,eax
 00542124    pop         edx
 00542125    pop         ecx
 00542126    pop         ecx
 00542127    mov         dword ptr fs:[eax],edx
 0054212A    push        54213F
 0054212F    mov         eax,dword ptr [ebp-8]
 00542132    call        TWideStrings.EndUpdate
 00542137    ret
>00542138    jmp         @HandleFinally
>0054213D    jmp         0054212F
 0054213F    xor         eax,eax
 00542141    pop         edx
 00542142    pop         ecx
 00542143    pop         ecx
 00542144    mov         dword ptr fs:[eax],edx
 00542147    push        54215C
 0054214C    lea         eax,[ebp-4]
 0054214F    call        @WStrClr
 00542154    ret
>00542155    jmp         @HandleFinally
>0054215A    jmp         0054214C
 0054215C    pop         edi
 0054215D    pop         esi
 0054215E    pop         ebx
 0054215F    mov         esp,ebp
 00542161    pop         ebp
 00542162    ret
*}
end;

//00542164
procedure TWideStrings.Put(Index:Integer; const S:WideString);
begin
{*
 00542164    push        ebx
 00542165    push        esi
 00542166    push        edi
 00542167    push        ebp
 00542168    mov         ebp,ecx
 0054216A    mov         esi,edx
 0054216C    mov         ebx,eax
 0054216E    mov         edx,esi
 00542170    mov         eax,ebx
 00542172    mov         ecx,dword ptr [eax]
 00542174    call        dword ptr [ecx+18]
 00542177    mov         edi,eax
 00542179    mov         edx,esi
 0054217B    mov         eax,ebx
 0054217D    mov         ecx,dword ptr [eax]
 0054217F    call        dword ptr [ecx+4C]
 00542182    push        edi
 00542183    mov         ecx,ebp
 00542185    mov         edx,esi
 00542187    mov         eax,ebx
 00542189    mov         ebx,dword ptr [eax]
 0054218B    call        dword ptr [ebx+68]
 0054218E    pop         ebp
 0054218F    pop         edi
 00542190    pop         esi
 00542191    pop         ebx
 00542192    ret
*}
end;

//00542194
procedure sub_00542194;
begin
{*
 00542194    ret
*}
end;

//00542198
procedure TWideStrings.ReadData(Reader:TReader);
begin
{*
 00542198    push        ebp
 00542199    mov         ebp,esp
 0054219B    add         esp,0FFFFFFF4
 0054219E    xor         ecx,ecx
 005421A0    mov         dword ptr [ebp-0C],ecx
 005421A3    mov         dword ptr [ebp-8],edx
 005421A6    mov         dword ptr [ebp-4],eax
 005421A9    xor         eax,eax
 005421AB    push        ebp
 005421AC    push        542240
 005421B1    push        dword ptr fs:[eax]
 005421B4    mov         dword ptr fs:[eax],esp
 005421B7    mov         dl,1
 005421B9    mov         eax,dword ptr [ebp-8]
 005421BC    call        TReader.CheckValue
 005421C1    mov         eax,dword ptr [ebp-4]
 005421C4    call        TWideStrings.BeginUpdate
 005421C9    xor         eax,eax
 005421CB    push        ebp
 005421CC    push        542219
 005421D1    push        dword ptr fs:[eax]
 005421D4    mov         dword ptr fs:[eax],esp
 005421D7    mov         eax,dword ptr [ebp-4]
 005421DA    mov         edx,dword ptr [eax]
 005421DC    call        dword ptr [edx+48]
>005421DF    jmp         005421F7
 005421E1    lea         edx,[ebp-0C]
 005421E4    mov         eax,dword ptr [ebp-8]
 005421E7    call        TReader.ReadWideString
 005421EC    mov         edx,dword ptr [ebp-0C]
 005421EF    mov         eax,dword ptr [ebp-4]
 005421F2    mov         ecx,dword ptr [eax]
 005421F4    call        dword ptr [ecx+38]
 005421F7    mov         eax,dword ptr [ebp-8]
 005421FA    call        TReader.EndOfList
 005421FF    test        al,al
>00542201    je          005421E1
 00542203    xor         eax,eax
 00542205    pop         edx
 00542206    pop         ecx
 00542207    pop         ecx
 00542208    mov         dword ptr fs:[eax],edx
 0054220B    push        542220
 00542210    mov         eax,dword ptr [ebp-4]
 00542213    call        TWideStrings.EndUpdate
 00542218    ret
>00542219    jmp         @HandleFinally
>0054221E    jmp         00542210
 00542220    xor         edx,edx
 00542222    mov         eax,dword ptr [ebp-8]
 00542225    call        TReader.CheckValue
 0054222A    xor         eax,eax
 0054222C    pop         edx
 0054222D    pop         ecx
 0054222E    pop         ecx
 0054222F    mov         dword ptr fs:[eax],edx
 00542232    push        542247
 00542237    lea         eax,[ebp-0C]
 0054223A    call        @WStrClr
 0054223F    ret
>00542240    jmp         @HandleFinally
>00542245    jmp         00542237
 00542247    mov         esp,ebp
 00542249    pop         ebp
 0054224A    ret
*}
end;

//0054224C
procedure TWideStrings.SaveToFile(FileName:WideString);
begin
{*
 0054224C    push        ebx
 0054224D    xor         ecx,ecx
 0054224F    mov         ebx,dword ptr [eax]
 00542251    call        dword ptr [ebx+84]
 00542257    pop         ebx
 00542258    ret
*}
end;

//0054225C
procedure TWideStrings.SaveToFile(FileName:WideString; Encoding:TEncoding);
begin
{*
 0054225C    push        ebp
 0054225D    mov         ebp,esp
 0054225F    add         esp,0FFFFFFF8
 00542262    push        ebx
 00542263    push        esi
 00542264    push        edi
 00542265    xor         ebx,ebx
 00542267    mov         dword ptr [ebp-8],ebx
 0054226A    mov         edi,ecx
 0054226C    mov         esi,edx
 0054226E    mov         ebx,eax
 00542270    xor         eax,eax
 00542272    push        ebp
 00542273    push        5422EF
 00542278    push        dword ptr fs:[eax]
 0054227B    mov         dword ptr fs:[eax],esp
 0054227E    push        0FF00
 00542283    lea         eax,[ebp-8]
 00542286    mov         edx,esi
 00542288    call        @UStrFromWStr
 0054228D    mov         ecx,dword ptr [ebp-8]
 00542290    mov         dl,1
 00542292    mov         eax,[0043D6D0];TFileStream
 00542297    call        TFileStream.Create
 0054229C    mov         dword ptr [ebp-4],eax
 0054229F    xor         eax,eax
 005422A1    push        ebp
 005422A2    push        5422D2
 005422A7    push        dword ptr fs:[eax]
 005422AA    mov         dword ptr fs:[eax],esp
 005422AD    mov         ecx,edi
 005422AF    mov         edx,dword ptr [ebp-4]
 005422B2    mov         eax,ebx
 005422B4    mov         ebx,dword ptr [eax]
 005422B6    call        dword ptr [ebx+8C]
 005422BC    xor         eax,eax
 005422BE    pop         edx
 005422BF    pop         ecx
 005422C0    pop         ecx
 005422C1    mov         dword ptr fs:[eax],edx
 005422C4    push        5422D9
 005422C9    mov         eax,dword ptr [ebp-4]
 005422CC    call        TObject.Free
 005422D1    ret
>005422D2    jmp         @HandleFinally
>005422D7    jmp         005422C9
 005422D9    xor         eax,eax
 005422DB    pop         edx
 005422DC    pop         ecx
 005422DD    pop         ecx
 005422DE    mov         dword ptr fs:[eax],edx
 005422E1    push        5422F6
 005422E6    lea         eax,[ebp-8]
 005422E9    call        @UStrClr
 005422EE    ret
>005422EF    jmp         @HandleFinally
>005422F4    jmp         005422E6
 005422F6    pop         edi
 005422F7    pop         esi
 005422F8    pop         ebx
 005422F9    pop         ecx
 005422FA    pop         ecx
 005422FB    pop         ebp
 005422FC    ret
*}
end;

//00542300
procedure TWideStrings.SaveToStream(Stream:TStream; Encoding:TEncoding);
begin
{*
 00542300    push        ebp
 00542301    mov         ebp,esp
 00542303    push        0
 00542305    push        0
 00542307    push        0
 00542309    push        0
 0054230B    push        ebx
 0054230C    push        esi
 0054230D    push        edi
 0054230E    mov         ebx,ecx
 00542310    mov         edi,edx
 00542312    mov         esi,eax
 00542314    xor         eax,eax
 00542316    push        ebp
 00542317    push        5423BE
 0054231C    push        dword ptr fs:[eax]
 0054231F    mov         dword ptr fs:[eax],esp
 00542322    test        ebx,ebx
>00542324    jne         0054232D
 00542326    call        TEncoding.GetUnicode
 0054232B    mov         ebx,eax
 0054232D    lea         edx,[ebp-10]
 00542330    mov         eax,esi
 00542332    mov         ecx,dword ptr [eax]
 00542334    call        dword ptr [ecx+1C]
 00542337    mov         edx,dword ptr [ebp-10]
 0054233A    lea         eax,[ebp-0C]
 0054233D    call        @UStrFromWStr
 00542342    mov         edx,dword ptr [ebp-0C]
 00542345    lea         ecx,[ebp-4]
 00542348    mov         eax,ebx
 0054234A    call        TEncoding.GetBytes
 0054234F    lea         edx,[ebp-8]
 00542352    mov         eax,ebx
 00542354    mov         ecx,dword ptr [eax]
 00542356    call        dword ptr [ecx+24]
 00542359    mov         eax,dword ptr [ebp-8]
 0054235C    call        @DynArrayLength
 00542361    test        eax,eax
>00542363    jle         00542379
 00542365    mov         eax,dword ptr [ebp-8]
 00542368    call        @DynArrayLength
 0054236D    mov         ecx,eax
 0054236F    mov         edx,dword ptr [ebp-8]
 00542372    mov         eax,edi
 00542374    call        TStream.WriteBuffer
 00542379    mov         eax,dword ptr [ebp-4]
 0054237C    call        @DynArrayLength
 00542381    mov         ecx,eax
 00542383    mov         edx,dword ptr [ebp-4]
 00542386    mov         eax,edi
 00542388    call        TStream.WriteBuffer
 0054238D    xor         eax,eax
 0054238F    pop         edx
 00542390    pop         ecx
 00542391    pop         ecx
 00542392    mov         dword ptr fs:[eax],edx
 00542395    push        5423C5
 0054239A    lea         eax,[ebp-10]
 0054239D    call        @WStrClr
 005423A2    lea         eax,[ebp-0C]
 005423A5    call        @UStrClr
 005423AA    lea         eax,[ebp-8]
 005423AD    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005423B3    mov         ecx,2
 005423B8    call        @FinalizeArray
 005423BD    ret
>005423BE    jmp         @HandleFinally
>005423C3    jmp         0054239A
 005423C5    pop         edi
 005423C6    pop         esi
 005423C7    pop         ebx
 005423C8    mov         esp,ebp
 005423CA    pop         ebp
 005423CB    ret
*}
end;

//005423CC
procedure TWideStrings.SaveToStream(Stream:TStream);
begin
{*
 005423CC    push        ebx
 005423CD    xor         ecx,ecx
 005423CF    mov         ebx,dword ptr [eax]
 005423D1    call        dword ptr [ebx+8C]
 005423D7    pop         ebx
 005423D8    ret
*}
end;

//005423DC
procedure sub_005423DC;
begin
{*
 005423DC    ret
*}
end;

//005423E0
procedure TWideStrings.SetCommaText(const Value:WideString);
begin
{*
 005423E0    push        ebp
 005423E1    mov         ebp,esp
 005423E3    add         esp,0FFFFFFF4
 005423E6    push        ebx
 005423E7    mov         ebx,edx
 005423E9    mov         dword ptr [ebp-4],eax
 005423EC    mov         eax,dword ptr [ebp-4]
 005423EF    movzx       eax,byte ptr [eax+4]
 005423F3    mov         byte ptr [ebp-5],al
 005423F6    mov         eax,dword ptr [ebp-4]
 005423F9    movzx       eax,word ptr [eax+6]
 005423FD    mov         word ptr [ebp-8],ax
 00542401    mov         eax,dword ptr [ebp-4]
 00542404    movzx       eax,word ptr [eax+0C]
 00542408    mov         word ptr [ebp-0A],ax
 0054240C    mov         dx,2C
 00542410    mov         eax,dword ptr [ebp-4]
 00542413    call        TWideStrings.SetDelimiter
 00542418    mov         dx,22
 0054241C    mov         eax,dword ptr [ebp-4]
 0054241F    call        TWideStrings.SetQuoteChar
 00542424    xor         eax,eax
 00542426    push        ebp
 00542427    push        54246A
 0054242C    push        dword ptr fs:[eax]
 0054242F    mov         dword ptr fs:[eax],esp
 00542432    mov         edx,ebx
 00542434    mov         eax,dword ptr [ebp-4]
 00542437    call        TWideStrings.SetDelimitedText
 0054243C    xor         eax,eax
 0054243E    pop         edx
 0054243F    pop         ecx
 00542440    pop         ecx
 00542441    mov         dword ptr fs:[eax],edx
 00542444    push        542471
 00542449    mov         eax,dword ptr [ebp-4]
 0054244C    movzx       edx,word ptr [ebp-8]
 00542450    mov         word ptr [eax+6],dx
 00542454    mov         eax,dword ptr [ebp-4]
 00542457    movzx       edx,word ptr [ebp-0A]
 0054245B    mov         word ptr [eax+0C],dx
 0054245F    mov         eax,dword ptr [ebp-4]
 00542462    movzx       edx,byte ptr [ebp-5]
 00542466    mov         byte ptr [eax+4],dl
 00542469    ret
>0054246A    jmp         @HandleFinally
>0054246F    jmp         00542449
 00542471    pop         ebx
 00542472    mov         esp,ebp
 00542474    pop         ebp
 00542475    ret
*}
end;

//00542478
procedure TWideStrings.SetStringsAdapter(const Value:IWideStringsAdapter);
begin
{*
 00542478    push        ebx
 00542479    push        esi
 0054247A    mov         esi,edx
 0054247C    mov         ebx,eax
 0054247E    cmp         dword ptr [ebx+18],0
>00542482    je          0054248C
 00542484    mov         eax,dword ptr [ebx+18]
 00542487    mov         edx,dword ptr [eax]
 00542489    call        dword ptr [edx+10]
 0054248C    lea         eax,[ebx+18]
 0054248F    mov         edx,esi
 00542491    call        @IntfCopy
 00542496    cmp         dword ptr [ebx+18],0
>0054249A    je          005424A6
 0054249C    mov         edx,ebx
 0054249E    mov         eax,dword ptr [ebx+18]
 005424A1    mov         ecx,dword ptr [eax]
 005424A3    call        dword ptr [ecx+0C]
 005424A6    pop         esi
 005424A7    pop         ebx
 005424A8    ret
*}
end;

//005424AC
procedure TWideStrings.SetText(Text:PWideChar);
begin
{*
 005424AC    push        ebp
 005424AD    mov         ebp,esp
 005424AF    push        0
 005424B1    push        ebx
 005424B2    push        esi
 005424B3    mov         esi,edx
 005424B5    mov         ebx,eax
 005424B7    xor         eax,eax
 005424B9    push        ebp
 005424BA    push        5424EF
 005424BF    push        dword ptr fs:[eax]
 005424C2    mov         dword ptr fs:[eax],esp
 005424C5    lea         eax,[ebp-4]
 005424C8    mov         edx,esi
 005424CA    call        @WStrFromPWChar
 005424CF    mov         edx,dword ptr [ebp-4]
 005424D2    mov         eax,ebx
 005424D4    mov         ecx,dword ptr [eax]
 005424D6    call        dword ptr [ecx+2C]
 005424D9    xor         eax,eax
 005424DB    pop         edx
 005424DC    pop         ecx
 005424DD    pop         ecx
 005424DE    mov         dword ptr fs:[eax],edx
 005424E1    push        5424F6
 005424E6    lea         eax,[ebp-4]
 005424E9    call        @WStrClr
 005424EE    ret
>005424EF    jmp         @HandleFinally
>005424F4    jmp         005424E6
 005424F6    pop         esi
 005424F7    pop         ebx
 005424F8    pop         ecx
 005424F9    pop         ebp
 005424FA    ret
*}
end;

//005424FC
procedure TWideStrings.SetTextStr(const Value:WideString);
begin
{*
 005424FC    push        ebp
 005424FD    mov         ebp,esp
 005424FF    xor         ecx,ecx
 00542501    push        ecx
 00542502    push        ecx
 00542503    push        ecx
 00542504    push        ecx
 00542505    push        ecx
 00542506    push        ecx
 00542507    push        ecx
 00542508    push        ebx
 00542509    push        esi
 0054250A    push        edi
 0054250B    mov         ebx,edx
 0054250D    mov         dword ptr [ebp-8],eax
 00542510    xor         eax,eax
 00542512    push        ebp
 00542513    push        54268C
 00542518    push        dword ptr fs:[eax]
 0054251B    mov         dword ptr fs:[eax],esp
 0054251E    mov         eax,dword ptr [ebp-8]
 00542521    call        TWideStrings.BeginUpdate
 00542526    xor         edx,edx
 00542528    push        ebp
 00542529    push        54265A
 0054252E    push        dword ptr fs:[edx]
 00542531    mov         dword ptr fs:[edx],esp
 00542534    mov         eax,dword ptr [ebp-8]
 00542537    mov         edx,dword ptr [eax]
 00542539    call        dword ptr [edx+48]
 0054253C    mov         eax,ebx
 0054253E    call        @WStrToPWChar
 00542543    mov         ebx,eax
 00542545    test        ebx,ebx
>00542547    je          00542644
 0054254D    lea         edx,[ebp-10]
 00542550    mov         eax,dword ptr [ebp-8]
 00542553    call        TWideStrings.GetLineBreak
 00542558    mov         eax,dword ptr [ebp-10]
 0054255B    mov         edx,5426A0
 00542560    call        WideCompareStr
 00542565    test        eax,eax
>00542567    jne         005425C0
>00542569    jmp         005425B5
 0054256B    mov         esi,ebx
>0054256D    jmp         00542572
 0054256F    add         ebx,2
 00542572    mov         edx,5426A8
 00542577    movzx       eax,word ptr [ebx]
 0054257A    call        InOpSet
 0054257F    test        al,al
>00542581    je          0054256F
 00542583    mov         ecx,ebx
 00542585    sub         ecx,esi
 00542587    sar         ecx,1
>00542589    jns         0054258E
 0054258B    adc         ecx,0
 0054258E    lea         eax,[ebp-4]
 00542591    mov         edx,esi
 00542593    call        @WStrFromPWCharLen
 00542598    mov         edx,dword ptr [ebp-4]
 0054259B    mov         eax,dword ptr [ebp-8]
 0054259E    mov         ecx,dword ptr [eax]
 005425A0    call        dword ptr [ecx+38]
 005425A3    cmp         word ptr [ebx],0D
>005425A7    jne         005425AC
 005425A9    add         ebx,2
 005425AC    cmp         word ptr [ebx],0A
>005425B0    jne         005425B5
 005425B2    add         ebx,2
 005425B5    cmp         word ptr [ebx],0
>005425B9    jne         0054256B
>005425BB    jmp         00542644
 005425C0    lea         edx,[ebp-14]
 005425C3    mov         eax,dword ptr [ebp-8]
 005425C6    call        TWideStrings.GetLineBreak
 005425CB    mov         eax,dword ptr [ebp-14]
 005425CE    mov         dword ptr [ebp-18],eax
 005425D1    mov         eax,dword ptr [ebp-18]
 005425D4    test        eax,eax
>005425D6    je          005425DF
 005425D8    sub         eax,4
 005425DB    mov         eax,dword ptr [eax]
 005425DD    shr         eax,1
 005425DF    mov         dword ptr [ebp-0C],eax
>005425E2    jmp         0054263E
 005425E4    mov         esi,ebx
 005425E6    lea         edx,[ebp-1C]
 005425E9    mov         eax,dword ptr [ebp-8]
 005425EC    call        TWideStrings.GetLineBreak
 005425F1    mov         eax,dword ptr [ebp-1C]
 005425F4    call        @WStrToPWChar
 005425F9    mov         edx,eax
 005425FB    mov         eax,ebx
 005425FD    call        AnsiStrPos
 00542602    mov         edi,eax
>00542604    jmp         00542609
 00542606    add         ebx,2
 00542609    cmp         word ptr [ebx],0
>0054260D    je          00542613
 0054260F    cmp         edi,ebx
>00542611    jne         00542606
 00542613    mov         ecx,ebx
 00542615    sub         ecx,esi
 00542617    sar         ecx,1
>00542619    jns         0054261E
 0054261B    adc         ecx,0
 0054261E    lea         eax,[ebp-4]
 00542621    mov         edx,esi
 00542623    call        @WStrFromPWCharLen
 00542628    mov         edx,dword ptr [ebp-4]
 0054262B    mov         eax,dword ptr [ebp-8]
 0054262E    mov         ecx,dword ptr [eax]
 00542630    call        dword ptr [ecx+38]
 00542633    cmp         edi,ebx
>00542635    jne         0054263E
 00542637    mov         eax,dword ptr [ebp-0C]
 0054263A    add         eax,eax
 0054263C    add         ebx,eax
 0054263E    cmp         word ptr [ebx],0
>00542642    jne         005425E4
 00542644    xor         eax,eax
 00542646    pop         edx
 00542647    pop         ecx
 00542648    pop         ecx
 00542649    mov         dword ptr fs:[eax],edx
 0054264C    push        542661
 00542651    mov         eax,dword ptr [ebp-8]
 00542654    call        TWideStrings.EndUpdate
 00542659    ret
>0054265A    jmp         @HandleFinally
>0054265F    jmp         00542651
 00542661    xor         eax,eax
 00542663    pop         edx
 00542664    pop         ecx
 00542665    pop         ecx
 00542666    mov         dword ptr fs:[eax],edx
 00542669    push        542693
 0054266E    lea         eax,[ebp-1C]
 00542671    call        @WStrClr
 00542676    lea         eax,[ebp-14]
 00542679    mov         edx,2
 0054267E    call        @WStrArrayClr
 00542683    lea         eax,[ebp-4]
 00542686    call        @WStrClr
 0054268B    ret
>0054268C    jmp         @HandleFinally
>00542691    jmp         0054266E
 00542693    pop         edi
 00542694    pop         esi
 00542695    pop         ebx
 00542696    mov         esp,ebp
 00542698    pop         ebp
 00542699    ret
*}
end;

//005426C8
procedure sub_005426C8;
begin
{*
 005426C8    ret
*}
end;

//005426CC
procedure TWideStrings.WriteData(Writer:TWriter);
begin
{*
 005426CC    push        ebp
 005426CD    mov         ebp,esp
 005426CF    add         esp,0FFFFFFF0
 005426D2    push        ebx
 005426D3    push        esi
 005426D4    push        edi
 005426D5    xor         ecx,ecx
 005426D7    mov         dword ptr [ebp-0C],ecx
 005426DA    mov         dword ptr [ebp-10],ecx
 005426DD    mov         dword ptr [ebp-8],edx
 005426E0    mov         dword ptr [ebp-4],eax
 005426E3    xor         eax,eax
 005426E5    push        ebp
 005426E6    push        54275C
 005426EB    push        dword ptr fs:[eax]
 005426EE    mov         dword ptr fs:[eax],esp
 005426F1    mov         dl,1
 005426F3    mov         eax,dword ptr [ebp-8]
 005426F6    call        TWriter.WriteValue
 005426FB    mov         eax,dword ptr [ebp-4]
 005426FE    mov         edx,dword ptr [eax]
 00542700    call        dword ptr [edx+14]
 00542703    mov         ebx,eax
 00542705    dec         ebx
 00542706    test        ebx,ebx
>00542708    jl          00542734
 0054270A    inc         ebx
 0054270B    xor         esi,esi
 0054270D    lea         ecx,[ebp-10]
 00542710    mov         edx,esi
 00542712    mov         eax,dword ptr [ebp-4]
 00542715    mov         edi,dword ptr [eax]
 00542717    call        dword ptr [edi+0C]
 0054271A    mov         edx,dword ptr [ebp-10]
 0054271D    lea         eax,[ebp-0C]
 00542720    call        @UStrFromWStr
 00542725    mov         edx,dword ptr [ebp-0C]
 00542728    mov         eax,dword ptr [ebp-8]
 0054272B    call        TWriter.WriteWideString
 00542730    inc         esi
 00542731    dec         ebx
>00542732    jne         0054270D
 00542734    xor         edx,edx
 00542736    mov         eax,dword ptr [ebp-8]
 00542739    call        TWriter.WriteValue
 0054273E    xor         eax,eax
 00542740    pop         edx
 00542741    pop         ecx
 00542742    pop         ecx
 00542743    mov         dword ptr fs:[eax],edx
 00542746    push        542763
 0054274B    lea         eax,[ebp-10]
 0054274E    call        @WStrClr
 00542753    lea         eax,[ebp-0C]
 00542756    call        @UStrClr
 0054275B    ret
>0054275C    jmp         @HandleFinally
>00542761    jmp         0054274B
 00542763    pop         edi
 00542764    pop         esi
 00542765    pop         ebx
 00542766    mov         esp,ebp
 00542768    pop         ebp
 00542769    ret
*}
end;

//0054276C
procedure TWideStrings.SetDelimitedText(const Value:WideString);
begin
{*
 0054276C    push        ebp
 0054276D    mov         ebp,esp
 0054276F    add         esp,0FFFFFFF4
 00542772    push        ebx
 00542773    push        esi
 00542774    push        edi
 00542775    xor         ecx,ecx
 00542777    mov         dword ptr [ebp-4],ecx
 0054277A    mov         esi,edx
 0054277C    mov         dword ptr [ebp-8],eax
 0054277F    lea         ebx,[ebp-0C]
 00542782    xor         eax,eax
 00542784    push        ebp
 00542785    push        542923
 0054278A    push        dword ptr fs:[eax]
 0054278D    mov         dword ptr fs:[eax],esp
 00542790    mov         eax,dword ptr [ebp-8]
 00542793    call        TWideStrings.BeginUpdate
 00542798    xor         eax,eax
 0054279A    push        ebp
 0054279B    push        542906
 005427A0    push        dword ptr fs:[eax]
 005427A3    mov         dword ptr fs:[eax],esp
 005427A6    mov         eax,dword ptr [ebp-8]
 005427A9    mov         edx,dword ptr [eax]
 005427AB    call        dword ptr [edx+48]
 005427AE    mov         eax,esi
 005427B0    call        @WStrToPWChar
 005427B5    mov         dword ptr [ebx],eax
 005427B7    mov         eax,dword ptr [ebp-8]
 005427BA    call        TWideStrings.GetStrictDelimiter
 005427BF    test        al,al
>005427C1    jne         005428E2
>005427C7    jmp         005427D3
 005427C9    mov         eax,dword ptr [ebx]
 005427CB    push        eax
 005427CC    call        user32.CharNextW
 005427D1    mov         dword ptr [ebx],eax
 005427D3    mov         edx,542934
 005427D8    mov         eax,dword ptr [ebx]
 005427DA    movzx       eax,word ptr [eax]
 005427DD    call        InOpSet
 005427E2    test        al,al
>005427E4    jne         005427C9
>005427E6    jmp         005428E2
 005427EB    mov         eax,dword ptr [ebp-8]
 005427EE    call        TWideStrings.GetQuoteChar
 005427F3    cmp         di,ax
>005427F6    jne         0054280E
 005427F8    mov         eax,dword ptr [ebp-8]
 005427FB    call        TWideStrings.GetQuoteChar
 00542800    mov         edx,eax
 00542802    lea         ecx,[ebp-4]
 00542805    mov         eax,ebx
 00542807    call        WideExtractQuotedStr
>0054280C    jmp         00542862
 0054280E    mov         esi,dword ptr [ebx]
>00542810    jmp         0054281C
 00542812    mov         eax,dword ptr [ebx]
 00542814    push        eax
 00542815    call        user32.CharNextW
 0054281A    mov         dword ptr [ebx],eax
 0054281C    mov         eax,dword ptr [ebp-8]
 0054281F    cmp         byte ptr [eax+10],0
>00542823    jne         0054282D
 00542825    mov         eax,dword ptr [ebx]
 00542827    cmp         word ptr [eax],20
>0054282B    ja          0054283E
 0054282D    mov         eax,dword ptr [ebp-8]
 00542830    cmp         byte ptr [eax+10],0
>00542834    je          0054284D
 00542836    mov         eax,dword ptr [ebx]
 00542838    cmp         word ptr [eax],0
>0054283C    je          0054284D
 0054283E    mov         eax,dword ptr [ebp-8]
 00542841    call        TWideStrings.GetDelimiter
 00542846    mov         edx,dword ptr [ebx]
 00542848    cmp         ax,word ptr [edx]
>0054284B    jne         00542812
 0054284D    mov         ecx,dword ptr [ebx]
 0054284F    sub         ecx,esi
 00542851    sar         ecx,1
>00542853    jns         00542858
 00542855    adc         ecx,0
 00542858    lea         eax,[ebp-4]
 0054285B    mov         edx,esi
 0054285D    call        @WStrFromPWCharLen
 00542862    mov         edx,dword ptr [ebp-4]
 00542865    mov         eax,dword ptr [ebp-8]
 00542868    mov         ecx,dword ptr [eax]
 0054286A    call        dword ptr [ecx+38]
 0054286D    mov         eax,dword ptr [ebp-8]
 00542870    cmp         byte ptr [eax+10],0
>00542874    jne         00542895
>00542876    jmp         00542882
 00542878    mov         eax,dword ptr [ebx]
 0054287A    push        eax
 0054287B    call        user32.CharNextW
 00542880    mov         dword ptr [ebx],eax
 00542882    mov         edx,542934
 00542887    mov         eax,dword ptr [ebx]
 00542889    movzx       eax,word ptr [eax]
 0054288C    call        InOpSet
 00542891    test        al,al
>00542893    jne         00542878
 00542895    mov         eax,dword ptr [ebp-8]
 00542898    call        TWideStrings.GetDelimiter
 0054289D    mov         edx,dword ptr [ebx]
 0054289F    cmp         ax,word ptr [edx]
>005428A2    jne         005428E2
 005428A4    mov         esi,dword ptr [ebx]
 005428A6    push        esi
 005428A7    call        user32.CharNextW
 005428AC    cmp         word ptr [eax],0
>005428B0    jne         005428BC
 005428B2    xor         edx,edx
 005428B4    mov         eax,dword ptr [ebp-8]
 005428B7    mov         ecx,dword ptr [eax]
 005428B9    call        dword ptr [ecx+38]
 005428BC    mov         eax,dword ptr [ebx]
 005428BE    push        eax
 005428BF    call        user32.CharNextW
 005428C4    mov         dword ptr [ebx],eax
 005428C6    mov         eax,dword ptr [ebp-8]
 005428C9    cmp         byte ptr [eax+10],0
>005428CD    jne         005428E2
 005428CF    mov         edx,542934
 005428D4    mov         eax,dword ptr [ebx]
 005428D6    movzx       eax,word ptr [eax]
 005428D9    call        InOpSet
 005428DE    test        al,al
>005428E0    jne         005428BC
 005428E2    mov         eax,dword ptr [ebx]
 005428E4    movzx       edi,word ptr [eax]
 005428E7    test        di,di
>005428EA    jne         005427EB
 005428F0    xor         eax,eax
 005428F2    pop         edx
 005428F3    pop         ecx
 005428F4    pop         ecx
 005428F5    mov         dword ptr fs:[eax],edx
 005428F8    push        54290D
 005428FD    mov         eax,dword ptr [ebp-8]
 00542900    call        TWideStrings.EndUpdate
 00542905    ret
>00542906    jmp         @HandleFinally
>0054290B    jmp         005428FD
 0054290D    xor         eax,eax
 0054290F    pop         edx
 00542910    pop         ecx
 00542911    pop         ecx
 00542912    mov         dword ptr fs:[eax],edx
 00542915    push        54292A
 0054291A    lea         eax,[ebp-4]
 0054291D    call        @WStrClr
 00542922    ret
>00542923    jmp         @HandleFinally
>00542928    jmp         0054291A
 0054292A    pop         edi
 0054292B    pop         esi
 0054292C    pop         ebx
 0054292D    mov         esp,ebp
 0054292F    pop         ebp
 00542930    ret
*}
end;

//00542954
function TWideStrings.GetDelimiter:WideChar;
begin
{*
 00542954    push        ebx
 00542955    mov         ebx,eax
 00542957    test        byte ptr [ebx+4],1
>0054295B    jne         00542968
 0054295D    mov         dx,2C
 00542961    mov         eax,ebx
 00542963    call        TWideStrings.SetDelimiter
 00542968    movzx       eax,word ptr [ebx+6]
 0054296C    pop         ebx
 0054296D    ret
*}
end;

//00542970
function TWideStrings.GetLineBreak:WideString;
begin
{*
 00542970    push        ebx
 00542971    push        esi
 00542972    mov         esi,edx
 00542974    mov         ebx,eax
 00542976    test        byte ptr [ebx+4],8
>0054297A    jne         00542988
 0054297C    mov         edx,54299C
 00542981    mov         eax,ebx
 00542983    call        TWideStrings.SetLineBreak
 00542988    mov         eax,esi
 0054298A    mov         edx,dword ptr [ebx+8]
 0054298D    call        @WStrAsg
 00542992    pop         esi
 00542993    pop         ebx
 00542994    ret
*}
end;

//005429A4
function TWideStrings.GetQuoteChar:WideChar;
begin
{*
 005429A4    push        ebx
 005429A5    mov         ebx,eax
 005429A7    test        byte ptr [ebx+4],2
>005429AB    jne         005429B8
 005429AD    mov         dx,22
 005429B1    mov         eax,ebx
 005429B3    call        TWideStrings.SetQuoteChar
 005429B8    movzx       eax,word ptr [ebx+0C]
 005429BC    pop         ebx
 005429BD    ret
*}
end;

//005429C0
function TWideStrings.GetStrictDelimiter:Boolean;
begin
{*
 005429C0    push        ebx
 005429C1    mov         ebx,eax
 005429C3    test        byte ptr [ebx+4],10
>005429C7    jne         005429D2
 005429C9    xor         edx,edx
 005429CB    mov         eax,ebx
 005429CD    call        TWideStrings.SetStrictDelimiter
 005429D2    movzx       eax,byte ptr [ebx+10]
 005429D6    pop         ebx
 005429D7    ret
*}
end;

//005429D8
procedure TWideStrings.SetDelimiter(const Value:WideChar);
begin
{*
 005429D8    push        ebx
 005429D9    push        esi
 005429DA    mov         esi,edx
 005429DC    mov         ebx,eax
 005429DE    cmp         si,word ptr [ebx+6]
>005429E2    jne         005429EA
 005429E4    test        byte ptr [ebx+4],1
>005429E8    jne         005429F2
 005429EA    or          byte ptr [ebx+4],1
 005429EE    mov         word ptr [ebx+6],si
 005429F2    pop         esi
 005429F3    pop         ebx
 005429F4    ret
*}
end;

//005429F8
procedure TWideStrings.SetLineBreak(const Value:WideString);
begin
{*
 005429F8    push        ebx
 005429F9    push        esi
 005429FA    mov         esi,edx
 005429FC    mov         ebx,eax
 005429FE    mov         eax,dword ptr [ebx+8]
 00542A01    mov         edx,esi
 00542A03    call        @WStrEqual
>00542A08    jne         00542A10
 00542A0A    test        byte ptr [ebx+4],8
>00542A0E    jne         00542A1E
 00542A10    or          byte ptr [ebx+4],8
 00542A14    lea         eax,[ebx+8]
 00542A17    mov         edx,esi
 00542A19    call        @WStrAsg
 00542A1E    pop         esi
 00542A1F    pop         ebx
 00542A20    ret
*}
end;

//00542A24
procedure TWideStrings.SetQuoteChar(const Value:WideChar);
begin
{*
 00542A24    push        ebx
 00542A25    push        esi
 00542A26    mov         esi,edx
 00542A28    mov         ebx,eax
 00542A2A    cmp         si,word ptr [ebx+0C]
>00542A2E    jne         00542A36
 00542A30    test        byte ptr [ebx+4],2
>00542A34    jne         00542A3E
 00542A36    or          byte ptr [ebx+4],2
 00542A3A    mov         word ptr [ebx+0C],si
 00542A3E    pop         esi
 00542A3F    pop         ebx
 00542A40    ret
*}
end;

//00542A44
procedure TWideStrings.SetStrictDelimiter(const Value:Boolean);
begin
{*
 00542A44    push        ebx
 00542A45    push        esi
 00542A46    mov         ebx,edx
 00542A48    mov         esi,eax
 00542A4A    cmp         bl,byte ptr [esi+10]
>00542A4D    jne         00542A55
 00542A4F    test        byte ptr [esi+4],10
>00542A53    jne         00542A5C
 00542A55    or          byte ptr [esi+4],10
 00542A59    mov         byte ptr [esi+10],bl
 00542A5C    pop         esi
 00542A5D    pop         ebx
 00542A5E    ret
*}
end;

//00542A60
function TWideStrings.CompareStrings(const S1:WideString; const S2:WideString):Integer;
begin
{*
 00542A60    mov         eax,edx
 00542A62    mov         edx,ecx
 00542A64    call        WideCompareText
 00542A69    ret
*}
end;

//00542A6C
function TWideStrings.GetNameValueSeparator:WideChar;
begin
{*
 00542A6C    push        ebx
 00542A6D    mov         ebx,eax
 00542A6F    test        byte ptr [ebx+4],4
>00542A73    jne         00542A80
 00542A75    mov         dx,3D
 00542A79    mov         eax,ebx
 00542A7B    call        TWideStrings.SetNameValueSeparator
 00542A80    movzx       eax,word ptr [ebx+0E]
 00542A84    pop         ebx
 00542A85    ret
*}
end;

//00542A88
procedure TWideStrings.SetNameValueSeparator(const Value:WideChar);
begin
{*
 00542A88    push        ebx
 00542A89    push        esi
 00542A8A    mov         esi,edx
 00542A8C    mov         ebx,eax
 00542A8E    cmp         si,word ptr [ebx+0E]
>00542A92    jne         00542A9A
 00542A94    test        byte ptr [ebx+4],4
>00542A98    jne         00542AA2
 00542A9A    or          byte ptr [ebx+4],4
 00542A9E    mov         word ptr [ebx+0E],si
 00542AA2    pop         esi
 00542AA3    pop         ebx
 00542AA4    ret
*}
end;

//00542AA8
procedure TWideStrings.LoadFromFile(FileName:WideString; Encoding:TEncoding);
begin
{*
 00542AA8    push        ebp
 00542AA9    mov         ebp,esp
 00542AAB    add         esp,0FFFFFFF8
 00542AAE    push        ebx
 00542AAF    push        esi
 00542AB0    push        edi
 00542AB1    xor         ebx,ebx
 00542AB3    mov         dword ptr [ebp-8],ebx
 00542AB6    mov         edi,ecx
 00542AB8    mov         esi,edx
 00542ABA    mov         ebx,eax
 00542ABC    xor         eax,eax
 00542ABE    push        ebp
 00542ABF    push        542B35
 00542AC4    push        dword ptr fs:[eax]
 00542AC7    mov         dword ptr fs:[eax],esp
 00542ACA    push        20
 00542ACC    lea         eax,[ebp-8]
 00542ACF    mov         edx,esi
 00542AD1    call        @UStrFromWStr
 00542AD6    mov         ecx,dword ptr [ebp-8]
 00542AD9    mov         dl,1
 00542ADB    mov         eax,[0043D6D0];TFileStream
 00542AE0    call        TFileStream.Create
 00542AE5    mov         dword ptr [ebp-4],eax
 00542AE8    xor         eax,eax
 00542AEA    push        ebp
 00542AEB    push        542B18
 00542AF0    push        dword ptr fs:[eax]
 00542AF3    mov         dword ptr fs:[eax],esp
 00542AF6    mov         ecx,edi
 00542AF8    mov         edx,dword ptr [ebp-4]
 00542AFB    mov         eax,ebx
 00542AFD    mov         ebx,dword ptr [eax]
 00542AFF    call        dword ptr [ebx+78]
 00542B02    xor         eax,eax
 00542B04    pop         edx
 00542B05    pop         ecx
 00542B06    pop         ecx
 00542B07    mov         dword ptr fs:[eax],edx
 00542B0A    push        542B1F
 00542B0F    mov         eax,dword ptr [ebp-4]
 00542B12    call        TObject.Free
 00542B17    ret
>00542B18    jmp         @HandleFinally
>00542B1D    jmp         00542B0F
 00542B1F    xor         eax,eax
 00542B21    pop         edx
 00542B22    pop         ecx
 00542B23    pop         ecx
 00542B24    mov         dword ptr fs:[eax],edx
 00542B27    push        542B3C
 00542B2C    lea         eax,[ebp-8]
 00542B2F    call        @UStrClr
 00542B34    ret
>00542B35    jmp         @HandleFinally
>00542B3A    jmp         00542B2C
 00542B3C    pop         edi
 00542B3D    pop         esi
 00542B3E    pop         ebx
 00542B3F    pop         ecx
 00542B40    pop         ecx
 00542B41    pop         ebp
 00542B42    ret
*}
end;

//00542B44
procedure TWideStrings.LoadFromStream(Stream:TStream; Encoding:TEncoding);
begin
{*
 00542B44    push        ebp
 00542B45    mov         ebp,esp
 00542B47    push        0
 00542B49    push        0
 00542B4B    push        0
 00542B4D    push        0
 00542B4F    push        0
 00542B51    push        ebx
 00542B52    push        esi
 00542B53    mov         dword ptr [ebp-0C],ecx
 00542B56    mov         esi,edx
 00542B58    mov         dword ptr [ebp-8],eax
 00542B5B    xor         eax,eax
 00542B5D    push        ebp
 00542B5E    push        542C47
 00542B63    push        dword ptr fs:[eax]
 00542B66    mov         dword ptr fs:[eax],esp
 00542B69    mov         eax,dword ptr [ebp-8]
 00542B6C    call        TWideStrings.BeginUpdate
 00542B71    xor         eax,eax
 00542B73    push        ebp
 00542B74    push        542C14
 00542B79    push        dword ptr fs:[eax]
 00542B7C    mov         dword ptr fs:[eax],esp
 00542B7F    mov         eax,esi
 00542B81    mov         edx,dword ptr [eax]
 00542B83    call        dword ptr [edx]
 00542B85    mov         ebx,eax
 00542B87    mov         eax,esi
 00542B89    call        TStream.GetPosition
 00542B8E    sub         ebx,eax
 00542B90    push        ebx
 00542B91    lea         eax,[ebp-4]
 00542B94    mov         ecx,1
 00542B99    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00542B9F    call        @DynArraySetLength
 00542BA4    add         esp,4
 00542BA7    mov         edx,dword ptr [ebp-4]
 00542BAA    mov         ecx,ebx
 00542BAC    mov         eax,esi
 00542BAE    mov         ebx,dword ptr [eax]
 00542BB0    call        dword ptr [ebx+0C]
 00542BB3    lea         edx,[ebp-0C]
 00542BB6    mov         eax,dword ptr [ebp-4]
 00542BB9    call        TEncoding.GetBufferEncoding
 00542BBE    mov         ebx,eax
 00542BC0    test        ebx,ebx
>00542BC2    jne         00542BCC
 00542BC4    call        TEncoding.GetUnicode
 00542BC9    mov         dword ptr [ebp-0C],eax
 00542BCC    mov         eax,dword ptr [ebp-4]
 00542BCF    call        @DynArrayLength
 00542BD4    sub         eax,ebx
 00542BD6    push        eax
 00542BD7    lea         eax,[ebp-14]
 00542BDA    push        eax
 00542BDB    mov         ecx,ebx
 00542BDD    mov         edx,dword ptr [ebp-4]
 00542BE0    mov         eax,dword ptr [ebp-0C]
 00542BE3    call        TEncoding.GetString
 00542BE8    mov         edx,dword ptr [ebp-14]
 00542BEB    lea         eax,[ebp-10]
 00542BEE    call        @WStrFromUStr
 00542BF3    mov         edx,dword ptr [ebp-10]
 00542BF6    mov         eax,dword ptr [ebp-8]
 00542BF9    mov         ecx,dword ptr [eax]
 00542BFB    call        dword ptr [ecx+2C]
 00542BFE    xor         eax,eax
 00542C00    pop         edx
 00542C01    pop         ecx
 00542C02    pop         ecx
 00542C03    mov         dword ptr fs:[eax],edx
 00542C06    push        542C1B
 00542C0B    mov         eax,dword ptr [ebp-8]
 00542C0E    call        TWideStrings.EndUpdate
 00542C13    ret
>00542C14    jmp         @HandleFinally
>00542C19    jmp         00542C0B
 00542C1B    xor         eax,eax
 00542C1D    pop         edx
 00542C1E    pop         ecx
 00542C1F    pop         ecx
 00542C20    mov         dword ptr fs:[eax],edx
 00542C23    push        542C4E
 00542C28    lea         eax,[ebp-14]
 00542C2B    call        @UStrClr
 00542C30    lea         eax,[ebp-10]
 00542C33    call        @WStrClr
 00542C38    lea         eax,[ebp-4]
 00542C3B    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00542C41    call        @DynArrayClear
 00542C46    ret
>00542C47    jmp         @HandleFinally
>00542C4C    jmp         00542C28
 00542C4E    pop         esi
 00542C4F    pop         ebx
 00542C50    mov         esp,ebp
 00542C52    pop         ebp
 00542C53    ret
*}
end;

//005431D8
constructor TJvTranslateString.Create(AOwner:TComponent);
begin
{*
 005431D8    push        ebx
 005431D9    push        esi
 005431DA    test        dl,dl
>005431DC    je          005431E6
 005431DE    add         esp,0FFFFFFF0
 005431E1    call        @ClassCreate
 005431E6    mov         ebx,edx
 005431E8    mov         esi,eax
 005431EA    xor         edx,edx
 005431EC    mov         eax,esi
 005431EE    call        TComponent.Create
 005431F3    mov         byte ptr [esi+38],0;TJvTranslateString.FAppNameHandled:Boolean
 005431F7    mov         byte ptr [esi+40],0;TJvTranslateString.FCompanyNameHandled:Boolean
 005431FB    lea         eax,[esi+60];TJvTranslateString.FLeftDelimiter:string
 005431FE    mov         edx,54326C;'%'
 00543203    call        @UStrAsg
 00543208    lea         eax,[esi+64];TJvTranslateString.FRightDelimiter:string
 0054320B    mov         edx,54326C;'%'
 00543210    call        @UStrAsg
 00543215    lea         eax,[esi+58];TJvTranslateString.FDateFormat:string
 00543218    mov         edx,54327C;'dd_mm_yyyy'
 0054321D    call        @UStrAsg
 00543222    lea         eax,[esi+68];TJvTranslateString.FTimeFormat:string
 00543225    mov         edx,5432A0;'hh_nn_ss'
 0054322A    call        @UStrAsg
 0054322F    lea         eax,[esi+5C];TJvTranslateString.FDateTimeFormat:string
 00543232    mov         edx,5432C0;'dd_mm_yyyy hh_nn_ss'
 00543237    call        @UStrAsg
 0054323C    mov         byte ptr [esi+50],0;TJvTranslateString.FProductVersionHandled:Boolean
 00543240    mov         byte ptr [esi+48],0;TJvTranslateString.FFileVersionHandled:Boolean
 00543244    mov         eax,esi
 00543246    test        bl,bl
>00543248    je          00543259
 0054324A    call        @AfterConstruction
 0054324F    pop         dword ptr fs:[0]
 00543256    add         esp,0C
 00543259    mov         eax,esi
 0054325B    pop         esi
 0054325C    pop         ebx
 0054325D    ret
*}
end;

//005432E8
{*procedure sub_005432E8(?:?; ?:?; ?:?);
begin
 005432E8    push        ebp
 005432E9    mov         ebp,esp
 005432EB    push        ebx
 005432EC    push        esi
 005432ED    mov         esi,edx
 005432EF    mov         ebx,eax
 005432F1    mov         eax,dword ptr [ebp+8]
 005432F4    mov         eax,dword ptr [eax-4]
 005432F7    cmp         dword ptr [eax+4],0
>005432FB    je          0054332B
 005432FD    mov         eax,ebx
 005432FF    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 00543305    call        @IsClass
 0054330A    test        al,al
>0054330C    je          0054331A
 0054330E    mov         eax,esi
 00543310    mov         edx,dword ptr [ebx+8]
 00543313    call        @UStrAsg
>00543318    jmp         00543332
 0054331A    mov         eax,dword ptr [ebp+8]
 0054331D    push        eax
 0054331E    mov         edx,esi
 00543320    mov         eax,dword ptr [ebx+4]
 00543323    call        005432E8
 00543328    pop         ecx
>00543329    jmp         00543332
 0054332B    mov         eax,esi
 0054332D    call        @UStrClr
 00543332    pop         esi
 00543333    pop         ebx
 00543334    pop         ebp
 00543335    ret
end;*}

//00543338
{*procedure sub_00543338(?:?; ?:?);
begin
 00543338    push        ebp
 00543339    mov         ebp,esp
 0054333B    add         esp,0FFFFFFF8
 0054333E    push        ebx
 0054333F    xor         ecx,ecx
 00543341    mov         dword ptr [ebp-8],ecx
 00543344    mov         ebx,edx
 00543346    mov         dword ptr [ebp-4],eax
 00543349    xor         eax,eax
 0054334B    push        ebp
 0054334C    push        543387
 00543351    push        dword ptr fs:[eax]
 00543354    mov         dword ptr fs:[eax],esp
 00543357    push        ebp
 00543358    lea         edx,[ebp-8]
 0054335B    mov         eax,dword ptr [ebp-4]
 0054335E    mov         eax,dword ptr [eax+4]
 00543361    call        005432E8
 00543366    pop         ecx
 00543367    mov         edx,dword ptr [ebp-8]
 0054336A    mov         eax,ebx
 0054336C    call        @UStrAsg
 00543371    xor         eax,eax
 00543373    pop         edx
 00543374    pop         ecx
 00543375    pop         ecx
 00543376    mov         dword ptr fs:[eax],edx
 00543379    push        54338E
 0054337E    lea         eax,[ebp-8]
 00543381    call        @UStrClr
 00543386    ret
>00543387    jmp         @HandleFinally
>0054338C    jmp         0054337E
 0054338E    pop         ebx
 0054338F    pop         ecx
 00543390    pop         ecx
 00543391    pop         ebp
 00543392    ret
end;*}

//00543394
{*procedure sub_00543394(?:?; ?:?; ?:?);
begin
 00543394    push        ebp
 00543395    mov         ebp,esp
 00543397    push        ebx
 00543398    push        esi
 00543399    mov         esi,edx
 0054339B    mov         ebx,eax
 0054339D    mov         eax,dword ptr [ebp+8]
 005433A0    mov         eax,dword ptr [eax-4]
 005433A3    cmp         dword ptr [eax+4],0
>005433A7    je          005433D6
 005433A9    mov         eax,ebx
 005433AB    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 005433B1    call        @IsClass
 005433B6    test        al,al
>005433B8    je          005433C5
 005433BA    mov         edx,esi
 005433BC    mov         eax,ebx
 005433BE    call        TControl.GetText
>005433C3    jmp         005433DD
 005433C5    mov         eax,dword ptr [ebp+8]
 005433C8    push        eax
 005433C9    mov         edx,esi
 005433CB    mov         eax,dword ptr [ebx+4]
 005433CE    call        00543394
 005433D3    pop         ecx
>005433D4    jmp         005433DD
 005433D6    mov         eax,esi
 005433D8    call        @UStrClr
 005433DD    pop         esi
 005433DE    pop         ebx
 005433DF    pop         ebp
 005433E0    ret
end;*}

//005433E4
{*procedure sub_005433E4(?:?; ?:?);
begin
 005433E4    push        ebp
 005433E5    mov         ebp,esp
 005433E7    add         esp,0FFFFFFF8
 005433EA    push        ebx
 005433EB    xor         ecx,ecx
 005433ED    mov         dword ptr [ebp-8],ecx
 005433F0    mov         ebx,edx
 005433F2    mov         dword ptr [ebp-4],eax
 005433F5    xor         eax,eax
 005433F7    push        ebp
 005433F8    push        543433
 005433FD    push        dword ptr fs:[eax]
 00543400    mov         dword ptr fs:[eax],esp
 00543403    push        ebp
 00543404    lea         edx,[ebp-8]
 00543407    mov         eax,dword ptr [ebp-4]
 0054340A    mov         eax,dword ptr [eax+4]
 0054340D    call        00543394
 00543412    pop         ecx
 00543413    mov         edx,dword ptr [ebp-8]
 00543416    mov         eax,ebx
 00543418    call        @UStrAsg
 0054341D    xor         eax,eax
 0054341F    pop         edx
 00543420    pop         ecx
 00543421    pop         ecx
 00543422    mov         dword ptr fs:[eax],edx
 00543425    push        54343A
 0054342A    lea         eax,[ebp-8]
 0054342D    call        @UStrClr
 00543432    ret
>00543433    jmp         @HandleFinally
>00543438    jmp         0054342A
 0054343A    pop         ebx
 0054343B    pop         ecx
 0054343C    pop         ecx
 0054343D    pop         ebp
 0054343E    ret
end;*}

//00543440
{*procedure sub_00543440(?:?; ?:?);
begin
 00543440    push        ebp
 00543441    mov         ebp,esp
 00543443    add         esp,0FFFFFFD8
 00543446    push        ebx
 00543447    push        esi
 00543448    push        edi
 00543449    xor         ecx,ecx
 0054344B    mov         dword ptr [ebp-14],ecx
 0054344E    mov         dword ptr [ebp-18],ecx
 00543451    mov         dword ptr [ebp-10],ecx
 00543454    mov         dword ptr [ebp-8],edx
 00543457    mov         dword ptr [ebp-4],eax
 0054345A    xor         eax,eax
 0054345C    push        ebp
 0054345D    push        5435C4
 00543462    push        dword ptr fs:[eax]
 00543465    mov         dword ptr fs:[eax],esp
 00543468    mov         eax,dword ptr [ebp-4]
 0054346B    cmp         byte ptr [eax+38],0
>0054346F    je          00543484
 00543471    mov         eax,dword ptr [ebp-8]
 00543474    mov         edx,dword ptr [ebp-4]
 00543477    mov         edx,dword ptr [edx+3C]
 0054347A    call        @UStrAsg
>0054347F    jmp         005435A9
 00543484    xor         eax,eax
 00543486    push        ebp
 00543487    push        543512
 0054348C    push        dword ptr fs:[eax]
 0054348F    mov         dword ptr fs:[eax],esp
 00543492    lea         edx,[ebp-10]
 00543495    mov         eax,[0078D590];^Application:TApplication
 0054349A    mov         eax,dword ptr [eax]
 0054349C    call        TApplication.GetExeName
 005434A1    mov         ecx,dword ptr [ebp-10]
 005434A4    mov         dl,1
 005434A6    mov         eax,[00539E7C];TJclFileVersionInfo
 005434AB    call        TJclFileVersionInfo.Create;TJclFileVersionInfo.Create
 005434B0    mov         dword ptr [ebp-0C],eax
 005434B3    xor         eax,eax
 005434B5    push        ebp
 005434B6    push        5434FE
 005434BB    push        dword ptr fs:[eax]
 005434BE    mov         dword ptr fs:[eax],esp
 005434C1    mov         ecx,dword ptr [ebp-8]
 005434C4    mov         edx,9
 005434C9    mov         eax,dword ptr [ebp-0C]
 005434CC    call        0053C96C
 005434D1    mov         eax,dword ptr [ebp-4]
 005434D4    add         eax,3C
 005434D7    mov         edx,dword ptr [ebp-8]
 005434DA    mov         edx,dword ptr [edx]
 005434DC    call        @UStrAsg
 005434E1    mov         eax,dword ptr [ebp-4]
 005434E4    mov         byte ptr [eax+38],1
 005434E8    xor         eax,eax
 005434EA    pop         edx
 005434EB    pop         ecx
 005434EC    pop         ecx
 005434ED    mov         dword ptr fs:[eax],edx
 005434F0    push        543505
 005434F5    mov         eax,dword ptr [ebp-0C]
 005434F8    call        TObject.Free
 005434FD    ret
>005434FE    jmp         @HandleFinally
>00543503    jmp         005434F5
 00543505    xor         eax,eax
 00543507    pop         edx
 00543508    pop         ecx
 00543509    pop         ecx
 0054350A    mov         dword ptr fs:[eax],edx
>0054350D    jmp         005435A9
>00543512    jmp         @HandleOnException
 00543517    dd          2
 0054351B    dd          00539D44;EJclFileVersionInfoError
 0054351F    dd          0054352B
 00543523    dd          00000000
 00543527    dd          0054359F
 0054352B    push        0
 0054352D    lea         eax,[ebp-14]
 00543530    push        eax
 00543531    lea         edx,[ebp-18]
 00543534    mov         eax,[0078D74C];^SResString318:TResStringRec
 00543539    call        LoadResString
 0054353E    mov         eax,dword ptr [ebp-18]
 00543541    push        eax
 00543542    mov         eax,5435E0;'APPL_NAME'
 00543547    mov         dword ptr [ebp-28],eax
 0054354A    mov         byte ptr [ebp-24],11
 0054354E    mov         eax,543600;'MyJVCLApplication'
 00543553    mov         dword ptr [ebp-20],eax
 00543556    mov         byte ptr [ebp-1C],11
 0054355A    lea         edx,[ebp-28]
 0054355D    mov         ecx,1
 00543562    pop         eax
 00543563    call        Format
 00543568    mov         eax,dword ptr [ebp-14]
 0054356B    movzx       ecx,word ptr ds:[543624];0x4 gvar_00543624
 00543572    mov         dl,2
 00543574    call        MessageDlg
 00543579    mov         eax,dword ptr [ebp-8]
 0054357C    mov         edx,543600;'MyJVCLApplication'
 00543581    call        @UStrAsg
 00543586    mov         eax,dword ptr [ebp-4]
 00543589    add         eax,3C
 0054358C    mov         edx,dword ptr [ebp-8]
 0054358F    mov         edx,dword ptr [edx]
 00543591    call        @UStrAsg
 00543596    mov         eax,dword ptr [ebp-4]
 00543599    mov         byte ptr [eax+38],1
>0054359D    jmp         005435A4
 0054359F    call        @RaiseAgain
 005435A4    call        @DoneExcept
 005435A9    xor         eax,eax
 005435AB    pop         edx
 005435AC    pop         ecx
 005435AD    pop         ecx
 005435AE    mov         dword ptr fs:[eax],edx
 005435B1    push        5435CB
 005435B6    lea         eax,[ebp-18]
 005435B9    mov         edx,3
 005435BE    call        @UStrArrayClr
 005435C3    ret
>005435C4    jmp         @HandleFinally
>005435C9    jmp         005435B6
 005435CB    pop         edi
 005435CC    pop         esi
 005435CD    pop         ebx
 005435CE    mov         esp,ebp
 005435D0    pop         ebp
 005435D1    ret
end;*}

//00543628
{*procedure sub_00543628(?:?; ?:?);
begin
 00543628    push        ebp
 00543629    mov         ebp,esp
 0054362B    add         esp,0FFFFFFD8
 0054362E    push        ebx
 0054362F    push        esi
 00543630    push        edi
 00543631    xor         ecx,ecx
 00543633    mov         dword ptr [ebp-14],ecx
 00543636    mov         dword ptr [ebp-18],ecx
 00543639    mov         dword ptr [ebp-10],ecx
 0054363C    mov         dword ptr [ebp-8],edx
 0054363F    mov         dword ptr [ebp-4],eax
 00543642    xor         eax,eax
 00543644    push        ebp
 00543645    push        5437AC
 0054364A    push        dword ptr fs:[eax]
 0054364D    mov         dword ptr fs:[eax],esp
 00543650    mov         eax,dword ptr [ebp-4]
 00543653    cmp         byte ptr [eax+48],0
>00543657    je          0054366C
 00543659    mov         eax,dword ptr [ebp-8]
 0054365C    mov         edx,dword ptr [ebp-4]
 0054365F    mov         edx,dword ptr [edx+4C]
 00543662    call        @UStrAsg
>00543667    jmp         00543791
 0054366C    xor         eax,eax
 0054366E    push        ebp
 0054366F    push        5436FA
 00543674    push        dword ptr fs:[eax]
 00543677    mov         dword ptr fs:[eax],esp
 0054367A    lea         edx,[ebp-10]
 0054367D    mov         eax,[0078D590];^Application:TApplication
 00543682    mov         eax,dword ptr [eax]
 00543684    call        TApplication.GetExeName
 00543689    mov         ecx,dword ptr [ebp-10]
 0054368C    mov         dl,1
 0054368E    mov         eax,[00539E7C];TJclFileVersionInfo
 00543693    call        TJclFileVersionInfo.Create;TJclFileVersionInfo.Create
 00543698    mov         dword ptr [ebp-0C],eax
 0054369B    xor         eax,eax
 0054369D    push        ebp
 0054369E    push        5436E6
 005436A3    push        dword ptr fs:[eax]
 005436A6    mov         dword ptr fs:[eax],esp
 005436A9    mov         ecx,dword ptr [ebp-8]
 005436AC    mov         edx,4
 005436B1    mov         eax,dword ptr [ebp-0C]
 005436B4    call        0053C96C
 005436B9    mov         eax,dword ptr [ebp-4]
 005436BC    add         eax,4C
 005436BF    mov         edx,dword ptr [ebp-8]
 005436C2    mov         edx,dword ptr [edx]
 005436C4    call        @UStrAsg
 005436C9    mov         eax,dword ptr [ebp-4]
 005436CC    mov         byte ptr [eax+48],1
 005436D0    xor         eax,eax
 005436D2    pop         edx
 005436D3    pop         ecx
 005436D4    pop         ecx
 005436D5    mov         dword ptr fs:[eax],edx
 005436D8    push        5436ED
 005436DD    mov         eax,dword ptr [ebp-0C]
 005436E0    call        TObject.Free
 005436E5    ret
>005436E6    jmp         @HandleFinally
>005436EB    jmp         005436DD
 005436ED    xor         eax,eax
 005436EF    pop         edx
 005436F0    pop         ecx
 005436F1    pop         ecx
 005436F2    mov         dword ptr fs:[eax],edx
>005436F5    jmp         00543791
>005436FA    jmp         @HandleOnException
 005436FF    dd          2
 00543703    dd          00539D44;EJclFileVersionInfoError
 00543707    dd          00543713
 0054370B    dd          00000000
 0054370F    dd          00543787
 00543713    push        0
 00543715    lea         eax,[ebp-14]
 00543718    push        eax
 00543719    lea         edx,[ebp-18]
 0054371C    mov         eax,[0078D74C];^SResString318:TResStringRec
 00543721    call        LoadResString
 00543726    mov         eax,dword ptr [ebp-18]
 00543729    push        eax
 0054372A    mov         eax,5437C8;'FILEVERSION'
 0054372F    mov         dword ptr [ebp-28],eax
 00543732    mov         byte ptr [ebp-24],11
 00543736    mov         eax,5437EC;'0.0.0.0'
 0054373B    mov         dword ptr [ebp-20],eax
 0054373E    mov         byte ptr [ebp-1C],11
 00543742    lea         edx,[ebp-28]
 00543745    mov         ecx,1
 0054374A    pop         eax
 0054374B    call        Format
 00543750    mov         eax,dword ptr [ebp-14]
 00543753    movzx       ecx,word ptr ds:[5437FC];0x4 gvar_005437FC
 0054375A    mov         dl,2
 0054375C    call        MessageDlg
 00543761    mov         eax,dword ptr [ebp-8]
 00543764    mov         edx,5437EC;'0.0.0.0'
 00543769    call        @UStrAsg
 0054376E    mov         eax,dword ptr [ebp-4]
 00543771    add         eax,4C
 00543774    mov         edx,dword ptr [ebp-8]
 00543777    mov         edx,dword ptr [edx]
 00543779    call        @UStrAsg
 0054377E    mov         eax,dword ptr [ebp-4]
 00543781    mov         byte ptr [eax+48],1
>00543785    jmp         0054378C
 00543787    call        @RaiseAgain
 0054378C    call        @DoneExcept
 00543791    xor         eax,eax
 00543793    pop         edx
 00543794    pop         ecx
 00543795    pop         ecx
 00543796    mov         dword ptr fs:[eax],edx
 00543799    push        5437B3
 0054379E    lea         eax,[ebp-18]
 005437A1    mov         edx,3
 005437A6    call        @UStrArrayClr
 005437AB    ret
>005437AC    jmp         @HandleFinally
>005437B1    jmp         0054379E
 005437B3    pop         edi
 005437B4    pop         esi
 005437B5    pop         ebx
 005437B6    mov         esp,ebp
 005437B8    pop         ebp
 005437B9    ret
end;*}

//00543800
{*procedure sub_00543800(?:?; ?:?);
begin
 00543800    push        ebp
 00543801    mov         ebp,esp
 00543803    add         esp,0FFFFFFD8
 00543806    push        ebx
 00543807    push        esi
 00543808    push        edi
 00543809    xor         ecx,ecx
 0054380B    mov         dword ptr [ebp-14],ecx
 0054380E    mov         dword ptr [ebp-18],ecx
 00543811    mov         dword ptr [ebp-10],ecx
 00543814    mov         dword ptr [ebp-8],edx
 00543817    mov         dword ptr [ebp-4],eax
 0054381A    xor         eax,eax
 0054381C    push        ebp
 0054381D    push        543984
 00543822    push        dword ptr fs:[eax]
 00543825    mov         dword ptr fs:[eax],esp
 00543828    mov         eax,dword ptr [ebp-4]
 0054382B    cmp         byte ptr [eax+50],0
>0054382F    je          00543844
 00543831    mov         eax,dword ptr [ebp-8]
 00543834    mov         edx,dword ptr [ebp-4]
 00543837    mov         edx,dword ptr [edx+54]
 0054383A    call        @UStrAsg
>0054383F    jmp         00543969
 00543844    xor         eax,eax
 00543846    push        ebp
 00543847    push        5438D2
 0054384C    push        dword ptr fs:[eax]
 0054384F    mov         dword ptr fs:[eax],esp
 00543852    lea         edx,[ebp-10]
 00543855    mov         eax,[0078D590];^Application:TApplication
 0054385A    mov         eax,dword ptr [eax]
 0054385C    call        TApplication.GetExeName
 00543861    mov         ecx,dword ptr [ebp-10]
 00543864    mov         dl,1
 00543866    mov         eax,[00539E7C];TJclFileVersionInfo
 0054386B    call        TJclFileVersionInfo.Create;TJclFileVersionInfo.Create
 00543870    mov         dword ptr [ebp-0C],eax
 00543873    xor         eax,eax
 00543875    push        ebp
 00543876    push        5438BE
 0054387B    push        dword ptr fs:[eax]
 0054387E    mov         dword ptr fs:[eax],esp
 00543881    mov         ecx,dword ptr [ebp-8]
 00543884    mov         edx,0A
 00543889    mov         eax,dword ptr [ebp-0C]
 0054388C    call        0053C96C
 00543891    mov         eax,dword ptr [ebp-4]
 00543894    add         eax,54
 00543897    mov         edx,dword ptr [ebp-8]
 0054389A    mov         edx,dword ptr [edx]
 0054389C    call        @UStrAsg
 005438A1    mov         eax,dword ptr [ebp-4]
 005438A4    mov         byte ptr [eax+50],1
 005438A8    xor         eax,eax
 005438AA    pop         edx
 005438AB    pop         ecx
 005438AC    pop         ecx
 005438AD    mov         dword ptr fs:[eax],edx
 005438B0    push        5438C5
 005438B5    mov         eax,dword ptr [ebp-0C]
 005438B8    call        TObject.Free
 005438BD    ret
>005438BE    jmp         @HandleFinally
>005438C3    jmp         005438B5
 005438C5    xor         eax,eax
 005438C7    pop         edx
 005438C8    pop         ecx
 005438C9    pop         ecx
 005438CA    mov         dword ptr fs:[eax],edx
>005438CD    jmp         00543969
>005438D2    jmp         @HandleOnException
 005438D7    dd          2
 005438DB    dd          00539D44;EJclFileVersionInfoError
 005438DF    dd          005438EB
 005438E3    dd          00000000
 005438E7    dd          0054395F
 005438EB    push        0
 005438ED    lea         eax,[ebp-14]
 005438F0    push        eax
 005438F1    lea         edx,[ebp-18]
 005438F4    mov         eax,[0078D74C];^SResString318:TResStringRec
 005438F9    call        LoadResString
 005438FE    mov         eax,dword ptr [ebp-18]
 00543901    push        eax
 00543902    mov         eax,5439A0;'PRODUCTVERSION'
 00543907    mov         dword ptr [ebp-28],eax
 0054390A    mov         byte ptr [ebp-24],11
 0054390E    mov         eax,5439CC;'0.0.0.0'
 00543913    mov         dword ptr [ebp-20],eax
 00543916    mov         byte ptr [ebp-1C],11
 0054391A    lea         edx,[ebp-28]
 0054391D    mov         ecx,1
 00543922    pop         eax
 00543923    call        Format
 00543928    mov         eax,dword ptr [ebp-14]
 0054392B    movzx       ecx,word ptr ds:[5439DC];0x4 gvar_005439DC
 00543932    mov         dl,2
 00543934    call        MessageDlg
 00543939    mov         eax,dword ptr [ebp-8]
 0054393C    mov         edx,5439CC;'0.0.0.0'
 00543941    call        @UStrAsg
 00543946    mov         eax,dword ptr [ebp-4]
 00543949    add         eax,54
 0054394C    mov         edx,dword ptr [ebp-8]
 0054394F    mov         edx,dword ptr [edx]
 00543951    call        @UStrAsg
 00543956    mov         eax,dword ptr [ebp-4]
 00543959    mov         byte ptr [eax+50],1
>0054395D    jmp         00543964
 0054395F    call        @RaiseAgain
 00543964    call        @DoneExcept
 00543969    xor         eax,eax
 0054396B    pop         edx
 0054396C    pop         ecx
 0054396D    pop         ecx
 0054396E    mov         dword ptr fs:[eax],edx
 00543971    push        54398B
 00543976    lea         eax,[ebp-18]
 00543979    mov         edx,3
 0054397E    call        @UStrArrayClr
 00543983    ret
>00543984    jmp         @HandleFinally
>00543989    jmp         00543976
 0054398B    pop         edi
 0054398C    pop         esi
 0054398D    pop         ebx
 0054398E    mov         esp,ebp
 00543990    pop         ebp
 00543991    ret
end;*}

//005439E0
{*procedure sub_005439E0(?:?; ?:?);
begin
 005439E0    push        ebp
 005439E1    mov         ebp,esp
 005439E3    add         esp,0FFFFFFD8
 005439E6    push        ebx
 005439E7    push        esi
 005439E8    push        edi
 005439E9    xor         ecx,ecx
 005439EB    mov         dword ptr [ebp-14],ecx
 005439EE    mov         dword ptr [ebp-18],ecx
 005439F1    mov         dword ptr [ebp-10],ecx
 005439F4    mov         dword ptr [ebp-8],edx
 005439F7    mov         dword ptr [ebp-4],eax
 005439FA    xor         eax,eax
 005439FC    push        ebp
 005439FD    push        543B64
 00543A02    push        dword ptr fs:[eax]
 00543A05    mov         dword ptr fs:[eax],esp
 00543A08    mov         eax,dword ptr [ebp-4]
 00543A0B    cmp         byte ptr [eax+40],0
>00543A0F    je          00543A24
 00543A11    mov         eax,dword ptr [ebp-8]
 00543A14    mov         edx,dword ptr [ebp-4]
 00543A17    mov         edx,dword ptr [edx+44]
 00543A1A    call        @UStrAsg
>00543A1F    jmp         00543B49
 00543A24    xor         eax,eax
 00543A26    push        ebp
 00543A27    push        543AB2
 00543A2C    push        dword ptr fs:[eax]
 00543A2F    mov         dword ptr fs:[eax],esp
 00543A32    lea         edx,[ebp-10]
 00543A35    mov         eax,[0078D590];^Application:TApplication
 00543A3A    mov         eax,dword ptr [eax]
 00543A3C    call        TApplication.GetExeName
 00543A41    mov         ecx,dword ptr [ebp-10]
 00543A44    mov         dl,1
 00543A46    mov         eax,[00539E7C];TJclFileVersionInfo
 00543A4B    call        TJclFileVersionInfo.Create;TJclFileVersionInfo.Create
 00543A50    mov         dword ptr [ebp-0C],eax
 00543A53    xor         eax,eax
 00543A55    push        ebp
 00543A56    push        543A9E
 00543A5B    push        dword ptr fs:[eax]
 00543A5E    mov         dword ptr fs:[eax],esp
 00543A61    mov         ecx,dword ptr [ebp-8]
 00543A64    mov         edx,2
 00543A69    mov         eax,dword ptr [ebp-0C]
 00543A6C    call        0053C96C
 00543A71    mov         eax,dword ptr [ebp-4]
 00543A74    add         eax,44
 00543A77    mov         edx,dword ptr [ebp-8]
 00543A7A    mov         edx,dword ptr [edx]
 00543A7C    call        @UStrAsg
 00543A81    mov         eax,dword ptr [ebp-4]
 00543A84    mov         byte ptr [eax+40],1
 00543A88    xor         eax,eax
 00543A8A    pop         edx
 00543A8B    pop         ecx
 00543A8C    pop         ecx
 00543A8D    mov         dword ptr fs:[eax],edx
 00543A90    push        543AA5
 00543A95    mov         eax,dword ptr [ebp-0C]
 00543A98    call        TObject.Free
 00543A9D    ret
>00543A9E    jmp         @HandleFinally
>00543AA3    jmp         00543A95
 00543AA5    xor         eax,eax
 00543AA7    pop         edx
 00543AA8    pop         ecx
 00543AA9    pop         ecx
 00543AAA    mov         dword ptr fs:[eax],edx
>00543AAD    jmp         00543B49
>00543AB2    jmp         @HandleOnException
 00543AB7    dd          2
 00543ABB    dd          00539D44;EJclFileVersionInfoError
 00543ABF    dd          00543ACB
 00543AC3    dd          00000000
 00543AC7    dd          00543B3F
 00543ACB    push        0
 00543ACD    lea         eax,[ebp-14]
 00543AD0    push        eax
 00543AD1    lea         edx,[ebp-18]
 00543AD4    mov         eax,[0078D74C];^SResString318:TResStringRec
 00543AD9    call        LoadResString
 00543ADE    mov         eax,dword ptr [ebp-18]
 00543AE1    push        eax
 00543AE2    mov         eax,543B80;'COMPANY_NAME'
 00543AE7    mov         dword ptr [ebp-28],eax
 00543AEA    mov         byte ptr [ebp-24],11
 00543AEE    mov         eax,543BA8;'MyCompany'
 00543AF3    mov         dword ptr [ebp-20],eax
 00543AF6    mov         byte ptr [ebp-1C],11
 00543AFA    lea         edx,[ebp-28]
 00543AFD    mov         ecx,1
 00543B02    pop         eax
 00543B03    call        Format
 00543B08    mov         eax,dword ptr [ebp-14]
 00543B0B    movzx       ecx,word ptr ds:[543BBC];0x4 gvar_00543BBC
 00543B12    mov         dl,2
 00543B14    call        MessageDlg
 00543B19    mov         eax,dword ptr [ebp-8]
 00543B1C    mov         edx,543BA8;'MyCompany'
 00543B21    call        @UStrAsg
 00543B26    mov         eax,dword ptr [ebp-4]
 00543B29    add         eax,44
 00543B2C    mov         edx,dword ptr [ebp-8]
 00543B2F    mov         edx,dword ptr [edx]
 00543B31    call        @UStrAsg
 00543B36    mov         eax,dword ptr [ebp-4]
 00543B39    mov         byte ptr [eax+40],1
>00543B3D    jmp         00543B44
 00543B3F    call        @RaiseAgain
 00543B44    call        @DoneExcept
 00543B49    xor         eax,eax
 00543B4B    pop         edx
 00543B4C    pop         ecx
 00543B4D    pop         ecx
 00543B4E    mov         dword ptr fs:[eax],edx
 00543B51    push        543B6B
 00543B56    lea         eax,[ebp-18]
 00543B59    mov         edx,3
 00543B5E    call        @UStrArrayClr
 00543B63    ret
>00543B64    jmp         @HandleFinally
>00543B69    jmp         00543B56
 00543B6B    pop         edi
 00543B6C    pop         esi
 00543B6D    pop         ebx
 00543B6E    mov         esp,ebp
 00543B70    pop         ebp
 00543B71    ret
end;*}

//00543BC0
{*function sub_00543BC0(?:TJvTranslateString; ?:?; ?:?):?;
begin
 00543BC0    push        ebp
 00543BC1    mov         ebp,esp
 00543BC3    push        ecx
 00543BC4    mov         ecx,0B
 00543BC9    push        0
 00543BCB    push        0
 00543BCD    dec         ecx
>00543BCE    jne         00543BC9
 00543BD0    push        ecx
 00543BD1    xchg        ecx,dword ptr [ebp-4]
 00543BD4    push        ebx
 00543BD5    push        esi
 00543BD6    push        edi
 00543BD7    mov         esi,ecx
 00543BD9    mov         edi,edx
 00543BDB    mov         ebx,eax
 00543BDD    xor         eax,eax
 00543BDF    push        ebp
 00543BE0    push        543F62
 00543BE5    push        dword ptr fs:[eax]
 00543BE8    mov         dword ptr fs:[eax],esp
 00543BEB    mov         byte ptr [ebp-5],1
 00543BEF    lea         edx,[ebp-0C]
 00543BF2    mov         eax,edi
 00543BF4    call        UpperCase
 00543BF9    mov         eax,dword ptr [ebp-0C]
 00543BFC    lea         edx,[ebp-4]
 00543BFF    call        Trim
 00543C04    mov         eax,dword ptr [ebp-4]
 00543C07    mov         edx,543F80;'APPL_NAME'
 00543C0C    call        @UStrEqual
>00543C11    jne         00543C66
 00543C13    lea         edx,[ebp-10]
 00543C16    mov         eax,ebx
 00543C18    call        00543440
 00543C1D    mov         edx,dword ptr [ebp-10]
 00543C20    mov         eax,esi
 00543C22    call        @UStrAsg
 00543C27    cmp         dword ptr [esi],0
>00543C2A    jne         00543F20
 00543C30    lea         edx,[ebp-1C]
 00543C33    mov         eax,[0078D590];^Application:TApplication
 00543C38    mov         eax,dword ptr [eax]
 00543C3A    call        TApplication.GetExeName
 00543C3F    mov         eax,dword ptr [ebp-1C]
 00543C42    lea         ecx,[ebp-18]
 00543C45    xor         edx,edx
 00543C47    call        ChangeFileExt
 00543C4C    mov         eax,dword ptr [ebp-18]
 00543C4F    lea         edx,[ebp-14]
 00543C52    call        ExtractFileName
 00543C57    mov         edx,dword ptr [ebp-14]
 00543C5A    mov         eax,esi
 00543C5C    call        @UStrAsg
>00543C61    jmp         00543F20
 00543C66    mov         eax,dword ptr [ebp-4]
 00543C69    mov         edx,543FA0;'COMPANY_NAME'
 00543C6E    call        @UStrEqual
>00543C73    jne         00543CA6
 00543C75    lea         edx,[ebp-20]
 00543C78    mov         eax,ebx
 00543C7A    call        005439E0
 00543C7F    mov         edx,dword ptr [ebp-20]
 00543C82    mov         eax,esi
 00543C84    call        @UStrAsg
 00543C89    cmp         dword ptr [esi],0
>00543C8C    jne         00543F20
 00543C92    mov         eax,esi
 00543C94    mov         edx,dword ptr ds:[78D740];^gvar_00789880
 00543C9A    mov         edx,dword ptr [edx]
 00543C9C    call        @UStrAsg
>00543CA1    jmp         00543F20
 00543CA6    mov         eax,dword ptr [ebp-4]
 00543CA9    mov         edx,543FC8;'FILEVERSION'
 00543CAE    call        @UStrEqual
>00543CB3    jne         00543CCE
 00543CB5    lea         edx,[ebp-24]
 00543CB8    mov         eax,ebx
 00543CBA    call        00543628
 00543CBF    mov         edx,dword ptr [ebp-24]
 00543CC2    mov         eax,esi
 00543CC4    call        @UStrAsg
>00543CC9    jmp         00543F20
 00543CCE    mov         eax,dword ptr [ebp-4]
 00543CD1    mov         edx,543FEC;'PRODUCTVERSION'
 00543CD6    call        @UStrEqual
>00543CDB    jne         00543CF6
 00543CDD    lea         edx,[ebp-28]
 00543CE0    mov         eax,ebx
 00543CE2    call        00543800
 00543CE7    mov         edx,dword ptr [ebp-28]
 00543CEA    mov         eax,esi
 00543CEC    call        @UStrAsg
>00543CF1    jmp         00543F20
 00543CF6    mov         eax,dword ptr [ebp-4]
 00543CF9    mov         edx,544018;'DATE'
 00543CFE    call        @UStrEqual
>00543D03    jne         00543D20
 00543D05    call        Now
 00543D0A    add         esp,0FFFFFFF8
 00543D0D    fstp        qword ptr [esp]
 00543D10    wait
 00543D11    mov         eax,esi
 00543D13    mov         edx,dword ptr [ebx+58]
 00543D16    call        DateTimeToString
>00543D1B    jmp         00543F20
 00543D20    mov         eax,dword ptr [ebp-4]
 00543D23    mov         edx,544030;'TIME'
 00543D28    call        @UStrEqual
>00543D2D    jne         00543D4A
 00543D2F    call        Now
 00543D34    add         esp,0FFFFFFF8
 00543D37    fstp        qword ptr [esp]
 00543D3A    wait
 00543D3B    mov         eax,esi
 00543D3D    mov         edx,dword ptr [ebx+68]
 00543D40    call        DateTimeToString
>00543D45    jmp         00543F20
 00543D4A    mov         eax,dword ptr [ebp-4]
 00543D4D    mov         edx,544048;'DATETIME'
 00543D52    call        @UStrEqual
>00543D57    jne         00543D74
 00543D59    call        Now
 00543D5E    add         esp,0FFFFFFF8
 00543D61    fstp        qword ptr [esp]
 00543D64    wait
 00543D65    mov         eax,esi
 00543D67    mov         edx,dword ptr [ebx+5C]
 00543D6A    call        DateTimeToString
>00543D6F    jmp         00543F20
 00543D74    mov         eax,dword ptr [ebp-4]
 00543D77    mov         edx,544068;'EXENAME'
 00543D7C    call        @UStrEqual
>00543D81    jne         00543DA1
 00543D83    lea         edx,[ebp-2C]
 00543D86    mov         eax,[0078D590];^Application:TApplication
 00543D8B    mov         eax,dword ptr [eax]
 00543D8D    call        TApplication.GetExeName
 00543D92    mov         edx,dword ptr [ebp-2C]
 00543D95    mov         eax,esi
 00543D97    call        @UStrAsg
>00543D9C    jmp         00543F20
 00543DA1    mov         eax,dword ptr [ebp-4]
 00543DA4    mov         edx,544084;'FILENAME'
 00543DA9    call        @UStrEqual
>00543DAE    jne         00543DE6
 00543DB0    lea         edx,[ebp-38]
 00543DB3    mov         eax,[0078D590];^Application:TApplication
 00543DB8    mov         eax,dword ptr [eax]
 00543DBA    call        TApplication.GetExeName
 00543DBF    mov         eax,dword ptr [ebp-38]
 00543DC2    lea         ecx,[ebp-34]
 00543DC5    xor         edx,edx
 00543DC7    call        ChangeFileExt
 00543DCC    mov         eax,dword ptr [ebp-34]
 00543DCF    lea         edx,[ebp-30]
 00543DD2    call        ExtractFileName
 00543DD7    mov         edx,dword ptr [ebp-30]
 00543DDA    mov         eax,esi
 00543DDC    call        @UStrAsg
>00543DE1    jmp         00543F20
 00543DE6    mov         eax,dword ptr [ebp-4]
 00543DE9    mov         edx,5440A4;'FULLDIREXE'
 00543DEE    call        @UStrEqual
>00543DF3    jne         00543E1E
 00543DF5    lea         edx,[ebp-40]
 00543DF8    mov         eax,[0078D590];^Application:TApplication
 00543DFD    mov         eax,dword ptr [eax]
 00543DFF    call        TApplication.GetExeName
 00543E04    mov         eax,dword ptr [ebp-40]
 00543E07    lea         edx,[ebp-3C]
 00543E0A    call        ExtractFileDir
 00543E0F    mov         edx,dword ptr [ebp-3C]
 00543E12    mov         eax,esi
 00543E14    call        @UStrAsg
>00543E19    jmp         00543F20
 00543E1E    mov         eax,dword ptr [ebp-4]
 00543E21    mov         edx,5440C8;'FORMNAME'
 00543E26    call        @UStrEqual
>00543E2B    jne         00543E46
 00543E2D    lea         edx,[ebp-44]
 00543E30    mov         eax,ebx
 00543E32    call        00543338
 00543E37    mov         edx,dword ptr [ebp-44]
 00543E3A    mov         eax,esi
 00543E3C    call        @UStrAsg
>00543E41    jmp         00543F20
 00543E46    mov         eax,dword ptr [ebp-4]
 00543E49    mov         edx,5440E8;'FORMCAPTION'
 00543E4E    call        @UStrEqual
>00543E53    jne         00543E6E
 00543E55    lea         edx,[ebp-48]
 00543E58    mov         eax,ebx
 00543E5A    call        005433E4
 00543E5F    mov         edx,dword ptr [ebp-48]
 00543E62    mov         eax,esi
 00543E64    call        @UStrAsg
>00543E69    jmp         00543F20
 00543E6E    mov         eax,dword ptr [ebp-4]
 00543E71    mov         edx,54410C;'SCREENSIZE'
 00543E76    call        @UStrEqual
>00543E7B    jne         00543EC5
 00543E7D    lea         eax,[ebp-4C]
 00543E80    push        eax
 00543E81    mov         eax,[0078DB00];^Screen:TScreen
 00543E86    mov         eax,dword ptr [eax]
 00543E88    call        TScreen.GetWidth
 00543E8D    mov         dword ptr [ebp-5C],eax
 00543E90    mov         byte ptr [ebp-58],0
 00543E94    mov         eax,[0078DB00];^Screen:TScreen
 00543E99    mov         eax,dword ptr [eax]
 00543E9B    call        TScreen.GetHeight
 00543EA0    mov         dword ptr [ebp-54],eax
 00543EA3    mov         byte ptr [ebp-50],0
 00543EA7    lea         edx,[ebp-5C]
 00543EAA    mov         ecx,1
 00543EAF    mov         eax,544130;'%dx%d'
 00543EB4    call        Format
 00543EB9    mov         edx,dword ptr [ebp-4C]
 00543EBC    mov         eax,esi
 00543EBE    call        @UStrAsg
>00543EC3    jmp         00543F20
 00543EC5    mov         eax,dword ptr [ebp-4]
 00543EC8    mov         edx,544148;'DESKTOPSIZE'
 00543ECD    call        @UStrEqual
>00543ED2    jne         00543F1C
 00543ED4    lea         eax,[ebp-60]
 00543ED7    push        eax
 00543ED8    mov         eax,[0078DB00];^Screen:TScreen
 00543EDD    mov         eax,dword ptr [eax]
 00543EDF    call        TScreen.GetDesktopWidth
 00543EE4    mov         dword ptr [ebp-5C],eax
 00543EE7    mov         byte ptr [ebp-58],0
 00543EEB    mov         eax,[0078DB00];^Screen:TScreen
 00543EF0    mov         eax,dword ptr [eax]
 00543EF2    call        TScreen.GetDesktopHeight
 00543EF7    mov         dword ptr [ebp-54],eax
 00543EFA    mov         byte ptr [ebp-50],0
 00543EFE    lea         edx,[ebp-5C]
 00543F01    mov         ecx,1
 00543F06    mov         eax,544130;'%dx%d'
 00543F0B    call        Format
 00543F10    mov         edx,dword ptr [ebp-60]
 00543F13    mov         eax,esi
 00543F15    call        @UStrAsg
>00543F1A    jmp         00543F20
 00543F1C    mov         byte ptr [ebp-5],0
 00543F20    cmp         word ptr [ebx+72],0
>00543F25    je          00543F37
 00543F27    push        esi
 00543F28    lea         eax,[ebp-5]
 00543F2B    push        eax
 00543F2C    mov         ecx,dword ptr [ebp-4]
 00543F2F    mov         edx,ebx
 00543F31    mov         eax,dword ptr [ebx+74]
 00543F34    call        dword ptr [ebx+70]
 00543F37    xor         eax,eax
 00543F39    pop         edx
 00543F3A    pop         ecx
 00543F3B    pop         ecx
 00543F3C    mov         dword ptr fs:[eax],edx
 00543F3F    push        543F69
 00543F44    lea         eax,[ebp-60]
 00543F47    call        @UStrClr
 00543F4C    lea         eax,[ebp-4C]
 00543F4F    mov         edx,11
 00543F54    call        @UStrArrayClr
 00543F59    lea         eax,[ebp-4]
 00543F5C    call        @UStrClr
 00543F61    ret
>00543F62    jmp         @HandleFinally
>00543F67    jmp         00543F44
 00543F69    movzx       eax,byte ptr [ebp-5]
 00543F6D    pop         edi
 00543F6E    pop         esi
 00543F6F    pop         ebx
 00543F70    mov         esp,ebp
 00543F72    pop         ebp
 00543F73    ret
end;*}

//00544160
procedure TJvTranslateString.SetDateTimeFormat(Value:string);
begin
{*
 00544160    push        ebx
 00544161    push        esi
 00544162    mov         esi,edx
 00544164    mov         ebx,eax
 00544166    lea         eax,[ebx+5C];TJvTranslateString.FDateTimeFormat:string
 00544169    mov         edx,esi
 0054416B    call        @UStrAsg
 00544170    pop         esi
 00544171    pop         ebx
 00544172    ret
*}
end;

//00544174
{*procedure TJvTranslateString.TranslateString(InString:string; ?:?);
begin
 00544174    push        ebp
 00544175    mov         ebp,esp
 00544177    push        0
 00544179    push        0
 0054417B    push        0
 0054417D    push        0
 0054417F    push        0
 00544181    push        0
 00544183    push        ebx
 00544184    push        esi
 00544185    push        edi
 00544186    mov         ebx,ecx
 00544188    mov         dword ptr [ebp-4],edx
 0054418B    mov         edi,eax
 0054418D    mov         eax,dword ptr [ebp-4]
 00544190    call        @UStrAddRef
 00544195    xor         eax,eax
 00544197    push        ebp
 00544198    push        5442DA
 0054419D    push        dword ptr fs:[eax]
 005441A0    mov         dword ptr fs:[eax],esp
 005441A3    mov         eax,ebx
 005441A5    call        @UStrClr
>005441AA    jmp         005442A8
 005441AF    mov         eax,dword ptr [edi+60];TJvTranslateString.FLeftDelimiter:string
 005441B2    mov         edx,dword ptr [ebp-4]
 005441B5    call        Pos
 005441BA    mov         esi,eax
 005441BC    test        esi,esi
>005441BE    jne         005441D7
 005441C0    mov         eax,ebx
 005441C2    mov         edx,dword ptr [ebp-4]
 005441C5    call        @UStrCat
 005441CA    lea         eax,[ebp-4]
 005441CD    call        @UStrClr
>005441D2    jmp         005442A8
 005441D7    lea         eax,[ebp-14]
 005441DA    push        eax
 005441DB    mov         ecx,esi
 005441DD    dec         ecx
 005441DE    mov         edx,1
 005441E3    mov         eax,dword ptr [ebp-4]
 005441E6    call        @UStrCopy
 005441EB    mov         edx,dword ptr [ebp-14]
 005441EE    mov         eax,ebx
 005441F0    call        @UStrCat
 005441F5    lea         eax,[ebp-4]
 005441F8    mov         ecx,esi
 005441FA    mov         edx,1
 005441FF    call        @UStrDelete
 00544204    mov         eax,dword ptr [edi+64];TJvTranslateString.FRightDelimiter:string
 00544207    mov         edx,dword ptr [ebp-4]
 0054420A    call        Pos
 0054420F    mov         dword ptr [ebp-10],eax
 00544212    cmp         dword ptr [ebp-10],0
>00544216    jle         0054428C
 00544218    lea         eax,[ebp-8]
 0054421B    push        eax
 0054421C    mov         ecx,dword ptr [ebp-10]
 0054421F    dec         ecx
 00544220    mov         edx,1
 00544225    mov         eax,dword ptr [ebp-4]
 00544228    call        @UStrCopy
 0054422D    lea         ecx,[ebp-0C]
 00544230    mov         edx,dword ptr [ebp-8]
 00544233    mov         eax,edi
 00544235    call        00543BC0
 0054423A    test        al,al
>0054423C    je          0054425A
 0054423E    mov         eax,ebx
 00544240    mov         edx,dword ptr [ebp-0C]
 00544243    call        @UStrCat
 00544248    lea         eax,[ebp-4]
 0054424B    mov         ecx,dword ptr [ebp-10]
 0054424E    mov         edx,1
 00544253    call        @UStrDelete
>00544258    jmp         005442A8
 0054425A    lea         eax,[ebp-18]
 0054425D    push        eax
 0054425E    mov         ecx,dword ptr [ebp-10]
 00544261    dec         ecx
 00544262    mov         edx,1
 00544267    mov         eax,dword ptr [ebp-4]
 0054426A    call        @UStrCopy
 0054426F    mov         edx,dword ptr [ebp-18]
 00544272    mov         eax,ebx
 00544274    call        @UStrCat
 00544279    mov         ecx,dword ptr [ebp-10]
 0054427C    dec         ecx
 0054427D    lea         eax,[ebp-4]
 00544280    mov         edx,1
 00544285    call        @UStrDelete
>0054428A    jmp         005442A8
 0054428C    push        dword ptr [ebx]
 0054428E    push        dword ptr [edi+60];TJvTranslateString.FLeftDelimiter:string
 00544291    push        dword ptr [ebp-4]
 00544294    mov         eax,ebx
 00544296    mov         edx,3
 0054429B    call        @UStrCatN
 005442A0    lea         eax,[ebp-4]
 005442A3    call        @UStrClr
 005442A8    cmp         dword ptr [ebp-4],0
>005442AC    jne         005441AF
 005442B2    xor         eax,eax
 005442B4    pop         edx
 005442B5    pop         ecx
 005442B6    pop         ecx
 005442B7    mov         dword ptr fs:[eax],edx
 005442BA    push        5442E1
 005442BF    lea         eax,[ebp-18]
 005442C2    mov         edx,2
 005442C7    call        @UStrArrayClr
 005442CC    lea         eax,[ebp-0C]
 005442CF    mov         edx,3
 005442D4    call        @UStrArrayClr
 005442D9    ret
>005442DA    jmp         @HandleFinally
>005442DF    jmp         005442BF
 005442E1    pop         edi
 005442E2    pop         esi
 005442E3    pop         ebx
 005442E4    mov         esp,ebp
 005442E6    pop         ebp
 005442E7    ret
end;*}

//005442E8
{*procedure TJvTranslateString.TranslateString(InString:string; var Changed:Boolean; ?:?);
begin
 005442E8    push        ebp
 005442E9    mov         ebp,esp
 005442EB    push        0
 005442ED    push        0
 005442EF    push        0
 005442F1    push        0
 005442F3    push        0
 005442F5    push        0
 005442F7    push        0
 005442F9    push        ebx
 005442FA    push        esi
 005442FB    push        edi
 005442FC    mov         dword ptr [ebp-10],ecx
 005442FF    mov         dword ptr [ebp-4],edx
 00544302    mov         edi,eax
 00544304    mov         ebx,dword ptr [ebp+8]
 00544307    mov         eax,dword ptr [ebp-4]
 0054430A    call        @UStrAddRef
 0054430F    xor         eax,eax
 00544311    push        ebp
 00544312    push        54443C
 00544317    push        dword ptr fs:[eax]
 0054431A    mov         dword ptr fs:[eax],esp
 0054431D    mov         eax,ebx
 0054431F    call        @UStrClr
 00544324    mov         eax,dword ptr [ebp-10]
 00544327    mov         byte ptr [eax],0
>0054432A    jmp         0054440A
 0054432F    mov         eax,dword ptr [edi+60];TJvTranslateString.FLeftDelimiter:string
 00544332    mov         edx,dword ptr [ebp-4]
 00544335    call        Pos
 0054433A    mov         esi,eax
 0054433C    test        esi,esi
>0054433E    jne         00544357
 00544340    mov         eax,ebx
 00544342    mov         edx,dword ptr [ebp-4]
 00544345    call        @UStrCat
 0054434A    lea         eax,[ebp-4]
 0054434D    call        @UStrClr
>00544352    jmp         0054440A
 00544357    lea         eax,[ebp-18]
 0054435A    push        eax
 0054435B    mov         ecx,esi
 0054435D    dec         ecx
 0054435E    mov         edx,1
 00544363    mov         eax,dword ptr [ebp-4]
 00544366    call        @UStrCopy
 0054436B    mov         edx,dword ptr [ebp-18]
 0054436E    mov         eax,ebx
 00544370    call        @UStrCat
 00544375    lea         eax,[ebp-4]
 00544378    mov         ecx,esi
 0054437A    mov         edx,1
 0054437F    call        @UStrDelete
 00544384    mov         eax,dword ptr [edi+64];TJvTranslateString.FRightDelimiter:string
 00544387    mov         edx,dword ptr [ebp-4]
 0054438A    call        Pos
 0054438F    mov         dword ptr [ebp-14],eax
 00544392    lea         eax,[ebp-8]
 00544395    push        eax
 00544396    mov         ecx,dword ptr [ebp-14]
 00544399    dec         ecx
 0054439A    mov         edx,1
 0054439F    mov         eax,dword ptr [ebp-4]
 005443A2    call        @UStrCopy
 005443A7    lea         ecx,[ebp-0C]
 005443AA    mov         edx,dword ptr [ebp-8]
 005443AD    mov         eax,edi
 005443AF    call        00543BC0
 005443B4    test        al,al
>005443B6    je          005443DA
 005443B8    mov         eax,ebx
 005443BA    mov         edx,dword ptr [ebp-0C]
 005443BD    call        @UStrCat
 005443C2    lea         eax,[ebp-4]
 005443C5    mov         ecx,dword ptr [ebp-14]
 005443C8    mov         edx,1
 005443CD    call        @UStrDelete
 005443D2    mov         eax,dword ptr [ebp-10]
 005443D5    mov         byte ptr [eax],1
>005443D8    jmp         0054440A
 005443DA    lea         eax,[ebp-1C]
 005443DD    push        eax
 005443DE    mov         ecx,dword ptr [ebp-14]
 005443E1    dec         ecx
 005443E2    mov         edx,1
 005443E7    mov         eax,dword ptr [ebp-4]
 005443EA    call        @UStrCopy
 005443EF    mov         edx,dword ptr [ebp-1C]
 005443F2    mov         eax,ebx
 005443F4    call        @UStrCat
 005443F9    mov         ecx,dword ptr [ebp-14]
 005443FC    dec         ecx
 005443FD    lea         eax,[ebp-4]
 00544400    mov         edx,1
 00544405    call        @UStrDelete
 0054440A    cmp         dword ptr [ebp-4],0
>0054440E    jne         0054432F
 00544414    xor         eax,eax
 00544416    pop         edx
 00544417    pop         ecx
 00544418    pop         ecx
 00544419    mov         dword ptr fs:[eax],edx
 0054441C    push        544443
 00544421    lea         eax,[ebp-1C]
 00544424    mov         edx,2
 00544429    call        @UStrArrayClr
 0054442E    lea         eax,[ebp-0C]
 00544431    mov         edx,3
 00544436    call        @UStrArrayClr
 0054443B    ret
>0054443C    jmp         @HandleFinally
>00544441    jmp         00544421
 00544443    pop         edi
 00544444    pop         esi
 00544445    pop         ebx
 00544446    mov         esp,ebp
 00544448    pop         ebp
 00544449    ret         4
end;*}

//005476A0
constructor TJclTypeInfo.Create(ATypeInfo:PTypeInfo);
begin
{*
 005476A0    push        ebx
 005476A1    push        esi
 005476A2    push        edi
 005476A3    test        dl,dl
>005476A5    je          005476AF
 005476A7    add         esp,0FFFFFFF0
 005476AA    call        @ClassCreate
 005476AF    mov         esi,ecx
 005476B1    mov         ebx,edx
 005476B3    mov         edi,eax
 005476B5    xor         edx,edx
 005476B7    mov         eax,edi
 005476B9    call        TObject.Create
 005476BE    mov         dword ptr [edi+10],esi;TJclTypeInfo.FTypeInfo:PTypeInfo
 005476C1    mov         eax,esi
 005476C3    call        GetTypeData
 005476C8    mov         dword ptr [edi+0C],eax;TJclTypeInfo.FTypeData:PTypeData
 005476CB    mov         eax,edi
 005476CD    test        bl,bl
>005476CF    je          005476E0
 005476D1    call        @AfterConstruction
 005476D6    pop         dword ptr fs:[0]
 005476DD    add         esp,0C
 005476E0    mov         eax,edi
 005476E2    pop         edi
 005476E3    pop         esi
 005476E4    pop         ebx
 005476E5    ret
*}
end;

//005476E8
{*procedure TJclTypeInfo.GetName(?:?);
begin
 005476E8    push        ebx
 005476E9    push        esi
 005476EA    mov         esi,edx
 005476EC    mov         ebx,eax
 005476EE    mov         eax,ebx
 005476F0    call        TJclTypeInfo.GetTypeInfo
 005476F5    lea         edx,[eax+1]
 005476F8    mov         eax,esi
 005476FA    call        @UStrFromString
 005476FF    pop         esi
 00547700    pop         ebx
 00547701    ret
end;*}

//00547704
function TJclTypeInfo.GetTypeData:PTypeData;
begin
{*
 00547704    mov         eax,dword ptr [eax+0C];TJclTypeInfo.FTypeData:PTypeData
 00547707    ret
*}
end;

//00547708
function TJclTypeInfo.GetTypeInfo:PTypeInfo;
begin
{*
 00547708    mov         eax,dword ptr [eax+10];TJclTypeInfo.FTypeInfo:PTypeInfo
 0054770B    ret
*}
end;

//0054770C
function TJclTypeInfo.GetTypeKind:TTypeKind;
begin
{*
 0054770C    push        ebx
 0054770D    mov         ebx,eax
 0054770F    mov         eax,ebx
 00547711    call        TJclTypeInfo.GetTypeInfo
 00547716    movzx       eax,byte ptr [eax]
 00547719    pop         ebx
 0054771A    ret
*}
end;

//0054771C
{*procedure sub_0054771C(?:?);
begin
 0054771C    push        ebp
 0054771D    mov         ebp,esp
 0054771F    xor         ecx,ecx
 00547721    push        ecx
 00547722    push        ecx
 00547723    push        ecx
 00547724    push        ecx
 00547725    push        ecx
 00547726    push        ecx
 00547727    push        ecx
 00547728    push        ecx
 00547729    push        ebx
 0054772A    push        esi
 0054772B    mov         esi,edx
 0054772D    mov         ebx,eax
 0054772F    xor         eax,eax
 00547731    push        ebp
 00547732    push        5477F8
 00547737    push        dword ptr fs:[eax]
 0054773A    mov         dword ptr fs:[eax],esp
 0054773D    lea         edx,[ebp-4]
 00547740    mov         eax,[0078CB20];^SResString441:TResStringRec
 00547745    call        LoadResString
 0054774A    lea         eax,[ebp-4]
 0054774D    push        eax
 0054774E    lea         edx,[ebp-8]
 00547751    mov         eax,ebx
 00547753    call        TJclTypeInfo.GetName
 00547758    mov         edx,dword ptr [ebp-8]
 0054775B    pop         eax
 0054775C    call        @UStrCat
 00547761    mov         edx,dword ptr [ebp-4]
 00547764    mov         eax,esi
 00547766    mov         ecx,dword ptr [eax]
 00547768    call        dword ptr [ecx+18]
 0054776B    lea         edx,[ebp-0C]
 0054776E    mov         eax,[0078D364];^SResString445:TResStringRec
 00547773    call        LoadResString
 00547778    lea         eax,[ebp-0C]
 0054777B    push        eax
 0054777C    mov         eax,ebx
 0054777E    call        TJclTypeInfo.GetTypeInfo
 00547783    mov         edx,eax
 00547785    lea         ecx,[ebp-10]
 00547788    mov         eax,[00435E74];TTypeKind
 0054778D    call        0054BEEC
 00547792    mov         edx,dword ptr [ebp-10]
 00547795    pop         eax
 00547796    call        @UStrCat
 0054779B    mov         edx,dword ptr [ebp-0C]
 0054779E    mov         eax,esi
 005477A0    mov         ecx,dword ptr [eax]
 005477A2    call        dword ptr [ecx+18]
 005477A5    lea         eax,[ebp-14]
 005477A8    push        eax
 005477A9    lea         edx,[ebp-18]
 005477AC    mov         eax,[0078D9FC];^SResString432:TResStringRec
 005477B1    call        LoadResString
 005477B6    mov         eax,dword ptr [ebp-18]
 005477B9    push        eax
 005477BA    mov         eax,ebx
 005477BC    call        TJclTypeInfo.GetTypeInfo
 005477C1    mov         dword ptr [ebp-20],eax
 005477C4    mov         byte ptr [ebp-1C],5
 005477C8    lea         edx,[ebp-20]
 005477CB    xor         ecx,ecx
 005477CD    pop         eax
 005477CE    call        Format
 005477D3    mov         edx,dword ptr [ebp-14]
 005477D6    mov         eax,esi
 005477D8    mov         ecx,dword ptr [eax]
 005477DA    call        dword ptr [ecx+18]
 005477DD    xor         eax,eax
 005477DF    pop         edx
 005477E0    pop         ecx
 005477E1    pop         ecx
 005477E2    mov         dword ptr fs:[eax],edx
 005477E5    push        5477FF
 005477EA    lea         eax,[ebp-18]
 005477ED    mov         edx,6
 005477F2    call        @UStrArrayClr
 005477F7    ret
>005477F8    jmp         @HandleFinally
>005477FD    jmp         005477EA
 005477FF    pop         esi
 00547800    pop         ebx
 00547801    mov         esp,ebp
 00547803    pop         ebp
 00547804    ret
end;*}

//00547808
{*procedure sub_00547808(?:?);
begin
 00547808    push        ebp
 00547809    mov         ebp,esp
 0054780B    xor         ecx,ecx
 0054780D    push        ecx
 0054780E    push        ecx
 0054780F    push        ecx
 00547810    push        ecx
 00547811    push        ecx
 00547812    push        ebx
 00547813    push        esi
 00547814    mov         esi,edx
 00547816    mov         ebx,eax
 00547818    xor         eax,eax
 0054781A    push        ebp
 0054781B    push        547887
 00547820    push        dword ptr fs:[eax]
 00547823    mov         dword ptr fs:[eax],esp
 00547826    lea         eax,[ebp-4]
 00547829    push        eax
 0054782A    lea         edx,[ebp-10]
 0054782D    mov         eax,ebx
 0054782F    call        TJclTypeInfo.GetName
 00547834    mov         eax,dword ptr [ebp-10]
 00547837    mov         dword ptr [ebp-0C],eax
 0054783A    mov         byte ptr [ebp-8],11
 0054783E    lea         eax,[ebp-0C]
 00547841    push        eax
 00547842    lea         edx,[ebp-14]
 00547845    mov         eax,[0078CBBC];^SResString464:TResStringRec
 0054784A    call        LoadResString
 0054784F    mov         eax,dword ptr [ebp-14]
 00547852    xor         ecx,ecx
 00547854    pop         edx
 00547855    call        Format
 0054785A    mov         edx,dword ptr [ebp-4]
 0054785D    mov         eax,esi
 0054785F    mov         ecx,dword ptr [eax]
 00547861    call        dword ptr [ecx+14]
 00547864    xor         eax,eax
 00547866    pop         edx
 00547867    pop         ecx
 00547868    pop         ecx
 00547869    mov         dword ptr fs:[eax],edx
 0054786C    push        54788E
 00547871    lea         eax,[ebp-14]
 00547874    mov         edx,2
 00547879    call        @UStrArrayClr
 0054787E    lea         eax,[ebp-4]
 00547881    call        @UStrClr
 00547886    ret
>00547887    jmp         @HandleFinally
>0054788C    jmp         00547871
 0054788E    pop         esi
 0054788F    pop         ebx
 00547890    mov         esp,ebp
 00547892    pop         ebp
 00547893    ret
end;*}

//00547894
function TJclOrdinalTypeInfo.GetOrdinalType:TOrdType;
begin
{*
 00547894    push        ebx
 00547895    mov         ebx,eax
 00547897    mov         eax,ebx
 00547899    call        TJclTypeInfo.GetTypeData
 0054789E    movzx       eax,byte ptr [eax]
 005478A1    pop         ebx
 005478A2    ret
*}
end;

//005478A4
{*procedure sub_005478A4(?:?);
begin
 005478A4    push        ebp
 005478A5    mov         ebp,esp
 005478A7    push        0
 005478A9    push        0
 005478AB    push        ebx
 005478AC    push        esi
 005478AD    mov         esi,edx
 005478AF    mov         ebx,eax
 005478B1    xor         eax,eax
 005478B3    push        ebp
 005478B4    push        54791D
 005478B9    push        dword ptr fs:[eax]
 005478BC    mov         dword ptr fs:[eax],esp
 005478BF    mov         edx,esi
 005478C1    mov         eax,ebx
 005478C3    call        0054771C
 005478C8    lea         edx,[ebp-4]
 005478CB    mov         eax,[0078CF24];^SResString446:TResStringRec
 005478D0    call        LoadResString
 005478D5    lea         eax,[ebp-4]
 005478D8    push        eax
 005478D9    mov         eax,ebx
 005478DB    call        TJclTypeInfo.GetTypeData
 005478E0    mov         edx,eax
 005478E2    lea         ecx,[ebp-8]
 005478E5    mov         eax,[00435F84];TOrdType
 005478EA    call        0054BEEC
 005478EF    mov         edx,dword ptr [ebp-8]
 005478F2    pop         eax
 005478F3    call        @UStrCat
 005478F8    mov         edx,dword ptr [ebp-4]
 005478FB    mov         eax,esi
 005478FD    mov         ecx,dword ptr [eax]
 005478FF    call        dword ptr [ecx+18]
 00547902    xor         eax,eax
 00547904    pop         edx
 00547905    pop         ecx
 00547906    pop         ecx
 00547907    mov         dword ptr fs:[eax],edx
 0054790A    push        547924
 0054790F    lea         eax,[ebp-8]
 00547912    mov         edx,2
 00547917    call        @UStrArrayClr
 0054791C    ret
>0054791D    jmp         @HandleFinally
>00547922    jmp         0054790F
 00547924    pop         esi
 00547925    pop         ebx
 00547926    pop         ecx
 00547927    pop         ecx
 00547928    pop         ebp
 00547929    ret
end;*}

//0054792C
function TJclOrdinalRangeTypeInfo.GetMinValue:Int64;
begin
{*
 0054792C    push        ebx
 0054792D    add         esp,0FFFFFFF8
 00547930    mov         ebx,eax
 00547932    mov         eax,ebx
 00547934    call        TJclOrdinalTypeInfo.GetOrdinalType
 00547939    cmp         al,5
>0054793B    jne         00547952
 0054793D    mov         eax,ebx
 0054793F    call        TJclTypeInfo.GetTypeData
 00547944    mov         eax,dword ptr [eax+1]
 00547947    xor         edx,edx
 00547949    mov         dword ptr [esp],eax
 0054794C    mov         dword ptr [esp+4],edx
>00547950    jmp         00547964
 00547952    mov         eax,ebx
 00547954    call        TJclTypeInfo.GetTypeData
 00547959    mov         eax,dword ptr [eax+1]
 0054795C    cdq
 0054795D    mov         dword ptr [esp],eax
 00547960    mov         dword ptr [esp+4],edx
 00547964    mov         eax,dword ptr [esp]
 00547967    mov         edx,dword ptr [esp+4]
 0054796B    pop         ecx
 0054796C    pop         edx
 0054796D    pop         ebx
 0054796E    ret
*}
end;

//00547970
function TJclOrdinalRangeTypeInfo.GetMaxValue:Int64;
begin
{*
 00547970    push        ebx
 00547971    add         esp,0FFFFFFF8
 00547974    mov         ebx,eax
 00547976    mov         eax,ebx
 00547978    call        TJclOrdinalTypeInfo.GetOrdinalType
 0054797D    cmp         al,5
>0054797F    jne         00547996
 00547981    mov         eax,ebx
 00547983    call        TJclTypeInfo.GetTypeData
 00547988    mov         eax,dword ptr [eax+5]
 0054798B    xor         edx,edx
 0054798D    mov         dword ptr [esp],eax
 00547990    mov         dword ptr [esp+4],edx
>00547994    jmp         005479A8
 00547996    mov         eax,ebx
 00547998    call        TJclTypeInfo.GetTypeData
 0054799D    mov         eax,dword ptr [eax+5]
 005479A0    cdq
 005479A1    mov         dword ptr [esp],eax
 005479A4    mov         dword ptr [esp+4],edx
 005479A8    mov         eax,dword ptr [esp]
 005479AB    mov         edx,dword ptr [esp+4]
 005479AF    pop         ecx
 005479B0    pop         edx
 005479B1    pop         ebx
 005479B2    ret
*}
end;

//005479B4
{*procedure sub_005479B4(?:?);
begin
 005479B4    push        ebp
 005479B5    mov         ebp,esp
 005479B7    xor         ecx,ecx
 005479B9    push        ecx
 005479BA    push        ecx
 005479BB    push        ecx
 005479BC    push        ecx
 005479BD    push        ebx
 005479BE    push        esi
 005479BF    mov         esi,edx
 005479C1    mov         ebx,eax
 005479C3    xor         eax,eax
 005479C5    push        ebp
 005479C6    push        547A5F
 005479CB    push        dword ptr fs:[eax]
 005479CE    mov         dword ptr fs:[eax],esp
 005479D1    mov         edx,esi
 005479D3    mov         eax,ebx
 005479D5    call        005478A4
 005479DA    lea         edx,[ebp-4]
 005479DD    mov         eax,[0078CCB8];^SResString447:TResStringRec
 005479E2    call        LoadResString
 005479E7    lea         eax,[ebp-4]
 005479EA    push        eax
 005479EB    mov         eax,ebx
 005479ED    call        TJclOrdinalRangeTypeInfo.GetMinValue
 005479F2    push        edx
 005479F3    push        eax
 005479F4    lea         eax,[ebp-8]
 005479F7    call        IntToStr
 005479FC    mov         edx,dword ptr [ebp-8]
 005479FF    pop         eax
 00547A00    call        @UStrCat
 00547A05    mov         edx,dword ptr [ebp-4]
 00547A08    mov         eax,esi
 00547A0A    mov         ecx,dword ptr [eax]
 00547A0C    call        dword ptr [ecx+18]
 00547A0F    lea         edx,[ebp-0C]
 00547A12    mov         eax,[0078CC1C];^SResString448:TResStringRec
 00547A17    call        LoadResString
 00547A1C    lea         eax,[ebp-0C]
 00547A1F    push        eax
 00547A20    mov         eax,ebx
 00547A22    call        TJclOrdinalRangeTypeInfo.GetMaxValue
 00547A27    push        edx
 00547A28    push        eax
 00547A29    lea         eax,[ebp-10]
 00547A2C    call        IntToStr
 00547A31    mov         edx,dword ptr [ebp-10]
 00547A34    pop         eax
 00547A35    call        @UStrCat
 00547A3A    mov         edx,dword ptr [ebp-0C]
 00547A3D    mov         eax,esi
 00547A3F    mov         ecx,dword ptr [eax]
 00547A41    call        dword ptr [ecx+18]
 00547A44    xor         eax,eax
 00547A46    pop         edx
 00547A47    pop         ecx
 00547A48    pop         ecx
 00547A49    mov         dword ptr fs:[eax],edx
 00547A4C    push        547A66
 00547A51    lea         eax,[ebp-10]
 00547A54    mov         edx,4
 00547A59    call        @UStrArrayClr
 00547A5E    ret
>00547A5F    jmp         @HandleFinally
>00547A64    jmp         00547A51
 00547A66    pop         esi
 00547A67    pop         ebx
 00547A68    mov         esp,ebp
 00547A6A    pop         ebp
 00547A6B    ret
end;*}

//00547A6C
{*procedure sub_00547A6C(?:?);
begin
 00547A6C    push        ebp
 00547A6D    mov         ebp,esp
 00547A6F    mov         ecx,7
 00547A74    push        0
 00547A76    push        0
 00547A78    dec         ecx
>00547A79    jne         00547A74
 00547A7B    push        ebx
 00547A7C    push        esi
 00547A7D    mov         esi,edx
 00547A7F    mov         ebx,eax
 00547A81    xor         eax,eax
 00547A83    push        ebp
 00547A84    push        547C80
 00547A89    push        dword ptr fs:[eax]
 00547A8C    mov         dword ptr fs:[eax],esp
 00547A8F    lea         edx,[ebp-4]
 00547A92    mov         eax,ebx
 00547A94    call        TJclTypeInfo.GetName
 00547A99    lea         eax,[ebp-4]
 00547A9C    mov         edx,547C9C;' = '
 00547AA1    call        @UStrCat
 00547AA6    mov         edx,dword ptr [ebp-4]
 00547AA9    mov         eax,esi
 00547AAB    mov         ecx,dword ptr [eax]
 00547AAD    call        dword ptr [ecx+14]
 00547AB0    mov         eax,ebx
 00547AB2    call        TJclTypeInfo.GetTypeInfo
 00547AB7    movzx       eax,byte ptr [eax]
 00547ABA    sub         al,2
>00547ABC    je          00547AC6
 00547ABE    sub         al,7
>00547AC0    jne         00547BF1
 00547AC6    mov         eax,ebx
 00547AC8    call        TJclOrdinalRangeTypeInfo.GetMinValue
 00547ACD    cmp         edx,0
>00547AD0    jne         00547AD9
 00547AD2    cmp         eax,20
>00547AD5    jb          00547AF0
>00547AD7    jmp         00547ADB
>00547AD9    jl          00547AF0
 00547ADB    mov         eax,ebx
 00547ADD    call        TJclOrdinalRangeTypeInfo.GetMinValue
 00547AE2    cmp         edx,0
>00547AE5    jne         00547AEE
 00547AE7    cmp         eax,7E
>00547AEA    jbe         00547B27
>00547AEC    jmp         00547AF0
>00547AEE    jle         00547B27
 00547AF0    push        547CB0;'#'
 00547AF5    mov         eax,ebx
 00547AF7    call        TJclOrdinalRangeTypeInfo.GetMinValue
 00547AFC    push        edx
 00547AFD    push        eax
 00547AFE    lea         eax,[ebp-0C]
 00547B01    call        IntToStr
 00547B06    push        dword ptr [ebp-0C]
 00547B09    push        547CC0;'..'
 00547B0E    lea         eax,[ebp-8]
 00547B11    mov         edx,3
 00547B16    call        @UStrCatN
 00547B1B    mov         edx,dword ptr [ebp-8]
 00547B1E    mov         eax,esi
 00547B20    mov         ecx,dword ptr [eax]
 00547B22    call        dword ptr [ecx+14]
>00547B25    jmp         00547B62
 00547B27    push        547CD4;''''
 00547B2C    mov         eax,ebx
 00547B2E    call        TJclOrdinalRangeTypeInfo.GetMinValue
 00547B33    movzx       edx,al
 00547B36    lea         eax,[ebp-14]
 00547B39    call        @UStrFromWChar
 00547B3E    push        dword ptr [ebp-14]
 00547B41    push        547CD4;''''
 00547B46    push        547CC0;'..'
 00547B4B    lea         eax,[ebp-10]
 00547B4E    mov         edx,4
 00547B53    call        @UStrCatN
 00547B58    mov         edx,dword ptr [ebp-10]
 00547B5B    mov         eax,esi
 00547B5D    mov         ecx,dword ptr [eax]
 00547B5F    call        dword ptr [ecx+14]
 00547B62    mov         eax,ebx
 00547B64    call        TJclOrdinalRangeTypeInfo.GetMaxValue
 00547B69    cmp         edx,0
>00547B6C    jne         00547B75
 00547B6E    cmp         eax,20
>00547B71    jb          00547B8C
>00547B73    jmp         00547B77
>00547B75    jl          00547B8C
 00547B77    mov         eax,ebx
 00547B79    call        TJclOrdinalRangeTypeInfo.GetMaxValue
 00547B7E    cmp         edx,0
>00547B81    jne         00547B8A
 00547B83    cmp         eax,7E
>00547B86    jbe         00547BB9
>00547B88    jmp         00547B8C
>00547B8A    jle         00547BB9
 00547B8C    mov         eax,ebx
 00547B8E    call        TJclOrdinalRangeTypeInfo.GetMaxValue
 00547B93    push        edx
 00547B94    push        eax
 00547B95    lea         eax,[ebp-1C]
 00547B98    call        IntToStr
 00547B9D    mov         ecx,dword ptr [ebp-1C]
 00547BA0    lea         eax,[ebp-18]
 00547BA3    mov         edx,547CB0;'#'
 00547BA8    call        @UStrCat3
 00547BAD    mov         edx,dword ptr [ebp-18]
 00547BB0    mov         eax,esi
 00547BB2    mov         ecx,dword ptr [eax]
 00547BB4    call        dword ptr [ecx+14]
>00547BB7    jmp         00547C35
 00547BB9    push        547CD4;''''
 00547BBE    mov         eax,ebx
 00547BC0    call        TJclOrdinalRangeTypeInfo.GetMaxValue
 00547BC5    movzx       edx,al
 00547BC8    lea         eax,[ebp-24]
 00547BCB    call        @UStrFromWChar
 00547BD0    push        dword ptr [ebp-24]
 00547BD3    push        547CD4;''''
 00547BD8    lea         eax,[ebp-20]
 00547BDB    mov         edx,3
 00547BE0    call        @UStrCatN
 00547BE5    mov         edx,dword ptr [ebp-20]
 00547BE8    mov         eax,esi
 00547BEA    mov         ecx,dword ptr [eax]
 00547BEC    call        dword ptr [ecx+14]
>00547BEF    jmp         00547C35
 00547BF1    mov         eax,ebx
 00547BF3    call        TJclOrdinalRangeTypeInfo.GetMinValue
 00547BF8    push        edx
 00547BF9    push        eax
 00547BFA    lea         eax,[ebp-2C]
 00547BFD    call        IntToStr
 00547C02    push        dword ptr [ebp-2C]
 00547C05    push        547CC0;'..'
 00547C0A    mov         eax,ebx
 00547C0C    call        TJclOrdinalRangeTypeInfo.GetMaxValue
 00547C11    push        edx
 00547C12    push        eax
 00547C13    lea         eax,[ebp-30]
 00547C16    call        IntToStr
 00547C1B    push        dword ptr [ebp-30]
 00547C1E    lea         eax,[ebp-28]
 00547C21    mov         edx,3
 00547C26    call        @UStrCatN
 00547C2B    mov         edx,dword ptr [ebp-28]
 00547C2E    mov         eax,esi
 00547C30    mov         ecx,dword ptr [eax]
 00547C32    call        dword ptr [ecx+14]
 00547C35    mov         eax,ebx
 00547C37    call        TJclTypeInfo.GetTypeData
 00547C3C    mov         edx,eax
 00547C3E    lea         ecx,[ebp-38]
 00547C41    mov         eax,[00435F84];TOrdType
 00547C46    call        0054BEEC
 00547C4B    mov         ecx,dword ptr [ebp-38]
 00547C4E    lea         eax,[ebp-34]
 00547C51    mov         edx,547CE4;'; // '
 00547C56    call        @UStrCat3
 00547C5B    mov         edx,dword ptr [ebp-34]
 00547C5E    mov         eax,esi
 00547C60    mov         ecx,dword ptr [eax]
 00547C62    call        dword ptr [ecx+18]
 00547C65    xor         eax,eax
 00547C67    pop         edx
 00547C68    pop         ecx
 00547C69    pop         ecx
 00547C6A    mov         dword ptr fs:[eax],edx
 00547C6D    push        547C87
 00547C72    lea         eax,[ebp-38]
 00547C75    mov         edx,0E
 00547C7A    call        @UStrArrayClr
 00547C7F    ret
>00547C80    jmp         @HandleFinally
>00547C85    jmp         00547C72
 00547C87    pop         esi
 00547C88    pop         ebx
 00547C89    mov         esp,ebp
 00547C8B    pop         ebp
 00547C8C    ret
end;*}

//00547CF0
{*procedure TJclEnumerationTypeInfo.GetBaseType(?:?);
begin
 00547CF0    push        ebx
 00547CF1    push        esi
 00547CF2    push        edi
 00547CF3    mov         esi,edx
 00547CF5    mov         ebx,eax
 00547CF7    mov         eax,ebx
 00547CF9    call        TJclTypeInfo.GetTypeData
 00547CFE    mov         eax,dword ptr [eax+9]
 00547D01    mov         edi,dword ptr [eax]
 00547D03    mov         eax,ebx
 00547D05    call        TJclTypeInfo.GetTypeInfo
 00547D0A    cmp         edi,eax
>00547D0C    jne         00547D20
 00547D0E    mov         eax,esi
 00547D10    mov         edx,ebx
 00547D12    test        edx,edx
>00547D14    je          00547D19
 00547D16    sub         edx,0FFFFFFE0
 00547D19    call        @IntfCopy
>00547D1E    jmp         00547D48
 00547D20    mov         eax,ebx
 00547D22    call        TJclTypeInfo.GetTypeData
 00547D27    mov         eax,dword ptr [eax+9]
 00547D2A    mov         ecx,dword ptr [eax]
 00547D2C    mov         dl,1
 00547D2E    mov         eax,[00544D88];TJclEnumerationTypeInfo
 00547D33    call        TJclTypeInfo.Create;TJclEnumerationTypeInfo.Create
 00547D38    mov         edx,eax
 00547D3A    test        edx,edx
>00547D3C    je          00547D41
 00547D3E    sub         edx,0FFFFFFE0
 00547D41    mov         eax,esi
 00547D43    call        @IntfCopy
 00547D48    pop         edi
 00547D49    pop         esi
 00547D4A    pop         ebx
 00547D4B    ret
end;*}

//00547D4C
{*procedure TJclEnumerationTypeInfo.GetNames(I:Integer; ?:?);
begin
 00547D4C    push        ebp
 00547D4D    mov         ebp,esp
 00547D4F    push        0
 00547D51    push        ebx
 00547D52    push        esi
 00547D53    push        edi
 00547D54    mov         edi,ecx
 00547D56    mov         esi,edx
 00547D58    mov         ebx,eax
 00547D5A    xor         eax,eax
 00547D5C    push        ebp
 00547D5D    push        547DAB
 00547D62    push        dword ptr fs:[eax]
 00547D65    mov         dword ptr fs:[eax],esp
 00547D68    lea         edx,[ebp-4]
 00547D6B    mov         eax,ebx
 00547D6D    call        TJclEnumerationTypeInfo.GetBaseType
 00547D72    mov         eax,dword ptr [ebp-4]
 00547D75    mov         edx,dword ptr [eax]
 00547D77    call        dword ptr [edx+18]
 00547D7A    lea         ebx,[eax+0D]
 00547D7D    test        esi,esi
>00547D7F    je          00547D8C
 00547D81    movzx       eax,byte ptr [ebx]
 00547D84    inc         eax
 00547D85    add         ebx,eax
 00547D87    dec         esi
 00547D88    test        esi,esi
>00547D8A    jne         00547D81
 00547D8C    mov         eax,edi
 00547D8E    mov         edx,ebx
 00547D90    call        @UStrFromString
 00547D95    xor         eax,eax
 00547D97    pop         edx
 00547D98    pop         ecx
 00547D99    pop         ecx
 00547D9A    mov         dword ptr fs:[eax],edx
 00547D9D    push        547DB2
 00547DA2    lea         eax,[ebp-4]
 00547DA5    call        @IntfClear
 00547DAA    ret
>00547DAB    jmp         @HandleFinally
>00547DB0    jmp         00547DA2
 00547DB2    pop         edi
 00547DB3    pop         esi
 00547DB4    pop         ebx
 00547DB5    pop         ecx
 00547DB6    pop         ebp
 00547DB7    ret
end;*}

//00547DB8
{*procedure TJclEnumerationTypeInfo.GetUnitName(?:?);
begin
 00547DB8    push        ebp
 00547DB9    mov         ebp,esp
 00547DBB    push        0
 00547DBD    push        ebx
 00547DBE    push        esi
 00547DBF    push        edi
 00547DC0    mov         edi,edx
 00547DC2    mov         ebx,eax
 00547DC4    xor         eax,eax
 00547DC6    push        ebp
 00547DC7    push        547E50
 00547DCC    push        dword ptr fs:[eax]
 00547DCF    mov         dword ptr fs:[eax],esp
 00547DD2    lea         edx,[ebp-4]
 00547DD5    mov         eax,ebx
 00547DD7    call        TJclEnumerationTypeInfo.GetBaseType
 00547DDC    mov         eax,dword ptr [ebp-4]
 00547DDF    mov         edx,dword ptr [eax]
 00547DE1    call        dword ptr [edx+1C]
 00547DE4    mov         esi,eax
 00547DE6    mov         eax,ebx
 00547DE8    call        TJclTypeInfo.GetTypeInfo
 00547DED    cmp         esi,eax
>00547DEF    jne         00547E29
 00547DF1    mov         eax,ebx
 00547DF3    call        TJclOrdinalRangeTypeInfo.GetMaxValue
 00547DF8    mov         esi,eax
 00547DFA    mov         eax,ebx
 00547DFC    call        TJclOrdinalRangeTypeInfo.GetMinValue
 00547E01    sub         esi,eax
 00547E03    mov         eax,ebx
 00547E05    call        TJclTypeInfo.GetTypeData
 00547E0A    add         eax,0D
 00547E0D    mov         ebx,eax
 00547E0F    test        esi,esi
>00547E11    jl          00547E1E
 00547E13    movzx       eax,byte ptr [ebx]
 00547E16    inc         eax
 00547E17    add         ebx,eax
 00547E19    dec         esi
 00547E1A    test        esi,esi
>00547E1C    jge         00547E13
 00547E1E    mov         eax,edi
 00547E20    mov         edx,ebx
 00547E22    call        @UStrFromString
>00547E27    jmp         00547E3A
 00547E29    mov         eax,ebx
 00547E2B    call        TJclTypeInfo.GetTypeData
 00547E30    lea         edx,[eax+0D]
 00547E33    mov         eax,edi
 00547E35    call        @UStrFromString
 00547E3A    xor         eax,eax
 00547E3C    pop         edx
 00547E3D    pop         ecx
 00547E3E    pop         ecx
 00547E3F    mov         dword ptr fs:[eax],edx
 00547E42    push        547E57
 00547E47    lea         eax,[ebp-4]
 00547E4A    call        @IntfClear
 00547E4F    ret
>00547E50    jmp         @HandleFinally
>00547E55    jmp         00547E47
 00547E57    pop         edi
 00547E58    pop         esi
 00547E59    pop         ebx
 00547E5A    pop         ecx
 00547E5B    pop         ebp
 00547E5C    ret
end;*}

//00547E60
function TJclEnumerationTypeInfo.IndexOfName(Name:string):Integer;
begin
{*
 00547E60    push        ebp
 00547E61    mov         ebp,esp
 00547E63    push        0
 00547E65    push        ebx
 00547E66    push        esi
 00547E67    push        edi
 00547E68    mov         edi,edx
 00547E6A    mov         esi,eax
 00547E6C    xor         eax,eax
 00547E6E    push        ebp
 00547E6F    push        547EF7
 00547E74    push        dword ptr fs:[eax]
 00547E77    mov         dword ptr fs:[eax],esp
 00547E7A    mov         eax,esi
 00547E7C    call        TJclOrdinalRangeTypeInfo.GetMaxValue
 00547E81    mov         ebx,eax
>00547E83    jmp         00547E86
 00547E85    dec         ebx
 00547E86    mov         eax,esi
 00547E88    call        TJclOrdinalRangeTypeInfo.GetMinValue
 00547E8D    push        edx
 00547E8E    push        eax
 00547E8F    mov         eax,ebx
 00547E91    cdq
 00547E92    cmp         edx,dword ptr [esp+4]
>00547E96    jne         00547EA1
 00547E98    cmp         eax,dword ptr [esp]
 00547E9B    pop         edx
 00547E9C    pop         eax
>00547E9D    jb          00547EBF
>00547E9F    jmp         00547EA5
 00547EA1    pop         edx
 00547EA2    pop         eax
>00547EA3    jl          00547EBF
 00547EA5    lea         ecx,[ebp-4]
 00547EA8    mov         edx,ebx
 00547EAA    mov         eax,esi
 00547EAC    call        TJclEnumerationTypeInfo.GetNames
 00547EB1    mov         edx,dword ptr [ebp-4]
 00547EB4    mov         eax,edi
 00547EB6    call        AnsiSameText
 00547EBB    test        al,al
>00547EBD    je          00547E85
 00547EBF    mov         eax,esi
 00547EC1    call        TJclOrdinalRangeTypeInfo.GetMinValue
 00547EC6    push        edx
 00547EC7    push        eax
 00547EC8    mov         eax,ebx
 00547ECA    cdq
 00547ECB    cmp         edx,dword ptr [esp+4]
>00547ECF    jne         00547EDA
 00547ED1    cmp         eax,dword ptr [esp]
 00547ED4    pop         edx
 00547ED5    pop         eax
>00547ED6    jae         00547EE1
>00547ED8    jmp         00547EDE
 00547EDA    pop         edx
 00547EDB    pop         eax
>00547EDC    jge         00547EE1
 00547EDE    or          ebx,0FFFFFFFF
 00547EE1    xor         eax,eax
 00547EE3    pop         edx
 00547EE4    pop         ecx
 00547EE5    pop         ecx
 00547EE6    mov         dword ptr fs:[eax],edx
 00547EE9    push        547EFE
 00547EEE    lea         eax,[ebp-4]
 00547EF1    call        @UStrClr
 00547EF6    ret
>00547EF7    jmp         @HandleFinally
>00547EFC    jmp         00547EEE
 00547EFE    mov         eax,ebx
 00547F00    pop         edi
 00547F01    pop         esi
 00547F02    pop         ebx
 00547F03    pop         ecx
 00547F04    pop         ebp
 00547F05    ret
*}
end;

//00547F08
{*procedure sub_00547F08(?:?);
begin
 00547F08    push        ebp
 00547F09    mov         ebp,esp
 00547F0B    xor         ecx,ecx
 00547F0D    push        ecx
 00547F0E    push        ecx
 00547F0F    push        ecx
 00547F10    push        ecx
 00547F11    push        ecx
 00547F12    push        ecx
 00547F13    push        ecx
 00547F14    push        ecx
 00547F15    push        ebx
 00547F16    push        esi
 00547F17    mov         dword ptr [ebp-8],edx
 00547F1A    mov         esi,eax
 00547F1C    xor         eax,eax
 00547F1E    push        ebp
 00547F1F    push        54800B
 00547F24    push        dword ptr fs:[eax]
 00547F27    mov         dword ptr fs:[eax],esp
 00547F2A    mov         edx,dword ptr [ebp-8]
 00547F2D    mov         eax,esi
 00547F2F    call        005479B4
 00547F34    lea         edx,[ebp-10]
 00547F37    mov         eax,[0078CDB8];^SResString453:TResStringRec
 00547F3C    call        LoadResString
 00547F41    lea         eax,[ebp-10]
 00547F44    push        eax
 00547F45    lea         edx,[ebp-14]
 00547F48    mov         eax,esi
 00547F4A    call        TJclEnumerationTypeInfo.GetUnitName
 00547F4F    mov         edx,dword ptr [ebp-14]
 00547F52    pop         eax
 00547F53    call        @UStrCat
 00547F58    mov         edx,dword ptr [ebp-10]
 00547F5B    mov         eax,dword ptr [ebp-8]
 00547F5E    mov         ecx,dword ptr [eax]
 00547F60    call        dword ptr [ecx+18]
 00547F63    lea         edx,[ebp-18]
 00547F66    mov         eax,[0078CEE4];^SResString449:TResStringRec
 00547F6B    call        LoadResString
 00547F70    mov         edx,dword ptr [ebp-18]
 00547F73    mov         eax,dword ptr [ebp-8]
 00547F76    mov         ecx,dword ptr [eax]
 00547F78    call        dword ptr [ecx+14]
 00547F7B    lea         eax,[ebp-4]
 00547F7E    mov         edx,548024;'('
 00547F83    call        @UStrLAsg
 00547F88    mov         eax,esi
 00547F8A    call        TJclOrdinalRangeTypeInfo.GetMinValue
 00547F8F    push        eax
 00547F90    mov         eax,esi
 00547F92    call        TJclOrdinalRangeTypeInfo.GetMaxValue
 00547F97    mov         ebx,eax
 00547F99    pop         eax
 00547F9A    sub         ebx,eax
>00547F9C    jl          00547FDB
 00547F9E    inc         ebx
 00547F9F    mov         dword ptr [ebp-0C],eax
 00547FA2    lea         ecx,[ebp-20]
 00547FA5    mov         edx,dword ptr [ebp-0C]
 00547FA8    mov         eax,esi
 00547FAA    call        TJclEnumerationTypeInfo.GetNames
 00547FAF    mov         ecx,dword ptr [ebp-20]
 00547FB2    lea         eax,[ebp-1C]
 00547FB5    mov         edx,dword ptr [ebp-4]
 00547FB8    call        @UStrCat3
 00547FBD    mov         edx,dword ptr [ebp-1C]
 00547FC0    mov         eax,dword ptr [ebp-8]
 00547FC3    mov         ecx,dword ptr [eax]
 00547FC5    call        dword ptr [ecx+14]
 00547FC8    lea         eax,[ebp-4]
 00547FCB    mov         edx,548034;', '
 00547FD0    call        @UStrLAsg
 00547FD5    inc         dword ptr [ebp-0C]
 00547FD8    dec         ebx
>00547FD9    jne         00547FA2
 00547FDB    mov         edx,548048;')'
 00547FE0    mov         eax,dword ptr [ebp-8]
 00547FE3    mov         ecx,dword ptr [eax]
 00547FE5    call        dword ptr [ecx+18]
 00547FE8    xor         eax,eax
 00547FEA    pop         edx
 00547FEB    pop         ecx
 00547FEC    pop         ecx
 00547FED    mov         dword ptr fs:[eax],edx
 00547FF0    push        548012
 00547FF5    lea         eax,[ebp-20]
 00547FF8    mov         edx,5
 00547FFD    call        @UStrArrayClr
 00548002    lea         eax,[ebp-4]
 00548005    call        @UStrClr
 0054800A    ret
>0054800B    jmp         @HandleFinally
>00548010    jmp         00547FF5
 00548012    pop         esi
 00548013    pop         ebx
 00548014    mov         esp,ebp
 00548016    pop         ebp
 00548017    ret
end;*}

//0054804C
{*procedure sub_0054804C(?:?);
begin
 0054804C    push        ebp
 0054804D    mov         ebp,esp
 0054804F    mov         ecx,7
 00548054    push        0
 00548056    push        0
 00548058    dec         ecx
>00548059    jne         00548054
 0054805B    push        ebx
 0054805C    push        esi
 0054805D    push        edi
 0054805E    mov         esi,edx
 00548060    mov         ebx,eax
 00548062    xor         eax,eax
 00548064    push        ebp
 00548065    push        548206
 0054806A    push        dword ptr fs:[eax]
 0054806D    mov         dword ptr fs:[eax],esp
 00548070    lea         edx,[ebp-10]
 00548073    mov         eax,ebx
 00548075    call        TJclTypeInfo.GetName
 0054807A    mov         eax,dword ptr [ebp-10]
 0054807D    cmp         word ptr [eax],2E
>00548081    je          005480A4
 00548083    lea         edx,[ebp-14]
 00548086    mov         eax,ebx
 00548088    call        TJclTypeInfo.GetName
 0054808D    lea         eax,[ebp-14]
 00548090    mov         edx,548220;' = '
 00548095    call        @UStrCat
 0054809A    mov         edx,dword ptr [ebp-14]
 0054809D    mov         eax,esi
 0054809F    mov         ecx,dword ptr [eax]
 005480A1    call        dword ptr [ecx+14]
 005480A4    lea         edx,[ebp-18]
 005480A7    mov         eax,ebx
 005480A9    call        TJclEnumerationTypeInfo.GetBaseType
 005480AE    mov         eax,dword ptr [ebp-18]
 005480B1    mov         edx,dword ptr [eax]
 005480B3    call        dword ptr [edx+1C]
 005480B6    mov         edi,eax
 005480B8    mov         eax,ebx
 005480BA    call        TJclTypeInfo.GetTypeInfo
 005480BF    cmp         edi,eax
>005480C1    jne         0054813A
 005480C3    mov         edx,548234;'('
 005480C8    mov         eax,esi
 005480CA    mov         ecx,dword ptr [eax]
 005480CC    call        dword ptr [ecx+14]
 005480CF    lea         eax,[ebp-4]
 005480D2    call        @UStrClr
 005480D7    mov         eax,ebx
 005480D9    call        TJclOrdinalRangeTypeInfo.GetMinValue
 005480DE    push        eax
 005480DF    mov         eax,ebx
 005480E1    call        TJclOrdinalRangeTypeInfo.GetMaxValue
 005480E6    pop         edx
 005480E7    sub         eax,edx
>005480E9    jl          0054812C
 005480EB    inc         eax
 005480EC    mov         dword ptr [ebp-0C],eax
 005480EF    mov         dword ptr [ebp-8],edx
 005480F2    lea         ecx,[ebp-20]
 005480F5    mov         edx,dword ptr [ebp-8]
 005480F8    mov         eax,ebx
 005480FA    call        TJclEnumerationTypeInfo.GetNames
 005480FF    mov         ecx,dword ptr [ebp-20]
 00548102    lea         eax,[ebp-1C]
 00548105    mov         edx,dword ptr [ebp-4]
 00548108    call        @UStrCat3
 0054810D    mov         edx,dword ptr [ebp-1C]
 00548110    mov         eax,esi
 00548112    mov         ecx,dword ptr [eax]
 00548114    call        dword ptr [ecx+14]
 00548117    lea         eax,[ebp-4]
 0054811A    mov         edx,548244;', '
 0054811F    call        @UStrLAsg
 00548124    inc         dword ptr [ebp-8]
 00548127    dec         dword ptr [ebp-0C]
>0054812A    jne         005480F2
 0054812C    mov         edx,548258;')'
 00548131    mov         eax,esi
 00548133    mov         ecx,dword ptr [eax]
 00548135    call        dword ptr [ecx+14]
>00548138    jmp         00548182
 0054813A    mov         eax,ebx
 0054813C    call        TJclOrdinalRangeTypeInfo.GetMinValue
 00548141    mov         edx,eax
 00548143    lea         ecx,[ebp-28]
 00548146    mov         eax,ebx
 00548148    call        TJclEnumerationTypeInfo.GetNames
 0054814D    push        dword ptr [ebp-28]
 00548150    push        548268;' .. '
 00548155    mov         eax,ebx
 00548157    call        TJclOrdinalRangeTypeInfo.GetMaxValue
 0054815C    mov         edx,eax
 0054815E    lea         ecx,[ebp-2C]
 00548161    mov         eax,ebx
 00548163    call        TJclEnumerationTypeInfo.GetNames
 00548168    push        dword ptr [ebp-2C]
 0054816B    lea         eax,[ebp-24]
 0054816E    mov         edx,3
 00548173    call        @UStrCatN
 00548178    mov         edx,dword ptr [ebp-24]
 0054817B    mov         eax,esi
 0054817D    mov         ecx,dword ptr [eax]
 0054817F    call        dword ptr [ecx+14]
 00548182    lea         edx,[ebp-30]
 00548185    mov         eax,ebx
 00548187    call        TJclTypeInfo.GetName
 0054818C    mov         eax,dword ptr [ebp-30]
 0054818F    cmp         word ptr [eax],2E
>00548193    je          005481CE
 00548195    mov         eax,ebx
 00548197    call        TJclTypeInfo.GetTypeData
 0054819C    mov         edx,eax
 0054819E    lea         ecx,[ebp-38]
 005481A1    mov         eax,[00435F84];TOrdType
 005481A6    call        0054BEEC
 005481AB    mov         ecx,dword ptr [ebp-38]
 005481AE    lea         eax,[ebp-34]
 005481B1    mov         edx,548280;'; // '
 005481B6    call        @UStrCat3
 005481BB    mov         edx,dword ptr [ebp-34]
 005481BE    mov         eax,esi
 005481C0    mov         ecx,dword ptr [eax]
 005481C2    call        dword ptr [ecx+14]
 005481C5    xor         edx,edx
 005481C7    mov         eax,esi
 005481C9    mov         ecx,dword ptr [eax]
 005481CB    call        dword ptr [ecx+18]
 005481CE    xor         eax,eax
 005481D0    pop         edx
 005481D1    pop         ecx
 005481D2    pop         ecx
 005481D3    mov         dword ptr fs:[eax],edx
 005481D6    push        54820D
 005481DB    lea         eax,[ebp-38]
 005481DE    mov         edx,8
 005481E3    call        @UStrArrayClr
 005481E8    lea         eax,[ebp-18]
 005481EB    call        @IntfClear
 005481F0    lea         eax,[ebp-14]
 005481F3    mov         edx,2
 005481F8    call        @UStrArrayClr
 005481FD    lea         eax,[ebp-4]
 00548200    call        @UStrClr
 00548205    ret
>00548206    jmp         @HandleFinally
>0054820B    jmp         005481DB
 0054820D    pop         edi
 0054820E    pop         esi
 0054820F    pop         ebx
 00548210    mov         esp,ebp
 00548212    pop         ebp
 00548213    ret
end;*}

//0054828C
{*procedure TJclSetTypeInfo.GetBaseType(?:?);
begin
 0054828C    push        ebp
 0054828D    mov         ebp,esp
 0054828F    push        0
 00548291    push        ebx
 00548292    push        esi
 00548293    mov         esi,edx
 00548295    mov         ebx,eax
 00548297    xor         eax,eax
 00548299    push        ebp
 0054829A    push        5482DE
 0054829F    push        dword ptr fs:[eax]
 005482A2    mov         dword ptr fs:[eax],esp
 005482A5    mov         eax,ebx
 005482A7    call        TJclTypeInfo.GetTypeData
 005482AC    mov         eax,dword ptr [eax+1]
 005482AF    mov         eax,dword ptr [eax]
 005482B1    lea         edx,[ebp-4]
 005482B4    call        0054BBB0
 005482B9    mov         edx,dword ptr [ebp-4]
 005482BC    mov         eax,esi
 005482BE    mov         ecx,5482EC;['{7DAD5221-46EA-11D5-B0C0-4854E825F345}']
 005482C3    call        @IntfCast
 005482C8    xor         eax,eax
 005482CA    pop         edx
 005482CB    pop         ecx
 005482CC    pop         ecx
 005482CD    mov         dword ptr fs:[eax],edx
 005482D0    push        5482E5
 005482D5    lea         eax,[ebp-4]
 005482D8    call        @IntfClear
 005482DD    ret
>005482DE    jmp         @HandleFinally
>005482E3    jmp         005482D5
 005482E5    pop         esi
 005482E6    pop         ebx
 005482E7    pop         ecx
 005482E8    pop         ebp
 005482E9    ret
end;*}

//005482FC
{*procedure sub_005482FC(?:?);
begin
 005482FC    push        ebp
 005482FD    mov         ebp,esp
 005482FF    mov         ecx,8
 00548304    push        0
 00548306    push        0
 00548308    dec         ecx
>00548309    jne         00548304
 0054830B    push        ecx
 0054830C    push        ebx
 0054830D    push        esi
 0054830E    mov         ebx,dword ptr [ebp+8]
 00548311    add         ebx,0FFFFFFF4
 00548314    xor         eax,eax
 00548316    push        ebp
 00548317    push        548519
 0054831C    push        dword ptr fs:[eax]
 0054831F    mov         dword ptr fs:[eax],esp
 00548322    mov         eax,dword ptr [ebx]
 00548324    mov         edx,dword ptr [eax]
 00548326    call        dword ptr [edx+28]
 00548329    push        edx
 0054832A    push        eax
 0054832B    mov         eax,dword ptr [ebp+8]
 0054832E    mov         eax,dword ptr [eax-4]
 00548331    mov         edx,dword ptr [ebp+8]
 00548334    movzx       edx,byte ptr [edx-5]
 00548338    sub         eax,edx
 0054833A    cdq
 0054833B    add         eax,dword ptr [esp]
 0054833E    adc         edx,dword ptr [esp+4]
 00548342    add         esp,8
 00548345    mov         dword ptr [ebp-8],eax
 00548348    mov         dword ptr [ebp-4],edx
 0054834B    mov         eax,dword ptr [ebx]
 0054834D    mov         edx,dword ptr [eax]
 0054834F    call        dword ptr [edx+28]
 00548352    push        edx
 00548353    push        eax
 00548354    mov         eax,dword ptr [ebp+8]
 00548357    movzx       eax,byte ptr [eax-0D]
 0054835B    dec         eax
 0054835C    mov         edx,dword ptr [ebp+8]
 0054835F    movzx       edx,byte ptr [edx-5]
 00548363    sub         eax,edx
 00548365    cdq
 00548366    add         eax,dword ptr [esp]
 00548369    adc         edx,dword ptr [esp+4]
 0054836D    add         esp,8
 00548370    mov         dword ptr [ebp-10],eax
 00548373    mov         dword ptr [ebp-0C],edx
 00548376    mov         eax,dword ptr [ebp+8]
 00548379    cmp         byte ptr [eax-0E],0
>0054837D    je          0054844B
 00548383    mov         eax,dword ptr [ebp-10]
 00548386    mov         edx,dword ptr [ebp-0C]
 00548389    cmp         edx,dword ptr [ebp-4]
>0054838C    jne         00548391
 0054838E    cmp         eax,dword ptr [ebp-8]
>00548391    je          0054844B
 00548397    mov         eax,dword ptr [ebx]
 00548399    mov         edx,dword ptr [eax]
 0054839B    call        dword ptr [edx+20]
 0054839E    cmp         al,3
>005483A0    jne         00548407
 005483A2    lea         eax,[ebp-24]
 005483A5    mov         edx,dword ptr [ebx]
 005483A7    mov         ecx,548528;['{7DAD5223-46EA-11D5-B0C0-4854E825F345}']
 005483AC    call        @IntfCast
 005483B1    mov         eax,dword ptr [ebp-24]
 005483B4    lea         ecx,[ebp-20]
 005483B7    mov         edx,dword ptr [ebp-8]
 005483BA    mov         esi,dword ptr [eax]
 005483BC    call        dword ptr [esi+34]
 005483BF    push        dword ptr [ebp-20]
 005483C2    push        548544;' .. '
 005483C7    lea         eax,[ebp-2C]
 005483CA    mov         edx,dword ptr [ebx]
 005483CC    mov         ecx,548528;['{7DAD5223-46EA-11D5-B0C0-4854E825F345}']
 005483D1    call        @IntfCast
 005483D6    mov         eax,dword ptr [ebp-2C]
 005483D9    lea         ecx,[ebp-28]
 005483DC    mov         edx,dword ptr [ebp-10]
 005483DF    mov         ebx,dword ptr [eax]
 005483E1    call        dword ptr [ebx+34]
 005483E4    push        dword ptr [ebp-28]
 005483E7    lea         eax,[ebp-1C]
 005483EA    mov         edx,3
 005483EF    call        @UStrCatN
 005483F4    mov         edx,dword ptr [ebp-1C]
 005483F7    mov         eax,dword ptr [ebp+8]
 005483FA    mov         eax,dword ptr [eax+8]
 005483FD    mov         ecx,dword ptr [eax]
 005483FF    call        dword ptr [ecx+38]
>00548402    jmp         005484C9
 00548407    push        dword ptr [ebp-4]
 0054840A    push        dword ptr [ebp-8]
 0054840D    lea         eax,[ebp-34]
 00548410    call        IntToStr
 00548415    push        dword ptr [ebp-34]
 00548418    push        548544;' .. '
 0054841D    push        dword ptr [ebp-0C]
 00548420    push        dword ptr [ebp-10]
 00548423    lea         eax,[ebp-38]
 00548426    call        IntToStr
 0054842B    push        dword ptr [ebp-38]
 0054842E    lea         eax,[ebp-30]
 00548431    mov         edx,3
 00548436    call        @UStrCatN
 0054843B    mov         edx,dword ptr [ebp-30]
 0054843E    mov         eax,dword ptr [ebp+8]
 00548441    mov         eax,dword ptr [eax+8]
 00548444    mov         ecx,dword ptr [eax]
 00548446    call        dword ptr [ecx+38]
>00548449    jmp         005484C9
 0054844B    mov         eax,dword ptr [ebp-8]
 0054844E    mov         dword ptr [ebp-18],eax
 00548451    mov         eax,dword ptr [ebp-4]
 00548454    mov         dword ptr [ebp-14],eax
>00548457    jmp         005484B5
 00548459    mov         eax,dword ptr [ebx]
 0054845B    mov         edx,dword ptr [eax]
 0054845D    call        dword ptr [edx+20]
 00548460    cmp         al,3
>00548462    jne         00548491
 00548464    lea         eax,[ebp-40]
 00548467    mov         edx,dword ptr [ebx]
 00548469    mov         ecx,548528;['{7DAD5223-46EA-11D5-B0C0-4854E825F345}']
 0054846E    call        @IntfCast
 00548473    mov         eax,dword ptr [ebp-40]
 00548476    lea         ecx,[ebp-3C]
 00548479    mov         edx,dword ptr [ebp-18]
 0054847C    mov         esi,dword ptr [eax]
 0054847E    call        dword ptr [esi+34]
 00548481    mov         edx,dword ptr [ebp-3C]
 00548484    mov         eax,dword ptr [ebp+8]
 00548487    mov         eax,dword ptr [eax+8]
 0054848A    mov         ecx,dword ptr [eax]
 0054848C    call        dword ptr [ecx+38]
>0054848F    jmp         005484AD
 00548491    push        dword ptr [ebp-14]
 00548494    push        dword ptr [ebp-18]
 00548497    lea         eax,[ebp-44]
 0054849A    call        IntToStr
 0054849F    mov         edx,dword ptr [ebp-44]
 005484A2    mov         eax,dword ptr [ebp+8]
 005484A5    mov         eax,dword ptr [eax+8]
 005484A8    mov         ecx,dword ptr [eax]
 005484AA    call        dword ptr [ecx+38]
 005484AD    add         dword ptr [ebp-18],1
 005484B1    adc         dword ptr [ebp-14],0
 005484B5    mov         eax,dword ptr [ebp-18]
 005484B8    mov         edx,dword ptr [ebp-14]
 005484BB    cmp         edx,dword ptr [ebp-0C]
>005484BE    jne         005484C7
 005484C0    cmp         eax,dword ptr [ebp-10]
>005484C3    jbe         00548459
>005484C5    jmp         005484C9
>005484C7    jle         00548459
 005484C9    xor         eax,eax
 005484CB    pop         edx
 005484CC    pop         ecx
 005484CD    pop         ecx
 005484CE    mov         dword ptr fs:[eax],edx
 005484D1    push        548520
 005484D6    lea         eax,[ebp-44]
 005484D9    call        @UStrClr
 005484DE    lea         eax,[ebp-40]
 005484E1    call        @IntfClear
 005484E6    lea         eax,[ebp-3C]
 005484E9    mov         edx,4
 005484EE    call        @UStrArrayClr
 005484F3    lea         eax,[ebp-2C]
 005484F6    call        @IntfClear
 005484FB    lea         eax,[ebp-28]
 005484FE    call        @UStrClr
 00548503    lea         eax,[ebp-24]
 00548506    call        @IntfClear
 0054850B    lea         eax,[ebp-20]
 0054850E    mov         edx,2
 00548513    call        @UStrArrayClr
 00548518    ret
>00548519    jmp         @HandleFinally
>0054851E    jmp         005484D6
 00548520    pop         esi
 00548521    pop         ebx
 00548522    mov         esp,ebp
 00548524    pop         ebp
 00548525    ret
end;*}

//00548550
{*procedure TJclSetTypeInfo.GetAsList(Value:?; WantRanges:Boolean; Strings:TStrings);
begin
 00548550    push        ebp
 00548551    mov         ebp,esp
 00548553    add         esp,0FFFFFFEC
 00548556    push        ebx
 00548557    push        esi
 00548558    push        edi
 00548559    xor         ebx,ebx
 0054855B    mov         dword ptr [ebp-14],ebx
 0054855E    mov         dword ptr [ebp-0C],ebx
 00548561    mov         byte ptr [ebp-0E],cl
 00548564    mov         esi,edx
 00548566    mov         ebx,eax
 00548568    lea         edi,[ebp-0D]
 0054856B    xor         eax,eax
 0054856D    push        ebp
 0054856E    push        548663
 00548573    push        dword ptr fs:[eax]
 00548576    mov         dword ptr fs:[eax],esp
 00548579    lea         edx,[ebp-14]
 0054857C    mov         eax,ebx
 0054857E    call        TJclSetTypeInfo.GetBaseType
 00548583    mov         edx,dword ptr [ebp-14]
 00548586    lea         eax,[ebp-0C]
 00548589    mov         ecx,548674;['{7DAD5222-46EA-11D5-B0C0-4854E825F345}']
 0054858E    call        @IntfCast
 00548593    push        0
 00548595    push        8
 00548597    mov         eax,dword ptr [ebp-0C]
 0054859A    mov         edx,dword ptr [eax]
 0054859C    call        dword ptr [edx+28]
 0054859F    call        @_llmod
 005485A4    mov         byte ptr [ebp-5],al
 005485A7    mov         eax,dword ptr [ebp-0C]
 005485AA    mov         edx,dword ptr [eax]
 005485AC    call        dword ptr [edx+2C]
 005485AF    mov         ebx,eax
 005485B1    mov         eax,dword ptr [ebp-0C]
 005485B4    mov         edx,dword ptr [eax]
 005485B6    call        dword ptr [edx+28]
 005485B9    sub         al,byte ptr [ebp-5]
 005485BC    sub         bl,al
 005485BE    movzx       eax,byte ptr [ebp-5]
 005485C2    mov         byte ptr [edi],al
 005485C4    mov         dword ptr [ebp-4],0FFFFFFFF
 005485CB    mov         eax,dword ptr [ebp+8]
 005485CE    call        TStrings.BeginUpdate
 005485D3    xor         eax,eax
 005485D5    push        ebp
 005485D6    push        54863E
 005485DB    push        dword ptr fs:[eax]
 005485DE    mov         dword ptr fs:[eax],esp
 005485E1    cmp         bl,byte ptr [edi]
>005485E3    jb          0054861B
 005485E5    movzx       edx,byte ptr [edi]
 005485E8    mov         eax,esi
 005485EA    call        0053009C
 005485EF    test        al,al
>005485F1    je          00548601
 005485F3    cmp         dword ptr [ebp-4],0FFFFFFFF
>005485F7    jne         00548615
 005485F9    movzx       eax,byte ptr [edi]
 005485FC    mov         dword ptr [ebp-4],eax
>005485FF    jmp         00548615
 00548601    cmp         dword ptr [ebp-4],0FFFFFFFF
>00548605    je          00548615
 00548607    push        ebp
 00548608    call        005482FC
 0054860D    pop         ecx
 0054860E    mov         dword ptr [ebp-4],0FFFFFFFF
 00548615    inc         byte ptr [edi]
 00548617    cmp         bl,byte ptr [edi]
>00548619    jae         005485E5
 0054861B    cmp         dword ptr [ebp-4],0FFFFFFFF
>0054861F    je          00548628
 00548621    push        ebp
 00548622    call        005482FC
 00548627    pop         ecx
 00548628    xor         eax,eax
 0054862A    pop         edx
 0054862B    pop         ecx
 0054862C    pop         ecx
 0054862D    mov         dword ptr fs:[eax],edx
 00548630    push        548645
 00548635    mov         eax,dword ptr [ebp+8]
 00548638    call        TStrings.EndUpdate
 0054863D    ret
>0054863E    jmp         @HandleFinally
>00548643    jmp         00548635
 00548645    xor         eax,eax
 00548647    pop         edx
 00548648    pop         ecx
 00548649    pop         ecx
 0054864A    mov         dword ptr fs:[eax],edx
 0054864D    push        54866A
 00548652    lea         eax,[ebp-14]
 00548655    call        @IntfClear
 0054865A    lea         eax,[ebp-0C]
 0054865D    call        @IntfClear
 00548662    ret
>00548663    jmp         @HandleFinally
>00548668    jmp         00548652
 0054866A    pop         edi
 0054866B    pop         esi
 0054866C    pop         ebx
 0054866D    mov         esp,ebp
 0054866F    pop         ebp
 00548670    ret         4
end;*}

//00548684
{*procedure sub_00548684(?:?);
begin
 00548684    push        ebp
 00548685    mov         ebp,esp
 00548687    mov         eax,dword ptr [ebp+8]
 0054868A    mov         eax,dword ptr [eax-4]
 0054868D    mov         edx,dword ptr [eax]
 0054868F    call        dword ptr [edx+2C]
 00548692    push        eax
 00548693    mov         eax,dword ptr [ebp+8]
 00548696    mov         eax,dword ptr [eax-4]
 00548699    mov         edx,dword ptr [eax]
 0054869B    call        dword ptr [edx+28]
 0054869E    mov         edx,eax
 005486A0    pop         eax
 005486A1    sub         eax,edx
 005486A3    inc         eax
 005486A4    mov         edx,dword ptr [ebp+8]
 005486A7    add         eax,dword ptr [edx-8]
 005486AA    mov         edx,dword ptr [ebp+8]
 005486AD    push        dword ptr [edx-8]
 005486B0    mov         edx,eax
 005486B2    pop         ecx
 005486B3    sub         edx,ecx
 005486B5    test        edx,edx
>005486B7    jns         005486BC
 005486B9    add         edx,7
 005486BC    sar         edx,3
 005486BF    and         eax,80000007
>005486C4    jns         005486CB
 005486C6    dec         eax
 005486C7    or          eax,0FFFFFFF8
 005486CA    inc         eax
 005486CB    test        eax,eax
>005486CD    je          005486D0
 005486CF    inc         edx
 005486D0    mov         eax,dword ptr [ebp+8]
 005486D3    mov         eax,dword ptr [eax-0C]
 005486D6    call        0053D1EC
 005486DB    pop         ebp
 005486DC    ret
end;*}

//005486E0
{*procedure TJclSetTypeInfo.SetAsList(Value:?; Strings:TStrings);
begin
 005486E0    push        ebp
 005486E1    mov         ebp,esp
 005486E3    push        ecx
 005486E4    mov         ecx,0B
 005486E9    push        0
 005486EB    push        0
 005486ED    dec         ecx
>005486EE    jne         005486E9
 005486F0    push        ecx
 005486F1    xchg        ecx,dword ptr [ebp-4]
 005486F4    push        ebx
 005486F5    push        esi
 005486F6    mov         dword ptr [ebp-18],ecx
 005486F9    mov         dword ptr [ebp-0C],edx
 005486FC    mov         ebx,eax
 005486FE    xor         eax,eax
 00548700    push        ebp
 00548701    push        548998
 00548706    push        dword ptr fs:[eax]
 00548709    mov         dword ptr fs:[eax],esp
 0054870C    lea         edx,[ebp-38]
 0054870F    mov         eax,ebx
 00548711    call        TJclSetTypeInfo.GetBaseType
 00548716    mov         edx,dword ptr [ebp-38]
 00548719    lea         eax,[ebp-4]
 0054871C    mov         ecx,5489A8;['{7DAD5222-46EA-11D5-B0C0-4854E825F345}']
 00548721    call        @IntfCast
 00548726    push        0
 00548728    push        8
 0054872A    mov         eax,dword ptr [ebp-4]
 0054872D    mov         edx,dword ptr [eax]
 0054872F    call        dword ptr [edx+28]
 00548732    call        @_llmod
 00548737    mov         dword ptr [ebp-8],eax
 0054873A    push        ebp
 0054873B    call        00548684
 00548740    pop         ecx
 00548741    mov         eax,dword ptr [ebp-18]
 00548744    call        TStrings.BeginUpdate
 00548749    xor         eax,eax
 0054874B    push        ebp
 0054874C    push        548946
 00548751    push        dword ptr fs:[eax]
 00548754    mov         dword ptr fs:[eax],esp
 00548757    mov         eax,dword ptr [ebp-18]
 0054875A    mov         edx,dword ptr [eax]
 0054875C    call        dword ptr [edx+14];TStrings.GetCount
 0054875F    dec         eax
 00548760    test        eax,eax
>00548762    jl          00548930
 00548768    inc         eax
 00548769    mov         dword ptr [ebp-34],eax
 0054876C    mov         dword ptr [ebp-1C],0
 00548773    lea         ecx,[ebp-40]
 00548776    mov         edx,dword ptr [ebp-1C]
 00548779    mov         eax,dword ptr [ebp-18]
 0054877C    mov         ebx,dword ptr [eax]
 0054877E    call        dword ptr [ebx+0C];TStrings.Get
 00548781    mov         eax,dword ptr [ebp-40]
 00548784    lea         edx,[ebp-3C]
 00548787    call        Trim
 0054878C    cmp         dword ptr [ebp-3C],0
>00548790    je          00548924
 00548796    lea         ecx,[ebp-44]
 00548799    mov         edx,dword ptr [ebp-1C]
 0054879C    mov         eax,dword ptr [ebp-18]
 0054879F    mov         ebx,dword ptr [eax]
 005487A1    call        dword ptr [ebx+0C];TStrings.Get
 005487A4    mov         eax,dword ptr [ebp-44]
 005487A7    lea         edx,[ebp-10]
 005487AA    call        Trim
 005487AF    mov         edx,dword ptr [ebp-10]
 005487B2    mov         eax,5489C4;'..'
 005487B7    call        Pos
 005487BC    mov         ebx,eax
 005487BE    test        ebx,ebx
>005487C0    jle         00548807
 005487C2    lea         ecx,[ebp-48]
 005487C5    lea         edx,[ebx+2]
 005487C8    mov         eax,dword ptr [ebp-10]
 005487CB    call        005392D8
 005487D0    mov         eax,dword ptr [ebp-48]
 005487D3    lea         edx,[ebp-14]
 005487D6    call        Trim
 005487DB    lea         eax,[ebp-50]
 005487DE    push        eax
 005487DF    mov         ecx,ebx
 005487E1    dec         ecx
 005487E2    mov         edx,1
 005487E7    mov         eax,dword ptr [ebp-10]
 005487EA    call        @UStrCopy
 005487EF    mov         eax,dword ptr [ebp-50]
 005487F2    lea         edx,[ebp-4C]
 005487F5    call        Trim
 005487FA    mov         edx,dword ptr [ebp-4C]
 005487FD    lea         eax,[ebp-10]
 00548800    call        @UStrLAsg
>00548805    jmp         00548812
 00548807    lea         eax,[ebp-14]
 0054880A    mov         edx,dword ptr [ebp-10]
 0054880D    call        @UStrLAsg
 00548812    mov         eax,dword ptr [ebp-4]
 00548815    mov         edx,dword ptr [eax]
 00548817    call        dword ptr [edx+20]
 0054881A    cmp         al,3
>0054881C    jne         005488CE
 00548822    lea         eax,[ebp-54]
 00548825    mov         edx,dword ptr [ebp-4]
 00548828    mov         ecx,5489CC;['{7DAD5223-46EA-11D5-B0C0-4854E825F345}']
 0054882D    call        @IntfCast
 00548832    mov         eax,dword ptr [ebp-54]
 00548835    mov         edx,dword ptr [ebp-10]
 00548838    mov         ecx,dword ptr [eax]
 0054883A    call        dword ptr [ecx+3C]
 0054883D    cdq
 0054883E    mov         dword ptr [ebp-28],eax
 00548841    mov         dword ptr [ebp-24],edx
 00548844    lea         eax,[ebp-58]
 00548847    mov         edx,dword ptr [ebp-4]
 0054884A    mov         ecx,5489CC;['{7DAD5223-46EA-11D5-B0C0-4854E825F345}']
 0054884F    call        @IntfCast
 00548854    mov         eax,dword ptr [ebp-58]
 00548857    mov         edx,dword ptr [ebp-14]
 0054885A    mov         ecx,dword ptr [eax]
 0054885C    call        dword ptr [ecx+3C]
 0054885F    cdq
 00548860    mov         dword ptr [ebp-30],eax
 00548863    mov         dword ptr [ebp-2C],edx
 00548866    cmp         dword ptr [ebp-24],0FFFFFFFF
>0054886A    jne         00548899
 0054886C    cmp         dword ptr [ebp-28],0FFFFFFFF
>00548870    jne         00548899
 00548872    mov         eax,dword ptr [ebp-10]
 00548875    mov         dword ptr [ebp-60],eax
 00548878    mov         byte ptr [ebp-5C],11
 0054887C    lea         eax,[ebp-60]
 0054887F    push        eax
 00548880    push        0
 00548882    mov         ecx,dword ptr ds:[78D2F4];^SResString423:TResStringRec
 00548888    mov         dl,1
 0054888A    mov         eax,[0054743C];EJclRTTIError
 0054888F    call        Exception.CreateResFmt;EJclRTTIError.Create
 00548894    call        @RaiseExcept
 00548899    cmp         dword ptr [ebp-2C],0FFFFFFFF
>0054889D    jne         005488EC
 0054889F    cmp         dword ptr [ebp-30],0FFFFFFFF
>005488A3    jne         005488EC
 005488A5    mov         eax,dword ptr [ebp-14]
 005488A8    mov         dword ptr [ebp-60],eax
 005488AB    mov         byte ptr [ebp-5C],11
 005488AF    lea         eax,[ebp-60]
 005488B2    push        eax
 005488B3    push        0
 005488B5    mov         ecx,dword ptr ds:[78D2F4];^SResString423:TResStringRec
 005488BB    mov         dl,1
 005488BD    mov         eax,[0054743C];EJclRTTIError
 005488C2    call        Exception.CreateResFmt;EJclRTTIError.Create
 005488C7    call        @RaiseExcept
>005488CC    jmp         005488EC
 005488CE    mov         eax,dword ptr [ebp-10]
 005488D1    call        StrToInt
 005488D6    cdq
 005488D7    mov         dword ptr [ebp-28],eax
 005488DA    mov         dword ptr [ebp-24],edx
 005488DD    mov         eax,dword ptr [ebp-14]
 005488E0    call        StrToInt
 005488E5    cdq
 005488E6    mov         dword ptr [ebp-30],eax
 005488E9    mov         dword ptr [ebp-2C],edx
 005488EC    mov         eax,dword ptr [ebp-4]
 005488EF    mov         edx,dword ptr [eax]
 005488F1    call        dword ptr [edx+28]
 005488F4    sub         dword ptr [ebp-28],eax
 005488F7    sbb         dword ptr [ebp-24],edx
 005488FA    mov         eax,dword ptr [ebp-4]
 005488FD    mov         edx,dword ptr [eax]
 005488FF    call        dword ptr [edx+28]
 00548902    sub         dword ptr [ebp-30],eax
 00548905    sbb         dword ptr [ebp-2C],edx
 00548908    mov         esi,dword ptr [ebp-28]
 0054890B    mov         ebx,dword ptr [ebp-30]
 0054890E    sub         ebx,esi
>00548910    jl          00548924
 00548912    inc         ebx
 00548913    mov         edx,dword ptr [ebp-8]
 00548916    add         edx,esi
 00548918    mov         eax,dword ptr [ebp-0C]
 0054891B    call        00530098
 00548920    inc         esi
 00548921    dec         ebx
>00548922    jne         00548913
 00548924    inc         dword ptr [ebp-1C]
 00548927    dec         dword ptr [ebp-34]
>0054892A    jne         00548773
 00548930    xor         eax,eax
 00548932    pop         edx
 00548933    pop         ecx
 00548934    pop         ecx
 00548935    mov         dword ptr fs:[eax],edx
 00548938    push        54894D
 0054893D    mov         eax,dword ptr [ebp-18]
 00548940    call        TStrings.EndUpdate
 00548945    ret
>00548946    jmp         @HandleFinally
>0054894B    jmp         0054893D
 0054894D    xor         eax,eax
 0054894F    pop         edx
 00548950    pop         ecx
 00548951    pop         ecx
 00548952    mov         dword ptr fs:[eax],edx
 00548955    push        54899F
 0054895A    lea         eax,[ebp-58]
 0054895D    mov         edx,dword ptr ds:[544C54];IJclEnumerationTypeInfo
 00548963    mov         ecx,2
 00548968    call        @FinalizeArray
 0054896D    lea         eax,[ebp-50]
 00548970    mov         edx,6
 00548975    call        @UStrArrayClr
 0054897A    lea         eax,[ebp-38]
 0054897D    call        @IntfClear
 00548982    lea         eax,[ebp-14]
 00548985    mov         edx,2
 0054898A    call        @UStrArrayClr
 0054898F    lea         eax,[ebp-4]
 00548992    call        @IntfClear
 00548997    ret
>00548998    jmp         @HandleFinally
>0054899D    jmp         0054895A
 0054899F    pop         esi
 005489A0    pop         ebx
 005489A1    mov         esp,ebp
 005489A3    pop         ebp
 005489A4    ret
end;*}

//005489DC
{*procedure sub_005489DC(?:?);
begin
 005489DC    push        ebp
 005489DD    mov         ebp,esp
 005489DF    push        0
 005489E1    push        0
 005489E3    push        0
 005489E5    push        ebx
 005489E6    mov         dword ptr [ebp-4],edx
 005489E9    mov         ebx,eax
 005489EB    xor         eax,eax
 005489ED    push        ebp
 005489EE    push        548A81
 005489F3    push        dword ptr fs:[eax]
 005489F6    mov         dword ptr fs:[eax],esp
 005489F9    mov         edx,dword ptr [ebp-4]
 005489FC    mov         eax,ebx
 005489FE    call        005478A4
 00548A03    lea         edx,[ebp-8]
 00548A06    mov         eax,[0078D91C];^SResString454:TResStringRec
 00548A0B    call        LoadResString
 00548A10    mov         edx,dword ptr [ebp-8]
 00548A13    mov         eax,dword ptr [ebp-4]
 00548A16    mov         ecx,dword ptr [eax]
 00548A18    call        dword ptr [ecx+18]
 00548A1B    mov         eax,dword ptr [ebp-4]
 00548A1E    mov         edx,dword ptr [eax]
 00548A20    call        dword ptr [edx+1C]
 00548A23    xor         eax,eax
 00548A25    push        ebp
 00548A26    push        548A5C
 00548A2B    push        dword ptr fs:[eax]
 00548A2E    mov         dword ptr fs:[eax],esp
 00548A31    lea         edx,[ebp-0C]
 00548A34    mov         eax,ebx
 00548A36    call        TJclSetTypeInfo.GetBaseType
 00548A3B    mov         eax,dword ptr [ebp-0C]
 00548A3E    mov         edx,dword ptr [ebp-4]
 00548A41    mov         ecx,dword ptr [eax]
 00548A43    call        dword ptr [ecx+0C]
 00548A46    xor         eax,eax
 00548A48    pop         edx
 00548A49    pop         ecx
 00548A4A    pop         ecx
 00548A4B    mov         dword ptr fs:[eax],edx
 00548A4E    push        548A63
 00548A53    mov         eax,dword ptr [ebp-4]
 00548A56    mov         edx,dword ptr [eax]
 00548A58    call        dword ptr [edx+20]
 00548A5B    ret
>00548A5C    jmp         @HandleFinally
>00548A61    jmp         00548A53
 00548A63    xor         eax,eax
 00548A65    pop         edx
 00548A66    pop         ecx
 00548A67    pop         ecx
 00548A68    mov         dword ptr fs:[eax],edx
 00548A6B    push        548A88
 00548A70    lea         eax,[ebp-0C]
 00548A73    call        @IntfClear
 00548A78    lea         eax,[ebp-8]
 00548A7B    call        @UStrClr
 00548A80    ret
>00548A81    jmp         @HandleFinally
>00548A86    jmp         00548A70
 00548A88    pop         ebx
 00548A89    mov         esp,ebp
 00548A8B    pop         ebp
 00548A8C    ret
end;*}

//00548A90
{*procedure sub_00548A90(?:?);
begin
 00548A90    push        ebp
 00548A91    mov         ebp,esp
 00548A93    mov         ecx,5
 00548A98    push        0
 00548A9A    push        0
 00548A9C    dec         ecx
>00548A9D    jne         00548A98
 00548A9F    push        ebx
 00548AA0    push        esi
 00548AA1    mov         esi,edx
 00548AA3    mov         ebx,eax
 00548AA5    xor         eax,eax
 00548AA7    push        ebp
 00548AA8    push        548BD0
 00548AAD    push        dword ptr fs:[eax]
 00548AB0    mov         dword ptr fs:[eax],esp
 00548AB3    lea         edx,[ebp-0C]
 00548AB6    mov         eax,ebx
 00548AB8    call        TJclTypeInfo.GetName
 00548ABD    mov         eax,dword ptr [ebp-0C]
 00548AC0    cmp         word ptr [eax],2E
>00548AC4    je          00548AE7
 00548AC6    lea         edx,[ebp-10]
 00548AC9    mov         eax,ebx
 00548ACB    call        TJclTypeInfo.GetName
 00548AD0    lea         eax,[ebp-10]
 00548AD3    mov         edx,548BEC;' = set of '
 00548AD8    call        @UStrCat
 00548ADD    mov         edx,dword ptr [ebp-10]
 00548AE0    mov         eax,esi
 00548AE2    mov         ecx,dword ptr [eax]
 00548AE4    call        dword ptr [ecx+14]
 00548AE7    lea         edx,[ebp-4]
 00548AEA    mov         eax,ebx
 00548AEC    call        TJclSetTypeInfo.GetBaseType
 00548AF1    lea         edx,[ebp-14]
 00548AF4    mov         eax,dword ptr [ebp-4]
 00548AF7    mov         ecx,dword ptr [eax]
 00548AF9    call        dword ptr [ecx+14]
 00548AFC    mov         eax,dword ptr [ebp-14]
 00548AFF    cmp         word ptr [eax],2E
>00548B03    jne         00548B44
 00548B05    lea         eax,[ebp-8]
 00548B08    call        @IntfClear
 00548B0D    push        eax
 00548B0E    push        548C04
 00548B13    mov         eax,dword ptr [ebp-4]
 00548B16    push        eax
 00548B17    mov         eax,dword ptr [eax]
 00548B19    call        dword ptr [eax]
 00548B1B    test        eax,eax
>00548B1D    jne         00548B2B
 00548B1F    mov         edx,esi
 00548B21    mov         eax,dword ptr [ebp-8]
 00548B24    mov         ecx,dword ptr [eax]
 00548B26    call        dword ptr [ecx+10]
>00548B29    jmp         00548B59
 00548B2B    lea         edx,[ebp-18]
 00548B2E    mov         eax,[0078D514];^SResString431:TResStringRec
 00548B33    call        LoadResString
 00548B38    mov         edx,dword ptr [ebp-18]
 00548B3B    mov         eax,esi
 00548B3D    mov         ecx,dword ptr [eax]
 00548B3F    call        dword ptr [ecx+14]
>00548B42    jmp         00548B59
 00548B44    lea         edx,[ebp-1C]
 00548B47    mov         eax,dword ptr [ebp-4]
 00548B4A    mov         ecx,dword ptr [eax]
 00548B4C    call        dword ptr [ecx+14]
 00548B4F    mov         edx,dword ptr [ebp-1C]
 00548B52    mov         eax,esi
 00548B54    mov         ecx,dword ptr [eax]
 00548B56    call        dword ptr [ecx+14]
 00548B59    lea         edx,[ebp-20]
 00548B5C    mov         eax,ebx
 00548B5E    call        TJclTypeInfo.GetName
 00548B63    mov         eax,dword ptr [ebp-20]
 00548B66    cmp         word ptr [eax],2E
>00548B6A    je          00548BA5
 00548B6C    mov         eax,ebx
 00548B6E    call        TJclTypeInfo.GetTypeData
 00548B73    mov         edx,eax
 00548B75    lea         ecx,[ebp-28]
 00548B78    mov         eax,[00435F84];TOrdType
 00548B7D    call        0054BEEC
 00548B82    mov         ecx,dword ptr [ebp-28]
 00548B85    lea         eax,[ebp-24]
 00548B88    mov         edx,548C20;'; // '
 00548B8D    call        @UStrCat3
 00548B92    mov         edx,dword ptr [ebp-24]
 00548B95    mov         eax,esi
 00548B97    mov         ecx,dword ptr [eax]
 00548B99    call        dword ptr [ecx+14]
 00548B9C    xor         edx,edx
 00548B9E    mov         eax,esi
 00548BA0    mov         ecx,dword ptr [eax]
 00548BA2    call        dword ptr [ecx+18]
 00548BA5    xor         eax,eax
 00548BA7    pop         edx
 00548BA8    pop         ecx
 00548BA9    pop         ecx
 00548BAA    mov         dword ptr fs:[eax],edx
 00548BAD    push        548BD7
 00548BB2    lea         eax,[ebp-28]
 00548BB5    mov         edx,8
 00548BBA    call        @UStrArrayClr
 00548BBF    lea         eax,[ebp-8]
 00548BC2    call        @IntfClear
 00548BC7    lea         eax,[ebp-4]
 00548BCA    call        @IntfClear
 00548BCF    ret
>00548BD0    jmp         @HandleFinally
>00548BD5    jmp         00548BB2
 00548BD7    pop         esi
 00548BD8    pop         ebx
 00548BD9    mov         esp,ebp
 00548BDB    pop         ebp
 00548BDC    ret
end;*}

//00548C2C
function TJclFloatTypeInfo.GetFloatType:TFloatType;
begin
{*
 00548C2C    push        ebx
 00548C2D    mov         ebx,eax
 00548C2F    mov         eax,ebx
 00548C31    call        TJclTypeInfo.GetTypeData
 00548C36    movzx       eax,byte ptr [eax]
 00548C39    pop         ebx
 00548C3A    ret
*}
end;

//00548C3C
{*procedure sub_00548C3C(?:?);
begin
 00548C3C    push        ebp
 00548C3D    mov         ebp,esp
 00548C3F    push        0
 00548C41    push        0
 00548C43    push        ebx
 00548C44    push        esi
 00548C45    mov         esi,edx
 00548C47    mov         ebx,eax
 00548C49    xor         eax,eax
 00548C4B    push        ebp
 00548C4C    push        548CB5
 00548C51    push        dword ptr fs:[eax]
 00548C54    mov         dword ptr fs:[eax],esp
 00548C57    mov         edx,esi
 00548C59    mov         eax,ebx
 00548C5B    call        0054771C
 00548C60    lea         edx,[ebp-4]
 00548C63    mov         eax,[0078D288];^SResString455:TResStringRec
 00548C68    call        LoadResString
 00548C6D    lea         eax,[ebp-4]
 00548C70    push        eax
 00548C71    mov         eax,ebx
 00548C73    call        TJclTypeInfo.GetTypeData
 00548C78    mov         edx,eax
 00548C7A    lea         ecx,[ebp-8]
 00548C7D    mov         eax,[00435FDC];TFloatType
 00548C82    call        0054BEEC
 00548C87    mov         edx,dword ptr [ebp-8]
 00548C8A    pop         eax
 00548C8B    call        @UStrCat
 00548C90    mov         edx,dword ptr [ebp-4]
 00548C93    mov         eax,esi
 00548C95    mov         ecx,dword ptr [eax]
 00548C97    call        dword ptr [ecx+18]
 00548C9A    xor         eax,eax
 00548C9C    pop         edx
 00548C9D    pop         ecx
 00548C9E    pop         ecx
 00548C9F    mov         dword ptr fs:[eax],edx
 00548CA2    push        548CBC
 00548CA7    lea         eax,[ebp-8]
 00548CAA    mov         edx,2
 00548CAF    call        @UStrArrayClr
 00548CB4    ret
>00548CB5    jmp         @HandleFinally
>00548CBA    jmp         00548CA7
 00548CBC    pop         esi
 00548CBD    pop         ebx
 00548CBE    pop         ecx
 00548CBF    pop         ecx
 00548CC0    pop         ebp
 00548CC1    ret
end;*}

//00548CC4
{*procedure sub_00548CC4(?:?);
begin
 00548CC4    push        ebp
 00548CC5    mov         ebp,esp
 00548CC7    xor         ecx,ecx
 00548CC9    push        ecx
 00548CCA    push        ecx
 00548CCB    push        ecx
 00548CCC    push        ecx
 00548CCD    push        ecx
 00548CCE    push        ebx
 00548CCF    push        esi
 00548CD0    mov         esi,edx
 00548CD2    mov         ebx,eax
 00548CD4    xor         eax,eax
 00548CD6    push        ebp
 00548CD7    push        548D60
 00548CDC    push        dword ptr fs:[eax]
 00548CDF    mov         dword ptr fs:[eax],esp
 00548CE2    mov         eax,ebx
 00548CE4    call        TJclFloatTypeInfo.GetFloatType
 00548CE9    mov         byte ptr [ebp-5],al
 00548CEC    lea         ecx,[ebp-0C]
 00548CEF    lea         edx,[ebp-5]
 00548CF2    mov         eax,[00435FDC];TFloatType
 00548CF7    call        0054BEEC
 00548CFC    mov         eax,dword ptr [ebp-0C]
 00548CFF    lea         ecx,[ebp-4]
 00548D02    mov         edx,3
 00548D07    call        005392D8
 00548D0C    lea         edx,[ebp-14]
 00548D0F    mov         eax,ebx
 00548D11    call        TJclTypeInfo.GetName
 00548D16    push        dword ptr [ebp-14]
 00548D19    push        548D7C;' = type '
 00548D1E    push        dword ptr [ebp-4]
 00548D21    push        548D9C;';'
 00548D26    lea         eax,[ebp-10]
 00548D29    mov         edx,4
 00548D2E    call        @UStrCatN
 00548D33    mov         edx,dword ptr [ebp-10]
 00548D36    mov         eax,esi
 00548D38    mov         ecx,dword ptr [eax]
 00548D3A    call        dword ptr [ecx+18]
 00548D3D    xor         eax,eax
 00548D3F    pop         edx
 00548D40    pop         ecx
 00548D41    pop         ecx
 00548D42    mov         dword ptr fs:[eax],edx
 00548D45    push        548D67
 00548D4A    lea         eax,[ebp-14]
 00548D4D    mov         edx,3
 00548D52    call        @UStrArrayClr
 00548D57    lea         eax,[ebp-4]
 00548D5A    call        @UStrClr
 00548D5F    ret
>00548D60    jmp         @HandleFinally
>00548D65    jmp         00548D4A
 00548D67    pop         esi
 00548D68    pop         ebx
 00548D69    mov         esp,ebp
 00548D6B    pop         ebp
 00548D6C    ret
end;*}

//00548DA0
function TJclStringTypeInfo.GetMaxLength:Integer;
begin
{*
 00548DA0    push        ebx
 00548DA1    mov         ebx,eax
 00548DA3    mov         eax,ebx
 00548DA5    call        TJclTypeInfo.GetTypeData
 00548DAA    movzx       eax,byte ptr [eax]
 00548DAD    pop         ebx
 00548DAE    ret
*}
end;

//00548DB0
{*procedure sub_00548DB0(?:?);
begin
 00548DB0    push        ebp
 00548DB1    mov         ebp,esp
 00548DB3    push        0
 00548DB5    push        0
 00548DB7    push        ebx
 00548DB8    push        esi
 00548DB9    mov         esi,edx
 00548DBB    mov         ebx,eax
 00548DBD    xor         eax,eax
 00548DBF    push        ebp
 00548DC0    push        548E22
 00548DC5    push        dword ptr fs:[eax]
 00548DC8    mov         dword ptr fs:[eax],esp
 00548DCB    mov         edx,esi
 00548DCD    mov         eax,ebx
 00548DCF    call        0054771C
 00548DD4    lea         edx,[ebp-4]
 00548DD7    mov         eax,[0078D334];^SResString459:TResStringRec
 00548DDC    call        LoadResString
 00548DE1    lea         eax,[ebp-4]
 00548DE4    push        eax
 00548DE5    mov         eax,ebx
 00548DE7    call        TJclStringTypeInfo.GetMaxLength
 00548DEC    lea         edx,[ebp-8]
 00548DEF    call        IntToStr
 00548DF4    mov         edx,dword ptr [ebp-8]
 00548DF7    pop         eax
 00548DF8    call        @UStrCat
 00548DFD    mov         edx,dword ptr [ebp-4]
 00548E00    mov         eax,esi
 00548E02    mov         ecx,dword ptr [eax]
 00548E04    call        dword ptr [ecx+18]
 00548E07    xor         eax,eax
 00548E09    pop         edx
 00548E0A    pop         ecx
 00548E0B    pop         ecx
 00548E0C    mov         dword ptr fs:[eax],edx
 00548E0F    push        548E29
 00548E14    lea         eax,[ebp-8]
 00548E17    mov         edx,2
 00548E1C    call        @UStrArrayClr
 00548E21    ret
>00548E22    jmp         @HandleFinally
>00548E27    jmp         00548E14
 00548E29    pop         esi
 00548E2A    pop         ebx
 00548E2B    pop         ecx
 00548E2C    pop         ecx
 00548E2D    pop         ebp
 00548E2E    ret
end;*}

//00548E30
{*procedure sub_00548E30(?:?);
begin
 00548E30    push        ebp
 00548E31    mov         ebp,esp
 00548E33    xor         ecx,ecx
 00548E35    push        ecx
 00548E36    push        ecx
 00548E37    push        ecx
 00548E38    push        ecx
 00548E39    push        ecx
 00548E3A    push        ebx
 00548E3B    push        esi
 00548E3C    mov         esi,edx
 00548E3E    mov         ebx,eax
 00548E40    xor         eax,eax
 00548E42    push        ebp
 00548E43    push        548EEF
 00548E48    push        dword ptr fs:[eax]
 00548E4B    mov         dword ptr fs:[eax],esp
 00548E4E    lea         edx,[ebp-4]
 00548E51    mov         eax,ebx
 00548E53    call        TJclTypeInfo.GetName
 00548E58    mov         eax,dword ptr [ebp-4]
 00548E5B    cmp         word ptr [eax],2E
>00548E5F    je          00548E82
 00548E61    lea         edx,[ebp-8]
 00548E64    mov         eax,ebx
 00548E66    call        TJclTypeInfo.GetName
 00548E6B    lea         eax,[ebp-8]
 00548E6E    mov         edx,548F08;' = '
 00548E73    call        @UStrCat
 00548E78    mov         edx,dword ptr [ebp-8]
 00548E7B    mov         eax,esi
 00548E7D    mov         ecx,dword ptr [eax]
 00548E7F    call        dword ptr [ecx+14]
 00548E82    push        548F1C;'string['
 00548E87    mov         eax,ebx
 00548E89    call        TJclStringTypeInfo.GetMaxLength
 00548E8E    lea         edx,[ebp-10]
 00548E91    call        IntToStr
 00548E96    push        dword ptr [ebp-10]
 00548E99    push        548F38;']'
 00548E9E    lea         eax,[ebp-0C]
 00548EA1    mov         edx,3
 00548EA6    call        @UStrCatN
 00548EAB    mov         edx,dword ptr [ebp-0C]
 00548EAE    mov         eax,esi
 00548EB0    mov         ecx,dword ptr [eax]
 00548EB2    call        dword ptr [ecx+14]
 00548EB5    lea         edx,[ebp-14]
 00548EB8    mov         eax,ebx
 00548EBA    call        TJclTypeInfo.GetName
 00548EBF    mov         eax,dword ptr [ebp-14]
 00548EC2    cmp         word ptr [eax],2E
>00548EC6    je          00548ED4
 00548EC8    mov         edx,548F48;';'
 00548ECD    mov         eax,esi
 00548ECF    mov         ecx,dword ptr [eax]
 00548ED1    call        dword ptr [ecx+18]
 00548ED4    xor         eax,eax
 00548ED6    pop         edx
 00548ED7    pop         ecx
 00548ED8    pop         ecx
 00548ED9    mov         dword ptr fs:[eax],edx
 00548EDC    push        548EF6
 00548EE1    lea         eax,[ebp-14]
 00548EE4    mov         edx,5
 00548EE9    call        @UStrArrayClr
 00548EEE    ret
>00548EEF    jmp         @HandleFinally
>00548EF4    jmp         00548EE1
 00548EF6    pop         esi
 00548EF7    pop         ebx
 00548EF8    mov         esp,ebp
 00548EFA    pop         ebp
 00548EFB    ret
end;*}

//00548F4C
constructor TJclPropInfo.Create(APropInfo:PPropInfo);
begin
{*
 00548F4C    push        ebx
 00548F4D    push        esi
 00548F4E    push        edi
 00548F4F    test        dl,dl
>00548F51    je          00548F5B
 00548F53    add         esp,0FFFFFFF0
 00548F56    call        @ClassCreate
 00548F5B    mov         esi,ecx
 00548F5D    mov         ebx,edx
 00548F5F    mov         edi,eax
 00548F61    xor         edx,edx
 00548F63    mov         eax,edi
 00548F65    call        TObject.Create
 00548F6A    mov         dword ptr [edi+0C],esi;TJclPropInfo........FPropInfo:PPropInfo
 00548F6D    mov         eax,edi
 00548F6F    test        bl,bl
>00548F71    je          00548F82
 00548F73    call        @AfterConstruction
 00548F78    pop         dword ptr fs:[0]
 00548F7F    add         esp,0C
 00548F82    mov         eax,edi
 00548F84    pop         edi
 00548F85    pop         esi
 00548F86    pop         ebx
 00548F87    ret
*}
end;

//00548F88
function TJclPropInfo.GetPropInfo:PPropInfo;
begin
{*
 00548F88    mov         eax,dword ptr [eax+0C];TJclPropInfo.........FPropInfo:PPropInfo
 00548F8B    ret
*}
end;

//00548F8C
{*procedure TJclPropInfo.GetPropType(?:?);
begin
 00548F8C    push        ebx
 00548F8D    push        esi
 00548F8E    mov         esi,edx
 00548F90    mov         ebx,eax
 00548F92    mov         eax,ebx
 00548F94    call        TJclPropInfo.GetPropInfo
 00548F99    mov         eax,dword ptr [eax]
 00548F9B    mov         eax,dword ptr [eax]
 00548F9D    mov         edx,esi
 00548F9F    call        0054BBB0
 00548FA4    pop         esi
 00548FA5    pop         ebx
 00548FA6    ret
end;*}

//00548FA8
function TJclPropInfo.GetReader:Pointer;
begin
{*
 00548FA8    push        ebx
 00548FA9    mov         ebx,eax
 00548FAB    mov         eax,ebx
 00548FAD    call        TJclPropInfo.GetPropInfo
 00548FB2    mov         eax,dword ptr [eax+4]
 00548FB5    pop         ebx
 00548FB6    ret
*}
end;

//00548FB8
function TJclPropInfo.GetWriter:Pointer;
begin
{*
 00548FB8    push        ebx
 00548FB9    mov         ebx,eax
 00548FBB    mov         eax,ebx
 00548FBD    call        TJclPropInfo.GetPropInfo
 00548FC2    mov         eax,dword ptr [eax+8]
 00548FC5    pop         ebx
 00548FC6    ret
*}
end;

//00548FC8
function TJclPropInfo.GetStoredProc:Pointer;
begin
{*
 00548FC8    push        ebx
 00548FC9    mov         ebx,eax
 00548FCB    mov         eax,ebx
 00548FCD    call        TJclPropInfo.GetPropInfo
 00548FD2    mov         eax,dword ptr [eax+0C]
 00548FD5    pop         ebx
 00548FD6    ret
*}
end;

//00548FD8
function TJclPropInfo.GetIndex:Integer;
begin
{*
 00548FD8    push        ebx
 00548FD9    mov         ebx,eax
 00548FDB    mov         eax,ebx
 00548FDD    call        TJclPropInfo.GetPropInfo
 00548FE2    mov         eax,dword ptr [eax+10]
 00548FE5    pop         ebx
 00548FE6    ret
*}
end;

//00548FE8
function TJclPropInfo.GetDefault:Integer;
begin
{*
 00548FE8    push        ebx
 00548FE9    mov         ebx,eax
 00548FEB    mov         eax,ebx
 00548FED    call        TJclPropInfo.GetPropInfo
 00548FF2    mov         eax,dword ptr [eax+14]
 00548FF5    pop         ebx
 00548FF6    ret
*}
end;

//00548FF8
function TJclPropInfo.GetNameIndex:SmallInt;
begin
{*
 00548FF8    push        ebx
 00548FF9    mov         ebx,eax
 00548FFB    mov         eax,ebx
 00548FFD    call        TJclPropInfo.GetPropInfo
 00549002    movzx       eax,word ptr [eax+18]
 00549006    pop         ebx
 00549007    ret
*}
end;

//00549008
{*procedure TJclPropInfo.GetName(?:?);
begin
 00549008    push        ebx
 00549009    push        esi
 0054900A    mov         esi,edx
 0054900C    mov         ebx,eax
 0054900E    mov         eax,ebx
 00549010    call        TJclPropInfo.GetPropInfo
 00549015    lea         edx,[eax+1A]
 00549018    mov         eax,esi
 0054901A    call        @UStrFromString
 0054901F    pop         esi
 00549020    pop         ebx
 00549021    ret
end;*}

//00549024
function TJclPropInfo.GetSpecKind(Value:Cardinal):TJclPropSpecKind;
begin
{*
 00549024    mov         eax,edx
 00549026    shr         eax,18
 00549029    sub         eax,1
>0054902C    jb          0054903A
 0054902E    sub         eax,0FD
>00549033    je          00549046
 00549035    dec         eax
>00549036    je          00549049
>00549038    jmp         0054904C
 0054903A    cmp         edx,2
>0054903D    jae         00549043
 0054903F    mov         al,4
>00549041    jmp         0054904E
 00549043    mov         al,1
 00549045    ret
 00549046    mov         al,2
 00549048    ret
 00549049    mov         al,3
 0054904B    ret
 0054904C    mov         al,1
 0054904E    ret
*}
end;

//00549050
function TJclPropInfo.GetSpecValue(Value:Cardinal):Cardinal;
begin
{*
 00549050    push        ebx
 00549051    mov         ebx,edx
 00549053    mov         edx,ebx
 00549055    call        TJclPropInfo.GetSpecKind
 0054905A    dec         al
>0054905C    je          0054906A
 0054905E    dec         al
>00549060    je          0054906E
 00549062    dec         al
>00549064    je          00549077
 00549066    dec         al
>00549068    jne         00549080
 0054906A    mov         eax,ebx
 0054906C    pop         ebx
 0054906D    ret
 0054906E    mov         eax,ebx
 00549070    and         eax,0FFFF
 00549075    pop         ebx
 00549076    ret
 00549077    mov         eax,ebx
 00549079    and         eax,0FFFFFF
 0054907E    pop         ebx
 0054907F    ret
 00549080    xor         eax,eax
 00549082    pop         ebx
 00549083    ret
*}
end;

//00549084
procedure TJclPropInfo.GetReaderType;
begin
{*
 00549084    push        ebx
 00549085    mov         ebx,eax
 00549087    mov         eax,ebx
 00549089    call        TJclPropInfo.GetReader
 0054908E    mov         edx,eax
 00549090    mov         eax,ebx
 00549092    call        TJclPropInfo.GetSpecKind
 00549097    pop         ebx
 00549098    ret
*}
end;

//0054909C
procedure TJclPropInfo.GetWriterType;
begin
{*
 0054909C    push        ebx
 0054909D    mov         ebx,eax
 0054909F    mov         eax,ebx
 005490A1    call        TJclPropInfo.GetWriter
 005490A6    mov         edx,eax
 005490A8    mov         eax,ebx
 005490AA    call        TJclPropInfo.GetSpecKind
 005490AF    pop         ebx
 005490B0    ret
*}
end;

//005490B4
procedure TJclPropInfo.GetStoredType;
begin
{*
 005490B4    push        ebx
 005490B5    mov         ebx,eax
 005490B7    mov         eax,ebx
 005490B9    call        TJclPropInfo.GetStoredProc
 005490BE    mov         edx,eax
 005490C0    mov         eax,ebx
 005490C2    call        TJclPropInfo.GetSpecKind
 005490C7    pop         ebx
 005490C8    ret
*}
end;

//005490CC
procedure TJclPropInfo.GetReaderValue;
begin
{*
 005490CC    push        ebx
 005490CD    mov         ebx,eax
 005490CF    mov         eax,ebx
 005490D1    call        TJclPropInfo.GetReader
 005490D6    mov         edx,eax
 005490D8    mov         eax,ebx
 005490DA    call        TJclPropInfo.GetSpecValue
 005490DF    pop         ebx
 005490E0    ret
*}
end;

//005490E4
procedure TJclPropInfo.GetWriterValue;
begin
{*
 005490E4    push        ebx
 005490E5    mov         ebx,eax
 005490E7    mov         eax,ebx
 005490E9    call        TJclPropInfo.GetWriter
 005490EE    mov         edx,eax
 005490F0    mov         eax,ebx
 005490F2    call        TJclPropInfo.GetSpecValue
 005490F7    pop         ebx
 005490F8    ret
*}
end;

//005490FC
procedure TJclPropInfo.GetStoredValue;
begin
{*
 005490FC    push        ebx
 005490FD    mov         ebx,eax
 005490FF    mov         eax,ebx
 00549101    call        TJclPropInfo.GetStoredProc
 00549106    mov         edx,eax
 00549108    mov         eax,ebx
 0054910A    call        TJclPropInfo.GetSpecValue
 0054910F    pop         ebx
 00549110    ret
*}
end;

//00549114
procedure TJclPropInfo.IsStored(AInstance:TObject);
begin
{*
 00549114    mov         eax,dword ptr [eax+0C];TJclPropInfo..........FPropInfo:PPropInfo
 00549117    xchg        eax,edx
 00549118    call        IsStoredProp
 0054911D    ret
*}
end;

//00549120
function TJclPropInfo.HasDefault:Boolean;
begin
{*
 00549120    push        ebx
 00549121    mov         ebx,eax
 00549123    mov         eax,ebx
 00549125    call        TJclPropInfo.GetDefault
 0054912A    cmp         eax,80000000
 0054912F    setne       al
 00549132    pop         ebx
 00549133    ret
*}
end;

//00549134
function TJclPropInfo.HasIndex:Boolean;
begin
{*
 00549134    push        ebx
 00549135    mov         ebx,eax
 00549137    mov         eax,ebx
 00549139    call        TJclPropInfo.GetIndex
 0054913E    cmp         eax,80000000
 00549143    setne       al
 00549146    pop         ebx
 00549147    ret
*}
end;

//00549148
function TJclClassTypeInfo.GetClassRef:TClass;
begin
{*
 00549148    push        ebx
 00549149    mov         ebx,eax
 0054914B    mov         eax,ebx
 0054914D    call        TJclTypeInfo.GetTypeData
 00549152    mov         eax,dword ptr [eax]
 00549154    pop         ebx
 00549155    ret
*}
end;

//00549158
{*procedure TJclClassTypeInfo.GetParent(?:?);
begin
 00549158    push        ebp
 00549159    mov         ebp,esp
 0054915B    push        0
 0054915D    push        ebx
 0054915E    push        esi
 0054915F    mov         esi,edx
 00549161    mov         ebx,eax
 00549163    xor         eax,eax
 00549165    push        ebp
 00549166    push        5491CF
 0054916B    push        dword ptr fs:[eax]
 0054916E    mov         dword ptr fs:[eax],esp
 00549171    mov         eax,ebx
 00549173    call        TJclTypeInfo.GetTypeData
 00549178    cmp         dword ptr [eax+4],0
>0054917C    je          005491B2
 0054917E    mov         eax,ebx
 00549180    call        TJclTypeInfo.GetTypeData
 00549185    mov         eax,dword ptr [eax+4]
 00549188    cmp         dword ptr [eax],0
>0054918B    je          005491B2
 0054918D    mov         eax,ebx
 0054918F    call        TJclTypeInfo.GetTypeData
 00549194    mov         eax,dword ptr [eax+4]
 00549197    mov         eax,dword ptr [eax]
 00549199    lea         edx,[ebp-4]
 0054919C    call        0054BBB0
 005491A1    mov         edx,dword ptr [ebp-4]
 005491A4    mov         eax,esi
 005491A6    mov         ecx,5491DC;['{7DAD5228-46EA-11D5-B0C0-4854E825F345}']
 005491AB    call        @IntfCast
>005491B0    jmp         005491B9
 005491B2    mov         eax,esi
 005491B4    call        @IntfClear
 005491B9    xor         eax,eax
 005491BB    pop         edx
 005491BC    pop         ecx
 005491BD    pop         ecx
 005491BE    mov         dword ptr fs:[eax],edx
 005491C1    push        5491D6
 005491C6    lea         eax,[ebp-4]
 005491C9    call        @IntfClear
 005491CE    ret
>005491CF    jmp         @HandleFinally
>005491D4    jmp         005491C6
 005491D6    pop         esi
 005491D7    pop         ebx
 005491D8    pop         ecx
 005491D9    pop         ebp
 005491DA    ret
end;*}

//005491EC
function TJclClassTypeInfo.GetTotalPropertyCount:Integer;
begin
{*
 005491EC    push        ebx
 005491ED    mov         ebx,eax
 005491EF    mov         eax,ebx
 005491F1    call        TJclTypeInfo.GetTypeData
 005491F6    movsx       eax,word ptr [eax+8]
 005491FA    pop         ebx
 005491FB    ret
*}
end;

//005491FC
function TJclClassTypeInfo.GetPropertyCount:Integer;
begin
{*
 005491FC    push        ebp
 005491FD    mov         ebp,esp
 005491FF    add         esp,0FFFFFFF8
 00549202    push        ebx
 00549203    push        esi
 00549204    xor         edx,edx
 00549206    mov         dword ptr [ebp-4],edx
 00549209    mov         ebx,eax
 0054920B    xor         eax,eax
 0054920D    push        ebp
 0054920E    push        54925B
 00549213    push        dword ptr fs:[eax]
 00549216    mov         dword ptr fs:[eax],esp
 00549219    mov         eax,ebx
 0054921B    call        TJclTypeInfo.GetTypeData
 00549220    lea         esi,[eax+0A]
 00549223    lea         edx,[ebp-4]
 00549226    mov         eax,ebx
 00549228    call        TJclClassTypeInfo.GetUnitName
 0054922D    mov         eax,dword ptr [ebp-4]
 00549230    mov         dword ptr [ebp-8],eax
 00549233    mov         eax,dword ptr [ebp-8]
 00549236    test        eax,eax
>00549238    je          0054923F
 0054923A    sub         eax,4
 0054923D    mov         eax,dword ptr [eax]
 0054923F    inc         eax
 00549240    add         esi,eax
 00549242    movzx       ebx,word ptr [esi]
 00549245    xor         eax,eax
 00549247    pop         edx
 00549248    pop         ecx
 00549249    pop         ecx
 0054924A    mov         dword ptr fs:[eax],edx
 0054924D    push        549262
 00549252    lea         eax,[ebp-4]
 00549255    call        @UStrClr
 0054925A    ret
>0054925B    jmp         @HandleFinally
>00549260    jmp         00549252
 00549262    mov         eax,ebx
 00549264    pop         esi
 00549265    pop         ebx
 00549266    pop         ecx
 00549267    pop         ecx
 00549268    pop         ebp
 00549269    ret
*}
end;

//0054926C
{*procedure TJclClassTypeInfo.GetProperties(PropIdx:Integer; ?:?);
begin
 0054926C    push        ebp
 0054926D    mov         ebp,esp
 0054926F    add         esp,0FFFFFFE8
 00549272    push        ebx
 00549273    xor         ebx,ebx
 00549275    mov         dword ptr [ebp-18],ebx
 00549278    mov         dword ptr [ebp-10],ebx
 0054927B    mov         dword ptr [ebp-0C],ecx
 0054927E    mov         dword ptr [ebp-8],edx
 00549281    mov         dword ptr [ebp-4],eax
 00549284    xor         eax,eax
 00549286    push        ebp
 00549287    push        549349
 0054928C    push        dword ptr fs:[eax]
 0054928F    mov         dword ptr fs:[eax],esp
 00549292    mov         eax,dword ptr [ebp-4]
 00549295    call        TJclTypeInfo.GetTypeData
 0054929A    lea         ebx,[eax+0A]
 0054929D    lea         edx,[ebp-10]
 005492A0    mov         eax,dword ptr [ebp-4]
 005492A3    call        TJclClassTypeInfo.GetUnitName
 005492A8    mov         eax,dword ptr [ebp-10]
 005492AB    mov         dword ptr [ebp-14],eax
 005492AE    mov         eax,dword ptr [ebp-14]
 005492B1    test        eax,eax
>005492B3    je          005492BA
 005492B5    sub         eax,4
 005492B8    mov         eax,dword ptr [eax]
 005492BA    inc         eax
 005492BB    add         ebx,eax
 005492BD    mov         eax,dword ptr [ebp-8]
 005492C0    inc         eax
 005492C1    movzx       edx,word ptr [ebx]
 005492C4    cmp         eax,edx
>005492C6    jle         005492EA
 005492C8    lea         edx,[ebp-18]
 005492CB    mov         eax,dword ptr [ebp-4]
 005492CE    call        TJclClassTypeInfo.GetParent
 005492D3    mov         eax,dword ptr [ebp-18]
 005492D6    movzx       edx,word ptr [ebx]
 005492D9    push        edx
 005492DA    mov         edx,dword ptr [ebp-8]
 005492DD    pop         ecx
 005492DE    sub         edx,ecx
 005492E0    mov         ecx,dword ptr [ebp-0C]
 005492E3    mov         ebx,dword ptr [eax]
 005492E5    call        dword ptr [ebx+34]
>005492E8    jmp         0054932B
 005492EA    add         ebx,2
 005492ED    cmp         dword ptr [ebp-8],0
>005492F1    jle         0054930C
 005492F3    mov         edx,1A
 005492F8    mov         eax,dword ptr [ebp-8]
 005492FB    test        eax,eax
>005492FD    jle         0054930C
 005492FF    add         ebx,edx
 00549301    movzx       ecx,byte ptr [ebx]
 00549304    inc         ecx
 00549305    add         ebx,ecx
 00549307    dec         eax
 00549308    test        eax,eax
>0054930A    jg          005492FF
 0054930C    mov         ecx,ebx
 0054930E    mov         dl,1
 00549310    mov         eax,[005457DC];TJclPropInfo
 00549315    call        TJclPropInfo.Create;TJclPropInfo.Create
 0054931A    mov         edx,eax
 0054931C    test        edx,edx
>0054931E    je          00549323
 00549320    sub         edx,0FFFFFFF0
 00549323    mov         eax,dword ptr [ebp-0C]
 00549326    call        @IntfCopy
 0054932B    xor         eax,eax
 0054932D    pop         edx
 0054932E    pop         ecx
 0054932F    pop         ecx
 00549330    mov         dword ptr fs:[eax],edx
 00549333    push        549350
 00549338    lea         eax,[ebp-18]
 0054933B    call        @IntfClear
 00549340    lea         eax,[ebp-10]
 00549343    call        @UStrClr
 00549348    ret
>00549349    jmp         @HandleFinally
>0054934E    jmp         00549338
 00549350    pop         ebx
 00549351    mov         esp,ebp
 00549353    pop         ebp
 00549354    ret
end;*}

//00549358
{*procedure TJclClassTypeInfo.GetPropNames(Name:string; ?:?);
begin
 00549358    push        ebx
 00549359    push        esi
 0054935A    push        edi
 0054935B    mov         esi,ecx
 0054935D    mov         edi,edx
 0054935F    mov         ebx,eax
 00549361    mov         eax,ebx
 00549363    call        TJclTypeInfo.GetTypeInfo
 00549368    mov         edx,edi
 0054936A    call        GetPropInfo
 0054936F    mov         ebx,eax
 00549371    test        ebx,ebx
>00549373    je          00549395
 00549375    mov         ecx,ebx
 00549377    mov         dl,1
 00549379    mov         eax,[005457DC];TJclPropInfo
 0054937E    call        TJclPropInfo.Create;TJclPropInfo.Create
 00549383    mov         edx,eax
 00549385    test        edx,edx
>00549387    je          0054938C
 00549389    sub         edx,0FFFFFFF0
 0054938C    mov         eax,esi
 0054938E    call        @IntfCopy
>00549393    jmp         0054939C
 00549395    mov         eax,esi
 00549397    call        @IntfClear
 0054939C    pop         edi
 0054939D    pop         esi
 0054939E    pop         ebx
 0054939F    ret
end;*}

//005493A0
{*procedure TJclClassTypeInfo.GetUnitName(?:?);
begin
 005493A0    push        ebx
 005493A1    push        esi
 005493A2    mov         esi,edx
 005493A4    mov         ebx,eax
 005493A6    mov         eax,ebx
 005493A8    call        TJclTypeInfo.GetTypeData
 005493AD    lea         edx,[eax+0A]
 005493B0    mov         eax,esi
 005493B2    call        @UStrFromString
 005493B7    pop         esi
 005493B8    pop         ebx
 005493B9    ret
end;*}

//005493BC
{*procedure sub_005493BC(?:?);
begin
 005493BC    push        ebp
 005493BD    mov         ebp,esp
 005493BF    mov         ecx,21
 005493C4    push        0
 005493C6    push        0
 005493C8    dec         ecx
>005493C9    jne         005493C4
 005493CB    push        ecx
 005493CC    mov         dword ptr [ebp-0C],edx
 005493CF    mov         dword ptr [ebp-8],eax
 005493D2    xor         eax,eax
 005493D4    push        ebp
 005493D5    push        549C80
 005493DA    push        dword ptr fs:[eax]
 005493DD    mov         dword ptr fs:[eax],esp
 005493E0    mov         edx,dword ptr [ebp-0C]
 005493E3    mov         eax,dword ptr [ebp-8]
 005493E6    call        0054771C
 005493EB    lea         edx,[ebp-18]
 005493EE    mov         eax,[0078D97C];^SResString450:TResStringRec
 005493F3    call        LoadResString
 005493F8    lea         eax,[ebp-18]
 005493FB    push        eax
 005493FC    mov         eax,dword ptr [ebp-8]
 005493FF    call        TJclClassTypeInfo.GetClassRef
 00549404    lea         edx,[ebp-1C]
 00549407    call        TObject.ClassName
 0054940C    mov         edx,dword ptr [ebp-1C]
 0054940F    pop         eax
 00549410    call        @UStrCat
 00549415    mov         edx,dword ptr [ebp-18]
 00549418    mov         eax,dword ptr [ebp-0C]
 0054941B    mov         ecx,dword ptr [eax]
 0054941D    call        dword ptr [ecx+18]
 00549420    lea         edx,[ebp-20]
 00549423    mov         eax,[0078D0BC];^SResString451:TResStringRec
 00549428    call        LoadResString
 0054942D    lea         eax,[ebp-20]
 00549430    push        eax
 00549431    lea         edx,[ebp-28]
 00549434    mov         eax,dword ptr [ebp-8]
 00549437    call        TJclClassTypeInfo.GetParent
 0054943C    mov         eax,dword ptr [ebp-28]
 0054943F    mov         edx,dword ptr [eax]
 00549441    call        dword ptr [edx+24]
 00549444    lea         edx,[ebp-24]
 00549447    call        TObject.ClassName
 0054944C    mov         edx,dword ptr [ebp-24]
 0054944F    pop         eax
 00549450    call        @UStrCat
 00549455    mov         edx,dword ptr [ebp-20]
 00549458    mov         eax,dword ptr [ebp-0C]
 0054945B    mov         ecx,dword ptr [eax]
 0054945D    call        dword ptr [ecx+18]
 00549460    lea         edx,[ebp-2C]
 00549463    mov         eax,[0078CDB8];^SResString453:TResStringRec
 00549468    call        LoadResString
 0054946D    lea         eax,[ebp-2C]
 00549470    push        eax
 00549471    lea         edx,[ebp-30]
 00549474    mov         eax,dword ptr [ebp-8]
 00549477    call        TJclClassTypeInfo.GetUnitName
 0054947C    mov         edx,dword ptr [ebp-30]
 0054947F    pop         eax
 00549480    call        @UStrCat
 00549485    mov         edx,dword ptr [ebp-2C]
 00549488    mov         eax,dword ptr [ebp-0C]
 0054948B    mov         ecx,dword ptr [eax]
 0054948D    call        dword ptr [ecx+18]
 00549490    lea         edx,[ebp-38]
 00549493    mov         eax,[0078D73C];^SResString452:TResStringRec
 00549498    call        LoadResString
 0054949D    push        dword ptr [ebp-38]
 005494A0    mov         eax,dword ptr [ebp-8]
 005494A3    call        TJclClassTypeInfo.GetPropertyCount
 005494A8    lea         edx,[ebp-3C]
 005494AB    call        IntToStr
 005494B0    push        dword ptr [ebp-3C]
 005494B3    push        549C98;' ('
 005494B8    mov         eax,dword ptr [ebp-8]
 005494BB    call        TJclClassTypeInfo.GetTotalPropertyCount
 005494C0    lea         edx,[ebp-40]
 005494C3    call        IntToStr
 005494C8    push        dword ptr [ebp-40]
 005494CB    push        549CAC;')'
 005494D0    lea         eax,[ebp-34]
 005494D3    mov         edx,5
 005494D8    call        @UStrCatN
 005494DD    mov         edx,dword ptr [ebp-34]
 005494E0    mov         eax,dword ptr [ebp-0C]
 005494E3    mov         ecx,dword ptr [eax]
 005494E5    call        dword ptr [ecx+18]
 005494E8    mov         eax,dword ptr [ebp-0C]
 005494EB    mov         edx,dword ptr [eax]
 005494ED    call        dword ptr [edx+1C]
 005494F0    xor         eax,eax
 005494F2    push        ebp
 005494F3    push        549C14
 005494F8    push        dword ptr fs:[eax]
 005494FB    mov         dword ptr fs:[eax],esp
 005494FE    mov         eax,dword ptr [ebp-8]
 00549501    call        TJclClassTypeInfo.GetPropertyCount
 00549506    dec         eax
 00549507    test        eax,eax
>00549509    jl          00549BFE
 0054950F    inc         eax
 00549510    mov         dword ptr [ebp-14],eax
 00549513    mov         dword ptr [ebp-10],0
 0054951A    lea         ecx,[ebp-4]
 0054951D    mov         edx,dword ptr [ebp-10]
 00549520    mov         eax,dword ptr [ebp-8]
 00549523    call        TJclClassTypeInfo.GetProperties
 00549528    lea         edx,[ebp-48]
 0054952B    mov         eax,dword ptr [ebp-4]
 0054952E    mov         ecx,dword ptr [eax]
 00549530    call        dword ptr [ecx+2C]
 00549533    push        dword ptr [ebp-48]
 00549536    push        549CBC;': '
 0054953B    lea         edx,[ebp-50]
 0054953E    mov         eax,dword ptr [ebp-4]
 00549541    mov         ecx,dword ptr [eax]
 00549543    call        dword ptr [ecx+10]
 00549546    mov         eax,dword ptr [ebp-50]
 00549549    lea         edx,[ebp-4C]
 0054954C    mov         ecx,dword ptr [eax]
 0054954E    call        dword ptr [ecx+14]
 00549551    push        dword ptr [ebp-4C]
 00549554    lea         eax,[ebp-44]
 00549557    mov         edx,3
 0054955C    call        @UStrCatN
 00549561    mov         edx,dword ptr [ebp-44]
 00549564    mov         eax,dword ptr [ebp-0C]
 00549567    mov         ecx,dword ptr [eax]
 00549569    call        dword ptr [ecx+18]
 0054956C    mov         eax,dword ptr [ebp-0C]
 0054956F    mov         edx,dword ptr [eax]
 00549571    call        dword ptr [edx+1C]
 00549574    xor         eax,eax
 00549576    push        ebp
 00549577    push        549BEB
 0054957C    push        dword ptr fs:[eax]
 0054957F    mov         dword ptr fs:[eax],esp
 00549582    mov         eax,dword ptr [ebp-4]
 00549585    mov         edx,dword ptr [eax]
 00549587    call        dword ptr [edx+50]
 0054958A    test        al,al
>0054958C    je          005495D5
 0054958E    lea         eax,[ebp-54]
 00549591    push        eax
 00549592    lea         edx,[ebp-68]
 00549595    mov         eax,[0078D2F0];^SResString439:TResStringRec
 0054959A    call        LoadResString
 0054959F    mov         eax,dword ptr [ebp-68]
 005495A2    mov         dword ptr [ebp-64],eax
 005495A5    mov         byte ptr [ebp-60],11
 005495A9    mov         eax,dword ptr [ebp-4]
 005495AC    mov         edx,dword ptr [eax]
 005495AE    call        dword ptr [edx+20]
 005495B1    mov         dword ptr [ebp-5C],eax
 005495B4    mov         byte ptr [ebp-58],0
 005495B8    lea         edx,[ebp-64]
 005495BB    mov         ecx,1
 005495C0    mov         eax,549CD0;'[%s %d]'
 005495C5    call        Format
 005495CA    mov         edx,dword ptr [ebp-54]
 005495CD    mov         eax,dword ptr [ebp-0C]
 005495D0    mov         ecx,dword ptr [eax]
 005495D2    call        dword ptr [ecx+18]
 005495D5    mov         eax,dword ptr [ebp-4]
 005495D8    mov         edx,dword ptr [eax]
 005495DA    call        dword ptr [edx+4C]
 005495DD    test        al,al
>005495DF    je          00549628
 005495E1    lea         eax,[ebp-6C]
 005495E4    push        eax
 005495E5    lea         edx,[ebp-70]
 005495E8    mov         eax,[0078D4D0];^SResString440:TResStringRec
 005495ED    call        LoadResString
 005495F2    mov         eax,dword ptr [ebp-70]
 005495F5    mov         dword ptr [ebp-64],eax
 005495F8    mov         byte ptr [ebp-60],11
 005495FC    mov         eax,dword ptr [ebp-4]
 005495FF    mov         edx,dword ptr [eax]
 00549601    call        dword ptr [edx+24]
 00549604    mov         dword ptr [ebp-5C],eax
 00549607    mov         byte ptr [ebp-58],0
 0054960B    lea         edx,[ebp-64]
 0054960E    mov         eax,549CD0;'[%s %d]'
 00549613    mov         ecx,1
 00549618    call        Format
 0054961D    mov         edx,dword ptr [ebp-6C]
 00549620    mov         eax,dword ptr [ebp-0C]
 00549623    mov         ecx,dword ptr [eax]
 00549625    call        dword ptr [ecx+18]
 00549628    mov         eax,dword ptr [ebp-4]
 0054962B    mov         edx,dword ptr [eax]
 0054962D    call        dword ptr [edx+30]
 00549630    dec         al
>00549632    je          00549649
 00549634    dec         al
>00549636    je          00549742
 0054963C    dec         al
>0054963E    je          005496C4
>00549644    jmp         005497BE
 00549649    lea         eax,[ebp-74]
 0054964C    push        eax
 0054964D    lea         edx,[ebp-90]
 00549653    mov         eax,[0078D1D8];^SResString433:TResStringRec
 00549658    call        LoadResString
 0054965D    mov         eax,dword ptr [ebp-90]
 00549663    mov         dword ptr [ebp-8C],eax
 00549669    mov         byte ptr [ebp-88],11
 00549670    lea         edx,[ebp-94]
 00549676    mov         eax,[0078D9D0];^SResString437:TResStringRec
 0054967B    call        LoadResString
 00549680    mov         eax,dword ptr [ebp-94]
 00549686    mov         dword ptr [ebp-84],eax
 0054968C    mov         byte ptr [ebp-80],11
 00549690    mov         eax,dword ptr [ebp-4]
 00549693    mov         edx,dword ptr [eax]
 00549695    call        dword ptr [edx+3C]
 00549698    mov         dword ptr [ebp-7C],eax
 0054969B    mov         byte ptr [ebp-78],5
 0054969F    lea         edx,[ebp-8C]
 005496A5    mov         ecx,2
 005496AA    mov         eax,549CEC;'[%s %s $%p]'
 005496AF    call        Format
 005496B4    mov         edx,dword ptr [ebp-74]
 005496B7    mov         eax,dword ptr [ebp-0C]
 005496BA    mov         ecx,dword ptr [eax]
 005496BC    call        dword ptr [ecx+18]
>005496BF    jmp         005497BE
 005496C4    lea         eax,[ebp-98]
 005496CA    push        eax
 005496CB    lea         edx,[ebp-9C]
 005496D1    mov         eax,[0078D1D8];^SResString433:TResStringRec
 005496D6    call        LoadResString
 005496DB    mov         eax,dword ptr [ebp-9C]
 005496E1    mov         dword ptr [ebp-8C],eax
 005496E7    mov         byte ptr [ebp-88],11
 005496EE    lea         edx,[ebp-0A0]
 005496F4    mov         eax,[0078CB9C];^SResString436:TResStringRec
 005496F9    call        LoadResString
 005496FE    mov         eax,dword ptr [ebp-0A0]
 00549704    mov         dword ptr [ebp-84],eax
 0054970A    mov         byte ptr [ebp-80],11
 0054970E    mov         eax,dword ptr [ebp-4]
 00549711    mov         edx,dword ptr [eax]
 00549713    call        dword ptr [edx+3C]
 00549716    mov         dword ptr [ebp-7C],eax
 00549719    mov         byte ptr [ebp-78],5
 0054971D    lea         edx,[ebp-8C]
 00549723    mov         eax,549CEC;'[%s %s $%p]'
 00549728    mov         ecx,2
 0054972D    call        Format
 00549732    mov         edx,dword ptr [ebp-98]
 00549738    mov         eax,dword ptr [ebp-0C]
 0054973B    mov         ecx,dword ptr [eax]
 0054973D    call        dword ptr [ecx+18]
>00549740    jmp         005497BE
 00549742    lea         eax,[ebp-0A4]
 00549748    push        eax
 00549749    lea         edx,[ebp-0A8]
 0054974F    mov         eax,[0078D1D8];^SResString433:TResStringRec
 00549754    call        LoadResString
 00549759    mov         eax,dword ptr [ebp-0A8]
 0054975F    mov         dword ptr [ebp-8C],eax
 00549765    mov         byte ptr [ebp-88],11
 0054976C    lea         edx,[ebp-0AC]
 00549772    mov         eax,[0078D698];^SResString438:TResStringRec
 00549777    call        LoadResString
 0054977C    mov         eax,dword ptr [ebp-0AC]
 00549782    mov         dword ptr [ebp-84],eax
 00549788    mov         byte ptr [ebp-80],11
 0054978C    mov         eax,dword ptr [ebp-4]
 0054978F    mov         edx,dword ptr [eax]
 00549791    call        dword ptr [edx+3C]
 00549794    mov         dword ptr [ebp-7C],eax
 00549797    mov         byte ptr [ebp-78],5
 0054979B    lea         edx,[ebp-8C]
 005497A1    mov         eax,549CEC;'[%s %s $%p]'
 005497A6    mov         ecx,2
 005497AB    call        Format
 005497B0    mov         edx,dword ptr [ebp-0A4]
 005497B6    mov         eax,dword ptr [ebp-0C]
 005497B9    mov         ecx,dword ptr [eax]
 005497BB    call        dword ptr [ecx+18]
 005497BE    mov         eax,dword ptr [ebp-4]
 005497C1    mov         edx,dword ptr [eax]
 005497C3    call        dword ptr [edx+34]
 005497C6    dec         al
>005497C8    je          005497DF
 005497CA    dec         al
>005497CC    je          005498DE
 005497D2    dec         al
>005497D4    je          00549860
>005497DA    jmp         0054995A
 005497DF    lea         eax,[ebp-0B0]
 005497E5    push        eax
 005497E6    lea         edx,[ebp-0B4]
 005497EC    mov         eax,[0078CC18];^SResString434:TResStringRec
 005497F1    call        LoadResString
 005497F6    mov         eax,dword ptr [ebp-0B4]
 005497FC    mov         dword ptr [ebp-8C],eax
 00549802    mov         byte ptr [ebp-88],11
 00549809    lea         edx,[ebp-0B8]
 0054980F    mov         eax,[0078D9D0];^SResString437:TResStringRec
 00549814    call        LoadResString
 00549819    mov         eax,dword ptr [ebp-0B8]
 0054981F    mov         dword ptr [ebp-84],eax
 00549825    mov         byte ptr [ebp-80],11
 00549829    mov         eax,dword ptr [ebp-4]
 0054982C    mov         edx,dword ptr [eax]
 0054982E    call        dword ptr [edx+40]
 00549831    mov         dword ptr [ebp-7C],eax
 00549834    mov         byte ptr [ebp-78],5
 00549838    lea         edx,[ebp-8C]
 0054983E    mov         eax,549CEC;'[%s %s $%p]'
 00549843    mov         ecx,2
 00549848    call        Format
 0054984D    mov         edx,dword ptr [ebp-0B0]
 00549853    mov         eax,dword ptr [ebp-0C]
 00549856    mov         ecx,dword ptr [eax]
 00549858    call        dword ptr [ecx+18]
>0054985B    jmp         0054995A
 00549860    lea         eax,[ebp-0BC]
 00549866    push        eax
 00549867    lea         edx,[ebp-0C0]
 0054986D    mov         eax,[0078CC18];^SResString434:TResStringRec
 00549872    call        LoadResString
 00549877    mov         eax,dword ptr [ebp-0C0]
 0054987D    mov         dword ptr [ebp-8C],eax
 00549883    mov         byte ptr [ebp-88],11
 0054988A    lea         edx,[ebp-0C4]
 00549890    mov         eax,[0078CB9C];^SResString436:TResStringRec
 00549895    call        LoadResString
 0054989A    mov         eax,dword ptr [ebp-0C4]
 005498A0    mov         dword ptr [ebp-84],eax
 005498A6    mov         byte ptr [ebp-80],11
 005498AA    mov         eax,dword ptr [ebp-4]
 005498AD    mov         edx,dword ptr [eax]
 005498AF    call        dword ptr [edx+40]
 005498B2    mov         dword ptr [ebp-7C],eax
 005498B5    mov         byte ptr [ebp-78],5
 005498B9    lea         edx,[ebp-8C]
 005498BF    mov         eax,549CEC;'[%s %s $%p]'
 005498C4    mov         ecx,2
 005498C9    call        Format
 005498CE    mov         edx,dword ptr [ebp-0BC]
 005498D4    mov         eax,dword ptr [ebp-0C]
 005498D7    mov         ecx,dword ptr [eax]
 005498D9    call        dword ptr [ecx+18]
>005498DC    jmp         0054995A
 005498DE    lea         eax,[ebp-0C8]
 005498E4    push        eax
 005498E5    lea         edx,[ebp-0CC]
 005498EB    mov         eax,[0078CC18];^SResString434:TResStringRec
 005498F0    call        LoadResString
 005498F5    mov         eax,dword ptr [ebp-0CC]
 005498FB    mov         dword ptr [ebp-8C],eax
 00549901    mov         byte ptr [ebp-88],11
 00549908    lea         edx,[ebp-0D0]
 0054990E    mov         eax,[0078D698];^SResString438:TResStringRec
 00549913    call        LoadResString
 00549918    mov         eax,dword ptr [ebp-0D0]
 0054991E    mov         dword ptr [ebp-84],eax
 00549924    mov         byte ptr [ebp-80],11
 00549928    mov         eax,dword ptr [ebp-4]
 0054992B    mov         edx,dword ptr [eax]
 0054992D    call        dword ptr [edx+40]
 00549930    mov         dword ptr [ebp-7C],eax
 00549933    mov         byte ptr [ebp-78],5
 00549937    lea         edx,[ebp-8C]
 0054993D    mov         eax,549CEC;'[%s %s $%p]'
 00549942    mov         ecx,2
 00549947    call        Format
 0054994C    mov         edx,dword ptr [ebp-0C8]
 00549952    mov         eax,dword ptr [ebp-0C]
 00549955    mov         ecx,dword ptr [eax]
 00549957    call        dword ptr [ecx+18]
 0054995A    mov         eax,dword ptr [ebp-4]
 0054995D    mov         edx,dword ptr [eax]
 0054995F    call        dword ptr [edx+38]
 00549962    dec         al
>00549964    je          00549A5A
 0054996A    dec         al
>0054996C    je          00549B59
 00549972    dec         al
>00549974    je          00549ADB
 0054997A    dec         al
>0054997C    jne         00549BD5
 00549982    mov         eax,dword ptr [ebp-4]
 00549985    mov         edx,dword ptr [eax]
 00549987    call        dword ptr [edx+44]
 0054998A    test        al,al
>0054998C    je          005499F4
 0054998E    lea         eax,[ebp-0D4]
 00549994    push        eax
 00549995    lea         edx,[ebp-0D8]
 0054999B    mov         eax,[0078D738];^SResString435:TResStringRec
 005499A0    call        LoadResString
 005499A5    mov         eax,dword ptr [ebp-0D8]
 005499AB    mov         dword ptr [ebp-64],eax
 005499AE    mov         byte ptr [ebp-60],11
 005499B2    lea         edx,[ebp-0DC]
 005499B8    mov         eax,[0078D580];^SResString429:TResStringRec
 005499BD    call        LoadResString
 005499C2    mov         eax,dword ptr [ebp-0DC]
 005499C8    mov         dword ptr [ebp-5C],eax
 005499CB    mov         byte ptr [ebp-58],11
 005499CF    lea         edx,[ebp-64]
 005499D2    mov         ecx,1
 005499D7    mov         eax,549D10;'[%s=%s]'
 005499DC    call        Format
 005499E1    mov         edx,dword ptr [ebp-0D4]
 005499E7    mov         eax,dword ptr [ebp-0C]
 005499EA    mov         ecx,dword ptr [eax]
 005499EC    call        dword ptr [ecx+18]
>005499EF    jmp         00549BD5
 005499F4    lea         eax,[ebp-0E0]
 005499FA    push        eax
 005499FB    lea         edx,[ebp-0E4]
 00549A01    mov         eax,[0078D738];^SResString435:TResStringRec
 00549A06    call        LoadResString
 00549A0B    mov         eax,dword ptr [ebp-0E4]
 00549A11    mov         dword ptr [ebp-64],eax
 00549A14    mov         byte ptr [ebp-60],11
 00549A18    lea         edx,[ebp-0E8]
 00549A1E    mov         eax,[0078CEAC];^SResString430:TResStringRec
 00549A23    call        LoadResString
 00549A28    mov         eax,dword ptr [ebp-0E8]
 00549A2E    mov         dword ptr [ebp-5C],eax
 00549A31    mov         byte ptr [ebp-58],11
 00549A35    lea         edx,[ebp-64]
 00549A38    mov         eax,549D10;'[%s=%s]'
 00549A3D    mov         ecx,1
 00549A42    call        Format
 00549A47    mov         edx,dword ptr [ebp-0E0]
 00549A4D    mov         eax,dword ptr [ebp-0C]
 00549A50    mov         ecx,dword ptr [eax]
 00549A52    call        dword ptr [ecx+18]
>00549A55    jmp         00549BD5
 00549A5A    lea         eax,[ebp-0EC]
 00549A60    push        eax
 00549A61    lea         edx,[ebp-0F0]
 00549A67    mov         eax,[0078D738];^SResString435:TResStringRec
 00549A6C    call        LoadResString
 00549A71    mov         eax,dword ptr [ebp-0F0]
 00549A77    mov         dword ptr [ebp-8C],eax
 00549A7D    mov         byte ptr [ebp-88],11
 00549A84    lea         edx,[ebp-0F4]
 00549A8A    mov         eax,[0078D9D0];^SResString437:TResStringRec
 00549A8F    call        LoadResString
 00549A94    mov         eax,dword ptr [ebp-0F4]
 00549A9A    mov         dword ptr [ebp-84],eax
 00549AA0    mov         byte ptr [ebp-80],11
 00549AA4    mov         eax,dword ptr [ebp-4]
 00549AA7    mov         edx,dword ptr [eax]
 00549AA9    call        dword ptr [edx+44]
 00549AAC    mov         dword ptr [ebp-7C],eax
 00549AAF    mov         byte ptr [ebp-78],5
 00549AB3    lea         edx,[ebp-8C]
 00549AB9    mov         ecx,2
 00549ABE    mov         eax,549D2C;'[%s=%s $%p]'
 00549AC3    call        Format
 00549AC8    mov         edx,dword ptr [ebp-0EC]
 00549ACE    mov         eax,dword ptr [ebp-0C]
 00549AD1    mov         ecx,dword ptr [eax]
 00549AD3    call        dword ptr [ecx+18]
>00549AD6    jmp         00549BD5
 00549ADB    lea         eax,[ebp-0F8]
 00549AE1    push        eax
 00549AE2    lea         edx,[ebp-0FC]
 00549AE8    mov         eax,[0078D738];^SResString435:TResStringRec
 00549AED    call        LoadResString
 00549AF2    mov         eax,dword ptr [ebp-0FC]
 00549AF8    mov         dword ptr [ebp-8C],eax
 00549AFE    mov         byte ptr [ebp-88],11
 00549B05    lea         edx,[ebp-100]
 00549B0B    mov         eax,[0078CB9C];^SResString436:TResStringRec
 00549B10    call        LoadResString
 00549B15    mov         eax,dword ptr [ebp-100]
 00549B1B    mov         dword ptr [ebp-84],eax
 00549B21    mov         byte ptr [ebp-80],11
 00549B25    mov         eax,dword ptr [ebp-4]
 00549B28    mov         edx,dword ptr [eax]
 00549B2A    call        dword ptr [edx+44]
 00549B2D    mov         dword ptr [ebp-7C],eax
 00549B30    mov         byte ptr [ebp-78],5
 00549B34    lea         edx,[ebp-8C]
 00549B3A    mov         eax,549D2C;'[%s=%s $%p]'
 00549B3F    mov         ecx,2
 00549B44    call        Format
 00549B49    mov         edx,dword ptr [ebp-0F8]
 00549B4F    mov         eax,dword ptr [ebp-0C]
 00549B52    mov         ecx,dword ptr [eax]
 00549B54    call        dword ptr [ecx+18]
>00549B57    jmp         00549BD5
 00549B59    lea         eax,[ebp-104]
 00549B5F    push        eax
 00549B60    lea         edx,[ebp-108]
 00549B66    mov         eax,[0078D738];^SResString435:TResStringRec
 00549B6B    call        LoadResString
 00549B70    mov         eax,dword ptr [ebp-108]
 00549B76    mov         dword ptr [ebp-8C],eax
 00549B7C    mov         byte ptr [ebp-88],11
 00549B83    lea         edx,[ebp-10C]
 00549B89    mov         eax,[0078D698];^SResString438:TResStringRec
 00549B8E    call        LoadResString
 00549B93    mov         eax,dword ptr [ebp-10C]
 00549B99    mov         dword ptr [ebp-84],eax
 00549B9F    mov         byte ptr [ebp-80],11
 00549BA3    mov         eax,dword ptr [ebp-4]
 00549BA6    mov         edx,dword ptr [eax]
 00549BA8    call        dword ptr [edx+44]
 00549BAB    mov         dword ptr [ebp-7C],eax
 00549BAE    mov         byte ptr [ebp-78],5
 00549BB2    lea         edx,[ebp-8C]
 00549BB8    mov         eax,549D2C;'[%s=%s $%p]'
 00549BBD    mov         ecx,2
 00549BC2    call        Format
 00549BC7    mov         edx,dword ptr [ebp-104]
 00549BCD    mov         eax,dword ptr [ebp-0C]
 00549BD0    mov         ecx,dword ptr [eax]
 00549BD2    call        dword ptr [ecx+18]
 00549BD5    xor         eax,eax
 00549BD7    pop         edx
 00549BD8    pop         ecx
 00549BD9    pop         ecx
 00549BDA    mov         dword ptr fs:[eax],edx
 00549BDD    push        549BF2
 00549BE2    mov         eax,dword ptr [ebp-0C]
 00549BE5    mov         edx,dword ptr [eax]
 00549BE7    call        dword ptr [edx+20]
 00549BEA    ret
>00549BEB    jmp         @HandleFinally
>00549BF0    jmp         00549BE2
 00549BF2    inc         dword ptr [ebp-10]
 00549BF5    dec         dword ptr [ebp-14]
>00549BF8    jne         0054951A
 00549BFE    xor         eax,eax
 00549C00    pop         edx
 00549C01    pop         ecx
 00549C02    pop         ecx
 00549C03    mov         dword ptr fs:[eax],edx
 00549C06    push        549C1B
 00549C0B    mov         eax,dword ptr [ebp-0C]
 00549C0E    mov         edx,dword ptr [eax]
 00549C10    call        dword ptr [edx+20]
 00549C13    ret
>00549C14    jmp         @HandleFinally
>00549C19    jmp         00549C0B
 00549C1B    xor         eax,eax
 00549C1D    pop         edx
 00549C1E    pop         ecx
 00549C1F    pop         ecx
 00549C20    mov         dword ptr fs:[eax],edx
 00549C23    push        549C87
 00549C28    lea         eax,[ebp-10C]
 00549C2E    mov         edx,20
 00549C33    call        @UStrArrayClr
 00549C38    lea         eax,[ebp-74]
 00549C3B    mov         edx,4
 00549C40    call        @UStrArrayClr
 00549C45    lea         eax,[ebp-54]
 00549C48    call        @UStrClr
 00549C4D    lea         eax,[ebp-50]
 00549C50    call        @IntfClear
 00549C55    lea         eax,[ebp-4C]
 00549C58    mov         edx,9
 00549C5D    call        @UStrArrayClr
 00549C62    lea         eax,[ebp-28]
 00549C65    call        @IntfClear
 00549C6A    lea         eax,[ebp-24]
 00549C6D    mov         edx,4
 00549C72    call        @UStrArrayClr
 00549C77    lea         eax,[ebp-4]
 00549C7A    call        @IntfClear
 00549C7F    ret
>00549C80    jmp         @HandleFinally
>00549C85    jmp         00549C28
 00549C87    mov         esp,ebp
 00549C89    pop         ebp
 00549C8A    ret
end;*}

//00549D44
{*procedure sub_00549D44(?:?);
begin
 00549D44    push        ebp
 00549D45    mov         ebp,esp
 00549D47    mov         ecx,12
 00549D4C    push        0
 00549D4E    push        0
 00549D50    dec         ecx
>00549D51    jne         00549D4C
 00549D53    push        ebx
 00549D54    push        esi
 00549D55    push        edi
 00549D56    mov         dword ptr [ebp-8],edx
 00549D59    mov         ebx,eax
 00549D5B    xor         eax,eax
 00549D5D    push        ebp
 00549D5E    push        54A2B7
 00549D63    push        dword ptr fs:[eax]
 00549D66    mov         dword ptr fs:[eax],esp
 00549D69    lea         edx,[ebp-10]
 00549D6C    mov         eax,ebx
 00549D6E    call        TJclClassTypeInfo.GetParent
 00549D73    cmp         dword ptr [ebp-10],0
>00549D77    je          00549DAA
 00549D79    lea         edx,[ebp-18]
 00549D7C    mov         eax,ebx
 00549D7E    call        TJclClassTypeInfo.GetParent
 00549D83    mov         eax,dword ptr [ebp-18]
 00549D86    lea         edx,[ebp-14]
 00549D89    mov         ecx,dword ptr [eax]
 00549D8B    call        dword ptr [ecx+14]
 00549D8E    mov         esi,dword ptr [ebp-14]
 00549D91    mov         edx,54A2D4;'TObject'
 00549D96    mov         dword ptr [ebp-1C],esi
 00549D99    mov         eax,dword ptr [ebp-1C]
 00549D9C    call        AnsiCompareText
 00549DA1    test        eax,eax
 00549DA3    sete        al
 00549DA6    xor         al,1
>00549DA8    jmp         00549DAC
 00549DAA    xor         eax,eax
 00549DAC    test        al,al
>00549DAE    je          00549E82
 00549DB4    lea         edx,[ebp-24]
 00549DB7    mov         eax,ebx
 00549DB9    call        TJclTypeInfo.GetName
 00549DBE    push        dword ptr [ebp-24]
 00549DC1    push        54A2F0;' = class('
 00549DC6    lea         edx,[ebp-2C]
 00549DC9    mov         eax,ebx
 00549DCB    call        TJclClassTypeInfo.GetParent
 00549DD0    mov         eax,dword ptr [ebp-2C]
 00549DD3    lea         edx,[ebp-28]
 00549DD6    mov         ecx,dword ptr [eax]
 00549DD8    call        dword ptr [ecx+14]
 00549DDB    push        dword ptr [ebp-28]
 00549DDE    lea         eax,[ebp-20]
 00549DE1    mov         edx,3
 00549DE6    call        @UStrCatN
 00549DEB    mov         edx,dword ptr [ebp-20]
 00549DEE    mov         eax,dword ptr [ebp-8]
 00549DF1    mov         ecx,dword ptr [eax]
 00549DF3    call        dword ptr [ecx+14]
 00549DF6    mov         eax,ebx
 00549DF8    call        TJclClassTypeInfo.GetClassRef
 00549DFD    call        TObject.GetInterfaceTable
 00549E02    mov         edi,eax
 00549E04    test        edi,edi
>00549E06    je          00549E5B
 00549E08    mov         esi,dword ptr [edi]
 00549E0A    dec         esi
 00549E0B    test        esi,esi
>00549E0D    jl          00549E5B
 00549E0F    inc         esi
 00549E10    mov         dword ptr [ebp-0C],0
 00549E17    push        54A310;', ['''
 00549E1C    mov         eax,dword ptr [ebp-0C]
 00549E1F    mov         edx,eax
 00549E21    add         eax,eax
 00549E23    add         eax,eax
 00549E25    add         eax,eax
 00549E27    sub         eax,edx
 00549E29    lea         eax,[edi+eax*4+4]
 00549E2D    lea         edx,[ebp-34]
 00549E30    call        0053D628
 00549E35    push        dword ptr [ebp-34]
 00549E38    push        54A328;''']'
 00549E3D    lea         eax,[ebp-30]
 00549E40    mov         edx,3
 00549E45    call        @UStrCatN
 00549E4A    mov         edx,dword ptr [ebp-30]
 00549E4D    mov         eax,dword ptr [ebp-8]
 00549E50    mov         ecx,dword ptr [eax]
 00549E52    call        dword ptr [ecx+14]
 00549E55    inc         dword ptr [ebp-0C]
 00549E58    dec         esi
>00549E59    jne         00549E17
 00549E5B    lea         edx,[ebp-3C]
 00549E5E    mov         eax,ebx
 00549E60    call        TJclClassTypeInfo.GetUnitName
 00549E65    mov         ecx,dword ptr [ebp-3C]
 00549E68    lea         eax,[ebp-38]
 00549E6B    mov         edx,54A33C;') // unit '
 00549E70    call        @UStrCat3
 00549E75    mov         edx,dword ptr [ebp-38]
 00549E78    mov         eax,dword ptr [ebp-8]
 00549E7B    mov         ecx,dword ptr [eax]
 00549E7D    call        dword ptr [ecx+18]
>00549E80    jmp         00549EB9
 00549E82    lea         edx,[ebp-44]
 00549E85    mov         eax,ebx
 00549E87    call        TJclTypeInfo.GetName
 00549E8C    push        dword ptr [ebp-44]
 00549E8F    push        54A360;' = class // unit '
 00549E94    lea         edx,[ebp-48]
 00549E97    mov         eax,ebx
 00549E99    call        TJclClassTypeInfo.GetUnitName
 00549E9E    push        dword ptr [ebp-48]
 00549EA1    lea         eax,[ebp-40]
 00549EA4    mov         edx,3
 00549EA9    call        @UStrCatN
 00549EAE    mov         edx,dword ptr [ebp-40]
 00549EB1    mov         eax,dword ptr [ebp-8]
 00549EB4    mov         ecx,dword ptr [eax]
 00549EB6    call        dword ptr [ecx+18]
 00549EB9    mov         eax,ebx
 00549EBB    call        TJclClassTypeInfo.GetPropertyCount
 00549EC0    test        eax,eax
>00549EC2    jle         0054A23A
 00549EC8    mov         edx,54A390;'published'
 00549ECD    mov         eax,dword ptr [ebp-8]
 00549ED0    mov         ecx,dword ptr [eax]
 00549ED2    call        dword ptr [ecx+18]
 00549ED5    mov         eax,dword ptr [ebp-8]
 00549ED8    mov         edx,dword ptr [eax]
 00549EDA    call        dword ptr [edx+1C]
 00549EDD    xor         eax,eax
 00549EDF    push        ebp
 00549EE0    push        54A233
 00549EE5    push        dword ptr fs:[eax]
 00549EE8    mov         dword ptr fs:[eax],esp
 00549EEB    mov         eax,ebx
 00549EED    call        TJclClassTypeInfo.GetPropertyCount
 00549EF2    mov         esi,eax
 00549EF4    dec         esi
 00549EF5    test        esi,esi
>00549EF7    jl          0054A21D
 00549EFD    inc         esi
 00549EFE    mov         dword ptr [ebp-0C],0
 00549F05    lea         ecx,[ebp-4]
 00549F08    mov         edx,dword ptr [ebp-0C]
 00549F0B    mov         eax,ebx
 00549F0D    call        TJclClassTypeInfo.GetProperties
 00549F12    push        54A3B0;'property '
 00549F17    lea         edx,[ebp-50]
 00549F1A    mov         eax,dword ptr [ebp-4]
 00549F1D    mov         ecx,dword ptr [eax]
 00549F1F    call        dword ptr [ecx+2C]
 00549F22    push        dword ptr [ebp-50]
 00549F25    push        54A3D0;': '
 00549F2A    lea         edx,[ebp-58]
 00549F2D    mov         eax,dword ptr [ebp-4]
 00549F30    mov         ecx,dword ptr [eax]
 00549F32    call        dword ptr [ecx+10]
 00549F35    mov         eax,dword ptr [ebp-58]
 00549F38    lea         edx,[ebp-54]
 00549F3B    mov         ecx,dword ptr [eax]
 00549F3D    call        dword ptr [ecx+14]
 00549F40    push        dword ptr [ebp-54]
 00549F43    lea         eax,[ebp-4C]
 00549F46    mov         edx,4
 00549F4B    call        @UStrCatN
 00549F50    mov         edx,dword ptr [ebp-4C]
 00549F53    mov         eax,dword ptr [ebp-8]
 00549F56    mov         ecx,dword ptr [eax]
 00549F58    call        dword ptr [ecx+14]
 00549F5B    mov         eax,dword ptr [ebp-4]
 00549F5E    mov         edx,dword ptr [eax]
 00549F60    call        dword ptr [edx+50]
 00549F63    test        al,al
>00549F65    je          00549F94
 00549F67    lea         eax,[ebp-5C]
 00549F6A    push        eax
 00549F6B    mov         eax,dword ptr [ebp-4]
 00549F6E    mov         edx,dword ptr [eax]
 00549F70    call        dword ptr [edx+20]
 00549F73    mov         dword ptr [ebp-64],eax
 00549F76    mov         byte ptr [ebp-60],0
 00549F7A    lea         edx,[ebp-64]
 00549F7D    xor         ecx,ecx
 00549F7F    mov         eax,54A3E4;' index %d'
 00549F84    call        Format
 00549F89    mov         edx,dword ptr [ebp-5C]
 00549F8C    mov         eax,dword ptr [ebp-8]
 00549F8F    mov         ecx,dword ptr [eax]
 00549F91    call        dword ptr [ecx+14]
 00549F94    mov         eax,dword ptr [ebp-4]
 00549F97    mov         edx,dword ptr [eax]
 00549F99    call        dword ptr [edx+30]
 00549F9C    dec         al
>00549F9E    je          00549FAD
 00549FA0    dec         al
>00549FA2    je          0054A00B
 00549FA4    dec         al
>00549FA6    je          00549FDC
>00549FA8    jmp         0054A038
 00549FAD    lea         eax,[ebp-68]
 00549FB0    push        eax
 00549FB1    mov         eax,dword ptr [ebp-4]
 00549FB4    mov         edx,dword ptr [eax]
 00549FB6    call        dword ptr [edx+3C]
 00549FB9    mov         dword ptr [ebp-64],eax
 00549FBC    mov         byte ptr [ebp-60],5
 00549FC0    lea         edx,[ebp-64]
 00549FC3    xor         ecx,ecx
 00549FC5    mov         eax,54A404;' read [static method $%p]'
 00549FCA    call        Format
 00549FCF    mov         edx,dword ptr [ebp-68]
 00549FD2    mov         eax,dword ptr [ebp-8]
 00549FD5    mov         ecx,dword ptr [eax]
 00549FD7    call        dword ptr [ecx+14]
>00549FDA    jmp         0054A038
 00549FDC    lea         eax,[ebp-6C]
 00549FDF    push        eax
 00549FE0    mov         eax,dword ptr [ebp-4]
 00549FE3    mov         edx,dword ptr [eax]
 00549FE5    call        dword ptr [edx+3C]
 00549FE8    mov         dword ptr [ebp-64],eax
 00549FEB    mov         byte ptr [ebp-60],5
 00549FEF    lea         edx,[ebp-64]
 00549FF2    xor         ecx,ecx
 00549FF4    mov         eax,54A444;' read [field $%p]'
 00549FF9    call        Format
 00549FFE    mov         edx,dword ptr [ebp-6C]
 0054A001    mov         eax,dword ptr [ebp-8]
 0054A004    mov         ecx,dword ptr [eax]
 0054A006    call        dword ptr [ecx+14]
>0054A009    jmp         0054A038
 0054A00B    lea         eax,[ebp-70]
 0054A00E    push        eax
 0054A00F    mov         eax,dword ptr [ebp-4]
 0054A012    mov         edx,dword ptr [eax]
 0054A014    call        dword ptr [edx+3C]
 0054A017    mov         dword ptr [ebp-64],eax
 0054A01A    mov         byte ptr [ebp-60],5
 0054A01E    lea         edx,[ebp-64]
 0054A021    xor         ecx,ecx
 0054A023    mov         eax,54A474;' read [virtual method $%p]'
 0054A028    call        Format
 0054A02D    mov         edx,dword ptr [ebp-70]
 0054A030    mov         eax,dword ptr [ebp-8]
 0054A033    mov         ecx,dword ptr [eax]
 0054A035    call        dword ptr [ecx+14]
 0054A038    mov         eax,dword ptr [ebp-4]
 0054A03B    mov         edx,dword ptr [eax]
 0054A03D    call        dword ptr [edx+34]
 0054A040    dec         al
>0054A042    je          0054A051
 0054A044    dec         al
>0054A046    je          0054A0AF
 0054A048    dec         al
>0054A04A    je          0054A080
>0054A04C    jmp         0054A0DC
 0054A051    lea         eax,[ebp-74]
 0054A054    push        eax
 0054A055    mov         eax,dword ptr [ebp-4]
 0054A058    mov         edx,dword ptr [eax]
 0054A05A    call        dword ptr [edx+40]
 0054A05D    mov         dword ptr [ebp-64],eax
 0054A060    mov         byte ptr [ebp-60],5
 0054A064    lea         edx,[ebp-64]
 0054A067    xor         ecx,ecx
 0054A069    mov         eax,54A4B8;' write [static method $%p]'
 0054A06E    call        Format
 0054A073    mov         edx,dword ptr [ebp-74]
 0054A076    mov         eax,dword ptr [ebp-8]
 0054A079    mov         ecx,dword ptr [eax]
 0054A07B    call        dword ptr [ecx+14]
>0054A07E    jmp         0054A0DC
 0054A080    lea         eax,[ebp-78]
 0054A083    push        eax
 0054A084    mov         eax,dword ptr [ebp-4]
 0054A087    mov         edx,dword ptr [eax]
 0054A089    call        dword ptr [edx+40]
 0054A08C    mov         dword ptr [ebp-64],eax
 0054A08F    mov         byte ptr [ebp-60],5
 0054A093    lea         edx,[ebp-64]
 0054A096    xor         ecx,ecx
 0054A098    mov         eax,54A4FC;' write [field $%p]'
 0054A09D    call        Format
 0054A0A2    mov         edx,dword ptr [ebp-78]
 0054A0A5    mov         eax,dword ptr [ebp-8]
 0054A0A8    mov         ecx,dword ptr [eax]
 0054A0AA    call        dword ptr [ecx+14]
>0054A0AD    jmp         0054A0DC
 0054A0AF    lea         eax,[ebp-7C]
 0054A0B2    push        eax
 0054A0B3    mov         eax,dword ptr [ebp-4]
 0054A0B6    mov         edx,dword ptr [eax]
 0054A0B8    call        dword ptr [edx+40]
 0054A0BB    mov         dword ptr [ebp-64],eax
 0054A0BE    mov         byte ptr [ebp-60],5
 0054A0C2    lea         edx,[ebp-64]
 0054A0C5    xor         ecx,ecx
 0054A0C7    mov         eax,54A530;' write [virtual method $%p]'
 0054A0CC    call        Format
 0054A0D1    mov         edx,dword ptr [ebp-7C]
 0054A0D4    mov         eax,dword ptr [ebp-8]
 0054A0D7    mov         ecx,dword ptr [eax]
 0054A0D9    call        dword ptr [ecx+14]
 0054A0DC    mov         eax,dword ptr [ebp-4]
 0054A0DF    mov         edx,dword ptr [eax]
 0054A0E1    call        dword ptr [edx+38]
 0054A0E4    dec         al
>0054A0E6    je          0054A12C
 0054A0E8    dec         al
>0054A0EA    je          0054A190
 0054A0F0    dec         al
>0054A0F2    je          0054A15B
 0054A0F4    dec         al
>0054A0F6    jne         0054A1C3
 0054A0FC    mov         eax,dword ptr [ebp-4]
 0054A0FF    mov         edx,dword ptr [eax]
 0054A101    call        dword ptr [edx+44]
 0054A104    test        al,al
>0054A106    je          0054A11A
 0054A108    mov         edx,54A574;' stored = True'
 0054A10D    mov         eax,dword ptr [ebp-8]
 0054A110    mov         ecx,dword ptr [eax]
 0054A112    call        dword ptr [ecx+14]
>0054A115    jmp         0054A1C3
 0054A11A    mov         edx,54A5A0;' stored = False'
 0054A11F    mov         eax,dword ptr [ebp-8]
 0054A122    mov         ecx,dword ptr [eax]
 0054A124    call        dword ptr [ecx+14]
>0054A127    jmp         0054A1C3
 0054A12C    lea         eax,[ebp-80]
 0054A12F    push        eax
 0054A130    mov         eax,dword ptr [ebp-4]
 0054A133    mov         edx,dword ptr [eax]
 0054A135    call        dword ptr [edx+44]
 0054A138    mov         dword ptr [ebp-64],eax
 0054A13B    mov         byte ptr [ebp-60],5
 0054A13F    lea         edx,[ebp-64]
 0054A142    xor         ecx,ecx
 0054A144    mov         eax,54A5CC;' stored = [static method $%p]'
 0054A149    call        Format
 0054A14E    mov         edx,dword ptr [ebp-80]
 0054A151    mov         eax,dword ptr [ebp-8]
 0054A154    mov         ecx,dword ptr [eax]
 0054A156    call        dword ptr [ecx+14]
>0054A159    jmp         0054A1C3
 0054A15B    lea         eax,[ebp-84]
 0054A161    push        eax
 0054A162    mov         eax,dword ptr [ebp-4]
 0054A165    mov         edx,dword ptr [eax]
 0054A167    call        dword ptr [edx+44]
 0054A16A    mov         dword ptr [ebp-64],eax
 0054A16D    mov         byte ptr [ebp-60],5
 0054A171    lea         edx,[ebp-64]
 0054A174    xor         ecx,ecx
 0054A176    mov         eax,54A614;' stored = [field $%p]'
 0054A17B    call        Format
 0054A180    mov         edx,dword ptr [ebp-84]
 0054A186    mov         eax,dword ptr [ebp-8]
 0054A189    mov         ecx,dword ptr [eax]
 0054A18B    call        dword ptr [ecx+14]
>0054A18E    jmp         0054A1C3
 0054A190    lea         eax,[ebp-88]
 0054A196    push        eax
 0054A197    mov         eax,dword ptr [ebp-4]
 0054A19A    mov         edx,dword ptr [eax]
 0054A19C    call        dword ptr [edx+44]
 0054A19F    mov         dword ptr [ebp-64],eax
 0054A1A2    mov         byte ptr [ebp-60],5
 0054A1A6    lea         edx,[ebp-64]
 0054A1A9    xor         ecx,ecx
 0054A1AB    mov         eax,54A64C;' stored = [virtual method $%p]'
 0054A1B0    call        Format
 0054A1B5    mov         edx,dword ptr [ebp-88]
 0054A1BB    mov         eax,dword ptr [ebp-8]
 0054A1BE    mov         ecx,dword ptr [eax]
 0054A1C0    call        dword ptr [ecx+14]
 0054A1C3    mov         eax,dword ptr [ebp-4]
 0054A1C6    mov         edx,dword ptr [eax]
 0054A1C8    call        dword ptr [edx+4C]
 0054A1CB    test        al,al
>0054A1CD    je          0054A206
 0054A1CF    mov         eax,dword ptr [ebp-4]
 0054A1D2    mov         edx,dword ptr [eax]
 0054A1D4    call        dword ptr [edx+24]
 0054A1D7    lea         edx,[ebp-90]
 0054A1DD    call        IntToStr
 0054A1E2    mov         ecx,dword ptr [ebp-90]
 0054A1E8    lea         eax,[ebp-8C]
 0054A1EE    mov         edx,54A698;' default '
 0054A1F3    call        @UStrCat3
 0054A1F8    mov         edx,dword ptr [ebp-8C]
 0054A1FE    mov         eax,dword ptr [ebp-8]
 0054A201    mov         ecx,dword ptr [eax]
 0054A203    call        dword ptr [ecx+14]
 0054A206    mov         edx,54A6B8;';'
 0054A20B    mov         eax,dword ptr [ebp-8]
 0054A20E    mov         ecx,dword ptr [eax]
 0054A210    call        dword ptr [ecx+18]
 0054A213    inc         dword ptr [ebp-0C]
 0054A216    dec         esi
>0054A217    jne         00549F05
 0054A21D    xor         eax,eax
 0054A21F    pop         edx
 0054A220    pop         ecx
 0054A221    pop         ecx
 0054A222    mov         dword ptr fs:[eax],edx
 0054A225    push        54A23A
 0054A22A    mov         eax,dword ptr [ebp-8]
 0054A22D    mov         edx,dword ptr [eax]
 0054A22F    call        dword ptr [edx+20]
 0054A232    ret
>0054A233    jmp         @HandleFinally
>0054A238    jmp         0054A22A
 0054A23A    mov         edx,54A6C8;'end;'
 0054A23F    mov         eax,dword ptr [ebp-8]
 0054A242    mov         ecx,dword ptr [eax]
 0054A244    call        dword ptr [ecx+18]
 0054A247    xor         eax,eax
 0054A249    pop         edx
 0054A24A    pop         ecx
 0054A24B    pop         ecx
 0054A24C    mov         dword ptr fs:[eax],edx
 0054A24F    push        54A2BE
 0054A254    lea         eax,[ebp-90]
 0054A25A    mov         edx,0B
 0054A25F    call        @UStrArrayClr
 0054A264    lea         eax,[ebp-5C]
 0054A267    call        @UStrClr
 0054A26C    lea         eax,[ebp-58]
 0054A26F    call        @IntfClear
 0054A274    lea         eax,[ebp-54]
 0054A277    mov         edx,0A
 0054A27C    call        @UStrArrayClr
 0054A281    lea         eax,[ebp-2C]
 0054A284    call        @IntfClear
 0054A289    lea         eax,[ebp-28]
 0054A28C    mov         edx,3
 0054A291    call        @UStrArrayClr
 0054A296    lea         eax,[ebp-18]
 0054A299    call        @IntfClear
 0054A29E    lea         eax,[ebp-14]
 0054A2A1    call        @UStrClr
 0054A2A6    lea         eax,[ebp-10]
 0054A2A9    call        @IntfClear
 0054A2AE    lea         eax,[ebp-4]
 0054A2B1    call        @IntfClear
 0054A2B6    ret
>0054A2B7    jmp         @HandleFinally
>0054A2BC    jmp         0054A254
 0054A2BE    pop         edi
 0054A2BF    pop         esi
 0054A2C0    pop         ebx
 0054A2C1    mov         esp,ebp
 0054A2C3    pop         ebp
 0054A2C4    ret
end;*}

//0054A6D4
constructor TJclEventParamInfo.Create(AParam:Pointer);
begin
{*
 0054A6D4    push        ebx
 0054A6D5    push        esi
 0054A6D6    push        edi
 0054A6D7    test        dl,dl
>0054A6D9    je          0054A6E3
 0054A6DB    add         esp,0FFFFFFF0
 0054A6DE    call        @ClassCreate
 0054A6E3    mov         esi,ecx
 0054A6E5    mov         ebx,edx
 0054A6E7    mov         edi,eax
 0054A6E9    xor         edx,edx
 0054A6EB    mov         eax,edi
 0054A6ED    call        TObject.Create
 0054A6F2    mov         dword ptr [edi+0C],esi;TJclEventParamInfo......FParam:Pointer
 0054A6F5    mov         eax,edi
 0054A6F7    test        bl,bl
>0054A6F9    je          0054A70A
 0054A6FB    call        @AfterConstruction
 0054A700    pop         dword ptr fs:[0]
 0054A707    add         esp,0C
 0054A70A    mov         eax,edi
 0054A70C    pop         edi
 0054A70D    pop         esi
 0054A70E    pop         ebx
 0054A70F    ret
*}
end;

//0054A710
function TJclEventParamInfo.GetFlags:TParamFlags;
begin
{*
 0054A710    push        ebx
 0054A711    push        esi
 0054A712    mov         esi,eax
 0054A714    mov         eax,esi
 0054A716    call        TJclEventParamInfo.GetParam
 0054A71B    movzx       ebx,byte ptr [eax]
 0054A71E    mov         eax,ebx
 0054A720    pop         esi
 0054A721    pop         ebx
 0054A722    ret
*}
end;

//0054A724
{*procedure TJclEventParamInfo.GetName(?:?);
begin
 0054A724    push        ebx
 0054A725    push        esi
 0054A726    mov         esi,edx
 0054A728    call        TJclEventParamInfo.GetParam
 0054A72D    mov         ebx,eax
 0054A72F    inc         ebx
 0054A730    mov         eax,esi
 0054A732    mov         edx,ebx
 0054A734    call        @UStrFromString
 0054A739    pop         esi
 0054A73A    pop         ebx
 0054A73B    ret
end;*}

//0054A73C
function TJclEventParamInfo.GetRecSize:Integer;
begin
{*
 0054A73C    push        ebp
 0054A73D    mov         ebp,esp
 0054A73F    push        0
 0054A741    push        0
 0054A743    push        0
 0054A745    push        ebx
 0054A746    push        esi
 0054A747    mov         esi,eax
 0054A749    xor         eax,eax
 0054A74B    push        ebp
 0054A74C    push        54A7B3
 0054A751    push        dword ptr fs:[eax]
 0054A754    mov         dword ptr fs:[eax],esp
 0054A757    lea         edx,[ebp-4]
 0054A75A    mov         eax,esi
 0054A75C    call        TJclEventParamInfo.GetName
 0054A761    mov         eax,dword ptr [ebp-4]
 0054A764    mov         dword ptr [ebp-8],eax
 0054A767    mov         ebx,dword ptr [ebp-8]
 0054A76A    test        ebx,ebx
>0054A76C    je          0054A773
 0054A76E    sub         ebx,4
 0054A771    mov         ebx,dword ptr [ebx]
 0054A773    lea         edx,[ebp-0C]
 0054A776    mov         eax,esi
 0054A778    call        TJclEventParamInfo.GetTypeName
 0054A77D    mov         eax,dword ptr [ebp-0C]
 0054A780    mov         dword ptr [ebp-8],eax
 0054A783    mov         eax,dword ptr [ebp-8]
 0054A786    test        eax,eax
>0054A788    je          0054A78F
 0054A78A    sub         eax,4
 0054A78D    mov         eax,dword ptr [eax]
 0054A78F    lea         eax,[eax+ebx+3]
 0054A793    mov         ebx,eax
 0054A795    xor         eax,eax
 0054A797    pop         edx
 0054A798    pop         ecx
 0054A799    pop         ecx
 0054A79A    mov         dword ptr fs:[eax],edx
 0054A79D    push        54A7BA
 0054A7A2    lea         eax,[ebp-0C]
 0054A7A5    call        @UStrClr
 0054A7AA    lea         eax,[ebp-4]
 0054A7AD    call        @UStrClr
 0054A7B2    ret
>0054A7B3    jmp         @HandleFinally
>0054A7B8    jmp         0054A7A2
 0054A7BA    mov         eax,ebx
 0054A7BC    pop         esi
 0054A7BD    pop         ebx
 0054A7BE    mov         esp,ebp
 0054A7C0    pop         ebp
 0054A7C1    ret
*}
end;

//0054A7C4
{*procedure TJclEventParamInfo.GetTypeName(?:?);
begin
 0054A7C4    push        ebx
 0054A7C5    push        esi
 0054A7C6    mov         esi,edx
 0054A7C8    call        TJclEventParamInfo.GetParam
 0054A7CD    mov         ebx,eax
 0054A7CF    inc         ebx
 0054A7D0    movzx       eax,byte ptr [ebx]
 0054A7D3    inc         eax
 0054A7D4    add         ebx,eax
 0054A7D6    mov         eax,esi
 0054A7D8    mov         edx,ebx
 0054A7DA    call        @UStrFromString
 0054A7DF    pop         esi
 0054A7E0    pop         ebx
 0054A7E1    ret
end;*}

//0054A7E4
function TJclEventParamInfo.GetParam:Pointer;
begin
{*
 0054A7E4    mov         eax,dword ptr [eax+0C];TJclEventParamInfo.......FParam:Pointer
 0054A7E7    ret
*}
end;

//0054A7E8
function TJclEventTypeInfo.GetMethodKind:TMethodKind;
begin
{*
 0054A7E8    push        ebx
 0054A7E9    mov         ebx,eax
 0054A7EB    mov         eax,ebx
 0054A7ED    call        TJclTypeInfo.GetTypeData
 0054A7F2    movzx       eax,byte ptr [eax]
 0054A7F5    pop         ebx
 0054A7F6    ret
*}
end;

//0054A7F8
function TJclEventTypeInfo.GetParameterCount:Integer;
begin
{*
 0054A7F8    push        ebx
 0054A7F9    mov         ebx,eax
 0054A7FB    mov         eax,ebx
 0054A7FD    call        TJclTypeInfo.GetTypeData
 0054A802    movzx       eax,byte ptr [eax+1]
 0054A806    pop         ebx
 0054A807    ret
*}
end;

//0054A808
{*procedure TJclEventTypeInfo.GetParameters(ParamIdx:Integer; ?:?);
begin
 0054A808    push        ebx
 0054A809    push        esi
 0054A80A    push        edi
 0054A80B    push        ebp
 0054A80C    mov         ebx,ecx
 0054A80E    mov         ebp,edx
 0054A810    mov         esi,eax
 0054A812    mov         eax,ebx
 0054A814    call        @IntfClear
 0054A819    mov         eax,esi
 0054A81B    call        TJclTypeInfo.GetTypeData
 0054A820    lea         edi,[eax+2]
 0054A823    mov         esi,ebp
 0054A825    test        esi,esi
>0054A827    jl          0054A855
 0054A829    mov         ecx,edi
 0054A82B    mov         dl,1
 0054A82D    mov         eax,[005464A4];TJclEventParamInfo
 0054A832    call        TJclEventParamInfo.Create;TJclEventParamInfo.Create
 0054A837    mov         edx,eax
 0054A839    test        edx,edx
>0054A83B    je          0054A840
 0054A83D    sub         edx,0FFFFFFF0
 0054A840    mov         eax,ebx
 0054A842    call        @IntfCopy
 0054A847    mov         eax,dword ptr [ebx]
 0054A849    mov         edx,dword ptr [eax]
 0054A84B    call        dword ptr [edx+14]
 0054A84E    add         edi,eax
 0054A850    dec         esi
 0054A851    test        esi,esi
>0054A853    jge         0054A829
 0054A855    pop         ebp
 0054A856    pop         edi
 0054A857    pop         esi
 0054A858    pop         ebx
 0054A859    ret
end;*}

//0054A85C
{*procedure TJclEventTypeInfo.GetResultTypeName(?:?);
begin
 0054A85C    push        ebp
 0054A85D    mov         ebp,esp
 0054A85F    push        0
 0054A861    push        ebx
 0054A862    push        esi
 0054A863    mov         esi,edx
 0054A865    mov         ebx,eax
 0054A867    xor         eax,eax
 0054A869    push        ebp
 0054A86A    push        54A8E9
 0054A86F    push        dword ptr fs:[eax]
 0054A872    mov         dword ptr fs:[eax],esp
 0054A875    mov         eax,ebx
 0054A877    call        TJclEventTypeInfo.GetMethodKind
 0054A87C    cmp         al,1
>0054A87E    jne         0054A8CC
 0054A880    mov         eax,ebx
 0054A882    call        TJclEventTypeInfo.GetParameterCount
 0054A887    test        eax,eax
>0054A889    jle         0054A8B5
 0054A88B    mov         eax,ebx
 0054A88D    call        TJclEventTypeInfo.GetParameterCount
 0054A892    mov         edx,eax
 0054A894    dec         edx
 0054A895    lea         ecx,[ebp-4]
 0054A898    mov         eax,ebx
 0054A89A    call        TJclEventTypeInfo.GetParameters
 0054A89F    mov         eax,dword ptr [ebp-4]
 0054A8A2    mov         edx,dword ptr [eax]
 0054A8A4    call        dword ptr [edx+1C]
 0054A8A7    mov         ebx,eax
 0054A8A9    mov         eax,dword ptr [ebp-4]
 0054A8AC    mov         edx,dword ptr [eax]
 0054A8AE    call        dword ptr [edx+14]
 0054A8B1    add         ebx,eax
>0054A8B3    jmp         0054A8C1
 0054A8B5    mov         eax,ebx
 0054A8B7    call        TJclTypeInfo.GetTypeData
 0054A8BC    add         eax,2
 0054A8BF    mov         ebx,eax
 0054A8C1    mov         eax,esi
 0054A8C3    mov         edx,ebx
 0054A8C5    call        @UStrFromString
>0054A8CA    jmp         0054A8D3
 0054A8CC    mov         eax,esi
 0054A8CE    call        @UStrClr
 0054A8D3    xor         eax,eax
 0054A8D5    pop         edx
 0054A8D6    pop         ecx
 0054A8D7    pop         ecx
 0054A8D8    mov         dword ptr fs:[eax],edx
 0054A8DB    push        54A8F0
 0054A8E0    lea         eax,[ebp-4]
 0054A8E3    call        @IntfClear
 0054A8E8    ret
>0054A8E9    jmp         @HandleFinally
>0054A8EE    jmp         0054A8E0
 0054A8F0    pop         esi
 0054A8F1    pop         ebx
 0054A8F2    pop         ecx
 0054A8F3    pop         ebp
 0054A8F4    ret
end;*}

//0054A8F8
{*procedure sub_0054A8F8(?:?);
begin
 0054A8F8    push        ebp
 0054A8F9    mov         ebp,esp
 0054A8FB    mov         ecx,8
 0054A900    push        0
 0054A902    push        0
 0054A904    dec         ecx
>0054A905    jne         0054A900
 0054A907    push        ebx
 0054A908    push        esi
 0054A909    mov         dword ptr [ebp-0C],edx
 0054A90C    mov         dword ptr [ebp-8],eax
 0054A90F    xor         eax,eax
 0054A911    push        ebp
 0054A912    push        54AB09
 0054A917    push        dword ptr fs:[eax]
 0054A91A    mov         dword ptr fs:[eax],esp
 0054A91D    mov         edx,dword ptr [ebp-0C]
 0054A920    mov         eax,dword ptr [ebp-8]
 0054A923    call        0054771C
 0054A928    lea         edx,[ebp-14]
 0054A92B    mov         eax,[0078D700];^SResString456:TResStringRec
 0054A930    call        LoadResString
 0054A935    lea         eax,[ebp-14]
 0054A938    push        eax
 0054A939    mov         eax,dword ptr [ebp-8]
 0054A93C    call        TJclTypeInfo.GetTypeData
 0054A941    mov         edx,eax
 0054A943    lea         ecx,[ebp-18]
 0054A946    mov         eax,[00436030];TMethodKind
 0054A94B    call        0054BEEC
 0054A950    mov         edx,dword ptr [ebp-18]
 0054A953    pop         eax
 0054A954    call        @UStrCat
 0054A959    mov         edx,dword ptr [ebp-14]
 0054A95C    mov         eax,dword ptr [ebp-0C]
 0054A95F    mov         ecx,dword ptr [eax]
 0054A961    call        dword ptr [ecx+18]
 0054A964    lea         edx,[ebp-1C]
 0054A967    mov         eax,[0078D098];^SResString457:TResStringRec
 0054A96C    call        LoadResString
 0054A971    lea         eax,[ebp-1C]
 0054A974    push        eax
 0054A975    mov         eax,dword ptr [ebp-8]
 0054A978    call        TJclEventTypeInfo.GetParameterCount
 0054A97D    lea         edx,[ebp-20]
 0054A980    call        IntToStr
 0054A985    mov         edx,dword ptr [ebp-20]
 0054A988    pop         eax
 0054A989    call        @UStrCat
 0054A98E    mov         edx,dword ptr [ebp-1C]
 0054A991    mov         eax,dword ptr [ebp-0C]
 0054A994    mov         ecx,dword ptr [eax]
 0054A996    call        dword ptr [ecx+18]
 0054A999    mov         eax,dword ptr [ebp-0C]
 0054A99C    mov         edx,dword ptr [eax]
 0054A99E    call        dword ptr [edx+1C]
 0054A9A1    xor         eax,eax
 0054A9A3    push        ebp
 0054A9A4    push        54AAA3
 0054A9A9    push        dword ptr fs:[eax]
 0054A9AC    mov         dword ptr fs:[eax],esp
 0054A9AF    mov         eax,dword ptr [ebp-8]
 0054A9B2    call        TJclEventTypeInfo.GetParameterCount
 0054A9B7    mov         esi,eax
 0054A9B9    dec         esi
 0054A9BA    test        esi,esi
>0054A9BC    jl          0054AA8D
 0054A9C2    inc         esi
 0054A9C3    xor         ebx,ebx
 0054A9C5    test        ebx,ebx
>0054A9C7    jle         0054A9D3
 0054A9C9    xor         edx,edx
 0054A9CB    mov         eax,dword ptr [ebp-0C]
 0054A9CE    mov         ecx,dword ptr [eax]
 0054A9D0    call        dword ptr [ecx+18]
 0054A9D3    lea         ecx,[ebp-4]
 0054A9D6    mov         edx,ebx
 0054A9D8    mov         eax,dword ptr [ebp-8]
 0054A9DB    call        TJclEventTypeInfo.GetParameters
 0054A9E0    mov         eax,dword ptr [ebp-4]
 0054A9E3    mov         edx,dword ptr [eax]
 0054A9E5    call        dword ptr [edx+0C]
 0054A9E8    mov         byte ptr [ebp-0D],al
 0054A9EB    lea         edx,[ebp-24]
 0054A9EE    mov         eax,[0078CB20];^SResString441:TResStringRec
 0054A9F3    call        LoadResString
 0054A9F8    lea         eax,[ebp-24]
 0054A9FB    push        eax
 0054A9FC    lea         edx,[ebp-28]
 0054A9FF    mov         eax,dword ptr [ebp-4]
 0054AA02    mov         ecx,dword ptr [eax]
 0054AA04    call        dword ptr [ecx+10]
 0054AA07    mov         edx,dword ptr [ebp-28]
 0054AA0A    pop         eax
 0054AA0B    call        @UStrCat
 0054AA10    mov         edx,dword ptr [ebp-24]
 0054AA13    mov         eax,dword ptr [ebp-0C]
 0054AA16    mov         ecx,dword ptr [eax]
 0054AA18    call        dword ptr [ecx+18]
 0054AA1B    lea         edx,[ebp-2C]
 0054AA1E    mov         eax,[0078DAC4];^SResString442:TResStringRec
 0054AA23    call        LoadResString
 0054AA28    lea         eax,[ebp-2C]
 0054AA2B    push        eax
 0054AA2C    lea         edx,[ebp-30]
 0054AA2F    mov         eax,dword ptr [ebp-4]
 0054AA32    mov         ecx,dword ptr [eax]
 0054AA34    call        dword ptr [ecx+18]
 0054AA37    mov         edx,dword ptr [ebp-30]
 0054AA3A    pop         eax
 0054AA3B    call        @UStrCat
 0054AA40    mov         edx,dword ptr [ebp-2C]
 0054AA43    mov         eax,dword ptr [ebp-0C]
 0054AA46    mov         ecx,dword ptr [eax]
 0054AA48    call        dword ptr [ecx+18]
 0054AA4B    lea         edx,[ebp-34]
 0054AA4E    mov         eax,[0078D1A4];^SResString443:TResStringRec
 0054AA53    call        LoadResString
 0054AA58    lea         eax,[ebp-34]
 0054AA5B    push        eax
 0054AA5C    push        0
 0054AA5E    lea         eax,[ebp-38]
 0054AA61    push        eax
 0054AA62    lea         edx,[ebp-0D]
 0054AA65    mov         cl,1
 0054AA67    mov         eax,[00436168];TParamFlags
 0054AA6C    call        0054C1D0
 0054AA71    mov         edx,dword ptr [ebp-38]
 0054AA74    pop         eax
 0054AA75    call        @UStrCat
 0054AA7A    mov         edx,dword ptr [ebp-34]
 0054AA7D    mov         eax,dword ptr [ebp-0C]
 0054AA80    mov         ecx,dword ptr [eax]
 0054AA82    call        dword ptr [ecx+18]
 0054AA85    inc         ebx
 0054AA86    dec         esi
>0054AA87    jne         0054A9C5
 0054AA8D    xor         eax,eax
 0054AA8F    pop         edx
 0054AA90    pop         ecx
 0054AA91    pop         ecx
 0054AA92    mov         dword ptr fs:[eax],edx
 0054AA95    push        54AAAA
 0054AA9A    mov         eax,dword ptr [ebp-0C]
 0054AA9D    mov         edx,dword ptr [eax]
 0054AA9F    call        dword ptr [edx+20]
 0054AAA2    ret
>0054AAA3    jmp         @HandleFinally
>0054AAA8    jmp         0054AA9A
 0054AAAA    mov         eax,dword ptr [ebp-8]
 0054AAAD    call        TJclEventTypeInfo.GetMethodKind
 0054AAB2    cmp         al,1
>0054AAB4    jne         0054AAE6
 0054AAB6    lea         edx,[ebp-3C]
 0054AAB9    mov         eax,[0078D6D0];^SResString458:TResStringRec
 0054AABE    call        LoadResString
 0054AAC3    lea         eax,[ebp-3C]
 0054AAC6    push        eax
 0054AAC7    lea         edx,[ebp-40]
 0054AACA    mov         eax,dword ptr [ebp-8]
 0054AACD    call        TJclEventTypeInfo.GetResultTypeName
 0054AAD2    mov         edx,dword ptr [ebp-40]
 0054AAD5    pop         eax
 0054AAD6    call        @UStrCat
 0054AADB    mov         edx,dword ptr [ebp-3C]
 0054AADE    mov         eax,dword ptr [ebp-0C]
 0054AAE1    mov         ecx,dword ptr [eax]
 0054AAE3    call        dword ptr [ecx+18]
 0054AAE6    xor         eax,eax
 0054AAE8    pop         edx
 0054AAE9    pop         ecx
 0054AAEA    pop         ecx
 0054AAEB    mov         dword ptr fs:[eax],edx
 0054AAEE    push        54AB10
 0054AAF3    lea         eax,[ebp-40]
 0054AAF6    mov         edx,0C
 0054AAFB    call        @UStrArrayClr
 0054AB00    lea         eax,[ebp-4]
 0054AB03    call        @IntfClear
 0054AB08    ret
>0054AB09    jmp         @HandleFinally
>0054AB0E    jmp         0054AAF3
 0054AB10    pop         esi
 0054AB11    pop         ebx
 0054AB12    mov         esp,ebp
 0054AB14    pop         ebp
 0054AB15    ret
end;*}

//0054AB18
{*procedure sub_0054AB18(?:?);
begin
 0054AB18    push        ebp
 0054AB19    mov         ebp,esp
 0054AB1B    mov         ecx,9
 0054AB20    push        0
 0054AB22    push        0
 0054AB24    dec         ecx
>0054AB25    jne         0054AB20
 0054AB27    push        ebx
 0054AB28    push        esi
 0054AB29    push        edi
 0054AB2A    mov         ebx,edx
 0054AB2C    mov         esi,eax
 0054AB2E    xor         eax,eax
 0054AB30    push        ebp
 0054AB31    push        54AD9F
 0054AB36    push        dword ptr fs:[eax]
 0054AB39    mov         dword ptr fs:[eax],esp
 0054AB3C    lea         edx,[ebp-14]
 0054AB3F    mov         eax,esi
 0054AB41    call        TJclTypeInfo.GetName
 0054AB46    lea         eax,[ebp-14]
 0054AB49    mov         edx,54ADBC;' = '
 0054AB4E    call        @UStrCat
 0054AB53    mov         edx,dword ptr [ebp-14]
 0054AB56    mov         eax,ebx
 0054AB58    mov         ecx,dword ptr [eax]
 0054AB5A    call        dword ptr [ecx+14]
 0054AB5D    mov         eax,esi
 0054AB5F    call        TJclEventTypeInfo.GetMethodKind
 0054AB64    cmp         al,1
>0054AB66    jne         0054AB76
 0054AB68    mov         edx,54ADD0;'function'
 0054AB6D    mov         eax,ebx
 0054AB6F    mov         ecx,dword ptr [eax]
 0054AB71    call        dword ptr [ecx+14]
>0054AB74    jmp         0054AB82
 0054AB76    mov         edx,54ADF0;'procedure'
 0054AB7B    mov         eax,ebx
 0054AB7D    mov         ecx,dword ptr [eax]
 0054AB7F    call        dword ptr [ecx+14]
 0054AB82    lea         eax,[ebp-4]
 0054AB85    mov         edx,54AE10;'('
 0054AB8A    call        @UStrLAsg
 0054AB8F    mov         eax,esi
 0054AB91    call        TJclEventTypeInfo.GetParameterCount
 0054AB96    dec         eax
 0054AB97    test        eax,eax
>0054AB99    jl          0054AD15
 0054AB9F    inc         eax
 0054ABA0    mov         dword ptr [ebp-10],eax
 0054ABA3    mov         dword ptr [ebp-0C],0
 0054ABAA    mov         edx,dword ptr [ebp-4]
 0054ABAD    mov         eax,ebx
 0054ABAF    mov         ecx,dword ptr [eax]
 0054ABB1    call        dword ptr [ecx+14]
 0054ABB4    lea         eax,[ebp-4]
 0054ABB7    mov         edx,54AE20;'; '
 0054ABBC    call        @UStrLAsg
 0054ABC1    lea         ecx,[ebp-8]
 0054ABC4    mov         edx,dword ptr [ebp-0C]
 0054ABC7    mov         eax,esi
 0054ABC9    call        TJclEventTypeInfo.GetParameters
 0054ABCE    mov         eax,dword ptr [ebp-8]
 0054ABD1    mov         edx,dword ptr [eax]
 0054ABD3    call        dword ptr [edx+0C]
 0054ABD6    test        al,1
>0054ABD8    je          0054ABF3
 0054ABDA    lea         edx,[ebp-18]
 0054ABDD    mov         eax,[0078D7E8];^SResString424:TResStringRec
 0054ABE2    call        LoadResString
 0054ABE7    mov         edx,dword ptr [ebp-18]
 0054ABEA    mov         eax,ebx
 0054ABEC    mov         ecx,dword ptr [eax]
 0054ABEE    call        dword ptr [ecx+14]
>0054ABF1    jmp         0054AC3B
 0054ABF3    mov         eax,dword ptr [ebp-8]
 0054ABF6    mov         edx,dword ptr [eax]
 0054ABF8    call        dword ptr [edx+0C]
 0054ABFB    test        al,2
>0054ABFD    je          0054AC18
 0054ABFF    lea         edx,[ebp-1C]
 0054AC02    mov         eax,[0078D174];^SResString425:TResStringRec
 0054AC07    call        LoadResString
 0054AC0C    mov         edx,dword ptr [ebp-1C]
 0054AC0F    mov         eax,ebx
 0054AC11    mov         ecx,dword ptr [eax]
 0054AC13    call        dword ptr [ecx+14]
>0054AC16    jmp         0054AC3B
 0054AC18    mov         eax,dword ptr [ebp-8]
 0054AC1B    mov         edx,dword ptr [eax]
 0054AC1D    call        dword ptr [edx+0C]
 0054AC20    test        al,20
>0054AC22    je          0054AC3B
 0054AC24    lea         edx,[ebp-20]
 0054AC27    mov         eax,[0078D430];^SResString427:TResStringRec
 0054AC2C    call        LoadResString
 0054AC31    mov         edx,dword ptr [ebp-20]
 0054AC34    mov         eax,ebx
 0054AC36    mov         ecx,dword ptr [eax]
 0054AC38    call        dword ptr [ecx+14]
 0054AC3B    lea         edx,[ebp-24]
 0054AC3E    mov         eax,dword ptr [ebp-8]
 0054AC41    mov         ecx,dword ptr [eax]
 0054AC43    call        dword ptr [ecx+10]
 0054AC46    mov         edx,dword ptr [ebp-24]
 0054AC49    mov         eax,ebx
 0054AC4B    mov         ecx,dword ptr [eax]
 0054AC4D    call        dword ptr [ecx+14]
 0054AC50    lea         edx,[ebp-28]
 0054AC53    mov         eax,dword ptr [ebp-8]
 0054AC56    mov         ecx,dword ptr [eax]
 0054AC58    call        dword ptr [ecx+18]
 0054AC5B    cmp         dword ptr [ebp-28],0
>0054AC5F    je          0054AD09
 0054AC65    mov         edx,54AE34;': '
 0054AC6A    mov         eax,ebx
 0054AC6C    mov         ecx,dword ptr [eax]
 0054AC6E    call        dword ptr [ecx+14]
 0054AC71    mov         eax,dword ptr [ebp-8]
 0054AC74    mov         edx,dword ptr [eax]
 0054AC76    call        dword ptr [edx+0C]
 0054AC79    test        al,4
>0054AC7B    je          0054AC94
 0054AC7D    lea         edx,[ebp-2C]
 0054AC80    mov         eax,[0078D8A8];^SResString426:TResStringRec
 0054AC85    call        LoadResString
 0054AC8A    mov         edx,dword ptr [ebp-2C]
 0054AC8D    mov         eax,ebx
 0054AC8F    mov         ecx,dword ptr [eax]
 0054AC91    call        dword ptr [ecx+14]
 0054AC94    lea         edx,[ebp-30]
 0054AC97    mov         eax,dword ptr [ebp-8]
 0054AC9A    mov         ecx,dword ptr [eax]
 0054AC9C    call        dword ptr [ecx+18]
 0054AC9F    mov         edi,dword ptr [ebp-30]
 0054ACA2    mov         edx,54AE48;'TVarRec'
 0054ACA7    mov         dword ptr [ebp-34],edi
 0054ACAA    mov         eax,dword ptr [ebp-34]
 0054ACAD    call        AnsiCompareText
 0054ACB2    test        eax,eax
 0054ACB4    sete        al
 0054ACB7    test        al,al
>0054ACB9    je          0054ACCA
 0054ACBB    mov         eax,dword ptr [ebp-8]
 0054ACBE    mov         edx,dword ptr [eax]
 0054ACC0    call        dword ptr [edx+0C]
 0054ACC3    test        al,4
 0054ACC5    setne       al
>0054ACC8    jmp         0054ACCC
 0054ACCA    xor         eax,eax
 0054ACCC    test        al,al
>0054ACCE    je          0054ACF4
 0054ACD0    lea         edx,[ebp-3C]
 0054ACD3    mov         eax,[0078D174];^SResString425:TResStringRec
 0054ACD8    call        LoadResString
 0054ACDD    mov         eax,dword ptr [ebp-3C]
 0054ACE0    lea         edx,[ebp-38]
 0054ACE3    call        TrimRight
 0054ACE8    mov         edx,dword ptr [ebp-38]
 0054ACEB    mov         eax,ebx
 0054ACED    mov         ecx,dword ptr [eax]
 0054ACEF    call        dword ptr [ecx+14]
>0054ACF2    jmp         0054AD09
 0054ACF4    lea         edx,[ebp-40]
 0054ACF7    mov         eax,dword ptr [ebp-8]
 0054ACFA    mov         ecx,dword ptr [eax]
 0054ACFC    call        dword ptr [ecx+18]
 0054ACFF    mov         edx,dword ptr [ebp-40]
 0054AD02    mov         eax,ebx
 0054AD04    mov         ecx,dword ptr [eax]
 0054AD06    call        dword ptr [ecx+14]
 0054AD09    inc         dword ptr [ebp-0C]
 0054AD0C    dec         dword ptr [ebp-10]
>0054AD0F    jne         0054ABAA
 0054AD15    mov         eax,esi
 0054AD17    call        TJclEventTypeInfo.GetParameterCount
 0054AD1C    test        eax,eax
>0054AD1E    je          0054AD2C
 0054AD20    mov         edx,54AE64;')'
 0054AD25    mov         eax,ebx
 0054AD27    mov         ecx,dword ptr [eax]
 0054AD29    call        dword ptr [ecx+14]
 0054AD2C    mov         eax,esi
 0054AD2E    call        TJclEventTypeInfo.GetMethodKind
 0054AD33    cmp         al,1
>0054AD35    jne         0054AD5B
 0054AD37    lea         edx,[ebp-48]
 0054AD3A    mov         eax,esi
 0054AD3C    call        TJclEventTypeInfo.GetResultTypeName
 0054AD41    mov         ecx,dword ptr [ebp-48]
 0054AD44    lea         eax,[ebp-44]
 0054AD47    mov         edx,54AE34;': '
 0054AD4C    call        @UStrCat3
 0054AD51    mov         edx,dword ptr [ebp-44]
 0054AD54    mov         eax,ebx
 0054AD56    mov         ecx,dword ptr [eax]
 0054AD58    call        dword ptr [ecx+14]
 0054AD5B    mov         edx,54AE74;' of object;'
 0054AD60    mov         eax,ebx
 0054AD62    mov         ecx,dword ptr [eax]
 0054AD64    call        dword ptr [ecx+18]
 0054AD67    xor         eax,eax
 0054AD69    pop         edx
 0054AD6A    pop         ecx
 0054AD6B    pop         ecx
 0054AD6C    mov         dword ptr fs:[eax],edx
 0054AD6F    push        54ADA6
 0054AD74    lea         eax,[ebp-48]
 0054AD77    mov         edx,5
 0054AD7C    call        @UStrArrayClr
 0054AD81    lea         eax,[ebp-30]
 0054AD84    mov         edx,8
 0054AD89    call        @UStrArrayClr
 0054AD8E    lea         eax,[ebp-8]
 0054AD91    call        @IntfClear
 0054AD96    lea         eax,[ebp-4]
 0054AD99    call        @UStrClr
 0054AD9E    ret
>0054AD9F    jmp         @HandleFinally
>0054ADA4    jmp         0054AD74
 0054ADA6    pop         edi
 0054ADA7    pop         esi
 0054ADA8    pop         ebx
 0054ADA9    mov         esp,ebp
 0054ADAB    pop         ebp
 0054ADAC    ret
end;*}

//0054AE8C
{*procedure TJclInterfaceTypeInfo.GetParent(?:?);
begin
 0054AE8C    push        ebp
 0054AE8D    mov         ebp,esp
 0054AE8F    push        0
 0054AE91    push        ebx
 0054AE92    push        esi
 0054AE93    mov         esi,edx
 0054AE95    mov         ebx,eax
 0054AE97    xor         eax,eax
 0054AE99    push        ebp
 0054AE9A    push        54AF00
 0054AE9F    push        dword ptr fs:[eax]
 0054AEA2    mov         dword ptr fs:[eax],esp
 0054AEA5    mov         eax,ebx
 0054AEA7    call        TJclTypeInfo.GetTypeData
 0054AEAC    cmp         dword ptr [eax],0
>0054AEAF    je          0054AEE3
 0054AEB1    mov         eax,ebx
 0054AEB3    call        TJclTypeInfo.GetTypeData
 0054AEB8    mov         eax,dword ptr [eax]
 0054AEBA    cmp         dword ptr [eax],0
>0054AEBD    je          0054AEE3
 0054AEBF    mov         eax,ebx
 0054AEC1    call        TJclTypeInfo.GetTypeData
 0054AEC6    mov         eax,dword ptr [eax]
 0054AEC8    mov         eax,dword ptr [eax]
 0054AECA    lea         edx,[ebp-4]
 0054AECD    call        0054BBB0
 0054AED2    mov         edx,dword ptr [ebp-4]
 0054AED5    mov         eax,esi
 0054AED7    mov         ecx,54AF0C;['{7DAD522B-46EA-11D5-B0C0-4854E825F345}']
 0054AEDC    call        @IntfCast
>0054AEE1    jmp         0054AEEA
 0054AEE3    mov         eax,esi
 0054AEE5    call        @IntfClear
 0054AEEA    xor         eax,eax
 0054AEEC    pop         edx
 0054AEED    pop         ecx
 0054AEEE    pop         ecx
 0054AEEF    mov         dword ptr fs:[eax],edx
 0054AEF2    push        54AF07
 0054AEF7    lea         eax,[ebp-4]
 0054AEFA    call        @IntfClear
 0054AEFF    ret
>0054AF00    jmp         @HandleFinally
>0054AF05    jmp         0054AEF7
 0054AF07    pop         esi
 0054AF08    pop         ebx
 0054AF09    pop         ecx
 0054AF0A    pop         ebp
 0054AF0B    ret
end;*}

//0054AF1C
function TJclInterfaceTypeInfo.GetFlags:TIntfFlagsBase;
begin
{*
 0054AF1C    push        ebx
 0054AF1D    push        esi
 0054AF1E    mov         esi,eax
 0054AF20    mov         eax,esi
 0054AF22    call        TJclTypeInfo.GetTypeData
 0054AF27    movzx       ebx,byte ptr [eax+4]
 0054AF2B    mov         eax,ebx
 0054AF2D    pop         esi
 0054AF2E    pop         ebx
 0054AF2F    ret
*}
end;

//0054AF30
{*procedure TJclInterfaceTypeInfo.GetGUID(?:?);
begin
 0054AF30    push        ebx
 0054AF31    push        esi
 0054AF32    push        edi
 0054AF33    mov         esi,edx
 0054AF35    mov         ebx,eax
 0054AF37    mov         eax,ebx
 0054AF39    call        TJclInterfaceTypeInfo.GetFlags
 0054AF3E    test        al,1
>0054AF40    je          0054AF54
 0054AF42    mov         eax,ebx
 0054AF44    call        TJclTypeInfo.GetTypeData
 0054AF49    mov         edi,esi
 0054AF4B    lea         esi,[eax+5]
 0054AF4E    movs        dword ptr [edi],dword ptr [esi]
 0054AF4F    movs        dword ptr [edi],dword ptr [esi]
 0054AF50    movs        dword ptr [edi],dword ptr [esi]
 0054AF51    movs        dword ptr [edi],dword ptr [esi]
>0054AF52    jmp         0054AF5F
 0054AF54    mov         edi,esi
 0054AF56    mov         esi,788D68
 0054AF5B    movs        dword ptr [edi],dword ptr [esi]
 0054AF5C    movs        dword ptr [edi],dword ptr [esi]
 0054AF5D    movs        dword ptr [edi],dword ptr [esi]
 0054AF5E    movs        dword ptr [edi],dword ptr [esi]
 0054AF5F    pop         edi
 0054AF60    pop         esi
 0054AF61    pop         ebx
 0054AF62    ret
end;*}

//0054AF64
function TJclInterfaceTypeInfo.GetPropertyCount:Integer;
begin
{*
 0054AF64    push        ebp
 0054AF65    mov         ebp,esp
 0054AF67    add         esp,0FFFFFFF8
 0054AF6A    push        ebx
 0054AF6B    push        esi
 0054AF6C    xor         edx,edx
 0054AF6E    mov         dword ptr [ebp-4],edx
 0054AF71    mov         ebx,eax
 0054AF73    xor         eax,eax
 0054AF75    push        ebp
 0054AF76    push        54AFC3
 0054AF7B    push        dword ptr fs:[eax]
 0054AF7E    mov         dword ptr fs:[eax],esp
 0054AF81    mov         eax,ebx
 0054AF83    call        TJclTypeInfo.GetTypeData
 0054AF88    lea         esi,[eax+15]
 0054AF8B    lea         edx,[ebp-4]
 0054AF8E    mov         eax,ebx
 0054AF90    call        TJclInterfaceTypeInfo.GetUnitName
 0054AF95    mov         eax,dword ptr [ebp-4]
 0054AF98    mov         dword ptr [ebp-8],eax
 0054AF9B    mov         eax,dword ptr [ebp-8]
 0054AF9E    test        eax,eax
>0054AFA0    je          0054AFA7
 0054AFA2    sub         eax,4
 0054AFA5    mov         eax,dword ptr [eax]
 0054AFA7    inc         eax
 0054AFA8    add         esi,eax
 0054AFAA    movzx       ebx,word ptr [esi]
 0054AFAD    xor         eax,eax
 0054AFAF    pop         edx
 0054AFB0    pop         ecx
 0054AFB1    pop         ecx
 0054AFB2    mov         dword ptr fs:[eax],edx
 0054AFB5    push        54AFCA
 0054AFBA    lea         eax,[ebp-4]
 0054AFBD    call        @UStrClr
 0054AFC2    ret
>0054AFC3    jmp         @HandleFinally
>0054AFC8    jmp         0054AFBA
 0054AFCA    mov         eax,ebx
 0054AFCC    pop         esi
 0054AFCD    pop         ebx
 0054AFCE    pop         ecx
 0054AFCF    pop         ecx
 0054AFD0    pop         ebp
 0054AFD1    ret
*}
end;

//0054AFD4
{*procedure TJclInterfaceTypeInfo.GetUnitName(?:?);
begin
 0054AFD4    push        ebx
 0054AFD5    push        esi
 0054AFD6    mov         esi,edx
 0054AFD8    mov         ebx,eax
 0054AFDA    mov         eax,ebx
 0054AFDC    call        TJclTypeInfo.GetTypeData
 0054AFE1    lea         edx,[eax+15]
 0054AFE4    mov         eax,esi
 0054AFE6    call        @UStrFromString
 0054AFEB    pop         esi
 0054AFEC    pop         ebx
 0054AFED    ret
end;*}

//0054AFF0
{*procedure sub_0054AFF0(?:?);
begin
 0054AFF0    push        ebp
 0054AFF1    mov         ebp,esp
 0054AFF3    mov         ecx,8
 0054AFF8    push        0
 0054AFFA    push        0
 0054AFFC    dec         ecx
>0054AFFD    jne         0054AFF8
 0054AFFF    push        ecx
 0054B000    push        ebx
 0054B001    push        esi
 0054B002    mov         esi,edx
 0054B004    mov         ebx,eax
 0054B006    xor         eax,eax
 0054B008    push        ebp
 0054B009    push        54B1A0
 0054B00E    push        dword ptr fs:[eax]
 0054B011    mov         dword ptr fs:[eax],esp
 0054B014    mov         edx,esi
 0054B016    mov         eax,ebx
 0054B018    call        0054771C
 0054B01D    mov         eax,ebx
 0054B01F    call        TJclInterfaceTypeInfo.GetFlags
 0054B024    test        al,1
>0054B026    je          0054B061
 0054B028    lea         edx,[ebp-8]
 0054B02B    mov         eax,[0078D05C];^SResString444:TResStringRec
 0054B030    call        LoadResString
 0054B035    lea         eax,[ebp-8]
 0054B038    push        eax
 0054B039    lea         edx,[ebp-1C]
 0054B03C    mov         eax,ebx
 0054B03E    call        TJclInterfaceTypeInfo.GetGUID
 0054B043    lea         eax,[ebp-1C]
 0054B046    lea         edx,[ebp-0C]
 0054B049    call        0053D628
 0054B04E    mov         edx,dword ptr [ebp-0C]
 0054B051    pop         eax
 0054B052    call        @UStrCat
 0054B057    mov         edx,dword ptr [ebp-8]
 0054B05A    mov         eax,esi
 0054B05C    mov         ecx,dword ptr [eax]
 0054B05E    call        dword ptr [ecx+18]
 0054B061    mov         eax,ebx
 0054B063    call        TJclInterfaceTypeInfo.GetFlags
 0054B068    mov         byte ptr [ebp-1],al
 0054B06B    lea         edx,[ebp-20]
 0054B06E    mov         eax,[0078D1A4];^SResString443:TResStringRec
 0054B073    call        LoadResString
 0054B078    lea         eax,[ebp-20]
 0054B07B    push        eax
 0054B07C    push        0
 0054B07E    lea         eax,[ebp-24]
 0054B081    push        eax
 0054B082    lea         edx,[ebp-1]
 0054B085    mov         cl,1
 0054B087    mov         eax,[004361CC];TIntfFlagsBase
 0054B08C    call        0054C1D0
 0054B091    mov         edx,dword ptr [ebp-24]
 0054B094    pop         eax
 0054B095    call        @UStrCat
 0054B09A    mov         edx,dword ptr [ebp-20]
 0054B09D    mov         eax,esi
 0054B09F    mov         ecx,dword ptr [eax]
 0054B0A1    call        dword ptr [ecx+18]
 0054B0A4    lea         edx,[ebp-28]
 0054B0A7    mov         eax,[0078CDB8];^SResString453:TResStringRec
 0054B0AC    call        LoadResString
 0054B0B1    lea         eax,[ebp-28]
 0054B0B4    push        eax
 0054B0B5    lea         edx,[ebp-2C]
 0054B0B8    mov         eax,ebx
 0054B0BA    call        TJclInterfaceTypeInfo.GetUnitName
 0054B0BF    mov         edx,dword ptr [ebp-2C]
 0054B0C2    pop         eax
 0054B0C3    call        @UStrCat
 0054B0C8    mov         edx,dword ptr [ebp-28]
 0054B0CB    mov         eax,esi
 0054B0CD    mov         ecx,dword ptr [eax]
 0054B0CF    call        dword ptr [ecx+18]
 0054B0D2    lea         edx,[ebp-30]
 0054B0D5    mov         eax,ebx
 0054B0D7    call        TJclInterfaceTypeInfo.GetParent
 0054B0DC    cmp         dword ptr [ebp-30],0
>0054B0E0    je          0054B11B
 0054B0E2    lea         edx,[ebp-34]
 0054B0E5    mov         eax,[0078D0BC];^SResString451:TResStringRec
 0054B0EA    call        LoadResString
 0054B0EF    lea         eax,[ebp-34]
 0054B0F2    push        eax
 0054B0F3    lea         edx,[ebp-3C]
 0054B0F6    mov         eax,ebx
 0054B0F8    call        TJclInterfaceTypeInfo.GetParent
 0054B0FD    mov         eax,dword ptr [ebp-3C]
 0054B100    lea         edx,[ebp-38]
 0054B103    mov         ecx,dword ptr [eax]
 0054B105    call        dword ptr [ecx+14]
 0054B108    mov         edx,dword ptr [ebp-38]
 0054B10B    pop         eax
 0054B10C    call        @UStrCat
 0054B111    mov         edx,dword ptr [ebp-34]
 0054B114    mov         eax,esi
 0054B116    mov         ecx,dword ptr [eax]
 0054B118    call        dword ptr [ecx+18]
 0054B11B    lea         edx,[ebp-40]
 0054B11E    mov         eax,[0078D73C];^SResString452:TResStringRec
 0054B123    call        LoadResString
 0054B128    lea         eax,[ebp-40]
 0054B12B    push        eax
 0054B12C    mov         eax,ebx
 0054B12E    call        TJclInterfaceTypeInfo.GetPropertyCount
 0054B133    lea         edx,[ebp-44]
 0054B136    call        IntToStr
 0054B13B    mov         edx,dword ptr [ebp-44]
 0054B13E    pop         eax
 0054B13F    call        @UStrCat
 0054B144    mov         edx,dword ptr [ebp-40]
 0054B147    mov         eax,esi
 0054B149    mov         ecx,dword ptr [eax]
 0054B14B    call        dword ptr [ecx+18]
 0054B14E    xor         eax,eax
 0054B150    pop         edx
 0054B151    pop         ecx
 0054B152    pop         ecx
 0054B153    mov         dword ptr fs:[eax],edx
 0054B156    push        54B1A7
 0054B15B    lea         eax,[ebp-44]
 0054B15E    mov         edx,2
 0054B163    call        @UStrArrayClr
 0054B168    lea         eax,[ebp-3C]
 0054B16B    call        @IntfClear
 0054B170    lea         eax,[ebp-38]
 0054B173    mov         edx,2
 0054B178    call        @UStrArrayClr
 0054B17D    lea         eax,[ebp-30]
 0054B180    call        @IntfClear
 0054B185    lea         eax,[ebp-2C]
 0054B188    mov         edx,4
 0054B18D    call        @UStrArrayClr
 0054B192    lea         eax,[ebp-0C]
 0054B195    mov         edx,2
 0054B19A    call        @UStrArrayClr
 0054B19F    ret
>0054B1A0    jmp         @HandleFinally
>0054B1A5    jmp         0054B15B
 0054B1A7    pop         esi
 0054B1A8    pop         ebx
 0054B1A9    mov         esp,ebp
 0054B1AB    pop         ebp
 0054B1AC    ret
end;*}

//0054B1B0
{*procedure sub_0054B1B0(?:?);
begin
 0054B1B0    push        ebp
 0054B1B1    mov         ebp,esp
 0054B1B3    mov         ecx,8
 0054B1B8    push        0
 0054B1BA    push        0
 0054B1BC    dec         ecx
>0054B1BD    jne         0054B1B8
 0054B1BF    push        ecx
 0054B1C0    push        ebx
 0054B1C1    push        esi
 0054B1C2    mov         dword ptr [ebp-4],edx
 0054B1C5    mov         ebx,eax
 0054B1C7    xor         eax,eax
 0054B1C9    push        ebp
 0054B1CA    push        54B39E
 0054B1CF    push        dword ptr fs:[eax]
 0054B1D2    mov         dword ptr fs:[eax],esp
 0054B1D5    lea         edx,[ebp-8]
 0054B1D8    mov         eax,ebx
 0054B1DA    call        TJclTypeInfo.GetName
 0054B1DF    lea         eax,[ebp-8]
 0054B1E2    mov         edx,54B3B8;' = '
 0054B1E7    call        @UStrCat
 0054B1EC    mov         edx,dword ptr [ebp-8]
 0054B1EF    mov         eax,dword ptr [ebp-4]
 0054B1F2    mov         ecx,dword ptr [eax]
 0054B1F4    call        dword ptr [ecx+14]
 0054B1F7    mov         eax,ebx
 0054B1F9    call        TJclInterfaceTypeInfo.GetFlags
 0054B1FE    test        al,2
>0054B200    je          0054B211
 0054B202    mov         edx,54B3CC;'dispinterface'
 0054B207    mov         eax,dword ptr [ebp-4]
 0054B20A    mov         ecx,dword ptr [eax]
 0054B20C    call        dword ptr [ecx+14]
>0054B20F    jmp         0054B21E
 0054B211    mov         edx,54B3F4;'interface'
 0054B216    mov         eax,dword ptr [ebp-4]
 0054B219    mov         ecx,dword ptr [eax]
 0054B21B    call        dword ptr [ecx+14]
 0054B21E    lea         edx,[ebp-0C]
 0054B221    mov         eax,ebx
 0054B223    call        TJclInterfaceTypeInfo.GetParent
 0054B228    cmp         dword ptr [ebp-0C],0
>0054B22C    je          0054B2A4
 0054B22E    mov         eax,ebx
 0054B230    call        TJclInterfaceTypeInfo.GetFlags
 0054B235    test        al,2
>0054B237    jne         0054B2A4
 0054B239    lea         edx,[ebp-14]
 0054B23C    mov         eax,ebx
 0054B23E    call        TJclInterfaceTypeInfo.GetParent
 0054B243    mov         eax,dword ptr [ebp-14]
 0054B246    lea         edx,[ebp-10]
 0054B249    mov         ecx,dword ptr [eax]
 0054B24B    call        dword ptr [ecx+14]
 0054B24E    mov         esi,dword ptr [ebp-10]
 0054B251    mov         edx,54B414;'IUnknown'
 0054B256    mov         dword ptr [ebp-18],esi
 0054B259    mov         eax,dword ptr [ebp-18]
 0054B25C    call        AnsiCompareText
 0054B261    test        eax,eax
 0054B263    sete        al
 0054B266    test        al,al
>0054B268    jne         0054B2A4
 0054B26A    push        54B434;'('
 0054B26F    lea         edx,[ebp-24]
 0054B272    mov         eax,ebx
 0054B274    call        TJclInterfaceTypeInfo.GetParent
 0054B279    mov         eax,dword ptr [ebp-24]
 0054B27C    lea         edx,[ebp-20]
 0054B27F    mov         ecx,dword ptr [eax]
 0054B281    call        dword ptr [ecx+14]
 0054B284    push        dword ptr [ebp-20]
 0054B287    push        54B444;')'
 0054B28C    lea         eax,[ebp-1C]
 0054B28F    mov         edx,3
 0054B294    call        @UStrCatN
 0054B299    mov         edx,dword ptr [ebp-1C]
 0054B29C    mov         eax,dword ptr [ebp-4]
 0054B29F    mov         ecx,dword ptr [eax]
 0054B2A1    call        dword ptr [ecx+14]
 0054B2A4    lea         edx,[ebp-2C]
 0054B2A7    mov         eax,ebx
 0054B2A9    call        TJclInterfaceTypeInfo.GetUnitName
 0054B2AE    mov         ecx,dword ptr [ebp-2C]
 0054B2B1    lea         eax,[ebp-28]
 0054B2B4    mov         edx,54B454;' // unit '
 0054B2B9    call        @UStrCat3
 0054B2BE    mov         edx,dword ptr [ebp-28]
 0054B2C1    mov         eax,dword ptr [ebp-4]
 0054B2C4    mov         ecx,dword ptr [eax]
 0054B2C6    call        dword ptr [ecx+18]
 0054B2C9    mov         eax,dword ptr [ebp-4]
 0054B2CC    mov         edx,dword ptr [eax]
 0054B2CE    call        dword ptr [edx+1C]
 0054B2D1    xor         eax,eax
 0054B2D3    push        ebp
 0054B2D4    push        54B347
 0054B2D9    push        dword ptr fs:[eax]
 0054B2DC    mov         dword ptr fs:[eax],esp
 0054B2DF    mov         eax,ebx
 0054B2E1    call        TJclInterfaceTypeInfo.GetFlags
 0054B2E6    test        al,1
>0054B2E8    je          0054B324
 0054B2EA    push        54B474;'['''
 0054B2EF    lea         edx,[ebp-44]
 0054B2F2    mov         eax,ebx
 0054B2F4    call        TJclInterfaceTypeInfo.GetGUID
 0054B2F9    lea         eax,[ebp-44]
 0054B2FC    lea         edx,[ebp-34]
 0054B2FF    call        0053D628
 0054B304    push        dword ptr [ebp-34]
 0054B307    push        54B488;''']'
 0054B30C    lea         eax,[ebp-30]
 0054B30F    mov         edx,3
 0054B314    call        @UStrCatN
 0054B319    mov         edx,dword ptr [ebp-30]
 0054B31C    mov         eax,dword ptr [ebp-4]
 0054B31F    mov         ecx,dword ptr [eax]
 0054B321    call        dword ptr [ecx+18]
 0054B324    xor         eax,eax
 0054B326    pop         edx
 0054B327    pop         ecx
 0054B328    pop         ecx
 0054B329    mov         dword ptr fs:[eax],edx
 0054B32C    push        54B34E
 0054B331    mov         eax,dword ptr [ebp-4]
 0054B334    mov         edx,dword ptr [eax]
 0054B336    call        dword ptr [edx+20]
 0054B339    mov         edx,54B49C;'end;'
 0054B33E    mov         eax,dword ptr [ebp-4]
 0054B341    mov         ecx,dword ptr [eax]
 0054B343    call        dword ptr [ecx+18]
 0054B346    ret
>0054B347    jmp         @HandleFinally
>0054B34C    jmp         0054B331
 0054B34E    xor         eax,eax
 0054B350    pop         edx
 0054B351    pop         ecx
 0054B352    pop         ecx
 0054B353    mov         dword ptr fs:[eax],edx
 0054B356    push        54B3A5
 0054B35B    lea         eax,[ebp-34]
 0054B35E    mov         edx,4
 0054B363    call        @UStrArrayClr
 0054B368    lea         eax,[ebp-24]
 0054B36B    call        @IntfClear
 0054B370    lea         eax,[ebp-20]
 0054B373    mov         edx,2
 0054B378    call        @UStrArrayClr
 0054B37D    lea         eax,[ebp-14]
 0054B380    call        @IntfClear
 0054B385    lea         eax,[ebp-10]
 0054B388    call        @UStrClr
 0054B38D    lea         eax,[ebp-0C]
 0054B390    call        @IntfClear
 0054B395    lea         eax,[ebp-8]
 0054B398    call        @UStrClr
 0054B39D    ret
>0054B39E    jmp         @HandleFinally
>0054B3A3    jmp         0054B35B
 0054B3A5    pop         esi
 0054B3A6    pop         ebx
 0054B3A7    mov         esp,ebp
 0054B3A9    pop         ebp
 0054B3AA    ret
end;*}

//0054B4A8
procedure TJclInt64TypeInfo.GetMinValue;
begin
{*
 0054B4A8    push        ebx
 0054B4A9    add         esp,0FFFFFFF8
 0054B4AC    mov         ebx,eax
 0054B4AE    mov         eax,ebx
 0054B4B0    call        TJclTypeInfo.GetTypeData
 0054B4B5    mov         edx,dword ptr [eax]
 0054B4B7    mov         dword ptr [esp],edx
 0054B4BA    mov         edx,dword ptr [eax+4]
 0054B4BD    mov         dword ptr [esp+4],edx
 0054B4C1    mov         eax,dword ptr [esp]
 0054B4C4    mov         edx,dword ptr [esp+4]
 0054B4C8    pop         ecx
 0054B4C9    pop         edx
 0054B4CA    pop         ebx
 0054B4CB    ret
*}
end;

//0054B4CC
procedure TJclInt64TypeInfo.GetMaxValue;
begin
{*
 0054B4CC    push        ebx
 0054B4CD    add         esp,0FFFFFFF8
 0054B4D0    mov         ebx,eax
 0054B4D2    mov         eax,ebx
 0054B4D4    call        TJclTypeInfo.GetTypeData
 0054B4D9    mov         edx,dword ptr [eax+8]
 0054B4DC    mov         dword ptr [esp],edx
 0054B4DF    mov         edx,dword ptr [eax+0C]
 0054B4E2    mov         dword ptr [esp+4],edx
 0054B4E6    mov         eax,dword ptr [esp]
 0054B4E9    mov         edx,dword ptr [esp+4]
 0054B4ED    pop         ecx
 0054B4EE    pop         edx
 0054B4EF    pop         ebx
 0054B4F0    ret
*}
end;

//0054B4F4
{*procedure sub_0054B4F4(?:?);
begin
 0054B4F4    push        ebp
 0054B4F5    mov         ebp,esp
 0054B4F7    xor         ecx,ecx
 0054B4F9    push        ecx
 0054B4FA    push        ecx
 0054B4FB    push        ecx
 0054B4FC    push        ecx
 0054B4FD    push        ebx
 0054B4FE    push        esi
 0054B4FF    mov         esi,edx
 0054B501    mov         ebx,eax
 0054B503    xor         eax,eax
 0054B505    push        ebp
 0054B506    push        54B59F
 0054B50B    push        dword ptr fs:[eax]
 0054B50E    mov         dword ptr fs:[eax],esp
 0054B511    mov         edx,esi
 0054B513    mov         eax,ebx
 0054B515    call        0054771C
 0054B51A    lea         edx,[ebp-4]
 0054B51D    mov         eax,[0078CCB8];^SResString447:TResStringRec
 0054B522    call        LoadResString
 0054B527    lea         eax,[ebp-4]
 0054B52A    push        eax
 0054B52B    mov         eax,ebx
 0054B52D    call        TJclInt64TypeInfo.GetMinValue
 0054B532    push        edx
 0054B533    push        eax
 0054B534    lea         eax,[ebp-8]
 0054B537    call        IntToStr
 0054B53C    mov         edx,dword ptr [ebp-8]
 0054B53F    pop         eax
 0054B540    call        @UStrCat
 0054B545    mov         edx,dword ptr [ebp-4]
 0054B548    mov         eax,esi
 0054B54A    mov         ecx,dword ptr [eax]
 0054B54C    call        dword ptr [ecx+18]
 0054B54F    lea         edx,[ebp-0C]
 0054B552    mov         eax,[0078CC1C];^SResString448:TResStringRec
 0054B557    call        LoadResString
 0054B55C    lea         eax,[ebp-0C]
 0054B55F    push        eax
 0054B560    mov         eax,ebx
 0054B562    call        TJclInt64TypeInfo.GetMaxValue
 0054B567    push        edx
 0054B568    push        eax
 0054B569    lea         eax,[ebp-10]
 0054B56C    call        IntToStr
 0054B571    mov         edx,dword ptr [ebp-10]
 0054B574    pop         eax
 0054B575    call        @UStrCat
 0054B57A    mov         edx,dword ptr [ebp-0C]
 0054B57D    mov         eax,esi
 0054B57F    mov         ecx,dword ptr [eax]
 0054B581    call        dword ptr [ecx+18]
 0054B584    xor         eax,eax
 0054B586    pop         edx
 0054B587    pop         ecx
 0054B588    pop         ecx
 0054B589    mov         dword ptr fs:[eax],edx
 0054B58C    push        54B5A6
 0054B591    lea         eax,[ebp-10]
 0054B594    mov         edx,4
 0054B599    call        @UStrArrayClr
 0054B59E    ret
>0054B59F    jmp         @HandleFinally
>0054B5A4    jmp         0054B591
 0054B5A6    pop         esi
 0054B5A7    pop         ebx
 0054B5A8    mov         esp,ebp
 0054B5AA    pop         ebp
 0054B5AB    ret
end;*}

//0054B5AC
{*procedure sub_0054B5AC(?:?);
begin
 0054B5AC    push        ebp
 0054B5AD    mov         ebp,esp
 0054B5AF    xor         ecx,ecx
 0054B5B1    push        ecx
 0054B5B2    push        ecx
 0054B5B3    push        ecx
 0054B5B4    push        ecx
 0054B5B5    push        ebx
 0054B5B6    push        esi
 0054B5B7    mov         esi,edx
 0054B5B9    mov         ebx,eax
 0054B5BB    xor         eax,eax
 0054B5BD    push        ebp
 0054B5BE    push        54B63F
 0054B5C3    push        dword ptr fs:[eax]
 0054B5C6    mov         dword ptr fs:[eax],esp
 0054B5C9    lea         edx,[ebp-8]
 0054B5CC    mov         eax,ebx
 0054B5CE    call        TJclTypeInfo.GetName
 0054B5D3    push        dword ptr [ebp-8]
 0054B5D6    push        54B658;' = '
 0054B5DB    mov         eax,ebx
 0054B5DD    call        TJclInt64TypeInfo.GetMinValue
 0054B5E2    push        edx
 0054B5E3    push        eax
 0054B5E4    lea         eax,[ebp-0C]
 0054B5E7    call        IntToStr
 0054B5EC    push        dword ptr [ebp-0C]
 0054B5EF    push        54B66C;' .. '
 0054B5F4    mov         eax,ebx
 0054B5F6    call        TJclInt64TypeInfo.GetMaxValue
 0054B5FB    push        edx
 0054B5FC    push        eax
 0054B5FD    lea         eax,[ebp-10]
 0054B600    call        IntToStr
 0054B605    push        dword ptr [ebp-10]
 0054B608    push        54B684;';'
 0054B60D    lea         eax,[ebp-4]
 0054B610    mov         edx,6
 0054B615    call        @UStrCatN
 0054B61A    mov         edx,dword ptr [ebp-4]
 0054B61D    mov         eax,esi
 0054B61F    mov         ecx,dword ptr [eax]
 0054B621    call        dword ptr [ecx+18]
 0054B624    xor         eax,eax
 0054B626    pop         edx
 0054B627    pop         ecx
 0054B628    pop         ecx
 0054B629    mov         dword ptr fs:[eax],edx
 0054B62C    push        54B646
 0054B631    lea         eax,[ebp-10]
 0054B634    mov         edx,4
 0054B639    call        @UStrArrayClr
 0054B63E    ret
>0054B63F    jmp         @HandleFinally
>0054B644    jmp         0054B631
 0054B646    pop         esi
 0054B647    pop         ebx
 0054B648    mov         esp,ebp
 0054B64A    pop         ebp
 0054B64B    ret
end;*}

//0054B688
function TJclDynArrayTypeInfo.GetElementSize:Integer;
begin
{*
 0054B688    push        ebx
 0054B689    mov         ebx,eax
 0054B68B    mov         eax,ebx
 0054B68D    call        TJclTypeInfo.GetTypeData
 0054B692    mov         eax,dword ptr [eax]
 0054B694    pop         ebx
 0054B695    ret
*}
end;

//0054B698
{*procedure TJclDynArrayTypeInfo.GetElementType(?:?);
begin
 0054B698    push        ebx
 0054B699    push        esi
 0054B69A    mov         esi,edx
 0054B69C    mov         ebx,eax
 0054B69E    mov         eax,ebx
 0054B6A0    call        TJclTypeInfo.GetTypeData
 0054B6A5    cmp         dword ptr [eax+4],0
>0054B6A9    jne         0054B6D7
 0054B6AB    mov         eax,ebx
 0054B6AD    call        TJclTypeInfo.GetTypeData
 0054B6B2    cmp         dword ptr [eax+0C],0
>0054B6B6    je          0054B6CD
 0054B6B8    mov         eax,ebx
 0054B6BA    call        TJclTypeInfo.GetTypeData
 0054B6BF    mov         eax,dword ptr [eax+0C]
 0054B6C2    mov         eax,dword ptr [eax]
 0054B6C4    mov         edx,esi
 0054B6C6    call        0054BBB0
>0054B6CB    jmp         0054B6EA
 0054B6CD    mov         eax,esi
 0054B6CF    call        @IntfClear
 0054B6D4    pop         esi
 0054B6D5    pop         ebx
 0054B6D6    ret
 0054B6D7    mov         eax,ebx
 0054B6D9    call        TJclTypeInfo.GetTypeData
 0054B6DE    mov         eax,dword ptr [eax+4]
 0054B6E1    mov         eax,dword ptr [eax]
 0054B6E3    mov         edx,esi
 0054B6E5    call        0054BBB0
 0054B6EA    pop         esi
 0054B6EB    pop         ebx
 0054B6EC    ret
end;*}

//0054B6F0
function TJclDynArrayTypeInfo.GetElementsNeedCleanup:Boolean;
begin
{*
 0054B6F0    push        ebx
 0054B6F1    mov         ebx,eax
 0054B6F3    mov         eax,ebx
 0054B6F5    call        TJclTypeInfo.GetTypeData
 0054B6FA    cmp         dword ptr [eax+4],0
 0054B6FE    setne       al
 0054B701    pop         ebx
 0054B702    ret
*}
end;

//0054B704
function TJclDynArrayTypeInfo.GetVarType:Integer;
begin
{*
 0054B704    push        ebx
 0054B705    mov         ebx,eax
 0054B707    mov         eax,ebx
 0054B709    call        TJclTypeInfo.GetTypeData
 0054B70E    mov         eax,dword ptr [eax+8]
 0054B711    pop         ebx
 0054B712    ret
*}
end;

//0054B714
{*procedure TJclDynArrayTypeInfo.GetUnitName(?:?);
begin
 0054B714    push        ebx
 0054B715    push        esi
 0054B716    mov         esi,edx
 0054B718    mov         ebx,eax
 0054B71A    mov         eax,ebx
 0054B71C    call        TJclTypeInfo.GetTypeData
 0054B721    lea         edx,[eax+10]
 0054B724    mov         eax,esi
 0054B726    call        @UStrFromString
 0054B72B    pop         esi
 0054B72C    pop         ebx
 0054B72D    ret
end;*}

//0054B730
{*procedure sub_0054B730(?:?);
begin
 0054B730    push        ebp
 0054B731    mov         ebp,esp
 0054B733    mov         ecx,0A
 0054B738    push        0
 0054B73A    push        0
 0054B73C    dec         ecx
>0054B73D    jne         0054B738
 0054B73F    push        ecx
 0054B740    mov         dword ptr [ebp-8],edx
 0054B743    mov         dword ptr [ebp-4],eax
 0054B746    xor         eax,eax
 0054B748    push        ebp
 0054B749    push        54B9BE
 0054B74E    push        dword ptr fs:[eax]
 0054B751    mov         dword ptr fs:[eax],esp
 0054B754    mov         edx,dword ptr [ebp-8]
 0054B757    mov         eax,dword ptr [ebp-4]
 0054B75A    call        0054771C
 0054B75F    lea         edx,[ebp-0C]
 0054B762    mov         eax,[0078CD44];^SResString460:TResStringRec
 0054B767    call        LoadResString
 0054B76C    lea         eax,[ebp-0C]
 0054B76F    push        eax
 0054B770    mov         eax,dword ptr [ebp-4]
 0054B773    call        TJclDynArrayTypeInfo.GetElementSize
 0054B778    lea         edx,[ebp-10]
 0054B77B    call        IntToStr
 0054B780    mov         edx,dword ptr [ebp-10]
 0054B783    pop         eax
 0054B784    call        @UStrCat
 0054B789    mov         edx,dword ptr [ebp-0C]
 0054B78C    mov         eax,dword ptr [ebp-8]
 0054B78F    mov         ecx,dword ptr [eax]
 0054B791    call        dword ptr [ecx+18]
 0054B794    lea         edx,[ebp-14]
 0054B797    mov         eax,dword ptr [ebp-4]
 0054B79A    call        TJclDynArrayTypeInfo.GetElementType
 0054B79F    cmp         dword ptr [ebp-14],0
>0054B7A3    jne         0054B7DC
 0054B7A5    lea         edx,[ebp-18]
 0054B7A8    mov         eax,[0078CB6C];^SResString461:TResStringRec
 0054B7AD    call        LoadResString
 0054B7B2    lea         eax,[ebp-18]
 0054B7B5    push        eax
 0054B7B6    lea         edx,[ebp-1C]
 0054B7B9    mov         eax,[0078D514];^SResString431:TResStringRec
 0054B7BE    call        LoadResString
 0054B7C3    mov         edx,dword ptr [ebp-1C]
 0054B7C6    pop         eax
 0054B7C7    call        @UStrCat
 0054B7CC    mov         edx,dword ptr [ebp-18]
 0054B7CF    mov         eax,dword ptr [ebp-8]
 0054B7D2    mov         ecx,dword ptr [eax]
 0054B7D4    call        dword ptr [ecx+18]
>0054B7D7    jmp         0054B899
 0054B7DC    lea         edx,[ebp-24]
 0054B7DF    mov         eax,dword ptr [ebp-4]
 0054B7E2    call        TJclDynArrayTypeInfo.GetElementType
 0054B7E7    mov         eax,dword ptr [ebp-24]
 0054B7EA    lea         edx,[ebp-20]
 0054B7ED    mov         ecx,dword ptr [eax]
 0054B7EF    call        dword ptr [ecx+14]
 0054B7F2    mov         eax,dword ptr [ebp-20]
 0054B7F5    cmp         word ptr [eax],2E
>0054B7F9    je          0054B838
 0054B7FB    lea         edx,[ebp-28]
 0054B7FE    mov         eax,[0078CB6C];^SResString461:TResStringRec
 0054B803    call        LoadResString
 0054B808    lea         eax,[ebp-28]
 0054B80B    push        eax
 0054B80C    lea         edx,[ebp-30]
 0054B80F    mov         eax,dword ptr [ebp-4]
 0054B812    call        TJclDynArrayTypeInfo.GetElementType
 0054B817    mov         eax,dword ptr [ebp-30]
 0054B81A    lea         edx,[ebp-2C]
 0054B81D    mov         ecx,dword ptr [eax]
 0054B81F    call        dword ptr [ecx+14]
 0054B822    mov         edx,dword ptr [ebp-2C]
 0054B825    pop         eax
 0054B826    call        @UStrCat
 0054B82B    mov         edx,dword ptr [ebp-28]
 0054B82E    mov         eax,dword ptr [ebp-8]
 0054B831    mov         ecx,dword ptr [eax]
 0054B833    call        dword ptr [ecx+18]
>0054B836    jmp         0054B899
 0054B838    lea         edx,[ebp-34]
 0054B83B    mov         eax,[0078CB6C];^SResString461:TResStringRec
 0054B840    call        LoadResString
 0054B845    mov         edx,dword ptr [ebp-34]
 0054B848    mov         eax,dword ptr [ebp-8]
 0054B84B    mov         ecx,dword ptr [eax]
 0054B84D    call        dword ptr [ecx+18]
 0054B850    mov         eax,dword ptr [ebp-8]
 0054B853    mov         edx,dword ptr [eax]
 0054B855    call        dword ptr [edx+1C]
 0054B858    xor         eax,eax
 0054B85A    push        ebp
 0054B85B    push        54B892
 0054B860    push        dword ptr fs:[eax]
 0054B863    mov         dword ptr fs:[eax],esp
 0054B866    lea         edx,[ebp-38]
 0054B869    mov         eax,dword ptr [ebp-4]
 0054B86C    call        TJclDynArrayTypeInfo.GetElementType
 0054B871    mov         eax,dword ptr [ebp-38]
 0054B874    mov         edx,dword ptr [ebp-8]
 0054B877    mov         ecx,dword ptr [eax]
 0054B879    call        dword ptr [ecx+0C]
 0054B87C    xor         eax,eax
 0054B87E    pop         edx
 0054B87F    pop         ecx
 0054B880    pop         ecx
 0054B881    mov         dword ptr fs:[eax],edx
 0054B884    push        54B899
 0054B889    mov         eax,dword ptr [ebp-8]
 0054B88C    mov         edx,dword ptr [eax]
 0054B88E    call        dword ptr [edx+20]
 0054B891    ret
>0054B892    jmp         @HandleFinally
>0054B897    jmp         0054B889
 0054B899    lea         edx,[ebp-3C]
 0054B89C    mov         eax,[0078D464];^SResString462:TResStringRec
 0054B8A1    call        LoadResString
 0054B8A6    mov         edx,dword ptr [ebp-3C]
 0054B8A9    mov         eax,dword ptr [ebp-8]
 0054B8AC    mov         ecx,dword ptr [eax]
 0054B8AE    call        dword ptr [ecx+14]
 0054B8B1    mov         eax,dword ptr [ebp-4]
 0054B8B4    call        TJclDynArrayTypeInfo.GetElementsNeedCleanup
 0054B8B9    test        al,al
>0054B8BB    je          0054B8D7
 0054B8BD    lea         edx,[ebp-40]
 0054B8C0    mov         eax,[0078D580];^SResString429:TResStringRec
 0054B8C5    call        LoadResString
 0054B8CA    mov         edx,dword ptr [ebp-40]
 0054B8CD    mov         eax,dword ptr [ebp-8]
 0054B8D0    mov         ecx,dword ptr [eax]
 0054B8D2    call        dword ptr [ecx+18]
>0054B8D5    jmp         0054B8EF
 0054B8D7    lea         edx,[ebp-44]
 0054B8DA    mov         eax,[0078CEAC];^SResString430:TResStringRec
 0054B8DF    call        LoadResString
 0054B8E4    mov         edx,dword ptr [ebp-44]
 0054B8E7    mov         eax,dword ptr [ebp-8]
 0054B8EA    mov         ecx,dword ptr [eax]
 0054B8EC    call        dword ptr [ecx+18]
 0054B8EF    lea         edx,[ebp-48]
 0054B8F2    mov         eax,[0078D398];^SResString463:TResStringRec
 0054B8F7    call        LoadResString
 0054B8FC    lea         eax,[ebp-48]
 0054B8FF    push        eax
 0054B900    mov         eax,dword ptr [ebp-4]
 0054B903    call        TJclDynArrayTypeInfo.GetVarType
 0054B908    lea         edx,[ebp-4C]
 0054B90B    call        IntToStr
 0054B910    mov         edx,dword ptr [ebp-4C]
 0054B913    pop         eax
 0054B914    call        @UStrCat
 0054B919    mov         edx,dword ptr [ebp-48]
 0054B91C    mov         eax,dword ptr [ebp-8]
 0054B91F    mov         ecx,dword ptr [eax]
 0054B921    call        dword ptr [ecx+18]
 0054B924    lea         edx,[ebp-50]
 0054B927    mov         eax,[0078CDB8];^SResString453:TResStringRec
 0054B92C    call        LoadResString
 0054B931    lea         eax,[ebp-50]
 0054B934    push        eax
 0054B935    lea         edx,[ebp-54]
 0054B938    mov         eax,dword ptr [ebp-4]
 0054B93B    call        TJclDynArrayTypeInfo.GetUnitName
 0054B940    mov         edx,dword ptr [ebp-54]
 0054B943    pop         eax
 0054B944    call        @UStrCat
 0054B949    mov         edx,dword ptr [ebp-50]
 0054B94C    mov         eax,dword ptr [ebp-8]
 0054B94F    mov         ecx,dword ptr [eax]
 0054B951    call        dword ptr [ecx+18]
 0054B954    xor         eax,eax
 0054B956    pop         edx
 0054B957    pop         ecx
 0054B958    pop         ecx
 0054B959    mov         dword ptr fs:[eax],edx
 0054B95C    push        54B9C5
 0054B961    lea         eax,[ebp-54]
 0054B964    mov         edx,7
 0054B969    call        @UStrArrayClr
 0054B96E    lea         eax,[ebp-38]
 0054B971    call        @IntfClear
 0054B976    lea         eax,[ebp-34]
 0054B979    call        @UStrClr
 0054B97E    lea         eax,[ebp-30]
 0054B981    call        @IntfClear
 0054B986    lea         eax,[ebp-2C]
 0054B989    mov         edx,2
 0054B98E    call        @UStrArrayClr
 0054B993    lea         eax,[ebp-24]
 0054B996    call        @IntfClear
 0054B99B    lea         eax,[ebp-20]
 0054B99E    mov         edx,3
 0054B9A3    call        @UStrArrayClr
 0054B9A8    lea         eax,[ebp-14]
 0054B9AB    call        @IntfClear
 0054B9B0    lea         eax,[ebp-10]
 0054B9B3    mov         edx,2
 0054B9B8    call        @UStrArrayClr
 0054B9BD    ret
>0054B9BE    jmp         @HandleFinally
>0054B9C3    jmp         0054B961
 0054B9C5    mov         esp,ebp
 0054B9C7    pop         ebp
 0054B9C8    ret
end;*}

//0054B9CC
{*procedure sub_0054B9CC(?:?);
begin
 0054B9CC    push        ebp
 0054B9CD    mov         ebp,esp
 0054B9CF    mov         ecx,7
 0054B9D4    push        0
 0054B9D6    push        0
 0054B9D8    dec         ecx
>0054B9D9    jne         0054B9D4
 0054B9DB    push        ecx
 0054B9DC    push        ebx
 0054B9DD    push        esi
 0054B9DE    mov         esi,edx
 0054B9E0    mov         ebx,eax
 0054B9E2    xor         eax,eax
 0054B9E4    push        ebp
 0054B9E5    push        54BB68
 0054B9EA    push        dword ptr fs:[eax]
 0054B9ED    mov         dword ptr fs:[eax],esp
 0054B9F0    lea         edx,[ebp-4]
 0054B9F3    mov         eax,ebx
 0054B9F5    call        TJclTypeInfo.GetName
 0054B9FA    mov         eax,dword ptr [ebp-4]
 0054B9FD    cmp         word ptr [eax],2E
>0054BA01    je          0054BA3E
 0054BA03    lea         edx,[ebp-0C]
 0054BA06    mov         eax,ebx
 0054BA08    call        TJclTypeInfo.GetName
 0054BA0D    push        dword ptr [ebp-0C]
 0054BA10    push        54BB84;' = '
 0054BA15    lea         edx,[ebp-10]
 0054BA18    mov         eax,[0078D8A8];^SResString426:TResStringRec
 0054BA1D    call        LoadResString
 0054BA22    push        dword ptr [ebp-10]
 0054BA25    lea         eax,[ebp-8]
 0054BA28    mov         edx,3
 0054BA2D    call        @UStrCatN
 0054BA32    mov         edx,dword ptr [ebp-8]
 0054BA35    mov         eax,esi
 0054BA37    mov         ecx,dword ptr [eax]
 0054BA39    call        dword ptr [ecx+14]
>0054BA3C    jmp         0054BA55
 0054BA3E    lea         edx,[ebp-14]
 0054BA41    mov         eax,[0078D8A8];^SResString426:TResStringRec
 0054BA46    call        LoadResString
 0054BA4B    mov         edx,dword ptr [ebp-14]
 0054BA4E    mov         eax,esi
 0054BA50    mov         ecx,dword ptr [eax]
 0054BA52    call        dword ptr [ecx+14]
 0054BA55    lea         edx,[ebp-18]
 0054BA58    mov         eax,ebx
 0054BA5A    call        TJclDynArrayTypeInfo.GetElementType
 0054BA5F    cmp         dword ptr [ebp-18],0
>0054BA63    jne         0054BA7E
 0054BA65    lea         edx,[ebp-1C]
 0054BA68    mov         eax,[0078D514];^SResString431:TResStringRec
 0054BA6D    call        LoadResString
 0054BA72    mov         edx,dword ptr [ebp-1C]
 0054BA75    mov         eax,esi
 0054BA77    mov         ecx,dword ptr [eax]
 0054BA79    call        dword ptr [ecx+14]
>0054BA7C    jmp         0054BAD1
 0054BA7E    lea         edx,[ebp-24]
 0054BA81    mov         eax,ebx
 0054BA83    call        TJclDynArrayTypeInfo.GetElementType
 0054BA88    mov         eax,dword ptr [ebp-24]
 0054BA8B    lea         edx,[ebp-20]
 0054BA8E    mov         ecx,dword ptr [eax]
 0054BA90    call        dword ptr [ecx+14]
 0054BA93    mov         eax,dword ptr [ebp-20]
 0054BA96    cmp         word ptr [eax],2E
>0054BA9A    jne         0054BAB2
 0054BA9C    lea         edx,[ebp-28]
 0054BA9F    mov         eax,ebx
 0054BAA1    call        TJclDynArrayTypeInfo.GetElementType
 0054BAA6    mov         eax,dword ptr [ebp-28]
 0054BAA9    mov         edx,esi
 0054BAAB    mov         ecx,dword ptr [eax]
 0054BAAD    call        dword ptr [ecx+10]
>0054BAB0    jmp         0054BAD1
 0054BAB2    lea         edx,[ebp-30]
 0054BAB5    mov         eax,ebx
 0054BAB7    call        TJclDynArrayTypeInfo.GetElementType
 0054BABC    mov         eax,dword ptr [ebp-30]
 0054BABF    lea         edx,[ebp-2C]
 0054BAC2    mov         ecx,dword ptr [eax]
 0054BAC4    call        dword ptr [ecx+14]
 0054BAC7    mov         edx,dword ptr [ebp-2C]
 0054BACA    mov         eax,esi
 0054BACC    mov         ecx,dword ptr [eax]
 0054BACE    call        dword ptr [ecx+14]
 0054BAD1    lea         edx,[ebp-34]
 0054BAD4    mov         eax,ebx
 0054BAD6    call        TJclTypeInfo.GetName
 0054BADB    mov         eax,dword ptr [ebp-34]
 0054BADE    cmp         word ptr [eax],2E
>0054BAE2    je          0054BB08
 0054BAE4    lea         edx,[ebp-3C]
 0054BAE7    mov         eax,ebx
 0054BAE9    call        TJclDynArrayTypeInfo.GetUnitName
 0054BAEE    mov         ecx,dword ptr [ebp-3C]
 0054BAF1    lea         eax,[ebp-38]
 0054BAF4    mov         edx,54BB98;'; // Unit '
 0054BAF9    call        @UStrCat3
 0054BAFE    mov         edx,dword ptr [ebp-38]
 0054BB01    mov         eax,esi
 0054BB03    mov         ecx,dword ptr [eax]
 0054BB05    call        dword ptr [ecx+18]
 0054BB08    xor         eax,eax
 0054BB0A    pop         edx
 0054BB0B    pop         ecx
 0054BB0C    pop         ecx
 0054BB0D    mov         dword ptr fs:[eax],edx
 0054BB10    push        54BB6F
 0054BB15    lea         eax,[ebp-3C]
 0054BB18    mov         edx,3
 0054BB1D    call        @UStrArrayClr
 0054BB22    lea         eax,[ebp-30]
 0054BB25    call        @IntfClear
 0054BB2A    lea         eax,[ebp-2C]
 0054BB2D    call        @UStrClr
 0054BB32    lea         eax,[ebp-28]
 0054BB35    mov         edx,dword ptr ds:[544484];IJclTypeInfo
 0054BB3B    mov         ecx,2
 0054BB40    call        @FinalizeArray
 0054BB45    lea         eax,[ebp-20]
 0054BB48    mov         edx,2
 0054BB4D    call        @UStrArrayClr
 0054BB52    lea         eax,[ebp-18]
 0054BB55    call        @IntfClear
 0054BB5A    lea         eax,[ebp-14]
 0054BB5D    mov         edx,5
 0054BB62    call        @UStrArrayClr
 0054BB67    ret
>0054BB68    jmp         @HandleFinally
>0054BB6D    jmp         0054BB15
 0054BB6F    pop         esi
 0054BB70    pop         ebx
 0054BB71    mov         esp,ebp
 0054BB73    pop         ebp
 0054BB74    ret
end;*}

//0054BBB0
{*procedure sub_0054BBB0(?:PPropInfo; ?:?);
begin
 0054BBB0    push        ebx
 0054BBB1    push        esi
 0054BBB2    mov         esi,edx
 0054BBB4    mov         ebx,eax
 0054BBB6    movzx       eax,byte ptr [ebx]
 0054BBB9    cmp         eax,11
>0054BBBC    ja          0054BD5B
 0054BBC2    jmp         dword ptr [eax*4+54BBC9]
 0054BBC2    dd          0054BD5B
 0054BBC2    dd          0054BC11
 0054BBC2    dd          0054BC11
 0054BBC2    dd          0054BC32
 0054BBC2    dd          0054BC74
 0054BBC2    dd          0054BC95
 0054BBC2    dd          0054BC53
 0054BBC2    dd          0054BCB6
 0054BBC2    dd          0054BCD7
 0054BBC2    dd          0054BC11
 0054BBC2    dd          0054BD5B
 0054BBC2    dd          0054BD5B
 0054BBC2    dd          0054BD5B
 0054BBC2    dd          0054BD5B
 0054BBC2    dd          0054BD5B
 0054BBC2    dd          0054BCF8
 0054BBC2    dd          0054BD19
 0054BBC2    dd          0054BD3A
 0054BC11    mov         ecx,ebx
 0054BC13    mov         dl,1
 0054BC15    mov         eax,[00544AE4];TJclOrdinalRangeTypeInfo
 0054BC1A    call        TJclTypeInfo.Create;TJclOrdinalRangeTypeInfo.Create
 0054BC1F    mov         edx,eax
 0054BC21    test        edx,edx
>0054BC23    je          0054BC28
 0054BC25    sub         edx,0FFFFFFEC
 0054BC28    mov         eax,esi
 0054BC2A    call        @IntfCopy
 0054BC2F    pop         esi
 0054BC30    pop         ebx
 0054BC31    ret
 0054BC32    mov         ecx,ebx
 0054BC34    mov         dl,1
 0054BC36    mov         eax,[00544D88];TJclEnumerationTypeInfo
 0054BC3B    call        TJclTypeInfo.Create;TJclEnumerationTypeInfo.Create
 0054BC40    mov         edx,eax
 0054BC42    test        edx,edx
>0054BC44    je          0054BC49
 0054BC46    sub         edx,0FFFFFFEC
 0054BC49    mov         eax,esi
 0054BC4B    call        @IntfCopy
 0054BC50    pop         esi
 0054BC51    pop         ebx
 0054BC52    ret
 0054BC53    mov         ecx,ebx
 0054BC55    mov         dl,1
 0054BC57    mov         eax,[00545070];TJclSetTypeInfo
 0054BC5C    call        TJclTypeInfo.Create;TJclSetTypeInfo.Create
 0054BC61    mov         edx,eax
 0054BC63    test        edx,edx
>0054BC65    je          0054BC6A
 0054BC67    sub         edx,0FFFFFFEC
 0054BC6A    mov         eax,esi
 0054BC6C    call        @IntfCopy
 0054BC71    pop         esi
 0054BC72    pop         ebx
 0054BC73    ret
 0054BC74    mov         ecx,ebx
 0054BC76    mov         dl,1
 0054BC78    mov         eax,[00545318];TJclFloatTypeInfo
 0054BC7D    call        TJclTypeInfo.Create;TJclFloatTypeInfo.Create
 0054BC82    mov         edx,eax
 0054BC84    test        edx,edx
>0054BC86    je          0054BC8B
 0054BC88    sub         edx,0FFFFFFEC
 0054BC8B    mov         eax,esi
 0054BC8D    call        @IntfCopy
 0054BC92    pop         esi
 0054BC93    pop         ebx
 0054BC94    ret
 0054BC95    mov         ecx,ebx
 0054BC97    mov         dl,1
 0054BC99    mov         eax,[00545508];TJclStringTypeInfo
 0054BC9E    call        TJclTypeInfo.Create;TJclStringTypeInfo.Create
 0054BCA3    mov         edx,eax
 0054BCA5    test        edx,edx
>0054BCA7    je          0054BCAC
 0054BCA9    sub         edx,0FFFFFFEC
 0054BCAC    mov         eax,esi
 0054BCAE    call        @IntfCopy
 0054BCB3    pop         esi
 0054BCB4    pop         ebx
 0054BCB5    ret
 0054BCB6    mov         ecx,ebx
 0054BCB8    mov         dl,1
 0054BCBA    mov         eax,[005460C0];TJclClassTypeInfo
 0054BCBF    call        TJclTypeInfo.Create;TJclClassTypeInfo.Create
 0054BCC4    mov         edx,eax
 0054BCC6    test        edx,edx
>0054BCC8    je          0054BCCD
 0054BCCA    sub         edx,0FFFFFFEC
 0054BCCD    mov         eax,esi
 0054BCCF    call        @IntfCopy
 0054BCD4    pop         esi
 0054BCD5    pop         ebx
 0054BCD6    ret
 0054BCD7    mov         ecx,ebx
 0054BCD9    mov         dl,1
 0054BCDB    mov         eax,[0054687C];TJclEventTypeInfo
 0054BCE0    call        TJclTypeInfo.Create;TJclEventTypeInfo.Create
 0054BCE5    mov         edx,eax
 0054BCE7    test        edx,edx
>0054BCE9    je          0054BCEE
 0054BCEB    sub         edx,0FFFFFFEC
 0054BCEE    mov         eax,esi
 0054BCF0    call        @IntfCopy
 0054BCF5    pop         esi
 0054BCF6    pop         ebx
 0054BCF7    ret
 0054BCF8    mov         ecx,ebx
 0054BCFA    mov         dl,1
 0054BCFC    mov         eax,[00546BD0];TJclInterfaceTypeInfo
 0054BD01    call        TJclTypeInfo.Create;TJclInterfaceTypeInfo.Create
 0054BD06    mov         edx,eax
 0054BD08    test        edx,edx
>0054BD0A    je          0054BD0F
 0054BD0C    sub         edx,0FFFFFFEC
 0054BD0F    mov         eax,esi
 0054BD11    call        @IntfCopy
 0054BD16    pop         esi
 0054BD17    pop         ebx
 0054BD18    ret
 0054BD19    mov         ecx,ebx
 0054BD1B    mov         dl,1
 0054BD1D    mov         eax,[00546F34];TJclInt64TypeInfo
 0054BD22    call        TJclTypeInfo.Create;TJclInt64TypeInfo.Create
 0054BD27    mov         edx,eax
 0054BD29    test        edx,edx
>0054BD2B    je          0054BD30
 0054BD2D    sub         edx,0FFFFFFEC
 0054BD30    mov         eax,esi
 0054BD32    call        @IntfCopy
 0054BD37    pop         esi
 0054BD38    pop         ebx
 0054BD39    ret
 0054BD3A    mov         ecx,ebx
 0054BD3C    mov         dl,1
 0054BD3E    mov         eax,[005471B0];TJclDynArrayTypeInfo
 0054BD43    call        TJclTypeInfo.Create;TJclDynArrayTypeInfo.Create
 0054BD48    mov         edx,eax
 0054BD4A    test        edx,edx
>0054BD4C    je          0054BD51
 0054BD4E    sub         edx,0FFFFFFEC
 0054BD51    mov         eax,esi
 0054BD53    call        @IntfCopy
 0054BD58    pop         esi
 0054BD59    pop         ebx
 0054BD5A    ret
 0054BD5B    mov         ecx,ebx
 0054BD5D    mov         dl,1
 0054BD5F    mov         eax,[0054455C];TJclTypeInfo
 0054BD64    call        TJclTypeInfo.Create;TJclTypeInfo.Create
 0054BD69    mov         edx,eax
 0054BD6B    test        edx,edx
>0054BD6D    je          0054BD72
 0054BD6F    sub         edx,0FFFFFFEC
 0054BD72    mov         eax,esi
 0054BD74    call        @IntfCopy
 0054BD79    pop         esi
 0054BD7A    pop         ebx
 0054BD7B    ret
end;*}

//0054BD7C
{*procedure sub_0054BD7C(?:?);
begin
 0054BD7C    push        ebx
 0054BD7D    mov         ebx,eax
 0054BD7F    mov         eax,ebx
 0054BD81    call        GetTypeData
 0054BD86    cmp         byte ptr [ebx],6
>0054BD89    jne         0054BD97
 0054BD8B    mov         eax,dword ptr [eax+1]
 0054BD8E    mov         eax,dword ptr [eax]
 0054BD90    call        0054BE54
>0054BD95    jmp         0054BDB4
 0054BD97    cmp         byte ptr [ebx],3
>0054BD9A    jne         0054BDB4
 0054BD9C    mov         eax,dword ptr [eax+9]
 0054BD9F    cmp         ebx,dword ptr [eax]
>0054BDA1    je          0054BDB4
 0054BDA3    mov         eax,ebx
 0054BDA5    call        GetTypeData
 0054BDAA    mov         eax,dword ptr [eax+9]
 0054BDAD    mov         eax,dword ptr [eax]
 0054BDAF    call        0054BE54
 0054BDB4    mov         eax,ebx
 0054BDB6    call        GetTypeData
 0054BDBB    mov         eax,dword ptr [eax+9]
 0054BDBE    call        @FreeMem
 0054BDC3    mov         eax,ebx
 0054BDC5    call        @FreeMem
 0054BDCA    pop         ebx
 0054BDCB    ret
end;*}

//0054BDCC
procedure sub_0054BDCC(?:Pointer);
begin
{*
 0054BDCC    push        ebx
 0054BDCD    mov         ebx,eax
 0054BDCF    mov         eax,dword ptr [ebx]
 0054BDD1    call        0054BD7C
 0054BDD6    mov         eax,[008154E4];gvar_008154E4:TThreadList
 0054BDDB    mov         edx,ebx
 0054BDDD    xor         ecx,ecx
 0054BDDF    call        TThreadList.RemoveItem
 0054BDE4    mov         edx,8
 0054BDE9    mov         eax,ebx
 0054BDEB    call        @FreeMem
 0054BDF0    pop         ebx
 0054BDF1    ret
*}
end;

//0054BDF4
procedure sub_0054BDF4;
begin
{*
 0054BDF4    push        ebp
 0054BDF5    mov         ebp,esp
 0054BDF7    push        ebx
 0054BDF8    push        esi
 0054BDF9    mov         eax,[008154E4];gvar_008154E4:TThreadList
 0054BDFE    call        TThreadList.LockList
 0054BE03    mov         ebx,eax
 0054BE05    xor         edx,edx
 0054BE07    push        ebp
 0054BE08    push        54BE48
 0054BE0D    push        dword ptr fs:[edx]
 0054BE10    mov         dword ptr fs:[edx],esp
>0054BE13    jmp         0054BE26
 0054BE15    mov         edx,esi
 0054BE17    dec         edx
 0054BE18    mov         eax,ebx
 0054BE1A    call        TList.Get
 0054BE1F    mov         eax,dword ptr [eax]
 0054BE21    call        0054BE54
 0054BE26    mov         esi,dword ptr [ebx+8];TList.FCount:Integer
 0054BE29    test        esi,esi
>0054BE2B    jg          0054BE15
 0054BE2D    xor         eax,eax
 0054BE2F    pop         edx
 0054BE30    pop         ecx
 0054BE31    pop         ecx
 0054BE32    mov         dword ptr fs:[eax],edx
 0054BE35    push        54BE4F
 0054BE3A    mov         eax,[008154E4];gvar_008154E4:TThreadList
 0054BE3F    mov         eax,dword ptr [eax+8]
 0054BE42    call        TMonitor.Exit
 0054BE47    ret
>0054BE48    jmp         @HandleFinally
>0054BE4D    jmp         0054BE3A
 0054BE4F    pop         esi
 0054BE50    pop         ebx
 0054BE51    pop         ebp
 0054BE52    ret
*}
end;

//0054BE54
{*function sub_0054BE54(?:Pointer):?;
begin
 0054BE54    push        ebp
 0054BE55    mov         ebp,esp
 0054BE57    push        ecx
 0054BE58    push        ebx
 0054BE59    push        esi
 0054BE5A    push        edi
 0054BE5B    mov         edi,eax
 0054BE5D    xor         eax,eax
 0054BE5F    mov         dword ptr [ebp-4],eax
 0054BE62    mov         eax,[008154E4];gvar_008154E4:TThreadList
 0054BE67    call        TThreadList.LockList
 0054BE6C    mov         esi,eax
 0054BE6E    xor         edx,edx
 0054BE70    push        ebp
 0054BE71    push        54BEC0
 0054BE76    push        dword ptr fs:[edx]
 0054BE79    mov         dword ptr fs:[edx],esp
 0054BE7C    mov         ebx,dword ptr [esi+8];TList.FCount:Integer
 0054BE7F    dec         ebx
>0054BE80    jmp         0054BE83
 0054BE82    dec         ebx
 0054BE83    test        ebx,ebx
>0054BE85    jl          0054BE94
 0054BE87    mov         edx,ebx
 0054BE89    mov         eax,esi
 0054BE8B    call        TList.Get
 0054BE90    cmp         edi,dword ptr [eax]
>0054BE92    jne         0054BE82
 0054BE94    cmp         ebx,0FFFFFFFF
>0054BE97    jle         0054BEA5
 0054BE99    mov         edx,ebx
 0054BE9B    mov         eax,esi
 0054BE9D    call        TList.Get
 0054BEA2    mov         dword ptr [ebp-4],eax
 0054BEA5    xor         eax,eax
 0054BEA7    pop         edx
 0054BEA8    pop         ecx
 0054BEA9    pop         ecx
 0054BEAA    mov         dword ptr fs:[eax],edx
 0054BEAD    push        54BEC7
 0054BEB2    mov         eax,[008154E4];gvar_008154E4:TThreadList
 0054BEB7    mov         eax,dword ptr [eax+8]
 0054BEBA    call        TMonitor.Exit
 0054BEBF    ret
>0054BEC0    jmp         @HandleFinally
>0054BEC5    jmp         0054BEB2
 0054BEC7    cmp         dword ptr [ebp-4],0
>0054BECB    je          0054BEE4
 0054BECD    mov         eax,dword ptr [ebp-4]
 0054BED0    dec         dword ptr [eax+4]
 0054BED3    mov         eax,dword ptr [ebp-4]
 0054BED6    cmp         dword ptr [eax+4],0
>0054BEDA    jg          0054BEE4
 0054BEDC    mov         eax,dword ptr [ebp-4]
 0054BEDF    call        0054BDCC
 0054BEE4    pop         edi
 0054BEE5    pop         esi
 0054BEE6    pop         ebx
 0054BEE7    pop         ecx
 0054BEE8    pop         ebp
 0054BEE9    ret
end;*}

//0054BEEC
{*procedure sub_0054BEEC(?:?; ?:PTypeInfo; ?:?);
begin
 0054BEEC    push        ebp
 0054BEED    mov         ebp,esp
 0054BEEF    add         esp,0FFFFFFD8
 0054BEF2    push        ebx
 0054BEF3    push        esi
 0054BEF4    push        edi
 0054BEF5    xor         ebx,ebx
 0054BEF7    mov         dword ptr [ebp-20],ebx
 0054BEFA    mov         dword ptr [ebp-28],ebx
 0054BEFD    mov         dword ptr [ebp-24],ebx
 0054BF00    mov         edi,ecx
 0054BF02    mov         dword ptr [ebp-4],edx
 0054BF05    mov         ebx,eax
 0054BF07    xor         eax,eax
 0054BF09    push        ebp
 0054BF0A    push        54C061
 0054BF0F    push        dword ptr fs:[eax]
 0054BF12    mov         dword ptr fs:[eax],esp
 0054BF15    mov         eax,ebx
 0054BF17    call        GetTypeData
 0054BF1C    movzx       eax,byte ptr [eax]
 0054BF1F    mov         byte ptr [ebp-11],al
 0054BF22    mov         eax,ebx
 0054BF24    call        GetTypeData
 0054BF29    mov         esi,dword ptr [eax+1]
 0054BF2C    mov         eax,ebx
 0054BF2E    call        GetTypeData
 0054BF33    mov         ecx,dword ptr [eax+5]
 0054BF36    movzx       eax,byte ptr [ebp-11]
 0054BF3A    cmp         eax,5
>0054BF3D    ja          0054BFB9
 0054BF3F    jmp         dword ptr [eax*4+54BF46]
 0054BF3F    dd          0054BF5E
 0054BF3F    dd          0054BF6D
 0054BF3F    dd          0054BF7D
 0054BF3F    dd          0054BF8C
 0054BF3F    dd          0054BF9C
 0054BF3F    dd          0054BFAA
 0054BF5E    mov         eax,dword ptr [ebp-4]
 0054BF61    movsx       eax,word ptr [eax]
 0054BF64    cdq
 0054BF65    mov         dword ptr [ebp-10],eax
 0054BF68    mov         dword ptr [ebp-0C],edx
>0054BF6B    jmp         0054BFC7
 0054BF6D    mov         eax,dword ptr [ebp-4]
 0054BF70    movzx       eax,byte ptr [eax]
 0054BF73    xor         edx,edx
 0054BF75    mov         dword ptr [ebp-10],eax
 0054BF78    mov         dword ptr [ebp-0C],edx
>0054BF7B    jmp         0054BFC7
 0054BF7D    mov         eax,dword ptr [ebp-4]
 0054BF80    movsx       eax,byte ptr [eax]
 0054BF83    cdq
 0054BF84    mov         dword ptr [ebp-10],eax
 0054BF87    mov         dword ptr [ebp-0C],edx
>0054BF8A    jmp         0054BFC7
 0054BF8C    mov         eax,dword ptr [ebp-4]
 0054BF8F    movzx       eax,word ptr [eax]
 0054BF92    xor         edx,edx
 0054BF94    mov         dword ptr [ebp-10],eax
 0054BF97    mov         dword ptr [ebp-0C],edx
>0054BF9A    jmp         0054BFC7
 0054BF9C    mov         eax,dword ptr [ebp-4]
 0054BF9F    mov         eax,dword ptr [eax]
 0054BFA1    cdq
 0054BFA2    mov         dword ptr [ebp-10],eax
 0054BFA5    mov         dword ptr [ebp-0C],edx
>0054BFA8    jmp         0054BFC7
 0054BFAA    mov         eax,dword ptr [ebp-4]
 0054BFAD    mov         eax,dword ptr [eax]
 0054BFAF    xor         edx,edx
 0054BFB1    mov         dword ptr [ebp-10],eax
 0054BFB4    mov         dword ptr [ebp-0C],edx
>0054BFB7    jmp         0054BFC7
 0054BFB9    mov         dword ptr [ebp-10],0
 0054BFC0    mov         dword ptr [ebp-0C],0
 0054BFC7    mov         eax,esi
 0054BFC9    cdq
 0054BFCA    cmp         edx,dword ptr [ebp-0C]
>0054BFCD    jne         0054BFD6
 0054BFCF    cmp         eax,dword ptr [ebp-10]
>0054BFD2    ja          0054BFE9
>0054BFD4    jmp         0054BFD8
>0054BFD6    jg          0054BFE9
 0054BFD8    mov         eax,ecx
 0054BFDA    cdq
 0054BFDB    cmp         edx,dword ptr [ebp-0C]
>0054BFDE    jne         0054BFE7
 0054BFE0    cmp         eax,dword ptr [ebp-10]
>0054BFE3    jae         0054C03A
>0054BFE5    jmp         0054BFE9
>0054BFE7    jge         0054C03A
 0054BFE9    push        edi
 0054BFEA    lea         edx,[ebp-20]
 0054BFED    mov         eax,[0078D3AC];^SResString428:TResStringRec
 0054BFF2    call        LoadResString
 0054BFF7    lea         eax,[ebp-20]
 0054BFFA    push        eax
 0054BFFB    push        dword ptr [ebp-0C]
 0054BFFE    push        dword ptr [ebp-10]
 0054C001    lea         eax,[ebp-24]
 0054C004    call        IntToStr
 0054C009    mov         edx,dword ptr [ebp-24]
 0054C00C    pop         eax
 0054C00D    call        @UStrCat
 0054C012    mov         eax,dword ptr [ebp-20]
 0054C015    mov         dword ptr [ebp-1C],eax
 0054C018    mov         byte ptr [ebp-18],11
 0054C01C    lea         eax,[ebp-1C]
 0054C01F    push        eax
 0054C020    lea         edx,[ebp-28]
 0054C023    mov         eax,[0078CB78];^SResString422:TResStringRec
 0054C028    call        LoadResString
 0054C02D    mov         eax,dword ptr [ebp-28]
 0054C030    xor         ecx,ecx
 0054C032    pop         edx
 0054C033    call        Format
>0054C038    jmp         0054C046
 0054C03A    mov         ecx,edi
 0054C03C    mov         edx,dword ptr [ebp-10]
 0054C03F    mov         eax,ebx
 0054C041    call        GetEnumName
 0054C046    xor         eax,eax
 0054C048    pop         edx
 0054C049    pop         ecx
 0054C04A    pop         ecx
 0054C04B    mov         dword ptr fs:[eax],edx
 0054C04E    push        54C068
 0054C053    lea         eax,[ebp-28]
 0054C056    mov         edx,3
 0054C05B    call        @UStrArrayClr
 0054C060    ret
>0054C061    jmp         @HandleFinally
>0054C066    jmp         0054C053
 0054C068    pop         edi
 0054C069    pop         esi
 0054C06A    pop         ebx
 0054C06B    mov         esp,ebp
 0054C06D    pop         ebp
 0054C06E    ret
end;*}

//0054C070
{*procedure sub_0054C070(?:?; ?:TIntfFlagsBase; ?:?; ?:?; ?:?; ?:?);
begin
 0054C070    push        ebp
 0054C071    mov         ebp,esp
 0054C073    push        0
 0054C075    push        0
 0054C077    push        0
 0054C079    push        0
 0054C07B    push        0
 0054C07D    push        0
 0054C07F    push        0
 0054C081    push        ebx
 0054C082    push        esi
 0054C083    push        edi
 0054C084    mov         byte ptr [ebp-9],cl
 0054C087    mov         dword ptr [ebp-8],edx
 0054C08A    mov         edi,eax
 0054C08C    mov         ebx,dword ptr [ebp+8]
 0054C08F    xor         eax,eax
 0054C091    push        ebp
 0054C092    push        54C17C
 0054C097    push        dword ptr fs:[eax]
 0054C09A    mov         dword ptr fs:[eax],esp
 0054C09D    mov         eax,dword ptr [ebp+0C]
 0054C0A0    mov         edx,dword ptr [eax]
 0054C0A2    call        dword ptr [edx+14]
 0054C0A5    mov         esi,eax
 0054C0A7    mov         eax,ebx
 0054C0A9    call        @UStrClr
 0054C0AE    lea         edx,[ebp-14]
 0054C0B1    mov         eax,edi
 0054C0B3    call        0054BBB0
 0054C0B8    mov         edx,dword ptr [ebp-14]
 0054C0BB    lea         eax,[ebp-4]
 0054C0BE    mov         ecx,54C18C;['{7DAD5224-46EA-11D5-B0C0-4854E825F345}']
 0054C0C3    call        @IntfCast
 0054C0C8    mov         eax,dword ptr [ebp+0C]
 0054C0CB    push        eax
 0054C0CC    mov         edx,dword ptr [ebp-8]
 0054C0CF    movzx       ecx,byte ptr [ebp+10]
 0054C0D3    mov         eax,dword ptr [ebp-4]
 0054C0D6    mov         edi,dword ptr [eax]
 0054C0D8    call        dword ptr [edi+2C]
 0054C0DB    mov         eax,dword ptr [ebp+0C]
 0054C0DE    mov         edx,dword ptr [eax]
 0054C0E0    call        dword ptr [edx+14]
 0054C0E3    dec         eax
 0054C0E4    sub         eax,esi
>0054C0E6    jl          0054C133
 0054C0E8    inc         eax
 0054C0E9    mov         dword ptr [ebp-10],eax
 0054C0EC    cmp         dword ptr [ebx],0
>0054C0EF    je          0054C116
 0054C0F1    push        dword ptr [ebx]
 0054C0F3    push        54C1A8;', '
 0054C0F8    lea         ecx,[ebp-18]
 0054C0FB    mov         edx,esi
 0054C0FD    mov         eax,dword ptr [ebp+0C]
 0054C100    mov         edi,dword ptr [eax]
 0054C102    call        dword ptr [edi+0C]
 0054C105    push        dword ptr [ebp-18]
 0054C108    mov         eax,ebx
 0054C10A    mov         edx,3
 0054C10F    call        @UStrCatN
>0054C114    jmp         0054C12D
 0054C116    lea         ecx,[ebp-1C]
 0054C119    mov         edx,esi
 0054C11B    mov         eax,dword ptr [ebp+0C]
 0054C11E    mov         edi,dword ptr [eax]
 0054C120    call        dword ptr [edi+0C]
 0054C123    mov         edx,dword ptr [ebp-1C]
 0054C126    mov         eax,ebx
 0054C128    call        @UStrCat
 0054C12D    inc         esi
 0054C12E    dec         dword ptr [ebp-10]
>0054C131    jne         0054C0EC
 0054C133    cmp         byte ptr [ebp-9],0
>0054C137    je          0054C151
 0054C139    push        54C1BC;'['
 0054C13E    push        dword ptr [ebx]
 0054C140    push        54C1CC;']'
 0054C145    mov         eax,ebx
 0054C147    mov         edx,3
 0054C14C    call        @UStrCatN
 0054C151    xor         eax,eax
 0054C153    pop         edx
 0054C154    pop         ecx
 0054C155    pop         ecx
 0054C156    mov         dword ptr fs:[eax],edx
 0054C159    push        54C183
 0054C15E    lea         eax,[ebp-1C]
 0054C161    mov         edx,2
 0054C166    call        @UStrArrayClr
 0054C16B    lea         eax,[ebp-14]
 0054C16E    call        @IntfClear
 0054C173    lea         eax,[ebp-4]
 0054C176    call        @IntfClear
 0054C17B    ret
>0054C17C    jmp         @HandleFinally
>0054C181    jmp         0054C15E
 0054C183    pop         edi
 0054C184    pop         esi
 0054C185    pop         ebx
 0054C186    mov         esp,ebp
 0054C188    pop         ebp
 0054C189    ret         0C
end;*}

//0054C1D0
{*procedure sub_0054C1D0(?:?; ?:TIntfFlagsBase; ?:?; ?:?; ?:?);
begin
 0054C1D0    push        ebp
 0054C1D1    mov         ebp,esp
 0054C1D3    push        ecx
 0054C1D4    push        ebx
 0054C1D5    push        esi
 0054C1D6    push        edi
 0054C1D7    mov         ebx,ecx
 0054C1D9    mov         esi,edx
 0054C1DB    mov         edi,eax
 0054C1DD    mov         dl,1
 0054C1DF    mov         eax,[0043C7BC];TStringList
 0054C1E4    call        TStringList.Create;TStringList.Create
 0054C1E9    mov         dword ptr [ebp-4],eax
 0054C1EC    xor         eax,eax
 0054C1EE    push        ebp
 0054C1EF    push        54C228
 0054C1F4    push        dword ptr fs:[eax]
 0054C1F7    mov         dword ptr fs:[eax],esp
 0054C1FA    movzx       eax,byte ptr [ebp+0C]
 0054C1FE    push        eax
 0054C1FF    mov         eax,dword ptr [ebp-4]
 0054C202    push        eax
 0054C203    mov         eax,dword ptr [ebp+8]
 0054C206    push        eax
 0054C207    mov         edx,esi
 0054C209    mov         ecx,ebx
 0054C20B    mov         eax,edi
 0054C20D    call        0054C070
 0054C212    xor         eax,eax
 0054C214    pop         edx
 0054C215    pop         ecx
 0054C216    pop         ecx
 0054C217    mov         dword ptr fs:[eax],edx
 0054C21A    push        54C22F
 0054C21F    mov         eax,dword ptr [ebp-4]
 0054C222    call        TObject.Free
 0054C227    ret
>0054C228    jmp         @HandleFinally
>0054C22D    jmp         0054C21F
 0054C22F    pop         edi
 0054C230    pop         esi
 0054C231    pop         ebx
 0054C232    pop         ecx
 0054C233    pop         ebp
 0054C234    ret         8
end;*}

//0054C238
{*procedure sub_0054C238(?:?; ?:?; ?:?);
begin
 0054C238    push        ebp
 0054C239    mov         ebp,esp
 0054C23B    push        ecx
 0054C23C    mov         ecx,5
 0054C241    push        0
 0054C243    push        0
 0054C245    dec         ecx
>0054C246    jne         0054C241
 0054C248    xchg        ecx,dword ptr [ebp-4]
 0054C24B    push        ebx
 0054C24C    push        esi
 0054C24D    push        edi
 0054C24E    mov         edi,ecx
 0054C250    mov         esi,edx
 0054C252    mov         ebx,eax
 0054C254    xor         eax,eax
 0054C256    push        ebp
 0054C257    push        54C3F9
 0054C25C    push        dword ptr fs:[eax]
 0054C25F    mov         dword ptr fs:[eax],esp
 0054C262    lea         edx,[ebp-14]
 0054C265    mov         eax,ebx
 0054C267    call        0054BBB0
 0054C26C    mov         edx,dword ptr [ebp-14]
 0054C26F    lea         eax,[ebp-4]
 0054C272    mov         ecx,54C408;['{7DAD5224-46EA-11D5-B0C0-4854E825F345}']
 0054C277    call        @IntfCast
 0054C27C    mov         dl,1
 0054C27E    mov         eax,[0043C7BC];TStringList
 0054C283    call        TStringList.Create;TStringList.Create
 0054C288    mov         dword ptr [ebp-10],eax
 0054C28B    xor         edx,edx
 0054C28D    push        ebp
 0054C28E    push        54C3AD
 0054C293    push        dword ptr fs:[edx]
 0054C296    mov         dword ptr fs:[edx],esp
 0054C299    push        1
 0054C29B    mov         ecx,dword ptr [ebp-10]
 0054C29E    mov         edx,54C424;','
 0054C2A3    mov         eax,edi
 0054C2A5    call        005393EC
 0054C2AA    mov         eax,dword ptr [ebp-10]
 0054C2AD    mov         edx,dword ptr [eax]
 0054C2AF    call        dword ptr [edx+14];TStringList.GetCount
 0054C2B2    test        eax,eax
>0054C2B4    jle         0054C38A
 0054C2BA    lea         ecx,[ebp-18]
 0054C2BD    xor         edx,edx
 0054C2BF    mov         eax,dword ptr [ebp-10]
 0054C2C2    mov         ebx,dword ptr [eax]
 0054C2C4    call        dword ptr [ebx+0C];TStringList.Get
 0054C2C7    mov         eax,dword ptr [ebp-18]
 0054C2CA    cmp         word ptr [eax],5B
>0054C2CE    jne         0054C38A
 0054C2D4    lea         ecx,[ebp-8]
 0054C2D7    xor         edx,edx
 0054C2D9    mov         eax,dword ptr [ebp-10]
 0054C2DC    mov         ebx,dword ptr [eax]
 0054C2DE    call        dword ptr [ebx+0C];TStringList.Get
 0054C2E1    lea         ecx,[ebp-1C]
 0054C2E4    xor         edx,edx
 0054C2E6    mov         eax,dword ptr [ebp-10]
 0054C2E9    mov         ebx,dword ptr [eax]
 0054C2EB    call        dword ptr [ebx+0C];TStringList.Get
 0054C2EE    mov         eax,dword ptr [ebp-1C]
 0054C2F1    mov         dword ptr [ebp-20],eax
 0054C2F4    mov         ebx,dword ptr [ebp-20]
 0054C2F7    test        ebx,ebx
>0054C2F9    je          0054C300
 0054C2FB    sub         ebx,4
 0054C2FE    mov         ebx,dword ptr [ebx]
 0054C300    lea         eax,[ebp-24]
 0054C303    push        eax
 0054C304    mov         ecx,ebx
 0054C306    mov         edx,2
 0054C30B    mov         eax,dword ptr [ebp-8]
 0054C30E    call        @UStrCopy
 0054C313    mov         ecx,dword ptr [ebp-24]
 0054C316    xor         edx,edx
 0054C318    mov         eax,dword ptr [ebp-10]
 0054C31B    mov         ebx,dword ptr [eax]
 0054C31D    call        dword ptr [ebx+20];TStringList.Put
 0054C320    mov         eax,dword ptr [ebp-10]
 0054C323    mov         edx,dword ptr [eax]
 0054C325    call        dword ptr [edx+14];TStringList.GetCount
 0054C328    mov         edx,eax
 0054C32A    dec         edx
 0054C32B    lea         ecx,[ebp-0C]
 0054C32E    mov         eax,dword ptr [ebp-10]
 0054C331    mov         ebx,dword ptr [eax]
 0054C333    call        dword ptr [ebx+0C];TStringList.Get
 0054C336    mov         eax,dword ptr [ebp-10]
 0054C339    mov         edx,dword ptr [eax]
 0054C33B    call        dword ptr [edx+14];TStringList.GetCount
 0054C33E    mov         edx,eax
 0054C340    dec         edx
 0054C341    lea         ecx,[ebp-28]
 0054C344    mov         eax,dword ptr [ebp-10]
 0054C347    mov         ebx,dword ptr [eax]
 0054C349    call        dword ptr [ebx+0C];TStringList.Get
 0054C34C    mov         eax,dword ptr [ebp-28]
 0054C34F    mov         dword ptr [ebp-20],eax
 0054C352    mov         ebx,dword ptr [ebp-20]
 0054C355    test        ebx,ebx
>0054C357    je          0054C35E
 0054C359    sub         ebx,4
 0054C35C    mov         ebx,dword ptr [ebx]
 0054C35E    lea         eax,[ebp-2C]
 0054C361    push        eax
 0054C362    mov         ecx,ebx
 0054C364    dec         ecx
 0054C365    mov         edx,1
 0054C36A    mov         eax,dword ptr [ebp-0C]
 0054C36D    call        @UStrCopy
 0054C372    mov         eax,dword ptr [ebp-2C]
 0054C375    push        eax
 0054C376    mov         eax,dword ptr [ebp-10]
 0054C379    mov         edx,dword ptr [eax]
 0054C37B    call        dword ptr [edx+14];TStringList.GetCount
 0054C37E    mov         edx,eax
 0054C380    dec         edx
 0054C381    mov         eax,dword ptr [ebp-10]
 0054C384    pop         ecx
 0054C385    mov         ebx,dword ptr [eax]
 0054C387    call        dword ptr [ebx+20];TStringList.Put
 0054C38A    mov         edx,esi
 0054C38C    mov         ecx,dword ptr [ebp-10]
 0054C38F    mov         eax,dword ptr [ebp-4]
 0054C392    mov         ebx,dword ptr [eax]
 0054C394    call        dword ptr [ebx+30]
 0054C397    xor         eax,eax
 0054C399    pop         edx
 0054C39A    pop         ecx
 0054C39B    pop         ecx
 0054C39C    mov         dword ptr fs:[eax],edx
 0054C39F    push        54C3B4
 0054C3A4    mov         eax,dword ptr [ebp-10]
 0054C3A7    call        TObject.Free
 0054C3AC    ret
>0054C3AD    jmp         @HandleFinally
>0054C3B2    jmp         0054C3A4
 0054C3B4    xor         eax,eax
 0054C3B6    pop         edx
 0054C3B7    pop         ecx
 0054C3B8    pop         ecx
 0054C3B9    mov         dword ptr fs:[eax],edx
 0054C3BC    push        54C400
 0054C3C1    lea         eax,[ebp-2C]
 0054C3C4    mov         edx,3
 0054C3C9    call        @UStrArrayClr
 0054C3CE    lea         eax,[ebp-1C]
 0054C3D1    mov         edx,2
 0054C3D6    call        @UStrArrayClr
 0054C3DB    lea         eax,[ebp-14]
 0054C3DE    call        @IntfClear
 0054C3E3    lea         eax,[ebp-0C]
 0054C3E6    mov         edx,2
 0054C3EB    call        @UStrArrayClr
 0054C3F0    lea         eax,[ebp-4]
 0054C3F3    call        @IntfClear
 0054C3F8    ret
>0054C3F9    jmp         @HandleFinally
>0054C3FE    jmp         0054C3C1
 0054C400    pop         edi
 0054C401    pop         esi
 0054C402    pop         ebx
 0054C403    mov         esp,ebp
 0054C405    pop         ebp
 0054C406    ret
end;*}

Initialization
//007811B8
{*
 007811B8    sub         dword ptr ds:[8154E0],1
>007811BF    jae         007811E1
 007811C1    mov         dl,1
 007811C3    mov         eax,[00439D58];TThreadList
 007811C8    call        TThreadList.Create;TThreadList.Create
 007811CD    mov         [008154E4],eax;gvar_008154E4:TThreadList
 007811D2    mov         edx,788D50;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 007811D7    mov         eax,[00790C38];gvar_00790C38
 007811DC    call        0053F424
 007811E1    ret
*}
Finalization
//0054C428
{*
 0054C428    push        ebp
 0054C429    mov         ebp,esp
 0054C42B    xor         eax,eax
 0054C42D    push        ebp
 0054C42E    push        54C480
 0054C433    push        dword ptr fs:[eax]
 0054C436    mov         dword ptr fs:[eax],esp
 0054C439    inc         dword ptr ds:[8154E0]
>0054C43F    jne         0054C472
 0054C441    mov         eax,[00790C38];gvar_00790C38
 0054C446    call        0053F440
 0054C44B    call        0054BDF4
 0054C450    mov         eax,[008154E4];gvar_008154E4:TThreadList
 0054C455    xor         edx,edx
 0054C457    mov         dword ptr ds:[8154E4],edx;gvar_008154E4:TThreadList
 0054C45D    call        TObject.Free
 0054C462    mov         eax,788D50;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 0054C467    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 0054C46D    call        @FinalizeRecord
 0054C472    xor         eax,eax
 0054C474    pop         edx
 0054C475    pop         ecx
 0054C476    pop         ecx
 0054C477    mov         dword ptr fs:[eax],edx
 0054C47A    push        54C487
 0054C47F    ret
>0054C480    jmp         @HandleFinally
>0054C485    jmp         0054C47F
 0054C487    pop         ebp
 0054C488    ret
*}
end.