//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit SysUtils;

interface

type
  TByteArray = array [1..32768] of Byte;
  TArray<System.Byte> = array of Byte;
//elSize = 1
//varType equivalent: varByte;
  TLangRec = TLangRec = record//size=10
f0:string;//f0
f8:string;//f8
fC:string;//fC
end;
FName:string;//f0
FLCID:Cardinal;//f4
FExt:string;//f8
FLocaleName:string;//fC
end;;
  TLanguages = class(TObject)
  published
    function IndexOf(ID:Cardinal):Integer;//00427394
    function IndexOf(LocaleName:string):Integer;//004273C4
    constructor Create();//0042730C
    destructor Destroy();//00427354
  public
    ....FSysLangs:TArray<SysUtils.TLangRec>;//f4
  end;
  Exception = class(TObject)
  published
    constructor CreateResFmtHelp(Ident:Integer; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; AHelpContext:Integer);//00424EF0
    destructor Destroy();//00425028
    constructor CreateResHelp(AHelpContext:Integer);//00424EA8
    constructor CreateResFmtHelp(ResStringRec:PResStringRec; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; AHelpContext:Integer);//00424F8C
    procedure RaiseOuterException;//004250A0
    procedure ThrowOuterException;//004250B4
    function GetBaseException:Exception;//0042506C
    function ToString:string;//00425120
    constructor CreateResHelp(AHelpContext:Integer);//00424E28
    constructor CreateRes;//00424B7C
    constructor CreateRes;//00424BF4
    constructor Create;//00424AC0
    constructor CreateFmt(const Msg:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);//00424AFC
    constructor CreateHelp(AHelpContext:Integer);//00424D58
    constructor CreateFmtHelp(const Msg:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; AHelpContext:Integer);//00424DA0
    //constructor sub_00424C30(?:?; ?:?);//00424C30
    constructor CreateResFmt(Ident:Integer; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);//00424CC4
  public
    FMessage:string;//f4
    FHelpContext:Integer;//f8
    FInnerException:Exception;//fC
    FStackInfo:Pointer;//f10
    FAcquireInnerException:Boolean;//f14
    function ToString:string; virtual;//00425120
    destructor Destroy(); virtual;//00425028
    procedure RaisingException(P:PExceptionRecord); virtual;//v0//004250C8
    function GetBaseException:Exception; virtual;//v4//0042506C
    function GetStackTrace:UnicodeString;//00425078
    procedure SetInnerException;//004250F4
    procedure SetStackInfo(AStackInfo:Pointer);//0042511C
  end;
  EArgumentException = class(Exception)
  end;
  EArgumentOutOfRangeException = class(EArgumentException)
  end;
  EPathTooLongException = class(Exception)
  end;
  ENotSupportedException = class(Exception)
  end;
  EDirectoryNotFoundException = class(Exception)
  end;
  EFileNotFoundException = class(Exception)
  end;
  EAbort = class(Exception)
  end;
  EHeapException = class(Exception)
  published
    procedure FreeInstance;//00425178
  public
    AllowFree:Boolean;//f18
    procedure FreeInstance; virtual;//00425178
    procedure RaisingException(P:PExceptionRecord); virtual;//v0//00425184
  end;
  EOutOfMemory = class(EHeapException)
  end;
  EInOutError = class(Exception)
  public
    ErrorCode:Integer;//f18
  end;
  EExternal = class(Exception)
  public
    ExceptionRecord:PExceptionRecord;//f18
  end;
  EExternalException = class(EExternal)
  end;
  EIntError = class(EExternal)
  end;
  EDivByZero = class(EIntError)
  end;
  ERangeError = class(EIntError)
  end;
  EIntOverflow = class(EIntError)
  end;
  EMathError = class(EExternal)
  end;
  EInvalidOp = class(EMathError)
  end;
  EZeroDivide = class(EMathError)
  end;
  EOverflow = class(EMathError)
  end;
  EUnderflow = class(EMathError)
  end;
  EInvalidPointer = class(EHeapException)
  end;
  EInvalidCast = class(Exception)
  end;
  EConvertError = class(Exception)
  end;
  EAccessViolation = class(EExternal)
  end;
  EPrivilege = class(EExternal)
  end;
  EStackOverflow = class(EExternal)
  end;
  EControlC = class(EExternal)
  end;
  EVariantError = class(Exception)
  end;
  EAssertionFailed = class(Exception)
  end;
  EAbstractError = class(Exception)
  end;
  EIntfCastError = class(Exception)
  end;
  EOSError = class(Exception)
  public
    ..ErrorCode:Cardinal;//f18
  end;
  ESafecallException = class(Exception)
  end;
  EMonitor = class(Exception)
  end;
  EMonitorLockException = class(EMonitor)
  end;
  ENoMonitorSupportException = class(EMonitor)
  end;
  ENotImplemented = class(Exception)
  end;
  TArray<SysUtils.TLangRec> = array of TLangRec;
//elSize = 10;
  :TFormatSettings.:1 = array [1..12] of string;
  :TFormatSettings.:2 = array [1..12] of string;
  :TFormatSettings.:3 = array [1..7] of string;
  :TFormatSettings.:4 = array [1..7] of string;
  TFormatSettings = TFormatSettings = record//size=C4
f0:string;//f0
fC:string;//fC
f10:string;//f10
f14:string;//f14
f18:string;//f18
f1C:string;//f1C
f20:string;//f20
f24::TFormatSettings.:1;//f24
f54::TFormatSettings.:2;//f54
f84::TFormatSettings.:3;//f84
fA0::TFormatSettings.:4;//fA0
end;
CurrencyString:string;//f0
CurrencyFormat:Byte;//f4
CurrencyDecimals:Byte;//f5
DateSeparator:Char;//f6
TimeSeparator:Char;//f8
ListSeparator:Char;//fA
ShortDateFormat:string;//fC
LongDateFormat:string;//f10
TimeAMString:string;//f14
TimePMString:string;//f18
ShortTimeFormat:string;//f1C
LongTimeFormat:string;//f20
ShortMonthNames::TFormatSettings.:1;//f24
LongMonthNames::TFormatSettings.:2;//f54
ShortDayNames::TFormatSettings.:3;//f84
LongDayNames::TFormatSettings.:4;//fA0
ThousandSeparator:Char;//fBC
DecimalSeparator:Char;//fBE
TwoDigitYearCenturyWindow:Word;//fC0
NegCurrFormat:Byte;//fC2
end;;
  :65 = array of string;
//elSize = 4
//varType equivalent: var;
  :75 = array of string;
//elSize = 4
//varType equivalent: var;
  TThreadInfo = TThreadInfo = record//size=10
Next:PThreadInfo;//f0
ThreadID:Cardinal;//f4
Active:Integer;//f8
RecursionCount:Cardinal;//fC
end;;
  TThreadLocalCounter = class(TObject)
  published
    procedure Delete(var Thread:PThreadInfo);//00426BFC
    procedure Close(var Thread:PThreadInfo);//00426BF4
    destructor Destroy();//00426B08
    procedure Open(var Thread:PThreadInfo);//00426B7C
  public
    FHashTable:?;//f4
  end;
  TMultiReadExclusiveWriteSynchronizer = class(TInterfacedObject)
  published
    procedure EndRead;//00426F58
    function BeginWrite:Boolean;//00426D50
    procedure EndWrite;//00426DFC
    constructor Create();//00426C50
    destructor Destroy();//00426CC4
    procedure BeginRead;//00426EE8
  public
    FSentinel:Integer;//fC
    FReadSignal:Cardinal;//f10
    FWriteSignal:Cardinal;//f14
    FWaitRecycle:Cardinal;//f18
    FWriteRecursionCount:Cardinal;//f1C
    tls:TThreadLocalCounter;//f20
    FWriterID:Cardinal;//f24
    FRevisionLevel:Cardinal;//f28
  end;
  TArray<System.Char> = array of Char;
//elSize = 2;
  TStringBuilder = class(TObject)
  published
    function Insert(Index:Integer; Value:SmallInt):TStringBuilder;//0042873C
    function Insert(Index:Integer; Value:Double):TStringBuilder;//00428680
    //function Insert(Index:Integer; Value:Currency; ?:?):TStringBuilder;//00428518
    function Insert(Index:Integer; Value:Integer):TStringBuilder;//004286E4
    function Insert(Index:Integer; Value:TObject):TStringBuilder;//00428190
    //function Insert(Index:Integer; Value:Int64; ?:?):TStringBuilder;//004281E8
    //function Insert(?:?; ?:?):?;//00428448
    procedure EnsureCapacity(aCapacity:Integer);//00428090
    //procedure CopyTo(?:?; ?:?; ?:?; ?:?);//00427D38
    procedure Clear;//00427CE8
    function Equals(StringBuilder:TStringBuilder):Boolean;//004280E8
    function Insert(Index:Integer; Value:Char):TStringBuilder;//00428578
    function Insert(Index:Integer; Value:Byte):TStringBuilder;//00428624
    function Insert(Index:Integer; Value:Boolean):TStringBuilder;//00428794
    function Insert(Index:Integer; Value:ShortInt):TStringBuilder;//004283EC
    function Replace(OldValue:string; NewValue:string):TStringBuilder;//00428EC8
    procedure Replace(OldChar:Char; NewChar:Char);//00428EA0
    function Remove(StartIndex:Integer; RemLength:Integer):TStringBuilder;//00428AC4
    function Replace(OldChar:Char; NewChar:Char; Count:Integer; StartIndex:Integer):TStringBuilder;//00428DA0
    //procedure ToString(StartIndex:Integer; StrLength:Integer; ?:?);//00429064
    //procedure ToString(?:?);//00429038
    function Replace(OldValue:string; NewValue:string; Count:Integer; StartIndex:Integer):TStringBuilder;//00428BD0
    function Insert(Index:Integer; Value:Word):TStringBuilder;//00428394
    function Insert(Index:Integer; Value:string):TStringBuilder;//004282A8
    function Insert(Index:Integer; Value:Single):TStringBuilder;//00428244
    function Insert(Index:Integer; Value:Cardinal):TStringBuilder;//004289D0
    //function Insert(?:?; ?:?; ?:?; ?:?):?;//00428820
    function Insert(Index:Integer; Value:string; count:Integer):TStringBuilder;//004287F0
    //function Insert(Index:Integer; Value:UInt64; ?:?):TStringBuilder;//00428A2C
    function AppendLine(Value:string):TStringBuilder;//00427CD0
    //function Append(Value:Currency; ?:?):TStringBuilder;//0042799C
    function Append(Value:Char):TStringBuilder;//00427978
    function Append(Value:Byte):TStringBuilder;//00427A4C
    function Append(Value:Double):TStringBuilder;//00427AA0
    //function Append(Value:Int64; ?:?):TStringBuilder;//00427AFC
    function Append(Value:Integer):TStringBuilder;//00427BF8
    function Append(Value:SmallInt):TStringBuilder;//00427BA4
    constructor sub_0042804C(Value:string);//0042804C
    constructor sub_00427FFC(aCapacity:Integer);//00427FFC
    constructor Create();//00427E80
    constructor sub_00427FB8(aCapacity:Integer; aMaxCapacity:Integer);//00427FB8
    function Append(Value:Boolean):TStringBuilder;//004279F4
    constructor sub_00427F30(Value:string; aCapacity:Integer; Length:Integer; StartIndex:Integer);//00427F30
    constructor sub_00427ED0(Value:string; aCapacity:Integer);//00427ED0
    function Append(Value:TObject):TStringBuilder;//00427B50
    function Append(Value:Char; RepeatCount:Integer):TStringBuilder;//004278CC
    function Append(Value:RawByteString):TStringBuilder;//00427824
    function Append(Value:PAnsiChar):TStringBuilder;//004277D0
    //function Append(?:?; ?:?; ?:?):?;//0042768C
    function AppendLine:TStringBuilder;//00427CAC
    //function AppendFormat(?:?; ?:?; ?:?):?;//00427C4C
    function Append(Value:string; StartIndex:Integer; Count:Integer):TStringBuilder;//0042772C
    function Append(Value:string):TStringBuilder;//004275E0
    function Append(Value:Single):TStringBuilder;//00427584
    function Append(Value:ShortInt):TStringBuilder;//00427924
    //function Append(Value:UInt64; ?:?):TStringBuilder;//004274F8
    function Append(Value:Cardinal):TStringBuilder;//00427878
    function Append(Value:Word):TStringBuilder;//00427638
    //function Append(?:?):?;//0042754C
  public
    FData:?;//f4
    FLength:Integer;//f8
    FMaxCapacity:Integer;//fC
  end;
  EEncodingError = class(Exception)
  end;
  TEncoding = class(TObject)
  published
    //procedure GetChars(?:?; ?:?);//00429DDC
    procedure GetChars(const Bytes:TBytes; ByteIndex:Integer; ByteCount:Integer);//00429E48
    procedure GetChars(const Bytes:TBytes; ByteIndex:Integer; ByteCount:Integer; const Chars:TCharArray; CharIndex:Integer);//00429F48
    procedure GetCharCount(const Bytes:TBytes; ByteIndex:Integer; ByteCount:Integer);//00429D10
    procedure GetBytes(const S:UnicodeString);//00429B58
    //procedure GetBytes(?:?; ?:?; ?:?; ?:?; ?:?);//00429BA8
    procedure GetCharCount(const Bytes:TBytes);//00429CF4
    procedure GetPreamble;//0041CB4C
    procedure GetString(const Bytes:TBytes);//0042A1C4
    procedure GetString(const Bytes:TBytes; ByteIndex:Integer; ByteCount:Integer);//0042A1E8
    procedure GetMaxCharCount(ByteCount:Integer);//0041CB44
    function GetEncoding:TEncoding;//0042A0DC
    function GetEncoding:TEncoding;//0042A13C
    procedure GetMaxByteCount(CharCount:Integer);//0041CB3C
    function IsStandardEncoding:Boolean;//0042A300
    procedure GetBufferEncoding(var AEncoding:TEncoding);//0042961C
    procedure GetBufferEncoding(var AEncoding:TEncoding; ADefaultEncoding:TEncoding);//00429694
    procedure FreeEncodings;//00429504
    function Clone:TEncoding;//004293E4
    //procedure Convert(?:?; ?:?; ?:?; ?:?);//004293E8
    //procedure Convert(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//00429468
    procedure GetBytes(const Chars:TCharArray);//004299A8
    //procedure GetBytes(?:?; ?:?; ?:?; ?:?);//00429950
    //procedure GetBytes(?:?; ?:?; ?:?; ?:?; ?:?);//004299F0
    procedure GetByteCount(S:string; CharIndex:Integer; CharCount:Integer);//004298A0
    procedure GetByteCount(const Chars:TCharArray);//004297B0
    //function GetByteCount(?:?; ?:?; ?:?):?;//004297CC
    function GetByteCount(S:string):Integer;//00429878
  public
    FIsSingleByte:Boolean;//f4
    FMaxCharSize:Integer;//f8
    procedure v0; virtual; abstract;//v0//00404A58
    procedure v4; virtual; abstract;//v4//00404A58
    procedure v8; virtual; abstract;//v8//00404A58
    procedure vC; virtual; abstract;//vC//00404A58
    procedure v10; virtual;//v10//0042A094
    //procedure v14(?:?); virtual;//v14//0042A1B8
    function Clone:TEncoding; virtual;//v18//004293E4
    procedure GetMaxByteCount; virtual; abstract;//v1C//00404A58
    procedure GetMaxCharCount; virtual; abstract;//v20//00404A58
    procedure GetPreamble; virtual; abstract;//v24//00404A58
  end;
  TMBCSEncoding = class(TEncoding)
  published
    function GetMaxByteCount(CharCount:Integer):Integer;//0042A534
    function GetMaxCharCount(ByteCount:Integer):Integer;//0042A53C
    //procedure GetPreamble(?:?);//0042A540
    procedure Clone;//0042A45C
    constructor sub_0042A344;//0042A344
    constructor Create;//0042A388
    constructor Create(WCharToMBFlags:Integer; MBToWCharFlags:Integer);//0042A3D0
  public
    FCodePage:Cardinal;//fC
    FMBToWCharFlags:Cardinal;//f10
    FWCharToMBFlags:Cardinal;//f14
    //procedure v0(?:?); virtual;//v0//0042A480
    //procedure v4(?:?; ?:?; ?:?); virtual;//v4//0042A498
    //procedure v8(?:?); virtual;//v8//0042A4BC
    //procedure vC(?:?; ?:?; ?:?); virtual;//vC//0042A4D0
    //function v10:?; virtual;//v10//0042A4F0
    //procedure v14(?:?); virtual;//v14//0042A4F4
    procedure Clone; virtual;//v18//0042A45C
    function GetMaxByteCount(CharCount:Integer):Integer; virtual;//v1C//0042A534
    function GetMaxCharCount(ByteCount:Integer):Integer; virtual;//v20//0042A53C
    //procedure GetPreamble(?:?); virtual;//v24//0042A540
    constructor v28; virtual;//v28//0042A344
    constructor Create; virtual;//v2C//0042A388
    constructor Create(WCharToMBFlags:Integer; MBToWCharFlags:Integer); virtual;//v30//0042A3D0
  end;
  TUTF7Encoding = class(TMBCSEncoding)
  published
    procedure GetMaxByteCount(CharCount:Integer);//0042A5AC
    function GetMaxCharCount(ByteCount:Integer):Integer;//0042A5B4
    constructor Create();//0042A55C
    procedure Clone;//0042A59C
  public
    procedure Clone; virtual;//v18//0042A59C
    procedure GetMaxByteCount(CharCount:Integer); virtual;//v1C//0042A5AC
    function GetMaxCharCount(ByteCount:Integer):Integer; virtual;//v20//0042A5B4
    constructor Create(); virtual;//v28//0042A55C
  end;
  TUTF8Encoding = class(TUTF7Encoding)
  published
    function GetMaxCharCount(ByteCount:Integer):Integer;//0042A614
    //procedure GetPreamble(?:?);//0042A618
    function GetMaxByteCount(CharCount:Integer):Integer;//0042A60C
    constructor Create();//0042A5B8
    procedure Clone;//0042A5FC
  public
    procedure Clone; virtual;//v18//0042A5FC
    function GetMaxByteCount(CharCount:Integer):Integer; virtual;//v1C//0042A60C
    function GetMaxCharCount(ByteCount:Integer):Integer; virtual;//v20//0042A614
    //procedure GetPreamble(?:?); virtual;//v24//0042A618
    constructor Create(); virtual;//v28//0042A5B8
  end;
  TUnicodeEncoding = class(TEncoding)
  published
    procedure GetMaxCharCount(ByteCount:Integer);//0042A77C
    //procedure GetPreamble(?:?);//0042A78C
    procedure GetMaxByteCount(CharCount:Integer);//0042A774
    constructor Create();//0042A6A0
    procedure Clone;//0042A6CC
  public
    //procedure v0(?:?; ?:?); virtual;//v0//0042A6DC
    //function v4(?:?; ?:?; ?:?):?; virtual;//v4//0042A6E4
    //procedure v8(?:?; ?:?); virtual;//v8//0042A700
    //function vC(?:?):?; virtual;//vC//0042A70C
    //function v10:?; virtual;//v10//0042A72C
    //procedure v14(?:?); virtual;//v14//0042A734
    procedure Clone; virtual;//v18//0042A6CC
    procedure GetMaxByteCount(CharCount:Integer); virtual;//v1C//0042A774
    procedure GetMaxCharCount(ByteCount:Integer); virtual;//v20//0042A77C
    //procedure GetPreamble(?:?); virtual;//v24//0042A78C
    constructor Create(); virtual;//v28//0042A6A0
  end;
  TBigEndianUnicodeEncoding = class(TUnicodeEncoding)
  published
    //procedure GetPreamble(?:?);//0042A8F0
    procedure Clone;//0042A80C
  public
    procedure v4; virtual;//v4//0042A81C
    //function vC(?:?; ?:?; ?:?):?; virtual;//vC//0042A850
    //function v10:?; virtual;//v10//0042A88C
    //procedure v14(?:?); virtual;//v14//0042A894
    procedure Clone; virtual;//v18//0042A80C
    //procedure GetPreamble(?:?); virtual;//v24//0042A8F0
  end;
  TStrData = TStrData = record//size=8
f4:string;//f4
end;
Ident:Integer;//f0
Str:string;//f4
end;;
  :27 = array of AnsiChar;
//elSize = 1;
    procedure EncodingHashList;//0041D4E4
    procedure EncodingDataList;//0041D8D4
    procedure EncodingNameList;//0041DCC4
    function InterlockedCompareExchangePointer(var Destination:Pointer; Exchange:Pointer; Comparand:Pointer):Pointer;//0041E650
    //function sub_0041E658:?;//0041E658
    //function sub_0041E660(?:?; ?:?):?;//0041E660
    function InterlockedIncrement(var I:Integer):Integer;//0041E668
    function InterlockedDecrement(var I:Integer):Integer;//0041E678
    function InterlockedExchange(var A:Integer; B:Integer):Integer;//0041E688
    procedure sub_0041E694;//0041E694
    procedure DivMod(Dividend:Integer; Divisor:Word; var Result:Word; var Remainder:Word);//0041E69C
    procedure ConvertError(ResString:PResStringRec);//0041E6B8
    function ExpandVolumeName(const AFileName:UnicodeString):UnicodeString;//0041E6D0
    function GetObjectInfoName(Handle:THandle):UnicodeString;//0041E808
    function InternalGetFileNameFromHandle(Handle:THandle; var FileName:UnicodeString; Flags:DWORD):Boolean;//0041E8EC
    function InternalGetFileNameFromSymLink(const FileName:UnicodeString; var TargetName:UnicodeString):Boolean;//0041EAB8
    procedure ConvertErrorFmt(ResString:PResStringRec; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);//0041EB6C
    procedure InvalidGUID;//0041EB90
    function HexChar(c:Char):Byte;//0041EBB8
    function HexByte(p:PChar):Byte;//0041EBF8
    function StringToGUID(const S:UnicodeString):TGUID;//0041EC28
    function IsEqualGUID(const Guid1:TGUID; const Guid2:TGUID):Boolean;//0041ED24
    procedure DoExitProc;//0041ED48
    procedure AddExitProc(Proc:TProcedure);//0041ED74
    function CharInSet(C:WideChar; const CharSet:TSysCharSet):Boolean;//0041EDAC
    function UpperCase(const S:UnicodeString):UnicodeString;//0041EDBC
    function LowerCase(const S:UnicodeString):UnicodeString;//0041EE0C
    function CompareStr(const S1:UnicodeString; const S2:UnicodeString):Integer;//0041EE5C
    function CompareMem(P1:Pointer; P2:Pointer; Length:Integer):Boolean;//0041EEC8
    function CompareText(const S1:UnicodeString; const S2:UnicodeString):Integer;//0041EF5C
    function CompareText(const S1:UnicodeString; const S2:UnicodeString; LocaleOptions:TLocaleOptions):Integer;//0041F00C
    function SameText(const S1:UnicodeString; const S2:UnicodeString):Boolean;//0041F020
    function AnsiUpperCase(const S:UnicodeString):UnicodeString;//0041F044
    function AnsiLowerCase(const S:UnicodeString):UnicodeString;//0041F080
    function AnsiCompareStr(const S1:UnicodeString; const S2:UnicodeString):Integer;//0041F0BC
    function AnsiCompareText(const S1:UnicodeString; const S2:UnicodeString):Integer;//0041F100
    function AnsiSameText(const S1:UnicodeString; const S2:UnicodeString):Boolean;//0041F144
    function AnsiStrLIComp(S1:PAnsiChar; S2:PAnsiChar; MaxLen:Cardinal):Integer;//0041F15C
    function WideUpperCase(const S:WideString):WideString;//0041F17C
    function WideCompareStr(const S1:WideString; const S2:WideString):Integer;//0041F1B8
    function WideCompareText(const S1:WideString; const S2:WideString):Integer;//0041F220
    function Trim(const S:UnicodeString):UnicodeString;//0041F288
    function TrimLeft(const S:UnicodeString):UnicodeString;//0041F2F8
    function TrimRight(const S:UnicodeString):UnicodeString;//0041F344
    function AnsiQuotedStr(const S:UnicodeString; Quote:Char):UnicodeString;//0041F390
    function AnsiExtractQuotedStr(var Src:PWideChar; Quote:WideChar):UnicodeString;//0041F504
    function AdjustLineBreaks(const S:UnicodeString; Style:TTextLineBreakStyle):UnicodeString;//0041F664
    function IsValidIdent(const Ident:UnicodeString; AllowDots:Boolean):Boolean;//0041F778
    procedure CvtIntW;//0041F834
    function IntToStr(Value:Integer):UnicodeString;//0041F894
    function UIntToStr(Value:Cardinal):UnicodeString;//0041F8B8
    function UIntToStr(Value:UInt64):UnicodeString;//0041F8F0
    procedure CvtInt64W;//0041F92C
    function IntToStr(Value:Int64):UnicodeString;//0041FA10
    function IntToHex(Value:Integer; Digits:Integer):UnicodeString;//0041FA3C
    function IntToHex(Digits:Integer; Value:Int64):UnicodeString;//0041FA68
    function StrToInt(const S:UnicodeString):Integer;//0041FAA0
    function StrToIntDef(const S:UnicodeString; Default:Integer):Integer;//0041FADC
    function TryStrToInt(const S:UnicodeString; var Value:Integer):Boolean;//0041FAF4
    function StrToInt64(const S:UnicodeString):Int64;//0041FB14
    function StrToInt64Def(const S:UnicodeString; const Default:Int64):Int64;//0041FB58
    function TryStrToInt64(const S:UnicodeString; var Value:Int64):Boolean;//0041FB8C
    procedure VerifyBoolStrArray;//0041FBAC
    function CompareWith(const aArray:array[$0..-$1] of System.UnicodeString; const _Dv_:$0..-$1):Boolean;//0041FC4C
    function TryStrToBool(const S:UnicodeString; var Value:Boolean):Boolean;//0041FC9C
    function BoolToStr(B:Boolean; UseBoolStrs:Boolean):UnicodeString;//0041FD44
    function EnumStringModules(Instance:LongInt; Data:Pointer):Boolean;//0041FDD8
    function FindStringResource(Ident:Integer):UnicodeString;//0041FE14
    function LoadStr(Ident:Integer):UnicodeString;//0041FE88
    function FileOpen(const FileName:UnicodeString; Mode:LongWord):Integer;//0041FE9C
    function FileCreate(const FileName:UnicodeString; Mode:LongWord; Rights:Integer):Integer;//0041FEF4
    function FileRead(Handle:Integer; var Buffer:void ; Count:LongWord):Integer;//0041FF48
    function FileWrite(Handle:Integer; const Buffer:void ; Count:LongWord):Integer;//0041FF74
    function FileSeek(Handle:Integer; Origin:Integer; const Offset:Int64):Int64;//0041FFA0
    function ExistsLockedOrShared(const Filename:UnicodeString):Boolean;//0041FFF0
    function FileExists(const FileName:UnicodeString; FollowLink:Boolean):Boolean;//00420030
    function DirectoryExists(const Directory:UnicodeString; FollowLink:Boolean):Boolean;//004200C8
    function ForceDirectories(Dir:UnicodeString):Boolean;//00420194
    function FileIsReadOnly(const FileName:UnicodeString):Boolean;//00420290
    function AnsiLastChar(const S:UnicodeString):PWideChar;//0042034C
    function LastDelimiter(const Delimiters:UnicodeString; const S:UnicodeString):Integer;//00420390
    function FindDelimiter(const Delimiters:UnicodeString; const S:UnicodeString; StartIdx:Integer):Integer;//004203D8
    function ChangeFileExt(const FileName:UnicodeString; const Extension:UnicodeString):UnicodeString;//0042042C
    function ExtractFilePath(const FileName:UnicodeString):UnicodeString;//004204C8
    function ExtractFileDir(const FileName:UnicodeString):UnicodeString;//00420504
    function ExtractFileName(const FileName:UnicodeString):UnicodeString;//00420564
    function ExtractFileExt(const FileName:UnicodeString):UnicodeString;//004205A4
    function ExpandFileName(const FileName:UnicodeString):UnicodeString;//004205F8
    function IsRelativePath(const Path:UnicodeString):Boolean;//0042068C
    function BackfillGetDiskFreeSpaceEx(Directory:PChar; var FreeAvailable:TLargeInteger; var TotalSpace:TLargeInteger; TotalFree:PLargeInteger):BOOL; stdcall;//004206B4
    function CreateDir(const Dir:UnicodeString):Boolean;//00420728
    function StrLen(const Str:PAnsiChar):Cardinal;//00420744
    function StrLen(const Str:PWideChar):Cardinal;//00420774
    function StrEnd(const Str:PWideChar):PWideChar;//00420794
    function StrMove(Dest:PWideChar; const Source:PWideChar; Count:Cardinal):PWideChar;//004207B0
    function StrCopy(Dest:PWideChar; const Source:PWideChar):PWideChar;//004207C0
    function StrLCopy(Dest:PWideChar; const Source:PWideChar; MaxLen:Cardinal):PWideChar;//004207F8
    function StrPCopy(Dest:PWideChar; const Source:UnicodeString):PWideChar;//00420834
    function StrPLCopy(Dest:PWideChar; const Source:UnicodeString; MaxLen:Cardinal):PWideChar;//0042085C
    function StrCat(Dest:PWideChar; const Source:PWideChar):PWideChar;//0042087C
    function StrComp(const Str1:PAnsiChar; const Str2:PAnsiChar):Integer;//00420898
    function StrComp(const Str1:PWideChar; const Str2:PWideChar):Integer;//00420924
    function StrIComp(const Str1:PWideChar; const Str2:PWideChar):Integer;//00420954
    function StrLComp(const Str1:PWideChar; const Str2:PWideChar; MaxLen:Cardinal):Integer;//004209A4
    function StrLIComp(const Str1:PWideChar; const Str2:PWideChar; MaxLen:Cardinal):Integer;//004209F0
    function StrScan(const Str:PWideChar; Chr:WideChar):PWideChar;//00420A5C
    function StrRScan(const Str:PWideChar; Chr:WideChar):PWideChar;//00420A78
    function StrPos(const Str1:PWideChar; const Str2:PWideChar):PWideChar;//00420AA8
    function StrPosLen(const Str1:PWideChar; const Str2:PWideChar; Len1:Integer; Len2:Integer):PWideChar;//00420B00
    function StrPas(const Str:PWideChar):UnicodeString;//00420B60
    function WideStrAlloc(Size:Cardinal):PWideChar;//00420B74
    function StrAlloc(Size:Cardinal):PChar;//00420B8C
    function StrBufSize(const Str:PWideChar):Cardinal;//00420B94
    function StrNew(const Str:PWideChar):PWideChar;//00420BA0
    procedure StrDispose(Str:PWideChar);//00420BCC
    procedure FormatError(ErrorCode:Integer; Format:PChar; FmtLen:Cardinal);//00420BDC
    function FormatBuf(var Buffer:UnicodeString; BufLen:Cardinal; const Format:void ; FmtLen:Cardinal; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):Cardinal;//00420C24
    function FormatBuf(Buffer:PWideChar; BufLen:Cardinal; const Format:void ; FmtLen:Cardinal; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; const AFormatSettings:TFormatSettings):Cardinal;//00420C44
    function StrFmt(Buffer:PWideChar; Format:PWideChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):PWideChar;//00420C64
    function StrFmt(Buffer:PWideChar; Format:PWideChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; const AFormatSettings:TFormatSettings):PWideChar;//00420C7C
    function StrLFmt(Buffer:PAnsiChar; MaxBufLen:Cardinal; Format:PAnsiChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):PAnsiChar;//00420CC4
    function StrLFmt(Buffer:PWideChar; MaxBufLen:Cardinal; Format:PWideChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; const AFormatSettings:TFormatSettings):PWideChar;//00420CE0
    function Format(const Format:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):UnicodeString;//00420D28
    function Format(const Format:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; const AFormatSettings:TFormatSettings):UnicodeString;//00420D50
    procedure FmtStr(var Result:UnicodeString; const Format:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);//00420D68
    procedure FmtStr(var Result:UnicodeString; const Format:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; const AFormatSettings:TFormatSettings);//00420D80
    procedure WideFormatError(ErrorCode:Integer; Format:PWideChar; FmtLen:Cardinal);//00420E78
    procedure WideFormatVarToStr(var S:WideString; const V:TVarData);//00420EF8
    function FloatToTextEx(BufferArg:PChar; const Value:void ; ValueType:TFloatValue; Format:TFloatFormat; Precision:Integer; Digits:Integer; const AFormatSettings:TFormatSettings):Integer;//00420F1C
    function WideFormatBuf(var Buffer:void ; BufLen:Cardinal; const Format:void ; FmtLen:Cardinal; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; const AFormatSettings:TFormatSettings):Cardinal;//00420F3C
    procedure PutExponent;//00421340
    function FloatToText(BufferArg:PWideChar; const Value:void ; ValueType:TFloatValue; Format:TFloatFormat; Precision:Integer; Digits:Integer; const AFormatSettings:TFormatSettings):Integer;//004213A4
    procedure FloatToDecimal(var Result:TFloatRec; const Value:void ; ValueType:TFloatValue; Precision:Integer; Decimals:Integer);//004216C4
    function TextToFloat(Buffer:PWideChar; var Value:void ; ValueType:TFloatValue; const AFormatSettings:TFormatSettings):Boolean;//004218F0
    function FloatToStr(Value:Extended):UnicodeString;//00421A3C
    function FloatToStr(const AFormatSettings:TFormatSettings; Value:Extended):UnicodeString;//00421A60
    function CurrToStr(const AFormatSettings:TFormatSettings; Value:Currency):UnicodeString;//00421A94
    function FloatToStrF(Format:TFloatFormat; Precision:Integer; Digits:Integer; Value:Extended; const AFormatSettings:TFormatSettings):UnicodeString;//00421AC8
    function StrToFloat(const S:UnicodeString):Extended;//00421B04
    function StrToFloat(const S:UnicodeString; const AFormatSettings:TFormatSettings):Extended;//00421B1C
    function TryStrToFloat(const S:UnicodeString; var Value:Extended):Boolean;//00421B60
    function TryStrToFloat(const S:UnicodeString; const AFormatSettings:TFormatSettings; var Value:Extended):Boolean;//00421B6C
    function TryStrToFloat(const S:UnicodeString; const AFormatSettings:TFormatSettings; var Value:Double):Boolean;//00421B8C
    function TryStrToFloat(const S:UnicodeString; var Value:Single; const AFormatSettings:TFormatSettings):Boolean;//00421C00
    function TryStrToCurr(const S:UnicodeString; const AFormatSettings:TFormatSettings; var Value:Currency):Boolean;//00421C74
    function DateTimeToTimeStamp(DateTime:TDateTime):TTimeStamp;//00421C94
    procedure ValidateTimeStamp(const TimeStamp:TTimeStamp);//00421CD8
    function TimeStampToDateTime(const TimeStamp:TTimeStamp):TDateTime;//00421D18
    function MSecsToTimeStamp(MSecs:Comp):TTimeStamp;//00421D54
    function TimeStampToMSecs(const TimeStamp:TTimeStamp):Comp;//00421D74
    function TryEncodeTime(Hour:Word; Min:Word; Sec:Word; MSec:Word; var Time:TDateTime):Boolean;//00421D8C
    function EncodeTime(Hour:Word; Min:Word; Sec:Word; MSec:Word):TDateTime;//00421E04
    procedure DecodeTime(var Hour:Word; var Min:Word; var Sec:Word; const DateTime:TDateTime; var MSec:Word);//00421E44
    function IsLeapYear(Year:Word):Boolean;//00421EA0
    function TryEncodeDate(Year:Word; Month:Word; Day:Word; var Date:TDateTime):Boolean;//00421EDC
    function EncodeDate(Year:Word; Month:Word; Day:Word):TDateTime;//00421FA8
    function DecodeDateFully(var Year:Word; var Month:Word; var Day:Word; const DateTime:TDateTime; var DOW:Word):Boolean;//00421FD8
    procedure DecodeDate(var Year:Word; var Month:Word; var Day:Word; const DateTime:TDateTime);//00422124
    function DayOfWeek(const DateTime:TDateTime):Word;//00422144
    function Date:TDateTime;//0042216C
    function Time:TDateTime;//00422198
    function Now:TDateTime;//004221CC
    function CurrentYear:Word;//0042221C
    procedure DateTimeToString(var Result:UnicodeString; const Format:UnicodeString; DateTime:TDateTime);//00422230
    procedure AppendChars(P:PChar; Count:Integer);//00422248
    procedure AppendString(const S:UnicodeString);//0042228C
    procedure AppendNumber(Number:Integer; Digits:Integer);//004222A8
    procedure GetCount;//004222F4
    procedure GetDate;//00422328
    procedure GetTime;//00422360
    function ConvertEraString(const Count:Integer):UnicodeString;//004223A0
    function ConvertYearString(const Count:Integer):UnicodeString;//00422528
    procedure AppendFormat(Format:PChar);//00422650
    procedure DateTimeToString(var Result:UnicodeString; const Format:UnicodeString; const AFormatSettings:TFormatSettings; DateTime:TDateTime);//00422EEC
    function DateToStr(const AFormatSettings:TFormatSettings; const DateTime:TDateTime):UnicodeString;//00422F4C
    function TimeToStr(const AFormatSettings:TFormatSettings; const DateTime:TDateTime):UnicodeString;//00422F64
    function CurrToStr(Value:Currency):UnicodeString;//00422F7C
    function DateTimeToStr(const AFormatSettings:TFormatSettings; const DateTime:TDateTime):UnicodeString;//00422F9C
    procedure ScanBlanks(const S:UnicodeString; var Pos:Integer);//00422FB4
    function ScanNumber(const S:UnicodeString; var Pos:Integer; var Number:Word; var CharCount:Byte):Boolean;//00422FDC
    function ScanString(const S:UnicodeString; var Pos:Integer; const Symbol:UnicodeString):Boolean;//00423074
    function ScanChar(const S:UnicodeString; var Pos:Integer; Ch:Char):Boolean;//0042310C
    function GetDateOrder(const DateFormat:UnicodeString):TDateOrder;//00423144
    procedure ScanToNumber(const S:UnicodeString; var Pos:Integer);//00423198
    function GetEraYearOffset(const Name:UnicodeString):Integer;//004231F8
    function EraToYear(Year:Integer):Integer;//0042324C
    function ScanDate(const S:UnicodeString; var Pos:Integer; const AFormatSettings:TFormatSettings; var Date:TDateTime):Boolean;//004232A8
    function ScanTime(const S:UnicodeString; var Pos:Integer; const AFormatSettings:TFormatSettings; var Time:TDateTime):Boolean;//00423604
    function StrToDate(const S:UnicodeString; const AFormatSettings:TFormatSettings):TDateTime;//00423804
    function TryStrToDate(const S:UnicodeString; const AFormatSettings:TFormatSettings; var Value:TDateTime):Boolean;//00423840
    function StrToDateTime(const S:UnicodeString; const AFormatSettings:TFormatSettings):TDateTime;//00423880
    function TryStrToDateTime(const S:UnicodeString; const AFormatSettings:TFormatSettings; var Value:TDateTime):Boolean;//004238BC
    function StrToDate(const S:UnicodeString):TDateTime;//004238FC
    function StrToTime(const S:UnicodeString; const AFormatSettings:TFormatSettings):TDateTime;//00423914
    function TryStrToTime(const S:UnicodeString; const AFormatSettings:TFormatSettings; var Value:TDateTime):Boolean;//00423950
    function SysErrorMessage(ErrorCode:Cardinal):UnicodeString;//00423B6C
    function GetLocaleStr(Locale:Integer; LocaleType:Integer; const Default:UnicodeString):UnicodeString;//00423C08
    function GetLocaleChar(Locale:Integer; LocaleType:Integer; Default:Char):Char;//00423C54
    function Create:TFormatSettings;//00423C80
    function Create:TFormatSettings;//0042405C
    function Create:TFormatSettings;//00424104
    function AdjustLocaleName:UnicodeString;//00424114
    procedure GetDayNames(var AFormatSettings:TFormatSettings);//00424148
    procedure GetMonthNames(var AFormatSettings:TFormatSettings);//00424204
    function GetString(LocaleItem:Integer; DefaultIndex:Integer; const DefaultValues:array[$0..-$1] of System.Pointer; const _Dv_:$0..-$1):UnicodeString;//004242A8
    procedure FixDateSeparator(var DateFormat:UnicodeString);//004242E4
    function TranslateDateFormat(LocaleType:Integer; const Default:UnicodeString; const Separator:Char):UnicodeString;//00424314
    function EnumEraNames(Names:PChar):Integer; stdcall;//004245E0
    function EnumEraYearOffsets(YearOffsets:PChar):Integer; stdcall;//0042461C
    procedure GetEraNamesAndYearOffsets;//00424694
    function ConvertAddr(Address:Pointer):Pointer;//00424748
    function ExceptionErrorMessage(ExceptObject:TObject; ExceptAddr:Pointer; Buffer:PChar; Size:Integer):Integer;//00424754
    procedure ShowException(ExceptObject:TObject; ExceptAddr:Pointer);//00424944
    procedure RaiseEAbort(ReturnAddr:Pointer);//00424A88
    procedure Abort;//00424AA8
    procedure OutOfMemoryError;//00424AB4
    procedure RaisingException(P:PExceptionRecord);//004250C8
    procedure RaisingException(P:PExceptionRecord);//00425184
    function CreateInOutError:EInOutError;//0042518C
    procedure ErrorHandler(ErrorCode:Byte; ErrorAddr:Pointer);//004251EC
    procedure AssertErrorHandler(const Message:UnicodeString; const Filename:UnicodeString; LineNumber:Integer; ErrorAddr:Pointer);//0042524C
    procedure AbstractErrorHandler;//00425334
    function MapException(P:PExceptionRecord):TRuntimeError;//0042534C
    function GetExceptionClass(P:PExceptionRecord):ExceptClass;//004253CC
    function CreateAVObject:Exception;//004253F0
    function GetExceptionObject(P:PExceptionRecord):Exception;//004255BC
    procedure RaiseExceptObject(P:PExceptionRecord);//0042569C
    procedure ExceptHandler(ExceptObject:TObject; ExceptAddr:Pointer);//004256C0
    procedure InitExceptions;//004256D0
    procedure DoneExceptions;//00425760

implementation

//0041CB3C
procedure TEncoding.GetMaxByteCount(CharCount:Integer);
begin
{*
>0041CB3C    jmp         @AbstractError
*}
end;

//0041CB44
procedure TEncoding.GetMaxCharCount(ByteCount:Integer);
begin
{*
>0041CB44    jmp         @AbstractError
*}
end;

//0041CB4C
procedure TEncoding.GetPreamble;
begin
{*
>0041CB4C    jmp         @AbstractError
*}
end;

//0041D4E4
procedure EncodingHashList;
begin
{*
 0041D4E4    and         byte ptr [ecx],ch
 0041D4E6    add         ch,al
 0041D4E8    mov         bl,5F
 0041D4EA    add         byte ptr [ebp+5002A24],al
 0041D4F0    loopne      0041D4A4
>0041D4F2    jae         0041D4E1
 0041D4F4    call        01323E16
 0041D4F9    mov         bl,73
 0041D4FB    in          eax,dl
 0041D4FC    add         byte ptr [edi-3CDFF895],bl
 0041D502    sbb         al,0C1
 0041D504    cmp         al,bl
 0041D506    int         3
 0041D507    mov         al,46
 0041D509    cmp         al,0E6
>0041D50B    jb          0041D57F
 0041D50D    dec         eax
 0041D50E    bound       esp,qword ptr [edi+73416256]
 0041D514    ???
 0041D515    aas
 0041D516    out         72,al
 0041D518    lahf
 0041D519    stos        byte ptr [edi]
 0041D51A    jmp         34B018FA
 0041D51F    cmc
 0041D520    cmp         al,0E6
>0041D523    jb          0041D577
 0041D525    dec         eax
 0041D526    bound       esp,qword ptr [edi+73416236]
 0041D52C    mov         dh,3F
 0041D52E    out         72,al
 0041D530    lahf
 0041D531    stos        byte ptr [edi]
 0041D532    jmp         34AFF852
 0041D537    cmc
 0041D538    push        es
 0041D539    cmp         al,0E6
>0041D53B    jb          0041D58F
 0041D53D    dec         ecx
 0041D53E    bound       esp,qword ptr [edi+73416216]
 0041D544    xchg        eax,esi
 0041D545    aas
 0041D546    out         72,al
>0041D548    jg          0041D4F5
 0041D54A    jmp         34AFD8AA
 0041D54F    cmc
 0041D550    out         3C,al
 0041D552    out         72,al
>0041D554    jb          0041D5A2
 0041D556    bound       esp,qword ptr [edi+734162F6]
>0041D55C    jbe         0041D59D
 0041D55E    out         72,al
>0041D560    jle         0041D50D
 0041D562    jmp         34B0B902
 0041D567    cmc
 0041D568    mov         ah,0C8
 0041D56A    not         dword ptr [esi+eax*8+3C]
 0041D56E    out         72,al
 0041D570    repne pop   eax
 0041D572    bound       esp,qword ptr [edi+734162D6]
 0041D578    push        esi
 0041D579    aas
 0041D57A    out         72,al
>0041D57C    jle         0041D529
 0041D57E    jmp         54CD815E
 0041D583    std
>0041D584    js          0041D52E
 0041D586    and         byte ptr [edx-6334DA7D],ah
 0041D58C    and         dword ptr [eax+ecx*8],0FFFFFF80
 0041D590    cmps        byte ptr [esi],byte ptr [edi]
 0041D591    cmp         al,0E6
>0041D593    jb          0041D527
 0041D595    inc         eax
 0041D596    bound       esp,qword ptr [edi+734162B6]
 0041D59C    aas
 0041D59E    out         72,al
 0041D5A0    sahf
 0041D5A1    stos        byte ptr [edi]
 0041D5A2    jmp         CB027DC2
 0041D5A7    pushad
 0041D5A9    sbb         dword ptr [ebx],edx
 0041D5AB    leave
 0041D5AC    sbb         dword ptr [ebx],ebp
 0041D5AE    arpl        word ptr [edx],sp
 0041D5B0    xchg        bh,byte ptr [esi]
>0041D5B3    jb          0041D54B
 0041D5B5    bound       eax,qword ptr [ecx+73]
 0041D5B8    push        ss
 0041D5B9    aas
 0041D5BA    out         72,al
 0041D5BC    sahf
 0041D5BD    stos        byte ptr [edi]
 0041D5BE    jmp         DD4BF41E
 0041D5C3    pop         ebx
 0041D5C4    cli
 0041D5C5    call        72E6:3D66CC18
>0041D5CC    jb          0041D613
 0041D5CE    bound       esp,qword ptr [edi+73416376]
 0041D5D4    idiv        byte ptr [esi]
 0041D5D6    out         72,al
>0041D5D8    jge         0041D585
 0041D5DA    jmp         F334007A
 0041D5DF    or          eax,dword ptr [esi+3D]
 0041D5E2    out         72,al
>0041D5E4    jb          0041D63F
 0041D5E6    bound       esp,qword ptr [edi+73416356]
 0041D5EC    ???
 0041D5ED    out         72,al
 0041D5F0    pop         ebp
 0041D5F1    stos        dword ptr [edi]
 0041D5F2    jmp         34B099D2
 0041D5F7    cmc
 0041D5F8    into
 0041D5F9    mov         es,di
 0041D5FB    pop         esp
 0041D5FC    xchg        eax,edx
 0041D5FD    pop         esp
 0041D5FE    bound       esp,qword ptr [edi+682C4CCE]
 0041D604    into
 0041D605    cld
 0041D606    mov         dword ptr [ecx+edi*4-13],6EA3EBB5
 0041D60E    xor         al,0F5
 0041D610    out         dl,al
 0041D611    mov         es,di
 0041D613    pop         esp
 0041D614    out         dl,al
 0041D615    dec         esp
 0041D616    sub         al,68
 0041D618    out         dl,al
 0041D619    cld
 0041D61A    mov         dword ptr [esi+ebp*4-72],55525CC7
 0041D622    bound       esp,qword ptr [edi+682C4CAE]
 0041D628    scas        byte ptr [edi]
 0041D629    cld
 0041D62A    mov         dword ptr [esi+ecx*2-72],0A6105CC7
 0041D632    push        ecx
 0041D633    or          eax,0A7626D52
 0041D638    dec         esi
 0041D639    dec         esp
 0041D63A    sub         al,68
 0041D63C    dec         esi
 0041D63D    cld
 0041D63E    mov         dword ptr [eax+edi*8-14],8E6EEBB5
 0041D646    mov         dword ptr [edx+edx-38],4C6EA763
 0041D64E    sub         al,68
 0041D650    outs        dl,byte ptr [esi]
 0041D651    cld
 0041D652    mov         dword ptr [eax+edi*8-14],8E0EABB5
 0041D65A    mov         dword ptr [edx+esi*4-40],4C0EA763
 0041D662    sub         al,68
 0041D664    push        cs
 0041D665    cld
 0041D666    mov         dword ptr [eax+ebx*8+49],4A406B81
 0041D66E    sbb         al,0C1
 0041D670    xor         dword ptr [ecx-5ECE9516],esp
 0041D676    retf        606D
 0041D679    stos        byte ptr [edi]
 0041D67A    add         al,7
 0041D67C    cmp         bh,byte ptr [edx+4AC08AF6]
 0041D682    sbb         al,0C1
 0041D684    movs        dword ptr [edi],dword ptr [esi]
 0041D685    in          eax,dl
 0041D686    in          eax,1E
 0041D688    pop         ecx
 0041D689    inc         edx
 0041D68A    cmp         dword ptr [edi],eax
 0041D68C    shl         dword ptr [edx],39
 0041D68F    pop         es
 0041D690    and         byte ptr [edi+1C],dl
 0041D693    rcl         dword ptr [edx+59],62
 0041D697    cmps        dword ptr [esi],dword ptr [edi]
 0041D698    fimul       dword ptr [ecx]
 0041D69A    adc         ebx,dword ptr [ecx]
 0041D69C    mov         al,[4F7D4BAE]
>0041D6A1    jmp         0041D699
 0041D6A3    ???
 0041D6A4    pop         edx
 0041D6A6    neg         cl
 0041D6A8    popfd
 0041D6A9    xor         cl,byte ptr [ebp]
 0041D6AD    push        edx
 0041D6AE    sbb         al,0C1
 0041D6B0    mov         al,[F1C2A332]
 0041D6B5    xor         eax,1AA09C55
 0041D6BA    adc         eax,5557AA06
 0041D6BF    mov         byte ptr [ebx-4723EAE7],ah
 0041D6C5    sbb         dl,byte ptr ds:[9324020]
 0041D6CB    in          al,dl
 0041D6CC    adc         ecx,dword ptr [edx+ecx]
 0041D6CF    push        esp
 0041D6D0    fld         qword ptr [edx+76]
 0041D6D3    scas        byte ptr [edi]
 0041D6D4    sbb         edx,ecx
 0041D6D6    or          bl,cl
 0041D6D8    sbb         edx,esi
 0041D6DA    or          bl,cl
 0041D6DC    sbb         dl,dl
 0041D6DE    or          dword ptr [ebx],esp
 0041D6E0    mov         [38DC3D3E],eax
 0041D6E5    ror         byte ptr [ecx],cl
 0041D6E7    and         eax,dword ptr [ebx+58DC3D3E]
 0041D6ED    ror         byte ptr [ecx],cl
 0041D6EF    and         esp,ebx
 0041D6F1    cmp         eax,9D278DC
 0041D6F7    and         eax,ebx
 0041D6F9    cmp         eax,9D298DC
 0041D6FF    and         esp,dword ptr [ebx]
 0041D701    cmp         eax,9D2B8DC
 0041D707    and         eax,dword ptr [ebx]
 0041D709    cmp         eax,9D2D8DC
 0041D70F    and         esp,dword ptr [ebx+3E]
 0041D712    cmp         eax,9D2F8DC
 0041D717    and         eax,dword ptr [ebx+3E]
 0041D71A    cmp         eax,9D318DC
 0041D71F    and         esp,dword ptr [ebx+5ADC3D3F]
 0041D725    mov         edx,43A2188C
 0041D72A    rcl         esp,cl
 0041D72C    pushfd
>0041D72D    js          0041D6D5
 0041D72F    mov         al,[953B0373]
 0041D734    or          dword ptr [esi-45451DA7],eax
 0041D73A    mov         word ptr [eax],ds
 0041D73C    pushfd
 0041D73D    jmp         D379:F6745276
 0041D744    fsub        st(6),st
>0041D746    jbe         0041D79A
 0041D748    xor         al,0F2
>0041D74A    jns         0041D71F
 0041D74C    pop         esp
 0041D74D    int         76
 0041D74F    push        edx
 0041D750    sbb         dword ptr [esi],esp
 0041D752    daa
 0041D753    lods        byte ptr [esi]
 0041D754    add         byte ptr [esi],ah
 0041D756    pushad
 0041D757    int         54
 0041D759    lods        dword ptr [esi]
 0041D75A    mov         edi,2701D9F6
 0041D75F    lods        byte ptr [esi]
 0041D760    rol         byte ptr [ecx],60
 0041D763    int         59
 0041D765    and         ah,byte ptr [edi]
 0041D767    lods        byte ptr [esi]
 0041D768    inc         eax
 0041D769    and         ah,byte ptr [eax-33]
 0041D76C    stc
 0041D76D    pop         esi
 0041D76E    daa
 0041D76F    lods        byte ptr [esi]
 0041D770    loopne      0041D7D0
 0041D772    pushad
 0041D773    int         0E4
 0041D775    pop         ebp
 0041D776    pushad
 0041D777    or          eax,0D8962C60
 0041D77C    and         cl,cl
 0041D77E    cwde
 0041D77F    loope       0041D761
 0041D781    retf        1A
 0041D784    loopne      0041D750
 0041D786    sbb         al,cl
 0041D788    cli
 0041D789    retf        82CA
 0041D78C    mov         ebp,0E0381AA8
 0041D791    dec         edx
 0041D792    sbb         eax,ecx
 0041D794    mov         al,[BAC11B5A]
 0041D799    pop         edx
 0041D79A    retf
 0041D79B    mov         al,11
>0041D79D    jle         0041D810
 0041D79F    dec         ebp
 0041D7A0    add         dl,dl
 0041D7A2    sbb         al,0
 0041D7A4    add         dl,dl
 0041D7A6    sbb         al,0C1
 0041D7A8    sbb         dl,dl
 0041D7AA    int         3
 0041D7AB    mov         al,0EC
 0041D7AD    pop         ss
 0041D7AF    xor         eax,dword ptr [eax-2E]
 0041D7B2    sbb         al,0
 0041D7B4    inc         eax
 0041D7B5    rcr         byte ptr [ecx+eax*8],cl
 0041D7B8    pop         edx
 0041D7B9    ror         ah,cl
 0041D7BB    mov         al,0C4
 0041D7BD    mov         dl,1C
 0041D7BF    shl         dword ptr [eax-2E],1C
 0041D7C3    shl         dword ptr [eax-5FFFE32E],0D2
 0041D7CA    sbb         al,0C1
 0041D7CC    mov         edx,2282CCD2
 0041D7D1    mov         dl,0CC
 0041D7D3    mov         al,0E0
 0041D7D5    rcr         byte ptr [eax+eax],cl
 0041D7D8    loopne      0041D7AC
 0041D7DA    sbb         al,0C1
 0041D7DC    cli
 0041D7DD    ror         ah,cl
 0041D7DF    mov         al,62
 0041D7E1    mov         dl,0CC
 0041D7E3    mov         al,0
 0041D7E5    rcr         dword ptr [ecx+eax*8],cl
 0041D7E8    add         dh,bl
 0041D7EA    sbb         al,0
 0041D7EC    add         dh,bl
 0041D7EE    sbb         al,0C1
 0041D7F0    sbb         bl,dh
 0041D7F2    int         3
 0041D7F3    mov         al,82
 0041D7F5    mov         esi,0DE2082CC
 0041D7FA    sbb         al,0
 0041D7FC    pushad
 0041D7FD    sub         dl,byte ptr [edi]
 0041D7FF    shl         dword ptr [eax],0DE
 0041D802    sbb         al,0C1
 0041D804    cmp         bl,dh
 0041D806    int         3
 0041D807    mov         al,0A2
 0041D809    mov         esi,0DE4082CC
 0041D80E    sbb         al,0
 0041D810    inc         eax
 0041D811    ficomp      word ptr [ecx+eax*8]
 0041D814    pop         edx
 0041D815    fmulp       st(4),st
 0041D817    mov         al,0E4
 0041D819    sbb         word ptr [ecx+60],1CDE
 0041D81F    add         byte ptr [eax-22],ah
 0041D822    sbb         al,0C1
>0041D824    jp          0041D804
 0041D826    int         3
 0041D827    mov         al,0E2
 0041D829    mov         esi,0DE8082CC
 0041D82E    sbb         al,0C1
 0041D830    call        CCBE:0282CCDE
 0041D837    mov         al,0A0
 0041D839    ficomp      word ptr [eax+eax]
 0041D83C    mov         al,[BAC11CDE]
 0041D841    fmulp       st(4),st
 0041D843    mov         al,22
 0041D845    mov         esi,0DEC082CC
 0041D84A    sbb         al,0
 0041D84C    rcr         dh,1C
 0041D84F    rcr         edx,0DE
 0041D852    int         3
 0041D853    mov         al,42
 0041D855    mov         esi,0DF2082CC
 0041D85A    sbb         al,0
 0041D85C    inc         eax
 0041D85D    adc         dl,byte ptr [edi]
 0041D85F    shl         dword ptr [eax],0DF
 0041D862    sbb         al,0C1
 0041D864    cmp         bl,bh
 0041D866    int         3
 0041D867    mov         al,0A2
 0041D869    mov         edi,0DA8082CC
 0041D86E    sbb         al,0C1
 0041D870    in          eax,7D
 0041D872    in          eax,1E
 0041D874    mov         dl,50
 0041D876    bound       esp,qword ptr [edi-5B343246]
 0041D87C    sbb         eax,54D52BCE
 0041D881    lds         edi,fword ptr [eax]
 0041D883    scas        dword ptr [edi]
 0041D884    mov         dl,43
 0041D886    bound       eax,qword ptr [eax-6E]
 0041D889    inc         ebx
>0041D88A    ja          0041D8CC
 0041D88C    mov         dl,43
>0041D88E    ja          0041D8D0
 0041D890    cmp         byte ptr [esi+9],bl
 0041D893    and         eax,dword ptr [eax-78]
 0041D896    ???
 0041D897    shl         byte ptr [eax+8],cl
 0041D89A    aaa
 0041D89B    add         byte ptr [edx],al
 0041D89D    cmp         dword ptr [ebx-65],0FFFFFFD0
 0041D8A1    mov         dword ptr [bp+si,0A22D6A60
 0041D8A8    loop        0041D902
 0041D8AA    adc         eax,137770CC
 0041D8AF    or          dword ptr [eax+ebp*4-17549C01],esi
 0041D8B6    sahf
 0041D8B7    sbb         eax,239D7412
 0041D8BC    push        eax
 0041D8BD    mov         dh,byte ptr [ebp-7F]
 0041D8C0    fnstcw      word ptr [esi-5A]
 0041D8C3    retf
 0041D8C4    sal         byte ptr [ecx+ecx*2+0D],1
 0041D8C8    mov         ebp,4BA33D01
 0041D8CD    or          dword ptr [ebp+32],edi
 0041D8D0    ret
*}
end;

//0041D8D4
procedure EncodingDataList;
begin
{*
 0041D8D4    lahf
 0041D8D5    dec         esi
 0041D8D6    add         byte ptr [eax],al
 0041D8D8    lahf
 0041D8D9    dec         esi
 0041D8DA    push        es
 0041D8DB    add         byte ptr [edi-17FFF0B2],bl
 0041D8E1    std
 0041D8E2    pop         ss
 0041D8E3    add         al,ch
 0041D8E5    std
 0041D8E6    sbb         eax,2DFDE900
 0041D8EB    add         cl,ch
 0041D8ED    std
 0041D8EE    xor         eax,dword ptr [eax]
 0041D8F0    scas        dword ptr [edi]
 0041D8F1    outs        dl,dword ptr [esi]
 0041D8F2    cmp         byte ptr [eax],al
 0041D8F4    scas        dword ptr [edi]
 0041D8F5    outs        dl,dword ptr [esi]
 0041D8F6    add         byte ptr ds:[edi-50FFBA91],ch
 0041D8FD    outs        dl,dword ptr [esi]
 0041D8FE    push        eax
 0041D8FF    add         byte ptr [edi-50FFA491],ch
 0041D905    outs        dl,dword ptr [esi]
 0041D906    add         byte ptr gs:[edi-50FF8F91],ch
 0041D90D    outs        dl,dword ptr [esi]
 0041D90E    add         byte ptr [eax],0B0
 0041D911    outs        dl,dword ptr [esi]
 0041D912    mov         word ptr [eax],es
 0041D914    mov         al,6F
 0041D916    xchg        eax,edi
 0041D917    add         byte ptr [eax-4FFF5D91],dh
 0041D91D    outs        dl,dword ptr [esi]
 0041D91E    lods        byte ptr [esi]
 0041D91F    add         byte ptr [eax-4FFF4891],dh
 0041D925    outs        dl,dword ptr [esi]
 0041D926    mov         dword ptr [eax],0D36FB1
 0041D92C    mov         cl,6F
 0041D92E    fiadd       word ptr [eax]
 0041D930    mov         cl,6F
 0041D932    jmp         F3B18A37
 0041D937    add         byte ptr [ecx-4EFF0191],dh
 0041D93D    outs        dl,dword ptr [esi]
 0041D93E    push        cs
 0041D93F    add         dword ptr [edx-4DFEE591],esi
 0041D945    outs        dl,dword ptr [esi]
 0041D946    and         eax,306FB201
 0041D94B    add         dword ptr [edx-4DFEC591],esi
 0041D951    outs        dl,dword ptr [esi]
 0041D952    inc         ebp
 0041D953    add         dword ptr [edx-4CFEAA91],esi
 0041D959    outs        dl,dword ptr [esi]
 0041D95A    popad
 0041D95B    add         dword ptr [ebx-4CFE9591],esi
 0041D961    outs        dl,dword ptr [esi]
>0041D962    jne         0041D965
 0041D964    mov         bl,6F
 0041D966    add         byte ptr [ecx],0B3
 0041D969    outs        dl,dword ptr [esi]
 0041D96A    mov         al,byte ptr [ecx]
 0041D96C    mov         bl,6F
 0041D96E    xchg        eax,ebp
 0041D96F    add         dword ptr [ebx-4BFE5A91],esi
 0041D975    outs        dl,dword ptr [esi]
 0041D976    mov         eax,0BF6FB401
 0041D97B    add         dword ptr [edi+ebp*2+6FB401C8],esi
 0041D982    rol         dword ptr [ecx],1
 0041D984    mov         ah,6F
 0041D986    fadd        qword ptr [ecx]
 0041D988    mov         ah,6F
 0041D98A    out         1,eax
 0041D98C    mov         ah,6F
 0041D98E    ???
 0041D98F    add         dword ptr [edi+ebp*2+6FB401FC],esi
 0041D996    or          al,2
 0041D998    mov         ch,6F
 0041D99A    sbb         eax,236FB502
 0041D99F    add         dh,byte ptr [ebp-4AFDD591]
 0041D9A5    outs        dl,dword ptr [esi]
 0041D9A6    xor         eax,3F6FB502
 0041D9AB    add         dh,byte ptr [ebp-4AFDB591]
 0041D9B1    outs        dl,dword ptr [esi]
 0041D9B2    pop         edx
 0041D9B3    add         dh,byte ptr [esi-49FD9591]
 0041D9B9    outs        dl,dword ptr [esi]
>0041D9BA    jno         0041D9BE
 0041D9BC    mov         dh,6F
>0041D9BE    jl          0041D9C2
 0041D9C0    mov         dh,6F
 0041D9C2    xchg        eax,dword ptr [edx]
 0041D9C4    mov         dh,6F
 0041D9C6    xchg        eax,ecx
 0041D9C7    add         dh,byte ptr [esi-49FD6391]
 0041D9CD    outs        dl,dword ptr [esi]
 0041D9CE    lods        byte ptr [esi]
 0041D9CF    add         dh,byte ptr [edi-48FD4291]
 0041D9D5    outs        dl,dword ptr [esi]
 0041D9D6    enter       0B702,6F
 0041D9DA    rol         dword ptr [edx],cl
 0041D9DC    mov         bh,6F
 0041D9DE    fld         qword ptr [edx]
 0041D9E0    mov         bh,6F
 0041D9E2    call        F8B190E9
 0041D9E7    add         bh,byte ptr [eax-47FCFB91]
 0041D9ED    outs        dl,dword ptr [esi]
 0041D9EE    adc         byte ptr [ebx],al
 0041D9F0    mov         eax,0B8031B6F
 0041D9F5    outs        dl,dword ptr [esi]
 0041D9F6    add         edi,dword ptr es:[eax-47FCCD91]
 0041D9FD    outs        dl,dword ptr [esi]
 0041D9FE    inc         ebx
 0041D9FF    add         edi,dword ptr [ecx-46FCB091]
 0041DA05    outs        dl,dword ptr [esi]
 0041DA06    pop         ebx
 0041DA07    add         edi,dword ptr [ecx-44FC9991]
 0041DA0D    outs        dl,dword ptr [esi]
>0041DA0E    jb          0041DA13
 0041DA10    mov         ebx,0BB037E6F
 0041DA15    outs        dl,dword ptr [esi]
 0041DA16    mov         dword ptr [ebx],eax
 0041DA18    mov         ebx,0BC03946F
 0041DA1D    outs        dl,dword ptr [esi]
 0041DA1E    mov         al,[AC6FBC03]
 0041DA23    add         edi,dword ptr [edi+ebp*2+6FBC03B7]
 0041DA2A    ret         0BC03
*}
end;

//0041DCC4
procedure EncodingNameList;
begin
{*
 0041DCC4    popad
>0041DCC5    jae         0041DD2A
 0041DCC7    imul        ebp,dword ptr [ecx],612D7375
>0041DCCE    jae         0041DD33
 0041DCD0    imul        ebp,dword ptr [ecx],73617363
 0041DCD7    arpl        word ptr [ecx+69],bp
 0041DCDA    add         byte ptr [ebp+74],dh
 0041DCDD    sub         ax,37
 0041DCE1    arpl        word ptr [ebx+75],si
 0041DCE4    outs        dl,byte ptr [esi]
 0041DCE5    imul        esp,dword ptr [ebx+6F],31316564
>0041DCEC    jne         0041DD62
 0041DCEE    aaa
 0041DCF0    add         byte ptr [ebp+74],dh
 0041DCF3    sub         ax,38
>0041DCF7    jne         0041DD6D
 0041DCF9    cmp         byte ptr [eax],al
 0041DCFC    arpl        word ptr [eax+38],si
 0041DCFF    xor         dword ptr [ecx],edi
 0041DD01    add         byte ptr [ecx+62],ch
 0041DD04    ins         dword ptr [edi],dl
 0041DD05    cmp         byte ptr [ecx],dh
 0041DD07    cmp         dword ptr [eax],eax
 0041DD09    imul        esi,dword ptr [ebx+6F],3538382D
 0041DD10    cmp         dword ptr ds:[73690031],ebp
 0041DD16    outs        dl,dword ptr [esi]
 0041DD17    sub         eax,312D7269
 0041DD1C    xor         byte ptr [eax],dh
 0041DD1E    add         byte ptr [ecx+73],ch
 0041DD21    outs        dl,dword ptr [esi]
 0041DD22    cmp         byte ptr [eax],bh
 0041DD24    xor         eax,312D39
 0041DD29    imul        esi,dword ptr [ebx+6F],3538385F
 0041DD30    cmp         dword ptr ds:[73690031],ebp
 0041DD36    outs        dl,dword ptr [esi]
 0041DD37    pop         edi
 0041DD38    cmp         byte ptr [eax],bh
 0041DD3A    xor         eax,3A312D39
 0041DD3F    xor         dword ptr [ecx],edi
 0041DD41    cmp         byte ptr [edi],dh
 0041DD43    add         byte ptr [ebx+73],ah
 0041DD46    imul        esi,dword ptr [ebx+6F],6974616C
 0041DD4D    outs        dl,byte ptr [esi]
 0041DD4E    xor         dword ptr [eax],eax
 0041DD50    imul        esi,dword ptr [ebx+6F],3538382D
 0041DD57    cmp         dword ptr ds:[73690032],ebp
 0041DD5D    outs        dl,dword ptr [esi]
 0041DD5E    sub         eax,312D7269
 0041DD63    xor         byte ptr [ecx],dh
 0041DD65    add         byte ptr [ecx+73],ch
 0041DD68    outs        dl,dword ptr [esi]
 0041DD69    cmp         byte ptr [eax],bh
 0041DD6B    xor         eax,322D39
 0041DD70    imul        esi,dword ptr [ebx+6F],3538385F
 0041DD77    cmp         dword ptr ds:[73690032],ebp
 0041DD7D    outs        dl,dword ptr [esi]
 0041DD7E    pop         edi
 0041DD7F    cmp         byte ptr [eax],bh
 0041DD81    xor         eax,3A322D39
 0041DD86    xor         dword ptr [ecx],edi
 0041DD88    cmp         byte ptr [edi],dh
 0041DD8A    add         byte ptr [ebx+73],ah
 0041DD8D    imul        esi,dword ptr [ebx+6F],6974616C
 0041DD94    outs        dl,byte ptr [esi]
 0041DD95    xor         al,byte ptr [eax]
 0041DD97    imul        esi,dword ptr [ebx+6F],3538382D
 0041DD9E    cmp         dword ptr ds:[73690033],ebp
 0041DDA4    outs        dl,dword ptr [esi]
 0041DDA5    sub         eax,312D7269
 0041DDAA    xor         byte ptr [ecx],bh
 0041DDAC    add         byte ptr [ecx+73],ch
 0041DDAF    outs        dl,dword ptr [esi]
 0041DDB0    cmp         byte ptr [eax],bh
 0041DDB2    xor         eax,332D39
 0041DDB7    imul        esi,dword ptr [ebx+6F],3538385F
 0041DDBE    cmp         dword ptr ds:[73690033],ebp
 0041DDC4    outs        dl,dword ptr [esi]
 0041DDC5    pop         edi
 0041DDC6    cmp         byte ptr [eax],bh
 0041DDC8    xor         eax,3A332D39
 0041DDCD    xor         dword ptr [ecx],edi
 0041DDCF    cmp         byte ptr [eax],bh
 0041DDD1    add         byte ptr [ebx+73],ah
 0041DDD4    imul        esi,dword ptr [ebx+6F],6974616C
 0041DDDB    outs        dl,byte ptr [esi]
 0041DDDC    xor         eax,dword ptr [eax]
 0041DDDE    imul        esi,dword ptr [ebx+6F],3538382D
 0041DDE5    cmp         dword ptr ds:[73690034],ebp
 0041DDEB    outs        dl,dword ptr [esi]
 0041DDEC    sub         eax,312D7269
 0041DDF1    xor         dword ptr [eax],esi
 0041DDF3    add         byte ptr [ecx+73],ch
 0041DDF6    outs        dl,dword ptr [esi]
 0041DDF7    cmp         byte ptr [eax],bh
 0041DDF9    xor         eax,342D39
 0041DDFE    imul        esi,dword ptr [ebx+6F],3538385F
 0041DE05    cmp         dword ptr ds:[73690034],ebp
 0041DE0B    outs        dl,dword ptr [esi]
 0041DE0C    pop         edi
 0041DE0D    cmp         byte ptr [eax],bh
 0041DE0F    xor         eax,3A342D39
 0041DE14    xor         dword ptr [ecx],edi
 0041DE16    cmp         byte ptr [eax],bh
 0041DE18    add         byte ptr [ebx+73],ah
 0041DE1B    imul        esi,dword ptr [ebx+6F],6974616C
 0041DE22    outs        dl,byte ptr [esi]
 0041DE23    xor         al,0
 0041DE25    arpl        word ptr [ecx+72],di
 0041DE28    imul        ebp,dword ptr [esp+ebp*2+69],73690063
 0041DE30    outs        dl,dword ptr [esi]
 0041DE31    sub         eax,39353838
 0041DE36    sub         eax,73690035
 0041DE3B    outs        dl,dword ptr [esi]
 0041DE3C    sub         eax,312D7269
 0041DE41    xor         al,34
 0041DE43    add         byte ptr [ecx+73],ch
 0041DE46    outs        dl,dword ptr [esi]
 0041DE47    cmp         byte ptr [eax],bh
 0041DE49    xor         eax,352D39
 0041DE4E    imul        esi,dword ptr [ebx+6F],3538385F
 0041DE55    cmp         dword ptr ds:[73690035],ebp
 0041DE5B    outs        dl,dword ptr [esi]
 0041DE5C    pop         edi
 0041DE5D    cmp         byte ptr [eax],bh
 0041DE5F    xor         eax,3A352D39
 0041DE64    xor         dword ptr [ecx],edi
 0041DE66    cmp         byte ptr [eax],bh
 0041DE68    add         byte ptr [ebx+73],ah
 0041DE6B    imul        esi,dword ptr [ebx+6F],6974616C
 0041DE72    outs        dl,byte ptr [esi]
 0041DE73    arpl        word ptr [ecx+72],di
 0041DE76    imul        ebp,dword ptr [esp+ebp*2+69],72610063
 0041DE7E    popad
 0041DE7F    bound       ebp,qword ptr [ecx+63]
 0041DE82    add         byte ptr [ecx+73],ah
 0041DE85    ins         dword ptr [edi],dl
 0041DE86    outs        dl,dword ptr [esi]
 0041DE87    sub         eax,383037
 0041DE8C    arpl        word ptr gs:[ebp+61],bp
 0041DE90    sub         eax,343131
 0041DE95    imul        esi,dword ptr [ebx+6F],3538382D
 0041DE9C    cmp         dword ptr ds:[73690036],ebp
 0041DEA2    outs        dl,dword ptr [esi]
 0041DEA3    sub         eax,312D7269
 0041DEA8    xor         dh,byte ptr [edi]
 0041DEAA    add         byte ptr [ecx+73],ch
 0041DEAD    outs        dl,dword ptr [esi]
 0041DEAE    cmp         byte ptr [eax],bh
 0041DEB0    xor         eax,362D39
 0041DEB5    imul        esi,dword ptr [ebx+6F],3538385F
 0041DEBC    cmp         dword ptr ds:[73690036],ebp
 0041DEC2    outs        dl,dword ptr [esi]
 0041DEC3    pop         edi
 0041DEC4    cmp         byte ptr [eax],bh
 0041DEC6    xor         eax,3A362D39
 0041DECB    xor         dword ptr [ecx],edi
 0041DECD    cmp         byte ptr [edi],dh
 0041DECF    add         byte ptr [ebx+73],ah
 0041DED2    imul        esi,dword ptr [ebx+6F],6974616C
 0041DED9    outs        dl,byte ptr [esi]
 0041DEDA    popad
>0041DEDB    jb          0041DF3E
 0041DEDD    bound       ebp,qword ptr [ecx+63]
 0041DEE0    add         byte ptr [edi+72],ah
 0041DEE3    ???
 0041DEE4    imul        eax,dword ptr gs:[eax],67
>0041DEE8    jb          0041DF4F
 0041DEEA    imul        edi,dword ptr gs:[eax],0
 0041DEEE    imul        esi,dword ptr [ebx+6F],3538382D
 0041DEF5    cmp         dword ptr ds:[73690037],ebp
 0041DEFB    outs        dl,dword ptr [esi]
 0041DEFC    cmp         byte ptr [eax],bh
 0041DEFE    xor         eax,372D39
 0041DF03    imul        esi,dword ptr [ebx+6F],3538385F
 0041DF0A    cmp         dword ptr ds:[73690037],ebp
 0041DF10    outs        dl,dword ptr [esi]
 0041DF11    pop         edi
 0041DF12    cmp         byte ptr [eax],bh
 0041DF14    xor         eax,3A372D39
 0041DF19    xor         dword ptr [ecx],edi
 0041DF1B    cmp         byte ptr [edi],dh
 0041DF1D    add         byte ptr [ecx+73],ch
 0041DF20    outs        dl,dword ptr [esi]
 0041DF21    pop         edi
 0041DF22    cmp         byte ptr [eax],bh
 0041DF24    xor         eax,3A372D39
 0041DF29    xor         dh,byte ptr [eax]
 0041DF2B    xor         byte ptr [ebx],dh
 0041DF2D    add         byte ptr [eax+65],ch
 0041DF30    bound       esi,qword ptr [edx+65]
>0041DF33    ja          0041DF35
 0041DF35    imul        esi,dword ptr [ebx+6F],3538382D
 0041DF3C    cmp         dword ptr ds:[73690038],ebp
 0041DF42    outs        dl,dword ptr [esi]
 0041DF43    sub         eax,312D7269
 0041DF48    xor         edi,dword ptr [eax]
 0041DF4A    add         byte ptr [ecx+73],ch
 0041DF4D    outs        dl,dword ptr [esi]
 0041DF4E    cmp         byte ptr [eax],bh
 0041DF50    xor         eax,382D39
 0041DF55    imul        esi,dword ptr [ebx+6F],3538385F
 0041DF5C    cmp         dword ptr ds:[73690038],ebp
 0041DF62    outs        dl,dword ptr [esi]
 0041DF63    pop         edi
 0041DF64    cmp         byte ptr [eax],bh
 0041DF66    xor         eax,3A382D39
 0041DF6B    xor         dword ptr [ecx],edi
 0041DF6D    cmp         byte ptr [eax],bh
 0041DF6F    add         byte ptr [ebx+73],ah
 0041DF72    imul        esi,dword ptr [ebx+6F],6974616C
 0041DF79    outs        dl,byte ptr [esi]
 0041DF7A    push        65726265
>0041DF7F    ja          0041DF81
 0041DF81    imul        esi,dword ptr [ebx+6F],3538382D
 0041DF88    cmp         dword ptr ds:[73690039],ebp
 0041DF8E    outs        dl,dword ptr [esi]
 0041DF8F    sub         eax,312D7269
 0041DF94    xor         al,38
 0041DF96    add         byte ptr [ecx+73],ch
 0041DF99    outs        dl,dword ptr [esi]
 0041DF9A    cmp         byte ptr [eax],bh
 0041DF9C    xor         eax,392D39
 0041DFA1    imul        esi,dword ptr [ebx+6F],3538385F
 0041DFA8    cmp         dword ptr ds:[73690039],ebp
 0041DFAE    outs        dl,dword ptr [esi]
 0041DFAF    pop         edi
 0041DFB0    cmp         byte ptr [eax],bh
 0041DFB2    xor         eax,3A392D39
 0041DFB7    xor         dword ptr [ecx],edi
 0041DFB9    cmp         byte ptr [ecx],bh
 0041DFBB    add         byte ptr [ebx+73],ah
 0041DFBE    imul        esi,dword ptr [ebx+6F],6974616C
 0041DFC5    outs        dl,byte ptr [esi]
 0041DFC6    xor         eax,6F736900
 0041DFCB    sub         eax,39353838
 0041DFD0    sub         eax,69003031
>0041DFD5    jae         0041E046
 0041DFD7    sub         eax,312D7269
 0041DFDC    xor         eax,73690037
 0041DFE1    outs        dl,dword ptr [esi]
 0041DFE2    cmp         byte ptr [eax],bh
 0041DFE4    xor         eax,30312D39
 0041DFE9    add         byte ptr [ecx+73],ch
 0041DFEC    outs        dl,dword ptr [esi]
 0041DFED    pop         edi
 0041DFEE    cmp         byte ptr [eax],bh
 0041DFF0    xor         eax,30312D39
 0041DFF5    add         byte ptr [ecx+73],ch
 0041DFF8    outs        dl,dword ptr [esi]
 0041DFF9    pop         edi
 0041DFFA    cmp         byte ptr [eax],bh
 0041DFFC    xor         eax,30312D39
 0041E001    cmp         dh,byte ptr [ecx]
 0041E003    cmp         dword ptr [ecx],edi
 0041E005    xor         al,byte ptr [eax]
 0041E007    arpl        word ptr [ebx+69],si
>0041E00A    jae         0041E07B
 0041E00C    ins         byte ptr [edi],dl
 0041E00D    popad
>0041E00E    je          0041E079
 0041E010    outs        dl,byte ptr [esi]
 0041E011    add         byte ptr ss:[ecx+73],ch
 0041E015    outs        dl,dword ptr [esi]
 0041E016    sub         eax,39353838
 0041E01B    sub         eax,69003131
>0041E020    jae         0041E091
 0041E022    cmp         byte ptr [eax],bh
 0041E024    xor         eax,31312D39
 0041E029    add         byte ptr [ecx+73],ch
 0041E02C    outs        dl,dword ptr [esi]
 0041E02D    pop         edi
 0041E02E    cmp         byte ptr [eax],bh
 0041E030    xor         eax,31312D39
 0041E035    add         byte ptr [ecx+73],ch
 0041E038    outs        dl,dword ptr [esi]
 0041E039    sub         eax,39353838
 0041E03E    sub         eax,69003331
>0041E043    jae         0041E0B4
 0041E045    sub         eax,312D7269
 0041E04A    aaa
 0041E04B    cmp         dword ptr [eax],eax
 0041E04D    imul        esi,dword ptr [ebx+6F],39353838
 0041E054    sub         eax,69003331
>0041E059    jae         0041E0CA
 0041E05B    pop         edi
 0041E05C    cmp         byte ptr [eax],bh
 0041E05E    xor         eax,33312D39
 0041E063    add         byte ptr [ecx+73],ch
 0041E066    outs        dl,dword ptr [esi]
 0041E067    sub         eax,39353838
 0041E06C    sub         eax,69003431
>0041E071    jae         0041E0E2
 0041E073    sub         eax,746C6563
 0041E078    imul        esp,dword ptr [ebx],2D6F7369
 0041E07F    imul        esi,dword ptr [edx+2D],393931
 0041E086    imul        esi,dword ptr [ebx+6F],39353838
 0041E08D    sub         eax,69003431
>0041E092    jae         0041E103
 0041E094    pop         edi
 0041E095    cmp         byte ptr [eax],bh
 0041E097    xor         eax,34312D39
 0041E09C    add         byte ptr [ecx+73],ch
 0041E09F    outs        dl,dword ptr [esi]
 0041E0A0    pop         edi
 0041E0A1    cmp         byte ptr [eax],bh
 0041E0A3    xor         eax,34312D39
 0041E0A8    cmp         dh,byte ptr [ecx]
 0041E0AA    cmp         dword ptr [ecx],edi
 0041E0AC    cmp         byte ptr [eax],al
 0041E0AE    imul        esi,dword ptr [ebx+6F],3538382D
 0041E0B5    cmp         dword ptr ds:[69003531],ebp
>0041E0BB    jae         0041E12C
 0041E0BD    sub         eax,322D7269
 0041E0C2    xor         byte ptr [ebx],dh
 0041E0C4    add         byte ptr [ecx+73],ch
 0041E0C7    outs        dl,dword ptr [esi]
 0041E0C8    cmp         byte ptr [eax],bh
 0041E0CA    xor         eax,35312D39
 0041E0CF    add         byte ptr [ecx+73],ch
 0041E0D2    outs        dl,dword ptr [esi]
 0041E0D3    pop         edi
 0041E0D4    cmp         byte ptr [eax],bh
 0041E0D6    xor         eax,35312D39
 0041E0DB    add         byte ptr [ecx+73],ch
 0041E0DE    outs        dl,dword ptr [esi]
 0041E0DF    pop         edi
 0041E0E0    cmp         byte ptr [eax],bh
 0041E0E2    xor         eax,35312D39
 0041E0E7    cmp         dh,byte ptr [ecx]
 0041E0E9    cmp         dword ptr [ecx],edi
 0041E0EB    cmp         byte ptr [eax],al
 0041E0ED    imul        esi,dword ptr [ebx+6F],3538382D
 0041E0F4    cmp         dword ptr ds:[69003631],ebp
>0041E0FA    jae         0041E16B
 0041E0FC    sub         eax,322D7269
 0041E101    xor         dh,byte ptr [esi]
 0041E103    add         byte ptr [ecx+73],ch
 0041E106    outs        dl,dword ptr [esi]
 0041E107    cmp         byte ptr [eax],bh
 0041E109    xor         eax,36312D39
 0041E10E    add         byte ptr [ecx+73],ch
 0041E111    outs        dl,dword ptr [esi]
 0041E112    pop         edi
 0041E113    cmp         byte ptr [eax],bh
 0041E115    xor         eax,36312D39
 0041E11A    add         byte ptr [ecx+73],ch
 0041E11D    outs        dl,dword ptr [esi]
 0041E11E    pop         edi
 0041E11F    cmp         byte ptr [eax],bh
 0041E121    xor         eax,36312D39
 0041E126    cmp         dh,byte ptr [edx]
 0041E128    xor         byte ptr [eax],dh
 0041E12A    xor         dword ptr [eax],eax
 0041E12C    arpl        word ptr [eax+39],si
 0041E12F    xor         esi,dword ptr [edx]
 0041E131    add         byte ptr [ebx+68],dh
 0041E134    imul        esp,dword ptr [esi+74],73696A2D
 0041E13B    add         byte ptr [ebx+68],dh
 0041E13E    imul        esp,dword ptr [esi+74],73696A5F
 0041E145    add         byte ptr [ebx+6A],dh
 0041E148    imul        esi,dword ptr [ebx],68737363
 0041E14F    imul        esp,dword ptr [esi+74],73696A
 0041E156    arpl        word ptr [eax+39],si
 0041E159    xor         esi,dword ptr [esi]
 0041E15B    add         byte ptr [edi+69],dh
 0041E15E    outs        dl,byte ptr [esi]
 0041E15F    outs        dl,dword ptr fs:[esi]
>0041E161    ja          0041E1D6
 0041E163    sub         eax,363339
 0041E168    bound       esi,qword ptr [bp+si
 0041E16B    xor         esi,dword ptr [ecx]
 0041E16D    xor         al,byte ptr [eax]
 0041E16F    arpl        word ptr [ebx+67],si
 0041E172    bound       esi,qword ptr [edx]
 0041E174    xor         esi,dword ptr [ecx]
 0041E176    xor         al,byte ptr [eax]
 0041E178    arpl        word ptr [eax+39],si
 0041E17B    xor         al,39
 0041E17D    add         byte ptr [ecx+73],ch
 0041E180    outs        dl,dword ptr [esi]
 0041E181    sub         eax,312D7269
 0041E186    xor         al,39
 0041E188    add         byte ptr [ebx+6F],ch
>0041E18B    jb          0041E1F2
 0041E18D    popad
 0041E18E    outs        dl,byte ptr [esi]
 0041E18F    add         byte ptr [ebx+73],ch
 0041E192    arpl        word ptr [edi+35],bx
 0041E195    xor         byte ptr ss:[ecx],dh
 0041E198    add         byte ptr [ebx+73],ch
 0041E19B    pop         edi
 0041E19C    arpl        word ptr [edi+35],bx
 0041E19F    xor         byte ptr ss:[ecx],dh
 0041E1A2    sub         eax,37383931
 0041E1A7    add         byte ptr [ebx+73],ch
 0041E1AA    pop         edi
 0041E1AB    arpl        word ptr [edi+35],bx
 0041E1AE    xor         byte ptr ss:[ecx],dh
 0041E1B1    sub         eax,39383931
 0041E1B6    add         byte ptr [ebx+73],ah
 0041E1B9    imul        esi,dword ptr [ebx+63],35
 0041E1BD    xor         byte ptr ss:[ecx],dh
 0041E1C0    xor         dword ptr [ecx],edi
 0041E1C2    cmp         byte ptr [edi],dh
 0041E1C4    add         byte ptr [ebx+70],ah
 0041E1C7    cmp         dword ptr ds:[69620030],esi
 0041E1CD    sub         eax,69620035
 0041E1D3    sub         eax,65766966
 0041E1D9    add         byte ptr [edx+69],ah
 0041E1DC    xor         eax,67696200
 0041E1E2    imul        si,word ptr [esi+65],6300
 0041E1E8    outs        dl,byte ptr [esi]
 0041E1E9    sub         eax,35676962
 0041E1EE    add         byte ptr [ebx+73],ah
 0041E1F1    bound       ebp,qword ptr [ecx+67]
 0041E1F4    xor         eax,73637500
 0041E1F9    sub         eax,73630032
>0041E1FE    jne         0041E26E
 0041E200    imul        esp,dword ptr [ebx+6F],75006564
>0041E207    je          0041E26F
 0041E209    sub         eax,75003631
>0041E20E    je          0041E276
 0041E210    sub         eax,656C3631
 0041E215    add         byte ptr [ebp+74],dh
 0041E218    sub         ax,3631
 0041E21C    bound       esp,qword ptr [ebp]
 0041E21F    arpl        word ptr [eax+31],si
 0041E222    xor         dh,byte ptr ds:[69770030]
 0041E228    outs        dl,byte ptr [esi]
 0041E229    outs        dl,dword ptr fs:[esi]
>0041E22B    ja          0041E2A0
 0041E22D    sub         eax,30353231
 0041E232    add         byte ptr [ebx+70],ah
 0041E235    xor         dword ptr [edx],esi
 0041E237    xor         eax,69770031
 0041E23C    outs        dl,byte ptr [esi]
 0041E23D    outs        dl,dword ptr fs:[esi]
>0041E23F    ja          0041E2B4
 0041E241    sub         eax,31353231
 0041E246    add         byte ptr [ebx+70],ah
 0041E249    xor         dword ptr [edx],esi
 0041E24B    xor         eax,69770032
 0041E250    outs        dl,byte ptr [esi]
 0041E251    outs        dl,dword ptr fs:[esi]
>0041E253    ja          0041E2C8
 0041E255    sub         eax,32353231
 0041E25A    add         byte ptr [ebx+70],ah
 0041E25D    xor         dword ptr [edx],esi
 0041E25F    xor         eax,69770033
 0041E264    outs        dl,byte ptr [esi]
 0041E265    outs        dl,dword ptr fs:[esi]
>0041E267    ja          0041E2DC
 0041E269    sub         eax,33353231
 0041E26E    add         byte ptr [ebx+70],ah
 0041E271    xor         dword ptr [edx],esi
 0041E273    xor         eax,69770034
 0041E278    outs        dl,byte ptr [esi]
 0041E279    outs        dl,dword ptr fs:[esi]
>0041E27B    ja          0041E2F0
 0041E27D    sub         eax,34353231
 0041E282    add         byte ptr [ebx+70],ah
 0041E285    xor         dword ptr [edx],esi
 0041E287    xor         eax,69770035
 0041E28C    outs        dl,byte ptr [esi]
 0041E28D    outs        dl,dword ptr fs:[esi]
>0041E28F    ja          0041E304
 0041E291    sub         eax,35353231
 0041E296    add         byte ptr [ebx+70],ah
 0041E299    xor         dword ptr [edx],esi
 0041E29B    xor         eax,69770036
 0041E2A0    outs        dl,byte ptr [esi]
 0041E2A1    outs        dl,dword ptr fs:[esi]
>0041E2A3    ja          0041E318
 0041E2A5    sub         eax,36353231
 0041E2AA    add         byte ptr [ebx+70],ah
 0041E2AD    xor         dword ptr [edx],esi
 0041E2AF    xor         eax,69770037
 0041E2B4    outs        dl,byte ptr [esi]
 0041E2B5    outs        dl,dword ptr fs:[esi]
>0041E2B7    ja          0041E32C
 0041E2B9    sub         eax,37353231
 0041E2BE    add         byte ptr [ebx+70],ah
 0041E2C1    xor         dword ptr [edx],esi
 0041E2C3    xor         eax,69770038
 0041E2C8    outs        dl,byte ptr [esi]
 0041E2C9    outs        dl,dword ptr fs:[esi]
>0041E2CB    ja          0041E340
 0041E2CD    sub         eax,38353231
 0041E2D2    add         byte ptr [ebx+6F],ch
 0041E2D5    imul        edi,dword ptr [eax],6300722D
 0041E2DB    push        73656E69
 0041E2E0    add         byte ptr gs:[edi+62],ah
 0041E2E4    pop         edi
 0041E2E5    xor         dh,byte ptr [ebx]
 0041E2E7    xor         dword ptr [edx],esi
 0041E2E9    sub         eax,69003038
>0041E2EE    jae         0041E35F
 0041E2F0    sub         eax,352D7269
 0041E2F5    cmp         byte ptr [eax],al
 0041E2F7    arpl        word ptr [ebx+69],si
>0041E2FA    jae         0041E36B
 0041E2FC    xor         eax,32626738
 0041E301    xor         esi,dword ptr [ecx]
 0041E303    xor         bh,byte ptr [eax]
 0041E305    xor         byte ptr [eax],al
 0041E307    imul        ebp,dword ptr [edi+69],38
 0041E30B    sub         eax,73690075
 0041E310    outs        dl,dword ptr [esi]
 0041E311    sub         eax,32323032
 0041E316    sub         eax,6300706A
>0041E31B    jae         0041E386
>0041E31D    jae         0041E38E
 0041E31F    xor         dh,byte ptr [eax]
 0041E321    xor         dh,byte ptr [edx]
 0041E323    push        70
 0041E325    add         byte ptr [ecx+73],ch
 0041E328    outs        dl,dword ptr [esi]
 0041E329    sub         eax,32323032
 0041E32E    sub         eax,6300726B
>0041E333    jae         0041E39E
>0041E335    jae         0041E3A6
 0041E337    xor         dh,byte ptr [eax]
 0041E339    xor         dh,byte ptr [edx]
 0041E33B    imul        esi,dword ptr [edx],69
>0041E33F    jae         0041E3B0
 0041E341    sub         eax,32323032
 0041E346    sub         eax,65006E63
>0041E34B    jne         0041E3B0
 0041E34D    sub         eax,6500706A
>0041E352    jne         0041E3B7
 0041E354    push        70
 0041E356    add         byte ptr [ebx+73],ah
 0041E359    jne         0041E3BF
>0041E35C    jo          0041E3C9
 0041E35E    ins         word ptr [edi],dl
>0041E361    je          0041E3CD
 0041E363    popad
>0041E364    jo          0041E3C7
 0041E366    outs        dl,byte ptr [esi]
 0041E367    jae         0041E3CF
 0041E36A    add         byte ptr [ebp+75],ah
 0041E36D    arpl        word ptr ds:[65006E63],bp
>0041E373    jne         0041E3D8
 0041E375    arpl        word ptr [esi],bp
 0041E378    jne         0041E3DE
 0041E37B    sub         eax,6500726B
>0041E380    jne         0041E3E5
 0041E382    imul        esi,dword ptr [edx],65
>0041E386    jne         0041E3EB
 0041E388    sub         eax,65007774
>0041E38D    jne         0041E3F2
>0041E38F    je          0041E408
 0041E391    add         byte ptr [ebx+73],ah
 0041E394    jne         0041E3FA
>0041E397    je          0041E410
 0041E399    add         byte ptr [eax+7A],ch
 0041E39C    sub         eax,322D6267
 0041E3A1    xor         esi,dword ptr [ecx]
 0041E3A3    xor         al,byte ptr [eax]
 0041E3A5    bound       esi,qword ptr [bx+di
 0041E3A8    cmp         byte ptr [eax],dh
 0041E3AA    xor         esi,dword ptr [eax]
 0041E3AC    add         byte ptr [ebx+esi],dh
 0041E3AF    aaa
 0041E3B0    add         byte ptr [ebx+70],ah
 0041E3B3    xor         al,33
 0041E3B5    aaa
 0041E3B6    add         byte ptr [ecx+62],ch
 0041E3B9    ins         dword ptr [edi],dl
 0041E3BA    xor         al,33
 0041E3BC    aaa
 0041E3BD    add         byte ptr [ebx+73],ah
>0041E3C0    jo          0041E425
 0041E3C2    cmp         byte ptr [ebx+6F],ah
 0041E3C5    ???
 0041E3C6    jo          0041E42A
 0041E3C9    xor         al,33
 0041E3CD    aaa
 0041E3CE    add         byte ptr [ebx+70],ah
 0041E3D1    aaa
 0041E3D2    xor         esi,dword ptr [edi]
 0041E3D4    add         byte ptr [ebx+70],ah
 0041E3D7    aaa
 0041E3D8    aaa
 0041E3D9    xor         eax,6D626900
 0041E3DE    aaa
 0041E3DF    aaa
 0041E3E0    xor         eax,70736300
 0041E3E5    arpl        word ptr [edi],si
 0041E3E7    aaa
 0041E3E8    xor         eax,746C6162
 0041E3ED    imul        esp,dword ptr [ebx],303538
 0041E3F4    arpl        word ptr [eax+38],si
 0041E3F7    xor         eax,62690030
 0041E3FC    ins         dword ptr [edi],dl
 0041E3FD    cmp         byte ptr ds:[73630030],dh
>0041E403    jo          0041E468
 0041E405    cmp         byte ptr ds:[6C756D30],dh
>0041E40B    je          0041E476
 0041E40D    ins         byte ptr [edi],dl
 0041E40E    imul        ebp,dword ptr [esi+67],6C6175
 0041E415    cmp         byte ptr ds:[70630032],dh
 0041E41B    cmp         byte ptr ds:[62690032],dh
 0041E421    ins         dword ptr [edi],dl
 0041E422    cmp         byte ptr ds:[73630032],dh
>0041E428    jo          0041E48D
>0041E42A    jo          0041E464
 0041E42C    xor         eax,70630032
 0041E431    cmp         byte ptr ds:[35380033],dh
 0041E437    xor         eax,38706300
 0041E43C    xor         eax,62690035
 0041E441    ins         dword ptr [edi],dl
 0041E442    cmp         byte ptr ds:[73630035],dh
 0041E448    imul        esp,dword ptr [edx+6D],353538
 0041E44F    cmp         byte ptr ds:[70630037],dh
 0041E455    cmp         byte ptr ds:[62690037],dh
 0041E45B    ins         dword ptr [edi],dl
 0041E45C    cmp         byte ptr ds:[73630037],dh
 0041E462    imul        esp,dword ptr [edx+6D],373538
 0041E469    arpl        word ptr [eax+38],si
 0041E46C    xor         eax,36380038
 0041E471    xor         byte ptr [eax],al
 0041E473    arpl        word ptr [eax+38],si
 0041E476    xor         byte ptr ss:[eax],al
 0041E479    imul        esp,dword ptr [edx+6D],303638
 0041E480    arpl        word ptr [ebx+69],si
 0041E483    bound       ebp,qword ptr [ebp+38]
 0041E486    xor         byte ptr ss:[eax],al
 0041E489    cmp         byte ptr [esi],dh
 0041E48B    xor         dword ptr [eax],eax
 0041E48D    arpl        word ptr [eax+2D],si
 0041E490    imul        esi,dword ptr [ebx],36387063
 0041E497    xor         dword ptr [eax],eax
 0041E499    imul        esp,dword ptr [edx+6D],313638
 0041E4A0    arpl        word ptr [ebx+69],si
 0041E4A3    bound       ebp,qword ptr [ebp+38]
 0041E4A6    xor         dword ptr ss:[eax],eax
 0041E4A9    cmp         byte ptr [esi],dh
 0041E4AB    xor         al,byte ptr [eax]
 0041E4AD    arpl        word ptr [eax+38],si
 0041E4B0    xor         al,byte ptr ss:[eax]
 0041E4B3    imul        esp,dword ptr [edx+6D],323638
 0041E4BA    arpl        word ptr [ebx+70],si
 0041E4BD    arpl        word ptr [eax],di
 0041E4BF    xor         ch,byte ptr ss:[ecx+74]
 0041E4C4    imul        ebp,dword ptr [esi+68],65726265
>0041E4CB    ja          0041E4CD
 0041E4CD    cmp         byte ptr [esi],dh
 0041E4CF    xor         eax,dword ptr [eax]
 0041E4D1    arpl        word ptr [eax+38],si
 0041E4D4    xor         eax,dword ptr ss:[eax]
 0041E4D7    imul        esp,dword ptr [edx+6D],333638
 0041E4DE    arpl        word ptr [ebx+69],si
 0041E4E1    bound       ebp,qword ptr [ebp+38]
 0041E4E4    xor         eax,dword ptr ss:[eax]
 0041E4E7    arpl        word ptr [eax+38],si
 0041E4EA    xor         al,0
 0041E4ED    imul        esp,dword ptr [edx+6D],343638
 0041E4F4    arpl        word ptr [ebx+69],si
 0041E4F7    bound       ebp,qword ptr [ebp+38]
 0041E4FA    xor         al,0
 0041E4FD    cmp         byte ptr [esi],dh
 0041E4FF    xor         eax,38706300
 0041E504    xor         eax,6D626900
 0041E50A    cmp         byte ptr [esi],dh
 0041E50C    xor         eax,69736300
 0041E511    bound       ebp,qword ptr [ebp+38]
 0041E514    xor         eax,36363800
 0041E51A    add         byte ptr [ebx+70],ah
 0041E51D    cmp         byte ptr [esi],dh
 0041E51F    add         byte ptr ss:[ecx+62],ch
 0041E523    ins         dword ptr [edi],dl
 0041E524    cmp         byte ptr [esi],dh
 0041E526    add         byte ptr ss:[ebx+73],ah
 0041E52A    imul        esp,dword ptr [edx+6D],363638
 0041E531    cmp         byte ptr [esi],dh
 0041E533    cmp         dword ptr [eax],eax
 0041E535    arpl        word ptr [eax+2D],si
 0041E538    jb          0041E53B
 0041E53B    arpl        word ptr [eax+38],si
 0041E53E    cmp         dword ptr ss:[eax],eax
 0041E541    imul        esp,dword ptr [edx+6D],393638
 0041E548    arpl        word ptr [ebx+69],si
 0041E54B    bound       ebp,qword ptr [ebp+38]
 0041E54E    cmp         dword ptr ss:[eax],eax
 0041E551    arpl        word ptr [eax+38],si
 0041E554    aaa
 0041E555    xor         al,0
>0041E557    ja          0041E5C2
 0041E559    outs        dl,byte ptr [esi]
 0041E55A    outs        dl,dword ptr fs:[esi]
>0041E55C    ja          0041E5D1
 0041E55E    sub         eax,343738
 0041E563    imul        esi,dword ptr [ebx+6F],2D72692D
 0041E56A    xor         dword ptr [esi],esi
 0041E56C    add         byte ptr ss:[ecx+ebp*2+73],dh
 0041E571    sub         eax,303236
>0041E576    je          0041E5E1
>0041E578    jae         0041E5B0
 0041E57A    xor         dh,byte ptr [eax]
 0041E57C    add         byte ptr [ecx+ebp*2+73],dh
 0041E580    xor         dh,byte ptr ss:[eax]
 0041E583    sub         eax,69740030
>0041E588    jae         0041E5C0
 0041E58A    xor         dh,byte ptr [eax]
 0041E58C    xor         dh,byte ptr cs:[312D3932]
 0041E593    add         byte ptr [ecx+ebp*2+73],dh
 0041E597    xor         dh,byte ptr ss:[eax]
 0041E59A    xor         dh,byte ptr cs:[302D3333]
 0041E5A1    add         byte ptr [ecx+ebp*2+73],dh
 0041E5A5    xor         dh,byte ptr ss:[eax]
 0041E5A8    xor         dh,byte ptr cs:[312D3333]
 0041E5AF    add         byte ptr [ebx+70],ah
 0041E5B2    xor         dword ptr [ebx],esi
 0041E5B4    xor         dword ptr ss:[eax],eax
 0041E5B7    push        6F
 0041E5B9    push        6D006261
 0041E5BE    popad
 0041E5BF    arpl        word ptr [eax],ax
 0041E5C1    ins         dword ptr [edi],dl
 0041E5C2    popad
 0041E5C3    arpl        word ptr [ecx+6E],bp
>0041E5C6    je          0041E637
>0041E5C8    jae         0041E632
 0041E5CA    add         byte ptr [ebp+61],ch
 0041E5CD    arpl        word ptr [edx+6F],si
 0041E5D0    ins         dword ptr [edi],dl
 0041E5D1    popad
 0041E5D2    outs        dl,byte ptr [esi]
 0041E5D3    add         byte ptr [ebp+61],ch
 0041E5D6    arpl        word ptr [ecx+72],sp
 0041E5D9    popad
 0041E5DA    bound       ebp,qword ptr [ecx+63]
 0041E5DD    add         byte ptr [ebp+61],ch
 0041E5E0    arpl        word ptr [eax+65],bp
 0041E5E3    bound       esi,qword ptr [edx+65]
>0041E5E6    ja          0041E5E8
 0041E5E8    ins         dword ptr [edi],dl
 0041E5E9    popad
 0041E5EA    arpl        word ptr [edi+72],sp
 0041E5ED    ???
 0041E5EE    imul        eax,dword ptr gs:[eax],6D
 0041E5F2    popad
 0041E5F3    arpl        word ptr [ebx+79],sp
>0041E5F6    jb          0041E661
 0041E5F8    ins         byte ptr [edi],dl
 0041E5F9    ins         byte ptr [edi],dl
 0041E5FA    imul        esp,dword ptr [ebx],7263616D
 0041E601    outs        dl,dword ptr [esi]
 0041E602    ins         dword ptr [edi],dl
 0041E603    popad
 0041E604    outs        dl,byte ptr [esi]
 0041E605    imul        esp,dword ptr [ecx],7563616D
 0041E60C    imul        esi,dword ptr [edx+61],69
 0041E610    outs        dl,byte ptr [esi]
 0041E611    add         byte ptr gs:[ebp+61],ch
 0041E615    arpl        word ptr [eax+ebp*2+61],si
 0041E619    imul        eax,dword ptr [eax],6363616D
 0041E61F    outs        dl,byte ptr gs:[esi]
>0041E621    je          0041E695
 0041E623    popad
 0041E624    ins         byte ptr [edi],dl
 0041E625    jne         0041E69A
 0041E628    outs        dl,dword ptr [esi]
>0041E629    jo          0041E690
 0041E62B    add         byte ptr [ebp+61],ch
 0041E62E    arpl        word ptr [ecx+63],bp
 0041E631    ins         byte ptr [edi],dl
 0041E633    popad
 0041E634    outs        dl,byte ptr [esi]
 0041E635    add         byte ptr fs:[ebp+61],ch
 0041E639    arpl        word ptr [ebp+esi*2+72],si
 0041E63D    imul        ebp,dword ptr [ecx+73],68
 0041E641    add         byte ptr [ebp+61],ch
 0041E644    arpl        word ptr [ebx+72],sp
 0041E647    outs        dl,dword ptr [esi]
 0041E648    popad
>0041E649    je          0041E6B4
 0041E64B    popad
 0041E64C    outs        dl,byte ptr [esi]
 0041E64D    add         bl,al
 0041E64F    nop
 0041E650    xchg        eax,ecx
 0041E651    lock cmpxchgdword ptr [ecx],edx
 0041E655    ret
 0041E656    mov         eax,eax
>0041E658    jmp         InterlockedCompareExchangePointer
 0041E65D    ret
 0041E65E    mov         eax,eax
 0041E660    xchg        eax,edx
 0041E661    lock xadd   dword ptr [edx],eax
 0041E665    ret
 0041E666    mov         eax,eax
 0041E668    mov         edx,eax
 0041E66A    mov         eax,1
 0041E66F    lock xadd   dword ptr [edx],eax
 0041E673    inc         eax
 0041E674    ret
 0041E675    lea         eax,[eax]
 0041E678    mov         edx,eax
 0041E67A    mov         eax,0FFFFFFFF
 0041E67F    lock xadd   dword ptr [edx],eax
 0041E683    dec         eax
 0041E684    ret
 0041E685    lea         eax,[eax]
 0041E688    mov         ecx,eax
 0041E68A    mov         eax,dword ptr [ecx]
 0041E68C    lock cmpxchgdword ptr [ecx],edx
>0041E690    jne         0041E68C
 0041E692    ret
 0041E693    nop
>0041E694    jmp         InterlockedExchange
 0041E699    ret
 0041E69A    mov         eax,eax
 0041E69C    push        ebp
 0041E69D    mov         ebp,esp
 0041E69F    push        ebx
 0041E6A0    mov         ebx,edx
 0041E6A2    mov         edx,eax
 0041E6A4    shr         edx,10
 0041E6A7    div         ax,bx
 0041E6AA    mov         ebx,dword ptr [ebp+8]
 0041E6AD    mov         word ptr [ecx],ax
 0041E6B0    mov         word ptr [ebx],dx
 0041E6B3    pop         ebx
 0041E6B4    pop         ebp
 0041E6B5    ret         4
*}
end;

//0041E650
function InterlockedCompareExchangePointer(var Destination:Pointer; Exchange:Pointer; Comparand:Pointer):Pointer;
begin
{*
 0041E650    xchg        eax,ecx
 0041E651    lock cmpxchgdword ptr [ecx],edx
 0041E655    ret
*}
end;

//0041E658
{*function sub_0041E658:?;
begin
>0041E658    jmp         InterlockedCompareExchangePointer
end;*}

//0041E660
{*function sub_0041E660(?:?; ?:?):?;
begin
 0041E660    xchg        eax,edx
 0041E661    lock xadd   dword ptr [edx],eax
 0041E665    ret
end;*}

//0041E668
function InterlockedIncrement(var I:Integer):Integer;
begin
{*
 0041E668    mov         edx,eax
 0041E66A    mov         eax,1
 0041E66F    lock xadd   dword ptr [edx],eax
 0041E673    inc         eax
 0041E674    ret
*}
end;

//0041E678
function InterlockedDecrement(var I:Integer):Integer;
begin
{*
 0041E678    mov         edx,eax
 0041E67A    mov         eax,0FFFFFFFF
 0041E67F    lock xadd   dword ptr [edx],eax
 0041E683    dec         eax
 0041E684    ret
*}
end;

//0041E688
function InterlockedExchange(var A:Integer; B:Integer):Integer;
begin
{*
 0041E688    mov         ecx,eax
 0041E68A    mov         eax,dword ptr [ecx]
 0041E68C    lock cmpxchgdword ptr [ecx],edx
>0041E690    jne         0041E68C
 0041E692    ret
*}
end;

//0041E694
procedure sub_0041E694;
begin
{*
>0041E694    jmp         InterlockedExchange
*}
end;

//0041E69C
procedure DivMod(Dividend:Integer; Divisor:Word; var Result:Word; var Remainder:Word);
begin
{*
 0041E69C    push        ebp
 0041E69D    mov         ebp,esp
 0041E69F    push        ebx
 0041E6A0    mov         ebx,edx
 0041E6A2    mov         edx,eax
 0041E6A4    shr         edx,10
 0041E6A7    div         ax,bx
 0041E6AA    mov         ebx,dword ptr [ebp+8]
 0041E6AD    mov         word ptr [ecx],ax
 0041E6B0    mov         word ptr [ebx],dx
 0041E6B3    pop         ebx
 0041E6B4    pop         ebp
 0041E6B5    ret         4
*}
end;

//0041E6B8
procedure ConvertError(ResString:PResStringRec);
begin
{*
 0041E6B8    push        ebx
 0041E6B9    mov         ebx,eax
 0041E6BB    mov         ecx,ebx
 0041E6BD    mov         dl,1
 0041E6BF    mov         eax,[0041A0BC];EConvertError
 0041E6C4    call        Exception.CreateRes
 0041E6C9    call        @RaiseExcept
 0041E6CE    pop         ebx
 0041E6CF    ret
*}
end;

//0041E6D0
function ExpandVolumeName(const AFileName:UnicodeString):UnicodeString;
begin
{*
 0041E6D0    push        ebp
 0041E6D1    mov         ebp,esp
 0041E6D3    add         esp,0FFFFFBD4
 0041E6D9    push        ebx
 0041E6DA    push        esi
 0041E6DB    push        edi
 0041E6DC    xor         ecx,ecx
 0041E6DE    mov         dword ptr [ebp-428],ecx
 0041E6E4    mov         dword ptr [ebp-42C],ecx
 0041E6EA    mov         dword ptr [ebp-4],ecx
 0041E6ED    mov         dword ptr [ebp-0C],edx
 0041E6F0    mov         dword ptr [ebp-8],eax
 0041E6F3    xor         eax,eax
 0041E6F5    push        ebp
 0041E6F6    push        41E7F9
 0041E6FB    push        dword ptr fs:[eax]
 0041E6FE    mov         dword ptr fs:[eax],esp
 0041E701    lea         eax,[ebp-218]
 0041E707    push        eax
 0041E708    push        104
 0041E70D    call        kernel32.GetLogicalDriveStringsW
 0041E712    mov         esi,eax
 0041E714    test        esi,esi
>0041E716    jle         0041E7D3
 0041E71C    lea         ebx,[ebp-218]
 0041E722    lea         eax,[ebx+4]
 0041E725    mov         word ptr [eax],0
 0041E72A    push        104
 0041E72F    lea         eax,[ebp-424]
 0041E735    push        eax
 0041E736    push        ebx
 0041E737    call        kernel32.QueryDosDeviceW
 0041E73C    mov         esi,eax
 0041E73E    test        esi,esi
>0041E740    jle         0041E7BC
 0041E742    lea         eax,[ebp-4]
 0041E745    lea         edx,[ebp-424]
 0041E74B    mov         ecx,106
 0041E750    call        @UStrFromWArray
 0041E755    mov         edx,dword ptr [ebp-8]
 0041E758    mov         eax,dword ptr [ebp-4]
 0041E75B    call        Pos
 0041E760    test        eax,eax
>0041E762    jle         0041E7BC
 0041E764    mov         eax,dword ptr [ebp-4]
 0041E767    test        eax,eax
>0041E769    je          0041E770
 0041E76B    sub         eax,4
 0041E76E    mov         eax,dword ptr [eax]
 0041E770    mov         esi,eax
 0041E772    mov         edi,dword ptr [ebp-8]
 0041E775    test        edi,edi
>0041E777    je          0041E77E
 0041E779    sub         edi,4
 0041E77C    mov         edi,dword ptr [edi]
 0041E77E    lea         eax,[ebp-428]
 0041E784    push        eax
 0041E785    mov         ecx,edi
 0041E787    sub         ecx,esi
 0041E789    lea         edx,[esi+1]
 0041E78C    mov         eax,dword ptr [ebp-8]
 0041E78F    call        @UStrCopy
 0041E794    mov         eax,dword ptr [ebp-428]
 0041E79A    push        eax
 0041E79B    lea         eax,[ebp-42C]
 0041E7A1    mov         edx,ebx
 0041E7A3    call        @UStrFromPWChar
 0041E7A8    mov         edx,dword ptr [ebp-42C]
 0041E7AE    mov         eax,dword ptr [ebp-0C]
 0041E7B1    pop         ecx
 0041E7B2    call        @UStrCat3
>0041E7B7    jmp         0041E7D3
 0041E7B9    add         ebx,2
 0041E7BC    cmp         word ptr [ebx],0
>0041E7C0    jne         0041E7B9
 0041E7C2    add         ebx,4
 0041E7C5    test        ebx,ebx
>0041E7C7    je          0041E7CD
 0041E7C9    cmp         word ptr [ebx],0
>0041E7CD    jne         0041E722
 0041E7D3    xor         eax,eax
 0041E7D5    pop         edx
 0041E7D6    pop         ecx
 0041E7D7    pop         ecx
 0041E7D8    mov         dword ptr fs:[eax],edx
 0041E7DB    push        41E800
 0041E7E0    lea         eax,[ebp-42C]
 0041E7E6    mov         edx,2
 0041E7EB    call        @UStrArrayClr
 0041E7F0    lea         eax,[ebp-4]
 0041E7F3    call        @UStrClr
 0041E7F8    ret
>0041E7F9    jmp         @HandleFinally
>0041E7FE    jmp         0041E7E0
 0041E800    pop         edi
 0041E801    pop         esi
 0041E802    pop         ebx
 0041E803    mov         esp,ebp
 0041E805    pop         ebp
 0041E806    ret
*}
end;

//0041E808
function GetObjectInfoName(Handle:THandle):UnicodeString;
begin
{*
 0041E808    push        ebp
 0041E809    mov         ebp,esp
 0041E80B    add         esp,0FFFFFFF8
 0041E80E    push        ebx
 0041E80F    push        esi
 0041E810    mov         esi,edx
 0041E812    mov         ebx,eax
 0041E814    mov         eax,esi
 0041E816    call        @UStrClr
 0041E81B    cmp         dword ptr ds:[790E10],0;gvar_00790E10
>0041E822    jne         0041E83E
 0041E824    push        41E8BC
 0041E829    push        41E8D8
 0041E82E    call        kernel32.GetModuleHandleW
 0041E833    push        eax
 0041E834    call        GetProcAddress
 0041E839    mov         [00790E10],eax;gvar_00790E10
 0041E83E    cmp         dword ptr ds:[790E10],0;gvar_00790E10
>0041E845    je          0041E8B4
 0041E847    lea         eax,[ebp-8]
 0041E84A    push        eax
 0041E84B    push        0
 0041E84D    push        0
 0041E84F    push        1
 0041E851    push        ebx
 0041E852    call        dword ptr ds:[790E10]
 0041E858    mov         eax,dword ptr [ebp-8]
 0041E85B    call        @GetMem
 0041E860    mov         dword ptr [ebp-4],eax
 0041E863    xor         edx,edx
 0041E865    push        ebp
 0041E866    push        41E8AD
 0041E86B    push        dword ptr fs:[edx]
 0041E86E    mov         dword ptr fs:[edx],esp
 0041E871    lea         eax,[ebp-8]
 0041E874    push        eax
 0041E875    mov         eax,dword ptr [ebp-8]
 0041E878    push        eax
 0041E879    mov         eax,dword ptr [ebp-4]
 0041E87C    push        eax
 0041E87D    push        1
 0041E87F    push        ebx
 0041E880    call        dword ptr ds:[790E10]
 0041E886    test        eax,eax
>0041E888    jne         0041E897
 0041E88A    mov         eax,esi
 0041E88C    mov         edx,dword ptr [ebp-4]
 0041E88F    mov         edx,dword ptr [edx+4]
 0041E892    call        @UStrFromPWChar
 0041E897    xor         eax,eax
 0041E899    pop         edx
 0041E89A    pop         ecx
 0041E89B    pop         ecx
 0041E89C    mov         dword ptr fs:[eax],edx
 0041E89F    push        41E8B4
 0041E8A4    mov         eax,dword ptr [ebp-4]
 0041E8A7    call        @FreeMem
 0041E8AC    ret
>0041E8AD    jmp         @HandleFinally
>0041E8B2    jmp         0041E8A4
 0041E8B4    pop         esi
 0041E8B5    pop         ebx
 0041E8B6    pop         ecx
 0041E8B7    pop         ecx
 0041E8B8    pop         ebp
 0041E8B9    ret
*}
end;

//0041E8EC
function InternalGetFileNameFromHandle(Handle:THandle; var FileName:UnicodeString; Flags:DWORD):Boolean;
begin
{*
 0041E8EC    push        ebp
 0041E8ED    mov         ebp,esp
 0041E8EF    add         esp,0FFFFFDCC
 0041E8F5    push        ebx
 0041E8F6    xor         ebx,ebx
 0041E8F8    mov         dword ptr [ebp-234],ebx
 0041E8FE    mov         dword ptr [ebp-230],ebx
 0041E904    mov         dword ptr [ebp-228],ebx
 0041E90A    mov         dword ptr [ebp-22C],ebx
 0041E910    mov         dword ptr [ebp-8],edx
 0041E913    mov         dword ptr [ebp-4],eax
 0041E916    xor         eax,eax
 0041E918    push        ebp
 0041E919    push        41EAA8
 0041E91E    push        dword ptr fs:[eax]
 0041E921    mov         dword ptr fs:[eax],esp
 0041E924    mov         byte ptr [ebp-9],0
 0041E928    mov         eax,dword ptr [ebp-8]
 0041E92B    call        @UStrClr
 0041E930    xor         eax,eax
 0041E932    mov         dword ptr [ebp-14],eax
 0041E935    lea         eax,[ebp-14]
 0041E938    push        eax
 0041E939    mov         eax,dword ptr [ebp-4]
 0041E93C    push        eax
 0041E93D    call        kernel32.GetFileSize
 0041E942    test        eax,eax
>0041E944    jne         0041E950
 0041E946    cmp         dword ptr [ebp-14],0
>0041E94A    je          0041EA3E
 0041E950    push        0
 0041E952    push        1
 0041E954    push        0
 0041E956    push        2
 0041E958    push        0
 0041E95A    mov         eax,dword ptr [ebp-4]
 0041E95D    push        eax
 0041E95E    call        kernel32.CreateFileMappingW
 0041E963    mov         dword ptr [ebp-10],eax
 0041E966    cmp         dword ptr [ebp-10],3EE
>0041E96D    je          0041EA3E
 0041E973    xor         eax,eax
 0041E975    push        ebp
 0041E976    push        41EA37
 0041E97B    push        dword ptr fs:[eax]
 0041E97E    mov         dword ptr fs:[eax],esp
 0041E981    push        1
 0041E983    push        0
 0041E985    push        0
 0041E987    push        4
 0041E989    mov         eax,dword ptr [ebp-10]
 0041E98C    push        eax
 0041E98D    call        kernel32.MapViewOfFile
 0041E992    mov         dword ptr [ebp-18],eax
 0041E995    cmp         dword ptr [ebp-18],0
>0041E999    je          0041EA20
 0041E99F    xor         eax,eax
 0041E9A1    push        ebp
 0041E9A2    push        41EA19
 0041E9A7    push        dword ptr fs:[eax]
 0041E9AA    mov         dword ptr fs:[eax],esp
 0041E9AD    push        104
 0041E9B2    call        kernel32.GetCurrentProcess
 0041E9B7    lea         ecx,[ebp-224]
 0041E9BD    mov         edx,dword ptr [ebp-18]
 0041E9C0    call        GetMappedFileName
 0041E9C5    test        eax,eax
>0041E9C7    jbe         0041EA02
 0041E9C9    lea         eax,[ebp-22C]
 0041E9CF    lea         edx,[ebp-224]
 0041E9D5    mov         ecx,106
 0041E9DA    call        @UStrFromWArray
 0041E9DF    mov         eax,dword ptr [ebp-22C]
 0041E9E5    lea         edx,[ebp-228]
 0041E9EB    call        ExpandVolumeName
 0041E9F0    mov         edx,dword ptr [ebp-228]
 0041E9F6    mov         eax,dword ptr [ebp-8]
 0041E9F9    call        @UStrAsg
 0041E9FE    mov         byte ptr [ebp-9],1
 0041EA02    xor         eax,eax
 0041EA04    pop         edx
 0041EA05    pop         ecx
 0041EA06    pop         ecx
 0041EA07    mov         dword ptr fs:[eax],edx
 0041EA0A    push        41EA20
 0041EA0F    mov         eax,dword ptr [ebp-18]
 0041EA12    push        eax
 0041EA13    call        kernel32.UnmapViewOfFile
 0041EA18    ret
>0041EA19    jmp         @HandleFinally
>0041EA1E    jmp         0041EA0F
 0041EA20    xor         eax,eax
 0041EA22    pop         edx
 0041EA23    pop         ecx
 0041EA24    pop         ecx
 0041EA25    mov         dword ptr fs:[eax],edx
 0041EA28    push        41EA3E
 0041EA2D    mov         eax,dword ptr [ebp-10]
 0041EA30    push        eax
 0041EA31    call        kernel32.CloseHandle
 0041EA36    ret
>0041EA37    jmp         @HandleFinally
>0041EA3C    jmp         0041EA2D
 0041EA3E    cmp         byte ptr [ebp-9],0
>0041EA42    jne         0041EA8A
 0041EA44    lea         edx,[ebp-230]
 0041EA4A    mov         eax,dword ptr [ebp-4]
 0041EA4D    call        GetObjectInfoName
 0041EA52    mov         edx,dword ptr [ebp-230]
 0041EA58    mov         eax,dword ptr [ebp-8]
 0041EA5B    call        @UStrAsg
 0041EA60    mov         eax,dword ptr [ebp-8]
 0041EA63    cmp         dword ptr [eax],0
>0041EA66    je          0041EA8A
 0041EA68    lea         edx,[ebp-234]
 0041EA6E    mov         eax,dword ptr [ebp-8]
 0041EA71    mov         eax,dword ptr [eax]
 0041EA73    call        ExpandVolumeName
 0041EA78    mov         edx,dword ptr [ebp-234]
 0041EA7E    mov         eax,dword ptr [ebp-8]
 0041EA81    call        @UStrAsg
 0041EA86    mov         byte ptr [ebp-9],1
 0041EA8A    xor         eax,eax
 0041EA8C    pop         edx
 0041EA8D    pop         ecx
 0041EA8E    pop         ecx
 0041EA8F    mov         dword ptr fs:[eax],edx
 0041EA92    push        41EAAF
 0041EA97    lea         eax,[ebp-234]
 0041EA9D    mov         edx,4
 0041EAA2    call        @UStrArrayClr
 0041EAA7    ret
>0041EAA8    jmp         @HandleFinally
>0041EAAD    jmp         0041EA97
 0041EAAF    movzx       eax,byte ptr [ebp-9]
 0041EAB3    pop         ebx
 0041EAB4    mov         esp,ebp
 0041EAB6    pop         ebp
 0041EAB7    ret
*}
end;

//0041EAB8
function InternalGetFileNameFromSymLink(const FileName:UnicodeString; var TargetName:UnicodeString):Boolean;
begin
{*
 0041EAB8    push        ebp
 0041EAB9    mov         ebp,esp
 0041EABB    add         esp,0FFFFFFF8
 0041EABE    push        ebx
 0041EABF    push        esi
 0041EAC0    push        edi
 0041EAC1    mov         esi,edx
 0041EAC3    mov         ebx,eax
 0041EAC5    mov         byte ptr [ebp-1],0
 0041EAC9    xor         edx,edx
 0041EACB    mov         eax,6
 0041EAD0    call        CheckWin32Version
 0041EAD5    test        al,al
>0041EAD7    je          0041EB60
 0041EADD    mov         eax,ebx
 0041EADF    call        @UStrToPWChar
 0041EAE4    push        eax
 0041EAE5    call        kernel32.GetFileAttributesW
 0041EAEA    cmp         eax,0FFFFFFFF
>0041EAED    je          0041EB60
 0041EAEF    test        ah,4
>0041EAF2    je          0041EB60
 0041EAF4    test        al,10
>0041EAF6    je          0041EAFF
 0041EAF8    mov         edi,2000000
>0041EAFD    jmp         0041EB01
 0041EAFF    xor         edi,edi
 0041EB01    push        0
 0041EB03    push        edi
 0041EB04    push        3
 0041EB06    push        0
 0041EB08    push        1
 0041EB0A    push        80000000
 0041EB0F    mov         eax,ebx
 0041EB11    call        @UStrToPWChar
 0041EB16    push        eax
 0041EB17    call        kernel32.CreateFileW
 0041EB1C    mov         dword ptr [ebp-8],eax
 0041EB1F    cmp         dword ptr [ebp-8],0FFFFFFFF
>0041EB23    je          0041EB60
 0041EB25    xor         eax,eax
 0041EB27    push        ebp
 0041EB28    push        41EB59
 0041EB2D    push        dword ptr fs:[eax]
 0041EB30    mov         dword ptr fs:[eax],esp
 0041EB33    mov         edx,esi
 0041EB35    mov         ecx,edi
 0041EB37    mov         eax,dword ptr [ebp-8]
 0041EB3A    call        InternalGetFileNameFromHandle
 0041EB3F    mov         byte ptr [ebp-1],al
 0041EB42    xor         eax,eax
 0041EB44    pop         edx
 0041EB45    pop         ecx
 0041EB46    pop         ecx
 0041EB47    mov         dword ptr fs:[eax],edx
 0041EB4A    push        41EB60
 0041EB4F    mov         eax,dword ptr [ebp-8]
 0041EB52    push        eax
 0041EB53    call        kernel32.CloseHandle
 0041EB58    ret
>0041EB59    jmp         @HandleFinally
>0041EB5E    jmp         0041EB4F
 0041EB60    movzx       eax,byte ptr [ebp-1]
 0041EB64    pop         edi
 0041EB65    pop         esi
 0041EB66    pop         ebx
 0041EB67    pop         ecx
 0041EB68    pop         ecx
 0041EB69    pop         ebp
 0041EB6A    ret
*}
end;

//0041EB6C
procedure ConvertErrorFmt(ResString:PResStringRec; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);
begin
{*
 0041EB6C    push        ebx
 0041EB6D    push        esi
 0041EB6E    push        edi
 0041EB6F    mov         edi,ecx
 0041EB71    mov         esi,edx
 0041EB73    mov         ebx,eax
 0041EB75    push        esi
 0041EB76    push        edi
 0041EB77    mov         ecx,ebx
 0041EB79    mov         dl,1
 0041EB7B    mov         eax,[0041A0BC];EConvertError
 0041EB80    call        Exception.CreateResFmt
 0041EB85    call        @RaiseExcept
 0041EB8A    pop         edi
 0041EB8B    pop         esi
 0041EB8C    pop         ebx
 0041EB8D    ret
*}
end;

//0041EB90
procedure InvalidGUID;
begin
{*
 0041EB90    push        ebp
 0041EB91    mov         ebp,esp
 0041EB93    add         esp,0FFFFFFF8
 0041EB96    mov         eax,dword ptr [ebp+8]
 0041EB99    mov         eax,dword ptr [eax-4]
 0041EB9C    mov         dword ptr [ebp-8],eax
 0041EB9F    mov         byte ptr [ebp-4],11
 0041EBA3    lea         edx,[ebp-8]
 0041EBA6    mov         eax,[0078D7EC];^SResString2:TResStringRec
 0041EBAB    xor         ecx,ecx
 0041EBAD    call        ConvertErrorFmt
 0041EBB2    pop         ecx
 0041EBB3    pop         ecx
 0041EBB4    pop         ebp
 0041EBB5    ret
*}
end;

//0041EBB8
function HexChar(c:Char):Byte;
begin
{*
 0041EBB8    push        ebp
 0041EBB9    mov         ebp,esp
 0041EBBB    mov         edx,eax
 0041EBBD    add         edx,0FFFFFFD0
 0041EBC0    sub         dx,0A
>0041EBC4    jb          0041EBDA
 0041EBC6    add         edx,0FFFFFFF9
 0041EBC9    sub         dx,6
>0041EBCD    jb          0041EBE4
 0041EBCF    add         edx,0FFFFFFE6
 0041EBD2    sub         dx,6
>0041EBD6    jb          0041EBDE
>0041EBD8    jmp         0041EBEA
 0041EBDA    sub         al,30
 0041EBDC    pop         ebp
 0041EBDD    ret
 0041EBDE    sub         al,61
 0041EBE0    add         al,0A
 0041EBE2    pop         ebp
 0041EBE3    ret
 0041EBE4    sub         al,41
 0041EBE6    add         al,0A
 0041EBE8    pop         ebp
 0041EBE9    ret
 0041EBEA    mov         eax,dword ptr [ebp+8]
 0041EBED    push        eax
 0041EBEE    call        InvalidGUID
 0041EBF3    pop         ecx
 0041EBF4    xor         eax,eax
 0041EBF6    pop         ebp
 0041EBF7    ret
*}
end;

//0041EBF8
function HexByte(p:PChar):Byte;
begin
{*
 0041EBF8    push        ebp
 0041EBF9    mov         ebp,esp
 0041EBFB    push        ebx
 0041EBFC    mov         ebx,eax
 0041EBFE    mov         eax,dword ptr [ebp+8]
 0041EC01    push        eax
 0041EC02    movzx       eax,word ptr [ebx]
 0041EC05    call        HexChar
 0041EC0A    pop         ecx
 0041EC0B    shl         eax,4
 0041EC0E    push        eax
 0041EC0F    mov         eax,dword ptr [ebp+8]
 0041EC12    push        eax
 0041EC13    movzx       eax,word ptr [ebx+2]
 0041EC17    call        HexChar
 0041EC1C    pop         ecx
 0041EC1D    mov         edx,eax
 0041EC1F    pop         eax
 0041EC20    add         al,dl
 0041EC22    pop         ebx
 0041EC23    pop         ebp
 0041EC24    ret
*}
end;

//0041EC28
function StringToGUID(const S:UnicodeString):TGUID;
begin
{*
 0041EC28    push        ebp
 0041EC29    mov         ebp,esp
 0041EC2B    push        ecx
 0041EC2C    push        ebx
 0041EC2D    push        esi
 0041EC2E    push        edi
 0041EC2F    mov         ebx,edx
 0041EC31    mov         dword ptr [ebp-4],eax
 0041EC34    mov         eax,dword ptr [ebp-4]
 0041EC37    test        eax,eax
>0041EC39    je          0041EC40
 0041EC3B    sub         eax,4
 0041EC3E    mov         eax,dword ptr [eax]
 0041EC40    cmp         eax,26
>0041EC43    je          0041EC49
 0041EC45    mov         al,1
>0041EC47    jmp         0041EC53
 0041EC49    mov         eax,dword ptr [ebp-4]
 0041EC4C    cmp         word ptr [eax],7B
 0041EC50    setne       al
 0041EC53    test        al,al
>0041EC55    je          0041EC5E
 0041EC57    push        ebp
 0041EC58    call        InvalidGUID
 0041EC5D    pop         ecx
 0041EC5E    mov         edi,ebx
 0041EC60    mov         eax,dword ptr [ebp-4]
 0041EC63    call        @UStrToPWChar
 0041EC68    mov         ebx,eax
 0041EC6A    add         ebx,2
 0041EC6D    xor         esi,esi
 0041EC6F    push        ebp
 0041EC70    mov         eax,3
 0041EC75    sub         eax,esi
 0041EC77    add         eax,eax
 0041EC79    add         eax,eax
 0041EC7B    add         eax,ebx
 0041EC7D    call        HexByte
 0041EC82    pop         ecx
 0041EC83    mov         byte ptr [edi+esi],al
 0041EC86    inc         esi
 0041EC87    cmp         esi,4
>0041EC8A    jne         0041EC6F
 0041EC8C    add         ebx,10
 0041EC8F    add         edi,4
 0041EC92    cmp         word ptr [ebx],2D
>0041EC96    je          0041EC9F
 0041EC98    push        ebp
 0041EC99    call        InvalidGUID
 0041EC9E    pop         ecx
 0041EC9F    add         ebx,2
 0041ECA2    mov         esi,2
 0041ECA7    push        ebp
 0041ECA8    lea         eax,[ebx+4]
 0041ECAB    call        HexByte
 0041ECB0    pop         ecx
 0041ECB1    mov         byte ptr [edi],al
 0041ECB3    inc         edi
 0041ECB4    push        ebp
 0041ECB5    mov         eax,ebx
 0041ECB7    call        HexByte
 0041ECBC    pop         ecx
 0041ECBD    mov         byte ptr [edi],al
 0041ECBF    inc         edi
 0041ECC0    add         ebx,8
 0041ECC3    cmp         word ptr [ebx],2D
>0041ECC7    je          0041ECD0
 0041ECC9    push        ebp
 0041ECCA    call        InvalidGUID
 0041ECCF    pop         ecx
 0041ECD0    add         ebx,2
 0041ECD3    dec         esi
>0041ECD4    jne         0041ECA7
 0041ECD6    push        ebp
 0041ECD7    mov         eax,ebx
 0041ECD9    call        HexByte
 0041ECDE    pop         ecx
 0041ECDF    mov         byte ptr [edi],al
 0041ECE1    inc         edi
 0041ECE2    add         ebx,4
 0041ECE5    push        ebp
 0041ECE6    mov         eax,ebx
 0041ECE8    call        HexByte
 0041ECED    pop         ecx
 0041ECEE    mov         byte ptr [edi],al
 0041ECF0    inc         edi
 0041ECF1    add         ebx,4
 0041ECF4    cmp         word ptr [ebx],2D
>0041ECF8    je          0041ED01
 0041ECFA    push        ebp
 0041ECFB    call        InvalidGUID
 0041ED00    pop         ecx
 0041ED01    add         ebx,2
 0041ED04    mov         esi,6
 0041ED09    push        ebp
 0041ED0A    mov         eax,ebx
 0041ED0C    call        HexByte
 0041ED11    pop         ecx
 0041ED12    mov         byte ptr [edi],al
 0041ED14    inc         edi
 0041ED15    add         ebx,4
 0041ED18    dec         esi
>0041ED19    jne         0041ED09
 0041ED1B    pop         edi
 0041ED1C    pop         esi
 0041ED1D    pop         ebx
 0041ED1E    pop         ecx
 0041ED1F    pop         ebp
 0041ED20    ret
*}
end;

//0041ED24
function IsEqualGUID(const Guid1:TGUID; const Guid2:TGUID):Boolean;
begin
{*
 0041ED24    mov         ecx,dword ptr [eax]
 0041ED26    cmp         ecx,dword ptr [edx]
>0041ED28    jne         0041ED42
 0041ED2A    mov         ecx,dword ptr [eax+4]
 0041ED2D    cmp         ecx,dword ptr [edx+4]
>0041ED30    jne         0041ED42
 0041ED32    mov         ecx,dword ptr [eax+8]
 0041ED35    cmp         ecx,dword ptr [edx+8]
>0041ED38    jne         0041ED42
 0041ED3A    mov         eax,dword ptr [eax+0C]
 0041ED3D    cmp         eax,dword ptr [edx+0C]
>0041ED40    je          0041ED45
 0041ED42    xor         eax,eax
 0041ED44    ret
 0041ED45    mov         al,1
 0041ED47    ret
*}
end;

//0041ED48
procedure DoExitProc;
begin
{*
 0041ED48    push        ebx
 0041ED49    mov         eax,[00784CE8]
 0041ED4E    mov         edx,dword ptr [eax]
 0041ED50    mov         dword ptr ds:[784CE8],edx
 0041ED56    mov         edx,dword ptr ds:[78CC5C];ExitProc:Pointer
 0041ED5C    mov         ecx,dword ptr [eax+4]
 0041ED5F    mov         dword ptr [edx],ecx
 0041ED61    mov         ebx,dword ptr [eax+8]
 0041ED64    mov         edx,0C
 0041ED69    call        @FreeMem
 0041ED6E    call        ebx
 0041ED70    pop         ebx
 0041ED71    ret
*}
end;

//0041ED74
procedure AddExitProc(Proc:TProcedure);
begin
{*
 0041ED74    push        ebx
 0041ED75    mov         ebx,eax
 0041ED77    mov         eax,0C
 0041ED7C    call        @GetMem
 0041ED81    mov         edx,dword ptr ds:[784CE8]
 0041ED87    mov         dword ptr [eax],edx
 0041ED89    mov         edx,dword ptr ds:[78CC5C];ExitProc:Pointer
 0041ED8F    mov         edx,dword ptr [edx]
 0041ED91    mov         dword ptr [eax+4],edx
 0041ED94    mov         dword ptr [eax+8],ebx
 0041ED97    mov         [00784CE8],eax
 0041ED9C    mov         eax,[0078CC5C];ExitProc:Pointer
 0041EDA1    mov         dword ptr [eax],41ED48;DoExitProc
 0041EDA7    pop         ebx
 0041EDA8    ret
*}
end;

//0041EDAC
function CharInSet(C:WideChar; const CharSet:TSysCharSet):Boolean;
begin
{*
 0041EDAC    cmp         ax,0FF
>0041EDB0    ja          0041EDB8
 0041EDB2    movzx       eax,ax
 0041EDB5    bt          dword ptr [edx],eax
 0041EDB8    setb        al
 0041EDBB    ret
*}
end;

//0041EDBC
function UpperCase(const S:UnicodeString):UnicodeString;
begin
{*
 0041EDBC    push        ebx
 0041EDBD    push        esi
 0041EDBE    push        edi
 0041EDBF    mov         edi,edx
 0041EDC1    mov         ebx,eax
 0041EDC3    mov         eax,ebx
 0041EDC5    test        eax,eax
>0041EDC7    je          0041EDCE
 0041EDC9    sub         eax,4
 0041EDCC    mov         eax,dword ptr [eax]
 0041EDCE    mov         esi,eax
 0041EDD0    mov         eax,edi
 0041EDD2    mov         edx,esi
 0041EDD4    call        @UStrSetLength
 0041EDD9    test        esi,esi
>0041EDDB    jle         0041EE06
 0041EDDD    mov         ecx,dword ptr [edi]
 0041EDDF    mov         edx,esi
 0041EDE1    cmp         edx,1
>0041EDE4    jl          0041EE06
 0041EDE6    movzx       eax,word ptr [ebx]
 0041EDE9    mov         esi,eax
 0041EDEB    add         esi,0FFFFFF9F
 0041EDEE    sub         si,1A
>0041EDF2    jae         0041EDF8
 0041EDF4    xor         ax,20
 0041EDF8    mov         word ptr [ecx],ax
 0041EDFB    add         ecx,2
 0041EDFE    add         ebx,2
 0041EE01    dec         edx
 0041EE02    test        edx,edx
>0041EE04    jne         0041EDE6
 0041EE06    pop         edi
 0041EE07    pop         esi
 0041EE08    pop         ebx
 0041EE09    ret
*}
end;

//0041EE0C
function LowerCase(const S:UnicodeString):UnicodeString;
begin
{*
 0041EE0C    push        ebx
 0041EE0D    push        esi
 0041EE0E    push        edi
 0041EE0F    mov         edi,edx
 0041EE11    mov         ebx,eax
 0041EE13    mov         eax,ebx
 0041EE15    test        eax,eax
>0041EE17    je          0041EE1E
 0041EE19    sub         eax,4
 0041EE1C    mov         eax,dword ptr [eax]
 0041EE1E    mov         esi,eax
 0041EE20    mov         eax,edi
 0041EE22    mov         edx,esi
 0041EE24    call        @UStrSetLength
 0041EE29    test        esi,esi
>0041EE2B    jle         0041EE56
 0041EE2D    mov         ecx,dword ptr [edi]
 0041EE2F    mov         edx,esi
 0041EE31    cmp         edx,1
>0041EE34    jl          0041EE56
 0041EE36    movzx       eax,word ptr [ebx]
 0041EE39    mov         esi,eax
 0041EE3B    add         esi,0FFFFFFBF
 0041EE3E    sub         si,1A
>0041EE42    jae         0041EE48
 0041EE44    or          ax,20
 0041EE48    mov         word ptr [ecx],ax
 0041EE4B    add         ecx,2
 0041EE4E    add         ebx,2
 0041EE51    dec         edx
 0041EE52    test        edx,edx
>0041EE54    jne         0041EE36
 0041EE56    pop         edi
 0041EE57    pop         esi
 0041EE58    pop         ebx
 0041EE59    ret
*}
end;

//0041EE5C
function CompareStr(const S1:UnicodeString; const S2:UnicodeString):Integer;
begin
{*
 0041EE5C    cmp         eax,edx
>0041EE5E    je          0041EEB5
 0041EE60    test        eax,edx
>0041EE62    je          0041EEB8
 0041EE64    movzx       ecx,word ptr [edx]
 0041EE67    cmp         cx,word ptr [eax]
>0041EE6A    je          0041EE73
 0041EE6C    movzx       eax,word ptr [eax]
 0041EE6F    sub         eax,ecx
>0041EE71    jmp         0041EE9A
 0041EE73    push        ebx
 0041EE74    mov         ebx,dword ptr [eax-4]
 0041EE77    xor         ecx,ecx
 0041EE79    sub         ebx,dword ptr [edx-4]
 0041EE7C    push        ebx
 0041EE7D    adc         ecx,0FFFFFFFF
 0041EE80    and         ecx,ebx
 0041EE82    sub         ecx,dword ptr [eax-4]
 0041EE85    shl         ecx,1
 0041EE87    sub         eax,ecx
 0041EE89    sub         edx,ecx
 0041EE8B    mov         ebx,dword ptr [ecx+eax]
 0041EE8E    xor         ebx,dword ptr [ecx+edx]
>0041EE91    jne         0041EE9B
 0041EE93    add         ecx,4
>0041EE96    js          0041EE8B
 0041EE98    pop         eax
 0041EE99    pop         ebx
 0041EE9A    ret
 0041EE9B    bsf         ebx,ebx
 0041EE9E    shr         ebx,4
 0041EEA1    add         ebx,ebx
 0041EEA3    add         ecx,ebx
>0041EEA5    jns         0041EE98
 0041EEA7    movzx       eax,word ptr [ecx+eax]
 0041EEAB    movzx       edx,word ptr [ecx+edx]
 0041EEAF    sub         eax,edx
 0041EEB1    pop         ebx
 0041EEB2    pop         ebx
>0041EEB3    jmp         0041EE9A
 0041EEB5    xor         eax,eax
 0041EEB7    ret
 0041EEB8    test        eax,eax
>0041EEBA    je          0041EEC4
 0041EEBC    test        edx,edx
>0041EEBE    jne         0041EE64
 0041EEC0    mov         eax,dword ptr [eax-4]
 0041EEC3    ret
 0041EEC4    sub         eax,dword ptr [edx-4]
 0041EEC7    ret
*}
end;

//0041EEC8
function CompareMem(P1:Pointer; P2:Pointer; Length:Integer):Boolean;
begin
{*
 0041EEC8    add         eax,ecx
 0041EECA    add         edx,ecx
 0041EECC    xor         ecx,0FFFFFFFF
 0041EECF    add         eax,0FFFFFFF8
 0041EED2    add         edx,0FFFFFFF8
 0041EED5    add         ecx,9
 0041EED8    push        ebx
>0041EED9    jg          0041EF1E
 0041EEDB    mov         ebx,dword ptr [ecx+eax]
 0041EEDE    cmp         ebx,dword ptr [ecx+edx]
>0041EEE1    jne         0041EF55
 0041EEE3    lea         ebx,[ecx+eax]
 0041EEE6    add         ecx,4
 0041EEE9    and         ebx,3
 0041EEEC    sub         ecx,ebx
>0041EEEE    jg          0041EF1E
 0041EEF0    mov         ebx,dword ptr [ecx+eax]
 0041EEF3    cmp         ebx,dword ptr [ecx+edx]
>0041EEF6    jne         0041EF55
 0041EEF8    mov         ebx,dword ptr [ecx+eax+4]
 0041EEFC    cmp         ebx,dword ptr [ecx+edx+4]
>0041EF00    jne         0041EF55
 0041EF02    add         ecx,8
>0041EF05    jg          0041EF1E
 0041EF07    mov         ebx,dword ptr [ecx+eax]
 0041EF0A    cmp         ebx,dword ptr [ecx+edx]
>0041EF0D    jne         0041EF55
 0041EF0F    mov         ebx,dword ptr [ecx+eax+4]
 0041EF13    cmp         ebx,dword ptr [ecx+edx+4]
>0041EF17    jne         0041EF55
 0041EF19    add         ecx,8
>0041EF1C    jle         0041EEF0
 0041EF1E    cmp         ecx,4
>0041EF21    jg          0041EF2E
 0041EF23    mov         ebx,dword ptr [ecx+eax]
 0041EF26    cmp         ebx,dword ptr [ecx+edx]
>0041EF29    jne         0041EF55
 0041EF2B    add         ecx,4
 0041EF2E    cmp         ecx,6
>0041EF31    jg          0041EF40
 0041EF33    movzx       ebx,word ptr [ecx+eax]
 0041EF37    cmp         bx,word ptr [ecx+edx]
>0041EF3B    jne         0041EF55
 0041EF3D    add         ecx,2
 0041EF40    cmp         ecx,7
>0041EF43    jg          0041EF4E
 0041EF45    movzx       ebx,byte ptr [eax+7]
 0041EF49    cmp         bl,byte ptr [edx+7]
>0041EF4C    jne         0041EF55
 0041EF4E    mov         eax,1
 0041EF53    pop         ebx
 0041EF54    ret
 0041EF55    xor         eax,eax
 0041EF57    pop         ebx
 0041EF58    ret
*}
end;

//0041EF5C
function CompareText(const S1:UnicodeString; const S2:UnicodeString):Integer;
begin
{*
 0041EF5C    test        eax,eax
>0041EF5E    jne         0041EF6A
 0041EF60    test        edx,edx
>0041EF62    je          0041EF69
 0041EF64    mov         eax,dword ptr [edx-4]
 0041EF67    neg         eax
 0041EF69    ret
 0041EF6A    test        edx,edx
>0041EF6C    jne         0041EF72
 0041EF6E    mov         eax,dword ptr [eax-4]
 0041EF71    ret
 0041EF72    push        ebx
 0041EF73    push        ebp
 0041EF74    push        esi
 0041EF75    mov         ebp,dword ptr [eax-4]
 0041EF78    mov         ebx,dword ptr [edx-4]
 0041EF7B    sub         ebp,ebx
 0041EF7D    sbb         ecx,ecx
 0041EF7F    and         ecx,ebp
 0041EF81    add         ecx,ebx
 0041EF83    lea         esi,[eax+ecx*2]
 0041EF86    add         edx,ecx
 0041EF88    add         edx,ecx
 0041EF8A    neg         ecx
>0041EF8C    je          0041F004
 0041EF8E    mov         eax,dword ptr [esi+ecx*2]
 0041EF91    mov         ebx,dword ptr [edx+ecx*2]
 0041EF94    cmp         eax,ebx
>0041EF96    je          0041EFFF
 0041EF98    cmp         ax,bx
>0041EF9B    je          0041EFDB
 0041EF9D    and         eax,0FFFF
 0041EFA2    and         ebx,0FFFF
 0041EFA8    cmp         eax,61
>0041EFAB    jl          0041EFB5
 0041EFAD    cmp         eax,7A
>0041EFB0    jg          0041EFB5
 0041EFB2    sub         eax,20
 0041EFB5    cmp         ebx,61
>0041EFB8    jl          0041EFC2
 0041EFBA    cmp         ebx,7A
>0041EFBD    jg          0041EFC2
 0041EFBF    sub         ebx,20
 0041EFC2    sub         eax,ebx
>0041EFC4    jne         0041F006
 0041EFC6    mov         eax,dword ptr [esi+ecx*2]
 0041EFC9    mov         ebx,dword ptr [edx+ecx*2]
 0041EFCC    and         eax,0FFFF0000
 0041EFD1    and         ebx,0FFFF0000
 0041EFD7    cmp         eax,ebx
>0041EFD9    je          0041EFFF
 0041EFDB    shr         eax,10
 0041EFDE    shr         ebx,10
 0041EFE1    cmp         eax,61
>0041EFE4    jl          0041EFEE
 0041EFE6    cmp         eax,7A
>0041EFE9    jg          0041EFEE
 0041EFEB    sub         eax,20
 0041EFEE    cmp         ebx,61
>0041EFF1    jl          0041EFFB
 0041EFF3    cmp         ebx,7A
>0041EFF6    jg          0041EFFB
 0041EFF8    sub         ebx,20
 0041EFFB    sub         eax,ebx
>0041EFFD    jne         0041F006
 0041EFFF    add         ecx,2
>0041F002    jl          0041EF8E
 0041F004    mov         eax,ebp
 0041F006    pop         esi
 0041F007    pop         ebp
 0041F008    pop         ebx
 0041F009    ret
*}
end;

//0041F00C
function CompareText(const S1:UnicodeString; const S2:UnicodeString; LocaleOptions:TLocaleOptions):Integer;
begin
{*
 0041F00C    cmp         cl,1
>0041F00F    jne         0041F017
 0041F011    call        AnsiCompareText
 0041F016    ret
 0041F017    call        CompareText
 0041F01C    ret
*}
end;

//0041F020
function SameText(const S1:UnicodeString; const S2:UnicodeString):Boolean;
begin
{*
 0041F020    cmp         eax,edx
>0041F022    je          0041F03D
 0041F024    or          eax,eax
>0041F026    je          0041F03F
 0041F028    or          edx,edx
>0041F02A    je          0041F040
 0041F02C    mov         ecx,dword ptr [eax-4]
 0041F02F    cmp         ecx,dword ptr [edx-4]
>0041F032    jne         0041F040
 0041F034    call        CompareText
 0041F039    test        eax,eax
>0041F03B    jne         0041F040
 0041F03D    mov         al,1
 0041F03F    ret
 0041F040    xor         eax,eax
 0041F042    ret
*}
end;

//0041F044
function AnsiUpperCase(const S:UnicodeString):UnicodeString;
begin
{*
 0041F044    push        ebx
 0041F045    push        esi
 0041F046    push        edi
 0041F047    mov         edi,edx
 0041F049    mov         esi,eax
 0041F04B    mov         eax,esi
 0041F04D    test        eax,eax
>0041F04F    je          0041F056
 0041F051    sub         eax,4
 0041F054    mov         eax,dword ptr [eax]
 0041F056    mov         ebx,eax
 0041F058    mov         eax,esi
 0041F05A    call        @UStrToPWChar
 0041F05F    mov         edx,eax
 0041F061    mov         eax,edi
 0041F063    mov         ecx,ebx
 0041F065    call        @UStrFromPWCharLen
 0041F06A    test        ebx,ebx
>0041F06C    jle         0041F07C
 0041F06E    push        ebx
 0041F06F    mov         eax,dword ptr [edi]
 0041F071    call        @UStrToPWChar
 0041F076    push        eax
 0041F077    call        user32.CharUpperBuffW
 0041F07C    pop         edi
 0041F07D    pop         esi
 0041F07E    pop         ebx
 0041F07F    ret
*}
end;

//0041F080
function AnsiLowerCase(const S:UnicodeString):UnicodeString;
begin
{*
 0041F080    push        ebx
 0041F081    push        esi
 0041F082    push        edi
 0041F083    mov         edi,edx
 0041F085    mov         esi,eax
 0041F087    mov         eax,esi
 0041F089    test        eax,eax
>0041F08B    je          0041F092
 0041F08D    sub         eax,4
 0041F090    mov         eax,dword ptr [eax]
 0041F092    mov         ebx,eax
 0041F094    mov         eax,esi
 0041F096    call        @UStrToPWChar
 0041F09B    mov         edx,eax
 0041F09D    mov         eax,edi
 0041F09F    mov         ecx,ebx
 0041F0A1    call        @UStrFromPWCharLen
 0041F0A6    test        ebx,ebx
>0041F0A8    jle         0041F0B8
 0041F0AA    push        ebx
 0041F0AB    mov         eax,dword ptr [edi]
 0041F0AD    call        @UStrToPWChar
 0041F0B2    push        eax
 0041F0B3    call        user32.CharLowerBuffW
 0041F0B8    pop         edi
 0041F0B9    pop         esi
 0041F0BA    pop         ebx
 0041F0BB    ret
*}
end;

//0041F0BC
function AnsiCompareStr(const S1:UnicodeString; const S2:UnicodeString):Integer;
begin
{*
 0041F0BC    push        ebx
 0041F0BD    push        esi
 0041F0BE    push        edi
 0041F0BF    push        ebp
 0041F0C0    mov         ebp,edx
 0041F0C2    mov         edi,eax
 0041F0C4    mov         ebx,edi
 0041F0C6    test        ebx,ebx
>0041F0C8    je          0041F0CF
 0041F0CA    sub         ebx,4
 0041F0CD    mov         ebx,dword ptr [ebx]
 0041F0CF    mov         esi,ebp
 0041F0D1    test        esi,esi
>0041F0D3    je          0041F0DA
 0041F0D5    sub         esi,4
 0041F0D8    mov         esi,dword ptr [esi]
 0041F0DA    push        esi
 0041F0DB    mov         eax,ebp
 0041F0DD    call        @UStrToPWChar
 0041F0E2    push        eax
 0041F0E3    push        ebx
 0041F0E4    mov         eax,edi
 0041F0E6    call        @UStrToPWChar
 0041F0EB    push        eax
 0041F0EC    push        0
 0041F0EE    push        400
 0041F0F3    call        kernel32.CompareStringW
 0041F0F8    sub         eax,2
 0041F0FB    pop         ebp
 0041F0FC    pop         edi
 0041F0FD    pop         esi
 0041F0FE    pop         ebx
 0041F0FF    ret
*}
end;

//0041F100
function AnsiCompareText(const S1:UnicodeString; const S2:UnicodeString):Integer;
begin
{*
 0041F100    push        ebx
 0041F101    push        esi
 0041F102    push        edi
 0041F103    push        ebp
 0041F104    mov         ebp,edx
 0041F106    mov         edi,eax
 0041F108    mov         ebx,edi
 0041F10A    test        ebx,ebx
>0041F10C    je          0041F113
 0041F10E    sub         ebx,4
 0041F111    mov         ebx,dword ptr [ebx]
 0041F113    mov         esi,ebp
 0041F115    test        esi,esi
>0041F117    je          0041F11E
 0041F119    sub         esi,4
 0041F11C    mov         esi,dword ptr [esi]
 0041F11E    push        esi
 0041F11F    mov         eax,ebp
 0041F121    call        @UStrToPWChar
 0041F126    push        eax
 0041F127    push        ebx
 0041F128    mov         eax,edi
 0041F12A    call        @UStrToPWChar
 0041F12F    push        eax
 0041F130    push        1
 0041F132    push        400
 0041F137    call        kernel32.CompareStringW
 0041F13C    sub         eax,2
 0041F13F    pop         ebp
 0041F140    pop         edi
 0041F141    pop         esi
 0041F142    pop         ebx
 0041F143    ret
*}
end;

//0041F144
function AnsiSameText(const S1:UnicodeString; const S2:UnicodeString):Boolean;
begin
{*
 0041F144    push        ebx
 0041F145    push        esi
 0041F146    mov         esi,edx
 0041F148    mov         ebx,eax
 0041F14A    mov         edx,esi
 0041F14C    mov         eax,ebx
 0041F14E    call        AnsiCompareText
 0041F153    test        eax,eax
 0041F155    sete        al
 0041F158    pop         esi
 0041F159    pop         ebx
 0041F15A    ret
*}
end;

//0041F15C
function AnsiStrLIComp(S1:PAnsiChar; S2:PAnsiChar; MaxLen:Cardinal):Integer;
begin
{*
 0041F15C    push        ebx
 0041F15D    push        esi
 0041F15E    push        edi
 0041F15F    mov         ebx,ecx
 0041F161    mov         edi,edx
 0041F163    mov         esi,eax
 0041F165    push        ebx
 0041F166    push        edi
 0041F167    push        ebx
 0041F168    push        esi
 0041F169    push        1
 0041F16B    push        400
 0041F170    call        kernel32.CompareStringW
 0041F175    sub         eax,2
 0041F178    pop         edi
 0041F179    pop         esi
 0041F17A    pop         ebx
 0041F17B    ret
*}
end;

//0041F17C
function WideUpperCase(const S:WideString):WideString;
begin
{*
 0041F17C    push        ebx
 0041F17D    push        esi
 0041F17E    push        edi
 0041F17F    mov         edi,edx
 0041F181    mov         esi,eax
 0041F183    mov         eax,esi
 0041F185    test        eax,eax
>0041F187    je          0041F190
 0041F189    sub         eax,4
 0041F18C    mov         eax,dword ptr [eax]
 0041F18E    shr         eax,1
 0041F190    mov         ebx,eax
 0041F192    mov         eax,esi
 0041F194    call        @WStrToPWChar
 0041F199    mov         edx,eax
 0041F19B    mov         eax,edi
 0041F19D    mov         ecx,ebx
 0041F19F    call        @WStrFromPWCharLen
 0041F1A4    test        ebx,ebx
>0041F1A6    jle         0041F1B1
 0041F1A8    push        ebx
 0041F1A9    mov         eax,dword ptr [edi]
 0041F1AB    push        eax
 0041F1AC    call        user32.CharUpperBuffW
 0041F1B1    pop         edi
 0041F1B2    pop         esi
 0041F1B3    pop         ebx
 0041F1B4    ret
*}
end;

//0041F1B8
function WideCompareStr(const S1:WideString; const S2:WideString):Integer;
begin
{*
 0041F1B8    push        ebx
 0041F1B9    push        esi
 0041F1BA    push        edi
 0041F1BB    push        ebp
 0041F1BC    mov         ebp,edx
 0041F1BE    mov         edi,eax
 0041F1C0    push        0
 0041F1C2    call        kernel32.SetLastError
 0041F1C7    mov         ebx,edi
 0041F1C9    test        ebx,ebx
>0041F1CB    je          0041F1D6
 0041F1CD    sub         ebx,4
 0041F1D0    mov         eax,dword ptr [ebx]
 0041F1D2    shr         eax,1
 0041F1D4    mov         ebx,eax
 0041F1D6    mov         esi,ebp
 0041F1D8    test        esi,esi
>0041F1DA    je          0041F1E5
 0041F1DC    sub         esi,4
 0041F1DF    mov         eax,dword ptr [esi]
 0041F1E1    shr         eax,1
 0041F1E3    mov         esi,eax
 0041F1E5    push        esi
 0041F1E6    mov         eax,ebp
 0041F1E8    call        @WStrToPWChar
 0041F1ED    push        eax
 0041F1EE    push        ebx
 0041F1EF    mov         eax,edi
 0041F1F1    call        @WStrToPWChar
 0041F1F6    push        eax
 0041F1F7    push        0
 0041F1F9    push        400
 0041F1FE    call        kernel32.CompareStringW
 0041F203    sub         eax,2
 0041F206    mov         ebx,eax
 0041F208    call        kernel32.GetLastError
 0041F20D    test        eax,eax
>0041F20F    je          0041F216
 0041F211    call        RaiseLastOSError
 0041F216    mov         eax,ebx
 0041F218    pop         ebp
 0041F219    pop         edi
 0041F21A    pop         esi
 0041F21B    pop         ebx
 0041F21C    ret
*}
end;

//0041F220
function WideCompareText(const S1:WideString; const S2:WideString):Integer;
begin
{*
 0041F220    push        ebx
 0041F221    push        esi
 0041F222    push        edi
 0041F223    push        ebp
 0041F224    mov         ebp,edx
 0041F226    mov         edi,eax
 0041F228    push        0
 0041F22A    call        kernel32.SetLastError
 0041F22F    mov         ebx,edi
 0041F231    test        ebx,ebx
>0041F233    je          0041F23E
 0041F235    sub         ebx,4
 0041F238    mov         eax,dword ptr [ebx]
 0041F23A    shr         eax,1
 0041F23C    mov         ebx,eax
 0041F23E    mov         esi,ebp
 0041F240    test        esi,esi
>0041F242    je          0041F24D
 0041F244    sub         esi,4
 0041F247    mov         eax,dword ptr [esi]
 0041F249    shr         eax,1
 0041F24B    mov         esi,eax
 0041F24D    push        esi
 0041F24E    mov         eax,ebp
 0041F250    call        @WStrToPWChar
 0041F255    push        eax
 0041F256    push        ebx
 0041F257    mov         eax,edi
 0041F259    call        @WStrToPWChar
 0041F25E    push        eax
 0041F25F    push        1
 0041F261    push        400
 0041F266    call        kernel32.CompareStringW
 0041F26B    sub         eax,2
 0041F26E    mov         ebx,eax
 0041F270    call        kernel32.GetLastError
 0041F275    test        eax,eax
>0041F277    je          0041F27E
 0041F279    call        RaiseLastOSError
 0041F27E    mov         eax,ebx
 0041F280    pop         ebp
 0041F281    pop         edi
 0041F282    pop         esi
 0041F283    pop         ebx
 0041F284    ret
*}
end;

//0041F288
function Trim(const S:UnicodeString):UnicodeString;
begin
{*
 0041F288    push        ebx
 0041F289    push        esi
 0041F28A    push        edi
 0041F28B    push        ebp
 0041F28C    mov         ebp,edx
 0041F28E    mov         edi,eax
 0041F290    mov         eax,edi
 0041F292    test        eax,eax
>0041F294    je          0041F29B
 0041F296    sub         eax,4
 0041F299    mov         eax,dword ptr [eax]
 0041F29B    mov         esi,eax
 0041F29D    mov         ebx,1
 0041F2A2    test        esi,esi
>0041F2A4    jle         0041F2C2
 0041F2A6    cmp         word ptr [edi+ebx*2-2],20
>0041F2AC    jbe         0041F2C2
 0041F2AE    cmp         word ptr [edi+esi*2-2],20
>0041F2B4    jbe         0041F2C2
 0041F2B6    mov         eax,ebp
 0041F2B8    mov         edx,edi
 0041F2BA    call        @UStrAsg
>0041F2BF    jmp         0041F2F3
 0041F2C1    inc         ebx
 0041F2C2    cmp         esi,ebx
>0041F2C4    jl          0041F2CE
 0041F2C6    cmp         word ptr [edi+ebx*2-2],20
>0041F2CC    jbe         0041F2C1
 0041F2CE    cmp         esi,ebx
>0041F2D0    jge         0041F2DC
 0041F2D2    mov         eax,ebp
 0041F2D4    call        @UStrClr
>0041F2D9    jmp         0041F2F3
 0041F2DB    dec         esi
 0041F2DC    cmp         word ptr [edi+esi*2-2],20
>0041F2E2    jbe         0041F2DB
 0041F2E4    push        ebp
 0041F2E5    mov         ecx,esi
 0041F2E7    sub         ecx,ebx
 0041F2E9    inc         ecx
 0041F2EA    mov         edx,ebx
 0041F2EC    mov         eax,edi
 0041F2EE    call        @UStrCopy
 0041F2F3    pop         ebp
 0041F2F4    pop         edi
 0041F2F5    pop         esi
 0041F2F6    pop         ebx
 0041F2F7    ret
*}
end;

//0041F2F8
function TrimLeft(const S:UnicodeString):UnicodeString;
begin
{*
 0041F2F8    push        ebx
 0041F2F9    push        esi
 0041F2FA    push        edi
 0041F2FB    mov         edi,edx
 0041F2FD    mov         esi,eax
 0041F2FF    mov         eax,esi
 0041F301    test        eax,eax
>0041F303    je          0041F30A
 0041F305    sub         eax,4
 0041F308    mov         eax,dword ptr [eax]
 0041F30A    mov         ebx,1
>0041F30F    jmp         0041F312
 0041F311    inc         ebx
 0041F312    cmp         eax,ebx
>0041F314    jl          0041F31E
 0041F316    cmp         word ptr [esi+ebx*2-2],20
>0041F31C    jbe         0041F311
 0041F31E    cmp         ebx,1
>0041F321    jne         0041F32E
 0041F323    mov         eax,edi
 0041F325    mov         edx,esi
 0041F327    call        @UStrAsg
>0041F32C    jmp         0041F33D
 0041F32E    push        edi
 0041F32F    mov         ecx,7FFFFFFF
 0041F334    mov         edx,ebx
 0041F336    mov         eax,esi
 0041F338    call        @UStrCopy
 0041F33D    pop         edi
 0041F33E    pop         esi
 0041F33F    pop         ebx
 0041F340    ret
*}
end;

//0041F344
function TrimRight(const S:UnicodeString):UnicodeString;
begin
{*
 0041F344    push        ebx
 0041F345    push        esi
 0041F346    push        edi
 0041F347    mov         edi,edx
 0041F349    mov         esi,eax
 0041F34B    mov         eax,esi
 0041F34D    test        eax,eax
>0041F34F    je          0041F356
 0041F351    sub         eax,4
 0041F354    mov         eax,dword ptr [eax]
 0041F356    mov         ebx,eax
 0041F358    test        ebx,ebx
>0041F35A    jle         0041F370
 0041F35C    cmp         word ptr [esi+ebx*2-2],20
>0041F362    jbe         0041F370
 0041F364    mov         eax,edi
 0041F366    mov         edx,esi
 0041F368    call        @UStrAsg
>0041F36D    jmp         0041F38B
 0041F36F    dec         ebx
 0041F370    test        ebx,ebx
>0041F372    jle         0041F37C
 0041F374    cmp         word ptr [esi+ebx*2-2],20
>0041F37A    jbe         0041F36F
 0041F37C    push        edi
 0041F37D    mov         ecx,ebx
 0041F37F    mov         edx,1
 0041F384    mov         eax,esi
 0041F386    call        @UStrCopy
 0041F38B    pop         edi
 0041F38C    pop         esi
 0041F38D    pop         ebx
 0041F38E    ret
*}
end;

//0041F390
function AnsiQuotedStr(const S:UnicodeString; Quote:Char):UnicodeString;
begin
{*
 0041F390    push        ebp
 0041F391    mov         ebp,esp
 0041F393    add         esp,0FFFFFFF0
 0041F396    push        ebx
 0041F397    push        esi
 0041F398    push        edi
 0041F399    xor         ebx,ebx
 0041F39B    mov         dword ptr [ebp-0C],ebx
 0041F39E    mov         dword ptr [ebp-10],ebx
 0041F3A1    mov         edi,ecx
 0041F3A3    mov         word ptr [ebp-6],dx
 0041F3A7    mov         dword ptr [ebp-4],eax
 0041F3AA    xor         eax,eax
 0041F3AC    push        ebp
 0041F3AD    push        41F4F6
 0041F3B2    push        dword ptr fs:[eax]
 0041F3B5    mov         dword ptr fs:[eax],esp
 0041F3B8    xor         esi,esi
 0041F3BA    mov         eax,dword ptr [ebp-4]
 0041F3BD    call        @UStrToPWChar
 0041F3C2    movzx       edx,word ptr [ebp-6]
 0041F3C6    call        AnsiStrScan
 0041F3CB    mov         ebx,eax
 0041F3CD    test        ebx,ebx
>0041F3CF    je          0041F3E6
 0041F3D1    add         ebx,2
 0041F3D4    inc         esi
 0041F3D5    movzx       edx,word ptr [ebp-6]
 0041F3D9    mov         eax,ebx
 0041F3DB    call        AnsiStrScan
 0041F3E0    mov         ebx,eax
 0041F3E2    test        ebx,ebx
>0041F3E4    jne         0041F3D1
 0041F3E6    test        esi,esi
>0041F3E8    jne         0041F41C
 0041F3EA    lea         eax,[ebp-0C]
 0041F3ED    movzx       edx,word ptr [ebp-6]
 0041F3F1    call        @UStrFromWChar
 0041F3F6    push        dword ptr [ebp-0C]
 0041F3F9    push        dword ptr [ebp-4]
 0041F3FC    lea         eax,[ebp-10]
 0041F3FF    movzx       edx,word ptr [ebp-6]
 0041F403    call        @UStrFromWChar
 0041F408    push        dword ptr [ebp-10]
 0041F40B    mov         eax,edi
 0041F40D    mov         edx,3
 0041F412    call        @UStrCatN
>0041F417    jmp         0041F4DB
 0041F41C    mov         eax,dword ptr [ebp-4]
 0041F41F    test        eax,eax
>0041F421    je          0041F428
 0041F423    sub         eax,4
 0041F426    mov         eax,dword ptr [eax]
 0041F428    lea         edx,[esi+eax+2]
 0041F42C    mov         eax,edi
 0041F42E    call        @UStrSetLength
 0041F433    mov         eax,dword ptr [edi]
 0041F435    call        @UStrToPWChar
 0041F43A    mov         edi,eax
 0041F43C    movzx       eax,word ptr [ebp-6]
 0041F440    mov         word ptr [edi],ax
 0041F443    add         edi,2
 0041F446    mov         eax,dword ptr [ebp-4]
 0041F449    call        @UStrToPWChar
 0041F44E    mov         esi,eax
 0041F450    movzx       edx,word ptr [ebp-6]
 0041F454    mov         eax,esi
 0041F456    call        AnsiStrScan
 0041F45B    mov         ebx,eax
 0041F45D    add         ebx,2
 0041F460    mov         eax,ebx
 0041F462    sub         eax,esi
 0041F464    sar         eax,1
>0041F466    jns         0041F46B
 0041F468    adc         eax,0
 0041F46B    mov         ecx,eax
 0041F46D    add         ecx,ecx
 0041F46F    mov         edx,edi
 0041F471    mov         eax,esi
 0041F473    call        Move
 0041F478    mov         eax,ebx
 0041F47A    sub         eax,esi
 0041F47C    sar         eax,1
>0041F47E    jns         0041F483
 0041F480    adc         eax,0
 0041F483    add         eax,eax
 0041F485    add         edi,eax
 0041F487    movzx       eax,word ptr [ebp-6]
 0041F48B    mov         word ptr [edi],ax
 0041F48E    add         edi,2
 0041F491    mov         esi,ebx
 0041F493    movzx       edx,word ptr [ebp-6]
 0041F497    mov         eax,esi
 0041F499    call        AnsiStrScan
 0041F49E    mov         ebx,eax
 0041F4A0    test        ebx,ebx
>0041F4A2    jne         0041F45D
 0041F4A4    mov         eax,esi
 0041F4A6    call        StrEnd
 0041F4AB    mov         ebx,eax
 0041F4AD    mov         eax,ebx
 0041F4AF    sub         eax,esi
 0041F4B1    sar         eax,1
>0041F4B3    jns         0041F4B8
 0041F4B5    adc         eax,0
 0041F4B8    mov         ecx,eax
 0041F4BA    add         ecx,ecx
 0041F4BC    mov         edx,edi
 0041F4BE    mov         eax,esi
 0041F4C0    call        Move
 0041F4C5    sub         ebx,esi
 0041F4C7    sar         ebx,1
>0041F4C9    jns         0041F4CE
 0041F4CB    adc         ebx,0
 0041F4CE    mov         eax,ebx
 0041F4D0    add         eax,eax
 0041F4D2    add         edi,eax
 0041F4D4    movzx       eax,word ptr [ebp-6]
 0041F4D8    mov         word ptr [edi],ax
 0041F4DB    xor         eax,eax
 0041F4DD    pop         edx
 0041F4DE    pop         ecx
 0041F4DF    pop         ecx
 0041F4E0    mov         dword ptr fs:[eax],edx
 0041F4E3    push        41F4FD
 0041F4E8    lea         eax,[ebp-10]
 0041F4EB    mov         edx,2
 0041F4F0    call        @UStrArrayClr
 0041F4F5    ret
>0041F4F6    jmp         @HandleFinally
>0041F4FB    jmp         0041F4E8
 0041F4FD    pop         edi
 0041F4FE    pop         esi
 0041F4FF    pop         ebx
 0041F500    mov         esp,ebp
 0041F502    pop         ebp
 0041F503    ret
*}
end;

//0041F504
function AnsiExtractQuotedStr(var Src:PWideChar; Quote:WideChar):UnicodeString;
begin
{*
 0041F504    push        ebx
 0041F505    push        esi
 0041F506    push        edi
 0041F507    push        ebp
 0041F508    add         esp,0FFFFFFF8
 0041F50B    mov         dword ptr [esp],ecx
 0041F50E    mov         edi,edx
 0041F510    mov         ebx,eax
 0041F512    mov         eax,dword ptr [esp]
 0041F515    call        @UStrClr
 0041F51A    cmp         dword ptr [ebx],0
>0041F51D    je          0041F65D
 0041F523    mov         eax,dword ptr [ebx]
 0041F525    cmp         di,word ptr [eax]
>0041F528    jne         0041F65D
 0041F52E    add         dword ptr [ebx],2
 0041F531    mov         ebp,1
 0041F536    mov         esi,dword ptr [ebx]
 0041F538    mov         eax,dword ptr [ebx]
 0041F53A    mov         edx,edi
 0041F53C    call        AnsiStrScan
 0041F541    mov         dword ptr [ebx],eax
>0041F543    jmp         0041F55E
 0041F545    add         dword ptr [ebx],2
 0041F548    mov         eax,dword ptr [ebx]
 0041F54A    cmp         di,word ptr [eax]
>0041F54D    jne         0041F563
 0041F54F    add         dword ptr [ebx],2
 0041F552    inc         ebp
 0041F553    mov         eax,dword ptr [ebx]
 0041F555    mov         edx,edi
 0041F557    call        AnsiStrScan
 0041F55C    mov         dword ptr [ebx],eax
 0041F55E    cmp         dword ptr [ebx],0
>0041F561    jne         0041F545
 0041F563    cmp         dword ptr [ebx],0
 0041F566    sete        al
 0041F569    and         eax,7F
 0041F56C    mov         dword ptr [esp+4],eax
 0041F570    cmp         dword ptr [ebx],0
>0041F573    jne         0041F57E
 0041F575    mov         eax,esi
 0041F577    call        StrEnd
 0041F57C    mov         dword ptr [ebx],eax
 0041F57E    mov         eax,dword ptr [ebx]
 0041F580    sub         eax,esi
 0041F582    sar         eax,1
>0041F584    jns         0041F589
 0041F586    adc         eax,0
 0041F589    mov         edx,1
 0041F58E    sub         edx,dword ptr [esp+4]
 0041F592    cmp         eax,edx
>0041F594    jle         0041F65D
 0041F59A    mov         edx,eax
 0041F59C    sub         edx,ebp
 0041F59E    cmp         edx,dword ptr [esp+4]
>0041F5A2    je          0041F65D
 0041F5A8    cmp         ebp,1
>0041F5AB    jne         0041F5C3
 0041F5AD    mov         ecx,eax
 0041F5AF    dec         ecx
 0041F5B0    add         ecx,dword ptr [esp+4]
 0041F5B4    mov         eax,dword ptr [esp]
 0041F5B7    mov         edx,esi
 0041F5B9    call        @UStrFromPWCharLen
>0041F5BE    jmp         0041F65D
 0041F5C3    mov         edx,eax
 0041F5C5    sub         edx,ebp
 0041F5C7    add         edx,dword ptr [esp+4]
 0041F5CB    mov         eax,dword ptr [esp]
 0041F5CE    call        @UStrSetLength
 0041F5D3    mov         eax,dword ptr [esp]
 0041F5D6    mov         eax,dword ptr [eax]
 0041F5D8    call        @UStrToPWChar
 0041F5DD    mov         ebp,eax
 0041F5DF    mov         edx,edi
 0041F5E1    mov         eax,esi
 0041F5E3    call        AnsiStrScan
 0041F5E8    mov         dword ptr [ebx],eax
>0041F5EA    jmp         0041F62D
 0041F5EC    add         dword ptr [ebx],2
 0041F5EF    mov         eax,dword ptr [ebx]
 0041F5F1    cmp         di,word ptr [eax]
>0041F5F4    jne         0041F632
 0041F5F6    mov         eax,dword ptr [ebx]
 0041F5F8    sub         eax,esi
 0041F5FA    sar         eax,1
>0041F5FC    jns         0041F601
 0041F5FE    adc         eax,0
 0041F601    mov         ecx,eax
 0041F603    add         ecx,ecx
 0041F605    mov         edx,ebp
 0041F607    mov         eax,esi
 0041F609    call        Move
 0041F60E    mov         eax,dword ptr [ebx]
 0041F610    sub         eax,esi
 0041F612    sar         eax,1
>0041F614    jns         0041F619
 0041F616    adc         eax,0
 0041F619    add         eax,eax
 0041F61B    add         ebp,eax
 0041F61D    add         dword ptr [ebx],2
 0041F620    mov         esi,dword ptr [ebx]
 0041F622    mov         eax,dword ptr [ebx]
 0041F624    mov         edx,edi
 0041F626    call        AnsiStrScan
 0041F62B    mov         dword ptr [ebx],eax
 0041F62D    cmp         dword ptr [ebx],0
>0041F630    jne         0041F5EC
 0041F632    cmp         dword ptr [ebx],0
>0041F635    jne         0041F640
 0041F637    mov         eax,esi
 0041F639    call        StrEnd
 0041F63E    mov         dword ptr [ebx],eax
 0041F640    mov         eax,dword ptr [ebx]
 0041F642    sub         eax,esi
 0041F644    sar         eax,1
>0041F646    jns         0041F64B
 0041F648    adc         eax,0
 0041F64B    dec         eax
 0041F64C    add         eax,dword ptr [esp+4]
 0041F650    mov         ecx,eax
 0041F652    add         ecx,ecx
 0041F654    mov         edx,ebp
 0041F656    mov         eax,esi
 0041F658    call        Move
 0041F65D    pop         ecx
 0041F65E    pop         edx
 0041F65F    pop         ebp
 0041F660    pop         edi
 0041F661    pop         esi
 0041F662    pop         ebx
 0041F663    ret
*}
end;

//0041F664
function AdjustLineBreaks(const S:UnicodeString; Style:TTextLineBreakStyle):UnicodeString;
begin
{*
 0041F664    push        ebx
 0041F665    push        esi
 0041F666    push        edi
 0041F667    push        ebp
 0041F668    add         esp,0FFFFFFF8
 0041F66B    mov         dword ptr [esp],ecx
 0041F66E    mov         ebx,edx
 0041F670    mov         ebp,eax
 0041F672    mov         edi,ebp
 0041F674    mov         edx,ebp
 0041F676    mov         eax,edx
 0041F678    test        eax,eax
>0041F67A    je          0041F681
 0041F67C    sub         eax,4
 0041F67F    mov         eax,dword ptr [eax]
 0041F681    mov         esi,eax
 0041F683    add         esi,esi
 0041F685    add         esi,edi
 0041F687    mov         eax,edx
 0041F689    test        eax,eax
>0041F68B    je          0041F692
 0041F68D    sub         eax,4
 0041F690    mov         eax,dword ptr [eax]
 0041F692    mov         dword ptr [esp+4],eax
 0041F696    cmp         esi,edi
>0041F698    jbe         0041F6DF
 0041F69A    movzx       eax,word ptr [edi]
 0041F69D    sub         ax,0A
>0041F6A1    je          0041F6AB
 0041F6A3    sub         ax,3
>0041F6A7    je          0041F6B6
>0041F6A9    jmp         0041F6D8
 0041F6AB    cmp         bl,1
>0041F6AE    jne         0041F6D8
 0041F6B0    inc         dword ptr [esp+4]
>0041F6B4    jmp         0041F6D8
 0041F6B6    cmp         bl,1
>0041F6B9    jne         0041F6CD
 0041F6BB    cmp         word ptr [edi+2],0A
>0041F6C0    jne         0041F6C7
 0041F6C2    add         edi,2
>0041F6C5    jmp         0041F6D8
 0041F6C7    inc         dword ptr [esp+4]
>0041F6CB    jmp         0041F6D8
 0041F6CD    cmp         word ptr [edi+2],0A
>0041F6D2    jne         0041F6D8
 0041F6D4    dec         dword ptr [esp+4]
 0041F6D8    add         edi,2
 0041F6DB    cmp         esi,edi
>0041F6DD    ja          0041F69A
 0041F6DF    mov         eax,edi
 0041F6E1    call        @PWCharLen
 0041F6E6    cmp         eax,dword ptr [esp+4]
>0041F6EA    jne         0041F6F8
 0041F6EC    mov         eax,dword ptr [esp]
 0041F6EF    mov         edx,ebp
 0041F6F1    call        @UStrAsg
>0041F6F6    jmp         0041F76E
 0041F6F8    mov         edi,ebp
 0041F6FA    mov         eax,dword ptr [esp]
 0041F6FD    mov         ecx,dword ptr [esp+4]
 0041F701    xor         edx,edx
 0041F703    call        @UStrFromPWCharLen
 0041F708    mov         eax,dword ptr [esp]
 0041F70B    mov         eax,dword ptr [eax]
 0041F70D    cmp         esi,edi
>0041F70F    jbe         0041F76E
 0041F711    movzx       edx,word ptr [edi]
 0041F714    mov         ecx,edx
 0041F716    sub         cx,0A
>0041F71A    je          0041F724
 0041F71C    sub         cx,3
>0041F720    je          0041F73E
>0041F722    jmp         0041F761
 0041F724    cmp         bl,1
>0041F727    jne         0041F731
 0041F729    mov         word ptr [eax],0D
 0041F72E    add         eax,2
 0041F731    mov         word ptr [eax],0A
 0041F736    add         eax,2
 0041F739    add         edi,2
>0041F73C    jmp         0041F76A
 0041F73E    cmp         bl,1
>0041F741    jne         0041F74B
 0041F743    mov         word ptr [eax],0D
 0041F748    add         eax,2
 0041F74B    mov         word ptr [eax],0A
 0041F750    add         eax,2
 0041F753    add         edi,2
 0041F756    cmp         word ptr [edi],0A
>0041F75A    jne         0041F76A
 0041F75C    add         edi,2
>0041F75F    jmp         0041F76A
 0041F761    mov         word ptr [eax],dx
 0041F764    add         eax,2
 0041F767    add         edi,2
 0041F76A    cmp         esi,edi
>0041F76C    ja          0041F711
 0041F76E    pop         ecx
 0041F76F    pop         edx
 0041F770    pop         ebp
 0041F771    pop         edi
 0041F772    pop         esi
 0041F773    pop         ebx
 0041F774    ret
*}
end;

//0041F778
function IsValidIdent(const Ident:UnicodeString; AllowDots:Boolean):Boolean;
begin
{*
 0041F778    push        ebx
 0041F779    push        esi
 0041F77A    push        edi
 0041F77B    push        ebp
 0041F77C    push        ecx
 0041F77D    mov         byte ptr [esp],dl
 0041F780    mov         esi,eax
 0041F782    xor         ebx,ebx
 0041F784    mov         eax,esi
 0041F786    test        eax,eax
>0041F788    je          0041F78F
 0041F78A    sub         eax,4
 0041F78D    mov         eax,dword ptr [eax]
 0041F78F    test        eax,eax
>0041F791    jne         0041F797
 0041F793    mov         al,1
>0041F795    jmp         0041F7AF
 0041F797    movzx       eax,word ptr [esi]
 0041F79A    call        TCharacter.IsLetter
 0041F79F    test        al,al
>0041F7A1    jne         0041F7A9
 0041F7A3    cmp         word ptr [esi],5F
>0041F7A7    jne         0041F7AD
 0041F7A9    xor         eax,eax
>0041F7AB    jmp         0041F7AF
 0041F7AD    mov         al,1
 0041F7AF    test        al,al
>0041F7B1    jne         0041F829
 0041F7B3    cmp         byte ptr [esp],0
>0041F7B7    je          0041F7F5
 0041F7B9    mov         eax,esi
 0041F7BB    test        eax,eax
>0041F7BD    je          0041F7C4
 0041F7BF    sub         eax,4
 0041F7C2    mov         eax,dword ptr [eax]
 0041F7C4    mov         edi,eax
 0041F7C6    sub         edi,2
>0041F7C9    jl          0041F827
 0041F7CB    inc         edi
 0041F7CC    mov         ebp,2
 0041F7D1    movzx       eax,word ptr [esi+ebp*2-2]
 0041F7D6    call        TCharacter.IsLetterOrDigit
 0041F7DB    test        al,al
>0041F7DD    jne         0041F7EF
 0041F7DF    cmp         word ptr [esi+ebp*2-2],5F
>0041F7E5    je          0041F7EF
 0041F7E7    cmp         word ptr [esi+ebp*2-2],2E
>0041F7ED    jne         0041F829
 0041F7EF    inc         ebp
 0041F7F0    dec         edi
>0041F7F1    jne         0041F7D1
>0041F7F3    jmp         0041F827
 0041F7F5    mov         eax,esi
 0041F7F7    test        eax,eax
>0041F7F9    je          0041F800
 0041F7FB    sub         eax,4
 0041F7FE    mov         eax,dword ptr [eax]
 0041F800    mov         edi,eax
 0041F802    sub         edi,2
>0041F805    jl          0041F827
 0041F807    inc         edi
 0041F808    mov         ebp,2
 0041F80D    movzx       eax,word ptr [esi+ebp*2-2]
 0041F812    call        TCharacter.IsLetterOrDigit
 0041F817    test        al,al
>0041F819    jne         0041F823
 0041F81B    cmp         word ptr [esi+ebp*2-2],5F
>0041F821    jne         0041F829
 0041F823    inc         ebp
 0041F824    dec         edi
>0041F825    jne         0041F80D
 0041F827    mov         bl,1
 0041F829    mov         eax,ebx
 0041F82B    pop         edx
 0041F82C    pop         ebp
 0041F82D    pop         edi
 0041F82E    pop         esi
 0041F82F    pop         ebx
 0041F830    ret
*}
end;

//0041F834
procedure CvtIntW;
begin
{*
 0041F834    or          cl,cl
>0041F836    jne         0041F855
 0041F838    or          eax,eax
>0041F83A    jns         0041F850
 0041F83C    neg         eax
 0041F83E    call        0041F850
 0041F843    mov         ax,2D
 0041F847    mov         word ptr [esi-2],ax
 0041F84B    sub         esi,2
 0041F84E    inc         ecx
 0041F84F    ret
 0041F850    mov         ecx,0A
 0041F855    push        edx
 0041F856    push        esi
 0041F857    xor         edx,edx
 0041F859    div         eax,ecx
 0041F85B    add         dx,30
 0041F85F    sub         esi,2
 0041F862    cmp         dx,3A
>0041F866    jb          0041F86C
 0041F868    add         dx,7
 0041F86C    mov         word ptr [esi],dx
 0041F86F    or          eax,eax
>0041F871    jne         0041F857
 0041F873    pop         ecx
 0041F874    pop         edx
 0041F875    sub         ecx,esi
 0041F877    shr         ecx,1
 0041F879    sub         edx,ecx
>0041F87B    jbe         0041F893
 0041F87D    add         ecx,edx
 0041F87F    sub         esi,edx
 0041F881    mov         ax,30
 0041F885    sub         esi,edx
>0041F887    jmp         0041F88D
 0041F889    mov         word ptr [esi+edx*2],ax
 0041F88D    dec         edx
>0041F88E    jne         0041F889
 0041F890    mov         word ptr [esi],ax
 0041F893    ret
*}
end;

//0041F894
function IntToStr(Value:Integer):UnicodeString;
begin
{*
 0041F894    push        esi
 0041F895    mov         esi,esp
 0041F897    sub         esp,310
 0041F89D    xor         ecx,ecx
 0041F89F    push        edx
 0041F8A0    xor         edx,edx
 0041F8A2    call        CvtIntW
 0041F8A7    mov         edx,esi
 0041F8A9    pop         eax
 0041F8AA    call        @UStrFromPWCharLen
 0041F8AF    add         esp,310
 0041F8B5    pop         esi
 0041F8B6    ret
*}
end;

//0041F8B8
function UIntToStr(Value:Cardinal):UnicodeString;
begin
{*
 0041F8B8    add         esp,0FFFFFFF8
 0041F8BB    push        0
 0041F8BD    mov         dword ptr [esp+4],eax
 0041F8C1    mov         byte ptr [esp+8],0
 0041F8C6    lea         ecx,[esp+4]
 0041F8CA    mov         eax,edx
 0041F8CC    mov         edx,41F8E8;'%u'
 0041F8D1    call        FmtStr
 0041F8D6    pop         ecx
 0041F8D7    pop         edx
 0041F8D8    ret
*}
end;

//0041F8F0
function UIntToStr(Value:UInt64):UnicodeString;
begin
{*
 0041F8F0    push        ebp
 0041F8F1    mov         ebp,esp
 0041F8F3    add         esp,0FFFFFFF8
 0041F8F6    push        0
 0041F8F8    lea         edx,[ebp+8]
 0041F8FB    mov         dword ptr [ebp-8],edx
 0041F8FE    mov         byte ptr [ebp-4],10
 0041F902    lea         ecx,[ebp-8]
 0041F905    mov         edx,41F924;'%u'
 0041F90A    call        FmtStr
 0041F90F    pop         ecx
 0041F910    pop         ecx
 0041F911    pop         ebp
 0041F912    ret         8
*}
end;

//0041F92C
procedure CvtInt64W;
begin
{*
 0041F92C    or          cl,cl
>0041F92E    jne         0041F964
 0041F930    mov         ecx,0A
 0041F935    test        dword ptr [eax+4],80000000
>0041F93C    je          0041F964
 0041F93E    push        dword ptr [eax+4]
 0041F941    push        dword ptr [eax]
 0041F943    mov         eax,esp
 0041F945    neg         dword ptr [esp]
 0041F948    adc         dword ptr [esp+4],0
 0041F94D    neg         dword ptr [esp+4]
 0041F951    call        0041F964
 0041F956    inc         ecx
 0041F957    mov         word ptr [esi-2],2D
 0041F95D    sub         esi,2
 0041F960    add         esp,8
 0041F963    ret
*}
end;

//0041FA10
function IntToStr(Value:Int64):UnicodeString;
begin
{*
 0041FA10    push        ebp
 0041FA11    mov         ebp,esp
 0041FA13    push        esi
 0041FA14    mov         esi,esp
 0041FA16    sub         esp,620
 0041FA1C    xor         ecx,ecx
 0041FA1E    push        eax
 0041FA1F    xor         edx,edx
 0041FA21    lea         eax,[ebp+8]
 0041FA24    call        CvtInt64W
 0041FA29    mov         edx,esi
 0041FA2B    pop         eax
 0041FA2C    call        @UStrFromPWCharLen
 0041FA31    add         esp,620
 0041FA37    pop         esi
 0041FA38    pop         ebp
 0041FA39    ret         8
*}
end;

//0041FA3C
function IntToHex(Value:Integer; Digits:Integer):UnicodeString;
begin
{*
 0041FA3C    cmp         edx,20
>0041FA3F    jbe         0041FA43
 0041FA41    xor         edx,edx
 0041FA43    push        esi
 0041FA44    mov         esi,esp
 0041FA46    sub         esp,620
 0041FA4C    push        ecx
 0041FA4D    mov         ecx,10
 0041FA52    call        CvtIntW
 0041FA57    mov         edx,esi
 0041FA59    pop         eax
 0041FA5A    call        @UStrFromPWCharLen
 0041FA5F    add         esp,620
 0041FA65    pop         esi
 0041FA66    ret
*}
end;

//0041FA68
function IntToHex(Digits:Integer; Value:Int64):UnicodeString;
begin
{*
 0041FA68    push        ebp
 0041FA69    mov         ebp,esp
 0041FA6B    cmp         eax,20
>0041FA6E    jle         0041FA72
 0041FA70    xor         eax,eax
 0041FA72    push        esi
 0041FA73    mov         esi,esp
 0041FA75    sub         esp,620
 0041FA7B    mov         ecx,10
 0041FA80    push        edx
 0041FA81    mov         edx,eax
 0041FA83    lea         eax,[ebp+8]
 0041FA86    call        CvtInt64W
 0041FA8B    mov         edx,esi
 0041FA8D    pop         eax
 0041FA8E    call        @UStrFromPWCharLen
 0041FA93    add         esp,620
 0041FA99    pop         esi
 0041FA9A    pop         ebp
 0041FA9B    ret         8
*}
end;

//0041FAA0
function StrToInt(const S:UnicodeString):Integer;
begin
{*
 0041FAA0    push        ebx
 0041FAA1    push        esi
 0041FAA2    add         esp,0FFFFFFF4
 0041FAA5    mov         ebx,eax
 0041FAA7    mov         edx,esp
 0041FAA9    mov         eax,ebx
 0041FAAB    call        @ValLong
 0041FAB0    mov         esi,eax
 0041FAB2    cmp         dword ptr [esp],0
>0041FAB6    je          0041FAD1
 0041FAB8    mov         dword ptr [esp+4],ebx
 0041FABC    mov         byte ptr [esp+8],11
 0041FAC1    lea         edx,[esp+4]
 0041FAC5    mov         eax,[0078D104];^SResString167:TResStringRec
 0041FACA    xor         ecx,ecx
 0041FACC    call        ConvertErrorFmt
 0041FAD1    mov         eax,esi
 0041FAD3    add         esp,0C
 0041FAD6    pop         esi
 0041FAD7    pop         ebx
 0041FAD8    ret
*}
end;

//0041FADC
function StrToIntDef(const S:UnicodeString; Default:Integer):Integer;
begin
{*
 0041FADC    push        ebx
 0041FADD    push        ecx
 0041FADE    mov         ebx,edx
 0041FAE0    mov         edx,esp
 0041FAE2    call        @ValLong
 0041FAE7    cmp         dword ptr [esp],0
>0041FAEB    je          0041FAEF
 0041FAED    mov         eax,ebx
 0041FAEF    pop         edx
 0041FAF0    pop         ebx
 0041FAF1    ret
*}
end;

//0041FAF4
function TryStrToInt(const S:UnicodeString; var Value:Integer):Boolean;
begin
{*
 0041FAF4    push        ebx
 0041FAF5    push        esi
 0041FAF6    push        ecx
 0041FAF7    mov         esi,edx
 0041FAF9    mov         ebx,eax
 0041FAFB    mov         edx,esp
 0041FAFD    mov         eax,ebx
 0041FAFF    call        @ValLong
 0041FB04    mov         dword ptr [esi],eax
 0041FB06    cmp         dword ptr [esp],0
 0041FB0A    sete        al
 0041FB0D    pop         edx
 0041FB0E    pop         esi
 0041FB0F    pop         ebx
 0041FB10    ret
*}
end;

//0041FB14
function StrToInt64(const S:UnicodeString):Int64;
begin
{*
 0041FB14    push        ebx
 0041FB15    add         esp,0FFFFFFEC
 0041FB18    mov         ebx,eax
 0041FB1A    lea         edx,[esp+8]
 0041FB1E    mov         eax,ebx
 0041FB20    call        @ValInt64
 0041FB25    mov         dword ptr [esp],eax
 0041FB28    mov         dword ptr [esp+4],edx
 0041FB2C    cmp         dword ptr [esp+8],0
>0041FB31    je          0041FB4C
 0041FB33    mov         dword ptr [esp+0C],ebx
 0041FB37    mov         byte ptr [esp+10],11
 0041FB3C    lea         edx,[esp+0C]
 0041FB40    mov         eax,[0078D104];^SResString167:TResStringRec
 0041FB45    xor         ecx,ecx
 0041FB47    call        ConvertErrorFmt
 0041FB4C    mov         eax,dword ptr [esp]
 0041FB4F    mov         edx,dword ptr [esp+4]
 0041FB53    add         esp,14
 0041FB56    pop         ebx
 0041FB57    ret
*}
end;

//0041FB58
function StrToInt64Def(const S:UnicodeString; const Default:Int64):Int64;
begin
{*
 0041FB58    push        ebp
 0041FB59    mov         ebp,esp
 0041FB5B    add         esp,0FFFFFFF4
 0041FB5E    lea         edx,[ebp-0C]
 0041FB61    call        @ValInt64
 0041FB66    mov         dword ptr [ebp-8],eax
 0041FB69    mov         dword ptr [ebp-4],edx
 0041FB6C    cmp         dword ptr [ebp-0C],0
>0041FB70    je          0041FB7E
 0041FB72    mov         eax,dword ptr [ebp+8]
 0041FB75    mov         dword ptr [ebp-8],eax
 0041FB78    mov         eax,dword ptr [ebp+0C]
 0041FB7B    mov         dword ptr [ebp-4],eax
 0041FB7E    mov         eax,dword ptr [ebp-8]
 0041FB81    mov         edx,dword ptr [ebp-4]
 0041FB84    mov         esp,ebp
 0041FB86    pop         ebp
 0041FB87    ret         8
*}
end;

//0041FB8C
function TryStrToInt64(const S:UnicodeString; var Value:Int64):Boolean;
begin
{*
 0041FB8C    push        ebx
 0041FB8D    push        esi
 0041FB8E    push        ecx
 0041FB8F    mov         esi,edx
 0041FB91    mov         ebx,eax
 0041FB93    mov         edx,esp
 0041FB95    mov         eax,ebx
 0041FB97    call        @ValInt64
 0041FB9C    mov         dword ptr [esi],eax
 0041FB9E    mov         dword ptr [esi+4],edx
 0041FBA1    cmp         dword ptr [esp],0
 0041FBA5    sete        al
 0041FBA8    pop         edx
 0041FBA9    pop         esi
 0041FBAA    pop         ebx
 0041FBAB    ret
*}
end;

//0041FBAC
procedure VerifyBoolStrArray;
begin
{*
 0041FBAC    mov         eax,[00790DE8];gvar_00790DE8:?
 0041FBB1    call        @DynArrayLength
 0041FBB6    test        eax,eax
>0041FBB8    jne         0041FBE3
 0041FBBA    push        1
 0041FBBC    mov         eax,790DE8;gvar_00790DE8:?
 0041FBC1    mov         ecx,1
 0041FBC6    mov         edx,dword ptr ds:[41ADB4];:65
 0041FBCC    call        @DynArraySetLength
 0041FBD1    add         esp,4
 0041FBD4    mov         eax,[00790DE8];gvar_00790DE8:?
 0041FBD9    mov         edx,41FC28;'True'
 0041FBDE    call        @UStrAsg
 0041FBE3    mov         eax,[00790DEC];gvar_00790DEC:?
 0041FBE8    call        @DynArrayLength
 0041FBED    test        eax,eax
>0041FBEF    jne         0041FC1A
 0041FBF1    push        1
 0041FBF3    mov         eax,790DEC;gvar_00790DEC:?
 0041FBF8    mov         ecx,1
 0041FBFD    mov         edx,dword ptr ds:[41ADDC];:75
 0041FC03    call        @DynArraySetLength
 0041FC08    add         esp,4
 0041FC0B    mov         eax,[00790DEC];gvar_00790DEC:?
 0041FC10    mov         edx,41FC40;'False'
 0041FC15    call        @UStrAsg
 0041FC1A    ret
*}
end;

//0041FC4C
function CompareWith(const aArray:array[$0..-$1] of System.UnicodeString; const _Dv_:$0..-$1):Boolean;
begin
{*
 0041FC4C    push        ebp
 0041FC4D    mov         ebp,esp
 0041FC4F    add         esp,0FFFFFFF0
 0041FC52    push        ebx
 0041FC53    push        esi
 0041FC54    push        edi
 0041FC55    mov         byte ptr [ebp-1],0
 0041FC59    mov         esi,edx
 0041FC5B    test        esi,esi
>0041FC5D    jl          0041FC90
 0041FC5F    inc         esi
 0041FC60    mov         ebx,eax
 0041FC62    mov         eax,dword ptr [ebp+8]
 0041FC65    mov         edi,dword ptr [eax-4]
 0041FC68    mov         eax,dword ptr [ebx]
 0041FC6A    mov         dword ptr [ebp-0C],eax
 0041FC6D    mov         edx,dword ptr [ebp-0C]
 0041FC70    mov         dword ptr [ebp-10],edi
 0041FC73    mov         eax,dword ptr [ebp-10]
 0041FC76    call        AnsiCompareText
 0041FC7B    test        eax,eax
 0041FC7D    sete        al
 0041FC80    test        al,al
>0041FC82    je          0041FC8A
 0041FC84    mov         byte ptr [ebp-1],1
>0041FC88    jmp         0041FC90
 0041FC8A    add         ebx,4
 0041FC8D    dec         esi
>0041FC8E    jne         0041FC62
 0041FC90    movzx       eax,byte ptr [ebp-1]
 0041FC94    pop         edi
 0041FC95    pop         esi
 0041FC96    pop         ebx
 0041FC97    mov         esp,ebp
 0041FC99    pop         ebp
 0041FC9A    ret
*}
end;

//0041FC9C
function TryStrToBool(const S:UnicodeString; var Value:Boolean):Boolean;
begin
{*
 0041FC9C    push        ebp
 0041FC9D    mov         ebp,esp
 0041FC9F    add         esp,0FFFFFFF0
 0041FCA2    push        ebx
 0041FCA3    mov         ebx,edx
 0041FCA5    mov         dword ptr [ebp-4],eax
 0041FCA8    lea         edx,[ebp-10]
 0041FCAB    mov         eax,dword ptr [ebp-4]
 0041FCAE    call        TryStrToFloat
 0041FCB3    mov         edx,eax
 0041FCB5    test        dl,dl
>0041FCB7    je          0041FCCB
 0041FCB9    fld         tbyte ptr [ebp-10]
 0041FCBC    fcomp       dword ptr ds:[41FD1C]
 0041FCC2    wait
 0041FCC3    fnstsw      al
 0041FCC5    sahf
 0041FCC6    setne       byte ptr [ebx]
>0041FCC9    jmp         0041FD14
 0041FCCB    call        VerifyBoolStrArray
 0041FCD0    push        ebp
 0041FCD1    mov         eax,[00790DE8];gvar_00790DE8:?
 0041FCD6    call        @DynArrayHigh
 0041FCDB    mov         edx,eax
 0041FCDD    mov         eax,[00790DE8];gvar_00790DE8:?
 0041FCE2    call        CompareWith
 0041FCE7    pop         ecx
 0041FCE8    mov         edx,eax
 0041FCEA    test        dl,dl
>0041FCEC    je          0041FCF3
 0041FCEE    mov         byte ptr [ebx],1
>0041FCF1    jmp         0041FD14
 0041FCF3    push        ebp
 0041FCF4    mov         eax,[00790DEC];gvar_00790DEC:?
 0041FCF9    call        @DynArrayHigh
 0041FCFE    mov         edx,eax
 0041FD00    mov         eax,[00790DEC];gvar_00790DEC:?
 0041FD05    call        CompareWith
 0041FD0A    pop         ecx
 0041FD0B    mov         edx,eax
 0041FD0D    test        dl,dl
>0041FD0F    je          0041FD14
 0041FD11    mov         byte ptr [ebx],0
 0041FD14    mov         eax,edx
 0041FD16    pop         ebx
 0041FD17    mov         esp,ebp
 0041FD19    pop         ebp
 0041FD1A    ret
*}
end;

//0041FD44
function BoolToStr(B:Boolean; UseBoolStrs:Boolean):UnicodeString;
begin
{*
 0041FD44    push        ebx
 0041FD45    push        esi
 0041FD46    mov         esi,ecx
 0041FD48    mov         ebx,eax
 0041FD4A    test        dl,dl
>0041FD4C    je          0041FD7A
 0041FD4E    call        VerifyBoolStrArray
 0041FD53    test        bl,bl
>0041FD55    je          0041FD68
 0041FD57    mov         eax,esi
 0041FD59    mov         edx,dword ptr ds:[790DE8];gvar_00790DE8:?
 0041FD5F    mov         edx,dword ptr [edx]
 0041FD61    call        @UStrAsg
>0041FD66    jmp         0041FD8B
 0041FD68    mov         eax,esi
 0041FD6A    mov         edx,dword ptr ds:[790DEC];gvar_00790DEC:?
 0041FD70    mov         edx,dword ptr [edx]
 0041FD72    call        @UStrAsg
 0041FD77    pop         esi
 0041FD78    pop         ebx
 0041FD79    ret
 0041FD7A    mov         eax,esi
 0041FD7C    movzx       edx,bl
 0041FD7F    mov         edx,dword ptr [edx*4+784CEC];^'0'
 0041FD86    call        @UStrAsg
 0041FD8B    pop         esi
 0041FD8C    pop         ebx
 0041FD8D    ret
*}
end;

//0041FDD8
function EnumStringModules(Instance:LongInt; Data:Pointer):Boolean;
begin
{*
 0041FDD8    push        ebx
 0041FDD9    push        esi
 0041FDDA    add         esp,0FFFFF800
 0041FDE0    mov         esi,eax
 0041FDE2    mov         ebx,edx
 0041FDE4    push        400
 0041FDE9    lea         eax,[esp+4]
 0041FDED    push        eax
 0041FDEE    mov         eax,dword ptr [ebx]
 0041FDF0    push        eax
 0041FDF1    push        esi
 0041FDF2    call        user32.LoadStringW
 0041FDF7    mov         ecx,eax
 0041FDF9    mov         edx,esp
 0041FDFB    lea         eax,[ebx+4]
 0041FDFE    call        @UStrFromPWCharLen
 0041FE03    cmp         dword ptr [ebx+4],0
 0041FE07    sete        al
 0041FE0A    add         esp,800
 0041FE10    pop         esi
 0041FE11    pop         ebx
 0041FE12    ret
*}
end;

//0041FE14
function FindStringResource(Ident:Integer):UnicodeString;
begin
{*
 0041FE14    push        ebp
 0041FE15    mov         ebp,esp
 0041FE17    add         esp,0FFFFFFF8
 0041FE1A    push        ebx
 0041FE1B    push        esi
 0041FE1C    mov         esi,edx
 0041FE1E    mov         ebx,eax
 0041FE20    lea         eax,[ebp-8]
 0041FE23    mov         edx,dword ptr ds:[41FD90];TStrData
 0041FE29    call        @InitializeRecord
 0041FE2E    xor         eax,eax
 0041FE30    push        ebp
 0041FE31    push        41FE7A
 0041FE36    push        dword ptr fs:[eax]
 0041FE39    mov         dword ptr fs:[eax],esp
 0041FE3C    mov         dword ptr [ebp-8],ebx
 0041FE3F    lea         eax,[ebp-4]
 0041FE42    call        @UStrClr
 0041FE47    lea         edx,[ebp-8]
 0041FE4A    mov         eax,41FDD8;EnumStringModules:Boolean
 0041FE4F    call        EnumResourceModules
 0041FE54    mov         eax,esi
 0041FE56    mov         edx,dword ptr [ebp-4]
 0041FE59    call        @UStrAsg
 0041FE5E    xor         eax,eax
 0041FE60    pop         edx
 0041FE61    pop         ecx
 0041FE62    pop         ecx
 0041FE63    mov         dword ptr fs:[eax],edx
 0041FE66    push        41FE81
 0041FE6B    lea         eax,[ebp-8]
 0041FE6E    mov         edx,dword ptr ds:[41FD90];TStrData
 0041FE74    call        @FinalizeRecord
 0041FE79    ret
>0041FE7A    jmp         @HandleFinally
>0041FE7F    jmp         0041FE6B
 0041FE81    pop         esi
 0041FE82    pop         ebx
 0041FE83    pop         ecx
 0041FE84    pop         ecx
 0041FE85    pop         ebp
 0041FE86    ret
*}
end;

//0041FE88
function LoadStr(Ident:Integer):UnicodeString;
begin
{*
 0041FE88    push        ebx
 0041FE89    push        esi
 0041FE8A    mov         esi,edx
 0041FE8C    mov         ebx,eax
 0041FE8E    mov         edx,esi
 0041FE90    mov         eax,ebx
 0041FE92    call        FindStringResource
 0041FE97    pop         esi
 0041FE98    pop         ebx
 0041FE99    ret
*}
end;

//0041FE9C
function FileOpen(const FileName:UnicodeString; Mode:LongWord):Integer;
begin
{*
 0041FE9C    push        ebx
 0041FE9D    push        esi
 0041FE9E    push        edi
 0041FE9F    mov         ebx,edx
 0041FEA1    mov         edi,eax
 0041FEA3    or          eax,0FFFFFFFF
 0041FEA6    mov         esi,ebx
 0041FEA8    and         esi,3
 0041FEAB    cmp         esi,2
>0041FEAE    ja          0041FEEF
 0041FEB0    mov         edx,ebx
 0041FEB2    and         edx,0F0
 0041FEB8    cmp         edx,40
>0041FEBB    ja          0041FEEF
 0041FEBD    push        0
 0041FEBF    push        80
 0041FEC4    push        3
 0041FEC6    push        0
 0041FEC8    mov         eax,ebx
 0041FECA    and         eax,0F0
 0041FECF    shr         eax,4
 0041FED2    mov         eax,dword ptr [eax*4+784D00]
 0041FED9    push        eax
 0041FEDA    mov         eax,dword ptr [esi*4+784CF4]
 0041FEE1    push        eax
 0041FEE2    mov         eax,edi
 0041FEE4    call        @UStrToPWChar
 0041FEE9    push        eax
 0041FEEA    call        kernel32.CreateFileW
 0041FEEF    pop         edi
 0041FEF0    pop         esi
 0041FEF1    pop         ebx
 0041FEF2    ret
*}
end;

//0041FEF4
function FileCreate(const FileName:UnicodeString; Mode:LongWord; Rights:Integer):Integer;
begin
{*
 0041FEF4    push        ebx
 0041FEF5    push        esi
 0041FEF6    push        edi
 0041FEF7    mov         ebx,edx
 0041FEF9    mov         edi,eax
 0041FEFB    or          eax,0FFFFFFFF
 0041FEFE    mov         esi,ebx
 0041FF00    and         esi,0F0
 0041FF06    cmp         esi,40
>0041FF09    ja          0041FF41
 0041FF0B    push        0
 0041FF0D    push        80
 0041FF12    mov         eax,ebx
 0041FF14    and         eax,4
 0041FF17    shr         eax,2
 0041FF1A    mov         eax,dword ptr [eax*4+784D14]
 0041FF21    push        eax
 0041FF22    push        0
 0041FF24    shr         esi,4
 0041FF27    mov         eax,dword ptr [esi*4+784D1C]
 0041FF2E    push        eax
 0041FF2F    push        0C0000000
 0041FF34    mov         eax,edi
 0041FF36    call        @UStrToPWChar
 0041FF3B    push        eax
 0041FF3C    call        kernel32.CreateFileW
 0041FF41    pop         edi
 0041FF42    pop         esi
 0041FF43    pop         ebx
 0041FF44    ret
*}
end;

//0041FF48
function FileRead(Handle:Integer; var Buffer:void ; Count:LongWord):Integer;
begin
{*
 0041FF48    push        ebx
 0041FF49    push        esi
 0041FF4A    push        edi
 0041FF4B    push        ecx
 0041FF4C    mov         edi,ecx
 0041FF4E    mov         esi,edx
 0041FF50    mov         ebx,eax
 0041FF52    push        0
 0041FF54    lea         eax,[esp+4]
 0041FF58    push        eax
 0041FF59    push        edi
 0041FF5A    push        esi
 0041FF5B    push        ebx
 0041FF5C    call        kernel32.ReadFile
 0041FF61    test        eax,eax
>0041FF63    jne         0041FF6C
 0041FF65    mov         dword ptr [esp],0FFFFFFFF
 0041FF6C    mov         eax,dword ptr [esp]
 0041FF6F    pop         edx
 0041FF70    pop         edi
 0041FF71    pop         esi
 0041FF72    pop         ebx
 0041FF73    ret
*}
end;

//0041FF74
function FileWrite(Handle:Integer; const Buffer:void ; Count:LongWord):Integer;
begin
{*
 0041FF74    push        ebx
 0041FF75    push        esi
 0041FF76    push        edi
 0041FF77    push        ecx
 0041FF78    mov         edi,ecx
 0041FF7A    mov         esi,edx
 0041FF7C    mov         ebx,eax
 0041FF7E    push        0
 0041FF80    lea         eax,[esp+4]
 0041FF84    push        eax
 0041FF85    push        edi
 0041FF86    push        esi
 0041FF87    push        ebx
 0041FF88    call        kernel32.WriteFile
 0041FF8D    test        eax,eax
>0041FF8F    jne         0041FF98
 0041FF91    mov         dword ptr [esp],0FFFFFFFF
 0041FF98    mov         eax,dword ptr [esp]
 0041FF9B    pop         edx
 0041FF9C    pop         edi
 0041FF9D    pop         esi
 0041FF9E    pop         ebx
 0041FF9F    ret
*}
end;

//0041FFA0
function FileSeek(Handle:Integer; Origin:Integer; const Offset:Int64):Int64;
begin
{*
 0041FFA0    push        ebp
 0041FFA1    mov         ebp,esp
 0041FFA3    add         esp,0FFFFFFF8
 0041FFA6    push        ebx
 0041FFA7    push        esi
 0041FFA8    mov         esi,edx
 0041FFAA    mov         ebx,eax
 0041FFAC    mov         eax,dword ptr [ebp+8]
 0041FFAF    mov         dword ptr [ebp-8],eax
 0041FFB2    mov         eax,dword ptr [ebp+0C]
 0041FFB5    mov         dword ptr [ebp-4],eax
 0041FFB8    push        esi
 0041FFB9    lea         eax,[ebp-4]
 0041FFBC    push        eax
 0041FFBD    mov         eax,dword ptr [ebp-8]
 0041FFC0    push        eax
 0041FFC1    push        ebx
 0041FFC2    call        kernel32.SetFilePointer
 0041FFC7    mov         dword ptr [ebp-8],eax
 0041FFCA    cmp         dword ptr [ebp-8],0FFFFFFFF
>0041FFCE    jne         0041FFE0
 0041FFD0    call        kernel32.GetLastError
 0041FFD5    test        eax,eax
>0041FFD7    je          0041FFE0
 0041FFD9    mov         dword ptr [ebp-4],0FFFFFFFF
 0041FFE0    mov         eax,dword ptr [ebp-8]
 0041FFE3    mov         edx,dword ptr [ebp-4]
 0041FFE6    pop         esi
 0041FFE7    pop         ebx
 0041FFE8    pop         ecx
 0041FFE9    pop         ecx
 0041FFEA    pop         ebp
 0041FFEB    ret         8
*}
end;

//0041FFF0
function ExistsLockedOrShared(const Filename:UnicodeString):Boolean;
begin
{*
 0041FFF0    push        ebp
 0041FFF1    mov         ebp,esp
 0041FFF3    add         esp,0FFFFFDB0
 0041FFF9    push        ebx
 0041FFFA    mov         ebx,eax
 0041FFFC    lea         eax,[ebp-250]
 00420002    push        eax
 00420003    mov         eax,ebx
 00420005    call        @UStrToPWChar
 0042000A    push        eax
 0042000B    call        kernel32.FindFirstFileW
 00420010    cmp         eax,0FFFFFFFF
>00420013    je          00420027
 00420015    push        eax
 00420016    call        kernel32.FindClose
 0042001B    test        byte ptr [ebp-250],10
 00420022    sete        al
>00420025    jmp         00420029
 00420027    xor         eax,eax
 00420029    pop         ebx
 0042002A    mov         esp,ebp
 0042002C    pop         ebp
 0042002D    ret
*}
end;

//00420030
function FileExists(const FileName:UnicodeString; FollowLink:Boolean):Boolean;
begin
{*
 00420030    push        ebx
 00420031    push        esi
 00420032    push        edi
 00420033    mov         ebx,edx
 00420035    mov         esi,eax
 00420037    mov         eax,esi
 00420039    call        @UStrToPWChar
 0042003E    mov         edi,eax
 00420040    push        edi
 00420041    call        kernel32.GetFileAttributesW
 00420046    cmp         eax,0FFFFFFFF
>00420049    je          0042009A
 0042004B    test        ah,4
>0042004E    je          00420093
 00420050    test        bl,bl
>00420052    jne         00420058
 00420054    mov         al,1
>00420056    jmp         004200C1
 00420058    test        al,10
>0042005A    je          00420060
 0042005C    xor         eax,eax
>0042005E    jmp         004200C1
 00420060    push        0
 00420062    push        0
 00420064    push        3
 00420066    push        0
 00420068    push        1
 0042006A    push        80000000
 0042006F    push        edi
 00420070    call        kernel32.CreateFileW
 00420075    cmp         eax,0FFFFFFFF
>00420078    je          00420084
 0042007A    push        eax
 0042007B    call        kernel32.CloseHandle
 00420080    mov         al,1
>00420082    jmp         004200C1
 00420084    call        kernel32.GetLastError
 00420089    mov         ebx,eax
 0042008B    cmp         ebx,20
 0042008E    sete        al
>00420091    jmp         004200C1
 00420093    test        al,10
 00420095    sete        al
>00420098    jmp         004200C1
 0042009A    call        kernel32.GetLastError
 0042009F    mov         ebx,eax
 004200A1    cmp         ebx,2
>004200A4    je          004200BB
 004200A6    cmp         ebx,3
>004200A9    je          004200BB
 004200AB    cmp         ebx,7B
>004200AE    je          004200BB
 004200B0    mov         eax,esi
 004200B2    call        ExistsLockedOrShared
 004200B7    test        al,al
>004200B9    jne         004200BF
 004200BB    xor         eax,eax
>004200BD    jmp         004200C1
 004200BF    mov         al,1
 004200C1    pop         edi
 004200C2    pop         esi
 004200C3    pop         ebx
 004200C4    ret
*}
end;

//004200C8
function DirectoryExists(const Directory:UnicodeString; FollowLink:Boolean):Boolean;
begin
{*
 004200C8    push        ebx
 004200C9    push        esi
 004200CA    push        edi
 004200CB    push        ebp
 004200CC    push        ecx
 004200CD    mov         byte ptr [esp],dl
 004200D0    mov         edi,eax
 004200D2    xor         ebx,ebx
 004200D4    mov         eax,edi
 004200D6    call        @UStrToPWChar
 004200DB    mov         ebp,eax
 004200DD    push        ebp
 004200DE    call        kernel32.GetFileAttributesW
 004200E3    mov         esi,eax
 004200E5    cmp         esi,0FFFFFFFF
>004200E8    je          0042016F
 004200EE    test        esi,400
>004200F4    jne         00420104
 004200F6    test        esi,10
 004200FC    setne       bl
>004200FF    jmp         00420189
 00420104    cmp         byte ptr [esp],0
>00420108    je          00420138
 0042010A    push        0
 0042010C    push        2000000
 00420111    push        3
 00420113    push        0
 00420115    push        1
 00420117    push        80000000
 0042011C    push        ebp
 0042011D    call        kernel32.CreateFileW
 00420122    cmp         eax,0FFFFFFFF
>00420125    je          00420189
 00420127    push        eax
 00420128    call        kernel32.CloseHandle
 0042012D    test        esi,10
 00420133    setne       bl
>00420136    jmp         00420189
 00420138    test        esi,10
>0042013E    je          00420144
 00420140    mov         bl,1
>00420142    jmp         00420189
 00420144    push        0
 00420146    push        2000000
 0042014B    push        3
 0042014D    push        0
 0042014F    push        1
 00420151    push        80000000
 00420156    push        ebp
 00420157    call        kernel32.CreateFileW
 0042015C    cmp         eax,0FFFFFFFF
>0042015F    je          0042016B
 00420161    push        eax
 00420162    call        kernel32.CloseHandle
 00420167    xor         ebx,ebx
>00420169    jmp         00420189
 0042016B    mov         bl,1
>0042016D    jmp         00420189
 0042016F    call        kernel32.GetLastError
 00420174    cmp         eax,2
>00420177    je          00420183
 00420179    cmp         eax,3
>0042017C    je          00420183
 0042017E    cmp         eax,7B
>00420181    jne         00420187
 00420183    xor         ebx,ebx
>00420185    jmp         00420189
 00420187    mov         bl,1
 00420189    mov         eax,ebx
 0042018B    pop         edx
 0042018C    pop         ebp
 0042018D    pop         edi
 0042018E    pop         esi
 0042018F    pop         ebx
 00420190    ret
*}
end;

//00420194
function ForceDirectories(Dir:UnicodeString):Boolean;
begin
{*
 00420194    push        ebp
 00420195    mov         ebp,esp
 00420197    xor         ecx,ecx
 00420199    push        ecx
 0042019A    push        ecx
 0042019B    push        ecx
 0042019C    push        ecx
 0042019D    push        ebx
 0042019E    mov         dword ptr [ebp-4],eax
 004201A1    mov         eax,dword ptr [ebp-4]
 004201A4    call        @UStrAddRef
 004201A9    xor         eax,eax
 004201AB    push        ebp
 004201AC    push        42027F
 004201B1    push        dword ptr fs:[eax]
 004201B4    mov         dword ptr fs:[eax],esp
 004201B7    mov         bl,1
 004201B9    cmp         dword ptr [ebp-4],0
>004201BD    jne         004201E1
 004201BF    mov         ecx,dword ptr ds:[78DAE0];^SResString101:TResStringRec
 004201C5    mov         dl,1
 004201C7    mov         eax,[00419814];EInOutError
 004201CC    call        Exception.CreateRes
 004201D1    mov         edx,eax
 004201D3    mov         dword ptr [edx+18],3
 004201DA    mov         eax,edx
 004201DC    call        @RaiseExcept
 004201E1    lea         edx,[ebp-8]
 004201E4    mov         eax,dword ptr [ebp-4]
 004201E7    call        ExcludeTrailingPathDelimiter
 004201EC    mov         edx,dword ptr [ebp-8]
 004201EF    lea         eax,[ebp-4]
 004201F2    call        @UStrLAsg
 004201F7    mov         eax,dword ptr [ebp-4]
 004201FA    test        eax,eax
>004201FC    je          00420203
 004201FE    sub         eax,4
 00420201    mov         eax,dword ptr [eax]
 00420203    cmp         eax,3
>00420206    jge         0042020C
 00420208    mov         al,1
>0042020A    jmp         00420216
 0042020C    mov         dl,1
 0042020E    mov         eax,dword ptr [ebp-4]
 00420211    call        DirectoryExists
 00420216    test        al,al
>00420218    je          0042021E
 0042021A    mov         al,1
>0042021C    jmp         00420237
 0042021E    lea         edx,[ebp-0C]
 00420221    mov         eax,dword ptr [ebp-4]
 00420224    call        ExtractFilePath
 00420229    mov         eax,dword ptr [ebp-0C]
 0042022C    mov         edx,dword ptr [ebp-4]
 0042022F    call        @UStrEqual
 00420234    sete        al
 00420237    test        al,al
>00420239    jne         00420264
 0042023B    lea         edx,[ebp-10]
 0042023E    mov         eax,dword ptr [ebp-4]
 00420241    call        ExtractFilePath
 00420246    mov         eax,dword ptr [ebp-10]
 00420249    call        ForceDirectories
 0042024E    test        al,al
>00420250    je          0042025E
 00420252    mov         eax,dword ptr [ebp-4]
 00420255    call        CreateDir
 0042025A    test        al,al
>0042025C    jne         00420262
 0042025E    xor         ebx,ebx
>00420260    jmp         00420264
 00420262    mov         bl,1
 00420264    xor         eax,eax
 00420266    pop         edx
 00420267    pop         ecx
 00420268    pop         ecx
 00420269    mov         dword ptr fs:[eax],edx
 0042026C    push        420286
 00420271    lea         eax,[ebp-10]
 00420274    mov         edx,4
 00420279    call        @UStrArrayClr
 0042027E    ret
>0042027F    jmp         @HandleFinally
>00420284    jmp         00420271
 00420286    mov         eax,ebx
 00420288    pop         ebx
 00420289    mov         esp,ebp
 0042028B    pop         ebp
 0042028C    ret
*}
end;

//00420290
function FileIsReadOnly(const FileName:UnicodeString):Boolean;
begin
{*
 00420290    push        ebp
 00420291    mov         ebp,esp
 00420293    push        0
 00420295    push        0
 00420297    push        0
 00420299    push        ebx
 0042029A    push        esi
 0042029B    push        edi
 0042029C    mov         esi,eax
 0042029E    xor         eax,eax
 004202A0    push        ebp
 004202A1    push        42033B
 004202A6    push        dword ptr fs:[eax]
 004202A9    mov         dword ptr fs:[eax],esp
 004202AC    xor         ebx,ebx
 004202AE    mov         eax,esi
 004202B0    call        @UStrToPWChar
 004202B5    push        eax
 004202B6    call        kernel32.GetFileAttributesW
 004202BB    mov         edi,eax
 004202BD    cmp         edi,0FFFFFFFF
>004202C0    je          00420320
 004202C2    test        edi,400
>004202C8    je          00420317
 004202CA    lea         edx,[ebp-4]
 004202CD    mov         eax,esi
 004202CF    call        InternalGetFileNameFromSymLink
 004202D4    test        al,al
>004202D6    je          00420317
 004202D8    mov         eax,dword ptr [ebp-4]
 004202DB    call        IsRelativePath
 004202E0    test        al,al
>004202E2    je          00420307
 004202E4    lea         edx,[ebp-0C]
 004202E7    mov         eax,esi
 004202E9    call        ExtractFilePath
 004202EE    mov         eax,dword ptr [ebp-0C]
 004202F1    lea         edx,[ebp-8]
 004202F4    call        IncludeTrailingPathDelimiter
 004202F9    mov         edx,dword ptr [ebp-8]
 004202FC    lea         eax,[ebp-4]
 004202FF    mov         ecx,dword ptr [ebp-4]
 00420302    call        @UStrCat3
 00420307    mov         eax,dword ptr [ebp-4]
 0042030A    call        @UStrToPWChar
 0042030F    push        eax
 00420310    call        kernel32.GetFileAttributesW
 00420315    mov         edi,eax
 00420317    test        edi,1
 0042031D    setne       bl
 00420320    xor         eax,eax
 00420322    pop         edx
 00420323    pop         ecx
 00420324    pop         ecx
 00420325    mov         dword ptr fs:[eax],edx
 00420328    push        420342
 0042032D    lea         eax,[ebp-0C]
 00420330    mov         edx,3
 00420335    call        @UStrArrayClr
 0042033A    ret
>0042033B    jmp         @HandleFinally
>00420340    jmp         0042032D
 00420342    mov         eax,ebx
 00420344    pop         edi
 00420345    pop         esi
 00420346    pop         ebx
 00420347    mov         esp,ebp
 00420349    pop         ebp
 0042034A    ret
*}
end;

//0042034C
function AnsiLastChar(const S:UnicodeString):PWideChar;
begin
{*
 0042034C    push        ebx
 0042034D    mov         ebx,eax
 0042034F    test        ebx,ebx
>00420351    jne         00420357
 00420353    xor         eax,eax
 00420355    pop         ebx
 00420356    ret
 00420357    mov         eax,ebx
 00420359    test        eax,eax
>0042035B    je          00420362
 0042035D    sub         eax,4
 00420360    mov         eax,dword ptr [eax]
 00420362    mov         edx,eax
 00420364    lea         eax,[ebx+edx*2-2]
 00420368    dec         edx
>00420369    jle         0042038C
 0042036B    cmp         word ptr [eax],0DC00
>00420370    jb          0042038C
 00420372    cmp         word ptr [eax],0DFFF
>00420377    ja          0042038C
 00420379    cmp         word ptr [eax-2],0D800
>0042037F    jb          0042038C
 00420381    cmp         word ptr [eax-2],0DBFF
>00420387    ja          0042038C
 00420389    sub         eax,2
 0042038C    pop         ebx
 0042038D    ret
*}
end;

//00420390
function LastDelimiter(const Delimiters:UnicodeString; const S:UnicodeString):Integer;
begin
{*
 00420390    push        ebx
 00420391    push        esi
 00420392    push        edi
 00420393    push        ebp
 00420394    mov         esi,edx
 00420396    mov         edi,eax
 00420398    mov         eax,esi
 0042039A    test        eax,eax
>0042039C    je          004203A3
 0042039E    sub         eax,4
 004203A1    mov         eax,dword ptr [eax]
 004203A3    mov         ebx,eax
 004203A5    mov         eax,edi
 004203A7    call        @UStrToPWChar
 004203AC    mov         ebp,eax
 004203AE    test        ebx,ebx
>004203B0    jle         004203CE
 004203B2    movzx       edi,word ptr [esi+ebx*2-2]
 004203B7    test        di,di
>004203BA    je          004203C9
 004203BC    mov         edx,edi
 004203BE    mov         eax,ebp
 004203C0    call        StrScan
 004203C5    test        eax,eax
>004203C7    jne         004203CE
 004203C9    dec         ebx
 004203CA    test        ebx,ebx
>004203CC    jg          004203B2
 004203CE    mov         eax,ebx
 004203D0    pop         ebp
 004203D1    pop         edi
 004203D2    pop         esi
 004203D3    pop         ebx
 004203D4    ret
*}
end;

//004203D8
function FindDelimiter(const Delimiters:UnicodeString; const S:UnicodeString; StartIdx:Integer):Integer;
begin
{*
 004203D8    push        ebx
 004203D9    push        esi
 004203DA    push        edi
 004203DB    push        ebp
 004203DC    add         esp,0FFFFFFF8
 004203DF    mov         esi,ecx
 004203E1    mov         edi,edx
 004203E3    mov         dword ptr [esp],eax
 004203E6    xor         eax,eax
 004203E8    mov         dword ptr [esp+4],eax
 004203EC    mov         eax,edi
 004203EE    test        eax,eax
>004203F0    je          004203F7
 004203F2    sub         eax,4
 004203F5    mov         eax,dword ptr [eax]
 004203F7    mov         ebp,eax
 004203F9    xor         ebx,ebx
>004203FB    jmp         00420416
 004203FD    mov         ecx,esi
 004203FF    mov         edx,edi
 00420401    mov         eax,dword ptr [esp]
 00420404    call        IsDelimiter
 00420409    test        al,al
>0042040B    je          00420415
 0042040D    mov         dword ptr [esp+4],esi
 00420411    mov         bl,1
>00420413    jmp         00420416
 00420415    inc         esi
 00420416    test        bl,bl
>00420418    jne         0042041E
 0042041A    cmp         ebp,esi
>0042041C    jge         004203FD
 0042041E    mov         eax,dword ptr [esp+4]
 00420422    pop         ecx
 00420423    pop         edx
 00420424    pop         ebp
 00420425    pop         edi
 00420426    pop         esi
 00420427    pop         ebx
 00420428    ret
*}
end;

//0042042C
function ChangeFileExt(const FileName:UnicodeString; const Extension:UnicodeString):UnicodeString;
begin
{*
 0042042C    push        ebp
 0042042D    mov         ebp,esp
 0042042F    add         esp,0FFFFFFF8
 00420432    push        ebx
 00420433    push        esi
 00420434    push        edi
 00420435    xor         ebx,ebx
 00420437    mov         dword ptr [ebp-8],ebx
 0042043A    mov         dword ptr [ebp-4],ecx
 0042043D    mov         edi,edx
 0042043F    mov         esi,eax
 00420441    xor         eax,eax
 00420443    push        ebp
 00420444    push        4204A4
 00420449    push        dword ptr fs:[eax]
 0042044C    mov         dword ptr fs:[eax],esp
 0042044F    mov         edx,esi
 00420451    mov         eax,4204C0;'.\:'
 00420456    call        LastDelimiter
 0042045B    mov         ebx,eax
 0042045D    test        ebx,ebx
>0042045F    je          00420469
 00420461    cmp         word ptr [esi+ebx*2-2],2E
>00420467    je          0042046E
 00420469    mov         ebx,7FFFFFFF
 0042046E    lea         eax,[ebp-8]
 00420471    push        eax
 00420472    mov         ecx,ebx
 00420474    dec         ecx
 00420475    mov         edx,1
 0042047A    mov         eax,esi
 0042047C    call        @UStrCopy
 00420481    mov         edx,dword ptr [ebp-8]
 00420484    mov         eax,dword ptr [ebp-4]
 00420487    mov         ecx,edi
 00420489    call        @UStrCat3
 0042048E    xor         eax,eax
 00420490    pop         edx
 00420491    pop         ecx
 00420492    pop         ecx
 00420493    mov         dword ptr fs:[eax],edx
 00420496    push        4204AB
 0042049B    lea         eax,[ebp-8]
 0042049E    call        @UStrClr
 004204A3    ret
>004204A4    jmp         @HandleFinally
>004204A9    jmp         0042049B
 004204AB    pop         edi
 004204AC    pop         esi
 004204AD    pop         ebx
 004204AE    pop         ecx
 004204AF    pop         ecx
 004204B0    pop         ebp
 004204B1    ret
*}
end;

//004204C8
function ExtractFilePath(const FileName:UnicodeString):UnicodeString;
begin
{*
 004204C8    push        ebx
 004204C9    push        esi
 004204CA    push        edi
 004204CB    mov         edi,edx
 004204CD    mov         ebx,eax
 004204CF    mov         edx,ebx
 004204D1    mov         eax,4204FC;'\:'
 004204D6    call        LastDelimiter
 004204DB    mov         esi,eax
 004204DD    push        edi
 004204DE    mov         ecx,esi
 004204E0    mov         edx,1
 004204E5    mov         eax,ebx
 004204E7    call        @UStrCopy
 004204EC    pop         edi
 004204ED    pop         esi
 004204EE    pop         ebx
 004204EF    ret
*}
end;

//00420504
function ExtractFileDir(const FileName:UnicodeString):UnicodeString;
begin
{*
 00420504    push        ebx
 00420505    push        esi
 00420506    push        edi
 00420507    mov         edi,edx
 00420509    mov         esi,eax
 0042050B    mov         edx,esi
 0042050D    mov         eax,42055C;'\:'
 00420512    call        LastDelimiter
 00420517    mov         ebx,eax
 00420519    cmp         ebx,1
>0042051C    jle         0042053A
 0042051E    cmp         word ptr [esi+ebx*2-2],5C
>00420524    jne         0042053A
 00420526    mov         ecx,ebx
 00420528    dec         ecx
 00420529    mov         edx,esi
 0042052B    mov         eax,42055C;'\:'
 00420530    call        IsDelimiter
 00420535    test        al,al
>00420537    jne         0042053A
 00420539    dec         ebx
 0042053A    push        edi
 0042053B    mov         ecx,ebx
 0042053D    mov         edx,1
 00420542    mov         eax,esi
 00420544    call        @UStrCopy
 00420549    pop         edi
 0042054A    pop         esi
 0042054B    pop         ebx
 0042054C    ret
*}
end;

//00420564
function ExtractFileName(const FileName:UnicodeString):UnicodeString;
begin
{*
 00420564    push        ebx
 00420565    push        esi
 00420566    push        edi
 00420567    mov         edi,edx
 00420569    mov         ebx,eax
 0042056B    mov         edx,ebx
 0042056D    mov         eax,42059C;'\:'
 00420572    call        LastDelimiter
 00420577    mov         esi,eax
 00420579    push        edi
 0042057A    lea         edx,[esi+1]
 0042057D    mov         ecx,7FFFFFFF
 00420582    mov         eax,ebx
 00420584    call        @UStrCopy
 00420589    pop         edi
 0042058A    pop         esi
 0042058B    pop         ebx
 0042058C    ret
*}
end;

//004205A4
function ExtractFileExt(const FileName:UnicodeString):UnicodeString;
begin
{*
 004205A4    push        ebx
 004205A5    push        esi
 004205A6    push        edi
 004205A7    mov         edi,edx
 004205A9    mov         esi,eax
 004205AB    mov         edx,esi
 004205AD    mov         eax,4205F0;'.\:'
 004205B2    call        LastDelimiter
 004205B7    mov         ebx,eax
 004205B9    test        ebx,ebx
>004205BB    jle         004205D6
 004205BD    cmp         word ptr [esi+ebx*2-2],2E
>004205C3    jne         004205D6
 004205C5    push        edi
 004205C6    mov         ecx,7FFFFFFF
 004205CB    mov         edx,ebx
 004205CD    mov         eax,esi
 004205CF    call        @UStrCopy
>004205D4    jmp         004205DD
 004205D6    mov         eax,edi
 004205D8    call        @UStrClr
 004205DD    pop         edi
 004205DE    pop         esi
 004205DF    pop         ebx
 004205E0    ret
*}
end;

//004205F8
function ExpandFileName(const FileName:UnicodeString):UnicodeString;
begin
{*
 004205F8    push        ebx
 004205F9    push        esi
 004205FA    push        edi
 004205FB    push        ebp
 004205FC    add         esp,0FFFFFDF0
 00420602    mov         esi,edx
 00420604    mov         edi,eax
 00420606    push        esp
 00420607    lea         eax,[esp+8]
 0042060B    push        eax
 0042060C    push        104
 00420611    mov         eax,edi
 00420613    call        @UStrToPWChar
 00420618    mov         ebp,eax
 0042061A    push        ebp
 0042061B    call        kernel32.GetFullPathNameW
 00420620    mov         ebx,eax
 00420622    cmp         ebx,104
>00420628    jg          00420639
 0042062A    lea         edx,[esp+4]
 0042062E    mov         eax,esi
 00420630    mov         ecx,ebx
 00420632    call        @UStrFromPWCharLen
>00420637    jmp         0042067E
 00420639    test        ebx,ebx
>0042063B    jle         0042067E
 0042063D    mov         eax,esi
 0042063F    mov         edx,ebx
 00420641    call        @UStrSetLength
 00420646    push        esp
 00420647    mov         eax,dword ptr [esi]
 00420649    call        @UStrToPWChar
 0042064E    push        eax
 0042064F    push        ebx
 00420650    push        ebp
 00420651    call        kernel32.GetFullPathNameW
 00420656    mov         ebx,eax
 00420658    mov         eax,dword ptr [esi]
 0042065A    mov         dword ptr [esp+20C],eax
 00420661    mov         eax,dword ptr [esp+20C]
 00420668    test        eax,eax
>0042066A    je          00420671
 0042066C    sub         eax,4
 0042066F    mov         eax,dword ptr [eax]
 00420671    cmp         eax,ebx
>00420673    jle         0042067E
 00420675    mov         eax,esi
 00420677    mov         edx,ebx
 00420679    call        @UStrSetLength
 0042067E    add         esp,210
 00420684    pop         ebp
 00420685    pop         edi
 00420686    pop         esi
 00420687    pop         ebx
 00420688    ret
*}
end;

//0042068C
function IsRelativePath(const Path:UnicodeString):Boolean;
begin
{*
 0042068C    mov         edx,eax
 0042068E    test        edx,edx
>00420690    je          00420697
 00420692    sub         edx,4
 00420695    mov         edx,dword ptr [edx]
 00420697    test        edx,edx
>00420699    jle         004206AB
 0042069B    cmp         word ptr [eax],5C
>0042069F    je          004206AB
 004206A1    dec         edx
>004206A2    jle         004206AB
 004206A4    cmp         word ptr [eax+2],3A
>004206A9    jne         004206AE
 004206AB    xor         eax,eax
 004206AD    ret
 004206AE    mov         al,1
 004206B0    ret
*}
end;

//004206B4
function BackfillGetDiskFreeSpaceEx(Directory:PChar; var FreeAvailable:TLargeInteger; var TotalSpace:TLargeInteger; TotalFree:PLargeInteger):BOOL; stdcall;
begin
{*
 004206B4    push        ebp
 004206B5    mov         ebp,esp
 004206B7    add         esp,0FFFFFFE8
 004206BA    push        ebx
 004206BB    mov         eax,dword ptr [ebp+8]
 004206BE    test        eax,eax
>004206C0    jne         004206C4
 004206C2    xor         eax,eax
 004206C4    lea         edx,[ebp-10]
 004206C7    push        edx
 004206C8    lea         edx,[ebp-0C]
 004206CB    push        edx
 004206CC    lea         edx,[ebp-8]
 004206CF    push        edx
 004206D0    lea         edx,[ebp-4]
 004206D3    push        edx
 004206D4    push        eax
 004206D5    call        kernel32.GetDiskFreeSpaceW
 004206DA    mov         ebx,eax
 004206DC    mov         eax,dword ptr [ebp-4]
 004206DF    imul        dword ptr [ebp-8]
 004206E2    xor         edx,edx
 004206E4    mov         dword ptr [ebp-18],eax
 004206E7    mov         dword ptr [ebp-14],edx
 004206EA    mov         eax,dword ptr [ebp-0C]
 004206ED    xor         edx,edx
 004206EF    push        edx
 004206F0    push        eax
 004206F1    mov         eax,dword ptr [ebp-18]
 004206F4    mov         edx,dword ptr [ebp-14]
 004206F7    call        @_llmul
 004206FC    mov         ecx,dword ptr [ebp+0C]
 004206FF    mov         dword ptr [ecx],eax
 00420701    mov         dword ptr [ecx+4],edx
 00420704    mov         eax,dword ptr [ebp-10]
 00420707    xor         edx,edx
 00420709    push        edx
 0042070A    push        eax
 0042070B    mov         eax,dword ptr [ebp-18]
 0042070E    mov         edx,dword ptr [ebp-14]
 00420711    call        @_llmul
 00420716    mov         ecx,dword ptr [ebp+10]
 00420719    mov         dword ptr [ecx],eax
 0042071B    mov         dword ptr [ecx+4],edx
 0042071E    mov         eax,ebx
 00420720    pop         ebx
 00420721    mov         esp,ebp
 00420723    pop         ebp
 00420724    ret         10
*}
end;

//00420728
function CreateDir(const Dir:UnicodeString):Boolean;
begin
{*
 00420728    push        ebx
 00420729    mov         ebx,eax
 0042072B    push        0
 0042072D    mov         eax,ebx
 0042072F    call        @UStrToPWChar
 00420734    push        eax
 00420735    call        kernel32.CreateDirectoryW
 0042073A    cmp         eax,1
 0042073D    sbb         eax,eax
 0042073F    inc         eax
 00420740    pop         ebx
 00420741    ret
*}
end;

//00420744
function StrLen(const Str:PAnsiChar):Cardinal;
begin
{*
 00420744    cmp         byte ptr [eax],0
>00420747    je          0042076F
 00420749    mov         edx,eax
 0042074B    neg         edx
 0042074D    add         eax,1
 00420750    and         eax,0FFFFFFFE
 00420753    mov         cx,word ptr [eax]
 00420756    add         eax,2
 00420759    test        cl,ch
>0042075B    jne         00420753
 0042075D    test        cl,cl
>0042075F    je          0042076A
 00420761    test        ch,ch
>00420763    jne         00420753
 00420765    lea         eax,[edx+eax-1]
 00420769    ret
 0042076A    lea         eax,[edx+eax-2]
 0042076E    ret
 0042076F    xor         eax,eax
 00420771    ret
*}
end;

//00420774
function StrLen(const Str:PWideChar):Cardinal;
begin
{*
 00420774    cmp         word ptr [eax],0
>00420778    je          00420790
 0042077A    mov         edx,eax
 0042077C    neg         edx
 0042077E    mov         cx,word ptr [eax]
 00420781    add         eax,2
 00420784    test        cx,cx
>00420787    jne         0042077E
 00420789    lea         eax,[edx+eax-2]
 0042078D    shr         eax,1
 0042078F    ret
 00420790    xor         eax,eax
 00420792    ret
*}
end;

//00420794
function StrEnd(const Str:PWideChar):PWideChar;
begin
{*
 00420794    cmp         word ptr [eax],0
>00420798    je          004207AC
 0042079A    add         eax,2
 0042079D    mov         cx,word ptr [eax]
 004207A0    add         eax,2
 004207A3    test        cx,cx
>004207A6    jne         0042079D
 004207A8    sub         eax,2
 004207AB    ret
 004207AC    ret
*}
end;

//004207B0
function StrMove(Dest:PWideChar; const Source:PWideChar; Count:Cardinal):PWideChar;
begin
{*
 004207B0    push        esi
 004207B1    mov         esi,eax
 004207B3    add         ecx,ecx
 004207B5    xchg        eax,edx
 004207B6    call        Move
 004207BB    mov         eax,esi
 004207BD    pop         esi
 004207BE    ret
*}
end;

//004207C0
function StrCopy(Dest:PWideChar; const Source:PWideChar):PWideChar;
begin
{*
 004207C0    sub         edx,eax
 004207C2    test        eax,3
 004207C7    push        eax
>004207C8    je          004207D8
 004207CA    movzx       ecx,word ptr [edx+eax]
 004207CE    mov         word ptr [eax],cx
 004207D1    test        ecx,ecx
>004207D3    je          004207F0
 004207D5    add         eax,2
 004207D8    movzx       ecx,word ptr [edx+eax]
 004207DC    test        ecx,ecx
>004207DE    je          004207F2
 004207E0    mov         ecx,dword ptr [edx+eax]
 004207E3    mov         dword ptr [eax],ecx
 004207E5    add         eax,4
 004207E8    cmp         ecx,0FFFF
>004207EE    ja          004207D8
 004207F0    pop         eax
 004207F1    ret
 004207F2    mov         word ptr [eax],cx
 004207F5    pop         eax
 004207F6    ret
*}
end;

//004207F8
function StrLCopy(Dest:PWideChar; const Source:PWideChar; MaxLen:Cardinal):PWideChar;
begin
{*
 004207F8    push        ebx
 004207F9    push        esi
 004207FA    push        edi
 004207FB    push        ebp
 004207FC    push        ecx
 004207FD    mov         ebp,ecx
 004207FF    mov         edi,edx
 00420801    mov         esi,eax
 00420803    mov         dword ptr [esp],esi
 00420806    mov         eax,edi
 00420808    call        StrLen
 0042080D    mov         ebx,eax
 0042080F    cmp         ebp,ebx
>00420811    jae         00420815
 00420813    mov         ebx,ebp
 00420815    mov         ecx,ebx
 00420817    add         ecx,ecx
 00420819    mov         edx,esi
 0042081B    mov         eax,edi
 0042081D    call        Move
 00420822    mov         word ptr [esi+ebx*2],0
 00420828    mov         eax,dword ptr [esp]
 0042082B    pop         edx
 0042082C    pop         ebp
 0042082D    pop         edi
 0042082E    pop         esi
 0042082F    pop         ebx
 00420830    ret
*}
end;

//00420834
function StrPCopy(Dest:PWideChar; const Source:UnicodeString):PWideChar;
begin
{*
 00420834    push        ebx
 00420835    push        esi
 00420836    push        edi
 00420837    mov         esi,edx
 00420839    mov         edi,eax
 0042083B    mov         ebx,esi
 0042083D    test        ebx,ebx
>0042083F    je          00420846
 00420841    sub         ebx,4
 00420844    mov         ebx,dword ptr [ebx]
 00420846    mov         eax,esi
 00420848    call        @UStrToPWChar
 0042084D    mov         edx,eax
 0042084F    mov         ecx,ebx
 00420851    mov         eax,edi
 00420853    call        StrLCopy
 00420858    pop         edi
 00420859    pop         esi
 0042085A    pop         ebx
 0042085B    ret
*}
end;

//0042085C
function StrPLCopy(Dest:PWideChar; const Source:UnicodeString; MaxLen:Cardinal):PWideChar;
begin
{*
 0042085C    push        ebx
 0042085D    push        esi
 0042085E    push        edi
 0042085F    mov         edi,ecx
 00420861    mov         esi,edx
 00420863    mov         ebx,eax
 00420865    mov         eax,esi
 00420867    call        @UStrToPWChar
 0042086C    mov         edx,eax
 0042086E    mov         ecx,edi
 00420870    mov         eax,ebx
 00420872    call        StrLCopy
 00420877    pop         edi
 00420878    pop         esi
 00420879    pop         ebx
 0042087A    ret
*}
end;

//0042087C
function StrCat(Dest:PWideChar; const Source:PWideChar):PWideChar;
begin
{*
 0042087C    push        ebx
 0042087D    push        esi
 0042087E    mov         esi,edx
 00420880    mov         ebx,eax
 00420882    mov         eax,ebx
 00420884    call        StrEnd
 00420889    mov         edx,esi
 0042088B    call        StrCopy
 00420890    mov         eax,ebx
 00420892    pop         esi
 00420893    pop         ebx
 00420894    ret
*}
end;

//00420898
function StrComp(const Str1:PAnsiChar; const Str2:PAnsiChar):Integer;
begin
{*
 00420898    sub         edx,eax
>0042089A    jne         0042089F
 0042089C    xor         eax,eax
 0042089E    ret
 0042089F    movzx       ecx,byte ptr [edx+eax]
 004208A3    cmp         cl,byte ptr [eax]
>004208A5    jne         0042091D
 004208A7    test        cl,cl
>004208A9    je          0042091D
 004208AB    movzx       ecx,byte ptr [edx+eax+1]
 004208B0    cmp         cl,byte ptr [eax+1]
>004208B3    jne         0042091A
 004208B5    test        cl,cl
>004208B7    je          0042091A
 004208B9    movzx       ecx,byte ptr [edx+eax+2]
 004208BE    cmp         cl,byte ptr [eax+2]
>004208C1    jne         00420917
 004208C3    test        cl,cl
>004208C5    je          00420917
 004208C7    movzx       ecx,byte ptr [edx+eax+3]
 004208CC    cmp         cl,byte ptr [eax+3]
>004208CF    jne         00420914
 004208D1    add         eax,4
 004208D4    test        cl,cl
>004208D6    je          00420911
 004208D8    movzx       ecx,byte ptr [edx+eax]
 004208DC    cmp         cl,byte ptr [eax]
>004208DE    jne         0042091D
 004208E0    test        cl,cl
>004208E2    je          0042091D
 004208E4    movzx       ecx,byte ptr [edx+eax+1]
 004208E9    cmp         cl,byte ptr [eax+1]
>004208EC    jne         0042091A
 004208EE    test        cl,cl
>004208F0    je          0042091A
 004208F2    movzx       ecx,byte ptr [edx+eax+2]
 004208F7    cmp         cl,byte ptr [eax+2]
>004208FA    jne         00420917
 004208FC    test        cl,cl
>004208FE    je          00420917
 00420900    movzx       ecx,byte ptr [edx+eax+3]
 00420905    cmp         cl,byte ptr [eax+3]
>00420908    jne         00420914
 0042090A    add         eax,4
 0042090D    test        cl,cl
>0042090F    jne         0042089F
 00420911    sub         eax,4
 00420914    add         eax,1
 00420917    add         eax,1
 0042091A    add         eax,1
 0042091D    movzx       eax,byte ptr [eax]
 00420920    sub         eax,ecx
 00420922    ret
*}
end;

//00420924
function StrComp(const Str1:PWideChar; const Str2:PWideChar):Integer;
begin
{*
 00420924    push        esi
 00420925    push        edi
 00420926    mov         ecx,eax
 00420928    mov         esi,edx
 0042092A    movzx       eax,word ptr [ecx]
 0042092D    movzx       edx,word ptr [esi]
 00420930    cmp         dx,ax
>00420933    jne         0042093A
 00420935    test        ax,ax
>00420938    jne         00420944
 0042093A    movzx       edi,ax
 0042093D    movzx       eax,dx
 00420940    sub         edi,eax
>00420942    jmp         0042094C
 00420944    add         ecx,2
 00420947    add         esi,2
>0042094A    jmp         0042092A
 0042094C    mov         eax,edi
 0042094E    pop         edi
 0042094F    pop         esi
 00420950    ret
*}
end;

//00420954
function StrIComp(const Str1:PWideChar; const Str2:PWideChar):Integer;
begin
{*
 00420954    push        ebx
 00420955    push        esi
 00420956    push        edi
 00420957    mov         ecx,eax
 00420959    mov         esi,edx
 0042095B    movzx       eax,word ptr [ecx]
 0042095E    movzx       edx,word ptr [esi]
 00420961    mov         ebx,eax
 00420963    add         ebx,0FFFFFF9F
 00420966    sub         bx,1A
>0042096A    jae         00420970
 0042096C    xor         ax,20
 00420970    mov         ebx,edx
 00420972    add         ebx,0FFFFFF9F
 00420975    sub         bx,1A
>00420979    jae         0042097F
 0042097B    xor         dx,20
 0042097F    cmp         dx,ax
>00420982    jne         00420989
 00420984    test        ax,ax
>00420987    jne         00420993
 00420989    movzx       edi,ax
 0042098C    movzx       eax,dx
 0042098F    sub         edi,eax
>00420991    jmp         0042099B
 00420993    add         ecx,2
 00420996    add         esi,2
>00420999    jmp         0042095B
 0042099B    mov         eax,edi
 0042099D    pop         edi
 0042099E    pop         esi
 0042099F    pop         ebx
 004209A0    ret
*}
end;

//004209A4
function StrLComp(const Str1:PWideChar; const Str2:PWideChar; MaxLen:Cardinal):Integer;
begin
{*
 004209A4    push        esi
 004209A5    push        edi
 004209A6    add         esp,0FFFFFFF8
 004209A9    mov         dword ptr [esp],ecx
 004209AC    mov         esi,eax
 004209AE    mov         edi,edx
 004209B0    xor         ecx,ecx
 004209B2    cmp         ecx,dword ptr [esp]
>004209B5    jae         004209E1
 004209B7    movzx       eax,word ptr [esi]
 004209BA    movzx       edx,word ptr [edi]
 004209BD    cmp         dx,ax
>004209C0    jne         004209C7
 004209C2    test        ax,ax
>004209C5    jne         004209D5
 004209C7    movzx       eax,ax
 004209CA    movzx       edx,dx
 004209CD    sub         eax,edx
 004209CF    mov         dword ptr [esp+4],eax
>004209D3    jmp         004209E7
 004209D5    add         esi,2
 004209D8    add         edi,2
 004209DB    inc         ecx
 004209DC    cmp         ecx,dword ptr [esp]
>004209DF    jb          004209B7
 004209E1    xor         eax,eax
 004209E3    mov         dword ptr [esp+4],eax
 004209E7    mov         eax,dword ptr [esp+4]
 004209EB    pop         ecx
 004209EC    pop         edx
 004209ED    pop         edi
 004209EE    pop         esi
 004209EF    ret
*}
end;

//004209F0
function StrLIComp(const Str1:PWideChar; const Str2:PWideChar; MaxLen:Cardinal):Integer;
begin
{*
 004209F0    push        ebx
 004209F1    push        esi
 004209F2    push        edi
 004209F3    add         esp,0FFFFFFF8
 004209F6    mov         dword ptr [esp],ecx
 004209F9    mov         esi,eax
 004209FB    mov         edi,edx
 004209FD    xor         ecx,ecx
 004209FF    cmp         ecx,dword ptr [esp]
>00420A02    jae         00420A4C
 00420A04    movzx       eax,word ptr [esi]
 00420A07    movzx       edx,word ptr [edi]
 00420A0A    mov         ebx,eax
 00420A0C    add         ebx,0FFFFFF9F
 00420A0F    sub         bx,1A
>00420A13    jae         00420A19
 00420A15    xor         ax,20
 00420A19    mov         ebx,edx
 00420A1B    add         ebx,0FFFFFF9F
 00420A1E    sub         bx,1A
>00420A22    jae         00420A28
 00420A24    xor         dx,20
 00420A28    cmp         dx,ax
>00420A2B    jne         00420A32
 00420A2D    test        ax,ax
>00420A30    jne         00420A40
 00420A32    movzx       eax,ax
 00420A35    movzx       edx,dx
 00420A38    sub         eax,edx
 00420A3A    mov         dword ptr [esp+4],eax
>00420A3E    jmp         00420A52
 00420A40    add         esi,2
 00420A43    add         edi,2
 00420A46    inc         ecx
 00420A47    cmp         ecx,dword ptr [esp]
>00420A4A    jb          00420A04
 00420A4C    xor         eax,eax
 00420A4E    mov         dword ptr [esp+4],eax
 00420A52    mov         eax,dword ptr [esp+4]
 00420A56    pop         ecx
 00420A57    pop         edx
 00420A58    pop         edi
 00420A59    pop         esi
 00420A5A    pop         ebx
 00420A5B    ret
*}
end;

//00420A5C
function StrScan(const Str:PWideChar; Chr:WideChar):PWideChar;
begin
{*
>00420A5C    jmp         00420A66
 00420A5E    cmp         dx,cx
>00420A61    je          00420A75
 00420A63    add         eax,2
 00420A66    movzx       ecx,word ptr [eax]
 00420A69    test        cx,cx
>00420A6C    jne         00420A5E
 00420A6E    test        dx,dx
>00420A71    je          00420A75
 00420A73    xor         eax,eax
 00420A75    ret
*}
end;

//00420A78
function StrRScan(const Str:PWideChar; Chr:WideChar):PWideChar;
begin
{*
 00420A78    push        esi
 00420A79    test        dx,dx
>00420A7C    jne         00420A87
 00420A7E    call        StrEnd
 00420A83    mov         esi,eax
>00420A85    jmp         00420AA2
 00420A87    xor         esi,esi
>00420A89    jmp         00420A93
 00420A8B    test        cx,cx
>00420A8E    je          00420AA2
 00420A90    add         eax,2
 00420A93    movzx       ecx,word ptr [eax]
 00420A96    cmp         dx,cx
>00420A99    jne         00420A8B
 00420A9B    mov         esi,eax
 00420A9D    add         eax,2
>00420AA0    jmp         00420A93
 00420AA2    mov         eax,esi
 00420AA4    pop         esi
 00420AA5    ret
*}
end;

//00420AA8
function StrPos(const Str1:PWideChar; const Str2:PWideChar):PWideChar;
begin
{*
 00420AA8    push        edi
 00420AA9    push        esi
 00420AAA    push        ebx
 00420AAB    or          eax,eax
>00420AAD    je          00420AF9
 00420AAF    or          edx,edx
>00420AB1    je          00420AF9
 00420AB3    mov         ebx,eax
 00420AB5    mov         edi,edx
 00420AB7    xor         ax,ax
 00420ABA    mov         ecx,0FFFFFFFF
 00420ABF    repne scas  word ptr [edi]
 00420AC2    not         ecx
 00420AC4    dec         ecx
>00420AC5    je          00420AF9
 00420AC7    mov         esi,ecx
 00420AC9    mov         edi,ebx
 00420ACB    mov         ecx,0FFFFFFFF
 00420AD0    repne scas  word ptr [edi]
 00420AD3    not         ecx
 00420AD5    sub         ecx,esi
>00420AD7    jbe         00420AF9
 00420AD9    mov         edi,ebx
 00420ADB    lea         ebx,[esi-1]
 00420ADE    mov         esi,edx
 00420AE0    lods        word ptr [esi]
 00420AE2    repne scas  word ptr [edi]
>00420AE5    jne         00420AF9
 00420AE7    mov         eax,ecx
 00420AE9    push        edi
 00420AEA    mov         ecx,ebx
 00420AEC    repe cmps   word ptr [esi],word ptr [edi]
 00420AEF    pop         edi
 00420AF0    mov         ecx,eax
>00420AF2    jne         00420ADE
 00420AF4    lea         eax,[edi-2]
>00420AF7    jmp         00420AFB
 00420AF9    xor         eax,eax
 00420AFB    pop         ebx
 00420AFC    pop         esi
 00420AFD    pop         edi
 00420AFE    ret
*}
end;

//00420B00
function StrPosLen(const Str1:PWideChar; const Str2:PWideChar; Len1:Integer; Len2:Integer):PWideChar;
begin
{*
 00420B00    push        ebp
 00420B01    mov         ebp,esp
 00420B03    add         esp,0FFFFFFF8
 00420B06    push        ebx
 00420B07    push        esi
 00420B08    push        edi
 00420B09    mov         dword ptr [ebp-4],edx
 00420B0C    mov         esi,eax
 00420B0E    xor         eax,eax
 00420B10    mov         dword ptr [ebp-8],eax
 00420B13    test        ecx,ecx
>00420B15    je          00420B54
 00420B17    cmp         dword ptr [ebp+8],0
>00420B1B    je          00420B54
 00420B1D    mov         edi,ecx
 00420B1F    sub         edi,dword ptr [ebp+8]
 00420B22    test        edi,edi
>00420B24    jl          00420B54
 00420B26    inc         edi
 00420B27    xor         ebx,ebx
 00420B29    cmp         word ptr [esi+ebx*2],0
>00420B2E    je          00420B50
 00420B30    mov         eax,ebx
 00420B32    add         eax,eax
 00420B34    add         eax,esi
 00420B36    mov         ecx,dword ptr [ebp+8]
 00420B39    mov         edx,dword ptr [ebp-4]
 00420B3C    call        StrLComp
 00420B41    test        eax,eax
>00420B43    jne         00420B50
 00420B45    mov         eax,ebx
 00420B47    add         eax,eax
 00420B49    add         eax,esi
 00420B4B    mov         dword ptr [ebp-8],eax
>00420B4E    jmp         00420B54
 00420B50    inc         ebx
 00420B51    dec         edi
>00420B52    jne         00420B29
 00420B54    mov         eax,dword ptr [ebp-8]
 00420B57    pop         edi
 00420B58    pop         esi
 00420B59    pop         ebx
 00420B5A    pop         ecx
 00420B5B    pop         ecx
 00420B5C    pop         ebp
 00420B5D    ret         4
*}
end;

//00420B60
function StrPas(const Str:PWideChar):UnicodeString;
begin
{*
 00420B60    push        ebx
 00420B61    push        esi
 00420B62    mov         esi,edx
 00420B64    mov         ebx,eax
 00420B66    mov         eax,esi
 00420B68    mov         edx,ebx
 00420B6A    call        @UStrFromPWChar
 00420B6F    pop         esi
 00420B70    pop         ebx
 00420B71    ret
*}
end;

//00420B74
function WideStrAlloc(Size:Cardinal):PWideChar;
begin
{*
 00420B74    push        ebx
 00420B75    mov         ebx,eax
 00420B77    add         ebx,ebx
 00420B79    add         ebx,4
 00420B7C    mov         eax,ebx
 00420B7E    call        @GetMem
 00420B83    mov         dword ptr [eax],ebx
 00420B85    add         eax,4
 00420B88    pop         ebx
 00420B89    ret
*}
end;

//00420B8C
function StrAlloc(Size:Cardinal):PChar;
begin
{*
 00420B8C    call        WideStrAlloc
 00420B91    ret
*}
end;

//00420B94
function StrBufSize(const Str:PWideChar):Cardinal;
begin
{*
 00420B94    sub         eax,4
 00420B97    mov         eax,dword ptr [eax]
 00420B99    sub         eax,4
 00420B9C    shr         eax,1
 00420B9E    ret
*}
end;

//00420BA0
function StrNew(const Str:PWideChar):PWideChar;
begin
{*
 00420BA0    push        ebx
 00420BA1    push        esi
 00420BA2    mov         ebx,eax
 00420BA4    test        ebx,ebx
>00420BA6    jne         00420BAD
 00420BA8    xor         eax,eax
 00420BAA    pop         esi
 00420BAB    pop         ebx
 00420BAC    ret
 00420BAD    mov         eax,ebx
 00420BAF    call        StrLen
 00420BB4    mov         esi,eax
 00420BB6    inc         esi
 00420BB7    mov         eax,esi
 00420BB9    call        WideStrAlloc
 00420BBE    mov         ecx,esi
 00420BC0    mov         edx,ebx
 00420BC2    call        StrMove
 00420BC7    pop         esi
 00420BC8    pop         ebx
 00420BC9    ret
*}
end;

//00420BCC
procedure StrDispose(Str:PWideChar);
begin
{*
 00420BCC    test        eax,eax
>00420BCE    je          00420BDA
 00420BD0    sub         eax,4
 00420BD3    mov         edx,dword ptr [eax]
 00420BD5    call        @FreeMem
 00420BDA    ret
*}
end;

//00420BDC
procedure FormatError(ErrorCode:Integer; Format:PChar; FmtLen:Cardinal);
begin
{*
 00420BDC    push        ebx
 00420BDD    push        esi
 00420BDE    add         esp,0FFFFFFB8
 00420BE1    mov         ebx,ecx
 00420BE3    mov         esi,eax
 00420BE5    cmp         ebx,1F
>00420BE8    jbe         00420BEF
 00420BEA    mov         ebx,1F
 00420BEF    mov         eax,esp
 00420BF1    mov         ecx,ebx
 00420BF3    call        StrMove
 00420BF8    mov         word ptr [esp+ebx*2],0
 00420BFE    mov         eax,esp
 00420C00    mov         dword ptr [esp+40],eax
 00420C04    mov         byte ptr [esp+44],0A
 00420C09    lea         edx,[esp+40]
 00420C0D    mov         eax,dword ptr [esi*4+784D30];^SResString28:TResStringRec
 00420C14    xor         ecx,ecx
 00420C16    call        ConvertErrorFmt
 00420C1B    add         esp,48
 00420C1E    pop         esi
 00420C1F    pop         ebx
 00420C20    ret
*}
end;

//00420C24
function FormatBuf(var Buffer:UnicodeString; BufLen:Cardinal; const Format:void ; FmtLen:Cardinal; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):Cardinal;
begin
{*
 00420C24    push        ebp
 00420C25    mov         ebp,esp
 00420C27    push        ebx
 00420C28    mov         ebx,dword ptr [ebp+10]
 00420C2B    push        ebx
 00420C2C    mov         ebx,dword ptr [ebp+0C]
 00420C2F    push        ebx
 00420C30    mov         ebx,dword ptr [ebp+8]
 00420C33    push        ebx
 00420C34    push        790CDC;gvar_00790CDC:TFormatSettings
 00420C39    call        FormatBuf
 00420C3E    pop         ebx
 00420C3F    pop         ebp
 00420C40    ret         0C
*}
end;

//00420C44
function FormatBuf(Buffer:PWideChar; BufLen:Cardinal; const Format:void ; FmtLen:Cardinal; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; const AFormatSettings:TFormatSettings):Cardinal;
begin
{*
 00420C44    push        ebp
 00420C45    mov         ebp,esp
 00420C47    push        ebx
 00420C48    mov         ebx,dword ptr [ebp+14]
 00420C4B    push        ebx
 00420C4C    mov         ebx,dword ptr [ebp+10]
 00420C4F    push        ebx
 00420C50    mov         ebx,dword ptr [ebp+0C]
 00420C53    push        ebx
 00420C54    mov         ebx,dword ptr [ebp+8]
 00420C57    push        ebx
 00420C58    call        WideFormatBuf
 00420C5D    pop         ebx
 00420C5E    pop         ebp
 00420C5F    ret         10
*}
end;

//00420C64
function StrFmt(Buffer:PWideChar; Format:PWideChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):PWideChar;
begin
{*
 00420C64    push        ebp
 00420C65    mov         ebp,esp
 00420C67    push        ebx
 00420C68    mov         ebx,dword ptr [ebp+8]
 00420C6B    push        ebx
 00420C6C    push        790CDC;gvar_00790CDC:TFormatSettings
 00420C71    call        StrFmt
 00420C76    pop         ebx
 00420C77    pop         ebp
 00420C78    ret         4
*}
end;

//00420C7C
function StrFmt(Buffer:PWideChar; Format:PWideChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; const AFormatSettings:TFormatSettings):PWideChar;
begin
{*
 00420C7C    push        ebp
 00420C7D    mov         ebp,esp
 00420C7F    push        ebx
 00420C80    push        esi
 00420C81    push        edi
 00420C82    mov         edi,ecx
 00420C84    mov         esi,edx
 00420C86    mov         ebx,eax
 00420C88    test        ebx,ebx
>00420C8A    je          00420CB9
 00420C8C    test        esi,esi
>00420C8E    je          00420CB9
 00420C90    mov         eax,esi
 00420C92    call        StrLen
 00420C97    push        eax
 00420C98    push        edi
 00420C99    mov         eax,dword ptr [ebp+0C]
 00420C9C    push        eax
 00420C9D    mov         eax,dword ptr [ebp+8]
 00420CA0    push        eax
 00420CA1    mov         ecx,esi
 00420CA3    mov         eax,ebx
 00420CA5    mov         edx,7FFFFFFF
 00420CAA    call        WideFormatBuf
 00420CAF    mov         word ptr [ebx+eax*2],0
 00420CB5    mov         eax,ebx
>00420CB7    jmp         00420CBB
 00420CB9    xor         eax,eax
 00420CBB    pop         edi
 00420CBC    pop         esi
 00420CBD    pop         ebx
 00420CBE    pop         ebp
 00420CBF    ret         8
*}
end;

//00420CC4
function StrLFmt(Buffer:PAnsiChar; MaxBufLen:Cardinal; Format:PAnsiChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):PAnsiChar;
begin
{*
 00420CC4    push        ebp
 00420CC5    mov         ebp,esp
 00420CC7    push        ebx
 00420CC8    mov         ebx,dword ptr [ebp+0C]
 00420CCB    push        ebx
 00420CCC    mov         ebx,dword ptr [ebp+8]
 00420CCF    push        ebx
 00420CD0    push        790CDC;gvar_00790CDC:TFormatSettings
 00420CD5    call        StrLFmt
 00420CDA    pop         ebx
 00420CDB    pop         ebp
 00420CDC    ret         8
*}
end;

//00420CE0
function StrLFmt(Buffer:PWideChar; MaxBufLen:Cardinal; Format:PWideChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; const AFormatSettings:TFormatSettings):PWideChar;
begin
{*
 00420CE0    push        ebp
 00420CE1    mov         ebp,esp
 00420CE3    push        ebx
 00420CE4    push        esi
 00420CE5    push        edi
 00420CE6    mov         esi,ecx
 00420CE8    mov         edi,edx
 00420CEA    mov         ebx,eax
 00420CEC    test        ebx,ebx
>00420CEE    je          00420D1D
 00420CF0    test        esi,esi
>00420CF2    je          00420D1D
 00420CF4    mov         eax,esi
 00420CF6    call        StrLen
 00420CFB    push        eax
 00420CFC    mov         eax,dword ptr [ebp+10]
 00420CFF    push        eax
 00420D00    mov         eax,dword ptr [ebp+0C]
 00420D03    push        eax
 00420D04    mov         eax,dword ptr [ebp+8]
 00420D07    push        eax
 00420D08    mov         ecx,esi
 00420D0A    mov         eax,ebx
 00420D0C    mov         edx,edi
 00420D0E    call        WideFormatBuf
 00420D13    mov         word ptr [ebx+eax*2],0
 00420D19    mov         eax,ebx
>00420D1B    jmp         00420D1F
 00420D1D    xor         eax,eax
 00420D1F    pop         edi
 00420D20    pop         esi
 00420D21    pop         ebx
 00420D22    pop         ebp
 00420D23    ret         0C
*}
end;

//00420D28
function Format(const Format:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):UnicodeString;
begin
{*
 00420D28    push        ebp
 00420D29    mov         ebp,esp
 00420D2B    push        ebx
 00420D2C    push        esi
 00420D2D    push        edi
 00420D2E    mov         edi,ecx
 00420D30    mov         esi,edx
 00420D32    mov         ebx,eax
 00420D34    push        790CDC;gvar_00790CDC:TFormatSettings
 00420D39    mov         eax,dword ptr [ebp+8]
 00420D3C    push        eax
 00420D3D    mov         edx,esi
 00420D3F    mov         ecx,edi
 00420D41    mov         eax,ebx
 00420D43    call        Format
 00420D48    pop         edi
 00420D49    pop         esi
 00420D4A    pop         ebx
 00420D4B    pop         ebp
 00420D4C    ret         4
*}
end;

//00420D50
function Format(const Format:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; const AFormatSettings:TFormatSettings):UnicodeString;
begin
{*
 00420D50    push        ebp
 00420D51    mov         ebp,esp
 00420D53    push        ecx
 00420D54    mov         ecx,dword ptr [ebp+0C]
 00420D57    push        ecx
 00420D58    mov         ecx,dword ptr [ebp+8]
 00420D5B    xchg        eax,ecx
 00420D5C    xchg        edx,ecx
 00420D5E    call        FmtStr
 00420D63    pop         ebp
 00420D64    ret         8
*}
end;

//00420D68
procedure FmtStr(var Result:UnicodeString; const Format:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);
begin
{*
 00420D68    push        ebp
 00420D69    mov         ebp,esp
 00420D6B    push        ebx
 00420D6C    mov         ebx,dword ptr [ebp+8]
 00420D6F    push        ebx
 00420D70    push        790CDC;gvar_00790CDC:TFormatSettings
 00420D75    call        FmtStr
 00420D7A    pop         ebx
 00420D7B    pop         ebp
 00420D7C    ret         4
*}
end;

//00420D80
procedure FmtStr(var Result:UnicodeString; const Format:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; const AFormatSettings:TFormatSettings);
begin
{*
 00420D80    push        ebp
 00420D81    mov         ebp,esp
 00420D83    push        eax
 00420D84    mov         eax,2
 00420D89    add         esp,0FFFFF004
 00420D8F    push        eax
 00420D90    dec         eax
>00420D91    jne         00420D89
 00420D93    mov         eax,dword ptr [ebp-4]
 00420D96    add         esp,0FFFFFFF8
 00420D99    push        ebx
 00420D9A    push        esi
 00420D9B    push        edi
 00420D9C    mov         dword ptr [ebp-8],ecx
 00420D9F    mov         dword ptr [ebp-4],edx
 00420DA2    mov         edi,eax
 00420DA4    mov         ebx,1000
 00420DA9    mov         edx,dword ptr [ebp-4]
 00420DAC    mov         eax,edx
 00420DAE    test        eax,eax
>00420DB0    je          00420DB7
 00420DB2    sub         eax,4
 00420DB5    mov         eax,dword ptr [eax]
 00420DB7    cmp         eax,0C00
>00420DBC    jge         00420DEE
 00420DBE    mov         eax,edx
 00420DC0    test        eax,eax
>00420DC2    je          00420DC9
 00420DC4    sub         eax,4
 00420DC7    mov         eax,dword ptr [eax]
 00420DC9    push        eax
 00420DCA    mov         eax,dword ptr [ebp-8]
 00420DCD    push        eax
 00420DCE    mov         eax,dword ptr [ebp+0C]
 00420DD1    push        eax
 00420DD2    mov         eax,dword ptr [ebp+8]
 00420DD5    push        eax
 00420DD6    mov         ecx,dword ptr [ebp-4]
 00420DD9    lea         eax,[ebp-200C]
 00420DDF    mov         edx,0FFF
 00420DE4    call        FormatBuf
 00420DE9    mov         dword ptr [ebp-0C],eax
>00420DEC    jmp         00420DFE
 00420DEE    mov         eax,edx
 00420DF0    test        eax,eax
>00420DF2    je          00420DF9
 00420DF4    sub         eax,4
 00420DF7    mov         eax,dword ptr [eax]
 00420DF9    mov         ebx,eax
 00420DFB    mov         dword ptr [ebp-0C],ebx
 00420DFE    mov         eax,ebx
 00420E00    dec         eax
 00420E01    cmp         eax,dword ptr [ebp-0C]
>00420E04    jg          00420E5C
>00420E06    jmp         00420E48
 00420E08    add         ebx,ebx
 00420E0A    mov         eax,edi
 00420E0C    call        @UStrClr
 00420E11    mov         eax,edi
 00420E13    mov         edx,ebx
 00420E15    call        @UStrSetLength
 00420E1A    mov         esi,dword ptr [ebp-4]
 00420E1D    test        esi,esi
>00420E1F    je          00420E26
 00420E21    sub         esi,4
 00420E24    mov         esi,dword ptr [esi]
 00420E26    push        esi
 00420E27    mov         eax,dword ptr [ebp-8]
 00420E2A    push        eax
 00420E2B    mov         eax,dword ptr [ebp+0C]
 00420E2E    push        eax
 00420E2F    mov         eax,dword ptr [ebp+8]
 00420E32    push        eax
 00420E33    mov         eax,dword ptr [edi]
 00420E35    call        @UStrToPWChar
 00420E3A    mov         ecx,dword ptr [ebp-4]
 00420E3D    mov         edx,ebx
 00420E3F    dec         edx
 00420E40    call        FormatBuf
 00420E45    mov         dword ptr [ebp-0C],eax
 00420E48    mov         eax,ebx
 00420E4A    dec         eax
 00420E4B    cmp         eax,dword ptr [ebp-0C]
>00420E4E    jle         00420E08
 00420E50    mov         eax,edi
 00420E52    mov         edx,dword ptr [ebp-0C]
 00420E55    call        @UStrSetLength
>00420E5A    jmp         00420E6C
 00420E5C    lea         edx,[ebp-200C]
 00420E62    mov         eax,edi
 00420E64    mov         ecx,dword ptr [ebp-0C]
 00420E67    call        @UStrFromPWCharLen
 00420E6C    pop         edi
 00420E6D    pop         esi
 00420E6E    pop         ebx
 00420E6F    mov         esp,ebp
 00420E71    pop         ebp
 00420E72    ret         8
*}
end;

//00420E78
procedure WideFormatError(ErrorCode:Integer; Format:PWideChar; FmtLen:Cardinal);
begin
{*
 00420E78    push        ebp
 00420E79    mov         ebp,esp
 00420E7B    push        0
 00420E7D    push        0
 00420E7F    push        ebx
 00420E80    push        esi
 00420E81    push        edi
 00420E82    mov         ebx,ecx
 00420E84    mov         edi,edx
 00420E86    mov         esi,eax
 00420E88    xor         eax,eax
 00420E8A    push        ebp
 00420E8B    push        420EE8
 00420E90    push        dword ptr fs:[eax]
 00420E93    mov         dword ptr fs:[eax],esp
 00420E96    lea         eax,[ebp-4]
 00420E99    mov         edx,ebx
 00420E9B    call        @WStrSetLength
 00420EA0    lea         eax,[ebp-4]
 00420EA3    mov         ecx,ebx
 00420EA5    mov         edx,edi
 00420EA7    call        @WStrFromPWCharLen
 00420EAC    lea         eax,[ebp-8]
 00420EAF    mov         edx,dword ptr [ebp-4]
 00420EB2    call        @UStrFromWStr
 00420EB7    mov         eax,dword ptr [ebp-8]
 00420EBA    call        @UStrToPWChar
 00420EBF    mov         edx,eax
 00420EC1    mov         ecx,ebx
 00420EC3    mov         eax,esi
 00420EC5    call        FormatError
 00420ECA    xor         eax,eax
 00420ECC    pop         edx
 00420ECD    pop         ecx
 00420ECE    pop         ecx
 00420ECF    mov         dword ptr fs:[eax],edx
 00420ED2    push        420EEF
 00420ED7    lea         eax,[ebp-8]
 00420EDA    call        @UStrClr
 00420EDF    lea         eax,[ebp-4]
 00420EE2    call        @WStrClr
 00420EE7    ret
>00420EE8    jmp         @HandleFinally
>00420EED    jmp         00420ED7
 00420EEF    pop         edi
 00420EF0    pop         esi
 00420EF1    pop         ebx
 00420EF2    pop         ecx
 00420EF3    pop         ecx
 00420EF4    pop         ebp
 00420EF5    ret
*}
end;

//00420EF8
procedure WideFormatVarToStr(var S:WideString; const V:TVarData);
begin
{*
 00420EF8    push        ebx
 00420EF9    mov         ecx,dword ptr ds:[78D638]
 00420EFF    cmp         dword ptr [ecx],0
>00420F02    je          00420F10
 00420F04    mov         ebx,dword ptr ds:[78D638]
 00420F0A    mov         ebx,dword ptr [ebx]
 00420F0C    call        ebx
 00420F0E    pop         ebx
 00420F0F    ret
 00420F10    mov         al,10
 00420F12    call        Error
 00420F17    pop         ebx
 00420F18    ret
*}
end;

//00420F1C
function FloatToTextEx(BufferArg:PChar; const Value:void ; ValueType:TFloatValue; Format:TFloatFormat; Precision:Integer; Digits:Integer; const AFormatSettings:TFormatSettings):Integer;
begin
{*
 00420F1C    push        ebp
 00420F1D    mov         ebp,esp
 00420F1F    push        ebx
 00420F20    movzx       ebx,byte ptr [ebp+14]
 00420F24    push        ebx
 00420F25    mov         ebx,dword ptr [ebp+10]
 00420F28    push        ebx
 00420F29    mov         ebx,dword ptr [ebp+0C]
 00420F2C    push        ebx
 00420F2D    mov         ebx,dword ptr [ebp+8]
 00420F30    push        ebx
 00420F31    call        FloatToText
 00420F36    pop         ebx
 00420F37    pop         ebp
 00420F38    ret         10
*}
end;

//00420F3C
function WideFormatBuf(var Buffer:void ; BufLen:Cardinal; const Format:void ; FmtLen:Cardinal; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; const AFormatSettings:TFormatSettings):Cardinal;
begin
{*
 00420F3C    push        ebp
 00420F3D    mov         ebp,esp
 00420F3F    add         esp,0FFFFFF58
 00420F45    push        ebx
 00420F46    xor         ebx,ebx
 00420F48    mov         dword ptr [ebp-10],ebx
 00420F4B    push        ebx
 00420F4C    push        esi
 00420F4D    push        edi
 00420F4E    mov         edi,eax
 00420F50    mov         esi,ecx
 00420F52    xor         eax,eax
 00420F54    mov         dword ptr [ebp-4],eax
 00420F57    mov         ecx,dword ptr [ebp+14]
 00420F5A    lea         ecx,[esi+ecx*2]
 00420F5D    mov         dword ptr [ebp-8],edi
 00420F60    xor         eax,eax
 00420F62    mov         dword ptr [ebp-0C],eax
 00420F65    mov         dword ptr [ebp-10],eax
 00420F68    or          edx,edx
>00420F6A    je          00420F7D
 00420F6C    cmp         esi,ecx
>00420F6E    je          00420F7D
 00420F70    lods        word ptr [esi]
 00420F72    cmp         ax,25
>00420F76    je          00420F89
 00420F78    stos        word ptr [edi]
 00420F7A    dec         edx
>00420F7B    jne         00420F6C
 00420F7D    mov         eax,edi
 00420F7F    sub         eax,dword ptr [ebp-8]
 00420F82    shr         eax,1
>00420F84    jmp         00421330
 00420F89    cmp         esi,ecx
>00420F8B    je          00420F7D
 00420F8D    lods        word ptr [esi]
 00420F8F    cmp         ax,25
>00420F93    je          00420F78
 00420F95    lea         ebx,[esi-4]
 00420F98    mov         dword ptr [ebp-14],ebx
 00420F9B    mov         word ptr [ebp-16],ax
 00420F9F    cmp         ax,2D
>00420FA3    jne         00420FAB
 00420FA5    cmp         esi,ecx
>00420FA7    je          00420F7D
 00420FA9    lods        word ptr [esi]
 00420FAB    call        00421045
 00420FB0    cmp         ax,3A
>00420FB4    jne         00420FC1
 00420FB6    mov         dword ptr [ebp-0C],ebx
 00420FB9    cmp         esi,ecx
>00420FBB    je          00420F7D
 00420FBD    lods        word ptr [esi]
>00420FBF    jmp         00420F9B
 00420FC1    or          ebx,ebx
>00420FC3    jns         00420FDC
 00420FC5    neg         ebx
 00420FC7    cmp         word ptr [ebp-16],2D
>00420FCC    je          00420FD6
 00420FCE    mov         word ptr [ebp-16],2D
>00420FD4    jmp         00420FDC
 00420FD6    mov         word ptr [ebp-16],2A
 00420FDC    mov         dword ptr [ebp-1C],ebx
 00420FDF    mov         ebx,0FFFFFFFF
 00420FE4    cmp         ax,2E
>00420FE8    jne         00420FF5
 00420FEA    cmp         esi,ecx
>00420FEC    je          00420F7D
 00420FEE    lods        word ptr [esi]
 00420FF0    call        00421045
 00420FF5    mov         dword ptr [ebp-20],ebx
 00420FF8    mov         dword ptr [ebp-24],esi
 00420FFB    push        ecx
 00420FFC    push        edx
 00420FFD    call        00421094
 00421002    pop         edx
 00421003    mov         ebx,dword ptr [ebp-1C]
 00421006    sub         ebx,ecx
>00421008    jae         0042100C
 0042100A    xor         ebx,ebx
 0042100C    cmp         word ptr [ebp-16],2D
>00421011    jne         0042101E
 00421013    sub         edx,ecx
>00421015    jae         0042101B
 00421017    add         ecx,edx
 00421019    xor         edx,edx
 0042101B    rep movs    word ptr [edi],word ptr [esi]
 0042101E    xchg        ebx,ecx
 00421020    sub         edx,ecx
>00421022    jae         00421028
 00421024    add         ecx,edx
 00421026    xor         edx,edx
 00421028    mov         ax,20
 0042102C    rep stos    word ptr [edi]
 0042102F    xchg        ebx,ecx
 00421031    sub         edx,ecx
>00421033    jae         00421039
 00421035    add         ecx,edx
 00421037    xor         edx,edx
 00421039    rep movs    word ptr [edi],word ptr [esi]
 0042103C    pop         ecx
 0042103D    mov         esi,dword ptr [ebp-24]
>00421040    jmp         00420F68
 00421045    xor         ebx,ebx
 00421047    cmp         ax,2A
>0042104B    je          00421073
 0042104D    cmp         ax,30
>00421051    jb          00421093
 00421053    cmp         ax,39
>00421057    ja          00421093
 00421059    imul        ebx,ebx,0A
 0042105C    sub         ax,30
 00421060    movzx       eax,ax
 00421063    add         ebx,eax
 00421065    cmp         esi,ecx
>00421067    je          0042106D
 00421069    lods        word ptr [esi]
>0042106B    jmp         0042104D
 0042106D    pop         eax
>0042106E    jmp         00420F7D
 00421073    mov         eax,dword ptr [ebp-0C]
 00421076    cmp         eax,dword ptr [ebp+0C]
>00421079    jg          0042108D
 0042107B    inc         dword ptr [ebp-0C]
 0042107E    mov         ebx,dword ptr [ebp+10]
 00421081    cmp         byte ptr [ebx+eax*8+4],0
 00421086    mov         ebx,dword ptr [ebx+eax*8]
>00421089    je          0042108D
 0042108B    xor         ebx,ebx
 0042108D    cmp         esi,ecx
>0042108F    je          0042106D
 00421091    lods        word ptr [esi]
 00421093    ret
*}
end;

//00421340
procedure PutExponent;
begin
{*
 00421340    push        esi
 00421341    xor         esi,esi
 00421343    stos        byte ptr [edi]
 00421344    cmp         bh,0
>00421347    je          0042134C
 00421349    xor         al,al
 0042134B    stos        byte ptr [edi]
 0042134C    or          bl,bl
>0042134E    jne         00421354
 00421350    xor         edx,edx
>00421352    jmp         0042135E
 00421354    or          edx,edx
>00421356    jge         0042135E
 00421358    mov         al,2D
 0042135A    neg         edx
>0042135C    jmp         00421364
 0042135E    or          ah,ah
>00421360    je          0042136D
 00421362    mov         al,ah
 00421364    stos        byte ptr [edi]
 00421365    cmp         bh,0
>00421368    je          0042136D
 0042136A    xor         al,al
 0042136C    stos        byte ptr [edi]
 0042136D    xchg        eax,edx
 0042136E    push        eax
 0042136F    push        ebx
 00421370    mov         ebx,esp
 00421372    sub         ebx,8
 00421375    push        ebx
 00421376    xor         edx,edx
 00421378    div         eax,dword ptr [esi+784D4C]
 0042137E    add         dl,30
 00421381    mov         byte ptr [ebx],dl
 00421383    inc         ebx
 00421384    dec         ecx
 00421385    or          eax,eax
>00421387    jne         00421376
 00421389    or          ecx,ecx
>0042138B    jg          00421376
 0042138D    pop         edx
 0042138E    pop         ecx
 0042138F    dec         ebx
 00421390    mov         al,byte ptr [ebx]
 00421392    stos        byte ptr [edi]
 00421393    cmp         ch,0
>00421396    je          0042139B
 00421398    xor         al,al
 0042139A    stos        byte ptr [edi]
 0042139B    cmp         ebx,edx
>0042139D    jne         0042138F
 0042139F    pop         eax
 004213A0    pop         esi
 004213A1    ret
*}
end;

//004213A4
function FloatToText(BufferArg:PWideChar; const Value:void ; ValueType:TFloatValue; Format:TFloatFormat; Precision:Integer; Digits:Integer; const AFormatSettings:TFormatSettings):Integer;
begin
{*
 004213A4    push        ebp
 004213A5    mov         ebp,esp
 004213A7    add         esp,0FFFFFFD4
 004213AA    push        edi
 004213AB    push        esi
 004213AC    push        ebx
 004213AD    mov         dword ptr [ebp-4],eax
 004213B0    mov         dword ptr [ebp-8],0
 004213B7    mov         eax,dword ptr [ebp+8]
 004213BA    mov         eax,dword ptr [eax]
 004213BC    mov         dword ptr [ebp-0C],eax
 004213BF    mov         eax,dword ptr [ebp+8]
 004213C2    mov         ax,word ptr [eax+0BE]
 004213C9    mov         word ptr [ebp-0E],ax
 004213CD    mov         eax,dword ptr [ebp+8]
 004213D0    mov         ax,word ptr [eax+0BC]
 004213D7    mov         word ptr [ebp-10],ax
 004213DB    mov         eax,dword ptr [ebp+8]
 004213DE    mov         al,byte ptr [eax+4]
 004213E1    mov         byte ptr [ebp-11],al
 004213E4    mov         eax,dword ptr [ebp+8]
 004213E7    mov         al,byte ptr [eax+0C2]
 004213ED    mov         byte ptr [ebp-12],al
 004213F0    mov         eax,13
 004213F5    cmp         cl,0
>004213F8    jne         00421411
 004213FA    mov         eax,dword ptr [ebp+10]
 004213FD    cmp         eax,2
>00421400    jge         00421407
 00421402    mov         eax,2
 00421407    cmp         eax,12
>0042140A    jle         00421411
 0042140C    mov         eax,12
 00421411    mov         dword ptr [ebp+10],eax
 00421414    push        eax
 00421415    mov         eax,270F
 0042141A    cmp         byte ptr [ebp+14],2
>0042141E    jb          00421423
 00421420    mov         eax,dword ptr [ebp+0C]
 00421423    push        eax
 00421424    lea         eax,[ebp-2A]
 00421427    call        FloatToDecimal
 0042142C    mov         edi,dword ptr [ebp-4]
 0042142F    movzx       eax,word ptr [ebp-2A]
 00421433    sub         eax,7FFF
 00421438    cmp         eax,2
>0042143B    jae         0042145A
 0042143D    mov         ecx,eax
 0042143F    call        004214C1
 00421444    shl         ecx,1
 00421446    lea         esi,[ecx+ecx*2+4214AA]
 0042144D    add         esi,dword ptr [ebp-8]
 00421450    mov         ecx,3
 00421455    rep movs    word ptr [edi],word ptr [esi]
>00421458    jmp         00421487
 0042145A    lea         esi,[ebp-27]
 0042145D    movzx       ebx,byte ptr [ebp+14]
 00421461    cmp         bl,1
>00421464    je          00421476
 00421466    cmp         bl,4
>00421469    ja          00421474
 0042146B    movsx       eax,word ptr [ebp-2A]
 0042146F    cmp         eax,dword ptr [ebp+10]
>00421472    jle         00421476
 00421474    mov         bl,0
 00421476    lea         ebx,[ebx*4+421496]
 0042147D    add         ebx,dword ptr [ebp-8]
 00421480    mov         ebx,dword ptr [ebx]
 00421482    add         ebx,dword ptr [ebp-8]
 00421485    call        ebx
 00421487    mov         eax,edi
 00421489    sub         eax,dword ptr [ebp-4]
 0042148C    shr         eax,1
 0042148E    pop         ebx
 0042148F    pop         esi
 00421490    pop         edi
>00421491    jmp         004216BE
 00421496    into
 00421497    adc         al,42
 00421499    add         byte ptr [esi],bh
 0042149B    adc         eax,157B0042
 004214A0    inc         edx
 004214A1    add         byte ptr [ebx+15],bh
 004214A4    inc         edx
 004214A5    add         bl,dh
 004214A7    adc         eax,490042
 004214AC    dec         esi
 004214AD    add         byte ptr [esi],al
 004214B0    dec         esi
 004214B1    add         byte ptr [ecx],al
 004214B4    dec         esi
 004214B5    add         byte ptr [eax+ecx-4FFC8A40],ch
 004214BC    xor         byte ptr [esi+32],cl
 004214BF    in          al,0C3
 004214C1    cmp         byte ptr [ebp-28],0
>004214C5    je          004214CD
 004214C7    mov         ax,2D
 004214CB    stos        word ptr [edi]
 004214CD    ret
*}
end;

//004216C4
procedure FloatToDecimal(var Result:TFloatRec; const Value:void ; ValueType:TFloatValue; Precision:Integer; Decimals:Integer);
begin
{*
 004216C4    push        ebp
 004216C5    mov         ebp,esp
 004216C7    add         esp,0FFFFFFD8
 004216CA    push        edi
 004216CB    push        esi
 004216CC    push        ebx
 004216CD    mov         ebx,eax
 004216CF    mov         esi,edx
 004216D1    mov         dword ptr [ebp-4],0
 004216D8    cmp         cl,0
>004216DB    je          004216E7
 004216DD    call        00421813
>004216E2    jmp         004218E7
 004216E7    call        004216F1
>004216EC    jmp         004218E7
 004216F1    mov         ax,word ptr [esi+8]
 004216F5    mov         edx,eax
 004216F7    and         eax,7FFF
>004216FC    je          0042171C
 004216FE    cmp         eax,7FFF
>00421703    jne         00421727
 00421705    test        word ptr [esi+6],8000
>0042170B    je          0042171E
 0042170D    cmp         dword ptr [esi],0
>00421710    jne         0042171B
 00421712    cmp         dword ptr [esi+4],80000000
>00421719    je          0042171E
 0042171B    inc         eax
 0042171C    xor         edx,edx
 0042171E    mov         byte ptr [ebx+3],0
>00421722    jmp         004217F4
 00421727    fld         tbyte ptr [esi]
 00421729    sub         eax,3FFF
 0042172E    imul        eax,eax,4D10
 00421734    sar         eax,10
 00421737    inc         eax
 00421738    mov         dword ptr [ebp-8],eax
 0042173B    mov         eax,12
 00421740    sub         eax,dword ptr [ebp-8]
 00421743    fabs
 00421745    push        ebx
 00421746    mov         ebx,dword ptr [ebp-4]
 00421749    call        FPower10
 0042174E    pop         ebx
 0042174F    frndint
 00421751    mov         edi,dword ptr [ebp-4]
 00421754    fld         tbyte ptr [edi+784D40]
 0042175A    fcomp       st(1)
 0042175C    wait
 0042175D    fnstsw      word ptr [ebp-0A]
 00421760    wait
 00421761    test        word ptr [ebp-0A],4100
>00421767    je          00421772
 00421769    fidiv       dword ptr [edi+784D4C]
 0042176F    inc         dword ptr [ebp-8]
 00421772    fbstp       tbyte ptr [ebp-20]
 00421775    lea         edi,[ebx+3]
 00421778    mov         edx,9
 0042177D    wait
 0042177E    mov         al,byte ptr [edx+ebp-21]
 00421782    mov         ah,al
 00421784    shr         al,4
 00421787    and         ah,0F
 0042178A    add         ax,3030
 0042178E    stos        word ptr [edi]
 00421790    dec         edx
>00421791    jne         0042177E
 00421793    xor         al,al
 00421795    stos        byte ptr [edi]
 00421796    mov         edi,dword ptr [ebp-8]
 00421799    add         edi,dword ptr [ebp+8]
>0042179C    jns         004217A5
 0042179E    xor         eax,eax
>004217A0    jmp         0042171C
 004217A5    cmp         edi,dword ptr [ebp+0C]
>004217A8    jb          004217AD
 004217AA    mov         edi,dword ptr [ebp+0C]
 004217AD    cmp         edi,12
>004217B0    jae         004217D9
 004217B2    cmp         byte ptr [ebx+edi+3],35
>004217B7    jb          004217DE
 004217B9    mov         byte ptr [ebx+edi+3],0
 004217BE    dec         edi
>004217BF    js          004217CE
 004217C1    inc         byte ptr [ebx+edi+3]
 004217C5    cmp         byte ptr [ebx+edi+3],39
>004217CA    ja          004217B9
>004217CC    jmp         004217ED
 004217CE    mov         word ptr [ebx+3],31
 004217D4    inc         dword ptr [ebp-8]
>004217D7    jmp         004217ED
 004217D9    mov         edi,12
 004217DE    mov         byte ptr [ebx+edi+3],0
 004217E3    dec         edi
>004217E4    js          004217FF
 004217E6    cmp         byte ptr [ebx+edi+3],30
>004217EB    je          004217DE
 004217ED    mov         dx,word ptr [esi+8]
 004217F1    mov         eax,dword ptr [ebp-8]
 004217F4    shr         dx,0F
 004217F8    mov         word ptr [ebx],ax
 004217FB    mov         byte ptr [ebx+2],dl
 004217FE    ret
 004217FF    xor         edx,edx
>00421801    jmp         004217F1
 00421803    or          al,byte ptr [eax]
 00421805    add         byte ptr [eax],al
 00421807    add         byte ptr fs:[eax],al
 0042180A    add         al,ch
 0042180C    add         eax,dword ptr [eax]
 0042180E    add         byte ptr [eax],dl
 00421810    daa
 00421811    add         byte ptr [eax],al
 00421813    mov         eax,dword ptr [esi]
 00421815    mov         edx,dword ptr [esi+4]
 00421818    mov         ecx,eax
 0042181A    or          ecx,edx
>0042181C    je          004218D9
 00421822    or          edx,edx
>00421824    jns         0042182D
 00421826    neg         edx
 00421828    neg         eax
 0042182A    sbb         edx,0
 0042182D    xor         ecx,ecx
 0042182F    mov         edi,dword ptr [ebp+8]
 00421832    or          edi,edi
>00421834    jge         00421838
 00421836    xor         edi,edi
 00421838    cmp         edi,4
>0042183B    jl          0042185C
 0042183D    mov         edi,4
 00421842    inc         ecx
 00421843    sub         eax,0A7640000
 00421848    sbb         edx,0DE0B6B3
>0042184E    jae         00421842
 00421850    dec         ecx
 00421851    add         eax,0A7640000
 00421856    adc         edx,0DE0B6B3
 0042185C    mov         dword ptr [ebp-28],eax
 0042185F    mov         dword ptr [ebp-24],edx
 00421862    fild        qword ptr [ebp-28]
 00421865    mov         edx,edi
 00421867    mov         eax,4
 0042186C    sub         eax,edx
>0042186E    je          0042187A
 00421870    mov         edi,dword ptr [ebp-4]
 00421873    fidiv       dword ptr [edi+eax*4+4217FF]
 0042187A    fbstp       tbyte ptr [ebp-20]
 0042187D    lea         edi,[ebx+3]
 00421880    wait
 00421881    or          ecx,ecx
>00421883    jne         004218A0
 00421885    mov         ecx,9
 0042188A    mov         al,byte ptr [ecx+ebp-21]
 0042188E    mov         ah,al
 00421890    shr         al,4
>00421893    jne         004218B3
 00421895    mov         al,ah
 00421897    and         al,0F
>00421899    jne         004218BA
 0042189B    dec         ecx
>0042189C    jne         0042188A
>0042189E    jmp         004218D9
 004218A0    mov         al,cl
 004218A2    add         al,30
 004218A4    stos        byte ptr [edi]
 004218A5    mov         ecx,9
 004218AA    mov         al,byte ptr [ecx+ebp-21]
 004218AE    mov         ah,al
 004218B0    shr         al,4
 004218B3    add         al,30
 004218B5    stos        byte ptr [edi]
 004218B6    mov         al,ah
 004218B8    and         al,0F
 004218BA    add         al,30
 004218BC    stos        byte ptr [edi]
 004218BD    dec         ecx
>004218BE    jne         004218AA
 004218C0    mov         eax,edi
 004218C2    lea         ecx,[ebx+edx+3]
 004218C6    sub         eax,ecx
 004218C8    mov         byte ptr [edi],0
 004218CB    dec         edi
 004218CC    cmp         byte ptr [edi],30
>004218CF    je          004218C8
 004218D1    mov         edx,dword ptr [esi+4]
 004218D4    shr         edx,1F
>004218D7    jmp         004218E0
 004218D9    xor         eax,eax
 004218DB    xor         edx,edx
 004218DD    mov         byte ptr [ebx+3],al
 004218E0    mov         word ptr [ebx],ax
 004218E3    mov         byte ptr [ebx+2],dl
 004218E6    ret
*}
end;

//004218F0
function TextToFloat(Buffer:PWideChar; var Value:void ; ValueType:TFloatValue; const AFormatSettings:TFormatSettings):Boolean;
begin
{*
 004218F0    push        ebp
 004218F1    mov         ebp,esp
 004218F3    add         esp,0FFFFFFF0
 004218F6    push        edi
 004218F7    push        esi
 004218F8    push        ebx
 004218F9    mov         esi,eax
 004218FB    mov         edi,edx
 004218FD    mov         byte ptr [ebp-1],cl
 00421900    mov         dword ptr [ebp-8],0
 00421907    mov         eax,dword ptr [ebp+8]
 0042190A    mov         ax,word ptr [eax+0BE]
 00421911    mov         word ptr [ebp-0A],ax
 00421915    wait
 00421916    fnstcw      word ptr [ebp-0C]
 00421919    wait
 0042191A    fnclex
 0042191C    fldcw       word ptr ds:[784D50]
 00421922    fldz
 00421924    call        004219C2
 00421929    mov         bx,word ptr [esi]
 0042192C    cmp         bx,2B
>00421930    je          00421938
 00421932    cmp         bx,2D
>00421936    jne         0042193B
 00421938    add         esi,2
 0042193B    mov         ecx,esi
 0042193D    call        004219D3
 00421942    xor         edx,edx
 00421944    mov         ax,word ptr [esi]
 00421947    cmp         ax,word ptr [ebp-0A]
>0042194B    jne         00421957
 0042194D    add         esi,2
 00421950    call        004219D3
 00421955    neg         edx
 00421957    cmp         ecx,esi
>00421959    je          004219B5
 0042195B    mov         ax,word ptr [esi]
 0042195E    and         ax,0DF
 00421962    cmp         ax,45
>00421966    jne         00421974
 00421968    add         esi,2
 0042196B    push        edx
 0042196C    call        004219F6
 00421971    pop         eax
 00421972    add         edx,eax
 00421974    call        004219C2
 00421979    cmp         word ptr [esi],0
>0042197D    jne         004219B5
 0042197F    mov         eax,edx
 00421981    cmp         byte ptr [ebp-1],1
>00421985    jne         0042198A
 00421987    add         eax,4
 0042198A    push        ebx
 0042198B    mov         ebx,dword ptr [ebp-8]
 0042198E    call        FPower10
 00421993    pop         ebx
 00421994    cmp         bx,2D
>00421998    jne         0042199C
 0042199A    fchs
 0042199C    cmp         byte ptr [ebp-1],0
>004219A0    je          004219A6
 004219A2    fistp       qword ptr [edi]
>004219A4    jmp         004219A8
 004219A6    fstp        tbyte ptr [edi]
 004219A8    wait
 004219A9    fnstsw      al
 004219AB    test        ax,9
>004219AF    jne         004219B7
 004219B1    mov         al,1
>004219B3    jmp         004219B9
 004219B5    fstp        st(0)
 004219B7    xor         eax,eax
 004219B9    wait
 004219BA    fnclex
 004219BC    fldcw       word ptr [ebp-0C]
 004219BF    wait
>004219C0    jmp         00421A32
 004219C2    lods        word ptr [esi]
 004219C4    or          ax,ax
>004219C7    je          004219CF
 004219C9    cmp         ax,20
>004219CD    je          004219C2
 004219CF    sub         esi,2
 004219D2    ret
 004219D3    xor         eax,eax
 004219D5    xor         edx,edx
 004219D7    lods        word ptr [esi]
 004219D9    sub         ax,3A
 004219DD    add         ax,0A
>004219E1    jae         004219F2
 004219E3    fimul       dword ptr ds:[784D4C]
 004219E9    mov         dword ptr [ebp-10],eax
 004219EC    fiadd       dword ptr [ebp-10]
 004219EF    inc         edx
>004219F0    jmp         004219D7
 004219F2    sub         esi,2
 004219F5    ret
 004219F6    xor         eax,eax
 004219F8    xor         edx,edx
 004219FA    mov         cx,word ptr [esi]
 004219FD    cmp         cx,2B
>00421A01    je          00421A09
 00421A03    cmp         cx,2D
>00421A07    jne         00421A0C
 00421A09    add         esi,2
 00421A0C    mov         ax,word ptr [esi]
 00421A0F    sub         ax,3A
 00421A13    add         ax,0A
>00421A17    jae         00421A29
 00421A19    add         esi,2
 00421A1C    imul        edx,edx,0A
 00421A1F    add         edx,eax
 00421A21    cmp         edx,1F4
>00421A27    jb          00421A0C
 00421A29    cmp         cx,2D
>00421A2D    jne         00421A31
 00421A2F    neg         edx
 00421A31    ret
 00421A32    pop         ebx
 00421A33    pop         esi
 00421A34    pop         edi
 00421A35    mov         esp,ebp
 00421A37    pop         ebp
 00421A38    ret         4
*}
end;

//00421A3C
function FloatToStr(Value:Extended):UnicodeString;
begin
{*
 00421A3C    push        ebp
 00421A3D    mov         ebp,esp
 00421A3F    push        ebx
 00421A40    mov         ebx,eax
 00421A42    movzx       eax,word ptr [ebp+10]
 00421A46    push        eax
 00421A47    push        dword ptr [ebp+0C]
 00421A4A    push        dword ptr [ebp+8]
 00421A4D    mov         edx,ebx
 00421A4F    mov         eax,790CDC;gvar_00790CDC:TFormatSettings
 00421A54    call        FloatToStr
 00421A59    pop         ebx
 00421A5A    pop         ebp
 00421A5B    ret         0C
*}
end;

//00421A60
function FloatToStr(const AFormatSettings:TFormatSettings; Value:Extended):UnicodeString;
begin
{*
 00421A60    push        ebp
 00421A61    mov         ebp,esp
 00421A63    add         esp,0FFFFFF80
 00421A66    push        ebx
 00421A67    push        esi
 00421A68    mov         esi,edx
 00421A6A    mov         ebx,eax
 00421A6C    push        0
 00421A6E    push        0F
 00421A70    push        0
 00421A72    push        ebx
 00421A73    lea         edx,[ebp+8]
 00421A76    lea         eax,[ebp-80]
 00421A79    xor         ecx,ecx
 00421A7B    call        FloatToText
 00421A80    mov         ecx,eax
 00421A82    lea         edx,[ebp-80]
 00421A85    mov         eax,esi
 00421A87    call        @UStrFromPWCharLen
 00421A8C    pop         esi
 00421A8D    pop         ebx
 00421A8E    mov         esp,ebp
 00421A90    pop         ebp
 00421A91    ret         0C
*}
end;

//00421A94
function CurrToStr(const AFormatSettings:TFormatSettings; Value:Currency):UnicodeString;
begin
{*
 00421A94    push        ebp
 00421A95    mov         ebp,esp
 00421A97    add         esp,0FFFFFF80
 00421A9A    push        ebx
 00421A9B    push        esi
 00421A9C    mov         esi,edx
 00421A9E    mov         ebx,eax
 00421AA0    push        0
 00421AA2    push        0
 00421AA4    push        0
 00421AA6    push        ebx
 00421AA7    lea         edx,[ebp+8]
 00421AAA    lea         eax,[ebp-80]
 00421AAD    mov         cl,1
 00421AAF    call        FloatToText
 00421AB4    mov         ecx,eax
 00421AB6    lea         edx,[ebp-80]
 00421AB9    mov         eax,esi
 00421ABB    call        @UStrFromPWCharLen
 00421AC0    pop         esi
 00421AC1    pop         ebx
 00421AC2    mov         esp,ebp
 00421AC4    pop         ebp
 00421AC5    ret         8
*}
end;

//00421AC8
function FloatToStrF(Format:TFloatFormat; Precision:Integer; Digits:Integer; Value:Extended; const AFormatSettings:TFormatSettings):UnicodeString;
begin
{*
 00421AC8    push        ebp
 00421AC9    mov         ebp,esp
 00421ACB    add         esp,0FFFFFF80
 00421ACE    push        ebx
 00421ACF    push        esi
 00421AD0    push        edi
 00421AD1    mov         edi,ecx
 00421AD3    mov         esi,edx
 00421AD5    mov         ebx,eax
 00421AD7    push        ebx
 00421AD8    push        esi
 00421AD9    push        edi
 00421ADA    mov         eax,dword ptr [ebp+0C]
 00421ADD    push        eax
 00421ADE    lea         edx,[ebp+10]
 00421AE1    lea         eax,[ebp-80]
 00421AE4    xor         ecx,ecx
 00421AE6    call        FloatToText
 00421AEB    mov         ecx,eax
 00421AED    lea         edx,[ebp-80]
 00421AF0    mov         eax,dword ptr [ebp+8]
 00421AF3    call        @UStrFromPWCharLen
 00421AF8    pop         edi
 00421AF9    pop         esi
 00421AFA    pop         ebx
 00421AFB    mov         esp,ebp
 00421AFD    pop         ebp
 00421AFE    ret         14
*}
end;

//00421B04
function StrToFloat(const S:UnicodeString):Extended;
begin
{*
 00421B04    add         esp,0FFFFFFF4
 00421B07    mov         edx,790CDC;gvar_00790CDC:TFormatSettings
 00421B0C    call        StrToFloat
 00421B11    fstp        tbyte ptr [esp]
 00421B14    wait
 00421B15    fld         tbyte ptr [esp]
 00421B18    add         esp,0C
 00421B1B    ret
*}
end;

//00421B1C
function StrToFloat(const S:UnicodeString; const AFormatSettings:TFormatSettings):Extended;
begin
{*
 00421B1C    push        ebx
 00421B1D    push        esi
 00421B1E    add         esp,0FFFFFFEC
 00421B21    mov         esi,edx
 00421B23    mov         ebx,eax
 00421B25    push        esi
 00421B26    mov         eax,ebx
 00421B28    call        @UStrToPWChar
 00421B2D    lea         edx,[esp+4]
 00421B31    xor         ecx,ecx
 00421B33    call        TextToFloat
 00421B38    test        al,al
>00421B3A    jne         00421B55
 00421B3C    mov         dword ptr [esp+0C],ebx
 00421B40    mov         byte ptr [esp+10],11
 00421B45    lea         edx,[esp+0C]
 00421B49    mov         eax,[0078CE20];^SResString0:TResStringRec
 00421B4E    xor         ecx,ecx
 00421B50    call        ConvertErrorFmt
 00421B55    fld         tbyte ptr [esp]
 00421B58    add         esp,14
 00421B5B    pop         esi
 00421B5C    pop         ebx
 00421B5D    ret
*}
end;

//00421B60
function TryStrToFloat(const S:UnicodeString; var Value:Extended):Boolean;
begin
{*
 00421B60    mov         ecx,790CDC;gvar_00790CDC:TFormatSettings
 00421B65    call        TryStrToFloat
 00421B6A    ret
*}
end;

//00421B6C
function TryStrToFloat(const S:UnicodeString; const AFormatSettings:TFormatSettings; var Value:Extended):Boolean;
begin
{*
 00421B6C    push        ebx
 00421B6D    push        esi
 00421B6E    push        edi
 00421B6F    mov         edi,ecx
 00421B71    mov         esi,edx
 00421B73    mov         ebx,eax
 00421B75    push        edi
 00421B76    mov         eax,ebx
 00421B78    call        @UStrToPWChar
 00421B7D    mov         edx,esi
 00421B7F    xor         ecx,ecx
 00421B81    call        TextToFloat
 00421B86    pop         edi
 00421B87    pop         esi
 00421B88    pop         ebx
 00421B89    ret
*}
end;

//00421B8C
function TryStrToFloat(const S:UnicodeString; const AFormatSettings:TFormatSettings; var Value:Double):Boolean;
begin
{*
 00421B8C    push        ebx
 00421B8D    push        esi
 00421B8E    push        edi
 00421B8F    add         esp,0FFFFFFF4
 00421B92    mov         esi,ecx
 00421B94    mov         edi,edx
 00421B96    mov         ebx,eax
 00421B98    push        esi
 00421B99    mov         eax,ebx
 00421B9B    call        @UStrToPWChar
 00421BA0    lea         edx,[esp+4]
 00421BA4    xor         ecx,ecx
 00421BA6    call        TextToFloat
 00421BAB    mov         edx,eax
 00421BAD    test        dl,dl
>00421BAF    je          00421BD5
 00421BB1    fld         tbyte ptr [esp]
 00421BB4    fld         tbyte ptr ds:[421BE8]
 00421BBA    fcompp
 00421BBC    wait
 00421BBD    fnstsw      al
 00421BBF    sahf
>00421BC0    ja          00421BD3
 00421BC2    fld         tbyte ptr [esp]
 00421BC5    fld         tbyte ptr ds:[421BF4]
 00421BCB    fcompp
 00421BCD    wait
 00421BCE    fnstsw      al
 00421BD0    sahf
>00421BD1    jae         00421BD5
 00421BD3    xor         edx,edx
 00421BD5    test        dl,dl
>00421BD7    je          00421BDF
 00421BD9    fld         tbyte ptr [esp]
 00421BDC    fstp        qword ptr [edi]
 00421BDE    wait
 00421BDF    mov         eax,edx
 00421BE1    add         esp,0C
 00421BE4    pop         edi
 00421BE5    pop         esi
 00421BE6    pop         ebx
 00421BE7    ret
*}
end;

//00421C00
function TryStrToFloat(const S:UnicodeString; var Value:Single; const AFormatSettings:TFormatSettings):Boolean;
begin
{*
 00421C00    push        ebx
 00421C01    push        esi
 00421C02    push        edi
 00421C03    add         esp,0FFFFFFF4
 00421C06    mov         esi,ecx
 00421C08    mov         edi,edx
 00421C0A    mov         ebx,eax
 00421C0C    push        esi
 00421C0D    mov         eax,ebx
 00421C0F    call        @UStrToPWChar
 00421C14    lea         edx,[esp+4]
 00421C18    xor         ecx,ecx
 00421C1A    call        TextToFloat
 00421C1F    mov         edx,eax
 00421C21    test        dl,dl
>00421C23    je          00421C49
 00421C25    fld         tbyte ptr [esp]
 00421C28    fld         tbyte ptr ds:[421C5C]
 00421C2E    fcompp
 00421C30    wait
 00421C31    fnstsw      al
 00421C33    sahf
>00421C34    ja          00421C47
 00421C36    fld         tbyte ptr [esp]
 00421C39    fld         tbyte ptr ds:[421C68]
 00421C3F    fcompp
 00421C41    wait
 00421C42    fnstsw      al
 00421C44    sahf
>00421C45    jae         00421C49
 00421C47    xor         edx,edx
 00421C49    test        dl,dl
>00421C4B    je          00421C53
 00421C4D    fld         tbyte ptr [esp]
 00421C50    fstp        dword ptr [edi]
 00421C52    wait
 00421C53    mov         eax,edx
 00421C55    add         esp,0C
 00421C58    pop         edi
 00421C59    pop         esi
 00421C5A    pop         ebx
 00421C5B    ret
*}
end;

//00421C74
function TryStrToCurr(const S:UnicodeString; const AFormatSettings:TFormatSettings; var Value:Currency):Boolean;
begin
{*
 00421C74    push        ebx
 00421C75    push        esi
 00421C76    push        edi
 00421C77    mov         edi,ecx
 00421C79    mov         esi,edx
 00421C7B    mov         ebx,eax
 00421C7D    push        edi
 00421C7E    mov         eax,ebx
 00421C80    call        @UStrToPWChar
 00421C85    mov         edx,esi
 00421C87    mov         cl,1
 00421C89    call        TextToFloat
 00421C8E    pop         edi
 00421C8F    pop         esi
 00421C90    pop         ebx
 00421C91    ret
*}
end;

//00421C94
function DateTimeToTimeStamp(DateTime:TDateTime):TTimeStamp;
begin
{*
 00421C94    push        ebp
 00421C95    mov         ebp,esp
 00421C97    push        ebx
 00421C98    xor         ebx,ebx
 00421C9A    mov         ecx,eax
 00421C9C    fld         qword ptr [ebp+8]
 00421C9F    fmul        dword ptr [ebx+784D54]
 00421CA5    sub         esp,8
 00421CA8    fistp       qword ptr [esp]
 00421CAB    wait
 00421CAC    pop         eax
 00421CAD    pop         edx
 00421CAE    or          edx,edx
>00421CB0    jns         00421CC3
 00421CB2    neg         edx
 00421CB4    neg         eax
 00421CB6    sbb         edx,0
 00421CB9    div         eax,dword ptr [ebx+784D58]
 00421CBF    neg         eax
>00421CC1    jmp         00421CC9
 00421CC3    div         eax,dword ptr [ebx+784D58]
 00421CC9    add         eax,0A955A
 00421CCE    mov         dword ptr [ecx],edx
 00421CD0    mov         dword ptr [ecx+4],eax
 00421CD3    pop         ebx
 00421CD4    pop         ebp
 00421CD5    ret         8
*}
end;

//00421CD8
procedure ValidateTimeStamp(const TimeStamp:TTimeStamp);
begin
{*
 00421CD8    push        ebx
 00421CD9    add         esp,0FFFFFFF0
 00421CDC    mov         edx,dword ptr [eax]
 00421CDE    test        edx,edx
>00421CE0    jl          00421CE8
 00421CE2    cmp         dword ptr [eax+4],0
>00421CE6    jg          00421D11
 00421CE8    mov         ecx,dword ptr ds:[78DBB4];^SResString1:TResStringRec
 00421CEE    mov         ebx,dword ptr [eax+4]
 00421CF1    mov         dword ptr [esp],ebx
 00421CF4    mov         byte ptr [esp+4],0
 00421CF9    mov         dword ptr [esp+8],edx
 00421CFD    mov         byte ptr [esp+0C],0
 00421D02    mov         eax,esp
 00421D04    mov         edx,eax
 00421D06    mov         eax,1
 00421D0B    xchg        eax,ecx
 00421D0C    call        ConvertErrorFmt
 00421D11    add         esp,10
 00421D14    pop         ebx
 00421D15    ret
*}
end;

//00421D18
function TimeStampToDateTime(const TimeStamp:TTimeStamp):TDateTime;
begin
{*
 00421D18    push        ebx
 00421D19    xor         ebx,ebx
 00421D1B    push        eax
 00421D1C    call        ValidateTimeStamp
 00421D21    pop         eax
 00421D22    mov         ecx,dword ptr [eax]
 00421D24    mov         eax,dword ptr [eax+4]
 00421D27    sub         eax,0A955A
 00421D2C    imul        dword ptr [ebx+784D58]
 00421D32    or          edx,edx
>00421D34    jns         00421D3D
 00421D36    sub         eax,ecx
 00421D38    sbb         edx,0
>00421D3B    jmp         00421D42
 00421D3D    add         eax,ecx
 00421D3F    adc         edx,0
 00421D42    push        edx
 00421D43    push        eax
 00421D44    fild        qword ptr [esp]
 00421D47    fdiv        dword ptr [ebx+784D54]
 00421D4D    add         esp,8
 00421D50    pop         ebx
 00421D51    ret
*}
end;

//00421D54
function MSecsToTimeStamp(MSecs:Comp):TTimeStamp;
begin
{*
 00421D54    push        ebp
 00421D55    mov         ebp,esp
 00421D57    push        ebx
 00421D58    xor         ebx,ebx
 00421D5A    mov         ecx,eax
 00421D5C    mov         eax,dword ptr [ebp+8]
 00421D5F    mov         edx,dword ptr [ebp+0C]
 00421D62    div         eax,dword ptr [ebx+784D58]
 00421D68    mov         dword ptr [ecx],edx
 00421D6A    mov         dword ptr [ecx+4],eax
 00421D6D    pop         ebx
 00421D6E    pop         ebp
 00421D6F    ret         8
*}
end;

//00421D74
function TimeStampToMSecs(const TimeStamp:TTimeStamp):Comp;
begin
{*
 00421D74    push        ebx
 00421D75    xor         ebx,ebx
 00421D77    push        eax
 00421D78    call        ValidateTimeStamp
 00421D7D    pop         eax
 00421D7E    fild        dword ptr [eax+4]
 00421D81    fmul        dword ptr [ebx+784D54]
 00421D87    fiadd       dword ptr [eax]
 00421D89    pop         ebx
 00421D8A    ret
*}
end;

//00421D8C
function TryEncodeTime(Hour:Word; Min:Word; Sec:Word; MSec:Word; var Time:TDateTime):Boolean;
begin
{*
 00421D8C    push        ebp
 00421D8D    mov         ebp,esp
 00421D8F    add         esp,0FFFFFFF4
 00421D92    push        esi
 00421D93    mov         esi,dword ptr [ebp+0C]
 00421D96    mov         byte ptr [ebp-1],0
 00421D9A    cmp         ax,18
>00421D9E    jae         00421DF6
 00421DA0    cmp         dx,3C
>00421DA4    jae         00421DF6
 00421DA6    cmp         cx,3C
>00421DAA    jae         00421DF6
 00421DAC    cmp         si,3E8
>00421DB1    jae         00421DF6
 00421DB3    movzx       eax,ax
 00421DB6    imul        eax,eax,36EE80
 00421DBC    movzx       edx,dx
 00421DBF    imul        edx,edx,3C
 00421DC2    imul        edx,edx,3E8
 00421DC8    add         eax,edx
 00421DCA    movzx       edx,cx
 00421DCD    imul        edx,edx,3E8
 00421DD3    add         eax,edx
 00421DD5    movzx       edx,si
 00421DD8    add         eax,edx
 00421DDA    mov         dword ptr [ebp-0C],eax
 00421DDD    mov         dword ptr [ebp-8],0A955A
 00421DE4    lea         eax,[ebp-0C]
 00421DE7    call        TimeStampToDateTime
 00421DEC    mov         eax,dword ptr [ebp+8]
 00421DEF    fstp        qword ptr [eax]
 00421DF1    wait
 00421DF2    mov         byte ptr [ebp-1],1
 00421DF6    movzx       eax,byte ptr [ebp-1]
 00421DFA    pop         esi
 00421DFB    mov         esp,ebp
 00421DFD    pop         ebp
 00421DFE    ret         8
*}
end;

//00421E04
function EncodeTime(Hour:Word; Min:Word; Sec:Word; MSec:Word):TDateTime;
begin
{*
 00421E04    push        ebp
 00421E05    mov         ebp,esp
 00421E07    add         esp,0FFFFFFF8
 00421E0A    push        ebx
 00421E0B    push        esi
 00421E0C    push        edi
 00421E0D    mov         edi,ecx
 00421E0F    mov         esi,edx
 00421E11    mov         ebx,eax
 00421E13    movzx       eax,word ptr [ebp+8]
 00421E17    push        eax
 00421E18    lea         eax,[ebp-8]
 00421E1B    push        eax
 00421E1C    mov         ecx,edi
 00421E1E    mov         edx,esi
 00421E20    mov         eax,ebx
 00421E22    call        TryEncodeTime
 00421E27    test        al,al
>00421E29    jne         00421E35
 00421E2B    mov         eax,[0078D2E0];^SResString169:TResStringRec
 00421E30    call        ConvertError
 00421E35    fld         qword ptr [ebp-8]
 00421E38    pop         edi
 00421E39    pop         esi
 00421E3A    pop         ebx
 00421E3B    pop         ecx
 00421E3C    pop         ecx
 00421E3D    pop         ebp
 00421E3E    ret         4
*}
end;

//00421E44
procedure DecodeTime(var Hour:Word; var Min:Word; var Sec:Word; const DateTime:TDateTime; var MSec:Word);
begin
{*
 00421E44    push        ebp
 00421E45    mov         ebp,esp
 00421E47    add         esp,0FFFFFFF4
 00421E4A    push        ebx
 00421E4B    push        esi
 00421E4C    push        edi
 00421E4D    mov         edi,ecx
 00421E4F    mov         esi,edx
 00421E51    mov         ebx,eax
 00421E53    lea         eax,[ebp-4]
 00421E56    push        eax
 00421E57    push        dword ptr [ebp+10]
 00421E5A    push        dword ptr [ebp+0C]
 00421E5D    lea         eax,[ebp-0C]
 00421E60    call        DateTimeToTimeStamp
 00421E65    mov         eax,dword ptr [ebp-0C]
 00421E68    lea         ecx,[ebp-2]
 00421E6B    mov         dx,0EA60
 00421E6F    call        DivMod
 00421E74    push        esi
 00421E75    mov         ecx,ebx
 00421E77    movzx       eax,word ptr [ebp-2]
 00421E7B    mov         dx,3C
 00421E7F    call        DivMod
 00421E84    mov         eax,dword ptr [ebp+8]
 00421E87    push        eax
 00421E88    mov         ecx,edi
 00421E8A    movzx       eax,word ptr [ebp-4]
 00421E8E    mov         dx,3E8
 00421E92    call        DivMod
 00421E97    pop         edi
 00421E98    pop         esi
 00421E99    pop         ebx
 00421E9A    mov         esp,ebp
 00421E9C    pop         ebp
 00421E9D    ret         0C
*}
end;

//00421EA0
function IsLeapYear(Year:Word):Boolean;
begin
{*
 00421EA0    push        ebx
 00421EA1    push        esi
 00421EA2    mov         ecx,eax
 00421EA4    movzx       eax,cx
 00421EA7    and         eax,3
 00421EAA    test        eax,eax
>00421EAC    jne         00421ECF
 00421EAE    movzx       ebx,cx
 00421EB1    mov         eax,ebx
 00421EB3    mov         esi,64
 00421EB8    xor         edx,edx
 00421EBA    div         eax,esi
 00421EBC    test        edx,edx
>00421EBE    jne         00421ED4
 00421EC0    mov         eax,ebx
 00421EC2    mov         ecx,190
 00421EC7    xor         edx,edx
 00421EC9    div         eax,ecx
 00421ECB    test        edx,edx
>00421ECD    je          00421ED4
 00421ECF    xor         eax,eax
 00421ED1    pop         esi
 00421ED2    pop         ebx
 00421ED3    ret
 00421ED4    mov         al,1
 00421ED6    pop         esi
 00421ED7    pop         ebx
 00421ED8    ret
*}
end;

//00421EDC
function TryEncodeDate(Year:Word; Month:Word; Day:Word; var Date:TDateTime):Boolean;
begin
{*
 00421EDC    push        ebp
 00421EDD    mov         ebp,esp
 00421EDF    add         esp,0FFFFFFF8
 00421EE2    push        ebx
 00421EE3    push        esi
 00421EE4    push        edi
 00421EE5    mov         ebx,ecx
 00421EE7    mov         edi,edx
 00421EE9    mov         word ptr [ebp-2],ax
 00421EED    mov         byte ptr [ebp-3],0
 00421EF1    movzx       eax,word ptr [ebp-2]
 00421EF5    call        IsLeapYear
 00421EFA    and         eax,7F
 00421EFD    lea         eax,[eax+eax*2]
 00421F00    lea         esi,[eax*8+784C90];gvar_00784C90
 00421F07    cmp         word ptr [ebp-2],1
>00421F0C    jb          00421F98
 00421F12    cmp         word ptr [ebp-2],270F
>00421F18    ja          00421F98
 00421F1A    cmp         di,1
>00421F1E    jb          00421F98
 00421F20    cmp         di,0C
>00421F24    ja          00421F98
 00421F26    cmp         bx,1
>00421F2A    jb          00421F98
 00421F2C    movzx       eax,di
 00421F2F    cmp         bx,word ptr [esi+eax*2-2]
>00421F34    ja          00421F98
 00421F36    movzx       eax,di
 00421F39    dec         eax
 00421F3A    test        eax,eax
>00421F3C    jle         00421F4C
 00421F3E    mov         ecx,1
 00421F43    add         bx,word ptr [esi+ecx*2-2]
 00421F48    inc         ecx
 00421F49    dec         eax
>00421F4A    jne         00421F43
 00421F4C    movzx       ecx,word ptr [ebp-2]
 00421F50    dec         ecx
 00421F51    mov         eax,ecx
 00421F53    mov         esi,64
 00421F58    cdq
 00421F59    idiv        eax,esi
 00421F5B    imul        esi,ecx,16D
 00421F61    mov         edx,ecx
 00421F63    test        edx,edx
>00421F65    jns         00421F6A
 00421F67    add         edx,3
 00421F6A    sar         edx,2
 00421F6D    add         esi,edx
 00421F6F    sub         esi,eax
 00421F71    mov         eax,ecx
 00421F73    mov         ecx,190
 00421F78    cdq
 00421F79    idiv        eax,ecx
 00421F7B    add         esi,eax
 00421F7D    movzx       eax,bx
 00421F80    add         esi,eax
 00421F82    sub         esi,0A955A
 00421F88    mov         dword ptr [ebp-8],esi
 00421F8B    fild        dword ptr [ebp-8]
 00421F8E    mov         eax,dword ptr [ebp+8]
 00421F91    fstp        qword ptr [eax]
 00421F93    wait
 00421F94    mov         byte ptr [ebp-3],1
 00421F98    movzx       eax,byte ptr [ebp-3]
 00421F9C    pop         edi
 00421F9D    pop         esi
 00421F9E    pop         ebx
 00421F9F    pop         ecx
 00421FA0    pop         ecx
 00421FA1    pop         ebp
 00421FA2    ret         4
*}
end;

//00421FA8
function EncodeDate(Year:Word; Month:Word; Day:Word):TDateTime;
begin
{*
 00421FA8    push        ebx
 00421FA9    push        esi
 00421FAA    push        edi
 00421FAB    add         esp,0FFFFFFF8
 00421FAE    mov         edi,ecx
 00421FB0    mov         esi,edx
 00421FB2    mov         ebx,eax
 00421FB4    push        esp
 00421FB5    mov         ecx,edi
 00421FB7    mov         edx,esi
 00421FB9    mov         eax,ebx
 00421FBB    call        TryEncodeDate
 00421FC0    test        al,al
>00421FC2    jne         00421FCE
 00421FC4    mov         eax,[0078D664];^SResString3:TResStringRec
 00421FC9    call        ConvertError
 00421FCE    fld         qword ptr [esp]
 00421FD1    pop         ecx
 00421FD2    pop         edx
 00421FD3    pop         edi
 00421FD4    pop         esi
 00421FD5    pop         ebx
 00421FD6    ret
*}
end;

//00421FD8
function DecodeDateFully(var Year:Word; var Month:Word; var Day:Word; const DateTime:TDateTime; var DOW:Word):Boolean;
begin
{*
 00421FD8    push        ebp
 00421FD9    mov         ebp,esp
 00421FDB    add         esp,0FFFFFFE8
 00421FDE    push        ebx
 00421FDF    push        esi
 00421FE0    mov         dword ptr [ebp-0C],ecx
 00421FE3    mov         dword ptr [ebp-8],edx
 00421FE6    mov         dword ptr [ebp-4],eax
 00421FE9    mov         ebx,dword ptr [ebp+8]
 00421FEC    push        dword ptr [ebp+10]
 00421FEF    push        dword ptr [ebp+0C]
 00421FF2    lea         eax,[ebp-18]
 00421FF5    call        DateTimeToTimeStamp
 00421FFA    mov         ecx,dword ptr [ebp-14]
 00421FFD    test        ecx,ecx
>00421FFF    jg          00422025
 00422001    mov         eax,dword ptr [ebp-4]
 00422004    mov         word ptr [eax],0
 00422009    mov         eax,dword ptr [ebp-8]
 0042200C    mov         word ptr [eax],0
 00422011    mov         eax,dword ptr [ebp-0C]
 00422014    mov         word ptr [eax],0
 00422019    mov         word ptr [ebx],0
 0042201E    xor         edx,edx
>00422020    jmp         00422117
 00422025    mov         eax,ecx
 00422027    mov         esi,7
 0042202C    cdq
 0042202D    idiv        eax,esi
 0042202F    inc         edx
 00422030    mov         word ptr [ebx],dx
 00422033    dec         ecx
 00422034    mov         bx,1
 00422038    cmp         ecx,23AB1
>0042203E    jl          00422053
 00422040    sub         ecx,23AB1
 00422046    add         bx,190
 0042204B    cmp         ecx,23AB1
>00422051    jge         00422040
 00422053    lea         eax,[ebp-0E]
 00422056    push        eax
 00422057    lea         eax,[ebp-10]
 0042205A    mov         dx,8EAC
 0042205E    xchg        eax,ecx
 0042205F    call        DivMod
 00422064    cmp         word ptr [ebp-10],4
>00422069    jne         00422075
 0042206B    dec         word ptr [ebp-10]
 0042206F    add         word ptr [ebp-0E],8EAC
 00422075    imul        ax,word ptr [ebp-10],64
 0042207A    add         bx,ax
 0042207D    lea         eax,[ebp-0E]
 00422080    push        eax
 00422081    lea         ecx,[ebp-10]
 00422084    movzx       eax,word ptr [ebp-0E]
 00422088    mov         dx,5B5
 0042208C    call        DivMod
 00422091    movzx       eax,word ptr [ebp-10]
 00422095    add         eax,eax
 00422097    add         eax,eax
 00422099    add         bx,ax
 0042209C    lea         eax,[ebp-0E]
 0042209F    push        eax
 004220A0    lea         ecx,[ebp-10]
 004220A3    movzx       eax,word ptr [ebp-0E]
 004220A7    mov         dx,16D
 004220AB    call        DivMod
 004220B0    cmp         word ptr [ebp-10],4
>004220B5    jne         004220C1
 004220B7    dec         word ptr [ebp-10]
 004220BB    add         word ptr [ebp-0E],16D
 004220C1    add         bx,word ptr [ebp-10]
 004220C5    mov         eax,ebx
 004220C7    call        IsLeapYear
 004220CC    mov         edx,eax
 004220CE    movzx       eax,dl
 004220D1    lea         eax,[eax+eax*2]
 004220D4    lea         esi,[eax*8+784C90];gvar_00784C90
 004220DB    mov         ax,1
 004220DF    movzx       ecx,ax
 004220E2    movzx       ecx,word ptr [esi+ecx*2-2]
 004220E7    mov         word ptr [ebp-10],cx
 004220EB    movzx       ecx,word ptr [ebp-0E]
 004220EF    cmp         cx,word ptr [ebp-10]
>004220F3    jb          00422100
 004220F5    movzx       ecx,word ptr [ebp-10]
 004220F9    sub         word ptr [ebp-0E],cx
 004220FD    inc         eax
>004220FE    jmp         004220DF
 00422100    mov         ecx,dword ptr [ebp-4]
 00422103    mov         word ptr [ecx],bx
 00422106    mov         ecx,dword ptr [ebp-8]
 00422109    mov         word ptr [ecx],ax
 0042210C    movzx       eax,word ptr [ebp-0E]
 00422110    inc         eax
 00422111    mov         ecx,dword ptr [ebp-0C]
 00422114    mov         word ptr [ecx],ax
 00422117    mov         eax,edx
 00422119    pop         esi
 0042211A    pop         ebx
 0042211B    mov         esp,ebp
 0042211D    pop         ebp
 0042211E    ret         0C
*}
end;

//00422124
procedure DecodeDate(var Year:Word; var Month:Word; var Day:Word; const DateTime:TDateTime);
begin
{*
 00422124    push        ebp
 00422125    mov         ebp,esp
 00422127    push        ecx
 00422128    push        esi
 00422129    mov         esi,eax
 0042212B    push        dword ptr [ebp+0C]
 0042212E    push        dword ptr [ebp+8]
 00422131    lea         eax,[ebp-2]
 00422134    push        eax
 00422135    mov         eax,esi
 00422137    call        DecodeDateFully
 0042213C    pop         esi
 0042213D    pop         ecx
 0042213E    pop         ebp
 0042213F    ret         8
*}
end;

//00422144
function DayOfWeek(const DateTime:TDateTime):Word;
begin
{*
 00422144    push        ebp
 00422145    mov         ebp,esp
 00422147    add         esp,0FFFFFFF8
 0042214A    push        dword ptr [ebp+0C]
 0042214D    push        dword ptr [ebp+8]
 00422150    lea         eax,[ebp-8]
 00422153    call        DateTimeToTimeStamp
 00422158    mov         eax,dword ptr [ebp-4]
 0042215B    mov         ecx,7
 00422160    cdq
 00422161    idiv        eax,ecx
 00422163    mov         eax,edx
 00422165    inc         eax
 00422166    pop         ecx
 00422167    pop         ecx
 00422168    pop         ebp
 00422169    ret         8
*}
end;

//0042216C
function Date:TDateTime;
begin
{*
 0042216C    add         esp,0FFFFFFE8
 0042216F    lea         eax,[esp+8]
 00422173    push        eax
 00422174    call        kernel32.GetLocalTime
 00422179    movzx       ecx,word ptr [esp+0E]
 0042217E    movzx       edx,word ptr [esp+0A]
 00422183    movzx       eax,word ptr [esp+8]
 00422188    call        EncodeDate
 0042218D    fstp        qword ptr [esp]
 00422190    wait
 00422191    fld         qword ptr [esp]
 00422194    add         esp,18
 00422197    ret
*}
end;

//00422198
function Time:TDateTime;
begin
{*
 00422198    add         esp,0FFFFFFE8
 0042219B    lea         eax,[esp+8]
 0042219F    push        eax
 004221A0    call        kernel32.GetLocalTime
 004221A5    movzx       eax,word ptr [esp+16]
 004221AA    push        eax
 004221AB    movzx       ecx,word ptr [esp+18]
 004221B0    movzx       edx,word ptr [esp+16]
 004221B5    movzx       eax,word ptr [esp+14]
 004221BA    call        EncodeTime
 004221BF    fstp        qword ptr [esp]
 004221C2    wait
 004221C3    fld         qword ptr [esp]
 004221C6    add         esp,18
 004221C9    ret
*}
end;

//004221CC
function Now:TDateTime;
begin
{*
 004221CC    add         esp,0FFFFFFE0
 004221CF    lea         eax,[esp+8]
 004221D3    push        eax
 004221D4    call        kernel32.GetLocalTime
 004221D9    movzx       ecx,word ptr [esp+0E]
 004221DE    movzx       edx,word ptr [esp+0A]
 004221E3    movzx       eax,word ptr [esp+8]
 004221E8    call        EncodeDate
 004221ED    fstp        qword ptr [esp+18]
 004221F1    wait
 004221F2    movzx       eax,word ptr [esp+16]
 004221F7    push        eax
 004221F8    movzx       ecx,word ptr [esp+18]
 004221FD    movzx       edx,word ptr [esp+16]
 00422202    movzx       eax,word ptr [esp+14]
 00422207    call        EncodeTime
 0042220C    fadd        qword ptr [esp+18]
 00422210    fstp        qword ptr [esp]
 00422213    wait
 00422214    fld         qword ptr [esp]
 00422217    add         esp,20
 0042221A    ret
*}
end;

//0042221C
function CurrentYear:Word;
begin
{*
 0042221C    add         esp,0FFFFFFF0
 0042221F    push        esp
 00422220    call        kernel32.GetLocalTime
 00422225    movzx       eax,word ptr [esp]
 00422229    add         esp,10
 0042222C    ret
*}
end;

//00422230
procedure DateTimeToString(var Result:UnicodeString; const Format:UnicodeString; DateTime:TDateTime);
begin
{*
 00422230    push        ebp
 00422231    mov         ebp,esp
 00422233    push        dword ptr [ebp+0C]
 00422236    push        dword ptr [ebp+8]
 00422239    mov         ecx,790CDC;gvar_00790CDC:TFormatSettings
 0042223E    call        DateTimeToString
 00422243    pop         ebp
 00422244    ret         8
*}
end;

//00422248
procedure AppendChars(P:PChar; Count:Integer);
begin
{*
 00422248    push        ebp
 00422249    mov         ebp,esp
 0042224B    push        ebx
 0042224C    mov         ecx,dword ptr [ebp+8]
 0042224F    mov         ebx,200
 00422254    sub         ebx,dword ptr [ecx-204]
 0042225A    cmp         edx,ebx
>0042225C    jge         00422260
 0042225E    mov         ebx,edx
 00422260    test        ebx,ebx
>00422262    je          00422280
 00422264    mov         edx,dword ptr [ebp+8]
 00422267    mov         edx,dword ptr [edx-204]
 0042226D    mov         ecx,dword ptr [ebp+8]
 00422270    lea         edx,[ecx+edx*2-200]
 00422277    mov         ecx,ebx
 00422279    add         ecx,ecx
 0042227B    call        Move
 00422280    mov         eax,dword ptr [ebp+8]
 00422283    add         dword ptr [eax-204],ebx
 00422289    pop         ebx
 0042228A    pop         ebp
 0042228B    ret
*}
end;

//0042228C
procedure AppendString(const S:UnicodeString);
begin
{*
 0042228C    push        ebp
 0042228D    mov         ebp,esp
 0042228F    mov         edx,eax
 00422291    test        edx,edx
>00422293    je          0042229A
 00422295    sub         edx,4
 00422298    mov         edx,dword ptr [edx]
 0042229A    mov         ecx,dword ptr [ebp+8]
 0042229D    push        ecx
 0042229E    call        AppendChars
 004222A3    pop         ecx
 004222A4    pop         ebp
 004222A5    ret
*}
end;

//004222A8
procedure AppendNumber(Number:Integer; Digits:Integer);
begin
{*
 004222A8    push        ebp
 004222A9    mov         ebp,esp
 004222AB    add         esp,0FFFFFFD0
 004222AE    push        ebx
 004222AF    push        esi
 004222B0    mov         esi,edx
 004222B2    mov         ebx,eax
 004222B4    mov         eax,dword ptr [ebp+8]
 004222B7    push        eax
 004222B8    push        4
 004222BA    mov         dword ptr [ebp-30],esi
 004222BD    mov         byte ptr [ebp-2C],0
 004222C1    mov         dword ptr [ebp-28],ebx
 004222C4    mov         byte ptr [ebp-24],0
 004222C8    lea         eax,[ebp-30]
 004222CB    push        eax
 004222CC    push        1
 004222CE    mov         ecx,784D5C
 004222D3    lea         eax,[ebp-20]
 004222D6    mov         edx,10
 004222DB    call        FormatBuf
 004222E0    mov         edx,eax
 004222E2    lea         eax,[ebp-20]
 004222E5    call        AppendChars
 004222EA    pop         ecx
 004222EB    pop         esi
 004222EC    pop         ebx
 004222ED    mov         esp,ebp
 004222EF    pop         ebp
 004222F0    ret
*}
end;

//004222F4
procedure GetCount;
begin
{*
 004222F4    push        ebp
 004222F5    mov         ebp,esp
 004222F7    push        ebx
 004222F8    mov         eax,dword ptr [ebp+8]
 004222FB    add         eax,0FFFFFFEC
 004222FE    mov         edx,dword ptr [eax]
>00422300    jmp         00422305
 00422302    add         dword ptr [eax],2
 00422305    mov         ecx,dword ptr [eax]
 00422307    movzx       ecx,word ptr [ecx]
 0042230A    mov         ebx,dword ptr [ebp+8]
 0042230D    cmp         cx,word ptr [ebx-16]
>00422311    je          00422302
 00422313    mov         eax,dword ptr [eax]
 00422315    sub         eax,edx
 00422317    sar         eax,1
>00422319    jns         0042231E
 0042231B    adc         eax,0
 0042231E    inc         eax
 0042231F    mov         edx,dword ptr [ebp+8]
 00422322    mov         dword ptr [edx-1C],eax
 00422325    pop         ebx
 00422326    pop         ebp
 00422327    ret
*}
end;

//00422328
procedure GetDate;
begin
{*
 00422328    push        ebp
 00422329    mov         ebp,esp
 0042232B    mov         eax,dword ptr [ebp+8]
 0042232E    cmp         byte ptr [eax-1D],0
>00422332    jne         0042235E
 00422334    mov         eax,dword ptr [ebp+8]
 00422337    mov         eax,dword ptr [eax+8]
 0042233A    push        dword ptr [eax+0C]
 0042233D    push        dword ptr [eax+8]
 00422340    mov         eax,dword ptr [ebp+8]
 00422343    lea         ecx,[eax-6]
 00422346    mov         eax,dword ptr [ebp+8]
 00422349    lea         edx,[eax-4]
 0042234C    mov         eax,dword ptr [ebp+8]
 0042234F    add         eax,0FFFFFFFE
 00422352    call        DecodeDate
 00422357    mov         eax,dword ptr [ebp+8]
 0042235A    mov         byte ptr [eax-1D],1
 0042235E    pop         ebp
 0042235F    ret
*}
end;

//00422360
procedure GetTime;
begin
{*
 00422360    push        ebp
 00422361    mov         ebp,esp
 00422363    mov         eax,dword ptr [ebp+8]
 00422366    cmp         byte ptr [eax-1E],0
>0042236A    jne         0042239D
 0042236C    mov         eax,dword ptr [ebp+8]
 0042236F    mov         eax,dword ptr [eax+8]
 00422372    push        dword ptr [eax+0C]
 00422375    push        dword ptr [eax+8]
 00422378    mov         eax,dword ptr [ebp+8]
 0042237B    add         eax,0FFFFFFF2
 0042237E    push        eax
 0042237F    mov         eax,dword ptr [ebp+8]
 00422382    lea         ecx,[eax-0C]
 00422385    mov         eax,dword ptr [ebp+8]
 00422388    lea         edx,[eax-0A]
 0042238B    mov         eax,dword ptr [ebp+8]
 0042238E    add         eax,0FFFFFFF8
 00422391    call        DecodeTime
 00422396    mov         eax,dword ptr [ebp+8]
 00422399    mov         byte ptr [eax-1E],1
 0042239D    pop         ebp
 0042239E    ret
*}
end;

//004223A0
function ConvertEraString(const Count:Integer):UnicodeString;
begin
{*
 004223A0    push        ebp
 004223A1    mov         ebp,esp
 004223A3    add         esp,0FFFFFDE4
 004223A9    push        ebx
 004223AA    push        esi
 004223AB    xor         ecx,ecx
 004223AD    mov         dword ptr [ebp-21C],ecx
 004223B3    mov         dword ptr [ebp-4],ecx
 004223B6    mov         ebx,edx
 004223B8    mov         esi,eax
 004223BA    xor         eax,eax
 004223BC    push        ebp
 004223BD    push        422506
 004223C2    push        dword ptr fs:[eax]
 004223C5    mov         dword ptr fs:[eax],esp
 004223C8    mov         eax,ebx
 004223CA    call        @UStrClr
 004223CF    mov         eax,dword ptr [ebp+8]
 004223D2    movzx       eax,word ptr [eax-2]
 004223D6    mov         word ptr [ebp-14],ax
 004223DA    mov         eax,dword ptr [ebp+8]
 004223DD    movzx       eax,word ptr [eax-4]
 004223E1    mov         word ptr [ebp-12],ax
 004223E5    mov         eax,dword ptr [ebp+8]
 004223E8    movzx       eax,word ptr [eax-6]
 004223EC    mov         word ptr [ebp-0E],ax
 004223F0    lea         eax,[ebp-4]
 004223F3    mov         edx,422520;'gg'
 004223F8    call        @UStrLAsg
 004223FD    push        200
 00422402    lea         eax,[ebp-214]
 00422408    push        eax
 00422409    mov         eax,dword ptr [ebp-4]
 0042240C    call        @UStrToPWChar
 00422411    push        eax
 00422412    lea         eax,[ebp-14]
 00422415    push        eax
 00422416    push        4
 00422418    call        kernel32.GetThreadLocale
 0042241D    push        eax
 0042241E    call        kernel32.GetDateFormatW
 00422423    test        eax,eax
>00422425    je          004224E5
 0042242B    mov         eax,ebx
 0042242D    lea         edx,[ebp-214]
 00422433    mov         ecx,100
 00422438    call        @UStrFromWArray
 0042243D    dec         esi
>0042243E    jne         004224E5
 00422444    mov         eax,[00790DA3]
 00422449    sub         eax,4
>0042244C    je          00422474
 0042244E    sub         eax,0D
>00422451    jne         004224E5
 00422457    push        ebx
 00422458    mov         eax,dword ptr [ebx]
 0042245A    mov         edx,1
 0042245F    call        CharToByteLen
 00422464    mov         ecx,eax
 00422466    mov         eax,dword ptr [ebx]
 00422468    mov         edx,1
 0042246D    call        @UStrCopy
>00422472    jmp         004224E5
 00422474    cmp         dword ptr ds:[790DA7],1
>0042247B    jne         004224E5
 0042247D    mov         eax,dword ptr [ebx]
 0042247F    mov         dword ptr [ebp-218],eax
 00422485    mov         esi,dword ptr [ebp-218]
 0042248B    test        esi,esi
>0042248D    je          00422494
 0042248F    sub         esi,4
 00422492    mov         esi,dword ptr [esi]
 00422494    mov         eax,dword ptr [ebx]
 00422496    mov         edx,esi
 00422498    call        ByteToCharLen
 0042249D    cmp         eax,4
>004224A0    jne         004224E5
 004224A2    mov         eax,dword ptr [ebx]
 004224A4    mov         edx,3
 004224A9    call        CharToByteIndex
 004224AE    mov         esi,eax
 004224B0    add         esi,esi
 004224B2    lea         eax,[ebp-214]
 004224B8    add         esi,eax
 004224BA    sub         esi,2
 004224BD    lea         eax,[ebp-21C]
 004224C3    mov         edx,esi
 004224C5    call        @UStrFromPWChar
 004224CA    mov         eax,dword ptr [ebp-21C]
 004224D0    mov         edx,2
 004224D5    call        CharToByteLen
 004224DA    mov         ecx,eax
 004224DC    mov         eax,ebx
 004224DE    mov         edx,esi
 004224E0    call        @UStrFromPWCharLen
 004224E5    xor         eax,eax
 004224E7    pop         edx
 004224E8    pop         ecx
 004224E9    pop         ecx
 004224EA    mov         dword ptr fs:[eax],edx
 004224ED    push        42250D
 004224F2    lea         eax,[ebp-21C]
 004224F8    call        @UStrClr
 004224FD    lea         eax,[ebp-4]
 00422500    call        @UStrClr
 00422505    ret
>00422506    jmp         @HandleFinally
>0042250B    jmp         004224F2
 0042250D    pop         esi
 0042250E    pop         ebx
 0042250F    mov         esp,ebp
 00422511    pop         ebp
 00422512    ret
*}
end;

//00422528
function ConvertYearString(const Count:Integer):UnicodeString;
begin
{*
 00422528    push        ebp
 00422529    mov         ebp,esp
 0042252B    add         esp,0FFFFFDE8
 00422531    push        ebx
 00422532    push        esi
 00422533    xor         ecx,ecx
 00422535    mov         dword ptr [ebp-4],ecx
 00422538    mov         ebx,edx
 0042253A    mov         esi,eax
 0042253C    xor         eax,eax
 0042253E    push        ebp
 0042253F    push        422617
 00422544    push        dword ptr fs:[eax]
 00422547    mov         dword ptr fs:[eax],esp
 0042254A    mov         eax,ebx
 0042254C    call        @UStrClr
 00422551    mov         eax,dword ptr [ebp+8]
 00422554    movzx       eax,word ptr [eax-2]
 00422558    mov         word ptr [ebp-14],ax
 0042255C    mov         eax,dword ptr [ebp+8]
 0042255F    movzx       eax,word ptr [eax-4]
 00422563    mov         word ptr [ebp-12],ax
 00422567    mov         eax,dword ptr [ebp+8]
 0042256A    movzx       eax,word ptr [eax-6]
 0042256E    mov         word ptr [ebp-0E],ax
 00422572    cmp         esi,2
>00422575    jg          00422586
 00422577    lea         eax,[ebp-4]
 0042257A    mov         edx,422630;'yy'
 0042257F    call        @UStrLAsg
>00422584    jmp         00422593
 00422586    lea         eax,[ebp-4]
 00422589    mov         edx,422644;'yyyy'
 0042258E    call        @UStrLAsg
 00422593    push        200
 00422598    lea         eax,[ebp-214]
 0042259E    push        eax
 0042259F    mov         eax,dword ptr [ebp-4]
 004225A2    call        @UStrToPWChar
 004225A7    push        eax
 004225A8    lea         eax,[ebp-14]
 004225AB    push        eax
 004225AC    push        4
 004225AE    call        kernel32.GetThreadLocale
 004225B3    push        eax
 004225B4    call        kernel32.GetDateFormatW
 004225B9    test        eax,eax
>004225BB    je          00422601
 004225BD    mov         eax,ebx
 004225BF    lea         edx,[ebp-214]
 004225C5    mov         ecx,100
 004225CA    call        @UStrFromWArray
 004225CF    dec         esi
>004225D0    jne         00422601
 004225D2    mov         eax,dword ptr [ebx]
 004225D4    cmp         word ptr [eax],30
>004225D8    jne         00422601
 004225DA    mov         eax,dword ptr [ebx]
 004225DC    mov         dword ptr [ebp-218],eax
 004225E2    mov         esi,dword ptr [ebp-218]
 004225E8    test        esi,esi
>004225EA    je          004225F1
 004225EC    sub         esi,4
 004225EF    mov         esi,dword ptr [esi]
 004225F1    push        ebx
 004225F2    mov         ecx,esi
 004225F4    dec         ecx
 004225F5    mov         eax,dword ptr [ebx]
 004225F7    mov         edx,2
 004225FC    call        @UStrCopy
 00422601    xor         eax,eax
 00422603    pop         edx
 00422604    pop         ecx
 00422605    pop         ecx
 00422606    mov         dword ptr fs:[eax],edx
 00422609    push        42261E
 0042260E    lea         eax,[ebp-4]
 00422611    call        @UStrClr
 00422616    ret
>00422617    jmp         @HandleFinally
>0042261C    jmp         0042260E
 0042261E    pop         esi
 0042261F    pop         ebx
 00422620    mov         esp,ebp
 00422622    pop         ebp
 00422623    ret
*}
end;

//00422650
procedure AppendFormat(Format:PChar);
begin
{*
 00422650    push        ebp
 00422651    mov         ebp,esp
 00422653    add         esp,0FFFFFFD4
 00422656    push        ebx
 00422657    push        esi
 00422658    push        edi
 00422659    xor         edx,edx
 0042265B    mov         dword ptr [ebp-2C],edx
 0042265E    mov         dword ptr [ebp-28],edx
 00422661    mov         dword ptr [ebp-14],eax
 00422664    xor         eax,eax
 00422666    push        ebp
 00422667    push        422EA4
 0042266C    push        dword ptr fs:[eax]
 0042266F    mov         dword ptr fs:[eax],esp
 00422672    cmp         dword ptr [ebp-14],0
>00422676    je          00422E89
 0042267C    mov         eax,dword ptr [ebp+8]
 0042267F    cmp         dword ptr [eax-208],2
>00422686    jge         00422E89
 0042268C    mov         eax,dword ptr [ebp+8]
 0042268F    inc         dword ptr [eax-208]
 00422695    mov         word ptr [ebp-20],20
 0042269B    mov         byte ptr [ebp-1D],0
 0042269F    mov         byte ptr [ebp-1E],0
 004226A3    mov         byte ptr [ebp-21],0
>004226A7    jmp         00422E71
 004226AC    mov         word ptr [ebp-16],di
 004226B0    cmp         word ptr [ebp-16],0D800
>004226B6    jb          004226F4
 004226B8    cmp         word ptr [ebp-16],0DFFF
>004226BE    ja          004226F4
 004226C0    mov         eax,dword ptr [ebp+8]
 004226C3    push        eax
 004226C4    mov         eax,dword ptr [ebp-14]
 004226C7    call        StrCharLength
 004226CC    mov         edx,eax
 004226CE    sar         edx,1
>004226D0    jns         004226D5
 004226D2    adc         edx,0
 004226D5    mov         eax,dword ptr [ebp-14]
 004226D8    call        AppendChars
 004226DD    pop         ecx
 004226DE    mov         eax,dword ptr [ebp-14]
 004226E1    call        StrNextChar
 004226E6    mov         dword ptr [ebp-14],eax
 004226E9    mov         word ptr [ebp-20],20
>004226EF    jmp         00422E71
 004226F4    mov         eax,dword ptr [ebp-14]
 004226F7    call        StrNextChar
 004226FC    mov         dword ptr [ebp-14],eax
 004226FF    movzx       ebx,word ptr [ebp-16]
 00422703    mov         eax,ebx
 00422705    add         eax,0FFFFFF9F
 00422708    sub         ax,1A
>0042270C    jae         00422712
 0042270E    sub         bx,20
 00422712    mov         eax,ebx
 00422714    add         eax,0FFFFFFBF
 00422717    sub         ax,1A
>0042271B    jae         00422732
 0042271D    cmp         bx,4D
>00422721    jne         0042272E
 00422723    cmp         word ptr [ebp-20],48
>00422728    jne         0042272E
 0042272A    mov         bx,4E
 0042272E    mov         word ptr [ebp-20],bx
 00422732    movzx       eax,bx
 00422735    add         eax,0FFFFFFDE
 00422738    cmp         eax,38
>0042273B    ja          00422E5F
 00422741    movzx       eax,byte ptr [eax+42274F]
 00422748    jmp         dword ptr [eax*4+422788]
 00422748    db          15
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          15
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          13
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          14
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          11
 00422748    db          0
 00422748    db          12
 00422748    db          5
 00422748    db          3
 00422748    db          0
 00422748    db          2
 00422748    db          6
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          4
 00422748    db          7
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          8
 00422748    db          9
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          0
 00422748    db          1
 00422748    db          10
 00422748    dd          00422E5F
 00422748    dd          004227C8
 00422748    dd          00422817
 00422748    dd          00422844
 00422748    dd          00422871
 00422748    dd          004228E2
 00422748    dd          004229B6
 00422748    dd          00422ABD
 00422748    dd          00422AEE
 00422748    dd          00422B1F
 00422748    dd          00422B62
 00422748    dd          00422B93
 00422748    dd          00422D28
 00422748    dd          00422D94
 00422748    dd          00422DC8
 00422748    dd          00422DF9
 004227C8    push        ebp
 004227C9    call        GetCount
 004227CE    pop         ecx
 004227CF    push        ebp
 004227D0    call        GetDate
 004227D5    pop         ecx
 004227D6    cmp         dword ptr [ebp-1C],2
>004227DA    jg          004227FF
 004227DC    mov         eax,dword ptr [ebp+8]
 004227DF    push        eax
 004227E0    movzx       eax,word ptr [ebp-2]
 004227E4    mov         ecx,64
 004227E9    xor         edx,edx
 004227EB    div         eax,ecx
 004227ED    mov         eax,edx
 004227EF    mov         edx,2
 004227F4    call        AppendNumber
 004227F9    pop         ecx
>004227FA    jmp         00422E71
 004227FF    mov         eax,dword ptr [ebp+8]
 00422802    push        eax
 00422803    movzx       eax,word ptr [ebp-2]
 00422807    mov         edx,4
 0042280C    call        AppendNumber
 00422811    pop         ecx
>00422812    jmp         00422E71
 00422817    push        ebp
 00422818    call        GetCount
 0042281D    pop         ecx
 0042281E    push        ebp
 0042281F    call        GetDate
 00422824    pop         ecx
 00422825    mov         eax,dword ptr [ebp+8]
 00422828    push        eax
 00422829    push        ebp
 0042282A    lea         edx,[ebp-28]
 0042282D    mov         eax,dword ptr [ebp-1C]
 00422830    call        ConvertEraString
 00422835    pop         ecx
 00422836    mov         eax,dword ptr [ebp-28]
 00422839    call        AppendString
 0042283E    pop         ecx
>0042283F    jmp         00422E71
 00422844    push        ebp
 00422845    call        GetCount
 0042284A    pop         ecx
 0042284B    push        ebp
 0042284C    call        GetDate
 00422851    pop         ecx
 00422852    mov         eax,dword ptr [ebp+8]
 00422855    push        eax
 00422856    push        ebp
 00422857    lea         edx,[ebp-2C]
 0042285A    mov         eax,dword ptr [ebp-1C]
 0042285D    call        ConvertYearString
 00422862    pop         ecx
 00422863    mov         eax,dword ptr [ebp-2C]
 00422866    call        AppendString
 0042286B    pop         ecx
>0042286C    jmp         00422E71
 00422871    push        ebp
 00422872    call        GetCount
 00422877    pop         ecx
 00422878    push        ebp
 00422879    call        GetDate
 0042287E    pop         ecx
 0042287F    mov         eax,dword ptr [ebp-1C]
 00422882    dec         eax
 00422883    sub         eax,2
>00422886    jb          0042288C
>00422888    je          004228A2
>0042288A    jmp         004228C2
 0042288C    mov         eax,dword ptr [ebp+8]
 0042288F    push        eax
 00422890    movzx       eax,word ptr [ebp-4]
 00422894    mov         edx,dword ptr [ebp-1C]
 00422897    call        AppendNumber
 0042289C    pop         ecx
>0042289D    jmp         00422E71
 004228A2    mov         eax,dword ptr [ebp+8]
 004228A5    push        eax
 004228A6    movzx       eax,word ptr [ebp-4]
 004228AA    mov         edx,dword ptr [ebp+8]
 004228AD    mov         edx,dword ptr [edx-20C]
 004228B3    mov         eax,dword ptr [edx+eax*4+20]
 004228B7    call        AppendString
 004228BC    pop         ecx
>004228BD    jmp         00422E71
 004228C2    mov         eax,dword ptr [ebp+8]
 004228C5    push        eax
 004228C6    movzx       eax,word ptr [ebp-4]
 004228CA    mov         edx,dword ptr [ebp+8]
 004228CD    mov         edx,dword ptr [edx-20C]
 004228D3    mov         eax,dword ptr [edx+eax*4+50]
 004228D7    call        AppendString
 004228DC    pop         ecx
>004228DD    jmp         00422E71
 004228E2    push        ebp
 004228E3    call        GetCount
 004228E8    pop         ecx
 004228E9    mov         eax,dword ptr [ebp-1C]
 004228EC    dec         eax
 004228ED    sub         eax,2
>004228F0    jb          00422903
>004228F2    je          00422920
 004228F4    dec         eax
>004228F5    je          00422950
 004228F7    dec         eax
>004228F8    je          00422980
>004228FE    jmp         0042299B
 00422903    push        ebp
 00422904    call        GetDate
 00422909    pop         ecx
 0042290A    mov         eax,dword ptr [ebp+8]
 0042290D    push        eax
 0042290E    movzx       eax,word ptr [ebp-6]
 00422912    mov         edx,dword ptr [ebp-1C]
 00422915    call        AppendNumber
 0042291A    pop         ecx
>0042291B    jmp         00422E71
 00422920    mov         eax,dword ptr [ebp+8]
 00422923    push        eax
 00422924    mov         eax,dword ptr [ebp+8]
 00422927    push        dword ptr [eax+0C]
 0042292A    push        dword ptr [eax+8]
 0042292D    call        DayOfWeek
 00422932    movzx       eax,ax
 00422935    mov         edx,dword ptr [ebp+8]
 00422938    mov         edx,dword ptr [edx-20C]
 0042293E    mov         eax,dword ptr [edx+eax*4+80]
 00422945    call        AppendString
 0042294A    pop         ecx
>0042294B    jmp         00422E71
 00422950    mov         eax,dword ptr [ebp+8]
 00422953    push        eax
 00422954    mov         eax,dword ptr [ebp+8]
 00422957    push        dword ptr [eax+0C]
 0042295A    push        dword ptr [eax+8]
 0042295D    call        DayOfWeek
 00422962    movzx       eax,ax
 00422965    mov         edx,dword ptr [ebp+8]
 00422968    mov         edx,dword ptr [edx-20C]
 0042296E    mov         eax,dword ptr [edx+eax*4+9C]
 00422975    call        AppendString
 0042297A    pop         ecx
>0042297B    jmp         00422E71
 00422980    mov         eax,dword ptr [ebp+8]
 00422983    push        eax
 00422984    mov         eax,dword ptr [ebp+8]
 00422987    mov         eax,dword ptr [eax-20C]
 0042298D    mov         eax,dword ptr [eax+0C]
 00422990    call        AppendFormat
 00422995    pop         ecx
>00422996    jmp         00422E71
 0042299B    mov         eax,dword ptr [ebp+8]
 0042299E    push        eax
 0042299F    mov         eax,dword ptr [ebp+8]
 004229A2    mov         eax,dword ptr [eax-20C]
 004229A8    mov         eax,dword ptr [eax+10]
 004229AB    call        AppendFormat
 004229B0    pop         ecx
>004229B1    jmp         00422E71
 004229B6    push        ebp
 004229B7    call        GetCount
 004229BC    pop         ecx
 004229BD    push        ebp
 004229BE    call        GetTime
 004229C3    pop         ecx
 004229C4    mov         byte ptr [ebp-22],0
 004229C8    mov         esi,dword ptr [ebp-14]
>004229CB    jmp         00422A67
 004229D0    cmp         word ptr [esi],0D800
>004229D5    jb          004229E9
 004229D7    cmp         word ptr [esi],0DFFF
>004229DC    ja          004229E9
 004229DE    mov         eax,esi
 004229E0    call        StrNextChar
 004229E5    mov         esi,eax
>004229E7    jmp         00422A67
 004229E9    movzx       eax,word ptr [esi]
 004229EC    cmp         eax,48
>004229EF    jg          00422A04
>004229F1    je          00422A71
 004229F3    sub         eax,22
>004229F6    je          00422A5B
 004229F8    sub         eax,5
>004229FB    je          00422A5B
 004229FD    sub         eax,1A
>00422A00    je          00422A10
>00422A02    jmp         00422A64
 00422A04    sub         eax,61
>00422A07    je          00422A10
 00422A09    sub         eax,7
>00422A0C    je          00422A71
>00422A0E    jmp         00422A64
 00422A10    cmp         byte ptr [ebp-22],0
>00422A14    jne         00422A64
 00422A16    mov         edx,422EB4
 00422A1B    mov         ecx,5
 00422A20    mov         eax,esi
 00422A22    call        StrLIComp
 00422A27    test        eax,eax
>00422A29    je          00422A55
 00422A2B    mov         edx,422EC0
 00422A30    mov         ecx,3
 00422A35    mov         eax,esi
 00422A37    call        StrLIComp
 00422A3C    test        eax,eax
>00422A3E    je          00422A55
 00422A40    mov         edx,422EC8
 00422A45    mov         ecx,4
 00422A4A    mov         eax,esi
 00422A4C    call        StrLIComp
 00422A51    test        eax,eax
>00422A53    jne         00422A71
 00422A55    mov         byte ptr [ebp-21],1
>00422A59    jmp         00422A71
 00422A5B    movzx       eax,byte ptr [ebp-22]
 00422A5F    xor         al,1
 00422A61    mov         byte ptr [ebp-22],al
 00422A64    add         esi,2
 00422A67    cmp         word ptr [esi],0
>00422A6B    jne         004229D0
 00422A71    movzx       eax,word ptr [ebp-8]
 00422A75    mov         word ptr [ebp-24],ax
 00422A79    cmp         byte ptr [ebp-21],0
>00422A7D    je          00422A9A
 00422A7F    cmp         word ptr [ebp-24],0
>00422A84    jne         00422A8E
 00422A86    mov         word ptr [ebp-24],0C
>00422A8C    jmp         00422A9A
 00422A8E    cmp         word ptr [ebp-24],0C
>00422A93    jbe         00422A9A
 00422A95    sub         word ptr [ebp-24],0C
 00422A9A    cmp         dword ptr [ebp-1C],2
>00422A9E    jle         00422AA7
 00422AA0    mov         dword ptr [ebp-1C],2
 00422AA7    mov         eax,dword ptr [ebp+8]
 00422AAA    push        eax
 00422AAB    movzx       eax,word ptr [ebp-24]
 00422AAF    mov         edx,dword ptr [ebp-1C]
 00422AB2    call        AppendNumber
 00422AB7    pop         ecx
>00422AB8    jmp         00422E71
 00422ABD    push        ebp
 00422ABE    call        GetCount
 00422AC3    pop         ecx
 00422AC4    push        ebp
 00422AC5    call        GetTime
 00422ACA    pop         ecx
 00422ACB    cmp         dword ptr [ebp-1C],2
>00422ACF    jle         00422AD8
 00422AD1    mov         dword ptr [ebp-1C],2
 00422AD8    mov         eax,dword ptr [ebp+8]
 00422ADB    push        eax
 00422ADC    movzx       eax,word ptr [ebp-0A]
 00422AE0    mov         edx,dword ptr [ebp-1C]
 00422AE3    call        AppendNumber
 00422AE8    pop         ecx
>00422AE9    jmp         00422E71
 00422AEE    push        ebp
 00422AEF    call        GetCount
 00422AF4    pop         ecx
 00422AF5    push        ebp
 00422AF6    call        GetTime
 00422AFB    pop         ecx
 00422AFC    cmp         dword ptr [ebp-1C],2
>00422B00    jle         00422B09
 00422B02    mov         dword ptr [ebp-1C],2
 00422B09    mov         eax,dword ptr [ebp+8]
 00422B0C    push        eax
 00422B0D    movzx       eax,word ptr [ebp-0C]
 00422B11    mov         edx,dword ptr [ebp-1C]
 00422B14    call        AppendNumber
 00422B19    pop         ecx
>00422B1A    jmp         00422E71
 00422B1F    push        ebp
 00422B20    call        GetCount
 00422B25    pop         ecx
 00422B26    cmp         dword ptr [ebp-1C],1
>00422B2A    jne         00422B47
 00422B2C    mov         eax,dword ptr [ebp+8]
 00422B2F    push        eax
 00422B30    mov         eax,dword ptr [ebp+8]
 00422B33    mov         eax,dword ptr [eax-20C]
 00422B39    mov         eax,dword ptr [eax+1C]
 00422B3C    call        AppendFormat
 00422B41    pop         ecx
>00422B42    jmp         00422E71
 00422B47    mov         eax,dword ptr [ebp+8]
 00422B4A    push        eax
 00422B4B    mov         eax,dword ptr [ebp+8]
 00422B4E    mov         eax,dword ptr [eax-20C]
 00422B54    mov         eax,dword ptr [eax+20]
 00422B57    call        AppendFormat
 00422B5C    pop         ecx
>00422B5D    jmp         00422E71
 00422B62    push        ebp
 00422B63    call        GetCount
 00422B68    pop         ecx
 00422B69    push        ebp
 00422B6A    call        GetTime
 00422B6F    pop         ecx
 00422B70    cmp         dword ptr [ebp-1C],3
>00422B74    jle         00422B7D
 00422B76    mov         dword ptr [ebp-1C],3
 00422B7D    mov         eax,dword ptr [ebp+8]
 00422B80    push        eax
 00422B81    movzx       eax,word ptr [ebp-0E]
 00422B85    mov         edx,dword ptr [ebp-1C]
 00422B88    call        AppendNumber
 00422B8D    pop         ecx
>00422B8E    jmp         00422E71
 00422B93    push        ebp
 00422B94    call        GetTime
 00422B99    pop         ecx
 00422B9A    mov         esi,dword ptr [ebp-14]
 00422B9D    sub         esi,2
 00422BA0    mov         edx,422EB4
 00422BA5    mov         ecx,5
 00422BAA    mov         eax,esi
 00422BAC    call        StrLIComp
 00422BB1    test        eax,eax
>00422BB3    jne         00422BDD
 00422BB5    cmp         word ptr [ebp-8],0C
>00422BBA    jb          00422BBF
 00422BBC    add         esi,6
 00422BBF    mov         eax,dword ptr [ebp+8]
 00422BC2    push        eax
 00422BC3    mov         edx,2
 00422BC8    mov         eax,esi
 00422BCA    call        AppendChars
 00422BCF    pop         ecx
 00422BD0    add         dword ptr [ebp-14],8
 00422BD4    mov         byte ptr [ebp-21],1
>00422BD8    jmp         00422E71
 00422BDD    mov         edx,422EC0
 00422BE2    mov         ecx,3
 00422BE7    mov         eax,esi
 00422BE9    call        StrLIComp
 00422BEE    test        eax,eax
>00422BF0    jne         00422C1A
 00422BF2    cmp         word ptr [ebp-8],0C
>00422BF7    jb          00422BFC
 00422BF9    add         esi,4
 00422BFC    mov         eax,dword ptr [ebp+8]
 00422BFF    push        eax
 00422C00    mov         edx,1
 00422C05    mov         eax,esi
 00422C07    call        AppendChars
 00422C0C    pop         ecx
 00422C0D    add         dword ptr [ebp-14],4
 00422C11    mov         byte ptr [ebp-21],1
>00422C15    jmp         00422E71
 00422C1A    mov         edx,422EC8
 00422C1F    mov         ecx,4
 00422C24    mov         eax,esi
 00422C26    call        StrLIComp
 00422C2B    test        eax,eax
>00422C2D    jne         00422C71
 00422C2F    cmp         word ptr [ebp-8],0C
>00422C34    jae         00422C4E
 00422C36    mov         eax,dword ptr [ebp+8]
 00422C39    push        eax
 00422C3A    mov         eax,dword ptr [ebp+8]
 00422C3D    mov         eax,dword ptr [eax-20C]
 00422C43    mov         eax,dword ptr [eax+14]
 00422C46    call        AppendString
 00422C4B    pop         ecx
>00422C4C    jmp         00422C64
 00422C4E    mov         eax,dword ptr [ebp+8]
 00422C51    push        eax
 00422C52    mov         eax,dword ptr [ebp+8]
 00422C55    mov         eax,dword ptr [eax-20C]
 00422C5B    mov         eax,dword ptr [eax+18]
 00422C5E    call        AppendString
 00422C63    pop         ecx
 00422C64    add         dword ptr [ebp-14],6
 00422C68    mov         byte ptr [ebp-21],1
>00422C6C    jmp         00422E71
 00422C71    mov         edx,422ED4
 00422C76    mov         ecx,4
 00422C7B    mov         eax,esi
 00422C7D    call        StrLIComp
 00422C82    test        eax,eax
>00422C84    jne         00422CC1
 00422C86    push        ebp
 00422C87    call        GetDate
 00422C8C    pop         ecx
 00422C8D    mov         eax,dword ptr [ebp+8]
 00422C90    push        eax
 00422C91    mov         eax,dword ptr [ebp+8]
 00422C94    push        dword ptr [eax+0C]
 00422C97    push        dword ptr [eax+8]
 00422C9A    call        DayOfWeek
 00422C9F    movzx       eax,ax
 00422CA2    mov         edx,dword ptr [ebp+8]
 00422CA5    mov         edx,dword ptr [edx-20C]
 00422CAB    mov         eax,dword ptr [edx+eax*4+9C]
 00422CB2    call        AppendString
 00422CB7    pop         ecx
 00422CB8    add         dword ptr [ebp-14],6
>00422CBC    jmp         00422E71
 00422CC1    mov         edx,422EE0
 00422CC6    mov         ecx,3
 00422CCB    mov         eax,esi
 00422CCD    call        StrLIComp
 00422CD2    test        eax,eax
>00422CD4    jne         00422D11
 00422CD6    push        ebp
 00422CD7    call        GetDate
 00422CDC    pop         ecx
 00422CDD    mov         eax,dword ptr [ebp+8]
 00422CE0    push        eax
 00422CE1    mov         eax,dword ptr [ebp+8]
 00422CE4    push        dword ptr [eax+0C]
 00422CE7    push        dword ptr [eax+8]
 00422CEA    call        DayOfWeek
 00422CEF    movzx       eax,ax
 00422CF2    mov         edx,dword ptr [ebp+8]
 00422CF5    mov         edx,dword ptr [edx-20C]
 00422CFB    mov         eax,dword ptr [edx+eax*4+80]
 00422D02    call        AppendString
 00422D07    pop         ecx
 00422D08    add         dword ptr [ebp-14],4
>00422D0C    jmp         00422E71
 00422D11    mov         eax,dword ptr [ebp+8]
 00422D14    push        eax
 00422D15    lea         eax,[ebp-16]
 00422D18    mov         edx,1
 00422D1D    call        AppendChars
 00422D22    pop         ecx
>00422D23    jmp         00422E71
 00422D28    push        ebp
 00422D29    call        GetCount
 00422D2E    pop         ecx
 00422D2F    mov         eax,dword ptr [ebp+8]
 00422D32    push        eax
 00422D33    mov         eax,dword ptr [ebp+8]
 00422D36    mov         eax,dword ptr [eax-20C]
 00422D3C    mov         eax,dword ptr [eax+0C]
 00422D3F    call        AppendFormat
 00422D44    pop         ecx
 00422D45    push        ebp
 00422D46    call        GetTime
 00422D4B    pop         ecx
 00422D4C    cmp         word ptr [ebp-8],0
>00422D51    jne         00422D65
 00422D53    cmp         word ptr [ebp-0A],0
>00422D58    jne         00422D65
 00422D5A    cmp         word ptr [ebp-0C],0
>00422D5F    je          00422E71
 00422D65    mov         eax,dword ptr [ebp+8]
 00422D68    push        eax
 00422D69    mov         eax,422EE8
 00422D6E    mov         edx,1
 00422D73    call        AppendChars
 00422D78    pop         ecx
 00422D79    mov         eax,dword ptr [ebp+8]
 00422D7C    push        eax
 00422D7D    mov         eax,dword ptr [ebp+8]
 00422D80    mov         eax,dword ptr [eax-20C]
 00422D86    mov         eax,dword ptr [eax+20]
 00422D89    call        AppendFormat
 00422D8E    pop         ecx
>00422D8F    jmp         00422E71
 00422D94    mov         eax,dword ptr [ebp+8]
 00422D97    mov         eax,dword ptr [eax-20C]
 00422D9D    cmp         word ptr [eax+6],0
>00422DA2    je          00422E71
 00422DA8    mov         eax,dword ptr [ebp+8]
 00422DAB    push        eax
 00422DAC    mov         eax,dword ptr [ebp+8]
 00422DAF    mov         eax,dword ptr [eax-20C]
 00422DB5    add         eax,6
 00422DB8    mov         edx,1
 00422DBD    call        AppendChars
 00422DC2    pop         ecx
>00422DC3    jmp         00422E71
 00422DC8    mov         eax,dword ptr [ebp+8]
 00422DCB    mov         eax,dword ptr [eax-20C]
 00422DD1    cmp         word ptr [eax+8],0
>00422DD6    je          00422E71
 00422DDC    mov         eax,dword ptr [ebp+8]
 00422DDF    push        eax
 00422DE0    mov         eax,dword ptr [ebp+8]
 00422DE3    mov         eax,dword ptr [eax-20C]
 00422DE9    add         eax,8
 00422DEC    mov         edx,1
 00422DF1    call        AppendChars
 00422DF6    pop         ecx
>00422DF7    jmp         00422E71
 00422DF9    mov         esi,dword ptr [ebp-14]
>00422DFC    jmp         00422E23
 00422DFE    mov         eax,dword ptr [ebp-14]
 00422E01    cmp         word ptr [eax],0D800
>00422E06    jb          00422E1F
 00422E08    mov         eax,dword ptr [ebp-14]
 00422E0B    cmp         word ptr [eax],0DFFF
>00422E10    ja          00422E1F
 00422E12    mov         eax,dword ptr [ebp-14]
 00422E15    call        StrNextChar
 00422E1A    mov         dword ptr [ebp-14],eax
>00422E1D    jmp         00422E23
 00422E1F    add         dword ptr [ebp-14],2
 00422E23    mov         eax,dword ptr [ebp-14]
 00422E26    cmp         word ptr [eax],0
>00422E2A    je          00422E38
 00422E2C    mov         eax,dword ptr [ebp-14]
 00422E2F    movzx       eax,word ptr [eax]
 00422E32    cmp         ax,word ptr [ebp-16]
>00422E36    jne         00422DFE
 00422E38    mov         eax,dword ptr [ebp+8]
 00422E3B    push        eax
 00422E3C    mov         edx,dword ptr [ebp-14]
 00422E3F    sub         edx,esi
 00422E41    sar         edx,1
>00422E43    jns         00422E48
 00422E45    adc         edx,0
 00422E48    mov         eax,esi
 00422E4A    call        AppendChars
 00422E4F    pop         ecx
 00422E50    mov         eax,dword ptr [ebp-14]
 00422E53    cmp         word ptr [eax],0
>00422E57    je          00422E71
 00422E59    add         dword ptr [ebp-14],2
>00422E5D    jmp         00422E71
 00422E5F    mov         eax,dword ptr [ebp+8]
 00422E62    push        eax
 00422E63    lea         eax,[ebp-16]
 00422E66    mov         edx,1
 00422E6B    call        AppendChars
 00422E70    pop         ecx
 00422E71    mov         eax,dword ptr [ebp-14]
 00422E74    movzx       edi,word ptr [eax]
 00422E77    test        di,di
>00422E7A    jne         004226AC
 00422E80    mov         eax,dword ptr [ebp+8]
 00422E83    dec         dword ptr [eax-208]
 00422E89    xor         eax,eax
 00422E8B    pop         edx
 00422E8C    pop         ecx
 00422E8D    pop         ecx
 00422E8E    mov         dword ptr fs:[eax],edx
 00422E91    push        422EAB
 00422E96    lea         eax,[ebp-2C]
 00422E99    mov         edx,2
 00422E9E    call        @UStrArrayClr
 00422EA3    ret
>00422EA4    jmp         @HandleFinally
>00422EA9    jmp         00422E96
 00422EAB    pop         edi
 00422EAC    pop         esi
 00422EAD    pop         ebx
 00422EAE    mov         esp,ebp
 00422EB0    pop         ebp
 00422EB1    ret
*}
end;

//00422EEC
procedure DateTimeToString(var Result:UnicodeString; const Format:UnicodeString; const AFormatSettings:TFormatSettings; DateTime:TDateTime);
begin
{*
 00422EEC    push        ebp
 00422EED    mov         ebp,esp
 00422EEF    add         esp,0FFFFFDF4
 00422EF5    push        ebx
 00422EF6    push        esi
 00422EF7    mov         dword ptr [ebp-20C],ecx
 00422EFD    mov         ebx,edx
 00422EFF    mov         esi,eax
 00422F01    xor         eax,eax
 00422F03    mov         dword ptr [ebp-204],eax
 00422F09    xor         eax,eax
 00422F0B    mov         dword ptr [ebp-208],eax
 00422F11    test        ebx,ebx
>00422F13    je          00422F20
 00422F15    push        ebp
 00422F16    mov         eax,ebx
 00422F18    call        AppendFormat
 00422F1D    pop         ecx
>00422F1E    jmp         00422F2C
 00422F20    push        ebp
 00422F21    mov         eax,422F48
 00422F26    call        AppendFormat
 00422F2B    pop         ecx
 00422F2C    lea         edx,[ebp-200]
 00422F32    mov         eax,esi
 00422F34    mov         ecx,dword ptr [ebp-204]
 00422F3A    call        @UStrFromPWCharLen
 00422F3F    pop         esi
 00422F40    pop         ebx
 00422F41    mov         esp,ebp
 00422F43    pop         ebp
 00422F44    ret         8
*}
end;

//00422F4C
function DateToStr(const AFormatSettings:TFormatSettings; const DateTime:TDateTime):UnicodeString;
begin
{*
 00422F4C    push        ebp
 00422F4D    mov         ebp,esp
 00422F4F    push        dword ptr [ebp+0C]
 00422F52    push        dword ptr [ebp+8]
 00422F55    mov         ecx,eax
 00422F57    mov         eax,dword ptr [eax+0C]
 00422F5A    xchg        eax,edx
 00422F5B    call        DateTimeToString
 00422F60    pop         ebp
 00422F61    ret         8
*}
end;

//00422F64
function TimeToStr(const AFormatSettings:TFormatSettings; const DateTime:TDateTime):UnicodeString;
begin
{*
 00422F64    push        ebp
 00422F65    mov         ebp,esp
 00422F67    push        dword ptr [ebp+0C]
 00422F6A    push        dword ptr [ebp+8]
 00422F6D    mov         ecx,eax
 00422F6F    mov         eax,dword ptr [eax+20]
 00422F72    xchg        eax,edx
 00422F73    call        DateTimeToString
 00422F78    pop         ebp
 00422F79    ret         8
*}
end;

//00422F7C
function CurrToStr(Value:Currency):UnicodeString;
begin
{*
 00422F7C    push        ebp
 00422F7D    mov         ebp,esp
 00422F7F    push        ebx
 00422F80    mov         ebx,eax
 00422F82    push        dword ptr [ebp+0C]
 00422F85    push        dword ptr [ebp+8]
 00422F88    mov         edx,ebx
 00422F8A    mov         eax,790CDC;gvar_00790CDC:TFormatSettings
 00422F8F    call        DateTimeToStr
 00422F94    pop         ebx
 00422F95    pop         ebp
 00422F96    ret         8
*}
end;

//00422F9C
function DateTimeToStr(const AFormatSettings:TFormatSettings; const DateTime:TDateTime):UnicodeString;
begin
{*
 00422F9C    push        ebp
 00422F9D    mov         ebp,esp
 00422F9F    push        dword ptr [ebp+0C]
 00422FA2    push        dword ptr [ebp+8]
 00422FA5    mov         ecx,eax
 00422FA7    mov         eax,edx
 00422FA9    xor         edx,edx
 00422FAB    call        DateTimeToString
 00422FB0    pop         ebp
 00422FB1    ret         8
*}
end;

//00422FB4
procedure ScanBlanks(const S:UnicodeString; var Pos:Integer);
begin
{*
 00422FB4    push        ebx
 00422FB5    push        esi
 00422FB6    push        edi
 00422FB7    mov         edi,edx
 00422FB9    mov         esi,eax
 00422FBB    mov         ebx,dword ptr [edi]
>00422FBD    jmp         00422FC0
 00422FBF    inc         ebx
 00422FC0    mov         eax,esi
 00422FC2    call        @UStrLen
 00422FC7    cmp         ebx,eax
>00422FC9    jg          00422FD3
 00422FCB    cmp         word ptr [esi+ebx*2-2],20
>00422FD1    je          00422FBF
 00422FD3    mov         dword ptr [edi],ebx
 00422FD5    pop         edi
 00422FD6    pop         esi
 00422FD7    pop         ebx
 00422FD8    ret
*}
end;

//00422FDC
function ScanNumber(const S:UnicodeString; var Pos:Integer; var Number:Word; var CharCount:Byte):Boolean;
begin
{*
 00422FDC    push        ebp
 00422FDD    mov         ebp,esp
 00422FDF    add         esp,0FFFFFFF4
 00422FE2    push        ebx
 00422FE3    push        esi
 00422FE4    push        edi
 00422FE5    mov         dword ptr [ebp-8],ecx
 00422FE8    mov         dword ptr [ebp-4],edx
 00422FEB    mov         edi,eax
 00422FED    mov         byte ptr [ebp-9],0
 00422FF1    mov         eax,dword ptr [ebp+8]
 00422FF4    mov         byte ptr [eax],0
 00422FF7    mov         edx,dword ptr [ebp-4]
 00422FFA    mov         eax,edi
 00422FFC    call        ScanBlanks
 00423001    mov         ebx,dword ptr [ebp-4]
 00423004    mov         ebx,dword ptr [ebx]
 00423006    xor         esi,esi
>00423008    jmp         00423020
 0042300A    mov         eax,esi
 0042300C    add         eax,eax
 0042300E    lea         eax,[eax+eax*4]
 00423011    movzx       edx,word ptr [edi+ebx*2-2]
 00423016    sub         dx,30
 0042301A    add         ax,dx
 0042301D    mov         esi,eax
 0042301F    inc         ebx
 00423020    mov         eax,edi
 00423022    call        @UStrLen
 00423027    cmp         ebx,eax
>00423029    jg          00423040
 0042302B    movzx       eax,word ptr [edi+ebx*2-2]
 00423030    add         eax,0FFFFFFD0
 00423033    sub         ax,0A
>00423037    jae         00423040
 00423039    cmp         si,3E8
>0042303E    jb          0042300A
 00423040    mov         eax,dword ptr [ebp-4]
 00423043    cmp         ebx,dword ptr [eax]
>00423045    jle         00423064
 00423047    mov         eax,ebx
 00423049    mov         edx,dword ptr [ebp-4]
 0042304C    mov         edx,dword ptr [edx]
 0042304E    sub         al,dl
 00423050    mov         edx,dword ptr [ebp+8]
 00423053    mov         byte ptr [edx],al
 00423055    mov         eax,dword ptr [ebp-4]
 00423058    mov         dword ptr [eax],ebx
 0042305A    mov         eax,dword ptr [ebp-8]
 0042305D    mov         word ptr [eax],si
 00423060    mov         byte ptr [ebp-9],1
 00423064    movzx       eax,byte ptr [ebp-9]
 00423068    pop         edi
 00423069    pop         esi
 0042306A    pop         ebx
 0042306B    mov         esp,ebp
 0042306D    pop         ebp
 0042306E    ret         4
*}
end;

//00423074
function ScanString(const S:UnicodeString; var Pos:Integer; const Symbol:UnicodeString):Boolean;
begin
{*
 00423074    push        ebp
 00423075    mov         ebp,esp
 00423077    add         esp,0FFFFFFF4
 0042307A    push        ebx
 0042307B    push        esi
 0042307C    push        edi
 0042307D    xor         ebx,ebx
 0042307F    mov         dword ptr [ebp-0C],ebx
 00423082    mov         ebx,ecx
 00423084    mov         edi,edx
 00423086    mov         dword ptr [ebp-4],eax
 00423089    xor         eax,eax
 0042308B    push        ebp
 0042308C    push        4230F9
 00423091    push        dword ptr fs:[eax]
 00423094    mov         dword ptr fs:[eax],esp
 00423097    mov         byte ptr [ebp-5],0
 0042309B    test        ebx,ebx
>0042309D    je          004230E3
 0042309F    mov         edx,edi
 004230A1    mov         eax,dword ptr [ebp-4]
 004230A4    call        ScanBlanks
 004230A9    mov         esi,ebx
 004230AB    test        esi,esi
>004230AD    je          004230B4
 004230AF    sub         esi,4
 004230B2    mov         esi,dword ptr [esi]
 004230B4    lea         eax,[ebp-0C]
 004230B7    push        eax
 004230B8    mov         edx,dword ptr [edi]
 004230BA    mov         ecx,esi
 004230BC    mov         eax,dword ptr [ebp-4]
 004230BF    call        @UStrCopy
 004230C4    mov         edx,dword ptr [ebp-0C]
 004230C7    mov         eax,ebx
 004230C9    call        AnsiCompareText
 004230CE    test        eax,eax
>004230D0    jne         004230E3
 004230D2    mov         eax,ebx
 004230D4    test        eax,eax
>004230D6    je          004230DD
 004230D8    sub         eax,4
 004230DB    mov         eax,dword ptr [eax]
 004230DD    add         dword ptr [edi],eax
 004230DF    mov         byte ptr [ebp-5],1
 004230E3    xor         eax,eax
 004230E5    pop         edx
 004230E6    pop         ecx
 004230E7    pop         ecx
 004230E8    mov         dword ptr fs:[eax],edx
 004230EB    push        423100
 004230F0    lea         eax,[ebp-0C]
 004230F3    call        @UStrClr
 004230F8    ret
>004230F9    jmp         @HandleFinally
>004230FE    jmp         004230F0
 00423100    movzx       eax,byte ptr [ebp-5]
 00423104    pop         edi
 00423105    pop         esi
 00423106    pop         ebx
 00423107    mov         esp,ebp
 00423109    pop         ebp
 0042310A    ret
*}
end;

//0042310C
function ScanChar(const S:UnicodeString; var Pos:Integer; Ch:Char):Boolean;
begin
{*
 0042310C    push        ebx
 0042310D    push        esi
 0042310E    push        edi
 0042310F    push        ebp
 00423110    mov         ebp,ecx
 00423112    mov         edi,edx
 00423114    mov         esi,eax
 00423116    xor         ebx,ebx
 00423118    mov         edx,edi
 0042311A    mov         eax,esi
 0042311C    call        ScanBlanks
 00423121    mov         eax,esi
 00423123    test        eax,eax
>00423125    je          0042312C
 00423127    sub         eax,4
 0042312A    mov         eax,dword ptr [eax]
 0042312C    cmp         eax,dword ptr [edi]
>0042312E    jl          0042313D
 00423130    mov         eax,dword ptr [edi]
 00423132    cmp         bp,word ptr [esi+eax*2-2]
>00423137    jne         0042313D
 00423139    inc         dword ptr [edi]
 0042313B    mov         bl,1
 0042313D    mov         eax,ebx
 0042313F    pop         ebp
 00423140    pop         edi
 00423141    pop         esi
 00423142    pop         ebx
 00423143    ret
*}
end;

//00423144
function GetDateOrder(const DateFormat:UnicodeString):TDateOrder;
begin
{*
 00423144    push        ebx
 00423145    push        esi
 00423146    push        edi
 00423147    mov         esi,eax
 00423149    xor         ebx,ebx
 0042314B    mov         edi,1
>00423150    jmp         00423185
 00423152    movzx       eax,word ptr [esi+edi*2-2]
 00423157    and         ax,0DF
 0042315B    sub         ax,44
>0042315F    je          00423180
 00423161    dec         ax
>00423164    je          00423174
 00423166    sub         ax,8
>0042316A    je          0042317C
 0042316C    sub         ax,0C
>00423170    je          00423178
>00423172    jmp         00423184
 00423174    mov         bl,2
>00423176    jmp         00423192
 00423178    mov         bl,2
>0042317A    jmp         00423192
 0042317C    xor         ebx,ebx
>0042317E    jmp         00423192
 00423180    mov         bl,1
>00423182    jmp         00423192
 00423184    inc         edi
 00423185    mov         eax,esi
 00423187    call        @UStrLen
 0042318C    cmp         edi,eax
>0042318E    jle         00423152
 00423190    xor         ebx,ebx
 00423192    mov         eax,ebx
 00423194    pop         edi
 00423195    pop         esi
 00423196    pop         ebx
 00423197    ret
*}
end;

//00423198
procedure ScanToNumber(const S:UnicodeString; var Pos:Integer);
begin
{*
 00423198    push        ebx
 00423199    push        esi
 0042319A    push        edi
 0042319B    push        ebp
 0042319C    mov         ebp,edx
 0042319E    mov         esi,eax
>004231A0    jmp         004231D4
 004231A2    mov         eax,dword ptr [ebp]
 004231A5    movzx       edi,word ptr [esi+eax*2-2]
 004231AA    cmp         di,0D800
>004231AF    jb          004231B8
 004231B1    cmp         di,0DFFF
>004231B6    jbe         004231BC
 004231B8    xor         ebx,ebx
>004231BA    jmp         004231BE
 004231BC    mov         bl,1
 004231BE    test        bl,bl
>004231C0    je          004231D1
 004231C2    mov         edx,dword ptr [ebp]
 004231C5    mov         eax,esi
 004231C7    call        NextCharIndex
 004231CC    mov         dword ptr [ebp],eax
>004231CF    jmp         004231D4
 004231D1    inc         dword ptr [ebp]
 004231D4    mov         eax,esi
 004231D6    call        @UStrLen
 004231DB    cmp         eax,dword ptr [ebp]
>004231DE    jl          004231F1
 004231E0    mov         eax,dword ptr [ebp]
 004231E3    movzx       eax,word ptr [esi+eax*2-2]
 004231E8    add         eax,0FFFFFFD0
 004231EB    sub         ax,0A
>004231EF    jae         004231A2
 004231F1    pop         ebp
 004231F2    pop         edi
 004231F3    pop         esi
 004231F4    pop         ebx
 004231F5    ret
*}
end;

//004231F8
function GetEraYearOffset(const Name:UnicodeString):Integer;
begin
{*
 004231F8    push        ebx
 004231F9    push        esi
 004231FA    push        edi
 004231FB    push        ebp
 004231FC    push        ecx
 004231FD    mov         ebp,eax
 004231FF    xor         eax,eax
 00423201    mov         dword ptr [esp],eax
 00423204    mov         edi,7
 00423209    mov         ebx,790DB0;gvar_00790DB0:array[7] of ?
 0042320E    mov         esi,790DCC
 00423213    cmp         dword ptr [ebx],0
>00423216    je          00423241
 00423218    mov         eax,ebp
 0042321A    call        @UStrToPWChar
 0042321F    push        eax
 00423220    mov         eax,dword ptr [ebx]
 00423222    call        @UStrToPWChar
 00423227    pop         edx
 00423228    call        AnsiStrPos
 0042322D    test        eax,eax
>0042322F    je          00423238
 00423231    mov         eax,dword ptr [esi]
 00423233    mov         dword ptr [esp],eax
>00423236    jmp         00423241
 00423238    add         esi,4
 0042323B    add         ebx,4
 0042323E    dec         edi
>0042323F    jne         00423213
 00423241    mov         eax,dword ptr [esp]
 00423244    pop         edx
 00423245    pop         ebp
 00423246    pop         edi
 00423247    pop         esi
 00423248    pop         ebx
 00423249    ret
*}
end;

//0042324C
function EraToYear(Year:Integer):Integer;
begin
{*
 0042324C    push        ebp
 0042324D    mov         ebp,esp
 0042324F    push        ebx
 00423250    mov         ebx,eax
 00423252    cmp         dword ptr ds:[790DA3],12
>00423259    jne         00423295
 0042325B    cmp         ebx,63
>0042325E    jg          00423284
 00423260    call        CurrentYear
 00423265    movzx       ecx,ax
 00423268    mov         eax,dword ptr [ebp+8]
 0042326B    mov         eax,dword ptr [eax-4]
 0042326E    cdq
 0042326F    xor         eax,edx
 00423271    sub         eax,edx
 00423273    add         ecx,eax
 00423275    mov         eax,ecx
 00423277    mov         ecx,64
 0042327C    cdq
 0042327D    idiv        eax,ecx
 0042327F    imul        eax,eax,64
 00423282    add         ebx,eax
 00423284    mov         eax,dword ptr [ebp+8]
 00423287    cmp         dword ptr [eax-4],0
>0042328B    jle         0042329B
 0042328D    mov         eax,dword ptr [ebp+8]
 00423290    neg         dword ptr [eax-4]
>00423293    jmp         0042329B
 00423295    mov         eax,dword ptr [ebp+8]
 00423298    dec         dword ptr [eax-4]
 0042329B    mov         eax,dword ptr [ebp+8]
 0042329E    mov         eax,dword ptr [eax-4]
 004232A1    add         eax,ebx
 004232A3    pop         ebx
 004232A4    pop         ebp
 004232A5    ret
*}
end;

//004232A8
function ScanDate(const S:UnicodeString; var Pos:Integer; const AFormatSettings:TFormatSettings; var Date:TDateTime):Boolean;
begin
{*
 004232A8    push        ebp
 004232A9    mov         ebp,esp
 004232AB    add         esp,0FFFFFFD4
 004232AE    push        ebx
 004232AF    push        esi
 004232B0    push        edi
 004232B1    xor         ebx,ebx
 004232B3    mov         dword ptr [ebp-2C],ebx
 004232B6    mov         dword ptr [ebp-28],ebx
 004232B9    mov         dword ptr [ebp-24],ebx
 004232BC    mov         dword ptr [ebp-8],ebx
 004232BF    mov         dword ptr [ebp-0C],ecx
 004232C2    mov         ebx,edx
 004232C4    mov         esi,eax
 004232C6    mov         edi,dword ptr [ebp+8]
 004232C9    xor         eax,eax
 004232CB    push        ebp
 004232CC    push        4235CC
 004232D1    push        dword ptr fs:[eax]
 004232D4    mov         dword ptr fs:[eax],esp
 004232D7    mov         word ptr [ebp-16],0
 004232DD    mov         word ptr [ebp-18],0
 004232E3    mov         word ptr [ebp-1A],0
 004232E9    mov         byte ptr [ebp-1E],0
 004232ED    mov         byte ptr [ebp-0D],0
 004232F1    mov         eax,dword ptr [edi+0C]
 004232F4    call        GetDateOrder
 004232F9    mov         byte ptr [ebp-0E],al
 004232FC    xor         eax,eax
 004232FE    mov         dword ptr [ebp-4],eax
 00423301    mov         eax,dword ptr [edi+0C]
 00423304    cmp         word ptr [eax],67
>00423308    jne         0042333E
 0042330A    mov         edx,ebx
 0042330C    mov         eax,esi
 0042330E    call        ScanToNumber
 00423313    lea         eax,[ebp-24]
 00423316    push        eax
 00423317    mov         ecx,dword ptr [ebx]
 00423319    dec         ecx
 0042331A    mov         edx,1
 0042331F    mov         eax,esi
 00423321    call        @UStrCopy
 00423326    mov         eax,dword ptr [ebp-24]
 00423329    lea         edx,[ebp-8]
 0042332C    call        Trim
 00423331    mov         eax,dword ptr [ebp-8]
 00423334    call        GetEraYearOffset
 00423339    mov         dword ptr [ebp-4],eax
>0042333C    jmp         00423357
 0042333E    mov         edx,dword ptr [edi+0C]
 00423341    mov         eax,4235EC;'e'
 00423346    call        AnsiPos
 0042334B    test        eax,eax
>0042334D    jle         00423357
 0042334F    mov         eax,[00790DCC]
 00423354    mov         dword ptr [ebp-4],eax
 00423357    lea         eax,[ebp-1B]
 0042335A    push        eax
 0042335B    lea         ecx,[ebp-10]
 0042335E    mov         edx,ebx
 00423360    mov         eax,esi
 00423362    call        ScanNumber
 00423367    test        al,al
>00423369    je          004235A9
 0042336F    movzx       ecx,word ptr [edi+6]
 00423373    mov         edx,ebx
 00423375    mov         eax,esi
 00423377    call        ScanChar
 0042337C    test        al,al
>0042337E    je          004235A9
 00423384    lea         eax,[ebp-1C]
 00423387    push        eax
 00423388    lea         ecx,[ebp-12]
 0042338B    mov         edx,ebx
 0042338D    mov         eax,esi
 0042338F    call        ScanNumber
 00423394    test        al,al
>00423396    je          004235A9
 0042339C    movzx       ecx,word ptr [edi+6]
 004233A0    mov         edx,ebx
 004233A2    mov         eax,esi
 004233A4    call        ScanChar
 004233A9    test        al,al
>004233AB    je          00423495
 004233B1    lea         eax,[ebp-1D]
 004233B4    push        eax
 004233B5    lea         ecx,[ebp-14]
 004233B8    mov         edx,ebx
 004233BA    mov         eax,esi
 004233BC    call        ScanNumber
 004233C1    test        al,al
>004233C3    je          004235A9
 004233C9    movzx       eax,byte ptr [ebp-0E]
 004233CD    sub         al,1
>004233CF    jb          004233D9
>004233D1    je          004233FA
 004233D3    dec         al
>004233D5    je          0042341B
>004233D7    jmp         0042343A
 004233D9    movzx       eax,word ptr [ebp-14]
 004233DD    mov         word ptr [ebp-16],ax
 004233E1    movzx       eax,byte ptr [ebp-1D]
 004233E5    mov         byte ptr [ebp-1E],al
 004233E8    movzx       eax,word ptr [ebp-10]
 004233EC    mov         word ptr [ebp-18],ax
 004233F0    movzx       eax,word ptr [ebp-12]
 004233F4    mov         word ptr [ebp-1A],ax
>004233F8    jmp         0042343A
 004233FA    movzx       eax,word ptr [ebp-14]
 004233FE    mov         word ptr [ebp-16],ax
 00423402    movzx       eax,byte ptr [ebp-1D]
 00423406    mov         byte ptr [ebp-1E],al
 00423409    movzx       eax,word ptr [ebp-12]
 0042340D    mov         word ptr [ebp-18],ax
 00423411    movzx       eax,word ptr [ebp-10]
 00423415    mov         word ptr [ebp-1A],ax
>00423419    jmp         0042343A
 0042341B    movzx       eax,word ptr [ebp-10]
 0042341F    mov         word ptr [ebp-16],ax
 00423423    movzx       eax,byte ptr [ebp-1B]
 00423427    mov         byte ptr [ebp-1E],al
 0042342A    movzx       eax,word ptr [ebp-12]
 0042342E    mov         word ptr [ebp-18],ax
 00423432    movzx       eax,word ptr [ebp-14]
 00423436    mov         word ptr [ebp-1A],ax
 0042343A    cmp         dword ptr [ebp-4],0
>0042343E    jle         00423451
 00423440    push        ebp
 00423441    movzx       eax,word ptr [ebp-16]
 00423445    call        EraToYear
 0042344A    pop         ecx
 0042344B    mov         word ptr [ebp-16],ax
>0042344F    jmp         004234C6
 00423451    cmp         byte ptr [ebp-1E],2
>00423455    ja          004234C6
 00423457    call        CurrentYear
 0042345C    movzx       ecx,ax
 0042345F    movzx       eax,word ptr [edi+0C0]
 00423466    sub         ecx,eax
 00423468    mov         eax,ecx
 0042346A    push        ecx
 0042346B    mov         ecx,64
 00423470    cdq
 00423471    idiv        eax,ecx
 00423473    pop         ecx
 00423474    imul        ax,ax,64
 00423478    add         word ptr [ebp-16],ax
 0042347C    cmp         word ptr [edi+0C0],0
>00423484    jbe         004234C6
 00423486    movzx       eax,word ptr [ebp-16]
 0042348A    cmp         ecx,eax
>0042348C    jle         004234C6
 0042348E    add         word ptr [ebp-16],64
>00423493    jmp         004234C6
 00423495    call        CurrentYear
 0042349A    mov         word ptr [ebp-16],ax
 0042349E    cmp         byte ptr [ebp-0E],1
>004234A2    jne         004234B6
 004234A4    movzx       eax,word ptr [ebp-10]
 004234A8    mov         word ptr [ebp-1A],ax
 004234AC    movzx       eax,word ptr [ebp-12]
 004234B0    mov         word ptr [ebp-18],ax
>004234B4    jmp         004234C6
 004234B6    movzx       eax,word ptr [ebp-10]
 004234BA    mov         word ptr [ebp-18],ax
 004234BE    movzx       eax,word ptr [ebp-12]
 004234C2    mov         word ptr [ebp-1A],ax
 004234C6    movzx       ecx,word ptr [edi+6]
 004234CA    mov         edx,ebx
 004234CC    mov         eax,esi
 004234CE    call        ScanChar
 004234D3    mov         edx,ebx
 004234D5    mov         eax,esi
 004234D7    call        ScanBlanks
 004234DC    cmp         byte ptr ds:[790DAB],0
>004234E3    je          00423591
 004234E9    mov         edx,dword ptr [edi+0C]
 004234EC    mov         eax,4235FC;'ddd'
 004234F1    call        Pos
 004234F6    test        eax,eax
>004234F8    je          00423591
 004234FE    mov         eax,dword ptr [edi+1C]
 00423501    movzx       eax,word ptr [eax]
 00423504    add         eax,0FFFFFFD0
 00423507    sub         ax,0A
>0042350B    jae         0042351C
 0042350D    mov         edx,ebx
 0042350F    mov         eax,esi
 00423511    call        ScanToNumber
>00423516    jmp         00423591
>00423518    jmp         0042351C
 0042351A    inc         dword ptr [ebx]
 0042351C    mov         eax,esi
 0042351E    call        @UStrLen
 00423523    cmp         eax,dword ptr [ebx]
>00423525    jl          00423531
 00423527    mov         eax,dword ptr [ebx]
 00423529    cmp         word ptr [esi+eax*2-2],20
>0042352F    jne         0042351A
 00423531    mov         edx,ebx
 00423533    mov         eax,esi
 00423535    call        ScanBlanks
 0042353A    mov         eax,esi
 0042353C    call        @UStrLen
 00423541    cmp         eax,dword ptr [ebx]
>00423543    jl          00423591
 00423545    lea         eax,[ebp-28]
 00423548    push        eax
 00423549    mov         eax,dword ptr [edi+14]
 0042354C    call        @UStrLen
 00423551    mov         ecx,eax
 00423553    mov         edx,dword ptr [ebx]
 00423555    mov         eax,esi
 00423557    call        @UStrCopy
 0042355C    mov         edx,dword ptr [ebp-28]
 0042355F    mov         eax,dword ptr [edi+14]
 00423562    call        AnsiCompareText
 00423567    test        eax,eax
>00423569    je          00423591
 0042356B    lea         eax,[ebp-2C]
 0042356E    push        eax
 0042356F    mov         eax,dword ptr [edi+18]
 00423572    call        @UStrLen
 00423577    mov         ecx,eax
 00423579    mov         edx,dword ptr [ebx]
 0042357B    mov         eax,esi
 0042357D    call        @UStrCopy
 00423582    mov         edx,dword ptr [ebp-2C]
 00423585    mov         eax,dword ptr [edi+18]
 00423588    call        AnsiCompareText
 0042358D    test        eax,eax
>0042358F    jne         0042351C
 00423591    mov         eax,dword ptr [ebp-0C]
 00423594    push        eax
 00423595    movzx       ecx,word ptr [ebp-1A]
 00423599    movzx       edx,word ptr [ebp-18]
 0042359D    movzx       eax,word ptr [ebp-16]
 004235A1    call        TryEncodeDate
 004235A6    mov         byte ptr [ebp-0D],al
 004235A9    xor         eax,eax
 004235AB    pop         edx
 004235AC    pop         ecx
 004235AD    pop         ecx
 004235AE    mov         dword ptr fs:[eax],edx
 004235B1    push        4235D3
 004235B6    lea         eax,[ebp-2C]
 004235B9    mov         edx,3
 004235BE    call        @UStrArrayClr
 004235C3    lea         eax,[ebp-8]
 004235C6    call        @UStrClr
 004235CB    ret
>004235CC    jmp         @HandleFinally
>004235D1    jmp         004235B6
 004235D3    movzx       eax,byte ptr [ebp-0D]
 004235D7    pop         edi
 004235D8    pop         esi
 004235D9    pop         ebx
 004235DA    mov         esp,ebp
 004235DC    pop         ebp
 004235DD    ret         4
*}
end;

//00423604
function ScanTime(const S:UnicodeString; var Pos:Integer; const AFormatSettings:TFormatSettings; var Time:TDateTime):Boolean;
begin
{*
 00423604    push        ebp
 00423605    mov         ebp,esp
 00423607    add         esp,0FFFFFFF0
 0042360A    push        ebx
 0042360B    push        esi
 0042360C    push        edi
 0042360D    mov         dword ptr [ebp-4],ecx
 00423610    mov         esi,edx
 00423612    mov         ebx,eax
 00423614    mov         byte ptr [ebp-5],0
 00423618    or          edi,0FFFFFFFF
 0042361B    mov         ecx,dword ptr [ebp+8]
 0042361E    mov         ecx,dword ptr [ecx+14]
 00423621    mov         edx,esi
 00423623    mov         eax,ebx
 00423625    call        ScanString
 0042362A    test        al,al
>0042362C    jne         00423640
 0042362E    mov         edx,esi
 00423630    mov         ecx,4237E8;'AM'
 00423635    mov         eax,ebx
 00423637    call        ScanString
 0042363C    test        al,al
>0042363E    je          00423644
 00423640    xor         edi,edi
>00423642    jmp         0042366E
 00423644    mov         ecx,dword ptr [ebp+8]
 00423647    mov         ecx,dword ptr [ecx+18]
 0042364A    mov         edx,esi
 0042364C    mov         eax,ebx
 0042364E    call        ScanString
 00423653    test        al,al
>00423655    jne         00423669
 00423657    mov         edx,esi
 00423659    mov         ecx,4237FC;^TStatusPanel.ParentBiDiModeChanged
 0042365E    mov         eax,ebx
 00423660    call        ScanString
 00423665    test        al,al
>00423667    je          0042366E
 00423669    mov         edi,0C
 0042366E    test        edi,edi
>00423670    jl          0042367B
 00423672    mov         edx,esi
 00423674    mov         eax,ebx
 00423676    call        ScanBlanks
 0042367B    lea         eax,[ebp-0F]
 0042367E    push        eax
 0042367F    lea         ecx,[ebp-8]
 00423682    mov         edx,esi
 00423684    mov         eax,ebx
 00423686    call        ScanNumber
 0042368B    test        al,al
>0042368D    je          004237CC
 00423693    mov         word ptr [ebp-0A],0
 00423699    mov         word ptr [ebp-0C],0
 0042369F    mov         word ptr [ebp-0E],0
 004236A5    mov         ecx,dword ptr [ebp+8]
 004236A8    movzx       ecx,word ptr [ecx+8]
 004236AC    mov         edx,esi
 004236AE    mov         eax,ebx
 004236B0    call        ScanChar
 004236B5    test        al,al
>004236B7    je          0042372C
 004236B9    lea         eax,[ebp-0F]
 004236BC    push        eax
 004236BD    lea         ecx,[ebp-0A]
 004236C0    mov         edx,esi
 004236C2    mov         eax,ebx
 004236C4    call        ScanNumber
 004236C9    test        al,al
>004236CB    je          004237CC
 004236D1    mov         ecx,dword ptr [ebp+8]
 004236D4    movzx       ecx,word ptr [ecx+8]
 004236D8    mov         edx,esi
 004236DA    mov         eax,ebx
 004236DC    call        ScanChar
 004236E1    test        al,al
>004236E3    je          0042372C
 004236E5    lea         eax,[ebp-0F]
 004236E8    push        eax
 004236E9    lea         ecx,[ebp-0C]
 004236EC    mov         edx,esi
 004236EE    mov         eax,ebx
 004236F0    call        ScanNumber
 004236F5    test        al,al
>004236F7    je          004237CC
 004236FD    mov         ecx,dword ptr [ebp+8]
 00423700    movzx       ecx,word ptr [ecx+0BE]
 00423707    mov         edx,esi
 00423709    mov         eax,ebx
 0042370B    call        ScanChar
 00423710    test        al,al
>00423712    je          0042372C
 00423714    lea         eax,[ebp-0F]
 00423717    push        eax
 00423718    lea         ecx,[ebp-0E]
 0042371B    mov         edx,esi
 0042371D    mov         eax,ebx
 0042371F    call        ScanNumber
 00423724    test        al,al
>00423726    je          004237CC
 0042372C    test        edi,edi
>0042372E    jge         00423783
 00423730    mov         ecx,dword ptr [ebp+8]
 00423733    mov         ecx,dword ptr [ecx+14]
 00423736    mov         edx,esi
 00423738    mov         eax,ebx
 0042373A    call        ScanString
 0042373F    test        al,al
>00423741    jne         00423755
 00423743    mov         edx,esi
 00423745    mov         ecx,4237E8;'AM'
 0042374A    mov         eax,ebx
 0042374C    call        ScanString
 00423751    test        al,al
>00423753    je          00423759
 00423755    xor         edi,edi
>00423757    jmp         00423783
 00423759    mov         ecx,dword ptr [ebp+8]
 0042375C    mov         ecx,dword ptr [ecx+18]
 0042375F    mov         edx,esi
 00423761    mov         eax,ebx
 00423763    call        ScanString
 00423768    test        al,al
>0042376A    jne         0042377E
 0042376C    mov         edx,esi
 0042376E    mov         ecx,4237FC;^TStatusPanel.ParentBiDiModeChanged
 00423773    mov         eax,ebx
 00423775    call        ScanString
 0042377A    test        al,al
>0042377C    je          00423783
 0042377E    mov         edi,0C
 00423783    test        edi,edi
>00423785    jl          004237A6
 00423787    cmp         word ptr [ebp-8],0
>0042378C    je          004237CC
 0042378E    cmp         word ptr [ebp-8],0C
>00423793    ja          004237CC
 00423795    cmp         word ptr [ebp-8],0C
>0042379A    jne         004237A2
 0042379C    mov         word ptr [ebp-8],0
 004237A2    add         word ptr [ebp-8],di
 004237A6    mov         edx,esi
 004237A8    mov         eax,ebx
 004237AA    call        ScanBlanks
 004237AF    movzx       eax,word ptr [ebp-0E]
 004237B3    push        eax
 004237B4    mov         eax,dword ptr [ebp-4]
 004237B7    push        eax
 004237B8    movzx       ecx,word ptr [ebp-0C]
 004237BC    movzx       edx,word ptr [ebp-0A]
 004237C0    movzx       eax,word ptr [ebp-8]
 004237C4    call        TryEncodeTime
 004237C9    mov         byte ptr [ebp-5],al
 004237CC    movzx       eax,byte ptr [ebp-5]
 004237D0    pop         edi
 004237D1    pop         esi
 004237D2    pop         ebx
 004237D3    mov         esp,ebp
 004237D5    pop         ebp
 004237D6    ret         4
*}
end;

//00423804
function StrToDate(const S:UnicodeString; const AFormatSettings:TFormatSettings):TDateTime;
begin
{*
 00423804    push        ebx
 00423805    push        esi
 00423806    add         esp,0FFFFFFF0
 00423809    mov         esi,edx
 0042380B    mov         ebx,eax
 0042380D    mov         ecx,esi
 0042380F    mov         edx,esp
 00423811    mov         eax,ebx
 00423813    call        TryStrToDate
 00423818    test        al,al
>0042381A    jne         00423835
 0042381C    mov         dword ptr [esp+8],ebx
 00423820    mov         byte ptr [esp+0C],11
 00423825    lea         edx,[esp+8]
 00423829    mov         eax,[0078D310];^SResString165:TResStringRec
 0042382E    xor         ecx,ecx
 00423830    call        ConvertErrorFmt
 00423835    fld         qword ptr [esp]
 00423838    add         esp,10
 0042383B    pop         esi
 0042383C    pop         ebx
 0042383D    ret
*}
end;

//00423840
function TryStrToDate(const S:UnicodeString; const AFormatSettings:TFormatSettings; var Value:TDateTime):Boolean;
begin
{*
 00423840    push        ebx
 00423841    push        esi
 00423842    push        edi
 00423843    push        ecx
 00423844    mov         edi,ecx
 00423846    mov         esi,edx
 00423848    mov         ebx,eax
 0042384A    mov         dword ptr [esp],1
 00423851    push        edi
 00423852    mov         ecx,esi
 00423854    lea         edx,[esp+4]
 00423858    mov         eax,ebx
 0042385A    call        ScanDate
 0042385F    test        al,al
>00423861    je          00423876
 00423863    mov         eax,ebx
 00423865    test        eax,eax
>00423867    je          0042386E
 00423869    sub         eax,4
 0042386C    mov         eax,dword ptr [eax]
 0042386E    cmp         eax,dword ptr [esp]
 00423871    setl        al
>00423874    jmp         00423878
 00423876    xor         eax,eax
 00423878    pop         edx
 00423879    pop         edi
 0042387A    pop         esi
 0042387B    pop         ebx
 0042387C    ret
*}
end;

//00423880
function StrToDateTime(const S:UnicodeString; const AFormatSettings:TFormatSettings):TDateTime;
begin
{*
 00423880    push        ebx
 00423881    push        esi
 00423882    add         esp,0FFFFFFF0
 00423885    mov         esi,edx
 00423887    mov         ebx,eax
 00423889    mov         ecx,esi
 0042388B    mov         edx,esp
 0042388D    mov         eax,ebx
 0042388F    call        TryStrToDateTime
 00423894    test        al,al
>00423896    jne         004238B1
 00423898    mov         dword ptr [esp+8],ebx
 0042389C    mov         byte ptr [esp+0C],11
 004238A1    lea         edx,[esp+8]
 004238A5    mov         eax,[0078CFB8];^SResString168:TResStringRec
 004238AA    xor         ecx,ecx
 004238AC    call        ConvertErrorFmt
 004238B1    fld         qword ptr [esp]
 004238B4    add         esp,10
 004238B7    pop         esi
 004238B8    pop         ebx
 004238B9    ret
*}
end;

//004238BC
function TryStrToDateTime(const S:UnicodeString; const AFormatSettings:TFormatSettings; var Value:TDateTime):Boolean;
begin
{*
 004238BC    push        ebx
 004238BD    push        esi
 004238BE    push        edi
 004238BF    push        ecx
 004238C0    mov         edi,ecx
 004238C2    mov         esi,edx
 004238C4    mov         ebx,eax
 004238C6    mov         dword ptr [esp],1
 004238CD    push        edi
 004238CE    mov         ecx,esi
 004238D0    lea         edx,[esp+4]
 004238D4    mov         eax,ebx
 004238D6    call        ScanTime
 004238DB    test        al,al
>004238DD    je          004238F2
 004238DF    mov         eax,ebx
 004238E1    test        eax,eax
>004238E3    je          004238EA
 004238E5    sub         eax,4
 004238E8    mov         eax,dword ptr [eax]
 004238EA    cmp         eax,dword ptr [esp]
 004238ED    setl        al
>004238F0    jmp         004238F4
 004238F2    xor         eax,eax
 004238F4    pop         edx
 004238F5    pop         edi
 004238F6    pop         esi
 004238F7    pop         ebx
 004238F8    ret
*}
end;

//004238FC
function StrToDate(const S:UnicodeString):TDateTime;
begin
{*
 004238FC    add         esp,0FFFFFFF8
 004238FF    mov         edx,790CDC;gvar_00790CDC:TFormatSettings
 00423904    call        StrToTime
 00423909    fstp        qword ptr [esp]
 0042390C    wait
 0042390D    fld         qword ptr [esp]
 00423910    pop         ecx
 00423911    pop         edx
 00423912    ret
*}
end;

//00423914
function StrToTime(const S:UnicodeString; const AFormatSettings:TFormatSettings):TDateTime;
begin
{*
 00423914    push        ebx
 00423915    push        esi
 00423916    add         esp,0FFFFFFF0
 00423919    mov         esi,edx
 0042391B    mov         ebx,eax
 0042391D    mov         ecx,esi
 0042391F    mov         edx,esp
 00423921    mov         eax,ebx
 00423923    call        TryStrToTime
 00423928    test        al,al
>0042392A    jne         00423945
 0042392C    mov         dword ptr [esp+8],ebx
 00423930    mov         byte ptr [esp+0C],11
 00423935    lea         edx,[esp+8]
 00423939    mov         eax,[0078CC68];^SResString166:TResStringRec
 0042393E    xor         ecx,ecx
 00423940    call        ConvertErrorFmt
 00423945    fld         qword ptr [esp]
 00423948    add         esp,10
 0042394B    pop         esi
 0042394C    pop         ebx
 0042394D    ret
*}
end;

//00423950
function TryStrToTime(const S:UnicodeString; const AFormatSettings:TFormatSettings; var Value:TDateTime):Boolean;
begin
{*
 00423950    push        ebx
 00423951    push        esi
 00423952    push        edi
 00423953    push        ebp
 00423954    add         esp,0FFFFFFD8
 00423957    mov         edi,ecx
 00423959    mov         dword ptr [esp],edx
 0042395C    mov         esi,eax
 0042395E    mov         bl,1
 00423960    mov         dword ptr [esp+4],1
 00423968    xor         eax,eax
 0042396A    mov         dword ptr [esp+20],eax
 0042396E    mov         dword ptr [esp+24],eax
 00423972    lea         edx,[esp+4]
 00423976    mov         eax,esi
 00423978    call        ScanToNumber
 0042397D    push        edi
 0042397E    lea         ecx,[esp+1C]
 00423982    lea         edx,[esp+8]
 00423986    mov         eax,esi
 00423988    call        ScanDate
 0042398D    test        al,al
>0042398F    je          00423B28
 00423995    mov         eax,dword ptr [esp+4]
 00423999    mov         dword ptr [esp+8],eax
 0042399D    lea         edx,[esp+8]
 004239A1    mov         eax,esi
 004239A3    call        ScanToNumber
 004239A8    mov         eax,esi
 004239AA    test        eax,eax
>004239AC    je          004239B3
 004239AE    sub         eax,4
 004239B1    mov         eax,dword ptr [eax]
 004239B3    cmp         eax,dword ptr [esp+8]
>004239B7    jle         00423B16
 004239BD    mov         eax,dword ptr [esp+4]
 004239C1    dec         eax
 004239C2    mov         dword ptr [esp+0C],eax
 004239C6    xor         ebx,ebx
>004239C8    jmp         00423A83
 004239CD    cmp         dword ptr [esp+0C],0
>004239D2    jle         00423A46
 004239D4    mov         eax,dword ptr [esp+0C]
 004239D8    cmp         eax,dword ptr [esp+8]
>004239DC    jge         00423A46
 004239DE    inc         dword ptr [esp+0C]
 004239E2    mov         eax,dword ptr [esp+0C]
 004239E6    mov         dword ptr [esp+10],eax
 004239EA    mov         ecx,dword ptr [edi+14]
 004239ED    lea         edx,[esp+0C]
 004239F1    mov         eax,esi
 004239F3    call        ScanString
 004239F8    test        al,al
>004239FA    jne         00423A3A
 004239FC    lea         edx,[esp+0C]
 00423A00    mov         ecx,423B4C;'AM'
 00423A05    mov         eax,esi
 00423A07    call        ScanString
 00423A0C    test        al,al
>00423A0E    jne         00423A3A
 00423A10    mov         ecx,dword ptr [edi+18]
 00423A13    lea         edx,[esp+0C]
 00423A17    mov         eax,esi
 00423A19    call        ScanString
 00423A1E    test        al,al
>00423A20    jne         00423A3A
 00423A22    lea         edx,[esp+0C]
 00423A26    mov         ecx,423B60;^TStatusPanel.ParentBiDiModeChanged
 00423A2B    mov         eax,esi
 00423A2D    call        ScanString
 00423A32    test        al,al
>00423A34    jne         00423A3A
 00423A36    xor         ebx,ebx
>00423A38    jmp         00423A3C
 00423A3A    mov         bl,1
 00423A3C    mov         eax,dword ptr [esp+10]
 00423A40    mov         dword ptr [esp+0C],eax
>00423A44    jmp         00423A48
 00423A46    mov         bl,1
 00423A48    test        bl,bl
>00423A4A    jne         00423A83
>00423A4C    jmp         00423A52
 00423A4E    inc         dword ptr [esp+0C]
 00423A52    mov         eax,dword ptr [esp+0C]
 00423A56    cmp         word ptr [esi+eax*2-2],20
>00423A5C    je          00423A6B
 00423A5E    mov         eax,esi
 00423A60    call        @UStrLen
 00423A65    cmp         eax,dword ptr [esp+0C]
>00423A69    jge         00423A4E
 00423A6B    mov         ebp,esi
 00423A6D    test        ebp,ebp
>00423A6F    je          00423A77
 00423A71    sub         ebp,4
 00423A74    mov         ebp,dword ptr [ebp]
 00423A77    cmp         ebp,dword ptr [esp+0C]
>00423A7B    jge         00423A83
 00423A7D    xor         eax,eax
 00423A7F    mov         dword ptr [esp+0C],eax
 00423A83    test        bl,bl
>00423A85    jne         00423A95
 00423A87    mov         eax,dword ptr [esp+0C]
 00423A8B    cmp         eax,dword ptr [esp+8]
>00423A8F    jl          004239CD
 00423A95    test        bl,bl
>00423A97    je          00423AC8
 00423A99    cmp         dword ptr [esp+0C],0
>00423A9E    jle         00423ABE
 00423AA0    mov         eax,dword ptr [esp+0C]
 00423AA4    cmp         eax,dword ptr [esp+8]
>00423AA8    jge         00423AB4
 00423AAA    mov         eax,dword ptr [esp+0C]
 00423AAE    mov         dword ptr [esp+4],eax
>00423AB2    jmp         00423AD0
 00423AB4    mov         eax,dword ptr [esp+8]
 00423AB8    mov         dword ptr [esp+4],eax
>00423ABC    jmp         00423AD0
 00423ABE    mov         eax,dword ptr [esp+8]
 00423AC2    mov         dword ptr [esp+4],eax
>00423AC6    jmp         00423AD0
 00423AC8    mov         eax,dword ptr [esp+8]
 00423ACC    mov         dword ptr [esp+4],eax
 00423AD0    push        edi
 00423AD1    lea         ecx,[esp+24]
 00423AD5    lea         edx,[esp+8]
 00423AD9    mov         eax,esi
 00423ADB    call        ScanTime
 00423AE0    mov         ebx,eax
 00423AE2    test        bl,bl
>00423AE4    je          00423B36
 00423AE6    fld         qword ptr [esp+18]
 00423AEA    fcomp       dword ptr ds:[423B68]
 00423AF0    wait
 00423AF1    fnstsw      al
 00423AF3    sahf
>00423AF4    jb          00423B06
 00423AF6    fld         qword ptr [esp+18]
 00423AFA    fadd        qword ptr [esp+20]
 00423AFE    mov         eax,dword ptr [esp]
 00423B01    fstp        qword ptr [eax]
 00423B03    wait
>00423B04    jmp         00423B36
 00423B06    fld         qword ptr [esp+18]
 00423B0A    fsub        qword ptr [esp+20]
 00423B0E    mov         eax,dword ptr [esp]
 00423B11    fstp        qword ptr [eax]
 00423B13    wait
>00423B14    jmp         00423B36
 00423B16    mov         eax,dword ptr [esp]
 00423B19    mov         edx,dword ptr [esp+18]
 00423B1D    mov         dword ptr [eax],edx
 00423B1F    mov         edx,dword ptr [esp+1C]
 00423B23    mov         dword ptr [eax+4],edx
>00423B26    jmp         00423B36
 00423B28    mov         ecx,edi
 00423B2A    mov         edx,dword ptr [esp]
 00423B2D    mov         eax,esi
 00423B2F    call        TryStrToDateTime
 00423B34    mov         ebx,eax
 00423B36    mov         eax,ebx
 00423B38    add         esp,28
 00423B3B    pop         ebp
 00423B3C    pop         edi
 00423B3D    pop         esi
 00423B3E    pop         ebx
 00423B3F    ret
*}
end;

//00423B6C
function SysErrorMessage(ErrorCode:Cardinal):UnicodeString;
begin
{*
 00423B6C    push        ebp
 00423B6D    mov         ebp,esp
 00423B6F    push        ecx
 00423B70    push        ebx
 00423B71    push        esi
 00423B72    mov         esi,edx
 00423B74    push        0
 00423B76    push        0
 00423B78    lea         edx,[ebp-4]
 00423B7B    push        edx
 00423B7C    push        0
 00423B7E    push        eax
 00423B7F    push        0
 00423B81    push        3300
 00423B86    call        kernel32.FormatMessageW
 00423B8B    mov         ebx,eax
 00423B8D    xor         eax,eax
 00423B8F    push        ebp
 00423B90    push        423BDB
 00423B95    push        dword ptr fs:[eax]
 00423B98    mov         dword ptr fs:[eax],esp
>00423B9B    jmp         00423B9E
 00423B9D    dec         ebx
 00423B9E    test        ebx,ebx
>00423BA0    jle         00423BB8
 00423BA2    mov         eax,dword ptr [ebp-4]
 00423BA5    movzx       eax,word ptr [eax+ebx*2-2]
 00423BAA    mov         edx,423BE8
 00423BAF    call        CharInSet
 00423BB4    test        al,al
>00423BB6    jne         00423B9D
 00423BB8    mov         eax,esi
 00423BBA    mov         ecx,ebx
 00423BBC    mov         edx,dword ptr [ebp-4]
 00423BBF    call        @UStrFromPWCharLen
 00423BC4    xor         eax,eax
 00423BC6    pop         edx
 00423BC7    pop         ecx
 00423BC8    pop         ecx
 00423BC9    mov         dword ptr fs:[eax],edx
 00423BCC    push        423BE2
 00423BD1    mov         eax,dword ptr [ebp-4]
 00423BD4    push        eax
 00423BD5    call        kernel32.LocalFree
 00423BDA    ret
>00423BDB    jmp         @HandleFinally
>00423BE0    jmp         00423BD1
 00423BE2    pop         esi
 00423BE3    pop         ebx
 00423BE4    pop         ecx
 00423BE5    pop         ebp
 00423BE6    ret
*}
end;

//00423C08
function GetLocaleStr(Locale:Integer; LocaleType:Integer; const Default:UnicodeString):UnicodeString;
begin
{*
 00423C08    push        ebp
 00423C09    mov         ebp,esp
 00423C0B    add         esp,0FFFFFE00
 00423C11    push        ebx
 00423C12    push        esi
 00423C13    mov         esi,ecx
 00423C15    mov         ebx,dword ptr [ebp+8]
 00423C18    push        100
 00423C1D    lea         ecx,[ebp-200]
 00423C23    push        ecx
 00423C24    push        edx
 00423C25    push        eax
 00423C26    call        kernel32.GetLocaleInfoW
 00423C2B    test        eax,eax
>00423C2D    jle         00423C41
 00423C2F    mov         ecx,eax
 00423C31    dec         ecx
 00423C32    lea         edx,[ebp-200]
 00423C38    mov         eax,ebx
 00423C3A    call        @UStrFromPWCharLen
>00423C3F    jmp         00423C4A
 00423C41    mov         eax,ebx
 00423C43    mov         edx,esi
 00423C45    call        @UStrAsg
 00423C4A    pop         esi
 00423C4B    pop         ebx
 00423C4C    mov         esp,ebp
 00423C4E    pop         ebp
 00423C4F    ret         4
*}
end;

//00423C54
function GetLocaleChar(Locale:Integer; LocaleType:Integer; Default:Char):Char;
begin
{*
 00423C54    push        ebx
 00423C55    push        esi
 00423C56    push        edi
 00423C57    push        ecx
 00423C58    mov         edi,ecx
 00423C5A    mov         esi,edx
 00423C5C    mov         ebx,eax
 00423C5E    push        2
 00423C60    lea         eax,[esp+4]
 00423C64    push        eax
 00423C65    push        esi
 00423C66    push        ebx
 00423C67    call        kernel32.GetLocaleInfoW
 00423C6C    test        eax,eax
>00423C6E    jle         00423C76
 00423C70    movzx       eax,word ptr [esp]
>00423C74    jmp         00423C78
 00423C76    mov         eax,edi
 00423C78    pop         edx
 00423C79    pop         edi
 00423C7A    pop         esi
 00423C7B    pop         ebx
 00423C7C    ret
*}
end;

//00423C80
function TFormatSettings.Create:TFormatSettings;
begin
{*
 00423C80    push        ebp
 00423C81    mov         ebp,esp
 00423C83    mov         ecx,7
 00423C88    push        0
 00423C8A    push        0
 00423C8C    dec         ecx
>00423C8D    jne         00423C88
 00423C8F    push        ebx
 00423C90    push        esi
 00423C91    push        edi
 00423C92    mov         ebx,edx
 00423C94    mov         esi,eax
 00423C96    xor         eax,eax
 00423C98    push        ebp
 00423C99    push        423F4B
 00423C9E    push        dword ptr fs:[eax]
 00423CA1    mov         dword ptr fs:[eax],esp
 00423CA4    push        1
 00423CA6    push        esi
 00423CA7    call        kernel32.IsValidLocale
 00423CAC    test        eax,eax
>00423CAE    jne         00423CB7
 00423CB0    call        kernel32.GetThreadLocale
 00423CB5    mov         esi,eax
 00423CB7    mov         edx,ebx
 00423CB9    mov         eax,esi
 00423CBB    call        TFormatSettings.GetDayNames
 00423CC0    mov         edx,ebx
 00423CC2    mov         eax,esi
 00423CC4    call        TFormatSettings.GetMonthNames
 00423CC9    lea         eax,[ebp-10]
 00423CCC    push        eax
 00423CCD    xor         ecx,ecx
 00423CCF    mov         edx,14
 00423CD4    mov         eax,esi
 00423CD6    call        GetLocaleStr
 00423CDB    mov         edx,dword ptr [ebp-10]
 00423CDE    mov         eax,ebx
 00423CE0    call        @UStrAsg
 00423CE5    lea         eax,[ebp-14]
 00423CE8    push        eax
 00423CE9    mov         ecx,423F68;'0'
 00423CEE    mov         edx,1B
 00423CF3    mov         eax,esi
 00423CF5    call        GetLocaleStr
 00423CFA    mov         eax,dword ptr [ebp-14]
 00423CFD    xor         edx,edx
 00423CFF    call        StrToIntDef
 00423D04    mov         byte ptr [ebx+4],al
 00423D07    lea         eax,[ebp-18]
 00423D0A    push        eax
 00423D0B    mov         ecx,423F68;'0'
 00423D10    mov         edx,1C
 00423D15    mov         eax,esi
 00423D17    call        GetLocaleStr
 00423D1C    mov         eax,dword ptr [ebp-18]
 00423D1F    xor         edx,edx
 00423D21    call        StrToIntDef
 00423D26    mov         byte ptr [ebx+0C2],al
 00423D2C    mov         cx,2C
 00423D30    mov         edx,0F
 00423D35    mov         eax,esi
 00423D37    call        GetLocaleChar
 00423D3C    mov         word ptr [ebx+0BC],ax
 00423D43    mov         cx,2E
 00423D47    mov         edx,0E
 00423D4C    mov         eax,esi
 00423D4E    call        GetLocaleChar
 00423D53    mov         word ptr [ebx+0BE],ax
 00423D5A    lea         eax,[ebp-1C]
 00423D5D    push        eax
 00423D5E    mov         ecx,423F68;'0'
 00423D63    mov         edx,19
 00423D68    mov         eax,esi
 00423D6A    call        GetLocaleStr
 00423D6F    mov         eax,dword ptr [ebp-1C]
 00423D72    xor         edx,edx
 00423D74    call        StrToIntDef
 00423D79    mov         byte ptr [ebx+5],al
 00423D7C    mov         cx,2F
 00423D80    mov         edx,1D
 00423D85    mov         eax,esi
 00423D87    call        GetLocaleChar
 00423D8C    mov         edi,eax
 00423D8E    mov         word ptr [ebx+6],di
 00423D92    push        edi
 00423D93    lea         eax,[ebp-20]
 00423D96    push        eax
 00423D97    mov         ecx,423F78;'m/d/yy'
 00423D9C    mov         edx,1F
 00423DA1    mov         eax,esi
 00423DA3    call        TFormatSettings.TranslateDateFormat
 00423DA8    mov         edx,dword ptr [ebp-20]
 00423DAB    lea         eax,[ebx+0C]
 00423DAE    call        @UStrAsg
 00423DB3    movzx       eax,word ptr [ebx+6]
 00423DB7    push        eax
 00423DB8    lea         eax,[ebp-24]
 00423DBB    push        eax
 00423DBC    mov         ecx,423F94;'mmmm d, yyyy'
 00423DC1    mov         edx,20
 00423DC6    mov         eax,esi
 00423DC8    call        TFormatSettings.TranslateDateFormat
 00423DCD    mov         edx,dword ptr [ebp-24]
 00423DD0    lea         eax,[ebx+10]
 00423DD3    call        @UStrAsg
 00423DD8    mov         cx,3A
 00423DDC    mov         edx,1E
 00423DE1    mov         eax,esi
 00423DE3    call        GetLocaleChar
 00423DE8    mov         word ptr [ebx+8],ax
 00423DEC    lea         eax,[ebp-28]
 00423DEF    push        eax
 00423DF0    mov         ecx,423FBC;'am'
 00423DF5    mov         edx,28
 00423DFA    mov         eax,esi
 00423DFC    call        GetLocaleStr
 00423E01    mov         edx,dword ptr [ebp-28]
 00423E04    lea         eax,[ebx+14]
 00423E07    call        @UStrAsg
 00423E0C    lea         eax,[ebp-2C]
 00423E0F    push        eax
 00423E10    mov         ecx,423FD0;'pm'
 00423E15    mov         edx,29
 00423E1A    mov         eax,esi
 00423E1C    call        GetLocaleStr
 00423E21    mov         edx,dword ptr [ebp-2C]
 00423E24    lea         eax,[ebx+18]
 00423E27    call        @UStrAsg
 00423E2C    lea         eax,[ebp-8]
 00423E2F    call        @UStrClr
 00423E34    lea         eax,[ebp-0C]
 00423E37    call        @UStrClr
 00423E3C    lea         eax,[ebp-30]
 00423E3F    push        eax
 00423E40    mov         ecx,423F68;'0'
 00423E45    mov         edx,25
 00423E4A    mov         eax,esi
 00423E4C    call        GetLocaleStr
 00423E51    mov         eax,dword ptr [ebp-30]
 00423E54    xor         edx,edx
 00423E56    call        StrToIntDef
 00423E5B    test        eax,eax
>00423E5D    jne         00423E6E
 00423E5F    lea         eax,[ebp-4]
 00423E62    mov         edx,423FE4;'h'
 00423E67    call        @UStrLAsg
>00423E6C    jmp         00423E7B
 00423E6E    lea         eax,[ebp-4]
 00423E71    mov         edx,423FF4;'hh'
 00423E76    call        @UStrLAsg
 00423E7B    lea         eax,[ebp-34]
 00423E7E    push        eax
 00423E7F    mov         ecx,423F68;'0'
 00423E84    mov         edx,23
 00423E89    mov         eax,esi
 00423E8B    call        GetLocaleStr
 00423E90    mov         eax,dword ptr [ebp-34]
 00423E93    xor         edx,edx
 00423E95    call        StrToIntDef
 00423E9A    test        eax,eax
>00423E9C    jne         00423EDD
 00423E9E    lea         eax,[ebp-38]
 00423EA1    push        eax
 00423EA2    mov         ecx,423F68;'0'
 00423EA7    mov         edx,1005
 00423EAC    mov         eax,esi
 00423EAE    call        GetLocaleStr
 00423EB3    mov         eax,dword ptr [ebp-38]
 00423EB6    xor         edx,edx
 00423EB8    call        StrToIntDef
 00423EBD    test        eax,eax
>00423EBF    jne         00423ED0
 00423EC1    lea         eax,[ebp-0C]
 00423EC4    mov         edx,424008;' AMPM'
 00423EC9    call        @UStrLAsg
>00423ECE    jmp         00423EDD
 00423ED0    lea         eax,[ebp-8]
 00423ED3    mov         edx,424020;'AMPM '
 00423ED8    call        @UStrLAsg
 00423EDD    push        dword ptr [ebp-8]
 00423EE0    push        dword ptr [ebp-4]
 00423EE3    push        424038;':mm'
 00423EE8    push        dword ptr [ebp-0C]
 00423EEB    lea         eax,[ebx+1C]
 00423EEE    mov         edx,4
 00423EF3    call        @UStrCatN
 00423EF8    push        dword ptr [ebp-8]
 00423EFB    push        dword ptr [ebp-4]
 00423EFE    push        42404C;':mm:ss'
 00423F03    push        dword ptr [ebp-0C]
 00423F06    lea         eax,[ebx+20]
 00423F09    mov         edx,4
 00423F0E    call        @UStrCatN
 00423F13    mov         cx,2C
 00423F17    mov         edx,0C
 00423F1C    mov         eax,esi
 00423F1E    call        GetLocaleChar
 00423F23    mov         word ptr [ebx+0A],ax
 00423F27    mov         word ptr [ebx+0C0],32
 00423F30    xor         eax,eax
 00423F32    pop         edx
 00423F33    pop         ecx
 00423F34    pop         ecx
 00423F35    mov         dword ptr fs:[eax],edx
 00423F38    push        423F52
 00423F3D    lea         eax,[ebp-38]
 00423F40    mov         edx,0E
 00423F45    call        @UStrArrayClr
 00423F4A    ret
>00423F4B    jmp         @HandleFinally
>00423F50    jmp         00423F3D
 00423F52    pop         edi
 00423F53    pop         esi
 00423F54    pop         ebx
 00423F55    mov         esp,ebp
 00423F57    pop         ebp
 00423F58    ret
*}
end;

//0042405C
function TFormatSettings.Create:TFormatSettings;
begin
{*
 0042405C    push        ebp
 0042405D    mov         ebp,esp
 0042405F    push        0
 00424061    push        0
 00424063    push        ebx
 00424064    push        esi
 00424065    mov         esi,edx
 00424067    mov         ebx,eax
 00424069    xor         eax,eax
 0042406B    push        ebp
 0042406C    push        4240F6
 00424071    push        dword ptr fs:[eax]
 00424074    mov         dword ptr fs:[eax],esp
 00424077    test        ebx,ebx
>00424079    je          004240CB
 0042407B    cmp         dword ptr ds:[784C80],6;gvar_00784C80
>00424082    jl          004240A2
 00424084    push        0
 00424086    lea         edx,[ebp-4]
 00424089    mov         eax,ebx
 0042408B    call        TFormatSettings.AdjustLocaleName
 00424090    mov         eax,dword ptr [ebp-4]
 00424093    call        @UStrToPWChar
 00424098    push        eax
 00424099    call        LocaleNameToLCID
 0042409E    mov         ebx,eax
>004240A0    jmp         004240D2
 004240A2    lea         edx,[ebp-8]
 004240A5    mov         eax,ebx
 004240A7    call        TFormatSettings.AdjustLocaleName
 004240AC    mov         eax,dword ptr [ebp-8]
 004240AF    push        eax
 004240B0    call        Languages
 004240B5    pop         edx
 004240B6    call        TLanguages.IndexOf
 004240BB    push        eax
 004240BC    call        Languages
 004240C1    pop         edx
 004240C2    call        TLanguages.GetLocaleID
 004240C7    mov         ebx,eax
>004240C9    jmp         004240D2
 004240CB    call        kernel32.GetThreadLocale
 004240D0    mov         ebx,eax
 004240D2    mov         edx,esi
 004240D4    mov         eax,ebx
 004240D6    call        TFormatSettings.Create
 004240DB    xor         eax,eax
 004240DD    pop         edx
 004240DE    pop         ecx
 004240DF    pop         ecx
 004240E0    mov         dword ptr fs:[eax],edx
 004240E3    push        4240FD
 004240E8    lea         eax,[ebp-8]
 004240EB    mov         edx,2
 004240F0    call        @UStrArrayClr
 004240F5    ret
>004240F6    jmp         @HandleFinally
>004240FB    jmp         004240E8
 004240FD    pop         esi
 004240FE    pop         ebx
 004240FF    pop         ecx
 00424100    pop         ecx
 00424101    pop         ebp
 00424102    ret
*}
end;

//00424104
function TFormatSettings.Create:TFormatSettings;
begin
{*
 00424104    push        ebx
 00424105    mov         ebx,eax
 00424107    mov         edx,ebx
 00424109    xor         eax,eax
 0042410B    call        TFormatSettings.Create
 00424110    pop         ebx
 00424111    ret
*}
end;

//00424114
function TFormatSettings.AdjustLocaleName:UnicodeString;
begin
{*
 00424114    push        ebx
 00424115    push        esi
 00424116    mov         ebx,edx
 00424118    mov         esi,eax
 0042411A    mov         eax,ebx
 0042411C    mov         edx,esi
 0042411E    call        @UStrAsg
 00424123    mov         eax,dword ptr [ebx]
 00424125    call        @UStrToPWChar
>0042412A    jmp         0042413D
 0042412C    cmp         dx,5F
>00424130    jne         0042413A
 00424132    mov         word ptr [eax],2D
 00424137    pop         esi
 00424138    pop         ebx
 00424139    ret
 0042413A    add         eax,2
 0042413D    movzx       edx,word ptr [eax]
 00424140    test        dx,dx
>00424143    jne         0042412C
 00424145    pop         esi
 00424146    pop         ebx
 00424147    ret
*}
end;

//00424148
procedure TFormatSettings.GetDayNames(var AFormatSettings:TFormatSettings);
begin
{*
 00424148    push        ebp
 00424149    mov         ebp,esp
 0042414B    add         esp,0FFFFFFF0
 0042414E    push        ebx
 0042414F    push        esi
 00424150    push        edi
 00424151    xor         ecx,ecx
 00424153    mov         dword ptr [ebp-10],ecx
 00424156    mov         dword ptr [ebp-0C],ecx
 00424159    mov         dword ptr [ebp-8],edx
 0042415C    mov         dword ptr [ebp-4],eax
 0042415F    xor         eax,eax
 00424161    push        ebp
 00424162    push        4241F3
 00424167    push        dword ptr fs:[eax]
 0042416A    mov         dword ptr fs:[eax],esp
 0042416D    mov         esi,1
 00424172    mov         ebx,dword ptr [ebp-8]
 00424175    add         ebx,84
 0042417B    lea         eax,[esi+5]
 0042417E    mov         ecx,7
 00424183    cdq
 00424184    idiv        eax,ecx
 00424186    mov         edi,edx
 00424188    push        784DC4;^SResString87:TResStringRec
 0042418D    push        6
 0042418F    lea         eax,[ebp-0C]
 00424192    push        eax
 00424193    mov         ecx,esi
 00424195    dec         ecx
 00424196    lea         edx,[edi+31]
 00424199    mov         eax,dword ptr [ebp-4]
 0042419C    call        TFormatSettings.GetString
 004241A1    mov         edx,dword ptr [ebp-0C]
 004241A4    mov         eax,ebx
 004241A6    call        @UStrAsg
 004241AB    push        784DE0;^SResString94:TResStringRec
 004241B0    push        6
 004241B2    lea         eax,[ebp-10]
 004241B5    push        eax
 004241B6    mov         ecx,esi
 004241B8    dec         ecx
 004241B9    lea         edx,[edi+2A]
 004241BC    mov         eax,dword ptr [ebp-4]
 004241BF    call        TFormatSettings.GetString
 004241C4    mov         edx,dword ptr [ebp-10]
 004241C7    lea         eax,[ebx+1C]
 004241CA    call        @UStrAsg
 004241CF    inc         esi
 004241D0    add         ebx,4
 004241D3    cmp         esi,8
>004241D6    jne         0042417B
 004241D8    xor         eax,eax
 004241DA    pop         edx
 004241DB    pop         ecx
 004241DC    pop         ecx
 004241DD    mov         dword ptr fs:[eax],edx
 004241E0    push        4241FA
 004241E5    lea         eax,[ebp-10]
 004241E8    mov         edx,2
 004241ED    call        @UStrArrayClr
 004241F2    ret
>004241F3    jmp         @HandleFinally
>004241F8    jmp         004241E5
 004241FA    pop         edi
 004241FB    pop         esi
 004241FC    pop         ebx
 004241FD    mov         esp,ebp
 004241FF    pop         ebp
 00424200    ret
*}
end;

//00424204
procedure TFormatSettings.GetMonthNames(var AFormatSettings:TFormatSettings);
begin
{*
 00424204    push        ebp
 00424205    mov         ebp,esp
 00424207    push        0
 00424209    push        0
 0042420B    push        0
 0042420D    push        ebx
 0042420E    push        esi
 0042420F    push        edi
 00424210    mov         dword ptr [ebp-4],edx
 00424213    mov         edi,eax
 00424215    xor         eax,eax
 00424217    push        ebp
 00424218    push        424299
 0042421D    push        dword ptr fs:[eax]
 00424220    mov         dword ptr fs:[eax],esp
 00424223    mov         esi,1
 00424228    mov         ebx,dword ptr [ebp-4]
 0042422B    add         ebx,24
 0042422E    push        784D64;^SResString63:TResStringRec
 00424233    push        0B
 00424235    lea         eax,[ebp-8]
 00424238    push        eax
 00424239    mov         ecx,esi
 0042423B    dec         ecx
 0042423C    lea         edx,[esi+44]
 0042423F    dec         edx
 00424240    mov         eax,edi
 00424242    call        TFormatSettings.GetString
 00424247    mov         edx,dword ptr [ebp-8]
 0042424A    mov         eax,ebx
 0042424C    call        @UStrAsg
 00424251    push        784D94;^SResString75:TResStringRec
 00424256    push        0B
 00424258    lea         eax,[ebp-0C]
 0042425B    push        eax
 0042425C    mov         ecx,esi
 0042425E    dec         ecx
 0042425F    lea         edx,[esi+38]
 00424262    dec         edx
 00424263    mov         eax,edi
 00424265    call        TFormatSettings.GetString
 0042426A    mov         edx,dword ptr [ebp-0C]
 0042426D    lea         eax,[ebx+30]
 00424270    call        @UStrAsg
 00424275    inc         esi
 00424276    add         ebx,4
 00424279    cmp         esi,0D
>0042427C    jne         0042422E
 0042427E    xor         eax,eax
 00424280    pop         edx
 00424281    pop         ecx
 00424282    pop         ecx
 00424283    mov         dword ptr fs:[eax],edx
 00424286    push        4242A0
 0042428B    lea         eax,[ebp-0C]
 0042428E    mov         edx,2
 00424293    call        @UStrArrayClr
 00424298    ret
>00424299    jmp         @HandleFinally
>0042429E    jmp         0042428B
 004242A0    pop         edi
 004242A1    pop         esi
 004242A2    pop         ebx
 004242A3    mov         esp,ebp
 004242A5    pop         ebp
 004242A6    ret
*}
end;

//004242A8
function TFormatSettings.GetString(LocaleItem:Integer; DefaultIndex:Integer; const DefaultValues:array[$0..-$1] of System.Pointer; const _Dv_:$0..-$1):UnicodeString;
begin
{*
 004242A8    push        ebp
 004242A9    mov         ebp,esp
 004242AB    push        ecx
 004242AC    push        ebx
 004242AD    push        esi
 004242AE    push        edi
 004242AF    mov         dword ptr [ebp-4],ecx
 004242B2    mov         edi,edx
 004242B4    mov         esi,eax
 004242B6    mov         ebx,dword ptr [ebp+8]
 004242B9    push        ebx
 004242BA    xor         ecx,ecx
 004242BC    mov         edx,edi
 004242BE    mov         eax,esi
 004242C0    call        GetLocaleStr
 004242C5    cmp         dword ptr [ebx],0
>004242C8    jne         004242DA
 004242CA    mov         eax,dword ptr [ebp+10]
 004242CD    mov         edx,dword ptr [ebp-4]
 004242D0    mov         eax,dword ptr [eax+edx*4]
 004242D3    mov         edx,ebx
 004242D5    call        LoadResString
 004242DA    pop         edi
 004242DB    pop         esi
 004242DC    pop         ebx
 004242DD    pop         ecx
 004242DE    pop         ebp
 004242DF    ret         0C
*}
end;

//004242E4
procedure FixDateSeparator(var DateFormat:UnicodeString);
begin
{*
 004242E4    push        ebp
 004242E5    mov         ebp,esp
 004242E7    push        ebx
 004242E8    mov         ebx,eax
 004242EA    mov         eax,dword ptr [ebx]
 004242EC    call        @UStrToPWChar
 004242F1    test        eax,eax
>004242F3    je          00424310
>004242F5    jmp         00424308
 004242F7    mov         ecx,dword ptr [ebp+8]
 004242FA    cmp         dx,word ptr [ecx+0C]
>004242FE    jne         00424305
 00424300    mov         word ptr [eax],2F
 00424305    add         eax,2
 00424308    movzx       edx,word ptr [eax]
 0042430B    test        dx,dx
>0042430E    jne         004242F7
 00424310    pop         ebx
 00424311    pop         ebp
 00424312    ret
*}
end;

//00424314
function TFormatSettings.TranslateDateFormat(LocaleType:Integer; const Default:UnicodeString; const Separator:Char):UnicodeString;
begin
{*
 00424314    push        ebp
 00424315    mov         ebp,esp
 00424317    push        0
 00424319    push        0
 0042431B    push        0
 0042431D    push        0
 0042431F    push        0
 00424321    push        0
 00424323    push        0
 00424325    push        0
 00424327    push        ebx
 00424328    push        esi
 00424329    push        edi
 0042432A    mov         dword ptr [ebp-0C],ecx
 0042432D    mov         dword ptr [ebp-8],edx
 00424330    mov         edi,eax
 00424332    mov         esi,dword ptr [ebp+8]
 00424335    xor         eax,eax
 00424337    push        ebp
 00424338    push        424552
 0042433D    push        dword ptr fs:[eax]
 00424340    mov         dword ptr fs:[eax],esp
 00424343    mov         ebx,1
 00424348    mov         eax,esi
 0042434A    call        @UStrClr
 0042434F    lea         eax,[ebp-4]
 00424352    push        eax
 00424353    mov         ecx,dword ptr [ebp-0C]
 00424356    mov         edx,dword ptr [ebp-8]
 00424359    mov         eax,edi
 0042435B    call        GetLocaleStr
 00424360    lea         eax,[ebp-14]
 00424363    push        eax
 00424364    mov         ecx,424570;'1'
 00424369    mov         edx,1009
 0042436E    mov         eax,edi
 00424370    call        GetLocaleStr
 00424375    mov         eax,dword ptr [ebp-14]
 00424378    mov         edx,1
 0042437D    call        StrToIntDef
 00424382    add         eax,0FFFFFFFD
 00424385    sub         eax,3
>00424388    jb          00424516
 0042438E    mov         eax,[00790DA3]
 00424393    sub         eax,4
>00424396    je          004243A4
 00424398    add         eax,0FFFFFFF3
 0042439B    sub         eax,2
>0042439E    jb          004243A4
 004243A0    xor         eax,eax
>004243A2    jmp         004243A6
 004243A4    mov         al,1
 004243A6    test        al,al
>004243A8    je          004243E5
>004243AA    jmp         004243D7
 004243AC    mov         eax,dword ptr [ebp-4]
 004243AF    movzx       edi,word ptr [eax+ebx*2-2]
 004243B4    mov         eax,edi
 004243B6    sub         ax,47
>004243BA    je          004243D6
 004243BC    sub         ax,20
>004243C0    je          004243D6
 004243C2    lea         eax,[ebp-18]
 004243C5    mov         edx,edi
 004243C7    call        @UStrFromWChar
 004243CC    mov         edx,dword ptr [ebp-18]
 004243CF    mov         eax,esi
 004243D1    call        @UStrCat
 004243D6    inc         ebx
 004243D7    mov         eax,dword ptr [ebp-4]
 004243DA    call        @UStrLen
 004243DF    cmp         ebx,eax
>004243E1    jle         004243AC
>004243E3    jmp         004243EF
 004243E5    mov         eax,esi
 004243E7    mov         edx,dword ptr [ebp-4]
 004243EA    call        @UStrAsg
 004243EF    push        ebp
 004243F0    mov         eax,esi
 004243F2    call        FixDateSeparator
 004243F7    pop         ecx
>004243F8    jmp         0042452F
 004243FD    mov         eax,dword ptr [ebp-4]
 00424400    movzx       edi,word ptr [eax+ebx*2-2]
 00424405    cmp         di,0D800
>0042440A    jb          0042444A
 0042440C    cmp         di,0DFFF
>00424411    ja          0042444A
 00424413    mov         edx,ebx
 00424415    mov         eax,dword ptr [ebp-4]
 00424418    call        CharLength
 0042441D    sar         eax,1
>0042441F    jns         00424424
 00424421    adc         eax,0
 00424424    mov         dword ptr [ebp-10],eax
 00424427    lea         eax,[ebp-1C]
 0042442A    push        eax
 0042442B    mov         ecx,dword ptr [ebp-10]
 0042442E    mov         edx,ebx
 00424430    mov         eax,dword ptr [ebp-4]
 00424433    call        @UStrCopy
 00424438    mov         edx,dword ptr [ebp-1C]
 0042443B    mov         eax,esi
 0042443D    call        @UStrCat
 00424442    add         ebx,dword ptr [ebp-10]
>00424445    jmp         00424516
 0042444A    lea         eax,[ebp-4]
 0042444D    call        @UniqueStringU
 00424452    lea         eax,[eax+ebx*2-2]
 00424456    mov         edx,424574
 0042445B    mov         ecx,2
 00424460    call        StrLIComp
 00424465    test        eax,eax
>00424467    jne         0042447B
 00424469    mov         eax,esi
 0042446B    mov         edx,424588;'ggg'
 00424470    call        @UStrCat
 00424475    inc         ebx
>00424476    jmp         00424515
 0042447B    lea         eax,[ebp-4]
 0042447E    call        @UniqueStringU
 00424483    lea         eax,[eax+ebx*2-2]
 00424487    mov         edx,424590
 0042448C    mov         ecx,4
 00424491    call        StrLIComp
 00424496    test        eax,eax
>00424498    jne         004244AB
 0042449A    mov         eax,esi
 0042449C    mov         edx,4245A8;'eeee'
 004244A1    call        @UStrCat
 004244A6    add         ebx,3
>004244A9    jmp         00424515
 004244AB    lea         eax,[ebp-4]
 004244AE    call        @UniqueStringU
 004244B3    lea         eax,[eax+ebx*2-2]
 004244B7    mov         edx,4245B4
 004244BC    mov         ecx,2
 004244C1    call        StrLIComp
 004244C6    test        eax,eax
>004244C8    jne         004244D9
 004244CA    mov         eax,esi
 004244CC    mov         edx,4245C8;'ee'
 004244D1    call        @UStrCat
 004244D6    inc         ebx
>004244D7    jmp         00424515
 004244D9    mov         eax,dword ptr [ebp-4]
 004244DC    movzx       eax,word ptr [eax+ebx*2-2]
 004244E1    sub         ax,59
>004244E5    je          004244ED
 004244E7    sub         ax,20
>004244EB    jne         004244FB
 004244ED    mov         eax,esi
 004244EF    mov         edx,4245DC;'e'
 004244F4    call        @UStrCat
>004244F9    jmp         00424515
 004244FB    lea         eax,[ebp-20]
 004244FE    mov         edx,dword ptr [ebp-4]
 00424501    movzx       edx,word ptr [edx+ebx*2-2]
 00424506    call        @UStrFromWChar
 0042450B    mov         edx,dword ptr [ebp-20]
 0042450E    mov         eax,esi
 00424510    call        @UStrCat
 00424515    inc         ebx
 00424516    mov         eax,dword ptr [ebp-4]
 00424519    call        @UStrLen
 0042451E    cmp         ebx,eax
>00424520    jle         004243FD
 00424526    push        ebp
 00424527    mov         eax,esi
 00424529    call        FixDateSeparator
 0042452E    pop         ecx
 0042452F    xor         eax,eax
 00424531    pop         edx
 00424532    pop         ecx
 00424533    pop         ecx
 00424534    mov         dword ptr fs:[eax],edx
 00424537    push        424559
 0042453C    lea         eax,[ebp-20]
 0042453F    mov         edx,4
 00424544    call        @UStrArrayClr
 00424549    lea         eax,[ebp-4]
 0042454C    call        @UStrClr
 00424551    ret
>00424552    jmp         @HandleFinally
>00424557    jmp         0042453C
 00424559    pop         edi
 0042455A    pop         esi
 0042455B    pop         ebx
 0042455C    mov         esp,ebp
 0042455E    pop         ebp
 0042455F    ret         8
*}
end;

//004245E0
function EnumEraNames(Names:PChar):Integer; stdcall;
begin
{*
 004245E0    push        ebp
 004245E1    mov         ebp,esp
 004245E3    push        ebx
 004245E4    push        esi
 004245E5    xor         esi,esi
 004245E7    mov         ebx,1
>004245EC    jmp         004245F4
 004245EE    cmp         ebx,7
>004245F1    je          00424612
 004245F3    inc         ebx
 004245F4    cmp         dword ptr [ebx*4+790DAC],0
>004245FC    jne         004245EE
 004245FE    lea         eax,[ebx*4+790DAC]
 00424605    mov         edx,dword ptr [ebp+8]
 00424608    call        @UStrFromPWChar
 0042460D    mov         esi,1
 00424612    mov         eax,esi
 00424614    pop         esi
 00424615    pop         ebx
 00424616    pop         ebp
 00424617    ret         4
*}
end;

//0042461C
function EnumEraYearOffsets(YearOffsets:PChar):Integer; stdcall;
begin
{*
 0042461C    push        ebp
 0042461D    mov         ebp,esp
 0042461F    push        0
 00424621    push        ebx
 00424622    push        esi
 00424623    xor         eax,eax
 00424625    push        ebp
 00424626    push        424681
 0042462B    push        dword ptr fs:[eax]
 0042462E    mov         dword ptr fs:[eax],esp
 00424631    xor         esi,esi
 00424633    mov         ebx,1
>00424638    jmp         00424640
 0042463A    cmp         ebx,7
>0042463D    je          0042466B
 0042463F    inc         ebx
 00424640    cmp         dword ptr [ebx*4+790DC8],0FFFFFFFF
>00424648    jne         0042463A
 0042464A    lea         eax,[ebp-4]
 0042464D    mov         edx,dword ptr [ebp+8]
 00424650    call        @UStrFromPWChar
 00424655    mov         eax,dword ptr [ebp-4]
 00424658    xor         edx,edx
 0042465A    call        StrToIntDef
 0042465F    mov         dword ptr [ebx*4+790DC8],eax
 00424666    mov         esi,1
 0042466B    xor         eax,eax
 0042466D    pop         edx
 0042466E    pop         ecx
 0042466F    pop         ecx
 00424670    mov         dword ptr fs:[eax],edx
 00424673    push        424688
 00424678    lea         eax,[ebp-4]
 0042467B    call        @UStrClr
 00424680    ret
>00424681    jmp         @HandleFinally
>00424686    jmp         00424678
 00424688    mov         eax,esi
 0042468A    pop         esi
 0042468B    pop         ebx
 0042468C    pop         ecx
 0042468D    pop         ebp
 0042468E    ret         4
*}
end;

//00424694
procedure GetEraNamesAndYearOffsets;
begin
{*
 00424694    push        ebp
 00424695    mov         ebp,esp
 00424697    push        0
 00424699    push        esi
 0042469A    xor         eax,eax
 0042469C    push        ebp
 0042469D    push        42472B
 004246A2    push        dword ptr fs:[eax]
 004246A5    mov         dword ptr fs:[eax],esp
 004246A8    lea         eax,[ebp-4]
 004246AB    push        eax
 004246AC    call        kernel32.GetThreadLocale
 004246B1    mov         ecx,424744;'1'
 004246B6    mov         edx,100B
 004246BB    call        GetLocaleStr
 004246C0    mov         eax,dword ptr [ebp-4]
 004246C3    mov         edx,1
 004246C8    call        StrToIntDef
 004246CD    mov         esi,eax
 004246CF    mov         eax,esi
 004246D1    add         eax,0FFFFFFFD
 004246D4    sub         eax,3
>004246D7    jae         00424715
 004246D9    push        4
 004246DB    push        esi
 004246DC    call        kernel32.GetThreadLocale
 004246E1    push        eax
 004246E2    push        4245E0;EnumEraNames:Integer
 004246E7    call        kernel32.EnumCalendarInfoW
 004246EC    mov         edx,7
 004246F1    mov         eax,790DCC
 004246F6    mov         dword ptr [eax],0FFFFFFFF
 004246FC    add         eax,4
 004246FF    dec         edx
>00424700    jne         004246F6
 00424702    push        3
 00424704    push        esi
 00424705    call        kernel32.GetThreadLocale
 0042470A    push        eax
 0042470B    push        42461C;EnumEraYearOffsets:Integer
 00424710    call        kernel32.EnumCalendarInfoW
 00424715    xor         eax,eax
 00424717    pop         edx
 00424718    pop         ecx
 00424719    pop         ecx
 0042471A    mov         dword ptr fs:[eax],edx
 0042471D    push        424732
 00424722    lea         eax,[ebp-4]
 00424725    call        @UStrClr
 0042472A    ret
>0042472B    jmp         @HandleFinally
>00424730    jmp         00424722
 00424732    pop         esi
 00424733    pop         ecx
 00424734    pop         ebp
 00424735    ret
*}
end;

//00424748
function ConvertAddr(Address:Pointer):Pointer;
begin
{*
 00424748    test        eax,eax
>0042474A    je          00424751
 0042474C    sub         eax,1000
 00424751    ret
*}
end;

//00424754
function ExceptionErrorMessage(ExceptObject:TObject; ExceptAddr:Pointer; Buffer:PChar; Size:Integer):Integer;
begin
{*
 00424754    push        ebp
 00424755    mov         ebp,esp
 00424757    add         esp,0FFFFF99C
 0042475D    push        ebx
 0042475E    push        esi
 0042475F    push        edi
 00424760    xor         ebx,ebx
 00424762    mov         dword ptr [ebp-664],ebx
 00424768    mov         dword ptr [ebp-4],ecx
 0042476B    mov         ebx,edx
 0042476D    mov         esi,eax
 0042476F    xor         eax,eax
 00424771    push        ebp
 00424772    push        424900
 00424777    push        dword ptr fs:[eax]
 0042477A    mov         dword ptr fs:[eax],esp
 0042477D    push        1C
 0042477F    lea         eax,[ebp-638]
 00424785    push        eax
 00424786    push        ebx
 00424787    call        kernel32.VirtualQuery
 0042478C    cmp         dword ptr [ebp-628],1000
>00424796    jne         004247B4
 00424798    push        105
 0042479D    lea         eax,[ebp-41C]
 004247A3    push        eax
 004247A4    mov         eax,dword ptr [ebp-634]
 004247AA    push        eax
 004247AB    call        kernel32.GetModuleFileNameW
 004247B0    test        eax,eax
>004247B2    jne         004247D7
 004247B4    push        105
 004247B9    lea         eax,[ebp-41C]
 004247BF    push        eax
 004247C0    mov         eax,[00790C38];gvar_00790C38
 004247C5    push        eax
 004247C6    call        kernel32.GetModuleFileNameW
 004247CB    mov         eax,ebx
 004247CD    call        ConvertAddr
 004247D2    mov         dword ptr [ebp-8],eax
>004247D5    jmp         004247E0
 004247D7    sub         ebx,dword ptr [ebp-634]
 004247DD    mov         dword ptr [ebp-8],ebx
 004247E0    lea         eax,[ebp-41C]
 004247E6    mov         dx,5C
 004247EA    call        AnsiStrRScan
 004247EF    mov         edx,eax
 004247F1    add         edx,2
 004247F4    lea         eax,[ebp-212]
 004247FA    mov         ecx,104
 004247FF    call        StrLCopy
 00424804    mov         ebx,424914
 00424809    mov         edi,424914
 0042480E    mov         eax,esi
 00424810    mov         edx,dword ptr ds:[418C04];Exception
 00424816    call        @IsClass
 0042481B    test        al,al
>0042481D    je          00424841
 0042481F    mov         eax,dword ptr [esi+4]
 00424822    call        @UStrToPWChar
 00424827    mov         ebx,eax
 00424829    mov         eax,ebx
 0042482B    call        StrLen
 00424830    test        eax,eax
>00424832    je          00424841
 00424834    cmp         word ptr [ebx+eax*2-2],2E
>0042483A    je          00424841
 0042483C    mov         edi,424918
 00424841    push        100
 00424846    lea         eax,[ebp-61C]
 0042484C    push        eax
 0042484D    mov         eax,[0078DADC];^SResString26:TResStringRec
 00424852    mov         eax,dword ptr [eax+4]
 00424855    push        eax
 00424856    mov         eax,[00790C38];gvar_00790C38
 0042485B    call        FindResourceHInstance
 00424860    push        eax
 00424861    call        user32.LoadStringW
 00424866    lea         edx,[ebp-664]
 0042486C    mov         eax,dword ptr [esi]
 0042486E    call        TObject.ClassName
 00424873    mov         eax,dword ptr [ebp-664]
 00424879    mov         dword ptr [ebp-660],eax
 0042487F    mov         byte ptr [ebp-65C],11
 00424886    lea         eax,[ebp-212]
 0042488C    mov         dword ptr [ebp-658],eax
 00424892    mov         byte ptr [ebp-654],0A
 00424899    mov         eax,dword ptr [ebp-8]
 0042489C    mov         dword ptr [ebp-650],eax
 004248A2    mov         byte ptr [ebp-64C],5
 004248A9    mov         dword ptr [ebp-648],ebx
 004248AF    mov         byte ptr [ebp-644],0A
 004248B6    mov         dword ptr [ebp-640],edi
 004248BC    mov         byte ptr [ebp-63C],0A
 004248C3    lea         eax,[ebp-660]
 004248C9    push        eax
 004248CA    push        4
 004248CC    lea         ecx,[ebp-61C]
 004248D2    mov         edx,dword ptr [ebp+8]
 004248D5    mov         eax,dword ptr [ebp-4]
 004248D8    call        StrLFmt
 004248DD    mov         eax,dword ptr [ebp-4]
 004248E0    call        StrLen
 004248E5    mov         ebx,eax
 004248E7    xor         eax,eax
 004248E9    pop         edx
 004248EA    pop         ecx
 004248EB    pop         ecx
 004248EC    mov         dword ptr fs:[eax],edx
 004248EF    push        424907
 004248F4    lea         eax,[ebp-664]
 004248FA    call        @UStrClr
 004248FF    ret
>00424900    jmp         @HandleFinally
>00424905    jmp         004248F4
 00424907    mov         eax,ebx
 00424909    pop         edi
 0042490A    pop         esi
 0042490B    pop         ebx
 0042490C    mov         esp,ebp
 0042490E    pop         ebp
 0042490F    ret         4
*}
end;

//00424944
procedure ShowException(ExceptObject:TObject; ExceptAddr:Pointer);
begin
{*
 00424944    push        ebp
 00424945    mov         ebp,esp
 00424947    add         esp,0FFFFF778
 0042494D    push        ebx
 0042494E    push        esi
 0042494F    xor         ecx,ecx
 00424951    mov         dword ptr [ebp-4],ecx
 00424954    xor         ecx,ecx
 00424956    push        ebp
 00424957    push        424A69
 0042495C    push        dword ptr fs:[ecx]
 0042495F    mov         dword ptr fs:[ecx],esp
 00424962    push        400
 00424967    lea         ecx,[ebp-888]
 0042496D    call        ExceptionErrorMessage
 00424972    mov         esi,eax
 00424974    mov         eax,[0078D730];IsConsole:Boolean
 00424979    cmp         byte ptr [eax],0
>0042497C    je          00424A11
 00424982    mov         eax,[0078CFEC];Output:Text
 00424987    call        Flush
 0042498C    call        @_IOTest
 00424991    push        0
 00424993    push        0
 00424995    push        0
 00424997    push        0
 00424999    push        esi
 0042499A    lea         eax,[ebp-888]
 004249A0    push        eax
 004249A1    push        0
 004249A3    push        1
 004249A5    call        kernel32.WideCharToMultiByte
 004249AA    mov         ebx,eax
 004249AC    push        ebx
 004249AD    lea         eax,[ebp-4]
 004249B0    mov         ecx,1
 004249B5    mov         edx,dword ptr ds:[42491C];:27
 004249BB    call        @DynArraySetLength
 004249C0    add         esp,4
 004249C3    push        0
 004249C5    push        0
 004249C7    push        ebx
 004249C8    mov         eax,dword ptr [ebp-4]
 004249CB    push        eax
 004249CC    push        esi
 004249CD    lea         eax,[ebp-888]
 004249D3    push        eax
 004249D4    push        0
 004249D6    push        1
 004249D8    call        kernel32.WideCharToMultiByte
 004249DD    push        0
 004249DF    lea         eax,[ebp-8]
 004249E2    push        eax
 004249E3    push        ebx
 004249E4    mov         eax,dword ptr [ebp-4]
 004249E7    push        eax
 004249E8    push        0F4
 004249EA    call        kernel32.GetStdHandle
 004249EF    push        eax
 004249F0    call        kernel32.WriteFile
 004249F5    push        0
 004249F7    lea         eax,[ebp-8]
 004249FA    push        eax
 004249FB    push        2
 004249FD    push        424A84;#13+#10
 00424A02    push        0F4
 00424A04    call        kernel32.GetStdHandle
 00424A09    push        eax
 00424A0A    call        kernel32.WriteFile
>00424A0F    jmp         00424A4D
 00424A11    push        40
 00424A13    lea         eax,[ebp-88]
 00424A19    push        eax
 00424A1A    mov         eax,[0078CF04];^SResString27:TResStringRec
 00424A1F    mov         eax,dword ptr [eax+4]
 00424A22    push        eax
 00424A23    mov         eax,[00790C38];gvar_00790C38
 00424A28    call        FindResourceHInstance
 00424A2D    push        eax
 00424A2E    call        user32.LoadStringW
 00424A33    push        2010
 00424A38    lea         eax,[ebp-88]
 00424A3E    push        eax
 00424A3F    lea         eax,[ebp-888]
 00424A45    push        eax
 00424A46    push        0
 00424A48    call        user32.MessageBoxW
 00424A4D    xor         eax,eax
 00424A4F    pop         edx
 00424A50    pop         ecx
 00424A51    pop         ecx
 00424A52    mov         dword ptr fs:[eax],edx
 00424A55    push        424A70
 00424A5A    lea         eax,[ebp-4]
 00424A5D    mov         edx,dword ptr ds:[42491C];:27
 00424A63    call        @DynArrayClear
 00424A68    ret
>00424A69    jmp         @HandleFinally
>00424A6E    jmp         00424A5A
 00424A70    pop         esi
 00424A71    pop         ebx
 00424A72    mov         esp,ebp
 00424A74    pop         ebp
 00424A75    ret
*}
end;

//00424A88
procedure RaiseEAbort(ReturnAddr:Pointer);
begin
{*
 00424A88    push        ebx
 00424A89    mov         ebx,eax
 00424A8B    push        ebx
 00424A8C    mov         ecx,dword ptr ds:[78D284];^SResString25:TResStringRec
 00424A92    mov         dl,1
 00424A94    mov         eax,[004195F4];EAbort
 00424A99    call        Exception.CreateRes
>00424A9E    jmp         @RaiseExcept
 00424AA3    pop         ebx
 00424AA4    ret
*}
end;

//00424AA8
procedure Abort;
begin
{*
 00424AA8    mov         eax,dword ptr [esp]
>00424AAB    jmp         RaiseEAbort
 00424AB0    ret
*}
end;

//00424AB4
procedure OutOfMemoryError;
begin
{*
 00424AB4    mov         eax,[00790E14]
 00424AB9    call        @RaiseExcept
 00424ABE    ret
*}
end;

//00424AC0
constructor Exception.Create;
begin
{*
 00424AC0    push        ebx
 00424AC1    push        esi
 00424AC2    push        edi
 00424AC3    test        dl,dl
>00424AC5    je          00424ACF
 00424AC7    add         esp,0FFFFFFF0
 00424ACA    call        @ClassCreate
 00424ACF    mov         esi,ecx
 00424AD1    mov         ebx,edx
 00424AD3    mov         edi,eax
 00424AD5    lea         eax,[edi+4]
 00424AD8    mov         edx,esi
 00424ADA    call        @UStrAsg
 00424ADF    mov         eax,edi
 00424AE1    test        bl,bl
>00424AE3    je          00424AF4
 00424AE5    call        @AfterConstruction
 00424AEA    pop         dword ptr fs:[0]
 00424AF1    add         esp,0C
 00424AF4    mov         eax,edi
 00424AF6    pop         edi
 00424AF7    pop         esi
 00424AF8    pop         ebx
 00424AF9    ret
*}
end;

//00424AFC
constructor Exception.CreateFmt(const Msg:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);
begin
{*
 00424AFC    push        ebp
 00424AFD    mov         ebp,esp
 00424AFF    push        0
 00424B01    push        ebx
 00424B02    push        esi
 00424B03    push        edi
 00424B04    test        dl,dl
>00424B06    je          00424B10
 00424B08    add         esp,0FFFFFFF0
 00424B0B    call        @ClassCreate
 00424B10    mov         esi,ecx
 00424B12    mov         ebx,edx
 00424B14    mov         edi,eax
 00424B16    xor         eax,eax
 00424B18    push        ebp
 00424B19    push        424B56
 00424B1E    push        dword ptr fs:[eax]
 00424B21    mov         dword ptr fs:[eax],esp
 00424B24    lea         eax,[ebp-4]
 00424B27    push        eax
 00424B28    mov         edx,dword ptr [ebp+0C]
 00424B2B    mov         ecx,dword ptr [ebp+8]
 00424B2E    mov         eax,esi
 00424B30    call        Format
 00424B35    mov         edx,dword ptr [ebp-4]
 00424B38    lea         eax,[edi+4]
 00424B3B    call        @UStrAsg
 00424B40    xor         eax,eax
 00424B42    pop         edx
 00424B43    pop         ecx
 00424B44    pop         ecx
 00424B45    mov         dword ptr fs:[eax],edx
 00424B48    push        424B5D
 00424B4D    lea         eax,[ebp-4]
 00424B50    call        @UStrClr
 00424B55    ret
>00424B56    jmp         @HandleFinally
>00424B5B    jmp         00424B4D
 00424B5D    mov         eax,edi
 00424B5F    test        bl,bl
>00424B61    je          00424B72
 00424B63    call        @AfterConstruction
 00424B68    pop         dword ptr fs:[0]
 00424B6F    add         esp,0C
 00424B72    mov         eax,edi
 00424B74    pop         edi
 00424B75    pop         esi
 00424B76    pop         ebx
 00424B77    pop         ecx
 00424B78    pop         ebp
 00424B79    ret         8
*}
end;

//00424B7C
constructor Exception.CreateRes;
begin
{*
 00424B7C    push        ebp
 00424B7D    mov         ebp,esp
 00424B7F    push        0
 00424B81    push        ebx
 00424B82    push        esi
 00424B83    push        edi
 00424B84    test        dl,dl
>00424B86    je          00424B90
 00424B88    add         esp,0FFFFFFF0
 00424B8B    call        @ClassCreate
 00424B90    mov         esi,ecx
 00424B92    mov         ebx,edx
 00424B94    mov         edi,eax
 00424B96    xor         eax,eax
 00424B98    push        ebp
 00424B99    push        424BCF
 00424B9E    push        dword ptr fs:[eax]
 00424BA1    mov         dword ptr fs:[eax],esp
 00424BA4    lea         edx,[ebp-4]
 00424BA7    mov         eax,esi
 00424BA9    call        LoadStr
 00424BAE    mov         edx,dword ptr [ebp-4]
 00424BB1    lea         eax,[edi+4]
 00424BB4    call        @UStrAsg
 00424BB9    xor         eax,eax
 00424BBB    pop         edx
 00424BBC    pop         ecx
 00424BBD    pop         ecx
 00424BBE    mov         dword ptr fs:[eax],edx
 00424BC1    push        424BD6
 00424BC6    lea         eax,[ebp-4]
 00424BC9    call        @UStrClr
 00424BCE    ret
>00424BCF    jmp         @HandleFinally
>00424BD4    jmp         00424BC6
 00424BD6    mov         eax,edi
 00424BD8    test        bl,bl
>00424BDA    je          00424BEB
 00424BDC    call        @AfterConstruction
 00424BE1    pop         dword ptr fs:[0]
 00424BE8    add         esp,0C
 00424BEB    mov         eax,edi
 00424BED    pop         edi
 00424BEE    pop         esi
 00424BEF    pop         ebx
 00424BF0    pop         ecx
 00424BF1    pop         ebp
 00424BF2    ret
*}
end;

//00424BF4
constructor Exception.CreateRes;
begin
{*
 00424BF4    push        ebx
 00424BF5    push        esi
 00424BF6    push        edi
 00424BF7    test        dl,dl
>00424BF9    je          00424C03
 00424BFB    add         esp,0FFFFFFF0
 00424BFE    call        @ClassCreate
 00424C03    mov         esi,ecx
 00424C05    mov         ebx,edx
 00424C07    mov         edi,eax
 00424C09    lea         edx,[edi+4]
 00424C0C    mov         eax,esi
 00424C0E    call        LoadResString
 00424C13    mov         eax,edi
 00424C15    test        bl,bl
>00424C17    je          00424C28
 00424C19    call        @AfterConstruction
 00424C1E    pop         dword ptr fs:[0]
 00424C25    add         esp,0C
 00424C28    mov         eax,edi
 00424C2A    pop         edi
 00424C2B    pop         esi
 00424C2C    pop         ebx
 00424C2D    ret
*}
end;

//00424C30
{*constructor sub_00424C30(?:?; ?:?);
begin
 00424C30    push        ebp
 00424C31    mov         ebp,esp
 00424C33    push        0
 00424C35    push        0
 00424C37    push        ebx
 00424C38    push        esi
 00424C39    push        edi
 00424C3A    test        dl,dl
>00424C3C    je          00424C46
 00424C3E    add         esp,0FFFFFFF0
 00424C41    call        @ClassCreate
 00424C46    mov         esi,ecx
 00424C48    mov         ebx,edx
 00424C4A    mov         edi,eax
 00424C4C    xor         eax,eax
 00424C4E    push        ebp
 00424C4F    push        424C9C
 00424C54    push        dword ptr fs:[eax]
 00424C57    mov         dword ptr fs:[eax],esp
 00424C5A    lea         eax,[ebp-4]
 00424C5D    push        eax
 00424C5E    lea         edx,[ebp-8]
 00424C61    mov         eax,esi
 00424C63    call        LoadStr
 00424C68    mov         eax,dword ptr [ebp-8]
 00424C6B    mov         edx,dword ptr [ebp+0C]
 00424C6E    mov         ecx,dword ptr [ebp+8]
 00424C71    call        Format
 00424C76    mov         edx,dword ptr [ebp-4]
 00424C79    lea         eax,[edi+4]
 00424C7C    call        @UStrAsg
 00424C81    xor         eax,eax
 00424C83    pop         edx
 00424C84    pop         ecx
 00424C85    pop         ecx
 00424C86    mov         dword ptr fs:[eax],edx
 00424C89    push        424CA3
 00424C8E    lea         eax,[ebp-8]
 00424C91    mov         edx,2
 00424C96    call        @UStrArrayClr
 00424C9B    ret
>00424C9C    jmp         @HandleFinally
>00424CA1    jmp         00424C8E
 00424CA3    mov         eax,edi
 00424CA5    test        bl,bl
>00424CA7    je          00424CB8
 00424CA9    call        @AfterConstruction
 00424CAE    pop         dword ptr fs:[0]
 00424CB5    add         esp,0C
 00424CB8    mov         eax,edi
 00424CBA    pop         edi
 00424CBB    pop         esi
 00424CBC    pop         ebx
 00424CBD    pop         ecx
 00424CBE    pop         ecx
 00424CBF    pop         ebp
 00424CC0    ret         8
end;*}

//00424CC4
constructor Exception.CreateResFmt(Ident:Integer; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);
begin
{*
 00424CC4    push        ebp
 00424CC5    mov         ebp,esp
 00424CC7    push        0
 00424CC9    push        0
 00424CCB    push        ebx
 00424CCC    push        esi
 00424CCD    push        edi
 00424CCE    test        dl,dl
>00424CD0    je          00424CDA
 00424CD2    add         esp,0FFFFFFF0
 00424CD5    call        @ClassCreate
 00424CDA    mov         esi,ecx
 00424CDC    mov         ebx,edx
 00424CDE    mov         edi,eax
 00424CE0    xor         eax,eax
 00424CE2    push        ebp
 00424CE3    push        424D30
 00424CE8    push        dword ptr fs:[eax]
 00424CEB    mov         dword ptr fs:[eax],esp
 00424CEE    lea         eax,[ebp-4]
 00424CF1    push        eax
 00424CF2    lea         edx,[ebp-8]
 00424CF5    mov         eax,esi
 00424CF7    call        LoadResString
 00424CFC    mov         eax,dword ptr [ebp-8]
 00424CFF    mov         edx,dword ptr [ebp+0C]
 00424D02    mov         ecx,dword ptr [ebp+8]
 00424D05    call        Format
 00424D0A    mov         edx,dword ptr [ebp-4]
 00424D0D    lea         eax,[edi+4]
 00424D10    call        @UStrAsg
 00424D15    xor         eax,eax
 00424D17    pop         edx
 00424D18    pop         ecx
 00424D19    pop         ecx
 00424D1A    mov         dword ptr fs:[eax],edx
 00424D1D    push        424D37
 00424D22    lea         eax,[ebp-8]
 00424D25    mov         edx,2
 00424D2A    call        @UStrArrayClr
 00424D2F    ret
>00424D30    jmp         @HandleFinally
>00424D35    jmp         00424D22
 00424D37    mov         eax,edi
 00424D39    test        bl,bl
>00424D3B    je          00424D4C
 00424D3D    call        @AfterConstruction
 00424D42    pop         dword ptr fs:[0]
 00424D49    add         esp,0C
 00424D4C    mov         eax,edi
 00424D4E    pop         edi
 00424D4F    pop         esi
 00424D50    pop         ebx
 00424D51    pop         ecx
 00424D52    pop         ecx
 00424D53    pop         ebp
 00424D54    ret         8
*}
end;

//00424D58
constructor Exception.CreateHelp(AHelpContext:Integer);
begin
{*
 00424D58    push        ebp
 00424D59    mov         ebp,esp
 00424D5B    push        ebx
 00424D5C    push        esi
 00424D5D    push        edi
 00424D5E    test        dl,dl
>00424D60    je          00424D6A
 00424D62    add         esp,0FFFFFFF0
 00424D65    call        @ClassCreate
 00424D6A    mov         esi,ecx
 00424D6C    mov         ebx,edx
 00424D6E    mov         edi,eax
 00424D70    lea         eax,[edi+4]
 00424D73    mov         edx,esi
 00424D75    call        @UStrAsg
 00424D7A    mov         eax,dword ptr [ebp+8]
 00424D7D    mov         dword ptr [edi+8],eax
 00424D80    mov         eax,edi
 00424D82    test        bl,bl
>00424D84    je          00424D95
 00424D86    call        @AfterConstruction
 00424D8B    pop         dword ptr fs:[0]
 00424D92    add         esp,0C
 00424D95    mov         eax,edi
 00424D97    pop         edi
 00424D98    pop         esi
 00424D99    pop         ebx
 00424D9A    pop         ebp
 00424D9B    ret         4
*}
end;

//00424DA0
constructor Exception.CreateFmtHelp(const Msg:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; AHelpContext:Integer);
begin
{*
 00424DA0    push        ebp
 00424DA1    mov         ebp,esp
 00424DA3    push        0
 00424DA5    push        ebx
 00424DA6    push        esi
 00424DA7    push        edi
 00424DA8    test        dl,dl
>00424DAA    je          00424DB4
 00424DAC    add         esp,0FFFFFFF0
 00424DAF    call        @ClassCreate
 00424DB4    mov         esi,ecx
 00424DB6    mov         ebx,edx
 00424DB8    mov         edi,eax
 00424DBA    xor         eax,eax
 00424DBC    push        ebp
 00424DBD    push        424E00
 00424DC2    push        dword ptr fs:[eax]
 00424DC5    mov         dword ptr fs:[eax],esp
 00424DC8    lea         eax,[ebp-4]
 00424DCB    push        eax
 00424DCC    mov         edx,dword ptr [ebp+10]
 00424DCF    mov         ecx,dword ptr [ebp+0C]
 00424DD2    mov         eax,esi
 00424DD4    call        Format
 00424DD9    mov         edx,dword ptr [ebp-4]
 00424DDC    lea         eax,[edi+4]
 00424DDF    call        @UStrAsg
 00424DE4    mov         eax,dword ptr [ebp+8]
 00424DE7    mov         dword ptr [edi+8],eax
 00424DEA    xor         eax,eax
 00424DEC    pop         edx
 00424DED    pop         ecx
 00424DEE    pop         ecx
 00424DEF    mov         dword ptr fs:[eax],edx
 00424DF2    push        424E07
 00424DF7    lea         eax,[ebp-4]
 00424DFA    call        @UStrClr
 00424DFF    ret
>00424E00    jmp         @HandleFinally
>00424E05    jmp         00424DF7
 00424E07    mov         eax,edi
 00424E09    test        bl,bl
>00424E0B    je          00424E1C
 00424E0D    call        @AfterConstruction
 00424E12    pop         dword ptr fs:[0]
 00424E19    add         esp,0C
 00424E1C    mov         eax,edi
 00424E1E    pop         edi
 00424E1F    pop         esi
 00424E20    pop         ebx
 00424E21    pop         ecx
 00424E22    pop         ebp
 00424E23    ret         0C
*}
end;

//00424E28
constructor Exception.CreateResHelp(AHelpContext:Integer);
begin
{*
 00424E28    push        ebp
 00424E29    mov         ebp,esp
 00424E2B    push        0
 00424E2D    push        ebx
 00424E2E    push        esi
 00424E2F    push        edi
 00424E30    test        dl,dl
>00424E32    je          00424E3C
 00424E34    add         esp,0FFFFFFF0
 00424E37    call        @ClassCreate
 00424E3C    mov         esi,ecx
 00424E3E    mov         ebx,edx
 00424E40    mov         edi,eax
 00424E42    xor         eax,eax
 00424E44    push        ebp
 00424E45    push        424E81
 00424E4A    push        dword ptr fs:[eax]
 00424E4D    mov         dword ptr fs:[eax],esp
 00424E50    lea         edx,[ebp-4]
 00424E53    mov         eax,esi
 00424E55    call        LoadStr
 00424E5A    mov         edx,dword ptr [ebp-4]
 00424E5D    lea         eax,[edi+4]
 00424E60    call        @UStrAsg
 00424E65    mov         eax,dword ptr [ebp+8]
 00424E68    mov         dword ptr [edi+8],eax
 00424E6B    xor         eax,eax
 00424E6D    pop         edx
 00424E6E    pop         ecx
 00424E6F    pop         ecx
 00424E70    mov         dword ptr fs:[eax],edx
 00424E73    push        424E88
 00424E78    lea         eax,[ebp-4]
 00424E7B    call        @UStrClr
 00424E80    ret
>00424E81    jmp         @HandleFinally
>00424E86    jmp         00424E78
 00424E88    mov         eax,edi
 00424E8A    test        bl,bl
>00424E8C    je          00424E9D
 00424E8E    call        @AfterConstruction
 00424E93    pop         dword ptr fs:[0]
 00424E9A    add         esp,0C
 00424E9D    mov         eax,edi
 00424E9F    pop         edi
 00424EA0    pop         esi
 00424EA1    pop         ebx
 00424EA2    pop         ecx
 00424EA3    pop         ebp
 00424EA4    ret         4
*}
end;

//00424EA8
constructor Exception.CreateResHelp(AHelpContext:Integer);
begin
{*
 00424EA8    push        ebp
 00424EA9    mov         ebp,esp
 00424EAB    push        ebx
 00424EAC    push        esi
 00424EAD    push        edi
 00424EAE    test        dl,dl
>00424EB0    je          00424EBA
 00424EB2    add         esp,0FFFFFFF0
 00424EB5    call        @ClassCreate
 00424EBA    mov         esi,ecx
 00424EBC    mov         ebx,edx
 00424EBE    mov         edi,eax
 00424EC0    lea         edx,[edi+4]
 00424EC3    mov         eax,esi
 00424EC5    call        LoadResString
 00424ECA    mov         eax,dword ptr [ebp+8]
 00424ECD    mov         dword ptr [edi+8],eax
 00424ED0    mov         eax,edi
 00424ED2    test        bl,bl
>00424ED4    je          00424EE5
 00424ED6    call        @AfterConstruction
 00424EDB    pop         dword ptr fs:[0]
 00424EE2    add         esp,0C
 00424EE5    mov         eax,edi
 00424EE7    pop         edi
 00424EE8    pop         esi
 00424EE9    pop         ebx
 00424EEA    pop         ebp
 00424EEB    ret         4
*}
end;

//00424EF0
constructor Exception.CreateResFmtHelp(Ident:Integer; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; AHelpContext:Integer);
begin
{*
 00424EF0    push        ebp
 00424EF1    mov         ebp,esp
 00424EF3    push        0
 00424EF5    push        0
 00424EF7    push        ebx
 00424EF8    push        esi
 00424EF9    push        edi
 00424EFA    test        dl,dl
>00424EFC    je          00424F06
 00424EFE    add         esp,0FFFFFFF0
 00424F01    call        @ClassCreate
 00424F06    mov         esi,ecx
 00424F08    mov         ebx,edx
 00424F0A    mov         edi,eax
 00424F0C    xor         eax,eax
 00424F0E    push        ebp
 00424F0F    push        424F62
 00424F14    push        dword ptr fs:[eax]
 00424F17    mov         dword ptr fs:[eax],esp
 00424F1A    lea         eax,[ebp-4]
 00424F1D    push        eax
 00424F1E    lea         edx,[ebp-8]
 00424F21    mov         eax,esi
 00424F23    call        LoadStr
 00424F28    mov         eax,dword ptr [ebp-8]
 00424F2B    mov         edx,dword ptr [ebp+10]
 00424F2E    mov         ecx,dword ptr [ebp+0C]
 00424F31    call        Format
 00424F36    mov         edx,dword ptr [ebp-4]
 00424F39    lea         eax,[edi+4]
 00424F3C    call        @UStrAsg
 00424F41    mov         eax,dword ptr [ebp+8]
 00424F44    mov         dword ptr [edi+8],eax
 00424F47    xor         eax,eax
 00424F49    pop         edx
 00424F4A    pop         ecx
 00424F4B    pop         ecx
 00424F4C    mov         dword ptr fs:[eax],edx
 00424F4F    push        424F69
 00424F54    lea         eax,[ebp-8]
 00424F57    mov         edx,2
 00424F5C    call        @UStrArrayClr
 00424F61    ret
>00424F62    jmp         @HandleFinally
>00424F67    jmp         00424F54
 00424F69    mov         eax,edi
 00424F6B    test        bl,bl
>00424F6D    je          00424F7E
 00424F6F    call        @AfterConstruction
 00424F74    pop         dword ptr fs:[0]
 00424F7B    add         esp,0C
 00424F7E    mov         eax,edi
 00424F80    pop         edi
 00424F81    pop         esi
 00424F82    pop         ebx
 00424F83    pop         ecx
 00424F84    pop         ecx
 00424F85    pop         ebp
 00424F86    ret         0C
*}
end;

//00424F8C
constructor Exception.CreateResFmtHelp(ResStringRec:PResStringRec; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1; AHelpContext:Integer);
begin
{*
 00424F8C    push        ebp
 00424F8D    mov         ebp,esp
 00424F8F    push        0
 00424F91    push        0
 00424F93    push        ebx
 00424F94    push        esi
 00424F95    push        edi
 00424F96    test        dl,dl
>00424F98    je          00424FA2
 00424F9A    add         esp,0FFFFFFF0
 00424F9D    call        @ClassCreate
 00424FA2    mov         esi,ecx
 00424FA4    mov         ebx,edx
 00424FA6    mov         edi,eax
 00424FA8    xor         eax,eax
 00424FAA    push        ebp
 00424FAB    push        424FFE
 00424FB0    push        dword ptr fs:[eax]
 00424FB3    mov         dword ptr fs:[eax],esp
 00424FB6    lea         eax,[ebp-4]
 00424FB9    push        eax
 00424FBA    lea         edx,[ebp-8]
 00424FBD    mov         eax,esi
 00424FBF    call        LoadResString
 00424FC4    mov         eax,dword ptr [ebp-8]
 00424FC7    mov         edx,dword ptr [ebp+10]
 00424FCA    mov         ecx,dword ptr [ebp+0C]
 00424FCD    call        Format
 00424FD2    mov         edx,dword ptr [ebp-4]
 00424FD5    lea         eax,[edi+4]
 00424FD8    call        @UStrAsg
 00424FDD    mov         eax,dword ptr [ebp+8]
 00424FE0    mov         dword ptr [edi+8],eax
 00424FE3    xor         eax,eax
 00424FE5    pop         edx
 00424FE6    pop         ecx
 00424FE7    pop         ecx
 00424FE8    mov         dword ptr fs:[eax],edx
 00424FEB    push        425005
 00424FF0    lea         eax,[ebp-8]
 00424FF3    mov         edx,2
 00424FF8    call        @UStrArrayClr
 00424FFD    ret
>00424FFE    jmp         @HandleFinally
>00425003    jmp         00424FF0
 00425005    mov         eax,edi
 00425007    test        bl,bl
>00425009    je          0042501A
 0042500B    call        @AfterConstruction
 00425010    pop         dword ptr fs:[0]
 00425017    add         esp,0C
 0042501A    mov         eax,edi
 0042501C    pop         edi
 0042501D    pop         esi
 0042501E    pop         ebx
 0042501F    pop         ecx
 00425020    pop         ecx
 00425021    pop         ebp
 00425022    ret         0C
*}
end;

//00425028
destructor Exception.Destroy();
begin
{*
 00425028    push        ebx
 00425029    push        esi
 0042502A    call        @BeforeDestruction
 0042502F    mov         ebx,edx
 00425031    mov         esi,eax
 00425033    lea         eax,[esi+0C]
 00425036    call        FreeAndNil
 0042503B    cmp         dword ptr ds:[790CD8],0
>00425042    je          0042504D
 00425044    mov         eax,dword ptr [esi+10]
 00425047    call        dword ptr ds:[790CD8]
 0042504D    xor         eax,eax
 0042504F    mov         dword ptr [esi+10],eax
 00425052    mov         edx,ebx
 00425054    and         dl,0FC
 00425057    mov         eax,esi
 00425059    call        TObject.Destroy
 0042505E    test        bl,bl
>00425060    jle         00425069
 00425062    mov         eax,esi
 00425064    call        @ClassDestroy
 00425069    pop         esi
 0042506A    pop         ebx
 0042506B    ret
*}
end;

//0042506C
function Exception.GetBaseException:Exception;
begin
{*
>0042506C    jmp         00425070
 0042506E    mov         eax,edx
 00425070    mov         edx,dword ptr [eax+0C]
 00425073    test        edx,edx
>00425075    jne         0042506E
 00425077    ret
*}
end;

//00425078
function Exception.GetStackTrace:UnicodeString;
begin
{*
 00425078    push        ebx
 00425079    push        esi
 0042507A    mov         esi,edx
 0042507C    mov         ebx,eax
 0042507E    cmp         dword ptr ds:[790CD4],0
>00425085    je          00425095
 00425087    mov         edx,esi
 00425089    mov         eax,dword ptr [ebx+10]
 0042508C    call        dword ptr ds:[790CD4]
 00425092    pop         esi
 00425093    pop         ebx
 00425094    ret
 00425095    mov         eax,esi
 00425097    call        @UStrClr
 0042509C    pop         esi
 0042509D    pop         ebx
 0042509E    ret
*}
end;

//004250A0
procedure Exception.RaiseOuterException;
begin
{*
 004250A0    test        eax,eax
>004250A2    je          00406D40
 004250A8    mov         byte ptr [eax+14],1
>004250AC    jmp         @RaiseExcept
 004250B1    ret
*}
end;

//004250B4
procedure Exception.ThrowOuterException;
begin
{*
 004250B4    test        eax,eax
>004250B6    je          00406D40
 004250BC    mov         byte ptr [eax+14],1
>004250C0    jmp         @RaiseExcept
 004250C5    ret
*}
end;

//004250C8
procedure Exception.RaisingException(P:PExceptionRecord);
begin
{*
 004250C8    push        ebx
 004250C9    push        esi
 004250CA    mov         esi,edx
 004250CC    mov         ebx,eax
 004250CE    mov         eax,ebx
 004250D0    call        Exception.SetInnerException
 004250D5    cmp         dword ptr ds:[790CD0],0
>004250DC    je          004250EF
 004250DE    mov         eax,esi
 004250E0    call        dword ptr ds:[790CD0]
 004250E6    mov         edx,eax
 004250E8    mov         eax,ebx
 004250EA    call        Exception.SetStackInfo
 004250EF    pop         esi
 004250F0    pop         ebx
 004250F1    ret
*}
end;

//004250F4
procedure Exception.SetInnerException;
begin
{*
 004250F4    push        ebx
 004250F5    mov         ebx,eax
 004250F7    cmp         byte ptr [ebx+14],0
>004250FB    je          00425119
 004250FD    call        ExceptObject
 00425102    mov         edx,dword ptr ds:[418C04];Exception
 00425108    call        @IsClass
 0042510D    test        al,al
>0042510F    je          00425119
 00425111    call        AcquireExceptionObject
 00425116    mov         dword ptr [ebx+0C],eax
 00425119    pop         ebx
 0042511A    ret
*}
end;

//0042511C
procedure Exception.SetStackInfo(AStackInfo:Pointer);
begin
{*
 0042511C    mov         dword ptr [eax+10],edx
 0042511F    ret
*}
end;

//00425120
function Exception.ToString:string;
begin
{*
 00425120    push        ebx
 00425121    push        esi
 00425122    mov         esi,edx
 00425124    mov         ebx,eax
 00425126    mov         eax,esi
 00425128    call        @UStrClr
 0042512D    test        ebx,ebx
>0042512F    je          0042515F
 00425131    cmp         dword ptr [esi],0
>00425134    je          0042514E
 00425136    push        dword ptr [esi]
 00425138    push        425170;'
'
 0042513D    push        dword ptr [ebx+4]
 00425140    mov         eax,esi
 00425142    mov         edx,3
 00425147    call        @UStrCatN
>0042514C    jmp         00425158
 0042514E    mov         eax,esi
 00425150    mov         edx,dword ptr [ebx+4]
 00425153    call        @UStrAsg
 00425158    mov         ebx,dword ptr [ebx+0C]
 0042515B    test        ebx,ebx
>0042515D    jne         00425131
 0042515F    pop         esi
 00425160    pop         ebx
 00425161    ret
*}
end;

//00425178
procedure EHeapException.FreeInstance;
begin
{*
 00425178    cmp         byte ptr [eax+18],0
>0042517C    je          00425183
 0042517E    call        TObject.FreeInstance
 00425183    ret
*}
end;

//00425184
procedure EHeapException.RaisingException(P:PExceptionRecord);
begin
{*
 00425184    call        Exception.SetInnerException
 00425189    ret
*}
end;

//0042518C
function CreateInOutError:EInOutError;
begin
{*
 0042518C    push        ebx
 0042518D    push        esi
 0042518E    add         esp,0FFFFFFF8
 00425191    xor         ebx,ebx
 00425193    call        IOResult
 00425198    mov         esi,eax
>0042519A    jmp         0042519D
 0042519C    inc         ebx
 0042519D    cmp         ebx,6
>004251A0    jg          004251AB
 004251A2    cmp         esi,dword ptr [ebx*8+784DFC];gvar_00784DFC:array[7] of ?
>004251A9    jne         0042519C
 004251AB    cmp         ebx,6
>004251AE    jg          004251C5
 004251B0    mov         ecx,dword ptr [ebx*8+784E00]
 004251B7    mov         dl,1
 004251B9    mov         eax,[00419814];EInOutError
 004251BE    call        Exception.Create
>004251C3    jmp         004251E2
 004251C5    mov         dword ptr [esp],esi
 004251C8    mov         byte ptr [esp+4],0
 004251CD    push        esp
 004251CE    push        0
 004251D0    mov         ecx,dword ptr ds:[78CEF8];^SResString5:TResStringRec
 004251D6    mov         dl,1
 004251D8    mov         eax,[00419814];EInOutError
 004251DD    call        Exception.CreateResFmt
 004251E2    mov         dword ptr [eax+18],esi
 004251E5    pop         ecx
 004251E6    pop         edx
 004251E7    pop         esi
 004251E8    pop         ebx
 004251E9    ret
*}
end;

//004251EC
procedure ErrorHandler(ErrorCode:Byte; ErrorAddr:Pointer);
begin
{*
 004251EC    push        ebx
 004251ED    mov         ebx,edx
 004251EF    mov         edx,eax
 004251F1    dec         dl
>004251F3    je          00425201
 004251F5    dec         dl
>004251F7    je          00425209
 004251F9    dec         edx
 004251FA    sub         dl,19
>004251FD    jb          00425211
>004251FF    jmp         00425239
 00425201    mov         edx,dword ptr ds:[790E14]
>00425207    jmp         00425240
 00425209    mov         edx,dword ptr ds:[790E18]
>0042520F    jmp         00425240
 00425211    movzx       eax,al
 00425214    mov         edx,dword ptr ds:[78D92C];^gvar_00784BA8:array[25] of ?
 0042521A    lea         eax,[edx+eax*8-18]
 0042521E    movzx       edx,byte ptr [eax]
 00425221    mov         ecx,dword ptr ds:[78CF60]
 00425227    mov         edx,dword ptr [ecx+edx*4]
 0042522A    mov         ecx,dword ptr [eax+4]
 0042522D    mov         al,1
 0042522F    xchg        eax,edx
 00425230    call        Exception.Create
 00425235    mov         edx,eax
>00425237    jmp         00425240
 00425239    call        CreateInOutError
 0042523E    mov         edx,eax
 00425240    push        ebx
 00425241    mov         eax,edx
>00425243    jmp         @RaiseExcept
 00425248    pop         ebx
 00425249    ret
*}
end;

//0042524C
procedure AssertErrorHandler(const Message:UnicodeString; const Filename:UnicodeString; LineNumber:Integer; ErrorAddr:Pointer);
begin
{*
 0042524C    push        ebp
 0042524D    mov         ebp,esp
 0042524F    add         esp,0FFFFFFDC
 00425252    push        ebx
 00425253    push        esi
 00425254    push        edi
 00425255    xor         ebx,ebx
 00425257    mov         dword ptr [ebp-20],ebx
 0042525A    mov         dword ptr [ebp-24],ebx
 0042525D    mov         dword ptr [ebp-1C],ebx
 00425260    mov         edi,ecx
 00425262    mov         esi,edx
 00425264    mov         ebx,eax
 00425266    xor         eax,eax
 00425268    push        ebp
 00425269    push        425323
 0042526E    push        dword ptr fs:[eax]
 00425271    mov         dword ptr fs:[eax],esp
 00425274    test        ebx,ebx
>00425276    je          004252B9
 00425278    push        dword ptr [ebp+8]
 0042527B    mov         dword ptr [ebp-18],ebx
 0042527E    mov         byte ptr [ebp-14],11
 00425282    mov         dword ptr [ebp-10],esi
 00425285    mov         byte ptr [ebp-0C],11
 00425289    mov         dword ptr [ebp-8],edi
 0042528C    mov         byte ptr [ebp-4],0
 00425290    lea         eax,[ebp-18]
 00425293    push        eax
 00425294    push        2
 00425296    lea         edx,[ebp-1C]
 00425299    mov         eax,[0078D88C];^SResString58:TResStringRec
 0042529E    call        LoadResString
 004252A3    mov         ecx,dword ptr [ebp-1C]
 004252A6    mov         dl,1
 004252A8    mov         eax,[0041A464];EAssertionFailed
 004252AD    call        Exception.CreateFmt
>004252B2    jmp         @RaiseExcept
>004252B7    jmp         00425308
 004252B9    push        dword ptr [ebp+8]
 004252BC    lea         edx,[ebp-20]
 004252BF    mov         eax,[0078D688];^SResString52:TResStringRec
 004252C4    call        LoadResString
 004252C9    mov         eax,dword ptr [ebp-20]
 004252CC    mov         dword ptr [ebp-18],eax
 004252CF    mov         byte ptr [ebp-14],11
 004252D3    mov         dword ptr [ebp-10],esi
 004252D6    mov         byte ptr [ebp-0C],11
 004252DA    mov         dword ptr [ebp-8],edi
 004252DD    mov         byte ptr [ebp-4],0
 004252E1    lea         eax,[ebp-18]
 004252E4    push        eax
 004252E5    push        2
 004252E7    lea         edx,[ebp-24]
 004252EA    mov         eax,[0078D88C];^SResString58:TResStringRec
 004252EF    call        LoadResString
 004252F4    mov         ecx,dword ptr [ebp-24]
 004252F7    mov         dl,1
 004252F9    mov         eax,[0041A464];EAssertionFailed
 004252FE    call        Exception.CreateFmt
>00425303    jmp         @RaiseExcept
 00425308    xor         eax,eax
 0042530A    pop         edx
 0042530B    pop         ecx
 0042530C    pop         ecx
 0042530D    mov         dword ptr fs:[eax],edx
 00425310    push        42532A
 00425315    lea         eax,[ebp-24]
 00425318    mov         edx,3
 0042531D    call        @UStrArrayClr
 00425322    ret
>00425323    jmp         @HandleFinally
>00425328    jmp         00425315
 0042532A    pop         edi
 0042532B    pop         esi
 0042532C    pop         ebx
 0042532D    mov         esp,ebp
 0042532F    pop         ebp
 00425330    ret         4
*}
end;

//00425334
procedure AbstractErrorHandler;
begin
{*
 00425334    mov         ecx,dword ptr ds:[78CF5C];^SResString59:TResStringRec
 0042533A    mov         dl,1
 0042533C    mov         eax,[0041A508];EAbstractError
 00425341    call        Exception.CreateRes
 00425346    call        @RaiseExcept
 0042534B    ret
*}
end;

//0042534C
function MapException(P:PExceptionRecord):TRuntimeError;
begin
{*
 0042534C    mov         eax,dword ptr [eax]
 0042534E    cmp         eax,0C0000092
>00425353    jg          00425381
>00425355    je          004253B0
 00425357    cmp         eax,0C000008E
>0042535C    jg          00425373
>0042535E    je          004253B3
 00425360    sub         eax,0C0000005
>00425365    je          004253BC
 00425367    sub         eax,87
>0042536C    je          004253AA
 0042536E    dec         eax
>0042536F    je          004253B9
>00425371    jmp         004253C8
 00425373    add         eax,3FFFFF71
 00425378    sub         eax,2
>0042537B    jb          004253B0
>0042537D    je          004253B6
>0042537F    jmp         004253C8
 00425381    cmp         eax,0C0000096
>00425386    jg          00425399
>00425388    je          004253BF
 0042538A    sub         eax,0C0000093
>0042538F    je          004253B9
 00425391    dec         eax
>00425392    je          004253A7
 00425394    dec         eax
>00425395    je          004253AD
>00425397    jmp         004253C8
 00425399    sub         eax,0C00000FD
>0042539E    je          004253C5
 004253A0    sub         eax,3D
>004253A3    je          004253C2
>004253A5    jmp         004253C8
 004253A7    mov         al,3
 004253A9    ret
 004253AA    mov         al,4
 004253AC    ret
 004253AD    mov         al,5
 004253AF    ret
 004253B0    mov         al,6
 004253B2    ret
 004253B3    mov         al,7
 004253B5    ret
 004253B6    mov         al,8
 004253B8    ret
 004253B9    mov         al,9
 004253BB    ret
 004253BC    mov         al,0B
 004253BE    ret
 004253BF    mov         al,0C
 004253C1    ret
 004253C2    mov         al,0D
 004253C4    ret
 004253C5    mov         al,0E
 004253C7    ret
 004253C8    mov         al,16
 004253CA    ret
*}
end;

//004253CC
function GetExceptionClass(P:PExceptionRecord):ExceptClass;
begin
{*
 004253CC    push        ebx
 004253CD    mov         ebx,eax
 004253CF    mov         eax,ebx
 004253D1    call        MapException
 004253D6    movzx       eax,al
 004253D9    mov         edx,dword ptr ds:[78D92C];^gvar_00784BA8:array[25] of ?
 004253DF    movzx       eax,byte ptr [edx+eax*8-18]
 004253E4    mov         edx,dword ptr ds:[78CF60]
 004253EA    mov         eax,dword ptr [edx+eax*4]
 004253ED    pop         ebx
 004253EE    ret
*}
end;

//004253F0
function CreateAVObject:Exception;
begin
{*
 004253F0    push        ebp
 004253F1    mov         ebp,esp
 004253F3    add         esp,0FFFFFD8C
 004253F9    push        ebx
 004253FA    push        esi
 004253FB    xor         eax,eax
 004253FD    mov         dword ptr [ebp-274],eax
 00425403    mov         dword ptr [ebp-250],eax
 00425409    mov         dword ptr [ebp-258],eax
 0042540F    mov         dword ptr [ebp-254],eax
 00425415    mov         dword ptr [ebp-4],eax
 00425418    xor         eax,eax
 0042541A    push        ebp
 0042541B    push        4255AB
 00425420    push        dword ptr fs:[eax]
 00425423    mov         dword ptr fs:[eax],esp
 00425426    mov         eax,dword ptr [ebp+8]
 00425429    mov         ebx,dword ptr [eax-4]
 0042542C    cmp         dword ptr [ebx+14],0
>00425430    jne         00425441
 00425432    lea         edx,[ebp-4]
 00425435    mov         eax,[0078DB84];^SResString31:TResStringRec
 0042543A    call        LoadResString
>0042543F    jmp         0042544E
 00425441    lea         edx,[ebp-4]
 00425444    mov         eax,[0078D5B0];^SResString32:TResStringRec
 00425449    call        LoadResString
 0042544E    mov         esi,dword ptr [ebx+18]
 00425451    push        1C
 00425453    lea         eax,[ebp-20]
 00425456    push        eax
 00425457    mov         eax,dword ptr [ebx+0C]
 0042545A    push        eax
 0042545B    call        kernel32.VirtualQuery
 00425460    cmp         dword ptr [ebp-10],1000
>00425467    jne         00425520
 0042546D    push        105
 00425472    lea         eax,[ebp-22A]
 00425478    push        eax
 00425479    mov         eax,dword ptr [ebp-1C]
 0042547C    push        eax
 0042547D    call        kernel32.GetModuleFileNameW
 00425482    test        eax,eax
>00425484    je          00425520
 0042548A    mov         eax,dword ptr [ebx+0C]
 0042548D    mov         dword ptr [ebp-24C],eax
 00425493    mov         byte ptr [ebp-248],5
 0042549A    lea         eax,[ebp-254]
 004254A0    lea         edx,[ebp-22A]
 004254A6    mov         ecx,105
 004254AB    call        @UStrFromWArray
 004254B0    mov         eax,dword ptr [ebp-254]
 004254B6    lea         edx,[ebp-250]
 004254BC    call        ExtractFileName
 004254C1    mov         eax,dword ptr [ebp-250]
 004254C7    mov         dword ptr [ebp-244],eax
 004254CD    mov         byte ptr [ebp-240],11
 004254D4    mov         eax,dword ptr [ebp-4]
 004254D7    mov         dword ptr [ebp-23C],eax
 004254DD    mov         byte ptr [ebp-238],11
 004254E4    mov         dword ptr [ebp-234],esi
 004254EA    mov         byte ptr [ebp-230],5
 004254F1    lea         eax,[ebp-24C]
 004254F7    push        eax
 004254F8    push        3
 004254FA    lea         edx,[ebp-258]
 00425500    mov         eax,[0078D7A4];^SResString60:TResStringRec
 00425505    call        LoadResString
 0042550A    mov         ecx,dword ptr [ebp-258]
 00425510    mov         dl,1
 00425512    mov         eax,[0041A158];EAccessViolation
 00425517    call        Exception.CreateFmt
 0042551C    mov         ebx,eax
>0042551E    jmp         0042557A
 00425520    mov         eax,dword ptr [ebx+0C]
 00425523    mov         dword ptr [ebp-270],eax
 00425529    mov         byte ptr [ebp-26C],5
 00425530    mov         eax,dword ptr [ebp-4]
 00425533    mov         dword ptr [ebp-268],eax
 00425539    mov         byte ptr [ebp-264],11
 00425540    mov         dword ptr [ebp-260],esi
 00425546    mov         byte ptr [ebp-25C],5
 0042554D    lea         eax,[ebp-270]
 00425553    push        eax
 00425554    push        2
 00425556    lea         edx,[ebp-274]
 0042555C    mov         eax,[0078D5F0];^SResString20:TResStringRec
 00425561    call        LoadResString
 00425566    mov         ecx,dword ptr [ebp-274]
 0042556C    mov         dl,1
 0042556E    mov         eax,[0041A158];EAccessViolation
 00425573    call        Exception.CreateFmt
 00425578    mov         ebx,eax
 0042557A    xor         eax,eax
 0042557C    pop         edx
 0042557D    pop         ecx
 0042557E    pop         ecx
 0042557F    mov         dword ptr fs:[eax],edx
 00425582    push        4255B2
 00425587    lea         eax,[ebp-274]
 0042558D    call        @UStrClr
 00425592    lea         eax,[ebp-258]
 00425598    mov         edx,3
 0042559D    call        @UStrArrayClr
 004255A2    lea         eax,[ebp-4]
 004255A5    call        @UStrClr
 004255AA    ret
>004255AB    jmp         @HandleFinally
>004255B0    jmp         00425587
 004255B2    mov         eax,ebx
 004255B4    pop         esi
 004255B5    pop         ebx
 004255B6    mov         esp,ebp
 004255B8    pop         ebp
 004255B9    ret
*}
end;

//004255BC
function GetExceptionObject(P:PExceptionRecord):Exception;
begin
{*
 004255BC    push        ebp
 004255BD    mov         ebp,esp
 004255BF    add         esp,0FFFFFFF0
 004255C2    push        ebx
 004255C3    xor         edx,edx
 004255C5    mov         dword ptr [ebp-10],edx
 004255C8    mov         dword ptr [ebp-4],eax
 004255CB    xor         eax,eax
 004255CD    push        ebp
 004255CE    push        42568C
 004255D3    push        dword ptr fs:[eax]
 004255D6    mov         dword ptr fs:[eax],esp
 004255D9    mov         eax,dword ptr [ebp-4]
 004255DC    call        MapException
 004255E1    movzx       eax,al
 004255E4    mov         edx,eax
 004255E6    add         edx,0FFFFFFFD
 004255E9    sub         edx,8
>004255EC    jb          004255F6
>004255EE    je          0042561B
 004255F0    dec         edx
 004255F1    sub         edx,0A
>004255F4    jae         00425626
 004255F6    mov         edx,dword ptr ds:[78D92C];^gvar_00784BA8:array[25] of ?
 004255FC    lea         eax,[edx+eax*8-18]
 00425600    movzx       edx,byte ptr [eax]
 00425603    mov         ecx,dword ptr ds:[78CF60]
 00425609    mov         edx,dword ptr [ecx+edx*4]
 0042560C    mov         ecx,dword ptr [eax+4]
 0042560F    mov         al,1
 00425611    xchg        eax,edx
 00425612    call        Exception.Create
 00425617    mov         ebx,eax
>00425619    jmp         00425656
 0042561B    push        ebp
 0042561C    call        CreateAVObject
 00425621    pop         ecx
 00425622    mov         ebx,eax
>00425624    jmp         00425656
 00425626    mov         eax,dword ptr [ebp-4]
 00425629    mov         eax,dword ptr [eax]
 0042562B    mov         dword ptr [ebp-0C],eax
 0042562E    mov         byte ptr [ebp-8],0
 00425632    lea         eax,[ebp-0C]
 00425635    push        eax
 00425636    push        0
 00425638    lea         edx,[ebp-10]
 0042563B    mov         eax,[0078CC30];^SResString51:TResStringRec
 00425640    call        LoadResString
 00425645    mov         ecx,dword ptr [ebp-10]
 00425648    mov         dl,1
 0042564A    mov         eax,[00419984];EExternalException
 0042564F    call        Exception.CreateFmt
 00425654    mov         ebx,eax
 00425656    mov         eax,ebx
 00425658    mov         edx,dword ptr ds:[4198CC];EExternal
 0042565E    call        @IsClass
 00425663    test        al,al
>00425665    je          0042566D
 00425667    mov         eax,dword ptr [ebp-4]
 0042566A    mov         dword ptr [ebx+18],eax
 0042566D    mov         edx,dword ptr [ebp-4]
 00425670    mov         eax,ebx
 00425672    mov         ecx,dword ptr [eax]
 00425674    call        dword ptr [ecx]
 00425676    xor         eax,eax
 00425678    pop         edx
 00425679    pop         ecx
 0042567A    pop         ecx
 0042567B    mov         dword ptr fs:[eax],edx
 0042567E    push        425693
 00425683    lea         eax,[ebp-10]
 00425686    call        @UStrClr
 0042568B    ret
>0042568C    jmp         @HandleFinally
>00425691    jmp         00425683
 00425693    mov         eax,ebx
 00425695    pop         ebx
 00425696    mov         esp,ebp
 00425698    pop         ebp
 00425699    ret
*}
end;

//0042569C
procedure RaiseExceptObject(P:PExceptionRecord);
begin
{*
 0042569C    push        ebx
 0042569D    push        esi
 0042569E    mov         ebx,eax
 004256A0    mov         esi,dword ptr [ebx+18]
 004256A3    mov         eax,esi
 004256A5    mov         edx,dword ptr ds:[418C04];Exception
 004256AB    call        @IsClass
 004256B0    test        al,al
>004256B2    je          004256BC
 004256B4    mov         edx,ebx
 004256B6    mov         eax,esi
 004256B8    mov         ecx,dword ptr [eax]
 004256BA    call        dword ptr [ecx]
 004256BC    pop         esi
 004256BD    pop         ebx
 004256BE    ret
*}
end;

//004256C0
procedure ExceptHandler(ExceptObject:TObject; ExceptAddr:Pointer);
begin
{*
 004256C0    call        ShowException
 004256C5    mov         eax,1
 004256CA    call        @Halt
 004256CF    ret
*}
end;

//004256D0
procedure InitExceptions;
begin
{*
 004256D0    mov         ecx,dword ptr ds:[78CF14];^SResString4:TResStringRec
 004256D6    mov         dl,1
 004256D8    mov         eax,[00419778];EOutOfMemory
 004256DD    call        Exception.CreateRes
 004256E2    mov         [00790E14],eax
 004256E7    mov         ecx,dword ptr ds:[78D4EC];^SResString18:TResStringRec
 004256ED    mov         dl,1
 004256EF    mov         eax,[00419F80];EInvalidPointer
 004256F4    call        Exception.CreateRes
 004256F9    mov         [00790E18],eax
 004256FE    mov         eax,[0078CC64];ErrorProc:procedure(val ErrorCode:Byte;val ErrorAddr:Pointer)
 00425703    mov         dword ptr [eax],4251EC;ErrorHandler
 00425709    mov         eax,[0078D0AC];ExceptProc:Pointer
 0042570E    mov         dword ptr [eax],4256C0;ExceptHandler
 00425714    mov         eax,[0078CE8C];ExceptionClass:TClass
 00425719    mov         edx,dword ptr ds:[418C04];Exception
 0042571F    mov         dword ptr [eax],edx
 00425721    mov         eax,[0078D068];ExceptClsProc:Pointer
 00425726    mov         dword ptr [eax],4253CC;GetExceptionClass:ExceptClass
 0042572C    mov         eax,[0078D0B8];ExceptObjProc:Pointer
 00425731    mov         dword ptr [eax],4255BC;GetExceptionObject:Exception
 00425737    mov         eax,[0078D114];RaiseExceptObjProc:Pointer
 0042573C    mov         dword ptr [eax],42569C;RaiseExceptObject
 00425742    mov         eax,42524C;AssertErrorHandler
 00425747    mov         edx,dword ptr ds:[78D578];AssertErrorProc:TAssertErrorProc
 0042574D    mov         dword ptr [edx],eax
 0042574F    mov         eax,425334;AbstractErrorHandler
 00425754    mov         edx,dword ptr ds:[78CC14];AbstractErrorProc:procedure
 0042575A    mov         dword ptr [edx],eax
 0042575C    ret
*}
end;

//00425760
procedure DoneExceptions;
begin
{*
 00425760    cmp         dword ptr ds:[790E14],0
>00425767    je          00425783
 00425769    mov         eax,[00790E14]
 0042576E    mov         byte ptr [eax+18],1
 00425772    mov         eax,[00790E14]
 00425777    mov         edx,dword ptr [eax]
 00425779    call        dword ptr [edx-8]
 0042577C    xor         eax,eax
 0042577E    mov         [00790E14],eax
 00425783    cmp         dword ptr ds:[790E18],0
>0042578A    je          004257A6
 0042578C    mov         eax,[00790E18]
 00425791    mov         byte ptr [eax+18],1
 00425795    mov         eax,[00790E18]
 0042579A    call        TObject.Free
 0042579F    xor         eax,eax
 004257A1    mov         [00790E18],eax
 004257A6    mov         eax,[0078CC64];ErrorProc:procedure(val ErrorCode:Byte;val ErrorAddr:Pointer)
 004257AB    xor         edx,edx
 004257AD    mov         dword ptr [eax],edx
 004257AF    mov         eax,[0078D0AC];ExceptProc:Pointer
 004257B4    xor         edx,edx
 004257B6    mov         dword ptr [eax],edx
 004257B8    mov         eax,[0078CE8C];ExceptionClass:TClass
 004257BD    xor         edx,edx
 004257BF    mov         dword ptr [eax],edx
 004257C1    mov         eax,[0078D068];ExceptClsProc:Pointer
 004257C6    xor         edx,edx
 004257C8    mov         dword ptr [eax],edx
 004257CA    mov         eax,[0078D0B8];ExceptObjProc:Pointer
 004257CF    xor         edx,edx
 004257D1    mov         dword ptr [eax],edx
 004257D3    mov         eax,[0078D578];AssertErrorProc:TAssertErrorProc
 004257D8    xor         edx,edx
 004257DA    mov         dword ptr [eax],edx
 004257DC    ret
*}
end;

Initialization
//007800F4
{*
 007800F4    sub         dword ptr ds:[790CCC],1
>007800FB    jae         00780102
 007800FD    call        InitExceptions
 00780102    ret
*}
Finalization
end.