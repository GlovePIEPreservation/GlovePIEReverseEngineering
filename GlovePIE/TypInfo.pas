//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit TypInfo;

interface

uses
  SysUtils, Classes;

type
  TTypeKind = (tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat, tkString, tkSet, tkClass, tkMethod, tkWChar, tkLString, tkWString, tkVariant, tkArray, tkRecord, tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef, tkPointer, tkProcedure);
  TTypeKinds = set of TTypeKind;
  TOrdType = (otSByte, otUByte, otSWord, otUWord, otSLong, otULong);
  TFloatType = (ftSingle, ftDouble, ftExtended, ftComp, ftCurr);
  TMethodKind = (mkProcedure, mkFunction, mkConstructor, mkDestructor, mkClassProcedure, mkClassFunction, mkClassConstructor, mkClassDestructor, mkOperatorOverload, mkSafeProcedure, mkSafeFunction);
  TParamFlag = (pfVar, pfConst, pfArray, pfAddress, pfReference, pfOut, pfResult);
  TParamFlags = set of TParamFlag;
  TIntfFlag = (ifHasGuid, ifDispInterface, ifDispatch);
  TIntfFlagsBase = set of TIntfFlag;
  TCallConv = (ccReg, ccCdecl, ccPascal, ccStdCall, ccSafeCall);
  TTypeInfo = TTypeInfo = record//size=101
Kind:TTypeKind;//f0
Name:ShortString;//f1
end;;
  TAttrData = TAttrData = record//size=2
Len:Word;//f0
end;;
  TProcedureSignature = TProcedureSignature = record//size=7
Flags:Byte;//f0
CC:TCallConv;//f1
ResultType:PPTypeInfo;//f2
ParamCount:Byte;//f6
end;;
  TArrayTypeData = TArrayTypeData = record//size=40D
Size:Integer;//f0
ElCount:Integer;//f4
ElType:PPTypeInfo;//f8
DimCount:Byte;//fC
Dims:?;//fD
end;;
  TTypeData = TTypeData = record//size=40D
AttrData:TAttrData;//f0
CodePage:Word;//f0
OrdType:TOrdType;//f0
MinValue:Integer;//f1
MaxValue:Integer;//f5
BaseType:PPTypeInfo;//f9
NameList:ShortStringBase;//fD
CompType:PPTypeInfo;//f1
FloatType:TFloatType;//f0
MaxLength:Byte;//f0
ClassType:TClass;//f0
ParentInfo:PPTypeInfo;//f4
PropCount:SmallInt;//f8
UnitName:ShortStringBase;//fA
MethodKind:TMethodKind;//f0
ParamCount:Byte;//f1
ParamList:?;//f2
ProcSig:PProcedureSignature;//f0
ProcAttrData:TAttrData;//f4
IntfParent:PPTypeInfo;//f0
IntfFlags:TIntfFlagsBase;//f4
Guid:TGUID;//f5
IntfUnit:ShortStringBase;//f15
MinInt64Value:Int64;//f0
MaxInt64Value:Int64;//f8
Int64AttrData:TAttrData;//f10
elSize:Integer;//f0
elType:PPTypeInfo;//f4
varType:Integer;//f8
elType2:PPTypeInfo;//fC
DynUnitName:ShortStringBase;//f10
RecSize:Integer;//f0
ManagedFldCount:Integer;//f4
InstanceType:PPTypeInfo;//f0
ClassRefAttrData:TAttrData;//f4
RefType:PPTypeInfo;//f0
PtrAttrData:TAttrData;//f4
ArrayData:TArrayTypeData;//f0
end;;
  TPropInfo = TPropInfo = record//size=11A
PropType:PPTypeInfo;//f0
GetProc:Pointer;//f4
SetProc:Pointer;//f8
StoredProc:Pointer;//fC
Index:Integer;//f10
Default:Integer;//f14
NameIndex:SmallInt;//f18
Name:ShortString;//f1A
end;;
  TPropList = array [1..16380] of PPropInfo;
  EPropertyError = class(Exception)
  end;
    procedure PropertyNotFound(const Name:UnicodeString);//00436948
    function PropType(Instance:TObject; const PropName:UnicodeString):TTypeKind;//00436974
    function FindPropInfo(AClass:TClass; const PropName:UnicodeString):PPropInfo;//00436980
    function FindPropInfo(Instance:TObject; const PropName:UnicodeString):PPropInfo;//004369E4
    function PropType(AClass:TClass; const PropName:UnicodeString):TTypeKind;//00436A48
    function GetDynArrayProp(Instance:TObject; const PropName:UnicodeString):Pointer;//00436A64
    function GetAnsiStrProp(Instance:TObject; const PropName:UnicodeString):AnsiString;//00436A80
    function GetEnumProp(Instance:TObject; const PropName:UnicodeString):UnicodeString;//00436AA4
    procedure SetObjectProp(Instance:TObject; const PropName:UnicodeString; Value:TObject);//00436AC8
    function GetStrProp(Instance:TObject; PropInfo:PPropInfo):UnicodeString;//00436AEC
    procedure sub_00436B04;//00436B04
    function GetInterfaceProp(Instance:TObject; const PropName:UnicodeString):IInterface;//00436B0C
    function GetMethodProp(Instance:TObject; const PropName:UnicodeString):TMethod;//00436B30
    function GetUnicodeStrProp(Instance:TObject; const PropName:UnicodeString):UnicodeString;//00436B54
    function GetObjectProp(Instance:TObject; const PropName:UnicodeString; MinClass:TClass):TObject;//00436B78
    function GetFloatProp(Instance:TObject; const PropName:UnicodeString):Extended;//00436B9C
    procedure SetFloatProp(Instance:TObject; const PropName:UnicodeString; const Value:Extended);//00436BC4
    function GetVariantProp(Instance:TObject; const PropName:UnicodeString):Variant;//00436BF0
    function GetWideStrProp(Instance:TObject; const PropName:UnicodeString):WideString;//00436C14
    function GetInt64Prop(Instance:TObject; const PropName:UnicodeString):Int64;//00436C38
    procedure SetInt64Prop(Instance:TObject; const PropName:UnicodeString; const Value:Int64);//00436C68
    function GetPropName(PropInfo:PPropInfo):UnicodeString;//00436C90
    function GetTypeData(TypeInfo:PTypeInfo):PTypeData;//00436CE0
    function GetEnumName(TypeInfo:PTypeInfo; Value:Integer):UnicodeString;//00436CEC
    function UTF8Compare(const Str1:ShortString; const Str2:ShortString):Integer;//00436DE4
    function UTF8SameText(const Str1:ShortString; Str2:PAnsiChar):Boolean;//00436E58
    function GetEnumNameValue(TypeInfo:PTypeInfo; const Name:UTF8String):Integer;//00436EC0
    function GetEnumValue(TypeInfo:PTypeInfo; const Name:UnicodeString):Integer;//00436F38
    function InternalGetPropInfo(TypeInfo:PTypeInfo; const PropName:UTF8String):PPropInfo;//0043707C
    function GetPropInfo(TypeInfo:PTypeInfo; const PropName:UnicodeString):PPropInfo;//00437130
    function GetPropInfo(TypeInfo:PTypeInfo; const PropName:UnicodeString; AKinds:TTypeKinds):PPropInfo;//00437184
    function GetPropInfo(Instance:TObject; const PropName:UnicodeString; AKinds:TTypeKinds):PPropInfo;//0043720C
    procedure GetPropInfos(TypeInfo:PTypeInfo; PropList:PPropList);//00437224
    procedure SortPropList(PropList:PPropList; PropCount:Integer);//00437278
    function GetPropList(TypeInfo:PTypeInfo; TypeKinds:TTypeKinds; PropList:PPropList; SortList:Boolean):Integer;//0043733C
    function GetPropList(TypeInfo:PTypeInfo; var PropList:PPropList):Integer;//004373E0
    function IsStoredProp(Instance:TObject; PropInfo:PPropInfo):Boolean;//00437414
    function GetOrdProp(Instance:TObject; PropInfo:PPropInfo):LongInt;//00437444
    procedure SetOrdProp(Instance:TObject; PropInfo:PPropInfo; Value:LongInt);//004374B8
    function GetSetElementName(TypeInfo:PTypeInfo; Value:Integer):UnicodeString;//00437514
    function GetSetElementValue(TypeInfo:PTypeInfo; const Name:UnicodeString):Integer;//004375A8
    function GetObjectProp(Instance:TObject; PropInfo:PPropInfo; MinClass:TClass):TObject;//00437648
    procedure SetObjectProp(Instance:TObject; PropInfo:PPropInfo; Value:TObject; ValidateClass:Boolean);//0043767C
    function GetObjectPropClass(PropInfo:PPropInfo):TClass;//004376B8
    procedure GetShortStrProp(Instance:TObject; PropInfo:PPropInfo; var Value:ShortString; const _Dv_:$0..-$1);//004376E0
    procedure SetShortStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:ShortString);//00437724
    procedure GetShortStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);//00437778
    procedure SetShortStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);//004377A8
    procedure GetLongStrProp(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);//004377DC
    procedure SetLongStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);//0043781C
    procedure GetWideStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);//0043785C
    procedure SetWideStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);//004378B8
    procedure GetUnicodeStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);//00437910
    procedure SetUnicodeStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);//0043796C
    function GetAnsiStrProp(Instance:TObject; PropInfo:PPropInfo):AnsiString;//004379C4
    procedure SetAnsiStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);//00437A10
    function GetWideStrProp(Instance:TObject; PropInfo:PPropInfo):WideString;//00437A4C
    procedure SetWideStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:WideString);//00437B60
    function GetUnicodeStrProp(Instance:TObject; PropInfo:PPropInfo):UnicodeString;//00437C5C
    procedure SetRawByteStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:UnicodeString);//00437D70
    procedure SetUnicodeStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:UnicodeString);//00437E7C
    function GetFloatProp(Instance:TObject; PropInfo:PPropInfo):Extended;//00437FA0
    procedure SetFloatProp(Instance:TObject; PropInfo:PPropInfo; const Value:Extended);//004380B8
    procedure AssignVariant(var Dest:Variant; const Source:Variant);//004382B0
    function GetVariantProp(Instance:TObject; PropInfo:PPropInfo):Variant;//004382C4
    procedure SetVariantProp(Instance:TObject; PropInfo:PPropInfo; const Value:Variant);//00438304
    function GetMethodProp(Instance:TObject; PropInfo:PPropInfo):TMethod;//00438344
    procedure SetMethodProp(Instance:TObject; PropInfo:PPropInfo; const Value:TMethod);//00438384
    function GetInt64Prop(Instance:TObject; PropInfo:PPropInfo):Int64;//004383BC
    procedure SetInt64Prop(Instance:TObject; PropInfo:PPropInfo; const Value:Int64);//004383E4
    function GetInterfaceProp(Instance:TObject; PropInfo:PPropInfo):IInterface;//00438420
    procedure SetInterfaceProp(Instance:TObject; PropInfo:PPropInfo; const Value:IInterface);//004384A0

implementation

//00436948
procedure PropertyNotFound(const Name:UnicodeString);
begin
{*
 00436948    push        ebx
 00436949    add         esp,0FFFFFFF8
 0043694C    mov         ebx,eax
 0043694E    mov         dword ptr [esp],ebx
 00436951    mov         byte ptr [esp+4],11
 00436956    push        esp
 00436957    push        0
 00436959    mov         ecx,dword ptr ds:[78CE4C];^SResString145:TResStringRec
 0043695F    mov         dl,1
 00436961    mov         eax,[0043686C];EPropertyError
 00436966    call        Exception.CreateResFmt
 0043696B    call        @RaiseExcept
 00436970    pop         ecx
 00436971    pop         edx
 00436972    pop         ebx
 00436973    ret
*}
end;

//00436974
function PropType(Instance:TObject; const PropName:UnicodeString):TTypeKind;
begin
{*
 00436974    mov         eax,dword ptr [eax]
 00436976    mov         ecx,eax
 00436978    mov         eax,ecx
 0043697A    call        PropType
 0043697F    ret
*}
end;

//00436980
function FindPropInfo(AClass:TClass; const PropName:UnicodeString):PPropInfo;
begin
{*
 00436980    push        ebp
 00436981    mov         ebp,esp
 00436983    push        0
 00436985    push        ebx
 00436986    push        esi
 00436987    mov         esi,edx
 00436989    mov         ebx,eax
 0043698B    xor         eax,eax
 0043698D    push        ebp
 0043698E    push        4369D3
 00436993    push        dword ptr fs:[eax]
 00436996    mov         dword ptr fs:[eax],esp
 00436999    lea         edx,[ebp-4]
 0043699C    mov         eax,esi
 0043699E    call        UTF8Encode
 004369A3    mov         edx,dword ptr [ebp-4]
 004369A6    add         ebx,0FFFFFFB8
 004369A9    mov         eax,dword ptr [ebx]
 004369AB    call        InternalGetPropInfo
 004369B0    mov         ebx,eax
 004369B2    test        ebx,ebx
>004369B4    jne         004369BD
 004369B6    mov         eax,esi
 004369B8    call        PropertyNotFound
 004369BD    xor         eax,eax
 004369BF    pop         edx
 004369C0    pop         ecx
 004369C1    pop         ecx
 004369C2    mov         dword ptr fs:[eax],edx
 004369C5    push        4369DA
 004369CA    lea         eax,[ebp-4]
 004369CD    call        @LStrClr
 004369D2    ret
>004369D3    jmp         @HandleFinally
>004369D8    jmp         004369CA
 004369DA    mov         eax,ebx
 004369DC    pop         esi
 004369DD    pop         ebx
 004369DE    pop         ecx
 004369DF    pop         ebp
 004369E0    ret
*}
end;

//004369E4
function FindPropInfo(Instance:TObject; const PropName:UnicodeString):PPropInfo;
begin
{*
 004369E4    push        ebp
 004369E5    mov         ebp,esp
 004369E7    push        0
 004369E9    push        ebx
 004369EA    push        esi
 004369EB    mov         esi,edx
 004369ED    mov         ebx,eax
 004369EF    xor         eax,eax
 004369F1    push        ebp
 004369F2    push        436A39
 004369F7    push        dword ptr fs:[eax]
 004369FA    mov         dword ptr fs:[eax],esp
 004369FD    lea         edx,[ebp-4]
 00436A00    mov         eax,esi
 00436A02    call        UTF8Encode
 00436A07    mov         edx,dword ptr [ebp-4]
 00436A0A    mov         eax,dword ptr [ebx]
 00436A0C    add         eax,0FFFFFFB8
 00436A0F    mov         eax,dword ptr [eax]
 00436A11    call        InternalGetPropInfo
 00436A16    mov         ebx,eax
 00436A18    test        ebx,ebx
>00436A1A    jne         00436A23
 00436A1C    mov         eax,esi
 00436A1E    call        PropertyNotFound
 00436A23    xor         eax,eax
 00436A25    pop         edx
 00436A26    pop         ecx
 00436A27    pop         ecx
 00436A28    mov         dword ptr fs:[eax],edx
 00436A2B    push        436A40
 00436A30    lea         eax,[ebp-4]
 00436A33    call        @LStrClr
 00436A38    ret
>00436A39    jmp         @HandleFinally
>00436A3E    jmp         00436A30
 00436A40    mov         eax,ebx
 00436A42    pop         esi
 00436A43    pop         ebx
 00436A44    pop         ecx
 00436A45    pop         ebp
 00436A46    ret
*}
end;

