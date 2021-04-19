//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit150;

interface

uses
  SysUtils, Classes, JvFormPlacement, JvMRUManager, JvAppIniStorage, TntMenus, TntDialogs, TntComCtrls, JvAppStorage, JvWndProcHook, ImgList, Menus, Graphics, IniFiles;

type
  TJvWinMinMaxInfo = class(TPersistent)
  published
    procedure Assign(Source:TPersistent);//0072278C
    function DefaultMinMaxInfo:Boolean;//00722894
  public
    FOwner:TJvFormPlacement;//f4
    FMinMaxInfo:tagMINMAXINFO;//f8
    procedure Assign(Source:TPersistent); virtual;//v8//0072278C
    //function GetMaxPosLeft(?:Integer):?;//007227CC
    //procedure SetMaxPosLeft(Value:Integer; ?:?);//0072281C
  end;
  TJvFormPlacementVersionCheck = (fpvcNocheck, fpvcCheckGreaterEqual, fpvcCheckEqual);
  TJvFormPlacement = class(TJvComponent)
  published
    function ReadInteger(Ident:string; Default:Integer):Integer;//0072224C
    procedure WriteFloat(Ident:string; AValue:Double);//007221AC
    //procedure ReadFloat(Ident:string; Default:Double; ?:?);//007220F4
    procedure WriteInteger(Ident:string; AValue:Integer);//007222F0
    procedure EraseSections;//007224DC
    //procedure WriteDateTime(Ident:string; AValue:TDateTime; ?:?);//00722440
    //procedure ReadDateTime(Ident:string; Default:TDateTime; ?:?);//0072238C
    function IsActive:Boolean;//007224E8
    procedure SaveFormPlacement;//007224FC
    constructor Create(AOwner:TComponent);//007211CC
    destructor Destroy();//007212C4
    procedure RestoreFormPlacement;//00722590
    function ReadBoolean(Ident:string; Default:Boolean):Boolean;//00721FB0
    procedure WriteBoolean(Ident:string; AValue:Boolean);//00722058
    //procedure ReadString(Ident:string; Default:string; ?:?);//00721E64
    procedure WriteString(Ident:string; AValue:string);//00721F14
  public
    FActive:Boolean;//f38
    FAppStorage:TJvCustomAppStorage;//f3C
    FAppStoragePath:string;//f40
    FLinks:TList;//f44
    FOptions:TPlacementOptions;//f48
    FVersion:Integer;//f4C
    FVersionCheck:TJvFormPlacementVersionCheck;//f50
    FSaved:Boolean;//f51
    FRestored:Boolean;//f52
    FDestroying:Boolean;//f53
    FPreventResize:Boolean;//f54
    FWinMinMaxInfo:TJvWinMinMaxInfo;//f58
    FDefMaximize:Boolean;//f5C
    FWinHook:TJvWindowHook;//f60
    FSaveFormShow:TNotifyEvent;//f68
    f6C:dword;//f6C
    FSaveFormDestroy:TNotifyEvent;//f70
    f74:dword;//f74
    FSaveFormCloseQuery:TCloseQueryEvent;//f78
    f7C:dword;//f7C
    FOnSavePlacement:TNotifyEvent;//f80
    f82:word;//f82
    f84:dword;//f84
    FOnRestorePlacement:TNotifyEvent;//f88
    f8A:word;//f8A
    f8C:dword;//f8C
    FBeforeSavePlacement:TNotifyEvent;//f90
    f92:word;//f92
    f94:dword;//f94
    FAfterSavePlacement:TNotifyEvent;//f98
    f9A:word;//f9A
    f9C:dword;//f9C
    FBeforeRestorePlacement:TNotifyEvent;//fA0
    fA2:word;//fA2
    fA4:dword;//fA4
    FAfterRestorePlacement:TNotifyEvent;//fA8
    fAA:word;//fAA
    fAC:dword;//fAC
    destructor Destroy(); virtual;//007212C4
    procedure Loaded; virtual;//vC//0072132C
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00722760
    constructor Create(AOwner:TComponent); virtual;//v2C//007211CC
    procedure v34; virtual;//v34//00721D0C
    procedure v38; virtual;//v38//00721DF0
    procedure sub_00721CEC; dynamic;//00721CEC
    procedure sub_00721CCC; dynamic;//00721CCC
    procedure SetAppStoragePath(Value:string);//00721404
    procedure SetMinMaxInfo(Value:TJvWinMinMaxInfo);//0072162C
    procedure SetPreventResize(Value:Boolean);//00721CA0
    procedure SetAppStorage(Value:TJvCustomAppStorage);//00723680
  end;
  TJvFormStorage = class(TJvFormPlacement)
  published
    procedure SetNotification;//00722984
    destructor Destroy();//00722938
    constructor Create(AOwner:TComponent);//007228CC
  public
    FStoredProps:TJvFormStorageStringList;//fB0
    FStoredValues:TJvStoredValues;//fB4
    FStoredPropsPath:string;//fB8
    destructor Destroy(); virtual;//00722938
    procedure Loaded; virtual;//vC//007229F0
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00722A30
    //procedure v24(?:?); virtual;//v24//00722A0C
    constructor Create(AOwner:TComponent); virtual;//v2C//007228CC
    procedure v34; virtual;//v34//00722C40
    procedure v38; virtual;//v38//00722CD4
    procedure v3C; virtual;//v3C//00722A94
    procedure v40; virtual;//v40//00722B58
    //function GetStoredProps:?;//007229C0
    procedure SetStoredProps(Value:TStrings);//007229C8
    procedure SetStoredValues(Value:TJvStoredValues);//007229E0
    //procedure GetStoredValuesPath(?:?);//007234DC
    procedure SetStoredValuesPath(Value:string);//007234F8
  end;
  TJvFormStorageStringList = class(TStringList)
  published
    procedure LoadFromStream(Stream:TStream);//007236EC
    procedure Assign(Source:TPersistent);//0072368C
    constructor Create(AFormStorage:TJvFormStorage);//007236B0
  public
    ......FFormStorage:TJvFormStorage;//f58
    procedure Assign(Source:TPersistent); virtual;//v8//0072368C
    procedure LoadFromStream(Stream:TStream); virtual;//v70//007236EC
  end;
  TJvIniLink = class(TPersistent)
  published
    destructor Destroy();//00722D64
  public
    FStorage:TJvFormPlacement;//f4
    FOnSave:TNotifyEvent;//f8
    fA:word;//fA
    fC:TJvMRUManager;//fC
    FOnLoad:TNotifyEvent;//f10
    f12:word;//f12
    f14:TJvMRUManager;//f14
    destructor Destroy(); virtual;//00722D64
    procedure vC; virtual;//vC//00722DCC
    procedure v10; virtual;//v10//00722DE0
  end;
  TJvStoredValueEvent = procedure(Sender:TJvStoredValue; var AValue:Variant) of object;;
  TJvStoredValue = class(TCollectionItem)
  published
    procedure Save;//00722FEC
    procedure Restore;//007231C0
    procedure Clear;//00722F8C
    constructor Create(Collection:TCollection);//00722DF4
    procedure Assign(Source:TPersistent);//00722E78
  public
    FName:string;//fC
    FValue:Variant;//f10
    FKeyString:string;//f20
    FOnSave:TJvStoredValueEvent;//f28
    f2A:word;//f2A
    f2C:dword;//f2C
    FOnRestore:TJvStoredValueEvent;//f30
    f32:word;//f32
    f34:dword;//f34
    procedure Assign(Source:TPersistent); virtual;//v8//00722E78
    //procedure GetDisplayName(?:?); virtual;//vC//00722ED8
    procedure SetName(Value:string); virtual;//v18//00722F00
    constructor Create(Collection:TCollection); virtual;//v1C//00722DF4
    procedure Save; virtual;//v20//00722FEC
    procedure Restore; virtual;//v24//007231C0
    procedure IsStoredValue(Value:Variant);//00722FDC
  end;
  TJvStoredValues = class(TOwnedCollection)
  published
    procedure SaveValues;//00723484
    procedure RestoreValues;//007234B0
    constructor Create(AOwner:TPersistent);//007233F4
    function IndexOf(Name:string):Integer;//00723430
  public
    FStorage:TJvFormPlacement;//f1C
    FPath:string;//f20
    procedure SaveValues; virtual;//v28//00723484
    procedure RestoreValues; virtual;//v2C//007234B0
  end;
  TGetItemEvent = procedure(Sender:TObject; var Caption:string; var ShortCut:TShortCut; UserData:Integer) of object;;
  TReadItemEvent = procedure(Sender:TObject; AppStorage:TJvCustomAppStorage; const Path:string; Index:Integer; var RecentName:string; var UserData:Integer) of object;;
  TWriteItemEvent = procedure(Sender:TObject; AppStorage:TJvCustomAppStorage; const Path:string; Index:Integer; const RecentName:string; UserData:Integer) of object;;
  TClickMenuEvent = procedure(Sender:TObject; const RecentName:string; const Caption:string; UserData:Integer) of object;;
  TGetItemInfoEvent = procedure(Sender:TObject; Item:TMenuItem) of object;;
  TGetItemInfoExEvent = procedure(Sender:TObject; Item:TMenuItem; Index:Integer) of object;;
  TAccelDelimiter = (adTab, adSpace);
  TRecentMode = (rmInsert, rmAppend);
  TMenuLocation = (mruChild, mruSibling);
  TJvRecentStrings = class(TStringList)
  published
    procedure DeleteExceed;//00725B10
    procedure Remove(S:string);//00725B9C
    procedure AddStrings(Strings:TStrings);//00725C88
    constructor Create;//00725A58
    function Add(S:string):Integer;//00725BB8
  public
    FMaxSize:Integer;//f58
    FMode:TRecentMode;//f5C
    procedure SetTextStr(const Value:UnicodeString); virtual;//v2C//00725A98
    function Add(S:string):Integer; virtual;//v38//00725BB8
    procedure AddStrings(Strings:TStrings); virtual;//v40//00725C88
  end;
  TJvMRUManager = class(TJvComponent)
  published
    procedure Save;//0072591C
    function IsMenuEnabled:Boolean;//00725DBC
    procedure Load;//00725914
    procedure Clear;//00724D58
    procedure Remove(RecentName:string);//00724D6C
    procedure Add(RecentName:string; UserData:Integer);//00724CF0
    constructor Create(AOwner:TComponent);//007249BC
    destructor Destroy();//00724A64
    procedure UpdateRecentMenu;//00724F0C
    procedure LoadFromAppStorage(AppStorage:TJvCustomAppStorage; Path:string);//00725768
    procedure SaveToAppStorage(AppStorage:TJvCustomAppStorage; Path:string);//0072586C
    procedure RemoveInvalid;//00725964
  public
    FStrings:TJvRecentStrings;//f38
    FItems:TList;//f3C
    FIniLink:TJvIniLink;//f40
    FSeparateSize:word;//f44
    FAutoEnable:Boolean;//f46
    FAutoUpdate:Boolean;//f47
    FShowAccelChar:Boolean;//f48
    FRemoveOnSelect:Boolean;//f49
    FStartAccel:Cardinal;//f4C
    FAccelDelimiter:TAccelDelimiter;//f50
    FRecentMenu:TMenuItem;//f54
    FOnChange:TNotifyEvent;//f58
    f5A:word;//f5A
    f5C:dword;//f5C
    FOnGetItem:TGetItemEvent;//f60
    f62:word;//f62
    f64:dword;//f64
    FOnClick:TClickMenuEvent;//f68
    f6A:word;//f6A
    f6C:dword;//f6C
    FOnReadItem:TReadItemEvent;//f70
    f72:word;//f72
    f74:dword;//f74
    FOnWriteItem:TWriteItemEvent;//f78
    f7A:word;//f7A
    f7C:dword;//f7C
    FOnAfterUpdate:TNotifyEvent;//f80
    f82:word;//f82
    f84:dword;//f84
    FOnBeforeUpdate:TNotifyEvent;//f88
    f8A:word;//f8A
    f8C:dword;//f8C
    FOnItemInfo:TGetItemInfoEvent;//f90
    f92:word;//f92
    f94:dword;//f94
    FOnItemInfoEx:TGetItemInfoExEvent;//f98
    f9A:word;//f9A
    f9C:dword;//f9C
    FDuplicates:TDuplicates;//fA0
    FMenuLocation:TMenuLocation;//fA1
    FMaxLength:Integer;//fA4
    FCanvas:TCanvas;//fA8
    FStartEllipsis:Boolean;//fAC
    destructor Destroy(); virtual;//00724A64
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00724ABC
    constructor Create(AOwner:TComponent); virtual;//v2C//007249BC
    procedure v34; virtual;//v34//00725944
    procedure v38; virtual;//v38//00725924
    //procedure sub_00724B10(?:?; ?:?); dynamic;//00724B10
    //procedure sub_00725A04(?:?; ?:?); dynamic;//00725A04
    //procedure sub_007259E4(?:?); dynamic;//007259E4
    //procedure sub_00724AEC(?:?; ?:?); dynamic;//00724AEC
    //procedure sub_007254C0(?:?; ?:?; ?:?; ?:?; ?:?); dynamic;//007254C0
    //procedure sub_00725358(?:?; ?:?; ?:?; ?:?; ?:?); dynamic;//00725358
    procedure sub_00725344; dynamic;//00725344
    //function GetCapacity:?;//00724C3C
    procedure SetCapacity(Value:Integer);//00724C44
    //function GetMode:?;//00724C50
    procedure SetMode(Value:TRecentMode);//00724C58
    //function GetIniStorage:?;//00724C60
    procedure SetIniStorage(Value:TJvFormPlacement);//00724C68
    procedure SetAutoEnable(Value:Boolean);//00724C74
    procedure SetStartAccel(Value:Cardinal);//00724CAC
    procedure SetAccelDelimiter(Value:TAccelDelimiter);//00724CC0
    procedure SetShowAccelChar(Value:Boolean);//00724CDC
    procedure SetRecentMenu(Value:TMenuItem);//00725224
    procedure SetSeparateSize(Value:Word);//00725254
    procedure SetDuplicates(Value:TDuplicates);//00725A3C
    procedure SetMenuLocation(Value:TMenuLocation);//00725DA8
    procedure SetMaxLength(Value:Integer);//00725DF8
    procedure SetStartEllipsis(Value:Boolean);//00725F58
  end;
  TJvAppIniStorageOptions = class(TJvAppStorageOptions)
  published
    procedure Assign(Source:TPersistent);//0072690C
    constructor sub_007268C4;//007268C4
  public
    FReplaceCRLF:Boolean;//f1C
    FPreserveLeadingTrailingBlanks:Boolean;//f1D
    procedure Assign(Source:TPersistent); virtual;//v8//0072690C
    constructor v44; virtual;//v44//007268C4
    procedure SetReplaceCRLF(Value:Boolean); virtual;//v48//00726950
    procedure SetPreserveLeadingTrailingBlanks(Value:Boolean); virtual;//v4C//00726954
  end;
  TJvCustomAppIniStorage = class(TJvCustomAppMemoryFileStorage)
  published
    destructor Destroy();//007269A4
    constructor Create(AOwner:TComponent);//00726958
  public
    FIniFile:TMemIniFile;//f178
    FDefaultSection:string;//f17C
    destructor Destroy(); virtual;//007269A4
    constructor Create(AOwner:TComponent); virtual;//v2C//00726958
    constructor Create; virtual;//v38//00727FE8
    //procedure v3C(?:?; ?:?; ?:?); virtual;//v3C//00726D3C
    //procedure v40(?:?; ?:?; ?:?); virtual;//v40//00727368
    //procedure v44(?:?; ?:?; ?:?); virtual;//v44//00727574
    //function v48(?:?; ?:?):?; virtual;//v48//00727DB0
    //function v4C(?:?):?; virtual;//v4C//00727D3C
    //function v50(?:?):?; virtual;//v50//00726D90
    //procedure v58(?:?); virtual;//v58//00726E00
    //procedure v5C(?:?); virtual;//v5C//00727ACC
    //function v60(?:?; ?:?):?; virtual;//v60//00726E70
    //procedure v64(?:?; ?:?); virtual;//v64//00726F30
    //procedure v68(?:?; ?:?; ?:?; ?:?); virtual;//v68//00726FC0
    //procedure v6C(?:?; ?:?); virtual;//v6C//00727094
    //procedure v70(?:?; ?:?; ?:?); virtual;//v70//0072711C
    //procedure v74(?:?; ?:?); virtual;//v74//007271B8
    //function v80(?:?; ?:?; ?:?):?; virtual;//v80//00727230
    //procedure v84(?:?; ?:?; ?:?); virtual;//v84//007272D4
    //procedure v108(?:?); virtual;//v108//00727FF0
    //procedure v10C(?:?); virtual;//v10C//0072806C
    //procedure v110(?:?); virtual;//v110//007280D0
    //procedure v118(?:?; ?:?; ?:?); virtual;//v118//00727880
    //procedure v11C(?:?; ?:?; ?:?); virtual;//v11C//00727978
    //procedure v120(?:?; ?:?); virtual;//v120//00727C40
    //function GetStorageOptions:?;//007277F4
    procedure SetStorageOptions(Value:TJvAppIniStorageOptions);//007277FC
  end;
  TJvAppIniFileStorage = class(TJvCustomAppIniStorage)
  published
    procedure Reload;//00728218
    procedure Flush;//007280F8
  public
    procedure Flush; virtual;//vEC//007280F8
    procedure Reload; virtual;//vF0//00728218
  end;
  TTntMenuItem = class(TMenuItem)
  end;
  TTntMainMenu = class(TMainMenu)
  end;
  TTntPopupMenu = class(TPopupMenu)
  end;
  TTntOpenDialog = class(TOpenDialog)
  end;
  TTntSaveDialog = class(TSaveDialog)
  end;
  TTntPageControl = class(TPageControl)
  end;
  TTntTabSheet = class(TTabSheet)
  end;
  TTntStatusBar = class(TStatusBar)
  end;
  TTntStreamCharSet = (csAnsi, csUnicode);
    procedure Loaded;//0072132C
    //procedure sub_00721360(?:?; ?:TJvIniLink);//00721360
    //procedure sub_00721378(?:TJvFormPlacement; ?:?);//00721378
    procedure sub_007213C4(?:TJvFormPlacement; ?:Pointer);//007213C4
    //function sub_007213D4(?:TJvFormPlacement):?;//007213D4
    procedure sub_00721460(?:TJvFormPlacement);//00721460
    procedure sub_0072152C(?:TJvFormPlacement);//0072152C
    procedure sub_00721598(?:TJvFormPlacement);//00721598
    procedure sub_007215CC(?:TJvFormPlacement);//007215CC
    procedure sub_007215D8(?:TJvFormPlacement);//007215D8
    //function sub_00721600(?:TJvFormPlacement):?;//00721600
    procedure sub_00721610(?:TJvFormPlacement);//00721610
    //procedure sub_007218C8(?:?; ?:?);//007218C8
    //procedure sub_00721944(?:?; ?:?; ?:?);//00721944
    //procedure sub_007219DC(?:?; ?:?);//007219DC
    procedure sub_00721A64(?:TJvFormPlacement);//00721A64
    procedure sub_00721B88(?:TJvFormPlacement);//00721B88
    procedure sub_00721CCC;//00721CCC
    procedure sub_00721CEC;//00721CEC
    procedure sub_00721D0C;//00721D0C
    procedure sub_00721DF0;//00721DF0
    //procedure sub_00721E28(?:TJvFormStorage; ?:string; ?:?; ?:?);//00721E28
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00722760
    procedure Loaded;//007229F0
    //procedure sub_00722A0C(?:?);//00722A0C
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00722A30
    procedure sub_00722A94;//00722A94
    procedure sub_00722B58;//00722B58
    procedure sub_00722C40;//00722C40
    procedure sub_00722CD4;//00722CD4
    procedure sub_00722DA4(?:TJvIniLink; ?:TJvFormPlacement);//00722DA4
    procedure sub_00722DCC;//00722DCC
    procedure sub_00722DE0;//00722DE0
    //procedure GetDisplayName(?:?);//00722ED8
    procedure SetName(Value:string);//00722F00
    //function sub_00722F68(?:TJvStoredValue):?;//00722F68
    //function sub_00723470(?:TJvStoredValues; ?:?):?;//00723470
    //procedure sub_00723514(?:TComponent; ?:?; ?:?);//00723514
    procedure sub_0072359C(?:TJvFormPlacement);//0072359C
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00724ABC
    //function sub_00724AE8(?:TJvMRUManager):?;//00724AE8
    //procedure sub_00724AEC(?:?; ?:?);//00724AEC
    //procedure sub_00724B10(?:?; ?:?);//00724B10
    procedure sub_00724D78(?:TJvMRUManager; ?:TMenuItem);//00724D78
    procedure sub_00724DF0(?:TJvMRUManager);//00724DF0
    procedure sub_007251D4(?:TJvMRUManager);//007251D4
    //procedure sub_0072526C(?:?);//0072526C
    procedure sub_0072528C(?:TJvMRUManager);//0072528C
    procedure sub_007252E8(?:TJvMRUManager);//007252E8
    procedure sub_00725344;//00725344
    //procedure sub_00725358(?:?; ?:?; ?:?; ?:?; ?:?);//00725358
    //procedure sub_007254C0(?:?; ?:?; ?:?; ?:?; ?:?);//007254C0
    //procedure sub_00725658(?:?; ?:?);//00725658
    //procedure sub_007256E0(?:?; ?:?);//007256E0
    procedure sub_00725924;//00725924
    procedure sub_00725944;//00725944
    //procedure sub_007259E4(?:?);//007259E4
    //procedure sub_00725A04(?:?; ?:?);//00725A04
    procedure SetTextStr(const Value:UnicodeString);//00725A98
    procedure sub_00725AEC(?:TJvRecentStrings; ?:Integer);//00725AEC
    //function sub_00725E0C(?:TJvMRUManager):?;//00725E0C
    //procedure sub_00725E50(?:TJvMRUManager; ?:?; ?:?);//00725E50
    procedure SetReplaceCRLF(Value:Boolean);//00726950
    procedure SetPreserveLeadingTrailingBlanks(Value:Boolean);//00726954
    //procedure sub_007269D4(?:TJvCustomAppIniStorage; ?:?; ?:?);//007269D4
    //function sub_00726B48(?:?):?;//00726B48
    //procedure sub_00726B9C(?:TJvCustomAppIniStorage; ?:?; ?:?);//00726B9C
    //procedure sub_00726C78(?:TJvCustomAppIniStorage; ?:?; ?:?);//00726C78
    //procedure sub_00726CEC(?:TJvCustomAppIniStorage; ?:?; ?:?);//00726CEC
    //procedure sub_00726D3C(?:?; ?:?; ?:?);//00726D3C
    //function sub_00726D90(?:?):?;//00726D90
    //procedure sub_00726E00(?:?);//00726E00
    //function sub_00726E70(?:?; ?:?):?;//00726E70
    //procedure sub_00726F30(?:?; ?:?);//00726F30
    //procedure sub_00726FC0(?:?; ?:?; ?:?; ?:?);//00726FC0
    //procedure sub_00727094(?:?; ?:?);//00727094
    //procedure sub_0072711C(?:?; ?:?; ?:?);//0072711C
    //procedure sub_007271B8(?:?; ?:?);//007271B8
    //function sub_00727230(?:?; ?:?; ?:?):?;//00727230
    //procedure sub_007272D4(?:?; ?:?; ?:?);//007272D4
    //procedure sub_00727368(?:?; ?:?; ?:?);//00727368
    //procedure sub_00727574(?:?; ?:?; ?:?);//00727574
    procedure sub_00727760(?:TJvCustomAppIniStorage; ?:UnicodeString; ?:UnicodeString);//00727760
    //function sub_0072780C(?:TJvCustomAppIniStorage; ?:UnicodeString; ?:UnicodeString):?;//0072780C
    //procedure sub_00727880(?:?; ?:?; ?:?);//00727880
    //procedure sub_00727978(?:?; ?:?; ?:?);//00727978
    //procedure sub_00727ACC(?:?);//00727ACC
    //procedure sub_00727C40(?:?; ?:?);//00727C40
    //function sub_00727D3C(?:?):?;//00727D3C
    //function sub_00727DB0(?:?; ?:?):?;//00727DB0
    constructor Create;//00727FE8
    //procedure sub_00727FF0(?:?);//00727FF0
    //procedure sub_0072806C(?:?);//0072806C
    //procedure sub_007280D0(?:?);//007280D0
    procedure sub_007281F4(?:TJvAppIniFileStorage);//007281F4
    procedure sub_00728278(?:TJvAppIniFileStorage);//00728278
    procedure sub_0072A620(?:UnicodeString);//0072A620
    procedure sub_0072A6FC(?:UnicodeString; ?:UnicodeString);//0072A6FC
    procedure sub_0072AAB8(?:UnicodeString; ?:UnicodeString);//0072AAB8
    //procedure sub_0072B1B4(?:?);//0072B1B4
    //procedure sub_0072BC90(?:?);//0072BC90
    //procedure sub_0072BF4C(?:?);//0072BF4C
    procedure sub_0072C138(?:IInterface);//0072C138
    //procedure sub_0072C3A4(?:?);//0072C3A4
    //procedure sub_0072D850(?:?);//0072D850
    procedure sub_0072E738(?:IInterface);//0072E738
    //procedure sub_0072EAA0(?:?; ?:?);//0072EAA0
    //procedure sub_0072EB3C(?:?; ?:?);//0072EB3C
    //procedure sub_0072EDFC(?:?);//0072EDFC
    procedure sub_0072F120(?:IInterface);//0072F120
    //procedure sub_0072F43C(?:?; ?:?);//0072F43C
    //procedure sub_0072F678(?:?);//0072F678
    procedure sub_00730ECC;//00730ECC
    procedure sub_0073129C(?:IInterface);//0073129C
    //procedure sub_00731674(?:?);//00731674
    procedure sub_00731988(?:UnicodeString);//00731988
    //procedure sub_00731B08(?:?; ?:?; ?:?);//00731B08
    procedure sub_00733134(?:TIniFile);//00733134
    procedure sub_00733A50(?:UnicodeString);//00733A50
    //procedure sub_00734094(?:?; ?:?);//00734094
    procedure sub_00734184(?:UnicodeString);//00734184
    //procedure sub_00734B88(?:UnicodeString; ?:?; ?:?);//00734B88
    //procedure sub_00736164(?:?; ?:Integer; ?:?);//00736164
    //procedure sub_0073644C(?:?; ?:?; ?:?; ?:?);//0073644C
    //procedure sub_0073706C(?:?; ?:?; ?:?; ?:?);//0073706C
    //procedure sub_00737778(?:?; ?:?; ?:?; ?:?);//00737778
    //procedure sub_00737E8C(?:?; ?:?; ?:?; ?:?);//00737E8C
    //procedure sub_00738284(?:?; ?:?; ?:?; ?:?);//00738284
    //procedure sub_00738724(?:?; ?:?; ?:?; ?:?);//00738724
    //procedure sub_00738AD0(?:?; ?:?; ?:?; ?:?; ?:?);//00738AD0
    //procedure sub_00738C88(?:?; ?:?);//00738C88
    //procedure sub_007390A4(?:?; ?:?);//007390A4
    //procedure sub_007393E8(?:?; ?:?);//007393E8
    //procedure sub_00739724(?:?; ?:?);//00739724
    //procedure sub_00739834(?:?; ?:?; ?:UnicodeString);//00739834
    //procedure sub_007399B8(?:?; ?:?; ?:?; ?:?);//007399B8
    //function sub_00739CA0(?:?):?;//00739CA0
    //function sub_00739D68(?:?):?;//00739D68
    //function sub_00739E14(?:?):?;//00739E14
    //procedure sub_00739ED8(?:?; ?:?);//00739ED8
    procedure sub_0073A1C8(?:UnicodeString);//0073A1C8
    procedure sub_0073C284(?:UnicodeString);//0073C284
    procedure sub_0073CED8(?:UnicodeString);//0073CED8
    //function sub_0073E020(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//0073E020
    //function sub_0073E2D0(?:?):?;//0073E2D0
    //function sub_0073E4C8(?:UnicodeString):?;//0073E4C8
    //procedure sub_0073E61C(?:UnicodeString; ?:?);//0073E61C
    procedure sub_0073E69C(?:UnicodeString);//0073E69C

implementation

//007211CC
constructor TJvFormPlacement.Create(AOwner:TComponent);
begin
{*
 007211CC    push        ebx
 007211CD    push        esi
 007211CE    push        edi
 007211CF    test        dl,dl
>007211D1    je          007211DB
 007211D3    add         esp,0FFFFFFF0
 007211D6    call        @ClassCreate
 007211DB    mov         esi,ecx
 007211DD    mov         ebx,edx
 007211DF    mov         edi,eax
 007211E1    mov         ecx,esi
 007211E3    xor         edx,edx
 007211E5    mov         eax,edi
 007211E7    call        TComponent.Create
 007211EC    mov         byte ptr [edi+38],1;TJvFormPlacement.FActive:Boolean
 007211F0    mov         eax,esi
 007211F2    mov         edx,dword ptr ds:[4E0C38];TForm
 007211F8    call        @IsClass
 007211FD    test        al,al
>007211FF    je          0072120D
 00721201    movzx       eax,byte ptr ds:[721298];0x7 gvar_00721298
 00721208    mov         byte ptr [edi+48],al;TJvFormPlacement.FOptions:TPlacementOptions
>0072120B    jmp         00721217
 0072120D    movzx       eax,byte ptr ds:[72129C];0x0 gvar_0072129C
 00721214    mov         byte ptr [edi+48],al;TJvFormPlacement.FOptions:TPlacementOptions
 00721217    mov         ecx,edi
 00721219    mov         dl,1
 0072121B    mov         eax,[005700A4];TJvWindowHook
 00721220    call        TJvWindowHook.Create;TJvWindowHook.Create
 00721225    mov         esi,eax
 00721227    mov         dword ptr [edi+60],esi;TJvFormPlacement.FWinHook:TJvWindowHook
 0072122A    push        edi
 0072122B    push        721638
 00721230    mov         eax,esi
 00721232    call        TJvWindowHook.SetAfterMessage
 00721237    mov         dl,1
 00721239    mov         eax,[0071F770];TJvWinMinMaxInfo
 0072123E    call        TObject.Create;TJvWinMinMaxInfo.Create
 00721243    mov         esi,eax
 00721245    mov         dword ptr [edi+58],esi;TJvFormPlacement.FWinMinMaxInfo:TJvWinMinMaxInfo
 00721248    mov         dword ptr [esi+4],edi;TJvWinMinMaxInfo.FOwner:TJvFormPlacement
 0072124B    mov         dl,1
 0072124D    mov         eax,[00439644];TList
 00721252    call        TObject.Create;TList.Create
 00721257    mov         dword ptr [edi+44],eax;TJvFormPlacement.FLinks:TList
 0072125A    xor         eax,eax
 0072125C    mov         dword ptr [edi+4C],eax;TJvFormPlacement.FVersion:Integer
 0072125F    mov         byte ptr [edi+50],1;TJvFormPlacement.FVersionCheck:TJvFormPlacementVersionCheck
 00721263    lea         eax,[edi+40];TJvFormPlacement.FAppStoragePath:string
 00721266    mov         edx,7212AC;'%FORM_NAME%'
 0072126B    call        @UStrAsg
 00721270    mov         byte ptr [edi+51],0;TJvFormPlacement.FSaved:Boolean
 00721274    mov         byte ptr [edi+52],0;TJvFormPlacement.FRestored:Boolean
 00721278    mov         byte ptr [edi+53],0;TJvFormPlacement.FDestroying:Boolean
 0072127C    mov         eax,edi
 0072127E    test        bl,bl
>00721280    je          00721291
 00721282    call        @AfterConstruction
 00721287    pop         dword ptr fs:[0]
 0072128E    add         esp,0C
 00721291    mov         eax,edi
 00721293    pop         edi
 00721294    pop         esi
 00721295    pop         ebx
 00721296    ret
*}
end;

//007212C4
destructor TJvFormPlacement.Destroy();
begin
{*
 007212C4    push        ebx
 007212C5    push        esi
 007212C6    push        edi
 007212C7    call        @BeforeDestruction
 007212CC    mov         ebx,edx
 007212CE    mov         edi,eax
>007212D0    jmp         007212E2
 007212D2    mov         eax,esi
 007212D4    call        TList.Last
 007212D9    mov         edx,eax
 007212DB    mov         eax,edi
 007212DD    call        007213C4
 007212E2    mov         esi,dword ptr [edi+44];TJvFormPlacement.FLinks:TList
 007212E5    cmp         dword ptr [esi+8],0;TList.FCount:Integer
>007212E9    jg          007212D2
 007212EB    mov         eax,dword ptr [edi+44];TJvFormPlacement.FLinks:TList
 007212EE    call        TObject.Free
 007212F3    test        byte ptr [edi+1C],10;TJvFormPlacement.FComponentState:TComponentState
>007212F7    jne         00721307
 007212F9    mov         eax,edi
 007212FB    call        007215CC
 00721300    mov         eax,edi
 00721302    call        0072152C
 00721307    mov         eax,dword ptr [edi+58];TJvFormPlacement.FWinMinMaxInfo:TJvWinMinMaxInfo
 0072130A    call        TObject.Free
 0072130F    mov         edx,ebx
 00721311    and         dl,0FC
 00721314    mov         eax,edi
 00721316    call        TComponent.Destroy
 0072131B    test        bl,bl
>0072131D    jle         00721326
 0072131F    mov         eax,edi
 00721321    call        @ClassDestroy
 00721326    pop         edi
 00721327    pop         esi
 00721328    pop         ebx
 00721329    ret
*}
end;

//0072132C
procedure TJvFormPlacement.Loaded;
begin
{*
 0072132C    push        ebx
 0072132D    push        esi
 0072132E    mov         esi,eax
 00721330    test        byte ptr [esi+1C],1;TJvFormPlacement.FComponentState:TComponentState
 00721334    setne       bl
 00721337    mov         eax,esi
 00721339    call        TComponent.Loaded
 0072133E    test        byte ptr [esi+1C],10;TJvFormPlacement.FComponentState:TComponentState
>00721342    jne         0072135D
 00721344    mov         eax,esi
 00721346    call        0072359C
 0072134B    test        bl,bl
>0072134D    je          00721356
 0072134F    mov         eax,esi
 00721351    call        00721460
 00721356    mov         eax,esi
 00721358    call        007215D8
 0072135D    pop         esi
 0072135E    pop         ebx
 0072135F    ret
*}
end;

//00721360
{*procedure sub_00721360(?:?; ?:TJvIniLink);
begin
 00721360    push        ebx
 00721361    push        esi
 00721362    mov         esi,edx
 00721364    mov         ebx,eax
 00721366    mov         edx,esi
 00721368    mov         eax,dword ptr [ebx+44]
 0072136B    call        TList.Add
 00721370    mov         dword ptr [esi+4],ebx
 00721373    pop         esi
 00721374    pop         ebx
 00721375    ret
end;*}

//00721378
{*procedure sub_00721378(?:TJvFormPlacement; ?:?);
begin
 00721378    push        ebx
 00721379    push        esi
 0072137A    push        edi
 0072137B    push        ebp
 0072137C    mov         ebx,edx
 0072137E    mov         edi,eax
 00721380    mov         eax,dword ptr [edi+44]
 00721383    mov         ebp,dword ptr [eax+8]
 00721386    dec         ebp
 00721387    test        ebp,ebp
>00721389    jl          007213BC
 0072138B    inc         ebp
 0072138C    xor         esi,esi
 0072138E    mov         eax,ebx
 00721390    sub         al,1
>00721392    jb          00721398
>00721394    je          007213A9
>00721396    jmp         007213B8
 00721398    mov         eax,dword ptr [edi+44]
 0072139B    mov         edx,esi
 0072139D    call        TList.Get
 007213A2    mov         edx,dword ptr [eax]
 007213A4    call        dword ptr [edx+0C]
>007213A7    jmp         007213B8
 007213A9    mov         eax,dword ptr [edi+44]
 007213AC    mov         edx,esi
 007213AE    call        TList.Get
 007213B3    mov         edx,dword ptr [eax]
 007213B5    call        dword ptr [edx+10]
 007213B8    inc         esi
 007213B9    dec         ebp
>007213BA    jne         0072138E
 007213BC    pop         ebp
 007213BD    pop         edi
 007213BE    pop         esi
 007213BF    pop         ebx
 007213C0    ret
end;*}

//007213C4
procedure sub_007213C4(?:TJvFormPlacement; ?:Pointer);
begin
{*
 007213C4    xor         ecx,ecx
 007213C6    mov         dword ptr [edx+4],ecx
 007213C9    mov         eax,dword ptr [eax+44];TJvFormPlacement.FLinks:TList
 007213CC    call        TList.Remove
 007213D1    ret
*}
end;

//007213D4
{*function sub_007213D4(?:TJvFormPlacement):?;
begin
 007213D4    push        ebx
 007213D5    push        esi
 007213D6    mov         ebx,eax
 007213D8    mov         esi,dword ptr [ebx+4]
 007213DB    mov         eax,esi
 007213DD    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 007213E3    call        @IsClass
 007213E8    test        al,al
>007213EA    je          007213FC
 007213EC    mov         eax,esi
 007213EE    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 007213F4    call        @AsClass
 007213F9    pop         esi
 007213FA    pop         ebx
 007213FB    ret
 007213FC    xor         eax,eax
 007213FE    pop         esi
 007213FF    pop         ebx
 00721400    ret
end;*}

//00721404
procedure TJvFormPlacement.SetAppStoragePath(Value:string);
begin
{*
 00721404    push        ebx
 00721405    push        esi
 00721406    mov         esi,edx
 00721408    mov         ebx,eax
 0072140A    test        esi,esi
>0072140C    je          0072142E
 0072140E    mov         eax,esi
 00721410    call        @UStrLen
 00721415    cmp         word ptr [esi+eax*2-2],5C
>0072141B    je          0072142E
 0072141D    lea         eax,[ebx+40];TJvFormPlacement.FAppStoragePath:string
 00721420    mov         ecx,72145C;'\'
 00721425    mov         edx,esi
 00721427    call        @UStrCat3
>0072142C    jmp         00721438
 0072142E    lea         eax,[ebx+40];TJvFormPlacement.FAppStoragePath:string
 00721431    mov         edx,esi
 00721433    call        @UStrAsg
 00721438    test        byte ptr [ebx+1C],10;TJvFormPlacement.FComponentState:TComponentState
>0072143C    jne         0072144B
 0072143E    test        byte ptr [ebx+1C],1;TJvFormPlacement.FComponentState:TComponentState
>00721442    jne         0072144B
 00721444    mov         eax,ebx
 00721446    call        0072359C
 0072144B    pop         esi
 0072144C    pop         ebx
 0072144D    ret
*}
end;

//00721460
procedure sub_00721460(?:TJvFormPlacement);
begin
{*
 00721460    push        ebx
 00721461    mov         ebx,eax
 00721463    mov         eax,dword ptr [ebx+4];TJvFormPlacement.FOwner:TComponent
 00721466    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 0072146C    call        @IsClass
 00721471    test        al,al
>00721473    je          0072152A
 00721479    mov         eax,ebx
 0072147B    call        007213D4
 00721480    mov         edx,dword ptr [eax+328]
 00721486    mov         dword ptr [ebx+68],edx;TJvFormPlacement.FSaveFormShow:TNotifyEvent
 00721489    mov         edx,dword ptr [eax+32C]
 0072148F    mov         dword ptr [ebx+6C],edx;TJvFormPlacement.?f6C:dword
 00721492    mov         eax,ebx
 00721494    call        007213D4
 00721499    mov         dword ptr [eax+32C],ebx
 0072149F    mov         dword ptr [eax+328],7218C8;sub_007218C8
 007214A9    mov         eax,ebx
 007214AB    call        007213D4
 007214B0    mov         edx,dword ptr [eax+2F8]
 007214B6    mov         dword ptr [ebx+78],edx;TJvFormPlacement.FSaveFormCloseQuery:TCloseQueryEvent
 007214B9    mov         edx,dword ptr [eax+2FC]
 007214BF    mov         dword ptr [ebx+7C],edx;TJvFormPlacement.?f7C:dword
 007214C2    mov         eax,ebx
 007214C4    call        007213D4
 007214C9    mov         dword ptr [eax+2FC],ebx
 007214CF    mov         dword ptr [eax+2F8],721944;sub_00721944
 007214D9    mov         eax,ebx
 007214DB    call        007213D4
 007214E0    mov         edx,dword ptr [eax+338]
 007214E6    mov         dword ptr [ebx+70],edx;TJvFormPlacement.FSaveFormDestroy:TNotifyEvent
 007214E9    mov         edx,dword ptr [eax+33C]
 007214EF    mov         dword ptr [ebx+74],edx;TJvFormPlacement.?f74:dword
 007214F2    mov         eax,ebx
 007214F4    call        007213D4
 007214F9    mov         dword ptr [eax+33C],ebx
 007214FF    mov         dword ptr [eax+338],7219DC;sub_007219DC
 00721509    mov         eax,ebx
 0072150B    call        007213D4
 00721510    test        byte ptr [eax+298],4
 00721517    setne       al
 0072151A    mov         byte ptr [ebx+5C],al;TJvFormPlacement.FDefMaximize:Boolean
 0072151D    cmp         byte ptr [ebx+54],0;TJvFormPlacement.FPreventResize:Boolean
>00721521    je          0072152A
 00721523    mov         eax,ebx
 00721525    call        00721B88
 0072152A    pop         ebx
 0072152B    ret
*}
end;

//0072152C
procedure sub_0072152C(?:TJvFormPlacement);
begin
{*
 0072152C    push        ebx
 0072152D    push        esi
 0072152E    mov         ebx,eax
 00721530    mov         esi,dword ptr [ebx+4];TJvFormPlacement.FOwner:TComponent
 00721533    test        esi,esi
>00721535    je          00721593
 00721537    mov         eax,esi
 00721539    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 0072153F    call        @IsClass
 00721544    test        al,al
>00721546    je          00721593
 00721548    mov         eax,ebx
 0072154A    call        007213D4
 0072154F    mov         edx,dword ptr [ebx+68];TJvFormPlacement.FSaveFormShow:TNotifyEvent
 00721552    mov         dword ptr [eax+328],edx
 00721558    mov         edx,dword ptr [ebx+6C];TJvFormPlacement.?f6C:dword
 0072155B    mov         dword ptr [eax+32C],edx
 00721561    mov         eax,ebx
 00721563    call        007213D4
 00721568    mov         edx,dword ptr [ebx+78];TJvFormPlacement.FSaveFormCloseQuery:TCloseQueryEvent
 0072156B    mov         dword ptr [eax+2F8],edx
 00721571    mov         edx,dword ptr [ebx+7C];TJvFormPlacement.?f7C:dword
 00721574    mov         dword ptr [eax+2FC],edx
 0072157A    mov         eax,ebx
 0072157C    call        007213D4
 00721581    mov         edx,dword ptr [ebx+70];TJvFormPlacement.FSaveFormDestroy:TNotifyEvent
 00721584    mov         dword ptr [eax+338],edx
 0072158A    mov         edx,dword ptr [ebx+74];TJvFormPlacement.?f74:dword
 0072158D    mov         dword ptr [eax+33C],edx
 00721593    pop         esi
 00721594    pop         ebx
 00721595    ret
*}
end;

//00721598
procedure sub_00721598(?:TJvFormPlacement);
begin
{*
 00721598    push        ebx
 00721599    mov         ebx,eax
 0072159B    test        byte ptr [ebx+1C],10
>0072159F    jne         007215CA
 007215A1    cmp         dword ptr [ebx+4],0
>007215A5    je          007215CA
 007215A7    mov         eax,dword ptr [ebx+4]
 007215AA    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 007215B0    call        @IsClass
 007215B5    test        al,al
>007215B7    je          007215CA
 007215B9    mov         eax,ebx
 007215BB    call        007213D4
 007215C0    mov         edx,eax
 007215C2    mov         eax,dword ptr [ebx+60]
 007215C5    call        TJvWindowHook.SetControl
 007215CA    pop         ebx
 007215CB    ret
*}
end;

//007215CC
procedure sub_007215CC(?:TJvFormPlacement);
begin
{*
 007215CC    xor         edx,edx
 007215CE    mov         eax,dword ptr [eax+60];TJvFormPlacement.FWinHook:TJvWindowHook
 007215D1    call        TJvWindowHook.SetControl
 007215D6    ret
*}
end;

//007215D8
procedure sub_007215D8(?:TJvFormPlacement);
begin
{*
 007215D8    push        ebx
 007215D9    mov         ebx,eax
 007215DB    mov         eax,ebx
 007215DD    call        00721600
 007215E2    test        al,al
>007215E4    jne         007215EC
 007215E6    cmp         byte ptr [ebx+54],0;TJvFormPlacement.FPreventResize:Boolean
>007215EA    je          007215F5
 007215EC    mov         eax,ebx
 007215EE    call        00721598
 007215F3    pop         ebx
 007215F4    ret
 007215F5    mov         eax,ebx
 007215F7    call        007215CC
 007215FC    pop         ebx
 007215FD    ret
*}
end;

//00721600
{*function sub_00721600(?:TJvFormPlacement):?;
begin
 00721600    push        ebx
 00721601    mov         ebx,eax
 00721603    mov         eax,dword ptr [ebx+58];TJvFormPlacement.FWinMinMaxInfo:TJvWinMinMaxInfo
 00721606    call        TJvWinMinMaxInfo.DefaultMinMaxInfo
 0072160B    xor         al,1
 0072160D    pop         ebx
 0072160E    ret
end;*}

//00721610
procedure sub_00721610(?:TJvFormPlacement);
begin
{*
 00721610    push        ebx
 00721611    mov         ebx,eax
 00721613    mov         eax,ebx
 00721615    call        00721A64
 0072161A    test        byte ptr [ebx+1C],1
>0072161E    jne         00721627
 00721620    mov         eax,ebx
 00721622    call        007215D8
 00721627    pop         ebx
 00721628    ret
*}
end;

//0072162C
procedure TJvFormPlacement.SetMinMaxInfo(Value:TJvWinMinMaxInfo);
begin
{*
 0072162C    mov         eax,dword ptr [eax+58];TJvFormPlacement.FWinMinMaxInfo:TJvWinMinMaxInfo
 0072162F    mov         ecx,dword ptr [eax]
 00721631    call        dword ptr [ecx+8];TJvWinMinMaxInfo.Assign
 00721634    ret
*}
end;

//007218C8
{*procedure sub_007218C8(?:?; ?:?);
begin
 007218C8    push        ebp
 007218C9    mov         ebp,esp
 007218CB    add         esp,0FFFFFFF8
 007218CE    push        ebx
 007218CF    push        esi
 007218D0    push        edi
 007218D1    mov         dword ptr [ebp-8],edx
 007218D4    mov         dword ptr [ebp-4],eax
 007218D7    mov         eax,dword ptr [ebp-4]
 007218DA    call        TJvFormPlacement.IsActive
 007218DF    test        al,al
>007218E1    je          00721925
 007218E3    mov         eax,dword ptr [ebp-4]
 007218E6    cmp         byte ptr [eax+52],0
>007218EA    jne         00721925
 007218EC    xor         eax,eax
 007218EE    push        ebp
 007218EF    push        72190C
 007218F4    push        dword ptr fs:[eax]
 007218F7    mov         dword ptr fs:[eax],esp
 007218FA    mov         eax,dword ptr [ebp-4]
 007218FD    call        TJvFormPlacement.RestoreFormPlacement
 00721902    xor         eax,eax
 00721904    pop         edx
 00721905    pop         ecx
 00721906    pop         ecx
 00721907    mov         dword ptr fs:[eax],edx
>0072190A    jmp         00721925
>0072190C    jmp         @HandleAnyException
 00721911    mov         eax,[0078D590];^Application:TApplication
 00721916    mov         eax,dword ptr [eax]
 00721918    mov         edx,dword ptr [ebp-4]
 0072191B    call        TApplication.HandleException
 00721920    call        @DoneExcept
 00721925    mov         eax,dword ptr [ebp-4]
 00721928    cmp         word ptr [eax+6A],0
>0072192D    je          0072193B
 0072192F    mov         ebx,dword ptr [ebp-4]
 00721932    mov         edx,dword ptr [ebp-8]
 00721935    mov         eax,dword ptr [ebx+6C]
 00721938    call        dword ptr [ebx+68]
 0072193B    pop         edi
 0072193C    pop         esi
 0072193D    pop         ebx
 0072193E    pop         ecx
 0072193F    pop         ecx
 00721940    pop         ebp
 00721941    ret
end;*}

//00721944
{*procedure sub_00721944(?:?; ?:?; ?:?);
begin
 00721944    push        ebp
 00721945    mov         ebp,esp
 00721947    push        ecx
 00721948    push        ebx
 00721949    push        esi
 0072194A    push        edi
 0072194B    mov         ebx,ecx
 0072194D    mov         dword ptr [ebp-4],eax
 00721950    mov         eax,dword ptr [ebp-4]
 00721953    cmp         word ptr [eax+7A],0
>00721958    je          00721965
 0072195A    mov         ecx,ebx
 0072195C    mov         esi,dword ptr [ebp-4]
 0072195F    mov         eax,dword ptr [esi+7C]
 00721962    call        dword ptr [esi+78]
 00721965    cmp         byte ptr [ebx],0
>00721968    je          007219D5
 0072196A    mov         eax,dword ptr [ebp-4]
 0072196D    call        TJvFormPlacement.IsActive
 00721972    test        al,al
>00721974    je          007219D5
 00721976    mov         eax,dword ptr [ebp-4]
 00721979    mov         eax,dword ptr [eax+4]
 0072197C    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 00721982    call        @IsClass
 00721987    test        al,al
>00721989    je          007219D5
 0072198B    mov         eax,dword ptr [ebp-4]
 0072198E    call        007213D4
 00721993    call        TWinControl.GetHandle
 00721998    test        eax,eax
>0072199A    je          007219D5
 0072199C    xor         eax,eax
 0072199E    push        ebp
 0072199F    push        7219BC
 007219A4    push        dword ptr fs:[eax]
 007219A7    mov         dword ptr fs:[eax],esp
 007219AA    mov         eax,dword ptr [ebp-4]
 007219AD    call        TJvFormPlacement.SaveFormPlacement
 007219B2    xor         eax,eax
 007219B4    pop         edx
 007219B5    pop         ecx
 007219B6    pop         ecx
 007219B7    mov         dword ptr fs:[eax],edx
>007219BA    jmp         007219D5
>007219BC    jmp         @HandleAnyException
 007219C1    mov         eax,[0078D590];^Application:TApplication
 007219C6    mov         eax,dword ptr [eax]
 007219C8    mov         edx,dword ptr [ebp-4]
 007219CB    call        TApplication.HandleException
 007219D0    call        @DoneExcept
 007219D5    pop         edi
 007219D6    pop         esi
 007219D7    pop         ebx
 007219D8    pop         ecx
 007219D9    pop         ebp
 007219DA    ret
end;*}

//007219DC
{*procedure sub_007219DC(?:?; ?:?);
begin
 007219DC    push        ebp
 007219DD    mov         ebp,esp
 007219DF    add         esp,0FFFFFFF8
 007219E2    push        ebx
 007219E3    push        esi
 007219E4    push        edi
 007219E5    mov         dword ptr [ebp-8],edx
 007219E8    mov         dword ptr [ebp-4],eax
 007219EB    mov         eax,dword ptr [ebp-4]
 007219EE    call        TJvFormPlacement.IsActive
 007219F3    test        al,al
>007219F5    je          00721A47
 007219F7    mov         eax,dword ptr [ebp-4]
 007219FA    cmp         byte ptr [eax+51],0
>007219FE    jne         00721A47
 00721A00    mov         eax,dword ptr [ebp-4]
 00721A03    mov         byte ptr [eax+53],1
 00721A07    xor         eax,eax
 00721A09    push        ebp
 00721A0A    push        721A27
 00721A0F    push        dword ptr fs:[eax]
 00721A12    mov         dword ptr fs:[eax],esp
 00721A15    mov         eax,dword ptr [ebp-4]
 00721A18    call        TJvFormPlacement.SaveFormPlacement
 00721A1D    xor         eax,eax
 00721A1F    pop         edx
 00721A20    pop         ecx
 00721A21    pop         ecx
 00721A22    mov         dword ptr fs:[eax],edx
>00721A25    jmp         00721A40
>00721A27    jmp         @HandleAnyException
 00721A2C    mov         eax,[0078D590];^Application:TApplication
 00721A31    mov         eax,dword ptr [eax]
 00721A33    mov         edx,dword ptr [ebp-4]
 00721A36    call        TApplication.HandleException
 00721A3B    call        @DoneExcept
 00721A40    mov         eax,dword ptr [ebp-4]
 00721A43    mov         byte ptr [eax+53],0
 00721A47    mov         eax,dword ptr [ebp-4]
 00721A4A    cmp         word ptr [eax+72],0
>00721A4F    je          00721A5D
 00721A51    mov         ebx,dword ptr [ebp-4]
 00721A54    mov         edx,dword ptr [ebp-8]
 00721A57    mov         eax,dword ptr [ebx+74]
 00721A5A    call        dword ptr [ebx+70]
 00721A5D    pop         edi
 00721A5E    pop         esi
 00721A5F    pop         ebx
 00721A60    pop         ecx
 00721A61    pop         ecx
 00721A62    pop         ebp
 00721A63    ret
end;*}

//00721A64
procedure sub_00721A64(?:TJvFormPlacement);
begin
{*
 00721A64    push        ebx
 00721A65    push        esi
 00721A66    add         esp,0FFFFFFCC
 00721A69    mov         ebx,eax
 00721A6B    mov         esi,dword ptr [ebx+4]
 00721A6E    test        esi,esi
>00721A70    je          00721B7F
 00721A76    mov         eax,esi
 00721A78    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 00721A7E    call        @IsClass
 00721A83    test        al,al
>00721A85    je          00721B7F
 00721A8B    mov         eax,ebx
 00721A8D    call        007213D4
 00721A92    call        TWinControl.HandleAllocated
 00721A97    test        al,al
>00721A99    je          00721B7F
 00721A9F    test        byte ptr [ebx+1C],1
>00721AA3    jne         00721B7F
 00721AA9    cmp         byte ptr [ebx+54],0
>00721AAD    jne         00721B7F
 00721AB3    mov         eax,ebx
 00721AB5    call        00721600
 00721ABA    test        al,al
>00721ABC    jne         00721B7F
 00721AC2    mov         dword ptr [esp],2C
 00721AC9    push        esp
 00721ACA    mov         eax,ebx
 00721ACC    call        007213D4
 00721AD1    call        TWinControl.GetHandle
 00721AD6    push        eax
 00721AD7    call        user32.GetWindowPlacement
 00721ADC    mov         eax,ebx
 00721ADE    call        007213D4
 00721AE3    call        TWinControl.GetHandle
 00721AE8    push        eax
 00721AE9    call        user32.IsWindowVisible
 00721AEE    test        eax,eax
>00721AF0    jne         00721AF8
 00721AF2    xor         eax,eax
 00721AF4    mov         dword ptr [esp+8],eax
 00721AF8    mov         eax,ebx
 00721AFA    call        007213D4
 00721AFF    cmp         byte ptr [eax+299],0
>00721B06    je          00721B4F
 00721B08    mov         eax,ebx
 00721B0A    call        007213D4
 00721B0F    movzx       eax,byte ptr [eax+299]
 00721B16    movzx       eax,word ptr [eax*2+78C56A]
 00721B1E    push        eax
 00721B1F    call        user32.GetSystemMetrics
 00721B24    neg         eax
 00721B26    mov         dword ptr [esp+14],eax
 00721B2A    mov         eax,ebx
 00721B2C    call        007213D4
 00721B31    movzx       eax,byte ptr [eax+299]
 00721B38    movzx       eax,word ptr [eax*2+78C56A]
 00721B40    inc         eax
 00721B41    push        eax
 00721B42    call        user32.GetSystemMetrics
 00721B47    neg         eax
 00721B49    mov         dword ptr [esp+18],eax
>00721B4D    jmp         00721B6C
 00721B4F    lea         ecx,[esp+2C]
 00721B53    xor         edx,edx
 00721B55    xor         eax,eax
 00721B57    call        Point
 00721B5C    mov         eax,dword ptr [esp+2C]
 00721B60    mov         dword ptr [esp+14],eax
 00721B64    mov         eax,dword ptr [esp+30]
 00721B68    mov         dword ptr [esp+18],eax
 00721B6C    push        esp
 00721B6D    mov         eax,ebx
 00721B6F    call        007213D4
 00721B74    call        TWinControl.GetHandle
 00721B79    push        eax
 00721B7A    call        user32.SetWindowPlacement
 00721B7F    add         esp,34
 00721B82    pop         esi
 00721B83    pop         ebx
 00721B84    ret
*}
end;

//00721B88
procedure sub_00721B88(?:TJvFormPlacement);
begin
{*
 00721B88    push        ebp
 00721B89    mov         ebp,esp
 00721B8B    add         esp,0FFFFFFF8
 00721B8E    mov         dword ptr [ebp-4],eax
 00721B91    mov         eax,dword ptr [ebp-4]
 00721B94    test        byte ptr [eax+1C],10;TJvFormPlacement.FComponentState:TComponentState
>00721B98    jne         00721C96
 00721B9E    mov         eax,dword ptr [ebp-4]
 00721BA1    mov         eax,dword ptr [eax+4];TJvFormPlacement.FOwner:TComponent
 00721BA4    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 00721BAA    call        @IsClass
 00721BAF    test        al,al
>00721BB1    je          00721C96
 00721BB7    mov         eax,dword ptr [ebp-4]
 00721BBA    cmp         byte ptr [eax+54],0;TJvFormPlacement.FPreventResize:Boolean
>00721BBE    je          00721BD8
 00721BC0    mov         eax,dword ptr [ebp-4]
 00721BC3    call        007213D4
 00721BC8    test        byte ptr [eax+298],4
 00721BCF    setne       al
 00721BD2    mov         edx,dword ptr [ebp-4]
 00721BD5    mov         byte ptr [edx+5C],al;TJvFormPlacement.FDefMaximize:Boolean
 00721BD8    mov         eax,dword ptr [ebp-4]
 00721BDB    movzx       eax,byte ptr [eax+38];TJvFormPlacement.FActive:Boolean
 00721BDF    mov         byte ptr [ebp-5],al
 00721BE2    mov         eax,dword ptr [ebp-4]
 00721BE5    mov         byte ptr [eax+38],0;TJvFormPlacement.FActive:Boolean
 00721BE9    xor         eax,eax
 00721BEB    push        ebp
 00721BEC    push        721C7E
 00721BF1    push        dword ptr fs:[eax]
 00721BF4    mov         dword ptr fs:[eax],esp
 00721BF7    mov         eax,dword ptr [ebp-4]
 00721BFA    cmp         byte ptr [eax+54],0;TJvFormPlacement.FPreventResize:Boolean
>00721BFE    jne         00721C40
 00721C00    mov         eax,dword ptr [ebp-4]
 00721C03    cmp         byte ptr [eax+5C],0;TJvFormPlacement.FDefMaximize:Boolean
>00721C07    je          00721C40
 00721C09    mov         eax,dword ptr [ebp-4]
 00721C0C    call        007213D4
 00721C11    cmp         byte ptr [eax+299],3
>00721C18    je          00721C40
 00721C1A    mov         eax,dword ptr [ebp-4]
 00721C1D    call        007213D4
 00721C22    movzx       eax,byte ptr [eax+298]
 00721C29    or          al,byte ptr ds:[721C9C];0x4 gvar_00721C9C
 00721C2F    push        eax
 00721C30    mov         eax,dword ptr [ebp-4]
 00721C33    call        007213D4
 00721C38    pop         edx
 00721C39    call        TCustomForm.SetBorderIcons
>00721C3E    jmp         00721C66
 00721C40    mov         eax,dword ptr [ebp-4]
 00721C43    call        007213D4
 00721C48    movzx       edx,byte ptr ds:[721C9C];0x4 gvar_00721C9C
 00721C4F    not         edx
 00721C51    and         dl,byte ptr [eax+298]
 00721C57    push        edx
 00721C58    mov         eax,dword ptr [ebp-4]
 00721C5B    call        007213D4
 00721C60    pop         edx
 00721C61    call        TCustomForm.SetBorderIcons
 00721C66    xor         eax,eax
 00721C68    pop         edx
 00721C69    pop         ecx
 00721C6A    pop         ecx
 00721C6B    mov         dword ptr fs:[eax],edx
 00721C6E    push        721C85
 00721C73    mov         eax,dword ptr [ebp-4]
 00721C76    movzx       edx,byte ptr [ebp-5]
 00721C7A    mov         byte ptr [eax+38],dl;TJvFormPlacement.FActive:Boolean
 00721C7D    ret
>00721C7E    jmp         @HandleFinally
>00721C83    jmp         00721C73
 00721C85    mov         eax,dword ptr [ebp-4]
 00721C88    test        byte ptr [eax+1C],1;TJvFormPlacement.FComponentState:TComponentState
>00721C8C    jne         00721C96
 00721C8E    mov         eax,dword ptr [ebp-4]
 00721C91    call        007215D8
 00721C96    pop         ecx
 00721C97    pop         ecx
 00721C98    pop         ebp
 00721C99    ret
*}
end;

//00721CA0
procedure TJvFormPlacement.SetPreventResize(Value:Boolean);
begin
{*
 00721CA0    push        ebx
 00721CA1    push        esi
 00721CA2    mov         ebx,edx
 00721CA4    mov         esi,eax
 00721CA6    mov         eax,esi
 00721CA8    call        007213D4
 00721CAD    test        eax,eax
>00721CAF    je          00721CC7
 00721CB1    cmp         bl,byte ptr [esi+54];TJvFormPlacement.FPreventResize:Boolean
>00721CB4    je          00721CC7
 00721CB6    mov         byte ptr [esi+54],bl;TJvFormPlacement.FPreventResize:Boolean
 00721CB9    mov         eax,esi
 00721CBB    call        00721A64
 00721CC0    mov         eax,esi
 00721CC2    call        00721B88
 00721CC7    pop         esi
 00721CC8    pop         ebx
 00721CC9    ret
*}
end;

//00721CCC
procedure TJvFormPlacement.sub_00721CCC;
begin
{*
 00721CCC    push        ebx
 00721CCD    cmp         word ptr [eax+82],0;TJvFormPlacement.?f82:word
>00721CD5    je          00721CE7
 00721CD7    mov         ebx,eax
 00721CD9    mov         edx,eax
 00721CDB    mov         eax,dword ptr [ebx+84];TJvFormPlacement.?f84:dword
 00721CE1    call        dword ptr [ebx+80];TJvFormPlacement.FOnSavePlacement
 00721CE7    pop         ebx
 00721CE8    ret
*}
end;

//00721CEC
procedure TJvFormPlacement.sub_00721CEC;
begin
{*
 00721CEC    push        ebx
 00721CED    cmp         word ptr [eax+8A],0;TJvFormPlacement.?f8A:word
>00721CF5    je          00721D07
 00721CF7    mov         ebx,eax
 00721CF9    mov         edx,eax
 00721CFB    mov         eax,dword ptr [ebx+8C];TJvFormPlacement.?f8C:dword
 00721D01    call        dword ptr [ebx+88];TJvFormPlacement.FOnRestorePlacement
 00721D07    pop         ebx
 00721D08    ret
*}
end;

//00721D0C
procedure sub_00721D0C;
begin
{*
 00721D0C    push        ebp
 00721D0D    mov         ebp,esp
 00721D0F    push        0
 00721D11    push        ebx
 00721D12    mov         ebx,eax
 00721D14    xor         eax,eax
 00721D16    push        ebp
 00721D17    push        721DB9
 00721D1C    push        dword ptr fs:[eax]
 00721D1F    mov         dword ptr fs:[eax],esp
 00721D22    mov         eax,dword ptr [ebx+4];TJvFormPlacement.FOwner:TComponent
 00721D25    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 00721D2B    call        @IsClass
 00721D30    test        al,al
>00721D32    je          00721D9A
 00721D34    movzx       eax,byte ptr ds:[721DC4];0x8 gvar_00721DC4
 00721D3B    cmp         al,byte ptr [ebx+48];TJvFormPlacement.FOptions:TPlacementOptions
>00721D3E    je          00721D9A
 00721D40    movzx       eax,byte ptr [ebx+48];TJvFormPlacement.FOptions:TPlacementOptions
 00721D44    push        eax
 00721D45    mov         eax,ebx
 00721D47    call        007213D4
 00721D4C    mov         ecx,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 00721D4F    mov         edx,dword ptr [ebx+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 00721D52    call        0056C278
 00721D57    test        byte ptr [ebx+48],8;TJvFormPlacement.FOptions:TPlacementOptions
>00721D5B    je          00721D9A
 00721D5D    mov         eax,ebx
 00721D5F    call        007213D4
 00721D64    cmp         dword ptr [eax+290],0
>00721D6B    je          00721D9A
 00721D6D    mov         eax,ebx
 00721D6F    call        007213D4
 00721D74    mov         eax,dword ptr [eax+290]
 00721D7A    mov         eax,dword ptr [eax+8]
 00721D7D    push        eax
 00721D7E    lea         eax,[ebp-4]
 00721D81    mov         ecx,721DD4;'ActiveControl'
 00721D86    mov         edx,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 00721D89    call        @UStrCat3
 00721D8E    mov         edx,dword ptr [ebp-4]
 00721D91    mov         eax,dword ptr [ebx+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 00721D94    pop         ecx
 00721D95    call        TJvCustomAppStorage.WriteString
 00721D9A    xor         edx,edx
 00721D9C    mov         eax,ebx
 00721D9E    call        00721378
 00721DA3    xor         eax,eax
 00721DA5    pop         edx
 00721DA6    pop         ecx
 00721DA7    pop         ecx
 00721DA8    mov         dword ptr fs:[eax],edx
 00721DAB    push        721DC0
 00721DB0    lea         eax,[ebp-4]
 00721DB3    call        @UStrClr
 00721DB8    ret
>00721DB9    jmp         @HandleFinally
>00721DBE    jmp         00721DB0
 00721DC0    pop         ebx
 00721DC1    pop         ecx
 00721DC2    pop         ebp
 00721DC3    ret
*}
end;

//00721DF0
procedure sub_00721DF0;
begin
{*
 00721DF0    push        ebx
 00721DF1    mov         ebx,eax
 00721DF3    mov         eax,dword ptr [ebx+4];TJvFormPlacement.FOwner:TComponent
 00721DF6    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 00721DFC    call        @IsClass
 00721E01    test        al,al
>00721E03    je          00721E1C
 00721E05    movzx       eax,byte ptr [ebx+48];TJvFormPlacement.FOptions:TPlacementOptions
 00721E09    push        eax
 00721E0A    mov         eax,ebx
 00721E0C    call        007213D4
 00721E11    mov         ecx,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 00721E14    mov         edx,dword ptr [ebx+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 00721E17    call        0056C5F0
 00721E1C    mov         dl,1
 00721E1E    mov         eax,ebx
 00721E20    call        00721378
 00721E25    pop         ebx
 00721E26    ret
*}
end;

//00721E28
{*procedure sub_00721E28(?:TJvFormStorage; ?:string; ?:?; ?:?);
begin
 00721E28    push        ebp
 00721E29    mov         ebp,esp
 00721E2B    add         esp,0FFFFFFF8
 00721E2E    push        ebx
 00721E2F    push        esi
 00721E30    push        edi
 00721E31    mov         dword ptr [ebp-8],ecx
 00721E34    mov         dword ptr [ebp-4],edx
 00721E37    mov         ebx,eax
 00721E39    mov         esi,dword ptr [ebp+8]
 00721E3C    mov         edi,dword ptr [ebx+3C]
 00721E3F    test        edi,edi
>00721E41    je          00721E53
 00721E43    push        esi
 00721E44    mov         edx,dword ptr [ebp-4]
 00721E47    mov         eax,dword ptr [edi]
 00721E49    mov         ecx,dword ptr [ebp-8]
 00721E4C    call        TJvCustomAppStorage.ConcatPaths
>00721E51    jmp         00721E5A
 00721E53    mov         eax,esi
 00721E55    call        @UStrClr
 00721E5A    pop         edi
 00721E5B    pop         esi
 00721E5C    pop         ebx
 00721E5D    pop         ecx
 00721E5E    pop         ecx
 00721E5F    pop         ebp
 00721E60    ret         4
end;*}

//00721E64
{*procedure TJvFormPlacement.ReadString(Ident:string; Default:string; ?:?);
begin
 00721E64    push        ebp
 00721E65    mov         ebp,esp
 00721E67    add         esp,0FFFFFFEC
 00721E6A    push        ebx
 00721E6B    push        esi
 00721E6C    push        edi
 00721E6D    xor         ebx,ebx
 00721E6F    mov         dword ptr [ebp-8],ebx
 00721E72    mov         dword ptr [ebp-14],ebx
 00721E75    mov         dword ptr [ebp-4],ecx
 00721E78    mov         edi,edx
 00721E7A    mov         ebx,eax
 00721E7C    xor         eax,eax
 00721E7E    push        ebp
 00721E7F    push        721F01
 00721E84    push        dword ptr fs:[eax]
 00721E87    mov         dword ptr fs:[eax],esp
 00721E8A    mov         esi,dword ptr [ebx+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 00721E8D    test        esi,esi
>00721E8F    je          00721ED8
 00721E91    test        edi,edi
>00721E93    je          00721ED8
 00721E95    mov         eax,dword ptr [ebp+8]
 00721E98    push        eax
 00721E99    lea         eax,[ebp-8]
 00721E9C    push        eax
 00721E9D    mov         eax,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 00721EA0    mov         dword ptr [ebp-10],eax
 00721EA3    push        1
 00721EA5    lea         eax,[ebp-14]
 00721EA8    push        eax
 00721EA9    mov         ecx,edi
 00721EAB    mov         edx,ebx
 00721EAD    mov         eax,esi
 00721EAF    call        TJvCustomAppStorage.TranslatePropertyName
 00721EB4    mov         eax,dword ptr [ebp-14]
 00721EB7    mov         dword ptr [ebp-0C],eax
 00721EBA    lea         edx,[ebp-10]
 00721EBD    mov         eax,dword ptr [esi]
 00721EBF    mov         ecx,1
 00721EC4    call        TJvCustomAppStorage.ConcatPaths
 00721EC9    mov         edx,dword ptr [ebp-8]
 00721ECC    mov         ecx,dword ptr [ebp-4]
 00721ECF    mov         eax,esi
 00721ED1    call        TJvCustomAppStorage.ReadString
>00721ED6    jmp         00721EE3
 00721ED8    mov         eax,dword ptr [ebp+8]
 00721EDB    mov         edx,dword ptr [ebp-4]
 00721EDE    call        @UStrAsg
 00721EE3    xor         eax,eax
 00721EE5    pop         edx
 00721EE6    pop         ecx
 00721EE7    pop         ecx
 00721EE8    mov         dword ptr fs:[eax],edx
 00721EEB    push        721F08
 00721EF0    lea         eax,[ebp-14]
 00721EF3    call        @UStrClr
 00721EF8    lea         eax,[ebp-8]
 00721EFB    call        @UStrClr
 00721F00    ret
>00721F01    jmp         @HandleFinally
>00721F06    jmp         00721EF0
 00721F08    pop         edi
 00721F09    pop         esi
 00721F0A    pop         ebx
 00721F0B    mov         esp,ebp
 00721F0D    pop         ebp
 00721F0E    ret         4
end;*}

//00721F14
procedure TJvFormPlacement.WriteString(Ident:string; AValue:string);
begin
{*
 00721F14    push        ebp
 00721F15    mov         ebp,esp
 00721F17    add         esp,0FFFFFFEC
 00721F1A    push        ebx
 00721F1B    push        esi
 00721F1C    push        edi
 00721F1D    xor         ebx,ebx
 00721F1F    mov         dword ptr [ebp-8],ebx
 00721F22    mov         dword ptr [ebp-14],ebx
 00721F25    mov         dword ptr [ebp-4],ecx
 00721F28    mov         edi,edx
 00721F2A    mov         ebx,eax
 00721F2C    xor         eax,eax
 00721F2E    push        ebp
 00721F2F    push        721FA0
 00721F34    push        dword ptr fs:[eax]
 00721F37    mov         dword ptr fs:[eax],esp
 00721F3A    mov         esi,dword ptr [ebx+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 00721F3D    test        esi,esi
>00721F3F    je          00721F82
 00721F41    test        edi,edi
>00721F43    je          00721F82
 00721F45    lea         eax,[ebp-8]
 00721F48    push        eax
 00721F49    mov         eax,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 00721F4C    mov         dword ptr [ebp-10],eax
 00721F4F    push        0
 00721F51    lea         eax,[ebp-14]
 00721F54    push        eax
 00721F55    mov         ecx,edi
 00721F57    mov         edx,ebx
 00721F59    mov         eax,esi
 00721F5B    call        TJvCustomAppStorage.TranslatePropertyName
 00721F60    mov         eax,dword ptr [ebp-14]
 00721F63    mov         dword ptr [ebp-0C],eax
 00721F66    lea         edx,[ebp-10]
 00721F69    mov         eax,dword ptr [esi]
 00721F6B    mov         ecx,1
 00721F70    call        TJvCustomAppStorage.ConcatPaths
 00721F75    mov         edx,dword ptr [ebp-8]
 00721F78    mov         ecx,dword ptr [ebp-4]
 00721F7B    mov         eax,esi
 00721F7D    call        TJvCustomAppStorage.WriteString
 00721F82    xor         eax,eax
 00721F84    pop         edx
 00721F85    pop         ecx
 00721F86    pop         ecx
 00721F87    mov         dword ptr fs:[eax],edx
 00721F8A    push        721FA7
 00721F8F    lea         eax,[ebp-14]
 00721F92    call        @UStrClr
 00721F97    lea         eax,[ebp-8]
 00721F9A    call        @UStrClr
 00721F9F    ret
>00721FA0    jmp         @HandleFinally
>00721FA5    jmp         00721F8F
 00721FA7    pop         edi
 00721FA8    pop         esi
 00721FA9    pop         ebx
 00721FAA    mov         esp,ebp
 00721FAC    pop         ebp
 00721FAD    ret
*}
end;

//00721FB0
function TJvFormPlacement.ReadBoolean(Ident:string; Default:Boolean):Boolean;
begin
{*
 00721FB0    push        ebp
 00721FB1    mov         ebp,esp
 00721FB3    add         esp,0FFFFFFEC
 00721FB6    push        ebx
 00721FB7    push        esi
 00721FB8    push        edi
 00721FB9    xor         ebx,ebx
 00721FBB    mov         dword ptr [ebp-8],ebx
 00721FBE    mov         dword ptr [ebp-14],ebx
 00721FC1    mov         byte ptr [ebp-1],cl
 00721FC4    mov         edi,edx
 00721FC6    mov         ebx,eax
 00721FC8    xor         eax,eax
 00721FCA    push        ebp
 00721FCB    push        722045
 00721FD0    push        dword ptr fs:[eax]
 00721FD3    mov         dword ptr fs:[eax],esp
 00721FD6    mov         esi,dword ptr [ebx+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 00721FD9    test        esi,esi
>00721FDB    je          00722023
 00721FDD    test        edi,edi
>00721FDF    je          00722023
 00721FE1    lea         eax,[ebp-8]
 00721FE4    push        eax
 00721FE5    mov         eax,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 00721FE8    mov         dword ptr [ebp-10],eax
 00721FEB    push        1
 00721FED    lea         eax,[ebp-14]
 00721FF0    push        eax
 00721FF1    mov         ecx,edi
 00721FF3    mov         edx,ebx
 00721FF5    mov         eax,esi
 00721FF7    call        TJvCustomAppStorage.TranslatePropertyName
 00721FFC    mov         eax,dword ptr [ebp-14]
 00721FFF    mov         dword ptr [ebp-0C],eax
 00722002    lea         edx,[ebp-10]
 00722005    mov         eax,dword ptr [esi]
 00722007    mov         ecx,1
 0072200C    call        TJvCustomAppStorage.ConcatPaths
 00722011    mov         edx,dword ptr [ebp-8]
 00722014    movzx       ecx,byte ptr [ebp-1]
 00722018    mov         eax,esi
 0072201A    call        TJvCustomAppStorage.ReadBoolean
 0072201F    mov         ebx,eax
>00722021    jmp         00722027
 00722023    movzx       ebx,byte ptr [ebp-1]
 00722027    xor         eax,eax
 00722029    pop         edx
 0072202A    pop         ecx
 0072202B    pop         ecx
 0072202C    mov         dword ptr fs:[eax],edx
 0072202F    push        72204C
 00722034    lea         eax,[ebp-14]
 00722037    call        @UStrClr
 0072203C    lea         eax,[ebp-8]
 0072203F    call        @UStrClr
 00722044    ret
>00722045    jmp         @HandleFinally
>0072204A    jmp         00722034
 0072204C    mov         eax,ebx
 0072204E    pop         edi
 0072204F    pop         esi
 00722050    pop         ebx
 00722051    mov         esp,ebp
 00722053    pop         ebp
 00722054    ret
*}
end;

//00722058
procedure TJvFormPlacement.WriteBoolean(Ident:string; AValue:Boolean);
begin
{*
 00722058    push        ebp
 00722059    mov         ebp,esp
 0072205B    add         esp,0FFFFFFEC
 0072205E    push        ebx
 0072205F    push        esi
 00722060    push        edi
 00722061    xor         ebx,ebx
 00722063    mov         dword ptr [ebp-8],ebx
 00722066    mov         dword ptr [ebp-14],ebx
 00722069    mov         byte ptr [ebp-1],cl
 0072206C    mov         edi,edx
 0072206E    mov         ebx,eax
 00722070    xor         eax,eax
 00722072    push        ebp
 00722073    push        7220E5
 00722078    push        dword ptr fs:[eax]
 0072207B    mov         dword ptr fs:[eax],esp
 0072207E    mov         esi,dword ptr [ebx+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 00722081    test        esi,esi
>00722083    je          007220C7
 00722085    test        edi,edi
>00722087    je          007220C7
 00722089    lea         eax,[ebp-8]
 0072208C    push        eax
 0072208D    mov         eax,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 00722090    mov         dword ptr [ebp-10],eax
 00722093    push        0
 00722095    lea         eax,[ebp-14]
 00722098    push        eax
 00722099    mov         ecx,edi
 0072209B    mov         edx,ebx
 0072209D    mov         eax,esi
 0072209F    call        TJvCustomAppStorage.TranslatePropertyName
 007220A4    mov         eax,dword ptr [ebp-14]
 007220A7    mov         dword ptr [ebp-0C],eax
 007220AA    lea         edx,[ebp-10]
 007220AD    mov         eax,dword ptr [esi]
 007220AF    mov         ecx,1
 007220B4    call        TJvCustomAppStorage.ConcatPaths
 007220B9    mov         edx,dword ptr [ebp-8]
 007220BC    movzx       ecx,byte ptr [ebp-1]
 007220C0    mov         eax,esi
 007220C2    call        TJvCustomAppStorage.WriteBoolean
 007220C7    xor         eax,eax
 007220C9    pop         edx
 007220CA    pop         ecx
 007220CB    pop         ecx
 007220CC    mov         dword ptr fs:[eax],edx
 007220CF    push        7220EC
 007220D4    lea         eax,[ebp-14]
 007220D7    call        @UStrClr
 007220DC    lea         eax,[ebp-8]
 007220DF    call        @UStrClr
 007220E4    ret
>007220E5    jmp         @HandleFinally
>007220EA    jmp         007220D4
 007220EC    pop         edi
 007220ED    pop         esi
 007220EE    pop         ebx
 007220EF    mov         esp,ebp
 007220F1    pop         ebp
 007220F2    ret
*}
end;

//007220F4
{*procedure TJvFormPlacement.ReadFloat(Ident:string; Default:Double; ?:?);
begin
 007220F4    push        ebp
 007220F5    mov         ebp,esp
 007220F7    add         esp,0FFFFFFE8
 007220FA    push        ebx
 007220FB    push        esi
 007220FC    push        edi
 007220FD    xor         ecx,ecx
 007220FF    mov         dword ptr [ebp-0C],ecx
 00722102    mov         dword ptr [ebp-18],ecx
 00722105    mov         edi,edx
 00722107    mov         ebx,eax
 00722109    xor         eax,eax
 0072210B    push        ebp
 0072210C    push        722196
 00722111    push        dword ptr fs:[eax]
 00722114    mov         dword ptr fs:[eax],esp
 00722117    mov         esi,dword ptr [ebx+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 0072211A    test        esi,esi
>0072211C    je          0072216C
 0072211E    test        edi,edi
>00722120    je          0072216C
 00722122    fld         qword ptr [ebp+8]
 00722125    add         esp,0FFFFFFF4
 00722128    fstp        tbyte ptr [esp]
 0072212B    wait
 0072212C    lea         eax,[ebp-0C]
 0072212F    push        eax
 00722130    mov         eax,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 00722133    mov         dword ptr [ebp-14],eax
 00722136    push        1
 00722138    lea         eax,[ebp-18]
 0072213B    push        eax
 0072213C    mov         ecx,edi
 0072213E    mov         edx,ebx
 00722140    mov         eax,esi
 00722142    call        TJvCustomAppStorage.TranslatePropertyName
 00722147    mov         eax,dword ptr [ebp-18]
 0072214A    mov         dword ptr [ebp-10],eax
 0072214D    lea         edx,[ebp-14]
 00722150    mov         eax,dword ptr [esi]
 00722152    mov         ecx,1
 00722157    call        TJvCustomAppStorage.ConcatPaths
 0072215C    mov         edx,dword ptr [ebp-0C]
 0072215F    mov         eax,esi
 00722161    call        TJvCustomAppStorage.ReadFloat
 00722166    fstp        qword ptr [ebp-8]
 00722169    wait
>0072216A    jmp         00722178
 0072216C    mov         eax,dword ptr [ebp+8]
 0072216F    mov         dword ptr [ebp-8],eax
 00722172    mov         eax,dword ptr [ebp+0C]
 00722175    mov         dword ptr [ebp-4],eax
 00722178    xor         eax,eax
 0072217A    pop         edx
 0072217B    pop         ecx
 0072217C    pop         ecx
 0072217D    mov         dword ptr fs:[eax],edx
 00722180    push        72219D
 00722185    lea         eax,[ebp-18]
 00722188    call        @UStrClr
 0072218D    lea         eax,[ebp-0C]
 00722190    call        @UStrClr
 00722195    ret
>00722196    jmp         @HandleFinally
>0072219B    jmp         00722185
 0072219D    fld         qword ptr [ebp-8]
 007221A0    pop         edi
 007221A1    pop         esi
 007221A2    pop         ebx
 007221A3    mov         esp,ebp
 007221A5    pop         ebp
 007221A6    ret         8
end;*}

//007221AC
procedure TJvFormPlacement.WriteFloat(Ident:string; AValue:Double);
begin
{*
 007221AC    push        ebp
 007221AD    mov         ebp,esp
 007221AF    add         esp,0FFFFFFF0
 007221B2    push        ebx
 007221B3    push        esi
 007221B4    push        edi
 007221B5    xor         ecx,ecx
 007221B7    mov         dword ptr [ebp-4],ecx
 007221BA    mov         dword ptr [ebp-10],ecx
 007221BD    mov         edi,edx
 007221BF    mov         ebx,eax
 007221C1    xor         eax,eax
 007221C3    push        ebp
 007221C4    push        72223C
 007221C9    push        dword ptr fs:[eax]
 007221CC    mov         dword ptr fs:[eax],esp
 007221CF    mov         esi,dword ptr [ebx+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 007221D2    test        esi,esi
>007221D4    je          0072221E
 007221D6    test        edi,edi
>007221D8    je          0072221E
 007221DA    fld         qword ptr [ebp+8]
 007221DD    add         esp,0FFFFFFF4
 007221E0    fstp        tbyte ptr [esp]
 007221E3    wait
 007221E4    lea         eax,[ebp-4]
 007221E7    push        eax
 007221E8    mov         eax,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 007221EB    mov         dword ptr [ebp-0C],eax
 007221EE    push        0
 007221F0    lea         eax,[ebp-10]
 007221F3    push        eax
 007221F4    mov         ecx,edi
 007221F6    mov         edx,ebx
 007221F8    mov         eax,esi
 007221FA    call        TJvCustomAppStorage.TranslatePropertyName
 007221FF    mov         eax,dword ptr [ebp-10]
 00722202    mov         dword ptr [ebp-8],eax
 00722205    lea         edx,[ebp-0C]
 00722208    mov         eax,dword ptr [esi]
 0072220A    mov         ecx,1
 0072220F    call        TJvCustomAppStorage.ConcatPaths
 00722214    mov         edx,dword ptr [ebp-4]
 00722217    mov         eax,esi
 00722219    call        TJvCustomAppStorage.WriteFloat
 0072221E    xor         eax,eax
 00722220    pop         edx
 00722221    pop         ecx
 00722222    pop         ecx
 00722223    mov         dword ptr fs:[eax],edx
 00722226    push        722243
 0072222B    lea         eax,[ebp-10]
 0072222E    call        @UStrClr
 00722233    lea         eax,[ebp-4]
 00722236    call        @UStrClr
 0072223B    ret
>0072223C    jmp         @HandleFinally
>00722241    jmp         0072222B
 00722243    pop         edi
 00722244    pop         esi
 00722245    pop         ebx
 00722246    mov         esp,ebp
 00722248    pop         ebp
 00722249    ret         8
*}
end;

//0072224C
function TJvFormPlacement.ReadInteger(Ident:string; Default:Integer):Integer;
begin
{*
 0072224C    push        ebp
 0072224D    mov         ebp,esp
 0072224F    add         esp,0FFFFFFEC
 00722252    push        ebx
 00722253    push        esi
 00722254    push        edi
 00722255    xor         ebx,ebx
 00722257    mov         dword ptr [ebp-8],ebx
 0072225A    mov         dword ptr [ebp-14],ebx
 0072225D    mov         dword ptr [ebp-4],ecx
 00722260    mov         edi,edx
 00722262    mov         ebx,eax
 00722264    xor         eax,eax
 00722266    push        ebp
 00722267    push        7222DF
 0072226C    push        dword ptr fs:[eax]
 0072226F    mov         dword ptr fs:[eax],esp
 00722272    mov         esi,dword ptr [ebx+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 00722275    test        esi,esi
>00722277    je          007222BE
 00722279    test        edi,edi
>0072227B    je          007222BE
 0072227D    lea         eax,[ebp-8]
 00722280    push        eax
 00722281    mov         eax,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 00722284    mov         dword ptr [ebp-10],eax
 00722287    push        1
 00722289    lea         eax,[ebp-14]
 0072228C    push        eax
 0072228D    mov         ecx,edi
 0072228F    mov         edx,ebx
 00722291    mov         eax,esi
 00722293    call        TJvCustomAppStorage.TranslatePropertyName
 00722298    mov         eax,dword ptr [ebp-14]
 0072229B    mov         dword ptr [ebp-0C],eax
 0072229E    lea         edx,[ebp-10]
 007222A1    mov         eax,dword ptr [esi]
 007222A3    mov         ecx,1
 007222A8    call        TJvCustomAppStorage.ConcatPaths
 007222AD    mov         edx,dword ptr [ebp-8]
 007222B0    mov         ecx,dword ptr [ebp-4]
 007222B3    mov         eax,esi
 007222B5    call        TJvCustomAppStorage.ReadInteger
 007222BA    mov         ebx,eax
>007222BC    jmp         007222C1
 007222BE    mov         ebx,dword ptr [ebp-4]
 007222C1    xor         eax,eax
 007222C3    pop         edx
 007222C4    pop         ecx
 007222C5    pop         ecx
 007222C6    mov         dword ptr fs:[eax],edx
 007222C9    push        7222E6
 007222CE    lea         eax,[ebp-14]
 007222D1    call        @UStrClr
 007222D6    lea         eax,[ebp-8]
 007222D9    call        @UStrClr
 007222DE    ret
>007222DF    jmp         @HandleFinally
>007222E4    jmp         007222CE
 007222E6    mov         eax,ebx
 007222E8    pop         edi
 007222E9    pop         esi
 007222EA    pop         ebx
 007222EB    mov         esp,ebp
 007222ED    pop         ebp
 007222EE    ret
*}
end;

//007222F0
procedure TJvFormPlacement.WriteInteger(Ident:string; AValue:Integer);
begin
{*
 007222F0    push        ebp
 007222F1    mov         ebp,esp
 007222F3    add         esp,0FFFFFFEC
 007222F6    push        ebx
 007222F7    push        esi
 007222F8    push        edi
 007222F9    xor         ebx,ebx
 007222FB    mov         dword ptr [ebp-8],ebx
 007222FE    mov         dword ptr [ebp-14],ebx
 00722301    mov         dword ptr [ebp-4],ecx
 00722304    mov         edi,edx
 00722306    mov         ebx,eax
 00722308    xor         eax,eax
 0072230A    push        ebp
 0072230B    push        72237C
 00722310    push        dword ptr fs:[eax]
 00722313    mov         dword ptr fs:[eax],esp
 00722316    mov         esi,dword ptr [ebx+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 00722319    test        esi,esi
>0072231B    je          0072235E
 0072231D    test        edi,edi
>0072231F    je          0072235E
 00722321    lea         eax,[ebp-8]
 00722324    push        eax
 00722325    mov         eax,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 00722328    mov         dword ptr [ebp-10],eax
 0072232B    push        0
 0072232D    lea         eax,[ebp-14]
 00722330    push        eax
 00722331    mov         ecx,edi
 00722333    mov         edx,ebx
 00722335    mov         eax,esi
 00722337    call        TJvCustomAppStorage.TranslatePropertyName
 0072233C    mov         eax,dword ptr [ebp-14]
 0072233F    mov         dword ptr [ebp-0C],eax
 00722342    lea         edx,[ebp-10]
 00722345    mov         eax,dword ptr [esi]
 00722347    mov         ecx,1
 0072234C    call        TJvCustomAppStorage.ConcatPaths
 00722351    mov         edx,dword ptr [ebp-8]
 00722354    mov         ecx,dword ptr [ebp-4]
 00722357    mov         eax,esi
 00722359    call        TJvCustomAppStorage.WriteInteger
 0072235E    xor         eax,eax
 00722360    pop         edx
 00722361    pop         ecx
 00722362    pop         ecx
 00722363    mov         dword ptr fs:[eax],edx
 00722366    push        722383
 0072236B    lea         eax,[ebp-14]
 0072236E    call        @UStrClr
 00722373    lea         eax,[ebp-8]
 00722376    call        @UStrClr
 0072237B    ret
>0072237C    jmp         @HandleFinally
>00722381    jmp         0072236B
 00722383    pop         edi
 00722384    pop         esi
 00722385    pop         ebx
 00722386    mov         esp,ebp
 00722388    pop         ebp
 00722389    ret
*}
end;

//0072238C
{*procedure TJvFormPlacement.ReadDateTime(Ident:string; Default:TDateTime; ?:?);
begin
 0072238C    push        ebp
 0072238D    mov         ebp,esp
 0072238F    add         esp,0FFFFFFE8
 00722392    push        ebx
 00722393    push        esi
 00722394    push        edi
 00722395    xor         ecx,ecx
 00722397    mov         dword ptr [ebp-0C],ecx
 0072239A    mov         dword ptr [ebp-18],ecx
 0072239D    mov         edi,edx
 0072239F    mov         ebx,eax
 007223A1    xor         eax,eax
 007223A3    push        ebp
 007223A4    push        72242A
 007223A9    push        dword ptr fs:[eax]
 007223AC    mov         dword ptr fs:[eax],esp
 007223AF    mov         esi,dword ptr [ebx+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 007223B2    test        esi,esi
>007223B4    je          00722400
 007223B6    test        edi,edi
>007223B8    je          00722400
 007223BA    push        dword ptr [ebp+0C]
 007223BD    push        dword ptr [ebp+8]
 007223C0    lea         eax,[ebp-0C]
 007223C3    push        eax
 007223C4    mov         eax,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 007223C7    mov         dword ptr [ebp-14],eax
 007223CA    push        1
 007223CC    lea         eax,[ebp-18]
 007223CF    push        eax
 007223D0    mov         ecx,edi
 007223D2    mov         edx,ebx
 007223D4    mov         eax,esi
 007223D6    call        TJvCustomAppStorage.TranslatePropertyName
 007223DB    mov         eax,dword ptr [ebp-18]
 007223DE    mov         dword ptr [ebp-10],eax
 007223E1    lea         edx,[ebp-14]
 007223E4    mov         eax,dword ptr [esi]
 007223E6    mov         ecx,1
 007223EB    call        TJvCustomAppStorage.ConcatPaths
 007223F0    mov         edx,dword ptr [ebp-0C]
 007223F3    mov         eax,esi
 007223F5    call        TJvCustomAppStorage.ReadDateTime
 007223FA    fstp        qword ptr [ebp-8]
 007223FD    wait
>007223FE    jmp         0072240C
 00722400    mov         eax,dword ptr [ebp+8]
 00722403    mov         dword ptr [ebp-8],eax
 00722406    mov         eax,dword ptr [ebp+0C]
 00722409    mov         dword ptr [ebp-4],eax
 0072240C    xor         eax,eax
 0072240E    pop         edx
 0072240F    pop         ecx
 00722410    pop         ecx
 00722411    mov         dword ptr fs:[eax],edx
 00722414    push        722431
 00722419    lea         eax,[ebp-18]
 0072241C    call        @UStrClr
 00722421    lea         eax,[ebp-0C]
 00722424    call        @UStrClr
 00722429    ret
>0072242A    jmp         @HandleFinally
>0072242F    jmp         00722419
 00722431    fld         qword ptr [ebp-8]
 00722434    pop         edi
 00722435    pop         esi
 00722436    pop         ebx
 00722437    mov         esp,ebp
 00722439    pop         ebp
 0072243A    ret         8
end;*}

//00722440
{*procedure TJvFormPlacement.WriteDateTime(Ident:string; AValue:TDateTime; ?:?);
begin
 00722440    push        ebp
 00722441    mov         ebp,esp
 00722443    add         esp,0FFFFFFF0
 00722446    push        ebx
 00722447    push        esi
 00722448    push        edi
 00722449    xor         ecx,ecx
 0072244B    mov         dword ptr [ebp-4],ecx
 0072244E    mov         dword ptr [ebp-10],ecx
 00722451    mov         edi,edx
 00722453    mov         ebx,eax
 00722455    xor         eax,eax
 00722457    push        ebp
 00722458    push        7224CC
 0072245D    push        dword ptr fs:[eax]
 00722460    mov         dword ptr fs:[eax],esp
 00722463    mov         esi,dword ptr [ebx+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 00722466    test        esi,esi
>00722468    je          007224AE
 0072246A    test        edi,edi
>0072246C    je          007224AE
 0072246E    push        dword ptr [ebp+0C]
 00722471    push        dword ptr [ebp+8]
 00722474    lea         eax,[ebp-4]
 00722477    push        eax
 00722478    mov         eax,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 0072247B    mov         dword ptr [ebp-0C],eax
 0072247E    push        0
 00722480    lea         eax,[ebp-10]
 00722483    push        eax
 00722484    mov         ecx,edi
 00722486    mov         edx,ebx
 00722488    mov         eax,esi
 0072248A    call        TJvCustomAppStorage.TranslatePropertyName
 0072248F    mov         eax,dword ptr [ebp-10]
 00722492    mov         dword ptr [ebp-8],eax
 00722495    lea         edx,[ebp-0C]
 00722498    mov         eax,dword ptr [esi]
 0072249A    mov         ecx,1
 0072249F    call        TJvCustomAppStorage.ConcatPaths
 007224A4    mov         edx,dword ptr [ebp-4]
 007224A7    mov         eax,esi
 007224A9    call        TJvCustomAppStorage.WriteDateTime
 007224AE    xor         eax,eax
 007224B0    pop         edx
 007224B1    pop         ecx
 007224B2    pop         ecx
 007224B3    mov         dword ptr fs:[eax],edx
 007224B6    push        7224D3
 007224BB    lea         eax,[ebp-10]
 007224BE    call        @UStrClr
 007224C3    lea         eax,[ebp-4]
 007224C6    call        @UStrClr
 007224CB    ret
>007224CC    jmp         @HandleFinally
>007224D1    jmp         007224BB
 007224D3    pop         edi
 007224D4    pop         esi
 007224D5    pop         ebx
 007224D6    mov         esp,ebp
 007224D8    pop         ebp
 007224D9    ret         8
end;*}

//007224DC
procedure TJvFormPlacement.EraseSections;
begin
{*
 007224DC    mov         edx,dword ptr [eax+40];TJvFormPlacement.FAppStoragePath:string
 007224DF    mov         eax,dword ptr [eax+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 007224E2    call        TJvCustomAppStorage.DeleteSubTree
 007224E7    ret
*}
end;

//007224E8
function TJvFormPlacement.IsActive:Boolean;
begin
{*
 007224E8    cmp         byte ptr [eax+38],0;TJvFormPlacement.FActive:Boolean
>007224EC    je          007224F4
 007224EE    cmp         dword ptr [eax+3C],0;TJvFormPlacement.FAppStorage:TJvCustomAppStorage
>007224F2    jne         007224F7
 007224F4    xor         eax,eax
 007224F6    ret
 007224F7    mov         al,1
 007224F9    ret
*}
end;

//007224FC
procedure TJvFormPlacement.SaveFormPlacement;
begin
{*
 007224FC    push        ebx
 007224FD    push        esi
 007224FE    mov         ebx,eax
 00722500    cmp         dword ptr [ebx+3C],0;TJvFormPlacement.FAppStorage:TJvCustomAppStorage
>00722504    je          00722568
 00722506    mov         eax,ebx
 00722508    call        0072359C
 0072250D    cmp         word ptr [ebx+92],0;TJvFormPlacement.?f92:word
>00722515    je          00722525
 00722517    mov         edx,ebx
 00722519    mov         eax,dword ptr [ebx+94];TJvFormPlacement.?f94:dword
 0072251F    call        dword ptr [ebx+90];TJvFormPlacement.FBeforeSavePlacement
 00722525    cmp         byte ptr [ebx+50],0;TJvFormPlacement.FVersionCheck:TJvFormPlacementVersionCheck
>00722529    je          0072253A
 0072252B    mov         ecx,dword ptr [ebx+4C];TJvFormPlacement.FVersion:Integer
 0072252E    mov         edx,722578;'FormVersion'
 00722533    mov         eax,ebx
 00722535    call        TJvFormPlacement.WriteInteger
 0072253A    mov         eax,ebx
 0072253C    mov         si,0FFF0
 00722540    call        @CallDynaInst;TJvFormPlacement.sub_00721CCC
 00722545    mov         eax,ebx
 00722547    mov         edx,dword ptr [eax]
 00722549    call        dword ptr [edx+34];TJvFormPlacement.sub_00721D0C
 0072254C    cmp         word ptr [ebx+9A],0;TJvFormPlacement.?f9A:word
>00722554    je          00722564
 00722556    mov         edx,ebx
 00722558    mov         eax,dword ptr [ebx+9C];TJvFormPlacement.?f9C:dword
 0072255E    call        dword ptr [ebx+98];TJvFormPlacement.FAfterSavePlacement
 00722564    mov         byte ptr [ebx+51],1;TJvFormPlacement.FSaved:Boolean
 00722568    pop         esi
 00722569    pop         ebx
 0072256A    ret
*}
end;

//00722590
procedure TJvFormPlacement.RestoreFormPlacement;
begin
{*
 00722590    push        ebp
 00722591    mov         ebp,esp
 00722593    add         esp,0FFFFFFF0
 00722596    push        ebx
 00722597    push        esi
 00722598    push        edi
 00722599    xor         edx,edx
 0072259B    mov         dword ptr [ebp-4],edx
 0072259E    mov         dword ptr [ebp-8],edx
 007225A1    mov         ebx,eax
 007225A3    xor         eax,eax
 007225A5    push        ebp
 007225A6    push        722704
 007225AB    push        dword ptr fs:[eax]
 007225AE    mov         dword ptr fs:[eax],esp
 007225B1    cmp         dword ptr [ebx+3C],0;TJvFormPlacement.FAppStorage:TJvCustomAppStorage
>007225B5    je          007226E2
 007225BB    mov         eax,ebx
 007225BD    call        0072359C
 007225C2    mov         byte ptr [ebx+51],0;TJvFormPlacement.FSaved:Boolean
 007225C6    xor         ecx,ecx
 007225C8    mov         edx,722720;'FormVersion'
 007225CD    mov         eax,ebx
 007225CF    call        TJvFormPlacement.ReadInteger
 007225D4    movzx       edx,byte ptr [ebx+50];TJvFormPlacement.FVersionCheck:TJvFormPlacementVersionCheck
 007225D8    sub         dl,1
>007225DB    jb          007225E5
>007225DD    je          007225E9
 007225DF    dec         dl
>007225E1    je          007225F1
>007225E3    jmp         007225F9
 007225E5    mov         al,1
>007225E7    jmp         007225FB
 007225E9    cmp         eax,dword ptr [ebx+4C];TJvFormPlacement.FVersion:Integer
 007225EC    setge       al
>007225EF    jmp         007225FB
 007225F1    cmp         eax,dword ptr [ebx+4C];TJvFormPlacement.FVersion:Integer
 007225F4    sete        al
>007225F7    jmp         007225FB
 007225F9    xor         eax,eax
 007225FB    test        al,al
>007225FD    je          007226DE
 00722603    cmp         word ptr [ebx+0A2],0;TJvFormPlacement.?fA2:word
>0072260B    je          0072261B
 0072260D    mov         edx,ebx
 0072260F    mov         eax,dword ptr [ebx+0A4];TJvFormPlacement.?fA4:dword
 00722615    call        dword ptr [ebx+0A0];TJvFormPlacement.FBeforeRestorePlacement
 0072261B    mov         eax,ebx
 0072261D    mov         edx,dword ptr [eax]
 0072261F    call        dword ptr [edx+38];TJvFormPlacement.sub_00721DF0
 00722622    mov         byte ptr [ebx+52],1;TJvFormPlacement.FRestored:Boolean
 00722626    mov         eax,ebx
 00722628    mov         si,0FFEF
 0072262C    call        @CallDynaInst;TJvFormPlacement.sub_00721CEC
 00722631    test        byte ptr [ebx+48],8;TJvFormPlacement.FOptions:TPlacementOptions
>00722635    je          007226C6
 0072263B    mov         eax,dword ptr [ebx+4];TJvFormPlacement.FOwner:TComponent
 0072263E    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 00722644    call        @IsClass
 00722649    test        al,al
>0072264B    je          007226C6
 0072264D    lea         eax,[ebp-4]
 00722650    push        eax
 00722651    lea         eax,[ebp-8]
 00722654    push        eax
 00722655    mov         eax,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 00722658    mov         dword ptr [ebp-10],eax
 0072265B    mov         eax,722744;'ActiveControl'
 00722660    mov         dword ptr [ebp-0C],eax
 00722663    lea         edx,[ebp-10]
 00722666    mov         esi,dword ptr [ebx+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 00722669    mov         eax,dword ptr [esi]
 0072266B    mov         ecx,1
 00722670    call        TJvCustomAppStorage.ConcatPaths
 00722675    mov         edx,dword ptr [ebp-8]
 00722678    xor         ecx,ecx
 0072267A    mov         eax,esi
 0072267C    call        TJvCustomAppStorage.ReadString
 00722681    mov         eax,dword ptr [ebp-4]
 00722684    push        eax
 00722685    mov         eax,ebx
 00722687    call        007213D4
 0072268C    pop         edx
 0072268D    call        TComponent.FindComponent
 00722692    mov         edi,eax
 00722694    test        edi,edi
>00722696    je          007226C6
 00722698    mov         eax,edi
 0072269A    mov         edx,dword ptr ds:[47C4E8];TWinControl
 007226A0    call        @IsClass
 007226A5    test        al,al
>007226A7    je          007226C6
 007226A9    mov         eax,edi
 007226AB    mov         si,0FFB6
 007226AF    call        @CallDynaInst
 007226B4    test        al,al
>007226B6    je          007226C6
 007226B8    mov         eax,ebx
 007226BA    call        007213D4
 007226BF    mov         edx,edi
 007226C1    call        TCustomForm.SetActiveControl
 007226C6    cmp         word ptr [ebx+0AA],0;TJvFormPlacement.?fAA:word
>007226CE    je          007226DE
 007226D0    mov         edx,ebx
 007226D2    mov         eax,dword ptr [ebx+0AC];TJvFormPlacement.?fAC:dword
 007226D8    call        dword ptr [ebx+0A8];TJvFormPlacement.FAfterRestorePlacement
 007226DE    mov         byte ptr [ebx+52],1;TJvFormPlacement.FRestored:Boolean
 007226E2    mov         eax,ebx
 007226E4    call        00721A64
 007226E9    xor         eax,eax
 007226EB    pop         edx
 007226EC    pop         ecx
 007226ED    pop         ecx
 007226EE    mov         dword ptr fs:[eax],edx
 007226F1    push        72270B
 007226F6    lea         eax,[ebp-8]
 007226F9    mov         edx,2
 007226FE    call        @UStrArrayClr
 00722703    ret
>00722704    jmp         @HandleFinally
>00722709    jmp         007226F6
 0072270B    pop         edi
 0072270C    pop         esi
 0072270D    pop         ebx
 0072270E    mov         esp,ebp
 00722710    pop         ebp
 00722711    ret
*}
end;

//00722760
procedure TJvFormPlacement.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00722760    push        ebx
 00722761    push        esi
 00722762    push        edi
 00722763    mov         ebx,ecx
 00722765    mov         esi,edx
 00722767    mov         edi,eax
 00722769    mov         ecx,ebx
 0072276B    mov         edx,esi
 0072276D    mov         eax,edi
 0072276F    call        TComponent.Notification
 00722774    cmp         bl,1
>00722777    jne         00722787
 00722779    cmp         esi,dword ptr [edi+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
>0072277C    jne         00722787
 0072277E    xor         edx,edx
 00722780    mov         eax,edi
 00722782    call        TJvFormPlacement.SetAppStorage
 00722787    pop         edi
 00722788    pop         esi
 00722789    pop         ebx
 0072278A    ret
*}
end;

//0072278C
procedure TJvWinMinMaxInfo.Assign(Source:TPersistent);
begin
{*
 0072278C    push        ebx
 0072278D    push        esi
 0072278E    push        edi
 0072278F    mov         esi,edx
 00722791    mov         ebx,eax
 00722793    mov         eax,esi
 00722795    mov         edx,dword ptr ds:[71F770];TJvWinMinMaxInfo
 0072279B    call        @IsClass
 007227A0    test        al,al
>007227A2    je          007227BF
 007227A4    add         esi,8
 007227A7    lea         edi,[ebx+8];TJvWinMinMaxInfo.FMinMaxInfo:tagMINMAXINFO
 007227AA    mov         ecx,0A
 007227AF    rep movs    dword ptr [edi],dword ptr [esi]
 007227B1    mov         eax,dword ptr [ebx+4];TJvWinMinMaxInfo.FOwner:TJvFormPlacement
 007227B4    test        eax,eax
>007227B6    je          007227C8
 007227B8    call        00721610
>007227BD    jmp         007227C8
 007227BF    mov         edx,esi
 007227C1    mov         eax,ebx
 007227C3    call        TPersistent.Assign
 007227C8    pop         edi
 007227C9    pop         esi
 007227CA    pop         ebx
 007227CB    ret
*}
end;

//007227CC
{*function TJvWinMinMaxInfo.GetMaxPosLeft(?:Integer):?;
begin
 007227CC    cmp         edx,7
>007227CF    ja          00722818
 007227D1    jmp         dword ptr [edx*4+7227D8]
 007227D1    dd          007227F8
 007227D1    dd          007227FC
 007227D1    dd          00722800
 007227D1    dd          00722804
 007227D1    dd          00722808
 007227D1    dd          0072280C
 007227D1    dd          00722810
 007227D1    dd          00722814
 007227F8    mov         eax,dword ptr [eax+18];TJvWinMinMaxInfo.FMinMaxInfo.ptMaxPosition:TPoint
 007227FB    ret
 007227FC    mov         eax,dword ptr [eax+1C];TJvWinMinMaxInfo.FMinMaxInfo.ptMaxPosition:TPoint
 007227FF    ret
 00722800    mov         eax,dword ptr [eax+14];TJvWinMinMaxInfo.FMinMaxInfo.ptMaxSize:TPoint
 00722803    ret
 00722804    mov         eax,dword ptr [eax+10];TJvWinMinMaxInfo.FMinMaxInfo.ptMaxSize:TPoint
 00722807    ret
 00722808    mov         eax,dword ptr [eax+2C]
 0072280B    ret
 0072280C    mov         eax,dword ptr [eax+28]
 0072280F    ret
 00722810    mov         eax,dword ptr [eax+24];TJvWinMinMaxInfo.FMinMaxInfo.ptMinTrackSize:TPoint
 00722813    ret
 00722814    mov         eax,dword ptr [eax+20];TJvWinMinMaxInfo.FMinMaxInfo.ptMinTrackSize:TPoint
 00722817    ret
 00722818    xor         eax,eax
 0072281A    ret
end;*}

//0072281C
{*procedure TJvWinMinMaxInfo.SetMaxPosLeft(Value:Integer; ?:?);
begin
 0072281C    push        ebx
 0072281D    push        esi
 0072281E    push        edi
 0072281F    mov         edi,ecx
 00722821    mov         esi,edx
 00722823    mov         ebx,eax
 00722825    mov         edx,esi
 00722827    mov         eax,ebx
 00722829    call        TJvWinMinMaxInfo.GetMaxPosLeft
 0072282E    cmp         edi,eax
>00722830    je          00722890
 00722832    cmp         esi,7
>00722835    ja          00722884
 00722837    jmp         dword ptr [esi*4+72283E]
 00722837    dd          0072285E
 00722837    dd          00722863
 00722837    dd          00722868
 00722837    dd          0072286D
 00722837    dd          00722872
 00722837    dd          00722877
 00722837    dd          0072287C
 00722837    dd          00722881
 0072285E    mov         dword ptr [ebx+18],edi;TJvWinMinMaxInfo.FMinMaxInfo.ptMaxPosition:TPoint
>00722861    jmp         00722884
 00722863    mov         dword ptr [ebx+1C],edi;TJvWinMinMaxInfo.FMinMaxInfo.ptMaxPosition:TPoint
>00722866    jmp         00722884
 00722868    mov         dword ptr [ebx+14],edi;TJvWinMinMaxInfo.FMinMaxInfo.ptMaxSize:TPoint
>0072286B    jmp         00722884
 0072286D    mov         dword ptr [ebx+10],edi;TJvWinMinMaxInfo.FMinMaxInfo.ptMaxSize:TPoint
>00722870    jmp         00722884
 00722872    mov         dword ptr [ebx+2C],edi
>00722875    jmp         00722884
 00722877    mov         dword ptr [ebx+28],edi
>0072287A    jmp         00722884
 0072287C    mov         dword ptr [ebx+24],edi;TJvWinMinMaxInfo.FMinMaxInfo.ptMinTrackSize:TPoint
>0072287F    jmp         00722884
 00722881    mov         dword ptr [ebx+20],edi;TJvWinMinMaxInfo.FMinMaxInfo.ptMinTrackSize:TPoint
 00722884    mov         eax,dword ptr [ebx+4];TJvWinMinMaxInfo.FOwner:TJvFormPlacement
 00722887    test        eax,eax
>00722889    je          00722890
 0072288B    call        00721610
 00722890    pop         edi
 00722891    pop         esi
 00722892    pop         ebx
 00722893    ret
end;*}

//00722894
function TJvWinMinMaxInfo.DefaultMinMaxInfo:Boolean;
begin
{*
 00722894    cmp         dword ptr [eax+20],0;TJvWinMinMaxInfo.FMinMaxInfo.ptMinTrackSize:TPoint
>00722898    jne         007228C4
 0072289A    cmp         dword ptr [eax+24],0;TJvWinMinMaxInfo.FMinMaxInfo.ptMinTrackSize:TPoint
>0072289E    jne         007228C4
 007228A0    cmp         dword ptr [eax+28],0
>007228A4    jne         007228C4
 007228A6    cmp         dword ptr [eax+2C],0
>007228AA    jne         007228C4
 007228AC    cmp         dword ptr [eax+10],0;TJvWinMinMaxInfo.FMinMaxInfo.ptMaxSize:TPoint
>007228B0    jne         007228C4
 007228B2    cmp         dword ptr [eax+14],0;TJvWinMinMaxInfo.FMinMaxInfo.ptMaxSize:TPoint
>007228B6    jne         007228C4
 007228B8    cmp         dword ptr [eax+18],0;TJvWinMinMaxInfo.FMinMaxInfo.ptMaxPosition:TPoint
>007228BC    jne         007228C4
 007228BE    cmp         dword ptr [eax+1C],0;TJvWinMinMaxInfo.FMinMaxInfo.ptMaxPosition:TPoint
>007228C2    je          007228C7
 007228C4    xor         eax,eax
 007228C6    ret
 007228C7    mov         al,1
 007228C9    ret
*}
end;

//007228CC
constructor TJvFormStorage.Create(AOwner:TComponent);
begin
{*
 007228CC    push        ebp
 007228CD    mov         ebp,esp
 007228CF    push        ecx
 007228D0    push        ebx
 007228D1    push        esi
 007228D2    test        dl,dl
>007228D4    je          007228DE
 007228D6    add         esp,0FFFFFFF0
 007228D9    call        @ClassCreate
 007228DE    mov         byte ptr [ebp-1],dl
 007228E1    mov         ebx,eax
 007228E3    xor         edx,edx
 007228E5    mov         eax,ebx
 007228E7    call        TJvFormPlacement.Create
 007228EC    mov         ecx,ebx
 007228EE    mov         dl,1
 007228F0    mov         eax,[007207DC];TJvFormStorageStringList
 007228F5    call        TJvFormStorageStringList.Create;TJvFormStorageStringList.Create
 007228FA    mov         dword ptr [ebx+0B0],eax;TJvFormStorage.FStoredProps:TJvFormStorageStringList
 00722900    mov         ecx,ebx
 00722902    mov         dl,1
 00722904    mov         eax,[00720F88];TJvStoredValues
 00722909    call        TJvStoredValues.Create;TJvStoredValues.Create
 0072290E    mov         esi,eax
 00722910    mov         dword ptr [ebx+0B4],esi;TJvFormStorage.FStoredValues:TJvStoredValues
 00722916    mov         dword ptr [esi+1C],ebx;TJvStoredValues.FStorage:TJvFormPlacement
 00722919    mov         eax,ebx
 0072291B    cmp         byte ptr [ebp-1],0
>0072291F    je          00722930
 00722921    call        @AfterConstruction
 00722926    pop         dword ptr fs:[0]
 0072292D    add         esp,0C
 00722930    mov         eax,ebx
 00722932    pop         esi
 00722933    pop         ebx
 00722934    pop         ecx
 00722935    pop         ebp
 00722936    ret
*}
end;

//00722938
destructor TJvFormStorage.Destroy();
begin
{*
 00722938    push        ebx
 00722939    push        esi
 0072293A    call        @BeforeDestruction
 0072293F    mov         ebx,edx
 00722941    mov         esi,eax
 00722943    mov         eax,dword ptr [esi+0B0];TJvFormStorage.FStoredProps:TJvFormStorageStringList
 00722949    call        TObject.Free
 0072294E    xor         eax,eax
 00722950    mov         dword ptr [esi+0B0],eax;TJvFormStorage.FStoredProps:TJvFormStorageStringList
 00722956    mov         eax,dword ptr [esi+0B4];TJvFormStorage.FStoredValues:TJvStoredValues
 0072295C    call        TObject.Free
 00722961    xor         eax,eax
 00722963    mov         dword ptr [esi+0B4],eax;TJvFormStorage.FStoredValues:TJvStoredValues
 00722969    mov         edx,ebx
 0072296B    and         dl,0FC
 0072296E    mov         eax,esi
 00722970    call        TJvFormPlacement.Destroy
 00722975    test        bl,bl
>00722977    jle         00722980
 00722979    mov         eax,esi
 0072297B    call        @ClassDestroy
 00722980    pop         esi
 00722981    pop         ebx
 00722982    ret
*}
end;

//00722984
procedure TJvFormStorage.SetNotification;
begin
{*
 00722984    push        ebx
 00722985    push        esi
 00722986    mov         esi,eax
 00722988    mov         eax,esi
 0072298A    call        TJvFormStorage.GetStoredProps
 0072298F    mov         edx,dword ptr [eax]
 00722991    call        dword ptr [edx+14]
 00722994    mov         ebx,eax
 00722996    dec         ebx
 00722997    cmp         ebx,0
>0072299A    jl          007229BB
 0072299C    mov         eax,esi
 0072299E    call        TJvFormStorage.GetStoredProps
 007229A3    mov         edx,ebx
 007229A5    mov         ecx,dword ptr [eax]
 007229A7    call        dword ptr [ecx+18]
 007229AA    test        eax,eax
>007229AC    je          007229B5
 007229AE    mov         edx,esi
 007229B0    call        TComponent.FreeNotification
 007229B5    dec         ebx
 007229B6    cmp         ebx,0FFFFFFFF
>007229B9    jne         0072299C
 007229BB    pop         esi
 007229BC    pop         ebx
 007229BD    ret
*}
end;

//007229C0
{*function TJvFormStorage.GetStoredProps:?;
begin
 007229C0    mov         eax,dword ptr [eax+0B0];TJvFormStorage.FStoredProps:TJvFormStorageStringList
 007229C6    ret
end;*}

//007229C8
procedure TJvFormStorage.SetStoredProps(Value:TStrings);
begin
{*
 007229C8    push        ebx
 007229C9    mov         ebx,eax
 007229CB    mov         eax,dword ptr [ebx+0B0];TJvFormStorage.FStoredProps:TJvFormStorageStringList
 007229D1    mov         ecx,dword ptr [eax]
 007229D3    call        dword ptr [ecx+8];TJvFormStorageStringList.Assign
 007229D6    mov         eax,ebx
 007229D8    call        TJvFormStorage.SetNotification
 007229DD    pop         ebx
 007229DE    ret
*}
end;

//007229E0
procedure TJvFormStorage.SetStoredValues(Value:TJvStoredValues);
begin
{*
 007229E0    push        esi
 007229E1    mov         esi,eax
 007229E3    mov         eax,dword ptr [esi+0B4];TJvFormStorage.FStoredValues:TJvStoredValues
 007229E9    mov         ecx,dword ptr [eax]
 007229EB    call        dword ptr [ecx+8];TCollection.Assign
 007229EE    pop         esi
 007229EF    ret
*}
end;

//007229F0
procedure TJvFormStorage.Loaded;
begin
{*
 007229F0    push        ebx
 007229F1    mov         ebx,eax
 007229F3    mov         eax,ebx
 007229F5    call        TJvFormPlacement.Loaded
 007229FA    mov         cl,1
 007229FC    mov         edx,dword ptr [ebx+0B0];TJvFormStorage.FStoredProps:TJvFormStorageStringList
 00722A02    mov         eax,dword ptr [ebx+4];TJvFormStorage.FOwner:TComponent
 00722A05    call        0071E988
 00722A0A    pop         ebx
 00722A0B    ret
*}
end;

//00722A0C
{*procedure sub_00722A0C(?:?);
begin
 00722A0C    push        ebx
 00722A0D    push        esi
 00722A0E    mov         esi,edx
 00722A10    mov         ebx,eax
 00722A12    xor         ecx,ecx
 00722A14    mov         edx,dword ptr [ebx+0B0];TJvFormStorage.FStoredProps:TJvFormStorageStringList
 00722A1A    mov         eax,dword ptr [ebx+4];TJvFormStorage.FOwner:TComponent
 00722A1D    call        0071E988
 00722A22    mov         edx,esi
 00722A24    mov         eax,ebx
 00722A26    call        004530DC
 00722A2B    pop         esi
 00722A2C    pop         ebx
 00722A2D    ret
end;*}

//00722A30
procedure TJvFormStorage.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00722A30    push        ebx
 00722A31    push        esi
 00722A32    push        edi
 00722A33    mov         ebx,ecx
 00722A35    mov         edi,edx
 00722A37    mov         esi,eax
 00722A39    mov         ecx,ebx
 00722A3B    mov         edx,edi
 00722A3D    mov         eax,esi
 00722A3F    call        TJvFormPlacement.Notification
 00722A44    test        byte ptr [esi+1C],8;TJvFormStorage.FComponentState:TComponentState
>00722A48    jne         00722A8F
 00722A4A    cmp         bl,1
>00722A4D    jne         00722A8F
 00722A4F    cmp         dword ptr [esi+0B0],0;TJvFormStorage.FStoredProps:TJvFormStorageStringList
>00722A56    je          00722A8F
 00722A58    mov         eax,dword ptr [esi+0B0];TJvFormStorage.FStoredProps:TJvFormStorageStringList
 00722A5E    mov         edx,dword ptr [eax]
 00722A60    call        dword ptr [edx+14];TStringList.GetCount
 00722A63    mov         ebx,eax
 00722A65    dec         ebx
 00722A66    cmp         ebx,0
>00722A69    jl          00722A8F
 00722A6B    mov         edx,ebx
 00722A6D    mov         eax,dword ptr [esi+0B0];TJvFormStorage.FStoredProps:TJvFormStorageStringList
 00722A73    mov         ecx,dword ptr [eax]
 00722A75    call        dword ptr [ecx+18];TStringList.GetObject
 00722A78    cmp         edi,eax
>00722A7A    jne         00722A89
 00722A7C    mov         edx,ebx
 00722A7E    mov         eax,dword ptr [esi+0B0];TJvFormStorage.FStoredProps:TJvFormStorageStringList
 00722A84    mov         ecx,dword ptr [eax]
 00722A86    call        dword ptr [ecx+48];TStringList.Delete
 00722A89    dec         ebx
 00722A8A    cmp         ebx,0FFFFFFFF
>00722A8D    jne         00722A6B
 00722A8F    pop         edi
 00722A90    pop         esi
 00722A91    pop         ebx
 00722A92    ret
*}
end;

//00722A94
procedure sub_00722A94;
begin
{*
 00722A94    push        ebp
 00722A95    mov         ebp,esp
 00722A97    add         esp,0FFFFFFF0
 00722A9A    push        ebx
 00722A9B    xor         edx,edx
 00722A9D    mov         dword ptr [ebp-8],edx
 00722AA0    mov         ebx,eax
 00722AA2    xor         eax,eax
 00722AA4    push        ebp
 00722AA5    push        722B4A
 00722AAA    push        dword ptr fs:[eax]
 00722AAD    mov         dword ptr fs:[eax],esp
 00722AB0    mov         dl,1
 00722AB2    mov         eax,[0071E184];TJvPropertyStorage
 00722AB7    call        TObject.Create;TJvPropertyStorage.Create
 00722ABC    mov         dword ptr [ebp-4],eax
 00722ABF    xor         eax,eax
 00722AC1    push        ebp
 00722AC2    push        722B2D
 00722AC7    push        dword ptr fs:[eax]
 00722ACA    mov         dword ptr fs:[eax],esp
 00722ACD    lea         eax,[ebp-8]
 00722AD0    push        eax
 00722AD1    mov         eax,dword ptr [ebx+40];TJvFormStorage.FAppStoragePath:string
 00722AD4    mov         dword ptr [ebp-10],eax
 00722AD7    mov         eax,dword ptr [ebx+0B8];TJvFormStorage.FStoredPropsPath:string
 00722ADD    mov         dword ptr [ebp-0C],eax
 00722AE0    lea         edx,[ebp-10]
 00722AE3    mov         ecx,1
 00722AE8    mov         eax,ebx
 00722AEA    call        00721E28
 00722AEF    mov         edx,dword ptr [ebp-8]
 00722AF2    mov         eax,dword ptr [ebp-4]
 00722AF5    add         eax,14;TJvPropertyStorage.FAppStoragePath:string
 00722AF8    call        @UStrAsg
 00722AFD    mov         eax,dword ptr [ebx+3C];TJvFormStorage.FAppStorage:TJvCustomAppStorage
 00722B00    mov         edx,dword ptr [ebp-4]
 00722B03    mov         dword ptr [edx+10],eax;TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 00722B06    mov         ecx,dword ptr [ebx+0B0];TJvFormStorage.FStoredProps:TJvFormStorageStringList
 00722B0C    mov         edx,dword ptr [ebx+4];TJvFormStorage.FOwner:TComponent
 00722B0F    mov         eax,dword ptr [ebp-4]
 00722B12    call        TJvPropertyStorage.StoreObjectsProps
 00722B17    xor         eax,eax
 00722B19    pop         edx
 00722B1A    pop         ecx
 00722B1B    pop         ecx
 00722B1C    mov         dword ptr fs:[eax],edx
 00722B1F    push        722B34
 00722B24    mov         eax,dword ptr [ebp-4]
 00722B27    call        TObject.Free
 00722B2C    ret
>00722B2D    jmp         @HandleFinally
>00722B32    jmp         00722B24
 00722B34    xor         eax,eax
 00722B36    pop         edx
 00722B37    pop         ecx
 00722B38    pop         ecx
 00722B39    mov         dword ptr fs:[eax],edx
 00722B3C    push        722B51
 00722B41    lea         eax,[ebp-8]
 00722B44    call        @UStrClr
 00722B49    ret
>00722B4A    jmp         @HandleFinally
>00722B4F    jmp         00722B41
 00722B51    pop         ebx
 00722B52    mov         esp,ebp
 00722B54    pop         ebp
 00722B55    ret
*}
end;

//00722B58
procedure sub_00722B58;
begin
{*
 00722B58    push        ebp
 00722B59    mov         ebp,esp
 00722B5B    add         esp,0FFFFFFF0
 00722B5E    push        ebx
 00722B5F    push        esi
 00722B60    push        edi
 00722B61    xor         edx,edx
 00722B63    mov         dword ptr [ebp-8],edx
 00722B66    mov         ebx,eax
 00722B68    xor         eax,eax
 00722B6A    push        ebp
 00722B6B    push        722C32
 00722B70    push        dword ptr fs:[eax]
 00722B73    mov         dword ptr fs:[eax],esp
 00722B76    mov         dl,1
 00722B78    mov         eax,[0071E184];TJvPropertyStorage
 00722B7D    call        TObject.Create;TJvPropertyStorage.Create
 00722B82    mov         dword ptr [ebp-4],eax
 00722B85    xor         eax,eax
 00722B87    push        ebp
 00722B88    push        722C15
 00722B8D    push        dword ptr fs:[eax]
 00722B90    mov         dword ptr fs:[eax],esp
 00722B93    lea         eax,[ebp-8]
 00722B96    push        eax
 00722B97    mov         eax,dword ptr [ebx+40];TJvFormStorage.FAppStoragePath:string
 00722B9A    mov         dword ptr [ebp-10],eax
 00722B9D    mov         eax,dword ptr [ebx+0B8];TJvFormStorage.FStoredPropsPath:string
 00722BA3    mov         dword ptr [ebp-0C],eax
 00722BA6    lea         edx,[ebp-10]
 00722BA9    mov         ecx,1
 00722BAE    mov         eax,ebx
 00722BB0    call        00721E28
 00722BB5    mov         edx,dword ptr [ebp-8]
 00722BB8    mov         eax,dword ptr [ebp-4]
 00722BBB    add         eax,14;TJvPropertyStorage.FAppStoragePath:string
 00722BBE    call        @UStrAsg
 00722BC3    mov         eax,dword ptr [ebx+3C];TJvFormStorage.FAppStorage:TJvCustomAppStorage
 00722BC6    mov         edx,dword ptr [ebp-4]
 00722BC9    mov         dword ptr [edx+10],eax;TJvPropertyStorage.FAppStorage:TJvCustomAppStorage
 00722BCC    xor         eax,eax
 00722BCE    push        ebp
 00722BCF    push        722BF5
 00722BD4    push        dword ptr fs:[eax]
 00722BD7    mov         dword ptr fs:[eax],esp
 00722BDA    mov         ecx,dword ptr [ebx+0B0];TJvFormStorage.FStoredProps:TJvFormStorageStringList
 00722BE0    mov         edx,dword ptr [ebx+4];TJvFormStorage.FOwner:TComponent
 00722BE3    mov         eax,dword ptr [ebp-4]
 00722BE6    call        TJvPropertyStorage.LoadObjectsProps
 00722BEB    xor         eax,eax
 00722BED    pop         edx
 00722BEE    pop         ecx
 00722BEF    pop         ecx
 00722BF0    mov         dword ptr fs:[eax],edx
>00722BF3    jmp         00722BFF
>00722BF5    jmp         @HandleAnyException
 00722BFA    call        @DoneExcept
 00722BFF    xor         eax,eax
 00722C01    pop         edx
 00722C02    pop         ecx
 00722C03    pop         ecx
 00722C04    mov         dword ptr fs:[eax],edx
 00722C07    push        722C1C
 00722C0C    mov         eax,dword ptr [ebp-4]
 00722C0F    call        TObject.Free
 00722C14    ret
>00722C15    jmp         @HandleFinally
>00722C1A    jmp         00722C0C
 00722C1C    xor         eax,eax
 00722C1E    pop         edx
 00722C1F    pop         ecx
 00722C20    pop         ecx
 00722C21    mov         dword ptr fs:[eax],edx
 00722C24    push        722C39
 00722C29    lea         eax,[ebp-8]
 00722C2C    call        @UStrClr
 00722C31    ret
>00722C32    jmp         @HandleFinally
>00722C37    jmp         00722C29
 00722C39    pop         edi
 00722C3A    pop         esi
 00722C3B    pop         ebx
 00722C3C    mov         esp,ebp
 00722C3E    pop         ebp
 00722C3F    ret
*}
end;

//00722C40
procedure sub_00722C40;
begin
{*
 00722C40    push        ebp
 00722C41    mov         ebp,esp
 00722C43    push        0
 00722C45    push        ebx
 00722C46    push        esi
 00722C47    mov         ebx,eax
 00722C49    xor         eax,eax
 00722C4B    push        ebp
 00722C4C    push        722CB5
 00722C51    push        dword ptr fs:[eax]
 00722C54    mov         dword ptr fs:[eax],esp
 00722C57    cmp         byte ptr [ebx+52],0;TJvFormStorage.FRestored:Boolean
>00722C5B    je          00722C9F
 00722C5D    mov         eax,ebx
 00722C5F    call        00721D0C
 00722C64    lea         eax,[ebp-4]
 00722C67    call        @IntfClear
 00722C6C    mov         ecx,eax
 00722C6E    mov         edx,722CC4;['{E3754817-49A3-4612-A228-5D44A088681D}']
 00722C73    mov         eax,dword ptr [ebx+4];TJvFormStorage.FOwner:TComponent
 00722C76    call        Supports
 00722C7B    test        al,al
>00722C7D    je          00722C8D
 00722C7F    mov         ecx,dword ptr [ebx+40];TJvFormStorage.FAppStoragePath:string
 00722C82    mov         edx,dword ptr [ebx+3C];TJvFormStorage.FAppStorage:TJvCustomAppStorage
 00722C85    mov         eax,dword ptr [ebp-4]
 00722C88    mov         esi,dword ptr [eax]
 00722C8A    call        dword ptr [esi+10]
 00722C8D    mov         eax,ebx
 00722C8F    mov         edx,dword ptr [eax]
 00722C91    call        dword ptr [edx+3C];TJvFormStorage.sub_00722A94
 00722C94    mov         eax,dword ptr [ebx+0B4];TJvFormStorage.FStoredValues:TJvStoredValues
 00722C9A    mov         edx,dword ptr [eax]
 00722C9C    call        dword ptr [edx+28];TJvStoredValues.SaveValues
 00722C9F    xor         eax,eax
 00722CA1    pop         edx
 00722CA2    pop         ecx
 00722CA3    pop         ecx
 00722CA4    mov         dword ptr fs:[eax],edx
 00722CA7    push        722CBC
 00722CAC    lea         eax,[ebp-4]
 00722CAF    call        @IntfClear
 00722CB4    ret
>00722CB5    jmp         @HandleFinally
>00722CBA    jmp         00722CAC
 00722CBC    pop         esi
 00722CBD    pop         ebx
 00722CBE    pop         ecx
 00722CBF    pop         ebp
 00722CC0    ret
*}
end;

//00722CD4
procedure sub_00722CD4;
begin
{*
 00722CD4    push        ebp
 00722CD5    mov         ebp,esp
 00722CD7    push        0
 00722CD9    push        ebx
 00722CDA    push        esi
 00722CDB    mov         ebx,eax
 00722CDD    xor         eax,eax
 00722CDF    push        ebp
 00722CE0    push        722D47
 00722CE5    push        dword ptr fs:[eax]
 00722CE8    mov         dword ptr fs:[eax],esp
 00722CEB    mov         eax,ebx
 00722CED    call        00721DF0
 00722CF2    mov         byte ptr [ebx+52],1;TJvFormStorage.FRestored:Boolean
 00722CF6    lea         eax,[ebp-4]
 00722CF9    call        @IntfClear
 00722CFE    mov         ecx,eax
 00722D00    mov         edx,722D54;['{E3754817-49A3-4612-A228-5D44A088681D}']
 00722D05    mov         eax,dword ptr [ebx+4];TJvFormStorage.FOwner:TComponent
 00722D08    call        Supports
 00722D0D    test        al,al
>00722D0F    je          00722D1F
 00722D11    mov         ecx,dword ptr [ebx+40];TJvFormStorage.FAppStoragePath:string
 00722D14    mov         edx,dword ptr [ebx+3C];TJvFormStorage.FAppStorage:TJvCustomAppStorage
 00722D17    mov         eax,dword ptr [ebp-4]
 00722D1A    mov         esi,dword ptr [eax]
 00722D1C    call        dword ptr [esi+0C]
 00722D1F    mov         eax,ebx
 00722D21    mov         edx,dword ptr [eax]
 00722D23    call        dword ptr [edx+40];TJvFormStorage.sub_00722B58
 00722D26    mov         eax,dword ptr [ebx+0B4];TJvFormStorage.FStoredValues:TJvStoredValues
 00722D2C    mov         edx,dword ptr [eax]
 00722D2E    call        dword ptr [edx+2C];TJvStoredValues.RestoreValues
 00722D31    xor         eax,eax
 00722D33    pop         edx
 00722D34    pop         ecx
 00722D35    pop         ecx
 00722D36    mov         dword ptr fs:[eax],edx
 00722D39    push        722D4E
 00722D3E    lea         eax,[ebp-4]
 00722D41    call        @IntfClear
 00722D46    ret
>00722D47    jmp         @HandleFinally
>00722D4C    jmp         00722D3E
 00722D4E    pop         esi
 00722D4F    pop         ebx
 00722D50    pop         ecx
 00722D51    pop         ebp
 00722D52    ret
*}
end;

//00722D64
destructor TJvIniLink.Destroy();
begin
{*
 00722D64    push        ebx
 00722D65    push        esi
 00722D66    call        @BeforeDestruction
 00722D6B    mov         ebx,edx
 00722D6D    mov         esi,eax
 00722D6F    xor         eax,eax
 00722D71    mov         dword ptr [esi+8],eax;TJvIniLink.FOnSave:TNotifyEvent
 00722D74    mov         dword ptr [esi+0C],eax;TJvIniLink.?fC:TJvMRUManager
 00722D77    xor         eax,eax
 00722D79    mov         dword ptr [esi+10],eax;TJvIniLink.FOnLoad:TNotifyEvent
 00722D7C    mov         dword ptr [esi+14],eax;TJvIniLink.?f14:TJvMRUManager
 00722D7F    xor         edx,edx
 00722D81    mov         eax,esi
 00722D83    call        00722DA4
 00722D88    mov         edx,ebx
 00722D8A    and         dl,0FC
 00722D8D    mov         eax,esi
 00722D8F    call        TMemoryStream.Destroy
 00722D94    test        bl,bl
>00722D96    jle         00722D9F
 00722D98    mov         eax,esi
 00722D9A    call        @ClassDestroy
 00722D9F    pop         esi
 00722DA0    pop         ebx
 00722DA1    ret
*}
end;

//00722DA4
procedure sub_00722DA4(?:TJvIniLink; ?:TJvFormPlacement);
begin
{*
 00722DA4    push        ebx
 00722DA5    push        esi
 00722DA6    mov         esi,edx
 00722DA8    mov         ebx,eax
 00722DAA    mov         eax,dword ptr [ebx+4];TJvIniLink.FStorage:TJvFormPlacement
 00722DAD    cmp         esi,eax
>00722DAF    je          00722DC9
 00722DB1    test        eax,eax
>00722DB3    je          00722DBC
 00722DB5    mov         edx,ebx
 00722DB7    call        007213C4
 00722DBC    test        esi,esi
>00722DBE    je          00722DC9
 00722DC0    mov         edx,ebx
 00722DC2    mov         eax,esi
 00722DC4    call        00721360
 00722DC9    pop         esi
 00722DCA    pop         ebx
 00722DCB    ret
*}
end;

//00722DCC
procedure sub_00722DCC;
begin
{*
 00722DCC    push        ebx
 00722DCD    cmp         word ptr [eax+0A],0;TJvIniLink.?fA:word
>00722DD2    je          00722DDE
 00722DD4    mov         ebx,eax
 00722DD6    mov         edx,eax
 00722DD8    mov         eax,dword ptr [ebx+0C];TJvIniLink.?fC:TJvMRUManager
 00722DDB    call        dword ptr [ebx+8];TJvIniLink.FOnSave
 00722DDE    pop         ebx
 00722DDF    ret
*}
end;

//00722DE0
procedure sub_00722DE0;
begin
{*
 00722DE0    push        ebx
 00722DE1    cmp         word ptr [eax+12],0;TJvIniLink.?f12:word
>00722DE6    je          00722DF2
 00722DE8    mov         ebx,eax
 00722DEA    mov         edx,eax
 00722DEC    mov         eax,dword ptr [ebx+14];TJvIniLink.?f14:TJvMRUManager
 00722DEF    call        dword ptr [ebx+10];TJvIniLink.FOnLoad
 00722DF2    pop         ebx
 00722DF3    ret
*}
end;

//00722DF4
constructor TJvStoredValue.Create(Collection:TCollection);
begin
{*
 00722DF4    push        ebp
 00722DF5    mov         ebp,esp
 00722DF7    push        0
 00722DF9    push        0
 00722DFB    push        0
 00722DFD    push        0
 00722DFF    push        ebx
 00722E00    push        esi
 00722E01    test        dl,dl
>00722E03    je          00722E0D
 00722E05    add         esp,0FFFFFFF0
 00722E08    call        @ClassCreate
 00722E0D    mov         ebx,edx
 00722E0F    mov         esi,eax
 00722E11    xor         eax,eax
 00722E13    push        ebp
 00722E14    push        722E51
 00722E19    push        dword ptr fs:[eax]
 00722E1C    mov         dword ptr fs:[eax],esp
 00722E1F    xor         edx,edx
 00722E21    mov         eax,esi
 00722E23    call        TCollectionItem.Create
 00722E28    lea         eax,[ebp-10]
 00722E2B    call        00435DC0
 00722E30    lea         edx,[ebp-10]
 00722E33    lea         eax,[esi+10];TJvStoredValue.FValue:Variant
 00722E36    call        @VarCopy
 00722E3B    xor         eax,eax
 00722E3D    pop         edx
 00722E3E    pop         ecx
 00722E3F    pop         ecx
 00722E40    mov         dword ptr fs:[eax],edx
 00722E43    push        722E58
 00722E48    lea         eax,[ebp-10]
 00722E4B    call        @VarClr
 00722E50    ret
>00722E51    jmp         @HandleFinally
>00722E56    jmp         00722E48
 00722E58    mov         eax,esi
 00722E5A    test        bl,bl
>00722E5C    je          00722E6D
 00722E5E    call        @AfterConstruction
 00722E63    pop         dword ptr fs:[0]
 00722E6A    add         esp,0C
 00722E6D    mov         eax,esi
 00722E6F    pop         esi
 00722E70    pop         ebx
 00722E71    mov         esp,ebp
 00722E73    pop         ebp
 00722E74    ret
*}
end;

//00722E78
procedure TJvStoredValue.Assign(Source:TPersistent);
begin
{*
 00722E78    push        ebx
 00722E79    push        esi
 00722E7A    push        edi
 00722E7B    mov         ebx,edx
 00722E7D    mov         esi,eax
 00722E7F    mov         eax,ebx
 00722E81    mov         edx,dword ptr ds:[720C30];TJvStoredValue
 00722E87    call        @IsClass
 00722E8C    test        al,al
>00722E8E    je          00722EC9
 00722E90    mov         edi,ebx
 00722E92    lea         eax,[edi+10]
 00722E95    call        VarIsEmpty
 00722E9A    test        al,al
>00722E9C    je          00722EA7
 00722E9E    mov         eax,esi
 00722EA0    call        TJvStoredValue.Clear
>00722EA5    jmp         00722EB2
 00722EA7    lea         eax,[esi+10];TJvStoredValue.FValue:Variant
 00722EAA    lea         edx,[edi+10]
 00722EAD    call        @VarCopy
 00722EB2    mov         edx,dword ptr [edi+0C]
 00722EB5    mov         eax,esi
 00722EB7    mov         ecx,dword ptr [eax]
 00722EB9    call        dword ptr [ecx+18];TJvStoredValue.SetName
 00722EBC    lea         eax,[esi+20];TJvStoredValue.FKeyString:string
 00722EBF    mov         edx,dword ptr [edi+20]
 00722EC2    call        @UStrAsg
>00722EC7    jmp         00722ED2
 00722EC9    mov         edx,ebx
 00722ECB    mov         eax,esi
 00722ECD    call        TPersistent.Assign
 00722ED2    pop         edi
 00722ED3    pop         esi
 00722ED4    pop         ebx
 00722ED5    ret
*}
end;

//00722ED8
{*procedure TJvStoredValue.GetDisplayName(?:?);
begin
 00722ED8    push        ebx
 00722ED9    push        esi
 00722EDA    mov         esi,edx
 00722EDC    mov         ebx,eax
 00722EDE    cmp         dword ptr [ebx+0C],0;TJvStoredValue.FName:string
>00722EE2    jne         00722EF0
 00722EE4    mov         edx,esi
 00722EE6    mov         eax,ebx
 00722EE8    call        TCollectionItem.GetDisplayName
 00722EED    pop         esi
 00722EEE    pop         ebx
 00722EEF    ret
 00722EF0    mov         eax,esi
 00722EF2    mov         edx,dword ptr [ebx+0C];TJvStoredValue.FName:string
 00722EF5    call        @UStrAsg
 00722EFA    pop         esi
 00722EFB    pop         ebx
 00722EFC    ret
end;*}

//00722F00
procedure TJvStoredValue.SetName(Value:string);
begin
{*
 00722F00    push        ebx
 00722F01    push        esi
 00722F02    mov         esi,edx
 00722F04    mov         ebx,eax
 00722F06    test        esi,esi
>00722F08    je          00722F4F
 00722F0A    mov         edx,dword ptr [ebx+0C];TJvStoredValue.FName:string
 00722F0D    mov         eax,esi
 00722F0F    call        AnsiCompareText
 00722F14    test        eax,eax
>00722F16    je          00722F4F
 00722F18    mov         eax,dword ptr [ebx+4];TJvStoredValue.FCollection:TCollection
 00722F1B    mov         edx,dword ptr ds:[720F88];TJvStoredValues
 00722F21    call        @IsClass
 00722F26    test        al,al
>00722F28    je          00722F4F
 00722F2A    mov         edx,esi
 00722F2C    mov         eax,dword ptr [ebx+4];TJvStoredValue.FCollection:TCollection
 00722F2F    call        TJvStoredValues.IndexOf
 00722F34    test        eax,eax
>00722F36    jl          00722F4F
 00722F38    mov         ecx,dword ptr ds:[78CF94];^SResString119:TResStringRec
 00722F3E    mov         dl,1
 00722F40    mov         eax,[0052C464];EJVCLException
 00722F45    call        Exception.CreateRes;EJVCLException.Create
 00722F4A    call        @RaiseExcept
 00722F4F    lea         eax,[ebx+0C];TJvStoredValue.FName:string
 00722F52    mov         edx,esi
 00722F54    call        @UStrAsg
 00722F59    mov         edx,esi
 00722F5B    mov         eax,ebx
 00722F5D    call        TCollectionItem.SetDisplayName
 00722F62    pop         esi
 00722F63    pop         ebx
 00722F64    ret
*}
end;

//00722F68
{*function sub_00722F68(?:TJvStoredValue):?;
begin
 00722F68    push        ebx
 00722F69    push        esi
 00722F6A    mov         ebx,eax
 00722F6C    mov         esi,dword ptr [ebx+4]
 00722F6F    mov         eax,esi
 00722F71    mov         edx,dword ptr ds:[720F88];TJvStoredValues
 00722F77    call        @IsClass
 00722F7C    test        al,al
>00722F7E    je          00722F85
 00722F80    mov         eax,esi
 00722F82    pop         esi
 00722F83    pop         ebx
 00722F84    ret
 00722F85    xor         eax,eax
 00722F87    pop         esi
 00722F88    pop         ebx
 00722F89    ret
end;*}

//00722F8C
procedure TJvStoredValue.Clear;
begin
{*
 00722F8C    push        ebp
 00722F8D    mov         ebp,esp
 00722F8F    xor         ecx,ecx
 00722F91    push        ecx
 00722F92    push        ecx
 00722F93    push        ecx
 00722F94    push        ecx
 00722F95    push        ebx
 00722F96    mov         ebx,eax
 00722F98    xor         eax,eax
 00722F9A    push        ebp
 00722F9B    push        722FCF
 00722FA0    push        dword ptr fs:[eax]
 00722FA3    mov         dword ptr fs:[eax],esp
 00722FA6    lea         eax,[ebp-10]
 00722FA9    call        00435DC0
 00722FAE    lea         edx,[ebp-10]
 00722FB1    lea         eax,[ebx+10];TJvStoredValue.FValue:Variant
 00722FB4    call        @VarCopy
 00722FB9    xor         eax,eax
 00722FBB    pop         edx
 00722FBC    pop         ecx
 00722FBD    pop         ecx
 00722FBE    mov         dword ptr fs:[eax],edx
 00722FC1    push        722FD6
 00722FC6    lea         eax,[ebp-10]
 00722FC9    call        @VarClr
 00722FCE    ret
>00722FCF    jmp         @HandleFinally
>00722FD4    jmp         00722FC6
 00722FD6    pop         ebx
 00722FD7    mov         esp,ebp
 00722FD9    pop         ebp
 00722FDA    ret
*}
end;

//00722FDC
procedure TJvStoredValue.IsStoredValue(Value:Variant);
begin
{*
 00722FDC    push        ebx
 00722FDD    mov         ebx,eax
 00722FDF    lea         eax,[ebx+10];TJvStoredValue.FValue:Variant
 00722FE2    call        VarIsEmpty
 00722FE7    xor         al,1
 00722FE9    pop         ebx
 00722FEA    ret
*}
end;

//00722FEC
procedure TJvStoredValue.Save;
begin
{*
 00722FEC    push        ebp
 00722FED    mov         ebp,esp
 00722FEF    mov         ecx,5
 00722FF4    push        0
 00722FF6    push        0
 00722FF8    dec         ecx
>00722FF9    jne         00722FF4
 00722FFB    push        ebx
 00722FFC    mov         ebx,eax
 00722FFE    xor         eax,eax
 00723000    push        ebp
 00723001    push        7231B4
 00723006    push        dword ptr fs:[eax]
 00723009    mov         dword ptr fs:[eax],esp
 0072300C    lea         eax,[ebp-8]
 0072300F    push        eax
 00723010    mov         eax,ebx
 00723012    call        00722F68
 00723017    mov         eax,dword ptr [eax+20]
 0072301A    mov         dword ptr [ebp-20],eax
 0072301D    mov         eax,dword ptr [ebx+0C];TJvStoredValue.FName:string
 00723020    mov         dword ptr [ebp-1C],eax
 00723023    lea         eax,[ebp-20]
 00723026    push        eax
 00723027    mov         eax,ebx
 00723029    call        00722F68
 0072302E    mov         eax,dword ptr [eax+1C]
 00723031    mov         ecx,1
 00723036    pop         edx
 00723037    call        00721E28
 0072303C    lea         eax,[ebp-18]
 0072303F    lea         edx,[ebx+10];TJvStoredValue.FValue:Variant
 00723042    call        @VarCopy
 00723047    cmp         word ptr [ebx+2A],0;TJvStoredValue.?f2A:word
>0072304C    je          00723059
 0072304E    lea         ecx,[ebp-18]
 00723051    mov         edx,ebx
 00723053    mov         eax,dword ptr [ebx+2C];TJvStoredValue.?f2C:dword
 00723056    call        dword ptr [ebx+28];TJvStoredValue.FOnSave
 00723059    cmp         dword ptr [ebx+20],0;TJvStoredValue.FKeyString:string
>0072305D    je          0072309D
 0072305F    lea         edx,[ebp-4]
 00723062    lea         eax,[ebp-18]
 00723065    call        VarToStr
 0072306A    lea         ecx,[ebp-24]
 0072306D    mov         edx,dword ptr [ebp-4]
 00723070    mov         eax,dword ptr [ebx+20];TJvStoredValue.FKeyString:string
 00723073    call        0053FF00
 00723078    mov         edx,dword ptr [ebp-24]
 0072307B    lea         eax,[ebp-4]
 0072307E    call        @UStrLAsg
 00723083    mov         eax,ebx
 00723085    call        00722F68
 0072308A    mov         eax,dword ptr [eax+1C]
 0072308D    mov         ecx,dword ptr [ebp-4]
 00723090    mov         edx,dword ptr [ebp-8]
 00723093    call        TJvFormPlacement.WriteString
>00723098    jmp         00723184
 0072309D    lea         eax,[ebp-18]
 007230A0    call        0053F9FC
 007230A5    test        al,al
>007230A7    je          007230CC
 007230A9    mov         eax,ebx
 007230AB    call        00722F68
 007230B0    mov         eax,dword ptr [eax+1C]
 007230B3    push        eax
 007230B4    lea         eax,[ebp-18]
 007230B7    call        @VarToInteger
 007230BC    mov         ecx,eax
 007230BE    mov         edx,dword ptr [ebp-8]
 007230C1    pop         eax
 007230C2    call        TJvFormPlacement.WriteInteger
>007230C7    jmp         00723184
 007230CC    lea         eax,[ebp-18]
 007230CF    call        004353E8
 007230D4    add         eax,0FFFFFFFC
 007230D7    sub         ax,3
>007230DB    jae         00723103
 007230DD    lea         eax,[ebp-18]
 007230E0    call        @VarToReal
 007230E5    add         esp,0FFFFFFF8
 007230E8    fstp        qword ptr [esp]
 007230EB    wait
 007230EC    mov         eax,ebx
 007230EE    call        00722F68
 007230F3    mov         eax,dword ptr [eax+1C]
 007230F6    mov         edx,dword ptr [ebp-8]
 007230F9    call        TJvFormPlacement.WriteFloat
>007230FE    jmp         00723184
 00723103    lea         eax,[ebp-18]
 00723106    call        004353E8
 0072310B    sub         ax,7
>0072310F    jne         00723134
 00723111    lea         eax,[ebp-18]
 00723114    call        @VarToReal
 00723119    add         esp,0FFFFFFF8
 0072311C    fstp        qword ptr [esp]
 0072311F    wait
 00723120    mov         eax,ebx
 00723122    call        00722F68
 00723127    mov         eax,dword ptr [eax+1C]
 0072312A    mov         edx,dword ptr [ebp-8]
 0072312D    call        TJvFormPlacement.WriteDateTime
>00723132    jmp         00723184
 00723134    lea         eax,[ebp-18]
 00723137    call        004353E8
 0072313C    sub         ax,0B
>00723140    jne         00723162
 00723142    mov         eax,ebx
 00723144    call        00722F68
 00723149    mov         eax,dword ptr [eax+1C]
 0072314C    push        eax
 0072314D    lea         eax,[ebp-18]
 00723150    call        @VarToBool
 00723155    mov         ecx,eax
 00723157    mov         edx,dword ptr [ebp-8]
 0072315A    pop         eax
 0072315B    call        TJvFormPlacement.WriteBoolean
>00723160    jmp         00723184
 00723162    mov         eax,ebx
 00723164    call        00722F68
 00723169    mov         eax,dword ptr [eax+1C]
 0072316C    push        eax
 0072316D    lea         eax,[ebp-28]
 00723170    lea         edx,[ebp-18]
 00723173    call        @VarToUStr
 00723178    mov         ecx,dword ptr [ebp-28]
 0072317B    mov         edx,dword ptr [ebp-8]
 0072317E    pop         eax
 0072317F    call        TJvFormPlacement.WriteString
 00723184    xor         eax,eax
 00723186    pop         edx
 00723187    pop         ecx
 00723188    pop         ecx
 00723189    mov         dword ptr fs:[eax],edx
 0072318C    push        7231BB
 00723191    lea         eax,[ebp-28]
 00723194    mov         edx,2
 00723199    call        @UStrArrayClr
 0072319E    lea         eax,[ebp-18]
 007231A1    call        @VarClr
 007231A6    lea         eax,[ebp-8]
 007231A9    mov         edx,2
 007231AE    call        @UStrArrayClr
 007231B3    ret
>007231B4    jmp         @HandleFinally
>007231B9    jmp         00723191
 007231BB    pop         ebx
 007231BC    mov         esp,ebp
 007231BE    pop         ebp
 007231BF    ret
*}
end;

//007231C0
procedure TJvStoredValue.Restore;
begin
{*
 007231C0    push        ebp
 007231C1    mov         ebp,esp
 007231C3    mov         ecx,7
 007231C8    push        0
 007231CA    push        0
 007231CC    dec         ecx
>007231CD    jne         007231C8
 007231CF    push        ebx
 007231D0    mov         ebx,eax
 007231D2    xor         eax,eax
 007231D4    push        ebp
 007231D5    push        7233E5
 007231DA    push        dword ptr fs:[eax]
 007231DD    mov         dword ptr fs:[eax],esp
 007231E0    lea         eax,[ebp-0C]
 007231E3    push        eax
 007231E4    mov         eax,ebx
 007231E6    call        00722F68
 007231EB    mov         eax,dword ptr [eax+20]
 007231EE    mov         dword ptr [ebp-28],eax
 007231F1    mov         eax,dword ptr [ebx+0C];TJvStoredValue.FName:string
 007231F4    mov         dword ptr [ebp-24],eax
 007231F7    lea         eax,[ebp-28]
 007231FA    push        eax
 007231FB    mov         eax,ebx
 007231FD    call        00722F68
 00723202    mov         eax,dword ptr [eax+1C]
 00723205    mov         ecx,1
 0072320A    pop         edx
 0072320B    call        00721E28
 00723210    cmp         dword ptr [ebx+20],0;TJvStoredValue.FKeyString:string
>00723214    je          0072327C
 00723216    lea         edx,[ebp-8]
 00723219    lea         eax,[ebx+10];TJvStoredValue.FValue:Variant
 0072321C    call        VarToStr
 00723221    lea         ecx,[ebp-2C]
 00723224    mov         edx,dword ptr [ebp-8]
 00723227    mov         eax,dword ptr [ebx+20];TJvStoredValue.FKeyString:string
 0072322A    call        0053FF00
 0072322F    mov         edx,dword ptr [ebp-2C]
 00723232    lea         eax,[ebp-8]
 00723235    call        @UStrLAsg
 0072323A    lea         eax,[ebp-4]
 0072323D    push        eax
 0072323E    mov         eax,ebx
 00723240    call        00722F68
 00723245    mov         eax,dword ptr [eax+1C]
 00723248    mov         ecx,dword ptr [ebp-8]
 0072324B    mov         edx,dword ptr [ebp-0C]
 0072324E    call        TJvFormPlacement.ReadString
 00723253    lea         ecx,[ebp-30]
 00723256    mov         edx,dword ptr [ebp-4]
 00723259    mov         eax,dword ptr [ebx+20];TJvStoredValue.FKeyString:string
 0072325C    call        0053FFD4
 00723261    mov         edx,dword ptr [ebp-30]
 00723264    lea         eax,[ebp-4]
 00723267    call        @UStrLAsg
 0072326C    lea         eax,[ebp-20]
 0072326F    mov         edx,dword ptr [ebp-4]
 00723272    call        @VarFromUStr
>00723277    jmp         00723398
 0072327C    lea         eax,[ebx+10];TJvStoredValue.FValue:Variant
 0072327F    call        0053F9FC
 00723284    test        al,al
>00723286    je          007232B7
 00723288    mov         eax,ebx
 0072328A    call        00722F68
 0072328F    mov         eax,dword ptr [eax+1C]
 00723292    push        eax
 00723293    lea         eax,[ebx+10];TJvStoredValue.FValue:Variant
 00723296    call        @VarToInteger
 0072329B    mov         ecx,eax
 0072329D    mov         edx,dword ptr [ebp-0C]
 007232A0    pop         eax
 007232A1    call        TJvFormPlacement.ReadInteger
 007232A6    mov         edx,eax
 007232A8    lea         eax,[ebp-20]
 007232AB    mov         cl,0FC
 007232AD    call        @VarFromInt
>007232B2    jmp         00723398
 007232B7    lea         eax,[ebx+10];TJvStoredValue.FValue:Variant
 007232BA    call        004353E8
 007232BF    add         eax,0FFFFFFFC
 007232C2    sub         ax,3
>007232C6    jae         007232F6
 007232C8    lea         eax,[ebx+10];TJvStoredValue.FValue:Variant
 007232CB    call        @VarToReal
 007232D0    add         esp,0FFFFFFF8
 007232D3    fstp        qword ptr [esp]
 007232D6    wait
 007232D7    mov         eax,ebx
 007232D9    call        00722F68
 007232DE    mov         eax,dword ptr [eax+1C]
 007232E1    mov         edx,dword ptr [ebp-0C]
 007232E4    call        TJvFormPlacement.ReadFloat
 007232E9    lea         eax,[ebp-20]
 007232EC    call        @VarFromReal
>007232F1    jmp         00723398
 007232F6    lea         eax,[ebx+10];TJvStoredValue.FValue:Variant
 007232F9    call        004353E8
 007232FE    sub         ax,7
>00723302    jne         0072332F
 00723304    lea         eax,[ebx+10];TJvStoredValue.FValue:Variant
 00723307    call        @VarToReal
 0072330C    add         esp,0FFFFFFF8
 0072330F    fstp        qword ptr [esp]
 00723312    wait
 00723313    mov         eax,ebx
 00723315    call        00722F68
 0072331A    mov         eax,dword ptr [eax+1C]
 0072331D    mov         edx,dword ptr [ebp-0C]
 00723320    call        TJvFormPlacement.ReadDateTime
 00723325    lea         eax,[ebp-20]
 00723328    call        @VarFromTDateTime
>0072332D    jmp         00723398
 0072332F    lea         eax,[ebx+10];TJvStoredValue.FValue:Variant
 00723332    call        004353E8
 00723337    sub         ax,0B
>0072333B    jne         00723367
 0072333D    mov         eax,ebx
 0072333F    call        00722F68
 00723344    mov         eax,dword ptr [eax+1C]
 00723347    push        eax
 00723348    lea         eax,[ebx+10];TJvStoredValue.FValue:Variant
 0072334B    call        @VarToBool
 00723350    mov         ecx,eax
 00723352    mov         edx,dword ptr [ebp-0C]
 00723355    pop         eax
 00723356    call        TJvFormPlacement.ReadBoolean
 0072335B    mov         edx,eax
 0072335D    lea         eax,[ebp-20]
 00723360    call        @VarFromBool
>00723365    jmp         00723398
 00723367    lea         eax,[ebp-34]
 0072336A    push        eax
 0072336B    mov         eax,ebx
 0072336D    call        00722F68
 00723372    mov         eax,dword ptr [eax+1C]
 00723375    push        eax
 00723376    lea         eax,[ebp-38]
 00723379    lea         edx,[ebx+10];TJvStoredValue.FValue:Variant
 0072337C    call        @VarToUStr
 00723381    mov         ecx,dword ptr [ebp-38]
 00723384    mov         edx,dword ptr [ebp-0C]
 00723387    pop         eax
 00723388    call        TJvFormPlacement.ReadString
 0072338D    mov         edx,dword ptr [ebp-34]
 00723390    lea         eax,[ebp-20]
 00723393    call        @VarFromUStr
 00723398    cmp         word ptr [ebx+32],0;TJvStoredValue.?f32:word
>0072339D    je          007233AA
 0072339F    lea         ecx,[ebp-20]
 007233A2    mov         edx,ebx
 007233A4    mov         eax,dword ptr [ebx+34];TJvStoredValue.?f34:dword
 007233A7    call        dword ptr [ebx+30];TJvStoredValue.FOnRestore
 007233AA    lea         eax,[ebx+10];TJvStoredValue.FValue:Variant
 007233AD    lea         edx,[ebp-20]
 007233B0    call        @VarCopy
 007233B5    xor         eax,eax
 007233B7    pop         edx
 007233B8    pop         ecx
 007233B9    pop         ecx
 007233BA    mov         dword ptr fs:[eax],edx
 007233BD    push        7233EC
 007233C2    lea         eax,[ebp-38]
 007233C5    mov         edx,4
 007233CA    call        @UStrArrayClr
 007233CF    lea         eax,[ebp-20]
 007233D2    call        @VarClr
 007233D7    lea         eax,[ebp-0C]
 007233DA    mov         edx,3
 007233DF    call        @UStrArrayClr
 007233E4    ret
>007233E5    jmp         @HandleFinally
>007233EA    jmp         007233C2
 007233EC    pop         ebx
 007233ED    mov         esp,ebp
 007233EF    pop         ebp
 007233F0    ret
*}
end;

//007233F4
constructor TJvStoredValues.Create(AOwner:TPersistent);
begin
{*
 007233F4    push        ebx
 007233F5    push        esi
 007233F6    test        dl,dl
>007233F8    je          00723402
 007233FA    add         esp,0FFFFFFF0
 007233FD    call        @ClassCreate
 00723402    mov         ebx,edx
 00723404    mov         esi,eax
 00723406    mov         eax,[00720C30];TJvStoredValue
 0072340B    push        eax
 0072340C    xor         edx,edx
 0072340E    mov         eax,esi
 00723410    call        TOwnedCollection.Create
 00723415    mov         eax,esi
 00723417    test        bl,bl
>00723419    je          0072342A
 0072341B    call        @AfterConstruction
 00723420    pop         dword ptr fs:[0]
 00723427    add         esp,0C
 0072342A    mov         eax,esi
 0072342C    pop         esi
 0072342D    pop         ebx
 0072342E    ret
*}
end;

//00723430
function TJvStoredValues.IndexOf(Name:string):Integer;
begin
{*
 00723430    push        ebx
 00723431    push        esi
 00723432    push        edi
 00723433    push        ebp
 00723434    mov         ebp,edx
 00723436    mov         edi,eax
 00723438    mov         eax,edi
 0072343A    call        TCollection.GetCount
 0072343F    mov         ebx,eax
 00723441    dec         ebx
 00723442    test        ebx,ebx
>00723444    jl          00723464
 00723446    inc         ebx
 00723447    xor         esi,esi
 00723449    mov         edx,esi
 0072344B    mov         eax,edi
 0072344D    call        00723470
 00723452    mov         eax,dword ptr [eax+0C]
 00723455    mov         edx,ebp
 00723457    call        AnsiCompareText
 0072345C    test        eax,eax
>0072345E    je          00723467
 00723460    inc         esi
 00723461    dec         ebx
>00723462    jne         00723449
 00723464    or          esi,0FFFFFFFF
 00723467    mov         eax,esi
 00723469    pop         ebp
 0072346A    pop         edi
 0072346B    pop         esi
 0072346C    pop         ebx
 0072346D    ret
*}
end;

//00723470
{*function sub_00723470(?:TJvStoredValues; ?:?):?;
begin
 00723470    push        ebx
 00723471    push        esi
 00723472    mov         esi,edx
 00723474    mov         ebx,eax
 00723476    mov         edx,esi
 00723478    mov         eax,ebx
 0072347A    call        TCollection.GetItem
 0072347F    pop         esi
 00723480    pop         ebx
 00723481    ret
end;*}

//00723484
procedure TJvStoredValues.SaveValues;
begin
{*
 00723484    push        ebx
 00723485    push        esi
 00723486    push        edi
 00723487    mov         edi,eax
 00723489    mov         eax,edi
 0072348B    call        TCollection.GetCount
 00723490    mov         ebx,eax
 00723492    dec         ebx
 00723493    test        ebx,ebx
>00723495    jl          007234AC
 00723497    inc         ebx
 00723498    xor         esi,esi
 0072349A    mov         edx,esi
 0072349C    mov         eax,edi
 0072349E    call        00723470
 007234A3    mov         edx,dword ptr [eax]
 007234A5    call        dword ptr [edx+20]
 007234A8    inc         esi
 007234A9    dec         ebx
>007234AA    jne         0072349A
 007234AC    pop         edi
 007234AD    pop         esi
 007234AE    pop         ebx
 007234AF    ret
*}
end;

//007234B0
procedure TJvStoredValues.RestoreValues;
begin
{*
 007234B0    push        ebx
 007234B1    push        esi
 007234B2    push        edi
 007234B3    mov         edi,eax
 007234B5    mov         eax,edi
 007234B7    call        TCollection.GetCount
 007234BC    mov         ebx,eax
 007234BE    dec         ebx
 007234BF    test        ebx,ebx
>007234C1    jl          007234D8
 007234C3    inc         ebx
 007234C4    xor         esi,esi
 007234C6    mov         edx,esi
 007234C8    mov         eax,edi
 007234CA    call        00723470
 007234CF    mov         edx,dword ptr [eax]
 007234D1    call        dword ptr [edx+24]
 007234D4    inc         esi
 007234D5    dec         ebx
>007234D6    jne         007234C6
 007234D8    pop         edi
 007234D9    pop         esi
 007234DA    pop         ebx
 007234DB    ret
*}
end;

//007234DC
{*procedure TJvFormStorage.GetStoredValuesPath(?:?);
begin
 007234DC    push        ebx
 007234DD    push        esi
 007234DE    mov         esi,edx
 007234E0    mov         ebx,eax
 007234E2    mov         eax,esi
 007234E4    mov         edx,dword ptr [ebx+0B4];TJvFormStorage.FStoredValues:TJvStoredValues
 007234EA    mov         edx,dword ptr [edx+20];TJvStoredValues.FPath:string
 007234ED    call        @UStrAsg
 007234F2    pop         esi
 007234F3    pop         ebx
 007234F4    ret
end;*}

//007234F8
procedure TJvFormStorage.SetStoredValuesPath(Value:string);
begin
{*
 007234F8    push        ebx
 007234F9    push        esi
 007234FA    mov         esi,edx
 007234FC    mov         ebx,eax
 007234FE    mov         eax,dword ptr [ebx+0B4];TJvFormStorage.FStoredValues:TJvStoredValues
 00723504    add         eax,20;TJvStoredValues.FPath:string
 00723507    mov         edx,esi
 00723509    call        @UStrAsg
 0072350E    pop         esi
 0072350F    pop         ebx
 00723510    ret
*}
end;

//00723514
{*procedure sub_00723514(?:TComponent; ?:?; ?:?);
begin
 00723514    push        ebp
 00723515    mov         ebp,esp
 00723517    push        0
 00723519    push        ebx
 0072351A    push        esi
 0072351B    mov         esi,edx
 0072351D    mov         ebx,eax
 0072351F    xor         eax,eax
 00723521    push        ebp
 00723522    push        723580
 00723527    push        dword ptr fs:[eax]
 0072352A    mov         dword ptr fs:[eax],esp
 0072352D    test        ebx,ebx
>0072352F    jne         0072353A
 00723531    mov         eax,esi
 00723533    call        @UStrClr
>00723538    jmp         0072356A
 0072353A    mov         eax,dword ptr [ebp+8]
 0072353D    push        eax
 0072353E    lea         edx,[ebp-4]
 00723541    mov         eax,dword ptr [ebx+4]
 00723544    call        00723514
 00723549    pop         ecx
 0072354A    cmp         dword ptr [ebp-4],0
>0072354E    je          0072355D
 00723550    lea         eax,[ebp-4]
 00723553    mov         edx,723598;'.'
 00723558    call        @UStrCat
 0072355D    mov         eax,esi
 0072355F    mov         ecx,dword ptr [ebx+8]
 00723562    mov         edx,dword ptr [ebp-4]
 00723565    call        @UStrCat3
 0072356A    xor         eax,eax
 0072356C    pop         edx
 0072356D    pop         ecx
 0072356E    pop         ecx
 0072356F    mov         dword ptr fs:[eax],edx
 00723572    push        723587
 00723577    lea         eax,[ebp-4]
 0072357A    call        @UStrClr
 0072357F    ret
>00723580    jmp         @HandleFinally
>00723585    jmp         00723577
 00723587    pop         esi
 00723588    pop         ebx
 00723589    pop         ecx
 0072358A    pop         ebp
 0072358B    ret
end;*}

//0072359C
procedure sub_0072359C(?:TJvFormPlacement);
begin
{*
 0072359C    push        ebp
 0072359D    mov         ebp,esp
 0072359F    push        0
 007235A1    push        ebx
 007235A2    push        esi
 007235A3    mov         ebx,eax
 007235A5    xor         eax,eax
 007235A7    push        ebp
 007235A8    push        72364C
 007235AD    push        dword ptr fs:[eax]
 007235B0    mov         dword ptr fs:[eax],esp
 007235B3    mov         ecx,1
 007235B8    mov         edx,dword ptr [ebx+40];TJvFormPlacement.FAppStoragePath:string
 007235BB    mov         eax,723664;'%FORM_NAME%'
 007235C0    call        00539170
 007235C5    test        eax,eax
>007235C7    je          00723636
 007235C9    cmp         dword ptr [ebx+4],0;TJvFormPlacement.FOwner:TComponent
>007235CD    je          00723636
 007235CF    mov         esi,dword ptr [ebx+4];TJvFormPlacement.FOwner:TComponent
 007235D2    mov         eax,esi
 007235D4    mov         edx,dword ptr ds:[4DF7D4];TCustomForm
 007235DA    call        @IsClass
 007235DF    test        al,al
>007235E1    je          007235FF
 007235E3    movzx       eax,byte ptr ds:[72367C];0x2 gvar_0072367C
 007235EA    push        eax
 007235EB    mov         ecx,dword ptr [esi+8];TComponent.FName:TComponentName
 007235EE    lea         eax,[ebx+40];TJvFormPlacement.FAppStoragePath:string
 007235F1    push        eax
 007235F2    mov         edx,723664;'%FORM_NAME%'
 007235F7    pop         eax
 007235F8    call        00538E34
>007235FD    jmp         00723636
 007235FF    mov         eax,esi
 00723601    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 00723607    call        @IsClass
 0072360C    test        al,al
>0072360E    je          00723636
 00723610    movzx       eax,byte ptr ds:[72367C];0x2 gvar_0072367C
 00723617    push        eax
 00723618    push        ebp
 00723619    lea         edx,[ebp-4]
 0072361C    mov         eax,esi
 0072361E    call        00723514
 00723623    pop         ecx
 00723624    mov         ecx,dword ptr [ebp-4]
 00723627    lea         eax,[ebx+40];TJvFormPlacement.FAppStoragePath:string
 0072362A    push        eax
 0072362B    mov         edx,723664;'%FORM_NAME%'
 00723630    pop         eax
 00723631    call        00538E34
 00723636    xor         eax,eax
 00723638    pop         edx
 00723639    pop         ecx
 0072363A    pop         ecx
 0072363B    mov         dword ptr fs:[eax],edx
 0072363E    push        723653
 00723643    lea         eax,[ebp-4]
 00723646    call        @UStrClr
 0072364B    ret
>0072364C    jmp         @HandleFinally
>00723651    jmp         00723643
 00723653    pop         esi
 00723654    pop         ebx
 00723655    pop         ecx
 00723656    pop         ebp
 00723657    ret
*}
end;

//00723680
procedure TJvFormPlacement.SetAppStorage(Value:TJvCustomAppStorage);
begin
{*
 00723680    lea         ecx,[eax+3C];TJvFormPlacement.FAppStorage:TJvCustomAppStorage
 00723683    call        0056D000
 00723688    ret
*}
end;

//0072368C
procedure TJvFormStorageStringList.Assign(Source:TPersistent);
begin
{*
 0072368C    push        ebx
 0072368D    mov         ebx,eax
 0072368F    mov         eax,ebx
 00723691    call        TStringList.Assign
 00723696    mov         eax,dword ptr [ebx+58];TJvFormStorageStringList........FFormStorage:TJvFormStorage
 00723699    test        byte ptr [eax+1C],1;TJvFormStorage.FComponentState:TComponentState
>0072369D    jne         007236AB
 0072369F    mov         eax,dword ptr [eax+4];TJvFormStorage.FOwner:TComponent
 007236A2    mov         cl,1
 007236A4    mov         edx,ebx
 007236A6    call        0071E988
 007236AB    pop         ebx
 007236AC    ret
*}
end;

//007236B0
constructor TJvFormStorageStringList.Create(AFormStorage:TJvFormStorage);
begin
{*
 007236B0    push        ebx
 007236B1    push        esi
 007236B2    push        edi
 007236B3    test        dl,dl
>007236B5    je          007236BF
 007236B7    add         esp,0FFFFFFF0
 007236BA    call        @ClassCreate
 007236BF    mov         esi,ecx
 007236C1    mov         ebx,edx
 007236C3    mov         edi,eax
 007236C5    xor         edx,edx
 007236C7    mov         eax,edi
 007236C9    call        TStringList.Create
 007236CE    mov         dword ptr [edi+58],esi;TJvFormStorageStringList.........FFormStorage:TJvFormStorage
 007236D1    mov         eax,edi
 007236D3    test        bl,bl
>007236D5    je          007236E6
 007236D7    call        @AfterConstruction
 007236DC    pop         dword ptr fs:[0]
 007236E3    add         esp,0C
 007236E6    mov         eax,edi
 007236E8    pop         edi
 007236E9    pop         esi
 007236EA    pop         ebx
 007236EB    ret
*}
end;

//007236EC
procedure TJvFormStorageStringList.LoadFromStream(Stream:TStream);
begin
{*
 007236EC    push        ebx
 007236ED    mov         ebx,eax
 007236EF    mov         eax,ebx
 007236F1    call        TStrings.LoadFromStream
 007236F6    mov         eax,dword ptr [ebx+58];TJvFormStorageStringList..........FFormStorage:TJvFormStorage
 007236F9    test        byte ptr [eax+1C],1;TJvFormStorage.FComponentState:TComponentState
>007236FD    jne         0072370B
 007236FF    mov         eax,dword ptr [eax+4];TJvFormStorage.FOwner:TComponent
 00723702    mov         cl,1
 00723704    mov         edx,ebx
 00723706    call        0071E988
 0072370B    pop         ebx
 0072370C    ret
*}
end;

//007249BC
constructor TJvMRUManager.Create(AOwner:TComponent);
begin
{*
 007249BC    push        ebp
 007249BD    mov         ebp,esp
 007249BF    push        ecx
 007249C0    push        ebx
 007249C1    push        esi
 007249C2    test        dl,dl
>007249C4    je          007249CE
 007249C6    add         esp,0FFFFFFF0
 007249C9    call        @ClassCreate
 007249CE    mov         byte ptr [ebp-1],dl
 007249D1    mov         ebx,eax
 007249D3    xor         edx,edx
 007249D5    mov         eax,ebx
 007249D7    call        TComponent.Create
 007249DC    mov         dl,1
 007249DE    mov         eax,[00723C54];TJvRecentStrings
 007249E3    call        TJvRecentStrings.Create;TJvRecentStrings.Create
 007249E8    mov         dword ptr [ebx+38],eax;TJvMRUManager.FStrings:TJvRecentStrings
 007249EB    mov         dl,1
 007249ED    mov         eax,[00439644];TList
 007249F2    call        TObject.Create;TList.Create
 007249F7    mov         dword ptr [ebx+3C],eax;TJvMRUManager.FItems:TList
 007249FA    mov         eax,dword ptr [ebx+38];TJvMRUManager.FStrings:TJvRecentStrings
 007249FD    mov         dword ptr [eax+44],ebx;TJvRecentStrings.?f44:TJvMRUManager
 00724A00    mov         dword ptr [eax+40],72526C;TJvRecentStrings.FOnChange:TNotifyEvent sub_0072526C
 00724A07    mov         dl,1
 00724A09    mov         eax,[00720A24];TJvIniLink
 00724A0E    call        TObject.Create;TJvIniLink.Create
 00724A13    mov         esi,eax
 00724A15    mov         dword ptr [ebx+40],esi;TJvMRUManager.FIniLink:TJvIniLink
 00724A18    mov         dword ptr [esi+0C],ebx;TJvIniLink.?fC:TJvMRUManager
 00724A1B    mov         dword ptr [esi+8],72528C;TJvIniLink.FOnSave:TNotifyEvent sub_0072528C
 00724A22    mov         dword ptr [esi+14],ebx;TJvIniLink.?f14:TJvMRUManager
 00724A25    mov         dword ptr [esi+10],7252E8;TJvIniLink.FOnLoad:TNotifyEvent sub_007252E8
 00724A2C    mov         byte ptr [ebx+47],1;TJvMRUManager.FAutoUpdate:Boolean
 00724A30    mov         byte ptr [ebx+46],1;TJvMRUManager.FAutoEnable:Boolean
 00724A34    mov         byte ptr [ebx+48],1;TJvMRUManager.FShowAccelChar:Boolean
 00724A38    mov         dword ptr [ebx+4C],1;TJvMRUManager.FStartAccel:Cardinal
 00724A3F    mov         byte ptr [ebx+0A1],0;TJvMRUManager.FMenuLocation:TMenuLocation
 00724A46    mov         eax,ebx
 00724A48    cmp         byte ptr [ebp-1],0
>00724A4C    je          00724A5D
 00724A4E    call        @AfterConstruction
 00724A53    pop         dword ptr fs:[0]
 00724A5A    add         esp,0C
 00724A5D    mov         eax,ebx
 00724A5F    pop         esi
 00724A60    pop         ebx
 00724A61    pop         ecx
 00724A62    pop         ebp
 00724A63    ret
*}
end;

//00724A64
destructor TJvMRUManager.Destroy();
begin
{*
 00724A64    push        ebx
 00724A65    push        esi
 00724A66    call        @BeforeDestruction
 00724A6B    mov         ebx,edx
 00724A6D    mov         esi,eax
 00724A6F    mov         eax,esi
 00724A71    call        007251D4
 00724A76    mov         eax,dword ptr [esi+40];TJvMRUManager.FIniLink:TJvIniLink
 00724A79    call        TObject.Free
 00724A7E    mov         eax,dword ptr [esi+38];TJvMRUManager.FStrings:TJvRecentStrings
 00724A81    xor         edx,edx
 00724A83    mov         dword ptr [eax+40],edx;TJvRecentStrings.FOnChange:TNotifyEvent
 00724A86    mov         dword ptr [eax+44],edx;TJvRecentStrings.?f44:TJvMRUManager
 00724A89    call        TObject.Free
 00724A8E    lea         eax,[esi+3C];TJvMRUManager.FItems:TList
 00724A91    call        FreeAndNil
 00724A96    lea         eax,[esi+0A8];TJvMRUManager.FCanvas:TCanvas
 00724A9C    call        FreeAndNil
 00724AA1    mov         edx,ebx
 00724AA3    and         dl,0FC
 00724AA6    mov         eax,esi
 00724AA8    call        TComponent.Destroy
 00724AAD    test        bl,bl
>00724AAF    jle         00724AB8
 00724AB1    mov         eax,esi
 00724AB3    call        @ClassDestroy
 00724AB8    pop         esi
 00724AB9    pop         ebx
 00724ABA    ret
*}
end;

//00724ABC
procedure TJvMRUManager.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00724ABC    push        ebx
 00724ABD    push        esi
 00724ABE    push        edi
 00724ABF    mov         ebx,ecx
 00724AC1    mov         esi,edx
 00724AC3    mov         edi,eax
 00724AC5    mov         ecx,ebx
 00724AC7    mov         edx,esi
 00724AC9    mov         eax,edi
 00724ACB    call        TComponent.Notification
 00724AD0    cmp         esi,dword ptr [edi+54];TJvMRUManager.FRecentMenu:TMenuItem
>00724AD3    jne         00724AE3
 00724AD5    cmp         bl,1
>00724AD8    jne         00724AE3
 00724ADA    xor         edx,edx
 00724ADC    mov         eax,edi
 00724ADE    call        TJvMRUManager.SetRecentMenu
 00724AE3    pop         edi
 00724AE4    pop         esi
 00724AE5    pop         ebx
 00724AE6    ret
*}
end;

//00724AE8
{*function sub_00724AE8(?:TJvMRUManager):?;
begin
 00724AE8    mov         eax,dword ptr [eax+38]
 00724AEB    ret
end;*}

//00724AEC
{*procedure TJvMRUManager.sub_00724AEC(?:?; ?:?);
begin
 00724AEC    push        ebp
 00724AED    mov         ebp,esp
 00724AEF    push        ebx
 00724AF0    cmp         word ptr [eax+62],0;TJvMRUManager.?f62:word
>00724AF5    je          00724B08
 00724AF7    push        ecx
 00724AF8    mov         ecx,dword ptr [ebp+8]
 00724AFB    push        ecx
 00724AFC    mov         ecx,edx
 00724AFE    mov         ebx,eax
 00724B00    mov         edx,eax
 00724B02    mov         eax,dword ptr [ebx+64];TJvMRUManager.?f64:dword
 00724B05    call        dword ptr [ebx+60];TJvMRUManager.FOnGetItem
 00724B08    pop         ebx
 00724B09    pop         ebp
 00724B0A    ret         4
end;*}

//00724B10
{*procedure TJvMRUManager.sub_00724B10(?:?; ?:?);
begin
 00724B10    push        ebp
 00724B11    mov         ebp,esp
 00724B13    push        ebx
 00724B14    cmp         word ptr [eax+6A],0;TJvMRUManager.?f6A:word
>00724B19    je          00724B2C
 00724B1B    push        ecx
 00724B1C    mov         ecx,dword ptr [ebp+8]
 00724B1F    push        ecx
 00724B20    mov         ebx,eax
 00724B22    mov         ecx,edx
 00724B24    mov         edx,eax
 00724B26    mov         eax,dword ptr [ebx+6C];TJvMRUManager.?f6C:dword
 00724B29    call        dword ptr [ebx+68];TJvMRUManager.FOnClick
 00724B2C    pop         ebx
 00724B2D    pop         ebp
 00724B2E    ret         4
end;*}

//00724C3C
{*function TJvMRUManager.GetCapacity:?;
begin
 00724C3C    mov         eax,dword ptr [eax+38];TJvMRUManager.FStrings:TJvRecentStrings
 00724C3F    mov         eax,dword ptr [eax+58];TJvRecentStrings.FMaxSize:Integer
 00724C42    ret
end;*}

//00724C44
procedure TJvMRUManager.SetCapacity(Value:Integer);
begin
{*
 00724C44    mov         eax,dword ptr [eax+38];TJvMRUManager.FStrings:TJvRecentStrings
 00724C47    call        00725AEC
 00724C4C    ret
*}
end;

//00724C50
{*function TJvMRUManager.GetMode:?;
begin
 00724C50    mov         eax,dword ptr [eax+38];TJvMRUManager.FStrings:TJvRecentStrings
 00724C53    movzx       eax,byte ptr [eax+5C];TJvRecentStrings.FMode:TRecentMode
 00724C57    ret
end;*}

//00724C58
procedure TJvMRUManager.SetMode(Value:TRecentMode);
begin
{*
 00724C58    mov         eax,dword ptr [eax+38];TJvMRUManager.FStrings:TJvRecentStrings
 00724C5B    mov         byte ptr [eax+5C],dl;TJvRecentStrings.FMode:TRecentMode
 00724C5E    ret
*}
end;

//00724C60
{*function TJvMRUManager.GetIniStorage:?;
begin
 00724C60    mov         eax,dword ptr [eax+40];TJvMRUManager.FIniLink:TJvIniLink
 00724C63    mov         eax,dword ptr [eax+4];TJvIniLink.FStorage:TJvFormPlacement
 00724C66    ret
end;*}

//00724C68
procedure TJvMRUManager.SetIniStorage(Value:TJvFormPlacement);
begin
{*
 00724C68    mov         eax,dword ptr [eax+40];TJvMRUManager.FIniLink:TJvIniLink
 00724C6B    call        00722DA4
 00724C70    ret
*}
end;

//00724C74
procedure TJvMRUManager.SetAutoEnable(Value:Boolean);
begin
{*
 00724C74    push        ebx
 00724C75    push        esi
 00724C76    mov         ebx,eax
 00724C78    cmp         dl,byte ptr [ebx+46];TJvMRUManager.FAutoEnable:Boolean
>00724C7B    je          00724CA8
 00724C7D    mov         eax,edx
 00724C7F    mov         byte ptr [ebx+46],al;TJvMRUManager.FAutoEnable:Boolean
 00724C82    mov         esi,dword ptr [ebx+54];TJvMRUManager.FRecentMenu:TMenuItem
 00724C85    test        esi,esi
>00724C87    je          00724CA8
 00724C89    test        al,al
>00724C8B    je          00724C9F
 00724C8D    mov         eax,ebx
 00724C8F    call        TJvMRUManager.IsMenuEnabled
 00724C94    mov         edx,eax
 00724C96    mov         eax,esi
 00724C98    call        TMenuItem.SetEnabled
>00724C9D    jmp         00724CA8
 00724C9F    mov         dl,1
 00724CA1    mov         eax,esi
 00724CA3    call        TMenuItem.SetEnabled
 00724CA8    pop         esi
 00724CA9    pop         ebx
 00724CAA    ret
*}
end;

//00724CAC
procedure TJvMRUManager.SetStartAccel(Value:Cardinal);
begin
{*
 00724CAC    cmp         edx,dword ptr [eax+4C];TJvMRUManager.FStartAccel:Cardinal
>00724CAF    je          00724CBF
 00724CB1    mov         dword ptr [eax+4C],edx;TJvMRUManager.FStartAccel:Cardinal
 00724CB4    cmp         byte ptr [eax+47],0;TJvMRUManager.FAutoUpdate:Boolean
>00724CB8    je          00724CBF
 00724CBA    call        TJvMRUManager.UpdateRecentMenu
 00724CBF    ret
*}
end;

//00724CC0
procedure TJvMRUManager.SetAccelDelimiter(Value:TAccelDelimiter);
begin
{*
 00724CC0    cmp         dl,byte ptr [eax+50];TJvMRUManager.FAccelDelimiter:TAccelDelimiter
>00724CC3    je          00724CD9
 00724CC5    mov         byte ptr [eax+50],dl;TJvMRUManager.FAccelDelimiter:TAccelDelimiter
 00724CC8    cmp         byte ptr [eax+47],0;TJvMRUManager.FAutoUpdate:Boolean
>00724CCC    je          00724CD9
 00724CCE    cmp         byte ptr [eax+48],0;TJvMRUManager.FShowAccelChar:Boolean
>00724CD2    je          00724CD9
 00724CD4    call        TJvMRUManager.UpdateRecentMenu
 00724CD9    ret
*}
end;

//00724CDC
procedure TJvMRUManager.SetShowAccelChar(Value:Boolean);
begin
{*
 00724CDC    cmp         dl,byte ptr [eax+48];TJvMRUManager.FShowAccelChar:Boolean
>00724CDF    je          00724CEF
 00724CE1    mov         byte ptr [eax+48],dl;TJvMRUManager.FShowAccelChar:Boolean
 00724CE4    cmp         byte ptr [eax+47],0;TJvMRUManager.FAutoUpdate:Boolean
>00724CE8    je          00724CEF
 00724CEA    call        TJvMRUManager.UpdateRecentMenu
 00724CEF    ret
*}
end;

//00724CF0
procedure TJvMRUManager.Add(RecentName:string; UserData:Integer);
begin
{*
 00724CF0    push        ebx
 00724CF1    push        esi
 00724CF2    push        edi
 00724CF3    mov         edi,ecx
 00724CF5    mov         esi,edx
 00724CF7    mov         ebx,eax
 00724CF9    cmp         byte ptr [ebx+0A0],1;TJvMRUManager.FDuplicates:TDuplicates
>00724D00    je          00724D35
 00724D02    mov         eax,ebx
 00724D04    call        00724AE8
 00724D09    mov         edx,esi
 00724D0B    mov         ecx,dword ptr [eax]
 00724D0D    call        dword ptr [ecx+54]
 00724D10    inc         eax
>00724D11    jle         00724D35
 00724D13    cmp         byte ptr [ebx+0A0],2;TJvMRUManager.FDuplicates:TDuplicates
>00724D1A    jne         00724D51
 00724D1C    mov         ecx,dword ptr ds:[78D7AC];^SResString331:TResStringRec
 00724D22    mov         dl,1
 00724D24    mov         eax,[0052C464];EJVCLException
 00724D29    call        Exception.CreateRes;EJVCLException.Create
 00724D2E    call        @RaiseExcept
>00724D33    jmp         00724D51
 00724D35    mov         edx,esi
 00724D37    mov         eax,dword ptr [ebx+38];TJvMRUManager.FStrings:TJvRecentStrings
 00724D3A    mov         ecx,dword ptr [eax]
 00724D3C    call        dword ptr [ecx+38];TJvRecentStrings.Add
 00724D3F    mov         esi,eax
 00724D41    mov         eax,ebx
 00724D43    call        00724AE8
 00724D48    mov         ecx,edi
 00724D4A    mov         edx,esi
 00724D4C    mov         ebx,dword ptr [eax]
 00724D4E    call        dword ptr [ebx+24]
 00724D51    pop         edi
 00724D52    pop         esi
 00724D53    pop         ebx
 00724D54    ret
*}
end;

//00724D58
procedure TJvMRUManager.Clear;
begin
{*
 00724D58    push        esi
 00724D59    mov         esi,eax
 00724D5B    mov         eax,esi
 00724D5D    call        00724AE8
 00724D62    mov         edx,dword ptr [eax]
 00724D64    call        dword ptr [edx+44]
 00724D67    pop         esi
 00724D68    ret
*}
end;

//00724D6C
procedure TJvMRUManager.Remove(RecentName:string);
begin
{*
 00724D6C    mov         eax,dword ptr [eax+38];TJvMRUManager.FStrings:TJvRecentStrings
 00724D6F    call        TJvRecentStrings.Remove
 00724D74    ret
*}
end;

//00724D78
procedure sub_00724D78(?:TJvMRUManager; ?:TMenuItem);
begin
{*
 00724D78    push        ebx
 00724D79    push        esi
 00724D7A    push        edi
 00724D7B    mov         edi,edx
 00724D7D    mov         ebx,eax
 00724D7F    test        edi,edi
>00724D81    je          00724DEA
 00724D83    cmp         byte ptr [ebx+0A1],1
>00724D8A    jne         00724DD6
 00724D8C    mov         eax,dword ptr [ebx+54]
 00724D8F    mov         si,0FFF1
 00724D93    call        @CallDynaInst
 00724D98    test        al,al
>00724D9A    je          00724DCA
 00724D9C    mov         eax,dword ptr [ebx+54]
 00724D9F    mov         eax,dword ptr [eax+64]
 00724DA2    call        TMenuItem.GetMenuIndex
 00724DA7    test        eax,eax
>00724DA9    jl          00724DCA
 00724DAB    mov         esi,dword ptr [ebx+54]
 00724DAE    mov         eax,esi
 00724DB0    call        TMenuItem.GetMenuIndex
 00724DB5    mov         edx,eax
 00724DB7    mov         eax,dword ptr [ebx+3C]
 00724DBA    add         edx,dword ptr [eax+8]
 00724DBD    inc         edx
 00724DBE    mov         eax,dword ptr [esi+64]
 00724DC1    mov         ecx,edi
 00724DC3    call        TMenuItem.Insert
>00724DC8    jmp         00724DE0
 00724DCA    mov         edx,edi
 00724DCC    mov         eax,dword ptr [ebx+54]
 00724DCF    call        TMenuItem.Add
>00724DD4    jmp         00724DE0
 00724DD6    mov         edx,edi
 00724DD8    mov         eax,dword ptr [ebx+54]
 00724DDB    call        TMenuItem.Add
 00724DE0    mov         edx,edi
 00724DE2    mov         eax,dword ptr [ebx+3C]
 00724DE5    call        TList.Add
 00724DEA    pop         edi
 00724DEB    pop         esi
 00724DEC    pop         ebx
 00724DED    ret
*}
end;

//00724DF0
procedure sub_00724DF0(?:TJvMRUManager);
begin
{*
 00724DF0    push        ebp
 00724DF1    mov         ebp,esp
 00724DF3    add         esp,0FFFFFFF0
 00724DF6    push        ebx
 00724DF7    push        esi
 00724DF8    push        edi
 00724DF9    xor         edx,edx
 00724DFB    mov         dword ptr [ebp-10],edx
 00724DFE    mov         dword ptr [ebp-0C],edx
 00724E01    mov         dword ptr [ebp-4],eax
 00724E04    xor         eax,eax
 00724E06    push        ebp
 00724E07    push        724EFB
 00724E0C    push        dword ptr fs:[eax]
 00724E0F    mov         dword ptr fs:[eax],esp
 00724E12    mov         eax,dword ptr [ebp-4]
 00724E15    cmp         byte ptr [eax+0A0],1
>00724E1C    je          00724EE0
 00724E22    mov         eax,dword ptr [ebp-4]
 00724E25    movzx       eax,byte ptr [eax+47]
 00724E29    mov         byte ptr [ebp-5],al
 00724E2C    xor         eax,eax
 00724E2E    push        ebp
 00724E2F    push        724ED9
 00724E34    push        dword ptr fs:[eax]
 00724E37    mov         dword ptr fs:[eax],esp
 00724E3A    mov         eax,dword ptr [ebp-4]
 00724E3D    mov         byte ptr [eax+47],0
 00724E41    mov         eax,dword ptr [ebp-4]
 00724E44    call        00724AE8
 00724E49    mov         edx,dword ptr [eax]
 00724E4B    call        dword ptr [edx+14]
 00724E4E    mov         edi,eax
 00724E50    dec         edi
 00724E51    test        edi,edi
>00724E53    jl          00724EC1
 00724E55    mov         eax,dword ptr [ebp-4]
 00724E58    call        00724AE8
 00724E5D    lea         ecx,[ebp-0C]
 00724E60    mov         edx,edi
 00724E62    mov         ebx,dword ptr [eax]
 00724E64    call        dword ptr [ebx+0C]
 00724E67    mov         eax,dword ptr [ebp-0C]
 00724E6A    push        eax
 00724E6B    mov         eax,dword ptr [ebp-4]
 00724E6E    call        00724AE8
 00724E73    pop         edx
 00724E74    mov         ecx,dword ptr [eax]
 00724E76    call        dword ptr [ecx+54]
 00724E79    mov         esi,eax
>00724E7B    jmp         00724EB3
 00724E7D    mov         eax,dword ptr [ebp-4]
 00724E80    call        00724AE8
 00724E85    mov         edx,esi
 00724E87    mov         ecx,dword ptr [eax]
 00724E89    call        dword ptr [ecx+48]
 00724E8C    dec         edi
 00724E8D    mov         eax,dword ptr [ebp-4]
 00724E90    call        00724AE8
 00724E95    lea         ecx,[ebp-10]
 00724E98    mov         edx,edi
 00724E9A    mov         ebx,dword ptr [eax]
 00724E9C    call        dword ptr [ebx+0C]
 00724E9F    mov         eax,dword ptr [ebp-10]
 00724EA2    push        eax
 00724EA3    mov         eax,dword ptr [ebp-4]
 00724EA6    call        00724AE8
 00724EAB    pop         edx
 00724EAC    mov         ecx,dword ptr [eax]
 00724EAE    call        dword ptr [ecx+54]
 00724EB1    mov         esi,eax
 00724EB3    cmp         esi,0FFFFFFFF
>00724EB6    jle         00724EBC
 00724EB8    cmp         edi,esi
>00724EBA    jne         00724E7D
 00724EBC    dec         edi
 00724EBD    test        edi,edi
>00724EBF    jge         00724E55
 00724EC1    xor         eax,eax
 00724EC3    pop         edx
 00724EC4    pop         ecx
 00724EC5    pop         ecx
 00724EC6    mov         dword ptr fs:[eax],edx
 00724EC9    push        724EE0
 00724ECE    mov         eax,dword ptr [ebp-4]
 00724ED1    movzx       edx,byte ptr [ebp-5]
 00724ED5    mov         byte ptr [eax+47],dl
 00724ED8    ret
>00724ED9    jmp         @HandleFinally
>00724EDE    jmp         00724ECE
 00724EE0    xor         eax,eax
 00724EE2    pop         edx
 00724EE3    pop         ecx
 00724EE4    pop         ecx
 00724EE5    mov         dword ptr fs:[eax],edx
 00724EE8    push        724F02
 00724EED    lea         eax,[ebp-10]
 00724EF0    mov         edx,2
 00724EF5    call        @UStrArrayClr
 00724EFA    ret
>00724EFB    jmp         @HandleFinally
>00724F00    jmp         00724EED
 00724F02    pop         edi
 00724F03    pop         esi
 00724F04    pop         ebx
 00724F05    mov         esp,ebp
 00724F07    pop         ebp
 00724F08    ret
*}
end;

//00724F0C
procedure TJvMRUManager.UpdateRecentMenu;
begin
{*
 00724F0C    push        ebp
 00724F0D    mov         ebp,esp
 00724F0F    mov         ecx,6
 00724F14    push        0
 00724F16    push        0
 00724F18    dec         ecx
>00724F19    jne         00724F14
 00724F1B    push        ecx
 00724F1C    push        ebx
 00724F1D    push        esi
 00724F1E    push        edi
 00724F1F    mov         edi,eax
 00724F21    xor         eax,eax
 00724F23    push        ebp
 00724F24    push        7251A6
 00724F29    push        dword ptr fs:[eax]
 00724F2C    mov         dword ptr fs:[eax],esp
 00724F2F    mov         eax,edi
 00724F31    call        007251D4
 00724F36    mov         eax,edi
 00724F38    call        00724DF0
 00724F3D    mov         eax,edi
 00724F3F    mov         edx,dword ptr [eax]
 00724F41    call        dword ptr [edx+34];TJvMRUManager.sub_00725944
 00724F44    cmp         dword ptr [edi+54],0;TJvMRUManager.FRecentMenu:TMenuItem
>00724F48    je          0072517E
 00724F4E    mov         eax,edi
 00724F50    call        00724AE8
 00724F55    mov         edx,dword ptr [eax]
 00724F57    call        dword ptr [edx+14]
 00724F5A    test        eax,eax
>00724F5C    jle         00724F81
 00724F5E    mov         eax,dword ptr [edi+54];TJvMRUManager.FRecentMenu:TMenuItem
 00724F61    call        TMenuItem.GetCount
 00724F66    test        eax,eax
>00724F68    jle         00724F81
 00724F6A    cmp         byte ptr [edi+0A1],0;TJvMRUManager.FMenuLocation:TMenuLocation
>00724F71    jne         00724F81
 00724F73    call        NewLine
 00724F78    mov         edx,eax
 00724F7A    mov         eax,edi
 00724F7C    call        00724D78
 00724F81    mov         eax,edi
 00724F83    call        00724AE8
 00724F88    mov         edx,dword ptr [eax]
 00724F8A    call        dword ptr [edx+14]
 00724F8D    dec         eax
 00724F8E    test        eax,eax
>00724F90    jl          00725160
 00724F96    inc         eax
 00724F97    mov         dword ptr [ebp-14],eax
 00724F9A    mov         dword ptr [ebp-0C],0
 00724FA1    movzx       ecx,word ptr [edi+44];TJvMRUManager.FSeparateSize:word
 00724FA5    test        cx,cx
>00724FA8    jbe         00724FD1
 00724FAA    cmp         dword ptr [ebp-0C],0
>00724FAE    jle         00724FD1
 00724FB0    movzx       eax,cx
 00724FB3    push        eax
 00724FB4    mov         eax,dword ptr [ebp-0C]
 00724FB7    pop         edx
 00724FB8    mov         ecx,edx
 00724FBA    cdq
 00724FBB    idiv        eax,ecx
 00724FBD    test        edx,edx
>00724FBF    jne         00724FD1
 00724FC1    call        NewLine
 00724FC6    mov         edx,eax
 00724FC8    mov         eax,edi
 00724FCA    call        00724D78
>00724FCF    jmp         00724FFA
 00724FD1    cmp         dword ptr [ebp-0C],0
>00724FD5    jne         00724FFA
 00724FD7    cmp         byte ptr [edi+0A1],1;TJvMRUManager.FMenuLocation:TMenuLocation
>00724FDE    jne         00724FFA
 00724FE0    mov         eax,dword ptr [edi+54];TJvMRUManager.FRecentMenu:TMenuItem
 00724FE3    call        TMenuItem.GetCount
 00724FE8    test        eax,eax
>00724FEA    jne         00724FFA
 00724FEC    call        NewLine
 00724FF1    mov         edx,eax
 00724FF3    mov         eax,edi
 00724FF5    call        00724D78
 00724FFA    mov         eax,edi
 00724FFC    call        00724AE8
 00725001    lea         ecx,[ebp-4]
 00725004    mov         edx,dword ptr [ebp-0C]
 00725007    mov         ebx,dword ptr [eax]
 00725009    call        dword ptr [ebx+0C]
 0072500C    mov         word ptr [ebp-0E],0
 00725012    mov         eax,edi
 00725014    call        00724AE8
 00725019    mov         edx,dword ptr [ebp-0C]
 0072501C    mov         ecx,dword ptr [eax]
 0072501E    call        dword ptr [ecx+18]
 00725021    push        eax
 00725022    lea         ecx,[ebp-0E]
 00725025    lea         edx,[ebp-4]
 00725028    mov         eax,edi
 0072502A    mov         si,0FFED
 0072502E    call        @CallDynaInst;TJvMRUManager.sub_00724AEC
 00725033    push        1
 00725035    push        edi
 00725036    push        724B34
 0072503B    push        0
 0072503D    push        0
 0072503F    lea         edx,[ebp-18]
 00725042    mov         eax,dword ptr [ebp-4]
 00725045    call        GetShortHint
 0072504A    mov         eax,dword ptr [ebp-18]
 0072504D    xor         ecx,ecx
 0072504F    movzx       edx,word ptr [ebp-0E]
 00725053    call        NewItem
 00725058    mov         esi,eax
 0072505A    lea         edx,[ebp-1C]
 0072505D    mov         eax,dword ptr [ebp-4]
 00725060    call        GetLongHint
 00725065    mov         edx,dword ptr [ebp-1C]
 00725068    lea         eax,[esi+58];TMenuItem.FHint:string
 0072506B    call        @UStrAsg
 00725070    cmp         byte ptr [edi+48],0;TJvMRUManager.FShowAccelChar:Boolean
>00725074    je          0072511E
 0072507A    mov         ebx,dword ptr [ebp-0C]
 0072507D    add         ebx,dword ptr [edi+4C];TJvMRUManager.FStartAccel:Cardinal
 00725080    cmp         ebx,0A
>00725083    jae         007250A5
 00725085    lea         eax,[ebp-20]
 00725088    mov         edx,ebx
 0072508A    add         dx,30
 0072508E    call        @UStrFromWChar
 00725093    mov         ecx,dword ptr [ebp-20]
 00725096    lea         eax,[ebp-8]
 00725099    mov         edx,7251C0;'&'
 0072509E    call        @UStrCat3
>007250A3    jmp         007250DB
 007250A5    cmp         ebx,64
>007250A8    ja          007250CE
 007250AA    lea         eax,[ebp-24]
 007250AD    mov         edx,ebx
 007250AF    add         dx,41
 007250B3    sub         dx,0A
 007250B7    call        @UStrFromWChar
 007250BC    mov         ecx,dword ptr [ebp-24]
 007250BF    lea         eax,[ebp-8]
 007250C2    mov         edx,7251C0;'&'
 007250C7    call        @UStrCat3
>007250CC    jmp         007250DB
 007250CE    lea         eax,[ebp-8]
 007250D1    mov         edx,7251D0;' '
 007250D6    call        @UStrLAsg
 007250DB    push        dword ptr [ebp-8]
 007250DE    lea         eax,[ebp-2C]
 007250E1    movzx       edx,byte ptr [edi+50];TJvMRUManager.FAccelDelimiter:TAccelDelimiter
 007250E5    movzx       edx,word ptr [edx*2+78C578]
 007250ED    call        @UStrFromWChar
 007250F2    push        dword ptr [ebp-2C]
 007250F5    lea         ecx,[ebp-30]
 007250F8    mov         edx,dword ptr [ebp-4]
 007250FB    mov         eax,edi
 007250FD    call        00725E50
 00725102    push        dword ptr [ebp-30]
 00725105    lea         eax,[ebp-28]
 00725108    mov         edx,3
 0072510D    call        @UStrCatN
 00725112    mov         edx,dword ptr [ebp-28]
 00725115    mov         eax,esi
 00725117    call        TMenuItem.SetCaption
>0072511C    jmp         00725135
 0072511E    lea         ecx,[ebp-34]
 00725121    mov         edx,dword ptr [ebp-4]
 00725124    mov         eax,edi
 00725126    call        00725E50
 0072512B    mov         edx,dword ptr [ebp-34]
 0072512E    mov         eax,esi
 00725130    call        TMenuItem.SetCaption
 00725135    mov         eax,dword ptr [ebp-0C]
 00725138    mov         dword ptr [esi+0C],eax;TMenuItem.FTag:Integer
 0072513B    mov         edx,esi
 0072513D    mov         eax,edi
 0072513F    call        00724D78
 00725144    mov         ecx,dword ptr [ebp-0C]
 00725147    mov         edx,esi
 00725149    mov         eax,edi
 0072514B    mov         si,0FFEB
 0072514F    call        @CallDynaInst;TJvMRUManager.sub_00725A04
 00725154    inc         dword ptr [ebp-0C]
 00725157    dec         dword ptr [ebp-14]
>0072515A    jne         00724FA1
 00725160    mov         eax,edi
 00725162    mov         edx,dword ptr [eax]
 00725164    call        dword ptr [edx+38];TJvMRUManager.sub_00725924
 00725167    cmp         byte ptr [edi+46],0;TJvMRUManager.FAutoEnable:Boolean
>0072516B    je          0072517E
 0072516D    mov         eax,edi
 0072516F    call        TJvMRUManager.IsMenuEnabled
 00725174    mov         edx,eax
 00725176    mov         eax,dword ptr [edi+54];TJvMRUManager.FRecentMenu:TMenuItem
 00725179    call        TMenuItem.SetEnabled
 0072517E    xor         eax,eax
 00725180    pop         edx
 00725181    pop         ecx
 00725182    pop         ecx
 00725183    mov         dword ptr fs:[eax],edx
 00725186    push        7251AD
 0072518B    lea         eax,[ebp-34]
 0072518E    mov         edx,8
 00725193    call        @UStrArrayClr
 00725198    lea         eax,[ebp-8]
 0072519B    mov         edx,2
 007251A0    call        @UStrArrayClr
 007251A5    ret
>007251A6    jmp         @HandleFinally
>007251AB    jmp         0072518B
 007251AD    pop         edi
 007251AE    pop         esi
 007251AF    pop         ebx
 007251B0    mov         esp,ebp
 007251B2    pop         ebp
 007251B3    ret
*}
end;

//007251D4
procedure sub_007251D4(?:TJvMRUManager);
begin
{*
 007251D4    push        ebx
 007251D5    push        esi
 007251D6    push        edi
 007251D7    mov         ebx,eax
>007251D9    jmp         007251F7
 007251DB    xor         edx,edx
 007251DD    mov         eax,edi
 007251DF    call        TList.Get
 007251E4    mov         esi,eax
 007251E6    mov         edx,esi
 007251E8    mov         eax,dword ptr [ebx+3C];TJvMRUManager.FItems:TList
 007251EB    call        TList.Remove
 007251F0    mov         eax,esi
 007251F2    call        TObject.Free
 007251F7    mov         edi,dword ptr [ebx+3C];TJvMRUManager.FItems:TList
 007251FA    cmp         dword ptr [edi+8],0;TList.FCount:Integer
>007251FE    jg          007251DB
 00725200    mov         esi,dword ptr [ebx+54];TJvMRUManager.FRecentMenu:TMenuItem
 00725203    test        esi,esi
>00725205    je          0072521D
 00725207    cmp         byte ptr [ebx+46],0;TJvMRUManager.FAutoEnable:Boolean
>0072520B    je          0072521D
 0072520D    mov         eax,ebx
 0072520F    call        TJvMRUManager.IsMenuEnabled
 00725214    mov         edx,eax
 00725216    mov         eax,esi
 00725218    call        TMenuItem.SetEnabled
 0072521D    pop         edi
 0072521E    pop         esi
 0072521F    pop         ebx
 00725220    ret
*}
end;

//00725224
procedure TJvMRUManager.SetRecentMenu(Value:TMenuItem);
begin
{*
 00725224    push        ebx
 00725225    push        esi
 00725226    mov         esi,edx
 00725228    mov         ebx,eax
 0072522A    mov         eax,ebx
 0072522C    call        007251D4
 00725231    lea         ecx,[ebx+54];TJvMRUManager.FRecentMenu:TMenuItem
 00725234    mov         edx,esi
 00725236    mov         eax,ebx
 00725238    call        0056D000
 0072523D    lea         eax,[ebx+0A8];TJvMRUManager.FCanvas:TCanvas
 00725243    call        FreeAndNil
 00725248    mov         eax,ebx
 0072524A    call        TJvMRUManager.UpdateRecentMenu
 0072524F    pop         esi
 00725250    pop         ebx
 00725251    ret
*}
end;

//00725254
procedure TJvMRUManager.SetSeparateSize(Value:Word);
begin
{*
 00725254    cmp         dx,word ptr [eax+44];TJvMRUManager.FSeparateSize:word
>00725258    je          00725269
 0072525A    mov         word ptr [eax+44],dx;TJvMRUManager.FSeparateSize:word
 0072525E    cmp         byte ptr [eax+47],0;TJvMRUManager.FAutoUpdate:Boolean
>00725262    je          00725269
 00725264    call        TJvMRUManager.UpdateRecentMenu
 00725269    ret
*}
end;

//0072526C
{*procedure sub_0072526C(?:?);
begin
 0072526C    push        ebx
 0072526D    push        esi
 0072526E    mov         ebx,eax
 00725270    mov         eax,ebx
 00725272    mov         si,0FFF0
 00725276    call        @CallDynaInst
 0072527B    cmp         byte ptr [ebx+47],0
>0072527F    je          00725288
 00725281    mov         eax,ebx
 00725283    call        TJvMRUManager.UpdateRecentMenu
 00725288    pop         esi
 00725289    pop         ebx
 0072528A    ret
end;*}

//0072528C
procedure sub_0072528C(?:TJvMRUManager);
begin
{*
 0072528C    push        ebp
 0072528D    mov         ebp,esp
 0072528F    push        0
 00725291    push        ebx
 00725292    mov         ebx,eax
 00725294    xor         eax,eax
 00725296    push        ebp
 00725297    push        7252DD
 0072529C    push        dword ptr fs:[eax]
 0072529F    mov         dword ptr fs:[eax],esp
 007252A2    cmp         dword ptr [ebx+8],0
>007252A6    je          007252C7
 007252A8    mov         eax,ebx
 007252AA    call        TJvMRUManager.GetIniStorage
 007252AF    test        eax,eax
>007252B1    je          007252C7
 007252B3    lea         edx,[ebp-4]
 007252B6    mov         eax,ebx
 007252B8    call        0056BFC0
 007252BD    mov         edx,dword ptr [ebp-4]
 007252C0    mov         eax,ebx
 007252C2    call        007256E0
 007252C7    xor         eax,eax
 007252C9    pop         edx
 007252CA    pop         ecx
 007252CB    pop         ecx
 007252CC    mov         dword ptr fs:[eax],edx
 007252CF    push        7252E4
 007252D4    lea         eax,[ebp-4]
 007252D7    call        @UStrClr
 007252DC    ret
>007252DD    jmp         @HandleFinally
>007252E2    jmp         007252D4
 007252E4    pop         ebx
 007252E5    pop         ecx
 007252E6    pop         ebp
 007252E7    ret
*}
end;

//007252E8
procedure sub_007252E8(?:TJvMRUManager);
begin
{*
 007252E8    push        ebp
 007252E9    mov         ebp,esp
 007252EB    push        0
 007252ED    push        ebx
 007252EE    mov         ebx,eax
 007252F0    xor         eax,eax
 007252F2    push        ebp
 007252F3    push        725339
 007252F8    push        dword ptr fs:[eax]
 007252FB    mov         dword ptr fs:[eax],esp
 007252FE    cmp         dword ptr [ebx+8],0
>00725302    je          00725323
 00725304    mov         eax,ebx
 00725306    call        TJvMRUManager.GetIniStorage
 0072530B    test        eax,eax
>0072530D    je          00725323
 0072530F    lea         edx,[ebp-4]
 00725312    mov         eax,ebx
 00725314    call        0056BFC0
 00725319    mov         edx,dword ptr [ebp-4]
 0072531C    mov         eax,ebx
 0072531E    call        00725658
 00725323    xor         eax,eax
 00725325    pop         edx
 00725326    pop         ecx
 00725327    pop         ecx
 00725328    mov         dword ptr fs:[eax],edx
 0072532B    push        725340
 00725330    lea         eax,[ebp-4]
 00725333    call        @UStrClr
 00725338    ret
>00725339    jmp         @HandleFinally
>0072533E    jmp         00725330
 00725340    pop         ebx
 00725341    pop         ecx
 00725342    pop         ebp
 00725343    ret
*}
end;

//00725344
procedure TJvMRUManager.sub_00725344;
begin
{*
 00725344    push        ebx
 00725345    cmp         word ptr [eax+5A],0;TJvMRUManager.?f5A:word
>0072534A    je          00725356
 0072534C    mov         ebx,eax
 0072534E    mov         edx,eax
 00725350    mov         eax,dword ptr [ebx+5C];TJvMRUManager.?f5C:dword
 00725353    call        dword ptr [ebx+58];TJvMRUManager.FOnChange
 00725356    pop         ebx
 00725357    ret
*}
end;

//00725358
{*procedure TJvMRUManager.sub_00725358(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00725358    push        ebp
 00725359    mov         ebp,esp
 0072535B    push        ecx
 0072535C    mov         ecx,4
 00725361    push        0
 00725363    push        0
 00725365    dec         ecx
>00725366    jne         00725361
 00725368    xchg        ecx,dword ptr [ebp-4]
 0072536B    push        ebx
 0072536C    push        esi
 0072536D    mov         esi,ecx
 0072536F    mov         ebx,edx
 00725371    xor         edx,edx
 00725373    push        ebp
 00725374    push        725478
 00725379    push        dword ptr fs:[edx]
 0072537C    mov         dword ptr fs:[edx],esp
 0072537F    cmp         word ptr [eax+72],0;TJvMRUManager.?f72:word
>00725384    je          007253A4
 00725386    push        esi
 00725387    mov         edx,dword ptr [ebp+10]
 0072538A    push        edx
 0072538B    mov         edx,dword ptr [ebp+0C]
 0072538E    push        edx
 0072538F    mov         edx,dword ptr [ebp+8]
 00725392    push        edx
 00725393    mov         esi,eax
 00725395    mov         ecx,ebx
 00725397    mov         edx,eax
 00725399    mov         eax,dword ptr [esi+74];TJvMRUManager.?f74:dword
 0072539C    call        dword ptr [esi+70];TJvMRUManager.FOnReadItem
>0072539F    jmp         00725448
 007253A4    lea         eax,[ebp-4]
 007253A7    push        eax
 007253A8    lea         eax,[ebp-8]
 007253AB    push        eax
 007253AC    mov         dword ptr [ebp-10],esi
 007253AF    lea         eax,[ebp-14]
 007253B2    push        eax
 007253B3    mov         eax,dword ptr [ebp+10]
 007253B6    mov         dword ptr [ebp-1C],eax
 007253B9    mov         byte ptr [ebp-18],0
 007253BD    lea         edx,[ebp-1C]
 007253C0    xor         ecx,ecx
 007253C2    mov         eax,725494;'Item_%d'
 007253C7    call        Format
 007253CC    mov         eax,dword ptr [ebp-14]
 007253CF    mov         dword ptr [ebp-0C],eax
 007253D2    lea         edx,[ebp-10]
 007253D5    mov         ecx,1
 007253DA    mov         eax,dword ptr [ebx]
 007253DC    call        TJvCustomAppStorage.ConcatPaths
 007253E1    mov         edx,dword ptr [ebp-8]
 007253E4    mov         ecx,dword ptr [ebp+0C]
 007253E7    mov         ecx,dword ptr [ecx]
 007253E9    mov         eax,ebx
 007253EB    call        TJvCustomAppStorage.ReadString
 007253F0    mov         edx,dword ptr [ebp-4]
 007253F3    mov         eax,dword ptr [ebp+0C]
 007253F6    call        @UStrAsg
 007253FB    lea         eax,[ebp-20]
 007253FE    push        eax
 007253FF    mov         dword ptr [ebp-10],esi
 00725402    lea         eax,[ebp-24]
 00725405    push        eax
 00725406    mov         eax,dword ptr [ebp+10]
 00725409    mov         dword ptr [ebp-1C],eax
 0072540C    mov         byte ptr [ebp-18],0
 00725410    lea         edx,[ebp-1C]
 00725413    xor         ecx,ecx
 00725415    mov         eax,7254B0;'User_%d'
 0072541A    call        Format
 0072541F    mov         eax,dword ptr [ebp-24]
 00725422    mov         dword ptr [ebp-0C],eax
 00725425    lea         edx,[ebp-10]
 00725428    mov         ecx,1
 0072542D    mov         eax,dword ptr [ebx]
 0072542F    call        TJvCustomAppStorage.ConcatPaths
 00725434    mov         edx,dword ptr [ebp-20]
 00725437    mov         ecx,dword ptr [ebp+8]
 0072543A    mov         ecx,dword ptr [ecx]
 0072543C    mov         eax,ebx
 0072543E    call        TJvCustomAppStorage.ReadInteger
 00725443    mov         edx,dword ptr [ebp+8]
 00725446    mov         dword ptr [edx],eax
 00725448    xor         eax,eax
 0072544A    pop         edx
 0072544B    pop         ecx
 0072544C    pop         ecx
 0072544D    mov         dword ptr fs:[eax],edx
 00725450    push        72547F
 00725455    lea         eax,[ebp-24]
 00725458    mov         edx,2
 0072545D    call        @UStrArrayClr
 00725462    lea         eax,[ebp-14]
 00725465    call        @UStrClr
 0072546A    lea         eax,[ebp-8]
 0072546D    mov         edx,2
 00725472    call        @UStrArrayClr
 00725477    ret
>00725478    jmp         @HandleFinally
>0072547D    jmp         00725455
 0072547F    pop         esi
 00725480    pop         ebx
 00725481    mov         esp,ebp
 00725483    pop         ebp
 00725484    ret         0C
end;*}

//007254C0
{*procedure TJvMRUManager.sub_007254C0(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 007254C0    push        ebp
 007254C1    mov         ebp,esp
 007254C3    push        ecx
 007254C4    mov         ecx,4
 007254C9    push        0
 007254CB    push        0
 007254CD    dec         ecx
>007254CE    jne         007254C9
 007254D0    push        ecx
 007254D1    xchg        ecx,dword ptr [ebp-4]
 007254D4    push        ebx
 007254D5    push        esi
 007254D6    mov         esi,ecx
 007254D8    mov         ebx,edx
 007254DA    xor         edx,edx
 007254DC    push        ebp
 007254DD    push        72560F
 007254E2    push        dword ptr fs:[edx]
 007254E5    mov         dword ptr fs:[edx],esp
 007254E8    cmp         word ptr [eax+7A],0;TJvMRUManager.?f7A:word
>007254ED    je          0072550D
 007254EF    push        esi
 007254F0    mov         edx,dword ptr [ebp+10]
 007254F3    push        edx
 007254F4    mov         edx,dword ptr [ebp+0C]
 007254F7    push        edx
 007254F8    mov         edx,dword ptr [ebp+8]
 007254FB    push        edx
 007254FC    mov         esi,eax
 007254FE    mov         ecx,ebx
 00725500    mov         edx,eax
 00725502    mov         eax,dword ptr [esi+7C];TJvMRUManager.?f7C:dword
 00725505    call        dword ptr [esi+78];TJvMRUManager.FOnWriteItem
>00725508    jmp         007255E4
 0072550D    lea         eax,[ebp-4]
 00725510    push        eax
 00725511    mov         dword ptr [ebp-0C],esi
 00725514    lea         eax,[ebp-10]
 00725517    push        eax
 00725518    mov         eax,dword ptr [ebp+10]
 0072551B    mov         dword ptr [ebp-18],eax
 0072551E    mov         byte ptr [ebp-14],0
 00725522    lea         edx,[ebp-18]
 00725525    xor         ecx,ecx
 00725527    mov         eax,72562C;'Item_%d'
 0072552C    call        Format
 00725531    mov         eax,dword ptr [ebp-10]
 00725534    mov         dword ptr [ebp-8],eax
 00725537    lea         edx,[ebp-0C]
 0072553A    mov         ecx,1
 0072553F    mov         eax,dword ptr [ebx]
 00725541    call        TJvCustomAppStorage.ConcatPaths
 00725546    mov         edx,dword ptr [ebp-4]
 00725549    mov         ecx,dword ptr [ebp+0C]
 0072554C    mov         eax,ebx
 0072554E    call        TJvCustomAppStorage.WriteString
 00725553    cmp         dword ptr [ebp+8],0
>00725557    jne         0072559E
 00725559    lea         eax,[ebp-1C]
 0072555C    push        eax
 0072555D    mov         dword ptr [ebp-0C],esi
 00725560    lea         eax,[ebp-20]
 00725563    push        eax
 00725564    mov         eax,dword ptr [ebp+10]
 00725567    mov         dword ptr [ebp-18],eax
 0072556A    mov         byte ptr [ebp-14],0
 0072556E    lea         edx,[ebp-18]
 00725571    xor         ecx,ecx
 00725573    mov         eax,725648;'User_%d'
 00725578    call        Format
 0072557D    mov         eax,dword ptr [ebp-20]
 00725580    mov         dword ptr [ebp-8],eax
 00725583    lea         edx,[ebp-0C]
 00725586    mov         ecx,1
 0072558B    mov         eax,dword ptr [ebx]
 0072558D    call        TJvCustomAppStorage.ConcatPaths
 00725592    mov         edx,dword ptr [ebp-1C]
 00725595    mov         eax,ebx
 00725597    call        TJvCustomAppStorage.DeleteValue
>0072559C    jmp         007255E4
 0072559E    lea         eax,[ebp-24]
 007255A1    push        eax
 007255A2    mov         dword ptr [ebp-0C],esi
 007255A5    lea         eax,[ebp-28]
 007255A8    push        eax
 007255A9    mov         eax,dword ptr [ebp+10]
 007255AC    mov         dword ptr [ebp-18],eax
 007255AF    mov         byte ptr [ebp-14],0
 007255B3    lea         edx,[ebp-18]
 007255B6    mov         eax,725648;'User_%d'
 007255BB    xor         ecx,ecx
 007255BD    call        Format
 007255C2    mov         eax,dword ptr [ebp-28]
 007255C5    mov         dword ptr [ebp-8],eax
 007255C8    lea         edx,[ebp-0C]
 007255CB    mov         ecx,1
 007255D0    mov         eax,dword ptr [ebx]
 007255D2    call        TJvCustomAppStorage.ConcatPaths
 007255D7    mov         edx,dword ptr [ebp-24]
 007255DA    mov         ecx,dword ptr [ebp+8]
 007255DD    mov         eax,ebx
 007255DF    call        TJvCustomAppStorage.WriteInteger
 007255E4    xor         eax,eax
 007255E6    pop         edx
 007255E7    pop         ecx
 007255E8    pop         ecx
 007255E9    mov         dword ptr fs:[eax],edx
 007255EC    push        725616
 007255F1    lea         eax,[ebp-28]
 007255F4    mov         edx,4
 007255F9    call        @UStrArrayClr
 007255FE    lea         eax,[ebp-10]
 00725601    call        @UStrClr
 00725606    lea         eax,[ebp-4]
 00725609    call        @UStrClr
 0072560E    ret
>0072560F    jmp         @HandleFinally
>00725614    jmp         007255F1
 00725616    pop         esi
 00725617    pop         ebx
 00725618    mov         esp,ebp
 0072561A    pop         ebp
 0072561B    ret         0C
end;*}

//00725658
{*procedure sub_00725658(?:?; ?:?);
begin
 00725658    push        ebp
 00725659    mov         ebp,esp
 0072565B    add         esp,0FFFFFFF0
 0072565E    push        ebx
 0072565F    push        esi
 00725660    push        edi
 00725661    xor         ecx,ecx
 00725663    mov         dword ptr [ebp-8],ecx
 00725666    mov         dword ptr [ebp-4],edx
 00725669    mov         ebx,eax
 0072566B    xor         eax,eax
 0072566D    push        ebp
 0072566E    push        7256D1
 00725673    push        dword ptr fs:[eax]
 00725676    mov         dword ptr fs:[eax],esp
 00725679    mov         eax,ebx
 0072567B    call        TJvMRUManager.GetIniStorage
 00725680    test        eax,eax
>00725682    je          007256BB
 00725684    mov         eax,ebx
 00725686    call        TJvMRUManager.GetIniStorage
 0072568B    mov         esi,eax
 0072568D    lea         eax,[ebp-8]
 00725690    push        eax
 00725691    mov         eax,dword ptr [esi+40]
 00725694    mov         dword ptr [ebp-10],eax
 00725697    mov         eax,dword ptr [ebp-4]
 0072569A    mov         dword ptr [ebp-0C],eax
 0072569D    lea         edx,[ebp-10]
 007256A0    mov         edi,dword ptr [esi+3C]
 007256A3    mov         eax,dword ptr [edi]
 007256A5    mov         ecx,1
 007256AA    call        TJvCustomAppStorage.ConcatPaths
 007256AF    mov         ecx,dword ptr [ebp-8]
 007256B2    mov         edx,edi
 007256B4    mov         eax,ebx
 007256B6    call        TJvMRUManager.LoadFromAppStorage
 007256BB    xor         eax,eax
 007256BD    pop         edx
 007256BE    pop         ecx
 007256BF    pop         ecx
 007256C0    mov         dword ptr fs:[eax],edx
 007256C3    push        7256D8
 007256C8    lea         eax,[ebp-8]
 007256CB    call        @UStrClr
 007256D0    ret
>007256D1    jmp         @HandleFinally
>007256D6    jmp         007256C8
 007256D8    pop         edi
 007256D9    pop         esi
 007256DA    pop         ebx
 007256DB    mov         esp,ebp
 007256DD    pop         ebp
 007256DE    ret
end;*}

//007256E0
{*procedure sub_007256E0(?:?; ?:?);
begin
 007256E0    push        ebp
 007256E1    mov         ebp,esp
 007256E3    add         esp,0FFFFFFF0
 007256E6    push        ebx
 007256E7    push        esi
 007256E8    push        edi
 007256E9    xor         ecx,ecx
 007256EB    mov         dword ptr [ebp-8],ecx
 007256EE    mov         dword ptr [ebp-4],edx
 007256F1    mov         ebx,eax
 007256F3    xor         eax,eax
 007256F5    push        ebp
 007256F6    push        725759
 007256FB    push        dword ptr fs:[eax]
 007256FE    mov         dword ptr fs:[eax],esp
 00725701    mov         eax,ebx
 00725703    call        TJvMRUManager.GetIniStorage
 00725708    test        eax,eax
>0072570A    je          00725743
 0072570C    mov         eax,ebx
 0072570E    call        TJvMRUManager.GetIniStorage
 00725713    mov         esi,eax
 00725715    lea         eax,[ebp-8]
 00725718    push        eax
 00725719    mov         eax,dword ptr [esi+40]
 0072571C    mov         dword ptr [ebp-10],eax
 0072571F    mov         eax,dword ptr [ebp-4]
 00725722    mov         dword ptr [ebp-0C],eax
 00725725    lea         edx,[ebp-10]
 00725728    mov         edi,dword ptr [esi+3C]
 0072572B    mov         eax,dword ptr [edi]
 0072572D    mov         ecx,1
 00725732    call        TJvCustomAppStorage.ConcatPaths
 00725737    mov         ecx,dword ptr [ebp-8]
 0072573A    mov         edx,edi
 0072573C    mov         eax,ebx
 0072573E    call        TJvMRUManager.SaveToAppStorage
 00725743    xor         eax,eax
 00725745    pop         edx
 00725746    pop         ecx
 00725747    pop         ecx
 00725748    mov         dword ptr fs:[eax],edx
 0072574B    push        725760
 00725750    lea         eax,[ebp-8]
 00725753    call        @UStrClr
 00725758    ret
>00725759    jmp         @HandleFinally
>0072575E    jmp         00725750
 00725760    pop         edi
 00725761    pop         esi
 00725762    pop         ebx
 00725763    mov         esp,ebp
 00725765    pop         ebp
 00725766    ret
end;*}

//00725768
procedure TJvMRUManager.LoadFromAppStorage(AppStorage:TJvCustomAppStorage; Path:string);
begin
{*
 00725768    push        ebp
 00725769    mov         ebp,esp
 0072576B    add         esp,0FFFFFFEC
 0072576E    push        ebx
 0072576F    push        esi
 00725770    push        edi
 00725771    xor         ebx,ebx
 00725773    mov         dword ptr [ebp-4],ebx
 00725776    mov         dword ptr [ebp-0C],ecx
 00725779    mov         edi,edx
 0072577B    mov         dword ptr [ebp-8],eax
 0072577E    xor         eax,eax
 00725780    push        ebp
 00725781    push        72585D
 00725786    push        dword ptr fs:[eax]
 00725789    mov         dword ptr fs:[eax],esp
 0072578C    mov         eax,dword ptr [ebp-8]
 0072578F    call        TJvMRUManager.GetMode
 00725794    mov         byte ptr [ebp-11],al
 00725797    mov         eax,dword ptr [ebp-8]
 0072579A    call        00724AE8
 0072579F    call        TStrings.BeginUpdate
 007257A4    xor         eax,eax
 007257A6    push        ebp
 007257A7    push        725840
 007257AC    push        dword ptr fs:[eax]
 007257AF    mov         dword ptr fs:[eax],esp
 007257B2    mov         eax,dword ptr [ebp-8]
 007257B5    call        00724AE8
 007257BA    mov         edx,dword ptr [eax]
 007257BC    call        dword ptr [edx+44]
 007257BF    xor         edx,edx
 007257C1    mov         eax,dword ptr [ebp-8]
 007257C4    call        TJvMRUManager.SetMode
 007257C9    mov         eax,dword ptr [ebp-8]
 007257CC    mov         eax,dword ptr [eax+38];TJvMRUManager.FStrings:TJvRecentStrings
 007257CF    mov         ebx,dword ptr [eax+58];TJvRecentStrings.FMaxSize:Integer
 007257D2    dec         ebx
 007257D3    cmp         ebx,0
>007257D6    jl          00725819
 007257D8    lea         eax,[ebp-4]
 007257DB    call        @UStrClr
 007257E0    xor         eax,eax
 007257E2    mov         dword ptr [ebp-10],eax
 007257E5    push        ebx
 007257E6    lea         eax,[ebp-4]
 007257E9    push        eax
 007257EA    lea         eax,[ebp-10]
 007257ED    push        eax
 007257EE    mov         ecx,dword ptr [ebp-0C]
 007257F1    mov         edx,edi
 007257F3    mov         eax,dword ptr [ebp-8]
 007257F6    mov         si,0FFEF
 007257FA    call        @CallDynaInst;TJvMRUManager.sub_00725358
 007257FF    cmp         dword ptr [ebp-4],0
>00725803    je          00725813
 00725805    mov         ecx,dword ptr [ebp-10]
 00725808    mov         edx,dword ptr [ebp-4]
 0072580B    mov         eax,dword ptr [ebp-8]
 0072580E    call        TJvMRUManager.Add
 00725813    dec         ebx
 00725814    cmp         ebx,0FFFFFFFF
>00725817    jne         007257D8
 00725819    xor         eax,eax
 0072581B    pop         edx
 0072581C    pop         ecx
 0072581D    pop         ecx
 0072581E    mov         dword ptr fs:[eax],edx
 00725821    push        725847
 00725826    movzx       edx,byte ptr [ebp-11]
 0072582A    mov         eax,dword ptr [ebp-8]
 0072582D    call        TJvMRUManager.SetMode
 00725832    mov         eax,dword ptr [ebp-8]
 00725835    call        00724AE8
 0072583A    call        TStrings.EndUpdate
 0072583F    ret
>00725840    jmp         @HandleFinally
>00725845    jmp         00725826
 00725847    xor         eax,eax
 00725849    pop         edx
 0072584A    pop         ecx
 0072584B    pop         ecx
 0072584C    mov         dword ptr fs:[eax],edx
 0072584F    push        725864
 00725854    lea         eax,[ebp-4]
 00725857    call        @UStrClr
 0072585C    ret
>0072585D    jmp         @HandleFinally
>00725862    jmp         00725854
 00725864    pop         edi
 00725865    pop         esi
 00725866    pop         ebx
 00725867    mov         esp,ebp
 00725869    pop         ebp
 0072586A    ret
*}
end;

//0072586C
procedure TJvMRUManager.SaveToAppStorage(AppStorage:TJvCustomAppStorage; Path:string);
begin
{*
 0072586C    push        ebp
 0072586D    mov         ebp,esp
 0072586F    add         esp,0FFFFFFF0
 00725872    push        ebx
 00725873    push        esi
 00725874    push        edi
 00725875    xor         ebx,ebx
 00725877    mov         dword ptr [ebp-10],ebx
 0072587A    mov         dword ptr [ebp-8],ecx
 0072587D    mov         dword ptr [ebp-4],edx
 00725880    mov         edi,eax
 00725882    xor         eax,eax
 00725884    push        ebp
 00725885    push        725904
 0072588A    push        dword ptr fs:[eax]
 0072588D    mov         dword ptr fs:[eax],esp
 00725890    mov         edx,dword ptr [ebp-8]
 00725893    mov         eax,dword ptr [ebp-4]
 00725896    call        TJvCustomAppStorage.DeleteSubTree
 0072589B    mov         eax,edi
 0072589D    call        00724AE8
 007258A2    mov         edx,dword ptr [eax]
 007258A4    call        dword ptr [edx+14]
 007258A7    dec         eax
 007258A8    test        eax,eax
>007258AA    jl          007258EE
 007258AC    inc         eax
 007258AD    mov         dword ptr [ebp-0C],eax
 007258B0    xor         ebx,ebx
 007258B2    push        ebx
 007258B3    mov         eax,edi
 007258B5    call        00724AE8
 007258BA    lea         ecx,[ebp-10]
 007258BD    mov         edx,ebx
 007258BF    mov         esi,dword ptr [eax]
 007258C1    call        dword ptr [esi+0C]
 007258C4    mov         eax,dword ptr [ebp-10]
 007258C7    push        eax
 007258C8    mov         eax,edi
 007258CA    call        00724AE8
 007258CF    mov         edx,ebx
 007258D1    mov         ecx,dword ptr [eax]
 007258D3    call        dword ptr [ecx+18]
 007258D6    push        eax
 007258D7    mov         ecx,dword ptr [ebp-8]
 007258DA    mov         edx,dword ptr [ebp-4]
 007258DD    mov         eax,edi
 007258DF    mov         si,0FFEE
 007258E3    call        @CallDynaInst;TJvMRUManager.sub_007254C0
 007258E8    inc         ebx
 007258E9    dec         dword ptr [ebp-0C]
>007258EC    jne         007258B2
 007258EE    xor         eax,eax
 007258F0    pop         edx
 007258F1    pop         ecx
 007258F2    pop         ecx
 007258F3    mov         dword ptr fs:[eax],edx
 007258F6    push        72590B
 007258FB    lea         eax,[ebp-10]
 007258FE    call        @UStrClr
 00725903    ret
>00725904    jmp         @HandleFinally
>00725909    jmp         007258FB
 0072590B    pop         edi
 0072590C    pop         esi
 0072590D    pop         ebx
 0072590E    mov         esp,ebp
 00725910    pop         ebp
 00725911    ret
*}
end;

//00725914
procedure TJvMRUManager.Load;
begin
{*
 00725914    xor         edx,edx
 00725916    call        007252E8
 0072591B    ret
*}
end;

//0072591C
procedure TJvMRUManager.Save;
begin
{*
 0072591C    xor         edx,edx
 0072591E    call        0072528C
 00725923    ret
*}
end;

//00725924
procedure sub_00725924;
begin
{*
 00725924    push        ebx
 00725925    cmp         word ptr [eax+82],0;TJvMRUManager.?f82:word
>0072592D    je          0072593F
 0072592F    mov         ebx,eax
 00725931    mov         edx,eax
 00725933    mov         eax,dword ptr [ebx+84];TJvMRUManager.?f84:dword
 00725939    call        dword ptr [ebx+80];TJvMRUManager.FOnAfterUpdate
 0072593F    pop         ebx
 00725940    ret
*}
end;

//00725944
procedure sub_00725944;
begin
{*
 00725944    push        ebx
 00725945    cmp         word ptr [eax+8A],0;TJvMRUManager.?f8A:word
>0072594D    je          0072595F
 0072594F    mov         ebx,eax
 00725951    mov         edx,eax
 00725953    mov         eax,dword ptr [ebx+8C];TJvMRUManager.?f8C:dword
 00725959    call        dword ptr [ebx+88];TJvMRUManager.FOnBeforeUpdate
 0072595F    pop         ebx
 00725960    ret
*}
end;

//00725964
procedure TJvMRUManager.RemoveInvalid;
begin
{*
 00725964    push        ebp
 00725965    mov         ebp,esp
 00725967    push        0
 00725969    push        ebx
 0072596A    push        esi
 0072596B    push        edi
 0072596C    mov         esi,eax
 0072596E    xor         eax,eax
 00725970    push        ebp
 00725971    push        7259D7
 00725976    push        dword ptr fs:[eax]
 00725979    mov         dword ptr fs:[eax],esp
 0072597C    mov         eax,esi
 0072597E    call        00724AE8
 00725983    mov         edx,dword ptr [eax]
 00725985    call        dword ptr [edx+14]
 00725988    mov         ebx,eax
 0072598A    dec         ebx
 0072598B    cmp         ebx,0
>0072598E    jl          007259C1
 00725990    mov         eax,esi
 00725992    call        00724AE8
 00725997    lea         ecx,[ebp-4]
 0072599A    mov         edx,ebx
 0072599C    mov         edi,dword ptr [eax]
 0072599E    call        dword ptr [edi+0C]
 007259A1    mov         eax,dword ptr [ebp-4]
 007259A4    call        0053AFD0
 007259A9    test        al,al
>007259AB    jne         007259BB
 007259AD    mov         eax,esi
 007259AF    call        00724AE8
 007259B4    mov         edx,ebx
 007259B6    mov         ecx,dword ptr [eax]
 007259B8    call        dword ptr [ecx+48]
 007259BB    dec         ebx
 007259BC    cmp         ebx,0FFFFFFFF
>007259BF    jne         00725990
 007259C1    xor         eax,eax
 007259C3    pop         edx
 007259C4    pop         ecx
 007259C5    pop         ecx
 007259C6    mov         dword ptr fs:[eax],edx
 007259C9    push        7259DE
 007259CE    lea         eax,[ebp-4]
 007259D1    call        @UStrClr
 007259D6    ret
>007259D7    jmp         @HandleFinally
>007259DC    jmp         007259CE
 007259DE    pop         edi
 007259DF    pop         esi
 007259E0    pop         ebx
 007259E1    pop         ecx
 007259E2    pop         ebp
 007259E3    ret
*}
end;

//007259E4
{*procedure TJvMRUManager.sub_007259E4(?:?);
begin
 007259E4    push        ebx
 007259E5    cmp         word ptr [eax+92],0;TJvMRUManager.?f92:word
>007259ED    je          00725A01
 007259EF    mov         ebx,eax
 007259F1    mov         ecx,edx
 007259F3    mov         edx,eax
 007259F5    mov         eax,dword ptr [ebx+94];TJvMRUManager.?f94:dword
 007259FB    call        dword ptr [ebx+90];TJvMRUManager.FOnItemInfo
 00725A01    pop         ebx
 00725A02    ret
end;*}

//00725A04
{*procedure TJvMRUManager.sub_00725A04(?:?; ?:?);
begin
 00725A04    push        ebx
 00725A05    push        esi
 00725A06    push        edi
 00725A07    push        ebp
 00725A08    mov         ebp,ecx
 00725A0A    mov         edi,edx
 00725A0C    mov         ebx,eax
 00725A0E    mov         edx,edi
 00725A10    mov         eax,ebx
 00725A12    mov         si,0FFEC
 00725A16    call        @CallDynaInst;TJvMRUManager.sub_007259E4
 00725A1B    cmp         word ptr [ebx+9A],0;TJvMRUManager.?f9A:word
>00725A23    je          00725A36
 00725A25    push        ebp
 00725A26    mov         ecx,edi
 00725A28    mov         edx,ebx
 00725A2A    mov         eax,dword ptr [ebx+9C];TJvMRUManager.?f9C:dword
 00725A30    call        dword ptr [ebx+98];TJvMRUManager.FOnItemInfoEx
 00725A36    pop         ebp
 00725A37    pop         edi
 00725A38    pop         esi
 00725A39    pop         ebx
 00725A3A    ret
end;*}

//00725A3C
procedure TJvMRUManager.SetDuplicates(Value:TDuplicates);
begin
{*
 00725A3C    cmp         dl,byte ptr [eax+0A0];TJvMRUManager.FDuplicates:TDuplicates
>00725A42    je          00725A55
 00725A44    mov         byte ptr [eax+0A0],dl;TJvMRUManager.FDuplicates:TDuplicates
 00725A4A    cmp         byte ptr [eax+47],0;TJvMRUManager.FAutoUpdate:Boolean
>00725A4E    je          00725A55
 00725A50    call        TJvMRUManager.UpdateRecentMenu
 00725A55    ret
*}
end;

//00725A58
constructor TJvRecentStrings.Create;
begin
{*
 00725A58    push        ebx
 00725A59    push        esi
 00725A5A    test        dl,dl
>00725A5C    je          00725A66
 00725A5E    add         esp,0FFFFFFF0
 00725A61    call        @ClassCreate
 00725A66    mov         ebx,edx
 00725A68    mov         esi,eax
 00725A6A    xor         edx,edx
 00725A6C    mov         eax,esi
 00725A6E    call        TStringList.Create
 00725A73    mov         dword ptr [esi+58],0A;TJvRecentStrings.FMaxSize:Integer
 00725A7A    mov         byte ptr [esi+5C],0;TJvRecentStrings.FMode:TRecentMode
 00725A7E    mov         eax,esi
 00725A80    test        bl,bl
>00725A82    je          00725A93
 00725A84    call        @AfterConstruction
 00725A89    pop         dword ptr fs:[0]
 00725A90    add         esp,0C
 00725A93    mov         eax,esi
 00725A95    pop         esi
 00725A96    pop         ebx
 00725A97    ret
*}
end;

//00725A98
procedure TJvRecentStrings.SetTextStr(const Value:UnicodeString);
begin
{*
 00725A98    push        ebp
 00725A99    mov         ebp,esp
 00725A9B    add         esp,0FFFFFFF8
 00725A9E    mov         dword ptr [ebp-4],eax
 00725AA1    mov         eax,dword ptr [ebp-4]
 00725AA4    movzx       eax,byte ptr [eax+5C];TJvRecentStrings.FMode:TRecentMode
 00725AA8    mov         byte ptr [ebp-5],al
 00725AAB    xor         eax,eax
 00725AAD    push        ebp
 00725AAE    push        725AE0
 00725AB3    push        dword ptr fs:[eax]
 00725AB6    mov         dword ptr fs:[eax],esp
 00725AB9    mov         eax,dword ptr [ebp-4]
 00725ABC    mov         byte ptr [eax+5C],1;TJvRecentStrings.FMode:TRecentMode
 00725AC0    mov         eax,dword ptr [ebp-4]
 00725AC3    call        TStrings.SetTextStr
 00725AC8    xor         eax,eax
 00725ACA    pop         edx
 00725ACB    pop         ecx
 00725ACC    pop         ecx
 00725ACD    mov         dword ptr fs:[eax],edx
 00725AD0    push        725AE7
 00725AD5    mov         eax,dword ptr [ebp-4]
 00725AD8    movzx       edx,byte ptr [ebp-5]
 00725ADC    mov         byte ptr [eax+5C],dl;TJvRecentStrings.FMode:TRecentMode
 00725ADF    ret
>00725AE0    jmp         @HandleFinally
>00725AE5    jmp         00725AD5
 00725AE7    pop         ecx
 00725AE8    pop         ecx
 00725AE9    pop         ebp
 00725AEA    ret
*}
end;

//00725AEC
procedure sub_00725AEC(?:TJvRecentStrings; ?:Integer);
begin
{*
 00725AEC    push        ebx
 00725AED    push        esi
 00725AEE    mov         esi,edx
 00725AF0    mov         ebx,eax
 00725AF2    cmp         esi,dword ptr [ebx+58];TJvRecentStrings.FMaxSize:Integer
>00725AF5    je          00725B0D
 00725AF7    mov         edx,esi
 00725AF9    mov         eax,1
 00725AFE    call        00455398
 00725B03    mov         dword ptr [ebx+58],eax;TJvRecentStrings.FMaxSize:Integer
 00725B06    mov         eax,ebx
 00725B08    call        TJvRecentStrings.DeleteExceed
 00725B0D    pop         esi
 00725B0E    pop         ebx
 00725B0F    ret
*}
end;

//00725B10
procedure TJvRecentStrings.DeleteExceed;
begin
{*
 00725B10    push        ebp
 00725B11    mov         ebp,esp
 00725B13    push        ecx
 00725B14    push        ebx
 00725B15    push        esi
 00725B16    mov         dword ptr [ebp-4],eax
 00725B19    mov         eax,dword ptr [ebp-4]
 00725B1C    call        TStrings.BeginUpdate
 00725B21    xor         eax,eax
 00725B23    push        ebp
 00725B24    push        725B8E
 00725B29    push        dword ptr fs:[eax]
 00725B2C    mov         dword ptr fs:[eax],esp
 00725B2F    mov         eax,dword ptr [ebp-4]
 00725B32    cmp         byte ptr [eax+5C],0;TJvRecentStrings.FMode:TRecentMode
>00725B36    jne         00725B68
 00725B38    mov         eax,dword ptr [ebp-4]
 00725B3B    mov         edx,dword ptr [eax]
 00725B3D    call        dword ptr [edx+14];TStringList.GetCount
 00725B40    mov         esi,eax
 00725B42    dec         esi
 00725B43    mov         eax,dword ptr [ebp-4]
 00725B46    mov         ebx,dword ptr [eax+58];TJvRecentStrings.FMaxSize:Integer
 00725B49    sub         ebx,esi
>00725B4B    jg          00725B78
 00725B4D    dec         ebx
 00725B4E    mov         edx,esi
 00725B50    mov         eax,dword ptr [ebp-4]
 00725B53    mov         ecx,dword ptr [eax]
 00725B55    call        dword ptr [ecx+48];TStringList.Delete
 00725B58    dec         esi
 00725B59    inc         ebx
>00725B5A    jne         00725B4E
>00725B5C    jmp         00725B78
 00725B5E    xor         edx,edx
 00725B60    mov         eax,dword ptr [ebp-4]
 00725B63    mov         ecx,dword ptr [eax]
 00725B65    call        dword ptr [ecx+48];TStringList.Delete
 00725B68    mov         eax,dword ptr [ebp-4]
 00725B6B    mov         edx,dword ptr [eax]
 00725B6D    call        dword ptr [edx+14];TStringList.GetCount
 00725B70    mov         edx,dword ptr [ebp-4]
 00725B73    cmp         eax,dword ptr [edx+58];TJvRecentStrings.FMaxSize:Integer
>00725B76    jg          00725B5E
 00725B78    xor         eax,eax
 00725B7A    pop         edx
 00725B7B    pop         ecx
 00725B7C    pop         ecx
 00725B7D    mov         dword ptr fs:[eax],edx
 00725B80    push        725B95
 00725B85    mov         eax,dword ptr [ebp-4]
 00725B88    call        TStrings.EndUpdate
 00725B8D    ret
>00725B8E    jmp         @HandleFinally
>00725B93    jmp         00725B85
 00725B95    pop         esi
 00725B96    pop         ebx
 00725B97    pop         ecx
 00725B98    pop         ebp
 00725B99    ret
*}
end;

//00725B9C
procedure TJvRecentStrings.Remove(S:string);
begin
{*
 00725B9C    push        ebx
 00725B9D    mov         ebx,eax
 00725B9F    mov         eax,ebx
 00725BA1    mov         ecx,dword ptr [eax]
 00725BA3    call        dword ptr [ecx+54];TStringList.IndexOf
 00725BA6    test        eax,eax
>00725BA8    jl          00725BB3
 00725BAA    mov         edx,eax
 00725BAC    mov         eax,ebx
 00725BAE    mov         ecx,dword ptr [eax]
 00725BB0    call        dword ptr [ecx+48];TStringList.Delete
 00725BB3    pop         ebx
 00725BB4    ret
*}
end;

//00725BB8
function TJvRecentStrings.Add(S:string):Integer;
begin
{*
 00725BB8    push        ebp
 00725BB9    mov         ebp,esp
 00725BBB    push        ecx
 00725BBC    push        ebx
 00725BBD    push        esi
 00725BBE    mov         esi,edx
 00725BC0    mov         dword ptr [ebp-4],eax
 00725BC3    mov         edx,esi
 00725BC5    mov         eax,dword ptr [ebp-4]
 00725BC8    mov         ecx,dword ptr [eax]
 00725BCA    call        dword ptr [ecx+54];TStringList.IndexOf
 00725BCD    mov         ebx,eax
 00725BCF    test        ebx,ebx
>00725BD1    jl          00725C01
 00725BD3    mov         eax,dword ptr [ebp-4]
 00725BD6    cmp         byte ptr [eax+5C],0;TJvRecentStrings.FMode:TRecentMode
>00725BDA    jne         00725BEA
 00725BDC    xor         ecx,ecx
 00725BDE    mov         edx,ebx
 00725BE0    mov         eax,dword ptr [ebp-4]
 00725BE3    mov         ebx,dword ptr [eax]
 00725BE5    call        dword ptr [ebx+78];TStrings.Move
>00725BE8    jmp         00725C67
 00725BEA    mov         eax,dword ptr [ebp-4]
 00725BED    mov         edx,dword ptr [eax]
 00725BEF    call        dword ptr [edx+14];TStringList.GetCount
 00725BF2    mov         ecx,eax
 00725BF4    dec         ecx
 00725BF5    mov         edx,ebx
 00725BF7    mov         eax,dword ptr [ebp-4]
 00725BFA    mov         ebx,dword ptr [eax]
 00725BFC    call        dword ptr [ebx+78];TStrings.Move
>00725BFF    jmp         00725C67
 00725C01    mov         eax,dword ptr [ebp-4]
 00725C04    call        TStrings.BeginUpdate
 00725C09    xor         eax,eax
 00725C0B    push        ebp
 00725C0C    push        725C60
 00725C11    push        dword ptr fs:[eax]
 00725C14    mov         dword ptr fs:[eax],esp
 00725C17    mov         eax,dword ptr [ebp-4]
 00725C1A    cmp         byte ptr [eax+5C],0;TJvRecentStrings.FMode:TRecentMode
>00725C1E    jne         00725C2E
 00725C20    mov         ecx,esi
 00725C22    xor         edx,edx
 00725C24    mov         eax,dword ptr [ebp-4]
 00725C27    mov         ebx,dword ptr [eax]
 00725C29    call        dword ptr [ebx+60];TStringList.Insert
>00725C2C    jmp         00725C42
 00725C2E    mov         eax,dword ptr [ebp-4]
 00725C31    mov         edx,dword ptr [eax]
 00725C33    call        dword ptr [edx+14];TStringList.GetCount
 00725C36    mov         edx,eax
 00725C38    mov         ecx,esi
 00725C3A    mov         eax,dword ptr [ebp-4]
 00725C3D    mov         ebx,dword ptr [eax]
 00725C3F    call        dword ptr [ebx+60];TStringList.Insert
 00725C42    mov         eax,dword ptr [ebp-4]
 00725C45    call        TJvRecentStrings.DeleteExceed
 00725C4A    xor         eax,eax
 00725C4C    pop         edx
 00725C4D    pop         ecx
 00725C4E    pop         ecx
 00725C4F    mov         dword ptr fs:[eax],edx
 00725C52    push        725C67
 00725C57    mov         eax,dword ptr [ebp-4]
 00725C5A    call        TStrings.EndUpdate
 00725C5F    ret
>00725C60    jmp         @HandleFinally
>00725C65    jmp         00725C57
 00725C67    mov         eax,dword ptr [ebp-4]
 00725C6A    cmp         byte ptr [eax+5C],0;TJvRecentStrings.FMode:TRecentMode
>00725C6E    jne         00725C74
 00725C70    xor         ebx,ebx
>00725C72    jmp         00725C7F
 00725C74    mov         eax,dword ptr [ebp-4]
 00725C77    mov         edx,dword ptr [eax]
 00725C79    call        dword ptr [edx+14];TStringList.GetCount
 00725C7C    mov         ebx,eax
 00725C7E    dec         ebx
 00725C7F    mov         eax,ebx
 00725C81    pop         esi
 00725C82    pop         ebx
 00725C83    pop         ecx
 00725C84    pop         ebp
 00725C85    ret
*}
end;

//00725C88
procedure TJvRecentStrings.AddStrings(Strings:TStrings);
begin
{*
 00725C88    push        ebp
 00725C89    mov         ebp,esp
 00725C8B    add         esp,0FFFFFFF0
 00725C8E    push        ebx
 00725C8F    push        esi
 00725C90    push        edi
 00725C91    xor         ecx,ecx
 00725C93    mov         dword ptr [ebp-10],ecx
 00725C96    mov         dword ptr [ebp-0C],ecx
 00725C99    mov         esi,edx
 00725C9B    mov         dword ptr [ebp-4],eax
 00725C9E    xor         eax,eax
 00725CA0    push        ebp
 00725CA1    push        725D98
 00725CA6    push        dword ptr fs:[eax]
 00725CA9    mov         dword ptr fs:[eax],esp
 00725CAC    mov         eax,dword ptr [ebp-4]
 00725CAF    call        TStrings.BeginUpdate
 00725CB4    xor         eax,eax
 00725CB6    push        ebp
 00725CB7    push        725D76
 00725CBC    push        dword ptr fs:[eax]
 00725CBF    mov         dword ptr fs:[eax],esp
 00725CC2    mov         eax,dword ptr [ebp-4]
 00725CC5    cmp         byte ptr [eax+5C],0;TJvRecentStrings.FMode:TRecentMode
>00725CC9    jne         00725D11
 00725CCB    mov         eax,esi
 00725CCD    mov         edx,dword ptr [eax]
 00725CCF    call        dword ptr [edx+14];TStrings.GetCount
 00725CD2    mov         edx,dword ptr [ebp-4]
 00725CD5    mov         edx,dword ptr [edx+58];TJvRecentStrings.FMaxSize:Integer
 00725CD8    call        00455390
 00725CDD    mov         ebx,eax
 00725CDF    dec         ebx
 00725CE0    cmp         ebx,0
>00725CE3    jl          00725D58
 00725CE5    lea         ecx,[ebp-0C]
 00725CE8    mov         edx,ebx
 00725CEA    mov         eax,esi
 00725CEC    mov         edi,dword ptr [eax]
 00725CEE    call        dword ptr [edi+0C];TStrings.Get
 00725CF1    mov         eax,dword ptr [ebp-0C]
 00725CF4    push        eax
 00725CF5    mov         edx,ebx
 00725CF7    mov         eax,esi
 00725CF9    mov         ecx,dword ptr [eax]
 00725CFB    call        dword ptr [ecx+18];TStrings.sub_004483A0
 00725CFE    mov         ecx,eax
 00725D00    mov         eax,dword ptr [ebp-4]
 00725D03    pop         edx
 00725D04    mov         edi,dword ptr [eax]
 00725D06    call        dword ptr [edi+3C];TStringList.AddObject
 00725D09    dec         ebx
 00725D0A    cmp         ebx,0FFFFFFFF
>00725D0D    jne         00725CE5
>00725D0F    jmp         00725D58
 00725D11    mov         eax,esi
 00725D13    mov         edx,dword ptr [eax]
 00725D15    call        dword ptr [edx+14];TStrings.GetCount
 00725D18    mov         edx,dword ptr [ebp-4]
 00725D1B    mov         edx,dword ptr [edx+58];TJvRecentStrings.FMaxSize:Integer
 00725D1E    call        00455390
 00725D23    dec         eax
 00725D24    test        eax,eax
>00725D26    jl          00725D58
 00725D28    inc         eax
 00725D29    mov         dword ptr [ebp-8],eax
 00725D2C    xor         ebx,ebx
 00725D2E    lea         ecx,[ebp-10]
 00725D31    mov         edx,ebx
 00725D33    mov         eax,esi
 00725D35    mov         edi,dword ptr [eax]
 00725D37    call        dword ptr [edi+0C];TStrings.Get
 00725D3A    mov         eax,dword ptr [ebp-10]
 00725D3D    push        eax
 00725D3E    mov         edx,ebx
 00725D40    mov         eax,esi
 00725D42    mov         ecx,dword ptr [eax]
 00725D44    call        dword ptr [ecx+18];TStrings.sub_004483A0
 00725D47    mov         ecx,eax
 00725D49    mov         eax,dword ptr [ebp-4]
 00725D4C    pop         edx
 00725D4D    mov         edi,dword ptr [eax]
 00725D4F    call        dword ptr [edi+3C];TStringList.AddObject
 00725D52    inc         ebx
 00725D53    dec         dword ptr [ebp-8]
>00725D56    jne         00725D2E
 00725D58    mov         eax,dword ptr [ebp-4]
 00725D5B    call        TJvRecentStrings.DeleteExceed
 00725D60    xor         eax,eax
 00725D62    pop         edx
 00725D63    pop         ecx
 00725D64    pop         ecx
 00725D65    mov         dword ptr fs:[eax],edx
 00725D68    push        725D7D
 00725D6D    mov         eax,dword ptr [ebp-4]
 00725D70    call        TStrings.EndUpdate
 00725D75    ret
>00725D76    jmp         @HandleFinally
>00725D7B    jmp         00725D6D
 00725D7D    xor         eax,eax
 00725D7F    pop         edx
 00725D80    pop         ecx
 00725D81    pop         ecx
 00725D82    mov         dword ptr fs:[eax],edx
 00725D85    push        725D9F
 00725D8A    lea         eax,[ebp-10]
 00725D8D    mov         edx,2
 00725D92    call        @UStrArrayClr
 00725D97    ret
>00725D98    jmp         @HandleFinally
>00725D9D    jmp         00725D8A
 00725D9F    pop         edi
 00725DA0    pop         esi
 00725DA1    pop         ebx
 00725DA2    mov         esp,ebp
 00725DA4    pop         ebp
 00725DA5    ret
*}
end;

//00725DA8
procedure TJvMRUManager.SetMenuLocation(Value:TMenuLocation);
begin
{*
 00725DA8    cmp         dl,byte ptr [eax+0A1];TJvMRUManager.FMenuLocation:TMenuLocation
>00725DAE    je          00725DBB
 00725DB0    mov         byte ptr [eax+0A1],dl;TJvMRUManager.FMenuLocation:TMenuLocation
 00725DB6    call        TJvMRUManager.UpdateRecentMenu
 00725DBB    ret
*}
end;

//00725DBC
function TJvMRUManager.IsMenuEnabled:Boolean;
begin
{*
 00725DBC    push        ebx
 00725DBD    mov         ebx,eax
 00725DBF    cmp         byte ptr [ebx+0A1],0;TJvMRUManager.FMenuLocation:TMenuLocation
>00725DC6    jne         00725DD4
 00725DC8    mov         eax,dword ptr [ebx+54];TJvMRUManager.FRecentMenu:TMenuItem
 00725DCB    call        TMenuItem.GetCount
 00725DD0    test        eax,eax
>00725DD2    jg          00725DF1
 00725DD4    cmp         byte ptr [ebx+0A1],1;TJvMRUManager.FMenuLocation:TMenuLocation
>00725DDB    jne         00725DED
 00725DDD    mov         eax,ebx
 00725DDF    call        00724AE8
 00725DE4    mov         edx,dword ptr [eax]
 00725DE6    call        dword ptr [edx+14]
 00725DE9    test        eax,eax
>00725DEB    jg          00725DF1
 00725DED    xor         eax,eax
 00725DEF    pop         ebx
 00725DF0    ret
 00725DF1    mov         al,1
 00725DF3    pop         ebx
 00725DF4    ret
*}
end;

//00725DF8
procedure TJvMRUManager.SetMaxLength(Value:Integer);
begin
{*
 00725DF8    cmp         edx,dword ptr [eax+0A4];TJvMRUManager.FMaxLength:Integer
>00725DFE    je          00725E0B
 00725E00    mov         dword ptr [eax+0A4],edx;TJvMRUManager.FMaxLength:Integer
 00725E06    call        TJvMRUManager.UpdateRecentMenu
 00725E0B    ret
*}
end;

//00725E0C
{*function sub_00725E0C(?:TJvMRUManager):?;
begin
 00725E0C    push        ebx
 00725E0D    push        esi
 00725E0E    mov         ebx,eax
 00725E10    cmp         dword ptr [ebx+0A8],0
>00725E17    jne         00725E47
 00725E19    mov         dl,1
 00725E1B    mov         eax,[004612EC];TCanvas
 00725E20    call        TCanvas.Create;TCanvas.Create
 00725E25    mov         esi,eax
 00725E27    mov         dword ptr [ebx+0A8],esi
 00725E2D    cmp         dword ptr [ebx+54],0
>00725E31    je          00725E47
 00725E33    call        user32.GetDesktopWindow
 00725E38    push        eax
 00725E39    call        user32.GetDC
 00725E3E    mov         edx,eax
 00725E40    mov         eax,esi
 00725E42    call        TCanvas.SetHandle
 00725E47    mov         eax,dword ptr [ebx+0A8]
 00725E4D    pop         esi
 00725E4E    pop         ebx
 00725E4F    ret
end;*}

//00725E50
{*procedure sub_00725E50(?:TJvMRUManager; ?:?; ?:?);
begin
 00725E50    push        ebp
 00725E51    mov         ebp,esp
 00725E53    push        0
 00725E55    push        ebx
 00725E56    push        esi
 00725E57    push        edi
 00725E58    mov         ebx,ecx
 00725E5A    mov         edi,edx
 00725E5C    mov         esi,eax
 00725E5E    xor         eax,eax
 00725E60    push        ebp
 00725E61    push        725F26
 00725E66    push        dword ptr fs:[eax]
 00725E69    mov         dword ptr fs:[eax],esp
 00725E6C    mov         eax,ebx
 00725E6E    call        @UStrClr
 00725E73    cmp         dword ptr [esi+0A4],0;TJvMRUManager.FMaxLength:Integer
>00725E7A    jle         00725EF4
 00725E7C    cmp         byte ptr [esi+0AC],0;TJvMRUManager.FStartEllipsis:Boolean
>00725E83    jne         00725EB6
 00725E85    push        0
 00725E87    push        ebx
 00725E88    mov         eax,esi
 00725E8A    call        00725E0C
 00725E8F    mov         edx,725F40;'n'
 00725E94    call        TCustomCanvas.TextWidth
 00725E99    imul        dword ptr [esi+0A4];TJvMRUManager.FMaxLength:Integer
 00725E9F    push        eax
 00725EA0    mov         eax,esi
 00725EA2    call        00725E0C
 00725EA7    call        TCanvas.GetHandle
 00725EAC    mov         edx,edi
 00725EAE    pop         ecx
 00725EAF    call        0053AB70
>00725EB4    jmp         00725EF4
 00725EB6    mov         eax,edi
 00725EB8    call        @UStrLen
 00725EBD    cmp         eax,dword ptr [esi+0A4];TJvMRUManager.FMaxLength:Integer
>00725EC3    jle         00725EF4
 00725EC5    lea         eax,[ebp-4]
 00725EC8    push        eax
 00725EC9    mov         eax,edi
 00725ECB    call        @UStrLen
 00725ED0    mov         edx,eax
 00725ED2    sub         edx,dword ptr [esi+0A4]
 00725ED8    inc         edx
 00725ED9    mov         ecx,7FFFFFFF
 00725EDE    mov         eax,edi
 00725EE0    call        @UStrCopy
 00725EE5    mov         ecx,dword ptr [ebp-4]
 00725EE8    mov         eax,ebx
 00725EEA    mov         edx,725F50;'...'
 00725EEF    call        @UStrCat3
 00725EF4    mov         eax,dword ptr [ebx]
 00725EF6    mov         edx,725F50;'...'
 00725EFB    call        @UStrEqual
>00725F00    je          00725F07
 00725F02    cmp         dword ptr [ebx],0
>00725F05    jne         00725F10
 00725F07    mov         eax,ebx
 00725F09    mov         edx,edi
 00725F0B    call        @UStrAsg
 00725F10    xor         eax,eax
 00725F12    pop         edx
 00725F13    pop         ecx
 00725F14    pop         ecx
 00725F15    mov         dword ptr fs:[eax],edx
 00725F18    push        725F2D
 00725F1D    lea         eax,[ebp-4]
 00725F20    call        @UStrClr
 00725F25    ret
>00725F26    jmp         @HandleFinally
>00725F2B    jmp         00725F1D
 00725F2D    pop         edi
 00725F2E    pop         esi
 00725F2F    pop         ebx
 00725F30    pop         ecx
 00725F31    pop         ebp
 00725F32    ret
end;*}

//00725F58
procedure TJvMRUManager.SetStartEllipsis(Value:Boolean);
begin
{*
 00725F58    cmp         dl,byte ptr [eax+0AC];TJvMRUManager.FStartEllipsis:Boolean
>00725F5E    je          00725F6B
 00725F60    mov         byte ptr [eax+0AC],dl;TJvMRUManager.FStartEllipsis:Boolean
 00725F66    call        TJvMRUManager.UpdateRecentMenu
 00725F6B    ret
*}
end;

//007268C4
constructor sub_007268C4;
begin
{*
 007268C4    push        ebx
 007268C5    push        esi
 007268C6    test        dl,dl
>007268C8    je          007268D2
 007268CA    add         esp,0FFFFFFF0
 007268CD    call        @ClassCreate
 007268D2    mov         ebx,edx
 007268D4    mov         esi,eax
 007268D6    xor         edx,edx
 007268D8    mov         eax,esi
 007268DA    call        00550F14
 007268DF    mov         byte ptr [esi+1C],0;TJvAppIniStorageOptions.FReplaceCRLF:Boolean
 007268E3    mov         byte ptr [esi+1D],0;TJvAppIniStorageOptions.FPreserveLeadingTrailingBlanks:Boolean
 007268E7    xor         edx,edx
 007268E9    mov         eax,esi
 007268EB    mov         ecx,dword ptr [eax]
 007268ED    call        dword ptr [ecx+28];TJvAppStorageOptions.SetFloatAsString
 007268F0    mov         eax,esi
 007268F2    test        bl,bl
>007268F4    je          00726905
 007268F6    call        @AfterConstruction
 007268FB    pop         dword ptr fs:[0]
 00726902    add         esp,0C
 00726905    mov         eax,esi
 00726907    pop         esi
 00726908    pop         ebx
 00726909    ret
*}
end;

//0072690C
procedure TJvAppIniStorageOptions.Assign(Source:TPersistent);
begin
{*
 0072690C    push        ebx
 0072690D    push        esi
 0072690E    push        edi
 0072690F    mov         esi,edx
 00726911    mov         ebx,eax
 00726913    cmp         ebx,esi
>00726915    je          00726949
 00726917    mov         eax,esi
 00726919    mov         edx,dword ptr ds:[725F6C];TJvAppIniStorageOptions
 0072691F    call        @IsClass
 00726924    test        al,al
>00726926    je          00726940
 00726928    mov         edi,esi
 0072692A    movzx       edx,byte ptr [edi+1C]
 0072692E    mov         eax,ebx
 00726930    mov         ecx,dword ptr [eax]
 00726932    call        dword ptr [ecx+48];TJvAppIniStorageOptions.SetReplaceCRLF
 00726935    movzx       edx,byte ptr [edi+1D]
 00726939    mov         eax,ebx
 0072693B    mov         ecx,dword ptr [eax]
 0072693D    call        dword ptr [ecx+4C];TJvAppIniStorageOptions.SetPreserveLeadingTrailingBlanks
 00726940    mov         edx,esi
 00726942    mov         eax,ebx
 00726944    call        TJvCustomAppStorageOptions.Assign
 00726949    pop         edi
 0072694A    pop         esi
 0072694B    pop         ebx
 0072694C    ret
*}
end;

//00726950
procedure TJvAppIniStorageOptions.SetReplaceCRLF(Value:Boolean);
begin
{*
 00726950    mov         byte ptr [eax+1C],dl;TJvAppIniStorageOptions.FReplaceCRLF:Boolean
 00726953    ret
*}
end;

//00726954
procedure TJvAppIniStorageOptions.SetPreserveLeadingTrailingBlanks(Value:Boolean);
begin
{*
 00726954    mov         byte ptr [eax+1D],dl;TJvAppIniStorageOptions.FPreserveLeadingTrailingBlanks:Boolean
 00726957    ret
*}
end;

//00726958
constructor TJvCustomAppIniStorage.Create(AOwner:TComponent);
begin
{*
 00726958    push        ebx
 00726959    push        esi
 0072695A    test        dl,dl
>0072695C    je          00726966
 0072695E    add         esp,0FFFFFFF0
 00726961    call        @ClassCreate
 00726966    mov         ebx,edx
 00726968    mov         esi,eax
 0072696A    xor         edx,edx
 0072696C    mov         eax,esi
 0072696E    call        TJvCustomAppMemoryFileStorage.Create
 00726973    mov         ecx,dword ptr [esi+8];TJvCustomAppIniStorage.FName:TComponentName
 00726976    mov         dl,1
 00726978    mov         eax,[00459320];TMemIniFile
 0072697D    call        TMemIniFile.Create;TMemIniFile.Create
 00726982    mov         dword ptr [esi+178],eax;TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00726988    mov         eax,esi
 0072698A    test        bl,bl
>0072698C    je          0072699D
 0072698E    call        @AfterConstruction
 00726993    pop         dword ptr fs:[0]
 0072699A    add         esp,0C
 0072699D    mov         eax,esi
 0072699F    pop         esi
 007269A0    pop         ebx
 007269A1    ret
*}
end;

//007269A4
destructor TJvCustomAppIniStorage.Destroy();
begin
{*
 007269A4    push        ebx
 007269A5    push        esi
 007269A6    call        @BeforeDestruction
 007269AB    mov         ebx,edx
 007269AD    mov         esi,eax
 007269AF    mov         edx,ebx
 007269B1    and         dl,0FC
 007269B4    mov         eax,esi
 007269B6    call        TJvCustomAppStorage.Destroy
 007269BB    mov         eax,dword ptr [esi+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 007269C1    call        TObject.Free
 007269C6    test        bl,bl
>007269C8    jle         007269D1
 007269CA    mov         eax,esi
 007269CC    call        @ClassDestroy
 007269D1    pop         esi
 007269D2    pop         ebx
 007269D3    ret
*}
end;

//007269D4
{*procedure sub_007269D4(?:TJvCustomAppIniStorage; ?:?; ?:?);
begin
 007269D4    push        ebp
 007269D5    mov         ebp,esp
 007269D7    push        0
 007269D9    push        0
 007269DB    push        0
 007269DD    push        ebx
 007269DE    push        esi
 007269DF    mov         ebx,ecx
 007269E1    mov         esi,edx
 007269E3    xor         eax,eax
 007269E5    push        ebp
 007269E6    push        726ACA
 007269EB    push        dword ptr fs:[eax]
 007269EE    mov         dword ptr fs:[eax],esp
 007269F1    mov         edx,esi
 007269F3    mov         eax,726AE4;''
 007269F8    call        Pos
 007269FD    test        eax,eax
>007269FF    jg          00726A15
 00726A01    mov         edx,esi
 00726A03    mov         eax,726AF4;'
'
 00726A08    call        Pos
 00726A0D    test        eax,eax
>00726A0F    jle         00726AA6
 00726A15    movzx       eax,byte ptr ds:[726AF8];0x1 gvar_00726AF8
 00726A1C    push        eax
 00726A1D    push        ebx
 00726A1E    mov         ecx,726B08;^TIdUDPClient.InitComponent
 00726A23    mov         edx,726B1C;'\'
 00726A28    mov         eax,esi
 00726A2A    call        StringReplace
 00726A2F    movzx       eax,byte ptr ds:[726AF8];0x1 gvar_00726AF8
 00726A36    push        eax
 00726A37    lea         eax,[ebp-4]
 00726A3A    push        eax
 00726A3B    mov         eax,dword ptr [ebx]
 00726A3D    mov         ecx,726B2C;'\n'
 00726A42    mov         edx,726B40;'
'
 00726A47    call        StringReplace
 00726A4C    mov         edx,dword ptr [ebp-4]
 00726A4F    mov         eax,ebx
 00726A51    call        @UStrAsg
 00726A56    movzx       eax,byte ptr ds:[726AF8];0x1 gvar_00726AF8
 00726A5D    push        eax
 00726A5E    lea         eax,[ebp-8]
 00726A61    push        eax
 00726A62    mov         eax,dword ptr [ebx]
 00726A64    mov         ecx,726B2C;'\n'
 00726A69    mov         edx,726AF4;'
'
 00726A6E    call        StringReplace
 00726A73    mov         edx,dword ptr [ebp-8]
 00726A76    mov         eax,ebx
 00726A78    call        @UStrAsg
 00726A7D    movzx       eax,byte ptr ds:[726AF8];0x1 gvar_00726AF8
 00726A84    push        eax
 00726A85    lea         eax,[ebp-0C]
 00726A88    push        eax
 00726A89    mov         eax,dword ptr [ebx]
 00726A8B    mov         ecx,726B2C;'\n'
 00726A90    mov         edx,726AE4;''
 00726A95    call        StringReplace
 00726A9A    mov         edx,dword ptr [ebp-0C]
 00726A9D    mov         eax,ebx
 00726A9F    call        @UStrAsg
>00726AA4    jmp         00726AAF
 00726AA6    mov         eax,ebx
 00726AA8    mov         edx,esi
 00726AAA    call        @UStrAsg
 00726AAF    xor         eax,eax
 00726AB1    pop         edx
 00726AB2    pop         ecx
 00726AB3    pop         ecx
 00726AB4    mov         dword ptr fs:[eax],edx
 00726AB7    push        726AD1
 00726ABC    lea         eax,[ebp-0C]
 00726ABF    mov         edx,3
 00726AC4    call        @UStrArrayClr
 00726AC9    ret
>00726ACA    jmp         @HandleFinally
>00726ACF    jmp         00726ABC
 00726AD1    pop         esi
 00726AD2    pop         ebx
 00726AD3    mov         esp,ebp
 00726AD5    pop         ebp
 00726AD6    ret
end;*}

//00726B48
{*function sub_00726B48(?:?):?;
begin
 00726B48    push        ebp
 00726B49    mov         ebp,esp
 00726B4B    mov         eax,dword ptr [ebp+8]
 00726B4E    mov         eax,dword ptr [eax-4]
 00726B51    call        @UStrLen
 00726B56    mov         edx,dword ptr [ebp+8]
 00726B59    cmp         eax,dword ptr [edx-8]
 00726B5C    setge       al
 00726B5F    test        al,al
>00726B61    je          00726B92
 00726B63    mov         edx,dword ptr [ebp+8]
 00726B66    mov         edx,dword ptr [edx-8]
 00726B69    mov         ecx,dword ptr [ebp+8]
 00726B6C    mov         ecx,dword ptr [ecx-4]
 00726B6F    movzx       edx,word ptr [ecx+edx*2-2]
 00726B74    mov         ecx,dword ptr [ebp+8]
 00726B77    mov         word ptr [ecx-0A],dx
 00726B7B    mov         edx,dword ptr [ebp+8]
 00726B7E    mov         edx,dword ptr [edx-8]
 00726B81    mov         ecx,dword ptr [ebp+8]
 00726B84    mov         ecx,dword ptr [ecx-4]
 00726B87    movzx       edx,word ptr [ecx+edx*2]
 00726B8B    mov         ecx,dword ptr [ebp+8]
 00726B8E    mov         word ptr [ecx-0C],dx
 00726B92    mov         edx,dword ptr [ebp+8]
 00726B95    inc         dword ptr [edx-8]
 00726B98    pop         ebp
 00726B99    ret
end;*}

//00726B9C
{*procedure sub_00726B9C(?:TJvCustomAppIniStorage; ?:?; ?:?);
begin
 00726B9C    push        ebp
 00726B9D    mov         ebp,esp
 00726B9F    add         esp,0FFFFFFEC
 00726BA2    push        ebx
 00726BA3    xor         ebx,ebx
 00726BA5    mov         dword ptr [ebp-14],ebx
 00726BA8    mov         dword ptr [ebp-10],ebx
 00726BAB    mov         ebx,ecx
 00726BAD    mov         dword ptr [ebp-4],edx
 00726BB0    xor         eax,eax
 00726BB2    push        ebp
 00726BB3    push        726C57
 00726BB8    push        dword ptr fs:[eax]
 00726BBB    mov         dword ptr fs:[eax],esp
 00726BBE    mov         dword ptr [ebp-8],1
 00726BC5    mov         word ptr [ebp-0A],0
 00726BCB    mov         word ptr [ebp-0C],0
>00726BD1    jmp         00726C31
 00726BD3    cmp         word ptr [ebp-0A],5C
>00726BD8    jne         00726BFC
 00726BDA    cmp         word ptr [ebp-0C],5C
>00726BDF    jne         00726BFC
 00726BE1    lea         eax,[ebp-10]
 00726BE4    movzx       edx,word ptr [ebp-0A]
 00726BE8    call        @UStrFromWChar
 00726BED    mov         edx,dword ptr [ebp-10]
 00726BF0    mov         eax,ebx
 00726BF2    call        @UStrCat
 00726BF7    inc         dword ptr [ebp-8]
>00726BFA    jmp         00726C31
 00726BFC    cmp         word ptr [ebp-0A],5C
>00726C01    jne         00726C1B
 00726C03    cmp         word ptr [ebp-0C],6E
>00726C08    jne         00726C1B
 00726C0A    mov         eax,ebx
 00726C0C    mov         edx,726C70;'
'
 00726C11    call        @UStrCat
 00726C16    inc         dword ptr [ebp-8]
>00726C19    jmp         00726C31
 00726C1B    lea         eax,[ebp-14]
 00726C1E    movzx       edx,word ptr [ebp-0A]
 00726C22    call        @UStrFromWChar
 00726C27    mov         edx,dword ptr [ebp-14]
 00726C2A    mov         eax,ebx
 00726C2C    call        @UStrCat
 00726C31    push        ebp
 00726C32    call        00726B48
 00726C37    pop         ecx
 00726C38    test        al,al
>00726C3A    jne         00726BD3
 00726C3C    xor         eax,eax
 00726C3E    pop         edx
 00726C3F    pop         ecx
 00726C40    pop         ecx
 00726C41    mov         dword ptr fs:[eax],edx
 00726C44    push        726C5E
 00726C49    lea         eax,[ebp-14]
 00726C4C    mov         edx,2
 00726C51    call        @UStrArrayClr
 00726C56    ret
>00726C57    jmp         @HandleFinally
>00726C5C    jmp         00726C49
 00726C5E    pop         ebx
 00726C5F    mov         esp,ebp
 00726C61    pop         ebp
 00726C62    ret
end;*}

//00726C78
{*procedure sub_00726C78(?:TJvCustomAppIniStorage; ?:?; ?:?);
begin
 00726C78    push        ebx
 00726C79    push        esi
 00726C7A    push        edi
 00726C7B    mov         edi,ecx
 00726C7D    mov         ebx,edx
 00726C7F    test        ebx,ebx
>00726C81    jne         00726C8C
 00726C83    mov         eax,edi
 00726C85    call        @UStrClr
>00726C8A    jmp         00726CD5
 00726C8C    movzx       esi,word ptr [ebx]
 00726C8F    mov         eax,ebx
 00726C91    call        @UStrLen
 00726C96    movzx       eax,word ptr [ebx+eax*2-2]
 00726C9B    cmp         si,20
>00726C9F    je          00726CB3
 00726CA1    cmp         ax,20
>00726CA5    je          00726CB3
 00726CA7    cmp         si,22
>00726CAB    jne         00726CCC
 00726CAD    cmp         ax,22
>00726CB1    jne         00726CCC
 00726CB3    push        726CE8;'"'
 00726CB8    push        ebx
 00726CB9    push        726CE8;'"'
 00726CBE    mov         eax,edi
 00726CC0    mov         edx,3
 00726CC5    call        @UStrCatN
>00726CCA    jmp         00726CD5
 00726CCC    mov         eax,edi
 00726CCE    mov         edx,ebx
 00726CD0    call        @UStrAsg
 00726CD5    pop         edi
 00726CD6    pop         esi
 00726CD7    pop         ebx
 00726CD8    ret
end;*}

//00726CEC
{*procedure sub_00726CEC(?:TJvCustomAppIniStorage; ?:?; ?:?);
begin
 00726CEC    push        ebx
 00726CED    push        esi
 00726CEE    mov         esi,ecx
 00726CF0    mov         ebx,edx
 00726CF2    mov         eax,ebx
 00726CF4    call        @UStrLen
 00726CF9    cmp         eax,2
>00726CFC    jl          00726D2F
 00726CFE    cmp         word ptr [ebx],22
>00726D02    jne         00726D2F
 00726D04    mov         eax,ebx
 00726D06    call        @UStrLen
 00726D0B    cmp         word ptr [ebx+eax*2-2],22
>00726D11    jne         00726D2F
 00726D13    push        esi
 00726D14    mov         eax,ebx
 00726D16    call        @UStrLen
 00726D1B    mov         ecx,eax
 00726D1D    sub         ecx,2
 00726D20    mov         edx,2
 00726D25    mov         eax,ebx
 00726D27    call        @UStrCopy
 00726D2C    pop         esi
 00726D2D    pop         ebx
 00726D2E    ret
 00726D2F    mov         eax,esi
 00726D31    mov         edx,ebx
 00726D33    call        @UStrAsg
 00726D38    pop         esi
 00726D39    pop         ebx
 00726D3A    ret
end;*}

//00726D3C
{*procedure sub_00726D3C(?:?; ?:?; ?:?);
begin
 00726D3C    push        ebp
 00726D3D    mov         ebp,esp
 00726D3F    push        ebx
 00726D40    push        esi
 00726D41    push        edi
 00726D42    mov         esi,ecx
 00726D44    mov         edi,edx
 00726D46    mov         ebx,eax
 00726D48    test        esi,esi
>00726D4A    je          00726D50
 00726D4C    xor         eax,eax
 00726D4E    mov         dword ptr [esi],eax
 00726D50    mov         eax,dword ptr [ebp+8]
 00726D53    test        eax,eax
>00726D55    je          00726D5B
 00726D57    xor         edx,edx
 00726D59    mov         dword ptr [eax],edx
 00726D5B    mov         eax,dword ptr [ebp+8]
 00726D5E    call        @UStrClr
 00726D63    push        eax
 00726D64    mov         eax,esi
 00726D66    call        @UStrClr
 00726D6B    mov         ecx,eax
 00726D6D    mov         edx,edi
 00726D6F    mov         eax,ebx
 00726D71    call        0055175C
 00726D76    cmp         dword ptr [esi],0
>00726D79    jne         00726D88
 00726D7B    mov         eax,esi
 00726D7D    mov         edx,dword ptr [ebx+17C];TJvCustomAppIniStorage.FDefaultSection:string
 00726D83    call        @UStrAsg
 00726D88    pop         edi
 00726D89    pop         esi
 00726D8A    pop         ebx
 00726D8B    pop         ebp
 00726D8C    ret         4
end;*}

//00726D90
{*function sub_00726D90(?:?):?;
begin
 00726D90    push        ebp
 00726D91    mov         ebp,esp
 00726D93    push        0
 00726D95    push        0
 00726D97    push        ebx
 00726D98    push        esi
 00726D99    mov         esi,edx
 00726D9B    mov         ebx,eax
 00726D9D    xor         eax,eax
 00726D9F    push        ebp
 00726DA0    push        726DF1
 00726DA5    push        dword ptr fs:[eax]
 00726DA8    mov         dword ptr fs:[eax],esp
 00726DAB    lea         eax,[ebp-8]
 00726DAE    call        @UStrClr
 00726DB3    push        eax
 00726DB4    lea         eax,[ebp-4]
 00726DB7    call        @UStrClr
 00726DBC    mov         ecx,eax
 00726DBE    mov         edx,esi
 00726DC0    mov         eax,ebx
 00726DC2    mov         esi,dword ptr [eax]
 00726DC4    call        dword ptr [esi+3C];TJvCustomAppIniStorage.sub_00726D3C
 00726DC7    mov         ecx,dword ptr [ebp-8]
 00726DCA    mov         edx,dword ptr [ebp-4]
 00726DCD    mov         eax,ebx
 00726DCF    call        0072780C
 00726DD4    mov         ebx,eax
 00726DD6    xor         eax,eax
 00726DD8    pop         edx
 00726DD9    pop         ecx
 00726DDA    pop         ecx
 00726DDB    mov         dword ptr fs:[eax],edx
 00726DDE    push        726DF8
 00726DE3    lea         eax,[ebp-8]
 00726DE6    mov         edx,2
 00726DEB    call        @UStrArrayClr
 00726DF0    ret
>00726DF1    jmp         @HandleFinally
>00726DF6    jmp         00726DE3
 00726DF8    mov         eax,ebx
 00726DFA    pop         esi
 00726DFB    pop         ebx
 00726DFC    pop         ecx
 00726DFD    pop         ecx
 00726DFE    pop         ebp
 00726DFF    ret
end;*}

//00726E00
{*procedure sub_00726E00(?:?);
begin
 00726E00    push        ebp
 00726E01    mov         ebp,esp
 00726E03    push        0
 00726E05    push        0
 00726E07    push        ebx
 00726E08    push        esi
 00726E09    mov         esi,edx
 00726E0B    mov         ebx,eax
 00726E0D    xor         eax,eax
 00726E0F    push        ebp
 00726E10    push        726E62
 00726E15    push        dword ptr fs:[eax]
 00726E18    mov         dword ptr fs:[eax],esp
 00726E1B    lea         eax,[ebp-8]
 00726E1E    call        @UStrClr
 00726E23    push        eax
 00726E24    lea         eax,[ebp-4]
 00726E27    call        @UStrClr
 00726E2C    mov         ecx,eax
 00726E2E    mov         edx,esi
 00726E30    mov         eax,ebx
 00726E32    mov         esi,dword ptr [eax]
 00726E34    call        dword ptr [esi+3C];TJvCustomAppIniStorage.sub_00726D3C
 00726E37    mov         ecx,dword ptr [ebp-8]
 00726E3A    mov         edx,dword ptr [ebp-4]
 00726E3D    mov         eax,ebx
 00726E3F    mov         ebx,dword ptr [eax]
 00726E41    call        dword ptr [ebx+120];TJvCustomAppIniStorage.sub_00727C40
 00726E47    xor         eax,eax
 00726E49    pop         edx
 00726E4A    pop         ecx
 00726E4B    pop         ecx
 00726E4C    mov         dword ptr fs:[eax],edx
 00726E4F    push        726E69
 00726E54    lea         eax,[ebp-8]
 00726E57    mov         edx,2
 00726E5C    call        @UStrArrayClr
 00726E61    ret
>00726E62    jmp         @HandleFinally
>00726E67    jmp         00726E54
 00726E69    pop         esi
 00726E6A    pop         ebx
 00726E6B    pop         ecx
 00726E6C    pop         ecx
 00726E6D    pop         ebp
 00726E6E    ret
end;*}

//00726E70
{*function sub_00726E70(?:?; ?:?):?;
begin
 00726E70    push        ebp
 00726E71    mov         ebp,esp
 00726E73    push        0
 00726E75    push        0
 00726E77    push        0
 00726E79    push        0
 00726E7B    push        ebx
 00726E7C    push        esi
 00726E7D    mov         dword ptr [ebp-10],ecx
 00726E80    mov         esi,edx
 00726E82    mov         ebx,eax
 00726E84    xor         eax,eax
 00726E86    push        ebp
 00726E87    push        726F10
 00726E8C    push        dword ptr fs:[eax]
 00726E8F    mov         dword ptr fs:[eax],esp
 00726E92    lea         eax,[ebp-8]
 00726E95    call        @UStrClr
 00726E9A    push        eax
 00726E9B    lea         eax,[ebp-4]
 00726E9E    call        @UStrClr
 00726EA3    mov         ecx,eax
 00726EA5    mov         edx,esi
 00726EA7    mov         eax,ebx
 00726EA9    mov         esi,dword ptr [eax]
 00726EAB    call        dword ptr [esi+3C];TJvCustomAppIniStorage.sub_00726D3C
 00726EAE    mov         ecx,dword ptr [ebp-8]
 00726EB1    mov         edx,dword ptr [ebp-4]
 00726EB4    mov         eax,ebx
 00726EB6    call        0072780C
 00726EBB    test        al,al
>00726EBD    je          00726EF2
 00726EBF    lea         eax,[ebp-0C]
 00726EC2    push        eax
 00726EC3    mov         ecx,dword ptr [ebp-8]
 00726EC6    mov         edx,dword ptr [ebp-4]
 00726EC9    mov         eax,ebx
 00726ECB    mov         ebx,dword ptr [eax]
 00726ECD    call        dword ptr [ebx+118];TJvCustomAppIniStorage.sub_00727880
 00726ED3    cmp         dword ptr [ebp-0C],0
>00726ED7    jne         00726EE6
 00726ED9    lea         eax,[ebp-0C]
 00726EDC    mov         edx,726F2C;'0'
 00726EE1    call        @UStrLAsg
 00726EE6    mov         eax,dword ptr [ebp-0C]
 00726EE9    call        StrToInt
 00726EEE    mov         ebx,eax
>00726EF0    jmp         00726EF5
 00726EF2    mov         ebx,dword ptr [ebp-10]
 00726EF5    xor         eax,eax
 00726EF7    pop         edx
 00726EF8    pop         ecx
 00726EF9    pop         ecx
 00726EFA    mov         dword ptr fs:[eax],edx
 00726EFD    push        726F17
 00726F02    lea         eax,[ebp-0C]
 00726F05    mov         edx,3
 00726F0A    call        @UStrArrayClr
 00726F0F    ret
>00726F10    jmp         @HandleFinally
>00726F15    jmp         00726F02
 00726F17    mov         eax,ebx
 00726F19    pop         esi
 00726F1A    pop         ebx
 00726F1B    mov         esp,ebp
 00726F1D    pop         ebp
 00726F1E    ret
end;*}

//00726F30
{*procedure sub_00726F30(?:?; ?:?);
begin
 00726F30    push        ebp
 00726F31    mov         ebp,esp
 00726F33    push        0
 00726F35    push        0
 00726F37    push        0
 00726F39    push        0
 00726F3B    push        ebx
 00726F3C    push        esi
 00726F3D    mov         dword ptr [ebp-0C],ecx
 00726F40    mov         esi,edx
 00726F42    mov         ebx,eax
 00726F44    xor         eax,eax
 00726F46    push        ebp
 00726F47    push        726FB0
 00726F4C    push        dword ptr fs:[eax]
 00726F4F    mov         dword ptr fs:[eax],esp
 00726F52    lea         eax,[ebp-8]
 00726F55    call        @UStrClr
 00726F5A    push        eax
 00726F5B    lea         eax,[ebp-4]
 00726F5E    call        @UStrClr
 00726F63    mov         ecx,eax
 00726F65    mov         edx,esi
 00726F67    mov         eax,ebx
 00726F69    mov         esi,dword ptr [eax]
 00726F6B    call        dword ptr [esi+3C];TJvCustomAppIniStorage.sub_00726D3C
 00726F6E    lea         edx,[ebp-10]
 00726F71    mov         eax,dword ptr [ebp-0C]
 00726F74    call        IntToStr
 00726F79    mov         eax,dword ptr [ebp-10]
 00726F7C    push        eax
 00726F7D    mov         ecx,dword ptr [ebp-8]
 00726F80    mov         edx,dword ptr [ebp-4]
 00726F83    mov         eax,ebx
 00726F85    mov         ebx,dword ptr [eax]
 00726F87    call        dword ptr [ebx+11C];TJvCustomAppIniStorage.sub_00727978
 00726F8D    xor         eax,eax
 00726F8F    pop         edx
 00726F90    pop         ecx
 00726F91    pop         ecx
 00726F92    mov         dword ptr fs:[eax],edx
 00726F95    push        726FB7
 00726F9A    lea         eax,[ebp-10]
 00726F9D    call        @UStrClr
 00726FA2    lea         eax,[ebp-8]
 00726FA5    mov         edx,2
 00726FAA    call        @UStrArrayClr
 00726FAF    ret
>00726FB0    jmp         @HandleFinally
>00726FB5    jmp         00726F9A
 00726FB7    pop         esi
 00726FB8    pop         ebx
 00726FB9    mov         esp,ebp
 00726FBB    pop         ebp
 00726FBC    ret
end;*}

//00726FC0
{*procedure sub_00726FC0(?:?; ?:?; ?:?; ?:?);
begin
 00726FC0    push        ebp
 00726FC1    mov         ebp,esp
 00726FC3    add         esp,0FFFFFFE0
 00726FC6    push        ebx
 00726FC7    push        esi
 00726FC8    xor         ecx,ecx
 00726FCA    mov         dword ptr [ebp-4],ecx
 00726FCD    mov         dword ptr [ebp-8],ecx
 00726FD0    mov         dword ptr [ebp-0C],ecx
 00726FD3    mov         esi,edx
 00726FD5    mov         ebx,eax
 00726FD7    xor         eax,eax
 00726FD9    push        ebp
 00726FDA    push        727080
 00726FDF    push        dword ptr fs:[eax]
 00726FE2    mov         dword ptr fs:[eax],esp
 00726FE5    lea         eax,[ebp-8]
 00726FE8    call        @UStrClr
 00726FED    push        eax
 00726FEE    lea         eax,[ebp-4]
 00726FF1    call        @UStrClr
 00726FF6    mov         ecx,eax
 00726FF8    mov         edx,esi
 00726FFA    mov         eax,ebx
 00726FFC    mov         esi,dword ptr [eax]
 00726FFE    call        dword ptr [esi+3C];TJvCustomAppIniStorage.sub_00726D3C
 00727001    mov         ecx,dword ptr [ebp-8]
 00727004    mov         edx,dword ptr [ebp-4]
 00727007    mov         eax,ebx
 00727009    call        0072780C
 0072700E    test        al,al
>00727010    je          00727051
 00727012    lea         eax,[ebp-0C]
 00727015    push        eax
 00727016    mov         ecx,dword ptr [ebp-8]
 00727019    mov         edx,dword ptr [ebp-4]
 0072701C    mov         eax,ebx
 0072701E    mov         ebx,dword ptr [eax]
 00727020    call        dword ptr [ebx+118];TJvCustomAppIniStorage.sub_00727880
 00727026    lea         edx,[ebp-20]
 00727029    mov         ecx,0A
 0072702E    mov         eax,dword ptr [ebp-0C]
 00727031    call        0053FCD4
 00727036    cmp         eax,0A
>00727039    je          00727065
 0072703B    mov         eax,dword ptr [ebp+8]
 0072703E    mov         dword ptr [ebp-20],eax
 00727041    mov         eax,dword ptr [ebp+0C]
 00727044    mov         dword ptr [ebp-1C],eax
 00727047    mov         ax,word ptr [ebp+10]
 0072704B    mov         word ptr [ebp-18],ax
>0072704F    jmp         00727065
 00727051    mov         eax,dword ptr [ebp+8]
 00727054    mov         dword ptr [ebp-20],eax
 00727057    mov         eax,dword ptr [ebp+0C]
 0072705A    mov         dword ptr [ebp-1C],eax
 0072705D    mov         ax,word ptr [ebp+10]
 00727061    mov         word ptr [ebp-18],ax
 00727065    xor         eax,eax
 00727067    pop         edx
 00727068    pop         ecx
 00727069    pop         ecx
 0072706A    mov         dword ptr fs:[eax],edx
 0072706D    push        727087
 00727072    lea         eax,[ebp-0C]
 00727075    mov         edx,3
 0072707A    call        @UStrArrayClr
 0072707F    ret
>00727080    jmp         @HandleFinally
>00727085    jmp         00727072
 00727087    fld         tbyte ptr [ebp-20]
 0072708A    pop         esi
 0072708B    pop         ebx
 0072708C    mov         esp,ebp
 0072708E    pop         ebp
 0072708F    ret         0C
end;*}

//00727094
{*procedure sub_00727094(?:?; ?:?);
begin
 00727094    push        ebp
 00727095    mov         ebp,esp
 00727097    push        0
 00727099    push        0
 0072709B    push        0
 0072709D    push        ebx
 0072709E    push        esi
 0072709F    mov         esi,edx
 007270A1    mov         ebx,eax
 007270A3    xor         eax,eax
 007270A5    push        ebp
 007270A6    push        72710C
 007270AB    push        dword ptr fs:[eax]
 007270AE    mov         dword ptr fs:[eax],esp
 007270B1    lea         eax,[ebp-8]
 007270B4    call        @UStrClr
 007270B9    push        eax
 007270BA    lea         eax,[ebp-4]
 007270BD    call        @UStrClr
 007270C2    mov         ecx,eax
 007270C4    mov         edx,esi
 007270C6    mov         eax,ebx
 007270C8    mov         esi,dword ptr [eax]
 007270CA    call        dword ptr [esi+3C];TJvCustomAppIniStorage.sub_00726D3C
 007270CD    lea         ecx,[ebp-0C]
 007270D0    lea         eax,[ebp+8]
 007270D3    mov         edx,0A
 007270D8    call        0053FC5C
 007270DD    mov         eax,dword ptr [ebp-0C]
 007270E0    push        eax
 007270E1    mov         ecx,dword ptr [ebp-8]
 007270E4    mov         edx,dword ptr [ebp-4]
 007270E7    mov         eax,ebx
 007270E9    mov         ebx,dword ptr [eax]
 007270EB    call        dword ptr [ebx+11C];TJvCustomAppIniStorage.sub_00727978
 007270F1    xor         eax,eax
 007270F3    pop         edx
 007270F4    pop         ecx
 007270F5    pop         ecx
 007270F6    mov         dword ptr fs:[eax],edx
 007270F9    push        727113
 007270FE    lea         eax,[ebp-0C]
 00727101    mov         edx,3
 00727106    call        @UStrArrayClr
 0072710B    ret
>0072710C    jmp         @HandleFinally
>00727111    jmp         007270FE
 00727113    pop         esi
 00727114    pop         ebx
 00727115    mov         esp,ebp
 00727117    pop         ebp
 00727118    ret         0C
end;*}

//0072711C
{*procedure sub_0072711C(?:?; ?:?; ?:?);
begin
 0072711C    push        ebp
 0072711D    mov         ebp,esp
 0072711F    push        0
 00727121    push        0
 00727123    push        0
 00727125    push        ebx
 00727126    push        esi
 00727127    push        edi
 00727128    mov         dword ptr [ebp-0C],ecx
 0072712B    mov         edi,edx
 0072712D    mov         ebx,eax
 0072712F    mov         esi,dword ptr [ebp+8]
 00727132    xor         eax,eax
 00727134    push        ebp
 00727135    push        7271A5
 0072713A    push        dword ptr fs:[eax]
 0072713D    mov         dword ptr fs:[eax],esp
 00727140    lea         eax,[ebp-8]
 00727143    call        @UStrClr
 00727148    push        eax
 00727149    lea         eax,[ebp-4]
 0072714C    call        @UStrClr
 00727151    mov         ecx,eax
 00727153    mov         edx,edi
 00727155    mov         eax,ebx
 00727157    mov         edi,dword ptr [eax]
 00727159    call        dword ptr [edi+3C];TJvCustomAppIniStorage.sub_00726D3C
 0072715C    mov         ecx,dword ptr [ebp-8]
 0072715F    mov         edx,dword ptr [ebp-4]
 00727162    mov         eax,ebx
 00727164    call        0072780C
 00727169    test        al,al
>0072716B    je          00727180
 0072716D    push        esi
 0072716E    mov         ecx,dword ptr [ebp-8]
 00727171    mov         edx,dword ptr [ebp-4]
 00727174    mov         eax,ebx
 00727176    mov         ebx,dword ptr [eax]
 00727178    call        dword ptr [ebx+118];TJvCustomAppIniStorage.sub_00727880
>0072717E    jmp         0072718A
 00727180    mov         eax,esi
 00727182    mov         edx,dword ptr [ebp-0C]
 00727185    call        @UStrAsg
 0072718A    xor         eax,eax
 0072718C    pop         edx
 0072718D    pop         ecx
 0072718E    pop         ecx
 0072718F    mov         dword ptr fs:[eax],edx
 00727192    push        7271AC
 00727197    lea         eax,[ebp-8]
 0072719A    mov         edx,2
 0072719F    call        @UStrArrayClr
 007271A4    ret
>007271A5    jmp         @HandleFinally
>007271AA    jmp         00727197
 007271AC    pop         edi
 007271AD    pop         esi
 007271AE    pop         ebx
 007271AF    mov         esp,ebp
 007271B1    pop         ebp
 007271B2    ret         4
end;*}

//007271B8
{*procedure sub_007271B8(?:?; ?:?);
begin
 007271B8    push        ebp
 007271B9    mov         ebp,esp
 007271BB    push        0
 007271BD    push        0
 007271BF    push        0
 007271C1    push        ebx
 007271C2    push        esi
 007271C3    mov         dword ptr [ebp-0C],ecx
 007271C6    mov         esi,edx
 007271C8    mov         ebx,eax
 007271CA    xor         eax,eax
 007271CC    push        ebp
 007271CD    push        727223
 007271D2    push        dword ptr fs:[eax]
 007271D5    mov         dword ptr fs:[eax],esp
 007271D8    lea         eax,[ebp-8]
 007271DB    call        @UStrClr
 007271E0    push        eax
 007271E1    lea         eax,[ebp-4]
 007271E4    call        @UStrClr
 007271E9    mov         ecx,eax
 007271EB    mov         edx,esi
 007271ED    mov         eax,ebx
 007271EF    mov         esi,dword ptr [eax]
 007271F1    call        dword ptr [esi+3C];TJvCustomAppIniStorage.sub_00726D3C
 007271F4    mov         eax,dword ptr [ebp-0C]
 007271F7    push        eax
 007271F8    mov         ecx,dword ptr [ebp-8]
 007271FB    mov         edx,dword ptr [ebp-4]
 007271FE    mov         eax,ebx
 00727200    mov         ebx,dword ptr [eax]
 00727202    call        dword ptr [ebx+11C];TJvCustomAppIniStorage.sub_00727978
 00727208    xor         eax,eax
 0072720A    pop         edx
 0072720B    pop         ecx
 0072720C    pop         ecx
 0072720D    mov         dword ptr fs:[eax],edx
 00727210    push        72722A
 00727215    lea         eax,[ebp-8]
 00727218    mov         edx,2
 0072721D    call        @UStrArrayClr
 00727222    ret
>00727223    jmp         @HandleFinally
>00727228    jmp         00727215
 0072722A    pop         esi
 0072722B    pop         ebx
 0072722C    mov         esp,ebp
 0072722E    pop         ebp
 0072722F    ret
end;*}

//00727230
{*function sub_00727230(?:?; ?:?; ?:?):?;
begin
 00727230    push        ebp
 00727231    mov         ebp,esp
 00727233    push        0
 00727235    push        0
 00727237    push        0
 00727239    push        0
 0072723B    push        ebx
 0072723C    push        esi
 0072723D    mov         dword ptr [ebp-10],ecx
 00727240    mov         esi,edx
 00727242    mov         ebx,eax
 00727244    xor         eax,eax
 00727246    push        ebp
 00727247    push        7272C2
 0072724C    push        dword ptr fs:[eax]
 0072724F    mov         dword ptr fs:[eax],esp
 00727252    lea         eax,[ebp-8]
 00727255    call        @UStrClr
 0072725A    push        eax
 0072725B    lea         eax,[ebp-4]
 0072725E    call        @UStrClr
 00727263    mov         ecx,eax
 00727265    mov         edx,esi
 00727267    mov         eax,ebx
 00727269    mov         esi,dword ptr [eax]
 0072726B    call        dword ptr [esi+3C];TJvCustomAppIniStorage.sub_00726D3C
 0072726E    mov         ecx,dword ptr [ebp-8]
 00727271    mov         edx,dword ptr [ebp-4]
 00727274    mov         eax,ebx
 00727276    call        0072780C
 0072727B    test        al,al
>0072727D    je          007272A5
 0072727F    lea         eax,[ebp-0C]
 00727282    push        eax
 00727283    mov         ecx,dword ptr [ebp-8]
 00727286    mov         edx,dword ptr [ebp-4]
 00727289    mov         eax,ebx
 0072728B    mov         ebx,dword ptr [eax]
 0072728D    call        dword ptr [ebx+118];TJvCustomAppIniStorage.sub_00727880
 00727293    mov         ecx,dword ptr [ebp+8]
 00727296    mov         edx,dword ptr [ebp-10]
 00727299    mov         eax,dword ptr [ebp-0C]
 0072729C    call        0053FCD4
 007272A1    mov         ebx,eax
>007272A3    jmp         007272A7
 007272A5    xor         ebx,ebx
 007272A7    xor         eax,eax
 007272A9    pop         edx
 007272AA    pop         ecx
 007272AB    pop         ecx
 007272AC    mov         dword ptr fs:[eax],edx
 007272AF    push        7272C9
 007272B4    lea         eax,[ebp-0C]
 007272B7    mov         edx,3
 007272BC    call        @UStrArrayClr
 007272C1    ret
>007272C2    jmp         @HandleFinally
>007272C7    jmp         007272B4
 007272C9    mov         eax,ebx
 007272CB    pop         esi
 007272CC    pop         ebx
 007272CD    mov         esp,ebp
 007272CF    pop         ebp
 007272D0    ret         4
end;*}

//007272D4
{*procedure sub_007272D4(?:?; ?:?; ?:?);
begin
 007272D4    push        ebp
 007272D5    mov         ebp,esp
 007272D7    push        0
 007272D9    push        0
 007272DB    push        0
 007272DD    push        0
 007272DF    push        ebx
 007272E0    push        esi
 007272E1    mov         dword ptr [ebp-0C],ecx
 007272E4    mov         esi,edx
 007272E6    mov         ebx,eax
 007272E8    xor         eax,eax
 007272EA    push        ebp
 007272EB    push        727357
 007272F0    push        dword ptr fs:[eax]
 007272F3    mov         dword ptr fs:[eax],esp
 007272F6    lea         eax,[ebp-8]
 007272F9    call        @UStrClr
 007272FE    push        eax
 007272FF    lea         eax,[ebp-4]
 00727302    call        @UStrClr
 00727307    mov         ecx,eax
 00727309    mov         edx,esi
 0072730B    mov         eax,ebx
 0072730D    mov         esi,dword ptr [eax]
 0072730F    call        dword ptr [esi+3C];TJvCustomAppIniStorage.sub_00726D3C
 00727312    lea         ecx,[ebp-10]
 00727315    mov         edx,dword ptr [ebp+8]
 00727318    mov         eax,dword ptr [ebp-0C]
 0072731B    call        0053FC5C
 00727320    mov         eax,dword ptr [ebp-10]
 00727323    push        eax
 00727324    mov         ecx,dword ptr [ebp-8]
 00727327    mov         edx,dword ptr [ebp-4]
 0072732A    mov         eax,ebx
 0072732C    mov         ebx,dword ptr [eax]
 0072732E    call        dword ptr [ebx+11C];TJvCustomAppIniStorage.sub_00727978
 00727334    xor         eax,eax
 00727336    pop         edx
 00727337    pop         ecx
 00727338    pop         ecx
 00727339    mov         dword ptr fs:[eax],edx
 0072733C    push        72735E
 00727341    lea         eax,[ebp-10]
 00727344    call        @UStrClr
 00727349    lea         eax,[ebp-8]
 0072734C    mov         edx,2
 00727351    call        @UStrArrayClr
 00727356    ret
>00727357    jmp         @HandleFinally
>0072735C    jmp         00727341
 0072735E    pop         esi
 0072735F    pop         ebx
 00727360    mov         esp,ebp
 00727362    pop         ebp
 00727363    ret         4
end;*}

//00727368
{*procedure sub_00727368(?:?; ?:?; ?:?);
begin
 00727368    push        ebp
 00727369    mov         ebp,esp
 0072736B    add         esp,0FFFFFFDC
 0072736E    push        ebx
 0072736F    push        esi
 00727370    xor         ebx,ebx
 00727372    mov         dword ptr [ebp-20],ebx
 00727375    mov         dword ptr [ebp-24],ebx
 00727378    mov         dword ptr [ebp-4],ebx
 0072737B    mov         dword ptr [ebp-8],ebx
 0072737E    mov         dword ptr [ebp-0C],ecx
 00727381    mov         esi,edx
 00727383    mov         ebx,eax
 00727385    xor         eax,eax
 00727387    push        ebp
 00727388    push        72753A
 0072738D    push        dword ptr fs:[eax]
 00727390    mov         dword ptr fs:[eax],esp
 00727393    mov         dl,1
 00727395    mov         eax,[0043C7BC];TStringList
 0072739A    call        TStringList.Create;TStringList.Create
 0072739F    mov         dword ptr [ebp-14],eax
 007273A2    mov         eax,dword ptr [ebp-0C]
 007273A5    call        TStrings.BeginUpdate
 007273AA    xor         eax,eax
 007273AC    push        ebp
 007273AD    push        72750B
 007273B2    push        dword ptr fs:[eax]
 007273B5    mov         dword ptr fs:[eax],esp
 007273B8    lea         ecx,[ebp-4]
 007273BB    mov         edx,esi
 007273BD    mov         eax,ebx
 007273BF    call        00551840
 007273C4    mov         eax,ebx
 007273C6    call        TJvCustomAppStorage.ReloadIfNeeded
 007273CB    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 007273D1    mov         edx,dword ptr [ebp-14]
 007273D4    mov         ecx,dword ptr [eax]
 007273D6    call        dword ptr [ecx+48];TMemIniFile.ReadSections
 007273D9    mov         eax,dword ptr [ebp-4]
 007273DC    call        @UStrLen
 007273E1    mov         dword ptr [ebp-18],eax
 007273E4    mov         eax,dword ptr [ebp-14]
 007273E7    mov         edx,dword ptr [eax]
 007273E9    call        dword ptr [edx+14];TStringList.GetCount
 007273EC    dec         eax
 007273ED    test        eax,eax
>007273EF    jl          007274ED
 007273F5    inc         eax
 007273F6    mov         dword ptr [ebp-1C],eax
 007273F9    mov         dword ptr [ebp-10],0
 00727400    lea         ecx,[ebp-8]
 00727403    mov         edx,dword ptr [ebp-10]
 00727406    mov         eax,dword ptr [ebp-14]
 00727409    mov         esi,dword ptr [eax]
 0072740B    call        dword ptr [esi+0C];TStringList.Get
 0072740E    cmp         dword ptr [ebp-4],0
>00727412    je          0072744C
 00727414    lea         eax,[ebp-20]
 00727417    push        eax
 00727418    mov         ecx,dword ptr [ebp-18]
 0072741B    inc         ecx
 0072741C    mov         edx,1
 00727421    mov         eax,dword ptr [ebp-8]
 00727424    call        @UStrCopy
 00727429    mov         eax,dword ptr [ebp-20]
 0072742C    push        eax
 0072742D    lea         eax,[ebp-24]
 00727430    mov         ecx,727558;'\'
 00727435    mov         edx,dword ptr [ebp-4]
 00727438    call        @UStrCat3
 0072743D    mov         edx,dword ptr [ebp-24]
 00727440    pop         eax
 00727441    call        @UStrEqual
>00727446    jne         007274E1
 0072744C    cmp         byte ptr [ebp+8],0
>00727450    je          00727465
 00727452    mov         ecx,727568;'Count'
 00727457    mov         edx,dword ptr [ebp-8]
 0072745A    mov         eax,ebx
 0072745C    call        0072780C
 00727461    test        al,al
>00727463    jne         007274E1
 00727465    cmp         dword ptr [ebp-4],0
>00727469    je          0072748A
 0072746B    lea         eax,[ebp-8]
 0072746E    push        eax
 0072746F    mov         eax,dword ptr [ebp-8]
 00727472    call        @UStrLen
 00727477    mov         ecx,eax
 00727479    sub         ecx,dword ptr [ebp-18]
 0072747C    mov         edx,dword ptr [ebp-18]
 0072747F    add         edx,2
 00727482    mov         eax,dword ptr [ebp-8]
 00727485    call        @UStrCopy
 0072748A    mov         edx,dword ptr [ebp-8]
 0072748D    mov         eax,727558;'\'
 00727492    call        Pos
 00727497    mov         esi,eax
 00727499    test        esi,esi
>0072749B    jle         007274B1
 0072749D    lea         eax,[ebp-8]
 007274A0    push        eax
 007274A1    mov         ecx,esi
 007274A3    dec         ecx
 007274A4    mov         edx,1
 007274A9    mov         eax,dword ptr [ebp-8]
 007274AC    call        @UStrCopy
 007274B1    cmp         dword ptr [ebp-4],0
>007274B5    jne         007274C7
 007274B7    mov         eax,dword ptr [ebp-8]
 007274BA    mov         edx,dword ptr [ebx+17C];TJvCustomAppIniStorage.FDefaultSection:string
 007274C0    call        @UStrEqual
>007274C5    je          007274E1
 007274C7    mov         edx,dword ptr [ebp-8]
 007274CA    mov         eax,dword ptr [ebp-0C]
 007274CD    mov         ecx,dword ptr [eax]
 007274CF    call        dword ptr [ecx+54]
 007274D2    test        eax,eax
>007274D4    jge         007274E1
 007274D6    mov         edx,dword ptr [ebp-8]
 007274D9    mov         eax,dword ptr [ebp-0C]
 007274DC    mov         ecx,dword ptr [eax]
 007274DE    call        dword ptr [ecx+38]
 007274E1    inc         dword ptr [ebp-10]
 007274E4    dec         dword ptr [ebp-1C]
>007274E7    jne         00727400
 007274ED    xor         eax,eax
 007274EF    pop         edx
 007274F0    pop         ecx
 007274F1    pop         ecx
 007274F2    mov         dword ptr fs:[eax],edx
 007274F5    push        727512
 007274FA    mov         eax,dword ptr [ebp-0C]
 007274FD    call        TStrings.EndUpdate
 00727502    mov         eax,dword ptr [ebp-14]
 00727505    call        TObject.Free
 0072750A    ret
>0072750B    jmp         @HandleFinally
>00727510    jmp         007274FA
 00727512    xor         eax,eax
 00727514    pop         edx
 00727515    pop         ecx
 00727516    pop         ecx
 00727517    mov         dword ptr fs:[eax],edx
 0072751A    push        727541
 0072751F    lea         eax,[ebp-24]
 00727522    mov         edx,2
 00727527    call        @UStrArrayClr
 0072752C    lea         eax,[ebp-8]
 0072752F    mov         edx,2
 00727534    call        @UStrArrayClr
 00727539    ret
>0072753A    jmp         @HandleFinally
>0072753F    jmp         0072751F
 00727541    pop         esi
 00727542    pop         ebx
 00727543    mov         esp,ebp
 00727545    pop         ebp
 00727546    ret         4
end;*}

//00727574
{*procedure sub_00727574(?:?; ?:?; ?:?);
begin
 00727574    push        ebp
 00727575    mov         ebp,esp
 00727577    push        0
 00727579    push        0
 0072757B    push        0
 0072757D    push        0
 0072757F    push        0
 00727581    push        0
 00727583    push        0
 00727585    push        0
 00727587    push        ebx
 00727588    push        esi
 00727589    push        edi
 0072758A    mov         dword ptr [ebp-8],ecx
 0072758D    mov         ebx,edx
 0072758F    mov         esi,eax
 00727591    xor         eax,eax
 00727593    push        ebp
 00727594    push        72770D
 00727599    push        dword ptr fs:[eax]
 0072759C    mov         dword ptr fs:[eax],esp
 0072759F    mov         eax,dword ptr [ebp-8]
 007275A2    call        TStrings.BeginUpdate
 007275A7    xor         eax,eax
 007275A9    push        ebp
 007275AA    push        7276E3
 007275AF    push        dword ptr fs:[eax]
 007275B2    mov         dword ptr fs:[eax],esp
 007275B5    cmp         byte ptr [ebp+8],0
>007275B9    je          007275CD
 007275BB    mov         ecx,72772C;'Item'
 007275C0    mov         edx,ebx
 007275C2    mov         eax,esi
 007275C4    call        TJvCustomAppStorage.ListStored
 007275C9    test        al,al
>007275CB    jne         007275D1
 007275CD    xor         eax,eax
>007275CF    jmp         007275D3
 007275D1    mov         al,1
 007275D3    mov         byte ptr [ebp-9],al
 007275D6    lea         ecx,[ebp-4]
 007275D9    mov         edx,ebx
 007275DB    mov         eax,esi
 007275DD    call        00551840
 007275E2    cmp         dword ptr [ebp-4],0
>007275E6    jne         007275F6
 007275E8    lea         eax,[ebp-4]
 007275EB    mov         edx,dword ptr [esi+17C];TJvCustomAppIniStorage.FDefaultSection:string
 007275F1    call        @UStrLAsg
 007275F6    mov         eax,esi
 007275F8    call        TJvCustomAppStorage.ReloadIfNeeded
 007275FD    mov         eax,dword ptr [esi+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727603    mov         ecx,dword ptr [ebp-8]
 00727606    mov         edx,dword ptr [ebp-4]
 00727609    mov         ebx,dword ptr [eax]
 0072760B    call        dword ptr [ebx+54];TMemIniFile.ReadSectionValues
 0072760E    mov         eax,dword ptr [ebp-8]
 00727611    mov         edx,dword ptr [eax]
 00727613    call        dword ptr [edx+14]
 00727616    mov         ebx,eax
 00727618    dec         ebx
 00727619    cmp         ebx,0
>0072761C    jl          007276BD
 00727622    lea         eax,[ebp-10]
 00727625    push        eax
 00727626    lea         ecx,[ebp-14]
 00727629    mov         edx,ebx
 0072762B    mov         eax,dword ptr [ebp-8]
 0072762E    mov         edi,dword ptr [eax]
 00727630    call        dword ptr [edi+0C]
 00727633    mov         edx,dword ptr [ebp-14]
 00727636    mov         eax,727744;'='
 0072763B    call        Pos
 00727640    dec         eax
 00727641    push        eax
 00727642    lea         ecx,[ebp-18]
 00727645    mov         edx,ebx
 00727647    mov         eax,dword ptr [ebp-8]
 0072764A    mov         edi,dword ptr [eax]
 0072764C    call        dword ptr [edi+0C]
 0072764F    mov         eax,dword ptr [ebp-18]
 00727652    mov         edx,1
 00727657    pop         ecx
 00727658    call        @UStrCopy
 0072765D    mov         ecx,dword ptr [ebp-10]
 00727660    mov         edx,ebx
 00727662    mov         eax,dword ptr [ebp-8]
 00727665    mov         edi,dword ptr [eax]
 00727667    call        dword ptr [edi+20]
 0072766A    cmp         byte ptr [ebp-9],0
>0072766E    je          007276B3
 00727670    lea         ecx,[ebp-1C]
 00727673    mov         edx,ebx
 00727675    mov         eax,dword ptr [ebp-8]
 00727678    mov         edi,dword ptr [eax]
 0072767A    call        dword ptr [edi+0C]
 0072767D    mov         edx,dword ptr [ebp-1C]
 00727680    mov         eax,727754;'Count'
 00727685    call        AnsiSameText
 0072768A    test        al,al
>0072768C    jne         007276A9
 0072768E    lea         ecx,[ebp-20]
 00727691    mov         edx,ebx
 00727693    mov         eax,dword ptr [ebp-8]
 00727696    mov         edi,dword ptr [eax]
 00727698    call        dword ptr [edi+0C]
 0072769B    mov         edx,dword ptr [ebp-20]
 0072769E    mov         eax,dword ptr [esi]
 007276A0    call        0055394C
 007276A5    test        al,al
>007276A7    je          007276B3
 007276A9    mov         edx,ebx
 007276AB    mov         eax,dword ptr [ebp-8]
 007276AE    mov         ecx,dword ptr [eax]
 007276B0    call        dword ptr [ecx+48]
 007276B3    dec         ebx
 007276B4    cmp         ebx,0FFFFFFFF
>007276B7    jne         00727622
 007276BD    cmp         byte ptr [ebp-9],0
>007276C1    je          007276CD
 007276C3    xor         edx,edx
 007276C5    mov         eax,dword ptr [ebp-8]
 007276C8    mov         ecx,dword ptr [eax]
 007276CA    call        dword ptr [ecx+38]
 007276CD    xor         eax,eax
 007276CF    pop         edx
 007276D0    pop         ecx
 007276D1    pop         ecx
 007276D2    mov         dword ptr fs:[eax],edx
 007276D5    push        7276EA
 007276DA    mov         eax,dword ptr [ebp-8]
 007276DD    call        TStrings.EndUpdate
 007276E2    ret
>007276E3    jmp         @HandleFinally
>007276E8    jmp         007276DA
 007276EA    xor         eax,eax
 007276EC    pop         edx
 007276ED    pop         ecx
 007276EE    pop         ecx
 007276EF    mov         dword ptr fs:[eax],edx
 007276F2    push        727714
 007276F7    lea         eax,[ebp-20]
 007276FA    mov         edx,5
 007276FF    call        @UStrArrayClr
 00727704    lea         eax,[ebp-4]
 00727707    call        @UStrClr
 0072770C    ret
>0072770D    jmp         @HandleFinally
>00727712    jmp         007276F7
 00727714    pop         edi
 00727715    pop         esi
 00727716    pop         ebx
 00727717    mov         esp,ebp
 00727719    pop         ebp
 0072771A    ret         4
end;*}

//00727760
procedure sub_00727760(?:TJvCustomAppIniStorage; ?:UnicodeString; ?:UnicodeString);
begin
{*
 00727760    push        ebp
 00727761    mov         ebp,esp
 00727763    push        ecx
 00727764    push        ebx
 00727765    push        esi
 00727766    mov         ebx,ecx
 00727768    mov         dword ptr [ebp-4],edx
 0072776B    mov         esi,eax
 0072776D    mov         eax,dword ptr [ebp-4]
 00727770    call        @UStrAddRef
 00727775    xor         eax,eax
 00727777    push        ebp
 00727778    push        7277E8
 0072777D    push        dword ptr fs:[eax]
 00727780    mov         dword ptr fs:[eax],esp
 00727783    cmp         dword ptr [ebp-4],0
>00727787    je          00727792
 00727789    mov         eax,dword ptr [ebp-4]
 0072778C    cmp         word ptr [eax],2E
>00727790    jne         007277A4
 00727792    mov         eax,ebx
 00727794    mov         ecx,dword ptr [ebp-4]
 00727797    mov         edx,dword ptr [esi+17C]
 0072779D    call        @UStrCat3
>007277A2    jmp         007277AE
 007277A4    mov         eax,ebx
 007277A6    mov         edx,dword ptr [ebp-4]
 007277A9    call        @UStrAsg
 007277AE    cmp         dword ptr [ebx],0
>007277B1    je          007277BB
 007277B3    mov         eax,dword ptr [ebx]
 007277B5    cmp         word ptr [eax],2E
>007277B9    jne         007277D2
 007277BB    mov         ecx,dword ptr ds:[78CE18];^SResString317:TResStringRec
 007277C1    mov         dl,1
 007277C3    mov         eax,[0054D11C];EJVCLAppStorageError
 007277C8    call        Exception.CreateRes;EJVCLAppStorageError.Create
 007277CD    call        @RaiseExcept
 007277D2    xor         eax,eax
 007277D4    pop         edx
 007277D5    pop         ecx
 007277D6    pop         ecx
 007277D7    mov         dword ptr fs:[eax],edx
 007277DA    push        7277EF
 007277DF    lea         eax,[ebp-4]
 007277E2    call        @UStrClr
 007277E7    ret
>007277E8    jmp         @HandleFinally
>007277ED    jmp         007277DF
 007277EF    pop         esi
 007277F0    pop         ebx
 007277F1    pop         ecx
 007277F2    pop         ebp
 007277F3    ret
*}
end;

//007277F4
{*function TJvCustomAppIniStorage.GetStorageOptions:?;
begin
 007277F4    mov         eax,dword ptr [eax+104];TJvCustomAppIniStorage.FStorageOptions:TJvCustomAppStorageOption...
 007277FA    ret
end;*}

//007277FC
procedure TJvCustomAppIniStorage.SetStorageOptions(Value:TJvAppIniStorageOptions);
begin
{*
 007277FC    push        esi
 007277FD    mov         esi,eax
 007277FF    mov         eax,dword ptr [esi+104];TJvCustomAppIniStorage.FStorageOptions:TJvCustomAppStorageOption...
 00727805    mov         ecx,dword ptr [eax]
 00727807    call        dword ptr [ecx+8];TJvCustomAppStorageOptions.Assign
 0072780A    pop         esi
 0072780B    ret
*}
end;

//0072780C
{*function sub_0072780C(?:TJvCustomAppIniStorage; ?:UnicodeString; ?:UnicodeString):?;
begin
 0072780C    push        ebp
 0072780D    mov         ebp,esp
 0072780F    push        0
 00727811    push        ebx
 00727812    push        esi
 00727813    push        edi
 00727814    mov         edi,ecx
 00727816    mov         esi,edx
 00727818    mov         ebx,eax
 0072781A    xor         eax,eax
 0072781C    push        ebp
 0072781D    push        727870
 00727822    push        dword ptr fs:[eax]
 00727825    mov         dword ptr fs:[eax],esp
 00727828    cmp         dword ptr [ebx+178],0;TJvCustomAppIniStorage.FIniFile:TMemIniFile
>0072782F    je          00727858
 00727831    mov         eax,ebx
 00727833    call        TJvCustomAppStorage.ReloadIfNeeded
 00727838    lea         ecx,[ebp-4]
 0072783B    mov         edx,esi
 0072783D    mov         eax,ebx
 0072783F    call        00727760
 00727844    mov         edx,dword ptr [ebp-4]
 00727847    mov         ecx,edi
 00727849    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 0072784F    mov         ebx,dword ptr [eax]
 00727851    call        dword ptr [ebx+64];TCustomIniFile.ValueExists
 00727854    mov         ebx,eax
>00727856    jmp         0072785A
 00727858    xor         ebx,ebx
 0072785A    xor         eax,eax
 0072785C    pop         edx
 0072785D    pop         ecx
 0072785E    pop         ecx
 0072785F    mov         dword ptr fs:[eax],edx
 00727862    push        727877
 00727867    lea         eax,[ebp-4]
 0072786A    call        @UStrClr
 0072786F    ret
>00727870    jmp         @HandleFinally
>00727875    jmp         00727867
 00727877    mov         eax,ebx
 00727879    pop         edi
 0072787A    pop         esi
 0072787B    pop         ebx
 0072787C    pop         ecx
 0072787D    pop         ebp
 0072787E    ret
end;*}

//00727880
{*procedure sub_00727880(?:?; ?:?; ?:?);
begin
 00727880    push        ebp
 00727881    mov         ebp,esp
 00727883    push        0
 00727885    push        0
 00727887    push        0
 00727889    push        0
 0072788B    push        0
 0072788D    push        0
 0072788F    push        ebx
 00727890    push        esi
 00727891    push        edi
 00727892    mov         dword ptr [ebp-8],ecx
 00727895    mov         dword ptr [ebp-4],edx
 00727898    mov         ebx,eax
 0072789A    mov         esi,dword ptr [ebp+8]
 0072789D    xor         eax,eax
 0072789F    push        ebp
 007278A0    push        727966
 007278A5    push        dword ptr fs:[eax]
 007278A8    mov         dword ptr fs:[eax],esp
 007278AB    cmp         dword ptr [ebx+178],0;TJvCustomAppIniStorage.FIniFile:TMemIniFile
>007278B2    je          00727944
 007278B8    mov         eax,ebx
 007278BA    call        TJvCustomAppStorage.ReloadIfNeeded
 007278BF    mov         eax,ebx
 007278C1    call        TJvCustomAppIniStorage.GetStorageOptions
 007278C6    cmp         byte ptr [eax+1C],0
>007278CA    je          007278FE
 007278CC    push        0
 007278CE    lea         eax,[ebp-0C]
 007278D1    push        eax
 007278D2    lea         ecx,[ebp-10]
 007278D5    mov         edx,dword ptr [ebp-4]
 007278D8    mov         eax,ebx
 007278DA    call        00727760
 007278DF    mov         edx,dword ptr [ebp-10]
 007278E2    mov         ecx,dword ptr [ebp-8]
 007278E5    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 007278EB    mov         edi,dword ptr [eax]
 007278ED    call        dword ptr [edi+4];TMemIniFile.ReadString
 007278F0    mov         edx,dword ptr [ebp-0C]
 007278F3    mov         ecx,esi
 007278F5    mov         eax,ebx
 007278F7    call        00726B9C
>007278FC    jmp         0072791F
 007278FE    push        0
 00727900    push        esi
 00727901    lea         ecx,[ebp-14]
 00727904    mov         edx,dword ptr [ebp-4]
 00727907    mov         eax,ebx
 00727909    call        00727760
 0072790E    mov         edx,dword ptr [ebp-14]
 00727911    mov         ecx,dword ptr [ebp-8]
 00727914    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 0072791A    mov         edi,dword ptr [eax]
 0072791C    call        dword ptr [edi+4];TMemIniFile.ReadString
 0072791F    mov         eax,ebx
 00727921    call        TJvCustomAppIniStorage.GetStorageOptions
 00727926    cmp         byte ptr [eax+1D],0
>0072792A    je          0072794B
 0072792C    lea         ecx,[ebp-18]
 0072792F    mov         edx,dword ptr [esi]
 00727931    mov         eax,ebx
 00727933    call        00726CEC
 00727938    mov         edx,dword ptr [ebp-18]
 0072793B    mov         eax,esi
 0072793D    call        @UStrAsg
>00727942    jmp         0072794B
 00727944    mov         eax,esi
 00727946    call        @UStrClr
 0072794B    xor         eax,eax
 0072794D    pop         edx
 0072794E    pop         ecx
 0072794F    pop         ecx
 00727950    mov         dword ptr fs:[eax],edx
 00727953    push        72796D
 00727958    lea         eax,[ebp-18]
 0072795B    mov         edx,4
 00727960    call        @UStrArrayClr
 00727965    ret
>00727966    jmp         @HandleFinally
>0072796B    jmp         00727958
 0072796D    pop         edi
 0072796E    pop         esi
 0072796F    pop         ebx
 00727970    mov         esp,ebp
 00727972    pop         ebp
 00727973    ret         4
end;*}

//00727978
{*procedure sub_00727978(?:?; ?:?; ?:?);
begin
 00727978    push        ebp
 00727979    mov         ebp,esp
 0072797B    push        0
 0072797D    push        0
 0072797F    push        0
 00727981    push        0
 00727983    push        0
 00727985    push        0
 00727987    push        0
 00727989    push        0
 0072798B    push        ebx
 0072798C    push        esi
 0072798D    push        edi
 0072798E    mov         edi,ecx
 00727990    mov         esi,edx
 00727992    mov         ebx,eax
 00727994    xor         eax,eax
 00727996    push        ebp
 00727997    push        727ABC
 0072799C    push        dword ptr fs:[eax]
 0072799F    mov         dword ptr fs:[eax],esp
 007279A2    cmp         dword ptr [ebx+178],0;TJvCustomAppIniStorage.FIniFile:TMemIniFile
>007279A9    je          00727AA1
 007279AF    mov         eax,ebx
 007279B1    call        TJvCustomAppStorage.ReloadIfNeeded
 007279B6    mov         eax,ebx
 007279B8    call        TJvCustomAppIniStorage.GetStorageOptions
 007279BD    cmp         byte ptr [eax+1D],0
>007279C1    je          00727A3E
 007279C3    mov         eax,ebx
 007279C5    call        TJvCustomAppIniStorage.GetStorageOptions
 007279CA    cmp         byte ptr [eax+1C],0
>007279CE    je          00727A0F
 007279D0    lea         ecx,[ebp-8]
 007279D3    mov         edx,dword ptr [ebp+8]
 007279D6    mov         eax,ebx
 007279D8    call        007269D4
 007279DD    mov         edx,dword ptr [ebp-8]
 007279E0    lea         ecx,[ebp-4]
 007279E3    mov         eax,ebx
 007279E5    call        00726C78
 007279EA    mov         eax,dword ptr [ebp-4]
 007279ED    push        eax
 007279EE    lea         ecx,[ebp-0C]
 007279F1    mov         edx,esi
 007279F3    mov         eax,ebx
 007279F5    call        00727760
 007279FA    mov         edx,dword ptr [ebp-0C]
 007279FD    mov         ecx,edi
 007279FF    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727A05    mov         esi,dword ptr [eax]
 00727A07    call        dword ptr [esi+8];TMemIniFile.WriteString
>00727A0A    jmp         00727A9A
 00727A0F    lea         ecx,[ebp-10]
 00727A12    mov         edx,dword ptr [ebp+8]
 00727A15    mov         eax,ebx
 00727A17    call        00726C78
 00727A1C    mov         eax,dword ptr [ebp-10]
 00727A1F    push        eax
 00727A20    lea         ecx,[ebp-14]
 00727A23    mov         edx,esi
 00727A25    mov         eax,ebx
 00727A27    call        00727760
 00727A2C    mov         edx,dword ptr [ebp-14]
 00727A2F    mov         ecx,edi
 00727A31    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727A37    mov         esi,dword ptr [eax]
 00727A39    call        dword ptr [esi+8];TMemIniFile.WriteString
>00727A3C    jmp         00727A9A
 00727A3E    mov         eax,ebx
 00727A40    call        TJvCustomAppIniStorage.GetStorageOptions
 00727A45    cmp         byte ptr [eax+1C],0
>00727A49    je          00727A7A
 00727A4B    lea         ecx,[ebp-18]
 00727A4E    mov         edx,dword ptr [ebp+8]
 00727A51    mov         eax,ebx
 00727A53    call        007269D4
 00727A58    mov         eax,dword ptr [ebp-18]
 00727A5B    push        eax
 00727A5C    lea         ecx,[ebp-1C]
 00727A5F    mov         edx,esi
 00727A61    mov         eax,ebx
 00727A63    call        00727760
 00727A68    mov         edx,dword ptr [ebp-1C]
 00727A6B    mov         ecx,edi
 00727A6D    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727A73    mov         esi,dword ptr [eax]
 00727A75    call        dword ptr [esi+8];TMemIniFile.WriteString
>00727A78    jmp         00727A9A
 00727A7A    mov         eax,dword ptr [ebp+8]
 00727A7D    push        eax
 00727A7E    lea         ecx,[ebp-20]
 00727A81    mov         edx,esi
 00727A83    mov         eax,ebx
 00727A85    call        00727760
 00727A8A    mov         edx,dword ptr [ebp-20]
 00727A8D    mov         ecx,edi
 00727A8F    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727A95    mov         esi,dword ptr [eax]
 00727A97    call        dword ptr [esi+8];TMemIniFile.WriteString
 00727A9A    mov         eax,ebx
 00727A9C    call        TJvCustomAppStorage.FlushIfNeeded
 00727AA1    xor         eax,eax
 00727AA3    pop         edx
 00727AA4    pop         ecx
 00727AA5    pop         ecx
 00727AA6    mov         dword ptr fs:[eax],edx
 00727AA9    push        727AC3
 00727AAE    lea         eax,[ebp-20]
 00727AB1    mov         edx,8
 00727AB6    call        @UStrArrayClr
 00727ABB    ret
>00727ABC    jmp         @HandleFinally
>00727AC1    jmp         00727AAE
 00727AC3    pop         edi
 00727AC4    pop         esi
 00727AC5    pop         ebx
 00727AC6    mov         esp,ebp
 00727AC8    pop         ebp
 00727AC9    ret         4
end;*}

//00727ACC
{*procedure sub_00727ACC(?:?);
begin
 00727ACC    push        ebp
 00727ACD    mov         ebp,esp
 00727ACF    xor         ecx,ecx
 00727AD1    push        ecx
 00727AD2    push        ecx
 00727AD3    push        ecx
 00727AD4    push        ecx
 00727AD5    push        ecx
 00727AD6    push        ecx
 00727AD7    push        ebx
 00727AD8    push        esi
 00727AD9    push        edi
 00727ADA    mov         esi,edx
 00727ADC    mov         ebx,eax
 00727ADE    xor         eax,eax
 00727AE0    push        ebp
 00727AE1    push        727C2F
 00727AE6    push        dword ptr fs:[eax]
 00727AE9    mov         dword ptr fs:[eax],esp
 00727AEC    cmp         dword ptr [ebx+178],0;TJvCustomAppIniStorage.FIniFile:TMemIniFile
>00727AF3    je          00727C0C
 00727AF9    lea         ecx,[ebp-4]
 00727AFC    mov         edx,esi
 00727AFE    mov         eax,ebx
 00727B00    call        00551840
 00727B05    mov         dl,1
 00727B07    mov         eax,[0043C7BC];TStringList
 00727B0C    call        TStringList.Create;TStringList.Create
 00727B11    mov         dword ptr [ebp-8],eax
 00727B14    xor         eax,eax
 00727B16    push        ebp
 00727B17    push        727C05
 00727B1C    push        dword ptr fs:[eax]
 00727B1F    mov         dword ptr fs:[eax],esp
 00727B22    cmp         byte ptr [ebx+134],0;TJvCustomAppIniStorage.FAutoReload:Boolean
>00727B29    je          00727B40
 00727B2B    mov         eax,ebx
 00727B2D    call        0055720C
 00727B32    test        al,al
>00727B34    jne         00727B40
 00727B36    mov         eax,ebx
 00727B38    mov         edx,dword ptr [eax]
 00727B3A    call        dword ptr [edx+0F0];TJvCustomAppMemoryFileStorage.Reload
 00727B40    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727B46    mov         edx,dword ptr [ebp-8]
 00727B49    mov         ecx,dword ptr [eax]
 00727B4B    call        dword ptr [ecx+48];TMemIniFile.ReadSections
 00727B4E    cmp         dword ptr [ebp-4],0
>00727B52    jne         00727B93
 00727B54    mov         eax,dword ptr [ebp-8]
 00727B57    mov         edx,dword ptr [eax]
 00727B59    call        dword ptr [edx+14];TStringList.GetCount
 00727B5C    mov         esi,eax
 00727B5E    dec         esi
 00727B5F    test        esi,esi
>00727B61    jl          00727BE8
 00727B67    inc         esi
 00727B68    mov         dword ptr [ebp-0C],0
 00727B6F    lea         ecx,[ebp-10]
 00727B72    mov         edx,dword ptr [ebp-0C]
 00727B75    mov         eax,dword ptr [ebp-8]
 00727B78    mov         edi,dword ptr [eax]
 00727B7A    call        dword ptr [edi+0C];TStringList.Get
 00727B7D    mov         edx,dword ptr [ebp-10]
 00727B80    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727B86    mov         ecx,dword ptr [eax]
 00727B88    call        dword ptr [ecx+58];TMemIniFile.EraseSection
 00727B8B    inc         dword ptr [ebp-0C]
 00727B8E    dec         esi
>00727B8F    jne         00727B6F
>00727B91    jmp         00727BE8
 00727B93    mov         eax,dword ptr [ebp-8]
 00727B96    mov         edx,dword ptr [eax]
 00727B98    call        dword ptr [edx+14];TStringList.GetCount
 00727B9B    mov         esi,eax
 00727B9D    dec         esi
 00727B9E    test        esi,esi
>00727BA0    jl          00727BE8
 00727BA2    inc         esi
 00727BA3    mov         dword ptr [ebp-0C],0
 00727BAA    lea         ecx,[ebp-14]
 00727BAD    mov         edx,dword ptr [ebp-0C]
 00727BB0    mov         eax,dword ptr [ebp-8]
 00727BB3    mov         edi,dword ptr [eax]
 00727BB5    call        dword ptr [edi+0C];TStringList.Get
 00727BB8    mov         edx,dword ptr [ebp-14]
 00727BBB    mov         eax,dword ptr [ebp-4]
 00727BBE    call        Pos
 00727BC3    dec         eax
>00727BC4    jne         00727BE2
 00727BC6    lea         ecx,[ebp-18]
 00727BC9    mov         edx,dword ptr [ebp-0C]
 00727BCC    mov         eax,dword ptr [ebp-8]
 00727BCF    mov         edi,dword ptr [eax]
 00727BD1    call        dword ptr [edi+0C];TStringList.Get
 00727BD4    mov         edx,dword ptr [ebp-18]
 00727BD7    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727BDD    mov         ecx,dword ptr [eax]
 00727BDF    call        dword ptr [ecx+58];TMemIniFile.EraseSection
 00727BE2    inc         dword ptr [ebp-0C]
 00727BE5    dec         esi
>00727BE6    jne         00727BAA
 00727BE8    mov         eax,ebx
 00727BEA    call        TJvCustomAppStorage.FlushIfNeeded
 00727BEF    xor         eax,eax
 00727BF1    pop         edx
 00727BF2    pop         ecx
 00727BF3    pop         ecx
 00727BF4    mov         dword ptr fs:[eax],edx
 00727BF7    push        727C0C
 00727BFC    mov         eax,dword ptr [ebp-8]
 00727BFF    call        TObject.Free
 00727C04    ret
>00727C05    jmp         @HandleFinally
>00727C0A    jmp         00727BFC
 00727C0C    xor         eax,eax
 00727C0E    pop         edx
 00727C0F    pop         ecx
 00727C10    pop         ecx
 00727C11    mov         dword ptr fs:[eax],edx
 00727C14    push        727C36
 00727C19    lea         eax,[ebp-18]
 00727C1C    mov         edx,3
 00727C21    call        @UStrArrayClr
 00727C26    lea         eax,[ebp-4]
 00727C29    call        @UStrClr
 00727C2E    ret
>00727C2F    jmp         @HandleFinally
>00727C34    jmp         00727C19
 00727C36    pop         edi
 00727C37    pop         esi
 00727C38    pop         ebx
 00727C39    mov         esp,ebp
 00727C3B    pop         ebp
 00727C3C    ret
end;*}

//00727C40
{*procedure sub_00727C40(?:?; ?:?);
begin
 00727C40    push        ebp
 00727C41    mov         ebp,esp
 00727C43    push        0
 00727C45    push        0
 00727C47    push        0
 00727C49    push        ebx
 00727C4A    push        esi
 00727C4B    push        edi
 00727C4C    mov         esi,ecx
 00727C4E    mov         edi,edx
 00727C50    mov         ebx,eax
 00727C52    xor         eax,eax
 00727C54    push        ebp
 00727C55    push        727D1B
 00727C5A    push        dword ptr fs:[eax]
 00727C5D    mov         dword ptr fs:[eax],esp
 00727C60    cmp         dword ptr [ebx+178],0;TJvCustomAppIniStorage.FIniFile:TMemIniFile
>00727C67    je          00727D00
 00727C6D    mov         eax,ebx
 00727C6F    call        TJvCustomAppStorage.ReloadIfNeeded
 00727C74    lea         ecx,[ebp-4]
 00727C77    mov         edx,edi
 00727C79    mov         eax,ebx
 00727C7B    call        00727760
 00727C80    mov         ecx,esi
 00727C82    mov         edx,dword ptr [ebp-4]
 00727C85    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727C8B    mov         edi,dword ptr [eax]
 00727C8D    call        dword ptr [edi+64];TCustomIniFile.ValueExists
 00727C90    test        al,al
>00727C92    je          00727CAD
 00727C94    mov         ecx,esi
 00727C96    mov         edx,dword ptr [ebp-4]
 00727C99    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727C9F    mov         esi,dword ptr [eax]
 00727CA1    call        dword ptr [esi+5C];TMemIniFile.DeleteKey
 00727CA4    mov         eax,ebx
 00727CA6    call        TJvCustomAppStorage.FlushIfNeeded
>00727CAB    jmp         00727D00
 00727CAD    push        dword ptr [ebp-4]
 00727CB0    push        727D38;'\'
 00727CB5    push        esi
 00727CB6    lea         eax,[ebp-8]
 00727CB9    mov         edx,3
 00727CBE    call        @UStrCatN
 00727CC3    mov         edx,dword ptr [ebp-8]
 00727CC6    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727CCC    call        TCustomIniFile.SectionExists
 00727CD1    test        al,al
>00727CD3    je          00727D00
 00727CD5    push        dword ptr [ebp-4]
 00727CD8    push        727D38;'\'
 00727CDD    push        esi
 00727CDE    lea         eax,[ebp-0C]
 00727CE1    mov         edx,3
 00727CE6    call        @UStrCatN
 00727CEB    mov         edx,dword ptr [ebp-0C]
 00727CEE    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727CF4    mov         ecx,dword ptr [eax]
 00727CF6    call        dword ptr [ecx+58];TMemIniFile.EraseSection
 00727CF9    mov         eax,ebx
 00727CFB    call        TJvCustomAppStorage.FlushIfNeeded
 00727D00    xor         eax,eax
 00727D02    pop         edx
 00727D03    pop         ecx
 00727D04    pop         ecx
 00727D05    mov         dword ptr fs:[eax],edx
 00727D08    push        727D22
 00727D0D    lea         eax,[ebp-0C]
 00727D10    mov         edx,3
 00727D15    call        @UStrArrayClr
 00727D1A    ret
>00727D1B    jmp         @HandleFinally
>00727D20    jmp         00727D0D
 00727D22    pop         edi
 00727D23    pop         esi
 00727D24    pop         ebx
 00727D25    mov         esp,ebp
 00727D27    pop         ebp
 00727D28    ret
end;*}

//00727D3C
{*function sub_00727D3C(?:?):?;
begin
 00727D3C    push        ebp
 00727D3D    mov         ebp,esp
 00727D3F    push        0
 00727D41    push        ebx
 00727D42    push        esi
 00727D43    mov         esi,edx
 00727D45    mov         ebx,eax
 00727D47    xor         eax,eax
 00727D49    push        ebp
 00727D4A    push        727D91
 00727D4F    push        dword ptr fs:[eax]
 00727D52    mov         dword ptr fs:[eax],esp
 00727D55    mov         eax,ebx
 00727D57    call        TJvCustomAppStorage.ReloadIfNeeded
 00727D5C    lea         ecx,[ebp-4]
 00727D5F    mov         edx,esi
 00727D61    mov         eax,727DAC;'\'
 00727D66    call        00538C70
 00727D6B    mov         edx,dword ptr [ebp-4]
 00727D6E    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727D74    call        TCustomIniFile.SectionExists
 00727D79    mov         ebx,eax
 00727D7B    xor         eax,eax
 00727D7D    pop         edx
 00727D7E    pop         ecx
 00727D7F    pop         ecx
 00727D80    mov         dword ptr fs:[eax],edx
 00727D83    push        727D98
 00727D88    lea         eax,[ebp-4]
 00727D8B    call        @UStrClr
 00727D90    ret
>00727D91    jmp         @HandleFinally
>00727D96    jmp         00727D88
 00727D98    mov         eax,ebx
 00727D9A    pop         esi
 00727D9B    pop         ebx
 00727D9C    pop         ecx
 00727D9D    pop         ebp
 00727D9E    ret
end;*}

//00727DB0
{*function sub_00727DB0(?:?; ?:?):?;
begin
 00727DB0    push        ebp
 00727DB1    mov         ebp,esp
 00727DB3    push        0
 00727DB5    push        0
 00727DB7    push        0
 00727DB9    push        0
 00727DBB    push        0
 00727DBD    push        0
 00727DBF    push        0
 00727DC1    push        0
 00727DC3    push        ebx
 00727DC4    push        esi
 00727DC5    push        edi
 00727DC6    mov         byte ptr [ebp-5],cl
 00727DC9    mov         ebx,edx
 00727DCB    mov         esi,eax
 00727DCD    xor         eax,eax
 00727DCF    push        ebp
 00727DD0    push        727FAB
 00727DD5    push        dword ptr fs:[eax]
 00727DD8    mov         dword ptr fs:[eax],esp
 00727DDB    lea         ecx,[ebp-4]
 00727DDE    mov         edx,ebx
 00727DE0    mov         eax,esi
 00727DE2    call        00551840
 00727DE7    cmp         dword ptr [ebp-4],0
>00727DEB    jne         00727DFB
 00727DED    lea         eax,[ebp-4]
 00727DF0    mov         edx,dword ptr [esi+17C];TJvCustomAppIniStorage.FDefaultSection:string
 00727DF6    call        @UStrLAsg
 00727DFB    mov         eax,esi
 00727DFD    call        TJvCustomAppStorage.ReloadIfNeeded
 00727E02    mov         eax,dword ptr [esi+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727E08    mov         edx,dword ptr [ebp-4]
 00727E0B    call        TCustomIniFile.SectionExists
 00727E10    test        al,al
>00727E12    je          00727EEE
 00727E18    cmp         byte ptr [ebp-5],0
>00727E1C    je          00727EE5
 00727E22    mov         eax,dword ptr [esi+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727E28    mov         ecx,727FCC;'Count'
 00727E2D    mov         edx,dword ptr [ebp-4]
 00727E30    mov         edi,dword ptr [eax]
 00727E32    call        dword ptr [edi+64];TCustomIniFile.ValueExists
 00727E35    test        al,al
>00727E37    je          00727EE5
 00727E3D    mov         dl,1
 00727E3F    mov         eax,[0043C7BC];TStringList
 00727E44    call        TStringList.Create;TStringList.Create
 00727E49    mov         dword ptr [ebp-0C],eax
 00727E4C    xor         eax,eax
 00727E4E    push        ebp
 00727E4F    push        727EDE
 00727E54    push        dword ptr fs:[eax]
 00727E57    mov         dword ptr fs:[eax],esp
 00727E5A    push        1
 00727E5C    mov         ecx,dword ptr [ebp-0C]
 00727E5F    mov         edx,ebx
 00727E61    mov         eax,esi
 00727E63    mov         ebx,dword ptr [eax]
 00727E65    call        dword ptr [ebx+44];TJvCustomAppIniStorage.sub_00727574
 00727E68    mov         eax,dword ptr [ebp-0C]
 00727E6B    mov         edx,dword ptr [eax]
 00727E6D    call        dword ptr [edx+14];TStringList.GetCount
 00727E70    mov         ebx,eax
 00727E72    dec         ebx
 00727E73    test        ebx,ebx
 00727E75    setg        byte ptr [ebp-6]
>00727E79    jmp         00727EBE
 00727E7B    lea         ecx,[ebp-14]
 00727E7E    mov         edx,ebx
 00727E80    mov         eax,dword ptr [ebp-0C]
 00727E83    mov         edi,dword ptr [eax]
 00727E85    call        dword ptr [edi+0C];TStringList.Get
 00727E88    mov         eax,dword ptr [ebp-14]
 00727E8B    mov         edx,727FCC;'Count'
 00727E90    call        AnsiSameText
 00727E95    test        al,al
>00727E97    jne         00727EB4
 00727E99    lea         ecx,[ebp-18]
 00727E9C    mov         edx,ebx
 00727E9E    mov         eax,dword ptr [ebp-0C]
 00727EA1    mov         edi,dword ptr [eax]
 00727EA3    call        dword ptr [edi+0C];TStringList.Get
 00727EA6    mov         edx,dword ptr [ebp-18]
 00727EA9    mov         eax,dword ptr [esi]
 00727EAB    call        0055394C
 00727EB0    test        al,al
>00727EB2    je          00727EB8
 00727EB4    xor         eax,eax
>00727EB6    jmp         00727EBA
 00727EB8    mov         al,1
 00727EBA    mov         byte ptr [ebp-6],al
 00727EBD    dec         ebx
 00727EBE    cmp         byte ptr [ebp-6],0
>00727EC2    je          00727EC8
 00727EC4    test        ebx,ebx
>00727EC6    jge         00727E7B
 00727EC8    xor         eax,eax
 00727ECA    pop         edx
 00727ECB    pop         ecx
 00727ECC    pop         ecx
 00727ECD    mov         dword ptr fs:[eax],edx
 00727ED0    push        727F88
 00727ED5    mov         eax,dword ptr [ebp-0C]
 00727ED8    call        TObject.Free
 00727EDD    ret
>00727EDE    jmp         @HandleFinally
>00727EE3    jmp         00727ED5
 00727EE5    mov         byte ptr [ebp-6],1
>00727EE9    jmp         00727F88
 00727EEE    mov         dl,1
 00727EF0    mov         eax,[0043C7BC];TStringList
 00727EF5    call        TStringList.Create;TStringList.Create
 00727EFA    mov         dword ptr [ebp-10],eax
 00727EFD    xor         eax,eax
 00727EFF    push        ebp
 00727F00    push        727F81
 00727F05    push        dword ptr fs:[eax]
 00727F08    mov         dword ptr fs:[eax],esp
 00727F0B    mov         eax,dword ptr [esi+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 00727F11    mov         edx,dword ptr [ebp-10]
 00727F14    mov         ecx,dword ptr [eax]
 00727F16    call        dword ptr [ecx+48];TMemIniFile.ReadSections
 00727F19    mov         eax,dword ptr [ebp-10]
 00727F1C    mov         edx,dword ptr [eax]
 00727F1E    call        dword ptr [edx+14];TStringList.GetCount
 00727F21    mov         esi,eax
 00727F23    dec         esi
 00727F24    test        esi,esi
>00727F26    jl          00727F67
 00727F28    inc         esi
 00727F29    xor         ebx,ebx
 00727F2B    lea         ecx,[ebp-1C]
 00727F2E    mov         edx,ebx
 00727F30    mov         eax,dword ptr [ebp-10]
 00727F33    mov         edi,dword ptr [eax]
 00727F35    call        dword ptr [edi+0C];TStringList.Get
 00727F38    mov         eax,dword ptr [ebp-1C]
 00727F3B    push        eax
 00727F3C    lea         eax,[ebp-20]
 00727F3F    mov         ecx,727FE4;'\'
 00727F44    mov         edx,dword ptr [ebp-4]
 00727F47    call        @UStrCat3
 00727F4C    mov         eax,dword ptr [ebp-20]
 00727F4F    pop         edx
 00727F50    call        Pos
 00727F55    dec         eax
>00727F56    jne         00727F63
 00727F58    mov         byte ptr [ebp-6],1
 00727F5C    call        @TryFinallyExit
>00727F61    jmp         00727F88
 00727F63    inc         ebx
 00727F64    dec         esi
>00727F65    jne         00727F2B
 00727F67    mov         byte ptr [ebp-6],0
 00727F6B    xor         eax,eax
 00727F6D    pop         edx
 00727F6E    pop         ecx
 00727F6F    pop         ecx
 00727F70    mov         dword ptr fs:[eax],edx
 00727F73    push        727F88
 00727F78    mov         eax,dword ptr [ebp-10]
 00727F7B    call        TObject.Free
 00727F80    ret
>00727F81    jmp         @HandleFinally
>00727F86    jmp         00727F78
 00727F88    xor         eax,eax
 00727F8A    pop         edx
 00727F8B    pop         ecx
 00727F8C    pop         ecx
 00727F8D    mov         dword ptr fs:[eax],edx
 00727F90    push        727FB2
 00727F95    lea         eax,[ebp-20]
 00727F98    mov         edx,4
 00727F9D    call        @UStrArrayClr
 00727FA2    lea         eax,[ebp-4]
 00727FA5    call        @UStrClr
 00727FAA    ret
>00727FAB    jmp         @HandleFinally
>00727FB0    jmp         00727F95
 00727FB2    movzx       eax,byte ptr [ebp-6]
 00727FB6    pop         edi
 00727FB7    pop         esi
 00727FB8    pop         ebx
 00727FB9    mov         esp,ebp
 00727FBB    pop         ebp
 00727FBC    ret
end;*}

//00727FE8
constructor TJvAppIniStorageOptions.Create;
begin
{*
 00727FE8    mov         eax,[00725F6C];TJvAppIniStorageOptions
 00727FED    ret
*}
end;

//00727FF0
{*procedure sub_00727FF0(?:?);
begin
 00727FF0    push        ebp
 00727FF1    mov         ebp,esp
 00727FF3    push        ecx
 00727FF4    push        ebx
 00727FF5    push        esi
 00727FF6    mov         esi,edx
 00727FF8    mov         ebx,eax
 00727FFA    mov         dl,1
 00727FFC    mov         eax,[0043C7BC];TStringList
 00728001    call        TStringList.Create;TStringList.Create
 00728006    mov         dword ptr [ebp-4],eax
 00728009    xor         eax,eax
 0072800B    push        ebp
 0072800C    push        728045
 00728011    push        dword ptr fs:[eax]
 00728014    mov         dword ptr fs:[eax],esp
 00728017    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 0072801D    mov         edx,dword ptr [ebp-4]
 00728020    call        TMemIniFile.GetStrings
 00728025    mov         edx,esi
 00728027    mov         eax,dword ptr [ebp-4]
 0072802A    mov         ecx,dword ptr [eax]
 0072802C    call        dword ptr [ecx+1C];TStrings.GetTextStr
 0072802F    xor         eax,eax
 00728031    pop         edx
 00728032    pop         ecx
 00728033    pop         ecx
 00728034    mov         dword ptr fs:[eax],edx
 00728037    push        72804C
 0072803C    mov         eax,dword ptr [ebp-4]
 0072803F    call        TObject.Free
 00728044    ret
>00728045    jmp         @HandleFinally
>0072804A    jmp         0072803C
 0072804C    pop         esi
 0072804D    pop         ebx
 0072804E    pop         ecx
 0072804F    pop         ebp
 00728050    ret
end;*}

//0072806C
{*procedure sub_0072806C(?:?);
begin
 0072806C    push        ebp
 0072806D    mov         ebp,esp
 0072806F    push        ecx
 00728070    push        ebx
 00728071    push        esi
 00728072    mov         esi,edx
 00728074    mov         ebx,eax
 00728076    mov         dl,1
 00728078    mov         eax,[0043C7BC];TStringList
 0072807D    call        TStringList.Create;TStringList.Create
 00728082    mov         dword ptr [ebp-4],eax
 00728085    xor         eax,eax
 00728087    push        ebp
 00728088    push        7280C1
 0072808D    push        dword ptr fs:[eax]
 00728090    mov         dword ptr fs:[eax],esp
 00728093    mov         edx,esi
 00728095    mov         eax,dword ptr [ebp-4]
 00728098    mov         ecx,dword ptr [eax]
 0072809A    call        dword ptr [ecx+2C];TStrings.SetTextStr
 0072809D    mov         eax,dword ptr [ebx+178];TJvCustomAppIniStorage.FIniFile:TMemIniFile
 007280A3    mov         edx,dword ptr [ebp-4]
 007280A6    call        TMemIniFile.SetStrings
 007280AB    xor         eax,eax
 007280AD    pop         edx
 007280AE    pop         ecx
 007280AF    pop         ecx
 007280B0    mov         dword ptr fs:[eax],edx
 007280B3    push        7280C8
 007280B8    mov         eax,dword ptr [ebp-4]
 007280BB    call        TObject.Free
 007280C0    ret
>007280C1    jmp         @HandleFinally
>007280C6    jmp         007280B8
 007280C8    pop         esi
 007280C9    pop         ebx
 007280CA    pop         ecx
 007280CB    pop         ebp
 007280CC    ret
end;*}

//007280D0
{*procedure sub_007280D0(?:?);
begin
 007280D0    push        ebx
 007280D1    mov         ebx,edx
 007280D3    mov         eax,ebx
 007280D5    mov         edx,7280F0;'ini'
 007280DA    call        @UStrAsg
 007280DF    pop         ebx
 007280E0    ret
end;*}

//007280F8
procedure TJvAppIniFileStorage.Flush;
begin
{*
 007280F8    push        ebp
 007280F9    mov         ebp,esp
 007280FB    add         esp,0FFFFFFF8
 007280FE    push        ebx
 007280FF    push        esi
 00728100    push        edi
 00728101    xor         edx,edx
 00728103    mov         dword ptr [ebp-4],edx
 00728106    mov         dword ptr [ebp-8],eax
 00728109    xor         eax,eax
 0072810B    push        ebp
 0072810C    push        7281E5
 00728111    push        dword ptr fs:[eax]
 00728114    mov         dword ptr fs:[eax],esp
 00728117    mov         eax,dword ptr [ebp-8]
 0072811A    cmp         dword ptr [eax+158],0;TJvAppIniFileStorage.FFullFileName:TFileName
>00728121    je          007281CF
 00728127    mov         eax,dword ptr [ebp-8]
 0072812A    call        TJvCustomAppMemoryFileStorage.GetReadOnly
 0072812F    test        al,al
>00728131    jne         007281CF
 00728137    mov         eax,dword ptr [ebp-8]
 0072813A    test        byte ptr [eax+1C],10;TJvAppIniFileStorage.FComponentState:TComponentState
>0072813E    jne         007281CF
 00728144    xor         edx,edx
 00728146    push        ebp
 00728147    push        7281AE
 0072814C    push        dword ptr fs:[edx]
 0072814F    mov         dword ptr fs:[edx],esp
 00728152    lea         edx,[ebp-4]
 00728155    mov         eax,dword ptr [ebp-8]
 00728158    mov         eax,dword ptr [eax+178];TJvAppIniFileStorage.FIniFile:TMemIniFile
 0072815E    mov         eax,dword ptr [eax+4];TMemIniFile....FFileName:string
 00728161    call        ExtractFilePath
 00728166    cmp         dword ptr [ebp-4],0
>0072816A    je          00728174
 0072816C    mov         eax,dword ptr [ebp-4]
 0072816F    call        ForceDirectories
 00728174    mov         eax,dword ptr [ebp-8]
 00728177    cmp         byte ptr [eax+154],0;TJvAppIniFileStorage.FSynchronizeFlushReload:Boolean
>0072817E    je          0072819C
 00728180    mov         eax,dword ptr [ebp-8]
 00728183    push        eax
 00728184    push        7281F4;sub_007281F4
 00728189    mov         eax,dword ptr [ebp-8]
 0072818C    mov         edx,dword ptr [eax+158];TJvAppIniFileStorage.FFullFileName:TFileName
 00728192    mov         eax,dword ptr [ebp-8]
 00728195    call        005572A0
>0072819A    jmp         007281A4
 0072819C    mov         eax,dword ptr [ebp-8]
 0072819F    call        007281F4
 007281A4    xor         eax,eax
 007281A6    pop         edx
 007281A7    pop         ecx
 007281A8    pop         ecx
 007281A9    mov         dword ptr fs:[eax],edx
>007281AC    jmp         007281CF
>007281AE    jmp         @HandleOnException
 007281B3    dd          1
 007281B7    dd          00418C04;Exception
 007281BB    dd          007281BF
 007281BF    mov         edx,dword ptr [eax+4];Exception.FMessage:string
 007281C2    mov         eax,dword ptr [ebp-8]
 007281C5    call        00552EA0
 007281CA    call        @DoneExcept
 007281CF    xor         eax,eax
 007281D1    pop         edx
 007281D2    pop         ecx
 007281D3    pop         ecx
 007281D4    mov         dword ptr fs:[eax],edx
 007281D7    push        7281EC
 007281DC    lea         eax,[ebp-4]
 007281DF    call        @UStrClr
 007281E4    ret
>007281E5    jmp         @HandleFinally
>007281EA    jmp         007281DC
 007281EC    pop         edi
 007281ED    pop         esi
 007281EE    pop         ebx
 007281EF    pop         ecx
 007281F0    pop         ecx
 007281F1    pop         ebp
 007281F2    ret
*}
end;

//007281F4
procedure sub_007281F4(?:TJvAppIniFileStorage);
begin
{*
 007281F4    push        ebx
 007281F5    mov         ebx,eax
 007281F7    xor         ecx,ecx
 007281F9    mov         edx,dword ptr [ebx+158];TJvAppIniFileStorage.FFullFileName:TFileName
 007281FF    mov         eax,dword ptr [ebx+178];TJvAppIniFileStorage.FIniFile:TMemIniFile
 00728205    call        TMemIniFile.Rename
 0072820A    mov         eax,dword ptr [ebx+178];TJvAppIniFileStorage.FIniFile:TMemIniFile
 00728210    mov         edx,dword ptr [eax]
 00728212    call        dword ptr [edx+60];TMemIniFile.UpdateFile
 00728215    pop         ebx
 00728216    ret
*}
end;

//00728218
procedure TJvAppIniFileStorage.Reload;
begin
{*
 00728218    push        ebx
 00728219    mov         ebx,eax
 0072821B    mov         eax,ebx
 0072821D    call        0055720C
 00728222    test        al,al
>00728224    jne         00728276
 00728226    test        byte ptr [ebx+1C],10;TJvAppIniFileStorage.FComponentState:TComponentState
>0072822A    jne         00728276
 0072822C    mov         eax,ebx
 0072822E    call        TJvCustomAppMemoryFileStorage.Reload
 00728233    mov         dl,1
 00728235    mov         eax,dword ptr [ebx+158];TJvAppIniFileStorage.FFullFileName:TFileName
 0072823B    call        FileExists
 00728240    test        al,al
>00728242    je          0072826B
 00728244    cmp         byte ptr [ebx+154],0;TJvAppIniFileStorage.FSynchronizeFlushReload:Boolean
>0072824B    je          00728262
 0072824D    push        ebx
 0072824E    push        728278;sub_00728278
 00728253    mov         edx,dword ptr [ebx+158];TJvAppIniFileStorage.FFullFileName:TFileName
 00728259    mov         eax,ebx
 0072825B    call        005572A0
>00728260    jmp         00728276
 00728262    mov         eax,ebx
 00728264    call        00728278
>00728269    jmp         00728276
 0072826B    mov         eax,dword ptr [ebx+178];TJvAppIniFileStorage.FIniFile:TMemIniFile
 00728271    call        TMemIniFile.Clear
 00728276    pop         ebx
 00728277    ret
*}
end;

//00728278
procedure sub_00728278(?:TJvAppIniFileStorage);
begin
{*
 00728278    mov         cl,1
 0072827A    mov         edx,dword ptr [eax+158];TJvAppIniFileStorage.FFullFileName:TFileName
 00728280    mov         eax,dword ptr [eax+178];TJvAppIniFileStorage.FIniFile:TMemIniFile
 00728286    call        TMemIniFile.Rename
 0072828B    ret
*}
end;

//0072A620
procedure sub_0072A620(?:UnicodeString);
begin
{*
 0072A620    push        ebp
 0072A621    mov         ebp,esp
 0072A623    add         esp,0FFFFFFF8
 0072A626    push        ebx
 0072A627    xor         edx,edx
 0072A629    mov         dword ptr [ebp-8],edx
 0072A62C    mov         dword ptr [ebp-4],eax
 0072A62F    mov         eax,dword ptr [ebp-4]
 0072A632    call        @UStrAddRef
 0072A637    xor         eax,eax
 0072A639    push        ebp
 0072A63A    push        72A6DF
 0072A63F    push        dword ptr fs:[eax]
 0072A642    mov         dword ptr fs:[eax],esp
 0072A645    mov         edx,dword ptr [ebp-4]
 0072A648    mov         eax,72A6F8;'
'
 0072A64D    call        Pos
 0072A652    mov         ebx,eax
 0072A654    test        ebx,ebx
>0072A656    jle         0072A6A9
 0072A658    lea         eax,[ebp-8]
 0072A65B    push        eax
 0072A65C    mov         ecx,ebx
 0072A65E    dec         ecx
 0072A65F    mov         edx,1
 0072A664    mov         eax,dword ptr [ebp-4]
 0072A667    call        @UStrCopy
 0072A66C    mov         edx,dword ptr [ebp-8]
 0072A66F    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072A674    mov         eax,dword ptr [eax]
 0072A676    mov         eax,dword ptr [eax+394]
 0072A67C    mov         eax,dword ptr [eax+2A4]
 0072A682    mov         ecx,dword ptr [eax]
 0072A684    call        dword ptr [ecx+38]
 0072A687    lea         eax,[ebp-4]
 0072A68A    mov         ecx,ebx
 0072A68C    mov         edx,1
 0072A691    call        @UStrDelete
 0072A696    mov         edx,dword ptr [ebp-4]
 0072A699    mov         eax,72A6F8;'
'
 0072A69E    call        Pos
 0072A6A3    mov         ebx,eax
 0072A6A5    test        ebx,ebx
>0072A6A7    jg          0072A658
 0072A6A9    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072A6AE    mov         eax,dword ptr [eax]
 0072A6B0    mov         eax,dword ptr [eax+394]
 0072A6B6    mov         eax,dword ptr [eax+2A4]
 0072A6BC    mov         edx,dword ptr [ebp-4]
 0072A6BF    mov         ecx,dword ptr [eax]
 0072A6C1    call        dword ptr [ecx+38]
 0072A6C4    xor         eax,eax
 0072A6C6    pop         edx
 0072A6C7    pop         ecx
 0072A6C8    pop         ecx
 0072A6C9    mov         dword ptr fs:[eax],edx
 0072A6CC    push        72A6E6
 0072A6D1    lea         eax,[ebp-8]
 0072A6D4    mov         edx,2
 0072A6D9    call        @UStrArrayClr
 0072A6DE    ret
>0072A6DF    jmp         @HandleFinally
>0072A6E4    jmp         0072A6D1
 0072A6E6    pop         ebx
 0072A6E7    pop         ecx
 0072A6E8    pop         ecx
 0072A6E9    pop         ebp
 0072A6EA    ret
*}
end;

//0072A6FC
procedure sub_0072A6FC(?:UnicodeString; ?:UnicodeString);
begin
{*
 0072A6FC    push        ebp
 0072A6FD    mov         ebp,esp
 0072A6FF    mov         ecx,7
 0072A704    push        0
 0072A706    push        0
 0072A708    dec         ecx
>0072A709    jne         0072A704
 0072A70B    push        ebx
 0072A70C    push        esi
 0072A70D    push        edi
 0072A70E    mov         edi,edx
 0072A710    mov         dword ptr [ebp-4],eax
 0072A713    mov         eax,dword ptr [ebp-4]
 0072A716    call        @UStrAddRef
 0072A71B    xor         eax,eax
 0072A71D    push        ebp
 0072A71E    push        72A9B2
 0072A723    push        dword ptr fs:[eax]
 0072A726    mov         dword ptr fs:[eax],esp
 0072A729    cmp         dword ptr [ebp-4],0
>0072A72D    jne         0072A73B
 0072A72F    mov         eax,edi
 0072A731    call        @UStrClr
>0072A736    jmp         0072A98F
 0072A73B    mov         byte ptr [ebp-5],0
 0072A73F    mov         byte ptr [ebp-6],0
 0072A743    mov         byte ptr [ebp-7],0
 0072A747    xor         ebx,ebx
 0072A749    lea         eax,[ebp-10]
 0072A74C    push        eax
 0072A74D    mov         ecx,6
 0072A752    mov         edx,1
 0072A757    mov         eax,dword ptr [ebp-4]
 0072A75A    call        @UStrCopy
 0072A75F    mov         eax,dword ptr [ebp-10]
 0072A762    lea         edx,[ebp-0C]
 0072A765    call        LowerCase
 0072A76A    mov         eax,dword ptr [ebp-0C]
 0072A76D    mov         edx,72A9CC;'shift '
 0072A772    call        @UStrEqual
>0072A777    jne         0072A796
 0072A779    mov         byte ptr [ebp-5],1
 0072A77D    lea         eax,[ebp-4]
 0072A780    mov         ecx,6
 0072A785    mov         edx,1
 0072A78A    call        @UStrDelete
 0072A78F    mov         bl,1
>0072A791    jmp         0072A8A5
 0072A796    lea         eax,[ebp-18]
 0072A799    push        eax
 0072A79A    mov         ecx,5
 0072A79F    mov         edx,1
 0072A7A4    mov         eax,dword ptr [ebp-4]
 0072A7A7    call        @UStrCopy
 0072A7AC    mov         eax,dword ptr [ebp-18]
 0072A7AF    lea         edx,[ebp-14]
 0072A7B2    call        LowerCase
 0072A7B7    mov         eax,dword ptr [ebp-14]
 0072A7BA    mov         edx,72A9E8;'ctrl '
 0072A7BF    call        @UStrEqual
>0072A7C4    je          0072A7F6
 0072A7C6    lea         eax,[ebp-20]
 0072A7C9    push        eax
 0072A7CA    mov         ecx,5
 0072A7CF    mov         edx,1
 0072A7D4    mov         eax,dword ptr [ebp-4]
 0072A7D7    call        @UStrCopy
 0072A7DC    mov         eax,dword ptr [ebp-20]
 0072A7DF    lea         edx,[ebp-1C]
 0072A7E2    call        LowerCase
 0072A7E7    mov         eax,dword ptr [ebp-1C]
 0072A7EA    mov         edx,72AA00;'crtl '
 0072A7EF    call        @UStrEqual
>0072A7F4    jne         0072A813
 0072A7F6    mov         byte ptr [ebp-6],1
 0072A7FA    lea         eax,[ebp-4]
 0072A7FD    mov         ecx,5
 0072A802    mov         edx,1
 0072A807    call        @UStrDelete
 0072A80C    mov         bl,1
>0072A80E    jmp         0072A8A5
 0072A813    lea         eax,[ebp-28]
 0072A816    push        eax
 0072A817    mov         ecx,4
 0072A81C    mov         edx,1
 0072A821    mov         eax,dword ptr [ebp-4]
 0072A824    call        @UStrCopy
 0072A829    mov         eax,dword ptr [ebp-28]
 0072A82C    lea         edx,[ebp-24]
 0072A82F    call        LowerCase
 0072A834    mov         eax,dword ptr [ebp-24]
 0072A837    mov         edx,72AA18;'ctl '
 0072A83C    call        @UStrEqual
>0072A841    jne         0072A85D
 0072A843    mov         byte ptr [ebp-6],1
 0072A847    lea         eax,[ebp-4]
 0072A84A    mov         ecx,4
 0072A84F    mov         edx,1
 0072A854    call        @UStrDelete
 0072A859    mov         bl,1
>0072A85B    jmp         0072A8A5
 0072A85D    lea         eax,[ebp-30]
 0072A860    push        eax
 0072A861    mov         ecx,4
 0072A866    mov         edx,1
 0072A86B    mov         eax,dword ptr [ebp-4]
 0072A86E    call        @UStrCopy
 0072A873    mov         eax,dword ptr [ebp-30]
 0072A876    lea         edx,[ebp-2C]
 0072A879    call        LowerCase
 0072A87E    mov         eax,dword ptr [ebp-2C]
 0072A881    mov         edx,72AA30;'alt '
 0072A886    call        @UStrEqual
>0072A88B    jne         0072A8A5
 0072A88D    mov         byte ptr [ebp-7],1
 0072A891    lea         eax,[ebp-4]
 0072A894    mov         ecx,4
 0072A899    mov         edx,1
 0072A89E    call        @UStrDelete
 0072A8A3    mov         bl,1
 0072A8A5    test        bl,bl
>0072A8A7    jne         0072A747
 0072A8AD    cmp         byte ptr [ebp-6],0
>0072A8B1    je          0072A8D1
 0072A8B3    cmp         byte ptr [ebp-5],0
>0072A8B7    jne         0072A8D1
 0072A8B9    cmp         byte ptr [ebp-7],0
>0072A8BD    jne         0072A8D1
 0072A8BF    mov         eax,dword ptr [ebp-4]
 0072A8C2    test        eax,eax
>0072A8C4    je          0072A8CB
 0072A8C6    sub         eax,4
 0072A8C9    mov         eax,dword ptr [eax]
 0072A8CB    dec         eax
 0072A8CC    sete        al
>0072A8CF    jmp         0072A8D3
 0072A8D1    xor         eax,eax
 0072A8D3    test        al,al
>0072A8D5    je          0072A8F4
 0072A8D7    mov         eax,72AA3C;gvar_0072AA3C:UnicodeString
 0072A8DC    mov         edx,dword ptr [ebp-4]
 0072A8DF    movzx       edx,word ptr [edx]
 0072A8E2    cmp         dx,0FF
>0072A8E7    ja          0072A8EF
 0072A8E9    movzx       edx,dx
 0072A8EC    bt          dword ptr [eax],edx
 0072A8EF    setb        al
>0072A8F2    jmp         0072A8F6
 0072A8F4    xor         eax,eax
 0072A8F6    test        al,al
>0072A8F8    je          0072A908
 0072A8FA    mov         eax,edi
 0072A8FC    mov         edx,72AA68;'^'
 0072A901    call        @UStrAsg
>0072A906    jmp         0072A945
 0072A908    mov         eax,edi
 0072A90A    call        @UStrClr
 0072A90F    cmp         byte ptr [ebp-6],0
>0072A913    je          0072A921
 0072A915    mov         eax,edi
 0072A917    mov         edx,72AA78;'Ctrl+'
 0072A91C    call        @UStrCat
 0072A921    cmp         byte ptr [ebp-7],0
>0072A925    je          0072A933
 0072A927    mov         eax,edi
 0072A929    mov         edx,72AA90;'Alt+'
 0072A92E    call        @UStrCat
 0072A933    cmp         byte ptr [ebp-5],0
>0072A937    je          0072A945
 0072A939    mov         eax,edi
 0072A93B    mov         edx,72AAA8;'Shift+'
 0072A940    call        @UStrCat
 0072A945    mov         esi,7D
 0072A94A    mov         ebx,78C57C;^'1'
 0072A94F    lea         edx,[ebp-34]
 0072A952    mov         eax,dword ptr [ebx]
 0072A954    call        LowerCase
 0072A959    mov         eax,dword ptr [ebp-34]
 0072A95C    push        eax
 0072A95D    lea         edx,[ebp-38]
 0072A960    mov         eax,dword ptr [ebp-4]
 0072A963    call        LowerCase
 0072A968    mov         edx,dword ptr [ebp-38]
 0072A96B    pop         eax
 0072A96C    call        @UStrEqual
>0072A971    jne         0072A97F
 0072A973    mov         eax,edi
 0072A975    mov         edx,dword ptr [ebx+4]
 0072A978    call        @UStrCat
>0072A97D    jmp         0072A98F
 0072A97F    add         ebx,8
 0072A982    dec         esi
>0072A983    jne         0072A94F
 0072A985    mov         eax,edi
 0072A987    mov         edx,dword ptr [ebp-4]
 0072A98A    call        @UStrCat
 0072A98F    xor         eax,eax
 0072A991    pop         edx
 0072A992    pop         ecx
 0072A993    pop         ecx
 0072A994    mov         dword ptr fs:[eax],edx
 0072A997    push        72A9B9
 0072A99C    lea         eax,[ebp-38]
 0072A99F    mov         edx,0C
 0072A9A4    call        @UStrArrayClr
 0072A9A9    lea         eax,[ebp-4]
 0072A9AC    call        @UStrClr
 0072A9B1    ret
>0072A9B2    jmp         @HandleFinally
>0072A9B7    jmp         0072A99C
 0072A9B9    pop         edi
 0072A9BA    pop         esi
 0072A9BB    pop         ebx
 0072A9BC    mov         esp,ebp
 0072A9BE    pop         ebp
 0072A9BF    ret
*}
end;

//0072AAB8
procedure sub_0072AAB8(?:UnicodeString; ?:UnicodeString);
begin
{*
 0072AAB8    push        ebp
 0072AAB9    mov         ebp,esp
 0072AABB    xor         ecx,ecx
 0072AABD    push        ecx
 0072AABE    push        ecx
 0072AABF    push        ecx
 0072AAC0    push        ecx
 0072AAC1    push        ecx
 0072AAC2    push        ebx
 0072AAC3    push        esi
 0072AAC4    push        edi
 0072AAC5    mov         ebx,edx
 0072AAC7    mov         dword ptr [ebp-4],eax
 0072AACA    mov         eax,dword ptr [ebp-4]
 0072AACD    call        @UStrAddRef
 0072AAD2    xor         eax,eax
 0072AAD4    push        ebp
 0072AAD5    push        72AE22
 0072AADA    push        dword ptr fs:[eax]
 0072AADD    mov         dword ptr fs:[eax],esp
 0072AAE0    mov         eax,ebx
 0072AAE2    call        @UStrClr
 0072AAE7    mov         eax,dword ptr [ebp-4]
 0072AAEA    test        eax,eax
>0072AAEC    je          0072AAF3
 0072AAEE    sub         eax,4
 0072AAF1    mov         eax,dword ptr [eax]
 0072AAF3    mov         edi,eax
 0072AAF5    test        edi,edi
>0072AAF7    jle         0072ADD7
 0072AAFD    mov         esi,1
 0072AB02    cmp         dword ptr [ebx],0
>0072AB05    je          0072AB13
 0072AB07    mov         eax,ebx
 0072AB09    mov         edx,72AE3C;','
 0072AB0E    call        @UStrCat
 0072AB13    mov         eax,dword ptr [ebp-4]
 0072AB16    cmp         word ptr [eax+esi*2-2],21
>0072AB1C    jne         0072AB2F
 0072AB1E    mov         eax,ebx
 0072AB20    mov         edx,72AE4C;'Shift+One'
 0072AB25    call        @UStrCat
>0072AB2A    jmp         0072ADCF
 0072AB2F    mov         eax,dword ptr [ebp-4]
 0072AB32    cmp         word ptr [eax+esi*2-2],40
>0072AB38    jne         0072AB4B
 0072AB3A    mov         eax,ebx
 0072AB3C    mov         edx,72AE6C;'Shift+Two'
 0072AB41    call        @UStrCat
>0072AB46    jmp         0072ADCF
 0072AB4B    mov         eax,dword ptr [ebp-4]
 0072AB4E    cmp         word ptr [eax+esi*2-2],23
>0072AB54    jne         0072AB67
 0072AB56    mov         eax,ebx
 0072AB58    mov         edx,72AE8C;'Shift+Three'
 0072AB5D    call        @UStrCat
>0072AB62    jmp         0072ADCF
 0072AB67    mov         eax,dword ptr [ebp-4]
 0072AB6A    cmp         word ptr [eax+esi*2-2],24
>0072AB70    jne         0072AB83
 0072AB72    mov         eax,ebx
 0072AB74    mov         edx,72AEB0;'Shift+Four'
 0072AB79    call        @UStrCat
>0072AB7E    jmp         0072ADCF
 0072AB83    mov         eax,dword ptr [ebp-4]
 0072AB86    cmp         word ptr [eax+esi*2-2],25
>0072AB8C    jne         0072AB9F
 0072AB8E    mov         eax,ebx
 0072AB90    mov         edx,72AED4;'Shift+Five'
 0072AB95    call        @UStrCat
>0072AB9A    jmp         0072ADCF
 0072AB9F    mov         eax,dword ptr [ebp-4]
 0072ABA2    cmp         word ptr [eax+esi*2-2],5E
>0072ABA8    jne         0072ABBB
 0072ABAA    mov         eax,ebx
 0072ABAC    mov         edx,72AEF8;'Shift+Six'
 0072ABB1    call        @UStrCat
>0072ABB6    jmp         0072ADCF
 0072ABBB    mov         eax,dword ptr [ebp-4]
 0072ABBE    cmp         word ptr [eax+esi*2-2],26
>0072ABC4    jne         0072ABD7
 0072ABC6    mov         eax,ebx
 0072ABC8    mov         edx,72AF18;'Shift+Seven'
 0072ABCD    call        @UStrCat
>0072ABD2    jmp         0072ADCF
 0072ABD7    mov         eax,dword ptr [ebp-4]
 0072ABDA    cmp         word ptr [eax+esi*2-2],2A
>0072ABE0    jne         0072ABF3
 0072ABE2    mov         eax,ebx
 0072ABE4    mov         edx,72AF3C;'Shift+Eight'
 0072ABE9    call        @UStrCat
>0072ABEE    jmp         0072ADCF
 0072ABF3    mov         eax,dword ptr [ebp-4]
 0072ABF6    cmp         word ptr [eax+esi*2-2],28
>0072ABFC    jne         0072AC0F
 0072ABFE    mov         eax,ebx
 0072AC00    mov         edx,72AF60;'Shift+Nine'
 0072AC05    call        @UStrCat
>0072AC0A    jmp         0072ADCF
 0072AC0F    mov         eax,dword ptr [ebp-4]
 0072AC12    cmp         word ptr [eax+esi*2-2],29
>0072AC18    jne         0072AC2B
 0072AC1A    mov         eax,ebx
 0072AC1C    mov         edx,72AF84;'Shift+Zero'
 0072AC21    call        @UStrCat
>0072AC26    jmp         0072ADCF
 0072AC2B    mov         eax,dword ptr [ebp-4]
 0072AC2E    cmp         word ptr [eax+esi*2-2],7E
>0072AC34    jne         0072AC47
 0072AC36    mov         eax,ebx
 0072AC38    mov         edx,72AFA8;'Shift+Console'
 0072AC3D    call        @UStrCat
>0072AC42    jmp         0072ADCF
 0072AC47    mov         eax,dword ptr [ebp-4]
 0072AC4A    cmp         word ptr [eax+esi*2-2],5F
>0072AC50    jne         0072AC63
 0072AC52    mov         eax,ebx
 0072AC54    mov         edx,72AFD0;'Shift+Minus'
 0072AC59    call        @UStrCat
>0072AC5E    jmp         0072ADCF
 0072AC63    mov         eax,dword ptr [ebp-4]
 0072AC66    cmp         word ptr [eax+esi*2-2],2B
>0072AC6C    jne         0072AC7F
 0072AC6E    mov         eax,ebx
 0072AC70    mov         edx,72AFF4;'Shift+Equals'
 0072AC75    call        @UStrCat
>0072AC7A    jmp         0072ADCF
 0072AC7F    mov         eax,dword ptr [ebp-4]
 0072AC82    cmp         word ptr [eax+esi*2-2],7B
>0072AC88    jne         0072AC9B
 0072AC8A    mov         eax,ebx
 0072AC8C    mov         edx,72B01C;'Shift+LBracket'
 0072AC91    call        @UStrCat
>0072AC96    jmp         0072ADCF
 0072AC9B    mov         eax,dword ptr [ebp-4]
 0072AC9E    cmp         word ptr [eax+esi*2-2],7D
>0072ACA4    jne         0072ACB7
 0072ACA6    mov         eax,ebx
 0072ACA8    mov         edx,72B048;'Shift+RBracket'
 0072ACAD    call        @UStrCat
>0072ACB2    jmp         0072ADCF
 0072ACB7    mov         eax,dword ptr [ebp-4]
 0072ACBA    cmp         word ptr [eax+esi*2-2],7C
>0072ACC0    jne         0072ACD3
 0072ACC2    mov         eax,ebx
 0072ACC4    mov         edx,72B074;'Shift+Backslash'
 0072ACC9    call        @UStrCat
>0072ACCE    jmp         0072ADCF
 0072ACD3    mov         eax,dword ptr [ebp-4]
 0072ACD6    cmp         word ptr [eax+esi*2-2],3C
>0072ACDC    jne         0072ACEF
 0072ACDE    mov         eax,ebx
 0072ACE0    mov         edx,72B0A0;'Shift+Comma'
 0072ACE5    call        @UStrCat
>0072ACEA    jmp         0072ADCF
 0072ACEF    mov         eax,dword ptr [ebp-4]
 0072ACF2    cmp         word ptr [eax+esi*2-2],3E
>0072ACF8    jne         0072AD0B
 0072ACFA    mov         eax,ebx
 0072ACFC    mov         edx,72B0C4;'Shift+Dot'
 0072AD01    call        @UStrCat
>0072AD06    jmp         0072ADCF
 0072AD0B    mov         eax,dword ptr [ebp-4]
 0072AD0E    cmp         word ptr [eax+esi*2-2],3F
>0072AD14    jne         0072AD27
 0072AD16    mov         eax,ebx
 0072AD18    mov         edx,72B0E4;'Shift+Slash'
 0072AD1D    call        @UStrCat
>0072AD22    jmp         0072ADCF
 0072AD27    mov         eax,dword ptr [ebp-4]
 0072AD2A    cmp         word ptr [eax+esi*2-2],3A
>0072AD30    jne         0072AD43
 0072AD32    mov         eax,ebx
 0072AD34    mov         edx,72B108;'Shift+Semicolon'
 0072AD39    call        @UStrCat
>0072AD3E    jmp         0072ADCF
 0072AD43    mov         eax,dword ptr [ebp-4]
 0072AD46    cmp         word ptr [eax+esi*2-2],22
>0072AD4C    jne         0072AD5C
 0072AD4E    mov         eax,ebx
 0072AD50    mov         edx,72B134;'Shift+Apostrophe'
 0072AD55    call        @UStrCat
>0072AD5A    jmp         0072ADCF
 0072AD5C    mov         eax,72B158
 0072AD61    mov         dword ptr [ebp-8],eax
 0072AD64    mov         eax,dword ptr [ebp-4]
 0072AD67    movzx       eax,word ptr [eax+esi*2-2]
 0072AD6C    mov         edx,dword ptr [ebp-8]
 0072AD6F    cmp         ax,0FF
>0072AD73    ja          0072AD7B
 0072AD75    movzx       eax,ax
 0072AD78    bt          dword ptr [edx],eax
 0072AD7B    setb        al
 0072AD7E    test        al,al
>0072AD80    je          0072ADAA
 0072AD82    push        dword ptr [ebx]
 0072AD84    push        72B184;'Shift+'
 0072AD89    lea         eax,[ebp-0C]
 0072AD8C    mov         edx,dword ptr [ebp-4]
 0072AD8F    movzx       edx,word ptr [edx+esi*2-2]
 0072AD94    call        @UStrFromWChar
 0072AD99    push        dword ptr [ebp-0C]
 0072AD9C    mov         eax,ebx
 0072AD9E    mov         edx,3
 0072ADA3    call        @UStrCatN
>0072ADA8    jmp         0072ADCF
 0072ADAA    lea         eax,[ebp-14]
 0072ADAD    mov         edx,dword ptr [ebp-4]
 0072ADB0    movzx       edx,word ptr [edx+esi*2-2]
 0072ADB5    call        @UStrFromWChar
 0072ADBA    mov         eax,dword ptr [ebp-14]
 0072ADBD    lea         edx,[ebp-10]
 0072ADC0    call        0072A6FC
 0072ADC5    mov         edx,dword ptr [ebp-10]
 0072ADC8    mov         eax,ebx
 0072ADCA    call        @UStrCat
 0072ADCF    inc         esi
 0072ADD0    dec         edi
>0072ADD1    jne         0072AB02
 0072ADD7    mov         edx,dword ptr [ebx]
 0072ADD9    mov         eax,72AE3C;','
 0072ADDE    call        Pos
 0072ADE3    test        eax,eax
>0072ADE5    jle         0072ADFF
 0072ADE7    push        72B1A0;'('
 0072ADEC    push        dword ptr [ebx]
 0072ADEE    push        72B1B0;')'
 0072ADF3    mov         eax,ebx
 0072ADF5    mov         edx,3
 0072ADFA    call        @UStrCatN
 0072ADFF    xor         eax,eax
 0072AE01    pop         edx
 0072AE02    pop         ecx
 0072AE03    pop         ecx
 0072AE04    mov         dword ptr fs:[eax],edx
 0072AE07    push        72AE29
 0072AE0C    lea         eax,[ebp-14]
 0072AE0F    mov         edx,3
 0072AE14    call        @UStrArrayClr
 0072AE19    lea         eax,[ebp-4]
 0072AE1C    call        @UStrClr
 0072AE21    ret
>0072AE22    jmp         @HandleFinally
>0072AE27    jmp         0072AE0C
 0072AE29    pop         edi
 0072AE2A    pop         esi
 0072AE2B    pop         ebx
 0072AE2C    mov         esp,ebp
 0072AE2E    pop         ebp
 0072AE2F    ret
*}
end;

//0072B1B4
{*procedure sub_0072B1B4(?:?);
begin
 0072B1B4    push        ebp
 0072B1B5    mov         ebp,esp
 0072B1B7    mov         ecx,31
 0072B1BC    push        0
 0072B1BE    push        0
 0072B1C0    dec         ecx
>0072B1C1    jne         0072B1BC
 0072B1C3    push        ebx
 0072B1C4    push        esi
 0072B1C5    push        edi
 0072B1C6    mov         dword ptr [ebp-4],eax
 0072B1C9    mov         eax,dword ptr [ebp-4]
 0072B1CC    call        @IntfAddRef
 0072B1D1    xor         eax,eax
 0072B1D3    push        ebp
 0072B1D4    push        72B97D
 0072B1D9    push        dword ptr fs:[eax]
 0072B1DC    mov         dword ptr fs:[eax],esp
 0072B1DF    lea         edx,[ebp-20]
 0072B1E2    mov         eax,dword ptr [ebp-4]
 0072B1E5    mov         ecx,dword ptr [eax]
 0072B1E7    call        dword ptr [ecx+14]
 0072B1EA    mov         eax,dword ptr [ebp-20]
 0072B1ED    lea         edx,[ebp-8]
 0072B1F0    mov         ecx,dword ptr [eax]
 0072B1F2    call        dword ptr [ecx+34]
 0072B1F5    cmp         dword ptr [ebp-8],0
>0072B1F9    je          0072B812
 0072B1FF    xor         eax,eax
 0072B201    push        ebp
 0072B202    push        72B7DF
 0072B207    push        dword ptr fs:[eax]
 0072B20A    mov         dword ptr fs:[eax],esp
 0072B20D    mov         eax,dword ptr [ebp-8]
 0072B210    mov         edx,dword ptr [eax]
 0072B212    call        dword ptr [edx+38]
 0072B215    cmp         al,8
>0072B217    jne         0072B26B
 0072B219    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072B21E    mov         eax,dword ptr [eax]
 0072B220    mov         eax,dword ptr [eax+394]
 0072B226    mov         eax,dword ptr [eax+2A4]
 0072B22C    mov         edx,72B99C;'/*****************************************'
 0072B231    mov         ecx,dword ptr [eax]
 0072B233    call        dword ptr [ecx+38]
 0072B236    lea         edx,[ebp-24]
 0072B239    mov         eax,dword ptr [ebp-8]
 0072B23C    mov         ecx,dword ptr [eax]
 0072B23E    call        dword ptr [ecx+50]
 0072B241    mov         eax,dword ptr [ebp-24]
 0072B244    call        0072A620
 0072B249    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072B24E    mov         eax,dword ptr [eax]
 0072B250    mov         eax,dword ptr [eax+394]
 0072B256    mov         eax,dword ptr [eax+2A4]
 0072B25C    mov         edx,72BA00;'*****************************************/'
 0072B261    mov         ecx,dword ptr [eax]
 0072B263    call        dword ptr [ecx+38]
>0072B266    jmp         0072B7D5
 0072B26B    mov         eax,dword ptr [ebp-8]
 0072B26E    mov         edx,dword ptr [eax]
 0072B270    call        dword ptr [edx+38]
 0072B273    cmp         al,1
>0072B275    jne         0072B7D5
 0072B27B    lea         ecx,[ebp-34]
 0072B27E    mov         edx,72BA64;'name'
 0072B283    mov         eax,dword ptr [ebp-8]
 0072B286    mov         ebx,dword ptr [eax]
 0072B288    call        dword ptr [ebx+0C]
 0072B28B    lea         edx,[ebp-34]
 0072B28E    lea         eax,[ebp-10]
 0072B291    call        @VarToUStr
 0072B296    lea         ecx,[ebp-44]
 0072B299    mov         edx,72BA7C;'phrase'
 0072B29E    mov         eax,dword ptr [ebp-8]
 0072B2A1    mov         ebx,dword ptr [eax]
 0072B2A3    call        dword ptr [ebx+0C]
 0072B2A6    lea         edx,[ebp-44]
 0072B2A9    lea         eax,[ebp-14]
 0072B2AC    call        @VarToUStr
 0072B2B1    lea         eax,[ebp-18]
 0072B2B4    call        @UStrClr
 0072B2B9    lea         edx,[ebp-48]
 0072B2BC    mov         eax,dword ptr [ebp-8]
 0072B2BF    mov         ecx,dword ptr [eax]
 0072B2C1    call        dword ptr [ecx+14]
 0072B2C4    mov         eax,dword ptr [ebp-48]
 0072B2C7    lea         edx,[ebp-0C]
 0072B2CA    mov         ecx,dword ptr [eax]
 0072B2CC    call        dword ptr [ecx+34]
 0072B2CF    cmp         dword ptr [ebp-0C],0
>0072B2D3    je          0072B74C
 0072B2D9    lea         edx,[ebp-50]
 0072B2DC    mov         eax,dword ptr [ebp-0C]
 0072B2DF    mov         ecx,dword ptr [eax]
 0072B2E1    call        dword ptr [ecx+34]
 0072B2E4    mov         eax,dword ptr [ebp-50]
 0072B2E7    lea         edx,[ebp-4C]
 0072B2EA    call        LowerCase
 0072B2EF    mov         eax,dword ptr [ebp-4C]
 0072B2F2    mov         edx,72BA98;'key'
 0072B2F7    call        @UStrEqual
>0072B2FC    jne         0072B472
 0072B302    lea         ecx,[ebp-60]
 0072B305    mov         edx,72BAAC;'type'
 0072B30A    mov         eax,dword ptr [ebp-0C]
 0072B30D    mov         ebx,dword ptr [eax]
 0072B30F    call        dword ptr [ebx+0C]
 0072B312    lea         eax,[ebp-60]
 0072B315    push        eax
 0072B316    lea         eax,[ebp-70]
 0072B319    xor         edx,edx
 0072B31B    call        @OleVarFromUStr
 0072B320    lea         edx,[ebp-70]
 0072B323    pop         eax
 0072B324    call        @VarCmpEQ
>0072B329    jne         0072B3BB
 0072B32F    lea         ecx,[ebp-80]
 0072B332    mov         edx,72BAC4;'repeat'
 0072B337    mov         eax,dword ptr [ebp-0C]
 0072B33A    mov         ebx,dword ptr [eax]
 0072B33C    call        dword ptr [ebx+0C]
 0072B33F    lea         eax,[ebp-80]
 0072B342    call        VarIsNull
 0072B347    test        al,al
>0072B349    je          0072B354
 0072B34B    mov         dword ptr [ebp-1C],1
>0072B352    jmp         0072B375
 0072B354    lea         ecx,[ebp-90]
 0072B35A    mov         edx,72BAC4;'repeat'
 0072B35F    mov         eax,dword ptr [ebp-0C]
 0072B362    mov         ebx,dword ptr [eax]
 0072B364    call        dword ptr [ebx+0C]
 0072B367    lea         eax,[ebp-90]
 0072B36D    call        @VarToInteger
 0072B372    mov         dword ptr [ebp-1C],eax
 0072B375    mov         ebx,dword ptr [ebp-1C]
 0072B378    dec         ebx
 0072B379    test        ebx,ebx
>0072B37B    jl          0072B723
 0072B381    inc         ebx
 0072B382    cmp         dword ptr [ebp-18],0
>0072B386    je          0072B395
 0072B388    lea         eax,[ebp-18]
 0072B38B    mov         edx,72BAE0;', '
 0072B390    call        @UStrCat
 0072B395    lea         edx,[ebp-94]
 0072B39B    mov         eax,72BAF4;'Scan00'
 0072B3A0    call        0072A6FC
 0072B3A5    mov         edx,dword ptr [ebp-94]
 0072B3AB    lea         eax,[ebp-18]
 0072B3AE    call        @UStrCat
 0072B3B3    dec         ebx
>0072B3B4    jne         0072B382
>0072B3B6    jmp         0072B723
 0072B3BB    lea         ecx,[ebp-0A4]
 0072B3C1    mov         edx,72BAC4;'repeat'
 0072B3C6    mov         eax,dword ptr [ebp-0C]
 0072B3C9    mov         ebx,dword ptr [eax]
 0072B3CB    call        dword ptr [ebx+0C]
 0072B3CE    lea         eax,[ebp-0A4]
 0072B3D4    call        VarIsNull
 0072B3D9    test        al,al
>0072B3DB    je          0072B3E6
 0072B3DD    mov         dword ptr [ebp-1C],1
>0072B3E4    jmp         0072B407
 0072B3E6    lea         ecx,[ebp-0B4]
 0072B3EC    mov         edx,72BAC4;'repeat'
 0072B3F1    mov         eax,dword ptr [ebp-0C]
 0072B3F4    mov         ebx,dword ptr [eax]
 0072B3F6    call        dword ptr [ebx+0C]
 0072B3F9    lea         eax,[ebp-0B4]
 0072B3FF    call        @VarToInteger
 0072B404    mov         dword ptr [ebp-1C],eax
 0072B407    mov         ebx,dword ptr [ebp-1C]
 0072B40A    dec         ebx
 0072B40B    test        ebx,ebx
>0072B40D    jl          0072B723
 0072B413    inc         ebx
 0072B414    cmp         dword ptr [ebp-18],0
>0072B418    je          0072B427
 0072B41A    lea         eax,[ebp-18]
 0072B41D    mov         edx,72BAE0;', '
 0072B422    call        @UStrCat
 0072B427    lea         ecx,[ebp-0CC]
 0072B42D    mov         edx,72BAAC;'type'
 0072B432    mov         eax,dword ptr [ebp-0C]
 0072B435    mov         esi,dword ptr [eax]
 0072B437    call        dword ptr [esi+0C]
 0072B43A    lea         edx,[ebp-0CC]
 0072B440    lea         eax,[ebp-0BC]
 0072B446    call        @VarToUStr
 0072B44B    mov         eax,dword ptr [ebp-0BC]
 0072B451    lea         edx,[ebp-0B8]
 0072B457    call        0072A6FC
 0072B45C    mov         edx,dword ptr [ebp-0B8]
 0072B462    lea         eax,[ebp-18]
 0072B465    call        @UStrCat
 0072B46A    dec         ebx
>0072B46B    jne         0072B414
>0072B46D    jmp         0072B723
 0072B472    lea         edx,[ebp-0D4]
 0072B478    mov         eax,dword ptr [ebp-0C]
 0072B47B    mov         ecx,dword ptr [eax]
 0072B47D    call        dword ptr [ecx+34]
 0072B480    mov         eax,dword ptr [ebp-0D4]
 0072B486    lea         edx,[ebp-0D0]
 0072B48C    call        LowerCase
 0072B491    mov         eax,dword ptr [ebp-0D0]
 0072B497    mov         edx,72BB10;'press'
 0072B49C    call        @UStrEqual
>0072B4A1    jne         0072B510
 0072B4A3    cmp         dword ptr [ebp-18],0
>0072B4A7    je          0072B4B6
 0072B4A9    lea         eax,[ebp-18]
 0072B4AC    mov         edx,72BAE0;', '
 0072B4B1    call        @UStrCat
 0072B4B6    push        dword ptr [ebp-18]
 0072B4B9    push        72BB28;'press('
 0072B4BE    lea         ecx,[ebp-0EC]
 0072B4C4    mov         edx,72BAAC;'type'
 0072B4C9    mov         eax,dword ptr [ebp-0C]
 0072B4CC    mov         ebx,dword ptr [eax]
 0072B4CE    call        dword ptr [ebx+0C]
 0072B4D1    lea         edx,[ebp-0EC]
 0072B4D7    lea         eax,[ebp-0DC]
 0072B4DD    call        @VarToUStr
 0072B4E2    mov         eax,dword ptr [ebp-0DC]
 0072B4E8    lea         edx,[ebp-0D8]
 0072B4EE    call        0072A6FC
 0072B4F3    push        dword ptr [ebp-0D8]
 0072B4F9    push        72BB44;')'
 0072B4FE    lea         eax,[ebp-18]
 0072B501    mov         edx,4
 0072B506    call        @UStrCatN
>0072B50B    jmp         0072B723
 0072B510    lea         edx,[ebp-0F4]
 0072B516    mov         eax,dword ptr [ebp-0C]
 0072B519    mov         ecx,dword ptr [eax]
 0072B51B    call        dword ptr [ecx+34]
 0072B51E    mov         eax,dword ptr [ebp-0F4]
 0072B524    lea         edx,[ebp-0F0]
 0072B52A    call        LowerCase
 0072B52F    mov         eax,dword ptr [ebp-0F0]
 0072B535    mov         edx,72BB54;'release'
 0072B53A    call        @UStrEqual
>0072B53F    jne         0072B5AE
 0072B541    cmp         dword ptr [ebp-18],0
>0072B545    je          0072B554
 0072B547    lea         eax,[ebp-18]
 0072B54A    mov         edx,72BAE0;', '
 0072B54F    call        @UStrCat
 0072B554    push        dword ptr [ebp-18]
 0072B557    push        72BB70;'release('
 0072B55C    lea         ecx,[ebp-10C]
 0072B562    mov         edx,72BAAC;'type'
 0072B567    mov         eax,dword ptr [ebp-0C]
 0072B56A    mov         ebx,dword ptr [eax]
 0072B56C    call        dword ptr [ebx+0C]
 0072B56F    lea         edx,[ebp-10C]
 0072B575    lea         eax,[ebp-0FC]
 0072B57B    call        @VarToUStr
 0072B580    mov         eax,dword ptr [ebp-0FC]
 0072B586    lea         edx,[ebp-0F8]
 0072B58C    call        0072A6FC
 0072B591    push        dword ptr [ebp-0F8]
 0072B597    push        72BB44;')'
 0072B59C    lea         eax,[ebp-18]
 0072B59F    mov         edx,4
 0072B5A4    call        @UStrCatN
>0072B5A9    jmp         0072B723
 0072B5AE    lea         edx,[ebp-114]
 0072B5B4    mov         eax,dword ptr [ebp-0C]
 0072B5B7    mov         ecx,dword ptr [eax]
 0072B5B9    call        dword ptr [ecx+34]
 0072B5BC    mov         eax,dword ptr [ebp-114]
 0072B5C2    lea         edx,[ebp-110]
 0072B5C8    call        LowerCase
 0072B5CD    mov         eax,dword ptr [ebp-110]
 0072B5D3    mov         edx,72BB90;'button'
 0072B5D8    call        @UStrEqual
>0072B5DD    jne         0072B69C
 0072B5E3    cmp         dword ptr [ebp-18],0
>0072B5E7    je          0072B5F6
 0072B5E9    lea         eax,[ebp-18]
 0072B5EC    mov         edx,72BAE0;', '
 0072B5F1    call        @UStrCat
 0072B5F6    lea         eax,[ebp-128]
 0072B5FC    mov         ecx,72BBAC;'ppjoy'
 0072B601    mov         edx,dword ptr [ebp-18]
 0072B604    call        @UStrCat3
 0072B609    mov         edx,dword ptr [ebp-128]
 0072B60F    lea         eax,[ebp-124]
 0072B615    call        @OleVarFromUStr
 0072B61A    lea         eax,[ebp-124]
 0072B620    push        eax
 0072B621    lea         ecx,[ebp-138]
 0072B627    mov         edx,72BBC4;'device'
 0072B62C    mov         eax,dword ptr [ebp-0C]
 0072B62F    mov         ebx,dword ptr [eax]
 0072B631    call        dword ptr [ebx+0C]
 0072B634    lea         edx,[ebp-138]
 0072B63A    pop         eax
 0072B63B    call        @VarAdd
 0072B640    lea         eax,[ebp-124]
 0072B646    push        eax
 0072B647    lea         eax,[ebp-148]
 0072B64D    mov         edx,72BBE0;'.Button'
 0072B652    call        @OleVarFromUStr
 0072B657    lea         edx,[ebp-148]
 0072B65D    pop         eax
 0072B65E    call        @VarAdd
 0072B663    lea         eax,[ebp-124]
 0072B669    push        eax
 0072B66A    lea         ecx,[ebp-158]
 0072B670    mov         edx,72BBFC;'number'
 0072B675    mov         eax,dword ptr [ebp-0C]
 0072B678    mov         ebx,dword ptr [eax]
 0072B67A    call        dword ptr [ebx+0C]
 0072B67D    lea         edx,[ebp-158]
 0072B683    pop         eax
 0072B684    call        @VarAdd
 0072B689    lea         edx,[ebp-124]
 0072B68F    lea         eax,[ebp-18]
 0072B692    call        @VarToUStr
>0072B697    jmp         0072B723
 0072B69C    lea         edx,[ebp-160]
 0072B6A2    mov         eax,dword ptr [ebp-0C]
 0072B6A5    mov         ecx,dword ptr [eax]
 0072B6A7    call        dword ptr [ecx+34]
 0072B6AA    mov         eax,dword ptr [ebp-160]
 0072B6B0    lea         edx,[ebp-15C]
 0072B6B6    call        LowerCase
 0072B6BB    mov         eax,dword ptr [ebp-15C]
 0072B6C1    mov         edx,72BC18;'sequence'
 0072B6C6    call        @UStrEqual
>0072B6CB    jne         0072B723
 0072B6CD    cmp         dword ptr [ebp-18],0
>0072B6D1    je          0072B6E0
 0072B6D3    lea         eax,[ebp-18]
 0072B6D6    mov         edx,72BAE0;', '
 0072B6DB    call        @UStrCat
 0072B6E0    lea         ecx,[ebp-178]
 0072B6E6    mov         edx,72BC38;'keys'
 0072B6EB    mov         eax,dword ptr [ebp-0C]
 0072B6EE    mov         ebx,dword ptr [eax]
 0072B6F0    call        dword ptr [ebx+0C]
 0072B6F3    lea         edx,[ebp-178]
 0072B6F9    lea         eax,[ebp-168]
 0072B6FF    call        @VarToUStr
 0072B704    mov         eax,dword ptr [ebp-168]
 0072B70A    lea         edx,[ebp-164]
 0072B710    call        0072AAB8
 0072B715    mov         edx,dword ptr [ebp-164]
 0072B71B    lea         eax,[ebp-18]
 0072B71E    call        @UStrCat
 0072B723    lea         edx,[ebp-17C]
 0072B729    mov         eax,dword ptr [ebp-0C]
 0072B72C    mov         ecx,dword ptr [eax]
 0072B72E    call        dword ptr [ecx+90]
 0072B734    mov         edx,dword ptr [ebp-17C]
 0072B73A    lea         eax,[ebp-0C]
 0072B73D    call        @IntfCopy
 0072B742    cmp         dword ptr [ebp-0C],0
>0072B746    jne         0072B2D9
 0072B74C    lea         eax,[ebp-180]
 0072B752    mov         ecx,dword ptr [ebp-10]
 0072B755    mov         edx,72BC50;'// '
 0072B75A    call        @UStrCat3
 0072B75F    mov         edx,dword ptr [ebp-180]
 0072B765    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072B76A    mov         eax,dword ptr [eax]
 0072B76C    mov         eax,dword ptr [eax+394]
 0072B772    mov         eax,dword ptr [eax+2A4]
 0072B778    mov         ecx,dword ptr [eax]
 0072B77A    call        dword ptr [ecx+38]
 0072B77D    push        72BC64;'said("'
 0072B782    push        dword ptr [ebp-14]
 0072B785    push        72BC80;'") => '
 0072B78A    push        dword ptr [ebp-18]
 0072B78D    lea         eax,[ebp-184]
 0072B793    mov         edx,4
 0072B798    call        @UStrCatN
 0072B79D    mov         edx,dword ptr [ebp-184]
 0072B7A3    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072B7A8    mov         eax,dword ptr [eax]
 0072B7AA    mov         eax,dword ptr [eax+394]
 0072B7B0    mov         eax,dword ptr [eax+2A4]
 0072B7B6    mov         ecx,dword ptr [eax]
 0072B7B8    call        dword ptr [ecx+38]
 0072B7BB    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072B7C0    mov         eax,dword ptr [eax]
 0072B7C2    mov         eax,dword ptr [eax+394]
 0072B7C8    mov         eax,dword ptr [eax+2A4]
 0072B7CE    xor         edx,edx
 0072B7D0    mov         ecx,dword ptr [eax]
 0072B7D2    call        dword ptr [ecx+38]
 0072B7D5    xor         eax,eax
 0072B7D7    pop         edx
 0072B7D8    pop         ecx
 0072B7D9    pop         ecx
 0072B7DA    mov         dword ptr fs:[eax],edx
>0072B7DD    jmp         0072B7E9
>0072B7DF    jmp         @HandleAnyException
 0072B7E4    call        @DoneExcept
 0072B7E9    lea         edx,[ebp-188]
 0072B7EF    mov         eax,dword ptr [ebp-8]
 0072B7F2    mov         ecx,dword ptr [eax]
 0072B7F4    call        dword ptr [ecx+90]
 0072B7FA    mov         edx,dword ptr [ebp-188]
 0072B800    lea         eax,[ebp-8]
 0072B803    call        @IntfCopy
 0072B808    cmp         dword ptr [ebp-8],0
>0072B80C    jne         0072B1FF
 0072B812    xor         eax,eax
 0072B814    pop         edx
 0072B815    pop         ecx
 0072B816    pop         ecx
 0072B817    mov         dword ptr fs:[eax],edx
 0072B81A    push        72B987
 0072B81F    lea         eax,[ebp-188]
 0072B825    call        @IntfClear
 0072B82A    lea         eax,[ebp-184]
 0072B830    mov         edx,2
 0072B835    call        @UStrArrayClr
 0072B83A    lea         eax,[ebp-17C]
 0072B840    call        @IntfClear
 0072B845    lea         eax,[ebp-178]
 0072B84B    call        @VarClr
 0072B850    lea         eax,[ebp-168]
 0072B856    mov         edx,4
 0072B85B    call        @UStrArrayClr
 0072B860    lea         eax,[ebp-158]
 0072B866    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072B86C    mov         ecx,3
 0072B871    call        @FinalizeArray
 0072B876    lea         eax,[ebp-128]
 0072B87C    call        @UStrClr
 0072B881    lea         eax,[ebp-124]
 0072B887    call        @VarClr
 0072B88C    lea         eax,[ebp-114]
 0072B892    mov         edx,2
 0072B897    call        @UStrArrayClr
 0072B89C    lea         eax,[ebp-10C]
 0072B8A2    call        @VarClr
 0072B8A7    lea         eax,[ebp-0FC]
 0072B8AD    mov         edx,4
 0072B8B2    call        @UStrArrayClr
 0072B8B7    lea         eax,[ebp-0EC]
 0072B8BD    call        @VarClr
 0072B8C2    lea         eax,[ebp-0DC]
 0072B8C8    mov         edx,4
 0072B8CD    call        @UStrArrayClr
 0072B8D2    lea         eax,[ebp-0CC]
 0072B8D8    call        @VarClr
 0072B8DD    lea         eax,[ebp-0BC]
 0072B8E3    mov         edx,2
 0072B8E8    call        @UStrArrayClr
 0072B8ED    lea         eax,[ebp-0B4]
 0072B8F3    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072B8F9    mov         ecx,2
 0072B8FE    call        @FinalizeArray
 0072B903    lea         eax,[ebp-94]
 0072B909    call        @UStrClr
 0072B90E    lea         eax,[ebp-90]
 0072B914    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072B91A    mov         ecx,4
 0072B91F    call        @FinalizeArray
 0072B924    lea         eax,[ebp-50]
 0072B927    mov         edx,2
 0072B92C    call        @UStrArrayClr
 0072B931    lea         eax,[ebp-48]
 0072B934    call        @IntfClear
 0072B939    lea         eax,[ebp-44]
 0072B93C    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072B942    mov         ecx,2
 0072B947    call        @FinalizeArray
 0072B94C    lea         eax,[ebp-24]
 0072B94F    call        @UStrClr
 0072B954    lea         eax,[ebp-20]
 0072B957    call        @IntfClear
 0072B95C    lea         eax,[ebp-18]
 0072B95F    mov         edx,3
 0072B964    call        @UStrArrayClr
 0072B969    lea         eax,[ebp-0C]
 0072B96C    mov         edx,dword ptr ds:[58A824];IXMLNode
 0072B972    mov         ecx,3
 0072B977    call        @FinalizeArray
 0072B97C    ret
>0072B97D    jmp         @HandleFinally
>0072B982    jmp         0072B81F
 0072B987    pop         edi
 0072B988    pop         esi
 0072B989    pop         ebx
 0072B98A    mov         esp,ebp
 0072B98C    pop         ebp
 0072B98D    ret
end;*}

//0072BC90
{*procedure sub_0072BC90(?:?);
begin
 0072BC90    push        ebp
 0072BC91    mov         ebp,esp
 0072BC93    mov         ecx,7
 0072BC98    push        0
 0072BC9A    push        0
 0072BC9C    dec         ecx
>0072BC9D    jne         0072BC98
 0072BC9F    push        ecx
 0072BCA0    push        ebx
 0072BCA1    push        esi
 0072BCA2    push        edi
 0072BCA3    mov         dword ptr [ebp-4],eax
 0072BCA6    mov         eax,dword ptr [ebp-4]
 0072BCA9    call        @IntfAddRef
 0072BCAE    xor         eax,eax
 0072BCB0    push        ebp
 0072BCB1    push        72BE6C
 0072BCB6    push        dword ptr fs:[eax]
 0072BCB9    mov         dword ptr fs:[eax],esp
 0072BCBC    lea         ecx,[ebp-1C]
 0072BCBF    mov         edx,72BE88;'initial-state'
 0072BCC4    mov         eax,dword ptr [ebp-4]
 0072BCC7    mov         ebx,dword ptr [eax]
 0072BCC9    call        dword ptr [ebx+0C]
 0072BCCC    lea         edx,[ebp-1C]
 0072BCCF    lea         eax,[ebp-0C]
 0072BCD2    call        @VarToUStr
 0072BCD7    lea         eax,[ebp-20]
 0072BCDA    mov         ecx,dword ptr [ebp-0C]
 0072BCDD    mov         edx,72BEB0;'//// PTT = '
 0072BCE2    call        @UStrCat3
 0072BCE7    mov         edx,dword ptr [ebp-20]
 0072BCEA    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072BCEF    mov         eax,dword ptr [eax]
 0072BCF1    mov         eax,dword ptr [eax+394]
 0072BCF7    mov         eax,dword ptr [eax+2A4]
 0072BCFD    mov         ecx,dword ptr [eax]
 0072BCFF    call        dword ptr [ecx+38]
 0072BD02    lea         edx,[ebp-24]
 0072BD05    mov         eax,dword ptr [ebp-4]
 0072BD08    mov         ecx,dword ptr [eax]
 0072BD0A    call        dword ptr [ecx+14]
 0072BD0D    mov         eax,dword ptr [ebp-24]
 0072BD10    lea         edx,[ebp-8]
 0072BD13    mov         ecx,dword ptr [eax]
 0072BD15    call        dword ptr [ecx+34]
 0072BD18    cmp         dword ptr [ebp-8],0
>0072BD1C    je          0072BE16
 0072BD22    xor         eax,eax
 0072BD24    push        ebp
 0072BD25    push        72BDE9
 0072BD2A    push        dword ptr fs:[eax]
 0072BD2D    mov         dword ptr fs:[eax],esp
 0072BD30    mov         eax,dword ptr [ebp-8]
 0072BD33    mov         edx,dword ptr [eax]
 0072BD35    call        dword ptr [edx+38]
 0072BD38    cmp         al,8
>0072BD3A    jne         0072BD8B
 0072BD3C    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072BD41    mov         eax,dword ptr [eax]
 0072BD43    mov         eax,dword ptr [eax+394]
 0072BD49    mov         eax,dword ptr [eax+2A4]
 0072BD4F    mov         edx,72BED4;'/*** Push to talk ***'
 0072BD54    mov         ecx,dword ptr [eax]
 0072BD56    call        dword ptr [ecx+38]
 0072BD59    lea         edx,[ebp-28]
 0072BD5C    mov         eax,dword ptr [ebp-8]
 0072BD5F    mov         ecx,dword ptr [eax]
 0072BD61    call        dword ptr [ecx+50]
 0072BD64    mov         eax,dword ptr [ebp-28]
 0072BD67    call        0072A620
 0072BD6C    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072BD71    mov         eax,dword ptr [eax]
 0072BD73    mov         eax,dword ptr [eax+394]
 0072BD79    mov         eax,dword ptr [eax+2A4]
 0072BD7F    mov         edx,72BF0C;'***/'
 0072BD84    mov         ecx,dword ptr [eax]
 0072BD86    call        dword ptr [ecx+38]
>0072BD89    jmp         0072BDDF
 0072BD8B    mov         eax,dword ptr [ebp-8]
 0072BD8E    mov         edx,dword ptr [eax]
 0072BD90    call        dword ptr [edx+38]
 0072BD93    cmp         al,1
>0072BD95    jne         0072BDDF
 0072BD97    lea         edx,[ebp-30]
 0072BD9A    mov         eax,dword ptr [ebp-8]
 0072BD9D    mov         ecx,dword ptr [eax]
 0072BD9F    call        dword ptr [ecx+34]
 0072BDA2    mov         eax,dword ptr [ebp-30]
 0072BDA5    lea         edx,[ebp-2C]
 0072BDA8    call        LowerCase
 0072BDAD    mov         eax,dword ptr [ebp-2C]
 0072BDB0    mov         edx,72BF24;'hold'
 0072BDB5    call        @UStrEqual
>0072BDBA    je          0072BDDF
 0072BDBC    lea         edx,[ebp-38]
 0072BDBF    mov         eax,dword ptr [ebp-8]
 0072BDC2    mov         ecx,dword ptr [eax]
 0072BDC4    call        dword ptr [ecx+34]
 0072BDC7    mov         eax,dword ptr [ebp-38]
 0072BDCA    lea         edx,[ebp-34]
 0072BDCD    call        LowerCase
 0072BDD2    mov         eax,dword ptr [ebp-34]
 0072BDD5    mov         edx,72BF3C;'toggle'
 0072BDDA    call        @UStrEqual
 0072BDDF    xor         eax,eax
 0072BDE1    pop         edx
 0072BDE2    pop         ecx
 0072BDE3    pop         ecx
 0072BDE4    mov         dword ptr fs:[eax],edx
>0072BDE7    jmp         0072BDF3
>0072BDE9    jmp         @HandleAnyException
 0072BDEE    call        @DoneExcept
 0072BDF3    lea         edx,[ebp-3C]
 0072BDF6    mov         eax,dword ptr [ebp-8]
 0072BDF9    mov         ecx,dword ptr [eax]
 0072BDFB    call        dword ptr [ecx+90]
 0072BE01    mov         edx,dword ptr [ebp-3C]
 0072BE04    lea         eax,[ebp-8]
 0072BE07    call        @IntfCopy
 0072BE0C    cmp         dword ptr [ebp-8],0
>0072BE10    jne         0072BD22
 0072BE16    xor         eax,eax
 0072BE18    pop         edx
 0072BE19    pop         ecx
 0072BE1A    pop         ecx
 0072BE1B    mov         dword ptr fs:[eax],edx
 0072BE1E    push        72BE73
 0072BE23    lea         eax,[ebp-3C]
 0072BE26    call        @IntfClear
 0072BE2B    lea         eax,[ebp-38]
 0072BE2E    mov         edx,5
 0072BE33    call        @UStrArrayClr
 0072BE38    lea         eax,[ebp-24]
 0072BE3B    call        @IntfClear
 0072BE40    lea         eax,[ebp-20]
 0072BE43    call        @UStrClr
 0072BE48    lea         eax,[ebp-1C]
 0072BE4B    call        @VarClr
 0072BE50    lea         eax,[ebp-0C]
 0072BE53    call        @UStrClr
 0072BE58    lea         eax,[ebp-8]
 0072BE5B    mov         edx,dword ptr ds:[58A824];IXMLNode
 0072BE61    mov         ecx,2
 0072BE66    call        @FinalizeArray
 0072BE6B    ret
>0072BE6C    jmp         @HandleFinally
>0072BE71    jmp         0072BE23
 0072BE73    pop         edi
 0072BE74    pop         esi
 0072BE75    pop         ebx
 0072BE76    mov         esp,ebp
 0072BE78    pop         ebp
 0072BE79    ret
end;*}

//0072BF4C
{*procedure sub_0072BF4C(?:?);
begin
 0072BF4C    push        ebp
 0072BF4D    mov         ebp,esp
 0072BF4F    xor         ecx,ecx
 0072BF51    push        ecx
 0072BF52    push        ecx
 0072BF53    push        ecx
 0072BF54    push        ecx
 0072BF55    push        ecx
 0072BF56    push        ecx
 0072BF57    push        ecx
 0072BF58    push        ebx
 0072BF59    push        esi
 0072BF5A    push        edi
 0072BF5B    mov         dword ptr [ebp-4],eax
 0072BF5E    mov         eax,dword ptr [ebp-4]
 0072BF61    call        @IntfAddRef
 0072BF66    xor         eax,eax
 0072BF68    push        ebp
 0072BF69    push        72C0BE
 0072BF6E    push        dword ptr fs:[eax]
 0072BF71    mov         dword ptr fs:[eax],esp
 0072BF74    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072BF79    mov         eax,dword ptr [eax]
 0072BF7B    mov         eax,dword ptr [eax+394]
 0072BF81    mov         eax,dword ptr [eax+2A4]
 0072BF87    mov         edx,72C0D8;'//// Sounds'
 0072BF8C    mov         ecx,dword ptr [eax]
 0072BF8E    call        dword ptr [ecx+38]
 0072BF91    lea         edx,[ebp-0C]
 0072BF94    mov         eax,dword ptr [ebp-4]
 0072BF97    mov         ecx,dword ptr [eax]
 0072BF99    call        dword ptr [ecx+14]
 0072BF9C    mov         eax,dword ptr [ebp-0C]
 0072BF9F    lea         edx,[ebp-8]
 0072BFA2    mov         ecx,dword ptr [eax]
 0072BFA4    call        dword ptr [ecx+34]
 0072BFA7    cmp         dword ptr [ebp-8],0
>0072BFAB    je          0072C080
 0072BFB1    xor         eax,eax
 0072BFB3    push        ebp
 0072BFB4    push        72C053
 0072BFB9    push        dword ptr fs:[eax]
 0072BFBC    mov         dword ptr fs:[eax],esp
 0072BFBF    mov         eax,dword ptr [ebp-8]
 0072BFC2    mov         edx,dword ptr [eax]
 0072BFC4    call        dword ptr [edx+38]
 0072BFC7    cmp         al,8
>0072BFC9    jne         0072C01A
 0072BFCB    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072BFD0    mov         eax,dword ptr [eax]
 0072BFD2    mov         eax,dword ptr [eax+394]
 0072BFD8    mov         eax,dword ptr [eax+2A4]
 0072BFDE    mov         edx,72C0FC;'/****'
 0072BFE3    mov         ecx,dword ptr [eax]
 0072BFE5    call        dword ptr [ecx+38]
 0072BFE8    lea         edx,[ebp-10]
 0072BFEB    mov         eax,dword ptr [ebp-8]
 0072BFEE    mov         ecx,dword ptr [eax]
 0072BFF0    call        dword ptr [ecx+50]
 0072BFF3    mov         eax,dword ptr [ebp-10]
 0072BFF6    call        0072A620
 0072BFFB    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072C000    mov         eax,dword ptr [eax]
 0072C002    mov         eax,dword ptr [eax+394]
 0072C008    mov         eax,dword ptr [eax+2A4]
 0072C00E    mov         edx,72C114;'****/'
 0072C013    mov         ecx,dword ptr [eax]
 0072C015    call        dword ptr [ecx+38]
>0072C018    jmp         0072C049
 0072C01A    mov         eax,dword ptr [ebp-8]
 0072C01D    mov         edx,dword ptr [eax]
 0072C01F    call        dword ptr [edx+38]
 0072C022    cmp         al,1
>0072C024    jne         0072C049
 0072C026    lea         edx,[ebp-18]
 0072C029    mov         eax,dword ptr [ebp-8]
 0072C02C    mov         ecx,dword ptr [eax]
 0072C02E    call        dword ptr [ecx+34]
 0072C031    mov         eax,dword ptr [ebp-18]
 0072C034    lea         edx,[ebp-14]
 0072C037    call        LowerCase
 0072C03C    mov         eax,dword ptr [ebp-14]
 0072C03F    mov         edx,72C12C;'sound'
 0072C044    call        @UStrEqual
 0072C049    xor         eax,eax
 0072C04B    pop         edx
 0072C04C    pop         ecx
 0072C04D    pop         ecx
 0072C04E    mov         dword ptr fs:[eax],edx
>0072C051    jmp         0072C05D
>0072C053    jmp         @HandleAnyException
 0072C058    call        @DoneExcept
 0072C05D    lea         edx,[ebp-1C]
 0072C060    mov         eax,dword ptr [ebp-8]
 0072C063    mov         ecx,dword ptr [eax]
 0072C065    call        dword ptr [ecx+90]
 0072C06B    mov         edx,dword ptr [ebp-1C]
 0072C06E    lea         eax,[ebp-8]
 0072C071    call        @IntfCopy
 0072C076    cmp         dword ptr [ebp-8],0
>0072C07A    jne         0072BFB1
 0072C080    xor         eax,eax
 0072C082    pop         edx
 0072C083    pop         ecx
 0072C084    pop         ecx
 0072C085    mov         dword ptr fs:[eax],edx
 0072C088    push        72C0C5
 0072C08D    lea         eax,[ebp-1C]
 0072C090    call        @IntfClear
 0072C095    lea         eax,[ebp-18]
 0072C098    mov         edx,3
 0072C09D    call        @UStrArrayClr
 0072C0A2    lea         eax,[ebp-0C]
 0072C0A5    call        @IntfClear
 0072C0AA    lea         eax,[ebp-8]
 0072C0AD    mov         edx,dword ptr ds:[58A824];IXMLNode
 0072C0B3    mov         ecx,2
 0072C0B8    call        @FinalizeArray
 0072C0BD    ret
>0072C0BE    jmp         @HandleFinally
>0072C0C3    jmp         0072C08D
 0072C0C5    pop         edi
 0072C0C6    pop         esi
 0072C0C7    pop         ebx
 0072C0C8    mov         esp,ebp
 0072C0CA    pop         ebp
 0072C0CB    ret
end;*}

//0072C138
procedure sub_0072C138(?:IInterface);
begin
{*
 0072C138    push        ebp
 0072C139    mov         ebp,esp
 0072C13B    mov         ecx,5
 0072C140    push        0
 0072C142    push        0
 0072C144    dec         ecx
>0072C145    jne         0072C140
 0072C147    push        ecx
 0072C148    push        ebx
 0072C149    push        esi
 0072C14A    push        edi
 0072C14B    mov         dword ptr [ebp-4],eax
 0072C14E    mov         eax,dword ptr [ebp-4]
 0072C151    call        @IntfAddRef
 0072C156    xor         eax,eax
 0072C158    push        ebp
 0072C159    push        72C300
 0072C15E    push        dword ptr fs:[eax]
 0072C161    mov         dword ptr fs:[eax],esp
 0072C164    lea         edx,[ebp-0C]
 0072C167    mov         eax,dword ptr [ebp-4]
 0072C16A    mov         ecx,dword ptr [eax]
 0072C16C    call        dword ptr [ecx+14]
 0072C16F    mov         eax,dword ptr [ebp-0C]
 0072C172    lea         edx,[ebp-8]
 0072C175    mov         ecx,dword ptr [eax]
 0072C177    call        dword ptr [ecx+34]
 0072C17A    cmp         dword ptr [ebp-8],0
>0072C17E    je          0072C2C2
 0072C184    xor         eax,eax
 0072C186    push        ebp
 0072C187    push        72C295
 0072C18C    push        dword ptr fs:[eax]
 0072C18F    mov         dword ptr fs:[eax],esp
 0072C192    mov         eax,dword ptr [ebp-8]
 0072C195    mov         edx,dword ptr [eax]
 0072C197    call        dword ptr [edx+38]
 0072C19A    cmp         al,8
>0072C19C    jne         0072C1F0
 0072C19E    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072C1A3    mov         eax,dword ptr [eax]
 0072C1A5    mov         eax,dword ptr [eax+394]
 0072C1AB    mov         eax,dword ptr [eax+2A4]
 0072C1B1    mov         edx,72C31C;'/**'
 0072C1B6    mov         ecx,dword ptr [eax]
 0072C1B8    call        dword ptr [ecx+38]
 0072C1BB    lea         edx,[ebp-10]
 0072C1BE    mov         eax,dword ptr [ebp-8]
 0072C1C1    mov         ecx,dword ptr [eax]
 0072C1C3    call        dword ptr [ecx+50]
 0072C1C6    mov         eax,dword ptr [ebp-10]
 0072C1C9    call        0072A620
 0072C1CE    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072C1D3    mov         eax,dword ptr [eax]
 0072C1D5    mov         eax,dword ptr [eax+394]
 0072C1DB    mov         eax,dword ptr [eax+2A4]
 0072C1E1    mov         edx,72C330;'**/'
 0072C1E6    mov         ecx,dword ptr [eax]
 0072C1E8    call        dword ptr [ecx+38]
>0072C1EB    jmp         0072C28B
 0072C1F0    mov         eax,dword ptr [ebp-8]
 0072C1F3    mov         edx,dword ptr [eax]
 0072C1F5    call        dword ptr [edx+38]
 0072C1F8    cmp         al,1
>0072C1FA    jne         0072C28B
 0072C200    lea         edx,[ebp-18]
 0072C203    mov         eax,dword ptr [ebp-8]
 0072C206    mov         ecx,dword ptr [eax]
 0072C208    call        dword ptr [ecx+34]
 0072C20B    mov         eax,dword ptr [ebp-18]
 0072C20E    lea         edx,[ebp-14]
 0072C211    call        LowerCase
 0072C216    mov         eax,dword ptr [ebp-14]
 0072C219    mov         edx,72C344;'command-list'
 0072C21E    call        @UStrEqual
>0072C223    jne         0072C22F
 0072C225    mov         eax,dword ptr [ebp-8]
 0072C228    call        0072B1B4
>0072C22D    jmp         0072C28B
 0072C22F    lea         edx,[ebp-20]
 0072C232    mov         eax,dword ptr [ebp-8]
 0072C235    mov         ecx,dword ptr [eax]
 0072C237    call        dword ptr [ecx+34]
 0072C23A    mov         eax,dword ptr [ebp-20]
 0072C23D    lea         edx,[ebp-1C]
 0072C240    call        LowerCase
 0072C245    mov         eax,dword ptr [ebp-1C]
 0072C248    mov         edx,72C36C;'push-to-talk'
 0072C24D    call        @UStrEqual
>0072C252    jne         0072C25E
 0072C254    mov         eax,dword ptr [ebp-8]
 0072C257    call        0072BC90
>0072C25C    jmp         0072C28B
 0072C25E    lea         edx,[ebp-28]
 0072C261    mov         eax,dword ptr [ebp-8]
 0072C264    mov         ecx,dword ptr [eax]
 0072C266    call        dword ptr [ecx+34]
 0072C269    mov         eax,dword ptr [ebp-28]
 0072C26C    lea         edx,[ebp-24]
 0072C26F    call        LowerCase
 0072C274    mov         eax,dword ptr [ebp-24]
 0072C277    mov         edx,72C394;'sounds'
 0072C27C    call        @UStrEqual
>0072C281    jne         0072C28B
 0072C283    mov         eax,dword ptr [ebp-8]
 0072C286    call        0072BF4C
 0072C28B    xor         eax,eax
 0072C28D    pop         edx
 0072C28E    pop         ecx
 0072C28F    pop         ecx
 0072C290    mov         dword ptr fs:[eax],edx
>0072C293    jmp         0072C29F
>0072C295    jmp         @HandleAnyException
 0072C29A    call        @DoneExcept
 0072C29F    lea         edx,[ebp-2C]
 0072C2A2    mov         eax,dword ptr [ebp-8]
 0072C2A5    mov         ecx,dword ptr [eax]
 0072C2A7    call        dword ptr [ecx+90]
 0072C2AD    mov         edx,dword ptr [ebp-2C]
 0072C2B0    lea         eax,[ebp-8]
 0072C2B3    call        @IntfCopy
 0072C2B8    cmp         dword ptr [ebp-8],0
>0072C2BC    jne         0072C184
 0072C2C2    xor         eax,eax
 0072C2C4    pop         edx
 0072C2C5    pop         ecx
 0072C2C6    pop         ecx
 0072C2C7    mov         dword ptr fs:[eax],edx
 0072C2CA    push        72C307
 0072C2CF    lea         eax,[ebp-2C]
 0072C2D2    call        @IntfClear
 0072C2D7    lea         eax,[ebp-28]
 0072C2DA    mov         edx,7
 0072C2DF    call        @UStrArrayClr
 0072C2E4    lea         eax,[ebp-0C]
 0072C2E7    call        @IntfClear
 0072C2EC    lea         eax,[ebp-8]
 0072C2EF    mov         edx,dword ptr ds:[58A824];IXMLNode
 0072C2F5    mov         ecx,2
 0072C2FA    call        @FinalizeArray
 0072C2FF    ret
>0072C300    jmp         @HandleFinally
>0072C305    jmp         0072C2CF
 0072C307    pop         edi
 0072C308    pop         esi
 0072C309    pop         ebx
 0072C30A    mov         esp,ebp
 0072C30C    pop         ebp
 0072C30D    ret
*}
end;

//0072C3A4
{*procedure sub_0072C3A4(?:?);
begin
 0072C3A4    push        ebp
 0072C3A5    mov         ebp,esp
 0072C3A7    mov         ecx,5C
 0072C3AC    push        0
 0072C3AE    push        0
 0072C3B0    dec         ecx
>0072C3B1    jne         0072C3AC
 0072C3B3    push        ebx
 0072C3B4    push        esi
 0072C3B5    push        edi
 0072C3B6    mov         dword ptr [ebp-4],eax
 0072C3B9    mov         eax,dword ptr [ebp-4]
 0072C3BC    call        @IntfAddRef
 0072C3C1    xor         eax,eax
 0072C3C3    push        ebp
 0072C3C4    push        72D27C
 0072C3C9    push        dword ptr fs:[eax]
 0072C3CC    mov         dword ptr fs:[eax],esp
 0072C3CF    lea         ecx,[ebp-64]
 0072C3D2    mov         edx,72D29C;'name'
 0072C3D7    mov         eax,dword ptr [ebp-4]
 0072C3DA    mov         ebx,dword ptr [eax]
 0072C3DC    call        dword ptr [ebx+0C]
 0072C3DF    lea         eax,[ebp-64]
 0072C3E2    call        VarIsNull
 0072C3E7    test        al,al
>0072C3E9    je          0072C3F5
 0072C3EB    lea         eax,[ebp-0C]
 0072C3EE    call        @UStrClr
>0072C3F3    jmp         0072C410
 0072C3F5    lea         ecx,[ebp-74]
 0072C3F8    mov         edx,72D29C;'name'
 0072C3FD    mov         eax,dword ptr [ebp-4]
 0072C400    mov         ebx,dword ptr [eax]
 0072C402    call        dword ptr [ebx+0C]
 0072C405    lea         edx,[ebp-74]
 0072C408    lea         eax,[ebp-0C]
 0072C40B    call        @VarToUStr
 0072C410    lea         ecx,[ebp-84]
 0072C416    mov         edx,72D2B4;'phrase'
 0072C41B    mov         eax,dword ptr [ebp-4]
 0072C41E    mov         ebx,dword ptr [eax]
 0072C420    call        dword ptr [ebx+0C]
 0072C423    lea         eax,[ebp-84]
 0072C429    call        VarIsNull
 0072C42E    test        al,al
>0072C430    je          0072C43F
 0072C432    lea         eax,[ebp-10]
 0072C435    mov         edx,dword ptr [ebp-0C]
 0072C438    call        @UStrLAsg
>0072C43D    jmp         0072C460
 0072C43F    lea         ecx,[ebp-94]
 0072C445    mov         edx,72D2B4;'phrase'
 0072C44A    mov         eax,dword ptr [ebp-4]
 0072C44D    mov         ebx,dword ptr [eax]
 0072C44F    call        dword ptr [ebx+0C]
 0072C452    lea         edx,[ebp-94]
 0072C458    lea         eax,[ebp-10]
 0072C45B    call        @VarToUStr
 0072C460    lea         eax,[ebp-98]
 0072C466    push        eax
 0072C467    mov         ecx,5
 0072C46C    mov         edx,1
 0072C471    mov         eax,dword ptr [ebp-10]
 0072C474    call        @UStrCopy
 0072C479    mov         eax,dword ptr [ebp-98]
 0072C47F    mov         edx,72D2D0;'#####'
 0072C484    call        @UStrEqual
>0072C489    jne         0072C493
 0072C48B    lea         eax,[ebp-10]
 0072C48E    call        @UStrClr
 0072C493    lea         eax,[ebp-3C]
 0072C496    call        @UStrClr
 0072C49B    mov         ebx,1
 0072C4A0    lea         edx,[ebp-0B0]
 0072C4A6    mov         eax,ebx
 0072C4A8    call        IntToStr
 0072C4AD    mov         ecx,dword ptr [ebp-0B0]
 0072C4B3    lea         eax,[ebp-0AC]
 0072C4B9    mov         edx,72D2B4;'phrase'
 0072C4BE    call        @UStrCat3
 0072C4C3    mov         edx,dword ptr [ebp-0AC]
 0072C4C9    lea         ecx,[ebp-0A8]
 0072C4CF    mov         eax,dword ptr [ebp-4]
 0072C4D2    mov         esi,dword ptr [eax]
 0072C4D4    call        dword ptr [esi+0C]
 0072C4D7    lea         eax,[ebp-0A8]
 0072C4DD    call        VarIsNull
 0072C4E2    test        al,al
>0072C4E4    jne         0072C5E6
 0072C4EA    lea         edx,[ebp-0C8]
 0072C4F0    mov         eax,ebx
 0072C4F2    call        IntToStr
 0072C4F7    mov         ecx,dword ptr [ebp-0C8]
 0072C4FD    lea         eax,[ebp-0C4]
 0072C503    mov         edx,72D2B4;'phrase'
 0072C508    call        @UStrCat3
 0072C50D    mov         edx,dword ptr [ebp-0C4]
 0072C513    lea         ecx,[ebp-0C0]
 0072C519    mov         eax,dword ptr [ebp-4]
 0072C51C    mov         esi,dword ptr [eax]
 0072C51E    call        dword ptr [esi+0C]
 0072C521    lea         eax,[ebp-0C0]
 0072C527    push        eax
 0072C528    lea         eax,[ebp-0D8]
 0072C52E    xor         edx,edx
 0072C530    call        @OleVarFromUStr
 0072C535    lea         edx,[ebp-0D8]
 0072C53B    pop         eax
 0072C53C    call        @VarCmpNE
>0072C541    je          0072C5E6
 0072C547    lea         eax,[ebp-0EC]
 0072C54D    mov         ecx,72D2E8;' or said("'
 0072C552    mov         edx,dword ptr [ebp-3C]
 0072C555    call        @UStrCat3
 0072C55A    mov         edx,dword ptr [ebp-0EC]
 0072C560    lea         eax,[ebp-0E8]
 0072C566    call        @OleVarFromUStr
 0072C56B    lea         eax,[ebp-0E8]
 0072C571    push        eax
 0072C572    lea         edx,[ebp-104]
 0072C578    mov         eax,ebx
 0072C57A    call        IntToStr
 0072C57F    mov         ecx,dword ptr [ebp-104]
 0072C585    lea         eax,[ebp-100]
 0072C58B    mov         edx,72D2B4;'phrase'
 0072C590    call        @UStrCat3
 0072C595    mov         edx,dword ptr [ebp-100]
 0072C59B    lea         ecx,[ebp-0FC]
 0072C5A1    mov         eax,dword ptr [ebp-4]
 0072C5A4    mov         esi,dword ptr [eax]
 0072C5A6    call        dword ptr [esi+0C]
 0072C5A9    lea         edx,[ebp-0FC]
 0072C5AF    pop         eax
 0072C5B0    call        @VarAdd
 0072C5B5    lea         eax,[ebp-0E8]
 0072C5BB    push        eax
 0072C5BC    lea         eax,[ebp-114]
 0072C5C2    mov         edx,72D30C;'")'
 0072C5C7    call        @OleVarFromUStr
 0072C5CC    lea         edx,[ebp-114]
 0072C5D2    pop         eax
 0072C5D3    call        @VarAdd
 0072C5D8    lea         edx,[ebp-0E8]
 0072C5DE    lea         eax,[ebp-3C]
 0072C5E1    call        @VarToUStr
 0072C5E6    inc         ebx
 0072C5E7    cmp         ebx,15
>0072C5EA    jne         0072C4A0
 0072C5F0    cmp         dword ptr [ebp-3C],0
>0072C5F4    jne         0072C612
 0072C5F6    push        72D320;'said("'
 0072C5FB    push        dword ptr [ebp-10]
 0072C5FE    push        72D30C;'")'
 0072C603    lea         eax,[ebp-3C]
 0072C606    mov         edx,3
 0072C60B    call        @UStrCatN
>0072C610    jmp         0072C62F
 0072C612    push        72D320;'said("'
 0072C617    push        dword ptr [ebp-10]
 0072C61A    push        72D30C;'")'
 0072C61F    push        dword ptr [ebp-3C]
 0072C622    lea         eax,[ebp-3C]
 0072C625    mov         edx,4
 0072C62A    call        @UStrCatN
 0072C62F    lea         ecx,[ebp-124]
 0072C635    mov         edx,72D33C;'profile'
 0072C63A    mov         eax,dword ptr [ebp-4]
 0072C63D    mov         ebx,dword ptr [eax]
 0072C63F    call        dword ptr [ebx+0C]
 0072C642    lea         eax,[ebp-124]
 0072C648    call        VarIsNull
 0072C64D    test        al,al
>0072C64F    je          0072C65B
 0072C651    lea         eax,[ebp-18]
 0072C654    call        @UStrClr
>0072C659    jmp         0072C67C
 0072C65B    lea         ecx,[ebp-134]
 0072C661    mov         edx,72D33C;'profile'
 0072C666    mov         eax,dword ptr [ebp-4]
 0072C669    mov         ebx,dword ptr [eax]
 0072C66B    call        dword ptr [ebx+0C]
 0072C66E    lea         edx,[ebp-134]
 0072C674    lea         eax,[ebp-18]
 0072C677    call        @VarToUStr
 0072C67C    lea         ecx,[ebp-144]
 0072C682    mov         edx,72D358;'program'
 0072C687    mov         eax,dword ptr [ebp-4]
 0072C68A    mov         ebx,dword ptr [eax]
 0072C68C    call        dword ptr [ebx+0C]
 0072C68F    lea         eax,[ebp-144]
 0072C695    call        VarIsNull
 0072C69A    test        al,al
>0072C69C    je          0072C6A8
 0072C69E    lea         eax,[ebp-28]
 0072C6A1    call        @UStrClr
>0072C6A6    jmp         0072C6C9
 0072C6A8    lea         ecx,[ebp-154]
 0072C6AE    mov         edx,72D358;'program'
 0072C6B3    mov         eax,dword ptr [ebp-4]
 0072C6B6    mov         ebx,dword ptr [eax]
 0072C6B8    call        dword ptr [ebx+0C]
 0072C6BB    lea         edx,[ebp-154]
 0072C6C1    lea         eax,[ebp-28]
 0072C6C4    call        @VarToUStr
 0072C6C9    lea         ecx,[ebp-164]
 0072C6CF    mov         edx,72D374;'successphrase'
 0072C6D4    mov         eax,dword ptr [ebp-4]
 0072C6D7    mov         ebx,dword ptr [eax]
 0072C6D9    call        dword ptr [ebx+0C]
 0072C6DC    lea         eax,[ebp-164]
 0072C6E2    call        VarIsNull
 0072C6E7    test        al,al
>0072C6E9    je          0072C6F5
 0072C6EB    lea         eax,[ebp-2C]
 0072C6EE    call        @UStrClr
>0072C6F3    jmp         0072C716
 0072C6F5    lea         ecx,[ebp-174]
 0072C6FB    mov         edx,72D374;'successphrase'
 0072C700    mov         eax,dword ptr [ebp-4]
 0072C703    mov         ebx,dword ptr [eax]
 0072C705    call        dword ptr [ebx+0C]
 0072C708    lea         edx,[ebp-174]
 0072C70E    lea         eax,[ebp-2C]
 0072C711    call        @VarToUStr
 0072C716    lea         ecx,[ebp-184]
 0072C71C    mov         edx,72D39C;'sndok'
 0072C721    mov         eax,dword ptr [ebp-4]
 0072C724    mov         ebx,dword ptr [eax]
 0072C726    call        dword ptr [ebx+0C]
 0072C729    lea         eax,[ebp-184]
 0072C72F    call        VarIsNull
 0072C734    test        al,al
>0072C736    je          0072C742
 0072C738    lea         eax,[ebp-30]
 0072C73B    call        @UStrClr
>0072C740    jmp         0072C763
 0072C742    lea         ecx,[ebp-194]
 0072C748    mov         edx,72D39C;'sndok'
 0072C74D    mov         eax,dword ptr [ebp-4]
 0072C750    mov         ebx,dword ptr [eax]
 0072C752    call        dword ptr [ebx+0C]
 0072C755    lea         edx,[ebp-194]
 0072C75B    lea         eax,[ebp-30]
 0072C75E    call        @VarToUStr
 0072C763    lea         ecx,[ebp-1A4]
 0072C769    mov         edx,72D3B4;'vacmode'
 0072C76E    mov         eax,dword ptr [ebp-4]
 0072C771    mov         ebx,dword ptr [eax]
 0072C773    call        dword ptr [ebx+0C]
 0072C776    lea         eax,[ebp-1A4]
 0072C77C    call        VarIsNull
 0072C781    test        al,al
>0072C783    je          0072C78F
 0072C785    lea         eax,[ebp-34]
 0072C788    call        @UStrClr
>0072C78D    jmp         0072C7B0
 0072C78F    lea         ecx,[ebp-1B4]
 0072C795    mov         edx,72D3B4;'vacmode'
 0072C79A    mov         eax,dword ptr [ebp-4]
 0072C79D    mov         ebx,dword ptr [eax]
 0072C79F    call        dword ptr [ebx+0C]
 0072C7A2    lea         edx,[ebp-1B4]
 0072C7A8    lea         eax,[ebp-34]
 0072C7AB    call        @VarToUStr
 0072C7B0    lea         ecx,[ebp-1C4]
 0072C7B6    mov         edx,72D3D0;'feedback'
 0072C7BB    mov         eax,dword ptr [ebp-4]
 0072C7BE    mov         ebx,dword ptr [eax]
 0072C7C0    call        dword ptr [ebx+0C]
 0072C7C3    lea         eax,[ebp-1C4]
 0072C7C9    call        VarIsNull
 0072C7CE    test        al,al
>0072C7D0    je          0072C7DC
 0072C7D2    lea         eax,[ebp-38]
 0072C7D5    call        @UStrClr
>0072C7DA    jmp         0072C7FD
 0072C7DC    lea         ecx,[ebp-1D4]
 0072C7E2    mov         edx,72D3D0;'feedback'
 0072C7E7    mov         eax,dword ptr [ebp-4]
 0072C7EA    mov         ebx,dword ptr [eax]
 0072C7EC    call        dword ptr [ebx+0C]
 0072C7EF    lea         edx,[ebp-1D4]
 0072C7F5    lea         eax,[ebp-38]
 0072C7F8    call        @VarToUStr
 0072C7FD    lea         edx,[ebp-1D8]
 0072C803    mov         eax,dword ptr [ebp-4]
 0072C806    mov         ecx,dword ptr [eax]
 0072C808    call        dword ptr [ecx+14]
 0072C80B    mov         eax,dword ptr [ebp-1D8]
 0072C811    lea         edx,[ebp-8]
 0072C814    mov         ecx,dword ptr [eax]
 0072C816    call        dword ptr [ecx+34]
 0072C819    lea         eax,[ebp-14]
 0072C81C    call        @UStrClr
 0072C821    cmp         dword ptr [ebp-30],0
>0072C825    je          0072C841
 0072C827    push        72D3F0;'PlaySound("'
 0072C82C    push        dword ptr [ebp-30]
 0072C82F    push        72D30C;'")'
 0072C834    lea         eax,[ebp-14]
 0072C837    mov         edx,3
 0072C83C    call        @UStrCatN
 0072C841    cmp         dword ptr [ebp-2C],0
>0072C845    je          0072C877
 0072C847    cmp         dword ptr [ebp-14],0
>0072C84B    je          0072C85A
 0072C84D    lea         eax,[ebp-14]
 0072C850    mov         edx,72D414;', '
 0072C855    call        @UStrCat
 0072C85A    push        dword ptr [ebp-14]
 0072C85D    push        72D428;'Say("'
 0072C862    push        dword ptr [ebp-2C]
 0072C865    push        72D30C;'")'
 0072C86A    lea         eax,[ebp-14]
 0072C86D    mov         edx,4
 0072C872    call        @UStrCatN
 0072C877    cmp         dword ptr [ebp-8],0
>0072C87B    je          0072CD85
 0072C881    xor         eax,eax
 0072C883    push        ebp
 0072C884    push        72CD52
 0072C889    push        dword ptr fs:[eax]
 0072C88C    mov         dword ptr fs:[eax],esp
 0072C88F    mov         eax,dword ptr [ebp-8]
 0072C892    mov         edx,dword ptr [eax]
 0072C894    call        dword ptr [edx+38]
 0072C897    cmp         al,8
>0072C899    jne         0072C8F3
 0072C89B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072C8A0    mov         eax,dword ptr [eax]
 0072C8A2    mov         eax,dword ptr [eax+394]
 0072C8A8    mov         eax,dword ptr [eax+2A4]
 0072C8AE    mov         edx,72D440;'/*****************************************'
 0072C8B3    mov         ecx,dword ptr [eax]
 0072C8B5    call        dword ptr [ecx+38]
 0072C8B8    lea         edx,[ebp-1DC]
 0072C8BE    mov         eax,dword ptr [ebp-8]
 0072C8C1    mov         ecx,dword ptr [eax]
 0072C8C3    call        dword ptr [ecx+50]
 0072C8C6    mov         eax,dword ptr [ebp-1DC]
 0072C8CC    call        0072A620
 0072C8D1    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072C8D6    mov         eax,dword ptr [eax]
 0072C8D8    mov         eax,dword ptr [eax+394]
 0072C8DE    mov         eax,dword ptr [eax+2A4]
 0072C8E4    mov         edx,72D4A4;'*****************************************/'
 0072C8E9    mov         ecx,dword ptr [eax]
 0072C8EB    call        dword ptr [ecx+38]
>0072C8EE    jmp         0072CD48
 0072C8F3    mov         eax,dword ptr [ebp-8]
 0072C8F6    mov         edx,dword ptr [eax]
 0072C8F8    call        dword ptr [edx+38]
 0072C8FB    cmp         al,1
>0072C8FD    jne         0072CD48
 0072C903    lea         edx,[ebp-1E4]
 0072C909    mov         eax,dword ptr [ebp-8]
 0072C90C    mov         ecx,dword ptr [eax]
 0072C90E    call        dword ptr [ecx+34]
 0072C911    mov         eax,dword ptr [ebp-1E4]
 0072C917    lea         edx,[ebp-1E0]
 0072C91D    call        LowerCase
 0072C922    mov         eax,dword ptr [ebp-1E0]
 0072C928    mov         edx,72D508;'key'
 0072C92D    call        @UStrEqual
>0072C932    jne         0072CD48
 0072C938    lea         ecx,[ebp-1F4]
 0072C93E    mov         edx,72D51C;'qual'
 0072C943    mov         eax,dword ptr [ebp-8]
 0072C946    mov         ebx,dword ptr [eax]
 0072C948    call        dword ptr [ebx+0C]
 0072C94B    lea         eax,[ebp-1F4]
 0072C951    call        VarIsNull
 0072C956    test        al,al
>0072C958    je          0072C964
 0072C95A    lea         eax,[ebp-24]
 0072C95D    call        @UStrClr
>0072C962    jmp         0072C996
 0072C964    lea         ecx,[ebp-208]
 0072C96A    mov         edx,72D51C;'qual'
 0072C96F    mov         eax,dword ptr [ebp-8]
 0072C972    mov         ebx,dword ptr [eax]
 0072C974    call        dword ptr [ebx+0C]
 0072C977    lea         edx,[ebp-208]
 0072C97D    lea         eax,[ebp-1F8]
 0072C983    call        @VarToUStr
 0072C988    mov         eax,dword ptr [ebp-1F8]
 0072C98E    lea         edx,[ebp-24]
 0072C991    call        Trim
 0072C996    lea         edx,[ebp-20C]
 0072C99C    mov         eax,dword ptr [ebp-24]
 0072C99F    call        UpperCase
 0072C9A4    mov         eax,dword ptr [ebp-20C]
 0072C9AA    mov         edx,72D534;'NONE'
 0072C9AF    call        @UStrEqual
>0072C9B4    jne         0072C9BE
 0072C9B6    lea         eax,[ebp-24]
 0072C9B9    call        @UStrClr
 0072C9BE    lea         ecx,[ebp-21C]
 0072C9C4    mov         edx,72D54C;'repeat'
 0072C9C9    mov         eax,dword ptr [ebp-8]
 0072C9CC    mov         ebx,dword ptr [eax]
 0072C9CE    call        dword ptr [ebx+0C]
 0072C9D1    lea         eax,[ebp-21C]
 0072C9D7    call        VarIsNull
 0072C9DC    test        al,al
>0072C9DE    je          0072C9E9
 0072C9E0    mov         dword ptr [ebp-40],1
>0072C9E7    jmp         0072CA0A
 0072C9E9    lea         ecx,[ebp-22C]
 0072C9EF    mov         edx,72D54C;'repeat'
 0072C9F4    mov         eax,dword ptr [ebp-8]
 0072C9F7    mov         ebx,dword ptr [eax]
 0072C9F9    call        dword ptr [ebx+0C]
 0072C9FC    lea         eax,[ebp-22C]
 0072CA02    call        @VarToInteger
 0072CA07    mov         dword ptr [ebp-40],eax
 0072CA0A    lea         ecx,[ebp-23C]
 0072CA10    mov         edx,72D568;'value'
 0072CA15    mov         eax,dword ptr [ebp-8]
 0072CA18    mov         ebx,dword ptr [eax]
 0072CA1A    call        dword ptr [ebx+0C]
 0072CA1D    lea         eax,[ebp-23C]
 0072CA23    call        VarIsNull
 0072CA28    test        al,al
>0072CA2A    je          0072CA36
 0072CA2C    lea         eax,[ebp-1C]
 0072CA2F    call        @UStrClr
>0072CA34    jmp         0072CA68
 0072CA36    lea         ecx,[ebp-250]
 0072CA3C    mov         edx,72D568;'value'
 0072CA41    mov         eax,dword ptr [ebp-8]
 0072CA44    mov         ebx,dword ptr [eax]
 0072CA46    call        dword ptr [ebx+0C]
 0072CA49    lea         edx,[ebp-250]
 0072CA4F    lea         eax,[ebp-240]
 0072CA55    call        @VarToUStr
 0072CA5A    mov         eax,dword ptr [ebp-240]
 0072CA60    lea         edx,[ebp-1C]
 0072CA63    call        Trim
 0072CA68    lea         ecx,[ebp-260]
 0072CA6E    mov         edx,72D580;'extended'
 0072CA73    mov         eax,dword ptr [ebp-8]
 0072CA76    mov         ebx,dword ptr [eax]
 0072CA78    call        dword ptr [ebx+0C]
 0072CA7B    lea         eax,[ebp-260]
 0072CA81    call        VarIsNull
 0072CA86    test        al,al
>0072CA88    je          0072CA94
 0072CA8A    lea         eax,[ebp-20]
 0072CA8D    call        @UStrClr
>0072CA92    jmp         0072CAC6
 0072CA94    lea         ecx,[ebp-274]
 0072CA9A    mov         edx,72D580;'extended'
 0072CA9F    mov         eax,dword ptr [ebp-8]
 0072CAA2    mov         ebx,dword ptr [eax]
 0072CAA4    call        dword ptr [ebx+0C]
 0072CAA7    lea         edx,[ebp-274]
 0072CAAD    lea         eax,[ebp-264]
 0072CAB3    call        @VarToUStr
 0072CAB8    mov         eax,dword ptr [ebp-264]
 0072CABE    lea         edx,[ebp-20]
 0072CAC1    call        Trim
 0072CAC6    lea         edx,[ebp-278]
 0072CACC    mov         eax,dword ptr [ebp-20]
 0072CACF    call        UpperCase
 0072CAD4    mov         eax,dword ptr [ebp-278]
 0072CADA    mov         edx,72D534;'NONE'
 0072CADF    call        @UStrEqual
>0072CAE4    jne         0072CAEE
 0072CAE6    lea         eax,[ebp-20]
 0072CAE9    call        @UStrClr
 0072CAEE    cmp         dword ptr [ebp-1C],0
>0072CAF2    jne         0072CB13
 0072CAF4    cmp         dword ptr [ebp-20],0
>0072CAF8    jne         0072CB13
 0072CAFA    cmp         dword ptr [ebp-24],0
>0072CAFE    je          0072CB13
 0072CB00    lea         eax,[ebp-20]
 0072CB03    mov         edx,dword ptr [ebp-24]
 0072CB06    call        @UStrLAsg
 0072CB0B    lea         eax,[ebp-24]
 0072CB0E    call        @UStrClr
 0072CB13    lea         ecx,[ebp-288]
 0072CB19    mov         edx,72D5A0;'toggle'
 0072CB1E    mov         eax,dword ptr [ebp-8]
 0072CB21    mov         ebx,dword ptr [eax]
 0072CB23    call        dword ptr [ebx+0C]
 0072CB26    lea         eax,[ebp-288]
 0072CB2C    call        VarIsNull
 0072CB31    test        al,al
>0072CB33    je          0072CB3B
 0072CB35    mov         byte ptr [ebp-41],0
>0072CB39    jmp         0072CB7B
 0072CB3B    lea         ecx,[ebp-2A0]
 0072CB41    mov         edx,72D5A0;'toggle'
 0072CB46    mov         eax,dword ptr [ebp-8]
 0072CB49    mov         ebx,dword ptr [eax]
 0072CB4B    call        dword ptr [ebx+0C]
 0072CB4E    lea         edx,[ebp-2A0]
 0072CB54    lea         eax,[ebp-290]
 0072CB5A    call        @VarToUStr
 0072CB5F    mov         eax,dword ptr [ebp-290]
 0072CB65    lea         edx,[ebp-28C]
 0072CB6B    call        Trim
 0072CB70    cmp         dword ptr [ebp-28C],0
 0072CB77    setne       byte ptr [ebp-41]
 0072CB7B    cmp         byte ptr [ebp-41],0
>0072CB7F    je          0072CBC6
 0072CB81    cmp         dword ptr [ebp-14],0
>0072CB85    je          0072CBB9
 0072CB87    mov         eax,dword ptr [ebp-14]
 0072CB8A    mov         dword ptr [ebp-48],eax
 0072CB8D    cmp         dword ptr [ebp-48],0
>0072CB91    je          0072CB9E
 0072CB93    mov         eax,dword ptr [ebp-48]
 0072CB96    sub         eax,4
 0072CB99    mov         eax,dword ptr [eax]
 0072CB9B    mov         dword ptr [ebp-48],eax
 0072CB9E    mov         eax,dword ptr [ebp-14]
 0072CBA1    mov         edx,dword ptr [ebp-48]
 0072CBA4    cmp         word ptr [eax+edx*2-2],28
>0072CBAA    je          0072CBB9
 0072CBAC    lea         eax,[ebp-14]
 0072CBAF    mov         edx,72D414;', '
 0072CBB4    call        @UStrCat
 0072CBB9    lea         eax,[ebp-14]
 0072CBBC    mov         edx,72D5BC;'Toggle('
 0072CBC1    call        @UStrCat
 0072CBC6    cmp         dword ptr [ebp-24],0
>0072CBCA    je          0072CC2D
 0072CBCC    cmp         dword ptr [ebp-14],0
>0072CBD0    je          0072CC04
 0072CBD2    mov         eax,dword ptr [ebp-14]
 0072CBD5    mov         dword ptr [ebp-4C],eax
 0072CBD8    cmp         dword ptr [ebp-4C],0
>0072CBDC    je          0072CBE9
 0072CBDE    mov         eax,dword ptr [ebp-4C]
 0072CBE1    sub         eax,4
 0072CBE4    mov         eax,dword ptr [eax]
 0072CBE6    mov         dword ptr [ebp-4C],eax
 0072CBE9    mov         eax,dword ptr [ebp-14]
 0072CBEC    mov         edx,dword ptr [ebp-4C]
 0072CBEF    cmp         word ptr [eax+edx*2-2],28
>0072CBF5    je          0072CC04
 0072CBF7    lea         eax,[ebp-14]
 0072CBFA    mov         edx,72D414;', '
 0072CBFF    call        @UStrCat
 0072CC04    push        dword ptr [ebp-14]
 0072CC07    lea         edx,[ebp-2A4]
 0072CC0D    mov         eax,dword ptr [ebp-24]
 0072CC10    call        0072A6FC
 0072CC15    push        dword ptr [ebp-2A4]
 0072CC1B    push        72D5D8;'+('
 0072CC20    lea         eax,[ebp-14]
 0072CC23    mov         edx,3
 0072CC28    call        @UStrCatN
 0072CC2D    mov         esi,dword ptr [ebp-40]
 0072CC30    test        esi,esi
>0072CC32    jle         0072CD03
 0072CC38    cmp         dword ptr [ebp-1C],0
>0072CC3C    jne         0072CC48
 0072CC3E    cmp         dword ptr [ebp-20],0
>0072CC42    je          0072CCFC
 0072CC48    cmp         dword ptr [ebp-1C],0
>0072CC4C    je          0072CCA2
 0072CC4E    cmp         dword ptr [ebp-14],0
>0072CC52    je          0072CC86
 0072CC54    mov         eax,dword ptr [ebp-14]
 0072CC57    mov         dword ptr [ebp-50],eax
 0072CC5A    cmp         dword ptr [ebp-50],0
>0072CC5E    je          0072CC6B
 0072CC60    mov         eax,dword ptr [ebp-50]
 0072CC63    sub         eax,4
 0072CC66    mov         eax,dword ptr [eax]
 0072CC68    mov         dword ptr [ebp-50],eax
 0072CC6B    mov         eax,dword ptr [ebp-14]
 0072CC6E    mov         edx,dword ptr [ebp-50]
 0072CC71    cmp         word ptr [eax+edx*2-2],28
>0072CC77    je          0072CC86
 0072CC79    lea         eax,[ebp-14]
 0072CC7C    mov         edx,72D414;', '
 0072CC81    call        @UStrCat
 0072CC86    lea         edx,[ebp-2A8]
 0072CC8C    mov         eax,dword ptr [ebp-1C]
 0072CC8F    call        0072AAB8
 0072CC94    mov         edx,dword ptr [ebp-2A8]
 0072CC9A    lea         eax,[ebp-14]
 0072CC9D    call        @UStrCat
 0072CCA2    cmp         dword ptr [ebp-20],0
>0072CCA6    je          0072CCFC
 0072CCA8    cmp         dword ptr [ebp-14],0
>0072CCAC    je          0072CCE0
 0072CCAE    mov         eax,dword ptr [ebp-14]
 0072CCB1    mov         dword ptr [ebp-54],eax
 0072CCB4    cmp         dword ptr [ebp-54],0
>0072CCB8    je          0072CCC5
 0072CCBA    mov         eax,dword ptr [ebp-54]
 0072CCBD    sub         eax,4
 0072CCC0    mov         eax,dword ptr [eax]
 0072CCC2    mov         dword ptr [ebp-54],eax
 0072CCC5    mov         eax,dword ptr [ebp-14]
 0072CCC8    mov         edx,dword ptr [ebp-54]
 0072CCCB    cmp         word ptr [eax+edx*2-2],28
>0072CCD1    je          0072CCE0
 0072CCD3    lea         eax,[ebp-14]
 0072CCD6    mov         edx,72D414;', '
 0072CCDB    call        @UStrCat
 0072CCE0    lea         edx,[ebp-2AC]
 0072CCE6    mov         eax,dword ptr [ebp-20]
 0072CCE9    call        0072A6FC
 0072CCEE    mov         edx,dword ptr [ebp-2AC]
 0072CCF4    lea         eax,[ebp-14]
 0072CCF7    call        @UStrCat
 0072CCFC    dec         esi
>0072CCFD    jne         0072CC38
 0072CD03    cmp         dword ptr [ebp-24],0
>0072CD07    je          0072CD16
 0072CD09    lea         eax,[ebp-14]
 0072CD0C    mov         edx,72D5EC;')'
 0072CD11    call        @UStrCat
 0072CD16    cmp         byte ptr [ebp-41],0
>0072CD1A    je          0072CD29
 0072CD1C    lea         eax,[ebp-14]
 0072CD1F    mov         edx,72D5EC;')'
 0072CD24    call        @UStrCat
 0072CD29    lea         edx,[ebp-2B0]
 0072CD2F    mov         eax,dword ptr [ebp-8]
 0072CD32    mov         ecx,dword ptr [eax]
 0072CD34    call        dword ptr [ecx+90]
 0072CD3A    mov         edx,dword ptr [ebp-2B0]
 0072CD40    lea         eax,[ebp-8]
 0072CD43    call        @IntfCopy
 0072CD48    xor         eax,eax
 0072CD4A    pop         edx
 0072CD4B    pop         ecx
 0072CD4C    pop         ecx
 0072CD4D    mov         dword ptr fs:[eax],edx
>0072CD50    jmp         0072CD5C
>0072CD52    jmp         @HandleAnyException
 0072CD57    call        @DoneExcept
 0072CD5C    lea         edx,[ebp-2B4]
 0072CD62    mov         eax,dword ptr [ebp-8]
 0072CD65    mov         ecx,dword ptr [eax]
 0072CD67    call        dword ptr [ecx+90]
 0072CD6D    mov         edx,dword ptr [ebp-2B4]
 0072CD73    lea         eax,[ebp-8]
 0072CD76    call        @IntfCopy
 0072CD7B    cmp         dword ptr [ebp-8],0
>0072CD7F    jne         0072C881
 0072CD85    cmp         dword ptr [ebp-38],0
>0072CD89    je          0072CDAB
 0072CD8B    cmp         dword ptr [ebp-14],0
>0072CD8F    je          0072CD9E
 0072CD91    lea         eax,[ebp-14]
 0072CD94    mov         edx,72D414;', '
 0072CD99    call        @UStrCat
 0072CD9E    lea         eax,[ebp-14]
 0072CDA1    mov         edx,72D5FC;'Toggle(var.Feedback)'
 0072CDA6    call        @UStrCat
 0072CDAB    lea         edx,[ebp-2B8]
 0072CDB1    mov         eax,dword ptr [ebp-34]
 0072CDB4    call        LowerCase
 0072CDB9    mov         eax,dword ptr [ebp-2B8]
 0072CDBF    mov         edx,72D634;'sleep'
 0072CDC4    call        @UStrEqual
>0072CDC9    jne         0072CDED
 0072CDCB    cmp         dword ptr [ebp-14],0
>0072CDCF    je          0072CDDE
 0072CDD1    lea         eax,[ebp-14]
 0072CDD4    mov         edx,72D414;', '
 0072CDD9    call        @UStrCat
 0072CDDE    lea         eax,[ebp-14]
 0072CDE1    mov         edx,72D64C;'Release(var.Awake)'
 0072CDE6    call        @UStrCat
>0072CDEB    jmp         0072CE2D
 0072CDED    lea         edx,[ebp-2BC]
 0072CDF3    mov         eax,dword ptr [ebp-34]
 0072CDF6    call        LowerCase
 0072CDFB    mov         eax,dword ptr [ebp-2BC]
 0072CE01    mov         edx,72D680;'awake'
 0072CE06    call        @UStrEqual
>0072CE0B    jne         0072CE2D
 0072CE0D    cmp         dword ptr [ebp-14],0
>0072CE11    je          0072CE20
 0072CE13    lea         eax,[ebp-14]
 0072CE16    mov         edx,72D414;', '
 0072CE1B    call        @UStrCat
 0072CE20    lea         eax,[ebp-14]
 0072CE23    mov         edx,72D698;'Press(var.Awake)'
 0072CE28    call        @UStrCat
 0072CE2D    cmp         dword ptr [ebp-28],0
>0072CE31    je          0072CE63
 0072CE33    cmp         dword ptr [ebp-14],0
>0072CE37    je          0072CE46
 0072CE39    lea         eax,[ebp-14]
 0072CE3C    mov         edx,72D414;', '
 0072CE41    call        @UStrCat
 0072CE46    push        dword ptr [ebp-14]
 0072CE49    push        72D6C8;'Execute("'
 0072CE4E    push        dword ptr [ebp-28]
 0072CE51    push        72D30C;'")'
 0072CE56    lea         eax,[ebp-14]
 0072CE59    mov         edx,4
 0072CE5E    call        @UStrCatN
 0072CE63    cmp         dword ptr [ebp-18],0
>0072CE67    je          0072CE99
 0072CE69    cmp         dword ptr [ebp-14],0
>0072CE6D    je          0072CE7C
 0072CE6F    lea         eax,[ebp-14]
 0072CE72    mov         edx,72D414;', '
 0072CE77    call        @UStrCat
 0072CE7C    push        dword ptr [ebp-14]
 0072CE7F    push        72D6E8;'Chain("'
 0072CE84    push        dword ptr [ebp-18]
 0072CE87    push        72D30C;'")'
 0072CE8C    lea         eax,[ebp-14]
 0072CE8F    mov         edx,4
 0072CE94    call        @UStrCatN
 0072CE99    cmp         dword ptr [ebp-10],0
>0072CE9D    jne         0072CEDF
 0072CE9F    push        72D704;'///////// '
 0072CEA4    push        dword ptr [ebp-0C]
 0072CEA7    push        72D728;' ///////////'
 0072CEAC    lea         eax,[ebp-2C0]
 0072CEB2    mov         edx,3
 0072CEB7    call        @UStrCatN
 0072CEBC    mov         edx,dword ptr [ebp-2C0]
 0072CEC2    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072CEC7    mov         eax,dword ptr [eax]
 0072CEC9    mov         eax,dword ptr [eax+394]
 0072CECF    mov         eax,dword ptr [eax+2A4]
 0072CED5    mov         ecx,dword ptr [eax]
 0072CED7    call        dword ptr [ecx+38]
>0072CEDA    jmp         0072D090
 0072CEDF    lea         eax,[ebp-2C4]
 0072CEE5    mov         ecx,dword ptr [ebp-0C]
 0072CEE8    mov         edx,72D750;'// '
 0072CEED    call        @UStrCat3
 0072CEF2    mov         edx,dword ptr [ebp-2C4]
 0072CEF8    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072CEFD    mov         eax,dword ptr [eax]
 0072CEFF    mov         eax,dword ptr [eax+394]
 0072CF05    mov         eax,dword ptr [eax+2A4]
 0072CF0B    mov         ecx,dword ptr [eax]
 0072CF0D    call        dword ptr [ecx+38]
 0072CF10    lea         edx,[ebp-2C8]
 0072CF16    mov         eax,dword ptr [ebp-14]
 0072CF19    call        Trim
 0072CF1E    cmp         dword ptr [ebp-2C8],0
>0072CF25    je          0072CFF2
 0072CF2B    lea         edx,[ebp-2CC]
 0072CF31    mov         eax,dword ptr [ebp-34]
 0072CF34    call        LowerCase
 0072CF39    mov         eax,dword ptr [ebp-2CC]
 0072CF3F    mov         edx,72D680;'awake'
 0072CF44    call        @UStrEqual
>0072CF49    jne         0072CF89
 0072CF4B    push        dword ptr [ebp-3C]
 0072CF4E    push        72D764;' => '
 0072CF53    push        dword ptr [ebp-14]
 0072CF56    lea         eax,[ebp-2D0]
 0072CF5C    mov         edx,3
 0072CF61    call        @UStrCatN
 0072CF66    mov         edx,dword ptr [ebp-2D0]
 0072CF6C    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072CF71    mov         eax,dword ptr [eax]
 0072CF73    mov         eax,dword ptr [eax+394]
 0072CF79    mov         eax,dword ptr [eax+2A4]
 0072CF7F    mov         ecx,dword ptr [eax]
 0072CF81    call        dword ptr [ecx+38]
>0072CF84    jmp         0072D090
 0072CF89    mov         edx,dword ptr [ebp-3C]
 0072CF8C    mov         eax,72D77C;'") or said("'
 0072CF91    call        Pos
 0072CF96    test        eax,eax
>0072CF98    jle         0072CFB4
 0072CF9A    push        72D7A4;'('
 0072CF9F    push        dword ptr [ebp-3C]
 0072CFA2    push        72D5EC;')'
 0072CFA7    lea         eax,[ebp-3C]
 0072CFAA    mov         edx,3
 0072CFAF    call        @UStrCatN
 0072CFB4    push        dword ptr [ebp-3C]
 0072CFB7    push        72D7B4;' and var.Awake => '
 0072CFBC    push        dword ptr [ebp-14]
 0072CFBF    lea         eax,[ebp-2D4]
 0072CFC5    mov         edx,3
 0072CFCA    call        @UStrCatN
 0072CFCF    mov         edx,dword ptr [ebp-2D4]
 0072CFD5    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072CFDA    mov         eax,dword ptr [eax]
 0072CFDC    mov         eax,dword ptr [eax+394]
 0072CFE2    mov         eax,dword ptr [eax+2A4]
 0072CFE8    mov         ecx,dword ptr [eax]
 0072CFEA    call        dword ptr [ecx+38]
>0072CFED    jmp         0072D090
 0072CFF2    lea         edx,[ebp-2D8]
 0072CFF8    mov         eax,dword ptr [ebp-34]
 0072CFFB    call        LowerCase
 0072D000    mov         eax,dword ptr [ebp-2D8]
 0072D006    mov         edx,72D680;'awake'
 0072D00B    call        @UStrEqual
>0072D010    jne         0072D052
 0072D012    push        72D7E8;'// said("'
 0072D017    push        dword ptr [ebp-10]
 0072D01A    push        72D808;'") => '
 0072D01F    push        dword ptr [ebp-14]
 0072D022    lea         eax,[ebp-2DC]
 0072D028    mov         edx,4
 0072D02D    call        @UStrCatN
 0072D032    mov         edx,dword ptr [ebp-2DC]
 0072D038    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072D03D    mov         eax,dword ptr [eax]
 0072D03F    mov         eax,dword ptr [eax+394]
 0072D045    mov         eax,dword ptr [eax+2A4]
 0072D04B    mov         ecx,dword ptr [eax]
 0072D04D    call        dword ptr [ecx+38]
>0072D050    jmp         0072D090
 0072D052    push        72D7E8;'// said("'
 0072D057    push        dword ptr [ebp-10]
 0072D05A    push        72D824;'") and var.Awake => '
 0072D05F    push        dword ptr [ebp-14]
 0072D062    lea         eax,[ebp-2E0]
 0072D068    mov         edx,4
 0072D06D    call        @UStrCatN
 0072D072    mov         edx,dword ptr [ebp-2E0]
 0072D078    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072D07D    mov         eax,dword ptr [eax]
 0072D07F    mov         eax,dword ptr [eax+394]
 0072D085    mov         eax,dword ptr [eax+2A4]
 0072D08B    mov         ecx,dword ptr [eax]
 0072D08D    call        dword ptr [ecx+38]
 0072D090    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072D095    mov         eax,dword ptr [eax]
 0072D097    mov         eax,dword ptr [eax+394]
 0072D09D    mov         eax,dword ptr [eax+2A4]
 0072D0A3    xor         edx,edx
 0072D0A5    mov         ecx,dword ptr [eax]
 0072D0A7    call        dword ptr [ecx+38]
 0072D0AA    xor         eax,eax
 0072D0AC    pop         edx
 0072D0AD    pop         ecx
 0072D0AE    pop         ecx
 0072D0AF    mov         dword ptr fs:[eax],edx
 0072D0B2    push        72D286
 0072D0B7    lea         eax,[ebp-2E0]
 0072D0BD    mov         edx,0B
 0072D0C2    call        @UStrArrayClr
 0072D0C7    lea         eax,[ebp-2B4]
 0072D0CD    mov         edx,dword ptr ds:[58A824];IXMLNode
 0072D0D3    mov         ecx,2
 0072D0D8    call        @FinalizeArray
 0072D0DD    lea         eax,[ebp-2AC]
 0072D0E3    mov         edx,3
 0072D0E8    call        @UStrArrayClr
 0072D0ED    lea         eax,[ebp-2A0]
 0072D0F3    call        @VarClr
 0072D0F8    lea         eax,[ebp-290]
 0072D0FE    mov         edx,2
 0072D103    call        @UStrArrayClr
 0072D108    lea         eax,[ebp-288]
 0072D10E    call        @VarClr
 0072D113    lea         eax,[ebp-278]
 0072D119    call        @UStrClr
 0072D11E    lea         eax,[ebp-274]
 0072D124    call        @VarClr
 0072D129    lea         eax,[ebp-264]
 0072D12F    call        @UStrClr
 0072D134    lea         eax,[ebp-260]
 0072D13A    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072D140    mov         ecx,2
 0072D145    call        @FinalizeArray
 0072D14A    lea         eax,[ebp-240]
 0072D150    call        @UStrClr
 0072D155    lea         eax,[ebp-23C]
 0072D15B    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072D161    mov         ecx,3
 0072D166    call        @FinalizeArray
 0072D16B    lea         eax,[ebp-20C]
 0072D171    call        @UStrClr
 0072D176    lea         eax,[ebp-208]
 0072D17C    call        @VarClr
 0072D181    lea         eax,[ebp-1F8]
 0072D187    call        @UStrClr
 0072D18C    lea         eax,[ebp-1F4]
 0072D192    call        @VarClr
 0072D197    lea         eax,[ebp-1E4]
 0072D19D    mov         edx,3
 0072D1A2    call        @UStrArrayClr
 0072D1A7    lea         eax,[ebp-1D8]
 0072D1AD    call        @IntfClear
 0072D1B2    lea         eax,[ebp-1D4]
 0072D1B8    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072D1BE    mov         ecx,0D
 0072D1C3    call        @FinalizeArray
 0072D1C8    lea         eax,[ebp-104]
 0072D1CE    mov         edx,2
 0072D1D3    call        @UStrArrayClr
 0072D1D8    lea         eax,[ebp-0FC]
 0072D1DE    call        @VarClr
 0072D1E3    lea         eax,[ebp-0EC]
 0072D1E9    call        @UStrClr
 0072D1EE    lea         eax,[ebp-0E8]
 0072D1F4    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072D1FA    mov         ecx,2
 0072D1FF    call        @FinalizeArray
 0072D204    lea         eax,[ebp-0C8]
 0072D20A    mov         edx,2
 0072D20F    call        @UStrArrayClr
 0072D214    lea         eax,[ebp-0C0]
 0072D21A    call        @VarClr
 0072D21F    lea         eax,[ebp-0B0]
 0072D225    mov         edx,2
 0072D22A    call        @UStrArrayClr
 0072D22F    lea         eax,[ebp-0A8]
 0072D235    call        @VarClr
 0072D23A    lea         eax,[ebp-98]
 0072D240    call        @UStrClr
 0072D245    lea         eax,[ebp-94]
 0072D24B    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072D251    mov         ecx,4
 0072D256    call        @FinalizeArray
 0072D25B    lea         eax,[ebp-3C]
 0072D25E    mov         edx,0D
 0072D263    call        @UStrArrayClr
 0072D268    lea         eax,[ebp-8]
 0072D26B    mov         edx,dword ptr ds:[58A824];IXMLNode
 0072D271    mov         ecx,2
 0072D276    call        @FinalizeArray
 0072D27B    ret
>0072D27C    jmp         @HandleFinally
>0072D281    jmp         0072D0B7
 0072D286    pop         edi
 0072D287    pop         esi
 0072D288    pop         ebx
 0072D289    mov         esp,ebp
 0072D28B    pop         ebp
 0072D28C    ret
end;*}

//0072D850
{*procedure sub_0072D850(?:?);
begin
 0072D850    push        ebp
 0072D851    mov         ebp,esp
 0072D853    mov         ecx,3A
 0072D858    push        0
 0072D85A    push        0
 0072D85C    dec         ecx
>0072D85D    jne         0072D858
 0072D85F    push        ecx
 0072D860    push        ebx
 0072D861    push        esi
 0072D862    mov         dword ptr [ebp-4],eax
 0072D865    mov         eax,dword ptr [ebp-4]
 0072D868    call        @IntfAddRef
 0072D86D    mov         ebx,dword ptr ds:[78D61C];^gvar_00822CA0:TEditorForm
 0072D873    xor         eax,eax
 0072D875    push        ebp
 0072D876    push        72E2D9
 0072D87B    push        dword ptr fs:[eax]
 0072D87E    mov         dword ptr fs:[eax],esp
 0072D881    lea         ecx,[ebp-20]
 0072D884    mov         edx,72E2F8;'key'
 0072D889    mov         eax,dword ptr [ebp-4]
 0072D88C    mov         esi,dword ptr [eax]
 0072D88E    call        dword ptr [esi+0C]
 0072D891    lea         eax,[ebp-20]
 0072D894    call        VarIsNull
 0072D899    test        al,al
>0072D89B    je          0072D8A7
 0072D89D    lea         eax,[ebp-0C]
 0072D8A0    call        @UStrClr
>0072D8A5    jmp         0072D8C2
 0072D8A7    lea         ecx,[ebp-30]
 0072D8AA    mov         edx,72E2F8;'key'
 0072D8AF    mov         eax,dword ptr [ebp-4]
 0072D8B2    mov         esi,dword ptr [eax]
 0072D8B4    call        dword ptr [esi+0C]
 0072D8B7    lea         edx,[ebp-30]
 0072D8BA    lea         eax,[ebp-0C]
 0072D8BD    call        @VarToUStr
 0072D8C2    lea         edx,[ebp-34]
 0072D8C5    mov         eax,dword ptr [ebp-0C]
 0072D8C8    call        UpperCase
 0072D8CD    mov         eax,dword ptr [ebp-34]
 0072D8D0    mov         edx,72E30C;'NONE'
 0072D8D5    call        @UStrEqual
>0072D8DA    jne         0072D8E4
 0072D8DC    lea         eax,[ebp-0C]
 0072D8DF    call        @UStrClr
 0072D8E4    lea         ecx,[ebp-44]
 0072D8E7    mov         edx,72E324;'key1'
 0072D8EC    mov         eax,dword ptr [ebp-4]
 0072D8EF    mov         esi,dword ptr [eax]
 0072D8F1    call        dword ptr [esi+0C]
 0072D8F4    lea         eax,[ebp-44]
 0072D8F7    call        VarIsNull
 0072D8FC    test        al,al
>0072D8FE    je          0072D90A
 0072D900    lea         eax,[ebp-10]
 0072D903    call        @UStrClr
>0072D908    jmp         0072D925
 0072D90A    lea         ecx,[ebp-54]
 0072D90D    mov         edx,72E324;'key1'
 0072D912    mov         eax,dword ptr [ebp-4]
 0072D915    mov         esi,dword ptr [eax]
 0072D917    call        dword ptr [esi+0C]
 0072D91A    lea         edx,[ebp-54]
 0072D91D    lea         eax,[ebp-10]
 0072D920    call        @VarToUStr
 0072D925    lea         edx,[ebp-58]
 0072D928    mov         eax,dword ptr [ebp-10]
 0072D92B    call        UpperCase
 0072D930    mov         eax,dword ptr [ebp-58]
 0072D933    mov         edx,72E30C;'NONE'
 0072D938    call        @UStrEqual
>0072D93D    jne         0072D947
 0072D93F    lea         eax,[ebp-10]
 0072D942    call        @UStrClr
 0072D947    cmp         dword ptr [ebp-0C],0
>0072D94B    je          0072DA6A
 0072D951    cmp         dword ptr [ebp-10],0
>0072D955    je          0072DA6A
 0072D95B    lea         edx,[ebp-8]
 0072D95E    mov         eax,dword ptr [ebp-0C]
 0072D961    call        0072A6FC
 0072D966    cmp         dword ptr [ebp-10],0
>0072D96A    je          0072D995
 0072D96C    cmp         dword ptr [ebp-8],0
>0072D970    je          0072D995
 0072D972    push        dword ptr [ebp-8]
 0072D975    push        72E33C;'+'
 0072D97A    lea         edx,[ebp-5C]
 0072D97D    mov         eax,dword ptr [ebp-10]
 0072D980    call        0072A6FC
 0072D985    push        dword ptr [ebp-5C]
 0072D988    lea         eax,[ebp-8]
 0072D98B    mov         edx,3
 0072D990    call        @UStrCatN
 0072D995    mov         eax,dword ptr [ebx]
 0072D997    mov         eax,dword ptr [eax+394]
 0072D99D    mov         eax,dword ptr [eax+2A4]
 0072D9A3    xor         edx,edx
 0072D9A5    mov         ecx,dword ptr [eax]
 0072D9A7    call        dword ptr [ecx+38]
 0072D9AA    mov         eax,dword ptr [ebx]
 0072D9AC    mov         eax,dword ptr [eax+394]
 0072D9B2    mov         eax,dword ptr [eax+2A4]
 0072D9B8    mov         edx,72E34C;'// Push-to-talk button'
 0072D9BD    mov         ecx,dword ptr [eax]
 0072D9BF    call        dword ptr [ecx+38]
 0072D9C2    mov         eax,dword ptr [ebx]
 0072D9C4    mov         eax,dword ptr [eax+394]
 0072D9CA    mov         eax,dword ptr [eax+2A4]
 0072D9D0    mov         edx,72E388;'if Starting then'
 0072D9D5    mov         ecx,dword ptr [eax]
 0072D9D7    call        dword ptr [ecx+38]
 0072D9DA    mov         eax,dword ptr [ebx]
 0072D9DC    mov         eax,dword ptr [eax+394]
 0072D9E2    mov         eax,dword ptr [eax+2A4]
 0072D9E8    mov         edx,72E3B8;'  var.Awake = false'
 0072D9ED    mov         ecx,dword ptr [eax]
 0072D9EF    call        dword ptr [ecx+38]
 0072D9F2    mov         eax,dword ptr [ebx]
 0072D9F4    mov         eax,dword ptr [eax+394]
 0072D9FA    mov         eax,dword ptr [eax+2A4]
 0072DA00    mov         edx,72E3EC;'endif'
 0072DA05    mov         ecx,dword ptr [eax]
 0072DA07    call        dword ptr [ecx+38]
 0072DA0A    push        72E404;'Pressed('
 0072DA0F    push        dword ptr [ebp-8]
 0072DA12    push        72E424;') => Press(var.Awake)'
 0072DA17    lea         eax,[ebp-60]
 0072DA1A    mov         edx,3
 0072DA1F    call        @UStrCatN
 0072DA24    mov         edx,dword ptr [ebp-60]
 0072DA27    mov         eax,dword ptr [ebx]
 0072DA29    mov         eax,dword ptr [eax+394]
 0072DA2F    mov         eax,dword ptr [eax+2A4]
 0072DA35    mov         ecx,dword ptr [eax]
 0072DA37    call        dword ptr [ecx+38]
 0072DA3A    push        72E45C;'Released('
 0072DA3F    push        dword ptr [ebp-8]
 0072DA42    push        72E47C;') => Release(var.Awake)'
 0072DA47    lea         eax,[ebp-64]
 0072DA4A    mov         edx,3
 0072DA4F    call        @UStrCatN
 0072DA54    mov         edx,dword ptr [ebp-64]
 0072DA57    mov         eax,dword ptr [ebx]
 0072DA59    mov         eax,dword ptr [eax+394]
 0072DA5F    mov         eax,dword ptr [eax+2A4]
 0072DA65    mov         ecx,dword ptr [eax]
 0072DA67    call        dword ptr [ecx+38]
 0072DA6A    lea         ecx,[ebp-74]
 0072DA6D    mov         edx,72E4B8;'vackey1'
 0072DA72    mov         eax,dword ptr [ebp-4]
 0072DA75    mov         esi,dword ptr [eax]
 0072DA77    call        dword ptr [esi+0C]
 0072DA7A    lea         eax,[ebp-74]
 0072DA7D    call        VarIsNull
 0072DA82    test        al,al
>0072DA84    je          0072DA90
 0072DA86    lea         eax,[ebp-0C]
 0072DA89    call        @UStrClr
>0072DA8E    jmp         0072DAB1
 0072DA90    lea         ecx,[ebp-84]
 0072DA96    mov         edx,72E4B8;'vackey1'
 0072DA9B    mov         eax,dword ptr [ebp-4]
 0072DA9E    mov         esi,dword ptr [eax]
 0072DAA0    call        dword ptr [esi+0C]
 0072DAA3    lea         edx,[ebp-84]
 0072DAA9    lea         eax,[ebp-0C]
 0072DAAC    call        @VarToUStr
 0072DAB1    lea         edx,[ebp-88]
 0072DAB7    mov         eax,dword ptr [ebp-0C]
 0072DABA    call        UpperCase
 0072DABF    mov         eax,dword ptr [ebp-88]
 0072DAC5    mov         edx,72E30C;'NONE'
 0072DACA    call        @UStrEqual
>0072DACF    jne         0072DAD9
 0072DAD1    lea         eax,[ebp-0C]
 0072DAD4    call        @UStrClr
 0072DAD9    lea         ecx,[ebp-98]
 0072DADF    mov         edx,72E4D4;'vackey2'
 0072DAE4    mov         eax,dword ptr [ebp-4]
 0072DAE7    mov         esi,dword ptr [eax]
 0072DAE9    call        dword ptr [esi+0C]
 0072DAEC    lea         eax,[ebp-98]
 0072DAF2    call        VarIsNull
 0072DAF7    test        al,al
>0072DAF9    je          0072DB05
 0072DAFB    lea         eax,[ebp-10]
 0072DAFE    call        @UStrClr
>0072DB03    jmp         0072DB26
 0072DB05    lea         ecx,[ebp-0A8]
 0072DB0B    mov         edx,72E4D4;'vackey2'
 0072DB10    mov         eax,dword ptr [ebp-4]
 0072DB13    mov         esi,dword ptr [eax]
 0072DB15    call        dword ptr [esi+0C]
 0072DB18    lea         edx,[ebp-0A8]
 0072DB1E    lea         eax,[ebp-10]
 0072DB21    call        @VarToUStr
 0072DB26    lea         edx,[ebp-0AC]
 0072DB2C    mov         eax,dword ptr [ebp-10]
 0072DB2F    call        UpperCase
 0072DB34    mov         eax,dword ptr [ebp-0AC]
 0072DB3A    mov         edx,72E30C;'NONE'
 0072DB3F    call        @UStrEqual
>0072DB44    jne         0072DB4E
 0072DB46    lea         eax,[ebp-10]
 0072DB49    call        @UStrClr
 0072DB4E    cmp         dword ptr [ebp-0C],0
>0072DB52    je          0072DD75
 0072DB58    cmp         dword ptr [ebp-10],0
>0072DB5C    je          0072DD75
 0072DB62    lea         edx,[ebp-8]
 0072DB65    mov         eax,dword ptr [ebp-0C]
 0072DB68    call        0072A6FC
 0072DB6D    cmp         dword ptr [ebp-10],0
>0072DB71    je          0072DBA2
 0072DB73    cmp         dword ptr [ebp-8],0
>0072DB77    je          0072DBA2
 0072DB79    push        dword ptr [ebp-8]
 0072DB7C    push        72E33C;'+'
 0072DB81    lea         edx,[ebp-0B0]
 0072DB87    mov         eax,dword ptr [ebp-10]
 0072DB8A    call        0072A6FC
 0072DB8F    push        dword ptr [ebp-0B0]
 0072DB95    lea         eax,[ebp-8]
 0072DB98    mov         edx,3
 0072DB9D    call        @UStrCatN
 0072DBA2    mov         eax,dword ptr [ebx]
 0072DBA4    mov         eax,dword ptr [eax+394]
 0072DBAA    mov         eax,dword ptr [eax+2A4]
 0072DBB0    xor         edx,edx
 0072DBB2    mov         ecx,dword ptr [eax]
 0072DBB4    call        dword ptr [ecx+38]
 0072DBB7    mov         eax,dword ptr [ebx]
 0072DBB9    mov         eax,dword ptr [eax+394]
 0072DBBF    mov         eax,dword ptr [eax+2A4]
 0072DBC5    mov         edx,72E4F0;'// VAC On/Off Switch'
 0072DBCA    mov         ecx,dword ptr [eax]
 0072DBCC    call        dword ptr [ecx+38]
 0072DBCF    lea         ecx,[ebp-0C0]
 0072DBD5    mov         edx,72E528;'vaconsnd'
 0072DBDA    mov         eax,dword ptr [ebp-4]
 0072DBDD    mov         esi,dword ptr [eax]
 0072DBDF    call        dword ptr [esi+0C]
 0072DBE2    lea         eax,[ebp-0C0]
 0072DBE8    call        VarIsNull
 0072DBED    test        al,al
>0072DBEF    jne         0072DC87
 0072DBF5    lea         ecx,[ebp-0D4]
 0072DBFB    mov         edx,72E528;'vaconsnd'
 0072DC00    mov         eax,dword ptr [ebp-4]
 0072DC03    mov         esi,dword ptr [eax]
 0072DC05    call        dword ptr [esi+0C]
 0072DC08    lea         edx,[ebp-0D4]
 0072DC0E    lea         eax,[ebp-0C4]
 0072DC14    call        @VarToUStr
 0072DC19    cmp         dword ptr [ebp-0C4],0
>0072DC20    je          0072DC87
 0072DC22    push        72E404;'Pressed('
 0072DC27    push        dword ptr [ebp-8]
 0072DC2A    push        72E548;') and not var.Awake => PlaySound("'
 0072DC2F    lea         ecx,[ebp-0EC]
 0072DC35    mov         edx,72E528;'vaconsnd'
 0072DC3A    mov         eax,dword ptr [ebp-4]
 0072DC3D    mov         esi,dword ptr [eax]
 0072DC3F    call        dword ptr [esi+0C]
 0072DC42    lea         edx,[ebp-0EC]
 0072DC48    lea         eax,[ebp-0DC]
 0072DC4E    call        @VarToUStr
 0072DC53    push        dword ptr [ebp-0DC]
 0072DC59    push        72E59C;'")'
 0072DC5E    lea         eax,[ebp-0D8]
 0072DC64    mov         edx,5
 0072DC69    call        @UStrCatN
 0072DC6E    mov         edx,dword ptr [ebp-0D8]
 0072DC74    mov         eax,dword ptr [ebx]
 0072DC76    mov         eax,dword ptr [eax+394]
 0072DC7C    mov         eax,dword ptr [eax+2A4]
 0072DC82    mov         ecx,dword ptr [eax]
 0072DC84    call        dword ptr [ecx+38]
 0072DC87    lea         ecx,[ebp-0FC]
 0072DC8D    mov         edx,72E5B0;'vacoffsnd'
 0072DC92    mov         eax,dword ptr [ebp-4]
 0072DC95    mov         esi,dword ptr [eax]
 0072DC97    call        dword ptr [esi+0C]
 0072DC9A    lea         eax,[ebp-0FC]
 0072DCA0    call        VarIsNull
 0072DCA5    test        al,al
>0072DCA7    jne         0072DD3F
 0072DCAD    lea         ecx,[ebp-110]
 0072DCB3    mov         edx,72E5B0;'vacoffsnd'
 0072DCB8    mov         eax,dword ptr [ebp-4]
 0072DCBB    mov         esi,dword ptr [eax]
 0072DCBD    call        dword ptr [esi+0C]
 0072DCC0    lea         edx,[ebp-110]
 0072DCC6    lea         eax,[ebp-100]
 0072DCCC    call        @VarToUStr
 0072DCD1    cmp         dword ptr [ebp-100],0
>0072DCD8    je          0072DD3F
 0072DCDA    push        72E404;'Pressed('
 0072DCDF    push        dword ptr [ebp-8]
 0072DCE2    push        72E5D0;') and var.Awake => PlaySound("'
 0072DCE7    lea         ecx,[ebp-128]
 0072DCED    mov         edx,72E5B0;'vacoffsnd'
 0072DCF2    mov         eax,dword ptr [ebp-4]
 0072DCF5    mov         esi,dword ptr [eax]
 0072DCF7    call        dword ptr [esi+0C]
 0072DCFA    lea         edx,[ebp-128]
 0072DD00    lea         eax,[ebp-118]
 0072DD06    call        @VarToUStr
 0072DD0B    push        dword ptr [ebp-118]
 0072DD11    push        72E59C;'")'
 0072DD16    lea         eax,[ebp-114]
 0072DD1C    mov         edx,5
 0072DD21    call        @UStrCatN
 0072DD26    mov         edx,dword ptr [ebp-114]
 0072DD2C    mov         eax,dword ptr [ebx]
 0072DD2E    mov         eax,dword ptr [eax+394]
 0072DD34    mov         eax,dword ptr [eax+2A4]
 0072DD3A    mov         ecx,dword ptr [eax]
 0072DD3C    call        dword ptr [ecx+38]
 0072DD3F    push        72E404;'Pressed('
 0072DD44    push        dword ptr [ebp-8]
 0072DD47    push        72E61C;') => Toggle(var.Awake)'
 0072DD4C    lea         eax,[ebp-12C]
 0072DD52    mov         edx,3
 0072DD57    call        @UStrCatN
 0072DD5C    mov         edx,dword ptr [ebp-12C]
 0072DD62    mov         eax,dword ptr [ebx]
 0072DD64    mov         eax,dword ptr [eax+394]
 0072DD6A    mov         eax,dword ptr [eax+2A4]
 0072DD70    mov         ecx,dword ptr [eax]
 0072DD72    call        dword ptr [ecx+38]
 0072DD75    lea         ecx,[ebp-13C]
 0072DD7B    mov         edx,72E658;'off'
 0072DD80    mov         eax,dword ptr [ebp-4]
 0072DD83    mov         esi,dword ptr [eax]
 0072DD85    call        dword ptr [esi+0C]
 0072DD88    lea         eax,[ebp-13C]
 0072DD8E    call        VarIsNull
 0072DD93    test        al,al
>0072DD95    je          0072DDA1
 0072DD97    lea         eax,[ebp-0C]
 0072DD9A    call        @UStrClr
>0072DD9F    jmp         0072DDC2
 0072DDA1    lea         ecx,[ebp-14C]
 0072DDA7    mov         edx,72E658;'off'
 0072DDAC    mov         eax,dword ptr [ebp-4]
 0072DDAF    mov         esi,dword ptr [eax]
 0072DDB1    call        dword ptr [esi+0C]
 0072DDB4    lea         edx,[ebp-14C]
 0072DDBA    lea         eax,[ebp-0C]
 0072DDBD    call        @VarToUStr
 0072DDC2    lea         edx,[ebp-150]
 0072DDC8    mov         eax,dword ptr [ebp-0C]
 0072DDCB    call        UpperCase
 0072DDD0    mov         eax,dword ptr [ebp-150]
 0072DDD6    mov         edx,72E30C;'NONE'
 0072DDDB    call        @UStrEqual
>0072DDE0    jne         0072DDEA
 0072DDE2    lea         eax,[ebp-0C]
 0072DDE5    call        @UStrClr
 0072DDEA    lea         ecx,[ebp-160]
 0072DDF0    mov         edx,72E66C;'off1'
 0072DDF5    mov         eax,dword ptr [ebp-4]
 0072DDF8    mov         esi,dword ptr [eax]
 0072DDFA    call        dword ptr [esi+0C]
 0072DDFD    lea         eax,[ebp-160]
 0072DE03    call        VarIsNull
 0072DE08    test        al,al
>0072DE0A    je          0072DE16
 0072DE0C    lea         eax,[ebp-10]
 0072DE0F    call        @UStrClr
>0072DE14    jmp         0072DE37
 0072DE16    lea         ecx,[ebp-170]
 0072DE1C    mov         edx,72E66C;'off1'
 0072DE21    mov         eax,dword ptr [ebp-4]
 0072DE24    mov         esi,dword ptr [eax]
 0072DE26    call        dword ptr [esi+0C]
 0072DE29    lea         edx,[ebp-170]
 0072DE2F    lea         eax,[ebp-10]
 0072DE32    call        @VarToUStr
 0072DE37    lea         edx,[ebp-174]
 0072DE3D    mov         eax,dword ptr [ebp-10]
 0072DE40    call        UpperCase
 0072DE45    mov         eax,dword ptr [ebp-174]
 0072DE4B    mov         edx,72E30C;'NONE'
 0072DE50    call        @UStrEqual
>0072DE55    jne         0072DE5F
 0072DE57    lea         eax,[ebp-10]
 0072DE5A    call        @UStrClr
 0072DE5F    cmp         dword ptr [ebp-0C],0
>0072DE63    je          0072DF4C
 0072DE69    cmp         dword ptr [ebp-10],0
>0072DE6D    je          0072DF4C
 0072DE73    lea         edx,[ebp-8]
 0072DE76    mov         eax,dword ptr [ebp-0C]
 0072DE79    call        0072A6FC
 0072DE7E    cmp         dword ptr [ebp-10],0
>0072DE82    je          0072DEB3
 0072DE84    cmp         dword ptr [ebp-8],0
>0072DE88    je          0072DEB3
 0072DE8A    push        dword ptr [ebp-8]
 0072DE8D    push        72E33C;'+'
 0072DE92    lea         edx,[ebp-178]
 0072DE98    mov         eax,dword ptr [ebp-10]
 0072DE9B    call        0072A6FC
 0072DEA0    push        dword ptr [ebp-178]
 0072DEA6    lea         eax,[ebp-8]
 0072DEA9    mov         edx,3
 0072DEAE    call        @UStrCatN
 0072DEB3    mov         eax,dword ptr [ebx]
 0072DEB5    mov         eax,dword ptr [eax+394]
 0072DEBB    mov         eax,dword ptr [eax+2A4]
 0072DEC1    xor         edx,edx
 0072DEC3    mov         ecx,dword ptr [eax]
 0072DEC5    call        dword ptr [ecx+38]
 0072DEC8    mov         eax,dword ptr [ebx]
 0072DECA    mov         eax,dword ptr [eax+394]
 0072DED0    mov         eax,dword ptr [eax+2A4]
 0072DED6    mov         edx,72E684;'// Push-to-not-talk button 1'
 0072DEDB    mov         ecx,dword ptr [eax]
 0072DEDD    call        dword ptr [ecx+38]
 0072DEE0    push        72E404;'Pressed('
 0072DEE5    push        dword ptr [ebp-8]
 0072DEE8    push        72E47C;') => Release(var.Awake)'
 0072DEED    lea         eax,[ebp-17C]
 0072DEF3    mov         edx,3
 0072DEF8    call        @UStrCatN
 0072DEFD    mov         edx,dword ptr [ebp-17C]
 0072DF03    mov         eax,dword ptr [ebx]
 0072DF05    mov         eax,dword ptr [eax+394]
 0072DF0B    mov         eax,dword ptr [eax+2A4]
 0072DF11    mov         ecx,dword ptr [eax]
 0072DF13    call        dword ptr [ecx+38]
 0072DF16    push        72E45C;'Released('
 0072DF1B    push        dword ptr [ebp-8]
 0072DF1E    push        72E424;') => Press(var.Awake)'
 0072DF23    lea         eax,[ebp-180]
 0072DF29    mov         edx,3
 0072DF2E    call        @UStrCatN
 0072DF33    mov         edx,dword ptr [ebp-180]
 0072DF39    mov         eax,dword ptr [ebx]
 0072DF3B    mov         eax,dword ptr [eax+394]
 0072DF41    mov         eax,dword ptr [eax+2A4]
 0072DF47    mov         ecx,dword ptr [eax]
 0072DF49    call        dword ptr [ecx+38]
 0072DF4C    lea         ecx,[ebp-190]
 0072DF52    mov         edx,72E6CC;'off2'
 0072DF57    mov         eax,dword ptr [ebp-4]
 0072DF5A    mov         esi,dword ptr [eax]
 0072DF5C    call        dword ptr [esi+0C]
 0072DF5F    lea         eax,[ebp-190]
 0072DF65    call        VarIsNull
 0072DF6A    test        al,al
>0072DF6C    je          0072DF78
 0072DF6E    lea         eax,[ebp-0C]
 0072DF71    call        @UStrClr
>0072DF76    jmp         0072DF99
 0072DF78    lea         ecx,[ebp-1A0]
 0072DF7E    mov         edx,72E6CC;'off2'
 0072DF83    mov         eax,dword ptr [ebp-4]
 0072DF86    mov         esi,dword ptr [eax]
 0072DF88    call        dword ptr [esi+0C]
 0072DF8B    lea         edx,[ebp-1A0]
 0072DF91    lea         eax,[ebp-0C]
 0072DF94    call        @VarToUStr
 0072DF99    lea         edx,[ebp-1A4]
 0072DF9F    mov         eax,dword ptr [ebp-0C]
 0072DFA2    call        UpperCase
 0072DFA7    mov         eax,dword ptr [ebp-1A4]
 0072DFAD    mov         edx,72E30C;'NONE'
 0072DFB2    call        @UStrEqual
>0072DFB7    jne         0072DFC1
 0072DFB9    lea         eax,[ebp-0C]
 0072DFBC    call        @UStrClr
 0072DFC1    lea         ecx,[ebp-1B4]
 0072DFC7    mov         edx,72E6E4;'off3'
 0072DFCC    mov         eax,dword ptr [ebp-4]
 0072DFCF    mov         esi,dword ptr [eax]
 0072DFD1    call        dword ptr [esi+0C]
 0072DFD4    lea         eax,[ebp-1B4]
 0072DFDA    call        VarIsNull
 0072DFDF    test        al,al
>0072DFE1    je          0072DFED
 0072DFE3    lea         eax,[ebp-10]
 0072DFE6    call        @UStrClr
>0072DFEB    jmp         0072E00E
 0072DFED    lea         ecx,[ebp-1C4]
 0072DFF3    mov         edx,72E6E4;'off3'
 0072DFF8    mov         eax,dword ptr [ebp-4]
 0072DFFB    mov         esi,dword ptr [eax]
 0072DFFD    call        dword ptr [esi+0C]
 0072E000    lea         edx,[ebp-1C4]
 0072E006    lea         eax,[ebp-10]
 0072E009    call        @VarToUStr
 0072E00E    lea         edx,[ebp-1C8]
 0072E014    mov         eax,dword ptr [ebp-10]
 0072E017    call        UpperCase
 0072E01C    mov         eax,dword ptr [ebp-1C8]
 0072E022    mov         edx,72E30C;'NONE'
 0072E027    call        @UStrEqual
>0072E02C    jne         0072E036
 0072E02E    lea         eax,[ebp-10]
 0072E031    call        @UStrClr
 0072E036    cmp         dword ptr [ebp-0C],0
>0072E03A    je          0072E123
 0072E040    cmp         dword ptr [ebp-10],0
>0072E044    je          0072E123
 0072E04A    lea         edx,[ebp-8]
 0072E04D    mov         eax,dword ptr [ebp-0C]
 0072E050    call        0072A6FC
 0072E055    cmp         dword ptr [ebp-10],0
>0072E059    je          0072E08A
 0072E05B    cmp         dword ptr [ebp-8],0
>0072E05F    je          0072E08A
 0072E061    push        dword ptr [ebp-8]
 0072E064    push        72E33C;'+'
 0072E069    lea         edx,[ebp-1CC]
 0072E06F    mov         eax,dword ptr [ebp-10]
 0072E072    call        0072A6FC
 0072E077    push        dword ptr [ebp-1CC]
 0072E07D    lea         eax,[ebp-8]
 0072E080    mov         edx,3
 0072E085    call        @UStrCatN
 0072E08A    mov         eax,dword ptr [ebx]
 0072E08C    mov         eax,dword ptr [eax+394]
 0072E092    mov         eax,dword ptr [eax+2A4]
 0072E098    xor         edx,edx
 0072E09A    mov         ecx,dword ptr [eax]
 0072E09C    call        dword ptr [ecx+38]
 0072E09F    mov         eax,dword ptr [ebx]
 0072E0A1    mov         eax,dword ptr [eax+394]
 0072E0A7    mov         eax,dword ptr [eax+2A4]
 0072E0AD    mov         edx,72E6FC;'// Push-to-not-talk button 2'
 0072E0B2    mov         ecx,dword ptr [eax]
 0072E0B4    call        dword ptr [ecx+38]
 0072E0B7    push        72E404;'Pressed('
 0072E0BC    push        dword ptr [ebp-8]
 0072E0BF    push        72E47C;') => Release(var.Awake)'
 0072E0C4    lea         eax,[ebp-1D0]
 0072E0CA    mov         edx,3
 0072E0CF    call        @UStrCatN
 0072E0D4    mov         edx,dword ptr [ebp-1D0]
 0072E0DA    mov         eax,dword ptr [ebx]
 0072E0DC    mov         eax,dword ptr [eax+394]
 0072E0E2    mov         eax,dword ptr [eax+2A4]
 0072E0E8    mov         ecx,dword ptr [eax]
 0072E0EA    call        dword ptr [ecx+38]
 0072E0ED    push        72E45C;'Released('
 0072E0F2    push        dword ptr [ebp-8]
 0072E0F5    push        72E424;') => Press(var.Awake)'
 0072E0FA    lea         eax,[ebp-1D4]
 0072E100    mov         edx,3
 0072E105    call        @UStrCatN
 0072E10A    mov         edx,dword ptr [ebp-1D4]
 0072E110    mov         eax,dword ptr [ebx]
 0072E112    mov         eax,dword ptr [eax+394]
 0072E118    mov         eax,dword ptr [eax+2A4]
 0072E11E    mov         ecx,dword ptr [eax]
 0072E120    call        dword ptr [ecx+38]
 0072E123    xor         eax,eax
 0072E125    pop         edx
 0072E126    pop         ecx
 0072E127    pop         ecx
 0072E128    mov         dword ptr fs:[eax],edx
 0072E12B    push        72E2E3
 0072E130    lea         eax,[ebp-1D4]
 0072E136    mov         edx,4
 0072E13B    call        @UStrArrayClr
 0072E140    lea         eax,[ebp-1C4]
 0072E146    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072E14C    mov         ecx,2
 0072E151    call        @FinalizeArray
 0072E156    lea         eax,[ebp-1A4]
 0072E15C    call        @UStrClr
 0072E161    lea         eax,[ebp-1A0]
 0072E167    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072E16D    mov         ecx,2
 0072E172    call        @FinalizeArray
 0072E177    lea         eax,[ebp-180]
 0072E17D    mov         edx,4
 0072E182    call        @UStrArrayClr
 0072E187    lea         eax,[ebp-170]
 0072E18D    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072E193    mov         ecx,2
 0072E198    call        @FinalizeArray
 0072E19D    lea         eax,[ebp-150]
 0072E1A3    call        @UStrClr
 0072E1A8    lea         eax,[ebp-14C]
 0072E1AE    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072E1B4    mov         ecx,2
 0072E1B9    call        @FinalizeArray
 0072E1BE    lea         eax,[ebp-12C]
 0072E1C4    call        @UStrClr
 0072E1C9    lea         eax,[ebp-128]
 0072E1CF    call        @VarClr
 0072E1D4    lea         eax,[ebp-118]
 0072E1DA    mov         edx,2
 0072E1DF    call        @UStrArrayClr
 0072E1E4    lea         eax,[ebp-110]
 0072E1EA    call        @VarClr
 0072E1EF    lea         eax,[ebp-100]
 0072E1F5    call        @UStrClr
 0072E1FA    lea         eax,[ebp-0FC]
 0072E200    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072E206    mov         ecx,2
 0072E20B    call        @FinalizeArray
 0072E210    lea         eax,[ebp-0DC]
 0072E216    mov         edx,2
 0072E21B    call        @UStrArrayClr
 0072E220    lea         eax,[ebp-0D4]
 0072E226    call        @VarClr
 0072E22B    lea         eax,[ebp-0C4]
 0072E231    call        @UStrClr
 0072E236    lea         eax,[ebp-0C0]
 0072E23C    call        @VarClr
 0072E241    lea         eax,[ebp-0B0]
 0072E247    mov         edx,2
 0072E24C    call        @UStrArrayClr
 0072E251    lea         eax,[ebp-0A8]
 0072E257    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072E25D    mov         ecx,2
 0072E262    call        @FinalizeArray
 0072E267    lea         eax,[ebp-88]
 0072E26D    call        @UStrClr
 0072E272    lea         eax,[ebp-84]
 0072E278    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072E27E    mov         ecx,2
 0072E283    call        @FinalizeArray
 0072E288    lea         eax,[ebp-64]
 0072E28B    mov         edx,4
 0072E290    call        @UStrArrayClr
 0072E295    lea         eax,[ebp-54]
 0072E298    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072E29E    mov         ecx,2
 0072E2A3    call        @FinalizeArray
 0072E2A8    lea         eax,[ebp-34]
 0072E2AB    call        @UStrClr
 0072E2B0    lea         eax,[ebp-30]
 0072E2B3    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072E2B9    mov         ecx,2
 0072E2BE    call        @FinalizeArray
 0072E2C3    lea         eax,[ebp-10]
 0072E2C6    mov         edx,3
 0072E2CB    call        @UStrArrayClr
 0072E2D0    lea         eax,[ebp-4]
 0072E2D3    call        @IntfClear
 0072E2D8    ret
>0072E2D9    jmp         @HandleFinally
>0072E2DE    jmp         0072E130
 0072E2E3    pop         esi
 0072E2E4    pop         ebx
 0072E2E5    mov         esp,ebp
 0072E2E7    pop         ebp
 0072E2E8    ret
end;*}

//0072E738
procedure sub_0072E738(?:IInterface);
begin
{*
 0072E738    push        ebp
 0072E739    mov         ebp,esp
 0072E73B    mov         ecx,4
 0072E740    push        0
 0072E742    push        0
 0072E744    dec         ecx
>0072E745    jne         0072E740
 0072E747    push        ecx
 0072E748    push        ebx
 0072E749    push        esi
 0072E74A    push        edi
 0072E74B    mov         dword ptr [ebp-4],eax
 0072E74E    mov         eax,dword ptr [ebp-4]
 0072E751    call        @IntfAddRef
 0072E756    xor         eax,eax
 0072E758    push        ebp
 0072E759    push        72E95D
 0072E75E    push        dword ptr fs:[eax]
 0072E761    mov         dword ptr fs:[eax],esp
 0072E764    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072E769    mov         eax,dword ptr [eax]
 0072E76B    mov         eax,dword ptr [eax+394]
 0072E771    mov         eax,dword ptr [eax+2A4]
 0072E777    mov         ecx,72E978;'// Imported from Voice Activated Commands'
 0072E77C    mov         edx,1
 0072E781    mov         ebx,dword ptr [eax]
 0072E783    call        dword ptr [ebx+20]
 0072E786    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072E78B    mov         eax,dword ptr [eax]
 0072E78D    mov         eax,dword ptr [eax+394]
 0072E793    mov         eax,dword ptr [eax+2A4]
 0072E799    mov         edx,72E9D8;'if Starting then'
 0072E79E    mov         ecx,dword ptr [eax]
 0072E7A0    call        dword ptr [ecx+38]
 0072E7A3    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072E7A8    mov         eax,dword ptr [eax]
 0072E7AA    mov         eax,dword ptr [eax+394]
 0072E7B0    mov         eax,dword ptr [eax+2A4]
 0072E7B6    mov         edx,72EA08;'  var.Awake = true'
 0072E7BB    mov         ecx,dword ptr [eax]
 0072E7BD    call        dword ptr [ecx+38]
 0072E7C0    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072E7C5    mov         eax,dword ptr [eax]
 0072E7C7    mov         eax,dword ptr [eax+394]
 0072E7CD    mov         eax,dword ptr [eax+2A4]
 0072E7D3    mov         edx,72EA3C;'endif'
 0072E7D8    mov         ecx,dword ptr [eax]
 0072E7DA    call        dword ptr [ecx+38]
 0072E7DD    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072E7E2    mov         eax,dword ptr [eax]
 0072E7E4    mov         eax,dword ptr [eax+394]
 0072E7EA    mov         eax,dword ptr [eax+2A4]
 0072E7F0    xor         edx,edx
 0072E7F2    mov         ecx,dword ptr [eax]
 0072E7F4    call        dword ptr [ecx+38]
 0072E7F7    lea         edx,[ebp-0C]
 0072E7FA    mov         eax,dword ptr [ebp-4]
 0072E7FD    mov         ecx,dword ptr [eax]
 0072E7FF    call        dword ptr [ecx+14]
 0072E802    mov         eax,dword ptr [ebp-0C]
 0072E805    lea         edx,[ebp-8]
 0072E808    mov         ecx,dword ptr [eax]
 0072E80A    call        dword ptr [ecx+34]
 0072E80D    cmp         dword ptr [ebp-8],0
>0072E811    je          0072E91F
 0072E817    xor         eax,eax
 0072E819    push        ebp
 0072E81A    push        72E8F2
 0072E81F    push        dword ptr fs:[eax]
 0072E822    mov         dword ptr fs:[eax],esp
 0072E825    mov         eax,dword ptr [ebp-8]
 0072E828    mov         edx,dword ptr [eax]
 0072E82A    call        dword ptr [edx+38]
 0072E82D    cmp         al,8
>0072E82F    jne         0072E880
 0072E831    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072E836    mov         eax,dword ptr [eax]
 0072E838    mov         eax,dword ptr [eax+394]
 0072E83E    mov         eax,dword ptr [eax+2A4]
 0072E844    mov         edx,72EA54;'/**'
 0072E849    mov         ecx,dword ptr [eax]
 0072E84B    call        dword ptr [ecx+38]
 0072E84E    lea         edx,[ebp-10]
 0072E851    mov         eax,dword ptr [ebp-8]
 0072E854    mov         ecx,dword ptr [eax]
 0072E856    call        dword ptr [ecx+50]
 0072E859    mov         eax,dword ptr [ebp-10]
 0072E85C    call        0072A620
 0072E861    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072E866    mov         eax,dword ptr [eax]
 0072E868    mov         eax,dword ptr [eax+394]
 0072E86E    mov         eax,dword ptr [eax+2A4]
 0072E874    mov         edx,72EA68;'**/'
 0072E879    mov         ecx,dword ptr [eax]
 0072E87B    call        dword ptr [ecx+38]
>0072E87E    jmp         0072E8E8
 0072E880    mov         eax,dword ptr [ebp-8]
 0072E883    mov         edx,dword ptr [eax]
 0072E885    call        dword ptr [edx+38]
 0072E888    cmp         al,1
>0072E88A    jne         0072E8E8
 0072E88C    lea         edx,[ebp-18]
 0072E88F    mov         eax,dword ptr [ebp-8]
 0072E892    mov         ecx,dword ptr [eax]
 0072E894    call        dword ptr [ecx+34]
 0072E897    mov         eax,dword ptr [ebp-18]
 0072E89A    lea         edx,[ebp-14]
 0072E89D    call        LowerCase
 0072E8A2    mov         eax,dword ptr [ebp-14]
 0072E8A5    mov         edx,72EA7C;'command'
 0072E8AA    call        @UStrEqual
>0072E8AF    jne         0072E8BB
 0072E8B1    mov         eax,dword ptr [ebp-8]
 0072E8B4    call        0072C3A4
>0072E8B9    jmp         0072E8E8
 0072E8BB    lea         edx,[ebp-20]
 0072E8BE    mov         eax,dword ptr [ebp-8]
 0072E8C1    mov         ecx,dword ptr [eax]
 0072E8C3    call        dword ptr [ecx+34]
 0072E8C6    mov         eax,dword ptr [ebp-20]
 0072E8C9    lea         edx,[ebp-1C]
 0072E8CC    call        LowerCase
 0072E8D1    mov         eax,dword ptr [ebp-1C]
 0072E8D4    mov         edx,72EA98;'set'
 0072E8D9    call        @UStrEqual
>0072E8DE    jne         0072E8E8
 0072E8E0    mov         eax,dword ptr [ebp-8]
 0072E8E3    call        0072D850
 0072E8E8    xor         eax,eax
 0072E8EA    pop         edx
 0072E8EB    pop         ecx
 0072E8EC    pop         ecx
 0072E8ED    mov         dword ptr fs:[eax],edx
>0072E8F0    jmp         0072E8FC
>0072E8F2    jmp         @HandleAnyException
 0072E8F7    call        @DoneExcept
 0072E8FC    lea         edx,[ebp-24]
 0072E8FF    mov         eax,dword ptr [ebp-8]
 0072E902    mov         ecx,dword ptr [eax]
 0072E904    call        dword ptr [ecx+90]
 0072E90A    mov         edx,dword ptr [ebp-24]
 0072E90D    lea         eax,[ebp-8]
 0072E910    call        @IntfCopy
 0072E915    cmp         dword ptr [ebp-8],0
>0072E919    jne         0072E817
 0072E91F    xor         eax,eax
 0072E921    pop         edx
 0072E922    pop         ecx
 0072E923    pop         ecx
 0072E924    mov         dword ptr fs:[eax],edx
 0072E927    push        72E964
 0072E92C    lea         eax,[ebp-24]
 0072E92F    call        @IntfClear
 0072E934    lea         eax,[ebp-20]
 0072E937    mov         edx,5
 0072E93C    call        @UStrArrayClr
 0072E941    lea         eax,[ebp-0C]
 0072E944    call        @IntfClear
 0072E949    lea         eax,[ebp-8]
 0072E94C    mov         edx,dword ptr ds:[58A824];IXMLNode
 0072E952    mov         ecx,2
 0072E957    call        @FinalizeArray
 0072E95C    ret
>0072E95D    jmp         @HandleFinally
>0072E962    jmp         0072E92C
 0072E964    pop         edi
 0072E965    pop         esi
 0072E966    pop         ebx
 0072E967    mov         esp,ebp
 0072E969    pop         ebp
 0072E96A    ret
*}
end;

//0072EAA0
{*procedure sub_0072EAA0(?:?; ?:?);
begin
 0072EAA0    push        ebp
 0072EAA1    mov         ebp,esp
 0072EAA3    push        ecx
 0072EAA4    push        ebx
 0072EAA5    push        esi
 0072EAA6    push        edi
 0072EAA7    mov         esi,edx
 0072EAA9    mov         dword ptr [ebp-4],eax
 0072EAAC    mov         eax,dword ptr [ebp-4]
 0072EAAF    call        @UStrAddRef
 0072EAB4    xor         eax,eax
 0072EAB6    push        ebp
 0072EAB7    push        72EB2C
 0072EABC    push        dword ptr fs:[eax]
 0072EABF    mov         dword ptr fs:[eax],esp
 0072EAC2    mov         eax,esi
 0072EAC4    mov         edx,dword ptr [ebp-4]
 0072EAC7    call        @UStrAsg
 0072EACC    mov         edi,1
 0072EAD1    mov         bl,1
>0072EAD3    jmp         0072EB0B
 0072EAD5    test        bl,bl
>0072EAD7    je          0072EAFF
 0072EAD9    mov         eax,dword ptr [esi]
 0072EADB    cmp         word ptr [eax+edi*2-2],2B
>0072EAE1    je          0072EAED
 0072EAE3    mov         eax,dword ptr [esi]
 0072EAE5    cmp         word ptr [eax+edi*2-2],2D
>0072EAEB    jne         0072EAFF
 0072EAED    mov         eax,esi
 0072EAEF    mov         ecx,1
 0072EAF4    mov         edx,edi
 0072EAF6    call        @UStrDelete
 0072EAFB    xor         ebx,ebx
>0072EAFD    jmp         0072EB0B
 0072EAFF    mov         eax,dword ptr [esi]
 0072EB01    cmp         word ptr [eax+edi*2-2],20
 0072EB07    setbe       bl
 0072EB0A    inc         edi
 0072EB0B    mov         eax,dword ptr [esi]
 0072EB0D    call        @UStrLen
 0072EB12    cmp         edi,eax
>0072EB14    jle         0072EAD5
 0072EB16    xor         eax,eax
 0072EB18    pop         edx
 0072EB19    pop         ecx
 0072EB1A    pop         ecx
 0072EB1B    mov         dword ptr fs:[eax],edx
 0072EB1E    push        72EB33
 0072EB23    lea         eax,[ebp-4]
 0072EB26    call        @UStrClr
 0072EB2B    ret
>0072EB2C    jmp         @HandleFinally
>0072EB31    jmp         0072EB23
 0072EB33    pop         edi
 0072EB34    pop         esi
 0072EB35    pop         ebx
 0072EB36    pop         ecx
 0072EB37    pop         ebp
 0072EB38    ret
end;*}

//0072EB3C
{*procedure sub_0072EB3C(?:?; ?:?);
begin
 0072EB3C    push        ebp
 0072EB3D    mov         ebp,esp
 0072EB3F    mov         ecx,7
 0072EB44    push        0
 0072EB46    push        0
 0072EB48    dec         ecx
>0072EB49    jne         0072EB44
 0072EB4B    push        ebx
 0072EB4C    push        esi
 0072EB4D    push        edi
 0072EB4E    mov         dword ptr [ebp-0C],edx
 0072EB51    mov         dword ptr [ebp-4],eax
 0072EB54    mov         eax,dword ptr [ebp-4]
 0072EB57    call        @IntfAddRef
 0072EB5C    xor         eax,eax
 0072EB5E    push        ebp
 0072EB5F    push        72ED22
 0072EB64    push        dword ptr fs:[eax]
 0072EB67    mov         dword ptr fs:[eax],esp
 0072EB6A    mov         eax,dword ptr [ebp-0C]
 0072EB6D    call        @UStrClr
 0072EB72    lea         edx,[ebp-10]
 0072EB75    mov         eax,dword ptr [ebp-4]
 0072EB78    mov         ecx,dword ptr [eax]
 0072EB7A    call        dword ptr [ecx+14]
 0072EB7D    mov         eax,dword ptr [ebp-10]
 0072EB80    lea         edx,[ebp-8]
 0072EB83    mov         ecx,dword ptr [eax]
 0072EB85    call        dword ptr [ecx+34]
 0072EB88    cmp         dword ptr [ebp-8],0
>0072EB8C    je          0072ECD7
 0072EB92    xor         eax,eax
 0072EB94    push        ebp
 0072EB95    push        72ECAA
 0072EB9A    push        dword ptr fs:[eax]
 0072EB9D    mov         dword ptr fs:[eax],esp
 0072EBA0    mov         eax,dword ptr [ebp-8]
 0072EBA3    mov         edx,dword ptr [eax]
 0072EBA5    call        dword ptr [edx+38]
 0072EBA8    cmp         al,8
>0072EBAA    jne         0072EBFE
 0072EBAC    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072EBB1    mov         eax,dword ptr [eax]
 0072EBB3    mov         eax,dword ptr [eax+394]
 0072EBB9    mov         eax,dword ptr [eax+2A4]
 0072EBBF    mov         edx,72ED3C;'/**'
 0072EBC4    mov         ecx,dword ptr [eax]
 0072EBC6    call        dword ptr [ecx+38]
 0072EBC9    lea         edx,[ebp-14]
 0072EBCC    mov         eax,dword ptr [ebp-8]
 0072EBCF    mov         ecx,dword ptr [eax]
 0072EBD1    call        dword ptr [ecx+50]
 0072EBD4    mov         eax,dword ptr [ebp-14]
 0072EBD7    call        0072A620
 0072EBDC    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072EBE1    mov         eax,dword ptr [eax]
 0072EBE3    mov         eax,dword ptr [eax+394]
 0072EBE9    mov         eax,dword ptr [eax+2A4]
 0072EBEF    mov         edx,72ED50;'**/'
 0072EBF4    mov         ecx,dword ptr [eax]
 0072EBF6    call        dword ptr [ecx+38]
>0072EBF9    jmp         0072ECA0
 0072EBFE    mov         eax,dword ptr [ebp-8]
 0072EC01    mov         edx,dword ptr [eax]
 0072EC03    call        dword ptr [edx+38]
 0072EC06    cmp         al,1
>0072EC08    jne         0072ECA0
 0072EC0E    lea         edx,[ebp-1C]
 0072EC11    mov         eax,dword ptr [ebp-8]
 0072EC14    mov         ecx,dword ptr [eax]
 0072EC16    call        dword ptr [ecx+34]
 0072EC19    mov         eax,dword ptr [ebp-1C]
 0072EC1C    lea         edx,[ebp-18]
 0072EC1F    call        LowerCase
 0072EC24    mov         eax,dword ptr [ebp-18]
 0072EC27    mov         edx,72ED64;'enabled'
 0072EC2C    call        @UStrEqual
>0072EC31    je          0072ECA0
 0072EC33    lea         edx,[ebp-24]
 0072EC36    mov         eax,dword ptr [ebp-8]
 0072EC39    mov         ecx,dword ptr [eax]
 0072EC3B    call        dword ptr [ecx+34]
 0072EC3E    mov         eax,dword ptr [ebp-24]
 0072EC41    lea         edx,[ebp-20]
 0072EC44    call        LowerCase
 0072EC49    mov         eax,dword ptr [ebp-20]
 0072EC4C    mov         edx,72ED80;'action'
 0072EC51    call        @UStrEqual
>0072EC56    je          0072ECA0
 0072EC58    lea         edx,[ebp-2C]
 0072EC5B    mov         eax,dword ptr [ebp-8]
 0072EC5E    mov         ecx,dword ptr [eax]
 0072EC60    call        dword ptr [ecx+34]
 0072EC63    mov         eax,dword ptr [ebp-2C]
 0072EC66    lea         edx,[ebp-28]
 0072EC69    call        LowerCase
 0072EC6E    mov         eax,dword ptr [ebp-28]
 0072EC71    mov         edx,72ED9C;'threshold'
 0072EC76    call        @UStrEqual
>0072EC7B    je          0072ECA0
 0072EC7D    lea         edx,[ebp-34]
 0072EC80    mov         eax,dword ptr [ebp-8]
 0072EC83    mov         ecx,dword ptr [eax]
 0072EC85    call        dword ptr [ecx+34]
 0072EC88    mov         eax,dword ptr [ebp-34]
 0072EC8B    lea         edx,[ebp-30]
 0072EC8E    call        LowerCase
 0072EC93    mov         eax,dword ptr [ebp-30]
 0072EC96    mov         edx,72EDBC;'actionrule'
 0072EC9B    call        @UStrEqual
 0072ECA0    xor         eax,eax
 0072ECA2    pop         edx
 0072ECA3    pop         ecx
 0072ECA4    pop         ecx
 0072ECA5    mov         dword ptr fs:[eax],edx
>0072ECA8    jmp         0072ECB4
>0072ECAA    jmp         @HandleAnyException
 0072ECAF    call        @DoneExcept
 0072ECB4    lea         edx,[ebp-38]
 0072ECB7    mov         eax,dword ptr [ebp-8]
 0072ECBA    mov         ecx,dword ptr [eax]
 0072ECBC    call        dword ptr [ecx+90]
 0072ECC2    mov         edx,dword ptr [ebp-38]
 0072ECC5    lea         eax,[ebp-8]
 0072ECC8    call        @IntfCopy
 0072ECCD    cmp         dword ptr [ebp-8],0
>0072ECD1    jne         0072EB92
 0072ECD7    mov         eax,dword ptr [ebp-0C]
 0072ECDA    mov         edx,72EDE0;'var.condition'
 0072ECDF    call        @UStrAsg
 0072ECE4    xor         eax,eax
 0072ECE6    pop         edx
 0072ECE7    pop         ecx
 0072ECE8    pop         ecx
 0072ECE9    mov         dword ptr fs:[eax],edx
 0072ECEC    push        72ED29
 0072ECF1    lea         eax,[ebp-38]
 0072ECF4    call        @IntfClear
 0072ECF9    lea         eax,[ebp-34]
 0072ECFC    mov         edx,9
 0072ED01    call        @UStrArrayClr
 0072ED06    lea         eax,[ebp-10]
 0072ED09    call        @IntfClear
 0072ED0E    lea         eax,[ebp-8]
 0072ED11    mov         edx,dword ptr ds:[58A824];IXMLNode
 0072ED17    mov         ecx,2
 0072ED1C    call        @FinalizeArray
 0072ED21    ret
>0072ED22    jmp         @HandleFinally
>0072ED27    jmp         0072ECF1
 0072ED29    pop         edi
 0072ED2A    pop         esi
 0072ED2B    pop         ebx
 0072ED2C    mov         esp,ebp
 0072ED2E    pop         ebp
 0072ED2F    ret
end;*}

//0072EDFC
{*procedure sub_0072EDFC(?:?);
begin
 0072EDFC    push        ebp
 0072EDFD    mov         ebp,esp
 0072EDFF    mov         ecx,0B
 0072EE04    push        0
 0072EE06    push        0
 0072EE08    dec         ecx
>0072EE09    jne         0072EE04
 0072EE0B    push        ebx
 0072EE0C    push        esi
 0072EE0D    push        edi
 0072EE0E    mov         dword ptr [ebp-4],eax
 0072EE11    mov         eax,dword ptr [ebp-4]
 0072EE14    call        @IntfAddRef
 0072EE19    xor         eax,eax
 0072EE1B    push        ebp
 0072EE1C    push        72F056
 0072EE21    push        dword ptr fs:[eax]
 0072EE24    mov         dword ptr fs:[eax],esp
 0072EE27    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072EE2C    mov         eax,dword ptr [eax]
 0072EE2E    mov         eax,dword ptr [eax+394]
 0072EE34    mov         eax,dword ptr [eax+2A4]
 0072EE3A    xor         edx,edx
 0072EE3C    mov         ecx,dword ptr [eax]
 0072EE3E    call        dword ptr [ecx+38]
 0072EE41    lea         ecx,[ebp-20]
 0072EE44    mov         edx,72F070;'name'
 0072EE49    mov         eax,dword ptr [ebp-4]
 0072EE4C    mov         ebx,dword ptr [eax]
 0072EE4E    call        dword ptr [ebx+0C]
 0072EE51    lea         eax,[ebp-20]
 0072EE54    call        VarIsNull
 0072EE59    test        al,al
>0072EE5B    jne         0072EEAD
 0072EE5D    lea         eax,[ebp-34]
 0072EE60    mov         edx,72F088;'// '
 0072EE65    call        @OleVarFromUStr
 0072EE6A    lea         eax,[ebp-34]
 0072EE6D    push        eax
 0072EE6E    lea         ecx,[ebp-44]
 0072EE71    mov         edx,72F070;'name'
 0072EE76    mov         eax,dword ptr [ebp-4]
 0072EE79    mov         ebx,dword ptr [eax]
 0072EE7B    call        dword ptr [ebx+0C]
 0072EE7E    lea         edx,[ebp-44]
 0072EE81    pop         eax
 0072EE82    call        @VarAdd
 0072EE87    lea         edx,[ebp-34]
 0072EE8A    lea         eax,[ebp-24]
 0072EE8D    call        @VarToUStr
 0072EE92    mov         edx,dword ptr [ebp-24]
 0072EE95    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072EE9A    mov         eax,dword ptr [eax]
 0072EE9C    mov         eax,dword ptr [eax+394]
 0072EEA2    mov         eax,dword ptr [eax+2A4]
 0072EEA8    mov         ecx,dword ptr [eax]
 0072EEAA    call        dword ptr [ecx+38]
 0072EEAD    lea         edx,[ebp-48]
 0072EEB0    mov         eax,dword ptr [ebp-4]
 0072EEB3    mov         ecx,dword ptr [eax]
 0072EEB5    call        dword ptr [ecx+14]
 0072EEB8    mov         eax,dword ptr [ebp-48]
 0072EEBB    lea         edx,[ebp-8]
 0072EEBE    mov         ecx,dword ptr [eax]
 0072EEC0    call        dword ptr [ecx+34]
 0072EEC3    lea         eax,[ebp-0C]
 0072EEC6    call        @UStrClr
 0072EECB    cmp         dword ptr [ebp-8],0
>0072EECF    je          0072EFD5
 0072EED5    xor         eax,eax
 0072EED7    push        ebp
 0072EED8    push        72EFA8
 0072EEDD    push        dword ptr fs:[eax]
 0072EEE0    mov         dword ptr fs:[eax],esp
 0072EEE3    mov         eax,dword ptr [ebp-8]
 0072EEE6    mov         edx,dword ptr [eax]
 0072EEE8    call        dword ptr [edx+38]
 0072EEEB    cmp         al,8
>0072EEED    jne         0072EF3E
 0072EEEF    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072EEF4    mov         eax,dword ptr [eax]
 0072EEF6    mov         eax,dword ptr [eax+394]
 0072EEFC    mov         eax,dword ptr [eax+2A4]
 0072EF02    mov         edx,72F09C;'/**'
 0072EF07    mov         ecx,dword ptr [eax]
 0072EF09    call        dword ptr [ecx+38]
 0072EF0C    lea         edx,[ebp-4C]
 0072EF0F    mov         eax,dword ptr [ebp-8]
 0072EF12    mov         ecx,dword ptr [eax]
 0072EF14    call        dword ptr [ecx+50]
 0072EF17    mov         eax,dword ptr [ebp-4C]
 0072EF1A    call        0072A620
 0072EF1F    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072EF24    mov         eax,dword ptr [eax]
 0072EF26    mov         eax,dword ptr [eax+394]
 0072EF2C    mov         eax,dword ptr [eax+2A4]
 0072EF32    mov         edx,72F0B0;'**/'
 0072EF37    mov         ecx,dword ptr [eax]
 0072EF39    call        dword ptr [ecx+38]
>0072EF3C    jmp         0072EF9E
 0072EF3E    mov         eax,dword ptr [ebp-8]
 0072EF41    mov         edx,dword ptr [eax]
 0072EF43    call        dword ptr [edx+38]
 0072EF46    cmp         al,1
>0072EF48    jne         0072EF9E
 0072EF4A    lea         edx,[ebp-54]
 0072EF4D    mov         eax,dword ptr [ebp-8]
 0072EF50    mov         ecx,dword ptr [eax]
 0072EF52    call        dword ptr [ecx+34]
 0072EF55    mov         eax,dword ptr [ebp-54]
 0072EF58    lea         edx,[ebp-50]
 0072EF5B    call        LowerCase
 0072EF60    mov         eax,dword ptr [ebp-50]
 0072EF63    mov         edx,72F0C4;'emostatecondition'
 0072EF68    call        @UStrEqual
>0072EF6D    jne         0072EF9E
 0072EF6F    lea         edx,[ebp-10]
 0072EF72    mov         eax,dword ptr [ebp-8]
 0072EF75    call        0072EB3C
 0072EF7A    cmp         dword ptr [ebp-10],0
>0072EF7E    je          0072EF9E
 0072EF80    cmp         dword ptr [ebp-0C],0
>0072EF84    je          0072EF93
 0072EF86    lea         eax,[ebp-0C]
 0072EF89    mov         edx,72F0F4;' and '
 0072EF8E    call        @UStrCat
 0072EF93    lea         eax,[ebp-0C]
 0072EF96    mov         edx,dword ptr [ebp-10]
 0072EF99    call        @UStrCat
 0072EF9E    xor         eax,eax
 0072EFA0    pop         edx
 0072EFA1    pop         ecx
 0072EFA2    pop         ecx
 0072EFA3    mov         dword ptr fs:[eax],edx
>0072EFA6    jmp         0072EFB2
>0072EFA8    jmp         @HandleAnyException
 0072EFAD    call        @DoneExcept
 0072EFB2    lea         edx,[ebp-58]
 0072EFB5    mov         eax,dword ptr [ebp-8]
 0072EFB8    mov         ecx,dword ptr [eax]
 0072EFBA    call        dword ptr [ecx+90]
 0072EFC0    mov         edx,dword ptr [ebp-58]
 0072EFC3    lea         eax,[ebp-8]
 0072EFC6    call        @IntfCopy
 0072EFCB    cmp         dword ptr [ebp-8],0
>0072EFCF    jne         0072EED5
 0072EFD5    cmp         dword ptr [ebp-0C],0
>0072EFD9    jne         0072EFE8
 0072EFDB    lea         eax,[ebp-0C]
 0072EFDE    mov         edx,72F10C;'var.dummy'
 0072EFE3    call        @UStrLAsg
 0072EFE8    xor         eax,eax
 0072EFEA    pop         edx
 0072EFEB    pop         ecx
 0072EFEC    pop         ecx
 0072EFED    mov         dword ptr fs:[eax],edx
 0072EFF0    push        72F05D
 0072EFF5    lea         eax,[ebp-58]
 0072EFF8    call        @IntfClear
 0072EFFD    lea         eax,[ebp-54]
 0072F000    mov         edx,3
 0072F005    call        @UStrArrayClr
 0072F00A    lea         eax,[ebp-48]
 0072F00D    call        @IntfClear
 0072F012    lea         eax,[ebp-44]
 0072F015    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072F01B    mov         ecx,2
 0072F020    call        @FinalizeArray
 0072F025    lea         eax,[ebp-24]
 0072F028    call        @UStrClr
 0072F02D    lea         eax,[ebp-20]
 0072F030    call        @VarClr
 0072F035    lea         eax,[ebp-10]
 0072F038    mov         edx,2
 0072F03D    call        @UStrArrayClr
 0072F042    lea         eax,[ebp-8]
 0072F045    mov         edx,dword ptr ds:[58A824];IXMLNode
 0072F04B    mov         ecx,2
 0072F050    call        @FinalizeArray
 0072F055    ret
>0072F056    jmp         @HandleFinally
>0072F05B    jmp         0072EFF5
 0072F05D    pop         edi
 0072F05E    pop         esi
 0072F05F    pop         ebx
 0072F060    mov         esp,ebp
 0072F062    pop         ebp
 0072F063    ret
end;*}

//0072F120
procedure sub_0072F120(?:IInterface);
begin
{*
 0072F120    push        ebp
 0072F121    mov         ebp,esp
 0072F123    mov         ecx,0C
 0072F128    push        0
 0072F12A    push        0
 0072F12C    dec         ecx
>0072F12D    jne         0072F128
 0072F12F    push        ebx
 0072F130    push        esi
 0072F131    push        edi
 0072F132    mov         dword ptr [ebp-4],eax
 0072F135    mov         eax,dword ptr [ebp-4]
 0072F138    call        @IntfAddRef
 0072F13D    xor         eax,eax
 0072F13F    push        ebp
 0072F140    push        72F34D
 0072F145    push        dword ptr fs:[eax]
 0072F148    mov         dword ptr fs:[eax],esp
 0072F14B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072F150    mov         eax,dword ptr [eax]
 0072F152    mov         eax,dword ptr [eax+394]
 0072F158    mov         eax,dword ptr [eax+2A4]
 0072F15E    mov         ecx,72F368;'// Imported from EmoKey'
 0072F163    mov         edx,1
 0072F168    mov         ebx,dword ptr [eax]
 0072F16A    call        dword ptr [ebx+20]
 0072F16D    lea         ecx,[ebp-18]
 0072F170    mov         edx,72F3A4;'profileName'
 0072F175    mov         eax,dword ptr [ebp-4]
 0072F178    mov         ebx,dword ptr [eax]
 0072F17A    call        dword ptr [ebx+0C]
 0072F17D    lea         eax,[ebp-18]
 0072F180    call        VarIsNull
 0072F185    test        al,al
>0072F187    jne         0072F1F3
 0072F189    lea         eax,[ebp-2C]
 0072F18C    mov         edx,72F3C8;'// '
 0072F191    call        @OleVarFromUStr
 0072F196    lea         eax,[ebp-2C]
 0072F199    push        eax
 0072F19A    lea         ecx,[ebp-3C]
 0072F19D    mov         edx,72F3A4;'profileName'
 0072F1A2    mov         eax,dword ptr [ebp-4]
 0072F1A5    mov         ebx,dword ptr [eax]
 0072F1A7    call        dword ptr [ebx+0C]
 0072F1AA    lea         edx,[ebp-3C]
 0072F1AD    pop         eax
 0072F1AE    call        @VarAdd
 0072F1B3    lea         eax,[ebp-2C]
 0072F1B6    push        eax
 0072F1B7    lea         eax,[ebp-4C]
 0072F1BA    mov         edx,72F3DC;' profile'
 0072F1BF    call        @OleVarFromUStr
 0072F1C4    lea         edx,[ebp-4C]
 0072F1C7    pop         eax
 0072F1C8    call        @VarAdd
 0072F1CD    lea         edx,[ebp-2C]
 0072F1D0    lea         eax,[ebp-1C]
 0072F1D3    call        @VarToUStr
 0072F1D8    mov         edx,dword ptr [ebp-1C]
 0072F1DB    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072F1E0    mov         eax,dword ptr [eax]
 0072F1E2    mov         eax,dword ptr [eax+394]
 0072F1E8    mov         eax,dword ptr [eax+2A4]
 0072F1EE    mov         ecx,dword ptr [eax]
 0072F1F0    call        dword ptr [ecx+38]
 0072F1F3    lea         edx,[ebp-50]
 0072F1F6    mov         eax,dword ptr [ebp-4]
 0072F1F9    mov         ecx,dword ptr [eax]
 0072F1FB    call        dword ptr [ecx+14]
 0072F1FE    mov         eax,dword ptr [ebp-50]
 0072F201    lea         edx,[ebp-8]
 0072F204    mov         ecx,dword ptr [eax]
 0072F206    call        dword ptr [ecx+34]
 0072F209    cmp         dword ptr [ebp-8],0
>0072F20D    je          0072F2EC
 0072F213    xor         eax,eax
 0072F215    push        ebp
 0072F216    push        72F2BF
 0072F21B    push        dword ptr fs:[eax]
 0072F21E    mov         dword ptr fs:[eax],esp
 0072F221    mov         eax,dword ptr [ebp-8]
 0072F224    mov         edx,dword ptr [eax]
 0072F226    call        dword ptr [edx+38]
 0072F229    cmp         al,8
>0072F22B    jne         0072F27C
 0072F22D    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072F232    mov         eax,dword ptr [eax]
 0072F234    mov         eax,dword ptr [eax+394]
 0072F23A    mov         eax,dword ptr [eax+2A4]
 0072F240    mov         edx,72F3FC;'/**'
 0072F245    mov         ecx,dword ptr [eax]
 0072F247    call        dword ptr [ecx+38]
 0072F24A    lea         edx,[ebp-54]
 0072F24D    mov         eax,dword ptr [ebp-8]
 0072F250    mov         ecx,dword ptr [eax]
 0072F252    call        dword ptr [ecx+50]
 0072F255    mov         eax,dword ptr [ebp-54]
 0072F258    call        0072A620
 0072F25D    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072F262    mov         eax,dword ptr [eax]
 0072F264    mov         eax,dword ptr [eax+394]
 0072F26A    mov         eax,dword ptr [eax+2A4]
 0072F270    mov         edx,72F410;'**/'
 0072F275    mov         ecx,dword ptr [eax]
 0072F277    call        dword ptr [ecx+38]
>0072F27A    jmp         0072F2B5
 0072F27C    mov         eax,dword ptr [ebp-8]
 0072F27F    mov         edx,dword ptr [eax]
 0072F281    call        dword ptr [edx+38]
 0072F284    cmp         al,1
>0072F286    jne         0072F2B5
 0072F288    lea         edx,[ebp-5C]
 0072F28B    mov         eax,dword ptr [ebp-8]
 0072F28E    mov         ecx,dword ptr [eax]
 0072F290    call        dword ptr [ecx+34]
 0072F293    mov         eax,dword ptr [ebp-5C]
 0072F296    lea         edx,[ebp-58]
 0072F299    call        LowerCase
 0072F29E    mov         eax,dword ptr [ebp-58]
 0072F2A1    mov         edx,72F424;'emomapping'
 0072F2A6    call        @UStrEqual
>0072F2AB    jne         0072F2B5
 0072F2AD    mov         eax,dword ptr [ebp-8]
 0072F2B0    call        0072EDFC
 0072F2B5    xor         eax,eax
 0072F2B7    pop         edx
 0072F2B8    pop         ecx
 0072F2B9    pop         ecx
 0072F2BA    mov         dword ptr fs:[eax],edx
>0072F2BD    jmp         0072F2C9
>0072F2BF    jmp         @HandleAnyException
 0072F2C4    call        @DoneExcept
 0072F2C9    lea         edx,[ebp-60]
 0072F2CC    mov         eax,dword ptr [ebp-8]
 0072F2CF    mov         ecx,dword ptr [eax]
 0072F2D1    call        dword ptr [ecx+90]
 0072F2D7    mov         edx,dword ptr [ebp-60]
 0072F2DA    lea         eax,[ebp-8]
 0072F2DD    call        @IntfCopy
 0072F2E2    cmp         dword ptr [ebp-8],0
>0072F2E6    jne         0072F213
 0072F2EC    xor         eax,eax
 0072F2EE    pop         edx
 0072F2EF    pop         ecx
 0072F2F0    pop         ecx
 0072F2F1    mov         dword ptr fs:[eax],edx
 0072F2F4    push        72F354
 0072F2F9    lea         eax,[ebp-60]
 0072F2FC    call        @IntfClear
 0072F301    lea         eax,[ebp-5C]
 0072F304    mov         edx,3
 0072F309    call        @UStrArrayClr
 0072F30E    lea         eax,[ebp-50]
 0072F311    call        @IntfClear
 0072F316    lea         eax,[ebp-4C]
 0072F319    mov         edx,dword ptr ds:[4012D4];OleVariant
 0072F31F    mov         ecx,3
 0072F324    call        @FinalizeArray
 0072F329    lea         eax,[ebp-1C]
 0072F32C    call        @UStrClr
 0072F331    lea         eax,[ebp-18]
 0072F334    call        @VarClr
 0072F339    lea         eax,[ebp-8]
 0072F33C    mov         edx,dword ptr ds:[58A824];IXMLNode
 0072F342    mov         ecx,2
 0072F347    call        @FinalizeArray
 0072F34C    ret
>0072F34D    jmp         @HandleFinally
>0072F352    jmp         0072F2F9
 0072F354    pop         edi
 0072F355    pop         esi
 0072F356    pop         ebx
 0072F357    mov         esp,ebp
 0072F359    pop         ebp
 0072F35A    ret
*}
end;

//0072F43C
{*procedure sub_0072F43C(?:?; ?:?);
begin
 0072F43C    push        ebp
 0072F43D    mov         ebp,esp
 0072F43F    mov         ecx,8
 0072F444    push        0
 0072F446    push        0
 0072F448    dec         ecx
>0072F449    jne         0072F444
 0072F44B    push        ecx
 0072F44C    push        ebx
 0072F44D    push        esi
 0072F44E    push        edi
 0072F44F    mov         dword ptr [ebp-10],edx
 0072F452    mov         dword ptr [ebp-4],eax
 0072F455    mov         eax,dword ptr [ebp-4]
 0072F458    call        @IntfAddRef
 0072F45D    xor         eax,eax
 0072F45F    push        ebp
 0072F460    push        72F622
 0072F465    push        dword ptr fs:[eax]
 0072F468    mov         dword ptr fs:[eax],esp
 0072F46B    mov         eax,dword ptr [ebp-10]
 0072F46E    call        @UStrClr
 0072F473    lea         edx,[ebp-14]
 0072F476    mov         eax,dword ptr [ebp-4]
 0072F479    mov         ecx,dword ptr [eax]
 0072F47B    call        dword ptr [ecx+14]
 0072F47E    mov         eax,dword ptr [ebp-14]
 0072F481    lea         edx,[ebp-8]
 0072F484    mov         ecx,dword ptr [eax]
 0072F486    call        dword ptr [ecx+34]
 0072F489    cmp         dword ptr [ebp-8],0
>0072F48D    je          0072F5C7
 0072F493    xor         eax,eax
 0072F495    push        ebp
 0072F496    push        72F59A
 0072F49B    push        dword ptr fs:[eax]
 0072F49E    mov         dword ptr fs:[eax],esp
 0072F4A1    mov         eax,dword ptr [ebp-8]
 0072F4A4    mov         edx,dword ptr [eax]
 0072F4A6    call        dword ptr [edx+38]
 0072F4A9    cmp         al,8
>0072F4AB    je          0072F590
 0072F4B1    mov         eax,dword ptr [ebp-8]
 0072F4B4    mov         edx,dword ptr [eax]
 0072F4B6    call        dword ptr [edx+38]
 0072F4B9    cmp         al,1
>0072F4BB    jne         0072F590
 0072F4C1    lea         edx,[ebp-1C]
 0072F4C4    mov         eax,dword ptr [ebp-8]
 0072F4C7    mov         ecx,dword ptr [eax]
 0072F4C9    call        dword ptr [ecx+34]
 0072F4CC    mov         eax,dword ptr [ebp-1C]
 0072F4CF    lea         edx,[ebp-18]
 0072F4D2    call        LowerCase
 0072F4D7    mov         eax,dword ptr [ebp-18]
 0072F4DA    mov         edx,72F63C;'p'
 0072F4DF    call        @UStrEqual
>0072F4E4    jne         0072F53A
 0072F4E6    mov         eax,dword ptr [ebp-10]
 0072F4E9    cmp         dword ptr [eax],0
>0072F4EC    je          0072F4FE
 0072F4EE    mov         eax,dword ptr [ebp-10]
 0072F4F1    mov         edx,72F64C;'") or Said("'
 0072F4F6    call        @UStrCat
 0072F4FB    mov         eax,dword ptr [ebp-10]
 0072F4FE    lea         edx,[ebp-34]
 0072F501    mov         eax,dword ptr [ebp-8]
 0072F504    mov         ecx,dword ptr [eax]
 0072F506    call        dword ptr [ecx+50]
 0072F509    mov         edx,dword ptr [ebp-34]
 0072F50C    lea         eax,[ebp-30]
 0072F50F    call        @VarFromUStr
 0072F514    lea         eax,[ebp-30]
 0072F517    lea         edx,[ebp-20]
 0072F51A    call        VarToStr
 0072F51F    mov         eax,dword ptr [ebp-20]
 0072F522    lea         edx,[ebp-0C]
 0072F525    call        0072EAA0
 0072F52A    mov         eax,dword ptr [ebp-10]
 0072F52D    mov         edx,dword ptr [ebp-0C]
 0072F530    call        @UStrCat
 0072F535    mov         eax,dword ptr [ebp-10]
>0072F538    jmp         0072F590
 0072F53A    lea         edx,[ebp-3C]
 0072F53D    mov         eax,dword ptr [ebp-8]
 0072F540    mov         ecx,dword ptr [eax]
 0072F542    call        dword ptr [ecx+34]
 0072F545    mov         eax,dword ptr [ebp-3C]
 0072F548    lea         edx,[ebp-38]
 0072F54B    call        LowerCase
 0072F550    mov         eax,dword ptr [ebp-38]
 0072F553    mov         edx,72F674;'l'
 0072F558    call        @UStrEqual
>0072F55D    jne         0072F590
 0072F55F    mov         eax,dword ptr [ebp-10]
 0072F562    cmp         dword ptr [eax],0
>0072F565    je          0072F577
 0072F567    mov         eax,dword ptr [ebp-10]
 0072F56A    mov         edx,72F64C;'") or Said("'
 0072F56F    call        @UStrCat
 0072F574    mov         eax,dword ptr [ebp-10]
 0072F577    lea         edx,[ebp-40]
 0072F57A    mov         eax,dword ptr [ebp-8]
 0072F57D    call        0072F43C
 0072F582    mov         edx,dword ptr [ebp-40]
 0072F585    mov         eax,dword ptr [ebp-10]
 0072F588    call        @UStrCat
 0072F58D    mov         eax,dword ptr [ebp-10]
 0072F590    xor         eax,eax
 0072F592    pop         edx
 0072F593    pop         ecx
 0072F594    pop         ecx
 0072F595    mov         dword ptr fs:[eax],edx
>0072F598    jmp         0072F5A4
>0072F59A    jmp         @HandleAnyException
 0072F59F    call        @DoneExcept
 0072F5A4    lea         edx,[ebp-44]
 0072F5A7    mov         eax,dword ptr [ebp-8]
 0072F5AA    mov         ecx,dword ptr [eax]
 0072F5AC    call        dword ptr [ecx+90]
 0072F5B2    mov         edx,dword ptr [ebp-44]
 0072F5B5    lea         eax,[ebp-8]
 0072F5B8    call        @IntfCopy
 0072F5BD    cmp         dword ptr [ebp-8],0
>0072F5C1    jne         0072F493
 0072F5C7    xor         eax,eax
 0072F5C9    pop         edx
 0072F5CA    pop         ecx
 0072F5CB    pop         ecx
 0072F5CC    mov         dword ptr fs:[eax],edx
 0072F5CF    push        72F629
 0072F5D4    lea         eax,[ebp-44]
 0072F5D7    call        @IntfClear
 0072F5DC    lea         eax,[ebp-40]
 0072F5DF    mov         edx,4
 0072F5E4    call        @UStrArrayClr
 0072F5E9    lea         eax,[ebp-30]
 0072F5EC    call        @VarClr
 0072F5F1    lea         eax,[ebp-20]
 0072F5F4    mov         edx,3
 0072F5F9    call        @UStrArrayClr
 0072F5FE    lea         eax,[ebp-14]
 0072F601    call        @IntfClear
 0072F606    lea         eax,[ebp-0C]
 0072F609    call        @UStrClr
 0072F60E    lea         eax,[ebp-8]
 0072F611    mov         edx,dword ptr ds:[58A824];IXMLNode
 0072F617    mov         ecx,2
 0072F61C    call        @FinalizeArray
 0072F621    ret
>0072F622    jmp         @HandleFinally
>0072F627    jmp         0072F5D4
 0072F629    pop         edi
 0072F62A    pop         esi
 0072F62B    pop         ebx
 0072F62C    mov         esp,ebp
 0072F62E    pop         ebp
 0072F62F    ret
end;*}

//0072F678
{*procedure sub_0072F678(?:?);
begin
 0072F678    push        ebp
 0072F679    mov         ebp,esp
 0072F67B    mov         ecx,35
 0072F680    push        0
 0072F682    push        0
 0072F684    dec         ecx
>0072F685    jne         0072F680
 0072F687    push        ecx
 0072F688    push        ebx
 0072F689    push        esi
 0072F68A    push        edi
 0072F68B    mov         dword ptr [ebp-4],eax
 0072F68E    mov         eax,dword ptr [ebp-4]
 0072F691    call        @IntfAddRef
 0072F696    mov         ecx,10
 0072F69B    lea         eax,[ebp-74]
 0072F69E    mov         edx,dword ptr ds:[40128C];string
 0072F6A4    call        @InitializeArray
 0072F6A9    xor         eax,eax
 0072F6AB    push        ebp
 0072F6AC    push        730720
 0072F6B1    push        dword ptr fs:[eax]
 0072F6B4    mov         dword ptr fs:[eax],esp
 0072F6B7    lea         ecx,[ebp-0B8]
 0072F6BD    mov         edx,730740;'NAME'
 0072F6C2    mov         eax,dword ptr [ebp-4]
 0072F6C5    mov         ebx,dword ptr [eax]
 0072F6C7    call        dword ptr [ebx+0C]
 0072F6CA    lea         eax,[ebp-0B8]
 0072F6D0    lea         edx,[ebp-0C]
 0072F6D3    call        VarToStr
 0072F6D8    lea         edx,[ebp-0BC]
 0072F6DE    mov         eax,dword ptr [ebp-0C]
 0072F6E1    call        LowerCase
 0072F6E6    mov         eax,dword ptr [ebp-0BC]
 0072F6EC    push        eax
 0072F6ED    lea         edx,[ebp-0C0]
 0072F6F3    mov         eax,[00822A28];gvar_00822A28:UnicodeString
 0072F6F8    call        LowerCase
 0072F6FD    mov         edx,dword ptr [ebp-0C0]
 0072F703    pop         eax
 0072F704    call        @UStrEqual
>0072F709    jne         0072F88A
 0072F70F    lea         eax,[ebp-0C4]
 0072F715    mov         ecx,dword ptr [ebp-0C]
 0072F718    mov         edx,730758;'// '
 0072F71D    call        @UStrCat3
 0072F722    mov         edx,dword ptr [ebp-0C4]
 0072F728    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072F72D    mov         eax,dword ptr [eax]
 0072F72F    mov         eax,dword ptr [eax+394]
 0072F735    mov         eax,dword ptr [eax+2A4]
 0072F73B    mov         ecx,dword ptr [eax]
 0072F73D    call        dword ptr [ecx+38]
 0072F740    push        73076C;'if Said("'
 0072F745    push        dword ptr ds:[822A28];gvar_00822A28:UnicodeString
 0072F74B    push        73078C;'") then'
 0072F750    lea         eax,[ebp-0C8]
 0072F756    mov         edx,3
 0072F75B    call        @UStrCatN
 0072F760    mov         edx,dword ptr [ebp-0C8]
 0072F766    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072F76B    mov         eax,dword ptr [eax]
 0072F76D    mov         eax,dword ptr [eax+394]
 0072F773    mov         eax,dword ptr [eax+2A4]
 0072F779    mov         ecx,dword ptr [eax]
 0072F77B    call        dword ptr [ecx+38]
 0072F77E    cmp         dword ptr ds:[822A2C],0;gvar_00822A2C:UnicodeString
>0072F785    je          0072F7C5
 0072F787    push        7307A8;'  Say("'
 0072F78C    push        dword ptr ds:[822A2C];gvar_00822A2C:UnicodeString
 0072F792    push        7307C4;'")'
 0072F797    lea         eax,[ebp-0CC]
 0072F79D    mov         edx,3
 0072F7A2    call        @UStrCatN
 0072F7A7    mov         edx,dword ptr [ebp-0CC]
 0072F7AD    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072F7B2    mov         eax,dword ptr [eax]
 0072F7B4    mov         eax,dword ptr [eax+394]
 0072F7BA    mov         eax,dword ptr [eax+2A4]
 0072F7C0    mov         ecx,dword ptr [eax]
 0072F7C2    call        dword ptr [ecx+38]
 0072F7C5    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072F7CA    mov         eax,dword ptr [eax]
 0072F7CC    mov         eax,dword ptr [eax+394]
 0072F7D2    mov         eax,dword ptr [eax+2A4]
 0072F7D8    mov         edx,7307D8;'  var.Awake = true'
 0072F7DD    mov         ecx,dword ptr [eax]
 0072F7DF    call        dword ptr [ecx+38]
 0072F7E2    fld         qword ptr ds:[822A30];gvar_00822A30:Double
 0072F7E8    fstp        tbyte ptr [ebp-0A0]
 0072F7EE    wait
 0072F7EF    movzx       eax,word ptr [ebp-98]
 0072F7F6    push        eax
 0072F7F7    push        dword ptr [ebp-9C]
 0072F7FD    push        dword ptr [ebp-0A0]
 0072F803    lea         edx,[ebp-2C]
 0072F806    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 0072F80B    call        FloatToStr
 0072F810    push        73080C;'  wait '
 0072F815    push        dword ptr [ebp-2C]
 0072F818    push        730828;' seconds'
 0072F81D    lea         eax,[ebp-0D0]
 0072F823    mov         edx,3
 0072F828    call        @UStrCatN
 0072F82D    mov         edx,dword ptr [ebp-0D0]
 0072F833    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072F838    mov         eax,dword ptr [eax]
 0072F83A    mov         eax,dword ptr [eax+394]
 0072F840    mov         eax,dword ptr [eax+2A4]
 0072F846    mov         ecx,dword ptr [eax]
 0072F848    call        dword ptr [ecx+38]
 0072F84B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072F850    mov         eax,dword ptr [eax]
 0072F852    mov         eax,dword ptr [eax+394]
 0072F858    mov         eax,dword ptr [eax+2A4]
 0072F85E    mov         edx,730848;'  var.Awake = false'
 0072F863    mov         ecx,dword ptr [eax]
 0072F865    call        dword ptr [ecx+38]
 0072F868    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0072F86D    mov         eax,dword ptr [eax]
 0072F86F    mov         eax,dword ptr [eax+394]
 0072F875    mov         eax,dword ptr [eax+2A4]
 0072F87B    mov         edx,73087C;'end if'
 0072F880    mov         ecx,dword ptr [eax]
 0072F882    call        dword ptr [ecx+38]
>0072F885    jmp         00730673
 0072F88A    lea         edx,[ebp-0D4]
 0072F890    mov         eax,dword ptr [ebp-0C]
 0072F893    call        LowerCase
 0072F898    mov         eax,dword ptr [ebp-0D4]
 0072F89E    push        eax
 0072F89F    lea         edx,[ebp-0D8]
 0072F8A5    mov         eax,[00822A1C];gvar_00822A1C:UnicodeString
 0072F8AA    call        LowerCase
 0072F8AF    mov         edx,dword ptr [ebp-0D8]
 0072F8B5    pop         eax
 0072F8B6    call        @UStrEqual
>0072F8BB    je          0072F8EE
 0072F8BD    lea         edx,[ebp-0DC]
 0072F8C3    mov         eax,dword ptr [ebp-0C]
 0072F8C6    call        LowerCase
 0072F8CB    mov         eax,dword ptr [ebp-0DC]
 0072F8D1    push        eax
 0072F8D2    lea         edx,[ebp-0E0]
 0072F8D8    mov         eax,[00822A20];gvar_00822A20:UnicodeString
 0072F8DD    call        LowerCase
 0072F8E2    mov         edx,dword ptr [ebp-0E0]
 0072F8E8    pop         eax
 0072F8E9    call        @UStrEqual
 0072F8EE    lea         edx,[ebp-0E4]
 0072F8F4    mov         eax,dword ptr [ebp-4]
 0072F8F7    mov         ecx,dword ptr [eax]
 0072F8F9    call        dword ptr [ecx+14]
 0072F8FC    mov         eax,dword ptr [ebp-0E4]
 0072F902    lea         edx,[ebp-8]
 0072F905    mov         ecx,dword ptr [eax]
 0072F907    call        dword ptr [ecx+34]
 0072F90A    lea         eax,[ebp-18]
 0072F90D    mov         edx,730898;'var.Dummy'
 0072F912    call        @UStrLAsg
 0072F917    cmp         dword ptr [ebp-8],0
>0072F91B    je          007303E6
 0072F921    xor         eax,eax
 0072F923    push        ebp
 0072F924    push        7303B3
 0072F929    push        dword ptr fs:[eax]
 0072F92C    mov         dword ptr fs:[eax],esp
 0072F92F    mov         eax,dword ptr [ebp-8]
 0072F932    mov         edx,dword ptr [eax]
 0072F934    call        dword ptr [edx+38]
 0072F937    cmp         al,8
>0072F939    jne         007302EC
 0072F93F    lea         edx,[ebp-14]
 0072F942    mov         eax,dword ptr [ebp-8]
 0072F945    mov         ecx,dword ptr [eax]
 0072F947    call        dword ptr [ecx+50]
 0072F94A    mov         ebx,10
 0072F94F    lea         esi,[ebp-74]
 0072F952    mov         eax,esi
 0072F954    call        @UStrClr
 0072F959    add         esi,4
 0072F95C    dec         ebx
>0072F95D    jne         0072F952
 0072F95F    mov         ebx,1
 0072F964    mov         edx,dword ptr [ebp-14]
 0072F967    mov         eax,7308B8;'	'
 0072F96C    call        Pos
 0072F971    mov         edi,eax
>0072F973    jmp         0072F9A9
 0072F975    lea         eax,[ebp+ebx*4-78]
 0072F979    push        eax
 0072F97A    mov         ecx,edi
 0072F97C    dec         ecx
 0072F97D    mov         edx,1
 0072F982    mov         eax,dword ptr [ebp-14]
 0072F985    call        @UStrCopy
 0072F98A    lea         eax,[ebp-14]
 0072F98D    mov         ecx,edi
 0072F98F    mov         edx,1
 0072F994    call        @UStrDelete
 0072F999    inc         ebx
 0072F99A    mov         edx,dword ptr [ebp-14]
 0072F99D    mov         eax,7308B8;'	'
 0072F9A2    call        Pos
 0072F9A7    mov         edi,eax
 0072F9A9    test        edi,edi
>0072F9AB    jle         0072F9B2
 0072F9AD    cmp         ebx,10
>0072F9B0    jle         0072F975
 0072F9B2    lea         eax,[ebp-28]
 0072F9B5    mov         edx,dword ptr [ebp-48]
 0072F9B8    call        @UStrLAsg
 0072F9BD    cmp         dword ptr [ebp-70],0
>0072F9C1    je          0072F9CE
 0072F9C3    lea         eax,[ebp-0C]
 0072F9C6    mov         edx,dword ptr [ebp-70]
 0072F9C9    call        @UStrLAsg
 0072F9CE    mov         eax,dword ptr [ebp-6C]
 0072F9D1    mov         edx,7308C8;'C'
 0072F9D6    call        @UStrEqual
>0072F9DB    jne         0072FABF
 0072F9E1    lea         eax,[ebp-1C]
 0072F9E4    mov         edx,dword ptr [ebp-5C]
 0072F9E7    call        @UStrLAsg
 0072F9EC    mov         edx,dword ptr [ebp-1C]
 0072F9EF    mov         eax,7308D8;','
 0072F9F4    call        Pos
 0072F9F9    test        eax,eax
>0072F9FB    jle         0072FA47
 0072F9FD    lea         eax,[ebp-24]
 0072FA00    mov         edx,dword ptr [ebp-1C]
 0072FA03    call        @UStrLAsg
 0072FA08    lea         eax,[ebp-1C]
 0072FA0B    push        eax
 0072FA0C    mov         edx,dword ptr [ebp-24]
 0072FA0F    mov         eax,7308D8;','
 0072FA14    call        Pos
 0072FA19    mov         ecx,eax
 0072FA1B    dec         ecx
 0072FA1C    mov         edx,1
 0072FA21    mov         eax,dword ptr [ebp-24]
 0072FA24    call        @UStrCopy
 0072FA29    mov         edx,dword ptr [ebp-24]
 0072FA2C    mov         eax,7308D8;','
 0072FA31    call        Pos
 0072FA36    mov         ecx,eax
 0072FA38    lea         eax,[ebp-24]
 0072FA3B    mov         edx,1
 0072FA40    call        @UStrDelete
>0072FA45    jmp         0072FA4F
 0072FA47    lea         eax,[ebp-24]
 0072FA4A    call        @UStrClr
 0072FA4F    cmp         dword ptr [ebp-24],0
>0072FA53    je          0072FA79
 0072FA55    push        7308E8;'Execute("'
 0072FA5A    push        dword ptr [ebp-1C]
 0072FA5D    push        730908;'", "'
 0072FA62    push        dword ptr [ebp-24]
 0072FA65    push        7307C4;'")'
 0072FA6A    lea         eax,[ebp-18]
 0072FA6D    mov         edx,5
 0072FA72    call        @UStrCatN
>0072FA77    jmp         0072FA93
 0072FA79    push        7308E8;'Execute("'
 0072FA7E    push        dword ptr [ebp-1C]
 0072FA81    push        7307C4;'")'
 0072FA86    lea         eax,[ebp-18]
 0072FA89    mov         edx,3
 0072FA8E    call        @UStrCatN
 0072FA93    cmp         dword ptr [ebp-44],0
>0072FA97    je          007303A9
 0072FA9D    push        730920;'say("'
 0072FAA2    push        dword ptr [ebp-44]
 0072FAA5    push        730938;'"), '
 0072FAAA    push        dword ptr [ebp-18]
 0072FAAD    lea         eax,[ebp-18]
 0072FAB0    mov         edx,4
 0072FAB5    call        @UStrCatN
>0072FABA    jmp         007303A9
 0072FABF    mov         eax,dword ptr [ebp-6C]
 0072FAC2    mov         edx,730950;'L'
 0072FAC7    call        @UStrEqual
>0072FACC    jne         0072FAFA
 0072FACE    cmp         dword ptr [ebp-44],0
>0072FAD2    je          007303A9
 0072FAD8    push        730920;'say("'
 0072FADD    push        dword ptr [ebp-44]
 0072FAE0    push        730938;'"), '
 0072FAE5    push        dword ptr [ebp-18]
 0072FAE8    lea         eax,[ebp-18]
 0072FAEB    mov         edx,4
 0072FAF0    call        @UStrCatN
>0072FAF5    jmp         007303A9
 0072FAFA    lea         eax,[ebp-18]
 0072FAFD    call        @UStrClr
 0072FB02    lea         eax,[ebp-1C]
 0072FB05    mov         edx,dword ptr [ebp-5C]
 0072FB08    call        @UStrLAsg
 0072FB0D    mov         ebx,1
>0072FB12    jmp         007302B0
 0072FB17    lea         eax,[ebp-0EC]
 0072FB1D    push        eax
 0072FB1E    mov         ecx,0A
 0072FB23    mov         edx,ebx
 0072FB25    mov         eax,dword ptr [ebp-1C]
 0072FB28    call        @UStrCopy
 0072FB2D    mov         eax,dword ptr [ebp-0EC]
 0072FB33    lea         edx,[ebp-0E8]
 0072FB39    call        LowerCase
 0072FB3E    mov         eax,dword ptr [ebp-0E8]
 0072FB44    mov         edx,730960;'{ctrldown}'
 0072FB49    call        @UStrEqual
>0072FB4E    jne         0072FC63
 0072FB54    lea         eax,[ebp-0F4]
 0072FB5A    push        eax
 0072FB5B    lea         edx,[ebx+0B]
 0072FB5E    mov         ecx,8
 0072FB63    mov         eax,dword ptr [ebp-1C]
 0072FB66    call        @UStrCopy
 0072FB6B    mov         eax,dword ptr [ebp-0F4]
 0072FB71    lea         edx,[ebp-0F0]
 0072FB77    call        LowerCase
 0072FB7C    mov         eax,dword ptr [ebp-0F0]
 0072FB82    mov         edx,730984;'{ctrlup}'
 0072FB87    call        @UStrEqual
>0072FB8C    jne         0072FC63
 0072FB92    mov         eax,730998
 0072FB97    mov         dword ptr [ebp-0A4],eax
 0072FB9D    mov         eax,dword ptr [ebp-1C]
 0072FBA0    movzx       eax,word ptr [eax+ebx*2+12]
 0072FBA5    mov         edx,dword ptr [ebp-0A4]
 0072FBAB    cmp         ax,0FF
>0072FBAF    ja          0072FBB7
 0072FBB1    movzx       eax,ax
 0072FBB4    bt          dword ptr [edx],eax
 0072FBB7    setb        al
 0072FBBA    mov         byte ptr [ebp-0A5],al
 0072FBC0    cmp         byte ptr [ebp-0A5],0
>0072FBC7    je          0072FC23
 0072FBC9    mov         eax,dword ptr [ebp-1C]
 0072FBCC    movzx       eax,word ptr [eax+ebx*2+12]
 0072FBD1    mov         word ptr [ebp-0A8],ax
 0072FBD8    mov         eax,dword ptr [ebp-1C]
 0072FBDB    movzx       eax,word ptr [eax+ebx*2+12]
 0072FBE0    add         eax,0FFFFFF9F
 0072FBE3    sub         ax,1A
>0072FBE7    jae         0072FBFC
 0072FBE9    mov         eax,dword ptr [ebp-1C]
 0072FBEC    movzx       eax,word ptr [eax+ebx*2+12]
 0072FBF1    and         ax,0FFDF
 0072FBF5    mov         word ptr [ebp-0A8],ax
 0072FBFC    lea         eax,[ebp-0F8]
 0072FC02    movzx       edx,word ptr [ebp-0A8]
 0072FC09    call        @UStrFromWChar
 0072FC0E    mov         ecx,dword ptr [ebp-0F8]
 0072FC14    lea         eax,[ebp-20]
 0072FC17    mov         edx,7309C4;'^'
 0072FC1C    call        @UStrCat3
>0072FC21    jmp         0072FC5A
 0072FC23    lea         eax,[ebp-100]
 0072FC29    mov         edx,dword ptr [ebp-1C]
 0072FC2C    movzx       edx,word ptr [edx+ebx*2+12]
 0072FC31    call        @UStrFromWChar
 0072FC36    mov         eax,dword ptr [ebp-100]
 0072FC3C    lea         edx,[ebp-0FC]
 0072FC42    call        0072AAB8
 0072FC47    mov         ecx,dword ptr [ebp-0FC]
 0072FC4D    lea         eax,[ebp-20]
 0072FC50    mov         edx,7309D4;'Ctrl+'
 0072FC55    call        @UStrCat3
 0072FC5A    add         ebx,13
 0072FC5D    dec         ebx
>0072FC5E    jmp         00730291
 0072FC63    lea         eax,[ebp-108]
 0072FC69    push        eax
 0072FC6A    mov         ecx,9
 0072FC6F    mov         edx,ebx
 0072FC71    mov         eax,dword ptr [ebp-1C]
 0072FC74    call        @UStrCopy
 0072FC79    mov         eax,dword ptr [ebp-108]
 0072FC7F    lea         edx,[ebp-104]
 0072FC85    call        LowerCase
 0072FC8A    mov         eax,dword ptr [ebp-104]
 0072FC90    mov         edx,7309EC;'{altdown}'
 0072FC95    call        @UStrEqual
>0072FC9A    jne         0072FD16
 0072FC9C    lea         eax,[ebp-110]
 0072FCA2    push        eax
 0072FCA3    lea         edx,[ebx+0A]
 0072FCA6    mov         ecx,7
 0072FCAB    mov         eax,dword ptr [ebp-1C]
 0072FCAE    call        @UStrCopy
 0072FCB3    mov         eax,dword ptr [ebp-110]
 0072FCB9    lea         edx,[ebp-10C]
 0072FCBF    call        LowerCase
 0072FCC4    mov         eax,dword ptr [ebp-10C]
 0072FCCA    mov         edx,730A0C;'{altup}'
 0072FCCF    call        @UStrEqual
>0072FCD4    jne         0072FD16
 0072FCD6    lea         eax,[ebp-118]
 0072FCDC    mov         edx,dword ptr [ebp-1C]
 0072FCDF    movzx       edx,word ptr [edx+ebx*2+10]
 0072FCE4    call        @UStrFromWChar
 0072FCE9    mov         eax,dword ptr [ebp-118]
 0072FCEF    lea         edx,[ebp-114]
 0072FCF5    call        0072AAB8
 0072FCFA    mov         ecx,dword ptr [ebp-114]
 0072FD00    lea         eax,[ebp-20]
 0072FD03    mov         edx,730A28;'Alt+'
 0072FD08    call        @UStrCat3
 0072FD0D    add         ebx,11
 0072FD10    dec         ebx
>0072FD11    jmp         00730291
 0072FD16    mov         eax,dword ptr [ebp-1C]
 0072FD19    cmp         word ptr [eax+ebx*2-2],7B
>0072FD1F    jne         00730270
 0072FD25    lea         eax,[ebp-20]
 0072FD28    call        @UStrClr
 0072FD2D    inc         ebx
>0072FD2E    jmp         0072FD52
 0072FD30    lea         eax,[ebp-11C]
 0072FD36    mov         edx,dword ptr [ebp-1C]
 0072FD39    movzx       edx,word ptr [edx+ebx*2-2]
 0072FD3E    call        @UStrFromWChar
 0072FD43    mov         edx,dword ptr [ebp-11C]
 0072FD49    lea         eax,[ebp-20]
 0072FD4C    call        @UStrCat
 0072FD51    inc         ebx
 0072FD52    mov         eax,dword ptr [ebp-1C]
 0072FD55    call        @UStrLen
 0072FD5A    cmp         ebx,eax
>0072FD5C    jg          0072FD69
 0072FD5E    mov         eax,dword ptr [ebp-1C]
 0072FD61    cmp         word ptr [eax+ebx*2-2],7D
>0072FD67    jne         0072FD30
 0072FD69    mov         dword ptr [ebp-7C],1
 0072FD70    xor         eax,eax
 0072FD72    mov         dword ptr [ebp-88],eax
 0072FD78    mov         dword ptr [ebp-84],eax
 0072FD7E    xor         eax,eax
 0072FD80    mov         dword ptr [ebp-90],eax
 0072FD86    mov         dword ptr [ebp-8C],eax
 0072FD8C    mov         edx,dword ptr [ebp-20]
 0072FD8F    mov         eax,7308D8;','
 0072FD94    call        Pos
 0072FD99    test        eax,eax
>0072FD9B    jle         0072FFE7
 0072FDA1    lea         eax,[ebp-24]
 0072FDA4    mov         edx,dword ptr [ebp-20]
 0072FDA7    call        @UStrLAsg
 0072FDAC    lea         eax,[ebp-20]
 0072FDAF    push        eax
 0072FDB0    mov         edx,dword ptr [ebp-24]
 0072FDB3    mov         eax,7308D8;','
 0072FDB8    call        Pos
 0072FDBD    mov         ecx,eax
 0072FDBF    dec         ecx
 0072FDC0    mov         edx,1
 0072FDC5    mov         eax,dword ptr [ebp-24]
 0072FDC8    call        @UStrCopy
 0072FDCD    mov         edx,dword ptr [ebp-24]
 0072FDD0    mov         eax,7308D8;','
 0072FDD5    call        Pos
 0072FDDA    mov         ecx,eax
 0072FDDC    lea         eax,[ebp-24]
 0072FDDF    mov         edx,1
 0072FDE4    call        @UStrDelete
 0072FDE9    mov         eax,dword ptr [ebp-20]
 0072FDEC    mov         edx,730A40;'MouseSlowLeftClick'
 0072FDF1    call        @UStrEqual
>0072FDF6    jne         0072FE17
 0072FDF8    lea         eax,[ebp-20]
 0072FDFB    mov         edx,730A74;'LMB'
 0072FE00    call        @UStrLAsg
 0072FE05    lea         eax,[ebp-24]
 0072FE08    mov         ecx,dword ptr [ebp-24]
 0072FE0B    mov         edx,730A88;'1,'
 0072FE10    call        @UStrCat3
>0072FE15    jmp         0072FE69
 0072FE17    mov         eax,dword ptr [ebp-20]
 0072FE1A    mov         edx,730A9C;'MouseSlowRightClick'
 0072FE1F    call        @UStrEqual
>0072FE24    jne         0072FE45
 0072FE26    lea         eax,[ebp-20]
 0072FE29    mov         edx,730AD0;'RMB'
 0072FE2E    call        @UStrLAsg
 0072FE33    lea         eax,[ebp-24]
 0072FE36    mov         ecx,dword ptr [ebp-24]
 0072FE39    mov         edx,730A88;'1,'
 0072FE3E    call        @UStrCat3
>0072FE43    jmp         0072FE69
 0072FE45    mov         eax,dword ptr [ebp-20]
 0072FE48    mov         edx,730AE4;'MouseTo'
 0072FE4D    call        @UStrEqual
>0072FE52    jne         0072FE69
 0072FE54    lea         eax,[ebp-20]
 0072FE57    mov         edx,730898;'var.Dummy'
 0072FE5C    call        @UStrLAsg
 0072FE61    lea         eax,[ebp-24]
 0072FE64    call        @UStrClr
 0072FE69    mov         edx,dword ptr [ebp-24]
 0072FE6C    mov         eax,7308D8;','
 0072FE71    call        Pos
 0072FE76    test        eax,eax
>0072FE78    jle         0072FFD7
 0072FE7E    lea         eax,[ebp-120]
 0072FE84    push        eax
 0072FE85    mov         edx,dword ptr [ebp-24]
 0072FE88    mov         eax,7308D8;','
 0072FE8D    call        Pos
 0072FE92    mov         ecx,eax
 0072FE94    dec         ecx
 0072FE95    mov         edx,1
 0072FE9A    mov         eax,dword ptr [ebp-24]
 0072FE9D    call        @UStrCopy
 0072FEA2    mov         eax,dword ptr [ebp-120]
 0072FEA8    mov         edx,1
 0072FEAD    call        StrToIntDef
 0072FEB2    mov         dword ptr [ebp-7C],eax
 0072FEB5    mov         edx,dword ptr [ebp-24]
 0072FEB8    mov         eax,7308D8;','
 0072FEBD    call        Pos
 0072FEC2    mov         ecx,eax
 0072FEC4    lea         eax,[ebp-24]
 0072FEC7    mov         edx,1
 0072FECC    call        @UStrDelete
 0072FED1    mov         edx,dword ptr [ebp-24]
 0072FED4    mov         eax,7308D8;','
 0072FED9    call        Pos
 0072FEDE    test        eax,eax
>0072FEE0    jle         0072FFC0
 0072FEE6    push        0
 0072FEE8    push        0
 0072FEEA    push        0
 0072FEEC    lea         eax,[ebp-124]
 0072FEF2    push        eax
 0072FEF3    mov         edx,dword ptr [ebp-24]
 0072FEF6    mov         eax,7308D8;','
 0072FEFB    call        Pos
 0072FF00    mov         ecx,eax
 0072FF02    dec         ecx
 0072FF03    mov         edx,1
 0072FF08    mov         eax,dword ptr [ebp-24]
 0072FF0B    call        @UStrCopy
 0072FF10    mov         eax,dword ptr [ebp-124]
 0072FF16    call        004F8DB8
 0072FF1B    fstp        qword ptr [ebp-90]
 0072FF21    wait
 0072FF22    mov         edx,dword ptr [ebp-24]
 0072FF25    mov         eax,7308D8;','
 0072FF2A    call        Pos
 0072FF2F    mov         ecx,eax
 0072FF31    lea         eax,[ebp-24]
 0072FF34    mov         edx,1
 0072FF39    call        @UStrDelete
 0072FF3E    mov         edx,dword ptr [ebp-24]
 0072FF41    mov         eax,7308D8;','
 0072FF46    call        Pos
 0072FF4B    test        eax,eax
>0072FF4D    jle         0072FFA9
 0072FF4F    push        0
 0072FF51    push        0
 0072FF53    push        0
 0072FF55    lea         eax,[ebp-128]
 0072FF5B    push        eax
 0072FF5C    mov         edx,dword ptr [ebp-24]
 0072FF5F    mov         eax,7308D8;','
 0072FF64    call        Pos
 0072FF69    mov         ecx,eax
 0072FF6B    dec         ecx
 0072FF6C    mov         edx,1
 0072FF71    mov         eax,dword ptr [ebp-24]
 0072FF74    call        @UStrCopy
 0072FF79    mov         eax,dword ptr [ebp-128]
 0072FF7F    call        004F8DB8
 0072FF84    fstp        qword ptr [ebp-88]
 0072FF8A    wait
 0072FF8B    mov         edx,dword ptr [ebp-24]
 0072FF8E    mov         eax,7308D8;','
 0072FF93    call        Pos
 0072FF98    mov         ecx,eax
 0072FF9A    lea         eax,[ebp-24]
 0072FF9D    mov         edx,1
 0072FFA2    call        @UStrDelete
>0072FFA7    jmp         0072FFE7
 0072FFA9    push        0
 0072FFAB    push        0
 0072FFAD    push        0
 0072FFAF    mov         eax,dword ptr [ebp-24]
 0072FFB2    call        004F8DB8
 0072FFB7    fstp        qword ptr [ebp-88]
 0072FFBD    wait
>0072FFBE    jmp         0072FFE7
 0072FFC0    push        0
 0072FFC2    push        0
 0072FFC4    push        0
 0072FFC6    mov         eax,dword ptr [ebp-24]
 0072FFC9    call        004F8DB8
 0072FFCE    fstp        qword ptr [ebp-90]
 0072FFD4    wait
>0072FFD5    jmp         0072FFE7
 0072FFD7    mov         edx,1
 0072FFDC    mov         eax,dword ptr [ebp-24]
 0072FFDF    call        StrToIntDef
 0072FFE4    mov         dword ptr [ebp-7C],eax
 0072FFE7    lea         edx,[ebp-12C]
 0072FFED    mov         eax,dword ptr [ebp-20]
 0072FFF0    call        LowerCase
 0072FFF5    mov         eax,dword ptr [ebp-12C]
 0072FFFB    mov         edx,730B00;'down'
 00730000    call        @UStrEqual
>00730005    je          00730097
 0073000B    lea         edx,[ebp-130]
 00730011    mov         eax,dword ptr [ebp-20]
 00730014    call        LowerCase
 00730019    mov         eax,dword ptr [ebp-130]
 0073001F    mov         edx,730B18;'scroll down'
 00730024    call        @UStrEqual
>00730029    je          00730097
 0073002B    lea         edx,[ebp-134]
 00730031    mov         eax,dword ptr [ebp-20]
 00730034    call        LowerCase
 00730039    mov         eax,dword ptr [ebp-134]
 0073003F    mov         edx,730B3C;'mousemovedown'
 00730044    call        @UStrEqual
>00730049    je          00730097
 0073004B    lea         eax,[ebp-20]
 0073004E    mov         edx,730B00;'down'
 00730053    call        004F9D9C
 00730058    test        al,al
>0073005A    je          00730097
 0073005C    lea         edx,[ebp-138]
 00730062    mov         eax,dword ptr [ebp-20]
 00730065    call        0072A6FC
 0073006A    mov         edx,dword ptr [ebp-138]
 00730070    lea         eax,[ebp-20]
 00730073    call        @UStrLAsg
 00730078    push        730B64;'Press('
 0073007D    push        dword ptr [ebp-20]
 00730080    push        730B80;')'
 00730085    lea         eax,[ebp-20]
 00730088    mov         edx,3
 0073008D    call        @UStrCatN
>00730092    jmp         00730184
 00730097    lea         edx,[ebp-13C]
 0073009D    mov         eax,dword ptr [ebp-20]
 007300A0    call        LowerCase
 007300A5    mov         eax,dword ptr [ebp-13C]
 007300AB    mov         edx,730B90;'up'
 007300B0    call        @UStrEqual
>007300B5    je          00730168
 007300BB    lea         edx,[ebp-140]
 007300C1    mov         eax,dword ptr [ebp-20]
 007300C4    call        LowerCase
 007300C9    mov         eax,dword ptr [ebp-140]
 007300CF    mov         edx,730BA4;'pgup'
 007300D4    call        @UStrEqual
>007300D9    je          00730168
 007300DF    lea         edx,[ebp-144]
 007300E5    mov         eax,dword ptr [ebp-20]
 007300E8    call        LowerCase
 007300ED    mov         eax,dword ptr [ebp-144]
 007300F3    mov         edx,730BBC;'scroll up'
 007300F8    call        @UStrEqual
>007300FD    je          00730168
 007300FF    lea         edx,[ebp-148]
 00730105    mov         eax,dword ptr [ebp-20]
 00730108    call        LowerCase
 0073010D    mov         eax,dword ptr [ebp-148]
 00730113    mov         edx,730BDC;'mousemoveup'
 00730118    call        @UStrEqual
>0073011D    je          00730168
 0073011F    lea         eax,[ebp-20]
 00730122    mov         edx,730B90;'up'
 00730127    call        004F9D9C
 0073012C    test        al,al
>0073012E    je          00730168
 00730130    lea         edx,[ebp-14C]
 00730136    mov         eax,dword ptr [ebp-20]
 00730139    call        0072A6FC
 0073013E    mov         edx,dword ptr [ebp-14C]
 00730144    lea         eax,[ebp-20]
 00730147    call        @UStrLAsg
 0073014C    push        730C00;'Release('
 00730151    push        dword ptr [ebp-20]
 00730154    push        730B80;')'
 00730159    lea         eax,[ebp-20]
 0073015C    mov         edx,3
 00730161    call        @UStrCatN
>00730166    jmp         00730184
 00730168    lea         edx,[ebp-150]
 0073016E    mov         eax,dword ptr [ebp-20]
 00730171    call        0072A6FC
 00730176    mov         edx,dword ptr [ebp-150]
 0073017C    lea         eax,[ebp-20]
 0073017F    call        @UStrLAsg
 00730184    fld         qword ptr [ebp-90]
 0073018A    fcomp       dword ptr ds:[730C14];0:Single
 00730190    wait
 00730191    fnstsw      al
 00730193    sahf
>00730194    jbe         007301DA
 00730196    fld         qword ptr [ebp-90]
 0073019C    add         esp,0FFFFFFF4
 0073019F    fstp        tbyte ptr [esp]
 007301A2    wait
 007301A3    lea         edx,[ebp-30]
 007301A6    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 007301AB    call        FloatToStr
 007301B0    push        730B64;'Press('
 007301B5    push        dword ptr [ebp-20]
 007301B8    push        730C24;'),wait('
 007301BD    push        dword ptr [ebp-30]
 007301C0    push        730C40;' ms),Release('
 007301C5    push        dword ptr [ebp-20]
 007301C8    push        730B80;')'
 007301CD    lea         eax,[ebp-20]
 007301D0    mov         edx,7
 007301D5    call        @UStrCatN
 007301DA    fld         qword ptr [ebp-88]
 007301E0    fcomp       dword ptr ds:[730C14];0:Single
 007301E6    wait
 007301E7    fnstsw      al
 007301E9    sahf
>007301EA    jbe         00730223
 007301EC    fld         qword ptr [ebp-88]
 007301F2    add         esp,0FFFFFFF4
 007301F5    fstp        tbyte ptr [esp]
 007301F8    wait
 007301F9    lea         edx,[ebp-34]
 007301FC    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 00730201    call        FloatToStr
 00730206    push        dword ptr [ebp-20]
 00730209    push        730C68;',wait('
 0073020E    push        dword ptr [ebp-34]
 00730211    push        730C84;' ms)'
 00730216    lea         eax,[ebp-20]
 00730219    mov         edx,4
 0073021E    call        @UStrCatN
 00730223    cmp         dword ptr [ebp-7C],1
>00730227    jle         00730291
 00730229    lea         eax,[ebp-24]
 0073022C    mov         edx,dword ptr [ebp-20]
 0073022F    call        @UStrLAsg
 00730234    mov         eax,dword ptr [ebp-7C]
 00730237    sub         eax,2
>0073023A    jl          00730263
 0073023C    inc         eax
 0073023D    mov         dword ptr [ebp-94],eax
 00730243    push        dword ptr [ebp-24]
 00730246    push        7308D8;','
 0073024B    push        dword ptr [ebp-20]
 0073024E    lea         eax,[ebp-24]
 00730251    mov         edx,3
 00730256    call        @UStrCatN
 0073025B    dec         dword ptr [ebp-94]
>00730261    jne         00730243
 00730263    lea         eax,[ebp-20]
 00730266    mov         edx,dword ptr [ebp-24]
 00730269    call        @UStrLAsg
>0073026E    jmp         00730291
 00730270    lea         eax,[ebp-154]
 00730276    mov         edx,dword ptr [ebp-1C]
 00730279    movzx       edx,word ptr [edx+ebx*2-2]
 0073027E    call        @UStrFromWChar
 00730283    mov         eax,dword ptr [ebp-154]
 00730289    lea         edx,[ebp-20]
 0073028C    call        0072AAB8
 00730291    cmp         dword ptr [ebp-18],0
>00730295    je          007302A4
 00730297    lea         eax,[ebp-18]
 0073029A    mov         edx,730C9C;', '
 0073029F    call        @UStrCat
 007302A4    lea         eax,[ebp-18]
 007302A7    mov         edx,dword ptr [ebp-20]
 007302AA    call        @UStrCat
 007302AF    inc         ebx
 007302B0    mov         eax,dword ptr [ebp-1C]
 007302B3    call        @UStrLen
 007302B8    cmp         ebx,eax
>007302BA    jle         0072FB17
 007302C0    cmp         dword ptr [ebp-44],0
>007302C4    je          007303A9
 007302CA    push        730920;'say("'
 007302CF    push        dword ptr [ebp-44]
 007302D2    push        730938;'"), '
 007302D7    push        dword ptr [ebp-18]
 007302DA    lea         eax,[ebp-18]
 007302DD    mov         edx,4
 007302E2    call        @UStrCatN
>007302E7    jmp         007303A9
 007302EC    mov         eax,dword ptr [ebp-8]
 007302EF    mov         edx,dword ptr [eax]
 007302F1    call        dword ptr [edx+38]
 007302F4    cmp         al,1
>007302F6    jne         007303A9
 007302FC    lea         edx,[ebp-15C]
 00730302    mov         eax,dword ptr [ebp-8]
 00730305    mov         ecx,dword ptr [eax]
 00730307    call        dword ptr [ecx+34]
 0073030A    mov         eax,dword ptr [ebp-15C]
 00730310    lea         edx,[ebp-158]
 00730316    call        LowerCase
 0073031B    mov         eax,dword ptr [ebp-158]
 00730321    mov         edx,730CB0;'p'
 00730326    call        @UStrEqual
>0073032B    jne         0073036D
 0073032D    lea         edx,[ebp-174]
 00730333    mov         eax,dword ptr [ebp-8]
 00730336    mov         ecx,dword ptr [eax]
 00730338    call        dword ptr [ecx+50]
 0073033B    mov         edx,dword ptr [ebp-174]
 00730341    lea         eax,[ebp-170]
 00730347    call        @VarFromUStr
 0073034C    lea         eax,[ebp-170]
 00730352    lea         edx,[ebp-160]
 00730358    call        VarToStr
 0073035D    mov         eax,dword ptr [ebp-160]
 00730363    lea         edx,[ebp-10]
 00730366    call        0072EAA0
>0073036B    jmp         007303A9
 0073036D    lea         edx,[ebp-17C]
 00730373    mov         eax,dword ptr [ebp-8]
 00730376    mov         ecx,dword ptr [eax]
 00730378    call        dword ptr [ecx+34]
 0073037B    mov         eax,dword ptr [ebp-17C]
 00730381    lea         edx,[ebp-178]
 00730387    call        LowerCase
 0073038C    mov         eax,dword ptr [ebp-178]
 00730392    mov         edx,730CC0;'l'
 00730397    call        @UStrEqual
>0073039C    jne         007303A9
 0073039E    lea         edx,[ebp-10]
 007303A1    mov         eax,dword ptr [ebp-8]
 007303A4    call        0072F43C
 007303A9    xor         eax,eax
 007303AB    pop         edx
 007303AC    pop         ecx
 007303AD    pop         ecx
 007303AE    mov         dword ptr fs:[eax],edx
>007303B1    jmp         007303BD
>007303B3    jmp         @HandleAnyException
 007303B8    call        @DoneExcept
 007303BD    lea         edx,[ebp-180]
 007303C3    mov         eax,dword ptr [ebp-8]
 007303C6    mov         ecx,dword ptr [eax]
 007303C8    call        dword ptr [ecx+90]
 007303CE    mov         edx,dword ptr [ebp-180]
 007303D4    lea         eax,[ebp-8]
 007303D7    call        @IntfCopy
 007303DC    cmp         dword ptr [ebp-8],0
>007303E0    jne         0072F921
 007303E6    lea         edx,[ebp-184]
 007303EC    mov         eax,dword ptr [ebp-10]
 007303EF    call        Trim
 007303F4    mov         edx,dword ptr [ebp-184]
 007303FA    lea         eax,[ebp-10]
 007303FD    call        @UStrLAsg
 00730402    lea         eax,[ebp-188]
 00730408    mov         ecx,dword ptr [ebp-0C]
 0073040B    mov         edx,730758;'// '
 00730410    call        @UStrCat3
 00730415    mov         edx,dword ptr [ebp-188]
 0073041B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00730420    mov         eax,dword ptr [eax]
 00730422    mov         eax,dword ptr [eax+394]
 00730428    mov         eax,dword ptr [eax+2A4]
 0073042E    mov         ecx,dword ptr [eax]
 00730430    call        dword ptr [ecx+38]
 00730433    lea         edx,[ebp-18C]
 00730439    mov         eax,dword ptr [ebp-28]
 0073043C    call        LowerCase
 00730441    mov         eax,dword ptr [ebp-18C]
 00730447    mov         edx,730CD0;'global'
 0073044C    call        @UStrEqual
>00730451    jne         0073045B
 00730453    lea         eax,[ebp-28]
 00730456    call        @UStrClr
 0073045B    cmp         dword ptr [ebp-28],0
>0073045F    je          0073047B
 00730461    push        730CEC;' and Window.AfterDash~="'
 00730466    push        dword ptr [ebp-28]
 00730469    push        730D2C;'"'
 0073046E    lea         eax,[ebp-28]
 00730471    mov         edx,3
 00730476    call        @UStrCatN
 0073047B    mov         edx,dword ptr [ebp-18]
 0073047E    mov         eax,730D3C;'var.Awake'
 00730483    call        Pos
 00730488    test        eax,eax
>0073048A    jle         007304D7
 0073048C    push        730D5C;'Said("'
 00730491    push        dword ptr [ebp-10]
 00730494    push        7307C4;'")'
 00730499    push        dword ptr [ebp-28]
 0073049C    push        730D78;' => '
 007304A1    push        dword ptr [ebp-18]
 007304A4    lea         eax,[ebp-190]
 007304AA    mov         edx,6
 007304AF    call        @UStrCatN
 007304B4    mov         edx,dword ptr [ebp-190]
 007304BA    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 007304BF    mov         eax,dword ptr [eax]
 007304C1    mov         eax,dword ptr [eax+394]
 007304C7    mov         eax,dword ptr [eax+2A4]
 007304CD    mov         ecx,dword ptr [eax]
 007304CF    call        dword ptr [ecx+38]
>007304D2    jmp         00730576
 007304D7    mov         edx,dword ptr [ebp-10]
 007304DA    mov         eax,730D90;'("'
 007304DF    call        Pos
 007304E4    test        eax,eax
>007304E6    jle         00730530
 007304E8    push        730DA4;'var.Awake and (Said("'
 007304ED    push        dword ptr [ebp-10]
 007304F0    push        730DDC;'"))'
 007304F5    push        dword ptr [ebp-28]
 007304F8    push        730D78;' => '
 007304FD    push        dword ptr [ebp-18]
 00730500    lea         eax,[ebp-194]
 00730506    mov         edx,6
 0073050B    call        @UStrCatN
 00730510    mov         edx,dword ptr [ebp-194]
 00730516    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073051B    mov         eax,dword ptr [eax]
 0073051D    mov         eax,dword ptr [eax+394]
 00730523    mov         eax,dword ptr [eax+2A4]
 00730529    mov         ecx,dword ptr [eax]
 0073052B    call        dword ptr [ecx+38]
>0073052E    jmp         00730576
 00730530    push        730DF0;'var.Awake and Said("'
 00730535    push        dword ptr [ebp-10]
 00730538    push        7307C4;'")'
 0073053D    push        dword ptr [ebp-28]
 00730540    push        730D78;' => '
 00730545    push        dword ptr [ebp-18]
 00730548    lea         eax,[ebp-198]
 0073054E    mov         edx,6
 00730553    call        @UStrCatN
 00730558    mov         edx,dword ptr [ebp-198]
 0073055E    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00730563    mov         eax,dword ptr [eax]
 00730565    mov         eax,dword ptr [eax+394]
 0073056B    mov         eax,dword ptr [eax+2A4]
 00730571    mov         ecx,dword ptr [eax]
 00730573    call        dword ptr [ecx+38]
 00730576    lea         edx,[ebp-19C]
 0073057C    mov         eax,dword ptr [ebp-0C]
 0073057F    call        LowerCase
 00730584    mov         eax,dword ptr [ebp-19C]
 0073058A    push        eax
 0073058B    lea         edx,[ebp-1A0]
 00730591    mov         eax,[00822A1C];gvar_00822A1C:UnicodeString
 00730596    call        LowerCase
 0073059B    mov         edx,dword ptr [ebp-1A0]
 007305A1    pop         eax
 007305A2    call        @UStrEqual
>007305A7    jne         00730673
 007305AD    lea         eax,[ebp-1A4]
 007305B3    mov         ecx,dword ptr ds:[822A20];gvar_00822A20:UnicodeString
 007305B9    mov         edx,730758;'// '
 007305BE    call        @UStrCat3
 007305C3    mov         edx,dword ptr [ebp-1A4]
 007305C9    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 007305CE    mov         eax,dword ptr [eax]
 007305D0    mov         eax,dword ptr [eax+394]
 007305D6    mov         eax,dword ptr [eax+2A4]
 007305DC    mov         ecx,dword ptr [eax]
 007305DE    call        dword ptr [ecx+38]
 007305E1    cmp         dword ptr ds:[822A24],0;gvar_00822A24:UnicodeString
>007305E8    je          00730635
 007305EA    push        730DF0;'var.Awake and Said("'
 007305EF    push        dword ptr ds:[822A20];gvar_00822A20:UnicodeString
 007305F5    push        730E28;'") => Say("'
 007305FA    push        dword ptr ds:[822A24];gvar_00822A24:UnicodeString
 00730600    push        730E4C;'"), Release(var.Dictation)'
 00730605    lea         eax,[ebp-1A8]
 0073060B    mov         edx,5
 00730610    call        @UStrCatN
 00730615    mov         edx,dword ptr [ebp-1A8]
 0073061B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00730620    mov         eax,dword ptr [eax]
 00730622    mov         eax,dword ptr [eax+394]
 00730628    mov         eax,dword ptr [eax+2A4]
 0073062E    mov         ecx,dword ptr [eax]
 00730630    call        dword ptr [ecx+38]
>00730633    jmp         00730673
 00730635    push        730DF0;'var.Awake and Said("'
 0073063A    push        dword ptr ds:[822A20];gvar_00822A20:UnicodeString
 00730640    push        730E90;'") => Release(var.Dictation)'
 00730645    lea         eax,[ebp-1AC]
 0073064B    mov         edx,3
 00730650    call        @UStrCatN
 00730655    mov         edx,dword ptr [ebp-1AC]
 0073065B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00730660    mov         eax,dword ptr [eax]
 00730662    mov         eax,dword ptr [eax+394]
 00730668    mov         eax,dword ptr [eax+2A4]
 0073066E    mov         ecx,dword ptr [eax]
 00730670    call        dword ptr [ecx+38]
 00730673    xor         eax,eax
 00730675    pop         edx
 00730676    pop         ecx
 00730677    pop         ecx
 00730678    mov         dword ptr fs:[eax],edx
 0073067B    push        73072A
 00730680    lea         eax,[ebp-1AC]
 00730686    mov         edx,0B
 0073068B    call        @UStrArrayClr
 00730690    lea         eax,[ebp-180]
 00730696    call        @IntfClear
 0073069B    lea         eax,[ebp-17C]
 007306A1    mov         edx,3
 007306A6    call        @UStrArrayClr
 007306AB    lea         eax,[ebp-170]
 007306B1    call        @VarClr
 007306B6    lea         eax,[ebp-160]
 007306BC    mov         edx,1F
 007306C1    call        @UStrArrayClr
 007306C6    lea         eax,[ebp-0E4]
 007306CC    call        @IntfClear
 007306D1    lea         eax,[ebp-0E0]
 007306D7    mov         edx,0A
 007306DC    call        @UStrArrayClr
 007306E1    lea         eax,[ebp-0B8]
 007306E7    call        @VarClr
 007306EC    lea         eax,[ebp-74]
 007306EF    mov         ecx,10
 007306F4    mov         edx,dword ptr ds:[40128C];string
 007306FA    call        @FinalizeArray
 007306FF    lea         eax,[ebp-34]
 00730702    mov         edx,0B
 00730707    call        @UStrArrayClr
 0073070C    lea         eax,[ebp-8]
 0073070F    mov         edx,dword ptr ds:[58A824];IXMLNode
 00730715    mov         ecx,2
 0073071A    call        @FinalizeArray
 0073071F    ret
>00730720    jmp         @HandleFinally
>00730725    jmp         00730680
 0073072A    pop         edi
 0073072B    pop         esi
 0073072C    pop         ebx
 0073072D    mov         esp,ebp
 0073072F    pop         ebp
 00730730    ret
end;*}

//00730ECC
procedure sub_00730ECC;
begin
{*
 00730ECC    push        ebp
 00730ECD    mov         ebp,esp
 00730ECF    xor         ecx,ecx
 00730ED1    push        ecx
 00730ED2    push        ecx
 00730ED3    push        ecx
 00730ED4    push        ecx
 00730ED5    push        ecx
 00730ED6    push        ecx
 00730ED7    push        ecx
 00730ED8    xor         eax,eax
 00730EDA    push        ebp
 00730EDB    push        731114
 00730EE0    push        dword ptr fs:[eax]
 00730EE3    mov         dword ptr fs:[eax],esp
 00730EE6    mov         ecx,20019
 00730EEB    mov         dl,1
 00730EED    mov         eax,[0045C080];TRegistry
 00730EF2    call        TRegistry.Create;TRegistry.Create
 00730EF7    mov         dword ptr [ebp-4],eax
 00730EFA    xor         eax,eax
 00730EFC    push        ebp
 00730EFD    push        7310F2
 00730F02    push        dword ptr fs:[eax]
 00730F05    mov         dword ptr fs:[eax],esp
 00730F08    mov         edx,80000001
 00730F0D    mov         eax,dword ptr [ebp-4]
 00730F10    call        TRegistry.SetRootKey
 00730F15    mov         edx,73112C;'\Software\eSpeaking\eSpeaking\Settings'
 00730F1A    mov         eax,dword ptr [ebp-4]
 00730F1D    call        TRegistry.OpenKeyReadOnly
 00730F22    test        al,al
>00730F24    je          0073109C
 00730F2A    mov         edx,731188;^338:Single
 00730F2F    mov         eax,dword ptr [ebp-4]
 00730F32    call        TRegistry.ValueExists
 00730F37    test        al,al
>00730F39    je          00730F5A
 00730F3B    lea         ecx,[ebp-8]
 00730F3E    mov         edx,731188;^338:Single
 00730F43    mov         eax,dword ptr [ebp-4]
 00730F46    call        TRegistry.ReadString
 00730F4B    mov         edx,dword ptr [ebp-8]
 00730F4E    mov         eax,822A1C;gvar_00822A1C:UnicodeString
 00730F53    call        @UStrAsg
>00730F58    jmp         00730F64
 00730F5A    mov         eax,822A1C;gvar_00822A1C:UnicodeString
 00730F5F    call        @UStrClr
 00730F64    mov         edx,7311B8;'StopDictationCommand'
 00730F69    mov         eax,dword ptr [ebp-4]
 00730F6C    call        TRegistry.ValueExists
 00730F71    test        al,al
>00730F73    je          00730F94
 00730F75    lea         ecx,[ebp-0C]
 00730F78    mov         edx,7311B8;'StopDictationCommand'
 00730F7D    mov         eax,dword ptr [ebp-4]
 00730F80    call        TRegistry.ReadString
 00730F85    mov         edx,dword ptr [ebp-0C]
 00730F88    mov         eax,822A20;gvar_00822A20:UnicodeString
 00730F8D    call        @UStrAsg
>00730F92    jmp         00730F9E
 00730F94    mov         eax,822A20;gvar_00822A20:UnicodeString
 00730F99    call        @UStrClr
 00730F9E    mov         edx,7311F0;'DoneDictatingSay'
 00730FA3    mov         eax,dword ptr [ebp-4]
 00730FA6    call        TRegistry.ValueExists
 00730FAB    test        al,al
>00730FAD    je          00730FCE
 00730FAF    lea         ecx,[ebp-10]
 00730FB2    mov         edx,7311F0;'DoneDictatingSay'
 00730FB7    mov         eax,dword ptr [ebp-4]
 00730FBA    call        TRegistry.ReadString
 00730FBF    mov         edx,dword ptr [ebp-10]
 00730FC2    mov         eax,822A24;gvar_00822A24:UnicodeString
 00730FC7    call        @UStrAsg
>00730FCC    jmp         00730FD8
 00730FCE    mov         eax,822A24;gvar_00822A24:UnicodeString
 00730FD3    call        @UStrClr
 00730FD8    mov         edx,731220;'AttentionCommand'
 00730FDD    mov         eax,dword ptr [ebp-4]
 00730FE0    call        TRegistry.ValueExists
 00730FE5    test        al,al
>00730FE7    je          00731008
 00730FE9    lea         ecx,[ebp-14]
 00730FEC    mov         edx,731220;'AttentionCommand'
 00730FF1    mov         eax,dword ptr [ebp-4]
 00730FF4    call        TRegistry.ReadString
 00730FF9    mov         edx,dword ptr [ebp-14]
 00730FFC    mov         eax,822A28;gvar_00822A28:UnicodeString
 00731001    call        @UStrAsg
>00731006    jmp         00731012
 00731008    mov         eax,822A28;gvar_00822A28:UnicodeString
 0073100D    call        @UStrClr
 00731012    mov         edx,731250;'AttentionResponse'
 00731017    mov         eax,dword ptr [ebp-4]
 0073101A    call        TRegistry.ValueExists
 0073101F    test        al,al
>00731021    je          00731042
 00731023    lea         ecx,[ebp-18]
 00731026    mov         edx,731250;'AttentionResponse'
 0073102B    mov         eax,dword ptr [ebp-4]
 0073102E    call        TRegistry.ReadString
 00731033    mov         edx,dword ptr [ebp-18]
 00731036    mov         eax,822A2C;gvar_00822A2C:UnicodeString
 0073103B    call        @UStrAsg
>00731040    jmp         0073104C
 00731042    mov         eax,822A2C;gvar_00822A2C:UnicodeString
 00731047    call        @UStrClr
 0073104C    mov         edx,731280;'AttentionSpan'
 00731051    mov         eax,dword ptr [ebp-4]
 00731054    call        TRegistry.ValueExists
 00731059    test        al,al
>0073105B    je          00731084
 0073105D    push        0
 0073105F    push        0
 00731061    push        0
 00731063    lea         ecx,[ebp-1C]
 00731066    mov         edx,731280;'AttentionSpan'
 0073106B    mov         eax,dword ptr [ebp-4]
 0073106E    call        TRegistry.ReadString
 00731073    mov         eax,dword ptr [ebp-1C]
 00731076    call        004F8DB8
 0073107B    fstp        qword ptr ds:[822A30];gvar_00822A30:Double
 00731081    wait
>00731082    jmp         00731092
 00731084    xor         eax,eax
 00731086    mov         dword ptr ds:[822A30],eax;gvar_00822A30:Double
 0073108C    mov         dword ptr ds:[822A34],eax;gvar_00822A34
 00731092    mov         eax,dword ptr [ebp-4]
 00731095    call        TRegistry.CloseKey
>0073109A    jmp         007310DC
 0073109C    mov         eax,822A1C;gvar_00822A1C:UnicodeString
 007310A1    call        @UStrClr
 007310A6    mov         eax,822A20;gvar_00822A20:UnicodeString
 007310AB    call        @UStrClr
 007310B0    mov         eax,822A24;gvar_00822A24:UnicodeString
 007310B5    call        @UStrClr
 007310BA    mov         eax,822A28;gvar_00822A28:UnicodeString
 007310BF    call        @UStrClr
 007310C4    mov         eax,822A2C;gvar_00822A2C:UnicodeString
 007310C9    call        @UStrClr
 007310CE    xor         eax,eax
 007310D0    mov         dword ptr ds:[822A30],eax;gvar_00822A30:Double
 007310D6    mov         dword ptr ds:[822A34],eax;gvar_00822A34
 007310DC    xor         eax,eax
 007310DE    pop         edx
 007310DF    pop         ecx
 007310E0    pop         ecx
 007310E1    mov         dword ptr fs:[eax],edx
 007310E4    push        7310F9
 007310E9    mov         eax,dword ptr [ebp-4]
 007310EC    call        TObject.Free
 007310F1    ret
>007310F2    jmp         @HandleFinally
>007310F7    jmp         007310E9
 007310F9    xor         eax,eax
 007310FB    pop         edx
 007310FC    pop         ecx
 007310FD    pop         ecx
 007310FE    mov         dword ptr fs:[eax],edx
 00731101    push        73111B
 00731106    lea         eax,[ebp-1C]
 00731109    mov         edx,6
 0073110E    call        @UStrArrayClr
 00731113    ret
>00731114    jmp         @HandleFinally
>00731119    jmp         00731106
 0073111B    mov         esp,ebp
 0073111D    pop         ebp
 0073111E    ret
*}
end;

//0073129C
procedure sub_0073129C(?:IInterface);
begin
{*
 0073129C    push        ebp
 0073129D    mov         ebp,esp
 0073129F    mov         ecx,4
 007312A4    push        0
 007312A6    push        0
 007312A8    dec         ecx
>007312A9    jne         007312A4
 007312AB    push        ecx
 007312AC    push        ebx
 007312AD    push        esi
 007312AE    push        edi
 007312AF    mov         dword ptr [ebp-4],eax
 007312B2    mov         eax,dword ptr [ebp-4]
 007312B5    call        @IntfAddRef
 007312BA    xor         eax,eax
 007312BC    push        ebp
 007312BD    push        7314E1
 007312C2    push        dword ptr fs:[eax]
 007312C5    mov         dword ptr fs:[eax],esp
 007312C8    xor         eax,eax
 007312CA    push        ebp
 007312CB    push        7312E5
 007312D0    push        dword ptr fs:[eax]
 007312D3    mov         dword ptr fs:[eax],esp
 007312D6    call        00730ECC
 007312DB    xor         eax,eax
 007312DD    pop         edx
 007312DE    pop         ecx
 007312DF    pop         ecx
 007312E0    mov         dword ptr fs:[eax],edx
>007312E3    jmp         007312EF
>007312E5    jmp         @HandleAnyException
 007312EA    call        @DoneExcept
 007312EF    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 007312F4    mov         eax,dword ptr [eax]
 007312F6    mov         eax,dword ptr [eax+394]
 007312FC    mov         eax,dword ptr [eax+2A4]
 00731302    mov         ecx,7314FC;'// Imported from e-Speaking, or SAPI'
 00731307    mov         edx,1
 0073130C    mov         ebx,dword ptr [eax]
 0073130E    call        dword ptr [ebx+20]
 00731311    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00731316    mov         eax,dword ptr [eax]
 00731318    mov         eax,dword ptr [eax+394]
 0073131E    mov         eax,dword ptr [eax+2A4]
 00731324    mov         edx,731554;'if not var.initialized then'
 00731329    mov         ecx,dword ptr [eax]
 0073132B    call        dword ptr [ecx+38]
 0073132E    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00731333    mov         eax,dword ptr [eax]
 00731335    mov         eax,dword ptr [eax+394]
 0073133B    mov         eax,dword ptr [eax+2A4]
 00731341    mov         edx,731598;'  var.Awake = true'
 00731346    mov         ecx,dword ptr [eax]
 00731348    call        dword ptr [ecx+38]
 0073134B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00731350    mov         eax,dword ptr [eax]
 00731352    mov         eax,dword ptr [eax+394]
 00731358    mov         eax,dword ptr [eax+2A4]
 0073135E    mov         edx,7315CC;'  var.initialized = true'
 00731363    mov         ecx,dword ptr [eax]
 00731365    call        dword ptr [ecx+38]
 00731368    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073136D    mov         eax,dword ptr [eax]
 0073136F    mov         eax,dword ptr [eax+394]
 00731375    mov         eax,dword ptr [eax+2A4]
 0073137B    mov         edx,73160C;'endif'
 00731380    mov         ecx,dword ptr [eax]
 00731382    call        dword ptr [ecx+38]
 00731385    lea         edx,[ebp-0C]
 00731388    mov         eax,dword ptr [ebp-4]
 0073138B    mov         ecx,dword ptr [eax]
 0073138D    call        dword ptr [ecx+14]
 00731390    mov         eax,dword ptr [ebp-0C]
 00731393    lea         edx,[ebp-8]
 00731396    mov         ecx,dword ptr [eax]
 00731398    call        dword ptr [ecx+34]
 0073139B    cmp         dword ptr [ebp-8],0
>0073139F    je          007314A3
 007313A5    xor         eax,eax
 007313A7    push        ebp
 007313A8    push        731476
 007313AD    push        dword ptr fs:[eax]
 007313B0    mov         dword ptr fs:[eax],esp
 007313B3    mov         eax,dword ptr [ebp-8]
 007313B6    mov         edx,dword ptr [eax]
 007313B8    call        dword ptr [edx+38]
 007313BB    cmp         al,8
>007313BD    jne         0073140E
 007313BF    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 007313C4    mov         eax,dword ptr [eax]
 007313C6    mov         eax,dword ptr [eax+394]
 007313CC    mov         eax,dword ptr [eax+2A4]
 007313D2    mov         edx,731624;'/**'
 007313D7    mov         ecx,dword ptr [eax]
 007313D9    call        dword ptr [ecx+38]
 007313DC    lea         edx,[ebp-10]
 007313DF    mov         eax,dword ptr [ebp-8]
 007313E2    mov         ecx,dword ptr [eax]
 007313E4    call        dword ptr [ecx+50]
 007313E7    mov         eax,dword ptr [ebp-10]
 007313EA    call        0072A620
 007313EF    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 007313F4    mov         eax,dword ptr [eax]
 007313F6    mov         eax,dword ptr [eax+394]
 007313FC    mov         eax,dword ptr [eax+2A4]
 00731402    mov         edx,731638;'**/'
 00731407    mov         ecx,dword ptr [eax]
 00731409    call        dword ptr [ecx+38]
>0073140C    jmp         0073146C
 0073140E    mov         eax,dword ptr [ebp-8]
 00731411    mov         edx,dword ptr [eax]
 00731413    call        dword ptr [edx+38]
 00731416    cmp         al,1
>00731418    jne         0073146C
 0073141A    lea         edx,[ebp-18]
 0073141D    mov         eax,dword ptr [ebp-8]
 00731420    mov         ecx,dword ptr [eax]
 00731422    call        dword ptr [ecx+34]
 00731425    mov         eax,dword ptr [ebp-18]
 00731428    lea         edx,[ebp-14]
 0073142B    call        LowerCase
 00731430    mov         eax,dword ptr [ebp-14]
 00731433    mov         edx,73164C;'define'
 00731438    call        @UStrEqual
>0073143D    je          0073146C
 0073143F    lea         edx,[ebp-20]
 00731442    mov         eax,dword ptr [ebp-8]
 00731445    mov         ecx,dword ptr [eax]
 00731447    call        dword ptr [ecx+34]
 0073144A    mov         eax,dword ptr [ebp-20]
 0073144D    lea         edx,[ebp-1C]
 00731450    call        LowerCase
 00731455    mov         eax,dword ptr [ebp-1C]
 00731458    mov         edx,731668;'rule'
 0073145D    call        @UStrEqual
>00731462    jne         0073146C
 00731464    mov         eax,dword ptr [ebp-8]
 00731467    call        0072F678
 0073146C    xor         eax,eax
 0073146E    pop         edx
 0073146F    pop         ecx
 00731470    pop         ecx
 00731471    mov         dword ptr fs:[eax],edx
>00731474    jmp         00731480
>00731476    jmp         @HandleAnyException
 0073147B    call        @DoneExcept
 00731480    lea         edx,[ebp-24]
 00731483    mov         eax,dword ptr [ebp-8]
 00731486    mov         ecx,dword ptr [eax]
 00731488    call        dword ptr [ecx+90]
 0073148E    mov         edx,dword ptr [ebp-24]
 00731491    lea         eax,[ebp-8]
 00731494    call        @IntfCopy
 00731499    cmp         dword ptr [ebp-8],0
>0073149D    jne         007313A5
 007314A3    xor         eax,eax
 007314A5    pop         edx
 007314A6    pop         ecx
 007314A7    pop         ecx
 007314A8    mov         dword ptr fs:[eax],edx
 007314AB    push        7314E8
 007314B0    lea         eax,[ebp-24]
 007314B3    call        @IntfClear
 007314B8    lea         eax,[ebp-20]
 007314BB    mov         edx,5
 007314C0    call        @UStrArrayClr
 007314C5    lea         eax,[ebp-0C]
 007314C8    call        @IntfClear
 007314CD    lea         eax,[ebp-8]
 007314D0    mov         edx,dword ptr ds:[58A824];IXMLNode
 007314D6    mov         ecx,2
 007314DB    call        @FinalizeArray
 007314E0    ret
>007314E1    jmp         @HandleFinally
>007314E6    jmp         007314B0
 007314E8    pop         edi
 007314E9    pop         esi
 007314EA    pop         ebx
 007314EB    mov         esp,ebp
 007314ED    pop         ebp
 007314EE    ret
*}
end;

//00731674
{*procedure sub_00731674(?:?);
begin
 00731674    push        ebp
 00731675    mov         ebp,esp
 00731677    mov         ecx,7
 0073167C    push        0
 0073167E    push        0
 00731680    dec         ecx
>00731681    jne         0073167C
 00731683    push        ebx
 00731684    push        esi
 00731685    push        edi
 00731686    mov         dword ptr [ebp-4],eax
 00731689    mov         eax,dword ptr [ebp-4]
 0073168C    call        @IntfAddRef
 00731691    xor         eax,eax
 00731693    push        ebp
 00731694    push        731874
 00731699    push        dword ptr fs:[eax]
 0073169C    mov         dword ptr fs:[eax],esp
 0073169F    lea         eax,[ebp-8]
 007316A2    mov         edx,dword ptr [ebp-4]
 007316A5    call        @IntfCopy
 007316AA    cmp         dword ptr [ebp-8],0
>007316AE    je          0073183E
 007316B4    xor         eax,eax
 007316B6    push        ebp
 007316B7    push        731811
 007316BC    push        dword ptr fs:[eax]
 007316BF    mov         dword ptr fs:[eax],esp
 007316C2    mov         eax,dword ptr [ebp-8]
 007316C5    mov         edx,dword ptr [eax]
 007316C7    call        dword ptr [edx+38]
 007316CA    cmp         al,8
>007316CC    jne         0073173A
 007316CE    lea         edx,[ebp-0C]
 007316D1    mov         eax,dword ptr [ebp-8]
 007316D4    mov         ecx,dword ptr [eax]
 007316D6    call        dword ptr [ecx+50]
 007316D9    mov         edx,dword ptr [ebp-0C]
 007316DC    mov         eax,731890;'grammar tag surrounds the entire'
 007316E1    call        Pos
 007316E6    test        eax,eax
>007316E8    jg          00731807
 007316EE    push        7318E0;'/* '
 007316F3    lea         edx,[ebp-14]
 007316F6    mov         eax,dword ptr [ebp-8]
 007316F9    mov         ecx,dword ptr [eax]
 007316FB    call        dword ptr [ecx+50]
 007316FE    push        dword ptr [ebp-14]
 00731701    push        7318F4;' */'
 00731706    lea         eax,[ebp-10]
 00731709    mov         edx,3
 0073170E    call        @UStrCatN
 00731713    mov         eax,dword ptr [ebp-10]
 00731716    call        0072A620
 0073171B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00731720    mov         eax,dword ptr [eax]
 00731722    mov         eax,dword ptr [eax+394]
 00731728    mov         eax,dword ptr [eax+2A4]
 0073172E    xor         edx,edx
 00731730    mov         ecx,dword ptr [eax]
 00731732    call        dword ptr [ecx+38]
>00731735    jmp         00731807
 0073173A    mov         eax,dword ptr [ebp-8]
 0073173D    mov         edx,dword ptr [eax]
 0073173F    call        dword ptr [edx+38]
 00731742    cmp         al,1
>00731744    jne         00731807
 0073174A    lea         edx,[ebp-1C]
 0073174D    mov         eax,dword ptr [ebp-8]
 00731750    mov         ecx,dword ptr [eax]
 00731752    call        dword ptr [ecx+34]
 00731755    mov         eax,dword ptr [ebp-1C]
 00731758    lea         edx,[ebp-18]
 0073175B    call        LowerCase
 00731760    mov         eax,dword ptr [ebp-18]
 00731763    mov         edx,731908;'shoot-config'
 00731768    call        @UStrEqual
>0073176D    jne         0073177C
 0073176F    mov         eax,dword ptr [ebp-8]
 00731772    call        0072C138
>00731777    jmp         00731807
 0073177C    lea         edx,[ebp-24]
 0073177F    mov         eax,dword ptr [ebp-8]
 00731782    mov         ecx,dword ptr [eax]
 00731784    call        dword ptr [ecx+34]
 00731787    mov         eax,dword ptr [ebp-24]
 0073178A    lea         edx,[ebp-20]
 0073178D    call        LowerCase
 00731792    mov         eax,dword ptr [ebp-20]
 00731795    mov         edx,731930;'profile'
 0073179A    call        @UStrEqual
>0073179F    jne         007317AB
 007317A1    mov         eax,dword ptr [ebp-8]
 007317A4    call        0072E738
>007317A9    jmp         00731807
 007317AB    lea         edx,[ebp-2C]
 007317AE    mov         eax,dword ptr [ebp-8]
 007317B1    mov         ecx,dword ptr [eax]
 007317B3    call        dword ptr [ecx+34]
 007317B6    mov         eax,dword ptr [ebp-2C]
 007317B9    lea         edx,[ebp-28]
 007317BC    call        LowerCase
 007317C1    mov         eax,dword ptr [ebp-28]
 007317C4    mov         edx,73194C;'grammar'
 007317C9    call        @UStrEqual
>007317CE    jne         007317DA
 007317D0    mov         eax,dword ptr [ebp-8]
 007317D3    call        0073129C
>007317D8    jmp         00731807
 007317DA    lea         edx,[ebp-34]
 007317DD    mov         eax,dword ptr [ebp-8]
 007317E0    mov         ecx,dword ptr [eax]
 007317E2    call        dword ptr [ecx+34]
 007317E5    mov         eax,dword ptr [ebp-34]
 007317E8    lea         edx,[ebp-30]
 007317EB    call        LowerCase
 007317F0    mov         eax,dword ptr [ebp-30]
 007317F3    mov         edx,731968;'emomappingmodel'
 007317F8    call        @UStrEqual
>007317FD    jne         00731807
 007317FF    mov         eax,dword ptr [ebp-8]
 00731802    call        0072F120
 00731807    xor         eax,eax
 00731809    pop         edx
 0073180A    pop         ecx
 0073180B    pop         ecx
 0073180C    mov         dword ptr fs:[eax],edx
>0073180F    jmp         0073181B
>00731811    jmp         @HandleAnyException
 00731816    call        @DoneExcept
 0073181B    lea         edx,[ebp-38]
 0073181E    mov         eax,dword ptr [ebp-8]
 00731821    mov         ecx,dword ptr [eax]
 00731823    call        dword ptr [ecx+90]
 00731829    mov         edx,dword ptr [ebp-38]
 0073182C    lea         eax,[ebp-8]
 0073182F    call        @IntfCopy
 00731834    cmp         dword ptr [ebp-8],0
>00731838    jne         007316B4
 0073183E    xor         eax,eax
 00731840    pop         edx
 00731841    pop         ecx
 00731842    pop         ecx
 00731843    mov         dword ptr fs:[eax],edx
 00731846    push        73187B
 0073184B    lea         eax,[ebp-38]
 0073184E    call        @IntfClear
 00731853    lea         eax,[ebp-34]
 00731856    mov         edx,0B
 0073185B    call        @UStrArrayClr
 00731860    lea         eax,[ebp-8]
 00731863    mov         edx,dword ptr ds:[58A824];IXMLNode
 00731869    mov         ecx,2
 0073186E    call        @FinalizeArray
 00731873    ret
>00731874    jmp         @HandleFinally
>00731879    jmp         0073184B
 0073187B    pop         edi
 0073187C    pop         esi
 0073187D    pop         ebx
 0073187E    mov         esp,ebp
 00731880    pop         ebp
 00731881    ret
end;*}

//00731988
procedure sub_00731988(?:UnicodeString);
begin
{*
 00731988    push        ebp
 00731989    mov         ebp,esp
 0073198B    xor         ecx,ecx
 0073198D    push        ecx
 0073198E    push        ecx
 0073198F    push        ecx
 00731990    push        ecx
 00731991    push        ecx
 00731992    push        ecx
 00731993    push        ebx
 00731994    push        esi
 00731995    mov         dword ptr [ebp-4],eax
 00731998    mov         eax,dword ptr [ebp-4]
 0073199B    call        @UStrAddRef
 007319A0    mov         ebx,dword ptr ds:[78D61C];^gvar_00822CA0:TEditorForm
 007319A6    xor         eax,eax
 007319A8    push        ebp
 007319A9    push        731AAB
 007319AE    push        dword ptr fs:[eax]
 007319B1    mov         dword ptr fs:[eax],esp
 007319B4    mov         eax,dword ptr [ebx]
 007319B6    mov         eax,dword ptr [eax+478]
 007319BC    mov         edx,dword ptr [ebp-4]
 007319BF    call        TXMLDocument.SetFileName
 007319C4    mov         eax,dword ptr [ebx]
 007319C6    mov         eax,dword ptr [eax+478]
 007319CC    mov         dl,1
 007319CE    mov         ecx,dword ptr [eax]
 007319D0    call        dword ptr [ecx+38]
 007319D3    lea         edx,[ebp-0C]
 007319D6    mov         eax,dword ptr [ebx]
 007319D8    mov         eax,dword ptr [eax+478]
 007319DE    call        TXMLDocument.GetChildNodes
 007319E3    mov         eax,dword ptr [ebp-0C]
 007319E6    lea         edx,[ebp-8]
 007319E9    mov         ecx,dword ptr [eax]
 007319EB    call        dword ptr [ecx+34]
 007319EE    mov         eax,dword ptr [ebx]
 007319F0    mov         eax,dword ptr [eax+394]
 007319F6    mov         eax,dword ptr [eax+2A4]
 007319FC    mov         edx,dword ptr [eax]
 007319FE    call        dword ptr [edx+44]
 00731A01    lea         edx,[ebp-18]
 00731A04    mov         eax,dword ptr [ebx]
 00731A06    mov         eax,dword ptr [eax+478]
 00731A0C    call        TXMLDocument.GetFileName
 00731A11    mov         eax,dword ptr [ebp-18]
 00731A14    lea         edx,[ebp-14]
 00731A17    call        ExtractFileName
 00731A1C    mov         ecx,dword ptr [ebp-14]
 00731A1F    lea         eax,[ebp-10]
 00731A22    mov         edx,731AC4;'// '
 00731A27    call        @UStrCat3
 00731A2C    mov         ecx,dword ptr [ebp-10]
 00731A2F    mov         eax,dword ptr [ebx]
 00731A31    mov         eax,dword ptr [eax+394]
 00731A37    mov         eax,dword ptr [eax+2A4]
 00731A3D    xor         edx,edx
 00731A3F    mov         esi,dword ptr [eax]
 00731A41    call        dword ptr [esi+60]
 00731A44    mov         eax,dword ptr [ebx]
 00731A46    mov         eax,dword ptr [eax+394]
 00731A4C    mov         eax,dword ptr [eax+2A4]
 00731A52    mov         ecx,731AD8;'// Imported from Shoot!'
 00731A57    mov         edx,1
 00731A5C    mov         esi,dword ptr [eax]
 00731A5E    call        dword ptr [esi+60]
 00731A61    mov         eax,dword ptr [ebp-8]
 00731A64    call        00731674
 00731A69    mov         eax,dword ptr [ebx]
 00731A6B    mov         eax,dword ptr [eax+478]
 00731A71    xor         edx,edx
 00731A73    mov         ecx,dword ptr [eax]
 00731A75    call        dword ptr [ecx+38]
 00731A78    xor         eax,eax
 00731A7A    pop         edx
 00731A7B    pop         ecx
 00731A7C    pop         ecx
 00731A7D    mov         dword ptr fs:[eax],edx
 00731A80    push        731AB2
 00731A85    lea         eax,[ebp-18]
 00731A88    mov         edx,3
 00731A8D    call        @UStrArrayClr
 00731A92    lea         eax,[ebp-0C]
 00731A95    call        @IntfClear
 00731A9A    lea         eax,[ebp-8]
 00731A9D    call        @IntfClear
 00731AA2    lea         eax,[ebp-4]
 00731AA5    call        @UStrClr
 00731AAA    ret
>00731AAB    jmp         @HandleFinally
>00731AB0    jmp         00731A85
 00731AB2    pop         esi
 00731AB3    pop         ebx
 00731AB4    mov         esp,ebp
 00731AB6    pop         ebp
 00731AB7    ret
*}
end;

//00731B08
{*procedure sub_00731B08(?:?; ?:?; ?:?);
begin
 00731B08    push        ebp
 00731B09    mov         ebp,esp
 00731B0B    push        ecx
 00731B0C    mov         ecx,1B
 00731B11    push        0
 00731B13    push        0
 00731B15    dec         ecx
>00731B16    jne         00731B11
 00731B18    push        ecx
 00731B19    xchg        ecx,dword ptr [ebp-4]
 00731B1C    push        ebx
 00731B1D    push        esi
 00731B1E    push        edi
 00731B1F    mov         esi,ecx
 00731B21    mov         dword ptr [ebp-8],edx
 00731B24    mov         dword ptr [ebp-4],eax
 00731B27    mov         eax,dword ptr [ebp-4]
 00731B2A    call        @UStrAddRef
 00731B2F    mov         eax,dword ptr [ebp-8]
 00731B32    call        @UStrAddRef
 00731B37    xor         eax,eax
 00731B39    push        ebp
 00731B3A    push        73279F
 00731B3F    push        dword ptr fs:[eax]
 00731B42    mov         dword ptr fs:[eax],esp
 00731B45    lea         edx,[ebp-10]
 00731B48    mov         eax,dword ptr [ebp-4]
 00731B4B    call        Trim
 00731B50    mov         eax,dword ptr [ebp-10]
 00731B53    lea         edx,[ebp-0C]
 00731B56    call        LowerCase
 00731B5B    mov         edx,dword ptr [ebp-0C]
 00731B5E    lea         eax,[ebp-4]
 00731B61    call        @UStrLAsg
 00731B66    lea         edx,[ebp-18]
 00731B69    mov         eax,dword ptr [ebp-8]
 00731B6C    call        Trim
 00731B71    mov         eax,dword ptr [ebp-18]
 00731B74    lea         edx,[ebp-14]
 00731B77    call        LowerCase
 00731B7C    mov         edx,dword ptr [ebp-14]
 00731B7F    lea         eax,[ebp-8]
 00731B82    call        @UStrLAsg
 00731B87    mov         eax,dword ptr [ebp-4]
 00731B8A    mov         edx,7327BC;'keys'
 00731B8F    call        @UStrEqual
>00731B94    jne         00732601
 00731B9A    mov         edx,dword ptr [ebp-8]
 00731B9D    mov         eax,7327D4;' lock'
 00731BA2    call        Pos
 00731BA7    mov         ebx,eax
 00731BA9    test        ebx,ebx
>00731BAB    jle         00731BBC
 00731BAD    lea         eax,[ebp-8]
 00731BB0    mov         ecx,1
 00731BB5    mov         edx,ebx
 00731BB7    call        @UStrDelete
 00731BBC    mov         edx,dword ptr [ebp-8]
 00731BBF    mov         eax,7327EC;'num +'
 00731BC4    call        Pos
 00731BC9    mov         ebx,eax
 00731BCB    test        ebx,ebx
>00731BCD    jle         00731C18
 00731BCF    mov         edi,dword ptr [ebp-8]
 00731BD2    test        edi,edi
>00731BD4    je          00731BDB
 00731BD6    sub         edi,4
 00731BD9    mov         edi,dword ptr [edi]
 00731BDB    lea         eax,[ebp-1C]
 00731BDE    push        eax
 00731BDF    mov         ecx,ebx
 00731BE1    dec         ecx
 00731BE2    mov         edx,1
 00731BE7    mov         eax,dword ptr [ebp-8]
 00731BEA    call        @UStrCopy
 00731BEF    push        dword ptr [ebp-1C]
 00731BF2    push        732804;'NumpadPlus'
 00731BF7    lea         eax,[ebp-20]
 00731BFA    push        eax
 00731BFB    lea         edx,[ebx+5]
 00731BFE    mov         ecx,edi
 00731C00    mov         eax,dword ptr [ebp-8]
 00731C03    call        @UStrCopy
 00731C08    push        dword ptr [ebp-20]
 00731C0B    lea         eax,[ebp-8]
 00731C0E    mov         edx,3
 00731C13    call        @UStrCatN
 00731C18    mov         edx,dword ptr [ebp-8]
 00731C1B    mov         eax,732828;'num -'
 00731C20    call        Pos
 00731C25    mov         ebx,eax
 00731C27    test        ebx,ebx
>00731C29    jle         00731C74
 00731C2B    mov         edi,dword ptr [ebp-8]
 00731C2E    test        edi,edi
>00731C30    je          00731C37
 00731C32    sub         edi,4
 00731C35    mov         edi,dword ptr [edi]
 00731C37    lea         eax,[ebp-24]
 00731C3A    push        eax
 00731C3B    mov         ecx,ebx
 00731C3D    dec         ecx
 00731C3E    mov         edx,1
 00731C43    mov         eax,dword ptr [ebp-8]
 00731C46    call        @UStrCopy
 00731C4B    push        dword ptr [ebp-24]
 00731C4E    push        732840;'NumpadMinus'
 00731C53    lea         eax,[ebp-28]
 00731C56    push        eax
 00731C57    lea         edx,[ebx+5]
 00731C5A    mov         ecx,edi
 00731C5C    mov         eax,dword ptr [ebp-8]
 00731C5F    call        @UStrCopy
 00731C64    push        dword ptr [ebp-28]
 00731C67    lea         eax,[ebp-8]
 00731C6A    mov         edx,3
 00731C6F    call        @UStrCatN
 00731C74    mov         edx,dword ptr [ebp-8]
 00731C77    mov         eax,732864;'num *'
 00731C7C    call        Pos
 00731C81    mov         ebx,eax
 00731C83    test        ebx,ebx
>00731C85    jle         00731CD0
 00731C87    mov         edi,dword ptr [ebp-8]
 00731C8A    test        edi,edi
>00731C8C    je          00731C93
 00731C8E    sub         edi,4
 00731C91    mov         edi,dword ptr [edi]
 00731C93    lea         eax,[ebp-2C]
 00731C96    push        eax
 00731C97    mov         ecx,ebx
 00731C99    dec         ecx
 00731C9A    mov         edx,1
 00731C9F    mov         eax,dword ptr [ebp-8]
 00731CA2    call        @UStrCopy
 00731CA7    push        dword ptr [ebp-2C]
 00731CAA    push        73287C;'NumpadMultiply'
 00731CAF    lea         eax,[ebp-30]
 00731CB2    push        eax
 00731CB3    lea         edx,[ebx+5]
 00731CB6    mov         ecx,edi
 00731CB8    mov         eax,dword ptr [ebp-8]
 00731CBB    call        @UStrCopy
 00731CC0    push        dword ptr [ebp-30]
 00731CC3    lea         eax,[ebp-8]
 00731CC6    mov         edx,3
 00731CCB    call        @UStrCatN
 00731CD0    mov         edx,dword ptr [ebp-8]
 00731CD3    mov         eax,7328A8;'num /'
 00731CD8    call        Pos
 00731CDD    mov         ebx,eax
 00731CDF    test        ebx,ebx
>00731CE1    jle         00731D2C
 00731CE3    mov         edi,dword ptr [ebp-8]
 00731CE6    test        edi,edi
>00731CE8    je          00731CEF
 00731CEA    sub         edi,4
 00731CED    mov         edi,dword ptr [edi]
 00731CEF    lea         eax,[ebp-34]
 00731CF2    push        eax
 00731CF3    mov         ecx,ebx
 00731CF5    dec         ecx
 00731CF6    mov         edx,1
 00731CFB    mov         eax,dword ptr [ebp-8]
 00731CFE    call        @UStrCopy
 00731D03    push        dword ptr [ebp-34]
 00731D06    push        7328C0;'NumpadDivide'
 00731D0B    lea         eax,[ebp-38]
 00731D0E    push        eax
 00731D0F    lea         edx,[ebx+5]
 00731D12    mov         ecx,edi
 00731D14    mov         eax,dword ptr [ebp-8]
 00731D17    call        @UStrCopy
 00731D1C    push        dword ptr [ebp-38]
 00731D1F    lea         eax,[ebp-8]
 00731D22    mov         edx,3
 00731D27    call        @UStrCatN
 00731D2C    mov         edx,dword ptr [ebp-8]
 00731D2F    mov         eax,7328E8;','
 00731D34    call        Pos
 00731D39    mov         ebx,eax
 00731D3B    test        ebx,ebx
>00731D3D    jle         00731D88
 00731D3F    mov         edi,dword ptr [ebp-8]
 00731D42    test        edi,edi
>00731D44    je          00731D4B
 00731D46    sub         edi,4
 00731D49    mov         edi,dword ptr [edi]
 00731D4B    lea         eax,[ebp-3C]
 00731D4E    push        eax
 00731D4F    mov         ecx,ebx
 00731D51    dec         ecx
 00731D52    mov         edx,1
 00731D57    mov         eax,dword ptr [ebp-8]
 00731D5A    call        @UStrCopy
 00731D5F    push        dword ptr [ebp-3C]
 00731D62    push        7328F8;'Comma'
 00731D67    lea         eax,[ebp-40]
 00731D6A    push        eax
 00731D6B    lea         edx,[ebx+1]
 00731D6E    mov         ecx,edi
 00731D70    mov         eax,dword ptr [ebp-8]
 00731D73    call        @UStrCopy
 00731D78    push        dword ptr [ebp-40]
 00731D7B    lea         eax,[ebp-8]
 00731D7E    mov         edx,3
 00731D83    call        @UStrCatN
 00731D88    mov         edx,dword ptr [ebp-8]
 00731D8B    mov         eax,732910;'.'
 00731D90    call        Pos
 00731D95    mov         ebx,eax
 00731D97    test        ebx,ebx
>00731D99    jle         00731DE4
 00731D9B    mov         edi,dword ptr [ebp-8]
 00731D9E    test        edi,edi
>00731DA0    je          00731DA7
 00731DA2    sub         edi,4
 00731DA5    mov         edi,dword ptr [edi]
 00731DA7    lea         eax,[ebp-44]
 00731DAA    push        eax
 00731DAB    mov         ecx,ebx
 00731DAD    dec         ecx
 00731DAE    mov         edx,1
 00731DB3    mov         eax,dword ptr [ebp-8]
 00731DB6    call        @UStrCopy
 00731DBB    push        dword ptr [ebp-44]
 00731DBE    push        732920;'Dot'
 00731DC3    lea         eax,[ebp-48]
 00731DC6    push        eax
 00731DC7    lea         edx,[ebx+1]
 00731DCA    mov         ecx,edi
 00731DCC    mov         eax,dword ptr [ebp-8]
 00731DCF    call        @UStrCopy
 00731DD4    push        dword ptr [ebp-48]
 00731DD7    lea         eax,[ebp-8]
 00731DDA    mov         edx,3
 00731DDF    call        @UStrCatN
 00731DE4    mov         edx,dword ptr [ebp-8]
 00731DE7    mov         eax,732934;'/'
 00731DEC    call        Pos
 00731DF1    mov         ebx,eax
 00731DF3    test        ebx,ebx
>00731DF5    jle         00731E40
 00731DF7    mov         edi,dword ptr [ebp-8]
 00731DFA    test        edi,edi
>00731DFC    je          00731E03
 00731DFE    sub         edi,4
 00731E01    mov         edi,dword ptr [edi]
 00731E03    lea         eax,[ebp-4C]
 00731E06    push        eax
 00731E07    mov         ecx,ebx
 00731E09    dec         ecx
 00731E0A    mov         edx,1
 00731E0F    mov         eax,dword ptr [ebp-8]
 00731E12    call        @UStrCopy
 00731E17    push        dword ptr [ebp-4C]
 00731E1A    push        732944;'Slash'
 00731E1F    lea         eax,[ebp-50]
 00731E22    push        eax
 00731E23    lea         edx,[ebx+1]
 00731E26    mov         ecx,edi
 00731E28    mov         eax,dword ptr [ebp-8]
 00731E2B    call        @UStrCopy
 00731E30    push        dword ptr [ebp-50]
 00731E33    lea         eax,[ebp-8]
 00731E36    mov         edx,3
 00731E3B    call        @UStrCatN
 00731E40    mov         edx,dword ptr [ebp-8]
 00731E43    mov         eax,73295C;';'
 00731E48    call        Pos
 00731E4D    mov         ebx,eax
 00731E4F    test        ebx,ebx
>00731E51    jle         00731E9C
 00731E53    mov         edi,dword ptr [ebp-8]
 00731E56    test        edi,edi
>00731E58    je          00731E5F
 00731E5A    sub         edi,4
 00731E5D    mov         edi,dword ptr [edi]
 00731E5F    lea         eax,[ebp-54]
 00731E62    push        eax
 00731E63    mov         ecx,ebx
 00731E65    dec         ecx
 00731E66    mov         edx,1
 00731E6B    mov         eax,dword ptr [ebp-8]
 00731E6E    call        @UStrCopy
 00731E73    push        dword ptr [ebp-54]
 00731E76    push        73296C;'Semicolon'
 00731E7B    lea         eax,[ebp-58]
 00731E7E    push        eax
 00731E7F    lea         edx,[ebx+1]
 00731E82    mov         ecx,edi
 00731E84    mov         eax,dword ptr [ebp-8]
 00731E87    call        @UStrCopy
 00731E8C    push        dword ptr [ebp-58]
 00731E8F    lea         eax,[ebp-8]
 00731E92    mov         edx,3
 00731E97    call        @UStrCatN
 00731E9C    mov         edx,dword ptr [ebp-8]
 00731E9F    mov         eax,73298C;''''
 00731EA4    call        Pos
 00731EA9    mov         ebx,eax
 00731EAB    test        ebx,ebx
>00731EAD    jle         00731EF8
 00731EAF    mov         edi,dword ptr [ebp-8]
 00731EB2    test        edi,edi
>00731EB4    je          00731EBB
 00731EB6    sub         edi,4
 00731EB9    mov         edi,dword ptr [edi]
 00731EBB    lea         eax,[ebp-5C]
 00731EBE    push        eax
 00731EBF    mov         ecx,ebx
 00731EC1    dec         ecx
 00731EC2    mov         edx,1
 00731EC7    mov         eax,dword ptr [ebp-8]
 00731ECA    call        @UStrCopy
 00731ECF    push        dword ptr [ebp-5C]
 00731ED2    push        73299C;'Quote'
 00731ED7    lea         eax,[ebp-60]
 00731EDA    push        eax
 00731EDB    lea         edx,[ebx+1]
 00731EDE    mov         ecx,edi
 00731EE0    mov         eax,dword ptr [ebp-8]
 00731EE3    call        @UStrCopy
 00731EE8    push        dword ptr [ebp-60]
 00731EEB    lea         eax,[ebp-8]
 00731EEE    mov         edx,3
 00731EF3    call        @UStrCatN
 00731EF8    mov         edx,dword ptr [ebp-8]
 00731EFB    mov         eax,7329B4;'['
 00731F00    call        Pos
 00731F05    mov         ebx,eax
 00731F07    test        ebx,ebx
>00731F09    jle         00731F54
 00731F0B    mov         edi,dword ptr [ebp-8]
 00731F0E    test        edi,edi
>00731F10    je          00731F17
 00731F12    sub         edi,4
 00731F15    mov         edi,dword ptr [edi]
 00731F17    lea         eax,[ebp-64]
 00731F1A    push        eax
 00731F1B    mov         ecx,ebx
 00731F1D    dec         ecx
 00731F1E    mov         edx,1
 00731F23    mov         eax,dword ptr [ebp-8]
 00731F26    call        @UStrCopy
 00731F2B    push        dword ptr [ebp-64]
 00731F2E    push        7329C4;'LBracket'
 00731F33    lea         eax,[ebp-68]
 00731F36    push        eax
 00731F37    lea         edx,[ebx+1]
 00731F3A    mov         ecx,edi
 00731F3C    mov         eax,dword ptr [ebp-8]
 00731F3F    call        @UStrCopy
 00731F44    push        dword ptr [ebp-68]
 00731F47    lea         eax,[ebp-8]
 00731F4A    mov         edx,3
 00731F4F    call        @UStrCatN
 00731F54    mov         edx,dword ptr [ebp-8]
 00731F57    mov         eax,7329E4;']'
 00731F5C    call        Pos
 00731F61    mov         ebx,eax
 00731F63    test        ebx,ebx
>00731F65    jle         00731FB0
 00731F67    mov         edi,dword ptr [ebp-8]
 00731F6A    test        edi,edi
>00731F6C    je          00731F73
 00731F6E    sub         edi,4
 00731F71    mov         edi,dword ptr [edi]
 00731F73    lea         eax,[ebp-6C]
 00731F76    push        eax
 00731F77    mov         ecx,ebx
 00731F79    dec         ecx
 00731F7A    mov         edx,1
 00731F7F    mov         eax,dword ptr [ebp-8]
 00731F82    call        @UStrCopy
 00731F87    push        dword ptr [ebp-6C]
 00731F8A    push        7329F4;'RBracket'
 00731F8F    lea         eax,[ebp-70]
 00731F92    push        eax
 00731F93    lea         edx,[ebx+1]
 00731F96    mov         ecx,edi
 00731F98    mov         eax,dword ptr [ebp-8]
 00731F9B    call        @UStrCopy
 00731FA0    push        dword ptr [ebp-70]
 00731FA3    lea         eax,[ebp-8]
 00731FA6    mov         edx,3
 00731FAB    call        @UStrCatN
 00731FB0    mov         edx,dword ptr [ebp-8]
 00731FB3    mov         eax,732A14;'\'
 00731FB8    call        Pos
 00731FBD    mov         ebx,eax
 00731FBF    test        ebx,ebx
>00731FC1    jle         0073200C
 00731FC3    mov         edi,dword ptr [ebp-8]
 00731FC6    test        edi,edi
>00731FC8    je          00731FCF
 00731FCA    sub         edi,4
 00731FCD    mov         edi,dword ptr [edi]
 00731FCF    lea         eax,[ebp-74]
 00731FD2    push        eax
 00731FD3    mov         ecx,ebx
 00731FD5    dec         ecx
 00731FD6    mov         edx,1
 00731FDB    mov         eax,dword ptr [ebp-8]
 00731FDE    call        @UStrCopy
 00731FE3    push        dword ptr [ebp-74]
 00731FE6    push        732A24;'Backslash'
 00731FEB    lea         eax,[ebp-78]
 00731FEE    push        eax
 00731FEF    lea         edx,[ebx+1]
 00731FF2    mov         ecx,edi
 00731FF4    mov         eax,dword ptr [ebp-8]
 00731FF7    call        @UStrCopy
 00731FFC    push        dword ptr [ebp-78]
 00731FFF    lea         eax,[ebp-8]
 00732002    mov         edx,3
 00732007    call        @UStrCatN
 0073200C    mov         edx,dword ptr [ebp-8]
 0073200F    mov         eax,732A44;'`'
 00732014    call        Pos
 00732019    mov         ebx,eax
 0073201B    test        ebx,ebx
>0073201D    jle         00732068
 0073201F    mov         edi,dword ptr [ebp-8]
 00732022    test        edi,edi
>00732024    je          0073202B
 00732026    sub         edi,4
 00732029    mov         edi,dword ptr [edi]
 0073202B    lea         eax,[ebp-7C]
 0073202E    push        eax
 0073202F    mov         ecx,ebx
 00732031    dec         ecx
 00732032    mov         edx,1
 00732037    mov         eax,dword ptr [ebp-8]
 0073203A    call        @UStrCopy
 0073203F    push        dword ptr [ebp-7C]
 00732042    push        732A54;'Console'
 00732047    lea         eax,[ebp-80]
 0073204A    push        eax
 0073204B    lea         edx,[ebx+1]
 0073204E    mov         ecx,edi
 00732050    mov         eax,dword ptr [ebp-8]
 00732053    call        @UStrCopy
 00732058    push        dword ptr [ebp-80]
 0073205B    lea         eax,[ebp-8]
 0073205E    mov         edx,3
 00732063    call        @UStrCatN
 00732068    mov         edx,dword ptr [ebp-8]
 0073206B    mov         eax,732A70;'-'
 00732070    call        Pos
 00732075    mov         ebx,eax
 00732077    test        ebx,ebx
>00732079    jle         007320D0
 0073207B    mov         edi,dword ptr [ebp-8]
 0073207E    test        edi,edi
>00732080    je          00732087
 00732082    sub         edi,4
 00732085    mov         edi,dword ptr [edi]
 00732087    lea         eax,[ebp-84]
 0073208D    push        eax
 0073208E    mov         ecx,ebx
 00732090    dec         ecx
 00732091    mov         edx,1
 00732096    mov         eax,dword ptr [ebp-8]
 00732099    call        @UStrCopy
 0073209E    push        dword ptr [ebp-84]
 007320A4    push        732A80;'Minus'
 007320A9    lea         eax,[ebp-88]
 007320AF    push        eax
 007320B0    lea         edx,[ebx+1]
 007320B3    mov         ecx,edi
 007320B5    mov         eax,dword ptr [ebp-8]
 007320B8    call        @UStrCopy
 007320BD    push        dword ptr [ebp-88]
 007320C3    lea         eax,[ebp-8]
 007320C6    mov         edx,3
 007320CB    call        @UStrCatN
 007320D0    mov         edx,dword ptr [ebp-8]
 007320D3    mov         eax,732A98;'='
 007320D8    call        Pos
 007320DD    mov         ebx,eax
 007320DF    test        ebx,ebx
>007320E1    jle         00732138
 007320E3    mov         edi,dword ptr [ebp-8]
 007320E6    test        edi,edi
>007320E8    je          007320EF
 007320EA    sub         edi,4
 007320ED    mov         edi,dword ptr [edi]
 007320EF    lea         eax,[ebp-8C]
 007320F5    push        eax
 007320F6    mov         ecx,ebx
 007320F8    dec         ecx
 007320F9    mov         edx,1
 007320FE    mov         eax,dword ptr [ebp-8]
 00732101    call        @UStrCopy
 00732106    push        dword ptr [ebp-8C]
 0073210C    push        732AA8;'Equals'
 00732111    lea         eax,[ebp-90]
 00732117    push        eax
 00732118    lea         edx,[ebx+1]
 0073211B    mov         ecx,edi
 0073211D    mov         eax,dword ptr [ebp-8]
 00732120    call        @UStrCopy
 00732125    push        dword ptr [ebp-90]
 0073212B    lea         eax,[ebp-8]
 0073212E    mov         edx,3
 00732133    call        @UStrCatN
 00732138    mov         edx,dword ptr [ebp-8]
 0073213B    mov         eax,732AC4;'1'
 00732140    call        Pos
 00732145    mov         ebx,eax
 00732147    cmp         ebx,1
>0073214A    je          0073215C
 0073214C    cmp         ebx,1
>0073214F    jle         007321B1
 00732151    mov         eax,dword ptr [ebp-8]
 00732154    cmp         word ptr [eax+ebx*2-4],66
>0073215A    je          007321B1
 0073215C    mov         edi,dword ptr [ebp-8]
 0073215F    test        edi,edi
>00732161    je          00732168
 00732163    sub         edi,4
 00732166    mov         edi,dword ptr [edi]
 00732168    lea         eax,[ebp-94]
 0073216E    push        eax
 0073216F    mov         ecx,ebx
 00732171    dec         ecx
 00732172    mov         edx,1
 00732177    mov         eax,dword ptr [ebp-8]
 0073217A    call        @UStrCopy
 0073217F    push        dword ptr [ebp-94]
 00732185    push        732AD4;'One'
 0073218A    lea         eax,[ebp-98]
 00732190    push        eax
 00732191    lea         edx,[ebx+1]
 00732194    mov         ecx,edi
 00732196    mov         eax,dword ptr [ebp-8]
 00732199    call        @UStrCopy
 0073219E    push        dword ptr [ebp-98]
 007321A4    lea         eax,[ebp-8]
 007321A7    mov         edx,3
 007321AC    call        @UStrCatN
 007321B1    mov         edx,dword ptr [ebp-8]
 007321B4    mov         eax,732AE8;'2'
 007321B9    call        Pos
 007321BE    mov         ebx,eax
 007321C0    cmp         ebx,1
>007321C3    je          007321D5
 007321C5    cmp         ebx,1
>007321C8    jle         0073222A
 007321CA    mov         eax,dword ptr [ebp-8]
 007321CD    cmp         word ptr [eax+ebx*2-4],66
>007321D3    je          0073222A
 007321D5    mov         edi,dword ptr [ebp-8]
 007321D8    test        edi,edi
>007321DA    je          007321E1
 007321DC    sub         edi,4
 007321DF    mov         edi,dword ptr [edi]
 007321E1    lea         eax,[ebp-9C]
 007321E7    push        eax
 007321E8    mov         ecx,ebx
 007321EA    dec         ecx
 007321EB    mov         edx,1
 007321F0    mov         eax,dword ptr [ebp-8]
 007321F3    call        @UStrCopy
 007321F8    push        dword ptr [ebp-9C]
 007321FE    push        732AF8;'Two'
 00732203    lea         eax,[ebp-0A0]
 00732209    push        eax
 0073220A    lea         edx,[ebx+1]
 0073220D    mov         ecx,edi
 0073220F    mov         eax,dword ptr [ebp-8]
 00732212    call        @UStrCopy
 00732217    push        dword ptr [ebp-0A0]
 0073221D    lea         eax,[ebp-8]
 00732220    mov         edx,3
 00732225    call        @UStrCatN
 0073222A    mov         edx,dword ptr [ebp-8]
 0073222D    mov         eax,732B0C;'3'
 00732232    call        Pos
 00732237    mov         ebx,eax
 00732239    cmp         ebx,1
>0073223C    je          0073224E
 0073223E    cmp         ebx,1
>00732241    jle         007322A3
 00732243    mov         eax,dword ptr [ebp-8]
 00732246    cmp         word ptr [eax+ebx*2-4],66
>0073224C    je          007322A3
 0073224E    mov         edi,dword ptr [ebp-8]
 00732251    test        edi,edi
>00732253    je          0073225A
 00732255    sub         edi,4
 00732258    mov         edi,dword ptr [edi]
 0073225A    lea         eax,[ebp-0A4]
 00732260    push        eax
 00732261    mov         ecx,ebx
 00732263    dec         ecx
 00732264    mov         edx,1
 00732269    mov         eax,dword ptr [ebp-8]
 0073226C    call        @UStrCopy
 00732271    push        dword ptr [ebp-0A4]
 00732277    push        732B1C;'Three'
 0073227C    lea         eax,[ebp-0A8]
 00732282    push        eax
 00732283    lea         edx,[ebx+1]
 00732286    mov         ecx,edi
 00732288    mov         eax,dword ptr [ebp-8]
 0073228B    call        @UStrCopy
 00732290    push        dword ptr [ebp-0A8]
 00732296    lea         eax,[ebp-8]
 00732299    mov         edx,3
 0073229E    call        @UStrCatN
 007322A3    mov         edx,dword ptr [ebp-8]
 007322A6    mov         eax,732B34;'4'
 007322AB    call        Pos
 007322B0    mov         ebx,eax
 007322B2    cmp         ebx,1
>007322B5    je          007322C7
 007322B7    cmp         ebx,1
>007322BA    jle         0073231C
 007322BC    mov         eax,dword ptr [ebp-8]
 007322BF    cmp         word ptr [eax+ebx*2-4],66
>007322C5    je          0073231C
 007322C7    mov         edi,dword ptr [ebp-8]
 007322CA    test        edi,edi
>007322CC    je          007322D3
 007322CE    sub         edi,4
 007322D1    mov         edi,dword ptr [edi]
 007322D3    lea         eax,[ebp-0AC]
 007322D9    push        eax
 007322DA    mov         ecx,ebx
 007322DC    dec         ecx
 007322DD    mov         edx,1
 007322E2    mov         eax,dword ptr [ebp-8]
 007322E5    call        @UStrCopy
 007322EA    push        dword ptr [ebp-0AC]
 007322F0    push        732B44;'Four'
 007322F5    lea         eax,[ebp-0B0]
 007322FB    push        eax
 007322FC    lea         edx,[ebx+1]
 007322FF    mov         ecx,edi
 00732301    mov         eax,dword ptr [ebp-8]
 00732304    call        @UStrCopy
 00732309    push        dword ptr [ebp-0B0]
 0073230F    lea         eax,[ebp-8]
 00732312    mov         edx,3
 00732317    call        @UStrCatN
 0073231C    mov         edx,dword ptr [ebp-8]
 0073231F    mov         eax,732B5C;'5'
 00732324    call        Pos
 00732329    mov         ebx,eax
 0073232B    cmp         ebx,1
>0073232E    je          00732340
 00732330    cmp         ebx,1
>00732333    jle         00732395
 00732335    mov         eax,dword ptr [ebp-8]
 00732338    cmp         word ptr [eax+ebx*2-4],66
>0073233E    je          00732395
 00732340    mov         edi,dword ptr [ebp-8]
 00732343    test        edi,edi
>00732345    je          0073234C
 00732347    sub         edi,4
 0073234A    mov         edi,dword ptr [edi]
 0073234C    lea         eax,[ebp-0B4]
 00732352    push        eax
 00732353    mov         ecx,ebx
 00732355    dec         ecx
 00732356    mov         edx,1
 0073235B    mov         eax,dword ptr [ebp-8]
 0073235E    call        @UStrCopy
 00732363    push        dword ptr [ebp-0B4]
 00732369    push        732B6C;'Five'
 0073236E    lea         eax,[ebp-0B8]
 00732374    push        eax
 00732375    lea         edx,[ebx+1]
 00732378    mov         ecx,edi
 0073237A    mov         eax,dword ptr [ebp-8]
 0073237D    call        @UStrCopy
 00732382    push        dword ptr [ebp-0B8]
 00732388    lea         eax,[ebp-8]
 0073238B    mov         edx,3
 00732390    call        @UStrCatN
 00732395    mov         edx,dword ptr [ebp-8]
 00732398    mov         eax,732B84;'6'
 0073239D    call        Pos
 007323A2    mov         ebx,eax
 007323A4    cmp         ebx,1
>007323A7    je          007323B9
 007323A9    cmp         ebx,1
>007323AC    jle         0073240E
 007323AE    mov         eax,dword ptr [ebp-8]
 007323B1    cmp         word ptr [eax+ebx*2-4],66
>007323B7    je          0073240E
 007323B9    mov         edi,dword ptr [ebp-8]
 007323BC    test        edi,edi
>007323BE    je          007323C5
 007323C0    sub         edi,4
 007323C3    mov         edi,dword ptr [edi]
 007323C5    lea         eax,[ebp-0BC]
 007323CB    push        eax
 007323CC    mov         ecx,ebx
 007323CE    dec         ecx
 007323CF    mov         edx,1
 007323D4    mov         eax,dword ptr [ebp-8]
 007323D7    call        @UStrCopy
 007323DC    push        dword ptr [ebp-0BC]
 007323E2    push        732B94;'Six'
 007323E7    lea         eax,[ebp-0C0]
 007323ED    push        eax
 007323EE    lea         edx,[ebx+1]
 007323F1    mov         ecx,edi
 007323F3    mov         eax,dword ptr [ebp-8]
 007323F6    call        @UStrCopy
 007323FB    push        dword ptr [ebp-0C0]
 00732401    lea         eax,[ebp-8]
 00732404    mov         edx,3
 00732409    call        @UStrCatN
 0073240E    mov         edx,dword ptr [ebp-8]
 00732411    mov         eax,732BA8;'7'
 00732416    call        Pos
 0073241B    mov         ebx,eax
 0073241D    cmp         ebx,1
>00732420    je          00732432
 00732422    cmp         ebx,1
>00732425    jle         00732487
 00732427    mov         eax,dword ptr [ebp-8]
 0073242A    cmp         word ptr [eax+ebx*2-4],66
>00732430    je          00732487
 00732432    mov         edi,dword ptr [ebp-8]
 00732435    test        edi,edi
>00732437    je          0073243E
 00732439    sub         edi,4
 0073243C    mov         edi,dword ptr [edi]
 0073243E    lea         eax,[ebp-0C4]
 00732444    push        eax
 00732445    mov         ecx,ebx
 00732447    dec         ecx
 00732448    mov         edx,1
 0073244D    mov         eax,dword ptr [ebp-8]
 00732450    call        @UStrCopy
 00732455    push        dword ptr [ebp-0C4]
 0073245B    push        732BB8;'Seven'
 00732460    lea         eax,[ebp-0C8]
 00732466    push        eax
 00732467    lea         edx,[ebx+1]
 0073246A    mov         ecx,edi
 0073246C    mov         eax,dword ptr [ebp-8]
 0073246F    call        @UStrCopy
 00732474    push        dword ptr [ebp-0C8]
 0073247A    lea         eax,[ebp-8]
 0073247D    mov         edx,3
 00732482    call        @UStrCatN
 00732487    mov         edx,dword ptr [ebp-8]
 0073248A    mov         eax,732BD0;'8'
 0073248F    call        Pos
 00732494    mov         ebx,eax
 00732496    cmp         ebx,1
>00732499    je          007324AB
 0073249B    cmp         ebx,1
>0073249E    jle         00732500
 007324A0    mov         eax,dword ptr [ebp-8]
 007324A3    cmp         word ptr [eax+ebx*2-4],66
>007324A9    je          00732500
 007324AB    mov         edi,dword ptr [ebp-8]
 007324AE    test        edi,edi
>007324B0    je          007324B7
 007324B2    sub         edi,4
 007324B5    mov         edi,dword ptr [edi]
 007324B7    lea         eax,[ebp-0CC]
 007324BD    push        eax
 007324BE    mov         ecx,ebx
 007324C0    dec         ecx
 007324C1    mov         edx,1
 007324C6    mov         eax,dword ptr [ebp-8]
 007324C9    call        @UStrCopy
 007324CE    push        dword ptr [ebp-0CC]
 007324D4    push        732BE0;'Eight'
 007324D9    lea         eax,[ebp-0D0]
 007324DF    push        eax
 007324E0    lea         edx,[ebx+1]
 007324E3    mov         ecx,edi
 007324E5    mov         eax,dword ptr [ebp-8]
 007324E8    call        @UStrCopy
 007324ED    push        dword ptr [ebp-0D0]
 007324F3    lea         eax,[ebp-8]
 007324F6    mov         edx,3
 007324FB    call        @UStrCatN
 00732500    mov         edx,dword ptr [ebp-8]
 00732503    mov         eax,732BF8;'9'
 00732508    call        Pos
 0073250D    mov         ebx,eax
 0073250F    cmp         ebx,1
>00732512    je          00732524
 00732514    cmp         ebx,1
>00732517    jle         00732579
 00732519    mov         eax,dword ptr [ebp-8]
 0073251C    cmp         word ptr [eax+ebx*2-4],66
>00732522    je          00732579
 00732524    mov         edi,dword ptr [ebp-8]
 00732527    test        edi,edi
>00732529    je          00732530
 0073252B    sub         edi,4
 0073252E    mov         edi,dword ptr [edi]
 00732530    lea         eax,[ebp-0D4]
 00732536    push        eax
 00732537    mov         ecx,ebx
 00732539    dec         ecx
 0073253A    mov         edx,1
 0073253F    mov         eax,dword ptr [ebp-8]
 00732542    call        @UStrCopy
 00732547    push        dword ptr [ebp-0D4]
 0073254D    push        732C08;'Nine'
 00732552    lea         eax,[ebp-0D8]
 00732558    push        eax
 00732559    lea         edx,[ebx+1]
 0073255C    mov         ecx,edi
 0073255E    mov         eax,dword ptr [ebp-8]
 00732561    call        @UStrCopy
 00732566    push        dword ptr [ebp-0D8]
 0073256C    lea         eax,[ebp-8]
 0073256F    mov         edx,3
 00732574    call        @UStrCatN
 00732579    mov         edx,dword ptr [ebp-8]
 0073257C    mov         eax,732C20;'0'
 00732581    call        Pos
 00732586    mov         ebx,eax
 00732588    cmp         ebx,1
>0073258B    je          0073259D
 0073258D    cmp         ebx,1
>00732590    jle         007325F2
 00732592    mov         eax,dword ptr [ebp-8]
 00732595    cmp         word ptr [eax+ebx*2-4],66
>0073259B    je          007325F2
 0073259D    mov         edi,dword ptr [ebp-8]
 007325A0    test        edi,edi
>007325A2    je          007325A9
 007325A4    sub         edi,4
 007325A7    mov         edi,dword ptr [edi]
 007325A9    lea         eax,[ebp-0DC]
 007325AF    push        eax
 007325B0    mov         ecx,ebx
 007325B2    dec         ecx
 007325B3    mov         edx,1
 007325B8    mov         eax,dword ptr [ebp-8]
 007325BB    call        @UStrCopy
 007325C0    push        dword ptr [ebp-0DC]
 007325C6    push        732C30;'Zero'
 007325CB    lea         eax,[ebp-0E0]
 007325D1    push        eax
 007325D2    lea         edx,[ebx+1]
 007325D5    mov         ecx,edi
 007325D7    mov         eax,dword ptr [ebp-8]
 007325DA    call        @UStrCopy
 007325DF    push        dword ptr [ebp-0E0]
 007325E5    lea         eax,[ebp-8]
 007325E8    mov         edx,3
 007325ED    call        @UStrCatN
 007325F2    mov         eax,esi
 007325F4    mov         edx,dword ptr [ebp-8]
 007325F7    call        @UStrAsg
>007325FC    jmp         00732781
 00732601    mov         eax,dword ptr [ebp-4]
 00732604    mov         edx,732C48;'mixer->volume up'
 00732609    call        @UStrEqual
>0073260E    jne         00732621
 00732610    mov         eax,esi
 00732612    mov         edx,732C78;'VolumeUp'
 00732617    call        @UStrAsg
>0073261C    jmp         00732781
 00732621    mov         eax,dword ptr [ebp-4]
 00732624    mov         edx,732C98;'mixer->volume down'
 00732629    call        @UStrEqual
>0073262E    jne         00732641
 00732630    mov         eax,esi
 00732632    mov         edx,732CCC;'VolumeDown'
 00732637    call        @UStrAsg
>0073263C    jmp         00732781
 00732641    mov         eax,dword ptr [ebp-4]
 00732644    mov         edx,732CF0;'mixer->mute'
 00732649    call        @UStrEqual
>0073264E    jne         00732661
 00732650    mov         eax,esi
 00732652    mov         edx,732D14;'Mute'
 00732657    call        @UStrAsg
>0073265C    jmp         00732781
 00732661    mov         eax,dword ptr [ebp-4]
 00732664    mov         edx,732D2C;'mouse->wheel up'
 00732669    call        @UStrEqual
>0073266E    jne         00732681
 00732670    mov         eax,esi
 00732672    mov         edx,732D58;'Mouse.WheelUp'
 00732677    call        @UStrAsg
>0073267C    jmp         00732781
 00732681    mov         eax,dword ptr [ebp-4]
 00732684    mov         edx,732D80;'mouse->wheel down'
 00732689    call        @UStrEqual
>0073268E    jne         007326A1
 00732690    mov         eax,esi
 00732692    mov         edx,732DB0;'Mouse.WheelDown'
 00732697    call        @UStrAsg
>0073269C    jmp         00732781
 007326A1    mov         eax,dword ptr [ebp-4]
 007326A4    mov         edx,732DDC;'mouse->left click'
 007326A9    call        @UStrEqual
>007326AE    jne         007326C1
 007326B0    mov         eax,esi
 007326B2    mov         edx,732E0C;'Mouse.LeftButton'
 007326B7    call        @UStrAsg
>007326BC    jmp         00732781
 007326C1    mov         eax,dword ptr [ebp-4]
 007326C4    mov         edx,732E3C;'mouse->left double click'
 007326C9    call        @UStrEqual
>007326CE    jne         007326E1
 007326D0    mov         eax,esi
 007326D2    mov         edx,732E7C;'(Mouse.LeftButton, Mouse.LeftButton)'
 007326D7    call        @UStrAsg
>007326DC    jmp         00732781
 007326E1    mov         eax,dword ptr [ebp-4]
 007326E4    mov         edx,732ED4;'mouse->middle click'
 007326E9    call        @UStrEqual
>007326EE    jne         00732701
 007326F0    mov         eax,esi
 007326F2    mov         edx,732F08;'Mouse.MiddleButton'
 007326F7    call        @UStrAsg
>007326FC    jmp         00732781
 00732701    mov         eax,dword ptr [ebp-4]
 00732704    mov         edx,732F3C;'mouse->middle double click'
 00732709    call        @UStrEqual
>0073270E    jne         0073271E
 00732710    mov         eax,esi
 00732712    mov         edx,732F80;'(Mouse.MiddleButton, Mouse.MiddleButton)'
 00732717    call        @UStrAsg
>0073271C    jmp         00732781
 0073271E    mov         eax,dword ptr [ebp-4]
 00732721    mov         edx,732FE0;'mouse->right click'
 00732726    call        @UStrEqual
>0073272B    jne         0073273B
 0073272D    mov         eax,esi
 0073272F    mov         edx,733014;'Mouse.RightButton'
 00732734    call        @UStrAsg
>00732739    jmp         00732781
 0073273B    mov         eax,dword ptr [ebp-4]
 0073273E    mov         edx,733044;'mouse->right double click'
 00732743    call        @UStrEqual
>00732748    jne         00732758
 0073274A    mov         eax,esi
 0073274C    mov         edx,733084;'(Mouse.RightButton, Mouse.RightButton)'
 00732751    call        @UStrAsg
>00732756    jmp         00732781
 00732758    mov         eax,dword ptr [ebp-4]
 0073275B    mov         edx,7330E0;'trigger'
 00732760    call        @UStrEqual
>00732765    jne         00732775
 00732767    mov         eax,esi
 00732769    mov         edx,7330FC;'var.trigger'
 0073276E    call        @UStrAsg
>00732773    jmp         00732781
 00732775    mov         eax,esi
 00732777    mov         edx,733120;'var.dummy'
 0073277C    call        @UStrAsg
 00732781    xor         eax,eax
 00732783    pop         edx
 00732784    pop         ecx
 00732785    pop         ecx
 00732786    mov         dword ptr fs:[eax],edx
 00732789    push        7327A6
 0073278E    lea         eax,[ebp-0E0]
 00732794    mov         edx,38
 00732799    call        @UStrArrayClr
 0073279E    ret
>0073279F    jmp         @HandleFinally
>007327A4    jmp         0073278E
 007327A6    pop         edi
 007327A7    pop         esi
 007327A8    pop         ebx
 007327A9    mov         esp,ebp
 007327AB    pop         ebp
 007327AC    ret
end;*}

//00733134
procedure sub_00733134(?:TIniFile);
begin
{*
 00733134    push        ebp
 00733135    mov         ebp,esp
 00733137    mov         ecx,13
 0073313C    push        0
 0073313E    push        0
 00733140    dec         ecx
>00733141    jne         0073313C
 00733143    push        ecx
 00733144    push        ebx
 00733145    push        esi
 00733146    push        edi
 00733147    mov         ebx,eax
 00733149    xor         eax,eax
 0073314B    push        ebp
 0073314C    push        73362B
 00733151    push        dword ptr fs:[eax]
 00733154    mov         dword ptr fs:[eax],esp
 00733157    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073315C    mov         eax,dword ptr [eax]
 0073315E    mov         eax,dword ptr [eax+394]
 00733164    mov         esi,dword ptr [eax+2A4]
 0073316A    mov         ecx,733648;'// Imported from WiinRemote'
 0073316F    mov         edx,1
 00733174    mov         eax,esi
 00733176    mov         edi,dword ptr [eax]
 00733178    call        dword ptr [edi+60]
 0073317B    push        80
 00733180    mov         ecx,73368C;'BaseX'
 00733185    mov         edx,7336A4;'Motion'
 0073318A    mov         eax,ebx
 0073318C    mov         edi,dword ptr [eax]
 0073318E    call        dword ptr [edi+0C]
 00733191    sub         eax,80
 00733196    lea         edx,[ebp-8]
 00733199    call        IntToStr
 0073319E    mov         ecx,dword ptr [ebp-8]
 007331A1    lea         eax,[ebp-4]
 007331A4    mov         edx,7336C0;'var.BaseX = '
 007331A9    call        @UStrCat3
 007331AE    mov         edx,dword ptr [ebp-4]
 007331B1    mov         eax,esi
 007331B3    mov         ecx,dword ptr [eax]
 007331B5    call        dword ptr [ecx+38]
 007331B8    push        9D
 007331BD    mov         ecx,7336E8;'BaseZ'
 007331C2    mov         edx,7336A4;'Motion'
 007331C7    mov         eax,ebx
 007331C9    mov         edi,dword ptr [eax]
 007331CB    call        dword ptr [edi+0C]
 007331CE    sub         eax,80
 007331D3    lea         edx,[ebp-10]
 007331D6    call        IntToStr
 007331DB    mov         ecx,dword ptr [ebp-10]
 007331DE    lea         eax,[ebp-0C]
 007331E1    mov         edx,733700;'var.BaseY = '
 007331E6    call        @UStrCat3
 007331EB    mov         edx,dword ptr [ebp-0C]
 007331EE    mov         eax,esi
 007331F0    mov         ecx,dword ptr [eax]
 007331F2    call        dword ptr [ecx+38]
 007331F5    push        80
 007331FA    mov         ecx,733728;'BaseY'
 007331FF    mov         edx,7336A4;'Motion'
 00733204    mov         eax,ebx
 00733206    mov         edi,dword ptr [eax]
 00733208    call        dword ptr [edi+0C]
 0073320B    push        eax
 0073320C    mov         eax,80
 00733211    pop         edx
 00733212    sub         eax,edx
 00733214    lea         edx,[ebp-18]
 00733217    call        IntToStr
 0073321C    mov         ecx,dword ptr [ebp-18]
 0073321F    lea         eax,[ebp-14]
 00733222    mov         edx,733740;'var.BaseZ = '
 00733227    call        @UStrCat3
 0073322C    mov         edx,dword ptr [ebp-14]
 0073322F    mov         eax,esi
 00733231    mov         ecx,dword ptr [eax]
 00733233    call        dword ptr [ecx+38]
 00733236    push        0
 00733238    lea         eax,[ebp-20]
 0073323B    push        eax
 0073323C    mov         ecx,733768;'Value'
 00733241    mov         edx,733780;'Up'
 00733246    mov         eax,ebx
 00733248    mov         edi,dword ptr [eax]
 0073324A    call        dword ptr [edi+4]
 0073324D    mov         eax,dword ptr [ebp-20]
 00733250    push        eax
 00733251    push        0
 00733253    lea         eax,[ebp-24]
 00733256    push        eax
 00733257    mov         ecx,733794;'Type'
 0073325C    mov         edx,733780;'Up'
 00733261    mov         eax,ebx
 00733263    mov         edi,dword ptr [eax]
 00733265    call        dword ptr [edi+4]
 00733268    mov         eax,dword ptr [ebp-24]
 0073326B    lea         ecx,[ebp-1C]
 0073326E    pop         edx
 0073326F    call        00731B08
 00733274    lea         eax,[ebp-1C]
 00733277    mov         edx,7337AC;' = Wiimote.Up'
 0073327C    call        @UStrCat
 00733281    mov         edx,dword ptr [ebp-1C]
 00733284    mov         eax,esi
 00733286    mov         ecx,dword ptr [eax]
 00733288    call        dword ptr [ecx+38]
 0073328B    push        0
 0073328D    lea         eax,[ebp-2C]
 00733290    push        eax
 00733291    mov         ecx,733768;'Value'
 00733296    mov         edx,7337D4;'Down'
 0073329B    mov         eax,ebx
 0073329D    mov         edi,dword ptr [eax]
 0073329F    call        dword ptr [edi+4]
 007332A2    mov         eax,dword ptr [ebp-2C]
 007332A5    push        eax
 007332A6    push        0
 007332A8    lea         eax,[ebp-30]
 007332AB    push        eax
 007332AC    mov         ecx,733794;'Type'
 007332B1    mov         edx,7337D4;'Down'
 007332B6    mov         eax,ebx
 007332B8    mov         edi,dword ptr [eax]
 007332BA    call        dword ptr [edi+4]
 007332BD    mov         eax,dword ptr [ebp-30]
 007332C0    lea         ecx,[ebp-28]
 007332C3    pop         edx
 007332C4    call        00731B08
 007332C9    lea         eax,[ebp-28]
 007332CC    mov         edx,7337EC;' = Wiimote.Down'
 007332D1    call        @UStrCat
 007332D6    mov         edx,dword ptr [ebp-28]
 007332D9    mov         eax,esi
 007332DB    mov         ecx,dword ptr [eax]
 007332DD    call        dword ptr [ecx+38]
 007332E0    push        0
 007332E2    lea         eax,[ebp-38]
 007332E5    push        eax
 007332E6    mov         ecx,733768;'Value'
 007332EB    mov         edx,733818;'Right'
 007332F0    mov         eax,ebx
 007332F2    mov         edi,dword ptr [eax]
 007332F4    call        dword ptr [edi+4]
 007332F7    mov         eax,dword ptr [ebp-38]
 007332FA    push        eax
 007332FB    push        0
 007332FD    lea         eax,[ebp-3C]
 00733300    push        eax
 00733301    mov         ecx,733794;'Type'
 00733306    mov         edx,733818;'Right'
 0073330B    mov         eax,ebx
 0073330D    mov         edi,dword ptr [eax]
 0073330F    call        dword ptr [edi+4]
 00733312    mov         eax,dword ptr [ebp-3C]
 00733315    lea         ecx,[ebp-34]
 00733318    pop         edx
 00733319    call        00731B08
 0073331E    lea         eax,[ebp-34]
 00733321    mov         edx,733830;' = Wiimote.Right'
 00733326    call        @UStrCat
 0073332B    mov         edx,dword ptr [ebp-34]
 0073332E    mov         eax,esi
 00733330    mov         ecx,dword ptr [eax]
 00733332    call        dword ptr [ecx+38]
 00733335    push        0
 00733337    lea         eax,[ebp-44]
 0073333A    push        eax
 0073333B    mov         ecx,733768;'Value'
 00733340    mov         edx,733860;'Left'
 00733345    mov         eax,ebx
 00733347    mov         edi,dword ptr [eax]
 00733349    call        dword ptr [edi+4]
 0073334C    mov         eax,dword ptr [ebp-44]
 0073334F    push        eax
 00733350    push        0
 00733352    lea         eax,[ebp-48]
 00733355    push        eax
 00733356    mov         ecx,733794;'Type'
 0073335B    mov         edx,733860;'Left'
 00733360    mov         eax,ebx
 00733362    mov         edi,dword ptr [eax]
 00733364    call        dword ptr [edi+4]
 00733367    mov         eax,dword ptr [ebp-48]
 0073336A    lea         ecx,[ebp-40]
 0073336D    pop         edx
 0073336E    call        00731B08
 00733373    lea         eax,[ebp-40]
 00733376    mov         edx,733878;' = Wiimote.Left'
 0073337B    call        @UStrCat
 00733380    mov         edx,dword ptr [ebp-40]
 00733383    mov         eax,esi
 00733385    mov         ecx,dword ptr [eax]
 00733387    call        dword ptr [ecx+38]
 0073338A    push        0
 0073338C    lea         eax,[ebp-50]
 0073338F    push        eax
 00733390    mov         ecx,733768;'Value'
 00733395    mov         edx,7338A4;'A'
 0073339A    mov         eax,ebx
 0073339C    mov         edi,dword ptr [eax]
 0073339E    call        dword ptr [edi+4]
 007333A1    mov         eax,dword ptr [ebp-50]
 007333A4    push        eax
 007333A5    push        0
 007333A7    lea         eax,[ebp-54]
 007333AA    push        eax
 007333AB    mov         ecx,733794;'Type'
 007333B0    mov         edx,7338A4;'A'
 007333B5    mov         eax,ebx
 007333B7    mov         edi,dword ptr [eax]
 007333B9    call        dword ptr [edi+4]
 007333BC    mov         eax,dword ptr [ebp-54]
 007333BF    lea         ecx,[ebp-4C]
 007333C2    pop         edx
 007333C3    call        00731B08
 007333C8    lea         eax,[ebp-4C]
 007333CB    mov         edx,7338B4;' = Wiimote.A'
 007333D0    call        @UStrCat
 007333D5    mov         edx,dword ptr [ebp-4C]
 007333D8    mov         eax,esi
 007333DA    mov         ecx,dword ptr [eax]
 007333DC    call        dword ptr [ecx+38]
 007333DF    push        0
 007333E1    lea         eax,[ebp-5C]
 007333E4    push        eax
 007333E5    mov         ecx,733768;'Value'
 007333EA    mov         edx,7338DC;'B'
 007333EF    mov         eax,ebx
 007333F1    mov         edi,dword ptr [eax]
 007333F3    call        dword ptr [edi+4]
 007333F6    mov         eax,dword ptr [ebp-5C]
 007333F9    push        eax
 007333FA    push        0
 007333FC    lea         eax,[ebp-60]
 007333FF    push        eax
 00733400    mov         ecx,733794;'Type'
 00733405    mov         edx,7338DC;'B'
 0073340A    mov         eax,ebx
 0073340C    mov         edi,dword ptr [eax]
 0073340E    call        dword ptr [edi+4]
 00733411    mov         eax,dword ptr [ebp-60]
 00733414    lea         ecx,[ebp-58]
 00733417    pop         edx
 00733418    call        00731B08
 0073341D    lea         eax,[ebp-58]
 00733420    mov         edx,7338EC;' = Wiimote.B'
 00733425    call        @UStrCat
 0073342A    mov         edx,dword ptr [ebp-58]
 0073342D    mov         eax,esi
 0073342F    mov         ecx,dword ptr [eax]
 00733431    call        dword ptr [ecx+38]
 00733434    push        0
 00733436    lea         eax,[ebp-68]
 00733439    push        eax
 0073343A    mov         ecx,733768;'Value'
 0073343F    mov         edx,733914;'Home'
 00733444    mov         eax,ebx
 00733446    mov         edi,dword ptr [eax]
 00733448    call        dword ptr [edi+4]
 0073344B    mov         eax,dword ptr [ebp-68]
 0073344E    push        eax
 0073344F    push        0
 00733451    lea         eax,[ebp-6C]
 00733454    push        eax
 00733455    mov         ecx,733794;'Type'
 0073345A    mov         edx,733914;'Home'
 0073345F    mov         eax,ebx
 00733461    mov         edi,dword ptr [eax]
 00733463    call        dword ptr [edi+4]
 00733466    mov         eax,dword ptr [ebp-6C]
 00733469    lea         ecx,[ebp-64]
 0073346C    pop         edx
 0073346D    call        00731B08
 00733472    lea         eax,[ebp-64]
 00733475    mov         edx,73392C;' = Wiimote.Home'
 0073347A    call        @UStrCat
 0073347F    mov         edx,dword ptr [ebp-64]
 00733482    mov         eax,esi
 00733484    mov         ecx,dword ptr [eax]
 00733486    call        dword ptr [ecx+38]
 00733489    push        0
 0073348B    lea         eax,[ebp-74]
 0073348E    push        eax
 0073348F    mov         ecx,733768;'Value'
 00733494    mov         edx,733958;'Plus'
 00733499    mov         eax,ebx
 0073349B    mov         edi,dword ptr [eax]
 0073349D    call        dword ptr [edi+4]
 007334A0    mov         eax,dword ptr [ebp-74]
 007334A3    push        eax
 007334A4    push        0
 007334A6    lea         eax,[ebp-78]
 007334A9    push        eax
 007334AA    mov         ecx,733794;'Type'
 007334AF    mov         edx,733958;'Plus'
 007334B4    mov         eax,ebx
 007334B6    mov         edi,dword ptr [eax]
 007334B8    call        dword ptr [edi+4]
 007334BB    mov         eax,dword ptr [ebp-78]
 007334BE    lea         ecx,[ebp-70]
 007334C1    pop         edx
 007334C2    call        00731B08
 007334C7    lea         eax,[ebp-70]
 007334CA    mov         edx,733970;' = Wiimote.Plus'
 007334CF    call        @UStrCat
 007334D4    mov         edx,dword ptr [ebp-70]
 007334D7    mov         eax,esi
 007334D9    mov         ecx,dword ptr [eax]
 007334DB    call        dword ptr [ecx+38]
 007334DE    push        0
 007334E0    lea         eax,[ebp-80]
 007334E3    push        eax
 007334E4    mov         ecx,733768;'Value'
 007334E9    mov         edx,73399C;'Minus'
 007334EE    mov         eax,ebx
 007334F0    mov         edi,dword ptr [eax]
 007334F2    call        dword ptr [edi+4]
 007334F5    mov         eax,dword ptr [ebp-80]
 007334F8    push        eax
 007334F9    push        0
 007334FB    lea         eax,[ebp-84]
 00733501    push        eax
 00733502    mov         ecx,733794;'Type'
 00733507    mov         edx,73399C;'Minus'
 0073350C    mov         eax,ebx
 0073350E    mov         edi,dword ptr [eax]
 00733510    call        dword ptr [edi+4]
 00733513    mov         eax,dword ptr [ebp-84]
 00733519    lea         ecx,[ebp-7C]
 0073351C    pop         edx
 0073351D    call        00731B08
 00733522    lea         eax,[ebp-7C]
 00733525    mov         edx,7339B4;' = Wiimote.Minus'
 0073352A    call        @UStrCat
 0073352F    mov         edx,dword ptr [ebp-7C]
 00733532    mov         eax,esi
 00733534    mov         ecx,dword ptr [eax]
 00733536    call        dword ptr [ecx+38]
 00733539    push        0
 0073353B    lea         eax,[ebp-8C]
 00733541    push        eax
 00733542    mov         ecx,733768;'Value'
 00733547    mov         edx,7339E4;'1'
 0073354C    mov         eax,ebx
 0073354E    mov         edi,dword ptr [eax]
 00733550    call        dword ptr [edi+4]
 00733553    mov         eax,dword ptr [ebp-8C]
 00733559    push        eax
 0073355A    push        0
 0073355C    lea         eax,[ebp-90]
 00733562    push        eax
 00733563    mov         ecx,733794;'Type'
 00733568    mov         edx,7339E4;'1'
 0073356D    mov         eax,ebx
 0073356F    mov         edi,dword ptr [eax]
 00733571    call        dword ptr [edi+4]
 00733574    mov         eax,dword ptr [ebp-90]
 0073357A    lea         ecx,[ebp-88]
 00733580    pop         edx
 00733581    call        00731B08
 00733586    lea         eax,[ebp-88]
 0073358C    mov         edx,7339F4;' = Wiimote.One'
 00733591    call        @UStrCat
 00733596    mov         edx,dword ptr [ebp-88]
 0073359C    mov         eax,esi
 0073359E    mov         ecx,dword ptr [eax]
 007335A0    call        dword ptr [ecx+38]
 007335A3    push        0
 007335A5    lea         eax,[ebp-98]
 007335AB    push        eax
 007335AC    mov         ecx,733768;'Value'
 007335B1    mov         edx,733A20;'2'
 007335B6    mov         eax,ebx
 007335B8    mov         edi,dword ptr [eax]
 007335BA    call        dword ptr [edi+4]
 007335BD    mov         eax,dword ptr [ebp-98]
 007335C3    push        eax
 007335C4    push        0
 007335C6    lea         eax,[ebp-9C]
 007335CC    push        eax
 007335CD    mov         ecx,733794;'Type'
 007335D2    mov         edx,733A20;'2'
 007335D7    mov         eax,ebx
 007335D9    mov         ebx,dword ptr [eax]
 007335DB    call        dword ptr [ebx+4]
 007335DE    mov         eax,dword ptr [ebp-9C]
 007335E4    lea         ecx,[ebp-94]
 007335EA    pop         edx
 007335EB    call        00731B08
 007335F0    lea         eax,[ebp-94]
 007335F6    mov         edx,733A30;' = Wiimote.Two'
 007335FB    call        @UStrCat
 00733600    mov         edx,dword ptr [ebp-94]
 00733606    mov         eax,esi
 00733608    mov         ecx,dword ptr [eax]
 0073360A    call        dword ptr [ecx+38]
 0073360D    xor         eax,eax
 0073360F    pop         edx
 00733610    pop         ecx
 00733611    pop         ecx
 00733612    mov         dword ptr fs:[eax],edx
 00733615    push        733632
 0073361A    lea         eax,[ebp-9C]
 00733620    mov         edx,27
 00733625    call        @UStrArrayClr
 0073362A    ret
>0073362B    jmp         @HandleFinally
>00733630    jmp         0073361A
 00733632    pop         edi
 00733633    pop         esi
 00733634    pop         ebx
 00733635    mov         esp,ebp
 00733637    pop         ebp
 00733638    ret
*}
end;

//00733A50
procedure sub_00733A50(?:UnicodeString);
begin
{*
 00733A50    push        ebp
 00733A51    mov         ebp,esp
 00733A53    mov         ecx,0D
 00733A58    push        0
 00733A5A    push        0
 00733A5C    dec         ecx
>00733A5D    jne         00733A58
 00733A5F    push        ebx
 00733A60    push        esi
 00733A61    push        edi
 00733A62    mov         dword ptr [ebp-4],eax
 00733A65    mov         eax,dword ptr [ebp-4]
 00733A68    call        @UStrAddRef
 00733A6D    xor         eax,eax
 00733A6F    push        ebp
 00733A70    push        733E74
 00733A75    push        dword ptr fs:[eax]
 00733A78    mov         dword ptr fs:[eax],esp
 00733A7B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00733A80    mov         eax,dword ptr [eax]
 00733A82    mov         eax,dword ptr [eax+394]
 00733A88    mov         eax,dword ptr [eax+2A4]
 00733A8E    mov         edx,dword ptr [eax]
 00733A90    call        dword ptr [edx+44]
 00733A93    lea         edx,[ebp-18]
 00733A96    mov         eax,dword ptr [ebp-4]
 00733A99    call        ExtractFileName
 00733A9E    mov         ecx,dword ptr [ebp-18]
 00733AA1    lea         eax,[ebp-14]
 00733AA4    mov         edx,733E90;'// '
 00733AA9    call        @UStrCat3
 00733AAE    mov         ecx,dword ptr [ebp-14]
 00733AB1    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00733AB6    mov         eax,dword ptr [eax]
 00733AB8    mov         eax,dword ptr [eax+394]
 00733ABE    mov         eax,dword ptr [eax+2A4]
 00733AC4    xor         edx,edx
 00733AC6    mov         ebx,dword ptr [eax]
 00733AC8    call        dword ptr [ebx+60]
 00733ACB    mov         ecx,dword ptr [ebp-4]
 00733ACE    mov         dl,1
 00733AD0    mov         eax,[004598F4];TIniFile
 00733AD5    call        TCustomIniFile.Create;TIniFile.Create
 00733ADA    mov         dword ptr [ebp-0C],eax
 00733ADD    mov         edx,733EA4;'PPJoyKey'
 00733AE2    mov         eax,dword ptr [ebp-0C]
 00733AE5    call        TCustomIniFile.SectionExists
 00733AEA    test        al,al
>00733AEC    jne         00733B5B
 00733AEE    mov         edx,733EC4;'Plus'
 00733AF3    mov         eax,dword ptr [ebp-0C]
 00733AF6    call        TCustomIniFile.SectionExists
 00733AFB    test        al,al
>00733AFD    jne         00733B10
 00733AFF    mov         edx,733EDC;'Motion'
 00733B04    mov         eax,dword ptr [ebp-0C]
 00733B07    call        TCustomIniFile.SectionExists
 00733B0C    test        al,al
>00733B0E    je          00733B25
 00733B10    mov         eax,dword ptr [ebp-0C]
 00733B13    call        00733134
 00733B18    mov         eax,dword ptr [ebp-0C]
 00733B1B    call        TObject.Free
>00733B20    jmp         00733E4C
 00733B25    mov         eax,dword ptr [ebp-0C]
 00733B28    call        TObject.Free
 00733B2D    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00733B32    mov         eax,dword ptr [eax]
 00733B34    mov         eax,dword ptr [eax+394]
 00733B3A    mov         eax,dword ptr [eax+2A4]
 00733B40    mov         edx,dword ptr [ebp-4]
 00733B43    mov         ecx,dword ptr [eax]
 00733B45    call        dword ptr [ecx+68]
 00733B48    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00733B4D    mov         eax,dword ptr [eax]
 00733B4F    mov         byte ptr [eax+656],0
>00733B56    jmp         00733E4C
 00733B5B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00733B60    mov         eax,dword ptr [eax]
 00733B62    mov         eax,dword ptr [eax+394]
 00733B68    mov         eax,dword ptr [eax+2A4]
 00733B6E    mov         ecx,733EF8;'// Imported from PPJoyKey'
 00733B73    mov         edx,1
 00733B78    mov         ebx,dword ptr [eax]
 00733B7A    call        dword ptr [ebx+60]
 00733B7D    xor         edx,edx
 00733B7F    push        ebp
 00733B80    push        733E45
 00733B85    push        dword ptr fs:[edx]
 00733B88    mov         dword ptr fs:[edx],esp
 00733B8B    xor         edx,edx
 00733B8D    push        ebp
 00733B8E    push        733E14
 00733B93    push        dword ptr fs:[edx]
 00733B96    mov         dword ptr fs:[edx],esp
 00733B99    push        733F38;'ppjoy'
 00733B9E    push        0
 00733BA0    lea         eax,[ebp-1C]
 00733BA3    push        eax
 00733BA4    mov         ecx,733F50;'VirtualJoyNumber'
 00733BA9    mov         edx,733EA4;'PPJoyKey'
 00733BAE    mov         eax,dword ptr [ebp-0C]
 00733BB1    mov         ebx,dword ptr [eax]
 00733BB3    call        dword ptr [ebx+4];TIniFile.ReadString
 00733BB6    push        dword ptr [ebp-1C]
 00733BB9    push        733F80;'.'
 00733BBE    lea         eax,[ebp-8]
 00733BC1    mov         edx,3
 00733BC6    call        @UStrCatN
 00733BCB    mov         esi,1
 00733BD0    push        0FF
 00733BD2    push        733F90;'Axis'
 00733BD7    lea         edx,[ebp-24]
 00733BDA    mov         eax,esi
 00733BDC    call        IntToStr
 00733BE1    push        dword ptr [ebp-24]
 00733BE4    push        733FA8;'Min'
 00733BE9    lea         eax,[ebp-20]
 00733BEC    mov         edx,3
 00733BF1    call        @UStrCatN
 00733BF6    mov         ecx,dword ptr [ebp-20]
 00733BF9    mov         edx,733EA4;'PPJoyKey'
 00733BFE    mov         eax,dword ptr [ebp-0C]
 00733C01    mov         ebx,dword ptr [eax]
 00733C03    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 00733C06    mov         dword ptr [ebp-10],eax
 00733C09    push        0FF
 00733C0B    push        733F90;'Axis'
 00733C10    lea         edx,[ebp-2C]
 00733C13    mov         eax,esi
 00733C15    call        IntToStr
 00733C1A    push        dword ptr [ebp-2C]
 00733C1D    push        733FBC;'Max'
 00733C22    lea         eax,[ebp-28]
 00733C25    mov         edx,3
 00733C2A    call        @UStrCatN
 00733C2F    mov         ecx,dword ptr [ebp-28]
 00733C32    mov         edx,733EA4;'PPJoyKey'
 00733C37    mov         eax,dword ptr [ebp-0C]
 00733C3A    mov         ebx,dword ptr [eax]
 00733C3C    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 00733C3F    mov         ebx,eax
 00733C41    cmp         dword ptr [ebp-10],0
>00733C45    jle         00733CB8
 00733C47    test        ebx,ebx
>00733C49    jle         00733CB8
 00733C4B    push        dword ptr [ebp-8]
 00733C4E    push        733FD0;'Analog'
 00733C53    lea         edx,[ebp-34]
 00733C56    mov         eax,esi
 00733C58    dec         eax
 00733C59    call        IntToStr
 00733C5E    push        dword ptr [ebp-34]
 00733C61    push        733FEC;' = Int('
 00733C66    lea         edx,[ebp-38]
 00733C69    mov         eax,ebx
 00733C6B    call        005F2178
 00733C70    push        dword ptr [ebp-38]
 00733C73    push        734008;')-Int('
 00733C78    lea         edx,[ebp-3C]
 00733C7B    mov         eax,dword ptr [ebp-10]
 00733C7E    call        005F2178
 00733C83    push        dword ptr [ebp-3C]
 00733C86    push        734024;')'
 00733C8B    lea         eax,[ebp-30]
 00733C8E    mov         edx,8
 00733C93    call        @UStrCatN
 00733C98    mov         edx,dword ptr [ebp-30]
 00733C9B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00733CA0    mov         eax,dword ptr [eax]
 00733CA2    mov         eax,dword ptr [eax+394]
 00733CA8    mov         eax,dword ptr [eax+2A4]
 00733CAE    mov         ecx,dword ptr [eax]
 00733CB0    call        dword ptr [ecx+38]
>00733CB3    jmp         00733D6F
 00733CB8    test        ebx,ebx
>00733CBA    jle         00733D13
 00733CBC    push        dword ptr [ebp-8]
 00733CBF    push        733FD0;'Analog'
 00733CC4    lea         edx,[ebp-44]
 00733CC7    mov         eax,esi
 00733CC9    dec         eax
 00733CCA    call        IntToStr
 00733CCF    push        dword ptr [ebp-44]
 00733CD2    push        733FEC;' = Int('
 00733CD7    lea         edx,[ebp-48]
 00733CDA    mov         eax,ebx
 00733CDC    call        005F2178
 00733CE1    push        dword ptr [ebp-48]
 00733CE4    push        734024;')'
 00733CE9    lea         eax,[ebp-40]
 00733CEC    mov         edx,6
 00733CF1    call        @UStrCatN
 00733CF6    mov         edx,dword ptr [ebp-40]
 00733CF9    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00733CFE    mov         eax,dword ptr [eax]
 00733D00    mov         eax,dword ptr [eax+394]
 00733D06    mov         eax,dword ptr [eax+2A4]
 00733D0C    mov         ecx,dword ptr [eax]
 00733D0E    call        dword ptr [ecx+38]
>00733D11    jmp         00733D6F
 00733D13    cmp         dword ptr [ebp-10],0
>00733D17    jle         00733D6F
 00733D19    push        dword ptr [ebp-8]
 00733D1C    push        733FD0;'Analog'
 00733D21    lea         edx,[ebp-50]
 00733D24    mov         eax,esi
 00733D26    dec         eax
 00733D27    call        IntToStr
 00733D2C    push        dword ptr [ebp-50]
 00733D2F    push        734034;' = -Int('
 00733D34    lea         edx,[ebp-54]
 00733D37    mov         eax,dword ptr [ebp-10]
 00733D3A    call        005F2178
 00733D3F    push        dword ptr [ebp-54]
 00733D42    push        734024;')'
 00733D47    lea         eax,[ebp-4C]
 00733D4A    mov         edx,6
 00733D4F    call        @UStrCatN
 00733D54    mov         edx,dword ptr [ebp-4C]
 00733D57    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00733D5C    mov         eax,dword ptr [eax]
 00733D5E    mov         eax,dword ptr [eax+394]
 00733D64    mov         eax,dword ptr [eax+2A4]
 00733D6A    mov         ecx,dword ptr [eax]
 00733D6C    call        dword ptr [ecx+38]
 00733D6F    inc         esi
 00733D70    cmp         esi,5
>00733D73    jne         00733BD0
 00733D79    mov         esi,1
 00733D7E    push        0FF
 00733D80    lea         edx,[ebp-5C]
 00733D83    mov         eax,esi
 00733D85    call        IntToStr
 00733D8A    mov         ecx,dword ptr [ebp-5C]
 00733D8D    lea         eax,[ebp-58]
 00733D90    mov         edx,734054;'Button'
 00733D95    call        @UStrCat3
 00733D9A    mov         ecx,dword ptr [ebp-58]
 00733D9D    mov         edx,733EA4;'PPJoyKey'
 00733DA2    mov         eax,dword ptr [ebp-0C]
 00733DA5    mov         ebx,dword ptr [eax]
 00733DA7    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 00733DAA    mov         ebx,eax
 00733DAC    test        ebx,ebx
>00733DAE    jle         00733E00
 00733DB0    push        dword ptr [ebp-8]
 00733DB3    push        734070;^338:Single
 00733DB8    lea         edx,[ebp-64]
 00733DBB    mov         eax,esi
 00733DBD    dec         eax
 00733DBE    call        IntToStr
 00733DC3    push        dword ptr [ebp-64]
 00733DC6    push        73408C;' = '
 00733DCB    lea         edx,[ebp-68]
 00733DCE    mov         eax,ebx
 00733DD0    call        005F2178
 00733DD5    push        dword ptr [ebp-68]
 00733DD8    lea         eax,[ebp-60]
 00733DDB    mov         edx,5
 00733DE0    call        @UStrCatN
 00733DE5    mov         edx,dword ptr [ebp-60]
 00733DE8    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00733DED    mov         eax,dword ptr [eax]
 00733DEF    mov         eax,dword ptr [eax+394]
 00733DF5    mov         eax,dword ptr [eax+2A4]
 00733DFB    mov         ecx,dword ptr [eax]
 00733DFD    call        dword ptr [ecx+38]
 00733E00    inc         esi
 00733E01    cmp         esi,11
>00733E04    jne         00733D7E
 00733E0A    xor         eax,eax
 00733E0C    pop         edx
 00733E0D    pop         ecx
 00733E0E    pop         ecx
 00733E0F    mov         dword ptr fs:[eax],edx
>00733E12    jmp         00733E2F
>00733E14    jmp         @HandleOnException
 00733E19    dd          1
 00733E1D    dd          00418C04;Exception
 00733E21    dd          00733E25
 00733E25    call        004FA644
 00733E2A    call        @DoneExcept
 00733E2F    xor         eax,eax
 00733E31    pop         edx
 00733E32    pop         ecx
 00733E33    pop         ecx
 00733E34    mov         dword ptr fs:[eax],edx
 00733E37    push        733E4C
 00733E3C    mov         eax,dword ptr [ebp-0C]
 00733E3F    call        TObject.Free
 00733E44    ret
>00733E45    jmp         @HandleFinally
>00733E4A    jmp         00733E3C
 00733E4C    xor         eax,eax
 00733E4E    pop         edx
 00733E4F    pop         ecx
 00733E50    pop         ecx
 00733E51    mov         dword ptr fs:[eax],edx
 00733E54    push        733E7B
 00733E59    lea         eax,[ebp-68]
 00733E5C    mov         edx,16
 00733E61    call        @UStrArrayClr
 00733E66    lea         eax,[ebp-8]
 00733E69    mov         edx,2
 00733E6E    call        @UStrArrayClr
 00733E73    ret
>00733E74    jmp         @HandleFinally
>00733E79    jmp         00733E59
 00733E7B    pop         edi
 00733E7C    pop         esi
 00733E7D    pop         ebx
 00733E7E    mov         esp,ebp
 00733E80    pop         ebp
 00733E81    ret
*}
end;

//00734094
{*procedure sub_00734094(?:?; ?:?);
begin
 00734094    push        ebp
 00734095    mov         ebp,esp
 00734097    push        0
 00734099    push        0
 0073409B    push        0
 0073409D    push        ebx
 0073409E    push        esi
 0073409F    push        edi
 007340A0    mov         edi,edx
 007340A2    mov         dword ptr [ebp-4],eax
 007340A5    mov         eax,dword ptr [ebp-4]
 007340A8    call        @UStrAddRef
 007340AD    xor         eax,eax
 007340AF    push        ebp
 007340B0    push        73414F
 007340B5    push        dword ptr fs:[eax]
 007340B8    mov         dword ptr fs:[eax],esp
 007340BB    mov         eax,edi
 007340BD    call        @UStrClr
 007340C2    mov         eax,dword ptr [ebp-4]
 007340C5    test        eax,eax
>007340C7    je          007340CE
 007340C9    sub         eax,4
 007340CC    mov         eax,dword ptr [eax]
 007340CE    mov         esi,eax
 007340D0    test        esi,esi
>007340D2    jle         00734134
 007340D4    mov         ebx,1
 007340D9    mov         eax,dword ptr [ebp-4]
 007340DC    cmp         word ptr [eax+ebx*2-2],5F
>007340E2    jne         007340F2
 007340E4    mov         eax,edi
 007340E6    mov         edx,73416C;' '
 007340EB    call        @UStrCat
>007340F0    jmp         00734130
 007340F2    mov         eax,dword ptr [ebp-4]
 007340F5    cmp         word ptr [eax+ebx*2-2],22
>007340FB    jne         0073410B
 007340FD    mov         eax,edi
 007340FF    mov         edx,73417C;'""'
 00734104    call        @UStrCat
>00734109    jmp         00734130
 0073410B    lea         eax,[ebp-0C]
 0073410E    mov         edx,dword ptr [ebp-4]
 00734111    movzx       edx,word ptr [edx+ebx*2-2]
 00734116    call        @UStrFromWChar
 0073411B    mov         eax,dword ptr [ebp-0C]
 0073411E    lea         edx,[ebp-8]
 00734121    call        LowerCase
 00734126    mov         edx,dword ptr [ebp-8]
 00734129    mov         eax,edi
 0073412B    call        @UStrCat
 00734130    inc         ebx
 00734131    dec         esi
>00734132    jne         007340D9
 00734134    xor         eax,eax
 00734136    pop         edx
 00734137    pop         ecx
 00734138    pop         ecx
 00734139    mov         dword ptr fs:[eax],edx
 0073413C    push        734156
 00734141    lea         eax,[ebp-0C]
 00734144    mov         edx,3
 00734149    call        @UStrArrayClr
 0073414E    ret
>0073414F    jmp         @HandleFinally
>00734154    jmp         00734141
 00734156    pop         edi
 00734157    pop         esi
 00734158    pop         ebx
 00734159    mov         esp,ebp
 0073415B    pop         ebp
 0073415C    ret
end;*}

//00734184
procedure sub_00734184(?:UnicodeString);
begin
{*
 00734184    push        ebp
 00734185    mov         ebp,esp
 00734187    mov         ecx,15
 0073418C    push        0
 0073418E    push        0
 00734190    dec         ecx
>00734191    jne         0073418C
 00734193    push        ecx
 00734194    push        ebx
 00734195    push        esi
 00734196    push        edi
 00734197    mov         dword ptr [ebp-4],eax
 0073419A    mov         eax,dword ptr [ebp-4]
 0073419D    call        @UStrAddRef
 007341A2    xor         eax,eax
 007341A4    push        ebp
 007341A5    push        734832
 007341AA    push        dword ptr fs:[eax]
 007341AD    mov         dword ptr fs:[eax],esp
 007341B0    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 007341B5    mov         eax,dword ptr [eax]
 007341B7    mov         eax,dword ptr [eax+394]
 007341BD    mov         eax,dword ptr [eax+2A4]
 007341C3    mov         edx,dword ptr [eax]
 007341C5    call        dword ptr [edx+44]
 007341C8    lea         edx,[ebp-34]
 007341CB    mov         eax,dword ptr [ebp-4]
 007341CE    call        ExtractFileName
 007341D3    mov         ecx,dword ptr [ebp-34]
 007341D6    lea         eax,[ebp-30]
 007341D9    mov         edx,73484C;'// '
 007341DE    call        @UStrCat3
 007341E3    mov         ecx,dword ptr [ebp-30]
 007341E6    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 007341EB    mov         eax,dword ptr [eax]
 007341ED    mov         eax,dword ptr [eax+394]
 007341F3    mov         eax,dword ptr [eax+2A4]
 007341F9    xor         edx,edx
 007341FB    mov         ebx,dword ptr [eax]
 007341FD    call        dword ptr [ebx+60]
 00734200    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00734205    mov         eax,dword ptr [eax]
 00734207    mov         eax,dword ptr [eax+394]
 0073420D    mov         eax,dword ptr [eax+2A4]
 00734213    mov         ecx,734860;'// Imported from VR Commander'
 00734218    mov         edx,1
 0073421D    mov         ebx,dword ptr [eax]
 0073421F    call        dword ptr [ebx+60]
 00734222    mov         ecx,dword ptr [ebp-4]
 00734225    mov         dl,1
 00734227    mov         eax,[004598F4];TIniFile
 0073422C    call        TCustomIniFile.Create;TIniFile.Create
 00734231    mov         dword ptr [ebp-18],eax
 00734234    mov         edx,7348A8;'GameData'
 00734239    mov         eax,dword ptr [ebp-18]
 0073423C    call        TCustomIniFile.SectionExists
 00734241    test        al,al
>00734243    jne         0073427B
 00734245    mov         eax,dword ptr [ebp-18]
 00734248    call        TObject.Free
 0073424D    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00734252    mov         eax,dword ptr [eax]
 00734254    mov         eax,dword ptr [eax+394]
 0073425A    mov         eax,dword ptr [eax+2A4]
 00734260    mov         edx,dword ptr [ebp-4]
 00734263    mov         ecx,dword ptr [eax]
 00734265    call        dword ptr [ecx+68]
 00734268    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073426D    mov         eax,dword ptr [eax]
 0073426F    mov         byte ptr [eax+656],0
>00734276    jmp         00734807
 0073427B    xor         edx,edx
 0073427D    push        ebp
 0073427E    push        734800
 00734283    push        dword ptr fs:[edx]
 00734286    mov         dword ptr fs:[edx],esp
 00734289    xor         edx,edx
 0073428B    push        ebp
 0073428C    push        7347CF
 00734291    push        dword ptr fs:[edx]
 00734294    mov         dword ptr fs:[edx],esp
 00734297    push        0
 00734299    lea         eax,[ebp-3C]
 0073429C    push        eax
 0073429D    mov         ecx,7348C8;'GameName'
 007342A2    mov         edx,7348A8;'GameData'
 007342A7    mov         eax,dword ptr [ebp-18]
 007342AA    mov         ebx,dword ptr [eax]
 007342AC    call        dword ptr [ebx+4];TIniFile.ReadString
 007342AF    mov         ecx,dword ptr [ebp-3C]
 007342B2    lea         eax,[ebp-38]
 007342B5    mov         edx,73484C;'// '
 007342BA    call        @UStrCat3
 007342BF    mov         ecx,dword ptr [ebp-38]
 007342C2    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 007342C7    mov         eax,dword ptr [eax]
 007342C9    mov         eax,dword ptr [eax+394]
 007342CF    mov         eax,dword ptr [eax+2A4]
 007342D5    xor         edx,edx
 007342D7    mov         ebx,dword ptr [eax]
 007342D9    call        dword ptr [ebx+60]
 007342DC    push        0
 007342DE    lea         eax,[ebp-44]
 007342E1    push        eax
 007342E2    mov         ecx,7348E8;'ProcessName'
 007342E7    mov         edx,7348A8;'GameData'
 007342EC    mov         eax,dword ptr [ebp-18]
 007342EF    mov         ebx,dword ptr [eax]
 007342F1    call        dword ptr [ebx+4];TIniFile.ReadString
 007342F4    mov         ecx,dword ptr [ebp-44]
 007342F7    lea         eax,[ebp-40]
 007342FA    mov         edx,73490C;'// ProcessName = '
 007342FF    call        @UStrCat3
 00734304    mov         ecx,dword ptr [ebp-40]
 00734307    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073430C    mov         eax,dword ptr [eax]
 0073430E    mov         eax,dword ptr [eax+394]
 00734314    mov         eax,dword ptr [eax+2A4]
 0073431A    mov         edx,2
 0073431F    mov         ebx,dword ptr [eax]
 00734321    call        dword ptr [ebx+60]
 00734324    push        0
 00734326    mov         ecx,73493C;'KeystrokesNum'
 0073432B    mov         edx,734964;'KeystrokeData'
 00734330    mov         eax,dword ptr [ebp-18]
 00734333    mov         ebx,dword ptr [eax]
 00734335    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 00734338    test        eax,eax
>0073433A    jle         007347C5
 00734340    mov         dword ptr [ebp-28],eax
 00734343    mov         dword ptr [ebp-1C],1
 0073434A    lea         edx,[ebp-48]
 0073434D    mov         eax,dword ptr [ebp-1C]
 00734350    call        IntToStr
 00734355    mov         ecx,dword ptr [ebp-48]
 00734358    lea         eax,[ebp-8]
 0073435B    mov         edx,73498C;'Keystroke'
 00734360    call        @UStrCat3
 00734365    push        0
 00734367    lea         eax,[ebp-4C]
 0073436A    push        eax
 0073436B    mov         ecx,7349AC;'KGramBnf'
 00734370    mov         edx,dword ptr [ebp-8]
 00734373    mov         eax,dword ptr [ebp-18]
 00734376    mov         ebx,dword ptr [eax]
 00734378    call        dword ptr [ebx+4];TIniFile.ReadString
 0073437B    mov         eax,dword ptr [ebp-4C]
 0073437E    lea         edx,[ebp-0C]
 00734381    call        00734094
 00734386    push        0
 00734388    mov         ecx,7349CC;'NumKeys'
 0073438D    mov         edx,dword ptr [ebp-8]
 00734390    mov         eax,dword ptr [ebp-18]
 00734393    mov         ebx,dword ptr [eax]
 00734395    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 00734398    mov         ebx,eax
 0073439A    lea         eax,[ebp-10]
 0073439D    call        @UStrClr
 007343A2    dec         ebx
 007343A3    test        ebx,ebx
>007343A5    jl          007346C8
 007343AB    inc         ebx
 007343AC    mov         dword ptr [ebp-2C],ebx
 007343AF    xor         ebx,ebx
 007343B1    push        0
 007343B3    lea         edx,[ebp-54]
 007343B6    mov         eax,ebx
 007343B8    call        IntToStr
 007343BD    mov         ecx,dword ptr [ebp-54]
 007343C0    lea         eax,[ebp-50]
 007343C3    mov         edx,7349E8;'Key'
 007343C8    call        @UStrCat3
 007343CD    mov         ecx,dword ptr [ebp-50]
 007343D0    mov         edx,dword ptr [ebp-8]
 007343D3    mov         eax,dword ptr [ebp-18]
 007343D6    mov         esi,dword ptr [eax]
 007343D8    call        dword ptr [esi+0C];TCustomIniFile.ReadInteger
 007343DB    mov         dword ptr [ebp-20],eax
 007343DE    push        0
 007343E0    lea         edx,[ebp-5C]
 007343E3    mov         eax,ebx
 007343E5    call        IntToStr
 007343EA    mov         ecx,dword ptr [ebp-5C]
 007343ED    lea         eax,[ebp-58]
 007343F0    mov         edx,7349FC;'CmdKey'
 007343F5    call        @UStrCat3
 007343FA    mov         ecx,dword ptr [ebp-58]
 007343FD    mov         edx,dword ptr [ebp-8]
 00734400    mov         eax,dword ptr [ebp-18]
 00734403    mov         esi,dword ptr [eax]
 00734405    call        dword ptr [esi+0C];TCustomIniFile.ReadInteger
 00734408    mov         esi,eax
 0073440A    push        0
 0073440C    lea         edx,[ebp-64]
 0073440F    mov         eax,ebx
 00734411    call        IntToStr
 00734416    mov         ecx,dword ptr [ebp-64]
 00734419    lea         eax,[ebp-60]
 0073441C    mov         edx,734A18;'Cmd2Key'
 00734421    call        @UStrCat3
 00734426    mov         ecx,dword ptr [ebp-60]
 00734429    mov         edx,dword ptr [ebp-8]
 0073442C    mov         eax,dword ptr [ebp-18]
 0073442F    mov         edi,dword ptr [eax]
 00734431    call        dword ptr [edi+0C];TCustomIniFile.ReadInteger
 00734434    mov         dword ptr [ebp-24],eax
 00734437    push        0
 00734439    lea         edx,[ebp-6C]
 0073443C    mov         eax,ebx
 0073443E    call        IntToStr
 00734443    mov         ecx,dword ptr [ebp-6C]
 00734446    lea         eax,[ebp-68]
 00734449    mov         edx,734A34;'Cmd3Key'
 0073444E    call        @UStrCat3
 00734453    mov         ecx,dword ptr [ebp-68]
 00734456    mov         edx,dword ptr [ebp-8]
 00734459    mov         eax,dword ptr [ebp-18]
 0073445C    mov         edi,dword ptr [eax]
 0073445E    call        dword ptr [edi+0C];TCustomIniFile.ReadInteger
 00734461    mov         edi,eax
 00734463    cmp         dword ptr [ebp-20],0
>00734467    je          00734524
 0073446D    cmp         dword ptr [ebp-10],0
>00734471    je          00734480
 00734473    lea         eax,[ebp-10]
 00734476    mov         edx,734A50;', '
 0073447B    call        @UStrCat
 00734480    test        esi,esi
>00734482    je          007344AB
 00734484    push        dword ptr [ebp-10]
 00734487    mov         eax,esi
 00734489    call        005FD518
 0073448E    lea         edx,[ebp-70]
 00734491    call        005F2178
 00734496    push        dword ptr [ebp-70]
 00734499    push        734A64;'+'
 0073449E    lea         eax,[ebp-10]
 007344A1    mov         edx,3
 007344A6    call        @UStrCatN
 007344AB    cmp         dword ptr [ebp-24],0
>007344AF    je          007344D9
 007344B1    push        dword ptr [ebp-10]
 007344B4    mov         eax,dword ptr [ebp-24]
 007344B7    call        005FD518
 007344BC    lea         edx,[ebp-74]
 007344BF    call        005F2178
 007344C4    push        dword ptr [ebp-74]
 007344C7    push        734A64;'+'
 007344CC    lea         eax,[ebp-10]
 007344CF    mov         edx,3
 007344D4    call        @UStrCatN
 007344D9    test        edi,edi
>007344DB    je          00734504
 007344DD    push        dword ptr [ebp-10]
 007344E0    mov         eax,edi
 007344E2    call        005FD518
 007344E7    lea         edx,[ebp-78]
 007344EA    call        005F2178
 007344EF    push        dword ptr [ebp-78]
 007344F2    push        734A64;'+'
 007344F7    lea         eax,[ebp-10]
 007344FA    mov         edx,3
 007344FF    call        @UStrCatN
 00734504    mov         eax,dword ptr [ebp-20]
 00734507    call        005FD518
 0073450C    lea         edx,[ebp-7C]
 0073450F    call        005F2178
 00734514    mov         edx,dword ptr [ebp-7C]
 00734517    lea         eax,[ebp-10]
 0073451A    call        @UStrCat
>0073451F    jmp         007346BE
 00734524    test        esi,esi
>00734526    je          00734583
 00734528    cmp         dword ptr [ebp-24],0
>0073452C    je          00734583
 0073452E    cmp         dword ptr [ebp-10],0
>00734532    je          00734541
 00734534    lea         eax,[ebp-10]
 00734537    mov         edx,734A50;', '
 0073453C    call        @UStrCat
 00734541    push        dword ptr [ebp-10]
 00734544    mov         eax,esi
 00734546    call        005FD518
 0073454B    lea         edx,[ebp-80]
 0073454E    call        005F2178
 00734553    push        dword ptr [ebp-80]
 00734556    push        734A64;'+'
 0073455B    mov         eax,dword ptr [ebp-24]
 0073455E    call        005FD518
 00734563    lea         edx,[ebp-84]
 00734569    call        005F2178
 0073456E    push        dword ptr [ebp-84]
 00734574    lea         eax,[ebp-10]
 00734577    mov         edx,4
 0073457C    call        @UStrCatN
>00734581    jmp         007345F6
 00734583    test        esi,esi
>00734585    je          007345BC
 00734587    cmp         dword ptr [ebp-10],0
>0073458B    je          0073459A
 0073458D    lea         eax,[ebp-10]
 00734590    mov         edx,734A50;', '
 00734595    call        @UStrCat
 0073459A    mov         eax,esi
 0073459C    call        005FD518
 007345A1    lea         edx,[ebp-88]
 007345A7    call        005F2178
 007345AC    mov         edx,dword ptr [ebp-88]
 007345B2    lea         eax,[ebp-10]
 007345B5    call        @UStrCat
>007345BA    jmp         007345F6
 007345BC    cmp         dword ptr [ebp-24],0
>007345C0    je          007345F6
 007345C2    cmp         dword ptr [ebp-10],0
>007345C6    je          007345D5
 007345C8    lea         eax,[ebp-10]
 007345CB    mov         edx,734A50;', '
 007345D0    call        @UStrCat
 007345D5    mov         eax,dword ptr [ebp-24]
 007345D8    call        005FD518
 007345DD    lea         edx,[ebp-8C]
 007345E3    call        005F2178
 007345E8    mov         edx,dword ptr [ebp-8C]
 007345EE    lea         eax,[ebp-10]
 007345F1    call        @UStrCat
 007345F6    push        0
 007345F8    lea         eax,[ebp-14]
 007345FB    push        eax
 007345FC    lea         edx,[ebp-94]
 00734602    mov         eax,ebx
 00734604    call        IntToStr
 00734609    mov         ecx,dword ptr [ebp-94]
 0073460F    lea         eax,[ebp-90]
 00734615    mov         edx,734A74;'Data'
 0073461A    call        @UStrCat3
 0073461F    mov         ecx,dword ptr [ebp-90]
 00734625    mov         edx,dword ptr [ebp-8]
 00734628    mov         eax,dword ptr [ebp-18]
 0073462B    mov         esi,dword ptr [eax]
 0073462D    call        dword ptr [esi+4];TIniFile.ReadString
 00734630    cmp         dword ptr [ebp-14],0
>00734634    je          007346BE
 0073463A    cmp         dword ptr [ebp-10],0
>0073463E    je          0073464D
 00734640    lea         eax,[ebp-10]
 00734643    mov         edx,734A50;', '
 00734648    call        @UStrCat
 0073464D    push        dword ptr [ebp-10]
 00734650    push        734A8C;'Type("'
 00734655    push        dword ptr [ebp-14]
 00734658    push        734AA8;'")'
 0073465D    lea         eax,[ebp-10]
 00734660    mov         edx,4
 00734665    call        @UStrCatN
 0073466A    push        0
 0073466C    lea         eax,[ebp-98]
 00734672    push        eax
 00734673    lea         edx,[ebp-0A0]
 00734679    lea         eax,[ebx+1]
 0073467C    call        IntToStr
 00734681    mov         ecx,dword ptr [ebp-0A0]
 00734687    lea         eax,[ebp-9C]
 0073468D    mov         edx,734A74;'Data'
 00734692    call        @UStrCat3
 00734697    mov         ecx,dword ptr [ebp-9C]
 0073469D    mov         edx,dword ptr [ebp-8]
 007346A0    mov         eax,dword ptr [ebp-18]
 007346A3    mov         esi,dword ptr [eax]
 007346A5    call        dword ptr [esi+4];TIniFile.ReadString
 007346A8    cmp         dword ptr [ebp-98],0
>007346AF    je          007346BE
 007346B1    lea         eax,[ebp-10]
 007346B4    mov         edx,734ABC;', Enter'
 007346B9    call        @UStrCat
 007346BE    inc         ebx
 007346BF    dec         dword ptr [ebp-2C]
>007346C2    jne         007343B1
 007346C8    push        0
 007346CA    lea         eax,[ebp-14]
 007346CD    push        eax
 007346CE    mov         ecx,734A74;'Data'
 007346D3    mov         edx,dword ptr [ebp-8]
 007346D6    mov         eax,dword ptr [ebp-18]
 007346D9    mov         ebx,dword ptr [eax]
 007346DB    call        dword ptr [ebx+4];TIniFile.ReadString
 007346DE    cmp         dword ptr [ebp-14],0
>007346E2    je          00734768
 007346E8    lea         edx,[ebp-0A8]
 007346EE    mov         eax,dword ptr [ebp-14]
 007346F1    call        ExtractFileExt
 007346F6    mov         eax,dword ptr [ebp-0A8]
 007346FC    lea         edx,[ebp-0A4]
 00734702    call        LowerCase
 00734707    mov         eax,dword ptr [ebp-0A4]
 0073470D    mov         edx,734AD8;'.wav'
 00734712    call        @UStrEqual
>00734717    jne         0073474B
 00734719    cmp         dword ptr [ebp-10],0
>0073471D    je          0073472C
 0073471F    lea         eax,[ebp-10]
 00734722    mov         edx,734A50;', '
 00734727    call        @UStrCat
 0073472C    push        dword ptr [ebp-10]
 0073472F    push        734AF0;'PlaySound("'
 00734734    push        dword ptr [ebp-14]
 00734737    push        734AA8;'")'
 0073473C    lea         eax,[ebp-10]
 0073473F    mov         edx,4
 00734744    call        @UStrCatN
>00734749    jmp         00734768
 0073474B    push        dword ptr [ebp-10]
 0073474E    push        734B14;'Execute("'
 00734753    push        dword ptr [ebp-14]
 00734756    push        734AA8;'")'
 0073475B    lea         eax,[ebp-10]
 0073475E    mov         edx,4
 00734763    call        @UStrCatN
 00734768    cmp         dword ptr [ebp-10],0
>0073476C    jne         0073477B
 0073476E    lea         eax,[ebp-10]
 00734771    mov         edx,734B34;'var.DoNothing'
 00734776    call        @UStrLAsg
 0073477B    push        734B5C;'Said("'
 00734780    push        dword ptr [ebp-0C]
 00734783    push        734B78;'") => '
 00734788    push        dword ptr [ebp-10]
 0073478B    lea         eax,[ebp-0AC]
 00734791    mov         edx,4
 00734796    call        @UStrCatN
 0073479B    mov         edx,dword ptr [ebp-0AC]
 007347A1    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 007347A6    mov         eax,dword ptr [eax]
 007347A8    mov         eax,dword ptr [eax+394]
 007347AE    mov         eax,dword ptr [eax+2A4]
 007347B4    mov         ecx,dword ptr [eax]
 007347B6    call        dword ptr [ecx+38]
 007347B9    inc         dword ptr [ebp-1C]
 007347BC    dec         dword ptr [ebp-28]
>007347BF    jne         0073434A
 007347C5    xor         eax,eax
 007347C7    pop         edx
 007347C8    pop         ecx
 007347C9    pop         ecx
 007347CA    mov         dword ptr fs:[eax],edx
>007347CD    jmp         007347EA
>007347CF    jmp         @HandleOnException
 007347D4    dd          1
 007347D8    dd          00418C04;Exception
 007347DC    dd          007347E0
 007347E0    call        004FA644
 007347E5    call        @DoneExcept
 007347EA    xor         eax,eax
 007347EC    pop         edx
 007347ED    pop         ecx
 007347EE    pop         ecx
 007347EF    mov         dword ptr fs:[eax],edx
 007347F2    push        734807
 007347F7    mov         eax,dword ptr [ebp-18]
 007347FA    call        TObject.Free
 007347FF    ret
>00734800    jmp         @HandleFinally
>00734805    jmp         007347F7
 00734807    xor         eax,eax
 00734809    pop         edx
 0073480A    pop         ecx
 0073480B    pop         ecx
 0073480C    mov         dword ptr fs:[eax],edx
 0073480F    push        734839
 00734814    lea         eax,[ebp-0AC]
 0073481A    mov         edx,20
 0073481F    call        @UStrArrayClr
 00734824    lea         eax,[ebp-14]
 00734827    mov         edx,5
 0073482C    call        @UStrArrayClr
 00734831    ret
>00734832    jmp         @HandleFinally
>00734837    jmp         00734814
 00734839    pop         edi
 0073483A    pop         esi
 0073483B    pop         ebx
 0073483C    mov         esp,ebp
 0073483E    pop         ebp
 0073483F    ret
*}
end;

//00734B88
{*procedure sub_00734B88(?:UnicodeString; ?:?; ?:?);
begin
 00734B88    push        ebp
 00734B89    mov         ebp,esp
 00734B8B    add         esp,0FFFFFFF8
 00734B8E    push        ebx
 00734B8F    push        esi
 00734B90    push        edi
 00734B91    xor         ebx,ebx
 00734B93    mov         dword ptr [ebp-8],ebx
 00734B96    mov         esi,ecx
 00734B98    mov         edi,edx
 00734B9A    mov         dword ptr [ebp-4],eax
 00734B9D    mov         eax,dword ptr [ebp-4]
 00734BA0    call        @UStrAddRef
 00734BA5    xor         eax,eax
 00734BA7    push        ebp
 00734BA8    push        7352B9
 00734BAD    push        dword ptr fs:[eax]
 00734BB0    mov         dword ptr fs:[eax],esp
 00734BB3    mov         edx,dword ptr [ebp-4]
 00734BB6    mov         eax,7352D4;' '
 00734BBB    call        Pos
 00734BC0    mov         ebx,eax
 00734BC2    test        ebx,ebx
>00734BC4    jle         00734BE8
 00734BC6    lea         eax,[ebp-4]
 00734BC9    mov         ecx,1
 00734BCE    mov         edx,ebx
 00734BD0    call        @UStrDelete
 00734BD5    mov         edx,dword ptr [ebp-4]
 00734BD8    mov         eax,7352D4;' '
 00734BDD    call        Pos
 00734BE2    mov         ebx,eax
 00734BE4    test        ebx,ebx
>00734BE6    jg          00734BC6
 00734BE8    lea         edx,[ebp-8]
 00734BEB    mov         eax,dword ptr [ebp-4]
 00734BEE    call        LowerCase
 00734BF3    mov         eax,dword ptr [ebp-8]
 00734BF6    mov         edx,7352E4;'arrowup'
 00734BFB    call        @UStrEqual
>00734C00    jne         00734C14
 00734C02    lea         eax,[ebp-4]
 00734C05    mov         edx,735300;'UpArrow'
 00734C0A    call        @UStrLAsg
>00734C0F    jmp         00735275
 00734C14    mov         eax,dword ptr [ebp-8]
 00734C17    mov         edx,73531C;'arrowdown'
 00734C1C    call        @UStrEqual
>00734C21    jne         00734C35
 00734C23    lea         eax,[ebp-4]
 00734C26    mov         edx,73533C;'DownArrow'
 00734C2B    call        @UStrLAsg
>00734C30    jmp         00735275
 00734C35    mov         eax,dword ptr [ebp-8]
 00734C38    mov         edx,73535C;'arrowleft'
 00734C3D    call        @UStrEqual
>00734C42    jne         00734C56
 00734C44    lea         eax,[ebp-4]
 00734C47    mov         edx,73537C;'LeftArrow'
 00734C4C    call        @UStrLAsg
>00734C51    jmp         00735275
 00734C56    mov         eax,dword ptr [ebp-8]
 00734C59    mov         edx,73539C;'arrowright'
 00734C5E    call        @UStrEqual
>00734C63    jne         00734C77
 00734C65    lea         eax,[ebp-4]
 00734C68    mov         edx,7353C0;'RightArrow'
 00734C6D    call        @UStrLAsg
>00734C72    jmp         00735275
 00734C77    mov         eax,dword ptr [ebp-8]
 00734C7A    mov         edx,7353E4;'leftmousebutton(1)'
 00734C7F    call        @UStrEqual
>00734C84    jne         00734C98
 00734C86    lea         eax,[ebp-4]
 00734C89    mov         edx,735418;'Mouse.LeftButton'
 00734C8E    call        @UStrLAsg
>00734C93    jmp         00735275
 00734C98    mov         eax,dword ptr [ebp-8]
 00734C9B    mov         edx,735448;'rightmousebutton(2)'
 00734CA0    call        @UStrEqual
>00734CA5    jne         00734CB9
 00734CA7    lea         eax,[ebp-4]
 00734CAA    mov         edx,73547C;'Mouse.RightButton'
 00734CAF    call        @UStrLAsg
>00734CB4    jmp         00735275
 00734CB9    mov         eax,dword ptr [ebp-8]
 00734CBC    mov         edx,7354AC;'middlemousebutton(3)'
 00734CC1    call        @UStrEqual
>00734CC6    jne         00734CDA
 00734CC8    lea         eax,[ebp-4]
 00734CCB    mov         edx,7354E4;'Mouse.MiddleButton'
 00734CD0    call        @UStrLAsg
>00734CD5    jmp         00735275
 00734CDA    mov         eax,dword ptr [ebp-8]
 00734CDD    mov         edx,735518;'extramousebutton(4)'
 00734CE2    call        @UStrEqual
>00734CE7    jne         00734CFB
 00734CE9    lea         eax,[ebp-4]
 00734CEC    mov         edx,73554C;'Mouse.XButton1'
 00734CF1    call        @UStrLAsg
>00734CF6    jmp         00735275
 00734CFB    mov         eax,dword ptr [ebp-8]
 00734CFE    mov         edx,735578;'extramousebutton(5)'
 00734D03    call        @UStrEqual
>00734D08    jne         00734D1C
 00734D0A    lea         eax,[ebp-4]
 00734D0D    mov         edx,7355AC;'Mouse.XButton2'
 00734D12    call        @UStrLAsg
>00734D17    jmp         00735275
 00734D1C    mov         eax,dword ptr [ebp-8]
 00734D1F    mov         edx,7355D8;'mousewheelup'
 00734D24    call        @UStrEqual
>00734D29    jne         00734D3D
 00734D2B    lea         eax,[ebp-4]
 00734D2E    mov         edx,735600;'Mouse.WheelUp'
 00734D33    call        @UStrLAsg
>00734D38    jmp         00735275
 00734D3D    mov         eax,dword ptr [ebp-8]
 00734D40    mov         edx,735628;'mousewheeldown'
 00734D45    call        @UStrEqual
>00734D4A    jne         00734D5E
 00734D4C    lea         eax,[ebp-4]
 00734D4F    mov         edx,735654;'Mouse.WheelDown'
 00734D54    call        @UStrLAsg
>00734D59    jmp         00735275
 00734D5E    mov         eax,dword ptr [ebp-8]
 00734D61    mov         edx,735680;'mousewheelleft'
 00734D66    call        @UStrEqual
>00734D6B    jne         00734D7F
 00734D6D    lea         eax,[ebp-4]
 00734D70    mov         edx,7356AC;'Mouse.WheelLeft'
 00734D75    call        @UStrLAsg
>00734D7A    jmp         00735275
 00734D7F    mov         eax,dword ptr [ebp-8]
 00734D82    mov         edx,7356D8;'mousewheelright'
 00734D87    call        @UStrEqual
>00734D8C    jne         00734DA0
 00734D8E    lea         eax,[ebp-4]
 00734D91    mov         edx,735704;'Mouse.WheelRight'
 00734D96    call        @UStrLAsg
>00734D9B    jmp         00735275
 00734DA0    mov         eax,dword ptr [ebp-8]
 00734DA3    mov         edx,735734;'numpad+'
 00734DA8    call        @UStrEqual
>00734DAD    jne         00734DC1
 00734DAF    lea         eax,[ebp-4]
 00734DB2    mov         edx,735750;'NumpadPlus'
 00734DB7    call        @UStrLAsg
>00734DBC    jmp         00735275
 00734DC1    mov         eax,dword ptr [ebp-8]
 00734DC4    mov         edx,735774;'numpad-'
 00734DC9    call        @UStrEqual
>00734DCE    jne         00734DE2
 00734DD0    lea         eax,[ebp-4]
 00734DD3    mov         edx,735790;'NumpadMinus'
 00734DD8    call        @UStrLAsg
>00734DDD    jmp         00735275
 00734DE2    mov         eax,dword ptr [ebp-8]
 00734DE5    mov         edx,7357B4;'numpad*'
 00734DEA    call        @UStrEqual
>00734DEF    jne         00734E03
 00734DF1    lea         eax,[ebp-4]
 00734DF4    mov         edx,7357D0;'NumpadStar'
 00734DF9    call        @UStrLAsg
>00734DFE    jmp         00735275
 00734E03    mov         eax,dword ptr [ebp-8]
 00734E06    mov         edx,7357F4;'numpad/'
 00734E0B    call        @UStrEqual
>00734E10    jne         00734E24
 00734E12    lea         eax,[ebp-4]
 00734E15    mov         edx,735810;'NumpadSlash'
 00734E1A    call        @UStrLAsg
>00734E1F    jmp         00735275
 00734E24    mov         eax,dword ptr [ebp-8]
 00734E27    mov         edx,735834;'mediamycomputer'
 00734E2C    call        @UStrEqual
>00734E31    jne         00734E45
 00734E33    lea         eax,[ebp-4]
 00734E36    mov         edx,735860;'MyComputer'
 00734E3B    call        @UStrLAsg
>00734E40    jmp         00735275
 00734E45    mov         eax,dword ptr [ebp-8]
 00734E48    mov         edx,735884;'mediaemail'
 00734E4D    call        @UStrEqual
>00734E52    jne         00734E66
 00734E54    lea         eax,[ebp-4]
 00734E57    mov         edx,7358A8;'Email'
 00734E5C    call        @UStrLAsg
>00734E61    jmp         00735275
 00734E66    mov         eax,dword ptr [ebp-8]
 00734E69    mov         edx,7358C0;'mediacalculator'
 00734E6E    call        @UStrEqual
>00734E73    jne         00734E87
 00734E75    lea         eax,[ebp-4]
 00734E78    mov         edx,7358EC;'Calculator'
 00734E7D    call        @UStrLAsg
>00734E82    jmp         00735275
 00734E87    mov         eax,dword ptr [ebp-8]
 00734E8A    mov         edx,735910;'medianexttrack'
 00734E8F    call        @UStrEqual
>00734E94    jne         00734EA8
 00734E96    lea         eax,[ebp-4]
 00734E99    mov         edx,73593C;'NextTrack'
 00734E9E    call        @UStrLAsg
>00734EA3    jmp         00735275
 00734EA8    mov         eax,dword ptr [ebp-8]
 00734EAB    mov         edx,73595C;'mediabrowserforward'
 00734EB0    call        @UStrEqual
>00734EB5    jne         00734EC9
 00734EB7    lea         eax,[ebp-4]
 00734EBA    mov         edx,735990;'BrowserForward'
 00734EBF    call        @UStrLAsg
>00734EC4    jmp         00735275
 00734EC9    mov         eax,dword ptr [ebp-8]
 00734ECC    mov         edx,7359BC;'mediabrowserback'
 00734ED1    call        @UStrEqual
>00734ED6    jne         00734EEA
 00734ED8    lea         eax,[ebp-4]
 00734EDB    mov         edx,7359EC;'BrowserBack'
 00734EE0    call        @UStrLAsg
>00734EE5    jmp         00735275
 00734EEA    mov         eax,dword ptr [ebp-8]
 00734EED    mov         edx,735A10;'mediabrowserstop'
 00734EF2    call        @UStrEqual
>00734EF7    jne         00734F0B
 00734EF9    lea         eax,[ebp-4]
 00734EFC    mov         edx,735A40;'BrowserStop'
 00734F01    call        @UStrLAsg
>00734F06    jmp         00735275
 00734F0B    mov         eax,dword ptr [ebp-8]
 00734F0E    mov         edx,735A64;'mediabrowserrefresh'
 00734F13    call        @UStrEqual
>00734F18    jne         00734F2C
 00734F1A    lea         eax,[ebp-4]
 00734F1D    mov         edx,735A98;'BrowserRefresh'
 00734F22    call        @UStrLAsg
>00734F27    jmp         00735275
 00734F2C    mov         eax,dword ptr [ebp-8]
 00734F2F    mov         edx,735AC4;'mediabrowsersearch'
 00734F34    call        @UStrEqual
>00734F39    jne         00734F4D
 00734F3B    lea         eax,[ebp-4]
 00734F3E    mov         edx,735AF8;'BrowserSearch'
 00734F43    call        @UStrLAsg
>00734F48    jmp         00735275
 00734F4D    mov         eax,dword ptr [ebp-8]
 00734F50    mov         edx,735B20;'mediabrowserhome'
 00734F55    call        @UStrEqual
>00734F5A    jne         00734F6E
 00734F5C    lea         eax,[ebp-4]
 00734F5F    mov         edx,735B50;'BrowserHome'
 00734F64    call        @UStrLAsg
>00734F69    jmp         00735275
 00734F6E    mov         eax,dword ptr [ebp-8]
 00734F71    mov         edx,735B74;'mediabrowserfavorites'
 00734F76    call        @UStrEqual
>00734F7B    jne         00734F8F
 00734F7D    lea         eax,[ebp-4]
 00734F80    mov         edx,735BAC;'BrowserFavourites'
 00734F85    call        @UStrLAsg
>00734F8A    jmp         00735275
 00734F8F    mov         eax,dword ptr [ebp-8]
 00734F92    mov         edx,735BDC;'mediaprevioustrack'
 00734F97    call        @UStrEqual
>00734F9C    jne         00734FB0
 00734F9E    lea         eax,[ebp-4]
 00734FA1    mov         edx,735C10;'PreviousTrack'
 00734FA6    call        @UStrLAsg
>00734FAB    jmp         00735275
 00734FB0    mov         eax,dword ptr [ebp-8]
 00734FB3    mov         edx,735C38;'mediaplay/pause'
 00734FB8    call        @UStrEqual
>00734FBD    jne         00734FD1
 00734FBF    lea         eax,[ebp-4]
 00734FC2    mov         edx,735C64;'PlayPause'
 00734FC7    call        @UStrLAsg
>00734FCC    jmp         00735275
 00734FD1    mov         eax,dword ptr [ebp-8]
 00734FD4    mov         edx,735C84;'mediavolumemute'
 00734FD9    call        @UStrEqual
>00734FDE    jne         00734FF2
 00734FE0    lea         eax,[ebp-4]
 00734FE3    mov         edx,735CB0;'VolumeMute'
 00734FE8    call        @UStrLAsg
>00734FED    jmp         00735275
 00734FF2    mov         eax,dword ptr [ebp-8]
 00734FF5    mov         edx,735CD4;'mediavolumeup'
 00734FFA    call        @UStrEqual
>00734FFF    jne         00735013
 00735001    lea         eax,[ebp-4]
 00735004    mov         edx,735CFC;'VolumeUp'
 00735009    call        @UStrLAsg
>0073500E    jmp         00735275
 00735013    mov         eax,dword ptr [ebp-8]
 00735016    mov         edx,735D1C;'mediavolumedown'
 0073501B    call        @UStrEqual
>00735020    jne         00735034
 00735022    lea         eax,[ebp-4]
 00735025    mov         edx,735D48;'VolumeDown'
 0073502A    call        @UStrLAsg
>0073502F    jmp         00735275
 00735034    mov         eax,dword ptr [ebp-8]
 00735037    mov         edx,735D6C;'back-tick'
 0073503C    call        @UStrEqual
>00735041    jne         00735055
 00735043    lea         eax,[ebp-4]
 00735046    mov         edx,735D8C;'Console'
 0073504B    call        @UStrLAsg
>00735050    jmp         00735275
 00735055    mov         eax,dword ptr [ebp-8]
 00735058    mov         edx,735DA8;'back-slash[uk](ususe#)'
 0073505D    call        @UStrEqual
>00735062    jne         00735076
 00735064    lea         eax,[ebp-4]
 00735067    mov         edx,735DE4;'OEM_102'
 0073506C    call        @UStrLAsg
>00735071    jmp         00735275
 00735076    mov         eax,dword ptr [ebp-8]
 00735079    mov         edx,735E00;'windowslogoleft'
 0073507E    call        @UStrEqual
>00735083    jne         00735097
 00735085    lea         eax,[ebp-4]
 00735088    mov         edx,735E2C;'LeftWindows'
 0073508D    call        @UStrLAsg
>00735092    jmp         00735275
 00735097    mov         eax,dword ptr [ebp-8]
 0073509A    mov         edx,735E50;'windowslogoright'
 0073509F    call        @UStrEqual
>007350A4    jne         007350B8
 007350A6    lea         eax,[ebp-4]
 007350A9    mov         edx,735E80;'RightWindows'
 007350AE    call        @UStrLAsg
>007350B3    jmp         00735275
 007350B8    mov         eax,dword ptr [ebp-8]
 007350BB    mov         edx,735EA8;'altgr'
 007350C0    call        @UStrEqual
>007350C5    jne         007350D9
 007350C7    lea         eax,[ebp-4]
 007350CA    mov         edx,735EC0;'RightAlt'
 007350CF    call        @UStrLAsg
>007350D4    jmp         00735275
 007350D9    mov         eax,dword ptr [ebp-8]
 007350DC    mov         edx,735EE0;'semi-colon'
 007350E1    call        @UStrEqual
>007350E6    jne         007350FA
 007350E8    lea         eax,[ebp-4]
 007350EB    mov         edx,735F04;'semicolon'
 007350F0    call        @UStrLAsg
>007350F5    jmp         00735275
 007350FA    mov         eax,dword ptr [ebp-8]
 007350FD    mov         edx,735F24;'windowsmenu'
 00735102    call        @UStrEqual
>00735107    jne         0073511B
 00735109    lea         eax,[ebp-4]
 0073510C    mov         edx,735F48;'AppMenu'
 00735111    call        @UStrLAsg
>00735116    jmp         00735275
 0073511B    mov         eax,dword ptr [ebp-8]
 0073511E    mov         edx,735F64;'back-slash[us]/hash[uk]'
 00735123    call        @UStrEqual
>00735128    jne         0073513C
 0073512A    lea         eax,[ebp-4]
 0073512D    mov         edx,735FA0;'backslash'
 00735132    call        @UStrLAsg
>00735137    jmp         00735275
 0073513C    mov         eax,dword ptr [ebp-8]
 0073513F    mov         edx,735FC0;'1'
 00735144    call        @UStrEqual
>00735149    jne         0073515D
 0073514B    lea         eax,[ebp-4]
 0073514E    mov         edx,735FD0;'one'
 00735153    call        @UStrLAsg
>00735158    jmp         00735275
 0073515D    mov         eax,dword ptr [ebp-8]
 00735160    mov         edx,735FE4;'2'
 00735165    call        @UStrEqual
>0073516A    jne         0073517E
 0073516C    lea         eax,[ebp-4]
 0073516F    mov         edx,735FF4;'two'
 00735174    call        @UStrLAsg
>00735179    jmp         00735275
 0073517E    mov         eax,dword ptr [ebp-8]
 00735181    mov         edx,736008;'3'
 00735186    call        @UStrEqual
>0073518B    jne         0073519F
 0073518D    lea         eax,[ebp-4]
 00735190    mov         edx,736018;'three'
 00735195    call        @UStrLAsg
>0073519A    jmp         00735275
 0073519F    mov         eax,dword ptr [ebp-8]
 007351A2    mov         edx,736030;'4'
 007351A7    call        @UStrEqual
>007351AC    jne         007351C0
 007351AE    lea         eax,[ebp-4]
 007351B1    mov         edx,736040;'four'
 007351B6    call        @UStrLAsg
>007351BB    jmp         00735275
 007351C0    mov         eax,dword ptr [ebp-8]
 007351C3    mov         edx,736058;'5'
 007351C8    call        @UStrEqual
>007351CD    jne         007351E1
 007351CF    lea         eax,[ebp-4]
 007351D2    mov         edx,736068;'five'
 007351D7    call        @UStrLAsg
>007351DC    jmp         00735275
 007351E1    mov         eax,dword ptr [ebp-8]
 007351E4    mov         edx,736080;'6'
 007351E9    call        @UStrEqual
>007351EE    jne         007351FF
 007351F0    lea         eax,[ebp-4]
 007351F3    mov         edx,736090;'six'
 007351F8    call        @UStrLAsg
>007351FD    jmp         00735275
 007351FF    mov         eax,dword ptr [ebp-8]
 00735202    mov         edx,7360A4;'7'
 00735207    call        @UStrEqual
>0073520C    jne         0073521D
 0073520E    lea         eax,[ebp-4]
 00735211    mov         edx,7360B4;'seven'
 00735216    call        @UStrLAsg
>0073521B    jmp         00735275
 0073521D    mov         eax,dword ptr [ebp-8]
 00735220    mov         edx,7360CC;'8'
 00735225    call        @UStrEqual
>0073522A    jne         0073523B
 0073522C    lea         eax,[ebp-4]
 0073522F    mov         edx,7360DC;'eight'
 00735234    call        @UStrLAsg
>00735239    jmp         00735275
 0073523B    mov         eax,dword ptr [ebp-8]
 0073523E    mov         edx,7360F4;'9'
 00735243    call        @UStrEqual
>00735248    jne         00735259
 0073524A    lea         eax,[ebp-4]
 0073524D    mov         edx,736104;'nine'
 00735252    call        @UStrLAsg
>00735257    jmp         00735275
 00735259    mov         eax,dword ptr [ebp-8]
 0073525C    mov         edx,73611C;'0'
 00735261    call        @UStrEqual
>00735266    jne         00735275
 00735268    lea         eax,[ebp-4]
 0073526B    mov         edx,73612C;'zero'
 00735270    call        @UStrLAsg
 00735275    test        edi,edi
>00735277    je          00735294
 00735279    push        736144;'Toggle('
 0073527E    push        dword ptr [ebp-4]
 00735281    push        736160;')'
 00735286    mov         eax,esi
 00735288    mov         edx,3
 0073528D    call        @UStrCatN
>00735292    jmp         0073529E
 00735294    mov         eax,esi
 00735296    mov         edx,dword ptr [ebp-4]
 00735299    call        @UStrAsg
 0073529E    xor         eax,eax
 007352A0    pop         edx
 007352A1    pop         ecx
 007352A2    pop         ecx
 007352A3    mov         dword ptr fs:[eax],edx
 007352A6    push        7352C0
 007352AB    lea         eax,[ebp-8]
 007352AE    mov         edx,2
 007352B3    call        @UStrArrayClr
 007352B8    ret
>007352B9    jmp         @HandleFinally
>007352BE    jmp         007352AB
 007352C0    pop         edi
 007352C1    pop         esi
 007352C2    pop         ebx
 007352C3    pop         ecx
 007352C4    pop         ecx
 007352C5    pop         ebp
 007352C6    ret
end;*}

//00736164
{*procedure sub_00736164(?:?; ?:Integer; ?:?);
begin
 00736164    push        ebp
 00736165    mov         ebp,esp
 00736167    push        ecx
 00736168    mov         ecx,4
 0073616D    push        0
 0073616F    push        0
 00736171    dec         ecx
>00736172    jne         0073616D
 00736174    xchg        ecx,dword ptr [ebp-4]
 00736177    push        ebx
 00736178    push        esi
 00736179    push        edi
 0073617A    mov         esi,ecx
 0073617C    mov         dword ptr [ebp-0C],edx
 0073617F    mov         dword ptr [ebp-4],eax
 00736182    mov         eax,dword ptr [ebp-4]
 00736185    call        @UStrAddRef
 0073618A    xor         eax,eax
 0073618C    push        ebp
 0073618D    push        736375
 00736192    push        dword ptr fs:[eax]
 00736195    mov         dword ptr fs:[eax],esp
 00736198    mov         eax,esi
 0073619A    call        @UStrClr
 0073619F    mov         edx,dword ptr [ebp-4]
 007361A2    mov         eax,736390;','
 007361A7    call        Pos
 007361AC    mov         ebx,eax
 007361AE    test        ebx,ebx
>007361B0    jg          007361C1
 007361B2    mov         eax,dword ptr [ebp-4]
 007361B5    test        eax,eax
>007361B7    je          007361BE
 007361B9    sub         eax,4
 007361BC    mov         eax,dword ptr [eax]
 007361BE    lea         ebx,[eax+1]
 007361C1    mov         byte ptr [ebp-0D],0
 007361C5    mov         byte ptr [ebp-0E],0
>007361C9    jmp         007362FF
 007361CE    lea         eax,[ebp-14]
 007361D1    push        eax
 007361D2    mov         ecx,ebx
 007361D4    dec         ecx
 007361D5    mov         edx,1
 007361DA    mov         eax,dword ptr [ebp-4]
 007361DD    call        @UStrCopy
 007361E2    mov         eax,dword ptr [ebp-14]
 007361E5    lea         edx,[ebp-8]
 007361E8    call        Trim
 007361ED    lea         edx,[ebp-18]
 007361F0    mov         eax,dword ptr [ebp-8]
 007361F3    call        LowerCase
 007361F8    mov         eax,dword ptr [ebp-18]
 007361FB    mov         edx,7363A0;'cycle stop'
 00736200    call        @UStrEqual
>00736205    je          0073634D
 0073620B    lea         eax,[ebp-20]
 0073620E    push        eax
 0073620F    mov         ecx,6
 00736214    mov         edx,1
 00736219    mov         eax,dword ptr [ebp-8]
 0073621C    call        @UStrCopy
 00736221    mov         eax,dword ptr [ebp-20]
 00736224    lea         edx,[ebp-1C]
 00736227    call        LowerCase
 0073622C    mov         eax,dword ptr [ebp-1C]
 0073622F    mov         edx,7363C4;'pause '
 00736234    call        @UStrEqual
>00736239    jne         00736283
 0073623B    cmp         dword ptr [esi],0
>0073623E    je          0073624C
 00736240    mov         eax,esi
 00736242    mov         edx,7363E0;', '
 00736247    call        @UStrCat
 0073624C    lea         eax,[ebp-8]
 0073624F    mov         ecx,6
 00736254    mov         edx,1
 00736259    call        @UStrDelete
 0073625E    push        dword ptr [esi]
 00736260    push        7363F4;'wait('
 00736265    push        dword ptr [ebp-8]
 00736268    push        73640C;')'
 0073626D    mov         eax,esi
 0073626F    mov         edx,4
 00736274    call        @UStrCatN
 00736279    mov         byte ptr [ebp-0D],0
 0073627D    mov         byte ptr [ebp-0E],1
>00736281    jmp         007362CE
 00736283    lea         ecx,[ebp-24]
 00736286    xor         edx,edx
 00736288    mov         eax,dword ptr [ebp-8]
 0073628B    call        00734B88
 00736290    mov         edx,dword ptr [ebp-24]
 00736293    lea         eax,[ebp-8]
 00736296    call        @UStrLAsg
 0073629B    cmp         byte ptr [ebp-0D],0
>0073629F    je          007362AF
 007362A1    mov         eax,esi
 007362A3    mov         edx,73641C;'+'
 007362A8    call        @UStrCat
>007362AD    jmp         007362C0
 007362AF    cmp         dword ptr [esi],0
>007362B2    je          007362C0
 007362B4    mov         eax,esi
 007362B6    mov         edx,7363E0;', '
 007362BB    call        @UStrCat
 007362C0    mov         eax,esi
 007362C2    mov         edx,dword ptr [ebp-8]
 007362C5    call        @UStrCat
 007362CA    mov         byte ptr [ebp-0D],1
 007362CE    lea         eax,[ebp-4]
 007362D1    mov         ecx,ebx
 007362D3    mov         edx,1
 007362D8    call        @UStrDelete
 007362DD    mov         edx,dword ptr [ebp-4]
 007362E0    mov         eax,736390;','
 007362E5    call        Pos
 007362EA    mov         ebx,eax
 007362EC    test        ebx,ebx
>007362EE    jg          007362FF
 007362F0    mov         edi,dword ptr [ebp-4]
 007362F3    test        edi,edi
>007362F5    je          007362FC
 007362F7    sub         edi,4
 007362FA    mov         edi,dword ptr [edi]
 007362FC    lea         ebx,[edi+1]
 007362FF    cmp         dword ptr [ebp-4],0
>00736303    jne         007361CE
 00736309    cmp         dword ptr [ebp-0C],0
>0073630D    je          0073632F
 0073630F    cmp         byte ptr [ebp-0E],0
>00736313    jne         0073632F
 00736315    push        73642C;'Toggle('
 0073631A    push        dword ptr [esi]
 0073631C    push        73640C;')'
 00736321    mov         eax,esi
 00736323    mov         edx,3
 00736328    call        @UStrCatN
>0073632D    jmp         0073634D
 0073632F    cmp         byte ptr [ebp-0E],0
>00736333    je          0073634D
 00736335    push        736448;'('
 0073633A    push        dword ptr [esi]
 0073633C    push        73640C;')'
 00736341    mov         eax,esi
 00736343    mov         edx,3
 00736348    call        @UStrCatN
 0073634D    xor         eax,eax
 0073634F    pop         edx
 00736350    pop         ecx
 00736351    pop         ecx
 00736352    mov         dword ptr fs:[eax],edx
 00736355    push        73637C
 0073635A    lea         eax,[ebp-24]
 0073635D    mov         edx,5
 00736362    call        @UStrArrayClr
 00736367    lea         eax,[ebp-8]
 0073636A    mov         edx,2
 0073636F    call        @UStrArrayClr
 00736374    ret
>00736375    jmp         @HandleFinally
>0073637A    jmp         0073635A
 0073637C    pop         edi
 0073637D    pop         esi
 0073637E    pop         ebx
 0073637F    mov         esp,ebp
 00736381    pop         ebp
 00736382    ret
end;*}

//0073644C
{*procedure sub_0073644C(?:?; ?:?; ?:?; ?:?);
begin
 0073644C    push        ebp
 0073644D    mov         ebp,esp
 0073644F    push        0
 00736451    push        0
 00736453    push        0
 00736455    push        0
 00736457    push        0
 00736459    push        0
 0073645B    push        ebx
 0073645C    push        esi
 0073645D    push        edi
 0073645E    mov         dword ptr [ebp-8],ecx
 00736461    mov         esi,edx
 00736463    mov         edi,eax
 00736465    mov         ebx,dword ptr [ebp+8]
 00736468    xor         eax,eax
 0073646A    push        ebp
 0073646B    push        7367D2
 00736470    push        dword ptr fs:[eax]
 00736473    mov         dword ptr fs:[eax],esp
 00736476    push        7367F0;'var.set'
 0073647B    lea         edx,[ebp-0C]
 0073647E    mov         eax,edi
 00736480    call        IntToStr
 00736485    push        dword ptr [ebp-0C]
 00736488    push        73680C;'diag'
 0073648D    lea         edx,[ebp-10]
 00736490    mov         eax,esi
 00736492    call        IntToStr
 00736497    push        dword ptr [ebp-10]
 0073649A    lea         eax,[ebp-4]
 0073649D    mov         edx,4
 007364A2    call        @UStrCatN
 007364A7    cmp         esi,1
>007364AA    jne         007364BA
 007364AC    mov         eax,ebx
 007364AE    mov         edx,736824;'(|Joystick.Pos2D| > var.set'
 007364B3    call        @UStrAsg
>007364B8    jmp         007364C6
 007364BA    mov         eax,ebx
 007364BC    mov         edx,736868;'(|Joystick.Pos2DJoy2| > var.set'
 007364C1    call        @UStrAsg
 007364C6    push        dword ptr [ebx]
 007364C8    lea         edx,[ebp-14]
 007364CB    mov         eax,edi
 007364CD    call        IntToStr
 007364D2    push        dword ptr [ebp-14]
 007364D5    push        7368B4;'dz'
 007364DA    lea         edx,[ebp-18]
 007364DD    mov         eax,esi
 007364DF    call        IntToStr
 007364E4    push        dword ptr [ebp-18]
 007364E7    push        7368C8;') and '
 007364EC    mov         eax,ebx
 007364EE    mov         edx,5
 007364F3    call        @UStrCatN
 007364F8    mov         eax,esi
 007364FA    add         eax,eax
 007364FC    lea         eax,[eax+eax*4]
 007364FF    add         eax,dword ptr [ebp-8]
 00736502    add         eax,0FFFFFFF5
 00736505    cmp         eax,11
>00736508    ja          007367AF
 0073650E    jmp         dword ptr [eax*4+736515]
 0073650E    dd          0073655D
 0073650E    dd          0073657D
 0073650E    dd          0073659D
 0073650E    dd          007365C5
 0073650E    dd          007365ED
 0073650E    dd          00736615
 0073650E    dd          0073663D
 0073650E    dd          00736665
 0073650E    dd          007367AF
 0073650E    dd          007367AF
 0073650E    dd          0073668D
 0073650E    dd          007366AD
 0073650E    dd          007366CD
 0073650E    dd          007366F5
 0073650E    dd          0073671D
 0073650E    dd          00736742
 0073650E    dd          00736767
 0073650E    dd          0073678C
 0073655D    push        dword ptr [ebx]
 0073655F    push        7368E4;'(|atan2(Joystick.x, -Joystick.y)| <= (90-'
 00736564    push        dword ptr [ebp-4]
 00736567    push        736944;')/2)'
 0073656C    mov         eax,ebx
 0073656E    mov         edx,4
 00736573    call        @UStrCatN
>00736578    jmp         007367AF
 0073657D    push        dword ptr [ebx]
 0073657F    push        73695C;'(|atan2(Joystick.x, -Joystick.y)| >= 180 - (90-'
 00736584    push        dword ptr [ebp-4]
 00736587    push        736944;')/2)'
 0073658C    mov         eax,ebx
 0073658E    mov         edx,4
 00736593    call        @UStrCatN
>00736598    jmp         007367AF
 0073659D    push        dword ptr [ebx]
 0073659F    push        7369C8;'(-90+(90-'
 007365A4    push        dword ptr [ebp-4]
 007365A7    push        7369E8;')/2 > atan2(Joystick.x, -Joystick.y) > -90-(90-'
 007365AC    push        dword ptr [ebp-4]
 007365AF    push        736944;')/2)'
 007365B4    mov         eax,ebx
 007365B6    mov         edx,6
 007365BB    call        @UStrCatN
>007365C0    jmp         007367AF
 007365C5    push        dword ptr [ebx]
 007365C7    push        736A54;'(90-(90-'
 007365CC    push        dword ptr [ebp-4]
 007365CF    push        736A74;')/2 < atan2(Joystick.x, -Joystick.y) < 90+(90-'
 007365D4    push        dword ptr [ebp-4]
 007365D7    push        736944;')/2)'
 007365DC    mov         eax,ebx
 007365DE    mov         edx,6
 007365E3    call        @UStrCatN
>007365E8    jmp         007367AF
 007365ED    push        dword ptr [ebx]
 007365EF    push        736AE0;'(45 - '
 007365F4    push        dword ptr [ebp-4]
 007365F7    push        736AFC;'/2 < atan2(Joystick.x, -Joystick.y) < 45 + '
 007365FC    push        dword ptr [ebp-4]
 007365FF    push        736B60;'/2)'
 00736604    mov         eax,ebx
 00736606    mov         edx,6
 0073660B    call        @UStrCatN
>00736610    jmp         007367AF
 00736615    push        dword ptr [ebx]
 00736617    push        736B74;'(135 - '
 0073661C    push        dword ptr [ebp-4]
 0073661F    push        736B90;'/2 < atan2(Joystick.x, -Joystick.y) < 135 + '
 00736624    push        dword ptr [ebp-4]
 00736627    push        736B60;'/2)'
 0073662C    mov         eax,ebx
 0073662E    mov         edx,6
 00736633    call        @UStrCatN
>00736638    jmp         007367AF
 0073663D    push        dword ptr [ebx]
 0073663F    push        736BF8;'(-135 + '
 00736644    push        dword ptr [ebp-4]
 00736647    push        736C18;'/2 > atan2(Joystick.x, -Joystick.y) > -135 - '
 0073664C    push        dword ptr [ebp-4]
 0073664F    push        736B60;'/2)'
 00736654    mov         eax,ebx
 00736656    mov         edx,6
 0073665B    call        @UStrCatN
>00736660    jmp         007367AF
 00736665    push        dword ptr [ebx]
 00736667    push        736C80;'(-45 + '
 0073666C    push        dword ptr [ebp-4]
 0073666F    push        736C9C;'/2 > atan2(Joystick.x, -Joystick.y) > -45 - '
 00736674    push        dword ptr [ebp-4]
 00736677    push        736B60;'/2)'
 0073667C    mov         eax,ebx
 0073667E    mov         edx,6
 00736683    call        @UStrCatN
>00736688    jmp         007367AF
 0073668D    push        dword ptr [ebx]
 0073668F    push        736D04;'(|atan2(Joystick.roll, -Joystick.z)| <= (90-'
 00736694    push        dword ptr [ebp-4]
 00736697    push        736944;')/2)'
 0073669C    mov         eax,ebx
 0073669E    mov         edx,4
 007366A3    call        @UStrCatN
>007366A8    jmp         007367AF
 007366AD    push        dword ptr [ebx]
 007366AF    push        736D6C;'(|atan2(Joystick.roll, -Joystick.z)| >= 180 - (90-'
 007366B4    push        dword ptr [ebp-4]
 007366B7    push        736944;')/2)'
 007366BC    mov         eax,ebx
 007366BE    mov         edx,4
 007366C3    call        @UStrCatN
>007366C8    jmp         007367AF
 007366CD    push        dword ptr [ebx]
 007366CF    push        7369C8;'(-90+(90-'
 007366D4    push        dword ptr [ebp-4]
 007366D7    push        736DE0;'/2) > atan2(Joystick.roll, -Joystick.z) > -90-(90-'
 007366DC    push        dword ptr [ebp-4]
 007366DF    push        736944;')/2)'
 007366E4    mov         eax,ebx
 007366E6    mov         edx,6
 007366EB    call        @UStrCatN
>007366F0    jmp         007367AF
 007366F5    push        dword ptr [ebx]
 007366F7    push        736A54;'(90-(90-'
 007366FC    push        dword ptr [ebp-4]
 007366FF    push        736E54;'/2) < atan2(Joystick.roll, -Joystick.z) < 90+(90-'
 00736704    push        dword ptr [ebp-4]
 00736707    push        736944;')/2)'
 0073670C    mov         eax,ebx
 0073670E    mov         edx,6
 00736713    call        @UStrCatN
>00736718    jmp         007367AF
 0073671D    push        dword ptr [ebx]
 0073671F    push        736AE0;'(45 - '
 00736724    push        dword ptr [ebp-4]
 00736727    push        736EC4;'/2 < atan2(Joystick.roll, -Joystick.z) < 45 + '
 0073672C    push        dword ptr [ebp-4]
 0073672F    push        736B60;'/2)'
 00736734    mov         eax,ebx
 00736736    mov         edx,6
 0073673B    call        @UStrCatN
>00736740    jmp         007367AF
 00736742    push        dword ptr [ebx]
 00736744    push        736B74;'(135 - '
 00736749    push        dword ptr [ebp-4]
 0073674C    push        736F30;'/2 < atan2(Joystick.roll, -Joystick.z) < 135 + '
 00736751    push        dword ptr [ebp-4]
 00736754    push        736B60;'/2)'
 00736759    mov         eax,ebx
 0073675B    mov         edx,6
 00736760    call        @UStrCatN
>00736765    jmp         007367AF
 00736767    push        dword ptr [ebx]
 00736769    push        736BF8;'(-135 + '
 0073676E    push        dword ptr [ebp-4]
 00736771    push        736F9C;'/2 > atan2(Joystick.roll, -Joystick.z) > -135 - '
 00736776    push        dword ptr [ebp-4]
 00736779    push        736B60;'/2)'
 0073677E    mov         eax,ebx
 00736780    mov         edx,6
 00736785    call        @UStrCatN
>0073678A    jmp         007367AF
 0073678C    push        dword ptr [ebx]
 0073678E    push        736C80;'(-45 + '
 00736793    push        dword ptr [ebp-4]
 00736796    push        73700C;'/2 > atan2(Joystick.roll, -Joystick.z) > -45 - '
 0073679B    push        dword ptr [ebp-4]
 0073679E    push        736B60;'/2)'
 007367A3    mov         eax,ebx
 007367A5    mov         edx,6
 007367AA    call        @UStrCatN
 007367AF    xor         eax,eax
 007367B1    pop         edx
 007367B2    pop         ecx
 007367B3    pop         ecx
 007367B4    mov         dword ptr fs:[eax],edx
 007367B7    push        7367D9
 007367BC    lea         eax,[ebp-18]
 007367BF    mov         edx,4
 007367C4    call        @UStrArrayClr
 007367C9    lea         eax,[ebp-4]
 007367CC    call        @UStrClr
 007367D1    ret
>007367D2    jmp         @HandleFinally
>007367D7    jmp         007367BC
 007367D9    pop         edi
 007367DA    pop         esi
 007367DB    pop         ebx
 007367DC    mov         esp,ebp
 007367DE    pop         ebp
 007367DF    ret         4
end;*}

//0073706C
{*procedure sub_0073706C(?:?; ?:?; ?:?; ?:?);
begin
 0073706C    push        ebp
 0073706D    mov         ebp,esp
 0073706F    push        0
 00737071    push        0
 00737073    push        0
 00737075    push        0
 00737077    push        0
 00737079    push        0
 0073707B    push        ebx
 0073707C    push        esi
 0073707D    push        edi
 0073707E    mov         dword ptr [ebp-8],ecx
 00737081    mov         esi,edx
 00737083    mov         edi,eax
 00737085    mov         ebx,dword ptr [ebp+8]
 00737088    xor         eax,eax
 0073708A    push        ebp
 0073708B    push        7372BA
 00737090    push        dword ptr fs:[eax]
 00737093    mov         dword ptr fs:[eax],esp
 00737096    cmp         dword ptr [ebp-8],4
>0073709A    jle         007370AE
 0073709C    push        ebx
 0073709D    mov         ecx,dword ptr [ebp-8]
 007370A0    mov         edx,esi
 007370A2    mov         eax,edi
 007370A4    call        0073644C
>007370A9    jmp         00737297
 007370AE    push        7372D8;'var.set'
 007370B3    lea         edx,[ebp-0C]
 007370B6    mov         eax,edi
 007370B8    call        IntToStr
 007370BD    push        dword ptr [ebp-0C]
 007370C0    push        7372F4;'diag'
 007370C5    lea         edx,[ebp-10]
 007370C8    mov         eax,esi
 007370CA    call        IntToStr
 007370CF    push        dword ptr [ebp-10]
 007370D2    lea         eax,[ebp-4]
 007370D5    mov         edx,4
 007370DA    call        @UStrCatN
 007370DF    cmp         esi,1
>007370E2    jne         007370F2
 007370E4    mov         eax,ebx
 007370E6    mov         edx,73730C;'(|Joystick.Pos2D| > var.set'
 007370EB    call        @UStrAsg
>007370F0    jmp         007370FE
 007370F2    mov         eax,ebx
 007370F4    mov         edx,737350;'(|Joystick.Pos2DJoy2| > var.set'
 007370F9    call        @UStrAsg
 007370FE    push        dword ptr [ebx]
 00737100    lea         edx,[ebp-14]
 00737103    mov         eax,edi
 00737105    call        IntToStr
 0073710A    push        dword ptr [ebp-14]
 0073710D    push        73739C;'dz'
 00737112    lea         edx,[ebp-18]
 00737115    mov         eax,esi
 00737117    call        IntToStr
 0073711C    push        dword ptr [ebp-18]
 0073711F    push        7373B0;') and '
 00737124    mov         eax,ebx
 00737126    mov         edx,5
 0073712B    call        @UStrCatN
 00737130    mov         eax,esi
 00737132    add         eax,eax
 00737134    lea         eax,[eax+eax*4]
 00737137    add         eax,dword ptr [ebp-8]
 0073713A    add         eax,0FFFFFFF5
 0073713D    cmp         eax,0D
>00737140    ja          00737297
 00737146    jmp         dword ptr [eax*4+73714D]
 00737146    dd          00737185
 00737146    dd          007371A5
 00737146    dd          007371C5
 00737146    dd          007371ED
 00737146    dd          00737297
 00737146    dd          00737297
 00737146    dd          00737297
 00737146    dd          00737297
 00737146    dd          00737297
 00737146    dd          00737297
 00737146    dd          00737215
 00737146    dd          00737232
 00737146    dd          0073724F
 00737146    dd          00737274
 00737185    push        dword ptr [ebx]
 00737187    push        7373CC;'(|atan2(Joystick.x, -Joystick.y)| <= (90-'
 0073718C    push        dword ptr [ebp-4]
 0073718F    push        73742C;')/2)'
 00737194    mov         eax,ebx
 00737196    mov         edx,4
 0073719B    call        @UStrCatN
>007371A0    jmp         00737297
 007371A5    push        dword ptr [ebx]
 007371A7    push        737444;'(|atan2(Joystick.x, -Joystick.y)| >= 180 - (90-'
 007371AC    push        dword ptr [ebp-4]
 007371AF    push        73742C;')/2)'
 007371B4    mov         eax,ebx
 007371B6    mov         edx,4
 007371BB    call        @UStrCatN
>007371C0    jmp         00737297
 007371C5    push        dword ptr [ebx]
 007371C7    push        7374B0;'(-45 + '
 007371CC    push        dword ptr [ebp-4]
 007371CF    push        7374CC;'/2 > atan2(Joystick.x, -Joystick.y) > -135 - '
 007371D4    push        dword ptr [ebp-4]
 007371D7    push        737534;'/2)'
 007371DC    mov         eax,ebx
 007371DE    mov         edx,6
 007371E3    call        @UStrCatN
>007371E8    jmp         00737297
 007371ED    push        dword ptr [ebx]
 007371EF    push        737548;'(45 - '
 007371F4    push        dword ptr [ebp-4]
 007371F7    push        737564;'/2 < atan2(Joystick.x, -Joystick.y) < 135 + '
 007371FC    push        dword ptr [ebp-4]
 007371FF    push        737534;'/2)'
 00737204    mov         eax,ebx
 00737206    mov         edx,6
 0073720B    call        @UStrCatN
>00737210    jmp         00737297
 00737215    push        dword ptr [ebx]
 00737217    push        7375CC;'(|atan2(Joystick.roll, -Joystick.z)| <= (90-'
 0073721C    push        dword ptr [ebp-4]
 0073721F    push        73742C;')/2)'
 00737224    mov         eax,ebx
 00737226    mov         edx,4
 0073722B    call        @UStrCatN
>00737230    jmp         00737297
 00737232    push        dword ptr [ebx]
 00737234    push        737634;'(|atan2(Joystick.roll, -Joystick.z)| >= 180 - (90-'
 00737239    push        dword ptr [ebp-4]
 0073723C    push        73742C;')/2)'
 00737241    mov         eax,ebx
 00737243    mov         edx,4
 00737248    call        @UStrCatN
>0073724D    jmp         00737297
 0073724F    push        dword ptr [ebx]
 00737251    push        7374B0;'(-45 + '
 00737256    push        dword ptr [ebp-4]
 00737259    push        7376A8;'/2 > atan2(Joystick.roll, -Joystick.z) > -135 - '
 0073725E    push        dword ptr [ebp-4]
 00737261    push        737534;'/2)'
 00737266    mov         eax,ebx
 00737268    mov         edx,6
 0073726D    call        @UStrCatN
>00737272    jmp         00737297
 00737274    push        dword ptr [ebx]
 00737276    push        737548;'(45 - '
 0073727B    push        dword ptr [ebp-4]
 0073727E    push        737718;'/2 < atan2(Joystick.roll, -Joystick.z) < 135 + '
 00737283    push        dword ptr [ebp-4]
 00737286    push        737534;'/2)'
 0073728B    mov         eax,ebx
 0073728D    mov         edx,6
 00737292    call        @UStrCatN
 00737297    xor         eax,eax
 00737299    pop         edx
 0073729A    pop         ecx
 0073729B    pop         ecx
 0073729C    mov         dword ptr fs:[eax],edx
 0073729F    push        7372C1
 007372A4    lea         eax,[ebp-18]
 007372A7    mov         edx,4
 007372AC    call        @UStrArrayClr
 007372B1    lea         eax,[ebp-4]
 007372B4    call        @UStrClr
 007372B9    ret
>007372BA    jmp         @HandleFinally
>007372BF    jmp         007372A4
 007372C1    pop         edi
 007372C2    pop         esi
 007372C3    pop         ebx
 007372C4    mov         esp,ebp
 007372C6    pop         ebp
 007372C7    ret         4
end;*}

//00737778
{*procedure sub_00737778(?:?; ?:?; ?:?; ?:?);
begin
 00737778    push        ebp
 00737779    mov         ebp,esp
 0073777B    push        0
 0073777D    push        0
 0073777F    push        0
 00737781    push        0
 00737783    push        0
 00737785    push        0
 00737787    push        ebx
 00737788    push        esi
 00737789    push        edi
 0073778A    mov         dword ptr [ebp-8],ecx
 0073778D    mov         esi,edx
 0073778F    mov         edi,eax
 00737791    mov         ebx,dword ptr [ebp+8]
 00737794    xor         eax,eax
 00737796    push        ebp
 00737797    push        7379C6
 0073779C    push        dword ptr fs:[eax]
 0073779F    mov         dword ptr fs:[eax],esp
 007377A2    cmp         dword ptr [ebp-8],4
>007377A6    jle         007377BA
 007377A8    push        ebx
 007377A9    mov         ecx,dword ptr [ebp-8]
 007377AC    mov         edx,esi
 007377AE    mov         eax,edi
 007377B0    call        0073644C
>007377B5    jmp         007379A3
 007377BA    push        7379E4;'var.set'
 007377BF    lea         edx,[ebp-0C]
 007377C2    mov         eax,edi
 007377C4    call        IntToStr
 007377C9    push        dword ptr [ebp-0C]
 007377CC    push        737A00;'diag'
 007377D1    lea         edx,[ebp-10]
 007377D4    mov         eax,esi
 007377D6    call        IntToStr
 007377DB    push        dword ptr [ebp-10]
 007377DE    lea         eax,[ebp-4]
 007377E1    mov         edx,4
 007377E6    call        @UStrCatN
 007377EB    cmp         esi,1
>007377EE    jne         007377FE
 007377F0    mov         eax,ebx
 007377F2    mov         edx,737A18;'(|Joystick.Pos2D| > var.set'
 007377F7    call        @UStrAsg
>007377FC    jmp         0073780A
 007377FE    mov         eax,ebx
 00737800    mov         edx,737A5C;'(|Joystick.Pos2DJoy2| > var.set'
 00737805    call        @UStrAsg
 0073780A    push        dword ptr [ebx]
 0073780C    lea         edx,[ebp-14]
 0073780F    mov         eax,edi
 00737811    call        IntToStr
 00737816    push        dword ptr [ebp-14]
 00737819    push        737AA8;'dz'
 0073781E    lea         edx,[ebp-18]
 00737821    mov         eax,esi
 00737823    call        IntToStr
 00737828    push        dword ptr [ebp-18]
 0073782B    push        737ABC;') and '
 00737830    mov         eax,ebx
 00737832    mov         edx,5
 00737837    call        @UStrCatN
 0073783C    mov         eax,esi
 0073783E    add         eax,eax
 00737840    lea         eax,[eax+eax*4]
 00737843    add         eax,dword ptr [ebp-8]
 00737846    add         eax,0FFFFFFF5
 00737849    cmp         eax,0D
>0073784C    ja          007379A3
 00737852    jmp         dword ptr [eax*4+737859]
 00737852    dd          00737891
 00737852    dd          007378B1
 00737852    dd          007378D1
 00737852    dd          007378F9
 00737852    dd          007379A3
 00737852    dd          007379A3
 00737852    dd          007379A3
 00737852    dd          007379A3
 00737852    dd          007379A3
 00737852    dd          007379A3
 00737852    dd          00737921
 00737852    dd          0073793E
 00737852    dd          0073795B
 00737852    dd          00737980
 00737891    push        dword ptr [ebx]
 00737893    push        737AD8;'(|atan2(Joystick.x, -Joystick.y)| <= 45 + '
 00737898    push        dword ptr [ebp-4]
 0073789B    push        737B3C;'/2)'
 007378A0    mov         eax,ebx
 007378A2    mov         edx,4
 007378A7    call        @UStrCatN
>007378AC    jmp         007379A3
 007378B1    push        dword ptr [ebx]
 007378B3    push        737B50;'(|atan2(Joystick.x, -Joystick.y)| >= 135 -'
 007378B8    push        dword ptr [ebp-4]
 007378BB    push        737B3C;'/2)'
 007378C0    mov         eax,ebx
 007378C2    mov         edx,4
 007378C7    call        @UStrCatN
>007378CC    jmp         007379A3
 007378D1    push        dword ptr [ebx]
 007378D3    push        737BB4;'(-90+(90-'
 007378D8    push        dword ptr [ebp-4]
 007378DB    push        737BD4;')/2 > atan2(Joystick.x, -Joystick.y) > -90-(90-'
 007378E0    push        dword ptr [ebp-4]
 007378E3    push        737C40;')/2)'
 007378E8    mov         eax,ebx
 007378EA    mov         edx,6
 007378EF    call        @UStrCatN
>007378F4    jmp         007379A3
 007378F9    push        dword ptr [ebx]
 007378FB    push        737C58;'(90-(90-'
 00737900    push        dword ptr [ebp-4]
 00737903    push        737C78;')/2 < atan2(Joystick.x, -Joystick.y) < 90+(90-'
 00737908    push        dword ptr [ebp-4]
 0073790B    push        737C40;')/2)'
 00737910    mov         eax,ebx
 00737912    mov         edx,6
 00737917    call        @UStrCatN
>0073791C    jmp         007379A3
 00737921    push        dword ptr [ebx]
 00737923    push        737CE4;'(|atan2(Joystick.roll, -Joystick.z)| <= 45 + '
 00737928    push        dword ptr [ebp-4]
 0073792B    push        737B3C;'/2)'
 00737930    mov         eax,ebx
 00737932    mov         edx,4
 00737937    call        @UStrCatN
>0073793C    jmp         007379A3
 0073793E    push        dword ptr [ebx]
 00737940    push        737D4C;'(|atan2(Joystick.roll, -Joystick.z)| >= 135 -'
 00737945    push        dword ptr [ebp-4]
 00737948    push        737B3C;'/2)'
 0073794D    mov         eax,ebx
 0073794F    mov         edx,4
 00737954    call        @UStrCatN
>00737959    jmp         007379A3
 0073795B    push        dword ptr [ebx]
 0073795D    push        737BB4;'(-90+(90-'
 00737962    push        dword ptr [ebp-4]
 00737965    push        737DB4;')/2 > atan2(Joystick.roll, -Joystick.z) > -90-(90-'
 0073796A    push        dword ptr [ebp-4]
 0073796D    push        737C40;')/2)'
 00737972    mov         eax,ebx
 00737974    mov         edx,6
 00737979    call        @UStrCatN
>0073797E    jmp         007379A3
 00737980    push        dword ptr [ebx]
 00737982    push        737C58;'(90-(90-'
 00737987    push        dword ptr [ebp-4]
 0073798A    push        737E28;')/2 < atan2(Joystick.roll, -Joystick.z) < 90+(90-'
 0073798F    push        dword ptr [ebp-4]
 00737992    push        737C40;')/2)'
 00737997    mov         eax,ebx
 00737999    mov         edx,6
 0073799E    call        @UStrCatN
 007379A3    xor         eax,eax
 007379A5    pop         edx
 007379A6    pop         ecx
 007379A7    pop         ecx
 007379A8    mov         dword ptr fs:[eax],edx
 007379AB    push        7379CD
 007379B0    lea         eax,[ebp-18]
 007379B3    mov         edx,4
 007379B8    call        @UStrArrayClr
 007379BD    lea         eax,[ebp-4]
 007379C0    call        @UStrClr
 007379C5    ret
>007379C6    jmp         @HandleFinally
>007379CB    jmp         007379B0
 007379CD    pop         edi
 007379CE    pop         esi
 007379CF    pop         ebx
 007379D0    mov         esp,ebp
 007379D2    pop         ebp
 007379D3    ret         4
end;*}

//00737E8C
{*procedure sub_00737E8C(?:?; ?:?; ?:?; ?:?);
begin
 00737E8C    push        ebp
 00737E8D    mov         ebp,esp
 00737E8F    push        0
 00737E91    push        0
 00737E93    push        0
 00737E95    push        ebx
 00737E96    push        esi
 00737E97    push        edi
 00737E98    mov         edi,ecx
 00737E9A    mov         esi,edx
 00737E9C    mov         dword ptr [ebp-4],eax
 00737E9F    mov         ebx,dword ptr [ebp+8]
 00737EA2    xor         eax,eax
 00737EA4    push        ebp
 00737EA5    push        737FF6
 00737EAA    push        dword ptr fs:[eax]
 00737EAD    mov         dword ptr fs:[eax],esp
 00737EB0    cmp         edi,4
>00737EB3    jle         00737EC7
 00737EB5    push        ebx
 00737EB6    mov         ecx,edi
 00737EB8    mov         edx,esi
 00737EBA    mov         eax,dword ptr [ebp-4]
 00737EBD    call        0073644C
>00737EC2    jmp         00737FDB
 00737EC7    cmp         esi,1
>00737ECA    jne         00737EDA
 00737ECC    mov         eax,ebx
 00737ECE    mov         edx,738014;'(|Joystick.Pos2D| > var.set'
 00737ED3    call        @UStrAsg
>00737ED8    jmp         00737EE6
 00737EDA    mov         eax,ebx
 00737EDC    mov         edx,738058;'(|Joystick.Pos2DJoy2| > var.set'
 00737EE1    call        @UStrAsg
 00737EE6    push        dword ptr [ebx]
 00737EE8    lea         edx,[ebp-8]
 00737EEB    mov         eax,dword ptr [ebp-4]
 00737EEE    call        IntToStr
 00737EF3    push        dword ptr [ebp-8]
 00737EF6    push        7380A4;'dz'
 00737EFB    lea         edx,[ebp-0C]
 00737EFE    mov         eax,esi
 00737F00    call        IntToStr
 00737F05    push        dword ptr [ebp-0C]
 00737F08    push        7380B8;') and (Joystick.'
 00737F0D    mov         eax,ebx
 00737F0F    mov         edx,5
 00737F14    call        @UStrCatN
 00737F19    mov         eax,esi
 00737F1B    add         eax,eax
 00737F1D    lea         eax,[eax+eax*4]
 00737F20    add         edi,eax
 00737F22    add         edi,0FFFFFFF5
 00737F25    cmp         edi,0D
>00737F28    ja          00737FDB
 00737F2E    jmp         dword ptr [edi*4+737F35]
 00737F2E    dd          00737F6D
 00737F2E    dd          00737F7B
 00737F2E    dd          00737F89
 00737F2E    dd          00737F97
 00737F2E    dd          00737FDB
 00737F2E    dd          00737FDB
 00737F2E    dd          00737FDB
 00737F2E    dd          00737FDB
 00737F2E    dd          00737FDB
 00737F2E    dd          00737FDB
 00737F2E    dd          00737FA5
 00737F2E    dd          00737FB3
 00737F2E    dd          00737FC1
 00737F2E    dd          00737FCF
 00737F6D    mov         eax,ebx
 00737F6F    mov         edx,7380E8;'Y < -|Joystick.X|)'
 00737F74    call        @UStrCat
>00737F79    jmp         00737FDB
 00737F7B    mov         eax,ebx
 00737F7D    mov         edx,73811C;'Y > |Joystick.X|)'
 00737F82    call        @UStrCat
>00737F87    jmp         00737FDB
 00737F89    mov         eax,ebx
 00737F8B    mov         edx,73814C;'X < -|Joystick.Y|)'
 00737F90    call        @UStrCat
>00737F95    jmp         00737FDB
 00737F97    mov         eax,ebx
 00737F99    mov         edx,738180;'X > |Joystick.Y|)'
 00737F9E    call        @UStrCat
>00737FA3    jmp         00737FDB
 00737FA5    mov         eax,ebx
 00737FA7    mov         edx,7381B0;'Z < -|Joystick.Roll|)'
 00737FAC    call        @UStrCat
>00737FB1    jmp         00737FDB
 00737FB3    mov         eax,ebx
 00737FB5    mov         edx,7381E8;'Z > |Joystick.Roll|)'
 00737FBA    call        @UStrCat
>00737FBF    jmp         00737FDB
 00737FC1    mov         eax,ebx
 00737FC3    mov         edx,738220;'Roll < -|Joystick.X|)'
 00737FC8    call        @UStrCat
>00737FCD    jmp         00737FDB
 00737FCF    mov         eax,ebx
 00737FD1    mov         edx,738258;'Roll > |Joystick.X|)'
 00737FD6    call        @UStrCat
 00737FDB    xor         eax,eax
 00737FDD    pop         edx
 00737FDE    pop         ecx
 00737FDF    pop         ecx
 00737FE0    mov         dword ptr fs:[eax],edx
 00737FE3    push        737FFD
 00737FE8    lea         eax,[ebp-0C]
 00737FEB    mov         edx,2
 00737FF0    call        @UStrArrayClr
 00737FF5    ret
>00737FF6    jmp         @HandleFinally
>00737FFB    jmp         00737FE8
 00737FFD    pop         edi
 00737FFE    pop         esi
 00737FFF    pop         ebx
 00738000    mov         esp,ebp
 00738002    pop         ebp
 00738003    ret         4
end;*}

//00738284
{*procedure sub_00738284(?:?; ?:?; ?:?; ?:?);
begin
 00738284    push        ebp
 00738285    mov         ebp,esp
 00738287    push        0
 00738289    push        0
 0073828B    push        0
 0073828D    push        ebx
 0073828E    push        esi
 0073828F    push        edi
 00738290    mov         edi,ecx
 00738292    mov         esi,edx
 00738294    mov         dword ptr [ebp-4],eax
 00738297    mov         ebx,dword ptr [ebp+8]
 0073829A    xor         eax,eax
 0073829C    push        ebp
 0073829D    push        7383EE
 007382A2    push        dword ptr fs:[eax]
 007382A5    mov         dword ptr fs:[eax],esp
 007382A8    cmp         edi,4
>007382AB    jg          007382BF
 007382AD    push        ebx
 007382AE    mov         ecx,edi
 007382B0    mov         edx,esi
 007382B2    mov         eax,dword ptr [ebp-4]
 007382B5    call        0073644C
>007382BA    jmp         007383D3
 007382BF    cmp         esi,1
>007382C2    jne         007382D2
 007382C4    mov         eax,ebx
 007382C6    mov         edx,73840C;'(|Joystick.Pos2D| > var.set'
 007382CB    call        @UStrAsg
>007382D0    jmp         007382DE
 007382D2    mov         eax,ebx
 007382D4    mov         edx,738450;'(|Joystick.Pos2DJoy2| > var.set'
 007382D9    call        @UStrAsg
 007382DE    push        dword ptr [ebx]
 007382E0    lea         edx,[ebp-8]
 007382E3    mov         eax,dword ptr [ebp-4]
 007382E6    call        IntToStr
 007382EB    push        dword ptr [ebp-8]
 007382EE    push        73849C;'dz'
 007382F3    lea         edx,[ebp-0C]
 007382F6    mov         eax,esi
 007382F8    call        IntToStr
 007382FD    push        dword ptr [ebp-0C]
 00738300    push        7384B0;') and (Joystick.'
 00738305    mov         eax,ebx
 00738307    mov         edx,5
 0073830C    call        @UStrCatN
 00738311    mov         eax,esi
 00738313    add         eax,eax
 00738315    lea         eax,[eax+eax*4]
 00738318    add         edi,eax
 0073831A    add         edi,0FFFFFFF1
 0073831D    cmp         edi,0D
>00738320    ja          007383D3
 00738326    jmp         dword ptr [edi*4+73832D]
 00738326    dd          00738365
 00738326    dd          00738373
 00738326    dd          00738381
 00738326    dd          0073838F
 00738326    dd          007383D3
 00738326    dd          007383D3
 00738326    dd          007383D3
 00738326    dd          007383D3
 00738326    dd          007383D3
 00738326    dd          007383D3
 00738326    dd          0073839D
 00738326    dd          007383AB
 00738326    dd          007383B9
 00738326    dd          007383C7
 00738365    mov         eax,ebx
 00738367    mov         edx,7384E0;'Y < 0) and (Joystick.X >= 0)'
 0073836C    call        @UStrCat
>00738371    jmp         007383D3
 00738373    mov         eax,ebx
 00738375    mov         edx,738528;'Y > 0) and (Joystick.X >= 0)'
 0073837A    call        @UStrCat
>0073837F    jmp         007383D3
 00738381    mov         eax,ebx
 00738383    mov         edx,738570;'Y > 0) and (Joystick.X <= 0)'
 00738388    call        @UStrCat
>0073838D    jmp         007383D3
 0073838F    mov         eax,ebx
 00738391    mov         edx,7385B8;'Y < 0) and (Joystick.X <= 0)'
 00738396    call        @UStrCat
>0073839B    jmp         007383D3
 0073839D    mov         eax,ebx
 0073839F    mov         edx,738600;'Z < 0) and (Joystick.Roll >= 0)'
 007383A4    call        @UStrCat
>007383A9    jmp         007383D3
 007383AB    mov         eax,ebx
 007383AD    mov         edx,73864C;'Z > 0) and (Joystick.Roll >= 0)'
 007383B2    call        @UStrCat
>007383B7    jmp         007383D3
 007383B9    mov         eax,ebx
 007383BB    mov         edx,738698;'Z > 0) and (Joystick.Roll <= 0)'
 007383C0    call        @UStrCat
>007383C5    jmp         007383D3
 007383C7    mov         eax,ebx
 007383C9    mov         edx,7386E4;'Z < 0) and (Joystick.Roll <= 0)'
 007383CE    call        @UStrCat
 007383D3    xor         eax,eax
 007383D5    pop         edx
 007383D6    pop         ecx
 007383D7    pop         ecx
 007383D8    mov         dword ptr fs:[eax],edx
 007383DB    push        7383F5
 007383E0    lea         eax,[ebp-0C]
 007383E3    mov         edx,2
 007383E8    call        @UStrArrayClr
 007383ED    ret
>007383EE    jmp         @HandleFinally
>007383F3    jmp         007383E0
 007383F5    pop         edi
 007383F6    pop         esi
 007383F7    pop         ebx
 007383F8    mov         esp,ebp
 007383FA    pop         ebp
 007383FB    ret         4
end;*}

//00738724
{*procedure sub_00738724(?:?; ?:?; ?:?; ?:?);
begin
 00738724    push        ebp
 00738725    mov         ebp,esp
 00738727    push        ecx
 00738728    mov         ecx,4
 0073872D    push        0
 0073872F    push        0
 00738731    dec         ecx
>00738732    jne         0073872D
 00738734    xchg        ecx,dword ptr [ebp-4]
 00738737    push        ebx
 00738738    push        esi
 00738739    push        edi
 0073873A    mov         esi,ecx
 0073873C    mov         edi,edx
 0073873E    mov         dword ptr [ebp-4],eax
 00738741    mov         ebx,dword ptr [ebp+8]
 00738744    xor         eax,eax
 00738746    push        ebp
 00738747    push        73892E
 0073874C    push        dword ptr fs:[eax]
 0073874F    mov         dword ptr fs:[eax],esp
 00738752    cmp         esi,4
>00738755    jle         00738769
 00738757    push        ebx
 00738758    mov         ecx,esi
 0073875A    mov         edx,edi
 0073875C    mov         eax,dword ptr [ebp-4]
 0073875F    call        0073644C
>00738764    jmp         00738913
 00738769    mov         eax,ebx
 0073876B    mov         edx,73894C;'(Joystick.'
 00738770    call        @UStrAsg
 00738775    mov         eax,edi
 00738777    add         eax,eax
 00738779    lea         eax,[eax+eax*4]
 0073877C    add         esi,eax
 0073877E    add         esi,0FFFFFFF5
 00738781    cmp         esi,0D
>00738784    ja          00738913
 0073878A    jmp         dword ptr [esi*4+738791]
 0073878A    dd          007387C9
 0073878A    dd          007387F4
 0073878A    dd          0073881F
 0073878A    dd          0073884A
 0073878A    dd          00738913
 0073878A    dd          00738913
 0073878A    dd          00738913
 0073878A    dd          00738913
 0073878A    dd          00738913
 0073878A    dd          00738913
 0073878A    dd          00738875
 0073878A    dd          0073889D
 0073878A    dd          007388C5
 0073878A    dd          007388ED
 007387C9    push        dword ptr [ebx]
 007387CB    push        738970;'Y < -var.set'
 007387D0    lea         edx,[ebp-8]
 007387D3    mov         eax,dword ptr [ebp-4]
 007387D6    call        IntToStr
 007387DB    push        dword ptr [ebp-8]
 007387DE    push        738998;'dz1)'
 007387E3    mov         eax,ebx
 007387E5    mov         edx,4
 007387EA    call        @UStrCatN
>007387EF    jmp         00738913
 007387F4    push        dword ptr [ebx]
 007387F6    push        7389B0;'Y > var.set'
 007387FB    lea         edx,[ebp-0C]
 007387FE    mov         eax,dword ptr [ebp-4]
 00738801    call        IntToStr
 00738806    push        dword ptr [ebp-0C]
 00738809    push        738998;'dz1)'
 0073880E    mov         eax,ebx
 00738810    mov         edx,4
 00738815    call        @UStrCatN
>0073881A    jmp         00738913
 0073881F    push        dword ptr [ebx]
 00738821    push        7389D4;'X < -var.set'
 00738826    lea         edx,[ebp-10]
 00738829    mov         eax,dword ptr [ebp-4]
 0073882C    call        IntToStr
 00738831    push        dword ptr [ebp-10]
 00738834    push        738998;'dz1)'
 00738839    mov         eax,ebx
 0073883B    mov         edx,4
 00738840    call        @UStrCatN
>00738845    jmp         00738913
 0073884A    push        dword ptr [ebx]
 0073884C    push        7389FC;'X > var.set'
 00738851    lea         edx,[ebp-14]
 00738854    mov         eax,dword ptr [ebp-4]
 00738857    call        IntToStr
 0073885C    push        dword ptr [ebp-14]
 0073885F    push        738998;'dz1)'
 00738864    mov         eax,ebx
 00738866    mov         edx,4
 0073886B    call        @UStrCatN
>00738870    jmp         00738913
 00738875    push        dword ptr [ebx]
 00738877    push        738A20;'Z < -var.set'
 0073887C    lea         edx,[ebp-18]
 0073887F    mov         eax,dword ptr [ebp-4]
 00738882    call        IntToStr
 00738887    push        dword ptr [ebp-18]
 0073888A    push        738A48;'dz2)'
 0073888F    mov         eax,ebx
 00738891    mov         edx,4
 00738896    call        @UStrCatN
>0073889B    jmp         00738913
 0073889D    push        dword ptr [ebx]
 0073889F    push        738A60;'Z > var.set'
 007388A4    lea         edx,[ebp-1C]
 007388A7    mov         eax,dword ptr [ebp-4]
 007388AA    call        IntToStr
 007388AF    push        dword ptr [ebp-1C]
 007388B2    push        738A48;'dz2)'
 007388B7    mov         eax,ebx
 007388B9    mov         edx,4
 007388BE    call        @UStrCatN
>007388C3    jmp         00738913
 007388C5    push        dword ptr [ebx]
 007388C7    push        738A84;'Roll < -var.set'
 007388CC    lea         edx,[ebp-20]
 007388CF    mov         eax,dword ptr [ebp-4]
 007388D2    call        IntToStr
 007388D7    push        dword ptr [ebp-20]
 007388DA    push        738A48;'dz2)'
 007388DF    mov         eax,ebx
 007388E1    mov         edx,4
 007388E6    call        @UStrCatN
>007388EB    jmp         00738913
 007388ED    push        dword ptr [ebx]
 007388EF    push        738AB0;'Roll > var.set'
 007388F4    lea         edx,[ebp-24]
 007388F7    mov         eax,dword ptr [ebp-4]
 007388FA    call        IntToStr
 007388FF    push        dword ptr [ebp-24]
 00738902    push        738A48;'dz2)'
 00738907    mov         eax,ebx
 00738909    mov         edx,4
 0073890E    call        @UStrCatN
 00738913    xor         eax,eax
 00738915    pop         edx
 00738916    pop         ecx
 00738917    pop         ecx
 00738918    mov         dword ptr fs:[eax],edx
 0073891B    push        738935
 00738920    lea         eax,[ebp-24]
 00738923    mov         edx,8
 00738928    call        @UStrArrayClr
 0073892D    ret
>0073892E    jmp         @HandleFinally
>00738933    jmp         00738920
 00738935    pop         edi
 00738936    pop         esi
 00738937    pop         ebx
 00738938    mov         esp,ebp
 0073893A    pop         ebp
 0073893B    ret         4
end;*}

//00738AD0
{*procedure sub_00738AD0(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00738AD0    push        ebp
 00738AD1    mov         ebp,esp
 00738AD3    push        ecx
 00738AD4    push        ebx
 00738AD5    push        esi
 00738AD6    push        edi
 00738AD7    mov         esi,ecx
 00738AD9    mov         ebx,edx
 00738ADB    mov         dword ptr [ebp-4],eax
 00738ADE    mov         edi,dword ptr [ebp+0C]
 00738AE1    mov         eax,dword ptr [ebp-4]
 00738AE4    call        @UStrAddRef
 00738AE9    xor         eax,eax
 00738AEB    push        ebp
 00738AEC    push        738BD9
 00738AF1    push        dword ptr fs:[eax]
 00738AF4    mov         dword ptr fs:[eax],esp
 00738AF7    cmp         dword ptr [ebp-4],0
>00738AFB    jne         00738B11
 00738AFD    mov         eax,dword ptr [ebp+8]
 00738B00    push        eax
 00738B01    mov         ecx,edi
 00738B03    mov         edx,esi
 00738B05    mov         eax,ebx
 00738B07    call        00738724
>00738B0C    jmp         00738BC3
 00738B11    mov         eax,dword ptr [ebp-4]
 00738B14    mov         edx,738BF4;'fourway'
 00738B19    call        @UStrEqual
>00738B1E    jne         00738B34
 00738B20    mov         eax,dword ptr [ebp+8]
 00738B23    push        eax
 00738B24    mov         ecx,edi
 00738B26    mov         edx,esi
 00738B28    mov         eax,ebx
 00738B2A    call        00737E8C
>00738B2F    jmp         00738BC3
 00738B34    mov         eax,dword ptr [ebp-4]
 00738B37    mov         edx,738C10;'diagonal'
 00738B3C    call        @UStrEqual
>00738B41    jne         00738B54
 00738B43    mov         eax,dword ptr [ebp+8]
 00738B46    push        eax
 00738B47    mov         ecx,edi
 00738B49    mov         edx,esi
 00738B4B    mov         eax,ebx
 00738B4D    call        00738284
>00738B52    jmp         00738BC3
 00738B54    mov         eax,dword ptr [ebp-4]
 00738B57    mov         edx,738C30;'eightway'
 00738B5C    call        @UStrEqual
>00738B61    jne         00738B74
 00738B63    mov         eax,dword ptr [ebp+8]
 00738B66    push        eax
 00738B67    mov         ecx,edi
 00738B69    mov         edx,esi
 00738B6B    mov         eax,ebx
 00738B6D    call        0073644C
>00738B72    jmp         00738BC3
 00738B74    mov         eax,dword ptr [ebp-4]
 00738B77    mov         edx,738C50;'horizontal'
 00738B7C    call        @UStrEqual
>00738B81    jne         00738B94
 00738B83    mov         eax,dword ptr [ebp+8]
 00738B86    push        eax
 00738B87    mov         ecx,edi
 00738B89    mov         edx,esi
 00738B8B    mov         eax,ebx
 00738B8D    call        0073706C
>00738B92    jmp         00738BC3
 00738B94    mov         eax,dword ptr [ebp-4]
 00738B97    mov         edx,738C74;'vertical'
 00738B9C    call        @UStrEqual
>00738BA1    jne         00738BB4
 00738BA3    mov         eax,dword ptr [ebp+8]
 00738BA6    push        eax
 00738BA7    mov         ecx,edi
 00738BA9    mov         edx,esi
 00738BAB    mov         eax,ebx
 00738BAD    call        00737778
>00738BB2    jmp         00738BC3
 00738BB4    mov         eax,dword ptr [ebp+8]
 00738BB7    push        eax
 00738BB8    mov         ecx,edi
 00738BBA    mov         edx,esi
 00738BBC    mov         eax,ebx
 00738BBE    call        00738724
 00738BC3    xor         eax,eax
 00738BC5    pop         edx
 00738BC6    pop         ecx
 00738BC7    pop         ecx
 00738BC8    mov         dword ptr fs:[eax],edx
 00738BCB    push        738BE0
 00738BD0    lea         eax,[ebp-4]
 00738BD3    call        @UStrClr
 00738BD8    ret
>00738BD9    jmp         @HandleFinally
>00738BDE    jmp         00738BD0
 00738BE0    pop         edi
 00738BE1    pop         esi
 00738BE2    pop         ebx
 00738BE3    pop         ecx
 00738BE4    pop         ebp
 00738BE5    ret         8
end;*}

//00738C88
{*procedure sub_00738C88(?:?; ?:?);
begin
 00738C88    push        ebx
 00738C89    push        esi
 00738C8A    mov         ebx,edx
 00738C8C    mov         esi,eax
 00738C8E    mov         eax,ebx
 00738C90    mov         edx,738D58;'(Joystick.Pov1'
 00738C95    call        @UStrAsg
 00738C9A    cmp         esi,8
>00738C9D    ja          00738D3C
 00738CA3    jmp         dword ptr [esi*4+738CAA]
 00738CA3    dd          00738D3C
 00738CA3    dd          00738CCE
 00738CA3    dd          00738CDC
 00738CA3    dd          00738CEA
 00738CA3    dd          00738CF8
 00738CA3    dd          00738D06
 00738CA3    dd          00738D14
 00738CA3    dd          00738D22
 00738CA3    dd          00738D30
 00738CCE    mov         eax,ebx
 00738CD0    mov         edx,738D84;'Up and (not Joystick.Pov1Left) and (not Joystick.Pov1Right)'
 00738CD5    call        @UStrCat
>00738CDA    jmp         00738D3C
 00738CDC    mov         eax,ebx
 00738CDE    mov         edx,738E08;'Down and (not Joystick.Pov1Left) and (not Joystick.Pov1Right)'
 00738CE3    call        @UStrCat
>00738CE8    jmp         00738D3C
 00738CEA    mov         eax,ebx
 00738CEC    mov         edx,738E90;'Left and (not Joystick.Pov1Up) and (not Joystick.Pov1Down)'
 00738CF1    call        @UStrCat
>00738CF6    jmp         00738D3C
 00738CF8    mov         eax,ebx
 00738CFA    mov         edx,738F14;'Right and (not Joystick.Pov1Up) and (not Joystick.Pov1Down)'
 00738CFF    call        @UStrCat
>00738D04    jmp         00738D3C
 00738D06    mov         eax,ebx
 00738D08    mov         edx,738F98;'Up and Joystick.Pov1Right'
 00738D0D    call        @UStrCat
>00738D12    jmp         00738D3C
 00738D14    mov         eax,ebx
 00738D16    mov         edx,738FD8;'Down and Joystick.Pov1Right'
 00738D1B    call        @UStrCat
>00738D20    jmp         00738D3C
 00738D22    mov         eax,ebx
 00738D24    mov         edx,73901C;'Down and Joystick.Pov1Left'
 00738D29    call        @UStrCat
>00738D2E    jmp         00738D3C
 00738D30    mov         eax,ebx
 00738D32    mov         edx,739060;'Up and Joystick.Pov1Left'
 00738D37    call        @UStrCat
 00738D3C    mov         eax,ebx
 00738D3E    mov         edx,7390A0;')'
 00738D43    call        @UStrCat
 00738D48    pop         esi
 00738D49    pop         ebx
 00738D4A    ret
end;*}

//007390A4
{*procedure sub_007390A4(?:?; ?:?);
begin
 007390A4    push        ebx
 007390A5    push        esi
 007390A6    mov         ebx,edx
 007390A8    mov         esi,eax
 007390AA    mov         eax,ebx
 007390AC    mov         edx,739174;'(Joystick.Pov1'
 007390B1    call        @UStrAsg
 007390B6    cmp         esi,8
>007390B9    ja          00739158
 007390BF    jmp         dword ptr [esi*4+7390C6]
 007390BF    dd          00739158
 007390BF    dd          007390EA
 007390BF    dd          007390F8
 007390BF    dd          00739106
 007390BF    dd          00739114
 007390BF    dd          00739122
 007390BF    dd          00739130
 007390BF    dd          0073913E
 007390BF    dd          0073914C
 007390EA    mov         eax,ebx
 007390EC    mov         edx,7391A0;'Up and (not Joystick.Pov1Left) and (not Joystick.Pov1Right)'
 007390F1    call        @UStrCat
>007390F6    jmp         00739158
 007390F8    mov         eax,ebx
 007390FA    mov         edx,739224;'Down and (not Joystick.Pov1Left) and (not Joystick.Pov1Right)'
 007390FF    call        @UStrCat
>00739104    jmp         00739158
 00739106    mov         eax,ebx
 00739108    mov         edx,7392AC;'Left'
 0073910D    call        @UStrCat
>00739112    jmp         00739158
 00739114    mov         eax,ebx
 00739116    mov         edx,7392C4;'Right'
 0073911B    call        @UStrCat
>00739120    jmp         00739158
 00739122    mov         eax,ebx
 00739124    mov         edx,7392DC;'Up and Joystick.Pov1Right'
 00739129    call        @UStrCat
>0073912E    jmp         00739158
 00739130    mov         eax,ebx
 00739132    mov         edx,73931C;'Down and Joystick.Pov1Right'
 00739137    call        @UStrCat
>0073913C    jmp         00739158
 0073913E    mov         eax,ebx
 00739140    mov         edx,739360;'Down and Joystick.Pov1Left'
 00739145    call        @UStrCat
>0073914A    jmp         00739158
 0073914C    mov         eax,ebx
 0073914E    mov         edx,7393A4;'Up and Joystick.Pov1Left'
 00739153    call        @UStrCat
 00739158    mov         eax,ebx
 0073915A    mov         edx,7393E4;')'
 0073915F    call        @UStrCat
 00739164    pop         esi
 00739165    pop         ebx
 00739166    ret
end;*}

//007393E8
{*procedure sub_007393E8(?:?; ?:?);
begin
 007393E8    push        ebx
 007393E9    push        esi
 007393EA    mov         ebx,edx
 007393EC    mov         esi,eax
 007393EE    mov         eax,ebx
 007393F0    mov         edx,7394B8;'(Joystick.Pov1'
 007393F5    call        @UStrAsg
 007393FA    cmp         esi,8
>007393FD    ja          0073949C
 00739403    jmp         dword ptr [esi*4+73940A]
 00739403    dd          0073949C
 00739403    dd          0073942E
 00739403    dd          0073943C
 00739403    dd          0073944A
 00739403    dd          00739458
 00739403    dd          00739466
 00739403    dd          00739474
 00739403    dd          00739482
 00739403    dd          00739490
 0073942E    mov         eax,ebx
 00739430    mov         edx,7394E4;'Up'
 00739435    call        @UStrCat
>0073943A    jmp         0073949C
 0073943C    mov         eax,ebx
 0073943E    mov         edx,7394F8;'Down'
 00739443    call        @UStrCat
>00739448    jmp         0073949C
 0073944A    mov         eax,ebx
 0073944C    mov         edx,739510;'Left and (not Joystick.Pov1Up) and (not Joystick.Pov1Down)'
 00739451    call        @UStrCat
>00739456    jmp         0073949C
 00739458    mov         eax,ebx
 0073945A    mov         edx,739594;'Right and (not Joystick.Pov1Up) and (not Joystick.Pov1Down)'
 0073945F    call        @UStrCat
>00739464    jmp         0073949C
 00739466    mov         eax,ebx
 00739468    mov         edx,739618;'Up and Joystick.Pov1Right'
 0073946D    call        @UStrCat
>00739472    jmp         0073949C
 00739474    mov         eax,ebx
 00739476    mov         edx,739658;'Down and Joystick.Pov1Right'
 0073947B    call        @UStrCat
>00739480    jmp         0073949C
 00739482    mov         eax,ebx
 00739484    mov         edx,73969C;'Down and Joystick.Pov1Left'
 00739489    call        @UStrCat
>0073948E    jmp         0073949C
 00739490    mov         eax,ebx
 00739492    mov         edx,7396E0;'Up and Joystick.Pov1Left'
 00739497    call        @UStrCat
 0073949C    mov         eax,ebx
 0073949E    mov         edx,739720;')'
 007394A3    call        @UStrCat
 007394A8    pop         esi
 007394A9    pop         ebx
 007394AA    ret
end;*}

//00739724
{*procedure sub_00739724(?:?; ?:?);
begin
 00739724    push        ebx
 00739725    push        esi
 00739726    mov         ebx,edx
 00739728    mov         esi,eax
 0073972A    cmp         esi,4
>0073972D    jle         0073973B
 0073972F    mov         edx,ebx
 00739731    mov         eax,esi
 00739733    call        00738C88
 00739738    pop         esi
 00739739    pop         ebx
 0073973A    ret
 0073973B    mov         eax,ebx
 0073973D    mov         edx,7397A8;'(Joystick.Pov1'
 00739742    call        @UStrAsg
 00739747    dec         esi
>00739748    je          00739755
 0073974A    dec         esi
>0073974B    je          00739763
 0073974D    dec         esi
>0073974E    je          00739771
 00739750    dec         esi
>00739751    je          0073977F
>00739753    jmp         0073978B
 00739755    mov         eax,ebx
 00739757    mov         edx,7397D4;'Up'
 0073975C    call        @UStrCat
>00739761    jmp         0073978B
 00739763    mov         eax,ebx
 00739765    mov         edx,7397E8;'Down'
 0073976A    call        @UStrCat
>0073976F    jmp         0073978B
 00739771    mov         eax,ebx
 00739773    mov         edx,739800;'Left'
 00739778    call        @UStrCat
>0073977D    jmp         0073978B
 0073977F    mov         eax,ebx
 00739781    mov         edx,739818;'Right'
 00739786    call        @UStrCat
 0073978B    mov         eax,ebx
 0073978D    mov         edx,739830;')'
 00739792    call        @UStrCat
 00739797    pop         esi
 00739798    pop         ebx
 00739799    ret
end;*}

//00739834
{*procedure sub_00739834(?:?; ?:?; ?:UnicodeString);
begin
 00739834    push        ebp
 00739835    mov         ebp,esp
 00739837    push        ecx
 00739838    push        ebx
 00739839    push        esi
 0073983A    mov         esi,ecx
 0073983C    mov         ebx,edx
 0073983E    mov         dword ptr [ebp-4],eax
 00739841    mov         eax,dword ptr [ebp-4]
 00739844    call        @UStrAddRef
 00739849    xor         eax,eax
 0073984B    push        ebp
 0073984C    push        73990C
 00739851    push        dword ptr fs:[eax]
 00739854    mov         dword ptr fs:[eax],esp
 00739857    cmp         dword ptr [ebp-4],0
>0073985B    jne         0073986B
 0073985D    mov         edx,esi
 0073985F    mov         eax,ebx
 00739861    call        00739724
>00739866    jmp         007398F6
 0073986B    mov         eax,dword ptr [ebp-4]
 0073986E    mov         edx,739924;'fourway'
 00739873    call        @UStrEqual
>00739878    jne         00739885
 0073987A    mov         edx,esi
 0073987C    mov         eax,ebx
 0073987E    call        00738C88
>00739883    jmp         007398F6
 00739885    mov         eax,dword ptr [ebp-4]
 00739888    mov         edx,739940;'diagonal'
 0073988D    call        @UStrEqual
>00739892    jne         0073989F
 00739894    mov         edx,esi
 00739896    mov         eax,ebx
 00739898    call        00738C88
>0073989D    jmp         007398F6
 0073989F    mov         eax,dword ptr [ebp-4]
 007398A2    mov         edx,739960;'eightway'
 007398A7    call        @UStrEqual
>007398AC    jne         007398B9
 007398AE    mov         edx,esi
 007398B0    mov         eax,ebx
 007398B2    call        00738C88
>007398B7    jmp         007398F6
 007398B9    mov         eax,dword ptr [ebp-4]
 007398BC    mov         edx,739980;'horizontal'
 007398C1    call        @UStrEqual
>007398C6    jne         007398D3
 007398C8    mov         edx,esi
 007398CA    mov         eax,ebx
 007398CC    call        007390A4
>007398D1    jmp         007398F6
 007398D3    mov         eax,dword ptr [ebp-4]
 007398D6    mov         edx,7399A4;'vertical'
 007398DB    call        @UStrEqual
>007398E0    jne         007398ED
 007398E2    mov         edx,esi
 007398E4    mov         eax,ebx
 007398E6    call        007393E8
>007398EB    jmp         007398F6
 007398ED    mov         edx,esi
 007398EF    mov         eax,ebx
 007398F1    call        00739724
 007398F6    xor         eax,eax
 007398F8    pop         edx
 007398F9    pop         ecx
 007398FA    pop         ecx
 007398FB    mov         dword ptr fs:[eax],edx
 007398FE    push        739913
 00739903    lea         eax,[ebp-4]
 00739906    call        @UStrClr
 0073990B    ret
>0073990C    jmp         @HandleFinally
>00739911    jmp         00739903
 00739913    pop         esi
 00739914    pop         ebx
 00739915    pop         ecx
 00739916    pop         ebp
 00739917    ret
end;*}

//007399B8
{*procedure sub_007399B8(?:?; ?:?; ?:?; ?:?);
begin
 007399B8    push        ebp
 007399B9    mov         ebp,esp
 007399BB    push        0
 007399BD    push        0
 007399BF    push        0
 007399C1    push        ebx
 007399C2    push        esi
 007399C3    push        edi
 007399C4    mov         dword ptr [ebp-4],ecx
 007399C7    mov         esi,edx
 007399C9    mov         edi,eax
 007399CB    mov         ebx,dword ptr [ebp+8]
 007399CE    xor         eax,eax
 007399D0    push        ebp
 007399D1    push        739AFD
 007399D6    push        dword ptr fs:[eax]
 007399D9    mov         dword ptr fs:[eax],esp
 007399DC    mov         eax,ebx
 007399DE    mov         edx,739B1C;'Deadzone('
 007399E3    call        @UStrAsg
 007399E8    mov         eax,esi
 007399EA    add         eax,eax
 007399EC    lea         eax,[eax+eax*4]
 007399EF    add         eax,dword ptr [ebp-4]
 007399F2    add         eax,0FFFFFFF5
 007399F5    cmp         eax,0D
>007399F8    ja          00739AAB
 007399FE    jmp         dword ptr [eax*4+739A05]
 007399FE    dd          00739A3D
 007399FE    dd          00739A4B
 007399FE    dd          00739A59
 007399FE    dd          00739A67
 007399FE    dd          00739AAB
 007399FE    dd          00739AAB
 007399FE    dd          00739AAB
 007399FE    dd          00739AAB
 007399FE    dd          00739AAB
 007399FE    dd          00739AAB
 007399FE    dd          00739A75
 007399FE    dd          00739A83
 007399FE    dd          00739A91
 007399FE    dd          00739A9F
 00739A3D    mov         eax,ebx
 00739A3F    mov         edx,739B3C;'-Joystick.y'
 00739A44    call        @UStrCat
>00739A49    jmp         00739AAB
 00739A4B    mov         eax,ebx
 00739A4D    mov         edx,739B60;'Joystick.y'
 00739A52    call        @UStrCat
>00739A57    jmp         00739AAB
 00739A59    mov         eax,ebx
 00739A5B    mov         edx,739B84;'-Joystick.x'
 00739A60    call        @UStrCat
>00739A65    jmp         00739AAB
 00739A67    mov         eax,ebx
 00739A69    mov         edx,739BA8;'Joystick.x'
 00739A6E    call        @UStrCat
>00739A73    jmp         00739AAB
 00739A75    mov         eax,ebx
 00739A77    mov         edx,739BCC;'-Joystick.z'
 00739A7C    call        @UStrCat
>00739A81    jmp         00739AAB
 00739A83    mov         eax,ebx
 00739A85    mov         edx,739BF0;'Joystick.z'
 00739A8A    call        @UStrCat
>00739A8F    jmp         00739AAB
 00739A91    mov         eax,ebx
 00739A93    mov         edx,739C14;'-Joystick.roll'
 00739A98    call        @UStrCat
>00739A9D    jmp         00739AAB
 00739A9F    mov         eax,ebx
 00739AA1    mov         edx,739C40;'Joystick.roll'
 00739AA6    call        @UStrCat
 00739AAB    push        dword ptr [ebx]
 00739AAD    push        739C68;', var.Set'
 00739AB2    lea         edx,[ebp-8]
 00739AB5    mov         eax,edi
 00739AB7    call        IntToStr
 00739ABC    push        dword ptr [ebp-8]
 00739ABF    push        739C88;'dz'
 00739AC4    lea         edx,[ebp-0C]
 00739AC7    mov         eax,esi
 00739AC9    call        IntToStr
 00739ACE    push        dword ptr [ebp-0C]
 00739AD1    push        739C9C;')'
 00739AD6    mov         eax,ebx
 00739AD8    mov         edx,6
 00739ADD    call        @UStrCatN
 00739AE2    xor         eax,eax
 00739AE4    pop         edx
 00739AE5    pop         ecx
 00739AE6    pop         ecx
 00739AE7    mov         dword ptr fs:[eax],edx
 00739AEA    push        739B04
 00739AEF    lea         eax,[ebp-0C]
 00739AF2    mov         edx,2
 00739AF7    call        @UStrArrayClr
 00739AFC    ret
>00739AFD    jmp         @HandleFinally
>00739B02    jmp         00739AEF
 00739B04    pop         edi
 00739B05    pop         esi
 00739B06    pop         ebx
 00739B07    mov         esp,ebp
 00739B09    pop         ebp
 00739B0A    ret         4
end;*}

//00739CA0
{*function sub_00739CA0(?:?):?;
begin
 00739CA0    push        ebp
 00739CA1    mov         ebp,esp
 00739CA3    push        0
 00739CA5    push        0
 00739CA7    push        0
 00739CA9    push        ebx
 00739CAA    push        esi
 00739CAB    mov         esi,eax
 00739CAD    xor         eax,eax
 00739CAF    push        ebp
 00739CB0    push        739D45
 00739CB5    push        dword ptr fs:[eax]
 00739CB8    mov         dword ptr fs:[eax],esp
 00739CBB    mov         edx,dword ptr [esi]
 00739CBD    mov         eax,739D60;','
 00739CC2    call        Pos
 00739CC7    mov         ebx,eax
 00739CC9    test        ebx,ebx
>00739CCB    jle         00739CED
 00739CCD    lea         eax,[ebp-8]
 00739CD0    push        eax
 00739CD1    mov         ecx,ebx
 00739CD3    dec         ecx
 00739CD4    mov         eax,dword ptr [esi]
 00739CD6    mov         edx,1
 00739CDB    call        @UStrCopy
 00739CE0    mov         eax,dword ptr [ebp-8]
 00739CE3    lea         edx,[ebp-4]
 00739CE6    call        Trim
>00739CEB    jmp         00739CF7
 00739CED    lea         edx,[ebp-4]
 00739CF0    mov         eax,dword ptr [esi]
 00739CF2    call        Trim
 00739CF7    mov         eax,esi
 00739CF9    mov         ecx,ebx
 00739CFB    mov         edx,1
 00739D00    call        @UStrDelete
 00739D05    mov         edx,40
 00739D0A    mov         eax,dword ptr [ebp-4]
 00739D0D    call        StrToIntDef
 00739D12    mov         ebx,eax
 00739D14    imul        eax,ebx,64
 00739D17    mov         dword ptr [ebp-0C],eax
 00739D1A    fild        dword ptr [ebp-0C]
 00739D1D    fdiv        dword ptr ds:[739D64];256:Single
 00739D23    call        @ROUND
 00739D28    mov         ebx,eax
 00739D2A    xor         eax,eax
 00739D2C    pop         edx
 00739D2D    pop         ecx
 00739D2E    pop         ecx
 00739D2F    mov         dword ptr fs:[eax],edx
 00739D32    push        739D4C
 00739D37    lea         eax,[ebp-8]
 00739D3A    mov         edx,2
 00739D3F    call        @UStrArrayClr
 00739D44    ret
>00739D45    jmp         @HandleFinally
>00739D4A    jmp         00739D37
 00739D4C    mov         eax,ebx
 00739D4E    pop         esi
 00739D4F    pop         ebx
 00739D50    mov         esp,ebp
 00739D52    pop         ebp
 00739D53    ret
end;*}

//00739D68
{*function sub_00739D68(?:?):?;
begin
 00739D68    push        ebp
 00739D69    mov         ebp,esp
 00739D6B    push        0
 00739D6D    push        0
 00739D6F    push        ebx
 00739D70    push        esi
 00739D71    mov         esi,eax
 00739D73    xor         eax,eax
 00739D75    push        ebp
 00739D76    push        739DF5
 00739D7B    push        dword ptr fs:[eax]
 00739D7E    mov         dword ptr fs:[eax],esp
 00739D81    mov         edx,dword ptr [esi]
 00739D83    mov         eax,739E10;','
 00739D88    call        Pos
 00739D8D    mov         ebx,eax
 00739D8F    test        ebx,ebx
>00739D91    jle         00739DB3
 00739D93    lea         eax,[ebp-8]
 00739D96    push        eax
 00739D97    mov         ecx,ebx
 00739D99    dec         ecx
 00739D9A    mov         eax,dword ptr [esi]
 00739D9C    mov         edx,1
 00739DA1    call        @UStrCopy
 00739DA6    mov         eax,dword ptr [ebp-8]
 00739DA9    lea         edx,[ebp-4]
 00739DAC    call        Trim
>00739DB1    jmp         00739DBD
 00739DB3    lea         edx,[ebp-4]
 00739DB6    mov         eax,dword ptr [esi]
 00739DB8    call        Trim
 00739DBD    mov         eax,esi
 00739DBF    mov         ecx,ebx
 00739DC1    mov         edx,1
 00739DC6    call        @UStrDelete
 00739DCB    mov         edx,2D
 00739DD0    mov         eax,dword ptr [ebp-4]
 00739DD3    call        StrToIntDef
 00739DD8    mov         ebx,eax
 00739DDA    xor         eax,eax
 00739DDC    pop         edx
 00739DDD    pop         ecx
 00739DDE    pop         ecx
 00739DDF    mov         dword ptr fs:[eax],edx
 00739DE2    push        739DFC
 00739DE7    lea         eax,[ebp-8]
 00739DEA    mov         edx,2
 00739DEF    call        @UStrArrayClr
 00739DF4    ret
>00739DF5    jmp         @HandleFinally
>00739DFA    jmp         00739DE7
 00739DFC    mov         eax,ebx
 00739DFE    pop         esi
 00739DFF    pop         ebx
 00739E00    pop         ecx
 00739E01    pop         ecx
 00739E02    pop         ebp
 00739E03    ret
end;*}

//00739E14
{*function sub_00739E14(?:?):?;
begin
 00739E14    push        ebp
 00739E15    mov         ebp,esp
 00739E17    xor         ecx,ecx
 00739E19    push        ecx
 00739E1A    push        ecx
 00739E1B    push        ecx
 00739E1C    push        ecx
 00739E1D    push        ecx
 00739E1E    push        ebx
 00739E1F    mov         dword ptr [ebp-4],eax
 00739E22    mov         eax,dword ptr [ebp-4]
 00739E25    call        @UStrAddRef
 00739E2A    xor         eax,eax
 00739E2C    push        ebp
 00739E2D    push        739EA7
 00739E32    push        dword ptr fs:[eax]
 00739E35    mov         dword ptr fs:[eax],esp
 00739E38    lea         ecx,[ebp-10]
 00739E3B    xor         edx,edx
 00739E3D    mov         eax,dword ptr [ebp-4]
 00739E40    call        00736164
 00739E45    mov         eax,dword ptr [ebp-10]
 00739E48    lea         edx,[ebp-0C]
 00739E4B    call        Trim
 00739E50    mov         eax,dword ptr [ebp-0C]
 00739E53    lea         edx,[ebp-8]
 00739E56    call        LowerCase
 00739E5B    mov         edx,dword ptr [ebp-8]
 00739E5E    lea         eax,[ebp-4]
 00739E61    call        @UStrLAsg
 00739E66    lea         eax,[ebp-14]
 00739E69    push        eax
 00739E6A    mov         ecx,9
 00739E6F    mov         edx,1
 00739E74    mov         eax,dword ptr [ebp-4]
 00739E77    call        @UStrCopy
 00739E7C    mov         eax,dword ptr [ebp-14]
 00739E7F    mov         edx,739EC4;'mousemove'
 00739E84    call        @UStrEqual
 00739E89    sete        bl
 00739E8C    xor         eax,eax
 00739E8E    pop         edx
 00739E8F    pop         ecx
 00739E90    pop         ecx
 00739E91    mov         dword ptr fs:[eax],edx
 00739E94    push        739EAE
 00739E99    lea         eax,[ebp-14]
 00739E9C    mov         edx,5
 00739EA1    call        @UStrArrayClr
 00739EA6    ret
>00739EA7    jmp         @HandleFinally
>00739EAC    jmp         00739E99
 00739EAE    mov         eax,ebx
 00739EB0    pop         ebx
 00739EB1    mov         esp,ebp
 00739EB3    pop         ebp
 00739EB4    ret
end;*}

//00739ED8
{*procedure sub_00739ED8(?:?; ?:?);
begin
 00739ED8    push        ebp
 00739ED9    mov         ebp,esp
 00739EDB    xor         ecx,ecx
 00739EDD    push        ecx
 00739EDE    push        ecx
 00739EDF    push        ecx
 00739EE0    push        ecx
 00739EE1    push        ebx
 00739EE2    mov         ebx,edx
 00739EE4    mov         dword ptr [ebp-4],eax
 00739EE7    mov         eax,dword ptr [ebp-4]
 00739EEA    call        @UStrAddRef
 00739EEF    xor         eax,eax
 00739EF1    push        ebp
 00739EF2    push        739FCA
 00739EF7    push        dword ptr fs:[eax]
 00739EFA    mov         dword ptr fs:[eax],esp
 00739EFD    lea         ecx,[ebp-10]
 00739F00    xor         edx,edx
 00739F02    mov         eax,dword ptr [ebp-4]
 00739F05    call        00736164
 00739F0A    mov         eax,dword ptr [ebp-10]
 00739F0D    lea         edx,[ebp-0C]
 00739F10    call        Trim
 00739F15    mov         eax,dword ptr [ebp-0C]
 00739F18    lea         edx,[ebp-8]
 00739F1B    call        LowerCase
 00739F20    mov         edx,dword ptr [ebp-8]
 00739F23    lea         eax,[ebp-4]
 00739F26    call        @UStrLAsg
 00739F2B    lea         eax,[ebp-4]
 00739F2E    mov         ecx,9
 00739F33    mov         edx,1
 00739F38    call        @UStrDelete
 00739F3D    mov         eax,dword ptr [ebp-4]
 00739F40    mov         edx,739FE4;'up'
 00739F45    call        @UStrEqual
>00739F4A    jne         00739F5A
 00739F4C    mov         eax,ebx
 00739F4E    mov         edx,739FF8;'mouse.y = 0.5 - '
 00739F53    call        @UStrAsg
>00739F58    jmp         00739FAF
 00739F5A    mov         eax,dword ptr [ebp-4]
 00739F5D    mov         edx,73A028;'down'
 00739F62    call        @UStrEqual
>00739F67    jne         00739F77
 00739F69    mov         eax,ebx
 00739F6B    mov         edx,73A040;'mouse.y = 0.5 + '
 00739F70    call        @UStrAsg
>00739F75    jmp         00739FAF
 00739F77    mov         eax,dword ptr [ebp-4]
 00739F7A    mov         edx,73A070;'left'
 00739F7F    call        @UStrEqual
>00739F84    jne         00739F94
 00739F86    mov         eax,ebx
 00739F88    mov         edx,73A088;'mouse.x = 0.5 - '
 00739F8D    call        @UStrAsg
>00739F92    jmp         00739FAF
 00739F94    mov         eax,dword ptr [ebp-4]
 00739F97    mov         edx,73A0B8;'right'
 00739F9C    call        @UStrEqual
>00739FA1    jne         00739FAF
 00739FA3    mov         eax,ebx
 00739FA5    mov         edx,73A0D0;'mouse.x = 0.5 + '
 00739FAA    call        @UStrAsg
 00739FAF    xor         eax,eax
 00739FB1    pop         edx
 00739FB2    pop         ecx
 00739FB3    pop         ecx
 00739FB4    mov         dword ptr fs:[eax],edx
 00739FB7    push        739FD1
 00739FBC    lea         eax,[ebp-10]
 00739FBF    mov         edx,4
 00739FC4    call        @UStrArrayClr
 00739FC9    ret
>00739FCA    jmp         @HandleFinally
>00739FCF    jmp         00739FBC
 00739FD1    pop         ebx
 00739FD2    mov         esp,ebp
 00739FD4    pop         ebp
 00739FD5    ret
end;*}

//0073A1C8
procedure sub_0073A1C8(?:UnicodeString);
begin
{*
 0073A1C8    push        ebp
 0073A1C9    mov         ebp,esp
 0073A1CB    mov         ecx,4B
 0073A1D0    push        0
 0073A1D2    push        0
 0073A1D4    dec         ecx
>0073A1D5    jne         0073A1D0
 0073A1D7    push        ebx
 0073A1D8    push        esi
 0073A1D9    push        edi
 0073A1DA    mov         dword ptr [ebp-4],eax
 0073A1DD    mov         eax,dword ptr [ebp-4]
 0073A1E0    call        @UStrAddRef
 0073A1E5    xor         eax,eax
 0073A1E7    push        ebp
 0073A1E8    push        73BAD6
 0073A1ED    push        dword ptr fs:[eax]
 0073A1F0    mov         dword ptr fs:[eax],esp
 0073A1F3    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A1F8    mov         eax,dword ptr [eax]
 0073A1FA    mov         eax,dword ptr [eax+394]
 0073A200    mov         eax,dword ptr [eax+2A4]
 0073A206    mov         edx,dword ptr [eax]
 0073A208    call        dword ptr [edx+44]
 0073A20B    lea         edx,[ebp-3C]
 0073A20E    mov         eax,dword ptr [ebp-4]
 0073A211    call        ExtractFileName
 0073A216    mov         ecx,dword ptr [ebp-3C]
 0073A219    lea         eax,[ebp-38]
 0073A21C    mov         edx,73BAF0;'// '
 0073A221    call        @UStrCat3
 0073A226    mov         ecx,dword ptr [ebp-38]
 0073A229    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A22E    mov         eax,dword ptr [eax]
 0073A230    mov         eax,dword ptr [eax+394]
 0073A236    mov         eax,dword ptr [eax+2A4]
 0073A23C    xor         edx,edx
 0073A23E    mov         ebx,dword ptr [eax]
 0073A240    call        dword ptr [ebx+60]
 0073A243    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A248    mov         eax,dword ptr [eax]
 0073A24A    mov         eax,dword ptr [eax+394]
 0073A250    mov         eax,dword ptr [eax+2A4]
 0073A256    mov         ecx,73BB04;'// Imported from XPadder'
 0073A25B    mov         edx,1
 0073A260    mov         ebx,dword ptr [eax]
 0073A262    call        dword ptr [ebx+60]
 0073A265    mov         ecx,dword ptr [ebp-4]
 0073A268    mov         dl,1
 0073A26A    mov         eax,[004598F4];TIniFile
 0073A26F    call        TCustomIniFile.Create;TIniFile.Create
 0073A274    mov         dword ptr [ebp-24],eax
 0073A277    mov         edx,73BB44;'Assignments'
 0073A27C    mov         eax,dword ptr [ebp-24]
 0073A27F    call        TCustomIniFile.SectionExists
 0073A284    test        al,al
>0073A286    jne         0073A2BE
 0073A288    mov         eax,dword ptr [ebp-24]
 0073A28B    call        TObject.Free
 0073A290    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A295    mov         eax,dword ptr [eax]
 0073A297    mov         eax,dword ptr [eax+394]
 0073A29D    mov         eax,dword ptr [eax+2A4]
 0073A2A3    mov         edx,dword ptr [ebp-4]
 0073A2A6    mov         ecx,dword ptr [eax]
 0073A2A8    call        dword ptr [ecx+68]
 0073A2AB    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A2B0    mov         eax,dword ptr [eax]
 0073A2B2    mov         byte ptr [eax+656],0
>0073A2B9    jmp         0073BA85
 0073A2BE    xor         edx,edx
 0073A2C0    push        ebp
 0073A2C1    push        73BA7E
 0073A2C6    push        dword ptr fs:[edx]
 0073A2C9    mov         dword ptr fs:[edx],esp
 0073A2CC    xor         edx,edx
 0073A2CE    push        ebp
 0073A2CF    push        73BA4D
 0073A2D4    push        dword ptr fs:[edx]
 0073A2D7    mov         dword ptr fs:[edx],esp
 0073A2DA    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A2DF    mov         eax,dword ptr [eax]
 0073A2E1    mov         eax,dword ptr [eax+394]
 0073A2E7    mov         eax,dword ptr [eax+2A4]
 0073A2ED    mov         edx,73BB68;'If starting then'
 0073A2F2    mov         ecx,dword ptr [eax]
 0073A2F4    call        dword ptr [ecx+38]
 0073A2F7    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A2FC    mov         eax,dword ptr [eax]
 0073A2FE    mov         eax,dword ptr [eax+394]
 0073A304    mov         eax,dword ptr [eax+2A4]
 0073A30A    mov         edx,73BB98;'  var.set = 1'
 0073A30F    mov         ecx,dword ptr [eax]
 0073A311    call        dword ptr [ecx+38]
 0073A314    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A319    mov         eax,dword ptr [eax]
 0073A31B    mov         eax,dword ptr [eax+394]
 0073A321    mov         eax,dword ptr [eax+2A4]
 0073A327    mov         edx,73BBC0;'  var.prevset = 1'
 0073A32C    mov         ecx,dword ptr [eax]
 0073A32E    call        dword ptr [ecx+38]
 0073A331    push        1
 0073A333    mov         ecx,73BBF0;'KeyTapTime'
 0073A338    mov         edx,73BC14;'Profile Settings'
 0073A33D    mov         eax,dword ptr [ebp-24]
 0073A340    mov         ebx,dword ptr [eax]
 0073A342    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 0073A345    mov         edi,eax
 0073A347    cmp         edi,1E
>0073A34A    je          0073A3AA
 0073A34C    push        73BC44;'  PIE.SeqDuration = '
 0073A351    mov         eax,edi
 0073A353    mov         ecx,64
 0073A358    cdq
 0073A359    idiv        eax,ecx
 0073A35B    lea         edx,[ebp-44]
 0073A35E    call        IntToStr
 0073A363    push        dword ptr [ebp-44]
 0073A366    push        73BC7C;'.'
 0073A36B    mov         eax,edi
 0073A36D    mov         ecx,64
 0073A372    cdq
 0073A373    idiv        eax,ecx
 0073A375    mov         eax,edx
 0073A377    lea         edx,[ebp-48]
 0073A37A    call        IntToStr
 0073A37F    push        dword ptr [ebp-48]
 0073A382    lea         eax,[ebp-40]
 0073A385    mov         edx,4
 0073A38A    call        @UStrCatN
 0073A38F    mov         edx,dword ptr [ebp-40]
 0073A392    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A397    mov         eax,dword ptr [eax]
 0073A399    mov         eax,dword ptr [eax+394]
 0073A39F    mov         eax,dword ptr [eax+2A4]
 0073A3A5    mov         ecx,dword ptr [eax]
 0073A3A7    call        dword ptr [ecx+38]
 0073A3AA    mov         edi,1
 0073A3AF    push        73BC8C;'64,64'
 0073A3B4    lea         eax,[ebp-8]
 0073A3B7    push        eax
 0073A3B8    push        73BCA4;'Set'
 0073A3BD    lea         edx,[ebp-50]
 0073A3C0    mov         eax,edi
 0073A3C2    call        IntToStr
 0073A3C7    push        dword ptr [ebp-50]
 0073A3CA    push        73BCB8;'StickDeadZones'
 0073A3CF    lea         eax,[ebp-4C]
 0073A3D2    mov         edx,3
 0073A3D7    call        @UStrCatN
 0073A3DC    mov         ecx,dword ptr [ebp-4C]
 0073A3DF    mov         edx,73BCE4;'Set Settings'
 0073A3E4    mov         eax,dword ptr [ebp-24]
 0073A3E7    mov         ebx,dword ptr [eax]
 0073A3E9    call        dword ptr [ebx+4];TIniFile.ReadString
 0073A3EC    push        73BD0C;'  var.set'
 0073A3F1    lea         edx,[ebp-58]
 0073A3F4    mov         eax,edi
 0073A3F6    call        IntToStr
 0073A3FB    push        dword ptr [ebp-58]
 0073A3FE    push        73BD2C;'dz1 = '
 0073A403    lea         eax,[ebp-8]
 0073A406    call        00739CA0
 0073A40B    lea         edx,[ebp-5C]
 0073A40E    call        IntToStr
 0073A413    push        dword ptr [ebp-5C]
 0073A416    push        73BD48;'%'
 0073A41B    lea         eax,[ebp-54]
 0073A41E    mov         edx,5
 0073A423    call        @UStrCatN
 0073A428    mov         edx,dword ptr [ebp-54]
 0073A42B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A430    mov         eax,dword ptr [eax]
 0073A432    mov         eax,dword ptr [eax+394]
 0073A438    mov         eax,dword ptr [eax+2A4]
 0073A43E    mov         ecx,dword ptr [eax]
 0073A440    call        dword ptr [ecx+38]
 0073A443    push        73BD0C;'  var.set'
 0073A448    lea         edx,[ebp-64]
 0073A44B    mov         eax,edi
 0073A44D    call        IntToStr
 0073A452    push        dword ptr [ebp-64]
 0073A455    push        73BD58;'dz2 = '
 0073A45A    lea         eax,[ebp-8]
 0073A45D    call        00739CA0
 0073A462    lea         edx,[ebp-68]
 0073A465    call        IntToStr
 0073A46A    push        dword ptr [ebp-68]
 0073A46D    push        73BD48;'%'
 0073A472    lea         eax,[ebp-60]
 0073A475    mov         edx,5
 0073A47A    call        @UStrCatN
 0073A47F    mov         edx,dword ptr [ebp-60]
 0073A482    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A487    mov         eax,dword ptr [eax]
 0073A489    mov         eax,dword ptr [eax+394]
 0073A48F    mov         eax,dword ptr [eax+2A4]
 0073A495    mov         ecx,dword ptr [eax]
 0073A497    call        dword ptr [ecx+38]
 0073A49A    push        73BD74;'45,45'
 0073A49F    lea         eax,[ebp-8]
 0073A4A2    push        eax
 0073A4A3    push        73BCA4;'Set'
 0073A4A8    lea         edx,[ebp-70]
 0073A4AB    mov         eax,edi
 0073A4AD    call        IntToStr
 0073A4B2    push        dword ptr [ebp-70]
 0073A4B5    push        73BD8C;'StickDiagonalSizes'
 0073A4BA    lea         eax,[ebp-6C]
 0073A4BD    mov         edx,3
 0073A4C2    call        @UStrCatN
 0073A4C7    mov         ecx,dword ptr [ebp-6C]
 0073A4CA    mov         edx,73BCE4;'Set Settings'
 0073A4CF    mov         eax,dword ptr [ebp-24]
 0073A4D2    mov         ebx,dword ptr [eax]
 0073A4D4    call        dword ptr [ebx+4];TIniFile.ReadString
 0073A4D7    push        73BD0C;'  var.set'
 0073A4DC    lea         edx,[ebp-78]
 0073A4DF    mov         eax,edi
 0073A4E1    call        IntToStr
 0073A4E6    push        dword ptr [ebp-78]
 0073A4E9    push        73BDC0;'diag1 = '
 0073A4EE    lea         eax,[ebp-8]
 0073A4F1    call        00739D68
 0073A4F6    lea         edx,[ebp-7C]
 0073A4F9    call        IntToStr
 0073A4FE    push        dword ptr [ebp-7C]
 0073A501    push        73BDE0;' degrees'
 0073A506    lea         eax,[ebp-74]
 0073A509    mov         edx,5
 0073A50E    call        @UStrCatN
 0073A513    mov         edx,dword ptr [ebp-74]
 0073A516    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A51B    mov         eax,dword ptr [eax]
 0073A51D    mov         eax,dword ptr [eax+394]
 0073A523    mov         eax,dword ptr [eax+2A4]
 0073A529    mov         ecx,dword ptr [eax]
 0073A52B    call        dword ptr [ecx+38]
 0073A52E    push        73BD0C;'  var.set'
 0073A533    lea         edx,[ebp-84]
 0073A539    mov         eax,edi
 0073A53B    call        IntToStr
 0073A540    push        dword ptr [ebp-84]
 0073A546    push        73BE00;'diag2 = '
 0073A54B    lea         eax,[ebp-8]
 0073A54E    call        00739D68
 0073A553    lea         edx,[ebp-88]
 0073A559    call        IntToStr
 0073A55E    push        dword ptr [ebp-88]
 0073A564    push        73BDE0;' degrees'
 0073A569    lea         eax,[ebp-80]
 0073A56C    mov         edx,5
 0073A571    call        @UStrCatN
 0073A576    mov         edx,dword ptr [ebp-80]
 0073A579    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A57E    mov         eax,dword ptr [eax]
 0073A580    mov         eax,dword ptr [eax+394]
 0073A586    mov         eax,dword ptr [eax+2A4]
 0073A58C    mov         ecx,dword ptr [eax]
 0073A58E    call        dword ptr [ecx+38]
 0073A591    inc         edi
 0073A592    cmp         edi,9
>0073A595    jne         0073A3AF
 0073A59B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A5A0    mov         eax,dword ptr [eax]
 0073A5A2    mov         eax,dword ptr [eax+394]
 0073A5A8    mov         eax,dword ptr [eax+2A4]
 0073A5AE    mov         edx,73BE20;'End if'
 0073A5B3    mov         ecx,dword ptr [eax]
 0073A5B5    call        dword ptr [ecx+38]
 0073A5B8    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A5BD    mov         eax,dword ptr [eax]
 0073A5BF    mov         eax,dword ptr [eax+394]
 0073A5C5    mov         eax,dword ptr [eax+2A4]
 0073A5CB    xor         edx,edx
 0073A5CD    mov         ecx,dword ptr [eax]
 0073A5CF    call        dword ptr [ecx+38]
 0073A5D2    mov         edi,1
 0073A5D7    push        73BE3C;' and (var.set='
 0073A5DC    lea         edx,[ebp-8C]
 0073A5E2    mov         eax,edi
 0073A5E4    call        IntToStr
 0073A5E9    push        dword ptr [ebp-8C]
 0073A5EF    push        73BE68;')'
 0073A5F4    lea         eax,[ebp-20]
 0073A5F7    mov         edx,3
 0073A5FC    call        @UStrCatN
 0073A601    mov         esi,1
 0073A606    push        0
 0073A608    lea         eax,[ebp-8]
 0073A60B    push        eax
 0073A60C    push        73BCA4;'Set'
 0073A611    lea         edx,[ebp-94]
 0073A617    mov         eax,edi
 0073A619    call        IntToStr
 0073A61E    push        dword ptr [ebp-94]
 0073A624    push        73BE78;'Button'
 0073A629    lea         edx,[ebp-98]
 0073A62F    mov         eax,esi
 0073A631    call        IntToStr
 0073A636    push        dword ptr [ebp-98]
 0073A63C    push        73BE94;'Name'
 0073A641    lea         eax,[ebp-90]
 0073A647    mov         edx,5
 0073A64C    call        @UStrCatN
 0073A651    mov         ecx,dword ptr [ebp-90]
 0073A657    mov         edx,73BB44;'Assignments'
 0073A65C    mov         eax,dword ptr [ebp-24]
 0073A65F    mov         ebx,dword ptr [eax]
 0073A661    call        dword ptr [ebx+4];TIniFile.ReadString
 0073A664    push        0
 0073A666    lea         eax,[ebp-0C]
 0073A669    push        eax
 0073A66A    push        73BCA4;'Set'
 0073A66F    lea         edx,[ebp-0A0]
 0073A675    mov         eax,edi
 0073A677    call        IntToStr
 0073A67C    push        dword ptr [ebp-0A0]
 0073A682    push        73BE78;'Button'
 0073A687    lea         edx,[ebp-0A4]
 0073A68D    mov         eax,esi
 0073A68F    call        IntToStr
 0073A694    push        dword ptr [ebp-0A4]
 0073A69A    push        73BEAC;'Slots'
 0073A69F    lea         eax,[ebp-9C]
 0073A6A5    mov         edx,5
 0073A6AA    call        @UStrCatN
 0073A6AF    mov         ecx,dword ptr [ebp-9C]
 0073A6B5    mov         edx,73BB44;'Assignments'
 0073A6BA    mov         eax,dword ptr [ebp-24]
 0073A6BD    mov         ebx,dword ptr [eax]
 0073A6BF    call        dword ptr [ebx+4];TIniFile.ReadString
 0073A6C2    push        0
 0073A6C4    push        73BCA4;'Set'
 0073A6C9    lea         edx,[ebp-0AC]
 0073A6CF    mov         eax,edi
 0073A6D1    call        IntToStr
 0073A6D6    push        dword ptr [ebp-0AC]
 0073A6DC    push        73BE78;'Button'
 0073A6E1    lea         edx,[ebp-0B0]
 0073A6E7    mov         eax,esi
 0073A6E9    call        IntToStr
 0073A6EE    push        dword ptr [ebp-0B0]
 0073A6F4    push        73BEC4;'Toggle'
 0073A6F9    lea         eax,[ebp-0A8]
 0073A6FF    mov         edx,5
 0073A704    call        @UStrCatN
 0073A709    mov         ecx,dword ptr [ebp-0A8]
 0073A70F    mov         edx,73BB44;'Assignments'
 0073A714    mov         eax,dword ptr [ebp-24]
 0073A717    mov         ebx,dword ptr [eax]
 0073A719    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 0073A71C    mov         dword ptr [ebp-30],eax
 0073A71F    push        0FF
 0073A721    push        73BCA4;'Set'
 0073A726    lea         edx,[ebp-0B8]
 0073A72C    mov         eax,edi
 0073A72E    call        IntToStr
 0073A733    push        dword ptr [ebp-0B8]
 0073A739    push        73BE78;'Button'
 0073A73E    lea         edx,[ebp-0BC]
 0073A744    mov         eax,esi
 0073A746    call        IntToStr
 0073A74B    push        dword ptr [ebp-0BC]
 0073A751    push        73BEE0;'SetSelect'
 0073A756    lea         eax,[ebp-0B4]
 0073A75C    mov         edx,5
 0073A761    call        @UStrCatN
 0073A766    mov         ecx,dword ptr [ebp-0B4]
 0073A76C    mov         edx,73BB44;'Assignments'
 0073A771    mov         eax,dword ptr [ebp-24]
 0073A774    mov         ebx,dword ptr [eax]
 0073A776    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 0073A779    mov         dword ptr [ebp-34],eax
 0073A77C    lea         edx,[ebp-0C0]
 0073A782    mov         eax,esi
 0073A784    call        IntToStr
 0073A789    mov         ecx,dword ptr [ebp-0C0]
 0073A78F    lea         eax,[ebp-1C]
 0073A792    mov         edx,73BF00;'Joystick.Button'
 0073A797    call        @UStrCat3
 0073A79C    cmp         dword ptr [ebp-8],0
>0073A7A0    je          0073A7D3
 0073A7A2    lea         eax,[ebp-0C4]
 0073A7A8    mov         ecx,dword ptr [ebp-0C]
 0073A7AB    mov         edx,73BAF0;'// '
 0073A7B0    call        @UStrCat3
 0073A7B5    mov         edx,dword ptr [ebp-0C4]
 0073A7BB    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A7C0    mov         eax,dword ptr [eax]
 0073A7C2    mov         eax,dword ptr [eax+394]
 0073A7C8    mov         eax,dword ptr [eax+2A4]
 0073A7CE    mov         ecx,dword ptr [eax]
 0073A7D0    call        dword ptr [ecx+38]
 0073A7D3    cmp         dword ptr [ebp-0C],0
>0073A7D7    je          0073A829
 0073A7D9    lea         ecx,[ebp-0CC]
 0073A7DF    mov         edx,dword ptr [ebp-30]
 0073A7E2    mov         eax,dword ptr [ebp-0C]
 0073A7E5    call        00736164
 0073A7EA    push        dword ptr [ebp-0CC]
 0073A7F0    push        73BF2C;' = '
 0073A7F5    push        dword ptr [ebp-1C]
 0073A7F8    push        dword ptr [ebp-20]
 0073A7FB    lea         eax,[ebp-0C8]
 0073A801    mov         edx,4
 0073A806    call        @UStrCatN
 0073A80B    mov         edx,dword ptr [ebp-0C8]
 0073A811    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A816    mov         eax,dword ptr [eax]
 0073A818    mov         eax,dword ptr [eax+394]
 0073A81E    mov         eax,dword ptr [eax+2A4]
 0073A824    mov         ecx,dword ptr [eax]
 0073A826    call        dword ptr [ecx+38]
 0073A829    cmp         dword ptr [ebp-34],0
>0073A82D    jle         0073A8F7
 0073A833    push        73BF40;'if released('
 0073A838    push        dword ptr [ebp-1C]
 0073A83B    push        73BF68;') '
 0073A840    push        dword ptr [ebp-20]
 0073A843    push        73BF7C;' then'
 0073A848    lea         eax,[ebp-0D0]
 0073A84E    mov         edx,5
 0073A853    call        @UStrCatN
 0073A858    mov         edx,dword ptr [ebp-0D0]
 0073A85E    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A863    mov         eax,dword ptr [eax]
 0073A865    mov         eax,dword ptr [eax+394]
 0073A86B    mov         eax,dword ptr [eax+2A4]
 0073A871    mov         ecx,dword ptr [eax]
 0073A873    call        dword ptr [ecx+38]
 0073A876    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A87B    mov         eax,dword ptr [eax]
 0073A87D    mov         eax,dword ptr [eax+394]
 0073A883    mov         eax,dword ptr [eax+2A4]
 0073A889    mov         edx,73BF94;'  var.prevset = var.set'
 0073A88E    mov         ecx,dword ptr [eax]
 0073A890    call        dword ptr [ecx+38]
 0073A893    lea         edx,[ebp-0D8]
 0073A899    mov         eax,dword ptr [ebp-34]
 0073A89C    call        IntToStr
 0073A8A1    mov         ecx,dword ptr [ebp-0D8]
 0073A8A7    lea         eax,[ebp-0D4]
 0073A8AD    mov         edx,73BFD0;'  var.set = '
 0073A8B2    call        @UStrCat3
 0073A8B7    mov         edx,dword ptr [ebp-0D4]
 0073A8BD    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A8C2    mov         eax,dword ptr [eax]
 0073A8C4    mov         eax,dword ptr [eax+394]
 0073A8CA    mov         eax,dword ptr [eax+2A4]
 0073A8D0    mov         ecx,dword ptr [eax]
 0073A8D2    call        dword ptr [ecx+38]
 0073A8D5    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A8DA    mov         eax,dword ptr [eax]
 0073A8DC    mov         eax,dword ptr [eax+394]
 0073A8E2    mov         eax,dword ptr [eax+2A4]
 0073A8E8    mov         edx,73BFF8;'end if'
 0073A8ED    mov         ecx,dword ptr [eax]
 0073A8EF    call        dword ptr [ecx+38]
>0073A8F2    jmp         0073A9B8
 0073A8F7    cmp         dword ptr [ebp-34],0
>0073A8FB    jne         0073A9B8
 0073A901    push        73BF40;'if released('
 0073A906    push        dword ptr [ebp-1C]
 0073A909    push        73BF68;') '
 0073A90E    push        dword ptr [ebp-20]
 0073A911    push        73BF7C;' then'
 0073A916    lea         eax,[ebp-0DC]
 0073A91C    mov         edx,5
 0073A921    call        @UStrCatN
 0073A926    mov         edx,dword ptr [ebp-0DC]
 0073A92C    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A931    mov         eax,dword ptr [eax]
 0073A933    mov         eax,dword ptr [eax+394]
 0073A939    mov         eax,dword ptr [eax+2A4]
 0073A93F    mov         ecx,dword ptr [eax]
 0073A941    call        dword ptr [ecx+38]
 0073A944    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A949    mov         eax,dword ptr [eax]
 0073A94B    mov         eax,dword ptr [eax+394]
 0073A951    mov         eax,dword ptr [eax+2A4]
 0073A957    mov         edx,73C014;'  var.temp = var.set'
 0073A95C    mov         ecx,dword ptr [eax]
 0073A95E    call        dword ptr [ecx+38]
 0073A961    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A966    mov         eax,dword ptr [eax]
 0073A968    mov         eax,dword ptr [eax+394]
 0073A96E    mov         eax,dword ptr [eax+2A4]
 0073A974    mov         edx,73C04C;'  var.set = var.prevset'
 0073A979    mov         ecx,dword ptr [eax]
 0073A97B    call        dword ptr [ecx+38]
 0073A97E    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A983    mov         eax,dword ptr [eax]
 0073A985    mov         eax,dword ptr [eax+394]
 0073A98B    mov         eax,dword ptr [eax+2A4]
 0073A991    mov         edx,73C088;'  var.prevset = var.temp'
 0073A996    mov         ecx,dword ptr [eax]
 0073A998    call        dword ptr [ecx+38]
 0073A99B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073A9A0    mov         eax,dword ptr [eax]
 0073A9A2    mov         eax,dword ptr [eax+394]
 0073A9A8    mov         eax,dword ptr [eax+2A4]
 0073A9AE    mov         edx,73BFF8;'end if'
 0073A9B3    mov         ecx,dword ptr [eax]
 0073A9B5    call        dword ptr [ecx+38]
 0073A9B8    inc         esi
 0073A9B9    cmp         esi,21
>0073A9BC    jne         0073A606
 0073A9C2    push        0
 0073A9C4    lea         eax,[ebp-0E4]
 0073A9CA    push        eax
 0073A9CB    push        73BCA4;'Set'
 0073A9D0    lea         edx,[ebp-0EC]
 0073A9D6    mov         eax,edi
 0073A9D8    call        IntToStr
 0073A9DD    push        dword ptr [ebp-0EC]
 0073A9E3    push        73C0C8;'DPadMode'
 0073A9E8    lea         eax,[ebp-0E8]
 0073A9EE    mov         edx,3
 0073A9F3    call        @UStrCatN
 0073A9F8    mov         ecx,dword ptr [ebp-0E8]
 0073A9FE    mov         edx,73BCE4;'Set Settings'
 0073AA03    mov         eax,dword ptr [ebp-24]
 0073AA06    mov         ebx,dword ptr [eax]
 0073AA08    call        dword ptr [ebx+4];TIniFile.ReadString
 0073AA0B    mov         eax,dword ptr [ebp-0E4]
 0073AA11    lea         edx,[ebp-0E0]
 0073AA17    call        Trim
 0073AA1C    mov         eax,dword ptr [ebp-0E0]
 0073AA22    lea         edx,[ebp-10]
 0073AA25    call        LowerCase
 0073AA2A    mov         eax,dword ptr [ebp-10]
 0073AA2D    mov         edx,73C0E8;'diagonal'
 0073AA32    call        @UStrEqual
>0073AA37    jne         0073AA48
 0073AA39    lea         eax,[ebp-18]
 0073AA3C    mov         edx,73BAF0;'// '
 0073AA41    call        @UStrLAsg
>0073AA46    jmp         0073AA50
 0073AA48    lea         eax,[ebp-18]
 0073AA4B    call        @UStrClr
 0073AA50    mov         dword ptr [ebp-2C],1
 0073AA57    mov         esi,78C964;^'Up'
 0073AA5C    push        0
 0073AA5E    lea         eax,[ebp-8]
 0073AA61    push        eax
 0073AA62    push        73BCA4;'Set'
 0073AA67    lea         edx,[ebp-0F4]
 0073AA6D    mov         eax,edi
 0073AA6F    call        IntToStr
 0073AA74    push        dword ptr [ebp-0F4]
 0073AA7A    push        73C108;'DPad'
 0073AA7F    push        dword ptr [esi]
 0073AA81    push        73BE94;'Name'
 0073AA86    lea         eax,[ebp-0F0]
 0073AA8C    mov         edx,5
 0073AA91    call        @UStrCatN
 0073AA96    mov         ecx,dword ptr [ebp-0F0]
 0073AA9C    mov         edx,73BB44;'Assignments'
 0073AAA1    mov         eax,dword ptr [ebp-24]
 0073AAA4    mov         ebx,dword ptr [eax]
 0073AAA6    call        dword ptr [ebx+4];TIniFile.ReadString
 0073AAA9    push        0
 0073AAAB    lea         eax,[ebp-0C]
 0073AAAE    push        eax
 0073AAAF    push        73BCA4;'Set'
 0073AAB4    lea         edx,[ebp-0FC]
 0073AABA    mov         eax,edi
 0073AABC    call        IntToStr
 0073AAC1    push        dword ptr [ebp-0FC]
 0073AAC7    push        73C108;'DPad'
 0073AACC    push        dword ptr [esi]
 0073AACE    push        73BEAC;'Slots'
 0073AAD3    lea         eax,[ebp-0F8]
 0073AAD9    mov         edx,5
 0073AADE    call        @UStrCatN
 0073AAE3    mov         ecx,dword ptr [ebp-0F8]
 0073AAE9    mov         edx,73BB44;'Assignments'
 0073AAEE    mov         eax,dword ptr [ebp-24]
 0073AAF1    mov         ebx,dword ptr [eax]
 0073AAF3    call        dword ptr [ebx+4];TIniFile.ReadString
 0073AAF6    push        0
 0073AAF8    push        73BCA4;'Set'
 0073AAFD    lea         edx,[ebp-104]
 0073AB03    mov         eax,edi
 0073AB05    call        IntToStr
 0073AB0A    push        dword ptr [ebp-104]
 0073AB10    push        73C108;'DPad'
 0073AB15    push        dword ptr [esi]
 0073AB17    push        73BEC4;'Toggle'
 0073AB1C    lea         eax,[ebp-100]
 0073AB22    mov         edx,5
 0073AB27    call        @UStrCatN
 0073AB2C    mov         ecx,dword ptr [ebp-100]
 0073AB32    mov         edx,73BB44;'Assignments'
 0073AB37    mov         eax,dword ptr [ebp-24]
 0073AB3A    mov         ebx,dword ptr [eax]
 0073AB3C    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 0073AB3F    mov         dword ptr [ebp-30],eax
 0073AB42    push        0FF
 0073AB44    push        73BCA4;'Set'
 0073AB49    lea         edx,[ebp-10C]
 0073AB4F    mov         eax,edi
 0073AB51    call        IntToStr
 0073AB56    push        dword ptr [ebp-10C]
 0073AB5C    push        73C108;'DPad'
 0073AB61    push        dword ptr [esi]
 0073AB63    push        73BEE0;'SetSelect'
 0073AB68    lea         eax,[ebp-108]
 0073AB6E    mov         edx,5
 0073AB73    call        @UStrCatN
 0073AB78    mov         ecx,dword ptr [ebp-108]
 0073AB7E    mov         edx,73BB44;'Assignments'
 0073AB83    mov         eax,dword ptr [ebp-24]
 0073AB86    mov         ebx,dword ptr [eax]
 0073AB88    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 0073AB8B    mov         dword ptr [ebp-34],eax
 0073AB8E    lea         ecx,[ebp-1C]
 0073AB91    mov         edx,dword ptr [ebp-2C]
 0073AB94    mov         eax,dword ptr [ebp-10]
 0073AB97    call        00739834
 0073AB9C    cmp         dword ptr [ebp-8],0
>0073ABA0    je          0073ABD3
 0073ABA2    lea         eax,[ebp-110]
 0073ABA8    mov         ecx,dword ptr [ebp-0C]
 0073ABAB    mov         edx,73BAF0;'// '
 0073ABB0    call        @UStrCat3
 0073ABB5    mov         edx,dword ptr [ebp-110]
 0073ABBB    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073ABC0    mov         eax,dword ptr [eax]
 0073ABC2    mov         eax,dword ptr [eax+394]
 0073ABC8    mov         eax,dword ptr [eax+2A4]
 0073ABCE    mov         ecx,dword ptr [eax]
 0073ABD0    call        dword ptr [ecx+38]
 0073ABD3    cmp         dword ptr [ebp-0C],0
>0073ABD7    je          0073AC38
 0073ABD9    mov         eax,dword ptr [ebp-0C]
 0073ABDC    call        00739E14
 0073ABE1    test        al,al
>0073ABE3    jne         0073AC38
 0073ABE5    push        dword ptr [ebp-18]
 0073ABE8    lea         ecx,[ebp-118]
 0073ABEE    mov         edx,dword ptr [ebp-30]
 0073ABF1    mov         eax,dword ptr [ebp-0C]
 0073ABF4    call        00736164
 0073ABF9    push        dword ptr [ebp-118]
 0073ABFF    push        73BF2C;' = '
 0073AC04    push        dword ptr [ebp-1C]
 0073AC07    push        dword ptr [ebp-20]
 0073AC0A    lea         eax,[ebp-114]
 0073AC10    mov         edx,5
 0073AC15    call        @UStrCatN
 0073AC1A    mov         edx,dword ptr [ebp-114]
 0073AC20    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073AC25    mov         eax,dword ptr [eax]
 0073AC27    mov         eax,dword ptr [eax+394]
 0073AC2D    mov         eax,dword ptr [eax+2A4]
 0073AC33    mov         ecx,dword ptr [eax]
 0073AC35    call        dword ptr [ecx+38]
 0073AC38    cmp         dword ptr [ebp-34],0
>0073AC3C    jle         0073AD39
 0073AC42    push        dword ptr [ebp-18]
 0073AC45    push        73BF40;'if released('
 0073AC4A    push        dword ptr [ebp-1C]
 0073AC4D    push        73BF68;') '
 0073AC52    push        dword ptr [ebp-20]
 0073AC55    push        73BF7C;' then'
 0073AC5A    lea         eax,[ebp-11C]
 0073AC60    mov         edx,6
 0073AC65    call        @UStrCatN
 0073AC6A    mov         edx,dword ptr [ebp-11C]
 0073AC70    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073AC75    mov         eax,dword ptr [eax]
 0073AC77    mov         eax,dword ptr [eax+394]
 0073AC7D    mov         eax,dword ptr [eax+2A4]
 0073AC83    mov         ecx,dword ptr [eax]
 0073AC85    call        dword ptr [ecx+38]
 0073AC88    lea         eax,[ebp-120]
 0073AC8E    mov         ecx,73BF94;'  var.prevset = var.set'
 0073AC93    mov         edx,dword ptr [ebp-18]
 0073AC96    call        @UStrCat3
 0073AC9B    mov         edx,dword ptr [ebp-120]
 0073ACA1    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073ACA6    mov         eax,dword ptr [eax]
 0073ACA8    mov         eax,dword ptr [eax+394]
 0073ACAE    mov         eax,dword ptr [eax+2A4]
 0073ACB4    mov         ecx,dword ptr [eax]
 0073ACB6    call        dword ptr [ecx+38]
 0073ACB9    push        dword ptr [ebp-18]
 0073ACBC    push        73BFD0;'  var.set = '
 0073ACC1    lea         edx,[ebp-128]
 0073ACC7    mov         eax,dword ptr [ebp-34]
 0073ACCA    call        IntToStr
 0073ACCF    push        dword ptr [ebp-128]
 0073ACD5    lea         eax,[ebp-124]
 0073ACDB    mov         edx,3
 0073ACE0    call        @UStrCatN
 0073ACE5    mov         edx,dword ptr [ebp-124]
 0073ACEB    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073ACF0    mov         eax,dword ptr [eax]
 0073ACF2    mov         eax,dword ptr [eax+394]
 0073ACF8    mov         eax,dword ptr [eax+2A4]
 0073ACFE    mov         ecx,dword ptr [eax]
 0073AD00    call        dword ptr [ecx+38]
 0073AD03    lea         eax,[ebp-12C]
 0073AD09    mov         ecx,73BFF8;'end if'
 0073AD0E    mov         edx,dword ptr [ebp-18]
 0073AD11    call        @UStrCat3
 0073AD16    mov         edx,dword ptr [ebp-12C]
 0073AD1C    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073AD21    mov         eax,dword ptr [eax]
 0073AD23    mov         eax,dword ptr [eax+394]
 0073AD29    mov         eax,dword ptr [eax+2A4]
 0073AD2F    mov         ecx,dword ptr [eax]
 0073AD31    call        dword ptr [ecx+38]
>0073AD34    jmp         0073AE4D
 0073AD39    cmp         dword ptr [ebp-34],0
>0073AD3D    jne         0073AE4D
 0073AD43    push        dword ptr [ebp-18]
 0073AD46    push        73BF40;'if released('
 0073AD4B    push        dword ptr [ebp-1C]
 0073AD4E    push        73BF68;') '
 0073AD53    push        dword ptr [ebp-20]
 0073AD56    push        73BF7C;' then'
 0073AD5B    lea         eax,[ebp-130]
 0073AD61    mov         edx,6
 0073AD66    call        @UStrCatN
 0073AD6B    mov         edx,dword ptr [ebp-130]
 0073AD71    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073AD76    mov         eax,dword ptr [eax]
 0073AD78    mov         eax,dword ptr [eax+394]
 0073AD7E    mov         eax,dword ptr [eax+2A4]
 0073AD84    mov         ecx,dword ptr [eax]
 0073AD86    call        dword ptr [ecx+38]
 0073AD89    lea         eax,[ebp-134]
 0073AD8F    mov         ecx,73C014;'  var.temp = var.set'
 0073AD94    mov         edx,dword ptr [ebp-18]
 0073AD97    call        @UStrCat3
 0073AD9C    mov         edx,dword ptr [ebp-134]
 0073ADA2    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073ADA7    mov         eax,dword ptr [eax]
 0073ADA9    mov         eax,dword ptr [eax+394]
 0073ADAF    mov         eax,dword ptr [eax+2A4]
 0073ADB5    mov         ecx,dword ptr [eax]
 0073ADB7    call        dword ptr [ecx+38]
 0073ADBA    lea         eax,[ebp-138]
 0073ADC0    mov         ecx,73C04C;'  var.set = var.prevset'
 0073ADC5    mov         edx,dword ptr [ebp-18]
 0073ADC8    call        @UStrCat3
 0073ADCD    mov         edx,dword ptr [ebp-138]
 0073ADD3    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073ADD8    mov         eax,dword ptr [eax]
 0073ADDA    mov         eax,dword ptr [eax+394]
 0073ADE0    mov         eax,dword ptr [eax+2A4]
 0073ADE6    mov         ecx,dword ptr [eax]
 0073ADE8    call        dword ptr [ecx+38]
 0073ADEB    lea         eax,[ebp-13C]
 0073ADF1    mov         ecx,73C088;'  var.prevset = var.temp'
 0073ADF6    mov         edx,dword ptr [ebp-18]
 0073ADF9    call        @UStrCat3
 0073ADFE    mov         edx,dword ptr [ebp-13C]
 0073AE04    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073AE09    mov         eax,dword ptr [eax]
 0073AE0B    mov         eax,dword ptr [eax+394]
 0073AE11    mov         eax,dword ptr [eax+2A4]
 0073AE17    mov         ecx,dword ptr [eax]
 0073AE19    call        dword ptr [ecx+38]
 0073AE1C    lea         eax,[ebp-140]
 0073AE22    mov         ecx,73BFF8;'end if'
 0073AE27    mov         edx,dword ptr [ebp-18]
 0073AE2A    call        @UStrCat3
 0073AE2F    mov         edx,dword ptr [ebp-140]
 0073AE35    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073AE3A    mov         eax,dword ptr [eax]
 0073AE3C    mov         eax,dword ptr [eax+394]
 0073AE42    mov         eax,dword ptr [eax+2A4]
 0073AE48    mov         ecx,dword ptr [eax]
 0073AE4A    call        dword ptr [ecx+38]
 0073AE4D    inc         dword ptr [ebp-2C]
 0073AE50    add         esi,4
 0073AE53    cmp         dword ptr [ebp-2C],5
>0073AE57    jne         0073AA5C
 0073AE5D    mov         eax,dword ptr [ebp-10]
 0073AE60    mov         edx,73C0E8;'diagonal'
 0073AE65    call        @UStrEqual
>0073AE6A    je          0073AE7B
 0073AE6C    mov         eax,dword ptr [ebp-10]
 0073AE6F    mov         edx,73C120;'eightway'
 0073AE74    call        @UStrEqual
>0073AE79    jne         0073AE85
 0073AE7B    lea         eax,[ebp-18]
 0073AE7E    call        @UStrClr
>0073AE83    jmp         0073AE92
 0073AE85    lea         eax,[ebp-18]
 0073AE88    mov         edx,73BAF0;'// '
 0073AE8D    call        @UStrLAsg
 0073AE92    mov         dword ptr [ebp-2C],5
 0073AE99    mov         esi,78C974;^'UpRight'
 0073AE9E    push        0
 0073AEA0    lea         eax,[ebp-8]
 0073AEA3    push        eax
 0073AEA4    push        73BCA4;'Set'
 0073AEA9    lea         edx,[ebp-148]
 0073AEAF    mov         eax,edi
 0073AEB1    call        IntToStr
 0073AEB6    push        dword ptr [ebp-148]
 0073AEBC    push        73C108;'DPad'
 0073AEC1    push        dword ptr [esi]
 0073AEC3    push        73BE94;'Name'
 0073AEC8    lea         eax,[ebp-144]
 0073AECE    mov         edx,5
 0073AED3    call        @UStrCatN
 0073AED8    mov         ecx,dword ptr [ebp-144]
 0073AEDE    mov         edx,73BB44;'Assignments'
 0073AEE3    mov         eax,dword ptr [ebp-24]
 0073AEE6    mov         ebx,dword ptr [eax]
 0073AEE8    call        dword ptr [ebx+4];TIniFile.ReadString
 0073AEEB    push        0
 0073AEED    lea         eax,[ebp-0C]
 0073AEF0    push        eax
 0073AEF1    push        73BCA4;'Set'
 0073AEF6    lea         edx,[ebp-150]
 0073AEFC    mov         eax,edi
 0073AEFE    call        IntToStr
 0073AF03    push        dword ptr [ebp-150]
 0073AF09    push        73C108;'DPad'
 0073AF0E    push        dword ptr [esi]
 0073AF10    push        73BEAC;'Slots'
 0073AF15    lea         eax,[ebp-14C]
 0073AF1B    mov         edx,5
 0073AF20    call        @UStrCatN
 0073AF25    mov         ecx,dword ptr [ebp-14C]
 0073AF2B    mov         edx,73BB44;'Assignments'
 0073AF30    mov         eax,dword ptr [ebp-24]
 0073AF33    mov         ebx,dword ptr [eax]
 0073AF35    call        dword ptr [ebx+4];TIniFile.ReadString
 0073AF38    push        0
 0073AF3A    push        73BCA4;'Set'
 0073AF3F    lea         edx,[ebp-158]
 0073AF45    mov         eax,edi
 0073AF47    call        IntToStr
 0073AF4C    push        dword ptr [ebp-158]
 0073AF52    push        73C108;'DPad'
 0073AF57    push        dword ptr [esi]
 0073AF59    push        73BEC4;'Toggle'
 0073AF5E    lea         eax,[ebp-154]
 0073AF64    mov         edx,5
 0073AF69    call        @UStrCatN
 0073AF6E    mov         ecx,dword ptr [ebp-154]
 0073AF74    mov         edx,73BB44;'Assignments'
 0073AF79    mov         eax,dword ptr [ebp-24]
 0073AF7C    mov         ebx,dword ptr [eax]
 0073AF7E    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 0073AF81    mov         dword ptr [ebp-30],eax
 0073AF84    push        0FF
 0073AF86    push        73BCA4;'Set'
 0073AF8B    lea         edx,[ebp-160]
 0073AF91    mov         eax,edi
 0073AF93    call        IntToStr
 0073AF98    push        dword ptr [ebp-160]
 0073AF9E    push        73C108;'DPad'
 0073AFA3    push        dword ptr [esi]
 0073AFA5    push        73BEE0;'SetSelect'
 0073AFAA    lea         eax,[ebp-15C]
 0073AFB0    mov         edx,5
 0073AFB5    call        @UStrCatN
 0073AFBA    mov         ecx,dword ptr [ebp-15C]
 0073AFC0    mov         edx,73BB44;'Assignments'
 0073AFC5    mov         eax,dword ptr [ebp-24]
 0073AFC8    mov         ebx,dword ptr [eax]
 0073AFCA    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 0073AFCD    mov         dword ptr [ebp-34],eax
 0073AFD0    lea         ecx,[ebp-1C]
 0073AFD3    mov         edx,dword ptr [ebp-2C]
 0073AFD6    mov         eax,dword ptr [ebp-10]
 0073AFD9    call        00739834
 0073AFDE    cmp         dword ptr [ebp-8],0
>0073AFE2    je          0073B015
 0073AFE4    lea         eax,[ebp-164]
 0073AFEA    mov         ecx,dword ptr [ebp-0C]
 0073AFED    mov         edx,73BAF0;'// '
 0073AFF2    call        @UStrCat3
 0073AFF7    mov         edx,dword ptr [ebp-164]
 0073AFFD    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B002    mov         eax,dword ptr [eax]
 0073B004    mov         eax,dword ptr [eax+394]
 0073B00A    mov         eax,dword ptr [eax+2A4]
 0073B010    mov         ecx,dword ptr [eax]
 0073B012    call        dword ptr [ecx+38]
 0073B015    cmp         dword ptr [ebp-0C],0
>0073B019    je          0073B07A
 0073B01B    mov         eax,dword ptr [ebp-0C]
 0073B01E    call        00739E14
 0073B023    test        al,al
>0073B025    jne         0073B07A
 0073B027    push        dword ptr [ebp-18]
 0073B02A    lea         ecx,[ebp-16C]
 0073B030    mov         edx,dword ptr [ebp-30]
 0073B033    mov         eax,dword ptr [ebp-0C]
 0073B036    call        00736164
 0073B03B    push        dword ptr [ebp-16C]
 0073B041    push        73BF2C;' = '
 0073B046    push        dword ptr [ebp-1C]
 0073B049    push        dword ptr [ebp-20]
 0073B04C    lea         eax,[ebp-168]
 0073B052    mov         edx,5
 0073B057    call        @UStrCatN
 0073B05C    mov         edx,dword ptr [ebp-168]
 0073B062    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B067    mov         eax,dword ptr [eax]
 0073B069    mov         eax,dword ptr [eax+394]
 0073B06F    mov         eax,dword ptr [eax+2A4]
 0073B075    mov         ecx,dword ptr [eax]
 0073B077    call        dword ptr [ecx+38]
 0073B07A    cmp         dword ptr [ebp-34],0
>0073B07E    jle         0073B17B
 0073B084    push        dword ptr [ebp-18]
 0073B087    push        73BF40;'if released('
 0073B08C    push        dword ptr [ebp-1C]
 0073B08F    push        73BF68;') '
 0073B094    push        dword ptr [ebp-20]
 0073B097    push        73BF7C;' then'
 0073B09C    lea         eax,[ebp-170]
 0073B0A2    mov         edx,6
 0073B0A7    call        @UStrCatN
 0073B0AC    mov         edx,dword ptr [ebp-170]
 0073B0B2    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B0B7    mov         eax,dword ptr [eax]
 0073B0B9    mov         eax,dword ptr [eax+394]
 0073B0BF    mov         eax,dword ptr [eax+2A4]
 0073B0C5    mov         ecx,dword ptr [eax]
 0073B0C7    call        dword ptr [ecx+38]
 0073B0CA    lea         eax,[ebp-174]
 0073B0D0    mov         ecx,73BF94;'  var.prevset = var.set'
 0073B0D5    mov         edx,dword ptr [ebp-18]
 0073B0D8    call        @UStrCat3
 0073B0DD    mov         edx,dword ptr [ebp-174]
 0073B0E3    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B0E8    mov         eax,dword ptr [eax]
 0073B0EA    mov         eax,dword ptr [eax+394]
 0073B0F0    mov         eax,dword ptr [eax+2A4]
 0073B0F6    mov         ecx,dword ptr [eax]
 0073B0F8    call        dword ptr [ecx+38]
 0073B0FB    push        dword ptr [ebp-18]
 0073B0FE    push        73BFD0;'  var.set = '
 0073B103    lea         edx,[ebp-17C]
 0073B109    mov         eax,dword ptr [ebp-34]
 0073B10C    call        IntToStr
 0073B111    push        dword ptr [ebp-17C]
 0073B117    lea         eax,[ebp-178]
 0073B11D    mov         edx,3
 0073B122    call        @UStrCatN
 0073B127    mov         edx,dword ptr [ebp-178]
 0073B12D    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B132    mov         eax,dword ptr [eax]
 0073B134    mov         eax,dword ptr [eax+394]
 0073B13A    mov         eax,dword ptr [eax+2A4]
 0073B140    mov         ecx,dword ptr [eax]
 0073B142    call        dword ptr [ecx+38]
 0073B145    lea         eax,[ebp-180]
 0073B14B    mov         ecx,73BFF8;'end if'
 0073B150    mov         edx,dword ptr [ebp-18]
 0073B153    call        @UStrCat3
 0073B158    mov         edx,dword ptr [ebp-180]
 0073B15E    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B163    mov         eax,dword ptr [eax]
 0073B165    mov         eax,dword ptr [eax+394]
 0073B16B    mov         eax,dword ptr [eax+2A4]
 0073B171    mov         ecx,dword ptr [eax]
 0073B173    call        dword ptr [ecx+38]
>0073B176    jmp         0073B28F
 0073B17B    cmp         dword ptr [ebp-34],0
>0073B17F    jne         0073B28F
 0073B185    push        dword ptr [ebp-18]
 0073B188    push        73BF40;'if released('
 0073B18D    push        dword ptr [ebp-1C]
 0073B190    push        73BF68;') '
 0073B195    push        dword ptr [ebp-20]
 0073B198    push        73BF7C;' then'
 0073B19D    lea         eax,[ebp-184]
 0073B1A3    mov         edx,6
 0073B1A8    call        @UStrCatN
 0073B1AD    mov         edx,dword ptr [ebp-184]
 0073B1B3    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B1B8    mov         eax,dword ptr [eax]
 0073B1BA    mov         eax,dword ptr [eax+394]
 0073B1C0    mov         eax,dword ptr [eax+2A4]
 0073B1C6    mov         ecx,dword ptr [eax]
 0073B1C8    call        dword ptr [ecx+38]
 0073B1CB    lea         eax,[ebp-188]
 0073B1D1    mov         ecx,73C014;'  var.temp = var.set'
 0073B1D6    mov         edx,dword ptr [ebp-18]
 0073B1D9    call        @UStrCat3
 0073B1DE    mov         edx,dword ptr [ebp-188]
 0073B1E4    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B1E9    mov         eax,dword ptr [eax]
 0073B1EB    mov         eax,dword ptr [eax+394]
 0073B1F1    mov         eax,dword ptr [eax+2A4]
 0073B1F7    mov         ecx,dword ptr [eax]
 0073B1F9    call        dword ptr [ecx+38]
 0073B1FC    lea         eax,[ebp-18C]
 0073B202    mov         ecx,73C04C;'  var.set = var.prevset'
 0073B207    mov         edx,dword ptr [ebp-18]
 0073B20A    call        @UStrCat3
 0073B20F    mov         edx,dword ptr [ebp-18C]
 0073B215    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B21A    mov         eax,dword ptr [eax]
 0073B21C    mov         eax,dword ptr [eax+394]
 0073B222    mov         eax,dword ptr [eax+2A4]
 0073B228    mov         ecx,dword ptr [eax]
 0073B22A    call        dword ptr [ecx+38]
 0073B22D    lea         eax,[ebp-190]
 0073B233    mov         ecx,73C088;'  var.prevset = var.temp'
 0073B238    mov         edx,dword ptr [ebp-18]
 0073B23B    call        @UStrCat3
 0073B240    mov         edx,dword ptr [ebp-190]
 0073B246    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B24B    mov         eax,dword ptr [eax]
 0073B24D    mov         eax,dword ptr [eax+394]
 0073B253    mov         eax,dword ptr [eax+2A4]
 0073B259    mov         ecx,dword ptr [eax]
 0073B25B    call        dword ptr [ecx+38]
 0073B25E    lea         eax,[ebp-194]
 0073B264    mov         ecx,73BFF8;'end if'
 0073B269    mov         edx,dword ptr [ebp-18]
 0073B26C    call        @UStrCat3
 0073B271    mov         edx,dword ptr [ebp-194]
 0073B277    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B27C    mov         eax,dword ptr [eax]
 0073B27E    mov         eax,dword ptr [eax+394]
 0073B284    mov         eax,dword ptr [eax+2A4]
 0073B28A    mov         ecx,dword ptr [eax]
 0073B28C    call        dword ptr [ecx+38]
 0073B28F    inc         dword ptr [ebp-2C]
 0073B292    add         esi,4
 0073B295    cmp         dword ptr [ebp-2C],9
>0073B299    jne         0073AE9E
 0073B29F    mov         dword ptr [ebp-28],1
 0073B2A6    push        0
 0073B2A8    lea         eax,[ebp-19C]
 0073B2AE    push        eax
 0073B2AF    push        73BCA4;'Set'
 0073B2B4    lea         edx,[ebp-1A4]
 0073B2BA    mov         eax,edi
 0073B2BC    call        IntToStr
 0073B2C1    push        dword ptr [ebp-1A4]
 0073B2C7    push        73C140;'Stick'
 0073B2CC    lea         edx,[ebp-1A8]
 0073B2D2    mov         eax,dword ptr [ebp-28]
 0073B2D5    call        IntToStr
 0073B2DA    push        dword ptr [ebp-1A8]
 0073B2E0    push        73C158;'Mode'
 0073B2E5    lea         eax,[ebp-1A0]
 0073B2EB    mov         edx,5
 0073B2F0    call        @UStrCatN
 0073B2F5    mov         ecx,dword ptr [ebp-1A0]
 0073B2FB    mov         edx,73BCE4;'Set Settings'
 0073B300    mov         eax,dword ptr [ebp-24]
 0073B303    mov         ebx,dword ptr [eax]
 0073B305    call        dword ptr [ebx+4];TIniFile.ReadString
 0073B308    mov         eax,dword ptr [ebp-19C]
 0073B30E    lea         edx,[ebp-198]
 0073B314    call        Trim
 0073B319    mov         eax,dword ptr [ebp-198]
 0073B31F    lea         edx,[ebp-10]
 0073B322    call        LowerCase
 0073B327    mov         eax,dword ptr [ebp-10]
 0073B32A    mov         edx,73C0E8;'diagonal'
 0073B32F    call        @UStrEqual
>0073B334    jne         0073B345
 0073B336    lea         eax,[ebp-18]
 0073B339    mov         edx,73BAF0;'// '
 0073B33E    call        @UStrLAsg
>0073B343    jmp         0073B34D
 0073B345    lea         eax,[ebp-18]
 0073B348    call        @UStrClr
 0073B34D    mov         dword ptr [ebp-2C],1
 0073B354    mov         esi,78C964;^'Up'
 0073B359    push        0
 0073B35B    lea         eax,[ebp-8]
 0073B35E    push        eax
 0073B35F    push        73BCA4;'Set'
 0073B364    lea         edx,[ebp-1B0]
 0073B36A    mov         eax,edi
 0073B36C    call        IntToStr
 0073B371    push        dword ptr [ebp-1B0]
 0073B377    push        73C140;'Stick'
 0073B37C    lea         edx,[ebp-1B4]
 0073B382    mov         eax,dword ptr [ebp-28]
 0073B385    call        IntToStr
 0073B38A    push        dword ptr [ebp-1B4]
 0073B390    push        dword ptr [esi]
 0073B392    push        73BE94;'Name'
 0073B397    lea         eax,[ebp-1AC]
 0073B39D    mov         edx,6
 0073B3A2    call        @UStrCatN
 0073B3A7    mov         ecx,dword ptr [ebp-1AC]
 0073B3AD    mov         edx,73BB44;'Assignments'
 0073B3B2    mov         eax,dword ptr [ebp-24]
 0073B3B5    mov         ebx,dword ptr [eax]
 0073B3B7    call        dword ptr [ebx+4];TIniFile.ReadString
 0073B3BA    push        0
 0073B3BC    lea         eax,[ebp-0C]
 0073B3BF    push        eax
 0073B3C0    push        73BCA4;'Set'
 0073B3C5    lea         edx,[ebp-1BC]
 0073B3CB    mov         eax,edi
 0073B3CD    call        IntToStr
 0073B3D2    push        dword ptr [ebp-1BC]
 0073B3D8    push        73C140;'Stick'
 0073B3DD    lea         edx,[ebp-1C0]
 0073B3E3    mov         eax,dword ptr [ebp-28]
 0073B3E6    call        IntToStr
 0073B3EB    push        dword ptr [ebp-1C0]
 0073B3F1    push        dword ptr [esi]
 0073B3F3    push        73BEAC;'Slots'
 0073B3F8    lea         eax,[ebp-1B8]
 0073B3FE    mov         edx,6
 0073B403    call        @UStrCatN
 0073B408    mov         ecx,dword ptr [ebp-1B8]
 0073B40E    mov         edx,73BB44;'Assignments'
 0073B413    mov         eax,dword ptr [ebp-24]
 0073B416    mov         ebx,dword ptr [eax]
 0073B418    call        dword ptr [ebx+4];TIniFile.ReadString
 0073B41B    push        0
 0073B41D    push        73BCA4;'Set'
 0073B422    lea         edx,[ebp-1C8]
 0073B428    mov         eax,edi
 0073B42A    call        IntToStr
 0073B42F    push        dword ptr [ebp-1C8]
 0073B435    push        73C140;'Stick'
 0073B43A    lea         edx,[ebp-1CC]
 0073B440    mov         eax,dword ptr [ebp-28]
 0073B443    call        IntToStr
 0073B448    push        dword ptr [ebp-1CC]
 0073B44E    push        dword ptr [esi]
 0073B450    push        73BEC4;'Toggle'
 0073B455    lea         eax,[ebp-1C4]
 0073B45B    mov         edx,6
 0073B460    call        @UStrCatN
 0073B465    mov         ecx,dword ptr [ebp-1C4]
 0073B46B    mov         edx,73BB44;'Assignments'
 0073B470    mov         eax,dword ptr [ebp-24]
 0073B473    mov         ebx,dword ptr [eax]
 0073B475    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 0073B478    mov         dword ptr [ebp-30],eax
 0073B47B    cmp         dword ptr [ebp-8],0
>0073B47F    je          0073B4BA
 0073B481    push        dword ptr [ebp-18]
 0073B484    push        73BAF0;'// '
 0073B489    push        dword ptr [ebp-0C]
 0073B48C    lea         eax,[ebp-1D0]
 0073B492    mov         edx,3
 0073B497    call        @UStrCatN
 0073B49C    mov         edx,dword ptr [ebp-1D0]
 0073B4A2    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B4A7    mov         eax,dword ptr [eax]
 0073B4A9    mov         eax,dword ptr [eax+394]
 0073B4AF    mov         eax,dword ptr [eax+2A4]
 0073B4B5    mov         ecx,dword ptr [eax]
 0073B4B7    call        dword ptr [ecx+38]
 0073B4BA    cmp         dword ptr [ebp-0C],0
>0073B4BE    je          0073B7FE
 0073B4C4    mov         eax,dword ptr [ebp-0C]
 0073B4C7    call        00739E14
 0073B4CC    test        al,al
>0073B4CE    je          0073B790
 0073B4D4    push        0
 0073B4D6    lea         eax,[ebp-1D4]
 0073B4DC    push        eax
 0073B4DD    push        73BCA4;'Set'
 0073B4E2    lea         edx,[ebp-1DC]
 0073B4E8    mov         eax,edi
 0073B4EA    call        IntToStr
 0073B4EF    push        dword ptr [ebp-1DC]
 0073B4F5    push        73C140;'Stick'
 0073B4FA    lea         edx,[ebp-1E0]
 0073B500    mov         eax,dword ptr [ebp-28]
 0073B503    call        IntToStr
 0073B508    push        dword ptr [ebp-1E0]
 0073B50E    push        dword ptr [esi]
 0073B510    push        73C170;'MouseMode'
 0073B515    lea         eax,[ebp-1D8]
 0073B51B    mov         edx,6
 0073B520    call        @UStrCatN
 0073B525    mov         ecx,dword ptr [ebp-1D8]
 0073B52B    mov         edx,73BB44;'Assignments'
 0073B530    mov         eax,dword ptr [ebp-24]
 0073B533    mov         ebx,dword ptr [eax]
 0073B535    call        dword ptr [ebx+4];TIniFile.ReadString
 0073B538    mov         eax,dword ptr [ebp-1D4]
 0073B53E    lea         edx,[ebp-14]
 0073B541    call        LowerCase
 0073B546    push        20
 0073B548    push        73BCA4;'Set'
 0073B54D    lea         edx,[ebp-1E8]
 0073B553    mov         eax,edi
 0073B555    call        IntToStr
 0073B55A    push        dword ptr [ebp-1E8]
 0073B560    push        73C140;'Stick'
 0073B565    lea         edx,[ebp-1EC]
 0073B56B    mov         eax,dword ptr [ebp-28]
 0073B56E    call        IntToStr
 0073B573    push        dword ptr [ebp-1EC]
 0073B579    push        dword ptr [esi]
 0073B57B    push        73C190;'MouseSpeed'
 0073B580    lea         eax,[ebp-1E4]
 0073B586    mov         edx,6
 0073B58B    call        @UStrCatN
 0073B590    mov         ecx,dword ptr [ebp-1E4]
 0073B596    mov         edx,73BB44;'Assignments'
 0073B59B    mov         eax,dword ptr [ebp-24]
 0073B59E    mov         ebx,dword ptr [eax]
 0073B5A0    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 0073B5A3    push        dword ptr [ebp-18]
 0073B5A6    push        73C1B4;'if '
 0073B5AB    mov         eax,dword ptr [ebp-2C]
 0073B5AE    push        eax
 0073B5AF    lea         eax,[ebp-1F4]
 0073B5B5    push        eax
 0073B5B6    mov         ecx,dword ptr [ebp-28]
 0073B5B9    mov         edx,edi
 0073B5BB    mov         eax,dword ptr [ebp-10]
 0073B5BE    call        00738AD0
 0073B5C3    push        dword ptr [ebp-1F4]
 0073B5C9    push        dword ptr [ebp-20]
 0073B5CC    lea         eax,[ebp-1F0]
 0073B5D2    mov         edx,4
 0073B5D7    call        @UStrCatN
 0073B5DC    mov         edx,dword ptr [ebp-1F0]
 0073B5E2    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B5E7    mov         eax,dword ptr [eax]
 0073B5E9    mov         eax,dword ptr [eax+394]
 0073B5EF    mov         eax,dword ptr [eax+2A4]
 0073B5F5    mov         ecx,dword ptr [eax]
 0073B5F7    call        dword ptr [ecx+38]
 0073B5FA    push        dword ptr [ebp-18]
 0073B5FD    push        73C1C8;'  var.amount = '
 0073B602    lea         eax,[ebp-1FC]
 0073B608    push        eax
 0073B609    mov         ecx,dword ptr [ebp-2C]
 0073B60C    mov         edx,dword ptr [ebp-28]
 0073B60F    mov         eax,edi
 0073B611    call        007399B8
 0073B616    push        dword ptr [ebp-1FC]
 0073B61C    lea         eax,[ebp-1F8]
 0073B622    mov         edx,3
 0073B627    call        @UStrCatN
 0073B62C    mov         edx,dword ptr [ebp-1F8]
 0073B632    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B637    mov         eax,dword ptr [eax]
 0073B639    mov         eax,dword ptr [eax+394]
 0073B63F    mov         eax,dword ptr [eax+2A4]
 0073B645    mov         ecx,dword ptr [eax]
 0073B647    call        dword ptr [ecx+38]
 0073B64A    mov         eax,dword ptr [ebp-14]
 0073B64D    mov         edx,73C1F4;'spring'
 0073B652    call        @UStrEqual
>0073B657    jne         0073B759
 0073B65D    push        dword ptr [ebp-18]
 0073B660    push        73C210;'  '
 0073B665    lea         edx,[ebp-204]
 0073B66B    mov         eax,dword ptr [ebp-0C]
 0073B66E    call        00739ED8
 0073B673    push        dword ptr [ebp-204]
 0073B679    push        73C224;' var.amount/2'
 0073B67E    lea         eax,[ebp-200]
 0073B684    mov         edx,4
 0073B689    call        @UStrCatN
 0073B68E    mov         edx,dword ptr [ebp-200]
 0073B694    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B699    mov         eax,dword ptr [eax]
 0073B69B    mov         eax,dword ptr [eax+394]
 0073B6A1    mov         eax,dword ptr [eax+2A4]
 0073B6A7    mov         ecx,dword ptr [eax]
 0073B6A9    call        dword ptr [ecx+38]
 0073B6AC    push        dword ptr [ebp-18]
 0073B6AF    push        73C24C;'else if released('
 0073B6B4    mov         eax,dword ptr [ebp-2C]
 0073B6B7    push        eax
 0073B6B8    lea         eax,[ebp-20C]
 0073B6BE    push        eax
 0073B6BF    mov         ecx,dword ptr [ebp-28]
 0073B6C2    mov         edx,edi
 0073B6C4    mov         eax,dword ptr [ebp-10]
 0073B6C7    call        00738AD0
 0073B6CC    push        dword ptr [ebp-20C]
 0073B6D2    push        73BE68;')'
 0073B6D7    push        dword ptr [ebp-20]
 0073B6DA    lea         eax,[ebp-208]
 0073B6E0    mov         edx,5
 0073B6E5    call        @UStrCatN
 0073B6EA    mov         edx,dword ptr [ebp-208]
 0073B6F0    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B6F5    mov         eax,dword ptr [eax]
 0073B6F7    mov         eax,dword ptr [eax+394]
 0073B6FD    mov         eax,dword ptr [eax+2A4]
 0073B703    mov         ecx,dword ptr [eax]
 0073B705    call        dword ptr [ecx+38]
 0073B708    push        dword ptr [ebp-18]
 0073B70B    push        73C210;'  '
 0073B710    lea         edx,[ebp-214]
 0073B716    mov         eax,dword ptr [ebp-0C]
 0073B719    call        00739ED8
 0073B71E    push        dword ptr [ebp-214]
 0073B724    push        73C27C;' 0'
 0073B729    lea         eax,[ebp-210]
 0073B72F    mov         edx,4
 0073B734    call        @UStrCatN
 0073B739    mov         edx,dword ptr [ebp-210]
 0073B73F    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B744    mov         eax,dword ptr [eax]
 0073B746    mov         eax,dword ptr [eax+394]
 0073B74C    mov         eax,dword ptr [eax+2A4]
 0073B752    mov         ecx,dword ptr [eax]
 0073B754    call        dword ptr [ecx+38]
>0073B757    jmp         0073B75D
 0073B759    cmp         dword ptr [ebp-14],0
 0073B75D    lea         eax,[ebp-218]
 0073B763    mov         ecx,73BFF8;'end if'
 0073B768    mov         edx,dword ptr [ebp-18]
 0073B76B    call        @UStrCat3
 0073B770    mov         edx,dword ptr [ebp-218]
 0073B776    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B77B    mov         eax,dword ptr [eax]
 0073B77D    mov         eax,dword ptr [eax+394]
 0073B783    mov         eax,dword ptr [eax+2A4]
 0073B789    mov         ecx,dword ptr [eax]
 0073B78B    call        dword ptr [ecx+38]
>0073B78E    jmp         0073B7FE
 0073B790    push        dword ptr [ebp-18]
 0073B793    lea         ecx,[ebp-220]
 0073B799    mov         edx,dword ptr [ebp-30]
 0073B79C    mov         eax,dword ptr [ebp-0C]
 0073B79F    call        00736164
 0073B7A4    push        dword ptr [ebp-220]
 0073B7AA    push        73BF2C;' = '
 0073B7AF    mov         eax,dword ptr [ebp-2C]
 0073B7B2    push        eax
 0073B7B3    lea         eax,[ebp-224]
 0073B7B9    push        eax
 0073B7BA    mov         ecx,dword ptr [ebp-28]
 0073B7BD    mov         edx,edi
 0073B7BF    mov         eax,dword ptr [ebp-10]
 0073B7C2    call        00738AD0
 0073B7C7    push        dword ptr [ebp-224]
 0073B7CD    push        dword ptr [ebp-20]
 0073B7D0    lea         eax,[ebp-21C]
 0073B7D6    mov         edx,5
 0073B7DB    call        @UStrCatN
 0073B7E0    mov         edx,dword ptr [ebp-21C]
 0073B7E6    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B7EB    mov         eax,dword ptr [eax]
 0073B7ED    mov         eax,dword ptr [eax+394]
 0073B7F3    mov         eax,dword ptr [eax+2A4]
 0073B7F9    mov         ecx,dword ptr [eax]
 0073B7FB    call        dword ptr [ecx+38]
 0073B7FE    inc         dword ptr [ebp-2C]
 0073B801    add         esi,4
 0073B804    cmp         dword ptr [ebp-2C],5
>0073B808    jne         0073B359
 0073B80E    mov         eax,dword ptr [ebp-10]
 0073B811    mov         edx,73C0E8;'diagonal'
 0073B816    call        @UStrEqual
>0073B81B    je          0073B82C
 0073B81D    mov         eax,dword ptr [ebp-10]
 0073B820    mov         edx,73C120;'eightway'
 0073B825    call        @UStrEqual
>0073B82A    jne         0073B836
 0073B82C    lea         eax,[ebp-18]
 0073B82F    call        @UStrClr
>0073B834    jmp         0073B843
 0073B836    lea         eax,[ebp-18]
 0073B839    mov         edx,73BAF0;'// '
 0073B83E    call        @UStrLAsg
 0073B843    mov         dword ptr [ebp-2C],5
 0073B84A    mov         esi,78C974;^'UpRight'
 0073B84F    push        0
 0073B851    lea         eax,[ebp-8]
 0073B854    push        eax
 0073B855    push        73BCA4;'Set'
 0073B85A    lea         edx,[ebp-22C]
 0073B860    mov         eax,edi
 0073B862    call        IntToStr
 0073B867    push        dword ptr [ebp-22C]
 0073B86D    push        73C140;'Stick'
 0073B872    lea         edx,[ebp-230]
 0073B878    mov         eax,dword ptr [ebp-28]
 0073B87B    call        IntToStr
 0073B880    push        dword ptr [ebp-230]
 0073B886    push        dword ptr [esi]
 0073B888    push        73BE94;'Name'
 0073B88D    lea         eax,[ebp-228]
 0073B893    mov         edx,6
 0073B898    call        @UStrCatN
 0073B89D    mov         ecx,dword ptr [ebp-228]
 0073B8A3    mov         edx,73BB44;'Assignments'
 0073B8A8    mov         eax,dword ptr [ebp-24]
 0073B8AB    mov         ebx,dword ptr [eax]
 0073B8AD    call        dword ptr [ebx+4];TIniFile.ReadString
 0073B8B0    push        0
 0073B8B2    lea         eax,[ebp-0C]
 0073B8B5    push        eax
 0073B8B6    push        73BCA4;'Set'
 0073B8BB    lea         edx,[ebp-238]
 0073B8C1    mov         eax,edi
 0073B8C3    call        IntToStr
 0073B8C8    push        dword ptr [ebp-238]
 0073B8CE    push        73C140;'Stick'
 0073B8D3    lea         edx,[ebp-23C]
 0073B8D9    mov         eax,dword ptr [ebp-28]
 0073B8DC    call        IntToStr
 0073B8E1    push        dword ptr [ebp-23C]
 0073B8E7    push        dword ptr [esi]
 0073B8E9    push        73BEAC;'Slots'
 0073B8EE    lea         eax,[ebp-234]
 0073B8F4    mov         edx,6
 0073B8F9    call        @UStrCatN
 0073B8FE    mov         ecx,dword ptr [ebp-234]
 0073B904    mov         edx,73BB44;'Assignments'
 0073B909    mov         eax,dword ptr [ebp-24]
 0073B90C    mov         ebx,dword ptr [eax]
 0073B90E    call        dword ptr [ebx+4];TIniFile.ReadString
 0073B911    push        0
 0073B913    push        73BCA4;'Set'
 0073B918    lea         edx,[ebp-244]
 0073B91E    mov         eax,edi
 0073B920    call        IntToStr
 0073B925    push        dword ptr [ebp-244]
 0073B92B    push        73C140;'Stick'
 0073B930    lea         edx,[ebp-248]
 0073B936    mov         eax,dword ptr [ebp-28]
 0073B939    call        IntToStr
 0073B93E    push        dword ptr [ebp-248]
 0073B944    push        dword ptr [esi]
 0073B946    push        73BEC4;'Toggle'
 0073B94B    lea         eax,[ebp-240]
 0073B951    mov         edx,6
 0073B956    call        @UStrCatN
 0073B95B    mov         ecx,dword ptr [ebp-240]
 0073B961    mov         edx,73BB44;'Assignments'
 0073B966    mov         eax,dword ptr [ebp-24]
 0073B969    mov         ebx,dword ptr [eax]
 0073B96B    call        dword ptr [ebx+0C];TCustomIniFile.ReadInteger
 0073B96E    mov         dword ptr [ebp-30],eax
 0073B971    cmp         dword ptr [ebp-8],0
>0073B975    je          0073B9A8
 0073B977    lea         eax,[ebp-24C]
 0073B97D    mov         ecx,dword ptr [ebp-0C]
 0073B980    mov         edx,73BAF0;'// '
 0073B985    call        @UStrCat3
 0073B98A    mov         edx,dword ptr [ebp-24C]
 0073B990    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073B995    mov         eax,dword ptr [eax]
 0073B997    mov         eax,dword ptr [eax+394]
 0073B99D    mov         eax,dword ptr [eax+2A4]
 0073B9A3    mov         ecx,dword ptr [eax]
 0073B9A5    call        dword ptr [ecx+38]
 0073B9A8    cmp         dword ptr [ebp-0C],0
>0073B9AC    je          0073BA1C
 0073B9AE    push        dword ptr [ebp-18]
 0073B9B1    lea         ecx,[ebp-254]
 0073B9B7    mov         edx,dword ptr [ebp-30]
 0073B9BA    mov         eax,dword ptr [ebp-0C]
 0073B9BD    call        00736164
 0073B9C2    push        dword ptr [ebp-254]
 0073B9C8    push        73BF2C;' = '
 0073B9CD    mov         eax,dword ptr [ebp-2C]
 0073B9D0    push        eax
 0073B9D1    lea         eax,[ebp-258]
 0073B9D7    push        eax
 0073B9D8    mov         ecx,dword ptr [ebp-28]
 0073B9DB    mov         edx,edi
 0073B9DD    mov         eax,dword ptr [ebp-10]
 0073B9E0    call        00738AD0
 0073B9E5    push        dword ptr [ebp-258]
 0073B9EB    push        dword ptr [ebp-20]
 0073B9EE    lea         eax,[ebp-250]
 0073B9F4    mov         edx,5
 0073B9F9    call        @UStrCatN
 0073B9FE    mov         edx,dword ptr [ebp-250]
 0073BA04    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073BA09    mov         eax,dword ptr [eax]
 0073BA0B    mov         eax,dword ptr [eax+394]
 0073BA11    mov         eax,dword ptr [eax+2A4]
 0073BA17    mov         ecx,dword ptr [eax]
 0073BA19    call        dword ptr [ecx+38]
 0073BA1C    inc         dword ptr [ebp-2C]
 0073BA1F    add         esi,4
 0073BA22    cmp         dword ptr [ebp-2C],9
>0073BA26    jne         0073B84F
 0073BA2C    inc         dword ptr [ebp-28]
 0073BA2F    cmp         dword ptr [ebp-28],3
>0073BA33    jne         0073B2A6
 0073BA39    inc         edi
 0073BA3A    cmp         edi,9
>0073BA3D    jne         0073A5D7
 0073BA43    xor         eax,eax
 0073BA45    pop         edx
 0073BA46    pop         ecx
 0073BA47    pop         ecx
 0073BA48    mov         dword ptr fs:[eax],edx
>0073BA4B    jmp         0073BA68
>0073BA4D    jmp         @HandleOnException
 0073BA52    dd          1
 0073BA56    dd          00418C04;Exception
 0073BA5A    dd          0073BA5E
 0073BA5E    call        004FA644
 0073BA63    call        @DoneExcept
 0073BA68    xor         eax,eax
 0073BA6A    pop         edx
 0073BA6B    pop         ecx
 0073BA6C    pop         ecx
 0073BA6D    mov         dword ptr fs:[eax],edx
 0073BA70    push        73BA85
 0073BA75    mov         eax,dword ptr [ebp-24]
 0073BA78    call        TObject.Free
 0073BA7D    ret
>0073BA7E    jmp         @HandleFinally
>0073BA83    jmp         0073BA75
 0073BA85    xor         eax,eax
 0073BA87    pop         edx
 0073BA88    pop         ecx
 0073BA89    pop         ecx
 0073BA8A    mov         dword ptr fs:[eax],edx
 0073BA8D    push        73BADD
 0073BA92    lea         eax,[ebp-258]
 0073BA98    mov         edx,63
 0073BA9D    call        @UStrArrayClr
 0073BAA2    lea         eax,[ebp-0C8]
 0073BAA8    call        @UStrClr
 0073BAAD    lea         eax,[ebp-0CC]
 0073BAB3    call        @UStrClr
 0073BAB8    lea         eax,[ebp-0C4]
 0073BABE    mov         edx,24
 0073BAC3    call        @UStrArrayClr
 0073BAC8    lea         eax,[ebp-20]
 0073BACB    mov         edx,8
 0073BAD0    call        @UStrArrayClr
 0073BAD5    ret
>0073BAD6    jmp         @HandleFinally
>0073BADB    jmp         0073BA92
 0073BADD    pop         edi
 0073BADE    pop         esi
 0073BADF    pop         ebx
 0073BAE0    mov         esp,ebp
 0073BAE2    pop         ebp
 0073BAE3    ret
*}
end;

//0073C284
procedure sub_0073C284(?:UnicodeString);
begin
{*
 0073C284    push        ebp
 0073C285    mov         ebp,esp
 0073C287    mov         ecx,1B
 0073C28C    push        0
 0073C28E    push        0
 0073C290    dec         ecx
>0073C291    jne         0073C28C
 0073C293    push        ebx
 0073C294    push        esi
 0073C295    push        edi
 0073C296    mov         dword ptr [ebp-4],eax
 0073C299    mov         eax,dword ptr [ebp-4]
 0073C29C    call        @UStrAddRef
 0073C2A1    xor         eax,eax
 0073C2A3    push        ebp
 0073C2A4    push        73CBC5
 0073C2A9    push        dword ptr fs:[eax]
 0073C2AC    mov         dword ptr fs:[eax],esp
 0073C2AF    mov         dl,1
 0073C2B1    mov         eax,[0043C7BC];TStringList
 0073C2B6    call        TStringList.Create;TStringList.Create
 0073C2BB    mov         dword ptr [ebp-20],eax
 0073C2BE    xor         edx,edx
 0073C2C0    push        ebp
 0073C2C1    push        73CB77
 0073C2C6    push        dword ptr fs:[edx]
 0073C2C9    mov         dword ptr fs:[edx],esp
 0073C2CC    mov         edx,dword ptr [ebp-4]
 0073C2CF    mov         eax,dword ptr [ebp-20]
 0073C2D2    mov         ecx,dword ptr [eax]
 0073C2D4    call        dword ptr [ecx+68];TStrings.LoadFromFile
 0073C2D7    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073C2DC    mov         eax,dword ptr [eax]
 0073C2DE    mov         eax,dword ptr [eax+394]
 0073C2E4    mov         eax,dword ptr [eax+2A4]
 0073C2EA    mov         edx,dword ptr [eax]
 0073C2EC    call        dword ptr [edx+44]
 0073C2EF    lea         edx,[ebp-2C]
 0073C2F2    mov         eax,dword ptr [ebp-4]
 0073C2F5    call        ExtractFileName
 0073C2FA    mov         ecx,dword ptr [ebp-2C]
 0073C2FD    lea         eax,[ebp-28]
 0073C300    mov         edx,73CBE0;'// '
 0073C305    call        @UStrCat3
 0073C30A    mov         ecx,dword ptr [ebp-28]
 0073C30D    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073C312    mov         eax,dword ptr [eax]
 0073C314    mov         eax,dword ptr [eax+394]
 0073C31A    mov         eax,dword ptr [eax+2A4]
 0073C320    xor         edx,edx
 0073C322    mov         ebx,dword ptr [eax]
 0073C324    call        dword ptr [ebx+60]
 0073C327    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073C32C    mov         eax,dword ptr [eax]
 0073C32E    mov         eax,dword ptr [eax+394]
 0073C334    mov         eax,dword ptr [eax+2A4]
 0073C33A    mov         ecx,73CBF4;'// Imported from Pinnacle Game Profiler'
 0073C33F    mov         edx,1
 0073C344    mov         ebx,dword ptr [eax]
 0073C346    call        dword ptr [ebx+60]
 0073C349    xor         eax,eax
 0073C34B    mov         dword ptr [ebp-24],eax
 0073C34E    mov         eax,dword ptr [ebp-20]
 0073C351    mov         edx,dword ptr [eax]
 0073C353    call        dword ptr [edx+14];TStringList.GetCount
 0073C356    mov         esi,eax
 0073C358    dec         esi
 0073C359    test        esi,esi
>0073C35B    jl          0073CB6D
 0073C361    inc         esi
 0073C362    xor         ebx,ebx
 0073C364    lea         ecx,[ebp-30]
 0073C367    mov         edx,ebx
 0073C369    mov         eax,dword ptr [ebp-20]
 0073C36C    mov         edi,dword ptr [eax]
 0073C36E    call        dword ptr [edi+0C];TStringList.Get
 0073C371    mov         eax,dword ptr [ebp-30]
 0073C374    mov         edx,73CC50;'-->[command.dat]'
 0073C379    call        004F9A58
 0073C37E    test        al,al
>0073C380    je          0073C38E
 0073C382    mov         dword ptr [ebp-24],1
>0073C389    jmp         0073CB65
 0073C38E    lea         ecx,[ebp-34]
 0073C391    mov         edx,ebx
 0073C393    mov         eax,dword ptr [ebp-20]
 0073C396    mov         edi,dword ptr [eax]
 0073C398    call        dword ptr [edi+0C];TStringList.Get
 0073C39B    mov         eax,dword ptr [ebp-34]
 0073C39E    mov         edx,73CC80;'<--[command.dat]'
 0073C3A3    call        004F9A58
 0073C3A8    test        al,al
>0073C3AA    je          0073C3B6
 0073C3AC    xor         eax,eax
 0073C3AE    mov         dword ptr [ebp-24],eax
>0073C3B1    jmp         0073CB65
 0073C3B6    lea         ecx,[ebp-38]
 0073C3B9    mov         edx,ebx
 0073C3BB    mov         eax,dword ptr [ebp-20]
 0073C3BE    mov         edi,dword ptr [eax]
 0073C3C0    call        dword ptr [edi+0C];TStringList.Get
 0073C3C3    mov         eax,dword ptr [ebp-38]
 0073C3C6    mov         edx,73CCB0;'-->[cyclecom.dat]'
 0073C3CB    call        004F9A58
 0073C3D0    test        al,al
>0073C3D2    je          0073C3E0
 0073C3D4    mov         dword ptr [ebp-24],2
>0073C3DB    jmp         0073CB65
 0073C3E0    lea         ecx,[ebp-3C]
 0073C3E3    mov         edx,ebx
 0073C3E5    mov         eax,dword ptr [ebp-20]
 0073C3E8    mov         edi,dword ptr [eax]
 0073C3EA    call        dword ptr [edi+0C];TStringList.Get
 0073C3ED    mov         eax,dword ptr [ebp-3C]
 0073C3F0    mov         edx,73CCE0;'<--[cyclecom.dat]'
 0073C3F5    call        004F9A58
 0073C3FA    test        al,al
>0073C3FC    je          0073C408
 0073C3FE    xor         eax,eax
 0073C400    mov         dword ptr [ebp-24],eax
>0073C403    jmp         0073CB65
 0073C408    lea         ecx,[ebp-40]
 0073C40B    mov         edx,ebx
 0073C40D    mov         eax,dword ptr [ebp-20]
 0073C410    mov         edi,dword ptr [eax]
 0073C412    call        dword ptr [edi+0C];TStringList.Get
 0073C415    mov         eax,dword ptr [ebp-40]
 0073C418    mov         edx,73CD10;'-->[joycom.dat]'
 0073C41D    call        004F9A58
 0073C422    test        al,al
>0073C424    je          0073C432
 0073C426    mov         dword ptr [ebp-24],3
>0073C42D    jmp         0073CB65
 0073C432    lea         ecx,[ebp-44]
 0073C435    mov         edx,ebx
 0073C437    mov         eax,dword ptr [ebp-20]
 0073C43A    mov         edi,dword ptr [eax]
 0073C43C    call        dword ptr [edi+0C];TStringList.Get
 0073C43F    mov         eax,dword ptr [ebp-44]
 0073C442    mov         edx,73CD3C;'<--[joycom.dat]'
 0073C447    call        004F9A58
 0073C44C    test        al,al
>0073C44E    je          0073C45A
 0073C450    xor         eax,eax
 0073C452    mov         dword ptr [ebp-24],eax
>0073C455    jmp         0073CB65
 0073C45A    lea         ecx,[ebp-48]
 0073C45D    mov         edx,ebx
 0073C45F    mov         eax,dword ptr [ebp-20]
 0073C462    mov         edi,dword ptr [eax]
 0073C464    call        dword ptr [edi+0C];TStringList.Get
 0073C467    mov         eax,dword ptr [ebp-48]
 0073C46A    mov         edx,73CD68;'-->[axiscom.dat]'
 0073C46F    call        004F9A58
 0073C474    test        al,al
>0073C476    je          0073C484
 0073C478    mov         dword ptr [ebp-24],4
>0073C47F    jmp         0073CB65
 0073C484    lea         ecx,[ebp-4C]
 0073C487    mov         edx,ebx
 0073C489    mov         eax,dword ptr [ebp-20]
 0073C48C    mov         edi,dword ptr [eax]
 0073C48E    call        dword ptr [edi+0C];TStringList.Get
 0073C491    mov         eax,dword ptr [ebp-4C]
 0073C494    mov         edx,73CD98;'<--[axiscom.dat]'
 0073C499    call        004F9A58
 0073C49E    test        al,al
>0073C4A0    je          0073C4AC
 0073C4A2    xor         eax,eax
 0073C4A4    mov         dword ptr [ebp-24],eax
>0073C4A7    jmp         0073CB65
 0073C4AC    cmp         dword ptr [ebp-24],0
>0073C4B0    jne         0073C521
 0073C4B2    lea         ecx,[ebp-50]
 0073C4B5    mov         edx,ebx
 0073C4B7    mov         eax,dword ptr [ebp-20]
 0073C4BA    mov         edi,dword ptr [eax]
 0073C4BC    call        dword ptr [edi+0C];TStringList.Get
 0073C4BF    cmp         dword ptr [ebp-50],0
>0073C4C3    jne         0073C4E4
 0073C4C5    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073C4CA    mov         eax,dword ptr [eax]
 0073C4CC    mov         eax,dword ptr [eax+394]
 0073C4D2    mov         eax,dword ptr [eax+2A4]
 0073C4D8    xor         edx,edx
 0073C4DA    mov         ecx,dword ptr [eax]
 0073C4DC    call        dword ptr [ecx+38]
>0073C4DF    jmp         0073CB65
 0073C4E4    lea         ecx,[ebp-58]
 0073C4E7    mov         edx,ebx
 0073C4E9    mov         eax,dword ptr [ebp-20]
 0073C4EC    mov         edi,dword ptr [eax]
 0073C4EE    call        dword ptr [edi+0C];TStringList.Get
 0073C4F1    mov         ecx,dword ptr [ebp-58]
 0073C4F4    lea         eax,[ebp-54]
 0073C4F7    mov         edx,73CBE0;'// '
 0073C4FC    call        @UStrCat3
 0073C501    mov         edx,dword ptr [ebp-54]
 0073C504    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073C509    mov         eax,dword ptr [eax]
 0073C50B    mov         eax,dword ptr [eax+394]
 0073C511    mov         eax,dword ptr [eax+2A4]
 0073C517    mov         ecx,dword ptr [eax]
 0073C519    call        dword ptr [ecx+38]
>0073C51C    jmp         0073CB65
 0073C521    cmp         dword ptr [ebp-24],1
>0073C525    jne         0073CA35
 0073C52B    lea         ecx,[ebp-8]
 0073C52E    mov         edx,ebx
 0073C530    mov         eax,dword ptr [ebp-20]
 0073C533    mov         edi,dword ptr [eax]
 0073C535    call        dword ptr [edi+0C];TStringList.Get
 0073C538    mov         edx,dword ptr [ebp-8]
 0073C53B    mov         eax,73CDC8;'|'
 0073C540    call        Pos
 0073C545    mov         edi,eax
 0073C547    test        edi,edi
>0073C549    jle         0073CB65
 0073C54F    lea         eax,[ebp-5C]
 0073C552    push        eax
 0073C553    mov         ecx,edi
 0073C555    dec         ecx
 0073C556    mov         edx,1
 0073C55B    mov         eax,dword ptr [ebp-8]
 0073C55E    call        @UStrCopy
 0073C563    mov         eax,dword ptr [ebp-5C]
 0073C566    lea         edx,[ebp-0C]
 0073C569    call        Trim
 0073C56E    lea         eax,[ebp-8]
 0073C571    mov         ecx,edi
 0073C573    mov         edx,1
 0073C578    call        @UStrDelete
 0073C57D    mov         edx,dword ptr [ebp-8]
 0073C580    mov         eax,73CDC8;'|'
 0073C585    call        Pos
 0073C58A    mov         edi,eax
 0073C58C    test        edi,edi
>0073C58E    jle         0073C5CB
 0073C590    lea         eax,[ebp-60]
 0073C593    push        eax
 0073C594    mov         ecx,edi
 0073C596    dec         ecx
 0073C597    mov         edx,1
 0073C59C    mov         eax,dword ptr [ebp-8]
 0073C59F    call        @UStrCopy
 0073C5A4    mov         eax,dword ptr [ebp-60]
 0073C5A7    lea         edx,[ebp-1C]
 0073C5AA    call        Trim
 0073C5AF    lea         eax,[ebp-8]
 0073C5B2    mov         ecx,edi
 0073C5B4    mov         edx,1
 0073C5B9    call        @UStrDelete
 0073C5BE    lea         edx,[ebp-18]
 0073C5C1    mov         eax,dword ptr [ebp-8]
 0073C5C4    call        Trim
>0073C5C9    jmp         0073C5DB
 0073C5CB    lea         eax,[ebp-1C]
 0073C5CE    call        @UStrClr
 0073C5D3    lea         eax,[ebp-18]
 0073C5D6    call        @UStrClr
 0073C5DB    mov         edx,dword ptr [ebp-0C]
 0073C5DE    mov         eax,73CDD8;'>'
 0073C5E3    call        Pos
 0073C5E8    mov         edi,eax
 0073C5EA    test        edi,edi
>0073C5EC    jle         0073C626
 0073C5EE    lea         eax,[ebp-0C]
 0073C5F1    mov         ecx,edi
 0073C5F3    mov         edx,1
 0073C5F8    call        @UStrDelete
 0073C5FD    lea         edx,[ebp-64]
 0073C600    mov         eax,dword ptr [ebp-0C]
 0073C603    call        Trim
 0073C608    mov         edx,dword ptr [ebp-64]
 0073C60B    lea         eax,[ebp-0C]
 0073C60E    call        @UStrLAsg
 0073C613    mov         edx,dword ptr [ebp-0C]
 0073C616    mov         eax,73CDD8;'>'
 0073C61B    call        Pos
 0073C620    mov         edi,eax
 0073C622    test        edi,edi
>0073C624    jg          0073C5EE
 0073C626    lea         eax,[ebp-6C]
 0073C629    push        eax
 0073C62A    mov         ecx,6
 0073C62F    mov         edx,1
 0073C634    mov         eax,dword ptr [ebp-1C]
 0073C637    call        @UStrCopy
 0073C63C    mov         eax,dword ptr [ebp-6C]
 0073C63F    lea         edx,[ebp-68]
 0073C642    call        LowerCase
 0073C647    mov         eax,dword ptr [ebp-68]
 0073C64A    mov         edx,73CDE8;'press:'
 0073C64F    call        @UStrEqual
>0073C654    jne         0073C6A0
 0073C656    lea         eax,[ebp-1C]
 0073C659    mov         ecx,6
 0073C65E    mov         edx,1
 0073C663    call        @UStrDelete
 0073C668    lea         edx,[ebp-70]
 0073C66B    mov         eax,dword ptr [ebp-1C]
 0073C66E    call        Trim
 0073C673    mov         edx,dword ptr [ebp-70]
 0073C676    lea         eax,[ebp-1C]
 0073C679    call        @UStrLAsg
 0073C67E    xor         edx,edx
 0073C680    mov         eax,dword ptr [ebp-1C]
 0073C683    call        StrToIntDef
 0073C688    call        005FD518
 0073C68D    lea         edx,[ebp-74]
 0073C690    call        005F2178
 0073C695    mov         edx,dword ptr [ebp-74]
 0073C698    lea         eax,[ebp-1C]
 0073C69B    call        @UStrLAsg
 0073C6A0    lea         eax,[ebp-7C]
 0073C6A3    push        eax
 0073C6A4    mov         ecx,6
 0073C6A9    mov         edx,1
 0073C6AE    mov         eax,dword ptr [ebp-18]
 0073C6B1    call        @UStrCopy
 0073C6B6    mov         eax,dword ptr [ebp-7C]
 0073C6B9    lea         edx,[ebp-78]
 0073C6BC    call        LowerCase
 0073C6C1    mov         eax,dword ptr [ebp-78]
 0073C6C4    mov         edx,73CDE8;'press:'
 0073C6C9    call        @UStrEqual
>0073C6CE    jne         0073C720
 0073C6D0    lea         eax,[ebp-18]
 0073C6D3    mov         ecx,6
 0073C6D8    mov         edx,1
 0073C6DD    call        @UStrDelete
 0073C6E2    lea         edx,[ebp-80]
 0073C6E5    mov         eax,dword ptr [ebp-18]
 0073C6E8    call        Trim
 0073C6ED    mov         edx,dword ptr [ebp-80]
 0073C6F0    lea         eax,[ebp-18]
 0073C6F3    call        @UStrLAsg
 0073C6F8    xor         edx,edx
 0073C6FA    mov         eax,dword ptr [ebp-18]
 0073C6FD    call        StrToIntDef
 0073C702    call        005FD518
 0073C707    lea         edx,[ebp-84]
 0073C70D    call        005F2178
 0073C712    mov         edx,dword ptr [ebp-84]
 0073C718    lea         eax,[ebp-18]
 0073C71B    call        @UStrLAsg
 0073C720    lea         eax,[ebp-8C]
 0073C726    push        eax
 0073C727    mov         ecx,3
 0073C72C    mov         edx,1
 0073C731    mov         eax,dword ptr [ebp-1C]
 0073C734    call        @UStrCopy
 0073C739    mov         eax,dword ptr [ebp-8C]
 0073C73F    lea         edx,[ebp-88]
 0073C745    call        LowerCase
 0073C74A    mov         eax,dword ptr [ebp-88]
 0073C750    mov         edx,73CE04;'up:'
 0073C755    call        @UStrEqual
>0073C75A    jne         0073C7C1
 0073C75C    lea         eax,[ebp-1C]
 0073C75F    mov         ecx,3
 0073C764    mov         edx,1
 0073C769    call        @UStrDelete
 0073C76E    lea         edx,[ebp-90]
 0073C774    mov         eax,dword ptr [ebp-1C]
 0073C777    call        Trim
 0073C77C    mov         edx,dword ptr [ebp-90]
 0073C782    lea         eax,[ebp-1C]
 0073C785    call        @UStrLAsg
 0073C78A    push        73CE18;'Release('
 0073C78F    xor         edx,edx
 0073C791    mov         eax,dword ptr [ebp-1C]
 0073C794    call        StrToIntDef
 0073C799    call        005FD518
 0073C79E    lea         edx,[ebp-94]
 0073C7A4    call        005F2178
 0073C7A9    push        dword ptr [ebp-94]
 0073C7AF    push        73CE38;')'
 0073C7B4    lea         eax,[ebp-1C]
 0073C7B7    mov         edx,3
 0073C7BC    call        @UStrCatN
 0073C7C1    lea         eax,[ebp-9C]
 0073C7C7    push        eax
 0073C7C8    mov         ecx,3
 0073C7CD    mov         edx,1
 0073C7D2    mov         eax,dword ptr [ebp-18]
 0073C7D5    call        @UStrCopy
 0073C7DA    mov         eax,dword ptr [ebp-9C]
 0073C7E0    lea         edx,[ebp-98]
 0073C7E6    call        LowerCase
 0073C7EB    mov         eax,dword ptr [ebp-98]
 0073C7F1    mov         edx,73CE04;'up:'
 0073C7F6    call        @UStrEqual
>0073C7FB    jne         0073C862
 0073C7FD    lea         eax,[ebp-18]
 0073C800    mov         ecx,3
 0073C805    mov         edx,1
 0073C80A    call        @UStrDelete
 0073C80F    lea         edx,[ebp-0A0]
 0073C815    mov         eax,dword ptr [ebp-18]
 0073C818    call        Trim
 0073C81D    mov         edx,dword ptr [ebp-0A0]
 0073C823    lea         eax,[ebp-18]
 0073C826    call        @UStrLAsg
 0073C82B    push        73CE18;'Release('
 0073C830    xor         edx,edx
 0073C832    mov         eax,dword ptr [ebp-18]
 0073C835    call        StrToIntDef
 0073C83A    call        005FD518
 0073C83F    lea         edx,[ebp-0A4]
 0073C845    call        005F2178
 0073C84A    push        dword ptr [ebp-0A4]
 0073C850    push        73CE38;')'
 0073C855    lea         eax,[ebp-18]
 0073C858    mov         edx,3
 0073C85D    call        @UStrCatN
 0073C862    lea         eax,[ebp-0AC]
 0073C868    push        eax
 0073C869    mov         ecx,5
 0073C86E    mov         edx,1
 0073C873    mov         eax,dword ptr [ebp-1C]
 0073C876    call        @UStrCopy
 0073C87B    mov         eax,dword ptr [ebp-0AC]
 0073C881    lea         edx,[ebp-0A8]
 0073C887    call        LowerCase
 0073C88C    mov         eax,dword ptr [ebp-0A8]
 0073C892    mov         edx,73CE48;'down:'
 0073C897    call        @UStrEqual
>0073C89C    jne         0073C903
 0073C89E    lea         eax,[ebp-1C]
 0073C8A1    mov         ecx,5
 0073C8A6    mov         edx,1
 0073C8AB    call        @UStrDelete
 0073C8B0    lea         edx,[ebp-0B0]
 0073C8B6    mov         eax,dword ptr [ebp-1C]
 0073C8B9    call        Trim
 0073C8BE    mov         edx,dword ptr [ebp-0B0]
 0073C8C4    lea         eax,[ebp-1C]
 0073C8C7    call        @UStrLAsg
 0073C8CC    push        73CE60;'Press('
 0073C8D1    xor         edx,edx
 0073C8D3    mov         eax,dword ptr [ebp-1C]
 0073C8D6    call        StrToIntDef
 0073C8DB    call        005FD518
 0073C8E0    lea         edx,[ebp-0B4]
 0073C8E6    call        005F2178
 0073C8EB    push        dword ptr [ebp-0B4]
 0073C8F1    push        73CE38;')'
 0073C8F6    lea         eax,[ebp-1C]
 0073C8F9    mov         edx,3
 0073C8FE    call        @UStrCatN
 0073C903    lea         eax,[ebp-0BC]
 0073C909    push        eax
 0073C90A    mov         ecx,5
 0073C90F    mov         edx,1
 0073C914    mov         eax,dword ptr [ebp-18]
 0073C917    call        @UStrCopy
 0073C91C    mov         eax,dword ptr [ebp-0BC]
 0073C922    lea         edx,[ebp-0B8]
 0073C928    call        LowerCase
 0073C92D    mov         eax,dword ptr [ebp-0B8]
 0073C933    mov         edx,73CE48;'down:'
 0073C938    call        @UStrEqual
>0073C93D    jne         0073C9A4
 0073C93F    lea         eax,[ebp-18]
 0073C942    mov         ecx,5
 0073C947    mov         edx,1
 0073C94C    call        @UStrDelete
 0073C951    lea         edx,[ebp-0C0]
 0073C957    mov         eax,dword ptr [ebp-18]
 0073C95A    call        Trim
 0073C95F    mov         edx,dword ptr [ebp-0C0]
 0073C965    lea         eax,[ebp-18]
 0073C968    call        @UStrLAsg
 0073C96D    push        73CE60;'Press('
 0073C972    xor         edx,edx
 0073C974    mov         eax,dword ptr [ebp-18]
 0073C977    call        StrToIntDef
 0073C97C    call        005FD518
 0073C981    lea         edx,[ebp-0C4]
 0073C987    call        005F2178
 0073C98C    push        dword ptr [ebp-0C4]
 0073C992    push        73CE38;')'
 0073C997    lea         eax,[ebp-18]
 0073C99A    mov         edx,3
 0073C99F    call        @UStrCatN
 0073C9A4    cmp         dword ptr [ebp-1C],0
>0073C9A8    je          0073C9E8
 0073C9AA    push        73CE7C;'Pressed(var.'
 0073C9AF    push        dword ptr [ebp-0C]
 0073C9B2    push        73CEA4;') => '
 0073C9B7    push        dword ptr [ebp-1C]
 0073C9BA    lea         eax,[ebp-0C8]
 0073C9C0    mov         edx,4
 0073C9C5    call        @UStrCatN
 0073C9CA    mov         edx,dword ptr [ebp-0C8]
 0073C9D0    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073C9D5    mov         eax,dword ptr [eax]
 0073C9D7    mov         eax,dword ptr [eax+394]
 0073C9DD    mov         eax,dword ptr [eax+2A4]
 0073C9E3    mov         ecx,dword ptr [eax]
 0073C9E5    call        dword ptr [ecx+38]
 0073C9E8    cmp         dword ptr [ebp-18],0
>0073C9EC    je          0073CB65
 0073C9F2    push        73CEBC;'Released(var.'
 0073C9F7    push        dword ptr [ebp-0C]
 0073C9FA    push        73CEA4;') => '
 0073C9FF    push        dword ptr [ebp-18]
 0073CA02    lea         eax,[ebp-0CC]
 0073CA08    mov         edx,4
 0073CA0D    call        @UStrCatN
 0073CA12    mov         edx,dword ptr [ebp-0CC]
 0073CA18    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073CA1D    mov         eax,dword ptr [eax]
 0073CA1F    mov         eax,dword ptr [eax+394]
 0073CA25    mov         eax,dword ptr [eax+2A4]
 0073CA2B    mov         ecx,dword ptr [eax]
 0073CA2D    call        dword ptr [ecx+38]
>0073CA30    jmp         0073CB65
 0073CA35    cmp         dword ptr [ebp-24],3
>0073CA39    jne         0073CB65
 0073CA3F    lea         ecx,[ebp-8]
 0073CA42    mov         edx,ebx
 0073CA44    mov         eax,dword ptr [ebp-20]
 0073CA47    mov         edi,dword ptr [eax]
 0073CA49    call        dword ptr [edi+0C];TStringList.Get
 0073CA4C    mov         edx,dword ptr [ebp-8]
 0073CA4F    mov         eax,73CDC8;'|'
 0073CA54    call        Pos
 0073CA59    mov         edi,eax
 0073CA5B    test        edi,edi
>0073CA5D    jle         0073CB65
 0073CA63    lea         eax,[ebp-0D0]
 0073CA69    push        eax
 0073CA6A    mov         ecx,edi
 0073CA6C    dec         ecx
 0073CA6D    mov         edx,1
 0073CA72    mov         eax,dword ptr [ebp-8]
 0073CA75    call        @UStrCopy
 0073CA7A    mov         eax,dword ptr [ebp-0D0]
 0073CA80    lea         edx,[ebp-0C]
 0073CA83    call        Trim
 0073CA88    lea         eax,[ebp-8]
 0073CA8B    mov         ecx,edi
 0073CA8D    mov         edx,1
 0073CA92    call        @UStrDelete
 0073CA97    mov         edx,dword ptr [ebp-8]
 0073CA9A    mov         eax,73CDC8;'|'
 0073CA9F    call        Pos
 0073CAA4    mov         edi,eax
 0073CAA6    test        edi,edi
>0073CAA8    jle         0073CB45
 0073CAAE    lea         eax,[ebp-0D4]
 0073CAB4    push        eax
 0073CAB5    mov         ecx,edi
 0073CAB7    dec         ecx
 0073CAB8    mov         edx,1
 0073CABD    mov         eax,dword ptr [ebp-8]
 0073CAC0    call        @UStrCopy
 0073CAC5    mov         eax,dword ptr [ebp-0D4]
 0073CACB    lea         edx,[ebp-10]
 0073CACE    call        Trim
 0073CAD3    lea         eax,[ebp-8]
 0073CAD6    mov         ecx,edi
 0073CAD8    mov         edx,1
 0073CADD    call        @UStrDelete
 0073CAE2    mov         edx,dword ptr [ebp-8]
 0073CAE5    mov         eax,73CDC8;'|'
 0073CAEA    call        Pos
 0073CAEF    mov         edi,eax
 0073CAF1    test        edi,edi
>0073CAF3    jle         0073CB2B
 0073CAF5    lea         eax,[ebp-0D8]
 0073CAFB    push        eax
 0073CAFC    mov         ecx,edi
 0073CAFE    dec         ecx
 0073CAFF    mov         edx,1
 0073CB04    mov         eax,dword ptr [ebp-8]
 0073CB07    call        @UStrCopy
 0073CB0C    mov         eax,dword ptr [ebp-0D8]
 0073CB12    lea         edx,[ebp-14]
 0073CB15    call        Trim
 0073CB1A    lea         eax,[ebp-8]
 0073CB1D    mov         ecx,edi
 0073CB1F    mov         edx,1
 0073CB24    call        @UStrDelete
>0073CB29    jmp         0073CB65
 0073CB2B    lea         eax,[ebp-14]
 0073CB2E    call        @UStrClr
 0073CB33    lea         eax,[ebp-1C]
 0073CB36    call        @UStrClr
 0073CB3B    lea         eax,[ebp-18]
 0073CB3E    call        @UStrClr
>0073CB43    jmp         0073CB65
 0073CB45    lea         eax,[ebp-10]
 0073CB48    call        @UStrClr
 0073CB4D    lea         eax,[ebp-14]
 0073CB50    call        @UStrClr
 0073CB55    lea         eax,[ebp-1C]
 0073CB58    call        @UStrClr
 0073CB5D    lea         eax,[ebp-18]
 0073CB60    call        @UStrClr
 0073CB65    inc         ebx
 0073CB66    dec         esi
>0073CB67    jne         0073C364
 0073CB6D    xor         eax,eax
 0073CB6F    pop         edx
 0073CB70    pop         ecx
 0073CB71    pop         ecx
 0073CB72    mov         dword ptr fs:[eax],edx
>0073CB75    jmp         0073CB92
>0073CB77    jmp         @HandleOnException
 0073CB7C    dd          1
 0073CB80    dd          00418C04;Exception
 0073CB84    dd          0073CB88
 0073CB88    call        004FA644
 0073CB8D    call        @DoneExcept
 0073CB92    mov         eax,dword ptr [ebp-20]
 0073CB95    call        TObject.Free
 0073CB9A    xor         eax,eax
 0073CB9C    pop         edx
 0073CB9D    pop         ecx
 0073CB9E    pop         ecx
 0073CB9F    mov         dword ptr fs:[eax],edx
 0073CBA2    push        73CBCC
 0073CBA7    lea         eax,[ebp-0D8]
 0073CBAD    mov         edx,2D
 0073CBB2    call        @UStrArrayClr
 0073CBB7    lea         eax,[ebp-1C]
 0073CBBA    mov         edx,7
 0073CBBF    call        @UStrArrayClr
 0073CBC4    ret
>0073CBC5    jmp         @HandleFinally
>0073CBCA    jmp         0073CBA7
 0073CBCC    pop         edi
 0073CBCD    pop         esi
 0073CBCE    pop         ebx
 0073CBCF    mov         esp,ebp
 0073CBD1    pop         ebp
 0073CBD2    ret
*}
end;

//0073CED8
procedure sub_0073CED8(?:UnicodeString);
begin
{*
 0073CED8    push        ebp
 0073CED9    mov         ebp,esp
 0073CEDB    mov         ecx,0E
 0073CEE0    push        0
 0073CEE2    push        0
 0073CEE4    dec         ecx
>0073CEE5    jne         0073CEE0
 0073CEE7    push        ebx
 0073CEE8    push        esi
 0073CEE9    push        edi
 0073CEEA    mov         dword ptr [ebp-4],eax
 0073CEED    mov         eax,dword ptr [ebp-4]
 0073CEF0    call        @UStrAddRef
 0073CEF5    xor         eax,eax
 0073CEF7    push        ebp
 0073CEF8    push        73D79A
 0073CEFD    push        dword ptr fs:[eax]
 0073CF00    mov         dword ptr fs:[eax],esp
 0073CF03    mov         dl,1
 0073CF05    mov         eax,[0043C7BC];TStringList
 0073CF0A    call        TStringList.Create;TStringList.Create
 0073CF0F    mov         dword ptr [ebp-1C],eax
 0073CF12    xor         edx,edx
 0073CF14    push        ebp
 0073CF15    push        73D74F
 0073CF1A    push        dword ptr fs:[edx]
 0073CF1D    mov         dword ptr fs:[edx],esp
 0073CF20    mov         edx,dword ptr [ebp-4]
 0073CF23    mov         eax,dword ptr [ebp-1C]
 0073CF26    mov         ecx,dword ptr [eax]
 0073CF28    call        dword ptr [ecx+68];TStrings.LoadFromFile
 0073CF2B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073CF30    mov         eax,dword ptr [eax]
 0073CF32    mov         eax,dword ptr [eax+394]
 0073CF38    mov         eax,dword ptr [eax+2A4]
 0073CF3E    mov         edx,dword ptr [eax]
 0073CF40    call        dword ptr [edx+44]
 0073CF43    lea         edx,[ebp-24]
 0073CF46    mov         eax,dword ptr [ebp-4]
 0073CF49    call        ExtractFileName
 0073CF4E    mov         ecx,dword ptr [ebp-24]
 0073CF51    lea         eax,[ebp-20]
 0073CF54    mov         edx,73D7B4;'// '
 0073CF59    call        @UStrCat3
 0073CF5E    mov         ecx,dword ptr [ebp-20]
 0073CF61    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073CF66    mov         eax,dword ptr [eax]
 0073CF68    mov         eax,dword ptr [eax+394]
 0073CF6E    mov         eax,dword ptr [eax+2A4]
 0073CF74    xor         edx,edx
 0073CF76    mov         ebx,dword ptr [eax]
 0073CF78    call        dword ptr [ebx+60]
 0073CF7B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073CF80    mov         eax,dword ptr [eax]
 0073CF82    mov         eax,dword ptr [eax+394]
 0073CF88    mov         eax,dword ptr [eax+2A4]
 0073CF8E    mov         ecx,73D7C8;'// Imported from XWii'
 0073CF93    mov         edx,1
 0073CF98    mov         ebx,dword ptr [eax]
 0073CF9A    call        dword ptr [ebx+60]
 0073CF9D    mov         eax,dword ptr [ebp-1C]
 0073CFA0    mov         edx,dword ptr [eax]
 0073CFA2    call        dword ptr [edx+14];TStringList.GetCount
 0073CFA5    mov         esi,eax
 0073CFA7    dec         esi
 0073CFA8    test        esi,esi
>0073CFAA    jl          0073D745
 0073CFB0    inc         esi
 0073CFB1    mov         dword ptr [ebp-18],0
 0073CFB8    lea         ecx,[ebp-8]
 0073CFBB    mov         edx,dword ptr [ebp-18]
 0073CFBE    mov         eax,dword ptr [ebp-1C]
 0073CFC1    mov         ebx,dword ptr [eax]
 0073CFC3    call        dword ptr [ebx+0C];TStringList.Get
 0073CFC6    mov         edx,dword ptr [ebp-8]
 0073CFC9    mov         eax,73D800;'#'
 0073CFCE    call        Pos
 0073CFD3    mov         ebx,eax
 0073CFD5    test        ebx,ebx
>0073CFD7    jle         0073D021
 0073CFD9    mov         edi,dword ptr [ebp-8]
 0073CFDC    test        edi,edi
>0073CFDE    je          0073CFE5
 0073CFE0    sub         edi,4
 0073CFE3    mov         edi,dword ptr [edi]
 0073CFE5    lea         eax,[ebp-28]
 0073CFE8    push        eax
 0073CFE9    lea         edx,[ebx+1]
 0073CFEC    mov         ecx,edi
 0073CFEE    mov         eax,dword ptr [ebp-8]
 0073CFF1    call        @UStrCopy
 0073CFF6    mov         ecx,dword ptr [ebp-28]
 0073CFF9    lea         eax,[ebp-0C]
 0073CFFC    mov         edx,73D810;'//'
 0073D001    call        @UStrCat3
 0073D006    mov         eax,dword ptr [ebp-8]
 0073D009    test        eax,eax
>0073D00B    je          0073D012
 0073D00D    sub         eax,4
 0073D010    mov         eax,dword ptr [eax]
 0073D012    lea         edx,[ebp-8]
 0073D015    mov         ecx,eax
 0073D017    mov         eax,ebx
 0073D019    xchg        eax,edx
 0073D01A    call        @UStrDelete
>0073D01F    jmp         0073D029
 0073D021    lea         eax,[ebp-0C]
 0073D024    call        @UStrClr
 0073D029    mov         edx,dword ptr [ebp-8]
 0073D02C    mov         eax,73D824;'['
 0073D031    call        Pos
 0073D036    mov         ebx,eax
 0073D038    test        ebx,ebx
>0073D03A    jle         0073D720
 0073D040    lea         eax,[ebp-8]
 0073D043    mov         ecx,ebx
 0073D045    mov         edx,1
 0073D04A    call        @UStrDelete
 0073D04F    mov         edx,dword ptr [ebp-8]
 0073D052    mov         eax,73D834;']'
 0073D057    call        Pos
 0073D05C    mov         ebx,eax
 0073D05E    test        ebx,ebx
>0073D060    jle         0073D6F3
 0073D066    lea         eax,[ebp-10]
 0073D069    push        eax
 0073D06A    mov         ecx,ebx
 0073D06C    dec         ecx
 0073D06D    mov         edx,1
 0073D072    mov         eax,dword ptr [ebp-8]
 0073D075    call        @UStrCopy
 0073D07A    lea         edx,[ebp-2C]
 0073D07D    mov         eax,dword ptr [ebp-10]
 0073D080    call        Trim
 0073D085    mov         eax,dword ptr [ebp-2C]
 0073D088    lea         edx,[ebp-14]
 0073D08B    call        LowerCase
 0073D090    mov         eax,dword ptr [ebp-14]
 0073D093    mov         edx,73D844;'acc_mouse'
 0073D098    call        @UStrEqual
>0073D09D    jne         0073D0B1
 0073D09F    lea         eax,[ebp-10]
 0073D0A2    mov         edx,73D844;'acc_mouse'
 0073D0A7    call        @UStrLAsg
>0073D0AC    jmp         0073D2C5
 0073D0B1    mov         eax,dword ptr [ebp-14]
 0073D0B4    mov         edx,73D864;'flick'
 0073D0B9    call        @UStrEqual
>0073D0BE    jne         0073D0D2
 0073D0C0    lea         eax,[ebp-10]
 0073D0C3    mov         edx,73D87C;'(|wiimote.RelAcc|>9)'
 0073D0C8    call        @UStrLAsg
>0073D0CD    jmp         0073D2C5
 0073D0D2    mov         eax,dword ptr [ebp-14]
 0073D0D5    mov         edx,73D8B4;'title'
 0073D0DA    call        @UStrEqual
>0073D0DF    jne         0073D0F3
 0073D0E1    lea         eax,[ebp-10]
 0073D0E4    mov         edx,73D8CC;'var.title'
 0073D0E9    call        @UStrLAsg
>0073D0EE    jmp         0073D2C5
 0073D0F3    mov         eax,dword ptr [ebp-14]
 0073D0F6    mov         edx,73D8EC;'1'
 0073D0FB    call        @UStrEqual
>0073D100    jne         0073D114
 0073D102    lea         eax,[ebp-10]
 0073D105    mov         edx,73D8FC;'wiimote.one'
 0073D10A    call        @UStrLAsg
>0073D10F    jmp         0073D2C5
 0073D114    mov         eax,dword ptr [ebp-14]
 0073D117    mov         edx,73D920;'2'
 0073D11C    call        @UStrEqual
>0073D121    jne         0073D135
 0073D123    lea         eax,[ebp-10]
 0073D126    mov         edx,73D930;'wiimote.two'
 0073D12B    call        @UStrLAsg
>0073D130    jmp         0073D2C5
 0073D135    lea         eax,[ebp-30]
 0073D138    push        eax
 0073D139    mov         ecx,3
 0073D13E    mov         edx,1
 0073D143    mov         eax,dword ptr [ebp-14]
 0073D146    call        @UStrCopy
 0073D14B    mov         eax,dword ptr [ebp-30]
 0073D14E    mov         edx,73D954;'cc_'
 0073D153    call        @UStrEqual
>0073D158    jne         0073D2B5
 0073D15E    lea         eax,[ebp-14]
 0073D161    mov         ecx,3
 0073D166    mov         edx,1
 0073D16B    call        @UStrDelete
 0073D170    lea         eax,[ebp-34]
 0073D173    push        eax
 0073D174    mov         ecx,5
 0073D179    mov         edx,1
 0073D17E    mov         eax,dword ptr [ebp-14]
 0073D181    call        @UStrCopy
 0073D186    mov         eax,dword ptr [ebp-34]
 0073D189    mov         edx,73D968;'dpad_'
 0073D18E    call        @UStrEqual
>0073D193    jne         0073D1AC
 0073D195    lea         eax,[ebp-14]
 0073D198    mov         ecx,5
 0073D19D    mov         edx,1
 0073D1A2    call        @UStrDelete
>0073D1A7    jmp         0073D2A3
 0073D1AC    mov         eax,dword ptr [ebp-14]
 0073D1AF    mov         edx,73D980;'ls_up'
 0073D1B4    call        @UStrEqual
>0073D1B9    jne         0073D1CD
 0073D1BB    lea         eax,[ebp-14]
 0073D1BE    mov         edx,73D998;'joy1y<-0.4'
 0073D1C3    call        @UStrLAsg
>0073D1C8    jmp         0073D2A3
 0073D1CD    mov         eax,dword ptr [ebp-14]
 0073D1D0    mov         edx,73D9BC;'ls_down'
 0073D1D5    call        @UStrEqual
>0073D1DA    jne         0073D1EE
 0073D1DC    lea         eax,[ebp-14]
 0073D1DF    mov         edx,73D9D8;'joy1y>0.4'
 0073D1E4    call        @UStrLAsg
>0073D1E9    jmp         0073D2A3
 0073D1EE    mov         eax,dword ptr [ebp-14]
 0073D1F1    mov         edx,73D9F8;'ls_left'
 0073D1F6    call        @UStrEqual
>0073D1FB    jne         0073D20F
 0073D1FD    lea         eax,[ebp-14]
 0073D200    mov         edx,73DA14;'joy1x<-0.4'
 0073D205    call        @UStrLAsg
>0073D20A    jmp         0073D2A3
 0073D20F    mov         eax,dword ptr [ebp-14]
 0073D212    mov         edx,73DA38;'ls_right'
 0073D217    call        @UStrEqual
>0073D21C    jne         0073D22D
 0073D21E    lea         eax,[ebp-14]
 0073D221    mov         edx,73DA58;'joy1x>0.4'
 0073D226    call        @UStrLAsg
>0073D22B    jmp         0073D2A3
 0073D22D    mov         eax,dword ptr [ebp-14]
 0073D230    mov         edx,73DA78;'rs_up'
 0073D235    call        @UStrEqual
>0073D23A    jne         0073D24B
 0073D23C    lea         eax,[ebp-14]
 0073D23F    mov         edx,73DA90;'joy2y<-0.4'
 0073D244    call        @UStrLAsg
>0073D249    jmp         0073D2A3
 0073D24B    mov         eax,dword ptr [ebp-14]
 0073D24E    mov         edx,73DAB4;'rs_down'
 0073D253    call        @UStrEqual
>0073D258    jne         0073D269
 0073D25A    lea         eax,[ebp-14]
 0073D25D    mov         edx,73DAD0;'joy2y>0.4'
 0073D262    call        @UStrLAsg
>0073D267    jmp         0073D2A3
 0073D269    mov         eax,dword ptr [ebp-14]
 0073D26C    mov         edx,73DAF0;'rs_left'
 0073D271    call        @UStrEqual
>0073D276    jne         0073D287
 0073D278    lea         eax,[ebp-14]
 0073D27B    mov         edx,73DB0C;'joy2x<-0.4'
 0073D280    call        @UStrLAsg
>0073D285    jmp         0073D2A3
 0073D287    mov         eax,dword ptr [ebp-14]
 0073D28A    mov         edx,73DB30;'rs_right'
 0073D28F    call        @UStrEqual
>0073D294    jne         0073D2A3
 0073D296    lea         eax,[ebp-14]
 0073D299    mov         edx,73DB50;'joy2x>0.4'
 0073D29E    call        @UStrLAsg
 0073D2A3    lea         eax,[ebp-10]
 0073D2A6    mov         ecx,dword ptr [ebp-14]
 0073D2A9    mov         edx,73DB70;'classic.'
 0073D2AE    call        @UStrCat3
>0073D2B3    jmp         0073D2C5
 0073D2B5    lea         eax,[ebp-10]
 0073D2B8    mov         ecx,dword ptr [ebp-10]
 0073D2BB    mov         edx,73DB90;'wiimote.'
 0073D2C0    call        @UStrCat3
 0073D2C5    lea         eax,[ebp-8]
 0073D2C8    mov         ecx,ebx
 0073D2CA    mov         edx,1
 0073D2CF    call        @UStrDelete
 0073D2D4    lea         edx,[ebp-38]
 0073D2D7    mov         eax,dword ptr [ebp-8]
 0073D2DA    call        Trim
 0073D2DF    mov         edx,dword ptr [ebp-38]
 0073D2E2    lea         eax,[ebp-8]
 0073D2E5    call        @UStrLAsg
 0073D2EA    mov         edx,dword ptr [ebp-8]
 0073D2ED    mov         eax,73D824;'['
 0073D2F2    call        Pos
 0073D2F7    mov         ebx,eax
 0073D2F9    test        ebx,ebx
>0073D2FB    jle         0073D316
 0073D2FD    mov         eax,dword ptr [ebp-8]
 0073D300    test        eax,eax
>0073D302    je          0073D309
 0073D304    sub         eax,4
 0073D307    mov         eax,dword ptr [eax]
 0073D309    lea         edx,[ebp-8]
 0073D30C    mov         ecx,eax
 0073D30E    mov         eax,ebx
 0073D310    xchg        eax,edx
 0073D311    call        @UStrDelete
 0073D316    lea         edx,[ebp-14]
 0073D319    mov         eax,dword ptr [ebp-8]
 0073D31C    call        LowerCase
 0073D321    lea         eax,[ebp-3C]
 0073D324    push        eax
 0073D325    mov         ecx,8
 0073D32A    mov         edx,1
 0073D32F    mov         eax,dword ptr [ebp-14]
 0073D332    call        @UStrCopy
 0073D337    mov         eax,dword ptr [ebp-3C]
 0073D33A    mov         edx,73DBB0;'keyboard'
 0073D33F    call        @UStrEqual
>0073D344    jne         0073D3E2
 0073D34A    lea         eax,[ebp-8]
 0073D34D    mov         ecx,8
 0073D352    mov         edx,1
 0073D357    call        @UStrDelete
 0073D35C    lea         edx,[ebp-40]
 0073D35F    mov         eax,dword ptr [ebp-8]
 0073D362    call        Trim
 0073D367    mov         edx,dword ptr [ebp-40]
 0073D36A    lea         eax,[ebp-8]
 0073D36D    call        @UStrLAsg
 0073D372    lea         edx,[ebp-44]
 0073D375    mov         eax,dword ptr [ebp-8]
 0073D378    call        LowerCase
 0073D37D    mov         eax,dword ptr [ebp-44]
 0073D380    mov         edx,73DBD0;'shift_r'
 0073D385    call        @UStrEqual
>0073D38A    jne         0073D39B
 0073D38C    lea         eax,[ebp-8]
 0073D38F    mov         edx,73DBEC;'RightShift'
 0073D394    call        @UStrLAsg
>0073D399    jmp         0073D3C2
 0073D39B    lea         edx,[ebp-48]
 0073D39E    mov         eax,dword ptr [ebp-8]
 0073D3A1    call        LowerCase
 0073D3A6    mov         eax,dword ptr [ebp-48]
 0073D3A9    mov         edx,73DC10;'shift_l'
 0073D3AE    call        @UStrEqual
>0073D3B3    jne         0073D3C2
 0073D3B5    lea         eax,[ebp-8]
 0073D3B8    mov         edx,73DC2C;'LeftShift'
 0073D3BD    call        @UStrLAsg
 0073D3C2    lea         edx,[ebp-4C]
 0073D3C5    mov         eax,dword ptr [ebp-8]
 0073D3C8    call        Trim
 0073D3CD    mov         ecx,dword ptr [ebp-4C]
 0073D3D0    lea         eax,[ebp-8]
 0073D3D3    mov         edx,73DC4C;'keyboard.'
 0073D3D8    call        @UStrCat3
>0073D3DD    jmp         0073D562
 0073D3E2    lea         eax,[ebp-50]
 0073D3E5    push        eax
 0073D3E6    mov         ecx,0A
 0073D3EB    mov         edx,1
 0073D3F0    mov         eax,dword ptr [ebp-14]
 0073D3F3    call        @UStrCopy
 0073D3F8    mov         eax,dword ptr [ebp-50]
 0073D3FB    mov         edx,73DC6C;'mouseclick'
 0073D400    call        @UStrEqual
>0073D405    jne         0073D4B2
 0073D40B    lea         eax,[ebp-8]
 0073D40E    mov         ecx,0A
 0073D413    mov         edx,1
 0073D418    call        @UStrDelete
 0073D41D    lea         edx,[ebp-54]
 0073D420    mov         eax,dword ptr [ebp-8]
 0073D423    call        Trim
 0073D428    mov         edx,dword ptr [ebp-54]
 0073D42B    lea         eax,[ebp-8]
 0073D42E    call        @UStrLAsg
 0073D433    mov         eax,dword ptr [ebp-8]
 0073D436    mov         edx,73D8EC;'1'
 0073D43B    call        @UStrEqual
>0073D440    jne         0073D451
 0073D442    lea         eax,[ebp-8]
 0073D445    mov         edx,73DC90;'LeftButton'
 0073D44A    call        @UStrLAsg
>0073D44F    jmp         0073D49D
 0073D451    mov         eax,dword ptr [ebp-8]
 0073D454    mov         edx,73D920;'2'
 0073D459    call        @UStrEqual
>0073D45E    jne         0073D46F
 0073D460    lea         eax,[ebp-8]
 0073D463    mov         edx,73DCB4;'MiddleButton'
 0073D468    call        @UStrLAsg
>0073D46D    jmp         0073D49D
 0073D46F    mov         eax,dword ptr [ebp-8]
 0073D472    mov         edx,73DCDC;'3'
 0073D477    call        @UStrEqual
>0073D47C    jne         0073D48D
 0073D47E    lea         eax,[ebp-8]
 0073D481    mov         edx,73DCEC;'RightButton'
 0073D486    call        @UStrLAsg
>0073D48B    jmp         0073D49D
 0073D48D    lea         eax,[ebp-8]
 0073D490    mov         ecx,dword ptr [ebp-8]
 0073D493    mov         edx,73DD10;'Button'
 0073D498    call        @UStrCat3
 0073D49D    lea         eax,[ebp-8]
 0073D4A0    mov         ecx,dword ptr [ebp-8]
 0073D4A3    mov         edx,73DD2C;'mouse.'
 0073D4A8    call        @UStrCat3
>0073D4AD    jmp         0073D562
 0073D4B2    lea         eax,[ebp-58]
 0073D4B5    push        eax
 0073D4B6    mov         ecx,0D
 0073D4BB    mov         edx,1
 0073D4C0    mov         eax,dword ptr [ebp-14]
 0073D4C3    call        @UStrCopy
 0073D4C8    mov         eax,dword ptr [ebp-58]
 0073D4CB    mov         edx,73DD48;'switchprofile'
 0073D4D0    call        @UStrEqual
>0073D4D5    jne         0073D51B
 0073D4D7    lea         eax,[ebp-8]
 0073D4DA    mov         ecx,0D
 0073D4DF    mov         edx,1
 0073D4E4    call        @UStrDelete
 0073D4E9    lea         edx,[ebp-5C]
 0073D4EC    mov         eax,dword ptr [ebp-8]
 0073D4EF    call        Trim
 0073D4F4    mov         edx,dword ptr [ebp-5C]
 0073D4F7    lea         eax,[ebp-8]
 0073D4FA    call        @UStrLAsg
 0073D4FF    push        73DD70;'chain("'
 0073D504    push        dword ptr [ebp-8]
 0073D507    push        73DD8C;'")'
 0073D50C    lea         eax,[ebp-8]
 0073D50F    mov         edx,3
 0073D514    call        @UStrCatN
>0073D519    jmp         0073D562
 0073D51B    mov         eax,dword ptr [ebp-10]
 0073D51E    mov         edx,73D8CC;'var.title'
 0073D523    call        @UStrEqual
>0073D528    je          0073D562
 0073D52A    mov         eax,dword ptr [ebp-10]
 0073D52D    mov         edx,73D844;'acc_mouse'
 0073D532    call        @UStrEqual
>0073D537    je          0073D562
 0073D539    mov         eax,dword ptr [ebp-10]
 0073D53C    mov         edx,73DDA0;'wiimote.ir_mouse'
 0073D541    call        @UStrEqual
>0073D546    je          0073D562
 0073D548    push        73DDD0;'execute("'
 0073D54D    push        dword ptr [ebp-8]
 0073D550    push        73DD8C;'")'
 0073D555    lea         eax,[ebp-8]
 0073D558    mov         edx,3
 0073D55D    call        @UStrCatN
 0073D562    mov         eax,dword ptr [ebp-10]
 0073D565    mov         edx,73D8CC;'var.title'
 0073D56A    call        @UStrEqual
>0073D56F    jne         0073D5B1
 0073D571    push        dword ptr [ebp-10]
 0073D574    push        73DDF0;' = "'
 0073D579    push        dword ptr [ebp-8]
 0073D57C    push        73DE08;'" '
 0073D581    push        dword ptr [ebp-0C]
 0073D584    lea         eax,[ebp-60]
 0073D587    mov         edx,5
 0073D58C    call        @UStrCatN
 0073D591    mov         edx,dword ptr [ebp-60]
 0073D594    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073D599    mov         eax,dword ptr [eax]
 0073D59B    mov         eax,dword ptr [eax+394]
 0073D5A1    mov         eax,dword ptr [eax+2A4]
 0073D5A7    mov         ecx,dword ptr [eax]
 0073D5A9    call        dword ptr [ecx+38]
>0073D5AC    jmp         0073D73B
 0073D5B1    mov         eax,dword ptr [ebp-10]
 0073D5B4    mov         edx,73D844;'acc_mouse'
 0073D5B9    call        @UStrEqual
>0073D5BE    jne         0073D61C
 0073D5C0    mov         eax,dword ptr [ebp-8]
 0073D5C3    mov         edx,73D8EC;'1'
 0073D5C8    call        @UStrEqual
>0073D5CD    jne         0073D61C
 0073D5CF    lea         eax,[ebp-64]
 0073D5D2    mov         ecx,dword ptr [ebp-0C]
 0073D5D5    mov         edx,73DE1C;'mouse.x = MapRange(Wiimote.Roll,-60,60,0,1) '
 0073D5DA    call        @UStrCat3
 0073D5DF    mov         edx,dword ptr [ebp-64]
 0073D5E2    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073D5E7    mov         eax,dword ptr [eax]
 0073D5E9    mov         eax,dword ptr [eax+394]
 0073D5EF    mov         eax,dword ptr [eax+2A4]
 0073D5F5    mov         ecx,dword ptr [eax]
 0073D5F7    call        dword ptr [ecx+38]
 0073D5FA    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073D5FF    mov         eax,dword ptr [eax]
 0073D601    mov         eax,dword ptr [eax+394]
 0073D607    mov         eax,dword ptr [eax+2A4]
 0073D60D    mov         edx,73DE84;'mouse.y = MapRange(Wiimote.Pitch,-60,60,1,0) '
 0073D612    mov         ecx,dword ptr [eax]
 0073D614    call        dword ptr [ecx+38]
>0073D617    jmp         0073D73B
 0073D61C    mov         eax,dword ptr [ebp-10]
 0073D61F    mov         edx,73DDA0;'wiimote.ir_mouse'
 0073D624    call        @UStrEqual
>0073D629    jne         0073D6B6
 0073D62F    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073D634    mov         eax,dword ptr [eax]
 0073D636    mov         eax,dword ptr [eax+394]
 0073D63C    mov         eax,dword ptr [eax+2A4]
 0073D642    mov         edx,73DEEC;'if wiimote.pointervisible then'
 0073D647    mov         ecx,dword ptr [eax]
 0073D649    call        dword ptr [ecx+38]
 0073D64C    lea         eax,[ebp-68]
 0073D64F    mov         ecx,dword ptr [ebp-0C]
 0073D652    mov         edx,73DF38;'  mouse.x = wiimote.PointerX '
 0073D657    call        @UStrCat3
 0073D65C    mov         edx,dword ptr [ebp-68]
 0073D65F    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073D664    mov         eax,dword ptr [eax]
 0073D666    mov         eax,dword ptr [eax+394]
 0073D66C    mov         eax,dword ptr [eax+2A4]
 0073D672    mov         ecx,dword ptr [eax]
 0073D674    call        dword ptr [ecx+38]
 0073D677    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073D67C    mov         eax,dword ptr [eax]
 0073D67E    mov         eax,dword ptr [eax+394]
 0073D684    mov         eax,dword ptr [eax+2A4]
 0073D68A    mov         edx,73DF80;'  mouse.y = wiimote.PointerY'
 0073D68F    mov         ecx,dword ptr [eax]
 0073D691    call        dword ptr [ecx+38]
 0073D694    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073D699    mov         eax,dword ptr [eax]
 0073D69B    mov         eax,dword ptr [eax+394]
 0073D6A1    mov         eax,dword ptr [eax+2A4]
 0073D6A7    mov         edx,73DFC8;'end if'
 0073D6AC    mov         ecx,dword ptr [eax]
 0073D6AE    call        dword ptr [ecx+38]
>0073D6B1    jmp         0073D73B
 0073D6B6    push        dword ptr [ebp-8]
 0073D6B9    push        73DFE4;' = '
 0073D6BE    push        dword ptr [ebp-10]
 0073D6C1    push        73DFF8;' '
 0073D6C6    push        dword ptr [ebp-0C]
 0073D6C9    lea         eax,[ebp-6C]
 0073D6CC    mov         edx,5
 0073D6D1    call        @UStrCatN
 0073D6D6    mov         edx,dword ptr [ebp-6C]
 0073D6D9    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073D6DE    mov         eax,dword ptr [eax]
 0073D6E0    mov         eax,dword ptr [eax+394]
 0073D6E6    mov         eax,dword ptr [eax+2A4]
 0073D6EC    mov         ecx,dword ptr [eax]
 0073D6EE    call        dword ptr [ecx+38]
>0073D6F1    jmp         0073D73B
 0073D6F3    lea         eax,[ebp-70]
 0073D6F6    mov         ecx,dword ptr [ebp-0C]
 0073D6F9    mov         edx,73E008;'//ERROR!!! '
 0073D6FE    call        @UStrCat3
 0073D703    mov         edx,dword ptr [ebp-70]
 0073D706    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073D70B    mov         eax,dword ptr [eax]
 0073D70D    mov         eax,dword ptr [eax+394]
 0073D713    mov         eax,dword ptr [eax+2A4]
 0073D719    mov         ecx,dword ptr [eax]
 0073D71B    call        dword ptr [ecx+38]
>0073D71E    jmp         0073D73B
 0073D720    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073D725    mov         eax,dword ptr [eax]
 0073D727    mov         eax,dword ptr [eax+394]
 0073D72D    mov         eax,dword ptr [eax+2A4]
 0073D733    mov         edx,dword ptr [ebp-0C]
 0073D736    mov         ecx,dword ptr [eax]
 0073D738    call        dword ptr [ecx+38]
 0073D73B    inc         dword ptr [ebp-18]
 0073D73E    dec         esi
>0073D73F    jne         0073CFB8
 0073D745    xor         eax,eax
 0073D747    pop         edx
 0073D748    pop         ecx
 0073D749    pop         ecx
 0073D74A    mov         dword ptr fs:[eax],edx
>0073D74D    jmp         0073D76A
>0073D74F    jmp         @HandleOnException
 0073D754    dd          1
 0073D758    dd          00418C04;Exception
 0073D75C    dd          0073D760
 0073D760    call        004FA644
 0073D765    call        @DoneExcept
 0073D76A    mov         eax,dword ptr [ebp-1C]
 0073D76D    call        TObject.Free
 0073D772    xor         eax,eax
 0073D774    pop         edx
 0073D775    pop         ecx
 0073D776    pop         ecx
 0073D777    mov         dword ptr fs:[eax],edx
 0073D77A    push        73D7A1
 0073D77F    lea         eax,[ebp-70]
 0073D782    mov         edx,15
 0073D787    call        @UStrArrayClr
 0073D78C    lea         eax,[ebp-14]
 0073D78F    mov         edx,5
 0073D794    call        @UStrArrayClr
 0073D799    ret
>0073D79A    jmp         @HandleFinally
>0073D79F    jmp         0073D77F
 0073D7A1    pop         edi
 0073D7A2    pop         esi
 0073D7A3    pop         ebx
 0073D7A4    mov         esp,ebp
 0073D7A6    pop         ebp
 0073D7A7    ret
*}
end;

//0073E020
{*function sub_0073E020(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 0073E020    push        ebp
 0073E021    mov         ebp,esp
 0073E023    push        0
 0073E025    push        0
 0073E027    push        0
 0073E029    push        0
 0073E02B    push        0
 0073E02D    push        0
 0073E02F    push        0
 0073E031    push        0
 0073E033    push        ebx
 0073E034    push        esi
 0073E035    push        edi
 0073E036    mov         dword ptr [ebp-0C],ecx
 0073E039    mov         dword ptr [ebp-8],edx
 0073E03C    mov         dword ptr [ebp-4],eax
 0073E03F    mov         eax,dword ptr [ebp-4]
 0073E042    call        @UStrAddRef
 0073E047    mov         eax,dword ptr [ebp-8]
 0073E04A    test        eax,eax
>0073E04C    je          0073E052
 0073E04E    xor         edx,edx
 0073E050    mov         dword ptr [eax],edx
 0073E052    mov         eax,dword ptr [ebp-0C]
 0073E055    test        eax,eax
>0073E057    je          0073E05D
 0073E059    xor         edx,edx
 0073E05B    mov         dword ptr [eax],edx
 0073E05D    mov         eax,dword ptr [ebp+14]
 0073E060    test        eax,eax
>0073E062    je          0073E068
 0073E064    xor         edx,edx
 0073E066    mov         dword ptr [eax],edx
 0073E068    mov         eax,dword ptr [ebp+10]
 0073E06B    test        eax,eax
>0073E06D    je          0073E073
 0073E06F    xor         edx,edx
 0073E071    mov         dword ptr [eax],edx
 0073E073    mov         eax,dword ptr [ebp+0C]
 0073E076    test        eax,eax
>0073E078    je          0073E07E
 0073E07A    xor         edx,edx
 0073E07C    mov         dword ptr [eax],edx
 0073E07E    mov         eax,dword ptr [ebp+8]
 0073E081    test        eax,eax
>0073E083    je          0073E089
 0073E085    xor         edx,edx
 0073E087    mov         dword ptr [eax],edx
 0073E089    xor         eax,eax
 0073E08B    push        ebp
 0073E08C    push        73E28A
 0073E091    push        dword ptr fs:[eax]
 0073E094    mov         dword ptr fs:[eax],esp
 0073E097    mov         bl,1
 0073E099    lea         edx,[ebp-10]
 0073E09C    mov         eax,dword ptr [ebp-4]
 0073E09F    call        Trim
 0073E0A4    mov         edx,dword ptr [ebp-10]
 0073E0A7    lea         eax,[ebp-4]
 0073E0AA    call        @UStrLAsg
 0073E0AF    mov         edx,dword ptr [ebp-4]
 0073E0B2    mov         eax,73E2A8;'#'
 0073E0B7    call        Pos
 0073E0BC    mov         esi,eax
 0073E0BE    test        esi,esi
>0073E0C0    jle         0073E10A
 0073E0C2    mov         edi,dword ptr [ebp-4]
 0073E0C5    test        edi,edi
>0073E0C7    je          0073E0CE
 0073E0C9    sub         edi,4
 0073E0CC    mov         edi,dword ptr [edi]
 0073E0CE    lea         eax,[ebp-14]
 0073E0D1    push        eax
 0073E0D2    lea         edx,[esi+1]
 0073E0D5    mov         ecx,edi
 0073E0D7    mov         eax,dword ptr [ebp-4]
 0073E0DA    call        @UStrCopy
 0073E0DF    mov         ecx,dword ptr [ebp-14]
 0073E0E2    mov         eax,dword ptr [ebp+8]
 0073E0E5    mov         edx,73E2B8;'//'
 0073E0EA    call        @UStrCat3
 0073E0EF    mov         eax,dword ptr [ebp-4]
 0073E0F2    test        eax,eax
>0073E0F4    je          0073E0FB
 0073E0F6    sub         eax,4
 0073E0F9    mov         eax,dword ptr [eax]
 0073E0FB    lea         edx,[ebp-4]
 0073E0FE    mov         ecx,eax
 0073E100    mov         eax,esi
 0073E102    xchg        eax,edx
 0073E103    call        @UStrDelete
>0073E108    jmp         0073E128
 0073E10A    mov         eax,dword ptr [ebp+8]
 0073E10D    call        @UStrClr
 0073E112    lea         edx,[ebp-18]
 0073E115    mov         eax,dword ptr [ebp-4]
 0073E118    call        Trim
 0073E11D    mov         edx,dword ptr [ebp-18]
 0073E120    lea         eax,[ebp-4]
 0073E123    call        @UStrLAsg
 0073E128    cmp         dword ptr [ebp-4],0
>0073E12C    je          0073E267
 0073E132    xor         ebx,ebx
 0073E134    mov         edx,dword ptr [ebp-4]
 0073E137    mov         eax,73E2CC;' '
 0073E13C    call        Pos
 0073E141    mov         esi,eax
 0073E143    test        esi,esi
>0073E145    jle         0073E267
 0073E14B    lea         eax,[ebp-20]
 0073E14E    push        eax
 0073E14F    mov         ecx,esi
 0073E151    dec         ecx
 0073E152    mov         edx,1
 0073E157    mov         eax,dword ptr [ebp-4]
 0073E15A    call        @UStrCopy
 0073E15F    mov         eax,dword ptr [ebp-20]
 0073E162    lea         edx,[ebp-1C]
 0073E165    call        Trim
 0073E16A    mov         edx,dword ptr [ebp-1C]
 0073E16D    mov         eax,dword ptr [ebp-8]
 0073E170    call        @UStrAsg
 0073E175    mov         eax,dword ptr [ebp-8]
 0073E178    cmp         dword ptr [eax],0
>0073E17B    je          0073E267
 0073E181    lea         eax,[ebp-4]
 0073E184    mov         ecx,esi
 0073E186    mov         edx,1
 0073E18B    call        @UStrDelete
 0073E190    mov         edx,dword ptr [ebp-4]
 0073E193    mov         eax,73E2CC;' '
 0073E198    call        Pos
 0073E19D    mov         esi,eax
 0073E19F    test        esi,esi
>0073E1A1    jle         0073E267
 0073E1A7    mov         eax,dword ptr [ebp-0C]
 0073E1AA    push        eax
 0073E1AB    mov         ecx,esi
 0073E1AD    dec         ecx
 0073E1AE    mov         edx,1
 0073E1B3    mov         eax,dword ptr [ebp-4]
 0073E1B6    call        @UStrCopy
 0073E1BB    lea         eax,[ebp-4]
 0073E1BE    mov         ecx,esi
 0073E1C0    mov         edx,1
 0073E1C5    call        @UStrDelete
 0073E1CA    mov         edx,dword ptr [ebp-4]
 0073E1CD    mov         eax,73E2CC;' '
 0073E1D2    call        Pos
 0073E1D7    mov         esi,eax
 0073E1D9    test        esi,esi
>0073E1DB    jle         0073E267
 0073E1E1    mov         eax,dword ptr [ebp+14]
 0073E1E4    push        eax
 0073E1E5    mov         ecx,esi
 0073E1E7    dec         ecx
 0073E1E8    mov         edx,1
 0073E1ED    mov         eax,dword ptr [ebp-4]
 0073E1F0    call        @UStrCopy
 0073E1F5    lea         eax,[ebp-4]
 0073E1F8    mov         ecx,esi
 0073E1FA    mov         edx,1
 0073E1FF    call        @UStrDelete
 0073E204    mov         edx,dword ptr [ebp-4]
 0073E207    mov         eax,73E2CC;' '
 0073E20C    call        Pos
 0073E211    mov         esi,eax
 0073E213    test        esi,esi
>0073E215    jle         0073E25A
 0073E217    mov         eax,dword ptr [ebp+10]
 0073E21A    push        eax
 0073E21B    mov         ecx,esi
 0073E21D    dec         ecx
 0073E21E    mov         edx,1
 0073E223    mov         eax,dword ptr [ebp-4]
 0073E226    call        @UStrCopy
 0073E22B    lea         eax,[ebp-4]
 0073E22E    mov         ecx,esi
 0073E230    mov         edx,1
 0073E235    call        @UStrDelete
 0073E23A    mov         edx,dword ptr [ebp-4]
 0073E23D    mov         eax,73E2CC;' '
 0073E242    call        Pos
 0073E247    mov         esi,eax
 0073E249    test        esi,esi
>0073E24B    jne         0073E267
 0073E24D    mov         eax,dword ptr [ebp+0C]
 0073E250    mov         edx,dword ptr [ebp-4]
 0073E253    call        @UStrAsg
>0073E258    jmp         0073E265
 0073E25A    mov         eax,dword ptr [ebp+10]
 0073E25D    mov         edx,dword ptr [ebp-4]
 0073E260    call        @UStrAsg
 0073E265    mov         bl,1
 0073E267    xor         eax,eax
 0073E269    pop         edx
 0073E26A    pop         ecx
 0073E26B    pop         ecx
 0073E26C    mov         dword ptr fs:[eax],edx
 0073E26F    push        73E291
 0073E274    lea         eax,[ebp-20]
 0073E277    mov         edx,5
 0073E27C    call        @UStrArrayClr
 0073E281    lea         eax,[ebp-4]
 0073E284    call        @UStrClr
 0073E289    ret
>0073E28A    jmp         @HandleFinally
>0073E28F    jmp         0073E274
 0073E291    mov         eax,ebx
 0073E293    pop         edi
 0073E294    pop         esi
 0073E295    pop         ebx
 0073E296    mov         esp,ebp
 0073E298    pop         ebp
 0073E299    ret         10
end;*}

//0073E2D0
{*function sub_0073E2D0(?:?):?;
begin
 0073E2D0    push        ebp
 0073E2D1    mov         ebp,esp
 0073E2D3    xor         ecx,ecx
 0073E2D5    push        ecx
 0073E2D6    push        ecx
 0073E2D7    push        ecx
 0073E2D8    push        ecx
 0073E2D9    push        ecx
 0073E2DA    push        ecx
 0073E2DB    push        ecx
 0073E2DC    push        ecx
 0073E2DD    push        ebx
 0073E2DE    mov         dword ptr [ebp-4],eax
 0073E2E1    mov         eax,dword ptr [ebp-4]
 0073E2E4    call        @UStrAddRef
 0073E2E9    xor         eax,eax
 0073E2EB    push        ebp
 0073E2EC    push        73E3F6
 0073E2F1    push        dword ptr fs:[eax]
 0073E2F4    mov         dword ptr fs:[eax],esp
 0073E2F7    xor         ebx,ebx
 0073E2F9    lea         eax,[ebp-10]
 0073E2FC    call        @UStrClr
 0073E301    push        eax
 0073E302    lea         eax,[ebp-14]
 0073E305    call        @UStrClr
 0073E30A    push        eax
 0073E30B    lea         eax,[ebp-18]
 0073E30E    call        @UStrClr
 0073E313    push        eax
 0073E314    lea         eax,[ebp-1C]
 0073E317    call        @UStrClr
 0073E31C    push        eax
 0073E31D    lea         eax,[ebp-0C]
 0073E320    call        @UStrClr
 0073E325    push        eax
 0073E326    lea         eax,[ebp-8]
 0073E329    call        @UStrClr
 0073E32E    mov         edx,eax
 0073E330    mov         eax,dword ptr [ebp-4]
 0073E333    pop         ecx
 0073E334    call        0073E020
 0073E339    test        al,al
>0073E33B    je          0073E3DB
 0073E341    cmp         dword ptr [ebp-8],0
>0073E345    jne         0073E34E
 0073E347    mov         bl,1
>0073E349    jmp         0073E3DB
 0073E34E    mov         edx,0FFFFFFD6
 0073E353    mov         eax,dword ptr [ebp-0C]
 0073E356    call        StrToIntDef
 0073E35B    cmp         eax,0FFFFFFD6
>0073E35E    je          0073E3DB
 0073E360    cmp         dword ptr [ebp-18],0
>0073E364    je          0073E378
 0073E366    mov         edx,0FFFFFFD6
 0073E36B    mov         eax,dword ptr [ebp-18]
 0073E36E    call        StrToIntDef
 0073E373    cmp         eax,0FFFFFFD6
>0073E376    je          0073E3DB
 0073E378    lea         edx,[ebp-20]
 0073E37B    mov         eax,dword ptr [ebp-10]
 0073E37E    call        LowerCase
 0073E383    mov         edx,dword ptr [ebp-20]
 0073E386    lea         eax,[ebp-10]
 0073E389    call        @UStrLAsg
 0073E38E    mov         eax,dword ptr [ebp-10]
 0073E391    mov         edx,73E410;'key'
 0073E396    call        @UStrEqual
>0073E39B    je          0073E3D9
 0073E39D    mov         eax,dword ptr [ebp-10]
 0073E3A0    mov         edx,73E424;'key_special'
 0073E3A5    call        @UStrEqual
>0073E3AA    je          0073E3D9
 0073E3AC    mov         eax,dword ptr [ebp-10]
 0073E3AF    mov         edx,73E448;'mouse_click'
 0073E3B4    call        @UStrEqual
>0073E3B9    je          0073E3D9
 0073E3BB    mov         eax,dword ptr [ebp-10]
 0073E3BE    mov         edx,73E46C;'mouse_move_absolute'
 0073E3C3    call        @UStrEqual
>0073E3C8    je          0073E3D9
 0073E3CA    mov         eax,dword ptr [ebp-10]
 0073E3CD    mov         edx,73E4A0;'mouse_move_relative'
 0073E3D2    call        @UStrEqual
>0073E3D7    jne         0073E3DB
 0073E3D9    mov         bl,1
 0073E3DB    xor         eax,eax
 0073E3DD    pop         edx
 0073E3DE    pop         ecx
 0073E3DF    pop         ecx
 0073E3E0    mov         dword ptr fs:[eax],edx
 0073E3E3    push        73E3FD
 0073E3E8    lea         eax,[ebp-20]
 0073E3EB    mov         edx,8
 0073E3F0    call        @UStrArrayClr
 0073E3F5    ret
>0073E3F6    jmp         @HandleFinally
>0073E3FB    jmp         0073E3E8
 0073E3FD    mov         eax,ebx
 0073E3FF    pop         ebx
 0073E400    mov         esp,ebp
 0073E402    pop         ebp
 0073E403    ret
end;*}

//0073E4C8
{*function sub_0073E4C8(?:UnicodeString):?;
begin
 0073E4C8    push        ebp
 0073E4C9    mov         ebp,esp
 0073E4CB    add         esp,0FFFFFFEC
 0073E4CE    push        ebx
 0073E4CF    push        esi
 0073E4D0    push        edi
 0073E4D1    xor         edx,edx
 0073E4D3    mov         dword ptr [ebp-10],edx
 0073E4D6    mov         dword ptr [ebp-4],eax
 0073E4D9    mov         eax,dword ptr [ebp-4]
 0073E4DC    call        @UStrAddRef
 0073E4E1    xor         eax,eax
 0073E4E3    push        ebp
 0073E4E4    push        73E5FD
 0073E4E9    push        dword ptr fs:[eax]
 0073E4EC    mov         dword ptr fs:[eax],esp
 0073E4EF    xor         eax,eax
 0073E4F1    mov         dword ptr [ebp-0C],eax
 0073E4F4    mov         dl,1
 0073E4F6    mov         eax,[0043C7BC];TStringList
 0073E4FB    call        TStringList.Create;TStringList.Create
 0073E500    mov         dword ptr [ebp-8],eax
 0073E503    xor         edx,edx
 0073E505    push        ebp
 0073E506    push        73E578
 0073E50B    push        dword ptr fs:[edx]
 0073E50E    mov         dword ptr fs:[edx],esp
 0073E511    mov         edx,dword ptr [ebp-4]
 0073E514    mov         eax,dword ptr [ebp-8]
 0073E517    mov         ecx,dword ptr [eax]
 0073E519    call        dword ptr [ecx+68];TStrings.LoadFromFile
 0073E51C    mov         eax,dword ptr [ebp-8]
 0073E51F    mov         edx,dword ptr [eax]
 0073E521    call        dword ptr [edx+14];TStringList.GetCount
 0073E524    mov         esi,eax
 0073E526    dec         esi
 0073E527    test        esi,esi
>0073E529    jl          0073E56E
 0073E52B    inc         esi
 0073E52C    xor         ebx,ebx
 0073E52E    lea         ecx,[ebp-10]
 0073E531    mov         edx,ebx
 0073E533    mov         eax,dword ptr [ebp-8]
 0073E536    mov         edi,dword ptr [eax]
 0073E538    call        dword ptr [edi+0C];TStringList.Get
 0073E53B    mov         eax,dword ptr [ebp-10]
 0073E53E    call        0073E2D0
 0073E543    test        al,al
>0073E545    je          0073E54C
 0073E547    inc         dword ptr [ebp-0C]
>0073E54A    jmp         0073E56A
 0073E54C    mov         eax,ebx
 0073E54E    sub         eax,dword ptr [ebp-0C]
 0073E551    cmp         eax,64
>0073E554    jle         0073E56A
 0073E556    xor         ebx,ebx
 0073E558    mov         eax,dword ptr [ebp-8]
 0073E55B    call        TObject.Free
 0073E560    xor         eax,eax
 0073E562    pop         edx
 0073E563    pop         ecx
 0073E564    pop         ecx
 0073E565    mov         dword ptr fs:[eax],edx
>0073E568    jmp         0073E5DF
 0073E56A    inc         ebx
 0073E56B    dec         esi
>0073E56C    jne         0073E52E
 0073E56E    xor         eax,eax
 0073E570    pop         edx
 0073E571    pop         ecx
 0073E572    pop         ecx
 0073E573    mov         dword ptr fs:[eax],edx
>0073E576    jmp         0073E5A4
>0073E578    jmp         @HandleOnException
 0073E57D    dd          1
 0073E581    dd          00418C04;Exception
 0073E585    dd          0073E589
 0073E589    call        004FA644
 0073E58E    xor         ebx,ebx
 0073E590    mov         eax,dword ptr [ebp-8]
 0073E593    call        TObject.Free
 0073E598    call        @DoneExcept
>0073E59D    jmp         0073E5DF
 0073E59F    call        @DoneExcept
 0073E5A4    mov         eax,dword ptr [ebp-8]
 0073E5A7    mov         edx,dword ptr [eax]
 0073E5A9    call        dword ptr [edx+14];TStringList.GetCount
 0073E5AC    test        eax,eax
>0073E5AE    jle         0073E5D1
 0073E5B0    mov         eax,dword ptr [ebp-8]
 0073E5B3    mov         edx,dword ptr [eax]
 0073E5B5    call        dword ptr [edx+14];TStringList.GetCount
 0073E5B8    mov         dword ptr [ebp-14],eax
 0073E5BB    fild        dword ptr [ebp-14]
 0073E5BE    fild        dword ptr [ebp-0C]
 0073E5C1    fdivrp      st(1),st
 0073E5C3    fld         tbyte ptr ds:[73E610];0.9:Extended
 0073E5C9    fcompp
 0073E5CB    wait
 0073E5CC    fnstsw      al
 0073E5CE    sahf
>0073E5CF    jb          0073E5D5
 0073E5D1    xor         ebx,ebx
>0073E5D3    jmp         0073E5D7
 0073E5D5    mov         bl,1
 0073E5D7    mov         eax,dword ptr [ebp-8]
 0073E5DA    call        TObject.Free
 0073E5DF    xor         eax,eax
 0073E5E1    pop         edx
 0073E5E2    pop         ecx
 0073E5E3    pop         ecx
 0073E5E4    mov         dword ptr fs:[eax],edx
 0073E5E7    push        73E604
 0073E5EC    lea         eax,[ebp-10]
 0073E5EF    call        @UStrClr
 0073E5F4    lea         eax,[ebp-4]
 0073E5F7    call        @UStrClr
 0073E5FC    ret
>0073E5FD    jmp         @HandleFinally
>0073E602    jmp         0073E5EC
 0073E604    mov         eax,ebx
 0073E606    pop         edi
 0073E607    pop         esi
 0073E608    pop         ebx
 0073E609    mov         esp,ebp
 0073E60B    pop         ebp
 0073E60C    ret
end;*}

//0073E61C
{*procedure sub_0073E61C(?:UnicodeString; ?:?);
begin
 0073E61C    push        ebp
 0073E61D    mov         ebp,esp
 0073E61F    push        ecx
 0073E620    push        ebx
 0073E621    push        esi
 0073E622    mov         esi,edx
 0073E624    mov         dword ptr [ebp-4],eax
 0073E627    mov         eax,dword ptr [ebp-4]
 0073E62A    call        @UStrAddRef
 0073E62F    xor         eax,eax
 0073E631    push        ebp
 0073E632    push        73E68D
 0073E637    push        dword ptr fs:[eax]
 0073E63A    mov         dword ptr fs:[eax],esp
 0073E63D    mov         ebx,1
>0073E642    jmp         0073E661
 0073E644    mov         eax,dword ptr [ebp-4]
 0073E647    cmp         word ptr [eax+ebx*2-2],5F
>0073E64D    jne         0073E660
 0073E64F    lea         eax,[ebp-4]
 0073E652    mov         ecx,1
 0073E657    mov         edx,ebx
 0073E659    call        @UStrDelete
>0073E65E    jmp         0073E661
 0073E660    inc         ebx
 0073E661    mov         eax,dword ptr [ebp-4]
 0073E664    call        @UStrLen
 0073E669    cmp         ebx,eax
>0073E66B    jle         0073E644
 0073E66D    mov         eax,esi
 0073E66F    mov         edx,dword ptr [ebp-4]
 0073E672    call        @UStrAsg
 0073E677    xor         eax,eax
 0073E679    pop         edx
 0073E67A    pop         ecx
 0073E67B    pop         ecx
 0073E67C    mov         dword ptr fs:[eax],edx
 0073E67F    push        73E694
 0073E684    lea         eax,[ebp-4]
 0073E687    call        @UStrClr
 0073E68C    ret
>0073E68D    jmp         @HandleFinally
>0073E692    jmp         0073E684
 0073E694    pop         esi
 0073E695    pop         ebx
 0073E696    pop         ecx
 0073E697    pop         ebp
 0073E698    ret
end;*}

//0073E69C
procedure sub_0073E69C(?:UnicodeString);
begin
{*
 0073E69C    push        ebp
 0073E69D    mov         ebp,esp
 0073E69F    mov         ecx,0B
 0073E6A4    push        0
 0073E6A6    push        0
 0073E6A8    dec         ecx
>0073E6A9    jne         0073E6A4
 0073E6AB    push        ecx
 0073E6AC    push        ebx
 0073E6AD    push        esi
 0073E6AE    push        edi
 0073E6AF    mov         dword ptr [ebp-4],eax
 0073E6B2    mov         eax,dword ptr [ebp-4]
 0073E6B5    call        @UStrAddRef
 0073E6BA    xor         eax,eax
 0073E6BC    push        ebp
 0073E6BD    push        73EBD0
 0073E6C2    push        dword ptr fs:[eax]
 0073E6C5    mov         dword ptr fs:[eax],esp
 0073E6C8    mov         dl,1
 0073E6CA    mov         eax,[0043C7BC];TStringList
 0073E6CF    call        TStringList.Create;TStringList.Create
 0073E6D4    mov         dword ptr [ebp-30],eax
 0073E6D7    xor         edx,edx
 0073E6D9    push        ebp
 0073E6DA    push        73EB85
 0073E6DF    push        dword ptr fs:[edx]
 0073E6E2    mov         dword ptr fs:[edx],esp
 0073E6E5    mov         edx,dword ptr [ebp-4]
 0073E6E8    mov         eax,dword ptr [ebp-30]
 0073E6EB    mov         ecx,dword ptr [eax]
 0073E6ED    call        dword ptr [ecx+68];TStrings.LoadFromFile
 0073E6F0    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073E6F5    mov         eax,dword ptr [eax]
 0073E6F7    mov         eax,dword ptr [eax+394]
 0073E6FD    mov         eax,dword ptr [eax+2A4]
 0073E703    mov         edx,dword ptr [eax]
 0073E705    call        dword ptr [edx+44]
 0073E708    lea         edx,[ebp-38]
 0073E70B    mov         eax,dword ptr [ebp-4]
 0073E70E    call        ExtractFileName
 0073E713    mov         ecx,dword ptr [ebp-38]
 0073E716    lea         eax,[ebp-34]
 0073E719    mov         edx,73EBEC;'// '
 0073E71E    call        @UStrCat3
 0073E723    mov         ecx,dword ptr [ebp-34]
 0073E726    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073E72B    mov         eax,dword ptr [eax]
 0073E72D    mov         eax,dword ptr [eax+394]
 0073E733    mov         eax,dword ptr [eax+2A4]
 0073E739    xor         edx,edx
 0073E73B    mov         ebx,dword ptr [eax]
 0073E73D    call        dword ptr [ebx+60]
 0073E740    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073E745    mov         eax,dword ptr [eax]
 0073E747    mov         eax,dword ptr [eax+394]
 0073E74D    mov         eax,dword ptr [eax+2A4]
 0073E753    mov         ecx,73EC00;'// Imported from FAAST'
 0073E758    mov         edx,1
 0073E75D    mov         ebx,dword ptr [eax]
 0073E75F    call        dword ptr [ebx+60]
 0073E762    mov         eax,dword ptr [ebp-30]
 0073E765    mov         edx,dword ptr [eax]
 0073E767    call        dword ptr [edx+14];TStringList.GetCount
 0073E76A    mov         esi,eax
 0073E76C    dec         esi
 0073E76D    test        esi,esi
>0073E76F    jl          0073EB7B
 0073E775    inc         esi
 0073E776    xor         ebx,ebx
 0073E778    lea         eax,[ebp-14]
 0073E77B    call        @UStrClr
 0073E780    push        eax
 0073E781    lea         eax,[ebp-18]
 0073E784    call        @UStrClr
 0073E789    push        eax
 0073E78A    lea         eax,[ebp-1C]
 0073E78D    call        @UStrClr
 0073E792    push        eax
 0073E793    lea         eax,[ebp-20]
 0073E796    call        @UStrClr
 0073E79B    push        eax
 0073E79C    lea         ecx,[ebp-3C]
 0073E79F    mov         edx,ebx
 0073E7A1    mov         eax,dword ptr [ebp-30]
 0073E7A4    mov         edi,dword ptr [eax]
 0073E7A6    call        dword ptr [edi+0C];TStringList.Get
 0073E7A9    mov         eax,dword ptr [ebp-3C]
 0073E7AC    push        eax
 0073E7AD    lea         eax,[ebp-10]
 0073E7B0    call        @UStrClr
 0073E7B5    push        eax
 0073E7B6    lea         eax,[ebp-0C]
 0073E7B9    call        @UStrClr
 0073E7BE    mov         edx,eax
 0073E7C0    pop         ecx
 0073E7C1    pop         eax
 0073E7C2    call        0073E020
 0073E7C7    test        al,al
>0073E7C9    jne         0073E805
 0073E7CB    lea         ecx,[ebp-40]
 0073E7CE    mov         edx,ebx
 0073E7D0    mov         eax,dword ptr [ebp-30]
 0073E7D3    mov         edi,dword ptr [eax]
 0073E7D5    call        dword ptr [edi+0C];TStringList.Get
 0073E7D8    lea         eax,[ebp-40]
 0073E7DB    mov         edx,73EC3C;' // unsupported feature or bug'
 0073E7E0    call        @UStrCat
 0073E7E5    mov         edx,dword ptr [ebp-40]
 0073E7E8    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073E7ED    mov         eax,dword ptr [eax]
 0073E7EF    mov         eax,dword ptr [eax+394]
 0073E7F5    mov         eax,dword ptr [eax+2A4]
 0073E7FB    mov         ecx,dword ptr [eax]
 0073E7FD    call        dword ptr [ecx+38]
>0073E800    jmp         0073EB73
 0073E805    cmp         dword ptr [ebp-0C],0
>0073E809    jne         0073E850
 0073E80B    cmp         dword ptr [ebp-20],0
>0073E80F    jne         0073E830
 0073E811    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073E816    mov         eax,dword ptr [eax]
 0073E818    mov         eax,dword ptr [eax+394]
 0073E81E    mov         eax,dword ptr [eax+2A4]
 0073E824    xor         edx,edx
 0073E826    mov         ecx,dword ptr [eax]
 0073E828    call        dword ptr [ecx+38]
>0073E82B    jmp         0073EB73
 0073E830    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073E835    mov         eax,dword ptr [eax]
 0073E837    mov         eax,dword ptr [eax+394]
 0073E83D    mov         eax,dword ptr [eax+2A4]
 0073E843    mov         edx,dword ptr [ebp-20]
 0073E846    mov         ecx,dword ptr [eax]
 0073E848    call        dword ptr [ecx+38]
>0073E84B    jmp         0073EB73
 0073E850    mov         eax,dword ptr [ebp-0C]
 0073E853    mov         edx,73EC88;'left_hand_move'
 0073E858    call        @UStrEqual
>0073E85D    je          0073E872
 0073E85F    mov         eax,dword ptr [ebp-0C]
 0073E862    mov         edx,73ECB4;'right_hand_move'
 0073E867    call        @UStrEqual
>0073E86C    jne         0073E9EE
 0073E872    mov         eax,dword ptr [ebp-0C]
 0073E875    mov         edx,73EC88;'left_hand_move'
 0073E87A    call        @UStrEqual
>0073E87F    jne         0073E890
 0073E881    lea         eax,[ebp-24]
 0073E884    mov         edx,73ECE0;'player.left_hand_'
 0073E889    call        @UStrLAsg
>0073E88E    jmp         0073E8B9
 0073E890    mov         eax,dword ptr [ebp-0C]
 0073E893    mov         edx,73ECB4;'right_hand_move'
 0073E898    call        @UStrEqual
>0073E89D    jne         0073E8AE
 0073E89F    lea         eax,[ebp-24]
 0073E8A2    mov         edx,73ED10;'player.right_hand_'
 0073E8A7    call        @UStrLAsg
>0073E8AC    jmp         0073E8B9
 0073E8AE    lea         eax,[ebp-24]
 0073E8B1    mov         edx,dword ptr [ebp-0C]
 0073E8B4    call        @UStrLAsg
 0073E8B9    mov         eax,dword ptr [ebp-14]
 0073E8BC    mov         edx,73ED44;'mouse_move_absolute'
 0073E8C1    call        @UStrEqual
>0073E8C6    jne         0073E96B
 0073E8CC    push        73ED78;'Mouse.x = Smooth( MapRange('
 0073E8D1    push        dword ptr [ebp-24]
 0073E8D4    push        73EDBC;'x, -'
 0073E8D9    push        dword ptr [ebp-10]
 0073E8DC    push        73EDD4;' inches,'
 0073E8E1    push        dword ptr [ebp-10]
 0073E8E4    push        73EDF4;' inches, 0,1), 2,'
 0073E8E9    push        dword ptr [ebp-1C]
 0073E8EC    push        73EE24;')'
 0073E8F1    lea         eax,[ebp-8]
 0073E8F4    mov         edx,9
 0073E8F9    call        @UStrCatN
 0073E8FE    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073E903    mov         eax,dword ptr [eax]
 0073E905    mov         eax,dword ptr [eax+394]
 0073E90B    mov         eax,dword ptr [eax+2A4]
 0073E911    mov         edx,dword ptr [ebp-8]
 0073E914    mov         ecx,dword ptr [eax]
 0073E916    call        dword ptr [ecx+38]
 0073E919    push        73EE34;'Mouse.y = Smooth( MapRange('
 0073E91E    push        dword ptr [ebp-24]
 0073E921    push        73EE78;'y, -'
 0073E926    push        dword ptr [ebp-10]
 0073E929    push        73EDD4;' inches,'
 0073E92E    push        dword ptr [ebp-10]
 0073E931    push        73EDF4;' inches, 0,1), 2,'
 0073E936    push        dword ptr [ebp-1C]
 0073E939    push        73EE24;')'
 0073E93E    lea         eax,[ebp-8]
 0073E941    mov         edx,9
 0073E946    call        @UStrCatN
 0073E94B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073E950    mov         eax,dword ptr [eax]
 0073E952    mov         eax,dword ptr [eax+394]
 0073E958    mov         eax,dword ptr [eax+2A4]
 0073E95E    mov         edx,dword ptr [ebp-8]
 0073E961    mov         ecx,dword ptr [eax]
 0073E963    call        dword ptr [ecx+38]
>0073E966    jmp         0073EB73
 0073E96B    mov         eax,dword ptr [ebp-14]
 0073E96E    mov         edx,73EE90;'mouse_move_relative'
 0073E973    call        @UStrEqual
>0073E978    jne         0073E9B4
 0073E97A    lea         ecx,[ebp-44]
 0073E97D    mov         edx,ebx
 0073E97F    mov         eax,dword ptr [ebp-30]
 0073E982    mov         edi,dword ptr [eax]
 0073E984    call        dword ptr [edi+0C];TStringList.Get
 0073E987    lea         eax,[ebp-44]
 0073E98A    mov         edx,73EEC4;' // TODO, fix this'
 0073E98F    call        @UStrCat
 0073E994    mov         edx,dword ptr [ebp-44]
 0073E997    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073E99C    mov         eax,dword ptr [eax]
 0073E99E    mov         eax,dword ptr [eax+394]
 0073E9A4    mov         eax,dword ptr [eax+2A4]
 0073E9AA    mov         ecx,dword ptr [eax]
 0073E9AC    call        dword ptr [ecx+38]
>0073E9AF    jmp         0073EB73
 0073E9B4    lea         ecx,[ebp-48]
 0073E9B7    mov         edx,ebx
 0073E9B9    mov         eax,dword ptr [ebp-30]
 0073E9BC    mov         edi,dword ptr [eax]
 0073E9BE    call        dword ptr [edi+0C];TStringList.Get
 0073E9C1    lea         eax,[ebp-48]
 0073E9C4    mov         edx,73EC3C;' // unsupported feature or bug'
 0073E9C9    call        @UStrCat
 0073E9CE    mov         edx,dword ptr [ebp-48]
 0073E9D1    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073E9D6    mov         eax,dword ptr [eax]
 0073E9D8    mov         eax,dword ptr [eax+394]
 0073E9DE    mov         eax,dword ptr [eax+2A4]
 0073E9E4    mov         ecx,dword ptr [eax]
 0073E9E6    call        dword ptr [ecx+38]
>0073E9E9    jmp         0073EB73
 0073E9EE    mov         eax,dword ptr [ebp-0C]
 0073E9F1    mov         edx,73EEF8;'jump'
 0073E9F6    call        @UStrEqual
>0073E9FB    je          0073EA0C
 0073E9FD    mov         eax,dword ptr [ebp-0C]
 0073EA00    mov         edx,73EF10;'walk'
 0073EA05    call        @UStrEqual
>0073EA0A    jne         0073EA28
 0073EA0C    push        73EF28;'player.'
 0073EA11    push        dword ptr [ebp-0C]
 0073EA14    push        73EF44;'_height'
 0073EA19    lea         eax,[ebp-24]
 0073EA1C    mov         edx,3
 0073EA21    call        @UStrCatN
>0073EA26    jmp         0073EA38
 0073EA28    lea         eax,[ebp-24]
 0073EA2B    mov         ecx,dword ptr [ebp-0C]
 0073EA2E    mov         edx,73EF28;'player.'
 0073EA33    call        @UStrCat3
 0073EA38    mov         edx,dword ptr [ebp-0C]
 0073EA3B    mov         eax,73EF60;'lean'
 0073EA40    call        Pos
 0073EA45    test        eax,eax
>0073EA47    jle         0073EA58
 0073EA49    lea         eax,[ebp-2C]
 0073EA4C    mov         edx,73EF78;'degrees'
 0073EA51    call        @UStrLAsg
>0073EA56    jmp         0073EA65
 0073EA58    lea         eax,[ebp-2C]
 0073EA5B    mov         edx,73EF94;'inches'
 0073EA60    call        @UStrLAsg
 0073EA65    mov         eax,dword ptr [ebp-14]
 0073EA68    mov         edx,73EFB0;'key_special'
 0073EA6D    call        @UStrEqual
>0073EA72    jne         0073EA9C
 0073EA74    xor         edx,edx
 0073EA76    mov         eax,dword ptr [ebp-18]
 0073EA79    call        StrToIntDef
 0073EA7E    mov         edi,eax
 0073EA80    lea         edx,[ebp-4C]
 0073EA83    mov         eax,edi
 0073EA85    call        005F21C8
 0073EA8A    mov         ecx,dword ptr [ebp-4C]
 0073EA8D    lea         eax,[ebp-28]
 0073EA90    mov         edx,73EFD4;'key.'
 0073EA95    call        @UStrCat3
>0073EA9A    jmp         0073EB17
 0073EA9C    mov         eax,dword ptr [ebp-14]
 0073EA9F    mov         edx,73EFEC;'key'
 0073EAA4    call        @UStrEqual
>0073EAA9    jne         0073EAC8
 0073EAAB    lea         edx,[ebp-50]
 0073EAAE    mov         eax,dword ptr [ebp-18]
 0073EAB1    call        0073E61C
 0073EAB6    mov         ecx,dword ptr [ebp-50]
 0073EAB9    lea         eax,[ebp-28]
 0073EABC    mov         edx,73EFD4;'key.'
 0073EAC1    call        @UStrCat3
>0073EAC6    jmp         0073EB17
 0073EAC8    mov         eax,dword ptr [ebp-14]
 0073EACB    mov         edx,73F000;'mouse_click'
 0073EAD0    call        @UStrEqual
>0073EAD5    jne         0073EAF4
 0073EAD7    lea         edx,[ebp-54]
 0073EADA    mov         eax,dword ptr [ebp-18]
 0073EADD    call        0073E61C
 0073EAE2    mov         ecx,dword ptr [ebp-54]
 0073EAE5    lea         eax,[ebp-28]
 0073EAE8    mov         edx,73F024;'mouse.'
 0073EAED    call        @UStrCat3
>0073EAF2    jmp         0073EB17
 0073EAF4    push        dword ptr [ebp-14]
 0073EAF7    push        73F040;'.'
 0073EAFC    lea         edx,[ebp-58]
 0073EAFF    mov         eax,dword ptr [ebp-18]
 0073EB02    call        0073E61C
 0073EB07    push        dword ptr [ebp-58]
 0073EB0A    lea         eax,[ebp-28]
 0073EB0D    mov         edx,3
 0073EB12    call        @UStrCatN
 0073EB17    cmp         dword ptr [ebp-20],0
>0073EB1B    je          0073EB2D
 0073EB1D    lea         eax,[ebp-20]
 0073EB20    mov         ecx,dword ptr [ebp-20]
 0073EB23    mov         edx,73F050;' '
 0073EB28    call        @UStrCat3
 0073EB2D    push        dword ptr [ebp-28]
 0073EB30    push        73F060;' = '
 0073EB35    push        dword ptr [ebp-24]
 0073EB38    push        73F074;' >= '
 0073EB3D    push        dword ptr [ebp-10]
 0073EB40    push        73F050;' '
 0073EB45    push        dword ptr [ebp-2C]
 0073EB48    push        dword ptr [ebp-20]
 0073EB4B    lea         eax,[ebp-5C]
 0073EB4E    mov         edx,8
 0073EB53    call        @UStrCatN
 0073EB58    mov         edx,dword ptr [ebp-5C]
 0073EB5B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0073EB60    mov         eax,dword ptr [eax]
 0073EB62    mov         eax,dword ptr [eax+394]
 0073EB68    mov         eax,dword ptr [eax+2A4]
 0073EB6E    mov         ecx,dword ptr [eax]
 0073EB70    call        dword ptr [ecx+38]
 0073EB73    inc         ebx
 0073EB74    dec         esi
>0073EB75    jne         0073E778
 0073EB7B    xor         eax,eax
 0073EB7D    pop         edx
 0073EB7E    pop         ecx
 0073EB7F    pop         ecx
 0073EB80    mov         dword ptr fs:[eax],edx
>0073EB83    jmp         0073EBA0
>0073EB85    jmp         @HandleOnException
 0073EB8A    dd          1
 0073EB8E    dd          00418C04;Exception
 0073EB92    dd          0073EB96
 0073EB96    call        004FA644
 0073EB9B    call        @DoneExcept
 0073EBA0    mov         eax,dword ptr [ebp-30]
 0073EBA3    call        TObject.Free
 0073EBA8    xor         eax,eax
 0073EBAA    pop         edx
 0073EBAB    pop         ecx
 0073EBAC    pop         ecx
 0073EBAD    mov         dword ptr fs:[eax],edx
 0073EBB0    push        73EBD7
 0073EBB5    lea         eax,[ebp-5C]
 0073EBB8    mov         edx,0B
 0073EBBD    call        @UStrArrayClr
 0073EBC2    lea         eax,[ebp-2C]
 0073EBC5    mov         edx,0B
 0073EBCA    call        @UStrArrayClr
 0073EBCF    ret
>0073EBD0    jmp         @HandleFinally
>0073EBD5    jmp         0073EBB5
 0073EBD7    pop         edi
 0073EBD8    pop         esi
 0073EBD9    pop         ebx
 0073EBDA    mov         esp,ebp
 0073EBDC    pop         ebp
 0073EBDD    ret
*}
end;

Initialization
Finalization
//0073F080
{*
 0073F080    push        ebp
 0073F081    mov         ebp,esp
 0073F083    xor         eax,eax
 0073F085    push        ebp
 0073F086    push        73F103
 0073F08B    push        dword ptr fs:[eax]
 0073F08E    mov         dword ptr fs:[eax],esp
 0073F091    inc         dword ptr ds:[822A18]
>0073F097    jne         0073F0F5
 0073F099    mov         eax,78C57C;^'1'
 0073F09E    mov         ecx,0FA
 0073F0A3    mov         edx,dword ptr ds:[40128C];string
 0073F0A9    call        @FinalizeArray
 0073F0AE    mov         eax,822A1C;gvar_00822A1C:UnicodeString
 0073F0B3    call        @UStrClr
 0073F0B8    mov         eax,822A20;gvar_00822A20:UnicodeString
 0073F0BD    call        @UStrClr
 0073F0C2    mov         eax,822A24;gvar_00822A24:UnicodeString
 0073F0C7    call        @UStrClr
 0073F0CC    mov         eax,822A28;gvar_00822A28:UnicodeString
 0073F0D1    call        @UStrClr
 0073F0D6    mov         eax,822A2C;gvar_00822A2C:UnicodeString
 0073F0DB    call        @UStrClr
 0073F0E0    mov         eax,78C964;^'Up'
 0073F0E5    mov         ecx,8
 0073F0EA    mov         edx,dword ptr ds:[40128C];string
 0073F0F0    call        @FinalizeArray
 0073F0F5    xor         eax,eax
 0073F0F7    pop         edx
 0073F0F8    pop         ecx
 0073F0F9    pop         ecx
 0073F0FA    mov         dword ptr fs:[eax],edx
 0073F0FD    push        73F10A
 0073F102    ret
>0073F103    jmp         @HandleFinally
>0073F108    jmp         0073F102
 0073F10A    pop         ebp
 0073F10B    ret
*}
end.