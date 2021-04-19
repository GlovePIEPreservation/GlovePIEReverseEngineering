//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieExpression;

interface

uses
  SysUtils, Classes, IniFiles, PieExpression, Contnrs, UxTheme, CommCtrl;

type
  THashTable = class(TObject)
  published
    function GetOrAdd(identifier:string):Integer;//006844F0
    //procedure Get(Value:Integer; ?:?);//006844B8
    procedure Clear;//006843C0
    function Count:Integer;//006843CC
    function Get(identifier:string):Integer;//00684450
    destructor Destroy();//0068441C
    constructor Create;//006843D8
    procedure Add(identifier:string);//00684364
    procedure Add(identifier:string; Value:Integer);//00684310
  public
    ....................................L:THashedStringList;//f4
  end;
  TDataType = (DT_SCALAR, DT_ANGLE, DT_INTEGER, DT_BOOLEAN, DT_STRING, DT_VECTOR, DT_ROTMAT, DT_COLOUR, DT_IMAGE);
  TUnits = (U_NONE, U_NM, U_MICROMETRES, U_MM, U_CM, U_M, U_KM, U_INCHES, U_FEET, U_YARDS, U_MILES, U_P5UNITS, U_PIXELS, U_MICKEYS, U_NANOSECONDS, U_MICROSECONDS, U_MILISECONDS, U_SECONDS, U_MINUTES, U_HOURS, U_DAYS, U_YEARS, U_PIEFRAMES, U_RADIANS, U_DEGREES, U_REVOLUTIONS, U_CENTS, U_SEMITONES, U_OCTAVES, U_MAJOR2, U_MINOR3, U_MAJOR3, U_PERFECT4, U_TRITONE, U_PERFECT5, U_MINOR6, U_MAJOR6, U_MINOR7, U_MAJOR7, U_PERCENT, U_KILOGRAMS, U_GRAMS, U_MG, U_MICROGRAMS, U_POUNDS, U_OUNCES, U_KGM);
  TOperation = (OpAdd, OpSubtract, OpMultiply, OpDivide, OpPower, OpDiv, OpMod, OpPercentOf, OpAnd, OpOr, OpNot, OpXor, OpBAnd, OpBOr, OpBNot, OpBXor, OpSHL, OpSHR, OpLT, OpLE, OpEquals, OpGE, OpGT, OpNotEqual, OpLA, OpLAE, OpApprox, OpGAE, OpGA, OpNotApprox, OpPercent, OpDotProduct, OpFactorial, OpDoubleFactorial, OpTetration);
  TExpression = class(TObject)
  published
    procedure SetMatrix(m:TRotMat);//00685F90
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;//006860CC
    function CanSet:Boolean;//00684A38
    procedure Release;//00685F38
    procedure Press;//00685EE4
    procedure UnitFactor;//00686198
    function HasUnits:Boolean;//00685E94
    procedure GetPreviousValue;//00685198
    function SetString(NewValue:string):Boolean;//00685FC4
    function SetValue(NewValue:Double):Boolean;//00686054
    //procedure ToString(?:?);//00686100
    procedure Swallow;//006860FC
    procedure FillClone(c:TExpression);//0068514C
    procedure MakeRead;//00685EC0
    procedure MakeReadWrite;//00685ECC
    procedure MakeWrite;//00685ED8
    function Pressed:Boolean;//00685F00
    procedure SetIffy(IsIffy:Boolean);//00685F8C
    function Released:Boolean;//00685F54
    procedure CreateClone;//0067E6E8
    function Clone:TExpression;//00684A3C
    //procedure GetUnitsString(?:?);//006858A4
    procedure EvaluateToMatchAdd(expression:TExpression);//00684CFC
    procedure EvaluateToMatch(expression:TExpression);//00684C4C
    procedure EvaluateColour(x:Double; y:Double; z:Double);//00684B40
    procedure EvaluateVectorToMatch(expression:TExpression; x:Double; z:Double; y:Double);//00684F3C
    procedure EvaluateVector(x:Double; y:Double; z:Double);//00684EF0
    function EvaluateBoolean:Boolean;//00684B20
    procedure Evaluate;//00684A60
    procedure EvaluateInteger;//00684C18
    procedure EvaluateUnits(Units:TUnits; PerUnits1:TUnits; PerUnits2:TUnits);//00684E0C
    //procedure EvaluateString(?:?);//00684C30
    procedure EvaluateVectorToMatchAdd(expression:TExpression; x:Double; z:Double; y:Double);//00684FE4
    function GetDataType:TDataType;//00685178
    procedure GetRotMat(m:TRotMat);//006851B0
    function GetUnits:TUnits;//006858A0
    function GetPerUnits2:TUnits;//00685194
    function GetPerUnits1:TUnits;//00685190
    procedure GetBoolean;//00685160
    procedure GetValue;//0067E6E0
    procedure GetInteger;//0068517C
    procedure GetVector(x:Double; y:Double; z:Double);//00685E6C
    //procedure GetString(?:?);//00685374
  public
    PreviousValue:Double;//f8
    fC:dword;//fC
    Iffy:Boolean;//f10
    Reading:Boolean;//f11
    Writing:Boolean;//f12
    //procedure ToString(?:?); virtual;//00686100
    procedure Evaluate; virtual;//v0//00684A60
    function EvaluateBoolean:Boolean; virtual;//v4//00684B20
    procedure EvaluateInteger; virtual;//v8//00684C18
    //procedure EvaluateString(?:?); virtual;//vC//00684C30
    procedure EvaluateUnits(Units:TUnits; PerUnits1:TUnits; PerUnits2:TUnits); virtual;//v10//00684E0C
    procedure EvaluateToMatch(expression:TExpression); virtual;//v14//00684C4C
    procedure EvaluateToMatchAdd(expression:TExpression); virtual;//v18//00684CFC
    procedure EvaluateColour(x:Double; y:Double; z:Double); virtual;//v1C//00684B40
    procedure EvaluateVector(x:Double; y:Double; z:Double); virtual;//v20//00684EF0
    procedure EvaluateVectorToMatch(expression:TExpression; x:Double; z:Double; y:Double); virtual;//v24//00684F3C
    procedure EvaluateVectorToMatchAdd(expression:TExpression; x:Double; z:Double; y:Double); virtual;//v28//00684FE4
    procedure GetValue; virtual; abstract;//v2C//00404A58
    procedure GetBoolean; virtual;//v30//00685160
    procedure GetInteger; virtual;//v34//0068517C
    //procedure GetString(?:?); virtual;//v38//00685374
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//00685E6C
    procedure GetRotMat(m:TRotMat); virtual;//v40//006851B0
    function GetDataType:TDataType; virtual;//v44//00685178
    function GetUnits:TUnits; virtual;//v48//006858A0
    function GetPerUnits1:TUnits; virtual;//v4C//00685190
    function GetPerUnits2:TUnits; virtual;//v50//00685194
    procedure GetPreviousValue; virtual;//v54//00685198
    function SetValue(NewValue:Double):Boolean; virtual;//v58//00686054
    function SetString(NewValue:string):Boolean; virtual;//v5C//00685FC4
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean; virtual;//v60//006860CC
    procedure SetMatrix(m:TRotMat); virtual;//v64//00685F90
    function CanSet:Boolean; virtual;//v68//00684A38
    procedure Press; virtual;//v6C//00685EE4
    procedure Release; virtual;//v70//00685F38
    procedure SetIffy(IsIffy:Boolean); virtual;//v74//00685F8C
    function Pressed:Boolean; virtual;//v78//00685F00
    function Released:Boolean; virtual;//v7C//00685F54
    procedure CreateClone; virtual; abstract;//v80//00404A58
    procedure FillClone(c:TExpression); virtual;//v84//0068514C
    procedure Swallow; virtual;//v88//006860FC
    procedure MakeRead; virtual;//v8C//00685EC0
    procedure MakeWrite; virtual;//v90//00685ED8
    procedure MakeReadWrite; virtual;//v94//00685ECC
  end;
  TObjectValue = class(TExpression)
  published
    procedure GetGuiFields(DeviceName:string; DeviceNumber:Integer; Field:string);//0068E27C
    function Module:TObject;//0068E514
  public
    ............................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................ThingNumber:Integer;//f18
    function Module:TObject; virtual;//v98//0068E514
    procedure GetGuiFields(DeviceName:string; DeviceNumber:Integer; Field:string); virtual;//v9C//0068E27C
  end;
  TObjectArrayExpression = class(TExpression)
  published
    //procedure SetValue(NewValue:Double; ?:?);//0068DEC8
    function SetString(NewValue:string):Boolean;//0068DE2C
    //procedure SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?);//0068DF2C
    procedure GetRotMat(m:TRotMat);//0068DAE4
    procedure GetVector(x:Double; y:Double; z:Double);//0068DBD0
    procedure SetIffy(IsIffy:Boolean);//0068DDA0
    procedure SetMatrix(m:TRotMat);//0068DDC0
    procedure Pressed;//0068DC98
    procedure Released;//0068DD48
    destructor Destroy();//0068D96C
    //procedure ToString(?:?);//0068DFB8
    procedure Press;//0068DC40
    procedure Release;//0068DCF0
    procedure GetDataType;//0068DA28
    procedure GetUnits;//0068DB64
    procedure GetPerUnits1;//0068DA8C
    procedure CreateClone;//0068D95C
    procedure FillClone(c:TExpression);//0068D9A4
    procedure GetValue;//0068DB70
    procedure GetPerUnits2;//0068DA98
    procedure GetBoolean;//0068D9D0
    procedure GetInteger;//0068DA34
    //procedure GetString(?:?);//0068DB08
    procedure GetPreviousValue;//0068DAA4
    procedure CanSet;//0068D950
    procedure Swallow;//0068DF9C
  public
    Value:TObjectValue;//f18
    Index:TExpression;//f1C
    PrevValues:?;//f20
    //procedure ToString(?:?); virtual;//0068DFB8
    destructor Destroy(); virtual;//0068D96C
    procedure GetValue; virtual;//v2C//0068DB70
    procedure GetBoolean; virtual;//v30//0068D9D0
    procedure GetInteger; virtual;//v34//0068DA34
    //procedure GetString(?:?); virtual;//v38//0068DB08
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//0068DBD0
    procedure GetRotMat(m:TRotMat); virtual;//v40//0068DAE4
    procedure GetDataType; virtual;//v44//0068DA28
    procedure GetUnits; virtual;//v48//0068DB64
    procedure GetPerUnits1; virtual;//v4C//0068DA8C
    procedure GetPerUnits2; virtual;//v50//0068DA98
    procedure GetPreviousValue; virtual;//v54//0068DAA4
    //procedure SetValue(NewValue:Double; ?:?); virtual;//v58//0068DEC8
    function SetString(NewValue:string):Boolean; virtual;//v5C//0068DE2C
    //procedure SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?); virtual;//v60//0068DF2C
    procedure SetMatrix(m:TRotMat); virtual;//v64//0068DDC0
    procedure CanSet; virtual;//v68//0068D950
    procedure Press; virtual;//v6C//0068DC40
    procedure Release; virtual;//v70//0068DCF0
    procedure SetIffy(IsIffy:Boolean); virtual;//v74//0068DDA0
    procedure Pressed; virtual;//v78//0068DC98
    procedure Released; virtual;//v7C//0068DD48
    procedure CreateClone; virtual;//v80//0068D95C
    procedure FillClone(c:TExpression); virtual;//v84//0068D9A4
    procedure Swallow; virtual;//v88//0068DF9C
  end;
  TUpdatingExpression = class(TExpression)
  published
    procedure FillClone(c:TExpression);//0068C040
    procedure Update(frame:Cardinal);//0067F1F4
  public
    ..................FrameLastUpdated:Cardinal;//f18
    procedure FillClone(c:TExpression); virtual;//v84//0068C040
  end;
  TPressedExpression = class(TUpdatingExpression)
  published
    function GetPerUnits1:TUnits;//0068AF78
    function GetUnits:TUnits;//0068AFA0
    procedure FillClone(c:TExpression);//0068AF28
    procedure Swallow;//0068B138
    //function SetValue(NewValue:Double; ?:?):Boolean;//0068AFFC
    function GetPerUnits2:TUnits;//0068AF8C
    procedure CreateClone;//0068AEE0
    procedure SetIffy(IsIffy:Boolean);//0068AFE0
    //procedure ToString(?:?);//0068B150
    procedure GetValue;//0068AFB4
    procedure Update(frame:Cardinal);//0068B43C
    destructor Destroy();//0068AEF0
    function GetDataType:TDataType;//0068AF64
  public
    expression:TExpression;//f20
    Item:Integer;//f24
    HoldTime:TExpression;//f28
    ClickTime:Double;//f30
    f34:dword;//f34
    OldValue:Double;//f38
    f3C:dword;//f3C
    //procedure ToString(?:?); virtual;//0068B150
    destructor Destroy(); virtual;//0068AEF0
    procedure GetValue; virtual;//v2C//0068AFB4
    function GetDataType:TDataType; virtual;//v44//0068AF64
    function GetUnits:TUnits; virtual;//v48//0068AFA0
    function GetPerUnits1:TUnits; virtual;//v4C//0068AF78
    function GetPerUnits2:TUnits; virtual;//v50//0068AF8C
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//0068AFFC
    procedure SetIffy(IsIffy:Boolean); virtual;//v74//0068AFE0
    procedure CreateClone; virtual;//v80//0068AEE0
    procedure FillClone(c:TExpression); virtual;//v84//0068AF28
    procedure Swallow; virtual;//v88//0068B138
    procedure Update(frame:Cardinal); virtual;//v98//0068B43C
  end;
  TSmoother = TSmoother = record//size=108
OldValues:?;//f0
Index:Integer;//fF8
Frames:Integer;//fFC
ValidFrames:Integer;//f100
FrameLastUpdated:Cardinal;//f104
end;;
  TSmoothExpression = class(TUpdatingExpression)
  published
    procedure Update(frame:Cardinal);//0068BFBC
    procedure CreateClone;//0068B760
    procedure GetFrame(frame:Integer);//0068B870
    procedure GetFrameVector(frame:Integer; x:Double; z:Double; y:Double);//0068B8A8
    procedure GetRotMat(m:TRotMat);//0068B930
    procedure Swallow;//0068BDB0
    procedure FillClone(c:TExpression);//0068B7B8
    procedure GetVector(x:Double; y:Double; z:Double);//0068BAE8
    procedure SetIffy(IsIffy:Boolean);//0068BD94
    function GetDataType:TDataType;//0068B820
    procedure GetValue;//0068B9D0
    //procedure ToString(?:?);//0068BDC8
    procedure GetPerUnits1;//0068B918
    procedure GetPerUnits2;//0068B924
    destructor Destroy();//0068B770
    procedure GetUnits;//0068B95C
  public
    expression:TExpression;//f20
    Item:Integer;//f24
    Frames:Integer;//f28
    Deadband:TExpression;//f2C
    OldValues:?;//f30
    OldVectors:?;//f218
    index:Integer;//f7D0
    //procedure ToString(?:?); virtual;//0068BDC8
    destructor Destroy(); virtual;//0068B770
    procedure GetValue; virtual;//v2C//0068B9D0
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//0068BAE8
    procedure GetRotMat(m:TRotMat); virtual;//v40//0068B930
    function GetDataType:TDataType; virtual;//v44//0068B820
    procedure GetUnits; virtual;//v48//0068B95C
    procedure GetPerUnits1; virtual;//v4C//0068B918
    procedure GetPerUnits2; virtual;//v50//0068B924
    procedure SetIffy(IsIffy:Boolean); virtual;//v74//0068BD94
    procedure CreateClone; virtual;//v80//0068B760
    procedure FillClone(c:TExpression); virtual;//v84//0068B7B8
    procedure Swallow; virtual;//v88//0068BDB0
    procedure Update(frame:Cardinal); virtual;//v98//0068BFBC
  end;
  TKalmanExpression = class(TUpdatingExpression)
  published
    procedure Update(frame:Cardinal);//0068E248
    procedure GetPerUnits2;//0068E138
    procedure GetPerUnits1;//0068E12C
    procedure Swallow;//0068E1A4
    procedure FillClone(c:TExpression);//0068E0F8
    procedure CreateClone;//0068E0B8
    procedure SetIffy(IsIffy:Boolean);//0068E188
    //procedure ToString(?:?);//0068E1BC
    procedure GetValue;//0068E150
    procedure GetUnits;//0068E144
    destructor Destroy();//0068E0C8
    function GetDataType:TDataType;//0068E128
  public
    expression:TExpression;//f20
    State:TKalmanFilter;//f28
    //procedure ToString(?:?); virtual;//0068E1BC
    destructor Destroy(); virtual;//0068E0C8
    procedure GetValue; virtual;//v2C//0068E150
    function GetDataType:TDataType; virtual;//v44//0068E128
    procedure GetUnits; virtual;//v48//0068E144
    procedure GetPerUnits1; virtual;//v4C//0068E12C
    procedure GetPerUnits2; virtual;//v50//0068E138
    procedure SetIffy(IsIffy:Boolean); virtual;//v74//0068E188
    procedure CreateClone; virtual;//v80//0068E0B8
    procedure FillClone(c:TExpression); virtual;//v84//0068E0F8
    procedure Swallow; virtual;//v88//0068E1A4
    procedure Update(frame:Cardinal); virtual;//v98//0068E248
  end;
  TUnitsExpression = class(TExpression)
  published
    procedure FillClone(c:TExpression);//0068622C
    procedure CreateClone;//006861E4
    destructor Destroy();//006861F4
    procedure Swallow;//006862E0
    function GetDataType:TDataType;//00686264
    procedure GetVector(x:Double; y:Double; z:Double);//006862A8
    function GetPerUnits1:TUnits;//0068627C
    function GetUnits:TUnits;//0068628C
    procedure GetValue;//00686294
    procedure SetIffy(IsIffy:Boolean);//006862C4
    //procedure ToString(?:?);//006862F8
    function GetPerUnits2:TUnits;//00686284
  public
    expression:TExpression;//f18
    Units:TUnits;//f1C
    PerUnits1:TUnits;//f1D
    PerUnits2:TUnits;//f1E
    //procedure ToString(?:?); virtual;//006862F8
    destructor Destroy(); virtual;//006861F4
    procedure GetValue; virtual;//v2C//00686294
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//006862A8
    function GetDataType:TDataType; virtual;//v44//00686264
    function GetUnits:TUnits; virtual;//v48//0068628C
    function GetPerUnits1:TUnits; virtual;//v4C//0068627C
    function GetPerUnits2:TUnits; virtual;//v50//00686284
    procedure SetIffy(IsIffy:Boolean); virtual;//v74//006862C4
    procedure CreateClone; virtual;//v80//006861E4
    procedure FillClone(c:TExpression); virtual;//v84//0068622C
    procedure Swallow; virtual;//v88//006862E0
  end;
  TInUnitsExpression = class(TExpression)
  published
    procedure FillClone(c:TExpression);//00686440
    procedure CreateClone;//006863F8
    destructor Destroy();//00686408
    procedure Swallow;//006864FC
    function GetDataType:TDataType;//00686478
    procedure GetVector(x:Double; y:Double; z:Double);//006864C0
    function GetPerUnits1:TUnits;//00686490
    function GetUnits:TUnits;//006864A0
    procedure GetValue;//006864A8
    procedure SetIffy(IsIffy:Boolean);//006864E0
    //procedure ToString(?:?);//00686514
    function GetPerUnits2:TUnits;//00686498
  public
    expression:TExpression;//f18
    Units:TUnits;//f1C
    PerUnits1:TUnits;//f1D
    PerUnits2:TUnits;//f1E
    //procedure ToString(?:?); virtual;//00686514
    destructor Destroy(); virtual;//00686408
    procedure GetValue; virtual;//v2C//006864A8
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//006864C0
    function GetDataType:TDataType; virtual;//v44//00686478
    function GetUnits:TUnits; virtual;//v48//006864A0
    function GetPerUnits1:TUnits; virtual;//v4C//00686490
    function GetPerUnits2:TUnits; virtual;//v50//00686498
    procedure SetIffy(IsIffy:Boolean); virtual;//v74//006864E0
    procedure CreateClone; virtual;//v80//006863F8
    procedure FillClone(c:TExpression); virtual;//v84//00686440
    procedure Swallow; virtual;//v88//006864FC
  end;
  TConstant = class(TExpression)
  published
    //constructor Create(value:Double; ?:?);//006848F4
    constructor Create(literal:string);//00684690
    //constructor Create(value:Double; ?:?);//006849EC
    constructor Create(literal:string);//0068471C
    procedure GetVector(x:Double; y:Double; z:Double);//00684998
    procedure FillClone(c:TExpression);//00684940
    procedure CreateClone;//006848E4
    procedure GetPreviousValue;//00684840
    procedure GetValue;//00684884
    function GetDataType:TDataType;//00684838
    //procedure GetString(?:?);//00684858
    constructor Create(literal:string);//00684580
    constructor Create(literal:string);//006847B8
    //procedure ToString(?:?);//0068489C
  public
    Value:Double;//f18
    f1C:dword;//f1C
    x:Double;//f20
    f24:dword;//f24
    y:Double;//f28
    f2C:dword;//f2C
    z:Double;//f30
    f34:dword;//f34
    s:string;//f38
    DataType:TDataType;//f3C
    //procedure ToString(?:?); virtual;//0068489C
    procedure GetValue; virtual;//v2C//00684884
    //procedure GetString(?:?); virtual;//v38//00684858
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//00684998
    function GetDataType:TDataType; virtual;//v44//00684838
    procedure GetPreviousValue; virtual;//v54//00684840
    procedure CreateClone; virtual;//v80//006848E4
    procedure FillClone(c:TExpression); virtual;//v84//00684940
  end;
  TBinaryOp = class(TExpression)
  published
    destructor Destroy();//0068872C
    procedure CreateClone;//00688774
    function ReturnsUnits:Boolean;//00686E58
    procedure SetIffy(IsIffy:Boolean);//00688704
    procedure FillClone(c:TExpression);//00688784
    procedure Swallow;//00687F84
    procedure GetDivUnits(var u:TUnits; var p1:TUnits; var p2:TUnits);//0068673C
    procedure GetVector(x:Double; y:Double; z:Double);//006887B8
    procedure GetRotMat(m:TRotMat);//00689314
    //procedure GetString(?:?);//00686C64
    function GetUnits:TUnits;//00686D10
    function GetDataType:TDataType;//006865B0
    procedure GetValue;//00686E74
    function GetPerUnits1:TUnits;//00686AB4
    //procedure ToString(?:?);//00687FA8
    function ReturnsBoolean:Boolean;//00687EA0
    function GetPerUnits2:TUnits;//00686B9C
    //procedure SetValue(NewValue:Double; ?:?);//00687EBC
  public
    LHS:TExpression;//f18
    RHS:TExpression;//f1C
    Operation:TOperation;//f20
    //procedure ToString(?:?); virtual;//00687FA8
    destructor Destroy(); virtual;//0068872C
    procedure GetValue; virtual;//v2C//00686E74
    //procedure GetString(?:?); virtual;//v38//00686C64
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//006887B8
    procedure GetRotMat(m:TRotMat); virtual;//v40//00689314
    function GetDataType:TDataType; virtual;//v44//006865B0
    function GetUnits:TUnits; virtual;//v48//00686D10
    function GetPerUnits1:TUnits; virtual;//v4C//00686AB4
    function GetPerUnits2:TUnits; virtual;//v50//00686B9C
    //procedure SetValue(NewValue:Double; ?:?); virtual;//v58//00687EBC
    procedure SetIffy(IsIffy:Boolean); virtual;//v74//00688704
    procedure CreateClone; virtual;//v80//00688774
    procedure FillClone(c:TExpression); virtual;//v84//00688784
    procedure Swallow; virtual;//v88//00687F84
  end;
  TUnaryOp = class(TExpression)
  published
    destructor Destroy();//0068A710
    procedure SetIffy(IsIffy:Boolean);//0068AC78
    //procedure ToString(?:?);//0068AD30
    procedure CreateClone;//0068A700
    procedure Swallow;//0068AD18
    procedure GetVector(x:Double; y:Double; z:Double);//0068AB8C
    procedure FillClone(c:TExpression);//0068A748
    //procedure GetString(?:?);//0068A7F4
    procedure GetValue;//0068AAF4
    function GetDataType:TDataType;//0068A770
    procedure GetUnits;//0068A970
    //procedure SetValue(NewValue:Double; ?:?);//0068AC94
    procedure GetPerUnits2;//0068A7D8
    procedure GetPerUnits1;//0068A7BC
  public
    RHS:TExpression;//f18
    Operation:TOperation;//f1C
    //procedure ToString(?:?); virtual;//0068AD30
    destructor Destroy(); virtual;//0068A710
    procedure GetValue; virtual;//v2C//0068AAF4
    //procedure GetString(?:?); virtual;//v38//0068A7F4
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//0068AB8C
    function GetDataType:TDataType; virtual;//v44//0068A770
    procedure GetUnits; virtual;//v48//0068A970
    procedure GetPerUnits1; virtual;//v4C//0068A7BC
    procedure GetPerUnits2; virtual;//v50//0068A7D8
    //procedure SetValue(NewValue:Double; ?:?); virtual;//v58//0068AC94
    procedure SetIffy(IsIffy:Boolean); virtual;//v74//0068AC78
    procedure CreateClone; virtual;//v80//0068A700
    procedure FillClone(c:TExpression); virtual;//v84//0068A748
    procedure Swallow; virtual;//v88//0068AD18
  end;
  TRangeInequality = class(TExpression)
  published
    procedure CreateClone;//00689830
    destructor Destroy();//00689840
    procedure Swallow;//00689C64
    procedure FillClone(c:TExpression);//00689898
    procedure GetValue;//006898E8
    //procedure ToString(?:?);//00689C8C
    procedure SetIffy(IsIffy:Boolean);//00689C34
    function GetDataType:TDataType;//006898E4
  public
    LHS:TExpression;//f18
    MHS:TExpression;//f1C
    RHS:TExpression;//f20
    Between:Boolean;//f24
    LOperation:TOperation;//f25
    ROperation:TOperation;//f26
    //procedure ToString(?:?); virtual;//00689C8C
    destructor Destroy(); virtual;//00689840
    procedure GetValue; virtual;//v2C//006898E8
    function GetDataType:TDataType; virtual;//v44//006898E4
    procedure SetIffy(IsIffy:Boolean); virtual;//v74//00689C34
    procedure CreateClone; virtual;//v80//00689830
    procedure FillClone(c:TExpression); virtual;//v84//00689898
    procedure Swallow; virtual;//v88//00689C64
  end;
  TSequenceExpression = class(TUpdatingExpression)
  published
    destructor Destroy();//0068C06C
    function CanSet:Boolean;//0068C058
    procedure Update(frame:Cardinal);//0068C288
    procedure Swallow;//0068C17C
    //function SetValue(NewValue:Double; ?:?):Boolean;//0068C100
    procedure GetValue;//0068C0DC
    procedure CreateClone;//0068C05C
    //procedure ToString(?:?);//0068C1AC
    function GetDataType:TDataType;//0068C0D8
    procedure FillClone(c:TExpression);//0068C0A4
  public
    Expressions:TObjectList;//f20
    Matched:Integer;//f24
    MatchTime:TDateTime;//f28
    f2C:dword;//f2C
    WriteOnly:Boolean;//f30
    SetState:Integer;//f34
    SetTime:TDateTime;//f38
    //procedure ToString(?:?); virtual;//0068C1AC
    destructor Destroy(); virtual;//0068C06C
    procedure GetValue; virtual;//v2C//0068C0DC
    function GetDataType:TDataType; virtual;//v44//0068C0D8
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//0068C100
    function CanSet:Boolean; virtual;//v68//0068C058
    procedure CreateClone; virtual;//v80//0068C05C
    procedure FillClone(c:TExpression); virtual;//v84//0068C0A4
    procedure Swallow; virtual;//v88//0068C17C
    procedure Update(frame:Cardinal); virtual;//v98//0068C288
  end;
  TVectorExpression = class(TExpression)
  published
    procedure GetPerUnits2;//0068C6F8
    procedure GetPerUnits1;//0068C6EC
    function SetUnits(NewUnits:TUnits; NewPerUnits1:TUnits; NewPerUnits2:TUnits):Boolean;//0068C828
    procedure GetUnits;//0068C704
    procedure Swallow;//0068C978
    destructor Destroy();//0068C658
    procedure SetIffy(IsIffy:Boolean);//0068C7EC
    procedure FillClone(c:TExpression);//0068C6B0
    procedure GetVector(x:Double; y:Double; z:Double);//0068C78C
    procedure GetValue;//0068C710
    procedure CreateClone;//0068C648
    function GetDataType:TDataType;//0068C6E8
    //function SetValue(NewValue:Double; ?:?):Boolean;//0068C8C8
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;//0068C92C
    //procedure ToString(?:?);//0068C9A8
  public
    x:TExpression;//f18
    y:TExpression;//f1C
    z:TExpression;//f20
    //procedure ToString(?:?); virtual;//0068C9A8
    destructor Destroy(); virtual;//0068C658
    procedure GetValue; virtual;//v2C//0068C710
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//0068C78C
    function GetDataType:TDataType; virtual;//v44//0068C6E8
    procedure GetUnits; virtual;//v48//0068C704
    procedure GetPerUnits1; virtual;//v4C//0068C6EC
    procedure GetPerUnits2; virtual;//v50//0068C6F8
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//0068C8C8
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean; virtual;//v60//0068C92C
    procedure SetIffy(IsIffy:Boolean); virtual;//v74//0068C7EC
    procedure CreateClone; virtual;//v80//0068C648
    procedure FillClone(c:TExpression); virtual;//v84//0068C6B0
    procedure Swallow; virtual;//v88//0068C978
  end;
  TMatrixExpression = class(TExpression)
  published
    procedure GetPerUnits2;//0068D630
    procedure GetUnits;//0068D68C
    function SetUnits(NewUnits:TUnits; NewPerUnits1:TUnits; NewPerUnits2:TUnits):Boolean;//0068D728
    procedure GetPerUnits1;//0068D624
    procedure GetRotMat(m:TRotMat);//0068D63C
    procedure Swallow;//0068D7CC
    procedure SetIffy(IsIffy:Boolean);//0068D6F8
    destructor Destroy();//0068D58C
    procedure GetVector(x:Double; y:Double; z:Double);//0068D6B8
    function GetDataType:TDataType;//0068D620
    procedure CreateClone;//0068D57C
    procedure GetValue;//0068D698
    //procedure SetValue(NewValue:Double; ?:?);//0068D798
    procedure FillClone(c:TExpression);//0068D5E4
    //procedure ToString(?:?);//0068D808
    //procedure SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?);//0068D7AC
  public
    .....m:?;//f18
    f1C:TExpression;//f1C
    f20:dword;//f20
    f24:TExpression;//f24
    f28:TExpression;//f28
    f2C:TExpression;//f2C
    f30:TExpression;//f30
    f34:TExpression;//f34
    f38:TExpression;//f38
    //procedure ToString(?:?); virtual;//0068D808
    destructor Destroy(); virtual;//0068D58C
    procedure GetValue; virtual;//v2C//0068D698
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//0068D6B8
    procedure GetRotMat(m:TRotMat); virtual;//v40//0068D63C
    function GetDataType:TDataType; virtual;//v44//0068D620
    procedure GetUnits; virtual;//v48//0068D68C
    procedure GetPerUnits1; virtual;//v4C//0068D624
    procedure GetPerUnits2; virtual;//v50//0068D630
    //procedure SetValue(NewValue:Double; ?:?); virtual;//v58//0068D798
    //procedure SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?); virtual;//v60//0068D7AC
    procedure SetIffy(IsIffy:Boolean); virtual;//v74//0068D6F8
    procedure CreateClone; virtual;//v80//0068D57C
    procedure FillClone(c:TExpression); virtual;//v84//0068D5E4
    procedure Swallow; virtual;//v88//0068D7CC
  end;
  TArrayExpression = class(TExpression)
  published
    //function SetValue(NewValue:Double; ?:?):Boolean;//0068D0AC
    //procedure ToString(?:?);//0068D480
    //procedure GetString(?:?);//0068CB84
    function SetString(NewValue:string):Boolean;//0068CFE0
    procedure GetVector(x:Double; y:Double; z:Double);//0068CE74
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;//0068D304
    procedure Swallow;//0068D468
    function GetDataType:TDataType;//0068CAE8
    destructor Destroy();//0068CAB0
    procedure GetValue;//0068CC48
    procedure CreateClone;//0068CAA0
    procedure SetIffy(IsIffy:Boolean);//0068CFCC
    procedure GetPerUnits2;//0068CB78
    procedure GetPerUnits1;//0068CB6C
    procedure GetUnits;//0068CC3C
  public
    Expression:TExpression;//f18
    Index:Integer;//f1C
    Index2:Integer;//f20
    CIndex:Integer;//f24
    //procedure ToString(?:?); virtual;//0068D480
    destructor Destroy(); virtual;//0068CAB0
    procedure GetValue; virtual;//v2C//0068CC48
    //procedure GetString(?:?); virtual;//v38//0068CB84
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//0068CE74
    function GetDataType:TDataType; virtual;//v44//0068CAE8
    procedure GetUnits; virtual;//v48//0068CC3C
    procedure GetPerUnits1; virtual;//v4C//0068CB6C
    procedure GetPerUnits2; virtual;//v50//0068CB78
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//0068D0AC
    function SetString(NewValue:string):Boolean; virtual;//v5C//0068CFE0
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean; virtual;//v60//0068D304
    procedure SetIffy(IsIffy:Boolean); virtual;//v74//0068CFCC
    procedure CreateClone; virtual;//v80//0068CAA0
    procedure Swallow; virtual;//v88//0068D468
  end;
    //function sub_00682E34(?:TUnits):?;//00682E34
    //function sub_00682E84(?:TUnits; ?:?; ?:?):?;//00682E84
    //function sub_00682EA4(?:TUnits; ?:?; ?:?):?;//00682EA4
    //function sub_00682EC4(?:TObjectList):?;//00682EC4
    //function sub_00682F08:?;//00682F08
    //procedure sub_00682F34(?:TUnits; ?:?);//00682F34
    //procedure sub_0068371C(?:TUnits; ?:?);//0068371C
    //function sub_00683EDC(?:TUnits):?;//00683EDC
    //function sub_00686060(?:?):Boolean;//00686060
    //function sub_00686074(?:Boolean):?;//00686074
    //function sub_0068A98C(?:?):?;//0068A98C
    //function sub_0068A9E4(?:?):?;//0068A9E4
    //function sub_0068AA40(?:?; ?:?; ?:?; ?:?):?;//0068AA40
    //function sub_0068AE8C(?:Extended; ?:Extended):?;//0068AE8C
    //function sub_0068AEA0(?:Extended; ?:?; ?:?; ?:Extended; ?:?; ?:?):?;//0068AEA0
    //procedure sub_0068B83C(?:?; ?:?);//0068B83C
    //function sub_0068B968(?:?):?;//0068B968
    //function sub_0068BF04(?:Integer; ?:?):?;//0068BF04
    //procedure sub_0068BF2C(?:?; ?:?);//0068BF2C
    //procedure sub_0068BF5C(?:?; ?:?; ?:?; ?:?);//0068BF5C

implementation

//0067E6E0
procedure TExpression.GetValue;
begin
{*
>0067E6E0    jmp         @AbstractError
*}
end;

//0067E6E8
procedure TExpression.CreateClone;
begin
{*
>0067E6E8    jmp         @AbstractError
*}
end;

//0067F1F4
procedure TUpdatingExpression.Update(frame:Cardinal);
begin
{*
>0067F1F4    jmp         @AbstractError
*}
end;

//00682E34
{*function sub_00682E34(?:TUnits):?;
begin
 00682E34    and         eax,7F
 00682E37    cmp         eax,1A
>00682E3A    jge         00682E56
 00682E3C    sub         eax,1
>00682E3F    jb          00682E6A
 00682E41    add         eax,0FFFFFFFE
 00682E44    sub         eax,0B
>00682E47    jb          00682E6D
 00682E49    dec         eax
 00682E4A    sub         eax,8
>00682E4D    jb          00682E70
 00682E4F    sub         eax,3
>00682E52    jb          00682E73
>00682E54    jmp         00682E7F
 00682E56    add         eax,0FFFFFFE6
 00682E59    sub         eax,0D
>00682E5C    jb          00682E76
>00682E5E    je          00682E6A
 00682E60    dec         eax
 00682E61    sub         eax,6
>00682E64    jb          00682E79
>00682E66    je          00682E7C
>00682E68    jmp         00682E7F
 00682E6A    xor         eax,eax
 00682E6C    ret
 00682E6D    mov         al,1
 00682E6F    ret
 00682E70    mov         al,2
 00682E72    ret
 00682E73    mov         al,3
 00682E75    ret
 00682E76    mov         al,4
 00682E78    ret
 00682E79    mov         al,5
 00682E7B    ret
 00682E7C    mov         al,6
 00682E7E    ret
 00682E7F    xor         eax,eax
 00682E81    ret
end;*}

//00682E84
{*function sub_00682E84(?:TUnits; ?:?; ?:?):?;
begin
 00682E84    test        dl,dl
>00682E86    jne         00682E8C
 00682E88    test        cl,cl
>00682E8A    je          00682E8F
 00682E8C    xor         eax,eax
 00682E8E    ret
 00682E8F    add         al,0D8
 00682E91    sub         al,2
>00682E93    jb          00682E9B
 00682E95    add         al,0FE
 00682E97    sub         al,2
>00682E99    jae         00682E9F
 00682E9B    mov         al,1
>00682E9D    jmp         00682EA1
 00682E9F    xor         eax,eax
 00682EA1    ret
end;*}

//00682EA4
{*function sub_00682EA4(?:TUnits; ?:?; ?:?):?;
begin
 00682EA4    test        dl,dl
>00682EA6    jne         00682EAC
 00682EA8    test        cl,cl
>00682EAA    je          00682EAF
 00682EAC    xor         eax,eax
 00682EAE    ret
 00682EAF    add         al,0FD
 00682EB1    sub         al,6
>00682EB3    jb          00682EBA
 00682EB5    dec         eax
 00682EB6    sub         al,4
>00682EB8    jae         00682EBE
 00682EBA    mov         al,1
>00682EBC    jmp         00682EC0
 00682EBE    xor         eax,eax
 00682EC0    ret
end;*}

//00682EC4
{*function sub_00682EC4(?:TObjectList):?;
begin
 00682EC4    push        ebx
 00682EC5    push        esi
 00682EC6    push        edi
 00682EC7    push        ebp
 00682EC8    mov         edi,eax
 00682ECA    mov         cl,1
 00682ECC    mov         dl,1
 00682ECE    mov         eax,[00471630];TObjectList
 00682ED3    call        TObjectList.Create;TObjectList.Create
 00682ED8    mov         ebp,eax
 00682EDA    mov         ebx,dword ptr [edi+8];TObjectList.FCount:Integer
 00682EDD    dec         ebx
 00682EDE    test        ebx,ebx
>00682EE0    jl          00682F00
 00682EE2    inc         ebx
 00682EE3    xor         esi,esi
 00682EE5    mov         edx,esi
 00682EE7    mov         eax,edi
 00682EE9    call        TList.Get
 00682EEE    call        TExpression.Clone
 00682EF3    mov         edx,eax
 00682EF5    mov         eax,ebp
 00682EF7    call        TList.Add
 00682EFC    inc         esi
 00682EFD    dec         ebx
>00682EFE    jne         00682EE5
 00682F00    mov         eax,ebp
 00682F02    pop         ebp
 00682F03    pop         edi
 00682F04    pop         esi
 00682F05    pop         ebx
 00682F06    ret
end;*}

//00682F08
{*function sub_00682F08:?;
begin
 00682F08    add         esp,0FFFFFFE0
 00682F0B    lea         eax,[esp+10]
 00682F0F    push        eax
 00682F10    call        kernel32.QueryPerformanceCounter
 00682F15    lea         eax,[esp+18]
 00682F19    push        eax
 00682F1A    call        kernel32.QueryPerformanceFrequency
 00682F1F    fild        qword ptr [esp+10]
 00682F23    fild        qword ptr [esp+18]
 00682F27    fdivp       st(1),st
 00682F29    fstp        tbyte ptr [esp]
 00682F2C    wait
 00682F2D    fld         tbyte ptr [esp]
 00682F30    add         esp,20
 00682F33    ret
end;*}

//00682F34
{*procedure sub_00682F34(?:TUnits; ?:?);
begin
 00682F34    push        ebx
 00682F35    mov         ebx,edx
 00682F37    test        al,al
>00682F39    jne         00682F44
 00682F3B    mov         eax,ebx
 00682F3D    call        @UStrClr
 00682F42    pop         ebx
 00682F43    ret
 00682F44    cmp         al,3
>00682F46    jne         00682F59
 00682F48    mov         eax,ebx
 00682F4A    mov         edx,68327C;'mm'
 00682F4F    call        @UStrAsg
>00682F54    jmp         0068326E
 00682F59    cmp         al,4
>00682F5B    jne         00682F6E
 00682F5D    mov         eax,ebx
 00682F5F    mov         edx,683290;'cm'
 00682F64    call        @UStrAsg
>00682F69    jmp         0068326E
 00682F6E    cmp         al,5
>00682F70    jne         00682F83
 00682F72    mov         eax,ebx
 00682F74    mov         edx,6832A4;'metres'
 00682F79    call        @UStrAsg
>00682F7E    jmp         0068326E
 00682F83    cmp         al,6
>00682F85    jne         00682F98
 00682F87    mov         eax,ebx
 00682F89    mov         edx,6832C0;'km'
 00682F8E    call        @UStrAsg
>00682F93    jmp         0068326E
 00682F98    cmp         al,7
>00682F9A    jne         00682FAD
 00682F9C    mov         eax,ebx
 00682F9E    mov         edx,6832D4;'inches'
 00682FA3    call        @UStrAsg
>00682FA8    jmp         0068326E
 00682FAD    cmp         al,8
>00682FAF    jne         00682FC2
 00682FB1    mov         eax,ebx
 00682FB3    mov         edx,6832F0;'feet'
 00682FB8    call        @UStrAsg
>00682FBD    jmp         0068326E
 00682FC2    cmp         al,0A
>00682FC4    jne         00682FD7
 00682FC6    mov         eax,ebx
 00682FC8    mov         edx,683308;'miles'
 00682FCD    call        @UStrAsg
>00682FD2    jmp         0068326E
 00682FD7    cmp         al,0B
>00682FD9    jne         00682FEC
 00682FDB    mov         eax,ebx
 00682FDD    mov         edx,683320;'p5units'
 00682FE2    call        @UStrAsg
>00682FE7    jmp         0068326E
 00682FEC    cmp         al,10
>00682FEE    jne         00683001
 00682FF0    mov         eax,ebx
 00682FF2    mov         edx,68333C;'ms'
 00682FF7    call        @UStrAsg
>00682FFC    jmp         0068326E
 00683001    cmp         al,0F
>00683003    jne         00683016
 00683005    mov         eax,ebx
 00683007    mov         edx,683350;'microseconds'
 0068300C    call        @UStrAsg
>00683011    jmp         0068326E
 00683016    cmp         al,11
>00683018    jne         0068302B
 0068301A    mov         eax,ebx
 0068301C    mov         edx,683378;'seconds'
 00683021    call        @UStrAsg
>00683026    jmp         0068326E
 0068302B    cmp         al,12
>0068302D    jne         00683040
 0068302F    mov         eax,ebx
 00683031    mov         edx,683394;'minutes'
 00683036    call        @UStrAsg
>0068303B    jmp         0068326E
 00683040    cmp         al,13
>00683042    jne         00683055
 00683044    mov         eax,ebx
 00683046    mov         edx,6833B0;'hours'
 0068304B    call        @UStrAsg
>00683050    jmp         0068326E
 00683055    cmp         al,14
>00683057    jne         0068306A
 00683059    mov         eax,ebx
 0068305B    mov         edx,6833C8;'days'
 00683060    call        @UStrAsg
>00683065    jmp         0068326E
 0068306A    cmp         al,15
>0068306C    jne         0068307F
 0068306E    mov         eax,ebx
 00683070    mov         edx,6833E0;'years'
 00683075    call        @UStrAsg
>0068307A    jmp         0068326E
 0068307F    cmp         al,17
>00683081    jne         00683094
 00683083    mov         eax,ebx
 00683085    mov         edx,6833F8;'radians'
 0068308A    call        @UStrAsg
>0068308F    jmp         0068326E
 00683094    cmp         al,18
>00683096    jne         006830A9
 00683098    mov         eax,ebx
 0068309A    mov         edx,683414;'degrees'
 0068309F    call        @UStrAsg
>006830A4    jmp         0068326E
 006830A9    cmp         al,19
>006830AB    jne         006830BE
 006830AD    mov         eax,ebx
 006830AF    mov         edx,683430;'revolutions'
 006830B4    call        @UStrAsg
>006830B9    jmp         0068326E
 006830BE    cmp         al,16
>006830C0    jne         006830D3
 006830C2    mov         eax,ebx
 006830C4    mov         edx,683454;'PieFrames'
 006830C9    call        @UStrAsg
>006830CE    jmp         0068326E
 006830D3    cmp         al,0C
>006830D5    jne         006830E8
 006830D7    mov         eax,ebx
 006830D9    mov         edx,683474;'pixels'
 006830DE    call        @UStrAsg
>006830E3    jmp         0068326E
 006830E8    cmp         al,0D
>006830EA    jne         006830FD
 006830EC    mov         eax,ebx
 006830EE    mov         edx,683490;'mickeys'
 006830F3    call        @UStrAsg
>006830F8    jmp         0068326E
 006830FD    cmp         al,1A
>006830FF    jne         00683112
 00683101    mov         eax,ebx
 00683103    mov         edx,6834AC;'cents'
 00683108    call        @UStrAsg
>0068310D    jmp         0068326E
 00683112    cmp         al,1B
>00683114    jne         00683127
 00683116    mov         eax,ebx
 00683118    mov         edx,6834C4;'semitones'
 0068311D    call        @UStrAsg
>00683122    jmp         0068326E
 00683127    cmp         al,1C
>00683129    jne         0068313C
 0068312B    mov         eax,ebx
 0068312D    mov         edx,6834E4;'octaves'
 00683132    call        @UStrAsg
>00683137    jmp         0068326E
 0068313C    cmp         al,1D
>0068313E    jne         00683151
 00683140    mov         eax,ebx
 00683142    mov         edx,683500;'MajorSeconds'
 00683147    call        @UStrAsg
>0068314C    jmp         0068326E
 00683151    cmp         al,1E
>00683153    jne         00683166
 00683155    mov         eax,ebx
 00683157    mov         edx,683528;'MinorThirds'
 0068315C    call        @UStrAsg
>00683161    jmp         0068326E
 00683166    cmp         al,1F
>00683168    jne         0068317B
 0068316A    mov         eax,ebx
 0068316C    mov         edx,68354C;'MajorThirds'
 00683171    call        @UStrAsg
>00683176    jmp         0068326E
 0068317B    cmp         al,20
>0068317D    jne         00683190
 0068317F    mov         eax,ebx
 00683181    mov         edx,683570;'PerfectFourths'
 00683186    call        @UStrAsg
>0068318B    jmp         0068326E
 00683190    cmp         al,21
>00683192    jne         006831A5
 00683194    mov         eax,ebx
 00683196    mov         edx,68359C;'Tritones'
 0068319B    call        @UStrAsg
>006831A0    jmp         0068326E
 006831A5    cmp         al,22
>006831A7    jne         006831BA
 006831A9    mov         eax,ebx
 006831AB    mov         edx,6835BC;'PerfectFifths'
 006831B0    call        @UStrAsg
>006831B5    jmp         0068326E
 006831BA    cmp         al,23
>006831BC    jne         006831CF
 006831BE    mov         eax,ebx
 006831C0    mov         edx,6835E4;'MinorSixths'
 006831C5    call        @UStrAsg
>006831CA    jmp         0068326E
 006831CF    cmp         al,24
>006831D1    jne         006831E4
 006831D3    mov         eax,ebx
 006831D5    mov         edx,683608;'MajorSixths'
 006831DA    call        @UStrAsg
>006831DF    jmp         0068326E
 006831E4    cmp         al,25
>006831E6    jne         006831F6
 006831E8    mov         eax,ebx
 006831EA    mov         edx,68362C;'MinorSevenths'
 006831EF    call        @UStrAsg
>006831F4    jmp         0068326E
 006831F6    cmp         al,26
>006831F8    jne         00683208
 006831FA    mov         eax,ebx
 006831FC    mov         edx,683654;'MajorSevenths'
 00683201    call        @UStrAsg
>00683206    jmp         0068326E
 00683208    cmp         al,28
>0068320A    jne         0068321A
 0068320C    mov         eax,ebx
 0068320E    mov         edx,68367C;'Kg'
 00683213    call        @UStrAsg
>00683218    jmp         0068326E
 0068321A    cmp         al,29
>0068321C    jne         0068322C
 0068321E    mov         eax,ebx
 00683220    mov         edx,683690;'grams'
 00683225    call        @UStrAsg
>0068322A    jmp         0068326E
 0068322C    cmp         al,2C
>0068322E    jne         0068323E
 00683230    mov         eax,ebx
 00683232    mov         edx,6836A8;^'RealLeftStick'
 00683237    call        @UStrAsg
>0068323C    jmp         0068326E
 0068323E    cmp         al,2D
>00683240    jne         00683250
 00683242    mov         eax,ebx
 00683244    mov         edx,6836C4;'ounces'
 00683249    call        @UStrAsg
>0068324E    jmp         0068326E
 00683250    cmp         al,2E
>00683252    jne         00683262
 00683254    mov         eax,ebx
 00683256    mov         edx,6836E0;'Kg metres'
 0068325B    call        @UStrAsg
>00683260    jmp         0068326E
 00683262    mov         eax,ebx
 00683264    mov         edx,683700;'unknown units'
 00683269    call        @UStrAsg
 0068326E    pop         ebx
 0068326F    ret
end;*}

//0068371C
{*procedure sub_0068371C(?:TUnits; ?:?);
begin
 0068371C    push        ebx
 0068371D    mov         ebx,edx
 0068371F    test        al,al
>00683721    jne         0068372C
 00683723    mov         eax,ebx
 00683725    call        @UStrClr
 0068372A    pop         ebx
 0068372B    ret
 0068372C    cmp         al,3
>0068372E    jne         00683741
 00683730    mov         eax,ebx
 00683732    mov         edx,683A64;'mm'
 00683737    call        @UStrAsg
>0068373C    jmp         00683A56
 00683741    cmp         al,4
>00683743    jne         00683756
 00683745    mov         eax,ebx
 00683747    mov         edx,683A78;'cm'
 0068374C    call        @UStrAsg
>00683751    jmp         00683A56
 00683756    cmp         al,5
>00683758    jne         0068376B
 0068375A    mov         eax,ebx
 0068375C    mov         edx,683A8C;'metre'
 00683761    call        @UStrAsg
>00683766    jmp         00683A56
 0068376B    cmp         al,6
>0068376D    jne         00683780
 0068376F    mov         eax,ebx
 00683771    mov         edx,683AA4;'km'
 00683776    call        @UStrAsg
>0068377B    jmp         00683A56
 00683780    cmp         al,7
>00683782    jne         00683795
 00683784    mov         eax,ebx
 00683786    mov         edx,683AB8;'inch'
 0068378B    call        @UStrAsg
>00683790    jmp         00683A56
 00683795    cmp         al,8
>00683797    jne         006837AA
 00683799    mov         eax,ebx
 0068379B    mov         edx,683AD0;'foot'
 006837A0    call        @UStrAsg
>006837A5    jmp         00683A56
 006837AA    cmp         al,0A
>006837AC    jne         006837BF
 006837AE    mov         eax,ebx
 006837B0    mov         edx,683AE8;'mile'
 006837B5    call        @UStrAsg
>006837BA    jmp         00683A56
 006837BF    cmp         al,0B
>006837C1    jne         006837D4
 006837C3    mov         eax,ebx
 006837C5    mov         edx,683B00;'p5unit'
 006837CA    call        @UStrAsg
>006837CF    jmp         00683A56
 006837D4    cmp         al,0F
>006837D6    jne         006837E9
 006837D8    mov         eax,ebx
 006837DA    mov         edx,683B1C;'microsecond'
 006837DF    call        @UStrAsg
>006837E4    jmp         00683A56
 006837E9    cmp         al,10
>006837EB    jne         006837FE
 006837ED    mov         eax,ebx
 006837EF    mov         edx,683B40;'ms'
 006837F4    call        @UStrAsg
>006837F9    jmp         00683A56
 006837FE    cmp         al,11
>00683800    jne         00683813
 00683802    mov         eax,ebx
 00683804    mov         edx,683B54;'second'
 00683809    call        @UStrAsg
>0068380E    jmp         00683A56
 00683813    cmp         al,12
>00683815    jne         00683828
 00683817    mov         eax,ebx
 00683819    mov         edx,683B70;'minute'
 0068381E    call        @UStrAsg
>00683823    jmp         00683A56
 00683828    cmp         al,13
>0068382A    jne         0068383D
 0068382C    mov         eax,ebx
 0068382E    mov         edx,683B8C;'hour'
 00683833    call        @UStrAsg
>00683838    jmp         00683A56
 0068383D    cmp         al,14
>0068383F    jne         00683852
 00683841    mov         eax,ebx
 00683843    mov         edx,683BA4;'day'
 00683848    call        @UStrAsg
>0068384D    jmp         00683A56
 00683852    cmp         al,15
>00683854    jne         00683867
 00683856    mov         eax,ebx
 00683858    mov         edx,683BB8;'year'
 0068385D    call        @UStrAsg
>00683862    jmp         00683A56
 00683867    cmp         al,17
>00683869    jne         0068387C
 0068386B    mov         eax,ebx
 0068386D    mov         edx,683BD0;'radian'
 00683872    call        @UStrAsg
>00683877    jmp         00683A56
 0068387C    cmp         al,18
>0068387E    jne         00683891
 00683880    mov         eax,ebx
 00683882    mov         edx,683BEC;'degree'
 00683887    call        @UStrAsg
>0068388C    jmp         00683A56
 00683891    cmp         al,19
>00683893    jne         006838A6
 00683895    mov         eax,ebx
 00683897    mov         edx,683C08;'revolution'
 0068389C    call        @UStrAsg
>006838A1    jmp         00683A56
 006838A6    cmp         al,16
>006838A8    jne         006838BB
 006838AA    mov         eax,ebx
 006838AC    mov         edx,683C2C;'PieFrame'
 006838B1    call        @UStrAsg
>006838B6    jmp         00683A56
 006838BB    cmp         al,0C
>006838BD    jne         006838D0
 006838BF    mov         eax,ebx
 006838C1    mov         edx,683C4C;'pixel'
 006838C6    call        @UStrAsg
>006838CB    jmp         00683A56
 006838D0    cmp         al,0D
>006838D2    jne         006838E5
 006838D4    mov         eax,ebx
 006838D6    mov         edx,683C64;'mickey'
 006838DB    call        @UStrAsg
>006838E0    jmp         00683A56
 006838E5    cmp         al,1A
>006838E7    jne         006838FA
 006838E9    mov         eax,ebx
 006838EB    mov         edx,683C80;'cent'
 006838F0    call        @UStrAsg
>006838F5    jmp         00683A56
 006838FA    cmp         al,1B
>006838FC    jne         0068390F
 006838FE    mov         eax,ebx
 00683900    mov         edx,683C98;'semitone'
 00683905    call        @UStrAsg
>0068390A    jmp         00683A56
 0068390F    cmp         al,1C
>00683911    jne         00683924
 00683913    mov         eax,ebx
 00683915    mov         edx,683CB8;'octave'
 0068391A    call        @UStrAsg
>0068391F    jmp         00683A56
 00683924    cmp         al,1D
>00683926    jne         00683939
 00683928    mov         eax,ebx
 0068392A    mov         edx,683CD4;'MajorSecond'
 0068392F    call        @UStrAsg
>00683934    jmp         00683A56
 00683939    cmp         al,1E
>0068393B    jne         0068394E
 0068393D    mov         eax,ebx
 0068393F    mov         edx,683CF8;'MinorThird'
 00683944    call        @UStrAsg
>00683949    jmp         00683A56
 0068394E    cmp         al,1F
>00683950    jne         00683963
 00683952    mov         eax,ebx
 00683954    mov         edx,683D1C;'MajorThird'
 00683959    call        @UStrAsg
>0068395E    jmp         00683A56
 00683963    cmp         al,20
>00683965    jne         00683978
 00683967    mov         eax,ebx
 00683969    mov         edx,683D40;'PerfectFourth'
 0068396E    call        @UStrAsg
>00683973    jmp         00683A56
 00683978    cmp         al,21
>0068397A    jne         0068398D
 0068397C    mov         eax,ebx
 0068397E    mov         edx,683D68;'Tritone'
 00683983    call        @UStrAsg
>00683988    jmp         00683A56
 0068398D    cmp         al,22
>0068398F    jne         006839A2
 00683991    mov         eax,ebx
 00683993    mov         edx,683D84;'PerfectFifth'
 00683998    call        @UStrAsg
>0068399D    jmp         00683A56
 006839A2    cmp         al,23
>006839A4    jne         006839B7
 006839A6    mov         eax,ebx
 006839A8    mov         edx,683DAC;'MinorSixth'
 006839AD    call        @UStrAsg
>006839B2    jmp         00683A56
 006839B7    cmp         al,24
>006839B9    jne         006839CC
 006839BB    mov         eax,ebx
 006839BD    mov         edx,683DD0;'MajorSixth'
 006839C2    call        @UStrAsg
>006839C7    jmp         00683A56
 006839CC    cmp         al,25
>006839CE    jne         006839DE
 006839D0    mov         eax,ebx
 006839D2    mov         edx,683DF4;'MinorSeventh'
 006839D7    call        @UStrAsg
>006839DC    jmp         00683A56
 006839DE    cmp         al,26
>006839E0    jne         006839F0
 006839E2    mov         eax,ebx
 006839E4    mov         edx,683E1C;'MajorSeventh'
 006839E9    call        @UStrAsg
>006839EE    jmp         00683A56
 006839F0    cmp         al,28
>006839F2    jne         00683A02
 006839F4    mov         eax,ebx
 006839F6    mov         edx,683E44;'Kg'
 006839FB    call        @UStrAsg
>00683A00    jmp         00683A56
 00683A02    cmp         al,29
>00683A04    jne         00683A14
 00683A06    mov         eax,ebx
 00683A08    mov         edx,683E58;'gram'
 00683A0D    call        @UStrAsg
>00683A12    jmp         00683A56
 00683A14    cmp         al,2C
>00683A16    jne         00683A26
 00683A18    mov         eax,ebx
 00683A1A    mov         edx,683E70;^'RealLeftStick'
 00683A1F    call        @UStrAsg
>00683A24    jmp         00683A56
 00683A26    cmp         al,2D
>00683A28    jne         00683A38
 00683A2A    mov         eax,ebx
 00683A2C    mov         edx,683E88;'ounce'
 00683A31    call        @UStrAsg
>00683A36    jmp         00683A56
 00683A38    cmp         al,2E
>00683A3A    jne         00683A4A
 00683A3C    mov         eax,ebx
 00683A3E    mov         edx,683EA0;'Kg metre'
 00683A43    call        @UStrAsg
>00683A48    jmp         00683A56
 00683A4A    mov         eax,ebx
 00683A4C    mov         edx,683EC0;'unknown units'
 00683A51    call        @UStrAsg
 00683A56    pop         ebx
 00683A57    ret
end;*}

//00683EDC
{*function sub_00683EDC(?:TUnits):?;
begin
 00683EDC    add         esp,0FFFFFFF4
 00683EDF    test        al,al
>00683EE1    jne         00683EF5
 00683EE3    xor         eax,eax
 00683EE5    mov         dword ptr [esp],eax
 00683EE8    mov         dword ptr [esp+4],3FF00000
>00683EF0    jmp         006842F9
 00683EF5    cmp         al,1
>00683EF7    jne         00683F0D
 00683EF9    mov         dword ptr [esp],0E826D695
 00683F00    mov         dword ptr [esp+4],3E112E0B
>00683F08    jmp         006842F9
 00683F0D    cmp         al,2
>00683F0F    jne         00683F25
 00683F11    mov         dword ptr [esp],0A0B5ED8D
 00683F18    mov         dword ptr [esp+4],3EB0C6F7
>00683F20    jmp         006842F9
 00683F25    cmp         al,3
>00683F27    jne         00683F3D
 00683F29    mov         dword ptr [esp],0D2F1A9FC
 00683F30    mov         dword ptr [esp+4],3F50624D
>00683F38    jmp         006842F9
 00683F3D    cmp         al,4
>00683F3F    jne         00683F55
 00683F41    mov         dword ptr [esp],47AE147B
 00683F48    mov         dword ptr [esp+4],3F847AE1
>00683F50    jmp         006842F9
 00683F55    cmp         al,5
>00683F57    jne         00683F6B
 00683F59    xor         eax,eax
 00683F5B    mov         dword ptr [esp],eax
 00683F5E    mov         dword ptr [esp+4],3FF00000
>00683F66    jmp         006842F9
 00683F6B    cmp         al,6
>00683F6D    jne         00683F81
 00683F6F    xor         eax,eax
 00683F71    mov         dword ptr [esp],eax
 00683F74    mov         dword ptr [esp+4],408F4000
>00683F7C    jmp         006842F9
 00683F81    cmp         al,7
>00683F83    jne         00683F99
 00683F85    mov         dword ptr [esp],25460AA6
 00683F8C    mov         dword ptr [esp+4],3F9A0275
>00683F94    jmp         006842F9
 00683F99    cmp         al,8
>00683F9B    jne         00683FB1
 00683F9D    mov         dword ptr [esp],0DBF487FD
 00683FA4    mov         dword ptr [esp+4],3FD381D7
>00683FAC    jmp         006842F9
 00683FB1    cmp         al,9
>00683FB3    jne         00683FC9
 00683FB5    mov         dword ptr [esp],0C9EECBFB
 00683FBC    mov         dword ptr [esp+4],3FED42C3
>00683FC4    jmp         006842F9
 00683FC9    cmp         al,0A
>00683FCB    jne         00683FE1
 00683FCD    mov         dword ptr [esp],4189374C
 00683FD4    mov         dword ptr [esp+4],40992560
>00683FDC    jmp         006842F9
 00683FE1    cmp         al,0B
>00683FE3    jne         00683FF9
 00683FE5    mov         dword ptr [esp],374BC6A8
 00683FEC    mov         dword ptr [esp+4],3F404189
>00683FF4    jmp         006842F9
 00683FF9    cmp         al,0C
>00683FFB    jne         00684020
 00683FFD    mov         eax,[0078DB00];^Screen:TScreen
 00684002    mov         eax,dword ptr [eax]
 00684004    call        TScreen.GetWidth
 00684009    mov         dword ptr [esp+8],eax
 0068400D    fild        dword ptr [esp+8]
 00684011    fdivr       qword ptr ds:[78BDD8];gvar_0078BDD8:Double
 00684017    fstp        qword ptr [esp]
 0068401A    wait
>0068401B    jmp         006842F9
 00684020    cmp         al,0D
>00684022    jne         0068403A
 00684024    fld         tbyte ptr ds:[684300];0.0254:Extended
 0068402A    mov         eax,[0078D44C];^gvar_0078BD88:Double
 0068402F    fdiv        qword ptr [eax]
 00684031    fstp        qword ptr [esp]
 00684034    wait
>00684035    jmp         006842F9
 0068403A    cmp         al,0E
>0068403C    jne         00684052
 0068403E    mov         dword ptr [esp],0E826D695
 00684045    mov         dword ptr [esp+4],3E112E0B
>0068404D    jmp         006842F9
 00684052    cmp         al,0F
>00684054    jne         0068406A
 00684056    mov         dword ptr [esp],0A0B5ED8D
 0068405D    mov         dword ptr [esp+4],3EB0C6F7
>00684065    jmp         006842F9
 0068406A    cmp         al,10
>0068406C    jne         00684082
 0068406E    mov         dword ptr [esp],0D2F1A9FC
 00684075    mov         dword ptr [esp+4],3F50624D
>0068407D    jmp         006842F9
 00684082    cmp         al,11
>00684084    jne         00684098
 00684086    xor         eax,eax
 00684088    mov         dword ptr [esp],eax
 0068408B    mov         dword ptr [esp+4],3FF00000
>00684093    jmp         006842F9
 00684098    cmp         al,16
>0068409A    jne         006840B2
 0068409C    fld         dword ptr ds:[68430C];1:Single
 006840A2    mov         eax,[0078D160];^gvar_0078BD80:Double
 006840A7    fdiv        qword ptr [eax]
 006840A9    fstp        qword ptr [esp]
 006840AC    wait
>006840AD    jmp         006842F9
 006840B2    cmp         al,12
>006840B4    jne         006840C8
 006840B6    xor         eax,eax
 006840B8    mov         dword ptr [esp],eax
 006840BB    mov         dword ptr [esp+4],404E0000
>006840C3    jmp         006842F9
 006840C8    cmp         al,13
>006840CA    jne         006840DE
 006840CC    xor         eax,eax
 006840CE    mov         dword ptr [esp],eax
 006840D1    mov         dword ptr [esp+4],40AC2000
>006840D9    jmp         006842F9
 006840DE    cmp         al,14
>006840E0    jne         006840F4
 006840E2    xor         eax,eax
 006840E4    mov         dword ptr [esp],eax
 006840E7    mov         dword ptr [esp+4],40F51800
>006840EF    jmp         006842F9
 006840F4    cmp         al,17
>006840F6    jne         0068410C
 006840F8    mov         dword ptr [esp],7331AD7B
 006840FF    mov         dword ptr [esp+4],41092DC6
>00684107    jmp         006842F9
 0068410C    cmp         al,18
>0068410E    jne         00684122
 00684110    xor         eax,eax
 00684112    mov         dword ptr [esp],eax
 00684115    mov         dword ptr [esp+4],40AC2000
>0068411D    jmp         006842F9
 00684122    cmp         al,19
>00684124    jne         00684138
 00684126    xor         eax,eax
 00684128    mov         dword ptr [esp],eax
 0068412B    mov         dword ptr [esp+4],4133C680
>00684133    jmp         006842F9
 00684138    cmp         al,1A
>0068413A    jne         00684150
 0068413C    mov         dword ptr [esp],47AE147B
 00684143    mov         dword ptr [esp+4],3F847AE1
>0068414B    jmp         006842F9
 00684150    cmp         al,1B
>00684152    jne         00684166
 00684154    xor         eax,eax
 00684156    mov         dword ptr [esp],eax
 00684159    mov         dword ptr [esp+4],3FF00000
>00684161    jmp         006842F9
 00684166    cmp         al,1C
>00684168    jne         0068417C
 0068416A    xor         eax,eax
 0068416C    mov         dword ptr [esp],eax
 0068416F    mov         dword ptr [esp+4],40280000
>00684177    jmp         006842F9
 0068417C    cmp         al,1D
>0068417E    jne         00684192
 00684180    xor         eax,eax
 00684182    mov         dword ptr [esp],eax
 00684185    mov         dword ptr [esp+4],40000000
>0068418D    jmp         006842F9
 00684192    cmp         al,1E
>00684194    jne         006841A8
 00684196    xor         eax,eax
 00684198    mov         dword ptr [esp],eax
 0068419B    mov         dword ptr [esp+4],40080000
>006841A3    jmp         006842F9
 006841A8    cmp         al,1F
>006841AA    jne         006841BE
 006841AC    xor         eax,eax
 006841AE    mov         dword ptr [esp],eax
 006841B1    mov         dword ptr [esp+4],40100000
>006841B9    jmp         006842F9
 006841BE    cmp         al,20
>006841C0    jne         006841D4
 006841C2    xor         eax,eax
 006841C4    mov         dword ptr [esp],eax
 006841C7    mov         dword ptr [esp+4],40140000
>006841CF    jmp         006842F9
 006841D4    cmp         al,21
>006841D6    jne         006841EA
 006841D8    xor         eax,eax
 006841DA    mov         dword ptr [esp],eax
 006841DD    mov         dword ptr [esp+4],40180000
>006841E5    jmp         006842F9
 006841EA    cmp         al,22
>006841EC    jne         00684200
 006841EE    xor         eax,eax
 006841F0    mov         dword ptr [esp],eax
 006841F3    mov         dword ptr [esp+4],401C0000
>006841FB    jmp         006842F9
 00684200    cmp         al,23
>00684202    jne         00684216
 00684204    xor         eax,eax
 00684206    mov         dword ptr [esp],eax
 00684209    mov         dword ptr [esp+4],40200000
>00684211    jmp         006842F9
 00684216    cmp         al,24
>00684218    jne         0068422C
 0068421A    xor         eax,eax
 0068421C    mov         dword ptr [esp],eax
 0068421F    mov         dword ptr [esp+4],40220000
>00684227    jmp         006842F9
 0068422C    cmp         al,25
>0068422E    jne         00684242
 00684230    xor         eax,eax
 00684232    mov         dword ptr [esp],eax
 00684235    mov         dword ptr [esp+4],40240000
>0068423D    jmp         006842F9
 00684242    cmp         al,26
>00684244    jne         00684258
 00684246    xor         eax,eax
 00684248    mov         dword ptr [esp],eax
 0068424B    mov         dword ptr [esp+4],40260000
>00684253    jmp         006842F9
 00684258    cmp         al,28
>0068425A    jne         0068426E
 0068425C    xor         eax,eax
 0068425E    mov         dword ptr [esp],eax
 00684261    mov         dword ptr [esp+4],3FF00000
>00684269    jmp         006842F9
 0068426E    cmp         al,29
>00684270    jne         00684283
 00684272    mov         dword ptr [esp],0D2F1A9FC
 00684279    mov         dword ptr [esp+4],3F50624D
>00684281    jmp         006842F9
 00684283    cmp         al,2A
>00684285    jne         00684298
 00684287    mov         dword ptr [esp],0A0B5ED8D
 0068428E    mov         dword ptr [esp+4],3EB0C6F7
>00684296    jmp         006842F9
 00684298    cmp         al,2B
>0068429A    jne         006842AD
 0068429C    mov         dword ptr [esp],0E826D695
 006842A3    mov         dword ptr [esp+4],3E112E0B
>006842AB    jmp         006842F9
 006842AD    cmp         al,2C
>006842AF    jne         006842C2
 006842B1    mov         dword ptr [esp],4AB75E51
 006842B8    mov         dword ptr [esp+4],3FDD07A8
>006842C0    jmp         006842F9
 006842C2    cmp         al,2D
>006842C4    jne         006842D7
 006842C6    mov         dword ptr [esp],4AB75E51
 006842CD    mov         dword ptr [esp+4],3F9D07A8
>006842D5    jmp         006842F9
 006842D7    cmp         al,2E
>006842D9    jne         006842EC
 006842DB    mov         dword ptr [esp],0D0FAC688
 006842E2    mov         dword ptr [esp+4],3FBA1F58
>006842EA    jmp         006842F9
 006842EC    xor         eax,eax
 006842EE    mov         dword ptr [esp],eax
 006842F1    mov         dword ptr [esp+4],3FF00000
 006842F9    fld         qword ptr [esp]
 006842FC    add         esp,0C
 006842FF    ret
end;*}

//00684310
procedure THashTable.Add(identifier:string; Value:Integer);
begin
{*
 00684310    push        ebp
 00684311    mov         ebp,esp
 00684313    push        ecx
 00684314    push        ebx
 00684315    push        esi
 00684316    mov         esi,ecx
 00684318    mov         dword ptr [ebp-4],edx
 0068431B    mov         ebx,eax
 0068431D    mov         eax,dword ptr [ebp-4]
 00684320    call        @UStrAddRef
 00684325    xor         eax,eax
 00684327    push        ebp
 00684328    push        684356
 0068432D    push        dword ptr fs:[eax]
 00684330    mov         dword ptr fs:[eax],esp
 00684333    mov         ecx,esi
 00684335    mov         edx,dword ptr [ebp-4]
 00684338    mov         eax,dword ptr [ebx+4];THashTable......................................L:THashedStringLis...
 0068433B    mov         ebx,dword ptr [eax]
 0068433D    call        dword ptr [ebx+3C];TStringList.AddObject
 00684340    xor         eax,eax
 00684342    pop         edx
 00684343    pop         ecx
 00684344    pop         ecx
 00684345    mov         dword ptr fs:[eax],edx
 00684348    push        68435D
 0068434D    lea         eax,[ebp-4]
 00684350    call        @UStrClr
 00684355    ret
>00684356    jmp         @HandleFinally
>0068435B    jmp         0068434D
 0068435D    pop         esi
 0068435E    pop         ebx
 0068435F    pop         ecx
 00684360    pop         ebp
 00684361    ret
*}
end;

//00684364
procedure THashTable.Add(identifier:string);
begin
{*
 00684364    push        ebp
 00684365    mov         ebp,esp
 00684367    push        ecx
 00684368    push        ebx
 00684369    push        esi
 0068436A    mov         dword ptr [ebp-4],edx
 0068436D    mov         ebx,eax
 0068436F    mov         eax,dword ptr [ebp-4]
 00684372    call        @UStrAddRef
 00684377    xor         eax,eax
 00684379    push        ebp
 0068437A    push        6843B1
 0068437F    push        dword ptr fs:[eax]
 00684382    mov         dword ptr fs:[eax],esp
 00684385    mov         esi,dword ptr [ebx+4];THashTable.......................................L:THashedStringLi...
 00684388    mov         eax,esi
 0068438A    mov         edx,dword ptr [eax]
 0068438C    call        dword ptr [edx+14];TStringList.GetCount
 0068438F    mov         ecx,eax
 00684391    mov         edx,dword ptr [ebp-4]
 00684394    mov         eax,esi
 00684396    mov         ebx,dword ptr [eax]
 00684398    call        dword ptr [ebx+3C];TStringList.AddObject
 0068439B    xor         eax,eax
 0068439D    pop         edx
 0068439E    pop         ecx
 0068439F    pop         ecx
 006843A0    mov         dword ptr fs:[eax],edx
 006843A3    push        6843B8
 006843A8    lea         eax,[ebp-4]
 006843AB    call        @UStrClr
 006843B0    ret
>006843B1    jmp         @HandleFinally
>006843B6    jmp         006843A8
 006843B8    pop         esi
 006843B9    pop         ebx
 006843BA    pop         ecx
 006843BB    pop         ebp
 006843BC    ret
*}
end;

//006843C0
procedure THashTable.Clear;
begin
{*
 006843C0    mov         eax,dword ptr [eax+4];THashTable........................................L:THashedStringL...
 006843C3    mov         edx,dword ptr [eax]
 006843C5    call        dword ptr [edx+44];TStringList.Clear
 006843C8    ret
*}
end;

//006843CC
function THashTable.Count:Integer;
begin
{*
 006843CC    mov         eax,dword ptr [eax+4];THashTable.........................................L:THashedString...
 006843CF    mov         edx,dword ptr [eax]
 006843D1    call        dword ptr [edx+14];TStringList.GetCount
 006843D4    ret
*}
end;

//006843D8
constructor THashTable.Create;
begin
{*
 006843D8    push        ebx
 006843D9    push        esi
 006843DA    push        edi
 006843DB    test        dl,dl
>006843DD    je          006843E7
 006843DF    add         esp,0FFFFFFF0
 006843E2    call        @ClassCreate
 006843E7    mov         ebx,edx
 006843E9    mov         edi,eax
 006843EB    mov         dl,1
 006843ED    mov         eax,[004590C8];THashedStringList
 006843F2    call        TStringList.Create;THashedStringList.Create
 006843F7    mov         esi,eax
 006843F9    mov         dword ptr [edi+4],esi;THashTable..........................................L:THashedStrin...
 006843FC    mov         byte ptr [esi+39],0;THashedStringList.FDuplicates:TDuplicates
 00684400    mov         eax,edi
 00684402    test        bl,bl
>00684404    je          00684415
 00684406    call        @AfterConstruction
 0068440B    pop         dword ptr fs:[0]
 00684412    add         esp,0C
 00684415    mov         eax,edi
 00684417    pop         edi
 00684418    pop         esi
 00684419    pop         ebx
 0068441A    ret
*}
end;

//0068441C
destructor THashTable.Destroy();
begin
{*
 0068441C    push        ebx
 0068441D    push        esi
 0068441E    call        @BeforeDestruction
 00684423    mov         ebx,edx
 00684425    mov         esi,eax
 00684427    mov         eax,dword ptr [esi+4];THashTable...........................................L:THashedStri...
 0068442A    call        TObject.Free
 0068442F    xor         eax,eax
 00684431    mov         dword ptr [esi+4],eax;THashTable............................................L:THashedStr...
 00684434    mov         edx,ebx
 00684436    and         dl,0FC
 00684439    mov         eax,esi
 0068443B    call        TObject.Destroy
 00684440    test        bl,bl
>00684442    jle         0068444B
 00684444    mov         eax,esi
 00684446    call        @ClassDestroy
 0068444B    pop         esi
 0068444C    pop         ebx
 0068444D    ret
*}
end;

//00684450
function THashTable.Get(identifier:string):Integer;
begin
{*
 00684450    push        ebp
 00684451    mov         ebp,esp
 00684453    push        ecx
 00684454    push        ebx
 00684455    push        esi
 00684456    mov         dword ptr [ebp-4],edx
 00684459    mov         ebx,eax
 0068445B    mov         eax,dword ptr [ebp-4]
 0068445E    call        @UStrAddRef
 00684463    xor         eax,eax
 00684465    push        ebp
 00684466    push        6844A9
 0068446B    push        dword ptr fs:[eax]
 0068446E    mov         dword ptr fs:[eax],esp
 00684471    mov         edx,dword ptr [ebp-4]
 00684474    mov         eax,dword ptr [ebx+4];THashTable.............................................L:THashedSt...
 00684477    mov         ecx,dword ptr [eax]
 00684479    call        dword ptr [ecx+54];THashedStringList.IndexOf
 0068447C    mov         esi,eax
 0068447E    test        esi,esi
>00684480    jge         00684487
 00684482    or          ebx,0FFFFFFFF
>00684485    jmp         00684493
 00684487    mov         edx,esi
 00684489    mov         eax,dword ptr [ebx+4];THashTable..............................................L:THashedS...
 0068448C    mov         ecx,dword ptr [eax]
 0068448E    call        dword ptr [ecx+18];TStringList.GetObject
 00684491    mov         ebx,eax
 00684493    xor         eax,eax
 00684495    pop         edx
 00684496    pop         ecx
 00684497    pop         ecx
 00684498    mov         dword ptr fs:[eax],edx
 0068449B    push        6844B0
 006844A0    lea         eax,[ebp-4]
 006844A3    call        @UStrClr
 006844A8    ret
>006844A9    jmp         @HandleFinally
>006844AE    jmp         006844A0
 006844B0    mov         eax,ebx
 006844B2    pop         esi
 006844B3    pop         ebx
 006844B4    pop         ecx
 006844B5    pop         ebp
 006844B6    ret
*}
end;

//006844B8
{*procedure THashTable.Get(Value:Integer; ?:?);
begin
 006844B8    push        ebx
 006844B9    push        esi
 006844BA    push        edi
 006844BB    push        ecx
 006844BC    mov         edi,ecx
 006844BE    mov         dword ptr [esp],edx
 006844C1    mov         ebx,eax
 006844C3    mov         edx,dword ptr [esp]
 006844C6    mov         eax,dword ptr [ebx+4];THashTable...............................................L:THashed...
 006844C9    mov         ecx,dword ptr [eax]
 006844CB    call        dword ptr [ecx+5C];TStrings.IndexOfObject
 006844CE    mov         esi,eax
 006844D0    test        esi,esi
>006844D2    jge         006844DD
 006844D4    mov         eax,edi
 006844D6    call        @UStrClr
>006844DB    jmp         006844E9
 006844DD    mov         ecx,edi
 006844DF    mov         edx,esi
 006844E1    mov         eax,dword ptr [ebx+4];THashTable................................................L:THashe...
 006844E4    mov         ebx,dword ptr [eax]
 006844E6    call        dword ptr [ebx+0C];TStringList.Get
 006844E9    pop         edx
 006844EA    pop         edi
 006844EB    pop         esi
 006844EC    pop         ebx
 006844ED    ret
end;*}

//006844F0
function THashTable.GetOrAdd(identifier:string):Integer;
begin
{*
 006844F0    push        ebp
 006844F1    mov         ebp,esp
 006844F3    push        ecx
 006844F4    push        ebx
 006844F5    push        esi
 006844F6    mov         dword ptr [ebp-4],edx
 006844F9    mov         ebx,eax
 006844FB    mov         eax,dword ptr [ebp-4]
 006844FE    call        @UStrAddRef
 00684503    xor         eax,eax
 00684505    push        ebp
 00684506    push        684572
 0068450B    push        dword ptr fs:[eax]
 0068450E    mov         dword ptr fs:[eax],esp
 00684511    mov         edx,dword ptr [ebp-4]
 00684514    mov         eax,dword ptr [ebx+4];THashTable.................................................L:THash...
 00684517    mov         ecx,dword ptr [eax]
 00684519    call        dword ptr [ecx+54];THashedStringList.IndexOf
 0068451C    mov         esi,eax
 0068451E    test        esi,esi
>00684520    jge         00684550
 00684522    mov         edx,dword ptr [ebp-4]
 00684525    mov         eax,ebx
 00684527    call        THashTable.Add
 0068452C    mov         edx,dword ptr [ebp-4]
 0068452F    mov         eax,dword ptr [ebx+4];THashTable..................................................L:THas...
 00684532    mov         ecx,dword ptr [eax]
 00684534    call        dword ptr [ecx+54];THashedStringList.IndexOf
 00684537    mov         esi,eax
 00684539    test        esi,esi
>0068453B    jge         00684542
 0068453D    or          ebx,0FFFFFFFF
>00684540    jmp         0068455C
 00684542    mov         edx,esi
 00684544    mov         eax,dword ptr [ebx+4];THashTable...................................................L:THa...
 00684547    mov         ecx,dword ptr [eax]
 00684549    call        dword ptr [ecx+18];TStringList.GetObject
 0068454C    mov         ebx,eax
>0068454E    jmp         0068455C
 00684550    mov         edx,esi
 00684552    mov         eax,dword ptr [ebx+4];THashTable....................................................L:TH...
 00684555    mov         ecx,dword ptr [eax]
 00684557    call        dword ptr [ecx+18];TStringList.GetObject
 0068455A    mov         ebx,eax
 0068455C    xor         eax,eax
 0068455E    pop         edx
 0068455F    pop         ecx
 00684560    pop         ecx
 00684561    mov         dword ptr fs:[eax],edx
 00684564    push        684579
 00684569    lea         eax,[ebp-4]
 0068456C    call        @UStrClr
 00684571    ret
>00684572    jmp         @HandleFinally
>00684577    jmp         00684569
 00684579    mov         eax,ebx
 0068457B    pop         esi
 0068457C    pop         ebx
 0068457D    pop         ecx
 0068457E    pop         ebp
 0068457F    ret
*}
end;

//00684580
constructor TConstant.Create(literal:string);
begin
{*
 00684580    push        ebp
 00684581    mov         ebp,esp
 00684583    push        0
 00684585    push        0
 00684587    push        0
 00684589    push        ebx
 0068458A    push        esi
 0068458B    test        dl,dl
>0068458D    je          00684597
 0068458F    add         esp,0FFFFFFF0
 00684592    call        @ClassCreate
 00684597    mov         dword ptr [ebp-4],ecx
 0068459A    mov         ebx,edx
 0068459C    mov         esi,eax
 0068459E    mov         eax,dword ptr [ebp-4]
 006845A1    call        @UStrAddRef
 006845A6    xor         eax,eax
 006845A8    push        ebp
 006845A9    push        684637
 006845AE    push        dword ptr fs:[eax]
 006845B1    mov         dword ptr fs:[eax],esp
 006845B4    lea         eax,[esi+38];TConstant.s:string
 006845B7    call        @UStrClr
 006845BC    lea         edx,[ebp-8]
 006845BF    mov         eax,dword ptr [ebp-4]
 006845C2    call        LowerCase
 006845C7    mov         eax,dword ptr [ebp-8]
 006845CA    mov         edx,684668;'infinity'
 006845CF    call        @UStrEqual
>006845D4    jne         006845E4
 006845D6    xor         eax,eax
 006845D8    mov         dword ptr [esi+18],eax;TConstant.Value:Double
 006845DB    mov         dword ptr [esi+1C],7FF00000;TConstant.?f1C:dword
>006845E2    jmp         00684618
 006845E4    lea         edx,[ebp-0C]
 006845E7    mov         eax,dword ptr [ebp-4]
 006845EA    call        LowerCase
 006845EF    mov         eax,dword ptr [ebp-0C]
 006845F2    mov         edx,684688;'nan'
 006845F7    call        @UStrEqual
>006845FC    jne         0068460C
 006845FE    xor         eax,eax
 00684600    mov         dword ptr [esi+18],eax;TConstant.Value:Double
 00684603    mov         dword ptr [esi+1C],0FFF80000;TConstant.?f1C:dword
>0068460A    jmp         00684618
 0068460C    mov         eax,dword ptr [ebp-4]
 0068460F    call        004F8D38
 00684614    fstp        qword ptr [esi+18];TConstant.Value:Double
 00684617    wait
 00684618    mov         byte ptr [esi+3C],0;TConstant.DataType:TDataType
 0068461C    xor         eax,eax
 0068461E    pop         edx
 0068461F    pop         ecx
 00684620    pop         ecx
 00684621    mov         dword ptr fs:[eax],edx
 00684624    push        68463E
 00684629    lea         eax,[ebp-0C]
 0068462C    mov         edx,3
 00684631    call        @UStrArrayClr
 00684636    ret
>00684637    jmp         @HandleFinally
>0068463C    jmp         00684629
 0068463E    mov         eax,esi
 00684640    test        bl,bl
>00684642    je          00684653
 00684644    call        @AfterConstruction
 00684649    pop         dword ptr fs:[0]
 00684650    add         esp,0C
 00684653    mov         eax,esi
 00684655    pop         esi
 00684656    pop         ebx
 00684657    mov         esp,ebp
 00684659    pop         ebp
 0068465A    ret
*}
end;

//00684690
constructor TConstant.Create(literal:string);
begin
{*
 00684690    push        ebp
 00684691    mov         ebp,esp
 00684693    add         esp,0FFFFFFF8
 00684696    push        ebx
 00684697    push        esi
 00684698    test        dl,dl
>0068469A    je          006846A4
 0068469C    add         esp,0FFFFFFF0
 0068469F    call        @ClassCreate
 006846A4    mov         dword ptr [ebp-4],ecx
 006846A7    mov         ebx,edx
 006846A9    mov         esi,eax
 006846AB    mov         eax,dword ptr [ebp-4]
 006846AE    call        @UStrAddRef
 006846B3    xor         eax,eax
 006846B5    push        ebp
 006846B6    push        6846F5
 006846BB    push        dword ptr fs:[eax]
 006846BE    mov         dword ptr fs:[eax],esp
 006846C1    lea         eax,[esi+38];TConstant.s:string
 006846C4    call        @UStrClr
 006846C9    mov         eax,dword ptr [ebp-4]
 006846CC    call        StrToInt
 006846D1    mov         dword ptr [ebp-8],eax
 006846D4    fild        dword ptr [ebp-8]
 006846D7    fstp        qword ptr [esi+18];TConstant.Value:Double
 006846DA    wait
 006846DB    mov         byte ptr [esi+3C],2;TConstant.DataType:TDataType
 006846DF    xor         eax,eax
 006846E1    pop         edx
 006846E2    pop         ecx
 006846E3    pop         ecx
 006846E4    mov         dword ptr fs:[eax],edx
 006846E7    push        6846FC
 006846EC    lea         eax,[ebp-4]
 006846EF    call        @UStrClr
 006846F4    ret
>006846F5    jmp         @HandleFinally
>006846FA    jmp         006846EC
 006846FC    mov         eax,esi
 006846FE    test        bl,bl
>00684700    je          00684711
 00684702    call        @AfterConstruction
 00684707    pop         dword ptr fs:[0]
 0068470E    add         esp,0C
 00684711    mov         eax,esi
 00684713    pop         esi
 00684714    pop         ebx
 00684715    pop         ecx
 00684716    pop         ecx
 00684717    pop         ebp
 00684718    ret
*}
end;

//0068471C
constructor TConstant.Create(literal:string);
begin
{*
 0068471C    push        ebp
 0068471D    mov         ebp,esp
 0068471F    add         esp,0FFFFFFF8
 00684722    push        ebx
 00684723    push        esi
 00684724    test        dl,dl
>00684726    je          00684730
 00684728    add         esp,0FFFFFFF0
 0068472B    call        @ClassCreate
 00684730    mov         dword ptr [ebp-4],ecx
 00684733    mov         ebx,edx
 00684735    mov         esi,eax
 00684737    mov         eax,dword ptr [ebp-4]
 0068473A    call        @UStrAddRef
 0068473F    xor         eax,eax
 00684741    push        ebp
 00684742    push        684792
 00684747    push        dword ptr fs:[eax]
 0068474A    mov         dword ptr fs:[eax],esp
 0068474D    lea         eax,[esi+38];TConstant.s:string
 00684750    call        @UStrClr
 00684755    mov         eax,dword ptr [ebp-4]
 00684758    call        StrToInt
 0068475D    mov         dword ptr [ebp-8],eax
 00684760    fild        dword ptr [ebp-8]
 00684763    add         esp,0FFFFFFF8
 00684766    fstp        qword ptr [esp]
 00684769    wait
 0068476A    call        00686060
 0068476F    call        00686074
 00684774    fstp        qword ptr [esi+18];TConstant.Value:Double
 00684777    wait
 00684778    mov         byte ptr [esi+3C],3;TConstant.DataType:TDataType
 0068477C    xor         eax,eax
 0068477E    pop         edx
 0068477F    pop         ecx
 00684780    pop         ecx
 00684781    mov         dword ptr fs:[eax],edx
 00684784    push        684799
 00684789    lea         eax,[ebp-4]
 0068478C    call        @UStrClr
 00684791    ret
>00684792    jmp         @HandleFinally
>00684797    jmp         00684789
 00684799    mov         eax,esi
 0068479B    test        bl,bl
>0068479D    je          006847AE
 0068479F    call        @AfterConstruction
 006847A4    pop         dword ptr fs:[0]
 006847AB    add         esp,0C
 006847AE    mov         eax,esi
 006847B0    pop         esi
 006847B1    pop         ebx
 006847B2    pop         ecx
 006847B3    pop         ecx
 006847B4    pop         ebp
 006847B5    ret
*}
end;

//006847B8
constructor TConstant.Create(literal:string);
begin
{*
 006847B8    push        ebp
 006847B9    mov         ebp,esp
 006847BB    push        ecx
 006847BC    push        ebx
 006847BD    push        esi
 006847BE    test        dl,dl
>006847C0    je          006847CA
 006847C2    add         esp,0FFFFFFF0
 006847C5    call        @ClassCreate
 006847CA    mov         dword ptr [ebp-4],ecx
 006847CD    mov         ebx,edx
 006847CF    mov         esi,eax
 006847D1    mov         eax,dword ptr [ebp-4]
 006847D4    call        @UStrAddRef
 006847D9    xor         eax,eax
 006847DB    push        ebp
 006847DC    push        684814
 006847E1    push        dword ptr fs:[eax]
 006847E4    mov         dword ptr fs:[eax],esp
 006847E7    lea         eax,[esi+38];TConstant.s:string
 006847EA    mov         edx,dword ptr [ebp-4]
 006847ED    call        @UStrAsg
 006847F2    xor         eax,eax
 006847F4    mov         dword ptr [esi+18],eax;TConstant.Value:Double
 006847F7    mov         dword ptr [esi+1C],eax;TConstant.?f1C:dword
 006847FA    mov         byte ptr [esi+3C],4;TConstant.DataType:TDataType
 006847FE    xor         eax,eax
 00684800    pop         edx
 00684801    pop         ecx
 00684802    pop         ecx
 00684803    mov         dword ptr fs:[eax],edx
 00684806    push        68481B
 0068480B    lea         eax,[ebp-4]
 0068480E    call        @UStrClr
 00684813    ret
>00684814    jmp         @HandleFinally
>00684819    jmp         0068480B
 0068481B    mov         eax,esi
 0068481D    test        bl,bl
>0068481F    je          00684830
 00684821    call        @AfterConstruction
 00684826    pop         dword ptr fs:[0]
 0068482D    add         esp,0C
 00684830    mov         eax,esi
 00684832    pop         esi
 00684833    pop         ebx
 00684834    pop         ecx
 00684835    pop         ebp
 00684836    ret
*}
end;

//00684838
function TConstant.GetDataType:TDataType;
begin
{*
 00684838    movzx       eax,byte ptr [eax+3C];TConstant.DataType:TDataType
 0068483C    ret
*}
end;

//00684840
procedure TConstant.GetPreviousValue;
begin
{*
 00684840    add         esp,0FFFFFFF8
 00684843    mov         edx,dword ptr [eax+18];TConstant.Value:Double
 00684846    mov         dword ptr [esp],edx
 00684849    mov         edx,dword ptr [eax+1C];TConstant.?f1C:dword
 0068484C    mov         dword ptr [esp+4],edx
 00684850    fld         qword ptr [esp]
 00684853    pop         ecx
 00684854    pop         edx
 00684855    ret
*}
end;

//00684858
{*procedure TConstant.GetString(?:?);
begin
 00684858    push        ebx
 00684859    push        esi
 0068485A    mov         esi,edx
 0068485C    mov         ebx,eax
 0068485E    mov         eax,ebx
 00684860    mov         edx,dword ptr [eax]
 00684862    call        dword ptr [edx+44];TConstant.GetDataType
 00684865    cmp         al,4
>00684867    jne         00684876
 00684869    mov         eax,esi
 0068486B    mov         edx,dword ptr [ebx+38];TConstant.s:string
 0068486E    call        @UStrAsg
 00684873    pop         esi
 00684874    pop         ebx
 00684875    ret
 00684876    mov         edx,esi
 00684878    mov         eax,ebx
 0068487A    call        TExpression.GetString
 0068487F    pop         esi
 00684880    pop         ebx
 00684881    ret
end;*}

//00684884
procedure TConstant.GetValue;
begin
{*
 00684884    add         esp,0FFFFFFF8
 00684887    mov         edx,dword ptr [eax+18];TConstant.Value:Double
 0068488A    mov         dword ptr [esp],edx
 0068488D    mov         edx,dword ptr [eax+1C];TConstant.?f1C:dword
 00684890    mov         dword ptr [esp+4],edx
 00684894    fld         qword ptr [esp]
 00684897    pop         ecx
 00684898    pop         edx
 00684899    ret
*}
end;

//0068489C
{*procedure TConstant.ToString(?:?);
begin
 0068489C    push        ebx
 0068489D    push        esi
 0068489E    mov         esi,edx
 006848A0    mov         ebx,eax
 006848A2    mov         edx,esi
 006848A4    mov         eax,ebx
 006848A6    mov         ecx,dword ptr [eax]
 006848A8    call        dword ptr [ecx+38];TConstant.GetString
 006848AB    mov         eax,ebx
 006848AD    mov         edx,dword ptr [eax]
 006848AF    call        dword ptr [edx+44];TConstant.GetDataType
 006848B2    cmp         al,4
>006848B4    jne         006848CE
 006848B6    push        6848E0;'"'
 006848BB    push        dword ptr [esi]
 006848BD    push        6848E0;'"'
 006848C2    mov         eax,esi
 006848C4    mov         edx,3
 006848C9    call        @UStrCatN
 006848CE    pop         esi
 006848CF    pop         ebx
 006848D0    ret
end;*}

//006848E4
procedure TConstant.CreateClone;
begin
{*
 006848E4    mov         dl,1
 006848E6    mov         eax,[006808C0];TConstant
 006848EB    call        TObject.Create;TConstant.Create
 006848F0    ret
*}
end;

//006848F4
{*constructor TConstant.Create(value:Double; ?:?);
begin
 006848F4    push        ebp
 006848F5    mov         ebp,esp
 006848F7    push        ebx
 006848F8    push        esi
 006848F9    test        dl,dl
>006848FB    je          00684905
 006848FD    add         esp,0FFFFFFF0
 00684900    call        @ClassCreate
 00684905    mov         ebx,edx
 00684907    mov         esi,eax
 00684909    lea         eax,[esi+38];TConstant.s:string
 0068490C    call        @UStrClr
 00684911    mov         eax,dword ptr [ebp+8]
 00684914    mov         dword ptr [esi+18],eax;TConstant.Value:Double
 00684917    mov         eax,dword ptr [ebp+0C]
 0068491A    mov         dword ptr [esi+1C],eax;TConstant.?f1C:dword
 0068491D    mov         byte ptr [esi+3C],2;TConstant.DataType:TDataType
 00684921    mov         eax,esi
 00684923    test        bl,bl
>00684925    je          00684936
 00684927    call        @AfterConstruction
 0068492C    pop         dword ptr fs:[0]
 00684933    add         esp,0C
 00684936    mov         eax,esi
 00684938    pop         esi
 00684939    pop         ebx
 0068493A    pop         ebp
 0068493B    ret         8
end;*}

//00684940
procedure TConstant.FillClone(c:TExpression);
begin
{*
 00684940    push        ebx
 00684941    push        esi
 00684942    push        edi
 00684943    mov         esi,edx
 00684945    mov         ebx,eax
 00684947    mov         edx,esi
 00684949    mov         eax,ebx
 0068494B    call        TExpression.FillClone
 00684950    mov         edi,esi
 00684952    mov         eax,dword ptr [ebx+18];TConstant.Value:Double
 00684955    mov         dword ptr [edi+18],eax
 00684958    mov         eax,dword ptr [ebx+1C];TConstant.?f1C:dword
 0068495B    mov         dword ptr [edi+1C],eax
 0068495E    lea         eax,[edi+38]
 00684961    mov         edx,dword ptr [ebx+38];TConstant.s:string
 00684964    call        @UStrAsg
 00684969    movzx       eax,byte ptr [ebx+3C];TConstant.DataType:TDataType
 0068496D    mov         byte ptr [edi+3C],al
 00684970    mov         eax,dword ptr [ebx+20];TConstant.x:Double
 00684973    mov         dword ptr [edi+20],eax
 00684976    mov         eax,dword ptr [ebx+24];TConstant.?f24:dword
 00684979    mov         dword ptr [edi+24],eax
 0068497C    mov         eax,dword ptr [ebx+28];TConstant.y:Double
 0068497F    mov         dword ptr [edi+28],eax
 00684982    mov         eax,dword ptr [ebx+2C];TConstant.?f2C:dword
 00684985    mov         dword ptr [edi+2C],eax
 00684988    mov         eax,dword ptr [ebx+30];TConstant.z:Double
 0068498B    mov         dword ptr [edi+30],eax
 0068498E    mov         eax,dword ptr [ebx+34];TConstant.?f34:dword
 00684991    mov         dword ptr [edi+34],eax
 00684994    pop         edi
 00684995    pop         esi
 00684996    pop         ebx
 00684997    ret
*}
end;

//00684998
procedure TConstant.GetVector(x:Double; y:Double; z:Double);
begin
{*
 00684998    push        ebp
 00684999    mov         ebp,esp
 0068499B    push        ebx
 0068499C    push        esi
 0068499D    push        edi
 0068499E    mov         edi,ecx
 006849A0    mov         esi,edx
 006849A2    mov         ebx,eax
 006849A4    mov         eax,ebx
 006849A6    mov         edx,dword ptr [eax]
 006849A8    call        dword ptr [edx+44];TConstant.GetDataType
 006849AB    cmp         al,5
>006849AD    jne         006849D5
 006849AF    mov         eax,dword ptr [ebx+20];TConstant.x:Double
 006849B2    mov         dword ptr [esi],eax
 006849B4    mov         eax,dword ptr [ebx+24];TConstant.?f24:dword
 006849B7    mov         dword ptr [esi+4],eax
 006849BA    mov         eax,dword ptr [ebx+28];TConstant.y:Double
 006849BD    mov         dword ptr [edi],eax
 006849BF    mov         eax,dword ptr [ebx+2C];TConstant.?f2C:dword
 006849C2    mov         dword ptr [edi+4],eax
 006849C5    mov         eax,dword ptr [ebp+8]
 006849C8    mov         edx,dword ptr [ebx+30];TConstant.z:Double
 006849CB    mov         dword ptr [eax],edx
 006849CD    mov         edx,dword ptr [ebx+34];TConstant.?f34:dword
 006849D0    mov         dword ptr [eax+4],edx
>006849D3    jmp         006849E4
 006849D5    mov         eax,dword ptr [ebp+8]
 006849D8    push        eax
 006849D9    mov         ecx,edi
 006849DB    mov         edx,esi
 006849DD    mov         eax,ebx
 006849DF    call        TExpression.GetVector
 006849E4    pop         edi
 006849E5    pop         esi
 006849E6    pop         ebx
 006849E7    pop         ebp
 006849E8    ret         4
*}
end;

//006849EC
{*constructor TConstant.Create(value:Double; ?:?);
begin
 006849EC    push        ebp
 006849ED    mov         ebp,esp
 006849EF    push        ebx
 006849F0    push        esi
 006849F1    test        dl,dl
>006849F3    je          006849FD
 006849F5    add         esp,0FFFFFFF0
 006849F8    call        @ClassCreate
 006849FD    mov         ebx,edx
 006849FF    mov         esi,eax
 00684A01    lea         eax,[esi+38];TConstant.s:string
 00684A04    call        @UStrClr
 00684A09    mov         eax,dword ptr [ebp+8]
 00684A0C    mov         dword ptr [esi+18],eax;TConstant.Value:Double
 00684A0F    mov         eax,dword ptr [ebp+0C]
 00684A12    mov         dword ptr [esi+1C],eax;TConstant.?f1C:dword
 00684A15    mov         byte ptr [esi+3C],0;TConstant.DataType:TDataType
 00684A19    mov         eax,esi
 00684A1B    test        bl,bl
>00684A1D    je          00684A2E
 00684A1F    call        @AfterConstruction
 00684A24    pop         dword ptr fs:[0]
 00684A2B    add         esp,0C
 00684A2E    mov         eax,esi
 00684A30    pop         esi
 00684A31    pop         ebx
 00684A32    pop         ebp
 00684A33    ret         8
end;*}

//00684A38
function TExpression.CanSet:Boolean;
begin
{*
 00684A38    xor         eax,eax
 00684A3A    ret
*}
end;

//00684A3C
function TExpression.Clone:TExpression;
begin
{*
 00684A3C    push        ebx
 00684A3D    push        esi
 00684A3E    mov         ebx,eax
 00684A40    mov         eax,ebx
 00684A42    mov         edx,dword ptr [eax]
 00684A44    call        dword ptr [edx+80];TExpression.CreateClone
 00684A4A    mov         esi,eax
 00684A4C    mov         edx,esi
 00684A4E    mov         eax,ebx
 00684A50    mov         ecx,dword ptr [eax]
 00684A52    call        dword ptr [ecx+84];TExpression.FillClone
 00684A58    mov         eax,esi
 00684A5A    pop         esi
 00684A5B    pop         ebx
 00684A5C    ret
*}
end;

//00684A60
procedure TExpression.Evaluate;
begin
{*
 00684A60    push        ebx
 00684A61    push        esi
 00684A62    add         esp,0FFFFFFE0
 00684A65    mov         ebx,eax
 00684A67    mov         eax,ebx
 00684A69    mov         edx,dword ptr [eax]
 00684A6B    call        dword ptr [edx+44];TExpression.GetDataType
 00684A6E    cmp         al,5
>00684A70    jne         00684AB6
 00684A72    lea         eax,[esp+18]
 00684A76    push        eax
 00684A77    lea         ecx,[esp+14]
 00684A7B    lea         edx,[esp+0C]
 00684A7F    mov         eax,ebx
 00684A81    mov         esi,dword ptr [eax]
 00684A83    call        dword ptr [esi+3C];TExpression.GetVector
 00684A86    push        dword ptr [esp+0C]
 00684A8A    push        dword ptr [esp+0C]
 00684A8E    push        dword ptr [esp+1C]
 00684A92    push        dword ptr [esp+1C]
 00684A96    push        dword ptr [esp+2C]
 00684A9A    push        dword ptr [esp+2C]
 00684A9E    call        005C4070
 00684AA3    fstp        qword ptr [ebx+8];TExpression.PreviousValue:Double
 00684AA6    wait
 00684AA7    mov         eax,dword ptr [ebx+8];TExpression.PreviousValue:Double
 00684AAA    mov         dword ptr [esp],eax
 00684AAD    mov         eax,dword ptr [ebx+0C];TExpression.?fC:dword
 00684AB0    mov         dword ptr [esp+4],eax
>00684AB4    jmp         00684B12
 00684AB6    mov         eax,ebx
 00684AB8    mov         edx,dword ptr [eax]
 00684ABA    call        dword ptr [edx+44];TExpression.GetDataType
 00684ABD    cmp         al,7
>00684ABF    jne         00684AFA
 00684AC1    lea         eax,[esp+18]
 00684AC5    push        eax
 00684AC6    lea         ecx,[esp+14]
 00684ACA    lea         edx,[esp+0C]
 00684ACE    mov         eax,ebx
 00684AD0    mov         esi,dword ptr [eax]
 00684AD2    call        dword ptr [esi+3C];TExpression.GetVector
 00684AD5    fld         qword ptr [esp+8]
 00684AD9    fadd        qword ptr [esp+10]
 00684ADD    fadd        qword ptr [esp+18]
 00684AE1    fdiv        dword ptr ds:[684B1C];3:Single
 00684AE7    fstp        qword ptr [ebx+8];TExpression.PreviousValue:Double
 00684AEA    wait
 00684AEB    mov         eax,dword ptr [ebx+8];TExpression.PreviousValue:Double
 00684AEE    mov         dword ptr [esp],eax
 00684AF1    mov         eax,dword ptr [ebx+0C];TExpression.?fC:dword
 00684AF4    mov         dword ptr [esp+4],eax
>00684AF8    jmp         00684B12
 00684AFA    mov         eax,ebx
 00684AFC    mov         edx,dword ptr [eax]
 00684AFE    call        dword ptr [edx+2C];TExpression.GetValue
 00684B01    fstp        qword ptr [ebx+8];TExpression.PreviousValue:Double
 00684B04    wait
 00684B05    mov         eax,dword ptr [ebx+8];TExpression.PreviousValue:Double
 00684B08    mov         dword ptr [esp],eax
 00684B0B    mov         eax,dword ptr [ebx+0C];TExpression.?fC:dword
 00684B0E    mov         dword ptr [esp+4],eax
 00684B12    fld         qword ptr [esp]
 00684B15    add         esp,20
 00684B18    pop         esi
 00684B19    pop         ebx
 00684B1A    ret
*}
end;

//00684B20
function TExpression.EvaluateBoolean:Boolean;
begin
{*
 00684B20    push        ebx
 00684B21    push        esi
 00684B22    mov         esi,eax
 00684B24    mov         eax,esi
 00684B26    mov         edx,dword ptr [eax]
 00684B28    call        dword ptr [edx+30];TExpression.GetBoolean
 00684B2B    mov         ebx,eax
 00684B2D    mov         eax,ebx
 00684B2F    call        00686074
 00684B34    fstp        qword ptr [esi+8];TExpression.PreviousValue:Double
 00684B37    wait
 00684B38    mov         eax,ebx
 00684B3A    pop         esi
 00684B3B    pop         ebx
 00684B3C    ret
*}
end;

//00684B40
procedure TExpression.EvaluateColour(x:Double; y:Double; z:Double);
begin
{*
 00684B40    push        ebp
 00684B41    mov         ebp,esp
 00684B43    push        ecx
 00684B44    push        ebx
 00684B45    push        esi
 00684B46    push        edi
 00684B47    mov         edi,ecx
 00684B49    mov         esi,edx
 00684B4B    mov         ebx,eax
 00684B4D    mov         eax,ebx
 00684B4F    mov         edx,dword ptr [eax]
 00684B51    call        dword ptr [edx+44];TExpression.GetDataType
 00684B54    sub         al,2
>00684B56    je          00684B98
 00684B58    add         al,0FD
 00684B5A    sub         al,2
>00684B5C    jb          00684B65
>00684B5E    je          00684B79
>00684B60    jmp         00684BEC
 00684B65    mov         eax,dword ptr [ebp+8]
 00684B68    push        eax
 00684B69    mov         ecx,edi
 00684B6B    mov         edx,esi
 00684B6D    mov         eax,ebx
 00684B6F    mov         ebx,dword ptr [eax]
 00684B71    call        dword ptr [ebx+20];TExpression.EvaluateVector
>00684B74    jmp         00684C0C
 00684B79    mov         eax,dword ptr [ebp+8]
 00684B7C    push        eax
 00684B7D    mov         ecx,edi
 00684B7F    mov         edx,esi
 00684B81    mov         eax,ebx
 00684B83    mov         esi,dword ptr [eax]
 00684B85    call        dword ptr [esi+3C];TExpression.GetVector
 00684B88    mov         eax,dword ptr [ebp+8]
 00684B8B    mov         edx,dword ptr [eax]
 00684B8D    mov         dword ptr [ebx+8],edx;TExpression.PreviousValue:Double
 00684B90    mov         edx,dword ptr [eax+4]
 00684B93    mov         dword ptr [ebx+0C],edx;TExpression.?fC:dword
>00684B96    jmp         00684C0C
 00684B98    mov         eax,ebx
 00684B9A    mov         edx,dword ptr [eax]
 00684B9C    call        dword ptr [edx+8];TExpression.EvaluateInteger
 00684B9F    mov         edx,eax
 00684BA1    and         edx,0FF0000
 00684BA7    shr         edx,10
 00684BAA    mov         dword ptr [ebp-4],edx
 00684BAD    fild        dword ptr [ebp-4]
 00684BB0    fdiv        dword ptr ds:[684C14];255:Single
 00684BB6    fstp        qword ptr [esi]
 00684BB8    wait
 00684BB9    mov         edx,eax
 00684BBB    and         edx,0FF00
 00684BC1    shr         edx,8
 00684BC4    mov         dword ptr [ebp-4],edx
 00684BC7    fild        dword ptr [ebp-4]
 00684BCA    fdiv        dword ptr ds:[684C14];255:Single
 00684BD0    fstp        qword ptr [edi]
 00684BD2    wait
 00684BD3    and         eax,0FF
 00684BD8    mov         dword ptr [ebp-4],eax
 00684BDB    fild        dword ptr [ebp-4]
 00684BDE    fdiv        dword ptr ds:[684C14];255:Single
 00684BE4    mov         eax,dword ptr [ebp+8]
 00684BE7    fstp        qword ptr [eax]
 00684BE9    wait
>00684BEA    jmp         00684C0C
 00684BEC    mov         eax,ebx
 00684BEE    mov         edx,dword ptr [eax]
 00684BF0    call        dword ptr [edx];TExpression.Evaluate
 00684BF2    fstp        qword ptr [esi]
 00684BF4    wait
 00684BF5    mov         eax,dword ptr [esi]
 00684BF7    mov         dword ptr [edi],eax
 00684BF9    mov         eax,dword ptr [esi+4]
 00684BFC    mov         dword ptr [edi+4],eax
 00684BFF    mov         eax,dword ptr [ebp+8]
 00684C02    mov         edx,dword ptr [esi]
 00684C04    mov         dword ptr [eax],edx
 00684C06    mov         edx,dword ptr [esi+4]
 00684C09    mov         dword ptr [eax+4],edx
 00684C0C    pop         edi
 00684C0D    pop         esi
 00684C0E    pop         ebx
 00684C0F    pop         ecx
 00684C10    pop         ebp
 00684C11    ret         4
*}
end;

//00684C18
procedure TExpression.EvaluateInteger;
begin
{*
 00684C18    push        ebx
 00684C19    push        ecx
 00684C1A    mov         ebx,eax
 00684C1C    mov         eax,ebx
 00684C1E    mov         edx,dword ptr [eax]
 00684C20    call        dword ptr [edx+34];TExpression.GetInteger
 00684C23    mov         dword ptr [esp],eax
 00684C26    fild        dword ptr [esp]
 00684C29    fstp        qword ptr [ebx+8];TExpression.PreviousValue:Double
 00684C2C    wait
 00684C2D    pop         edx
 00684C2E    pop         ebx
 00684C2F    ret
*}
end;

//00684C30
{*procedure TExpression.EvaluateString(?:?);
begin
 00684C30    push        ebx
 00684C31    push        esi
 00684C32    mov         esi,edx
 00684C34    mov         ebx,eax
 00684C36    mov         edx,esi
 00684C38    mov         eax,ebx
 00684C3A    mov         ecx,dword ptr [eax]
 00684C3C    call        dword ptr [ecx+38];TExpression.GetString
 00684C3F    xor         eax,eax
 00684C41    mov         dword ptr [ebx+8],eax;TExpression.PreviousValue:Double
 00684C44    mov         dword ptr [ebx+0C],eax;TExpression.?fC:dword
 00684C47    pop         esi
 00684C48    pop         ebx
 00684C49    ret
end;*}

//00684C4C
procedure TExpression.EvaluateToMatch(expression:TExpression);
begin
{*
 00684C4C    push        ebx
 00684C4D    push        esi
 00684C4E    add         esp,0FFFFFFE4
 00684C51    mov         esi,edx
 00684C53    mov         ebx,eax
 00684C55    mov         eax,ebx
 00684C57    mov         edx,dword ptr [eax]
 00684C59    call        dword ptr [edx];TExpression.Evaluate
 00684C5B    fstp        qword ptr [esp+8]
 00684C5F    wait
 00684C60    mov         eax,esi
 00684C62    call        TExpression.HasUnits
 00684C67    test        al,al
>00684C69    je          00684C76
 00684C6B    mov         eax,ebx
 00684C6D    call        TExpression.HasUnits
 00684C72    test        al,al
>00684C74    jne         00684C87
 00684C76    mov         eax,dword ptr [esp+8]
 00684C7A    mov         dword ptr [esp],eax
 00684C7D    mov         eax,dword ptr [esp+0C]
 00684C81    mov         dword ptr [esp+4],eax
>00684C85    jmp         00684CF3
 00684C87    mov         eax,esi
 00684C89    mov         edx,dword ptr [eax]
 00684C8B    call        dword ptr [edx+48];TExpression.GetUnits
 00684C8E    cmp         al,17
>00684C90    jne         00684CA4
 00684C92    mov         eax,ebx
 00684C94    mov         edx,dword ptr [eax]
 00684C96    call        dword ptr [edx+48];TExpression.GetUnits
 00684C99    add         al,0FD
 00684C9B    sub         al,6
>00684C9D    jb          00684CC1
 00684C9F    dec         eax
 00684CA0    sub         al,4
>00684CA2    jb          00684CC1
 00684CA4    mov         eax,ebx
 00684CA6    mov         edx,dword ptr [eax]
 00684CA8    call        dword ptr [edx+48];TExpression.GetUnits
 00684CAB    cmp         al,17
>00684CAD    jne         00684CD2
 00684CAF    mov         eax,esi
 00684CB1    mov         edx,dword ptr [eax]
 00684CB3    call        dword ptr [edx+48];TExpression.GetUnits
 00684CB6    add         al,0FD
 00684CB8    sub         al,6
>00684CBA    jb          00684CC1
 00684CBC    dec         eax
 00684CBD    sub         al,4
>00684CBF    jae         00684CD2
 00684CC1    mov         eax,dword ptr [esp+8]
 00684CC5    mov         dword ptr [esp],eax
 00684CC8    mov         eax,dword ptr [esp+0C]
 00684CCC    mov         dword ptr [esp+4],eax
>00684CD0    jmp         00684CF3
 00684CD2    mov         eax,ebx
 00684CD4    call        TExpression.UnitFactor
 00684CD9    fmul        qword ptr [esp+8]
 00684CDD    fstp        tbyte ptr [esp+10]
 00684CE1    wait
 00684CE2    mov         eax,esi
 00684CE4    call        TExpression.UnitFactor
 00684CE9    fld         tbyte ptr [esp+10]
 00684CED    fdivrp      st(1),st
 00684CEF    fstp        qword ptr [esp]
 00684CF2    wait
 00684CF3    fld         qword ptr [esp]
 00684CF6    add         esp,1C
 00684CF9    pop         esi
 00684CFA    pop         ebx
 00684CFB    ret
*}
end;

//00684CFC
procedure TExpression.EvaluateToMatchAdd(expression:TExpression);
begin
{*
 00684CFC    push        ebx
 00684CFD    push        esi
 00684CFE    add         esp,0FFFFFFE4
 00684D01    mov         esi,edx
 00684D03    mov         ebx,eax
 00684D05    mov         eax,ebx
 00684D07    mov         edx,dword ptr [eax]
 00684D09    call        dword ptr [edx];TExpression.Evaluate
 00684D0B    fstp        qword ptr [esp+8]
 00684D0F    wait
 00684D10    mov         eax,esi
 00684D12    call        TExpression.HasUnits
 00684D17    test        al,al
>00684D19    je          00684D26
 00684D1B    mov         eax,ebx
 00684D1D    call        TExpression.HasUnits
 00684D22    test        al,al
>00684D24    jne         00684D3A
 00684D26    mov         eax,dword ptr [esp+8]
 00684D2A    mov         dword ptr [esp],eax
 00684D2D    mov         eax,dword ptr [esp+0C]
 00684D31    mov         dword ptr [esp+4],eax
>00684D35    jmp         00684E01
 00684D3A    mov         eax,esi
 00684D3C    mov         edx,dword ptr [eax]
 00684D3E    call        dword ptr [edx+48];TExpression.GetUnits
 00684D41    cmp         al,17
>00684D43    jne         00684D57
 00684D45    mov         eax,ebx
 00684D47    mov         edx,dword ptr [eax]
 00684D49    call        dword ptr [edx+48];TExpression.GetUnits
 00684D4C    add         al,0FD
 00684D4E    sub         al,6
>00684D50    jb          00684D74
 00684D52    dec         eax
 00684D53    sub         al,4
>00684D55    jb          00684D74
 00684D57    mov         eax,ebx
 00684D59    mov         edx,dword ptr [eax]
 00684D5B    call        dword ptr [edx+48];TExpression.GetUnits
 00684D5E    cmp         al,17
>00684D60    jne         00684D85
 00684D62    mov         eax,esi
 00684D64    mov         edx,dword ptr [eax]
 00684D66    call        dword ptr [edx+48];TExpression.GetUnits
 00684D69    add         al,0FD
 00684D6B    sub         al,6
>00684D6D    jb          00684D74
 00684D6F    dec         eax
 00684D70    sub         al,4
>00684D72    jae         00684D85
 00684D74    mov         eax,dword ptr [esp+8]
 00684D78    mov         dword ptr [esp],eax
 00684D7B    mov         eax,dword ptr [esp+0C]
 00684D7F    mov         dword ptr [esp+4],eax
>00684D83    jmp         00684E01
 00684D85    mov         eax,esi
 00684D87    mov         edx,dword ptr [eax]
 00684D89    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00684D8C    test        al,al
>00684D8E    jne         00684D9D
 00684D90    mov         eax,ebx
 00684D92    mov         edx,dword ptr [eax]
 00684D94    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00684D97    add         al,0F1
 00684D99    sub         al,8
>00684D9B    jb          00684DB5
 00684D9D    mov         eax,esi
 00684D9F    mov         edx,dword ptr [eax]
 00684DA1    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00684DA4    test        al,al
>00684DA6    jne         00684DE0
 00684DA8    mov         eax,ebx
 00684DAA    mov         edx,dword ptr [eax]
 00684DAC    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00684DAF    add         al,0F1
 00684DB1    sub         al,8
>00684DB3    jae         00684DE0
 00684DB5    mov         eax,ebx
 00684DB7    call        TExpression.UnitFactor
 00684DBC    fld         qword ptr [esp+8]
 00684DC0    fmul        qword ptr ds:[78BDC8];gvar_0078BDC8:Double
 00684DC6    fmulp       st(1),st
 00684DC8    fstp        tbyte ptr [esp+10]
 00684DCC    wait
 00684DCD    mov         eax,esi
 00684DCF    call        TExpression.UnitFactor
 00684DD4    fld         tbyte ptr [esp+10]
 00684DD8    fdivrp      st(1),st
 00684DDA    fstp        qword ptr [esp]
 00684DDD    wait
>00684DDE    jmp         00684E01
 00684DE0    mov         eax,ebx
 00684DE2    call        TExpression.UnitFactor
 00684DE7    fmul        qword ptr [esp+8]
 00684DEB    fstp        tbyte ptr [esp+10]
 00684DEF    wait
 00684DF0    mov         eax,esi
 00684DF2    call        TExpression.UnitFactor
 00684DF7    fld         tbyte ptr [esp+10]
 00684DFB    fdivrp      st(1),st
 00684DFD    fstp        qword ptr [esp]
 00684E00    wait
 00684E01    fld         qword ptr [esp]
 00684E04    add         esp,1C
 00684E07    pop         esi
 00684E08    pop         ebx
 00684E09    ret
*}
end;

//00684E0C
procedure TExpression.EvaluateUnits(Units:TUnits; PerUnits1:TUnits; PerUnits2:TUnits);
begin
{*
 00684E0C    push        ebp
 00684E0D    mov         ebp,esp
 00684E0F    add         esp,0FFFFFFD8
 00684E12    push        ebx
 00684E13    push        esi
 00684E14    mov         byte ptr [ebp-1],cl
 00684E17    mov         ebx,edx
 00684E19    mov         esi,eax
 00684E1B    mov         eax,esi
 00684E1D    mov         edx,dword ptr [eax]
 00684E1F    call        dword ptr [edx];TExpression.Evaluate
 00684E21    fstp        qword ptr [ebp-18]
 00684E24    wait
 00684E25    test        bl,bl
>00684E27    jne         00684E39
 00684E29    cmp         byte ptr [ebp-1],0
>00684E2D    jne         00684E39
 00684E2F    cmp         byte ptr [ebp+8],0
>00684E33    je          00684ED6
 00684E39    mov         eax,esi
 00684E3B    mov         edx,dword ptr [eax]
 00684E3D    call        dword ptr [edx+48];TExpression.GetUnits
 00684E40    test        al,al
>00684E42    jne         00684E5A
 00684E44    mov         eax,esi
 00684E46    mov         edx,dword ptr [eax]
 00684E48    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00684E4B    test        al,al
>00684E4D    jne         00684E5A
 00684E4F    mov         eax,esi
 00684E51    mov         edx,dword ptr [eax]
 00684E53    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00684E56    test        al,al
>00684E58    je          00684ED6
 00684E5A    mov         eax,esi
 00684E5C    mov         edx,dword ptr [eax]
 00684E5E    call        dword ptr [edx+48];TExpression.GetUnits
 00684E61    call        00683EDC
 00684E66    fstp        qword ptr [ebp-20]
 00684E69    wait
 00684E6A    mov         eax,ebx
 00684E6C    call        00683EDC
 00684E71    fstp        qword ptr [ebp-28]
 00684E74    wait
 00684E75    fld         qword ptr [ebp-18]
 00684E78    fmul        qword ptr [ebp-20]
 00684E7B    fdiv        qword ptr [ebp-28]
 00684E7E    fstp        qword ptr [ebp-18]
 00684E81    wait
 00684E82    mov         eax,esi
 00684E84    mov         edx,dword ptr [eax]
 00684E86    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00684E89    call        00683EDC
 00684E8E    fstp        qword ptr [ebp-20]
 00684E91    wait
 00684E92    movzx       eax,byte ptr [ebp-1]
 00684E96    call        00683EDC
 00684E9B    fstp        qword ptr [ebp-28]
 00684E9E    wait
 00684E9F    fld         qword ptr [ebp-18]
 00684EA2    fdiv        qword ptr [ebp-20]
 00684EA5    fmul        qword ptr [ebp-28]
 00684EA8    fstp        qword ptr [ebp-18]
 00684EAB    wait
 00684EAC    mov         eax,esi
 00684EAE    mov         edx,dword ptr [eax]
 00684EB0    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00684EB3    call        00683EDC
 00684EB8    fstp        qword ptr [ebp-20]
 00684EBB    wait
 00684EBC    movzx       eax,byte ptr [ebp+8]
 00684EC0    call        00683EDC
 00684EC5    fstp        qword ptr [ebp-28]
 00684EC8    wait
 00684EC9    fld         qword ptr [ebp-18]
 00684ECC    fdiv        qword ptr [ebp-20]
 00684ECF    fmul        qword ptr [ebp-28]
 00684ED2    fstp        qword ptr [ebp-18]
 00684ED5    wait
 00684ED6    mov         eax,dword ptr [ebp-18]
 00684ED9    mov         dword ptr [ebp-10],eax
 00684EDC    mov         eax,dword ptr [ebp-14]
 00684EDF    mov         dword ptr [ebp-0C],eax
 00684EE2    fld         qword ptr [ebp-10]
 00684EE5    pop         esi
 00684EE6    pop         ebx
 00684EE7    mov         esp,ebp
 00684EE9    pop         ebp
 00684EEA    ret         4
*}
end;

//00684EF0
procedure TExpression.EvaluateVector(x:Double; y:Double; z:Double);
begin
{*
 00684EF0    push        ebp
 00684EF1    mov         ebp,esp
 00684EF3    push        ecx
 00684EF4    push        ebx
 00684EF5    push        esi
 00684EF6    push        edi
 00684EF7    mov         dword ptr [ebp-4],ecx
 00684EFA    mov         edi,edx
 00684EFC    mov         ebx,eax
 00684EFE    mov         esi,dword ptr [ebp+8]
 00684F01    mov         eax,ebx
 00684F03    mov         edx,dword ptr [eax]
 00684F05    call        dword ptr [edx+44];TExpression.GetDataType
 00684F08    cmp         al,7
>00684F0A    jne         00684F1B
 00684F0C    push        esi
 00684F0D    mov         ecx,dword ptr [ebp-4]
 00684F10    mov         edx,edi
 00684F12    mov         eax,ebx
 00684F14    mov         ebx,dword ptr [eax]
 00684F16    call        dword ptr [ebx+1C];TExpression.EvaluateColour
>00684F19    jmp         00684F33
 00684F1B    push        esi
 00684F1C    mov         ecx,dword ptr [ebp-4]
 00684F1F    mov         edx,edi
 00684F21    mov         eax,ebx
 00684F23    mov         edi,dword ptr [eax]
 00684F25    call        dword ptr [edi+3C];TExpression.GetVector
 00684F28    mov         eax,dword ptr [esi]
 00684F2A    mov         dword ptr [ebx+8],eax;TExpression.PreviousValue:Double
 00684F2D    mov         eax,dword ptr [esi+4]
 00684F30    mov         dword ptr [ebx+0C],eax;TExpression.?fC:dword
 00684F33    pop         edi
 00684F34    pop         esi
 00684F35    pop         ebx
 00684F36    pop         ecx
 00684F37    pop         ebp
 00684F38    ret         4
*}
end;

//00684F3C
procedure TExpression.EvaluateVectorToMatch(expression:TExpression; x:Double; z:Double; y:Double);
begin
{*
 00684F3C    push        ebp
 00684F3D    mov         ebp,esp
 00684F3F    add         esp,0FFFFFFF0
 00684F42    push        ebx
 00684F43    push        esi
 00684F44    push        edi
 00684F45    mov         dword ptr [ebp-4],ecx
 00684F48    mov         esi,edx
 00684F4A    mov         ebx,eax
 00684F4C    mov         eax,dword ptr [ebp+8]
 00684F4F    push        eax
 00684F50    mov         ecx,dword ptr [ebp+0C]
 00684F53    mov         edx,dword ptr [ebp-4]
 00684F56    mov         eax,ebx
 00684F58    mov         edi,dword ptr [eax]
 00684F5A    call        dword ptr [edi+20];TExpression.EvaluateVector
 00684F5D    mov         eax,ebx
 00684F5F    call        TExpression.HasUnits
 00684F64    test        al,al
>00684F66    je          00684FD9
 00684F68    mov         eax,esi
 00684F6A    call        TExpression.HasUnits
 00684F6F    test        al,al
>00684F71    je          00684FD9
 00684F73    mov         eax,ebx
 00684F75    call        TExpression.UnitFactor
 00684F7A    mov         eax,dword ptr [ebp-4]
 00684F7D    fmul        qword ptr [eax]
 00684F7F    fstp        tbyte ptr [ebp-10]
 00684F82    wait
 00684F83    mov         eax,esi
 00684F85    call        TExpression.UnitFactor
 00684F8A    fld         tbyte ptr [ebp-10]
 00684F8D    fdivrp      st(1),st
 00684F8F    mov         eax,dword ptr [ebp-4]
 00684F92    fstp        qword ptr [eax]
 00684F94    wait
 00684F95    mov         eax,ebx
 00684F97    call        TExpression.UnitFactor
 00684F9C    mov         eax,dword ptr [ebp+0C]
 00684F9F    fmul        qword ptr [eax]
 00684FA1    fstp        tbyte ptr [ebp-10]
 00684FA4    wait
 00684FA5    mov         eax,esi
 00684FA7    call        TExpression.UnitFactor
 00684FAC    fld         tbyte ptr [ebp-10]
 00684FAF    fdivrp      st(1),st
 00684FB1    mov         eax,dword ptr [ebp+0C]
 00684FB4    fstp        qword ptr [eax]
 00684FB6    wait
 00684FB7    mov         eax,ebx
 00684FB9    call        TExpression.UnitFactor
 00684FBE    mov         eax,dword ptr [ebp+8]
 00684FC1    fmul        qword ptr [eax]
 00684FC3    fstp        tbyte ptr [ebp-10]
 00684FC6    wait
 00684FC7    mov         eax,esi
 00684FC9    call        TExpression.UnitFactor
 00684FCE    fld         tbyte ptr [ebp-10]
 00684FD1    fdivrp      st(1),st
 00684FD3    mov         eax,dword ptr [ebp+8]
 00684FD6    fstp        qword ptr [eax]
 00684FD8    wait
 00684FD9    pop         edi
 00684FDA    pop         esi
 00684FDB    pop         ebx
 00684FDC    mov         esp,ebp
 00684FDE    pop         ebp
 00684FDF    ret         8
*}
end;

//00684FE4
procedure TExpression.EvaluateVectorToMatchAdd(expression:TExpression; x:Double; z:Double; y:Double);
begin
{*
 00684FE4    push        ebp
 00684FE5    mov         ebp,esp
 00684FE7    add         esp,0FFFFFFF0
 00684FEA    push        ebx
 00684FEB    push        esi
 00684FEC    push        edi
 00684FED    mov         dword ptr [ebp-4],ecx
 00684FF0    mov         esi,edx
 00684FF2    mov         ebx,eax
 00684FF4    mov         eax,dword ptr [ebp+8]
 00684FF7    push        eax
 00684FF8    mov         ecx,dword ptr [ebp+0C]
 00684FFB    mov         edx,dword ptr [ebp-4]
 00684FFE    mov         eax,ebx
 00685000    mov         edi,dword ptr [eax]
 00685002    call        dword ptr [edi+20];TExpression.EvaluateVector
 00685005    mov         eax,ebx
 00685007    call        TExpression.HasUnits
 0068500C    test        al,al
>0068500E    je          00685141
 00685014    mov         eax,esi
 00685016    call        TExpression.HasUnits
 0068501B    test        al,al
>0068501D    je          00685141
 00685023    mov         eax,esi
 00685025    mov         edx,dword ptr [eax]
 00685027    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 0068502A    test        al,al
>0068502C    jne         0068503B
 0068502E    mov         eax,ebx
 00685030    mov         edx,dword ptr [eax]
 00685032    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00685035    add         al,0F1
 00685037    sub         al,8
>00685039    jb          0068505B
 0068503B    mov         eax,esi
 0068503D    mov         edx,dword ptr [eax]
 0068503F    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00685042    test        al,al
>00685044    jne         006850DB
 0068504A    mov         eax,ebx
 0068504C    mov         edx,dword ptr [eax]
 0068504E    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00685051    add         al,0F1
 00685053    sub         al,8
>00685055    jae         006850DB
 0068505B    mov         eax,ebx
 0068505D    call        TExpression.UnitFactor
 00685062    mov         eax,dword ptr [ebp-4]
 00685065    fld         qword ptr [eax]
 00685067    fmul        qword ptr ds:[78BDC8];gvar_0078BDC8:Double
 0068506D    fmulp       st(1),st
 0068506F    fstp        tbyte ptr [ebp-10]
 00685072    wait
 00685073    mov         eax,esi
 00685075    call        TExpression.UnitFactor
 0068507A    fld         tbyte ptr [ebp-10]
 0068507D    fdivrp      st(1),st
 0068507F    mov         eax,dword ptr [ebp-4]
 00685082    fstp        qword ptr [eax]
 00685084    wait
 00685085    mov         eax,ebx
 00685087    call        TExpression.UnitFactor
 0068508C    mov         eax,dword ptr [ebp+0C]
 0068508F    fld         qword ptr [eax]
 00685091    fmul        qword ptr ds:[78BDC8];gvar_0078BDC8:Double
 00685097    fmulp       st(1),st
 00685099    fstp        tbyte ptr [ebp-10]
 0068509C    wait
 0068509D    mov         eax,esi
 0068509F    call        TExpression.UnitFactor
 006850A4    fld         tbyte ptr [ebp-10]
 006850A7    fdivrp      st(1),st
 006850A9    mov         eax,dword ptr [ebp+0C]
 006850AC    fstp        qword ptr [eax]
 006850AE    wait
 006850AF    mov         eax,ebx
 006850B1    call        TExpression.UnitFactor
 006850B6    mov         eax,dword ptr [ebp+8]
 006850B9    fld         qword ptr [eax]
 006850BB    fmul        qword ptr ds:[78BDC8];gvar_0078BDC8:Double
 006850C1    fmulp       st(1),st
 006850C3    fstp        tbyte ptr [ebp-10]
 006850C6    wait
 006850C7    mov         eax,esi
 006850C9    call        TExpression.UnitFactor
 006850CE    fld         tbyte ptr [ebp-10]
 006850D1    fdivrp      st(1),st
 006850D3    mov         eax,dword ptr [ebp+8]
 006850D6    fstp        qword ptr [eax]
 006850D8    wait
>006850D9    jmp         00685141
 006850DB    mov         eax,ebx
 006850DD    call        TExpression.UnitFactor
 006850E2    mov         eax,dword ptr [ebp-4]
 006850E5    fmul        qword ptr [eax]
 006850E7    fstp        tbyte ptr [ebp-10]
 006850EA    wait
 006850EB    mov         eax,esi
 006850ED    call        TExpression.UnitFactor
 006850F2    fld         tbyte ptr [ebp-10]
 006850F5    fdivrp      st(1),st
 006850F7    mov         eax,dword ptr [ebp-4]
 006850FA    fstp        qword ptr [eax]
 006850FC    wait
 006850FD    mov         eax,ebx
 006850FF    call        TExpression.UnitFactor
 00685104    mov         eax,dword ptr [ebp+0C]
 00685107    fmul        qword ptr [eax]
 00685109    fstp        tbyte ptr [ebp-10]
 0068510C    wait
 0068510D    mov         eax,esi
 0068510F    call        TExpression.UnitFactor
 00685114    fld         tbyte ptr [ebp-10]
 00685117    fdivrp      st(1),st
 00685119    mov         eax,dword ptr [ebp+0C]
 0068511C    fstp        qword ptr [eax]
 0068511E    wait
 0068511F    mov         eax,ebx
 00685121    call        TExpression.UnitFactor
 00685126    mov         eax,dword ptr [ebp+8]
 00685129    fmul        qword ptr [eax]
 0068512B    fstp        tbyte ptr [ebp-10]
 0068512E    wait
 0068512F    mov         eax,esi
 00685131    call        TExpression.UnitFactor
 00685136    fld         tbyte ptr [ebp-10]
 00685139    fdivrp      st(1),st
 0068513B    mov         eax,dword ptr [ebp+8]
 0068513E    fstp        qword ptr [eax]
 00685140    wait
 00685141    pop         edi
 00685142    pop         esi
 00685143    pop         ebx
 00685144    mov         esp,ebp
 00685146    pop         ebp
 00685147    ret         8
*}
end;

//0068514C
procedure TExpression.FillClone(c:TExpression);
begin
{*
 0068514C    mov         ecx,dword ptr [eax+8];TExpression.PreviousValue:Double
 0068514F    mov         dword ptr [edx+8],ecx;TExpression.PreviousValue:Double
 00685152    mov         ecx,dword ptr [eax+0C];TExpression.?fC:dword
 00685155    mov         dword ptr [edx+0C],ecx;TExpression.?fC:dword
 00685158    movzx       eax,byte ptr [eax+10];TExpression.Iffy:Boolean
 0068515C    mov         byte ptr [edx+10],al;TExpression.Iffy:Boolean
 0068515F    ret
*}
end;

//00685160
procedure TExpression.GetBoolean;
begin
{*
 00685160    push        ebx
 00685161    mov         ebx,eax
 00685163    mov         eax,ebx
 00685165    mov         edx,dword ptr [eax]
 00685167    call        dword ptr [edx+2C];TExpression.GetValue
 0068516A    add         esp,0FFFFFFF8
 0068516D    fstp        qword ptr [esp]
 00685170    wait
 00685171    call        00686060
 00685176    pop         ebx
 00685177    ret
*}
end;

//00685178
function TExpression.GetDataType:TDataType;
begin
{*
 00685178    xor         eax,eax
 0068517A    ret
*}
end;

//0068517C
procedure TExpression.GetInteger;
begin
{*
 0068517C    push        ebx
 0068517D    mov         ebx,eax
 0068517F    mov         eax,ebx
 00685181    mov         edx,dword ptr [eax]
 00685183    call        dword ptr [edx+2C];TExpression.GetValue
 00685186    call        @ROUND
 0068518B    pop         ebx
 0068518C    ret
*}
end;

//00685190
function TExpression.GetPerUnits1:TUnits;
begin
{*
 00685190    xor         eax,eax
 00685192    ret
*}
end;

//00685194
function TExpression.GetPerUnits2:TUnits;
begin
{*
 00685194    xor         eax,eax
 00685196    ret
*}
end;

//00685198
procedure TExpression.GetPreviousValue;
begin
{*
 00685198    add         esp,0FFFFFFF8
 0068519B    mov         edx,dword ptr [eax+8];TExpression.PreviousValue:Double
 0068519E    mov         dword ptr [esp],edx
 006851A1    mov         edx,dword ptr [eax+0C];TExpression.?fC:dword
 006851A4    mov         dword ptr [esp+4],edx
 006851A8    fld         qword ptr [esp]
 006851AB    pop         ecx
 006851AC    pop         edx
 006851AD    ret
*}
end;

//006851B0
procedure TExpression.GetRotMat(m:TRotMat);
begin
{*
 006851B0    push        ebx
 006851B1    push        esi
 006851B2    add         esp,0FFFFFFA4
 006851B5    mov         dword ptr [esp],edx
 006851B8    lea         edx,[esp+18]
 006851BC    push        edx
 006851BD    lea         ecx,[esp+14]
 006851C1    lea         edx,[esp+0C]
 006851C5    mov         ebx,dword ptr [eax]
 006851C7    call        dword ptr [ebx+3C];TExpression.GetVector
 006851CA    push        dword ptr [esp+0C]
 006851CE    push        dword ptr [esp+0C]
 006851D2    push        dword ptr [esp+1C]
 006851D6    push        dword ptr [esp+1C]
 006851DA    push        dword ptr [esp+2C]
 006851DE    push        dword ptr [esp+2C]
 006851E2    call        005C4070
 006851E7    fstp        qword ptr [esp+50]
 006851EB    wait
 006851EC    fld         qword ptr [esp+50]
 006851F0    fcomp       dword ptr ds:[685370];0:Single
 006851F6    wait
 006851F7    fnstsw      al
 006851F9    sahf
>006851FA    jne         0068522F
 006851FC    xor         ecx,ecx
 006851FE    mov         esi,dword ptr [esp]
 00685201    xor         edx,edx
 00685203    mov         eax,esi
 00685205    cmp         edx,ecx
 00685207    sete        bl
 0068520A    movsx       ebx,bl
 0068520D    mov         dword ptr [esp+58],ebx
 00685211    fild        dword ptr [esp+58]
 00685215    fstp        qword ptr [eax]
 00685217    wait
 00685218    inc         edx
 00685219    add         eax,8
 0068521C    cmp         edx,3
>0068521F    jne         00685205
 00685221    inc         ecx
 00685222    add         esi,18
 00685225    cmp         ecx,3
>00685228    jne         00685201
>0068522A    jmp         00685367
 0068522F    fld         qword ptr [esp+8]
 00685233    fdiv        qword ptr [esp+50]
 00685237    fstp        qword ptr [esp+8]
 0068523B    wait
 0068523C    fld         qword ptr [esp+10]
 00685240    fdiv        qword ptr [esp+50]
 00685244    fstp        qword ptr [esp+10]
 00685248    wait
 00685249    fld         qword ptr [esp+18]
 0068524D    fdiv        qword ptr [esp+50]
 00685251    fstp        qword ptr [esp+18]
 00685255    wait
 00685256    mov         eax,dword ptr [esp]
 00685259    mov         edx,dword ptr [esp+8]
 0068525D    mov         dword ptr [eax+30],edx
 00685260    mov         edx,dword ptr [esp+0C]
 00685264    mov         dword ptr [eax+34],edx
 00685267    mov         eax,dword ptr [esp]
 0068526A    mov         edx,dword ptr [esp+10]
 0068526E    mov         dword ptr [eax+38],edx
 00685271    mov         edx,dword ptr [esp+14]
 00685275    mov         dword ptr [eax+3C],edx
 00685278    mov         eax,dword ptr [esp]
 0068527B    mov         edx,dword ptr [esp+18]
 0068527F    mov         dword ptr [eax+40],edx
 00685282    mov         edx,dword ptr [esp+1C]
 00685286    mov         dword ptr [eax+44],edx
 00685289    push        0
 0068528B    push        0
 0068528D    push        3FF00000
 00685292    push        0
 00685294    push        0
 00685296    push        0
 00685298    push        dword ptr [esp+24]
 0068529C    push        dword ptr [esp+24]
 006852A0    push        dword ptr [esp+34]
 006852A4    push        dword ptr [esp+34]
 006852A8    push        dword ptr [esp+44]
 006852AC    push        dword ptr [esp+44]
 006852B0    lea         ecx,[esp+60]
 006852B4    lea         edx,[esp+58]
 006852B8    lea         eax,[esp+50]
 006852BC    call        005C3FE0
 006852C1    mov         eax,dword ptr [esp]
 006852C4    mov         edx,dword ptr [esp+20]
 006852C8    mov         dword ptr [eax],edx
 006852CA    mov         edx,dword ptr [esp+24]
 006852CE    mov         dword ptr [eax+4],edx
 006852D1    mov         eax,dword ptr [esp]
 006852D4    mov         edx,dword ptr [esp+28]
 006852D8    mov         dword ptr [eax+8],edx
 006852DB    mov         edx,dword ptr [esp+2C]
 006852DF    mov         dword ptr [eax+0C],edx
 006852E2    mov         eax,dword ptr [esp]
 006852E5    mov         edx,dword ptr [esp+30]
 006852E9    mov         dword ptr [eax+10],edx
 006852EC    mov         edx,dword ptr [esp+34]
 006852F0    mov         dword ptr [eax+14],edx
 006852F3    push        dword ptr [esp+0C]
 006852F7    push        dword ptr [esp+0C]
 006852FB    push        dword ptr [esp+1C]
 006852FF    push        dword ptr [esp+1C]
 00685303    push        dword ptr [esp+2C]
 00685307    push        dword ptr [esp+2C]
 0068530B    push        dword ptr [esp+3C]
 0068530F    push        dword ptr [esp+3C]
 00685313    push        dword ptr [esp+4C]
 00685317    push        dword ptr [esp+4C]
 0068531B    push        dword ptr [esp+5C]
 0068531F    push        dword ptr [esp+5C]
 00685323    lea         ecx,[esp+78]
 00685327    lea         edx,[esp+70]
 0068532B    lea         eax,[esp+68]
 0068532F    call        005C3FE0
 00685334    mov         eax,dword ptr [esp]
 00685337    mov         edx,dword ptr [esp+38]
 0068533B    mov         dword ptr [eax+18],edx
 0068533E    mov         edx,dword ptr [esp+3C]
 00685342    mov         dword ptr [eax+1C],edx
 00685345    mov         eax,dword ptr [esp]
 00685348    mov         edx,dword ptr [esp+40]
 0068534C    mov         dword ptr [eax+20],edx
 0068534F    mov         edx,dword ptr [esp+44]
 00685353    mov         dword ptr [eax+24],edx
 00685356    mov         eax,dword ptr [esp]
 00685359    mov         edx,dword ptr [esp+48]
 0068535D    mov         dword ptr [eax+28],edx
 00685360    mov         edx,dword ptr [esp+4C]
 00685364    mov         dword ptr [eax+2C],edx
 00685367    add         esp,5C
 0068536A    pop         esi
 0068536B    pop         ebx
 0068536C    ret
*}
end;

//00685374
{*procedure TExpression.GetString(?:?);
begin
 00685374    push        ebp
 00685375    mov         ebp,esp
 00685377    mov         ecx,17
 0068537C    push        0
 0068537E    push        0
 00685380    dec         ecx
>00685381    jne         0068537C
 00685383    push        ebx
 00685384    push        esi
 00685385    push        edi
 00685386    mov         esi,edx
 00685388    mov         ebx,eax
 0068538A    xor         eax,eax
 0068538C    push        ebp
 0068538D    push        685804
 00685392    push        dword ptr fs:[eax]
 00685395    mov         dword ptr fs:[eax],esp
 00685398    mov         eax,ebx
 0068539A    mov         edx,dword ptr [eax]
 0068539C    call        dword ptr [edx+44];TExpression.GetDataType
 0068539F    cmp         al,3
>006853A1    jne         006853D0
 006853A3    mov         eax,ebx
 006853A5    mov         edx,dword ptr [eax]
 006853A7    call        dword ptr [edx+30];TExpression.GetBoolean
 006853AA    test        al,al
>006853AC    je          006853BF
 006853AE    mov         eax,esi
 006853B0    mov         edx,685820;'True'
 006853B5    call        @UStrAsg
>006853BA    jmp         006857C3
 006853BF    mov         eax,esi
 006853C1    mov         edx,685838;'False'
 006853C6    call        @UStrAsg
>006853CB    jmp         006857C3
 006853D0    mov         eax,ebx
 006853D2    mov         edx,dword ptr [eax]
 006853D4    call        dword ptr [edx+44];TExpression.GetDataType
 006853D7    cmp         al,2
>006853D9    jne         006853EE
 006853DB    mov         eax,ebx
 006853DD    mov         edx,dword ptr [eax]
 006853DF    call        dword ptr [edx+34];TExpression.GetInteger
 006853E2    mov         edx,esi
 006853E4    call        IntToStr
>006853E9    jmp         006857C3
 006853EE    mov         eax,ebx
 006853F0    mov         edx,dword ptr [eax]
 006853F2    call        dword ptr [edx+44];TExpression.GetDataType
 006853F5    cmp         al,5
>006853F7    jne         006854CF
 006853FD    lea         eax,[ebp-60]
 00685400    push        eax
 00685401    lea         ecx,[ebp-58]
 00685404    lea         edx,[ebp-50]
 00685407    mov         eax,ebx
 00685409    mov         edi,dword ptr [eax]
 0068540B    call        dword ptr [edi+3C];TExpression.GetVector
 0068540E    fld         qword ptr [ebp-50]
 00685411    add         esp,0FFFFFFF4
 00685414    fstp        tbyte ptr [esp]
 00685417    wait
 00685418    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 0068541D    push        eax
 0068541E    lea         eax,[ebp-8]
 00685421    push        eax
 00685422    mov         ecx,2
 00685427    mov         edx,0F
 0068542C    mov         al,2
 0068542E    call        FloatToStrF
 00685433    fld         qword ptr [ebp-58]
 00685436    add         esp,0FFFFFFF4
 00685439    fstp        tbyte ptr [esp]
 0068543C    wait
 0068543D    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00685442    push        eax
 00685443    lea         eax,[ebp-0C]
 00685446    push        eax
 00685447    mov         ecx,2
 0068544C    mov         edx,0F
 00685451    mov         al,2
 00685453    call        FloatToStrF
 00685458    push        685850;'['
 0068545D    push        dword ptr [ebp-8]
 00685460    push        685860;', '
 00685465    push        dword ptr [ebp-0C]
 00685468    mov         eax,esi
 0068546A    mov         edx,4
 0068546F    call        @UStrCatN
 00685474    fld         qword ptr [ebp-60]
 00685477    fcomp       dword ptr ds:[685868];0:Single
 0068547D    wait
 0068547E    fnstsw      al
 00685480    sahf
>00685481    je          006854BE
 00685483    fld         qword ptr [ebp-60]
 00685486    add         esp,0FFFFFFF4
 00685489    fstp        tbyte ptr [esp]
 0068548C    wait
 0068548D    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00685492    push        eax
 00685493    lea         eax,[ebp-10]
 00685496    push        eax
 00685497    mov         ecx,2
 0068549C    mov         edx,0F
 006854A1    mov         al,2
 006854A3    call        FloatToStrF
 006854A8    push        dword ptr [esi]
 006854AA    push        685860;', '
 006854AF    push        dword ptr [ebp-10]
 006854B2    mov         eax,esi
 006854B4    mov         edx,3
 006854B9    call        @UStrCatN
 006854BE    mov         eax,esi
 006854C0    mov         edx,685878;']'
 006854C5    call        @UStrCat
>006854CA    jmp         006857C3
 006854CF    mov         eax,ebx
 006854D1    mov         edx,dword ptr [eax]
 006854D3    call        dword ptr [edx+44];TExpression.GetDataType
 006854D6    cmp         al,7
>006854D8    jne         0068558C
 006854DE    lea         eax,[ebp-60]
 006854E1    push        eax
 006854E2    lea         ecx,[ebp-58]
 006854E5    lea         edx,[ebp-50]
 006854E8    mov         eax,ebx
 006854EA    mov         edi,dword ptr [eax]
 006854EC    call        dword ptr [edi+1C];TExpression.EvaluateColour
 006854EF    fld         qword ptr [ebp-50]
 006854F2    add         esp,0FFFFFFF4
 006854F5    fstp        tbyte ptr [esp]
 006854F8    wait
 006854F9    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 006854FE    push        eax
 006854FF    lea         eax,[ebp-14]
 00685502    push        eax
 00685503    mov         ecx,2
 00685508    mov         edx,0F
 0068550D    mov         al,2
 0068550F    call        FloatToStrF
 00685514    fld         qword ptr [ebp-58]
 00685517    add         esp,0FFFFFFF4
 0068551A    fstp        tbyte ptr [esp]
 0068551D    wait
 0068551E    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00685523    push        eax
 00685524    lea         eax,[ebp-18]
 00685527    push        eax
 00685528    mov         ecx,2
 0068552D    mov         edx,0F
 00685532    mov         al,2
 00685534    call        FloatToStrF
 00685539    fld         qword ptr [ebp-60]
 0068553C    add         esp,0FFFFFFF4
 0068553F    fstp        tbyte ptr [esp]
 00685542    wait
 00685543    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00685548    push        eax
 00685549    lea         eax,[ebp-1C]
 0068554C    push        eax
 0068554D    mov         ecx,2
 00685552    mov         edx,0F
 00685557    mov         al,2
 00685559    call        FloatToStrF
 0068555E    push        685850;'['
 00685563    push        dword ptr [ebp-14]
 00685566    push        685860;', '
 0068556B    push        dword ptr [ebp-18]
 0068556E    push        685860;', '
 00685573    push        dword ptr [ebp-1C]
 00685576    push        685878;']'
 0068557B    mov         eax,esi
 0068557D    mov         edx,7
 00685582    call        @UStrCatN
>00685587    jmp         006857C3
 0068558C    mov         eax,ebx
 0068558E    mov         edx,dword ptr [eax]
 00685590    call        dword ptr [edx+44];TExpression.GetDataType
 00685593    cmp         al,6
>00685595    jne         00685788
 0068559B    lea         edx,[ebp-0B8]
 006855A1    mov         eax,ebx
 006855A3    mov         ecx,dword ptr [eax]
 006855A5    call        dword ptr [ecx+40];TExpression.GetRotMat
 006855A8    fld         qword ptr [ebp-0B8]
 006855AE    add         esp,0FFFFFFF4
 006855B1    fstp        tbyte ptr [esp]
 006855B4    wait
 006855B5    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 006855BA    push        eax
 006855BB    lea         eax,[ebp-20]
 006855BE    push        eax
 006855BF    mov         ecx,2
 006855C4    mov         edx,0F
 006855C9    mov         al,2
 006855CB    call        FloatToStrF
 006855D0    fld         qword ptr [ebp-0B0]
 006855D6    add         esp,0FFFFFFF4
 006855D9    fstp        tbyte ptr [esp]
 006855DC    wait
 006855DD    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 006855E2    push        eax
 006855E3    lea         eax,[ebp-24]
 006855E6    push        eax
 006855E7    mov         ecx,2
 006855EC    mov         edx,0F
 006855F1    mov         al,2
 006855F3    call        FloatToStrF
 006855F8    fld         qword ptr [ebp-0A8]
 006855FE    add         esp,0FFFFFFF4
 00685601    fstp        tbyte ptr [esp]
 00685604    wait
 00685605    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 0068560A    push        eax
 0068560B    lea         eax,[ebp-28]
 0068560E    push        eax
 0068560F    mov         ecx,2
 00685614    mov         edx,0F
 00685619    mov         al,2
 0068561B    call        FloatToStrF
 00685620    push        685850;'['
 00685625    push        dword ptr [ebp-20]
 00685628    push        685860;', '
 0068562D    push        dword ptr [ebp-24]
 00685630    push        685860;', '
 00685635    push        dword ptr [ebp-28]
 00685638    push        685888;'; '
 0068563D    mov         eax,esi
 0068563F    mov         edx,7
 00685644    call        @UStrCatN
 00685649    fld         qword ptr [ebp-0A0]
 0068564F    add         esp,0FFFFFFF4
 00685652    fstp        tbyte ptr [esp]
 00685655    wait
 00685656    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 0068565B    push        eax
 0068565C    lea         eax,[ebp-2C]
 0068565F    push        eax
 00685660    mov         ecx,2
 00685665    mov         edx,0F
 0068566A    mov         al,2
 0068566C    call        FloatToStrF
 00685671    fld         qword ptr [ebp-98]
 00685677    add         esp,0FFFFFFF4
 0068567A    fstp        tbyte ptr [esp]
 0068567D    wait
 0068567E    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00685683    push        eax
 00685684    lea         eax,[ebp-30]
 00685687    push        eax
 00685688    mov         ecx,2
 0068568D    mov         edx,0F
 00685692    mov         al,2
 00685694    call        FloatToStrF
 00685699    fld         qword ptr [ebp-90]
 0068569F    add         esp,0FFFFFFF4
 006856A2    fstp        tbyte ptr [esp]
 006856A5    wait
 006856A6    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 006856AB    push        eax
 006856AC    lea         eax,[ebp-34]
 006856AF    push        eax
 006856B0    mov         ecx,2
 006856B5    mov         edx,0F
 006856BA    mov         al,2
 006856BC    call        FloatToStrF
 006856C1    push        dword ptr [esi]
 006856C3    push        dword ptr [ebp-2C]
 006856C6    push        685860;', '
 006856CB    push        dword ptr [ebp-30]
 006856CE    push        685860;', '
 006856D3    push        dword ptr [ebp-34]
 006856D6    push        685888;'; '
 006856DB    mov         eax,esi
 006856DD    mov         edx,7
 006856E2    call        @UStrCatN
 006856E7    fld         qword ptr [ebp-88]
 006856ED    add         esp,0FFFFFFF4
 006856F0    fstp        tbyte ptr [esp]
 006856F3    wait
 006856F4    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 006856F9    push        eax
 006856FA    lea         eax,[ebp-38]
 006856FD    push        eax
 006856FE    mov         ecx,2
 00685703    mov         edx,0F
 00685708    mov         al,2
 0068570A    call        FloatToStrF
 0068570F    fld         qword ptr [ebp-80]
 00685712    add         esp,0FFFFFFF4
 00685715    fstp        tbyte ptr [esp]
 00685718    wait
 00685719    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 0068571E    push        eax
 0068571F    lea         eax,[ebp-3C]
 00685722    push        eax
 00685723    mov         ecx,2
 00685728    mov         edx,0F
 0068572D    mov         al,2
 0068572F    call        FloatToStrF
 00685734    fld         qword ptr [ebp-78]
 00685737    add         esp,0FFFFFFF4
 0068573A    fstp        tbyte ptr [esp]
 0068573D    wait
 0068573E    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00685743    push        eax
 00685744    lea         eax,[ebp-40]
 00685747    push        eax
 00685748    mov         ecx,2
 0068574D    mov         edx,0F
 00685752    mov         al,2
 00685754    call        FloatToStrF
 00685759    push        dword ptr [esi]
 0068575B    push        dword ptr [ebp-38]
 0068575E    push        685860;', '
 00685763    push        dword ptr [ebp-3C]
 00685766    push        685860;', '
 0068576B    push        dword ptr [ebp-40]
 0068576E    mov         eax,esi
 00685770    mov         edx,6
 00685775    call        @UStrCatN
 0068577A    mov         eax,esi
 0068577C    mov         edx,685878;']'
 00685781    call        @UStrCat
>00685786    jmp         006857C3
 00685788    mov         eax,ebx
 0068578A    mov         edx,dword ptr [eax]
 0068578C    call        dword ptr [edx+2C];TExpression.GetValue
 0068578F    fstp        tbyte ptr [ebp-70]
 00685792    wait
 00685793    movzx       eax,word ptr [ebp-68]
 00685797    push        eax
 00685798    push        dword ptr [ebp-6C]
 0068579B    push        dword ptr [ebp-70]
 0068579E    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 006857A3    push        eax
 006857A4    lea         eax,[ebp-44]
 006857A7    push        eax
 006857A8    mov         ecx,2
 006857AD    mov         edx,0F
 006857B2    mov         al,2
 006857B4    call        FloatToStrF
 006857B9    mov         eax,esi
 006857BB    mov         edx,dword ptr [ebp-44]
 006857BE    call        @UStrAsg
 006857C3    lea         edx,[ebp-4]
 006857C6    mov         eax,ebx
 006857C8    call        TExpression.GetUnitsString
 006857CD    cmp         dword ptr [ebp-4],0
>006857D1    je          006857E9
 006857D3    push        dword ptr [esi]
 006857D5    push        68589C;' '
 006857DA    push        dword ptr [ebp-4]
 006857DD    mov         eax,esi
 006857DF    mov         edx,3
 006857E4    call        @UStrCatN
 006857E9    xor         eax,eax
 006857EB    pop         edx
 006857EC    pop         ecx
 006857ED    pop         ecx
 006857EE    mov         dword ptr fs:[eax],edx
 006857F1    push        68580B
 006857F6    lea         eax,[ebp-44]
 006857F9    mov         edx,11
 006857FE    call        @UStrArrayClr
 00685803    ret
>00685804    jmp         @HandleFinally
>00685809    jmp         006857F6
 0068580B    pop         edi
 0068580C    pop         esi
 0068580D    pop         ebx
 0068580E    mov         esp,ebp
 00685810    pop         ebp
 00685811    ret
end;*}

//006858A0
function TExpression.GetUnits:TUnits;
begin
{*
 006858A0    xor         eax,eax
 006858A2    ret
*}
end;

//006858A4
{*procedure TExpression.GetUnitsString(?:?);
begin
 006858A4    push        ebp
 006858A5    mov         ebp,esp
 006858A7    push        0
 006858A9    push        0
 006858AB    push        0
 006858AD    push        ebx
 006858AE    push        esi
 006858AF    mov         esi,edx
 006858B1    mov         ebx,eax
 006858B3    xor         eax,eax
 006858B5    push        ebp
 006858B6    push        685B0E
 006858BB    push        dword ptr fs:[eax]
 006858BE    mov         dword ptr fs:[eax],esp
 006858C1    fld         qword ptr [ebx+8];TExpression.PreviousValue:Double
 006858C4    fcomp       dword ptr ds:[685B1C];1:Single
 006858CA    wait
 006858CB    fnstsw      al
 006858CD    sahf
>006858CE    je          006858DF
 006858D0    fld         qword ptr [ebx+8];TExpression.PreviousValue:Double
 006858D3    fcomp       dword ptr ds:[685B20];-1:Single
 006858D9    wait
 006858DA    fnstsw      al
 006858DC    sahf
>006858DD    jne         006858F0
 006858DF    mov         eax,ebx
 006858E1    mov         edx,dword ptr [eax]
 006858E3    call        dword ptr [edx+48];TExpression.GetUnits
 006858E6    lea         edx,[ebp-4]
 006858E9    call        0068371C
>006858EE    jmp         006858FF
 006858F0    mov         eax,ebx
 006858F2    mov         edx,dword ptr [eax]
 006858F4    call        dword ptr [edx+48];TExpression.GetUnits
 006858F7    lea         edx,[ebp-4]
 006858FA    call        00682F34
 006858FF    mov         eax,ebx
 00685901    mov         edx,dword ptr [eax]
 00685903    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00685906    lea         edx,[ebp-8]
 00685909    call        0068371C
 0068590E    mov         eax,ebx
 00685910    mov         edx,dword ptr [eax]
 00685912    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00685915    lea         edx,[ebp-0C]
 00685918    call        0068371C
 0068591D    cmp         dword ptr [ebp-4],0
>00685921    jne         0068593B
 00685923    cmp         dword ptr [ebp-8],0
>00685927    je          0068593B
 00685929    lea         eax,[ebp-4]
 0068592C    mov         ecx,dword ptr [ebp-8]
 0068592F    mov         edx,685B30;'per '
 00685934    call        @UStrCat3
>00685939    jmp         00685959
 0068593B    cmp         dword ptr [ebp-8],0
>0068593F    je          00685959
 00685941    push        dword ptr [ebp-4]
 00685944    push        685B48;' per '
 00685949    push        dword ptr [ebp-8]
 0068594C    lea         eax,[ebp-4]
 0068594F    mov         edx,3
 00685954    call        @UStrCatN
 00685959    cmp         dword ptr [ebp-4],0
>0068595D    jne         00685977
 0068595F    cmp         dword ptr [ebp-0C],0
>00685963    je          00685977
 00685965    lea         eax,[ebp-4]
 00685968    mov         ecx,dword ptr [ebp-0C]
 0068596B    mov         edx,685B30;'per '
 00685970    call        @UStrCat3
>00685975    jmp         00685995
 00685977    cmp         dword ptr [ebp-0C],0
>0068597B    je          00685995
 0068597D    push        dword ptr [ebp-4]
 00685980    push        685B48;' per '
 00685985    push        dword ptr [ebp-0C]
 00685988    lea         eax,[ebp-4]
 0068598B    mov         edx,3
 00685990    call        @UStrCatN
 00685995    mov         eax,dword ptr [ebp-4]
 00685998    mov         edx,685B60;'km per hour'
 0068599D    call        @UStrEqual
>006859A2    jne         006859B6
 006859A4    lea         eax,[ebp-4]
 006859A7    mov         edx,685B84;'kph'
 006859AC    call        @UStrLAsg
>006859B1    jmp         00685AE9
 006859B6    mov         eax,dword ptr [ebp-4]
 006859B9    mov         edx,685B98;'metres per second'
 006859BE    call        @UStrEqual
>006859C3    je          006859D4
 006859C5    mov         eax,dword ptr [ebp-4]
 006859C8    mov         edx,685BC8;'metre per second'
 006859CD    call        @UStrEqual
>006859D2    jne         006859E6
 006859D4    lea         eax,[ebp-4]
 006859D7    mov         edx,685BF8;'m/s'
 006859DC    call        @UStrLAsg
>006859E1    jmp         00685AE9
 006859E6    mov         eax,dword ptr [ebp-4]
 006859E9    mov         edx,685C0C;'metres per second per second'
 006859EE    call        @UStrEqual
>006859F3    je          00685A04
 006859F5    mov         eax,dword ptr [ebp-4]
 006859F8    mov         edx,685C54;'metre per second per second'
 006859FD    call        @UStrEqual
>00685A02    jne         00685A16
 00685A04    lea         eax,[ebp-4]
 00685A07    mov         edx,685C98;'m/s/s'
 00685A0C    call        @UStrLAsg
>00685A11    jmp         00685AE9
 00685A16    mov         eax,dword ptr [ebp-4]
 00685A19    mov         edx,685CB0;'Kg metres per second per second'
 00685A1E    call        @UStrEqual
>00685A23    je          00685A34
 00685A25    mov         eax,dword ptr [ebp-4]
 00685A28    mov         edx,685CFC;'Kg metre per second per second'
 00685A2D    call        @UStrEqual
>00685A32    jne         00685A73
 00685A34    fld         qword ptr [ebx+8];TExpression.PreviousValue:Double
 00685A37    fcomp       dword ptr ds:[685B1C];1:Single
 00685A3D    wait
 00685A3E    fnstsw      al
 00685A40    sahf
>00685A41    je          00685A52
 00685A43    fld         qword ptr [ebx+8];TExpression.PreviousValue:Double
 00685A46    fcomp       dword ptr ds:[685B20];-1:Single
 00685A4C    wait
 00685A4D    fnstsw      al
 00685A4F    sahf
>00685A50    jne         00685A64
 00685A52    lea         eax,[ebp-4]
 00685A55    mov         edx,685D48;'newton'
 00685A5A    call        @UStrLAsg
>00685A5F    jmp         00685AE9
 00685A64    lea         eax,[ebp-4]
 00685A67    mov         edx,685D64;'newtons'
 00685A6C    call        @UStrLAsg
>00685A71    jmp         00685AE9
 00685A73    mov         eax,dword ptr [ebp-4]
 00685A76    mov         edx,685D80;'per second'
 00685A7B    call        @UStrEqual
>00685A80    jne         00685A91
 00685A82    lea         eax,[ebp-4]
 00685A85    mov         edx,685DA4;'Hz'
 00685A8A    call        @UStrLAsg
>00685A8F    jmp         00685AE9
 00685A91    mov         eax,dword ptr [ebp-4]
 00685A94    mov         edx,685DB8;'per ms'
 00685A99    call        @UStrEqual
>00685A9E    jne         00685AAF
 00685AA0    lea         eax,[ebp-4]
 00685AA3    mov         edx,685DD4;'KHz'
 00685AA8    call        @UStrLAsg
>00685AAD    jmp         00685AE9
 00685AAF    mov         eax,dword ptr [ebp-4]
 00685AB2    mov         edx,685DE8;'per microsecond'
 00685AB7    call        @UStrEqual
>00685ABC    jne         00685ACD
 00685ABE    lea         eax,[ebp-4]
 00685AC1    mov         edx,685E14;'MHz'
 00685AC6    call        @UStrLAsg
>00685ACB    jmp         00685AE9
 00685ACD    mov         eax,dword ptr [ebp-4]
 00685AD0    mov         edx,685E28;'revolutions per minute'
 00685AD5    call        @UStrEqual
>00685ADA    jne         00685AE9
 00685ADC    lea         eax,[ebp-4]
 00685ADF    mov         edx,685E64;'rpm'
 00685AE4    call        @UStrLAsg
 00685AE9    mov         eax,esi
 00685AEB    mov         edx,dword ptr [ebp-4]
 00685AEE    call        @UStrAsg
 00685AF3    xor         eax,eax
 00685AF5    pop         edx
 00685AF6    pop         ecx
 00685AF7    pop         ecx
 00685AF8    mov         dword ptr fs:[eax],edx
 00685AFB    push        685B15
 00685B00    lea         eax,[ebp-0C]
 00685B03    mov         edx,3
 00685B08    call        @UStrArrayClr
 00685B0D    ret
>00685B0E    jmp         @HandleFinally
>00685B13    jmp         00685B00
 00685B15    pop         esi
 00685B16    pop         ebx
 00685B17    mov         esp,ebp
 00685B19    pop         ebp
 00685B1A    ret
end;*}

//00685E6C
procedure TExpression.GetVector(x:Double; y:Double; z:Double);
begin
{*
 00685E6C    push        ebp
 00685E6D    mov         ebp,esp
 00685E6F    push        ebx
 00685E70    mov         ebx,eax
 00685E72    xor         eax,eax
 00685E74    mov         dword ptr [edx],eax
 00685E76    mov         dword ptr [edx+4],eax
 00685E79    xor         eax,eax
 00685E7B    mov         dword ptr [ecx],eax
 00685E7D    mov         dword ptr [ecx+4],eax
 00685E80    mov         eax,ebx
 00685E82    mov         edx,dword ptr [eax]
 00685E84    call        dword ptr [edx+2C];TExpression.GetValue
 00685E87    mov         eax,dword ptr [ebp+8]
 00685E8A    fstp        qword ptr [eax]
 00685E8C    wait
 00685E8D    pop         ebx
 00685E8E    pop         ebp
 00685E8F    ret         4
*}
end;

//00685E94
function TExpression.HasUnits:Boolean;
begin
{*
 00685E94    push        ebx
 00685E95    mov         ebx,eax
 00685E97    mov         eax,ebx
 00685E99    mov         edx,dword ptr [eax]
 00685E9B    call        dword ptr [edx+48];TExpression.GetUnits
 00685E9E    test        al,al
>00685EA0    jne         00685EBC
 00685EA2    mov         eax,ebx
 00685EA4    mov         edx,dword ptr [eax]
 00685EA6    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00685EA9    test        al,al
>00685EAB    jne         00685EBC
 00685EAD    mov         eax,ebx
 00685EAF    mov         edx,dword ptr [eax]
 00685EB1    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00685EB4    test        al,al
>00685EB6    jne         00685EBC
 00685EB8    xor         eax,eax
 00685EBA    pop         ebx
 00685EBB    ret
 00685EBC    mov         al,1
 00685EBE    pop         ebx
 00685EBF    ret
*}
end;

//00685EC0
procedure TExpression.MakeRead;
begin
{*
 00685EC0    mov         byte ptr [eax+11],1;TExpression.Reading:Boolean
 00685EC4    mov         byte ptr [eax+12],0;TExpression.Writing:Boolean
 00685EC8    ret
*}
end;

//00685ECC
procedure TExpression.MakeReadWrite;
begin
{*
 00685ECC    mov         byte ptr [eax+11],1;TExpression.Reading:Boolean
 00685ED0    mov         byte ptr [eax+12],1;TExpression.Writing:Boolean
 00685ED4    ret
*}
end;

//00685ED8
procedure TExpression.MakeWrite;
begin
{*
 00685ED8    mov         byte ptr [eax+11],0;TExpression.Reading:Boolean
 00685EDC    mov         byte ptr [eax+12],1;TExpression.Writing:Boolean
 00685EE0    ret
*}
end;

//00685EE4
procedure TExpression.Press;
begin
{*
 00685EE4    push        ebx
 00685EE5    mov         ebx,eax
 00685EE7    mov         al,1
 00685EE9    call        00686074
 00685EEE    add         esp,0FFFFFFF8
 00685EF1    fstp        qword ptr [esp]
 00685EF4    wait
 00685EF5    mov         eax,ebx
 00685EF7    mov         edx,dword ptr [eax]
 00685EF9    call        dword ptr [edx+58];TExpression.SetValue
 00685EFC    pop         ebx
 00685EFD    ret
*}
end;

//00685F00
function TExpression.Pressed:Boolean;
begin
{*
 00685F00    push        ebx
 00685F01    add         esp,0FFFFFFF8
 00685F04    mov         edx,dword ptr [eax+8];TExpression.PreviousValue:Double
 00685F07    mov         dword ptr [esp],edx
 00685F0A    mov         edx,dword ptr [eax+0C];TExpression.?fC:dword
 00685F0D    mov         dword ptr [esp+4],edx
 00685F11    mov         edx,dword ptr [eax]
 00685F13    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00685F16    mov         ebx,eax
 00685F18    push        dword ptr [esp+4]
 00685F1C    push        dword ptr [esp+4]
 00685F20    call        00686060
 00685F25    test        al,al
>00685F27    jne         00685F2E
 00685F29    cmp         bl,1
>00685F2C    je          00685F32
 00685F2E    xor         eax,eax
>00685F30    jmp         00685F34
 00685F32    mov         al,1
 00685F34    pop         ecx
 00685F35    pop         edx
 00685F36    pop         ebx
 00685F37    ret
*}
end;

//00685F38
procedure TExpression.Release;
begin
{*
 00685F38    push        ebx
 00685F39    mov         ebx,eax
 00685F3B    xor         eax,eax
 00685F3D    call        00686074
 00685F42    add         esp,0FFFFFFF8
 00685F45    fstp        qword ptr [esp]
 00685F48    wait
 00685F49    mov         eax,ebx
 00685F4B    mov         edx,dword ptr [eax]
 00685F4D    call        dword ptr [edx+58];TExpression.SetValue
 00685F50    pop         ebx
 00685F51    ret
*}
end;

//00685F54
function TExpression.Released:Boolean;
begin
{*
 00685F54    push        ebx
 00685F55    add         esp,0FFFFFFF8
 00685F58    mov         edx,dword ptr [eax+8];TExpression.PreviousValue:Double
 00685F5B    mov         dword ptr [esp],edx
 00685F5E    mov         edx,dword ptr [eax+0C];TExpression.?fC:dword
 00685F61    mov         dword ptr [esp+4],edx
 00685F65    mov         edx,dword ptr [eax]
 00685F67    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00685F6A    mov         ebx,eax
 00685F6C    push        dword ptr [esp+4]
 00685F70    push        dword ptr [esp+4]
 00685F74    call        00686060
 00685F79    cmp         al,1
>00685F7B    jne         00685F81
 00685F7D    test        bl,bl
>00685F7F    je          00685F85
 00685F81    xor         eax,eax
>00685F83    jmp         00685F87
 00685F85    mov         al,1
 00685F87    pop         ecx
 00685F88    pop         edx
 00685F89    pop         ebx
 00685F8A    ret
*}
end;

//00685F8C
procedure TExpression.SetIffy(IsIffy:Boolean);
begin
{*
 00685F8C    mov         byte ptr [eax+10],dl;TExpression.Iffy:Boolean
 00685F8F    ret
*}
end;

//00685F90
procedure TExpression.SetMatrix(m:TRotMat);
begin
{*
 00685F90    push        esi
 00685F91    push        edi
 00685F92    add         esp,0FFFFFFB8
 00685F95    mov         esi,edx
 00685F97    lea         edi,[esp]
 00685F9A    mov         ecx,12
 00685F9F    rep movs    dword ptr [edi],dword ptr [esi]
 00685FA1    push        dword ptr [esp+34]
 00685FA5    push        dword ptr [esp+34]
 00685FA9    push        dword ptr [esp+44]
 00685FAD    push        dword ptr [esp+44]
 00685FB1    push        dword ptr [esp+54]
 00685FB5    push        dword ptr [esp+54]
 00685FB9    mov         edx,dword ptr [eax]
 00685FBB    call        dword ptr [edx+60];TExpression.SetVector
 00685FBE    add         esp,48
 00685FC1    pop         edi
 00685FC2    pop         esi
 00685FC3    ret
*}
end;

//00685FC4
function TExpression.SetString(NewValue:string):Boolean;
begin
{*
 00685FC4    push        ebp
 00685FC5    mov         ebp,esp
 00685FC7    add         esp,0FFFFFFF0
 00685FCA    push        ebx
 00685FCB    mov         dword ptr [ebp-4],edx
 00685FCE    mov         ebx,eax
 00685FD0    mov         eax,dword ptr [ebp-4]
 00685FD3    call        @UStrAddRef
 00685FD8    xor         eax,eax
 00685FDA    push        ebp
 00685FDB    push        686043
 00685FE0    push        dword ptr fs:[eax]
 00685FE3    mov         dword ptr fs:[eax],esp
 00685FE6    push        0FFFF
 00685FEB    push        0C0000000
 00685FF0    push        0
 00685FF2    mov         eax,dword ptr [ebp-4]
 00685FF5    call        004F8DB8
 00685FFA    fstp        qword ptr [ebp-10]
 00685FFD    wait
 00685FFE    push        dword ptr [ebp-0C]
 00686001    push        dword ptr [ebp-10]
 00686004    call        004552D4
 00686009    test        al,al
>0068600B    je          0068601E
 0068600D    push        dword ptr [ebp-0C]
 00686010    push        dword ptr [ebp-10]
 00686013    mov         eax,ebx
 00686015    mov         edx,dword ptr [eax]
 00686017    call        dword ptr [edx+58];TExpression.SetValue
 0068601A    xor         ebx,ebx
>0068601C    jmp         0068602D
 0068601E    push        dword ptr [ebp-0C]
 00686021    push        dword ptr [ebp-10]
 00686024    mov         eax,ebx
 00686026    mov         edx,dword ptr [eax]
 00686028    call        dword ptr [edx+58];TExpression.SetValue
 0068602B    mov         ebx,eax
 0068602D    xor         eax,eax
 0068602F    pop         edx
 00686030    pop         ecx
 00686031    pop         ecx
 00686032    mov         dword ptr fs:[eax],edx
 00686035    push        68604A
 0068603A    lea         eax,[ebp-4]
 0068603D    call        @UStrClr
 00686042    ret
>00686043    jmp         @HandleFinally
>00686048    jmp         0068603A
 0068604A    mov         eax,ebx
 0068604C    pop         ebx
 0068604D    mov         esp,ebp
 0068604F    pop         ebp
 00686050    ret
*}
end;

//00686054
function TExpression.SetValue(NewValue:Double):Boolean;
begin
{*
 00686054    push        ebp
 00686055    mov         ebp,esp
 00686057    xor         eax,eax
 00686059    pop         ebp
 0068605A    ret         8
*}
end;

//00686060
{*function sub_00686060(?:?):Boolean;
begin
 00686060    push        ebp
 00686061    mov         ebp,esp
 00686063    fld         qword ptr [ebp+8]
 00686066    call        @ROUND
 0068606B    test        eax,eax
 0068606D    setne       al
 00686070    pop         ebp
 00686071    ret         8
end;*}

//00686074
{*function sub_00686074(?:Boolean):?;
begin
 00686074    push        ebp
 00686075    mov         ebp,esp
 00686077    add         esp,0FFFFFFF8
 0068607A    push        ebx
 0068607B    push        esi
 0068607C    push        edi
 0068607D    xor         edx,edx
 0068607F    push        ebp
 00686080    push        6860AF
 00686085    push        dword ptr fs:[edx]
 00686088    mov         dword ptr fs:[edx],esp
 0068608B    test        al,al
>0068608D    je          0068609D
 0068608F    xor         eax,eax
 00686091    mov         dword ptr [ebp-8],eax
 00686094    mov         dword ptr [ebp-4],3FF00000
>0068609B    jmp         006860A5
 0068609D    xor         eax,eax
 0068609F    mov         dword ptr [ebp-8],eax
 006860A2    mov         dword ptr [ebp-4],eax
 006860A5    xor         eax,eax
 006860A7    pop         edx
 006860A8    pop         ecx
 006860A9    pop         ecx
 006860AA    mov         dword ptr fs:[eax],edx
>006860AD    jmp         006860C1
>006860AF    jmp         @HandleAnyException
 006860B4    xor         eax,eax
 006860B6    mov         dword ptr [ebp-8],eax
 006860B9    mov         dword ptr [ebp-4],eax
 006860BC    call        @DoneExcept
 006860C1    fld         qword ptr [ebp-8]
 006860C4    pop         edi
 006860C5    pop         esi
 006860C6    pop         ebx
 006860C7    pop         ecx
 006860C8    pop         ecx
 006860C9    pop         ebp
 006860CA    ret
end;*}

//006860CC
{*function TExpression.SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;
begin
 006860CC    push        ebp
 006860CD    mov         ebp,esp
 006860CF    push        ebx
 006860D0    mov         ebx,eax
 006860D2    push        dword ptr [ebp+1C]
 006860D5    push        dword ptr [ebp+18]
 006860D8    push        dword ptr [ebp+14]
 006860DB    push        dword ptr [ebp+10]
 006860DE    push        dword ptr [ebp+0C]
 006860E1    push        dword ptr [ebp+8]
 006860E4    call        005C4070
 006860E9    add         esp,0FFFFFFF8
 006860EC    fstp        qword ptr [esp]
 006860EF    wait
 006860F0    mov         eax,ebx
 006860F2    mov         edx,dword ptr [eax]
 006860F4    call        dword ptr [edx+58];TExpression.SetValue
 006860F7    pop         ebx
 006860F8    pop         ebp
 006860F9    ret         18
end;*}

//006860FC
procedure TExpression.Swallow;
begin
{*
 006860FC    ret
*}
end;

//00686100
{*procedure TExpression.ToString(?:?);
begin
 00686100    push        ebp
 00686101    mov         ebp,esp
 00686103    push        0
 00686105    push        0
 00686107    push        ebx
 00686108    push        esi
 00686109    mov         esi,edx
 0068610B    mov         ebx,eax
 0068610D    xor         eax,eax
 0068610F    push        ebp
 00686110    push        68616B
 00686115    push        dword ptr fs:[eax]
 00686118    mov         dword ptr fs:[eax],esp
 0068611B    lea         edx,[ebp-4]
 0068611E    mov         eax,dword ptr [ebx]
 00686120    call        TObject.ClassName
 00686125    push        dword ptr [ebp-4]
 00686128    push        686184;'('
 0068612D    lea         ecx,[ebp-8]
 00686130    mov         edx,8
 00686135    mov         eax,ebx
 00686137    call        IntToHex
 0068613C    push        dword ptr [ebp-8]
 0068613F    push        686194;')'
 00686144    mov         eax,esi
 00686146    mov         edx,4
 0068614B    call        @UStrCatN
 00686150    xor         eax,eax
 00686152    pop         edx
 00686153    pop         ecx
 00686154    pop         ecx
 00686155    mov         dword ptr fs:[eax],edx
 00686158    push        686172
 0068615D    lea         eax,[ebp-8]
 00686160    mov         edx,2
 00686165    call        @UStrArrayClr
 0068616A    ret
>0068616B    jmp         @HandleFinally
>00686170    jmp         0068615D
 00686172    pop         esi
 00686173    pop         ebx
 00686174    pop         ecx
 00686175    pop         ecx
 00686176    pop         ebp
 00686177    ret
end;*}

//00686198
procedure TExpression.UnitFactor;
begin
{*
 00686198    push        ebx
 00686199    add         esp,0FFFFFFE4
 0068619C    mov         ebx,eax
 0068619E    mov         eax,ebx
 006861A0    mov         edx,dword ptr [eax]
 006861A2    call        dword ptr [edx+48];TExpression.GetUnits
 006861A5    call        00683EDC
 006861AA    fstp        qword ptr [esp+8]
 006861AE    wait
 006861AF    mov         eax,ebx
 006861B1    mov         edx,dword ptr [eax]
 006861B3    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 006861B6    call        00683EDC
 006861BB    fdivr       qword ptr [esp+8]
 006861BF    fstp        tbyte ptr [esp+10]
 006861C3    wait
 006861C4    mov         eax,ebx
 006861C6    mov         edx,dword ptr [eax]
 006861C8    call        dword ptr [edx+50];TExpression.GetPerUnits2
 006861CB    call        00683EDC
 006861D0    fld         tbyte ptr [esp+10]
 006861D4    fdivrp      st(1),st
 006861D6    fstp        qword ptr [esp]
 006861D9    wait
 006861DA    fld         qword ptr [esp]
 006861DD    add         esp,1C
 006861E0    pop         ebx
 006861E1    ret
*}
end;

//006861E4
procedure TUnitsExpression.CreateClone;
begin
{*
 006861E4    mov         dl,1
 006861E6    mov         eax,[0068006C];TUnitsExpression
 006861EB    call        TObject.Create;TUnitsExpression.Create
 006861F0    ret
*}
end;

//006861F4
destructor TUnitsExpression.Destroy();
begin
{*
 006861F4    push        ebx
 006861F5    push        esi
 006861F6    call        @BeforeDestruction
 006861FB    mov         ebx,edx
 006861FD    mov         esi,eax
 006861FF    lea         eax,[esi+18];TUnitsExpression.expression:TExpression
 00686202    mov         edx,dword ptr [eax]
 00686204    xor         ecx,ecx
 00686206    mov         dword ptr [eax],ecx
 00686208    mov         eax,edx
 0068620A    call        TObject.Free
 0068620F    mov         edx,ebx
 00686211    and         dl,0FC
 00686214    mov         eax,esi
 00686216    call        TObject.Destroy
 0068621B    test        bl,bl
>0068621D    jle         00686226
 0068621F    mov         eax,esi
 00686221    call        @ClassDestroy
 00686226    pop         esi
 00686227    pop         ebx
 00686228    ret
*}
end;

//0068622C
procedure TUnitsExpression.FillClone(c:TExpression);
begin
{*
 0068622C    push        ebx
 0068622D    push        esi
 0068622E    push        edi
 0068622F    mov         esi,edx
 00686231    mov         ebx,eax
 00686233    mov         edx,esi
 00686235    mov         eax,ebx
 00686237    call        TExpression.FillClone
 0068623C    mov         eax,dword ptr [ebx+18];TUnitsExpression.expression:TExpression
 0068623F    call        TExpression.Clone
 00686244    mov         edi,esi
 00686246    mov         dword ptr [edi+18],eax
 00686249    movzx       eax,byte ptr [ebx+1C];TUnitsExpression.Units:TUnits
 0068624D    mov         byte ptr [edi+1C],al
 00686250    movzx       eax,byte ptr [ebx+1D];TUnitsExpression.PerUnits1:TUnits
 00686254    mov         byte ptr [edi+1D],al
 00686257    movzx       eax,byte ptr [ebx+1E];TUnitsExpression.PerUnits2:TUnits
 0068625B    mov         byte ptr [edi+1E],al
 0068625E    pop         edi
 0068625F    pop         esi
 00686260    pop         ebx
 00686261    ret
*}
end;

//00686264
function TUnitsExpression.GetDataType:TDataType;
begin
{*
 00686264    mov         eax,dword ptr [eax+18];TUnitsExpression.expression:TExpression
 00686267    mov         edx,dword ptr [eax]
 00686269    call        dword ptr [edx+44];TExpression.GetDataType
 0068626C    sub         al,5
>0068626E    je          00686274
 00686270    sub         al,2
>00686272    jne         00686277
 00686274    mov         al,5
 00686276    ret
 00686277    xor         eax,eax
 00686279    ret
*}
end;

//0068627C
function TUnitsExpression.GetPerUnits1:TUnits;
begin
{*
 0068627C    movzx       eax,byte ptr [eax+1D];TUnitsExpression.PerUnits1:TUnits
 00686280    ret
*}
end;

//00686284
function TUnitsExpression.GetPerUnits2:TUnits;
begin
{*
 00686284    movzx       eax,byte ptr [eax+1E];TUnitsExpression.PerUnits2:TUnits
 00686288    ret
*}
end;

//0068628C
function TUnitsExpression.GetUnits:TUnits;
begin
{*
 0068628C    movzx       eax,byte ptr [eax+1C];TUnitsExpression.Units:TUnits
 00686290    ret
*}
end;

//00686294
procedure TUnitsExpression.GetValue;
begin
{*
 00686294    add         esp,0FFFFFFF8
 00686297    mov         eax,dword ptr [eax+18];TUnitsExpression.expression:TExpression
 0068629A    mov         edx,dword ptr [eax]
 0068629C    call        dword ptr [edx];TExpression.Evaluate
 0068629E    fstp        qword ptr [esp]
 006862A1    wait
 006862A2    fld         qword ptr [esp]
 006862A5    pop         ecx
 006862A6    pop         edx
 006862A7    ret
*}
end;

//006862A8
procedure TUnitsExpression.GetVector(x:Double; y:Double; z:Double);
begin
{*
 006862A8    push        ebp
 006862A9    mov         ebp,esp
 006862AB    push        ebx
 006862AC    push        esi
 006862AD    mov         esi,eax
 006862AF    mov         eax,dword ptr [ebp+8]
 006862B2    push        eax
 006862B3    mov         eax,dword ptr [esi+18];TUnitsExpression.expression:TExpression
 006862B6    mov         ebx,dword ptr [eax]
 006862B8    call        dword ptr [ebx+3C];TExpression.GetVector
 006862BB    pop         esi
 006862BC    pop         ebx
 006862BD    pop         ebp
 006862BE    ret         4
*}
end;

//006862C4
procedure TUnitsExpression.SetIffy(IsIffy:Boolean);
begin
{*
 006862C4    push        ebx
 006862C5    push        esi
 006862C6    mov         ebx,edx
 006862C8    mov         esi,eax
 006862CA    mov         edx,ebx
 006862CC    mov         eax,esi
 006862CE    call        TExpression.SetIffy
 006862D3    mov         edx,ebx
 006862D5    mov         eax,dword ptr [esi+18];TUnitsExpression.expression:TExpression
 006862D8    mov         ecx,dword ptr [eax]
 006862DA    call        dword ptr [ecx+74];TExpression.SetIffy
 006862DD    pop         esi
 006862DE    pop         ebx
 006862DF    ret
*}
end;

//006862E0
procedure TUnitsExpression.Swallow;
begin
{*
 006862E0    push        ebx
 006862E1    mov         ebx,eax
 006862E3    mov         eax,ebx
 006862E5    call        TExpression.Swallow
 006862EA    mov         eax,dword ptr [ebx+18];TUnitsExpression.expression:TExpression
 006862ED    mov         edx,dword ptr [eax]
 006862EF    call        dword ptr [edx+88];TExpression.Swallow
 006862F5    pop         ebx
 006862F6    ret
*}
end;

//006862F8
{*procedure TUnitsExpression.ToString(?:?);
begin
 006862F8    push        ebp
 006862F9    mov         ebp,esp
 006862FB    xor         ecx,ecx
 006862FD    push        ecx
 006862FE    push        ecx
 006862FF    push        ecx
 00686300    push        ecx
 00686301    push        ebx
 00686302    push        esi
 00686303    push        edi
 00686304    mov         edi,edx
 00686306    mov         ebx,eax
 00686308    xor         eax,eax
 0068630A    push        ebp
 0068630B    push        6863B3
 00686310    push        dword ptr fs:[eax]
 00686313    mov         dword ptr fs:[eax],esp
 00686316    mov         esi,dword ptr [ebx+18];TUnitsExpression.expression:TExpression
 00686319    mov         eax,esi
 0068631B    mov         edx,dword ptr ds:[680DF8];TBinaryOp
 00686321    call        @IsClass
 00686326    test        al,al
>00686328    jne         0068633B
 0068632A    mov         eax,esi
 0068632C    mov         edx,dword ptr ds:[681370];TUnaryOp
 00686332    call        @IsClass
 00686337    test        al,al
>00686339    je          0068636D
 0068633B    push        6863D0;'('
 00686340    lea         edx,[ebp-4]
 00686343    mov         eax,esi
 00686345    mov         ecx,dword ptr [eax]
 00686347    call        dword ptr [ecx-24];TExpression.ToString
 0068634A    push        dword ptr [ebp-4]
 0068634D    push        6863E0;') '
 00686352    lea         edx,[ebp-8]
 00686355    mov         eax,ebx
 00686357    call        TExpression.GetUnitsString
 0068635C    push        dword ptr [ebp-8]
 0068635F    mov         eax,edi
 00686361    mov         edx,4
 00686366    call        @UStrCatN
>0068636B    jmp         00686398
 0068636D    lea         edx,[ebp-0C]
 00686370    mov         eax,esi
 00686372    mov         ecx,dword ptr [eax]
 00686374    call        dword ptr [ecx-24];TExpression.ToString
 00686377    push        dword ptr [ebp-0C]
 0068637A    push        6863F4;' '
 0068637F    lea         edx,[ebp-10]
 00686382    mov         eax,ebx
 00686384    call        TExpression.GetUnitsString
 00686389    push        dword ptr [ebp-10]
 0068638C    mov         eax,edi
 0068638E    mov         edx,3
 00686393    call        @UStrCatN
 00686398    xor         eax,eax
 0068639A    pop         edx
 0068639B    pop         ecx
 0068639C    pop         ecx
 0068639D    mov         dword ptr fs:[eax],edx
 006863A0    push        6863BA
 006863A5    lea         eax,[ebp-10]
 006863A8    mov         edx,4
 006863AD    call        @UStrArrayClr
 006863B2    ret
>006863B3    jmp         @HandleFinally
>006863B8    jmp         006863A5
 006863BA    pop         edi
 006863BB    pop         esi
 006863BC    pop         ebx
 006863BD    mov         esp,ebp
 006863BF    pop         ebp
 006863C0    ret
end;*}

//006863F8
procedure TInUnitsExpression.CreateClone;
begin
{*
 006863F8    mov         dl,1
 006863FA    mov         eax,[00680494];TInUnitsExpression
 006863FF    call        TObject.Create;TInUnitsExpression.Create
 00686404    ret
*}
end;

//00686408
destructor TInUnitsExpression.Destroy();
begin
{*
 00686408    push        ebx
 00686409    push        esi
 0068640A    call        @BeforeDestruction
 0068640F    mov         ebx,edx
 00686411    mov         esi,eax
 00686413    lea         eax,[esi+18];TInUnitsExpression.expression:TExpression
 00686416    mov         edx,dword ptr [eax]
 00686418    xor         ecx,ecx
 0068641A    mov         dword ptr [eax],ecx
 0068641C    mov         eax,edx
 0068641E    call        TObject.Free
 00686423    mov         edx,ebx
 00686425    and         dl,0FC
 00686428    mov         eax,esi
 0068642A    call        TObject.Destroy
 0068642F    test        bl,bl
>00686431    jle         0068643A
 00686433    mov         eax,esi
 00686435    call        @ClassDestroy
 0068643A    pop         esi
 0068643B    pop         ebx
 0068643C    ret
*}
end;

//00686440
procedure TInUnitsExpression.FillClone(c:TExpression);
begin
{*
 00686440    push        ebx
 00686441    push        esi
 00686442    push        edi
 00686443    mov         esi,edx
 00686445    mov         ebx,eax
 00686447    mov         edx,esi
 00686449    mov         eax,ebx
 0068644B    call        TExpression.FillClone
 00686450    mov         eax,dword ptr [ebx+18];TInUnitsExpression.expression:TExpression
 00686453    call        TExpression.Clone
 00686458    mov         edi,esi
 0068645A    mov         dword ptr [edi+18],eax
 0068645D    movzx       eax,byte ptr [ebx+1C];TInUnitsExpression.Units:TUnits
 00686461    mov         byte ptr [edi+1C],al
 00686464    movzx       eax,byte ptr [ebx+1D];TInUnitsExpression.PerUnits1:TUnits
 00686468    mov         byte ptr [edi+1D],al
 0068646B    movzx       eax,byte ptr [ebx+1E];TInUnitsExpression.PerUnits2:TUnits
 0068646F    mov         byte ptr [edi+1E],al
 00686472    pop         edi
 00686473    pop         esi
 00686474    pop         ebx
 00686475    ret
*}
end;

//00686478
function TInUnitsExpression.GetDataType:TDataType;
begin
{*
 00686478    mov         eax,dword ptr [eax+18];TInUnitsExpression.expression:TExpression
 0068647B    mov         edx,dword ptr [eax]
 0068647D    call        dword ptr [edx+44];TExpression.GetDataType
 00686480    sub         al,5
>00686482    je          00686488
 00686484    sub         al,2
>00686486    jne         0068648B
 00686488    mov         al,5
 0068648A    ret
 0068648B    xor         eax,eax
 0068648D    ret
*}
end;

//00686490
function TInUnitsExpression.GetPerUnits1:TUnits;
begin
{*
 00686490    movzx       eax,byte ptr [eax+1D];TInUnitsExpression.PerUnits1:TUnits
 00686494    ret
*}
end;

//00686498
function TInUnitsExpression.GetPerUnits2:TUnits;
begin
{*
 00686498    movzx       eax,byte ptr [eax+1E];TInUnitsExpression.PerUnits2:TUnits
 0068649C    ret
*}
end;

//006864A0
function TInUnitsExpression.GetUnits:TUnits;
begin
{*
 006864A0    movzx       eax,byte ptr [eax+1C];TInUnitsExpression.Units:TUnits
 006864A4    ret
*}
end;

//006864A8
procedure TInUnitsExpression.GetValue;
begin
{*
 006864A8    add         esp,0FFFFFFF8
 006864AB    mov         edx,eax
 006864AD    mov         eax,dword ptr [eax+18];TInUnitsExpression.expression:TExpression
 006864B0    mov         ecx,dword ptr [eax]
 006864B2    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 006864B5    fstp        qword ptr [esp]
 006864B8    wait
 006864B9    fld         qword ptr [esp]
 006864BC    pop         ecx
 006864BD    pop         edx
 006864BE    ret
*}
end;

//006864C0
procedure TInUnitsExpression.GetVector(x:Double; y:Double; z:Double);
begin
{*
 006864C0    push        ebp
 006864C1    mov         ebp,esp
 006864C3    push        ebx
 006864C4    push        esi
 006864C5    mov         esi,eax
 006864C7    push        ecx
 006864C8    mov         eax,dword ptr [ebp+8]
 006864CB    push        eax
 006864CC    mov         ecx,edx
 006864CE    mov         eax,dword ptr [esi+18];TInUnitsExpression.expression:TExpression
 006864D1    mov         edx,esi
 006864D3    mov         ebx,dword ptr [eax]
 006864D5    call        dword ptr [ebx+24];TExpression.EvaluateVectorToMatch
 006864D8    pop         esi
 006864D9    pop         ebx
 006864DA    pop         ebp
 006864DB    ret         4
*}
end;

//006864E0
procedure TInUnitsExpression.SetIffy(IsIffy:Boolean);
begin
{*
 006864E0    push        ebx
 006864E1    push        esi
 006864E2    mov         ebx,edx
 006864E4    mov         esi,eax
 006864E6    mov         edx,ebx
 006864E8    mov         eax,esi
 006864EA    call        TExpression.SetIffy
 006864EF    mov         edx,ebx
 006864F1    mov         eax,dword ptr [esi+18];TInUnitsExpression.expression:TExpression
 006864F4    mov         ecx,dword ptr [eax]
 006864F6    call        dword ptr [ecx+74];TExpression.SetIffy
 006864F9    pop         esi
 006864FA    pop         ebx
 006864FB    ret
*}
end;

//006864FC
procedure TInUnitsExpression.Swallow;
begin
{*
 006864FC    push        ebx
 006864FD    mov         ebx,eax
 006864FF    mov         eax,ebx
 00686501    call        TExpression.Swallow
 00686506    mov         eax,dword ptr [ebx+18];TInUnitsExpression.expression:TExpression
 00686509    mov         edx,dword ptr [eax]
 0068650B    call        dword ptr [edx+88];TExpression.Swallow
 00686511    pop         ebx
 00686512    ret
*}
end;

//00686514
{*procedure TInUnitsExpression.ToString(?:?);
begin
 00686514    push        ebp
 00686515    mov         ebp,esp
 00686517    push        0
 00686519    push        0
 0068651B    push        ebx
 0068651C    push        esi
 0068651D    mov         esi,edx
 0068651F    mov         ebx,eax
 00686521    xor         eax,eax
 00686523    push        ebp
 00686524    push        68657B
 00686529    push        dword ptr fs:[eax]
 0068652C    mov         dword ptr fs:[eax],esp
 0068652F    push        686594;'('
 00686534    lea         edx,[ebp-4]
 00686537    mov         eax,dword ptr [ebx+18];TInUnitsExpression.expression:TExpression
 0068653A    mov         ecx,dword ptr [eax]
 0068653C    call        dword ptr [ecx-24];TExpression.ToString
 0068653F    push        dword ptr [ebp-4]
 00686542    push        6865A4;') in '
 00686547    lea         edx,[ebp-8]
 0068654A    mov         eax,ebx
 0068654C    call        TExpression.GetUnitsString
 00686551    push        dword ptr [ebp-8]
 00686554    mov         eax,esi
 00686556    mov         edx,4
 0068655B    call        @UStrCatN
 00686560    xor         eax,eax
 00686562    pop         edx
 00686563    pop         ecx
 00686564    pop         ecx
 00686565    mov         dword ptr fs:[eax],edx
 00686568    push        686582
 0068656D    lea         eax,[ebp-8]
 00686570    mov         edx,2
 00686575    call        @UStrArrayClr
 0068657A    ret
>0068657B    jmp         @HandleFinally
>00686580    jmp         0068656D
 00686582    pop         esi
 00686583    pop         ebx
 00686584    pop         ecx
 00686585    pop         ecx
 00686586    pop         ebp
 00686587    ret
end;*}

//006865B0
function TBinaryOp.GetDataType:TDataType;
begin
{*
 006865B0    push        esi
 006865B1    push        ecx
 006865B2    mov         esi,eax
 006865B4    mov         eax,esi
 006865B6    call        TBinaryOp.ReturnsBoolean
 006865BB    test        al,al
>006865BD    je          006865C4
 006865BF    mov         al,3
 006865C1    pop         edx
 006865C2    pop         esi
 006865C3    ret
 006865C4    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006865C7    mov         edx,dword ptr [eax]
 006865C9    call        dword ptr [edx+44];TExpression.GetDataType
 006865CC    mov         byte ptr [esp],al
 006865CF    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006865D2    mov         edx,dword ptr [eax]
 006865D4    call        dword ptr [edx+44];TExpression.GetDataType
 006865D7    cmp         byte ptr [esp],3
>006865DB    jne         006865E6
 006865DD    cmp         al,3
>006865DF    jne         006865E6
 006865E1    mov         al,3
 006865E3    pop         edx
 006865E4    pop         esi
 006865E5    ret
 006865E6    cmp         byte ptr [esp],4
>006865EA    je          006865F0
 006865EC    cmp         al,4
>006865EE    jne         006865F5
 006865F0    mov         al,4
 006865F2    pop         edx
 006865F3    pop         esi
 006865F4    ret
 006865F5    movzx       edx,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 006865F9    sub         dl,5
>006865FC    je          0068660C
 006865FE    add         dl,0F9
 00686601    sub         dl,2
>00686604    jb          0068660C
 00686606    dec         edx
 00686607    sub         dl,3
>0068660A    jae         00686611
 0068660C    mov         al,2
 0068660E    pop         edx
 0068660F    pop         esi
 00686610    ret
 00686611    cmp         byte ptr [esp],7
>00686615    jne         0068661F
 00686617    cmp         al,5
>00686619    jne         0068661F
 0068661B    mov         al,7
>0068661D    jmp         0068662D
 0068661F    cmp         byte ptr [esp],5
>00686623    jne         0068662D
 00686625    cmp         al,7
>00686627    jne         0068662D
 00686629    mov         byte ptr [esp],7
 0068662D    cmp         byte ptr [esp],6
>00686631    jne         0068663E
 00686633    cmp         al,6
>00686635    jne         0068663E
 00686637    mov         al,6
>00686639    jmp         00686739
 0068663E    cmp         byte ptr [esp],6
>00686642    jne         00686648
 00686644    cmp         al,5
>00686646    je          00686652
 00686648    cmp         byte ptr [esp],5
>0068664C    jne         00686659
 0068664E    cmp         al,6
>00686650    jne         00686659
 00686652    mov         al,5
>00686654    jmp         00686739
 00686659    cmp         byte ptr [esp],6
>0068665D    jne         00686663
 0068665F    cmp         al,7
>00686661    je          0068666D
 00686663    cmp         byte ptr [esp],7
>00686667    jne         00686674
 00686669    cmp         al,6
>0068666B    jne         00686674
 0068666D    mov         al,7
>0068666F    jmp         00686739
 00686674    cmp         byte ptr [esp],6
>00686678    je          0068667E
 0068667A    cmp         al,6
>0068667C    jne         00686685
 0068667E    mov         al,6
>00686680    jmp         00686739
 00686685    cmp         byte ptr [esp],5
>00686689    jne         006866A5
 0068668B    cmp         al,5
>0068668D    jne         006866A5
 0068668F    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 00686693    sub         al,3
>00686695    jae         0068669E
 00686697    mov         al,5
>00686699    jmp         00686739
 0068669E    xor         eax,eax
>006866A0    jmp         00686739
 006866A5    cmp         byte ptr [esp],7
>006866A9    jne         006866BF
 006866AB    cmp         al,7
>006866AD    jne         006866BF
 006866AF    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 006866B3    sub         al,4
>006866B5    jae         006866BB
 006866B7    mov         al,7
>006866B9    jmp         00686739
 006866BB    xor         eax,eax
>006866BD    jmp         00686739
 006866BF    cmp         byte ptr [esp],5
>006866C3    je          006866CB
 006866C5    cmp         byte ptr [esp],7
>006866C9    jne         006866DD
 006866CB    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 006866CF    sub         al,7
>006866D1    jae         006866D9
 006866D3    movzx       eax,byte ptr [esp]
>006866D7    jmp         00686739
 006866D9    xor         eax,eax
>006866DB    jmp         00686739
 006866DD    cmp         al,5
>006866DF    je          006866E5
 006866E1    cmp         al,7
>006866E3    jne         006866FA
 006866E5    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 006866E9    sub         al,4
>006866EB    jb          006866F2
 006866ED    dec         eax
 006866EE    sub         al,3
>006866F0    jae         006866F6
 006866F2    mov         al,7
>006866F4    jmp         00686739
 006866F6    xor         eax,eax
>006866F8    jmp         00686739
 006866FA    movzx       edx,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 006866FE    cmp         dl,3
>00686701    je          00686708
 00686703    cmp         dl,7
>00686706    jne         0068670D
 00686708    xor         eax,eax
 0068670A    pop         edx
 0068670B    pop         esi
 0068670C    ret
 0068670D    cmp         byte ptr [esp],1
>00686711    je          00686717
 00686713    cmp         al,1
>00686715    jne         0068671B
 00686717    mov         al,1
>00686719    jmp         00686739
 0068671B    cmp         byte ptr [esp],0
>0068671F    je          00686725
 00686721    test        al,al
>00686723    jne         00686729
 00686725    xor         eax,eax
>00686727    jmp         00686739
 00686729    cmp         byte ptr [esp],2
>0068672D    je          00686733
 0068672F    cmp         al,2
>00686731    jne         00686737
 00686733    mov         al,2
>00686735    jmp         00686739
 00686737    xor         eax,eax
 00686739    pop         edx
 0068673A    pop         esi
 0068673B    ret
*}
end;

//0068673C
procedure TBinaryOp.GetDivUnits(var u:TUnits; var p1:TUnits; var p2:TUnits);
begin
{*
 0068673C    push        ebp
 0068673D    mov         ebp,esp
 0068673F    add         esp,0FFFFFFF4
 00686742    push        ebx
 00686743    push        esi
 00686744    push        edi
 00686745    mov         dword ptr [ebp-4],ecx
 00686748    mov         edi,edx
 0068674A    mov         esi,eax
 0068674C    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 0068674F    mov         edx,dword ptr [eax]
 00686751    call        dword ptr [edx+48];TExpression.GetUnits
 00686754    mov         ebx,eax
 00686756    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00686759    mov         edx,dword ptr [eax]
 0068675B    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 0068675E    mov         byte ptr [ebp-5],al
 00686761    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00686764    mov         edx,dword ptr [eax]
 00686766    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00686769    mov         byte ptr [ebp-6],al
 0068676C    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 0068676F    mov         edx,dword ptr [eax]
 00686771    call        dword ptr [edx+48];TExpression.GetUnits
 00686774    mov         byte ptr [ebp-7],al
 00686777    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 0068677A    mov         edx,dword ptr [eax]
 0068677C    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 0068677F    mov         byte ptr [ebp-8],al
 00686782    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00686785    mov         edx,dword ptr [eax]
 00686787    call        dword ptr [edx+50];TExpression.GetPerUnits2
 0068678A    mov         byte ptr [ebp-9],al
 0068678D    mov         eax,ebx
 0068678F    call        00682E34
 00686794    cmp         al,6
>00686796    jne         006867CF
 00686798    movzx       eax,byte ptr [ebp-5]
 0068679C    call        00682E34
 006867A1    cmp         al,2
>006867A3    jne         006867CF
 006867A5    movzx       eax,byte ptr [ebp-6]
 006867A9    call        00682E34
 006867AE    cmp         al,2
>006867B0    jne         006867CF
 006867B2    movzx       eax,byte ptr [ebp-7]
 006867B6    call        00682E34
 006867BB    cmp         al,5
>006867BD    jne         006867CF
 006867BF    xor         ebx,ebx
 006867C1    mov         byte ptr [ebp-5],0
 006867C5    mov         byte ptr [ebp-6],0
 006867C9    mov         byte ptr [ebp-7],0
>006867CD    jmp         0068680F
 006867CF    movzx       eax,byte ptr [ebp-7]
 006867D3    call        00682E34
 006867D8    cmp         al,6
>006867DA    jne         0068680F
 006867DC    movzx       eax,byte ptr [ebp-8]
 006867E0    call        00682E34
 006867E5    cmp         al,2
>006867E7    jne         0068680F
 006867E9    movzx       eax,byte ptr [ebp-9]
 006867ED    call        00682E34
 006867F2    cmp         al,2
>006867F4    jne         0068680F
 006867F6    mov         eax,ebx
 006867F8    call        00682E34
 006867FD    cmp         al,5
>006867FF    jne         0068680F
 00686801    mov         byte ptr [ebp-7],0
 00686805    mov         byte ptr [ebp-8],0
 00686809    mov         byte ptr [ebp-9],0
 0068680D    xor         ebx,ebx
 0068680F    mov         eax,ebx
 00686811    call        00682E34
 00686816    push        eax
 00686817    movzx       eax,byte ptr [ebp-7]
 0068681B    call        00682E34
 00686820    pop         edx
 00686821    cmp         dl,al
>00686823    jne         0068682D
 00686825    xor         ebx,ebx
 00686827    mov         byte ptr [ebp-7],0
>0068682B    jmp         006868AB
 0068682D    mov         eax,ebx
 0068682F    call        00682E34
 00686834    cmp         al,1
>00686836    jne         0068684D
 00686838    movzx       eax,byte ptr [ebp-7]
 0068683C    call        00682E34
 00686841    cmp         al,6
>00686843    jne         0068684D
 00686845    xor         ebx,ebx
 00686847    mov         byte ptr [ebp-7],28
>0068684B    jmp         006868AB
 0068684D    mov         eax,ebx
 0068684F    call        00682E34
 00686854    cmp         al,5
>00686856    jne         0068686D
 00686858    movzx       eax,byte ptr [ebp-7]
 0068685C    call        00682E34
 00686861    cmp         al,6
>00686863    jne         0068686D
 00686865    xor         ebx,ebx
 00686867    mov         byte ptr [ebp-7],5
>0068686B    jmp         006868AB
 0068686D    movzx       eax,byte ptr [ebp-7]
 00686871    call        00682E34
 00686876    cmp         al,1
>00686878    jne         0068688D
 0068687A    mov         eax,ebx
 0068687C    call        00682E34
 00686881    cmp         al,6
>00686883    jne         0068688D
 00686885    mov         byte ptr [ebp-7],0
 00686889    mov         bl,28
>0068688B    jmp         006868AB
 0068688D    movzx       eax,byte ptr [ebp-7]
 00686891    call        00682E34
 00686896    cmp         al,5
>00686898    jne         006868AB
 0068689A    mov         eax,ebx
 0068689C    call        00682E34
 006868A1    cmp         al,6
>006868A3    jne         006868AB
 006868A5    mov         byte ptr [ebp-7],0
 006868A9    mov         bl,5
 006868AB    movzx       eax,byte ptr [ebp-5]
 006868AF    call        00682E34
 006868B4    push        eax
 006868B5    movzx       eax,byte ptr [ebp-8]
 006868B9    call        00682E34
 006868BE    pop         edx
 006868BF    cmp         dl,al
>006868C1    jne         006868CB
 006868C3    mov         byte ptr [ebp-5],0
 006868C7    mov         byte ptr [ebp-8],0
 006868CB    movzx       eax,byte ptr [ebp-5]
 006868CF    call        00682E34
 006868D4    push        eax
 006868D5    movzx       eax,byte ptr [ebp-9]
 006868D9    call        00682E34
 006868DE    pop         edx
 006868DF    cmp         dl,al
>006868E1    jne         006868EB
 006868E3    mov         byte ptr [ebp-5],0
 006868E7    mov         byte ptr [ebp-9],0
 006868EB    movzx       eax,byte ptr [ebp-6]
 006868EF    call        00682E34
 006868F4    push        eax
 006868F5    movzx       eax,byte ptr [ebp-8]
 006868F9    call        00682E34
 006868FE    pop         edx
 006868FF    cmp         dl,al
>00686901    jne         0068690B
 00686903    mov         byte ptr [ebp-6],0
 00686907    mov         byte ptr [ebp-8],0
 0068690B    movzx       eax,byte ptr [ebp-6]
 0068690F    call        00682E34
 00686914    push        eax
 00686915    movzx       eax,byte ptr [ebp-9]
 00686919    call        00682E34
 0068691E    pop         edx
 0068691F    cmp         dl,al
>00686921    jne         0068692B
 00686923    mov         byte ptr [ebp-6],0
 00686927    mov         byte ptr [ebp-9],0
 0068692B    mov         eax,ebx
 0068692D    call        00682E34
 00686932    test        al,al
>00686934    jne         0068693E
 00686936    movzx       ebx,byte ptr [ebp-8]
 0068693A    mov         byte ptr [ebp-8],0
 0068693E    mov         eax,ebx
 00686940    call        00682E34
 00686945    test        al,al
>00686947    jne         00686951
 00686949    movzx       ebx,byte ptr [ebp-9]
 0068694D    mov         byte ptr [ebp-9],0
 00686951    movzx       eax,byte ptr [ebp-5]
 00686955    call        00682E34
 0068695A    test        al,al
>0068695C    jne         00686967
 0068695E    movzx       eax,byte ptr [ebp-7]
 00686962    mov         byte ptr [ebp-5],al
>00686965    jmp         0068697B
 00686967    movzx       eax,byte ptr [ebp-6]
 0068696B    call        00682E34
 00686970    test        al,al
>00686972    jne         0068697B
 00686974    movzx       eax,byte ptr [ebp-7]
 00686978    mov         byte ptr [ebp-6],al
 0068697B    mov         eax,ebx
 0068697D    call        00682E34
 00686982    cmp         al,1
>00686984    jne         00686993
 00686986    movzx       eax,byte ptr [ebp-8]
 0068698A    call        00682E34
 0068698F    cmp         al,5
>00686991    je          006869AB
 00686993    movzx       eax,byte ptr [ebp-8]
 00686997    call        00682E34
 0068699C    cmp         al,1
>0068699E    jne         006869AF
 006869A0    mov         eax,ebx
 006869A2    call        00682E34
 006869A7    cmp         al,5
>006869A9    jne         006869AF
 006869AB    mov         bl,2E
>006869AD    jmp         006869E1
 006869AF    mov         eax,ebx
 006869B1    call        00682E34
 006869B6    cmp         al,1
>006869B8    jne         006869C7
 006869BA    movzx       eax,byte ptr [ebp-9]
 006869BE    call        00682E34
 006869C3    cmp         al,5
>006869C5    je          006869DF
 006869C7    movzx       eax,byte ptr [ebp-9]
 006869CB    call        00682E34
 006869D0    cmp         al,1
>006869D2    jne         006869E1
 006869D4    mov         eax,ebx
 006869D6    call        00682E34
 006869DB    cmp         al,5
>006869DD    jne         006869E1
 006869DF    mov         bl,2E
 006869E1    movzx       eax,byte ptr [ebp-7]
 006869E5    call        00682E34
 006869EA    cmp         al,1
>006869EC    jne         006869FB
 006869EE    movzx       eax,byte ptr [ebp-5]
 006869F2    call        00682E34
 006869F7    cmp         al,5
>006869F9    je          00686A15
 006869FB    movzx       eax,byte ptr [ebp-5]
 006869FF    call        00682E34
 00686A04    cmp         al,1
>00686A06    jne         00686A1B
 00686A08    movzx       eax,byte ptr [ebp-7]
 00686A0C    call        00682E34
 00686A11    cmp         al,5
>00686A13    jne         00686A1B
 00686A15    mov         byte ptr [ebp-5],2E
>00686A19    jmp         00686A94
 00686A1B    movzx       eax,byte ptr [ebp-7]
 00686A1F    call        00682E34
 00686A24    cmp         al,1
>00686A26    jne         00686A35
 00686A28    movzx       eax,byte ptr [ebp-6]
 00686A2C    call        00682E34
 00686A31    cmp         al,5
>00686A33    je          00686A4F
 00686A35    movzx       eax,byte ptr [ebp-6]
 00686A39    call        00682E34
 00686A3E    cmp         al,1
>00686A40    jne         00686A55
 00686A42    movzx       eax,byte ptr [ebp-7]
 00686A46    call        00682E34
 00686A4B    cmp         al,5
>00686A4D    jne         00686A55
 00686A4F    mov         byte ptr [ebp-6],2E
>00686A53    jmp         00686A94
 00686A55    movzx       eax,byte ptr [ebp-5]
 00686A59    call        00682E34
 00686A5E    cmp         al,1
>00686A60    jne         00686A6F
 00686A62    movzx       eax,byte ptr [ebp-6]
 00686A66    call        00682E34
 00686A6B    cmp         al,5
>00686A6D    je          00686A89
 00686A6F    movzx       eax,byte ptr [ebp-6]
 00686A73    call        00682E34
 00686A78    cmp         al,1
>00686A7A    jne         00686A94
 00686A7C    movzx       eax,byte ptr [ebp-5]
 00686A80    call        00682E34
 00686A85    cmp         al,5
>00686A87    jne         00686A94
 00686A89    mov         byte ptr [ebp-5],2E
 00686A8D    movzx       eax,byte ptr [ebp-7]
 00686A91    mov         byte ptr [ebp-6],al
 00686A94    mov         byte ptr [edi],bl
 00686A96    mov         eax,dword ptr [ebp-4]
 00686A99    movzx       edx,byte ptr [ebp-5]
 00686A9D    mov         byte ptr [eax],dl
 00686A9F    mov         eax,dword ptr [ebp+8]
 00686AA2    movzx       edx,byte ptr [ebp-6]
 00686AA6    mov         byte ptr [eax],dl
 00686AA8    pop         edi
 00686AA9    pop         esi
 00686AAA    pop         ebx
 00686AAB    mov         esp,ebp
 00686AAD    pop         ebp
 00686AAE    ret         4
*}
end;

//00686AB4
function TBinaryOp.GetPerUnits1:TUnits;
begin
{*
 00686AB4    push        ebx
 00686AB5    push        ecx
 00686AB6    mov         ebx,eax
 00686AB8    movzx       eax,byte ptr [ebx+20];TBinaryOp.Operation:TOperation
 00686ABC    cmp         al,7
>00686ABE    jne         00686AD0
 00686AC0    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686AC3    mov         edx,dword ptr [eax]
 00686AC5    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00686AC8    mov         byte ptr [esp],al
>00686ACB    jmp         00686B92
 00686AD0    cmp         al,4
>00686AD2    jne         00686AE4
 00686AD4    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686AD7    mov         edx,dword ptr [eax]
 00686AD9    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00686ADC    mov         byte ptr [esp],al
>00686ADF    jmp         00686B92
 00686AE4    cmp         al,2
>00686AE6    jne         00686B43
 00686AE8    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686AEB    mov         edx,dword ptr [eax]
 00686AED    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00686AF0    test        al,al
>00686AF2    jne         00686B04
 00686AF4    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686AF7    mov         edx,dword ptr [eax]
 00686AF9    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00686AFC    mov         byte ptr [esp],al
>00686AFF    jmp         00686B92
 00686B04    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686B07    mov         edx,dword ptr [eax]
 00686B09    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00686B0C    push        eax
 00686B0D    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686B10    mov         edx,dword ptr [eax]
 00686B12    call        dword ptr [edx+48];TExpression.GetUnits
 00686B15    pop         edx
 00686B16    cmp         dl,al
>00686B18    jne         00686B36
 00686B1A    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686B1D    mov         edx,dword ptr [eax]
 00686B1F    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00686B22    push        eax
 00686B23    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686B26    mov         edx,dword ptr [eax]
 00686B28    call        dword ptr [edx+48];TExpression.GetUnits
 00686B2B    pop         edx
 00686B2C    cmp         dl,al
>00686B2E    je          00686B36
 00686B30    mov         byte ptr [esp],0
>00686B34    jmp         00686B92
 00686B36    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686B39    mov         edx,dword ptr [eax]
 00686B3B    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00686B3E    mov         byte ptr [esp],al
>00686B41    jmp         00686B92
 00686B43    cmp         al,3
>00686B45    jne         00686B5D
 00686B47    lea         eax,[esp+2]
 00686B4B    push        eax
 00686B4C    lea         ecx,[esp+4]
 00686B50    lea         edx,[esp+5]
 00686B54    mov         eax,ebx
 00686B56    call        TBinaryOp.GetDivUnits
>00686B5B    jmp         00686B92
 00686B5D    mov         eax,ebx
 00686B5F    call        TBinaryOp.ReturnsUnits
 00686B64    test        al,al
>00686B66    jne         00686B6E
 00686B68    mov         byte ptr [esp],0
>00686B6C    jmp         00686B92
 00686B6E    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686B71    call        TExpression.HasUnits
 00686B76    test        al,al
>00686B78    je          00686B87
 00686B7A    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686B7D    mov         edx,dword ptr [eax]
 00686B7F    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00686B82    mov         byte ptr [esp],al
>00686B85    jmp         00686B92
 00686B87    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686B8A    mov         edx,dword ptr [eax]
 00686B8C    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00686B8F    mov         byte ptr [esp],al
 00686B92    movzx       eax,byte ptr [esp]
 00686B96    pop         edx
 00686B97    pop         ebx
 00686B98    ret
*}
end;

//00686B9C
function TBinaryOp.GetPerUnits2:TUnits;
begin
{*
 00686B9C    push        ebx
 00686B9D    push        ecx
 00686B9E    mov         ebx,eax
 00686BA0    movzx       eax,byte ptr [ebx+20];TBinaryOp.Operation:TOperation
 00686BA4    cmp         al,7
>00686BA6    jne         00686BB8
 00686BA8    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686BAB    mov         edx,dword ptr [eax]
 00686BAD    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00686BB0    mov         byte ptr [esp],al
>00686BB3    jmp         00686C5D
 00686BB8    cmp         al,4
>00686BBA    jne         00686BCC
 00686BBC    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686BBF    mov         edx,dword ptr [eax]
 00686BC1    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00686BC4    mov         byte ptr [esp],al
>00686BC7    jmp         00686C5D
 00686BCC    cmp         al,2
>00686BCE    jne         00686C12
 00686BD0    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686BD3    mov         edx,dword ptr [eax]
 00686BD5    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00686BD8    test        al,al
>00686BDA    jne         00686BE9
 00686BDC    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686BDF    mov         edx,dword ptr [eax]
 00686BE1    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00686BE4    mov         byte ptr [esp],al
>00686BE7    jmp         00686C5D
 00686BE9    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686BEC    mov         edx,dword ptr [eax]
 00686BEE    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00686BF1    push        eax
 00686BF2    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686BF5    mov         edx,dword ptr [eax]
 00686BF7    call        dword ptr [edx+48];TExpression.GetUnits
 00686BFA    pop         edx
 00686BFB    cmp         dl,al
>00686BFD    jne         00686C05
 00686BFF    mov         byte ptr [esp],0
>00686C03    jmp         00686C5D
 00686C05    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686C08    mov         edx,dword ptr [eax]
 00686C0A    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00686C0D    mov         byte ptr [esp],al
>00686C10    jmp         00686C5D
 00686C12    cmp         al,3
>00686C14    jne         00686C28
 00686C16    push        esp
 00686C17    lea         ecx,[esp+6]
 00686C1B    lea         edx,[esp+5]
 00686C1F    mov         eax,ebx
 00686C21    call        TBinaryOp.GetDivUnits
>00686C26    jmp         00686C5D
 00686C28    mov         eax,ebx
 00686C2A    call        TBinaryOp.ReturnsUnits
 00686C2F    test        al,al
>00686C31    jne         00686C39
 00686C33    mov         byte ptr [esp],0
>00686C37    jmp         00686C5D
 00686C39    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686C3C    call        TExpression.HasUnits
 00686C41    test        al,al
>00686C43    je          00686C52
 00686C45    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686C48    mov         edx,dword ptr [eax]
 00686C4A    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00686C4D    mov         byte ptr [esp],al
>00686C50    jmp         00686C5D
 00686C52    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686C55    mov         edx,dword ptr [eax]
 00686C57    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00686C5A    mov         byte ptr [esp],al
 00686C5D    movzx       eax,byte ptr [esp]
 00686C61    pop         edx
 00686C62    pop         ebx
 00686C63    ret
*}
end;

//00686C64
{*procedure TBinaryOp.GetString(?:?);
begin
 00686C64    push        ebp
 00686C65    mov         ebp,esp
 00686C67    push        0
 00686C69    push        0
 00686C6B    push        0
 00686C6D    push        ebx
 00686C6E    push        esi
 00686C6F    mov         dword ptr [ebp-4],edx
 00686C72    mov         esi,eax
 00686C74    xor         eax,eax
 00686C76    push        ebp
 00686C77    push        686D00
 00686C7C    push        dword ptr fs:[eax]
 00686C7F    mov         dword ptr fs:[eax],esp
 00686C82    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00686C85    mov         edx,dword ptr [eax]
 00686C87    call        dword ptr [edx+44];TExpression.GetDataType
 00686C8A    mov         ebx,eax
 00686C8C    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00686C8F    mov         edx,dword ptr [eax]
 00686C91    call        dword ptr [edx+44];TExpression.GetDataType
 00686C94    cmp         bl,4
>00686C97    je          00686C9D
 00686C99    cmp         al,4
>00686C9B    jne         00686CDB
 00686C9D    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 00686CA1    add         al,0EE
 00686CA3    sub         al,0C
>00686CA5    jae         00686CB3
 00686CA7    mov         edx,dword ptr [ebp-4]
 00686CAA    mov         eax,esi
 00686CAC    call        TExpression.GetString
>00686CB1    jmp         00686CE5
 00686CB3    lea         edx,[ebp-8]
 00686CB6    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00686CB9    mov         ecx,dword ptr [eax]
 00686CBB    call        dword ptr [ecx+0C];TExpression.EvaluateString
 00686CBE    mov         eax,dword ptr [ebp-8]
 00686CC1    push        eax
 00686CC2    lea         edx,[ebp-0C]
 00686CC5    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00686CC8    mov         ecx,dword ptr [eax]
 00686CCA    call        dword ptr [ecx+0C];TExpression.EvaluateString
 00686CCD    mov         edx,dword ptr [ebp-0C]
 00686CD0    mov         eax,dword ptr [ebp-4]
 00686CD3    pop         ecx
 00686CD4    call        @UStrCat3
>00686CD9    jmp         00686CE5
 00686CDB    mov         edx,dword ptr [ebp-4]
 00686CDE    mov         eax,esi
 00686CE0    call        TExpression.GetString
 00686CE5    xor         eax,eax
 00686CE7    pop         edx
 00686CE8    pop         ecx
 00686CE9    pop         ecx
 00686CEA    mov         dword ptr fs:[eax],edx
 00686CED    push        686D07
 00686CF2    lea         eax,[ebp-0C]
 00686CF5    mov         edx,2
 00686CFA    call        @UStrArrayClr
 00686CFF    ret
>00686D00    jmp         @HandleFinally
>00686D05    jmp         00686CF2
 00686D07    pop         esi
 00686D08    pop         ebx
 00686D09    mov         esp,ebp
 00686D0B    pop         ebp
 00686D0C    ret
end;*}

//00686D10
function TBinaryOp.GetUnits:TUnits;
begin
{*
 00686D10    push        ebx
 00686D11    push        ecx
 00686D12    mov         ebx,eax
 00686D14    movzx       eax,byte ptr [ebx+20];TBinaryOp.Operation:TOperation
 00686D18    cmp         al,7
>00686D1A    jne         00686D2C
 00686D1C    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686D1F    mov         edx,dword ptr [eax]
 00686D21    call        dword ptr [edx+48];TExpression.GetUnits
 00686D24    mov         byte ptr [esp],al
>00686D27    jmp         00686E4F
 00686D2C    cmp         al,4
>00686D2E    jne         00686D40
 00686D30    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686D33    mov         edx,dword ptr [eax]
 00686D35    call        dword ptr [edx+48];TExpression.GetUnits
 00686D38    mov         byte ptr [esp],al
>00686D3B    jmp         00686E4F
 00686D40    cmp         al,2
>00686D42    jne         00686E00
 00686D48    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686D4B    mov         edx,dword ptr [eax]
 00686D4D    call        dword ptr [edx+48];TExpression.GetUnits
 00686D50    test        al,al
>00686D52    jne         00686D64
 00686D54    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686D57    mov         edx,dword ptr [eax]
 00686D59    call        dword ptr [edx+48];TExpression.GetUnits
 00686D5C    mov         byte ptr [esp],al
>00686D5F    jmp         00686E4F
 00686D64    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686D67    mov         edx,dword ptr [eax]
 00686D69    call        dword ptr [edx+48];TExpression.GetUnits
 00686D6C    push        eax
 00686D6D    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686D70    mov         edx,dword ptr [eax]
 00686D72    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00686D75    pop         edx
 00686D76    cmp         dl,al
>00686D78    je          00686D90
 00686D7A    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686D7D    mov         edx,dword ptr [eax]
 00686D7F    call        dword ptr [edx+48];TExpression.GetUnits
 00686D82    push        eax
 00686D83    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686D86    mov         edx,dword ptr [eax]
 00686D88    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00686D8B    pop         edx
 00686D8C    cmp         dl,al
>00686D8E    jne         00686D99
 00686D90    mov         byte ptr [esp],0
>00686D94    jmp         00686E4F
 00686D99    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686D9C    mov         edx,dword ptr [eax]
 00686D9E    call        dword ptr [edx+48];TExpression.GetUnits
 00686DA1    xor         ecx,ecx
 00686DA3    xor         edx,edx
 00686DA5    call        00682E84
 00686DAA    test        al,al
>00686DAC    je          00686DC3
 00686DAE    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686DB1    mov         edx,dword ptr [eax]
 00686DB3    call        dword ptr [edx+48];TExpression.GetUnits
 00686DB6    xor         ecx,ecx
 00686DB8    xor         edx,edx
 00686DBA    call        00682EA4
 00686DBF    test        al,al
>00686DC1    jne         00686DED
 00686DC3    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686DC6    mov         edx,dword ptr [eax]
 00686DC8    call        dword ptr [edx+48];TExpression.GetUnits
 00686DCB    xor         ecx,ecx
 00686DCD    xor         edx,edx
 00686DCF    call        00682EA4
 00686DD4    test        al,al
>00686DD6    je          00686DF3
 00686DD8    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686DDB    mov         edx,dword ptr [eax]
 00686DDD    call        dword ptr [edx+48];TExpression.GetUnits
 00686DE0    xor         ecx,ecx
 00686DE2    xor         edx,edx
 00686DE4    call        00682E84
 00686DE9    test        al,al
>00686DEB    je          00686DF3
 00686DED    mov         byte ptr [esp],2E
>00686DF1    jmp         00686E4F
 00686DF3    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686DF6    mov         edx,dword ptr [eax]
 00686DF8    call        dword ptr [edx+48];TExpression.GetUnits
 00686DFB    mov         byte ptr [esp],al
>00686DFE    jmp         00686E4F
 00686E00    cmp         al,3
>00686E02    jne         00686E1A
 00686E04    lea         eax,[esp+2]
 00686E08    push        eax
 00686E09    lea         ecx,[esp+5]
 00686E0D    lea         edx,[esp+4]
 00686E11    mov         eax,ebx
 00686E13    call        TBinaryOp.GetDivUnits
>00686E18    jmp         00686E4F
 00686E1A    mov         eax,ebx
 00686E1C    call        TBinaryOp.ReturnsUnits
 00686E21    test        al,al
>00686E23    jne         00686E2B
 00686E25    mov         byte ptr [esp],0
>00686E29    jmp         00686E4F
 00686E2B    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686E2E    call        TExpression.HasUnits
 00686E33    test        al,al
>00686E35    je          00686E44
 00686E37    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00686E3A    mov         edx,dword ptr [eax]
 00686E3C    call        dword ptr [edx+48];TExpression.GetUnits
 00686E3F    mov         byte ptr [esp],al
>00686E42    jmp         00686E4F
 00686E44    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00686E47    mov         edx,dword ptr [eax]
 00686E49    call        dword ptr [edx+48];TExpression.GetUnits
 00686E4C    mov         byte ptr [esp],al
 00686E4F    movzx       eax,byte ptr [esp]
 00686E53    pop         edx
 00686E54    pop         ebx
 00686E55    ret
*}
end;

//00686E58
function TBinaryOp.ReturnsUnits:Boolean;
begin
{*
 00686E58    movzx       eax,byte ptr [eax+20];TBinaryOp.Operation:TOperation
 00686E5C    sub         al,5
>00686E5E    jb          00686E71
 00686E60    sub         al,1
>00686E62    je          00686E71
 00686E64    add         al,0F6
 00686E66    sub         al,2
>00686E68    jb          00686E71
 00686E6A    sub         al,0D
>00686E6C    je          00686E71
 00686E6E    xor         eax,eax
 00686E70    ret
 00686E71    mov         al,1
 00686E73    ret
*}
end;

//00686E74
procedure TBinaryOp.GetValue;
begin
{*
 00686E74    push        ebp
 00686E75    mov         ebp,esp
 00686E77    mov         ecx,2D
 00686E7C    push        0
 00686E7E    push        0
 00686E80    dec         ecx
>00686E81    jne         00686E7C
 00686E83    push        ecx
 00686E84    push        ebx
 00686E85    push        esi
 00686E86    mov         esi,eax
 00686E88    xor         eax,eax
 00686E8A    push        ebp
 00686E8B    push        687E87
 00686E90    push        dword ptr fs:[eax]
 00686E93    mov         dword ptr fs:[eax],esp
 00686E96    mov         eax,esi
 00686E98    mov         edx,dword ptr [eax]
 00686E9A    call        dword ptr [edx+44];TBinaryOp.GetDataType
 00686E9D    cmp         al,5
>00686E9F    jne         00686ED2
 00686EA1    lea         eax,[ebp-30]
 00686EA4    push        eax
 00686EA5    lea         ecx,[ebp-28]
 00686EA8    lea         edx,[ebp-20]
 00686EAB    mov         eax,esi
 00686EAD    mov         ebx,dword ptr [eax]
 00686EAF    call        dword ptr [ebx+3C];TBinaryOp.GetVector
 00686EB2    push        dword ptr [ebp-1C]
 00686EB5    push        dword ptr [ebp-20]
 00686EB8    push        dword ptr [ebp-24]
 00686EBB    push        dword ptr [ebp-28]
 00686EBE    push        dword ptr [ebp-2C]
 00686EC1    push        dword ptr [ebp-30]
 00686EC4    call        005C4070
 00686EC9    fstp        qword ptr [ebp-8]
 00686ECC    wait
>00686ECD    jmp         00687E69
 00686ED2    mov         eax,esi
 00686ED4    mov         edx,dword ptr [eax]
 00686ED6    call        dword ptr [edx+44];TBinaryOp.GetDataType
 00686ED9    cmp         al,7
>00686EDB    jne         00686F06
 00686EDD    lea         eax,[ebp-30]
 00686EE0    push        eax
 00686EE1    lea         ecx,[ebp-28]
 00686EE4    lea         edx,[ebp-20]
 00686EE7    mov         eax,esi
 00686EE9    mov         ebx,dword ptr [eax]
 00686EEB    call        dword ptr [ebx+1C];TExpression.EvaluateColour
 00686EEE    fld         qword ptr [ebp-20]
 00686EF1    fadd        qword ptr [ebp-28]
 00686EF4    fadd        qword ptr [ebp-30]
 00686EF7    fdiv        dword ptr ds:[687E98];3:Single
 00686EFD    fstp        qword ptr [ebp-8]
 00686F00    wait
>00686F01    jmp         00687E69
 00686F06    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 00686F0A    sub         al,8
>00686F0C    je          00686F6D
 00686F0E    dec         al
>00686F10    je          00686FA5
 00686F16    sub         al,2
>00686F18    je          00686FDE
 00686F1E    sub         al,14
>00686F20    jne         00687002
 00686F26    lea         eax,[ebp-30]
 00686F29    push        eax
 00686F2A    lea         ecx,[ebp-28]
 00686F2D    lea         edx,[ebp-20]
 00686F30    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00686F33    mov         ebx,dword ptr [eax]
 00686F35    call        dword ptr [ebx+20];TExpression.EvaluateVector
 00686F38    lea         eax,[ebp-40]
 00686F3B    push        eax
 00686F3C    lea         eax,[ebp-48]
 00686F3F    push        eax
 00686F40    lea         ecx,[ebp-38]
 00686F43    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00686F46    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00686F49    mov         ebx,dword ptr [eax]
 00686F4B    call        dword ptr [ebx+24];TExpression.EvaluateVectorToMatch
 00686F4E    fld         qword ptr [ebp-20]
 00686F51    fmul        qword ptr [ebp-38]
 00686F54    fld         qword ptr [ebp-28]
 00686F57    fmul        qword ptr [ebp-40]
 00686F5A    faddp       st(1),st
 00686F5C    fld         qword ptr [ebp-30]
 00686F5F    fmul        qword ptr [ebp-48]
 00686F62    faddp       st(1),st
 00686F64    fstp        qword ptr [ebp-8]
 00686F67    wait
>00686F68    jmp         00687E69
 00686F6D    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00686F70    mov         edx,dword ptr [eax]
 00686F72    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00686F75    mov         ebx,eax
 00686F77    test        bl,bl
>00686F79    jne         00686F8B
 00686F7B    xor         eax,eax
 00686F7D    call        00686074
 00686F82    fstp        qword ptr [ebp-8]
 00686F85    wait
>00686F86    jmp         00687E69
 00686F8B    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00686F8E    mov         edx,dword ptr [eax]
 00686F90    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00686F93    and         bl,al
 00686F95    mov         eax,ebx
 00686F97    call        00686074
 00686F9C    fstp        qword ptr [ebp-8]
 00686F9F    wait
>00686FA0    jmp         00687E69
 00686FA5    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00686FA8    mov         edx,dword ptr [eax]
 00686FAA    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00686FAD    mov         ebx,eax
 00686FAF    cmp         bl,1
>00686FB2    jne         00686FC4
 00686FB4    mov         al,1
 00686FB6    call        00686074
 00686FBB    fstp        qword ptr [ebp-8]
 00686FBE    wait
>00686FBF    jmp         00687E69
 00686FC4    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00686FC7    mov         edx,dword ptr [eax]
 00686FC9    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00686FCC    or          bl,al
 00686FCE    mov         eax,ebx
 00686FD0    call        00686074
 00686FD5    fstp        qword ptr [ebp-8]
 00686FD8    wait
>00686FD9    jmp         00687E69
 00686FDE    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00686FE1    mov         edx,dword ptr [eax]
 00686FE3    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00686FE6    mov         ebx,eax
 00686FE8    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00686FEB    mov         edx,dword ptr [eax]
 00686FED    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00686FF0    xor         bl,al
 00686FF2    mov         eax,ebx
 00686FF4    call        00686074
 00686FF9    fstp        qword ptr [ebp-8]
 00686FFC    wait
>00686FFD    jmp         00687E69
 00687002    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687005    mov         edx,dword ptr [eax]
 00687007    call        dword ptr [edx+44];TExpression.GetDataType
 0068700A    mov         ebx,eax
 0068700C    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 0068700F    mov         edx,dword ptr [eax]
 00687011    call        dword ptr [edx+44];TExpression.GetDataType
 00687014    cmp         bl,3
>00687017    jne         0068717C
 0068701D    cmp         al,3
>0068701F    jne         0068717C
 00687025    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687028    mov         edx,dword ptr [eax]
 0068702A    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 0068702D    mov         ebx,eax
 0068702F    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687032    mov         edx,dword ptr [eax]
 00687034    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00687037    movzx       edx,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 0068703B    cmp         edx,1D
>0068703E    ja          0068716C
 00687044    movzx       edx,byte ptr [edx+687052]
 0068704B    jmp         dword ptr [edx*4+687070]
 0068704B    db          1
 0068704B    db          1
 0068704B    db          0
 0068704B    db          2
 0068704B    db          0
 0068704B    db          0
 0068704B    db          0
 0068704B    db          0
 0068704B    db          1
 0068704B    db          2
 0068704B    db          0
 0068704B    db          3
 0068704B    db          1
 0068704B    db          2
 0068704B    db          0
 0068704B    db          3
 0068704B    db          0
 0068704B    db          0
 0068704B    db          6
 0068704B    db          7
 0068704B    db          4
 0068704B    db          9
 0068704B    db          8
 0068704B    db          5
 0068704B    db          6
 0068704B    db          7
 0068704B    db          4
 0068704B    db          9
 0068704B    db          8
 0068704B    db          5
 0068704B    dd          0068716C
 0068704B    dd          00687098
 0068704B    dd          006870AA
 0068704B    dd          006870BC
 0068704B    dd          006870CE
 0068704B    dd          006870E1
 0068704B    dd          006870F4
 0068704B    dd          00687110
 0068704B    dd          00687130
 0068704B    dd          0068714C
 00687098    and         bl,al
 0068709A    mov         eax,ebx
 0068709C    call        00686074
 006870A1    fstp        qword ptr [ebp-8]
 006870A4    wait
>006870A5    jmp         00687E69
 006870AA    or          bl,al
 006870AC    mov         eax,ebx
 006870AE    call        00686074
 006870B3    fstp        qword ptr [ebp-8]
 006870B6    wait
>006870B7    jmp         00687E69
 006870BC    xor         bl,al
 006870BE    mov         eax,ebx
 006870C0    call        00686074
 006870C5    fstp        qword ptr [ebp-8]
 006870C8    wait
>006870C9    jmp         00687E69
 006870CE    cmp         al,bl
 006870D0    sete        al
 006870D3    call        00686074
 006870D8    fstp        qword ptr [ebp-8]
 006870DB    wait
>006870DC    jmp         00687E69
 006870E1    cmp         al,bl
 006870E3    setne       al
 006870E6    call        00686074
 006870EB    fstp        qword ptr [ebp-8]
 006870EE    wait
>006870EF    jmp         00687E69
 006870F4    test        al,al
>006870F6    je          006870FC
 006870F8    test        bl,bl
>006870FA    je          00687100
 006870FC    xor         eax,eax
>006870FE    jmp         00687102
 00687100    mov         al,1
 00687102    call        00686074
 00687107    fstp        qword ptr [ebp-8]
 0068710A    wait
>0068710B    jmp         00687E69
 00687110    cmp         al,bl
>00687112    je          00687120
 00687114    test        al,al
>00687116    je          0068711C
 00687118    test        bl,bl
>0068711A    je          00687120
 0068711C    xor         eax,eax
>0068711E    jmp         00687122
 00687120    mov         al,1
 00687122    call        00686074
 00687127    fstp        qword ptr [ebp-8]
 0068712A    wait
>0068712B    jmp         00687E69
 00687130    test        bl,bl
>00687132    je          00687138
 00687134    test        al,al
>00687136    je          0068713C
 00687138    xor         eax,eax
>0068713A    jmp         0068713E
 0068713C    mov         al,1
 0068713E    call        00686074
 00687143    fstp        qword ptr [ebp-8]
 00687146    wait
>00687147    jmp         00687E69
 0068714C    cmp         al,bl
>0068714E    je          0068715C
 00687150    test        bl,bl
>00687152    je          00687158
 00687154    test        al,al
>00687156    je          0068715C
 00687158    xor         eax,eax
>0068715A    jmp         0068715E
 0068715C    mov         al,1
 0068715E    call        00686074
 00687163    fstp        qword ptr [ebp-8]
 00687166    wait
>00687167    jmp         00687E69
 0068716C    xor         eax,eax
 0068716E    call        00686074
 00687173    fstp        qword ptr [ebp-8]
 00687176    wait
>00687177    jmp         00687E69
 0068717C    cmp         bl,4
>0068717F    je          00687189
 00687181    cmp         al,4
>00687183    jne         006875B7
 00687189    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 0068718D    add         eax,0FFFFFFEE
 00687190    cmp         eax,0B
>00687193    ja          006875AA
 00687199    jmp         dword ptr [eax*4+6871A0]
 00687199    dd          006874AA
 00687199    dd          006874EA
 00687199    dd          006871D0
 00687199    dd          0068756A
 00687199    dd          0068752A
 00687199    dd          0068746A
 00687199    dd          006872DA
 00687199    dd          006873A2
 00687199    dd          00687210
 00687199    dd          00687406
 00687199    dd          0068733E
 00687199    dd          00687274
 006871D0    lea         edx,[ebp-0DC]
 006871D6    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006871D9    mov         ecx,dword ptr [eax]
 006871DB    call        dword ptr [ecx+0C];TExpression.EvaluateString
 006871DE    mov         eax,dword ptr [ebp-0DC]
 006871E4    push        eax
 006871E5    lea         edx,[ebp-0E0]
 006871EB    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006871EE    mov         ecx,dword ptr [eax]
 006871F0    call        dword ptr [ecx+0C];TExpression.EvaluateString
 006871F3    mov         edx,dword ptr [ebp-0E0]
 006871F9    pop         eax
 006871FA    call        @UStrEqual
 006871FF    sete        al
 00687202    call        00686074
 00687207    fstp        qword ptr [ebp-8]
 0068720A    wait
>0068720B    jmp         00687E69
 00687210    lea         edx,[ebp-0E8]
 00687216    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687219    mov         ecx,dword ptr [eax]
 0068721B    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068721E    mov         eax,dword ptr [ebp-0E8]
 00687224    lea         edx,[ebp-0E4]
 0068722A    call        Trim
 0068722F    mov         eax,dword ptr [ebp-0E4]
 00687235    push        eax
 00687236    lea         edx,[ebp-0F0]
 0068723C    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 0068723F    mov         ecx,dword ptr [eax]
 00687241    call        dword ptr [ecx+0C];TExpression.EvaluateString
 00687244    mov         eax,dword ptr [ebp-0F0]
 0068724A    lea         edx,[ebp-0EC]
 00687250    call        Trim
 00687255    mov         eax,dword ptr [ebp-0EC]
 0068725B    pop         edx
 0068725C    call        CompareText
 00687261    test        eax,eax
 00687263    sete        al
 00687266    call        00686074
 0068726B    fstp        qword ptr [ebp-8]
 0068726E    wait
>0068726F    jmp         00687E69
 00687274    lea         edx,[ebp-0F8]
 0068727A    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 0068727D    mov         ecx,dword ptr [eax]
 0068727F    call        dword ptr [ecx+0C];TExpression.EvaluateString
 00687282    mov         eax,dword ptr [ebp-0F8]
 00687288    lea         edx,[ebp-0F4]
 0068728E    call        Trim
 00687293    mov         eax,dword ptr [ebp-0F4]
 00687299    push        eax
 0068729A    lea         edx,[ebp-100]
 006872A0    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006872A3    mov         ecx,dword ptr [eax]
 006872A5    call        dword ptr [ecx+0C];TExpression.EvaluateString
 006872A8    mov         eax,dword ptr [ebp-100]
 006872AE    lea         edx,[ebp-0FC]
 006872B4    call        Trim
 006872B9    mov         eax,dword ptr [ebp-0FC]
 006872BF    pop         edx
 006872C0    call        CompareText
 006872C5    test        eax,eax
 006872C7    sete        al
 006872CA    xor         al,1
 006872CC    call        00686074
 006872D1    fstp        qword ptr [ebp-8]
 006872D4    wait
>006872D5    jmp         00687E69
 006872DA    lea         edx,[ebp-108]
 006872E0    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006872E3    mov         ecx,dword ptr [eax]
 006872E5    call        dword ptr [ecx+0C];TExpression.EvaluateString
 006872E8    mov         eax,dword ptr [ebp-108]
 006872EE    lea         edx,[ebp-104]
 006872F4    call        Trim
 006872F9    mov         eax,dword ptr [ebp-104]
 006872FF    push        eax
 00687300    lea         edx,[ebp-110]
 00687306    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687309    mov         ecx,dword ptr [eax]
 0068730B    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068730E    mov         eax,dword ptr [ebp-110]
 00687314    lea         edx,[ebp-10C]
 0068731A    call        Trim
 0068731F    mov         eax,dword ptr [ebp-10C]
 00687325    pop         edx
 00687326    call        CompareText
 0068732B    test        eax,eax
 0068732D    setl        al
 00687330    call        00686074
 00687335    fstp        qword ptr [ebp-8]
 00687338    wait
>00687339    jmp         00687E69
 0068733E    lea         edx,[ebp-118]
 00687344    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687347    mov         ecx,dword ptr [eax]
 00687349    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068734C    mov         eax,dword ptr [ebp-118]
 00687352    lea         edx,[ebp-114]
 00687358    call        Trim
 0068735D    mov         eax,dword ptr [ebp-114]
 00687363    push        eax
 00687364    lea         edx,[ebp-120]
 0068736A    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 0068736D    mov         ecx,dword ptr [eax]
 0068736F    call        dword ptr [ecx+0C];TExpression.EvaluateString
 00687372    mov         eax,dword ptr [ebp-120]
 00687378    lea         edx,[ebp-11C]
 0068737E    call        Trim
 00687383    mov         eax,dword ptr [ebp-11C]
 00687389    pop         edx
 0068738A    call        CompareText
 0068738F    test        eax,eax
 00687391    setg        al
 00687394    call        00686074
 00687399    fstp        qword ptr [ebp-8]
 0068739C    wait
>0068739D    jmp         00687E69
 006873A2    lea         edx,[ebp-128]
 006873A8    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006873AB    mov         ecx,dword ptr [eax]
 006873AD    call        dword ptr [ecx+0C];TExpression.EvaluateString
 006873B0    mov         eax,dword ptr [ebp-128]
 006873B6    lea         edx,[ebp-124]
 006873BC    call        Trim
 006873C1    mov         eax,dword ptr [ebp-124]
 006873C7    push        eax
 006873C8    lea         edx,[ebp-130]
 006873CE    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006873D1    mov         ecx,dword ptr [eax]
 006873D3    call        dword ptr [ecx+0C];TExpression.EvaluateString
 006873D6    mov         eax,dword ptr [ebp-130]
 006873DC    lea         edx,[ebp-12C]
 006873E2    call        Trim
 006873E7    mov         eax,dword ptr [ebp-12C]
 006873ED    pop         edx
 006873EE    call        CompareText
 006873F3    test        eax,eax
 006873F5    setle       al
 006873F8    call        00686074
 006873FD    fstp        qword ptr [ebp-8]
 00687400    wait
>00687401    jmp         00687E69
 00687406    lea         edx,[ebp-138]
 0068740C    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 0068740F    mov         ecx,dword ptr [eax]
 00687411    call        dword ptr [ecx+0C];TExpression.EvaluateString
 00687414    mov         eax,dword ptr [ebp-138]
 0068741A    lea         edx,[ebp-134]
 00687420    call        Trim
 00687425    mov         eax,dword ptr [ebp-134]
 0068742B    push        eax
 0068742C    lea         edx,[ebp-140]
 00687432    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687435    mov         ecx,dword ptr [eax]
 00687437    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068743A    mov         eax,dword ptr [ebp-140]
 00687440    lea         edx,[ebp-13C]
 00687446    call        Trim
 0068744B    mov         eax,dword ptr [ebp-13C]
 00687451    pop         edx
 00687452    call        CompareText
 00687457    test        eax,eax
 00687459    setge       al
 0068745C    call        00686074
 00687461    fstp        qword ptr [ebp-8]
 00687464    wait
>00687465    jmp         00687E69
 0068746A    lea         edx,[ebp-144]
 00687470    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687473    mov         ecx,dword ptr [eax]
 00687475    call        dword ptr [ecx+0C];TExpression.EvaluateString
 00687478    mov         eax,dword ptr [ebp-144]
 0068747E    push        eax
 0068747F    lea         edx,[ebp-148]
 00687485    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687488    mov         ecx,dword ptr [eax]
 0068748A    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068748D    mov         edx,dword ptr [ebp-148]
 00687493    pop         eax
 00687494    call        @UStrEqual
 00687499    setne       al
 0068749C    call        00686074
 006874A1    fstp        qword ptr [ebp-8]
 006874A4    wait
>006874A5    jmp         00687E69
 006874AA    lea         edx,[ebp-14C]
 006874B0    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006874B3    mov         ecx,dword ptr [eax]
 006874B5    call        dword ptr [ecx+0C];TExpression.EvaluateString
 006874B8    mov         eax,dword ptr [ebp-14C]
 006874BE    push        eax
 006874BF    lea         edx,[ebp-150]
 006874C5    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006874C8    mov         ecx,dword ptr [eax]
 006874CA    call        dword ptr [ecx+0C];TExpression.EvaluateString
 006874CD    mov         edx,dword ptr [ebp-150]
 006874D3    pop         eax
 006874D4    call        @UStrCmp
 006874D9    setb        al
 006874DC    call        00686074
 006874E1    fstp        qword ptr [ebp-8]
 006874E4    wait
>006874E5    jmp         00687E69
 006874EA    lea         edx,[ebp-154]
 006874F0    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006874F3    mov         ecx,dword ptr [eax]
 006874F5    call        dword ptr [ecx+0C];TExpression.EvaluateString
 006874F8    mov         eax,dword ptr [ebp-154]
 006874FE    push        eax
 006874FF    lea         edx,[ebp-158]
 00687505    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687508    mov         ecx,dword ptr [eax]
 0068750A    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068750D    mov         edx,dword ptr [ebp-158]
 00687513    pop         eax
 00687514    call        @UStrCmp
 00687519    setbe       al
 0068751C    call        00686074
 00687521    fstp        qword ptr [ebp-8]
 00687524    wait
>00687525    jmp         00687E69
 0068752A    lea         edx,[ebp-15C]
 00687530    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687533    mov         ecx,dword ptr [eax]
 00687535    call        dword ptr [ecx+0C];TExpression.EvaluateString
 00687538    mov         eax,dword ptr [ebp-15C]
 0068753E    push        eax
 0068753F    lea         edx,[ebp-160]
 00687545    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687548    mov         ecx,dword ptr [eax]
 0068754A    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068754D    mov         edx,dword ptr [ebp-160]
 00687553    pop         eax
 00687554    call        @UStrCmp
 00687559    seta        al
 0068755C    call        00686074
 00687561    fstp        qword ptr [ebp-8]
 00687564    wait
>00687565    jmp         00687E69
 0068756A    lea         edx,[ebp-164]
 00687570    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687573    mov         ecx,dword ptr [eax]
 00687575    call        dword ptr [ecx+0C];TExpression.EvaluateString
 00687578    mov         eax,dword ptr [ebp-164]
 0068757E    push        eax
 0068757F    lea         edx,[ebp-168]
 00687585    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687588    mov         ecx,dword ptr [eax]
 0068758A    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068758D    mov         edx,dword ptr [ebp-168]
 00687593    pop         eax
 00687594    call        @UStrCmp
 00687599    setae       al
 0068759C    call        00686074
 006875A1    fstp        qword ptr [ebp-8]
 006875A4    wait
>006875A5    jmp         00687E69
 006875AA    xor         eax,eax
 006875AC    mov         dword ptr [ebp-8],eax
 006875AF    mov         dword ptr [ebp-4],eax
>006875B2    jmp         00687E69
 006875B7    cmp         bl,6
>006875BA    jne         006876C6
 006875C0    cmp         al,6
>006875C2    jne         006876C6
 006875C8    movzx       edx,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 006875CC    sub         dl,14
>006875CF    je          006875E4
 006875D1    sub         dl,3
>006875D4    je          006875E4
 006875D6    sub         dl,3
>006875D9    je          006875E4
 006875DB    sub         dl,3
>006875DE    jne         006876C6
 006875E4    lea         edx,[ebp-90]
 006875EA    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006875ED    mov         ecx,dword ptr [eax]
 006875EF    call        dword ptr [ecx+40];TExpression.GetRotMat
 006875F2    lea         edx,[ebp-0D8]
 006875F8    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006875FB    mov         ecx,dword ptr [eax]
 006875FD    call        dword ptr [ecx+40];TExpression.GetRotMat
 00687600    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 00687604    sub         al,14
>00687606    je          0068761D
 00687608    sub         al,3
>0068760A    je          00687694
 00687610    sub         al,3
>00687612    je          00687640
 00687614    sub         al,3
>00687616    je          00687669
>00687618    jmp         006876B9
 0068761D    push        0
 0068761F    push        0
 00687621    lea         edx,[ebp-0D8]
 00687627    lea         eax,[ebp-90]
 0068762D    call        005C3C20
 00687632    call        00686074
 00687637    fstp        qword ptr [ebp-8]
 0068763A    wait
>0068763B    jmp         00687E69
 00687640    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00687645    push        dword ptr [eax+4]
 00687648    push        dword ptr [eax]
 0068764A    lea         edx,[ebp-0D8]
 00687650    lea         eax,[ebp-90]
 00687656    call        005C3C20
 0068765B    call        00686074
 00687660    fstp        qword ptr [ebp-8]
 00687663    wait
>00687664    jmp         00687E69
 00687669    mov         eax,[0078CC70];^gvar_0078BD78:Double
 0068766E    push        dword ptr [eax+4]
 00687671    push        dword ptr [eax]
 00687673    lea         edx,[ebp-0D8]
 00687679    lea         eax,[ebp-90]
 0068767F    call        005C3C20
 00687684    xor         al,1
 00687686    call        00686074
 0068768B    fstp        qword ptr [ebp-8]
 0068768E    wait
>0068768F    jmp         00687E69
 00687694    push        0
 00687696    push        0
 00687698    lea         edx,[ebp-0D8]
 0068769E    lea         eax,[ebp-90]
 006876A4    call        005C3C20
 006876A9    xor         al,1
 006876AB    call        00686074
 006876B0    fstp        qword ptr [ebp-8]
 006876B3    wait
>006876B4    jmp         00687E69
 006876B9    xor         eax,eax
 006876BB    mov         dword ptr [ebp-8],eax
 006876BE    mov         dword ptr [ebp-4],eax
>006876C1    jmp         00687E69
 006876C6    cmp         bl,5
>006876C9    je          006876D9
 006876CB    cmp         bl,6
>006876CE    je          006876D9
 006876D0    cmp         bl,7
>006876D3    jne         006878A9
 006876D9    cmp         al,5
>006876DB    je          006876E9
 006876DD    cmp         al,6
>006876DF    je          006876E9
 006876E1    cmp         al,7
>006876E3    jne         006878A9
 006876E9    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 006876ED    sub         al,14
>006876EF    je          00687701
 006876F1    sub         al,3
>006876F3    je          00687701
 006876F5    sub         al,3
>006876F7    je          00687701
 006876F9    sub         al,3
>006876FB    jne         006878A9
 00687701    lea         eax,[ebp-30]
 00687704    push        eax
 00687705    lea         ecx,[ebp-28]
 00687708    lea         edx,[ebp-20]
 0068770B    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 0068770E    mov         ebx,dword ptr [eax]
 00687710    call        dword ptr [ebx+20];TExpression.EvaluateVector
 00687713    lea         eax,[ebp-40]
 00687716    push        eax
 00687717    lea         eax,[ebp-48]
 0068771A    push        eax
 0068771B    lea         ecx,[ebp-38]
 0068771E    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687721    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687724    mov         ebx,dword ptr [eax]
 00687726    call        dword ptr [ebx+24];TExpression.EvaluateVectorToMatch
 00687729    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 0068772D    sub         al,14
>0068772F    je          0068774A
 00687731    sub         al,3
>00687733    je          00687864
 00687739    sub         al,3
>0068773B    je          00687782
 0068773D    sub         al,3
>0068773F    je          006877F3
>00687745    jmp         0068789C
 0068774A    fld         qword ptr [ebp-20]
 0068774D    fcomp       qword ptr [ebp-38]
 00687750    wait
 00687751    fnstsw      al
 00687753    sahf
>00687754    jne         0068776E
 00687756    fld         qword ptr [ebp-28]
 00687759    fcomp       qword ptr [ebp-40]
 0068775C    wait
 0068775D    fnstsw      al
 0068775F    sahf
>00687760    jne         0068776E
 00687762    fld         qword ptr [ebp-30]
 00687765    fcomp       qword ptr [ebp-48]
 00687768    wait
 00687769    fnstsw      al
 0068776B    sahf
>0068776C    je          00687772
 0068776E    xor         eax,eax
>00687770    jmp         00687774
 00687772    mov         al,1
 00687774    call        00686074
 00687779    fstp        qword ptr [ebp-8]
 0068777C    wait
>0068777D    jmp         00687E69
 00687782    push        dword ptr [ebp-1C]
 00687785    push        dword ptr [ebp-20]
 00687788    push        dword ptr [ebp-34]
 0068778B    push        dword ptr [ebp-38]
 0068778E    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00687793    push        dword ptr [eax+4]
 00687796    push        dword ptr [eax]
 00687798    call        004553E8
 0068779D    test        al,al
>0068779F    je          006877DF
 006877A1    push        dword ptr [ebp-24]
 006877A4    push        dword ptr [ebp-28]
 006877A7    push        dword ptr [ebp-3C]
 006877AA    push        dword ptr [ebp-40]
 006877AD    mov         eax,[0078CC70];^gvar_0078BD78:Double
 006877B2    push        dword ptr [eax+4]
 006877B5    push        dword ptr [eax]
 006877B7    call        004553E8
 006877BC    test        al,al
>006877BE    je          006877DF
 006877C0    push        dword ptr [ebp-2C]
 006877C3    push        dword ptr [ebp-30]
 006877C6    push        dword ptr [ebp-44]
 006877C9    push        dword ptr [ebp-48]
 006877CC    mov         eax,[0078CC70];^gvar_0078BD78:Double
 006877D1    push        dword ptr [eax+4]
 006877D4    push        dword ptr [eax]
 006877D6    call        004553E8
 006877DB    test        al,al
>006877DD    jne         006877E3
 006877DF    xor         eax,eax
>006877E1    jmp         006877E5
 006877E3    mov         al,1
 006877E5    call        00686074
 006877EA    fstp        qword ptr [ebp-8]
 006877ED    wait
>006877EE    jmp         00687E69
 006877F3    push        dword ptr [ebp-1C]
 006877F6    push        dword ptr [ebp-20]
 006877F9    push        dword ptr [ebp-34]
 006877FC    push        dword ptr [ebp-38]
 006877FF    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00687804    push        dword ptr [eax+4]
 00687807    push        dword ptr [eax]
 00687809    call        004553E8
 0068780E    test        al,al
>00687810    je          00687854
 00687812    push        dword ptr [ebp-24]
 00687815    push        dword ptr [ebp-28]
 00687818    push        dword ptr [ebp-3C]
 0068781B    push        dword ptr [ebp-40]
 0068781E    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00687823    push        dword ptr [eax+4]
 00687826    push        dword ptr [eax]
 00687828    call        004553E8
 0068782D    test        al,al
>0068782F    je          00687854
 00687831    push        dword ptr [ebp-2C]
 00687834    push        dword ptr [ebp-30]
 00687837    push        dword ptr [ebp-44]
 0068783A    push        dword ptr [ebp-48]
 0068783D    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00687842    push        dword ptr [eax+4]
 00687845    push        dword ptr [eax]
 00687847    call        004553E8
 0068784C    test        al,al
>0068784E    je          00687854
 00687850    xor         eax,eax
>00687852    jmp         00687856
 00687854    mov         al,1
 00687856    call        00686074
 0068785B    fstp        qword ptr [ebp-8]
 0068785E    wait
>0068785F    jmp         00687E69
 00687864    fld         qword ptr [ebp-20]
 00687867    fcomp       qword ptr [ebp-38]
 0068786A    wait
 0068786B    fnstsw      al
 0068786D    sahf
>0068786E    jne         0068788C
 00687870    fld         qword ptr [ebp-28]
 00687873    fcomp       qword ptr [ebp-40]
 00687876    wait
 00687877    fnstsw      al
 00687879    sahf
>0068787A    jne         0068788C
 0068787C    fld         qword ptr [ebp-30]
 0068787F    fcomp       qword ptr [ebp-48]
 00687882    wait
 00687883    fnstsw      al
 00687885    sahf
>00687886    jne         0068788C
 00687888    xor         eax,eax
>0068788A    jmp         0068788E
 0068788C    mov         al,1
 0068788E    call        00686074
 00687893    fstp        qword ptr [ebp-8]
 00687896    wait
>00687897    jmp         00687E69
 0068789C    xor         eax,eax
 0068789E    mov         dword ptr [ebp-8],eax
 006878A1    mov         dword ptr [ebp-4],eax
>006878A4    jmp         00687E69
 006878A9    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006878AC    mov         edx,dword ptr [eax]
 006878AE    call        dword ptr [edx];TExpression.Evaluate
 006878B0    fstp        qword ptr [ebp-10]
 006878B3    wait
 006878B4    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 006878B8    cmp         al,1
>006878BA    je          006878C0
 006878BC    test        al,al
>006878BE    jne         006878D1
 006878C0    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006878C3    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006878C6    mov         ecx,dword ptr [eax]
 006878C8    call        dword ptr [ecx+18];TExpression.EvaluateToMatchAdd
 006878CB    fstp        qword ptr [ebp-18]
 006878CE    wait
>006878CF    jmp         006878E0
 006878D1    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006878D4    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006878D7    mov         ecx,dword ptr [eax]
 006878D9    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 006878DC    fstp        qword ptr [ebp-18]
 006878DF    wait
 006878E0    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 006878E4    cmp         eax,22
>006878E7    ja          00687E61
 006878ED    jmp         dword ptr [eax*4+6878F4]
 006878ED    dd          0068798F
 006878ED    dd          00687980
 006878ED    dd          0068799E
 006878ED    dd          006879AD
 006878ED    dd          006879BC
 006878ED    dd          006879FE
 006878ED    dd          00687A2C
 006878ED    dd          00687A4E
 006878ED    dd          00687A69
 006878ED    dd          00687A95
 006878ED    dd          00687E61
 006878ED    dd          00687AC1
 006878ED    dd          00687AE5
 006878ED    dd          00687B0E
 006878ED    dd          00687E61
 006878ED    dd          00687B37
 006878ED    dd          00687B60
 006878ED    dd          00687B8B
 006878ED    dd          00687BB6
 006878ED    dd          00687BD1
 006878ED    dd          00687BEC
 006878ED    dd          00687D4B
 006878ED    dd          00687D66
 006878ED    dd          00687DFC
 006878ED    dd          00687DC0
 006878ED    dd          00687DC0
 006878ED    dd          00687C57
 006878ED    dd          00687D81
 006878ED    dd          00687D81
 006878ED    dd          00687CD0
 006878ED    dd          00687E61
 006878ED    dd          00687E61
 006878ED    dd          00687E61
 006878ED    dd          00687E61
 006878ED    dd          006879DE
 00687980    fld         qword ptr [ebp-10]
 00687983    fsub        qword ptr [ebp-18]
 00687986    fstp        qword ptr [ebp-8]
 00687989    wait
>0068798A    jmp         00687E69
 0068798F    fld         qword ptr [ebp-10]
 00687992    fadd        qword ptr [ebp-18]
 00687995    fstp        qword ptr [ebp-8]
 00687998    wait
>00687999    jmp         00687E69
 0068799E    fld         qword ptr [ebp-10]
 006879A1    fmul        qword ptr [ebp-18]
 006879A4    fstp        qword ptr [ebp-8]
 006879A7    wait
>006879A8    jmp         00687E69
 006879AD    fld         qword ptr [ebp-10]
 006879B0    fdiv        qword ptr [ebp-18]
 006879B3    fstp        qword ptr [ebp-8]
 006879B6    wait
>006879B7    jmp         00687E69
 006879BC    push        dword ptr [ebp-0C]
 006879BF    push        dword ptr [ebp-10]
 006879C2    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006879C5    mov         edx,dword ptr [eax]
 006879C7    call        dword ptr [edx];TExpression.Evaluate
 006879C9    add         esp,0FFFFFFF8
 006879CC    fstp        qword ptr [esp]
 006879CF    wait
 006879D0    call        00454CCC
 006879D5    fstp        qword ptr [ebp-8]
 006879D8    wait
>006879D9    jmp         00687E69
 006879DE    fld         qword ptr [ebp-10]
 006879E1    add         esp,0FFFFFFF4
 006879E4    fstp        tbyte ptr [esp]
 006879E7    wait
 006879E8    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006879EB    mov         edx,dword ptr [eax]
 006879ED    call        dword ptr [edx+8];TExpression.EvaluateInteger
 006879F0    call        0068AA40
 006879F5    fstp        qword ptr [ebp-8]
 006879F8    wait
>006879F9    jmp         00687E69
 006879FE    fld         qword ptr [ebp-10]
 00687A01    add         esp,0FFFFFFF4
 00687A04    fstp        tbyte ptr [esp]
 00687A07    wait
 00687A08    fld         qword ptr [ebp-18]
 00687A0B    add         esp,0FFFFFFF4
 00687A0E    fstp        tbyte ptr [esp]
 00687A11    wait
 00687A12    call        0068AE8C
 00687A17    mov         dword ptr [ebp-16C],eax
 00687A1D    fild        dword ptr [ebp-16C]
 00687A23    fstp        qword ptr [ebp-8]
 00687A26    wait
>00687A27    jmp         00687E69
 00687A2C    fld         qword ptr [ebp-10]
 00687A2F    add         esp,0FFFFFFF4
 00687A32    fstp        tbyte ptr [esp]
 00687A35    wait
 00687A36    fld         qword ptr [ebp-18]
 00687A39    add         esp,0FFFFFFF4
 00687A3C    fstp        tbyte ptr [esp]
 00687A3F    wait
 00687A40    call        0068AEA0
 00687A45    fstp        qword ptr [ebp-8]
 00687A48    wait
>00687A49    jmp         00687E69
 00687A4E    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687A51    mov         edx,dword ptr [eax]
 00687A53    call        dword ptr [edx];TExpression.Evaluate
 00687A55    fld         qword ptr [ebp-10]
 00687A58    fdiv        dword ptr ds:[687E9C];100:Single
 00687A5E    fmulp       st(1),st
 00687A60    fstp        qword ptr [ebp-8]
 00687A63    wait
>00687A64    jmp         00687E69
 00687A69    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687A6C    mov         edx,dword ptr [eax]
 00687A6E    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00687A71    test        al,al
>00687A73    je          00687A81
 00687A75    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687A78    mov         edx,dword ptr [eax]
 00687A7A    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00687A7D    test        al,al
>00687A7F    jne         00687A85
 00687A81    xor         eax,eax
>00687A83    jmp         00687A87
 00687A85    mov         al,1
 00687A87    call        00686074
 00687A8C    fstp        qword ptr [ebp-8]
 00687A8F    wait
>00687A90    jmp         00687E69
 00687A95    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687A98    mov         edx,dword ptr [eax]
 00687A9A    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00687A9D    test        al,al
>00687A9F    jne         00687AB1
 00687AA1    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687AA4    mov         edx,dword ptr [eax]
 00687AA6    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00687AA9    test        al,al
>00687AAB    jne         00687AB1
 00687AAD    xor         eax,eax
>00687AAF    jmp         00687AB3
 00687AB1    mov         al,1
 00687AB3    call        00686074
 00687AB8    fstp        qword ptr [ebp-8]
 00687ABB    wait
>00687ABC    jmp         00687E69
 00687AC1    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687AC4    mov         edx,dword ptr [eax]
 00687AC6    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00687AC9    mov         ebx,eax
 00687ACB    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687ACE    mov         edx,dword ptr [eax]
 00687AD0    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00687AD3    xor         bl,al
 00687AD5    mov         eax,ebx
 00687AD7    call        00686074
 00687ADC    fstp        qword ptr [ebp-8]
 00687ADF    wait
>00687AE0    jmp         00687E69
 00687AE5    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687AE8    mov         edx,dword ptr [eax]
 00687AEA    call        dword ptr [edx+8];TExpression.EvaluateInteger
 00687AED    mov         ebx,eax
 00687AEF    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687AF2    mov         edx,dword ptr [eax]
 00687AF4    call        dword ptr [edx+8];TExpression.EvaluateInteger
 00687AF7    and         ebx,eax
 00687AF9    mov         dword ptr [ebp-16C],ebx
 00687AFF    fild        dword ptr [ebp-16C]
 00687B05    fstp        qword ptr [ebp-8]
 00687B08    wait
>00687B09    jmp         00687E69
 00687B0E    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687B11    mov         edx,dword ptr [eax]
 00687B13    call        dword ptr [edx+8];TExpression.EvaluateInteger
 00687B16    mov         ebx,eax
 00687B18    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687B1B    mov         edx,dword ptr [eax]
 00687B1D    call        dword ptr [edx+8];TExpression.EvaluateInteger
 00687B20    or          ebx,eax
 00687B22    mov         dword ptr [ebp-16C],ebx
 00687B28    fild        dword ptr [ebp-16C]
 00687B2E    fstp        qword ptr [ebp-8]
 00687B31    wait
>00687B32    jmp         00687E69
 00687B37    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687B3A    mov         edx,dword ptr [eax]
 00687B3C    call        dword ptr [edx+8];TExpression.EvaluateInteger
 00687B3F    mov         ebx,eax
 00687B41    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687B44    mov         edx,dword ptr [eax]
 00687B46    call        dword ptr [edx+8];TExpression.EvaluateInteger
 00687B49    xor         ebx,eax
 00687B4B    mov         dword ptr [ebp-16C],ebx
 00687B51    fild        dword ptr [ebp-16C]
 00687B57    fstp        qword ptr [ebp-8]
 00687B5A    wait
>00687B5B    jmp         00687E69
 00687B60    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687B63    mov         edx,dword ptr [eax]
 00687B65    call        dword ptr [edx+8];TExpression.EvaluateInteger
 00687B68    mov         ebx,eax
 00687B6A    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687B6D    mov         edx,dword ptr [eax]
 00687B6F    call        dword ptr [edx+8];TExpression.EvaluateInteger
 00687B72    mov         ecx,eax
 00687B74    shl         ebx,cl
 00687B76    mov         dword ptr [ebp-16C],ebx
 00687B7C    fild        dword ptr [ebp-16C]
 00687B82    fstp        qword ptr [ebp-8]
 00687B85    wait
>00687B86    jmp         00687E69
 00687B8B    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687B8E    mov         edx,dword ptr [eax]
 00687B90    call        dword ptr [edx+8];TExpression.EvaluateInteger
 00687B93    mov         ebx,eax
 00687B95    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687B98    mov         edx,dword ptr [eax]
 00687B9A    call        dword ptr [edx+8];TExpression.EvaluateInteger
 00687B9D    mov         ecx,eax
 00687B9F    shr         ebx,cl
 00687BA1    mov         dword ptr [ebp-16C],ebx
 00687BA7    fild        dword ptr [ebp-16C]
 00687BAD    fstp        qword ptr [ebp-8]
 00687BB0    wait
>00687BB1    jmp         00687E69
 00687BB6    fld         qword ptr [ebp-10]
 00687BB9    fcomp       qword ptr [ebp-18]
 00687BBC    wait
 00687BBD    fnstsw      al
 00687BBF    sahf
 00687BC0    setb        al
 00687BC3    call        00686074
 00687BC8    fstp        qword ptr [ebp-8]
 00687BCB    wait
>00687BCC    jmp         00687E69
 00687BD1    fld         qword ptr [ebp-10]
 00687BD4    fcomp       qword ptr [ebp-18]
 00687BD7    wait
 00687BD8    fnstsw      al
 00687BDA    sahf
 00687BDB    setbe       al
 00687BDE    call        00686074
 00687BE3    fstp        qword ptr [ebp-8]
 00687BE6    wait
>00687BE7    jmp         00687E69
 00687BEC    push        dword ptr [ebp-0C]
 00687BEF    push        dword ptr [ebp-10]
 00687BF2    call        004552D4
 00687BF7    test        al,al
>00687BF9    jne         00687C0A
 00687BFB    push        dword ptr [ebp-14]
 00687BFE    push        dword ptr [ebp-18]
 00687C01    call        004552D4
 00687C06    test        al,al
>00687C08    je          00687C3C
 00687C0A    push        dword ptr [ebp-0C]
 00687C0D    push        dword ptr [ebp-10]
 00687C10    call        004552D4
 00687C15    test        al,al
>00687C17    je          00687C28
 00687C19    push        dword ptr [ebp-14]
 00687C1C    push        dword ptr [ebp-18]
 00687C1F    call        004552D4
 00687C24    test        al,al
>00687C26    jne         00687C2C
 00687C28    xor         eax,eax
>00687C2A    jmp         00687C2E
 00687C2C    mov         al,1
 00687C2E    call        00686074
 00687C33    fstp        qword ptr [ebp-8]
 00687C36    wait
>00687C37    jmp         00687E69
 00687C3C    fld         qword ptr [ebp-10]
 00687C3F    fcomp       qword ptr [ebp-18]
 00687C42    wait
 00687C43    fnstsw      al
 00687C45    sahf
 00687C46    sete        al
 00687C49    call        00686074
 00687C4E    fstp        qword ptr [ebp-8]
 00687C51    wait
>00687C52    jmp         00687E69
 00687C57    push        dword ptr [ebp-0C]
 00687C5A    push        dword ptr [ebp-10]
 00687C5D    call        004552D4
 00687C62    test        al,al
>00687C64    jne         00687C75
 00687C66    push        dword ptr [ebp-14]
 00687C69    push        dword ptr [ebp-18]
 00687C6C    call        004552D4
 00687C71    test        al,al
>00687C73    je          00687CA7
 00687C75    push        dword ptr [ebp-0C]
 00687C78    push        dword ptr [ebp-10]
 00687C7B    call        004552D4
 00687C80    test        al,al
>00687C82    je          00687C93
 00687C84    push        dword ptr [ebp-14]
 00687C87    push        dword ptr [ebp-18]
 00687C8A    call        004552D4
 00687C8F    test        al,al
>00687C91    jne         00687C97
 00687C93    xor         eax,eax
>00687C95    jmp         00687C99
 00687C97    mov         al,1
 00687C99    call        00686074
 00687C9E    fstp        qword ptr [ebp-8]
 00687CA1    wait
>00687CA2    jmp         00687E69
 00687CA7    push        dword ptr [ebp-0C]
 00687CAA    push        dword ptr [ebp-10]
 00687CAD    push        dword ptr [ebp-14]
 00687CB0    push        dword ptr [ebp-18]
 00687CB3    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00687CB8    push        dword ptr [eax+4]
 00687CBB    push        dword ptr [eax]
 00687CBD    call        004553E8
 00687CC2    call        00686074
 00687CC7    fstp        qword ptr [ebp-8]
 00687CCA    wait
>00687CCB    jmp         00687E69
 00687CD0    push        dword ptr [ebp-0C]
 00687CD3    push        dword ptr [ebp-10]
 00687CD6    call        004552D4
 00687CDB    test        al,al
>00687CDD    jne         00687CEE
 00687CDF    push        dword ptr [ebp-14]
 00687CE2    push        dword ptr [ebp-18]
 00687CE5    call        004552D4
 00687CEA    test        al,al
>00687CEC    je          00687D20
 00687CEE    push        dword ptr [ebp-0C]
 00687CF1    push        dword ptr [ebp-10]
 00687CF4    call        004552D4
 00687CF9    test        al,al
>00687CFB    je          00687D10
 00687CFD    push        dword ptr [ebp-14]
 00687D00    push        dword ptr [ebp-18]
 00687D03    call        004552D4
 00687D08    test        al,al
>00687D0A    je          00687D10
 00687D0C    xor         eax,eax
>00687D0E    jmp         00687D12
 00687D10    mov         al,1
 00687D12    call        00686074
 00687D17    fstp        qword ptr [ebp-8]
 00687D1A    wait
>00687D1B    jmp         00687E69
 00687D20    push        dword ptr [ebp-0C]
 00687D23    push        dword ptr [ebp-10]
 00687D26    push        dword ptr [ebp-14]
 00687D29    push        dword ptr [ebp-18]
 00687D2C    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00687D31    push        dword ptr [eax+4]
 00687D34    push        dword ptr [eax]
 00687D36    call        004553E8
 00687D3B    xor         al,1
 00687D3D    call        00686074
 00687D42    fstp        qword ptr [ebp-8]
 00687D45    wait
>00687D46    jmp         00687E69
 00687D4B    fld         qword ptr [ebp-10]
 00687D4E    fcomp       qword ptr [ebp-18]
 00687D51    wait
 00687D52    fnstsw      al
 00687D54    sahf
 00687D55    setae       al
 00687D58    call        00686074
 00687D5D    fstp        qword ptr [ebp-8]
 00687D60    wait
>00687D61    jmp         00687E69
 00687D66    fld         qword ptr [ebp-10]
 00687D69    fcomp       qword ptr [ebp-18]
 00687D6C    wait
 00687D6D    fnstsw      al
 00687D6F    sahf
 00687D70    seta        al
 00687D73    call        00686074
 00687D78    fstp        qword ptr [ebp-8]
 00687D7B    wait
>00687D7C    jmp         00687E69
 00687D81    fld         qword ptr [ebp-10]
 00687D84    fcomp       qword ptr [ebp-18]
 00687D87    wait
 00687D88    fnstsw      al
 00687D8A    sahf
>00687D8B    jae         00687DB0
 00687D8D    push        dword ptr [ebp-0C]
 00687D90    push        dword ptr [ebp-10]
 00687D93    push        dword ptr [ebp-14]
 00687D96    push        dword ptr [ebp-18]
 00687D99    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00687D9E    push        dword ptr [eax+4]
 00687DA1    push        dword ptr [eax]
 00687DA3    call        004553E8
 00687DA8    test        al,al
>00687DAA    jne         00687DB0
 00687DAC    xor         eax,eax
>00687DAE    jmp         00687DB2
 00687DB0    mov         al,1
 00687DB2    call        00686074
 00687DB7    fstp        qword ptr [ebp-8]
 00687DBA    wait
>00687DBB    jmp         00687E69
 00687DC0    fld         qword ptr [ebp-10]
 00687DC3    fcomp       qword ptr [ebp-18]
 00687DC6    wait
 00687DC7    fnstsw      al
 00687DC9    sahf
>00687DCA    jbe         00687DEF
 00687DCC    push        dword ptr [ebp-0C]
 00687DCF    push        dword ptr [ebp-10]
 00687DD2    push        dword ptr [ebp-14]
 00687DD5    push        dword ptr [ebp-18]
 00687DD8    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00687DDD    push        dword ptr [eax+4]
 00687DE0    push        dword ptr [eax]
 00687DE2    call        004553E8
 00687DE7    test        al,al
>00687DE9    jne         00687DEF
 00687DEB    xor         eax,eax
>00687DED    jmp         00687DF1
 00687DEF    mov         al,1
 00687DF1    call        00686074
 00687DF6    fstp        qword ptr [ebp-8]
 00687DF9    wait
>00687DFA    jmp         00687E69
 00687DFC    push        dword ptr [ebp-0C]
 00687DFF    push        dword ptr [ebp-10]
 00687E02    call        004552D4
 00687E07    test        al,al
>00687E09    jne         00687E1A
 00687E0B    push        dword ptr [ebp-14]
 00687E0E    push        dword ptr [ebp-18]
 00687E11    call        004552D4
 00687E16    test        al,al
>00687E18    je          00687E49
 00687E1A    push        dword ptr [ebp-0C]
 00687E1D    push        dword ptr [ebp-10]
 00687E20    call        004552D4
 00687E25    test        al,al
>00687E27    je          00687E3C
 00687E29    push        dword ptr [ebp-14]
 00687E2C    push        dword ptr [ebp-18]
 00687E2F    call        004552D4
 00687E34    test        al,al
>00687E36    je          00687E3C
 00687E38    xor         eax,eax
>00687E3A    jmp         00687E3E
 00687E3C    mov         al,1
 00687E3E    call        00686074
 00687E43    fstp        qword ptr [ebp-8]
 00687E46    wait
>00687E47    jmp         00687E69
 00687E49    fld         qword ptr [ebp-10]
 00687E4C    fcomp       qword ptr [ebp-18]
 00687E4F    wait
 00687E50    fnstsw      al
 00687E52    sahf
 00687E53    setne       al
 00687E56    call        00686074
 00687E5B    fstp        qword ptr [ebp-8]
 00687E5E    wait
>00687E5F    jmp         00687E69
 00687E61    xor         eax,eax
 00687E63    mov         dword ptr [ebp-8],eax
 00687E66    mov         dword ptr [ebp-4],eax
 00687E69    xor         eax,eax
 00687E6B    pop         edx
 00687E6C    pop         ecx
 00687E6D    pop         ecx
 00687E6E    mov         dword ptr fs:[eax],edx
 00687E71    push        687E8E
 00687E76    lea         eax,[ebp-168]
 00687E7C    mov         edx,24
 00687E81    call        @UStrArrayClr
 00687E86    ret
>00687E87    jmp         @HandleFinally
>00687E8C    jmp         00687E76
 00687E8E    fld         qword ptr [ebp-8]
 00687E91    pop         esi
 00687E92    pop         ebx
 00687E93    mov         esp,ebp
 00687E95    pop         ebp
 00687E96    ret
*}
end;

//00687EA0
function TBinaryOp.ReturnsBoolean:Boolean;
begin
{*
 00687EA0    movzx       eax,byte ptr [eax+20];TBinaryOp.Operation:TOperation
 00687EA4    add         al,0F8
 00687EA6    sub         al,2
>00687EA8    jb          00687EB4
 00687EAA    dec         al
>00687EAC    je          00687EB4
 00687EAE    add         al,0F9
 00687EB0    sub         al,0C
>00687EB2    jae         00687EB7
 00687EB4    mov         al,1
 00687EB6    ret
 00687EB7    xor         eax,eax
 00687EB9    ret
*}
end;

//00687EBC
{*procedure TBinaryOp.SetValue(NewValue:Double; ?:?);
begin
 00687EBC    push        ebp
 00687EBD    mov         ebp,esp
 00687EBF    push        ebx
 00687EC0    push        esi
 00687EC1    mov         esi,eax
 00687EC3    push        dword ptr [ebp+0C]
 00687EC6    push        dword ptr [ebp+8]
 00687EC9    call        00686060
 00687ECE    mov         ebx,eax
 00687ED0    push        dword ptr [esi+0C];TBinaryOp.?fC:dword
 00687ED3    push        dword ptr [esi+8];TBinaryOp.PreviousValue:Double
 00687ED6    call        00686060
 00687EDB    cmp         bl,al
>00687EDD    jne         00687EEC
 00687EDF    cmp         byte ptr [esi+10],0;TBinaryOp.Iffy:Boolean
>00687EE3    jne         00687EEC
 00687EE5    mov         al,1
>00687EE7    jmp         00687F7E
 00687EEC    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 00687EF0    cmp         eax,0C
>00687EF3    ja          00687F70
 00687EF5    movzx       eax,byte ptr [eax+687F03]
 00687EFC    jmp         dword ptr [eax*4+687F10]
 00687EFC    db          1
 00687EFC    db          1
 00687EFC    db          0
 00687EFC    db          2
 00687EFC    db          0
 00687EFC    db          0
 00687EFC    db          0
 00687EFC    db          0
 00687EFC    db          1
 00687EFC    db          2
 00687EFC    db          0
 00687EFC    db          2
 00687EFC    db          1
 00687EFC    dd          00687F70
 00687EFC    dd          00687F1C
 00687EFC    dd          00687F5E
 00687F1C    test        bl,bl
>00687F1E    je          00687F3E
 00687F20    push        dword ptr [ebp+0C]
 00687F23    push        dword ptr [ebp+8]
 00687F26    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687F29    mov         edx,dword ptr [eax]
 00687F2B    call        dword ptr [edx+58];TExpression.SetValue
 00687F2E    push        dword ptr [ebp+0C]
 00687F31    push        dword ptr [ebp+8]
 00687F34    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687F37    mov         edx,dword ptr [eax]
 00687F39    call        dword ptr [edx+58];TExpression.SetValue
>00687F3C    jmp         00687F5A
 00687F3E    push        dword ptr [ebp+0C]
 00687F41    push        dword ptr [ebp+8]
 00687F44    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00687F47    mov         edx,dword ptr [eax]
 00687F49    call        dword ptr [edx+58];TExpression.SetValue
 00687F4C    push        dword ptr [ebp+0C]
 00687F4F    push        dword ptr [ebp+8]
 00687F52    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687F55    mov         edx,dword ptr [eax]
 00687F57    call        dword ptr [edx+58];TExpression.SetValue
 00687F5A    mov         al,1
>00687F5C    jmp         00687F72
 00687F5E    push        dword ptr [ebp+0C]
 00687F61    push        dword ptr [ebp+8]
 00687F64    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00687F67    mov         edx,dword ptr [eax]
 00687F69    call        dword ptr [edx+58];TExpression.SetValue
 00687F6C    mov         al,1
>00687F6E    jmp         00687F72
 00687F70    xor         eax,eax
 00687F72    mov         edx,dword ptr [ebp+8]
 00687F75    mov         dword ptr [esi+8],edx;TBinaryOp.PreviousValue:Double
 00687F78    mov         edx,dword ptr [ebp+0C]
 00687F7B    mov         dword ptr [esi+0C],edx;TBinaryOp.?fC:dword
 00687F7E    pop         esi
 00687F7F    pop         ebx
 00687F80    pop         ebp
 00687F81    ret         8
end;*}

//00687F84
procedure TBinaryOp.Swallow;
begin
{*
 00687F84    push        ebx
 00687F85    mov         ebx,eax
 00687F87    mov         eax,ebx
 00687F89    call        TExpression.Swallow
 00687F8E    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00687F91    mov         edx,dword ptr [eax]
 00687F93    call        dword ptr [edx+88];TExpression.Swallow
 00687F99    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 00687F9C    mov         edx,dword ptr [eax]
 00687F9E    call        dword ptr [edx+88];TExpression.Swallow
 00687FA4    pop         ebx
 00687FA5    ret
*}
end;

//00687FA8
{*procedure TBinaryOp.ToString(?:?);
begin
 00687FA8    push        ebp
 00687FA9    mov         ebp,esp
 00687FAB    xor         ecx,ecx
 00687FAD    push        ecx
 00687FAE    push        ecx
 00687FAF    push        ecx
 00687FB0    push        ecx
 00687FB1    push        ebx
 00687FB2    push        esi
 00687FB3    push        edi
 00687FB4    mov         edi,edx
 00687FB6    mov         ebx,eax
 00687FB8    xor         eax,eax
 00687FBA    push        ebp
 00687FBB    push        688475
 00687FC0    push        dword ptr fs:[eax]
 00687FC3    mov         dword ptr fs:[eax],esp
 00687FC6    mov         esi,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00687FC9    mov         eax,esi
 00687FCB    mov         edx,dword ptr ds:[680DF8];TBinaryOp
 00687FD1    call        @IsClass
 00687FD6    test        al,al
>00687FD8    jne         00687FFC
 00687FDA    mov         eax,esi
 00687FDC    mov         edx,dword ptr ds:[681370];TUnaryOp
 00687FE2    call        @IsClass
 00687FE7    test        al,al
>00687FE9    jne         00687FFC
 00687FEB    mov         eax,esi
 00687FED    mov         edx,dword ptr ds:[681B30];TSequenceExpression
 00687FF3    call        @IsClass
 00687FF8    test        al,al
>00687FFA    je          00688022
 00687FFC    push        688490;'('
 00688001    lea         edx,[ebp-0C]
 00688004    mov         eax,esi
 00688006    mov         ecx,dword ptr [eax]
 00688008    call        dword ptr [ecx-24];TExpression.ToString
 0068800B    push        dword ptr [ebp-0C]
 0068800E    push        6884A0;')'
 00688013    lea         eax,[ebp-4]
 00688016    mov         edx,3
 0068801B    call        @UStrCatN
>00688020    jmp         0068802C
 00688022    lea         edx,[ebp-4]
 00688025    mov         eax,esi
 00688027    mov         ecx,dword ptr [eax]
 00688029    call        dword ptr [ecx-24];TExpression.ToString
 0068802C    mov         esi,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 0068802F    mov         eax,esi
 00688031    mov         edx,dword ptr ds:[680DF8];TBinaryOp
 00688037    call        @IsClass
 0068803C    test        al,al
>0068803E    jne         00688062
 00688040    mov         eax,esi
 00688042    mov         edx,dword ptr ds:[681370];TUnaryOp
 00688048    call        @IsClass
 0068804D    test        al,al
>0068804F    jne         00688062
 00688051    mov         eax,esi
 00688053    mov         edx,dword ptr ds:[681B30];TSequenceExpression
 00688059    call        @IsClass
 0068805E    test        al,al
>00688060    je          00688088
 00688062    push        688490;'('
 00688067    lea         edx,[ebp-10]
 0068806A    mov         eax,esi
 0068806C    mov         ecx,dword ptr [eax]
 0068806E    call        dword ptr [ecx-24];TExpression.ToString
 00688071    push        dword ptr [ebp-10]
 00688074    push        6884A0;')'
 00688079    lea         eax,[ebp-8]
 0068807C    mov         edx,3
 00688081    call        @UStrCatN
>00688086    jmp         00688092
 00688088    lea         edx,[ebp-8]
 0068808B    mov         eax,esi
 0068808D    mov         ecx,dword ptr [eax]
 0068808F    call        dword ptr [ecx-24];TExpression.ToString
 00688092    movzx       eax,byte ptr [ebx+20];TBinaryOp.Operation:TOperation
 00688096    cmp         eax,1F
>00688099    ja          00688443
 0068809F    jmp         dword ptr [eax*4+6880A6]
 0068809F    dd          00688142
 0068809F    dd          00688126
 0068809F    dd          0068815E
 0068809F    dd          00688196
 0068809F    dd          006881B2
 0068809F    dd          006881CE
 0068809F    dd          006881EA
 0068809F    dd          00688206
 0068809F    dd          00688222
 0068809F    dd          0068823E
 0068809F    dd          00688443
 0068809F    dd          0068825A
 0068809F    dd          00688276
 0068809F    dd          00688292
 0068809F    dd          00688443
 0068809F    dd          006882AE
 0068809F    dd          006882CA
 0068809F    dd          006882E6
 0068809F    dd          00688302
 0068809F    dd          0068831E
 0068809F    dd          0068833A
 0068809F    dd          0068838E
 0068809F    dd          006883AA
 0068809F    dd          0068842A
 0068809F    dd          006883C6
 0068809F    dd          006883DF
 0068809F    dd          00688356
 0068809F    dd          00688411
 0068809F    dd          006883F8
 0068809F    dd          00688372
 0068809F    dd          00688443
 0068809F    dd          0068817A
 00688126    push        dword ptr [ebp-4]
 00688129    push        6884B0;'-'
 0068812E    push        dword ptr [ebp-8]
 00688131    mov         eax,edi
 00688133    mov         edx,3
 00688138    call        @UStrCatN
>0068813D    jmp         0068845A
 00688142    push        dword ptr [ebp-4]
 00688145    push        6884C0;'+'
 0068814A    push        dword ptr [ebp-8]
 0068814D    mov         eax,edi
 0068814F    mov         edx,3
 00688154    call        @UStrCatN
>00688159    jmp         0068845A
 0068815E    push        dword ptr [ebp-4]
 00688161    push        6884D0;'*'
 00688166    push        dword ptr [ebp-8]
 00688169    mov         eax,edi
 0068816B    mov         edx,3
 00688170    call        @UStrCatN
>00688175    jmp         0068845A
 0068817A    push        dword ptr [ebp-4]
 0068817D    push        6884E0;' . '
 00688182    push        dword ptr [ebp-8]
 00688185    mov         eax,edi
 00688187    mov         edx,3
 0068818C    call        @UStrCatN
>00688191    jmp         0068845A
 00688196    push        dword ptr [ebp-4]
 00688199    push        6884F4;'/'
 0068819E    push        dword ptr [ebp-8]
 006881A1    mov         eax,edi
 006881A3    mov         edx,3
 006881A8    call        @UStrCatN
>006881AD    jmp         0068845A
 006881B2    push        dword ptr [ebp-4]
 006881B5    push        688504;'^'
 006881BA    push        dword ptr [ebp-8]
 006881BD    mov         eax,edi
 006881BF    mov         edx,3
 006881C4    call        @UStrCatN
>006881C9    jmp         0068845A
 006881CE    push        dword ptr [ebp-4]
 006881D1    push        688514;' div '
 006881D6    push        dword ptr [ebp-8]
 006881D9    mov         eax,edi
 006881DB    mov         edx,3
 006881E0    call        @UStrCatN
>006881E5    jmp         0068845A
 006881EA    push        dword ptr [ebp-4]
 006881ED    push        68852C;' mod '
 006881F2    push        dword ptr [ebp-8]
 006881F5    mov         eax,edi
 006881F7    mov         edx,3
 006881FC    call        @UStrCatN
>00688201    jmp         0068845A
 00688206    push        dword ptr [ebp-4]
 00688209    push        688544;'% of '
 0068820E    push        dword ptr [ebp-8]
 00688211    mov         eax,edi
 00688213    mov         edx,3
 00688218    call        @UStrCatN
>0068821D    jmp         0068845A
 00688222    push        dword ptr [ebp-4]
 00688225    push        68855C;' and '
 0068822A    push        dword ptr [ebp-8]
 0068822D    mov         eax,edi
 0068822F    mov         edx,3
 00688234    call        @UStrCatN
>00688239    jmp         0068845A
 0068823E    push        dword ptr [ebp-4]
 00688241    push        688574;' or '
 00688246    push        dword ptr [ebp-8]
 00688249    mov         eax,edi
 0068824B    mov         edx,3
 00688250    call        @UStrCatN
>00688255    jmp         0068845A
 0068825A    push        dword ptr [ebp-4]
 0068825D    push        68858C;' xor '
 00688262    push        dword ptr [ebp-8]
 00688265    mov         eax,edi
 00688267    mov         edx,3
 0068826C    call        @UStrCatN
>00688271    jmp         0068845A
 00688276    push        dword ptr [ebp-4]
 00688279    push        6885A4;' & '
 0068827E    push        dword ptr [ebp-8]
 00688281    mov         eax,edi
 00688283    mov         edx,3
 00688288    call        @UStrCatN
>0068828D    jmp         0068845A
 00688292    push        dword ptr [ebp-4]
 00688295    push        6885B8;' | '
 0068829A    push        dword ptr [ebp-8]
 0068829D    mov         eax,edi
 0068829F    mov         edx,3
 006882A4    call        @UStrCatN
>006882A9    jmp         0068845A
 006882AE    push        dword ptr [ebp-4]
 006882B1    push        6885CC;^gvar_00580020
 006882B6    push        dword ptr [ebp-8]
 006882B9    mov         eax,edi
 006882BB    mov         edx,3
 006882C0    call        @UStrCatN
>006882C5    jmp         0068845A
 006882CA    push        dword ptr [ebp-4]
 006882CD    push        6885E4;' SHL '
 006882D2    push        dword ptr [ebp-8]
 006882D5    mov         eax,edi
 006882D7    mov         edx,3
 006882DC    call        @UStrCatN
>006882E1    jmp         0068845A
 006882E6    push        dword ptr [ebp-4]
 006882E9    push        6885FC;' SHR '
 006882EE    push        dword ptr [ebp-8]
 006882F1    mov         eax,edi
 006882F3    mov         edx,3
 006882F8    call        @UStrCatN
>006882FD    jmp         0068845A
 00688302    push        dword ptr [ebp-4]
 00688305    push        688614;'<'
 0068830A    push        dword ptr [ebp-8]
 0068830D    mov         eax,edi
 0068830F    mov         edx,3
 00688314    call        @UStrCatN
>00688319    jmp         0068845A
 0068831E    push        dword ptr [ebp-4]
 00688321    push        688624;'<='
 00688326    push        dword ptr [ebp-8]
 00688329    mov         eax,edi
 0068832B    mov         edx,3
 00688330    call        @UStrCatN
>00688335    jmp         0068845A
 0068833A    push        dword ptr [ebp-4]
 0068833D    push        688638;'=='
 00688342    push        dword ptr [ebp-8]
 00688345    mov         eax,edi
 00688347    mov         edx,3
 0068834C    call        @UStrCatN
>00688351    jmp         0068845A
 00688356    push        dword ptr [ebp-4]
 00688359    push        68864C;'~='
 0068835E    push        dword ptr [ebp-8]
 00688361    mov         eax,edi
 00688363    mov         edx,3
 00688368    call        @UStrCatN
>0068836D    jmp         0068845A
 00688372    push        dword ptr [ebp-4]
 00688375    push        688660;'!~='
 0068837A    push        dword ptr [ebp-8]
 0068837D    mov         eax,edi
 0068837F    mov         edx,3
 00688384    call        @UStrCatN
>00688389    jmp         0068845A
 0068838E    push        dword ptr [ebp-4]
 00688391    push        688674;'>='
 00688396    push        dword ptr [ebp-8]
 00688399    mov         eax,edi
 0068839B    mov         edx,3
 006883A0    call        @UStrCatN
>006883A5    jmp         0068845A
 006883AA    push        dword ptr [ebp-4]
 006883AD    push        688688;'>'
 006883B2    push        dword ptr [ebp-8]
 006883B5    mov         eax,edi
 006883B7    mov         edx,3
 006883BC    call        @UStrCatN
>006883C1    jmp         0068845A
 006883C6    push        dword ptr [ebp-4]
 006883C9    push        688698;'~<'
 006883CE    push        dword ptr [ebp-8]
 006883D1    mov         eax,edi
 006883D3    mov         edx,3
 006883D8    call        @UStrCatN
>006883DD    jmp         0068845A
 006883DF    push        dword ptr [ebp-4]
 006883E2    push        6886AC;'~<='
 006883E7    push        dword ptr [ebp-8]
 006883EA    mov         eax,edi
 006883EC    mov         edx,3
 006883F1    call        @UStrCatN
>006883F6    jmp         0068845A
 006883F8    push        dword ptr [ebp-4]
 006883FB    push        6886C0;'~>'
 00688400    push        dword ptr [ebp-8]
 00688403    mov         eax,edi
 00688405    mov         edx,3
 0068840A    call        @UStrCatN
>0068840F    jmp         0068845A
 00688411    push        dword ptr [ebp-4]
 00688414    push        6886D4;'~>='
 00688419    push        dword ptr [ebp-8]
 0068841C    mov         eax,edi
 0068841E    mov         edx,3
 00688423    call        @UStrCatN
>00688428    jmp         0068845A
 0068842A    push        dword ptr [ebp-4]
 0068842D    push        6886E8;'!='
 00688432    push        dword ptr [ebp-8]
 00688435    mov         eax,edi
 00688437    mov         edx,3
 0068843C    call        @UStrCatN
>00688441    jmp         0068845A
 00688443    push        dword ptr [ebp-4]
 00688446    push        6886FC;' ? '
 0068844B    push        dword ptr [ebp-8]
 0068844E    mov         eax,edi
 00688450    mov         edx,3
 00688455    call        @UStrCatN
 0068845A    xor         eax,eax
 0068845C    pop         edx
 0068845D    pop         ecx
 0068845E    pop         ecx
 0068845F    mov         dword ptr fs:[eax],edx
 00688462    push        68847C
 00688467    lea         eax,[ebp-10]
 0068846A    mov         edx,4
 0068846F    call        @UStrArrayClr
 00688474    ret
>00688475    jmp         @HandleFinally
>0068847A    jmp         00688467
 0068847C    pop         edi
 0068847D    pop         esi
 0068847E    pop         ebx
 0068847F    mov         esp,ebp
 00688481    pop         ebp
 00688482    ret
end;*}

//00688704
procedure TBinaryOp.SetIffy(IsIffy:Boolean);
begin
{*
 00688704    push        ebx
 00688705    push        esi
 00688706    mov         ebx,edx
 00688708    mov         esi,eax
 0068870A    mov         edx,ebx
 0068870C    mov         eax,esi
 0068870E    call        TExpression.SetIffy
 00688713    mov         edx,ebx
 00688715    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00688718    mov         ecx,dword ptr [eax]
 0068871A    call        dword ptr [ecx+74];TExpression.SetIffy
 0068871D    mov         edx,ebx
 0068871F    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00688722    mov         ecx,dword ptr [eax]
 00688724    call        dword ptr [ecx+74];TExpression.SetIffy
 00688727    pop         esi
 00688728    pop         ebx
 00688729    ret
*}
end;

//0068872C
destructor TBinaryOp.Destroy();
begin
{*
 0068872C    push        ebx
 0068872D    push        esi
 0068872E    call        @BeforeDestruction
 00688733    mov         ebx,edx
 00688735    mov         esi,eax
 00688737    lea         eax,[esi+18];TBinaryOp.LHS:TExpression
 0068873A    mov         edx,dword ptr [eax]
 0068873C    xor         ecx,ecx
 0068873E    mov         dword ptr [eax],ecx
 00688740    mov         eax,edx
 00688742    call        TObject.Free
 00688747    lea         eax,[esi+1C];TBinaryOp.RHS:TExpression
 0068874A    mov         edx,dword ptr [eax]
 0068874C    xor         ecx,ecx
 0068874E    mov         dword ptr [eax],ecx
 00688750    mov         eax,edx
 00688752    call        TObject.Free
 00688757    mov         edx,ebx
 00688759    and         dl,0FC
 0068875C    mov         eax,esi
 0068875E    call        TObject.Destroy
 00688763    test        bl,bl
>00688765    jle         0068876E
 00688767    mov         eax,esi
 00688769    call        @ClassDestroy
 0068876E    pop         esi
 0068876F    pop         ebx
 00688770    ret
*}
end;

//00688774
procedure TBinaryOp.CreateClone;
begin
{*
 00688774    mov         dl,1
 00688776    mov         eax,[00680DF8];TBinaryOp
 0068877B    call        TObject.Create;TBinaryOp.Create
 00688780    ret
*}
end;

//00688784
procedure TBinaryOp.FillClone(c:TExpression);
begin
{*
 00688784    push        ebx
 00688785    push        esi
 00688786    push        edi
 00688787    mov         esi,edx
 00688789    mov         ebx,eax
 0068878B    mov         edx,esi
 0068878D    mov         eax,ebx
 0068878F    call        TExpression.FillClone
 00688794    mov         eax,dword ptr [ebx+18];TBinaryOp.LHS:TExpression
 00688797    call        TExpression.Clone
 0068879C    mov         edi,esi
 0068879E    mov         dword ptr [edi+18],eax
 006887A1    mov         eax,dword ptr [ebx+1C];TBinaryOp.RHS:TExpression
 006887A4    call        TExpression.Clone
 006887A9    mov         dword ptr [edi+1C],eax
 006887AC    movzx       eax,byte ptr [ebx+20];TBinaryOp.Operation:TOperation
 006887B0    mov         byte ptr [edi+20],al
 006887B3    pop         edi
 006887B4    pop         esi
 006887B5    pop         ebx
 006887B6    ret
*}
end;

//006887B8
procedure TBinaryOp.GetVector(x:Double; y:Double; z:Double);
begin
{*
 006887B8    push        ebp
 006887B9    mov         ebp,esp
 006887BB    add         esp,0FFFFFF54
 006887C1    push        ebx
 006887C2    push        esi
 006887C3    mov         dword ptr [ebp-8],ecx
 006887C6    mov         dword ptr [ebp-4],edx
 006887C9    mov         esi,eax
 006887CB    mov         eax,esi
 006887CD    mov         edx,dword ptr [eax]
 006887CF    call        dword ptr [edx+44];TBinaryOp.GetDataType
 006887D2    cmp         al,6
>006887D4    jne         00688812
 006887D6    lea         edx,[ebp-90]
 006887DC    mov         eax,esi
 006887DE    mov         ecx,dword ptr [eax]
 006887E0    call        dword ptr [ecx+40];TBinaryOp.GetRotMat
 006887E3    mov         eax,dword ptr [ebp-4]
 006887E6    mov         edx,dword ptr [ebp-60]
 006887E9    mov         dword ptr [eax],edx
 006887EB    mov         edx,dword ptr [ebp-5C]
 006887EE    mov         dword ptr [eax+4],edx
 006887F1    mov         eax,dword ptr [ebp-8]
 006887F4    mov         edx,dword ptr [ebp-58]
 006887F7    mov         dword ptr [eax],edx
 006887F9    mov         edx,dword ptr [ebp-54]
 006887FC    mov         dword ptr [eax+4],edx
 006887FF    mov         eax,dword ptr [ebp+8]
 00688802    mov         edx,dword ptr [ebp-50]
 00688805    mov         dword ptr [eax],edx
 00688807    mov         edx,dword ptr [ebp-4C]
 0068880A    mov         dword ptr [eax+4],edx
>0068880D    jmp         00689303
 00688812    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00688815    mov         edx,dword ptr [eax]
 00688817    call        dword ptr [edx+44];TExpression.GetDataType
 0068881A    mov         ebx,eax
 0068881C    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 0068881F    mov         edx,dword ptr [eax]
 00688821    call        dword ptr [edx+44];TExpression.GetDataType
 00688824    mov         edx,dword ptr [ebp-4]
 00688827    xor         ecx,ecx
 00688829    mov         dword ptr [edx],ecx
 0068882B    mov         dword ptr [edx+4],ecx
 0068882E    mov         edx,dword ptr [ebp-8]
 00688831    xor         ecx,ecx
 00688833    mov         dword ptr [edx],ecx
 00688835    mov         dword ptr [edx+4],ecx
 00688838    mov         edx,dword ptr [ebp+8]
 0068883B    xor         ecx,ecx
 0068883D    mov         dword ptr [edx],ecx
 0068883F    mov         dword ptr [edx+4],ecx
 00688842    cmp         bl,5
>00688845    je          0068884B
 00688847    cmp         al,5
>00688849    jne         00688863
 0068884B    movzx       edx,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 0068884F    add         dl,0F8
 00688852    sub         dl,2
>00688855    jb          00688863
 00688857    dec         edx
 00688858    sub         dl,3
>0068885B    jb          00688863
 0068885D    dec         edx
 0068885E    sub         dl,0F
>00688861    jae         00688875
 00688863    mov         eax,esi
 00688865    mov         edx,dword ptr [eax]
 00688867    call        dword ptr [edx+2C];TBinaryOp.GetValue
 0068886A    mov         eax,dword ptr [ebp+8]
 0068886D    fstp        qword ptr [eax]
 0068886F    wait
>00688870    jmp         00689303
 00688875    cmp         bl,5
>00688878    jne         0068898A
 0068887E    cmp         al,5
>00688880    jne         0068898A
 00688886    lea         eax,[ebp-30]
 00688889    push        eax
 0068888A    lea         ecx,[ebp-28]
 0068888D    lea         edx,[ebp-20]
 00688890    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00688893    mov         ebx,dword ptr [eax]
 00688895    call        dword ptr [ebx+20];TExpression.EvaluateVector
 00688898    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 0068889C    test        al,al
>0068889E    je          006888A4
 006888A0    cmp         al,1
>006888A2    jne         006888BC
 006888A4    lea         eax,[ebp-40]
 006888A7    push        eax
 006888A8    lea         eax,[ebp-48]
 006888AB    push        eax
 006888AC    lea         ecx,[ebp-38]
 006888AF    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006888B2    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006888B5    mov         ebx,dword ptr [eax]
 006888B7    call        dword ptr [ebx+28];TExpression.EvaluateVectorToMatchAdd
>006888BA    jmp         006888D2
 006888BC    lea         eax,[ebp-40]
 006888BF    push        eax
 006888C0    lea         eax,[ebp-48]
 006888C3    push        eax
 006888C4    lea         ecx,[ebp-38]
 006888C7    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006888CA    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006888CD    mov         ebx,dword ptr [eax]
 006888CF    call        dword ptr [ebx+24];TExpression.EvaluateVectorToMatch
 006888D2    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 006888D6    sub         al,1
>006888D8    jb          006888E5
>006888DA    je          0068890E
 006888DC    dec         al
>006888DE    je          00688937
>006888E0    jmp         00688978
 006888E5    fld         qword ptr [ebp-20]
 006888E8    fadd        qword ptr [ebp-38]
 006888EB    mov         eax,dword ptr [ebp-4]
 006888EE    fstp        qword ptr [eax]
 006888F0    wait
 006888F1    fld         qword ptr [ebp-28]
 006888F4    fadd        qword ptr [ebp-40]
 006888F7    mov         eax,dword ptr [ebp-8]
 006888FA    fstp        qword ptr [eax]
 006888FC    wait
 006888FD    fld         qword ptr [ebp-30]
 00688900    fadd        qword ptr [ebp-48]
 00688903    mov         eax,dword ptr [ebp+8]
 00688906    fstp        qword ptr [eax]
 00688908    wait
>00688909    jmp         00689303
 0068890E    fld         qword ptr [ebp-20]
 00688911    fsub        qword ptr [ebp-38]
 00688914    mov         eax,dword ptr [ebp-4]
 00688917    fstp        qword ptr [eax]
 00688919    wait
 0068891A    fld         qword ptr [ebp-28]
 0068891D    fsub        qword ptr [ebp-40]
 00688920    mov         eax,dword ptr [ebp-8]
 00688923    fstp        qword ptr [eax]
 00688925    wait
 00688926    fld         qword ptr [ebp-30]
 00688929    fsub        qword ptr [ebp-48]
 0068892C    mov         eax,dword ptr [ebp+8]
 0068892F    fstp        qword ptr [eax]
 00688931    wait
>00688932    jmp         00689303
 00688937    fld         qword ptr [ebp-28]
 0068893A    fmul        qword ptr [ebp-48]
 0068893D    fld         qword ptr [ebp-40]
 00688940    fmul        qword ptr [ebp-30]
 00688943    fsubp       st(1),st
 00688945    mov         eax,dword ptr [ebp-4]
 00688948    fstp        qword ptr [eax]
 0068894A    wait
 0068894B    fld         qword ptr [ebp-30]
 0068894E    fmul        qword ptr [ebp-38]
 00688951    fld         qword ptr [ebp-48]
 00688954    fmul        qword ptr [ebp-20]
 00688957    fsubp       st(1),st
 00688959    mov         eax,dword ptr [ebp-8]
 0068895C    fstp        qword ptr [eax]
 0068895E    wait
 0068895F    fld         qword ptr [ebp-20]
 00688962    fmul        qword ptr [ebp-40]
 00688965    fld         qword ptr [ebp-38]
 00688968    fmul        qword ptr [ebp-28]
 0068896B    fsubp       st(1),st
 0068896D    mov         eax,dword ptr [ebp+8]
 00688970    fstp        qword ptr [eax]
 00688972    wait
>00688973    jmp         00689303
 00688978    mov         eax,esi
 0068897A    mov         edx,dword ptr [eax]
 0068897C    call        dword ptr [edx+2C];TBinaryOp.GetValue
 0068897F    mov         eax,dword ptr [ebp+8]
 00688982    fstp        qword ptr [eax]
 00688984    wait
>00688985    jmp         00689303
 0068898A    cmp         bl,5
>0068898D    jne         00688AD8
 00688993    cmp         al,6
>00688995    jne         00688AD8
 0068899B    lea         eax,[ebp-30]
 0068899E    push        eax
 0068899F    lea         ecx,[ebp-28]
 006889A2    lea         edx,[ebp-20]
 006889A5    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006889A8    mov         ebx,dword ptr [eax]
 006889AA    call        dword ptr [ebx+20];TExpression.EvaluateVector
 006889AD    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 006889B1    cmp         eax,3
>006889B4    jg          006889CF
>006889B6    je          00688A9E
 006889BC    sub         eax,1
>006889BF    jb          006889E6
>006889C1    je          00688A25
 006889C3    dec         eax
>006889C4    je          00688A64
>006889CA    jmp         00689303
 006889CF    sub         eax,5
>006889D2    je          00688A9E
 006889D8    sub         eax,1A
>006889DB    je          00688A64
>006889E1    jmp         00689303
 006889E6    lea         eax,[ebp-40]
 006889E9    push        eax
 006889EA    lea         eax,[ebp-48]
 006889ED    push        eax
 006889EE    lea         ecx,[ebp-38]
 006889F1    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006889F4    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006889F7    mov         ebx,dword ptr [eax]
 006889F9    call        dword ptr [ebx+28];TExpression.EvaluateVectorToMatchAdd
 006889FC    fld         qword ptr [ebp-20]
 006889FF    fadd        qword ptr [ebp-38]
 00688A02    mov         eax,dword ptr [ebp-4]
 00688A05    fstp        qword ptr [eax]
 00688A07    wait
 00688A08    fld         qword ptr [ebp-28]
 00688A0B    fadd        qword ptr [ebp-40]
 00688A0E    mov         eax,dword ptr [ebp-8]
 00688A11    fstp        qword ptr [eax]
 00688A13    wait
 00688A14    fld         qword ptr [ebp-30]
 00688A17    fadd        qword ptr [ebp-48]
 00688A1A    mov         eax,dword ptr [ebp+8]
 00688A1D    fstp        qword ptr [eax]
 00688A1F    wait
>00688A20    jmp         00689303
 00688A25    lea         eax,[ebp-40]
 00688A28    push        eax
 00688A29    lea         eax,[ebp-48]
 00688A2C    push        eax
 00688A2D    lea         ecx,[ebp-38]
 00688A30    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00688A33    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00688A36    mov         ebx,dword ptr [eax]
 00688A38    call        dword ptr [ebx+28];TExpression.EvaluateVectorToMatchAdd
 00688A3B    fld         qword ptr [ebp-20]
 00688A3E    fsub        qword ptr [ebp-38]
 00688A41    mov         eax,dword ptr [ebp-4]
 00688A44    fstp        qword ptr [eax]
 00688A46    wait
 00688A47    fld         qword ptr [ebp-28]
 00688A4A    fsub        qword ptr [ebp-40]
 00688A4D    mov         eax,dword ptr [ebp-8]
 00688A50    fstp        qword ptr [eax]
 00688A52    wait
 00688A53    fld         qword ptr [ebp-30]
 00688A56    fsub        qword ptr [ebp-48]
 00688A59    mov         eax,dword ptr [ebp+8]
 00688A5C    fstp        qword ptr [eax]
 00688A5E    wait
>00688A5F    jmp         00689303
 00688A64    lea         edx,[ebp-90]
 00688A6A    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00688A6D    mov         ecx,dword ptr [eax]
 00688A6F    call        dword ptr [ecx+40];TExpression.GetRotMat
 00688A72    push        dword ptr [ebp-1C]
 00688A75    push        dword ptr [ebp-20]
 00688A78    push        dword ptr [ebp-24]
 00688A7B    push        dword ptr [ebp-28]
 00688A7E    push        dword ptr [ebp-2C]
 00688A81    push        dword ptr [ebp-30]
 00688A84    lea         eax,[ebp-90]
 00688A8A    push        eax
 00688A8B    mov         ecx,dword ptr [ebp+8]
 00688A8E    mov         edx,dword ptr [ebp-8]
 00688A91    mov         eax,dword ptr [ebp-4]
 00688A94    call        005C3ECC
>00688A99    jmp         00689303
 00688A9E    lea         edx,[ebp-90]
 00688AA4    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00688AA7    mov         ecx,dword ptr [eax]
 00688AA9    call        dword ptr [ecx+40];TExpression.GetRotMat
 00688AAC    push        dword ptr [ebp-1C]
 00688AAF    push        dword ptr [ebp-20]
 00688AB2    push        dword ptr [ebp-24]
 00688AB5    push        dword ptr [ebp-28]
 00688AB8    push        dword ptr [ebp-2C]
 00688ABB    push        dword ptr [ebp-30]
 00688ABE    lea         eax,[ebp-90]
 00688AC4    push        eax
 00688AC5    mov         ecx,dword ptr [ebp+8]
 00688AC8    mov         edx,dword ptr [ebp-8]
 00688ACB    mov         eax,dword ptr [ebp-4]
 00688ACE    call        005C3F38
>00688AD3    jmp         00689303
 00688AD8    cmp         al,5
>00688ADA    jne         00688C14
 00688AE0    cmp         bl,6
>00688AE3    jne         00688C14
 00688AE9    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 00688AED    cmp         eax,3
>00688AF0    jg          00688B0B
>00688AF2    je          00688BDA
 00688AF8    sub         eax,1
>00688AFB    jb          00688B22
>00688AFD    je          00688B61
 00688AFF    dec         eax
>00688B00    je          00688BA0
>00688B06    jmp         00689303
 00688B0B    sub         eax,5
>00688B0E    je          00688BDA
 00688B14    sub         eax,1A
>00688B17    je          00688BA0
>00688B1D    jmp         00689303
 00688B22    lea         eax,[ebp-40]
 00688B25    push        eax
 00688B26    lea         eax,[ebp-48]
 00688B29    push        eax
 00688B2A    lea         ecx,[ebp-38]
 00688B2D    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00688B30    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00688B33    mov         ebx,dword ptr [eax]
 00688B35    call        dword ptr [ebx+28];TExpression.EvaluateVectorToMatchAdd
 00688B38    fld         qword ptr [ebp-20]
 00688B3B    fadd        qword ptr [ebp-38]
 00688B3E    mov         eax,dword ptr [ebp-4]
 00688B41    fstp        qword ptr [eax]
 00688B43    wait
 00688B44    fld         qword ptr [ebp-28]
 00688B47    fadd        qword ptr [ebp-40]
 00688B4A    mov         eax,dword ptr [ebp-8]
 00688B4D    fstp        qword ptr [eax]
 00688B4F    wait
 00688B50    fld         qword ptr [ebp-30]
 00688B53    fadd        qword ptr [ebp-48]
 00688B56    mov         eax,dword ptr [ebp+8]
 00688B59    fstp        qword ptr [eax]
 00688B5B    wait
>00688B5C    jmp         00689303
 00688B61    lea         eax,[ebp-40]
 00688B64    push        eax
 00688B65    lea         eax,[ebp-48]
 00688B68    push        eax
 00688B69    lea         ecx,[ebp-38]
 00688B6C    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00688B6F    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00688B72    mov         ebx,dword ptr [eax]
 00688B74    call        dword ptr [ebx+28];TExpression.EvaluateVectorToMatchAdd
 00688B77    fld         qword ptr [ebp-20]
 00688B7A    fsub        qword ptr [ebp-38]
 00688B7D    mov         eax,dword ptr [ebp-4]
 00688B80    fstp        qword ptr [eax]
 00688B82    wait
 00688B83    fld         qword ptr [ebp-28]
 00688B86    fsub        qword ptr [ebp-40]
 00688B89    mov         eax,dword ptr [ebp-8]
 00688B8C    fstp        qword ptr [eax]
 00688B8E    wait
 00688B8F    fld         qword ptr [ebp-30]
 00688B92    fsub        qword ptr [ebp-48]
 00688B95    mov         eax,dword ptr [ebp+8]
 00688B98    fstp        qword ptr [eax]
 00688B9A    wait
>00688B9B    jmp         00689303
 00688BA0    lea         edx,[ebp-90]
 00688BA6    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00688BA9    mov         ecx,dword ptr [eax]
 00688BAB    call        dword ptr [ecx+40];TExpression.GetRotMat
 00688BAE    push        dword ptr [ebp-1C]
 00688BB1    push        dword ptr [ebp-20]
 00688BB4    push        dword ptr [ebp-24]
 00688BB7    push        dword ptr [ebp-28]
 00688BBA    push        dword ptr [ebp-2C]
 00688BBD    push        dword ptr [ebp-30]
 00688BC0    lea         eax,[ebp-90]
 00688BC6    push        eax
 00688BC7    mov         ecx,dword ptr [ebp+8]
 00688BCA    mov         edx,dword ptr [ebp-8]
 00688BCD    mov         eax,dword ptr [ebp-4]
 00688BD0    call        005C3F38
>00688BD5    jmp         00689303
 00688BDA    lea         edx,[ebp-90]
 00688BE0    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00688BE3    mov         ecx,dword ptr [eax]
 00688BE5    call        dword ptr [ecx+40];TExpression.GetRotMat
 00688BE8    push        dword ptr [ebp-1C]
 00688BEB    push        dword ptr [ebp-20]
 00688BEE    push        dword ptr [ebp-24]
 00688BF1    push        dword ptr [ebp-28]
 00688BF4    push        dword ptr [ebp-2C]
 00688BF7    push        dword ptr [ebp-30]
 00688BFA    lea         eax,[ebp-90]
 00688C00    push        eax
 00688C01    mov         ecx,dword ptr [ebp+8]
 00688C04    mov         edx,dword ptr [ebp-8]
 00688C07    mov         eax,dword ptr [ebp-4]
 00688C0A    call        005C3ECC
>00688C0F    jmp         00689303
 00688C14    cmp         bl,5
>00688C17    jne         00688F78
 00688C1D    lea         eax,[ebp-30]
 00688C20    push        eax
 00688C21    lea         ecx,[ebp-28]
 00688C24    lea         edx,[ebp-20]
 00688C27    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00688C2A    mov         ebx,dword ptr [eax]
 00688C2C    call        dword ptr [ebx+20];TExpression.EvaluateVector
 00688C2F    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00688C32    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00688C35    mov         ecx,dword ptr [eax]
 00688C37    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 00688C3A    fstp        qword ptr [ebp-18]
 00688C3D    wait
 00688C3E    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 00688C42    cmp         eax,7
>00688C45    ja          00689303
 00688C4B    jmp         dword ptr [eax*4+688C52]
 00688C4B    dd          00688C72
 00688C4B    dd          00688D35
 00688C4B    dd          00688DF5
 00688C4B    dd          00688E1E
 00688C4B    dd          00688E47
 00688C4B    dd          00688E6A
 00688C4B    dd          00688EF0
 00688C4B    dd          00688F52
 00688C72    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00688C75    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00688C78    mov         ecx,dword ptr [eax]
 00688C7A    call        dword ptr [ecx+18];TExpression.EvaluateToMatchAdd
 00688C7D    fstp        qword ptr [ebp-18]
 00688C80    wait
 00688C81    fld         qword ptr [ebp-20]
 00688C84    fmul        st,st(0)
 00688C86    fstp        tbyte ptr [ebp-9C]
 00688C8C    wait
 00688C8D    fld         qword ptr [ebp-28]
 00688C90    fmul        st,st(0)
 00688C92    fld         tbyte ptr [ebp-9C]
 00688C98    faddp       st(1),st
 00688C9A    fstp        tbyte ptr [ebp-0A8]
 00688CA0    wait
 00688CA1    fld         qword ptr [ebp-30]
 00688CA4    fmul        st,st(0)
 00688CA6    fld         tbyte ptr [ebp-0A8]
 00688CAC    faddp       st(1),st
 00688CAE    add         esp,0FFFFFFF4
 00688CB1    fstp        tbyte ptr [esp]
 00688CB4    wait
 00688CB5    call        Sqrt
 00688CBA    fstp        qword ptr [ebp-10]
 00688CBD    wait
 00688CBE    fld         qword ptr [ebp-10]
 00688CC1    fcomp       dword ptr ds:[68930C];0:Single
 00688CC7    wait
 00688CC8    fnstsw      al
 00688CCA    sahf
>00688CCB    jne         00688CF4
 00688CCD    mov         eax,dword ptr [ebp-4]
 00688CD0    xor         edx,edx
 00688CD2    mov         dword ptr [eax],edx
 00688CD4    mov         dword ptr [eax+4],edx
 00688CD7    mov         eax,dword ptr [ebp-8]
 00688CDA    xor         edx,edx
 00688CDC    mov         dword ptr [eax],edx
 00688CDE    mov         dword ptr [eax+4],edx
 00688CE1    mov         eax,dword ptr [ebp+8]
 00688CE4    mov         edx,dword ptr [ebp-18]
 00688CE7    mov         dword ptr [eax],edx
 00688CE9    mov         edx,dword ptr [ebp-14]
 00688CEC    mov         dword ptr [eax+4],edx
>00688CEF    jmp         00689303
 00688CF4    fld         qword ptr [ebp-20]
 00688CF7    fdiv        qword ptr [ebp-10]
 00688CFA    fld         qword ptr [ebp-10]
 00688CFD    fadd        qword ptr [ebp-18]
 00688D00    fmulp       st(1),st
 00688D02    mov         eax,dword ptr [ebp-4]
 00688D05    fstp        qword ptr [eax]
 00688D07    wait
 00688D08    fld         qword ptr [ebp-28]
 00688D0B    fdiv        qword ptr [ebp-10]
 00688D0E    fld         qword ptr [ebp-10]
 00688D11    fadd        qword ptr [ebp-18]
 00688D14    fmulp       st(1),st
 00688D16    mov         eax,dword ptr [ebp-8]
 00688D19    fstp        qword ptr [eax]
 00688D1B    wait
 00688D1C    fld         qword ptr [ebp-30]
 00688D1F    fdiv        qword ptr [ebp-10]
 00688D22    fld         qword ptr [ebp-10]
 00688D25    fadd        qword ptr [ebp-18]
 00688D28    fmulp       st(1),st
 00688D2A    mov         eax,dword ptr [ebp+8]
 00688D2D    fstp        qword ptr [eax]
 00688D2F    wait
>00688D30    jmp         00689303
 00688D35    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00688D38    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00688D3B    mov         ecx,dword ptr [eax]
 00688D3D    call        dword ptr [ecx+18];TExpression.EvaluateToMatchAdd
 00688D40    fstp        qword ptr [ebp-18]
 00688D43    wait
 00688D44    fld         qword ptr [ebp-20]
 00688D47    fmul        st,st(0)
 00688D49    fstp        tbyte ptr [ebp-9C]
 00688D4F    wait
 00688D50    fld         qword ptr [ebp-28]
 00688D53    fmul        st,st(0)
 00688D55    fld         tbyte ptr [ebp-9C]
 00688D5B    faddp       st(1),st
 00688D5D    fstp        tbyte ptr [ebp-0A8]
 00688D63    wait
 00688D64    fld         qword ptr [ebp-30]
 00688D67    fmul        st,st(0)
 00688D69    fld         tbyte ptr [ebp-0A8]
 00688D6F    faddp       st(1),st
 00688D71    add         esp,0FFFFFFF4
 00688D74    fstp        tbyte ptr [esp]
 00688D77    wait
 00688D78    call        Sqrt
 00688D7D    fstp        qword ptr [ebp-10]
 00688D80    wait
 00688D81    fld         qword ptr [ebp-10]
 00688D84    fcomp       dword ptr ds:[68930C];0:Single
 00688D8A    wait
 00688D8B    fnstsw      al
 00688D8D    sahf
>00688D8E    jne         00688DB4
 00688D90    mov         eax,dword ptr [ebp-4]
 00688D93    xor         edx,edx
 00688D95    mov         dword ptr [eax],edx
 00688D97    mov         dword ptr [eax+4],edx
 00688D9A    mov         eax,dword ptr [ebp-8]
 00688D9D    xor         edx,edx
 00688D9F    mov         dword ptr [eax],edx
 00688DA1    mov         dword ptr [eax+4],edx
 00688DA4    fld         qword ptr [ebp-18]
 00688DA7    fchs
 00688DA9    mov         eax,dword ptr [ebp+8]
 00688DAC    fstp        qword ptr [eax]
 00688DAE    wait
>00688DAF    jmp         00689303
 00688DB4    fld         qword ptr [ebp-20]
 00688DB7    fdiv        qword ptr [ebp-10]
 00688DBA    fld         qword ptr [ebp-10]
 00688DBD    fsub        qword ptr [ebp-18]
 00688DC0    fmulp       st(1),st
 00688DC2    mov         eax,dword ptr [ebp-4]
 00688DC5    fstp        qword ptr [eax]
 00688DC7    wait
 00688DC8    fld         qword ptr [ebp-28]
 00688DCB    fdiv        qword ptr [ebp-10]
 00688DCE    fld         qword ptr [ebp-10]
 00688DD1    fsub        qword ptr [ebp-18]
 00688DD4    fmulp       st(1),st
 00688DD6    mov         eax,dword ptr [ebp-8]
 00688DD9    fstp        qword ptr [eax]
 00688DDB    wait
 00688DDC    fld         qword ptr [ebp-30]
 00688DDF    fdiv        qword ptr [ebp-10]
 00688DE2    fld         qword ptr [ebp-10]
 00688DE5    fsub        qword ptr [ebp-18]
 00688DE8    fmulp       st(1),st
 00688DEA    mov         eax,dword ptr [ebp+8]
 00688DED    fstp        qword ptr [eax]
 00688DEF    wait
>00688DF0    jmp         00689303
 00688DF5    fld         qword ptr [ebp-20]
 00688DF8    fmul        qword ptr [ebp-18]
 00688DFB    mov         eax,dword ptr [ebp-4]
 00688DFE    fstp        qword ptr [eax]
 00688E00    wait
 00688E01    fld         qword ptr [ebp-28]
 00688E04    fmul        qword ptr [ebp-18]
 00688E07    mov         eax,dword ptr [ebp-8]
 00688E0A    fstp        qword ptr [eax]
 00688E0C    wait
 00688E0D    fld         qword ptr [ebp-30]
 00688E10    fmul        qword ptr [ebp-18]
 00688E13    mov         eax,dword ptr [ebp+8]
 00688E16    fstp        qword ptr [eax]
 00688E18    wait
>00688E19    jmp         00689303
 00688E1E    fld         qword ptr [ebp-20]
 00688E21    fdiv        qword ptr [ebp-18]
 00688E24    mov         eax,dword ptr [ebp-4]
 00688E27    fstp        qword ptr [eax]
 00688E29    wait
 00688E2A    fld         qword ptr [ebp-28]
 00688E2D    fdiv        qword ptr [ebp-18]
 00688E30    mov         eax,dword ptr [ebp-8]
 00688E33    fstp        qword ptr [eax]
 00688E35    wait
 00688E36    fld         qword ptr [ebp-30]
 00688E39    fdiv        qword ptr [ebp-18]
 00688E3C    mov         eax,dword ptr [ebp+8]
 00688E3F    fstp        qword ptr [eax]
 00688E41    wait
>00688E42    jmp         00689303
 00688E47    mov         eax,dword ptr [ebp-4]
 00688E4A    xor         edx,edx
 00688E4C    mov         dword ptr [eax],edx
 00688E4E    mov         dword ptr [eax+4],edx
 00688E51    mov         eax,dword ptr [ebp-8]
 00688E54    xor         edx,edx
 00688E56    mov         dword ptr [eax],edx
 00688E58    mov         dword ptr [eax+4],edx
 00688E5B    mov         eax,dword ptr [ebp+8]
 00688E5E    xor         edx,edx
 00688E60    mov         dword ptr [eax],edx
 00688E62    mov         dword ptr [eax+4],edx
>00688E65    jmp         00689303
 00688E6A    fld         qword ptr [ebp-20]
 00688E6D    add         esp,0FFFFFFF4
 00688E70    fstp        tbyte ptr [esp]
 00688E73    wait
 00688E74    fld         qword ptr [ebp-18]
 00688E77    add         esp,0FFFFFFF4
 00688E7A    fstp        tbyte ptr [esp]
 00688E7D    wait
 00688E7E    call        0068AE8C
 00688E83    mov         dword ptr [ebp-0AC],eax
 00688E89    fild        dword ptr [ebp-0AC]
 00688E8F    mov         eax,dword ptr [ebp-4]
 00688E92    fstp        qword ptr [eax]
 00688E94    wait
 00688E95    fld         qword ptr [ebp-28]
 00688E98    add         esp,0FFFFFFF4
 00688E9B    fstp        tbyte ptr [esp]
 00688E9E    wait
 00688E9F    fld         qword ptr [ebp-18]
 00688EA2    add         esp,0FFFFFFF4
 00688EA5    fstp        tbyte ptr [esp]
 00688EA8    wait
 00688EA9    call        0068AE8C
 00688EAE    mov         dword ptr [ebp-0AC],eax
 00688EB4    fild        dword ptr [ebp-0AC]
 00688EBA    mov         eax,dword ptr [ebp-8]
 00688EBD    fstp        qword ptr [eax]
 00688EBF    wait
 00688EC0    fld         qword ptr [ebp-30]
 00688EC3    add         esp,0FFFFFFF4
 00688EC6    fstp        tbyte ptr [esp]
 00688EC9    wait
 00688ECA    fld         qword ptr [ebp-18]
 00688ECD    add         esp,0FFFFFFF4
 00688ED0    fstp        tbyte ptr [esp]
 00688ED3    wait
 00688ED4    call        0068AE8C
 00688ED9    mov         dword ptr [ebp-0AC],eax
 00688EDF    fild        dword ptr [ebp-0AC]
 00688EE5    mov         eax,dword ptr [ebp+8]
 00688EE8    fstp        qword ptr [eax]
 00688EEA    wait
>00688EEB    jmp         00689303
 00688EF0    fld         qword ptr [ebp-20]
 00688EF3    add         esp,0FFFFFFF4
 00688EF6    fstp        tbyte ptr [esp]
 00688EF9    wait
 00688EFA    fld         qword ptr [ebp-18]
 00688EFD    add         esp,0FFFFFFF4
 00688F00    fstp        tbyte ptr [esp]
 00688F03    wait
 00688F04    call        0068AEA0
 00688F09    mov         eax,dword ptr [ebp-4]
 00688F0C    fstp        qword ptr [eax]
 00688F0E    wait
 00688F0F    fld         qword ptr [ebp-28]
 00688F12    add         esp,0FFFFFFF4
 00688F15    fstp        tbyte ptr [esp]
 00688F18    wait
 00688F19    fld         qword ptr [ebp-18]
 00688F1C    add         esp,0FFFFFFF4
 00688F1F    fstp        tbyte ptr [esp]
 00688F22    wait
 00688F23    call        0068AEA0
 00688F28    mov         eax,dword ptr [ebp-8]
 00688F2B    fstp        qword ptr [eax]
 00688F2D    wait
 00688F2E    fld         qword ptr [ebp-30]
 00688F31    add         esp,0FFFFFFF4
 00688F34    fstp        tbyte ptr [esp]
 00688F37    wait
 00688F38    fld         qword ptr [ebp-18]
 00688F3B    add         esp,0FFFFFFF4
 00688F3E    fstp        tbyte ptr [esp]
 00688F41    wait
 00688F42    call        0068AEA0
 00688F47    mov         eax,dword ptr [ebp+8]
 00688F4A    fstp        qword ptr [eax]
 00688F4C    wait
>00688F4D    jmp         00689303
 00688F52    mov         eax,dword ptr [ebp-4]
 00688F55    xor         edx,edx
 00688F57    mov         dword ptr [eax],edx
 00688F59    mov         dword ptr [eax+4],edx
 00688F5C    mov         eax,dword ptr [ebp-8]
 00688F5F    xor         edx,edx
 00688F61    mov         dword ptr [eax],edx
 00688F63    mov         dword ptr [eax+4],edx
 00688F66    mov         eax,esi
 00688F68    mov         edx,dword ptr [eax]
 00688F6A    call        dword ptr [edx+2C];TBinaryOp.GetValue
 00688F6D    mov         eax,dword ptr [ebp+8]
 00688F70    fstp        qword ptr [eax]
 00688F72    wait
>00688F73    jmp         00689303
 00688F78    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00688F7B    mov         edx,dword ptr [eax]
 00688F7D    call        dword ptr [edx];TExpression.Evaluate
 00688F7F    fstp        qword ptr [ebp-10]
 00688F82    wait
 00688F83    lea         eax,[ebp-40]
 00688F86    push        eax
 00688F87    lea         eax,[ebp-48]
 00688F8A    push        eax
 00688F8B    lea         ecx,[ebp-38]
 00688F8E    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00688F91    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00688F94    mov         ebx,dword ptr [eax]
 00688F96    call        dword ptr [ebx+24];TExpression.EvaluateVectorToMatch
 00688F99    movzx       eax,byte ptr [esi+20];TBinaryOp.Operation:TOperation
 00688F9D    cmp         eax,7
>00688FA0    ja          00689303
 00688FA6    jmp         dword ptr [eax*4+688FAD]
 00688FA6    dd          00688FCD
 00688FA6    dd          00689097
 00688FA6    dd          0068915E
 00688FA6    dd          00689187
 00688FA6    dd          006891B0
 00688FA6    dd          006891D6
 00688FA6    dd          0068925C
 00688FA6    dd          006892BB
 00688FCD    lea         eax,[ebp-40]
 00688FD0    push        eax
 00688FD1    lea         eax,[ebp-48]
 00688FD4    push        eax
 00688FD5    lea         ecx,[ebp-38]
 00688FD8    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00688FDB    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00688FDE    mov         ebx,dword ptr [eax]
 00688FE0    call        dword ptr [ebx+24];TExpression.EvaluateVectorToMatch
 00688FE3    fld         qword ptr [ebp-38]
 00688FE6    fmul        st,st(0)
 00688FE8    fstp        tbyte ptr [ebp-9C]
 00688FEE    wait
 00688FEF    fld         qword ptr [ebp-40]
 00688FF2    fmul        st,st(0)
 00688FF4    fld         tbyte ptr [ebp-9C]
 00688FFA    faddp       st(1),st
 00688FFC    fstp        tbyte ptr [ebp-0A8]
 00689002    wait
 00689003    fld         qword ptr [ebp-48]
 00689006    fmul        st,st(0)
 00689008    fld         tbyte ptr [ebp-0A8]
 0068900E    faddp       st(1),st
 00689010    add         esp,0FFFFFFF4
 00689013    fstp        tbyte ptr [esp]
 00689016    wait
 00689017    call        Sqrt
 0068901C    fstp        qword ptr [ebp-18]
 0068901F    wait
 00689020    fld         qword ptr [ebp-18]
 00689023    fcomp       dword ptr ds:[68930C];0:Single
 00689029    wait
 0068902A    fnstsw      al
 0068902C    sahf
>0068902D    jne         00689056
 0068902F    mov         eax,dword ptr [ebp-4]
 00689032    xor         edx,edx
 00689034    mov         dword ptr [eax],edx
 00689036    mov         dword ptr [eax+4],edx
 00689039    mov         eax,dword ptr [ebp-8]
 0068903C    xor         edx,edx
 0068903E    mov         dword ptr [eax],edx
 00689040    mov         dword ptr [eax+4],edx
 00689043    mov         eax,dword ptr [ebp+8]
 00689046    mov         edx,dword ptr [ebp-10]
 00689049    mov         dword ptr [eax],edx
 0068904B    mov         edx,dword ptr [ebp-0C]
 0068904E    mov         dword ptr [eax+4],edx
>00689051    jmp         00689303
 00689056    fld         qword ptr [ebp-38]
 00689059    fdiv        qword ptr [ebp-18]
 0068905C    fld         qword ptr [ebp-10]
 0068905F    fadd        qword ptr [ebp-18]
 00689062    fmulp       st(1),st
 00689064    mov         eax,dword ptr [ebp-4]
 00689067    fstp        qword ptr [eax]
 00689069    wait
 0068906A    fld         qword ptr [ebp-40]
 0068906D    fdiv        qword ptr [ebp-18]
 00689070    fld         qword ptr [ebp-10]
 00689073    fadd        qword ptr [ebp-18]
 00689076    fmulp       st(1),st
 00689078    mov         eax,dword ptr [ebp-8]
 0068907B    fstp        qword ptr [eax]
 0068907D    wait
 0068907E    fld         qword ptr [ebp-48]
 00689081    fdiv        qword ptr [ebp-18]
 00689084    fld         qword ptr [ebp-10]
 00689087    fadd        qword ptr [ebp-18]
 0068908A    fmulp       st(1),st
 0068908C    mov         eax,dword ptr [ebp+8]
 0068908F    fstp        qword ptr [eax]
 00689091    wait
>00689092    jmp         00689303
 00689097    lea         eax,[ebp-40]
 0068909A    push        eax
 0068909B    lea         eax,[ebp-48]
 0068909E    push        eax
 0068909F    lea         ecx,[ebp-38]
 006890A2    mov         edx,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 006890A5    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006890A8    mov         ebx,dword ptr [eax]
 006890AA    call        dword ptr [ebx+24];TExpression.EvaluateVectorToMatch
 006890AD    fld         qword ptr [ebp-38]
 006890B0    fmul        st,st(0)
 006890B2    fstp        tbyte ptr [ebp-9C]
 006890B8    wait
 006890B9    fld         qword ptr [ebp-40]
 006890BC    fmul        st,st(0)
 006890BE    fld         tbyte ptr [ebp-9C]
 006890C4    faddp       st(1),st
 006890C6    fstp        tbyte ptr [ebp-0A8]
 006890CC    wait
 006890CD    fld         qword ptr [ebp-48]
 006890D0    fmul        st,st(0)
 006890D2    fld         tbyte ptr [ebp-0A8]
 006890D8    faddp       st(1),st
 006890DA    add         esp,0FFFFFFF4
 006890DD    fstp        tbyte ptr [esp]
 006890E0    wait
 006890E1    call        Sqrt
 006890E6    fstp        qword ptr [ebp-18]
 006890E9    wait
 006890EA    fld         qword ptr [ebp-18]
 006890ED    fcomp       dword ptr ds:[68930C];0:Single
 006890F3    wait
 006890F4    fnstsw      al
 006890F6    sahf
>006890F7    jne         0068911D
 006890F9    mov         eax,dword ptr [ebp-4]
 006890FC    xor         edx,edx
 006890FE    mov         dword ptr [eax],edx
 00689100    mov         dword ptr [eax+4],edx
 00689103    mov         eax,dword ptr [ebp-8]
 00689106    xor         edx,edx
 00689108    mov         dword ptr [eax],edx
 0068910A    mov         dword ptr [eax+4],edx
 0068910D    fld         qword ptr [ebp-10]
 00689110    fchs
 00689112    mov         eax,dword ptr [ebp+8]
 00689115    fstp        qword ptr [eax]
 00689117    wait
>00689118    jmp         00689303
 0068911D    fld         qword ptr [ebp-38]
 00689120    fdiv        qword ptr [ebp-18]
 00689123    fld         qword ptr [ebp-10]
 00689126    fsub        qword ptr [ebp-18]
 00689129    fmulp       st(1),st
 0068912B    mov         eax,dword ptr [ebp-4]
 0068912E    fstp        qword ptr [eax]
 00689130    wait
 00689131    fld         qword ptr [ebp-40]
 00689134    fdiv        qword ptr [ebp-18]
 00689137    fld         qword ptr [ebp-10]
 0068913A    fsub        qword ptr [ebp-18]
 0068913D    fmulp       st(1),st
 0068913F    mov         eax,dword ptr [ebp-8]
 00689142    fstp        qword ptr [eax]
 00689144    wait
 00689145    fld         qword ptr [ebp-48]
 00689148    fdiv        qword ptr [ebp-18]
 0068914B    fld         qword ptr [ebp-10]
 0068914E    fsub        qword ptr [ebp-18]
 00689151    fmulp       st(1),st
 00689153    mov         eax,dword ptr [ebp+8]
 00689156    fstp        qword ptr [eax]
 00689158    wait
>00689159    jmp         00689303
 0068915E    fld         qword ptr [ebp-38]
 00689161    fmul        qword ptr [ebp-10]
 00689164    mov         eax,dword ptr [ebp-4]
 00689167    fstp        qword ptr [eax]
 00689169    wait
 0068916A    fld         qword ptr [ebp-40]
 0068916D    fmul        qword ptr [ebp-10]
 00689170    mov         eax,dword ptr [ebp-8]
 00689173    fstp        qword ptr [eax]
 00689175    wait
 00689176    fld         qword ptr [ebp-48]
 00689179    fmul        qword ptr [ebp-10]
 0068917C    mov         eax,dword ptr [ebp+8]
 0068917F    fstp        qword ptr [eax]
 00689181    wait
>00689182    jmp         00689303
 00689187    fld         qword ptr [ebp-10]
 0068918A    fdiv        qword ptr [ebp-38]
 0068918D    mov         eax,dword ptr [ebp-4]
 00689190    fstp        qword ptr [eax]
 00689192    wait
 00689193    fld         qword ptr [ebp-10]
 00689196    fdiv        qword ptr [ebp-40]
 00689199    mov         eax,dword ptr [ebp-8]
 0068919C    fstp        qword ptr [eax]
 0068919E    wait
 0068919F    fld         qword ptr [ebp-10]
 006891A2    fdiv        qword ptr [ebp-48]
 006891A5    mov         eax,dword ptr [ebp+8]
 006891A8    fstp        qword ptr [eax]
 006891AA    wait
>006891AB    jmp         00689303
 006891B0    mov         eax,dword ptr [ebp-4]
 006891B3    xor         edx,edx
 006891B5    mov         dword ptr [eax],edx
 006891B7    mov         dword ptr [eax+4],edx
 006891BA    mov         eax,dword ptr [ebp-8]
 006891BD    xor         edx,edx
 006891BF    mov         dword ptr [eax],edx
 006891C1    mov         dword ptr [eax+4],edx
 006891C4    mov         eax,esi
 006891C6    mov         edx,dword ptr [eax]
 006891C8    call        dword ptr [edx+2C];TBinaryOp.GetValue
 006891CB    mov         eax,dword ptr [ebp+8]
 006891CE    fstp        qword ptr [eax]
 006891D0    wait
>006891D1    jmp         00689303
 006891D6    fld         qword ptr [ebp-10]
 006891D9    add         esp,0FFFFFFF4
 006891DC    fstp        tbyte ptr [esp]
 006891DF    wait
 006891E0    fld         qword ptr [ebp-38]
 006891E3    add         esp,0FFFFFFF4
 006891E6    fstp        tbyte ptr [esp]
 006891E9    wait
 006891EA    call        0068AE8C
 006891EF    mov         dword ptr [ebp-0AC],eax
 006891F5    fild        dword ptr [ebp-0AC]
 006891FB    mov         eax,dword ptr [ebp-4]
 006891FE    fstp        qword ptr [eax]
 00689200    wait
 00689201    fld         qword ptr [ebp-10]
 00689204    add         esp,0FFFFFFF4
 00689207    fstp        tbyte ptr [esp]
 0068920A    wait
 0068920B    fld         qword ptr [ebp-40]
 0068920E    add         esp,0FFFFFFF4
 00689211    fstp        tbyte ptr [esp]
 00689214    wait
 00689215    call        0068AE8C
 0068921A    mov         dword ptr [ebp-0AC],eax
 00689220    fild        dword ptr [ebp-0AC]
 00689226    mov         eax,dword ptr [ebp-8]
 00689229    fstp        qword ptr [eax]
 0068922B    wait
 0068922C    fld         qword ptr [ebp-10]
 0068922F    add         esp,0FFFFFFF4
 00689232    fstp        tbyte ptr [esp]
 00689235    wait
 00689236    fld         qword ptr [ebp-48]
 00689239    add         esp,0FFFFFFF4
 0068923C    fstp        tbyte ptr [esp]
 0068923F    wait
 00689240    call        0068AE8C
 00689245    mov         dword ptr [ebp-0AC],eax
 0068924B    fild        dword ptr [ebp-0AC]
 00689251    mov         eax,dword ptr [ebp+8]
 00689254    fstp        qword ptr [eax]
 00689256    wait
>00689257    jmp         00689303
 0068925C    fld         qword ptr [ebp-10]
 0068925F    add         esp,0FFFFFFF4
 00689262    fstp        tbyte ptr [esp]
 00689265    wait
 00689266    fld         qword ptr [ebp-38]
 00689269    add         esp,0FFFFFFF4
 0068926C    fstp        tbyte ptr [esp]
 0068926F    wait
 00689270    call        0068AEA0
 00689275    mov         eax,dword ptr [ebp-4]
 00689278    fstp        qword ptr [eax]
 0068927A    wait
 0068927B    fld         qword ptr [ebp-10]
 0068927E    add         esp,0FFFFFFF4
 00689281    fstp        tbyte ptr [esp]
 00689284    wait
 00689285    fld         qword ptr [ebp-40]
 00689288    add         esp,0FFFFFFF4
 0068928B    fstp        tbyte ptr [esp]
 0068928E    wait
 0068928F    call        0068AEA0
 00689294    mov         eax,dword ptr [ebp-8]
 00689297    fstp        qword ptr [eax]
 00689299    wait
 0068929A    fld         qword ptr [ebp-10]
 0068929D    add         esp,0FFFFFFF4
 006892A0    fstp        tbyte ptr [esp]
 006892A3    wait
 006892A4    fld         qword ptr [ebp-48]
 006892A7    add         esp,0FFFFFFF4
 006892AA    fstp        tbyte ptr [esp]
 006892AD    wait
 006892AE    call        0068AEA0
 006892B3    mov         eax,dword ptr [ebp+8]
 006892B6    fstp        qword ptr [eax]
 006892B8    wait
>006892B9    jmp         00689303
 006892BB    lea         eax,[ebp-48]
 006892BE    push        eax
 006892BF    lea         ecx,[ebp-40]
 006892C2    lea         edx,[ebp-38]
 006892C5    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 006892C8    mov         ebx,dword ptr [eax]
 006892CA    call        dword ptr [ebx+20];TExpression.EvaluateVector
 006892CD    fld         qword ptr [ebp-10]
 006892D0    fdiv        dword ptr ds:[689310];100:Single
 006892D6    fmul        qword ptr [ebp-38]
 006892D9    mov         eax,dword ptr [ebp-4]
 006892DC    fstp        qword ptr [eax]
 006892DE    wait
 006892DF    fld         qword ptr [ebp-10]
 006892E2    fdiv        dword ptr ds:[689310];100:Single
 006892E8    fmul        qword ptr [ebp-40]
 006892EB    mov         eax,dword ptr [ebp-8]
 006892EE    fstp        qword ptr [eax]
 006892F0    wait
 006892F1    fld         qword ptr [ebp-10]
 006892F4    fdiv        dword ptr ds:[689310];100:Single
 006892FA    fmul        qword ptr [ebp-48]
 006892FD    mov         eax,dword ptr [ebp+8]
 00689300    fstp        qword ptr [eax]
 00689302    wait
 00689303    pop         esi
 00689304    pop         ebx
 00689305    mov         esp,ebp
 00689307    pop         ebp
 00689308    ret         4
*}
end;

//00689314
procedure TBinaryOp.GetRotMat(m:TRotMat);
begin
{*
 00689314    push        ebx
 00689315    push        esi
 00689316    push        edi
 00689317    push        ebp
 00689318    add         esp,0FFFFFF64
 0068931E    mov         esi,edx
 00689320    mov         edi,eax
 00689322    mov         eax,edi
 00689324    mov         edx,dword ptr [eax]
 00689326    call        dword ptr [edx+44];TBinaryOp.GetDataType
 00689329    cmp         al,6
>0068932B    je          0068933B
 0068932D    mov         edx,esi
 0068932F    mov         eax,edi
 00689331    call        TExpression.GetRotMat
>00689336    jmp         00689822
 0068933B    mov         eax,dword ptr [edi+18];TBinaryOp.LHS:TExpression
 0068933E    mov         edx,dword ptr [eax]
 00689340    call        dword ptr [edx+44];TExpression.GetDataType
 00689343    mov         ebx,eax
 00689345    mov         eax,dword ptr [edi+1C];TBinaryOp.RHS:TExpression
 00689348    mov         edx,dword ptr [eax]
 0068934A    call        dword ptr [edx+44];TExpression.GetDataType
 0068934D    mov         byte ptr [esp],al
 00689350    xor         eax,eax
 00689352    mov         dword ptr [esp+8],eax
 00689356    mov         dword ptr [esp+0C],eax
 0068935A    cmp         bl,6
>0068935D    je          00689379
 0068935F    mov         eax,dword ptr [edi+18];TBinaryOp.LHS:TExpression
 00689362    mov         edx,dword ptr [eax]
 00689364    call        dword ptr [edx];TExpression.Evaluate
 00689366    fstp        qword ptr [esp+8]
 0068936A    wait
 0068936B    lea         edx,[esp+50]
 0068936F    mov         eax,dword ptr [edi+1C];TBinaryOp.RHS:TExpression
 00689372    mov         ecx,dword ptr [eax]
 00689374    call        dword ptr [ecx+40];TExpression.GetRotMat
>00689377    jmp         00689397
 00689379    cmp         byte ptr [esp],6
>0068937D    je          00689397
 0068937F    mov         eax,dword ptr [edi+1C];TBinaryOp.RHS:TExpression
 00689382    mov         edx,dword ptr [eax]
 00689384    call        dword ptr [edx];TExpression.Evaluate
 00689386    fstp        qword ptr [esp+8]
 0068938A    wait
 0068938B    lea         edx,[esp+50]
 0068938F    mov         eax,dword ptr [edi+18];TBinaryOp.LHS:TExpression
 00689392    mov         ecx,dword ptr [eax]
 00689394    call        dword ptr [ecx+40];TExpression.GetRotMat
 00689397    cmp         bl,6
>0068939A    jne         006893A6
 0068939C    cmp         byte ptr [esp],6
>006893A0    je          00689741
 006893A6    movzx       eax,byte ptr [edi+20];TBinaryOp.Operation:TOperation
 006893AA    cmp         eax,1F
>006893AD    ja          00689822
 006893B3    movzx       eax,byte ptr [eax+6893C1]
 006893BA    jmp         dword ptr [eax*4+6893E1]
 006893BA    db          1
 006893BA    db          2
 006893BA    db          3
 006893BA    db          4
 006893BA    db          0
 006893BA    db          5
 006893BA    db          6
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          0
 006893BA    db          3
 006893BA    dd          00689822
 006893BA    dd          006893FD
 006893BA    dd          0068943F
 006893BA    dd          006894C8
 006893BA    dd          0068950A
 006893BA    dd          00689593
 006893BA    dd          00689678
 006893FD    mov         edi,3
 00689402    lea         eax,[esp+50]
 00689406    mov         dword ptr [esp+10],eax
 0068940A    mov         dword ptr [esp+14],esi
 0068940E    mov         ebx,3
 00689413    mov         eax,dword ptr [esp+10]
 00689417    mov         edx,dword ptr [esp+14]
 0068941B    fld         qword ptr [eax]
 0068941D    fadd        qword ptr [esp+8]
 00689421    fstp        qword ptr [edx]
 00689423    wait
 00689424    add         edx,8
 00689427    add         eax,8
 0068942A    dec         ebx
>0068942B    jne         0068941B
 0068942D    add         dword ptr [esp+14],18
 00689432    add         dword ptr [esp+10],18
 00689437    dec         edi
>00689438    jne         0068940E
>0068943A    jmp         00689822
 0068943F    cmp         bl,6
>00689442    je          00689486
 00689444    mov         edi,3
 00689449    lea         eax,[esp+50]
 0068944D    mov         dword ptr [esp+18],eax
 00689451    mov         dword ptr [esp+1C],esi
 00689455    mov         ebx,3
 0068945A    mov         eax,dword ptr [esp+18]
 0068945E    mov         edx,dword ptr [esp+1C]
 00689462    fld         qword ptr [esp+8]
 00689466    fsub        qword ptr [eax]
 00689468    fstp        qword ptr [edx]
 0068946A    wait
 0068946B    add         edx,8
 0068946E    add         eax,8
 00689471    dec         ebx
>00689472    jne         00689462
 00689474    add         dword ptr [esp+1C],18
 00689479    add         dword ptr [esp+18],18
 0068947E    dec         edi
>0068947F    jne         00689455
>00689481    jmp         00689822
 00689486    mov         edi,3
 0068948B    lea         eax,[esp+50]
 0068948F    mov         dword ptr [esp+20],eax
 00689493    mov         dword ptr [esp+24],esi
 00689497    mov         ebx,3
 0068949C    mov         eax,dword ptr [esp+20]
 006894A0    mov         edx,dword ptr [esp+24]
 006894A4    fld         qword ptr [eax]
 006894A6    fsub        qword ptr [esp+8]
 006894AA    fstp        qword ptr [edx]
 006894AC    wait
 006894AD    add         edx,8
 006894B0    add         eax,8
 006894B3    dec         ebx
>006894B4    jne         006894A4
 006894B6    add         dword ptr [esp+24],18
 006894BB    add         dword ptr [esp+20],18
 006894C0    dec         edi
>006894C1    jne         00689497
>006894C3    jmp         00689822
 006894C8    mov         edi,3
 006894CD    lea         eax,[esp+50]
 006894D1    mov         dword ptr [esp+28],eax
 006894D5    mov         dword ptr [esp+2C],esi
 006894D9    mov         ebx,3
 006894DE    mov         eax,dword ptr [esp+28]
 006894E2    mov         edx,dword ptr [esp+2C]
 006894E6    fld         qword ptr [eax]
 006894E8    fmul        qword ptr [esp+8]
 006894EC    fstp        qword ptr [edx]
 006894EE    wait
 006894EF    add         edx,8
 006894F2    add         eax,8
 006894F5    dec         ebx
>006894F6    jne         006894E6
 006894F8    add         dword ptr [esp+2C],18
 006894FD    add         dword ptr [esp+28],18
 00689502    dec         edi
>00689503    jne         006894D9
>00689505    jmp         00689822
 0068950A    cmp         bl,6
>0068950D    je          00689551
 0068950F    mov         edi,3
 00689514    lea         eax,[esp+50]
 00689518    mov         dword ptr [esp+30],eax
 0068951C    mov         dword ptr [esp+34],esi
 00689520    mov         ebx,3
 00689525    mov         eax,dword ptr [esp+30]
 00689529    mov         edx,dword ptr [esp+34]
 0068952D    fld         qword ptr [esp+8]
 00689531    fdiv        qword ptr [eax]
 00689533    fstp        qword ptr [edx]
 00689535    wait
 00689536    add         edx,8
 00689539    add         eax,8
 0068953C    dec         ebx
>0068953D    jne         0068952D
 0068953F    add         dword ptr [esp+34],18
 00689544    add         dword ptr [esp+30],18
 00689549    dec         edi
>0068954A    jne         00689520
>0068954C    jmp         00689822
 00689551    mov         edi,3
 00689556    lea         eax,[esp+50]
 0068955A    mov         dword ptr [esp+38],eax
 0068955E    mov         dword ptr [esp+3C],esi
 00689562    mov         ebx,3
 00689567    mov         eax,dword ptr [esp+38]
 0068956B    mov         edx,dword ptr [esp+3C]
 0068956F    fld         qword ptr [eax]
 00689571    fdiv        qword ptr [esp+8]
 00689575    fstp        qword ptr [edx]
 00689577    wait
 00689578    add         edx,8
 0068957B    add         eax,8
 0068957E    dec         ebx
>0068957F    jne         0068956F
 00689581    add         dword ptr [esp+3C],18
 00689586    add         dword ptr [esp+38],18
 0068958B    dec         edi
>0068958C    jne         00689562
>0068958E    jmp         00689822
 00689593    cmp         bl,6
>00689596    je          00689608
 00689598    mov         edi,3
 0068959D    lea         eax,[esp+50]
 006895A1    mov         dword ptr [esp+3C],eax
 006895A5    mov         dword ptr [esp+38],esi
 006895A9    mov         ebx,3
 006895AE    mov         eax,dword ptr [esp+3C]
 006895B2    mov         ebp,eax
 006895B4    mov         eax,dword ptr [esp+38]
 006895B8    mov         dword ptr [esp+40],eax
 006895BC    fld         qword ptr [esp+8]
 006895C0    add         esp,0FFFFFFF4
 006895C3    fstp        tbyte ptr [esp]
 006895C6    wait
 006895C7    fld         qword ptr [ebp]
 006895CA    add         esp,0FFFFFFF4
 006895CD    fstp        tbyte ptr [esp]
 006895D0    wait
 006895D1    call        0068AE8C
 006895D6    mov         dword ptr [esp+98],eax
 006895DD    fild        dword ptr [esp+98]
 006895E4    mov         eax,dword ptr [esp+40]
 006895E8    fstp        qword ptr [eax]
 006895EA    wait
 006895EB    add         dword ptr [esp+40],8
 006895F0    add         ebp,8
 006895F3    dec         ebx
>006895F4    jne         006895BC
 006895F6    add         dword ptr [esp+38],18
 006895FB    add         dword ptr [esp+3C],18
 00689600    dec         edi
>00689601    jne         006895A9
>00689603    jmp         00689822
 00689608    mov         edi,3
 0068960D    lea         eax,[esp+50]
 00689611    mov         dword ptr [esp+38],eax
 00689615    mov         dword ptr [esp+3C],esi
 00689619    mov         ebx,3
 0068961E    mov         eax,dword ptr [esp+38]
 00689622    mov         ebp,eax
 00689624    mov         eax,dword ptr [esp+3C]
 00689628    mov         dword ptr [esp+44],eax
 0068962C    fld         qword ptr [ebp]
 0068962F    add         esp,0FFFFFFF4
 00689632    fstp        tbyte ptr [esp]
 00689635    wait
 00689636    fld         qword ptr [esp+14]
 0068963A    add         esp,0FFFFFFF4
 0068963D    fstp        tbyte ptr [esp]
 00689640    wait
 00689641    call        0068AE8C
 00689646    mov         dword ptr [esp+98],eax
 0068964D    fild        dword ptr [esp+98]
 00689654    mov         eax,dword ptr [esp+44]
 00689658    fstp        qword ptr [eax]
 0068965A    wait
 0068965B    add         dword ptr [esp+44],8
 00689660    add         ebp,8
 00689663    dec         ebx
>00689664    jne         0068962C
 00689666    add         dword ptr [esp+3C],18
 0068966B    add         dword ptr [esp+38],18
 00689670    dec         edi
>00689671    jne         00689619
>00689673    jmp         00689822
 00689678    cmp         bl,6
>0068967B    je          006896DF
 0068967D    mov         edi,3
 00689682    lea         eax,[esp+50]
 00689686    mov         dword ptr [esp+3C],eax
 0068968A    mov         dword ptr [esp+38],esi
 0068968E    mov         ebx,3
 00689693    mov         eax,dword ptr [esp+3C]
 00689697    mov         ebp,eax
 00689699    mov         eax,dword ptr [esp+38]
 0068969D    mov         dword ptr [esp+48],eax
 006896A1    fld         qword ptr [esp+8]
 006896A5    add         esp,0FFFFFFF4
 006896A8    fstp        tbyte ptr [esp]
 006896AB    wait
 006896AC    fld         qword ptr [ebp]
 006896AF    add         esp,0FFFFFFF4
 006896B2    fstp        tbyte ptr [esp]
 006896B5    wait
 006896B6    call        0068AEA0
 006896BB    mov         eax,dword ptr [esp+48]
 006896BF    fstp        qword ptr [eax]
 006896C1    wait
 006896C2    add         dword ptr [esp+48],8
 006896C7    add         ebp,8
 006896CA    dec         ebx
>006896CB    jne         006896A1
 006896CD    add         dword ptr [esp+38],18
 006896D2    add         dword ptr [esp+3C],18
 006896D7    dec         edi
>006896D8    jne         0068968E
>006896DA    jmp         00689822
 006896DF    mov         edi,3
 006896E4    lea         eax,[esp+50]
 006896E8    mov         dword ptr [esp+38],eax
 006896EC    mov         dword ptr [esp+3C],esi
 006896F0    mov         ebx,3
 006896F5    mov         eax,dword ptr [esp+38]
 006896F9    mov         ebp,eax
 006896FB    mov         eax,dword ptr [esp+3C]
 006896FF    mov         dword ptr [esp+4C],eax
 00689703    fld         qword ptr [ebp]
 00689706    add         esp,0FFFFFFF4
 00689709    fstp        tbyte ptr [esp]
 0068970C    wait
 0068970D    fld         qword ptr [esp+14]
 00689711    add         esp,0FFFFFFF4
 00689714    fstp        tbyte ptr [esp]
 00689717    wait
 00689718    call        0068AEA0
 0068971D    mov         eax,dword ptr [esp+4C]
 00689721    fstp        qword ptr [eax]
 00689723    wait
 00689724    add         dword ptr [esp+4C],8
 00689729    add         ebp,8
 0068972C    dec         ebx
>0068972D    jne         00689703
 0068972F    add         dword ptr [esp+3C],18
 00689734    add         dword ptr [esp+38],18
 00689739    dec         edi
>0068973A    jne         006896F0
>0068973C    jmp         00689822
 00689741    mov         edx,esi
 00689743    mov         eax,dword ptr [edi+18];TBinaryOp.LHS:TExpression
 00689746    mov         ecx,dword ptr [eax]
 00689748    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068974B    lea         edx,[esp+50]
 0068974F    mov         eax,dword ptr [edi+1C];TBinaryOp.RHS:TExpression
 00689752    mov         ecx,dword ptr [eax]
 00689754    call        dword ptr [ecx+40];TExpression.GetRotMat
 00689757    movzx       eax,byte ptr [edi+20];TBinaryOp.Operation:TOperation
 0068975B    cmp         eax,3
>0068975E    jg          00689779
>00689760    je          00689815
 00689766    sub         eax,1
>00689769    jb          0068978C
>0068976B    je          006897C9
 0068976D    dec         eax
>0068976E    je          00689806
>00689774    jmp         00689822
 00689779    sub         eax,5
>0068977C    je          00689815
 00689782    sub         eax,1A
>00689785    je          00689806
>00689787    jmp         00689822
 0068978C    mov         edi,3
 00689791    mov         dword ptr [esp+3C],esi
 00689795    lea         eax,[esp+50]
 00689799    mov         dword ptr [esp+38],eax
 0068979D    mov         ebx,3
 006897A2    mov         eax,dword ptr [esp+3C]
 006897A6    mov         edx,dword ptr [esp+38]
 006897AA    fld         qword ptr [eax]
 006897AC    fadd        qword ptr [edx]
 006897AE    fstp        qword ptr [eax]
 006897B0    wait
 006897B1    add         edx,8
 006897B4    add         eax,8
 006897B7    dec         ebx
>006897B8    jne         006897AA
 006897BA    add         dword ptr [esp+38],18
 006897BF    add         dword ptr [esp+3C],18
 006897C4    dec         edi
>006897C5    jne         0068979D
>006897C7    jmp         00689822
 006897C9    mov         edi,3
 006897CE    mov         dword ptr [esp+38],esi
 006897D2    lea         eax,[esp+50]
 006897D6    mov         dword ptr [esp+3C],eax
 006897DA    mov         ebx,3
 006897DF    mov         eax,dword ptr [esp+38]
 006897E3    mov         edx,dword ptr [esp+3C]
 006897E7    fld         qword ptr [eax]
 006897E9    fsub        qword ptr [edx]
 006897EB    fstp        qword ptr [eax]
 006897ED    wait
 006897EE    add         edx,8
 006897F1    add         eax,8
 006897F4    dec         ebx
>006897F5    jne         006897E7
 006897F7    add         dword ptr [esp+3C],18
 006897FC    add         dword ptr [esp+38],18
 00689801    dec         edi
>00689802    jne         006897DA
>00689804    jmp         00689822
 00689806    mov         edx,esi
 00689808    mov         eax,esi
 0068980A    lea         ecx,[esp+50]
 0068980E    call        005C3CB0
>00689813    jmp         00689822
 00689815    mov         edx,esi
 00689817    mov         eax,esi
 00689819    lea         ecx,[esp+50]
 0068981D    call        005C3D20
 00689822    add         esp,9C
 00689828    pop         ebp
 00689829    pop         edi
 0068982A    pop         esi
 0068982B    pop         ebx
 0068982C    ret
*}
end;

//00689830
procedure TRangeInequality.CreateClone;
begin
{*
 00689830    mov         dl,1
 00689832    mov         eax,[006817D8];TRangeInequality
 00689837    call        TObject.Create;TRangeInequality.Create
 0068983C    ret
*}
end;

//00689840
destructor TRangeInequality.Destroy();
begin
{*
 00689840    push        ebx
 00689841    push        esi
 00689842    call        @BeforeDestruction
 00689847    mov         ebx,edx
 00689849    mov         esi,eax
 0068984B    lea         eax,[esi+18];TRangeInequality.LHS:TExpression
 0068984E    mov         edx,dword ptr [eax]
 00689850    xor         ecx,ecx
 00689852    mov         dword ptr [eax],ecx
 00689854    mov         eax,edx
 00689856    call        TObject.Free
 0068985B    lea         eax,[esi+1C];TRangeInequality.MHS:TExpression
 0068985E    mov         edx,dword ptr [eax]
 00689860    xor         ecx,ecx
 00689862    mov         dword ptr [eax],ecx
 00689864    mov         eax,edx
 00689866    call        TObject.Free
 0068986B    lea         eax,[esi+20];TRangeInequality.RHS:TExpression
 0068986E    mov         edx,dword ptr [eax]
 00689870    xor         ecx,ecx
 00689872    mov         dword ptr [eax],ecx
 00689874    mov         eax,edx
 00689876    call        TObject.Free
 0068987B    mov         edx,ebx
 0068987D    and         dl,0FC
 00689880    mov         eax,esi
 00689882    call        TObject.Destroy
 00689887    test        bl,bl
>00689889    jle         00689892
 0068988B    mov         eax,esi
 0068988D    call        @ClassDestroy
 00689892    pop         esi
 00689893    pop         ebx
 00689894    ret
*}
end;

//00689898
procedure TRangeInequality.FillClone(c:TExpression);
begin
{*
 00689898    push        ebx
 00689899    push        esi
 0068989A    push        edi
 0068989B    mov         esi,edx
 0068989D    mov         ebx,eax
 0068989F    mov         edx,esi
 006898A1    mov         eax,ebx
 006898A3    call        TExpression.FillClone
 006898A8    mov         eax,dword ptr [ebx+18];TRangeInequality.LHS:TExpression
 006898AB    call        TExpression.Clone
 006898B0    mov         edi,esi
 006898B2    mov         dword ptr [edi+18],eax
 006898B5    mov         eax,dword ptr [ebx+1C];TRangeInequality.MHS:TExpression
 006898B8    call        TExpression.Clone
 006898BD    mov         dword ptr [edi+1C],eax
 006898C0    mov         eax,dword ptr [ebx+20];TRangeInequality.RHS:TExpression
 006898C3    call        TExpression.Clone
 006898C8    mov         dword ptr [edi+20],eax
 006898CB    movzx       eax,byte ptr [ebx+24];TRangeInequality.Between:Boolean
 006898CF    mov         byte ptr [edi+24],al
 006898D2    movzx       eax,byte ptr [ebx+25];TRangeInequality.LOperation:TOperation
 006898D6    mov         byte ptr [edi+25],al
 006898D9    movzx       eax,byte ptr [ebx+26];TRangeInequality.ROperation:TOperation
 006898DD    mov         byte ptr [edi+26],al
 006898E0    pop         edi
 006898E1    pop         esi
 006898E2    pop         ebx
 006898E3    ret
*}
end;

//006898E4
function TRangeInequality.GetDataType:TDataType;
begin
{*
 006898E4    mov         al,3
 006898E6    ret
*}
end;

//006898E8
procedure TRangeInequality.GetValue;
begin
{*
 006898E8    push        ebx
 006898E9    add         esp,0FFFFFFE0
 006898EC    mov         ebx,eax
 006898EE    mov         eax,dword ptr [ebx+1C];TRangeInequality.MHS:TExpression
 006898F1    mov         edx,dword ptr [eax]
 006898F3    call        dword ptr [edx];TExpression.Evaluate
 006898F5    fstp        qword ptr [esp+10]
 006898F9    wait
 006898FA    mov         edx,dword ptr [ebx+1C];TRangeInequality.MHS:TExpression
 006898FD    mov         eax,dword ptr [ebx+18];TRangeInequality.LHS:TExpression
 00689900    mov         ecx,dword ptr [eax]
 00689902    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 00689905    fstp        qword ptr [esp+8]
 00689909    wait
 0068990A    mov         edx,dword ptr [ebx+1C];TRangeInequality.MHS:TExpression
 0068990D    mov         eax,dword ptr [ebx+20];TRangeInequality.RHS:TExpression
 00689910    mov         ecx,dword ptr [eax]
 00689912    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 00689915    fstp        qword ptr [esp+18]
 00689919    wait
 0068991A    movzx       eax,byte ptr [ebx+25];TRangeInequality.LOperation:TOperation
 0068991E    add         eax,0FFFFFFEE
 00689921    cmp         eax,0B
>00689924    ja          00689A92
 0068992A    jmp         dword ptr [eax*4+689931]
 0068992A    dd          00689961
 0068992A    dd          00689975
 0068992A    dd          00689989
 0068992A    dd          006899E7
 0068992A    dd          006899FB
 0068992A    dd          00689A81
 0068992A    dd          00689A48
 0068992A    dd          00689A48
 0068992A    dd          0068999D
 0068992A    dd          00689A0F
 0068992A    dd          00689A0F
 0068992A    dd          006899C1
 00689961    fld         qword ptr [esp+8]
 00689965    fcomp       qword ptr [esp+10]
 00689969    wait
 0068996A    fnstsw      al
 0068996C    sahf
 0068996D    setb        al
>00689970    jmp         00689A94
 00689975    fld         qword ptr [esp+8]
 00689979    fcomp       qword ptr [esp+10]
 0068997D    wait
 0068997E    fnstsw      al
 00689980    sahf
 00689981    setbe       al
>00689984    jmp         00689A94
 00689989    fld         qword ptr [esp+8]
 0068998D    fcomp       qword ptr [esp+10]
 00689991    wait
 00689992    fnstsw      al
 00689994    sahf
 00689995    sete        al
>00689998    jmp         00689A94
 0068999D    push        dword ptr [esp+0C]
 006899A1    push        dword ptr [esp+0C]
 006899A5    push        dword ptr [esp+1C]
 006899A9    push        dword ptr [esp+1C]
 006899AD    mov         eax,[0078CC70];^gvar_0078BD78:Double
 006899B2    push        dword ptr [eax+4]
 006899B5    push        dword ptr [eax]
 006899B7    call        004553E8
>006899BC    jmp         00689A94
 006899C1    push        dword ptr [esp+0C]
 006899C5    push        dword ptr [esp+0C]
 006899C9    push        dword ptr [esp+1C]
 006899CD    push        dword ptr [esp+1C]
 006899D1    mov         eax,[0078CC70];^gvar_0078BD78:Double
 006899D6    push        dword ptr [eax+4]
 006899D9    push        dword ptr [eax]
 006899DB    call        004553E8
 006899E0    xor         al,1
>006899E2    jmp         00689A94
 006899E7    fld         qword ptr [esp+8]
 006899EB    fcomp       qword ptr [esp+10]
 006899EF    wait
 006899F0    fnstsw      al
 006899F2    sahf
 006899F3    setae       al
>006899F6    jmp         00689A94
 006899FB    fld         qword ptr [esp+8]
 006899FF    fcomp       qword ptr [esp+10]
 00689A03    wait
 00689A04    fnstsw      al
 00689A06    sahf
 00689A07    seta        al
>00689A0A    jmp         00689A94
 00689A0F    fld         qword ptr [esp+8]
 00689A13    fcomp       qword ptr [esp+10]
 00689A17    wait
 00689A18    fnstsw      al
 00689A1A    sahf
>00689A1B    jae         00689A44
 00689A1D    push        dword ptr [esp+0C]
 00689A21    push        dword ptr [esp+0C]
 00689A25    push        dword ptr [esp+1C]
 00689A29    push        dword ptr [esp+1C]
 00689A2D    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00689A32    push        dword ptr [eax+4]
 00689A35    push        dword ptr [eax]
 00689A37    call        004553E8
 00689A3C    test        al,al
>00689A3E    jne         00689A44
 00689A40    xor         eax,eax
>00689A42    jmp         00689A94
 00689A44    mov         al,1
>00689A46    jmp         00689A94
 00689A48    fld         qword ptr [esp+8]
 00689A4C    fcomp       qword ptr [esp+10]
 00689A50    wait
 00689A51    fnstsw      al
 00689A53    sahf
>00689A54    jbe         00689A7D
 00689A56    push        dword ptr [esp+0C]
 00689A5A    push        dword ptr [esp+0C]
 00689A5E    push        dword ptr [esp+1C]
 00689A62    push        dword ptr [esp+1C]
 00689A66    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00689A6B    push        dword ptr [eax+4]
 00689A6E    push        dword ptr [eax]
 00689A70    call        004553E8
 00689A75    test        al,al
>00689A77    jne         00689A7D
 00689A79    xor         eax,eax
>00689A7B    jmp         00689A94
 00689A7D    mov         al,1
>00689A7F    jmp         00689A94
 00689A81    fld         qword ptr [esp+8]
 00689A85    fcomp       qword ptr [esp+10]
 00689A89    wait
 00689A8A    fnstsw      al
 00689A8C    sahf
 00689A8D    setne       al
>00689A90    jmp         00689A94
 00689A92    xor         eax,eax
 00689A94    test        al,al
>00689A96    jne         00689AA8
 00689A98    xor         eax,eax
 00689A9A    call        00686074
 00689A9F    fstp        qword ptr [esp]
 00689AA2    wait
>00689AA3    jmp         00689C2B
 00689AA8    movzx       eax,byte ptr [ebx+26];TRangeInequality.ROperation:TOperation
 00689AAC    add         eax,0FFFFFFEE
 00689AAF    cmp         eax,0B
>00689AB2    ja          00689C20
 00689AB8    jmp         dword ptr [eax*4+689ABF]
 00689AB8    dd          00689AEF
 00689AB8    dd          00689B03
 00689AB8    dd          00689B17
 00689AB8    dd          00689B75
 00689AB8    dd          00689B89
 00689AB8    dd          00689B9D
 00689AB8    dd          00689BE7
 00689AB8    dd          00689BE7
 00689AB8    dd          00689B2B
 00689AB8    dd          00689BAE
 00689AB8    dd          00689BAE
 00689AB8    dd          00689B4F
 00689AEF    fld         qword ptr [esp+10]
 00689AF3    fcomp       qword ptr [esp+18]
 00689AF7    wait
 00689AF8    fnstsw      al
 00689AFA    sahf
 00689AFB    setb        al
>00689AFE    jmp         00689C22
 00689B03    fld         qword ptr [esp+10]
 00689B07    fcomp       qword ptr [esp+18]
 00689B0B    wait
 00689B0C    fnstsw      al
 00689B0E    sahf
 00689B0F    setbe       al
>00689B12    jmp         00689C22
 00689B17    fld         qword ptr [esp+10]
 00689B1B    fcomp       qword ptr [esp+18]
 00689B1F    wait
 00689B20    fnstsw      al
 00689B22    sahf
 00689B23    sete        al
>00689B26    jmp         00689C22
 00689B2B    push        dword ptr [esp+14]
 00689B2F    push        dword ptr [esp+14]
 00689B33    push        dword ptr [esp+24]
 00689B37    push        dword ptr [esp+24]
 00689B3B    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00689B40    push        dword ptr [eax+4]
 00689B43    push        dword ptr [eax]
 00689B45    call        004553E8
>00689B4A    jmp         00689C22
 00689B4F    push        dword ptr [esp+14]
 00689B53    push        dword ptr [esp+14]
 00689B57    push        dword ptr [esp+24]
 00689B5B    push        dword ptr [esp+24]
 00689B5F    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00689B64    push        dword ptr [eax+4]
 00689B67    push        dword ptr [eax]
 00689B69    call        004553E8
 00689B6E    xor         al,1
>00689B70    jmp         00689C22
 00689B75    fld         qword ptr [esp+10]
 00689B79    fcomp       qword ptr [esp+18]
 00689B7D    wait
 00689B7E    fnstsw      al
 00689B80    sahf
 00689B81    setae       al
>00689B84    jmp         00689C22
 00689B89    fld         qword ptr [esp+10]
 00689B8D    fcomp       qword ptr [esp+18]
 00689B91    wait
 00689B92    fnstsw      al
 00689B94    sahf
 00689B95    seta        al
>00689B98    jmp         00689C22
 00689B9D    fld         qword ptr [esp+10]
 00689BA1    fcomp       qword ptr [esp+18]
 00689BA5    wait
 00689BA6    fnstsw      al
 00689BA8    sahf
 00689BA9    setne       al
>00689BAC    jmp         00689C22
 00689BAE    fld         qword ptr [esp+10]
 00689BB2    fcomp       qword ptr [esp+18]
 00689BB6    wait
 00689BB7    fnstsw      al
 00689BB9    sahf
>00689BBA    jae         00689BE3
 00689BBC    push        dword ptr [esp+14]
 00689BC0    push        dword ptr [esp+14]
 00689BC4    push        dword ptr [esp+24]
 00689BC8    push        dword ptr [esp+24]
 00689BCC    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00689BD1    push        dword ptr [eax+4]
 00689BD4    push        dword ptr [eax]
 00689BD6    call        004553E8
 00689BDB    test        al,al
>00689BDD    jne         00689BE3
 00689BDF    xor         eax,eax
>00689BE1    jmp         00689C22
 00689BE3    mov         al,1
>00689BE5    jmp         00689C22
 00689BE7    fld         qword ptr [esp+10]
 00689BEB    fcomp       qword ptr [esp+18]
 00689BEF    wait
 00689BF0    fnstsw      al
 00689BF2    sahf
>00689BF3    jbe         00689C1C
 00689BF5    push        dword ptr [esp+14]
 00689BF9    push        dword ptr [esp+14]
 00689BFD    push        dword ptr [esp+24]
 00689C01    push        dword ptr [esp+24]
 00689C05    mov         eax,[0078CC70];^gvar_0078BD78:Double
 00689C0A    push        dword ptr [eax+4]
 00689C0D    push        dword ptr [eax]
 00689C0F    call        004553E8
 00689C14    test        al,al
>00689C16    jne         00689C1C
 00689C18    xor         eax,eax
>00689C1A    jmp         00689C22
 00689C1C    mov         al,1
>00689C1E    jmp         00689C22
 00689C20    xor         eax,eax
 00689C22    call        00686074
 00689C27    fstp        qword ptr [esp]
 00689C2A    wait
 00689C2B    fld         qword ptr [esp]
 00689C2E    add         esp,20
 00689C31    pop         ebx
 00689C32    ret
*}
end;

//00689C34
procedure TRangeInequality.SetIffy(IsIffy:Boolean);
begin
{*
 00689C34    push        ebx
 00689C35    push        esi
 00689C36    mov         ebx,edx
 00689C38    mov         esi,eax
 00689C3A    mov         edx,ebx
 00689C3C    mov         eax,esi
 00689C3E    call        TExpression.SetIffy
 00689C43    mov         edx,ebx
 00689C45    mov         eax,dword ptr [esi+18];TRangeInequality.LHS:TExpression
 00689C48    mov         ecx,dword ptr [eax]
 00689C4A    call        dword ptr [ecx+74];TExpression.SetIffy
 00689C4D    mov         edx,ebx
 00689C4F    mov         eax,dword ptr [esi+1C];TRangeInequality.MHS:TExpression
 00689C52    mov         ecx,dword ptr [eax]
 00689C54    call        dword ptr [ecx+74];TExpression.SetIffy
 00689C57    mov         edx,ebx
 00689C59    mov         eax,dword ptr [esi+20];TRangeInequality.RHS:TExpression
 00689C5C    mov         ecx,dword ptr [eax]
 00689C5E    call        dword ptr [ecx+74];TExpression.SetIffy
 00689C61    pop         esi
 00689C62    pop         ebx
 00689C63    ret
*}
end;

//00689C64
procedure TRangeInequality.Swallow;
begin
{*
 00689C64    push        ebx
 00689C65    mov         ebx,eax
 00689C67    mov         eax,dword ptr [ebx+18];TRangeInequality.LHS:TExpression
 00689C6A    mov         edx,dword ptr [eax]
 00689C6C    call        dword ptr [edx+88];TExpression.Swallow
 00689C72    mov         eax,dword ptr [ebx+1C];TRangeInequality.MHS:TExpression
 00689C75    mov         edx,dword ptr [eax]
 00689C77    call        dword ptr [edx+88];TExpression.Swallow
 00689C7D    mov         eax,dword ptr [ebx+20];TRangeInequality.RHS:TExpression
 00689C80    mov         edx,dword ptr [eax]
 00689C82    call        dword ptr [edx+88];TExpression.Swallow
 00689C88    pop         ebx
 00689C89    ret
*}
end;

//00689C8C
{*procedure TRangeInequality.ToString(?:?);
begin
 00689C8C    push        ebp
 00689C8D    mov         ebp,esp
 00689C8F    xor         ecx,ecx
 00689C91    push        ecx
 00689C92    push        ecx
 00689C93    push        ecx
 00689C94    push        ecx
 00689C95    push        ecx
 00689C96    push        ebx
 00689C97    push        esi
 00689C98    mov         esi,edx
 00689C9A    mov         ebx,eax
 00689C9C    xor         eax,eax
 00689C9E    push        ebp
 00689C9F    push        68A486
 00689CA4    push        dword ptr fs:[eax]
 00689CA7    mov         dword ptr fs:[eax],esp
 00689CAA    push        68A4A0;'('
 00689CAF    lea         edx,[ebp-0C]
 00689CB2    mov         eax,dword ptr [ebx+18];TRangeInequality.LHS:TExpression
 00689CB5    mov         ecx,dword ptr [eax]
 00689CB7    call        dword ptr [ecx-24];TExpression.ToString
 00689CBA    push        dword ptr [ebp-0C]
 00689CBD    push        68A4B0;')'
 00689CC2    lea         eax,[ebp-4]
 00689CC5    mov         edx,3
 00689CCA    call        @UStrCatN
 00689CCF    push        68A4A0;'('
 00689CD4    lea         edx,[ebp-10]
 00689CD7    mov         eax,dword ptr [ebx+1C];TRangeInequality.MHS:TExpression
 00689CDA    mov         ecx,dword ptr [eax]
 00689CDC    call        dword ptr [ecx-24];TExpression.ToString
 00689CDF    push        dword ptr [ebp-10]
 00689CE2    push        68A4B0;')'
 00689CE7    lea         eax,[ebp-8]
 00689CEA    mov         edx,3
 00689CEF    call        @UStrCatN
 00689CF4    movzx       eax,byte ptr [ebx+25];TRangeInequality.LOperation:TOperation
 00689CF8    cmp         eax,1D
>00689CFB    ja          0068A081
 00689D01    jmp         dword ptr [eax*4+689D08]
 00689D01    dd          00689D9C
 00689D01    dd          00689D80
 00689D01    dd          00689DB8
 00689D01    dd          00689DD4
 00689D01    dd          00689DF0
 00689D01    dd          00689E0C
 00689D01    dd          00689E28
 00689D01    dd          00689E44
 00689D01    dd          00689E60
 00689D01    dd          00689E7C
 00689D01    dd          0068A081
 00689D01    dd          00689E98
 00689D01    dd          00689EB4
 00689D01    dd          00689ED0
 00689D01    dd          0068A081
 00689D01    dd          00689EEC
 00689D01    dd          00689F08
 00689D01    dd          00689F24
 00689D01    dd          00689F40
 00689D01    dd          00689F5C
 00689D01    dd          00689F78
 00689D01    dd          00689FCC
 00689D01    dd          00689FE8
 00689D01    dd          0068A068
 00689D01    dd          0068A04F
 00689D01    dd          0068A036
 00689D01    dd          00689F94
 00689D01    dd          0068A004
 00689D01    dd          0068A01D
 00689D01    dd          00689FB0
 00689D80    push        dword ptr [ebp-4]
 00689D83    push        68A4C0;'-'
 00689D88    push        dword ptr [ebp-8]
 00689D8B    mov         eax,esi
 00689D8D    mov         edx,3
 00689D92    call        @UStrCatN
>00689D97    jmp         0068A098
 00689D9C    push        dword ptr [ebp-4]
 00689D9F    push        68A4D0;'+'
 00689DA4    push        dword ptr [ebp-8]
 00689DA7    mov         eax,esi
 00689DA9    mov         edx,3
 00689DAE    call        @UStrCatN
>00689DB3    jmp         0068A098
 00689DB8    push        dword ptr [ebp-4]
 00689DBB    push        68A4E0;'*'
 00689DC0    push        dword ptr [ebp-8]
 00689DC3    mov         eax,esi
 00689DC5    mov         edx,3
 00689DCA    call        @UStrCatN
>00689DCF    jmp         0068A098
 00689DD4    push        dword ptr [ebp-4]
 00689DD7    push        68A4F0;'/'
 00689DDC    push        dword ptr [ebp-8]
 00689DDF    mov         eax,esi
 00689DE1    mov         edx,3
 00689DE6    call        @UStrCatN
>00689DEB    jmp         0068A098
 00689DF0    push        dword ptr [ebp-4]
 00689DF3    push        68A500;'^'
 00689DF8    push        dword ptr [ebp-8]
 00689DFB    mov         eax,esi
 00689DFD    mov         edx,3
 00689E02    call        @UStrCatN
>00689E07    jmp         0068A098
 00689E0C    push        dword ptr [ebp-4]
 00689E0F    push        68A510;' div '
 00689E14    push        dword ptr [ebp-8]
 00689E17    mov         eax,esi
 00689E19    mov         edx,3
 00689E1E    call        @UStrCatN
>00689E23    jmp         0068A098
 00689E28    push        dword ptr [ebp-4]
 00689E2B    push        68A528;' mod '
 00689E30    push        dword ptr [ebp-8]
 00689E33    mov         eax,esi
 00689E35    mov         edx,3
 00689E3A    call        @UStrCatN
>00689E3F    jmp         0068A098
 00689E44    push        dword ptr [ebp-4]
 00689E47    push        68A540;'% of '
 00689E4C    push        dword ptr [ebp-8]
 00689E4F    mov         eax,esi
 00689E51    mov         edx,3
 00689E56    call        @UStrCatN
>00689E5B    jmp         0068A098
 00689E60    push        dword ptr [ebp-4]
 00689E63    push        68A558;' and '
 00689E68    push        dword ptr [ebp-8]
 00689E6B    mov         eax,esi
 00689E6D    mov         edx,3
 00689E72    call        @UStrCatN
>00689E77    jmp         0068A098
 00689E7C    push        dword ptr [ebp-4]
 00689E7F    push        68A570;' or '
 00689E84    push        dword ptr [ebp-8]
 00689E87    mov         eax,esi
 00689E89    mov         edx,3
 00689E8E    call        @UStrCatN
>00689E93    jmp         0068A098
 00689E98    push        dword ptr [ebp-4]
 00689E9B    push        68A588;' xor '
 00689EA0    push        dword ptr [ebp-8]
 00689EA3    mov         eax,esi
 00689EA5    mov         edx,3
 00689EAA    call        @UStrCatN
>00689EAF    jmp         0068A098
 00689EB4    push        dword ptr [ebp-4]
 00689EB7    push        68A5A0;' & '
 00689EBC    push        dword ptr [ebp-8]
 00689EBF    mov         eax,esi
 00689EC1    mov         edx,3
 00689EC6    call        @UStrCatN
>00689ECB    jmp         0068A098
 00689ED0    push        dword ptr [ebp-4]
 00689ED3    push        68A5B4;' | '
 00689ED8    push        dword ptr [ebp-8]
 00689EDB    mov         eax,esi
 00689EDD    mov         edx,3
 00689EE2    call        @UStrCatN
>00689EE7    jmp         0068A098
 00689EEC    push        dword ptr [ebp-4]
 00689EEF    push        68A5C8;^gvar_00580020
 00689EF4    push        dword ptr [ebp-8]
 00689EF7    mov         eax,esi
 00689EF9    mov         edx,3
 00689EFE    call        @UStrCatN
>00689F03    jmp         0068A098
 00689F08    push        dword ptr [ebp-4]
 00689F0B    push        68A5E0;' SHL '
 00689F10    push        dword ptr [ebp-8]
 00689F13    mov         eax,esi
 00689F15    mov         edx,3
 00689F1A    call        @UStrCatN
>00689F1F    jmp         0068A098
 00689F24    push        dword ptr [ebp-4]
 00689F27    push        68A5F8;' SHR '
 00689F2C    push        dword ptr [ebp-8]
 00689F2F    mov         eax,esi
 00689F31    mov         edx,3
 00689F36    call        @UStrCatN
>00689F3B    jmp         0068A098
 00689F40    push        dword ptr [ebp-4]
 00689F43    push        68A610;'<'
 00689F48    push        dword ptr [ebp-8]
 00689F4B    mov         eax,esi
 00689F4D    mov         edx,3
 00689F52    call        @UStrCatN
>00689F57    jmp         0068A098
 00689F5C    push        dword ptr [ebp-4]
 00689F5F    push        68A620;'<='
 00689F64    push        dword ptr [ebp-8]
 00689F67    mov         eax,esi
 00689F69    mov         edx,3
 00689F6E    call        @UStrCatN
>00689F73    jmp         0068A098
 00689F78    push        dword ptr [ebp-4]
 00689F7B    push        68A634;'=='
 00689F80    push        dword ptr [ebp-8]
 00689F83    mov         eax,esi
 00689F85    mov         edx,3
 00689F8A    call        @UStrCatN
>00689F8F    jmp         0068A098
 00689F94    push        dword ptr [ebp-4]
 00689F97    push        68A648;'~='
 00689F9C    push        dword ptr [ebp-8]
 00689F9F    mov         eax,esi
 00689FA1    mov         edx,3
 00689FA6    call        @UStrCatN
>00689FAB    jmp         0068A098
 00689FB0    push        dword ptr [ebp-4]
 00689FB3    push        68A65C;'!~='
 00689FB8    push        dword ptr [ebp-8]
 00689FBB    mov         eax,esi
 00689FBD    mov         edx,3
 00689FC2    call        @UStrCatN
>00689FC7    jmp         0068A098
 00689FCC    push        dword ptr [ebp-4]
 00689FCF    push        68A670;'>='
 00689FD4    push        dword ptr [ebp-8]
 00689FD7    mov         eax,esi
 00689FD9    mov         edx,3
 00689FDE    call        @UStrCatN
>00689FE3    jmp         0068A098
 00689FE8    push        dword ptr [ebp-4]
 00689FEB    push        68A684;'>'
 00689FF0    push        dword ptr [ebp-8]
 00689FF3    mov         eax,esi
 00689FF5    mov         edx,3
 00689FFA    call        @UStrCatN
>00689FFF    jmp         0068A098
 0068A004    push        dword ptr [ebp-4]
 0068A007    push        68A694;'~>='
 0068A00C    push        dword ptr [ebp-8]
 0068A00F    mov         eax,esi
 0068A011    mov         edx,3
 0068A016    call        @UStrCatN
>0068A01B    jmp         0068A098
 0068A01D    push        dword ptr [ebp-4]
 0068A020    push        68A6A8;'~>'
 0068A025    push        dword ptr [ebp-8]
 0068A028    mov         eax,esi
 0068A02A    mov         edx,3
 0068A02F    call        @UStrCatN
>0068A034    jmp         0068A098
 0068A036    push        dword ptr [ebp-4]
 0068A039    push        68A6BC;'~<='
 0068A03E    push        dword ptr [ebp-8]
 0068A041    mov         eax,esi
 0068A043    mov         edx,3
 0068A048    call        @UStrCatN
>0068A04D    jmp         0068A098
 0068A04F    push        dword ptr [ebp-4]
 0068A052    push        68A6D0;'~<'
 0068A057    push        dword ptr [ebp-8]
 0068A05A    mov         eax,esi
 0068A05C    mov         edx,3
 0068A061    call        @UStrCatN
>0068A066    jmp         0068A098
 0068A068    push        dword ptr [ebp-4]
 0068A06B    push        68A6E4;'!='
 0068A070    push        dword ptr [ebp-8]
 0068A073    mov         eax,esi
 0068A075    mov         edx,3
 0068A07A    call        @UStrCatN
>0068A07F    jmp         0068A098
 0068A081    push        dword ptr [ebp-4]
 0068A084    push        68A6F8;' ? '
 0068A089    push        dword ptr [ebp-8]
 0068A08C    mov         eax,esi
 0068A08E    mov         edx,3
 0068A093    call        @UStrCatN
 0068A098    lea         eax,[ebp-4]
 0068A09B    mov         edx,dword ptr [esi]
 0068A09D    call        @UStrLAsg
 0068A0A2    push        68A4A0;'('
 0068A0A7    lea         edx,[ebp-14]
 0068A0AA    mov         eax,dword ptr [ebx+20];TRangeInequality.RHS:TExpression
 0068A0AD    mov         ecx,dword ptr [eax]
 0068A0AF    call        dword ptr [ecx-24];TExpression.ToString
 0068A0B2    push        dword ptr [ebp-14]
 0068A0B5    push        68A4B0;')'
 0068A0BA    lea         eax,[ebp-8]
 0068A0BD    mov         edx,3
 0068A0C2    call        @UStrCatN
 0068A0C7    movzx       eax,byte ptr [ebx+26];TRangeInequality.ROperation:TOperation
 0068A0CB    cmp         eax,1D
>0068A0CE    ja          0068A454
 0068A0D4    jmp         dword ptr [eax*4+68A0DB]
 0068A0D4    dd          0068A16F
 0068A0D4    dd          0068A153
 0068A0D4    dd          0068A18B
 0068A0D4    dd          0068A1A7
 0068A0D4    dd          0068A1C3
 0068A0D4    dd          0068A1DF
 0068A0D4    dd          0068A1FB
 0068A0D4    dd          0068A217
 0068A0D4    dd          0068A233
 0068A0D4    dd          0068A24F
 0068A0D4    dd          0068A454
 0068A0D4    dd          0068A26B
 0068A0D4    dd          0068A287
 0068A0D4    dd          0068A2A3
 0068A0D4    dd          0068A454
 0068A0D4    dd          0068A2BF
 0068A0D4    dd          0068A2DB
 0068A0D4    dd          0068A2F7
 0068A0D4    dd          0068A313
 0068A0D4    dd          0068A32F
 0068A0D4    dd          0068A3BB
 0068A0D4    dd          0068A409
 0068A0D4    dd          0068A422
 0068A0D4    dd          0068A43B
 0068A0D4    dd          0068A39F
 0068A0D4    dd          0068A383
 0068A0D4    dd          0068A3D7
 0068A0D4    dd          0068A34B
 0068A0D4    dd          0068A367
 0068A0D4    dd          0068A3F0
 0068A153    push        dword ptr [ebp-4]
 0068A156    push        68A4C0;'-'
 0068A15B    push        dword ptr [ebp-8]
 0068A15E    mov         eax,esi
 0068A160    mov         edx,3
 0068A165    call        @UStrCatN
>0068A16A    jmp         0068A46B
 0068A16F    push        dword ptr [ebp-4]
 0068A172    push        68A4D0;'+'
 0068A177    push        dword ptr [ebp-8]
 0068A17A    mov         eax,esi
 0068A17C    mov         edx,3
 0068A181    call        @UStrCatN
>0068A186    jmp         0068A46B
 0068A18B    push        dword ptr [ebp-4]
 0068A18E    push        68A4E0;'*'
 0068A193    push        dword ptr [ebp-8]
 0068A196    mov         eax,esi
 0068A198    mov         edx,3
 0068A19D    call        @UStrCatN
>0068A1A2    jmp         0068A46B
 0068A1A7    push        dword ptr [ebp-4]
 0068A1AA    push        68A4F0;'/'
 0068A1AF    push        dword ptr [ebp-8]
 0068A1B2    mov         eax,esi
 0068A1B4    mov         edx,3
 0068A1B9    call        @UStrCatN
>0068A1BE    jmp         0068A46B
 0068A1C3    push        dword ptr [ebp-4]
 0068A1C6    push        68A500;'^'
 0068A1CB    push        dword ptr [ebp-8]
 0068A1CE    mov         eax,esi
 0068A1D0    mov         edx,3
 0068A1D5    call        @UStrCatN
>0068A1DA    jmp         0068A46B
 0068A1DF    push        dword ptr [ebp-4]
 0068A1E2    push        68A510;' div '
 0068A1E7    push        dword ptr [ebp-8]
 0068A1EA    mov         eax,esi
 0068A1EC    mov         edx,3
 0068A1F1    call        @UStrCatN
>0068A1F6    jmp         0068A46B
 0068A1FB    push        dword ptr [ebp-4]
 0068A1FE    push        68A528;' mod '
 0068A203    push        dword ptr [ebp-8]
 0068A206    mov         eax,esi
 0068A208    mov         edx,3
 0068A20D    call        @UStrCatN
>0068A212    jmp         0068A46B
 0068A217    push        dword ptr [ebp-4]
 0068A21A    push        68A540;'% of '
 0068A21F    push        dword ptr [ebp-8]
 0068A222    mov         eax,esi
 0068A224    mov         edx,3
 0068A229    call        @UStrCatN
>0068A22E    jmp         0068A46B
 0068A233    push        dword ptr [ebp-4]
 0068A236    push        68A558;' and '
 0068A23B    push        dword ptr [ebp-8]
 0068A23E    mov         eax,esi
 0068A240    mov         edx,3
 0068A245    call        @UStrCatN
>0068A24A    jmp         0068A46B
 0068A24F    push        dword ptr [ebp-4]
 0068A252    push        68A570;' or '
 0068A257    push        dword ptr [ebp-8]
 0068A25A    mov         eax,esi
 0068A25C    mov         edx,3
 0068A261    call        @UStrCatN
>0068A266    jmp         0068A46B
 0068A26B    push        dword ptr [ebp-4]
 0068A26E    push        68A588;' xor '
 0068A273    push        dword ptr [ebp-8]
 0068A276    mov         eax,esi
 0068A278    mov         edx,3
 0068A27D    call        @UStrCatN
>0068A282    jmp         0068A46B
 0068A287    push        dword ptr [ebp-4]
 0068A28A    push        68A5A0;' & '
 0068A28F    push        dword ptr [ebp-8]
 0068A292    mov         eax,esi
 0068A294    mov         edx,3
 0068A299    call        @UStrCatN
>0068A29E    jmp         0068A46B
 0068A2A3    push        dword ptr [ebp-4]
 0068A2A6    push        68A5B4;' | '
 0068A2AB    push        dword ptr [ebp-8]
 0068A2AE    mov         eax,esi
 0068A2B0    mov         edx,3
 0068A2B5    call        @UStrCatN
>0068A2BA    jmp         0068A46B
 0068A2BF    push        dword ptr [ebp-4]
 0068A2C2    push        68A5C8;^gvar_00580020
 0068A2C7    push        dword ptr [ebp-8]
 0068A2CA    mov         eax,esi
 0068A2CC    mov         edx,3
 0068A2D1    call        @UStrCatN
>0068A2D6    jmp         0068A46B
 0068A2DB    push        dword ptr [ebp-4]
 0068A2DE    push        68A5E0;' SHL '
 0068A2E3    push        dword ptr [ebp-8]
 0068A2E6    mov         eax,esi
 0068A2E8    mov         edx,3
 0068A2ED    call        @UStrCatN
>0068A2F2    jmp         0068A46B
 0068A2F7    push        dword ptr [ebp-4]
 0068A2FA    push        68A5F8;' SHR '
 0068A2FF    push        dword ptr [ebp-8]
 0068A302    mov         eax,esi
 0068A304    mov         edx,3
 0068A309    call        @UStrCatN
>0068A30E    jmp         0068A46B
 0068A313    push        dword ptr [ebp-4]
 0068A316    push        68A610;'<'
 0068A31B    push        dword ptr [ebp-8]
 0068A31E    mov         eax,esi
 0068A320    mov         edx,3
 0068A325    call        @UStrCatN
>0068A32A    jmp         0068A46B
 0068A32F    push        dword ptr [ebp-4]
 0068A332    push        68A620;'<='
 0068A337    push        dword ptr [ebp-8]
 0068A33A    mov         eax,esi
 0068A33C    mov         edx,3
 0068A341    call        @UStrCatN
>0068A346    jmp         0068A46B
 0068A34B    push        dword ptr [ebp-4]
 0068A34E    push        68A694;'~>='
 0068A353    push        dword ptr [ebp-8]
 0068A356    mov         eax,esi
 0068A358    mov         edx,3
 0068A35D    call        @UStrCatN
>0068A362    jmp         0068A46B
 0068A367    push        dword ptr [ebp-4]
 0068A36A    push        68A6A8;'~>'
 0068A36F    push        dword ptr [ebp-8]
 0068A372    mov         eax,esi
 0068A374    mov         edx,3
 0068A379    call        @UStrCatN
>0068A37E    jmp         0068A46B
 0068A383    push        dword ptr [ebp-4]
 0068A386    push        68A6BC;'~<='
 0068A38B    push        dword ptr [ebp-8]
 0068A38E    mov         eax,esi
 0068A390    mov         edx,3
 0068A395    call        @UStrCatN
>0068A39A    jmp         0068A46B
 0068A39F    push        dword ptr [ebp-4]
 0068A3A2    push        68A6D0;'~<'
 0068A3A7    push        dword ptr [ebp-8]
 0068A3AA    mov         eax,esi
 0068A3AC    mov         edx,3
 0068A3B1    call        @UStrCatN
>0068A3B6    jmp         0068A46B
 0068A3BB    push        dword ptr [ebp-4]
 0068A3BE    push        68A634;'=='
 0068A3C3    push        dword ptr [ebp-8]
 0068A3C6    mov         eax,esi
 0068A3C8    mov         edx,3
 0068A3CD    call        @UStrCatN
>0068A3D2    jmp         0068A46B
 0068A3D7    push        dword ptr [ebp-4]
 0068A3DA    push        68A648;'~='
 0068A3DF    push        dword ptr [ebp-8]
 0068A3E2    mov         eax,esi
 0068A3E4    mov         edx,3
 0068A3E9    call        @UStrCatN
>0068A3EE    jmp         0068A46B
 0068A3F0    push        dword ptr [ebp-4]
 0068A3F3    push        68A65C;'!~='
 0068A3F8    push        dword ptr [ebp-8]
 0068A3FB    mov         eax,esi
 0068A3FD    mov         edx,3
 0068A402    call        @UStrCatN
>0068A407    jmp         0068A46B
 0068A409    push        dword ptr [ebp-4]
 0068A40C    push        68A670;'>='
 0068A411    push        dword ptr [ebp-8]
 0068A414    mov         eax,esi
 0068A416    mov         edx,3
 0068A41B    call        @UStrCatN
>0068A420    jmp         0068A46B
 0068A422    push        dword ptr [ebp-4]
 0068A425    push        68A684;'>'
 0068A42A    push        dword ptr [ebp-8]
 0068A42D    mov         eax,esi
 0068A42F    mov         edx,3
 0068A434    call        @UStrCatN
>0068A439    jmp         0068A46B
 0068A43B    push        dword ptr [ebp-4]
 0068A43E    push        68A6E4;'!='
 0068A443    push        dword ptr [ebp-8]
 0068A446    mov         eax,esi
 0068A448    mov         edx,3
 0068A44D    call        @UStrCatN
>0068A452    jmp         0068A46B
 0068A454    push        dword ptr [ebp-4]
 0068A457    push        68A6F8;' ? '
 0068A45C    push        dword ptr [ebp-8]
 0068A45F    mov         eax,esi
 0068A461    mov         edx,3
 0068A466    call        @UStrCatN
 0068A46B    xor         eax,eax
 0068A46D    pop         edx
 0068A46E    pop         ecx
 0068A46F    pop         ecx
 0068A470    mov         dword ptr fs:[eax],edx
 0068A473    push        68A48D
 0068A478    lea         eax,[ebp-14]
 0068A47B    mov         edx,5
 0068A480    call        @UStrArrayClr
 0068A485    ret
>0068A486    jmp         @HandleFinally
>0068A48B    jmp         0068A478
 0068A48D    pop         esi
 0068A48E    pop         ebx
 0068A48F    mov         esp,ebp
 0068A491    pop         ebp
 0068A492    ret
end;*}

//0068A700
procedure TUnaryOp.CreateClone;
begin
{*
 0068A700    mov         dl,1
 0068A702    mov         eax,[00681370];TUnaryOp
 0068A707    call        TObject.Create;TUnaryOp.Create
 0068A70C    ret
*}
end;

//0068A710
destructor TUnaryOp.Destroy();
begin
{*
 0068A710    push        ebx
 0068A711    push        esi
 0068A712    call        @BeforeDestruction
 0068A717    mov         ebx,edx
 0068A719    mov         esi,eax
 0068A71B    lea         eax,[esi+18];TUnaryOp.RHS:TExpression
 0068A71E    mov         edx,dword ptr [eax]
 0068A720    xor         ecx,ecx
 0068A722    mov         dword ptr [eax],ecx
 0068A724    mov         eax,edx
 0068A726    call        TObject.Free
 0068A72B    mov         edx,ebx
 0068A72D    and         dl,0FC
 0068A730    mov         eax,esi
 0068A732    call        TObject.Destroy
 0068A737    test        bl,bl
>0068A739    jle         0068A742
 0068A73B    mov         eax,esi
 0068A73D    call        @ClassDestroy
 0068A742    pop         esi
 0068A743    pop         ebx
 0068A744    ret
*}
end;

//0068A748
procedure TUnaryOp.FillClone(c:TExpression);
begin
{*
 0068A748    push        ebx
 0068A749    push        esi
 0068A74A    push        edi
 0068A74B    mov         esi,edx
 0068A74D    mov         ebx,eax
 0068A74F    mov         edx,esi
 0068A751    mov         eax,ebx
 0068A753    call        TExpression.FillClone
 0068A758    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068A75B    call        TExpression.Clone
 0068A760    mov         edi,esi
 0068A762    mov         dword ptr [edi+18],eax
 0068A765    movzx       eax,byte ptr [ebx+1C];TUnaryOp.Operation:TOperation
 0068A769    mov         byte ptr [edi+1C],al
 0068A76C    pop         edi
 0068A76D    pop         esi
 0068A76E    pop         ebx
 0068A76F    ret
*}
end;

//0068A770
function TUnaryOp.GetDataType:TDataType;
begin
{*
 0068A770    push        ebx
 0068A771    mov         ebx,eax
 0068A773    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068A776    mov         edx,dword ptr [eax]
 0068A778    call        dword ptr [edx+44];TExpression.GetDataType
 0068A77B    cmp         al,4
>0068A77D    je          0068A7B9
 0068A77F    movzx       edx,byte ptr [ebx+1C];TUnaryOp.Operation:TOperation
 0068A783    dec         dl
>0068A785    je          0068A79F
 0068A787    sub         dl,9
>0068A78A    je          0068A79B
 0068A78C    sub         dl,14
>0068A78F    je          0068A7A7
 0068A791    add         dl,0FE
 0068A794    sub         dl,2
>0068A797    jb          0068A7B3
>0068A799    jmp         0068A7B7
 0068A79B    mov         al,3
>0068A79D    jmp         0068A7B9
 0068A79F    cmp         al,3
>0068A7A1    jne         0068A7B9
 0068A7A3    mov         al,2
>0068A7A5    jmp         0068A7B9
 0068A7A7    cmp         al,3
>0068A7A9    je          0068A7AF
 0068A7AB    cmp         al,2
>0068A7AD    jne         0068A7B9
 0068A7AF    xor         eax,eax
>0068A7B1    jmp         0068A7B9
 0068A7B3    mov         al,2
>0068A7B5    jmp         0068A7B9
 0068A7B7    xor         eax,eax
 0068A7B9    pop         ebx
 0068A7BA    ret
*}
end;

//0068A7BC
procedure TUnaryOp.GetPerUnits1;
begin
{*
 0068A7BC    push        ebx
 0068A7BD    mov         ebx,eax
 0068A7BF    mov         eax,ebx
 0068A7C1    mov         edx,dword ptr [eax]
 0068A7C3    call        dword ptr [edx+44];TUnaryOp.GetDataType
 0068A7C6    cmp         al,3
>0068A7C8    jne         0068A7CE
 0068A7CA    xor         eax,eax
 0068A7CC    pop         ebx
 0068A7CD    ret
 0068A7CE    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068A7D1    mov         edx,dword ptr [eax]
 0068A7D3    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 0068A7D6    pop         ebx
 0068A7D7    ret
*}
end;

//0068A7D8
procedure TUnaryOp.GetPerUnits2;
begin
{*
 0068A7D8    push        ebx
 0068A7D9    mov         ebx,eax
 0068A7DB    mov         eax,ebx
 0068A7DD    mov         edx,dword ptr [eax]
 0068A7DF    call        dword ptr [edx+44];TUnaryOp.GetDataType
 0068A7E2    cmp         al,3
>0068A7E4    jne         0068A7EA
 0068A7E6    xor         eax,eax
 0068A7E8    pop         ebx
 0068A7E9    ret
 0068A7EA    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068A7ED    mov         edx,dword ptr [eax]
 0068A7EF    call        dword ptr [edx+50];TExpression.GetPerUnits2
 0068A7F2    pop         ebx
 0068A7F3    ret
*}
end;

//0068A7F4
{*procedure TUnaryOp.GetString(?:?);
begin
 0068A7F4    push        ebp
 0068A7F5    mov         ebp,esp
 0068A7F7    xor         ecx,ecx
 0068A7F9    push        ecx
 0068A7FA    push        ecx
 0068A7FB    push        ecx
 0068A7FC    push        ecx
 0068A7FD    push        ecx
 0068A7FE    push        ebx
 0068A7FF    push        esi
 0068A800    mov         esi,edx
 0068A802    mov         ebx,eax
 0068A804    xor         eax,eax
 0068A806    push        ebp
 0068A807    push        68A905
 0068A80C    push        dword ptr fs:[eax]
 0068A80F    mov         dword ptr fs:[eax],esp
 0068A812    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068A815    mov         edx,dword ptr [eax]
 0068A817    call        dword ptr [edx+44];TExpression.GetDataType
 0068A81A    cmp         al,4
>0068A81C    jne         0068A8E1
 0068A822    movzx       eax,byte ptr [ebx+1C];TUnaryOp.Operation:TOperation
 0068A826    cmp         eax,1E
>0068A829    jg          0068A83A
>0068A82B    je          0068A882
 0068A82D    dec         eax
>0068A82E    je          0068A847
 0068A830    sub         eax,9
>0068A833    je          0068A866
>0068A835    jmp         0068A8D6
 0068A83A    sub         eax,20
>0068A83D    je          0068A89E
 0068A83F    dec         eax
>0068A840    je          0068A8BA
>0068A842    jmp         0068A8D6
 0068A847    lea         edx,[ebp-4]
 0068A84A    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068A84D    mov         ecx,dword ptr [eax]
 0068A84F    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068A852    mov         ecx,dword ptr [ebp-4]
 0068A855    mov         eax,esi
 0068A857    mov         edx,68A920;'-'
 0068A85C    call        @UStrCat3
>0068A861    jmp         0068A8EA
 0068A866    lea         edx,[ebp-8]
 0068A869    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068A86C    mov         ecx,dword ptr [eax]
 0068A86E    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068A871    mov         ecx,dword ptr [ebp-8]
 0068A874    mov         eax,esi
 0068A876    mov         edx,68A930;'not '
 0068A87B    call        @UStrCat3
>0068A880    jmp         0068A8EA
 0068A882    lea         edx,[ebp-0C]
 0068A885    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068A888    mov         ecx,dword ptr [eax]
 0068A88A    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068A88D    mov         edx,dword ptr [ebp-0C]
 0068A890    mov         eax,esi
 0068A892    mov         ecx,68A948;'%'
 0068A897    call        @UStrCat3
>0068A89C    jmp         0068A8EA
 0068A89E    lea         edx,[ebp-10]
 0068A8A1    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068A8A4    mov         ecx,dword ptr [eax]
 0068A8A6    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068A8A9    mov         edx,dword ptr [ebp-10]
 0068A8AC    mov         eax,esi
 0068A8AE    mov         ecx,68A958;'!'
 0068A8B3    call        @UStrCat3
>0068A8B8    jmp         0068A8EA
 0068A8BA    lea         edx,[ebp-14]
 0068A8BD    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068A8C0    mov         ecx,dword ptr [eax]
 0068A8C2    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068A8C5    mov         edx,dword ptr [ebp-14]
 0068A8C8    mov         eax,esi
 0068A8CA    mov         ecx,68A968;'!!'
 0068A8CF    call        @UStrCat3
>0068A8D4    jmp         0068A8EA
 0068A8D6    mov         edx,esi
 0068A8D8    mov         eax,ebx
 0068A8DA    call        TExpression.GetString
>0068A8DF    jmp         0068A8EA
 0068A8E1    mov         edx,esi
 0068A8E3    mov         eax,ebx
 0068A8E5    call        TExpression.GetString
 0068A8EA    xor         eax,eax
 0068A8EC    pop         edx
 0068A8ED    pop         ecx
 0068A8EE    pop         ecx
 0068A8EF    mov         dword ptr fs:[eax],edx
 0068A8F2    push        68A90C
 0068A8F7    lea         eax,[ebp-14]
 0068A8FA    mov         edx,5
 0068A8FF    call        @UStrArrayClr
 0068A904    ret
>0068A905    jmp         @HandleFinally
>0068A90A    jmp         0068A8F7
 0068A90C    pop         esi
 0068A90D    pop         ebx
 0068A90E    mov         esp,ebp
 0068A910    pop         ebp
 0068A911    ret
end;*}

//0068A970
procedure TUnaryOp.GetUnits;
begin
{*
 0068A970    push        ebx
 0068A971    mov         ebx,eax
 0068A973    mov         eax,ebx
 0068A975    mov         edx,dword ptr [eax]
 0068A977    call        dword ptr [edx+44];TUnaryOp.GetDataType
 0068A97A    cmp         al,3
>0068A97C    jne         0068A982
 0068A97E    xor         eax,eax
 0068A980    pop         ebx
 0068A981    ret
 0068A982    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068A985    mov         edx,dword ptr [eax]
 0068A987    call        dword ptr [edx+48];TExpression.GetUnits
 0068A98A    pop         ebx
 0068A98B    ret
*}
end;

//0068A98C
{*function sub_0068A98C(?:?):?;
begin
 0068A98C    add         esp,0FFFFFFF0
 0068A98F    test        eax,eax
>0068A991    jge         0068A9A9
 0068A993    xor         eax,eax
 0068A995    mov         dword ptr [esp],eax
 0068A998    mov         dword ptr [esp+4],0C0000000
 0068A9A0    mov         word ptr [esp+8],0FFFF
>0068A9A7    jmp         0068A9DD
 0068A9A9    xor         edx,edx
 0068A9AB    mov         dword ptr [esp],edx
 0068A9AE    mov         dword ptr [esp+4],80000000
 0068A9B6    mov         word ptr [esp+8],3FFF
 0068A9BD    sub         eax,2
>0068A9C0    jl          0068A9DD
 0068A9C2    inc         eax
 0068A9C3    mov         edx,2
 0068A9C8    mov         dword ptr [esp+0C],edx
 0068A9CC    fild        dword ptr [esp+0C]
 0068A9D0    fld         tbyte ptr [esp]
 0068A9D3    fmulp       st(1),st
 0068A9D5    fstp        tbyte ptr [esp]
 0068A9D8    wait
 0068A9D9    inc         edx
 0068A9DA    dec         eax
>0068A9DB    jne         0068A9C8
 0068A9DD    fld         tbyte ptr [esp]
 0068A9E0    add         esp,10
 0068A9E3    ret
end;*}

//0068A9E4
{*function sub_0068A9E4(?:?):?;
begin
 0068A9E4    add         esp,0FFFFFFF0
 0068A9E7    mov         edx,eax
 0068A9E9    and         edx,80000001
>0068A9EF    jns         0068A9F6
 0068A9F1    dec         edx
 0068A9F2    or          edx,0FFFFFFFE
 0068A9F5    inc         edx
 0068A9F6    test        edx,edx
>0068A9F8    jne         0068AA01
 0068A9FA    mov         edx,2
>0068A9FF    jmp         0068AA06
 0068AA01    mov         edx,1
 0068AA06    xor         ecx,ecx
 0068AA08    mov         dword ptr [esp],ecx
 0068AA0B    mov         dword ptr [esp+4],80000000
 0068AA13    mov         word ptr [esp+8],3FFF
 0068AA1A    cmp         eax,edx
>0068AA1C    jl          0068AA36
 0068AA1E    mov         dword ptr [esp+0C],edx
 0068AA22    fild        dword ptr [esp+0C]
 0068AA26    fld         tbyte ptr [esp]
 0068AA29    fmulp       st(1),st
 0068AA2B    fstp        tbyte ptr [esp]
 0068AA2E    wait
 0068AA2F    add         edx,2
 0068AA32    cmp         eax,edx
>0068AA34    jge         0068AA1E
 0068AA36    fld         tbyte ptr [esp]
 0068AA39    add         esp,10
 0068AA3C    ret
end;*}

//0068AA40
{*function sub_0068AA40(?:?; ?:?; ?:?; ?:?):?;
begin
 0068AA40    push        ebp
 0068AA41    mov         ebp,esp
 0068AA43    add         esp,0FFFFFFF0
 0068AA46    push        ebx
 0068AA47    push        esi
 0068AA48    push        edi
 0068AA49    cmp         eax,0FFFFFFFF
>0068AA4C    jge         0068AA65
 0068AA4E    xor         eax,eax
 0068AA50    mov         dword ptr [ebp-10],eax
 0068AA53    mov         dword ptr [ebp-0C],0C0000000
 0068AA5A    mov         word ptr [ebp-8],0FFFF
>0068AA60    jmp         0068AAE6
 0068AA65    cmp         eax,0FFFFFFFF
>0068AA68    jne         0068AA78
 0068AA6A    xor         eax,eax
 0068AA6C    mov         dword ptr [ebp-10],eax
 0068AA6F    mov         dword ptr [ebp-0C],eax
 0068AA72    mov         word ptr [ebp-8],ax
>0068AA76    jmp         0068AAE6
 0068AA78    xor         edx,edx
 0068AA7A    push        ebp
 0068AA7B    push        68AACA
 0068AA80    push        dword ptr fs:[edx]
 0068AA83    mov         dword ptr fs:[edx],esp
 0068AA86    xor         edx,edx
 0068AA88    mov         dword ptr [ebp-10],edx
 0068AA8B    mov         dword ptr [ebp-0C],80000000
 0068AA92    mov         word ptr [ebp-8],3FFF
 0068AA98    mov         ebx,eax
 0068AA9A    test        ebx,ebx
>0068AA9C    jle         0068AAC0
 0068AA9E    movzx       eax,word ptr [ebp+10]
 0068AAA2    push        eax
 0068AAA3    push        dword ptr [ebp+0C]
 0068AAA6    push        dword ptr [ebp+8]
 0068AAA9    movzx       eax,word ptr [ebp-8]
 0068AAAD    push        eax
 0068AAAE    push        dword ptr [ebp-0C]
 0068AAB1    push        dword ptr [ebp-10]
 0068AAB4    call        00454C48
 0068AAB9    fstp        tbyte ptr [ebp-10]
 0068AABC    wait
 0068AABD    dec         ebx
>0068AABE    jne         0068AA9E
 0068AAC0    xor         eax,eax
 0068AAC2    pop         edx
 0068AAC3    pop         ecx
 0068AAC4    pop         ecx
 0068AAC5    mov         dword ptr fs:[eax],edx
>0068AAC8    jmp         0068AAE6
>0068AACA    jmp         @HandleAnyException
 0068AACF    xor         eax,eax
 0068AAD1    mov         dword ptr [ebp-10],eax
 0068AAD4    mov         dword ptr [ebp-0C],80000000
 0068AADB    mov         word ptr [ebp-8],7FFF
 0068AAE1    call        @DoneExcept
 0068AAE6    fld         tbyte ptr [ebp-10]
 0068AAE9    pop         edi
 0068AAEA    pop         esi
 0068AAEB    pop         ebx
 0068AAEC    mov         esp,ebp
 0068AAEE    pop         ebp
 0068AAEF    ret         0C
end;*}

//0068AAF4
procedure TUnaryOp.GetValue;
begin
{*
 0068AAF4    push        ebx
 0068AAF5    add         esp,0FFFFFFF8
 0068AAF8    mov         ebx,eax
 0068AAFA    movzx       eax,byte ptr [ebx+1C];TUnaryOp.Operation:TOperation
 0068AAFE    cmp         eax,1E
>0068AB01    jg          0068AB0F
>0068AB03    je          0068AB3D
 0068AB05    dec         eax
>0068AB06    je          0068AB19
 0068AB08    sub         eax,9
>0068AB0B    je          0068AB28
>0068AB0D    jmp         0068AB76
 0068AB0F    sub         eax,20
>0068AB12    je          0068AB50
 0068AB14    dec         eax
>0068AB15    je          0068AB63
>0068AB17    jmp         0068AB76
 0068AB19    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068AB1C    mov         edx,dword ptr [eax]
 0068AB1E    call        dword ptr [edx];TExpression.Evaluate
 0068AB20    fchs
 0068AB22    fstp        qword ptr [esp]
 0068AB25    wait
>0068AB26    jmp         0068AB81
 0068AB28    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068AB2B    mov         edx,dword ptr [eax]
 0068AB2D    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 0068AB30    xor         al,1
 0068AB32    call        00686074
 0068AB37    fstp        qword ptr [esp]
 0068AB3A    wait
>0068AB3B    jmp         0068AB81
 0068AB3D    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068AB40    mov         edx,dword ptr [eax]
 0068AB42    call        dword ptr [edx];TExpression.Evaluate
 0068AB44    fdiv        dword ptr ds:[68AB88];100:Single
 0068AB4A    fstp        qword ptr [esp]
 0068AB4D    wait
>0068AB4E    jmp         0068AB81
 0068AB50    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068AB53    mov         edx,dword ptr [eax]
 0068AB55    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068AB58    call        0068A98C
 0068AB5D    fstp        qword ptr [esp]
 0068AB60    wait
>0068AB61    jmp         0068AB81
 0068AB63    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068AB66    mov         edx,dword ptr [eax]
 0068AB68    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068AB6B    call        0068A9E4
 0068AB70    fstp        qword ptr [esp]
 0068AB73    wait
>0068AB74    jmp         0068AB81
 0068AB76    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068AB79    mov         edx,dword ptr [eax]
 0068AB7B    call        dword ptr [edx];TExpression.Evaluate
 0068AB7D    fstp        qword ptr [esp]
 0068AB80    wait
 0068AB81    fld         qword ptr [esp]
 0068AB84    pop         ecx
 0068AB85    pop         edx
 0068AB86    pop         ebx
 0068AB87    ret
*}
end;

//0068AB8C
procedure TUnaryOp.GetVector(x:Double; y:Double; z:Double);
begin
{*
 0068AB8C    push        ebp
 0068AB8D    mov         ebp,esp
 0068AB8F    add         esp,0FFFFFFF8
 0068AB92    push        ebx
 0068AB93    push        esi
 0068AB94    mov         dword ptr [ebp-8],ecx
 0068AB97    mov         dword ptr [ebp-4],edx
 0068AB9A    mov         ebx,eax
 0068AB9C    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068AB9F    mov         edx,dword ptr [eax]
 0068ABA1    call        dword ptr [edx+44];TExpression.GetDataType
 0068ABA4    cmp         al,5
>0068ABA6    je          0068ABC2
 0068ABA8    cmp         al,7
>0068ABAA    je          0068ABC2
 0068ABAC    mov         eax,dword ptr [ebp+8]
 0068ABAF    push        eax
 0068ABB0    mov         ecx,dword ptr [ebp-8]
 0068ABB3    mov         edx,dword ptr [ebp-4]
 0068ABB6    mov         eax,ebx
 0068ABB8    call        TExpression.GetVector
>0068ABBD    jmp         0068AC69
 0068ABC2    cmp         al,5
>0068ABC4    jne         0068ABDA
 0068ABC6    mov         eax,dword ptr [ebp+8]
 0068ABC9    push        eax
 0068ABCA    mov         ecx,dword ptr [ebp-8]
 0068ABCD    mov         edx,dword ptr [ebp-4]
 0068ABD0    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068ABD3    mov         esi,dword ptr [eax]
 0068ABD5    call        dword ptr [esi+20];TExpression.EvaluateVector
>0068ABD8    jmp         0068ABEC
 0068ABDA    mov         eax,dword ptr [ebp+8]
 0068ABDD    push        eax
 0068ABDE    mov         ecx,dword ptr [ebp-8]
 0068ABE1    mov         edx,dword ptr [ebp-4]
 0068ABE4    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068ABE7    mov         esi,dword ptr [eax]
 0068ABE9    call        dword ptr [esi+1C];TExpression.EvaluateColour
 0068ABEC    movzx       eax,byte ptr [ebx+1C];TUnaryOp.Operation:TOperation
 0068ABF0    dec         al
>0068ABF2    je          0068ABFA
 0068ABF4    sub         al,1D
>0068ABF6    je          0068AC23
>0068ABF8    jmp         0068AC58
 0068ABFA    mov         eax,dword ptr [ebp-4]
 0068ABFD    fld         qword ptr [eax]
 0068ABFF    fchs
 0068AC01    mov         eax,dword ptr [ebp-4]
 0068AC04    fstp        qword ptr [eax]
 0068AC06    wait
 0068AC07    mov         eax,dword ptr [ebp-8]
 0068AC0A    fld         qword ptr [eax]
 0068AC0C    fchs
 0068AC0E    mov         eax,dword ptr [ebp-8]
 0068AC11    fstp        qword ptr [eax]
 0068AC13    wait
 0068AC14    mov         eax,dword ptr [ebp+8]
 0068AC17    fld         qword ptr [eax]
 0068AC19    fchs
 0068AC1B    mov         eax,dword ptr [ebp+8]
 0068AC1E    fstp        qword ptr [eax]
 0068AC20    wait
>0068AC21    jmp         0068AC69
 0068AC23    mov         eax,dword ptr [ebp-4]
 0068AC26    fld         qword ptr [eax]
 0068AC28    fdiv        dword ptr ds:[68AC74];100:Single
 0068AC2E    mov         eax,dword ptr [ebp-4]
 0068AC31    fstp        qword ptr [eax]
 0068AC33    wait
 0068AC34    mov         eax,dword ptr [ebp-8]
 0068AC37    fld         qword ptr [eax]
 0068AC39    fdiv        dword ptr ds:[68AC74];100:Single
 0068AC3F    mov         eax,dword ptr [ebp-8]
 0068AC42    fstp        qword ptr [eax]
 0068AC44    wait
 0068AC45    mov         eax,dword ptr [ebp+8]
 0068AC48    fld         qword ptr [eax]
 0068AC4A    fdiv        dword ptr ds:[68AC74];100:Single
 0068AC50    mov         eax,dword ptr [ebp+8]
 0068AC53    fstp        qword ptr [eax]
 0068AC55    wait
>0068AC56    jmp         0068AC69
 0068AC58    mov         eax,dword ptr [ebp+8]
 0068AC5B    push        eax
 0068AC5C    mov         ecx,dword ptr [ebp-8]
 0068AC5F    mov         edx,dword ptr [ebp-4]
 0068AC62    mov         eax,ebx
 0068AC64    call        TExpression.GetVector
 0068AC69    pop         esi
 0068AC6A    pop         ebx
 0068AC6B    pop         ecx
 0068AC6C    pop         ecx
 0068AC6D    pop         ebp
 0068AC6E    ret         4
*}
end;

//0068AC78
procedure TUnaryOp.SetIffy(IsIffy:Boolean);
begin
{*
 0068AC78    push        ebx
 0068AC79    push        esi
 0068AC7A    mov         ebx,edx
 0068AC7C    mov         esi,eax
 0068AC7E    mov         edx,ebx
 0068AC80    mov         eax,esi
 0068AC82    call        TExpression.SetIffy
 0068AC87    mov         edx,ebx
 0068AC89    mov         eax,dword ptr [esi+18];TUnaryOp.RHS:TExpression
 0068AC8C    mov         ecx,dword ptr [eax]
 0068AC8E    call        dword ptr [ecx+74];TExpression.SetIffy
 0068AC91    pop         esi
 0068AC92    pop         ebx
 0068AC93    ret
*}
end;

//0068AC94
{*procedure TUnaryOp.SetValue(NewValue:Double; ?:?);
begin
 0068AC94    push        ebp
 0068AC95    mov         ebp,esp
 0068AC97    push        ebx
 0068AC98    mov         ebx,eax
 0068AC9A    movzx       eax,byte ptr [ebx+1C];TUnaryOp.Operation:TOperation
 0068AC9E    dec         al
>0068ACA0    je          0068ACAC
 0068ACA2    sub         al,9
>0068ACA4    je          0068ACC2
 0068ACA6    sub         al,14
>0068ACA8    je          0068ACE5
>0068ACAA    jmp         0068ACFF
 0068ACAC    fld         qword ptr [ebp+8]
 0068ACAF    fchs
 0068ACB1    add         esp,0FFFFFFF8
 0068ACB4    fstp        qword ptr [esp]
 0068ACB7    wait
 0068ACB8    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068ACBB    mov         edx,dword ptr [eax]
 0068ACBD    call        dword ptr [edx+58];TExpression.SetValue
>0068ACC0    jmp         0068AD0D
 0068ACC2    push        dword ptr [ebp+0C]
 0068ACC5    push        dword ptr [ebp+8]
 0068ACC8    call        00686060
 0068ACCD    xor         al,1
 0068ACCF    call        00686074
 0068ACD4    add         esp,0FFFFFFF8
 0068ACD7    fstp        qword ptr [esp]
 0068ACDA    wait
 0068ACDB    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068ACDE    mov         edx,dword ptr [eax]
 0068ACE0    call        dword ptr [edx+58];TExpression.SetValue
>0068ACE3    jmp         0068AD0D
 0068ACE5    fld         qword ptr [ebp+8]
 0068ACE8    fmul        dword ptr ds:[68AD14];100:Single
 0068ACEE    add         esp,0FFFFFFF8
 0068ACF1    fstp        qword ptr [esp]
 0068ACF4    wait
 0068ACF5    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068ACF8    mov         edx,dword ptr [eax]
 0068ACFA    call        dword ptr [edx+58];TExpression.SetValue
>0068ACFD    jmp         0068AD0D
 0068ACFF    push        dword ptr [ebp+0C]
 0068AD02    push        dword ptr [ebp+8]
 0068AD05    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068AD08    mov         edx,dword ptr [eax]
 0068AD0A    call        dword ptr [edx+58];TExpression.SetValue
 0068AD0D    pop         ebx
 0068AD0E    pop         ebp
 0068AD0F    ret         8
end;*}

//0068AD18
procedure TUnaryOp.Swallow;
begin
{*
 0068AD18    push        ebx
 0068AD19    mov         ebx,eax
 0068AD1B    mov         eax,ebx
 0068AD1D    call        TExpression.Swallow
 0068AD22    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068AD25    mov         edx,dword ptr [eax]
 0068AD27    call        dword ptr [edx+88];TExpression.Swallow
 0068AD2D    pop         ebx
 0068AD2E    ret
*}
end;

//0068AD30
{*procedure TUnaryOp.ToString(?:?);
begin
 0068AD30    push        ebp
 0068AD31    mov         ebp,esp
 0068AD33    xor         ecx,ecx
 0068AD35    push        ecx
 0068AD36    push        ecx
 0068AD37    push        ecx
 0068AD38    push        ecx
 0068AD39    push        ecx
 0068AD3A    push        ebx
 0068AD3B    push        esi
 0068AD3C    mov         esi,edx
 0068AD3E    mov         ebx,eax
 0068AD40    xor         eax,eax
 0068AD42    push        ebp
 0068AD43    push        68AE23
 0068AD48    push        dword ptr fs:[eax]
 0068AD4B    mov         dword ptr fs:[eax],esp
 0068AD4E    movzx       eax,byte ptr [ebx+1C];TUnaryOp.Operation:TOperation
 0068AD52    cmp         eax,1E
>0068AD55    jg          0068AD66
>0068AD57    je          0068ADAB
 0068AD59    dec         eax
>0068AD5A    je          0068AD73
 0068AD5C    sub         eax,9
>0068AD5F    je          0068AD8F
>0068AD61    jmp         0068ADFF
 0068AD66    sub         eax,20
>0068AD69    je          0068ADC7
 0068AD6B    dec         eax
>0068AD6C    je          0068ADE3
>0068AD6E    jmp         0068ADFF
 0068AD73    lea         edx,[ebp-4]
 0068AD76    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068AD79    mov         ecx,dword ptr [eax]
 0068AD7B    call        dword ptr [ecx-24];TExpression.ToString
 0068AD7E    mov         ecx,dword ptr [ebp-4]
 0068AD81    mov         eax,esi
 0068AD83    mov         edx,68AE3C;'-'
 0068AD88    call        @UStrCat3
>0068AD8D    jmp         0068AE08
 0068AD8F    lea         edx,[ebp-8]
 0068AD92    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068AD95    mov         ecx,dword ptr [eax]
 0068AD97    call        dword ptr [ecx-24];TExpression.ToString
 0068AD9A    mov         ecx,dword ptr [ebp-8]
 0068AD9D    mov         eax,esi
 0068AD9F    mov         edx,68AE4C;'not '
 0068ADA4    call        @UStrCat3
>0068ADA9    jmp         0068AE08
 0068ADAB    lea         edx,[ebp-0C]
 0068ADAE    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068ADB1    mov         ecx,dword ptr [eax]
 0068ADB3    call        dword ptr [ecx-24];TExpression.ToString
 0068ADB6    mov         edx,dword ptr [ebp-0C]
 0068ADB9    mov         eax,esi
 0068ADBB    mov         ecx,68AE64;'%'
 0068ADC0    call        @UStrCat3
>0068ADC5    jmp         0068AE08
 0068ADC7    lea         edx,[ebp-10]
 0068ADCA    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068ADCD    mov         ecx,dword ptr [eax]
 0068ADCF    call        dword ptr [ecx-24];TExpression.ToString
 0068ADD2    mov         edx,dword ptr [ebp-10]
 0068ADD5    mov         eax,esi
 0068ADD7    mov         ecx,68AE74;'!'
 0068ADDC    call        @UStrCat3
>0068ADE1    jmp         0068AE08
 0068ADE3    lea         edx,[ebp-14]
 0068ADE6    mov         eax,dword ptr [ebx+18];TUnaryOp.RHS:TExpression
 0068ADE9    mov         ecx,dword ptr [eax]
 0068ADEB    call        dword ptr [ecx-24];TExpression.ToString
 0068ADEE    mov         edx,dword ptr [ebp-14]
 0068ADF1    mov         eax,esi
 0068ADF3    mov         ecx,68AE84;'!!'
 0068ADF8    call        @UStrCat3
>0068ADFD    jmp         0068AE08
 0068ADFF    mov         edx,esi
 0068AE01    mov         eax,ebx
 0068AE03    call        TExpression.ToString
 0068AE08    xor         eax,eax
 0068AE0A    pop         edx
 0068AE0B    pop         ecx
 0068AE0C    pop         ecx
 0068AE0D    mov         dword ptr fs:[eax],edx
 0068AE10    push        68AE2A
 0068AE15    lea         eax,[ebp-14]
 0068AE18    mov         edx,5
 0068AE1D    call        @UStrArrayClr
 0068AE22    ret
>0068AE23    jmp         @HandleFinally
>0068AE28    jmp         0068AE15
 0068AE2A    pop         esi
 0068AE2B    pop         ebx
 0068AE2C    mov         esp,ebp
 0068AE2E    pop         ebp
 0068AE2F    ret
end;*}

//0068AE8C
{*function sub_0068AE8C(?:Extended; ?:Extended):?;
begin
 0068AE8C    push        ebp
 0068AE8D    mov         ebp,esp
 0068AE8F    fld         tbyte ptr [ebp+14]
 0068AE92    fld         tbyte ptr [ebp+8]
 0068AE95    fdivp       st(1),st
 0068AE97    call        @TRUNC
 0068AE9C    pop         ebp
 0068AE9D    ret         18
end;*}

//0068AEA0
{*function sub_0068AEA0(?:Extended; ?:?; ?:?; ?:Extended; ?:?; ?:?):?;
begin
 0068AEA0    push        ebp
 0068AEA1    mov         ebp,esp
 0068AEA3    add         esp,0FFFFFFEC
 0068AEA6    movzx       eax,word ptr [ebp+1C]
 0068AEAA    push        eax
 0068AEAB    push        dword ptr [ebp+18]
 0068AEAE    push        dword ptr [ebp+14]
 0068AEB1    movzx       eax,word ptr [ebp+10]
 0068AEB5    push        eax
 0068AEB6    push        dword ptr [ebp+0C]
 0068AEB9    push        dword ptr [ebp+8]
 0068AEBC    call        0068AE8C
 0068AEC1    mov         dword ptr [ebp-14],eax
 0068AEC4    fild        dword ptr [ebp-14]
 0068AEC7    fld         tbyte ptr [ebp+8]
 0068AECA    fmulp       st(1),st
 0068AECC    fld         tbyte ptr [ebp+14]
 0068AECF    fsubrp      st(1),st
 0068AED1    fstp        tbyte ptr [ebp-10]
 0068AED4    wait
 0068AED5    fld         tbyte ptr [ebp-10]
 0068AED8    mov         esp,ebp
 0068AEDA    pop         ebp
 0068AEDB    ret         18
end;*}

//0068AEE0
procedure TPressedExpression.CreateClone;
begin
{*
 0068AEE0    mov         dl,1
 0068AEE2    mov         eax,[0067F1FC];TPressedExpression
 0068AEE7    call        TObject.Create;TPressedExpression.Create
 0068AEEC    ret
*}
end;

//0068AEF0
destructor TPressedExpression.Destroy();
begin
{*
 0068AEF0    push        ebx
 0068AEF1    push        esi
 0068AEF2    call        @BeforeDestruction
 0068AEF7    mov         ebx,edx
 0068AEF9    mov         esi,eax
 0068AEFB    lea         eax,[esi+20];TPressedExpression.expression:TExpression
 0068AEFE    mov         edx,dword ptr [eax]
 0068AF00    xor         ecx,ecx
 0068AF02    mov         dword ptr [eax],ecx
 0068AF04    mov         eax,edx
 0068AF06    call        TObject.Free
 0068AF0B    mov         edx,ebx
 0068AF0D    and         dl,0FC
 0068AF10    mov         eax,esi
 0068AF12    call        TObject.Destroy
 0068AF17    test        bl,bl
>0068AF19    jle         0068AF22
 0068AF1B    mov         eax,esi
 0068AF1D    call        @ClassDestroy
 0068AF22    pop         esi
 0068AF23    pop         ebx
 0068AF24    ret
*}
end;

//0068AF28
procedure TPressedExpression.FillClone(c:TExpression);
begin
{*
 0068AF28    push        ebx
 0068AF29    push        esi
 0068AF2A    push        edi
 0068AF2B    mov         esi,edx
 0068AF2D    mov         ebx,eax
 0068AF2F    mov         edx,esi
 0068AF31    mov         eax,ebx
 0068AF33    call        TUpdatingExpression.FillClone
 0068AF38    mov         eax,dword ptr [ebx+20];TPressedExpression.expression:TExpression
 0068AF3B    call        TExpression.Clone
 0068AF40    mov         edi,esi
 0068AF42    mov         dword ptr [edi+20],eax
 0068AF45    mov         eax,dword ptr [ebx+24];TPressedExpression.Item:Integer
 0068AF48    mov         dword ptr [edi+24],eax
 0068AF4B    mov         eax,dword ptr [ebx+28];TPressedExpression.HoldTime:TExpression
 0068AF4E    mov         dword ptr [edi+28],eax
 0068AF51    mov         eax,dword ptr [ebx+30];TPressedExpression.ClickTime:Double
 0068AF54    mov         dword ptr [edi+30],eax
 0068AF57    mov         eax,dword ptr [ebx+34];TPressedExpression.?f34:dword
 0068AF5A    mov         dword ptr [edi+34],eax
 0068AF5D    pop         edi
 0068AF5E    pop         esi
 0068AF5F    pop         ebx
 0068AF60    ret
*}
end;

//0068AF64
function TPressedExpression.GetDataType:TDataType;
begin
{*
 0068AF64    cmp         dword ptr [eax+24],8;TPressedExpression.Item:Integer
>0068AF68    jne         0068AF73
 0068AF6A    mov         eax,dword ptr [eax+20];TPressedExpression.expression:TExpression
 0068AF6D    mov         edx,dword ptr [eax]
 0068AF6F    call        dword ptr [edx+44];TExpression.GetDataType
 0068AF72    ret
 0068AF73    mov         al,3
 0068AF75    ret
*}
end;

//0068AF78
function TPressedExpression.GetPerUnits1:TUnits;
begin
{*
 0068AF78    cmp         dword ptr [eax+24],8;TPressedExpression.Item:Integer
>0068AF7C    jne         0068AF87
 0068AF7E    mov         eax,dword ptr [eax+20];TPressedExpression.expression:TExpression
 0068AF81    mov         edx,dword ptr [eax]
 0068AF83    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 0068AF86    ret
 0068AF87    xor         eax,eax
 0068AF89    ret
*}
end;

//0068AF8C
function TPressedExpression.GetPerUnits2:TUnits;
begin
{*
 0068AF8C    cmp         dword ptr [eax+24],8;TPressedExpression.Item:Integer
>0068AF90    jne         0068AF9B
 0068AF92    mov         eax,dword ptr [eax+20];TPressedExpression.expression:TExpression
 0068AF95    mov         edx,dword ptr [eax]
 0068AF97    call        dword ptr [edx+50];TExpression.GetPerUnits2
 0068AF9A    ret
 0068AF9B    xor         eax,eax
 0068AF9D    ret
*}
end;

//0068AFA0
function TPressedExpression.GetUnits:TUnits;
begin
{*
 0068AFA0    cmp         dword ptr [eax+24],8;TPressedExpression.Item:Integer
>0068AFA4    jne         0068AFAF
 0068AFA6    mov         eax,dword ptr [eax+20];TPressedExpression.expression:TExpression
 0068AFA9    mov         edx,dword ptr [eax]
 0068AFAB    call        dword ptr [edx+48];TExpression.GetUnits
 0068AFAE    ret
 0068AFAF    xor         eax,eax
 0068AFB1    ret
*}
end;

//0068AFB4
procedure TPressedExpression.GetValue;
begin
{*
 0068AFB4    push        ebx
 0068AFB5    add         esp,0FFFFFFF8
 0068AFB8    mov         ebx,eax
 0068AFBA    mov         edx,dword ptr ds:[78BDC0];0x0 gvar_0078BDC0
 0068AFC0    mov         eax,ebx
 0068AFC2    mov         ecx,dword ptr [eax]
 0068AFC4    call        dword ptr [ecx+98];TPressedExpression.Update
 0068AFCA    mov         eax,dword ptr [ebx+8];TPressedExpression.PreviousValue:Double
 0068AFCD    mov         dword ptr [esp],eax
 0068AFD0    mov         eax,dword ptr [ebx+0C];TPressedExpression.?fC:dword
 0068AFD3    mov         dword ptr [esp+4],eax
 0068AFD7    fld         qword ptr [esp]
 0068AFDA    pop         ecx
 0068AFDB    pop         edx
 0068AFDC    pop         ebx
 0068AFDD    ret
*}
end;

//0068AFE0
procedure TPressedExpression.SetIffy(IsIffy:Boolean);
begin
{*
 0068AFE0    push        ebx
 0068AFE1    push        esi
 0068AFE2    mov         ebx,edx
 0068AFE4    mov         esi,eax
 0068AFE6    mov         edx,ebx
 0068AFE8    mov         eax,esi
 0068AFEA    call        TExpression.SetIffy
 0068AFEF    mov         edx,ebx
 0068AFF1    mov         eax,dword ptr [esi+20];TPressedExpression.expression:TExpression
 0068AFF4    mov         ecx,dword ptr [eax]
 0068AFF6    call        dword ptr [ecx+74];TExpression.SetIffy
 0068AFF9    pop         esi
 0068AFFA    pop         ebx
 0068AFFB    ret
*}
end;

//0068AFFC
{*function TPressedExpression.SetValue(NewValue:Double; ?:?):Boolean;
begin
 0068AFFC    push        ebp
 0068AFFD    mov         ebp,esp
 0068AFFF    push        ebx
 0068B000    push        esi
 0068B001    mov         esi,eax
 0068B003    xor         ebx,ebx
 0068B005    mov         eax,dword ptr [esi+24];TPressedExpression.Item:Integer
 0068B008    cmp         eax,8
>0068B00B    ja          0068B12B
 0068B011    jmp         dword ptr [eax*4+68B018]
 0068B011    dd          0068B12B
 0068B011    dd          0068B03C
 0068B011    dd          0068B05E
 0068B011    dd          0068B080
 0068B011    dd          0068B0AA
 0068B011    dd          0068B0DD
 0068B011    dd          0068B100
 0068B011    dd          0068B104
 0068B011    dd          0068B108
 0068B03C    push        dword ptr [ebp+0C]
 0068B03F    push        dword ptr [ebp+8]
 0068B042    call        00686060
 0068B047    test        al,al
>0068B049    je          0068B12D
 0068B04F    mov         eax,dword ptr [esi+20];TPressedExpression.expression:TExpression
 0068B052    mov         edx,dword ptr [eax]
 0068B054    call        dword ptr [edx+6C];TExpression.Press
 0068B057    mov         ebx,eax
>0068B059    jmp         0068B12D
 0068B05E    push        dword ptr [ebp+0C]
 0068B061    push        dword ptr [ebp+8]
 0068B064    call        00686060
 0068B069    test        al,al
>0068B06B    je          0068B12D
 0068B071    mov         eax,dword ptr [esi+20];TPressedExpression.expression:TExpression
 0068B074    mov         edx,dword ptr [eax]
 0068B076    call        dword ptr [edx+70];TExpression.Release
 0068B079    mov         ebx,eax
>0068B07B    jmp         0068B12D
 0068B080    push        dword ptr [ebp+0C]
 0068B083    push        dword ptr [ebp+8]
 0068B086    call        00686060
 0068B08B    test        al,al
>0068B08D    je          0068B12D
 0068B093    mov         eax,dword ptr [esi+20];TPressedExpression.expression:TExpression
 0068B096    mov         edx,dword ptr [eax]
 0068B098    call        dword ptr [edx+6C];TExpression.Press
 0068B09B    mov         eax,dword ptr [esi+20];TPressedExpression.expression:TExpression
 0068B09E    mov         edx,dword ptr [eax]
 0068B0A0    call        dword ptr [edx+70];TExpression.Release
 0068B0A3    mov         ebx,eax
>0068B0A5    jmp         0068B12D
 0068B0AA    push        dword ptr [ebp+0C]
 0068B0AD    push        dword ptr [ebp+8]
 0068B0B0    call        00686060
 0068B0B5    test        al,al
>0068B0B7    je          0068B12D
 0068B0B9    mov         eax,dword ptr [esi+20];TPressedExpression.expression:TExpression
 0068B0BC    mov         edx,dword ptr [eax]
 0068B0BE    call        dword ptr [edx+6C];TExpression.Press
 0068B0C1    mov         eax,dword ptr [esi+20];TPressedExpression.expression:TExpression
 0068B0C4    mov         edx,dword ptr [eax]
 0068B0C6    call        dword ptr [edx+70];TExpression.Release
 0068B0C9    mov         eax,dword ptr [esi+20];TPressedExpression.expression:TExpression
 0068B0CC    mov         edx,dword ptr [eax]
 0068B0CE    call        dword ptr [edx+6C];TExpression.Press
 0068B0D1    mov         eax,dword ptr [esi+20];TPressedExpression.expression:TExpression
 0068B0D4    mov         edx,dword ptr [eax]
 0068B0D6    call        dword ptr [edx+70];TExpression.Release
 0068B0D9    mov         ebx,eax
>0068B0DB    jmp         0068B12D
 0068B0DD    push        dword ptr [ebp+0C]
 0068B0E0    push        dword ptr [ebp+8]
 0068B0E3    call        00686060
 0068B0E8    test        al,al
>0068B0EA    je          0068B12D
 0068B0EC    mov         eax,dword ptr [esi+20];TPressedExpression.expression:TExpression
 0068B0EF    mov         edx,dword ptr [eax]
 0068B0F1    call        dword ptr [edx+6C];TExpression.Press
 0068B0F4    mov         eax,dword ptr [esi+20];TPressedExpression.expression:TExpression
 0068B0F7    mov         edx,dword ptr [eax]
 0068B0F9    call        dword ptr [edx+70];TExpression.Release
 0068B0FC    mov         ebx,eax
>0068B0FE    jmp         0068B12D
 0068B100    xor         ebx,ebx
>0068B102    jmp         0068B12D
 0068B104    xor         ebx,ebx
>0068B106    jmp         0068B12D
 0068B108    fld         qword ptr [esi+38];TPressedExpression.OldValue:Double
 0068B10B    fadd        qword ptr [ebp+8]
 0068B10E    add         esp,0FFFFFFF8
 0068B111    fstp        qword ptr [esp]
 0068B114    wait
 0068B115    mov         eax,dword ptr [esi+20];TPressedExpression.expression:TExpression
 0068B118    mov         edx,dword ptr [eax]
 0068B11A    call        dword ptr [edx+58];TExpression.SetValue
 0068B11D    mov         ebx,eax
 0068B11F    fld         qword ptr [esi+38];TPressedExpression.OldValue:Double
 0068B122    fadd        qword ptr [ebp+8]
 0068B125    fstp        qword ptr [esi+38];TPressedExpression.OldValue:Double
 0068B128    wait
>0068B129    jmp         0068B12D
 0068B12B    xor         ebx,ebx
 0068B12D    mov         eax,ebx
 0068B12F    pop         esi
 0068B130    pop         ebx
 0068B131    pop         ebp
 0068B132    ret         8
end;*}

//0068B138
procedure TPressedExpression.Swallow;
begin
{*
 0068B138    push        ebx
 0068B139    mov         ebx,eax
 0068B13B    mov         eax,ebx
 0068B13D    call        TExpression.Swallow
 0068B142    mov         eax,dword ptr [ebx+20];TPressedExpression.expression:TExpression
 0068B145    mov         edx,dword ptr [eax]
 0068B147    call        dword ptr [edx+88];TExpression.Swallow
 0068B14D    pop         ebx
 0068B14E    ret
*}
end;

//0068B150
{*procedure TPressedExpression.ToString(?:?);
begin
 0068B150    push        ebp
 0068B151    mov         ebp,esp
 0068B153    xor         ecx,ecx
 0068B155    push        ecx
 0068B156    push        ecx
 0068B157    push        ecx
 0068B158    push        ecx
 0068B159    push        ecx
 0068B15A    push        ebx
 0068B15B    push        esi
 0068B15C    push        edi
 0068B15D    mov         esi,edx
 0068B15F    mov         ebx,eax
 0068B161    xor         eax,eax
 0068B163    push        ebp
 0068B164    push        68B2C8
 0068B169    push        dword ptr fs:[eax]
 0068B16C    mov         dword ptr fs:[eax],esp
 0068B16F    mov         edi,dword ptr [ebx+24];TPressedExpression.Item:Integer
 0068B172    mov         eax,edi
 0068B174    cmp         eax,8
>0068B177    ja          0068B223
 0068B17D    jmp         dword ptr [eax*4+68B184]
 0068B17D    dd          0068B223
 0068B17D    dd          0068B1A8
 0068B17D    dd          0068B1BA
 0068B17D    dd          0068B1C9
 0068B17D    dd          0068B1D8
 0068B17D    dd          0068B1E7
 0068B17D    dd          0068B1F6
 0068B17D    dd          0068B205
 0068B17D    dd          0068B214
 0068B1A8    lea         eax,[ebp-4]
 0068B1AB    mov         edx,68B2E4;'Pressed'
 0068B1B0    call        @UStrLAsg
>0068B1B5    jmp         0068B23D
 0068B1BA    lea         eax,[ebp-4]
 0068B1BD    mov         edx,68B300;'Released'
 0068B1C2    call        @UStrLAsg
>0068B1C7    jmp         0068B23D
 0068B1C9    lea         eax,[ebp-4]
 0068B1CC    mov         edx,68B320;'Clicked'
 0068B1D1    call        @UStrLAsg
>0068B1D6    jmp         0068B23D
 0068B1D8    lea         eax,[ebp-4]
 0068B1DB    mov         edx,68B33C;'DoubleClicked'
 0068B1E0    call        @UStrLAsg
>0068B1E5    jmp         0068B23D
 0068B1E7    lea         eax,[ebp-4]
 0068B1EA    mov         edx,68B364;'SingleClicked'
 0068B1EF    call        @UStrLAsg
>0068B1F4    jmp         0068B23D
 0068B1F6    lea         eax,[ebp-4]
 0068B1F9    mov         edx,68B38C;'HeldDown'
 0068B1FE    call        @UStrLAsg
>0068B203    jmp         0068B23D
 0068B205    lea         eax,[ebp-4]
 0068B208    mov         edx,68B3AC;'KeepDown'
 0068B20D    call        @UStrLAsg
>0068B212    jmp         0068B23D
 0068B214    lea         eax,[ebp-4]
 0068B217    mov         edx,68B3CC;'Delta'
 0068B21C    call        @UStrLAsg
>0068B221    jmp         0068B23D
 0068B223    lea         edx,[ebp-8]
 0068B226    mov         eax,edi
 0068B228    call        IntToStr
 0068B22D    mov         ecx,dword ptr [ebp-8]
 0068B230    lea         eax,[ebp-4]
 0068B233    mov         edx,68B3E4;'PressedExpression'
 0068B238    call        @UStrCat3
 0068B23D    mov         eax,dword ptr [ebx+24];TPressedExpression.Item:Integer
 0068B240    cmp         eax,6
>0068B243    je          0068B24A
 0068B245    cmp         eax,7
>0068B248    jne         0068B286
 0068B24A    push        dword ptr [ebp-4]
 0068B24D    push        68B414;'('
 0068B252    lea         edx,[ebp-0C]
 0068B255    mov         eax,dword ptr [ebx+20];TPressedExpression.expression:TExpression
 0068B258    mov         ecx,dword ptr [eax]
 0068B25A    call        dword ptr [ecx-24];TExpression.ToString
 0068B25D    push        dword ptr [ebp-0C]
 0068B260    push        68B424;', '
 0068B265    lea         edx,[ebp-10]
 0068B268    mov         eax,dword ptr [ebx+28];TPressedExpression.HoldTime:TExpression
 0068B26B    mov         ecx,dword ptr [eax]
 0068B26D    call        dword ptr [ecx-24];TExpression.ToString
 0068B270    push        dword ptr [ebp-10]
 0068B273    push        68B438;')'
 0068B278    mov         eax,esi
 0068B27A    mov         edx,6
 0068B27F    call        @UStrCatN
>0068B284    jmp         0068B2AD
 0068B286    push        dword ptr [ebp-4]
 0068B289    push        68B414;'('
 0068B28E    lea         edx,[ebp-14]
 0068B291    mov         eax,dword ptr [ebx+20];TPressedExpression.expression:TExpression
 0068B294    mov         ecx,dword ptr [eax]
 0068B296    call        dword ptr [ecx-24];TExpression.ToString
 0068B299    push        dword ptr [ebp-14]
 0068B29C    push        68B438;')'
 0068B2A1    mov         eax,esi
 0068B2A3    mov         edx,4
 0068B2A8    call        @UStrCatN
 0068B2AD    xor         eax,eax
 0068B2AF    pop         edx
 0068B2B0    pop         ecx
 0068B2B1    pop         ecx
 0068B2B2    mov         dword ptr fs:[eax],edx
 0068B2B5    push        68B2CF
 0068B2BA    lea         eax,[ebp-14]
 0068B2BD    mov         edx,5
 0068B2C2    call        @UStrArrayClr
 0068B2C7    ret
>0068B2C8    jmp         @HandleFinally
>0068B2CD    jmp         0068B2BA
 0068B2CF    pop         edi
 0068B2D0    pop         esi
 0068B2D1    pop         ebx
 0068B2D2    mov         esp,ebp
 0068B2D4    pop         ebp
 0068B2D5    ret
end;*}

//0068B43C
procedure TPressedExpression.Update(frame:Cardinal);
begin
{*
 0068B43C    push        ebx
 0068B43D    push        esi
 0068B43E    push        edi
 0068B43F    add         esp,0FFFFFFEC
 0068B442    mov         esi,edx
 0068B444    mov         edi,eax
 0068B446    cmp         esi,dword ptr [edi+18];TPressedExpression....................FrameLastUpdated:Cardinal
>0068B449    je          0068B755
 0068B44F    mov         eax,dword ptr [edi+24];TPressedExpression.Item:Integer
 0068B452    cmp         eax,9
>0068B455    je          0068B752
 0068B45B    cmp         eax,8
>0068B45E    jne         0068B48A
 0068B460    mov         eax,dword ptr [edi+20];TPressedExpression.expression:TExpression
 0068B463    mov         edx,dword ptr [eax]
 0068B465    call        dword ptr [edx];TExpression.Evaluate
 0068B467    fstp        qword ptr [esp+8]
 0068B46B    wait
 0068B46C    fld         qword ptr [esp+8]
 0068B470    fsub        qword ptr [edi+38];TPressedExpression.OldValue:Double
 0068B473    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B476    wait
 0068B477    mov         eax,dword ptr [esp+8]
 0068B47B    mov         dword ptr [edi+38],eax;TPressedExpression.OldValue:Double
 0068B47E    mov         eax,dword ptr [esp+0C]
 0068B482    mov         dword ptr [edi+3C],eax;TPressedExpression.?f3C:dword
>0068B485    jmp         0068B752
 0068B48A    cmp         eax,7
>0068B48D    jne         0068B53B
 0068B493    call        00682F08
 0068B498    fstp        qword ptr [esp]
 0068B49B    wait
 0068B49C    mov         eax,dword ptr [edi+20];TPressedExpression.expression:TExpression
 0068B49F    mov         edx,dword ptr [eax]
 0068B4A1    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 0068B4A4    test        al,al
>0068B4A6    je          0068B4D8
 0068B4A8    mov         al,1
 0068B4AA    call        00686074
 0068B4AF    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B4B2    wait
 0068B4B3    fld         qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B4B6    fcomp       dword ptr ds:[68B75C];0:Single
 0068B4BC    wait
 0068B4BD    fnstsw      al
 0068B4BF    sahf
>0068B4C0    jne         0068B752
 0068B4C6    mov         eax,dword ptr [esp]
 0068B4C9    mov         dword ptr [edi+30],eax;TPressedExpression.ClickTime:Double
 0068B4CC    mov         eax,dword ptr [esp+4]
 0068B4D0    mov         dword ptr [edi+34],eax;TPressedExpression.?f34:dword
>0068B4D3    jmp         0068B752
 0068B4D8    fld         qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B4DB    fcomp       dword ptr ds:[68B75C];0:Single
 0068B4E1    wait
 0068B4E2    fnstsw      al
 0068B4E4    sahf
>0068B4E5    jne         0068B4F7
 0068B4E7    xor         eax,eax
 0068B4E9    call        00686074
 0068B4EE    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B4F1    wait
>0068B4F2    jmp         0068B752
 0068B4F7    push        0
 0068B4F9    xor         ecx,ecx
 0068B4FB    mov         dl,11
 0068B4FD    mov         eax,dword ptr [edi+28];TPressedExpression.HoldTime:TExpression
 0068B500    mov         ebx,dword ptr [eax]
 0068B502    call        dword ptr [ebx+10];TExpression.EvaluateUnits
 0068B505    fld         qword ptr [esp]
 0068B508    fsub        qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B50B    fcompp
 0068B50D    wait
 0068B50E    fnstsw      al
 0068B510    sahf
>0068B511    ja          0068B523
 0068B513    mov         al,1
 0068B515    call        00686074
 0068B51A    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B51D    wait
>0068B51E    jmp         0068B752
 0068B523    xor         eax,eax
 0068B525    call        00686074
 0068B52A    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B52D    wait
 0068B52E    xor         eax,eax
 0068B530    mov         dword ptr [edi+30],eax;TPressedExpression.ClickTime:Double
 0068B533    mov         dword ptr [edi+34],eax;TPressedExpression.?f34:dword
>0068B536    jmp         0068B752
 0068B53B    cmp         eax,6
>0068B53E    jne         0068B5B4
 0068B540    mov         eax,dword ptr [edi+20];TPressedExpression.expression:TExpression
 0068B543    mov         edx,dword ptr [eax]
 0068B545    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 0068B548    test        al,al
>0068B54A    je          0068B59C
 0068B54C    call        00682F08
 0068B551    fstp        qword ptr [esp]
 0068B554    wait
 0068B555    fld         qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B558    fcomp       dword ptr ds:[68B75C];0:Single
 0068B55E    wait
 0068B55F    fnstsw      al
 0068B561    sahf
>0068B562    jne         0068B571
 0068B564    mov         eax,dword ptr [esp]
 0068B567    mov         dword ptr [edi+30],eax;TPressedExpression.ClickTime:Double
 0068B56A    mov         eax,dword ptr [esp+4]
 0068B56E    mov         dword ptr [edi+34],eax;TPressedExpression.?f34:dword
 0068B571    push        0
 0068B573    xor         ecx,ecx
 0068B575    mov         dl,11
 0068B577    mov         eax,dword ptr [edi+28];TPressedExpression.HoldTime:TExpression
 0068B57A    mov         ebx,dword ptr [eax]
 0068B57C    call        dword ptr [ebx+10];TExpression.EvaluateUnits
 0068B57F    fld         qword ptr [esp]
 0068B582    fsub        qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B585    fcompp
 0068B587    wait
 0068B588    fnstsw      al
 0068B58A    sahf
 0068B58B    setae       al
 0068B58E    call        00686074
 0068B593    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B596    wait
>0068B597    jmp         0068B752
 0068B59C    xor         eax,eax
 0068B59E    call        00686074
 0068B5A3    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B5A6    wait
 0068B5A7    xor         eax,eax
 0068B5A9    mov         dword ptr [edi+30],eax;TPressedExpression.ClickTime:Double
 0068B5AC    mov         dword ptr [edi+34],eax;TPressedExpression.?f34:dword
>0068B5AF    jmp         0068B752
 0068B5B4    cmp         eax,5
>0068B5B7    jne         0068B681
 0068B5BD    mov         eax,dword ptr [edi+20];TPressedExpression.expression:TExpression
 0068B5C0    mov         edx,dword ptr [eax]
 0068B5C2    call        dword ptr [edx+78];TExpression.Pressed
 0068B5C5    test        al,al
>0068B5C7    je          0068B636
 0068B5C9    fld         qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B5CC    fcomp       dword ptr ds:[68B75C];0:Single
 0068B5D2    wait
 0068B5D3    fnstsw      al
 0068B5D5    sahf
>0068B5D6    jne         0068B5F1
 0068B5D8    call        00682F08
 0068B5DD    fstp        qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B5E0    wait
 0068B5E1    xor         eax,eax
 0068B5E3    call        00686074
 0068B5E8    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B5EB    wait
>0068B5EC    jmp         0068B752
 0068B5F1    call        00682F08
 0068B5F6    fsub        qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B5F9    fcomp       qword ptr ds:[81ECF0];gvar_0081ECF0:Double
 0068B5FF    wait
 0068B600    fnstsw      al
 0068B602    sahf
>0068B603    jae         0068B61D
 0068B605    xor         eax,eax
 0068B607    call        00686074
 0068B60C    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B60F    wait
 0068B610    xor         eax,eax
 0068B612    mov         dword ptr [edi+30],eax;TPressedExpression.ClickTime:Double
 0068B615    mov         dword ptr [edi+34],eax;TPressedExpression.?f34:dword
>0068B618    jmp         0068B752
 0068B61D    xor         eax,eax
 0068B61F    call        00686074
 0068B624    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B627    wait
 0068B628    call        00682F08
 0068B62D    fstp        qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B630    wait
>0068B631    jmp         0068B752
 0068B636    fld         qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B639    fcomp       dword ptr ds:[68B75C];0:Single
 0068B63F    wait
 0068B640    fnstsw      al
 0068B642    sahf
>0068B643    je          0068B671
 0068B645    call        00682F08
 0068B64A    fsub        qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B64D    fcomp       qword ptr ds:[81ECF0];gvar_0081ECF0:Double
 0068B653    wait
 0068B654    fnstsw      al
 0068B656    sahf
>0068B657    jb          0068B671
 0068B659    mov         al,1
 0068B65B    call        00686074
 0068B660    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B663    wait
 0068B664    xor         eax,eax
 0068B666    mov         dword ptr [edi+30],eax;TPressedExpression.ClickTime:Double
 0068B669    mov         dword ptr [edi+34],eax;TPressedExpression.?f34:dword
>0068B66C    jmp         0068B752
 0068B671    xor         eax,eax
 0068B673    call        00686074
 0068B678    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B67B    wait
>0068B67C    jmp         0068B752
 0068B681    cmp         eax,4
>0068B684    jne         0068B70A
 0068B68A    mov         eax,dword ptr [edi+20];TPressedExpression.expression:TExpression
 0068B68D    mov         edx,dword ptr [eax]
 0068B68F    call        dword ptr [edx+78];TExpression.Pressed
 0068B692    test        al,al
>0068B694    je          0068B6FD
 0068B696    fld         qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B699    fcomp       dword ptr ds:[68B75C];0:Single
 0068B69F    wait
 0068B6A0    fnstsw      al
 0068B6A2    sahf
>0068B6A3    je          0068B6E7
 0068B6A5    call        00682F08
 0068B6AA    fsub        qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B6AD    fcomp       qword ptr ds:[81ECF0];gvar_0081ECF0:Double
 0068B6B3    wait
 0068B6B4    fnstsw      al
 0068B6B6    sahf
>0068B6B7    jae         0068B6D1
 0068B6B9    mov         al,1
 0068B6BB    call        00686074
 0068B6C0    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B6C3    wait
 0068B6C4    xor         eax,eax
 0068B6C6    mov         dword ptr [edi+30],eax;TPressedExpression.ClickTime:Double
 0068B6C9    mov         dword ptr [edi+34],eax;TPressedExpression.?f34:dword
>0068B6CC    jmp         0068B752
 0068B6D1    xor         eax,eax
 0068B6D3    call        00686074
 0068B6D8    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B6DB    wait
 0068B6DC    call        00682F08
 0068B6E1    fstp        qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B6E4    wait
>0068B6E5    jmp         0068B752
 0068B6E7    call        00682F08
 0068B6EC    fstp        qword ptr [edi+30];TPressedExpression.ClickTime:Double
 0068B6EF    wait
 0068B6F0    xor         eax,eax
 0068B6F2    call        00686074
 0068B6F7    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B6FA    wait
>0068B6FB    jmp         0068B752
 0068B6FD    xor         eax,eax
 0068B6FF    call        00686074
 0068B704    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B707    wait
>0068B708    jmp         0068B752
 0068B70A    cmp         eax,2
>0068B70D    jne         0068B722
 0068B70F    mov         eax,dword ptr [edi+20];TPressedExpression.expression:TExpression
 0068B712    mov         edx,dword ptr [eax]
 0068B714    call        dword ptr [edx+7C];TExpression.Released
 0068B717    call        00686074
 0068B71C    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B71F    wait
>0068B720    jmp         0068B752
 0068B722    dec         eax
>0068B723    jne         0068B738
 0068B725    mov         eax,dword ptr [edi+20];TPressedExpression.expression:TExpression
 0068B728    mov         edx,dword ptr [eax]
 0068B72A    call        dword ptr [edx+78];TExpression.Pressed
 0068B72D    call        00686074
 0068B732    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B735    wait
>0068B736    jmp         0068B752
 0068B738    mov         eax,dword ptr [edi+20];TPressedExpression.expression:TExpression
 0068B73B    mov         edx,dword ptr [eax]
 0068B73D    call        dword ptr [edx+7C];TExpression.Released
 0068B740    mov         byte ptr [esp+10],al
 0068B744    movzx       eax,byte ptr [esp+10]
 0068B749    call        00686074
 0068B74E    fstp        qword ptr [edi+8];TPressedExpression.PreviousValue:Double
 0068B751    wait
 0068B752    mov         dword ptr [edi+18],esi;TPressedExpression.....................FrameLastUpdated:Cardinal
 0068B755    add         esp,14
 0068B758    pop         edi
 0068B759    pop         esi
 0068B75A    pop         ebx
 0068B75B    ret
*}
end;

//0068B760
procedure TSmoothExpression.CreateClone;
begin
{*
 0068B760    mov         dl,1
 0068B762    mov         eax,[0067F6F8];TSmoothExpression
 0068B767    call        TObject.Create;TSmoothExpression.Create
 0068B76C    ret
*}
end;

//0068B770
destructor TSmoothExpression.Destroy();
begin
{*
 0068B770    push        ebx
 0068B771    push        esi
 0068B772    call        @BeforeDestruction
 0068B777    mov         ebx,edx
 0068B779    mov         esi,eax
 0068B77B    lea         eax,[esi+20];TSmoothExpression.expression:TExpression
 0068B77E    mov         edx,dword ptr [eax]
 0068B780    xor         ecx,ecx
 0068B782    mov         dword ptr [eax],ecx
 0068B784    mov         eax,edx
 0068B786    call        TObject.Free
 0068B78B    lea         eax,[esi+2C];TSmoothExpression.Deadband:TExpression
 0068B78E    mov         edx,dword ptr [eax]
 0068B790    xor         ecx,ecx
 0068B792    mov         dword ptr [eax],ecx
 0068B794    mov         eax,edx
 0068B796    call        TObject.Free
 0068B79B    mov         edx,ebx
 0068B79D    and         dl,0FC
 0068B7A0    mov         eax,esi
 0068B7A2    call        TObject.Destroy
 0068B7A7    test        bl,bl
>0068B7A9    jle         0068B7B2
 0068B7AB    mov         eax,esi
 0068B7AD    call        @ClassDestroy
 0068B7B2    pop         esi
 0068B7B3    pop         ebx
 0068B7B4    ret
*}
end;

//0068B7B8
procedure TSmoothExpression.FillClone(c:TExpression);
begin
{*
 0068B7B8    push        ebx
 0068B7B9    push        esi
 0068B7BA    push        edi
 0068B7BB    mov         esi,edx
 0068B7BD    mov         ebx,eax
 0068B7BF    mov         edx,esi
 0068B7C1    mov         eax,ebx
 0068B7C3    call        TUpdatingExpression.FillClone
 0068B7C8    mov         eax,dword ptr [ebx+20];TSmoothExpression.expression:TExpression
 0068B7CB    call        TExpression.Clone
 0068B7D0    mov         edi,esi
 0068B7D2    mov         dword ptr [edi+20],eax
 0068B7D5    mov         eax,dword ptr [ebx+24];TSmoothExpression.Item:Integer
 0068B7D8    mov         dword ptr [edi+24],eax
 0068B7DB    mov         eax,dword ptr [ebx+28];TSmoothExpression.Frames:Integer
 0068B7DE    mov         dword ptr [edi+28],eax
 0068B7E1    mov         eax,dword ptr [ebx+2C];TSmoothExpression.Deadband:TExpression
 0068B7E4    mov         dword ptr [edi+2C],eax
 0068B7E7    push        esi
 0068B7E8    push        edi
 0068B7E9    add         edi,30
 0068B7EC    lea         esi,[ebx+30];TSmoothExpression.OldValues:?
 0068B7EF    mov         ecx,7A
 0068B7F4    rep movs    dword ptr [edi],dword ptr [esi]
 0068B7F6    pop         edi
 0068B7F7    pop         esi
 0068B7F8    push        esi
 0068B7F9    push        edi
 0068B7FA    add         edi,218
 0068B800    lea         esi,[ebx+218];TSmoothExpression.OldVectors:?
 0068B806    mov         ecx,16E
 0068B80B    rep movs    dword ptr [edi],dword ptr [esi]
 0068B80D    pop         edi
 0068B80E    pop         esi
 0068B80F    mov         eax,dword ptr [ebx+7D0];TSmoothExpression.index:Integer
 0068B815    mov         dword ptr [edi+7D0],eax
 0068B81B    pop         edi
 0068B81C    pop         esi
 0068B81D    pop         ebx
 0068B81E    ret
*}
end;

//0068B820
function TSmoothExpression.GetDataType:TDataType;
begin
{*
 0068B820    mov         eax,dword ptr [eax+20];TSmoothExpression.expression:TExpression
 0068B823    mov         edx,dword ptr [eax]
 0068B825    call        dword ptr [edx+44];TExpression.GetDataType
 0068B828    sub         al,5
>0068B82A    je          0068B832
 0068B82C    dec         al
>0068B82E    je          0068B835
>0068B830    jmp         0068B838
 0068B832    mov         al,5
 0068B834    ret
 0068B835    mov         al,6
 0068B837    ret
 0068B838    xor         eax,eax
 0068B83A    ret
*}
end;

//0068B83C
{*procedure sub_0068B83C(?:?; ?:?);
begin
 0068B83C    push        ebx
 0068B83D    add         esp,0FFFFFFF8
 0068B840    mov         ebx,edx
 0068B842    mov         ecx,eax
 0068B844    mov         eax,dword ptr [ecx+0F8]
 0068B84A    add         eax,ebx
 0068B84C    add         eax,1F
 0068B84F    mov         ebx,1F
 0068B854    cdq
 0068B855    idiv        eax,ebx
 0068B857    mov         eax,edx
 0068B859    mov         edx,dword ptr [ecx+eax*8]
 0068B85C    mov         dword ptr [esp],edx
 0068B85F    mov         edx,dword ptr [ecx+eax*8+4]
 0068B863    mov         dword ptr [esp+4],edx
 0068B867    fld         qword ptr [esp]
 0068B86A    pop         ecx
 0068B86B    pop         edx
 0068B86C    pop         ebx
 0068B86D    ret
end;*}

//0068B870
procedure TSmoothExpression.GetFrame(frame:Integer);
begin
{*
 0068B870    push        ebx
 0068B871    add         esp,0FFFFFFF8
 0068B874    mov         ebx,edx
 0068B876    mov         ecx,eax
 0068B878    mov         eax,dword ptr [ecx+7D0];TSmoothExpression.index:Integer
 0068B87E    add         eax,ebx
 0068B880    add         eax,3C
 0068B883    sub         eax,0
 0068B886    inc         eax
 0068B887    mov         ebx,3D
 0068B88C    cdq
 0068B88D    idiv        eax,ebx
 0068B88F    mov         eax,edx
 0068B891    mov         edx,dword ptr [ecx+eax*8+30]
 0068B895    mov         dword ptr [esp],edx
 0068B898    mov         edx,dword ptr [ecx+eax*8+34]
 0068B89C    mov         dword ptr [esp+4],edx
 0068B8A0    fld         qword ptr [esp]
 0068B8A3    pop         ecx
 0068B8A4    pop         edx
 0068B8A5    pop         ebx
 0068B8A6    ret
*}
end;

//0068B8A8
procedure TSmoothExpression.GetFrameVector(frame:Integer; x:Double; z:Double; y:Double);
begin
{*
 0068B8A8    push        ebp
 0068B8A9    mov         ebp,esp
 0068B8AB    push        ecx
 0068B8AC    push        ebx
 0068B8AD    push        esi
 0068B8AE    mov         dword ptr [ebp-4],ecx
 0068B8B1    mov         ecx,edx
 0068B8B3    mov         ebx,eax
 0068B8B5    mov         eax,dword ptr [ebx+7D0];TSmoothExpression.index:Integer
 0068B8BB    add         eax,ecx
 0068B8BD    add         eax,3D
 0068B8C0    mov         ecx,3D
 0068B8C5    cdq
 0068B8C6    idiv        eax,ecx
 0068B8C8    mov         eax,edx
 0068B8CA    mov         ecx,dword ptr [ebp-4]
 0068B8CD    lea         edx,[eax+eax*2]
 0068B8D0    mov         esi,dword ptr [ebx+edx*8+218]
 0068B8D7    mov         dword ptr [ecx],esi
 0068B8D9    mov         esi,dword ptr [ebx+edx*8+21C]
 0068B8E0    mov         dword ptr [ecx+4],esi
 0068B8E3    mov         ecx,dword ptr [ebp+0C]
 0068B8E6    mov         esi,dword ptr [ebx+edx*8+220]
 0068B8ED    mov         dword ptr [ecx],esi
 0068B8EF    mov         esi,dword ptr [ebx+edx*8+224]
 0068B8F6    mov         dword ptr [ecx+4],esi
 0068B8F9    mov         ecx,dword ptr [ebp+8]
 0068B8FC    mov         eax,dword ptr [ebx+edx*8+228]
 0068B903    mov         dword ptr [ecx],eax
 0068B905    mov         eax,dword ptr [ebx+edx*8+22C]
 0068B90C    mov         dword ptr [ecx+4],eax
 0068B90F    pop         esi
 0068B910    pop         ebx
 0068B911    pop         ecx
 0068B912    pop         ebp
 0068B913    ret         8
*}
end;

//0068B918
procedure TSmoothExpression.GetPerUnits1;
begin
{*
 0068B918    mov         eax,dword ptr [eax+20];TSmoothExpression.expression:TExpression
 0068B91B    mov         edx,dword ptr [eax]
 0068B91D    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 0068B920    ret
*}
end;

//0068B924
procedure TSmoothExpression.GetPerUnits2;
begin
{*
 0068B924    mov         eax,dword ptr [eax+20];TSmoothExpression.expression:TExpression
 0068B927    mov         edx,dword ptr [eax]
 0068B929    call        dword ptr [edx+50];TExpression.GetPerUnits2
 0068B92C    ret
*}
end;

//0068B930
procedure TSmoothExpression.GetRotMat(m:TRotMat);
begin
{*
 0068B930    push        ebx
 0068B931    push        esi
 0068B932    mov         esi,edx
 0068B934    mov         ebx,eax
 0068B936    mov         eax,ebx
 0068B938    mov         edx,dword ptr [eax]
 0068B93A    call        dword ptr [edx+44];TSmoothExpression.GetDataType
 0068B93D    cmp         al,6
>0068B93F    je          0068B94D
 0068B941    mov         edx,esi
 0068B943    mov         eax,ebx
 0068B945    call        TExpression.GetRotMat
 0068B94A    pop         esi
 0068B94B    pop         ebx
 0068B94C    ret
 0068B94D    mov         edx,esi
 0068B94F    mov         eax,dword ptr [ebx+20];TSmoothExpression.expression:TExpression
 0068B952    mov         ecx,dword ptr [eax]
 0068B954    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068B957    pop         esi
 0068B958    pop         ebx
 0068B959    ret
*}
end;

//0068B95C
procedure TSmoothExpression.GetUnits;
begin
{*
 0068B95C    mov         eax,dword ptr [eax+20];TSmoothExpression.expression:TExpression
 0068B95F    mov         edx,dword ptr [eax]
 0068B961    call        dword ptr [edx+48];TExpression.GetUnits
 0068B964    ret
*}
end;

//0068B968
{*function sub_0068B968(?:?):?;
begin
 0068B968    push        ebx
 0068B969    push        esi
 0068B96A    push        edi
 0068B96B    add         esp,0FFFFFFEC
 0068B96E    mov         edi,eax
 0068B970    xor         eax,eax
 0068B972    mov         dword ptr [esp+8],eax
 0068B976    mov         dword ptr [esp+0C],eax
 0068B97A    mov         ebx,dword ptr [edi+100]
 0068B980    dec         ebx
 0068B981    test        ebx,ebx
>0068B983    jl          0068B9A0
 0068B985    inc         ebx
 0068B986    xor         esi,esi
 0068B988    mov         edx,esi
 0068B98A    neg         edx
 0068B98C    mov         eax,edi
 0068B98E    call        0068B83C
 0068B993    fadd        qword ptr [esp+8]
 0068B997    fstp        qword ptr [esp+8]
 0068B99B    wait
 0068B99C    inc         esi
 0068B99D    dec         ebx
>0068B99E    jne         0068B988
 0068B9A0    mov         eax,dword ptr [edi+100]
 0068B9A6    test        eax,eax
>0068B9A8    jne         0068B9B5
 0068B9AA    xor         eax,eax
 0068B9AC    mov         dword ptr [esp],eax
 0068B9AF    mov         dword ptr [esp+4],eax
>0068B9B3    jmp         0068B9C5
 0068B9B5    mov         dword ptr [esp+10],eax
 0068B9B9    fild        dword ptr [esp+10]
 0068B9BD    fdivr       qword ptr [esp+8]
 0068B9C1    fstp        qword ptr [esp]
 0068B9C4    wait
 0068B9C5    fld         qword ptr [esp]
 0068B9C8    add         esp,14
 0068B9CB    pop         edi
 0068B9CC    pop         esi
 0068B9CD    pop         ebx
 0068B9CE    ret
end;*}

//0068B9D0
procedure TSmoothExpression.GetValue;
begin
{*
 0068B9D0    push        ebx
 0068B9D1    push        esi
 0068B9D2    push        edi
 0068B9D3    add         esp,0FFFFFFDC
 0068B9D6    mov         ebx,eax
 0068B9D8    mov         edx,dword ptr ds:[78BDC0];0x0 gvar_0078BDC0
 0068B9DE    mov         eax,ebx
 0068B9E0    mov         ecx,dword ptr [eax]
 0068B9E2    call        dword ptr [ecx+98];TSmoothExpression.Update
 0068B9E8    xor         eax,eax
 0068B9EA    mov         dword ptr [esp+8],eax
 0068B9EE    mov         dword ptr [esp+0C],eax
 0068B9F2    mov         esi,dword ptr [ebx+28];TSmoothExpression.Frames:Integer
 0068B9F5    test        esi,esi
>0068B9F7    jl          0068BA14
 0068B9F9    inc         esi
 0068B9FA    xor         edi,edi
 0068B9FC    mov         edx,edi
 0068B9FE    neg         edx
 0068BA00    mov         eax,ebx
 0068BA02    call        TSmoothExpression.GetFrame
 0068BA07    fadd        qword ptr [esp+8]
 0068BA0B    fstp        qword ptr [esp+8]
 0068BA0F    wait
 0068BA10    inc         edi
 0068BA11    dec         esi
>0068BA12    jne         0068B9FC
 0068BA14    mov         eax,dword ptr [ebx+28];TSmoothExpression.Frames:Integer
 0068BA17    inc         eax
 0068BA18    mov         dword ptr [esp+20],eax
 0068BA1C    fild        dword ptr [esp+20]
 0068BA20    fdivr       qword ptr [esp+8]
 0068BA24    fstp        qword ptr [esp]
 0068BA27    wait
 0068BA28    mov         eax,dword ptr [ebx+2C];TSmoothExpression.Deadband:TExpression
 0068BA2B    test        eax,eax
>0068BA2D    je          0068BAD5
 0068BA33    mov         edx,dword ptr [ebx+20];TSmoothExpression.expression:TExpression
 0068BA36    mov         ecx,dword ptr [eax]
 0068BA38    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 0068BA3B    fstp        qword ptr [esp+10]
 0068BA3F    wait
 0068BA40    fld         qword ptr [esp]
 0068BA43    add         esp,0FFFFFFF4
 0068BA46    fstp        tbyte ptr [esp]
 0068BA49    wait
 0068BA4A    fld         qword ptr [esp+1C]
 0068BA4E    add         esp,0FFFFFFF4
 0068BA51    fstp        tbyte ptr [esp]
 0068BA54    wait
 0068BA55    call        0068AEA0
 0068BA5A    fstp        qword ptr [esp+18]
 0068BA5E    wait
 0068BA5F    fld         qword ptr [esp+18]
 0068BA63    fcomp       dword ptr ds:[68BAE0];0:Single
 0068BA69    wait
 0068BA6A    fnstsw      al
 0068BA6C    sahf
>0068BA6D    jae         0068BAA5
 0068BA6F    fld         qword ptr [esp+10]
 0068BA73    fchs
 0068BA75    fdiv        dword ptr ds:[68BAE4];2:Single
 0068BA7B    fcomp       qword ptr [esp+18]
 0068BA7F    wait
 0068BA80    fnstsw      al
 0068BA82    sahf
>0068BA83    jb          0068BA98
 0068BA85    fld         qword ptr [esp+18]
 0068BA89    fabs
 0068BA8B    fsubr       qword ptr [esp+10]
 0068BA8F    fsubr       qword ptr [esp]
 0068BA92    fstp        qword ptr [esp]
 0068BA95    wait
>0068BA96    jmp         0068BAD5
 0068BA98    fld         qword ptr [esp]
 0068BA9B    fsub        qword ptr [esp+18]
 0068BA9F    fstp        qword ptr [esp]
 0068BAA2    wait
>0068BAA3    jmp         0068BAD5
 0068BAA5    fld         qword ptr [esp+10]
 0068BAA9    fdiv        dword ptr ds:[68BAE4];2:Single
 0068BAAF    fcomp       qword ptr [esp+18]
 0068BAB3    wait
 0068BAB4    fnstsw      al
 0068BAB6    sahf
>0068BAB7    ja          0068BACA
 0068BAB9    fld         qword ptr [esp+10]
 0068BABD    fsub        qword ptr [esp+18]
 0068BAC1    fadd        qword ptr [esp]
 0068BAC4    fstp        qword ptr [esp]
 0068BAC7    wait
>0068BAC8    jmp         0068BAD5
 0068BACA    fld         qword ptr [esp]
 0068BACD    fsub        qword ptr [esp+18]
 0068BAD1    fstp        qword ptr [esp]
 0068BAD4    wait
 0068BAD5    fld         qword ptr [esp]
 0068BAD8    add         esp,24
 0068BADB    pop         edi
 0068BADC    pop         esi
 0068BADD    pop         ebx
 0068BADE    ret
*}
end;

//0068BAE8
procedure TSmoothExpression.GetVector(x:Double; y:Double; z:Double);
begin
{*
 0068BAE8    push        ebp
 0068BAE9    mov         ebp,esp
 0068BAEB    add         esp,0FFFFFFB4
 0068BAEE    push        ebx
 0068BAEF    push        esi
 0068BAF0    push        edi
 0068BAF1    mov         dword ptr [ebp-8],ecx
 0068BAF4    mov         dword ptr [ebp-4],edx
 0068BAF7    mov         ebx,eax
 0068BAF9    mov         edx,dword ptr ds:[78BDC0];0x0 gvar_0078BDC0
 0068BAFF    mov         eax,ebx
 0068BB01    mov         ecx,dword ptr [eax]
 0068BB03    call        dword ptr [ecx+98];TSmoothExpression.Update
 0068BB09    xor         eax,eax
 0068BB0B    mov         dword ptr [ebp-10],eax
 0068BB0E    mov         dword ptr [ebp-0C],eax
 0068BB11    xor         eax,eax
 0068BB13    mov         dword ptr [ebp-18],eax
 0068BB16    mov         dword ptr [ebp-14],eax
 0068BB19    xor         eax,eax
 0068BB1B    mov         dword ptr [ebp-20],eax
 0068BB1E    mov         dword ptr [ebp-1C],eax
 0068BB21    mov         esi,dword ptr [ebx+28];TSmoothExpression.Frames:Integer
 0068BB24    test        esi,esi
>0068BB26    jl          0068BB63
 0068BB28    inc         esi
 0068BB29    xor         edi,edi
 0068BB2B    lea         eax,[ebp-30]
 0068BB2E    push        eax
 0068BB2F    lea         eax,[ebp-38]
 0068BB32    push        eax
 0068BB33    lea         ecx,[ebp-28]
 0068BB36    mov         edx,edi
 0068BB38    neg         edx
 0068BB3A    mov         eax,ebx
 0068BB3C    call        TSmoothExpression.GetFrameVector
 0068BB41    fld         qword ptr [ebp-10]
 0068BB44    fadd        qword ptr [ebp-28]
 0068BB47    fstp        qword ptr [ebp-10]
 0068BB4A    wait
 0068BB4B    fld         qword ptr [ebp-18]
 0068BB4E    fadd        qword ptr [ebp-30]
 0068BB51    fstp        qword ptr [ebp-18]
 0068BB54    wait
 0068BB55    fld         qword ptr [ebp-20]
 0068BB58    fadd        qword ptr [ebp-38]
 0068BB5B    fstp        qword ptr [ebp-20]
 0068BB5E    wait
 0068BB5F    inc         edi
 0068BB60    dec         esi
>0068BB61    jne         0068BB2B
 0068BB63    mov         eax,dword ptr [ebx+28];TSmoothExpression.Frames:Integer
 0068BB66    inc         eax
 0068BB67    mov         dword ptr [ebp-4C],eax
 0068BB6A    fild        dword ptr [ebp-4C]
 0068BB6D    fdivr       qword ptr [ebp-10]
 0068BB70    mov         eax,dword ptr [ebp-4]
 0068BB73    fstp        qword ptr [eax]
 0068BB75    wait
 0068BB76    mov         eax,dword ptr [ebx+28];TSmoothExpression.Frames:Integer
 0068BB79    inc         eax
 0068BB7A    mov         dword ptr [ebp-4C],eax
 0068BB7D    fild        dword ptr [ebp-4C]
 0068BB80    fdivr       qword ptr [ebp-18]
 0068BB83    mov         eax,dword ptr [ebp-8]
 0068BB86    fstp        qword ptr [eax]
 0068BB88    wait
 0068BB89    mov         eax,dword ptr [ebx+28];TSmoothExpression.Frames:Integer
 0068BB8C    inc         eax
 0068BB8D    mov         dword ptr [ebp-4C],eax
 0068BB90    fild        dword ptr [ebp-4C]
 0068BB93    fdivr       qword ptr [ebp-20]
 0068BB96    mov         eax,dword ptr [ebp+8]
 0068BB99    fstp        qword ptr [eax]
 0068BB9B    wait
 0068BB9C    mov         eax,dword ptr [ebx+2C];TSmoothExpression.Deadband:TExpression
 0068BB9F    test        eax,eax
>0068BBA1    je          0068BD81
 0068BBA7    mov         edx,dword ptr [ebx+20];TSmoothExpression.expression:TExpression
 0068BBAA    mov         ecx,dword ptr [eax]
 0068BBAC    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 0068BBAF    fstp        qword ptr [ebp-40]
 0068BBB2    wait
 0068BBB3    mov         eax,dword ptr [ebp-4]
 0068BBB6    fld         qword ptr [eax]
 0068BBB8    add         esp,0FFFFFFF4
 0068BBBB    fstp        tbyte ptr [esp]
 0068BBBE    wait
 0068BBBF    fld         qword ptr [ebp-40]
 0068BBC2    add         esp,0FFFFFFF4
 0068BBC5    fstp        tbyte ptr [esp]
 0068BBC8    wait
 0068BBC9    call        0068AEA0
 0068BBCE    fstp        qword ptr [ebp-48]
 0068BBD1    wait
 0068BBD2    fld         qword ptr [ebp-48]
 0068BBD5    fcomp       dword ptr ds:[68BD8C];0:Single
 0068BBDB    wait
 0068BBDC    fnstsw      al
 0068BBDE    sahf
>0068BBDF    jae         0068BC1A
 0068BBE1    fld         qword ptr [ebp-40]
 0068BBE4    fchs
 0068BBE6    fdiv        dword ptr ds:[68BD90];2:Single
 0068BBEC    fcomp       qword ptr [ebp-48]
 0068BBEF    wait
 0068BBF0    fnstsw      al
 0068BBF2    sahf
>0068BBF3    jb          0068BC0A
 0068BBF5    fld         qword ptr [ebp-48]
 0068BBF8    fabs
 0068BBFA    fsubr       qword ptr [ebp-40]
 0068BBFD    mov         eax,dword ptr [ebp-4]
 0068BC00    fsubr       qword ptr [eax]
 0068BC02    mov         eax,dword ptr [ebp-4]
 0068BC05    fstp        qword ptr [eax]
 0068BC07    wait
>0068BC08    jmp         0068BC4D
 0068BC0A    mov         eax,dword ptr [ebp-4]
 0068BC0D    fld         qword ptr [eax]
 0068BC0F    fsub        qword ptr [ebp-48]
 0068BC12    mov         eax,dword ptr [ebp-4]
 0068BC15    fstp        qword ptr [eax]
 0068BC17    wait
>0068BC18    jmp         0068BC4D
 0068BC1A    fld         qword ptr [ebp-40]
 0068BC1D    fdiv        dword ptr ds:[68BD90];2:Single
 0068BC23    fcomp       qword ptr [ebp-48]
 0068BC26    wait
 0068BC27    fnstsw      al
 0068BC29    sahf
>0068BC2A    ja          0068BC3F
 0068BC2C    fld         qword ptr [ebp-40]
 0068BC2F    fsub        qword ptr [ebp-48]
 0068BC32    mov         eax,dword ptr [ebp-4]
 0068BC35    fadd        qword ptr [eax]
 0068BC37    mov         eax,dword ptr [ebp-4]
 0068BC3A    fstp        qword ptr [eax]
 0068BC3C    wait
>0068BC3D    jmp         0068BC4D
 0068BC3F    mov         eax,dword ptr [ebp-4]
 0068BC42    fld         qword ptr [eax]
 0068BC44    fsub        qword ptr [ebp-48]
 0068BC47    mov         eax,dword ptr [ebp-4]
 0068BC4A    fstp        qword ptr [eax]
 0068BC4C    wait
 0068BC4D    mov         eax,dword ptr [ebp-8]
 0068BC50    fld         qword ptr [eax]
 0068BC52    add         esp,0FFFFFFF4
 0068BC55    fstp        tbyte ptr [esp]
 0068BC58    wait
 0068BC59    fld         qword ptr [ebp-40]
 0068BC5C    add         esp,0FFFFFFF4
 0068BC5F    fstp        tbyte ptr [esp]
 0068BC62    wait
 0068BC63    call        0068AEA0
 0068BC68    fstp        qword ptr [ebp-48]
 0068BC6B    wait
 0068BC6C    fld         qword ptr [ebp-48]
 0068BC6F    fcomp       dword ptr ds:[68BD8C];0:Single
 0068BC75    wait
 0068BC76    fnstsw      al
 0068BC78    sahf
>0068BC79    jae         0068BCB4
 0068BC7B    fld         qword ptr [ebp-40]
 0068BC7E    fchs
 0068BC80    fdiv        dword ptr ds:[68BD90];2:Single
 0068BC86    fcomp       qword ptr [ebp-48]
 0068BC89    wait
 0068BC8A    fnstsw      al
 0068BC8C    sahf
>0068BC8D    jb          0068BCA4
 0068BC8F    fld         qword ptr [ebp-48]
 0068BC92    fabs
 0068BC94    fsubr       qword ptr [ebp-40]
 0068BC97    mov         eax,dword ptr [ebp-8]
 0068BC9A    fsubr       qword ptr [eax]
 0068BC9C    mov         eax,dword ptr [ebp-8]
 0068BC9F    fstp        qword ptr [eax]
 0068BCA1    wait
>0068BCA2    jmp         0068BCE7
 0068BCA4    mov         eax,dword ptr [ebp-8]
 0068BCA7    fld         qword ptr [eax]
 0068BCA9    fsub        qword ptr [ebp-48]
 0068BCAC    mov         eax,dword ptr [ebp-8]
 0068BCAF    fstp        qword ptr [eax]
 0068BCB1    wait
>0068BCB2    jmp         0068BCE7
 0068BCB4    fld         qword ptr [ebp-40]
 0068BCB7    fdiv        dword ptr ds:[68BD90];2:Single
 0068BCBD    fcomp       qword ptr [ebp-48]
 0068BCC0    wait
 0068BCC1    fnstsw      al
 0068BCC3    sahf
>0068BCC4    ja          0068BCD9
 0068BCC6    fld         qword ptr [ebp-40]
 0068BCC9    fsub        qword ptr [ebp-48]
 0068BCCC    mov         eax,dword ptr [ebp-8]
 0068BCCF    fadd        qword ptr [eax]
 0068BCD1    mov         eax,dword ptr [ebp-8]
 0068BCD4    fstp        qword ptr [eax]
 0068BCD6    wait
>0068BCD7    jmp         0068BCE7
 0068BCD9    mov         eax,dword ptr [ebp-8]
 0068BCDC    fld         qword ptr [eax]
 0068BCDE    fsub        qword ptr [ebp-48]
 0068BCE1    mov         eax,dword ptr [ebp-8]
 0068BCE4    fstp        qword ptr [eax]
 0068BCE6    wait
 0068BCE7    mov         eax,dword ptr [ebp+8]
 0068BCEA    fld         qword ptr [eax]
 0068BCEC    add         esp,0FFFFFFF4
 0068BCEF    fstp        tbyte ptr [esp]
 0068BCF2    wait
 0068BCF3    fld         qword ptr [ebp-40]
 0068BCF6    add         esp,0FFFFFFF4
 0068BCF9    fstp        tbyte ptr [esp]
 0068BCFC    wait
 0068BCFD    call        0068AEA0
 0068BD02    fstp        qword ptr [ebp-48]
 0068BD05    wait
 0068BD06    fld         qword ptr [ebp-48]
 0068BD09    fcomp       dword ptr ds:[68BD8C];0:Single
 0068BD0F    wait
 0068BD10    fnstsw      al
 0068BD12    sahf
>0068BD13    jae         0068BD4E
 0068BD15    fld         qword ptr [ebp-40]
 0068BD18    fchs
 0068BD1A    fdiv        dword ptr ds:[68BD90];2:Single
 0068BD20    fcomp       qword ptr [ebp-48]
 0068BD23    wait
 0068BD24    fnstsw      al
 0068BD26    sahf
>0068BD27    jb          0068BD3E
 0068BD29    fld         qword ptr [ebp-48]
 0068BD2C    fabs
 0068BD2E    fsubr       qword ptr [ebp-40]
 0068BD31    mov         eax,dword ptr [ebp+8]
 0068BD34    fsubr       qword ptr [eax]
 0068BD36    mov         eax,dword ptr [ebp+8]
 0068BD39    fstp        qword ptr [eax]
 0068BD3B    wait
>0068BD3C    jmp         0068BD81
 0068BD3E    mov         eax,dword ptr [ebp+8]
 0068BD41    fld         qword ptr [eax]
 0068BD43    fsub        qword ptr [ebp-48]
 0068BD46    mov         eax,dword ptr [ebp+8]
 0068BD49    fstp        qword ptr [eax]
 0068BD4B    wait
>0068BD4C    jmp         0068BD81
 0068BD4E    fld         qword ptr [ebp-40]
 0068BD51    fdiv        dword ptr ds:[68BD90];2:Single
 0068BD57    fcomp       qword ptr [ebp-48]
 0068BD5A    wait
 0068BD5B    fnstsw      al
 0068BD5D    sahf
>0068BD5E    ja          0068BD73
 0068BD60    fld         qword ptr [ebp-40]
 0068BD63    fsub        qword ptr [ebp-48]
 0068BD66    mov         eax,dword ptr [ebp+8]
 0068BD69    fadd        qword ptr [eax]
 0068BD6B    mov         eax,dword ptr [ebp+8]
 0068BD6E    fstp        qword ptr [eax]
 0068BD70    wait
>0068BD71    jmp         0068BD81
 0068BD73    mov         eax,dword ptr [ebp+8]
 0068BD76    fld         qword ptr [eax]
 0068BD78    fsub        qword ptr [ebp-48]
 0068BD7B    mov         eax,dword ptr [ebp+8]
 0068BD7E    fstp        qword ptr [eax]
 0068BD80    wait
 0068BD81    pop         edi
 0068BD82    pop         esi
 0068BD83    pop         ebx
 0068BD84    mov         esp,ebp
 0068BD86    pop         ebp
 0068BD87    ret         4
*}
end;

//0068BD94
procedure TSmoothExpression.SetIffy(IsIffy:Boolean);
begin
{*
 0068BD94    push        ebx
 0068BD95    push        esi
 0068BD96    mov         ebx,edx
 0068BD98    mov         esi,eax
 0068BD9A    mov         edx,ebx
 0068BD9C    mov         eax,esi
 0068BD9E    call        TExpression.SetIffy
 0068BDA3    mov         edx,ebx
 0068BDA5    mov         eax,dword ptr [esi+20];TSmoothExpression.expression:TExpression
 0068BDA8    mov         ecx,dword ptr [eax]
 0068BDAA    call        dword ptr [ecx+74];TExpression.SetIffy
 0068BDAD    pop         esi
 0068BDAE    pop         ebx
 0068BDAF    ret
*}
end;

//0068BDB0
procedure TSmoothExpression.Swallow;
begin
{*
 0068BDB0    push        ebx
 0068BDB1    mov         ebx,eax
 0068BDB3    mov         eax,ebx
 0068BDB5    call        TExpression.Swallow
 0068BDBA    mov         eax,dword ptr [ebx+20];TSmoothExpression.expression:TExpression
 0068BDBD    mov         edx,dword ptr [eax]
 0068BDBF    call        dword ptr [edx+88];TExpression.Swallow
 0068BDC5    pop         ebx
 0068BDC6    ret
*}
end;

//0068BDC8
{*procedure TSmoothExpression.ToString(?:?);
begin
 0068BDC8    push        ebp
 0068BDC9    mov         ebp,esp
 0068BDCB    xor         ecx,ecx
 0068BDCD    push        ecx
 0068BDCE    push        ecx
 0068BDCF    push        ecx
 0068BDD0    push        ecx
 0068BDD1    push        ecx
 0068BDD2    push        ecx
 0068BDD3    push        ebx
 0068BDD4    push        esi
 0068BDD5    mov         esi,edx
 0068BDD7    mov         ebx,eax
 0068BDD9    xor         eax,eax
 0068BDDB    push        ebp
 0068BDDC    push        68BEB7
 0068BDE1    push        dword ptr fs:[eax]
 0068BDE4    mov         dword ptr fs:[eax],esp
 0068BDE7    cmp         dword ptr [ebx+2C],0;TSmoothExpression.Deadband:TExpression
>0068BDEB    je          0068BE39
 0068BDED    push        68BED0;'Smooth('
 0068BDF2    lea         edx,[ebp-4]
 0068BDF5    mov         eax,dword ptr [ebx+20];TSmoothExpression.expression:TExpression
 0068BDF8    mov         ecx,dword ptr [eax]
 0068BDFA    call        dword ptr [ecx-24];TExpression.ToString
 0068BDFD    push        dword ptr [ebp-4]
 0068BE00    push        68BEEC;', '
 0068BE05    lea         edx,[ebp-8]
 0068BE08    mov         eax,dword ptr [ebx+28];TSmoothExpression.Frames:Integer
 0068BE0B    call        IntToStr
 0068BE10    push        dword ptr [ebp-8]
 0068BE13    push        68BEEC;', '
 0068BE18    lea         edx,[ebp-0C]
 0068BE1B    mov         eax,dword ptr [ebx+2C];TSmoothExpression.Deadband:TExpression
 0068BE1E    mov         ecx,dword ptr [eax]
 0068BE20    call        dword ptr [ecx-24];TExpression.ToString
 0068BE23    push        dword ptr [ebp-0C]
 0068BE26    push        68BF00;')'
 0068BE2B    mov         eax,esi
 0068BE2D    mov         edx,7
 0068BE32    call        @UStrCatN
>0068BE37    jmp         0068BE9C
 0068BE39    cmp         dword ptr [ebx+28],0A;TSmoothExpression.Frames:Integer
>0068BE3D    je          0068BE78
 0068BE3F    push        68BED0;'Smooth('
 0068BE44    lea         edx,[ebp-10]
 0068BE47    mov         eax,dword ptr [ebx+20];TSmoothExpression.expression:TExpression
 0068BE4A    mov         ecx,dword ptr [eax]
 0068BE4C    call        dword ptr [ecx-24];TExpression.ToString
 0068BE4F    push        dword ptr [ebp-10]
 0068BE52    push        68BEEC;', '
 0068BE57    lea         edx,[ebp-14]
 0068BE5A    mov         eax,dword ptr [ebx+28];TSmoothExpression.Frames:Integer
 0068BE5D    call        IntToStr
 0068BE62    push        dword ptr [ebp-14]
 0068BE65    push        68BF00;')'
 0068BE6A    mov         eax,esi
 0068BE6C    mov         edx,5
 0068BE71    call        @UStrCatN
>0068BE76    jmp         0068BE9C
 0068BE78    push        68BED0;'Smooth('
 0068BE7D    lea         edx,[ebp-18]
 0068BE80    mov         eax,dword ptr [ebx+20];TSmoothExpression.expression:TExpression
 0068BE83    mov         ecx,dword ptr [eax]
 0068BE85    call        dword ptr [ecx-24];TExpression.ToString
 0068BE88    push        dword ptr [ebp-18]
 0068BE8B    push        68BF00;')'
 0068BE90    mov         eax,esi
 0068BE92    mov         edx,3
 0068BE97    call        @UStrCatN
 0068BE9C    xor         eax,eax
 0068BE9E    pop         edx
 0068BE9F    pop         ecx
 0068BEA0    pop         ecx
 0068BEA1    mov         dword ptr fs:[eax],edx
 0068BEA4    push        68BEBE
 0068BEA9    lea         eax,[ebp-18]
 0068BEAC    mov         edx,6
 0068BEB1    call        @UStrArrayClr
 0068BEB6    ret
>0068BEB7    jmp         @HandleFinally
>0068BEBC    jmp         0068BEA9
 0068BEBE    pop         esi
 0068BEBF    pop         ebx
 0068BEC0    mov         esp,ebp
 0068BEC2    pop         ebp
 0068BEC3    ret
end;*}

//0068BF04
{*function sub_0068BF04(?:Integer; ?:?):?;
begin
 0068BF04    xor         ecx,ecx
 0068BF06    mov         dword ptr [eax+0F8],ecx
 0068BF0C    xor         ecx,ecx
 0068BF0E    mov         dword ptr [eax+100],ecx
 0068BF14    mov         dword ptr [eax+0FC],edx
 0068BF1A    mov         dword ptr [eax+104],7FFFFFFF
 0068BF24    xor         edx,edx
 0068BF26    mov         dword ptr [eax],edx
 0068BF28    mov         dword ptr [eax+4],edx
 0068BF2B    ret
end;*}

//0068BF2C
{*procedure sub_0068BF2C(?:?; ?:?);
begin
 0068BF2C    cmp         dword ptr [eax+0FC],1E
>0068BF33    jle         0068BF3F
 0068BF35    mov         dword ptr [eax+0FC],1E
 0068BF3F    mov         ecx,edx
 0068BF41    mov         dword ptr [eax+0FC],ecx
 0068BF47    mov         edx,ecx
 0068BF49    inc         edx
 0068BF4A    cmp         edx,dword ptr [eax+100]
>0068BF50    jge         0068BF58
 0068BF52    mov         dword ptr [eax+100],edx
 0068BF58    ret
end;*}

//0068BF5C
{*procedure sub_0068BF5C(?:?; ?:?; ?:?; ?:?);
begin
 0068BF5C    push        ebp
 0068BF5D    mov         ebp,esp
 0068BF5F    push        ebx
 0068BF60    push        esi
 0068BF61    mov         ebx,edx
 0068BF63    mov         ecx,eax
 0068BF65    cmp         ebx,dword ptr [ecx+104]
>0068BF6B    je          0068BFB3
 0068BF6D    mov         eax,dword ptr [ecx+0F8]
 0068BF73    inc         eax
 0068BF74    add         eax,1F
 0068BF77    mov         esi,1F
 0068BF7C    cdq
 0068BF7D    idiv        eax,esi
 0068BF7F    mov         esi,edx
 0068BF81    mov         dword ptr [ecx+0F8],esi
 0068BF87    mov         eax,dword ptr [ebp+8]
 0068BF8A    mov         dword ptr [ecx+esi*8],eax
 0068BF8D    mov         eax,dword ptr [ebp+0C]
 0068BF90    mov         dword ptr [ecx+esi*8+4],eax
 0068BF94    mov         eax,dword ptr [ecx+100]
 0068BF9A    cmp         eax,1F
>0068BF9D    jge         0068BFAD
 0068BF9F    cmp         eax,dword ptr [ecx+0FC]
>0068BFA5    jg          0068BFAD
 0068BFA7    inc         dword ptr [ecx+100]
 0068BFAD    mov         dword ptr [ecx+104],ebx
 0068BFB3    pop         esi
 0068BFB4    pop         ebx
 0068BFB5    pop         ebp
 0068BFB6    ret         8
end;*}

//0068BFBC
procedure TSmoothExpression.Update(frame:Cardinal);
begin
{*
 0068BFBC    push        ebx
 0068BFBD    push        esi
 0068BFBE    push        edi
 0068BFBF    mov         esi,edx
 0068BFC1    mov         ebx,eax
 0068BFC3    cmp         esi,dword ptr [ebx+18];TSmoothExpression......................FrameLastUpdated:Cardinal
>0068BFC6    je          0068C03A
 0068BFC8    cmp         dword ptr [ebx+20],0;TSmoothExpression.expression:TExpression
>0068BFCC    je          0068C03A
 0068BFCE    mov         eax,dword ptr [ebx+7D0];TSmoothExpression.index:Integer
 0068BFD4    inc         eax
 0068BFD5    add         eax,3D
 0068BFD8    mov         ecx,3D
 0068BFDD    cdq
 0068BFDE    idiv        eax,ecx
 0068BFE0    mov         dword ptr [ebx+7D0],edx;TSmoothExpression.index:Integer
 0068BFE6    mov         eax,dword ptr [ebx+20];TSmoothExpression.expression:TExpression
 0068BFE9    mov         edx,dword ptr [eax]
 0068BFEB    call        dword ptr [edx];TExpression.Evaluate
 0068BFED    mov         eax,dword ptr [ebx+7D0];TSmoothExpression.index:Integer
 0068BFF3    fstp        qword ptr [ebx+eax*8+30]
 0068BFF7    wait
 0068BFF8    mov         eax,dword ptr [ebx+20];TSmoothExpression.expression:TExpression
 0068BFFB    mov         edx,dword ptr [eax]
 0068BFFD    call        dword ptr [edx+44];TExpression.GetDataType
 0068C000    cmp         al,5
>0068C002    je          0068C010
 0068C004    mov         eax,dword ptr [ebx+20];TSmoothExpression.expression:TExpression
 0068C007    mov         edx,dword ptr [eax]
 0068C009    call        dword ptr [edx+44];TExpression.GetDataType
 0068C00C    cmp         al,7
>0068C00E    jne         0068C037
 0068C010    mov         eax,dword ptr [ebx+7D0];TSmoothExpression.index:Integer
 0068C016    lea         eax,[eax+eax*2]
 0068C019    lea         edx,[ebx+eax*8+228]
 0068C020    push        edx
 0068C021    lea         ecx,[ebx+eax*8+220]
 0068C028    lea         edx,[ebx+eax*8+218]
 0068C02F    mov         eax,dword ptr [ebx+20];TSmoothExpression.expression:TExpression
 0068C032    mov         edi,dword ptr [eax]
 0068C034    call        dword ptr [edi+20];TExpression.EvaluateVector
 0068C037    mov         dword ptr [ebx+18],esi;TSmoothExpression.......................FrameLastUpdated:Cardinal
 0068C03A    pop         edi
 0068C03B    pop         esi
 0068C03C    pop         ebx
 0068C03D    ret
*}
end;

//0068C040
procedure TUpdatingExpression.FillClone(c:TExpression);
begin
{*
 0068C040    push        ebx
 0068C041    push        esi
 0068C042    mov         esi,edx
 0068C044    mov         ebx,eax
 0068C046    mov         edx,esi
 0068C048    mov         eax,ebx
 0068C04A    call        TExpression.FillClone
 0068C04F    mov         eax,dword ptr [ebx+18];TUpdatingExpression........................FrameLastUpdated:Cardi...
 0068C052    mov         dword ptr [esi+18],eax
 0068C055    pop         esi
 0068C056    pop         ebx
 0068C057    ret
*}
end;

//0068C058
function TSequenceExpression.CanSet:Boolean;
begin
{*
 0068C058    mov         al,1
 0068C05A    ret
*}
end;

//0068C05C
procedure TSequenceExpression.CreateClone;
begin
{*
 0068C05C    mov         dl,1
 0068C05E    mov         eax,[00681B30];TSequenceExpression
 0068C063    call        TObject.Create;TSequenceExpression.Create
 0068C068    ret
*}
end;

//0068C06C
destructor TSequenceExpression.Destroy();
begin
{*
 0068C06C    push        ebx
 0068C06D    push        esi
 0068C06E    call        @BeforeDestruction
 0068C073    mov         ebx,edx
 0068C075    mov         esi,eax
 0068C077    lea         eax,[esi+20];TSequenceExpression.Expressions:TObjectList
 0068C07A    mov         edx,dword ptr [eax]
 0068C07C    xor         ecx,ecx
 0068C07E    mov         dword ptr [eax],ecx
 0068C080    mov         eax,edx
 0068C082    call        TObject.Free
 0068C087    mov         edx,ebx
 0068C089    and         dl,0FC
 0068C08C    mov         eax,esi
 0068C08E    call        TObject.Destroy
 0068C093    test        bl,bl
>0068C095    jle         0068C09E
 0068C097    mov         eax,esi
 0068C099    call        @ClassDestroy
 0068C09E    pop         esi
 0068C09F    pop         ebx
 0068C0A0    ret
*}
end;

//0068C0A4
procedure TSequenceExpression.FillClone(c:TExpression);
begin
{*
 0068C0A4    push        ebx
 0068C0A5    push        esi
 0068C0A6    push        edi
 0068C0A7    mov         esi,edx
 0068C0A9    mov         ebx,eax
 0068C0AB    mov         edx,esi
 0068C0AD    mov         eax,ebx
 0068C0AF    call        TUpdatingExpression.FillClone
 0068C0B4    mov         eax,dword ptr [ebx+20];TSequenceExpression.Expressions:TObjectList
 0068C0B7    call        00682EC4
 0068C0BC    mov         edi,esi
 0068C0BE    mov         dword ptr [edi+20],eax
 0068C0C1    mov         eax,dword ptr [ebx+24];TSequenceExpression.Matched:Integer
 0068C0C4    mov         dword ptr [edi+24],eax
 0068C0C7    mov         eax,dword ptr [ebx+28];TSequenceExpression.MatchTime:TDateTime
 0068C0CA    mov         dword ptr [edi+28],eax
 0068C0CD    mov         eax,dword ptr [ebx+2C];TSequenceExpression.?f2C:dword
 0068C0D0    mov         dword ptr [edi+2C],eax
 0068C0D3    pop         edi
 0068C0D4    pop         esi
 0068C0D5    pop         ebx
 0068C0D6    ret
*}
end;

//0068C0D8
function TSequenceExpression.GetDataType:TDataType;
begin
{*
 0068C0D8    mov         al,3
 0068C0DA    ret
*}
end;

//0068C0DC
procedure TSequenceExpression.GetValue;
begin
{*
 0068C0DC    add         esp,0FFFFFFF8
 0068C0DF    mov         edx,dword ptr [eax+20];TSequenceExpression.Expressions:TObjectList
 0068C0E2    mov         edx,dword ptr [edx+8];TObjectList.FCount:Integer
 0068C0E5    add         edx,edx
 0068C0E7    dec         edx
 0068C0E8    cmp         edx,dword ptr [eax+24];TSequenceExpression.Matched:Integer
 0068C0EB    sete        al
 0068C0EE    call        00686074
 0068C0F3    fstp        qword ptr [esp]
 0068C0F6    wait
 0068C0F7    fld         qword ptr [esp]
 0068C0FA    pop         ecx
 0068C0FB    pop         edx
 0068C0FC    ret
*}
end;

//0068C100
{*function TSequenceExpression.SetValue(NewValue:Double; ?:?):Boolean;
begin
 0068C100    push        ebp
 0068C101    mov         ebp,esp
 0068C103    push        ecx
 0068C104    push        ebx
 0068C105    push        esi
 0068C106    mov         esi,eax
 0068C108    mov         byte ptr [esi+30],1;TSequenceExpression.WriteOnly:Boolean
 0068C10C    mov         byte ptr [ebp-1],1
 0068C110    push        dword ptr [ebp+0C]
 0068C113    push        dword ptr [ebp+8]
 0068C116    call        00686060
 0068C11B    mov         ebx,eax
 0068C11D    push        dword ptr [esi+0C];TSequenceExpression.?fC:dword
 0068C120    push        dword ptr [esi+8];TSequenceExpression.PreviousValue:Double
 0068C123    call        00686060
 0068C128    cmp         bl,al
>0068C12A    je          0068C171
 0068C12C    mov         eax,dword ptr [esi+20];TSequenceExpression.Expressions:TObjectList
 0068C12F    cmp         dword ptr [eax+8],0;TObjectList.FCount:Integer
>0068C133    jle         0068C171
 0068C135    test        bl,bl
>0068C137    je          0068C166
 0068C139    mov         dword ptr [esi+34],1;TSequenceExpression.SetState:Integer
 0068C140    call        Now
 0068C145    fstp        qword ptr [esi+38];TSequenceExpression.SetTime:TDateTime
 0068C148    wait
 0068C149    mov         al,1
 0068C14B    call        00686074
 0068C150    add         esp,0FFFFFFF8
 0068C153    fstp        qword ptr [esp]
 0068C156    wait
 0068C157    xor         edx,edx
 0068C159    mov         eax,dword ptr [esi+20];TSequenceExpression.Expressions:TObjectList
 0068C15C    call        TList.Get
 0068C161    mov         edx,dword ptr [eax]
 0068C163    call        dword ptr [edx+58]
 0068C166    mov         eax,ebx
 0068C168    call        00686074
 0068C16D    fstp        qword ptr [esi+8];TSequenceExpression.PreviousValue:Double
 0068C170    wait
 0068C171    movzx       eax,byte ptr [ebp-1]
 0068C175    pop         esi
 0068C176    pop         ebx
 0068C177    pop         ecx
 0068C178    pop         ebp
 0068C179    ret         8
end;*}

//0068C17C
procedure TSequenceExpression.Swallow;
begin
{*
 0068C17C    push        ebx
 0068C17D    push        esi
 0068C17E    push        edi
 0068C17F    mov         edi,eax
 0068C181    mov         eax,dword ptr [edi+20];TSequenceExpression.Expressions:TObjectList
 0068C184    mov         ebx,dword ptr [eax+8];TObjectList.FCount:Integer
 0068C187    dec         ebx
 0068C188    test        ebx,ebx
>0068C18A    jl          0068C1A5
 0068C18C    inc         ebx
 0068C18D    xor         esi,esi
 0068C18F    mov         eax,dword ptr [edi+20];TSequenceExpression.Expressions:TObjectList
 0068C192    mov         edx,esi
 0068C194    call        TList.Get
 0068C199    mov         edx,dword ptr [eax]
 0068C19B    call        dword ptr [edx+88]
 0068C1A1    inc         esi
 0068C1A2    dec         ebx
>0068C1A3    jne         0068C18F
 0068C1A5    pop         edi
 0068C1A6    pop         esi
 0068C1A7    pop         ebx
 0068C1A8    ret
*}
end;

//0068C1AC
{*procedure TSequenceExpression.ToString(?:?);
begin
 0068C1AC    push        ebp
 0068C1AD    mov         ebp,esp
 0068C1AF    add         esp,0FFFFFFF8
 0068C1B2    push        ebx
 0068C1B3    push        esi
 0068C1B4    push        edi
 0068C1B5    xor         ecx,ecx
 0068C1B7    mov         dword ptr [ebp-8],ecx
 0068C1BA    mov         ebx,edx
 0068C1BC    mov         edi,eax
 0068C1BE    xor         eax,eax
 0068C1C0    push        ebp
 0068C1C1    push        68C244
 0068C1C6    push        dword ptr fs:[eax]
 0068C1C9    mov         dword ptr fs:[eax],esp
 0068C1CC    mov         eax,ebx
 0068C1CE    mov         edx,68C260;'('
 0068C1D3    call        @UStrAsg
 0068C1D8    mov         eax,dword ptr [edi+20];TSequenceExpression.Expressions:TObjectList
 0068C1DB    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 0068C1DE    dec         eax
 0068C1DF    test        eax,eax
>0068C1E1    jl          0068C222
 0068C1E3    inc         eax
 0068C1E4    mov         dword ptr [ebp-4],eax
 0068C1E7    xor         esi,esi
 0068C1E9    mov         eax,dword ptr [edi+20];TSequenceExpression.Expressions:TObjectList
 0068C1EC    mov         edx,esi
 0068C1EE    call        TList.Get
 0068C1F3    lea         edx,[ebp-8]
 0068C1F6    mov         ecx,dword ptr [eax]
 0068C1F8    call        dword ptr [ecx-24]
 0068C1FB    mov         edx,dword ptr [ebp-8]
 0068C1FE    mov         eax,ebx
 0068C200    call        @UStrCat
 0068C205    mov         eax,dword ptr [edi+20];TSequenceExpression.Expressions:TObjectList
 0068C208    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 0068C20B    dec         eax
 0068C20C    cmp         esi,eax
>0068C20E    jge         0068C21C
 0068C210    mov         eax,ebx
 0068C212    mov         edx,68C270;', '
 0068C217    call        @UStrCat
 0068C21C    inc         esi
 0068C21D    dec         dword ptr [ebp-4]
>0068C220    jne         0068C1E9
 0068C222    mov         eax,ebx
 0068C224    mov         edx,68C284;')'
 0068C229    call        @UStrCat
 0068C22E    xor         eax,eax
 0068C230    pop         edx
 0068C231    pop         ecx
 0068C232    pop         ecx
 0068C233    mov         dword ptr fs:[eax],edx
 0068C236    push        68C24B
 0068C23B    lea         eax,[ebp-8]
 0068C23E    call        @UStrClr
 0068C243    ret
>0068C244    jmp         @HandleFinally
>0068C249    jmp         0068C23B
 0068C24B    pop         edi
 0068C24C    pop         esi
 0068C24D    pop         ebx
 0068C24E    pop         ecx
 0068C24F    pop         ecx
 0068C250    pop         ebp
 0068C251    ret
end;*}

//0068C288
procedure TSequenceExpression.Update(frame:Cardinal);
begin
{*
 0068C288    push        ebp
 0068C289    mov         ebp,esp
 0068C28B    add         esp,0FFFFFFE8
 0068C28E    push        ebx
 0068C28F    push        esi
 0068C290    push        edi
 0068C291    mov         dword ptr [ebp-8],edx
 0068C294    mov         dword ptr [ebp-4],eax
 0068C297    mov         eax,dword ptr [ebp-4]
 0068C29A    mov         eax,dword ptr [eax+18];TSequenceExpression.........................FrameLastUpdated:Card...
 0068C29D    cmp         eax,dword ptr [ebp-8]
>0068C2A0    je          0068C639
 0068C2A6    mov         eax,dword ptr [ebp-4]
 0068C2A9    cmp         byte ptr [eax+30],0;TSequenceExpression.WriteOnly:Boolean
>0068C2AD    je          0068C45E
 0068C2B3    mov         eax,dword ptr [ebp-4]
 0068C2B6    mov         ebx,dword ptr [eax+34];TSequenceExpression.SetState:Integer
 0068C2B9    test        ebx,ebx
>0068C2BB    je          0068C2CC
 0068C2BD    mov         eax,dword ptr [ebp-4]
 0068C2C0    mov         eax,dword ptr [eax+20];TSequenceExpression.Expressions:TObjectList
 0068C2C3    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 0068C2C6    add         eax,eax
 0068C2C8    cmp         ebx,eax
>0068C2CA    jne         0068C2EB
 0068C2CC    mov         eax,dword ptr [ebp-4]
 0068C2CF    push        dword ptr [eax+0C];TSequenceExpression.?fC:dword
 0068C2D2    push        dword ptr [eax+8];TSequenceExpression.PreviousValue:Double
 0068C2D5    call        00686060
 0068C2DA    test        al,al
>0068C2DC    jne         0068C2EB
 0068C2DE    mov         eax,dword ptr [ebp-4]
 0068C2E1    xor         edx,edx
 0068C2E3    mov         dword ptr [eax+34],edx;TSequenceExpression.SetState:Integer
>0068C2E6    jmp         0068C639
 0068C2EB    mov         eax,dword ptr [ebp-4]
 0068C2EE    mov         eax,dword ptr [eax+34];TSequenceExpression.SetState:Integer
 0068C2F1    sar         eax,1
>0068C2F3    jns         0068C2F8
 0068C2F5    adc         eax,0
 0068C2F8    mov         dword ptr [ebp-0C],eax
 0068C2FB    mov         eax,dword ptr [ebp-4]
 0068C2FE    mov         eax,dword ptr [eax+20];TSequenceExpression.Expressions:TObjectList
 0068C301    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 0068C304    cmp         eax,dword ptr [ebp-0C]
>0068C307    jg          0068C316
 0068C309    mov         eax,dword ptr [ebp-4]
 0068C30C    xor         edx,edx
 0068C30E    mov         dword ptr [eax+34],edx;TSequenceExpression.SetState:Integer
 0068C311    xor         eax,eax
 0068C313    mov         dword ptr [ebp-0C],eax
 0068C316    mov         eax,dword ptr [ebp-4]
 0068C319    mov         eax,dword ptr [eax+34];TSequenceExpression.SetState:Integer
 0068C31C    and         eax,80000001
>0068C321    jns         0068C328
 0068C323    dec         eax
 0068C324    or          eax,0FFFFFFFE
 0068C327    inc         eax
 0068C328    test        eax,eax
 0068C32A    sete        bl
 0068C32D    call        Now
 0068C332    mov         eax,dword ptr [ebp-4]
 0068C335    fsub        qword ptr [eax+38];TSequenceExpression.SetTime:TDateTime
 0068C338    fmul        dword ptr ds:[68C640];24:Single
 0068C33E    fmul        dword ptr ds:[68C644];60:Single
 0068C344    fmul        dword ptr ds:[68C644];60:Single
 0068C34A    fstp        qword ptr [ebp-18]
 0068C34D    wait
 0068C34E    test        bl,bl
>0068C350    je          0068C40A
 0068C356    fld         qword ptr [ebp-18]
 0068C359    mov         eax,[0078D248];^gvar_0078BD60:Double
 0068C35E    fcomp       qword ptr [eax]
 0068C360    wait
 0068C361    fnstsw      al
 0068C363    sahf
>0068C364    jbe         0068C40A
 0068C36A    xor         eax,eax
 0068C36C    push        ebp
 0068C36D    push        68C3AF
 0068C372    push        dword ptr fs:[eax]
 0068C375    mov         dword ptr fs:[eax],esp
 0068C378    mov         al,1
 0068C37A    call        00686074
 0068C37F    add         esp,0FFFFFFF8
 0068C382    fstp        qword ptr [esp]
 0068C385    wait
 0068C386    mov         eax,dword ptr [ebp-4]
 0068C389    mov         eax,dword ptr [eax+20];TSequenceExpression.Expressions:TObjectList
 0068C38C    mov         edx,dword ptr [ebp-0C]
 0068C38F    call        TList.Get
 0068C394    mov         edx,dword ptr [eax]
 0068C396    call        dword ptr [edx+58]
 0068C399    call        Now
 0068C39E    mov         eax,dword ptr [ebp-4]
 0068C3A1    fstp        qword ptr [eax+38];TSequenceExpression.SetTime:TDateTime
 0068C3A4    wait
 0068C3A5    xor         eax,eax
 0068C3A7    pop         edx
 0068C3A8    pop         ecx
 0068C3A9    pop         ecx
 0068C3AA    mov         dword ptr fs:[eax],edx
>0068C3AD    jmp         0068C3FF
>0068C3AF    jmp         @HandleOnException
 0068C3B4    dd          1
 0068C3B8    dd          00679898;EWait
 0068C3BC    dd          0068C3C0
 0068C3C0    mov         ebx,eax
 0068C3C2    xor         eax,eax
 0068C3C4    call        00686074
 0068C3C9    add         esp,0FFFFFFF8
 0068C3CC    fstp        qword ptr [esp]
 0068C3CF    wait
 0068C3D0    mov         eax,dword ptr [ebp-4]
 0068C3D3    mov         eax,dword ptr [eax+20];TSequenceExpression.Expressions:TObjectList
 0068C3D6    mov         edx,dword ptr [ebp-0C]
 0068C3D9    call        TList.Get
 0068C3DE    mov         edx,dword ptr [eax]
 0068C3E0    call        dword ptr [edx+58]
 0068C3E3    fld         qword ptr [ebx+18];EWait.time:Double
 0068C3E6    mov         eax,[0078D248];^gvar_0078BD60:Double
 0068C3EB    fsub        qword ptr [eax]
 0068C3ED    mov         eax,dword ptr [ebp-4]
 0068C3F0    fstp        qword ptr [eax+38];TSequenceExpression.SetTime:TDateTime
 0068C3F3    wait
 0068C3F4    mov         eax,dword ptr [ebp-4]
 0068C3F7    inc         dword ptr [eax+34];TSequenceExpression.SetState:Integer
 0068C3FA    call        @DoneExcept
 0068C3FF    mov         eax,dword ptr [ebp-4]
 0068C402    inc         dword ptr [eax+34];TSequenceExpression.SetState:Integer
>0068C405    jmp         0068C639
 0068C40A    test        bl,bl
>0068C40C    jne         0068C639
 0068C412    fld         qword ptr [ebp-18]
 0068C415    mov         eax,[0078D0D4];^gvar_0078BD58:Double
 0068C41A    fcomp       qword ptr [eax]
 0068C41C    wait
 0068C41D    fnstsw      al
 0068C41F    sahf
>0068C420    jbe         0068C639
 0068C426    xor         eax,eax
 0068C428    call        00686074
 0068C42D    add         esp,0FFFFFFF8
 0068C430    fstp        qword ptr [esp]
 0068C433    wait
 0068C434    mov         eax,dword ptr [ebp-4]
 0068C437    mov         eax,dword ptr [eax+20];TSequenceExpression.Expressions:TObjectList
 0068C43A    mov         edx,dword ptr [ebp-0C]
 0068C43D    call        TList.Get
 0068C442    mov         edx,dword ptr [eax]
 0068C444    call        dword ptr [edx+58]
 0068C447    call        Now
 0068C44C    mov         eax,dword ptr [ebp-4]
 0068C44F    fstp        qword ptr [eax+38];TSequenceExpression.SetTime:TDateTime
 0068C452    wait
 0068C453    mov         eax,dword ptr [ebp-4]
 0068C456    inc         dword ptr [eax+34];TSequenceExpression.SetState:Integer
>0068C459    jmp         0068C639
 0068C45E    mov         eax,dword ptr [ebp-4]
 0068C461    mov         eax,dword ptr [eax+24];TSequenceExpression.Matched:Integer
 0068C464    sar         eax,1
>0068C466    jns         0068C46B
 0068C468    adc         eax,0
 0068C46B    mov         dword ptr [ebp-0C],eax
 0068C46E    mov         eax,dword ptr [ebp-4]
 0068C471    mov         eax,dword ptr [eax+20];TSequenceExpression.Expressions:TObjectList
 0068C474    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 0068C477    cmp         eax,dword ptr [ebp-0C]
>0068C47A    jg          0068C489
 0068C47C    mov         eax,dword ptr [ebp-4]
 0068C47F    xor         edx,edx
 0068C481    mov         dword ptr [eax+24],edx;TSequenceExpression.Matched:Integer
 0068C484    xor         eax,eax
 0068C486    mov         dword ptr [ebp-0C],eax
 0068C489    mov         eax,dword ptr [ebp-4]
 0068C48C    mov         eax,dword ptr [eax+24];TSequenceExpression.Matched:Integer
 0068C48F    and         eax,80000001
>0068C494    jns         0068C49B
 0068C496    dec         eax
 0068C497    or          eax,0FFFFFFFE
 0068C49A    inc         eax
 0068C49B    test        eax,eax
 0068C49D    sete        bl
 0068C4A0    test        bl,bl
>0068C4A2    je          0068C56A
 0068C4A8    call        Now
 0068C4AD    mov         eax,dword ptr [ebp-4]
 0068C4B0    fsub        qword ptr [eax+28];TSequenceExpression.MatchTime:TDateTime
 0068C4B3    fmul        dword ptr ds:[68C640];24:Single
 0068C4B9    fmul        dword ptr ds:[68C644];60:Single
 0068C4BF    fmul        dword ptr ds:[68C644];60:Single
 0068C4C5    fstp        qword ptr [ebp-18]
 0068C4C8    wait
 0068C4C9    fld         qword ptr [ebp-18]
 0068C4CC    mov         eax,[0078CB80];^gvar_0078BD70:Double
 0068C4D1    fcomp       qword ptr [eax]
 0068C4D3    wait
 0068C4D4    fnstsw      al
 0068C4D6    sahf
>0068C4D7    jbe         0068C4E6
 0068C4D9    mov         eax,dword ptr [ebp-4]
 0068C4DC    xor         edx,edx
 0068C4DE    mov         dword ptr [eax+24],edx;TSequenceExpression.Matched:Integer
 0068C4E1    xor         eax,eax
 0068C4E3    mov         dword ptr [ebp-0C],eax
 0068C4E6    mov         eax,dword ptr [ebp-4]
 0068C4E9    mov         eax,dword ptr [eax+20];TSequenceExpression.Expressions:TObjectList
 0068C4EC    mov         edx,dword ptr [ebp-0C]
 0068C4EF    call        TList.Get
 0068C4F4    mov         edx,dword ptr ds:[67DB04];TExpression
 0068C4FA    call        @AsClass
 0068C4FF    mov         ebx,eax
 0068C501    xor         edx,edx
 0068C503    push        ebp
 0068C504    push        68C539
 0068C509    push        dword ptr fs:[edx]
 0068C50C    mov         dword ptr fs:[edx],esp
 0068C50F    mov         eax,ebx
 0068C511    mov         edx,dword ptr [eax]
 0068C513    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 0068C516    test        al,al
>0068C518    je          0068C52C
 0068C51A    call        Now
 0068C51F    mov         eax,dword ptr [ebp-4]
 0068C522    fstp        qword ptr [eax+28];TSequenceExpression.MatchTime:TDateTime
 0068C525    wait
 0068C526    mov         eax,dword ptr [ebp-4]
 0068C529    inc         dword ptr [eax+24];TSequenceExpression.Matched:Integer
 0068C52C    xor         eax,eax
 0068C52E    pop         edx
 0068C52F    pop         ecx
 0068C530    pop         ecx
 0068C531    mov         dword ptr fs:[eax],edx
>0068C534    jmp         0068C630
>0068C539    jmp         @HandleOnException
 0068C53E    dd          1
 0068C542    dd          00679898;EWait
 0068C546    dd          0068C54A
 0068C54A    mov         edx,dword ptr [ebp-4]
 0068C54D    mov         ecx,dword ptr [eax+18];EWait.time:Double
 0068C550    mov         dword ptr [edx+28],ecx;TSequenceExpression.MatchTime:TDateTime
 0068C553    mov         ecx,dword ptr [eax+1C];EWait.?f1C:dword
 0068C556    mov         dword ptr [edx+2C],ecx;TSequenceExpression.?f2C:dword
 0068C559    mov         eax,dword ptr [ebp-4]
 0068C55C    add         dword ptr [eax+24],2;TSequenceExpression.Matched:Integer
 0068C560    call        @DoneExcept
>0068C565    jmp         0068C630
 0068C56A    mov         eax,dword ptr [ebp-4]
 0068C56D    mov         eax,dword ptr [eax+20];TSequenceExpression.Expressions:TObjectList
 0068C570    mov         edx,dword ptr [ebp-0C]
 0068C573    call        TList.Get
 0068C578    mov         edx,dword ptr ds:[67DB04];TExpression
 0068C57E    call        @AsClass
 0068C583    mov         ebx,eax
 0068C585    mov         eax,ebx
 0068C587    mov         edx,dword ptr [eax]
 0068C589    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 0068C58C    test        al,al
>0068C58E    jne         0068C5A7
 0068C590    call        Now
 0068C595    mov         eax,dword ptr [ebp-4]
 0068C598    fstp        qword ptr [eax+28];TSequenceExpression.MatchTime:TDateTime
 0068C59B    wait
 0068C59C    mov         eax,dword ptr [ebp-4]
 0068C59F    inc         dword ptr [eax+24];TSequenceExpression.Matched:Integer
>0068C5A2    jmp         0068C630
 0068C5A7    mov         eax,dword ptr [ebp-4]
 0068C5AA    mov         ebx,dword ptr [eax+20];TSequenceExpression.Expressions:TObjectList
 0068C5AD    mov         eax,dword ptr [ebx+8];TObjectList.FCount:Integer
 0068C5B0    dec         eax
 0068C5B1    cmp         eax,dword ptr [ebp-0C]
>0068C5B4    jle         0068C630
 0068C5B6    mov         edx,dword ptr [ebp-0C]
 0068C5B9    inc         edx
 0068C5BA    mov         eax,ebx
 0068C5BC    call        TList.Get
 0068C5C1    mov         edx,dword ptr ds:[67DB04];TExpression
 0068C5C7    call        @AsClass
 0068C5CC    mov         ebx,eax
 0068C5CE    xor         edx,edx
 0068C5D0    push        ebp
 0068C5D1    push        68C604
 0068C5D6    push        dword ptr fs:[edx]
 0068C5D9    mov         dword ptr fs:[edx],esp
 0068C5DC    mov         eax,ebx
 0068C5DE    mov         edx,dword ptr [eax]
 0068C5E0    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 0068C5E3    test        al,al
>0068C5E5    je          0068C5FA
 0068C5E7    call        Now
 0068C5EC    mov         eax,dword ptr [ebp-4]
 0068C5EF    fstp        qword ptr [eax+28];TSequenceExpression.MatchTime:TDateTime
 0068C5F2    wait
 0068C5F3    mov         eax,dword ptr [ebp-4]
 0068C5F6    add         dword ptr [eax+24],2;TSequenceExpression.Matched:Integer
 0068C5FA    xor         eax,eax
 0068C5FC    pop         edx
 0068C5FD    pop         ecx
 0068C5FE    pop         ecx
 0068C5FF    mov         dword ptr fs:[eax],edx
>0068C602    jmp         0068C630
>0068C604    jmp         @HandleOnException
 0068C609    dd          1
 0068C60D    dd          00679898;EWait
 0068C611    dd          0068C615
 0068C615    mov         edx,dword ptr [ebp-4]
 0068C618    mov         ecx,dword ptr [eax+18];EWait.time:Double
 0068C61B    mov         dword ptr [edx+28],ecx;TSequenceExpression.MatchTime:TDateTime
 0068C61E    mov         ecx,dword ptr [eax+1C];EWait.?f1C:dword
 0068C621    mov         dword ptr [edx+2C],ecx;TSequenceExpression.?f2C:dword
 0068C624    mov         eax,dword ptr [ebp-4]
 0068C627    add         dword ptr [eax+24],3;TSequenceExpression.Matched:Integer
 0068C62B    call        @DoneExcept
 0068C630    mov         eax,dword ptr [ebp-4]
 0068C633    mov         edx,dword ptr [ebp-8]
 0068C636    mov         dword ptr [eax+18],edx;TSequenceExpression..........................FrameLastUpdated:Car...
 0068C639    pop         edi
 0068C63A    pop         esi
 0068C63B    pop         ebx
 0068C63C    mov         esp,ebp
 0068C63E    pop         ebp
 0068C63F    ret
*}
end;

//0068C648
procedure TVectorExpression.CreateClone;
begin
{*
 0068C648    mov         dl,1
 0068C64A    mov         eax,[00681F10];TVectorExpression
 0068C64F    call        TObject.Create;TVectorExpression.Create
 0068C654    ret
*}
end;

//0068C658
destructor TVectorExpression.Destroy();
begin
{*
 0068C658    push        ebx
 0068C659    push        esi
 0068C65A    call        @BeforeDestruction
 0068C65F    mov         ebx,edx
 0068C661    mov         esi,eax
 0068C663    lea         eax,[esi+18];TVectorExpression.x:TExpression
 0068C666    mov         edx,dword ptr [eax]
 0068C668    xor         ecx,ecx
 0068C66A    mov         dword ptr [eax],ecx
 0068C66C    mov         eax,edx
 0068C66E    call        TObject.Free
 0068C673    lea         eax,[esi+1C];TVectorExpression.y:TExpression
 0068C676    mov         edx,dword ptr [eax]
 0068C678    xor         ecx,ecx
 0068C67A    mov         dword ptr [eax],ecx
 0068C67C    mov         eax,edx
 0068C67E    call        TObject.Free
 0068C683    lea         eax,[esi+20];TVectorExpression.z:TExpression
 0068C686    mov         edx,dword ptr [eax]
 0068C688    xor         ecx,ecx
 0068C68A    mov         dword ptr [eax],ecx
 0068C68C    mov         eax,edx
 0068C68E    call        TObject.Free
 0068C693    mov         edx,ebx
 0068C695    and         dl,0FC
 0068C698    mov         eax,esi
 0068C69A    call        TObject.Destroy
 0068C69F    test        bl,bl
>0068C6A1    jle         0068C6AA
 0068C6A3    mov         eax,esi
 0068C6A5    call        @ClassDestroy
 0068C6AA    pop         esi
 0068C6AB    pop         ebx
 0068C6AC    ret
*}
end;

//0068C6B0
procedure TVectorExpression.FillClone(c:TExpression);
begin
{*
 0068C6B0    push        ebx
 0068C6B1    push        esi
 0068C6B2    push        edi
 0068C6B3    mov         esi,edx
 0068C6B5    mov         ebx,eax
 0068C6B7    mov         edx,esi
 0068C6B9    mov         eax,ebx
 0068C6BB    call        TExpression.FillClone
 0068C6C0    mov         eax,dword ptr [ebx+18];TVectorExpression.x:TExpression
 0068C6C3    call        TExpression.Clone
 0068C6C8    mov         edi,esi
 0068C6CA    mov         dword ptr [edi+18],eax
 0068C6CD    mov         eax,dword ptr [ebx+1C];TVectorExpression.y:TExpression
 0068C6D0    call        TExpression.Clone
 0068C6D5    mov         dword ptr [edi+1C],eax
 0068C6D8    mov         eax,dword ptr [ebx+20];TVectorExpression.z:TExpression
 0068C6DB    call        TExpression.Clone
 0068C6E0    mov         dword ptr [edi+20],eax
 0068C6E3    pop         edi
 0068C6E4    pop         esi
 0068C6E5    pop         ebx
 0068C6E6    ret
*}
end;

//0068C6E8
function TVectorExpression.GetDataType:TDataType;
begin
{*
 0068C6E8    mov         al,5
 0068C6EA    ret
*}
end;

//0068C6EC
procedure TVectorExpression.GetPerUnits1;
begin
{*
 0068C6EC    mov         eax,dword ptr [eax+18];TVectorExpression.x:TExpression
 0068C6EF    mov         edx,dword ptr [eax]
 0068C6F1    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 0068C6F4    ret
*}
end;

//0068C6F8
procedure TVectorExpression.GetPerUnits2;
begin
{*
 0068C6F8    mov         eax,dword ptr [eax+18];TVectorExpression.x:TExpression
 0068C6FB    mov         edx,dword ptr [eax]
 0068C6FD    call        dword ptr [edx+50];TExpression.GetPerUnits2
 0068C700    ret
*}
end;

//0068C704
procedure TVectorExpression.GetUnits;
begin
{*
 0068C704    mov         eax,dword ptr [eax+18];TVectorExpression.x:TExpression
 0068C707    mov         edx,dword ptr [eax]
 0068C709    call        dword ptr [edx+48];TExpression.GetUnits
 0068C70C    ret
*}
end;

//0068C710
procedure TVectorExpression.GetValue;
begin
{*
 0068C710    push        ebx
 0068C711    add         esp,0FFFFFFE0
 0068C714    mov         ebx,eax
 0068C716    mov         eax,dword ptr [ebx+18];TVectorExpression.x:TExpression
 0068C719    mov         edx,dword ptr [eax]
 0068C71B    call        dword ptr [edx];TExpression.Evaluate
 0068C71D    fstp        qword ptr [esp+8]
 0068C721    wait
 0068C722    mov         eax,dword ptr [ebx+1C];TVectorExpression.y:TExpression
 0068C725    test        eax,eax
>0068C727    je          0068C738
 0068C729    mov         edx,dword ptr [ebx+18];TVectorExpression.x:TExpression
 0068C72C    mov         ecx,dword ptr [eax]
 0068C72E    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 0068C731    fstp        qword ptr [esp+10]
 0068C735    wait
>0068C736    jmp         0068C742
 0068C738    xor         eax,eax
 0068C73A    mov         dword ptr [esp+10],eax
 0068C73E    mov         dword ptr [esp+14],eax
 0068C742    mov         eax,dword ptr [ebx+20];TVectorExpression.z:TExpression
 0068C745    test        eax,eax
>0068C747    je          0068C758
 0068C749    mov         edx,dword ptr [ebx+18];TVectorExpression.x:TExpression
 0068C74C    mov         ecx,dword ptr [eax]
 0068C74E    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 0068C751    fstp        qword ptr [esp+18]
 0068C755    wait
>0068C756    jmp         0068C762
 0068C758    xor         eax,eax
 0068C75A    mov         dword ptr [esp+18],eax
 0068C75E    mov         dword ptr [esp+1C],eax
 0068C762    push        dword ptr [esp+0C]
 0068C766    push        dword ptr [esp+0C]
 0068C76A    push        dword ptr [esp+1C]
 0068C76E    push        dword ptr [esp+1C]
 0068C772    push        dword ptr [esp+2C]
 0068C776    push        dword ptr [esp+2C]
 0068C77A    call        005C4070
 0068C77F    fstp        qword ptr [esp]
 0068C782    wait
 0068C783    fld         qword ptr [esp]
 0068C786    add         esp,20
 0068C789    pop         ebx
 0068C78A    ret
*}
end;

//0068C78C
procedure TVectorExpression.GetVector(x:Double; y:Double; z:Double);
begin
{*
 0068C78C    push        ebp
 0068C78D    mov         ebp,esp
 0068C78F    push        ecx
 0068C790    push        ebx
 0068C791    push        esi
 0068C792    push        edi
 0068C793    mov         esi,ecx
 0068C795    mov         dword ptr [ebp-4],edx
 0068C798    mov         ebx,eax
 0068C79A    mov         edi,dword ptr [ebp+8]
 0068C79D    mov         eax,dword ptr [ebx+18];TVectorExpression.x:TExpression
 0068C7A0    mov         edx,dword ptr [eax]
 0068C7A2    call        dword ptr [edx];TExpression.Evaluate
 0068C7A4    mov         eax,dword ptr [ebp-4]
 0068C7A7    fstp        qword ptr [eax]
 0068C7A9    wait
 0068C7AA    cmp         dword ptr [ebx+1C],0;TVectorExpression.y:TExpression
>0068C7AE    je          0068C7C0
 0068C7B0    mov         edx,dword ptr [ebx+18];TVectorExpression.x:TExpression
 0068C7B3    mov         eax,dword ptr [ebx+1C];TVectorExpression.y:TExpression
 0068C7B6    mov         ecx,dword ptr [eax]
 0068C7B8    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 0068C7BB    fstp        qword ptr [esi]
 0068C7BD    wait
>0068C7BE    jmp         0068C7C7
 0068C7C0    xor         eax,eax
 0068C7C2    mov         dword ptr [esi],eax
 0068C7C4    mov         dword ptr [esi+4],eax
 0068C7C7    mov         esi,dword ptr [ebx+20];TVectorExpression.z:TExpression
 0068C7CA    test        esi,esi
>0068C7CC    je          0068C7DD
 0068C7CE    mov         edx,dword ptr [ebx+18];TVectorExpression.x:TExpression
 0068C7D1    mov         eax,esi
 0068C7D3    mov         ecx,dword ptr [eax]
 0068C7D5    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 0068C7D8    fstp        qword ptr [edi]
 0068C7DA    wait
>0068C7DB    jmp         0068C7E4
 0068C7DD    xor         eax,eax
 0068C7DF    mov         dword ptr [edi],eax
 0068C7E1    mov         dword ptr [edi+4],eax
 0068C7E4    pop         edi
 0068C7E5    pop         esi
 0068C7E6    pop         ebx
 0068C7E7    pop         ecx
 0068C7E8    pop         ebp
 0068C7E9    ret         4
*}
end;

//0068C7EC
procedure TVectorExpression.SetIffy(IsIffy:Boolean);
begin
{*
 0068C7EC    push        ebx
 0068C7ED    push        esi
 0068C7EE    mov         ebx,edx
 0068C7F0    mov         esi,eax
 0068C7F2    mov         edx,ebx
 0068C7F4    mov         eax,esi
 0068C7F6    call        TExpression.SetIffy
 0068C7FB    mov         eax,dword ptr [esi+18];TVectorExpression.x:TExpression
 0068C7FE    test        eax,eax
>0068C800    je          0068C809
 0068C802    mov         edx,ebx
 0068C804    mov         ecx,dword ptr [eax]
 0068C806    call        dword ptr [ecx+74];TExpression.SetIffy
 0068C809    mov         eax,dword ptr [esi+1C];TVectorExpression.y:TExpression
 0068C80C    test        eax,eax
>0068C80E    je          0068C817
 0068C810    mov         edx,ebx
 0068C812    mov         ecx,dword ptr [eax]
 0068C814    call        dword ptr [ecx+74];TExpression.SetIffy
 0068C817    mov         eax,dword ptr [esi+20];TVectorExpression.z:TExpression
 0068C81A    test        eax,eax
>0068C81C    je          0068C825
 0068C81E    mov         edx,ebx
 0068C820    mov         ecx,dword ptr [eax]
 0068C822    call        dword ptr [ecx+74];TExpression.SetIffy
 0068C825    pop         esi
 0068C826    pop         ebx
 0068C827    ret
*}
end;

//0068C828
function TVectorExpression.SetUnits(NewUnits:TUnits; NewPerUnits1:TUnits; NewPerUnits2:TUnits):Boolean;
begin
{*
 0068C828    push        ebp
 0068C829    mov         ebp,esp
 0068C82B    push        ecx
 0068C82C    push        ebx
 0068C82D    push        esi
 0068C82E    push        edi
 0068C82F    mov         byte ptr [ebp-1],cl
 0068C832    mov         ebx,edx
 0068C834    mov         edi,eax
 0068C836    mov         byte ptr [ebp-2],0
 0068C83A    mov         esi,dword ptr [edi+18];TVectorExpression.x:TExpression
 0068C83D    test        esi,esi
>0068C83F    je          0068C867
 0068C841    mov         eax,esi
 0068C843    mov         edx,dword ptr ds:[5D0F60];TVariableExpression
 0068C849    call        @IsClass
 0068C84E    test        al,al
>0068C850    je          0068C867
 0068C852    movzx       eax,byte ptr [ebp+8]
 0068C856    push        eax
 0068C857    movzx       ecx,byte ptr [ebp-1]
 0068C85B    mov         edx,ebx
 0068C85D    mov         eax,esi
 0068C85F    call        TVariableExpression.SetUnits
 0068C864    mov         byte ptr [ebp-2],al
 0068C867    mov         esi,dword ptr [edi+1C];TVectorExpression.y:TExpression
 0068C86A    test        esi,esi
>0068C86C    je          0068C891
 0068C86E    mov         eax,esi
 0068C870    mov         edx,dword ptr ds:[5D0F60];TVariableExpression
 0068C876    call        @IsClass
 0068C87B    test        al,al
>0068C87D    je          0068C891
 0068C87F    movzx       eax,byte ptr [ebp+8]
 0068C883    push        eax
 0068C884    movzx       ecx,byte ptr [ebp-1]
 0068C888    mov         edx,ebx
 0068C88A    mov         eax,esi
 0068C88C    call        TVariableExpression.SetUnits
 0068C891    mov         esi,dword ptr [edi+20];TVectorExpression.z:TExpression
 0068C894    test        esi,esi
>0068C896    je          0068C8BB
 0068C898    mov         eax,esi
 0068C89A    mov         edx,dword ptr ds:[5D0F60];TVariableExpression
 0068C8A0    call        @IsClass
 0068C8A5    test        al,al
>0068C8A7    je          0068C8BB
 0068C8A9    movzx       eax,byte ptr [ebp+8]
 0068C8AD    push        eax
 0068C8AE    movzx       ecx,byte ptr [ebp-1]
 0068C8B2    mov         edx,ebx
 0068C8B4    mov         eax,esi
 0068C8B6    call        TVariableExpression.SetUnits
 0068C8BB    movzx       eax,byte ptr [ebp-2]
 0068C8BF    pop         edi
 0068C8C0    pop         esi
 0068C8C1    pop         ebx
 0068C8C2    pop         ecx
 0068C8C3    pop         ebp
 0068C8C4    ret         4
*}
end;

//0068C8C8
{*function TVectorExpression.SetValue(NewValue:Double; ?:?):Boolean;
begin
 0068C8C8    push        ebp
 0068C8C9    mov         ebp,esp
 0068C8CB    push        ebx
 0068C8CC    push        esi
 0068C8CD    push        edi
 0068C8CE    mov         esi,eax
 0068C8D0    cmp         dword ptr [esi+20],0;TVectorExpression.z:TExpression
>0068C8D4    je          0068C900
 0068C8D6    push        0
 0068C8D8    push        0
 0068C8DA    mov         eax,dword ptr [esi+18];TVectorExpression.x:TExpression
 0068C8DD    mov         edx,dword ptr [eax]
 0068C8DF    call        dword ptr [edx+58];TExpression.SetValue
 0068C8E2    push        0
 0068C8E4    push        0
 0068C8E6    mov         eax,dword ptr [esi+1C];TVectorExpression.y:TExpression
 0068C8E9    mov         edx,dword ptr [eax]
 0068C8EB    call        dword ptr [edx+58];TExpression.SetValue
 0068C8EE    push        dword ptr [ebp+0C]
 0068C8F1    push        dword ptr [ebp+8]
 0068C8F4    mov         eax,dword ptr [esi+20];TVectorExpression.z:TExpression
 0068C8F7    mov         edx,dword ptr [eax]
 0068C8F9    call        dword ptr [edx+58];TExpression.SetValue
 0068C8FC    mov         ebx,eax
>0068C8FE    jmp         0068C922
 0068C900    push        dword ptr [ebp+0C]
 0068C903    push        dword ptr [ebp+8]
 0068C906    mov         eax,dword ptr [esi+18];TVectorExpression.x:TExpression
 0068C909    mov         edx,dword ptr [eax]
 0068C90B    call        dword ptr [edx+58];TExpression.SetValue
 0068C90E    mov         ebx,eax
 0068C910    mov         edi,dword ptr [esi+1C];TVectorExpression.y:TExpression
 0068C913    test        edi,edi
>0068C915    je          0068C922
 0068C917    push        0
 0068C919    push        0
 0068C91B    mov         eax,edi
 0068C91D    mov         edx,dword ptr [eax]
 0068C91F    call        dword ptr [edx+58];TExpression.SetValue
 0068C922    mov         eax,ebx
 0068C924    pop         edi
 0068C925    pop         esi
 0068C926    pop         ebx
 0068C927    pop         ebp
 0068C928    ret         8
end;*}

//0068C92C
{*function TVectorExpression.SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;
begin
 0068C92C    push        ebp
 0068C92D    mov         ebp,esp
 0068C92F    push        ebx
 0068C930    push        esi
 0068C931    mov         ebx,eax
 0068C933    mov         esi,dword ptr [ebx+18];TVectorExpression.x:TExpression
 0068C936    test        esi,esi
>0068C938    je          0068C947
 0068C93A    push        dword ptr [ebp+1C]
 0068C93D    push        dword ptr [ebp+18]
 0068C940    mov         eax,esi
 0068C942    mov         edx,dword ptr [eax]
 0068C944    call        dword ptr [edx+58];TExpression.SetValue
 0068C947    mov         esi,dword ptr [ebx+1C];TVectorExpression.y:TExpression
 0068C94A    test        esi,esi
>0068C94C    je          0068C95B
 0068C94E    push        dword ptr [ebp+14]
 0068C951    push        dword ptr [ebp+10]
 0068C954    mov         eax,esi
 0068C956    mov         edx,dword ptr [eax]
 0068C958    call        dword ptr [edx+58];TExpression.SetValue
 0068C95B    mov         esi,dword ptr [ebx+20];TVectorExpression.z:TExpression
 0068C95E    test        esi,esi
>0068C960    je          0068C96F
 0068C962    push        dword ptr [ebp+0C]
 0068C965    push        dword ptr [ebp+8]
 0068C968    mov         eax,esi
 0068C96A    mov         edx,dword ptr [eax]
 0068C96C    call        dword ptr [edx+58];TExpression.SetValue
 0068C96F    mov         al,1
 0068C971    pop         esi
 0068C972    pop         ebx
 0068C973    pop         ebp
 0068C974    ret         18
end;*}

//0068C978
procedure TVectorExpression.Swallow;
begin
{*
 0068C978    push        ebx
 0068C979    push        esi
 0068C97A    mov         ebx,eax
 0068C97C    mov         eax,dword ptr [ebx+18];TVectorExpression.x:TExpression
 0068C97F    mov         edx,dword ptr [eax]
 0068C981    call        dword ptr [edx+88];TExpression.Swallow
 0068C987    mov         eax,dword ptr [ebx+1C];TVectorExpression.y:TExpression
 0068C98A    mov         edx,dword ptr [eax]
 0068C98C    call        dword ptr [edx+88];TExpression.Swallow
 0068C992    mov         esi,dword ptr [ebx+20];TVectorExpression.z:TExpression
 0068C995    test        esi,esi
>0068C997    je          0068C9A3
 0068C999    mov         eax,esi
 0068C99B    mov         edx,dword ptr [eax]
 0068C99D    call        dword ptr [edx+88];TExpression.Swallow
 0068C9A3    pop         esi
 0068C9A4    pop         ebx
 0068C9A5    ret
*}
end;

//0068C9A8
{*procedure TVectorExpression.ToString(?:?);
begin
 0068C9A8    push        ebp
 0068C9A9    mov         ebp,esp
 0068C9AB    push        0
 0068C9AD    push        0
 0068C9AF    push        0
 0068C9B1    push        ebx
 0068C9B2    push        esi
 0068C9B3    push        edi
 0068C9B4    mov         ebx,edx
 0068C9B6    mov         esi,eax
 0068C9B8    xor         eax,eax
 0068C9BA    push        ebp
 0068C9BB    push        68CA5C
 0068C9C0    push        dword ptr fs:[eax]
 0068C9C3    mov         dword ptr fs:[eax],esp
 0068C9C6    mov         eax,ebx
 0068C9C8    mov         edx,68CA78;'['
 0068C9CD    call        @UStrAsg
 0068C9D2    lea         edx,[ebp-4]
 0068C9D5    mov         eax,dword ptr [esi+18];TVectorExpression.x:TExpression
 0068C9D8    mov         ecx,dword ptr [eax]
 0068C9DA    call        dword ptr [ecx-24];TExpression.ToString
 0068C9DD    mov         edx,dword ptr [ebp-4]
 0068C9E0    mov         eax,ebx
 0068C9E2    call        @UStrCat
 0068C9E7    mov         edi,dword ptr [esi+1C];TVectorExpression.y:TExpression
 0068C9EA    test        edi,edi
>0068C9EC    je          0068CA0E
 0068C9EE    push        dword ptr [ebx]
 0068C9F0    push        68CA88;', '
 0068C9F5    lea         edx,[ebp-8]
 0068C9F8    mov         eax,edi
 0068C9FA    mov         ecx,dword ptr [eax]
 0068C9FC    call        dword ptr [ecx-24];TExpression.ToString
 0068C9FF    push        dword ptr [ebp-8]
 0068CA02    mov         eax,ebx
 0068CA04    mov         edx,3
 0068CA09    call        @UStrCatN
 0068CA0E    mov         edi,dword ptr [esi+20];TVectorExpression.z:TExpression
 0068CA11    test        edi,edi
>0068CA13    je          0068CA35
 0068CA15    push        dword ptr [ebx]
 0068CA17    push        68CA88;', '
 0068CA1C    lea         edx,[ebp-0C]
 0068CA1F    mov         eax,edi
 0068CA21    mov         ecx,dword ptr [eax]
 0068CA23    call        dword ptr [ecx-24];TExpression.ToString
 0068CA26    push        dword ptr [ebp-0C]
 0068CA29    mov         eax,ebx
 0068CA2B    mov         edx,3
 0068CA30    call        @UStrCatN
 0068CA35    mov         eax,ebx
 0068CA37    mov         edx,68CA9C;']'
 0068CA3C    call        @UStrCat
 0068CA41    xor         eax,eax
 0068CA43    pop         edx
 0068CA44    pop         ecx
 0068CA45    pop         ecx
 0068CA46    mov         dword ptr fs:[eax],edx
 0068CA49    push        68CA63
 0068CA4E    lea         eax,[ebp-0C]
 0068CA51    mov         edx,3
 0068CA56    call        @UStrArrayClr
 0068CA5B    ret
>0068CA5C    jmp         @HandleFinally
>0068CA61    jmp         0068CA4E
 0068CA63    pop         edi
 0068CA64    pop         esi
 0068CA65    pop         ebx
 0068CA66    mov         esp,ebp
 0068CA68    pop         ebp
 0068CA69    ret
end;*}

//0068CAA0
procedure TArrayExpression.CreateClone;
begin
{*
 0068CAA0    mov         dl,1
 0068CAA2    mov         eax,[0068293C];TArrayExpression
 0068CAA7    call        TObject.Create;TArrayExpression.Create
 0068CAAC    ret
*}
end;

//0068CAB0
destructor TArrayExpression.Destroy();
begin
{*
 0068CAB0    push        ebx
 0068CAB1    push        esi
 0068CAB2    call        @BeforeDestruction
 0068CAB7    mov         ebx,edx
 0068CAB9    mov         esi,eax
 0068CABB    lea         eax,[esi+18];TArrayExpression.Expression:TExpression
 0068CABE    mov         edx,dword ptr [eax]
 0068CAC0    xor         ecx,ecx
 0068CAC2    mov         dword ptr [eax],ecx
 0068CAC4    mov         eax,edx
 0068CAC6    call        TObject.Free
 0068CACB    mov         edx,ebx
 0068CACD    and         dl,0FC
 0068CAD0    mov         eax,esi
 0068CAD2    call        TObject.Destroy
 0068CAD7    test        bl,bl
>0068CAD9    jle         0068CAE2
 0068CADB    mov         eax,esi
 0068CADD    call        @ClassDestroy
 0068CAE2    pop         esi
 0068CAE3    pop         ebx
 0068CAE4    ret
*}
end;

//0068CAE8
function TArrayExpression.GetDataType:TDataType;
begin
{*
 0068CAE8    push        ebx
 0068CAE9    mov         ebx,eax
 0068CAEB    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068CAEE    mov         edx,dword ptr [eax]
 0068CAF0    call        dword ptr [edx+44];TExpression.GetDataType
 0068CAF3    sub         al,4
>0068CAF5    je          0068CB16
 0068CAF7    dec         al
>0068CAF9    je          0068CB01
 0068CAFB    dec         al
>0068CAFD    je          0068CB24
>0068CAFF    jmp         0068CB68
 0068CB01    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CB04    cmp         eax,1
>0068CB07    jl          0068CB12
 0068CB09    cmp         eax,3
>0068CB0C    jg          0068CB12
 0068CB0E    xor         eax,eax
>0068CB10    jmp         0068CB6A
 0068CB12    mov         al,3
 0068CB14    pop         ebx
 0068CB15    ret
 0068CB16    cmp         dword ptr [ebx+1C],0;TArrayExpression.Index:Integer
>0068CB1A    jg          0068CB20
 0068CB1C    mov         al,3
>0068CB1E    jmp         0068CB6A
 0068CB20    mov         al,4
 0068CB22    pop         ebx
 0068CB23    ret
 0068CB24    mov         eax,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068CB27    cmp         eax,1
>0068CB2A    jl          0068CB42
 0068CB2C    cmp         eax,3
>0068CB2F    jg          0068CB42
 0068CB31    mov         edx,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CB34    cmp         edx,1
>0068CB37    jl          0068CB42
 0068CB39    cmp         edx,3
>0068CB3C    jg          0068CB42
 0068CB3E    xor         eax,eax
>0068CB40    jmp         0068CB6A
 0068CB42    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CB45    cmp         eax,1
>0068CB48    jl          0068CB53
 0068CB4A    cmp         eax,3
>0068CB4D    jg          0068CB53
 0068CB4F    mov         al,5
>0068CB51    jmp         0068CB6A
 0068CB53    mov         eax,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068CB56    cmp         eax,1
>0068CB59    jl          0068CB64
 0068CB5B    cmp         eax,3
>0068CB5E    jg          0068CB64
 0068CB60    mov         al,5
>0068CB62    jmp         0068CB6A
 0068CB64    mov         al,3
 0068CB66    pop         ebx
 0068CB67    ret
 0068CB68    mov         al,3
 0068CB6A    pop         ebx
 0068CB6B    ret
*}
end;

//0068CB6C
procedure TArrayExpression.GetPerUnits1;
begin
{*
 0068CB6C    mov         eax,dword ptr [eax+18];TArrayExpression.Expression:TExpression
 0068CB6F    mov         edx,dword ptr [eax]
 0068CB71    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 0068CB74    ret
*}
end;

//0068CB78
procedure TArrayExpression.GetPerUnits2;
begin
{*
 0068CB78    mov         eax,dword ptr [eax+18];TArrayExpression.Expression:TExpression
 0068CB7B    mov         edx,dword ptr [eax]
 0068CB7D    call        dword ptr [edx+50];TExpression.GetPerUnits2
 0068CB80    ret
*}
end;

//0068CB84
{*procedure TArrayExpression.GetString(?:?);
begin
 0068CB84    push        ebp
 0068CB85    mov         ebp,esp
 0068CB87    push        0
 0068CB89    push        ebx
 0068CB8A    push        esi
 0068CB8B    push        edi
 0068CB8C    mov         esi,edx
 0068CB8E    mov         ebx,eax
 0068CB90    xor         eax,eax
 0068CB92    push        ebp
 0068CB93    push        68CC2E
 0068CB98    push        dword ptr fs:[eax]
 0068CB9B    mov         dword ptr fs:[eax],esp
 0068CB9E    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068CBA1    mov         edx,dword ptr [eax]
 0068CBA3    call        dword ptr [edx+44];TExpression.GetDataType
 0068CBA6    cmp         al,4
>0068CBA8    jne         0068CC0F
 0068CBAA    lea         edx,[ebp-4]
 0068CBAD    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068CBB0    mov         ecx,dword ptr [eax]
 0068CBB2    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068CBB5    mov         edi,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CBB8    test        edi,edi
>0068CBBA    jg          0068CBC0
 0068CBBC    mov         al,1
>0068CBBE    jmp         0068CBD1
 0068CBC0    mov         eax,dword ptr [ebp-4]
 0068CBC3    test        eax,eax
>0068CBC5    je          0068CBCC
 0068CBC7    sub         eax,4
 0068CBCA    mov         eax,dword ptr [eax]
 0068CBCC    cmp         eax,edi
 0068CBCE    setl        al
 0068CBD1    test        al,al
>0068CBD3    je          0068CBDE
 0068CBD5    mov         eax,esi
 0068CBD7    call        @UStrClr
>0068CBDC    jmp         0068CC18
 0068CBDE    mov         eax,esi
 0068CBE0    mov         edx,dword ptr [ebp-4]
 0068CBE3    movzx       edx,word ptr [edx+edi*2-2]
 0068CBE8    call        @UStrFromWChar
 0068CBED    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CBF0    mov         edi,dword ptr [ebx+20];TArrayExpression.Index2:Integer
 0068CBF3    cmp         eax,edi
>0068CBF5    je          0068CC18
 0068CBF7    test        edi,edi
>0068CBF9    jle         0068CC18
 0068CBFB    push        esi
 0068CBFC    mov         ecx,edi
 0068CBFE    inc         ecx
 0068CBFF    sub         ecx,dword ptr [ebx+1C]
 0068CC02    mov         edx,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CC05    mov         eax,dword ptr [ebp-4]
 0068CC08    call        @UStrCopy
>0068CC0D    jmp         0068CC18
 0068CC0F    mov         edx,esi
 0068CC11    mov         eax,ebx
 0068CC13    call        TExpression.GetString
 0068CC18    xor         eax,eax
 0068CC1A    pop         edx
 0068CC1B    pop         ecx
 0068CC1C    pop         ecx
 0068CC1D    mov         dword ptr fs:[eax],edx
 0068CC20    push        68CC35
 0068CC25    lea         eax,[ebp-4]
 0068CC28    call        @UStrClr
 0068CC2D    ret
>0068CC2E    jmp         @HandleFinally
>0068CC33    jmp         0068CC25
 0068CC35    pop         edi
 0068CC36    pop         esi
 0068CC37    pop         ebx
 0068CC38    pop         ecx
 0068CC39    pop         ebp
 0068CC3A    ret
end;*}

//0068CC3C
procedure TArrayExpression.GetUnits;
begin
{*
 0068CC3C    mov         eax,dword ptr [eax+18];TArrayExpression.Expression:TExpression
 0068CC3F    mov         edx,dword ptr [eax]
 0068CC41    call        dword ptr [edx+48];TExpression.GetUnits
 0068CC44    ret
*}
end;

//0068CC48
procedure TArrayExpression.GetValue;
begin
{*
 0068CC48    push        ebp
 0068CC49    mov         ebp,esp
 0068CC4B    add         esp,0FFFFFF74
 0068CC51    push        ebx
 0068CC52    push        esi
 0068CC53    xor         edx,edx
 0068CC55    mov         dword ptr [ebp-4],edx
 0068CC58    mov         ebx,eax
 0068CC5A    xor         eax,eax
 0068CC5C    push        ebp
 0068CC5D    push        68CE62
 0068CC62    push        dword ptr fs:[eax]
 0068CC65    mov         dword ptr fs:[eax],esp
 0068CC68    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068CC6B    mov         edx,dword ptr [eax]
 0068CC6D    call        dword ptr [edx+44];TExpression.GetDataType
 0068CC70    sub         al,4
>0068CC72    je          0068CC85
 0068CC74    dec         al
>0068CC76    je          0068CCD7
 0068CC78    dec         al
>0068CC7A    je          0068CD42
>0068CC80    jmp         0068CE44
 0068CC85    lea         edx,[ebp-4]
 0068CC88    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068CC8B    mov         ecx,dword ptr [eax]
 0068CC8D    call        dword ptr [ecx-24];TExpression.ToString
 0068CC90    mov         edx,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CC93    test        edx,edx
>0068CC95    jg          0068CC9B
 0068CC97    mov         al,1
>0068CC99    jmp         0068CCAC
 0068CC9B    mov         eax,dword ptr [ebp-4]
 0068CC9E    test        eax,eax
>0068CCA0    je          0068CCA7
 0068CCA2    sub         eax,4
 0068CCA5    mov         eax,dword ptr [eax]
 0068CCA7    cmp         eax,edx
 0068CCA9    setl        al
 0068CCAC    test        al,al
>0068CCAE    je          0068CCBD
 0068CCB0    xor         eax,eax
 0068CCB2    mov         dword ptr [ebp-10],eax
 0068CCB5    mov         dword ptr [ebp-0C],eax
>0068CCB8    jmp         0068CE4C
 0068CCBD    mov         eax,dword ptr [ebp-4]
 0068CCC0    movzx       eax,word ptr [eax+edx*2-2]
 0068CCC5    movzx       eax,ax
 0068CCC8    mov         dword ptr [ebp-74],eax
 0068CCCB    fild        dword ptr [ebp-74]
 0068CCCE    fstp        qword ptr [ebp-10]
 0068CCD1    wait
>0068CCD2    jmp         0068CE4C
 0068CCD7    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CCDA    test        eax,eax
>0068CCDC    jle         0068CCE3
 0068CCDE    cmp         eax,3
>0068CCE1    jle         0068CCF0
 0068CCE3    xor         eax,eax
 0068CCE5    mov         dword ptr [ebp-10],eax
 0068CCE8    mov         dword ptr [ebp-0C],eax
>0068CCEB    jmp         0068CE4C
 0068CCF0    lea         eax,[ebp-28]
 0068CCF3    push        eax
 0068CCF4    lea         ecx,[ebp-20]
 0068CCF7    lea         edx,[ebp-18]
 0068CCFA    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068CCFD    mov         esi,dword ptr [eax]
 0068CCFF    call        dword ptr [esi+20];TExpression.EvaluateVector
 0068CD02    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CD05    cmp         eax,1
>0068CD08    jne         0068CD1B
 0068CD0A    mov         eax,dword ptr [ebp-18]
 0068CD0D    mov         dword ptr [ebp-10],eax
 0068CD10    mov         eax,dword ptr [ebp-14]
 0068CD13    mov         dword ptr [ebp-0C],eax
>0068CD16    jmp         0068CE4C
 0068CD1B    cmp         eax,2
>0068CD1E    jne         0068CD31
 0068CD20    mov         eax,dword ptr [ebp-20]
 0068CD23    mov         dword ptr [ebp-10],eax
 0068CD26    mov         eax,dword ptr [ebp-1C]
 0068CD29    mov         dword ptr [ebp-0C],eax
>0068CD2C    jmp         0068CE4C
 0068CD31    mov         eax,dword ptr [ebp-28]
 0068CD34    mov         dword ptr [ebp-10],eax
 0068CD37    mov         eax,dword ptr [ebp-24]
 0068CD3A    mov         dword ptr [ebp-0C],eax
>0068CD3D    jmp         0068CE4C
 0068CD42    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CD45    test        eax,eax
>0068CD47    jle         0068CD4E
 0068CD49    cmp         eax,3
>0068CD4C    jle         0068CD67
 0068CD4E    mov         edx,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068CD51    test        edx,edx
>0068CD53    jle         0068CD5A
 0068CD55    cmp         edx,3
>0068CD58    jle         0068CD67
 0068CD5A    xor         eax,eax
 0068CD5C    mov         dword ptr [ebp-10],eax
 0068CD5F    mov         dword ptr [ebp-0C],eax
>0068CD62    jmp         0068CE4C
 0068CD67    mov         eax,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068CD6A    test        eax,eax
>0068CD6C    jle         0068CD73
 0068CD6E    cmp         eax,3
>0068CD71    jle         0068CDC6
 0068CD73    lea         edx,[ebp-70]
 0068CD76    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068CD79    mov         ecx,dword ptr [eax]
 0068CD7B    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068CD7E    mov         esi,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CD81    lea         esi,[esi+esi*2]
 0068CD84    fld         qword ptr [ebp+esi*8-88]
 0068CD8B    fmul        st,st(0)
 0068CD8D    fstp        tbyte ptr [ebp-80]
 0068CD90    wait
 0068CD91    fld         qword ptr [ebp+esi*8-80]
 0068CD95    fmul        st,st(0)
 0068CD97    fld         tbyte ptr [ebp-80]
 0068CD9A    faddp       st(1),st
 0068CD9C    fstp        tbyte ptr [ebp-8C]
 0068CDA2    wait
 0068CDA3    fld         qword ptr [ebp+esi*8-78]
 0068CDA7    fmul        st,st(0)
 0068CDA9    fld         tbyte ptr [ebp-8C]
 0068CDAF    faddp       st(1),st
 0068CDB1    add         esp,0FFFFFFF4
 0068CDB4    fstp        tbyte ptr [esp]
 0068CDB7    wait
 0068CDB8    call        Sqrt
 0068CDBD    fstp        qword ptr [ebp-10]
 0068CDC0    wait
>0068CDC1    jmp         0068CE4C
 0068CDC6    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CDC9    test        eax,eax
>0068CDCB    jle         0068CDD2
 0068CDCD    cmp         eax,3
>0068CDD0    jle         0068CE1C
 0068CDD2    lea         edx,[ebp-70]
 0068CDD5    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068CDD8    mov         ecx,dword ptr [eax]
 0068CDDA    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068CDDD    mov         esi,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068CDE0    fld         qword ptr [ebp+esi*8-78]
 0068CDE4    fmul        st,st(0)
 0068CDE6    fstp        tbyte ptr [ebp-80]
 0068CDE9    wait
 0068CDEA    fld         qword ptr [ebp+esi*8-60]
 0068CDEE    fmul        st,st(0)
 0068CDF0    fld         tbyte ptr [ebp-80]
 0068CDF3    faddp       st(1),st
 0068CDF5    fstp        tbyte ptr [ebp-8C]
 0068CDFB    wait
 0068CDFC    fld         qword ptr [ebp+esi*8-48]
 0068CE00    fmul        st,st(0)
 0068CE02    fld         tbyte ptr [ebp-8C]
 0068CE08    faddp       st(1),st
 0068CE0A    add         esp,0FFFFFFF4
 0068CE0D    fstp        tbyte ptr [esp]
 0068CE10    wait
 0068CE11    call        Sqrt
 0068CE16    fstp        qword ptr [ebp-10]
 0068CE19    wait
>0068CE1A    jmp         0068CE4C
 0068CE1C    lea         edx,[ebp-70]
 0068CE1F    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068CE22    mov         ecx,dword ptr [eax]
 0068CE24    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068CE27    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CE2A    lea         eax,[eax+eax*2]
 0068CE2D    lea         eax,[ebp+eax*8-70]
 0068CE31    mov         edx,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068CE34    mov         ecx,dword ptr [eax+edx*8-20]
 0068CE38    mov         dword ptr [ebp-10],ecx
 0068CE3B    mov         ecx,dword ptr [eax+edx*8-1C]
 0068CE3F    mov         dword ptr [ebp-0C],ecx
>0068CE42    jmp         0068CE4C
 0068CE44    xor         eax,eax
 0068CE46    mov         dword ptr [ebp-10],eax
 0068CE49    mov         dword ptr [ebp-0C],eax
 0068CE4C    xor         eax,eax
 0068CE4E    pop         edx
 0068CE4F    pop         ecx
 0068CE50    pop         ecx
 0068CE51    mov         dword ptr fs:[eax],edx
 0068CE54    push        68CE69
 0068CE59    lea         eax,[ebp-4]
 0068CE5C    call        @UStrClr
 0068CE61    ret
>0068CE62    jmp         @HandleFinally
>0068CE67    jmp         0068CE59
 0068CE69    fld         qword ptr [ebp-10]
 0068CE6C    pop         esi
 0068CE6D    pop         ebx
 0068CE6E    mov         esp,ebp
 0068CE70    pop         ebp
 0068CE71    ret
*}
end;

//0068CE74
procedure TArrayExpression.GetVector(x:Double; y:Double; z:Double);
begin
{*
 0068CE74    push        ebp
 0068CE75    mov         ebp,esp
 0068CE77    add         esp,0FFFFFFB8
 0068CE7A    push        ebx
 0068CE7B    push        esi
 0068CE7C    push        edi
 0068CE7D    mov         edi,ecx
 0068CE7F    mov         esi,edx
 0068CE81    mov         ebx,eax
 0068CE83    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068CE86    mov         edx,dword ptr [eax]
 0068CE88    call        dword ptr [edx+44];TExpression.GetDataType
 0068CE8B    add         al,0FC
 0068CE8D    sub         al,2
>0068CE8F    jb          0068CE98
>0068CE91    je          0068CEAC
>0068CE93    jmp         0068CFB4
 0068CE98    mov         eax,dword ptr [ebp+8]
 0068CE9B    push        eax
 0068CE9C    mov         ecx,edi
 0068CE9E    mov         edx,esi
 0068CEA0    mov         eax,ebx
 0068CEA2    call        TExpression.GetVector
>0068CEA7    jmp         0068CFC3
 0068CEAC    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CEAF    test        eax,eax
>0068CEB1    jle         0068CEB8
 0068CEB3    cmp         eax,3
>0068CEB6    jle         0068CED8
 0068CEB8    mov         edx,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068CEBB    test        edx,edx
>0068CEBD    jle         0068CEC4
 0068CEBF    cmp         edx,3
>0068CEC2    jle         0068CED8
 0068CEC4    mov         eax,dword ptr [ebp+8]
 0068CEC7    push        eax
 0068CEC8    mov         ecx,edi
 0068CECA    mov         edx,esi
 0068CECC    mov         eax,ebx
 0068CECE    call        TExpression.GetVector
>0068CED3    jmp         0068CFC3
 0068CED8    mov         eax,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068CEDB    test        eax,eax
>0068CEDD    jle         0068CEE4
 0068CEDF    cmp         eax,3
>0068CEE2    jle         0068CF30
 0068CEE4    lea         edx,[ebp-48]
 0068CEE7    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068CEEA    mov         ecx,dword ptr [eax]
 0068CEEC    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068CEEF    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CEF2    lea         eax,[eax+eax*2]
 0068CEF5    mov         edx,dword ptr [ebp+eax*8-60]
 0068CEF9    mov         dword ptr [esi],edx
 0068CEFB    mov         edx,dword ptr [ebp+eax*8-5C]
 0068CEFF    mov         dword ptr [esi+4],edx
 0068CF02    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CF05    lea         eax,[eax+eax*2]
 0068CF08    mov         edx,dword ptr [ebp+eax*8-58]
 0068CF0C    mov         dword ptr [edi],edx
 0068CF0E    mov         edx,dword ptr [ebp+eax*8-54]
 0068CF12    mov         dword ptr [edi+4],edx
 0068CF15    mov         eax,dword ptr [ebp+8]
 0068CF18    mov         edx,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CF1B    lea         edx,[edx+edx*2]
 0068CF1E    mov         ecx,dword ptr [ebp+edx*8-50]
 0068CF22    mov         dword ptr [eax],ecx
 0068CF24    mov         ecx,dword ptr [ebp+edx*8-4C]
 0068CF28    mov         dword ptr [eax+4],ecx
>0068CF2B    jmp         0068CFC3
 0068CF30    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CF33    test        eax,eax
>0068CF35    jle         0068CF3C
 0068CF37    cmp         eax,3
>0068CF3A    jle         0068CF7C
 0068CF3C    lea         edx,[ebp-48]
 0068CF3F    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068CF42    mov         ecx,dword ptr [eax]
 0068CF44    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068CF47    mov         eax,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068CF4A    mov         edx,dword ptr [ebp+eax*8-50]
 0068CF4E    mov         dword ptr [esi],edx
 0068CF50    mov         edx,dword ptr [ebp+eax*8-4C]
 0068CF54    mov         dword ptr [esi+4],edx
 0068CF57    mov         eax,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068CF5A    mov         edx,dword ptr [ebp+eax*8-38]
 0068CF5E    mov         dword ptr [edi],edx
 0068CF60    mov         edx,dword ptr [ebp+eax*8-34]
 0068CF64    mov         dword ptr [edi+4],edx
 0068CF67    mov         eax,dword ptr [ebp+8]
 0068CF6A    mov         edx,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068CF6D    mov         ecx,dword ptr [ebp+edx*8-20]
 0068CF71    mov         dword ptr [eax],ecx
 0068CF73    mov         ecx,dword ptr [ebp+edx*8-1C]
 0068CF77    mov         dword ptr [eax+4],ecx
>0068CF7A    jmp         0068CFC3
 0068CF7C    lea         edx,[ebp-48]
 0068CF7F    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068CF82    mov         ecx,dword ptr [eax]
 0068CF84    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068CF87    xor         eax,eax
 0068CF89    mov         dword ptr [esi],eax
 0068CF8B    mov         dword ptr [esi+4],eax
 0068CF8E    xor         eax,eax
 0068CF90    mov         dword ptr [edi],eax
 0068CF92    mov         dword ptr [edi+4],eax
 0068CF95    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068CF98    lea         eax,[eax+eax*2]
 0068CF9B    lea         eax,[ebp+eax*8-48]
 0068CF9F    mov         edx,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068CFA2    mov         ecx,dword ptr [ebp+8]
 0068CFA5    mov         ebx,dword ptr [eax+edx*8-20]
 0068CFA9    mov         dword ptr [ecx],ebx
 0068CFAB    mov         ebx,dword ptr [eax+edx*8-1C]
 0068CFAF    mov         dword ptr [ecx+4],ebx
>0068CFB2    jmp         0068CFC3
 0068CFB4    mov         eax,dword ptr [ebp+8]
 0068CFB7    push        eax
 0068CFB8    mov         ecx,edi
 0068CFBA    mov         edx,esi
 0068CFBC    mov         eax,ebx
 0068CFBE    call        TExpression.GetVector
 0068CFC3    pop         edi
 0068CFC4    pop         esi
 0068CFC5    pop         ebx
 0068CFC6    mov         esp,ebp
 0068CFC8    pop         ebp
 0068CFC9    ret         4
*}
end;

//0068CFCC
procedure TArrayExpression.SetIffy(IsIffy:Boolean);
begin
{*
 0068CFCC    push        esi
 0068CFCD    mov         esi,dword ptr [eax+18];TArrayExpression.Expression:TExpression
 0068CFD0    test        esi,esi
>0068CFD2    je          0068CFDB
 0068CFD4    mov         eax,esi
 0068CFD6    mov         ecx,dword ptr [eax]
 0068CFD8    call        dword ptr [ecx+74];TExpression.SetIffy
 0068CFDB    pop         esi
 0068CFDC    ret
*}
end;

//0068CFE0
function TArrayExpression.SetString(NewValue:string):Boolean;
begin
{*
 0068CFE0    push        ebp
 0068CFE1    mov         ebp,esp
 0068CFE3    xor         ecx,ecx
 0068CFE5    push        ecx
 0068CFE6    push        ecx
 0068CFE7    push        ecx
 0068CFE8    push        ecx
 0068CFE9    push        ebx
 0068CFEA    push        esi
 0068CFEB    push        edi
 0068CFEC    mov         dword ptr [ebp-4],edx
 0068CFEF    mov         ebx,eax
 0068CFF1    mov         eax,dword ptr [ebp-4]
 0068CFF4    call        @UStrAddRef
 0068CFF9    xor         eax,eax
 0068CFFB    push        ebp
 0068CFFC    push        68D09C
 0068D001    push        dword ptr fs:[eax]
 0068D004    mov         dword ptr fs:[eax],esp
 0068D007    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068D00A    mov         edx,dword ptr [eax]
 0068D00C    call        dword ptr [edx+44];TExpression.GetDataType
 0068D00F    sub         al,4
>0068D011    jne         0068D07F
 0068D013    mov         edi,dword ptr [ebx+20];TArrayExpression.Index2:Integer
 0068D016    test        edi,edi
>0068D018    jge         0068D01D
 0068D01A    mov         edi,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068D01D    lea         edx,[ebp-8]
 0068D020    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068D023    mov         ecx,dword ptr [eax]
 0068D025    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068D028    mov         esi,dword ptr [ebp-8]
 0068D02B    test        esi,esi
>0068D02D    je          0068D034
 0068D02F    sub         esi,4
 0068D032    mov         esi,dword ptr [esi]
 0068D034    lea         eax,[ebp-0C]
 0068D037    push        eax
 0068D038    mov         ecx,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068D03B    dec         ecx
 0068D03C    mov         edx,1
 0068D041    mov         eax,dword ptr [ebp-8]
 0068D044    call        @UStrCopy
 0068D049    push        dword ptr [ebp-0C]
 0068D04C    push        dword ptr [ebp-4]
 0068D04F    lea         eax,[ebp-10]
 0068D052    push        eax
 0068D053    lea         edx,[edi+1]
 0068D056    mov         ecx,esi
 0068D058    mov         eax,dword ptr [ebp-8]
 0068D05B    call        @UStrCopy
 0068D060    push        dword ptr [ebp-10]
 0068D063    lea         eax,[ebp-8]
 0068D066    mov         edx,3
 0068D06B    call        @UStrCatN
 0068D070    mov         edx,dword ptr [ebp-8]
 0068D073    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068D076    mov         ecx,dword ptr [eax]
 0068D078    call        dword ptr [ecx+5C];TExpression.SetString
 0068D07B    mov         ebx,eax
>0068D07D    jmp         0068D081
 0068D07F    xor         ebx,ebx
 0068D081    xor         eax,eax
 0068D083    pop         edx
 0068D084    pop         ecx
 0068D085    pop         ecx
 0068D086    mov         dword ptr fs:[eax],edx
 0068D089    push        68D0A3
 0068D08E    lea         eax,[ebp-10]
 0068D091    mov         edx,4
 0068D096    call        @UStrArrayClr
 0068D09B    ret
>0068D09C    jmp         @HandleFinally
>0068D0A1    jmp         0068D08E
 0068D0A3    mov         eax,ebx
 0068D0A5    pop         edi
 0068D0A6    pop         esi
 0068D0A7    pop         ebx
 0068D0A8    mov         esp,ebp
 0068D0AA    pop         ebp
 0068D0AB    ret
*}
end;

//0068D0AC
{*function TArrayExpression.SetValue(NewValue:Double; ?:?):Boolean;
begin
 0068D0AC    push        ebp
 0068D0AD    mov         ebp,esp
 0068D0AF    add         esp,0FFFFFF8C
 0068D0B2    push        ebx
 0068D0B3    push        esi
 0068D0B4    push        edi
 0068D0B5    xor         edx,edx
 0068D0B7    mov         dword ptr [ebp-74],edx
 0068D0BA    mov         dword ptr [ebp-4],edx
 0068D0BD    mov         dword ptr [ebp-8],edx
 0068D0C0    mov         dword ptr [ebp-0C],edx
 0068D0C3    mov         esi,eax
 0068D0C5    xor         eax,eax
 0068D0C7    push        ebp
 0068D0C8    push        68D2F0
 0068D0CD    push        dword ptr fs:[eax]
 0068D0D0    mov         dword ptr fs:[eax],esp
 0068D0D3    mov         eax,dword ptr [esi+18];TArrayExpression.Expression:TExpression
 0068D0D6    mov         edx,dword ptr [eax]
 0068D0D8    call        dword ptr [edx+44];TExpression.GetDataType
 0068D0DB    sub         al,4
>0068D0DD    je          0068D175
 0068D0E3    dec         al
>0068D0E5    je          0068D0F4
 0068D0E7    dec         al
>0068D0E9    je          0068D1FB
>0068D0EF    jmp         0068D2CB
 0068D0F4    mov         eax,dword ptr [esi+1C];TArrayExpression.Index:Integer
 0068D0F7    cmp         eax,1
>0068D0FA    jl          0068D16E
 0068D0FC    cmp         eax,3
>0068D0FF    jg          0068D16E
 0068D101    lea         eax,[ebp-28]
 0068D104    push        eax
 0068D105    lea         ecx,[ebp-20]
 0068D108    lea         edx,[ebp-18]
 0068D10B    mov         eax,dword ptr [esi+18];TArrayExpression.Expression:TExpression
 0068D10E    mov         ebx,dword ptr [eax]
 0068D110    call        dword ptr [ebx+20];TExpression.EvaluateVector
 0068D113    mov         eax,dword ptr [esi+1C];TArrayExpression.Index:Integer
 0068D116    cmp         eax,1
>0068D119    jne         0068D129
 0068D11B    mov         eax,dword ptr [ebp+8]
 0068D11E    mov         dword ptr [ebp-18],eax
 0068D121    mov         eax,dword ptr [ebp+0C]
 0068D124    mov         dword ptr [ebp-14],eax
>0068D127    jmp         0068D14D
 0068D129    cmp         eax,2
>0068D12C    jne         0068D13C
 0068D12E    mov         eax,dword ptr [ebp+8]
 0068D131    mov         dword ptr [ebp-20],eax
 0068D134    mov         eax,dword ptr [ebp+0C]
 0068D137    mov         dword ptr [ebp-1C],eax
>0068D13A    jmp         0068D14D
 0068D13C    cmp         eax,3
>0068D13F    jne         0068D14D
 0068D141    mov         eax,dword ptr [ebp+8]
 0068D144    mov         dword ptr [ebp-28],eax
 0068D147    mov         eax,dword ptr [ebp+0C]
 0068D14A    mov         dword ptr [ebp-24],eax
 0068D14D    push        dword ptr [ebp-14]
 0068D150    push        dword ptr [ebp-18]
 0068D153    push        dword ptr [ebp-1C]
 0068D156    push        dword ptr [ebp-20]
 0068D159    push        dword ptr [ebp-24]
 0068D15C    push        dword ptr [ebp-28]
 0068D15F    mov         eax,dword ptr [esi+18];TArrayExpression.Expression:TExpression
 0068D162    mov         edx,dword ptr [eax]
 0068D164    call        dword ptr [edx+60];TExpression.SetVector
 0068D167    mov         ebx,eax
>0068D169    jmp         0068D2CD
 0068D16E    xor         ebx,ebx
>0068D170    jmp         0068D2CD
 0068D175    mov         edi,dword ptr [esi+20];TArrayExpression.Index2:Integer
 0068D178    test        edi,edi
>0068D17A    jge         0068D17F
 0068D17C    mov         edi,dword ptr [esi+1C];TArrayExpression.Index:Integer
 0068D17F    lea         edx,[ebp-4]
 0068D182    mov         eax,dword ptr [esi+18];TArrayExpression.Expression:TExpression
 0068D185    mov         ecx,dword ptr [eax]
 0068D187    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068D18A    lea         eax,[ebp-0C]
 0068D18D    push        eax
 0068D18E    mov         ecx,dword ptr [esi+1C];TArrayExpression.Index:Integer
 0068D191    dec         ecx
 0068D192    mov         edx,1
 0068D197    mov         eax,dword ptr [ebp-4]
 0068D19A    call        @UStrCopy
 0068D19F    fld         qword ptr [ebp+8]
 0068D1A2    add         esp,0FFFFFFF4
 0068D1A5    fstp        tbyte ptr [esp]
 0068D1A8    wait
 0068D1A9    lea         edx,[ebp-8]
 0068D1AC    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 0068D1B1    call        FloatToStr
 0068D1B6    mov         ebx,dword ptr [ebp-4]
 0068D1B9    test        ebx,ebx
>0068D1BB    je          0068D1C2
 0068D1BD    sub         ebx,4
 0068D1C0    mov         ebx,dword ptr [ebx]
 0068D1C2    push        dword ptr [ebp-0C]
 0068D1C5    push        dword ptr [ebp-8]
 0068D1C8    lea         eax,[ebp-74]
 0068D1CB    push        eax
 0068D1CC    lea         edx,[edi+1]
 0068D1CF    mov         ecx,ebx
 0068D1D1    mov         eax,dword ptr [ebp-4]
 0068D1D4    call        @UStrCopy
 0068D1D9    push        dword ptr [ebp-74]
 0068D1DC    lea         eax,[ebp-4]
 0068D1DF    mov         edx,3
 0068D1E4    call        @UStrCatN
 0068D1E9    mov         edx,dword ptr [ebp-4]
 0068D1EC    mov         eax,dword ptr [esi+18];TArrayExpression.Expression:TExpression
 0068D1EF    mov         ecx,dword ptr [eax]
 0068D1F1    call        dword ptr [ecx+5C];TExpression.SetString
 0068D1F4    mov         ebx,eax
>0068D1F6    jmp         0068D2CD
 0068D1FB    mov         eax,dword ptr [esi+1C];TArrayExpression.Index:Integer
 0068D1FE    test        eax,eax
>0068D200    jle         0068D207
 0068D202    cmp         eax,3
>0068D205    jle         0068D21A
 0068D207    mov         edx,dword ptr [esi+24];TArrayExpression.CIndex:Integer
 0068D20A    test        edx,edx
>0068D20C    jle         0068D213
 0068D20E    cmp         edx,3
>0068D211    jle         0068D21A
 0068D213    xor         ebx,ebx
>0068D215    jmp         0068D2CD
 0068D21A    mov         eax,dword ptr [esi+24];TArrayExpression.CIndex:Integer
 0068D21D    test        eax,eax
>0068D21F    jle         0068D226
 0068D221    cmp         eax,3
>0068D224    jle         0068D258
 0068D226    lea         edx,[ebp-70]
 0068D229    mov         eax,dword ptr [esi+18];TArrayExpression.Expression:TExpression
 0068D22C    mov         ecx,dword ptr [eax]
 0068D22E    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068D231    mov         eax,dword ptr [esi+1C];TArrayExpression.Index:Integer
 0068D234    lea         edx,[eax+eax*2]
 0068D237    lea         edx,[ebp+edx*8-70]
 0068D23B    mov         ecx,dword ptr [ebp+8]
 0068D23E    mov         dword ptr [edx+eax*8-20],ecx
 0068D242    mov         ecx,dword ptr [ebp+0C]
 0068D245    mov         dword ptr [edx+eax*8-1C],ecx
 0068D249    lea         edx,[ebp-70]
 0068D24C    mov         eax,dword ptr [esi+18];TArrayExpression.Expression:TExpression
 0068D24F    mov         ecx,dword ptr [eax]
 0068D251    call        dword ptr [ecx+64];TExpression.SetMatrix
 0068D254    mov         ebx,eax
>0068D256    jmp         0068D2CD
 0068D258    mov         eax,dword ptr [esi+1C];TArrayExpression.Index:Integer
 0068D25B    test        eax,eax
>0068D25D    jle         0068D264
 0068D25F    cmp         eax,3
>0068D262    jle         0068D296
 0068D264    lea         edx,[ebp-70]
 0068D267    mov         eax,dword ptr [esi+18];TArrayExpression.Expression:TExpression
 0068D26A    mov         ecx,dword ptr [eax]
 0068D26C    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068D26F    mov         eax,dword ptr [esi+24];TArrayExpression.CIndex:Integer
 0068D272    lea         edx,[eax+eax*2]
 0068D275    lea         edx,[ebp+edx*8-70]
 0068D279    mov         ecx,dword ptr [ebp+8]
 0068D27C    mov         dword ptr [edx+eax*8-20],ecx
 0068D280    mov         ecx,dword ptr [ebp+0C]
 0068D283    mov         dword ptr [edx+eax*8-1C],ecx
 0068D287    lea         edx,[ebp-70]
 0068D28A    mov         eax,dword ptr [esi+18];TArrayExpression.Expression:TExpression
 0068D28D    mov         ecx,dword ptr [eax]
 0068D28F    call        dword ptr [ecx+64];TExpression.SetMatrix
 0068D292    mov         ebx,eax
>0068D294    jmp         0068D2CD
 0068D296    lea         edx,[ebp-70]
 0068D299    mov         eax,dword ptr [esi+18];TArrayExpression.Expression:TExpression
 0068D29C    mov         ecx,dword ptr [eax]
 0068D29E    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068D2A1    mov         eax,dword ptr [esi+1C];TArrayExpression.Index:Integer
 0068D2A4    lea         eax,[eax+eax*2]
 0068D2A7    lea         eax,[ebp+eax*8-70]
 0068D2AB    mov         edx,dword ptr [esi+24];TArrayExpression.CIndex:Integer
 0068D2AE    mov         ecx,dword ptr [ebp+8]
 0068D2B1    mov         dword ptr [eax+edx*8-20],ecx
 0068D2B5    mov         ecx,dword ptr [ebp+0C]
 0068D2B8    mov         dword ptr [eax+edx*8-1C],ecx
 0068D2BC    lea         edx,[ebp-70]
 0068D2BF    mov         eax,dword ptr [esi+18];TArrayExpression.Expression:TExpression
 0068D2C2    mov         ecx,dword ptr [eax]
 0068D2C4    call        dword ptr [ecx+64];TExpression.SetMatrix
 0068D2C7    mov         ebx,eax
>0068D2C9    jmp         0068D2CD
 0068D2CB    xor         ebx,ebx
 0068D2CD    xor         eax,eax
 0068D2CF    pop         edx
 0068D2D0    pop         ecx
 0068D2D1    pop         ecx
 0068D2D2    mov         dword ptr fs:[eax],edx
 0068D2D5    push        68D2F7
 0068D2DA    lea         eax,[ebp-74]
 0068D2DD    call        @UStrClr
 0068D2E2    lea         eax,[ebp-0C]
 0068D2E5    mov         edx,3
 0068D2EA    call        @UStrArrayClr
 0068D2EF    ret
>0068D2F0    jmp         @HandleFinally
>0068D2F5    jmp         0068D2DA
 0068D2F7    mov         eax,ebx
 0068D2F9    pop         edi
 0068D2FA    pop         esi
 0068D2FB    pop         ebx
 0068D2FC    mov         esp,ebp
 0068D2FE    pop         ebp
 0068D2FF    ret         8
end;*}

//0068D304
{*function TArrayExpression.SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;
begin
 0068D304    push        ebp
 0068D305    mov         ebp,esp
 0068D307    add         esp,0FFFFFFA0
 0068D30A    push        ebx
 0068D30B    mov         ebx,eax
 0068D30D    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068D310    mov         edx,dword ptr [eax]
 0068D312    call        dword ptr [edx+44];TExpression.GetDataType
 0068D315    add         al,0FC
 0068D317    sub         al,2
>0068D319    jb          0068D322
>0068D31B    je          0068D340
>0068D31D    jmp         0068D45E
 0068D322    push        dword ptr [ebp+1C]
 0068D325    push        dword ptr [ebp+18]
 0068D328    push        dword ptr [ebp+14]
 0068D32B    push        dword ptr [ebp+10]
 0068D32E    push        dword ptr [ebp+0C]
 0068D331    push        dword ptr [ebp+8]
 0068D334    mov         eax,ebx
 0068D336    call        TExpression.SetVector
>0068D33B    jmp         0068D460
 0068D340    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068D343    test        eax,eax
>0068D345    jle         0068D34C
 0068D347    cmp         eax,3
>0068D34A    jle         0068D35F
 0068D34C    mov         edx,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068D34F    test        edx,edx
>0068D351    jle         0068D358
 0068D353    cmp         edx,3
>0068D356    jle         0068D35F
 0068D358    xor         eax,eax
>0068D35A    jmp         0068D460
 0068D35F    mov         eax,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068D362    test        eax,eax
>0068D364    jle         0068D36B
 0068D366    cmp         eax,3
>0068D369    jle         0068D3B6
 0068D36B    lea         edx,[ebp-48]
 0068D36E    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068D371    mov         ecx,dword ptr [eax]
 0068D373    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068D376    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068D379    lea         eax,[eax+eax*2]
 0068D37C    mov         edx,dword ptr [ebp+18]
 0068D37F    mov         dword ptr [ebp+eax*8-60],edx
 0068D383    mov         edx,dword ptr [ebp+1C]
 0068D386    mov         dword ptr [ebp+eax*8-5C],edx
 0068D38A    mov         edx,dword ptr [ebp+10]
 0068D38D    mov         dword ptr [ebp+eax*8-58],edx
 0068D391    mov         edx,dword ptr [ebp+14]
 0068D394    mov         dword ptr [ebp+eax*8-54],edx
 0068D398    mov         edx,dword ptr [ebp+8]
 0068D39B    mov         dword ptr [ebp+eax*8-50],edx
 0068D39F    mov         edx,dword ptr [ebp+0C]
 0068D3A2    mov         dword ptr [ebp+eax*8-4C],edx
 0068D3A6    lea         edx,[ebp-48]
 0068D3A9    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068D3AC    mov         ecx,dword ptr [eax]
 0068D3AE    call        dword ptr [ecx+64];TExpression.SetMatrix
>0068D3B1    jmp         0068D460
 0068D3B6    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068D3B9    test        eax,eax
>0068D3BB    jle         0068D3C2
 0068D3BD    cmp         eax,3
>0068D3C0    jle         0068D407
 0068D3C2    lea         edx,[ebp-48]
 0068D3C5    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068D3C8    mov         ecx,dword ptr [eax]
 0068D3CA    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068D3CD    mov         eax,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068D3D0    mov         edx,dword ptr [ebp+18]
 0068D3D3    mov         dword ptr [ebp+eax*8-50],edx
 0068D3D7    mov         edx,dword ptr [ebp+1C]
 0068D3DA    mov         dword ptr [ebp+eax*8-4C],edx
 0068D3DE    mov         edx,dword ptr [ebp+10]
 0068D3E1    mov         dword ptr [ebp+eax*8-38],edx
 0068D3E5    mov         edx,dword ptr [ebp+14]
 0068D3E8    mov         dword ptr [ebp+eax*8-34],edx
 0068D3EC    mov         edx,dword ptr [ebp+8]
 0068D3EF    mov         dword ptr [ebp+eax*8-20],edx
 0068D3F3    mov         edx,dword ptr [ebp+0C]
 0068D3F6    mov         dword ptr [ebp+eax*8-1C],edx
 0068D3FA    lea         edx,[ebp-48]
 0068D3FD    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068D400    mov         ecx,dword ptr [eax]
 0068D402    call        dword ptr [ecx+64];TExpression.SetMatrix
>0068D405    jmp         0068D460
 0068D407    lea         edx,[ebp-48]
 0068D40A    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068D40D    mov         ecx,dword ptr [eax]
 0068D40F    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068D412    fld         qword ptr [ebp+18]
 0068D415    fmul        st,st(0)
 0068D417    fstp        tbyte ptr [ebp-54]
 0068D41A    wait
 0068D41B    fld         qword ptr [ebp+10]
 0068D41E    fmul        st,st(0)
 0068D420    fld         tbyte ptr [ebp-54]
 0068D423    faddp       st(1),st
 0068D425    fstp        tbyte ptr [ebp-60]
 0068D428    wait
 0068D429    fld         qword ptr [ebp+8]
 0068D42C    fmul        st,st(0)
 0068D42E    fld         tbyte ptr [ebp-60]
 0068D431    faddp       st(1),st
 0068D433    add         esp,0FFFFFFF4
 0068D436    fstp        tbyte ptr [esp]
 0068D439    wait
 0068D43A    call        Sqrt
 0068D43F    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068D442    lea         eax,[eax+eax*2]
 0068D445    lea         eax,[ebp+eax*8-48]
 0068D449    mov         edx,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068D44C    fstp        qword ptr [eax+edx*8-20]
 0068D450    wait
 0068D451    lea         edx,[ebp-48]
 0068D454    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068D457    mov         ecx,dword ptr [eax]
 0068D459    call        dword ptr [ecx+64];TExpression.SetMatrix
>0068D45C    jmp         0068D460
 0068D45E    xor         eax,eax
 0068D460    pop         ebx
 0068D461    mov         esp,ebp
 0068D463    pop         ebp
 0068D464    ret         18
end;*}

//0068D468
procedure TArrayExpression.Swallow;
begin
{*
 0068D468    push        ebx
 0068D469    mov         ebx,eax
 0068D46B    mov         eax,ebx
 0068D46D    call        TExpression.Swallow
 0068D472    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068D475    mov         edx,dword ptr [eax]
 0068D477    call        dword ptr [edx+88];TExpression.Swallow
 0068D47D    pop         ebx
 0068D47E    ret
*}
end;

//0068D480
{*procedure TArrayExpression.ToString(?:?);
begin
 0068D480    push        ebp
 0068D481    mov         ebp,esp
 0068D483    xor         ecx,ecx
 0068D485    push        ecx
 0068D486    push        ecx
 0068D487    push        ecx
 0068D488    push        ecx
 0068D489    push        ecx
 0068D48A    push        ebx
 0068D48B    push        esi
 0068D48C    mov         esi,edx
 0068D48E    mov         ebx,eax
 0068D490    xor         eax,eax
 0068D492    push        ebp
 0068D493    push        68D538
 0068D498    push        dword ptr fs:[eax]
 0068D49B    mov         dword ptr fs:[eax],esp
 0068D49E    cmp         dword ptr [ebx+24],0;TArrayExpression.CIndex:Integer
>0068D4A2    jne         0068D4D8
 0068D4A4    lea         edx,[ebp-4]
 0068D4A7    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068D4AA    mov         ecx,dword ptr [eax]
 0068D4AC    call        dword ptr [ecx-24];TExpression.ToString
 0068D4AF    push        dword ptr [ebp-4]
 0068D4B2    push        68D554;'['
 0068D4B7    lea         edx,[ebp-8]
 0068D4BA    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068D4BD    call        IntToStr
 0068D4C2    push        dword ptr [ebp-8]
 0068D4C5    push        68D564;']'
 0068D4CA    mov         eax,esi
 0068D4CC    mov         edx,4
 0068D4D1    call        @UStrCatN
>0068D4D6    jmp         0068D51D
 0068D4D8    lea         edx,[ebp-0C]
 0068D4DB    mov         eax,dword ptr [ebx+18];TArrayExpression.Expression:TExpression
 0068D4DE    mov         ecx,dword ptr [eax]
 0068D4E0    call        dword ptr [ecx-24];TExpression.ToString
 0068D4E3    push        dword ptr [ebp-0C]
 0068D4E6    push        68D554;'['
 0068D4EB    lea         edx,[ebp-10]
 0068D4EE    mov         eax,dword ptr [ebx+1C];TArrayExpression.Index:Integer
 0068D4F1    call        IntToStr
 0068D4F6    push        dword ptr [ebp-10]
 0068D4F9    push        68D574;', '
 0068D4FE    lea         edx,[ebp-14]
 0068D501    mov         eax,dword ptr [ebx+24];TArrayExpression.CIndex:Integer
 0068D504    call        IntToStr
 0068D509    push        dword ptr [ebp-14]
 0068D50C    push        68D564;']'
 0068D511    mov         eax,esi
 0068D513    mov         edx,6
 0068D518    call        @UStrCatN
 0068D51D    xor         eax,eax
 0068D51F    pop         edx
 0068D520    pop         ecx
 0068D521    pop         ecx
 0068D522    mov         dword ptr fs:[eax],edx
 0068D525    push        68D53F
 0068D52A    lea         eax,[ebp-14]
 0068D52D    mov         edx,5
 0068D532    call        @UStrArrayClr
 0068D537    ret
>0068D538    jmp         @HandleFinally
>0068D53D    jmp         0068D52A
 0068D53F    pop         esi
 0068D540    pop         ebx
 0068D541    mov         esp,ebp
 0068D543    pop         ebp
 0068D544    ret
end;*}

//0068D57C
procedure TMatrixExpression.CreateClone;
begin
{*
 0068D57C    mov         dl,1
 0068D57E    mov         eax,[00682414];TMatrixExpression
 0068D583    call        TObject.Create;TMatrixExpression.Create
 0068D588    ret
*}
end;

//0068D58C
destructor TMatrixExpression.Destroy();
begin
{*
 0068D58C    push        ebx
 0068D58D    push        esi
 0068D58E    push        edi
 0068D58F    push        ecx
 0068D590    call        @BeforeDestruction
 0068D595    mov         byte ptr [esp],dl
 0068D598    mov         edi,eax
 0068D59A    xor         esi,esi
 0068D59C    xor         ebx,ebx
 0068D59E    lea         eax,[esi+esi*2]
 0068D5A1    lea         eax,[edi+eax*4]
 0068D5A4    lea         eax,[eax+ebx*4+18]
 0068D5A8    mov         edx,dword ptr [eax]
 0068D5AA    xor         ecx,ecx
 0068D5AC    mov         dword ptr [eax],ecx
 0068D5AE    mov         eax,edx
 0068D5B0    call        TObject.Free
 0068D5B5    inc         ebx
 0068D5B6    cmp         ebx,3
>0068D5B9    jne         0068D59E
 0068D5BB    inc         esi
 0068D5BC    cmp         esi,3
>0068D5BF    jne         0068D59C
 0068D5C1    movzx       edx,byte ptr [esp]
 0068D5C5    and         dl,0FC
 0068D5C8    mov         eax,edi
 0068D5CA    call        TObject.Destroy
 0068D5CF    cmp         byte ptr [esp],0
>0068D5D3    jle         0068D5DC
 0068D5D5    mov         eax,edi
 0068D5D7    call        @ClassDestroy
 0068D5DC    pop         edx
 0068D5DD    pop         edi
 0068D5DE    pop         esi
 0068D5DF    pop         ebx
 0068D5E0    ret
*}
end;

//0068D5E4
procedure TMatrixExpression.FillClone(c:TExpression);
begin
{*
 0068D5E4    push        ebx
 0068D5E5    push        esi
 0068D5E6    push        edi
 0068D5E7    push        ebp
 0068D5E8    push        ecx
 0068D5E9    mov         dword ptr [esp],edx
 0068D5EC    mov         ebp,eax
 0068D5EE    xor         esi,esi
 0068D5F0    xor         ebx,ebx
 0068D5F2    lea         edi,[esi+esi*2]
 0068D5F5    lea         eax,[ebp+edi*4]
 0068D5F9    mov         eax,dword ptr [eax+ebx*4+18]
 0068D5FD    call        TExpression.Clone
 0068D602    mov         edx,dword ptr [esp]
 0068D605    lea         edx,[edx+edi*4]
 0068D608    mov         dword ptr [edx+ebx*4+18],eax
 0068D60C    inc         ebx
 0068D60D    cmp         ebx,3
>0068D610    jne         0068D5F2
 0068D612    inc         esi
 0068D613    cmp         esi,3
>0068D616    jne         0068D5F0
 0068D618    pop         edx
 0068D619    pop         ebp
 0068D61A    pop         edi
 0068D61B    pop         esi
 0068D61C    pop         ebx
 0068D61D    ret
*}
end;

//0068D620
function TMatrixExpression.GetDataType:TDataType;
begin
{*
 0068D620    mov         al,6
 0068D622    ret
*}
end;

//0068D624
procedure TMatrixExpression.GetPerUnits1;
begin
{*
 0068D624    mov         eax,dword ptr [eax+18];TMatrixExpression......m:?
 0068D627    mov         edx,dword ptr [eax]
 0068D629    call        dword ptr [edx+4C]
 0068D62C    ret
*}
end;

//0068D630
procedure TMatrixExpression.GetPerUnits2;
begin
{*
 0068D630    mov         eax,dword ptr [eax+18];TMatrixExpression......m:?
 0068D633    mov         edx,dword ptr [eax]
 0068D635    call        dword ptr [edx+50]
 0068D638    ret
*}
end;

//0068D63C
procedure TMatrixExpression.GetRotMat(m:TRotMat);
begin
{*
 0068D63C    push        ebx
 0068D63D    push        esi
 0068D63E    push        edi
 0068D63F    push        ebp
 0068D640    add         esp,0FFFFFFF8
 0068D643    mov         dword ptr [esp],edx
 0068D646    mov         edi,eax
 0068D648    xor         ebp,ebp
 0068D64A    mov         eax,dword ptr [esp]
 0068D64D    mov         dword ptr [esp+4],eax
 0068D651    xor         esi,esi
 0068D653    mov         eax,dword ptr [esp+4]
 0068D657    mov         ebx,eax
 0068D659    lea         eax,[ebp+ebp*2]
 0068D65D    lea         eax,[edi+eax*4]
 0068D660    mov         eax,dword ptr [eax+esi*4+18]
 0068D664    mov         edx,dword ptr [edi+18];TMatrixExpression......m:?
 0068D667    mov         ecx,dword ptr [eax]
 0068D669    call        dword ptr [ecx+14]
 0068D66C    fstp        qword ptr [ebx]
 0068D66E    wait
 0068D66F    inc         esi
 0068D670    add         ebx,8
 0068D673    cmp         esi,3
>0068D676    jne         0068D659
 0068D678    inc         ebp
 0068D679    add         dword ptr [esp+4],18
 0068D67E    cmp         ebp,3
>0068D681    jne         0068D651
 0068D683    pop         ecx
 0068D684    pop         edx
 0068D685    pop         ebp
 0068D686    pop         edi
 0068D687    pop         esi
 0068D688    pop         ebx
 0068D689    ret
*}
end;

//0068D68C
procedure TMatrixExpression.GetUnits;
begin
{*
 0068D68C    mov         eax,dword ptr [eax+18];TMatrixExpression......m:?
 0068D68F    mov         edx,dword ptr [eax]
 0068D691    call        dword ptr [edx+48]
 0068D694    ret
*}
end;

//0068D698
procedure TMatrixExpression.GetValue;
begin
{*
 0068D698    add         esp,0FFFFFFB0
 0068D69B    lea         edx,[esp+8]
 0068D69F    mov         ecx,dword ptr [eax]
 0068D6A1    call        dword ptr [ecx+40];TMatrixExpression.GetRotMat
 0068D6A4    lea         eax,[esp+8]
 0068D6A8    call        005C3B88
 0068D6AD    fstp        qword ptr [esp]
 0068D6B0    wait
 0068D6B1    fld         qword ptr [esp]
 0068D6B4    add         esp,50
 0068D6B7    ret
*}
end;

//0068D6B8
procedure TMatrixExpression.GetVector(x:Double; y:Double; z:Double);
begin
{*
 0068D6B8    push        ebp
 0068D6B9    mov         ebp,esp
 0068D6BB    push        ebx
 0068D6BC    push        esi
 0068D6BD    push        edi
 0068D6BE    mov         edi,ecx
 0068D6C0    mov         esi,edx
 0068D6C2    mov         ebx,eax
 0068D6C4    mov         edx,dword ptr [ebx+18];TMatrixExpression......m:?
 0068D6C7    mov         eax,dword ptr [ebx+30];TMatrixExpression.?f30:TExpression
 0068D6CA    mov         ecx,dword ptr [eax]
 0068D6CC    call        dword ptr [ecx+14]
 0068D6CF    fstp        qword ptr [esi]
 0068D6D1    wait
 0068D6D2    mov         edx,dword ptr [ebx+18];TMatrixExpression......m:?
 0068D6D5    mov         eax,dword ptr [ebx+34];TMatrixExpression.?f34:TExpression
 0068D6D8    mov         ecx,dword ptr [eax]
 0068D6DA    call        dword ptr [ecx+14]
 0068D6DD    fstp        qword ptr [edi]
 0068D6DF    wait
 0068D6E0    mov         edx,dword ptr [ebx+18];TMatrixExpression......m:?
 0068D6E3    mov         eax,dword ptr [ebx+38];TMatrixExpression.?f38:TExpression
 0068D6E6    mov         ecx,dword ptr [eax]
 0068D6E8    call        dword ptr [ecx+14]
 0068D6EB    mov         eax,dword ptr [ebp+8]
 0068D6EE    fstp        qword ptr [eax]
 0068D6F0    wait
 0068D6F1    pop         edi
 0068D6F2    pop         esi
 0068D6F3    pop         ebx
 0068D6F4    pop         ebp
 0068D6F5    ret         4
*}
end;

//0068D6F8
procedure TMatrixExpression.SetIffy(IsIffy:Boolean);
begin
{*
 0068D6F8    push        ebx
 0068D6F9    push        esi
 0068D6FA    push        edi
 0068D6FB    push        ebp
 0068D6FC    mov         ebx,edx
 0068D6FE    mov         edi,eax
 0068D700    xor         esi,esi
 0068D702    xor         ebp,ebp
 0068D704    lea         eax,[esi+esi*2]
 0068D707    lea         eax,[edi+eax*4]
 0068D70A    mov         eax,dword ptr [eax+ebp*4+18]
 0068D70E    mov         edx,ebx
 0068D710    mov         ecx,dword ptr [eax]
 0068D712    call        dword ptr [ecx+74]
 0068D715    inc         ebp
 0068D716    cmp         ebp,3
>0068D719    jne         0068D704
 0068D71B    inc         esi
 0068D71C    cmp         esi,3
>0068D71F    jne         0068D702
 0068D721    pop         ebp
 0068D722    pop         edi
 0068D723    pop         esi
 0068D724    pop         ebx
 0068D725    ret
*}
end;

//0068D728
function TMatrixExpression.SetUnits(NewUnits:TUnits; NewPerUnits1:TUnits; NewPerUnits2:TUnits):Boolean;
begin
{*
 0068D728    push        ebp
 0068D729    mov         ebp,esp
 0068D72B    push        ecx
 0068D72C    push        ebx
 0068D72D    push        esi
 0068D72E    push        edi
 0068D72F    mov         byte ptr [ebp-2],cl
 0068D732    mov         byte ptr [ebp-1],dl
 0068D735    mov         edi,eax
 0068D737    xor         esi,esi
 0068D739    xor         ebx,ebx
 0068D73B    lea         eax,[esi+esi*2]
 0068D73E    lea         eax,[edi+eax*4]
 0068D741    mov         eax,dword ptr [eax+ebx*4+18]
 0068D745    mov         edx,dword ptr ds:[5D0F60];TVariableExpression
 0068D74B    call        @IsClass
 0068D750    test        al,al
>0068D752    je          0068D781
 0068D754    lea         eax,[esi+esi*2]
 0068D757    lea         eax,[edi+eax*4]
 0068D75A    mov         eax,dword ptr [eax+ebx*4+18]
 0068D75E    xor         edx,edx
 0068D760    call        TVariableExpression.SetDataType
 0068D765    movzx       eax,byte ptr [ebp+8]
 0068D769    push        eax
 0068D76A    lea         eax,[esi+esi*2]
 0068D76D    lea         eax,[edi+eax*4]
 0068D770    mov         eax,dword ptr [eax+ebx*4+18]
 0068D774    movzx       ecx,byte ptr [ebp-2]
 0068D778    movzx       edx,byte ptr [ebp-1]
 0068D77C    call        TVariableExpression.SetUnits
 0068D781    inc         ebx
 0068D782    cmp         ebx,3
>0068D785    jne         0068D73B
 0068D787    inc         esi
 0068D788    cmp         esi,3
>0068D78B    jne         0068D739
 0068D78D    mov         al,1
 0068D78F    pop         edi
 0068D790    pop         esi
 0068D791    pop         ebx
 0068D792    pop         ecx
 0068D793    pop         ebp
 0068D794    ret         4
*}
end;

//0068D798
{*procedure TMatrixExpression.SetValue(NewValue:Double; ?:?);
begin
 0068D798    push        ebp
 0068D799    mov         ebp,esp
 0068D79B    push        dword ptr [ebp+0C]
 0068D79E    push        dword ptr [ebp+8]
 0068D7A1    call        TExpression.SetValue
 0068D7A6    pop         ebp
 0068D7A7    ret         8
end;*}

//0068D7AC
{*procedure TMatrixExpression.SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?);
begin
 0068D7AC    push        ebp
 0068D7AD    mov         ebp,esp
 0068D7AF    push        dword ptr [ebp+1C]
 0068D7B2    push        dword ptr [ebp+18]
 0068D7B5    push        dword ptr [ebp+14]
 0068D7B8    push        dword ptr [ebp+10]
 0068D7BB    push        dword ptr [ebp+0C]
 0068D7BE    push        dword ptr [ebp+8]
 0068D7C1    call        TExpression.SetVector
 0068D7C6    pop         ebp
 0068D7C7    ret         18
end;*}

//0068D7CC
procedure TMatrixExpression.Swallow;
begin
{*
 0068D7CC    push        ebx
 0068D7CD    push        esi
 0068D7CE    push        edi
 0068D7CF    push        ebp
 0068D7D0    mov         edi,eax
 0068D7D2    mov         eax,edi
 0068D7D4    call        TExpression.Swallow
 0068D7D9    xor         esi,esi
 0068D7DB    xor         ebx,ebx
 0068D7DD    lea         eax,[esi+esi*2]
 0068D7E0    lea         eax,[edi+eax*4]
 0068D7E3    mov         ebp,dword ptr [eax+ebx*4+18]
 0068D7E7    test        ebp,ebp
>0068D7E9    je          0068D7F5
 0068D7EB    mov         eax,ebp
 0068D7ED    mov         edx,dword ptr [eax]
 0068D7EF    call        dword ptr [edx+88]
 0068D7F5    inc         ebx
 0068D7F6    cmp         ebx,3
>0068D7F9    jne         0068D7DD
 0068D7FB    inc         esi
 0068D7FC    cmp         esi,3
>0068D7FF    jne         0068D7DB
 0068D801    pop         ebp
 0068D802    pop         edi
 0068D803    pop         esi
 0068D804    pop         ebx
 0068D805    ret
*}
end;

//0068D808
{*procedure TMatrixExpression.ToString(?:?);
begin
 0068D808    push        ebp
 0068D809    mov         ebp,esp
 0068D80B    mov         ecx,4
 0068D810    push        0
 0068D812    push        0
 0068D814    dec         ecx
>0068D815    jne         0068D810
 0068D817    push        ecx
 0068D818    push        ebx
 0068D819    push        esi
 0068D81A    mov         esi,edx
 0068D81C    mov         ebx,eax
 0068D81E    xor         eax,eax
 0068D820    push        ebp
 0068D821    push        68D903
 0068D826    push        dword ptr fs:[eax]
 0068D829    mov         dword ptr fs:[eax],esp
 0068D82C    push        68D91C;'['
 0068D831    lea         edx,[ebp-4]
 0068D834    mov         eax,dword ptr [ebx+18];TMatrixExpression......m:?
 0068D837    mov         ecx,dword ptr [eax]
 0068D839    call        dword ptr [ecx-24]
 0068D83C    push        dword ptr [ebp-4]
 0068D83F    push        68D92C;','
 0068D844    lea         edx,[ebp-8]
 0068D847    mov         eax,dword ptr [ebx+1C];TMatrixExpression.?f1C:TExpression
 0068D84A    mov         ecx,dword ptr [eax]
 0068D84C    call        dword ptr [ecx-24]
 0068D84F    push        dword ptr [ebp-8]
 0068D852    push        68D92C;','
 0068D857    lea         edx,[ebp-0C]
 0068D85A    mov         eax,dword ptr [ebx+20];TMatrixExpression.?f20:dword
 0068D85D    mov         ecx,dword ptr [eax]
 0068D85F    call        dword ptr [ecx-24]
 0068D862    push        dword ptr [ebp-0C]
 0068D865    push        68D93C;';'
 0068D86A    lea         edx,[ebp-10]
 0068D86D    mov         eax,dword ptr [ebx+24];TMatrixExpression.?f24:TExpression
 0068D870    mov         ecx,dword ptr [eax]
 0068D872    call        dword ptr [ecx-24]
 0068D875    push        dword ptr [ebp-10]
 0068D878    push        68D92C;','
 0068D87D    lea         edx,[ebp-14]
 0068D880    mov         eax,dword ptr [ebx+28];TMatrixExpression.?f28:TExpression
 0068D883    mov         ecx,dword ptr [eax]
 0068D885    call        dword ptr [ecx-24]
 0068D888    push        dword ptr [ebp-14]
 0068D88B    push        68D92C;','
 0068D890    lea         edx,[ebp-18]
 0068D893    mov         eax,dword ptr [ebx+2C];TMatrixExpression.?f2C:TExpression
 0068D896    mov         ecx,dword ptr [eax]
 0068D898    call        dword ptr [ecx-24]
 0068D89B    push        dword ptr [ebp-18]
 0068D89E    push        68D93C;';'
 0068D8A3    lea         edx,[ebp-1C]
 0068D8A6    mov         eax,dword ptr [ebx+30];TMatrixExpression.?f30:TExpression
 0068D8A9    mov         ecx,dword ptr [eax]
 0068D8AB    call        dword ptr [ecx-24]
 0068D8AE    push        dword ptr [ebp-1C]
 0068D8B1    push        68D92C;','
 0068D8B6    lea         edx,[ebp-20]
 0068D8B9    mov         eax,dword ptr [ebx+34];TMatrixExpression.?f34:TExpression
 0068D8BC    mov         ecx,dword ptr [eax]
 0068D8BE    call        dword ptr [ecx-24]
 0068D8C1    push        dword ptr [ebp-20]
 0068D8C4    push        68D92C;','
 0068D8C9    lea         edx,[ebp-24]
 0068D8CC    mov         eax,dword ptr [ebx+38];TMatrixExpression.?f38:TExpression
 0068D8CF    mov         ecx,dword ptr [eax]
 0068D8D1    call        dword ptr [ecx-24]
 0068D8D4    push        dword ptr [ebp-24]
 0068D8D7    push        68D94C;']'
 0068D8DC    mov         eax,esi
 0068D8DE    mov         edx,13
 0068D8E3    call        @UStrCatN
 0068D8E8    xor         eax,eax
 0068D8EA    pop         edx
 0068D8EB    pop         ecx
 0068D8EC    pop         ecx
 0068D8ED    mov         dword ptr fs:[eax],edx
 0068D8F0    push        68D90A
 0068D8F5    lea         eax,[ebp-24]
 0068D8F8    mov         edx,9
 0068D8FD    call        @UStrArrayClr
 0068D902    ret
>0068D903    jmp         @HandleFinally
>0068D908    jmp         0068D8F5
 0068D90A    pop         esi
 0068D90B    pop         ebx
 0068D90C    mov         esp,ebp
 0068D90E    pop         ebp
 0068D90F    ret
end;*}

//0068D950
procedure TObjectArrayExpression.CanSet;
begin
{*
 0068D950    mov         eax,dword ptr [eax+18];TObjectArrayExpression.Value:TObjectValue
 0068D953    mov         edx,dword ptr [eax]
 0068D955    call        dword ptr [edx+68];TExpression.CanSet
 0068D958    ret
*}
end;

//0068D95C
procedure TObjectArrayExpression.CreateClone;
begin
{*
 0068D95C    mov         dl,1
 0068D95E    mov         eax,[0067E8E4];TObjectArrayExpression
 0068D963    call        TObject.Create;TObjectArrayExpression.Create
 0068D968    ret
*}
end;

//0068D96C
destructor TObjectArrayExpression.Destroy();
begin
{*
 0068D96C    push        ebx
 0068D96D    push        esi
 0068D96E    call        @BeforeDestruction
 0068D973    mov         ebx,edx
 0068D975    mov         esi,eax
 0068D977    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068D97A    call        TObject.Free
 0068D97F    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068D982    call        TObject.Free
 0068D987    mov         edx,ebx
 0068D989    and         dl,0FC
 0068D98C    mov         eax,esi
 0068D98E    call        TObject.Destroy
 0068D993    test        bl,bl
>0068D995    jle         0068D99E
 0068D997    mov         eax,esi
 0068D999    call        @ClassDestroy
 0068D99E    pop         esi
 0068D99F    pop         ebx
 0068D9A0    ret
*}
end;

//0068D9A4
procedure TObjectArrayExpression.FillClone(c:TExpression);
begin
{*
 0068D9A4    push        ebx
 0068D9A5    push        esi
 0068D9A6    push        edi
 0068D9A7    mov         esi,edx
 0068D9A9    mov         ebx,eax
 0068D9AB    mov         edx,esi
 0068D9AD    mov         eax,ebx
 0068D9AF    call        TExpression.FillClone
 0068D9B4    mov         eax,dword ptr [ebx+18];TObjectArrayExpression.Value:TObjectValue
 0068D9B7    call        TExpression.Clone
 0068D9BC    mov         edi,esi
 0068D9BE    mov         dword ptr [edi+18],eax
 0068D9C1    mov         eax,dword ptr [ebx+1C];TObjectArrayExpression.Index:TExpression
 0068D9C4    call        TExpression.Clone
 0068D9C9    mov         dword ptr [edi+1C],eax
 0068D9CC    pop         edi
 0068D9CD    pop         esi
 0068D9CE    pop         ebx
 0068D9CF    ret
*}
end;

//0068D9D0
procedure TObjectArrayExpression.GetBoolean;
begin
{*
 0068D9D0    push        ebx
 0068D9D1    push        esi
 0068D9D2    mov         esi,eax
 0068D9D4    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068D9D7    mov         edx,dword ptr [eax]
 0068D9D9    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068D9DC    mov         ebx,eax
 0068D9DE    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068D9E1    mov         dword ptr [eax+18],ebx;TObjectValue........................................................
 0068D9E4    cmp         ebx,0FFFFFFFF
>0068D9E7    jl          0068D9FF
 0068D9E9    cmp         ebx,20
>0068D9EC    jg          0068D9FF
 0068D9EE    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068D9F1    mov         edx,dword ptr [esi+ebx*8+28]
 0068D9F5    mov         dword ptr [eax+8],edx;TObjectValue.PreviousValue:Double
 0068D9F8    mov         edx,dword ptr [esi+ebx*8+2C]
 0068D9FC    mov         dword ptr [eax+0C],edx;TObjectValue.?fC:dword
 0068D9FF    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DA02    mov         edx,dword ptr [eax]
 0068DA04    call        dword ptr [edx+30];TExpression.GetBoolean
 0068DA07    cmp         ebx,0FFFFFFFF
>0068DA0A    jl          0068DA22
 0068DA0C    cmp         ebx,20
>0068DA0F    jg          0068DA22
 0068DA11    mov         edx,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DA14    mov         ecx,dword ptr [edx+8];TObjectValue.PreviousValue:Double
 0068DA17    mov         dword ptr [esi+ebx*8+28],ecx
 0068DA1B    mov         ecx,dword ptr [edx+0C];TObjectValue.?fC:dword
 0068DA1E    mov         dword ptr [esi+ebx*8+2C],ecx
 0068DA22    pop         esi
 0068DA23    pop         ebx
 0068DA24    ret
*}
end;

//0068DA28
procedure TObjectArrayExpression.GetDataType;
begin
{*
 0068DA28    mov         eax,dword ptr [eax+18];TObjectArrayExpression.Value:TObjectValue
 0068DA2B    mov         edx,dword ptr [eax]
 0068DA2D    call        dword ptr [edx+44];TExpression.GetDataType
 0068DA30    ret
*}
end;

//0068DA34
procedure TObjectArrayExpression.GetInteger;
begin
{*
 0068DA34    push        ebx
 0068DA35    push        esi
 0068DA36    mov         esi,eax
 0068DA38    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068DA3B    mov         edx,dword ptr [eax]
 0068DA3D    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DA40    mov         ebx,eax
 0068DA42    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DA45    mov         dword ptr [eax+18],ebx;TObjectValue........................................................
 0068DA48    cmp         ebx,0FFFFFFFF
>0068DA4B    jl          0068DA63
 0068DA4D    cmp         ebx,20
>0068DA50    jg          0068DA63
 0068DA52    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DA55    mov         edx,dword ptr [esi+ebx*8+28]
 0068DA59    mov         dword ptr [eax+8],edx;TObjectValue.PreviousValue:Double
 0068DA5C    mov         edx,dword ptr [esi+ebx*8+2C]
 0068DA60    mov         dword ptr [eax+0C],edx;TObjectValue.?fC:dword
 0068DA63    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DA66    mov         edx,dword ptr [eax]
 0068DA68    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DA6B    cmp         ebx,0FFFFFFFF
>0068DA6E    jl          0068DA86
 0068DA70    cmp         ebx,20
>0068DA73    jg          0068DA86
 0068DA75    mov         edx,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DA78    mov         ecx,dword ptr [edx+8];TObjectValue.PreviousValue:Double
 0068DA7B    mov         dword ptr [esi+ebx*8+28],ecx
 0068DA7F    mov         ecx,dword ptr [edx+0C];TObjectValue.?fC:dword
 0068DA82    mov         dword ptr [esi+ebx*8+2C],ecx
 0068DA86    pop         esi
 0068DA87    pop         ebx
 0068DA88    ret
*}
end;

//0068DA8C
procedure TObjectArrayExpression.GetPerUnits1;
begin
{*
 0068DA8C    mov         eax,dword ptr [eax+18];TObjectArrayExpression.Value:TObjectValue
 0068DA8F    mov         edx,dword ptr [eax]
 0068DA91    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 0068DA94    ret
*}
end;

//0068DA98
procedure TObjectArrayExpression.GetPerUnits2;
begin
{*
 0068DA98    mov         eax,dword ptr [eax+18];TObjectArrayExpression.Value:TObjectValue
 0068DA9B    mov         edx,dword ptr [eax]
 0068DA9D    call        dword ptr [edx+50];TExpression.GetPerUnits2
 0068DAA0    ret
*}
end;

//0068DAA4
procedure TObjectArrayExpression.GetPreviousValue;
begin
{*
 0068DAA4    push        ebx
 0068DAA5    add         esp,0FFFFFFF8
 0068DAA8    mov         ebx,eax
 0068DAAA    mov         eax,dword ptr [ebx+1C];TObjectArrayExpression.Index:TExpression
 0068DAAD    mov         edx,dword ptr [eax]
 0068DAAF    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DAB2    mov         edx,dword ptr [ebx+18];TObjectArrayExpression.Value:TObjectValue
 0068DAB5    mov         dword ptr [edx+18],eax;TObjectValue........................................................
 0068DAB8    cmp         eax,0FFFFFFFF
>0068DABB    jl          0068DAD3
 0068DABD    cmp         eax,20
>0068DAC0    jg          0068DAD3
 0068DAC2    mov         edx,dword ptr [ebx+eax*8+28]
 0068DAC6    mov         dword ptr [esp],edx
 0068DAC9    mov         edx,dword ptr [ebx+eax*8+2C]
 0068DACD    mov         dword ptr [esp+4],edx
>0068DAD1    jmp         0068DADC
 0068DAD3    xor         eax,eax
 0068DAD5    mov         dword ptr [esp],eax
 0068DAD8    mov         dword ptr [esp+4],eax
 0068DADC    fld         qword ptr [esp]
 0068DADF    pop         ecx
 0068DAE0    pop         edx
 0068DAE1    pop         ebx
 0068DAE2    ret
*}
end;

//0068DAE4
procedure TObjectArrayExpression.GetRotMat(m:TRotMat);
begin
{*
 0068DAE4    push        ebx
 0068DAE5    push        esi
 0068DAE6    push        edi
 0068DAE7    mov         edi,edx
 0068DAE9    mov         ebx,eax
 0068DAEB    mov         eax,dword ptr [ebx+1C];TObjectArrayExpression.Index:TExpression
 0068DAEE    mov         edx,dword ptr [eax]
 0068DAF0    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DAF3    mov         esi,dword ptr [ebx+18];TObjectArrayExpression.Value:TObjectValue
 0068DAF6    mov         dword ptr [esi+18],eax;TObjectValue........................................................
 0068DAF9    mov         edx,edi
 0068DAFB    mov         eax,esi
 0068DAFD    mov         ecx,dword ptr [eax]
 0068DAFF    call        dword ptr [ecx+40];TExpression.GetRotMat
 0068DB02    pop         edi
 0068DB03    pop         esi
 0068DB04    pop         ebx
 0068DB05    ret
*}
end;

//0068DB08
{*procedure TObjectArrayExpression.GetString(?:?);
begin
 0068DB08    push        ebx
 0068DB09    push        esi
 0068DB0A    push        edi
 0068DB0B    mov         edi,edx
 0068DB0D    mov         esi,eax
 0068DB0F    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068DB12    mov         edx,dword ptr [eax]
 0068DB14    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DB17    mov         ebx,eax
 0068DB19    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DB1C    mov         dword ptr [eax+18],ebx;TObjectValue........................................................
 0068DB1F    cmp         ebx,0FFFFFFFF
>0068DB22    jl          0068DB3A
 0068DB24    cmp         ebx,20
>0068DB27    jg          0068DB3A
 0068DB29    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DB2C    mov         edx,dword ptr [esi+ebx*8+28]
 0068DB30    mov         dword ptr [eax+8],edx;TObjectValue.PreviousValue:Double
 0068DB33    mov         edx,dword ptr [esi+ebx*8+2C]
 0068DB37    mov         dword ptr [eax+0C],edx;TObjectValue.?fC:dword
 0068DB3A    mov         edx,edi
 0068DB3C    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DB3F    mov         ecx,dword ptr [eax]
 0068DB41    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0068DB44    cmp         ebx,0FFFFFFFF
>0068DB47    jl          0068DB5F
 0068DB49    cmp         ebx,20
>0068DB4C    jg          0068DB5F
 0068DB4E    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DB51    mov         edx,dword ptr [eax+8];TObjectValue.PreviousValue:Double
 0068DB54    mov         dword ptr [esi+ebx*8+28],edx
 0068DB58    mov         edx,dword ptr [eax+0C];TObjectValue.?fC:dword
 0068DB5B    mov         dword ptr [esi+ebx*8+2C],edx
 0068DB5F    pop         edi
 0068DB60    pop         esi
 0068DB61    pop         ebx
 0068DB62    ret
end;*}

//0068DB64
procedure TObjectArrayExpression.GetUnits;
begin
{*
 0068DB64    mov         eax,dword ptr [eax+18];TObjectArrayExpression.Value:TObjectValue
 0068DB67    mov         edx,dword ptr [eax]
 0068DB69    call        dword ptr [edx+48];TExpression.GetUnits
 0068DB6C    ret
*}
end;

//0068DB70
procedure TObjectArrayExpression.GetValue;
begin
{*
 0068DB70    push        ebx
 0068DB71    push        esi
 0068DB72    add         esp,0FFFFFFF8
 0068DB75    mov         esi,eax
 0068DB77    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068DB7A    mov         edx,dword ptr [eax]
 0068DB7C    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DB7F    mov         ebx,eax
 0068DB81    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DB84    mov         dword ptr [eax+18],ebx;TObjectValue........................................................
 0068DB87    cmp         ebx,0FFFFFFFF
>0068DB8A    jl          0068DBA2
 0068DB8C    cmp         ebx,20
>0068DB8F    jg          0068DBA2
 0068DB91    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DB94    mov         edx,dword ptr [esi+ebx*8+28]
 0068DB98    mov         dword ptr [eax+8],edx;TObjectValue.PreviousValue:Double
 0068DB9B    mov         edx,dword ptr [esi+ebx*8+2C]
 0068DB9F    mov         dword ptr [eax+0C],edx;TObjectValue.?fC:dword
 0068DBA2    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DBA5    mov         edx,dword ptr [eax]
 0068DBA7    call        dword ptr [edx];TExpression.Evaluate
 0068DBA9    fstp        qword ptr [esp]
 0068DBAC    wait
 0068DBAD    cmp         ebx,0FFFFFFFF
>0068DBB0    jl          0068DBC8
 0068DBB2    cmp         ebx,20
>0068DBB5    jg          0068DBC8
 0068DBB7    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DBBA    mov         edx,dword ptr [eax+8];TObjectValue.PreviousValue:Double
 0068DBBD    mov         dword ptr [esi+ebx*8+28],edx
 0068DBC1    mov         edx,dword ptr [eax+0C];TObjectValue.?fC:dword
 0068DBC4    mov         dword ptr [esi+ebx*8+2C],edx
 0068DBC8    fld         qword ptr [esp]
 0068DBCB    pop         ecx
 0068DBCC    pop         edx
 0068DBCD    pop         esi
 0068DBCE    pop         ebx
 0068DBCF    ret
*}
end;

//0068DBD0
procedure TObjectArrayExpression.GetVector(x:Double; y:Double; z:Double);
begin
{*
 0068DBD0    push        ebp
 0068DBD1    mov         ebp,esp
 0068DBD3    push        ecx
 0068DBD4    push        ebx
 0068DBD5    push        esi
 0068DBD6    push        edi
 0068DBD7    mov         dword ptr [ebp-4],ecx
 0068DBDA    mov         edi,edx
 0068DBDC    mov         esi,eax
 0068DBDE    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068DBE1    mov         edx,dword ptr [eax]
 0068DBE3    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DBE6    mov         ebx,eax
 0068DBE8    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DBEB    mov         dword ptr [eax+18],ebx;TObjectValue........................................................
 0068DBEE    cmp         ebx,0FFFFFFFF
>0068DBF1    jl          0068DC09
 0068DBF3    cmp         ebx,20
>0068DBF6    jg          0068DC09
 0068DBF8    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DBFB    mov         edx,dword ptr [esi+ebx*8+28]
 0068DBFF    mov         dword ptr [eax+8],edx;TObjectValue.PreviousValue:Double
 0068DC02    mov         edx,dword ptr [esi+ebx*8+2C]
 0068DC06    mov         dword ptr [eax+0C],edx;TObjectValue.?fC:dword
 0068DC09    mov         eax,dword ptr [ebp+8]
 0068DC0C    push        eax
 0068DC0D    mov         ecx,dword ptr [ebp-4]
 0068DC10    mov         edx,edi
 0068DC12    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DC15    mov         edi,dword ptr [eax]
 0068DC17    call        dword ptr [edi+20];TExpression.EvaluateVector
 0068DC1A    cmp         ebx,0FFFFFFFF
>0068DC1D    jl          0068DC35
 0068DC1F    cmp         ebx,20
>0068DC22    jg          0068DC35
 0068DC24    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DC27    mov         edx,dword ptr [eax+8];TObjectValue.PreviousValue:Double
 0068DC2A    mov         dword ptr [esi+ebx*8+28],edx
 0068DC2E    mov         edx,dword ptr [eax+0C];TObjectValue.?fC:dword
 0068DC31    mov         dword ptr [esi+ebx*8+2C],edx
 0068DC35    pop         edi
 0068DC36    pop         esi
 0068DC37    pop         ebx
 0068DC38    pop         ecx
 0068DC39    pop         ebp
 0068DC3A    ret         4
*}
end;

//0068DC40
procedure TObjectArrayExpression.Press;
begin
{*
 0068DC40    push        ebx
 0068DC41    push        esi
 0068DC42    mov         esi,eax
 0068DC44    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068DC47    mov         edx,dword ptr [eax]
 0068DC49    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DC4C    mov         ebx,eax
 0068DC4E    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DC51    mov         dword ptr [eax+18],ebx;TObjectValue........................................................
 0068DC54    cmp         ebx,0FFFFFFFF
>0068DC57    jl          0068DC6F
 0068DC59    cmp         ebx,20
>0068DC5C    jg          0068DC6F
 0068DC5E    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DC61    mov         edx,dword ptr [esi+ebx*8+28]
 0068DC65    mov         dword ptr [eax+8],edx;TObjectValue.PreviousValue:Double
 0068DC68    mov         edx,dword ptr [esi+ebx*8+2C]
 0068DC6C    mov         dword ptr [eax+0C],edx;TObjectValue.?fC:dword
 0068DC6F    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DC72    mov         edx,dword ptr [eax]
 0068DC74    call        dword ptr [edx+6C];TExpression.Press
 0068DC77    cmp         ebx,0FFFFFFFF
>0068DC7A    jl          0068DC92
 0068DC7C    cmp         ebx,20
>0068DC7F    jg          0068DC92
 0068DC81    mov         edx,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DC84    mov         ecx,dword ptr [edx+8];TObjectValue.PreviousValue:Double
 0068DC87    mov         dword ptr [esi+ebx*8+28],ecx
 0068DC8B    mov         ecx,dword ptr [edx+0C];TObjectValue.?fC:dword
 0068DC8E    mov         dword ptr [esi+ebx*8+2C],ecx
 0068DC92    pop         esi
 0068DC93    pop         ebx
 0068DC94    ret
*}
end;

//0068DC98
procedure TObjectArrayExpression.Pressed;
begin
{*
 0068DC98    push        ebx
 0068DC99    push        esi
 0068DC9A    mov         esi,eax
 0068DC9C    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068DC9F    mov         edx,dword ptr [eax]
 0068DCA1    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DCA4    mov         ebx,eax
 0068DCA6    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DCA9    mov         dword ptr [eax+18],ebx;TObjectValue........................................................
 0068DCAC    cmp         ebx,0FFFFFFFF
>0068DCAF    jl          0068DCC7
 0068DCB1    cmp         ebx,20
>0068DCB4    jg          0068DCC7
 0068DCB6    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DCB9    mov         edx,dword ptr [esi+ebx*8+28]
 0068DCBD    mov         dword ptr [eax+8],edx;TObjectValue.PreviousValue:Double
 0068DCC0    mov         edx,dword ptr [esi+ebx*8+2C]
 0068DCC4    mov         dword ptr [eax+0C],edx;TObjectValue.?fC:dword
 0068DCC7    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DCCA    mov         edx,dword ptr [eax]
 0068DCCC    call        dword ptr [edx+78];TExpression.Pressed
 0068DCCF    cmp         ebx,0FFFFFFFF
>0068DCD2    jl          0068DCEA
 0068DCD4    cmp         ebx,20
>0068DCD7    jg          0068DCEA
 0068DCD9    mov         edx,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DCDC    mov         ecx,dword ptr [edx+8];TObjectValue.PreviousValue:Double
 0068DCDF    mov         dword ptr [esi+ebx*8+28],ecx
 0068DCE3    mov         ecx,dword ptr [edx+0C];TObjectValue.?fC:dword
 0068DCE6    mov         dword ptr [esi+ebx*8+2C],ecx
 0068DCEA    pop         esi
 0068DCEB    pop         ebx
 0068DCEC    ret
*}
end;

//0068DCF0
procedure TObjectArrayExpression.Release;
begin
{*
 0068DCF0    push        ebx
 0068DCF1    push        esi
 0068DCF2    mov         esi,eax
 0068DCF4    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068DCF7    mov         edx,dword ptr [eax]
 0068DCF9    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DCFC    mov         ebx,eax
 0068DCFE    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DD01    mov         dword ptr [eax+18],ebx;TObjectValue........................................................
 0068DD04    cmp         ebx,0FFFFFFFF
>0068DD07    jl          0068DD1F
 0068DD09    cmp         ebx,20
>0068DD0C    jg          0068DD1F
 0068DD0E    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DD11    mov         edx,dword ptr [esi+ebx*8+28]
 0068DD15    mov         dword ptr [eax+8],edx;TObjectValue.PreviousValue:Double
 0068DD18    mov         edx,dword ptr [esi+ebx*8+2C]
 0068DD1C    mov         dword ptr [eax+0C],edx;TObjectValue.?fC:dword
 0068DD1F    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DD22    mov         edx,dword ptr [eax]
 0068DD24    call        dword ptr [edx+70];TExpression.Release
 0068DD27    cmp         ebx,0FFFFFFFF
>0068DD2A    jl          0068DD42
 0068DD2C    cmp         ebx,20
>0068DD2F    jg          0068DD42
 0068DD31    mov         edx,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DD34    mov         ecx,dword ptr [edx+8];TObjectValue.PreviousValue:Double
 0068DD37    mov         dword ptr [esi+ebx*8+28],ecx
 0068DD3B    mov         ecx,dword ptr [edx+0C];TObjectValue.?fC:dword
 0068DD3E    mov         dword ptr [esi+ebx*8+2C],ecx
 0068DD42    pop         esi
 0068DD43    pop         ebx
 0068DD44    ret
*}
end;

//0068DD48
procedure TObjectArrayExpression.Released;
begin
{*
 0068DD48    push        ebx
 0068DD49    push        esi
 0068DD4A    mov         esi,eax
 0068DD4C    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068DD4F    mov         edx,dword ptr [eax]
 0068DD51    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DD54    mov         ebx,eax
 0068DD56    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DD59    mov         dword ptr [eax+18],ebx;TObjectValue........................................................
 0068DD5C    cmp         ebx,0FFFFFFFF
>0068DD5F    jl          0068DD77
 0068DD61    cmp         ebx,20
>0068DD64    jg          0068DD77
 0068DD66    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DD69    mov         edx,dword ptr [esi+ebx*8+28]
 0068DD6D    mov         dword ptr [eax+8],edx;TObjectValue.PreviousValue:Double
 0068DD70    mov         edx,dword ptr [esi+ebx*8+2C]
 0068DD74    mov         dword ptr [eax+0C],edx;TObjectValue.?fC:dword
 0068DD77    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DD7A    mov         edx,dword ptr [eax]
 0068DD7C    call        dword ptr [edx+7C];TExpression.Released
 0068DD7F    cmp         ebx,0FFFFFFFF
>0068DD82    jl          0068DD9A
 0068DD84    cmp         ebx,20
>0068DD87    jg          0068DD9A
 0068DD89    mov         edx,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DD8C    mov         ecx,dword ptr [edx+8];TObjectValue.PreviousValue:Double
 0068DD8F    mov         dword ptr [esi+ebx*8+28],ecx
 0068DD93    mov         ecx,dword ptr [edx+0C];TObjectValue.?fC:dword
 0068DD96    mov         dword ptr [esi+ebx*8+2C],ecx
 0068DD9A    pop         esi
 0068DD9B    pop         ebx
 0068DD9C    ret
*}
end;

//0068DDA0
procedure TObjectArrayExpression.SetIffy(IsIffy:Boolean);
begin
{*
 0068DDA0    push        ebx
 0068DDA1    push        esi
 0068DDA2    mov         ebx,edx
 0068DDA4    mov         esi,eax
 0068DDA6    mov         edx,ebx
 0068DDA8    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068DDAB    mov         ecx,dword ptr [eax]
 0068DDAD    call        dword ptr [ecx+74];TExpression.SetIffy
 0068DDB0    mov         edx,ebx
 0068DDB2    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DDB5    mov         ecx,dword ptr [eax]
 0068DDB7    call        dword ptr [ecx+74];TExpression.SetIffy
 0068DDBA    pop         esi
 0068DDBB    pop         ebx
 0068DDBC    ret
*}
end;

//0068DDC0
procedure TObjectArrayExpression.SetMatrix(m:TRotMat);
begin
{*
 0068DDC0    push        ebx
 0068DDC1    push        esi
 0068DDC2    push        edi
 0068DDC3    add         esp,0FFFFFFB8
 0068DDC6    mov         esi,edx
 0068DDC8    lea         edi,[esp]
 0068DDCB    mov         ecx,12
 0068DDD0    rep movs    dword ptr [edi],dword ptr [esi]
 0068DDD2    mov         esi,eax
 0068DDD4    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068DDD7    mov         edx,dword ptr [eax]
 0068DDD9    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DDDC    mov         ebx,eax
 0068DDDE    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DDE1    mov         dword ptr [eax+18],ebx;TObjectValue........................................................
 0068DDE4    cmp         ebx,0FFFFFFFF
>0068DDE7    jl          0068DDFF
 0068DDE9    cmp         ebx,20
>0068DDEC    jg          0068DDFF
 0068DDEE    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DDF1    mov         edx,dword ptr [esi+ebx*8+28]
 0068DDF5    mov         dword ptr [eax+8],edx;TObjectValue.PreviousValue:Double
 0068DDF8    mov         edx,dword ptr [esi+ebx*8+2C]
 0068DDFC    mov         dword ptr [eax+0C],edx;TObjectValue.?fC:dword
 0068DDFF    mov         edx,esp
 0068DE01    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DE04    mov         ecx,dword ptr [eax]
 0068DE06    call        dword ptr [ecx+64];TExpression.SetMatrix
 0068DE09    cmp         ebx,0FFFFFFFF
>0068DE0C    jl          0068DE24
 0068DE0E    cmp         ebx,20
>0068DE11    jg          0068DE24
 0068DE13    mov         edx,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DE16    mov         ecx,dword ptr [edx+8];TObjectValue.PreviousValue:Double
 0068DE19    mov         dword ptr [esi+ebx*8+28],ecx
 0068DE1D    mov         ecx,dword ptr [edx+0C];TObjectValue.?fC:dword
 0068DE20    mov         dword ptr [esi+ebx*8+2C],ecx
 0068DE24    add         esp,48
 0068DE27    pop         edi
 0068DE28    pop         esi
 0068DE29    pop         ebx
 0068DE2A    ret
*}
end;

//0068DE2C
function TObjectArrayExpression.SetString(NewValue:string):Boolean;
begin
{*
 0068DE2C    push        ebp
 0068DE2D    mov         ebp,esp
 0068DE2F    push        ecx
 0068DE30    push        ebx
 0068DE31    push        esi
 0068DE32    push        edi
 0068DE33    mov         dword ptr [ebp-4],edx
 0068DE36    mov         esi,eax
 0068DE38    mov         eax,dword ptr [ebp-4]
 0068DE3B    call        @UStrAddRef
 0068DE40    xor         eax,eax
 0068DE42    push        ebp
 0068DE43    push        68DEB7
 0068DE48    push        dword ptr fs:[eax]
 0068DE4B    mov         dword ptr fs:[eax],esp
 0068DE4E    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068DE51    mov         edx,dword ptr [eax]
 0068DE53    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DE56    mov         edi,eax
 0068DE58    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DE5B    mov         dword ptr [eax+18],edi;TObjectValue........................................................
 0068DE5E    cmp         edi,0FFFFFFFF
>0068DE61    jl          0068DE79
 0068DE63    cmp         edi,20
>0068DE66    jg          0068DE79
 0068DE68    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DE6B    mov         edx,dword ptr [esi+edi*8+28]
 0068DE6F    mov         dword ptr [eax+8],edx;TObjectValue.PreviousValue:Double
 0068DE72    mov         edx,dword ptr [esi+edi*8+2C]
 0068DE76    mov         dword ptr [eax+0C],edx;TObjectValue.?fC:dword
 0068DE79    mov         edx,dword ptr [ebp-4]
 0068DE7C    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DE7F    mov         ecx,dword ptr [eax]
 0068DE81    call        dword ptr [ecx+5C];TExpression.SetString
 0068DE84    mov         ebx,eax
 0068DE86    cmp         edi,0FFFFFFFF
>0068DE89    jl          0068DEA1
 0068DE8B    cmp         edi,20
>0068DE8E    jg          0068DEA1
 0068DE90    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DE93    mov         edx,dword ptr [eax+8];TObjectValue.PreviousValue:Double
 0068DE96    mov         dword ptr [esi+edi*8+28],edx
 0068DE9A    mov         edx,dword ptr [eax+0C];TObjectValue.?fC:dword
 0068DE9D    mov         dword ptr [esi+edi*8+2C],edx
 0068DEA1    xor         eax,eax
 0068DEA3    pop         edx
 0068DEA4    pop         ecx
 0068DEA5    pop         ecx
 0068DEA6    mov         dword ptr fs:[eax],edx
 0068DEA9    push        68DEBE
 0068DEAE    lea         eax,[ebp-4]
 0068DEB1    call        @UStrClr
 0068DEB6    ret
>0068DEB7    jmp         @HandleFinally
>0068DEBC    jmp         0068DEAE
 0068DEBE    mov         eax,ebx
 0068DEC0    pop         edi
 0068DEC1    pop         esi
 0068DEC2    pop         ebx
 0068DEC3    pop         ecx
 0068DEC4    pop         ebp
 0068DEC5    ret
*}
end;

//0068DEC8
{*procedure TObjectArrayExpression.SetValue(NewValue:Double; ?:?);
begin
 0068DEC8    push        ebp
 0068DEC9    mov         ebp,esp
 0068DECB    push        ebx
 0068DECC    push        esi
 0068DECD    mov         esi,eax
 0068DECF    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068DED2    mov         edx,dword ptr [eax]
 0068DED4    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DED7    mov         ebx,eax
 0068DED9    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DEDC    mov         dword ptr [eax+18],ebx;TObjectValue........................................................
 0068DEDF    cmp         ebx,0FFFFFFFF
>0068DEE2    jl          0068DEFA
 0068DEE4    cmp         ebx,20
>0068DEE7    jg          0068DEFA
 0068DEE9    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DEEC    mov         edx,dword ptr [esi+ebx*8+28]
 0068DEF0    mov         dword ptr [eax+8],edx;TObjectValue.PreviousValue:Double
 0068DEF3    mov         edx,dword ptr [esi+ebx*8+2C]
 0068DEF7    mov         dword ptr [eax+0C],edx;TObjectValue.?fC:dword
 0068DEFA    push        dword ptr [ebp+0C]
 0068DEFD    push        dword ptr [ebp+8]
 0068DF00    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DF03    mov         edx,dword ptr [eax]
 0068DF05    call        dword ptr [edx+58];TExpression.SetValue
 0068DF08    cmp         ebx,0FFFFFFFF
>0068DF0B    jl          0068DF23
 0068DF0D    cmp         ebx,20
>0068DF10    jg          0068DF23
 0068DF12    mov         edx,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DF15    mov         ecx,dword ptr [edx+8];TObjectValue.PreviousValue:Double
 0068DF18    mov         dword ptr [esi+ebx*8+28],ecx
 0068DF1C    mov         ecx,dword ptr [edx+0C];TObjectValue.?fC:dword
 0068DF1F    mov         dword ptr [esi+ebx*8+2C],ecx
 0068DF23    pop         esi
 0068DF24    pop         ebx
 0068DF25    pop         ebp
 0068DF26    ret         8
end;*}

//0068DF2C
{*procedure TObjectArrayExpression.SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?);
begin
 0068DF2C    push        ebp
 0068DF2D    mov         ebp,esp
 0068DF2F    push        ebx
 0068DF30    push        esi
 0068DF31    mov         esi,eax
 0068DF33    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068DF36    mov         edx,dword ptr [eax]
 0068DF38    call        dword ptr [edx+8];TExpression.EvaluateInteger
 0068DF3B    mov         ebx,eax
 0068DF3D    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DF40    mov         dword ptr [eax+18],ebx;TObjectValue........................................................
 0068DF43    cmp         ebx,0FFFFFFFF
>0068DF46    jl          0068DF5E
 0068DF48    cmp         ebx,20
>0068DF4B    jg          0068DF5E
 0068DF4D    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DF50    mov         edx,dword ptr [esi+ebx*8+28]
 0068DF54    mov         dword ptr [eax+8],edx;TObjectValue.PreviousValue:Double
 0068DF57    mov         edx,dword ptr [esi+ebx*8+2C]
 0068DF5B    mov         dword ptr [eax+0C],edx;TObjectValue.?fC:dword
 0068DF5E    push        dword ptr [ebp+1C]
 0068DF61    push        dword ptr [ebp+18]
 0068DF64    push        dword ptr [ebp+14]
 0068DF67    push        dword ptr [ebp+10]
 0068DF6A    push        dword ptr [ebp+0C]
 0068DF6D    push        dword ptr [ebp+8]
 0068DF70    mov         eax,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DF73    mov         edx,dword ptr [eax]
 0068DF75    call        dword ptr [edx+60];TExpression.SetVector
 0068DF78    cmp         ebx,0FFFFFFFF
>0068DF7B    jl          0068DF93
 0068DF7D    cmp         ebx,20
>0068DF80    jg          0068DF93
 0068DF82    mov         edx,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DF85    mov         ecx,dword ptr [edx+8];TObjectValue.PreviousValue:Double
 0068DF88    mov         dword ptr [esi+ebx*8+28],ecx
 0068DF8C    mov         ecx,dword ptr [edx+0C];TObjectValue.?fC:dword
 0068DF8F    mov         dword ptr [esi+ebx*8+2C],ecx
 0068DF93    pop         esi
 0068DF94    pop         ebx
 0068DF95    pop         ebp
 0068DF96    ret         18
end;*}

//0068DF9C
procedure TObjectArrayExpression.Swallow;
begin
{*
 0068DF9C    push        ebx
 0068DF9D    mov         ebx,eax
 0068DF9F    mov         eax,dword ptr [ebx+1C];TObjectArrayExpression.Index:TExpression
 0068DFA2    mov         edx,dword ptr [eax]
 0068DFA4    call        dword ptr [edx+88];TExpression.Swallow
 0068DFAA    mov         eax,dword ptr [ebx+18];TObjectArrayExpression.Value:TObjectValue
 0068DFAD    mov         edx,dword ptr [eax]
 0068DFAF    call        dword ptr [edx+88];TExpression.Swallow
 0068DFB5    pop         ebx
 0068DFB6    ret
*}
end;

//0068DFB8
{*procedure TObjectArrayExpression.ToString(?:?);
begin
 0068DFB8    push        ebp
 0068DFB9    mov         ebp,esp
 0068DFBB    xor         ecx,ecx
 0068DFBD    push        ecx
 0068DFBE    push        ecx
 0068DFBF    push        ecx
 0068DFC0    push        ecx
 0068DFC1    push        ecx
 0068DFC2    push        ebx
 0068DFC3    push        esi
 0068DFC4    push        edi
 0068DFC5    mov         dword ptr [ebp-8],edx
 0068DFC8    mov         esi,eax
 0068DFCA    xor         eax,eax
 0068DFCC    push        ebp
 0068DFCD    push        68E079
 0068DFD2    push        dword ptr fs:[eax]
 0068DFD5    mov         dword ptr fs:[eax],esp
 0068DFD8    mov         ebx,dword ptr [esi+18];TObjectArrayExpression.Value:TObjectValue
 0068DFDB    mov         dword ptr [ebx+18],0FFFFFFFF;TObjectValue..................................................
 0068DFE2    lea         edx,[ebp-4]
 0068DFE5    mov         eax,ebx
 0068DFE7    mov         ecx,dword ptr [eax]
 0068DFE9    call        dword ptr [ecx-24];TObjectValue.ToString
 0068DFEC    mov         edx,dword ptr [ebp-4]
 0068DFEF    mov         eax,68E094;'.'
 0068DFF4    call        Pos
 0068DFF9    mov         edi,eax
 0068DFFB    mov         ebx,dword ptr [ebp-4]
 0068DFFE    test        ebx,ebx
>0068E000    je          0068E007
 0068E002    sub         ebx,4
 0068E005    mov         ebx,dword ptr [ebx]
 0068E007    lea         eax,[ebp-0C]
 0068E00A    push        eax
 0068E00B    mov         ecx,edi
 0068E00D    dec         ecx
 0068E00E    mov         edx,1
 0068E013    mov         eax,dword ptr [ebp-4]
 0068E016    call        @UStrCopy
 0068E01B    push        dword ptr [ebp-0C]
 0068E01E    push        68E0A4;'['
 0068E023    lea         edx,[ebp-10]
 0068E026    mov         eax,dword ptr [esi+1C];TObjectArrayExpression.Index:TExpression
 0068E029    mov         ecx,dword ptr [eax]
 0068E02B    call        dword ptr [ecx-24];TExpression.ToString
 0068E02E    push        dword ptr [ebp-10]
 0068E031    push        68E0B4;']'
 0068E036    lea         eax,[ebp-14]
 0068E039    push        eax
 0068E03A    mov         ecx,ebx
 0068E03C    mov         edx,edi
 0068E03E    mov         eax,dword ptr [ebp-4]
 0068E041    call        @UStrCopy
 0068E046    push        dword ptr [ebp-14]
 0068E049    mov         eax,dword ptr [ebp-8]
 0068E04C    mov         edx,5
 0068E051    call        @UStrCatN
 0068E056    xor         eax,eax
 0068E058    pop         edx
 0068E059    pop         ecx
 0068E05A    pop         ecx
 0068E05B    mov         dword ptr fs:[eax],edx
 0068E05E    push        68E080
 0068E063    lea         eax,[ebp-14]
 0068E066    mov         edx,3
 0068E06B    call        @UStrArrayClr
 0068E070    lea         eax,[ebp-4]
 0068E073    call        @UStrClr
 0068E078    ret
>0068E079    jmp         @HandleFinally
>0068E07E    jmp         0068E063
 0068E080    pop         edi
 0068E081    pop         esi
 0068E082    pop         ebx
 0068E083    mov         esp,ebp
 0068E085    pop         ebp
 0068E086    ret
end;*}

//0068E0B8
procedure TKalmanExpression.CreateClone;
begin
{*
 0068E0B8    mov         dl,1
 0068E0BA    mov         eax,[0067FC7C];TKalmanExpression
 0068E0BF    call        TObject.Create;TKalmanExpression.Create
 0068E0C4    ret
*}
end;

//0068E0C8
destructor TKalmanExpression.Destroy();
begin
{*
 0068E0C8    push        ebx
 0068E0C9    push        esi
 0068E0CA    call        @BeforeDestruction
 0068E0CF    mov         ebx,edx
 0068E0D1    mov         esi,eax
 0068E0D3    mov         eax,dword ptr [esi+20];TKalmanExpression.expression:TExpression
 0068E0D6    call        TObject.Free
 0068E0DB    mov         edx,ebx
 0068E0DD    and         dl,0FC
 0068E0E0    mov         eax,esi
 0068E0E2    call        TObject.Destroy
 0068E0E7    test        bl,bl
>0068E0E9    jle         0068E0F2
 0068E0EB    mov         eax,esi
 0068E0ED    call        @ClassDestroy
 0068E0F2    pop         esi
 0068E0F3    pop         ebx
 0068E0F4    ret
*}
end;

//0068E0F8
procedure TKalmanExpression.FillClone(c:TExpression);
begin
{*
 0068E0F8    push        ebx
 0068E0F9    push        esi
 0068E0FA    push        edi
 0068E0FB    mov         esi,edx
 0068E0FD    mov         ebx,eax
 0068E0FF    mov         edx,esi
 0068E101    mov         eax,ebx
 0068E103    call        TUpdatingExpression.FillClone
 0068E108    mov         eax,dword ptr [ebx+20];TKalmanExpression.expression:TExpression
 0068E10B    call        TExpression.Clone
 0068E110    mov         edi,esi
 0068E112    mov         dword ptr [edi+20],eax
 0068E115    add         edi,28
 0068E118    lea         esi,[ebx+28];TKalmanExpression.State:TKalmanFilter
 0068E11B    mov         ecx,12
 0068E120    rep movs    dword ptr [edi],dword ptr [esi]
 0068E122    pop         edi
 0068E123    pop         esi
 0068E124    pop         ebx
 0068E125    ret
*}
end;

//0068E128
function TKalmanExpression.GetDataType:TDataType;
begin
{*
 0068E128    xor         eax,eax
 0068E12A    ret
*}
end;

//0068E12C
procedure TKalmanExpression.GetPerUnits1;
begin
{*
 0068E12C    mov         eax,dword ptr [eax+20];TKalmanExpression.expression:TExpression
 0068E12F    mov         edx,dword ptr [eax]
 0068E131    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 0068E134    ret
*}
end;

//0068E138
procedure TKalmanExpression.GetPerUnits2;
begin
{*
 0068E138    mov         eax,dword ptr [eax+20];TKalmanExpression.expression:TExpression
 0068E13B    mov         edx,dword ptr [eax]
 0068E13D    call        dword ptr [edx+50];TExpression.GetPerUnits2
 0068E140    ret
*}
end;

//0068E144
procedure TKalmanExpression.GetUnits;
begin
{*
 0068E144    mov         eax,dword ptr [eax+20];TKalmanExpression.expression:TExpression
 0068E147    mov         edx,dword ptr [eax]
 0068E149    call        dword ptr [edx+48];TExpression.GetUnits
 0068E14C    ret
*}
end;

//0068E150
procedure TKalmanExpression.GetValue;
begin
{*
 0068E150    push        ebx
 0068E151    add         esp,0FFFFFFF8
 0068E154    mov         ebx,eax
 0068E156    mov         edx,dword ptr ds:[78BDC0];0x0 gvar_0078BDC0
 0068E15C    mov         eax,ebx
 0068E15E    mov         ecx,dword ptr [eax]
 0068E160    call        dword ptr [ecx+98];TKalmanExpression.Update
 0068E166    call        00682F08
 0068E16B    fsub        qword ptr [ebx+28];TKalmanExpression.State:TKalmanFilter
 0068E16E    add         esp,0FFFFFFF8
 0068E171    fstp        qword ptr [esp]
 0068E174    wait
 0068E175    lea         eax,[ebx+28];TKalmanExpression.State:TKalmanFilter
 0068E178    call        005C4480
 0068E17D    fstp        qword ptr [esp]
 0068E180    wait
 0068E181    fld         qword ptr [esp]
 0068E184    pop         ecx
 0068E185    pop         edx
 0068E186    pop         ebx
 0068E187    ret
*}
end;

//0068E188
procedure TKalmanExpression.SetIffy(IsIffy:Boolean);
begin
{*
 0068E188    push        ebx
 0068E189    push        esi
 0068E18A    mov         ebx,edx
 0068E18C    mov         esi,eax
 0068E18E    mov         edx,ebx
 0068E190    mov         eax,esi
 0068E192    call        TExpression.SetIffy
 0068E197    mov         edx,ebx
 0068E199    mov         eax,dword ptr [esi+20];TKalmanExpression.expression:TExpression
 0068E19C    mov         ecx,dword ptr [eax]
 0068E19E    call        dword ptr [ecx+74];TExpression.SetIffy
 0068E1A1    pop         esi
 0068E1A2    pop         ebx
 0068E1A3    ret
*}
end;

//0068E1A4
procedure TKalmanExpression.Swallow;
begin
{*
 0068E1A4    push        ebx
 0068E1A5    mov         ebx,eax
 0068E1A7    mov         eax,ebx
 0068E1A9    call        TExpression.Swallow
 0068E1AE    mov         eax,dword ptr [ebx+20];TKalmanExpression.expression:TExpression
 0068E1B1    mov         edx,dword ptr [eax]
 0068E1B3    call        dword ptr [edx+88];TExpression.Swallow
 0068E1B9    pop         ebx
 0068E1BA    ret
*}
end;

//0068E1BC
{*procedure TKalmanExpression.ToString(?:?);
begin
 0068E1BC    push        ebp
 0068E1BD    mov         ebp,esp
 0068E1BF    push        0
 0068E1C1    push        ebx
 0068E1C2    push        esi
 0068E1C3    mov         esi,edx
 0068E1C5    mov         ebx,eax
 0068E1C7    xor         eax,eax
 0068E1C9    push        ebp
 0068E1CA    push        68E20F
 0068E1CF    push        dword ptr fs:[eax]
 0068E1D2    mov         dword ptr fs:[eax],esp
 0068E1D5    push        68E228;'Kalman('
 0068E1DA    lea         edx,[ebp-4]
 0068E1DD    mov         eax,dword ptr [ebx+20];TKalmanExpression.expression:TExpression
 0068E1E0    mov         ecx,dword ptr [eax]
 0068E1E2    call        dword ptr [ecx-24];TExpression.ToString
 0068E1E5    push        dword ptr [ebp-4]
 0068E1E8    push        68E244;')'
 0068E1ED    mov         eax,esi
 0068E1EF    mov         edx,3
 0068E1F4    call        @UStrCatN
 0068E1F9    xor         eax,eax
 0068E1FB    pop         edx
 0068E1FC    pop         ecx
 0068E1FD    pop         ecx
 0068E1FE    mov         dword ptr fs:[eax],edx
 0068E201    push        68E216
 0068E206    lea         eax,[ebp-4]
 0068E209    call        @UStrClr
 0068E20E    ret
>0068E20F    jmp         @HandleFinally
>0068E214    jmp         0068E206
 0068E216    pop         esi
 0068E217    pop         ebx
 0068E218    pop         ecx
 0068E219    pop         ebp
 0068E21A    ret
end;*}

//0068E248
procedure TKalmanExpression.Update(frame:Cardinal);
begin
{*
 0068E248    push        ebx
 0068E249    push        esi
 0068E24A    mov         esi,edx
 0068E24C    mov         ebx,eax
 0068E24E    cmp         esi,dword ptr [ebx+18];TKalmanExpression...........................FrameLastUpdated:Card...
>0068E251    je          0068E278
 0068E253    mov         eax,dword ptr [ebx+20];TKalmanExpression.expression:TExpression
 0068E256    mov         edx,dword ptr [eax]
 0068E258    call        dword ptr [edx];TExpression.Evaluate
 0068E25A    add         esp,0FFFFFFF8
 0068E25D    fstp        qword ptr [esp]
 0068E260    wait
 0068E261    call        00682F08
 0068E266    add         esp,0FFFFFFF8
 0068E269    fstp        qword ptr [esp]
 0068E26C    wait
 0068E26D    lea         eax,[ebx+28];TKalmanExpression.State:TKalmanFilter
 0068E270    call        005C4308
 0068E275    mov         dword ptr [ebx+18],esi;TKalmanExpression............................FrameLastUpdated:Car...
 0068E278    pop         esi
 0068E279    pop         ebx
 0068E27A    ret
*}
end;

//0068E27C
procedure TObjectValue.GetGuiFields(DeviceName:string; DeviceNumber:Integer; Field:string);
begin
{*
 0068E27C    push        ebp
 0068E27D    mov         ebp,esp
 0068E27F    add         esp,0FFFFFFE8
 0068E282    push        ebx
 0068E283    push        esi
 0068E284    xor         ebx,ebx
 0068E286    mov         dword ptr [ebp-18],ebx
 0068E289    mov         dword ptr [ebp-4],ebx
 0068E28C    mov         dword ptr [ebp-0C],ecx
 0068E28F    mov         dword ptr [ebp-8],edx
 0068E292    mov         ebx,eax
 0068E294    mov         eax,dword ptr [ebp-8]
 0068E297    test        eax,eax
>0068E299    je          0068E29F
 0068E29B    xor         edx,edx
 0068E29D    mov         dword ptr [eax],edx
 0068E29F    mov         eax,dword ptr [ebp+8]
 0068E2A2    test        eax,eax
>0068E2A4    je          0068E2AA
 0068E2A6    xor         edx,edx
 0068E2A8    mov         dword ptr [eax],edx
 0068E2AA    xor         eax,eax
 0068E2AC    push        ebp
 0068E2AD    push        68E450
 0068E2B2    push        dword ptr fs:[eax]
 0068E2B5    mov         dword ptr fs:[eax],esp
 0068E2B8    lea         edx,[ebp-4]
 0068E2BB    mov         eax,ebx
 0068E2BD    mov         ecx,dword ptr [eax]
 0068E2BF    call        dword ptr [ecx-24];TObjectValue.ToString
 0068E2C2    mov         edx,dword ptr [ebp-4]
 0068E2C5    mov         eax,68E46C;'.'
 0068E2CA    call        Pos
 0068E2CF    mov         ebx,eax
 0068E2D1    test        ebx,ebx
>0068E2D3    jg          0068E2F6
 0068E2D5    mov         eax,dword ptr [ebp+8]
 0068E2D8    mov         edx,dword ptr [ebp-4]
 0068E2DB    call        @UStrAsg
 0068E2E0    mov         eax,dword ptr [ebp-0C]
 0068E2E3    mov         dword ptr [eax],0FFFFFFFF
 0068E2E9    mov         eax,dword ptr [ebp-8]
 0068E2EC    call        @UStrClr
>0068E2F1    jmp         0068E432
 0068E2F6    mov         eax,dword ptr [ebp-8]
 0068E2F9    push        eax
 0068E2FA    mov         ecx,ebx
 0068E2FC    dec         ecx
 0068E2FD    mov         edx,1
 0068E302    mov         eax,dword ptr [ebp-4]
 0068E305    call        @UStrCopy
 0068E30A    mov         esi,dword ptr [ebp-4]
 0068E30D    test        esi,esi
>0068E30F    je          0068E316
 0068E311    sub         esi,4
 0068E314    mov         esi,dword ptr [esi]
 0068E316    mov         eax,dword ptr [ebp+8]
 0068E319    push        eax
 0068E31A    lea         edx,[ebx+1]
 0068E31D    mov         ecx,esi
 0068E31F    mov         eax,dword ptr [ebp-4]
 0068E322    call        @UStrCopy
 0068E327    mov         eax,dword ptr [ebp-0C]
 0068E32A    xor         edx,edx
 0068E32C    mov         dword ptr [eax],edx
 0068E32E    mov         dword ptr [ebp-10],1
 0068E335    mov         eax,dword ptr [ebp-8]
 0068E338    mov         eax,dword ptr [eax]
 0068E33A    mov         dword ptr [ebp-14],eax
 0068E33D    mov         eax,dword ptr [ebp-14]
 0068E340    test        eax,eax
>0068E342    je          0068E349
 0068E344    sub         eax,4
 0068E347    mov         eax,dword ptr [eax]
 0068E349    mov         ebx,eax
 0068E34B    cmp         ebx,1
>0068E34E    jl          0068E40E
 0068E354    mov         eax,dword ptr [ebp-8]
 0068E357    mov         eax,dword ptr [eax]
 0068E359    movzx       eax,word ptr [eax+ebx*2-2]
 0068E35E    mov         esi,68E470;gvar_0068E470
 0068E363    cmp         ax,0FF
>0068E367    ja          0068E36F
 0068E369    movzx       eax,ax
 0068E36C    bt          dword ptr [esi],eax
 0068E36F    setb        al
 0068E372    test        al,al
>0068E374    je          0068E40E
 0068E37A    lea         eax,[ebp-18]
 0068E37D    push        eax
 0068E37E    mov         eax,dword ptr [ebp-8]
 0068E381    mov         eax,dword ptr [eax]
 0068E383    mov         ecx,ebx
 0068E385    mov         edx,1
 0068E38A    call        @UStrCopy
 0068E38F    mov         eax,dword ptr [ebp-18]
 0068E392    lea         edx,[ebp-4]
 0068E395    call        LowerCase
 0068E39A    mov         eax,dword ptr [ebp-4]
 0068E39D    mov         edx,68E49C;'p5'
 0068E3A2    call        @UStrEqual
>0068E3A7    je          0068E40E
 0068E3A9    mov         eax,dword ptr [ebp-4]
 0068E3AC    mov         edx,68E4B0;'vr920'
 0068E3B1    call        @UStrEqual
>0068E3B6    je          0068E40E
 0068E3B8    mov         eax,dword ptr [ebp-4]
 0068E3BB    mov         edx,68E4C8;'z800'
 0068E3C0    call        @UStrEqual
>0068E3C5    je          0068E40E
 0068E3C7    mov         eax,dword ptr [ebp-4]
 0068E3CA    mov         edx,68E4E0;'xbox360'
 0068E3CF    call        @UStrEqual
>0068E3D4    je          0068E40E
 0068E3D6    mov         eax,dword ptr [ebp-4]
 0068E3D9    mov         edx,68E4FC;'dualshock3'
 0068E3DE    call        @UStrEqual
>0068E3E3    je          0068E40E
 0068E3E5    mov         eax,dword ptr [ebp-8]
 0068E3E8    mov         eax,dword ptr [eax]
 0068E3EA    movzx       eax,word ptr [eax+ebx*2-2]
 0068E3EF    sub         eax,30
 0068E3F2    imul        dword ptr [ebp-10]
 0068E3F5    mov         edx,dword ptr [ebp-0C]
 0068E3F8    add         dword ptr [edx],eax
 0068E3FA    mov         eax,dword ptr [ebp-10]
 0068E3FD    add         eax,eax
 0068E3FF    lea         eax,[eax+eax*4]
 0068E402    mov         dword ptr [ebp-10],eax
 0068E405    dec         ebx
 0068E406    test        ebx,ebx
>0068E408    jne         0068E354
 0068E40E    mov         eax,dword ptr [ebp-8]
 0068E411    push        eax
 0068E412    mov         eax,dword ptr [ebp-8]
 0068E415    mov         eax,dword ptr [eax]
 0068E417    mov         ecx,ebx
 0068E419    mov         edx,1
 0068E41E    call        @UStrCopy
 0068E423    cmp         dword ptr [ebp-10],1
>0068E427    jne         0068E432
 0068E429    mov         eax,dword ptr [ebp-0C]
 0068E42C    mov         dword ptr [eax],0FFFFFFFF
 0068E432    xor         eax,eax
 0068E434    pop         edx
 0068E435    pop         ecx
 0068E436    pop         ecx
 0068E437    mov         dword ptr fs:[eax],edx
 0068E43A    push        68E457
 0068E43F    lea         eax,[ebp-18]
 0068E442    call        @UStrClr
 0068E447    lea         eax,[ebp-4]
 0068E44A    call        @UStrClr
 0068E44F    ret
>0068E450    jmp         @HandleFinally
>0068E455    jmp         0068E43F
 0068E457    pop         esi
 0068E458    pop         ebx
 0068E459    mov         esp,ebp
 0068E45B    pop         ebp
 0068E45C    ret         4
*}
end;

//0068E514
function TObjectValue.Module:TObject;
begin
{*
 0068E514    xor         eax,eax
 0068E516    ret
*}
end;

Initialization
//00782020
{*
 00782020    push        ebp
 00782021    mov         ebp,esp
 00782023    add         esp,0FFFFFFF8
 00782026    push        ebx
 00782027    push        esi
 00782028    push        edi
 00782029    sub         dword ptr ds:[81ECF8],1
>00782030    jae         0078208C
 00782032    xor         edx,edx
 00782034    push        ebp
 00782035    push        782071
 0078203A    push        dword ptr fs:[edx]
 0078203D    mov         dword ptr fs:[edx],esp
 00782040    mov         eax,7820A0;'Initializing PieExpression'
 00782045    call        004FA5FC
 0078204A    call        user32.GetDoubleClickTime
 0078204F    mov         dword ptr [ebp-8],eax
 00782052    xor         eax,eax
 00782054    mov         dword ptr [ebp-4],eax
 00782057    fild        qword ptr [ebp-8]
 0078205A    fdiv        dword ptr ds:[7820D8];1000:Single
 00782060    fstp        qword ptr ds:[81ECF0];gvar_0081ECF0:Double
 00782066    wait
 00782067    xor         eax,eax
 00782069    pop         edx
 0078206A    pop         ecx
 0078206B    pop         ecx
 0078206C    mov         dword ptr fs:[eax],edx
>0078206F    jmp         0078208C
>00782071    jmp         @HandleOnException
 00782076    dd          1
 0078207A    dd          00418C04;Exception
 0078207E    dd          00782082
 00782082    call        004FA644
 00782087    call        @DoneExcept
 0078208C    pop         edi
 0078208D    pop         esi
 0078208E    pop         ebx
 0078208F    pop         ecx
 00782090    pop         ecx
 00782091    pop         ebp
 00782092    ret
*}
Finalization
end.