//00436A48
function PropType(AClass:TClass; const PropName:UnicodeString):TTypeKind;
begin
{*
 00436A48    push        ebx
 00436A49    push        esi
 00436A4A    mov         esi,edx
 00436A4C    mov         ebx,eax
 00436A4E    mov         edx,esi
 00436A50    mov         eax,ebx
 00436A52    call        FindPropInfo
 00436A57    mov         eax,dword ptr [eax]
 00436A59    mov         eax,dword ptr [eax]
 00436A5B    movzx       eax,byte ptr [eax]
 00436A5E    pop         esi
 00436A5F    pop         ebx
 00436A60    ret
*}
end;

//00436A64
function GetDynArrayProp(Instance:TObject; const PropName:UnicodeString):Pointer;
begin
{*
 00436A64    push        ebx
 00436A65    push        esi
 00436A66    mov         esi,edx
 00436A68    mov         ebx,eax
 00436A6A    mov         edx,esi
 00436A6C    mov         eax,ebx
 00436A6E    call        FindPropInfo
 00436A73    mov         edx,eax
 00436A75    mov         eax,ebx
 00436A77    call        GetOrdProp
 00436A7C    pop         esi
 00436A7D    pop         ebx
 00436A7E    ret
*}
end;

//00436A80
function GetAnsiStrProp(Instance:TObject; const PropName:UnicodeString):AnsiString;
begin
{*
 00436A80    push        ebx
 00436A81    push        esi
 00436A82    push        edi
 00436A83    mov         edi,ecx
 00436A85    mov         esi,edx
 00436A87    mov         ebx,eax
 00436A89    mov         edx,esi
 00436A8B    mov         eax,ebx
 00436A8D    call        FindPropInfo
 00436A92    mov         edx,eax
 00436A94    mov         ecx,edi
 00436A96    mov         eax,ebx
 00436A98    call        SetOrdProp
 00436A9D    pop         edi
 00436A9E    pop         esi
 00436A9F    pop         ebx
 00436AA0    ret
*}
end;

//00436AA4
function GetEnumProp(Instance:TObject; const PropName:UnicodeString):UnicodeString;
begin
{*
 00436AA4    push        ebx
 00436AA5    push        esi
 00436AA6    push        edi
 00436AA7    mov         edi,ecx
 00436AA9    mov         esi,edx
 00436AAB    mov         ebx,eax
 00436AAD    mov         edx,esi
 00436AAF    mov         eax,ebx
 00436AB1    call        FindPropInfo
 00436AB6    mov         edx,eax
 00436AB8    mov         ecx,edi
 00436ABA    mov         eax,ebx
 00436ABC    call        GetObjectProp
 00436AC1    pop         edi
 00436AC2    pop         esi
 00436AC3    pop         ebx
 00436AC4    ret
*}
end;

//00436AC8
procedure SetObjectProp(Instance:TObject; const PropName:UnicodeString; Value:TObject);
begin
{*
 00436AC8    push        ebx
 00436AC9    push        esi
 00436ACA    push        edi
 00436ACB    mov         edi,ecx
 00436ACD    mov         esi,edx
 00436ACF    mov         ebx,eax
 00436AD1    push        1
 00436AD3    mov         edx,esi
 00436AD5    mov         eax,ebx
 00436AD7    call        FindPropInfo
 00436ADC    mov         edx,eax
 00436ADE    mov         ecx,edi
 00436AE0    mov         eax,ebx
 00436AE2    call        SetObjectProp
 00436AE7    pop         edi
 00436AE8    pop         esi
 00436AE9    pop         ebx
 00436AEA    ret
*}
end;

//00436AEC
function GetStrProp(Instance:TObject; PropInfo:PPropInfo):UnicodeString;
begin
{*
 00436AEC    push        ebx
 00436AED    push        esi
 00436AEE    push        edi
 00436AEF    mov         edi,ecx
 00436AF1    mov         esi,edx
 00436AF3    mov         ebx,eax
 00436AF5    mov         ecx,edi
 00436AF7    mov         edx,esi
 00436AF9    mov         eax,ebx
 00436AFB    call        GetUnicodeStrProp
 00436B00    pop         edi
 00436B01    pop         esi
 00436B02    pop         ebx
 00436B03    ret
*}
end;

//00436B04
procedure sub_00436B04;
begin
{*
 00436B04    call        GetObjectProp
 00436B09    ret
*}
end;

//00436B0C
function GetInterfaceProp(Instance:TObject; const PropName:UnicodeString):IInterface;
begin
{*
 00436B0C    push        ebx
 00436B0D    push        esi
 00436B0E    push        edi
 00436B0F    mov         edi,ecx
 00436B11    mov         esi,edx
 00436B13    mov         ebx,eax
 00436B15    mov         edx,esi
 00436B17    mov         eax,ebx
 00436B19    call        FindPropInfo
 00436B1E    mov         edx,eax
 00436B20    mov         ecx,edi
 00436B22    mov         eax,ebx
 00436B24    call        GetWideStrProp
 00436B29    pop         edi
 00436B2A    pop         esi
 00436B2B    pop         ebx
 00436B2C    ret
*}
end;

//00436B30
function GetMethodProp(Instance:TObject; const PropName:UnicodeString):TMethod;
begin
{*
 00436B30    push        ebx
 00436B31    push        esi
 00436B32    push        edi
 00436B33    mov         edi,ecx
 00436B35    mov         esi,edx
 00436B37    mov         ebx,eax
 00436B39    mov         edx,esi
 00436B3B    mov         eax,ebx
 00436B3D    call        FindPropInfo
 00436B42    mov         edx,eax
 00436B44    mov         ecx,edi
 00436B46    mov         eax,ebx
 00436B48    call        SetWideStrProp
 00436B4D    pop         edi
 00436B4E    pop         esi
 00436B4F    pop         ebx
 00436B50    ret
*}
end;

//00436B54
function GetUnicodeStrProp(Instance:TObject; const PropName:UnicodeString):UnicodeString;
begin
{*
 00436B54    push        ebx
 00436B55    push        esi
 00436B56    push        edi
 00436B57    mov         edi,ecx
 00436B59    mov         esi,edx
 00436B5B    mov         ebx,eax
 00436B5D    mov         edx,esi
 00436B5F    mov         eax,ebx
 00436B61    call        FindPropInfo
 00436B66    mov         edx,eax
 00436B68    mov         ecx,edi
 00436B6A    mov         eax,ebx
 00436B6C    call        GetUnicodeStrProp
 00436B71    pop         edi
 00436B72    pop         esi
 00436B73    pop         ebx
 00436B74    ret
*}
end;

//00436B78
function GetObjectProp(Instance:TObject; const PropName:UnicodeString; MinClass:TClass):TObject;
begin
{*
 00436B78    push        ebx
 00436B79    push        esi
 00436B7A    push        edi
 00436B7B    mov         edi,ecx
 00436B7D    mov         esi,edx
 00436B7F    mov         ebx,eax
 00436B81    mov         edx,esi
 00436B83    mov         eax,ebx
 00436B85    call        FindPropInfo
 00436B8A    mov         edx,eax
 00436B8C    mov         ecx,edi
 00436B8E    mov         eax,ebx
 00436B90    call        SetUnicodeStrProp
 00436B95    pop         edi
 00436B96    pop         esi
 00436B97    pop         ebx
 00436B98    ret
*}
end;

//00436B9C
function GetFloatProp(Instance:TObject; const PropName:UnicodeString):Extended;
begin
{*
 00436B9C    push        ebx
 00436B9D    push        esi
 00436B9E    add         esp,0FFFFFFF4
 00436BA1    mov         esi,edx
 00436BA3    mov         ebx,eax
 00436BA5    mov         edx,esi
 00436BA7    mov         eax,ebx
 00436BA9    call        FindPropInfo
 00436BAE    mov         edx,eax
 00436BB0    mov         eax,ebx
 00436BB2    call        GetFloatProp
 00436BB7    fstp        tbyte ptr [esp]
 00436BBA    wait
 00436BBB    fld         tbyte ptr [esp]
 00436BBE    add         esp,0C
 00436BC1    pop         esi
 00436BC2    pop         ebx
 00436BC3    ret
*}
end;

//00436BC4
procedure SetFloatProp(Instance:TObject; const PropName:UnicodeString; const Value:Extended);
begin
{*
 00436BC4    push        ebp
 00436BC5    mov         ebp,esp
 00436BC7    push        ebx
 00436BC8    push        esi
 00436BC9    mov         esi,edx
 00436BCB    mov         ebx,eax
 00436BCD    movzx       eax,word ptr [ebp+10]
 00436BD1    push        eax
 00436BD2    push        dword ptr [ebp+0C]
 00436BD5    push        dword ptr [ebp+8]
 00436BD8    mov         edx,esi
 00436BDA    mov         eax,ebx
 00436BDC    call        FindPropInfo
 00436BE1    mov         edx,eax
 00436BE3    mov         eax,ebx
 00436BE5    call        SetFloatProp
 00436BEA    pop         esi
 00436BEB    pop         ebx
 00436BEC    pop         ebp
 00436BED    ret         0C
*}
end;

//00436BF0
function GetVariantProp(Instance:TObject; const PropName:UnicodeString):Variant;
begin
{*
 00436BF0    push        ebx
 00436BF1    push        esi
 00436BF2    push        edi
 00436BF3    mov         edi,ecx
 00436BF5    mov         esi,edx
 00436BF7    mov         ebx,eax
 00436BF9    mov         edx,esi
 00436BFB    mov         eax,ebx
 00436BFD    call        FindPropInfo
 00436C02    mov         edx,eax
 00436C04    mov         ecx,edi
 00436C06    mov         eax,ebx
 00436C08    call        GetVariantProp
 00436C0D    pop         edi
 00436C0E    pop         esi
 00436C0F    pop         ebx
 00436C10    ret
*}
end;

//00436C14
function GetWideStrProp(Instance:TObject; const PropName:UnicodeString):WideString;
begin
{*
 00436C14    push        ebx
 00436C15    push        esi
 00436C16    push        edi
 00436C17    mov         edi,ecx
 00436C19    mov         esi,edx
 00436C1B    mov         ebx,eax
 00436C1D    mov         edx,esi
 00436C1F    mov         eax,ebx
 00436C21    call        FindPropInfo
 00436C26    mov         edx,eax
 00436C28    mov         ecx,edi
 00436C2A    mov         eax,ebx
 00436C2C    call        SetVariantProp
 00436C31    pop         edi
 00436C32    pop         esi
 00436C33    pop         ebx
 00436C34    ret
*}
end;

//00436C38
function GetInt64Prop(Instance:TObject; const PropName:UnicodeString):Int64;
begin
{*
 00436C38    push        ebx
 00436C39    push        esi
 00436C3A    add         esp,0FFFFFFF8
 00436C3D    mov         esi,edx
 00436C3F    mov         ebx,eax
 00436C41    mov         edx,esi
 00436C43    mov         eax,ebx
 00436C45    call        FindPropInfo
 00436C4A    mov         edx,eax
 00436C4C    mov         eax,ebx
 00436C4E    call        GetInt64Prop
 00436C53    mov         dword ptr [esp],eax
 00436C56    mov         dword ptr [esp+4],edx
 00436C5A    mov         eax,dword ptr [esp]
 00436C5D    mov         edx,dword ptr [esp+4]
 00436C61    pop         ecx
 00436C62    pop         edx
 00436C63    pop         esi
 00436C64    pop         ebx
 00436C65    ret
*}
end;

//00436C68
procedure SetInt64Prop(Instance:TObject; const PropName:UnicodeString; const Value:Int64);
begin
{*
 00436C68    push        ebp
 00436C69    mov         ebp,esp
 00436C6B    push        ebx
 00436C6C    push        esi
 00436C6D    mov         esi,edx
 00436C6F    mov         ebx,eax
 00436C71    push        dword ptr [ebp+0C]
 00436C74    push        dword ptr [ebp+8]
 00436C77    mov         edx,esi
 00436C79    mov         eax,ebx
 00436C7B    call        FindPropInfo
 00436C80    mov         edx,eax
 00436C82    mov         eax,ebx
 00436C84    call        SetInt64Prop
 00436C89    pop         esi
 00436C8A    pop         ebx
 00436C8B    pop         ebp
 00436C8C    ret         8
*}
end;

//00436C90
function GetPropName(PropInfo:PPropInfo):UnicodeString;
begin
{*
 00436C90    push        ebp
 00436C91    mov         ebp,esp
 00436C93    push        0
 00436C95    push        ebx
 00436C96    push        esi
 00436C97    mov         esi,edx
 00436C99    xor         edx,edx
 00436C9B    push        ebp
 00436C9C    push        436CD4
 00436CA1    push        dword ptr fs:[edx]
 00436CA4    mov         dword ptr fs:[edx],esp
 00436CA7    lea         ebx,[eax+1A]
 00436CAA    lea         edx,[ebp-4]
 00436CAD    mov         eax,ebx
 00436CAF    call        UTF8ToUnicodeString
 00436CB4    mov         eax,esi
 00436CB6    mov         edx,dword ptr [ebp-4]
 00436CB9    call        @UStrAsg
 00436CBE    xor         eax,eax
 00436CC0    pop         edx
 00436CC1    pop         ecx
 00436CC2    pop         ecx
 00436CC3    mov         dword ptr fs:[eax],edx
 00436CC6    push        436CDB
 00436CCB    lea         eax,[ebp-4]
 00436CCE    call        @UStrClr
 00436CD3    ret
>00436CD4    jmp         @HandleFinally
>00436CD9    jmp         00436CCB
 00436CDB    pop         esi
 00436CDC    pop         ebx
 00436CDD    pop         ecx
 00436CDE    pop         ebp
 00436CDF    ret
*}
end;

//00436CE0
function GetTypeData(TypeInfo:PTypeInfo):PTypeData;
begin
{*
 00436CE0    xor         edx,edx
 00436CE2    mov         dl,byte ptr [eax+1]
 00436CE5    lea         eax,[eax+edx+2]
 00436CE9    ret
*}
end;

//00436CEC
function GetEnumName(TypeInfo:PTypeInfo; Value:Integer):UnicodeString;
begin
{*
 00436CEC    push        ebp
 00436CED    mov         ebp,esp
 00436CEF    push        0
 00436CF1    push        0
 00436CF3    push        ebx
 00436CF4    push        esi
 00436CF5    push        edi
 00436CF6    mov         edi,ecx
 00436CF8    mov         ebx,edx
 00436CFA    mov         esi,eax
 00436CFC    xor         eax,eax
 00436CFE    push        ebp
 00436CFF    push        436DC0
 00436D04    push        dword ptr fs:[eax]
 00436D07    mov         dword ptr fs:[eax],esp
 00436D0A    cmp         byte ptr [esi],1
>00436D0D    jne         00436D1D
 00436D0F    mov         edx,edi
 00436D11    mov         eax,ebx
 00436D13    call        IntToStr
>00436D18    jmp         00436DA5
 00436D1D    mov         eax,esi
 00436D1F    call        GetTypeData
 00436D24    mov         eax,dword ptr [eax+9]
 00436D27    mov         eax,dword ptr [eax]
 00436D29    call        GetTypeData
 00436D2E    cmp         esi,dword ptr ds:[401000];Boolean
>00436D34    je          00436D3C
 00436D36    cmp         dword ptr [eax+1],0
>00436D3A    jge         00436D7D
 00436D3C    mov         eax,edi
 00436D3E    test        ebx,ebx
 00436D40    setne       dl
 00436D43    and         edx,7F
 00436D46    mov         edx,dword ptr [edx*4+785040];^'False'
 00436D4D    call        @UStrAsg
 00436D52    mov         eax,[0078D9C8]
 00436D57    mov         eax,dword ptr [eax]
 00436D59    mov         edx,436DDC;'0x'
 00436D5E    call        SameText
 00436D63    test        al,al
>00436D65    je          00436DA5
 00436D67    lea         edx,[ebp-8]
 00436D6A    mov         eax,dword ptr [edi]
 00436D6C    call        LowerCase
 00436D71    mov         edx,dword ptr [ebp-8]
 00436D74    mov         eax,edi
 00436D76    call        @UStrAsg
>00436D7B    jmp         00436DA5
 00436D7D    add         eax,0D
 00436D80    test        ebx,ebx
>00436D82    je          00436D8F
 00436D84    movzx       edx,byte ptr [eax]
 00436D87    inc         edx
 00436D88    add         eax,edx
 00436D8A    dec         ebx
 00436D8B    test        ebx,ebx
>00436D8D    jne         00436D84
 00436D8F    mov         ebx,eax
 00436D91    lea         edx,[ebp-4]
 00436D94    mov         eax,ebx
 00436D96    call        UTF8ToUnicodeString
 00436D9B    mov         eax,edi
 00436D9D    mov         edx,dword ptr [ebp-4]
 00436DA0    call        @UStrAsg
 00436DA5    xor         eax,eax
 00436DA7    pop         edx
 00436DA8    pop         ecx
 00436DA9    pop         ecx
 00436DAA    mov         dword ptr fs:[eax],edx
 00436DAD    push        436DC7
 00436DB2    lea         eax,[ebp-8]
 00436DB5    mov         edx,2
 00436DBA    call        @UStrArrayClr
 00436DBF    ret
>00436DC0    jmp         @HandleFinally
>00436DC5    jmp         00436DB2
 00436DC7    pop         edi
 00436DC8    pop         esi
 00436DC9    pop         ebx
 00436DCA    pop         ecx
 00436DCB    pop         ecx
 00436DCC    pop         ebp
 00436DCD    ret
*}
end;

