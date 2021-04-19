//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Variants;

interface

uses
  SysUtils, Classes;

type
  TVarCompareResult = (crLessThan, crEqual, crGreaterThan);
  TCustomVariantType = class(TObject)
  published
    procedure BinaryOp(var Left:TVarData; Right:TVarData; Operator:Integer);//00435738
    procedure Copy(var Dest:TVarData; Source:TVarData; Indirect:Boolean);//0042C474
    procedure Clear(var V:TVarData);//0042C46C
    procedure Compare(Left:TVarData; Right:TVarData; var Relationship:TVarCompareResult);//004357C4
    function CompareOp(Left:TVarData; Right:TVarData; Operator:Integer):Boolean;//004357D0
    procedure UnaryOp(var Right:TVarData; Operator:Integer);//00435BDC
    procedure CastToOle(var Dest:TVarData; Source:TVarData);//00435808
    destructor Destroy();//00435B04
    constructor Create;//00435888
    constructor Create();//00435844
    procedure CastTo(var Dest:TVarData; Source:TVarData; AVarType:Word);//0043577C
    procedure Cast(var Dest:TVarData; Source:TVarData);//00435744
    function IsClear(V:TVarData):Boolean;//00435B90
  public
    FVarType:Word;//f4
    destructor Destroy(); virtual;//00435B04
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; virtual; stdcall;//v0//00435C08
    function LeftPromotion(const V:TVarData; const Operator:TVarOp; var RequiredVarType:TVarType):Boolean; virtual;//v4//00435B94
    function RightPromotion(const V:TVarData; const Operator:TVarOp; var RequiredVarType:TVarType):Boolean; virtual;//v8//00435BC8
    function OlePromotion(const V:TVarData; var RequiredVarType:TVarType):Boolean; virtual;//vC//00435BA8
    procedure DispInvoke(Dest:PVarData; const Source:TVarData; CallDesc:PCallDesc; Params:Pointer); virtual;//v10//00435BE4
    function IsClear(V:TVarData):Boolean; virtual;//v14//00435B90
    procedure Cast(var Dest:TVarData; Source:TVarData); virtual;//v18//00435744
    procedure CastTo(var Dest:TVarData; Source:TVarData; AVarType:Word); virtual;//v1C//0043577C
    procedure CastToOle(var Dest:TVarData; Source:TVarData); virtual;//v20//00435808
    procedure v24; virtual; abstract;//v24//00404A58
    procedure v28; virtual; abstract;//v28//00404A58
    procedure BinaryOp(var Left:TVarData; Right:TVarData; Operator:Integer); virtual;//v2C//00435738
    procedure UnaryOp(var Right:TVarData; Operator:Integer); virtual;//v30//00435BDC
    function CompareOp(Left:TVarData; Right:TVarData; Operator:Integer):Boolean; virtual;//v34//004357D0
    procedure Compare(Left:TVarData; Right:TVarData; var Relationship:TVarCompareResult); virtual;//v38//004357C4
    procedure RaiseCastError;//00435BB0
    procedure RaiseInvalidOp;//00435BB8
    procedure RaiseDispError;//00435BC0
    function _AddRef:Integer; stdcall;//00435BF0
    function _Release:Integer; stdcall;//00435BFC
  end;
  EVariantInvalidOpError = class(EVariantError)
  end;
  EVariantTypeCastError = class(EVariantError)
  end;
  EVariantOverflowError = class(EVariantError)
  end;
  EVariantInvalidArgError = class(EVariantError)
  end;
  EVariantBadVarTypeError = class(EVariantError)
  end;
  EVariantBadIndexError = class(EVariantError)
  end;
  EVariantArrayLockedError = class(EVariantError)
  end;
  EVariantArrayCreateError = class(EVariantError)
  end;
  EVariantNotImplError = class(EVariantError)
  end;
  EVariantOutOfMemoryError = class(EVariantError)
  end;
  EVariantUnexpectedError = class(EVariantError)
  end;
  EVariantDispatchError = class(EVariantError)
  end;
  EVariantInvalidNullOpError = class(EVariantInvalidOpError)
  end;
  :02 = array of TCustomVariantType;
//elSize = 4;
    procedure VarCastError;//0042CD6C
    procedure VarCastError(const ASourceType:TVarType; const ADestType:TVarType);//0042CDC0
    procedure VarInvalidOp;//0042CE5C
    procedure VarInvalidNullOp;//0042CEB0
    procedure VarOverflowError(const ASourceType:TVarType; const ADestType:TVarType);//0042CF04
    procedure VarArrayCreateError;//0042CFA0
    procedure TranslateResult(AResult:HRESULT);//0042CFF4
    procedure VarResultCheck(AResult:HRESULT);//0042D248
    procedure VarResultCheck(AResult:HRESULT; ASourceType:TVarType; ADestType:TVarType);//0042D254
    procedure HandleConversionException(const ASourceType:TVarType; const ADestType:TVarType);//0042D288
    procedure @DispInvokeError;//0042D30C
    procedure @VarNull(var V:TVarData);//0042D360
    function ElementCount(LArrayRef:PVarArray; Dim:Integer):Integer;//0042D374
    procedure VarArrayClear(var V:TVarData);//0042D3B8
    procedure VarClearDeep(var V:TVarData);//0042D470
    procedure @VarClear(var V:TVarData);//0042D504
    procedure @VarClr(var V:TVarData);//0042D518
    procedure @DispInvoke(Dest:PVarData; const Source:TVarData; CallDesc:PCallDesc; Params:Pointer); cdecl;//0042D520
    function InBounds(At:Integer):Boolean;//0042D624
    function Increment(At:Integer):Boolean;//0042D654
    procedure VarArrayCopyForEach(var Dest:TVarData; const Src:TVarData; AProc:TVarArrayForEach);//0042D6B0
    procedure VarCopyCopyProc(var Dest:TVarData; const Src:TVarData);//0042D87C
    procedure VarCopyDeep(var Dest:TVarData; const Source:TVarData);//0042D884
    procedure @VarCopy(var Dest:TVarData; const Source:TVarData);//0042D970
    procedure VarCopyNoIndViaOS(var Dest:TVarData; const Source:TVarData);//0042D9B4
    function VarCopyNoIndOleStr(const V:TVarData):WideString;//0042D9D4
    procedure VarCopyNoIndCopyProc(var Dest:TVarData; const Source:TVarData);//0042D9DC
    procedure VarCopyNoIndDeep(var Dest:TVarData; const Source:TVarData);//0042D9E4
    procedure VarCopyByRef(var Dest:TVarData; const Source:TVarData);//0042DA18
    procedure @VarCopyNoInd(var Dest:TVarData; const Source:TVarData);//0042DC08
    procedure VarCastAsAny(var Dest:TVarData; const Source:TVarData; ADestType:TVarType);//0042DC1C
    procedure VarCastAsOleStr(var Dest:TVarData; const Source:TVarData);//0042DC88
    procedure VarCastAsString(var Dest:TVarData; const Source:TVarData);//0042DCD4
    procedure VarCastAsUString(var Dest:TVarData; const Source:TVarData);//0042DD20
    procedure VarCastAsDispatch(var Dest:TVarData; const Source:TVarData);//0042DD6C
    procedure VarCastAsInterface(var Dest:TVarData; const Source:TVarData);//0042DDB8
    procedure VarCastViaOS(var Dest:TVarData; const Source:TVarData; ADestType:TVarType);//0042DE04
    procedure VarCastRare(var Dest:TVarData; const Source:TVarData; ADestType:TVarType);//0042DE84
    procedure @VarCast(var Dest:TVarData; const Source:TVarData; AVarType:Integer);//0042DEF0
    function VarToIntAsString(const V:TVarData):Integer;//0042E144
    function VarToIntViaOS(const V:TVarData):Integer;//0042E1F8
    function VarToIntAny(const V:TVarData):Integer;//0042E234
    function VarToIntCustom(const V:TVarData; var AValue:Integer):Boolean;//0042E298
    function @VarToInteger(const V:TVarData):Integer;//0042E2DC
    function @VarToShortInt(const V:TVarData):ShortInt;//0042E78C
    function @VarToByte(const V:TVarData):Byte;//0042E840
    function @VarToSmallInt(const V:TVarData):SmallInt;//0042E8E8
    function @VarToWord(const V:TVarData):Word;//0042E9E0
    function @VarToLongWord(const V:TVarData):LongWord;//0042EABC
    function VarToInt64ViaOS(const V:TVarData):Int64;//0042EBA8
    function VarToInt64AsString(const V:TVarData):Int64;//0042EC54
    function VarToInt64Any(const V:TVarData):Int64;//0042ED54
    function VarToInt64Custom(const V:TVarData; var AValue:Int64):Boolean;//0042EDC0
    function @VarToInt64(const V:TVarData):Int64;//0042EE0C
    function @VarToUInt64(const V:TVarData):UInt64;//0042F29C
    function VarToBoolAsString(const V:TVarData):Boolean;//0042F400
    function VarToBoolViaOS(const V:TVarData):Boolean;//0042F4C4
    function VarToBoolAny(const V:TVarData):Boolean;//0042F504
    function VarToBoolCustom(const V:TVarData; var AValue:Boolean):Boolean;//0042F568
    function @VarToBoolean(const V:TVarData):Boolean;//0042F5B4
    function @VarToBool(const V:TVarData):LongBool;//0042F950
    function VarToDoubleAsString(const V:TVarData):Double;//0042F95C
    function VarToDoubleViaOS(const V:TVarData):Double;//0042FA28
    function VarToDoubleAny(const V:TVarData):Double;//0042FA74
    function VarToDoubleCustom(const V:TVarData; var AValue:Double):Boolean;//0042FAD8
    function @VarToDouble(const V:TVarData):Double;//0042FB24
    function @VarToReal(const V:TVarData):Extended;//0042FF14
    function @VarToSingle(const V:TVarData):Single;//0042FF30
    function VarToDateAsString(const V:TVarData):TDateTime;//004300F4
    function VarToDateAsDouble(const V:TVarData; const Value:Double):TDateTime;//004301EC
    function VarToDateViaOS(const V:TVarData):TDateTime;//0043024C
    function VarToDateAny(const V:TVarData):TDateTime;//00430298
    function VarToDateCustom(const V:TVarData; var AValue:TDateTime):Boolean;//004302FC
    function @VarToDate(const V:TVarData):TDateTime;//00430348
    function VarToCurrencyAsString(const V:TVarData):Currency;//0043072C
    function VarToCurrencyAsDouble(const V:TVarData; const Value:Double):Currency;//004307F0
    function VarToCurrencyViaOS(const V:TVarData):Currency;//00430850
    function VarToCurrencyAny(const V:TVarData):Currency;//0043089C
    function VarToCurrencyCustom(const V:TVarData; var AValue:Currency):Boolean;//00430900
    function @VarToCurrency(const V:TVarData):Currency;//0043094C
    function CurrToWStrViaOS(const AValue:Currency):WideString;//00430DA8
    function DateToWStrViaOS(const AValue:TDateTime):WideString;//00430DE0
    function BoolToWStrViaOS(const AValue:WordBool):WideString;//00430E18
    function VarToLStrViaOS(const V:TVarData):UnicodeString;//00430EE0
    function VarToLStrAny(const V:TVarData):AnsiString;//00430F98
    function VarToLStrCustom(const V:TVarData; var AValue:AnsiString):Boolean;//00430FFC
    procedure @VarToLStr(var S:AnsiString; const V:TVarData);//00431084
    function VarToWStrViaOS(const V:TVarData):WideString;//004317D8
    function VarToWStrAny(const V:TVarData):WideString;//004318A4
    function VarToWStrCustom(const V:TVarData; var AValue:WideString):Boolean;//00431908
    procedure @VarToWStr(var S:WideString; const V:TVarData);//004319E4
    function VarToUStrAny(const V:TVarData):UnicodeString;//00432088
    function VarToUStrCustom(const V:TVarData; var AValue:UnicodeString):Boolean;//004320EC
    procedure @VarToUStr(var S:UnicodeString; const V:TVarData);//004321B4
    procedure AnyToIntf(var Intf:IInterface; const V:TVarData);//00432868
    procedure @VarToIntf(var Intf:IInterface; const V:TVarData);//004328E0
    procedure @VarToDisp(var Dispatch:IDispatch; const V:TVarData);//004329AC
    procedure @VarFromInt(var V:TVarData; const Value:Integer; const Range:ShortInt);//00432A58
    procedure @VarFromInteger(var V:TVarData; const Value:Integer);//00432A94
    procedure @OleVarFromInt(var V:TVarData; const Value:Integer; const Range:ShortInt);//00432AB4
    procedure @VarFromByte(var V:TVarData; const Value:Byte);//00432AD4
    procedure @VarFromWord(var V:TVarData; const Value:Word);//00432AF4
    procedure @VarFromLongWord(var V:TVarData; const Value:LongWord);//00432B14
    procedure @VarFromUInt64(var V:TVarData; const Value:UInt64);//00432B34
    procedure @VarFromShortInt(var V:TVarData; const Value:ShortInt);//00432B60
    procedure @VarFromSmallInt(var V:TVarData; const Value:SmallInt);//00432B80
    procedure @VarFromInt64(var V:TVarData; const Value:Int64);//00432BA0
    procedure @VarFromSingle(var Dest:TVarData; const Value:Single);//00432BCC
    procedure @VarFromDouble(var Dest:TVarData; const Value:Double);//00432BF0
    procedure @VarFromCurrency(var Dest:TVarData; const Value:Currency);//00432C1C
    procedure @VarFromDate(var Dest:TVarData; const Value:TDateTime);//00432C48
    procedure @VarFromBool(var V:TVarData; const Value:Boolean);//00432C74
    procedure @VarFromReal(var v:Variant);//00432C9C
    procedure @VarFromTDateTime(var v:Variant);//00432CB0
    procedure @VarFromCurr(var v:Variant);//00432CC4
    procedure @VarFromLStr(var V:TVarData; const Value:AnsiString);//00432CD8
    procedure @VarFromWStr(var V:TVarData; const Value:WideString);//00432D04
    procedure @VarFromUStr(var V:TVarData; const Value:UnicodeString);//00432D3C
    procedure @VarFromIntf(var V:TVarData; const Value:IInterface);//00432D68
    procedure @VarFromDisp(var V:TVarData; const Value:IDispatch);//00432D94
    procedure @OleVarFromLStr(var V:TVarData; const Value:AnsiString);//00432DC0
    procedure @OleVarFromUStr(var V:TVarData; const Value:UnicodeString);//00432E10
    procedure OleVarFromAny(var V:TVarData; const Value:TVarData);//00432E60
    procedure OleVarFromVarArrayProc(var Dest:TVarData; const Src:TVarData);//00432EC4
    procedure @OleVarFromVar(var Dest:TVarData; const Source:TVarData);//00432ECC
    procedure VarStrCat(var Dest:Variant; const Source:Variant);//00433094
    procedure VarOpRare(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);//0043318C
    function CheckType(T:TVarType):TVarType;//004334D8
    procedure AnyOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);//00433504
    procedure RealOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);//00433590
    procedure DateOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);//00433624
    procedure IntOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);//00433698
    procedure Int64Op(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);//004337B4
    procedure UInt64Op(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);//004339AC
    procedure NullOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);//00433BA4
    procedure EmptyOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);//00433C50
    procedure CurrOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp; const LeftBase:TBaseType; const RightBase:TBaseType);//00433CE8
    procedure SimpleVarOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);//00433E70
    procedure @VarOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);//00434114
    function VarCompareAny(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;//004341A4
    function EmptyCompare(L:TBaseType; R:TBaseType):TVarCompareResult;//0043427C
    function NullCompare(L:TBaseType; R:TBaseType; OpCode:TVarOp):TVarCompareResult;//00434290
    function IntCompare(A:Integer; B:Integer):TVarCompareResult;//00434384
    function Int64Compare(const A:Int64; const B:Int64):TVarCompareResult;//00434398
    function UInt64Compare(const A:UInt64; const B:UInt64):TVarCompareResult;//004343D4
    function RealCompare(const A:Double; const B:Double):TVarCompareResult;//00434408
    function DateCompare(const A:TDateTime; const B:TDateTime):TVarCompareResult;//00434434
    function CurrCompare(const A:Currency; const B:Currency):TVarCompareResult;//00434460
    function StringCompare(const L:TVarData; const R:TVarData):TVarCompareResult;//00434490
    function VarCompareSimple(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;//004344FC
    function VarCompareRare(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;//004346A8
    function VarCompare(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;//00434ACC
    procedure NotAsString(var Dest:TVarData);//00434B34
    procedure NotAsOrdinal(var Dest:TVarData);//00434C08
    procedure NegateViaOS(var Dest:TVarData);//00434C70
    procedure NegateVariant(Source:PVarData; var Dest:TVarData);//00434C88
    procedure NegateAny(var Dest:TVarData);//00434CB4
    function NotCustom(var Dest:TVarData):Boolean;//00434CC8
    procedure @VarNeg(var Dest:TVarData);//00434CF4
    procedure @VarAddRef(var V:TVarData);//00434FB8
    function VarTypeAsText(const AType:TVarType):UnicodeString;//00435234
    //function sub_004353E8(?:TVarData):?;//004353E8
    function FindVarData(const V:Variant):PVarData;//004353EC
    function VarIsClear(const V:Variant):Boolean;//004353FC
    function VarTypeIsOrdinal(const AVarType:TVarType):Boolean;//00435470
    function VarIsOrdinal(const V:Variant):Boolean;//00435490
    function VarIsEmpty(const V:Variant):Boolean;//004354A4
    function VarIsNull(const V:Variant):Boolean;//004354B8
    function VarToStr(const V:Variant):UnicodeString;//004354CC
    function VarToStrDef(const V:Variant; const ADefault:UnicodeString):UnicodeString;//004354E4
    function VarToWideStr(const V:Variant):WideString;//00435510
    function VarToWideStrDef(const V:Variant; const ADefault:WideString):WideString;//00435568
    function VarSameValue(const A:Variant; const B:Variant):Boolean;//00435594
    procedure SetVarAsError(var V:TVarData; AResult:HRESULT);//0043560C
    procedure SetClearVarToEmptyParam(var V:TVarData);//00435624
    function GetVarDataArrayInfo(const AVarData:TVarData; var AVarType:TVarType; var AVarArray:PVarArray):Boolean;//00435630
    function VarIsArray(const A:Variant):Boolean;//00435674
    function VarIsArray(const A:Variant; AResolveByRef:Boolean):Boolean;//0043567C
    procedure ClearVariantTypeList;//004356CC
    function LeftPromotion(const V:TVarData; const Operator:TVarOp; var RequiredVarType:TVarType):Boolean;//00435B94
    function OlePromotion(const V:TVarData; var RequiredVarType:TVarType):Boolean;//00435BA8
    function RightPromotion(const V:TVarData; const Operator:TVarOp; var RequiredVarType:TVarType):Boolean;//00435BC8
    procedure DispInvoke(Dest:PVarData; const Source:TVarData; CallDesc:PCallDesc; Params:Pointer);//00435BE4
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;//00435C08
    function FindCustomVariantType(const AVarType:TVarType; var CustomVariantType:TCustomVariantType):Boolean;//00435C30
    function FindCustomVariantType(const TypeName:UnicodeString; var CustomVariantType:TCustomVariantType):Boolean;//00435CEC
    procedure sub_00435DC0;//00435DC0
    function Null:Variant;//00435DC8
    procedure @VarAdd(var Left:TVarData; const Right:TVarData);//00435DD0
    procedure @VarCmpEQ(const Left:TVarData; const Right:TVarData);//00435DDC
    procedure @VarCmpNE(const Left:TVarData; const Right:TVarData);//00435DEC

implementation

//0042C46C
procedure TCustomVariantType.Clear(var V:TVarData);
begin
{*
>0042C46C    jmp         @AbstractError
*}
end;

//0042C474
procedure TCustomVariantType.Copy(var Dest:TVarData; Source:TVarData; Indirect:Boolean);
begin
{*
>0042C474    jmp         @AbstractError
*}
end;

//0042CD6C
procedure VarCastError;
begin
{*
 0042CD6C    push        ebp
 0042CD6D    mov         ebp,esp
 0042CD6F    push        0
 0042CD71    xor         eax,eax
 0042CD73    push        ebp
 0042CD74    push        42CDB6
 0042CD79    push        dword ptr fs:[eax]
 0042CD7C    mov         dword ptr fs:[eax],esp
 0042CD7F    lea         edx,[ebp-4]
 0042CD82    mov         eax,[0078D3D4];^SResString36:TResStringRec
 0042CD87    call        LoadResString
 0042CD8C    mov         ecx,dword ptr [ebp-4]
 0042CD8F    mov         dl,1
 0042CD91    mov         eax,[0042C52C];EVariantTypeCastError
 0042CD96    call        Exception.Create
 0042CD9B    call        @RaiseExcept
 0042CDA0    xor         eax,eax
 0042CDA2    pop         edx
 0042CDA3    pop         ecx
 0042CDA4    pop         ecx
 0042CDA5    mov         dword ptr fs:[eax],edx
 0042CDA8    push        42CDBD
 0042CDAD    lea         eax,[ebp-4]
 0042CDB0    call        @UStrClr
 0042CDB5    ret
>0042CDB6    jmp         @HandleFinally
>0042CDBB    jmp         0042CDAD
 0042CDBD    pop         ecx
 0042CDBE    pop         ebp
 0042CDBF    ret
*}
end;

//0042CDC0
procedure VarCastError(const ASourceType:TVarType; const ADestType:TVarType);
begin
{*
 0042CDC0    push        ebp
 0042CDC1    mov         ebp,esp
 0042CDC3    add         esp,0FFFFFFE4
 0042CDC6    push        ebx
 0042CDC7    push        esi
 0042CDC8    xor         ecx,ecx
 0042CDCA    mov         dword ptr [ebp-14],ecx
 0042CDCD    mov         dword ptr [ebp-18],ecx
 0042CDD0    mov         dword ptr [ebp-1C],ecx
 0042CDD3    mov         esi,edx
 0042CDD5    mov         ebx,eax
 0042CDD7    xor         eax,eax
 0042CDD9    push        ebp
 0042CDDA    push        42CE4F
 0042CDDF    push        dword ptr fs:[eax]
 0042CDE2    mov         dword ptr fs:[eax],esp
 0042CDE5    lea         edx,[ebp-14]
 0042CDE8    mov         eax,ebx
 0042CDEA    call        VarTypeAsText
 0042CDEF    mov         eax,dword ptr [ebp-14]
 0042CDF2    mov         dword ptr [ebp-10],eax
 0042CDF5    mov         byte ptr [ebp-0C],11
 0042CDF9    lea         edx,[ebp-18]
 0042CDFC    mov         eax,esi
 0042CDFE    call        VarTypeAsText
 0042CE03    mov         eax,dword ptr [ebp-18]
 0042CE06    mov         dword ptr [ebp-8],eax
 0042CE09    mov         byte ptr [ebp-4],11
 0042CE0D    lea         eax,[ebp-10]
 0042CE10    push        eax
 0042CE11    push        1
 0042CE13    lea         edx,[ebp-1C]
 0042CE16    mov         eax,[0078CB4C];^SResString44:TResStringRec
 0042CE1B    call        LoadResString
 0042CE20    mov         ecx,dword ptr [ebp-1C]
 0042CE23    mov         dl,1
 0042CE25    mov         eax,[0042C52C];EVariantTypeCastError
 0042CE2A    call        Exception.CreateFmt
 0042CE2F    call        @RaiseExcept
 0042CE34    xor         eax,eax
 0042CE36    pop         edx
 0042CE37    pop         ecx
 0042CE38    pop         ecx
 0042CE39    mov         dword ptr fs:[eax],edx
 0042CE3C    push        42CE56
 0042CE41    lea         eax,[ebp-1C]
 0042CE44    mov         edx,3
 0042CE49    call        @UStrArrayClr
 0042CE4E    ret
>0042CE4F    jmp         @HandleFinally
>0042CE54    jmp         0042CE41
 0042CE56    pop         esi
 0042CE57    pop         ebx
 0042CE58    mov         esp,ebp
 0042CE5A    pop         ebp
 0042CE5B    ret
*}
end;

//0042CE5C
procedure VarInvalidOp;
begin
{*
 0042CE5C    push        ebp
 0042CE5D    mov         ebp,esp
 0042CE5F    push        0
 0042CE61    xor         eax,eax
 0042CE63    push        ebp
 0042CE64    push        42CEA6
 0042CE69    push        dword ptr fs:[eax]
 0042CE6C    mov         dword ptr fs:[eax],esp
 0042CE6F    lea         edx,[ebp-4]
 0042CE72    mov         eax,[0078D2CC];^SResString37:TResStringRec
 0042CE77    call        LoadResString
 0042CE7C    mov         ecx,dword ptr [ebp-4]
 0042CE7F    mov         dl,1
 0042CE81    mov         eax,[0042C47C];EVariantInvalidOpError
 0042CE86    call        Exception.Create
 0042CE8B    call        @RaiseExcept
 0042CE90    xor         eax,eax
 0042CE92    pop         edx
 0042CE93    pop         ecx
 0042CE94    pop         ecx
 0042CE95    mov         dword ptr fs:[eax],edx
 0042CE98    push        42CEAD
 0042CE9D    lea         eax,[ebp-4]
 0042CEA0    call        @UStrClr
 0042CEA5    ret
>0042CEA6    jmp         @HandleFinally
>0042CEAB    jmp         0042CE9D
 0042CEAD    pop         ecx
 0042CEAE    pop         ebp
 0042CEAF    ret
*}
end;

//0042CEB0
procedure VarInvalidNullOp;
begin
{*
 0042CEB0    push        ebp
 0042CEB1    mov         ebp,esp
 0042CEB3    push        0
 0042CEB5    xor         eax,eax
 0042CEB7    push        ebp
 0042CEB8    push        42CEFA
 0042CEBD    push        dword ptr fs:[eax]
 0042CEC0    mov         dword ptr fs:[eax],esp
 0042CEC3    lea         edx,[ebp-4]
 0042CEC6    mov         eax,[0078D3EC];^SResString38:TResStringRec
 0042CECB    call        LoadResString
 0042CED0    mov         ecx,dword ptr [ebp-4]
 0042CED3    mov         dl,1
 0042CED5    mov         eax,[0042CCB4];EVariantInvalidNullOpError
 0042CEDA    call        Exception.Create
 0042CEDF    call        @RaiseExcept
 0042CEE4    xor         eax,eax
 0042CEE6    pop         edx
 0042CEE7    pop         ecx
 0042CEE8    pop         ecx
 0042CEE9    mov         dword ptr fs:[eax],edx
 0042CEEC    push        42CF01
 0042CEF1    lea         eax,[ebp-4]
 0042CEF4    call        @UStrClr
 0042CEF9    ret
>0042CEFA    jmp         @HandleFinally
>0042CEFF    jmp         0042CEF1
 0042CF01    pop         ecx
 0042CF02    pop         ebp
 0042CF03    ret
*}
end;

//0042CF04
procedure VarOverflowError(const ASourceType:TVarType; const ADestType:TVarType);
begin
{*
 0042CF04    push        ebp
 0042CF05    mov         ebp,esp
 0042CF07    add         esp,0FFFFFFE4
 0042CF0A    push        ebx
 0042CF0B    push        esi
 0042CF0C    xor         ecx,ecx
 0042CF0E    mov         dword ptr [ebp-14],ecx
 0042CF11    mov         dword ptr [ebp-18],ecx
 0042CF14    mov         dword ptr [ebp-1C],ecx
 0042CF17    mov         esi,edx
 0042CF19    mov         ebx,eax
 0042CF1B    xor         eax,eax
 0042CF1D    push        ebp
 0042CF1E    push        42CF93
 0042CF23    push        dword ptr fs:[eax]
 0042CF26    mov         dword ptr fs:[eax],esp
 0042CF29    lea         edx,[ebp-14]
 0042CF2C    mov         eax,ebx
 0042CF2E    call        VarTypeAsText
 0042CF33    mov         eax,dword ptr [ebp-14]
 0042CF36    mov         dword ptr [ebp-10],eax
 0042CF39    mov         byte ptr [ebp-0C],11
 0042CF3D    lea         edx,[ebp-18]
 0042CF40    mov         eax,esi
 0042CF42    call        VarTypeAsText
 0042CF47    mov         eax,dword ptr [ebp-18]
 0042CF4A    mov         dword ptr [ebp-8],eax
 0042CF4D    mov         byte ptr [ebp-4],11
 0042CF51    lea         eax,[ebp-10]
 0042CF54    push        eax
 0042CF55    push        1
 0042CF57    lea         edx,[ebp-1C]
 0042CF5A    mov         eax,[0078D588];^SResString45:TResStringRec
 0042CF5F    call        LoadResString
 0042CF64    mov         ecx,dword ptr [ebp-1C]
 0042CF67    mov         dl,1
 0042CF69    mov         eax,[0042C5D8];EVariantOverflowError
 0042CF6E    call        Exception.CreateFmt
 0042CF73    call        @RaiseExcept
 0042CF78    xor         eax,eax
 0042CF7A    pop         edx
 0042CF7B    pop         ecx
 0042CF7C    pop         ecx
 0042CF7D    mov         dword ptr fs:[eax],edx
 0042CF80    push        42CF9A
 0042CF85    lea         eax,[ebp-1C]
 0042CF88    mov         edx,3
 0042CF8D    call        @UStrArrayClr
 0042CF92    ret
>0042CF93    jmp         @HandleFinally
>0042CF98    jmp         0042CF85
 0042CF9A    pop         esi
 0042CF9B    pop         ebx
 0042CF9C    mov         esp,ebp
 0042CF9E    pop         ebp
 0042CF9F    ret
*}
end;

//0042CFA0
procedure VarArrayCreateError;
begin
{*
 0042CFA0    push        ebp
 0042CFA1    mov         ebp,esp
 0042CFA3    push        0
 0042CFA5    xor         eax,eax
 0042CFA7    push        ebp
 0042CFA8    push        42CFEA
 0042CFAD    push        dword ptr fs:[eax]
 0042CFB0    mov         dword ptr fs:[eax],esp
 0042CFB3    lea         edx,[ebp-4]
 0042CFB6    mov         eax,[0078D1A0];^SResString33:TResStringRec
 0042CFBB    call        LoadResString
 0042CFC0    mov         ecx,dword ptr [ebp-4]
 0042CFC3    mov         dl,1
 0042CFC5    mov         eax,[0042C944];EVariantArrayCreateError
 0042CFCA    call        Exception.Create
 0042CFCF    call        @RaiseExcept
 0042CFD4    xor         eax,eax
 0042CFD6    pop         edx
 0042CFD7    pop         ecx
 0042CFD8    pop         ecx
 0042CFD9    mov         dword ptr fs:[eax],edx
 0042CFDC    push        42CFF1
 0042CFE1    lea         eax,[ebp-4]
 0042CFE4    call        @UStrClr
 0042CFE9    ret
>0042CFEA    jmp         @HandleFinally
>0042CFEF    jmp         0042CFE1
 0042CFF1    pop         ecx
 0042CFF2    pop         ebp
 0042CFF3    ret
*}
end;

//0042CFF4
procedure TranslateResult(AResult:HRESULT);
begin
{*
 0042CFF4    push        ebp
 0042CFF5    mov         ebp,esp
 0042CFF7    mov         ecx,8
 0042CFFC    push        0
 0042CFFE    push        0
 0042D000    dec         ecx
>0042D001    jne         0042CFFC
 0042D003    push        ebx
 0042D004    mov         ebx,eax
 0042D006    xor         eax,eax
 0042D008    push        ebp
 0042D009    push        42D239
 0042D00E    push        dword ptr fs:[eax]
 0042D011    mov         dword ptr fs:[eax],esp
 0042D014    mov         eax,ebx
 0042D016    cmp         eax,8002000A
>0042D01B    jg          0042D056
>0042D01D    je          0042D0BD
 0042D023    cmp         eax,80020005
>0042D028    jg          0042D047
>0042D02A    je          0042D083
 0042D02C    sub         eax,80004001
>0042D031    je          0042D12F
 0042D037    sub         eax,0BFFE
>0042D03C    je          0042D19E
>0042D042    jmp         0042D1C1
 0042D047    sub         eax,80020008
>0042D04C    je          0042D08D
 0042D04E    dec         eax
>0042D04F    je          0042D0B3
>0042D051    jmp         0042D1C1
 0042D056    sub         eax,8002000B
>0042D05B    je          0042D0E3
 0042D061    sub         eax,2
>0042D064    je          0042D109
 0042D06A    sub         eax,50001
>0042D06F    je          0042D155
 0042D075    sub         eax,49
>0042D078    je          0042D17B
>0042D07E    jmp         0042D1C1
 0042D083    call        VarCastError
>0042D088    jmp         0042D211
 0042D08D    lea         edx,[ebp-4]
 0042D090    mov         eax,[0078D990];^SResString48:TResStringRec
 0042D095    call        LoadResString
 0042D09A    mov         ecx,dword ptr [ebp-4]
 0042D09D    mov         dl,1
 0042D09F    mov         eax,[0042C734];EVariantBadVarTypeError
 0042D0A4    call        Exception.Create
 0042D0A9    call        @RaiseExcept
>0042D0AE    jmp         0042D211
 0042D0B3    call        VarInvalidOp
>0042D0B8    jmp         0042D211
 0042D0BD    lea         edx,[ebp-8]
 0042D0C0    mov         eax,[0078CD58];^SResString46:TResStringRec
 0042D0C5    call        LoadResString
 0042D0CA    mov         ecx,dword ptr [ebp-8]
 0042D0CD    mov         dl,1
 0042D0CF    mov         eax,[0042C5D8];EVariantOverflowError
 0042D0D4    call        Exception.Create
 0042D0D9    call        @RaiseExcept
>0042D0DE    jmp         0042D211
 0042D0E3    lea         edx,[ebp-0C]
 0042D0E6    mov         eax,[0078D764];^SResString34:TResStringRec
 0042D0EB    call        LoadResString
 0042D0F0    mov         ecx,dword ptr [ebp-0C]
 0042D0F3    mov         dl,1
 0042D0F5    mov         eax,[0042C7E4];EVariantBadIndexError
 0042D0FA    call        Exception.Create
 0042D0FF    call        @RaiseExcept
>0042D104    jmp         0042D211
 0042D109    lea         edx,[ebp-10]
 0042D10C    mov         eax,[0078DB1C];^SResString35:TResStringRec
 0042D111    call        LoadResString
 0042D116    mov         ecx,dword ptr [ebp-10]
 0042D119    mov         dl,1
 0042D11B    mov         eax,[0042C890];EVariantArrayLockedError
 0042D120    call        Exception.Create
 0042D125    call        @RaiseExcept
>0042D12A    jmp         0042D211
 0042D12F    lea         edx,[ebp-14]
 0042D132    mov         eax,[0078D484];^SResString49:TResStringRec
 0042D137    call        LoadResString
 0042D13C    mov         ecx,dword ptr [ebp-14]
 0042D13F    mov         dl,1
 0042D141    mov         eax,[0042C9F8];EVariantNotImplError
 0042D146    call        Exception.Create
 0042D14B    call        @RaiseExcept
>0042D150    jmp         0042D211
 0042D155    lea         edx,[ebp-18]
 0042D158    mov         eax,[0078CF14];^SResString4:TResStringRec
 0042D15D    call        LoadResString
 0042D162    mov         ecx,dword ptr [ebp-18]
 0042D165    mov         dl,1
 0042D167    mov         eax,[0042CAA4];EVariantOutOfMemoryError
 0042D16C    call        Exception.Create
 0042D171    call        @RaiseExcept
>0042D176    jmp         0042D211
 0042D17B    lea         edx,[ebp-1C]
 0042D17E    mov         eax,[0078CF64];^SResString47:TResStringRec
 0042D183    call        LoadResString
 0042D188    mov         ecx,dword ptr [ebp-1C]
 0042D18B    mov         dl,1
 0042D18D    mov         eax,[0042C684];EVariantInvalidArgError
 0042D192    call        Exception.Create
 0042D197    call        @RaiseExcept
>0042D19C    jmp         0042D211
 0042D19E    lea         edx,[ebp-20]
 0042D1A1    mov         eax,[0078CD54];^SResString50:TResStringRec
 0042D1A6    call        LoadResString
 0042D1AB    mov         ecx,dword ptr [ebp-20]
 0042D1AE    mov         dl,1
 0042D1B0    mov         eax,[0042CB58];EVariantUnexpectedError
 0042D1B5    call        Exception.Create
 0042D1BA    call        @RaiseExcept
>0042D1BF    jmp         0042D211
 0042D1C1    mov         eax,[0078D9C8]
 0042D1C6    mov         eax,dword ptr [eax]
 0042D1C8    mov         dword ptr [ebp-38],eax
 0042D1CB    mov         byte ptr [ebp-34],11
 0042D1CF    mov         dword ptr [ebp-30],ebx
 0042D1D2    mov         byte ptr [ebp-2C],0
 0042D1D6    lea         edx,[ebp-3C]
 0042D1D9    mov         eax,ebx
 0042D1DB    call        SysErrorMessage
 0042D1E0    mov         eax,dword ptr [ebp-3C]
 0042D1E3    mov         dword ptr [ebp-28],eax
 0042D1E6    mov         byte ptr [ebp-24],11
 0042D1EA    lea         eax,[ebp-38]
 0042D1ED    push        eax
 0042D1EE    push        2
 0042D1F0    lea         edx,[ebp-40]
 0042D1F3    mov         eax,[0078D1AC];^SResString39:TResStringRec
 0042D1F8    call        LoadResString
 0042D1FD    mov         ecx,dword ptr [ebp-40]
 0042D200    mov         dl,1
 0042D202    mov         eax,[0041A3C8];EVariantError
 0042D207    call        Exception.CreateFmt
 0042D20C    call        @RaiseExcept
 0042D211    xor         eax,eax
 0042D213    pop         edx
 0042D214    pop         ecx
 0042D215    pop         ecx
 0042D216    mov         dword ptr fs:[eax],edx
 0042D219    push        42D240
 0042D21E    lea         eax,[ebp-40]
 0042D221    mov         edx,2
 0042D226    call        @UStrArrayClr
 0042D22B    lea         eax,[ebp-20]
 0042D22E    mov         edx,8
 0042D233    call        @UStrArrayClr
 0042D238    ret
>0042D239    jmp         @HandleFinally
>0042D23E    jmp         0042D21E
 0042D240    pop         ebx
 0042D241    mov         esp,ebp
 0042D243    pop         ebp
 0042D244    ret
*}
end;

//0042D248
procedure VarResultCheck(AResult:HRESULT);
begin
{*
 0042D248    test        eax,eax
>0042D24A    je          0042D251
 0042D24C    call        TranslateResult
 0042D251    ret
*}
end;

//0042D254
procedure VarResultCheck(AResult:HRESULT; ASourceType:TVarType; ADestType:TVarType);
begin
{*
 0042D254    push        ebx
 0042D255    test        eax,eax
>0042D257    je          0042D285
 0042D259    mov         ebx,eax
 0042D25B    sub         ebx,80020005
>0042D261    je          0042D26A
 0042D263    sub         ebx,5
>0042D266    je          0042D275
>0042D268    jmp         0042D280
 0042D26A    mov         eax,edx
 0042D26C    mov         edx,ecx
 0042D26E    call        VarCastError
>0042D273    jmp         0042D285
 0042D275    mov         eax,edx
 0042D277    mov         edx,ecx
 0042D279    call        VarOverflowError
>0042D27E    jmp         0042D285
 0042D280    call        TranslateResult
 0042D285    pop         ebx
 0042D286    ret
*}
end;

//0042D288
procedure HandleConversionException(const ASourceType:TVarType; const ADestType:TVarType);
begin
{*
 0042D288    push        ebx
 0042D289    push        esi
 0042D28A    mov         esi,edx
 0042D28C    mov         ebx,eax
 0042D28E    call        ExceptObject
 0042D293    mov         edx,dword ptr ds:[419B58];ERangeError
 0042D299    call        @IsClass
 0042D29E    test        al,al
>0042D2A0    je          0042D2B3
 0042D2A2    mov         ecx,esi
 0042D2A4    mov         edx,ebx
 0042D2A6    mov         eax,8002000A
 0042D2AB    call        VarResultCheck
 0042D2B0    pop         esi
 0042D2B1    pop         ebx
 0042D2B2    ret
 0042D2B3    call        ExceptObject
 0042D2B8    mov         edx,dword ptr ds:[419E54];EOverflow
 0042D2BE    call        @IsClass
 0042D2C3    test        al,al
>0042D2C5    je          0042D2D7
 0042D2C7    mov         ecx,esi
 0042D2C9    mov         edx,ebx
 0042D2CB    mov         eax,8002000A
 0042D2D0    call        VarResultCheck
>0042D2D5    jmp         0042D309
 0042D2D7    call        ExceptObject
 0042D2DC    mov         edx,dword ptr ds:[41A0BC];EConvertError
 0042D2E2    call        @IsClass
 0042D2E7    test        al,al
>0042D2E9    je          0042D2FB
 0042D2EB    mov         ecx,esi
 0042D2ED    mov         edx,ebx
 0042D2EF    mov         eax,80020005
 0042D2F4    call        VarResultCheck
>0042D2F9    jmp         0042D309
 0042D2FB    call        AcquireExceptionObject
 0042D300    mov         edx,eax
 0042D302    mov         eax,edx
 0042D304    call        @RaiseExcept
 0042D309    pop         esi
 0042D30A    pop         ebx
 0042D30B    ret
*}
end;

//0042D30C
procedure @DispInvokeError;
begin
{*
 0042D30C    push        ebp
 0042D30D    mov         ebp,esp
 0042D30F    push        0
 0042D311    xor         eax,eax
 0042D313    push        ebp
 0042D314    push        42D356
 0042D319    push        dword ptr fs:[eax]
 0042D31C    mov         dword ptr fs:[eax],esp
 0042D31F    lea         edx,[ebp-4]
 0042D322    mov         eax,[0078CB28];^SResString30:TResStringRec
 0042D327    call        LoadResString
 0042D32C    mov         ecx,dword ptr [ebp-4]
 0042D32F    mov         dl,1
 0042D331    mov         eax,[0042CC08];EVariantDispatchError
 0042D336    call        Exception.Create
 0042D33B    call        @RaiseExcept
 0042D340    xor         eax,eax
 0042D342    pop         edx
 0042D343    pop         ecx
 0042D344    pop         ecx
 0042D345    mov         dword ptr fs:[eax],edx
 0042D348    push        42D35D
 0042D34D    lea         eax,[ebp-4]
 0042D350    call        @UStrClr
 0042D355    ret
>0042D356    jmp         @HandleFinally
>0042D35B    jmp         0042D34D
 0042D35D    pop         ecx
 0042D35E    pop         ebp
 0042D35F    ret
*}
end;

//0042D360
procedure @VarNull(var V:TVarData);
begin
{*
 0042D360    push        ebx
 0042D361    mov         ebx,eax
 0042D363    mov         eax,ebx
 0042D365    call        @VarClear
 0042D36A    mov         word ptr [ebx],1
 0042D36F    pop         ebx
 0042D370    ret
*}
end;

//0042D374
function ElementCount(LArrayRef:PVarArray; Dim:Integer):Integer;
begin
{*
 0042D374    push        ebp
 0042D375    mov         ebp,esp
 0042D377    add         esp,0FFFFFFF8
 0042D37A    push        ebx
 0042D37B    mov         ebx,eax
 0042D37D    lea         eax,[ebp-4]
 0042D380    push        eax
 0042D381    mov         eax,dword ptr [ebp+8]
 0042D384    mov         eax,dword ptr [eax-4]
 0042D387    push        eax
 0042D388    push        ebx
 0042D389    call        oleaut32.SafeArrayGetLBound
 0042D38E    call        VarResultCheck
 0042D393    lea         eax,[ebp-8]
 0042D396    push        eax
 0042D397    mov         eax,dword ptr [ebp+8]
 0042D39A    mov         eax,dword ptr [eax-4]
 0042D39D    push        eax
 0042D39E    push        ebx
 0042D39F    call        oleaut32.SafeArrayGetUBound
 0042D3A4    call        VarResultCheck
 0042D3A9    mov         eax,dword ptr [ebp-8]
 0042D3AC    sub         eax,dword ptr [ebp-4]
 0042D3AF    inc         eax
 0042D3B0    pop         ebx
 0042D3B1    pop         ecx
 0042D3B2    pop         ecx
 0042D3B3    pop         ebp
 0042D3B4    ret
*}
end;

//0042D3B8
procedure VarArrayClear(var V:TVarData);
begin
{*
 0042D3B8    push        ebp
 0042D3B9    mov         ebp,esp
 0042D3BB    add         esp,0FFFFFFF8
 0042D3BE    push        ebx
 0042D3BF    push        esi
 0042D3C0    push        edi
 0042D3C1    mov         dword ptr [ebp-8],eax
 0042D3C4    mov         eax,dword ptr [ebp-8]
 0042D3C7    test        byte ptr [eax+1],20
>0042D3CB    jne         0042D3D7
 0042D3CD    mov         eax,80070057
 0042D3D2    call        VarResultCheck
 0042D3D7    mov         eax,dword ptr [ebp-8]
 0042D3DA    movzx       eax,word ptr [eax]
 0042D3DD    mov         edx,eax
 0042D3DF    and         dx,0FFF
 0042D3E4    cmp         dx,0C
>0042D3E8    jne         0042D45B
 0042D3EA    mov         edx,dword ptr [ebp-8]
 0042D3ED    test        ah,40
>0042D3F0    je          0042D3FC
 0042D3F2    mov         eax,dword ptr [ebp-8]
 0042D3F5    mov         eax,dword ptr [eax+8]
 0042D3F8    mov         edi,dword ptr [eax]
>0042D3FA    jmp         0042D402
 0042D3FC    mov         edi,dword ptr [ebp-8]
 0042D3FF    mov         edi,dword ptr [edi+8]
 0042D402    xor         esi,esi
 0042D404    movzx       ebx,word ptr [edi]
 0042D407    test        ebx,ebx
>0042D409    jle         0042D43B
 0042D40B    mov         dword ptr [ebp-4],1
 0042D412    test        esi,esi
>0042D414    jne         0042D426
 0042D416    push        ebp
 0042D417    mov         edx,dword ptr [ebp-4]
 0042D41A    mov         eax,edi
 0042D41C    call        ElementCount
 0042D421    pop         ecx
 0042D422    mov         esi,eax
>0042D424    jmp         0042D435
 0042D426    push        ebp
 0042D427    mov         edx,dword ptr [ebp-4]
 0042D42A    mov         eax,edi
 0042D42C    call        ElementCount
 0042D431    pop         ecx
 0042D432    imul        esi,eax
 0042D435    inc         dword ptr [ebp-4]
 0042D438    dec         ebx
>0042D439    jne         0042D412
 0042D43B    mov         edi,dword ptr [edi+0C]
 0042D43E    mov         ebx,esi
 0042D440    test        ebx,ebx
>0042D442    jle         0042D45B
 0042D444    mov         dword ptr [ebp-4],1
 0042D44B    mov         eax,edi
 0042D44D    call        @VarClear
 0042D452    add         edi,10
 0042D455    inc         dword ptr [ebp-4]
 0042D458    dec         ebx
>0042D459    jne         0042D44B
 0042D45B    mov         eax,dword ptr [ebp-8]
 0042D45E    push        eax
 0042D45F    call        oleaut32.VariantClear
 0042D464    call        VarResultCheck
 0042D469    pop         edi
 0042D46A    pop         esi
 0042D46B    pop         ebx
 0042D46C    pop         ecx
 0042D46D    pop         ecx
 0042D46E    pop         ebp
 0042D46F    ret
*}
end;

//0042D470
procedure VarClearDeep(var V:TVarData);
begin
{*
 0042D470    push        ebx
 0042D471    push        esi
 0042D472    push        ecx
 0042D473    mov         ebx,eax
 0042D475    movzx       esi,word ptr [ebx]
 0042D478    cmp         si,14
>0042D47C    jae         0042D48B
 0042D47E    push        ebx
 0042D47F    call        oleaut32.VariantClear
 0042D484    call        VarResultCheck
>0042D489    jmp         0042D4FD
 0042D48B    cmp         si,100
>0042D490    jne         0042D4A1
 0042D492    mov         word ptr [ebx],0
 0042D497    lea         eax,[ebx+8]
 0042D49A    call        @LStrClr
>0042D49F    jmp         0042D4FD
 0042D4A1    cmp         si,102
>0042D4A6    jne         0042D4B7
 0042D4A8    mov         word ptr [ebx],0
 0042D4AD    lea         eax,[ebx+8]
 0042D4B0    call        @UStrClr
>0042D4B5    jmp         0042D4FD
 0042D4B7    cmp         si,101
>0042D4BC    jne         0042D4C8
 0042D4BE    mov         eax,ebx
 0042D4C0    call        dword ptr ds:[792F8C]
>0042D4C6    jmp         0042D4FD
 0042D4C8    test        si,2000
>0042D4CD    je          0042D4D8
 0042D4CF    mov         eax,ebx
 0042D4D1    call        VarArrayClear
>0042D4D6    jmp         0042D4FD
 0042D4D8    mov         edx,esp
 0042D4DA    mov         eax,esi
 0042D4DC    call        FindCustomVariantType
 0042D4E1    test        al,al
>0042D4E3    je          0042D4F1
 0042D4E5    mov         edx,ebx
 0042D4E7    mov         eax,dword ptr [esp]
 0042D4EA    mov         ecx,dword ptr [eax]
 0042D4EC    call        dword ptr [ecx+24]
>0042D4EF    jmp         0042D4FD
 0042D4F1    push        ebx
 0042D4F2    call        oleaut32.VariantClear
 0042D4F7    push        ebx
 0042D4F8    call        oleaut32.VariantInit
 0042D4FD    pop         edx
 0042D4FE    pop         esi
 0042D4FF    pop         ebx
 0042D500    ret
*}
end;

//0042D504
procedure @VarClear(var V:TVarData);
begin
{*
 0042D504    test        word ptr [eax],0BFE8
>0042D509    jne         0042D511
 0042D50B    mov         word ptr [eax],0
 0042D510    ret
 0042D511    call        VarClearDeep
 0042D516    ret
*}
end;

//0042D518
procedure @VarClr(var V:TVarData);
begin
{*
 0042D518    push        eax
 0042D519    call        @VarClear
 0042D51E    pop         eax
 0042D51F    ret
*}
end;

//0042D520
procedure @DispInvoke(Dest:PVarData; const Source:TVarData; CallDesc:PCallDesc; Params:Pointer); cdecl;
begin
{*
 0042D520    push        ebp
 0042D521    mov         ebp,esp
 0042D523    add         esp,0FFFFFFE8
 0042D526    push        ebx
 0042D527    push        esi
 0042D528    mov         ebx,dword ptr [ebp+0C]
 0042D52B    cmp         word ptr [ebx],400C
>0042D530    jne         0042D54F
 0042D532    mov         eax,dword ptr [ebp+14]
 0042D535    push        eax
 0042D536    mov         eax,dword ptr [ebp+10]
 0042D539    push        eax
 0042D53A    mov         eax,dword ptr [ebx+8]
 0042D53D    push        eax
 0042D53E    mov         eax,dword ptr [ebp+8]
 0042D541    push        eax
 0042D542    call        @DispInvoke
 0042D547    add         esp,10
>0042D54A    jmp         0042D61B
 0042D54F    cmp         dword ptr [ebp+8],0
>0042D553    jne         0042D55C
 0042D555    xor         eax,eax
 0042D557    mov         dword ptr [ebp-8],eax
>0042D55A    jmp         0042D56B
 0042D55C    lea         eax,[ebp-18]
 0042D55F    push        eax
 0042D560    call        oleaut32.VariantInit
 0042D565    lea         eax,[ebp-18]
 0042D568    mov         dword ptr [ebp-8],eax
 0042D56B    xor         eax,eax
 0042D56D    push        ebp
 0042D56E    push        42D614
 0042D573    push        dword ptr fs:[eax]
 0042D576    mov         dword ptr fs:[eax],esp
 0042D579    movzx       esi,word ptr [ebx]
 0042D57C    movzx       eax,si
 0042D57F    cmp         eax,101
>0042D584    jg          0042D594
>0042D586    je          0042D5A0
 0042D588    sub         eax,9
>0042D58B    je          0042D5A0
 0042D58D    sub         eax,4
>0042D590    je          0042D5A0
>0042D592    jmp         0042D5C1
 0042D594    sub         eax,4009
>0042D599    je          0042D5A0
 0042D59B    sub         eax,4
>0042D59E    jne         0042D5C1
 0042D5A0    cmp         dword ptr ds:[792F88],0
>0042D5A7    je          0042D5EB
 0042D5A9    lea         eax,[ebp+14]
 0042D5AC    push        eax
 0042D5AD    mov         eax,dword ptr [ebp+10]
 0042D5B0    push        eax
 0042D5B1    push        ebx
 0042D5B2    mov         eax,dword ptr [ebp-8]
 0042D5B5    push        eax
 0042D5B6    call        dword ptr ds:[792F88]
 0042D5BC    add         esp,10
>0042D5BF    jmp         0042D5EB
 0042D5C1    lea         edx,[ebp-4]
 0042D5C4    mov         eax,esi
 0042D5C6    call        FindCustomVariantType
 0042D5CB    test        al,al
>0042D5CD    je          0042D5E6
 0042D5CF    mov         eax,dword ptr [ebp+10]
 0042D5D2    push        eax
 0042D5D3    lea         eax,[ebp+14]
 0042D5D6    push        eax
 0042D5D7    mov         ecx,ebx
 0042D5D9    mov         edx,dword ptr [ebp-8]
 0042D5DC    mov         eax,dword ptr [ebp-4]
 0042D5DF    mov         ebx,dword ptr [eax]
 0042D5E1    call        dword ptr [ebx+10]
>0042D5E4    jmp         0042D5EB
 0042D5E6    call        VarInvalidOp
 0042D5EB    xor         eax,eax
 0042D5ED    pop         edx
 0042D5EE    pop         ecx
 0042D5EF    pop         ecx
 0042D5F0    mov         dword ptr fs:[eax],edx
 0042D5F3    push        42D61B
 0042D5F8    cmp         dword ptr [ebp-8],0
>0042D5FC    je          0042D613
 0042D5FE    mov         eax,dword ptr [ebp-8]
 0042D601    mov         edx,eax
 0042D603    mov         eax,dword ptr [ebp+8]
 0042D606    call        @VarCopy
 0042D60B    lea         eax,[ebp-18]
 0042D60E    call        @VarClear
 0042D613    ret
>0042D614    jmp         @HandleFinally
>0042D619    jmp         0042D5F8
 0042D61B    pop         esi
 0042D61C    pop         ebx
 0042D61D    mov         esp,ebp
 0042D61F    pop         ebp
 0042D620    ret
*}
end;

//0042D624
function InBounds(At:Integer):Boolean;
begin
{*
 0042D624    push        ebp
 0042D625    mov         ebp,esp
 0042D627    push        ebx
 0042D628    mov         ecx,dword ptr [ebp+8]
 0042D62B    add         ecx,0FFFFFD00
 0042D631    mov         edx,dword ptr [ecx+eax*8+4]
 0042D635    add         edx,dword ptr [ecx+eax*8]
 0042D638    mov         ebx,dword ptr [ebp+8]
 0042D63B    cmp         edx,dword ptr [ebx+eax*4-100]
 0042D642    setg        dl
 0042D645    dec         eax
 0042D646    test        dl,dl
>0042D648    je          0042D64E
 0042D64A    test        eax,eax
>0042D64C    jge         0042D631
 0042D64E    mov         eax,edx
 0042D650    pop         ebx
 0042D651    pop         ebp
 0042D652    ret
*}
end;

//0042D654
function Increment(At:Integer):Boolean;
begin
{*
 0042D654    push        ebp
 0042D655    mov         ebp,esp
 0042D657    push        ebx
 0042D658    push        esi
 0042D659    mov         dl,1
 0042D65B    mov         ecx,dword ptr [ebp+8]
 0042D65E    inc         dword ptr [ecx+eax*4-100]
 0042D665    mov         ecx,dword ptr [ebp+8]
 0042D668    mov         ecx,dword ptr [ecx+eax*8-2FC]
 0042D66F    mov         ebx,ecx
 0042D671    mov         esi,dword ptr [ebp+8]
 0042D674    add         ebx,dword ptr [esi+eax*8-300]
 0042D67B    mov         esi,dword ptr [ebp+8]
 0042D67E    cmp         ebx,dword ptr [esi+eax*4-100]
>0042D685    jg          0042D6A9
 0042D687    test        eax,eax
>0042D689    jne         0042D68F
 0042D68B    xor         edx,edx
>0042D68D    jmp         0042D6A9
 0042D68F    mov         edx,dword ptr [ebp+8]
 0042D692    mov         edx,dword ptr [ebp+8]
 0042D695    mov         dword ptr [edx+eax*4-100],ecx
 0042D69C    mov         edx,dword ptr [ebp+8]
 0042D69F    push        edx
 0042D6A0    dec         eax
 0042D6A1    call        Increment
 0042D6A6    pop         ecx
 0042D6A7    mov         edx,eax
 0042D6A9    mov         eax,edx
 0042D6AB    pop         esi
 0042D6AC    pop         ebx
 0042D6AD    pop         ebp
 0042D6AE    ret
*}
end;

//0042D6B0
procedure VarArrayCopyForEach(var Dest:TVarData; const Src:TVarData; AProc:TVarArrayForEach);
begin
{*
 0042D6B0    push        ebp
 0042D6B1    mov         ebp,esp
 0042D6B3    add         esp,0FFFFFCE0
 0042D6B9    push        ebx
 0042D6BA    push        esi
 0042D6BB    push        edi
 0042D6BC    mov         dword ptr [ebp-308],ecx
 0042D6C2    mov         ebx,edx
 0042D6C4    mov         dword ptr [ebp-304],eax
 0042D6CA    test        byte ptr [ebx+1],20
>0042D6CE    jne         0042D6DA
 0042D6D0    mov         eax,80070057
 0042D6D5    call        VarResultCheck
 0042D6DA    movzx       eax,word ptr [ebx]
 0042D6DD    mov         edx,eax
 0042D6DF    and         dx,0FFF
 0042D6E4    cmp         dx,0C
>0042D6E8    jne         0042D861
 0042D6EE    test        ah,40
>0042D6F1    je          0042D700
 0042D6F3    mov         eax,dword ptr [ebx+8]
 0042D6F6    mov         eax,dword ptr [eax]
 0042D6F8    mov         dword ptr [ebp-314],eax
>0042D6FE    jmp         0042D709
 0042D700    mov         eax,dword ptr [ebx+8]
 0042D703    mov         dword ptr [ebp-314],eax
 0042D709    mov         eax,dword ptr [ebp-314]
 0042D70F    movzx       eax,word ptr [eax]
 0042D712    mov         dword ptr [ebp-310],eax
 0042D718    mov         ebx,dword ptr [ebp-310]
 0042D71E    dec         ebx
 0042D71F    test        ebx,ebx
>0042D721    jl          0042D78E
 0042D723    inc         ebx
 0042D724    xor         edi,edi
 0042D726    lea         esi,[ebp-300]
 0042D72C    mov         eax,esi
 0042D72E    mov         dword ptr [ebp-320],eax
 0042D734    mov         eax,dword ptr [ebp-320]
 0042D73A    add         eax,4
 0042D73D    push        eax
 0042D73E    lea         eax,[edi+1]
 0042D741    push        eax
 0042D742    mov         eax,dword ptr [ebp-314]
 0042D748    push        eax
 0042D749    call        oleaut32.SafeArrayGetLBound
 0042D74E    call        VarResultCheck
 0042D753    lea         eax,[ebp-30C]
 0042D759    push        eax
 0042D75A    lea         eax,[edi+1]
 0042D75D    push        eax
 0042D75E    mov         eax,dword ptr [ebp-314]
 0042D764    push        eax
 0042D765    call        oleaut32.SafeArrayGetUBound
 0042D76A    call        VarResultCheck
 0042D76F    mov         eax,dword ptr [ebp-320]
 0042D775    mov         edx,dword ptr [ebp-30C]
 0042D77B    sub         edx,dword ptr [eax+4]
 0042D77E    inc         edx
 0042D77F    mov         eax,dword ptr [ebp-320]
 0042D785    mov         dword ptr [eax],edx
 0042D787    inc         edi
 0042D788    add         esi,8
 0042D78B    dec         ebx
>0042D78C    jne         0042D72C
 0042D78E    lea         eax,[ebp-300]
 0042D794    push        eax
 0042D795    mov         eax,dword ptr [ebp-310]
 0042D79B    push        eax
 0042D79C    push        0C
 0042D79E    call        oleaut32.SafeArrayCreate
 0042D7A3    mov         esi,eax
 0042D7A5    test        esi,esi
>0042D7A7    jne         0042D7AE
 0042D7A9    call        VarArrayCreateError
 0042D7AE    mov         eax,dword ptr [ebp-304]
 0042D7B4    call        @VarClear
 0042D7B9    mov         eax,dword ptr [ebp-304]
 0042D7BF    mov         word ptr [eax],200C
 0042D7C4    mov         eax,dword ptr [ebp-304]
 0042D7CA    mov         dword ptr [eax+8],esi
 0042D7CD    mov         ebx,dword ptr [ebp-310]
 0042D7D3    dec         ebx
 0042D7D4    test        ebx,ebx
>0042D7D6    jl          0042D7F2
 0042D7D8    inc         ebx
 0042D7D9    lea         eax,[ebp-2FC]
 0042D7DF    lea         edx,[ebp-100]
 0042D7E5    mov         ecx,dword ptr [eax]
 0042D7E7    mov         dword ptr [edx],ecx
 0042D7E9    add         edx,4
 0042D7EC    add         eax,8
 0042D7EF    dec         ebx
>0042D7F0    jne         0042D7E5
 0042D7F2    push        ebp
 0042D7F3    mov         ebx,dword ptr [ebp-310]
 0042D7F9    dec         ebx
 0042D7FA    mov         eax,ebx
 0042D7FC    call        InBounds
 0042D801    pop         ecx
 0042D802    test        al,al
>0042D804    je          0042D852
 0042D806    lea         eax,[ebp-318]
 0042D80C    push        eax
 0042D80D    lea         eax,[ebp-100]
 0042D813    push        eax
 0042D814    mov         eax,dword ptr [ebp-314]
 0042D81A    push        eax
 0042D81B    call        oleaut32.SafeArrayPtrOfIndex
 0042D820    call        VarResultCheck
 0042D825    lea         eax,[ebp-31C]
 0042D82B    push        eax
 0042D82C    lea         eax,[ebp-100]
 0042D832    push        eax
 0042D833    push        esi
 0042D834    call        oleaut32.SafeArrayPtrOfIndex
 0042D839    call        VarResultCheck
 0042D83E    mov         eax,dword ptr [ebp-318]
 0042D844    mov         edx,eax
 0042D846    mov         eax,dword ptr [ebp-31C]
 0042D84C    call        dword ptr [ebp-308]
 0042D852    push        ebp
 0042D853    mov         eax,ebx
 0042D855    call        Increment
 0042D85A    pop         ecx
 0042D85B    test        al,al
>0042D85D    jne         0042D7F2
>0042D85F    jmp         0042D873
 0042D861    push        ebx
 0042D862    mov         eax,dword ptr [ebp-304]
 0042D868    push        eax
 0042D869    call        oleaut32.VariantCopy
 0042D86E    call        VarResultCheck
 0042D873    pop         edi
 0042D874    pop         esi
 0042D875    pop         ebx
 0042D876    mov         esp,ebp
 0042D878    pop         ebp
 0042D879    ret
*}
end;

//0042D87C
procedure VarCopyCopyProc(var Dest:TVarData; const Src:TVarData);
begin
{*
 0042D87C    call        @VarCopy
 0042D881    ret
*}
end;

//0042D884
procedure VarCopyDeep(var Dest:TVarData; const Source:TVarData);
begin
{*
 0042D884    push        ebx
 0042D885    push        esi
 0042D886    push        edi
 0042D887    push        ecx
 0042D888    mov         esi,edx
 0042D88A    mov         ebx,eax
 0042D88C    test        word ptr [ebx],0BFE8
>0042D891    je          0042D89A
 0042D893    mov         eax,ebx
 0042D895    call        VarClearDeep
 0042D89A    movzx       eax,word ptr [esi]
 0042D89D    cmp         ax,14
>0042D8A1    jae         0042D8B4
 0042D8A3    push        esi
 0042D8A4    push        ebx
 0042D8A5    call        oleaut32.VariantCopy
 0042D8AA    call        VarResultCheck
>0042D8AF    jmp         0042D968
 0042D8B4    cmp         ax,100
>0042D8B8    jne         0042D8D4
 0042D8BA    mov         word ptr [ebx],100
 0042D8BF    xor         eax,eax
 0042D8C1    mov         dword ptr [ebx+8],eax
 0042D8C4    lea         eax,[ebx+8]
 0042D8C7    mov         edx,dword ptr [esi+8]
 0042D8CA    call        @LStrAsg
>0042D8CF    jmp         0042D968
 0042D8D4    cmp         ax,102
>0042D8D8    jne         0042D8F1
 0042D8DA    mov         word ptr [ebx],102
 0042D8DF    xor         eax,eax
 0042D8E1    mov         dword ptr [ebx+8],eax
 0042D8E4    lea         eax,[ebx+8]
 0042D8E7    mov         edx,dword ptr [esi+8]
 0042D8EA    call        @UStrAsg
>0042D8EF    jmp         0042D968
 0042D8F1    movzx       edi,word ptr [esi]
 0042D8F4    cmp         di,4102
>0042D8F9    je          0042D902
 0042D8FB    cmp         di,4100
>0042D900    jne         0042D90D
 0042D902    mov         word ptr [ebx],di
 0042D905    mov         eax,dword ptr [esi+8]
 0042D908    mov         dword ptr [ebx+8],eax
>0042D90B    jmp         0042D968
 0042D90D    cmp         di,101
>0042D912    jne         0042D927
 0042D914    mov         word ptr [ebx],di
 0042D917    mov         eax,dword ptr [esi+8]
 0042D91A    mov         dword ptr [ebx+8],eax
 0042D91D    mov         eax,ebx
 0042D91F    call        dword ptr ds:[792F94]
>0042D925    jmp         0042D968
 0042D927    test        di,2000
>0042D92C    je          0042D93E
 0042D92E    mov         ecx,42D87C;VarCopyCopyProc
 0042D933    mov         edx,esi
 0042D935    mov         eax,ebx
 0042D937    call        VarArrayCopyForEach
>0042D93C    jmp         0042D968
 0042D93E    mov         edx,esp
 0042D940    mov         eax,edi
 0042D942    call        FindCustomVariantType
 0042D947    test        al,al
>0042D949    je          0042D95C
 0042D94B    push        0
 0042D94D    mov         ecx,esi
 0042D94F    mov         edx,ebx
 0042D951    mov         eax,dword ptr [esp+4]
 0042D955    mov         ebx,dword ptr [eax]
 0042D957    call        dword ptr [ebx+28]
>0042D95A    jmp         0042D968
 0042D95C    push        esi
 0042D95D    push        ebx
 0042D95E    call        oleaut32.VariantCopy
 0042D963    call        VarResultCheck
 0042D968    pop         edx
 0042D969    pop         edi
 0042D96A    pop         esi
 0042D96B    pop         ebx
 0042D96C    ret
*}
end;

//0042D970
procedure @VarCopy(var Dest:TVarData; const Source:TVarData);
begin
{*
 0042D970    push        ebx
 0042D971    push        esi
 0042D972    mov         ebx,edx
 0042D974    mov         esi,eax
 0042D976    cmp         esi,ebx
>0042D978    je          0042D9B0
 0042D97A    test        word ptr [ebx],0BFE8
>0042D97F    jne         0042D9A7
 0042D981    test        word ptr [esi],0BFE8
>0042D986    je          0042D98F
 0042D988    mov         eax,esi
 0042D98A    call        VarClearDeep
 0042D98F    mov         eax,dword ptr [ebx]
 0042D991    mov         dword ptr [esi],eax
 0042D993    mov         eax,dword ptr [ebx+4]
 0042D996    mov         dword ptr [esi+4],eax
 0042D999    mov         eax,dword ptr [ebx+8]
 0042D99C    mov         dword ptr [esi+8],eax
 0042D99F    mov         eax,dword ptr [ebx+0C]
 0042D9A2    mov         dword ptr [esi+0C],eax
>0042D9A5    jmp         0042D9B0
 0042D9A7    mov         edx,ebx
 0042D9A9    mov         eax,esi
 0042D9AB    call        VarCopyDeep
 0042D9B0    pop         esi
 0042D9B1    pop         ebx
 0042D9B2    ret
*}
end;

//0042D9B4
procedure VarCopyNoIndViaOS(var Dest:TVarData; const Source:TVarData);
begin
{*
 0042D9B4    push        ebx
 0042D9B5    push        esi
 0042D9B6    mov         esi,edx
 0042D9B8    mov         ebx,eax
 0042D9BA    cmp         ebx,esi
>0042D9BC    je          0042D9C5
 0042D9BE    mov         eax,ebx
 0042D9C0    call        @VarClear
 0042D9C5    push        esi
 0042D9C6    push        ebx
 0042D9C7    call        oleaut32.VariantCopyInd
 0042D9CC    call        VarResultCheck
 0042D9D1    pop         esi
 0042D9D2    pop         ebx
 0042D9D3    ret
*}
end;

//0042D9D4
function VarCopyNoIndOleStr(const V:TVarData):WideString;
begin
{*
 0042D9D4    xchg        eax,edx
 0042D9D5    call        @VarToWStr
 0042D9DA    ret
*}
end;

//0042D9DC
procedure VarCopyNoIndCopyProc(var Dest:TVarData; const Source:TVarData);
begin
{*
 0042D9DC    call        @VarCopyNoInd
 0042D9E1    ret
*}
end;

//0042D9E4
procedure VarCopyNoIndDeep(var Dest:TVarData; const Source:TVarData);
begin
{*
 0042D9E4    push        ebx
 0042D9E5    push        esi
 0042D9E6    push        ecx
 0042D9E7    mov         ebx,edx
 0042D9E9    mov         esi,eax
 0042D9EB    mov         edx,esp
 0042D9ED    movzx       eax,word ptr [ebx]
 0042D9F0    call        FindCustomVariantType
 0042D9F5    test        al,al
>0042D9F7    je          0042DA0A
 0042D9F9    push        1
 0042D9FB    mov         ecx,ebx
 0042D9FD    mov         edx,esi
 0042D9FF    mov         eax,dword ptr [esp+4]
 0042DA03    mov         ebx,dword ptr [eax]
 0042DA05    call        dword ptr [ebx+28]
>0042DA08    jmp         0042DA13
 0042DA0A    mov         edx,ebx
 0042DA0C    mov         eax,esi
 0042DA0E    call        VarCopyNoIndViaOS
 0042DA13    pop         edx
 0042DA14    pop         esi
 0042DA15    pop         ebx
 0042DA16    ret
*}
end;

//0042DA18
procedure VarCopyByRef(var Dest:TVarData; const Source:TVarData);
begin
{*
 0042DA18    push        ebp
 0042DA19    mov         ebp,esp
 0042DA1B    push        0
 0042DA1D    push        ebx
 0042DA1E    push        esi
 0042DA1F    mov         ebx,edx
 0042DA21    mov         esi,eax
 0042DA23    xor         eax,eax
 0042DA25    push        ebp
 0042DA26    push        42DBFB
 0042DA2B    push        dword ptr fs:[eax]
 0042DA2E    mov         dword ptr fs:[eax],esp
 0042DA31    movzx       eax,word ptr [ebx]
 0042DA34    movzx       edx,ax
 0042DA37    and         edx,0FFFFBFFF
 0042DA3D    cmp         edx,15
>0042DA40    ja          0042DBC7
 0042DA46    jmp         dword ptr [edx*4+42DA4D]
 0042DA46    dd          0042DBC7
 0042DA46    dd          0042DBC7
 0042DA46    dd          0042DAA5
 0042DA46    dd          0042DAB9
 0042DA46    dd          0042DACC
 0042DA46    dd          0042DADD
 0042DA46    dd          0042DAEE
 0042DA46    dd          0042DAFF
 0042DA46    dd          0042DB10
 0042DA46    dd          0042DBBC
 0042DA46    dd          0042DBC7
 0042DA46    dd          0042DB29
 0042DA46    dd          0042DBAE
 0042DA46    dd          0042DBBC
 0042DA46    dd          0042DBC7
 0042DA46    dd          0042DBC7
 0042DA46    dd          0042DB42
 0042DA46    dd          0042DB56
 0042DA46    dd          0042DB67
 0042DA46    dd          0042DB78
 0042DA46    dd          0042DB88
 0042DA46    dd          0042DB9B
 0042DAA5    mov         eax,esi
 0042DAA7    mov         edx,dword ptr [ebx+8]
 0042DAAA    movsx       edx,word ptr [edx]
 0042DAAD    mov         cl,0FE
 0042DAAF    call        @VarFromInt
>0042DAB4    jmp         0042DBE5
 0042DAB9    mov         eax,esi
 0042DABB    mov         edx,dword ptr [ebx+8]
 0042DABE    mov         edx,dword ptr [edx]
 0042DAC0    mov         cl,0FC
 0042DAC2    call        @VarFromInt
>0042DAC7    jmp         0042DBE5
 0042DACC    mov         eax,dword ptr [ebx+8]
 0042DACF    fld         dword ptr [eax]
 0042DAD1    mov         eax,esi
 0042DAD3    call        @VarFromReal
>0042DAD8    jmp         0042DBE5
 0042DADD    mov         eax,dword ptr [ebx+8]
 0042DAE0    fld         qword ptr [eax]
 0042DAE2    mov         eax,esi
 0042DAE4    call        @VarFromReal
>0042DAE9    jmp         0042DBE5
 0042DAEE    mov         eax,dword ptr [ebx+8]
 0042DAF1    fild        qword ptr [eax]
 0042DAF3    mov         eax,esi
 0042DAF5    call        @VarFromCurr
>0042DAFA    jmp         0042DBE5
 0042DAFF    mov         eax,dword ptr [ebx+8]
 0042DB02    fld         qword ptr [eax]
 0042DB04    mov         eax,esi
 0042DB06    call        @VarFromReal
>0042DB0B    jmp         0042DBE5
 0042DB10    lea         edx,[ebp-4]
 0042DB13    mov         eax,ebx
 0042DB15    call        VarCopyNoIndOleStr
 0042DB1A    mov         edx,dword ptr [ebp-4]
 0042DB1D    mov         eax,esi
 0042DB1F    call        @VarFromWStr
>0042DB24    jmp         0042DBE5
 0042DB29    mov         eax,esi
 0042DB2B    mov         edx,dword ptr [ebx+8]
 0042DB2E    movzx       edx,word ptr [edx]
 0042DB31    neg         dx
 0042DB34    sbb         edx,edx
 0042DB36    neg         edx
 0042DB38    call        @VarFromBool
>0042DB3D    jmp         0042DBE5
 0042DB42    mov         eax,esi
 0042DB44    mov         edx,dword ptr [ebx+8]
 0042DB47    movsx       edx,byte ptr [edx]
 0042DB4A    mov         cl,0FF
 0042DB4C    call        @VarFromInt
>0042DB51    jmp         0042DBE5
 0042DB56    mov         eax,esi
 0042DB58    mov         edx,dword ptr [ebx+8]
 0042DB5B    movzx       edx,byte ptr [edx]
 0042DB5E    mov         cl,1
 0042DB60    call        @VarFromInt
>0042DB65    jmp         0042DBE5
 0042DB67    mov         eax,esi
 0042DB69    mov         edx,dword ptr [ebx+8]
 0042DB6C    movzx       edx,word ptr [edx]
 0042DB6F    mov         cl,2
 0042DB71    call        @VarFromInt
>0042DB76    jmp         0042DBE5
 0042DB78    mov         eax,esi
 0042DB7A    mov         edx,dword ptr [ebx+8]
 0042DB7D    mov         edx,dword ptr [edx]
 0042DB7F    mov         cl,4
 0042DB81    call        @VarFromInt
>0042DB86    jmp         0042DBE5
 0042DB88    mov         eax,dword ptr [ebx+8]
 0042DB8B    mov         edx,dword ptr [eax+4]
 0042DB8E    mov         eax,dword ptr [eax]
 0042DB90    push        edx
 0042DB91    push        eax
 0042DB92    mov         eax,esi
 0042DB94    call        @VarFromInt64
>0042DB99    jmp         0042DBE5
 0042DB9B    mov         eax,dword ptr [ebx+8]
 0042DB9E    mov         edx,dword ptr [eax+4]
 0042DBA1    mov         eax,dword ptr [eax]
 0042DBA3    push        edx
 0042DBA4    push        eax
 0042DBA5    mov         eax,esi
 0042DBA7    call        @VarFromUInt64
>0042DBAC    jmp         0042DBE5
 0042DBAE    mov         eax,dword ptr [ebx+8]
 0042DBB1    mov         edx,eax
 0042DBB3    mov         eax,esi
 0042DBB5    call        @VarCopyNoInd
>0042DBBA    jmp         0042DBE5
 0042DBBC    mov         edx,ebx
 0042DBBE    mov         eax,esi
 0042DBC0    call        VarCopyNoIndViaOS
>0042DBC5    jmp         0042DBE5
 0042DBC7    test        ah,20
>0042DBCA    je          0042DBDC
 0042DBCC    mov         ecx,42D9DC;VarCopyNoIndCopyProc
 0042DBD1    mov         edx,ebx
 0042DBD3    mov         eax,esi
 0042DBD5    call        VarArrayCopyForEach
>0042DBDA    jmp         0042DBE5
 0042DBDC    mov         edx,ebx
 0042DBDE    mov         eax,esi
 0042DBE0    call        VarCopyNoIndDeep
 0042DBE5    xor         eax,eax
 0042DBE7    pop         edx
 0042DBE8    pop         ecx
 0042DBE9    pop         ecx
 0042DBEA    mov         dword ptr fs:[eax],edx
 0042DBED    push        42DC02
 0042DBF2    lea         eax,[ebp-4]
 0042DBF5    call        @WStrClr
 0042DBFA    ret
>0042DBFB    jmp         @HandleFinally
>0042DC00    jmp         0042DBF2
 0042DC02    pop         esi
 0042DC03    pop         ebx
 0042DC04    pop         ecx
 0042DC05    pop         ebp
 0042DC06    ret
*}
end;

//0042DC08
procedure @VarCopyNoInd(var Dest:TVarData; const Source:TVarData);
begin
{*
 0042DC08    test        byte ptr [edx+1],40
>0042DC0C    jne         0042DC14
 0042DC0E    call        @VarCopy
 0042DC13    ret
 0042DC14    call        VarCopyByRef
 0042DC19    ret
*}
end;

//0042DC1C
procedure VarCastAsAny(var Dest:TVarData; const Source:TVarData; ADestType:TVarType);
begin
{*
 0042DC1C    push        ebp
 0042DC1D    mov         ebp,esp
 0042DC1F    add         esp,0FFFFFFF0
 0042DC22    push        ebx
 0042DC23    push        esi
 0042DC24    push        edi
 0042DC25    mov         edi,ecx
 0042DC27    mov         esi,edx
 0042DC29    mov         ebx,eax
 0042DC2B    lea         eax,[ebp-10]
 0042DC2E    push        eax
 0042DC2F    call        oleaut32.VariantInit
 0042DC34    xor         eax,eax
 0042DC36    push        ebp
 0042DC37    push        42DC78
 0042DC3C    push        dword ptr fs:[eax]
 0042DC3F    mov         dword ptr fs:[eax],esp
 0042DC42    mov         edx,esi
 0042DC44    lea         eax,[ebp-10]
 0042DC47    call        @VarCopy
 0042DC4C    lea         eax,[ebp-10]
 0042DC4F    call        dword ptr ds:[792F90]
 0042DC55    movzx       ecx,di
 0042DC58    lea         edx,[ebp-10]
 0042DC5B    mov         eax,ebx
 0042DC5D    call        @VarCast
 0042DC62    xor         eax,eax
 0042DC64    pop         edx
 0042DC65    pop         ecx
 0042DC66    pop         ecx
 0042DC67    mov         dword ptr fs:[eax],edx
 0042DC6A    push        42DC7F
 0042DC6F    lea         eax,[ebp-10]
 0042DC72    call        @VarClear
 0042DC77    ret
>0042DC78    jmp         @HandleFinally
>0042DC7D    jmp         0042DC6F
 0042DC7F    pop         edi
 0042DC80    pop         esi
 0042DC81    pop         ebx
 0042DC82    mov         esp,ebp
 0042DC84    pop         ebp
 0042DC85    ret
*}
end;

//0042DC88
procedure VarCastAsOleStr(var Dest:TVarData; const Source:TVarData);
begin
{*
 0042DC88    push        ebp
 0042DC89    mov         ebp,esp
 0042DC8B    push        0
 0042DC8D    push        ebx
 0042DC8E    mov         ebx,eax
 0042DC90    xor         eax,eax
 0042DC92    push        ebp
 0042DC93    push        42DCC6
 0042DC98    push        dword ptr fs:[eax]
 0042DC9B    mov         dword ptr fs:[eax],esp
 0042DC9E    lea         eax,[ebp-4]
 0042DCA1    call        @VarToWStr
 0042DCA6    mov         eax,ebx
 0042DCA8    mov         edx,dword ptr [ebp-4]
 0042DCAB    call        @VarFromWStr
 0042DCB0    xor         eax,eax
 0042DCB2    pop         edx
 0042DCB3    pop         ecx
 0042DCB4    pop         ecx
 0042DCB5    mov         dword ptr fs:[eax],edx
 0042DCB8    push        42DCCD
 0042DCBD    lea         eax,[ebp-4]
 0042DCC0    call        @WStrClr
 0042DCC5    ret
>0042DCC6    jmp         @HandleFinally
>0042DCCB    jmp         0042DCBD
 0042DCCD    pop         ebx
 0042DCCE    pop         ecx
 0042DCCF    pop         ebp
 0042DCD0    ret
*}
end;

//0042DCD4
procedure VarCastAsString(var Dest:TVarData; const Source:TVarData);
begin
{*
 0042DCD4    push        ebp
 0042DCD5    mov         ebp,esp
 0042DCD7    push        0
 0042DCD9    push        ebx
 0042DCDA    mov         ebx,eax
 0042DCDC    xor         eax,eax
 0042DCDE    push        ebp
 0042DCDF    push        42DD12
 0042DCE4    push        dword ptr fs:[eax]
 0042DCE7    mov         dword ptr fs:[eax],esp
 0042DCEA    lea         eax,[ebp-4]
 0042DCED    call        @VarToLStr
 0042DCF2    mov         eax,ebx
 0042DCF4    mov         edx,dword ptr [ebp-4]
 0042DCF7    call        @VarFromLStr
 0042DCFC    xor         eax,eax
 0042DCFE    pop         edx
 0042DCFF    pop         ecx
 0042DD00    pop         ecx
 0042DD01    mov         dword ptr fs:[eax],edx
 0042DD04    push        42DD19
 0042DD09    lea         eax,[ebp-4]
 0042DD0C    call        @LStrClr
 0042DD11    ret
>0042DD12    jmp         @HandleFinally
>0042DD17    jmp         0042DD09
 0042DD19    pop         ebx
 0042DD1A    pop         ecx
 0042DD1B    pop         ebp
 0042DD1C    ret
*}
end;

//0042DD20
procedure VarCastAsUString(var Dest:TVarData; const Source:TVarData);
begin
{*
 0042DD20    push        ebp
 0042DD21    mov         ebp,esp
 0042DD23    push        0
 0042DD25    push        ebx
 0042DD26    mov         ebx,eax
 0042DD28    xor         eax,eax
 0042DD2A    push        ebp
 0042DD2B    push        42DD5E
 0042DD30    push        dword ptr fs:[eax]
 0042DD33    mov         dword ptr fs:[eax],esp
 0042DD36    lea         eax,[ebp-4]
 0042DD39    call        @VarToUStr
 0042DD3E    mov         eax,ebx
 0042DD40    mov         edx,dword ptr [ebp-4]
 0042DD43    call        @VarFromUStr
 0042DD48    xor         eax,eax
 0042DD4A    pop         edx
 0042DD4B    pop         ecx
 0042DD4C    pop         ecx
 0042DD4D    mov         dword ptr fs:[eax],edx
 0042DD50    push        42DD65
 0042DD55    lea         eax,[ebp-4]
 0042DD58    call        @UStrClr
 0042DD5D    ret
>0042DD5E    jmp         @HandleFinally
>0042DD63    jmp         0042DD55
 0042DD65    pop         ebx
 0042DD66    pop         ecx
 0042DD67    pop         ebp
 0042DD68    ret
*}
end;

//0042DD6C
procedure VarCastAsDispatch(var Dest:TVarData; const Source:TVarData);
begin
{*
 0042DD6C    push        ebp
 0042DD6D    mov         ebp,esp
 0042DD6F    push        0
 0042DD71    push        ebx
 0042DD72    mov         ebx,eax
 0042DD74    xor         eax,eax
 0042DD76    push        ebp
 0042DD77    push        42DDAA
 0042DD7C    push        dword ptr fs:[eax]
 0042DD7F    mov         dword ptr fs:[eax],esp
 0042DD82    lea         eax,[ebp-4]
 0042DD85    call        @VarToDisp
 0042DD8A    mov         eax,ebx
 0042DD8C    mov         edx,dword ptr [ebp-4]
 0042DD8F    call        @VarFromDisp
 0042DD94    xor         eax,eax
 0042DD96    pop         edx
 0042DD97    pop         ecx
 0042DD98    pop         ecx
 0042DD99    mov         dword ptr fs:[eax],edx
 0042DD9C    push        42DDB1
 0042DDA1    lea         eax,[ebp-4]
 0042DDA4    call        @IntfClear
 0042DDA9    ret
>0042DDAA    jmp         @HandleFinally
>0042DDAF    jmp         0042DDA1
 0042DDB1    pop         ebx
 0042DDB2    pop         ecx
 0042DDB3    pop         ebp
 0042DDB4    ret
*}
end;

//0042DDB8
procedure VarCastAsInterface(var Dest:TVarData; const Source:TVarData);
begin
{*
 0042DDB8    push        ebp
 0042DDB9    mov         ebp,esp
 0042DDBB    push        0
 0042DDBD    push        ebx
 0042DDBE    mov         ebx,eax
 0042DDC0    xor         eax,eax
 0042DDC2    push        ebp
 0042DDC3    push        42DDF6
 0042DDC8    push        dword ptr fs:[eax]
 0042DDCB    mov         dword ptr fs:[eax],esp
 0042DDCE    lea         eax,[ebp-4]
 0042DDD1    call        @VarToIntf
 0042DDD6    mov         eax,ebx
 0042DDD8    mov         edx,dword ptr [ebp-4]
 0042DDDB    call        @VarFromIntf
 0042DDE0    xor         eax,eax
 0042DDE2    pop         edx
 0042DDE3    pop         ecx
 0042DDE4    pop         ecx
 0042DDE5    mov         dword ptr fs:[eax],edx
 0042DDE8    push        42DDFD
 0042DDED    lea         eax,[ebp-4]
 0042DDF0    call        @IntfClear
 0042DDF5    ret
>0042DDF6    jmp         @HandleFinally
>0042DDFB    jmp         0042DDED
 0042DDFD    pop         ebx
 0042DDFE    pop         ecx
 0042DDFF    pop         ebp
 0042DE00    ret
*}
end;

//0042DE04
procedure VarCastViaOS(var Dest:TVarData; const Source:TVarData; ADestType:TVarType);
begin
{*
 0042DE04    push        ebx
 0042DE05    push        esi
 0042DE06    push        edi
 0042DE07    mov         esi,ecx
 0042DE09    mov         ebx,edx
 0042DE0B    mov         edi,eax
 0042DE0D    movzx       eax,word ptr [ebx]
 0042DE10    mov         edx,eax
 0042DE12    and         dx,0FFF
 0042DE17    cmp         dx,14
>0042DE1B    jb          0042DE4A
 0042DE1D    mov         edx,ebx
 0042DE1F    mov         eax,edi
 0042DE21    mov         ecx,8
 0042DE26    call        @VarCast
 0042DE2B    push        esi
 0042DE2C    push        0
 0042DE2E    push        400
 0042DE33    push        edi
 0042DE34    push        edi
 0042DE35    mov         eax,[0078D834];^gvar_00792F18
 0042DE3A    mov         eax,dword ptr [eax]
 0042DE3C    call        eax
 0042DE3E    movzx       edx,word ptr [ebx]
 0042DE41    mov         ecx,esi
 0042DE43    call        VarResultCheck
>0042DE48    jmp         0042DE7D
 0042DE4A    mov         edx,esi
 0042DE4C    and         dx,0FFF
 0042DE51    cmp         dx,14
>0042DE55    jae         0042DE76
 0042DE57    push        esi
 0042DE58    push        0
 0042DE5A    push        400
 0042DE5F    push        ebx
 0042DE60    push        edi
 0042DE61    mov         eax,[0078D834];^gvar_00792F18
 0042DE66    mov         eax,dword ptr [eax]
 0042DE68    call        eax
 0042DE6A    movzx       edx,word ptr [ebx]
 0042DE6D    mov         ecx,esi
 0042DE6F    call        VarResultCheck
>0042DE74    jmp         0042DE7D
 0042DE76    mov         edx,esi
 0042DE78    call        VarCastError
 0042DE7D    pop         edi
 0042DE7E    pop         esi
 0042DE7F    pop         ebx
 0042DE80    ret
*}
end;

//0042DE84
procedure VarCastRare(var Dest:TVarData; const Source:TVarData; ADestType:TVarType);
begin
{*
 0042DE84    push        ebx
 0042DE85    push        esi
 0042DE86    push        edi
 0042DE87    push        ebp
 0042DE88    push        ecx
 0042DE89    mov         esi,ecx
 0042DE8B    mov         ebx,edx
 0042DE8D    mov         edi,eax
 0042DE8F    movzx       ebp,word ptr [ebx]
 0042DE92    cmp         bp,101
>0042DE97    jne         0042DEA6
 0042DE99    mov         edx,ebx
 0042DE9B    mov         eax,edi
 0042DE9D    mov         ecx,esi
 0042DE9F    call        VarCastAsAny
>0042DEA4    jmp         0042DEE9
 0042DEA6    mov         edx,esp
 0042DEA8    mov         eax,ebp
 0042DEAA    call        FindCustomVariantType
 0042DEAF    test        al,al
>0042DEB1    je          0042DEC3
 0042DEB3    push        esi
 0042DEB4    mov         ecx,ebx
 0042DEB6    mov         edx,edi
 0042DEB8    mov         eax,dword ptr [esp+4]
 0042DEBC    mov         ebx,dword ptr [eax]
 0042DEBE    call        dword ptr [ebx+1C]
>0042DEC1    jmp         0042DEE9
 0042DEC3    mov         edx,esp
 0042DEC5    mov         eax,esi
 0042DEC7    call        FindCustomVariantType
 0042DECC    test        al,al
>0042DECE    je          0042DEDE
 0042DED0    mov         ecx,ebx
 0042DED2    mov         edx,edi
 0042DED4    mov         eax,dword ptr [esp]
 0042DED7    mov         ebx,dword ptr [eax]
 0042DED9    call        dword ptr [ebx+18]
>0042DEDC    jmp         0042DEE9
 0042DEDE    mov         edx,ebx
 0042DEE0    mov         eax,edi
 0042DEE2    mov         ecx,esi
 0042DEE4    call        VarCastViaOS
 0042DEE9    pop         edx
 0042DEEA    pop         ebp
 0042DEEB    pop         edi
 0042DEEC    pop         esi
 0042DEED    pop         ebx
 0042DEEE    ret
*}
end;

//0042DEF0
procedure @VarCast(var Dest:TVarData; const Source:TVarData; AVarType:Integer);
begin
{*
 0042DEF0    push        ebx
 0042DEF1    push        esi
 0042DEF2    mov         ebx,edx
 0042DEF4    mov         esi,eax
 0042DEF6    movzx       eax,word ptr [ebx]
 0042DEF9    movzx       edx,ax
 0042DEFC    cmp         ecx,edx
>0042DEFE    jne         0042DF0C
 0042DF00    mov         edx,ebx
 0042DF02    mov         eax,esi
 0042DF04    call        @VarCopy
 0042DF09    pop         esi
 0042DF0A    pop         ebx
 0042DF0B    ret
 0042DF0C    cmp         ax,400C
>0042DF10    jne         0042DF23
 0042DF12    mov         eax,dword ptr [ebx+8]
 0042DF15    mov         edx,eax
 0042DF17    mov         eax,esi
 0042DF19    call        @VarCast
>0042DF1E    jmp         0042E140
 0042DF23    mov         edx,ecx
 0042DF25    cmp         edx,15
>0042DF28    ja          0042E104
 0042DF2E    jmp         dword ptr [edx*4+42DF35]
 0042DF2E    dd          0042DF8D
 0042DF2E    dd          0042DFB8
 0042DF2E    dd          0042DFC4
 0042DF2E    dd          0042DFD9
 0042DF2E    dd          0042DFEE
 0042DF2E    dd          0042E008
 0042DF2E    dd          0042E022
 0042DF2E    dd          0042E03C
 0042DF2E    dd          0042E056
 0042DF2E    dd          0042E0EE
 0042DF2E    dd          0042E104
 0042DF2E    dd          0042E064
 0042DF2E    dd          0042E104
 0042DF2E    dd          0042E0F9
 0042DF2E    dd          0042E104
 0042DF2E    dd          0042E104
 0042DF2E    dd          0042E079
 0042DF2E    dd          0042E08E
 0042DF2E    dd          0042E0A3
 0042DF2E    dd          0042E0B8
 0042DF2E    dd          0042E0CA
 0042DF2E    dd          0042E0DC
 0042DF8D    cmp         word ptr [ebx],1
>0042DF91    jne         0042DFAC
 0042DF93    cmp         byte ptr ds:[784E6A],0
>0042DF9A    je          0042DFAC
 0042DF9C    xor         edx,edx
 0042DF9E    mov         ax,1
 0042DFA2    call        VarCastError
>0042DFA7    jmp         0042E140
 0042DFAC    mov         eax,esi
 0042DFAE    call        @VarClear
>0042DFB3    jmp         0042E140
 0042DFB8    mov         eax,esi
 0042DFBA    call        @VarNull
>0042DFBF    jmp         0042E140
 0042DFC4    mov         eax,ebx
 0042DFC6    call        @VarToSmallInt
 0042DFCB    mov         edx,eax
 0042DFCD    mov         eax,esi
 0042DFCF    call        @VarFromSmallInt
>0042DFD4    jmp         0042E140
 0042DFD9    mov         eax,ebx
 0042DFDB    call        @VarToInteger
 0042DFE0    mov         edx,eax
 0042DFE2    mov         eax,esi
 0042DFE4    call        @VarFromInteger
>0042DFE9    jmp         0042E140
 0042DFEE    mov         eax,ebx
 0042DFF0    call        @VarToSingle
 0042DFF5    add         esp,0FFFFFFFC
 0042DFF8    fstp        dword ptr [esp]
 0042DFFB    wait
 0042DFFC    mov         eax,esi
 0042DFFE    call        @VarFromSingle
>0042E003    jmp         0042E140
 0042E008    mov         eax,ebx
 0042E00A    call        @VarToDouble
 0042E00F    add         esp,0FFFFFFF8
 0042E012    fstp        qword ptr [esp]
 0042E015    wait
 0042E016    mov         eax,esi
 0042E018    call        @VarFromDouble
>0042E01D    jmp         0042E140
 0042E022    mov         eax,ebx
 0042E024    call        @VarToCurrency
 0042E029    add         esp,0FFFFFFF8
 0042E02C    fistp       qword ptr [esp]
 0042E02F    wait
 0042E030    mov         eax,esi
 0042E032    call        @VarFromCurrency
>0042E037    jmp         0042E140
 0042E03C    mov         eax,ebx
 0042E03E    call        @VarToDate
 0042E043    add         esp,0FFFFFFF8
 0042E046    fstp        qword ptr [esp]
 0042E049    wait
 0042E04A    mov         eax,esi
 0042E04C    call        @VarFromDate
>0042E051    jmp         0042E140
 0042E056    mov         edx,ebx
 0042E058    mov         eax,esi
 0042E05A    call        VarCastAsOleStr
>0042E05F    jmp         0042E140
 0042E064    mov         eax,ebx
 0042E066    call        @VarToBoolean
 0042E06B    mov         edx,eax
 0042E06D    mov         eax,esi
 0042E06F    call        @VarFromBool
>0042E074    jmp         0042E140
 0042E079    mov         eax,ebx
 0042E07B    call        @VarToShortInt
 0042E080    mov         edx,eax
 0042E082    mov         eax,esi
 0042E084    call        @VarFromShortInt
>0042E089    jmp         0042E140
 0042E08E    mov         eax,ebx
 0042E090    call        @VarToByte
 0042E095    mov         edx,eax
 0042E097    mov         eax,esi
 0042E099    call        @VarFromByte
>0042E09E    jmp         0042E140
 0042E0A3    mov         eax,ebx
 0042E0A5    call        @VarToWord
 0042E0AA    mov         edx,eax
 0042E0AC    mov         eax,esi
 0042E0AE    call        @VarFromWord
>0042E0B3    jmp         0042E140
 0042E0B8    mov         eax,ebx
 0042E0BA    call        @VarToLongWord
 0042E0BF    mov         edx,eax
 0042E0C1    mov         eax,esi
 0042E0C3    call        @VarFromLongWord
>0042E0C8    jmp         0042E140
 0042E0CA    mov         eax,ebx
 0042E0CC    call        @VarToInt64
 0042E0D1    push        edx
 0042E0D2    push        eax
 0042E0D3    mov         eax,esi
 0042E0D5    call        @VarFromInt64
>0042E0DA    jmp         0042E140
 0042E0DC    mov         eax,ebx
 0042E0DE    call        @VarToUInt64
 0042E0E3    push        edx
 0042E0E4    push        eax
 0042E0E5    mov         eax,esi
 0042E0E7    call        @VarFromUInt64
>0042E0EC    jmp         0042E140
 0042E0EE    mov         edx,ebx
 0042E0F0    mov         eax,esi
 0042E0F2    call        VarCastAsDispatch
>0042E0F7    jmp         0042E140
 0042E0F9    mov         edx,ebx
 0042E0FB    mov         eax,esi
 0042E0FD    call        VarCastAsInterface
>0042E102    jmp         0042E140
 0042E104    mov         edx,ecx
 0042E106    sub         edx,100
>0042E10C    je          0042E116
 0042E10E    dec         edx
>0042E10F    je          0042E12C
 0042E111    dec         edx
>0042E112    je          0042E121
>0042E114    jmp         0042E137
 0042E116    mov         edx,ebx
 0042E118    mov         eax,esi
 0042E11A    call        VarCastAsString
>0042E11F    jmp         0042E140
 0042E121    mov         edx,ebx
 0042E123    mov         eax,esi
 0042E125    call        VarCastAsUString
>0042E12A    jmp         0042E140
 0042E12C    mov         dx,101
 0042E130    call        VarCastError
>0042E135    jmp         0042E140
 0042E137    mov         edx,ebx
 0042E139    mov         eax,esi
 0042E13B    call        VarCastRare
 0042E140    pop         esi
 0042E141    pop         ebx
 0042E142    ret
*}
end;

//0042E144
function VarToIntAsString(const V:TVarData):Integer;
begin
{*
 0042E144    push        ebp
 0042E145    mov         ebp,esp
 0042E147    push        0
 0042E149    push        0
 0042E14B    push        0
 0042E14D    push        ebx
 0042E14E    mov         ebx,eax
 0042E150    xor         eax,eax
 0042E152    push        ebp
 0042E153    push        42E1E7
 0042E158    push        dword ptr fs:[eax]
 0042E15B    mov         dword ptr fs:[eax],esp
 0042E15E    mov         edx,ebx
 0042E160    lea         eax,[ebp-4]
 0042E163    call        @VarToWStr
 0042E168    lea         eax,[ebp-8]
 0042E16B    push        eax
 0042E16C    push        0
 0042E16E    push        400
 0042E173    mov         eax,dword ptr [ebp-4]
 0042E176    push        eax
 0042E177    mov         eax,[0078DAA0];^gvar_00792F4C
 0042E17C    mov         eax,dword ptr [eax]
 0042E17E    call        eax
 0042E180    mov         edx,eax
 0042E182    sub         edx,80020005
>0042E188    je          0042E194
 0042E18A    sub         edx,7FFDFFFB
>0042E190    jne         0042E1BD
>0042E192    jmp         0042E1C9
 0042E194    lea         eax,[ebp-0C]
 0042E197    mov         edx,dword ptr [ebp-4]
 0042E19A    call        @UStrFromWStr
 0042E19F    mov         eax,dword ptr [ebp-0C]
 0042E1A2    lea         edx,[ebp-8]
 0042E1A5    call        TryStrToInt
 0042E1AA    test        al,al
>0042E1AC    jne         0042E1C9
 0042E1AE    mov         eax,ebx
 0042E1B0    call        @VarToBoolean
 0042E1B5    and         eax,7F
 0042E1B8    mov         dword ptr [ebp-8],eax
>0042E1BB    jmp         0042E1C9
 0042E1BD    movzx       edx,word ptr [ebx]
 0042E1C0    mov         cx,3
 0042E1C4    call        VarResultCheck
 0042E1C9    xor         eax,eax
 0042E1CB    pop         edx
 0042E1CC    pop         ecx
 0042E1CD    pop         ecx
 0042E1CE    mov         dword ptr fs:[eax],edx
 0042E1D1    push        42E1EE
 0042E1D6    lea         eax,[ebp-0C]
 0042E1D9    call        @UStrClr
 0042E1DE    lea         eax,[ebp-4]
 0042E1E1    call        @WStrClr
 0042E1E6    ret
>0042E1E7    jmp         @HandleFinally
>0042E1EC    jmp         0042E1D6
 0042E1EE    mov         eax,dword ptr [ebp-8]
 0042E1F1    pop         ebx
 0042E1F2    mov         esp,ebp
 0042E1F4    pop         ebp
 0042E1F5    ret
*}
end;

//0042E1F8
function VarToIntViaOS(const V:TVarData):Integer;
begin
{*
 0042E1F8    push        ebx
 0042E1F9    add         esp,0FFFFFFF0
 0042E1FC    mov         ebx,eax
 0042E1FE    push        esp
 0042E1FF    call        oleaut32.VariantInit
 0042E204    push        3
 0042E206    push        0
 0042E208    push        400
 0042E20D    push        ebx
 0042E20E    lea         eax,[esp+10]
 0042E212    push        eax
 0042E213    mov         eax,[0078D834];^gvar_00792F18
 0042E218    mov         eax,dword ptr [eax]
 0042E21A    call        eax
 0042E21C    movzx       edx,word ptr [ebx]
 0042E21F    mov         cx,3
 0042E223    call        VarResultCheck
 0042E228    mov         eax,dword ptr [esp+8]
 0042E22C    add         esp,10
 0042E22F    pop         ebx
 0042E230    ret
*}
end;

//0042E234
function VarToIntAny(const V:TVarData):Integer;
begin
{*
 0042E234    push        ebp
 0042E235    mov         ebp,esp
 0042E237    add         esp,0FFFFFFEC
 0042E23A    push        ebx
 0042E23B    mov         ebx,eax
 0042E23D    lea         eax,[ebp-14]
 0042E240    push        eax
 0042E241    call        oleaut32.VariantInit
 0042E246    xor         eax,eax
 0042E248    push        ebp
 0042E249    push        42E288
 0042E24E    push        dword ptr fs:[eax]
 0042E251    mov         dword ptr fs:[eax],esp
 0042E254    mov         edx,ebx
 0042E256    lea         eax,[ebp-14]
 0042E259    call        @VarCopy
 0042E25E    lea         eax,[ebp-14]
 0042E261    call        dword ptr ds:[792F90]
 0042E267    lea         eax,[ebp-14]
 0042E26A    call        @VarToInteger
 0042E26F    mov         dword ptr [ebp-4],eax
 0042E272    xor         eax,eax
 0042E274    pop         edx
 0042E275    pop         ecx
 0042E276    pop         ecx
 0042E277    mov         dword ptr fs:[eax],edx
 0042E27A    push        42E28F
 0042E27F    lea         eax,[ebp-14]
 0042E282    call        @VarClear
 0042E287    ret
>0042E288    jmp         @HandleFinally
>0042E28D    jmp         0042E27F
 0042E28F    mov         eax,dword ptr [ebp-4]
 0042E292    pop         ebx
 0042E293    mov         esp,ebp
 0042E295    pop         ebp
 0042E296    ret
*}
end;

//0042E298
function VarToIntCustom(const V:TVarData; var AValue:Integer):Boolean;
begin
{*
 0042E298    push        ebx
 0042E299    push        esi
 0042E29A    push        edi
 0042E29B    add         esp,0FFFFFFEC
 0042E29E    mov         edi,edx
 0042E2A0    mov         esi,eax
 0042E2A2    mov         edx,esp
 0042E2A4    movzx       eax,word ptr [esi]
 0042E2A7    call        FindCustomVariantType
 0042E2AC    mov         ebx,eax
 0042E2AE    test        bl,bl
>0042E2B0    je          0042E2D3
 0042E2B2    lea         eax,[esp+4]
 0042E2B6    push        eax
 0042E2B7    call        oleaut32.VariantInit
 0042E2BC    push        3
 0042E2BE    mov         ecx,esi
 0042E2C0    lea         edx,[esp+8]
 0042E2C4    mov         eax,dword ptr [esp+4]
 0042E2C8    mov         esi,dword ptr [eax]
 0042E2CA    call        dword ptr [esi+1C]
 0042E2CD    mov         eax,dword ptr [esp+0C]
 0042E2D1    mov         dword ptr [edi],eax
 0042E2D3    mov         eax,ebx
 0042E2D5    add         esp,14
 0042E2D8    pop         edi
 0042E2D9    pop         esi
 0042E2DA    pop         ebx
 0042E2DB    ret
*}
end;

//0042E2DC
function @VarToInteger(const V:TVarData):Integer;
begin
{*
 0042E2DC    push        ebp
 0042E2DD    mov         ebp,esp
 0042E2DF    add         esp,0FFFFFFF8
 0042E2E2    push        ebx
 0042E2E3    push        esi
 0042E2E4    push        edi
 0042E2E5    mov         dword ptr [ebp-4],eax
 0042E2E8    xor         edx,edx
 0042E2EA    push        ebp
 0042E2EB    push        42E75D
 0042E2F0    push        dword ptr fs:[edx]
 0042E2F3    mov         dword ptr fs:[edx],esp
 0042E2F6    mov         eax,dword ptr [ebp-4]
 0042E2F9    movzx       eax,word ptr [eax]
 0042E2FC    movzx       edx,ax
 0042E2FF    cmp         edx,15
>0042E302    ja          0042E4FC
 0042E308    jmp         dword ptr [edx*4+42E30F]
 0042E308    dd          0042E367
 0042E308    dd          0042E371
 0042E308    dd          0042E391
 0042E308    dd          0042E3A0
 0042E308    dd          0042E3AE
 0042E308    dd          0042E3CF
 0042E308    dd          0042E3F0
 0042E308    dd          0042E417
 0042E308    dd          0042E438
 0042E308    dd          0042E4EC
 0042E308    dd          0042E4FC
 0042E308    dd          0042E448
 0042E308    dd          0042E4D9
 0042E308    dd          0042E4EC
 0042E308    dd          0042E4FC
 0042E308    dd          0042E4FC
 0042E308    dd          0042E457
 0042E308    dd          0042E466
 0042E308    dd          0042E475
 0042E308    dd          0042E484
 0042E308    dd          0042E49B
 0042E308    dd          0042E4BA
 0042E367    xor         eax,eax
 0042E369    mov         dword ptr [ebp-8],eax
>0042E36C    jmp         0042E753
 0042E371    cmp         byte ptr ds:[784E6A],0
>0042E378    je          0042E387
 0042E37A    mov         dx,3
 0042E37E    mov         ax,1
 0042E382    call        VarCastError
 0042E387    xor         eax,eax
 0042E389    mov         dword ptr [ebp-8],eax
>0042E38C    jmp         0042E753
 0042E391    mov         eax,dword ptr [ebp-4]
 0042E394    movsx       eax,word ptr [eax+8]
 0042E398    mov         dword ptr [ebp-8],eax
>0042E39B    jmp         0042E753
 0042E3A0    mov         eax,dword ptr [ebp-4]
 0042E3A3    mov         eax,dword ptr [eax+8]
 0042E3A6    mov         dword ptr [ebp-8],eax
>0042E3A9    jmp         0042E753
 0042E3AE    mov         eax,dword ptr [ebp-4]
 0042E3B1    fld         dword ptr [eax+8]
 0042E3B4    call        @ROUND
 0042E3B9    push        eax
 0042E3BA    sar         eax,1F
 0042E3BD    cmp         eax,edx
 0042E3BF    pop         eax
>0042E3C0    je          0042E3C7
 0042E3C2    call        @BoundErr
 0042E3C7    mov         dword ptr [ebp-8],eax
>0042E3CA    jmp         0042E753
 0042E3CF    mov         eax,dword ptr [ebp-4]
 0042E3D2    fld         qword ptr [eax+8]
 0042E3D5    call        @ROUND
 0042E3DA    push        eax
 0042E3DB    sar         eax,1F
 0042E3DE    cmp         eax,edx
 0042E3E0    pop         eax
>0042E3E1    je          0042E3E8
 0042E3E3    call        @BoundErr
 0042E3E8    mov         dword ptr [ebp-8],eax
>0042E3EB    jmp         0042E753
 0042E3F0    mov         eax,dword ptr [ebp-4]
 0042E3F3    fild        qword ptr [eax+8]
 0042E3F6    fdiv        dword ptr ds:[42E788]
 0042E3FC    call        @ROUND
 0042E401    push        eax
 0042E402    sar         eax,1F
 0042E405    cmp         eax,edx
 0042E407    pop         eax
>0042E408    je          0042E40F
 0042E40A    call        @BoundErr
 0042E40F    mov         dword ptr [ebp-8],eax
>0042E412    jmp         0042E753
 0042E417    mov         eax,dword ptr [ebp-4]
 0042E41A    fld         qword ptr [eax+8]
 0042E41D    call        @ROUND
 0042E422    push        eax
 0042E423    sar         eax,1F
 0042E426    cmp         eax,edx
 0042E428    pop         eax
>0042E429    je          0042E430
 0042E42B    call        @BoundErr
 0042E430    mov         dword ptr [ebp-8],eax
>0042E433    jmp         0042E753
 0042E438    mov         eax,dword ptr [ebp-4]
 0042E43B    call        VarToIntAsString
 0042E440    mov         dword ptr [ebp-8],eax
>0042E443    jmp         0042E753
 0042E448    mov         eax,dword ptr [ebp-4]
 0042E44B    movsx       eax,word ptr [eax+8]
 0042E44F    mov         dword ptr [ebp-8],eax
>0042E452    jmp         0042E753
 0042E457    mov         eax,dword ptr [ebp-4]
 0042E45A    movsx       eax,byte ptr [eax+8]
 0042E45E    mov         dword ptr [ebp-8],eax
>0042E461    jmp         0042E753
 0042E466    mov         eax,dword ptr [ebp-4]
 0042E469    movzx       eax,byte ptr [eax+8]
 0042E46D    mov         dword ptr [ebp-8],eax
>0042E470    jmp         0042E753
 0042E475    mov         eax,dword ptr [ebp-4]
 0042E478    movzx       eax,word ptr [eax+8]
 0042E47C    mov         dword ptr [ebp-8],eax
>0042E47F    jmp         0042E753
 0042E484    mov         eax,dword ptr [ebp-4]
 0042E487    mov         eax,dword ptr [eax+8]
 0042E48A    test        eax,eax
>0042E48C    jns         0042E493
 0042E48E    call        @BoundErr
 0042E493    mov         dword ptr [ebp-8],eax
>0042E496    jmp         0042E753
 0042E49B    mov         eax,dword ptr [ebp-4]
 0042E49E    mov         edx,dword ptr [eax+0C]
 0042E4A1    mov         eax,dword ptr [eax+8]
 0042E4A4    push        eax
 0042E4A5    sar         eax,1F
 0042E4A8    cmp         eax,edx
 0042E4AA    pop         eax
>0042E4AB    je          0042E4B2
 0042E4AD    call        @BoundErr
 0042E4B2    mov         dword ptr [ebp-8],eax
>0042E4B5    jmp         0042E753
 0042E4BA    mov         eax,dword ptr [ebp-4]
 0042E4BD    mov         edx,dword ptr [eax+0C]
 0042E4C0    mov         eax,dword ptr [eax+8]
 0042E4C3    push        eax
 0042E4C4    sar         eax,1F
 0042E4C7    cmp         eax,edx
 0042E4C9    pop         eax
>0042E4CA    je          0042E4D1
 0042E4CC    call        @BoundErr
 0042E4D1    mov         dword ptr [ebp-8],eax
>0042E4D4    jmp         0042E753
 0042E4D9    mov         eax,dword ptr [ebp-4]
 0042E4DC    mov         eax,dword ptr [eax+8]
 0042E4DF    call        @VarToInteger
 0042E4E4    mov         dword ptr [ebp-8],eax
>0042E4E7    jmp         0042E753
 0042E4EC    mov         eax,dword ptr [ebp-4]
 0042E4EF    call        VarToIntViaOS
 0042E4F4    mov         dword ptr [ebp-8],eax
>0042E4F7    jmp         0042E753
 0042E4FC    mov         edx,dword ptr [ebp-4]
 0042E4FF    mov         edx,eax
 0042E501    sub         dx,100
>0042E506    je          0042E514
 0042E508    dec         dx
>0042E50B    je          0042E534
 0042E50D    dec         dx
>0042E510    je          0042E524
>0042E512    jmp         0042E544
 0042E514    mov         eax,dword ptr [ebp-4]
 0042E517    call        VarToIntAsString
 0042E51C    mov         dword ptr [ebp-8],eax
>0042E51F    jmp         0042E753
 0042E524    mov         eax,dword ptr [ebp-4]
 0042E527    call        VarToIntAsString
 0042E52C    mov         dword ptr [ebp-8],eax
>0042E52F    jmp         0042E753
 0042E534    mov         eax,dword ptr [ebp-4]
 0042E537    call        VarToIntAny
 0042E53C    mov         dword ptr [ebp-8],eax
>0042E53F    jmp         0042E753
 0042E544    mov         edx,dword ptr [ebp-4]
 0042E547    test        ah,40
>0042E54A    je          0042E739
 0042E550    mov         edx,dword ptr [ebp-4]
 0042E553    movzx       eax,ax
 0042E556    and         eax,0FFFFBFFF
 0042E55B    cmp         eax,15
>0042E55E    ja          0042E72C
 0042E564    jmp         dword ptr [eax*4+42E56B]
 0042E564    dd          0042E72C
 0042E564    dd          0042E72C
 0042E564    dd          0042E5C3
 0042E564    dd          0042E5D4
 0042E564    dd          0042E5E4
 0042E564    dd          0042E607
 0042E564    dd          0042E62A
 0042E564    dd          0042E653
 0042E564    dd          0042E676
 0042E564    dd          0042E72C
 0042E564    dd          0042E72C
 0042E564    dd          0042E686
 0042E564    dd          0042E71C
 0042E564    dd          0042E72C
 0042E564    dd          0042E72C
 0042E564    dd          0042E72C
 0042E564    dd          0042E697
 0042E564    dd          0042E6A8
 0042E564    dd          0042E6B9
 0042E564    dd          0042E6CA
 0042E564    dd          0042E6E0
 0042E564    dd          0042E6FE
 0042E5C3    mov         eax,dword ptr [ebp-4]
 0042E5C6    mov         eax,dword ptr [eax+8]
 0042E5C9    movsx       eax,word ptr [eax]
 0042E5CC    mov         dword ptr [ebp-8],eax
>0042E5CF    jmp         0042E753
 0042E5D4    mov         eax,dword ptr [ebp-4]
 0042E5D7    mov         eax,dword ptr [eax+8]
 0042E5DA    mov         eax,dword ptr [eax]
 0042E5DC    mov         dword ptr [ebp-8],eax
>0042E5DF    jmp         0042E753
 0042E5E4    mov         eax,dword ptr [ebp-4]
 0042E5E7    mov         eax,dword ptr [eax+8]
 0042E5EA    fld         dword ptr [eax]
 0042E5EC    call        @ROUND
 0042E5F1    push        eax
 0042E5F2    sar         eax,1F
 0042E5F5    cmp         eax,edx
 0042E5F7    pop         eax
>0042E5F8    je          0042E5FF
 0042E5FA    call        @BoundErr
 0042E5FF    mov         dword ptr [ebp-8],eax
>0042E602    jmp         0042E753
 0042E607    mov         eax,dword ptr [ebp-4]
 0042E60A    mov         eax,dword ptr [eax+8]
 0042E60D    fld         qword ptr [eax]
 0042E60F    call        @ROUND
 0042E614    push        eax
 0042E615    sar         eax,1F
 0042E618    cmp         eax,edx
 0042E61A    pop         eax
>0042E61B    je          0042E622
 0042E61D    call        @BoundErr
 0042E622    mov         dword ptr [ebp-8],eax
>0042E625    jmp         0042E753
 0042E62A    mov         eax,dword ptr [ebp-4]
 0042E62D    mov         eax,dword ptr [eax+8]
 0042E630    fild        qword ptr [eax]
 0042E632    fdiv        dword ptr ds:[42E788]
 0042E638    call        @ROUND
 0042E63D    push        eax
 0042E63E    sar         eax,1F
 0042E641    cmp         eax,edx
 0042E643    pop         eax
>0042E644    je          0042E64B
 0042E646    call        @BoundErr
 0042E64B    mov         dword ptr [ebp-8],eax
>0042E64E    jmp         0042E753
 0042E653    mov         eax,dword ptr [ebp-4]
 0042E656    mov         eax,dword ptr [eax+8]
 0042E659    fld         qword ptr [eax]
 0042E65B    call        @ROUND
 0042E660    push        eax
 0042E661    sar         eax,1F
 0042E664    cmp         eax,edx
 0042E666    pop         eax
>0042E667    je          0042E66E
 0042E669    call        @BoundErr
 0042E66E    mov         dword ptr [ebp-8],eax
>0042E671    jmp         0042E753
 0042E676    mov         eax,dword ptr [ebp-4]
 0042E679    call        VarToIntAsString
 0042E67E    mov         dword ptr [ebp-8],eax
>0042E681    jmp         0042E753
 0042E686    mov         eax,dword ptr [ebp-4]
 0042E689    mov         eax,dword ptr [eax+8]
 0042E68C    movsx       eax,word ptr [eax]
 0042E68F    mov         dword ptr [ebp-8],eax
>0042E692    jmp         0042E753
 0042E697    mov         eax,dword ptr [ebp-4]
 0042E69A    mov         eax,dword ptr [eax+8]
 0042E69D    movsx       eax,byte ptr [eax]
 0042E6A0    mov         dword ptr [ebp-8],eax
>0042E6A3    jmp         0042E753
 0042E6A8    mov         eax,dword ptr [ebp-4]
 0042E6AB    mov         eax,dword ptr [eax+8]
 0042E6AE    movzx       eax,byte ptr [eax]
 0042E6B1    mov         dword ptr [ebp-8],eax
>0042E6B4    jmp         0042E753
 0042E6B9    mov         eax,dword ptr [ebp-4]
 0042E6BC    mov         eax,dword ptr [eax+8]
 0042E6BF    movzx       eax,word ptr [eax]
 0042E6C2    mov         dword ptr [ebp-8],eax
>0042E6C5    jmp         0042E753
 0042E6CA    mov         eax,dword ptr [ebp-4]
 0042E6CD    mov         eax,dword ptr [eax+8]
 0042E6D0    mov         eax,dword ptr [eax]
 0042E6D2    test        eax,eax
>0042E6D4    jns         0042E6DB
 0042E6D6    call        @BoundErr
 0042E6DB    mov         dword ptr [ebp-8],eax
>0042E6DE    jmp         0042E753
 0042E6E0    mov         eax,dword ptr [ebp-4]
 0042E6E3    mov         eax,dword ptr [eax+8]
 0042E6E6    mov         edx,dword ptr [eax+4]
 0042E6E9    mov         eax,dword ptr [eax]
 0042E6EB    push        eax
 0042E6EC    sar         eax,1F
 0042E6EF    cmp         eax,edx
 0042E6F1    pop         eax
>0042E6F2    je          0042E6F9
 0042E6F4    call        @BoundErr
 0042E6F9    mov         dword ptr [ebp-8],eax
>0042E6FC    jmp         0042E753
 0042E6FE    mov         eax,dword ptr [ebp-4]
 0042E701    mov         eax,dword ptr [eax+8]
 0042E704    mov         edx,dword ptr [eax+4]
 0042E707    mov         eax,dword ptr [eax]
 0042E709    push        eax
 0042E70A    sar         eax,1F
 0042E70D    cmp         eax,edx
 0042E70F    pop         eax
>0042E710    je          0042E717
 0042E712    call        @BoundErr
 0042E717    mov         dword ptr [ebp-8],eax
>0042E71A    jmp         0042E753
 0042E71C    mov         eax,dword ptr [ebp-4]
 0042E71F    mov         eax,dword ptr [eax+8]
 0042E722    call        @VarToInteger
 0042E727    mov         dword ptr [ebp-8],eax
>0042E72A    jmp         0042E753
 0042E72C    mov         eax,dword ptr [ebp-4]
 0042E72F    call        VarToIntViaOS
 0042E734    mov         dword ptr [ebp-8],eax
>0042E737    jmp         0042E753
 0042E739    lea         edx,[ebp-8]
 0042E73C    mov         eax,dword ptr [ebp-4]
 0042E73F    call        VarToIntCustom
 0042E744    test        al,al
>0042E746    jne         0042E753
 0042E748    mov         eax,dword ptr [ebp-4]
 0042E74B    call        VarToIntViaOS
 0042E750    mov         dword ptr [ebp-8],eax
 0042E753    xor         eax,eax
 0042E755    pop         edx
 0042E756    pop         ecx
 0042E757    pop         ecx
 0042E758    mov         dword ptr fs:[eax],edx
>0042E75B    jmp         0042E77B
>0042E75D    jmp         @HandleAnyException
 0042E762    mov         eax,dword ptr [ebp-4]
 0042E765    movzx       eax,word ptr [eax]
 0042E768    mov         dx,3
 0042E76C    call        HandleConversionException
 0042E771    xor         eax,eax
 0042E773    mov         dword ptr [ebp-8],eax
 0042E776    call        @DoneExcept
 0042E77B    mov         eax,dword ptr [ebp-8]
 0042E77E    pop         edi
 0042E77F    pop         esi
 0042E780    pop         ebx
 0042E781    pop         ecx
 0042E782    pop         ecx
 0042E783    pop         ebp
 0042E784    ret
*}
end;

//0042E78C
function @VarToShortInt(const V:TVarData):ShortInt;
begin
{*
 0042E78C    push        ebp
 0042E78D    mov         ebp,esp
 0042E78F    push        ecx
 0042E790    push        ebx
 0042E791    push        esi
 0042E792    push        edi
 0042E793    mov         dword ptr [ebp-4],eax
 0042E796    mov         eax,dword ptr [ebp-4]
 0042E799    movzx       eax,word ptr [eax]
 0042E79C    sub         ax,1
>0042E7A0    jb          0042E7B2
>0042E7A2    je          0042E7B6
 0042E7A4    sub         ax,0A
>0042E7A8    je          0042E7D0
 0042E7AA    sub         ax,5
>0042E7AE    je          0042E7D9
>0042E7B0    jmp         0042E7E2
 0042E7B2    xor         ebx,ebx
>0042E7B4    jmp         0042E835
 0042E7B6    cmp         byte ptr ds:[784E6A],0
>0042E7BD    je          0042E7CC
 0042E7BF    mov         dx,10
 0042E7C3    mov         ax,1
 0042E7C7    call        VarCastError
 0042E7CC    xor         ebx,ebx
>0042E7CE    jmp         0042E835
 0042E7D0    mov         ebx,dword ptr [ebp-4]
 0042E7D3    movzx       ebx,byte ptr [ebx+8]
>0042E7D7    jmp         0042E835
 0042E7D9    mov         ebx,dword ptr [ebp-4]
 0042E7DC    movzx       ebx,byte ptr [ebx+8]
>0042E7E0    jmp         0042E835
 0042E7E2    xor         eax,eax
 0042E7E4    push        ebp
 0042E7E5    push        42E81A
 0042E7EA    push        dword ptr fs:[eax]
 0042E7ED    mov         dword ptr fs:[eax],esp
 0042E7F0    mov         eax,dword ptr [ebp-4]
 0042E7F3    call        @VarToInteger
 0042E7F8    mov         ebx,eax
 0042E7FA    add         ebx,80
 0042E800    cmp         ebx,0FF
>0042E806    jbe         0042E80D
 0042E808    call        @BoundErr
 0042E80D    add         ebx,0FFFFFF80
 0042E810    xor         eax,eax
 0042E812    pop         edx
 0042E813    pop         ecx
 0042E814    pop         ecx
 0042E815    mov         dword ptr fs:[eax],edx
>0042E818    jmp         0042E835
>0042E81A    jmp         @HandleAnyException
 0042E81F    mov         eax,dword ptr [ebp-4]
 0042E822    movzx       eax,word ptr [eax]
 0042E825    mov         dx,10
 0042E829    call        HandleConversionException
 0042E82E    xor         ebx,ebx
 0042E830    call        @DoneExcept
 0042E835    mov         eax,ebx
 0042E837    pop         edi
 0042E838    pop         esi
 0042E839    pop         ebx
 0042E83A    pop         ecx
 0042E83B    pop         ebp
 0042E83C    ret
*}
end;

//0042E840
function @VarToByte(const V:TVarData):Byte;
begin
{*
 0042E840    push        ebp
 0042E841    mov         ebp,esp
 0042E843    push        ecx
 0042E844    push        ebx
 0042E845    push        esi
 0042E846    push        edi
 0042E847    mov         dword ptr [ebp-4],eax
 0042E84A    mov         eax,dword ptr [ebp-4]
 0042E84D    movzx       eax,word ptr [eax]
 0042E850    sub         ax,1
>0042E854    jb          0042E866
>0042E856    je          0042E86A
 0042E858    sub         ax,0A
>0042E85C    je          0042E884
 0042E85E    sub         ax,6
>0042E862    je          0042E88D
>0042E864    jmp         0042E896
 0042E866    xor         ebx,ebx
>0042E868    jmp         0042E8E0
 0042E86A    cmp         byte ptr ds:[784E6A],0
>0042E871    je          0042E880
 0042E873    mov         dx,11
 0042E877    mov         ax,1
 0042E87B    call        VarCastError
 0042E880    xor         ebx,ebx
>0042E882    jmp         0042E8E0
 0042E884    mov         ebx,dword ptr [ebp-4]
 0042E887    movzx       ebx,byte ptr [ebx+8]
>0042E88B    jmp         0042E8E0
 0042E88D    mov         ebx,dword ptr [ebp-4]
 0042E890    movzx       ebx,byte ptr [ebx+8]
>0042E894    jmp         0042E8E0
 0042E896    xor         eax,eax
 0042E898    push        ebp
 0042E899    push        42E8C5
 0042E89E    push        dword ptr fs:[eax]
 0042E8A1    mov         dword ptr fs:[eax],esp
 0042E8A4    mov         eax,dword ptr [ebp-4]
 0042E8A7    call        @VarToInteger
 0042E8AC    mov         ebx,eax
 0042E8AE    cmp         ebx,0FF
>0042E8B4    jbe         0042E8BB
 0042E8B6    call        @BoundErr
 0042E8BB    xor         eax,eax
 0042E8BD    pop         edx
 0042E8BE    pop         ecx
 0042E8BF    pop         ecx
 0042E8C0    mov         dword ptr fs:[eax],edx
>0042E8C3    jmp         0042E8E0
>0042E8C5    jmp         @HandleAnyException
 0042E8CA    mov         eax,dword ptr [ebp-4]
 0042E8CD    movzx       eax,word ptr [eax]
 0042E8D0    mov         dx,11
 0042E8D4    call        HandleConversionException
 0042E8D9    xor         ebx,ebx
 0042E8DB    call        @DoneExcept
 0042E8E0    mov         eax,ebx
 0042E8E2    pop         edi
 0042E8E3    pop         esi
 0042E8E4    pop         ebx
 0042E8E5    pop         ecx
 0042E8E6    pop         ebp
 0042E8E7    ret
*}
end;

//0042E8E8
function @VarToSmallInt(const V:TVarData):SmallInt;
begin
{*
 0042E8E8    push        ebp
 0042E8E9    mov         ebp,esp
 0042E8EB    push        ecx
 0042E8EC    push        ebx
 0042E8ED    push        esi
 0042E8EE    push        edi
 0042E8EF    mov         dword ptr [ebp-4],eax
 0042E8F2    mov         eax,dword ptr [ebp-4]
 0042E8F5    movzx       eax,word ptr [eax]
 0042E8F8    cmp         eax,11
>0042E8FB    ja          0042E982
 0042E901    movzx       eax,byte ptr [eax+42E90F]
 0042E908    jmp         dword ptr [eax*4+42E921]
 0042E908    db          1
 0042E908    db          2
 0042E908    db          3
 0042E908    db          0
 0042E908    db          0
 0042E908    db          0
 0042E908    db          0
 0042E908    db          0
 0042E908    db          0
 0042E908    db          0
 0042E908    db          0
 0042E908    db          4
 0042E908    db          0
 0042E908    db          0
 0042E908    db          0
 0042E908    db          0
 0042E908    db          5
 0042E908    db          6
 0042E908    dd          0042E982
 0042E908    dd          0042E93D
 0042E908    dd          0042E944
 0042E908    dd          0042E95E
 0042E908    dd          0042E967
 0042E908    dd          0042E970
 0042E908    dd          0042E979
 0042E93D    xor         ebx,ebx
>0042E93F    jmp         0042E9D8
 0042E944    cmp         byte ptr ds:[784E6A],0
>0042E94B    je          0042E95A
 0042E94D    mov         dx,2
 0042E951    mov         ax,1
 0042E955    call        VarCastError
 0042E95A    xor         ebx,ebx
>0042E95C    jmp         0042E9D8
 0042E95E    mov         ebx,dword ptr [ebp-4]
 0042E961    movzx       ebx,word ptr [ebx+8]
>0042E965    jmp         0042E9D8
 0042E967    mov         ebx,dword ptr [ebp-4]
 0042E96A    movzx       ebx,word ptr [ebx+8]
>0042E96E    jmp         0042E9D8
 0042E970    mov         ebx,dword ptr [ebp-4]
 0042E973    movsx       ebx,byte ptr [ebx+8]
>0042E977    jmp         0042E9D8
 0042E979    mov         ebx,dword ptr [ebp-4]
 0042E97C    movzx       ebx,byte ptr [ebx+8]
>0042E980    jmp         0042E9D8
 0042E982    xor         eax,eax
 0042E984    push        ebp
 0042E985    push        42E9BD
 0042E98A    push        dword ptr fs:[eax]
 0042E98D    mov         dword ptr fs:[eax],esp
 0042E990    mov         eax,dword ptr [ebp-4]
 0042E993    call        @VarToInteger
 0042E998    mov         ebx,eax
 0042E99A    add         ebx,8000
 0042E9A0    cmp         ebx,0FFFF
>0042E9A6    jbe         0042E9AD
 0042E9A8    call        @BoundErr
 0042E9AD    add         ebx,0FFFF8000
 0042E9B3    xor         eax,eax
 0042E9B5    pop         edx
 0042E9B6    pop         ecx
 0042E9B7    pop         ecx
 0042E9B8    mov         dword ptr fs:[eax],edx
>0042E9BB    jmp         0042E9D8
>0042E9BD    jmp         @HandleAnyException
 0042E9C2    mov         eax,dword ptr [ebp-4]
 0042E9C5    movzx       eax,word ptr [eax]
 0042E9C8    mov         dx,2
 0042E9CC    call        HandleConversionException
 0042E9D1    xor         ebx,ebx
 0042E9D3    call        @DoneExcept
 0042E9D8    mov         eax,ebx
 0042E9DA    pop         edi
 0042E9DB    pop         esi
 0042E9DC    pop         ebx
 0042E9DD    pop         ecx
 0042E9DE    pop         ebp
 0042E9DF    ret
*}
end;

//0042E9E0
function @VarToWord(const V:TVarData):Word;
begin
{*
 0042E9E0    push        ebp
 0042E9E1    mov         ebp,esp
 0042E9E3    push        ecx
 0042E9E4    push        ebx
 0042E9E5    push        esi
 0042E9E6    push        edi
 0042E9E7    mov         dword ptr [ebp-4],eax
 0042E9EA    mov         eax,dword ptr [ebp-4]
 0042E9ED    movzx       eax,word ptr [eax]
 0042E9F0    cmp         eax,12
>0042E9F3    ja          0042EA67
 0042E9F5    movzx       eax,byte ptr [eax+42EA03]
 0042E9FC    jmp         dword ptr [eax*4+42EA16]
 0042E9FC    db          1
 0042E9FC    db          2
 0042E9FC    db          0
 0042E9FC    db          0
 0042E9FC    db          0
 0042E9FC    db          0
 0042E9FC    db          0
 0042E9FC    db          0
 0042E9FC    db          0
 0042E9FC    db          0
 0042E9FC    db          0
 0042E9FC    db          3
 0042E9FC    db          0
 0042E9FC    db          0
 0042E9FC    db          0
 0042E9FC    db          0
 0042E9FC    db          0
 0042E9FC    db          4
 0042E9FC    db          5
 0042E9FC    dd          0042EA67
 0042E9FC    dd          0042EA2E
 0042E9FC    dd          0042EA32
 0042E9FC    dd          0042EA4C
 0042E9FC    dd          0042EA55
 0042E9FC    dd          0042EA5E
 0042EA2E    xor         ebx,ebx
>0042EA30    jmp         0042EAB1
 0042EA32    cmp         byte ptr ds:[784E6A],0
>0042EA39    je          0042EA48
 0042EA3B    mov         dx,12
 0042EA3F    mov         ax,1
 0042EA43    call        VarCastError
 0042EA48    xor         ebx,ebx
>0042EA4A    jmp         0042EAB1
 0042EA4C    mov         ebx,dword ptr [ebp-4]
 0042EA4F    movzx       ebx,word ptr [ebx+8]
>0042EA53    jmp         0042EAB1
 0042EA55    mov         ebx,dword ptr [ebp-4]
 0042EA58    movzx       ebx,byte ptr [ebx+8]
>0042EA5C    jmp         0042EAB1
 0042EA5E    mov         ebx,dword ptr [ebp-4]
 0042EA61    movzx       ebx,word ptr [ebx+8]
>0042EA65    jmp         0042EAB1
 0042EA67    xor         eax,eax
 0042EA69    push        ebp
 0042EA6A    push        42EA96
 0042EA6F    push        dword ptr fs:[eax]
 0042EA72    mov         dword ptr fs:[eax],esp
 0042EA75    mov         eax,dword ptr [ebp-4]
 0042EA78    call        @VarToInteger
 0042EA7D    mov         ebx,eax
 0042EA7F    cmp         ebx,0FFFF
>0042EA85    jbe         0042EA8C
 0042EA87    call        @BoundErr
 0042EA8C    xor         eax,eax
 0042EA8E    pop         edx
 0042EA8F    pop         ecx
 0042EA90    pop         ecx
 0042EA91    mov         dword ptr fs:[eax],edx
>0042EA94    jmp         0042EAB1
>0042EA96    jmp         @HandleAnyException
 0042EA9B    mov         eax,dword ptr [ebp-4]
 0042EA9E    movzx       eax,word ptr [eax]
 0042EAA1    mov         dx,12
 0042EAA5    call        HandleConversionException
 0042EAAA    xor         ebx,ebx
 0042EAAC    call        @DoneExcept
 0042EAB1    mov         eax,ebx
 0042EAB3    pop         edi
 0042EAB4    pop         esi
 0042EAB5    pop         ebx
 0042EAB6    pop         ecx
 0042EAB7    pop         ebp
 0042EAB8    ret
*}
end;

//0042EABC
function @VarToLongWord(const V:TVarData):LongWord;
begin
{*
 0042EABC    push        ebp
 0042EABD    mov         ebp,esp
 0042EABF    push        ecx
 0042EAC0    push        ebx
 0042EAC1    push        esi
 0042EAC2    push        edi
 0042EAC3    mov         dword ptr [ebp-4],eax
 0042EAC6    mov         eax,dword ptr [ebp-4]
 0042EAC9    movzx       eax,word ptr [eax]
 0042EACC    cmp         eax,13
>0042EACF    ja          0042EB57
 0042EAD5    movzx       eax,byte ptr [eax+42EAE3]
 0042EADC    jmp         dword ptr [eax*4+42EAF7]
 0042EADC    db          1
 0042EADC    db          2
 0042EADC    db          0
 0042EADC    db          0
 0042EADC    db          0
 0042EADC    db          0
 0042EADC    db          0
 0042EADC    db          0
 0042EADC    db          0
 0042EADC    db          0
 0042EADC    db          0
 0042EADC    db          3
 0042EADC    db          0
 0042EADC    db          0
 0042EADC    db          0
 0042EADC    db          0
 0042EADC    db          0
 0042EADC    db          4
 0042EADC    db          5
 0042EADC    db          6
 0042EADC    dd          0042EB57
 0042EADC    dd          0042EB13
 0042EADC    dd          0042EB1A
 0042EADC    dd          0042EB34
 0042EADC    dd          0042EB3D
 0042EADC    dd          0042EB46
 0042EADC    dd          0042EB4F
 0042EB13    xor         ebx,ebx
>0042EB15    jmp         0042EB9D
 0042EB1A    cmp         byte ptr ds:[784E6A],0
>0042EB21    je          0042EB30
 0042EB23    mov         dx,13
 0042EB27    mov         ax,1
 0042EB2B    call        VarCastError
 0042EB30    xor         ebx,ebx
>0042EB32    jmp         0042EB9D
 0042EB34    mov         ebx,dword ptr [ebp-4]
 0042EB37    movsx       ebx,word ptr [ebx+8]
>0042EB3B    jmp         0042EB9D
 0042EB3D    mov         ebx,dword ptr [ebp-4]
 0042EB40    movzx       ebx,byte ptr [ebx+8]
>0042EB44    jmp         0042EB9D
 0042EB46    mov         ebx,dword ptr [ebp-4]
 0042EB49    movzx       ebx,word ptr [ebx+8]
>0042EB4D    jmp         0042EB9D
 0042EB4F    mov         ebx,dword ptr [ebp-4]
 0042EB52    mov         ebx,dword ptr [ebx+8]
>0042EB55    jmp         0042EB9D
 0042EB57    xor         eax,eax
 0042EB59    push        ebp
 0042EB5A    push        42EB82
 0042EB5F    push        dword ptr fs:[eax]
 0042EB62    mov         dword ptr fs:[eax],esp
 0042EB65    mov         eax,dword ptr [ebp-4]
 0042EB68    call        @VarToInt64
 0042EB6D    test        edx,edx
>0042EB6F    je          0042EB76
 0042EB71    call        @BoundErr
 0042EB76    mov         ebx,eax
 0042EB78    xor         eax,eax
 0042EB7A    pop         edx
 0042EB7B    pop         ecx
 0042EB7C    pop         ecx
 0042EB7D    mov         dword ptr fs:[eax],edx
>0042EB80    jmp         0042EB9D
>0042EB82    jmp         @HandleAnyException
 0042EB87    mov         eax,dword ptr [ebp-4]
 0042EB8A    movzx       eax,word ptr [eax]
 0042EB8D    mov         dx,13
 0042EB91    call        HandleConversionException
 0042EB96    xor         ebx,ebx
 0042EB98    call        @DoneExcept
 0042EB9D    mov         eax,ebx
 0042EB9F    pop         edi
 0042EBA0    pop         esi
 0042EBA1    pop         ebx
 0042EBA2    pop         ecx
 0042EBA3    pop         ebp
 0042EBA4    ret
*}
end;

//0042EBA8
function VarToInt64ViaOS(const V:TVarData):Int64;
begin
{*
 0042EBA8    push        ebx
 0042EBA9    add         esp,0FFFFFFE8
 0042EBAC    mov         ebx,eax
 0042EBAE    lea         eax,[esp+8]
 0042EBB2    push        eax
 0042EBB3    call        oleaut32.VariantInit
 0042EBB8    push        3
 0042EBBA    push        0
 0042EBBC    push        400
 0042EBC1    push        ebx
 0042EBC2    lea         eax,[esp+18]
 0042EBC6    push        eax
 0042EBC7    mov         eax,[0078D834];^gvar_00792F18
 0042EBCC    mov         eax,dword ptr [eax]
 0042EBCE    call        eax
 0042EBD0    test        eax,eax
>0042EBD2    jne         0042EBE2
 0042EBD4    mov         eax,dword ptr [esp+10]
 0042EBD8    cdq
 0042EBD9    mov         dword ptr [esp],eax
 0042EBDC    mov         dword ptr [esp+4],edx
>0042EBE0    jmp         0042EC47
 0042EBE2    push        5
 0042EBE4    push        0
 0042EBE6    push        400
 0042EBEB    push        ebx
 0042EBEC    lea         eax,[esp+18]
 0042EBF0    push        eax
 0042EBF1    mov         eax,[0078D834];^gvar_00792F18
 0042EBF6    mov         eax,dword ptr [eax]
 0042EBF8    call        eax
 0042EBFA    test        eax,eax
>0042EBFC    jne         0042EC10
 0042EBFE    fld         qword ptr [esp+10]
 0042EC02    call        @ROUND
 0042EC07    mov         dword ptr [esp],eax
 0042EC0A    mov         dword ptr [esp+4],edx
>0042EC0E    jmp         0042EC47
 0042EC10    cmp         eax,80020005
>0042EC15    jne         0042EC2C
 0042EC17    mov         eax,ebx
 0042EC19    call        @VarToBoolean
 0042EC1E    and         eax,7F
 0042EC21    xor         edx,edx
 0042EC23    mov         dword ptr [esp],eax
 0042EC26    mov         dword ptr [esp+4],edx
>0042EC2A    jmp         0042EC47
 0042EC2C    movzx       edx,word ptr [ebx]
 0042EC2F    mov         cx,14
 0042EC33    call        VarResultCheck
 0042EC38    mov         dword ptr [esp],0
 0042EC3F    mov         dword ptr [esp+4],0
 0042EC47    mov         eax,dword ptr [esp]
 0042EC4A    mov         edx,dword ptr [esp+4]
 0042EC4E    add         esp,18
 0042EC51    pop         ebx
 0042EC52    ret
*}
end;

//0042EC54
function VarToInt64AsString(const V:TVarData):Int64;
begin
{*
 0042EC54    push        ebp
 0042EC55    mov         ebp,esp
 0042EC57    add         esp,0FFFFFFDC
 0042EC5A    push        ebx
 0042EC5B    xor         edx,edx
 0042EC5D    mov         dword ptr [ebp-24],edx
 0042EC60    mov         dword ptr [ebp-4],edx
 0042EC63    mov         ebx,eax
 0042EC65    xor         eax,eax
 0042EC67    push        ebp
 0042EC68    push        42ED42
 0042EC6D    push        dword ptr fs:[eax]
 0042EC70    mov         dword ptr fs:[eax],esp
 0042EC73    mov         edx,ebx
 0042EC75    lea         eax,[ebp-4]
 0042EC78    call        @VarToWStr
 0042EC7D    lea         eax,[ebp-24]
 0042EC80    mov         edx,dword ptr [ebp-4]
 0042EC83    call        @UStrFromWStr
 0042EC88    mov         eax,dword ptr [ebp-24]
 0042EC8B    lea         edx,[ebp-10]
 0042EC8E    call        TryStrToInt64
 0042EC93    test        al,al
>0042EC95    jne         0042ED24
 0042EC9B    lea         eax,[ebp-14]
 0042EC9E    push        eax
 0042EC9F    push        0
 0042ECA1    push        400
 0042ECA6    mov         eax,dword ptr [ebp-4]
 0042ECA9    push        eax
 0042ECAA    mov         eax,[0078DAA0];^gvar_00792F4C
 0042ECAF    mov         eax,dword ptr [eax]
 0042ECB1    call        eax
 0042ECB3    test        eax,eax
>0042ECB5    jne         0042ECC3
 0042ECB7    mov         eax,dword ptr [ebp-14]
 0042ECBA    cdq
 0042ECBB    mov         dword ptr [ebp-10],eax
 0042ECBE    mov         dword ptr [ebp-0C],edx
>0042ECC1    jmp         0042ED24
 0042ECC3    lea         eax,[ebp-20]
 0042ECC6    push        eax
 0042ECC7    push        0
 0042ECC9    push        400
 0042ECCE    mov         eax,dword ptr [ebp-4]
 0042ECD1    push        eax
 0042ECD2    mov         eax,[0078D480];^gvar_00792F54
 0042ECD7    mov         eax,dword ptr [eax]
 0042ECD9    call        eax
 0042ECDB    test        eax,eax
>0042ECDD    jne         0042ECEF
 0042ECDF    fld         qword ptr [ebp-20]
 0042ECE2    call        @ROUND
 0042ECE7    mov         dword ptr [ebp-10],eax
 0042ECEA    mov         dword ptr [ebp-0C],edx
>0042ECED    jmp         0042ED24
 0042ECEF    cmp         eax,80020005
>0042ECF4    jne         0042ED0A
 0042ECF6    mov         eax,ebx
 0042ECF8    call        @VarToBoolean
 0042ECFD    and         eax,7F
 0042ED00    xor         edx,edx
 0042ED02    mov         dword ptr [ebp-10],eax
 0042ED05    mov         dword ptr [ebp-0C],edx
>0042ED08    jmp         0042ED24
 0042ED0A    movzx       edx,word ptr [ebx]
 0042ED0D    mov         cx,14
 0042ED11    call        VarResultCheck
 0042ED16    mov         dword ptr [ebp-10],0
 0042ED1D    mov         dword ptr [ebp-0C],0
 0042ED24    xor         eax,eax
 0042ED26    pop         edx
 0042ED27    pop         ecx
 0042ED28    pop         ecx
 0042ED29    mov         dword ptr fs:[eax],edx
 0042ED2C    push        42ED49
 0042ED31    lea         eax,[ebp-24]
 0042ED34    call        @UStrClr
 0042ED39    lea         eax,[ebp-4]
 0042ED3C    call        @WStrClr
 0042ED41    ret
>0042ED42    jmp         @HandleFinally
>0042ED47    jmp         0042ED31
 0042ED49    mov         eax,dword ptr [ebp-10]
 0042ED4C    mov         edx,dword ptr [ebp-0C]
 0042ED4F    pop         ebx
 0042ED50    mov         esp,ebp
 0042ED52    pop         ebp
 0042ED53    ret
*}
end;

//0042ED54
function VarToInt64Any(const V:TVarData):Int64;
begin
{*
 0042ED54    push        ebp
 0042ED55    mov         ebp,esp
 0042ED57    add         esp,0FFFFFFE8
 0042ED5A    push        ebx
 0042ED5B    mov         ebx,eax
 0042ED5D    lea         eax,[ebp-18]
 0042ED60    push        eax
 0042ED61    call        oleaut32.VariantInit
 0042ED66    xor         eax,eax
 0042ED68    push        ebp
 0042ED69    push        42EDAB
 0042ED6E    push        dword ptr fs:[eax]
 0042ED71    mov         dword ptr fs:[eax],esp
 0042ED74    mov         edx,ebx
 0042ED76    lea         eax,[ebp-18]
 0042ED79    call        @VarCopy
 0042ED7E    lea         eax,[ebp-18]
 0042ED81    call        dword ptr ds:[792F90]
 0042ED87    lea         eax,[ebp-18]
 0042ED8A    call        @VarToInt64
 0042ED8F    mov         dword ptr [ebp-8],eax
 0042ED92    mov         dword ptr [ebp-4],edx
 0042ED95    xor         eax,eax
 0042ED97    pop         edx
 0042ED98    pop         ecx
 0042ED99    pop         ecx
 0042ED9A    mov         dword ptr fs:[eax],edx
 0042ED9D    push        42EDB2
 0042EDA2    lea         eax,[ebp-18]
 0042EDA5    call        @VarClear
 0042EDAA    ret
>0042EDAB    jmp         @HandleFinally
>0042EDB0    jmp         0042EDA2
 0042EDB2    mov         eax,dword ptr [ebp-8]
 0042EDB5    mov         edx,dword ptr [ebp-4]
 0042EDB8    pop         ebx
 0042EDB9    mov         esp,ebp
 0042EDBB    pop         ebp
 0042EDBC    ret
*}
end;

//0042EDC0
function VarToInt64Custom(const V:TVarData; var AValue:Int64):Boolean;
begin
{*
 0042EDC0    push        ebx
 0042EDC1    push        esi
 0042EDC2    push        edi
 0042EDC3    add         esp,0FFFFFFEC
 0042EDC6    mov         edi,edx
 0042EDC8    mov         esi,eax
 0042EDCA    mov         edx,esp
 0042EDCC    movzx       eax,word ptr [esi]
 0042EDCF    call        FindCustomVariantType
 0042EDD4    mov         ebx,eax
 0042EDD6    test        bl,bl
>0042EDD8    je          0042EE02
 0042EDDA    lea         eax,[esp+4]
 0042EDDE    push        eax
 0042EDDF    call        oleaut32.VariantInit
 0042EDE4    push        14
 0042EDE6    mov         ecx,esi
 0042EDE8    lea         edx,[esp+8]
 0042EDEC    mov         eax,dword ptr [esp+4]
 0042EDF0    mov         esi,dword ptr [eax]
 0042EDF2    call        dword ptr [esi+1C]
 0042EDF5    mov         eax,dword ptr [esp+0C]
 0042EDF9    mov         dword ptr [edi],eax
 0042EDFB    mov         eax,dword ptr [esp+10]
 0042EDFF    mov         dword ptr [edi+4],eax
 0042EE02    mov         eax,ebx
 0042EE04    add         esp,14
 0042EE07    pop         edi
 0042EE08    pop         esi
 0042EE09    pop         ebx
 0042EE0A    ret
*}
end;

//0042EE0C
function @VarToInt64(const V:TVarData):Int64;
begin
{*
 0042EE0C    push        ebp
 0042EE0D    mov         ebp,esp
 0042EE0F    add         esp,0FFFFFFF0
 0042EE12    push        ebx
 0042EE13    push        esi
 0042EE14    push        edi
 0042EE15    mov         dword ptr [ebp-4],eax
 0042EE18    xor         edx,edx
 0042EE1A    push        ebp
 0042EE1B    push        42F262
 0042EE20    push        dword ptr fs:[edx]
 0042EE23    mov         dword ptr fs:[edx],esp
 0042EE26    mov         eax,dword ptr [ebp-4]
 0042EE29    movzx       eax,word ptr [eax]
 0042EE2C    movzx       edx,ax
 0042EE2F    cmp         edx,15
>0042EE32    ja          0042F01B
 0042EE38    jmp         dword ptr [edx*4+42EE3F]
 0042EE38    dd          0042EE97
 0042EE38    dd          0042EEAA
 0042EE38    dd          0042EED3
 0042EE38    dd          0042EEE6
 0042EE38    dd          0042EEF8
 0042EE38    dd          0042EF0E
 0042EE38    dd          0042EF24
 0042EE38    dd          0042EF40
 0042EE38    dd          0042EF56
 0042EE38    dd          0042F008
 0042EE38    dd          0042F01B
 0042EE38    dd          0042EF69
 0042EE38    dd          0042EFF2
 0042EE38    dd          0042F008
 0042EE38    dd          0042F01B
 0042EE38    dd          0042F01B
 0042EE38    dd          0042EF7C
 0042EE38    dd          0042EF8F
 0042EE38    dd          0042EFA3
 0042EE38    dd          0042EFB7
 0042EE38    dd          0042EFCA
 0042EE38    dd          0042EFDE
 0042EE97    mov         dword ptr [ebp-10],0
 0042EE9E    mov         dword ptr [ebp-0C],0
>0042EEA5    jmp         0042F258
 0042EEAA    cmp         byte ptr ds:[784E6A],0
>0042EEB1    je          0042EEC0
 0042EEB3    mov         dx,14
 0042EEB7    mov         ax,1
 0042EEBB    call        VarCastError
 0042EEC0    mov         dword ptr [ebp-10],0
 0042EEC7    mov         dword ptr [ebp-0C],0
>0042EECE    jmp         0042F258
 0042EED3    mov         eax,dword ptr [ebp-4]
 0042EED6    movsx       eax,word ptr [eax+8]
 0042EEDA    cdq
 0042EEDB    mov         dword ptr [ebp-10],eax
 0042EEDE    mov         dword ptr [ebp-0C],edx
>0042EEE1    jmp         0042F258
 0042EEE6    mov         eax,dword ptr [ebp-4]
 0042EEE9    mov         eax,dword ptr [eax+8]
 0042EEEC    cdq
 0042EEED    mov         dword ptr [ebp-10],eax
 0042EEF0    mov         dword ptr [ebp-0C],edx
>0042EEF3    jmp         0042F258
 0042EEF8    mov         eax,dword ptr [ebp-4]
 0042EEFB    fld         dword ptr [eax+8]
 0042EEFE    call        @ROUND
 0042EF03    mov         dword ptr [ebp-10],eax
 0042EF06    mov         dword ptr [ebp-0C],edx
>0042EF09    jmp         0042F258
 0042EF0E    mov         eax,dword ptr [ebp-4]
 0042EF11    fld         qword ptr [eax+8]
 0042EF14    call        @ROUND
 0042EF19    mov         dword ptr [ebp-10],eax
 0042EF1C    mov         dword ptr [ebp-0C],edx
>0042EF1F    jmp         0042F258
 0042EF24    mov         eax,dword ptr [ebp-4]
 0042EF27    fild        qword ptr [eax+8]
 0042EF2A    fdiv        dword ptr ds:[42F298]
 0042EF30    call        @ROUND
 0042EF35    mov         dword ptr [ebp-10],eax
 0042EF38    mov         dword ptr [ebp-0C],edx
>0042EF3B    jmp         0042F258
 0042EF40    mov         eax,dword ptr [ebp-4]
 0042EF43    fld         qword ptr [eax+8]
 0042EF46    call        @ROUND
 0042EF4B    mov         dword ptr [ebp-10],eax
 0042EF4E    mov         dword ptr [ebp-0C],edx
>0042EF51    jmp         0042F258
 0042EF56    mov         eax,dword ptr [ebp-4]
 0042EF59    call        VarToInt64AsString
 0042EF5E    mov         dword ptr [ebp-10],eax
 0042EF61    mov         dword ptr [ebp-0C],edx
>0042EF64    jmp         0042F258
 0042EF69    mov         eax,dword ptr [ebp-4]
 0042EF6C    movsx       eax,word ptr [eax+8]
 0042EF70    cdq
 0042EF71    mov         dword ptr [ebp-10],eax
 0042EF74    mov         dword ptr [ebp-0C],edx
>0042EF77    jmp         0042F258
 0042EF7C    mov         eax,dword ptr [ebp-4]
 0042EF7F    movsx       eax,byte ptr [eax+8]
 0042EF83    cdq
 0042EF84    mov         dword ptr [ebp-10],eax
 0042EF87    mov         dword ptr [ebp-0C],edx
>0042EF8A    jmp         0042F258
 0042EF8F    mov         eax,dword ptr [ebp-4]
 0042EF92    movzx       eax,byte ptr [eax+8]
 0042EF96    xor         edx,edx
 0042EF98    mov         dword ptr [ebp-10],eax
 0042EF9B    mov         dword ptr [ebp-0C],edx
>0042EF9E    jmp         0042F258
 0042EFA3    mov         eax,dword ptr [ebp-4]
 0042EFA6    movzx       eax,word ptr [eax+8]
 0042EFAA    xor         edx,edx
 0042EFAC    mov         dword ptr [ebp-10],eax
 0042EFAF    mov         dword ptr [ebp-0C],edx
>0042EFB2    jmp         0042F258
 0042EFB7    mov         eax,dword ptr [ebp-4]
 0042EFBA    mov         eax,dword ptr [eax+8]
 0042EFBD    xor         edx,edx
 0042EFBF    mov         dword ptr [ebp-10],eax
 0042EFC2    mov         dword ptr [ebp-0C],edx
>0042EFC5    jmp         0042F258
 0042EFCA    mov         eax,dword ptr [ebp-4]
 0042EFCD    mov         edx,dword ptr [eax+8]
 0042EFD0    mov         dword ptr [ebp-10],edx
 0042EFD3    mov         edx,dword ptr [eax+0C]
 0042EFD6    mov         dword ptr [ebp-0C],edx
>0042EFD9    jmp         0042F258
 0042EFDE    mov         eax,dword ptr [ebp-4]
 0042EFE1    mov         edx,dword ptr [eax+8]
 0042EFE4    mov         dword ptr [ebp-10],edx
 0042EFE7    mov         edx,dword ptr [eax+0C]
 0042EFEA    mov         dword ptr [ebp-0C],edx
>0042EFED    jmp         0042F258
 0042EFF2    mov         eax,dword ptr [ebp-4]
 0042EFF5    mov         eax,dword ptr [eax+8]
 0042EFF8    call        @VarToInt64
 0042EFFD    mov         dword ptr [ebp-10],eax
 0042F000    mov         dword ptr [ebp-0C],edx
>0042F003    jmp         0042F258
 0042F008    mov         eax,dword ptr [ebp-4]
 0042F00B    call        VarToInt64ViaOS
 0042F010    mov         dword ptr [ebp-10],eax
 0042F013    mov         dword ptr [ebp-0C],edx
>0042F016    jmp         0042F258
 0042F01B    mov         edx,dword ptr [ebp-4]
 0042F01E    mov         edx,eax
 0042F020    sub         dx,100
>0042F025    je          0042F033
 0042F027    dec         dx
>0042F02A    je          0042F059
 0042F02C    dec         dx
>0042F02F    je          0042F046
>0042F031    jmp         0042F06C
 0042F033    mov         eax,dword ptr [ebp-4]
 0042F036    call        VarToInt64AsString
 0042F03B    mov         dword ptr [ebp-10],eax
 0042F03E    mov         dword ptr [ebp-0C],edx
>0042F041    jmp         0042F258
 0042F046    mov         eax,dword ptr [ebp-4]
 0042F049    call        VarToInt64AsString
 0042F04E    mov         dword ptr [ebp-10],eax
 0042F051    mov         dword ptr [ebp-0C],edx
>0042F054    jmp         0042F258
 0042F059    mov         eax,dword ptr [ebp-4]
 0042F05C    call        VarToInt64Any
 0042F061    mov         dword ptr [ebp-10],eax
 0042F064    mov         dword ptr [ebp-0C],edx
>0042F067    jmp         0042F258
 0042F06C    mov         edx,dword ptr [ebp-4]
 0042F06F    test        ah,40
>0042F072    je          0042F23B
 0042F078    mov         edx,dword ptr [ebp-4]
 0042F07B    movzx       eax,ax
 0042F07E    and         eax,0FFFFBFFF
 0042F083    cmp         eax,15
>0042F086    ja          0042F22B
 0042F08C    jmp         dword ptr [eax*4+42F093]
 0042F08C    dd          0042F22B
 0042F08C    dd          0042F22B
 0042F08C    dd          0042F0EB
 0042F08C    dd          0042F100
 0042F08C    dd          0042F114
 0042F08C    dd          0042F12C
 0042F08C    dd          0042F144
 0042F08C    dd          0042F162
 0042F08C    dd          0042F17A
 0042F08C    dd          0042F22B
 0042F08C    dd          0042F22B
 0042F08C    dd          0042F18D
 0042F08C    dd          0042F218
 0042F08C    dd          0042F22B
 0042F08C    dd          0042F22B
 0042F08C    dd          0042F22B
 0042F08C    dd          0042F1A2
 0042F08C    dd          0042F1B7
 0042F08C    dd          0042F1CD
 0042F08C    dd          0042F1E0
 0042F08C    dd          0042F1F2
 0042F08C    dd          0042F205
 0042F0EB    mov         eax,dword ptr [ebp-4]
 0042F0EE    mov         eax,dword ptr [eax+8]
 0042F0F1    movsx       eax,word ptr [eax]
 0042F0F4    cdq
 0042F0F5    mov         dword ptr [ebp-10],eax
 0042F0F8    mov         dword ptr [ebp-0C],edx
>0042F0FB    jmp         0042F258
 0042F100    mov         eax,dword ptr [ebp-4]
 0042F103    mov         eax,dword ptr [eax+8]
 0042F106    mov         eax,dword ptr [eax]
 0042F108    cdq
 0042F109    mov         dword ptr [ebp-10],eax
 0042F10C    mov         dword ptr [ebp-0C],edx
>0042F10F    jmp         0042F258
 0042F114    mov         eax,dword ptr [ebp-4]
 0042F117    mov         eax,dword ptr [eax+8]
 0042F11A    fld         dword ptr [eax]
 0042F11C    call        @ROUND
 0042F121    mov         dword ptr [ebp-10],eax
 0042F124    mov         dword ptr [ebp-0C],edx
>0042F127    jmp         0042F258
 0042F12C    mov         eax,dword ptr [ebp-4]
 0042F12F    mov         eax,dword ptr [eax+8]
 0042F132    fld         qword ptr [eax]
 0042F134    call        @ROUND
 0042F139    mov         dword ptr [ebp-10],eax
 0042F13C    mov         dword ptr [ebp-0C],edx
>0042F13F    jmp         0042F258
 0042F144    mov         eax,dword ptr [ebp-4]
 0042F147    mov         eax,dword ptr [eax+8]
 0042F14A    fild        qword ptr [eax]
 0042F14C    fdiv        dword ptr ds:[42F298]
 0042F152    call        @ROUND
 0042F157    mov         dword ptr [ebp-10],eax
 0042F15A    mov         dword ptr [ebp-0C],edx
>0042F15D    jmp         0042F258
 0042F162    mov         eax,dword ptr [ebp-4]
 0042F165    mov         eax,dword ptr [eax+8]
 0042F168    fld         qword ptr [eax]
 0042F16A    call        @ROUND
 0042F16F    mov         dword ptr [ebp-10],eax
 0042F172    mov         dword ptr [ebp-0C],edx
>0042F175    jmp         0042F258
 0042F17A    mov         eax,dword ptr [ebp-4]
 0042F17D    call        VarToInt64AsString
 0042F182    mov         dword ptr [ebp-10],eax
 0042F185    mov         dword ptr [ebp-0C],edx
>0042F188    jmp         0042F258
 0042F18D    mov         eax,dword ptr [ebp-4]
 0042F190    mov         eax,dword ptr [eax+8]
 0042F193    movsx       eax,word ptr [eax]
 0042F196    cdq
 0042F197    mov         dword ptr [ebp-10],eax
 0042F19A    mov         dword ptr [ebp-0C],edx
>0042F19D    jmp         0042F258
 0042F1A2    mov         eax,dword ptr [ebp-4]
 0042F1A5    mov         eax,dword ptr [eax+8]
 0042F1A8    movsx       eax,byte ptr [eax]
 0042F1AB    cdq
 0042F1AC    mov         dword ptr [ebp-10],eax
 0042F1AF    mov         dword ptr [ebp-0C],edx
>0042F1B2    jmp         0042F258
 0042F1B7    mov         eax,dword ptr [ebp-4]
 0042F1BA    mov         eax,dword ptr [eax+8]
 0042F1BD    movzx       eax,byte ptr [eax]
 0042F1C0    xor         edx,edx
 0042F1C2    mov         dword ptr [ebp-10],eax
 0042F1C5    mov         dword ptr [ebp-0C],edx
>0042F1C8    jmp         0042F258
 0042F1CD    mov         eax,dword ptr [ebp-4]
 0042F1D0    mov         eax,dword ptr [eax+8]
 0042F1D3    movzx       eax,word ptr [eax]
 0042F1D6    xor         edx,edx
 0042F1D8    mov         dword ptr [ebp-10],eax
 0042F1DB    mov         dword ptr [ebp-0C],edx
>0042F1DE    jmp         0042F258
 0042F1E0    mov         eax,dword ptr [ebp-4]
 0042F1E3    mov         eax,dword ptr [eax+8]
 0042F1E6    mov         eax,dword ptr [eax]
 0042F1E8    xor         edx,edx
 0042F1EA    mov         dword ptr [ebp-10],eax
 0042F1ED    mov         dword ptr [ebp-0C],edx
>0042F1F0    jmp         0042F258
 0042F1F2    mov         eax,dword ptr [ebp-4]
 0042F1F5    mov         eax,dword ptr [eax+8]
 0042F1F8    mov         edx,dword ptr [eax]
 0042F1FA    mov         dword ptr [ebp-10],edx
 0042F1FD    mov         edx,dword ptr [eax+4]
 0042F200    mov         dword ptr [ebp-0C],edx
>0042F203    jmp         0042F258
 0042F205    mov         eax,dword ptr [ebp-4]
 0042F208    mov         eax,dword ptr [eax+8]
 0042F20B    mov         edx,dword ptr [eax]
 0042F20D    mov         dword ptr [ebp-10],edx
 0042F210    mov         edx,dword ptr [eax+4]
 0042F213    mov         dword ptr [ebp-0C],edx
>0042F216    jmp         0042F258
 0042F218    mov         eax,dword ptr [ebp-4]
 0042F21B    mov         eax,dword ptr [eax+8]
 0042F21E    call        @VarToInt64
 0042F223    mov         dword ptr [ebp-10],eax
 0042F226    mov         dword ptr [ebp-0C],edx
>0042F229    jmp         0042F258
 0042F22B    mov         eax,dword ptr [ebp-4]
 0042F22E    call        VarToInt64ViaOS
 0042F233    mov         dword ptr [ebp-10],eax
 0042F236    mov         dword ptr [ebp-0C],edx
>0042F239    jmp         0042F258
 0042F23B    lea         edx,[ebp-10]
 0042F23E    mov         eax,dword ptr [ebp-4]
 0042F241    call        VarToInt64Custom
 0042F246    test        al,al
>0042F248    jne         0042F258
 0042F24A    mov         eax,dword ptr [ebp-4]
 0042F24D    call        VarToInt64ViaOS
 0042F252    mov         dword ptr [ebp-10],eax
 0042F255    mov         dword ptr [ebp-0C],edx
 0042F258    xor         eax,eax
 0042F25A    pop         edx
 0042F25B    pop         ecx
 0042F25C    pop         ecx
 0042F25D    mov         dword ptr fs:[eax],edx
>0042F260    jmp         0042F289
>0042F262    jmp         @HandleAnyException
 0042F267    mov         eax,dword ptr [ebp-4]
 0042F26A    movzx       eax,word ptr [eax]
 0042F26D    mov         dx,14
 0042F271    call        HandleConversionException
 0042F276    mov         dword ptr [ebp-10],0
 0042F27D    mov         dword ptr [ebp-0C],0
 0042F284    call        @DoneExcept
 0042F289    mov         eax,dword ptr [ebp-10]
 0042F28C    mov         edx,dword ptr [ebp-0C]
 0042F28F    pop         edi
 0042F290    pop         esi
 0042F291    pop         ebx
 0042F292    mov         esp,ebp
 0042F294    pop         ebp
 0042F295    ret
*}
end;

//0042F29C
function @VarToUInt64(const V:TVarData):UInt64;
begin
{*
 0042F29C    push        ebp
 0042F29D    mov         ebp,esp
 0042F29F    add         esp,0FFFFFFF0
 0042F2A2    push        ebx
 0042F2A3    push        esi
 0042F2A4    push        edi
 0042F2A5    mov         dword ptr [ebp-4],eax
 0042F2A8    mov         eax,dword ptr [ebp-4]
 0042F2AB    movzx       eax,word ptr [eax]
 0042F2AE    cmp         eax,15
>0042F2B1    ja          0042F393
 0042F2B7    movzx       eax,byte ptr [eax+42F2C5]
 0042F2BE    jmp         dword ptr [eax*4+42F2DB]
 0042F2BE    db          1
 0042F2BE    db          2
 0042F2BE    db          0
 0042F2BE    db          0
 0042F2BE    db          0
 0042F2BE    db          0
 0042F2BE    db          0
 0042F2BE    db          0
 0042F2BE    db          0
 0042F2BE    db          0
 0042F2BE    db          0
 0042F2BE    db          3
 0042F2BE    db          0
 0042F2BE    db          0
 0042F2BE    db          0
 0042F2BE    db          0
 0042F2BE    db          0
 0042F2BE    db          4
 0042F2BE    db          5
 0042F2BE    db          6
 0042F2BE    db          0
 0042F2BE    db          7
 0042F2BE    dd          0042F393
 0042F2BE    dd          0042F2FB
 0042F2BE    dd          0042F30E
 0042F2BE    dd          0042F337
 0042F2BE    dd          0042F34A
 0042F2BE    dd          0042F35E
 0042F2BE    dd          0042F372
 0042F2BE    dd          0042F382
 0042F2FB    mov         dword ptr [ebp-10],0
 0042F302    mov         dword ptr [ebp-0C],0
>0042F309    jmp         0042F3F2
 0042F30E    cmp         byte ptr ds:[784E6A],0
>0042F315    je          0042F324
 0042F317    mov         dx,13
 0042F31B    mov         ax,1
 0042F31F    call        VarCastError
 0042F324    mov         dword ptr [ebp-10],0
 0042F32B    mov         dword ptr [ebp-0C],0
>0042F332    jmp         0042F3F2
 0042F337    mov         eax,dword ptr [ebp-4]
 0042F33A    movsx       eax,word ptr [eax+8]
 0042F33E    cdq
 0042F33F    mov         dword ptr [ebp-10],eax
 0042F342    mov         dword ptr [ebp-0C],edx
>0042F345    jmp         0042F3F2
 0042F34A    mov         eax,dword ptr [ebp-4]
 0042F34D    movzx       eax,byte ptr [eax+8]
 0042F351    xor         edx,edx
 0042F353    mov         dword ptr [ebp-10],eax
 0042F356    mov         dword ptr [ebp-0C],edx
>0042F359    jmp         0042F3F2
 0042F35E    mov         eax,dword ptr [ebp-4]
 0042F361    movzx       eax,word ptr [eax+8]
 0042F365    xor         edx,edx
 0042F367    mov         dword ptr [ebp-10],eax
 0042F36A    mov         dword ptr [ebp-0C],edx
>0042F36D    jmp         0042F3F2
 0042F372    mov         eax,dword ptr [ebp-4]
 0042F375    mov         eax,dword ptr [eax+8]
 0042F378    xor         edx,edx
 0042F37A    mov         dword ptr [ebp-10],eax
 0042F37D    mov         dword ptr [ebp-0C],edx
>0042F380    jmp         0042F3F2
 0042F382    mov         eax,dword ptr [ebp-4]
 0042F385    mov         edx,dword ptr [eax+8]
 0042F388    mov         dword ptr [ebp-10],edx
 0042F38B    mov         edx,dword ptr [eax+0C]
 0042F38E    mov         dword ptr [ebp-0C],edx
>0042F391    jmp         0042F3F2
 0042F393    xor         eax,eax
 0042F395    push        ebp
 0042F396    push        42F3CB
 0042F39B    push        dword ptr fs:[eax]
 0042F39E    mov         dword ptr fs:[eax],esp
 0042F3A1    mov         eax,dword ptr [ebp-4]
 0042F3A4    call        @VarToInt64
 0042F3A9    cmp         edx,7FFFFFFF
>0042F3AF    jne         0042F3B4
 0042F3B1    cmp         eax,0FFFFFFFF
>0042F3B4    jbe         0042F3BB
 0042F3B6    call        @BoundErr
 0042F3BB    mov         dword ptr [ebp-10],eax
 0042F3BE    mov         dword ptr [ebp-0C],edx
 0042F3C1    xor         eax,eax
 0042F3C3    pop         edx
 0042F3C4    pop         ecx
 0042F3C5    pop         ecx
 0042F3C6    mov         dword ptr fs:[eax],edx
>0042F3C9    jmp         0042F3F2
>0042F3CB    jmp         @HandleAnyException
 0042F3D0    mov         eax,dword ptr [ebp-4]
 0042F3D3    movzx       eax,word ptr [eax]
 0042F3D6    mov         dx,15
 0042F3DA    call        HandleConversionException
 0042F3DF    mov         dword ptr [ebp-10],0
 0042F3E6    mov         dword ptr [ebp-0C],0
 0042F3ED    call        @DoneExcept
 0042F3F2    mov         eax,dword ptr [ebp-10]
 0042F3F5    mov         edx,dword ptr [ebp-0C]
 0042F3F8    pop         edi
 0042F3F9    pop         esi
 0042F3FA    pop         ebx
 0042F3FB    mov         esp,ebp
 0042F3FD    pop         ebp
 0042F3FE    ret
*}
end;

//0042F400
function VarToBoolAsString(const V:TVarData):Boolean;
begin
{*
 0042F400    push        ebp
 0042F401    mov         ebp,esp
 0042F403    push        0
 0042F405    push        0
 0042F407    push        0
 0042F409    push        ebx
 0042F40A    mov         ebx,eax
 0042F40C    xor         eax,eax
 0042F40E    push        ebp
 0042F40F    push        42F4B2
 0042F414    push        dword ptr fs:[eax]
 0042F417    mov         dword ptr fs:[eax],esp
 0042F41A    mov         edx,ebx
 0042F41C    lea         eax,[ebp-4]
 0042F41F    call        @VarToWStr
 0042F424    lea         eax,[ebp-8]
 0042F427    push        eax
 0042F428    push        0
 0042F42A    push        400
 0042F42F    mov         eax,dword ptr [ebp-4]
 0042F432    push        eax
 0042F433    mov         eax,[0078D35C];^gvar_00792F60
 0042F438    mov         eax,dword ptr [eax]
 0042F43A    call        eax
 0042F43C    mov         edx,eax
 0042F43E    sub         edx,80020005
>0042F444    je          0042F45B
 0042F446    sub         edx,7FFDFFFB
>0042F44C    jne         0042F488
 0042F44E    cmp         word ptr [ebp-8],1
 0042F453    sbb         eax,eax
 0042F455    inc         eax
 0042F456    mov         byte ptr [ebp-5],al
>0042F459    jmp         0042F494
 0042F45B    lea         eax,[ebp-0C]
 0042F45E    mov         edx,dword ptr [ebp-4]
 0042F461    call        @UStrFromWStr
 0042F466    mov         eax,dword ptr [ebp-0C]
 0042F469    lea         edx,[ebp-5]
 0042F46C    call        TryStrToBool
 0042F471    test        al,al
>0042F473    jne         0042F494
 0042F475    movzx       edx,word ptr [ebx]
 0042F478    mov         cx,0B
 0042F47C    mov         eax,80020005
 0042F481    call        VarResultCheck
>0042F486    jmp         0042F494
 0042F488    movzx       edx,word ptr [ebx]
 0042F48B    mov         cx,0B
 0042F48F    call        VarResultCheck
 0042F494    xor         eax,eax
 0042F496    pop         edx
 0042F497    pop         ecx
 0042F498    pop         ecx
 0042F499    mov         dword ptr fs:[eax],edx
 0042F49C    push        42F4B9
 0042F4A1    lea         eax,[ebp-0C]
 0042F4A4    call        @UStrClr
 0042F4A9    lea         eax,[ebp-4]
 0042F4AC    call        @WStrClr
 0042F4B1    ret
>0042F4B2    jmp         @HandleFinally
>0042F4B7    jmp         0042F4A1
 0042F4B9    movzx       eax,byte ptr [ebp-5]
 0042F4BD    pop         ebx
 0042F4BE    mov         esp,ebp
 0042F4C0    pop         ebp
 0042F4C1    ret
*}
end;

//0042F4C4
function VarToBoolViaOS(const V:TVarData):Boolean;
begin
{*
 0042F4C4    push        ebx
 0042F4C5    add         esp,0FFFFFFF0
 0042F4C8    mov         ebx,eax
 0042F4CA    push        esp
 0042F4CB    call        oleaut32.VariantInit
 0042F4D0    push        0B
 0042F4D2    push        0
 0042F4D4    push        400
 0042F4D9    push        ebx
 0042F4DA    lea         eax,[esp+10]
 0042F4DE    push        eax
 0042F4DF    mov         eax,[0078D834];^gvar_00792F18
 0042F4E4    mov         eax,dword ptr [eax]
 0042F4E6    call        eax
 0042F4E8    movzx       edx,word ptr [ebx]
 0042F4EB    mov         cx,0B
 0042F4EF    call        VarResultCheck
 0042F4F4    cmp         word ptr [esp+8],1
 0042F4FA    sbb         eax,eax
 0042F4FC    inc         eax
 0042F4FD    add         esp,10
 0042F500    pop         ebx
 0042F501    ret
*}
end;

//0042F504
function VarToBoolAny(const V:TVarData):Boolean;
begin
{*
 0042F504    push        ebp
 0042F505    mov         ebp,esp
 0042F507    add         esp,0FFFFFFEC
 0042F50A    push        ebx
 0042F50B    mov         ebx,eax
 0042F50D    lea         eax,[ebp-11]
 0042F510    push        eax
 0042F511    call        oleaut32.VariantInit
 0042F516    xor         eax,eax
 0042F518    push        ebp
 0042F519    push        42F558
 0042F51E    push        dword ptr fs:[eax]
 0042F521    mov         dword ptr fs:[eax],esp
 0042F524    mov         edx,ebx
 0042F526    lea         eax,[ebp-11]
 0042F529    call        @VarCopy
 0042F52E    lea         eax,[ebp-11]
 0042F531    call        dword ptr ds:[792F90]
 0042F537    lea         eax,[ebp-11]
 0042F53A    call        @VarToBoolean
 0042F53F    mov         byte ptr [ebp-1],al
 0042F542    xor         eax,eax
 0042F544    pop         edx
 0042F545    pop         ecx
 0042F546    pop         ecx
 0042F547    mov         dword ptr fs:[eax],edx
 0042F54A    push        42F55F
 0042F54F    lea         eax,[ebp-11]
 0042F552    call        @VarClear
 0042F557    ret
>0042F558    jmp         @HandleFinally
>0042F55D    jmp         0042F54F
 0042F55F    movzx       eax,byte ptr [ebp-1]
 0042F563    pop         ebx
 0042F564    mov         esp,ebp
 0042F566    pop         ebp
 0042F567    ret
*}
end;

//0042F568
function VarToBoolCustom(const V:TVarData; var AValue:Boolean):Boolean;
begin
{*
 0042F568    push        ebx
 0042F569    push        esi
 0042F56A    push        edi
 0042F56B    add         esp,0FFFFFFEC
 0042F56E    mov         edi,edx
 0042F570    mov         esi,eax
 0042F572    mov         edx,esp
 0042F574    movzx       eax,word ptr [esi]
 0042F577    call        FindCustomVariantType
 0042F57C    mov         ebx,eax
 0042F57E    test        bl,bl
>0042F580    je          0042F5A8
 0042F582    lea         eax,[esp+4]
 0042F586    push        eax
 0042F587    call        oleaut32.VariantInit
 0042F58C    push        0B
 0042F58E    mov         ecx,esi
 0042F590    lea         edx,[esp+8]
 0042F594    mov         eax,dword ptr [esp+4]
 0042F598    mov         esi,dword ptr [eax]
 0042F59A    call        dword ptr [esi+1C]
 0042F59D    cmp         word ptr [esp+0C],1
 0042F5A3    sbb         eax,eax
 0042F5A5    inc         eax
 0042F5A6    mov         byte ptr [edi],al
 0042F5A8    mov         eax,ebx
 0042F5AA    add         esp,14
 0042F5AD    pop         edi
 0042F5AE    pop         esi
 0042F5AF    pop         ebx
 0042F5B0    ret
*}
end;

//0042F5B4
function @VarToBoolean(const V:TVarData):Boolean;
begin
{*
 0042F5B4    push        ebx
 0042F5B5    push        ecx
 0042F5B6    mov         ebx,eax
 0042F5B8    movzx       eax,word ptr [ebx]
 0042F5BB    movzx       edx,ax
 0042F5BE    cmp         edx,15
>0042F5C1    ja          0042F75E
 0042F5C7    jmp         dword ptr [edx*4+42F5CE]
 0042F5C7    dd          0042F626
 0042F5C7    dd          0042F62F
 0042F5C7    dd          0042F64E
 0042F5C7    dd          0042F65C
 0042F5C7    dd          0042F669
 0042F5C7    dd          0042F67F
 0042F5C7    dd          0042F695
 0042F5C7    dd          0042F6AB
 0042F5C7    dd          0042F6C1
 0042F5C7    dd          0042F74F
 0042F5C7    dd          0042F75E
 0042F5C7    dd          0042F6D0
 0042F5C7    dd          0042F73F
 0042F5C7    dd          0042F74F
 0042F5C7    dd          0042F75E
 0042F5C7    dd          0042F75E
 0042F5C7    dd          0042F6E0
 0042F5C7    dd          0042F6ED
 0042F5C7    dd          0042F6FA
 0042F5C7    dd          0042F708
 0042F5C7    dd          0042F715
 0042F5C7    dd          0042F72A
 0042F626    mov         byte ptr [esp],0
>0042F62A    jmp         0042F942
 0042F62F    cmp         byte ptr ds:[784E6A],0
>0042F636    je          0042F645
 0042F638    mov         dx,0B
 0042F63C    mov         ax,1
 0042F640    call        VarCastError
 0042F645    mov         byte ptr [esp],0
>0042F649    jmp         0042F942
 0042F64E    cmp         word ptr [ebx+8],0
 0042F653    setne       byte ptr [esp]
>0042F657    jmp         0042F942
 0042F65C    cmp         dword ptr [ebx+8],0
 0042F660    setne       byte ptr [esp]
>0042F664    jmp         0042F942
 0042F669    fld         dword ptr [ebx+8]
 0042F66C    fcomp       dword ptr ds:[42F94C]
 0042F672    wait
 0042F673    fnstsw      al
 0042F675    sahf
 0042F676    setne       byte ptr [esp]
>0042F67A    jmp         0042F942
 0042F67F    fld         qword ptr [ebx+8]
 0042F682    fcomp       dword ptr ds:[42F94C]
 0042F688    wait
 0042F689    fnstsw      al
 0042F68B    sahf
 0042F68C    setne       byte ptr [esp]
>0042F690    jmp         0042F942
 0042F695    fild        qword ptr [ebx+8]
 0042F698    fcomp       dword ptr ds:[42F94C]
 0042F69E    wait
 0042F69F    fnstsw      al
 0042F6A1    sahf
 0042F6A2    setne       byte ptr [esp]
>0042F6A6    jmp         0042F942
 0042F6AB    fld         qword ptr [ebx+8]
 0042F6AE    fcomp       dword ptr ds:[42F94C]
 0042F6B4    wait
 0042F6B5    fnstsw      al
 0042F6B7    sahf
 0042F6B8    setne       byte ptr [esp]
>0042F6BC    jmp         0042F942
 0042F6C1    mov         eax,ebx
 0042F6C3    call        VarToBoolAsString
 0042F6C8    mov         byte ptr [esp],al
>0042F6CB    jmp         0042F942
 0042F6D0    cmp         word ptr [ebx+8],1
 0042F6D5    sbb         eax,eax
 0042F6D7    inc         eax
 0042F6D8    mov         byte ptr [esp],al
>0042F6DB    jmp         0042F942
 0042F6E0    cmp         byte ptr [ebx+8],0
 0042F6E4    setne       byte ptr [esp]
>0042F6E8    jmp         0042F942
 0042F6ED    cmp         byte ptr [ebx+8],0
 0042F6F1    setne       byte ptr [esp]
>0042F6F5    jmp         0042F942
 0042F6FA    cmp         word ptr [ebx+8],0
 0042F6FF    setne       byte ptr [esp]
>0042F703    jmp         0042F942
 0042F708    cmp         dword ptr [ebx+8],0
 0042F70C    setne       byte ptr [esp]
>0042F710    jmp         0042F942
 0042F715    cmp         dword ptr [ebx+0C],0
>0042F719    jne         0042F71F
 0042F71B    cmp         dword ptr [ebx+8],0
 0042F71F    setne       al
 0042F722    mov         byte ptr [esp],al
>0042F725    jmp         0042F942
 0042F72A    cmp         dword ptr [ebx+0C],0
>0042F72E    jne         0042F734
 0042F730    cmp         dword ptr [ebx+8],0
 0042F734    setne       al
 0042F737    mov         byte ptr [esp],al
>0042F73A    jmp         0042F942
 0042F73F    mov         eax,dword ptr [ebx+8]
 0042F742    call        @VarToBoolean
 0042F747    mov         byte ptr [esp],al
>0042F74A    jmp         0042F942
 0042F74F    mov         eax,ebx
 0042F751    call        VarToBoolViaOS
 0042F756    mov         byte ptr [esp],al
>0042F759    jmp         0042F942
 0042F75E    mov         edx,eax
 0042F760    sub         dx,100
>0042F765    je          0042F773
 0042F767    dec         dx
>0042F76A    je          0042F791
 0042F76C    dec         dx
>0042F76F    je          0042F782
>0042F771    jmp         0042F7A0
 0042F773    mov         eax,ebx
 0042F775    call        VarToBoolAsString
 0042F77A    mov         byte ptr [esp],al
>0042F77D    jmp         0042F942
 0042F782    mov         eax,ebx
 0042F784    call        VarToBoolAsString
 0042F789    mov         byte ptr [esp],al
>0042F78C    jmp         0042F942
 0042F791    mov         eax,ebx
 0042F793    call        VarToBoolAny
 0042F798    mov         byte ptr [esp],al
>0042F79B    jmp         0042F942
 0042F7A0    test        ah,40
>0042F7A3    je          0042F92B
 0042F7A9    movzx       eax,ax
 0042F7AC    and         eax,0FFFFBFFF
 0042F7B1    cmp         eax,15
>0042F7B4    ja          0042F91F
 0042F7BA    jmp         dword ptr [eax*4+42F7C1]
 0042F7BA    dd          0042F91F
 0042F7BA    dd          0042F91F
 0042F7BA    dd          0042F819
 0042F7BA    dd          0042F829
 0042F7BA    dd          0042F838
 0042F7BA    dd          0042F850
 0042F7BA    dd          0042F868
 0042F7BA    dd          0042F880
 0042F7BA    dd          0042F898
 0042F7BA    dd          0042F91F
 0042F7BA    dd          0042F91F
 0042F7BA    dd          0042F8A7
 0042F7BA    dd          0042F912
 0042F7BA    dd          0042F91F
 0042F7BA    dd          0042F91F
 0042F7BA    dd          0042F91F
 0042F7BA    dd          0042F8B9
 0042F7BA    dd          0042F8C5
 0042F7BA    dd          0042F8D1
 0042F7BA    dd          0042F8DE
 0042F7BA    dd          0042F8EA
 0042F7BA    dd          0042F8FE
 0042F819    mov         eax,dword ptr [ebx+8]
 0042F81C    cmp         word ptr [eax],0
 0042F820    setne       byte ptr [esp]
>0042F824    jmp         0042F942
 0042F829    mov         eax,dword ptr [ebx+8]
 0042F82C    cmp         dword ptr [eax],0
 0042F82F    setne       byte ptr [esp]
>0042F833    jmp         0042F942
 0042F838    mov         eax,dword ptr [ebx+8]
 0042F83B    fld         dword ptr [eax]
 0042F83D    fcomp       dword ptr ds:[42F94C]
 0042F843    wait
 0042F844    fnstsw      al
 0042F846    sahf
 0042F847    setne       byte ptr [esp]
>0042F84B    jmp         0042F942
 0042F850    mov         eax,dword ptr [ebx+8]
 0042F853    fld         qword ptr [eax]
 0042F855    fcomp       dword ptr ds:[42F94C]
 0042F85B    wait
 0042F85C    fnstsw      al
 0042F85E    sahf
 0042F85F    setne       byte ptr [esp]
>0042F863    jmp         0042F942
 0042F868    mov         eax,dword ptr [ebx+8]
 0042F86B    fild        qword ptr [eax]
 0042F86D    fcomp       dword ptr ds:[42F94C]
 0042F873    wait
 0042F874    fnstsw      al
 0042F876    sahf
 0042F877    setne       byte ptr [esp]
>0042F87B    jmp         0042F942
 0042F880    mov         eax,dword ptr [ebx+8]
 0042F883    fld         qword ptr [eax]
 0042F885    fcomp       dword ptr ds:[42F94C]
 0042F88B    wait
 0042F88C    fnstsw      al
 0042F88E    sahf
 0042F88F    setne       byte ptr [esp]
>0042F893    jmp         0042F942
 0042F898    mov         eax,ebx
 0042F89A    call        VarToBoolAsString
 0042F89F    mov         byte ptr [esp],al
>0042F8A2    jmp         0042F942
 0042F8A7    mov         eax,dword ptr [ebx+8]
 0042F8AA    cmp         word ptr [eax],1
 0042F8AE    sbb         eax,eax
 0042F8B0    inc         eax
 0042F8B1    mov         byte ptr [esp],al
>0042F8B4    jmp         0042F942
 0042F8B9    mov         eax,dword ptr [ebx+8]
 0042F8BC    cmp         byte ptr [eax],0
 0042F8BF    setne       byte ptr [esp]
>0042F8C3    jmp         0042F942
 0042F8C5    mov         eax,dword ptr [ebx+8]
 0042F8C8    cmp         byte ptr [eax],0
 0042F8CB    setne       byte ptr [esp]
>0042F8CF    jmp         0042F942
 0042F8D1    mov         eax,dword ptr [ebx+8]
 0042F8D4    cmp         word ptr [eax],0
 0042F8D8    setne       byte ptr [esp]
>0042F8DC    jmp         0042F942
 0042F8DE    mov         eax,dword ptr [ebx+8]
 0042F8E1    cmp         dword ptr [eax],0
 0042F8E4    setne       byte ptr [esp]
>0042F8E8    jmp         0042F942
 0042F8EA    mov         eax,dword ptr [ebx+8]
 0042F8ED    cmp         dword ptr [eax+4],0
>0042F8F1    jne         0042F8F6
 0042F8F3    cmp         dword ptr [eax],0
 0042F8F6    setne       al
 0042F8F9    mov         byte ptr [esp],al
>0042F8FC    jmp         0042F942
 0042F8FE    mov         eax,dword ptr [ebx+8]
 0042F901    cmp         dword ptr [eax+4],0
>0042F905    jne         0042F90A
 0042F907    cmp         dword ptr [eax],0
 0042F90A    setne       al
 0042F90D    mov         byte ptr [esp],al
>0042F910    jmp         0042F942
 0042F912    mov         eax,dword ptr [ebx+8]
 0042F915    call        @VarToBoolean
 0042F91A    mov         byte ptr [esp],al
>0042F91D    jmp         0042F942
 0042F91F    mov         eax,ebx
 0042F921    call        VarToBoolViaOS
 0042F926    mov         byte ptr [esp],al
>0042F929    jmp         0042F942
 0042F92B    mov         edx,esp
 0042F92D    mov         eax,ebx
 0042F92F    call        VarToBoolCustom
 0042F934    test        al,al
>0042F936    jne         0042F942
 0042F938    mov         eax,ebx
 0042F93A    call        VarToBoolViaOS
 0042F93F    mov         byte ptr [esp],al
 0042F942    movzx       eax,byte ptr [esp]
 0042F946    pop         edx
 0042F947    pop         ebx
 0042F948    ret
*}
end;

//0042F950
function @VarToBool(const V:TVarData):LongBool;
begin
{*
 0042F950    call        @VarToBoolean
 0042F955    neg         al
 0042F957    sbb         eax,eax
 0042F959    neg         eax
 0042F95B    ret
*}
end;

//0042F95C
function VarToDoubleAsString(const V:TVarData):Double;
begin
{*
 0042F95C    push        ebp
 0042F95D    mov         ebp,esp
 0042F95F    add         esp,0FFFFFFDC
 0042F962    push        ebx
 0042F963    xor         edx,edx
 0042F965    mov         dword ptr [ebp-24],edx
 0042F968    mov         dword ptr [ebp-4],edx
 0042F96B    mov         ebx,eax
 0042F96D    xor         eax,eax
 0042F96F    push        ebp
 0042F970    push        42FA17
 0042F975    push        dword ptr fs:[eax]
 0042F978    mov         dword ptr fs:[eax],esp
 0042F97B    mov         edx,ebx
 0042F97D    lea         eax,[ebp-4]
 0042F980    call        @VarToWStr
 0042F985    lea         eax,[ebp-10]
 0042F988    push        eax
 0042F989    push        0
 0042F98B    push        400
 0042F990    mov         eax,dword ptr [ebp-4]
 0042F993    push        eax
 0042F994    mov         eax,[0078D480];^gvar_00792F54
 0042F999    mov         eax,dword ptr [eax]
 0042F99B    call        eax
 0042F99D    mov         edx,eax
 0042F99F    sub         edx,80020005
>0042F9A5    je          0042F9B1
 0042F9A7    sub         edx,7FFDFFFB
>0042F9AD    jne         0042F9ED
>0042F9AF    jmp         0042F9F9
 0042F9B1    lea         eax,[ebp-24]
 0042F9B4    mov         edx,dword ptr [ebp-4]
 0042F9B7    call        @UStrFromWStr
 0042F9BC    mov         eax,dword ptr [ebp-24]
 0042F9BF    mov         ecx,dword ptr ds:[78D6A8];^gvar_00790CDC:TFormatSettings
 0042F9C5    lea         edx,[ebp-20]
 0042F9C8    call        TryStrToFloat
 0042F9CD    test        al,al
>0042F9CF    je          0042F9DA
 0042F9D1    fld         tbyte ptr [ebp-20]
 0042F9D4    fstp        qword ptr [ebp-10]
 0042F9D7    wait
>0042F9D8    jmp         0042F9F9
 0042F9DA    movzx       edx,word ptr [ebx]
 0042F9DD    mov         cx,5
 0042F9E1    mov         eax,80020005
 0042F9E6    call        VarResultCheck
>0042F9EB    jmp         0042F9F9
 0042F9ED    movzx       edx,word ptr [ebx]
 0042F9F0    mov         cx,5
 0042F9F4    call        VarResultCheck
 0042F9F9    xor         eax,eax
 0042F9FB    pop         edx
 0042F9FC    pop         ecx
 0042F9FD    pop         ecx
 0042F9FE    mov         dword ptr fs:[eax],edx
 0042FA01    push        42FA1E
 0042FA06    lea         eax,[ebp-24]
 0042FA09    call        @UStrClr
 0042FA0E    lea         eax,[ebp-4]
 0042FA11    call        @WStrClr
 0042FA16    ret
>0042FA17    jmp         @HandleFinally
>0042FA1C    jmp         0042FA06
 0042FA1E    fld         qword ptr [ebp-10]
 0042FA21    pop         ebx
 0042FA22    mov         esp,ebp
 0042FA24    pop         ebp
 0042FA25    ret
*}
end;

//0042FA28
function VarToDoubleViaOS(const V:TVarData):Double;
begin
{*
 0042FA28    push        ebx
 0042FA29    add         esp,0FFFFFFE8
 0042FA2C    mov         ebx,eax
 0042FA2E    lea         eax,[esp+8]
 0042FA32    push        eax
 0042FA33    call        oleaut32.VariantInit
 0042FA38    push        5
 0042FA3A    push        0
 0042FA3C    push        400
 0042FA41    push        ebx
 0042FA42    lea         eax,[esp+18]
 0042FA46    push        eax
 0042FA47    mov         eax,[0078D834];^gvar_00792F18
 0042FA4C    mov         eax,dword ptr [eax]
 0042FA4E    call        eax
 0042FA50    movzx       edx,word ptr [ebx]
 0042FA53    mov         cx,5
 0042FA57    call        VarResultCheck
 0042FA5C    mov         eax,dword ptr [esp+10]
 0042FA60    mov         dword ptr [esp],eax
 0042FA63    mov         eax,dword ptr [esp+14]
 0042FA67    mov         dword ptr [esp+4],eax
 0042FA6B    fld         qword ptr [esp]
 0042FA6E    add         esp,18
 0042FA71    pop         ebx
 0042FA72    ret
*}
end;

//0042FA74
function VarToDoubleAny(const V:TVarData):Double;
begin
{*
 0042FA74    push        ebp
 0042FA75    mov         ebp,esp
 0042FA77    add         esp,0FFFFFFE8
 0042FA7A    push        ebx
 0042FA7B    mov         ebx,eax
 0042FA7D    lea         eax,[ebp-18]
 0042FA80    push        eax
 0042FA81    call        oleaut32.VariantInit
 0042FA86    xor         eax,eax
 0042FA88    push        ebp
 0042FA89    push        42FAC9
 0042FA8E    push        dword ptr fs:[eax]
 0042FA91    mov         dword ptr fs:[eax],esp
 0042FA94    mov         edx,ebx
 0042FA96    lea         eax,[ebp-18]
 0042FA99    call        @VarCopy
 0042FA9E    lea         eax,[ebp-18]
 0042FAA1    call        dword ptr ds:[792F90]
 0042FAA7    lea         eax,[ebp-18]
 0042FAAA    call        @VarToDouble
 0042FAAF    fstp        qword ptr [ebp-8]
 0042FAB2    wait
 0042FAB3    xor         eax,eax
 0042FAB5    pop         edx
 0042FAB6    pop         ecx
 0042FAB7    pop         ecx
 0042FAB8    mov         dword ptr fs:[eax],edx
 0042FABB    push        42FAD0
 0042FAC0    lea         eax,[ebp-18]
 0042FAC3    call        @VarClear
 0042FAC8    ret
>0042FAC9    jmp         @HandleFinally
>0042FACE    jmp         0042FAC0
 0042FAD0    fld         qword ptr [ebp-8]
 0042FAD3    pop         ebx
 0042FAD4    mov         esp,ebp
 0042FAD6    pop         ebp
 0042FAD7    ret
*}
end;

//0042FAD8
function VarToDoubleCustom(const V:TVarData; var AValue:Double):Boolean;
begin
{*
 0042FAD8    push        ebx
 0042FAD9    push        esi
 0042FADA    push        edi
 0042FADB    add         esp,0FFFFFFEC
 0042FADE    mov         edi,edx
 0042FAE0    mov         esi,eax
 0042FAE2    mov         edx,esp
 0042FAE4    movzx       eax,word ptr [esi]
 0042FAE7    call        FindCustomVariantType
 0042FAEC    mov         ebx,eax
 0042FAEE    test        bl,bl
>0042FAF0    je          0042FB1A
 0042FAF2    lea         eax,[esp+4]
 0042FAF6    push        eax
 0042FAF7    call        oleaut32.VariantInit
 0042FAFC    push        5
 0042FAFE    mov         ecx,esi
 0042FB00    lea         edx,[esp+8]
 0042FB04    mov         eax,dword ptr [esp+4]
 0042FB08    mov         esi,dword ptr [eax]
 0042FB0A    call        dword ptr [esi+1C]
 0042FB0D    mov         eax,dword ptr [esp+0C]
 0042FB11    mov         dword ptr [edi],eax
 0042FB13    mov         eax,dword ptr [esp+10]
 0042FB17    mov         dword ptr [edi+4],eax
 0042FB1A    mov         eax,ebx
 0042FB1C    add         esp,14
 0042FB1F    pop         edi
 0042FB20    pop         esi
 0042FB21    pop         ebx
 0042FB22    ret
*}
end;

//0042FB24
function @VarToDouble(const V:TVarData):Double;
begin
{*
 0042FB24    push        ebx
 0042FB25    add         esp,0FFFFFFEC
 0042FB28    mov         ebx,eax
 0042FB2A    movzx       eax,word ptr [ebx]
 0042FB2D    movzx       edx,ax
 0042FB30    cmp         edx,15
>0042FB33    ja          0042FCF6
 0042FB39    jmp         dword ptr [edx*4+42FB40]
 0042FB39    dd          0042FB98
 0042FB39    dd          0042FBA6
 0042FB39    dd          0042FBCA
 0042FB39    dd          0042FBD6
 0042FB39    dd          0042FBE2
 0042FB39    dd          0042FBEE
 0042FB39    dd          0042FC00
 0042FB39    dd          0042FC12
 0042FB39    dd          0042FC24
 0042FB39    dd          0042FCE6
 0042FB39    dd          0042FCF6
 0042FB39    dd          0042FC34
 0042FB39    dd          0042FCD5
 0042FB39    dd          0042FCE6
 0042FB39    dd          0042FCF6
 0042FB39    dd          0042FCF6
 0042FB39    dd          0042FC49
 0042FB39    dd          0042FC5E
 0042FB39    dd          0042FC73
 0042FB39    dd          0042FC88
 0042FB39    dd          0042FCA2
 0042FB39    dd          0042FCAE
 0042FB98    xor         eax,eax
 0042FB9A    mov         dword ptr [esp],eax
 0042FB9D    mov         dword ptr [esp+4],eax
>0042FBA1    jmp         0042FF00
 0042FBA6    cmp         byte ptr ds:[784E6A],0
>0042FBAD    je          0042FBBC
 0042FBAF    mov         dx,5
 0042FBB3    mov         ax,1
 0042FBB7    call        VarCastError
 0042FBBC    xor         eax,eax
 0042FBBE    mov         dword ptr [esp],eax
 0042FBC1    mov         dword ptr [esp+4],eax
>0042FBC5    jmp         0042FF00
 0042FBCA    fild        word ptr [ebx+8]
 0042FBCD    fstp        qword ptr [esp]
 0042FBD0    wait
>0042FBD1    jmp         0042FF00
 0042FBD6    fild        dword ptr [ebx+8]
 0042FBD9    fstp        qword ptr [esp]
 0042FBDC    wait
>0042FBDD    jmp         0042FF00
 0042FBE2    fld         dword ptr [ebx+8]
 0042FBE5    fstp        qword ptr [esp]
 0042FBE8    wait
>0042FBE9    jmp         0042FF00
 0042FBEE    mov         eax,dword ptr [ebx+8]
 0042FBF1    mov         dword ptr [esp],eax
 0042FBF4    mov         eax,dword ptr [ebx+0C]
 0042FBF7    mov         dword ptr [esp+4],eax
>0042FBFB    jmp         0042FF00
 0042FC00    fild        qword ptr [ebx+8]
 0042FC03    fdiv        dword ptr ds:[42FF08]
 0042FC09    fstp        qword ptr [esp]
 0042FC0C    wait
>0042FC0D    jmp         0042FF00
 0042FC12    mov         eax,dword ptr [ebx+8]
 0042FC15    mov         dword ptr [esp],eax
 0042FC18    mov         eax,dword ptr [ebx+0C]
 0042FC1B    mov         dword ptr [esp+4],eax
>0042FC1F    jmp         0042FF00
 0042FC24    mov         eax,ebx
 0042FC26    call        VarToDoubleAsString
 0042FC2B    fstp        qword ptr [esp]
 0042FC2E    wait
>0042FC2F    jmp         0042FF00
 0042FC34    movsx       eax,word ptr [ebx+8]
 0042FC38    mov         dword ptr [esp+8],eax
 0042FC3C    fild        dword ptr [esp+8]
 0042FC40    fstp        qword ptr [esp]
 0042FC43    wait
>0042FC44    jmp         0042FF00
 0042FC49    movsx       eax,byte ptr [ebx+8]
 0042FC4D    mov         dword ptr [esp+8],eax
 0042FC51    fild        dword ptr [esp+8]
 0042FC55    fstp        qword ptr [esp]
 0042FC58    wait
>0042FC59    jmp         0042FF00
 0042FC5E    movzx       eax,byte ptr [ebx+8]
 0042FC62    mov         dword ptr [esp+8],eax
 0042FC66    fild        dword ptr [esp+8]
 0042FC6A    fstp        qword ptr [esp]
 0042FC6D    wait
>0042FC6E    jmp         0042FF00
 0042FC73    movzx       eax,word ptr [ebx+8]
 0042FC77    mov         dword ptr [esp+8],eax
 0042FC7B    fild        dword ptr [esp+8]
 0042FC7F    fstp        qword ptr [esp]
 0042FC82    wait
>0042FC83    jmp         0042FF00
 0042FC88    mov         eax,dword ptr [ebx+8]
 0042FC8B    mov         dword ptr [esp+0C],eax
 0042FC8F    xor         eax,eax
 0042FC91    mov         dword ptr [esp+10],eax
 0042FC95    fild        qword ptr [esp+0C]
 0042FC99    fstp        qword ptr [esp]
 0042FC9C    wait
>0042FC9D    jmp         0042FF00
 0042FCA2    fild        qword ptr [ebx+8]
 0042FCA5    fstp        qword ptr [esp]
 0042FCA8    wait
>0042FCA9    jmp         0042FF00
 0042FCAE    mov         eax,dword ptr [ebx+8]
 0042FCB1    mov         edx,dword ptr [ebx+0C]
 0042FCB4    mov         dword ptr [esp+0C],eax
 0042FCB8    sub         edx,80000000
 0042FCBE    mov         dword ptr [esp+10],edx
 0042FCC2    fild        qword ptr [esp+0C]
 0042FCC6    fadd        qword ptr ds:[42FF0C]
 0042FCCC    fstp        qword ptr [esp]
 0042FCCF    wait
>0042FCD0    jmp         0042FF00
 0042FCD5    mov         eax,dword ptr [ebx+8]
 0042FCD8    call        @VarToDouble
 0042FCDD    fstp        qword ptr [esp]
 0042FCE0    wait
>0042FCE1    jmp         0042FF00
 0042FCE6    mov         eax,ebx
 0042FCE8    call        VarToDoubleViaOS
 0042FCED    fstp        qword ptr [esp]
 0042FCF0    wait
>0042FCF1    jmp         0042FF00
 0042FCF6    mov         edx,eax
 0042FCF8    sub         dx,100
>0042FCFD    je          0042FD0B
 0042FCFF    dec         dx
>0042FD02    je          0042FD2B
 0042FD04    dec         dx
>0042FD07    je          0042FD1B
>0042FD09    jmp         0042FD3B
 0042FD0B    mov         eax,ebx
 0042FD0D    call        VarToDoubleAsString
 0042FD12    fstp        qword ptr [esp]
 0042FD15    wait
>0042FD16    jmp         0042FF00
 0042FD1B    mov         eax,ebx
 0042FD1D    call        VarToDoubleAsString
 0042FD22    fstp        qword ptr [esp]
 0042FD25    wait
>0042FD26    jmp         0042FF00
 0042FD2B    mov         eax,ebx
 0042FD2D    call        VarToDoubleAny
 0042FD32    fstp        qword ptr [esp]
 0042FD35    wait
>0042FD36    jmp         0042FF00
 0042FD3B    test        ah,40
>0042FD3E    je          0042FEE8
 0042FD44    movzx       eax,ax
 0042FD47    and         eax,0FFFFBFFF
 0042FD4C    cmp         eax,15
>0042FD4F    ja          0042FEDB
 0042FD55    jmp         dword ptr [eax*4+42FD5C]
 0042FD55    dd          0042FEDB
 0042FD55    dd          0042FEDB
 0042FD55    dd          0042FDB4
 0042FD55    dd          0042FDC2
 0042FD55    dd          0042FDD0
 0042FD55    dd          0042FDDE
 0042FD55    dd          0042FDF2
 0042FD55    dd          0042FE06
 0042FD55    dd          0042FE1A
 0042FD55    dd          0042FEDB
 0042FD55    dd          0042FEDB
 0042FD55    dd          0042FE2A
 0042FD55    dd          0042FECD
 0042FD55    dd          0042FEDB
 0042FD55    dd          0042FEDB
 0042FD55    dd          0042FEDB
 0042FD55    dd          0042FE41
 0042FD55    dd          0042FE58
 0042FD55    dd          0042FE6F
 0042FD55    dd          0042FE83
 0042FD55    dd          0042FE9C
 0042FD55    dd          0042FEA7
 0042FDB4    mov         eax,dword ptr [ebx+8]
 0042FDB7    fild        word ptr [eax]
 0042FDB9    fstp        qword ptr [esp]
 0042FDBC    wait
>0042FDBD    jmp         0042FF00
 0042FDC2    mov         eax,dword ptr [ebx+8]
 0042FDC5    fild        dword ptr [eax]
 0042FDC7    fstp        qword ptr [esp]
 0042FDCA    wait
>0042FDCB    jmp         0042FF00
 0042FDD0    mov         eax,dword ptr [ebx+8]
 0042FDD3    fld         dword ptr [eax]
 0042FDD5    fstp        qword ptr [esp]
 0042FDD8    wait
>0042FDD9    jmp         0042FF00
 0042FDDE    mov         eax,dword ptr [ebx+8]
 0042FDE1    mov         edx,dword ptr [eax]
 0042FDE3    mov         dword ptr [esp],edx
 0042FDE6    mov         edx,dword ptr [eax+4]
 0042FDE9    mov         dword ptr [esp+4],edx
>0042FDED    jmp         0042FF00
 0042FDF2    mov         eax,dword ptr [ebx+8]
 0042FDF5    fild        qword ptr [eax]
 0042FDF7    fdiv        dword ptr ds:[42FF08]
 0042FDFD    fstp        qword ptr [esp]
 0042FE00    wait
>0042FE01    jmp         0042FF00
 0042FE06    mov         eax,dword ptr [ebx+8]
 0042FE09    mov         edx,dword ptr [eax]
 0042FE0B    mov         dword ptr [esp],edx
 0042FE0E    mov         edx,dword ptr [eax+4]
 0042FE11    mov         dword ptr [esp+4],edx
>0042FE15    jmp         0042FF00
 0042FE1A    mov         eax,ebx
 0042FE1C    call        VarToDoubleAsString
 0042FE21    fstp        qword ptr [esp]
 0042FE24    wait
>0042FE25    jmp         0042FF00
 0042FE2A    mov         eax,dword ptr [ebx+8]
 0042FE2D    movsx       eax,word ptr [eax]
 0042FE30    mov         dword ptr [esp+8],eax
 0042FE34    fild        dword ptr [esp+8]
 0042FE38    fstp        qword ptr [esp]
 0042FE3B    wait
>0042FE3C    jmp         0042FF00
 0042FE41    mov         eax,dword ptr [ebx+8]
 0042FE44    movsx       eax,byte ptr [eax]
 0042FE47    mov         dword ptr [esp+8],eax
 0042FE4B    fild        dword ptr [esp+8]
 0042FE4F    fstp        qword ptr [esp]
 0042FE52    wait
>0042FE53    jmp         0042FF00
 0042FE58    mov         eax,dword ptr [ebx+8]
 0042FE5B    movzx       eax,byte ptr [eax]
 0042FE5E    mov         dword ptr [esp+8],eax
 0042FE62    fild        dword ptr [esp+8]
 0042FE66    fstp        qword ptr [esp]
 0042FE69    wait
>0042FE6A    jmp         0042FF00
 0042FE6F    mov         eax,dword ptr [ebx+8]
 0042FE72    movzx       eax,word ptr [eax]
 0042FE75    mov         dword ptr [esp+8],eax
 0042FE79    fild        dword ptr [esp+8]
 0042FE7D    fstp        qword ptr [esp]
 0042FE80    wait
>0042FE81    jmp         0042FF00
 0042FE83    mov         eax,dword ptr [ebx+8]
 0042FE86    mov         eax,dword ptr [eax]
 0042FE88    mov         dword ptr [esp+0C],eax
 0042FE8C    xor         eax,eax
 0042FE8E    mov         dword ptr [esp+10],eax
 0042FE92    fild        qword ptr [esp+0C]
 0042FE96    fstp        qword ptr [esp]
 0042FE99    wait
>0042FE9A    jmp         0042FF00
 0042FE9C    mov         eax,dword ptr [ebx+8]
 0042FE9F    fild        qword ptr [eax]
 0042FEA1    fstp        qword ptr [esp]
 0042FEA4    wait
>0042FEA5    jmp         0042FF00
 0042FEA7    mov         eax,dword ptr [ebx+8]
 0042FEAA    mov         edx,dword ptr [eax+4]
 0042FEAD    mov         eax,dword ptr [eax]
 0042FEAF    mov         dword ptr [esp+0C],eax
 0042FEB3    sub         edx,80000000
 0042FEB9    mov         dword ptr [esp+10],edx
 0042FEBD    fild        qword ptr [esp+0C]
 0042FEC1    fadd        qword ptr ds:[42FF0C]
 0042FEC7    fstp        qword ptr [esp]
 0042FECA    wait
>0042FECB    jmp         0042FF00
 0042FECD    mov         eax,dword ptr [ebx+8]
 0042FED0    call        @VarToDouble
 0042FED5    fstp        qword ptr [esp]
 0042FED8    wait
>0042FED9    jmp         0042FF00
 0042FEDB    mov         eax,ebx
 0042FEDD    call        VarToDoubleViaOS
 0042FEE2    fstp        qword ptr [esp]
 0042FEE5    wait
>0042FEE6    jmp         0042FF00
 0042FEE8    mov         edx,esp
 0042FEEA    mov         eax,ebx
 0042FEEC    call        VarToDoubleCustom
 0042FEF1    test        al,al
>0042FEF3    jne         0042FF00
 0042FEF5    mov         eax,ebx
 0042FEF7    call        VarToDoubleViaOS
 0042FEFC    fstp        qword ptr [esp]
 0042FEFF    wait
 0042FF00    fld         qword ptr [esp]
 0042FF03    add         esp,14
 0042FF06    pop         ebx
 0042FF07    ret
*}
end;

//0042FF14
function @VarToReal(const V:TVarData):Extended;
begin
{*
 0042FF14    push        ebx
 0042FF15    add         esp,0FFFFFFF4
 0042FF18    mov         ebx,eax
 0042FF1A    mov         eax,ebx
 0042FF1C    call        @VarToDouble
 0042FF21    fstp        tbyte ptr [esp]
 0042FF24    wait
 0042FF25    fld         tbyte ptr [esp]
 0042FF28    add         esp,0C
 0042FF2B    pop         ebx
 0042FF2C    ret
*}
end;

//0042FF30
function @VarToSingle(const V:TVarData):Single;
begin
{*
 0042FF30    push        ebp
 0042FF31    mov         ebp,esp
 0042FF33    add         esp,0FFFFFFEC
 0042FF36    push        ebx
 0042FF37    push        esi
 0042FF38    push        edi
 0042FF39    mov         dword ptr [ebp-4],eax
 0042FF3C    mov         eax,dword ptr [ebp-4]
 0042FF3F    movzx       eax,word ptr [eax]
 0042FF42    cmp         eax,15
>0042FF45    ja          0043009F
 0042FF4B    jmp         dword ptr [eax*4+42FF52]
 0042FF4B    dd          0042FFAA
 0042FF4B    dd          0042FFB4
 0042FF4B    dd          0042FFD4
 0042FF4B    dd          0042FFE3
 0042FF4B    dd          0042FFF2
 0042FF4B    dd          0043009F
 0042FF4B    dd          0043009F
 0042FF4B    dd          0043009F
 0042FF4B    dd          0043009F
 0042FF4B    dd          0043009F
 0042FF4B    dd          0043009F
 0042FF4B    dd          00430000
 0042FF4B    dd          0043009F
 0042FF4B    dd          0043009F
 0042FF4B    dd          0043009F
 0042FF4B    dd          0043009F
 0042FF4B    dd          00430016
 0042FF4B    dd          0043002C
 0042FF4B    dd          00430042
 0042FF4B    dd          00430058
 0042FF4B    dd          0043006F
 0042FF4B    dd          0043007B
 0042FFAA    xor         eax,eax
 0042FFAC    mov         dword ptr [ebp-8],eax
>0042FFAF    jmp         004300E1
 0042FFB4    cmp         byte ptr ds:[784E6A],0
>0042FFBB    je          0042FFCA
 0042FFBD    mov         dx,4
 0042FFC1    mov         ax,1
 0042FFC5    call        VarCastError
 0042FFCA    xor         eax,eax
 0042FFCC    mov         dword ptr [ebp-8],eax
>0042FFCF    jmp         004300E1
 0042FFD4    mov         eax,dword ptr [ebp-4]
 0042FFD7    fild        word ptr [eax+8]
 0042FFDA    fstp        dword ptr [ebp-8]
 0042FFDD    wait
>0042FFDE    jmp         004300E1
 0042FFE3    mov         eax,dword ptr [ebp-4]
 0042FFE6    fild        dword ptr [eax+8]
 0042FFE9    fstp        dword ptr [ebp-8]
 0042FFEC    wait
>0042FFED    jmp         004300E1
 0042FFF2    mov         eax,dword ptr [ebp-4]
 0042FFF5    mov         eax,dword ptr [eax+8]
 0042FFF8    mov         dword ptr [ebp-8],eax
>0042FFFB    jmp         004300E1
 00430000    mov         eax,dword ptr [ebp-4]
 00430003    movsx       eax,word ptr [eax+8]
 00430007    mov         dword ptr [ebp-0C],eax
 0043000A    fild        dword ptr [ebp-0C]
 0043000D    fstp        dword ptr [ebp-8]
 00430010    wait
>00430011    jmp         004300E1
 00430016    mov         eax,dword ptr [ebp-4]
 00430019    movsx       eax,byte ptr [eax+8]
 0043001D    mov         dword ptr [ebp-0C],eax
 00430020    fild        dword ptr [ebp-0C]
 00430023    fstp        dword ptr [ebp-8]
 00430026    wait
>00430027    jmp         004300E1
 0043002C    mov         eax,dword ptr [ebp-4]
 0043002F    movzx       eax,byte ptr [eax+8]
 00430033    mov         dword ptr [ebp-0C],eax
 00430036    fild        dword ptr [ebp-0C]
 00430039    fstp        dword ptr [ebp-8]
 0043003C    wait
>0043003D    jmp         004300E1
 00430042    mov         eax,dword ptr [ebp-4]
 00430045    movzx       eax,word ptr [eax+8]
 00430049    mov         dword ptr [ebp-0C],eax
 0043004C    fild        dword ptr [ebp-0C]
 0043004F    fstp        dword ptr [ebp-8]
 00430052    wait
>00430053    jmp         004300E1
 00430058    mov         eax,dword ptr [ebp-4]
 0043005B    mov         eax,dword ptr [eax+8]
 0043005E    mov         dword ptr [ebp-14],eax
 00430061    xor         eax,eax
 00430063    mov         dword ptr [ebp-10],eax
 00430066    fild        qword ptr [ebp-14]
 00430069    fstp        dword ptr [ebp-8]
 0043006C    wait
>0043006D    jmp         004300E1
 0043006F    mov         eax,dword ptr [ebp-4]
 00430072    fild        qword ptr [eax+8]
 00430075    fstp        dword ptr [ebp-8]
 00430078    wait
>00430079    jmp         004300E1
 0043007B    mov         eax,dword ptr [ebp-4]
 0043007E    mov         edx,dword ptr [eax+0C]
 00430081    mov         eax,dword ptr [eax+8]
 00430084    mov         dword ptr [ebp-14],eax
 00430087    sub         edx,80000000
 0043008D    mov         dword ptr [ebp-10],edx
 00430090    fild        qword ptr [ebp-14]
 00430093    fadd        qword ptr ds:[4300EC]
 00430099    fstp        dword ptr [ebp-8]
 0043009C    wait
>0043009D    jmp         004300E1
 0043009F    xor         eax,eax
 004300A1    push        ebp
 004300A2    push        4300C3
 004300A7    push        dword ptr fs:[eax]
 004300AA    mov         dword ptr fs:[eax],esp
 004300AD    mov         eax,dword ptr [ebp-4]
 004300B0    call        @VarToDouble
 004300B5    fstp        dword ptr [ebp-8]
 004300B8    wait
 004300B9    xor         eax,eax
 004300BB    pop         edx
 004300BC    pop         ecx
 004300BD    pop         ecx
 004300BE    mov         dword ptr fs:[eax],edx
>004300C1    jmp         004300E1
>004300C3    jmp         @HandleAnyException
 004300C8    mov         eax,dword ptr [ebp-4]
 004300CB    movzx       eax,word ptr [eax]
 004300CE    mov         dx,4
 004300D2    call        HandleConversionException
 004300D7    xor         eax,eax
 004300D9    mov         dword ptr [ebp-8],eax
 004300DC    call        @DoneExcept
 004300E1    fld         dword ptr [ebp-8]
 004300E4    pop         edi
 004300E5    pop         esi
 004300E6    pop         ebx
 004300E7    mov         esp,ebp
 004300E9    pop         ebp
 004300EA    ret
*}
end;

//004300F4
function VarToDateAsString(const V:TVarData):TDateTime;
begin
{*
 004300F4    push        ebp
 004300F5    mov         ebp,esp
 004300F7    add         esp,0FFFFFFE0
 004300FA    push        ebx
 004300FB    xor         edx,edx
 004300FD    mov         dword ptr [ebp-20],edx
 00430100    mov         dword ptr [ebp-1C],edx
 00430103    mov         dword ptr [ebp-4],edx
 00430106    mov         ebx,eax
 00430108    xor         eax,eax
 0043010A    push        ebp
 0043010B    push        4301DC
 00430110    push        dword ptr fs:[eax]
 00430113    mov         dword ptr fs:[eax],esp
 00430116    mov         edx,ebx
 00430118    lea         eax,[ebp-4]
 0043011B    call        @VarToWStr
 00430120    lea         eax,[ebp-10]
 00430123    push        eax
 00430124    push        0
 00430126    push        400
 0043012B    mov         eax,dword ptr [ebp-4]
 0043012E    push        eax
 0043012F    mov         eax,[0078CF58];^gvar_00792F58
 00430134    mov         eax,dword ptr [eax]
 00430136    call        eax
 00430138    mov         edx,eax
 0043013A    sub         edx,80020005
>00430140    je          0043014C
 00430142    sub         edx,7FFDFFFB
>00430148    jne         004301AD
>0043014A    jmp         004301B9
 0043014C    lea         eax,[ebp-1C]
 0043014F    mov         edx,dword ptr [ebp-4]
 00430152    call        @UStrFromWStr
 00430157    mov         eax,dword ptr [ebp-1C]
 0043015A    mov         ecx,dword ptr ds:[78D6A8];^gvar_00790CDC:TFormatSettings
 00430160    lea         edx,[ebp-10]
 00430163    call        TryStrToDate
 00430168    test        al,al
>0043016A    jne         004301B9
 0043016C    lea         eax,[ebp-20]
 0043016F    mov         edx,dword ptr [ebp-4]
 00430172    call        @UStrFromWStr
 00430177    mov         eax,dword ptr [ebp-20]
 0043017A    mov         ecx,dword ptr ds:[78D6A8];^gvar_00790CDC:TFormatSettings
 00430180    lea         edx,[ebp-18]
 00430183    call        TryStrToFloat
 00430188    test        al,al
>0043018A    je          0043019A
 0043018C    mov         eax,dword ptr [ebp-18]
 0043018F    mov         dword ptr [ebp-10],eax
 00430192    mov         eax,dword ptr [ebp-14]
 00430195    mov         dword ptr [ebp-0C],eax
>00430198    jmp         004301B9
 0043019A    movzx       edx,word ptr [ebx]
 0043019D    mov         cx,7
 004301A1    mov         eax,80020005
 004301A6    call        VarResultCheck
>004301AB    jmp         004301B9
 004301AD    movzx       edx,word ptr [ebx]
 004301B0    mov         cx,7
 004301B4    call        VarResultCheck
 004301B9    xor         eax,eax
 004301BB    pop         edx
 004301BC    pop         ecx
 004301BD    pop         ecx
 004301BE    mov         dword ptr fs:[eax],edx
 004301C1    push        4301E3
 004301C6    lea         eax,[ebp-20]
 004301C9    mov         edx,2
 004301CE    call        @UStrArrayClr
 004301D3    lea         eax,[ebp-4]
 004301D6    call        @WStrClr
 004301DB    ret
>004301DC    jmp         @HandleFinally
>004301E1    jmp         004301C6
 004301E3    fld         qword ptr [ebp-10]
 004301E6    pop         ebx
 004301E7    mov         esp,ebp
 004301E9    pop         ebp
 004301EA    ret
*}
end;

//004301EC
function VarToDateAsDouble(const V:TVarData; const Value:Double):TDateTime;
begin
{*
 004301EC    push        ebp
 004301ED    mov         ebp,esp
 004301EF    add         esp,0FFFFFFE8
 004301F2    push        ebx
 004301F3    mov         ebx,eax
 004301F5    lea         eax,[ebp-18]
 004301F8    push        eax
 004301F9    call        oleaut32.VariantInit
 004301FE    mov         word ptr [ebp-18],5
 00430204    mov         eax,dword ptr [ebp+8]
 00430207    mov         dword ptr [ebp-10],eax
 0043020A    mov         eax,dword ptr [ebp+0C]
 0043020D    mov         dword ptr [ebp-0C],eax
 00430210    push        7
 00430212    push        0
 00430214    push        400
 00430219    lea         eax,[ebp-18]
 0043021C    push        eax
 0043021D    lea         eax,[ebp-18]
 00430220    push        eax
 00430221    mov         eax,[0078D834];^gvar_00792F18
 00430226    mov         eax,dword ptr [eax]
 00430228    call        eax
 0043022A    movzx       edx,word ptr [ebx]
 0043022D    mov         cx,7
 00430231    call        VarResultCheck
 00430236    mov         eax,dword ptr [ebp-10]
 00430239    mov         dword ptr [ebp-8],eax
 0043023C    mov         eax,dword ptr [ebp-0C]
 0043023F    mov         dword ptr [ebp-4],eax
 00430242    fld         qword ptr [ebp-8]
 00430245    pop         ebx
 00430246    mov         esp,ebp
 00430248    pop         ebp
 00430249    ret         8
*}
end;

//0043024C
function VarToDateViaOS(const V:TVarData):TDateTime;
begin
{*
 0043024C    push        ebx
 0043024D    add         esp,0FFFFFFE8
 00430250    mov         ebx,eax
 00430252    lea         eax,[esp+8]
 00430256    push        eax
 00430257    call        oleaut32.VariantInit
 0043025C    push        7
 0043025E    push        0
 00430260    push        400
 00430265    push        ebx
 00430266    lea         eax,[esp+18]
 0043026A    push        eax
 0043026B    mov         eax,[0078D834];^gvar_00792F18
 00430270    mov         eax,dword ptr [eax]
 00430272    call        eax
 00430274    movzx       edx,word ptr [ebx]
 00430277    mov         cx,7
 0043027B    call        VarResultCheck
 00430280    mov         eax,dword ptr [esp+10]
 00430284    mov         dword ptr [esp],eax
 00430287    mov         eax,dword ptr [esp+14]
 0043028B    mov         dword ptr [esp+4],eax
 0043028F    fld         qword ptr [esp]
 00430292    add         esp,18
 00430295    pop         ebx
 00430296    ret
*}
end;

//00430298
function VarToDateAny(const V:TVarData):TDateTime;
begin
{*
 00430298    push        ebp
 00430299    mov         ebp,esp
 0043029B    add         esp,0FFFFFFE8
 0043029E    push        ebx
 0043029F    mov         ebx,eax
 004302A1    lea         eax,[ebp-18]
 004302A4    push        eax
 004302A5    call        oleaut32.VariantInit
 004302AA    xor         eax,eax
 004302AC    push        ebp
 004302AD    push        4302ED
 004302B2    push        dword ptr fs:[eax]
 004302B5    mov         dword ptr fs:[eax],esp
 004302B8    mov         edx,ebx
 004302BA    lea         eax,[ebp-18]
 004302BD    call        @VarCopy
 004302C2    lea         eax,[ebp-18]
 004302C5    call        dword ptr ds:[792F90]
 004302CB    lea         eax,[ebp-18]
 004302CE    call        @VarToDate
 004302D3    fstp        qword ptr [ebp-8]
 004302D6    wait
 004302D7    xor         eax,eax
 004302D9    pop         edx
 004302DA    pop         ecx
 004302DB    pop         ecx
 004302DC    mov         dword ptr fs:[eax],edx
 004302DF    push        4302F4
 004302E4    lea         eax,[ebp-18]
 004302E7    call        @VarClear
 004302EC    ret
>004302ED    jmp         @HandleFinally
>004302F2    jmp         004302E4
 004302F4    fld         qword ptr [ebp-8]
 004302F7    pop         ebx
 004302F8    mov         esp,ebp
 004302FA    pop         ebp
 004302FB    ret
*}
end;

//004302FC
function VarToDateCustom(const V:TVarData; var AValue:TDateTime):Boolean;
begin
{*
 004302FC    push        ebx
 004302FD    push        esi
 004302FE    push        edi
 004302FF    add         esp,0FFFFFFEC
 00430302    mov         edi,edx
 00430304    mov         esi,eax
 00430306    mov         edx,esp
 00430308    movzx       eax,word ptr [esi]
 0043030B    call        FindCustomVariantType
 00430310    mov         ebx,eax
 00430312    test        bl,bl
>00430314    je          0043033E
 00430316    lea         eax,[esp+4]
 0043031A    push        eax
 0043031B    call        oleaut32.VariantInit
 00430320    push        7
 00430322    mov         ecx,esi
 00430324    lea         edx,[esp+8]
 00430328    mov         eax,dword ptr [esp+4]
 0043032C    mov         esi,dword ptr [eax]
 0043032E    call        dword ptr [esi+1C]
 00430331    mov         eax,dword ptr [esp+0C]
 00430335    mov         dword ptr [edi],eax
 00430337    mov         eax,dword ptr [esp+10]
 0043033B    mov         dword ptr [edi+4],eax
 0043033E    mov         eax,ebx
 00430340    add         esp,14
 00430343    pop         edi
 00430344    pop         esi
 00430345    pop         ebx
 00430346    ret
*}
end;

//00430348
function @VarToDate(const V:TVarData):TDateTime;
begin
{*
 00430348    push        ebx
 00430349    add         esp,0FFFFFFEC
 0043034C    mov         ebx,eax
 0043034E    movzx       eax,word ptr [ebx]
 00430351    movzx       edx,ax
 00430354    cmp         edx,15
>00430357    ja          00430516
 0043035D    jmp         dword ptr [edx*4+430364]
 0043035D    dd          004303BC
 0043035D    dd          004303CA
 0043035D    dd          004303EE
 0043035D    dd          004303FA
 0043035D    dd          00430406
 0043035D    dd          00430406
 0043035D    dd          00430406
 0043035D    dd          00430416
 0043035D    dd          00430428
 0043035D    dd          00430506
 0043035D    dd          00430516
 0043035D    dd          00430438
 0043035D    dd          004304F5
 0043035D    dd          00430506
 0043035D    dd          00430516
 0043035D    dd          00430516
 0043035D    dd          0043044D
 0043035D    dd          00430462
 0043035D    dd          00430477
 0043035D    dd          0043048C
 0043035D    dd          004304A6
 0043035D    dd          004304C0
 004303BC    xor         eax,eax
 004303BE    mov         dword ptr [esp],eax
 004303C1    mov         dword ptr [esp+4],eax
>004303C5    jmp         0043071C
 004303CA    cmp         byte ptr ds:[784E6A],0
>004303D1    je          004303E0
 004303D3    mov         dx,7
 004303D7    mov         ax,1
 004303DB    call        VarCastError
 004303E0    xor         eax,eax
 004303E2    mov         dword ptr [esp],eax
 004303E5    mov         dword ptr [esp+4],eax
>004303E9    jmp         0043071C
 004303EE    fild        word ptr [ebx+8]
 004303F1    fstp        qword ptr [esp]
 004303F4    wait
>004303F5    jmp         0043071C
 004303FA    fild        dword ptr [ebx+8]
 004303FD    fstp        qword ptr [esp]
 00430400    wait
>00430401    jmp         0043071C
 00430406    mov         eax,ebx
 00430408    call        VarToDateViaOS
 0043040D    fstp        qword ptr [esp]
 00430410    wait
>00430411    jmp         0043071C
 00430416    mov         eax,dword ptr [ebx+8]
 00430419    mov         dword ptr [esp],eax
 0043041C    mov         eax,dword ptr [ebx+0C]
 0043041F    mov         dword ptr [esp+4],eax
>00430423    jmp         0043071C
 00430428    mov         eax,ebx
 0043042A    call        VarToDateAsString
 0043042F    fstp        qword ptr [esp]
 00430432    wait
>00430433    jmp         0043071C
 00430438    movsx       eax,word ptr [ebx+8]
 0043043C    mov         dword ptr [esp+8],eax
 00430440    fild        dword ptr [esp+8]
 00430444    fstp        qword ptr [esp]
 00430447    wait
>00430448    jmp         0043071C
 0043044D    movsx       eax,byte ptr [ebx+8]
 00430451    mov         dword ptr [esp+8],eax
 00430455    fild        dword ptr [esp+8]
 00430459    fstp        qword ptr [esp]
 0043045C    wait
>0043045D    jmp         0043071C
 00430462    movzx       eax,byte ptr [ebx+8]
 00430466    mov         dword ptr [esp+8],eax
 0043046A    fild        dword ptr [esp+8]
 0043046E    fstp        qword ptr [esp]
 00430471    wait
>00430472    jmp         0043071C
 00430477    movzx       eax,word ptr [ebx+8]
 0043047B    mov         dword ptr [esp+8],eax
 0043047F    fild        dword ptr [esp+8]
 00430483    fstp        qword ptr [esp]
 00430486    wait
>00430487    jmp         0043071C
 0043048C    mov         eax,dword ptr [ebx+8]
 0043048F    mov         dword ptr [esp+0C],eax
 00430493    xor         eax,eax
 00430495    mov         dword ptr [esp+10],eax
 00430499    fild        qword ptr [esp+0C]
 0043049D    fstp        qword ptr [esp]
 004304A0    wait
>004304A1    jmp         0043071C
 004304A6    fild        qword ptr [ebx+8]
 004304A9    add         esp,0FFFFFFF8
 004304AC    fstp        qword ptr [esp]
 004304AF    wait
 004304B0    mov         eax,ebx
 004304B2    call        VarToDateAsDouble
 004304B7    fstp        qword ptr [esp]
 004304BA    wait
>004304BB    jmp         0043071C
 004304C0    mov         eax,dword ptr [ebx+8]
 004304C3    mov         edx,dword ptr [ebx+0C]
 004304C6    mov         dword ptr [esp+0C],eax
 004304CA    sub         edx,80000000
 004304D0    mov         dword ptr [esp+10],edx
 004304D4    fild        qword ptr [esp+0C]
 004304D8    fadd        qword ptr ds:[430724]
 004304DE    add         esp,0FFFFFFF8
 004304E1    fstp        qword ptr [esp]
 004304E4    wait
 004304E5    mov         eax,ebx
 004304E7    call        VarToDateAsDouble
 004304EC    fstp        qword ptr [esp]
 004304EF    wait
>004304F0    jmp         0043071C
 004304F5    mov         eax,dword ptr [ebx+8]
 004304F8    call        @VarToDate
 004304FD    fstp        qword ptr [esp]
 00430500    wait
>00430501    jmp         0043071C
 00430506    mov         eax,ebx
 00430508    call        VarToDateViaOS
 0043050D    fstp        qword ptr [esp]
 00430510    wait
>00430511    jmp         0043071C
 00430516    mov         edx,eax
 00430518    sub         dx,100
>0043051D    je          0043052B
 0043051F    dec         dx
>00430522    je          0043054B
 00430524    dec         dx
>00430527    je          0043053B
>00430529    jmp         0043055B
 0043052B    mov         eax,ebx
 0043052D    call        VarToDateAsString
 00430532    fstp        qword ptr [esp]
 00430535    wait
>00430536    jmp         0043071C
 0043053B    mov         eax,ebx
 0043053D    call        VarToDateAsString
 00430542    fstp        qword ptr [esp]
 00430545    wait
>00430546    jmp         0043071C
 0043054B    mov         eax,ebx
 0043054D    call        VarToDateAny
 00430552    fstp        qword ptr [esp]
 00430555    wait
>00430556    jmp         0043071C
 0043055B    test        ah,40
>0043055E    je          00430704
 00430564    movzx       eax,ax
 00430567    and         eax,0FFFFBFFF
 0043056C    cmp         eax,15
>0043056F    ja          004306F7
 00430575    jmp         dword ptr [eax*4+43057C]
 00430575    dd          004306F7
 00430575    dd          004306F7
 00430575    dd          004305D4
 00430575    dd          004305E2
 00430575    dd          004305F0
 00430575    dd          004305F0
 00430575    dd          004305F0
 00430575    dd          00430600
 00430575    dd          00430614
 00430575    dd          004306F7
 00430575    dd          004306F7
 00430575    dd          00430624
 00430575    dd          004306E9
 00430575    dd          004306F7
 00430575    dd          004306F7
 00430575    dd          004306F7
 00430575    dd          0043063B
 00430575    dd          00430652
 00430575    dd          00430669
 00430575    dd          00430680
 00430575    dd          0043069C
 00430575    dd          004306B5
 004305D4    mov         eax,dword ptr [ebx+8]
 004305D7    fild        word ptr [eax]
 004305D9    fstp        qword ptr [esp]
 004305DC    wait
>004305DD    jmp         0043071C
 004305E2    mov         eax,dword ptr [ebx+8]
 004305E5    fild        dword ptr [eax]
 004305E7    fstp        qword ptr [esp]
 004305EA    wait
>004305EB    jmp         0043071C
 004305F0    mov         eax,ebx
 004305F2    call        VarToDateViaOS
 004305F7    fstp        qword ptr [esp]
 004305FA    wait
>004305FB    jmp         0043071C
 00430600    mov         eax,dword ptr [ebx+8]
 00430603    mov         edx,dword ptr [eax]
 00430605    mov         dword ptr [esp],edx
 00430608    mov         edx,dword ptr [eax+4]
 0043060B    mov         dword ptr [esp+4],edx
>0043060F    jmp         0043071C
 00430614    mov         eax,ebx
 00430616    call        VarToDateAsString
 0043061B    fstp        qword ptr [esp]
 0043061E    wait
>0043061F    jmp         0043071C
 00430624    mov         eax,dword ptr [ebx+8]
 00430627    movsx       eax,word ptr [eax]
 0043062A    mov         dword ptr [esp+8],eax
 0043062E    fild        dword ptr [esp+8]
 00430632    fstp        qword ptr [esp]
 00430635    wait
>00430636    jmp         0043071C
 0043063B    mov         eax,dword ptr [ebx+8]
 0043063E    movsx       eax,byte ptr [eax]
 00430641    mov         dword ptr [esp+8],eax
 00430645    fild        dword ptr [esp+8]
 00430649    fstp        qword ptr [esp]
 0043064C    wait
>0043064D    jmp         0043071C
 00430652    mov         eax,dword ptr [ebx+8]
 00430655    movzx       eax,byte ptr [eax]
 00430658    mov         dword ptr [esp+8],eax
 0043065C    fild        dword ptr [esp+8]
 00430660    fstp        qword ptr [esp]
 00430663    wait
>00430664    jmp         0043071C
 00430669    mov         eax,dword ptr [ebx+8]
 0043066C    movzx       eax,word ptr [eax]
 0043066F    mov         dword ptr [esp+8],eax
 00430673    fild        dword ptr [esp+8]
 00430677    fstp        qword ptr [esp]
 0043067A    wait
>0043067B    jmp         0043071C
 00430680    mov         eax,dword ptr [ebx+8]
 00430683    mov         eax,dword ptr [eax]
 00430685    mov         dword ptr [esp+0C],eax
 00430689    xor         eax,eax
 0043068B    mov         dword ptr [esp+10],eax
 0043068F    fild        qword ptr [esp+0C]
 00430693    fstp        qword ptr [esp]
 00430696    wait
>00430697    jmp         0043071C
 0043069C    mov         eax,dword ptr [ebx+8]
 0043069F    fild        qword ptr [eax]
 004306A1    add         esp,0FFFFFFF8
 004306A4    fstp        qword ptr [esp]
 004306A7    wait
 004306A8    mov         eax,ebx
 004306AA    call        VarToDateAsDouble
 004306AF    fstp        qword ptr [esp]
 004306B2    wait
>004306B3    jmp         0043071C
 004306B5    mov         eax,dword ptr [ebx+8]
 004306B8    mov         edx,dword ptr [eax+4]
 004306BB    mov         eax,dword ptr [eax]
 004306BD    mov         dword ptr [esp+0C],eax
 004306C1    sub         edx,80000000
 004306C7    mov         dword ptr [esp+10],edx
 004306CB    fild        qword ptr [esp+0C]
 004306CF    fadd        qword ptr ds:[430724]
 004306D5    add         esp,0FFFFFFF8
 004306D8    fstp        qword ptr [esp]
 004306DB    wait
 004306DC    mov         eax,ebx
 004306DE    call        VarToDateAsDouble
 004306E3    fstp        qword ptr [esp]
 004306E6    wait
>004306E7    jmp         0043071C
 004306E9    mov         eax,dword ptr [ebx+8]
 004306EC    call        @VarToDate
 004306F1    fstp        qword ptr [esp]
 004306F4    wait
>004306F5    jmp         0043071C
 004306F7    mov         eax,ebx
 004306F9    call        VarToDateViaOS
 004306FE    fstp        qword ptr [esp]
 00430701    wait
>00430702    jmp         0043071C
 00430704    mov         edx,esp
 00430706    mov         eax,ebx
 00430708    call        VarToDateCustom
 0043070D    test        al,al
>0043070F    jne         0043071C
 00430711    mov         eax,ebx
 00430713    call        VarToDateViaOS
 00430718    fstp        qword ptr [esp]
 0043071B    wait
 0043071C    fld         qword ptr [esp]
 0043071F    add         esp,14
 00430722    pop         ebx
 00430723    ret
*}
end;

//0043072C
function VarToCurrencyAsString(const V:TVarData):Currency;
begin
{*
 0043072C    push        ebp
 0043072D    mov         ebp,esp
 0043072F    add         esp,0FFFFFFEC
 00430732    push        ebx
 00430733    xor         edx,edx
 00430735    mov         dword ptr [ebp-14],edx
 00430738    mov         dword ptr [ebp-4],edx
 0043073B    mov         ebx,eax
 0043073D    xor         eax,eax
 0043073F    push        ebp
 00430740    push        4307DE
 00430745    push        dword ptr fs:[eax]
 00430748    mov         dword ptr fs:[eax],esp
 0043074B    mov         edx,ebx
 0043074D    lea         eax,[ebp-4]
 00430750    call        @VarToWStr
 00430755    lea         eax,[ebp-10]
 00430758    push        eax
 00430759    push        0
 0043075B    push        400
 00430760    mov         eax,dword ptr [ebp-4]
 00430763    push        eax
 00430764    mov         eax,[0078D9F0];^gvar_00792F5C
 00430769    mov         eax,dword ptr [eax]
 0043076B    call        eax
 0043076D    mov         edx,eax
 0043076F    sub         edx,80020005
>00430775    je          00430781
 00430777    sub         edx,7FFDFFFB
>0043077D    jne         004307B4
>0043077F    jmp         004307C0
 00430781    lea         eax,[ebp-14]
 00430784    mov         edx,dword ptr [ebp-4]
 00430787    call        @UStrFromWStr
 0043078C    mov         eax,dword ptr [ebp-14]
 0043078F    mov         ecx,dword ptr ds:[78D6A8];^gvar_00790CDC:TFormatSettings
 00430795    lea         edx,[ebp-10]
 00430798    call        TryStrToCurr
 0043079D    test        al,al
>0043079F    jne         004307C0
 004307A1    movzx       edx,word ptr [ebx]
 004307A4    mov         cx,6
 004307A8    mov         eax,80020005
 004307AD    call        VarResultCheck
>004307B2    jmp         004307C0
 004307B4    movzx       edx,word ptr [ebx]
 004307B7    mov         cx,6
 004307BB    call        VarResultCheck
 004307C0    xor         eax,eax
 004307C2    pop         edx
 004307C3    pop         ecx
 004307C4    pop         ecx
 004307C5    mov         dword ptr fs:[eax],edx
 004307C8    push        4307E5
 004307CD    lea         eax,[ebp-14]
 004307D0    call        @UStrClr
 004307D5    lea         eax,[ebp-4]
 004307D8    call        @WStrClr
 004307DD    ret
>004307DE    jmp         @HandleFinally
>004307E3    jmp         004307CD
 004307E5    fild        qword ptr [ebp-10]
 004307E8    pop         ebx
 004307E9    mov         esp,ebp
 004307EB    pop         ebp
 004307EC    ret
*}
end;

//004307F0
function VarToCurrencyAsDouble(const V:TVarData; const Value:Double):Currency;
begin
{*
 004307F0    push        ebp
 004307F1    mov         ebp,esp
 004307F3    add         esp,0FFFFFFE8
 004307F6    push        ebx
 004307F7    mov         ebx,eax
 004307F9    lea         eax,[ebp-18]
 004307FC    push        eax
 004307FD    call        oleaut32.VariantInit
 00430802    mov         word ptr [ebp-18],5
 00430808    mov         eax,dword ptr [ebp+8]
 0043080B    mov         dword ptr [ebp-10],eax
 0043080E    mov         eax,dword ptr [ebp+0C]
 00430811    mov         dword ptr [ebp-0C],eax
 00430814    push        6
 00430816    push        0
 00430818    push        400
 0043081D    lea         eax,[ebp-18]
 00430820    push        eax
 00430821    lea         eax,[ebp-18]
 00430824    push        eax
 00430825    mov         eax,[0078D834];^gvar_00792F18
 0043082A    mov         eax,dword ptr [eax]
 0043082C    call        eax
 0043082E    movzx       edx,word ptr [ebx]
 00430831    mov         cx,6
 00430835    call        VarResultCheck
 0043083A    mov         eax,dword ptr [ebp-10]
 0043083D    mov         dword ptr [ebp-8],eax
 00430840    mov         eax,dword ptr [ebp-0C]
 00430843    mov         dword ptr [ebp-4],eax
 00430846    fild        qword ptr [ebp-8]
 00430849    pop         ebx
 0043084A    mov         esp,ebp
 0043084C    pop         ebp
 0043084D    ret         8
*}
end;

//00430850
function VarToCurrencyViaOS(const V:TVarData):Currency;
begin
{*
 00430850    push        ebx
 00430851    add         esp,0FFFFFFE8
 00430854    mov         ebx,eax
 00430856    lea         eax,[esp+8]
 0043085A    push        eax
 0043085B    call        oleaut32.VariantInit
 00430860    push        6
 00430862    push        0
 00430864    push        400
 00430869    push        ebx
 0043086A    lea         eax,[esp+18]
 0043086E    push        eax
 0043086F    mov         eax,[0078D834];^gvar_00792F18
 00430874    mov         eax,dword ptr [eax]
 00430876    call        eax
 00430878    movzx       edx,word ptr [ebx]
 0043087B    mov         cx,6
 0043087F    call        VarResultCheck
 00430884    mov         eax,dword ptr [esp+10]
 00430888    mov         dword ptr [esp],eax
 0043088B    mov         eax,dword ptr [esp+14]
 0043088F    mov         dword ptr [esp+4],eax
 00430893    fild        qword ptr [esp]
 00430896    add         esp,18
 00430899    pop         ebx
 0043089A    ret
*}
end;

//0043089C
function VarToCurrencyAny(const V:TVarData):Currency;
begin
{*
 0043089C    push        ebp
 0043089D    mov         ebp,esp
 0043089F    add         esp,0FFFFFFE8
 004308A2    push        ebx
 004308A3    mov         ebx,eax
 004308A5    lea         eax,[ebp-18]
 004308A8    push        eax
 004308A9    call        oleaut32.VariantInit
 004308AE    xor         eax,eax
 004308B0    push        ebp
 004308B1    push        4308F1
 004308B6    push        dword ptr fs:[eax]
 004308B9    mov         dword ptr fs:[eax],esp
 004308BC    mov         edx,ebx
 004308BE    lea         eax,[ebp-18]
 004308C1    call        @VarCopy
 004308C6    lea         eax,[ebp-18]
 004308C9    call        dword ptr ds:[792F90]
 004308CF    lea         eax,[ebp-18]
 004308D2    call        @VarToCurrency
 004308D7    fistp       qword ptr [ebp-8]
 004308DA    wait
 004308DB    xor         eax,eax
 004308DD    pop         edx
 004308DE    pop         ecx
 004308DF    pop         ecx
 004308E0    mov         dword ptr fs:[eax],edx
 004308E3    push        4308F8
 004308E8    lea         eax,[ebp-18]
 004308EB    call        @VarClear
 004308F0    ret
>004308F1    jmp         @HandleFinally
>004308F6    jmp         004308E8
 004308F8    fild        qword ptr [ebp-8]
 004308FB    pop         ebx
 004308FC    mov         esp,ebp
 004308FE    pop         ebp
 004308FF    ret
*}
end;

//00430900
function VarToCurrencyCustom(const V:TVarData; var AValue:Currency):Boolean;
begin
{*
 00430900    push        ebx
 00430901    push        esi
 00430902    push        edi
 00430903    add         esp,0FFFFFFEC
 00430906    mov         edi,edx
 00430908    mov         esi,eax
 0043090A    mov         edx,esp
 0043090C    movzx       eax,word ptr [esi]
 0043090F    call        FindCustomVariantType
 00430914    mov         ebx,eax
 00430916    test        bl,bl
>00430918    je          00430942
 0043091A    lea         eax,[esp+4]
 0043091E    push        eax
 0043091F    call        oleaut32.VariantInit
 00430924    push        6
 00430926    mov         ecx,esi
 00430928    lea         edx,[esp+8]
 0043092C    mov         eax,dword ptr [esp+4]
 00430930    mov         esi,dword ptr [eax]
 00430932    call        dword ptr [esi+1C]
 00430935    mov         eax,dword ptr [esp+0C]
 00430939    mov         dword ptr [edi],eax
 0043093B    mov         eax,dword ptr [esp+10]
 0043093F    mov         dword ptr [edi+4],eax
 00430942    mov         eax,ebx
 00430944    add         esp,14
 00430947    pop         edi
 00430948    pop         esi
 00430949    pop         ebx
 0043094A    ret
*}
end;

//0043094C
function @VarToCurrency(const V:TVarData):Currency;
begin
{*
 0043094C    push        ebx
 0043094D    add         esp,0FFFFFFEC
 00430950    mov         ebx,eax
 00430952    movzx       eax,word ptr [ebx]
 00430955    movzx       edx,ax
 00430958    cmp         edx,15
>0043095B    ja          00430B54
 00430961    jmp         dword ptr [edx*4+430968]
 00430961    dd          004309C0
 00430961    dd          004309CE
 00430961    dd          004309F2
 00430961    dd          00430A04
 00430961    dd          00430A16
 00430961    dd          00430A16
 00430961    dd          00430A26
 00430961    dd          00430A38
 00430961    dd          00430A48
 00430961    dd          00430B44
 00430961    dd          00430B54
 00430961    dd          00430A58
 00430961    dd          00430B33
 00430961    dd          00430B44
 00430961    dd          00430B54
 00430961    dd          00430B54
 00430961    dd          00430A73
 00430961    dd          00430A8E
 00430961    dd          00430AA9
 00430961    dd          00430AC4
 00430961    dd          00430AE4
 00430961    dd          00430AFE
 004309C0    xor         eax,eax
 004309C2    mov         dword ptr [esp],eax
 004309C5    mov         dword ptr [esp+4],eax
>004309C9    jmp         00430D94
 004309CE    cmp         byte ptr ds:[784E6A],0
>004309D5    je          004309E4
 004309D7    mov         dx,6
 004309DB    mov         ax,1
 004309DF    call        VarCastError
 004309E4    xor         eax,eax
 004309E6    mov         dword ptr [esp],eax
 004309E9    mov         dword ptr [esp+4],eax
>004309ED    jmp         00430D94
 004309F2    fild        word ptr [ebx+8]
 004309F5    fmul        dword ptr ds:[430D9C]
 004309FB    fistp       qword ptr [esp]
 004309FE    wait
>004309FF    jmp         00430D94
 00430A04    fild        dword ptr [ebx+8]
 00430A07    fmul        dword ptr ds:[430D9C]
 00430A0D    fistp       qword ptr [esp]
 00430A10    wait
>00430A11    jmp         00430D94
 00430A16    mov         eax,ebx
 00430A18    call        VarToCurrencyViaOS
 00430A1D    fistp       qword ptr [esp]
 00430A20    wait
>00430A21    jmp         00430D94
 00430A26    mov         eax,dword ptr [ebx+8]
 00430A29    mov         dword ptr [esp],eax
 00430A2C    mov         eax,dword ptr [ebx+0C]
 00430A2F    mov         dword ptr [esp+4],eax
>00430A33    jmp         00430D94
 00430A38    mov         eax,ebx
 00430A3A    call        VarToCurrencyViaOS
 00430A3F    fistp       qword ptr [esp]
 00430A42    wait
>00430A43    jmp         00430D94
 00430A48    mov         eax,ebx
 00430A4A    call        VarToCurrencyAsString
 00430A4F    fistp       qword ptr [esp]
 00430A52    wait
>00430A53    jmp         00430D94
 00430A58    movsx       eax,word ptr [ebx+8]
 00430A5C    mov         dword ptr [esp+8],eax
 00430A60    fild        dword ptr [esp+8]
 00430A64    fmul        dword ptr ds:[430D9C]
 00430A6A    fistp       qword ptr [esp]
 00430A6D    wait
>00430A6E    jmp         00430D94
 00430A73    movsx       eax,byte ptr [ebx+8]
 00430A77    mov         dword ptr [esp+8],eax
 00430A7B    fild        dword ptr [esp+8]
 00430A7F    fmul        dword ptr ds:[430D9C]
 00430A85    fistp       qword ptr [esp]
 00430A88    wait
>00430A89    jmp         00430D94
 00430A8E    movzx       eax,byte ptr [ebx+8]
 00430A92    mov         dword ptr [esp+8],eax
 00430A96    fild        dword ptr [esp+8]
 00430A9A    fmul        dword ptr ds:[430D9C]
 00430AA0    fistp       qword ptr [esp]
 00430AA3    wait
>00430AA4    jmp         00430D94
 00430AA9    movzx       eax,word ptr [ebx+8]
 00430AAD    mov         dword ptr [esp+8],eax
 00430AB1    fild        dword ptr [esp+8]
 00430AB5    fmul        dword ptr ds:[430D9C]
 00430ABB    fistp       qword ptr [esp]
 00430ABE    wait
>00430ABF    jmp         00430D94
 00430AC4    mov         eax,dword ptr [ebx+8]
 00430AC7    mov         dword ptr [esp+0C],eax
 00430ACB    xor         eax,eax
 00430ACD    mov         dword ptr [esp+10],eax
 00430AD1    fild        qword ptr [esp+0C]
 00430AD5    fmul        dword ptr ds:[430D9C]
 00430ADB    fistp       qword ptr [esp]
 00430ADE    wait
>00430ADF    jmp         00430D94
 00430AE4    fild        qword ptr [ebx+8]
 00430AE7    add         esp,0FFFFFFF8
 00430AEA    fstp        qword ptr [esp]
 00430AED    wait
 00430AEE    mov         eax,ebx
 00430AF0    call        VarToCurrencyAsDouble
 00430AF5    fistp       qword ptr [esp]
 00430AF8    wait
>00430AF9    jmp         00430D94
 00430AFE    mov         eax,dword ptr [ebx+8]
 00430B01    mov         edx,dword ptr [ebx+0C]
 00430B04    mov         dword ptr [esp+0C],eax
 00430B08    sub         edx,80000000
 00430B0E    mov         dword ptr [esp+10],edx
 00430B12    fild        qword ptr [esp+0C]
 00430B16    fadd        qword ptr ds:[430DA0]
 00430B1C    add         esp,0FFFFFFF8
 00430B1F    fstp        qword ptr [esp]
 00430B22    wait
 00430B23    mov         eax,ebx
 00430B25    call        VarToCurrencyAsDouble
 00430B2A    fistp       qword ptr [esp]
 00430B2D    wait
>00430B2E    jmp         00430D94
 00430B33    mov         eax,dword ptr [ebx+8]
 00430B36    call        @VarToCurrency
 00430B3B    fistp       qword ptr [esp]
 00430B3E    wait
>00430B3F    jmp         00430D94
 00430B44    mov         eax,ebx
 00430B46    call        VarToCurrencyViaOS
 00430B4B    fistp       qword ptr [esp]
 00430B4E    wait
>00430B4F    jmp         00430D94
 00430B54    mov         edx,eax
 00430B56    sub         dx,100
>00430B5B    je          00430B69
 00430B5D    dec         dx
>00430B60    je          00430B89
 00430B62    dec         dx
>00430B65    je          00430B79
>00430B67    jmp         00430B99
 00430B69    mov         eax,ebx
 00430B6B    call        VarToCurrencyAsString
 00430B70    fistp       qword ptr [esp]
 00430B73    wait
>00430B74    jmp         00430D94
 00430B79    mov         eax,ebx
 00430B7B    call        VarToCurrencyAsString
 00430B80    fistp       qword ptr [esp]
 00430B83    wait
>00430B84    jmp         00430D94
 00430B89    mov         eax,ebx
 00430B8B    call        VarToCurrencyAny
 00430B90    fistp       qword ptr [esp]
 00430B93    wait
>00430B94    jmp         00430D94
 00430B99    test        ah,40
>00430B9C    je          00430D7C
 00430BA2    movzx       eax,ax
 00430BA5    and         eax,0FFFFBFFF
 00430BAA    cmp         eax,15
>00430BAD    ja          00430D6F
 00430BB3    jmp         dword ptr [eax*4+430BBA]
 00430BB3    dd          00430D6F
 00430BB3    dd          00430D6F
 00430BB3    dd          00430C12
 00430BB3    dd          00430C26
 00430BB3    dd          00430C3A
 00430BB3    dd          00430C3A
 00430BB3    dd          00430C4A
 00430BB3    dd          00430C5E
 00430BB3    dd          00430C6E
 00430BB3    dd          00430D6F
 00430BB3    dd          00430D6F
 00430BB3    dd          00430C7E
 00430BB3    dd          00430D61
 00430BB3    dd          00430D6F
 00430BB3    dd          00430D6F
 00430BB3    dd          00430D6F
 00430BB3    dd          00430C9B
 00430BB3    dd          00430CB8
 00430BB3    dd          00430CD5
 00430BB3    dd          00430CF2
 00430BB3    dd          00430D14
 00430BB3    dd          00430D2D
 00430C12    mov         eax,dword ptr [ebx+8]
 00430C15    fild        word ptr [eax]
 00430C17    fmul        dword ptr ds:[430D9C]
 00430C1D    fistp       qword ptr [esp]
 00430C20    wait
>00430C21    jmp         00430D94
 00430C26    mov         eax,dword ptr [ebx+8]
 00430C29    fild        dword ptr [eax]
 00430C2B    fmul        dword ptr ds:[430D9C]
 00430C31    fistp       qword ptr [esp]
 00430C34    wait
>00430C35    jmp         00430D94
 00430C3A    mov         eax,ebx
 00430C3C    call        VarToCurrencyViaOS
 00430C41    fistp       qword ptr [esp]
 00430C44    wait
>00430C45    jmp         00430D94
 00430C4A    mov         eax,dword ptr [ebx+8]
 00430C4D    mov         edx,dword ptr [eax]
 00430C4F    mov         dword ptr [esp],edx
 00430C52    mov         edx,dword ptr [eax+4]
 00430C55    mov         dword ptr [esp+4],edx
>00430C59    jmp         00430D94
 00430C5E    mov         eax,ebx
 00430C60    call        VarToCurrencyViaOS
 00430C65    fistp       qword ptr [esp]
 00430C68    wait
>00430C69    jmp         00430D94
 00430C6E    mov         eax,ebx
 00430C70    call        VarToCurrencyAsString
 00430C75    fistp       qword ptr [esp]
 00430C78    wait
>00430C79    jmp         00430D94
 00430C7E    mov         eax,dword ptr [ebx+8]
 00430C81    movsx       eax,word ptr [eax]
 00430C84    mov         dword ptr [esp+8],eax
 00430C88    fild        dword ptr [esp+8]
 00430C8C    fmul        dword ptr ds:[430D9C]
 00430C92    fistp       qword ptr [esp]
 00430C95    wait
>00430C96    jmp         00430D94
 00430C9B    mov         eax,dword ptr [ebx+8]
 00430C9E    movsx       eax,byte ptr [eax]
 00430CA1    mov         dword ptr [esp+8],eax
 00430CA5    fild        dword ptr [esp+8]
 00430CA9    fmul        dword ptr ds:[430D9C]
 00430CAF    fistp       qword ptr [esp]
 00430CB2    wait
>00430CB3    jmp         00430D94
 00430CB8    mov         eax,dword ptr [ebx+8]
 00430CBB    movzx       eax,byte ptr [eax]
 00430CBE    mov         dword ptr [esp+8],eax
 00430CC2    fild        dword ptr [esp+8]
 00430CC6    fmul        dword ptr ds:[430D9C]
 00430CCC    fistp       qword ptr [esp]
 00430CCF    wait
>00430CD0    jmp         00430D94
 00430CD5    mov         eax,dword ptr [ebx+8]
 00430CD8    movzx       eax,word ptr [eax]
 00430CDB    mov         dword ptr [esp+8],eax
 00430CDF    fild        dword ptr [esp+8]
 00430CE3    fmul        dword ptr ds:[430D9C]
 00430CE9    fistp       qword ptr [esp]
 00430CEC    wait
>00430CED    jmp         00430D94
 00430CF2    mov         eax,dword ptr [ebx+8]
 00430CF5    mov         eax,dword ptr [eax]
 00430CF7    mov         dword ptr [esp+0C],eax
 00430CFB    xor         eax,eax
 00430CFD    mov         dword ptr [esp+10],eax
 00430D01    fild        qword ptr [esp+0C]
 00430D05    fmul        dword ptr ds:[430D9C]
 00430D0B    fistp       qword ptr [esp]
 00430D0E    wait
>00430D0F    jmp         00430D94
 00430D14    mov         eax,dword ptr [ebx+8]
 00430D17    fild        qword ptr [eax]
 00430D19    add         esp,0FFFFFFF8
 00430D1C    fstp        qword ptr [esp]
 00430D1F    wait
 00430D20    mov         eax,ebx
 00430D22    call        VarToCurrencyAsDouble
 00430D27    fistp       qword ptr [esp]
 00430D2A    wait
>00430D2B    jmp         00430D94
 00430D2D    mov         eax,dword ptr [ebx+8]
 00430D30    mov         edx,dword ptr [eax+4]
 00430D33    mov         eax,dword ptr [eax]
 00430D35    mov         dword ptr [esp+0C],eax
 00430D39    sub         edx,80000000
 00430D3F    mov         dword ptr [esp+10],edx
 00430D43    fild        qword ptr [esp+0C]
 00430D47    fadd        qword ptr ds:[430DA0]
 00430D4D    add         esp,0FFFFFFF8
 00430D50    fstp        qword ptr [esp]
 00430D53    wait
 00430D54    mov         eax,ebx
 00430D56    call        VarToCurrencyAsDouble
 00430D5B    fistp       qword ptr [esp]
 00430D5E    wait
>00430D5F    jmp         00430D94
 00430D61    mov         eax,dword ptr [ebx+8]
 00430D64    call        @VarToCurrency
 00430D69    fistp       qword ptr [esp]
 00430D6C    wait
>00430D6D    jmp         00430D94
 00430D6F    mov         eax,ebx
 00430D71    call        VarToCurrencyViaOS
 00430D76    fistp       qword ptr [esp]
 00430D79    wait
>00430D7A    jmp         00430D94
 00430D7C    mov         edx,esp
 00430D7E    mov         eax,ebx
 00430D80    call        VarToCurrencyCustom
 00430D85    test        al,al
>00430D87    jne         00430D94
 00430D89    mov         eax,ebx
 00430D8B    call        VarToCurrencyViaOS
 00430D90    fistp       qword ptr [esp]
 00430D93    wait
 00430D94    fild        qword ptr [esp]
 00430D97    add         esp,14
 00430D9A    pop         ebx
 00430D9B    ret
*}
end;

//00430DA8
function CurrToWStrViaOS(const AValue:Currency):WideString;
begin
{*
 00430DA8    push        ebp
 00430DA9    mov         ebp,esp
 00430DAB    push        ebx
 00430DAC    mov         ebx,eax
 00430DAE    mov         eax,ebx
 00430DB0    call        @WStrClr
 00430DB5    push        eax
 00430DB6    push        0
 00430DB8    push        400
 00430DBD    push        dword ptr [ebp+0C]
 00430DC0    push        dword ptr [ebp+8]
 00430DC3    mov         eax,[0078CD80];^gvar_00792F64
 00430DC8    mov         eax,dword ptr [eax]
 00430DCA    call        eax
 00430DCC    mov         cx,8
 00430DD0    mov         dx,6
 00430DD4    call        VarResultCheck
 00430DD9    pop         ebx
 00430DDA    pop         ebp
 00430DDB    ret         8
*}
end;

//00430DE0
function DateToWStrViaOS(const AValue:TDateTime):WideString;
begin
{*
 00430DE0    push        ebp
 00430DE1    mov         ebp,esp
 00430DE3    push        ebx
 00430DE4    mov         ebx,eax
 00430DE6    mov         eax,ebx
 00430DE8    call        @WStrClr
 00430DED    push        eax
 00430DEE    push        0
 00430DF0    push        400
 00430DF5    push        dword ptr [ebp+0C]
 00430DF8    push        dword ptr [ebp+8]
 00430DFB    mov         eax,[0078D37C];^gvar_00792F68
 00430E00    mov         eax,dword ptr [eax]
 00430E02    call        eax
 00430E04    mov         cx,8
 00430E08    mov         dx,7
 00430E0C    call        VarResultCheck
 00430E11    pop         ebx
 00430E12    pop         ebp
 00430E13    ret         8
*}
end;

//00430E18
function BoolToWStrViaOS(const AValue:WordBool):WideString;
begin
{*
 00430E18    push        ebp
 00430E19    mov         ebp,esp
 00430E1B    xor         ecx,ecx
 00430E1D    push        ecx
 00430E1E    push        ecx
 00430E1F    push        ecx
 00430E20    push        ecx
 00430E21    push        ebx
 00430E22    push        esi
 00430E23    mov         ebx,edx
 00430E25    mov         esi,eax
 00430E27    xor         eax,eax
 00430E29    push        ebp
 00430E2A    push        430ED0
 00430E2F    push        dword ptr fs:[eax]
 00430E32    mov         dword ptr fs:[eax],esp
 00430E35    mov         eax,ebx
 00430E37    call        @WStrClr
 00430E3C    push        eax
 00430E3D    push        0
 00430E3F    push        400
 00430E44    push        esi
 00430E45    mov         eax,[0078D788];^gvar_00792F6C
 00430E4A    mov         eax,dword ptr [eax]
 00430E4C    call        eax
 00430E4E    mov         cx,8
 00430E52    mov         dx,0B
 00430E56    call        VarResultCheck
 00430E5B    movzx       eax,byte ptr ds:[784E71]
 00430E62    sub         al,1
>00430E64    jb          00430EB5
>00430E66    je          00430E6E
 00430E68    dec         al
>00430E6A    je          00430E8F
>00430E6C    jmp         00430EB0
 00430E6E    lea         eax,[ebp-8]
 00430E71    mov         edx,dword ptr [ebx]
 00430E73    call        @UStrFromWStr
 00430E78    mov         eax,dword ptr [ebp-8]
 00430E7B    lea         edx,[ebp-4]
 00430E7E    call        LowerCase
 00430E83    mov         edx,dword ptr [ebp-4]
 00430E86    mov         eax,ebx
 00430E88    call        @WStrFromUStr
>00430E8D    jmp         00430EB5
 00430E8F    lea         eax,[ebp-10]
 00430E92    mov         edx,dword ptr [ebx]
 00430E94    call        @UStrFromWStr
 00430E99    mov         eax,dword ptr [ebp-10]
 00430E9C    lea         edx,[ebp-0C]
 00430E9F    call        UpperCase
 00430EA4    mov         edx,dword ptr [ebp-0C]
 00430EA7    mov         eax,ebx
 00430EA9    call        @WStrFromUStr
>00430EAE    jmp         00430EB5
 00430EB0    call        VarInvalidOp
 00430EB5    xor         eax,eax
 00430EB7    pop         edx
 00430EB8    pop         ecx
 00430EB9    pop         ecx
 00430EBA    mov         dword ptr fs:[eax],edx
 00430EBD    push        430ED7
 00430EC2    lea         eax,[ebp-10]
 00430EC5    mov         edx,4
 00430ECA    call        @UStrArrayClr
 00430ECF    ret
>00430ED0    jmp         @HandleFinally
>00430ED5    jmp         00430EC2
 00430ED7    pop         esi
 00430ED8    pop         ebx
 00430ED9    mov         esp,ebp
 00430EDB    pop         ebp
 00430EDC    ret
*}
end;

//00430EE0
function VarToLStrViaOS(const V:TVarData):UnicodeString;
begin
{*
 00430EE0    push        ebp
 00430EE1    mov         ebp,esp
 00430EE3    add         esp,0FFFFFFEC
 00430EE6    push        ebx
 00430EE7    push        esi
 00430EE8    xor         ecx,ecx
 00430EEA    mov         dword ptr [ebp-14],ecx
 00430EED    mov         esi,edx
 00430EEF    mov         ebx,eax
 00430EF1    xor         eax,eax
 00430EF3    push        ebp
 00430EF4    push        430F8A
 00430EF9    push        dword ptr fs:[eax]
 00430EFC    mov         dword ptr fs:[eax],esp
 00430EFF    lea         eax,[ebp-10]
 00430F02    push        eax
 00430F03    call        oleaut32.VariantInit
 00430F08    xor         eax,eax
 00430F0A    push        ebp
 00430F0B    push        430F6D
 00430F10    push        dword ptr fs:[eax]
 00430F13    mov         dword ptr fs:[eax],esp
 00430F16    push        8
 00430F18    push        0
 00430F1A    push        400
 00430F1F    push        ebx
 00430F20    lea         eax,[ebp-10]
 00430F23    push        eax
 00430F24    mov         eax,[0078D834];^gvar_00792F18
 00430F29    mov         eax,dword ptr [eax]
 00430F2B    call        eax
 00430F2D    movzx       edx,word ptr [ebx]
 00430F30    mov         cx,100
 00430F34    call        VarResultCheck
 00430F39    push        esi
 00430F3A    lea         eax,[ebp-14]
 00430F3D    mov         edx,dword ptr [ebp-8]
 00430F40    call        @UStrFromPWChar
 00430F45    mov         eax,dword ptr [ebp-14]
 00430F48    mov         ecx,7FFFFFFF
 00430F4D    mov         edx,1
 00430F52    call        @UStrCopy
 00430F57    xor         eax,eax
 00430F59    pop         edx
 00430F5A    pop         ecx
 00430F5B    pop         ecx
 00430F5C    mov         dword ptr fs:[eax],edx
 00430F5F    push        430F74
 00430F64    lea         eax,[ebp-10]
 00430F67    call        @VarClear
 00430F6C    ret
>00430F6D    jmp         @HandleFinally
>00430F72    jmp         00430F64
 00430F74    xor         eax,eax
 00430F76    pop         edx
 00430F77    pop         ecx
 00430F78    pop         ecx
 00430F79    mov         dword ptr fs:[eax],edx
 00430F7C    push        430F91
 00430F81    lea         eax,[ebp-14]
 00430F84    call        @UStrClr
 00430F89    ret
>00430F8A    jmp         @HandleFinally
>00430F8F    jmp         00430F81
 00430F91    pop         esi
 00430F92    pop         ebx
 00430F93    mov         esp,ebp
 00430F95    pop         ebp
 00430F96    ret
*}
end;

//00430F98
function VarToLStrAny(const V:TVarData):AnsiString;
begin
{*
 00430F98    push        ebp
 00430F99    mov         ebp,esp
 00430F9B    add         esp,0FFFFFFF0
 00430F9E    push        ebx
 00430F9F    push        esi
 00430FA0    mov         esi,edx
 00430FA2    mov         ebx,eax
 00430FA4    lea         eax,[ebp-10]
 00430FA7    push        eax
 00430FA8    call        oleaut32.VariantInit
 00430FAD    xor         eax,eax
 00430FAF    push        ebp
 00430FB0    push        430FEE
 00430FB5    push        dword ptr fs:[eax]
 00430FB8    mov         dword ptr fs:[eax],esp
 00430FBB    mov         edx,ebx
 00430FBD    lea         eax,[ebp-10]
 00430FC0    call        @VarCopy
 00430FC5    lea         eax,[ebp-10]
 00430FC8    call        dword ptr ds:[792F90]
 00430FCE    lea         edx,[ebp-10]
 00430FD1    mov         eax,esi
 00430FD3    call        @VarToLStr
 00430FD8    xor         eax,eax
 00430FDA    pop         edx
 00430FDB    pop         ecx
 00430FDC    pop         ecx
 00430FDD    mov         dword ptr fs:[eax],edx
 00430FE0    push        430FF5
 00430FE5    lea         eax,[ebp-10]
 00430FE8    call        @VarClear
 00430FED    ret
>00430FEE    jmp         @HandleFinally
>00430FF3    jmp         00430FE5
 00430FF5    pop         esi
 00430FF6    pop         ebx
 00430FF7    mov         esp,ebp
 00430FF9    pop         ebp
 00430FFA    ret
*}
end;

//00430FFC
function VarToLStrCustom(const V:TVarData; var AValue:AnsiString):Boolean;
begin
{*
 00430FFC    push        ebp
 00430FFD    mov         ebp,esp
 00430FFF    add         esp,0FFFFFFE4
 00431002    push        ebx
 00431003    mov         dword ptr [ebp-4],edx
 00431006    mov         ebx,eax
 00431008    mov         eax,dword ptr [ebp-4]
 0043100B    test        eax,eax
>0043100D    je          00431013
 0043100F    xor         edx,edx
 00431011    mov         dword ptr [eax],edx
 00431013    lea         edx,[ebp-0C]
 00431016    movzx       eax,word ptr [ebx]
 00431019    call        FindCustomVariantType
 0043101E    mov         byte ptr [ebp-5],al
 00431021    cmp         byte ptr [ebp-5],0
>00431025    je          00431078
 00431027    lea         eax,[ebp-1C]
 0043102A    push        eax
 0043102B    call        oleaut32.VariantInit
 00431030    xor         eax,eax
 00431032    push        ebp
 00431033    push        431071
 00431038    push        dword ptr fs:[eax]
 0043103B    mov         dword ptr fs:[eax],esp
 0043103E    push        100
 00431043    mov         ecx,ebx
 00431045    lea         edx,[ebp-1C]
 00431048    mov         eax,dword ptr [ebp-0C]
 0043104B    mov         ebx,dword ptr [eax]
 0043104D    call        dword ptr [ebx+1C]
 00431050    mov         eax,dword ptr [ebp-4]
 00431053    mov         edx,dword ptr [ebp-14]
 00431056    call        @LStrAsg
 0043105B    xor         eax,eax
 0043105D    pop         edx
 0043105E    pop         ecx
 0043105F    pop         ecx
 00431060    mov         dword ptr fs:[eax],edx
 00431063    push        431078
 00431068    lea         eax,[ebp-1C]
 0043106B    call        @VarClear
 00431070    ret
>00431071    jmp         @HandleFinally
>00431076    jmp         00431068
 00431078    movzx       eax,byte ptr [ebp-5]
 0043107C    pop         ebx
 0043107D    mov         esp,ebp
 0043107F    pop         ebp
 00431080    ret
*}
end;

//00431084
procedure @VarToLStr(var S:AnsiString; const V:TVarData);
begin
{*
 00431084    push        ebp
 00431085    mov         ebp,esp
 00431087    mov         ecx,17
 0043108C    push        0
 0043108E    push        0
 00431090    dec         ecx
>00431091    jne         0043108C
 00431093    push        ecx
 00431094    push        ebx
 00431095    push        esi
 00431096    mov         ebx,edx
 00431098    mov         esi,eax
 0043109A    xor         eax,eax
 0043109C    push        ebp
 0043109D    push        4317CB
 004310A2    push        dword ptr fs:[eax]
 004310A5    mov         dword ptr fs:[eax],esp
 004310A8    movzx       eax,word ptr [ebx]
 004310AB    movzx       edx,ax
 004310AE    cmp         edx,15
>004310B1    ja          0043137E
 004310B7    jmp         dword ptr [edx*4+4310BE]
 004310B7    dd          00431116
 004310B7    dd          00431122
 004310B7    dd          0043114F
 004310B7    dd          0043116F
 004310B7    dd          0043118E
 004310B7    dd          004311C1
 004310B7    dd          004311F4
 004310B7    dd          00431216
 004310B7    dd          00431238
 004310B7    dd          0043135A
 004310B7    dd          0043137E
 004310B7    dd          00431262
 004310B7    dd          00431349
 004310B7    dd          0043135A
 004310B7    dd          0043137E
 004310B7    dd          0043137E
 004310B7    dd          00431282
 004310B7    dd          004312A2
 004310B7    dd          004312C2
 004310B7    dd          004312E2
 004310B7    dd          00431305
 004310B7    dd          00431327
 00431116    mov         eax,esi
 00431118    call        @LStrClr
>0043111D    jmp         0043174B
 00431122    cmp         byte ptr ds:[784E6A],0
>00431129    je          00431138
 0043112B    mov         dx,100
 0043112F    mov         ax,1
 00431133    call        VarCastError
 00431138    mov         eax,esi
 0043113A    mov         edx,dword ptr ds:[784E6C]
 00431140    mov         ecx,0
 00431145    call        @LStrFromUStr
>0043114A    jmp         0043174B
 0043114F    lea         edx,[ebp-54]
 00431152    movsx       eax,word ptr [ebx+8]
 00431156    call        IntToStr
 0043115B    mov         edx,dword ptr [ebp-54]
 0043115E    mov         eax,esi
 00431160    mov         ecx,0
 00431165    call        @LStrFromUStr
>0043116A    jmp         0043174B
 0043116F    lea         edx,[ebp-58]
 00431172    mov         eax,dword ptr [ebx+8]
 00431175    call        IntToStr
 0043117A    mov         edx,dword ptr [ebp-58]
 0043117D    mov         eax,esi
 0043117F    mov         ecx,0
 00431184    call        @LStrFromUStr
>00431189    jmp         0043174B
 0043118E    fld         dword ptr [ebx+8]
 00431191    fstp        tbyte ptr [ebp-20]
 00431194    wait
 00431195    movzx       eax,word ptr [ebp-18]
 00431199    push        eax
 0043119A    push        dword ptr [ebp-1C]
 0043119D    push        dword ptr [ebp-20]
 004311A0    lea         edx,[ebp-4]
 004311A3    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 004311A8    call        FloatToStr
 004311AD    mov         eax,esi
 004311AF    mov         edx,dword ptr [ebp-4]
 004311B2    mov         ecx,0
 004311B7    call        @LStrFromUStr
>004311BC    jmp         0043174B
 004311C1    fld         qword ptr [ebx+8]
 004311C4    fstp        tbyte ptr [ebp-30]
 004311C7    wait
 004311C8    movzx       eax,word ptr [ebp-28]
 004311CC    push        eax
 004311CD    push        dword ptr [ebp-2C]
 004311D0    push        dword ptr [ebp-30]
 004311D3    lea         edx,[ebp-8]
 004311D6    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 004311DB    call        FloatToStr
 004311E0    mov         eax,esi
 004311E2    mov         edx,dword ptr [ebp-8]
 004311E5    mov         ecx,0
 004311EA    call        @LStrFromUStr
>004311EF    jmp         0043174B
 004311F4    push        dword ptr [ebx+0C]
 004311F7    push        dword ptr [ebx+8]
 004311FA    lea         eax,[ebp-5C]
 004311FD    call        CurrToWStrViaOS
 00431202    mov         edx,dword ptr [ebp-5C]
 00431205    mov         eax,esi
 00431207    mov         ecx,0
 0043120C    call        @LStrFromWStr
>00431211    jmp         0043174B
 00431216    push        dword ptr [ebx+0C]
 00431219    push        dword ptr [ebx+8]
 0043121C    lea         eax,[ebp-60]
 0043121F    call        DateToWStrViaOS
 00431224    mov         edx,dword ptr [ebp-60]
 00431227    mov         eax,esi
 00431229    mov         ecx,0
 0043122E    call        @LStrFromWStr
>00431233    jmp         0043174B
 00431238    lea         eax,[ebp-64]
 0043123B    push        eax
 0043123C    mov         eax,dword ptr [ebx+8]
 0043123F    mov         ecx,7FFFFFFF
 00431244    mov         edx,1
 00431249    call        @WStrCopy
 0043124E    mov         edx,dword ptr [ebp-64]
 00431251    mov         eax,esi
 00431253    mov         ecx,0
 00431258    call        @LStrFromWStr
>0043125D    jmp         0043174B
 00431262    lea         edx,[ebp-68]
 00431265    movzx       eax,word ptr [ebx+8]
 00431269    call        BoolToWStrViaOS
 0043126E    mov         edx,dword ptr [ebp-68]
 00431271    mov         eax,esi
 00431273    mov         ecx,0
 00431278    call        @LStrFromWStr
>0043127D    jmp         0043174B
 00431282    lea         edx,[ebp-6C]
 00431285    movsx       eax,byte ptr [ebx+8]
 00431289    call        IntToStr
 0043128E    mov         edx,dword ptr [ebp-6C]
 00431291    mov         eax,esi
 00431293    mov         ecx,0
 00431298    call        @LStrFromUStr
>0043129D    jmp         0043174B
 004312A2    lea         edx,[ebp-70]
 004312A5    movzx       eax,byte ptr [ebx+8]
 004312A9    call        IntToStr
 004312AE    mov         edx,dword ptr [ebp-70]
 004312B1    mov         eax,esi
 004312B3    mov         ecx,0
 004312B8    call        @LStrFromUStr
>004312BD    jmp         0043174B
 004312C2    lea         edx,[ebp-74]
 004312C5    movzx       eax,word ptr [ebx+8]
 004312C9    call        IntToStr
 004312CE    mov         edx,dword ptr [ebp-74]
 004312D1    mov         eax,esi
 004312D3    mov         ecx,0
 004312D8    call        @LStrFromUStr
>004312DD    jmp         0043174B
 004312E2    mov         eax,dword ptr [ebx+8]
 004312E5    xor         edx,edx
 004312E7    push        edx
 004312E8    push        eax
 004312E9    lea         eax,[ebp-78]
 004312EC    call        IntToStr
 004312F1    mov         edx,dword ptr [ebp-78]
 004312F4    mov         eax,esi
 004312F6    mov         ecx,0
 004312FB    call        @LStrFromUStr
>00431300    jmp         0043174B
 00431305    push        dword ptr [ebx+0C]
 00431308    push        dword ptr [ebx+8]
 0043130B    lea         eax,[ebp-7C]
 0043130E    call        IntToStr
 00431313    mov         edx,dword ptr [ebp-7C]
 00431316    mov         eax,esi
 00431318    mov         ecx,0
 0043131D    call        @LStrFromUStr
>00431322    jmp         0043174B
 00431327    push        dword ptr [ebx+0C]
 0043132A    push        dword ptr [ebx+8]
 0043132D    lea         eax,[ebp-80]
 00431330    call        UIntToStr
 00431335    mov         edx,dword ptr [ebp-80]
 00431338    mov         eax,esi
 0043133A    mov         ecx,0
 0043133F    call        @LStrFromUStr
>00431344    jmp         0043174B
 00431349    mov         eax,dword ptr [ebx+8]
 0043134C    mov         edx,eax
 0043134E    mov         eax,esi
 00431350    call        @VarToLStr
>00431355    jmp         0043174B
 0043135A    lea         edx,[ebp-84]
 00431360    mov         eax,ebx
 00431362    call        VarToLStrViaOS
 00431367    mov         edx,dword ptr [ebp-84]
 0043136D    mov         eax,esi
 0043136F    mov         ecx,0
 00431374    call        @LStrFromUStr
>00431379    jmp         0043174B
 0043137E    mov         edx,eax
 00431380    sub         dx,100
>00431385    je          00431393
 00431387    dec         dx
>0043138A    je          004313B6
 0043138C    dec         dx
>0043138F    je          004313A2
>00431391    jmp         004313D5
 00431393    mov         eax,esi
 00431395    mov         edx,dword ptr [ebx+8]
 00431398    call        @LStrAsg
>0043139D    jmp         0043174B
 004313A2    mov         eax,esi
 004313A4    mov         edx,dword ptr [ebx+8]
 004313A7    mov         ecx,0
 004313AC    call        @LStrFromUStr
>004313B1    jmp         0043174B
 004313B6    lea         edx,[ebp-88]
 004313BC    mov         eax,ebx
 004313BE    call        VarToLStrAny
 004313C3    mov         edx,dword ptr [ebp-88]
 004313C9    mov         eax,esi
 004313CB    call        @LStrAsg
>004313D0    jmp         0043174B
 004313D5    test        ah,40
>004313D8    je          00431718
 004313DE    movzx       eax,ax
 004313E1    and         eax,0FFFFBFFF
 004313E6    cmp         eax,0C
>004313E9    jg          00431431
>004313EB    je          004316E9
 004313F1    cmp         eax,0B
>004313F4    ja          004316F7
 004313FA    jmp         dword ptr [eax*4+431401]
 004313FA    dd          004316F7
 004313FA    dd          004316F7
 004313FA    dd          00431481
 004313FA    dd          004314A9
 004313FA    dd          004314D0
 004313FA    dd          00431505
 004313FA    dd          0043153A
 004313FA    dd          00431564
 004313FA    dd          0043158E
 004313FA    dd          004316F7
 004313FA    dd          004316F7
 004313FA    dd          004315A4
 00431431    cmp         eax,14
>00431434    jg          0043145F
>00431436    je          0043166F
 0043143C    sub         eax,10
>0043143F    je          004315CC
 00431445    dec         eax
>00431446    je          004315F4
 0043144C    dec         eax
>0043144D    je          0043161C
 00431453    dec         eax
>00431454    je          00431644
>0043145A    jmp         004316F7
 0043145F    sub         eax,15
>00431462    je          00431699
 00431468    sub         eax,0EB
>0043146D    je          004316C3
 00431473    sub         eax,2
>00431476    je          004316D6
>0043147C    jmp         004316F7
 00431481    lea         edx,[ebp-8C]
 00431487    mov         eax,dword ptr [ebx+8]
 0043148A    movsx       eax,word ptr [eax]
 0043148D    call        IntToStr
 00431492    mov         edx,dword ptr [ebp-8C]
 00431498    mov         eax,esi
 0043149A    mov         ecx,0
 0043149F    call        @LStrFromUStr
>004314A4    jmp         0043174B
 004314A9    lea         edx,[ebp-90]
 004314AF    mov         eax,dword ptr [ebx+8]
 004314B2    mov         eax,dword ptr [eax]
 004314B4    call        IntToStr
 004314B9    mov         edx,dword ptr [ebp-90]
 004314BF    mov         eax,esi
 004314C1    mov         ecx,0
 004314C6    call        @LStrFromUStr
>004314CB    jmp         0043174B
 004314D0    mov         eax,dword ptr [ebx+8]
 004314D3    fld         dword ptr [eax]
 004314D5    fstp        tbyte ptr [ebp-40]
 004314D8    wait
 004314D9    movzx       eax,word ptr [ebp-38]
 004314DD    push        eax
 004314DE    push        dword ptr [ebp-3C]
 004314E1    push        dword ptr [ebp-40]
 004314E4    lea         edx,[ebp-0C]
 004314E7    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 004314EC    call        FloatToStr
 004314F1    mov         eax,esi
 004314F3    mov         edx,dword ptr [ebp-0C]
 004314F6    mov         ecx,0
 004314FB    call        @LStrFromUStr
>00431500    jmp         0043174B
 00431505    mov         eax,dword ptr [ebx+8]
 00431508    fld         qword ptr [eax]
 0043150A    fstp        tbyte ptr [ebp-50]
 0043150D    wait
 0043150E    movzx       eax,word ptr [ebp-48]
 00431512    push        eax
 00431513    push        dword ptr [ebp-4C]
 00431516    push        dword ptr [ebp-50]
 00431519    lea         edx,[ebp-10]
 0043151C    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00431521    call        FloatToStr
 00431526    mov         eax,esi
 00431528    mov         edx,dword ptr [ebp-10]
 0043152B    mov         ecx,0
 00431530    call        @LStrFromUStr
>00431535    jmp         0043174B
 0043153A    mov         eax,dword ptr [ebx+8]
 0043153D    push        dword ptr [eax+4]
 00431540    push        dword ptr [eax]
 00431542    lea         eax,[ebp-94]
 00431548    call        CurrToWStrViaOS
 0043154D    mov         edx,dword ptr [ebp-94]
 00431553    mov         eax,esi
 00431555    mov         ecx,0
 0043155A    call        @LStrFromWStr
>0043155F    jmp         0043174B
 00431564    mov         eax,dword ptr [ebx+8]
 00431567    push        dword ptr [eax+4]
 0043156A    push        dword ptr [eax]
 0043156C    lea         eax,[ebp-98]
 00431572    call        DateToWStrViaOS
 00431577    mov         edx,dword ptr [ebp-98]
 0043157D    mov         eax,esi
 0043157F    mov         ecx,0
 00431584    call        @LStrFromWStr
>00431589    jmp         0043174B
 0043158E    mov         eax,esi
 00431590    mov         edx,dword ptr [ebx+8]
 00431593    mov         edx,dword ptr [edx]
 00431595    mov         ecx,0
 0043159A    call        @LStrFromPWChar
>0043159F    jmp         0043174B
 004315A4    lea         edx,[ebp-9C]
 004315AA    mov         eax,dword ptr [ebx+8]
 004315AD    movzx       eax,word ptr [eax]
 004315B0    call        BoolToWStrViaOS
 004315B5    mov         edx,dword ptr [ebp-9C]
 004315BB    mov         eax,esi
 004315BD    mov         ecx,0
 004315C2    call        @LStrFromWStr
>004315C7    jmp         0043174B
 004315CC    lea         edx,[ebp-0A0]
 004315D2    mov         eax,dword ptr [ebx+8]
 004315D5    movsx       eax,byte ptr [eax]
 004315D8    call        IntToStr
 004315DD    mov         edx,dword ptr [ebp-0A0]
 004315E3    mov         eax,esi
 004315E5    mov         ecx,0
 004315EA    call        @LStrFromUStr
>004315EF    jmp         0043174B
 004315F4    lea         edx,[ebp-0A4]
 004315FA    mov         eax,dword ptr [ebx+8]
 004315FD    movzx       eax,byte ptr [eax]
 00431600    call        IntToStr
 00431605    mov         edx,dword ptr [ebp-0A4]
 0043160B    mov         eax,esi
 0043160D    mov         ecx,0
 00431612    call        @LStrFromUStr
>00431617    jmp         0043174B
 0043161C    lea         edx,[ebp-0A8]
 00431622    mov         eax,dword ptr [ebx+8]
 00431625    movzx       eax,word ptr [eax]
 00431628    call        IntToStr
 0043162D    mov         edx,dword ptr [ebp-0A8]
 00431633    mov         eax,esi
 00431635    mov         ecx,0
 0043163A    call        @LStrFromUStr
>0043163F    jmp         0043174B
 00431644    mov         eax,dword ptr [ebx+8]
 00431647    mov         eax,dword ptr [eax]
 00431649    xor         edx,edx
 0043164B    push        edx
 0043164C    push        eax
 0043164D    lea         eax,[ebp-0AC]
 00431653    call        IntToStr
 00431658    mov         edx,dword ptr [ebp-0AC]
 0043165E    mov         eax,esi
 00431660    mov         ecx,0
 00431665    call        @LStrFromUStr
>0043166A    jmp         0043174B
 0043166F    mov         eax,dword ptr [ebx+8]
 00431672    push        dword ptr [eax+4]
 00431675    push        dword ptr [eax]
 00431677    lea         eax,[ebp-0B0]
 0043167D    call        IntToStr
 00431682    mov         edx,dword ptr [ebp-0B0]
 00431688    mov         eax,esi
 0043168A    mov         ecx,0
 0043168F    call        @LStrFromUStr
>00431694    jmp         0043174B
 00431699    mov         eax,dword ptr [ebx+8]
 0043169C    push        dword ptr [eax+4]
 0043169F    push        dword ptr [eax]
 004316A1    lea         eax,[ebp-0B4]
 004316A7    call        UIntToStr
 004316AC    mov         edx,dword ptr [ebp-0B4]
 004316B2    mov         eax,esi
 004316B4    mov         ecx,0
 004316B9    call        @LStrFromUStr
>004316BE    jmp         0043174B
 004316C3    mov         eax,esi
 004316C5    mov         edx,dword ptr [ebx+8]
 004316C8    mov         edx,dword ptr [edx]
 004316CA    mov         ecx,0
 004316CF    call        @LStrFromPChar
>004316D4    jmp         0043174B
 004316D6    mov         eax,esi
 004316D8    mov         edx,dword ptr [ebx+8]
 004316DB    mov         edx,dword ptr [edx]
 004316DD    mov         ecx,0
 004316E2    call        @LStrFromPWChar
>004316E7    jmp         0043174B
 004316E9    mov         eax,dword ptr [ebx+8]
 004316EC    mov         edx,eax
 004316EE    mov         eax,esi
 004316F0    call        @VarToLStr
>004316F5    jmp         0043174B
 004316F7    lea         edx,[ebp-0B8]
 004316FD    mov         eax,ebx
 004316FF    call        VarToLStrViaOS
 00431704    mov         edx,dword ptr [ebp-0B8]
 0043170A    mov         eax,esi
 0043170C    mov         ecx,0
 00431711    call        @LStrFromUStr
>00431716    jmp         0043174B
 00431718    mov         eax,esi
 0043171A    call        @LStrClr
 0043171F    mov         edx,eax
 00431721    mov         eax,ebx
 00431723    call        VarToLStrCustom
 00431728    test        al,al
>0043172A    jne         0043174B
 0043172C    lea         edx,[ebp-0BC]
 00431732    mov         eax,ebx
 00431734    call        VarToLStrViaOS
 00431739    mov         edx,dword ptr [ebp-0BC]
 0043173F    mov         eax,esi
 00431741    mov         ecx,0
 00431746    call        @LStrFromUStr
 0043174B    xor         eax,eax
 0043174D    pop         edx
 0043174E    pop         ecx
 0043174F    pop         ecx
 00431750    mov         dword ptr fs:[eax],edx
 00431753    push        4317D2
 00431758    lea         eax,[ebp-0BC]
 0043175E    mov         edx,8
 00431763    call        @UStrArrayClr
 00431768    lea         eax,[ebp-9C]
 0043176E    mov         edx,3
 00431773    call        @WStrArrayClr
 00431778    lea         eax,[ebp-90]
 0043177E    mov         edx,2
 00431783    call        @UStrArrayClr
 00431788    lea         eax,[ebp-88]
 0043178E    call        @LStrClr
 00431793    lea         eax,[ebp-84]
 00431799    mov         edx,7
 0043179E    call        @UStrArrayClr
 004317A3    lea         eax,[ebp-68]
 004317A6    mov         edx,4
 004317AB    call        @WStrArrayClr
 004317B0    lea         eax,[ebp-58]
 004317B3    mov         edx,2
 004317B8    call        @UStrArrayClr
 004317BD    lea         eax,[ebp-10]
 004317C0    mov         edx,4
 004317C5    call        @UStrArrayClr
 004317CA    ret
>004317CB    jmp         @HandleFinally
>004317D0    jmp         00431758
 004317D2    pop         esi
 004317D3    pop         ebx
 004317D4    mov         esp,ebp
 004317D6    pop         ebp
 004317D7    ret
*}
end;

//004317D8
function VarToWStrViaOS(const V:TVarData):WideString;
begin
{*
 004317D8    push        ebp
 004317D9    mov         ebp,esp
 004317DB    add         esp,0FFFFFFE8
 004317DE    push        ebx
 004317DF    push        esi
 004317E0    xor         ecx,ecx
 004317E2    mov         dword ptr [ebp-14],ecx
 004317E5    mov         dword ptr [ebp-18],ecx
 004317E8    mov         esi,edx
 004317EA    mov         ebx,eax
 004317EC    xor         eax,eax
 004317EE    push        ebp
 004317EF    push        431897
 004317F4    push        dword ptr fs:[eax]
 004317F7    mov         dword ptr fs:[eax],esp
 004317FA    lea         eax,[ebp-10]
 004317FD    push        eax
 004317FE    call        oleaut32.VariantInit
 00431803    xor         eax,eax
 00431805    push        ebp
 00431806    push        431875
 0043180B    push        dword ptr fs:[eax]
 0043180E    mov         dword ptr fs:[eax],esp
 00431811    push        8
 00431813    push        0
 00431815    push        400
 0043181A    push        ebx
 0043181B    lea         eax,[ebp-10]
 0043181E    push        eax
 0043181F    mov         eax,[0078D834];^gvar_00792F18
 00431824    mov         eax,dword ptr [eax]
 00431826    call        eax
 00431828    movzx       edx,word ptr [ebx]
 0043182B    mov         cx,8
 0043182F    call        VarResultCheck
 00431834    lea         eax,[ebp-14]
 00431837    push        eax
 00431838    lea         eax,[ebp-18]
 0043183B    mov         edx,dword ptr [ebp-8]
 0043183E    call        @UStrFromPWChar
 00431843    mov         eax,dword ptr [ebp-18]
 00431846    mov         ecx,7FFFFFFF
 0043184B    mov         edx,1
 00431850    call        @UStrCopy
 00431855    mov         edx,dword ptr [ebp-14]
 00431858    mov         eax,esi
 0043185A    call        @WStrFromUStr
 0043185F    xor         eax,eax
 00431861    pop         edx
 00431862    pop         ecx
 00431863    pop         ecx
 00431864    mov         dword ptr fs:[eax],edx
 00431867    push        43187C
 0043186C    lea         eax,[ebp-10]
 0043186F    call        @VarClear
 00431874    ret
>00431875    jmp         @HandleFinally
>0043187A    jmp         0043186C
 0043187C    xor         eax,eax
 0043187E    pop         edx
 0043187F    pop         ecx
 00431880    pop         ecx
 00431881    mov         dword ptr fs:[eax],edx
 00431884    push        43189E
 00431889    lea         eax,[ebp-18]
 0043188C    mov         edx,2
 00431891    call        @UStrArrayClr
 00431896    ret
>00431897    jmp         @HandleFinally
>0043189C    jmp         00431889
 0043189E    pop         esi
 0043189F    pop         ebx
 004318A0    mov         esp,ebp
 004318A2    pop         ebp
 004318A3    ret
*}
end;

//004318A4
function VarToWStrAny(const V:TVarData):WideString;
begin
{*
 004318A4    push        ebp
 004318A5    mov         ebp,esp
 004318A7    add         esp,0FFFFFFF0
 004318AA    push        ebx
 004318AB    push        esi
 004318AC    mov         esi,edx
 004318AE    mov         ebx,eax
 004318B0    lea         eax,[ebp-10]
 004318B3    push        eax
 004318B4    call        oleaut32.VariantInit
 004318B9    xor         eax,eax
 004318BB    push        ebp
 004318BC    push        4318FA
 004318C1    push        dword ptr fs:[eax]
 004318C4    mov         dword ptr fs:[eax],esp
 004318C7    mov         edx,ebx
 004318C9    lea         eax,[ebp-10]
 004318CC    call        @VarCopy
 004318D1    lea         eax,[ebp-10]
 004318D4    call        dword ptr ds:[792F90]
 004318DA    lea         edx,[ebp-10]
 004318DD    mov         eax,esi
 004318DF    call        @VarToWStr
 004318E4    xor         eax,eax
 004318E6    pop         edx
 004318E7    pop         ecx
 004318E8    pop         ecx
 004318E9    mov         dword ptr fs:[eax],edx
 004318EC    push        431901
 004318F1    lea         eax,[ebp-10]
 004318F4    call        @VarClear
 004318F9    ret
>004318FA    jmp         @HandleFinally
>004318FF    jmp         004318F1
 00431901    pop         esi
 00431902    pop         ebx
 00431903    mov         esp,ebp
 00431905    pop         ebp
 00431906    ret
*}
end;

//00431908
function VarToWStrCustom(const V:TVarData; var AValue:WideString):Boolean;
begin
{*
 00431908    push        ebp
 00431909    mov         ebp,esp
 0043190B    add         esp,0FFFFFFDC
 0043190E    push        ebx
 0043190F    xor         ecx,ecx
 00431911    mov         dword ptr [ebp-20],ecx
 00431914    mov         dword ptr [ebp-24],ecx
 00431917    mov         dword ptr [ebp-4],edx
 0043191A    mov         ebx,eax
 0043191C    mov         eax,dword ptr [ebp-4]
 0043191F    test        eax,eax
>00431921    je          00431927
 00431923    xor         edx,edx
 00431925    mov         dword ptr [eax],edx
 00431927    xor         eax,eax
 00431929    push        ebp
 0043192A    push        4319D3
 0043192F    push        dword ptr fs:[eax]
 00431932    mov         dword ptr fs:[eax],esp
 00431935    lea         edx,[ebp-0C]
 00431938    movzx       eax,word ptr [ebx]
 0043193B    call        FindCustomVariantType
 00431940    mov         byte ptr [ebp-5],al
 00431943    cmp         byte ptr [ebp-5],0
>00431947    je          004319B8
 00431949    lea         eax,[ebp-1C]
 0043194C    push        eax
 0043194D    call        oleaut32.VariantInit
 00431952    xor         eax,eax
 00431954    push        ebp
 00431955    push        4319B1
 0043195A    push        dword ptr fs:[eax]
 0043195D    mov         dword ptr fs:[eax],esp
 00431960    push        8
 00431962    mov         ecx,ebx
 00431964    lea         edx,[ebp-1C]
 00431967    mov         eax,dword ptr [ebp-0C]
 0043196A    mov         ebx,dword ptr [eax]
 0043196C    call        dword ptr [ebx+1C]
 0043196F    lea         eax,[ebp-20]
 00431972    push        eax
 00431973    lea         eax,[ebp-24]
 00431976    mov         edx,dword ptr [ebp-14]
 00431979    call        @UStrFromPWChar
 0043197E    mov         eax,dword ptr [ebp-24]
 00431981    mov         ecx,7FFFFFFF
 00431986    mov         edx,1
 0043198B    call        @UStrCopy
 00431990    mov         edx,dword ptr [ebp-20]
 00431993    mov         eax,dword ptr [ebp-4]
 00431996    call        @WStrFromUStr
 0043199B    xor         eax,eax
 0043199D    pop         edx
 0043199E    pop         ecx
 0043199F    pop         ecx
 004319A0    mov         dword ptr fs:[eax],edx
 004319A3    push        4319B8
 004319A8    lea         eax,[ebp-1C]
 004319AB    call        @VarClear
 004319B0    ret
>004319B1    jmp         @HandleFinally
>004319B6    jmp         004319A8
 004319B8    xor         eax,eax
 004319BA    pop         edx
 004319BB    pop         ecx
 004319BC    pop         ecx
 004319BD    mov         dword ptr fs:[eax],edx
 004319C0    push        4319DA
 004319C5    lea         eax,[ebp-24]
 004319C8    mov         edx,2
 004319CD    call        @UStrArrayClr
 004319D2    ret
>004319D3    jmp         @HandleFinally
>004319D8    jmp         004319C5
 004319DA    movzx       eax,byte ptr [ebp-5]
 004319DE    pop         ebx
 004319DF    mov         esp,ebp
 004319E1    pop         ebp
 004319E2    ret
*}
end;

//004319E4
procedure @VarToWStr(var S:WideString; const V:TVarData);
begin
{*
 004319E4    push        ebp
 004319E5    mov         ebp,esp
 004319E7    mov         ecx,17
 004319EC    push        0
 004319EE    push        0
 004319F0    dec         ecx
>004319F1    jne         004319EC
 004319F3    push        ebx
 004319F4    push        esi
 004319F5    mov         ebx,edx
 004319F7    mov         esi,eax
 004319F9    xor         eax,eax
 004319FB    push        ebp
 004319FC    push        432077
 00431A01    push        dword ptr fs:[eax]
 00431A04    mov         dword ptr fs:[eax],esp
 00431A07    movzx       eax,word ptr [ebx]
 00431A0A    movzx       edx,ax
 00431A0D    cmp         edx,15
>00431A10    ja          00431C7A
 00431A16    jmp         dword ptr [edx*4+431A1D]
 00431A16    dd          00431A75
 00431A16    dd          00431A81
 00431A16    dd          00431AA9
 00431A16    dd          00431AC4
 00431A16    dd          00431ADE
 00431A16    dd          00431B0C
 00431A16    dd          00431B3A
 00431A16    dd          00431B57
 00431A16    dd          00431B74
 00431A16    dd          00431C61
 00431A16    dd          00431C7A
 00431A16    dd          00431B8C
 00431A16    dd          00431C50
 00431A16    dd          00431C61
 00431A16    dd          00431C7A
 00431A16    dd          00431C7A
 00431A16    dd          00431BA7
 00431A16    dd          00431BC2
 00431A16    dd          00431BDD
 00431A16    dd          00431BF8
 00431A16    dd          00431C16
 00431A16    dd          00431C33
 00431A75    mov         eax,esi
 00431A77    call        @WStrClr
>00431A7C    jmp         00431FE5
 00431A81    cmp         byte ptr ds:[784E6A],0
>00431A88    je          00431A97
 00431A8A    mov         dx,8
 00431A8E    mov         ax,1
 00431A92    call        VarCastError
 00431A97    mov         eax,esi
 00431A99    mov         edx,dword ptr ds:[784E6C]
 00431A9F    call        @WStrFromUStr
>00431AA4    jmp         00431FE5
 00431AA9    lea         edx,[ebp-54]
 00431AAC    movsx       eax,word ptr [ebx+8]
 00431AB0    call        IntToStr
 00431AB5    mov         edx,dword ptr [ebp-54]
 00431AB8    mov         eax,esi
 00431ABA    call        @WStrFromUStr
>00431ABF    jmp         00431FE5
 00431AC4    lea         edx,[ebp-58]
 00431AC7    mov         eax,dword ptr [ebx+8]
 00431ACA    call        IntToStr
 00431ACF    mov         edx,dword ptr [ebp-58]
 00431AD2    mov         eax,esi
 00431AD4    call        @WStrFromUStr
>00431AD9    jmp         00431FE5
 00431ADE    fld         dword ptr [ebx+8]
 00431AE1    fstp        tbyte ptr [ebp-20]
 00431AE4    wait
 00431AE5    movzx       eax,word ptr [ebp-18]
 00431AE9    push        eax
 00431AEA    push        dword ptr [ebp-1C]
 00431AED    push        dword ptr [ebp-20]
 00431AF0    lea         edx,[ebp-4]
 00431AF3    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00431AF8    call        FloatToStr
 00431AFD    mov         eax,esi
 00431AFF    mov         edx,dword ptr [ebp-4]
 00431B02    call        @WStrFromUStr
>00431B07    jmp         00431FE5
 00431B0C    fld         qword ptr [ebx+8]
 00431B0F    fstp        tbyte ptr [ebp-30]
 00431B12    wait
 00431B13    movzx       eax,word ptr [ebp-28]
 00431B17    push        eax
 00431B18    push        dword ptr [ebp-2C]
 00431B1B    push        dword ptr [ebp-30]
 00431B1E    lea         edx,[ebp-8]
 00431B21    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00431B26    call        FloatToStr
 00431B2B    mov         eax,esi
 00431B2D    mov         edx,dword ptr [ebp-8]
 00431B30    call        @WStrFromUStr
>00431B35    jmp         00431FE5
 00431B3A    push        dword ptr [ebx+0C]
 00431B3D    push        dword ptr [ebx+8]
 00431B40    lea         eax,[ebp-5C]
 00431B43    call        CurrToWStrViaOS
 00431B48    mov         edx,dword ptr [ebp-5C]
 00431B4B    mov         eax,esi
 00431B4D    call        @WStrAsg
>00431B52    jmp         00431FE5
 00431B57    push        dword ptr [ebx+0C]
 00431B5A    push        dword ptr [ebx+8]
 00431B5D    lea         eax,[ebp-60]
 00431B60    call        DateToWStrViaOS
 00431B65    mov         edx,dword ptr [ebp-60]
 00431B68    mov         eax,esi
 00431B6A    call        @WStrAsg
>00431B6F    jmp         00431FE5
 00431B74    push        esi
 00431B75    mov         eax,dword ptr [ebx+8]
 00431B78    mov         ecx,7FFFFFFF
 00431B7D    mov         edx,1
 00431B82    call        @WStrCopy
>00431B87    jmp         00431FE5
 00431B8C    lea         edx,[ebp-64]
 00431B8F    movzx       eax,word ptr [ebx+8]
 00431B93    call        BoolToWStrViaOS
 00431B98    mov         edx,dword ptr [ebp-64]
 00431B9B    mov         eax,esi
 00431B9D    call        @WStrAsg
>00431BA2    jmp         00431FE5
 00431BA7    lea         edx,[ebp-68]
 00431BAA    movsx       eax,byte ptr [ebx+8]
 00431BAE    call        IntToStr
 00431BB3    mov         edx,dword ptr [ebp-68]
 00431BB6    mov         eax,esi
 00431BB8    call        @WStrFromUStr
>00431BBD    jmp         00431FE5
 00431BC2    lea         edx,[ebp-6C]
 00431BC5    movzx       eax,byte ptr [ebx+8]
 00431BC9    call        IntToStr
 00431BCE    mov         edx,dword ptr [ebp-6C]
 00431BD1    mov         eax,esi
 00431BD3    call        @WStrFromUStr
>00431BD8    jmp         00431FE5
 00431BDD    lea         edx,[ebp-70]
 00431BE0    movzx       eax,word ptr [ebx+8]
 00431BE4    call        IntToStr
 00431BE9    mov         edx,dword ptr [ebp-70]
 00431BEC    mov         eax,esi
 00431BEE    call        @WStrFromUStr
>00431BF3    jmp         00431FE5
 00431BF8    mov         eax,dword ptr [ebx+8]
 00431BFB    xor         edx,edx
 00431BFD    push        edx
 00431BFE    push        eax
 00431BFF    lea         eax,[ebp-74]
 00431C02    call        IntToStr
 00431C07    mov         edx,dword ptr [ebp-74]
 00431C0A    mov         eax,esi
 00431C0C    call        @WStrFromUStr
>00431C11    jmp         00431FE5
 00431C16    push        dword ptr [ebx+0C]
 00431C19    push        dword ptr [ebx+8]
 00431C1C    lea         eax,[ebp-78]
 00431C1F    call        IntToStr
 00431C24    mov         edx,dword ptr [ebp-78]
 00431C27    mov         eax,esi
 00431C29    call        @WStrFromUStr
>00431C2E    jmp         00431FE5
 00431C33    push        dword ptr [ebx+0C]
 00431C36    push        dword ptr [ebx+8]
 00431C39    lea         eax,[ebp-7C]
 00431C3C    call        UIntToStr
 00431C41    mov         edx,dword ptr [ebp-7C]
 00431C44    mov         eax,esi
 00431C46    call        @WStrFromUStr
>00431C4B    jmp         00431FE5
 00431C50    mov         eax,dword ptr [ebx+8]
 00431C53    mov         edx,eax
 00431C55    mov         eax,esi
 00431C57    call        @VarToWStr
>00431C5C    jmp         00431FE5
 00431C61    lea         edx,[ebp-80]
 00431C64    mov         eax,ebx
 00431C66    call        VarToWStrViaOS
 00431C6B    mov         edx,dword ptr [ebp-80]
 00431C6E    mov         eax,esi
 00431C70    call        @WStrAsg
>00431C75    jmp         00431FE5
 00431C7A    mov         edx,eax
 00431C7C    sub         dx,100
>00431C81    je          00431C8F
 00431C83    dec         dx
>00431C86    je          00431CAD
 00431C88    dec         dx
>00431C8B    je          00431C9E
>00431C8D    jmp         00431CCC
 00431C8F    mov         eax,esi
 00431C91    mov         edx,dword ptr [ebx+8]
 00431C94    call        @WStrFromLStr
>00431C99    jmp         00431FE5
 00431C9E    mov         eax,esi
 00431CA0    mov         edx,dword ptr [ebx+8]
 00431CA3    call        @WStrFromUStr
>00431CA8    jmp         00431FE5
 00431CAD    lea         edx,[ebp-84]
 00431CB3    mov         eax,ebx
 00431CB5    call        VarToWStrAny
 00431CBA    mov         edx,dword ptr [ebp-84]
 00431CC0    mov         eax,esi
 00431CC2    call        @WStrAsg
>00431CC7    jmp         00431FE5
 00431CCC    test        ah,40
>00431CCF    je          00431FB7
 00431CD5    movzx       eax,ax
 00431CD8    and         eax,0FFFFBFFF
 00431CDD    cmp         eax,0C
>00431CE0    jg          00431D28
>00431CE2    je          00431F8D
 00431CE8    cmp         eax,0B
>00431CEB    ja          00431F9B
 00431CF1    jmp         dword ptr [eax*4+431CF8]
 00431CF1    dd          00431F9B
 00431CF1    dd          00431F9B
 00431CF1    dd          00431D78
 00431CF1    dd          00431D9B
 00431CF1    dd          00431DBD
 00431CF1    dd          00431DED
 00431CF1    dd          00431E1D
 00431CF1    dd          00431E42
 00431CF1    dd          00431E67
 00431CF1    dd          00431F9B
 00431CF1    dd          00431F9B
 00431CF1    dd          00431E78
 00431D28    cmp         eax,14
>00431D2B    jg          00431D56
>00431D2D    je          00431F2A
 00431D33    sub         eax,10
>00431D36    je          00431E9B
 00431D3C    dec         eax
>00431D3D    je          00431EBE
 00431D43    dec         eax
>00431D44    je          00431EE1
 00431D4A    dec         eax
>00431D4B    je          00431F04
>00431D51    jmp         00431F9B
 00431D56    sub         eax,15
>00431D59    je          00431F4F
 00431D5F    sub         eax,0EB
>00431D64    je          00431F71
 00431D6A    sub         eax,2
>00431D6D    je          00431F7F
>00431D73    jmp         00431F9B
 00431D78    lea         edx,[ebp-88]
 00431D7E    mov         eax,dword ptr [ebx+8]
 00431D81    movsx       eax,word ptr [eax]
 00431D84    call        IntToStr
 00431D89    mov         edx,dword ptr [ebp-88]
 00431D8F    mov         eax,esi
 00431D91    call        @WStrFromUStr
>00431D96    jmp         00431FE5
 00431D9B    lea         edx,[ebp-8C]
 00431DA1    mov         eax,dword ptr [ebx+8]
 00431DA4    mov         eax,dword ptr [eax]
 00431DA6    call        IntToStr
 00431DAB    mov         edx,dword ptr [ebp-8C]
 00431DB1    mov         eax,esi
 00431DB3    call        @WStrFromUStr
>00431DB8    jmp         00431FE5
 00431DBD    mov         eax,dword ptr [ebx+8]
 00431DC0    fld         dword ptr [eax]
 00431DC2    fstp        tbyte ptr [ebp-40]
 00431DC5    wait
 00431DC6    movzx       eax,word ptr [ebp-38]
 00431DCA    push        eax
 00431DCB    push        dword ptr [ebp-3C]
 00431DCE    push        dword ptr [ebp-40]
 00431DD1    lea         edx,[ebp-0C]
 00431DD4    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00431DD9    call        FloatToStr
 00431DDE    mov         eax,esi
 00431DE0    mov         edx,dword ptr [ebp-0C]
 00431DE3    call        @WStrFromUStr
>00431DE8    jmp         00431FE5
 00431DED    mov         eax,dword ptr [ebx+8]
 00431DF0    fld         qword ptr [eax]
 00431DF2    fstp        tbyte ptr [ebp-50]
 00431DF5    wait
 00431DF6    movzx       eax,word ptr [ebp-48]
 00431DFA    push        eax
 00431DFB    push        dword ptr [ebp-4C]
 00431DFE    push        dword ptr [ebp-50]
 00431E01    lea         edx,[ebp-10]
 00431E04    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00431E09    call        FloatToStr
 00431E0E    mov         eax,esi
 00431E10    mov         edx,dword ptr [ebp-10]
 00431E13    call        @WStrFromUStr
>00431E18    jmp         00431FE5
 00431E1D    mov         eax,dword ptr [ebx+8]
 00431E20    push        dword ptr [eax+4]
 00431E23    push        dword ptr [eax]
 00431E25    lea         eax,[ebp-90]
 00431E2B    call        CurrToWStrViaOS
 00431E30    mov         edx,dword ptr [ebp-90]
 00431E36    mov         eax,esi
 00431E38    call        @WStrAsg
>00431E3D    jmp         00431FE5
 00431E42    mov         eax,dword ptr [ebx+8]
 00431E45    push        dword ptr [eax+4]
 00431E48    push        dword ptr [eax]
 00431E4A    lea         eax,[ebp-94]
 00431E50    call        DateToWStrViaOS
 00431E55    mov         edx,dword ptr [ebp-94]
 00431E5B    mov         eax,esi
 00431E5D    call        @WStrAsg
>00431E62    jmp         00431FE5
 00431E67    mov         eax,esi
 00431E69    mov         edx,dword ptr [ebx+8]
 00431E6C    mov         edx,dword ptr [edx]
 00431E6E    call        @WStrFromPWChar
>00431E73    jmp         00431FE5
 00431E78    lea         edx,[ebp-98]
 00431E7E    mov         eax,dword ptr [ebx+8]
 00431E81    movzx       eax,word ptr [eax]
 00431E84    call        BoolToWStrViaOS
 00431E89    mov         edx,dword ptr [ebp-98]
 00431E8F    mov         eax,esi
 00431E91    call        @WStrAsg
>00431E96    jmp         00431FE5
 00431E9B    lea         edx,[ebp-9C]
 00431EA1    mov         eax,dword ptr [ebx+8]
 00431EA4    movsx       eax,byte ptr [eax]
 00431EA7    call        IntToStr
 00431EAC    mov         edx,dword ptr [ebp-9C]
 00431EB2    mov         eax,esi
 00431EB4    call        @WStrFromUStr
>00431EB9    jmp         00431FE5
 00431EBE    lea         edx,[ebp-0A0]
 00431EC4    mov         eax,dword ptr [ebx+8]
 00431EC7    movzx       eax,byte ptr [eax]
 00431ECA    call        IntToStr
 00431ECF    mov         edx,dword ptr [ebp-0A0]
 00431ED5    mov         eax,esi
 00431ED7    call        @WStrFromUStr
>00431EDC    jmp         00431FE5
 00431EE1    lea         edx,[ebp-0A4]
 00431EE7    mov         eax,dword ptr [ebx+8]
 00431EEA    movzx       eax,word ptr [eax]
 00431EED    call        IntToStr
 00431EF2    mov         edx,dword ptr [ebp-0A4]
 00431EF8    mov         eax,esi
 00431EFA    call        @WStrFromUStr
>00431EFF    jmp         00431FE5
 00431F04    mov         eax,dword ptr [ebx+8]
 00431F07    mov         eax,dword ptr [eax]
 00431F09    xor         edx,edx
 00431F0B    push        edx
 00431F0C    push        eax
 00431F0D    lea         eax,[ebp-0A8]
 00431F13    call        IntToStr
 00431F18    mov         edx,dword ptr [ebp-0A8]
 00431F1E    mov         eax,esi
 00431F20    call        @WStrFromUStr
>00431F25    jmp         00431FE5
 00431F2A    mov         eax,dword ptr [ebx+8]
 00431F2D    push        dword ptr [eax+4]
 00431F30    push        dword ptr [eax]
 00431F32    lea         eax,[ebp-0AC]
 00431F38    call        IntToStr
 00431F3D    mov         edx,dword ptr [ebp-0AC]
 00431F43    mov         eax,esi
 00431F45    call        @WStrFromUStr
>00431F4A    jmp         00431FE5
 00431F4F    mov         eax,dword ptr [ebx+8]
 00431F52    push        dword ptr [eax+4]
 00431F55    push        dword ptr [eax]
 00431F57    lea         eax,[ebp-0B0]
 00431F5D    call        UIntToStr
 00431F62    mov         edx,dword ptr [ebp-0B0]
 00431F68    mov         eax,esi
 00431F6A    call        @WStrFromUStr
>00431F6F    jmp         00431FE5
 00431F71    mov         eax,esi
 00431F73    mov         edx,dword ptr [ebx+8]
 00431F76    mov         edx,dword ptr [edx]
 00431F78    call        @WStrFromPChar
>00431F7D    jmp         00431FE5
 00431F7F    mov         eax,esi
 00431F81    mov         edx,dword ptr [ebx+8]
 00431F84    mov         edx,dword ptr [edx]
 00431F86    call        @WStrFromPWChar
>00431F8B    jmp         00431FE5
 00431F8D    mov         eax,dword ptr [ebx+8]
 00431F90    mov         edx,eax
 00431F92    mov         eax,esi
 00431F94    call        @VarToWStr
>00431F99    jmp         00431FE5
 00431F9B    lea         edx,[ebp-0B4]
 00431FA1    mov         eax,ebx
 00431FA3    call        VarToWStrViaOS
 00431FA8    mov         edx,dword ptr [ebp-0B4]
 00431FAE    mov         eax,esi
 00431FB0    call        @WStrAsg
>00431FB5    jmp         00431FE5
 00431FB7    mov         eax,esi
 00431FB9    call        @WStrClr
 00431FBE    mov         edx,eax
 00431FC0    mov         eax,ebx
 00431FC2    call        VarToWStrCustom
 00431FC7    test        al,al
>00431FC9    jne         00431FE5
 00431FCB    lea         edx,[ebp-0B8]
 00431FD1    mov         eax,ebx
 00431FD3    call        VarToWStrViaOS
 00431FD8    mov         edx,dword ptr [ebp-0B8]
 00431FDE    mov         eax,esi
 00431FE0    call        @WStrAsg
 00431FE5    xor         eax,eax
 00431FE7    pop         edx
 00431FE8    pop         ecx
 00431FE9    pop         ecx
 00431FEA    mov         dword ptr fs:[eax],edx
 00431FED    push        432081
 00431FF2    lea         eax,[ebp-0B8]
 00431FF8    mov         edx,2
 00431FFD    call        @WStrArrayClr
 00432002    lea         eax,[ebp-0B0]
 00432008    mov         edx,6
 0043200D    call        @UStrArrayClr
 00432012    lea         eax,[ebp-98]
 00432018    mov         edx,3
 0043201D    call        @WStrArrayClr
 00432022    lea         eax,[ebp-8C]
 00432028    mov         edx,2
 0043202D    call        @UStrArrayClr
 00432032    lea         eax,[ebp-84]
 00432038    mov         edx,2
 0043203D    call        @WStrArrayClr
 00432042    lea         eax,[ebp-7C]
 00432045    mov         edx,6
 0043204A    call        @UStrArrayClr
 0043204F    lea         eax,[ebp-64]
 00432052    mov         edx,3
 00432057    call        @WStrArrayClr
 0043205C    lea         eax,[ebp-58]
 0043205F    mov         edx,2
 00432064    call        @UStrArrayClr
 00432069    lea         eax,[ebp-10]
 0043206C    mov         edx,4
 00432071    call        @UStrArrayClr
 00432076    ret
>00432077    jmp         @HandleFinally
>0043207C    jmp         00431FF2
 00432081    pop         esi
 00432082    pop         ebx
 00432083    mov         esp,ebp
 00432085    pop         ebp
 00432086    ret
*}
end;

//00432088
function VarToUStrAny(const V:TVarData):UnicodeString;
begin
{*
 00432088    push        ebp
 00432089    mov         ebp,esp
 0043208B    add         esp,0FFFFFFF0
 0043208E    push        ebx
 0043208F    push        esi
 00432090    mov         esi,edx
 00432092    mov         ebx,eax
 00432094    lea         eax,[ebp-10]
 00432097    push        eax
 00432098    call        oleaut32.VariantInit
 0043209D    xor         eax,eax
 0043209F    push        ebp
 004320A0    push        4320DE
 004320A5    push        dword ptr fs:[eax]
 004320A8    mov         dword ptr fs:[eax],esp
 004320AB    mov         edx,ebx
 004320AD    lea         eax,[ebp-10]
 004320B0    call        @VarCopy
 004320B5    lea         eax,[ebp-10]
 004320B8    call        dword ptr ds:[792F90]
 004320BE    lea         edx,[ebp-10]
 004320C1    mov         eax,esi
 004320C3    call        @VarToUStr
 004320C8    xor         eax,eax
 004320CA    pop         edx
 004320CB    pop         ecx
 004320CC    pop         ecx
 004320CD    mov         dword ptr fs:[eax],edx
 004320D0    push        4320E5
 004320D5    lea         eax,[ebp-10]
 004320D8    call        @VarClear
 004320DD    ret
>004320DE    jmp         @HandleFinally
>004320E3    jmp         004320D5
 004320E5    pop         esi
 004320E6    pop         ebx
 004320E7    mov         esp,ebp
 004320E9    pop         ebp
 004320EA    ret
*}
end;

//004320EC
function VarToUStrCustom(const V:TVarData; var AValue:UnicodeString):Boolean;
begin
{*
 004320EC    push        ebp
 004320ED    mov         ebp,esp
 004320EF    add         esp,0FFFFFFE0
 004320F2    push        ebx
 004320F3    xor         ecx,ecx
 004320F5    mov         dword ptr [ebp-20],ecx
 004320F8    mov         dword ptr [ebp-4],edx
 004320FB    mov         ebx,eax
 004320FD    mov         eax,dword ptr [ebp-4]
 00432100    test        eax,eax
>00432102    je          00432108
 00432104    xor         edx,edx
 00432106    mov         dword ptr [eax],edx
 00432108    xor         eax,eax
 0043210A    push        ebp
 0043210B    push        4321A4
 00432110    push        dword ptr fs:[eax]
 00432113    mov         dword ptr fs:[eax],esp
 00432116    lea         edx,[ebp-0C]
 00432119    movzx       eax,word ptr [ebx]
 0043211C    call        FindCustomVariantType
 00432121    mov         byte ptr [ebp-5],al
 00432124    cmp         byte ptr [ebp-5],0
>00432128    je          0043218E
 0043212A    lea         eax,[ebp-1C]
 0043212D    push        eax
 0043212E    call        oleaut32.VariantInit
 00432133    xor         eax,eax
 00432135    push        ebp
 00432136    push        432187
 0043213B    push        dword ptr fs:[eax]
 0043213E    mov         dword ptr fs:[eax],esp
 00432141    push        8
 00432143    mov         ecx,ebx
 00432145    lea         edx,[ebp-1C]
 00432148    mov         eax,dword ptr [ebp-0C]
 0043214B    mov         ebx,dword ptr [eax]
 0043214D    call        dword ptr [ebx+1C]
 00432150    mov         eax,dword ptr [ebp-4]
 00432153    push        eax
 00432154    lea         eax,[ebp-20]
 00432157    mov         edx,dword ptr [ebp-14]
 0043215A    call        @UStrFromPWChar
 0043215F    mov         eax,dword ptr [ebp-20]
 00432162    mov         ecx,7FFFFFFF
 00432167    mov         edx,1
 0043216C    call        @UStrCopy
 00432171    xor         eax,eax
 00432173    pop         edx
 00432174    pop         ecx
 00432175    pop         ecx
 00432176    mov         dword ptr fs:[eax],edx
 00432179    push        43218E
 0043217E    lea         eax,[ebp-1C]
 00432181    call        @VarClear
 00432186    ret
>00432187    jmp         @HandleFinally
>0043218C    jmp         0043217E
 0043218E    xor         eax,eax
 00432190    pop         edx
 00432191    pop         ecx
 00432192    pop         ecx
 00432193    mov         dword ptr fs:[eax],edx
 00432196    push        4321AB
 0043219B    lea         eax,[ebp-20]
 0043219E    call        @UStrClr
 004321A3    ret
>004321A4    jmp         @HandleFinally
>004321A9    jmp         0043219B
 004321AB    movzx       eax,byte ptr [ebp-5]
 004321AF    pop         ebx
 004321B0    mov         esp,ebp
 004321B2    pop         ebp
 004321B3    ret
*}
end;

//004321B4
procedure @VarToUStr(var S:UnicodeString; const V:TVarData);
begin
{*
 004321B4    push        ebp
 004321B5    mov         ebp,esp
 004321B7    mov         ecx,17
 004321BC    push        0
 004321BE    push        0
 004321C0    dec         ecx
>004321C1    jne         004321BC
 004321C3    push        ecx
 004321C4    push        ebx
 004321C5    push        esi
 004321C6    mov         ebx,edx
 004321C8    mov         esi,eax
 004321CA    xor         eax,eax
 004321CC    push        ebp
 004321CD    push        432856
 004321D2    push        dword ptr fs:[eax]
 004321D5    mov         dword ptr fs:[eax],esp
 004321D8    movzx       eax,word ptr [ebx]
 004321DB    movzx       edx,ax
 004321DE    cmp         edx,15
>004321E1    ja          0043245E
 004321E7    jmp         dword ptr [edx*4+4321EE]
 004321E7    dd          00432246
 004321E7    dd          00432252
 004321E7    dd          0043227A
 004321E7    dd          00432295
 004321E7    dd          004322AF
 004321E7    dd          004322DD
 004321E7    dd          0043230B
 004321E7    dd          00432328
 004321E7    dd          00432345
 004321E7    dd          0043243F
 004321E7    dd          0043245E
 004321E7    dd          0043236A
 004321E7    dd          0043242E
 004321E7    dd          0043243F
 004321E7    dd          0043245E
 004321E7    dd          0043245E
 004321E7    dd          00432385
 004321E7    dd          004323A0
 004321E7    dd          004323BB
 004321E7    dd          004323D6
 004321E7    dd          004323F4
 004321E7    dd          00432411
 00432246    mov         eax,esi
 00432248    call        @UStrClr
>0043224D    jmp         004327C9
 00432252    cmp         byte ptr ds:[784E6A],0
>00432259    je          00432268
 0043225B    mov         dx,8
 0043225F    mov         ax,1
 00432263    call        VarCastError
 00432268    mov         eax,esi
 0043226A    mov         edx,dword ptr ds:[784E6C]
 00432270    call        @UStrAsg
>00432275    jmp         004327C9
 0043227A    lea         edx,[ebp-54]
 0043227D    movsx       eax,word ptr [ebx+8]
 00432281    call        IntToStr
 00432286    mov         edx,dword ptr [ebp-54]
 00432289    mov         eax,esi
 0043228B    call        @UStrAsg
>00432290    jmp         004327C9
 00432295    lea         edx,[ebp-58]
 00432298    mov         eax,dword ptr [ebx+8]
 0043229B    call        IntToStr
 004322A0    mov         edx,dword ptr [ebp-58]
 004322A3    mov         eax,esi
 004322A5    call        @UStrAsg
>004322AA    jmp         004327C9
 004322AF    fld         dword ptr [ebx+8]
 004322B2    fstp        tbyte ptr [ebp-20]
 004322B5    wait
 004322B6    movzx       eax,word ptr [ebp-18]
 004322BA    push        eax
 004322BB    push        dword ptr [ebp-1C]
 004322BE    push        dword ptr [ebp-20]
 004322C1    lea         edx,[ebp-4]
 004322C4    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 004322C9    call        FloatToStr
 004322CE    mov         eax,esi
 004322D0    mov         edx,dword ptr [ebp-4]
 004322D3    call        @UStrAsg
>004322D8    jmp         004327C9
 004322DD    fld         qword ptr [ebx+8]
 004322E0    fstp        tbyte ptr [ebp-30]
 004322E3    wait
 004322E4    movzx       eax,word ptr [ebp-28]
 004322E8    push        eax
 004322E9    push        dword ptr [ebp-2C]
 004322EC    push        dword ptr [ebp-30]
 004322EF    lea         edx,[ebp-8]
 004322F2    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 004322F7    call        FloatToStr
 004322FC    mov         eax,esi
 004322FE    mov         edx,dword ptr [ebp-8]
 00432301    call        @UStrAsg
>00432306    jmp         004327C9
 0043230B    push        dword ptr [ebx+0C]
 0043230E    push        dword ptr [ebx+8]
 00432311    lea         eax,[ebp-5C]
 00432314    call        CurrToWStrViaOS
 00432319    mov         edx,dword ptr [ebp-5C]
 0043231C    mov         eax,esi
 0043231E    call        @UStrFromWStr
>00432323    jmp         004327C9
 00432328    push        dword ptr [ebx+0C]
 0043232B    push        dword ptr [ebx+8]
 0043232E    lea         eax,[ebp-60]
 00432331    call        DateToWStrViaOS
 00432336    mov         edx,dword ptr [ebp-60]
 00432339    mov         eax,esi
 0043233B    call        @UStrFromWStr
>00432340    jmp         004327C9
 00432345    lea         eax,[ebp-64]
 00432348    push        eax
 00432349    mov         eax,dword ptr [ebx+8]
 0043234C    mov         ecx,7FFFFFFF
 00432351    mov         edx,1
 00432356    call        @WStrCopy
 0043235B    mov         edx,dword ptr [ebp-64]
 0043235E    mov         eax,esi
 00432360    call        @UStrFromWStr
>00432365    jmp         004327C9
 0043236A    lea         edx,[ebp-68]
 0043236D    movzx       eax,word ptr [ebx+8]
 00432371    call        BoolToWStrViaOS
 00432376    mov         edx,dword ptr [ebp-68]
 00432379    mov         eax,esi
 0043237B    call        @UStrFromWStr
>00432380    jmp         004327C9
 00432385    lea         edx,[ebp-6C]
 00432388    movsx       eax,byte ptr [ebx+8]
 0043238C    call        IntToStr
 00432391    mov         edx,dword ptr [ebp-6C]
 00432394    mov         eax,esi
 00432396    call        @UStrAsg
>0043239B    jmp         004327C9
 004323A0    lea         edx,[ebp-70]
 004323A3    movzx       eax,byte ptr [ebx+8]
 004323A7    call        IntToStr
 004323AC    mov         edx,dword ptr [ebp-70]
 004323AF    mov         eax,esi
 004323B1    call        @UStrAsg
>004323B6    jmp         004327C9
 004323BB    lea         edx,[ebp-74]
 004323BE    movzx       eax,word ptr [ebx+8]
 004323C2    call        IntToStr
 004323C7    mov         edx,dword ptr [ebp-74]
 004323CA    mov         eax,esi
 004323CC    call        @UStrAsg
>004323D1    jmp         004327C9
 004323D6    mov         eax,dword ptr [ebx+8]
 004323D9    xor         edx,edx
 004323DB    push        edx
 004323DC    push        eax
 004323DD    lea         eax,[ebp-78]
 004323E0    call        IntToStr
 004323E5    mov         edx,dword ptr [ebp-78]
 004323E8    mov         eax,esi
 004323EA    call        @UStrAsg
>004323EF    jmp         004327C9
 004323F4    push        dword ptr [ebx+0C]
 004323F7    push        dword ptr [ebx+8]
 004323FA    lea         eax,[ebp-7C]
 004323FD    call        IntToStr
 00432402    mov         edx,dword ptr [ebp-7C]
 00432405    mov         eax,esi
 00432407    call        @UStrAsg
>0043240C    jmp         004327C9
 00432411    push        dword ptr [ebx+0C]
 00432414    push        dword ptr [ebx+8]
 00432417    lea         eax,[ebp-80]
 0043241A    call        UIntToStr
 0043241F    mov         edx,dword ptr [ebp-80]
 00432422    mov         eax,esi
 00432424    call        @UStrAsg
>00432429    jmp         004327C9
 0043242E    mov         eax,dword ptr [ebx+8]
 00432431    mov         edx,eax
 00432433    mov         eax,esi
 00432435    call        @VarToUStr
>0043243A    jmp         004327C9
 0043243F    lea         edx,[ebp-84]
 00432445    mov         eax,ebx
 00432447    call        VarToWStrViaOS
 0043244C    mov         edx,dword ptr [ebp-84]
 00432452    mov         eax,esi
 00432454    call        @UStrFromWStr
>00432459    jmp         004327C9
 0043245E    mov         edx,eax
 00432460    sub         dx,100
>00432465    je          00432473
 00432467    dec         dx
>0043246A    je          00432491
 0043246C    dec         dx
>0043246F    je          00432482
>00432471    jmp         004324B0
 00432473    mov         eax,esi
 00432475    mov         edx,dword ptr [ebx+8]
 00432478    call        @UStrFromLStr
>0043247D    jmp         004327C9
 00432482    mov         eax,esi
 00432484    mov         edx,dword ptr [ebx+8]
 00432487    call        @UStrAsg
>0043248C    jmp         004327C9
 00432491    lea         edx,[ebp-88]
 00432497    mov         eax,ebx
 00432499    call        VarToUStrAny
 0043249E    mov         edx,dword ptr [ebp-88]
 004324A4    mov         eax,esi
 004324A6    call        @UStrAsg
>004324AB    jmp         004327C9
 004324B0    test        ah,40
>004324B3    je          0043279B
 004324B9    movzx       eax,ax
 004324BC    and         eax,0FFFFBFFF
 004324C1    cmp         eax,0C
>004324C4    jg          0043250C
>004324C6    je          00432771
 004324CC    cmp         eax,0B
>004324CF    ja          0043277F
 004324D5    jmp         dword ptr [eax*4+4324DC]
 004324D5    dd          0043277F
 004324D5    dd          0043277F
 004324D5    dd          0043255C
 004324D5    dd          0043257F
 004324D5    dd          004325A1
 004324D5    dd          004325D1
 004324D5    dd          00432601
 004324D5    dd          00432626
 004324D5    dd          0043264B
 004324D5    dd          0043277F
 004324D5    dd          0043277F
 004324D5    dd          0043265C
 0043250C    cmp         eax,14
>0043250F    jg          0043253A
>00432511    je          0043270E
 00432517    sub         eax,10
>0043251A    je          0043267F
 00432520    dec         eax
>00432521    je          004326A2
 00432527    dec         eax
>00432528    je          004326C5
 0043252E    dec         eax
>0043252F    je          004326E8
>00432535    jmp         0043277F
 0043253A    sub         eax,15
>0043253D    je          00432733
 00432543    sub         eax,0EB
>00432548    je          00432755
 0043254E    sub         eax,2
>00432551    je          00432763
>00432557    jmp         0043277F
 0043255C    lea         edx,[ebp-8C]
 00432562    mov         eax,dword ptr [ebx+8]
 00432565    movsx       eax,word ptr [eax]
 00432568    call        IntToStr
 0043256D    mov         edx,dword ptr [ebp-8C]
 00432573    mov         eax,esi
 00432575    call        @UStrAsg
>0043257A    jmp         004327C9
 0043257F    lea         edx,[ebp-90]
 00432585    mov         eax,dword ptr [ebx+8]
 00432588    mov         eax,dword ptr [eax]
 0043258A    call        IntToStr
 0043258F    mov         edx,dword ptr [ebp-90]
 00432595    mov         eax,esi
 00432597    call        @UStrAsg
>0043259C    jmp         004327C9
 004325A1    mov         eax,dword ptr [ebx+8]
 004325A4    fld         dword ptr [eax]
 004325A6    fstp        tbyte ptr [ebp-40]
 004325A9    wait
 004325AA    movzx       eax,word ptr [ebp-38]
 004325AE    push        eax
 004325AF    push        dword ptr [ebp-3C]
 004325B2    push        dword ptr [ebp-40]
 004325B5    lea         edx,[ebp-0C]
 004325B8    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 004325BD    call        FloatToStr
 004325C2    mov         eax,esi
 004325C4    mov         edx,dword ptr [ebp-0C]
 004325C7    call        @UStrAsg
>004325CC    jmp         004327C9
 004325D1    mov         eax,dword ptr [ebx+8]
 004325D4    fld         qword ptr [eax]
 004325D6    fstp        tbyte ptr [ebp-50]
 004325D9    wait
 004325DA    movzx       eax,word ptr [ebp-48]
 004325DE    push        eax
 004325DF    push        dword ptr [ebp-4C]
 004325E2    push        dword ptr [ebp-50]
 004325E5    lea         edx,[ebp-10]
 004325E8    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 004325ED    call        FloatToStr
 004325F2    mov         eax,esi
 004325F4    mov         edx,dword ptr [ebp-10]
 004325F7    call        @UStrAsg
>004325FC    jmp         004327C9
 00432601    mov         eax,dword ptr [ebx+8]
 00432604    push        dword ptr [eax+4]
 00432607    push        dword ptr [eax]
 00432609    lea         eax,[ebp-94]
 0043260F    call        CurrToWStrViaOS
 00432614    mov         edx,dword ptr [ebp-94]
 0043261A    mov         eax,esi
 0043261C    call        @UStrFromWStr
>00432621    jmp         004327C9
 00432626    mov         eax,dword ptr [ebx+8]
 00432629    push        dword ptr [eax+4]
 0043262C    push        dword ptr [eax]
 0043262E    lea         eax,[ebp-98]
 00432634    call        DateToWStrViaOS
 00432639    mov         edx,dword ptr [ebp-98]
 0043263F    mov         eax,esi
 00432641    call        @UStrFromWStr
>00432646    jmp         004327C9
 0043264B    mov         eax,esi
 0043264D    mov         edx,dword ptr [ebx+8]
 00432650    mov         edx,dword ptr [edx]
 00432652    call        @UStrFromPWChar
>00432657    jmp         004327C9
 0043265C    lea         edx,[ebp-9C]
 00432662    mov         eax,dword ptr [ebx+8]
 00432665    movzx       eax,word ptr [eax]
 00432668    call        BoolToWStrViaOS
 0043266D    mov         edx,dword ptr [ebp-9C]
 00432673    mov         eax,esi
 00432675    call        @UStrFromWStr
>0043267A    jmp         004327C9
 0043267F    lea         edx,[ebp-0A0]
 00432685    mov         eax,dword ptr [ebx+8]
 00432688    movsx       eax,byte ptr [eax]
 0043268B    call        IntToStr
 00432690    mov         edx,dword ptr [ebp-0A0]
 00432696    mov         eax,esi
 00432698    call        @UStrAsg
>0043269D    jmp         004327C9
 004326A2    lea         edx,[ebp-0A4]
 004326A8    mov         eax,dword ptr [ebx+8]
 004326AB    movzx       eax,byte ptr [eax]
 004326AE    call        IntToStr
 004326B3    mov         edx,dword ptr [ebp-0A4]
 004326B9    mov         eax,esi
 004326BB    call        @UStrAsg
>004326C0    jmp         004327C9
 004326C5    lea         edx,[ebp-0A8]
 004326CB    mov         eax,dword ptr [ebx+8]
 004326CE    movzx       eax,word ptr [eax]
 004326D1    call        IntToStr
 004326D6    mov         edx,dword ptr [ebp-0A8]
 004326DC    mov         eax,esi
 004326DE    call        @UStrAsg
>004326E3    jmp         004327C9
 004326E8    mov         eax,dword ptr [ebx+8]
 004326EB    mov         eax,dword ptr [eax]
 004326ED    xor         edx,edx
 004326EF    push        edx
 004326F0    push        eax
 004326F1    lea         eax,[ebp-0AC]
 004326F7    call        IntToStr
 004326FC    mov         edx,dword ptr [ebp-0AC]
 00432702    mov         eax,esi
 00432704    call        @UStrAsg
>00432709    jmp         004327C9
 0043270E    mov         eax,dword ptr [ebx+8]
 00432711    push        dword ptr [eax+4]
 00432714    push        dword ptr [eax]
 00432716    lea         eax,[ebp-0B0]
 0043271C    call        IntToStr
 00432721    mov         edx,dword ptr [ebp-0B0]
 00432727    mov         eax,esi
 00432729    call        @UStrAsg
>0043272E    jmp         004327C9
 00432733    mov         eax,dword ptr [ebx+8]
 00432736    push        dword ptr [eax+4]
 00432739    push        dword ptr [eax]
 0043273B    lea         eax,[ebp-0B4]
 00432741    call        UIntToStr
 00432746    mov         edx,dword ptr [ebp-0B4]
 0043274C    mov         eax,esi
 0043274E    call        @UStrAsg
>00432753    jmp         004327C9
 00432755    mov         eax,esi
 00432757    mov         edx,dword ptr [ebx+8]
 0043275A    mov         edx,dword ptr [edx]
 0043275C    call        @UStrFromPChar
>00432761    jmp         004327C9
 00432763    mov         eax,esi
 00432765    mov         edx,dword ptr [ebx+8]
 00432768    mov         edx,dword ptr [edx]
 0043276A    call        @UStrFromPWChar
>0043276F    jmp         004327C9
 00432771    mov         eax,dword ptr [ebx+8]
 00432774    mov         edx,eax
 00432776    mov         eax,esi
 00432778    call        @VarToUStr
>0043277D    jmp         004327C9
 0043277F    lea         edx,[ebp-0B8]
 00432785    mov         eax,ebx
 00432787    call        VarToWStrViaOS
 0043278C    mov         edx,dword ptr [ebp-0B8]
 00432792    mov         eax,esi
 00432794    call        @UStrFromWStr
>00432799    jmp         004327C9
 0043279B    mov         eax,esi
 0043279D    call        @UStrClr
 004327A2    mov         edx,eax
 004327A4    mov         eax,ebx
 004327A6    call        VarToUStrCustom
 004327AB    test        al,al
>004327AD    jne         004327C9
 004327AF    lea         edx,[ebp-0BC]
 004327B5    mov         eax,ebx
 004327B7    call        VarToWStrViaOS
 004327BC    mov         edx,dword ptr [ebp-0BC]
 004327C2    mov         eax,esi
 004327C4    call        @UStrFromWStr
 004327C9    xor         eax,eax
 004327CB    pop         edx
 004327CC    pop         ecx
 004327CD    pop         ecx
 004327CE    mov         dword ptr fs:[eax],edx
 004327D1    push        432860
 004327D6    lea         eax,[ebp-0BC]
 004327DC    mov         edx,2
 004327E1    call        @WStrArrayClr
 004327E6    lea         eax,[ebp-0B4]
 004327EC    mov         edx,6
 004327F1    call        @UStrArrayClr
 004327F6    lea         eax,[ebp-9C]
 004327FC    mov         edx,3
 00432801    call        @WStrArrayClr
 00432806    lea         eax,[ebp-90]
 0043280C    mov         edx,3
 00432811    call        @UStrArrayClr
 00432816    lea         eax,[ebp-84]
 0043281C    call        @WStrClr
 00432821    lea         eax,[ebp-80]
 00432824    mov         edx,6
 00432829    call        @UStrArrayClr
 0043282E    lea         eax,[ebp-68]
 00432831    mov         edx,4
 00432836    call        @WStrArrayClr
 0043283B    lea         eax,[ebp-58]
 0043283E    mov         edx,2
 00432843    call        @UStrArrayClr
 00432848    lea         eax,[ebp-10]
 0043284B    mov         edx,4
 00432850    call        @UStrArrayClr
 00432855    ret
>00432856    jmp         @HandleFinally
>0043285B    jmp         004327D6
 00432860    pop         esi
 00432861    pop         ebx
 00432862    mov         esp,ebp
 00432864    pop         ebp
 00432865    ret
*}
end;

//00432868
procedure AnyToIntf(var Intf:IInterface; const V:TVarData);
begin
{*
 00432868    push        ebp
 00432869    mov         ebp,esp
 0043286B    add         esp,0FFFFFFF0
 0043286E    push        ebx
 0043286F    push        esi
 00432870    mov         esi,edx
 00432872    mov         ebx,eax
 00432874    lea         eax,[ebp-10]
 00432877    push        eax
 00432878    call        oleaut32.VariantInit
 0043287D    xor         eax,eax
 0043287F    push        ebp
 00432880    push        4328D2
 00432885    push        dword ptr fs:[eax]
 00432888    mov         dword ptr fs:[eax],esp
 0043288B    mov         edx,esi
 0043288D    lea         eax,[ebp-10]
 00432890    call        @VarCopy
 00432895    lea         eax,[ebp-10]
 00432898    call        dword ptr ds:[792F90]
 0043289E    cmp         word ptr [ebp-10],0D
>004328A3    je          004328B2
 004328A5    mov         dx,0D
 004328A9    mov         ax,101
 004328AD    call        VarCastError
 004328B2    mov         eax,ebx
 004328B4    mov         edx,dword ptr [ebp-8]
 004328B7    call        @IntfCopy
 004328BC    xor         eax,eax
 004328BE    pop         edx
 004328BF    pop         ecx
 004328C0    pop         ecx
 004328C1    mov         dword ptr fs:[eax],edx
 004328C4    push        4328D9
 004328C9    lea         eax,[ebp-10]
 004328CC    call        @VarClear
 004328D1    ret
>004328D2    jmp         @HandleFinally
>004328D7    jmp         004328C9
 004328D9    pop         esi
 004328DA    pop         ebx
 004328DB    mov         esp,ebp
 004328DD    pop         ebp
 004328DE    ret
*}
end;

//004328E0
procedure @VarToIntf(var Intf:IInterface; const V:TVarData);
begin
{*
 004328E0    push        ebx
 004328E1    push        esi
 004328E2    push        ecx
 004328E3    mov         ebx,edx
 004328E5    mov         esi,eax
 004328E7    movzx       eax,word ptr [ebx]
 004328EA    cmp         eax,0D
>004328ED    jg          004328FF
>004328EF    je          0043293C
 004328F1    sub         eax,1
>004328F4    jb          00432914
>004328F6    je          0043291D
 004328F8    sub         eax,8
>004328FB    je          0043293C
>004328FD    jmp         00432961
 004328FF    sub         eax,101
>00432904    je          00432956
 00432906    sub         eax,3F08
>0043290B    je          00432948
 0043290D    sub         eax,4
>00432910    je          00432948
>00432912    jmp         00432961
 00432914    mov         eax,esi
 00432916    call        @IntfClear
>0043291B    jmp         00432995
 0043291D    cmp         byte ptr ds:[784E6A],0
>00432924    je          00432933
 00432926    mov         dx,0D
 0043292A    mov         ax,1
 0043292E    call        VarCastError
 00432933    mov         eax,esi
 00432935    call        @IntfClear
>0043293A    jmp         00432995
 0043293C    mov         eax,esi
 0043293E    mov         edx,dword ptr [ebx+8]
 00432941    call        @IntfCopy
>00432946    jmp         00432995
 00432948    mov         eax,esi
 0043294A    mov         edx,dword ptr [ebx+8]
 0043294D    mov         edx,dword ptr [edx]
 0043294F    call        @IntfCopy
>00432954    jmp         00432995
 00432956    mov         edx,ebx
 00432958    mov         eax,esi
 0043295A    call        AnyToIntf
>0043295F    jmp         00432995
 00432961    mov         edx,esp
 00432963    movzx       eax,word ptr [ebx]
 00432966    call        FindCustomVariantType
 0043296B    test        al,al
>0043296D    je          00432989
 0043296F    mov         eax,esi
 00432971    call        @IntfClear
 00432976    mov         ecx,eax
 00432978    mov         edx,43299C
 0043297D    mov         eax,dword ptr [esp]
 00432980    call        TObject.GetInterface
 00432985    test        al,al
>00432987    jne         00432995
 00432989    movzx       eax,word ptr [ebx]
 0043298C    mov         dx,0D
 00432990    call        VarCastError
 00432995    pop         edx
 00432996    pop         esi
 00432997    pop         ebx
 00432998    ret
*}
end;

//004329AC
procedure @VarToDisp(var Dispatch:IDispatch; const V:TVarData);
begin
{*
 004329AC    push        ebx
 004329AD    push        esi
 004329AE    push        ecx
 004329AF    mov         ebx,edx
 004329B1    mov         esi,eax
 004329B3    movzx       eax,word ptr [ebx]
 004329B6    sub         ax,1
>004329BA    jb          004329CC
>004329BC    je          004329D5
 004329BE    sub         ax,8
>004329C2    je          004329F4
 004329C4    sub         ax,4000
>004329C8    je          00432A00
>004329CA    jmp         00432A0E
 004329CC    mov         eax,esi
 004329CE    call        @IntfClear
>004329D3    jmp         00432A42
 004329D5    cmp         byte ptr ds:[784E6A],0
>004329DC    je          004329EB
 004329DE    mov         dx,9
 004329E2    mov         ax,1
 004329E6    call        VarCastError
 004329EB    mov         eax,esi
 004329ED    call        @IntfClear
>004329F2    jmp         00432A42
 004329F4    mov         eax,esi
 004329F6    mov         edx,dword ptr [ebx+8]
 004329F9    call        @IntfCopy
>004329FE    jmp         00432A42
 00432A00    mov         eax,esi
 00432A02    mov         edx,dword ptr [ebx+8]
 00432A05    mov         edx,dword ptr [edx]
 00432A07    call        @IntfCopy
>00432A0C    jmp         00432A42
 00432A0E    mov         edx,esp
 00432A10    movzx       eax,word ptr [ebx]
 00432A13    call        FindCustomVariantType
 00432A18    test        al,al
>00432A1A    je          00432A36
 00432A1C    mov         eax,esi
 00432A1E    call        @IntfClear
 00432A23    mov         ecx,eax
 00432A25    mov         edx,432A48
 00432A2A    mov         eax,dword ptr [esp]
 00432A2D    call        TObject.GetInterface
 00432A32    test        al,al
>00432A34    jne         00432A42
 00432A36    movzx       eax,word ptr [ebx]
 00432A39    mov         dx,9
 00432A3D    call        VarCastError
 00432A42    pop         edx
 00432A43    pop         esi
 00432A44    pop         ebx
 00432A45    ret
*}
end;

//00432A58
procedure @VarFromInt(var V:TVarData; const Value:Integer; const Range:ShortInt);
begin
{*
 00432A58    push        ebx
 00432A59    push        esi
 00432A5A    push        edi
 00432A5B    mov         ebx,ecx
 00432A5D    mov         esi,edx
 00432A5F    mov         edi,eax
 00432A61    test        word ptr [edi],0BFE8
>00432A66    je          00432A6F
 00432A68    mov         eax,edi
 00432A6A    call        VarClearDeep
 00432A6F    cmp         byte ptr ds:[784E70],0
>00432A76    je          00432A88
 00432A78    movsx       eax,bl
 00432A7B    movzx       eax,word ptr [eax*2+784E98]
 00432A83    mov         word ptr [edi],ax
>00432A86    jmp         00432A8D
 00432A88    mov         word ptr [edi],3
 00432A8D    mov         dword ptr [edi+8],esi
 00432A90    pop         edi
 00432A91    pop         esi
 00432A92    pop         ebx
 00432A93    ret
*}
end;

//00432A94
procedure @VarFromInteger(var V:TVarData; const Value:Integer);
begin
{*
 00432A94    push        ebx
 00432A95    push        esi
 00432A96    mov         esi,edx
 00432A98    mov         ebx,eax
 00432A9A    test        word ptr [ebx],0BFE8
>00432A9F    je          00432AA8
 00432AA1    mov         eax,ebx
 00432AA3    call        VarClearDeep
 00432AA8    mov         word ptr [ebx],3
 00432AAD    mov         dword ptr [ebx+8],esi
 00432AB0    pop         esi
 00432AB1    pop         ebx
 00432AB2    ret
*}
end;

//00432AB4
procedure @OleVarFromInt(var V:TVarData; const Value:Integer; const Range:ShortInt);
begin
{*
 00432AB4    push        ebx
 00432AB5    push        esi
 00432AB6    mov         esi,edx
 00432AB8    mov         ebx,eax
 00432ABA    test        word ptr [ebx],0BFE8
>00432ABF    je          00432AC8
 00432AC1    mov         eax,ebx
 00432AC3    call        VarClearDeep
 00432AC8    mov         word ptr [ebx],3
 00432ACD    mov         dword ptr [ebx+8],esi
 00432AD0    pop         esi
 00432AD1    pop         ebx
 00432AD2    ret
*}
end;

//00432AD4
procedure @VarFromByte(var V:TVarData; const Value:Byte);
begin
{*
 00432AD4    push        ebx
 00432AD5    push        esi
 00432AD6    mov         ebx,edx
 00432AD8    mov         esi,eax
 00432ADA    test        word ptr [esi],0BFE8
>00432ADF    je          00432AE8
 00432AE1    mov         eax,esi
 00432AE3    call        VarClearDeep
 00432AE8    mov         word ptr [esi],11
 00432AED    mov         byte ptr [esi+8],bl
 00432AF0    pop         esi
 00432AF1    pop         ebx
 00432AF2    ret
*}
end;

//00432AF4
procedure @VarFromWord(var V:TVarData; const Value:Word);
begin
{*
 00432AF4    push        ebx
 00432AF5    push        esi
 00432AF6    mov         esi,edx
 00432AF8    mov         ebx,eax
 00432AFA    test        word ptr [ebx],0BFE8
>00432AFF    je          00432B08
 00432B01    mov         eax,ebx
 00432B03    call        VarClearDeep
 00432B08    mov         word ptr [ebx],12
 00432B0D    mov         word ptr [ebx+8],si
 00432B11    pop         esi
 00432B12    pop         ebx
 00432B13    ret
*}
end;

//00432B14
procedure @VarFromLongWord(var V:TVarData; const Value:LongWord);
begin
{*
 00432B14    push        ebx
 00432B15    push        esi
 00432B16    mov         esi,edx
 00432B18    mov         ebx,eax
 00432B1A    test        word ptr [ebx],0BFE8
>00432B1F    je          00432B28
 00432B21    mov         eax,ebx
 00432B23    call        VarClearDeep
 00432B28    mov         word ptr [ebx],13
 00432B2D    mov         dword ptr [ebx+8],esi
 00432B30    pop         esi
 00432B31    pop         ebx
 00432B32    ret
*}
end;

//00432B34
procedure @VarFromUInt64(var V:TVarData; const Value:UInt64);
begin
{*
 00432B34    push        ebp
 00432B35    mov         ebp,esp
 00432B37    push        ebx
 00432B38    mov         ebx,eax
 00432B3A    test        word ptr [ebx],0BFE8
>00432B3F    je          00432B48
 00432B41    mov         eax,ebx
 00432B43    call        VarClearDeep
 00432B48    mov         word ptr [ebx],15
 00432B4D    mov         eax,dword ptr [ebp+8]
 00432B50    mov         dword ptr [ebx+8],eax
 00432B53    mov         eax,dword ptr [ebp+0C]
 00432B56    mov         dword ptr [ebx+0C],eax
 00432B59    pop         ebx
 00432B5A    pop         ebp
 00432B5B    ret         8
*}
end;

//00432B60
procedure @VarFromShortInt(var V:TVarData; const Value:ShortInt);
begin
{*
 00432B60    push        ebx
 00432B61    push        esi
 00432B62    mov         ebx,edx
 00432B64    mov         esi,eax
 00432B66    test        word ptr [esi],0BFE8
>00432B6B    je          00432B74
 00432B6D    mov         eax,esi
 00432B6F    call        VarClearDeep
 00432B74    mov         word ptr [esi],10
 00432B79    mov         byte ptr [esi+8],bl
 00432B7C    pop         esi
 00432B7D    pop         ebx
 00432B7E    ret
*}
end;

//00432B80
procedure @VarFromSmallInt(var V:TVarData; const Value:SmallInt);
begin
{*
 00432B80    push        ebx
 00432B81    push        esi
 00432B82    mov         esi,edx
 00432B84    mov         ebx,eax
 00432B86    test        word ptr [ebx],0BFE8
>00432B8B    je          00432B94
 00432B8D    mov         eax,ebx
 00432B8F    call        VarClearDeep
 00432B94    mov         word ptr [ebx],2
 00432B99    mov         word ptr [ebx+8],si
 00432B9D    pop         esi
 00432B9E    pop         ebx
 00432B9F    ret
*}
end;

//00432BA0
procedure @VarFromInt64(var V:TVarData; const Value:Int64);
begin
{*
 00432BA0    push        ebp
 00432BA1    mov         ebp,esp
 00432BA3    push        ebx
 00432BA4    mov         ebx,eax
 00432BA6    test        word ptr [ebx],0BFE8
>00432BAB    je          00432BB4
 00432BAD    mov         eax,ebx
 00432BAF    call        VarClearDeep
 00432BB4    mov         word ptr [ebx],14
 00432BB9    mov         eax,dword ptr [ebp+8]
 00432BBC    mov         dword ptr [ebx+8],eax
 00432BBF    mov         eax,dword ptr [ebp+0C]
 00432BC2    mov         dword ptr [ebx+0C],eax
 00432BC5    pop         ebx
 00432BC6    pop         ebp
 00432BC7    ret         8
*}
end;

//00432BCC
procedure @VarFromSingle(var Dest:TVarData; const Value:Single);
begin
{*
 00432BCC    push        ebp
 00432BCD    mov         ebp,esp
 00432BCF    push        ebx
 00432BD0    mov         ebx,eax
 00432BD2    test        word ptr [ebx],0BFE8
>00432BD7    je          00432BE0
 00432BD9    mov         eax,ebx
 00432BDB    call        VarClearDeep
 00432BE0    mov         eax,dword ptr [ebp+8]
 00432BE3    mov         dword ptr [ebx+8],eax
 00432BE6    mov         word ptr [ebx],4
 00432BEB    pop         ebx
 00432BEC    pop         ebp
 00432BED    ret         4
*}
end;

//00432BF0
procedure @VarFromDouble(var Dest:TVarData; const Value:Double);
begin
{*
 00432BF0    push        ebp
 00432BF1    mov         ebp,esp
 00432BF3    push        ebx
 00432BF4    mov         ebx,eax
 00432BF6    test        word ptr [ebx],0BFE8
>00432BFB    je          00432C04
 00432BFD    mov         eax,ebx
 00432BFF    call        VarClearDeep
 00432C04    mov         eax,dword ptr [ebp+8]
 00432C07    mov         dword ptr [ebx+8],eax
 00432C0A    mov         eax,dword ptr [ebp+0C]
 00432C0D    mov         dword ptr [ebx+0C],eax
 00432C10    mov         word ptr [ebx],5
 00432C15    pop         ebx
 00432C16    pop         ebp
 00432C17    ret         8
*}
end;

//00432C1C
procedure @VarFromCurrency(var Dest:TVarData; const Value:Currency);
begin
{*
 00432C1C    push        ebp
 00432C1D    mov         ebp,esp
 00432C1F    push        ebx
 00432C20    mov         ebx,eax
 00432C22    test        word ptr [ebx],0BFE8
>00432C27    je          00432C30
 00432C29    mov         eax,ebx
 00432C2B    call        VarClearDeep
 00432C30    mov         eax,dword ptr [ebp+8]
 00432C33    mov         dword ptr [ebx+8],eax
 00432C36    mov         eax,dword ptr [ebp+0C]
 00432C39    mov         dword ptr [ebx+0C],eax
 00432C3C    mov         word ptr [ebx],6
 00432C41    pop         ebx
 00432C42    pop         ebp
 00432C43    ret         8
*}
end;

//00432C48
procedure @VarFromDate(var Dest:TVarData; const Value:TDateTime);
begin
{*
 00432C48    push        ebp
 00432C49    mov         ebp,esp
 00432C4B    push        ebx
 00432C4C    mov         ebx,eax
 00432C4E    test        word ptr [ebx],0BFE8
>00432C53    je          00432C5C
 00432C55    mov         eax,ebx
 00432C57    call        VarClearDeep
 00432C5C    mov         eax,dword ptr [ebp+8]
 00432C5F    mov         dword ptr [ebx+8],eax
 00432C62    mov         eax,dword ptr [ebp+0C]
 00432C65    mov         dword ptr [ebx+0C],eax
 00432C68    mov         word ptr [ebx],7
 00432C6D    pop         ebx
 00432C6E    pop         ebp
 00432C6F    ret         8
*}
end;

//00432C74
procedure @VarFromBool(var V:TVarData; const Value:Boolean);
begin
{*
 00432C74    push        ebx
 00432C75    push        esi
 00432C76    mov         ebx,edx
 00432C78    mov         esi,eax
 00432C7A    test        word ptr [esi],0BFE8
>00432C7F    je          00432C88
 00432C81    mov         eax,esi
 00432C83    call        VarClearDeep
 00432C88    mov         word ptr [esi],0B
 00432C8D    cmp         bl,1
 00432C90    cmc
 00432C91    sbb         eax,eax
 00432C93    mov         word ptr [esi+8],ax
 00432C97    pop         esi
 00432C98    pop         ebx
 00432C99    ret
*}
end;

//00432C9C
procedure @VarFromReal(var v:Variant);
begin
{*
 00432C9C    push        eax
 00432C9D    call        @VarClear
 00432CA2    pop         eax
 00432CA3    mov         word ptr [eax],5
 00432CA8    fstp        qword ptr [eax+8]
 00432CAB    wait
 00432CAC    ret
*}
end;

//00432CB0
procedure @VarFromTDateTime(var v:Variant);
begin
{*
 00432CB0    push        eax
 00432CB1    call        @VarClear
 00432CB6    pop         eax
 00432CB7    mov         word ptr [eax],7
 00432CBC    fstp        qword ptr [eax+8]
 00432CBF    wait
 00432CC0    ret
*}
end;

//00432CC4
procedure @VarFromCurr(var v:Variant);
begin
{*
 00432CC4    push        eax
 00432CC5    call        @VarClear
 00432CCA    pop         eax
 00432CCB    mov         word ptr [eax],6
 00432CD0    fistp       qword ptr [eax+8]
 00432CD3    wait
 00432CD4    ret
*}
end;

//00432CD8
procedure @VarFromLStr(var V:TVarData; const Value:AnsiString);
begin
{*
 00432CD8    push        ebx
 00432CD9    push        esi
 00432CDA    mov         esi,edx
 00432CDC    mov         ebx,eax
 00432CDE    test        word ptr [ebx],0BFE8
>00432CE3    je          00432CEC
 00432CE5    mov         eax,ebx
 00432CE7    call        VarClearDeep
 00432CEC    xor         eax,eax
 00432CEE    mov         dword ptr [ebx+8],eax
 00432CF1    mov         word ptr [ebx],100
 00432CF6    lea         eax,[ebx+8]
 00432CF9    mov         edx,esi
 00432CFB    call        @LStrAsg
 00432D00    pop         esi
 00432D01    pop         ebx
 00432D02    ret
*}
end;

//00432D04
procedure @VarFromWStr(var V:TVarData; const Value:WideString);
begin
{*
 00432D04    push        ebx
 00432D05    push        esi
 00432D06    mov         esi,edx
 00432D08    mov         ebx,eax
 00432D0A    test        word ptr [ebx],0BFE8
>00432D0F    je          00432D18
 00432D11    mov         eax,ebx
 00432D13    call        VarClearDeep
 00432D18    xor         eax,eax
 00432D1A    mov         dword ptr [ebx+8],eax
 00432D1D    mov         word ptr [ebx],8
 00432D22    lea         eax,[ebx+8]
 00432D25    push        eax
 00432D26    mov         ecx,7FFFFFFF
 00432D2B    mov         edx,1
 00432D30    mov         eax,esi
 00432D32    call        @WStrCopy
 00432D37    pop         esi
 00432D38    pop         ebx
 00432D39    ret
*}
end;

//00432D3C
procedure @VarFromUStr(var V:TVarData; const Value:UnicodeString);
begin
{*
 00432D3C    push        ebx
 00432D3D    push        esi
 00432D3E    mov         esi,edx
 00432D40    mov         ebx,eax
 00432D42    test        word ptr [ebx],0BFE8
>00432D47    je          00432D50
 00432D49    mov         eax,ebx
 00432D4B    call        VarClearDeep
 00432D50    xor         eax,eax
 00432D52    mov         dword ptr [ebx+8],eax
 00432D55    mov         word ptr [ebx],102
 00432D5A    lea         eax,[ebx+8]
 00432D5D    mov         edx,esi
 00432D5F    call        @UStrAsg
 00432D64    pop         esi
 00432D65    pop         ebx
 00432D66    ret
*}
end;

//00432D68
procedure @VarFromIntf(var V:TVarData; const Value:IInterface);
begin
{*
 00432D68    push        ebx
 00432D69    push        esi
 00432D6A    mov         esi,edx
 00432D6C    mov         ebx,eax
 00432D6E    test        word ptr [ebx],0BFE8
>00432D73    je          00432D7C
 00432D75    mov         eax,ebx
 00432D77    call        VarClearDeep
 00432D7C    xor         eax,eax
 00432D7E    mov         dword ptr [ebx+8],eax
 00432D81    mov         word ptr [ebx],0D
 00432D86    lea         eax,[ebx+8]
 00432D89    mov         edx,esi
 00432D8B    call        @IntfCopy
 00432D90    pop         esi
 00432D91    pop         ebx
 00432D92    ret
*}
end;

//00432D94
procedure @VarFromDisp(var V:TVarData; const Value:IDispatch);
begin
{*
 00432D94    push        ebx
 00432D95    push        esi
 00432D96    mov         esi,edx
 00432D98    mov         ebx,eax
 00432D9A    test        word ptr [ebx],0BFE8
>00432D9F    je          00432DA8
 00432DA1    mov         eax,ebx
 00432DA3    call        VarClearDeep
 00432DA8    xor         eax,eax
 00432DAA    mov         dword ptr [ebx+8],eax
 00432DAD    mov         word ptr [ebx],9
 00432DB2    lea         eax,[ebx+8]
 00432DB5    mov         edx,esi
 00432DB7    call        @IntfCopy
 00432DBC    pop         esi
 00432DBD    pop         ebx
 00432DBE    ret
*}
end;

//00432DC0
procedure @OleVarFromLStr(var V:TVarData; const Value:AnsiString);
begin
{*
 00432DC0    push        ebp
 00432DC1    mov         ebp,esp
 00432DC3    push        0
 00432DC5    push        ebx
 00432DC6    push        esi
 00432DC7    mov         esi,edx
 00432DC9    mov         ebx,eax
 00432DCB    xor         eax,eax
 00432DCD    push        ebp
 00432DCE    push        432E03
 00432DD3    push        dword ptr fs:[eax]
 00432DD6    mov         dword ptr fs:[eax],esp
 00432DD9    lea         eax,[ebp-4]
 00432DDC    mov         edx,esi
 00432DDE    call        @WStrFromLStr
 00432DE3    mov         edx,dword ptr [ebp-4]
 00432DE6    mov         eax,ebx
 00432DE8    call        @VarFromWStr
 00432DED    xor         eax,eax
 00432DEF    pop         edx
 00432DF0    pop         ecx
 00432DF1    pop         ecx
 00432DF2    mov         dword ptr fs:[eax],edx
 00432DF5    push        432E0A
 00432DFA    lea         eax,[ebp-4]
 00432DFD    call        @WStrClr
 00432E02    ret
>00432E03    jmp         @HandleFinally
>00432E08    jmp         00432DFA
 00432E0A    pop         esi
 00432E0B    pop         ebx
 00432E0C    pop         ecx
 00432E0D    pop         ebp
 00432E0E    ret
*}
end;

//00432E10
procedure @OleVarFromUStr(var V:TVarData; const Value:UnicodeString);
begin
{*
 00432E10    push        ebp
 00432E11    mov         ebp,esp
 00432E13    push        0
 00432E15    push        ebx
 00432E16    push        esi
 00432E17    mov         esi,edx
 00432E19    mov         ebx,eax
 00432E1B    xor         eax,eax
 00432E1D    push        ebp
 00432E1E    push        432E53
 00432E23    push        dword ptr fs:[eax]
 00432E26    mov         dword ptr fs:[eax],esp
 00432E29    lea         eax,[ebp-4]
 00432E2C    mov         edx,esi
 00432E2E    call        @WStrFromUStr
 00432E33    mov         edx,dword ptr [ebp-4]
 00432E36    mov         eax,ebx
 00432E38    call        @VarFromWStr
 00432E3D    xor         eax,eax
 00432E3F    pop         edx
 00432E40    pop         ecx
 00432E41    pop         ecx
 00432E42    mov         dword ptr fs:[eax],edx
 00432E45    push        432E5A
 00432E4A    lea         eax,[ebp-4]
 00432E4D    call        @WStrClr
 00432E52    ret
>00432E53    jmp         @HandleFinally
>00432E58    jmp         00432E4A
 00432E5A    pop         esi
 00432E5B    pop         ebx
 00432E5C    pop         ecx
 00432E5D    pop         ebp
 00432E5E    ret
*}
end;

//00432E60
procedure OleVarFromAny(var V:TVarData; const Value:TVarData);
begin
{*
 00432E60    push        ebp
 00432E61    mov         ebp,esp
 00432E63    add         esp,0FFFFFFF0
 00432E66    push        ebx
 00432E67    push        esi
 00432E68    mov         esi,edx
 00432E6A    mov         ebx,eax
 00432E6C    lea         eax,[ebp-10]
 00432E6F    push        eax
 00432E70    call        oleaut32.VariantInit
 00432E75    xor         eax,eax
 00432E77    push        ebp
 00432E78    push        432EB6
 00432E7D    push        dword ptr fs:[eax]
 00432E80    mov         dword ptr fs:[eax],esp
 00432E83    mov         edx,esi
 00432E85    lea         eax,[ebp-10]
 00432E88    call        @VarCopy
 00432E8D    lea         eax,[ebp-10]
 00432E90    call        dword ptr ds:[792F90]
 00432E96    lea         edx,[ebp-10]
 00432E99    mov         eax,ebx
 00432E9B    call        @VarCopy
 00432EA0    xor         eax,eax
 00432EA2    pop         edx
 00432EA3    pop         ecx
 00432EA4    pop         ecx
 00432EA5    mov         dword ptr fs:[eax],edx
 00432EA8    push        432EBD
 00432EAD    lea         eax,[ebp-10]
 00432EB0    call        @VarClear
 00432EB5    ret
>00432EB6    jmp         @HandleFinally
>00432EBB    jmp         00432EAD
 00432EBD    pop         esi
 00432EBE    pop         ebx
 00432EBF    mov         esp,ebp
 00432EC1    pop         ebp
 00432EC2    ret
*}
end;

//00432EC4
procedure OleVarFromVarArrayProc(var Dest:TVarData; const Src:TVarData);
begin
{*
 00432EC4    call        @OleVarFromVar
 00432EC9    ret
*}
end;

//00432ECC
procedure @OleVarFromVar(var Dest:TVarData; const Source:TVarData);
begin
{*
 00432ECC    push        ebp
 00432ECD    mov         ebp,esp
 00432ECF    add         esp,0FFFFFFF8
 00432ED2    push        ebx
 00432ED3    push        esi
 00432ED4    push        edi
 00432ED5    xor         ecx,ecx
 00432ED7    mov         dword ptr [ebp-8],ecx
 00432EDA    mov         ebx,edx
 00432EDC    mov         esi,eax
 00432EDE    xor         eax,eax
 00432EE0    push        ebp
 00432EE1    push        433085
 00432EE6    push        dword ptr fs:[eax]
 00432EE9    mov         dword ptr fs:[eax],esp
 00432EEC    cmp         word ptr [ebx],400C
>00432EF1    jne         00432F04
 00432EF3    mov         eax,dword ptr [ebx+8]
 00432EF6    mov         edx,eax
 00432EF8    mov         eax,esi
 00432EFA    call        @OleVarFromVar
>00432EFF    jmp         0043306F
 00432F04    test        word ptr [esi],0BFE8
>00432F09    je          00432F12
 00432F0B    mov         eax,esi
 00432F0D    call        VarClearDeep
 00432F12    movzx       edi,word ptr [ebx]
 00432F15    movzx       eax,di
 00432F18    cmp         eax,100
>00432F1D    jg          00432F37
>00432F1F    je          00432FF2
 00432F25    add         eax,0FFFFFFF0
 00432F28    sub         eax,3
>00432F2B    jb          00432F4E
>00432F2D    je          00432F61
 00432F2F    dec         eax
>00432F30    je          00432F8D
>00432F32    jmp         00433020
 00432F37    sub         eax,101
>00432F3C    je          00433015
 00432F42    dec         eax
>00432F43    je          00432FFE
>00432F49    jmp         00433020
 00432F4E    mov         edx,ebx
 00432F50    mov         eax,esi
 00432F52    mov         ecx,3
 00432F57    call        @VarCast
>00432F5C    jmp         0043306F
 00432F61    test        byte ptr [ebx+0B],80
>00432F65    je          00432F7A
 00432F67    mov         edx,ebx
 00432F69    mov         eax,esi
 00432F6B    mov         ecx,5
 00432F70    call        @VarCast
>00432F75    jmp         0043306F
 00432F7A    mov         edx,ebx
 00432F7C    mov         eax,esi
 00432F7E    mov         ecx,3
 00432F83    call        @VarCast
>00432F88    jmp         0043306F
 00432F8D    cmp         dword ptr [ebx+0C],0
>00432F91    jne         00432F9E
 00432F93    cmp         dword ptr [ebx+8],7FFFFFFF
>00432F9A    ja          00432FC6
>00432F9C    jmp         00432FA0
>00432F9E    jg          00432FC6
 00432FA0    cmp         dword ptr [ebx+0C],0FFFFFFFF
>00432FA4    jne         00432FB1
 00432FA6    cmp         dword ptr [ebx+8],80000000
>00432FAD    jb          00432FC6
>00432FAF    jmp         00432FB3
>00432FB1    jl          00432FC6
 00432FB3    mov         edx,ebx
 00432FB5    mov         eax,esi
 00432FB7    mov         ecx,3
 00432FBC    call        @VarCast
>00432FC1    jmp         0043306F
 00432FC6    cmp         byte ptr ds:[784E72],0
>00432FCD    jne         00432FE2
 00432FCF    mov         edx,ebx
 00432FD1    mov         eax,esi
 00432FD3    mov         ecx,14
 00432FD8    call        @VarCast
>00432FDD    jmp         0043306F
 00432FE2    mov         edx,ebx
 00432FE4    mov         eax,esi
 00432FE6    mov         ecx,5
 00432FEB    call        @VarCast
>00432FF0    jmp         0043306F
 00432FF2    mov         edx,dword ptr [ebx+8]
 00432FF5    mov         eax,esi
 00432FF7    call        @OleVarFromLStr
>00432FFC    jmp         0043306F
 00432FFE    lea         eax,[ebp-8]
 00433001    mov         edx,dword ptr [ebx+8]
 00433004    call        @WStrFromUStr
 00433009    mov         edx,dword ptr [ebp-8]
 0043300C    mov         eax,esi
 0043300E    call        @VarFromWStr
>00433013    jmp         0043306F
 00433015    mov         edx,ebx
 00433017    mov         eax,esi
 00433019    call        OleVarFromAny
>0043301E    jmp         0043306F
 00433020    test        di,2000
>00433025    je          00433037
 00433027    mov         ecx,432EC4;OleVarFromVarArrayProc
 0043302C    mov         edx,ebx
 0043302E    mov         eax,esi
 00433030    call        VarArrayCopyForEach
>00433035    jmp         0043306F
 00433037    mov         eax,edi
 00433039    and         ax,0FFF
 0043303D    cmp         ax,10F
>00433041    jae         0043304E
 00433043    mov         edx,ebx
 00433045    mov         eax,esi
 00433047    call        @VarCopy
>0043304C    jmp         0043306F
 0043304E    lea         edx,[ebp-4]
 00433051    mov         eax,edi
 00433053    call        FindCustomVariantType
 00433058    test        al,al
>0043305A    je          0043306A
 0043305C    mov         ecx,ebx
 0043305E    mov         edx,esi
 00433060    mov         eax,dword ptr [ebp-4]
 00433063    mov         ebx,dword ptr [eax]
 00433065    call        dword ptr [ebx+20]
>00433068    jmp         0043306F
 0043306A    call        VarCastError
 0043306F    xor         eax,eax
 00433071    pop         edx
 00433072    pop         ecx
 00433073    pop         ecx
 00433074    mov         dword ptr fs:[eax],edx
 00433077    push        43308C
 0043307C    lea         eax,[ebp-8]
 0043307F    call        @WStrClr
 00433084    ret
>00433085    jmp         @HandleFinally
>0043308A    jmp         0043307C
 0043308C    pop         edi
 0043308D    pop         esi
 0043308E    pop         ebx
 0043308F    pop         ecx
 00433090    pop         ecx
 00433091    pop         ebp
 00433092    ret
*}
end;

//00433094
procedure VarStrCat(var Dest:Variant; const Source:Variant);
begin
{*
 00433094    push        ebp
 00433095    mov         ebp,esp
 00433097    xor         ecx,ecx
 00433099    push        ecx
 0043309A    push        ecx
 0043309B    push        ecx
 0043309C    push        ecx
 0043309D    push        ecx
 0043309E    push        ecx
 0043309F    push        ebx
 004330A0    push        esi
 004330A1    mov         esi,edx
 004330A3    mov         ebx,eax
 004330A5    xor         eax,eax
 004330A7    push        ebp
 004330A8    push        43317C
 004330AD    push        dword ptr fs:[eax]
 004330B0    mov         dword ptr fs:[eax],esp
 004330B3    movzx       eax,word ptr [ebx]
 004330B6    cmp         ax,100
>004330BA    jne         004330E9
 004330BC    lea         eax,[ebp-4]
 004330BF    mov         edx,ebx
 004330C1    call        @VarToLStr
 004330C6    lea         eax,[ebp-4]
 004330C9    push        eax
 004330CA    lea         eax,[ebp-8]
 004330CD    mov         edx,esi
 004330CF    call        @VarToLStr
 004330D4    mov         edx,dword ptr [ebp-8]
 004330D7    pop         eax
 004330D8    call        @LStrCat
 004330DD    mov         edx,dword ptr [ebp-4]
 004330E0    mov         eax,ebx
 004330E2    call        @VarFromLStr
>004330E7    jmp         00433147
 004330E9    cmp         ax,102
>004330ED    jne         0043311C
 004330EF    lea         eax,[ebp-0C]
 004330F2    mov         edx,ebx
 004330F4    call        @VarToUStr
 004330F9    lea         eax,[ebp-0C]
 004330FC    push        eax
 004330FD    lea         eax,[ebp-10]
 00433100    mov         edx,esi
 00433102    call        @VarToUStr
 00433107    mov         edx,dword ptr [ebp-10]
 0043310A    pop         eax
 0043310B    call        @UStrCat
 00433110    mov         edx,dword ptr [ebp-0C]
 00433113    mov         eax,ebx
 00433115    call        @VarFromUStr
>0043311A    jmp         00433147
 0043311C    lea         eax,[ebp-14]
 0043311F    mov         edx,ebx
 00433121    call        @VarToWStr
 00433126    lea         eax,[ebp-14]
 00433129    push        eax
 0043312A    lea         eax,[ebp-18]
 0043312D    mov         edx,esi
 0043312F    call        @VarToWStr
 00433134    mov         edx,dword ptr [ebp-18]
 00433137    pop         eax
 00433138    call        @WStrCat
 0043313D    mov         edx,dword ptr [ebp-14]
 00433140    mov         eax,ebx
 00433142    call        @VarFromWStr
 00433147    xor         eax,eax
 00433149    pop         edx
 0043314A    pop         ecx
 0043314B    pop         ecx
 0043314C    mov         dword ptr fs:[eax],edx
 0043314F    push        433183
 00433154    lea         eax,[ebp-18]
 00433157    mov         edx,2
 0043315C    call        @WStrArrayClr
 00433161    lea         eax,[ebp-10]
 00433164    mov         edx,2
 00433169    call        @UStrArrayClr
 0043316E    lea         eax,[ebp-8]
 00433171    mov         edx,2
 00433176    call        @LStrArrayClr
 0043317B    ret
>0043317C    jmp         @HandleFinally
>00433181    jmp         00433154
 00433183    pop         esi
 00433184    pop         ebx
 00433185    mov         esp,ebp
 00433187    pop         ebp
 00433188    ret
*}
end;

//0043318C
procedure VarOpRare(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);
begin
{*
 0043318C    push        ebp
 0043318D    mov         ebp,esp
 0043318F    add         esp,0FFFFFFD8
 00433192    push        ebx
 00433193    mov         dword ptr [ebp-0C],ecx
 00433196    mov         dword ptr [ebp-8],edx
 00433199    mov         dword ptr [ebp-4],eax
 0043319C    mov         ebx,dword ptr [ebp-4]
 0043319F    movzx       ebx,word ptr [ebx]
 004331A2    mov         eax,ebx
 004331A4    and         ax,0FFF
 004331A8    cmp         ax,10F
>004331AC    jae         004332CE
 004331B2    lea         edx,[ebp-18]
 004331B5    mov         eax,dword ptr [ebp-8]
 004331B8    movzx       eax,word ptr [eax]
 004331BB    call        FindCustomVariantType
 004331C0    test        al,al
>004331C2    jne         004331CE
 004331C4    call        VarInvalidOp
>004331C9    jmp         004334D1
 004331CE    lea         eax,[ebp-0E]
 004331D1    push        eax
 004331D2    mov         edx,dword ptr [ebp-4]
 004331D5    mov         ecx,dword ptr [ebp-0C]
 004331D8    mov         eax,dword ptr [ebp-18]
 004331DB    mov         ebx,dword ptr [eax]
 004331DD    call        dword ptr [ebx+4]
 004331E0    test        al,al
>004331E2    je          0043326A
 004331E8    mov         eax,dword ptr [ebp-4]
 004331EB    movzx       eax,word ptr [eax]
 004331EE    cmp         ax,word ptr [ebp-0E]
>004331F2    je          00433253
 004331F4    lea         eax,[ebp-28]
 004331F7    push        eax
 004331F8    call        oleaut32.VariantInit
 004331FD    xor         eax,eax
 004331FF    push        ebp
 00433200    push        43324C
 00433205    push        dword ptr fs:[eax]
 00433208    mov         dword ptr fs:[eax],esp
 0043320B    movzx       ecx,word ptr [ebp-0E]
 0043320F    mov         edx,dword ptr [ebp-4]
 00433212    lea         eax,[ebp-28]
 00433215    call        @VarCast
 0043321A    lea         edx,[ebp-28]
 0043321D    mov         eax,dword ptr [ebp-4]
 00433220    call        @VarCopy
 00433225    mov         eax,dword ptr [ebp-4]
 00433228    movzx       eax,word ptr [eax]
 0043322B    cmp         ax,word ptr [ebp-0E]
>0043322F    je          00433236
 00433231    call        VarCastError
 00433236    xor         eax,eax
 00433238    pop         edx
 00433239    pop         ecx
 0043323A    pop         ecx
 0043323B    mov         dword ptr fs:[eax],edx
 0043323E    push        433253
 00433243    lea         eax,[ebp-28]
 00433246    call        @VarClear
 0043324B    ret
>0043324C    jmp         @HandleFinally
>00433251    jmp         00433243
 00433253    mov         eax,dword ptr [ebp-0C]
 00433256    push        eax
 00433257    mov         ecx,dword ptr [ebp-8]
 0043325A    mov         edx,dword ptr [ebp-4]
 0043325D    mov         eax,dword ptr [ebp-18]
 00433260    mov         ebx,dword ptr [eax]
 00433262    call        dword ptr [ebx+2C]
>00433265    jmp         004334D1
 0043326A    lea         eax,[ebp-28]
 0043326D    push        eax
 0043326E    call        oleaut32.VariantInit
 00433273    xor         eax,eax
 00433275    push        ebp
 00433276    push        4332C7
 0043327B    push        dword ptr fs:[eax]
 0043327E    mov         dword ptr fs:[eax],esp
 00433281    mov         ecx,dword ptr [ebp-4]
 00433284    movzx       ecx,word ptr [ecx]
 00433287    mov         edx,dword ptr [ebp-8]
 0043328A    lea         eax,[ebp-28]
 0043328D    call        @VarCast
 00433292    mov         eax,dword ptr [ebp-4]
 00433295    movzx       eax,word ptr [eax]
 00433298    cmp         ax,word ptr [ebp-28]
>0043329C    je          004332A3
 0043329E    call        VarCastError
 004332A3    lea         edx,[ebp-28]
 004332A6    mov         eax,dword ptr [ebp-4]
 004332A9    mov         ecx,dword ptr [ebp-0C]
 004332AC    call        @VarOp
 004332B1    xor         eax,eax
 004332B3    pop         edx
 004332B4    pop         ecx
 004332B5    pop         ecx
 004332B6    mov         dword ptr fs:[eax],edx
 004332B9    push        4334D1
 004332BE    lea         eax,[ebp-28]
 004332C1    call        @VarClear
 004332C6    ret
>004332C7    jmp         @HandleFinally
>004332CC    jmp         004332BE
 004332CE    lea         edx,[ebp-14]
 004332D1    mov         eax,dword ptr [ebp-4]
 004332D4    mov         eax,ebx
 004332D6    call        FindCustomVariantType
 004332DB    test        al,al
>004332DD    jne         004332E4
 004332DF    call        VarInvalidOp
 004332E4    lea         eax,[ebp-10]
 004332E7    push        eax
 004332E8    mov         edx,dword ptr [ebp-8]
 004332EB    mov         ecx,dword ptr [ebp-0C]
 004332EE    mov         eax,dword ptr [ebp-14]
 004332F1    mov         ebx,dword ptr [eax]
 004332F3    call        dword ptr [ebx+8]
 004332F6    test        al,al
>004332F8    je          00433385
 004332FE    mov         eax,dword ptr [ebp-8]
 00433301    movzx       eax,word ptr [eax]
 00433304    cmp         ax,word ptr [ebp-10]
>00433308    je          0043336E
 0043330A    lea         eax,[ebp-28]
 0043330D    push        eax
 0043330E    call        oleaut32.VariantInit
 00433313    xor         eax,eax
 00433315    push        ebp
 00433316    push        433367
 0043331B    push        dword ptr fs:[eax]
 0043331E    mov         dword ptr fs:[eax],esp
 00433321    movzx       ecx,word ptr [ebp-10]
 00433325    mov         edx,dword ptr [ebp-8]
 00433328    lea         eax,[ebp-28]
 0043332B    call        @VarCast
 00433330    movzx       eax,word ptr [ebp-28]
 00433334    cmp         ax,word ptr [ebp-10]
>00433338    je          0043333F
 0043333A    call        VarCastError
 0043333F    mov         eax,dword ptr [ebp-0C]
 00433342    push        eax
 00433343    lea         ecx,[ebp-28]
 00433346    mov         edx,dword ptr [ebp-4]
 00433349    mov         eax,dword ptr [ebp-14]
 0043334C    mov         ebx,dword ptr [eax]
 0043334E    call        dword ptr [ebx+2C]
 00433351    xor         eax,eax
 00433353    pop         edx
 00433354    pop         ecx
 00433355    pop         ecx
 00433356    mov         dword ptr fs:[eax],edx
 00433359    push        4334D1
 0043335E    lea         eax,[ebp-28]
 00433361    call        @VarClear
 00433366    ret
>00433367    jmp         @HandleFinally
>0043336C    jmp         0043335E
 0043336E    mov         eax,dword ptr [ebp-0C]
 00433371    push        eax
 00433372    mov         ecx,dword ptr [ebp-8]
 00433375    mov         edx,dword ptr [ebp-4]
 00433378    mov         eax,dword ptr [ebp-14]
 0043337B    mov         ebx,dword ptr [eax]
 0043337D    call        dword ptr [ebx+2C]
>00433380    jmp         004334D1
 00433385    mov         ebx,dword ptr [ebp-8]
 00433388    movzx       ebx,word ptr [ebx]
 0043338B    mov         eax,ebx
 0043338D    and         ax,0FFF
 00433391    cmp         ax,10F
>00433395    jae         0043341C
 0043339B    mov         eax,dword ptr [ebp-8]
 0043339E    mov         eax,dword ptr [ebp-4]
 004333A1    cmp         bx,word ptr [eax]
>004333A4    je          00433409
 004333A6    lea         eax,[ebp-28]
 004333A9    push        eax
 004333AA    call        oleaut32.VariantInit
 004333AF    xor         eax,eax
 004333B1    push        ebp
 004333B2    push        433402
 004333B7    push        dword ptr fs:[eax]
 004333BA    mov         dword ptr fs:[eax],esp
 004333BD    mov         ecx,dword ptr [ebp-8]
 004333C0    movzx       ecx,word ptr [ecx]
 004333C3    mov         edx,dword ptr [ebp-4]
 004333C6    lea         eax,[ebp-28]
 004333C9    call        @VarCast
 004333CE    lea         edx,[ebp-28]
 004333D1    mov         eax,dword ptr [ebp-4]
 004333D4    call        @VarCopy
 004333D9    mov         eax,dword ptr [ebp-4]
 004333DC    movzx       eax,word ptr [eax]
 004333DF    mov         edx,dword ptr [ebp-8]
 004333E2    cmp         ax,word ptr [edx]
>004333E5    je          004333EC
 004333E7    call        VarCastError
 004333EC    xor         eax,eax
 004333EE    pop         edx
 004333EF    pop         ecx
 004333F0    pop         ecx
 004333F1    mov         dword ptr fs:[eax],edx
 004333F4    push        433409
 004333F9    lea         eax,[ebp-28]
 004333FC    call        @VarClear
 00433401    ret
>00433402    jmp         @HandleFinally
>00433407    jmp         004333F9
 00433409    mov         edx,dword ptr [ebp-8]
 0043340C    mov         eax,dword ptr [ebp-4]
 0043340F    mov         ecx,dword ptr [ebp-0C]
 00433412    call        @VarOp
>00433417    jmp         004334D1
 0043341C    lea         edx,[ebp-18]
 0043341F    mov         eax,dword ptr [ebp-8]
 00433422    mov         eax,ebx
 00433424    call        FindCustomVariantType
 00433429    test        al,al
>0043342B    jne         00433437
 0043342D    call        VarInvalidOp
>00433432    jmp         004334D1
 00433437    lea         eax,[ebp-0E]
 0043343A    push        eax
 0043343B    mov         edx,dword ptr [ebp-4]
 0043343E    mov         ecx,dword ptr [ebp-0C]
 00433441    mov         eax,dword ptr [ebp-18]
 00433444    mov         ebx,dword ptr [eax]
 00433446    call        dword ptr [ebx+4]
 00433449    test        al,al
>0043344B    je          004334CC
 0043344D    mov         eax,dword ptr [ebp-4]
 00433450    movzx       eax,word ptr [eax]
 00433453    cmp         ax,word ptr [ebp-0E]
>00433457    je          004334B8
 00433459    lea         eax,[ebp-28]
 0043345C    push        eax
 0043345D    call        oleaut32.VariantInit
 00433462    xor         eax,eax
 00433464    push        ebp
 00433465    push        4334B1
 0043346A    push        dword ptr fs:[eax]
 0043346D    mov         dword ptr fs:[eax],esp
 00433470    movzx       ecx,word ptr [ebp-0E]
 00433474    mov         edx,dword ptr [ebp-4]
 00433477    lea         eax,[ebp-28]
 0043347A    call        @VarCast
 0043347F    lea         edx,[ebp-28]
 00433482    mov         eax,dword ptr [ebp-4]
 00433485    call        @VarCopy
 0043348A    mov         eax,dword ptr [ebp-4]
 0043348D    movzx       eax,word ptr [eax]
 00433490    cmp         ax,word ptr [ebp-0E]
>00433494    je          0043349B
 00433496    call        VarCastError
 0043349B    xor         eax,eax
 0043349D    pop         edx
 0043349E    pop         ecx
 0043349F    pop         ecx
 004334A0    mov         dword ptr fs:[eax],edx
 004334A3    push        4334B8
 004334A8    lea         eax,[ebp-28]
 004334AB    call        @VarClear
 004334B0    ret
>004334B1    jmp         @HandleFinally
>004334B6    jmp         004334A8
 004334B8    mov         eax,dword ptr [ebp-0C]
 004334BB    push        eax
 004334BC    mov         ecx,dword ptr [ebp-8]
 004334BF    mov         edx,dword ptr [ebp-4]
 004334C2    mov         eax,dword ptr [ebp-18]
 004334C5    mov         ebx,dword ptr [eax]
 004334C7    call        dword ptr [ebx+2C]
>004334CA    jmp         004334D1
 004334CC    call        VarInvalidOp
 004334D1    pop         ebx
 004334D2    mov         esp,ebp
 004334D4    pop         ebp
 004334D5    ret
*}
end;

//004334D8
function CheckType(T:TVarType):TVarType;
begin
{*
 004334D8    push        ebx
 004334D9    mov         ebx,eax
 004334DB    and         bx,0FFF
 004334E0    cmp         bx,15
>004334E4    jbe         004334FF
 004334E6    cmp         bx,100
>004334EB    je          004334F4
 004334ED    cmp         bx,102
>004334F2    jne         004334FA
 004334F4    mov         bx,8
>004334F8    jmp         004334FF
 004334FA    call        VarInvalidOp
 004334FF    mov         eax,ebx
 00433501    pop         ebx
 00433502    ret
*}
end;

//00433504
procedure AnyOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);
begin
{*
 00433504    push        ebp
 00433505    mov         ebp,esp
 00433507    add         esp,0FFFFFFF0
 0043350A    push        ebx
 0043350B    push        esi
 0043350C    push        edi
 0043350D    mov         edi,ecx
 0043350F    mov         esi,edx
 00433511    mov         ebx,eax
 00433513    cmp         word ptr [ebx],101
>00433518    jne         00433522
 0043351A    mov         eax,ebx
 0043351C    call        dword ptr ds:[792F90]
 00433522    cmp         word ptr [esi],101
>00433527    jne         0043357C
 00433529    lea         eax,[ebp-10]
 0043352C    push        eax
 0043352D    call        oleaut32.VariantInit
 00433532    xor         eax,eax
 00433534    push        ebp
 00433535    push        433575
 0043353A    push        dword ptr fs:[eax]
 0043353D    mov         dword ptr fs:[eax],esp
 00433540    mov         edx,esi
 00433542    lea         eax,[ebp-10]
 00433545    call        @VarCopy
 0043354A    lea         eax,[ebp-10]
 0043354D    call        dword ptr ds:[792F90]
 00433553    lea         edx,[ebp-10]
 00433556    mov         eax,ebx
 00433558    mov         ecx,edi
 0043355A    call        @VarOp
 0043355F    xor         eax,eax
 00433561    pop         edx
 00433562    pop         ecx
 00433563    pop         ecx
 00433564    mov         dword ptr fs:[eax],edx
 00433567    push        433587
 0043356C    lea         eax,[ebp-10]
 0043356F    call        @VarClear
 00433574    ret
>00433575    jmp         @HandleFinally
>0043357A    jmp         0043356C
 0043357C    mov         edx,esi
 0043357E    mov         eax,ebx
 00433580    mov         ecx,edi
 00433582    call        @VarOp
 00433587    pop         edi
 00433588    pop         esi
 00433589    pop         ebx
 0043358A    mov         esp,ebp
 0043358C    pop         ebp
 0043358D    ret
*}
end;

//00433590
procedure RealOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);
begin
{*
 00433590    push        ebx
 00433591    push        esi
 00433592    push        edi
 00433593    add         esp,0FFFFFFF0
 00433596    mov         edi,ecx
 00433598    mov         esi,edx
 0043359A    mov         ebx,eax
 0043359C    mov         eax,ebx
 0043359E    call        @VarToDouble
 004335A3    fstp        qword ptr [esp]
 004335A6    wait
 004335A7    mov         eax,esi
 004335A9    call        @VarToDouble
 004335AE    fstp        qword ptr [esp+8]
 004335B2    wait
 004335B3    sub         edi,1
>004335B6    jb          004335C2
>004335B8    je          004335CF
 004335BA    dec         edi
>004335BB    je          004335DC
 004335BD    dec         edi
>004335BE    je          004335E9
>004335C0    jmp         004335F6
 004335C2    fld         qword ptr [esp]
 004335C5    fadd        qword ptr [esp+8]
 004335C9    fstp        qword ptr [esp]
 004335CC    wait
>004335CD    jmp         004335FB
 004335CF    fld         qword ptr [esp]
 004335D2    fsub        qword ptr [esp+8]
 004335D6    fstp        qword ptr [esp]
 004335D9    wait
>004335DA    jmp         004335FB
 004335DC    fld         qword ptr [esp]
 004335DF    fmul        qword ptr [esp+8]
 004335E3    fstp        qword ptr [esp]
 004335E6    wait
>004335E7    jmp         004335FB
 004335E9    fld         qword ptr [esp]
 004335EC    fdiv        qword ptr [esp+8]
 004335F0    fstp        qword ptr [esp]
 004335F3    wait
>004335F4    jmp         004335FB
 004335F6    call        VarInvalidOp
 004335FB    test        word ptr [ebx],0BFE8
>00433600    je          00433609
 00433602    mov         eax,ebx
 00433604    call        VarClearDeep
 00433609    mov         eax,dword ptr [esp]
 0043360C    mov         dword ptr [ebx+8],eax
 0043360F    mov         eax,dword ptr [esp+4]
 00433613    mov         dword ptr [ebx+0C],eax
 00433616    mov         word ptr [ebx],5
 0043361B    add         esp,10
 0043361E    pop         edi
 0043361F    pop         esi
 00433620    pop         ebx
 00433621    ret
*}
end;

//00433624
procedure DateOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);
begin
{*
 00433624    push        ebx
 00433625    push        esi
 00433626    push        edi
 00433627    add         esp,0FFFFFFF0
 0043362A    mov         edi,ecx
 0043362C    mov         esi,edx
 0043362E    mov         ebx,eax
 00433630    mov         eax,ebx
 00433632    call        @VarToDate
 00433637    fstp        qword ptr [esp]
 0043363A    wait
 0043363B    mov         eax,esi
 0043363D    call        @VarToDate
 00433642    fstp        qword ptr [esp+8]
 00433646    wait
 00433647    sub         edi,1
>0043364A    jb          00433650
>0043364C    je          0043365D
>0043364E    jmp         0043366A
 00433650    fld         qword ptr [esp]
 00433653    fadd        qword ptr [esp+8]
 00433657    fstp        qword ptr [esp]
 0043365A    wait
>0043365B    jmp         0043366F
 0043365D    fld         qword ptr [esp]
 00433660    fsub        qword ptr [esp+8]
 00433664    fstp        qword ptr [esp]
 00433667    wait
>00433668    jmp         0043366F
 0043366A    call        VarInvalidOp
 0043366F    test        word ptr [ebx],0BFE8
>00433674    je          0043367D
 00433676    mov         eax,ebx
 00433678    call        VarClearDeep
 0043367D    mov         eax,dword ptr [esp]
 00433680    mov         dword ptr [ebx+8],eax
 00433683    mov         eax,dword ptr [esp+4]
 00433687    mov         dword ptr [ebx+0C],eax
 0043368A    mov         word ptr [ebx],7
 0043368F    add         esp,10
 00433692    pop         edi
 00433693    pop         esi
 00433694    pop         ebx
 00433695    ret
*}
end;

//00433698
procedure IntOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);
begin
{*
 00433698    push        ebp
 00433699    mov         ebp,esp
 0043369B    add         esp,0FFFFFFF4
 0043369E    push        ebx
 0043369F    push        esi
 004336A0    push        edi
 004336A1    mov         edi,ecx
 004336A3    mov         esi,edx
 004336A5    mov         ebx,eax
 004336A7    mov         byte ptr [ebp-9],0
 004336AB    mov         eax,ebx
 004336AD    call        @VarToInteger
 004336B2    mov         dword ptr [ebp-4],eax
 004336B5    mov         eax,esi
 004336B7    call        @VarToInteger
 004336BC    mov         dword ptr [ebp-8],eax
 004336BF    mov         eax,edi
 004336C1    cmp         eax,0A
>004336C4    ja          0043377A
 004336CA    jmp         dword ptr [eax*4+4336D1]
 004336CA    dd          004336FD
 004336CA    dd          0043370E
 004336CA    dd          0043371F
 004336CA    dd          00433730
 004336CA    dd          00433736
 004336CA    dd          00433744
 004336CA    dd          00433752
 004336CA    dd          0043375A
 004336CA    dd          00433762
 004336CA    dd          0043376A
 004336CA    dd          00433772
 004336FD    mov         eax,dword ptr [ebp-4]
 00433700    mov         edx,dword ptr [ebp-8]
 00433703    add         eax,edx
 00433705    seto        byte ptr [ebp-9]
 00433709    mov         dword ptr [ebp-4],eax
>0043370C    jmp         0043377F
 0043370E    mov         eax,dword ptr [ebp-4]
 00433711    mov         edx,dword ptr [ebp-8]
 00433714    sub         eax,edx
 00433716    seto        byte ptr [ebp-9]
 0043371A    mov         dword ptr [ebp-4],eax
>0043371D    jmp         0043377F
 0043371F    mov         eax,dword ptr [ebp-4]
 00433722    mov         edx,dword ptr [ebp-8]
 00433725    imul        edx
 00433727    seto        byte ptr [ebp-9]
 0043372B    mov         dword ptr [ebp-4],eax
>0043372E    jmp         0043377F
 00433730    mov         byte ptr [ebp-9],1
>00433734    jmp         0043377F
 00433736    mov         ecx,dword ptr [ebp-8]
 00433739    mov         eax,dword ptr [ebp-4]
 0043373C    cdq
 0043373D    idiv        eax,ecx
 0043373F    mov         dword ptr [ebp-4],eax
>00433742    jmp         0043377F
 00433744    mov         ecx,dword ptr [ebp-8]
 00433747    mov         eax,dword ptr [ebp-4]
 0043374A    cdq
 0043374B    idiv        eax,ecx
 0043374D    mov         dword ptr [ebp-4],edx
>00433750    jmp         0043377F
 00433752    mov         ecx,dword ptr [ebp-8]
 00433755    shl         dword ptr [ebp-4],cl
>00433758    jmp         0043377F
 0043375A    mov         ecx,dword ptr [ebp-8]
 0043375D    shr         dword ptr [ebp-4],cl
>00433760    jmp         0043377F
 00433762    mov         eax,dword ptr [ebp-8]
 00433765    and         dword ptr [ebp-4],eax
>00433768    jmp         0043377F
 0043376A    mov         eax,dword ptr [ebp-8]
 0043376D    or          dword ptr [ebp-4],eax
>00433770    jmp         0043377F
 00433772    mov         eax,dword ptr [ebp-8]
 00433775    xor         dword ptr [ebp-4],eax
>00433778    jmp         0043377F
 0043377A    call        VarInvalidOp
 0043377F    cmp         byte ptr [ebp-9],0
>00433783    je          00433792
 00433785    mov         edx,esi
 00433787    mov         eax,ebx
 00433789    mov         ecx,edi
 0043378B    call        RealOp
>00433790    jmp         004337AB
 00433792    test        word ptr [ebx],0BFE8
>00433797    je          004337A0
 00433799    mov         eax,ebx
 0043379B    call        VarClearDeep
 004337A0    mov         eax,dword ptr [ebp-4]
 004337A3    mov         dword ptr [ebx+8],eax
 004337A6    mov         word ptr [ebx],3
 004337AB    pop         edi
 004337AC    pop         esi
 004337AD    pop         ebx
 004337AE    mov         esp,ebp
 004337B0    pop         ebp
 004337B1    ret
*}
end;

//004337B4
procedure Int64Op(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);
begin
{*
 004337B4    push        ebp
 004337B5    mov         ebp,esp
 004337B7    add         esp,0FFFFFFE0
 004337BA    push        ebx
 004337BB    push        esi
 004337BC    push        edi
 004337BD    mov         dword ptr [ebp-0C],ecx
 004337C0    mov         dword ptr [ebp-8],edx
 004337C3    mov         dword ptr [ebp-4],eax
 004337C6    xor         ebx,ebx
 004337C8    mov         eax,dword ptr [ebp-4]
 004337CB    call        @VarToInt64
 004337D0    mov         dword ptr [ebp-18],eax
 004337D3    mov         dword ptr [ebp-14],edx
 004337D6    mov         eax,dword ptr [ebp-8]
 004337D9    call        @VarToInt64
 004337DE    mov         dword ptr [ebp-20],eax
 004337E1    mov         dword ptr [ebp-1C],edx
 004337E4    mov         eax,dword ptr [ebp-0C]
 004337E7    cmp         eax,0A
>004337EA    ja          00433960
 004337F0    jmp         dword ptr [eax*4+4337F7]
 004337F0    dd          00433823
 004337F0    dd          00433823
 004337F0    dd          00433823
 004337F0    dd          004338B8
 004337F0    dd          004338BF
 004337F0    dd          004338DB
 004337F0    dd          004338F4
 004337F0    dd          0043390C
 004337F0    dd          00433924
 004337F0    dd          00433938
 004337F0    dd          0043394C
 00433823    xor         eax,eax
 00433825    push        ebp
 00433826    push        43388C
 0043382B    push        dword ptr fs:[eax]
 0043382E    mov         dword ptr fs:[eax],esp
 00433831    mov         eax,dword ptr [ebp-0C]
 00433834    sub         eax,1
>00433837    jb          00433840
>00433839    je          00433854
 0043383B    dec         eax
>0043383C    je          00433868
>0043383E    jmp         0043387F
 00433840    mov         eax,dword ptr [ebp-18]
 00433843    mov         edx,dword ptr [ebp-14]
 00433846    add         eax,dword ptr [ebp-20]
 00433849    adc         edx,dword ptr [ebp-1C]
 0043384C    mov         dword ptr [ebp-18],eax
 0043384F    mov         dword ptr [ebp-14],edx
>00433852    jmp         0043387F
 00433854    mov         eax,dword ptr [ebp-18]
 00433857    mov         edx,dword ptr [ebp-14]
 0043385A    sub         eax,dword ptr [ebp-20]
 0043385D    sbb         edx,dword ptr [ebp-1C]
 00433860    mov         dword ptr [ebp-18],eax
 00433863    mov         dword ptr [ebp-14],edx
>00433866    jmp         0043387F
 00433868    push        dword ptr [ebp-1C]
 0043386B    push        dword ptr [ebp-20]
 0043386E    mov         eax,dword ptr [ebp-18]
 00433871    mov         edx,dword ptr [ebp-14]
 00433874    call        @_llmul
 00433879    mov         dword ptr [ebp-18],eax
 0043387C    mov         dword ptr [ebp-14],edx
 0043387F    xor         eax,eax
 00433881    pop         edx
 00433882    pop         ecx
 00433883    pop         ecx
 00433884    mov         dword ptr fs:[eax],edx
>00433887    jmp         00433965
>0043388C    jmp         @HandleOnException
 00433891    dd          2
 00433895    dd          00419E54;EOverflow
 00433899    dd          004338A5
 0043389D    dd          00000000
 004338A1    dd          004338A9
 004338A5    mov         bl,1
>004338A7    jmp         004338AE
 004338A9    call        @RaiseAgain
 004338AE    call        @DoneExcept
>004338B3    jmp         00433965
 004338B8    mov         bl,1
>004338BA    jmp         00433965
 004338BF    push        dword ptr [ebp-1C]
 004338C2    push        dword ptr [ebp-20]
 004338C5    mov         eax,dword ptr [ebp-18]
 004338C8    mov         edx,dword ptr [ebp-14]
 004338CB    call        @_lldiv
 004338D0    mov         dword ptr [ebp-18],eax
 004338D3    mov         dword ptr [ebp-14],edx
>004338D6    jmp         00433965
 004338DB    push        dword ptr [ebp-1C]
 004338DE    push        dword ptr [ebp-20]
 004338E1    mov         eax,dword ptr [ebp-18]
 004338E4    mov         edx,dword ptr [ebp-14]
 004338E7    call        @_llmod
 004338EC    mov         dword ptr [ebp-18],eax
 004338EF    mov         dword ptr [ebp-14],edx
>004338F2    jmp         00433965
 004338F4    mov         eax,dword ptr [ebp-20]
 004338F7    mov         ecx,eax
 004338F9    mov         eax,dword ptr [ebp-18]
 004338FC    mov         edx,dword ptr [ebp-14]
 004338FF    call        @_llshl
 00433904    mov         dword ptr [ebp-18],eax
 00433907    mov         dword ptr [ebp-14],edx
>0043390A    jmp         00433965
 0043390C    mov         eax,dword ptr [ebp-20]
 0043390F    mov         ecx,eax
 00433911    mov         eax,dword ptr [ebp-18]
 00433914    mov         edx,dword ptr [ebp-14]
 00433917    call        @_llushr
 0043391C    mov         dword ptr [ebp-18],eax
 0043391F    mov         dword ptr [ebp-14],edx
>00433922    jmp         00433965
 00433924    mov         eax,dword ptr [ebp-18]
 00433927    mov         edx,dword ptr [ebp-14]
 0043392A    and         eax,dword ptr [ebp-20]
 0043392D    and         edx,dword ptr [ebp-1C]
 00433930    mov         dword ptr [ebp-18],eax
 00433933    mov         dword ptr [ebp-14],edx
>00433936    jmp         00433965
 00433938    mov         eax,dword ptr [ebp-18]
 0043393B    mov         edx,dword ptr [ebp-14]
 0043393E    or          eax,dword ptr [ebp-20]
 00433941    or          edx,dword ptr [ebp-1C]
 00433944    mov         dword ptr [ebp-18],eax
 00433947    mov         dword ptr [ebp-14],edx
>0043394A    jmp         00433965
 0043394C    mov         eax,dword ptr [ebp-18]
 0043394F    mov         edx,dword ptr [ebp-14]
 00433952    xor         eax,dword ptr [ebp-20]
 00433955    xor         edx,dword ptr [ebp-1C]
 00433958    mov         dword ptr [ebp-18],eax
 0043395B    mov         dword ptr [ebp-14],edx
>0043395E    jmp         00433965
 00433960    call        VarInvalidOp
 00433965    test        bl,bl
>00433967    je          00433979
 00433969    mov         edx,dword ptr [ebp-8]
 0043396C    mov         eax,dword ptr [ebp-4]
 0043396F    mov         ecx,dword ptr [ebp-0C]
 00433972    call        RealOp
>00433977    jmp         004339A2
 00433979    mov         eax,dword ptr [ebp-4]
 0043397C    test        word ptr [eax],0BFE8
>00433981    je          0043398B
 00433983    mov         eax,dword ptr [ebp-4]
 00433986    call        VarClearDeep
 0043398B    mov         eax,dword ptr [ebp-4]
 0043398E    mov         edx,dword ptr [ebp-18]
 00433991    mov         dword ptr [eax+8],edx
 00433994    mov         edx,dword ptr [ebp-14]
 00433997    mov         dword ptr [eax+0C],edx
 0043399A    mov         eax,dword ptr [ebp-4]
 0043399D    mov         word ptr [eax],14
 004339A2    pop         edi
 004339A3    pop         esi
 004339A4    pop         ebx
 004339A5    mov         esp,ebp
 004339A7    pop         ebp
 004339A8    ret
*}
end;

//004339AC
procedure UInt64Op(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);
begin
{*
 004339AC    push        ebp
 004339AD    mov         ebp,esp
 004339AF    add         esp,0FFFFFFE0
 004339B2    push        ebx
 004339B3    push        esi
 004339B4    push        edi
 004339B5    mov         dword ptr [ebp-0C],ecx
 004339B8    mov         dword ptr [ebp-8],edx
 004339BB    mov         dword ptr [ebp-4],eax
 004339BE    xor         ebx,ebx
 004339C0    mov         eax,dword ptr [ebp-4]
 004339C3    call        @VarToUInt64
 004339C8    mov         dword ptr [ebp-18],eax
 004339CB    mov         dword ptr [ebp-14],edx
 004339CE    mov         eax,dword ptr [ebp-8]
 004339D1    call        @VarToUInt64
 004339D6    mov         dword ptr [ebp-20],eax
 004339D9    mov         dword ptr [ebp-1C],edx
 004339DC    mov         eax,dword ptr [ebp-0C]
 004339DF    cmp         eax,0A
>004339E2    ja          00433B58
 004339E8    jmp         dword ptr [eax*4+4339EF]
 004339E8    dd          00433A1B
 004339E8    dd          00433A1B
 004339E8    dd          00433A1B
 004339E8    dd          00433AB0
 004339E8    dd          00433AB7
 004339E8    dd          00433AD3
 004339E8    dd          00433AEC
 004339E8    dd          00433B04
 004339E8    dd          00433B1C
 004339E8    dd          00433B30
 004339E8    dd          00433B44
 00433A1B    xor         eax,eax
 00433A1D    push        ebp
 00433A1E    push        433A84
 00433A23    push        dword ptr fs:[eax]
 00433A26    mov         dword ptr fs:[eax],esp
 00433A29    mov         eax,dword ptr [ebp-0C]
 00433A2C    sub         eax,1
>00433A2F    jb          00433A38
>00433A31    je          00433A4C
 00433A33    dec         eax
>00433A34    je          00433A60
>00433A36    jmp         00433A77
 00433A38    mov         eax,dword ptr [ebp-18]
 00433A3B    mov         edx,dword ptr [ebp-14]
 00433A3E    add         eax,dword ptr [ebp-20]
 00433A41    adc         edx,dword ptr [ebp-1C]
 00433A44    mov         dword ptr [ebp-18],eax
 00433A47    mov         dword ptr [ebp-14],edx
>00433A4A    jmp         00433A77
 00433A4C    mov         eax,dword ptr [ebp-18]
 00433A4F    mov         edx,dword ptr [ebp-14]
 00433A52    sub         eax,dword ptr [ebp-20]
 00433A55    sbb         edx,dword ptr [ebp-1C]
 00433A58    mov         dword ptr [ebp-18],eax
 00433A5B    mov         dword ptr [ebp-14],edx
>00433A5E    jmp         00433A77
 00433A60    push        dword ptr [ebp-1C]
 00433A63    push        dword ptr [ebp-20]
 00433A66    mov         eax,dword ptr [ebp-18]
 00433A69    mov         edx,dword ptr [ebp-14]
 00433A6C    call        @_llmul
 00433A71    mov         dword ptr [ebp-18],eax
 00433A74    mov         dword ptr [ebp-14],edx
 00433A77    xor         eax,eax
 00433A79    pop         edx
 00433A7A    pop         ecx
 00433A7B    pop         ecx
 00433A7C    mov         dword ptr fs:[eax],edx
>00433A7F    jmp         00433B5D
>00433A84    jmp         @HandleOnException
 00433A89    dd          2
 00433A8D    dd          00419E54;EOverflow
 00433A91    dd          00433A9D
 00433A95    dd          00000000
 00433A99    dd          00433AA1
 00433A9D    mov         bl,1
>00433A9F    jmp         00433AA6
 00433AA1    call        @RaiseAgain
 00433AA6    call        @DoneExcept
>00433AAB    jmp         00433B5D
 00433AB0    mov         bl,1
>00433AB2    jmp         00433B5D
 00433AB7    push        dword ptr [ebp-1C]
 00433ABA    push        dword ptr [ebp-20]
 00433ABD    mov         eax,dword ptr [ebp-18]
 00433AC0    mov         edx,dword ptr [ebp-14]
 00433AC3    call        @_lludiv
 00433AC8    mov         dword ptr [ebp-18],eax
 00433ACB    mov         dword ptr [ebp-14],edx
>00433ACE    jmp         00433B5D
 00433AD3    push        dword ptr [ebp-1C]
 00433AD6    push        dword ptr [ebp-20]
 00433AD9    mov         eax,dword ptr [ebp-18]
 00433ADC    mov         edx,dword ptr [ebp-14]
 00433ADF    call        @_llumod
 00433AE4    mov         dword ptr [ebp-18],eax
 00433AE7    mov         dword ptr [ebp-14],edx
>00433AEA    jmp         00433B5D
 00433AEC    mov         eax,dword ptr [ebp-20]
 00433AEF    mov         ecx,eax
 00433AF1    mov         eax,dword ptr [ebp-18]
 00433AF4    mov         edx,dword ptr [ebp-14]
 00433AF7    call        @_llshl
 00433AFC    mov         dword ptr [ebp-18],eax
 00433AFF    mov         dword ptr [ebp-14],edx
>00433B02    jmp         00433B5D
 00433B04    mov         eax,dword ptr [ebp-20]
 00433B07    mov         ecx,eax
 00433B09    mov         eax,dword ptr [ebp-18]
 00433B0C    mov         edx,dword ptr [ebp-14]
 00433B0F    call        @_llushr
 00433B14    mov         dword ptr [ebp-18],eax
 00433B17    mov         dword ptr [ebp-14],edx
>00433B1A    jmp         00433B5D
 00433B1C    mov         eax,dword ptr [ebp-18]
 00433B1F    mov         edx,dword ptr [ebp-14]
 00433B22    and         eax,dword ptr [ebp-20]
 00433B25    and         edx,dword ptr [ebp-1C]
 00433B28    mov         dword ptr [ebp-18],eax
 00433B2B    mov         dword ptr [ebp-14],edx
>00433B2E    jmp         00433B5D
 00433B30    mov         eax,dword ptr [ebp-18]
 00433B33    mov         edx,dword ptr [ebp-14]
 00433B36    or          eax,dword ptr [ebp-20]
 00433B39    or          edx,dword ptr [ebp-1C]
 00433B3C    mov         dword ptr [ebp-18],eax
 00433B3F    mov         dword ptr [ebp-14],edx
>00433B42    jmp         00433B5D
 00433B44    mov         eax,dword ptr [ebp-18]
 00433B47    mov         edx,dword ptr [ebp-14]
 00433B4A    xor         eax,dword ptr [ebp-20]
 00433B4D    xor         edx,dword ptr [ebp-1C]
 00433B50    mov         dword ptr [ebp-18],eax
 00433B53    mov         dword ptr [ebp-14],edx
>00433B56    jmp         00433B5D
 00433B58    call        VarInvalidOp
 00433B5D    test        bl,bl
>00433B5F    je          00433B71
 00433B61    mov         edx,dword ptr [ebp-8]
 00433B64    mov         eax,dword ptr [ebp-4]
 00433B67    mov         ecx,dword ptr [ebp-0C]
 00433B6A    call        RealOp
>00433B6F    jmp         00433B9A
 00433B71    mov         eax,dword ptr [ebp-4]
 00433B74    test        word ptr [eax],0BFE8
>00433B79    je          00433B83
 00433B7B    mov         eax,dword ptr [ebp-4]
 00433B7E    call        VarClearDeep
 00433B83    mov         eax,dword ptr [ebp-4]
 00433B86    mov         edx,dword ptr [ebp-18]
 00433B89    mov         dword ptr [eax+8],edx
 00433B8C    mov         edx,dword ptr [ebp-14]
 00433B8F    mov         dword ptr [eax+0C],edx
 00433B92    mov         eax,dword ptr [ebp-4]
 00433B95    mov         word ptr [eax],15
 00433B9A    pop         edi
 00433B9B    pop         esi
 00433B9C    pop         ebx
 00433B9D    mov         esp,ebp
 00433B9F    pop         ebp
 00433BA0    ret
*}
end;

//00433BA4
procedure NullOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);
begin
{*
 00433BA4    push        ebx
 00433BA5    push        esi
 00433BA6    mov         esi,edx
 00433BA8    mov         ebx,eax
 00433BAA    sub         ecx,8
>00433BAD    je          00433BB7
 00433BAF    dec         ecx
>00433BB0    je          00433BFD
>00433BB2    jmp         00433C43
 00433BB7    cmp         word ptr [ebx],1
>00433BBB    jne         00433BE2
 00433BBD    cmp         word ptr [esi],1
>00433BC1    je          00433BCE
 00433BC3    mov         eax,esi
 00433BC5    call        @VarToBoolean
 00433BCA    test        al,al
>00433BCC    je          00433BD7
 00433BCE    mov         eax,ebx
 00433BD0    call        @VarNull
>00433BD5    jmp         00433C4A
 00433BD7    mov         edx,esi
 00433BD9    mov         eax,ebx
 00433BDB    call        @VarCopy
>00433BE0    jmp         00433C4A
 00433BE2    mov         eax,ebx
 00433BE4    call        @VarToBoolean
 00433BE9    test        al,al
>00433BEB    je          00433C4A
 00433BED    cmp         word ptr [esi],1
>00433BF1    jne         00433C4A
 00433BF3    mov         eax,ebx
 00433BF5    call        @VarNull
 00433BFA    pop         esi
 00433BFB    pop         ebx
 00433BFC    ret
 00433BFD    cmp         word ptr [ebx],1
>00433C01    jne         00433C28
 00433C03    cmp         word ptr [esi],1
>00433C07    je          00433C14
 00433C09    mov         eax,esi
 00433C0B    call        @VarToBoolean
 00433C10    test        al,al
>00433C12    jne         00433C1D
 00433C14    mov         eax,ebx
 00433C16    call        @VarNull
>00433C1B    jmp         00433C4A
 00433C1D    mov         edx,esi
 00433C1F    mov         eax,ebx
 00433C21    call        @VarCopy
>00433C26    jmp         00433C4A
 00433C28    mov         eax,ebx
 00433C2A    call        @VarToBoolean
 00433C2F    test        al,al
>00433C31    jne         00433C4A
 00433C33    cmp         word ptr [esi],1
>00433C37    jne         00433C4A
 00433C39    mov         eax,ebx
 00433C3B    call        @VarNull
 00433C40    pop         esi
 00433C41    pop         ebx
 00433C42    ret
 00433C43    mov         eax,ebx
 00433C45    call        @VarNull
 00433C4A    pop         esi
 00433C4B    pop         ebx
 00433C4C    ret
*}
end;

//00433C50
procedure EmptyOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);
begin
{*
 00433C50    push        ebp
 00433C51    mov         ebp,esp
 00433C53    push        0
 00433C55    push        0
 00433C57    push        ebx
 00433C58    xor         edx,edx
 00433C5A    push        ebp
 00433C5B    push        433CD9
 00433C60    push        dword ptr fs:[edx]
 00433C63    mov         dword ptr fs:[edx],esp
 00433C66    sub         ecx,3
>00433C69    je          00433C73
 00433C6B    dec         ecx
 00433C6C    sub         ecx,2
>00433C6F    jb          00433C96
>00433C71    jmp         00433CB9
 00433C73    lea         edx,[ebp-4]
 00433C76    mov         eax,[0078DB20];^SResString15:TResStringRec
 00433C7B    call        LoadResString
 00433C80    mov         ecx,dword ptr [ebp-4]
 00433C83    mov         dl,1
 00433C85    mov         eax,[00419DBC];EZeroDivide
 00433C8A    call        Exception.Create
 00433C8F    call        @RaiseExcept
>00433C94    jmp         00433CBE
 00433C96    lea         edx,[ebp-8]
 00433C99    mov         eax,[0078D994];^SResString11:TResStringRec
 00433C9E    call        LoadResString
 00433CA3    mov         ecx,dword ptr [ebp-8]
 00433CA6    mov         dl,1
 00433CA8    mov         eax,[00419AC0];EDivByZero
 00433CAD    call        Exception.Create
 00433CB2    call        @RaiseExcept
>00433CB7    jmp         00433CBE
 00433CB9    call        @VarClear
 00433CBE    xor         eax,eax
 00433CC0    pop         edx
 00433CC1    pop         ecx
 00433CC2    pop         ecx
 00433CC3    mov         dword ptr fs:[eax],edx
 00433CC6    push        433CE0
 00433CCB    lea         eax,[ebp-8]
 00433CCE    mov         edx,2
 00433CD3    call        @UStrArrayClr
 00433CD8    ret
>00433CD9    jmp         @HandleFinally
>00433CDE    jmp         00433CCB
 00433CE0    pop         ebx
 00433CE1    pop         ecx
 00433CE2    pop         ecx
 00433CE3    pop         ebp
 00433CE4    ret
*}
end;

//00433CE8
procedure CurrOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp; const LeftBase:TBaseType; const RightBase:TBaseType);
begin
{*
 00433CE8    push        ebp
 00433CE9    mov         ebp,esp
 00433CEB    add         esp,0FFFFFFF0
 00433CEE    push        ebx
 00433CEF    push        esi
 00433CF0    mov         esi,edx
 00433CF2    mov         ebx,eax
 00433CF4    mov         eax,ecx
 00433CF6    sub         eax,1
>00433CF9    jb          00433D08
>00433CFB    je          00433D28
 00433CFD    dec         eax
 00433CFE    sub         eax,2
>00433D01    jb          00433D48
>00433D03    jmp         00433E3A
 00433D08    mov         eax,ebx
 00433D0A    call        @VarToCurrency
 00433D0F    fistp       qword ptr [ebp-10]
 00433D12    wait
 00433D13    mov         eax,esi
 00433D15    call        @VarToCurrency
 00433D1A    fild        qword ptr [ebp-10]
 00433D1D    faddp       st(1),st
 00433D1F    fistp       qword ptr [ebp-8]
 00433D22    wait
>00433D23    jmp         00433E45
 00433D28    mov         eax,ebx
 00433D2A    call        @VarToCurrency
 00433D2F    fistp       qword ptr [ebp-10]
 00433D32    wait
 00433D33    mov         eax,esi
 00433D35    call        @VarToCurrency
 00433D3A    fild        qword ptr [ebp-10]
 00433D3D    fsubrp      st(1),st
 00433D3F    fistp       qword ptr [ebp-8]
 00433D42    wait
>00433D43    jmp         00433E45
 00433D48    cmp         byte ptr [ebp+0C],5
>00433D4C    jne         00433DA5
 00433D4E    cmp         byte ptr [ebp+8],5
>00433D52    jne         00433DA5
 00433D54    cmp         ecx,2
>00433D57    jne         00433D7F
 00433D59    mov         eax,ebx
 00433D5B    call        @VarToCurrency
 00433D60    fistp       qword ptr [ebp-10]
 00433D63    wait
 00433D64    mov         eax,esi
 00433D66    call        @VarToCurrency
 00433D6B    fild        qword ptr [ebp-10]
 00433D6E    fmulp       st(1),st
 00433D70    fdiv        dword ptr ds:[433E6C]
 00433D76    fistp       qword ptr [ebp-8]
 00433D79    wait
>00433D7A    jmp         00433E45
 00433D7F    mov         eax,ebx
 00433D81    call        @VarToCurrency
 00433D86    fistp       qword ptr [ebp-10]
 00433D89    wait
 00433D8A    mov         eax,esi
 00433D8C    call        @VarToCurrency
 00433D91    fild        qword ptr [ebp-10]
 00433D94    fdivrp      st(1),st
 00433D96    fmul        dword ptr ds:[433E6C]
 00433D9C    fistp       qword ptr [ebp-8]
 00433D9F    wait
>00433DA0    jmp         00433E45
 00433DA5    cmp         byte ptr [ebp+8],5
>00433DA9    jne         00433DFB
 00433DAB    cmp         ecx,2
>00433DAE    jne         00433DCB
 00433DB0    mov         eax,ebx
 00433DB2    call        @VarToDouble
 00433DB7    fstp        qword ptr [ebp-10]
 00433DBA    wait
 00433DBB    mov         eax,esi
 00433DBD    call        @VarToCurrency
 00433DC2    fmul        qword ptr [ebp-10]
 00433DC5    fistp       qword ptr [ebp-8]
 00433DC8    wait
>00433DC9    jmp         00433E45
 00433DCB    test        word ptr [ebx],0BFE8
>00433DD0    je          00433DD9
 00433DD2    mov         eax,ebx
 00433DD4    call        VarClearDeep
 00433DD9    mov         eax,ebx
 00433DDB    call        @VarToCurrency
 00433DE0    fistp       qword ptr [ebp-10]
 00433DE3    wait
 00433DE4    mov         eax,esi
 00433DE6    call        @VarToCurrency
 00433DEB    fild        qword ptr [ebp-10]
 00433DEE    fdivrp      st(1),st
 00433DF0    fstp        qword ptr [ebx+8]
 00433DF3    wait
 00433DF4    mov         word ptr [ebx],5
>00433DF9    jmp         00433E64
 00433DFB    cmp         ecx,2
>00433DFE    jne         00433E1D
 00433E00    mov         eax,ebx
 00433E02    call        @VarToCurrency
 00433E07    fistp       qword ptr [ebp-10]
 00433E0A    wait
 00433E0B    mov         eax,esi
 00433E0D    call        @VarToDouble
 00433E12    fild        qword ptr [ebp-10]
 00433E15    fmulp       st(1),st
 00433E17    fistp       qword ptr [ebp-8]
 00433E1A    wait
>00433E1B    jmp         00433E45
 00433E1D    mov         eax,ebx
 00433E1F    call        @VarToCurrency
 00433E24    fistp       qword ptr [ebp-10]
 00433E27    wait
 00433E28    mov         eax,esi
 00433E2A    call        @VarToDouble
 00433E2F    fild        qword ptr [ebp-10]
 00433E32    fdivrp      st(1),st
 00433E34    fistp       qword ptr [ebp-8]
 00433E37    wait
>00433E38    jmp         00433E45
 00433E3A    mov         edx,esi
 00433E3C    mov         eax,ebx
 00433E3E    call        IntOp
>00433E43    jmp         00433E64
 00433E45    test        word ptr [ebx],0BFE8
>00433E4A    je          00433E53
 00433E4C    mov         eax,ebx
 00433E4E    call        VarClearDeep
 00433E53    mov         eax,dword ptr [ebp-8]
 00433E56    mov         dword ptr [ebx+8],eax
 00433E59    mov         eax,dword ptr [ebp-4]
 00433E5C    mov         dword ptr [ebx+0C],eax
 00433E5F    mov         word ptr [ebx],6
 00433E64    pop         esi
 00433E65    pop         ebx
 00433E66    mov         esp,ebp
 00433E68    pop         ebp
 00433E69    ret         8
*}
end;

//00433E70
procedure SimpleVarOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);
begin
{*
 00433E70    push        ebx
 00433E71    push        esi
 00433E72    push        edi
 00433E73    push        ebp
 00433E74    push        ecx
 00433E75    mov         ebp,ecx
 00433E77    mov         edi,edx
 00433E79    mov         esi,eax
 00433E7B    movzx       eax,word ptr [esi]
 00433E7E    call        CheckType
 00433E83    movzx       eax,ax
 00433E86    movzx       ebx,byte ptr [eax+784E73]
 00433E8D    movzx       eax,word ptr [edi]
 00433E90    call        CheckType
 00433E95    movzx       eax,ax
 00433E98    movzx       eax,byte ptr [eax+784E73]
 00433E9F    mov         byte ptr [esp],al
 00433EA2    movzx       eax,byte ptr [esp]
 00433EA6    movzx       edx,bl
 00433EA9    lea         edx,[edx+edx*2]
 00433EAC    lea         edx,[edx*4+784EA2]
 00433EB3    movzx       eax,byte ptr [edx+eax]
 00433EB7    cmp         eax,0B
>00433EBA    ja          00434106
 00433EC0    jmp         dword ptr [eax*4+433EC7]
 00433EC0    dd          00433EF7
 00433EC0    dd          00433F11
 00433EC0    dd          00433F01
 00433EC0    dd          00433F21
 00433EC0    dd          00433F46
 00433EC0    dd          00433F6B
 00433EC0    dd          00433F82
 00433EC0    dd          00433FB9
 00433EC0    dd          00434063
 00433EC0    dd          004340BB
 00433EC0    dd          004340DA
 00433EC0    dd          004340F9
 00433EF7    call        VarInvalidOp
>00433EFC    jmp         0043410B
 00433F01    mov         edx,edi
 00433F03    mov         eax,esi
 00433F05    mov         ecx,ebp
 00433F07    call        NullOp
>00433F0C    jmp         0043410B
 00433F11    mov         edx,edi
 00433F13    mov         eax,esi
 00433F15    mov         ecx,ebp
 00433F17    call        EmptyOp
>00433F1C    jmp         0043410B
 00433F21    cmp         ebp,3
>00433F24    jne         00433F36
 00433F26    mov         edx,edi
 00433F28    mov         eax,esi
 00433F2A    mov         ecx,ebp
 00433F2C    call        RealOp
>00433F31    jmp         0043410B
 00433F36    mov         edx,edi
 00433F38    mov         eax,esi
 00433F3A    mov         ecx,ebp
 00433F3C    call        IntOp
>00433F41    jmp         0043410B
 00433F46    cmp         ebp,4
>00433F49    jl          00433F5B
 00433F4B    mov         edx,edi
 00433F4D    mov         eax,esi
 00433F4F    mov         ecx,ebp
 00433F51    call        IntOp
>00433F56    jmp         0043410B
 00433F5B    mov         edx,edi
 00433F5D    mov         eax,esi
 00433F5F    mov         ecx,ebp
 00433F61    call        RealOp
>00433F66    jmp         0043410B
 00433F6B    push        ebx
 00433F6C    movzx       eax,byte ptr [esp+4]
 00433F71    push        eax
 00433F72    mov         edx,edi
 00433F74    mov         eax,esi
 00433F76    mov         ecx,ebp
 00433F78    call        CurrOp
>00433F7D    jmp         0043410B
 00433F82    test        ebp,ebp
>00433F84    jne         00433F94
 00433F86    mov         edx,edi
 00433F88    mov         eax,esi
 00433F8A    call        VarStrCat
>00433F8F    jmp         0043410B
 00433F94    cmp         ebp,4
>00433F97    jl          00433FA9
 00433F99    mov         edx,edi
 00433F9B    mov         eax,esi
 00433F9D    mov         ecx,ebp
 00433F9F    call        IntOp
>00433FA4    jmp         0043410B
 00433FA9    mov         edx,edi
 00433FAB    mov         eax,esi
 00433FAD    mov         ecx,ebp
 00433FAF    call        RealOp
>00433FB4    jmp         0043410B
 00433FB9    cmp         ebp,8
>00433FBC    jge         00433FE3
 00433FBE    cmp         ebp,4
>00433FC1    jl          00433FD3
 00433FC3    mov         edx,edi
 00433FC5    mov         eax,esi
 00433FC7    mov         ecx,ebp
 00433FC9    call        IntOp
>00433FCE    jmp         0043410B
 00433FD3    mov         edx,edi
 00433FD5    mov         eax,esi
 00433FD7    mov         ecx,ebp
 00433FD9    call        RealOp
>00433FDE    jmp         0043410B
 00433FE3    sub         ebp,8
>00433FE6    je          00433FF3
 00433FE8    dec         ebp
>00433FE9    je          0043401B
 00433FEB    dec         ebp
>00433FEC    je          00434043
>00433FEE    jmp         0043410B
 00433FF3    mov         eax,esi
 00433FF5    call        @VarToBoolean
 00433FFA    test        al,al
>00433FFC    je          00434009
 00433FFE    mov         eax,edi
 00434000    call        @VarToBoolean
 00434005    test        al,al
>00434007    jne         0043400D
 00434009    xor         edx,edx
>0043400B    jmp         0043400F
 0043400D    mov         dl,1
 0043400F    mov         eax,esi
 00434011    call        @VarFromBool
>00434016    jmp         0043410B
 0043401B    mov         eax,esi
 0043401D    call        @VarToBoolean
 00434022    test        al,al
>00434024    jne         00434035
 00434026    mov         eax,edi
 00434028    call        @VarToBoolean
 0043402D    test        al,al
>0043402F    jne         00434035
 00434031    xor         edx,edx
>00434033    jmp         00434037
 00434035    mov         dl,1
 00434037    mov         eax,esi
 00434039    call        @VarFromBool
>0043403E    jmp         0043410B
 00434043    mov         eax,esi
 00434045    call        @VarToBoolean
 0043404A    mov         ebx,eax
 0043404C    mov         eax,edi
 0043404E    call        @VarToBoolean
 00434053    xor         bl,al
 00434055    mov         edx,ebx
 00434057    mov         eax,esi
 00434059    call        @VarFromBool
>0043405E    jmp         0043410B
 00434063    mov         eax,ebp
 00434065    sub         eax,1
>00434068    jb          00434074
>0043406A    je          00434084
 0043406C    dec         eax
 0043406D    sub         eax,2
>00434070    jb          004340A1
>00434072    jmp         004340AE
 00434074    mov         edx,edi
 00434076    mov         eax,esi
 00434078    mov         ecx,ebp
 0043407A    call        DateOp
>0043407F    jmp         0043410B
 00434084    mov         edx,edi
 00434086    mov         eax,esi
 00434088    mov         ecx,ebp
 0043408A    call        DateOp
 0043408F    cmp         bl,8
>00434092    jne         0043410B
 00434094    cmp         byte ptr [esp],8
>00434098    jne         0043410B
 0043409A    mov         word ptr [esi],5
>0043409F    jmp         0043410B
 004340A1    mov         edx,edi
 004340A3    mov         eax,esi
 004340A5    mov         ecx,ebp
 004340A7    call        RealOp
>004340AC    jmp         0043410B
 004340AE    mov         edx,edi
 004340B0    mov         eax,esi
 004340B2    mov         ecx,ebp
 004340B4    call        IntOp
>004340B9    jmp         0043410B
 004340BB    cmp         ebp,3
>004340BE    jne         004340CD
 004340C0    mov         edx,edi
 004340C2    mov         eax,esi
 004340C4    mov         ecx,ebp
 004340C6    call        RealOp
>004340CB    jmp         0043410B
 004340CD    mov         edx,edi
 004340CF    mov         eax,esi
 004340D1    mov         ecx,ebp
 004340D3    call        Int64Op
>004340D8    jmp         0043410B
 004340DA    cmp         ebp,3
>004340DD    jne         004340EC
 004340DF    mov         edx,edi
 004340E1    mov         eax,esi
 004340E3    mov         ecx,ebp
 004340E5    call        RealOp
>004340EA    jmp         0043410B
 004340EC    mov         edx,edi
 004340EE    mov         eax,esi
 004340F0    mov         ecx,ebp
 004340F2    call        UInt64Op
>004340F7    jmp         0043410B
 004340F9    mov         edx,edi
 004340FB    mov         eax,esi
 004340FD    mov         ecx,ebp
 004340FF    call        AnyOp
>00434104    jmp         0043410B
 00434106    call        VarInvalidOp
 0043410B    pop         edx
 0043410C    pop         ebp
 0043410D    pop         edi
 0043410E    pop         esi
 0043410F    pop         ebx
 00434110    ret
*}
end;

//00434114
procedure @VarOp(var Left:TVarData; const Right:TVarData; const OpCode:TVarOp);
begin
{*
 00434114    push        ebx
 00434115    push        esi
 00434116    push        edi
 00434117    mov         edi,ecx
 00434119    mov         esi,edx
 0043411B    mov         ebx,eax
 0043411D    movzx       eax,word ptr [ebx]
 00434120    movzx       edx,word ptr [esi]
 00434123    cmp         ax,10F
>00434127    jae         0043413D
 00434129    cmp         dx,10F
>0043412E    jae         0043413D
 00434130    mov         edx,esi
 00434132    mov         eax,ebx
 00434134    mov         ecx,edi
 00434136    call        SimpleVarOp
>0043413B    jmp         0043419E
 0043413D    cmp         ax,400C
>00434141    jne         00434159
 00434143    mov         edx,ebx
 00434145    mov         eax,ebx
 00434147    call        @VarCopyNoInd
 0043414C    mov         edx,esi
 0043414E    mov         eax,ebx
 00434150    mov         ecx,edi
 00434152    call        @VarOp
>00434157    jmp         0043419E
 00434159    cmp         dx,400C
>0043415E    jne         00434170
 00434160    mov         eax,dword ptr [esi+8]
 00434163    mov         edx,eax
 00434165    mov         eax,ebx
 00434167    mov         ecx,edi
 00434169    call        @VarOp
>0043416E    jmp         0043419E
 00434170    and         ax,0FFF
 00434174    cmp         ax,10F
>00434178    jae         00434193
 0043417A    and         dx,0FFF
 0043417F    cmp         dx,10F
>00434184    jae         00434193
 00434186    mov         edx,esi
 00434188    mov         eax,ebx
 0043418A    mov         ecx,edi
 0043418C    call        SimpleVarOp
>00434191    jmp         0043419E
 00434193    mov         edx,esi
 00434195    mov         eax,ebx
 00434197    mov         ecx,edi
 00434199    call        VarOpRare
 0043419E    pop         edi
 0043419F    pop         esi
 004341A0    pop         ebx
 004341A1    ret
*}
end;

//004341A4
function VarCompareAny(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;
begin
{*
 004341A4    push        ebp
 004341A5    mov         ebp,esp
 004341A7    add         esp,0FFFFFFDC
 004341AA    push        ebx
 004341AB    push        esi
 004341AC    push        edi
 004341AD    mov         edi,ecx
 004341AF    mov         ebx,edx
 004341B1    mov         esi,eax
 004341B3    lea         eax,[ebp-11]
 004341B6    push        eax
 004341B7    call        oleaut32.VariantInit
 004341BC    xor         eax,eax
 004341BE    push        ebp
 004341BF    push        434267
 004341C4    push        dword ptr fs:[eax]
 004341C7    mov         dword ptr fs:[eax],esp
 004341CA    mov         edx,esi
 004341CC    lea         eax,[ebp-11]
 004341CF    call        @VarCopy
 004341D4    cmp         word ptr [esi],101
>004341D9    jne         004341E4
 004341DB    lea         eax,[ebp-11]
 004341DE    call        dword ptr ds:[792F90]
 004341E4    cmp         word ptr [ebx],101
>004341E9    jne         00434242
 004341EB    lea         eax,[ebp-21]
 004341EE    push        eax
 004341EF    call        oleaut32.VariantInit
 004341F4    xor         eax,eax
 004341F6    push        ebp
 004341F7    push        43423B
 004341FC    push        dword ptr fs:[eax]
 004341FF    mov         dword ptr fs:[eax],esp
 00434202    mov         edx,ebx
 00434204    lea         eax,[ebp-21]
 00434207    call        @VarCopy
 0043420C    lea         eax,[ebp-21]
 0043420F    call        dword ptr ds:[792F90]
 00434215    lea         edx,[ebp-21]
 00434218    lea         eax,[ebp-11]
 0043421B    mov         ecx,edi
 0043421D    call        VarCompare
 00434222    mov         byte ptr [ebp-1],al
 00434225    xor         eax,eax
 00434227    pop         edx
 00434228    pop         ecx
 00434229    pop         ecx
 0043422A    mov         dword ptr fs:[eax],edx
 0043422D    push        434251
 00434232    lea         eax,[ebp-21]
 00434235    call        @VarClear
 0043423A    ret
>0043423B    jmp         @HandleFinally
>00434240    jmp         00434232
 00434242    mov         edx,ebx
 00434244    lea         eax,[ebp-11]
 00434247    mov         ecx,edi
 00434249    call        VarCompare
 0043424E    mov         byte ptr [ebp-1],al
 00434251    xor         eax,eax
 00434253    pop         edx
 00434254    pop         ecx
 00434255    pop         ecx
 00434256    mov         dword ptr fs:[eax],edx
 00434259    push        43426E
 0043425E    lea         eax,[ebp-11]
 00434261    call        @VarClear
 00434266    ret
>00434267    jmp         @HandleFinally
>0043426C    jmp         0043425E
 0043426E    movzx       eax,byte ptr [ebp-1]
 00434272    pop         edi
 00434273    pop         esi
 00434274    pop         ebx
 00434275    mov         esp,ebp
 00434277    pop         ebp
 00434278    ret
*}
end;

//0043427C
function EmptyCompare(L:TBaseType; R:TBaseType):TVarCompareResult;
begin
{*
 0043427C    cmp         al,1
>0043427E    jne         0043428C
 00434280    cmp         dl,1
>00434283    jne         00434289
 00434285    mov         al,1
>00434287    jmp         0043428E
 00434289    xor         eax,eax
 0043428B    ret
 0043428C    mov         al,2
 0043428E    ret
*}
end;

//00434290
function NullCompare(L:TBaseType; R:TBaseType; OpCode:TVarOp):TVarCompareResult;
begin
{*
 00434290    push        ebx
 00434291    push        ecx
 00434292    mov         byte ptr [esp],dl
 00434295    mov         bl,1
 00434297    mov         edx,ecx
 00434299    sub         edx,0E
>0043429C    je          004342B0
 0043429E    dec         edx
>0043429F    je          004342FC
 004342A1    dec         edx
 004342A2    sub         edx,4
>004342A5    jb          0043433C
>004342AB    jmp         00434377
 004342B0    movzx       edx,byte ptr ds:[784E68]
 004342B7    sub         dl,1
>004342BA    jb          004342C7
>004342BC    je          004342D1
 004342BE    dec         dl
>004342C0    je          004342DD
>004342C2    jmp         0043437C
 004342C7    call        VarInvalidNullOp
>004342CC    jmp         0043437C
 004342D1    movzx       ebx,byte ptr ds:[784F32]
>004342D8    jmp         0043437C
 004342DD    cmp         al,2
>004342DF    jne         004342E7
 004342E1    cmp         byte ptr [esp],2
>004342E5    je          004342EB
 004342E7    xor         eax,eax
>004342E9    jmp         004342ED
 004342EB    mov         al,1
 004342ED    and         eax,7F
 004342F0    movzx       ebx,byte ptr [eax+784F32]
>004342F7    jmp         0043437C
 004342FC    movzx       edx,byte ptr ds:[784E68]
 00434303    sub         dl,1
>00434306    jb          00434310
>00434308    je          00434317
 0043430A    dec         dl
>0043430C    je          00434320
>0043430E    jmp         0043437C
 00434310    call        VarInvalidNullOp
>00434315    jmp         0043437C
 00434317    movzx       ebx,byte ptr ds:[784F34]
>0043431E    jmp         0043437C
 00434320    cmp         al,2
>00434322    jne         0043432E
 00434324    cmp         byte ptr [esp],2
>00434328    jne         0043432E
 0043432A    xor         eax,eax
>0043432C    jmp         00434330
 0043432E    mov         al,1
 00434330    and         eax,7F
 00434333    movzx       ebx,byte ptr [eax+784F34]
>0043433A    jmp         0043437C
 0043433C    movzx       edx,byte ptr ds:[784E69]
 00434343    sub         dl,1
>00434346    jb          00434350
>00434348    je          00434357
 0043434A    dec         dl
>0043434C    je          00434361
>0043434E    jmp         0043437C
 00434350    call        VarInvalidNullOp
>00434355    jmp         0043437C
 00434357    movzx       ebx,byte ptr [ecx*2+784F16]
>0043435F    jmp         0043437C
 00434361    cmp         al,2
>00434363    jne         00434373
 00434365    cmp         byte ptr [esp],2
>00434369    jne         0043436F
 0043436B    mov         bl,1
>0043436D    jmp         0043437C
 0043436F    xor         ebx,ebx
>00434371    jmp         0043437C
 00434373    mov         bl,2
>00434375    jmp         0043437C
 00434377    call        VarInvalidOp
 0043437C    mov         eax,ebx
 0043437E    pop         edx
 0043437F    pop         ebx
 00434380    ret
*}
end;

//00434384
function IntCompare(A:Integer; B:Integer):TVarCompareResult;
begin
{*
 00434384    cmp         edx,eax
>00434386    jle         0043438B
 00434388    xor         eax,eax
 0043438A    ret
 0043438B    cmp         edx,eax
>0043438D    jge         00434393
 0043438F    mov         al,2
>00434391    jmp         00434395
 00434393    mov         al,1
 00434395    ret
*}
end;

//00434398
function Int64Compare(const A:Int64; const B:Int64):TVarCompareResult;
begin
{*
 00434398    push        ebp
 00434399    mov         ebp,esp
 0043439B    mov         eax,dword ptr [ebp+10]
 0043439E    mov         edx,dword ptr [ebp+14]
 004343A1    cmp         edx,dword ptr [ebp+0C]
>004343A4    jne         004343AD
 004343A6    cmp         eax,dword ptr [ebp+8]
>004343A9    jae         004343B3
>004343AB    jmp         004343AF
>004343AD    jge         004343B3
 004343AF    xor         eax,eax
>004343B1    jmp         004343CD
 004343B3    mov         eax,dword ptr [ebp+10]
 004343B6    mov         edx,dword ptr [ebp+14]
 004343B9    cmp         edx,dword ptr [ebp+0C]
>004343BC    jne         004343C5
 004343BE    cmp         eax,dword ptr [ebp+8]
>004343C1    jbe         004343CB
>004343C3    jmp         004343C7
>004343C5    jle         004343CB
 004343C7    mov         al,2
>004343C9    jmp         004343CD
 004343CB    mov         al,1
 004343CD    pop         ebp
 004343CE    ret         10
*}
end;

//004343D4
function UInt64Compare(const A:UInt64; const B:UInt64):TVarCompareResult;
begin
{*
 004343D4    push        ebp
 004343D5    mov         ebp,esp
 004343D7    mov         eax,dword ptr [ebp+10]
 004343DA    mov         edx,dword ptr [ebp+14]
 004343DD    cmp         edx,dword ptr [ebp+0C]
>004343E0    jne         004343E5
 004343E2    cmp         eax,dword ptr [ebp+8]
>004343E5    jae         004343EB
 004343E7    xor         eax,eax
>004343E9    jmp         00434401
 004343EB    mov         eax,dword ptr [ebp+10]
 004343EE    mov         edx,dword ptr [ebp+14]
 004343F1    cmp         edx,dword ptr [ebp+0C]
>004343F4    jne         004343F9
 004343F6    cmp         eax,dword ptr [ebp+8]
>004343F9    jbe         004343FF
 004343FB    mov         al,2
>004343FD    jmp         00434401
 004343FF    mov         al,1
 00434401    pop         ebp
 00434402    ret         10
*}
end;

//00434408
function RealCompare(const A:Double; const B:Double):TVarCompareResult;
begin
{*
 00434408    push        ebp
 00434409    mov         ebp,esp
 0043440B    fld         qword ptr [ebp+10]
 0043440E    fcomp       qword ptr [ebp+8]
 00434411    wait
 00434412    fnstsw      al
 00434414    sahf
>00434415    jae         0043441B
 00434417    xor         eax,eax
>00434419    jmp         0043442D
 0043441B    fld         qword ptr [ebp+10]
 0043441E    fcomp       qword ptr [ebp+8]
 00434421    wait
 00434422    fnstsw      al
 00434424    sahf
>00434425    jbe         0043442B
 00434427    mov         al,2
>00434429    jmp         0043442D
 0043442B    mov         al,1
 0043442D    pop         ebp
 0043442E    ret         10
*}
end;

//00434434
function DateCompare(const A:TDateTime; const B:TDateTime):TVarCompareResult;
begin
{*
 00434434    push        ebp
 00434435    mov         ebp,esp
 00434437    fld         qword ptr [ebp+10]
 0043443A    fcomp       qword ptr [ebp+8]
 0043443D    wait
 0043443E    fnstsw      al
 00434440    sahf
>00434441    jae         00434447
 00434443    xor         eax,eax
>00434445    jmp         00434459
 00434447    fld         qword ptr [ebp+10]
 0043444A    fcomp       qword ptr [ebp+8]
 0043444D    wait
 0043444E    fnstsw      al
 00434450    sahf
>00434451    jbe         00434457
 00434453    mov         al,2
>00434455    jmp         00434459
 00434457    mov         al,1
 00434459    pop         ebp
 0043445A    ret         10
*}
end;

//00434460
function CurrCompare(const A:Currency; const B:Currency):TVarCompareResult;
begin
{*
 00434460    push        ebp
 00434461    mov         ebp,esp
 00434463    fild        qword ptr [ebp+10]
 00434466    fild        qword ptr [ebp+8]
 00434469    fcompp
 0043446B    wait
 0043446C    fnstsw      al
 0043446E    sahf
>0043446F    jbe         00434475
 00434471    xor         eax,eax
>00434473    jmp         00434489
 00434475    fild        qword ptr [ebp+10]
 00434478    fild        qword ptr [ebp+8]
 0043447B    fcompp
 0043447D    wait
 0043447E    fnstsw      al
 00434480    sahf
>00434481    jae         00434487
 00434483    mov         al,2
>00434485    jmp         00434489
 00434487    mov         al,1
 00434489    pop         ebp
 0043448A    ret         10
*}
end;

//00434490
function StringCompare(const L:TVarData; const R:TVarData):TVarCompareResult;
begin
{*
 00434490    push        ebp
 00434491    mov         ebp,esp
 00434493    push        0
 00434495    push        0
 00434497    push        ebx
 00434498    mov         ebx,edx
 0043449A    xor         edx,edx
 0043449C    push        ebp
 0043449D    push        4344EB
 004344A2    push        dword ptr fs:[edx]
 004344A5    mov         dword ptr fs:[edx],esp
 004344A8    mov         edx,eax
 004344AA    lea         eax,[ebp-4]
 004344AD    call        @VarToUStr
 004344B2    mov         edx,ebx
 004344B4    lea         eax,[ebp-8]
 004344B7    call        @VarToUStr
 004344BC    mov         edx,dword ptr [ebp-8]
 004344BF    mov         eax,dword ptr [ebp-4]
 004344C2    call        CompareStr
 004344C7    xor         edx,edx
 004344C9    call        IntCompare
 004344CE    mov         ebx,eax
 004344D0    xor         eax,eax
 004344D2    pop         edx
 004344D3    pop         ecx
 004344D4    pop         ecx
 004344D5    mov         dword ptr fs:[eax],edx
 004344D8    push        4344F2
 004344DD    lea         eax,[ebp-8]
 004344E0    mov         edx,2
 004344E5    call        @UStrArrayClr
 004344EA    ret
>004344EB    jmp         @HandleFinally
>004344F0    jmp         004344DD
 004344F2    mov         eax,ebx
 004344F4    pop         ebx
 004344F5    pop         ecx
 004344F6    pop         ecx
 004344F7    pop         ebp
 004344F8    ret
*}
end;

//004344FC
function VarCompareSimple(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;
begin
{*
 004344FC    push        ebx
 004344FD    push        esi
 004344FE    push        edi
 004344FF    push        ebp
 00434500    mov         ebp,ecx
 00434502    mov         edi,edx
 00434504    mov         esi,eax
 00434506    movzx       eax,word ptr [esi]
 00434509    call        CheckType
 0043450E    movzx       eax,ax
 00434511    movzx       ebx,byte ptr [eax+784E73]
 00434518    movzx       eax,word ptr [edi]
 0043451B    call        CheckType
 00434520    movzx       eax,ax
 00434523    movzx       eax,byte ptr [eax+784E73]
 0043452A    movzx       edx,al
 0043452D    movzx       ecx,bl
 00434530    lea         ecx,[ecx+ecx*2]
 00434533    lea         ecx,[ecx*4+784F3E]
 0043453A    movzx       edx,byte ptr [ecx+edx]
 0043453E    cmp         edx,0B
>00434541    ja          0043469B
 00434547    jmp         dword ptr [edx*4+43454E]
 00434547    dd          0043457E
 00434547    dd          0043458A
 00434547    dd          00434598
 00434547    dd          004345A8
 00434547    dd          004345FA
 00434547    dd          00434643
 00434547    dd          00434666
 00434547    dd          00434671
 00434547    dd          00434620
 00434547    dd          004345C2
 00434547    dd          004345DE
 00434547    dd          0043468E
 0043457E    call        VarInvalidOp
 00434583    mov         al,1
>00434585    jmp         004346A2
 0043458A    mov         edx,eax
 0043458C    mov         eax,ebx
 0043458E    call        EmptyCompare
>00434593    jmp         004346A2
 00434598    mov         ecx,ebp
 0043459A    mov         edx,eax
 0043459C    mov         eax,ebx
 0043459E    call        NullCompare
>004345A3    jmp         004346A2
 004345A8    mov         eax,edi
 004345AA    call        @VarToInteger
 004345AF    push        eax
 004345B0    mov         eax,esi
 004345B2    call        @VarToInteger
 004345B7    pop         edx
 004345B8    call        IntCompare
>004345BD    jmp         004346A2
 004345C2    mov         eax,esi
 004345C4    call        @VarToInt64
 004345C9    push        edx
 004345CA    push        eax
 004345CB    mov         eax,edi
 004345CD    call        @VarToInt64
 004345D2    push        edx
 004345D3    push        eax
 004345D4    call        Int64Compare
>004345D9    jmp         004346A2
 004345DE    mov         eax,esi
 004345E0    call        @VarToUInt64
 004345E5    push        edx
 004345E6    push        eax
 004345E7    mov         eax,edi
 004345E9    call        @VarToUInt64
 004345EE    push        edx
 004345EF    push        eax
 004345F0    call        UInt64Compare
>004345F5    jmp         004346A2
 004345FA    mov         eax,esi
 004345FC    call        @VarToDouble
 00434601    add         esp,0FFFFFFF8
 00434604    fstp        qword ptr [esp]
 00434607    wait
 00434608    mov         eax,edi
 0043460A    call        @VarToDouble
 0043460F    add         esp,0FFFFFFF8
 00434612    fstp        qword ptr [esp]
 00434615    wait
 00434616    call        RealCompare
>0043461B    jmp         004346A2
 00434620    mov         eax,esi
 00434622    call        @VarToDate
 00434627    add         esp,0FFFFFFF8
 0043462A    fstp        qword ptr [esp]
 0043462D    wait
 0043462E    mov         eax,edi
 00434630    call        @VarToDate
 00434635    add         esp,0FFFFFFF8
 00434638    fstp        qword ptr [esp]
 0043463B    wait
 0043463C    call        DateCompare
>00434641    jmp         004346A2
 00434643    mov         eax,esi
 00434645    call        @VarToCurrency
 0043464A    add         esp,0FFFFFFF8
 0043464D    fistp       qword ptr [esp]
 00434650    wait
 00434651    mov         eax,edi
 00434653    call        @VarToCurrency
 00434658    add         esp,0FFFFFFF8
 0043465B    fistp       qword ptr [esp]
 0043465E    wait
 0043465F    call        CurrCompare
>00434664    jmp         004346A2
 00434666    mov         edx,edi
 00434668    mov         eax,esi
 0043466A    call        StringCompare
>0043466F    jmp         004346A2
 00434671    mov         eax,edi
 00434673    call        @VarToBoolean
 00434678    and         eax,7F
 0043467B    push        eax
 0043467C    mov         eax,esi
 0043467E    call        @VarToBoolean
 00434683    and         eax,7F
 00434686    pop         edx
 00434687    call        IntCompare
>0043468C    jmp         004346A2
 0043468E    mov         edx,edi
 00434690    mov         eax,esi
 00434692    mov         ecx,ebp
 00434694    call        VarCompareAny
>00434699    jmp         004346A2
 0043469B    call        VarInvalidOp
 004346A0    mov         al,1
 004346A2    pop         ebp
 004346A3    pop         edi
 004346A4    pop         esi
 004346A5    pop         ebx
 004346A6    ret
*}
end;

//004346A8
function VarCompareRare(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;
begin
{*
 004346A8    push        ebp
 004346A9    mov         ebp,esp
 004346AB    add         esp,0FFFFFFD8
 004346AE    push        ebx
 004346AF    push        esi
 004346B0    mov         dword ptr [ebp-8],ecx
 004346B3    mov         dword ptr [ebp-4],edx
 004346B6    mov         ebx,eax
 004346B8    mov         byte ptr [ebp-9],1
 004346BC    movzx       esi,word ptr [ebx]
 004346BF    mov         eax,esi
 004346C1    and         ax,0FFF
 004346C5    cmp         ax,10F
>004346C9    jae         0043484A
 004346CF    test        si,si
>004346D2    jne         004346E5
 004346D4    xor         edx,edx
 004346D6    mov         al,1
 004346D8    call        EmptyCompare
 004346DD    mov         byte ptr [ebp-9],al
>004346E0    jmp         00434AC2
 004346E5    cmp         si,1
>004346E9    jne         004346FF
 004346EB    mov         ecx,dword ptr [ebp-8]
 004346EE    xor         edx,edx
 004346F0    mov         al,2
 004346F2    call        NullCompare
 004346F7    mov         byte ptr [ebp-9],al
>004346FA    jmp         00434AC2
 004346FF    lea         edx,[ebp-18]
 00434702    mov         eax,dword ptr [ebp-4]
 00434705    movzx       eax,word ptr [eax]
 00434708    call        FindCustomVariantType
 0043470D    test        al,al
>0043470F    jne         0043471B
 00434711    call        VarInvalidOp
>00434716    jmp         00434AC2
 0043471B    lea         eax,[ebp-0C]
 0043471E    push        eax
 0043471F    mov         edx,ebx
 00434721    mov         ecx,0B
 00434726    mov         eax,dword ptr [ebp-18]
 00434729    mov         esi,dword ptr [eax]
 0043472B    call        dword ptr [esi+4]
 0043472E    test        al,al
>00434730    je          004347E6
 00434736    movzx       eax,word ptr [ebx]
 00434739    cmp         ax,word ptr [ebp-0C]
>0043473D    je          004347BB
 0043473F    lea         eax,[ebp-28]
 00434742    push        eax
 00434743    call        oleaut32.VariantInit
 00434748    xor         eax,eax
 0043474A    push        ebp
 0043474B    push        4347B4
 00434750    push        dword ptr fs:[eax]
 00434753    mov         dword ptr fs:[eax],esp
 00434756    movzx       ecx,word ptr [ebp-0C]
 0043475A    mov         edx,ebx
 0043475C    lea         eax,[ebp-28]
 0043475F    call        @VarCast
 00434764    movzx       eax,word ptr [ebp-28]
 00434768    and         ax,0FFF
 0043476C    cmp         ax,word ptr [ebp-0C]
>00434770    je          00434777
 00434772    call        VarCastError
 00434777    mov         eax,dword ptr [ebp-8]
 0043477A    push        eax
 0043477B    mov         ecx,dword ptr [ebp-4]
 0043477E    lea         edx,[ebp-28]
 00434781    mov         eax,dword ptr [ebp-18]
 00434784    mov         ebx,dword ptr [eax]
 00434786    call        dword ptr [ebx+34]
 00434789    and         eax,7F
 0043478C    mov         edx,dword ptr [ebp-8]
 0043478F    lea         edx,[edx*2+784F32]
 00434796    movzx       eax,byte ptr [edx+eax-1C]
 0043479B    mov         byte ptr [ebp-9],al
 0043479E    xor         eax,eax
 004347A0    pop         edx
 004347A1    pop         ecx
 004347A2    pop         ecx
 004347A3    mov         dword ptr fs:[eax],edx
 004347A6    push        434AC2
 004347AB    lea         eax,[ebp-28]
 004347AE    call        @VarClear
 004347B3    ret
>004347B4    jmp         @HandleFinally
>004347B9    jmp         004347AB
 004347BB    mov         eax,dword ptr [ebp-8]
 004347BE    push        eax
 004347BF    mov         ecx,dword ptr [ebp-4]
 004347C2    mov         edx,ebx
 004347C4    mov         eax,dword ptr [ebp-18]
 004347C7    mov         ebx,dword ptr [eax]
 004347C9    call        dword ptr [ebx+34]
 004347CC    and         eax,7F
 004347CF    mov         edx,dword ptr [ebp-8]
 004347D2    lea         edx,[edx*2+784F32]
 004347D9    movzx       eax,byte ptr [edx+eax-1C]
 004347DE    mov         byte ptr [ebp-9],al
>004347E1    jmp         00434AC2
 004347E6    lea         eax,[ebp-28]
 004347E9    push        eax
 004347EA    call        oleaut32.VariantInit
 004347EF    xor         eax,eax
 004347F1    push        ebp
 004347F2    push        434843
 004347F7    push        dword ptr fs:[eax]
 004347FA    mov         dword ptr fs:[eax],esp
 004347FD    movzx       ecx,word ptr [ebx]
 00434800    mov         edx,dword ptr [ebp-4]
 00434803    lea         eax,[ebp-28]
 00434806    call        @VarCast
 0043480B    movzx       eax,word ptr [ebp-28]
 0043480F    and         ax,0FFF
 00434813    cmp         ax,word ptr [ebx]
>00434816    je          0043481D
 00434818    call        VarCastError
 0043481D    lea         edx,[ebp-28]
 00434820    mov         eax,ebx
 00434822    mov         ecx,dword ptr [ebp-8]
 00434825    call        VarCompareSimple
 0043482A    mov         byte ptr [ebp-9],al
 0043482D    xor         eax,eax
 0043482F    pop         edx
 00434830    pop         ecx
 00434831    pop         ecx
 00434832    mov         dword ptr fs:[eax],edx
 00434835    push        434AC2
 0043483A    lea         eax,[ebp-28]
 0043483D    call        @VarClear
 00434842    ret
>00434843    jmp         @HandleFinally
>00434848    jmp         0043483A
 0043484A    mov         eax,dword ptr [ebp-4]
 0043484D    movzx       eax,word ptr [eax]
 00434850    test        ax,ax
>00434853    jne         00434866
 00434855    mov         dl,1
 00434857    xor         eax,eax
 00434859    call        EmptyCompare
 0043485E    mov         byte ptr [ebp-9],al
>00434861    jmp         00434AC2
 00434866    mov         edx,dword ptr [ebp-4]
 00434869    cmp         ax,1
>0043486D    jne         00434883
 0043486F    mov         ecx,dword ptr [ebp-8]
 00434872    mov         dl,2
 00434874    xor         eax,eax
 00434876    call        NullCompare
 0043487B    mov         byte ptr [ebp-9],al
>0043487E    jmp         00434AC2
 00434883    lea         edx,[ebp-14]
 00434886    mov         eax,esi
 00434888    call        FindCustomVariantType
 0043488D    test        al,al
>0043488F    jne         0043489B
 00434891    call        VarInvalidOp
>00434896    jmp         00434AC2
 0043489B    lea         eax,[ebp-0E]
 0043489E    push        eax
 0043489F    mov         edx,dword ptr [ebp-4]
 004348A2    mov         ecx,0B
 004348A7    mov         eax,dword ptr [ebp-14]
 004348AA    mov         esi,dword ptr [eax]
 004348AC    call        dword ptr [esi+8]
 004348AF    test        al,al
>004348B1    je          00434966
 004348B7    mov         eax,dword ptr [ebp-4]
 004348BA    movzx       eax,word ptr [eax]
 004348BD    cmp         ax,word ptr [ebp-0E]
>004348C1    je          0043493B
 004348C3    lea         eax,[ebp-28]
 004348C6    push        eax
 004348C7    call        oleaut32.VariantInit
 004348CC    xor         eax,eax
 004348CE    push        ebp
 004348CF    push        434934
 004348D4    push        dword ptr fs:[eax]
 004348D7    mov         dword ptr fs:[eax],esp
 004348DA    movzx       ecx,word ptr [ebp-0E]
 004348DE    mov         edx,dword ptr [ebp-4]
 004348E1    lea         eax,[ebp-28]
 004348E4    call        @VarCast
 004348E9    movzx       eax,word ptr [ebp-28]
 004348ED    cmp         ax,word ptr [ebp-0E]
>004348F1    je          004348F8
 004348F3    call        VarCastError
 004348F8    mov         eax,dword ptr [ebp-8]
 004348FB    push        eax
 004348FC    lea         ecx,[ebp-28]
 004348FF    mov         edx,ebx
 00434901    mov         eax,dword ptr [ebp-14]
 00434904    mov         ebx,dword ptr [eax]
 00434906    call        dword ptr [ebx+34]
 00434909    and         eax,7F
 0043490C    mov         edx,dword ptr [ebp-8]
 0043490F    lea         edx,[edx*2+784F32]
 00434916    movzx       eax,byte ptr [edx+eax-1C]
 0043491B    mov         byte ptr [ebp-9],al
 0043491E    xor         eax,eax
 00434920    pop         edx
 00434921    pop         ecx
 00434922    pop         ecx
 00434923    mov         dword ptr fs:[eax],edx
 00434926    push        434AC2
 0043492B    lea         eax,[ebp-28]
 0043492E    call        @VarClear
 00434933    ret
>00434934    jmp         @HandleFinally
>00434939    jmp         0043492B
 0043493B    mov         eax,dword ptr [ebp-8]
 0043493E    push        eax
 0043493F    mov         ecx,dword ptr [ebp-4]
 00434942    mov         edx,ebx
 00434944    mov         eax,dword ptr [ebp-14]
 00434947    mov         ebx,dword ptr [eax]
 00434949    call        dword ptr [ebx+34]
 0043494C    and         eax,7F
 0043494F    mov         edx,dword ptr [ebp-8]
 00434952    lea         edx,[edx*2+784F32]
 00434959    movzx       eax,byte ptr [edx+eax-1C]
 0043495E    mov         byte ptr [ebp-9],al
>00434961    jmp         00434AC2
 00434966    mov         esi,dword ptr [ebp-4]
 00434969    movzx       esi,word ptr [esi]
 0043496C    mov         eax,esi
 0043496E    and         ax,0FFF
 00434972    cmp         ax,10F
>00434976    jae         004349DE
 00434978    lea         eax,[ebp-28]
 0043497B    push        eax
 0043497C    call        oleaut32.VariantInit
 00434981    xor         eax,eax
 00434983    push        ebp
 00434984    push        4349D7
 00434989    push        dword ptr fs:[eax]
 0043498C    mov         dword ptr fs:[eax],esp
 0043498F    mov         ecx,dword ptr [ebp-4]
 00434992    movzx       ecx,word ptr [ecx]
 00434995    mov         edx,ebx
 00434997    lea         eax,[ebp-28]
 0043499A    call        @VarCast
 0043499F    mov         eax,dword ptr [ebp-4]
 004349A2    movzx       eax,word ptr [eax]
 004349A5    cmp         ax,word ptr [ebp-28]
>004349A9    je          004349B0
 004349AB    call        VarCastError
 004349B0    mov         edx,dword ptr [ebp-4]
 004349B3    lea         eax,[ebp-28]
 004349B6    mov         ecx,dword ptr [ebp-8]
 004349B9    call        VarCompareSimple
 004349BE    mov         byte ptr [ebp-9],al
 004349C1    xor         eax,eax
 004349C3    pop         edx
 004349C4    pop         ecx
 004349C5    pop         ecx
 004349C6    mov         dword ptr fs:[eax],edx
 004349C9    push        434AC2
 004349CE    lea         eax,[ebp-28]
 004349D1    call        @VarClear
 004349D6    ret
>004349D7    jmp         @HandleFinally
>004349DC    jmp         004349CE
 004349DE    lea         edx,[ebp-18]
 004349E1    mov         eax,dword ptr [ebp-4]
 004349E4    mov         eax,esi
 004349E6    call        FindCustomVariantType
 004349EB    test        al,al
>004349ED    jne         004349F9
 004349EF    call        VarInvalidOp
>004349F4    jmp         00434AC2
 004349F9    lea         eax,[ebp-0C]
 004349FC    push        eax
 004349FD    mov         edx,ebx
 004349FF    mov         ecx,0B
 00434A04    mov         eax,dword ptr [ebp-18]
 00434A07    mov         esi,dword ptr [eax]
 00434A09    call        dword ptr [esi+4]
 00434A0C    test        al,al
>00434A0E    je          00434ABD
 00434A14    movzx       eax,word ptr [ebx]
 00434A17    cmp         ax,word ptr [ebp-0C]
>00434A1B    je          00434A95
 00434A1D    lea         eax,[ebp-28]
 00434A20    push        eax
 00434A21    call        oleaut32.VariantInit
 00434A26    xor         eax,eax
 00434A28    push        ebp
 00434A29    push        434A8E
 00434A2E    push        dword ptr fs:[eax]
 00434A31    mov         dword ptr fs:[eax],esp
 00434A34    movzx       ecx,word ptr [ebp-0C]
 00434A38    mov         edx,ebx
 00434A3A    lea         eax,[ebp-28]
 00434A3D    call        @VarCast
 00434A42    movzx       eax,word ptr [ebp-28]
 00434A46    cmp         ax,word ptr [ebp-0C]
>00434A4A    je          00434A51
 00434A4C    call        VarCastError
 00434A51    mov         eax,dword ptr [ebp-8]
 00434A54    push        eax
 00434A55    mov         ecx,dword ptr [ebp-4]
 00434A58    lea         edx,[ebp-28]
 00434A5B    mov         eax,dword ptr [ebp-18]
 00434A5E    mov         ebx,dword ptr [eax]
 00434A60    call        dword ptr [ebx+34]
 00434A63    and         eax,7F
 00434A66    mov         edx,dword ptr [ebp-8]
 00434A69    lea         edx,[edx*2+784F32]
 00434A70    movzx       eax,byte ptr [edx+eax-1C]
 00434A75    mov         byte ptr [ebp-9],al
 00434A78    xor         eax,eax
 00434A7A    pop         edx
 00434A7B    pop         ecx
 00434A7C    pop         ecx
 00434A7D    mov         dword ptr fs:[eax],edx
 00434A80    push        434AC2
 00434A85    lea         eax,[ebp-28]
 00434A88    call        @VarClear
 00434A8D    ret
>00434A8E    jmp         @HandleFinally
>00434A93    jmp         00434A85
 00434A95    mov         eax,dword ptr [ebp-8]
 00434A98    push        eax
 00434A99    mov         ecx,dword ptr [ebp-4]
 00434A9C    mov         edx,ebx
 00434A9E    mov         eax,dword ptr [ebp-18]
 00434AA1    mov         ebx,dword ptr [eax]
 00434AA3    call        dword ptr [ebx+34]
 00434AA6    and         eax,7F
 00434AA9    mov         edx,dword ptr [ebp-8]
 00434AAC    lea         edx,[edx*2+784F32]
 00434AB3    movzx       eax,byte ptr [edx+eax-1C]
 00434AB8    mov         byte ptr [ebp-9],al
>00434ABB    jmp         00434AC2
 00434ABD    call        VarInvalidOp
 00434AC2    movzx       eax,byte ptr [ebp-9]
 00434AC6    pop         esi
 00434AC7    pop         ebx
 00434AC8    mov         esp,ebp
 00434ACA    pop         ebp
 00434ACB    ret
*}
end;

//00434ACC
function VarCompare(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;
begin
{*
 00434ACC    push        esi
 00434ACD    push        edi
 00434ACE    movzx       esi,word ptr [eax]
 00434AD1    movzx       edi,word ptr [edx]
 00434AD4    cmp         si,10F
>00434AD9    jae         00434AEA
 00434ADB    cmp         di,10F
>00434AE0    jae         00434AEA
 00434AE2    call        VarCompareSimple
 00434AE7    pop         edi
 00434AE8    pop         esi
 00434AE9    ret
 00434AEA    cmp         si,400C
>00434AEF    jne         00434AFB
 00434AF1    mov         eax,dword ptr [eax+8]
 00434AF4    call        VarCompare
>00434AF9    jmp         00434B30
 00434AFB    cmp         di,400C
>00434B00    jne         00434B0C
 00434B02    mov         edx,dword ptr [edx+8]
 00434B05    call        VarCompare
>00434B0A    jmp         00434B30
 00434B0C    and         si,0FFF
 00434B11    cmp         si,10F
>00434B16    jae         00434B2B
 00434B18    and         di,0FFF
 00434B1D    cmp         di,10F
>00434B22    jae         00434B2B
 00434B24    call        VarCompareSimple
>00434B29    jmp         00434B30
 00434B2B    call        VarCompareRare
 00434B30    pop         edi
 00434B31    pop         esi
 00434B32    ret
*}
end;

//00434B34
procedure NotAsString(var Dest:TVarData);
begin
{*
 00434B34    push        ebp
 00434B35    mov         ebp,esp
 00434B37    push        0
 00434B39    push        0
 00434B3B    push        0
 00434B3D    push        ebx
 00434B3E    mov         ebx,eax
 00434B40    xor         eax,eax
 00434B42    push        ebp
 00434B43    push        434BFB
 00434B48    push        dword ptr fs:[eax]
 00434B4B    mov         dword ptr fs:[eax],esp
 00434B4E    mov         edx,ebx
 00434B50    lea         eax,[ebp-4]
 00434B53    call        @VarToWStr
 00434B58    lea         eax,[ebp-8]
 00434B5B    push        eax
 00434B5C    push        0
 00434B5E    push        400
 00434B63    mov         eax,dword ptr [ebp-4]
 00434B66    push        eax
 00434B67    mov         eax,[0078DAA0];^gvar_00792F4C
 00434B6C    mov         eax,dword ptr [eax]
 00434B6E    call        eax
 00434B70    mov         edx,eax
 00434B72    sub         edx,80020005
>00434B78    je          00434B92
 00434B7A    sub         edx,7FFDFFFB
>00434B80    jne         00434BD1
 00434B82    mov         eax,ebx
 00434B84    mov         edx,dword ptr [ebp-8]
 00434B87    not         edx
 00434B89    mov         cl,0FC
 00434B8B    call        @VarFromInt
>00434B90    jmp         00434BDD
 00434B92    lea         eax,[ebp-0C]
 00434B95    mov         edx,dword ptr [ebp-4]
 00434B98    call        @UStrFromWStr
 00434B9D    mov         eax,dword ptr [ebp-0C]
 00434BA0    lea         edx,[ebp-8]
 00434BA3    call        TryStrToInt
 00434BA8    test        al,al
>00434BAA    je          00434BBC
 00434BAC    mov         eax,ebx
 00434BAE    mov         edx,dword ptr [ebp-8]
 00434BB1    not         edx
 00434BB3    mov         cl,0FC
 00434BB5    call        @VarFromInt
>00434BBA    jmp         00434BDD
 00434BBC    mov         eax,ebx
 00434BBE    call        @VarToBoolean
 00434BC3    mov         edx,eax
 00434BC5    xor         dl,1
 00434BC8    mov         eax,ebx
 00434BCA    call        @VarFromBool
>00434BCF    jmp         00434BDD
 00434BD1    movzx       edx,word ptr [ebx]
 00434BD4    mov         cx,3
 00434BD8    call        VarResultCheck
 00434BDD    xor         eax,eax
 00434BDF    pop         edx
 00434BE0    pop         ecx
 00434BE1    pop         ecx
 00434BE2    mov         dword ptr fs:[eax],edx
 00434BE5    push        434C02
 00434BEA    lea         eax,[ebp-0C]
 00434BED    call        @UStrClr
 00434BF2    lea         eax,[ebp-4]
 00434BF5    call        @WStrClr
 00434BFA    ret
>00434BFB    jmp         @HandleFinally
>00434C00    jmp         00434BEA
 00434C02    pop         ebx
 00434C03    mov         esp,ebp
 00434C05    pop         ebp
 00434C06    ret
*}
end;

//00434C08
procedure NotAsOrdinal(var Dest:TVarData);
begin
{*
 00434C08    push        ebx
 00434C09    add         esp,0FFFFFFF8
 00434C0C    mov         ebx,eax
 00434C0E    mov         eax,ebx
 00434C10    call        @VarToInt64
 00434C15    mov         dword ptr [esp],eax
 00434C18    mov         dword ptr [esp+4],edx
 00434C1C    cmp         dword ptr [esp+4],0
>00434C21    jne         00434C2E
 00434C23    cmp         dword ptr [esp],7FFFFFFF
>00434C2A    ja          00434C56
>00434C2C    jmp         00434C30
>00434C2E    jg          00434C56
 00434C30    cmp         dword ptr [esp+4],0FFFFFFFF
>00434C35    jne         00434C42
 00434C37    cmp         dword ptr [esp],80000000
>00434C3E    jb          00434C56
>00434C40    jmp         00434C44
>00434C42    jl          00434C56
 00434C44    mov         eax,dword ptr [esp]
 00434C47    mov         edx,eax
 00434C49    not         edx
 00434C4B    mov         eax,ebx
 00434C4D    mov         cl,0FC
 00434C4F    call        @VarFromInt
>00434C54    jmp         00434C6A
 00434C56    mov         eax,dword ptr [esp]
 00434C59    mov         edx,dword ptr [esp+4]
 00434C5D    not         eax
 00434C5F    not         edx
 00434C61    push        edx
 00434C62    push        eax
 00434C63    mov         eax,ebx
 00434C65    call        @VarFromInt64
 00434C6A    pop         ecx
 00434C6B    pop         edx
 00434C6C    pop         ebx
 00434C6D    ret
*}
end;

//00434C70
procedure NegateViaOS(var Dest:TVarData);
begin
{*
 00434C70    push        ebx
 00434C71    mov         ebx,eax
 00434C73    push        ebx
 00434C74    push        ebx
 00434C75    mov         eax,[0078DAC0];^gvar_00792F20
 00434C7A    mov         eax,dword ptr [eax]
 00434C7C    call        eax
 00434C7E    call        VarResultCheck
 00434C83    pop         ebx
 00434C84    ret
*}
end;

//00434C88
procedure NegateVariant(Source:PVarData; var Dest:TVarData);
begin
{*
 00434C88    push        ebx
 00434C89    push        esi
 00434C8A    xor         ecx,ecx
 00434C8C    push        ecx
 00434C8D    push        ecx
 00434C8E    push        ecx
 00434C8F    push        ecx
 00434C90    mov         esi,edx
 00434C92    mov         ebx,eax
 00434C94    mov         edx,ebx
 00434C96    mov         eax,esp
 00434C98    call        @VarCopy
 00434C9D    mov         eax,esp
 00434C9F    call        @VarNeg
 00434CA4    mov         edx,esp
 00434CA6    mov         eax,esi
 00434CA8    call        @VarCopy
 00434CAD    add         esp,10
 00434CB0    pop         esi
 00434CB1    pop         ebx
 00434CB2    ret
*}
end;

//00434CB4
procedure NegateAny(var Dest:TVarData);
begin
{*
 00434CB4    push        ebx
 00434CB5    mov         ebx,eax
 00434CB7    mov         eax,ebx
 00434CB9    call        dword ptr ds:[792F90]
 00434CBF    mov         eax,ebx
 00434CC1    call        @VarNeg
 00434CC6    pop         ebx
 00434CC7    ret
*}
end;

//00434CC8
function NotCustom(var Dest:TVarData):Boolean;
begin
{*
 00434CC8    push        ebx
 00434CC9    push        esi
 00434CCA    push        ecx
 00434CCB    mov         esi,eax
 00434CCD    mov         edx,esp
 00434CCF    movzx       eax,word ptr [esi]
 00434CD2    call        FindCustomVariantType
 00434CD7    mov         ebx,eax
 00434CD9    test        bl,bl
>00434CDB    je          00434CEC
 00434CDD    mov         edx,esi
 00434CDF    mov         ecx,0D
 00434CE4    mov         eax,dword ptr [esp]
 00434CE7    mov         esi,dword ptr [eax]
 00434CE9    call        dword ptr [esi+30]
 00434CEC    mov         eax,ebx
 00434CEE    pop         edx
 00434CEF    pop         esi
 00434CF0    pop         ebx
 00434CF1    ret
*}
end;

//00434CF4
procedure @VarNeg(var Dest:TVarData);
begin
{*
 00434CF4    push        ebx
 00434CF5    mov         ebx,eax
 00434CF7    movzx       eax,word ptr [ebx]
 00434CFA    movzx       edx,ax
 00434CFD    cmp         edx,15
>00434D00    ja          00434DF6
 00434D06    jmp         dword ptr [edx*4+434D0D]
 00434D06    dd          00434D65
 00434D06    dd          00434FB6
 00434D06    dd          00434D75
 00434D06    dd          00434D7B
 00434D06    dd          00434D80
 00434D06    dd          00434D80
 00434D06    dd          00434D80
 00434D06    dd          00434D80
 00434D06    dd          00434D89
 00434D06    dd          00434DED
 00434D06    dd          00434DF6
 00434D06    dd          00434D92
 00434D06    dd          00434DE1
 00434D06    dd          00434DED
 00434D06    dd          00434DF6
 00434D06    dd          00434DF6
 00434D06    dd          00434DA8
 00434D06    dd          00434DAD
 00434D06    dd          00434DB2
 00434D06    dd          00434DB8
 00434D06    dd          00434DBD
 00434D06    dd          00434DCF
 00434D65    mov         eax,ebx
 00434D67    mov         edx,0FFFFFFFF
 00434D6C    mov         cl,0FF
 00434D6E    call        @VarFromInt
 00434D73    pop         ebx
 00434D74    ret
 00434D75    not         word ptr [ebx+8]
 00434D79    pop         ebx
 00434D7A    ret
 00434D7B    not         dword ptr [ebx+8]
 00434D7E    pop         ebx
 00434D7F    ret
 00434D80    mov         eax,ebx
 00434D82    call        NotAsOrdinal
 00434D87    pop         ebx
 00434D88    ret
 00434D89    mov         eax,ebx
 00434D8B    call        NotAsString
 00434D90    pop         ebx
 00434D91    ret
 00434D92    movzx       eax,word ptr [ebx+8]
 00434D96    cmp         ax,1
 00434D9A    sbb         eax,eax
 00434D9C    neg         eax
 00434D9E    neg         al
 00434DA0    sbb         eax,eax
 00434DA2    mov         word ptr [ebx+8],ax
 00434DA6    pop         ebx
 00434DA7    ret
 00434DA8    not         byte ptr [ebx+8]
 00434DAB    pop         ebx
 00434DAC    ret
 00434DAD    not         byte ptr [ebx+8]
 00434DB0    pop         ebx
 00434DB1    ret
 00434DB2    not         word ptr [ebx+8]
 00434DB6    pop         ebx
 00434DB7    ret
 00434DB8    not         dword ptr [ebx+8]
 00434DBB    pop         ebx
 00434DBC    ret
 00434DBD    mov         eax,dword ptr [ebx+8]
 00434DC0    mov         edx,dword ptr [ebx+0C]
 00434DC3    not         eax
 00434DC5    not         edx
 00434DC7    mov         dword ptr [ebx+8],eax
 00434DCA    mov         dword ptr [ebx+0C],edx
 00434DCD    pop         ebx
 00434DCE    ret
 00434DCF    mov         eax,dword ptr [ebx+8]
 00434DD2    mov         edx,dword ptr [ebx+0C]
 00434DD5    not         eax
 00434DD7    not         edx
 00434DD9    mov         dword ptr [ebx+8],eax
 00434DDC    mov         dword ptr [ebx+0C],edx
 00434DDF    pop         ebx
 00434DE0    ret
 00434DE1    mov         edx,ebx
 00434DE3    mov         eax,dword ptr [ebx+8]
 00434DE6    call        NegateVariant
 00434DEB    pop         ebx
 00434DEC    ret
 00434DED    mov         eax,ebx
 00434DEF    call        NegateViaOS
 00434DF4    pop         ebx
 00434DF5    ret
 00434DF6    mov         edx,eax
 00434DF8    sub         dx,100
>00434DFD    je          00434E0B
 00434DFF    dec         dx
>00434E02    je          00434E23
 00434E04    dec         dx
>00434E07    je          00434E17
>00434E09    jmp         00434E2F
 00434E0B    mov         eax,ebx
 00434E0D    call        NotAsString
>00434E12    jmp         00434FB6
 00434E17    mov         eax,ebx
 00434E19    call        NotAsString
>00434E1E    jmp         00434FB6
 00434E23    mov         eax,ebx
 00434E25    call        NegateAny
>00434E2A    jmp         00434FB6
 00434E2F    test        ah,40
>00434E32    je          00434FA4
 00434E38    movzx       eax,ax
 00434E3B    and         eax,0FFFFBFFF
 00434E40    cmp         eax,15
>00434E43    ja          00434F9B
 00434E49    jmp         dword ptr [eax*4+434E50]
 00434E49    dd          00434F9B
 00434E49    dd          00434F9B
 00434E49    dd          00434EA8
 00434E49    dd          00434EC2
 00434E49    dd          00434ED7
 00434E49    dd          00434ED7
 00434E49    dd          00434ED7
 00434E49    dd          00434ED7
 00434E49    dd          00434EE3
 00434E49    dd          00434F9B
 00434E49    dd          00434F9B
 00434E49    dd          00434EEF
 00434E49    dd          00434F8F
 00434E49    dd          00434F9B
 00434E49    dd          00434F9B
 00434E49    dd          00434F9B
 00434E49    dd          00434F09
 00434E49    dd          00434F22
 00434E49    dd          00434F38
 00434E49    dd          00434F4F
 00434E49    dd          00434F61
 00434E49    dd          00434F78
 00434EA8    mov         eax,ebx
 00434EAA    mov         edx,dword ptr [ebx+8]
 00434EAD    movzx       edx,word ptr [edx]
 00434EB0    not         dx
 00434EB3    movsx       edx,dx
 00434EB6    mov         cl,0FE
 00434EB8    call        @VarFromInt
>00434EBD    jmp         00434FB6
 00434EC2    mov         eax,ebx
 00434EC4    mov         edx,dword ptr [ebx+8]
 00434EC7    mov         edx,dword ptr [edx]
 00434EC9    not         edx
 00434ECB    mov         cl,0FC
 00434ECD    call        @VarFromInt
>00434ED2    jmp         00434FB6
 00434ED7    mov         eax,ebx
 00434ED9    call        NotAsOrdinal
>00434EDE    jmp         00434FB6
 00434EE3    mov         eax,ebx
 00434EE5    call        NotAsString
>00434EEA    jmp         00434FB6
 00434EEF    mov         eax,ebx
 00434EF1    mov         edx,dword ptr [ebx+8]
 00434EF4    movzx       edx,word ptr [edx]
 00434EF7    cmp         dx,1
 00434EFB    sbb         edx,edx
 00434EFD    neg         edx
 00434EFF    call        @VarFromBool
>00434F04    jmp         00434FB6
 00434F09    mov         eax,ebx
 00434F0B    mov         edx,dword ptr [ebx+8]
 00434F0E    movzx       edx,byte ptr [edx]
 00434F11    not         dl
 00434F13    movsx       edx,dl
 00434F16    mov         cl,0FF
 00434F18    call        @VarFromInt
>00434F1D    jmp         00434FB6
 00434F22    mov         eax,ebx
 00434F24    mov         edx,dword ptr [ebx+8]
 00434F27    movzx       edx,byte ptr [edx]
 00434F2A    not         dl
 00434F2C    movzx       edx,dl
 00434F2F    mov         cl,1
 00434F31    call        @VarFromInt
>00434F36    jmp         00434FB6
 00434F38    mov         eax,ebx
 00434F3A    mov         edx,dword ptr [ebx+8]
 00434F3D    movzx       edx,word ptr [edx]
 00434F40    not         dx
 00434F43    movzx       edx,dx
 00434F46    mov         cl,2
 00434F48    call        @VarFromInt
>00434F4D    jmp         00434FB6
 00434F4F    mov         eax,ebx
 00434F51    mov         edx,dword ptr [ebx+8]
 00434F54    mov         edx,dword ptr [edx]
 00434F56    not         edx
 00434F58    mov         cl,4
 00434F5A    call        @VarFromInt
>00434F5F    jmp         00434FB6
 00434F61    mov         eax,dword ptr [ebx+8]
 00434F64    mov         edx,dword ptr [eax+4]
 00434F67    mov         eax,dword ptr [eax]
 00434F69    not         eax
 00434F6B    not         edx
 00434F6D    push        edx
 00434F6E    push        eax
 00434F6F    mov         eax,ebx
 00434F71    call        @VarFromInt64
>00434F76    jmp         00434FB6
 00434F78    mov         eax,dword ptr [ebx+8]
 00434F7B    mov         edx,dword ptr [eax+4]
 00434F7E    mov         eax,dword ptr [eax]
 00434F80    not         eax
 00434F82    not         edx
 00434F84    push        edx
 00434F85    push        eax
 00434F86    mov         eax,ebx
 00434F88    call        @VarFromUInt64
>00434F8D    jmp         00434FB6
 00434F8F    mov         edx,ebx
 00434F91    mov         eax,dword ptr [ebx+8]
 00434F94    call        NegateVariant
>00434F99    jmp         00434FB6
 00434F9B    mov         eax,ebx
 00434F9D    call        NegateViaOS
>00434FA2    jmp         00434FB6
 00434FA4    mov         eax,ebx
 00434FA6    call        NotCustom
 00434FAB    test        al,al
>00434FAD    jne         00434FB6
 00434FAF    mov         eax,ebx
 00434FB1    call        NegateViaOS
 00434FB6    pop         ebx
 00434FB7    ret
*}
end;

//00434FB8
procedure @VarAddRef(var V:TVarData);
begin
{*
 00434FB8    cmp         word ptr [eax],8
>00434FBC    jb          00434FD8
 00434FBE    push        dword ptr [eax+0C]
 00434FC1    push        dword ptr [eax+8]
 00434FC4    push        dword ptr [eax+4]
 00434FC7    push        dword ptr [eax]
 00434FC9    mov         word ptr [eax],0
 00434FCE    mov         edx,esp
 00434FD0    call        @VarCopy
 00434FD5    add         esp,10
 00434FD8    ret
*}
end;

//00435234
function VarTypeAsText(const AType:TVarType):UnicodeString;
begin
{*
 00435234    push        ebp
 00435235    mov         ebp,esp
 00435237    push        0
 00435239    push        0
 0043523B    push        0
 0043523D    push        ebx
 0043523E    push        esi
 0043523F    push        edi
 00435240    mov         esi,edx
 00435242    mov         ebx,eax
 00435244    xor         eax,eax
 00435246    push        ebp
 00435247    push        435347
 0043524C    push        dword ptr fs:[eax]
 0043524F    mov         dword ptr fs:[eax],esp
 00435252    mov         edi,ebx
 00435254    and         di,0FFF
 00435259    cmp         di,15
>0043525D    ja          00435275
 0043525F    mov         eax,esi
 00435261    movzx       edx,di
 00435264    mov         edx,dword ptr [edx*4+784FD0];^'Empty'
 0043526B    call        @UStrAsg
>00435270    jmp         00435306
 00435275    cmp         bx,100
>0043527A    jne         0043528A
 0043527C    mov         eax,esi
 0043527E    mov         edx,435364;'String'
 00435283    call        @UStrAsg
>00435288    jmp         00435306
 0043528A    cmp         bx,102
>0043528F    jne         0043529F
 00435291    mov         eax,esi
 00435293    mov         edx,435380;'UnicodeString'
 00435298    call        @UStrAsg
>0043529D    jmp         00435306
 0043529F    cmp         bx,101
>004352A4    jne         004352B4
 004352A6    mov         eax,esi
 004352A8    mov         edx,4353A8;'Any'
 004352AD    call        @UStrAsg
>004352B2    jmp         00435306
 004352B4    lea         edx,[ebp-4]
 004352B7    mov         eax,ebx
 004352B9    call        FindCustomVariantType
 004352BE    test        al,al
>004352C0    je          004352E4
 004352C2    push        esi
 004352C3    lea         edx,[ebp-8]
 004352C6    mov         eax,dword ptr [ebp-4]
 004352C9    mov         eax,dword ptr [eax]
 004352CB    call        TObject.ClassName
 004352D0    mov         eax,dword ptr [ebp-8]
 004352D3    mov         ecx,7FFFFFFF
 004352D8    mov         edx,2
 004352DD    call        @UStrCopy
>004352E2    jmp         00435306
 004352E4    lea         ecx,[ebp-0C]
 004352E7    movzx       eax,di
 004352EA    mov         edx,4
 004352EF    call        IntToHex
 004352F4    mov         ecx,dword ptr [ebp-0C]
 004352F7    mov         edx,dword ptr ds:[78D9C8]
 004352FD    mov         edx,dword ptr [edx]
 004352FF    mov         eax,esi
 00435301    call        @UStrCat3
 00435306    test        bh,20
>00435309    je          00435319
 0043530B    mov         ecx,dword ptr [esi]
 0043530D    mov         eax,esi
 0043530F    mov         edx,4353BC;'Array '
 00435314    call        @UStrCat3
 00435319    test        bh,40
>0043531C    je          0043532C
 0043531E    mov         ecx,dword ptr [esi]
 00435320    mov         eax,esi
 00435322    mov         edx,4353D8;'ByRef '
 00435327    call        @UStrCat3
 0043532C    xor         eax,eax
 0043532E    pop         edx
 0043532F    pop         ecx
 00435330    pop         ecx
 00435331    mov         dword ptr fs:[eax],edx
 00435334    push        43534E
 00435339    lea         eax,[ebp-0C]
 0043533C    mov         edx,2
 00435341    call        @UStrArrayClr
 00435346    ret
>00435347    jmp         @HandleFinally
>0043534C    jmp         00435339
 0043534E    pop         edi
 0043534F    pop         esi
 00435350    pop         ebx
 00435351    mov         esp,ebp
 00435353    pop         ebp
 00435354    ret
*}
end;

//004353E8
{*function sub_004353E8(?:TVarData):?;
begin
 004353E8    movzx       eax,word ptr [eax]
 004353EB    ret
end;*}

//004353EC
function FindVarData(const V:Variant):PVarData;
begin
{*
>004353EC    jmp         004353F1
 004353EE    mov         eax,dword ptr [eax+8]
 004353F1    cmp         word ptr [eax],400C
>004353F6    je          004353EE
 004353F8    ret
*}
end;

//004353FC
function VarIsClear(const V:Variant):Boolean;
begin
{*
 004353FC    push        ebx
 004353FD    push        esi
 004353FE    push        edi
 004353FF    add         esp,0FFFFFFEC
 00435402    mov         ebx,eax
 00435404    mov         eax,ebx
 00435406    call        FindVarData
 0043540B    mov         esi,eax
 0043540D    lea         edi,[esp+4]
 00435411    movs        dword ptr [edi],dword ptr [esi]
 00435412    movs        dword ptr [edi],dword ptr [esi]
 00435413    movs        dword ptr [edi],dword ptr [esi]
 00435414    movs        dword ptr [edi],dword ptr [esi]
 00435415    movzx       ebx,word ptr [esp+4]
 0043541A    cmp         bx,10F
>0043541F    jae         00435449
 00435421    cmp         word ptr [esp+4],0
>00435427    je          00435445
 00435429    movzx       eax,word ptr [esp+4]
 0043542E    cmp         ax,9
>00435432    je          0043543A
 00435434    cmp         ax,0D
>00435438    jne         00435441
 0043543A    cmp         dword ptr [esp+0C],0
>0043543F    je          00435445
 00435441    xor         eax,eax
>00435443    jmp         00435466
 00435445    mov         al,1
>00435447    jmp         00435466
 00435449    mov         edx,esp
 0043544B    mov         eax,ebx
 0043544D    call        FindCustomVariantType
 00435452    test        al,al
>00435454    je          00435464
 00435456    lea         edx,[esp+4]
 0043545A    mov         eax,dword ptr [esp]
 0043545D    mov         ecx,dword ptr [eax]
 0043545F    call        dword ptr [ecx+14]
>00435462    jmp         00435466
 00435464    xor         eax,eax
 00435466    add         esp,14
 00435469    pop         edi
 0043546A    pop         esi
 0043546B    pop         ebx
 0043546C    ret
*}
end;

//00435470
function VarTypeIsOrdinal(const AVarType:TVarType):Boolean;
begin
{*
 00435470    add         eax,0FFFFFFFE
 00435473    sub         ax,2
>00435477    jb          0043548B
 00435479    sub         ax,7
>0043547D    je          0043548B
 0043547F    add         eax,0FFFFFFFB
 00435482    sub         ax,6
>00435486    jb          0043548B
 00435488    xor         eax,eax
 0043548A    ret
 0043548B    mov         al,1
 0043548D    ret
*}
end;

//00435490
function VarIsOrdinal(const V:Variant):Boolean;
begin
{*
 00435490    push        ebx
 00435491    mov         ebx,eax
 00435493    mov         eax,ebx
 00435495    call        FindVarData
 0043549A    movzx       eax,word ptr [eax]
 0043549D    call        VarTypeIsOrdinal
 004354A2    pop         ebx
 004354A3    ret
*}
end;

//004354A4
function VarIsEmpty(const V:Variant):Boolean;
begin
{*
 004354A4    push        ebx
 004354A5    mov         ebx,eax
 004354A7    mov         eax,ebx
 004354A9    call        FindVarData
 004354AE    cmp         word ptr [eax],0
 004354B2    sete        al
 004354B5    pop         ebx
 004354B6    ret
*}
end;

//004354B8
function VarIsNull(const V:Variant):Boolean;
begin
{*
 004354B8    push        ebx
 004354B9    mov         ebx,eax
 004354BB    mov         eax,ebx
 004354BD    call        FindVarData
 004354C2    cmp         word ptr [eax],1
 004354C6    sete        al
 004354C9    pop         ebx
 004354CA    ret
*}
end;

//004354CC
function VarToStr(const V:Variant):UnicodeString;
begin
{*
 004354CC    push        ebx
 004354CD    push        esi
 004354CE    mov         esi,edx
 004354D0    mov         ebx,eax
 004354D2    mov         ecx,esi
 004354D4    mov         eax,ebx
 004354D6    mov         edx,dword ptr ds:[784E6C]
 004354DC    call        VarToStrDef
 004354E1    pop         esi
 004354E2    pop         ebx
 004354E3    ret
*}
end;

//004354E4
function VarToStrDef(const V:Variant; const ADefault:UnicodeString):UnicodeString;
begin
{*
 004354E4    push        ebx
 004354E5    push        esi
 004354E6    push        edi
 004354E7    mov         esi,ecx
 004354E9    mov         edi,edx
 004354EB    mov         ebx,eax
 004354ED    mov         eax,ebx
 004354EF    call        VarIsNull
 004354F4    test        al,al
>004354F6    jne         00435503
 004354F8    mov         eax,esi
 004354FA    mov         edx,ebx
 004354FC    call        @VarToUStr
>00435501    jmp         0043550C
 00435503    mov         eax,esi
 00435505    mov         edx,edi
 00435507    call        @UStrAsg
 0043550C    pop         edi
 0043550D    pop         esi
 0043550E    pop         ebx
 0043550F    ret
*}
end;

//00435510
function VarToWideStr(const V:Variant):WideString;
begin
{*
 00435510    push        ebp
 00435511    mov         ebp,esp
 00435513    push        0
 00435515    push        ebx
 00435516    push        esi
 00435517    mov         esi,edx
 00435519    mov         ebx,eax
 0043551B    xor         eax,eax
 0043551D    push        ebp
 0043551E    push        435559
 00435523    push        dword ptr fs:[eax]
 00435526    mov         dword ptr fs:[eax],esp
 00435529    lea         eax,[ebp-4]
 0043552C    mov         edx,dword ptr ds:[784E6C]
 00435532    call        @WStrFromUStr
 00435537    mov         edx,dword ptr [ebp-4]
 0043553A    mov         ecx,esi
 0043553C    mov         eax,ebx
 0043553E    call        VarToWideStrDef
 00435543    xor         eax,eax
 00435545    pop         edx
 00435546    pop         ecx
 00435547    pop         ecx
 00435548    mov         dword ptr fs:[eax],edx
 0043554B    push        435560
 00435550    lea         eax,[ebp-4]
 00435553    call        @WStrClr
 00435558    ret
>00435559    jmp         @HandleFinally
>0043555E    jmp         00435550
 00435560    pop         esi
 00435561    pop         ebx
 00435562    pop         ecx
 00435563    pop         ebp
 00435564    ret
*}
end;

//00435568
function VarToWideStrDef(const V:Variant; const ADefault:WideString):WideString;
begin
{*
 00435568    push        ebx
 00435569    push        esi
 0043556A    push        edi
 0043556B    mov         esi,ecx
 0043556D    mov         edi,edx
 0043556F    mov         ebx,eax
 00435571    mov         eax,ebx
 00435573    call        VarIsNull
 00435578    test        al,al
>0043557A    jne         00435587
 0043557C    mov         eax,esi
 0043557E    mov         edx,ebx
 00435580    call        @VarToWStr
>00435585    jmp         00435590
 00435587    mov         eax,esi
 00435589    mov         edx,edi
 0043558B    call        @WStrAsg
 00435590    pop         edi
 00435591    pop         esi
 00435592    pop         ebx
 00435593    ret
*}
end;

//00435594
function VarSameValue(const A:Variant; const B:Variant):Boolean;
begin
{*
 00435594    push        ebx
 00435595    push        esi
 00435596    push        edi
 00435597    add         esp,0FFFFFFE0
 0043559A    mov         esi,edx
 0043559C    mov         ebx,eax
 0043559E    mov         eax,ebx
 004355A0    call        FindVarData
 004355A5    push        esi
 004355A6    mov         esi,eax
 004355A8    lea         edi,[esp+4]
 004355AC    movs        dword ptr [edi],dword ptr [esi]
 004355AD    movs        dword ptr [edi],dword ptr [esi]
 004355AE    movs        dword ptr [edi],dword ptr [esi]
 004355AF    movs        dword ptr [edi],dword ptr [esi]
 004355B0    pop         esi
 004355B1    mov         eax,esi
 004355B3    call        FindVarData
 004355B8    push        esi
 004355B9    mov         esi,eax
 004355BB    lea         edi,[esp+14]
 004355BF    movs        dword ptr [edi],dword ptr [esi]
 004355C0    movs        dword ptr [edi],dword ptr [esi]
 004355C1    movs        dword ptr [edi],dword ptr [esi]
 004355C2    movs        dword ptr [edi],dword ptr [esi]
 004355C3    pop         esi
 004355C4    movzx       eax,word ptr [esp]
 004355C8    test        ax,ax
>004355CB    jne         004355D8
 004355CD    cmp         word ptr [esp+10],0
 004355D3    sete        al
>004355D6    jmp         00435604
 004355D8    cmp         ax,1
>004355DC    jne         004355E9
 004355DE    cmp         word ptr [esp+10],1
 004355E4    sete        al
>004355E7    jmp         00435604
 004355E9    movzx       eax,word ptr [esp+10]
 004355EE    sub         ax,2
>004355F2    jae         004355F8
 004355F4    xor         eax,eax
>004355F6    jmp         00435604
 004355F8    mov         eax,ebx
 004355FA    mov         edx,esi
 004355FC    call        @VarCmpEQ
 00435601    sete        al
 00435604    add         esp,20
 00435607    pop         edi
 00435608    pop         esi
 00435609    pop         ebx
 0043560A    ret
*}
end;

//0043560C
procedure SetVarAsError(var V:TVarData; AResult:HRESULT);
begin
{*
 0043560C    push        ebx
 0043560D    push        esi
 0043560E    mov         esi,edx
 00435610    mov         ebx,eax
 00435612    mov         eax,ebx
 00435614    call        @VarClear
 00435619    mov         word ptr [ebx],0A
 0043561E    mov         dword ptr [ebx+8],esi
 00435621    pop         esi
 00435622    pop         ebx
 00435623    ret
*}
end;

//00435624
procedure SetClearVarToEmptyParam(var V:TVarData);
begin
{*
 00435624    mov         edx,80020004
 00435629    call        SetVarAsError
 0043562E    ret
*}
end;

//00435630
function GetVarDataArrayInfo(const AVarData:TVarData; var AVarType:TVarType; var AVarArray:PVarArray):Boolean;
begin
{*
 00435630    push        ebx
 00435631    movzx       ebx,word ptr [eax]
 00435634    cmp         bx,400C
>00435639    jne         00435647
 0043563B    mov         eax,dword ptr [eax+8]
 0043563E    call        GetVarDataArrayInfo
 00435643    mov         ebx,eax
>00435645    jmp         0043566F
 00435647    mov         word ptr [edx],bx
 0043564A    test        byte ptr [edx+1],20
 0043564E    setne       bl
 00435651    test        bl,bl
>00435653    je          0043566B
 00435655    test        byte ptr [edx+1],40
>00435659    je          00435664
 0043565B    mov         eax,dword ptr [eax+8]
 0043565E    mov         eax,dword ptr [eax]
 00435660    mov         dword ptr [ecx],eax
>00435662    jmp         0043566F
 00435664    mov         eax,dword ptr [eax+8]
 00435667    mov         dword ptr [ecx],eax
>00435669    jmp         0043566F
 0043566B    xor         eax,eax
 0043566D    mov         dword ptr [ecx],eax
 0043566F    mov         eax,ebx
 00435671    pop         ebx
 00435672    ret
*}
end;

//00435674
function VarIsArray(const A:Variant):Boolean;
begin
{*
 00435674    mov         dl,1
 00435676    call        VarIsArray
 0043567B    ret
*}
end;

//0043567C
function VarIsArray(const A:Variant; AResolveByRef:Boolean):Boolean;
begin
{*
 0043567C    add         esp,0FFFFFFF8
 0043567F    test        dl,dl
>00435681    je          00435691
 00435683    lea         ecx,[esp+4]
 00435687    mov         edx,esp
 00435689    call        GetVarDataArrayInfo
 0043568E    pop         ecx
 0043568F    pop         edx
 00435690    ret
 00435691    movzx       eax,word ptr [eax]
 00435694    and         ax,2000
 00435698    cmp         ax,2000
 0043569C    sete        al
 0043569F    pop         ecx
 004356A0    pop         edx
 004356A1    ret
*}
end;

//004356CC
procedure ClearVariantTypeList;
begin
{*
 004356CC    push        ebp
 004356CD    mov         ebp,esp
 004356CF    push        ebx
 004356D0    push        esi
 004356D1    mov         esi,792F9C
 004356D6    push        792FA0
 004356DB    call        kernel32.EnterCriticalSection
 004356E0    xor         edx,edx
 004356E2    push        ebp
 004356E3    push        43572D
 004356E8    push        dword ptr fs:[edx]
 004356EB    mov         dword ptr fs:[edx],esp
 004356EE    mov         eax,dword ptr [esi]
 004356F0    call        @DynArrayLength
 004356F5    mov         ebx,eax
 004356F7    dec         ebx
 004356F8    cmp         ebx,0
>004356FB    jl          00435715
 004356FD    mov         eax,dword ptr [esi]
 004356FF    mov         eax,dword ptr [eax+ebx*4]
 00435702    cmp         eax,dword ptr ds:[784E8C]
>00435708    je          0043570F
 0043570A    call        TObject.Free
 0043570F    dec         ebx
 00435710    cmp         ebx,0FFFFFFFF
>00435713    jne         004356FD
 00435715    xor         eax,eax
 00435717    pop         edx
 00435718    pop         ecx
 00435719    pop         ecx
 0043571A    mov         dword ptr fs:[eax],edx
 0043571D    push        435734
 00435722    push        792FA0
 00435727    call        kernel32.LeaveCriticalSection
 0043572C    ret
>0043572D    jmp         @HandleFinally
>00435732    jmp         00435722
 00435734    pop         esi
 00435735    pop         ebx
 00435736    pop         ebp
 00435737    ret
*}
end;

//00435738
procedure TCustomVariantType.BinaryOp(var Left:TVarData; Right:TVarData; Operator:Integer);
begin
{*
 00435738    push        ebp
 00435739    mov         ebp,esp
 0043573B    call        TCustomVariantType.RaiseInvalidOp
 00435740    pop         ebp
 00435741    ret         4
*}
end;

//00435744
procedure TCustomVariantType.Cast(var Dest:TVarData; Source:TVarData);
begin
{*
 00435744    push        ebx
 00435745    push        esi
 00435746    push        edi
 00435747    push        ecx
 00435748    mov         esi,ecx
 0043574A    mov         edi,edx
 0043574C    mov         ebx,eax
 0043574E    mov         edx,esp
 00435750    movzx       eax,word ptr [esi]
 00435753    call        FindCustomVariantType
 00435758    test        al,al
>0043575A    je          00435770
 0043575C    movzx       eax,word ptr [ebx+4]
 00435760    push        eax
 00435761    mov         ecx,esi
 00435763    mov         edx,edi
 00435765    mov         eax,dword ptr [esp+4]
 00435769    mov         ebx,dword ptr [eax]
 0043576B    call        dword ptr [ebx+1C]
>0043576E    jmp         00435777
 00435770    mov         eax,ebx
 00435772    call        TCustomVariantType.RaiseCastError
 00435777    pop         edx
 00435778    pop         edi
 00435779    pop         esi
 0043577A    pop         ebx
 0043577B    ret
*}
end;

//0043577C
procedure TCustomVariantType.CastTo(var Dest:TVarData; Source:TVarData; AVarType:Word);
begin
{*
 0043577C    push        ebp
 0043577D    mov         ebp,esp
 0043577F    add         esp,0FFFFFFF8
 00435782    push        ebx
 00435783    push        esi
 00435784    push        edi
 00435785    mov         esi,ecx
 00435787    mov         dword ptr [ebp-4],edx
 0043578A    mov         ebx,eax
 0043578C    mov         edi,dword ptr [ebp+8]
 0043578F    cmp         di,word ptr [ebx+4]
>00435793    je          004357B4
 00435795    lea         edx,[ebp-8]
 00435798    movzx       eax,word ptr [esi]
 0043579B    call        FindCustomVariantType
 004357A0    test        al,al
>004357A2    je          004357B4
 004357A4    push        edi
 004357A5    mov         ecx,esi
 004357A7    mov         edx,dword ptr [ebp-4]
 004357AA    mov         eax,dword ptr [ebp-8]
 004357AD    mov         ebx,dword ptr [eax]
 004357AF    call        dword ptr [ebx+1C]
>004357B2    jmp         004357BB
 004357B4    mov         eax,ebx
 004357B6    call        TCustomVariantType.RaiseCastError
 004357BB    pop         edi
 004357BC    pop         esi
 004357BD    pop         ebx
 004357BE    pop         ecx
 004357BF    pop         ecx
 004357C0    pop         ebp
 004357C1    ret         4
*}
end;

//004357C4
procedure TCustomVariantType.Compare(Left:TVarData; Right:TVarData; var Relationship:TVarCompareResult);
begin
{*
 004357C4    push        ebp
 004357C5    mov         ebp,esp
 004357C7    call        TCustomVariantType.RaiseInvalidOp
 004357CC    pop         ebp
 004357CD    ret         4
*}
end;

//004357D0
function TCustomVariantType.CompareOp(Left:TVarData; Right:TVarData; Operator:Integer):Boolean;
begin
{*
 004357D0    push        ebp
 004357D1    mov         ebp,esp
 004357D3    push        ecx
 004357D4    push        ebx
 004357D5    push        esi
 004357D6    push        edi
 004357D7    mov         edi,edx
 004357D9    mov         esi,eax
 004357DB    lea         eax,[ebp-1]
 004357DE    push        eax
 004357DF    mov         edx,edi
 004357E1    mov         eax,esi
 004357E3    mov         ebx,dword ptr [eax]
 004357E5    call        dword ptr [ebx+38]
 004357E8    movzx       eax,byte ptr [ebp-1]
 004357EC    mov         edx,dword ptr [ebp+8]
 004357EF    lea         edx,[edx+edx*2]
 004357F2    add         edx,78502C
 004357F8    movzx       eax,byte ptr [edx+eax-2A]
 004357FD    pop         edi
 004357FE    pop         esi
 004357FF    pop         ebx
 00435800    pop         ecx
 00435801    pop         ebp
 00435802    ret         4
*}
end;

//00435808
procedure TCustomVariantType.CastToOle(var Dest:TVarData; Source:TVarData);
begin
{*
 00435808    push        ebx
 00435809    push        esi
 0043580A    push        edi
 0043580B    push        ebp
 0043580C    push        ecx
 0043580D    mov         esi,ecx
 0043580F    mov         edi,edx
 00435811    mov         ebx,eax
 00435813    mov         ecx,esp
 00435815    mov         edx,esi
 00435817    mov         eax,ebx
 00435819    mov         ebp,dword ptr [eax]
 0043581B    call        dword ptr [ebp+0C]
 0043581E    test        al,al
>00435820    je          00435834
 00435822    movzx       eax,word ptr [esp]
 00435826    push        eax
 00435827    mov         ecx,esi
 00435829    mov         edx,edi
 0043582B    mov         eax,ebx
 0043582D    mov         ebx,dword ptr [eax]
 0043582F    call        dword ptr [ebx+1C]
>00435832    jmp         0043583B
 00435834    mov         eax,ebx
 00435836    call        TCustomVariantType.RaiseCastError
 0043583B    pop         edx
 0043583C    pop         ebp
 0043583D    pop         edi
 0043583E    pop         esi
 0043583F    pop         ebx
 00435840    ret
*}
end;

//00435844
constructor TCustomVariantType.Create();
begin
{*
 00435844    push        ebx
 00435845    push        esi
 00435846    test        dl,dl
>00435848    je          00435852
 0043584A    add         esp,0FFFFFFF0
 0043584D    call        @ClassCreate
 00435852    mov         ebx,edx
 00435854    mov         esi,eax
 00435856    movzx       ecx,word ptr ds:[785028]
 0043585D    xor         edx,edx
 0043585F    mov         eax,esi
 00435861    call        TCustomVariantType.Create
 00435866    inc         dword ptr ds:[785028]
 0043586C    mov         eax,esi
 0043586E    test        bl,bl
>00435870    je          00435881
 00435872    call        @AfterConstruction
 00435877    pop         dword ptr fs:[0]
 0043587E    add         esp,0C
 00435881    mov         eax,esi
 00435883    pop         esi
 00435884    pop         ebx
 00435885    ret
*}
end;

//00435888
constructor TCustomVariantType.Create;
begin
{*
 00435888    push        ebp
 00435889    mov         ebp,esp
 0043588B    add         esp,0FFFFFFBC
 0043588E    push        ebx
 0043588F    push        esi
 00435890    push        edi
 00435891    xor         ebx,ebx
 00435893    mov         dword ptr [ebp-40],ebx
 00435896    mov         dword ptr [ebp-44],ebx
 00435899    mov         dword ptr [ebp-24],ebx
 0043589C    mov         dword ptr [ebp-20],ebx
 0043589F    mov         dword ptr [ebp-1C],ebx
 004358A2    test        dl,dl
>004358A4    je          004358AE
 004358A6    add         esp,0FFFFFFF0
 004358A9    call        @ClassCreate
 004358AE    mov         word ptr [ebp-8],cx
 004358B2    mov         byte ptr [ebp-5],dl
 004358B5    mov         dword ptr [ebp-4],eax
 004358B8    xor         eax,eax
 004358BA    push        ebp
 004358BB    push        435AD8
 004358C0    push        dword ptr fs:[eax]
 004358C3    mov         dword ptr fs:[eax],esp
 004358C6    xor         edx,edx
 004358C8    mov         eax,dword ptr [ebp-4]
 004358CB    call        TObject.Create
 004358D0    push        792FA0
 004358D5    call        kernel32.EnterCriticalSection
 004358DA    xor         ecx,ecx
 004358DC    push        ebp
 004358DD    push        435AA9
 004358E2    push        dword ptr fs:[ecx]
 004358E5    mov         dword ptr fs:[ecx],esp
 004358E8    movzx       ebx,word ptr [ebp-8]
 004358EC    sub         ebx,100
 004358F2    test        ebx,ebx
>004358F4    jl          004358FE
 004358F6    cmp         word ptr [ebp-8],10F
>004358FC    jae         0043593E
 004358FE    mov         eax,[0078D9C8]
 00435903    mov         eax,dword ptr [eax]
 00435905    mov         dword ptr [ebp-18],eax
 00435908    mov         byte ptr [ebp-14],11
 0043590C    movzx       eax,word ptr [ebp-8]
 00435910    mov         dword ptr [ebp-10],eax
 00435913    mov         byte ptr [ebp-0C],0
 00435917    lea         eax,[ebp-18]
 0043591A    push        eax
 0043591B    push        1
 0043591D    lea         edx,[ebp-1C]
 00435920    mov         eax,[0078D10C];^SResString40:TResStringRec
 00435925    call        LoadResString
 0043592A    mov         ecx,dword ptr [ebp-1C]
 0043592D    mov         dl,1
 0043592F    mov         eax,[0041A3C8];EVariantError
 00435934    call        Exception.CreateFmt
 00435939    call        @RaiseExcept
 0043593E    mov         eax,[00792F9C]
 00435943    call        @DynArrayLength
 00435948    mov         esi,eax
 0043594A    cmp         esi,ebx
>0043594C    jg          004359C5
 0043594E    mov         eax,ebx
 00435950    mov         ecx,0F
 00435955    cdq
 00435956    idiv        eax,ecx
 00435958    inc         eax
 00435959    mov         edi,eax
 0043595B    shl         edi,4
 0043595E    sub         edi,eax
 00435960    cmp         edi,7FF
>00435966    jle         00435989
 00435968    lea         edx,[ebp-20]
 0043596B    mov         eax,[0078CF44];^SResString43:TResStringRec
 00435970    call        LoadResString
 00435975    mov         ecx,dword ptr [ebp-20]
 00435978    mov         dl,1
 0043597A    mov         eax,[0041A3C8];EVariantError
 0043597F    call        Exception.Create
 00435984    call        @RaiseExcept
 00435989    push        edi
 0043598A    mov         eax,792F9C
 0043598F    mov         ecx,1
 00435994    mov         edx,dword ptr ds:[4356A4];:02
 0043599A    call        @DynArraySetLength
 0043599F    add         esp,4
 004359A2    mov         edx,esi
 004359A4    push        edx
 004359A5    mov         eax,[00792F9C]
 004359AA    call        @DynArrayLength
 004359AF    dec         eax
 004359B0    pop         edx
 004359B1    sub         eax,edx
>004359B3    jl          004359C5
 004359B5    inc         eax
 004359B6    mov         ecx,dword ptr ds:[792F9C]
 004359BC    xor         esi,esi
 004359BE    mov         dword ptr [ecx+edx*4],esi
 004359C1    inc         edx
 004359C2    dec         eax
>004359C3    jne         004359B6
 004359C5    mov         eax,[00792F9C]
 004359CA    mov         eax,dword ptr [eax+ebx*4]
 004359CD    test        eax,eax
>004359CF    je          00435A7B
 004359D5    cmp         eax,dword ptr ds:[784E8C]
>004359DB    jne         00435A1F
 004359DD    mov         eax,[0078D9C8]
 004359E2    mov         eax,dword ptr [eax]
 004359E4    mov         dword ptr [ebp-18],eax
 004359E7    mov         byte ptr [ebp-14],11
 004359EB    movzx       eax,word ptr [ebp-8]
 004359EF    mov         dword ptr [ebp-10],eax
 004359F2    mov         byte ptr [ebp-0C],0
 004359F6    lea         eax,[ebp-18]
 004359F9    push        eax
 004359FA    push        1
 004359FC    lea         edx,[ebp-24]
 004359FF    mov         eax,[0078D2C4];^SResString42:TResStringRec
 00435A04    call        LoadResString
 00435A09    mov         ecx,dword ptr [ebp-24]
 00435A0C    mov         dl,1
 00435A0E    mov         eax,[0041A3C8];EVariantError
 00435A13    call        Exception.CreateFmt
 00435A18    call        @RaiseExcept
>00435A1D    jmp         00435A7B
 00435A1F    mov         eax,[0078D9C8]
 00435A24    mov         eax,dword ptr [eax]
 00435A26    mov         dword ptr [ebp-3C],eax
 00435A29    mov         byte ptr [ebp-38],11
 00435A2D    movzx       eax,word ptr [ebp-8]
 00435A31    mov         dword ptr [ebp-34],eax
 00435A34    mov         byte ptr [ebp-30],0
 00435A38    mov         eax,[00792F9C]
 00435A3D    mov         eax,dword ptr [eax+ebx*4]
 00435A40    mov         eax,dword ptr [eax]
 00435A42    lea         edx,[ebp-40]
 00435A45    call        TObject.ClassName
 00435A4A    mov         eax,dword ptr [ebp-40]
 00435A4D    mov         dword ptr [ebp-2C],eax
 00435A50    mov         byte ptr [ebp-28],11
 00435A54    lea         eax,[ebp-3C]
 00435A57    push        eax
 00435A58    push        2
 00435A5A    lea         edx,[ebp-44]
 00435A5D    mov         eax,[0078CCF4];^SResString41:TResStringRec
 00435A62    call        LoadResString
 00435A67    mov         ecx,dword ptr [ebp-44]
 00435A6A    mov         dl,1
 00435A6C    mov         eax,[0041A3C8];EVariantError
 00435A71    call        Exception.CreateFmt
 00435A76    call        @RaiseExcept
 00435A7B    mov         eax,[00792F9C]
 00435A80    mov         edx,dword ptr [ebp-4]
 00435A83    mov         dword ptr [eax+ebx*4],edx
 00435A86    mov         eax,dword ptr [ebp-4]
 00435A89    movzx       edx,word ptr [ebp-8]
 00435A8D    mov         word ptr [eax+4],dx
 00435A91    xor         eax,eax
 00435A93    pop         edx
 00435A94    pop         ecx
 00435A95    pop         ecx
 00435A96    mov         dword ptr fs:[eax],edx
 00435A99    push        435AB0
 00435A9E    push        792FA0
 00435AA3    call        kernel32.LeaveCriticalSection
 00435AA8    ret
>00435AA9    jmp         @HandleFinally
>00435AAE    jmp         00435A9E
 00435AB0    xor         eax,eax
 00435AB2    pop         edx
 00435AB3    pop         ecx
 00435AB4    pop         ecx
 00435AB5    mov         dword ptr fs:[eax],edx
 00435AB8    push        435ADF
 00435ABD    lea         eax,[ebp-44]
 00435AC0    mov         edx,2
 00435AC5    call        @UStrArrayClr
 00435ACA    lea         eax,[ebp-24]
 00435ACD    mov         edx,3
 00435AD2    call        @UStrArrayClr
 00435AD7    ret
>00435AD8    jmp         @HandleFinally
>00435ADD    jmp         00435ABD
 00435ADF    mov         eax,dword ptr [ebp-4]
 00435AE2    cmp         byte ptr [ebp-5],0
>00435AE6    je          00435AF7
 00435AE8    call        @AfterConstruction
 00435AED    pop         dword ptr fs:[0]
 00435AF4    add         esp,0C
 00435AF7    mov         eax,dword ptr [ebp-4]
 00435AFA    pop         edi
 00435AFB    pop         esi
 00435AFC    pop         ebx
 00435AFD    mov         esp,ebp
 00435AFF    pop         ebp
 00435B00    ret
*}
end;

//00435B04
destructor TCustomVariantType.Destroy();
begin
{*
 00435B04    push        ebp
 00435B05    mov         ebp,esp
 00435B07    add         esp,0FFFFFFF8
 00435B0A    call        @BeforeDestruction
 00435B0F    mov         byte ptr [ebp-5],dl
 00435B12    mov         dword ptr [ebp-4],eax
 00435B15    push        792FA0
 00435B1A    call        kernel32.EnterCriticalSection
 00435B1F    xor         edx,edx
 00435B21    push        ebp
 00435B22    push        435B67
 00435B27    push        dword ptr fs:[edx]
 00435B2A    mov         dword ptr fs:[edx],esp
 00435B2D    mov         eax,dword ptr [ebp-4]
 00435B30    movzx       eax,word ptr [eax+4]
 00435B34    test        ax,ax
>00435B37    je          00435B4F
 00435B39    movzx       eax,ax
 00435B3C    mov         edx,dword ptr ds:[792F9C]
 00435B42    mov         ecx,dword ptr ds:[784E8C]
 00435B48    mov         dword ptr [edx+eax*4-400],ecx
 00435B4F    xor         eax,eax
 00435B51    pop         edx
 00435B52    pop         ecx
 00435B53    pop         ecx
 00435B54    mov         dword ptr fs:[eax],edx
 00435B57    push        435B6E
 00435B5C    push        792FA0
 00435B61    call        kernel32.LeaveCriticalSection
 00435B66    ret
>00435B67    jmp         @HandleFinally
>00435B6C    jmp         00435B5C
 00435B6E    movzx       edx,byte ptr [ebp-5]
 00435B72    and         dl,0FC
 00435B75    mov         eax,dword ptr [ebp-4]
 00435B78    call        TObject.Destroy
 00435B7D    cmp         byte ptr [ebp-5],0
>00435B81    jle         00435B8B
 00435B83    mov         eax,dword ptr [ebp-4]
 00435B86    call        @ClassDestroy
 00435B8B    pop         ecx
 00435B8C    pop         ecx
 00435B8D    pop         ebp
 00435B8E    ret
*}
end;

//00435B90
function TCustomVariantType.IsClear(V:TVarData):Boolean;
begin
{*
 00435B90    xor         eax,eax
 00435B92    ret
*}
end;

//00435B94
function TCustomVariantType.LeftPromotion(const V:TVarData; const Operator:TVarOp; var RequiredVarType:TVarType):Boolean;
begin
{*
 00435B94    push        ebp
 00435B95    mov         ebp,esp
 00435B97    mov         edx,dword ptr [ebp+8]
 00435B9A    movzx       eax,word ptr [eax+4]
 00435B9E    mov         word ptr [edx],ax
 00435BA1    mov         al,1
 00435BA3    pop         ebp
 00435BA4    ret         4
*}
end;

//00435BA8
function TCustomVariantType.OlePromotion(const V:TVarData; var RequiredVarType:TVarType):Boolean;
begin
{*
 00435BA8    mov         word ptr [ecx],8
 00435BAD    mov         al,1
 00435BAF    ret
*}
end;

//00435BB0
procedure TCustomVariantType.RaiseCastError;
begin
{*
 00435BB0    call        VarCastError
 00435BB5    ret
*}
end;

//00435BB8
procedure TCustomVariantType.RaiseInvalidOp;
begin
{*
 00435BB8    call        VarInvalidOp
 00435BBD    ret
*}
end;

//00435BC0
procedure TCustomVariantType.RaiseDispError;
begin
{*
 00435BC0    call        @DispInvokeError
 00435BC5    ret
*}
end;

//00435BC8
function TCustomVariantType.RightPromotion(const V:TVarData; const Operator:TVarOp; var RequiredVarType:TVarType):Boolean;
begin
{*
 00435BC8    push        ebp
 00435BC9    mov         ebp,esp
 00435BCB    mov         edx,dword ptr [ebp+8]
 00435BCE    movzx       eax,word ptr [eax+4]
 00435BD2    mov         word ptr [edx],ax
 00435BD5    mov         al,1
 00435BD7    pop         ebp
 00435BD8    ret         4
*}
end;

//00435BDC
procedure TCustomVariantType.UnaryOp(var Right:TVarData; Operator:Integer);
begin
{*
 00435BDC    call        TCustomVariantType.RaiseInvalidOp
 00435BE1    ret
*}
end;

//00435BE4
procedure TCustomVariantType.DispInvoke(Dest:PVarData; const Source:TVarData; CallDesc:PCallDesc; Params:Pointer);
begin
{*
 00435BE4    push        ebp
 00435BE5    mov         ebp,esp
 00435BE7    call        TCustomVariantType.RaiseDispError
 00435BEC    pop         ebp
 00435BED    ret         8
*}
end;

//00435BF0
function TCustomVariantType._AddRef:Integer; stdcall;
begin
{*
 00435BF0    push        ebp
 00435BF1    mov         ebp,esp
 00435BF3    or          eax,0FFFFFFFF
 00435BF6    pop         ebp
 00435BF7    ret         4
*}
end;

//00435BFC
function TCustomVariantType._Release:Integer; stdcall;
begin
{*
 00435BFC    push        ebp
 00435BFD    mov         ebp,esp
 00435BFF    or          eax,0FFFFFFFF
 00435C02    pop         ebp
 00435C03    ret         4
*}
end;

//00435C08
function TCustomVariantType.QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;
begin
{*
 00435C08    push        ebp
 00435C09    mov         ebp,esp
 00435C0B    push        ebx
 00435C0C    mov         ebx,dword ptr [ebp+8]
 00435C0F    mov         ecx,dword ptr [ebp+10]
 00435C12    mov         edx,dword ptr [ebp+0C]
 00435C15    mov         eax,ebx
 00435C17    call        TObject.GetInterface
 00435C1C    test        al,al
>00435C1E    je          00435C24
 00435C20    xor         eax,eax
>00435C22    jmp         00435C29
 00435C24    mov         eax,80004002
 00435C29    pop         ebx
 00435C2A    pop         ebp
 00435C2B    ret         0C
*}
end;

//00435C30
function FindCustomVariantType(const AVarType:TVarType; var CustomVariantType:TCustomVariantType):Boolean;
begin
{*
 00435C30    push        ebp
 00435C31    mov         ebp,esp
 00435C33    push        ecx
 00435C34    push        ebx
 00435C35    push        esi
 00435C36    push        edi
 00435C37    mov         esi,edx
 00435C39    mov         ebx,eax
 00435C3B    cmp         dword ptr ds:[792F9C],0
>00435C42    je          00435C52
 00435C44    cmp         bx,100
>00435C49    jb          00435C52
 00435C4B    cmp         bx,7FF
>00435C50    jbe         00435C56
 00435C52    xor         eax,eax
>00435C54    jmp         00435C58
 00435C56    mov         al,1
 00435C58    mov         byte ptr [ebp-1],al
 00435C5B    cmp         byte ptr [ebp-1],0
>00435C5F    je          00435CDF
 00435C61    push        792FA0
 00435C66    call        kernel32.EnterCriticalSection
 00435C6B    xor         eax,eax
 00435C6D    push        ebp
 00435C6E    push        435CD8
 00435C73    push        dword ptr fs:[eax]
 00435C76    mov         dword ptr fs:[eax],esp
 00435C79    mov         eax,[00792F9C]
 00435C7E    call        @DynArrayLength
 00435C83    movzx       edi,bx
 00435C86    mov         edx,edi
 00435C88    sub         edx,100
 00435C8E    cmp         eax,edx
 00435C90    setg        byte ptr [ebp-1]
 00435C94    cmp         byte ptr [ebp-1],0
>00435C98    je          00435CC0
 00435C9A    mov         eax,[00792F9C]
 00435C9F    mov         eax,dword ptr [eax+edi*4-400]
 00435CA6    mov         dword ptr [esi],eax
 00435CA8    cmp         dword ptr [esi],0
>00435CAB    je          00435CB7
 00435CAD    mov         eax,dword ptr [esi]
 00435CAF    cmp         eax,dword ptr ds:[784E8C]
>00435CB5    jne         00435CBB
 00435CB7    xor         eax,eax
>00435CB9    jmp         00435CBD
 00435CBB    mov         al,1
 00435CBD    mov         byte ptr [ebp-1],al
 00435CC0    xor         eax,eax
 00435CC2    pop         edx
 00435CC3    pop         ecx
 00435CC4    pop         ecx
 00435CC5    mov         dword ptr fs:[eax],edx
 00435CC8    push        435CDF
 00435CCD    push        792FA0
 00435CD2    call        kernel32.LeaveCriticalSection
 00435CD7    ret
>00435CD8    jmp         @HandleFinally
>00435CDD    jmp         00435CCD
 00435CDF    movzx       eax,byte ptr [ebp-1]
 00435CE3    pop         edi
 00435CE4    pop         esi
 00435CE5    pop         ebx
 00435CE6    pop         ecx
 00435CE7    pop         ebp
 00435CE8    ret
*}
end;

//00435CEC
function FindCustomVariantType(const TypeName:UnicodeString; var CustomVariantType:TCustomVariantType):Boolean;
begin
{*
 00435CEC    push        ebp
 00435CED    mov         ebp,esp
 00435CEF    add         esp,0FFFFFFF0
 00435CF2    push        ebx
 00435CF3    push        esi
 00435CF4    push        edi
 00435CF5    xor         ecx,ecx
 00435CF7    mov         dword ptr [ebp-10],ecx
 00435CFA    mov         dword ptr [ebp-8],edx
 00435CFD    mov         dword ptr [ebp-4],eax
 00435D00    xor         eax,eax
 00435D02    push        ebp
 00435D03    push        435DAE
 00435D08    push        dword ptr fs:[eax]
 00435D0B    mov         dword ptr fs:[eax],esp
 00435D0E    mov         byte ptr [ebp-9],0
 00435D12    push        792FA0
 00435D17    call        kernel32.EnterCriticalSection
 00435D1C    xor         eax,eax
 00435D1E    push        ebp
 00435D1F    push        435D91
 00435D24    push        dword ptr fs:[eax]
 00435D27    mov         dword ptr fs:[eax],esp
 00435D2A    mov         eax,[00792F9C]
 00435D2F    call        @DynArrayHigh
 00435D34    mov         esi,eax
 00435D36    test        esi,esi
>00435D38    jl          00435D79
 00435D3A    inc         esi
 00435D3B    xor         edi,edi
 00435D3D    mov         eax,[00792F9C]
 00435D42    mov         ebx,dword ptr [eax+edi*4]
 00435D45    test        ebx,ebx
>00435D47    je          00435D75
 00435D49    cmp         ebx,dword ptr ds:[784E8C]
>00435D4F    je          00435D75
 00435D51    lea         edx,[ebp-10]
 00435D54    mov         eax,dword ptr [ebx]
 00435D56    call        TObject.ClassName
 00435D5B    mov         eax,dword ptr [ebp-10]
 00435D5E    mov         edx,dword ptr [ebp-4]
 00435D61    call        SameText
 00435D66    test        al,al
>00435D68    je          00435D75
 00435D6A    mov         eax,dword ptr [ebp-8]
 00435D6D    mov         dword ptr [eax],ebx
 00435D6F    mov         byte ptr [ebp-9],1
>00435D73    jmp         00435D79
 00435D75    inc         edi
 00435D76    dec         esi
>00435D77    jne         00435D3D
 00435D79    xor         eax,eax
 00435D7B    pop         edx
 00435D7C    pop         ecx
 00435D7D    pop         ecx
 00435D7E    mov         dword ptr fs:[eax],edx
 00435D81    push        435D98
 00435D86    push        792FA0
 00435D8B    call        kernel32.LeaveCriticalSection
 00435D90    ret
>00435D91    jmp         @HandleFinally
>00435D96    jmp         00435D86
 00435D98    xor         eax,eax
 00435D9A    pop         edx
 00435D9B    pop         ecx
 00435D9C    pop         ecx
 00435D9D    mov         dword ptr fs:[eax],edx
 00435DA0    push        435DB5
 00435DA5    lea         eax,[ebp-10]
 00435DA8    call        @UStrClr
 00435DAD    ret
>00435DAE    jmp         @HandleFinally
>00435DB3    jmp         00435DA5
 00435DB5    movzx       eax,byte ptr [ebp-9]
 00435DB9    pop         edi
 00435DBA    pop         esi
 00435DBB    pop         ebx
 00435DBC    mov         esp,ebp
 00435DBE    pop         ebp
 00435DBF    ret
*}
end;

//00435DC0
procedure sub_00435DC0;
begin
{*
 00435DC0    call        @VarClear
 00435DC5    ret
*}
end;

//00435DC8
function Null:Variant;
begin
{*
 00435DC8    call        @VarNull
 00435DCD    ret
*}
end;

//00435DD0
procedure @VarAdd(var Left:TVarData; const Right:TVarData);
begin
{*
 00435DD0    mov         ecx,0
>00435DD5    jmp         @VarOp
 00435DDA    ret
*}
end;

//00435DDC
procedure @VarCmpEQ(const Left:TVarData; const Right:TVarData);
begin
{*
 00435DDC    mov         ecx,0E
 00435DE1    call        VarCompare
 00435DE6    cmp         al,1
 00435DE8    ret
*}
end;

//00435DEC
procedure @VarCmpNE(const Left:TVarData; const Right:TVarData);
begin
{*
 00435DEC    mov         ecx,0F
 00435DF1    call        VarCompare
 00435DF6    cmp         al,1
 00435DF8    ret
*}
end;

Initialization
//007801B8
{*
 007801B8    push        ebp
 007801B9    mov         ebp,esp
 007801BB    xor         eax,eax
 007801BD    push        ebp
 007801BE    push        780259
 007801C3    push        dword ptr fs:[eax]
 007801C6    mov         dword ptr fs:[eax],esp
 007801C9    sub         dword ptr ds:[792F98],1
>007801D0    jae         0078024B
 007801D2    mov         eax,792F78;gvar_00792F78
 007801D7    call        SetClearVarToEmptyParam
 007801DC    mov         eax,42D30C;@DispInvokeError
 007801E1    mov         [00792F88],eax
 007801E6    mov         eax,42CE5C;VarInvalidOp
 007801EB    mov         [00792F8C],eax
 007801F0    mov         edx,42CD6C;VarCastError
 007801F5    mov         dword ptr ds:[792F90],edx
 007801FB    mov         [00792F94],eax
 00780200    mov         eax,42D518;@VarClr
 00780205    mov         edx,dword ptr ds:[78D3D0]
 0078020B    mov         dword ptr [edx],eax
 0078020D    mov         eax,434FB8;@VarAddRef
 00780212    mov         edx,dword ptr ds:[78CC44]
 00780218    mov         dword ptr [edx],eax
 0078021A    mov         eax,42D970;@VarCopy
 0078021F    mov         edx,dword ptr ds:[78D59C]
 00780225    mov         dword ptr [edx],eax
 00780227    mov         eax,431084;@VarToLStr
 0078022C    mov         edx,dword ptr ds:[78DABC]
 00780232    mov         dword ptr [edx],eax
 00780234    mov         eax,4319E4;@VarToWStr
 00780239    mov         edx,dword ptr ds:[78D638]
 0078023F    mov         dword ptr [edx],eax
 00780241    push        792FA0
 00780246    call        kernel32.InitializeCriticalSection
 0078024B    xor         eax,eax
 0078024D    pop         edx
 0078024E    pop         ecx
 0078024F    pop         ecx
 00780250    mov         dword ptr fs:[eax],edx
 00780253    push        780260
 00780258    ret
>00780259    jmp         @HandleFinally
>0078025E    jmp         00780258
 00780260    pop         ebp
 00780261    ret
*}
Finalization
//00435DFC
{*
 00435DFC    push        ebp
 00435DFD    mov         ebp,esp
 00435DFF    xor         eax,eax
 00435E01    push        ebp
 00435E02    push        435E6B
 00435E07    push        dword ptr fs:[eax]
 00435E0A    mov         dword ptr fs:[eax],esp
 00435E0D    inc         dword ptr ds:[792F98]
>00435E13    jne         00435E5D
 00435E15    call        ClearVariantTypeList
 00435E1A    push        792FA0
 00435E1F    call        kernel32.DeleteCriticalSection
 00435E24    mov         eax,792F78;gvar_00792F78
 00435E29    call        @VarClr
 00435E2E    mov         eax,784E6C
 00435E33    call        @UStrClr
 00435E38    mov         eax,784FD0;^'Empty'
 00435E3D    mov         ecx,16
 00435E42    mov         edx,dword ptr ds:[40128C];string
 00435E48    call        @FinalizeArray
 00435E4D    mov         eax,792F9C
 00435E52    mov         edx,dword ptr ds:[4356A4];:02
 00435E58    call        @DynArrayClear
 00435E5D    xor         eax,eax
 00435E5F    pop         edx
 00435E60    pop         ecx
 00435E61    pop         ecx
 00435E62    mov         dword ptr fs:[eax],edx
 00435E65    push        435E72
 00435E6A    ret
>00435E6B    jmp         @HandleFinally
>00435E70    jmp         00435E6A
 00435E72    pop         ebp
 00435E73    ret
*}
end.