//00436DE4
function UTF8Compare(const Str1:ShortString; const Str2:ShortString):Integer;
begin
{*
 00436DE4    push        ebx
 00436DE5    push        esi
 00436DE6    add         esp,0FFFFF800
 00436DEC    mov         esi,edx
 00436DEE    mov         ebx,eax
 00436DF0    movzx       eax,byte ptr [ebx]
 00436DF3    push        eax
 00436DF4    lea         ecx,[ebx+1]
 00436DF7    lea         eax,[esp+4]
 00436DFB    mov         edx,1FF
 00436E00    call        Utf8ToUnicode
 00436E05    mov         word ptr [esp+eax*2],0
 00436E0B    movzx       eax,byte ptr [esi]
 00436E0E    push        eax
 00436E0F    lea         ecx,[esi+1]
 00436E12    lea         eax,[esp+404]
 00436E19    mov         edx,1FF
 00436E1E    call        Utf8ToUnicode
 00436E23    mov         word ptr [esp+eax*2+400],0
 00436E2D    push        0FF
 00436E2F    lea         eax,[esp+404]
 00436E36    push        eax
 00436E37    push        0FF
 00436E39    lea         eax,[esp+0C]
 00436E3D    push        eax
 00436E3E    push        1
 00436E40    push        400
 00436E45    call        kernel32.CompareStringW
 00436E4A    sub         eax,2
 00436E4D    add         esp,800
 00436E53    pop         esi
 00436E54    pop         ebx
 00436E55    ret
*}
end;

//00436E58
function UTF8SameText(const Str1:ShortString; Str2:PAnsiChar):Boolean;
begin
{*
 00436E58    push        ebx
 00436E59    push        esi
 00436E5A    add         esp,0FFFFF800
 00436E60    mov         esi,edx
 00436E62    mov         ebx,eax
 00436E64    movzx       eax,byte ptr [ebx]
 00436E67    push        eax
 00436E68    lea         ecx,[ebx+1]
 00436E6B    lea         eax,[esp+4]
 00436E6F    mov         edx,1FF
 00436E74    call        Utf8ToUnicode
 00436E79    mov         word ptr [esp+eax*2],0
 00436E7F    push        0FF
 00436E81    lea         eax,[esp+404]
 00436E88    mov         ecx,esi
 00436E8A    mov         edx,200
 00436E8F    call        Utf8ToUnicode
 00436E94    push        0FF
 00436E96    lea         eax,[esp+404]
 00436E9D    push        eax
 00436E9E    push        0FF
 00436EA0    lea         eax,[esp+0C]
 00436EA4    push        eax
 00436EA5    push        1
 00436EA7    push        400
 00436EAC    call        kernel32.CompareStringW
 00436EB1    sub         eax,2
 00436EB4    sete        al
 00436EB7    add         esp,800
 00436EBD    pop         esi
 00436EBE    pop         ebx
 00436EBF    ret
*}
end;

//00436EC0
function GetEnumNameValue(TypeInfo:PTypeInfo; const Name:UTF8String):Integer;
begin
{*
 00436EC0    push        ebx
 00436EC1    push        esi
 00436EC2    push        edi
 00436EC3    push        0
 00436EC5    test        edx,edx
>00436EC7    je          00436F2F
 00436EC9    xor         ecx,ecx
 00436ECB    mov         cl,byte ptr [eax+1]
 00436ECE    mov         eax,dword ptr [eax+ecx+0B]
 00436ED2    mov         eax,dword ptr [eax]
 00436ED4    mov         cl,byte ptr [eax+1]
 00436ED7    lea         esi,[eax+ecx+0F]
 00436EDB    mov         edi,dword ptr [eax+ecx+7]
 00436EDF    xor         eax,eax
 00436EE1    movzx       ecx,byte ptr [esi]
 00436EE4    cmp         ecx,dword ptr [edx-4]
>00436EE7    jne         00436F26
 00436EE9    test        dword ptr [esp],1
>00436EF0    jne         00436F14
 00436EF2    mov         bl,byte ptr [ecx+edx-1]
 00436EF6    test        bl,80
>00436EF9    jne         00436F0D
 00436EFB    xor         bl,byte ptr [ecx+esi]
 00436EFE    test        bl,80
>00436F01    jne         00436F14
 00436F03    test        bl,0DF
>00436F06    jne         00436F23
 00436F08    dec         ecx
>00436F09    jne         00436EE9
>00436F0B    jmp         00436F32
 00436F0D    mov         dword ptr [esp],1
 00436F14    push        eax
 00436F15    push        edx
 00436F16    mov         eax,esi
 00436F18    call        UTF8SameText
 00436F1D    test        al,al
 00436F1F    pop         edx
 00436F20    pop         eax
>00436F21    jne         00436F32
 00436F23    movzx       ecx,byte ptr [esi]
 00436F26    inc         eax
 00436F27    lea         esi,[ecx+esi+1]
 00436F2B    cmp         eax,edi
>00436F2D    jle         00436EE1
 00436F2F    or          eax,0FFFFFFFF
 00436F32    pop         edi
 00436F33    pop         edi
 00436F34    pop         esi
 00436F35    pop         ebx
 00436F36    ret
*}
end;

//00436F38
function GetEnumValue(TypeInfo:PTypeInfo; const Name:UnicodeString):Integer;
begin
{*
 00436F38    push        ebp
 00436F39    mov         ebp,esp
 00436F3B    push        0
 00436F3D    push        ebx
 00436F3E    push        esi
 00436F3F    mov         esi,edx
 00436F41    mov         ebx,eax
 00436F43    xor         eax,eax
 00436F45    push        ebp
 00436F46    push        436FEA
 00436F4B    push        dword ptr fs:[eax]
 00436F4E    mov         dword ptr fs:[eax],esp
 00436F51    movzx       eax,byte ptr [ebx]
 00436F54    cmp         al,1
>00436F56    jne         00436F63
 00436F58    mov         eax,esi
 00436F5A    call        StrToInt
 00436F5F    mov         ebx,eax
>00436F61    jmp         00436FD4
 00436F63    cmp         al,3
>00436F65    je          00436F7B
 00436F67    mov         ecx,4CE
 00436F6C    mov         edx,437004;'C:\Builds\TP\rtl\common\TypInfo.pas'
 00436F71    mov         eax,437058;'Assertion failure'
 00436F76    call        @Assert
 00436F7B    mov         eax,ebx
 00436F7D    call        GetTypeData
 00436F82    cmp         dword ptr [eax+1],0
>00436F86    jge         00436FBE
 00436F88    mov         edx,dword ptr ds:[785040];^'False'
 00436F8E    mov         eax,esi
 00436F90    call        SameText
 00436F95    test        al,al
>00436F97    je          00436F9D
 00436F99    xor         ebx,ebx
>00436F9B    jmp         00436FD4
 00436F9D    mov         edx,dword ptr ds:[785044];^'True'
 00436FA3    mov         eax,esi
 00436FA5    call        SameText
 00436FAA    test        al,al
>00436FAC    je          00436FB3
 00436FAE    or          ebx,0FFFFFFFF
>00436FB1    jmp         00436FD4
 00436FB3    mov         eax,esi
 00436FB5    call        StrToInt
 00436FBA    mov         ebx,eax
>00436FBC    jmp         00436FD4
 00436FBE    lea         edx,[ebp-4]
 00436FC1    mov         eax,esi
 00436FC3    call        UTF8Encode
 00436FC8    mov         edx,dword ptr [ebp-4]
 00436FCB    mov         eax,ebx
 00436FCD    call        GetEnumNameValue
 00436FD2    mov         ebx,eax
 00436FD4    xor         eax,eax
 00436FD6    pop         edx
 00436FD7    pop         ecx
 00436FD8    pop         ecx
 00436FD9    mov         dword ptr fs:[eax],edx
 00436FDC    push        436FF1
 00436FE1    lea         eax,[ebp-4]
 00436FE4    call        @LStrClr
 00436FE9    ret
>00436FEA    jmp         @HandleFinally
>00436FEF    jmp         00436FE1
 00436FF1    mov         eax,ebx
 00436FF3    pop         esi
 00436FF4    pop         ebx
 00436FF5    pop         ecx
 00436FF6    pop         ebp
 00436FF7    ret
*}
end;

//0043707C
function InternalGetPropInfo(TypeInfo:PTypeInfo; const PropName:UTF8String):PPropInfo;
begin
{*
 0043707C    push        ebx
 0043707D    push        esi
 0043707E    push        edi
 0043707F    push        0
 00437081    test        eax,eax
>00437083    je          00437129
 00437089    mov         ecx,edx
 0043708B    or          edx,edx
>0043708D    je          00437094
 0043708F    mov         cl,byte ptr [edx-4]
 00437092    mov         ch,byte ptr [edx]
 00437094    xor         ebx,ebx
 00437096    mov         bl,byte ptr [eax+1]
 00437099    lea         esi,[eax+ebx+2]
 0043709D    mov         bl,byte ptr [esi+0A]
 004370A0    movzx       edi,word ptr [esi+ebx+0B]
 004370A5    test        edi,edi
>004370A7    je          004370DA
 004370A9    lea         eax,[esi+ebx+0D]
 004370AD    test        dword ptr [esp],1
>004370B4    jne         00437114
 004370B6    mov         bx,word ptr [eax+1A]
 004370BA    test        bh,80
>004370BD    jne         00437114
 004370BF    test        ch,80
>004370C2    jne         0043710D
 004370C4    and         ecx,0DFFF
 004370CA    and         bh,0DF
 004370CD    cmp         ebx,ecx
>004370CF    je          004370EF
 004370D1    mov         bh,0
 004370D3    dec         edi
 004370D4    lea         eax,[eax+ebx+1B]
>004370D8    jne         004370AD
 004370DA    mov         eax,dword ptr [esi+4]
 004370DD    test        eax,eax
>004370DF    je          00437129
 004370E1    mov         eax,dword ptr [eax]
>004370E3    jmp         00437094
 004370E5    mov         ch,byte ptr [edx]
 004370E7    and         ch,0DF
 004370EA    mov         bl,byte ptr [eax+1A]
>004370ED    jmp         004370D1
 004370EF    mov         bh,0
 004370F1    mov         ch,byte ptr [ebx+edx-1]
 004370F5    test        ch,80
>004370F8    jne         0043710D
 004370FA    xor         ch,byte ptr [eax+ebx+1A]
 004370FE    test        ch,80
>00437101    jne         00437114
 00437103    test        ch,0DF
>00437106    jne         004370E5
 00437108    dec         ebx
>00437109    jne         004370F1
>0043710B    jmp         00437129
 0043710D    mov         dword ptr [esp],1
 00437114    mov         bh,0
 00437116    push        eax
 00437117    push        edx
 00437118    lea         eax,[eax+1A]
 0043711B    call        UTF8SameText
 00437120    pop         edx
 00437121    mov         cl,byte ptr [edx-4]
 00437124    test        al,al
 00437126    pop         eax
>00437127    je          004370E5
 00437129    pop         edi
 0043712A    pop         edi
 0043712B    pop         esi
 0043712C    pop         ebx
 0043712D    ret
*}
end;

//00437130
function GetPropInfo(TypeInfo:PTypeInfo; const PropName:UnicodeString):PPropInfo;
begin
{*
 00437130    push        ebp
 00437131    mov         ebp,esp
 00437133    push        0
 00437135    push        ebx
 00437136    push        esi
 00437137    mov         esi,edx
 00437139    mov         ebx,eax
 0043713B    xor         eax,eax
 0043713D    push        ebp
 0043713E    push        437175
 00437143    push        dword ptr fs:[eax]
 00437146    mov         dword ptr fs:[eax],esp
 00437149    lea         edx,[ebp-4]
 0043714C    mov         eax,esi
 0043714E    call        UTF8Encode
 00437153    mov         edx,dword ptr [ebp-4]
 00437156    mov         eax,ebx
 00437158    call        InternalGetPropInfo
 0043715D    mov         ebx,eax
 0043715F    xor         eax,eax
 00437161    pop         edx
 00437162    pop         ecx
 00437163    pop         ecx
 00437164    mov         dword ptr fs:[eax],edx
 00437167    push        43717C
 0043716C    lea         eax,[ebp-4]
 0043716F    call        @LStrClr
 00437174    ret
>00437175    jmp         @HandleFinally
>0043717A    jmp         0043716C
 0043717C    mov         eax,ebx
 0043717E    pop         esi
 0043717F    pop         ebx
 00437180    pop         ecx
 00437181    pop         ebp
 00437182    ret
*}
end;

//00437184
function GetPropInfo(TypeInfo:PTypeInfo; const PropName:UnicodeString; AKinds:TTypeKinds):PPropInfo;
begin
{*
 00437184    push        ebp
 00437185    mov         ebp,esp
 00437187    add         esp,0FFFFFFF8
 0043718A    push        ebx
 0043718B    push        esi
 0043718C    xor         ebx,ebx
 0043718E    mov         dword ptr [ebp-8],ebx
 00437191    mov         dword ptr [ebp-4],ecx
 00437194    mov         esi,edx
 00437196    mov         ebx,eax
 00437198    xor         eax,eax
 0043719A    push        ebp
 0043719B    push        4371F6
 004371A0    push        dword ptr fs:[eax]
 004371A3    mov         dword ptr fs:[eax],esp
 004371A6    lea         edx,[ebp-8]
 004371A9    mov         eax,esi
 004371AB    call        UTF8Encode
 004371B0    mov         edx,dword ptr [ebp-8]
 004371B3    mov         eax,ebx
 004371B5    call        InternalGetPropInfo
 004371BA    mov         ebx,eax
 004371BC    test        ebx,ebx
>004371BE    je          004371E0
 004371C0    mov         eax,[00437208]
 004371C5    cmp         eax,dword ptr [ebp-4]
>004371C8    je          004371E0
 004371CA    mov         eax,dword ptr [ebx]
 004371CC    mov         eax,dword ptr [eax]
 004371CE    movzx       eax,byte ptr [eax]
 004371D1    cmp         al,1F
>004371D3    ja          004371DC
 004371D5    and         eax,7F
 004371D8    bt          dword ptr [ebp-4],eax
>004371DC    jb          004371E0
 004371DE    xor         ebx,ebx
 004371E0    xor         eax,eax
 004371E2    pop         edx
 004371E3    pop         ecx
 004371E4    pop         ecx
 004371E5    mov         dword ptr fs:[eax],edx
 004371E8    push        4371FD
 004371ED    lea         eax,[ebp-8]
 004371F0    call        @LStrClr
 004371F5    ret
>004371F6    jmp         @HandleFinally
>004371FB    jmp         004371ED
 004371FD    mov         eax,ebx
 004371FF    pop         esi
 00437200    pop         ebx
 00437201    pop         ecx
 00437202    pop         ecx
 00437203    pop         ebp
 00437204    ret
*}
end;

//0043720C
function GetPropInfo(Instance:TObject; const PropName:UnicodeString; AKinds:TTypeKinds):PPropInfo;
begin
{*
 0043720C    push        ecx
 0043720D    mov         dword ptr [esp],ecx
 00437210    mov         eax,dword ptr [eax]
 00437212    add         eax,0FFFFFFB8
 00437215    mov         eax,dword ptr [eax]
 00437217    mov         ecx,dword ptr [esp]
 0043721A    call        GetPropInfo
 0043721F    pop         edx
 00437220    ret
*}
end;

//00437224
procedure GetPropInfos(TypeInfo:PTypeInfo; PropList:PPropList);
begin
{*
 00437224    push        ebx
 00437225    push        esi
 00437226    push        edi
 00437227    xor         ecx,ecx
 00437229    mov         esi,eax
 0043722B    mov         cl,byte ptr [eax+1]
 0043722E    mov         edi,edx
 00437230    xor         eax,eax
 00437232    movzx       ecx,word ptr [esi+ecx+0A]
 00437237    rep stos    dword ptr [edi]
 00437239    mov         cl,byte ptr [esi+1]
 0043723C    lea         esi,[esi+ecx+2]
 00437240    mov         cl,byte ptr [esi+0A]
 00437243    movzx       eax,word ptr [esi+ecx+0B]
 00437248    test        eax,eax
>0043724A    je          00437267
 0043724C    lea         edi,[esi+ecx+0D]
 00437250    movzx       ebx,word ptr [edi+18]
 00437254    mov         cl,byte ptr [edi+1A]
 00437257    cmp         dword ptr [edx+ebx*4],0
>0043725B    jne         00437260
 0043725D    mov         dword ptr [edx+ebx*4],edi
 00437260    lea         edi,[edi+ecx+1B]
 00437264    dec         eax
>00437265    jne         00437250
 00437267    mov         esi,dword ptr [esi+4]
 0043726A    xor         ecx,ecx
 0043726C    test        esi,esi
>0043726E    je          00437274
 00437270    mov         esi,dword ptr [esi]
>00437272    jmp         00437239
 00437274    pop         edi
 00437275    pop         esi
 00437276    pop         ebx
 00437277    ret
*}
end;

//00437278
procedure SortPropList(PropList:PPropList; PropCount:Integer);
begin
{*
 00437278    push        ebx
 00437279    push        esi
 0043727A    push        edi
 0043727B    mov         ecx,eax
 0043727D    xor         eax,eax
 0043727F    dec         edx
 00437280    call        00437289
 00437285    pop         edi
 00437286    pop         esi
 00437287    pop         ebx
 00437288    ret
*}
end;

//0043733C
function GetPropList(TypeInfo:PTypeInfo; TypeKinds:TTypeKinds; PropList:PPropList; SortList:Boolean):Integer;
begin
{*
 0043733C    push        ebp
 0043733D    mov         ebp,esp
 0043733F    add         esp,0FFFFFFF4
 00437342    push        esi
 00437343    push        edi
 00437344    mov         edi,ecx
 00437346    mov         dword ptr [ebp-4],edx
 00437349    xor         edx,edx
 0043734B    mov         dword ptr [ebp-8],edx
 0043734E    lea         edx,[ebp-0C]
 00437351    call        GetPropList
 00437356    test        eax,eax
>00437358    jle         004373D3
 0043735A    xor         ecx,ecx
 0043735C    push        ebp
 0043735D    push        4373CC
 00437362    push        dword ptr fs:[ecx]
 00437365    mov         dword ptr fs:[ecx],esp
 00437368    dec         eax
 00437369    test        eax,eax
>0043736B    jl          0043739C
 0043736D    inc         eax
 0043736E    xor         esi,esi
 00437370    mov         edx,dword ptr [ebp-0C]
 00437373    mov         edx,dword ptr [edx+esi*4]
 00437376    mov         ecx,dword ptr [edx]
 00437378    mov         ecx,dword ptr [ecx]
 0043737A    movzx       ecx,byte ptr [ecx]
 0043737D    cmp         cl,1F
>00437380    ja          00437389
 00437382    and         ecx,7F
 00437385    bt          dword ptr [ebp-4],ecx
>00437389    jae         00437398
 0043738B    test        edi,edi
>0043738D    je          00437395
 0043738F    mov         ecx,dword ptr [ebp-8]
 00437392    mov         dword ptr [edi+ecx*4],edx
 00437395    inc         dword ptr [ebp-8]
 00437398    inc         esi
 00437399    dec         eax
>0043739A    jne         00437370
 0043739C    cmp         byte ptr [ebp+8],0
>004373A0    je          004373B6
 004373A2    test        edi,edi
>004373A4    je          004373B6
 004373A6    cmp         dword ptr [ebp-8],1
>004373AA    jle         004373B6
 004373AC    mov         edx,dword ptr [ebp-8]
 004373AF    mov         eax,edi
 004373B1    call        SortPropList
 004373B6    xor         eax,eax
 004373B8    pop         edx
 004373B9    pop         ecx
 004373BA    pop         ecx
 004373BB    mov         dword ptr fs:[eax],edx
 004373BE    push        4373D3
 004373C3    mov         eax,dword ptr [ebp-0C]
 004373C6    call        @FreeMem
 004373CB    ret
>004373CC    jmp         @HandleFinally
>004373D1    jmp         004373C3
 004373D3    mov         eax,dword ptr [ebp-8]
 004373D6    pop         edi
 004373D7    pop         esi
 004373D8    mov         esp,ebp
 004373DA    pop         ebp
 004373DB    ret         4
*}
end;

//004373E0
function GetPropList(TypeInfo:PTypeInfo; var PropList:PPropList):Integer;
begin
{*
 004373E0    push        ebx
 004373E1    push        esi
 004373E2    push        edi
 004373E3    mov         edi,edx
 004373E5    mov         esi,eax
 004373E7    mov         eax,esi
 004373E9    call        GetTypeData
 004373EE    movsx       ebx,word ptr [eax+8]
 004373F2    test        ebx,ebx
>004373F4    jle         0043740C
 004373F6    mov         eax,ebx
 004373F8    add         eax,eax
 004373FA    add         eax,eax
 004373FC    call        @GetMem
 00437401    mov         dword ptr [edi],eax
 00437403    mov         edx,dword ptr [edi]
 00437405    mov         eax,esi
 00437407    call        GetPropInfos
 0043740C    mov         eax,ebx
 0043740E    pop         edi
 0043740F    pop         esi
 00437410    pop         ebx
 00437411    ret
*}
end;

//00437414
function IsStoredProp(Instance:TObject; PropInfo:PPropInfo):Boolean;
begin
{*
 00437414    mov         ecx,dword ptr [edx+0C]
 00437417    test        ecx,0FFFFFF00
>0043741D    je          0043743E
 0043741F    cmp         byte ptr [edx+0F],0FE
 00437423    mov         edx,dword ptr [edx+10]
>00437426    jb          00437432
>00437428    ja          00437435
 0043742A    movsx       ecx,cx
 0043742D    add         ecx,dword ptr [eax]
 0043742F    call        dword ptr [ecx]
 00437431    ret
 00437432    call        ecx
 00437434    ret
 00437435    and         ecx,0FFFFFF
 0043743B    mov         cl,byte ptr [ecx+eax]
 0043743E    mov         al,cl
 00437440    ret
*}
end;

//00437444
function GetOrdProp(Instance:TObject; PropInfo:PPropInfo):LongInt;
begin
{*
 00437444    push        ebx
 00437445    push        edi
 00437446    mov         edi,dword ptr [edx]
 00437448    mov         edi,dword ptr [edi]
 0043744A    mov         bl,4
 0043744C    cmp         byte ptr [edi],7
>0043744F    je          0043745A
 00437451    xor         ecx,ecx
 00437453    mov         cl,byte ptr [edi+1]
 00437456    mov         bl,byte ptr [edi+ecx+2]
 0043745A    mov         ecx,dword ptr [edx+4]
 0043745D    cmp         byte ptr [edx+7],0FE
 00437461    mov         edx,dword ptr [edx+10]
>00437464    jb          00437471
>00437466    ja          00437475
 00437468    movsx       ecx,cx
 0043746B    add         ecx,dword ptr [eax]
 0043746D    call        dword ptr [ecx]
>0043746F    jmp         0043748E
 00437471    call        ecx
>00437473    jmp         0043748E
 00437475    and         ecx,0FFFFFF
 0043747B    add         ecx,eax
 0043747D    mov         al,byte ptr [ecx]
 0043747F    cmp         bl,2
>00437482    jb          0043748E
 00437484    mov         ax,word ptr [ecx]
 00437487    cmp         bl,4
>0043748A    jb          0043748E
 0043748C    mov         eax,dword ptr [ecx]
 0043748E    cmp         bl,4
>00437491    jae         004374B2
 00437493    cmp         bl,2
>00437496    jae         004374A8
 00437498    cmp         bl,0
 0043749B    movsx       eax,al
>0043749E    je          004374B2
 004374A0    and         eax,0FF
 004374A5    pop         edi
 004374A6    pop         ebx
 004374A7    ret
 004374A8    movsx       eax,ax
>004374AB    je          004374B2
 004374AD    and         eax,0FFFF
 004374B2    pop         edi
 004374B3    pop         ebx
 004374B4    ret
*}
end;

//004374B8
procedure SetOrdProp(Instance:TObject; PropInfo:PPropInfo; Value:LongInt);
begin
{*
 004374B8    push        ebx
 004374B9    push        esi
 004374BA    push        edi
 004374BB    mov         edi,edx
 004374BD    mov         esi,dword ptr [edi]
 004374BF    mov         esi,dword ptr [esi]
 004374C1    mov         bl,4
 004374C3    cmp         byte ptr [esi],7
>004374C6    je          004374D1
 004374C8    xor         ebx,ebx
 004374CA    mov         bl,byte ptr [esi+1]
 004374CD    mov         bl,byte ptr [esi+ebx+2]
 004374D1    mov         edx,dword ptr [edi+10]
 004374D4    cmp         edx,80000000
>004374DA    jne         004374DE
 004374DC    mov         edx,ecx
 004374DE    mov         esi,dword ptr [edi+8]
 004374E1    cmp         byte ptr [edi+0B],0FE
>004374E5    ja          004374F6
>004374E7    jb          004374F2
 004374E9    movsx       esi,si
 004374EC    add         esi,dword ptr [eax]
 004374EE    call        dword ptr [esi]
>004374F0    jmp         0043750F
 004374F2    call        esi
>004374F4    jmp         0043750F
 004374F6    and         esi,0FFFFFF
 004374FC    add         eax,esi
 004374FE    mov         byte ptr [eax],cl
 00437500    cmp         bl,2
>00437503    jb          0043750F
 00437505    mov         word ptr [eax],cx
 00437508    cmp         bl,4
>0043750B    jb          0043750F
 0043750D    mov         dword ptr [eax],ecx
 0043750F    pop         edi
 00437510    pop         esi
 00437511    pop         ebx
 00437512    ret
*}
end;

//00437514
function GetSetElementName(TypeInfo:PTypeInfo; Value:Integer):UnicodeString;
begin
{*
 00437514    push        ebp
 00437515    mov         ebp,esp
 00437517    push        0
 00437519    push        ebx
 0043751A    push        esi
 0043751B    push        edi
 0043751C    mov         edi,ecx
 0043751E    mov         esi,edx
 00437520    mov         ebx,eax
 00437522    xor         eax,eax
 00437524    push        ebp
 00437525    push        437588
 0043752A    push        dword ptr fs:[eax]
 0043752D    mov         dword ptr fs:[eax],esp
 00437530    movzx       eax,byte ptr [ebx]
 00437533    dec         al
>00437535    je          00437541
 00437537    dec         al
>00437539    je          0043754C
 0043753B    sub         al,7
>0043753D    je          0043754C
>0043753F    jmp         00437567
 00437541    mov         edx,edi
 00437543    mov         eax,esi
 00437545    call        IntToStr
>0043754A    jmp         00437572
 0043754C    lea         edx,[ebp-4]
 0043754F    mov         eax,esi
 00437551    call        IntToStr
 00437556    mov         ecx,dword ptr [ebp-4]
 00437559    mov         eax,edi
 0043755B    mov         edx,4375A4;'#'
 00437560    call        @UStrCat3
>00437565    jmp         00437572
 00437567    mov         ecx,edi
 00437569    mov         edx,esi
 0043756B    mov         eax,ebx
 0043756D    call        GetEnumName
 00437572    xor         eax,eax
 00437574    pop         edx
 00437575    pop         ecx
 00437576    pop         ecx
 00437577    mov         dword ptr fs:[eax],edx
 0043757A    push        43758F
 0043757F    lea         eax,[ebp-4]
 00437582    call        @UStrClr
 00437587    ret
>00437588    jmp         @HandleFinally
>0043758D    jmp         0043757F
 0043758F    pop         edi
 00437590    pop         esi
 00437591    pop         ebx
 00437592    pop         ecx
 00437593    pop         ebp
 00437594    ret
*}
end;

//004375A8
function GetSetElementValue(TypeInfo:PTypeInfo; const Name:UnicodeString):Integer;
begin
{*
 004375A8    push        ebp
 004375A9    mov         ebp,esp
 004375AB    push        0
 004375AD    push        ebx
 004375AE    push        esi
 004375AF    push        edi
 004375B0    mov         edi,edx
 004375B2    mov         ebx,eax
 004375B4    xor         eax,eax
 004375B6    push        ebp
 004375B7    push        437637
 004375BC    push        dword ptr fs:[eax]
 004375BF    mov         dword ptr fs:[eax],esp
 004375C2    mov         eax,ebx
 004375C4    call        GetTypeData
 004375C9    mov         esi,dword ptr [eax+1]
 004375CC    movzx       eax,byte ptr [ebx]
 004375CF    dec         al
>004375D1    je          004375DD
 004375D3    dec         al
>004375D5    je          004375EA
 004375D7    sub         al,7
>004375D9    je          004375EA
>004375DB    jmp         00437616
 004375DD    mov         eax,edi
 004375DF    call        StrToInt
 004375E4    mov         ebx,eax
 004375E6    sub         ebx,esi
>004375E8    jmp         00437621
 004375EA    mov         ebx,edi
 004375EC    test        ebx,ebx
>004375EE    je          004375F5
 004375F0    sub         ebx,4
 004375F3    mov         ebx,dword ptr [ebx]
 004375F5    lea         eax,[ebp-4]
 004375F8    push        eax
 004375F9    mov         ecx,ebx
 004375FB    dec         ecx
 004375FC    mov         edx,2
 00437601    mov         eax,edi
 00437603    call        @UStrCopy
 00437608    mov         eax,dword ptr [ebp-4]
 0043760B    call        StrToInt
 00437610    mov         ebx,eax
 00437612    sub         ebx,esi
>00437614    jmp         00437621
 00437616    mov         edx,edi
 00437618    mov         eax,ebx
 0043761A    call        GetEnumValue
 0043761F    mov         ebx,eax
 00437621    xor         eax,eax
 00437623    pop         edx
 00437624    pop         ecx
 00437625    pop         ecx
 00437626    mov         dword ptr fs:[eax],edx
 00437629    push        43763E
 0043762E    lea         eax,[ebp-4]
 00437631    call        @UStrClr
 00437636    ret
>00437637    jmp         @HandleFinally
>0043763C    jmp         0043762E
 0043763E    mov         eax,ebx
 00437640    pop         edi
 00437641    pop         esi
 00437642    pop         ebx
 00437643    pop         ecx
 00437644    pop         ebp
 00437645    ret
*}
end;

//00437648
function GetObjectProp(Instance:TObject; PropInfo:PPropInfo; MinClass:TClass):TObject;
begin
{*
 00437648    push        ebx
 00437649    push        esi
 0043764A    push        edi
 0043764B    mov         esi,ecx
 0043764D    mov         edi,edx
 0043764F    mov         ebx,eax
 00437651    mov         edx,edi
 00437653    mov         eax,ebx
 00437655    call        GetOrdProp
 0043765A    mov         ebx,eax
 0043765C    test        ebx,ebx
>0043765E    je          00437673
 00437660    test        esi,esi
>00437662    je          00437673
 00437664    mov         eax,ebx
 00437666    mov         edx,esi
 00437668    call        @IsClass
 0043766D    test        al,al
>0043766F    jne         00437673
 00437671    xor         ebx,ebx
 00437673    mov         eax,ebx
 00437675    pop         edi
 00437676    pop         esi
 00437677    pop         ebx
 00437678    ret
*}
end;

//0043767C
procedure SetObjectProp(Instance:TObject; PropInfo:PPropInfo; Value:TObject; ValidateClass:Boolean);
begin
{*
 0043767C    push        ebp
 0043767D    mov         ebp,esp
 0043767F    push        ebx
 00437680    push        esi
 00437681    push        edi
 00437682    mov         ebx,ecx
 00437684    mov         esi,edx
 00437686    mov         edi,eax
 00437688    test        ebx,ebx
>0043768A    je          004376A6
 0043768C    cmp         byte ptr [ebp+8],0
>00437690    je          004376A6
 00437692    mov         eax,esi
 00437694    call        GetObjectPropClass
 00437699    mov         edx,eax
 0043769B    mov         eax,ebx
 0043769D    call        @IsClass
 004376A2    test        al,al
>004376A4    je          004376B1
 004376A6    mov         ecx,ebx
 004376A8    mov         edx,esi
 004376AA    mov         eax,edi
 004376AC    call        SetOrdProp
 004376B1    pop         edi
 004376B2    pop         esi
 004376B3    pop         ebx
 004376B4    pop         ebp
 004376B5    ret         4
*}
end;

//004376B8
function GetObjectPropClass(PropInfo:PPropInfo):TClass;
begin
{*
 004376B8    mov         eax,dword ptr [eax]
 004376BA    mov         eax,dword ptr [eax]
 004376BC    call        GetTypeData
 004376C1    test        eax,eax
>004376C3    jne         004376DC
 004376C5    mov         ecx,dword ptr ds:[78D528];^SResString128:TResStringRec
 004376CB    mov         dl,1
 004376CD    mov         eax,[0043686C];EPropertyError
 004376D2    call        Exception.CreateRes
 004376D7    call        @RaiseExcept
 004376DC    mov         eax,dword ptr [eax]
 004376DE    ret
*}
end;

//004376E0
procedure GetShortStrProp(Instance:TObject; PropInfo:PPropInfo; var Value:ShortString; const _Dv_:$0..-$1);
begin
{*
 004376E0    push        ebp
 004376E1    mov         ebp,esp
 004376E3    push        esi
 004376E4    push        edi
 004376E5    mov         edi,edx
 004376E7    mov         edx,dword ptr [edi+10]
 004376EA    cmp         edx,80000000
>004376F0    jne         004376F4
 004376F2    mov         edx,ecx
 004376F4    mov         esi,dword ptr [edi+4]
 004376F7    cmp         byte ptr [edi+7],0FE
>004376FB    ja          0043770C
>004376FD    jb          00437708
 004376FF    movsx       esi,si
 00437702    add         esi,dword ptr [eax]
 00437704    call        dword ptr [esi]
>00437706    jmp         0043771D
 00437708    call        esi
>0043770A    jmp         0043771D
 0043770C    and         esi,0FFFFFF
 00437712    add         esi,eax
 00437714    mov         edi,ecx
 00437716    xor         ecx,ecx
 00437718    mov         cl,byte ptr [esi]
 0043771A    inc         ecx
 0043771B    rep movs    byte ptr [edi],byte ptr [esi]
 0043771D    pop         edi
 0043771E    pop         esi
 0043771F    pop         ebp
 00437720    ret         4
*}
end;

//00437724
procedure SetShortStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:ShortString);
begin
{*
 00437724    push        esi
 00437725    push        edi
 00437726    mov         esi,edx
 00437728    mov         edx,dword ptr [esi+10]
 0043772B    cmp         edx,80000000
>00437731    jne         00437735
 00437733    mov         edx,ecx
 00437735    mov         edi,dword ptr [esi+8]
 00437738    cmp         byte ptr [esi+0B],0FE
>0043773C    ja          0043774F
>0043773E    jb          0043774A
 00437740    movsx       edi,di
 00437743    add         edi,dword ptr [eax]
 00437745    call        dword ptr [edi]
 00437747    pop         edi
 00437748    pop         esi
 00437749    ret
 0043774A    call        edi
 0043774C    pop         edi
 0043774D    pop         esi
 0043774E    ret
 0043774F    and         edi,0FFFFFF
 00437755    add         edi,eax
 00437757    mov         eax,dword ptr [esi]
 00437759    mov         eax,dword ptr [eax]
 0043775B    mov         esi,ecx
 0043775D    xor         ecx,ecx
 0043775F    mov         cl,byte ptr [eax+1]
 00437762    mov         cl,byte ptr [eax+ecx+2]
 00437766    lods        byte ptr [esi]
 00437767    cmp         al,cl
>00437769    jb          0043776D
 0043776B    mov         al,cl
 0043776D    stos        byte ptr [edi]
 0043776E    mov         cl,al
 00437770    rep movs    byte ptr [edi],byte ptr [esi]
 00437772    pop         edi
 00437773    pop         esi
 00437774    ret
*}
end;

//00437778
procedure GetShortStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);
begin
{*
 00437778    push        ebx
 00437779    add         esp,0FFFFFF00
 0043777F    mov         ebx,ecx
 00437781    push        0FF
 00437786    lea         ecx,[esp+4]
 0043778A    call        GetShortStrProp
 0043778F    mov         eax,ebx
 00437791    mov         edx,esp
 00437793    mov         ecx,0
 00437798    call        @LStrFromString
 0043779D    add         esp,100
 004377A3    pop         ebx
 004377A4    ret
*}
end;

//004377A8
procedure SetShortStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);
begin
{*
 004377A8    push        ebx
 004377A9    push        esi
 004377AA    push        edi
 004377AB    add         esp,0FFFFFF00
 004377B1    mov         edi,ecx
 004377B3    mov         esi,edx
 004377B5    mov         ebx,eax
 004377B7    mov         eax,esp
 004377B9    mov         edx,edi
 004377BB    mov         ecx,0FF
 004377C0    call        @LStrToString
 004377C5    mov         ecx,esp
 004377C7    mov         edx,esi
 004377C9    mov         eax,ebx
 004377CB    call        SetShortStrProp
 004377D0    add         esp,100
 004377D6    pop         edi
 004377D7    pop         esi
 004377D8    pop         ebx
 004377D9    ret
*}
end;

//004377DC
procedure GetLongStrProp(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);
begin
{*
 004377DC    push        esi
 004377DD    push        edi
 004377DE    mov         edi,edx
 004377E0    mov         edx,dword ptr [edi+10]
 004377E3    cmp         edx,80000000
>004377E9    jne         004377ED
 004377EB    mov         edx,ecx
 004377ED    mov         esi,dword ptr [edi+4]
 004377F0    cmp         byte ptr [edi+7],0FE
>004377F4    ja          00437807
>004377F6    jb          00437802
 004377F8    movsx       esi,si
 004377FB    add         esi,dword ptr [eax]
 004377FD    call        dword ptr [esi]
 004377FF    pop         edi
 00437800    pop         esi
 00437801    ret
 00437802    call        esi
 00437804    pop         edi
 00437805    pop         esi
 00437806    ret
 00437807    and         esi,0FFFFFF
 0043780D    mov         edx,dword ptr [esi+eax]
 00437810    mov         eax,ecx
 00437812    call        @LStrAsg
 00437817    pop         edi
 00437818    pop         esi
 00437819    ret
*}
end;

//0043781C
procedure SetLongStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);
begin
{*
 0043781C    push        esi
 0043781D    push        edi
 0043781E    mov         esi,edx
 00437820    mov         edx,dword ptr [esi+10]
 00437823    cmp         edx,80000000
>00437829    jne         0043782D
 0043782B    mov         edx,ecx
 0043782D    mov         edi,dword ptr [esi+8]
 00437830    cmp         byte ptr [esi+0B],0FE
>00437834    ja          00437847
>00437836    jb          00437842
 00437838    movsx       edi,di
 0043783B    add         edi,dword ptr [eax]
 0043783D    call        dword ptr [edi]
 0043783F    pop         edi
 00437840    pop         esi
 00437841    ret
 00437842    call        edi
 00437844    pop         edi
 00437845    pop         esi
 00437846    ret
 00437847    and         edi,0FFFFFF
 0043784D    add         eax,edi
 0043784F    mov         edx,ecx
 00437851    call        @LStrAsg
 00437856    pop         edi
 00437857    pop         esi
 00437858    ret
*}
end;

//0043785C
procedure GetWideStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);
begin
{*
 0043785C    push        ebp
 0043785D    mov         ebp,esp
 0043785F    push        0
 00437861    push        ebx
 00437862    push        esi
 00437863    push        edi
 00437864    mov         edi,ecx
 00437866    mov         esi,edx
 00437868    mov         ebx,eax
 0043786A    xor         eax,eax
 0043786C    push        ebp
 0043786D    push        4378A9
 00437872    push        dword ptr fs:[eax]
 00437875    mov         dword ptr fs:[eax],esp
 00437878    lea         ecx,[ebp-4]
 0043787B    mov         edx,esi
 0043787D    mov         eax,ebx
 0043787F    call        GetWideStrProp
 00437884    mov         edx,dword ptr [ebp-4]
 00437887    mov         eax,edi
 00437889    mov         ecx,0
 0043788E    call        @LStrFromWStr
 00437893    xor         eax,eax
 00437895    pop         edx
 00437896    pop         ecx
 00437897    pop         ecx
 00437898    mov         dword ptr fs:[eax],edx
 0043789B    push        4378B0
 004378A0    lea         eax,[ebp-4]
 004378A3    call        @WStrClr
 004378A8    ret
>004378A9    jmp         @HandleFinally
>004378AE    jmp         004378A0
 004378B0    pop         edi
 004378B1    pop         esi
 004378B2    pop         ebx
 004378B3    pop         ecx
 004378B4    pop         ebp
 004378B5    ret
*}
end;

//004378B8
procedure SetWideStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);
begin
{*
 004378B8    push        ebp
 004378B9    mov         ebp,esp
 004378BB    push        0
 004378BD    push        ebx
 004378BE    push        esi
 004378BF    push        edi
 004378C0    mov         edi,ecx
 004378C2    mov         esi,edx
 004378C4    mov         ebx,eax
 004378C6    xor         eax,eax
 004378C8    push        ebp
 004378C9    push        437900
 004378CE    push        dword ptr fs:[eax]
 004378D1    mov         dword ptr fs:[eax],esp
 004378D4    lea         eax,[ebp-4]
 004378D7    mov         edx,edi
 004378D9    call        @WStrFromLStr
 004378DE    mov         ecx,dword ptr [ebp-4]
 004378E1    mov         edx,esi
 004378E3    mov         eax,ebx
 004378E5    call        SetWideStrProp
 004378EA    xor         eax,eax
 004378EC    pop         edx
 004378ED    pop         ecx
 004378EE    pop         ecx
 004378EF    mov         dword ptr fs:[eax],edx
 004378F2    push        437907
 004378F7    lea         eax,[ebp-4]
 004378FA    call        @WStrClr
 004378FF    ret
>00437900    jmp         @HandleFinally
>00437905    jmp         004378F7
 00437907    pop         edi
 00437908    pop         esi
 00437909    pop         ebx
 0043790A    pop         ecx
 0043790B    pop         ebp
 0043790C    ret
*}
end;

//00437910
procedure GetUnicodeStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);
begin
{*
 00437910    push        ebp
 00437911    mov         ebp,esp
 00437913    push        0
 00437915    push        ebx
 00437916    push        esi
 00437917    push        edi
 00437918    mov         edi,ecx
 0043791A    mov         esi,edx
 0043791C    mov         ebx,eax
 0043791E    xor         eax,eax
 00437920    push        ebp
 00437921    push        43795D
 00437926    push        dword ptr fs:[eax]
 00437929    mov         dword ptr fs:[eax],esp
 0043792C    lea         ecx,[ebp-4]
 0043792F    mov         edx,esi
 00437931    mov         eax,ebx
 00437933    call        GetUnicodeStrProp
 00437938    mov         edx,dword ptr [ebp-4]
 0043793B    mov         eax,edi
 0043793D    mov         ecx,0
 00437942    call        @LStrFromUStr
 00437947    xor         eax,eax
 00437949    pop         edx
 0043794A    pop         ecx
 0043794B    pop         ecx
 0043794C    mov         dword ptr fs:[eax],edx
 0043794F    push        437964
 00437954    lea         eax,[ebp-4]
 00437957    call        @UStrClr
 0043795C    ret
>0043795D    jmp         @HandleFinally
>00437962    jmp         00437954
 00437964    pop         edi
 00437965    pop         esi
 00437966    pop         ebx
 00437967    pop         ecx
 00437968    pop         ebp
 00437969    ret
*}
end;

//0043796C
procedure SetUnicodeStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);
begin
{*
 0043796C    push        ebp
 0043796D    mov         ebp,esp
 0043796F    push        0
 00437971    push        ebx
 00437972    push        esi
 00437973    push        edi
 00437974    mov         edi,ecx
 00437976    mov         esi,edx
 00437978    mov         ebx,eax
 0043797A    xor         eax,eax
 0043797C    push        ebp
 0043797D    push        4379B4
 00437982    push        dword ptr fs:[eax]
 00437985    mov         dword ptr fs:[eax],esp
 00437988    lea         eax,[ebp-4]
 0043798B    mov         edx,edi
 0043798D    call        @UStrFromLStr
 00437992    mov         ecx,dword ptr [ebp-4]
 00437995    mov         edx,esi
 00437997    mov         eax,ebx
 00437999    call        SetUnicodeStrProp
 0043799E    xor         eax,eax
 004379A0    pop         edx
 004379A1    pop         ecx
 004379A2    pop         ecx
 004379A3    mov         dword ptr fs:[eax],edx
 004379A6    push        4379BB
 004379AB    lea         eax,[ebp-4]
 004379AE    call        @UStrClr
 004379B3    ret
>004379B4    jmp         @HandleFinally
>004379B9    jmp         004379AB
 004379BB    pop         edi
 004379BC    pop         esi
 004379BD    pop         ebx
 004379BE    pop         ecx
 004379BF    pop         ebp
 004379C0    ret
*}
end;

//004379C4
function GetAnsiStrProp(Instance:TObject; PropInfo:PPropInfo):AnsiString;
begin
{*
 004379C4    push        ebx
 004379C5    mov         ebx,ecx
 004379C7    mov         ecx,dword ptr [edx]
 004379C9    mov         ecx,dword ptr [ecx]
 004379CB    movzx       ecx,byte ptr [ecx]
 004379CE    sub         cl,5
>004379D1    je          004379E3
 004379D3    sub         cl,5
>004379D6    je          004379EC
 004379D8    dec         cl
>004379DA    je          004379F5
 004379DC    sub         cl,7
>004379DF    je          004379FE
>004379E1    jmp         00437A07
 004379E3    mov         ecx,ebx
 004379E5    call        GetShortStrPropAsLongStr
 004379EA    pop         ebx
 004379EB    ret
 004379EC    mov         ecx,ebx
 004379EE    call        GetLongStrProp
 004379F3    pop         ebx
 004379F4    ret
 004379F5    mov         ecx,ebx
 004379F7    call        GetWideStrPropAsLongStr
 004379FC    pop         ebx
 004379FD    ret
 004379FE    mov         ecx,ebx
 00437A00    call        GetUnicodeStrPropAsLongStr
 00437A05    pop         ebx
 00437A06    ret
 00437A07    mov         eax,ebx
 00437A09    call        @LStrClr
 00437A0E    pop         ebx
 00437A0F    ret
*}
end;

//00437A10
procedure SetAnsiStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);
begin
{*
 00437A10    push        ebx
 00437A11    mov         ebx,dword ptr [edx]
 00437A13    mov         ebx,dword ptr [ebx]
 00437A15    movzx       ebx,byte ptr [ebx]
 00437A18    sub         bl,5
>00437A1B    je          00437A2D
 00437A1D    sub         bl,5
>00437A20    je          00437A34
 00437A22    dec         bl
>00437A24    je          00437A3B
 00437A26    sub         bl,7
>00437A29    je          00437A42
>00437A2B    jmp         00437A47
 00437A2D    call        SetShortStrPropAsLongStr
 00437A32    pop         ebx
 00437A33    ret
 00437A34    call        SetLongStrProp
 00437A39    pop         ebx
 00437A3A    ret
 00437A3B    call        SetWideStrPropAsLongStr
 00437A40    pop         ebx
 00437A41    ret
 00437A42    call        SetUnicodeStrPropAsLongStr
 00437A47    pop         ebx
 00437A48    ret
*}
end;

//00437A4C
function GetWideStrProp(Instance:TObject; PropInfo:PPropInfo):WideString;
begin
{*
 00437A4C    push        ebp
 00437A4D    mov         ebp,esp
 00437A4F    add         esp,0FFFFFFEC
 00437A52    push        ebx
 00437A53    push        esi
 00437A54    xor         ebx,ebx
 00437A56    mov         dword ptr [ebp-14],ebx
 00437A59    mov         dword ptr [ebp-4],ebx
 00437A5C    mov         esi,ecx
 00437A5E    mov         ebx,edx
 00437A60    mov         dword ptr [ebp-8],eax
 00437A63    xor         eax,eax
 00437A65    push        ebp
 00437A66    push        437B52
 00437A6B    push        dword ptr fs:[eax]
 00437A6E    mov         dword ptr fs:[eax],esp
 00437A71    mov         eax,dword ptr [ebx]
 00437A73    mov         eax,dword ptr [eax]
 00437A75    movzx       eax,byte ptr [eax]
 00437A78    sub         al,5
>00437A7A    je          00437A8D
 00437A7C    sub         al,5
>00437A7E    je          00437A8D
 00437A80    dec         al
>00437A82    je          00437AC2
 00437A84    sub         al,7
>00437A86    je          00437AA9
>00437A88    jmp         00437B2D
 00437A8D    lea         ecx,[ebp-4]
 00437A90    mov         edx,ebx
 00437A92    mov         eax,dword ptr [ebp-8]
 00437A95    call        GetUnicodeStrProp
 00437A9A    mov         eax,esi
 00437A9C    mov         edx,dword ptr [ebp-4]
 00437A9F    call        @WStrFromUStr
>00437AA4    jmp         00437B34
 00437AA9    lea         ecx,[ebp-14]
 00437AAC    mov         edx,ebx
 00437AAE    mov         eax,dword ptr [ebp-8]
 00437AB1    call        GetUnicodeStrProp
 00437AB6    mov         edx,dword ptr [ebp-14]
 00437AB9    mov         eax,esi
 00437ABB    call        @WStrFromUStr
>00437AC0    jmp         00437B34
 00437AC2    mov         eax,dword ptr [ebx+4]
 00437AC5    mov         edx,eax
 00437AC7    and         edx,0FF000000
 00437ACD    cmp         edx,0FF000000
>00437AD3    jne         00437AEB
 00437AD5    mov         ebx,eax
 00437AD7    and         ebx,0FFFFFF
 00437ADD    add         ebx,dword ptr [ebp-8]
 00437AE0    mov         eax,esi
 00437AE2    mov         edx,dword ptr [ebx]
 00437AE4    call        @WStrAsg
>00437AE9    jmp         00437B34
 00437AEB    cmp         edx,0FE000000
>00437AF1    jne         00437B04
 00437AF3    mov         edx,dword ptr [ebp-8]
 00437AF6    mov         edx,dword ptr [edx]
 00437AF8    movsx       eax,ax
 00437AFB    add         edx,eax
 00437AFD    mov         eax,dword ptr [edx]
 00437AFF    mov         dword ptr [ebp-10],eax
>00437B02    jmp         00437B07
 00437B04    mov         dword ptr [ebp-10],eax
 00437B07    mov         eax,dword ptr [ebp-8]
 00437B0A    mov         dword ptr [ebp-0C],eax
 00437B0D    cmp         dword ptr [ebx+10],80000000
>00437B14    jne         00437B20
 00437B16    mov         edx,esi
 00437B18    mov         eax,dword ptr [ebp-0C]
 00437B1B    call        dword ptr [ebp-10]
>00437B1E    jmp         00437B34
 00437B20    mov         ecx,esi
 00437B22    mov         edx,dword ptr [ebx+10]
 00437B25    mov         eax,dword ptr [ebp-0C]
 00437B28    call        dword ptr [ebp-10]
>00437B2B    jmp         00437B34
 00437B2D    mov         eax,esi
 00437B2F    call        @WStrClr
 00437B34    xor         eax,eax
 00437B36    pop         edx
 00437B37    pop         ecx
 00437B38    pop         ecx
 00437B39    mov         dword ptr fs:[eax],edx
 00437B3C    push        437B59
 00437B41    lea         eax,[ebp-14]
 00437B44    call        @UStrClr
 00437B49    lea         eax,[ebp-4]
 00437B4C    call        @UStrClr
 00437B51    ret
>00437B52    jmp         @HandleFinally
>00437B57    jmp         00437B41
 00437B59    pop         esi
 00437B5A    pop         ebx
 00437B5B    mov         esp,ebp
 00437B5D    pop         ebp
 00437B5E    ret
*}
end;

//00437B60
procedure SetWideStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:WideString);
begin
{*
 00437B60    push        ebp
 00437B61    mov         ebp,esp
 00437B63    add         esp,0FFFFFFF0
 00437B66    push        ebx
 00437B67    push        esi
 00437B68    push        edi
 00437B69    xor         ebx,ebx
 00437B6B    mov         dword ptr [ebp-10],ebx
 00437B6E    mov         dword ptr [ebp-0C],ebx
 00437B71    mov         edi,ecx
 00437B73    mov         ebx,edx
 00437B75    mov         esi,eax
 00437B77    xor         eax,eax
 00437B79    push        ebp
 00437B7A    push        437C4E
 00437B7F    push        dword ptr fs:[eax]
 00437B82    mov         dword ptr fs:[eax],esp
 00437B85    mov         eax,dword ptr [ebx]
 00437B87    mov         eax,dword ptr [eax]
 00437B89    movzx       eax,byte ptr [eax]
 00437B8C    sub         al,5
>00437B8E    je          00437BA1
 00437B90    sub         al,5
>00437B92    je          00437BA1
 00437B94    dec         al
>00437B96    je          00437BD1
 00437B98    sub         al,7
>00437B9A    je          00437BB9
>00437B9C    jmp         00437C33
 00437BA1    lea         eax,[ebp-0C]
 00437BA4    mov         edx,edi
 00437BA6    call        @UStrFromWStr
 00437BAB    mov         ecx,dword ptr [ebp-0C]
 00437BAE    mov         edx,ebx
 00437BB0    mov         eax,esi
 00437BB2    call        SetUnicodeStrProp
>00437BB7    jmp         00437C33
 00437BB9    lea         eax,[ebp-10]
 00437BBC    mov         edx,edi
 00437BBE    call        @UStrFromWStr
 00437BC3    mov         ecx,dword ptr [ebp-10]
 00437BC6    mov         edx,ebx
 00437BC8    mov         eax,esi
 00437BCA    call        SetUnicodeStrProp
>00437BCF    jmp         00437C33
 00437BD1    mov         eax,dword ptr [ebx+8]
 00437BD4    mov         edx,eax
 00437BD6    and         edx,0FF000000
 00437BDC    cmp         edx,0FF000000
>00437BE2    jne         00437BF9
 00437BE4    mov         ebx,eax
 00437BE6    and         ebx,0FFFFFF
 00437BEC    add         ebx,esi
 00437BEE    mov         eax,ebx
 00437BF0    mov         edx,edi
 00437BF2    call        @WStrAsg
>00437BF7    jmp         00437C33
 00437BF9    cmp         edx,0FE000000
>00437BFF    jne         00437C0F
 00437C01    mov         edx,dword ptr [esi]
 00437C03    movsx       eax,ax
 00437C06    add         edx,eax
 00437C08    mov         eax,dword ptr [edx]
 00437C0A    mov         dword ptr [ebp-8],eax
>00437C0D    jmp         00437C12
 00437C0F    mov         dword ptr [ebp-8],eax
 00437C12    mov         dword ptr [ebp-4],esi
 00437C15    mov         eax,dword ptr [ebx+10]
 00437C18    cmp         eax,80000000
>00437C1D    jne         00437C29
 00437C1F    mov         edx,edi
 00437C21    mov         eax,dword ptr [ebp-4]
 00437C24    call        dword ptr [ebp-8]
>00437C27    jmp         00437C33
 00437C29    mov         ecx,edi
 00437C2B    mov         edx,eax
 00437C2D    mov         eax,dword ptr [ebp-4]
 00437C30    call        dword ptr [ebp-8]
 00437C33    xor         eax,eax
 00437C35    pop         edx
 00437C36    pop         ecx
 00437C37    pop         ecx
 00437C38    mov         dword ptr fs:[eax],edx
 00437C3B    push        437C55
 00437C40    lea         eax,[ebp-10]
 00437C43    mov         edx,2
 00437C48    call        @UStrArrayClr
 00437C4D    ret
>00437C4E    jmp         @HandleFinally
>00437C53    jmp         00437C40
 00437C55    pop         edi
 00437C56    pop         esi
 00437C57    pop         ebx
 00437C58    mov         esp,ebp
 00437C5A    pop         ebp
 00437C5B    ret
*}
end;

//00437C5C
function GetUnicodeStrProp(Instance:TObject; PropInfo:PPropInfo):UnicodeString;
begin
{*
 00437C5C    push        ebp
 00437C5D    mov         ebp,esp
 00437C5F    add         esp,0FFFFFFEC
 00437C62    push        ebx
 00437C63    push        esi
 00437C64    xor         ebx,ebx
 00437C66    mov         dword ptr [ebp-14],ebx
 00437C69    mov         dword ptr [ebp-10],ebx
 00437C6C    mov         esi,ecx
 00437C6E    mov         ebx,edx
 00437C70    mov         dword ptr [ebp-4],eax
 00437C73    xor         eax,eax
 00437C75    push        ebp
 00437C76    push        437D62
 00437C7B    push        dword ptr fs:[eax]
 00437C7E    mov         dword ptr fs:[eax],esp
 00437C81    mov         eax,dword ptr [ebx]
 00437C83    mov         eax,dword ptr [eax]
 00437C85    movzx       eax,byte ptr [eax]
 00437C88    sub         al,5
>00437C8A    je          00437C9D
 00437C8C    sub         al,5
>00437C8E    je          00437C9D
 00437C90    dec         al
>00437C92    je          00437CB9
 00437C94    sub         al,7
>00437C96    je          00437CD2
>00437C98    jmp         00437D3D
 00437C9D    lea         ecx,[ebp-10]
 00437CA0    mov         edx,ebx
 00437CA2    mov         eax,dword ptr [ebp-4]
 00437CA5    call        GetAnsiStrProp
 00437CAA    mov         edx,dword ptr [ebp-10]
 00437CAD    mov         eax,esi
 00437CAF    call        @UStrFromLStr
>00437CB4    jmp         00437D44
 00437CB9    lea         ecx,[ebp-14]
 00437CBC    mov         edx,ebx
 00437CBE    mov         eax,dword ptr [ebp-4]
 00437CC1    call        GetWideStrProp
 00437CC6    mov         edx,dword ptr [ebp-14]
 00437CC9    mov         eax,esi
 00437CCB    call        @UStrFromWStr
>00437CD0    jmp         00437D44
 00437CD2    mov         eax,dword ptr [ebx+4]
 00437CD5    mov         edx,eax
 00437CD7    and         edx,0FF000000
 00437CDD    cmp         edx,0FF000000
>00437CE3    jne         00437CFB
 00437CE5    mov         ebx,eax
 00437CE7    and         ebx,0FFFFFF
 00437CED    add         ebx,dword ptr [ebp-4]
 00437CF0    mov         eax,esi
 00437CF2    mov         edx,dword ptr [ebx]
 00437CF4    call        @UStrAsg
>00437CF9    jmp         00437D44
 00437CFB    cmp         edx,0FE000000
>00437D01    jne         00437D14
 00437D03    mov         edx,dword ptr [ebp-4]
 00437D06    mov         edx,dword ptr [edx]
 00437D08    movsx       eax,ax
 00437D0B    add         edx,eax
 00437D0D    mov         eax,dword ptr [edx]
 00437D0F    mov         dword ptr [ebp-0C],eax
>00437D12    jmp         00437D17
 00437D14    mov         dword ptr [ebp-0C],eax
 00437D17    mov         eax,dword ptr [ebp-4]
 00437D1A    mov         dword ptr [ebp-8],eax
 00437D1D    cmp         dword ptr [ebx+10],80000000
>00437D24    jne         00437D30
 00437D26    mov         edx,esi
 00437D28    mov         eax,dword ptr [ebp-8]
 00437D2B    call        dword ptr [ebp-0C]
>00437D2E    jmp         00437D44
 00437D30    mov         ecx,esi
 00437D32    mov         edx,dword ptr [ebx+10]
 00437D35    mov         eax,dword ptr [ebp-8]
 00437D38    call        dword ptr [ebp-0C]
>00437D3B    jmp         00437D44
 00437D3D    mov         eax,esi
 00437D3F    call        @UStrClr
 00437D44    xor         eax,eax
 00437D46    pop         edx
 00437D47    pop         ecx
 00437D48    pop         ecx
 00437D49    mov         dword ptr fs:[eax],edx
 00437D4C    push        437D69
 00437D51    lea         eax,[ebp-14]
 00437D54    call        @WStrClr
 00437D59    lea         eax,[ebp-10]
 00437D5C    call        @LStrClr
 00437D61    ret
>00437D62    jmp         @HandleFinally
>00437D67    jmp         00437D51
 00437D69    pop         esi
 00437D6A    pop         ebx
 00437D6B    mov         esp,ebp
 00437D6D    pop         ebp
 00437D6E    ret
*}
end;

//00437D70
procedure SetRawByteStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:UnicodeString);
begin
{*
 00437D70    push        ebp
 00437D71    mov         ebp,esp
 00437D73    add         esp,0FFFFFFEC
 00437D76    push        ebx
 00437D77    push        esi
 00437D78    push        edi
 00437D79    xor         ebx,ebx
 00437D7B    mov         dword ptr [ebp-14],ebx
 00437D7E    mov         dword ptr [ebp-4],ebx
 00437D81    mov         esi,ecx
 00437D83    mov         dword ptr [ebp-0C],edx
 00437D86    mov         dword ptr [ebp-8],eax
 00437D89    xor         eax,eax
 00437D8B    push        ebp
 00437D8C    push        437E6E
 00437D91    push        dword ptr fs:[eax]
 00437D94    mov         dword ptr fs:[eax],esp
 00437D97    mov         eax,dword ptr [ebp-0C]
 00437D9A    mov         eax,dword ptr [eax]
 00437D9C    mov         eax,dword ptr [eax]
 00437D9E    call        GetTypeData
 00437DA3    mov         ebx,eax
 00437DA5    cmp         word ptr [ebx],0
>00437DA9    je          00437E33
 00437DAF    mov         edi,esi
 00437DB1    test        edi,edi
>00437DB3    je          00437DBA
 00437DB5    sub         edi,4
 00437DB8    mov         edi,dword ptr [edi]
 00437DBA    push        edi
 00437DBB    push        0
 00437DBD    push        0
 00437DBF    push        0
 00437DC1    push        0
 00437DC3    mov         eax,esi
 00437DC5    call        @UStrToPWChar
 00437DCA    mov         ecx,eax
 00437DCC    movzx       eax,word ptr [ebx]
 00437DCF    xor         edx,edx
 00437DD1    call        LocaleCharsFromUnicode
 00437DD6    mov         dword ptr [ebp-10],eax
 00437DD9    lea         eax,[ebp-4]
 00437DDC    xor         ecx,ecx
 00437DDE    mov         edx,dword ptr [ebp-10]
 00437DE1    call        @LStrSetLength
 00437DE6    mov         edi,esi
 00437DE8    test        edi,edi
>00437DEA    je          00437DF1
 00437DEC    sub         edi,4
 00437DEF    mov         edi,dword ptr [edi]
 00437DF1    push        edi
 00437DF2    mov         eax,dword ptr [ebp-4]
 00437DF5    call        @LStrToPChar
 00437DFA    push        eax
 00437DFB    mov         eax,dword ptr [ebp-10]
 00437DFE    push        eax
 00437DFF    push        0
 00437E01    push        0
 00437E03    mov         eax,esi
 00437E05    call        @UStrToPWChar
 00437E0A    mov         ecx,eax
 00437E0C    movzx       eax,word ptr [ebx]
 00437E0F    xor         edx,edx
 00437E11    call        LocaleCharsFromUnicode
 00437E16    lea         eax,[ebp-4]
 00437E19    xor         ecx,ecx
 00437E1B    movzx       edx,word ptr [ebx]
 00437E1E    call        SetCodePage
 00437E23    mov         ecx,dword ptr [ebp-4]
 00437E26    mov         edx,dword ptr [ebp-0C]
 00437E29    mov         eax,dword ptr [ebp-8]
 00437E2C    call        SetAnsiStrProp
>00437E31    jmp         00437E50
 00437E33    lea         eax,[ebp-14]
 00437E36    mov         edx,esi
 00437E38    mov         ecx,0
 00437E3D    call        @LStrFromUStr
 00437E42    mov         ecx,dword ptr [ebp-14]
 00437E45    mov         edx,dword ptr [ebp-0C]
 00437E48    mov         eax,dword ptr [ebp-8]
 00437E4B    call        SetAnsiStrProp
 00437E50    xor         eax,eax
 00437E52    pop         edx
 00437E53    pop         ecx
 00437E54    pop         ecx
 00437E55    mov         dword ptr fs:[eax],edx
 00437E58    push        437E75
 00437E5D    lea         eax,[ebp-14]
 00437E60    call        @LStrClr
 00437E65    lea         eax,[ebp-4]
 00437E68    call        @LStrClr
 00437E6D    ret
>00437E6E    jmp         @HandleFinally
>00437E73    jmp         00437E5D
 00437E75    pop         edi
 00437E76    pop         esi
 00437E77    pop         ebx
 00437E78    mov         esp,ebp
 00437E7A    pop         ebp
 00437E7B    ret
*}
end;

//00437E7C
procedure SetUnicodeStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:UnicodeString);
begin
{*
 00437E7C    push        ebp
 00437E7D    mov         ebp,esp
 00437E7F    add         esp,0FFFFFEF4
 00437E85    push        ebx
 00437E86    push        esi
 00437E87    push        edi
 00437E88    xor         ebx,ebx
 00437E8A    mov         dword ptr [ebp-10C],ebx
 00437E90    mov         edi,ecx
 00437E92    mov         ebx,edx
 00437E94    mov         esi,eax
 00437E96    xor         eax,eax
 00437E98    push        ebp
 00437E99    push        437F8F
 00437E9E    push        dword ptr fs:[eax]
 00437EA1    mov         dword ptr fs:[eax],esp
 00437EA4    mov         eax,dword ptr [ebx]
 00437EA6    mov         eax,dword ptr [eax]
 00437EA8    movzx       eax,byte ptr [eax]
 00437EAB    sub         al,5
>00437EAD    je          00437EC0
 00437EAF    sub         al,5
>00437EB1    je          00437EE6
 00437EB3    dec         al
>00437EB5    je          00437EF6
 00437EB7    sub         al,7
>00437EB9    je          00437F14
>00437EBB    jmp         00437F76
 00437EC0    lea         eax,[ebp-108]
 00437EC6    mov         edx,edi
 00437EC8    mov         ecx,0FF
 00437ECD    call        @UStrToString
 00437ED2    lea         ecx,[ebp-108]
 00437ED8    mov         edx,ebx
 00437EDA    mov         eax,esi
 00437EDC    call        SetShortStrProp
>00437EE1    jmp         00437F76
 00437EE6    mov         ecx,edi
 00437EE8    mov         edx,ebx
 00437EEA    mov         eax,esi
 00437EEC    call        SetRawByteStrProp
>00437EF1    jmp         00437F76
 00437EF6    lea         eax,[ebp-10C]
 00437EFC    mov         edx,edi
 00437EFE    call        @WStrFromUStr
 00437F03    mov         ecx,dword ptr [ebp-10C]
 00437F09    mov         edx,ebx
 00437F0B    mov         eax,esi
 00437F0D    call        SetWideStrProp
>00437F12    jmp         00437F76
 00437F14    mov         eax,dword ptr [ebx+8]
 00437F17    mov         edx,eax
 00437F19    and         edx,0FF000000
 00437F1F    cmp         edx,0FF000000
>00437F25    jne         00437F3C
 00437F27    mov         ebx,eax
 00437F29    and         ebx,0FFFFFF
 00437F2F    add         ebx,esi
 00437F31    mov         eax,ebx
 00437F33    mov         edx,edi
 00437F35    call        @UStrAsg
>00437F3A    jmp         00437F76
 00437F3C    cmp         edx,0FE000000
>00437F42    jne         00437F52
 00437F44    mov         edx,dword ptr [esi]
 00437F46    movsx       eax,ax
 00437F49    add         edx,eax
 00437F4B    mov         eax,dword ptr [edx]
 00437F4D    mov         dword ptr [ebp-8],eax
>00437F50    jmp         00437F55
 00437F52    mov         dword ptr [ebp-8],eax
 00437F55    mov         dword ptr [ebp-4],esi
 00437F58    mov         eax,dword ptr [ebx+10]
 00437F5B    cmp         eax,80000000
>00437F60    jne         00437F6C
 00437F62    mov         edx,edi
 00437F64    mov         eax,dword ptr [ebp-4]
 00437F67    call        dword ptr [ebp-8]
>00437F6A    jmp         00437F76
 00437F6C    mov         ecx,edi
 00437F6E    mov         edx,eax
 00437F70    mov         eax,dword ptr [ebp-4]
 00437F73    call        dword ptr [ebp-8]
 00437F76    xor         eax,eax
 00437F78    pop         edx
 00437F79    pop         ecx
 00437F7A    pop         ecx
 00437F7B    mov         dword ptr fs:[eax],edx
 00437F7E    push        437F96
 00437F83    lea         eax,[ebp-10C]
 00437F89    call        @WStrClr
 00437F8E    ret
>00437F8F    jmp         @HandleFinally
>00437F94    jmp         00437F83
 00437F96    pop         edi
 00437F97    pop         esi
 00437F98    pop         ebx
 00437F99    mov         esp,ebp
 00437F9B    pop         ebp
 00437F9C    ret
*}
end;

//00437FA0
function GetFloatProp(Instance:TObject; PropInfo:PPropInfo):Extended;
begin
{*
 00437FA0    push        ebx
 00437FA1    push        esi
 00437FA2    add         esp,0FFFFFFEC
 00437FA5    mov         ebx,edx
 00437FA7    mov         edx,dword ptr [ebx+4]
 00437FAA    mov         ecx,edx
 00437FAC    and         ecx,0FF000000
 00437FB2    cmp         ecx,0FF000000
>00437FB8    jne         0043804A
 00437FBE    mov         esi,edx
 00437FC0    and         esi,0FFFFFF
 00437FC6    add         esi,eax
 00437FC8    mov         eax,dword ptr [ebx]
 00437FCA    mov         eax,dword ptr [eax]
 00437FCC    call        GetTypeData
 00437FD1    movzx       eax,byte ptr [eax]
 00437FD4    cmp         eax,4
>00437FD7    ja          0043803A
 00437FD9    jmp         dword ptr [eax*4+437FE0]
 00437FD9    dd          00437FF4
 00437FD9    dd          00437FFF
 00437FD9    dd          0043800A
 00437FD9    dd          00438024
 00437FD9    dd          0043802C
 00437FF4    fld         dword ptr [esi]
 00437FF6    fstp        tbyte ptr [esp]
 00437FF9    wait
>00437FFA    jmp         004380AA
 00437FFF    fld         qword ptr [esi]
 00438001    fstp        tbyte ptr [esp]
 00438004    wait
>00438005    jmp         004380AA
 0043800A    mov         eax,dword ptr [esi]
 0043800C    mov         dword ptr [esp],eax
 0043800F    mov         eax,dword ptr [esi+4]
 00438012    mov         dword ptr [esp+4],eax
 00438016    mov         ax,word ptr [esi+8]
 0043801A    mov         word ptr [esp+8],ax
>0043801F    jmp         004380AA
 00438024    fild        qword ptr [esi]
 00438026    fstp        tbyte ptr [esp]
 00438029    wait
>0043802A    jmp         004380AA
 0043802C    fild        qword ptr [esi]
 0043802E    fdiv        dword ptr ds:[4380B4]
 00438034    fstp        tbyte ptr [esp]
 00438037    wait
>00438038    jmp         004380AA
 0043803A    xor         eax,eax
 0043803C    mov         dword ptr [esp],eax
 0043803F    mov         dword ptr [esp+4],eax
 00438043    mov         word ptr [esp+8],ax
>00438048    jmp         004380AA
 0043804A    cmp         ecx,0FE000000
>00438050    jne         00438061
 00438052    mov         ecx,dword ptr [eax]
 00438054    movsx       edx,dx
 00438057    add         ecx,edx
 00438059    mov         edx,dword ptr [ecx]
 0043805B    mov         dword ptr [esp+0C],edx
>0043805F    jmp         00438065
 00438061    mov         dword ptr [esp+0C],edx
 00438065    mov         dword ptr [esp+10],eax
 00438069    mov         eax,dword ptr [ebx+10]
 0043806C    cmp         eax,80000000
>00438071    jne         00438081
 00438073    mov         eax,dword ptr [esp+10]
 00438077    call        dword ptr [esp+0C]
 0043807B    fstp        tbyte ptr [esp]
 0043807E    wait
>0043807F    jmp         0043808F
 00438081    mov         edx,eax
 00438083    mov         eax,dword ptr [esp+10]
 00438087    call        dword ptr [esp+0C]
 0043808B    fstp        tbyte ptr [esp]
 0043808E    wait
 0043808F    mov         eax,dword ptr [ebx]
 00438091    mov         eax,dword ptr [eax]
 00438093    call        GetTypeData
 00438098    cmp         byte ptr [eax],4
>0043809B    jne         004380AA
 0043809D    fld         tbyte ptr [esp]
 004380A0    fdiv        dword ptr ds:[4380B4]
 004380A6    fstp        tbyte ptr [esp]
 004380A9    wait
 004380AA    fld         tbyte ptr [esp]
 004380AD    add         esp,14
 004380B0    pop         esi
 004380B1    pop         ebx
 004380B2    ret
*}
end;

//004380B8
procedure SetFloatProp(Instance:TObject; PropInfo:PPropInfo; const Value:Extended);
begin
{*
 004380B8    push        ebp
 004380B9    mov         ebp,esp
 004380BB    add         esp,0FFFFFFF8
 004380BE    push        ebx
 004380BF    push        esi
 004380C0    push        edi
 004380C1    mov         esi,edx
 004380C3    mov         edi,eax
 004380C5    mov         ebx,dword ptr [esi+8]
 004380C8    mov         eax,dword ptr [esi]
 004380CA    mov         eax,dword ptr [eax]
 004380CC    call        GetTypeData
 004380D1    movzx       eax,byte ptr [eax]
 004380D4    mov         edx,ebx
 004380D6    and         edx,0FF000000
 004380DC    cmp         edx,0FF000000
>004380E2    jne         0043815F
 004380E4    mov         edx,ebx
 004380E6    and         edx,0FFFFFF
 004380EC    add         edx,edi
 004380EE    and         eax,7F
 004380F1    cmp         eax,4
>004380F4    ja          004382A3
 004380FA    jmp         dword ptr [eax*4+438101]
 004380FA    dd          00438115
 004380FA    dd          00438120
 004380FA    dd          0043812B
 004380FA    dd          00438143
 004380FA    dd          0043814E
 00438115    fld         tbyte ptr [ebp+8]
 00438118    fstp        dword ptr [edx]
 0043811A    wait
>0043811B    jmp         004382A3
 00438120    fld         tbyte ptr [ebp+8]
 00438123    fstp        qword ptr [edx]
 00438125    wait
>00438126    jmp         004382A3
 0043812B    mov         eax,dword ptr [ebp+8]
 0043812E    mov         dword ptr [edx],eax
 00438130    mov         eax,dword ptr [ebp+0C]
 00438133    mov         dword ptr [edx+4],eax
 00438136    mov         ax,word ptr [ebp+10]
 0043813A    mov         word ptr [edx+8],ax
>0043813E    jmp         004382A3
 00438143    fld         tbyte ptr [ebp+8]
 00438146    fistp       qword ptr [edx]
 00438148    wait
>00438149    jmp         004382A3
 0043814E    fld         tbyte ptr [ebp+8]
 00438151    fmul        dword ptr ds:[4382AC]
 00438157    fistp       qword ptr [edx]
 00438159    wait
>0043815A    jmp         004382A3
 0043815F    cmp         edx,0FE000000
>00438165    jne         00438175
 00438167    mov         edx,dword ptr [edi]
 00438169    movsx       ecx,bx
 0043816C    add         edx,ecx
 0043816E    mov         edx,dword ptr [edx]
 00438170    mov         dword ptr [ebp-8],edx
>00438173    jmp         00438178
 00438175    mov         dword ptr [ebp-8],ebx
 00438178    mov         dword ptr [ebp-4],edi
 0043817B    mov         edx,dword ptr [esi+10]
 0043817E    cmp         edx,80000000
>00438184    jne         00438221
 0043818A    and         eax,7F
 0043818D    cmp         eax,4
>00438190    ja          004382A3
 00438196    jmp         dword ptr [eax*4+43819D]
 00438196    dd          004381B1
 00438196    dd          004381C6
 00438196    dd          004381DB
 00438196    dd          004381F1
 00438196    dd          00438206
 004381B1    fld         tbyte ptr [ebp+8]
 004381B4    add         esp,0FFFFFFFC
 004381B7    fstp        dword ptr [esp]
 004381BA    wait
 004381BB    mov         eax,dword ptr [ebp-4]
 004381BE    call        dword ptr [ebp-8]
>004381C1    jmp         004382A3
 004381C6    fld         tbyte ptr [ebp+8]
 004381C9    add         esp,0FFFFFFF8
 004381CC    fstp        qword ptr [esp]
 004381CF    wait
 004381D0    mov         eax,dword ptr [ebp-4]
 004381D3    call        dword ptr [ebp-8]
>004381D6    jmp         004382A3
 004381DB    movzx       eax,word ptr [ebp+10]
 004381DF    push        eax
 004381E0    push        dword ptr [ebp+0C]
 004381E3    push        dword ptr [ebp+8]
 004381E6    mov         eax,dword ptr [ebp-4]
 004381E9    call        dword ptr [ebp-8]
>004381EC    jmp         004382A3
 004381F1    fld         tbyte ptr [ebp+8]
 004381F4    add         esp,0FFFFFFF8
 004381F7    fistp       qword ptr [esp]
 004381FA    wait
 004381FB    mov         eax,dword ptr [ebp-4]
 004381FE    call        dword ptr [ebp-8]
>00438201    jmp         004382A3
 00438206    fld         tbyte ptr [ebp+8]
 00438209    fmul        dword ptr ds:[4382AC]
 0043820F    add         esp,0FFFFFFF8
 00438212    fistp       qword ptr [esp]
 00438215    wait
 00438216    mov         eax,dword ptr [ebp-4]
 00438219    call        dword ptr [ebp-8]
>0043821C    jmp         004382A3
 00438221    and         eax,7F
 00438224    cmp         eax,4
>00438227    ja          004382A3
 00438229    jmp         dword ptr [eax*4+438230]
 00438229    dd          00438244
 00438229    dd          00438256
 00438229    dd          00438268
 00438229    dd          0043827B
 00438229    dd          0043828D
 00438244    fld         tbyte ptr [ebp+8]
 00438247    add         esp,0FFFFFFFC
 0043824A    fstp        dword ptr [esp]
 0043824D    wait
 0043824E    mov         eax,dword ptr [ebp-4]
 00438251    call        dword ptr [ebp-8]
>00438254    jmp         004382A3
 00438256    fld         tbyte ptr [ebp+8]
 00438259    add         esp,0FFFFFFF8
 0043825C    fstp        qword ptr [esp]
 0043825F    wait
 00438260    mov         eax,dword ptr [ebp-4]
 00438263    call        dword ptr [ebp-8]
>00438266    jmp         004382A3
 00438268    movzx       eax,word ptr [ebp+10]
 0043826C    push        eax
 0043826D    push        dword ptr [ebp+0C]
 00438270    push        dword ptr [ebp+8]
 00438273    mov         eax,dword ptr [ebp-4]
 00438276    call        dword ptr [ebp-8]
>00438279    jmp         004382A3
 0043827B    fld         tbyte ptr [ebp+8]
 0043827E    add         esp,0FFFFFFF8
 00438281    fistp       qword ptr [esp]
 00438284    wait
 00438285    mov         eax,dword ptr [ebp-4]
 00438288    call        dword ptr [ebp-8]
>0043828B    jmp         004382A3
 0043828D    fld         tbyte ptr [ebp+8]
 00438290    fmul        dword ptr ds:[4382AC]
 00438296    add         esp,0FFFFFFF8
 00438299    fistp       qword ptr [esp]
 0043829C    wait
 0043829D    mov         eax,dword ptr [ebp-4]
 004382A0    call        dword ptr [ebp-8]
 004382A3    pop         edi
 004382A4    pop         esi
 004382A5    pop         ebx
 004382A6    pop         ecx
 004382A7    pop         ecx
 004382A8    pop         ebp
 004382A9    ret         0C
*}
end;

//004382B0
procedure AssignVariant(var Dest:Variant; const Source:Variant);
begin
{*
 004382B0    push        ebx
 004382B1    push        esi
 004382B2    mov         esi,edx
 004382B4    mov         ebx,eax
 004382B6    mov         eax,ebx
 004382B8    mov         edx,esi
 004382BA    call        @VarCopy
 004382BF    pop         esi
 004382C0    pop         ebx
 004382C1    ret
*}
end;

//004382C4
function GetVariantProp(Instance:TObject; PropInfo:PPropInfo):Variant;
begin
{*
 004382C4    push        esi
 004382C5    push        edi
 004382C6    mov         edi,edx
 004382C8    mov         edx,dword ptr [edi+10]
 004382CB    cmp         edx,80000000
>004382D1    jne         004382D5
 004382D3    mov         edx,ecx
 004382D5    mov         esi,dword ptr [edi+4]
 004382D8    cmp         byte ptr [edi+7],0FE
>004382DC    ja          004382EF
>004382DE    jb          004382EA
 004382E0    movsx       esi,si
 004382E3    add         esi,dword ptr [eax]
 004382E5    call        dword ptr [esi]
 004382E7    pop         edi
 004382E8    pop         esi
 004382E9    ret
 004382EA    call        esi
 004382EC    pop         edi
 004382ED    pop         esi
 004382EE    ret
 004382EF    and         esi,0FFFFFF
 004382F5    lea         edx,[esi+eax]
 004382F8    mov         eax,ecx
 004382FA    call        AssignVariant
 004382FF    pop         edi
 00438300    pop         esi
 00438301    ret
*}
end;

//00438304
procedure SetVariantProp(Instance:TObject; PropInfo:PPropInfo; const Value:Variant);
begin
{*
 00438304    push        esi
 00438305    push        edi
 00438306    mov         esi,edx
 00438308    mov         edx,dword ptr [esi+10]
 0043830B    cmp         edx,80000000
>00438311    jne         00438315
 00438313    mov         edx,ecx
 00438315    mov         edi,dword ptr [esi+8]
 00438318    cmp         byte ptr [esi+0B],0FE
>0043831C    ja          0043832F
>0043831E    jb          0043832A
 00438320    movsx       edi,di
 00438323    add         edi,dword ptr [eax]
 00438325    call        dword ptr [edi]
 00438327    pop         edi
 00438328    pop         esi
 00438329    ret
 0043832A    call        edi
 0043832C    pop         edi
 0043832D    pop         esi
 0043832E    ret
 0043832F    and         edi,0FFFFFF
 00438335    add         eax,edi
 00438337    mov         edx,ecx
 00438339    call        AssignVariant
 0043833E    pop         edi
 0043833F    pop         esi
 00438340    ret
*}
end;

//00438344
function GetMethodProp(Instance:TObject; PropInfo:PPropInfo):TMethod;
begin
{*
 00438344    push        ebx
 00438345    push        esi
 00438346    mov         esi,edx
 00438348    mov         edx,dword ptr [esi+10]
 0043834B    cmp         edx,80000000
>00438351    jne         00438355
 00438353    mov         edx,ecx
 00438355    mov         ebx,dword ptr [esi+4]
 00438358    cmp         byte ptr [esi+7],0FE
>0043835C    ja          0043836F
>0043835E    jb          0043836A
 00438360    movsx       ebx,bx
 00438363    add         ebx,dword ptr [eax]
 00438365    call        dword ptr [ebx]
 00438367    pop         esi
 00438368    pop         ebx
 00438369    ret
 0043836A    call        ebx
 0043836C    pop         esi
 0043836D    pop         ebx
 0043836E    ret
 0043836F    and         ebx,0FFFFFF
 00438375    add         eax,ebx
 00438377    mov         edx,dword ptr [eax]
 00438379    mov         ebx,dword ptr [eax+4]
 0043837C    mov         dword ptr [ecx],edx
 0043837E    mov         dword ptr [ecx+4],ebx
 00438381    pop         esi
 00438382    pop         ebx
 00438383    ret
*}
end;

//00438384
procedure SetMethodProp(Instance:TObject; PropInfo:PPropInfo; const Value:TMethod);
begin
{*
 00438384    push        ebx
 00438385    mov         ebx,dword ptr [edx+8]
 00438388    cmp         byte ptr [edx+0B],0FE
>0043838C    ja          004383A5
 0043838E    mov         edx,dword ptr [edx+10]
 00438391    push        dword ptr [ecx+4]
 00438394    push        dword ptr [ecx]
>00438396    jb          004383A1
 00438398    movsx       ebx,bx
 0043839B    add         ebx,dword ptr [eax]
 0043839D    call        dword ptr [ebx]
 0043839F    pop         ebx
 004383A0    ret
 004383A1    call        ebx
 004383A3    pop         ebx
 004383A4    ret
 004383A5    and         ebx,0FFFFFF
 004383AB    add         eax,ebx
 004383AD    mov         edx,dword ptr [ecx]
 004383AF    mov         ebx,dword ptr [ecx+4]
 004383B2    mov         dword ptr [eax],edx
 004383B4    mov         dword ptr [eax+4],ebx
 004383B7    pop         ebx
 004383B8    ret
*}
end;

//004383BC
function GetInt64Prop(Instance:TObject; PropInfo:PPropInfo):Int64;
begin
{*
 004383BC    cmp         byte ptr [edx+7],0FE
 004383C0    mov         ecx,dword ptr [edx+4]
 004383C3    mov         edx,dword ptr [edx+10]
>004383C6    ja          004383D5
>004383C8    jb          004383D2
 004383CA    movsx       ecx,cx
 004383CD    add         ecx,dword ptr [eax]
 004383CF    call        dword ptr [ecx]
 004383D1    ret
 004383D2    call        ecx
 004383D4    ret
 004383D5    and         ecx,0FFFFFF
 004383DB    add         eax,ecx
 004383DD    mov         edx,dword ptr [eax+4]
 004383E0    mov         eax,dword ptr [eax]
 004383E2    ret
*}
end;

//004383E4
procedure SetInt64Prop(Instance:TObject; PropInfo:PPropInfo; const Value:Int64);
begin
{*
 004383E4    push        ebp
 004383E5    mov         ebp,esp
 004383E7    cmp         byte ptr [edx+0B],0FE
 004383EB    mov         ecx,dword ptr [edx+8]
>004383EE    ja          00438408
 004383F0    mov         edx,dword ptr [edx+10]
 004383F3    push        dword ptr [ebp+0C]
 004383F6    push        dword ptr [ebp+8]
>004383F9    jb          00438404
 004383FB    movsx       ecx,cx
 004383FE    add         ecx,dword ptr [eax]
 00438400    call        dword ptr [ecx]
>00438402    jmp         0043841B
 00438404    call        ecx
>00438406    jmp         0043841B
 00438408    and         ecx,0FFFFFF
 0043840E    add         eax,ecx
 00438410    mov         edx,dword ptr [ebp+8]
 00438413    mov         ecx,dword ptr [ebp+0C]
 00438416    mov         dword ptr [eax],edx
 00438418    mov         dword ptr [eax+4],ecx
 0043841B    pop         ebp
 0043841C    ret         8
*}
end;

//00438420
function GetInterfaceProp(Instance:TObject; PropInfo:PPropInfo):IInterface;
begin
{*
 00438420    push        ebx
 00438421    push        esi
 00438422    add         esp,0FFFFFFF4
 00438425    mov         dword ptr [esp],ecx
 00438428    mov         ebx,edx
 0043842A    mov         edx,dword ptr [ebx+4]
 0043842D    mov         ecx,edx
 0043842F    and         ecx,0FF000000
 00438435    cmp         ecx,0FF000000
>0043843B    jne         00438453
 0043843D    mov         ebx,edx
 0043843F    and         ebx,0FFFFFF
 00438445    add         ebx,eax
 00438447    mov         eax,dword ptr [esp]
 0043844A    mov         edx,dword ptr [ebx]
 0043844C    call        @IntfCopy
>00438451    jmp         00438497
 00438453    cmp         ecx,0FE000000
>00438459    jne         0043846A
 0043845B    mov         ecx,dword ptr [eax]
 0043845D    movsx       edx,dx
 00438460    add         ecx,edx
 00438462    mov         edx,dword ptr [ecx]
 00438464    mov         dword ptr [esp+4],edx
>00438468    jmp         0043846E
 0043846A    mov         dword ptr [esp+4],edx
 0043846E    mov         dword ptr [esp+8],eax
 00438472    mov         esi,dword ptr [ebx+10]
 00438475    cmp         esi,80000000
>0043847B    jne         0043848A
 0043847D    mov         edx,dword ptr [esp]
 00438480    mov         eax,dword ptr [esp+8]
 00438484    call        dword ptr [esp+4]
>00438488    jmp         00438497
 0043848A    mov         ecx,dword ptr [esp]
 0043848D    mov         edx,esi
 0043848F    mov         eax,dword ptr [esp+8]
 00438493    call        dword ptr [esp+4]
 00438497    add         esp,0C
 0043849A    pop         esi
 0043849B    pop         ebx
 0043849C    ret
*}
end;

//004384A0
procedure SetInterfaceProp(Instance:TObject; PropInfo:PPropInfo; const Value:IInterface);
begin
{*
 004384A0    push        ebx
 004384A1    push        esi
 004384A2    add         esp,0FFFFFFF8
 004384A5    mov         esi,ecx
 004384A7    mov         ecx,dword ptr [edx+8]
 004384AA    mov         ebx,ecx
 004384AC    and         ebx,0FF000000
 004384B2    cmp         ebx,0FF000000
>004384B8    jne         004384CF
 004384BA    mov         ebx,ecx
 004384BC    and         ebx,0FFFFFF
 004384C2    add         ebx,eax
 004384C4    mov         eax,ebx
 004384C6    mov         edx,esi
 004384C8    call        @IntfCopy
>004384CD    jmp         0043850C
 004384CF    cmp         ebx,0FE000000
>004384D5    jne         004384E5
 004384D7    mov         ebx,dword ptr [eax]
 004384D9    movsx       ecx,cx
 004384DC    add         ebx,ecx
 004384DE    mov         ecx,dword ptr [ebx]
 004384E0    mov         dword ptr [esp],ecx
>004384E3    jmp         004384E8
 004384E5    mov         dword ptr [esp],ecx
 004384E8    mov         dword ptr [esp+4],eax
 004384EC    mov         eax,dword ptr [edx+10]
 004384EF    cmp         eax,80000000
>004384F4    jne         00438501
 004384F6    mov         edx,esi
 004384F8    mov         eax,dword ptr [esp+4]
 004384FC    call        dword ptr [esp]
>004384FF    jmp         0043850C
 00438501    mov         ecx,esi
 00438503    mov         edx,eax
 00438505    mov         eax,dword ptr [esp+4]
 00438509    call        dword ptr [esp]
 0043850C    pop         ecx
 0043850D    pop         edx
 0043850E    pop         esi
 0043850F    pop         ebx
 00438510    ret
*}
end;

Initialization
Finalization
//00438514
{*
 00438514    push        ebp
 00438515    mov         ebp,esp
 00438517    xor         eax,eax
 00438519    push        ebp
 0043851A    push        43855A
 0043851F    push        dword ptr fs:[eax]
 00438522    mov         dword ptr fs:[eax],esp
 00438525    inc         dword ptr ds:[792FB8]
>0043852B    jne         0043854C
 0043852D    mov         eax,785040;^'False'
 00438532    mov         ecx,2
 00438537    mov         edx,dword ptr ds:[40128C];string
 0043853D    call        @FinalizeArray
 00438542    mov         eax,785048;^'.'
 00438547    call        @UStrClr
 0043854C    xor         eax,eax
 0043854E    pop         edx
 0043854F    pop         ecx
 00438550    pop         ecx
 00438551    mov         dword ptr fs:[eax],edx
 00438554    push        438561
 00438559    ret
>0043855A    jmp         @HandleFinally
>0043855F    jmp         00438559
 00438561    pop         ebp
 00438562    ret
*}
end.