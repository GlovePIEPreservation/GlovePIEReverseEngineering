//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit JvAppStorage;

interface

uses
  SysUtils, Classes, JvAppStorage, WideStrings, JvTranslateString, JclRTTI;

type
  EJVCLAppStorageError = class(EJVCLException)
  end;
  TJvAppStorageListItemEvent = procedure(Sender:TJvCustomAppStorage; const Path:string; const List:TObject; const Index:Integer; const ItemName:string) of object;;
  TJvAppStorageListDeleteEvent = procedure(Sender:TJvCustomAppStorage; const Path:string; const List:TObject; const First:Integer; const Last:Integer; const ItemName:string) of object;;
  TJvAppStoragePropTranslateEvent = procedure(Sender:TJvCustomAppStorage; Instance:TPersistent; var Name:string; const Reading:Boolean) of object;;
  TJvAppStorageCryptEvent = procedure(var Value:string) of object;;
  TJvAppStorageGetFileNameEvent = procedure(Sender:TJvCustomAppStorage; var FileName:TFileName) of object;;
  TJvAppStorageObjectListItemCreateEvent = function(Sender:TJvCustomAppStorage; const Path:string; Index:Integer):TPersistent of object;;
  TJvAppStorageErrorEvent = procedure(Sender:TObject; const Value:string) of object;;
  TJvAppStorageEnumOption = (aeoFolders, aeoValues, aeoReportListAsValue, aeoReportRelative, aeoRecursive);
  TJvAppStorageEnumOptions = set of TJvAppStorageEnumOption;
  TFileLocation = (flCustom, flWindows, flTemp, flExeFile, flUserFolder);
  TJvCustomAppStorage = class(TJvComponent)
  published
    procedure WriteWideStringList(Path:string; SL:TWideStrings; ItemName:string);//005549A0
    function ReadWideStringList(Path:string; SL:TWideStrings; ItemName:string; ClearFirst:Boolean):Integer;//005548D4
    procedure WriteStringList(Path:string; SL:TStrings; ItemName:string);//00554824
    //procedure ReadEnumeration(Path:string; TypeInfo:PTypeInfo; Value:?; Default:?);//0055517C
    //procedure WriteSet(Path:string; ATypeInfo:PTypeInfo; Value:?);//00555AC8
    //procedure ReadSet(Path:string; ATypeInfo:PTypeInfo; Value:?; Default:?);//00555A50
    //procedure WriteEnumeration(Path:string; TypeInfo:PTypeInfo; Value:?);//005551F4
    function ReadStringList(Path:string; SL:TStrings; ItemName:string; ClearFirst:Boolean):Integer;//00554728
    function ReadCollection(Path:string; List:TCollection; ItemName:string; ClearFirst:Boolean):Integer;//00554630
    procedure WriteObjectList(Path:string; List:TList; ItemName:string);//0055460C
    //function ReadObjectList(Path:string; List:TList; ItemName:string; ClearFirst:Boolean; ItemCreator:TJvAppStorageObjectListItemCreateEvent; ?:?):Integer;//005544D8
    procedure WriteCollection(Path:string; List:TCollection; ItemName:string);//005546E0
    procedure WriteStringObjectList(Path:string; SL:TStrings; ItemName:string);//00554BA4
    //function ReadStringObjectList(Path:string; SL:TStrings; ItemName:string; ClearFirst:Boolean; ItemCreator:TJvAppStorageObjectListItemCreateEvent; ?:?):Integer;//00554A08
    procedure ReadStringObjectList(Path:string; SL:TStrings; ItemName:string; ClearFirst:Boolean);//005549E8
    function ReadBoolean(Path:string; Default:Boolean):Boolean;//00554264
    procedure DisablePropertyValueCrypt;//00556C48
    procedure EnablePropertyValueCrypt;//00556C40
    procedure GetStoredValues(Path:string; Strings:TStrings; Options:TJvAppStorageEnumOptions);//00556B00
    function IsPropertyValueCryptEnabled:Boolean;//00556C50
    procedure WriteWideString(Path:string; Value:WideString);//005574F0
    //procedure ReadWideString(Path:string; Default:WideString; ?:?);//005574B0
    //procedure ItemNameIndexPath(ItemName:string; Index:Integer; ?:?);//00556C5C
    //procedure TranslatePropertyName(Instance:TPersistent; AName:string; ?:?; Reading:Boolean);//00556A30
    procedure WriteProperty(Path:string; PersObj:TPersistent; Recursive:Boolean; PropName:string);//00556058
    procedure ReadProperty(Path:string; PersObj:TPersistent; ClearFirst:Boolean; Recursive:Boolean; PropName:string);//00555B48
    procedure WriteBoolean(Path:string; Value:Boolean);//005542D4
    procedure ReadPersistent(Path:string; PersObj:TPersistent; IgnoreProperties:TStrings; ClearFirst:Boolean; Recursive:Boolean);//005564D8
    //procedure GetIntName(Value:Integer; ?:?);//0055686C
    //procedure GetCharName(Ch:Char; ?:?);//00556794
    procedure WritePersistent(Path:string; PersObj:TPersistent; IgnoreProperties:TStrings; Recursive:Boolean);//00556638
    procedure ReadObjectList(Path:string; List:TList; ItemName:string; ClearFirst:Boolean);//005544B8
    procedure CheckDeletePathByVersion(Path:string; VersionNumber:Integer; VersionName:string; WriteVersionNumber:Boolean; DeleteIfNotEqual:Boolean);//00556DE0
    procedure EndUpdate;//00557094
    procedure BeginUpdate;//00556D34
    //procedure ConcatPaths(?:string; ?:?; ?:?);//005539CC
    function PathExists(Path:string):Boolean;//00553B90
    function IsFolder(Path:string; ListIsValue:Boolean):Boolean;//00553B20
    procedure ResolvePath(InPath:string; TargetStore:TJvCustomAppStorage; TargetPath:string);//005539E8
    function FlushNeeded:Boolean;//0055162C
    procedure Flush;//005515C4
    destructor Destroy();//00551568
    constructor Create(AOwner:TComponent);//005514D0
    procedure Reload;//005515C8
    procedure FlushIfNeeded;//0055160C
    function ReloadNeeded:Boolean;//005515EC
    procedure ReloadIfNeeded;//005515CC
    function ValueStored(Path:string):Boolean;//00553BF8
    //procedure WriteDateTime(Path:string; Value:TDateTime; ?:?);//005541E8
    //function ReadDateTime(Path:string; Default:TDateTime; ?:?):TDateTime;//00554174
    procedure WriteString(Path:string; Value:string);//00554004
    function ReadBinary(Path:string; Buf:Pointer; BufSize:Integer):Integer;//0055407C
    //procedure WriteList(Path:string; List:TObject; ItemName:string; OnDeleteItems:TJvAppStorageListDeleteEvent; ?:?; ?:?; OnWriteItem:TJvAppStorageListItemEvent; ?:?; ItemCount:Integer);//005543A0
    //function ReadList(Path:string; List:TObject; ItemName:string; OnReadItem:TJvAppStorageListItemEvent; ?:?):Integer;//0055434C
    procedure WriteBinary(Path:string; Buf:Pointer; BufSize:Integer);//005540F4
    //procedure ReadString(Path:string; Default:string; ?:?);//00553F90
    procedure DeleteSubTree(Path:string);//00553D3C
    procedure DeleteValue(Path:string);//00553CCC
    function ListStored(Path:string; ItemName:string):Boolean;//00553C60
    function ReadInteger(Path:string; Default:Integer):Integer;//00553DAC
    //procedure WriteFloat(Path:string; Value:Extended; ?:?; ?:?);//00553F10
    //function ReadFloat(Path:string; Default:Extended; ?:?; ?:?):Extended;//00553E94
    procedure WriteInteger(Path:string; Value:Integer);//00553E1C
  public
    CachedFormatSettings:TFormatSettings;//f38
    FRoot:string;//fFC
    FCurPath:string;//f100
    FStorageOptions:TJvCustomAppStorageOptions;//f104
    FSubStorages:TJvAppSubStorages;//f108
    FOnTranslatePropertyName:TJvAppStoragePropTranslateEvent;//f110
    FOnEncryptPropertyValue:TJvAppStorageCryptEvent;//f118
    f11A:word;//f11A
    f11C:dword;//f11C
    FOnDecryptPropertyValue:TJvAppStorageCryptEvent;//f120
    f122:word;//f122
    f124:dword;//f124
    FCryptEnabledStatus:Integer;//f128
    FAutoFlush:Boolean;//f12C
    FUpdateCount:Integer;//f130
    FAutoReload:Boolean;//f134
    FCurrentInstanceCreateEvent:TJvAppStorageObjectListItemCreateEvent;//f138
    f13C:dword;//f13C
    FInternalTranslateStringEngine:TJvTranslateString;//f140
    FReadOnly:Boolean;//f144
    FOnError:TJvAppStorageErrorEvent;//f148
    FTranslateStringEngine:TJvTranslateString;//f150
    FSynchronizeFlushReload:Boolean;//f154
    FFlushOnDestroy:Boolean;//f155
    destructor Destroy(); virtual;//00551568
    procedure Loaded; virtual;//vC//00556D10
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0055164C
    constructor Create(AOwner:TComponent); virtual;//v2C//005514D0
    procedure SetFlushOnDestroy(Value:Boolean); virtual;//v34//005516B0
    constructor Create; virtual;//v38//00551754
    //procedure v3C(?:?; ?:?; ?:?); virtual;//v3C//0055175C
    procedure v40; virtual; abstract;//v40//00404A58
    procedure v44; virtual; abstract;//v44//00404A58
    procedure v48; virtual; abstract;//v48//00404A58
    procedure v4C; virtual; abstract;//v4C//00404A58
    procedure v50; virtual; abstract;//v50//00404A58
    //function v54(?:?):?; virtual;//v54//00552CBC
    procedure v58; virtual; abstract;//v58//00404A58
    procedure v5C; virtual; abstract;//v5C//00404A58
    procedure v60; virtual; abstract;//v60//00404A58
    procedure v64; virtual; abstract;//v64//00404A58
    procedure v68; virtual; abstract;//v68//00404A58
    procedure v6C; virtual; abstract;//v6C//00404A58
    procedure v70; virtual; abstract;//v70//00404A58
    procedure v74; virtual; abstract;//v74//00404A58
    //procedure v78(?:?; ?:?; ?:?); virtual;//v78//00552D7C
    //procedure v7C(?:?; ?:?); virtual;//v7C//00552E34
    procedure v80; virtual; abstract;//v80//00404A58
    procedure v84; virtual; abstract;//v84//00404A58
    //procedure v88(?:?; ?:?); virtual;//v88//00552D4C
    //procedure v8C(?:?); virtual;//v8C//00552E1C
    //function v90(?:?; ?:?):Boolean; virtual;//v90//00552EC0
    //procedure v94(?:?; ?:?); virtual;//v94//00552EE0
    //function v98(?:?; ?:?):?; virtual;//v98//00552EEC
    procedure v9C; virtual;//v9C//00552F80
    //procedure vA0(?:?; ?:?; ?:?; ?:?); virtual;//vA0//00552F88
    //procedure vA4(?:?; ?:?; ?:?; ?:?); virtual;//vA4//005531C4
    //procedure vA8(?:?; ?:?; ?:?); virtual;//vA8//00553258
    //procedure vAC(?:?; ?:?); virtual;//vAC//00553350
    //procedure vB0(?:?); virtual;//vB0//005533A8
    //procedure vB4(?:?); virtual;//vB4//005533C4
    //procedure vB8(?:?; ?:?; ?:?); virtual;//vB8//005533E0
    //procedure vBC(?:?; ?:?; ?:?); virtual;//vBC//00553604
    //function vC0(?:?; ?:?):?; virtual;//vC0//00553698
    //procedure vC4(?:?; ?:?); virtual;//vC4//00553894
    //procedure vC8(?:?; ?:?; ?:?; ?:?); virtual;//vC8//00554C80
    //procedure vCC(?:?; ?:?; ?:?); virtual;//vCC//00554F7C
    //procedure vD0(?:?; ?:?; ?:?; ?:?); virtual;//vD0//00555274
    //procedure vD4(?:?; ?:?; ?:?); virtual;//vD4//00555674
    //function vD8:?; virtual;//vD8//00556AFC
    //procedure vDC(?:?); virtual;//vDC//00556F28
    //procedure vE0(?:?; ?:?; ?:?); virtual;//vE0//00557004
    //function vE4(?:?):?; virtual;//vE4//00557218
    //procedure vE8(?:?; ?:?); virtual;//vE8//00557418
    procedure Flush; virtual;//vEC//005515C4
    procedure Reload; virtual;//vF0//005515C8
    function ReloadNeeded:Boolean; virtual;//vF4//005515EC
    function FlushNeeded:Boolean; virtual;//vF8//0055162C
    //procedure GetCharName(Ch:Char; ?:?); virtual;//vFC//00556794
    //procedure GetIntName(Value:Integer; ?:?); virtual;//v100//0055686C
    //procedure ItemNameIndexPath(ItemName:string; Index:Integer; ?:?); virtual;//v104//00556C5C
    procedure SetStorageOptions(Value:TJvCustomAppStorageOptions);//00552C04
    //function GetActiveTranslateStringEngine:?;//005570FC
    procedure SetTranslateStringEngine(Value:TJvTranslateString);//005574A4
  end;
  TJvCustomAppStorageOptions = class(TPersistent)
  published
    //procedure DefaultFalseString(?:?);//00551214
    function IsValueTrueString(Value:string):Boolean;//005512A0
    function IsValueFalseString(Value:string):Boolean;//005512F4
    constructor sub_00550F14;//00550F14
    procedure Assign(Source:TPersistent);//00551010
    //procedure DefaultTrueString(?:?);//00551188
  public
    FBooleanAsString:Boolean;//f4
    FBooleanStringTrueValues:string;//f8
    FBooleanStringFalseValues:string;//fC
    FEnumAsStr:Boolean;//f10
    FIntAsStr:Boolean;//f11
    FSetAsStr:Boolean;//f12
    FDateTimeAsString:Boolean;//f13
    FFloatAsString:Boolean;//f14
    FDefaultIfReadConvertError:Boolean;//f15
    FDefaultIfValueNotExists:Boolean;//f16
    FStoreDefaultValues:Boolean;//f17
    FStoreStringListAsSingleString:Boolean;//f18
    FUseOldItemNameFormat:Boolean;//f19
    FUseTranslateStringEngineDateTimeFormats:Boolean;//f1A
    procedure Assign(Source:TPersistent); virtual;//v8//00551010
    procedure SetBooleanAsString(Value:Boolean); virtual;//vC//00551348
    procedure SetBooleanStringTrueValues(Value:string); virtual;//v10//005513B8
    procedure SetBooleanStringFalseValues(Value:string); virtual;//v14//00551430
    procedure SetEnumerationAsString(Value:Boolean); virtual;//v18//005514A8
    procedure SetTypedIntegerAsString(Value:Boolean); virtual;//v1C//005514AC
    procedure SetSetAsString(Value:Boolean); virtual;//v20//005514B0
    procedure SetDateTimeAsString(Value:Boolean); virtual;//v24//005514B8
    procedure SetFloatAsString(Value:Boolean); virtual;//v28//005514BC
    procedure SetDefaultIfReadConvertError(Value:Boolean); virtual;//v2C//005514C0
    procedure SetDefaultIfValueNotExists(Value:Boolean); virtual;//v30//005514C4
    //function v34(?:?; ?:?):?; virtual;//v34//005510D0
    //procedure v38(?:?); virtual;//v38//005514C8
    procedure SetUseOldItemNameFormat(Value:Boolean); virtual;//v3C//005514CC
    procedure SetStoreDefaultValues(Value:Boolean); virtual;//v40//005514B4
    constructor v44; virtual;//v44//00550F14
  end;
  TJvAppStorageOptions = class(TJvCustomAppStorageOptions)
  end;
  TJvAppSubStorages = class(TOwnedCollection)
  published
    procedure Delete(RootPath:string; IncludeSubPaths:Boolean);//00557798
    procedure Delete(AppStorage:TJvCustomAppStorage);//00557884
    procedure Delete(Index:Integer);//00557790
    constructor Create(AOwner:TJvCustomAppStorage);//00557500
    procedure Add(RootPath:string; AppStorage:TJvCustomAppStorage);//005576F0
  end;
  TJvAppSubStorage = class(TCollectionItem)
  public
    FRootPath:string;//fC
    FAppStorage:TJvCustomAppStorage;//f10
    //procedure GetDisplayName(?:?); virtual;//vC//005578C8
    procedure SetRootPath(Value:string);//00557928
    procedure SetAppStorage(Value:TJvCustomAppStorage);//005579F0
  end;
  TJvCustomAppMemoryFileStorage = class(TJvCustomAppStorage)
  published
    function ReloadNeeded:Boolean;//00557CB4
    procedure Reload;//00557C74
    constructor Create(AOwner:TComponent);//00557A4C
  public
    FFullFileName:TFileName;//f158
    FFileName:TFileName;//f15C
    FLocation:TFileLocation;//f160
    FOnGetFileName:TJvAppStorageGetFileNameEvent;//f168
    f16A:word;//f16A
    f16C:dword;//f16C
    FPhysicalReadOnly:Boolean;//f170
    FFileLoaded:Boolean;//f171
    constructor Create(AOwner:TComponent); virtual;//v2C//00557A4C
    //function vD8:?; virtual;//vD8//00557CDC
    procedure Reload; virtual;//vF0//00557C74
    function ReloadNeeded:Boolean; virtual;//vF4//00557CB4
    //procedure v110(?:?); virtual;//v110//00557EB0
    //procedure v114(?:?); virtual;//v114//00557CE4
    procedure SetReadOnly(Value:Boolean);//00556AC0
    //function GetReadOnly:?;//00556AC8
  end;
  TJvAppStoragePropertyBaseEngine = class(TObject)
  published
    procedure ReadProperty(AStorage:TJvCustomAppStorage; APath:string; ClearFirst:Boolean; Recursive:Boolean; AProperty:TObject; AObject:TObject);//00557EF8
    procedure WriteProperty(AStorage:TJvCustomAppStorage; APath:string; Recursive:Boolean; AProperty:TObject; AObject:TObject);//00557F00
    constructor sub_00557EBC;//00557EBC
    function Supports(AObject:TObject; AProperty:TObject):Boolean;//00557EF4
  public
    constructor v0; virtual;//v0//00557EBC
    function Supports(AObject:TObject; AProperty:TObject):Boolean; virtual;//v4//00557EF4
    procedure ReadProperty(AStorage:TJvCustomAppStorage; APath:string; ClearFirst:Boolean; Recursive:Boolean; AProperty:TObject; AObject:TObject); virtual;//v8//00557EF8
    procedure WriteProperty(AStorage:TJvCustomAppStorage; APath:string; Recursive:Boolean; AProperty:TObject; AObject:TObject); virtual;//vC//00557F00
  end;
  TJvAppStoragePropertyEngineList = class(TList)
  published
    function GetEngine(AObject:TObject; AProperty:TObject):TJvAppStoragePropertyBaseEngine;//00557FB8
    function ReadProperty(AStorage:TJvCustomAppStorage; APath:string; ClearFirst:Boolean; Recursive:Boolean; AProperty:TObject; AObject:TObject):Boolean;//00558014
    function WriteProperty(AStorage:TJvCustomAppStorage; APath:string; Recursive:Boolean; AProperty:TObject; AObject:TObject):Boolean;//0055805C
    destructor Destroy();//00557F08
    procedure RegisterEngine(AEngineClass:TJvAppStoragePropertyBaseEngineClass);//00557F58
    procedure UnregisterEngine(AEngineClass:TJvAppStoragePropertyBaseEngineClass);//00557F70
  public
    destructor Destroy(); virtual;//00557F08
  end;
    //function sub_00550C88:?;//00550C88
    procedure sub_00550CB4;//00550CB4
    //procedure sub_00550CD0(?:string; ?:?; ?:TStrings);//00550CD0
    procedure sub_00550EA8(?:Integer; ?:Integer; ?:PTypeData);//00550EA8
    //function sub_00550ED4(?:?; ?:PTypeData):?;//00550ED4
    //function sub_005510D0(?:?; ?:?):?;//005510D0
    procedure SetBooleanAsString(Value:Boolean);//00551348
    procedure SetBooleanStringTrueValues(Value:string);//005513B8
    procedure SetBooleanStringFalseValues(Value:string);//00551430
    procedure SetEnumerationAsString(Value:Boolean);//005514A8
    procedure SetTypedIntegerAsString(Value:Boolean);//005514AC
    procedure SetSetAsString(Value:Boolean);//005514B0
    procedure SetStoreDefaultValues(Value:Boolean);//005514B4
    procedure SetDateTimeAsString(Value:Boolean);//005514B8
    procedure SetFloatAsString(Value:Boolean);//005514BC
    procedure SetDefaultIfReadConvertError(Value:Boolean);//005514C0
    procedure SetDefaultIfValueNotExists(Value:Boolean);//005514C4
    //procedure sub_005514C8(?:?);//005514C8
    procedure SetUseOldItemNameFormat(Value:Boolean);//005514CC
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0055164C
    procedure SetFlushOnDestroy(Value:Boolean);//005516B0
    //function sub_005516B8(?:TJvCustomAppStorage; ?:TPersistent):?;//005516B8
    //procedure sub_005516D0(?:TJvCustomAppStorage; ?:TPersistent; ?:?; ?:?);//005516D0
    constructor Create;//00551754
    //procedure sub_0055175C(?:?; ?:?; ?:?);//0055175C
    procedure SetSubStorages(Value:TJvAppSubStorages);//00551824
    //procedure sub_00551828(?:TJvCustomAppStorage; ?:?);//00551828
    //procedure sub_00551840(?:TJvCustomAppStorage; ?:?; ?:?);//00551840
    //procedure sub_00552854(?:TJvCustomAppStorage; ?:UnicodeString; ?:TStrings; ?:?; ?:?);//00552854
    //procedure sub_00552B8C(?:TJvCustomAppStorage; ?:?);//00552B8C
    //procedure sub_00552C20(?:TJvCustomAppStorage; ?:TPersistent; ?:?);//00552C20
    //function sub_00552C4C(?:TJvCustomAppStorage; ?:?):?;//00552C4C
    //function sub_00552CBC(?:?):?;//00552CBC
    //procedure sub_00552D4C(?:?; ?:?);//00552D4C
    //procedure sub_00552D7C(?:?; ?:?; ?:?);//00552D7C
    //procedure sub_00552E1C(?:?);//00552E1C
    //procedure sub_00552E34(?:?; ?:?);//00552E34
    procedure sub_00552EA0(?:TJvAppIniFileStorage; ?:string);//00552EA0
    //function sub_00552EC0(?:?; ?:?):Boolean;//00552EC0
    //procedure sub_00552EE0(?:?; ?:?);//00552EE0
    //function sub_00552EEC(?:?; ?:?):?;//00552EEC
    procedure sub_00552F80;//00552F80
    //procedure sub_00552F88(?:?; ?:?; ?:?; ?:?);//00552F88
    //procedure sub_005531C4(?:?; ?:?; ?:?; ?:?);//005531C4
    //procedure sub_00553258(?:?; ?:?; ?:?);//00553258
    //procedure sub_00553350(?:?; ?:?);//00553350
    //procedure sub_005533A8(?:?);//005533A8
    //procedure sub_005533C4(?:?);//005533C4
    //procedure sub_005533E0(?:?; ?:?; ?:?);//005533E0
    //procedure sub_00553604(?:?; ?:?; ?:?);//00553604
    //function sub_00553698(?:?; ?:?):?;//00553698
    //procedure sub_00553894(?:?; ?:?);//00553894
    //function sub_0055394C(?:TJvCustomAppIniStorage; ?:?):?;//0055394C
    //procedure sub_00554C80(?:?; ?:?; ?:?; ?:?);//00554C80
    //procedure sub_00554F7C(?:?; ?:?; ?:?);//00554F7C
    //procedure sub_00555274(?:?; ?:?; ?:?; ?:?);//00555274
    //procedure sub_00555674(?:?; ?:?; ?:?);//00555674
    //function sub_00555F74(?:PPropInfo; ?:?):?;//00555F74
    //function sub_00555FA4(?:PPropInfo; ?:?):?;//00555FA4
    //function sub_00555FFC(?:PPropInfo; ?:?):Boolean;//00555FFC
    //function sub_00556028(?:PPropInfo; ?:?):Boolean;//00556028
    //procedure sub_005568D8(?:TJvCustomAppStorage; ?:?; ?:?);//005568D8
    //procedure sub_00556984(?:TJvCustomAppStorage; ?:?; ?:?);//00556984
    //function sub_00556AFC:?;//00556AFC
    procedure Loaded;//00556D10
    //procedure sub_00556F28(?:?);//00556F28
    //procedure sub_00557004(?:?; ?:?; ?:?);//00557004
    //procedure sub_00557110(?:TJvCustomAppStorage; ?:?);//00557110
    function sub_0055720C(?:TJvCustomAppStorage):Boolean;//0055720C
    //function sub_00557218(?:?):?;//00557218
    //procedure sub_005572A0(?:TJvAppIniFileStorage; ?:TFileName; ?:?; ?:?);//005572A0
    //procedure sub_00557418(?:?; ?:?);//00557418
    //procedure sub_005574D4(?:TJvCustomAppStorage; ?:?; ?:?);//005574D4
    //procedure sub_0055753C(?:?);//0055753C
    //function sub_00557550(?:TJvAppSubStorages; ?:?):?;//00557550
    //function sub_00557564(?:TCollection; ?:string; ?:Integer):?;//00557564
    //function sub_005575F0(?:TJvAppSubStorages; ?:string; ?:?):?;//005575F0
    //function sub_005578BC(?:TJvAppSubStorage):?;//005578BC
    //procedure GetDisplayName(?:?);//005578C8
    procedure sub_00557A98(?:TJvAppIniFileStorage);//00557A98
    //function sub_00557CDC:?;//00557CDC
    //procedure sub_00557CE4(?:?);//00557CE4
    procedure SetFileName(Value:TFileName);//00557D1C
    //procedure SetOnGetFileName(Value:TJvAppStorageGetFileNameEvent; ?:?; ?:?);//00557E00
    procedure SetLocation(Value:TFileLocation);//00557E5C
    //procedure sub_00557EB0(?:?);//00557EB0

implementation

//00550C88
{*function sub_00550C88:?;
begin
 00550C88    cmp         dword ptr ds:[8154F8],0;gvar_008154F8:TJvAppStoragePropertyEngineList
>00550C8F    jne         00550CAB
 00550C91    cmp         byte ptr ds:[8154FC],0;gvar_008154FC
>00550C98    jne         00550CAB
 00550C9A    mov         dl,1
 00550C9C    mov         eax,[0055096C];TJvAppStoragePropertyEngineList
 00550CA1    call        TObject.Create;TJvAppStoragePropertyEngineList.Create
 00550CA6    mov         [008154F8],eax;gvar_008154F8:TJvAppStoragePropertyEngineList
 00550CAB    mov         eax,[008154F8];gvar_008154F8:TJvAppStoragePropertyEngineList
 00550CB0    ret
end;*}

//00550CB4
procedure sub_00550CB4;
begin
{*
 00550CB4    mov         byte ptr ds:[8154FC],1;gvar_008154FC
 00550CBB    mov         eax,[008154F8];gvar_008154F8:TJvAppStoragePropertyEngineList
 00550CC0    call        TObject.Free
 00550CC5    xor         eax,eax
 00550CC7    mov         [008154F8],eax;gvar_008154F8:TJvAppStoragePropertyEngineList
 00550CCC    ret
*}
end;

//00550CD0
{*procedure sub_00550CD0(?:string; ?:?; ?:TStrings);
begin
 00550CD0    push        ebp
 00550CD1    mov         ebp,esp
 00550CD3    add         esp,0FFFFFFE0
 00550CD6    push        ebx
 00550CD7    push        esi
 00550CD8    push        edi
 00550CD9    xor         ebx,ebx
 00550CDB    mov         dword ptr [ebp-20],ebx
 00550CDE    mov         dword ptr [ebp-8],ecx
 00550CE1    mov         dword ptr [ebp-4],edx
 00550CE4    mov         edi,eax
 00550CE6    xor         eax,eax
 00550CE8    push        ebp
 00550CE9    push        550E89
 00550CEE    push        dword ptr fs:[eax]
 00550CF1    mov         dword ptr fs:[eax],esp
 00550CF4    mov         esi,dword ptr [ebp-4]
 00550CF7    test        esi,esi
>00550CF9    jge         00550D09
 00550CFB    mov         eax,dword ptr [ebp-8]
 00550CFE    call        @UStrClr
>00550D03    jmp         00550E73
 00550D08    dec         esi
 00550D09    test        esi,esi
>00550D0B    jle         00550D2C
 00550D0D    lea         ecx,[ebp-20]
 00550D10    mov         eax,dword ptr [edi+esi*4]
 00550D13    mov         edx,1
 00550D18    call        00539298
 00550D1D    mov         eax,dword ptr [ebp-20]
 00550D20    mov         edx,550EA4;'\'
 00550D25    call        @UStrEqual
>00550D2A    jne         00550D08
 00550D2C    xor         eax,eax
 00550D2E    mov         dword ptr [ebp-14],eax
 00550D31    mov         eax,esi
 00550D33    mov         edx,dword ptr [ebp-4]
 00550D36    sub         edx,eax
>00550D38    jl          00550D54
 00550D3A    inc         edx
 00550D3B    mov         dword ptr [ebp-1C],edx
 00550D3E    lea         ebx,[edi+eax*4]
 00550D41    mov         eax,dword ptr [ebx]
 00550D43    call        @UStrLen
 00550D48    inc         eax
 00550D49    add         dword ptr [ebp-14],eax
 00550D4C    add         ebx,4
 00550D4F    dec         dword ptr [ebp-1C]
>00550D52    jne         00550D41
 00550D54    mov         eax,dword ptr [ebp-8]
 00550D57    mov         edx,dword ptr [ebp-14]
 00550D5A    call        @UStrSetLength
 00550D5F    mov         dword ptr [ebp-10],1
 00550D66    mov         ebx,1
 00550D6B    mov         eax,dword ptr [edi+esi*4]
 00550D6E    call        @UStrLen
 00550D73    mov         dword ptr [ebp-18],eax
>00550D76    jmp         00550D79
 00550D78    inc         ebx
 00550D79    cmp         ebx,dword ptr [ebp-18]
>00550D7C    jg          00550D89
 00550D7E    mov         eax,dword ptr [edi+esi*4]
 00550D81    cmp         word ptr [eax+ebx*2-2],5C
>00550D87    je          00550D78
 00550D89    mov         dword ptr [ebp-0C],ebx
 00550D8C    mov         al,1
>00550D8E    jmp         00550DA6
 00550D90    test        al,al
>00550D92    je          00550D9F
 00550D94    mov         eax,dword ptr [edi+esi*4]
 00550D97    cmp         word ptr [eax+ebx*2-2],2E
>00550D9D    je          00550DA3
 00550D9F    xor         eax,eax
>00550DA1    jmp         00550DA5
 00550DA3    mov         al,1
 00550DA5    inc         ebx
 00550DA6    cmp         ebx,dword ptr [ebp-18]
>00550DA9    jg          00550DB6
 00550DAB    mov         edx,dword ptr [edi+esi*4]
 00550DAE    cmp         word ptr [edx+ebx*2-2],5C
>00550DB4    jne         00550D90
 00550DB6    cmp         ebx,dword ptr [ebp-0C]
>00550DB9    je          00550E49
 00550DBF    test        al,al
>00550DC1    je          00550E12
 00550DC3    mov         eax,ebx
 00550DC5    sub         eax,dword ptr [ebp-0C]
 00550DC8    cmp         eax,1
>00550DCB    jle         00550E49
 00550DCD    cmp         dword ptr [ebp-10],1
>00550DD1    jle         00550E49
 00550DD3    sub         dword ptr [ebp-10],2
 00550DD7    cmp         eax,1
>00550DDA    jle         00550E06
>00550DDC    jmp         00550DE1
 00550DDE    dec         dword ptr [ebp-10]
 00550DE1    cmp         dword ptr [ebp-10],1
>00550DE5    jle         00550DF7
 00550DE7    mov         edx,dword ptr [ebp-8]
 00550DEA    mov         edx,dword ptr [edx]
 00550DEC    mov         ecx,dword ptr [ebp-10]
 00550DEF    cmp         word ptr [edx+ecx*2-2],5C
>00550DF5    jne         00550DDE
 00550DF7    cmp         dword ptr [ebp-10],1
>00550DFB    je          00550E06
 00550DFD    dec         dword ptr [ebp-10]
 00550E00    dec         eax
 00550E01    cmp         eax,1
>00550E04    jg          00550DE1
 00550E06    cmp         dword ptr [ebp-10],1
>00550E0A    jle         00550E49
 00550E0C    add         dword ptr [ebp-10],2
>00550E10    jmp         00550E49
 00550E12    mov         eax,dword ptr [ebp-10]
 00550E15    dec         eax
 00550E16    push        eax
 00550E17    mov         eax,ebx
 00550E19    sub         eax,dword ptr [ebp-0C]
 00550E1C    push        eax
 00550E1D    mov         ecx,dword ptr [ebp-8]
 00550E20    mov         edx,dword ptr [ebp-0C]
 00550E23    dec         edx
 00550E24    mov         eax,dword ptr [edi+esi*4]
 00550E27    call        0053F7CC
 00550E2C    mov         eax,ebx
 00550E2E    sub         eax,dword ptr [ebp-0C]
 00550E31    add         dword ptr [ebp-10],eax
 00550E34    mov         eax,dword ptr [ebp-8]
 00550E37    call        @UniqueStringU
 00550E3C    mov         edx,dword ptr [ebp-10]
 00550E3F    mov         word ptr [eax+edx*2-2],5C
 00550E46    inc         dword ptr [ebp-10]
 00550E49    cmp         ebx,dword ptr [ebp-18]
>00550E4C    jle         00550D79
 00550E52    inc         esi
 00550E53    mov         eax,dword ptr [ebp-4]
 00550E56    cmp         esi,eax
>00550E58    jle         00550D66
 00550E5E    cmp         dword ptr [ebp-10],1
>00550E62    jle         00550E67
 00550E64    dec         dword ptr [ebp-10]
 00550E67    mov         edx,dword ptr [ebp-10]
 00550E6A    dec         edx
 00550E6B    mov         eax,dword ptr [ebp-8]
 00550E6E    call        @UStrSetLength
 00550E73    xor         eax,eax
 00550E75    pop         edx
 00550E76    pop         ecx
 00550E77    pop         ecx
 00550E78    mov         dword ptr fs:[eax],edx
 00550E7B    push        550E90
 00550E80    lea         eax,[ebp-20]
 00550E83    call        @UStrClr
 00550E88    ret
>00550E89    jmp         @HandleFinally
>00550E8E    jmp         00550E80
 00550E90    pop         edi
 00550E91    pop         esi
 00550E92    pop         ebx
 00550E93    mov         esp,ebp
 00550E95    pop         ebp
 00550E96    ret
end;*}

//00550EA8
procedure sub_00550EA8(?:Integer; ?:Integer; ?:PTypeData);
begin
{*
 00550EA8    push        esi
 00550EA9    mov         esi,eax
 00550EAB    sub         cl,2
>00550EAE    jb          00550EBC
 00550EB0    sub         cl,2
>00550EB3    jb          00550EC3
 00550EB5    sub         cl,2
>00550EB8    jb          00550ECB
>00550EBA    jmp         00550ECF
 00550EBC    movzx       eax,byte ptr [esi]
 00550EBF    mov         byte ptr [edx],al
 00550EC1    pop         esi
 00550EC2    ret
 00550EC3    movzx       eax,word ptr [esi]
 00550EC6    mov         word ptr [edx],ax
 00550EC9    pop         esi
 00550ECA    ret
 00550ECB    mov         eax,dword ptr [esi]
 00550ECD    mov         dword ptr [edx],eax
 00550ECF    pop         esi
 00550ED0    ret
*}
end;

//00550ED4
{*function sub_00550ED4(?:?; ?:PTypeData):?;
begin
 00550ED4    and         edx,7F
 00550ED7    cmp         edx,5
>00550EDA    ja          00550F0E
 00550EDC    jmp         dword ptr [edx*4+550EE3]
 00550EDC    dd          00550EFB
 00550EDC    dd          00550EFF
 00550EDC    dd          00550F03
 00550EDC    dd          00550F07
 00550EDC    dd          00550F0B
 00550EDC    dd          00550F0B
 00550EFB    movsx       eax,byte ptr [eax]
 00550EFE    ret
 00550EFF    movzx       eax,byte ptr [eax]
 00550F02    ret
 00550F03    movsx       eax,word ptr [eax]
 00550F06    ret
 00550F07    movzx       eax,word ptr [eax]
 00550F0A    ret
 00550F0B    mov         eax,dword ptr [eax]
 00550F0D    ret
 00550F0E    or          eax,0FFFFFFFF
 00550F11    ret
end;*}

//00550F14
constructor sub_00550F14;
begin
{*
 00550F14    push        ebx
 00550F15    push        esi
 00550F16    test        dl,dl
>00550F18    je          00550F22
 00550F1A    add         esp,0FFFFFFF0
 00550F1D    call        @ClassCreate
 00550F22    mov         ebx,edx
 00550F24    mov         esi,eax
 00550F26    xor         edx,edx
 00550F28    mov         eax,esi
 00550F2A    call        TObject.Create
 00550F2F    mov         edx,550FCC;'TRUE, YES, Y'
 00550F34    mov         eax,esi
 00550F36    mov         ecx,dword ptr [eax]
 00550F38    call        dword ptr [ecx+10];TJvAppStorageOptions.SetBooleanStringTrueValues
 00550F3B    mov         edx,550FF4;'FALSE, NO, N'
 00550F40    mov         eax,esi
 00550F42    mov         ecx,dword ptr [eax]
 00550F44    call        dword ptr [ecx+14];TJvAppStorageOptions.SetBooleanStringFalseValues
 00550F47    mov         dl,1
 00550F49    mov         eax,esi
 00550F4B    mov         ecx,dword ptr [eax]
 00550F4D    call        dword ptr [ecx+0C];TJvAppStorageOptions.SetBooleanAsString
 00550F50    mov         dl,1
 00550F52    mov         eax,esi
 00550F54    mov         ecx,dword ptr [eax]
 00550F56    call        dword ptr [ecx+18];TJvAppStorageOptions.SetEnumerationAsString
 00550F59    mov         dl,1
 00550F5B    mov         eax,esi
 00550F5D    mov         ecx,dword ptr [eax]
 00550F5F    call        dword ptr [ecx+1C];TJvAppStorageOptions.SetTypedIntegerAsString
 00550F62    xor         edx,edx
 00550F64    mov         eax,esi
 00550F66    mov         ecx,dword ptr [eax]
 00550F68    call        dword ptr [ecx+20];TJvAppStorageOptions.SetSetAsString
 00550F6B    mov         dl,1
 00550F6D    mov         eax,esi
 00550F6F    mov         ecx,dword ptr [eax]
 00550F71    call        dword ptr [ecx+24];TJvAppStorageOptions.SetDateTimeAsString
 00550F74    xor         edx,edx
 00550F76    mov         eax,esi
 00550F78    mov         ecx,dword ptr [eax]
 00550F7A    call        dword ptr [ecx+2C];TJvAppStorageOptions.SetDefaultIfReadConvertError
 00550F7D    mov         dl,1
 00550F7F    mov         eax,esi
 00550F81    mov         ecx,dword ptr [eax]
 00550F83    call        dword ptr [ecx+30];TJvAppStorageOptions.SetDefaultIfValueNotExists
 00550F86    mov         dl,1
 00550F88    mov         eax,esi
 00550F8A    mov         ecx,dword ptr [eax]
 00550F8C    call        dword ptr [ecx+40];TJvAppStorageOptions.SetStoreDefaultValues
 00550F8F    xor         edx,edx
 00550F91    mov         eax,esi
 00550F93    mov         ecx,dword ptr [eax]
 00550F95    call        dword ptr [ecx+38];TJvCustomAppStorageOptions.sub_005514C8
 00550F98    mov         dl,1
 00550F9A    mov         eax,esi
 00550F9C    mov         ecx,dword ptr [eax]
 00550F9E    call        dword ptr [ecx+3C];TJvAppStorageOptions.SetUseOldItemNameFormat
 00550FA1    mov         byte ptr [esi+1A],0;TJvCustomAppStorageOptions.FUseTranslateStringEngineDateTimeFormats:...
 00550FA5    mov         eax,esi
 00550FA7    test        bl,bl
>00550FA9    je          00550FBA
 00550FAB    call        @AfterConstruction
 00550FB0    pop         dword ptr fs:[0]
 00550FB7    add         esp,0C
 00550FBA    mov         eax,esi
 00550FBC    pop         esi
 00550FBD    pop         ebx
 00550FBE    ret
*}
end;

//00551010
procedure TJvCustomAppStorageOptions.Assign(Source:TPersistent);
begin
{*
 00551010    push        ebx
 00551011    push        esi
 00551012    push        edi
 00551013    mov         esi,edx
 00551015    mov         ebx,eax
 00551017    cmp         ebx,esi
>00551019    je          005510CA
 0055101F    mov         eax,esi
 00551021    mov         edx,dword ptr ds:[54F474];TJvCustomAppStorageOptions
 00551027    call        @IsClass
 0055102C    test        al,al
>0055102E    je          005510C1
 00551034    mov         edi,esi
 00551036    mov         edx,dword ptr [edi+8]
 00551039    mov         eax,ebx
 0055103B    mov         ecx,dword ptr [eax]
 0055103D    call        dword ptr [ecx+10];TJvAppStorageOptions.SetBooleanStringTrueValues
 00551040    mov         edx,dword ptr [edi+0C]
 00551043    mov         eax,ebx
 00551045    mov         ecx,dword ptr [eax]
 00551047    call        dword ptr [ecx+14];TJvAppStorageOptions.SetBooleanStringFalseValues
 0055104A    movzx       edx,byte ptr [edi+4]
 0055104E    mov         eax,ebx
 00551050    mov         ecx,dword ptr [eax]
 00551052    call        dword ptr [ecx+0C];TJvAppStorageOptions.SetBooleanAsString
 00551055    movzx       edx,byte ptr [edi+10]
 00551059    mov         eax,ebx
 0055105B    mov         ecx,dword ptr [eax]
 0055105D    call        dword ptr [ecx+18];TJvAppStorageOptions.SetEnumerationAsString
 00551060    movzx       edx,byte ptr [edi+11]
 00551064    mov         eax,ebx
 00551066    mov         ecx,dword ptr [eax]
 00551068    call        dword ptr [ecx+1C];TJvAppStorageOptions.SetTypedIntegerAsString
 0055106B    movzx       edx,byte ptr [edi+12]
 0055106F    mov         eax,ebx
 00551071    mov         ecx,dword ptr [eax]
 00551073    call        dword ptr [ecx+20];TJvAppStorageOptions.SetSetAsString
 00551076    movzx       edx,byte ptr [edi+13]
 0055107A    mov         eax,ebx
 0055107C    mov         ecx,dword ptr [eax]
 0055107E    call        dword ptr [ecx+24];TJvAppStorageOptions.SetDateTimeAsString
 00551081    movzx       edx,byte ptr [edi+15]
 00551085    mov         eax,ebx
 00551087    mov         ecx,dword ptr [eax]
 00551089    call        dword ptr [ecx+2C];TJvAppStorageOptions.SetDefaultIfReadConvertError
 0055108C    movzx       edx,byte ptr [edi+16]
 00551090    mov         eax,ebx
 00551092    mov         ecx,dword ptr [eax]
 00551094    call        dword ptr [ecx+30];TJvAppStorageOptions.SetDefaultIfValueNotExists
 00551097    movzx       edx,byte ptr [edi+17]
 0055109B    mov         eax,ebx
 0055109D    mov         ecx,dword ptr [eax]
 0055109F    call        dword ptr [ecx+40];TJvAppStorageOptions.SetStoreDefaultValues
 005510A2    movzx       edx,byte ptr [edi+18]
 005510A6    mov         eax,ebx
 005510A8    mov         ecx,dword ptr [eax]
 005510AA    call        dword ptr [ecx+38];TJvCustomAppStorageOptions.sub_005514C8
 005510AD    movzx       edx,byte ptr [edi+19]
 005510B1    mov         eax,ebx
 005510B3    mov         ecx,dword ptr [eax]
 005510B5    call        dword ptr [ecx+3C];TJvAppStorageOptions.SetUseOldItemNameFormat
 005510B8    movzx       eax,byte ptr [edi+1A]
 005510BC    mov         byte ptr [ebx+1A],al;TJvCustomAppStorageOptions.FUseTranslateStringEngineDateTimeFormats...
>005510BF    jmp         005510CA
 005510C1    mov         edx,esi
 005510C3    mov         eax,ebx
 005510C5    call        TPersistent.Assign
 005510CA    pop         edi
 005510CB    pop         esi
 005510CC    pop         ebx
 005510CD    ret
*}
end;

//005510D0
{*function sub_005510D0(?:?; ?:?):?;
begin
 005510D0    push        ebp
 005510D1    mov         ebp,esp
 005510D3    add         esp,0FFFFFFF0
 005510D6    push        ebx
 005510D7    push        esi
 005510D8    xor         ebx,ebx
 005510DA    mov         dword ptr [ebp-10],ebx
 005510DD    mov         dword ptr [ebp-0C],ebx
 005510E0    mov         esi,ecx
 005510E2    mov         ebx,edx
 005510E4    xor         eax,eax
 005510E6    push        ebp
 005510E7    push        551177
 005510EC    push        dword ptr fs:[eax]
 005510EF    mov         dword ptr fs:[eax],esp
 005510F2    mov         dl,1
 005510F4    mov         eax,[0043C7BC];TStringList
 005510F9    call        TStringList.Create;TStringList.Create
 005510FE    mov         dword ptr [ebp-8],eax
 00551101    xor         eax,eax
 00551103    push        ebp
 00551104    push        551155
 00551109    push        dword ptr fs:[eax]
 0055110C    mov         dword ptr fs:[eax],esp
 0055110F    lea         edx,[ebp-0C]
 00551112    mov         eax,esi
 00551114    call        UpperCase
 00551119    mov         edx,dword ptr [ebp-0C]
 0055111C    mov         eax,dword ptr [ebp-8]
 0055111F    call        TStrings.SetCommaText
 00551124    lea         edx,[ebp-10]
 00551127    mov         eax,ebx
 00551129    call        UpperCase
 0055112E    mov         edx,dword ptr [ebp-10]
 00551131    mov         eax,dword ptr [ebp-8]
 00551134    mov         ecx,dword ptr [eax]
 00551136    call        dword ptr [ecx+54];TStringList.IndexOf
 00551139    test        eax,eax
 0055113B    setge       byte ptr [ebp-1]
 0055113F    xor         eax,eax
 00551141    pop         edx
 00551142    pop         ecx
 00551143    pop         ecx
 00551144    mov         dword ptr fs:[eax],edx
 00551147    push        55115C
 0055114C    mov         eax,dword ptr [ebp-8]
 0055114F    call        TObject.Free
 00551154    ret
>00551155    jmp         @HandleFinally
>0055115A    jmp         0055114C
 0055115C    xor         eax,eax
 0055115E    pop         edx
 0055115F    pop         ecx
 00551160    pop         ecx
 00551161    mov         dword ptr fs:[eax],edx
 00551164    push        55117E
 00551169    lea         eax,[ebp-10]
 0055116C    mov         edx,2
 00551171    call        @UStrArrayClr
 00551176    ret
>00551177    jmp         @HandleFinally
>0055117C    jmp         00551169
 0055117E    movzx       eax,byte ptr [ebp-1]
 00551182    pop         esi
 00551183    pop         ebx
 00551184    mov         esp,ebp
 00551186    pop         ebp
 00551187    ret
end;*}

//00551188
{*procedure TJvCustomAppStorageOptions.DefaultTrueString(?:?);
begin
 00551188    push        ebp
 00551189    mov         ebp,esp
 0055118B    push        0
 0055118D    push        ebx
 0055118E    push        esi
 0055118F    push        edi
 00551190    mov         edi,edx
 00551192    mov         ebx,eax
 00551194    xor         eax,eax
 00551196    push        ebp
 00551197    push        5511F4
 0055119C    push        dword ptr fs:[eax]
 0055119F    mov         dword ptr fs:[eax],esp
 005511A2    mov         edx,dword ptr [ebx+8];TJvCustomAppStorageOptions.FBooleanStringTrueValues:string
 005511A5    mov         eax,551210;','
 005511AA    call        Pos
 005511AF    mov         esi,eax
 005511B1    test        esi,esi
>005511B3    jne         005511C0
 005511B5    mov         eax,dword ptr [ebx+8];TJvCustomAppStorageOptions.FBooleanStringTrueValues:string
 005511B8    call        @UStrLen
 005511BD    mov         esi,eax
 005511BF    inc         esi
 005511C0    lea         eax,[ebp-4]
 005511C3    push        eax
 005511C4    mov         ecx,esi
 005511C6    dec         ecx
 005511C7    mov         edx,1
 005511CC    mov         eax,dword ptr [ebx+8];TJvCustomAppStorageOptions.FBooleanStringTrueValues:string
 005511CF    call        @UStrCopy
 005511D4    mov         eax,dword ptr [ebp-4]
 005511D7    mov         edx,edi
 005511D9    call        Trim
 005511DE    xor         eax,eax
 005511E0    pop         edx
 005511E1    pop         ecx
 005511E2    pop         ecx
 005511E3    mov         dword ptr fs:[eax],edx
 005511E6    push        5511FB
 005511EB    lea         eax,[ebp-4]
 005511EE    call        @UStrClr
 005511F3    ret
>005511F4    jmp         @HandleFinally
>005511F9    jmp         005511EB
 005511FB    pop         edi
 005511FC    pop         esi
 005511FD    pop         ebx
 005511FE    pop         ecx
 005511FF    pop         ebp
 00551200    ret
end;*}

//00551214
{*procedure TJvCustomAppStorageOptions.DefaultFalseString(?:?);
begin
 00551214    push        ebp
 00551215    mov         ebp,esp
 00551217    push        0
 00551219    push        ebx
 0055121A    push        esi
 0055121B    push        edi
 0055121C    mov         edi,edx
 0055121E    mov         ebx,eax
 00551220    xor         eax,eax
 00551222    push        ebp
 00551223    push        551280
 00551228    push        dword ptr fs:[eax]
 0055122B    mov         dword ptr fs:[eax],esp
 0055122E    mov         edx,dword ptr [ebx+0C];TJvCustomAppStorageOptions.FBooleanStringFalseValues:string
 00551231    mov         eax,55129C;','
 00551236    call        Pos
 0055123B    mov         esi,eax
 0055123D    test        esi,esi
>0055123F    jne         0055124C
 00551241    mov         eax,dword ptr [ebx+0C];TJvCustomAppStorageOptions.FBooleanStringFalseValues:string
 00551244    call        @UStrLen
 00551249    mov         esi,eax
 0055124B    inc         esi
 0055124C    lea         eax,[ebp-4]
 0055124F    push        eax
 00551250    mov         ecx,esi
 00551252    dec         ecx
 00551253    mov         edx,1
 00551258    mov         eax,dword ptr [ebx+0C];TJvCustomAppStorageOptions.FBooleanStringFalseValues:string
 0055125B    call        @UStrCopy
 00551260    mov         eax,dword ptr [ebp-4]
 00551263    mov         edx,edi
 00551265    call        Trim
 0055126A    xor         eax,eax
 0055126C    pop         edx
 0055126D    pop         ecx
 0055126E    pop         ecx
 0055126F    mov         dword ptr fs:[eax],edx
 00551272    push        551287
 00551277    lea         eax,[ebp-4]
 0055127A    call        @UStrClr
 0055127F    ret
>00551280    jmp         @HandleFinally
>00551285    jmp         00551277
 00551287    pop         edi
 00551288    pop         esi
 00551289    pop         ebx
 0055128A    pop         ecx
 0055128B    pop         ebp
 0055128C    ret
end;*}

//005512A0
function TJvCustomAppStorageOptions.IsValueTrueString(Value:string):Boolean;
begin
{*
 005512A0    push        ebp
 005512A1    mov         ebp,esp
 005512A3    push        ecx
 005512A4    push        ebx
 005512A5    mov         dword ptr [ebp-4],edx
 005512A8    mov         ebx,eax
 005512AA    mov         eax,dword ptr [ebp-4]
 005512AD    call        @UStrAddRef
 005512B2    xor         eax,eax
 005512B4    push        ebp
 005512B5    push        5512E5
 005512BA    push        dword ptr fs:[eax]
 005512BD    mov         dword ptr fs:[eax],esp
 005512C0    mov         ecx,dword ptr [ebx+8];TJvCustomAppStorageOptions.FBooleanStringTrueValues:string
 005512C3    mov         edx,dword ptr [ebp-4]
 005512C6    mov         eax,ebx
 005512C8    mov         ebx,dword ptr [eax]
 005512CA    call        dword ptr [ebx+34];TJvCustomAppStorageOptions.sub_005510D0
 005512CD    mov         ebx,eax
 005512CF    xor         eax,eax
 005512D1    pop         edx
 005512D2    pop         ecx
 005512D3    pop         ecx
 005512D4    mov         dword ptr fs:[eax],edx
 005512D7    push        5512EC
 005512DC    lea         eax,[ebp-4]
 005512DF    call        @UStrClr
 005512E4    ret
>005512E5    jmp         @HandleFinally
>005512EA    jmp         005512DC
 005512EC    mov         eax,ebx
 005512EE    pop         ebx
 005512EF    pop         ecx
 005512F0    pop         ebp
 005512F1    ret
*}
end;

//005512F4
function TJvCustomAppStorageOptions.IsValueFalseString(Value:string):Boolean;
begin
{*
 005512F4    push        ebp
 005512F5    mov         ebp,esp
 005512F7    push        ecx
 005512F8    push        ebx
 005512F9    mov         dword ptr [ebp-4],edx
 005512FC    mov         ebx,eax
 005512FE    mov         eax,dword ptr [ebp-4]
 00551301    call        @UStrAddRef
 00551306    xor         eax,eax
 00551308    push        ebp
 00551309    push        551339
 0055130E    push        dword ptr fs:[eax]
 00551311    mov         dword ptr fs:[eax],esp
 00551314    mov         ecx,dword ptr [ebx+0C];TJvCustomAppStorageOptions.FBooleanStringFalseValues:string
 00551317    mov         edx,dword ptr [ebp-4]
 0055131A    mov         eax,ebx
 0055131C    mov         ebx,dword ptr [eax]
 0055131E    call        dword ptr [ebx+34];TJvCustomAppStorageOptions.sub_005510D0
 00551321    mov         ebx,eax
 00551323    xor         eax,eax
 00551325    pop         edx
 00551326    pop         ecx
 00551327    pop         ecx
 00551328    mov         dword ptr fs:[eax],edx
 0055132B    push        551340
 00551330    lea         eax,[ebp-4]
 00551333    call        @UStrClr
 00551338    ret
>00551339    jmp         @HandleFinally
>0055133E    jmp         00551330
 00551340    mov         eax,ebx
 00551342    pop         ebx
 00551343    pop         ecx
 00551344    pop         ebp
 00551345    ret
*}
end;

//00551348
procedure TJvAppStorageOptions.SetBooleanAsString(Value:Boolean);
begin
{*
 00551348    push        ebp
 00551349    mov         ebp,esp
 0055134B    push        0
 0055134D    push        0
 0055134F    push        ebx
 00551350    push        esi
 00551351    mov         ebx,edx
 00551353    mov         esi,eax
 00551355    xor         eax,eax
 00551357    push        ebp
 00551358    push        5513AB
 0055135D    push        dword ptr fs:[eax]
 00551360    mov         dword ptr fs:[eax],esp
 00551363    test        bl,bl
>00551365    je          00551387
 00551367    lea         edx,[ebp-4]
 0055136A    mov         eax,esi
 0055136C    call        TJvCustomAppStorageOptions.DefaultTrueString
 00551371    cmp         dword ptr [ebp-4],0
>00551375    je          00551387
 00551377    lea         edx,[ebp-8]
 0055137A    mov         eax,esi
 0055137C    call        TJvCustomAppStorageOptions.DefaultFalseString
 00551381    cmp         dword ptr [ebp-8],0
>00551385    jne         0055138B
 00551387    xor         eax,eax
>00551389    jmp         0055138D
 0055138B    mov         al,1
 0055138D    mov         byte ptr [esi+4],al;TJvAppStorageOptions.FBooleanAsString:Boolean
 00551390    xor         eax,eax
 00551392    pop         edx
 00551393    pop         ecx
 00551394    pop         ecx
 00551395    mov         dword ptr fs:[eax],edx
 00551398    push        5513B2
 0055139D    lea         eax,[ebp-8]
 005513A0    mov         edx,2
 005513A5    call        @UStrArrayClr
 005513AA    ret
>005513AB    jmp         @HandleFinally
>005513B0    jmp         0055139D
 005513B2    pop         esi
 005513B3    pop         ebx
 005513B4    pop         ecx
 005513B5    pop         ecx
 005513B6    pop         ebp
 005513B7    ret
*}
end;

//005513B8
procedure TJvAppStorageOptions.SetBooleanStringTrueValues(Value:string);
begin
{*
 005513B8    push        ebp
 005513B9    mov         ebp,esp
 005513BB    add         esp,0FFFFFFF8
 005513BE    push        ebx
 005513BF    xor         ecx,ecx
 005513C1    mov         dword ptr [ebp-8],ecx
 005513C4    mov         dword ptr [ebp-4],edx
 005513C7    mov         ebx,eax
 005513C9    mov         eax,dword ptr [ebp-4]
 005513CC    call        @UStrAddRef
 005513D1    xor         eax,eax
 005513D3    push        ebp
 005513D4    push        551424
 005513D9    push        dword ptr fs:[eax]
 005513DC    mov         dword ptr fs:[eax],esp
 005513DF    lea         eax,[ebx+8];TJvAppStorageOptions.FBooleanStringTrueValues:string
 005513E2    mov         edx,dword ptr [ebp-4]
 005513E5    call        @UStrAsg
 005513EA    cmp         byte ptr [ebx+4],0;TJvAppStorageOptions.FBooleanAsString:Boolean
>005513EE    je          00551400
 005513F0    lea         edx,[ebp-8]
 005513F3    mov         eax,ebx
 005513F5    call        TJvCustomAppStorageOptions.DefaultTrueString
 005513FA    cmp         dword ptr [ebp-8],0
>005513FE    jne         00551404
 00551400    xor         eax,eax
>00551402    jmp         00551406
 00551404    mov         al,1
 00551406    mov         byte ptr [ebx+4],al;TJvAppStorageOptions.FBooleanAsString:Boolean
 00551409    xor         eax,eax
 0055140B    pop         edx
 0055140C    pop         ecx
 0055140D    pop         ecx
 0055140E    mov         dword ptr fs:[eax],edx
 00551411    push        55142B
 00551416    lea         eax,[ebp-8]
 00551419    mov         edx,2
 0055141E    call        @UStrArrayClr
 00551423    ret
>00551424    jmp         @HandleFinally
>00551429    jmp         00551416
 0055142B    pop         ebx
 0055142C    pop         ecx
 0055142D    pop         ecx
 0055142E    pop         ebp
 0055142F    ret
*}
end;

//00551430
procedure TJvAppStorageOptions.SetBooleanStringFalseValues(Value:string);
begin
{*
 00551430    push        ebp
 00551431    mov         ebp,esp
 00551433    add         esp,0FFFFFFF8
 00551436    push        ebx
 00551437    xor         ecx,ecx
 00551439    mov         dword ptr [ebp-8],ecx
 0055143C    mov         dword ptr [ebp-4],edx
 0055143F    mov         ebx,eax
 00551441    mov         eax,dword ptr [ebp-4]
 00551444    call        @UStrAddRef
 00551449    xor         eax,eax
 0055144B    push        ebp
 0055144C    push        55149C
 00551451    push        dword ptr fs:[eax]
 00551454    mov         dword ptr fs:[eax],esp
 00551457    lea         eax,[ebx+0C];TJvAppStorageOptions.FBooleanStringFalseValues:string
 0055145A    mov         edx,dword ptr [ebp-4]
 0055145D    call        @UStrAsg
 00551462    cmp         byte ptr [ebx+4],0;TJvAppStorageOptions.FBooleanAsString:Boolean
>00551466    je          00551478
 00551468    lea         edx,[ebp-8]
 0055146B    mov         eax,ebx
 0055146D    call        TJvCustomAppStorageOptions.DefaultFalseString
 00551472    cmp         dword ptr [ebp-8],0
>00551476    jne         0055147C
 00551478    xor         eax,eax
>0055147A    jmp         0055147E
 0055147C    mov         al,1
 0055147E    mov         byte ptr [ebx+4],al;TJvAppStorageOptions.FBooleanAsString:Boolean
 00551481    xor         eax,eax
 00551483    pop         edx
 00551484    pop         ecx
 00551485    pop         ecx
 00551486    mov         dword ptr fs:[eax],edx
 00551489    push        5514A3
 0055148E    lea         eax,[ebp-8]
 00551491    mov         edx,2
 00551496    call        @UStrArrayClr
 0055149B    ret
>0055149C    jmp         @HandleFinally
>005514A1    jmp         0055148E
 005514A3    pop         ebx
 005514A4    pop         ecx
 005514A5    pop         ecx
 005514A6    pop         ebp
 005514A7    ret
*}
end;

//005514A8
procedure TJvAppStorageOptions.SetEnumerationAsString(Value:Boolean);
begin
{*
 005514A8    mov         byte ptr [eax+10],dl;TJvAppStorageOptions.FEnumAsStr:Boolean
 005514AB    ret
*}
end;

//005514AC
procedure TJvAppStorageOptions.SetTypedIntegerAsString(Value:Boolean);
begin
{*
 005514AC    mov         byte ptr [eax+11],dl;TJvAppStorageOptions.FIntAsStr:Boolean
 005514AF    ret
*}
end;

//005514B0
procedure TJvAppStorageOptions.SetSetAsString(Value:Boolean);
begin
{*
 005514B0    mov         byte ptr [eax+12],dl;TJvAppStorageOptions.FSetAsStr:Boolean
 005514B3    ret
*}
end;

//005514B4
procedure TJvAppStorageOptions.SetStoreDefaultValues(Value:Boolean);
begin
{*
 005514B4    mov         byte ptr [eax+17],dl;TJvAppStorageOptions.FStoreDefaultValues:Boolean
 005514B7    ret
*}
end;

//005514B8
procedure TJvAppStorageOptions.SetDateTimeAsString(Value:Boolean);
begin
{*
 005514B8    mov         byte ptr [eax+13],dl;TJvAppStorageOptions.FDateTimeAsString:Boolean
 005514BB    ret
*}
end;

//005514BC
procedure TJvAppStorageOptions.SetFloatAsString(Value:Boolean);
begin
{*
 005514BC    mov         byte ptr [eax+14],dl;TJvAppStorageOptions.FFloatAsString:Boolean
 005514BF    ret
*}
end;

//005514C0
procedure TJvAppStorageOptions.SetDefaultIfReadConvertError(Value:Boolean);
begin
{*
 005514C0    mov         byte ptr [eax+15],dl;TJvAppStorageOptions.FDefaultIfReadConvertError:Boolean
 005514C3    ret
*}
end;

//005514C4
procedure TJvAppStorageOptions.SetDefaultIfValueNotExists(Value:Boolean);
begin
{*
 005514C4    mov         byte ptr [eax+16],dl;TJvAppStorageOptions.FDefaultIfValueNotExists:Boolean
 005514C7    ret
*}
end;

//005514C8
{*procedure sub_005514C8(?:?);
begin
 005514C8    mov         byte ptr [eax+18],dl;TJvCustomAppStorageOptions.FStoreStringListAsSingleString:Boolean
 005514CB    ret
end;*}

//005514CC
procedure TJvAppStorageOptions.SetUseOldItemNameFormat(Value:Boolean);
begin
{*
 005514CC    mov         byte ptr [eax+19],dl;TJvAppStorageOptions.FUseOldItemNameFormat:Boolean
 005514CF    ret
*}
end;

//005514D0
constructor TJvCustomAppStorage.Create(AOwner:TComponent);
begin
{*
 005514D0    push        ebx
 005514D1    push        esi
 005514D2    test        dl,dl
>005514D4    je          005514DE
 005514D6    add         esp,0FFFFFFF0
 005514D9    call        @ClassCreate
 005514DE    mov         ebx,edx
 005514E0    mov         esi,eax
 005514E2    xor         edx,edx
 005514E4    mov         eax,esi
 005514E6    call        TComponent.Create
 005514EB    mov         byte ptr [esi+155],1;TJvCustomAppStorage.FFlushOnDestroy:Boolean
 005514F2    mov         byte ptr [esi+12C],0;TJvCustomAppStorage.FAutoFlush:Boolean
 005514F9    mov         byte ptr [esi+134],0;TJvCustomAppStorage.FAutoReload:Boolean
 00551500    mov         eax,dword ptr [esi]
 00551502    call        dword ptr [eax+38];TJvCustomAppStorage.sub_00551754
 00551505    mov         dl,1
 00551507    call        dword ptr [eax+44]
 0055150A    mov         dword ptr [esi+104],eax;TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00551510    mov         ecx,esi
 00551512    mov         dl,1
 00551514    mov         eax,[0054FF58];TJvAppSubStorages
 00551519    call        TJvAppSubStorages.Create;TJvAppSubStorages.Create
 0055151E    mov         dword ptr [esi+108],eax;TJvCustomAppStorage.FSubStorages:TJvAppSubStorages
 00551524    xor         eax,eax
 00551526    mov         dword ptr [esi+128],eax;TJvCustomAppStorage.FCryptEnabledStatus:Integer
 0055152C    mov         byte ptr [esi+144],0;TJvCustomAppStorage.FReadOnly:Boolean
 00551533    mov         ecx,esi
 00551535    mov         dl,1
 00551537    mov         eax,[00542D18];TJvTranslateString
 0055153C    call        TJvTranslateString.Create;TJvTranslateString.Create
 00551541    mov         dword ptr [esi+140],eax;TJvCustomAppStorage.FInternalTranslateStringEngine:TJvTranslateS...
 00551547    mov         byte ptr [esi+154],0;TJvCustomAppStorage.FSynchronizeFlushReload:Boolean
 0055154E    mov         eax,esi
 00551550    test        bl,bl
>00551552    je          00551563
 00551554    call        @AfterConstruction
 00551559    pop         dword ptr fs:[0]
 00551560    add         esp,0C
 00551563    mov         eax,esi
 00551565    pop         esi
 00551566    pop         ebx
 00551567    ret
*}
end;

//00551568
destructor TJvCustomAppStorage.Destroy();
begin
{*
 00551568    push        ebx
 00551569    push        esi
 0055156A    call        @BeforeDestruction
 0055156F    mov         ebx,edx
 00551571    mov         esi,eax
 00551573    cmp         byte ptr [esi+155],0;TJvCustomAppStorage.FFlushOnDestroy:Boolean
>0055157A    je          00551586
 0055157C    mov         eax,esi
 0055157E    mov         edx,dword ptr [eax]
 00551580    call        dword ptr [edx+0EC];TJvCustomAppStorage.Flush
 00551586    lea         eax,[esi+140];TJvCustomAppStorage.FInternalTranslateStringEngine:TJvTranslateString
 0055158C    call        FreeAndNil
 00551591    lea         eax,[esi+108];TJvCustomAppStorage.FSubStorages:TJvAppSubStorages
 00551597    call        FreeAndNil
 0055159C    lea         eax,[esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005515A2    call        FreeAndNil
 005515A7    mov         edx,ebx
 005515A9    and         dl,0FC
 005515AC    mov         eax,esi
 005515AE    call        TComponent.Destroy
 005515B3    test        bl,bl
>005515B5    jle         005515BE
 005515B7    mov         eax,esi
 005515B9    call        @ClassDestroy
 005515BE    pop         esi
 005515BF    pop         ebx
 005515C0    ret
*}
end;

//005515C4
procedure TJvCustomAppStorage.Flush;
begin
{*
 005515C4    ret
*}
end;

//005515C8
procedure TJvCustomAppStorage.Reload;
begin
{*
 005515C8    ret
*}
end;

//005515CC
procedure TJvCustomAppStorage.ReloadIfNeeded;
begin
{*
 005515CC    push        ebx
 005515CD    mov         ebx,eax
 005515CF    mov         eax,ebx
 005515D1    mov         edx,dword ptr [eax]
 005515D3    call        dword ptr [edx+0F4];TJvCustomAppStorage.ReloadNeeded
 005515D9    test        al,al
>005515DB    je          005515E7
 005515DD    mov         eax,ebx
 005515DF    mov         edx,dword ptr [eax]
 005515E1    call        dword ptr [edx+0F0];TJvCustomAppStorage.Reload
 005515E7    pop         ebx
 005515E8    ret
*}
end;

//005515EC
function TJvCustomAppStorage.ReloadNeeded:Boolean;
begin
{*
 005515EC    push        ebx
 005515ED    mov         ebx,eax
 005515EF    cmp         byte ptr [ebx+134],0;TJvCustomAppStorage.FAutoReload:Boolean
>005515F6    je          00551603
 005515F8    mov         eax,ebx
 005515FA    call        0055720C
 005515FF    test        al,al
>00551601    je          00551607
 00551603    xor         eax,eax
 00551605    pop         ebx
 00551606    ret
 00551607    mov         al,1
 00551609    pop         ebx
 0055160A    ret
*}
end;

//0055160C
procedure TJvCustomAppStorage.FlushIfNeeded;
begin
{*
 0055160C    push        ebx
 0055160D    mov         ebx,eax
 0055160F    mov         eax,ebx
 00551611    mov         edx,dword ptr [eax]
 00551613    call        dword ptr [edx+0F8];TJvCustomAppStorage.FlushNeeded
 00551619    test        al,al
>0055161B    je          00551627
 0055161D    mov         eax,ebx
 0055161F    mov         edx,dword ptr [eax]
 00551621    call        dword ptr [edx+0EC];TJvCustomAppStorage.Flush
 00551627    pop         ebx
 00551628    ret
*}
end;

//0055162C
function TJvCustomAppStorage.FlushNeeded:Boolean;
begin
{*
 0055162C    push        ebx
 0055162D    mov         ebx,eax
 0055162F    cmp         byte ptr [ebx+12C],0;TJvCustomAppStorage.FAutoFlush:Boolean
>00551636    je          00551643
 00551638    mov         eax,ebx
 0055163A    call        0055720C
 0055163F    test        al,al
>00551641    je          00551647
 00551643    xor         eax,eax
 00551645    pop         ebx
 00551646    ret
 00551647    mov         al,1
 00551649    pop         ebx
 0055164A    ret
*}
end;

//0055164C
procedure TJvCustomAppStorage.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0055164C    push        ebx
 0055164D    push        esi
 0055164E    push        edi
 0055164F    mov         ebx,ecx
 00551651    mov         esi,edx
 00551653    mov         edi,eax
 00551655    mov         ecx,ebx
 00551657    mov         edx,esi
 00551659    mov         eax,edi
 0055165B    call        TComponent.Notification
 00551660    cmp         bl,1
>00551663    jne         005516AB
 00551665    mov         eax,esi
 00551667    mov         edx,dword ptr ds:[54D788];TJvCustomAppStorage
 0055166D    call        @IsClass
 00551672    test        al,al
>00551674    je          0055169B
 00551676    cmp         dword ptr [edi+108],0;TJvCustomAppStorage.FSubStorages:TJvAppSubStorages
>0055167D    je          0055169B
 0055167F    mov         eax,esi
 00551681    mov         edx,dword ptr ds:[54D788];TJvCustomAppStorage
 00551687    call        @AsClass
 0055168C    mov         edx,eax
 0055168E    mov         eax,dword ptr [edi+108];TJvCustomAppStorage.FSubStorages:TJvAppSubStorages
 00551694    call        TJvAppSubStorages.Delete
>00551699    jmp         005516AB
 0055169B    cmp         esi,dword ptr [edi+150];TJvCustomAppStorage.FTranslateStringEngine:TJvTranslateString
>005516A1    jne         005516AB
 005516A3    xor         eax,eax
 005516A5    mov         dword ptr [edi+150],eax;TJvCustomAppStorage.FTranslateStringEngine:TJvTranslateString
 005516AB    pop         edi
 005516AC    pop         esi
 005516AD    pop         ebx
 005516AE    ret
*}
end;

//005516B0
procedure TJvAppIniFileStorage.SetFlushOnDestroy(Value:Boolean);
begin
{*
 005516B0    mov         byte ptr [eax+155],dl;TJvAppIniFileStorage.FFlushOnDestroy:Boolean
 005516B6    ret
*}
end;

//005516B8
{*function sub_005516B8(?:TJvCustomAppStorage; ?:TPersistent):?;
begin
 005516B8    push        ebx
 005516B9    mov         ebx,edx
 005516BB    mov         eax,dword ptr [ebx]
 005516BD    call        TObject.ClassInfo
 005516C2    call        GetTypeData
 005516C7    movsx       eax,word ptr [eax+8]
 005516CB    pop         ebx
 005516CC    ret
end;*}

//005516D0
{*procedure sub_005516D0(?:TJvCustomAppStorage; ?:TPersistent; ?:?; ?:?);
begin
 005516D0    push        ebp
 005516D1    mov         ebp,esp
 005516D3    push        ecx
 005516D4    push        ebx
 005516D5    push        esi
 005516D6    push        edi
 005516D7    mov         edi,ecx
 005516D9    mov         ebx,edx
 005516DB    mov         esi,dword ptr [ebp+8]
 005516DE    mov         eax,esi
 005516E0    call        @UStrClr
 005516E5    mov         eax,dword ptr [ebx]
 005516E7    call        TObject.ClassInfo
 005516EC    call        GetTypeData
 005516F1    movsx       eax,word ptr [eax+8]
 005516F5    add         eax,eax
 005516F7    add         eax,eax
 005516F9    call        @GetMem
 005516FE    mov         dword ptr [ebp-4],eax
 00551701    xor         eax,eax
 00551703    push        ebp
 00551704    push        551744
 00551709    push        dword ptr fs:[eax]
 0055170C    mov         dword ptr fs:[eax],esp
 0055170F    mov         eax,dword ptr [ebx]
 00551711    call        TObject.ClassInfo
 00551716    mov         edx,dword ptr [ebp-4]
 00551719    call        GetPropInfos
 0055171E    mov         eax,dword ptr [ebp-4]
 00551721    mov         ebx,dword ptr [eax+edi*4]
 00551724    mov         edx,esi
 00551726    lea         eax,[ebx+1A]
 00551729    call        UTF8ToString
 0055172E    xor         eax,eax
 00551730    pop         edx
 00551731    pop         ecx
 00551732    pop         ecx
 00551733    mov         dword ptr fs:[eax],edx
 00551736    push        55174B
 0055173B    mov         eax,dword ptr [ebp-4]
 0055173E    call        @FreeMem
 00551743    ret
>00551744    jmp         @HandleFinally
>00551749    jmp         0055173B
 0055174B    pop         edi
 0055174C    pop         esi
 0055174D    pop         ebx
 0055174E    pop         ecx
 0055174F    pop         ebp
 00551750    ret         4
end;*}

//00551754
constructor TJvAppStorageOptions.Create;
begin
{*
 00551754    mov         eax,[0054FBA4];TJvAppStorageOptions
 00551759    ret
*}
end;

//0055175C
{*procedure sub_0055175C(?:?; ?:?; ?:?);
begin
 0055175C    push        ebp
 0055175D    mov         ebp,esp
 0055175F    push        0
 00551761    push        0
 00551763    push        0
 00551765    push        0
 00551767    push        ebx
 00551768    push        esi
 00551769    mov         dword ptr [ebp-8],ecx
 0055176C    mov         esi,edx
 0055176E    mov         ebx,eax
 00551770    mov         eax,dword ptr [ebp-8]
 00551773    test        eax,eax
>00551775    je          0055177B
 00551777    xor         edx,edx
 00551779    mov         dword ptr [eax],edx
 0055177B    mov         eax,dword ptr [ebp+8]
 0055177E    test        eax,eax
>00551780    je          00551786
 00551782    xor         edx,edx
 00551784    mov         dword ptr [eax],edx
 00551786    xor         eax,eax
 00551788    push        ebp
 00551789    push        551804
 0055178E    push        dword ptr fs:[eax]
 00551791    mov         dword ptr fs:[eax],esp
 00551794    lea         ecx,[ebp-4]
 00551797    mov         edx,esi
 00551799    mov         eax,ebx
 0055179B    call        00551840
 005517A0    mov         edx,dword ptr [ebp-4]
 005517A3    mov         eax,551820;'\'
 005517A8    call        LastDelimiter
 005517AD    mov         ebx,eax
 005517AF    lea         ecx,[ebp-0C]
 005517B2    mov         edx,ebx
 005517B4    dec         edx
 005517B5    mov         eax,dword ptr [ebp-4]
 005517B8    call        00539298
 005517BD    mov         edx,dword ptr [ebp-0C]
 005517C0    mov         eax,dword ptr [ebp-8]
 005517C3    call        @UStrAsg
 005517C8    lea         ecx,[ebp-10]
 005517CB    lea         edx,[ebx+1]
 005517CE    mov         eax,dword ptr [ebp-4]
 005517D1    call        005392D8
 005517D6    mov         edx,dword ptr [ebp-10]
 005517D9    mov         eax,dword ptr [ebp+8]
 005517DC    call        @UStrAsg
 005517E1    xor         eax,eax
 005517E3    pop         edx
 005517E4    pop         ecx
 005517E5    pop         ecx
 005517E6    mov         dword ptr fs:[eax],edx
 005517E9    push        55180B
 005517EE    lea         eax,[ebp-10]
 005517F1    mov         edx,2
 005517F6    call        @UStrArrayClr
 005517FB    lea         eax,[ebp-4]
 005517FE    call        @UStrClr
 00551803    ret
>00551804    jmp         @HandleFinally
>00551809    jmp         005517EE
 0055180B    pop         esi
 0055180C    pop         ebx
 0055180D    mov         esp,ebp
 0055180F    pop         ebp
 00551810    ret         4
end;*}

//00551824
procedure TJvAppIniFileStorage.SetSubStorages(Value:TJvAppSubStorages);
begin
{*
 00551824    ret
*}
end;

//00551828
{*procedure sub_00551828(?:TJvCustomAppStorage; ?:?);
begin
 00551828    push        ebx
 00551829    push        esi
 0055182A    mov         esi,edx
 0055182C    mov         ebx,eax
 0055182E    mov         eax,esi
 00551830    mov         edx,dword ptr [ebx+0FC]
 00551836    call        @UStrAsg
 0055183B    pop         esi
 0055183C    pop         ebx
 0055183D    ret
end;*}

//00551840
{*procedure sub_00551840(?:TJvCustomAppStorage; ?:?; ?:?);
begin
 00551840    push        ebp
 00551841    mov         ebp,esp
 00551843    push        0
 00551845    push        0
 00551847    push        0
 00551849    push        0
 0055184B    push        0
 0055184D    push        ebx
 0055184E    push        esi
 0055184F    push        edi
 00551850    mov         ebx,ecx
 00551852    mov         edi,edx
 00551854    mov         esi,eax
 00551856    xor         eax,eax
 00551858    push        ebp
 00551859    push        5518EB
 0055185E    push        dword ptr fs:[eax]
 00551861    mov         dword ptr fs:[eax],esp
 00551864    lea         edx,[ebp-4]
 00551867    mov         eax,esi
 00551869    call        00551828
 0055186E    push        dword ptr [ebp-4]
 00551871    push        551908;'\'
 00551876    lea         edx,[ebp-14]
 00551879    mov         eax,esi
 0055187B    call        00552B8C
 00551880    mov         eax,dword ptr [ebp-14]
 00551883    mov         dword ptr [ebp-10],eax
 00551886    mov         dword ptr [ebp-0C],edi
 00551889    lea         eax,[ebp-10]
 0055188C    lea         ecx,[ebp-8]
 0055188F    mov         edx,1
 00551894    call        00550CD0
 00551899    push        dword ptr [ebp-8]
 0055189C    mov         eax,ebx
 0055189E    mov         edx,3
 005518A3    call        @UStrCatN
>005518A8    jmp         005518BB
 005518AA    mov         eax,ebx
 005518AC    mov         ecx,1
 005518B1    mov         edx,1
 005518B6    call        @UStrDelete
 005518BB    cmp         dword ptr [ebx],0
>005518BE    je          005518C8
 005518C0    mov         eax,dword ptr [ebx]
 005518C2    cmp         word ptr [eax],5C
>005518C6    je          005518AA
 005518C8    xor         eax,eax
 005518CA    pop         edx
 005518CB    pop         ecx
 005518CC    pop         ecx
 005518CD    mov         dword ptr fs:[eax],edx
 005518D0    push        5518F2
 005518D5    lea         eax,[ebp-14]
 005518D8    call        @UStrClr
 005518DD    lea         eax,[ebp-8]
 005518E0    mov         edx,2
 005518E5    call        @UStrArrayClr
 005518EA    ret
>005518EB    jmp         @HandleFinally
>005518F0    jmp         005518D5
 005518F2    pop         edi
 005518F3    pop         esi
 005518F4    pop         ebx
 005518F5    mov         esp,ebp
 005518F7    pop         ebp
 005518F8    ret
end;*}

//00552854
{*procedure sub_00552854(?:TJvCustomAppStorage; ?:UnicodeString; ?:TStrings; ?:?; ?:?);
begin
 00552854    push        ebp
 00552855    mov         ebp,esp
 00552857    push        ecx
 00552858    mov         ecx,0A
 0055285D    push        0
 0055285F    push        0
 00552861    dec         ecx
>00552862    jne         0055285D
 00552864    xchg        ecx,dword ptr [ebp-4]
 00552867    push        ebx
 00552868    push        esi
 00552869    push        edi
 0055286A    mov         dword ptr [ebp-14],ecx
 0055286D    mov         dword ptr [ebp-10],edx
 00552870    mov         dword ptr [ebp-0C],eax
 00552873    mov         ebx,dword ptr [ebp+8]
 00552876    xor         eax,eax
 00552878    push        ebp
 00552879    push        552B6B
 0055287E    push        dword ptr fs:[eax]
 00552881    mov         dword ptr fs:[eax],esp
 00552884    mov         eax,dword ptr [ebp-10]
 00552887    mov         edx,552B88;'\'
 0055288C    call        @UStrEqual
>00552891    jne         0055289D
 00552893    lea         eax,[ebp-8]
 00552896    call        @UStrClr
>0055289B    jmp         005528A8
 0055289D    lea         eax,[ebp-8]
 005528A0    mov         edx,dword ptr [ebp-10]
 005528A3    call        @UStrLAsg
 005528A8    mov         dl,1
 005528AA    mov         eax,[0043C7BC];TStringList
 005528AF    call        TStringList.Create;TStringList.Create
 005528B4    mov         dword ptr [ebp-18],eax
 005528B7    xor         eax,eax
 005528B9    push        ebp
 005528BA    push        552B2F
 005528BF    push        dword ptr fs:[eax]
 005528C2    mov         dword ptr fs:[eax],esp
 005528C5    test        bl,2
>005528C8    je          00552993
 005528CE    test        bl,4
 005528D1    setne       al
 005528D4    push        eax
 005528D5    mov         ecx,dword ptr [ebp-18]
 005528D8    mov         edx,dword ptr [ebp-14]
 005528DB    mov         eax,dword ptr [ebp-0C]
 005528DE    mov         esi,dword ptr [eax]
 005528E0    call        dword ptr [esi+44]
 005528E3    mov         eax,dword ptr [ebp-18]
 005528E6    mov         edx,dword ptr [eax]
 005528E8    call        dword ptr [edx+14];TStringList.GetCount
 005528EB    dec         eax
 005528EC    test        eax,eax
>005528EE    jl          00552993
 005528F4    inc         eax
 005528F5    mov         dword ptr [ebp-1C],eax
 005528F8    xor         esi,esi
 005528FA    lea         ecx,[ebp-20]
 005528FD    mov         edx,esi
 005528FF    mov         eax,dword ptr [ebp-18]
 00552902    mov         edi,dword ptr [eax]
 00552904    call        dword ptr [edi+0C];TStringList.Get
 00552907    cmp         dword ptr [ebp-20],0
>0055290B    jne         0055292B
 0055290D    lea         eax,[ebp-4]
 00552910    push        eax
 00552911    mov         eax,dword ptr [ebp-10]
 00552914    call        @UStrLen
 00552919    mov         ecx,eax
 0055291B    dec         ecx
 0055291C    mov         edx,1
 00552921    mov         eax,dword ptr [ebp-10]
 00552924    call        @UStrCopy
>00552929    jmp         00552946
 0055292B    lea         ecx,[ebp-24]
 0055292E    mov         edx,esi
 00552930    mov         eax,dword ptr [ebp-18]
 00552933    mov         edi,dword ptr [eax]
 00552935    call        dword ptr [edi+0C];TStringList.Get
 00552938    mov         ecx,dword ptr [ebp-24]
 0055293B    lea         eax,[ebp-4]
 0055293E    mov         edx,dword ptr [ebp-8]
 00552941    call        @UStrCat3
 00552946    cmp         dword ptr [ebp-4],0
>0055294A    je          00552989
 0055294C    mov         edx,dword ptr [ebp-4]
 0055294F    mov         eax,dword ptr [ebp+0C]
 00552952    mov         ecx,dword ptr [eax]
 00552954    call        dword ptr [ecx+54]
 00552957    mov         edi,eax
 00552959    cmp         edi,0FFFFFFFF
>0055295C    jle         00552979
 0055295E    mov         edx,edi
 00552960    mov         eax,dword ptr [ebp+0C]
 00552963    mov         ecx,dword ptr [eax]
 00552965    call        dword ptr [ecx+18]
 00552968    mov         ecx,eax
 0055296A    or          ecx,2
 0055296D    mov         edx,edi
 0055296F    mov         eax,dword ptr [ebp+0C]
 00552972    mov         edi,dword ptr [eax]
 00552974    call        dword ptr [edi+24]
>00552977    jmp         00552989
 00552979    mov         ecx,2
 0055297E    mov         edx,dword ptr [ebp-4]
 00552981    mov         eax,dword ptr [ebp+0C]
 00552984    mov         edi,dword ptr [eax]
 00552986    call        dword ptr [edi+3C]
 00552989    inc         esi
 0055298A    dec         dword ptr [ebp-1C]
>0055298D    jne         005528FA
 00552993    test        bl,1
>00552996    jne         005529A1
 00552998    test        bl,10
>0055299B    je          00552B19
 005529A1    mov         eax,dword ptr [ebp-18]
 005529A4    mov         edx,dword ptr [eax]
 005529A6    call        dword ptr [edx+44];TStringList.Clear
 005529A9    push        0
 005529AB    mov         ecx,dword ptr [ebp-18]
 005529AE    mov         edx,dword ptr [ebp-14]
 005529B1    mov         eax,dword ptr [ebp-0C]
 005529B4    mov         esi,dword ptr [eax]
 005529B6    call        dword ptr [esi+40]
 005529B9    mov         eax,dword ptr [ebp-18]
 005529BC    mov         edx,dword ptr [eax]
 005529BE    call        dword ptr [edx+14];TStringList.GetCount
 005529C1    dec         eax
 005529C2    test        eax,eax
>005529C4    jl          00552B19
 005529CA    inc         eax
 005529CB    mov         dword ptr [ebp-1C],eax
 005529CE    xor         esi,esi
 005529D0    test        bl,1
>005529D3    je          00552A86
 005529D9    push        dword ptr [ebp-14]
 005529DC    push        552B88;'\'
 005529E1    lea         ecx,[ebp-2C]
 005529E4    mov         edx,esi
 005529E6    mov         eax,dword ptr [ebp-18]
 005529E9    mov         edi,dword ptr [eax]
 005529EB    call        dword ptr [edi+0C];TStringList.Get
 005529EE    push        dword ptr [ebp-2C]
 005529F1    lea         eax,[ebp-28]
 005529F4    mov         edx,3
 005529F9    call        @UStrCatN
 005529FE    mov         edx,dword ptr [ebp-28]
 00552A01    test        bl,4
 00552A04    setne       cl
 00552A07    mov         eax,dword ptr [ebp-0C]
 00552A0A    call        TJvCustomAppStorage.IsFolder
 00552A0F    test        al,al
>00552A11    je          00552A86
 00552A13    lea         ecx,[ebp-34]
 00552A16    mov         edx,esi
 00552A18    mov         eax,dword ptr [ebp-18]
 00552A1B    mov         edi,dword ptr [eax]
 00552A1D    call        dword ptr [edi+0C];TStringList.Get
 00552A20    mov         ecx,dword ptr [ebp-34]
 00552A23    lea         eax,[ebp-30]
 00552A26    mov         edx,dword ptr [ebp-8]
 00552A29    call        @UStrCat3
 00552A2E    mov         edx,dword ptr [ebp-30]
 00552A31    mov         eax,dword ptr [ebp+0C]
 00552A34    mov         ecx,dword ptr [eax]
 00552A36    call        dword ptr [ecx+54]
 00552A39    mov         edi,eax
 00552A3B    cmp         edi,0FFFFFFFF
>00552A3E    jle         00552A5B
 00552A40    mov         edx,edi
 00552A42    mov         eax,dword ptr [ebp+0C]
 00552A45    mov         ecx,dword ptr [eax]
 00552A47    call        dword ptr [ecx+18]
 00552A4A    mov         ecx,eax
 00552A4C    or          ecx,1
 00552A4F    mov         edx,edi
 00552A51    mov         eax,dword ptr [ebp+0C]
 00552A54    mov         edi,dword ptr [eax]
 00552A56    call        dword ptr [edi+24]
>00552A59    jmp         00552A86
 00552A5B    lea         ecx,[ebp-3C]
 00552A5E    mov         edx,esi
 00552A60    mov         eax,dword ptr [ebp-18]
 00552A63    mov         edi,dword ptr [eax]
 00552A65    call        dword ptr [edi+0C];TStringList.Get
 00552A68    mov         ecx,dword ptr [ebp-3C]
 00552A6B    lea         eax,[ebp-38]
 00552A6E    mov         edx,dword ptr [ebp-8]
 00552A71    call        @UStrCat3
 00552A76    mov         edx,dword ptr [ebp-38]
 00552A79    mov         ecx,1
 00552A7E    mov         eax,dword ptr [ebp+0C]
 00552A81    mov         edi,dword ptr [eax]
 00552A83    call        dword ptr [edi+3C]
 00552A86    test        bl,10
>00552A89    je          00552B0F
 00552A8F    mov         eax,dword ptr [ebp+0C]
 00552A92    push        eax
 00552A93    push        ebx
 00552A94    lea         eax,[ebp-40]
 00552A97    push        eax
 00552A98    mov         eax,dword ptr [ebp-14]
 00552A9B    mov         dword ptr [ebp-48],eax
 00552A9E    lea         ecx,[ebp-4C]
 00552AA1    mov         edx,esi
 00552AA3    mov         eax,dword ptr [ebp-18]
 00552AA6    mov         edi,dword ptr [eax]
 00552AA8    call        dword ptr [edi+0C];TStringList.Get
 00552AAB    mov         eax,dword ptr [ebp-4C]
 00552AAE    mov         dword ptr [ebp-44],eax
 00552AB1    lea         edx,[ebp-48]
 00552AB4    mov         eax,dword ptr [ebp-0C]
 00552AB7    mov         eax,dword ptr [eax]
 00552AB9    mov         ecx,1
 00552ABE    call        TJvCustomAppStorage.ConcatPaths
 00552AC3    mov         eax,dword ptr [ebp-40]
 00552AC6    push        eax
 00552AC7    lea         eax,[ebp-50]
 00552ACA    push        eax
 00552ACB    mov         eax,dword ptr [ebp-10]
 00552ACE    mov         dword ptr [ebp-48],eax
 00552AD1    lea         ecx,[ebp-54]
 00552AD4    mov         edx,esi
 00552AD6    mov         eax,dword ptr [ebp-18]
 00552AD9    mov         edi,dword ptr [eax]
 00552ADB    call        dword ptr [edi+0C];TStringList.Get
 00552ADE    mov         eax,dword ptr [ebp-54]
 00552AE1    mov         dword ptr [ebp-44],eax
 00552AE4    lea         edx,[ebp-48]
 00552AE7    mov         eax,dword ptr [ebp-0C]
 00552AEA    mov         eax,dword ptr [eax]
 00552AEC    mov         ecx,1
 00552AF1    call        TJvCustomAppStorage.ConcatPaths
 00552AF6    lea         eax,[ebp-50]
 00552AF9    mov         edx,552B88;'\'
 00552AFE    call        @UStrCat
 00552B03    mov         edx,dword ptr [ebp-50]
 00552B06    mov         eax,dword ptr [ebp-0C]
 00552B09    pop         ecx
 00552B0A    call        00552854
 00552B0F    inc         esi
 00552B10    dec         dword ptr [ebp-1C]
>00552B13    jne         005529D0
 00552B19    xor         eax,eax
 00552B1B    pop         edx
 00552B1C    pop         ecx
 00552B1D    pop         ecx
 00552B1E    mov         dword ptr fs:[eax],edx
 00552B21    push        552B36
 00552B26    mov         eax,dword ptr [ebp-18]
 00552B29    call        TObject.Free
 00552B2E    ret
>00552B2F    jmp         @HandleFinally
>00552B34    jmp         00552B26
 00552B36    xor         eax,eax
 00552B38    pop         edx
 00552B39    pop         ecx
 00552B3A    pop         ecx
 00552B3B    mov         dword ptr fs:[eax],edx
 00552B3E    push        552B72
 00552B43    lea         eax,[ebp-54]
 00552B46    mov         edx,3
 00552B4B    call        @UStrArrayClr
 00552B50    lea         eax,[ebp-40]
 00552B53    mov         edx,9
 00552B58    call        @UStrArrayClr
 00552B5D    lea         eax,[ebp-8]
 00552B60    mov         edx,2
 00552B65    call        @UStrArrayClr
 00552B6A    ret
>00552B6B    jmp         @HandleFinally
>00552B70    jmp         00552B43
 00552B72    pop         edi
 00552B73    pop         esi
 00552B74    pop         ebx
 00552B75    mov         esp,ebp
 00552B77    pop         ebp
 00552B78    ret         8
end;*}

//00552B8C
{*procedure sub_00552B8C(?:TJvCustomAppStorage; ?:?);
begin
 00552B8C    push        ebx
 00552B8D    push        esi
 00552B8E    mov         esi,edx
 00552B90    mov         ebx,eax
 00552B92    mov         eax,esi
 00552B94    mov         edx,dword ptr [ebx+100];TJvCustomAppStorage.FCurPath:string
 00552B9A    call        @UStrAsg
 00552B9F    pop         esi
 00552BA0    pop         ebx
 00552BA1    ret
end;*}

//00552C04
procedure TJvCustomAppStorage.SetStorageOptions(Value:TJvCustomAppStorageOptions);
begin
{*
 00552C04    push        esi
 00552C05    mov         esi,eax
 00552C07    test        edx,edx
>00552C09    je          00552C1E
 00552C0B    cmp         edx,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
>00552C11    je          00552C1E
 00552C13    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00552C19    mov         ecx,dword ptr [eax]
 00552C1B    call        dword ptr [ecx+8];TJvCustomAppStorageOptions.Assign
 00552C1E    pop         esi
 00552C1F    ret
*}
end;

//00552C20
{*procedure sub_00552C20(?:TJvCustomAppStorage; ?:TPersistent; ?:?);
begin
 00552C20    push        ebp
 00552C21    mov         ebp,esp
 00552C23    push        ebx
 00552C24    cmp         word ptr [eax+112],0
>00552C2C    je          00552C46
 00552C2E    push        ecx
 00552C2F    movzx       ecx,byte ptr [ebp+8]
 00552C33    push        ecx
 00552C34    mov         ebx,eax
 00552C36    mov         ecx,edx
 00552C38    mov         edx,eax
 00552C3A    mov         eax,dword ptr [ebx+114]
 00552C40    call        dword ptr [ebx+110]
 00552C46    pop         ebx
 00552C47    pop         ebp
 00552C48    ret         4
end;*}

//00552C4C
{*function sub_00552C4C(?:TJvCustomAppStorage; ?:?):?;
begin
 00552C4C    push        ebx
 00552C4D    push        esi
 00552C4E    push        edi
 00552C4F    push        ebp
 00552C50    mov         ebp,edx
 00552C52    mov         esi,eax
 00552C54    mov         eax,dword ptr [esi+108]
 00552C5A    call        TCollection.GetCount
 00552C5F    mov         edi,eax
 00552C61    dec         edi
 00552C62    xor         ebx,ebx
>00552C64    jmp         00552CAD
 00552C66    mov         edx,edi
 00552C68    mov         eax,dword ptr [esi+108]
 00552C6E    call        00557550
 00552C73    cmp         ebp,dword ptr [eax+10]
>00552C76    je          00552CAA
 00552C78    mov         edx,edi
 00552C7A    mov         eax,dword ptr [esi+108]
 00552C80    call        00557550
 00552C85    cmp         dword ptr [eax+10],0
>00552C89    je          00552CA6
 00552C8B    mov         edx,edi
 00552C8D    mov         eax,dword ptr [esi+108]
 00552C93    call        00557550
 00552C98    mov         eax,dword ptr [eax+10]
 00552C9B    mov         edx,ebp
 00552C9D    call        00552C4C
 00552CA2    test        al,al
>00552CA4    jne         00552CAA
 00552CA6    xor         ebx,ebx
>00552CA8    jmp         00552CAC
 00552CAA    mov         bl,1
 00552CAC    dec         edi
 00552CAD    test        bl,bl
>00552CAF    jne         00552CB5
 00552CB1    test        edi,edi
>00552CB3    jge         00552C66
 00552CB5    mov         eax,ebx
 00552CB7    pop         ebp
 00552CB8    pop         edi
 00552CB9    pop         esi
 00552CBA    pop         ebx
 00552CBB    ret
end;*}

//00552CBC
{*function sub_00552CBC(?:?):?;
begin
 00552CBC    push        ebp
 00552CBD    mov         ebp,esp
 00552CBF    push        0
 00552CC1    push        ebx
 00552CC2    push        esi
 00552CC3    mov         esi,edx
 00552CC5    mov         ebx,eax
 00552CC7    xor         eax,eax
 00552CC9    push        ebp
 00552CCA    push        552D13
 00552CCF    push        dword ptr fs:[eax]
 00552CD2    mov         dword ptr fs:[eax],esp
 00552CD5    lea         ecx,[ebp-4]
 00552CD8    mov         edx,esi
 00552CDA    mov         eax,552D30;'\'
 00552CDF    call        00538D98
 00552CE4    lea         eax,[ebp-4]
 00552CE7    mov         edx,552D40;'Count'
 00552CEC    call        @UStrCat
 00552CF1    mov         edx,dword ptr [ebp-4]
 00552CF4    mov         eax,ebx
 00552CF6    mov         ecx,dword ptr [eax]
 00552CF8    call        dword ptr [ecx+50];@AbstractError
 00552CFB    mov         ebx,eax
 00552CFD    xor         eax,eax
 00552CFF    pop         edx
 00552D00    pop         ecx
 00552D01    pop         ecx
 00552D02    mov         dword ptr fs:[eax],edx
 00552D05    push        552D1A
 00552D0A    lea         eax,[ebp-4]
 00552D0D    call        @UStrClr
 00552D12    ret
>00552D13    jmp         @HandleFinally
>00552D18    jmp         00552D0A
 00552D1A    mov         eax,ebx
 00552D1C    pop         esi
 00552D1D    pop         ebx
 00552D1E    pop         ecx
 00552D1F    pop         ebp
 00552D20    ret
end;*}

//00552D4C
{*procedure sub_00552D4C(?:?; ?:?);
begin
 00552D4C    push        ebp
 00552D4D    mov         ebp,esp
 00552D4F    add         esp,0FFFFFFF8
 00552D52    push        ebx
 00552D53    push        esi
 00552D54    mov         esi,edx
 00552D56    mov         ebx,eax
 00552D58    fld         qword ptr [ebp+8]
 00552D5B    add         esp,0FFFFFFF4
 00552D5E    fstp        tbyte ptr [esp]
 00552D61    wait
 00552D62    mov         edx,esi
 00552D64    mov         eax,ebx
 00552D66    mov         ecx,dword ptr [eax]
 00552D68    call        dword ptr [ecx+68];@AbstractError
 00552D6B    fstp        qword ptr [ebp-8]
 00552D6E    wait
 00552D6F    fld         qword ptr [ebp-8]
 00552D72    pop         esi
 00552D73    pop         ebx
 00552D74    pop         ecx
 00552D75    pop         ecx
 00552D76    pop         ebp
 00552D77    ret         8
end;*}

//00552D7C
{*procedure sub_00552D7C(?:?; ?:?; ?:?);
begin
 00552D7C    push        ebp
 00552D7D    mov         ebp,esp
 00552D7F    push        0
 00552D81    push        0
 00552D83    push        0
 00552D85    push        0
 00552D87    push        ebx
 00552D88    push        esi
 00552D89    push        edi
 00552D8A    mov         edi,ecx
 00552D8C    mov         esi,edx
 00552D8E    mov         ebx,eax
 00552D90    xor         eax,eax
 00552D92    push        ebp
 00552D93    push        552E09
 00552D98    push        dword ptr fs:[eax]
 00552D9B    mov         dword ptr fs:[eax],esp
 00552D9E    lea         eax,[ebp-8]
 00552DA1    push        eax
 00552DA2    lea         edx,[ebp-10]
 00552DA5    mov         eax,edi
 00552DA7    call        UTF8Encode
 00552DAC    mov         edx,dword ptr [ebp-10]
 00552DAF    lea         eax,[ebp-0C]
 00552DB2    call        @UStrFromLStr
 00552DB7    mov         ecx,dword ptr [ebp-0C]
 00552DBA    mov         edx,esi
 00552DBC    mov         eax,ebx
 00552DBE    call        TJvCustomAppStorage.ReadString
 00552DC3    mov         edx,dword ptr [ebp-8]
 00552DC6    lea         eax,[ebp-4]
 00552DC9    mov         ecx,0
 00552DCE    call        @LStrFromUStr
 00552DD3    mov         eax,dword ptr [ebp-4]
 00552DD6    mov         edx,dword ptr [ebp+8]
 00552DD9    call        UTF8ToWideString
 00552DDE    xor         eax,eax
 00552DE0    pop         edx
 00552DE1    pop         ecx
 00552DE2    pop         ecx
 00552DE3    mov         dword ptr fs:[eax],edx
 00552DE6    push        552E10
 00552DEB    lea         eax,[ebp-10]
 00552DEE    call        @LStrClr
 00552DF3    lea         eax,[ebp-0C]
 00552DF6    mov         edx,2
 00552DFB    call        @UStrArrayClr
 00552E00    lea         eax,[ebp-4]
 00552E03    call        @LStrClr
 00552E08    ret
>00552E09    jmp         @HandleFinally
>00552E0E    jmp         00552DEB
 00552E10    pop         edi
 00552E11    pop         esi
 00552E12    pop         ebx
 00552E13    mov         esp,ebp
 00552E15    pop         ebp
 00552E16    ret         4
end;*}

//00552E1C
{*procedure sub_00552E1C(?:?);
begin
 00552E1C    push        ebp
 00552E1D    mov         ebp,esp
 00552E1F    fld         qword ptr [ebp+8]
 00552E22    add         esp,0FFFFFFF4
 00552E25    fstp        tbyte ptr [esp]
 00552E28    wait
 00552E29    mov         ecx,dword ptr [eax]
 00552E2B    call        dword ptr [ecx+6C];@AbstractError
 00552E2E    pop         ebp
 00552E2F    ret         8
end;*}

//00552E34
{*procedure sub_00552E34(?:?; ?:?);
begin
 00552E34    push        ebp
 00552E35    mov         ebp,esp
 00552E37    push        0
 00552E39    push        0
 00552E3B    push        ebx
 00552E3C    push        esi
 00552E3D    push        edi
 00552E3E    mov         edi,ecx
 00552E40    mov         esi,edx
 00552E42    mov         ebx,eax
 00552E44    xor         eax,eax
 00552E46    push        ebp
 00552E47    push        552E91
 00552E4C    push        dword ptr fs:[eax]
 00552E4F    mov         dword ptr fs:[eax],esp
 00552E52    lea         edx,[ebp-8]
 00552E55    mov         eax,edi
 00552E57    call        UTF8Encode
 00552E5C    mov         edx,dword ptr [ebp-8]
 00552E5F    lea         eax,[ebp-4]
 00552E62    call        @UStrFromLStr
 00552E67    mov         ecx,dword ptr [ebp-4]
 00552E6A    mov         edx,esi
 00552E6C    mov         eax,ebx
 00552E6E    mov         ebx,dword ptr [eax]
 00552E70    call        dword ptr [ebx+74];@AbstractError
 00552E73    xor         eax,eax
 00552E75    pop         edx
 00552E76    pop         ecx
 00552E77    pop         ecx
 00552E78    mov         dword ptr fs:[eax],edx
 00552E7B    push        552E98
 00552E80    lea         eax,[ebp-8]
 00552E83    call        @LStrClr
 00552E88    lea         eax,[ebp-4]
 00552E8B    call        @UStrClr
 00552E90    ret
>00552E91    jmp         @HandleFinally
>00552E96    jmp         00552E80
 00552E98    pop         edi
 00552E99    pop         esi
 00552E9A    pop         ebx
 00552E9B    pop         ecx
 00552E9C    pop         ecx
 00552E9D    pop         ebp
 00552E9E    ret
end;*}

//00552EA0
procedure sub_00552EA0(?:TJvAppIniFileStorage; ?:string);
begin
{*
 00552EA0    push        ebx
 00552EA1    cmp         word ptr [eax+14A],0
>00552EA9    je          00552EBD
 00552EAB    mov         ebx,eax
 00552EAD    mov         ecx,edx
 00552EAF    mov         edx,eax
 00552EB1    mov         eax,dword ptr [ebx+14C]
 00552EB7    call        dword ptr [ebx+148]
 00552EBD    pop         ebx
 00552EBE    ret
*}
end;

//00552EC0
{*function sub_00552EC0(?:?; ?:?):Boolean;
begin
 00552EC0    push        ebx
 00552EC1    push        esi
 00552EC2    push        edi
 00552EC3    mov         ebx,ecx
 00552EC5    mov         esi,edx
 00552EC7    mov         edi,eax
 00552EC9    movzx       ecx,bl
 00552ECC    mov         edx,esi
 00552ECE    mov         eax,edi
 00552ED0    mov         ebx,dword ptr [eax]
 00552ED2    call        dword ptr [ebx+60];@AbstractError
 00552ED5    test        eax,eax
 00552ED7    setne       al
 00552EDA    pop         edi
 00552EDB    pop         esi
 00552EDC    pop         ebx
 00552EDD    ret
end;*}

//00552EE0
{*procedure sub_00552EE0(?:?; ?:?);
begin
 00552EE0    push        ebx
 00552EE1    and         ecx,7F
 00552EE4    mov         ebx,dword ptr [eax]
 00552EE6    call        dword ptr [ebx+64];@AbstractError
 00552EE9    pop         ebx
 00552EEA    ret
end;*}

//00552EEC
{*function sub_00552EEC(?:?; ?:?):?;
begin
 00552EEC    push        ebp
 00552EED    mov         ebp,esp
 00552EEF    add         esp,0FFFFFFF8
 00552EF2    push        ebx
 00552EF3    push        esi
 00552EF4    push        edi
 00552EF5    mov         dword ptr [ebp-8],ecx
 00552EF8    mov         ebx,edx
 00552EFA    mov         dword ptr [ebp-4],eax
 00552EFD    mov         edx,ebx
 00552EFF    mov         eax,dword ptr [ebp-4]
 00552F02    mov         ecx,dword ptr [eax]
 00552F04    call        dword ptr [ecx+50];@AbstractError
 00552F07    test        al,al
>00552F09    jne         00552F1F
 00552F0B    mov         eax,dword ptr [ebp-4]
 00552F0E    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00552F14    cmp         byte ptr [eax+16],0;TJvCustomAppStorageOptions.FDefaultIfValueNotExists:Boolean
>00552F18    je          00552F1F
 00552F1A    mov         ebx,dword ptr [ebp-8]
>00552F1D    jmp         00552F75
 00552F1F    xor         edx,edx
 00552F21    push        ebp
 00552F22    push        552F46
 00552F27    push        dword ptr fs:[edx]
 00552F2A    mov         dword ptr fs:[edx],esp
 00552F2D    mov         ecx,dword ptr [ebp-8]
 00552F30    mov         edx,ebx
 00552F32    mov         eax,dword ptr [ebp-4]
 00552F35    mov         ebx,dword ptr [eax]
 00552F37    call        dword ptr [ebx+60];@AbstractError
 00552F3A    mov         ebx,eax
 00552F3C    xor         eax,eax
 00552F3E    pop         edx
 00552F3F    pop         ecx
 00552F40    pop         ecx
 00552F41    mov         dword ptr fs:[eax],edx
>00552F44    jmp         00552F75
>00552F46    jmp         @HandleOnException
 00552F4B    dd          1
 00552F4F    dd          0041A0BC;EConvertError
 00552F53    dd          00552F57
 00552F57    mov         eax,dword ptr [ebp-4]
 00552F5A    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00552F60    cmp         byte ptr [eax+15],0;TJvCustomAppStorageOptions.FDefaultIfReadConvertError:Boolean
>00552F64    je          00552F6B
 00552F66    mov         ebx,dword ptr [ebp-8]
>00552F69    jmp         00552F70
 00552F6B    call        @RaiseAgain
 00552F70    call        @DoneExcept
 00552F75    mov         eax,ebx
 00552F77    pop         edi
 00552F78    pop         esi
 00552F79    pop         ebx
 00552F7A    pop         ecx
 00552F7B    pop         ecx
 00552F7C    pop         ebp
 00552F7D    ret
end;*}

//00552F80
procedure sub_00552F80;
begin
{*
 00552F80    push        ebx
 00552F81    mov         ebx,dword ptr [eax]
 00552F83    call        dword ptr [ebx+64];@AbstractError
 00552F86    pop         ebx
 00552F87    ret
*}
end;

//00552F88
{*procedure sub_00552F88(?:?; ?:?; ?:?; ?:?);
begin
 00552F88    push        ebp
 00552F89    mov         ebp,esp
 00552F8B    add         esp,0FFFFFFC0
 00552F8E    push        ebx
 00552F8F    push        esi
 00552F90    push        edi
 00552F91    xor         ecx,ecx
 00552F93    mov         dword ptr [ebp-34],ecx
 00552F96    mov         dword ptr [ebp-38],ecx
 00552F99    mov         dword ptr [ebp-3C],ecx
 00552F9C    mov         dword ptr [ebp-40],ecx
 00552F9F    mov         dword ptr [ebp-24],ecx
 00552FA2    mov         dword ptr [ebp-28],ecx
 00552FA5    mov         dword ptr [ebp-2C],ecx
 00552FA8    mov         dword ptr [ebp-30],ecx
 00552FAB    mov         dword ptr [ebp-8],edx
 00552FAE    mov         dword ptr [ebp-4],eax
 00552FB1    xor         eax,eax
 00552FB3    push        ebp
 00552FB4    push        5531AE
 00552FB9    push        dword ptr fs:[eax]
 00552FBC    mov         dword ptr fs:[eax],esp
 00552FBF    mov         edx,dword ptr [ebp-8]
 00552FC2    mov         eax,dword ptr [ebp-4]
 00552FC5    mov         ecx,dword ptr [eax]
 00552FC7    call        dword ptr [ecx+50];@AbstractError
 00552FCA    test        al,al
>00552FCC    jne         00552FF6
 00552FCE    mov         eax,dword ptr [ebp-4]
 00552FD1    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00552FD7    cmp         byte ptr [eax+16],0;TJvCustomAppStorageOptions.FDefaultIfValueNotExists:Boolean
>00552FDB    je          00552FF6
 00552FDD    mov         eax,dword ptr [ebp+8]
 00552FE0    mov         dword ptr [ebp-20],eax
 00552FE3    mov         eax,dword ptr [ebp+0C]
 00552FE6    mov         dword ptr [ebp-1C],eax
 00552FE9    mov         ax,word ptr [ebp+10]
 00552FED    mov         word ptr [ebp-18],ax
>00552FF1    jmp         00553193
 00552FF6    xor         edx,edx
 00552FF8    push        ebp
 00552FF9    push        553153
 00552FFE    push        dword ptr fs:[edx]
 00553001    mov         dword ptr fs:[edx],esp
 00553004    mov         eax,dword ptr [ebp-4]
 00553007    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 0055300D    cmp         byte ptr [eax+14],0;TJvCustomAppStorageOptions.FFloatAsString:Boolean
>00553011    je          005530B4
 00553017    xor         edx,edx
 00553019    push        ebp
 0055301A    push        55307F
 0055301F    push        dword ptr fs:[edx]
 00553022    mov         dword ptr fs:[edx],esp
 00553025    lea         eax,[ebp-28]
 00553028    push        eax
 00553029    movzx       eax,word ptr [ebp+10]
 0055302D    push        eax
 0055302E    push        dword ptr [ebp+0C]
 00553031    push        dword ptr [ebp+8]
 00553034    lea         eax,[ebp-30]
 00553037    call        FloatToStr
 0055303C    mov         edx,dword ptr [ebp-30]
 0055303F    lea         ecx,[ebp-2C]
 00553042    mov         eax,dword ptr [ebp-4]
 00553045    call        005568D8
 0055304A    mov         ecx,dword ptr [ebp-2C]
 0055304D    mov         edx,dword ptr [ebp-8]
 00553050    mov         eax,dword ptr [ebp-4]
 00553053    mov         ebx,dword ptr [eax]
 00553055    call        dword ptr [ebx+70];@AbstractError
 00553058    mov         edx,dword ptr [ebp-28]
 0055305B    lea         ecx,[ebp-24]
 0055305E    mov         eax,dword ptr [ebp-4]
 00553061    call        00556984
 00553066    mov         eax,dword ptr [ebp-24]
 00553069    call        StrToFloat
 0055306E    fstp        tbyte ptr [ebp-20]
 00553071    wait
 00553072    xor         eax,eax
 00553074    pop         edx
 00553075    pop         ecx
 00553076    pop         ecx
 00553077    mov         dword ptr fs:[eax],edx
>0055307A    jmp         00553149
>0055307F    jmp         @HandleOnException
 00553084    dd          1
 00553088    dd          0041A0BC;EConvertError
 0055308C    dd          00553090
 00553090    movzx       eax,word ptr [ebp+10]
 00553094    push        eax
 00553095    push        dword ptr [ebp+0C]
 00553098    push        dword ptr [ebp+8]
 0055309B    mov         edx,dword ptr [ebp-8]
 0055309E    mov         eax,dword ptr [ebp-4]
 005530A1    mov         ecx,dword ptr [eax]
 005530A3    call        dword ptr [ecx+68];@AbstractError
 005530A6    fstp        tbyte ptr [ebp-20]
 005530A9    wait
 005530AA    call        @DoneExcept
>005530AF    jmp         00553149
 005530B4    xor         edx,edx
 005530B6    push        ebp
 005530B7    push        5530E6
 005530BC    push        dword ptr fs:[edx]
 005530BF    mov         dword ptr fs:[edx],esp
 005530C2    movzx       eax,word ptr [ebp+10]
 005530C6    push        eax
 005530C7    push        dword ptr [ebp+0C]
 005530CA    push        dword ptr [ebp+8]
 005530CD    mov         edx,dword ptr [ebp-8]
 005530D0    mov         eax,dword ptr [ebp-4]
 005530D3    mov         ecx,dword ptr [eax]
 005530D5    call        dword ptr [ecx+68];@AbstractError
 005530D8    fstp        tbyte ptr [ebp-20]
 005530DB    wait
 005530DC    xor         eax,eax
 005530DE    pop         edx
 005530DF    pop         ecx
 005530E0    pop         ecx
 005530E1    mov         dword ptr fs:[eax],edx
>005530E4    jmp         00553149
>005530E6    jmp         @HandleOnException
 005530EB    dd          1
 005530EF    dd          0041A0BC;EConvertError
 005530F3    dd          005530F7
 005530F7    lea         eax,[ebp-38]
 005530FA    push        eax
 005530FB    movzx       eax,word ptr [ebp+10]
 005530FF    push        eax
 00553100    push        dword ptr [ebp+0C]
 00553103    push        dword ptr [ebp+8]
 00553106    lea         eax,[ebp-40]
 00553109    call        FloatToStr
 0055310E    mov         edx,dword ptr [ebp-40]
 00553111    lea         ecx,[ebp-3C]
 00553114    mov         eax,dword ptr [ebp-4]
 00553117    call        005568D8
 0055311C    mov         ecx,dword ptr [ebp-3C]
 0055311F    mov         edx,dword ptr [ebp-8]
 00553122    mov         eax,dword ptr [ebp-4]
 00553125    mov         ebx,dword ptr [eax]
 00553127    call        dword ptr [ebx+70];@AbstractError
 0055312A    mov         edx,dword ptr [ebp-38]
 0055312D    lea         ecx,[ebp-34]
 00553130    mov         eax,dword ptr [ebp-4]
 00553133    call        00556984
 00553138    mov         eax,dword ptr [ebp-34]
 0055313B    call        StrToFloat
 00553140    fstp        tbyte ptr [ebp-20]
 00553143    wait
 00553144    call        @DoneExcept
 00553149    xor         eax,eax
 0055314B    pop         edx
 0055314C    pop         ecx
 0055314D    pop         ecx
 0055314E    mov         dword ptr fs:[eax],edx
>00553151    jmp         00553193
>00553153    jmp         @HandleOnException
 00553158    dd          1
 0055315C    dd          0041A0BC;EConvertError
 00553160    dd          00553164
 00553164    mov         eax,dword ptr [ebp-4]
 00553167    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 0055316D    cmp         byte ptr [eax+15],0;TJvCustomAppStorageOptions.FDefaultIfReadConvertError:Boolean
>00553171    je          00553189
 00553173    mov         eax,dword ptr [ebp+8]
 00553176    mov         dword ptr [ebp-20],eax
 00553179    mov         eax,dword ptr [ebp+0C]
 0055317C    mov         dword ptr [ebp-1C],eax
 0055317F    mov         ax,word ptr [ebp+10]
 00553183    mov         word ptr [ebp-18],ax
>00553187    jmp         0055318E
 00553189    call        @RaiseAgain
 0055318E    call        @DoneExcept
 00553193    xor         eax,eax
 00553195    pop         edx
 00553196    pop         ecx
 00553197    pop         ecx
 00553198    mov         dword ptr fs:[eax],edx
 0055319B    push        5531B5
 005531A0    lea         eax,[ebp-40]
 005531A3    mov         edx,8
 005531A8    call        @UStrArrayClr
 005531AD    ret
>005531AE    jmp         @HandleFinally
>005531B3    jmp         005531A0
 005531B5    fld         tbyte ptr [ebp-20]
 005531B8    pop         edi
 005531B9    pop         esi
 005531BA    pop         ebx
 005531BB    mov         esp,ebp
 005531BD    pop         ebp
 005531BE    ret         0C
end;*}

//005531C4
{*procedure sub_005531C4(?:?; ?:?; ?:?; ?:?);
begin
 005531C4    push        ebp
 005531C5    mov         ebp,esp
 005531C7    push        0
 005531C9    push        0
 005531CB    push        ebx
 005531CC    push        esi
 005531CD    mov         esi,edx
 005531CF    mov         ebx,eax
 005531D1    xor         eax,eax
 005531D3    push        ebp
 005531D4    push        553248
 005531D9    push        dword ptr fs:[eax]
 005531DC    mov         dword ptr fs:[eax],esp
 005531DF    mov         eax,dword ptr [ebx+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005531E5    cmp         byte ptr [eax+14],0;TJvCustomAppStorageOptions.FFloatAsString:Boolean
>005531E9    je          00553219
 005531EB    movzx       eax,word ptr [ebp+10]
 005531EF    push        eax
 005531F0    push        dword ptr [ebp+0C]
 005531F3    push        dword ptr [ebp+8]
 005531F6    lea         eax,[ebp-8]
 005531F9    call        FloatToStr
 005531FE    mov         edx,dword ptr [ebp-8]
 00553201    lea         ecx,[ebp-4]
 00553204    mov         eax,ebx
 00553206    call        005568D8
 0055320B    mov         ecx,dword ptr [ebp-4]
 0055320E    mov         edx,esi
 00553210    mov         eax,ebx
 00553212    mov         ebx,dword ptr [eax]
 00553214    call        dword ptr [ebx+74];@AbstractError
>00553217    jmp         0055322D
 00553219    movzx       eax,word ptr [ebp+10]
 0055321D    push        eax
 0055321E    push        dword ptr [ebp+0C]
 00553221    push        dword ptr [ebp+8]
 00553224    mov         edx,esi
 00553226    mov         eax,ebx
 00553228    mov         ecx,dword ptr [eax]
 0055322A    call        dword ptr [ecx+6C];@AbstractError
 0055322D    xor         eax,eax
 0055322F    pop         edx
 00553230    pop         ecx
 00553231    pop         ecx
 00553232    mov         dword ptr fs:[eax],edx
 00553235    push        55324F
 0055323A    lea         eax,[ebp-8]
 0055323D    mov         edx,2
 00553242    call        @UStrArrayClr
 00553247    ret
>00553248    jmp         @HandleFinally
>0055324D    jmp         0055323A
 0055324F    pop         esi
 00553250    pop         ebx
 00553251    pop         ecx
 00553252    pop         ecx
 00553253    pop         ebp
 00553254    ret         0C
end;*}

//00553258
{*procedure sub_00553258(?:?; ?:?; ?:?);
begin
 00553258    push        ebp
 00553259    mov         ebp,esp
 0055325B    add         esp,0FFFFFFF0
 0055325E    push        ebx
 0055325F    push        esi
 00553260    push        edi
 00553261    xor         ebx,ebx
 00553263    mov         dword ptr [ebp-0C],ebx
 00553266    mov         dword ptr [ebp-10],ebx
 00553269    mov         dword ptr [ebp-8],ecx
 0055326C    mov         ebx,edx
 0055326E    mov         dword ptr [ebp-4],eax
 00553271    xor         eax,eax
 00553273    push        ebp
 00553274    push        553340
 00553279    push        dword ptr fs:[eax]
 0055327C    mov         dword ptr fs:[eax],esp
 0055327F    mov         edx,ebx
 00553281    mov         eax,dword ptr [ebp-4]
 00553284    mov         ecx,dword ptr [eax]
 00553286    call        dword ptr [ecx+50];@AbstractError
 00553289    test        al,al
>0055328B    jne         005532A9
 0055328D    mov         eax,dword ptr [ebp-4]
 00553290    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00553296    cmp         byte ptr [eax+16],0;TJvCustomAppStorageOptions.FDefaultIfValueNotExists:Boolean
>0055329A    je          005532A9
 0055329C    mov         eax,dword ptr [ebp+8]
 0055329F    mov         edx,dword ptr [ebp-8]
 005532A2    call        @UStrAsg
>005532A7    jmp         00553325
 005532A9    xor         edx,edx
 005532AB    push        ebp
 005532AC    push        5532EE
 005532B1    push        dword ptr fs:[edx]
 005532B4    mov         dword ptr fs:[edx],esp
 005532B7    lea         eax,[ebp-0C]
 005532BA    push        eax
 005532BB    lea         ecx,[ebp-10]
 005532BE    mov         edx,dword ptr [ebp-8]
 005532C1    mov         eax,dword ptr [ebp-4]
 005532C4    call        005568D8
 005532C9    mov         ecx,dword ptr [ebp-10]
 005532CC    mov         edx,ebx
 005532CE    mov         eax,dword ptr [ebp-4]
 005532D1    mov         ebx,dword ptr [eax]
 005532D3    call        dword ptr [ebx+70];@AbstractError
 005532D6    mov         edx,dword ptr [ebp-0C]
 005532D9    mov         ecx,dword ptr [ebp+8]
 005532DC    mov         eax,dword ptr [ebp-4]
 005532DF    call        00556984
 005532E4    xor         eax,eax
 005532E6    pop         edx
 005532E7    pop         ecx
 005532E8    pop         ecx
 005532E9    mov         dword ptr fs:[eax],edx
>005532EC    jmp         00553325
>005532EE    jmp         @HandleOnException
 005532F3    dd          1
 005532F7    dd          0041A0BC;EConvertError
 005532FB    dd          005532FF
 005532FF    mov         eax,dword ptr [ebp-4]
 00553302    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00553308    cmp         byte ptr [eax+15],0;TJvCustomAppStorageOptions.FDefaultIfReadConvertError:Boolean
>0055330C    je          0055331B
 0055330E    mov         eax,dword ptr [ebp+8]
 00553311    mov         edx,dword ptr [ebp-8]
 00553314    call        @UStrAsg
>00553319    jmp         00553320
 0055331B    call        @RaiseAgain
 00553320    call        @DoneExcept
 00553325    xor         eax,eax
 00553327    pop         edx
 00553328    pop         ecx
 00553329    pop         ecx
 0055332A    mov         dword ptr fs:[eax],edx
 0055332D    push        553347
 00553332    lea         eax,[ebp-10]
 00553335    mov         edx,2
 0055333A    call        @UStrArrayClr
 0055333F    ret
>00553340    jmp         @HandleFinally
>00553345    jmp         00553332
 00553347    pop         edi
 00553348    pop         esi
 00553349    pop         ebx
 0055334A    mov         esp,ebp
 0055334C    pop         ebp
 0055334D    ret         4
end;*}

//00553350
{*procedure sub_00553350(?:?; ?:?);
begin
 00553350    push        ebp
 00553351    mov         ebp,esp
 00553353    push        0
 00553355    push        ebx
 00553356    push        esi
 00553357    push        edi
 00553358    mov         edi,ecx
 0055335A    mov         esi,edx
 0055335C    mov         ebx,eax
 0055335E    xor         eax,eax
 00553360    push        ebp
 00553361    push        55339A
 00553366    push        dword ptr fs:[eax]
 00553369    mov         dword ptr fs:[eax],esp
 0055336C    lea         ecx,[ebp-4]
 0055336F    mov         edx,edi
 00553371    mov         eax,ebx
 00553373    call        005568D8
 00553378    mov         ecx,dword ptr [ebp-4]
 0055337B    mov         edx,esi
 0055337D    mov         eax,ebx
 0055337F    mov         ebx,dword ptr [eax]
 00553381    call        dword ptr [ebx+74];@AbstractError
 00553384    xor         eax,eax
 00553386    pop         edx
 00553387    pop         ecx
 00553388    pop         ecx
 00553389    mov         dword ptr fs:[eax],edx
 0055338C    push        5533A1
 00553391    lea         eax,[ebp-4]
 00553394    call        @UStrClr
 00553399    ret
>0055339A    jmp         @HandleFinally
>0055339F    jmp         00553391
 005533A1    pop         edi
 005533A2    pop         esi
 005533A3    pop         ebx
 005533A4    pop         ecx
 005533A5    pop         ebp
 005533A6    ret
end;*}

//005533A8
{*procedure sub_005533A8(?:?);
begin
 005533A8    push        ebp
 005533A9    mov         ebp,esp
 005533AB    push        ebx
 005533AC    push        esi
 005533AD    mov         esi,eax
 005533AF    mov         eax,dword ptr [ebp+8]
 005533B2    push        eax
 005533B3    mov         eax,esi
 005533B5    mov         ebx,dword ptr [eax]
 005533B7    call        dword ptr [ebx+80];@AbstractError
 005533BD    pop         esi
 005533BE    pop         ebx
 005533BF    pop         ebp
 005533C0    ret         4
end;*}

//005533C4
{*procedure sub_005533C4(?:?);
begin
 005533C4    push        ebp
 005533C5    mov         ebp,esp
 005533C7    push        ebx
 005533C8    push        esi
 005533C9    mov         esi,eax
 005533CB    mov         eax,dword ptr [ebp+8]
 005533CE    push        eax
 005533CF    mov         eax,esi
 005533D1    mov         ebx,dword ptr [eax]
 005533D3    call        dword ptr [ebx+84];@AbstractError
 005533D9    pop         esi
 005533DA    pop         ebx
 005533DB    pop         ebp
 005533DC    ret         4
end;*}

//005533E0
{*procedure sub_005533E0(?:?; ?:?; ?:?);
begin
 005533E0    push        ebp
 005533E1    mov         ebp,esp
 005533E3    mov         ecx,6
 005533E8    push        0
 005533EA    push        0
 005533EC    dec         ecx
>005533ED    jne         005533E8
 005533EF    push        ebx
 005533F0    push        esi
 005533F1    push        edi
 005533F2    mov         dword ptr [ebp-8],edx
 005533F5    mov         dword ptr [ebp-4],eax
 005533F8    xor         eax,eax
 005533FA    push        ebp
 005533FB    push        5535EF
 00553400    push        dword ptr fs:[eax]
 00553403    mov         dword ptr fs:[eax],esp
 00553406    mov         edx,dword ptr [ebp-8]
 00553409    mov         eax,dword ptr [ebp-4]
 0055340C    mov         ecx,dword ptr [eax]
 0055340E    call        dword ptr [ecx+50];@AbstractError
 00553411    test        al,al
>00553413    jne         00553435
 00553415    mov         eax,dword ptr [ebp-4]
 00553418    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 0055341E    cmp         byte ptr [eax+16],0;TJvCustomAppStorageOptions.FDefaultIfValueNotExists:Boolean
>00553422    je          00553435
 00553424    mov         eax,dword ptr [ebp+8]
 00553427    mov         dword ptr [ebp-10],eax
 0055342A    mov         eax,dword ptr [ebp+0C]
 0055342D    mov         dword ptr [ebp-0C],eax
>00553430    jmp         005535D4
 00553435    xor         edx,edx
 00553437    push        ebp
 00553438    push        55359C
 0055343D    push        dword ptr fs:[edx]
 00553440    mov         dword ptr fs:[edx],esp
 00553443    mov         eax,dword ptr [ebp-4]
 00553446    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 0055344C    cmp         byte ptr [eax+13],0;TJvCustomAppStorageOptions.FDateTimeAsString:Boolean
>00553450    je          005534F8
 00553456    xor         edx,edx
 00553458    push        ebp
 00553459    push        5534C5
 0055345E    push        dword ptr fs:[edx]
 00553461    mov         dword ptr fs:[edx],esp
 00553464    lea         eax,[ebp-18]
 00553467    push        eax
 00553468    push        dword ptr [ebp+0C]
 0055346B    push        dword ptr [ebp+8]
 0055346E    lea         edx,[ebp-20]
 00553471    mov         eax,dword ptr [ebp-4]
 00553474    mov         ecx,dword ptr [eax]
 00553476    call        dword ptr [ecx+0E0];TJvCustomAppStorage.sub_00557004
 0055347C    mov         edx,dword ptr [ebp-20]
 0055347F    lea         ecx,[ebp-1C]
 00553482    mov         eax,dword ptr [ebp-4]
 00553485    call        005568D8
 0055348A    mov         ecx,dword ptr [ebp-1C]
 0055348D    mov         edx,dword ptr [ebp-8]
 00553490    mov         eax,dword ptr [ebp-4]
 00553493    mov         ebx,dword ptr [eax]
 00553495    call        dword ptr [ebx+70];@AbstractError
 00553498    mov         edx,dword ptr [ebp-18]
 0055349B    lea         ecx,[ebp-14]
 0055349E    mov         eax,dword ptr [ebp-4]
 005534A1    call        00556984
 005534A6    mov         edx,dword ptr [ebp-14]
 005534A9    mov         eax,dword ptr [ebp-4]
 005534AC    mov         ecx,dword ptr [eax]
 005534AE    call        dword ptr [ecx+0DC];TJvCustomAppStorage.sub_00556F28
 005534B4    fstp        qword ptr [ebp-10]
 005534B7    wait
 005534B8    xor         eax,eax
 005534BA    pop         edx
 005534BB    pop         ecx
 005534BC    pop         ecx
 005534BD    mov         dword ptr fs:[eax],edx
>005534C0    jmp         00553592
>005534C5    jmp         @HandleOnException
 005534CA    dd          1
 005534CE    dd          0041A0BC;EConvertError
 005534D2    dd          005534D6
 005534D6    push        dword ptr [ebp+0C]
 005534D9    push        dword ptr [ebp+8]
 005534DC    mov         edx,dword ptr [ebp-8]
 005534DF    mov         eax,dword ptr [ebp-4]
 005534E2    mov         ecx,dword ptr [eax]
 005534E4    call        dword ptr [ecx+88];TJvCustomAppStorage.sub_00552D4C
 005534EA    fstp        qword ptr [ebp-10]
 005534ED    wait
 005534EE    call        @DoneExcept
>005534F3    jmp         00553592
 005534F8    xor         edx,edx
 005534FA    push        ebp
 005534FB    push        553528
 00553500    push        dword ptr fs:[edx]
 00553503    mov         dword ptr fs:[edx],esp
 00553506    push        dword ptr [ebp+0C]
 00553509    push        dword ptr [ebp+8]
 0055350C    mov         edx,dword ptr [ebp-8]
 0055350F    mov         eax,dword ptr [ebp-4]
 00553512    mov         ecx,dword ptr [eax]
 00553514    call        dword ptr [ecx+88];TJvCustomAppStorage.sub_00552D4C
 0055351A    fstp        qword ptr [ebp-10]
 0055351D    wait
 0055351E    xor         eax,eax
 00553520    pop         edx
 00553521    pop         ecx
 00553522    pop         ecx
 00553523    mov         dword ptr fs:[eax],edx
>00553526    jmp         00553592
>00553528    jmp         @HandleOnException
 0055352D    dd          1
 00553531    dd          0041A0BC;EConvertError
 00553535    dd          00553539
 00553539    lea         eax,[ebp-28]
 0055353C    push        eax
 0055353D    push        dword ptr [ebp+0C]
 00553540    push        dword ptr [ebp+8]
 00553543    lea         edx,[ebp-30]
 00553546    mov         eax,dword ptr [ebp-4]
 00553549    mov         ecx,dword ptr [eax]
 0055354B    call        dword ptr [ecx+0E0];TJvCustomAppStorage.sub_00557004
 00553551    mov         edx,dword ptr [ebp-30]
 00553554    lea         ecx,[ebp-2C]
 00553557    mov         eax,dword ptr [ebp-4]
 0055355A    call        005568D8
 0055355F    mov         ecx,dword ptr [ebp-2C]
 00553562    mov         edx,dword ptr [ebp-8]
 00553565    mov         eax,dword ptr [ebp-4]
 00553568    mov         ebx,dword ptr [eax]
 0055356A    call        dword ptr [ebx+70];@AbstractError
 0055356D    mov         edx,dword ptr [ebp-28]
 00553570    lea         ecx,[ebp-24]
 00553573    mov         eax,dword ptr [ebp-4]
 00553576    call        00556984
 0055357B    mov         edx,dword ptr [ebp-24]
 0055357E    mov         eax,dword ptr [ebp-4]
 00553581    mov         ecx,dword ptr [eax]
 00553583    call        dword ptr [ecx+0DC];TJvCustomAppStorage.sub_00556F28
 00553589    fstp        qword ptr [ebp-10]
 0055358C    wait
 0055358D    call        @DoneExcept
 00553592    xor         eax,eax
 00553594    pop         edx
 00553595    pop         ecx
 00553596    pop         ecx
 00553597    mov         dword ptr fs:[eax],edx
>0055359A    jmp         005535D4
>0055359C    jmp         @HandleOnException
 005535A1    dd          1
 005535A5    dd          0041A0BC;EConvertError
 005535A9    dd          005535AD
 005535AD    mov         eax,dword ptr [ebp-4]
 005535B0    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005535B6    cmp         byte ptr [eax+15],0;TJvCustomAppStorageOptions.FDefaultIfReadConvertError:Boolean
>005535BA    je          005535CA
 005535BC    mov         eax,dword ptr [ebp+8]
 005535BF    mov         dword ptr [ebp-10],eax
 005535C2    mov         eax,dword ptr [ebp+0C]
 005535C5    mov         dword ptr [ebp-0C],eax
>005535C8    jmp         005535CF
 005535CA    call        @RaiseAgain
 005535CF    call        @DoneExcept
 005535D4    xor         eax,eax
 005535D6    pop         edx
 005535D7    pop         ecx
 005535D8    pop         ecx
 005535D9    mov         dword ptr fs:[eax],edx
 005535DC    push        5535F6
 005535E1    lea         eax,[ebp-30]
 005535E4    mov         edx,8
 005535E9    call        @UStrArrayClr
 005535EE    ret
>005535EF    jmp         @HandleFinally
>005535F4    jmp         005535E1
 005535F6    fld         qword ptr [ebp-10]
 005535F9    pop         edi
 005535FA    pop         esi
 005535FB    pop         ebx
 005535FC    mov         esp,ebp
 005535FE    pop         ebp
 005535FF    ret         8
end;*}

//00553604
{*procedure sub_00553604(?:?; ?:?; ?:?);
begin
 00553604    push        ebp
 00553605    mov         ebp,esp
 00553607    push        0
 00553609    push        0
 0055360B    push        ebx
 0055360C    push        esi
 0055360D    mov         esi,edx
 0055360F    mov         ebx,eax
 00553611    xor         eax,eax
 00553613    push        ebp
 00553614    push        553687
 00553619    push        dword ptr fs:[eax]
 0055361C    mov         dword ptr fs:[eax],esp
 0055361F    mov         eax,dword ptr [ebx+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00553625    cmp         byte ptr [eax+13],0;TJvCustomAppStorageOptions.FDateTimeAsString:Boolean
>00553629    je          00553659
 0055362B    push        dword ptr [ebp+0C]
 0055362E    push        dword ptr [ebp+8]
 00553631    lea         edx,[ebp-8]
 00553634    mov         eax,ebx
 00553636    mov         ecx,dword ptr [eax]
 00553638    call        dword ptr [ecx+0E0];TJvCustomAppStorage.sub_00557004
 0055363E    mov         edx,dword ptr [ebp-8]
 00553641    lea         ecx,[ebp-4]
 00553644    mov         eax,ebx
 00553646    call        005568D8
 0055364B    mov         ecx,dword ptr [ebp-4]
 0055364E    mov         edx,esi
 00553650    mov         eax,ebx
 00553652    mov         ebx,dword ptr [eax]
 00553654    call        dword ptr [ebx+74];@AbstractError
>00553657    jmp         0055366C
 00553659    fld         qword ptr [ebp+8]
 0055365C    add         esp,0FFFFFFF4
 0055365F    fstp        tbyte ptr [esp]
 00553662    wait
 00553663    mov         edx,esi
 00553665    mov         eax,ebx
 00553667    mov         ecx,dword ptr [eax]
 00553669    call        dword ptr [ecx+6C];@AbstractError
 0055366C    xor         eax,eax
 0055366E    pop         edx
 0055366F    pop         ecx
 00553670    pop         ecx
 00553671    mov         dword ptr fs:[eax],edx
 00553674    push        55368E
 00553679    lea         eax,[ebp-8]
 0055367C    mov         edx,2
 00553681    call        @UStrArrayClr
 00553686    ret
>00553687    jmp         @HandleFinally
>0055368C    jmp         00553679
 0055368E    pop         esi
 0055368F    pop         ebx
 00553690    pop         ecx
 00553691    pop         ecx
 00553692    pop         ebp
 00553693    ret         8
end;*}

//00553698
{*function sub_00553698(?:?; ?:?):?;
begin
 00553698    push        ebp
 00553699    mov         ebp,esp
 0055369B    push        ecx
 0055369C    mov         ecx,4
 005536A1    push        0
 005536A3    push        0
 005536A5    dec         ecx
>005536A6    jne         005536A1
 005536A8    push        ecx
 005536A9    xchg        ecx,dword ptr [ebp-4]
 005536AC    push        ebx
 005536AD    push        esi
 005536AE    push        edi
 005536AF    mov         byte ptr [ebp-0D],cl
 005536B2    mov         dword ptr [ebp-0C],edx
 005536B5    mov         dword ptr [ebp-8],eax
 005536B8    xor         eax,eax
 005536BA    push        ebp
 005536BB    push        553881
 005536C0    push        dword ptr fs:[eax]
 005536C3    mov         dword ptr fs:[eax],esp
 005536C6    mov         edx,dword ptr [ebp-0C]
 005536C9    mov         eax,dword ptr [ebp-8]
 005536CC    mov         ecx,dword ptr [eax]
 005536CE    call        dword ptr [ecx+50];@AbstractError
 005536D1    test        al,al
>005536D3    jne         005536ED
 005536D5    mov         eax,dword ptr [ebp-8]
 005536D8    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005536DE    cmp         byte ptr [eax+16],0;TJvCustomAppStorageOptions.FDefaultIfValueNotExists:Boolean
>005536E2    je          005536ED
 005536E4    movzx       ebx,byte ptr [ebp-0D]
>005536E8    jmp         0055385E
 005536ED    xor         edx,edx
 005536EF    push        ebp
 005536F0    push        55382E
 005536F5    push        dword ptr fs:[edx]
 005536F8    mov         dword ptr fs:[edx],esp
 005536FB    mov         eax,dword ptr [ebp-8]
 005536FE    mov         ebx,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00553704    cmp         byte ptr [ebx+4],0;TJvCustomAppStorageOptions.FBooleanAsString:Boolean
>00553708    je          00553810
 0055370E    xor         edx,edx
 00553710    push        ebp
 00553711    push        5537E4
 00553716    push        dword ptr fs:[edx]
 00553719    mov         dword ptr fs:[edx],esp
 0055371C    cmp         byte ptr [ebp-0D],0
>00553720    je          0055375C
 00553722    lea         eax,[ebp-14]
 00553725    push        eax
 00553726    lea         edx,[ebp-1C]
 00553729    mov         eax,ebx
 0055372B    call        TJvCustomAppStorageOptions.DefaultTrueString
 00553730    mov         edx,dword ptr [ebp-1C]
 00553733    lea         ecx,[ebp-18]
 00553736    mov         eax,dword ptr [ebp-8]
 00553739    call        005568D8
 0055373E    mov         ecx,dword ptr [ebp-18]
 00553741    mov         edx,dword ptr [ebp-0C]
 00553744    mov         eax,dword ptr [ebp-8]
 00553747    mov         ebx,dword ptr [eax]
 00553749    call        dword ptr [ebx+70];@AbstractError
 0055374C    mov         edx,dword ptr [ebp-14]
 0055374F    lea         ecx,[ebp-4]
 00553752    mov         eax,dword ptr [ebp-8]
 00553755    call        00556984
>0055375A    jmp         00553794
 0055375C    lea         eax,[ebp-20]
 0055375F    push        eax
 00553760    lea         edx,[ebp-28]
 00553763    mov         eax,ebx
 00553765    call        TJvCustomAppStorageOptions.DefaultFalseString
 0055376A    mov         edx,dword ptr [ebp-28]
 0055376D    lea         ecx,[ebp-24]
 00553770    mov         eax,dword ptr [ebp-8]
 00553773    call        005568D8
 00553778    mov         ecx,dword ptr [ebp-24]
 0055377B    mov         edx,dword ptr [ebp-0C]
 0055377E    mov         eax,dword ptr [ebp-8]
 00553781    mov         ebx,dword ptr [eax]
 00553783    call        dword ptr [ebx+70];@AbstractError
 00553786    mov         edx,dword ptr [ebp-20]
 00553789    lea         ecx,[ebp-4]
 0055378C    mov         eax,dword ptr [ebp-8]
 0055378F    call        00556984
 00553794    mov         eax,dword ptr [ebp-8]
 00553797    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 0055379D    mov         edx,dword ptr [ebp-4]
 005537A0    call        TJvCustomAppStorageOptions.IsValueTrueString
 005537A5    test        al,al
>005537A7    je          005537AD
 005537A9    mov         bl,1
>005537AB    jmp         005537DA
 005537AD    mov         eax,dword ptr [ebp-8]
 005537B0    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005537B6    mov         edx,dword ptr [ebp-4]
 005537B9    call        TJvCustomAppStorageOptions.IsValueFalseString
 005537BE    test        al,al
>005537C0    je          005537C6
 005537C2    xor         ebx,ebx
>005537C4    jmp         005537DA
 005537C6    movzx       ecx,byte ptr [ebp-0D]
 005537CA    mov         edx,dword ptr [ebp-0C]
 005537CD    mov         eax,dword ptr [ebp-8]
 005537D0    mov         ebx,dword ptr [eax]
 005537D2    call        dword ptr [ebx+90];TJvCustomAppStorage.sub_00552EC0
 005537D8    mov         ebx,eax
 005537DA    xor         eax,eax
 005537DC    pop         edx
 005537DD    pop         ecx
 005537DE    pop         ecx
 005537DF    mov         dword ptr fs:[eax],edx
>005537E2    jmp         00553824
>005537E4    jmp         @HandleOnException
 005537E9    dd          1
 005537ED    dd          0041A0BC;EConvertError
 005537F1    dd          005537F5
 005537F5    movzx       ecx,byte ptr [ebp-0D]
 005537F9    mov         edx,dword ptr [ebp-0C]
 005537FC    mov         eax,dword ptr [ebp-8]
 005537FF    mov         ebx,dword ptr [eax]
 00553801    call        dword ptr [ebx+90];TJvCustomAppStorage.sub_00552EC0
 00553807    mov         ebx,eax
 00553809    call        @DoneExcept
>0055380E    jmp         00553824
 00553810    movzx       ecx,byte ptr [ebp-0D]
 00553814    mov         edx,dword ptr [ebp-0C]
 00553817    mov         eax,dword ptr [ebp-8]
 0055381A    mov         ebx,dword ptr [eax]
 0055381C    call        dword ptr [ebx+90];TJvCustomAppStorage.sub_00552EC0
 00553822    mov         ebx,eax
 00553824    xor         eax,eax
 00553826    pop         edx
 00553827    pop         ecx
 00553828    pop         ecx
 00553829    mov         dword ptr fs:[eax],edx
>0055382C    jmp         0055385E
>0055382E    jmp         @HandleOnException
 00553833    dd          1
 00553837    dd          0041A0BC;EConvertError
 0055383B    dd          0055383F
 0055383F    mov         eax,dword ptr [ebp-8]
 00553842    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00553848    cmp         byte ptr [eax+15],0;TJvCustomAppStorageOptions.FDefaultIfReadConvertError:Boolean
>0055384C    je          00553854
 0055384E    movzx       ebx,byte ptr [ebp-0D]
>00553852    jmp         00553859
 00553854    call        @RaiseAgain
 00553859    call        @DoneExcept
 0055385E    xor         eax,eax
 00553860    pop         edx
 00553861    pop         ecx
 00553862    pop         ecx
 00553863    mov         dword ptr fs:[eax],edx
 00553866    push        553888
 0055386B    lea         eax,[ebp-28]
 0055386E    mov         edx,6
 00553873    call        @UStrArrayClr
 00553878    lea         eax,[ebp-4]
 0055387B    call        @UStrClr
 00553880    ret
>00553881    jmp         @HandleFinally
>00553886    jmp         0055386B
 00553888    mov         eax,ebx
 0055388A    pop         edi
 0055388B    pop         esi
 0055388C    pop         ebx
 0055388D    mov         esp,ebp
 0055388F    pop         ebp
 00553890    ret
end;*}

//00553894
{*procedure sub_00553894(?:?; ?:?);
begin
 00553894    push        ebp
 00553895    mov         ebp,esp
 00553897    push        0
 00553899    push        0
 0055389B    push        0
 0055389D    push        0
 0055389F    push        ebx
 005538A0    push        esi
 005538A1    push        edi
 005538A2    mov         edi,edx
 005538A4    mov         esi,eax
 005538A6    xor         eax,eax
 005538A8    push        ebp
 005538A9    push        55393D
 005538AE    push        dword ptr fs:[eax]
 005538B1    mov         dword ptr fs:[eax],esp
 005538B4    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005538BA    cmp         byte ptr [eax+4],0;TJvCustomAppStorageOptions.FBooleanAsString:Boolean
>005538BE    je          00553916
 005538C0    test        cl,cl
>005538C2    je          005538ED
 005538C4    lea         edx,[ebp-8]
 005538C7    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005538CD    call        TJvCustomAppStorageOptions.DefaultTrueString
 005538D2    mov         edx,dword ptr [ebp-8]
 005538D5    lea         ecx,[ebp-4]
 005538D8    mov         eax,esi
 005538DA    call        005568D8
 005538DF    mov         ecx,dword ptr [ebp-4]
 005538E2    mov         edx,edi
 005538E4    mov         eax,esi
 005538E6    mov         ebx,dword ptr [eax]
 005538E8    call        dword ptr [ebx+74];@AbstractError
>005538EB    jmp         00553922
 005538ED    lea         edx,[ebp-10]
 005538F0    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005538F6    call        TJvCustomAppStorageOptions.DefaultFalseString
 005538FB    mov         edx,dword ptr [ebp-10]
 005538FE    lea         ecx,[ebp-0C]
 00553901    mov         eax,esi
 00553903    call        005568D8
 00553908    mov         ecx,dword ptr [ebp-0C]
 0055390B    mov         edx,edi
 0055390D    mov         eax,esi
 0055390F    mov         ebx,dword ptr [eax]
 00553911    call        dword ptr [ebx+74];@AbstractError
>00553914    jmp         00553922
 00553916    mov         edx,edi
 00553918    mov         eax,esi
 0055391A    mov         ebx,dword ptr [eax]
 0055391C    call        dword ptr [ebx+94];TJvCustomAppStorage.sub_00552EE0
 00553922    xor         eax,eax
 00553924    pop         edx
 00553925    pop         ecx
 00553926    pop         ecx
 00553927    mov         dword ptr fs:[eax],edx
 0055392A    push        553944
 0055392F    lea         eax,[ebp-10]
 00553932    mov         edx,4
 00553937    call        @UStrArrayClr
 0055393C    ret
>0055393D    jmp         @HandleFinally
>00553942    jmp         0055392F
 00553944    pop         edi
 00553945    pop         esi
 00553946    pop         ebx
 00553947    mov         esp,ebp
 00553949    pop         ebp
 0055394A    ret
end;*}

//0055394C
{*function sub_0055394C(?:TJvCustomAppIniStorage; ?:?):?;
begin
 0055394C    push        ebx
 0055394D    push        esi
 0055394E    push        edi
 0055394F    mov         esi,edx
 00553951    mov         eax,esi
 00553953    call        @UStrToPWChar
 00553958    mov         edi,eax
 0055395A    mov         eax,edi
 0055395C    mov         dx,5C
 00553960    call        AnsiStrRScan
 00553965    mov         ebx,eax
 00553967    test        ebx,ebx
>00553969    jne         0055396D
 0055396B    mov         ebx,edi
 0055396D    mov         edx,5539A0;'I'
 00553972    mov         ecx,4
 00553977    mov         eax,ebx
 00553979    call        AnsiStrLIComp
 0055397E    test        eax,eax
>00553980    jne         00553994
 00553982    mov         edx,5539AC
 00553987    movzx       eax,word ptr [ebx+8]
 0055398B    call        CharInSet
 00553990    test        al,al
>00553992    jne         00553998
 00553994    xor         eax,eax
>00553996    jmp         0055399A
 00553998    mov         al,1
 0055399A    pop         edi
 0055399B    pop         esi
 0055399C    pop         ebx
 0055399D    ret
end;*}

//005539CC
{*procedure TJvCustomAppStorage.ConcatPaths(?:string; ?:?; ?:?);
begin
 005539CC    push        ebp
 005539CD    mov         ebp,esp
 005539CF    push        ebx
 005539D0    push        esi
 005539D1    mov         esi,ecx
 005539D3    mov         ebx,edx
 005539D5    mov         ecx,dword ptr [ebp+8]
 005539D8    mov         eax,ebx
 005539DA    mov         edx,esi
 005539DC    call        00550CD0
 005539E1    pop         esi
 005539E2    pop         ebx
 005539E3    pop         ebp
 005539E4    ret         4
end;*}

//005539E8
procedure TJvCustomAppStorage.ResolvePath(InPath:string; TargetStore:TJvCustomAppStorage; TargetPath:string);
begin
{*
 005539E8    push        ebp
 005539E9    mov         ebp,esp
 005539EB    add         esp,0FFFFFFE8
 005539EE    push        ebx
 005539EF    push        esi
 005539F0    push        edi
 005539F1    xor         ebx,ebx
 005539F3    mov         dword ptr [ebp-14],ebx
 005539F6    mov         dword ptr [ebp-4],ebx
 005539F9    mov         dword ptr [ebp-10],ebx
 005539FC    mov         esi,ecx
 005539FE    mov         edi,edx
 00553A00    mov         ebx,eax
 00553A02    mov         eax,dword ptr [ebp+8]
 00553A05    test        eax,eax
>00553A07    je          00553A0D
 00553A09    xor         edx,edx
 00553A0B    mov         dword ptr [eax],edx
 00553A0D    xor         eax,eax
 00553A0F    push        ebp
 00553A10    push        553AFF
 00553A15    push        dword ptr fs:[eax]
 00553A18    mov         dword ptr fs:[eax],esp
 00553A1B    lea         eax,[ebp-4]
 00553A1E    push        eax
 00553A1F    lea         edx,[ebp-10]
 00553A22    mov         eax,ebx
 00553A24    call        00552B8C
 00553A29    mov         eax,dword ptr [ebp-10]
 00553A2C    mov         dword ptr [ebp-0C],eax
 00553A2F    mov         dword ptr [ebp-8],edi
 00553A32    lea         edx,[ebp-0C]
 00553A35    mov         ecx,1
 00553A3A    mov         eax,dword ptr [ebx]
 00553A3C    call        TJvCustomAppStorage.ConcatPaths
 00553A41    mov         ecx,dword ptr [ebp-4]
 00553A44    mov         eax,dword ptr [ebp+8]
 00553A47    mov         edx,553B1C;'\'
 00553A4C    call        @UStrCat3
 00553A51    mov         dword ptr [esi],ebx
 00553A53    mov         edx,dword ptr [ebp+8]
 00553A56    mov         edx,dword ptr [edx]
 00553A58    or          ecx,0FFFFFFFF
 00553A5B    mov         eax,dword ptr [ebx+108];TJvCustomAppStorage.FSubStorages:TJvAppSubStorages
 00553A61    call        005575F0
 00553A66    mov         ebx,eax
 00553A68    test        ebx,ebx
>00553A6A    je          00553ADC
 00553A6C    cmp         dword ptr [ebx+10],0
>00553A70    je          00553ADC
 00553A72    mov         eax,dword ptr [ebx+10]
 00553A75    mov         dword ptr [esi],eax
 00553A77    mov         eax,dword ptr [ebx+0C]
 00553A7A    call        @UStrLen
 00553A7F    mov         ecx,eax
 00553A81    inc         ecx
 00553A82    mov         eax,dword ptr [ebp+8]
 00553A85    mov         edx,1
 00553A8A    call        @UStrDelete
 00553A8F    mov         eax,dword ptr [ebp+8]
 00553A92    mov         eax,dword ptr [eax]
 00553A94    mov         dword ptr [ebp-18],eax
 00553A97    lea         eax,[ebp-18]
 00553A9A    lea         ecx,[ebp-14]
 00553A9D    xor         edx,edx
 00553A9F    call        00550CD0
 00553AA4    mov         ecx,dword ptr [ebp-14]
 00553AA7    mov         eax,dword ptr [ebp+8]
 00553AAA    mov         edx,553B1C;'\'
 00553AAF    call        @UStrCat3
 00553AB4    mov         eax,dword ptr [ebp+8]
 00553AB7    mov         eax,dword ptr [eax]
 00553AB9    mov         edx,553B1C;'\'
 00553ABE    call        @UStrEqual
>00553AC3    jne         00553ADC
 00553AC5    mov         ecx,dword ptr ds:[78D844];^SResString321:TResStringRec
 00553ACB    mov         dl,1
 00553ACD    mov         eax,[0054D11C];EJVCLAppStorageError
 00553AD2    call        Exception.CreateRes;EJVCLAppStorageError.Create
 00553AD7    call        @RaiseExcept
 00553ADC    xor         eax,eax
 00553ADE    pop         edx
 00553ADF    pop         ecx
 00553AE0    pop         ecx
 00553AE1    mov         dword ptr fs:[eax],edx
 00553AE4    push        553B06
 00553AE9    lea         eax,[ebp-14]
 00553AEC    mov         edx,2
 00553AF1    call        @UStrArrayClr
 00553AF6    lea         eax,[ebp-4]
 00553AF9    call        @UStrClr
 00553AFE    ret
>00553AFF    jmp         @HandleFinally
>00553B04    jmp         00553AE9
 00553B06    pop         edi
 00553B07    pop         esi
 00553B08    pop         ebx
 00553B09    mov         esp,ebp
 00553B0B    pop         ebp
 00553B0C    ret         4
*}
end;

//00553B20
function TJvCustomAppStorage.IsFolder(Path:string; ListIsValue:Boolean):Boolean;
begin
{*
 00553B20    push        ebp
 00553B21    mov         ebp,esp
 00553B23    add         esp,0FFFFFFF4
 00553B26    push        ebx
 00553B27    push        esi
 00553B28    xor         ebx,ebx
 00553B2A    mov         dword ptr [ebp-4],ebx
 00553B2D    mov         byte ptr [ebp-5],cl
 00553B30    mov         esi,edx
 00553B32    mov         ebx,eax
 00553B34    xor         eax,eax
 00553B36    push        ebp
 00553B37    push        553B7E
 00553B3C    push        dword ptr fs:[eax]
 00553B3F    mov         dword ptr fs:[eax],esp
 00553B42    lea         eax,[ebp-4]
 00553B45    call        @UStrClr
 00553B4A    push        eax
 00553B4B    lea         ecx,[ebp-0C]
 00553B4E    mov         edx,esi
 00553B50    mov         eax,ebx
 00553B52    call        TJvCustomAppStorage.ResolvePath
 00553B57    movzx       ecx,byte ptr [ebp-5]
 00553B5B    mov         edx,dword ptr [ebp-4]
 00553B5E    mov         eax,dword ptr [ebp-0C]
 00553B61    mov         ebx,dword ptr [eax]
 00553B63    call        dword ptr [ebx+48];@AbstractError
 00553B66    mov         ebx,eax
 00553B68    xor         eax,eax
 00553B6A    pop         edx
 00553B6B    pop         ecx
 00553B6C    pop         ecx
 00553B6D    mov         dword ptr fs:[eax],edx
 00553B70    push        553B85
 00553B75    lea         eax,[ebp-4]
 00553B78    call        @UStrClr
 00553B7D    ret
>00553B7E    jmp         @HandleFinally
>00553B83    jmp         00553B75
 00553B85    mov         eax,ebx
 00553B87    pop         esi
 00553B88    pop         ebx
 00553B89    mov         esp,ebp
 00553B8B    pop         ebp
 00553B8C    ret
*}
end;

//00553B90
function TJvCustomAppStorage.PathExists(Path:string):Boolean;
begin
{*
 00553B90    push        ebp
 00553B91    mov         ebp,esp
 00553B93    add         esp,0FFFFFFF8
 00553B96    push        ebx
 00553B97    push        esi
 00553B98    xor         ecx,ecx
 00553B9A    mov         dword ptr [ebp-4],ecx
 00553B9D    mov         esi,edx
 00553B9F    mov         ebx,eax
 00553BA1    xor         eax,eax
 00553BA3    push        ebp
 00553BA4    push        553BE7
 00553BA9    push        dword ptr fs:[eax]
 00553BAC    mov         dword ptr fs:[eax],esp
 00553BAF    lea         eax,[ebp-4]
 00553BB2    call        @UStrClr
 00553BB7    push        eax
 00553BB8    lea         ecx,[ebp-8]
 00553BBB    mov         edx,esi
 00553BBD    mov         eax,ebx
 00553BBF    call        TJvCustomAppStorage.ResolvePath
 00553BC4    mov         edx,dword ptr [ebp-4]
 00553BC7    mov         eax,dword ptr [ebp-8]
 00553BCA    mov         ecx,dword ptr [eax]
 00553BCC    call        dword ptr [ecx+4C];@AbstractError
 00553BCF    mov         ebx,eax
 00553BD1    xor         eax,eax
 00553BD3    pop         edx
 00553BD4    pop         ecx
 00553BD5    pop         ecx
 00553BD6    mov         dword ptr fs:[eax],edx
 00553BD9    push        553BEE
 00553BDE    lea         eax,[ebp-4]
 00553BE1    call        @UStrClr
 00553BE6    ret
>00553BE7    jmp         @HandleFinally
>00553BEC    jmp         00553BDE
 00553BEE    mov         eax,ebx
 00553BF0    pop         esi
 00553BF1    pop         ebx
 00553BF2    pop         ecx
 00553BF3    pop         ecx
 00553BF4    pop         ebp
 00553BF5    ret
*}
end;

//00553BF8
function TJvCustomAppStorage.ValueStored(Path:string):Boolean;
begin
{*
 00553BF8    push        ebp
 00553BF9    mov         ebp,esp
 00553BFB    add         esp,0FFFFFFF8
 00553BFE    push        ebx
 00553BFF    push        esi
 00553C00    xor         ecx,ecx
 00553C02    mov         dword ptr [ebp-4],ecx
 00553C05    mov         esi,edx
 00553C07    mov         ebx,eax
 00553C09    xor         eax,eax
 00553C0B    push        ebp
 00553C0C    push        553C4F
 00553C11    push        dword ptr fs:[eax]
 00553C14    mov         dword ptr fs:[eax],esp
 00553C17    lea         eax,[ebp-4]
 00553C1A    call        @UStrClr
 00553C1F    push        eax
 00553C20    lea         ecx,[ebp-8]
 00553C23    mov         edx,esi
 00553C25    mov         eax,ebx
 00553C27    call        TJvCustomAppStorage.ResolvePath
 00553C2C    mov         edx,dword ptr [ebp-4]
 00553C2F    mov         eax,dword ptr [ebp-8]
 00553C32    mov         ecx,dword ptr [eax]
 00553C34    call        dword ptr [ecx+50];@AbstractError
 00553C37    mov         ebx,eax
 00553C39    xor         eax,eax
 00553C3B    pop         edx
 00553C3C    pop         ecx
 00553C3D    pop         ecx
 00553C3E    mov         dword ptr fs:[eax],edx
 00553C41    push        553C56
 00553C46    lea         eax,[ebp-4]
 00553C49    call        @UStrClr
 00553C4E    ret
>00553C4F    jmp         @HandleFinally
>00553C54    jmp         00553C46
 00553C56    mov         eax,ebx
 00553C58    pop         esi
 00553C59    pop         ebx
 00553C5A    pop         ecx
 00553C5B    pop         ecx
 00553C5C    pop         ebp
 00553C5D    ret
*}
end;

//00553C60
function TJvCustomAppStorage.ListStored(Path:string; ItemName:string):Boolean;
begin
{*
 00553C60    push        ebp
 00553C61    mov         ebp,esp
 00553C63    add         esp,0FFFFFFF8
 00553C66    push        ebx
 00553C67    push        esi
 00553C68    push        edi
 00553C69    xor         ebx,ebx
 00553C6B    mov         dword ptr [ebp-4],ebx
 00553C6E    mov         edi,ecx
 00553C70    mov         esi,edx
 00553C72    mov         ebx,eax
 00553C74    xor         eax,eax
 00553C76    push        ebp
 00553C77    push        553CBC
 00553C7C    push        dword ptr fs:[eax]
 00553C7F    mov         dword ptr fs:[eax],esp
 00553C82    lea         eax,[ebp-4]
 00553C85    call        @UStrClr
 00553C8A    push        eax
 00553C8B    lea         ecx,[ebp-8]
 00553C8E    mov         edx,esi
 00553C90    mov         eax,ebx
 00553C92    call        TJvCustomAppStorage.ResolvePath
 00553C97    mov         ecx,edi
 00553C99    mov         edx,dword ptr [ebp-4]
 00553C9C    mov         eax,dword ptr [ebp-8]
 00553C9F    mov         ebx,dword ptr [eax]
 00553CA1    call        dword ptr [ebx+54];TJvCustomAppStorage.sub_00552CBC
 00553CA4    mov         ebx,eax
 00553CA6    xor         eax,eax
 00553CA8    pop         edx
 00553CA9    pop         ecx
 00553CAA    pop         ecx
 00553CAB    mov         dword ptr fs:[eax],edx
 00553CAE    push        553CC3
 00553CB3    lea         eax,[ebp-4]
 00553CB6    call        @UStrClr
 00553CBB    ret
>00553CBC    jmp         @HandleFinally
>00553CC1    jmp         00553CB3
 00553CC3    mov         eax,ebx
 00553CC5    pop         edi
 00553CC6    pop         esi
 00553CC7    pop         ebx
 00553CC8    pop         ecx
 00553CC9    pop         ecx
 00553CCA    pop         ebp
 00553CCB    ret
*}
end;

//00553CCC
procedure TJvCustomAppStorage.DeleteValue(Path:string);
begin
{*
 00553CCC    push        ebp
 00553CCD    mov         ebp,esp
 00553CCF    add         esp,0FFFFFFF8
 00553CD2    push        ebx
 00553CD3    push        esi
 00553CD4    xor         ecx,ecx
 00553CD6    mov         dword ptr [ebp-4],ecx
 00553CD9    mov         esi,edx
 00553CDB    mov         ebx,eax
 00553CDD    xor         eax,eax
 00553CDF    push        ebp
 00553CE0    push        553D2D
 00553CE5    push        dword ptr fs:[eax]
 00553CE8    mov         dword ptr fs:[eax],esp
 00553CEB    lea         eax,[ebp-4]
 00553CEE    call        @UStrClr
 00553CF3    push        eax
 00553CF4    lea         ecx,[ebp-8]
 00553CF7    mov         edx,esi
 00553CF9    mov         eax,ebx
 00553CFB    call        TJvCustomAppStorage.ResolvePath
 00553D00    mov         eax,dword ptr [ebp-8]
 00553D03    call        TJvCustomAppMemoryFileStorage.GetReadOnly
 00553D08    test        al,al
>00553D0A    jne         00553D17
 00553D0C    mov         edx,dword ptr [ebp-4]
 00553D0F    mov         eax,dword ptr [ebp-8]
 00553D12    mov         ecx,dword ptr [eax]
 00553D14    call        dword ptr [ecx+58];@AbstractError
 00553D17    xor         eax,eax
 00553D19    pop         edx
 00553D1A    pop         ecx
 00553D1B    pop         ecx
 00553D1C    mov         dword ptr fs:[eax],edx
 00553D1F    push        553D34
 00553D24    lea         eax,[ebp-4]
 00553D27    call        @UStrClr
 00553D2C    ret
>00553D2D    jmp         @HandleFinally
>00553D32    jmp         00553D24
 00553D34    pop         esi
 00553D35    pop         ebx
 00553D36    pop         ecx
 00553D37    pop         ecx
 00553D38    pop         ebp
 00553D39    ret
*}
end;

//00553D3C
procedure TJvCustomAppStorage.DeleteSubTree(Path:string);
begin
{*
 00553D3C    push        ebp
 00553D3D    mov         ebp,esp
 00553D3F    add         esp,0FFFFFFF8
 00553D42    push        ebx
 00553D43    push        esi
 00553D44    xor         ecx,ecx
 00553D46    mov         dword ptr [ebp-4],ecx
 00553D49    mov         esi,edx
 00553D4B    mov         ebx,eax
 00553D4D    xor         eax,eax
 00553D4F    push        ebp
 00553D50    push        553D9C
 00553D55    push        dword ptr fs:[eax]
 00553D58    mov         dword ptr fs:[eax],esp
 00553D5B    lea         eax,[ebp-4]
 00553D5E    call        @UStrClr
 00553D63    push        eax
 00553D64    lea         ecx,[ebp-8]
 00553D67    mov         edx,esi
 00553D69    mov         eax,ebx
 00553D6B    call        TJvCustomAppStorage.ResolvePath
 00553D70    mov         eax,dword ptr [ebp-8]
 00553D73    call        TJvCustomAppMemoryFileStorage.GetReadOnly
 00553D78    test        al,al
>00553D7A    jne         00553D86
 00553D7C    mov         edx,esi
 00553D7E    mov         eax,dword ptr [ebp-8]
 00553D81    mov         ecx,dword ptr [eax]
 00553D83    call        dword ptr [ecx+5C];@AbstractError
 00553D86    xor         eax,eax
 00553D88    pop         edx
 00553D89    pop         ecx
 00553D8A    pop         ecx
 00553D8B    mov         dword ptr fs:[eax],edx
 00553D8E    push        553DA3
 00553D93    lea         eax,[ebp-4]
 00553D96    call        @UStrClr
 00553D9B    ret
>00553D9C    jmp         @HandleFinally
>00553DA1    jmp         00553D93
 00553DA3    pop         esi
 00553DA4    pop         ebx
 00553DA5    pop         ecx
 00553DA6    pop         ecx
 00553DA7    pop         ebp
 00553DA8    ret
*}
end;

//00553DAC
function TJvCustomAppStorage.ReadInteger(Path:string; Default:Integer):Integer;
begin
{*
 00553DAC    push        ebp
 00553DAD    mov         ebp,esp
 00553DAF    add         esp,0FFFFFFF8
 00553DB2    push        ebx
 00553DB3    push        esi
 00553DB4    push        edi
 00553DB5    xor         ebx,ebx
 00553DB7    mov         dword ptr [ebp-4],ebx
 00553DBA    mov         edi,ecx
 00553DBC    mov         esi,edx
 00553DBE    mov         ebx,eax
 00553DC0    xor         eax,eax
 00553DC2    push        ebp
 00553DC3    push        553E0B
 00553DC8    push        dword ptr fs:[eax]
 00553DCB    mov         dword ptr fs:[eax],esp
 00553DCE    lea         eax,[ebp-4]
 00553DD1    call        @UStrClr
 00553DD6    push        eax
 00553DD7    lea         ecx,[ebp-8]
 00553DDA    mov         edx,esi
 00553DDC    mov         eax,ebx
 00553DDE    call        TJvCustomAppStorage.ResolvePath
 00553DE3    mov         ecx,edi
 00553DE5    mov         edx,dword ptr [ebp-4]
 00553DE8    mov         eax,dword ptr [ebp-8]
 00553DEB    mov         ebx,dword ptr [eax]
 00553DED    call        dword ptr [ebx+98];TJvCustomAppStorage.sub_00552EEC
 00553DF3    mov         ebx,eax
 00553DF5    xor         eax,eax
 00553DF7    pop         edx
 00553DF8    pop         ecx
 00553DF9    pop         ecx
 00553DFA    mov         dword ptr fs:[eax],edx
 00553DFD    push        553E12
 00553E02    lea         eax,[ebp-4]
 00553E05    call        @UStrClr
 00553E0A    ret
>00553E0B    jmp         @HandleFinally
>00553E10    jmp         00553E02
 00553E12    mov         eax,ebx
 00553E14    pop         edi
 00553E15    pop         esi
 00553E16    pop         ebx
 00553E17    pop         ecx
 00553E18    pop         ecx
 00553E19    pop         ebp
 00553E1A    ret
*}
end;

//00553E1C
procedure TJvCustomAppStorage.WriteInteger(Path:string; Value:Integer);
begin
{*
 00553E1C    push        ebp
 00553E1D    mov         ebp,esp
 00553E1F    add         esp,0FFFFFFF8
 00553E22    push        ebx
 00553E23    push        esi
 00553E24    push        edi
 00553E25    xor         ebx,ebx
 00553E27    mov         dword ptr [ebp-4],ebx
 00553E2A    mov         edi,ecx
 00553E2C    mov         esi,edx
 00553E2E    mov         ebx,eax
 00553E30    xor         eax,eax
 00553E32    push        ebp
 00553E33    push        553E85
 00553E38    push        dword ptr fs:[eax]
 00553E3B    mov         dword ptr fs:[eax],esp
 00553E3E    lea         eax,[ebp-4]
 00553E41    call        @UStrClr
 00553E46    push        eax
 00553E47    lea         ecx,[ebp-8]
 00553E4A    mov         edx,esi
 00553E4C    mov         eax,ebx
 00553E4E    call        TJvCustomAppStorage.ResolvePath
 00553E53    mov         eax,dword ptr [ebp-8]
 00553E56    call        TJvCustomAppMemoryFileStorage.GetReadOnly
 00553E5B    test        al,al
>00553E5D    jne         00553E6F
 00553E5F    mov         ecx,edi
 00553E61    mov         edx,dword ptr [ebp-4]
 00553E64    mov         eax,dword ptr [ebp-8]
 00553E67    mov         ebx,dword ptr [eax]
 00553E69    call        dword ptr [ebx+9C];TJvCustomAppStorage.sub_00552F80
 00553E6F    xor         eax,eax
 00553E71    pop         edx
 00553E72    pop         ecx
 00553E73    pop         ecx
 00553E74    mov         dword ptr fs:[eax],edx
 00553E77    push        553E8C
 00553E7C    lea         eax,[ebp-4]
 00553E7F    call        @UStrClr
 00553E84    ret
>00553E85    jmp         @HandleFinally
>00553E8A    jmp         00553E7C
 00553E8C    pop         edi
 00553E8D    pop         esi
 00553E8E    pop         ebx
 00553E8F    pop         ecx
 00553E90    pop         ecx
 00553E91    pop         ebp
 00553E92    ret
*}
end;

//00553E94
{*function TJvCustomAppStorage.ReadFloat(Path:string; Default:Extended; ?:?; ?:?):Extended;
begin
 00553E94    push        ebp
 00553E95    mov         ebp,esp
 00553E97    add         esp,0FFFFFFEC
 00553E9A    push        ebx
 00553E9B    push        esi
 00553E9C    xor         ecx,ecx
 00553E9E    mov         dword ptr [ebp-4],ecx
 00553EA1    mov         esi,edx
 00553EA3    mov         ebx,eax
 00553EA5    xor         eax,eax
 00553EA7    push        ebp
 00553EA8    push        553EFB
 00553EAD    push        dword ptr fs:[eax]
 00553EB0    mov         dword ptr fs:[eax],esp
 00553EB3    lea         eax,[ebp-4]
 00553EB6    call        @UStrClr
 00553EBB    push        eax
 00553EBC    lea         ecx,[ebp-14]
 00553EBF    mov         edx,esi
 00553EC1    mov         eax,ebx
 00553EC3    call        TJvCustomAppStorage.ResolvePath
 00553EC8    movzx       eax,word ptr [ebp+10]
 00553ECC    push        eax
 00553ECD    push        dword ptr [ebp+0C]
 00553ED0    push        dword ptr [ebp+8]
 00553ED3    mov         edx,dword ptr [ebp-4]
 00553ED6    mov         eax,dword ptr [ebp-14]
 00553ED9    mov         ecx,dword ptr [eax]
 00553EDB    call        dword ptr [ecx+0A0];TJvCustomAppStorage.sub_00552F88
 00553EE1    fstp        tbyte ptr [ebp-10]
 00553EE4    wait
 00553EE5    xor         eax,eax
 00553EE7    pop         edx
 00553EE8    pop         ecx
 00553EE9    pop         ecx
 00553EEA    mov         dword ptr fs:[eax],edx
 00553EED    push        553F02
 00553EF2    lea         eax,[ebp-4]
 00553EF5    call        @UStrClr
 00553EFA    ret
>00553EFB    jmp         @HandleFinally
>00553F00    jmp         00553EF2
 00553F02    fld         tbyte ptr [ebp-10]
 00553F05    pop         esi
 00553F06    pop         ebx
 00553F07    mov         esp,ebp
 00553F09    pop         ebp
 00553F0A    ret         0C
end;*}

//00553F10
{*procedure TJvCustomAppStorage.WriteFloat(Path:string; Value:Extended; ?:?; ?:?);
begin
 00553F10    push        ebp
 00553F11    mov         ebp,esp
 00553F13    add         esp,0FFFFFFF8
 00553F16    push        ebx
 00553F17    push        esi
 00553F18    xor         ecx,ecx
 00553F1A    mov         dword ptr [ebp-4],ecx
 00553F1D    mov         esi,edx
 00553F1F    mov         ebx,eax
 00553F21    xor         eax,eax
 00553F23    push        ebp
 00553F24    push        553F7F
 00553F29    push        dword ptr fs:[eax]
 00553F2C    mov         dword ptr fs:[eax],esp
 00553F2F    lea         eax,[ebp-4]
 00553F32    call        @UStrClr
 00553F37    push        eax
 00553F38    lea         ecx,[ebp-8]
 00553F3B    mov         edx,esi
 00553F3D    mov         eax,ebx
 00553F3F    call        TJvCustomAppStorage.ResolvePath
 00553F44    mov         eax,dword ptr [ebp-8]
 00553F47    call        TJvCustomAppMemoryFileStorage.GetReadOnly
 00553F4C    test        al,al
>00553F4E    jne         00553F69
 00553F50    movzx       eax,word ptr [ebp+10]
 00553F54    push        eax
 00553F55    push        dword ptr [ebp+0C]
 00553F58    push        dword ptr [ebp+8]
 00553F5B    mov         edx,dword ptr [ebp-4]
 00553F5E    mov         eax,dword ptr [ebp-8]
 00553F61    mov         ecx,dword ptr [eax]
 00553F63    call        dword ptr [ecx+0A4];TJvCustomAppStorage.sub_005531C4
 00553F69    xor         eax,eax
 00553F6B    pop         edx
 00553F6C    pop         ecx
 00553F6D    pop         ecx
 00553F6E    mov         dword ptr fs:[eax],edx
 00553F71    push        553F86
 00553F76    lea         eax,[ebp-4]
 00553F79    call        @UStrClr
 00553F7E    ret
>00553F7F    jmp         @HandleFinally
>00553F84    jmp         00553F76
 00553F86    pop         esi
 00553F87    pop         ebx
 00553F88    pop         ecx
 00553F89    pop         ecx
 00553F8A    pop         ebp
 00553F8B    ret         0C
end;*}

//00553F90
{*procedure TJvCustomAppStorage.ReadString(Path:string; Default:string; ?:?);
begin
 00553F90    push        ebp
 00553F91    mov         ebp,esp
 00553F93    add         esp,0FFFFFFF4
 00553F96    push        ebx
 00553F97    push        esi
 00553F98    xor         ebx,ebx
 00553F9A    mov         dword ptr [ebp-4],ebx
 00553F9D    mov         dword ptr [ebp-8],ecx
 00553FA0    mov         esi,edx
 00553FA2    mov         ebx,eax
 00553FA4    xor         eax,eax
 00553FA6    push        ebp
 00553FA7    push        553FF2
 00553FAC    push        dword ptr fs:[eax]
 00553FAF    mov         dword ptr fs:[eax],esp
 00553FB2    lea         eax,[ebp-4]
 00553FB5    call        @UStrClr
 00553FBA    push        eax
 00553FBB    lea         ecx,[ebp-0C]
 00553FBE    mov         edx,esi
 00553FC0    mov         eax,ebx
 00553FC2    call        TJvCustomAppStorage.ResolvePath
 00553FC7    mov         eax,dword ptr [ebp+8]
 00553FCA    push        eax
 00553FCB    mov         ecx,dword ptr [ebp-8]
 00553FCE    mov         edx,dword ptr [ebp-4]
 00553FD1    mov         eax,dword ptr [ebp-0C]
 00553FD4    mov         ebx,dword ptr [eax]
 00553FD6    call        dword ptr [ebx+0A8];TJvCustomAppStorage.sub_00553258
 00553FDC    xor         eax,eax
 00553FDE    pop         edx
 00553FDF    pop         ecx
 00553FE0    pop         ecx
 00553FE1    mov         dword ptr fs:[eax],edx
 00553FE4    push        553FF9
 00553FE9    lea         eax,[ebp-4]
 00553FEC    call        @UStrClr
 00553FF1    ret
>00553FF2    jmp         @HandleFinally
>00553FF7    jmp         00553FE9
 00553FF9    pop         esi
 00553FFA    pop         ebx
 00553FFB    mov         esp,ebp
 00553FFD    pop         ebp
 00553FFE    ret         4
end;*}

//00554004
procedure TJvCustomAppStorage.WriteString(Path:string; Value:string);
begin
{*
 00554004    push        ebp
 00554005    mov         ebp,esp
 00554007    add         esp,0FFFFFFF8
 0055400A    push        ebx
 0055400B    push        esi
 0055400C    push        edi
 0055400D    xor         ebx,ebx
 0055400F    mov         dword ptr [ebp-4],ebx
 00554012    mov         edi,ecx
 00554014    mov         esi,edx
 00554016    mov         ebx,eax
 00554018    xor         eax,eax
 0055401A    push        ebp
 0055401B    push        55406D
 00554020    push        dword ptr fs:[eax]
 00554023    mov         dword ptr fs:[eax],esp
 00554026    lea         eax,[ebp-4]
 00554029    call        @UStrClr
 0055402E    push        eax
 0055402F    lea         ecx,[ebp-8]
 00554032    mov         edx,esi
 00554034    mov         eax,ebx
 00554036    call        TJvCustomAppStorage.ResolvePath
 0055403B    mov         eax,dword ptr [ebp-8]
 0055403E    call        TJvCustomAppMemoryFileStorage.GetReadOnly
 00554043    test        al,al
>00554045    jne         00554057
 00554047    mov         ecx,edi
 00554049    mov         edx,dword ptr [ebp-4]
 0055404C    mov         eax,dword ptr [ebp-8]
 0055404F    mov         ebx,dword ptr [eax]
 00554051    call        dword ptr [ebx+0AC];TJvCustomAppStorage.sub_00553350
 00554057    xor         eax,eax
 00554059    pop         edx
 0055405A    pop         ecx
 0055405B    pop         ecx
 0055405C    mov         dword ptr fs:[eax],edx
 0055405F    push        554074
 00554064    lea         eax,[ebp-4]
 00554067    call        @UStrClr
 0055406C    ret
>0055406D    jmp         @HandleFinally
>00554072    jmp         00554064
 00554074    pop         edi
 00554075    pop         esi
 00554076    pop         ebx
 00554077    pop         ecx
 00554078    pop         ecx
 00554079    pop         ebp
 0055407A    ret
*}
end;

//0055407C
function TJvCustomAppStorage.ReadBinary(Path:string; Buf:Pointer; BufSize:Integer):Integer;
begin
{*
 0055407C    push        ebp
 0055407D    mov         ebp,esp
 0055407F    add         esp,0FFFFFFF8
 00554082    push        ebx
 00554083    push        esi
 00554084    push        edi
 00554085    xor         ebx,ebx
 00554087    mov         dword ptr [ebp-4],ebx
 0055408A    mov         edi,ecx
 0055408C    mov         esi,edx
 0055408E    mov         ebx,eax
 00554090    xor         eax,eax
 00554092    push        ebp
 00554093    push        5540DF
 00554098    push        dword ptr fs:[eax]
 0055409B    mov         dword ptr fs:[eax],esp
 0055409E    lea         eax,[ebp-4]
 005540A1    call        @UStrClr
 005540A6    push        eax
 005540A7    lea         ecx,[ebp-8]
 005540AA    mov         edx,esi
 005540AC    mov         eax,ebx
 005540AE    call        TJvCustomAppStorage.ResolvePath
 005540B3    mov         eax,dword ptr [ebp+8]
 005540B6    push        eax
 005540B7    mov         ecx,edi
 005540B9    mov         edx,dword ptr [ebp-4]
 005540BC    mov         eax,dword ptr [ebp-8]
 005540BF    mov         ebx,dword ptr [eax]
 005540C1    call        dword ptr [ebx+0B0];TJvCustomAppStorage.sub_005533A8
 005540C7    mov         ebx,eax
 005540C9    xor         eax,eax
 005540CB    pop         edx
 005540CC    pop         ecx
 005540CD    pop         ecx
 005540CE    mov         dword ptr fs:[eax],edx
 005540D1    push        5540E6
 005540D6    lea         eax,[ebp-4]
 005540D9    call        @UStrClr
 005540DE    ret
>005540DF    jmp         @HandleFinally
>005540E4    jmp         005540D6
 005540E6    mov         eax,ebx
 005540E8    pop         edi
 005540E9    pop         esi
 005540EA    pop         ebx
 005540EB    pop         ecx
 005540EC    pop         ecx
 005540ED    pop         ebp
 005540EE    ret         4
*}
end;

//005540F4
procedure TJvCustomAppStorage.WriteBinary(Path:string; Buf:Pointer; BufSize:Integer);
begin
{*
 005540F4    push        ebp
 005540F5    mov         ebp,esp
 005540F7    add         esp,0FFFFFFF8
 005540FA    push        ebx
 005540FB    push        esi
 005540FC    push        edi
 005540FD    xor         ebx,ebx
 005540FF    mov         dword ptr [ebp-4],ebx
 00554102    mov         edi,ecx
 00554104    mov         esi,edx
 00554106    mov         ebx,eax
 00554108    xor         eax,eax
 0055410A    push        ebp
 0055410B    push        554161
 00554110    push        dword ptr fs:[eax]
 00554113    mov         dword ptr fs:[eax],esp
 00554116    lea         eax,[ebp-4]
 00554119    call        @UStrClr
 0055411E    push        eax
 0055411F    lea         ecx,[ebp-8]
 00554122    mov         edx,esi
 00554124    mov         eax,ebx
 00554126    call        TJvCustomAppStorage.ResolvePath
 0055412B    mov         eax,dword ptr [ebp-8]
 0055412E    call        TJvCustomAppMemoryFileStorage.GetReadOnly
 00554133    test        al,al
>00554135    jne         0055414B
 00554137    mov         eax,dword ptr [ebp+8]
 0055413A    push        eax
 0055413B    mov         ecx,edi
 0055413D    mov         edx,dword ptr [ebp-4]
 00554140    mov         eax,dword ptr [ebp-8]
 00554143    mov         ebx,dword ptr [eax]
 00554145    call        dword ptr [ebx+0B4];TJvCustomAppStorage.sub_005533C4
 0055414B    xor         eax,eax
 0055414D    pop         edx
 0055414E    pop         ecx
 0055414F    pop         ecx
 00554150    mov         dword ptr fs:[eax],edx
 00554153    push        554168
 00554158    lea         eax,[ebp-4]
 0055415B    call        @UStrClr
 00554160    ret
>00554161    jmp         @HandleFinally
>00554166    jmp         00554158
 00554168    pop         edi
 00554169    pop         esi
 0055416A    pop         ebx
 0055416B    pop         ecx
 0055416C    pop         ecx
 0055416D    pop         ebp
 0055416E    ret         4
*}
end;

//00554174
{*function TJvCustomAppStorage.ReadDateTime(Path:string; Default:TDateTime; ?:?):TDateTime;
begin
 00554174    push        ebp
 00554175    mov         ebp,esp
 00554177    add         esp,0FFFFFFEC
 0055417A    push        ebx
 0055417B    push        esi
 0055417C    xor         ecx,ecx
 0055417E    mov         dword ptr [ebp-4],ecx
 00554181    mov         esi,edx
 00554183    mov         ebx,eax
 00554185    xor         eax,eax
 00554187    push        ebp
 00554188    push        5541D6
 0055418D    push        dword ptr fs:[eax]
 00554190    mov         dword ptr fs:[eax],esp
 00554193    lea         eax,[ebp-4]
 00554196    call        @UStrClr
 0055419B    push        eax
 0055419C    lea         ecx,[ebp-14]
 0055419F    mov         edx,esi
 005541A1    mov         eax,ebx
 005541A3    call        TJvCustomAppStorage.ResolvePath
 005541A8    push        dword ptr [ebp+0C]
 005541AB    push        dword ptr [ebp+8]
 005541AE    mov         edx,dword ptr [ebp-4]
 005541B1    mov         eax,dword ptr [ebp-14]
 005541B4    mov         ecx,dword ptr [eax]
 005541B6    call        dword ptr [ecx+0B8];TJvCustomAppStorage.sub_005533E0
 005541BC    fstp        qword ptr [ebp-10]
 005541BF    wait
 005541C0    xor         eax,eax
 005541C2    pop         edx
 005541C3    pop         ecx
 005541C4    pop         ecx
 005541C5    mov         dword ptr fs:[eax],edx
 005541C8    push        5541DD
 005541CD    lea         eax,[ebp-4]
 005541D0    call        @UStrClr
 005541D5    ret
>005541D6    jmp         @HandleFinally
>005541DB    jmp         005541CD
 005541DD    fld         qword ptr [ebp-10]
 005541E0    pop         esi
 005541E1    pop         ebx
 005541E2    mov         esp,ebp
 005541E4    pop         ebp
 005541E5    ret         8
end;*}

//005541E8
{*procedure TJvCustomAppStorage.WriteDateTime(Path:string; Value:TDateTime; ?:?);
begin
 005541E8    push        ebp
 005541E9    mov         ebp,esp
 005541EB    add         esp,0FFFFFFF8
 005541EE    push        ebx
 005541EF    push        esi
 005541F0    xor         ecx,ecx
 005541F2    mov         dword ptr [ebp-4],ecx
 005541F5    mov         esi,edx
 005541F7    mov         ebx,eax
 005541F9    xor         eax,eax
 005541FB    push        ebp
 005541FC    push        554252
 00554201    push        dword ptr fs:[eax]
 00554204    mov         dword ptr fs:[eax],esp
 00554207    lea         eax,[ebp-4]
 0055420A    call        @UStrClr
 0055420F    push        eax
 00554210    lea         ecx,[ebp-8]
 00554213    mov         edx,esi
 00554215    mov         eax,ebx
 00554217    call        TJvCustomAppStorage.ResolvePath
 0055421C    mov         eax,dword ptr [ebp-8]
 0055421F    call        TJvCustomAppMemoryFileStorage.GetReadOnly
 00554224    test        al,al
>00554226    jne         0055423C
 00554228    push        dword ptr [ebp+0C]
 0055422B    push        dword ptr [ebp+8]
 0055422E    mov         edx,dword ptr [ebp-4]
 00554231    mov         eax,dword ptr [ebp-8]
 00554234    mov         ecx,dword ptr [eax]
 00554236    call        dword ptr [ecx+0BC];TJvCustomAppStorage.sub_00553604
 0055423C    xor         eax,eax
 0055423E    pop         edx
 0055423F    pop         ecx
 00554240    pop         ecx
 00554241    mov         dword ptr fs:[eax],edx
 00554244    push        554259
 00554249    lea         eax,[ebp-4]
 0055424C    call        @UStrClr
 00554251    ret
>00554252    jmp         @HandleFinally
>00554257    jmp         00554249
 00554259    pop         esi
 0055425A    pop         ebx
 0055425B    pop         ecx
 0055425C    pop         ecx
 0055425D    pop         ebp
 0055425E    ret         8
end;*}

//00554264
function TJvCustomAppStorage.ReadBoolean(Path:string; Default:Boolean):Boolean;
begin
{*
 00554264    push        ebp
 00554265    mov         ebp,esp
 00554267    add         esp,0FFFFFFF8
 0055426A    push        ebx
 0055426B    push        esi
 0055426C    push        edi
 0055426D    xor         ebx,ebx
 0055426F    mov         dword ptr [ebp-4],ebx
 00554272    mov         ebx,ecx
 00554274    mov         esi,edx
 00554276    mov         edi,eax
 00554278    xor         eax,eax
 0055427A    push        ebp
 0055427B    push        5542C3
 00554280    push        dword ptr fs:[eax]
 00554283    mov         dword ptr fs:[eax],esp
 00554286    lea         eax,[ebp-4]
 00554289    call        @UStrClr
 0055428E    push        eax
 0055428F    lea         ecx,[ebp-8]
 00554292    mov         edx,esi
 00554294    mov         eax,edi
 00554296    call        TJvCustomAppStorage.ResolvePath
 0055429B    mov         ecx,ebx
 0055429D    mov         edx,dword ptr [ebp-4]
 005542A0    mov         eax,dword ptr [ebp-8]
 005542A3    mov         ebx,dword ptr [eax]
 005542A5    call        dword ptr [ebx+0C0];TJvCustomAppStorage.sub_00553698
 005542AB    mov         ebx,eax
 005542AD    xor         eax,eax
 005542AF    pop         edx
 005542B0    pop         ecx
 005542B1    pop         ecx
 005542B2    mov         dword ptr fs:[eax],edx
 005542B5    push        5542CA
 005542BA    lea         eax,[ebp-4]
 005542BD    call        @UStrClr
 005542C2    ret
>005542C3    jmp         @HandleFinally
>005542C8    jmp         005542BA
 005542CA    mov         eax,ebx
 005542CC    pop         edi
 005542CD    pop         esi
 005542CE    pop         ebx
 005542CF    pop         ecx
 005542D0    pop         ecx
 005542D1    pop         ebp
 005542D2    ret
*}
end;

//005542D4
procedure TJvCustomAppStorage.WriteBoolean(Path:string; Value:Boolean);
begin
{*
 005542D4    push        ebp
 005542D5    mov         ebp,esp
 005542D7    add         esp,0FFFFFFF8
 005542DA    push        ebx
 005542DB    push        esi
 005542DC    push        edi
 005542DD    xor         ebx,ebx
 005542DF    mov         dword ptr [ebp-4],ebx
 005542E2    mov         ebx,ecx
 005542E4    mov         esi,edx
 005542E6    mov         edi,eax
 005542E8    xor         eax,eax
 005542EA    push        ebp
 005542EB    push        55433D
 005542F0    push        dword ptr fs:[eax]
 005542F3    mov         dword ptr fs:[eax],esp
 005542F6    lea         eax,[ebp-4]
 005542F9    call        @UStrClr
 005542FE    push        eax
 005542FF    lea         ecx,[ebp-8]
 00554302    mov         edx,esi
 00554304    mov         eax,edi
 00554306    call        TJvCustomAppStorage.ResolvePath
 0055430B    mov         eax,dword ptr [ebp-8]
 0055430E    call        TJvCustomAppMemoryFileStorage.GetReadOnly
 00554313    test        al,al
>00554315    jne         00554327
 00554317    mov         ecx,ebx
 00554319    mov         edx,dword ptr [ebp-4]
 0055431C    mov         eax,dword ptr [ebp-8]
 0055431F    mov         ebx,dword ptr [eax]
 00554321    call        dword ptr [ebx+0C4];TJvCustomAppStorage.sub_00553894
 00554327    xor         eax,eax
 00554329    pop         edx
 0055432A    pop         ecx
 0055432B    pop         ecx
 0055432C    mov         dword ptr fs:[eax],edx
 0055432F    push        554344
 00554334    lea         eax,[ebp-4]
 00554337    call        @UStrClr
 0055433C    ret
>0055433D    jmp         @HandleFinally
>00554342    jmp         00554334
 00554344    pop         edi
 00554345    pop         esi
 00554346    pop         ebx
 00554347    pop         ecx
 00554348    pop         ecx
 00554349    pop         ebp
 0055434A    ret
*}
end;

//0055434C
{*function TJvCustomAppStorage.ReadList(Path:string; List:TObject; ItemName:string; OnReadItem:TJvAppStorageListItemEvent; ?:?):Integer;
begin
 0055434C    push        ebp
 0055434D    mov         ebp,esp
 0055434F    add         esp,0FFFFFFF0
 00554352    push        ebx
 00554353    push        esi
 00554354    mov         dword ptr [ebp-0C],ecx
 00554357    mov         dword ptr [ebp-8],edx
 0055435A    mov         dword ptr [ebp-4],eax
 0055435D    mov         ecx,dword ptr [ebp+8]
 00554360    mov         edx,dword ptr [ebp-8]
 00554363    mov         eax,dword ptr [ebp-4]
 00554366    mov         ebx,dword ptr [eax]
 00554368    call        dword ptr [ebx+0E4];TJvCustomAppStorage.sub_00557218
 0055436E    mov         dword ptr [ebp-10],eax
 00554371    mov         ebx,dword ptr [ebp-10]
 00554374    dec         ebx
 00554375    test        ebx,ebx
>00554377    jl          00554395
 00554379    inc         ebx
 0055437A    xor         esi,esi
 0055437C    mov         eax,dword ptr [ebp-0C]
 0055437F    push        eax
 00554380    push        esi
 00554381    mov         eax,dword ptr [ebp+8]
 00554384    push        eax
 00554385    mov         ecx,dword ptr [ebp-8]
 00554388    mov         edx,dword ptr [ebp-4]
 0055438B    mov         eax,dword ptr [ebp+10]
 0055438E    call        dword ptr [ebp+0C]
 00554391    inc         esi
 00554392    dec         ebx
>00554393    jne         0055437C
 00554395    mov         eax,dword ptr [ebp-10]
 00554398    pop         esi
 00554399    pop         ebx
 0055439A    mov         esp,ebp
 0055439C    pop         ebp
 0055439D    ret         0C
end;*}

//005543A0
{*procedure TJvCustomAppStorage.WriteList(Path:string; List:TObject; ItemName:string; OnDeleteItems:TJvAppStorageListDeleteEvent; ?:?; ?:?; OnWriteItem:TJvAppStorageListItemEvent; ?:?; ItemCount:Integer);
begin
 005543A0    push        ebp
 005543A1    mov         ebp,esp
 005543A3    add         esp,0FFFFFFE4
 005543A6    push        ebx
 005543A7    push        esi
 005543A8    xor         ebx,ebx
 005543AA    mov         dword ptr [ebp-1C],ebx
 005543AD    mov         dword ptr [ebp-4],ebx
 005543B0    mov         dword ptr [ebp-0C],ecx
 005543B3    mov         dword ptr [ebp-8],edx
 005543B6    mov         ebx,eax
 005543B8    xor         eax,eax
 005543BA    push        ebp
 005543BB    push        554495
 005543C0    push        dword ptr fs:[eax]
 005543C3    mov         dword ptr fs:[eax],esp
 005543C6    lea         eax,[ebp-4]
 005543C9    call        @UStrClr
 005543CE    push        eax
 005543CF    lea         eax,[ebp-1C]
 005543D2    mov         ecx,5544B0;'\*'
 005543D7    mov         edx,dword ptr [ebp-8]
 005543DA    call        @UStrCat3
 005543DF    mov         edx,dword ptr [ebp-1C]
 005543E2    lea         ecx,[ebp-10]
 005543E5    mov         eax,ebx
 005543E7    call        TJvCustomAppStorage.ResolvePath
 005543EC    mov         eax,dword ptr [ebp-10]
 005543EF    call        TJvCustomAppMemoryFileStorage.GetReadOnly
 005543F4    test        al,al
>005543F6    jne         00554477
 005543F8    mov         ecx,dword ptr [ebp+8]
 005543FB    mov         edx,dword ptr [ebp-8]
 005543FE    mov         eax,ebx
 00554400    mov         esi,dword ptr [eax]
 00554402    call        dword ptr [esi+0E4];TJvCustomAppStorage.sub_00557218
 00554408    mov         dword ptr [ebp-14],eax
 0055440B    mov         esi,dword ptr [ebp+1C]
 0055440E    dec         esi
 0055440F    test        esi,esi
>00554411    jl          00554438
 00554413    inc         esi
 00554414    mov         dword ptr [ebp-18],0
 0055441B    mov         eax,dword ptr [ebp-0C]
 0055441E    push        eax
 0055441F    mov         eax,dword ptr [ebp-18]
 00554422    push        eax
 00554423    mov         eax,dword ptr [ebp+8]
 00554426    push        eax
 00554427    mov         ecx,dword ptr [ebp-8]
 0055442A    mov         edx,ebx
 0055442C    mov         eax,dword ptr [ebp+18]
 0055442F    call        dword ptr [ebp+14]
 00554432    inc         dword ptr [ebp-18]
 00554435    dec         esi
>00554436    jne         0055441B
 00554438    mov         eax,dword ptr [ebp-14]
 0055443B    cmp         eax,dword ptr [ebp+1C]
>0055443E    jle         00554463
 00554440    cmp         word ptr [ebp+0E],0
>00554445    je          00554463
 00554447    mov         eax,dword ptr [ebp-0C]
 0055444A    push        eax
 0055444B    mov         eax,dword ptr [ebp+1C]
 0055444E    push        eax
 0055444F    mov         eax,dword ptr [ebp-14]
 00554452    dec         eax
 00554453    push        eax
 00554454    mov         eax,dword ptr [ebp+8]
 00554457    push        eax
 00554458    mov         ecx,dword ptr [ebp-8]
 0055445B    mov         edx,ebx
 0055445D    mov         eax,dword ptr [ebp+10]
 00554460    call        dword ptr [ebp+0C]
 00554463    mov         eax,dword ptr [ebp+8]
 00554466    push        eax
 00554467    mov         ecx,dword ptr [ebp+1C]
 0055446A    mov         edx,dword ptr [ebp-8]
 0055446D    mov         eax,ebx
 0055446F    mov         ebx,dword ptr [eax]
 00554471    call        dword ptr [ebx+0E8];TJvCustomAppStorage.sub_00557418
 00554477    xor         eax,eax
 00554479    pop         edx
 0055447A    pop         ecx
 0055447B    pop         ecx
 0055447C    mov         dword ptr fs:[eax],edx
 0055447F    push        55449C
 00554484    lea         eax,[ebp-1C]
 00554487    call        @UStrClr
 0055448C    lea         eax,[ebp-4]
 0055448F    call        @UStrClr
 00554494    ret
>00554495    jmp         @HandleFinally
>0055449A    jmp         00554484
 0055449C    pop         esi
 0055449D    pop         ebx
 0055449E    mov         esp,ebp
 005544A0    pop         ebp
 005544A1    ret         18
end;*}

//005544B8
procedure TJvCustomAppStorage.ReadObjectList(Path:string; List:TList; ItemName:string; ClearFirst:Boolean);
begin
{*
 005544B8    push        ebp
 005544B9    mov         ebp,esp
 005544BB    push        ebx
 005544BC    push        eax
 005544BD    push        551DA8
 005544C2    movzx       ebx,byte ptr [ebp+0C]
 005544C6    push        ebx
 005544C7    mov         ebx,dword ptr [ebp+8]
 005544CA    push        ebx
 005544CB    call        TJvCustomAppStorage.ReadObjectList
 005544D0    pop         ebx
 005544D1    pop         ebp
 005544D2    ret         8
*}
end;

//005544D8
{*function TJvCustomAppStorage.ReadObjectList(Path:string; List:TList; ItemName:string; ClearFirst:Boolean; ItemCreator:TJvAppStorageObjectListItemCreateEvent; ?:?):Integer;
begin
 005544D8    push        ebp
 005544D9    mov         ebp,esp
 005544DB    add         esp,0FFFFFFE4
 005544DE    push        ebx
 005544DF    push        esi
 005544E0    push        edi
 005544E1    xor         ebx,ebx
 005544E3    mov         dword ptr [ebp-1C],ebx
 005544E6    mov         dword ptr [ebp-4],ebx
 005544E9    mov         dword ptr [ebp-8],ecx
 005544EC    mov         esi,edx
 005544EE    mov         ebx,eax
 005544F0    mov         edi,dword ptr [ebp+8]
 005544F3    xor         eax,eax
 005544F5    push        ebp
 005544F6    push        5545E5
 005544FB    push        dword ptr fs:[eax]
 005544FE    mov         dword ptr fs:[eax],esp
 00554501    mov         ecx,edi
 00554503    mov         edx,esi
 00554505    mov         eax,ebx
 00554507    call        TJvCustomAppStorage.ListStored
 0055450C    test        al,al
>0055450E    jne         0055452A
 00554510    mov         eax,dword ptr [ebx+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00554516    cmp         byte ptr [eax+16],0;TJvCustomAppStorageOptions.FDefaultIfValueNotExists:Boolean
>0055451A    je          0055452A
 0055451C    mov         eax,dword ptr [ebp-8]
 0055451F    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 00554522    mov         dword ptr [ebp-0C],eax
>00554525    jmp         005545C7
 0055452A    cmp         byte ptr [ebp+0C],0
>0055452E    je          00554538
 00554530    mov         eax,dword ptr [ebp-8]
 00554533    mov         edx,dword ptr [eax]
 00554535    call        dword ptr [edx+8];TList.Clear
 00554538    lea         eax,[ebp-4]
 0055453B    call        @UStrClr
 00554540    push        eax
 00554541    lea         eax,[ebp-1C]
 00554544    mov         ecx,554604;'\*'
 00554549    mov         edx,esi
 0055454B    call        @UStrCat3
 00554550    mov         edx,dword ptr [ebp-1C]
 00554553    lea         ecx,[ebp-10]
 00554556    mov         eax,ebx
 00554558    call        TJvCustomAppStorage.ResolvePath
 0055455D    mov         eax,dword ptr [ebp-10]
 00554560    mov         edx,dword ptr [eax+138];TJvCustomAppStorage.FCurrentInstanceCreateEvent:TJvAppStorageObj...
 00554566    mov         dword ptr [ebp-18],edx
 00554569    mov         edx,dword ptr [eax+13C];TJvCustomAppStorage.?f13C:dword
 0055456F    mov         dword ptr [ebp-14],edx
 00554572    xor         eax,eax
 00554574    push        ebp
 00554575    push        5545C0
 0055457A    push        dword ptr fs:[eax]
 0055457D    mov         dword ptr fs:[eax],esp
 00554580    push        dword ptr [ebp+14]
 00554583    push        dword ptr [ebp+10]
 00554586    mov         eax,dword ptr [ebp-10]
 00554589    call        005574D4
 0055458E    push        ebx
 0055458F    push        551E5C
 00554594    push        edi
 00554595    mov         ecx,dword ptr [ebp-8]
 00554598    mov         edx,esi
 0055459A    mov         eax,ebx
 0055459C    call        TJvCustomAppStorage.ReadList
 005545A1    mov         dword ptr [ebp-0C],eax
 005545A4    xor         eax,eax
 005545A6    pop         edx
 005545A7    pop         ecx
 005545A8    pop         ecx
 005545A9    mov         dword ptr fs:[eax],edx
 005545AC    push        5545C7
 005545B1    push        dword ptr [ebp-14]
 005545B4    push        dword ptr [ebp-18]
 005545B7    mov         eax,dword ptr [ebp-10]
 005545BA    call        005574D4
 005545BF    ret
>005545C0    jmp         @HandleFinally
>005545C5    jmp         005545B1
 005545C7    xor         eax,eax
 005545C9    pop         edx
 005545CA    pop         ecx
 005545CB    pop         ecx
 005545CC    mov         dword ptr fs:[eax],edx
 005545CF    push        5545EC
 005545D4    lea         eax,[ebp-1C]
 005545D7    call        @UStrClr
 005545DC    lea         eax,[ebp-4]
 005545DF    call        @UStrClr
 005545E4    ret
>005545E5    jmp         @HandleFinally
>005545EA    jmp         005545D4
 005545EC    mov         eax,dword ptr [ebp-0C]
 005545EF    pop         edi
 005545F0    pop         esi
 005545F1    pop         ebx
 005545F2    mov         esp,ebp
 005545F4    pop         ebp
 005545F5    ret         10
end;*}

//0055460C
procedure TJvCustomAppStorage.WriteObjectList(Path:string; List:TList; ItemName:string);
begin
{*
 0055460C    push        ebp
 0055460D    mov         ebp,esp
 0055460F    push        ebx
 00554610    mov         ebx,dword ptr [ecx+8];TList.FCount:Integer
 00554613    push        ebx
 00554614    push        eax
 00554615    push        551F54
 0055461A    push        eax
 0055461B    push        55201C
 00554620    mov         ebx,dword ptr [ebp+8]
 00554623    push        ebx
 00554624    call        TJvCustomAppStorage.WriteList
 00554629    pop         ebx
 0055462A    pop         ebp
 0055462B    ret         4
*}
end;

//00554630
function TJvCustomAppStorage.ReadCollection(Path:string; List:TCollection; ItemName:string; ClearFirst:Boolean):Integer;
begin
{*
 00554630    push        ebp
 00554631    mov         ebp,esp
 00554633    add         esp,0FFFFFFF8
 00554636    push        ebx
 00554637    push        esi
 00554638    push        edi
 00554639    mov         dword ptr [ebp-4],ecx
 0055463C    mov         esi,edx
 0055463E    mov         ebx,eax
 00554640    mov         edi,dword ptr [ebp+8]
 00554643    mov         ecx,edi
 00554645    mov         edx,esi
 00554647    mov         eax,ebx
 00554649    call        TJvCustomAppStorage.ListStored
 0055464E    test        al,al
>00554650    jne         0055466B
 00554652    mov         eax,dword ptr [ebx+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00554658    cmp         byte ptr [eax+16],0;TJvCustomAppStorageOptions.FDefaultIfValueNotExists:Boolean
>0055465C    je          0055466B
 0055465E    mov         eax,dword ptr [ebp-4]
 00554661    call        TCollection.GetCount
 00554666    mov         dword ptr [ebp-8],eax
>00554669    jmp         005546D4
 0055466B    xor         eax,eax
 0055466D    push        ebp
 0055466E    push        5546CD
 00554673    push        dword ptr fs:[eax]
 00554676    mov         dword ptr fs:[eax],esp
 00554679    mov         eax,dword ptr [ebp-4]
 0055467C    mov         edx,dword ptr [eax]
 0055467E    call        dword ptr [edx+20];TCollection.BeginUpdate
 00554681    cmp         byte ptr [ebp+0C],0
>00554685    je          0055468F
 00554687    mov         eax,dword ptr [ebp-4]
 0055468A    call        TCollection.Clear
 0055468F    push        1
 00554691    push        0
 00554693    push        0
 00554695    mov         ecx,dword ptr [ebp-4]
 00554698    mov         edx,esi
 0055469A    mov         eax,ebx
 0055469C    call        TJvCustomAppStorage.ReadPersistent
 005546A1    push        ebx
 005546A2    push        552578
 005546A7    push        edi
 005546A8    mov         ecx,dword ptr [ebp-4]
 005546AB    mov         edx,esi
 005546AD    mov         eax,ebx
 005546AF    call        TJvCustomAppStorage.ReadList
 005546B4    mov         dword ptr [ebp-8],eax
 005546B7    xor         eax,eax
 005546B9    pop         edx
 005546BA    pop         ecx
 005546BB    pop         ecx
 005546BC    mov         dword ptr fs:[eax],edx
 005546BF    push        5546D4
 005546C4    mov         eax,dword ptr [ebp-4]
 005546C7    mov         edx,dword ptr [eax]
 005546C9    call        dword ptr [edx+24];TCollection.EndUpdate
 005546CC    ret
>005546CD    jmp         @HandleFinally
>005546D2    jmp         005546C4
 005546D4    mov         eax,dword ptr [ebp-8]
 005546D7    pop         edi
 005546D8    pop         esi
 005546D9    pop         ebx
 005546DA    pop         ecx
 005546DB    pop         ecx
 005546DC    pop         ebp
 005546DD    ret         8
*}
end;

//005546E0
procedure TJvCustomAppStorage.WriteCollection(Path:string; List:TCollection; ItemName:string);
begin
{*
 005546E0    push        ebp
 005546E1    mov         ebp,esp
 005546E3    push        ebx
 005546E4    push        esi
 005546E5    push        edi
 005546E6    mov         esi,ecx
 005546E8    mov         edi,edx
 005546EA    mov         ebx,eax
 005546EC    mov         eax,esi
 005546EE    call        TCollection.GetCount
 005546F3    push        eax
 005546F4    push        ebx
 005546F5    push        55265C
 005546FA    push        ebx
 005546FB    push        552794
 00554700    mov         eax,dword ptr [ebp+8]
 00554703    push        eax
 00554704    mov         ecx,esi
 00554706    mov         edx,edi
 00554708    mov         eax,ebx
 0055470A    call        TJvCustomAppStorage.WriteList
 0055470F    push        1
 00554711    push        0
 00554713    mov         ecx,esi
 00554715    mov         edx,edi
 00554717    mov         eax,ebx
 00554719    call        TJvCustomAppStorage.WritePersistent
 0055471E    pop         edi
 0055471F    pop         esi
 00554720    pop         ebx
 00554721    pop         ebp
 00554722    ret         4
*}
end;

//00554728
function TJvCustomAppStorage.ReadStringList(Path:string; SL:TStrings; ItemName:string; ClearFirst:Boolean):Integer;
begin
{*
 00554728    push        ebp
 00554729    mov         ebp,esp
 0055472B    add         esp,0FFFFFFF4
 0055472E    push        ebx
 0055472F    push        esi
 00554730    push        edi
 00554731    xor         ebx,ebx
 00554733    mov         dword ptr [ebp-0C],ebx
 00554736    mov         dword ptr [ebp-4],ecx
 00554739    mov         esi,edx
 0055473B    mov         ebx,eax
 0055473D    mov         edi,dword ptr [ebp+8]
 00554740    xor         eax,eax
 00554742    push        ebp
 00554743    push        554810
 00554748    push        dword ptr fs:[eax]
 0055474B    mov         dword ptr fs:[eax],esp
 0055474E    cmp         byte ptr [ebp+0C],0
>00554752    je          0055475C
 00554754    mov         eax,dword ptr [ebp-4]
 00554757    mov         edx,dword ptr [eax]
 00554759    call        dword ptr [edx+44];TStrings.Clear
 0055475C    mov         ecx,edi
 0055475E    mov         edx,esi
 00554760    mov         eax,ebx
 00554762    call        TJvCustomAppStorage.ListStored
 00554767    test        al,al
>00554769    jne         0055479F
 0055476B    mov         edx,esi
 0055476D    mov         eax,ebx
 0055476F    call        TJvCustomAppStorage.ValueStored
 00554774    test        al,al
>00554776    je          00554792
 00554778    lea         eax,[ebp-0C]
 0055477B    push        eax
 0055477C    xor         ecx,ecx
 0055477E    mov         edx,esi
 00554780    mov         eax,ebx
 00554782    call        TJvCustomAppStorage.ReadString
 00554787    mov         edx,dword ptr [ebp-0C]
 0055478A    mov         eax,dword ptr [ebp-4]
 0055478D    mov         ecx,dword ptr [eax]
 0055478F    call        dword ptr [ecx+2C];TStrings.SetTextStr
 00554792    mov         eax,dword ptr [ebp-4]
 00554795    mov         edx,dword ptr [eax]
 00554797    call        dword ptr [edx+14];TStrings.GetCount
 0055479A    mov         dword ptr [ebp-8],eax
>0055479D    jmp         005547FA
 0055479F    mov         eax,dword ptr [ebp-4]
 005547A2    call        TStrings.BeginUpdate
 005547A7    xor         eax,eax
 005547A9    push        ebp
 005547AA    push        5547F3
 005547AF    push        dword ptr fs:[eax]
 005547B2    mov         dword ptr fs:[eax],esp
 005547B5    push        1
 005547B7    push        0
 005547B9    push        0
 005547BB    mov         ecx,dword ptr [ebp-4]
 005547BE    mov         edx,esi
 005547C0    mov         eax,ebx
 005547C2    call        TJvCustomAppStorage.ReadPersistent
 005547C7    push        ebx
 005547C8    push        55190C
 005547CD    push        edi
 005547CE    mov         ecx,dword ptr [ebp-4]
 005547D1    mov         edx,esi
 005547D3    mov         eax,ebx
 005547D5    call        TJvCustomAppStorage.ReadList
 005547DA    mov         dword ptr [ebp-8],eax
 005547DD    xor         eax,eax
 005547DF    pop         edx
 005547E0    pop         ecx
 005547E1    pop         ecx
 005547E2    mov         dword ptr fs:[eax],edx
 005547E5    push        5547FA
 005547EA    mov         eax,dword ptr [ebp-4]
 005547ED    call        TStrings.EndUpdate
 005547F2    ret
>005547F3    jmp         @HandleFinally
>005547F8    jmp         005547EA
 005547FA    xor         eax,eax
 005547FC    pop         edx
 005547FD    pop         ecx
 005547FE    pop         ecx
 005547FF    mov         dword ptr fs:[eax],edx
 00554802    push        554817
 00554807    lea         eax,[ebp-0C]
 0055480A    call        @UStrClr
 0055480F    ret
>00554810    jmp         @HandleFinally
>00554815    jmp         00554807
 00554817    mov         eax,dword ptr [ebp-8]
 0055481A    pop         edi
 0055481B    pop         esi
 0055481C    pop         ebx
 0055481D    mov         esp,ebp
 0055481F    pop         ebp
 00554820    ret         8
*}
end;

//00554824
procedure TJvCustomAppStorage.WriteStringList(Path:string; SL:TStrings; ItemName:string);
begin
{*
 00554824    push        ebp
 00554825    mov         ebp,esp
 00554827    push        0
 00554829    push        ebx
 0055482A    push        esi
 0055482B    push        edi
 0055482C    mov         edi,ecx
 0055482E    mov         esi,edx
 00554830    mov         ebx,eax
 00554832    xor         eax,eax
 00554834    push        ebp
 00554835    push        5548C5
 0055483A    push        dword ptr fs:[eax]
 0055483D    mov         dword ptr fs:[eax],esp
 00554840    mov         eax,dword ptr [ebx+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00554846    cmp         byte ptr [eax+18],0;TJvCustomAppStorageOptions.FStoreStringListAsSingleString:Boolean
>0055484A    je          0055487D
 0055484C    mov         ecx,dword ptr [ebp+8]
 0055484F    mov         edx,esi
 00554851    mov         eax,ebx
 00554853    call        TJvCustomAppStorage.ListStored
 00554858    test        al,al
>0055485A    je          00554865
 0055485C    mov         edx,esi
 0055485E    mov         eax,ebx
 00554860    call        TJvCustomAppStorage.DeleteSubTree
 00554865    lea         edx,[ebp-4]
 00554868    mov         eax,edi
 0055486A    mov         ecx,dword ptr [eax]
 0055486C    call        dword ptr [ecx+1C];TStrings.GetTextStr
 0055486F    mov         ecx,dword ptr [ebp-4]
 00554872    mov         edx,esi
 00554874    mov         eax,ebx
 00554876    call        TJvCustomAppStorage.WriteString
>0055487B    jmp         005548AF
 0055487D    mov         eax,edi
 0055487F    mov         edx,dword ptr [eax]
 00554881    call        dword ptr [edx+14];TStrings.GetCount
 00554884    push        eax
 00554885    push        ebx
 00554886    push        5519CC
 0055488B    push        ebx
 0055488C    push        551A8C
 00554891    mov         eax,dword ptr [ebp+8]
 00554894    push        eax
 00554895    mov         ecx,edi
 00554897    mov         edx,esi
 00554899    mov         eax,ebx
 0055489B    call        TJvCustomAppStorage.WriteList
 005548A0    push        1
 005548A2    push        0
 005548A4    mov         ecx,edi
 005548A6    mov         edx,esi
 005548A8    mov         eax,ebx
 005548AA    call        TJvCustomAppStorage.WritePersistent
 005548AF    xor         eax,eax
 005548B1    pop         edx
 005548B2    pop         ecx
 005548B3    pop         ecx
 005548B4    mov         dword ptr fs:[eax],edx
 005548B7    push        5548CC
 005548BC    lea         eax,[ebp-4]
 005548BF    call        @UStrClr
 005548C4    ret
>005548C5    jmp         @HandleFinally
>005548CA    jmp         005548BC
 005548CC    pop         edi
 005548CD    pop         esi
 005548CE    pop         ebx
 005548CF    pop         ecx
 005548D0    pop         ebp
 005548D1    ret         4
*}
end;

//005548D4
function TJvCustomAppStorage.ReadWideStringList(Path:string; SL:TWideStrings; ItemName:string; ClearFirst:Boolean):Integer;
begin
{*
 005548D4    push        ebp
 005548D5    mov         ebp,esp
 005548D7    add         esp,0FFFFFFF8
 005548DA    push        ebx
 005548DB    push        esi
 005548DC    mov         dword ptr [ebp-4],ecx
 005548DF    mov         esi,edx
 005548E1    mov         ebx,eax
 005548E3    mov         ecx,554994;'Item'
 005548E8    mov         edx,esi
 005548EA    mov         eax,ebx
 005548EC    call        TJvCustomAppStorage.ListStored
 005548F1    test        al,al
>005548F3    jne         0055490E
 005548F5    mov         eax,dword ptr [ebx+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005548FB    cmp         byte ptr [eax+16],0;TJvCustomAppStorageOptions.FDefaultIfValueNotExists:Boolean
>005548FF    je          0055490E
 00554901    mov         eax,dword ptr [ebp-4]
 00554904    mov         edx,dword ptr [eax]
 00554906    call        dword ptr [edx+14];@AbstractError
 00554909    mov         dword ptr [ebp-8],eax
>0055490C    jmp         0055497A
 0055490E    mov         eax,dword ptr [ebp-4]
 00554911    call        TWideStrings.BeginUpdate
 00554916    xor         eax,eax
 00554918    push        ebp
 00554919    push        554973
 0055491E    push        dword ptr fs:[eax]
 00554921    mov         dword ptr fs:[eax],esp
 00554924    cmp         byte ptr [ebp+0C],0
>00554928    je          00554932
 0055492A    mov         eax,dword ptr [ebp-4]
 0055492D    mov         edx,dword ptr [eax]
 0055492F    call        dword ptr [edx+48];@AbstractError
 00554932    push        1
 00554934    push        0
 00554936    push        0
 00554938    mov         ecx,dword ptr [ebp-4]
 0055493B    mov         edx,esi
 0055493D    mov         eax,ebx
 0055493F    call        TJvCustomAppStorage.ReadPersistent
 00554944    push        ebx
 00554945    push        551B4C
 0055494A    mov         eax,dword ptr [ebp+8]
 0055494D    push        eax
 0055494E    mov         ecx,dword ptr [ebp-4]
 00554951    mov         edx,esi
 00554953    mov         eax,ebx
 00554955    call        TJvCustomAppStorage.ReadList
 0055495A    mov         dword ptr [ebp-8],eax
 0055495D    xor         eax,eax
 0055495F    pop         edx
 00554960    pop         ecx
 00554961    pop         ecx
 00554962    mov         dword ptr fs:[eax],edx
 00554965    push        55497A
 0055496A    mov         eax,dword ptr [ebp-4]
 0055496D    call        TWideStrings.EndUpdate
 00554972    ret
>00554973    jmp         @HandleFinally
>00554978    jmp         0055496A
 0055497A    mov         eax,dword ptr [ebp-8]
 0055497D    pop         esi
 0055497E    pop         ebx
 0055497F    pop         ecx
 00554980    pop         ecx
 00554981    pop         ebp
 00554982    ret         8
*}
end;

//005549A0
procedure TJvCustomAppStorage.WriteWideStringList(Path:string; SL:TWideStrings; ItemName:string);
begin
{*
 005549A0    push        ebp
 005549A1    mov         ebp,esp
 005549A3    push        ebx
 005549A4    push        esi
 005549A5    push        edi
 005549A6    mov         esi,ecx
 005549A8    mov         edi,edx
 005549AA    mov         ebx,eax
 005549AC    mov         eax,esi
 005549AE    mov         edx,dword ptr [eax]
 005549B0    call        dword ptr [edx+14];@AbstractError
 005549B3    push        eax
 005549B4    push        ebx
 005549B5    push        551C18
 005549BA    push        ebx
 005549BB    push        551CE8
 005549C0    mov         eax,dword ptr [ebp+8]
 005549C3    push        eax
 005549C4    mov         ecx,esi
 005549C6    mov         edx,edi
 005549C8    mov         eax,ebx
 005549CA    call        TJvCustomAppStorage.WriteList
 005549CF    push        1
 005549D1    push        0
 005549D3    mov         ecx,esi
 005549D5    mov         edx,edi
 005549D7    mov         eax,ebx
 005549D9    call        TJvCustomAppStorage.WritePersistent
 005549DE    pop         edi
 005549DF    pop         esi
 005549E0    pop         ebx
 005549E1    pop         ebp
 005549E2    ret         4
*}
end;

//005549E8
procedure TJvCustomAppStorage.ReadStringObjectList(Path:string; SL:TStrings; ItemName:string; ClearFirst:Boolean);
begin
{*
 005549E8    push        ebp
 005549E9    mov         ebp,esp
 005549EB    push        ebx
 005549EC    push        eax
 005549ED    push        551DA8
 005549F2    movzx       ebx,byte ptr [ebp+0C]
 005549F6    push        ebx
 005549F7    mov         ebx,dword ptr [ebp+8]
 005549FA    push        ebx
 005549FB    call        TJvCustomAppStorage.ReadStringObjectList
 00554A00    pop         ebx
 00554A01    pop         ebp
 00554A02    ret         8
*}
end;

//00554A08
{*function TJvCustomAppStorage.ReadStringObjectList(Path:string; SL:TStrings; ItemName:string; ClearFirst:Boolean; ItemCreator:TJvAppStorageObjectListItemCreateEvent; ?:?):Integer;
begin
 00554A08    push        ebp
 00554A09    mov         ebp,esp
 00554A0B    add         esp,0FFFFFFE4
 00554A0E    push        ebx
 00554A0F    push        esi
 00554A10    push        edi
 00554A11    xor         ebx,ebx
 00554A13    mov         dword ptr [ebp-1C],ebx
 00554A16    mov         dword ptr [ebp-4],ebx
 00554A19    mov         dword ptr [ebp-8],ecx
 00554A1C    mov         esi,edx
 00554A1E    mov         ebx,eax
 00554A20    xor         eax,eax
 00554A22    push        ebp
 00554A23    push        554B7A
 00554A28    push        dword ptr fs:[eax]
 00554A2B    mov         dword ptr fs:[eax],esp
 00554A2E    mov         ecx,dword ptr [ebp+8]
 00554A31    mov         edx,esi
 00554A33    mov         eax,ebx
 00554A35    mov         edi,dword ptr [eax]
 00554A37    call        dword ptr [edi+54];TJvCustomAppStorage.sub_00552CBC
 00554A3A    test        al,al
>00554A3C    jne         00554A5A
 00554A3E    mov         eax,dword ptr [ebx+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00554A44    cmp         byte ptr [eax+16],0;TJvCustomAppStorageOptions.FDefaultIfValueNotExists:Boolean
>00554A48    je          00554A5A
 00554A4A    mov         eax,dword ptr [ebp-8]
 00554A4D    mov         edx,dword ptr [eax]
 00554A4F    call        dword ptr [edx+14];TStrings.GetCount
 00554A52    mov         dword ptr [ebp-0C],eax
>00554A55    jmp         00554B5C
 00554A5A    mov         eax,dword ptr [ebp-8]
 00554A5D    call        TStrings.BeginUpdate
 00554A62    xor         eax,eax
 00554A64    push        ebp
 00554A65    push        554B55
 00554A6A    push        dword ptr fs:[eax]
 00554A6D    mov         dword ptr fs:[eax],esp
 00554A70    lea         eax,[ebp-4]
 00554A73    call        @UStrClr
 00554A78    push        eax
 00554A79    lea         eax,[ebp-1C]
 00554A7C    mov         ecx,554B9C;'\*'
 00554A81    mov         edx,esi
 00554A83    call        @UStrCat3
 00554A88    mov         edx,dword ptr [ebp-1C]
 00554A8B    lea         ecx,[ebp-10]
 00554A8E    mov         eax,ebx
 00554A90    call        TJvCustomAppStorage.ResolvePath
 00554A95    mov         eax,dword ptr [ebp-4]
 00554A98    call        @UStrLen
 00554A9D    mov         edx,eax
 00554A9F    dec         edx
 00554AA0    lea         eax,[ebp-4]
 00554AA3    mov         ecx,2
 00554AA8    call        @UStrDelete
 00554AAD    cmp         byte ptr [ebp+0C],0
>00554AB1    je          00554ABB
 00554AB3    mov         eax,dword ptr [ebp-8]
 00554AB6    mov         edx,dword ptr [eax]
 00554AB8    call        dword ptr [edx+44];TStrings.Clear
 00554ABB    push        1
 00554ABD    push        0
 00554ABF    push        0
 00554AC1    mov         ecx,dword ptr [ebp-8]
 00554AC4    mov         edx,esi
 00554AC6    mov         eax,ebx
 00554AC8    call        TJvCustomAppStorage.ReadPersistent
 00554ACD    mov         eax,dword ptr [ebp-10]
 00554AD0    mov         edx,dword ptr [eax+138];TJvCustomAppStorage.FCurrentInstanceCreateEvent:TJvAppStorageObj...
 00554AD6    mov         dword ptr [ebp-18],edx
 00554AD9    mov         edx,dword ptr [eax+13C];TJvCustomAppStorage.?f13C:dword
 00554ADF    mov         dword ptr [ebp-14],edx
 00554AE2    xor         eax,eax
 00554AE4    push        ebp
 00554AE5    push        554B38
 00554AEA    push        dword ptr fs:[eax]
 00554AED    mov         dword ptr fs:[eax],esp
 00554AF0    push        dword ptr [ebp+14]
 00554AF3    push        dword ptr [ebp+10]
 00554AF6    mov         eax,dword ptr [ebp-10]
 00554AF9    call        005574D4
 00554AFE    mov         eax,dword ptr [ebp-10]
 00554B01    push        eax
 00554B02    push        5520DC
 00554B07    mov         eax,dword ptr [ebp+8]
 00554B0A    push        eax
 00554B0B    mov         ecx,dword ptr [ebp-8]
 00554B0E    mov         edx,dword ptr [ebp-4]
 00554B11    mov         eax,dword ptr [ebp-10]
 00554B14    call        TJvCustomAppStorage.ReadList
 00554B19    mov         dword ptr [ebp-0C],eax
 00554B1C    xor         eax,eax
 00554B1E    pop         edx
 00554B1F    pop         ecx
 00554B20    pop         ecx
 00554B21    mov         dword ptr fs:[eax],edx
 00554B24    push        554B3F
 00554B29    push        dword ptr [ebp-14]
 00554B2C    push        dword ptr [ebp-18]
 00554B2F    mov         eax,dword ptr [ebp-10]
 00554B32    call        005574D4
 00554B37    ret
>00554B38    jmp         @HandleFinally
>00554B3D    jmp         00554B29
 00554B3F    xor         eax,eax
 00554B41    pop         edx
 00554B42    pop         ecx
 00554B43    pop         ecx
 00554B44    mov         dword ptr fs:[eax],edx
 00554B47    push        554B5C
 00554B4C    mov         eax,dword ptr [ebp-8]
 00554B4F    call        TStrings.EndUpdate
 00554B54    ret
>00554B55    jmp         @HandleFinally
>00554B5A    jmp         00554B4C
 00554B5C    xor         eax,eax
 00554B5E    pop         edx
 00554B5F    pop         ecx
 00554B60    pop         ecx
 00554B61    mov         dword ptr fs:[eax],edx
 00554B64    push        554B81
 00554B69    lea         eax,[ebp-1C]
 00554B6C    call        @UStrClr
 00554B71    lea         eax,[ebp-4]
 00554B74    call        @UStrClr
 00554B79    ret
>00554B7A    jmp         @HandleFinally
>00554B7F    jmp         00554B69
 00554B81    mov         eax,dword ptr [ebp-0C]
 00554B84    pop         edi
 00554B85    pop         esi
 00554B86    pop         ebx
 00554B87    mov         esp,ebp
 00554B89    pop         ebp
 00554B8A    ret         10
end;*}

//00554BA4
procedure TJvCustomAppStorage.WriteStringObjectList(Path:string; SL:TStrings; ItemName:string);
begin
{*
 00554BA4    push        ebp
 00554BA5    mov         ebp,esp
 00554BA7    push        0
 00554BA9    push        0
 00554BAB    push        0
 00554BAD    push        ebx
 00554BAE    push        esi
 00554BAF    push        edi
 00554BB0    mov         esi,ecx
 00554BB2    mov         edi,edx
 00554BB4    mov         ebx,eax
 00554BB6    xor         eax,eax
 00554BB8    push        ebp
 00554BB9    push        554C59
 00554BBE    push        dword ptr fs:[eax]
 00554BC1    mov         dword ptr fs:[eax],esp
 00554BC4    lea         eax,[ebp-4]
 00554BC7    call        @UStrClr
 00554BCC    push        eax
 00554BCD    lea         eax,[ebp-0C]
 00554BD0    mov         ecx,554C78;'\*'
 00554BD5    mov         edx,edi
 00554BD7    call        @UStrCat3
 00554BDC    mov         edx,dword ptr [ebp-0C]
 00554BDF    lea         ecx,[ebp-8]
 00554BE2    mov         eax,ebx
 00554BE4    call        TJvCustomAppStorage.ResolvePath
 00554BE9    mov         eax,dword ptr [ebp-4]
 00554BEC    call        @UStrLen
 00554BF1    mov         edx,eax
 00554BF3    dec         edx
 00554BF4    lea         eax,[ebp-4]
 00554BF7    mov         ecx,2
 00554BFC    call        @UStrDelete
 00554C01    mov         eax,esi
 00554C03    mov         edx,dword ptr [eax]
 00554C05    call        dword ptr [edx+14];TStrings.GetCount
 00554C08    push        eax
 00554C09    mov         eax,dword ptr [ebp-8]
 00554C0C    push        eax
 00554C0D    push        5522D8
 00554C12    mov         eax,dword ptr [ebp-8]
 00554C15    push        eax
 00554C16    push        5524B8
 00554C1B    mov         eax,dword ptr [ebp+8]
 00554C1E    push        eax
 00554C1F    mov         ecx,esi
 00554C21    mov         edx,dword ptr [ebp-4]
 00554C24    mov         eax,dword ptr [ebp-8]
 00554C27    call        TJvCustomAppStorage.WriteList
 00554C2C    push        1
 00554C2E    push        0
 00554C30    mov         ecx,esi
 00554C32    mov         edx,edi
 00554C34    mov         eax,ebx
 00554C36    call        TJvCustomAppStorage.WritePersistent
 00554C3B    xor         eax,eax
 00554C3D    pop         edx
 00554C3E    pop         ecx
 00554C3F    pop         ecx
 00554C40    mov         dword ptr fs:[eax],edx
 00554C43    push        554C60
 00554C48    lea         eax,[ebp-0C]
 00554C4B    call        @UStrClr
 00554C50    lea         eax,[ebp-4]
 00554C53    call        @UStrClr
 00554C58    ret
>00554C59    jmp         @HandleFinally
>00554C5E    jmp         00554C48
 00554C60    pop         edi
 00554C61    pop         esi
 00554C62    pop         ebx
 00554C63    mov         esp,ebp
 00554C65    pop         ebp
 00554C66    ret         4
*}
end;

//00554C80
{*procedure sub_00554C80(?:?; ?:?; ?:?; ?:?);
begin
 00554C80    push        ebp
 00554C81    mov         ebp,esp
 00554C83    add         esp,0FFFFFFE0
 00554C86    push        ebx
 00554C87    push        esi
 00554C88    push        edi
 00554C89    xor         ebx,ebx
 00554C8B    mov         dword ptr [ebp-20],ebx
 00554C8E    mov         dword ptr [ebp-4],ebx
 00554C91    mov         dword ptr [ebp-10],ecx
 00554C94    mov         dword ptr [ebp-0C],edx
 00554C97    mov         dword ptr [ebp-8],eax
 00554C9A    xor         eax,eax
 00554C9C    push        ebp
 00554C9D    push        554F3B
 00554CA2    push        dword ptr fs:[eax]
 00554CA5    mov         dword ptr fs:[eax],esp
 00554CA8    mov         edx,dword ptr [ebp-0C]
 00554CAB    mov         eax,dword ptr [ebp-8]
 00554CAE    mov         ecx,dword ptr [eax]
 00554CB0    call        dword ptr [ecx+50];@AbstractError
 00554CB3    test        al,al
>00554CB5    jne         00554CE1
 00554CB7    mov         eax,dword ptr [ebp-8]
 00554CBA    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00554CC0    cmp         byte ptr [eax+16],0;TJvCustomAppStorageOptions.FDefaultIfValueNotExists:Boolean
>00554CC4    je          00554CE1
 00554CC6    mov         eax,dword ptr [ebp-10]
 00554CC9    call        GetTypeData
 00554CCE    movzx       ecx,byte ptr [eax]
 00554CD1    mov         edx,dword ptr [ebp+8]
 00554CD4    mov         eax,dword ptr [ebp+0C]
 00554CD7    call        00550EA8
>00554CDC    jmp         00554F1D
 00554CE1    xor         eax,eax
 00554CE3    mov         dword ptr [ebp-14],eax
 00554CE6    mov         eax,dword ptr [ebp-10]
 00554CE9    call        GetTypeData
 00554CEE    movzx       ecx,byte ptr [eax]
 00554CF1    lea         edx,[ebp-14]
 00554CF4    mov         eax,dword ptr [ebp+0C]
 00554CF7    call        00550EA8
 00554CFC    mov         eax,dword ptr [ebp-10]
 00554CFF    cmp         eax,dword ptr ds:[401000];Boolean
>00554D05    je          00554D27
 00554D07    mov         eax,dword ptr [ebp-10]
 00554D0A    cmp         byte ptr [eax],3
>00554D0D    jne         00554D47
 00554D0F    mov         eax,dword ptr [ebp-10]
 00554D12    call        GetTypeData
 00554D17    mov         eax,dword ptr [eax+9]
 00554D1A    mov         eax,dword ptr [eax]
 00554D1C    call        GetTypeData
 00554D21    cmp         dword ptr [eax+1],0
>00554D25    jge         00554D47
 00554D27    cmp         dword ptr [ebp-14],0
 00554D2B    setne       cl
 00554D2E    mov         edx,dword ptr [ebp-0C]
 00554D31    mov         eax,dword ptr [ebp-8]
 00554D34    mov         ebx,dword ptr [eax]
 00554D36    call        dword ptr [ebx+0C0];TJvCustomAppStorage.sub_00553698
 00554D3C    and         eax,7F
 00554D3F    mov         dword ptr [ebp-14],eax
>00554D42    jmp         00554F07
 00554D47    xor         edx,edx
 00554D49    push        ebp
 00554D4A    push        554EC5
 00554D4F    push        dword ptr fs:[edx]
 00554D52    mov         dword ptr fs:[edx],esp
 00554D55    mov         eax,dword ptr [ebp-10]
 00554D58    movzx       eax,byte ptr [eax]
 00554D5B    mov         edx,eax
 00554D5D    sub         dl,2
>00554D60    je          00554D67
 00554D62    sub         dl,7
>00554D65    jne         00554D80
 00554D67    mov         ecx,dword ptr [ebp-14]
 00554D6A    mov         edx,dword ptr [ebp-0C]
 00554D6D    mov         eax,dword ptr [ebp-8]
 00554D70    mov         ebx,dword ptr [eax]
 00554D72    call        dword ptr [ebx+98];TJvCustomAppStorage.sub_00552EEC
 00554D78    mov         dword ptr [ebp-14],eax
>00554D7B    jmp         00554EBB
 00554D80    cmp         al,1
>00554D82    jne         00554E43
 00554D88    mov         eax,dword ptr [ebp-10]
 00554D8B    call        FindIdentToInt
 00554D90    mov         dword ptr [ebp-18],eax
 00554D93    cmp         dword ptr [ebp-18],0
>00554D97    je          00554E2D
 00554D9D    mov         eax,dword ptr [ebp-8]
 00554DA0    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00554DA6    movzx       edx,byte ptr [eax+15];TJvCustomAppStorageOptions.FDefaultIfReadConvertError:Boolean
 00554DAA    mov         byte ptr [ebp-19],dl
 00554DAD    mov         dl,1
 00554DAF    mov         ecx,dword ptr [eax]
 00554DB1    call        dword ptr [ecx+2C];TJvAppStorageOptions.SetDefaultIfReadConvertError
 00554DB4    xor         eax,eax
 00554DB6    push        ebp
 00554DB7    push        554DF6
 00554DBC    push        dword ptr fs:[eax]
 00554DBF    mov         dword ptr fs:[eax],esp
 00554DC2    lea         eax,[ebp-4]
 00554DC5    push        eax
 00554DC6    xor         ecx,ecx
 00554DC8    mov         edx,dword ptr [ebp-0C]
 00554DCB    mov         eax,dword ptr [ebp-8]
 00554DCE    mov         ebx,dword ptr [eax]
 00554DD0    call        dword ptr [ebx+0A8];TJvCustomAppStorage.sub_00553258
 00554DD6    xor         eax,eax
 00554DD8    pop         edx
 00554DD9    pop         ecx
 00554DDA    pop         ecx
 00554DDB    mov         dword ptr fs:[eax],edx
 00554DDE    push        554DFD
 00554DE3    mov         eax,dword ptr [ebp-8]
 00554DE6    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00554DEC    movzx       edx,byte ptr [ebp-19]
 00554DF0    mov         ecx,dword ptr [eax]
 00554DF2    call        dword ptr [ecx+2C];TJvAppStorageOptions.SetDefaultIfReadConvertError
 00554DF5    ret
>00554DF6    jmp         @HandleFinally
>00554DFB    jmp         00554DE3
 00554DFD    cmp         dword ptr [ebp-4],0
>00554E01    je          00554E14
 00554E03    lea         edx,[ebp-14]
 00554E06    mov         eax,dword ptr [ebp-4]
 00554E09    call        dword ptr [ebp-18]
 00554E0C    test        al,al
>00554E0E    jne         00554EBB
 00554E14    mov         ecx,dword ptr [ebp-14]
 00554E17    mov         edx,dword ptr [ebp-0C]
 00554E1A    mov         eax,dword ptr [ebp-8]
 00554E1D    mov         ebx,dword ptr [eax]
 00554E1F    call        dword ptr [ebx+98];TJvCustomAppStorage.sub_00552EEC
 00554E25    mov         dword ptr [ebp-14],eax
>00554E28    jmp         00554EBB
 00554E2D    mov         ecx,dword ptr [ebp-14]
 00554E30    mov         edx,dword ptr [ebp-0C]
 00554E33    mov         eax,dword ptr [ebp-8]
 00554E36    mov         ebx,dword ptr [eax]
 00554E38    call        dword ptr [ebx+98];TJvCustomAppStorage.sub_00552EEC
 00554E3E    mov         dword ptr [ebp-14],eax
>00554E41    jmp         00554EBB
 00554E43    cmp         al,3
>00554E45    jne         00554EA4
 00554E47    lea         eax,[ebp-20]
 00554E4A    push        eax
 00554E4B    mov         ecx,554F58;' #!@not known@!# '
 00554E50    mov         edx,dword ptr [ebp-0C]
 00554E53    mov         eax,dword ptr [ebp-8]
 00554E56    mov         ebx,dword ptr [eax]
 00554E58    call        dword ptr [ebx+0A8];TJvCustomAppStorage.sub_00553258
 00554E5E    mov         edx,dword ptr [ebp-20]
 00554E61    mov         eax,dword ptr [ebp-10]
 00554E64    call        GetEnumValue
 00554E69    mov         dword ptr [ebp-14],eax
 00554E6C    cmp         dword ptr [ebp-14],0FFFFFFFF
>00554E70    jne         00554EBB
 00554E72    mov         ecx,dword ptr [ebp-14]
 00554E75    mov         edx,dword ptr [ebp-0C]
 00554E78    mov         eax,dword ptr [ebp-8]
 00554E7B    mov         ebx,dword ptr [eax]
 00554E7D    call        dword ptr [ebx+98];TJvCustomAppStorage.sub_00552EEC
 00554E83    mov         dword ptr [ebp-14],eax
 00554E86    cmp         dword ptr [ebp-14],0FFFFFFFF
>00554E8A    jne         00554EBB
 00554E8C    mov         eax,dword ptr [ebp-10]
 00554E8F    call        GetTypeData
 00554E94    movzx       ecx,byte ptr [eax]
 00554E97    lea         edx,[ebp-14]
 00554E9A    mov         eax,dword ptr [ebp+0C]
 00554E9D    call        00550EA8
>00554EA2    jmp         00554EBB
 00554EA4    mov         ecx,dword ptr ds:[78CFF0];^SResString319:TResStringRec
 00554EAA    mov         dl,1
 00554EAC    mov         eax,[0054D11C];EJVCLAppStorageError
 00554EB1    call        Exception.CreateRes;EJVCLAppStorageError.Create
 00554EB6    call        @RaiseExcept
 00554EBB    xor         eax,eax
 00554EBD    pop         edx
 00554EBE    pop         ecx
 00554EBF    pop         ecx
 00554EC0    mov         dword ptr fs:[eax],edx
>00554EC3    jmp         00554F07
>00554EC5    jmp         @HandleOnException
 00554ECA    dd          1
 00554ECE    dd          0041A0BC;EConvertError
 00554ED2    dd          00554ED6
 00554ED6    mov         eax,dword ptr [ebp-8]
 00554ED9    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00554EDF    cmp         byte ptr [eax+15],0;TJvCustomAppStorageOptions.FDefaultIfReadConvertError:Boolean
>00554EE3    je          00554EFD
 00554EE5    mov         eax,dword ptr [ebp-10]
 00554EE8    call        GetTypeData
 00554EED    movzx       ecx,byte ptr [eax]
 00554EF0    lea         edx,[ebp-14]
 00554EF3    mov         eax,dword ptr [ebp+0C]
 00554EF6    call        00550EA8
>00554EFB    jmp         00554F02
 00554EFD    call        @RaiseAgain
 00554F02    call        @DoneExcept
 00554F07    mov         eax,dword ptr [ebp-10]
 00554F0A    call        GetTypeData
 00554F0F    movzx       ecx,byte ptr [eax]
 00554F12    mov         edx,dword ptr [ebp+8]
 00554F15    lea         eax,[ebp-14]
 00554F18    call        00550EA8
 00554F1D    xor         eax,eax
 00554F1F    pop         edx
 00554F20    pop         ecx
 00554F21    pop         ecx
 00554F22    mov         dword ptr fs:[eax],edx
 00554F25    push        554F42
 00554F2A    lea         eax,[ebp-20]
 00554F2D    call        @UStrClr
 00554F32    lea         eax,[ebp-4]
 00554F35    call        @UStrClr
 00554F3A    ret
>00554F3B    jmp         @HandleFinally
>00554F40    jmp         00554F2A
 00554F42    pop         edi
 00554F43    pop         esi
 00554F44    pop         ebx
 00554F45    mov         esp,ebp
 00554F47    pop         ebp
 00554F48    ret         8
end;*}

//00554F7C
{*procedure sub_00554F7C(?:?; ?:?; ?:?);
begin
 00554F7C    push        ebp
 00554F7D    mov         ebp,esp
 00554F7F    add         esp,0FFFFFFF0
 00554F82    push        ebx
 00554F83    push        esi
 00554F84    push        edi
 00554F85    xor         ebx,ebx
 00554F87    mov         dword ptr [ebp-10],ebx
 00554F8A    mov         dword ptr [ebp-4],ebx
 00554F8D    mov         ebx,ecx
 00554F8F    mov         dword ptr [ebp-8],edx
 00554F92    mov         esi,eax
 00554F94    mov         edi,dword ptr [ebp+8]
 00554F97    xor         eax,eax
 00554F99    push        ebp
 00554F9A    push        55516B
 00554F9F    push        dword ptr fs:[eax]
 00554FA2    mov         dword ptr fs:[eax],esp
 00554FA5    cmp         ebx,dword ptr ds:[401000];Boolean
>00554FAB    jne         00554FC2
 00554FAD    movzx       ecx,byte ptr [edi]
 00554FB0    mov         edx,dword ptr [ebp-8]
 00554FB3    mov         eax,esi
 00554FB5    mov         ebx,dword ptr [eax]
 00554FB7    call        dword ptr [ebx+0C4];TJvCustomAppStorage.sub_00553894
>00554FBD    jmp         0055514D
 00554FC2    cmp         byte ptr [ebx],3
>00554FC5    jne         00555006
 00554FC7    mov         eax,ebx
 00554FC9    call        GetTypeData
 00554FCE    mov         eax,dword ptr [eax+9]
 00554FD1    mov         eax,dword ptr [eax]
 00554FD3    call        GetTypeData
 00554FD8    cmp         dword ptr [eax+1],0
>00554FDC    jge         00555006
 00554FDE    mov         eax,ebx
 00554FE0    call        GetTypeData
 00554FE5    movzx       edx,byte ptr [eax]
 00554FE8    mov         eax,edi
 00554FEA    call        00550ED4
 00554FEF    test        eax,eax
 00554FF1    setne       cl
 00554FF4    mov         edx,dword ptr [ebp-8]
 00554FF7    mov         eax,esi
 00554FF9    mov         ebx,dword ptr [eax]
 00554FFB    call        dword ptr [ebx+0C4];TJvCustomAppStorage.sub_00553894
>00555001    jmp         0055514D
 00555006    movzx       eax,byte ptr [ebx]
 00555009    mov         edx,eax
 0055500B    sub         dl,2
>0055500E    je          00555015
 00555010    sub         dl,7
>00555013    jne         0055503A
 00555015    mov         eax,ebx
 00555017    call        GetTypeData
 0055501C    movzx       edx,byte ptr [eax]
 0055501F    mov         eax,edi
 00555021    call        00550ED4
 00555026    mov         ecx,eax
 00555028    mov         edx,dword ptr [ebp-8]
 0055502B    mov         eax,esi
 0055502D    mov         ebx,dword ptr [eax]
 0055502F    call        dword ptr [ebx+9C];TJvCustomAppStorage.sub_00552F80
>00555035    jmp         0055514D
 0055503A    cmp         al,1
>0055503C    jne         005550D5
 00555042    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00555048    cmp         byte ptr [eax+11],0;TJvCustomAppStorageOptions.FIntAsStr:Boolean
>0055504C    je          005550B3
 0055504E    mov         eax,ebx
 00555050    call        FindIntToIdent
 00555055    mov         dword ptr [ebp-0C],eax
 00555058    cmp         dword ptr [ebp-0C],0
>0055505C    je          0055508E
 0055505E    mov         eax,ebx
 00555060    call        GetTypeData
 00555065    movzx       edx,byte ptr [eax]
 00555068    mov         eax,edi
 0055506A    call        00550ED4
 0055506F    lea         edx,[ebp-4]
 00555072    call        dword ptr [ebp-0C]
 00555075    test        al,al
>00555077    je          0055508E
 00555079    mov         ecx,dword ptr [ebp-4]
 0055507C    mov         edx,dword ptr [ebp-8]
 0055507F    mov         eax,esi
 00555081    mov         ebx,dword ptr [eax]
 00555083    call        dword ptr [ebx+0AC];TJvCustomAppStorage.sub_00553350
>00555089    jmp         0055514D
 0055508E    mov         eax,ebx
 00555090    call        GetTypeData
 00555095    movzx       edx,byte ptr [eax]
 00555098    mov         eax,edi
 0055509A    call        00550ED4
 0055509F    mov         ecx,eax
 005550A1    mov         edx,dword ptr [ebp-8]
 005550A4    mov         eax,esi
 005550A6    mov         ebx,dword ptr [eax]
 005550A8    call        dword ptr [ebx+9C];TJvCustomAppStorage.sub_00552F80
>005550AE    jmp         0055514D
 005550B3    mov         eax,ebx
 005550B5    call        GetTypeData
 005550BA    movzx       edx,byte ptr [eax]
 005550BD    mov         eax,edi
 005550BF    call        00550ED4
 005550C4    mov         ecx,eax
 005550C6    mov         edx,dword ptr [ebp-8]
 005550C9    mov         eax,esi
 005550CB    mov         ebx,dword ptr [eax]
 005550CD    call        dword ptr [ebx+9C];TJvCustomAppStorage.sub_00552F80
>005550D3    jmp         0055514D
 005550D5    cmp         al,3
>005550D7    jne         00555136
 005550D9    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005550DF    cmp         byte ptr [eax+10],0;TJvCustomAppStorageOptions.FEnumAsStr:Boolean
>005550E3    je          00555114
 005550E5    mov         eax,ebx
 005550E7    call        GetTypeData
 005550EC    movzx       edx,byte ptr [eax]
 005550EF    mov         eax,edi
 005550F1    call        00550ED4
 005550F6    mov         edx,eax
 005550F8    lea         ecx,[ebp-10]
 005550FB    mov         eax,ebx
 005550FD    call        GetEnumName
 00555102    mov         ecx,dword ptr [ebp-10]
 00555105    mov         edx,dword ptr [ebp-8]
 00555108    mov         eax,esi
 0055510A    mov         ebx,dword ptr [eax]
 0055510C    call        dword ptr [ebx+0AC];TJvCustomAppStorage.sub_00553350
>00555112    jmp         0055514D
 00555114    mov         eax,ebx
 00555116    call        GetTypeData
 0055511B    movzx       edx,byte ptr [eax]
 0055511E    mov         eax,edi
 00555120    call        00550ED4
 00555125    mov         ecx,eax
 00555127    mov         edx,dword ptr [ebp-8]
 0055512A    mov         eax,esi
 0055512C    mov         ebx,dword ptr [eax]
 0055512E    call        dword ptr [ebx+9C];TJvCustomAppStorage.sub_00552F80
>00555134    jmp         0055514D
 00555136    mov         ecx,dword ptr ds:[78CFF0];^SResString319:TResStringRec
 0055513C    mov         dl,1
 0055513E    mov         eax,[0054D11C];EJVCLAppStorageError
 00555143    call        Exception.CreateRes;EJVCLAppStorageError.Create
 00555148    call        @RaiseExcept
 0055514D    xor         eax,eax
 0055514F    pop         edx
 00555150    pop         ecx
 00555151    pop         ecx
 00555152    mov         dword ptr fs:[eax],edx
 00555155    push        555172
 0055515A    lea         eax,[ebp-10]
 0055515D    call        @UStrClr
 00555162    lea         eax,[ebp-4]
 00555165    call        @UStrClr
 0055516A    ret
>0055516B    jmp         @HandleFinally
>00555170    jmp         0055515A
 00555172    pop         edi
 00555173    pop         esi
 00555174    pop         ebx
 00555175    mov         esp,ebp
 00555177    pop         ebp
 00555178    ret         4
end;*}

//0055517C
{*procedure TJvCustomAppStorage.ReadEnumeration(Path:string; TypeInfo:PTypeInfo; Value:?; Default:?);
begin
 0055517C    push        ebp
 0055517D    mov         ebp,esp
 0055517F    add         esp,0FFFFFFF8
 00555182    push        ebx
 00555183    push        esi
 00555184    push        edi
 00555185    xor         ebx,ebx
 00555187    mov         dword ptr [ebp-4],ebx
 0055518A    mov         edi,ecx
 0055518C    mov         esi,edx
 0055518E    mov         ebx,eax
 00555190    xor         eax,eax
 00555192    push        ebp
 00555193    push        5551E1
 00555198    push        dword ptr fs:[eax]
 0055519B    mov         dword ptr fs:[eax],esp
 0055519E    lea         eax,[ebp-4]
 005551A1    call        @UStrClr
 005551A6    push        eax
 005551A7    lea         ecx,[ebp-8]
 005551AA    mov         edx,esi
 005551AC    mov         eax,ebx
 005551AE    call        TJvCustomAppStorage.ResolvePath
 005551B3    mov         eax,dword ptr [ebp+0C]
 005551B6    push        eax
 005551B7    mov         eax,dword ptr [ebp+8]
 005551BA    push        eax
 005551BB    mov         ecx,edi
 005551BD    mov         edx,dword ptr [ebp-4]
 005551C0    mov         eax,dword ptr [ebp-8]
 005551C3    mov         ebx,dword ptr [eax]
 005551C5    call        dword ptr [ebx+0C8];TJvCustomAppStorage.sub_00554C80
 005551CB    xor         eax,eax
 005551CD    pop         edx
 005551CE    pop         ecx
 005551CF    pop         ecx
 005551D0    mov         dword ptr fs:[eax],edx
 005551D3    push        5551E8
 005551D8    lea         eax,[ebp-4]
 005551DB    call        @UStrClr
 005551E0    ret
>005551E1    jmp         @HandleFinally
>005551E6    jmp         005551D8
 005551E8    pop         edi
 005551E9    pop         esi
 005551EA    pop         ebx
 005551EB    pop         ecx
 005551EC    pop         ecx
 005551ED    pop         ebp
 005551EE    ret         8
end;*}

//005551F4
{*procedure TJvCustomAppStorage.WriteEnumeration(Path:string; TypeInfo:PTypeInfo; Value:?);
begin
 005551F4    push        ebp
 005551F5    mov         ebp,esp
 005551F7    add         esp,0FFFFFFF8
 005551FA    push        ebx
 005551FB    push        esi
 005551FC    push        edi
 005551FD    xor         ebx,ebx
 005551FF    mov         dword ptr [ebp-4],ebx
 00555202    mov         edi,ecx
 00555204    mov         esi,edx
 00555206    mov         ebx,eax
 00555208    xor         eax,eax
 0055520A    push        ebp
 0055520B    push        555261
 00555210    push        dword ptr fs:[eax]
 00555213    mov         dword ptr fs:[eax],esp
 00555216    lea         eax,[ebp-4]
 00555219    call        @UStrClr
 0055521E    push        eax
 0055521F    lea         ecx,[ebp-8]
 00555222    mov         edx,esi
 00555224    mov         eax,ebx
 00555226    call        TJvCustomAppStorage.ResolvePath
 0055522B    mov         eax,dword ptr [ebp-8]
 0055522E    call        TJvCustomAppMemoryFileStorage.GetReadOnly
 00555233    test        al,al
>00555235    jne         0055524B
 00555237    mov         eax,dword ptr [ebp+8]
 0055523A    push        eax
 0055523B    mov         ecx,edi
 0055523D    mov         edx,dword ptr [ebp-4]
 00555240    mov         eax,dword ptr [ebp-8]
 00555243    mov         ebx,dword ptr [eax]
 00555245    call        dword ptr [ebx+0CC];TJvCustomAppStorage.sub_00554F7C
 0055524B    xor         eax,eax
 0055524D    pop         edx
 0055524E    pop         ecx
 0055524F    pop         ecx
 00555250    mov         dword ptr fs:[eax],edx
 00555253    push        555268
 00555258    lea         eax,[ebp-4]
 0055525B    call        @UStrClr
 00555260    ret
>00555261    jmp         @HandleFinally
>00555266    jmp         00555258
 00555268    pop         edi
 00555269    pop         esi
 0055526A    pop         ebx
 0055526B    pop         ecx
 0055526C    pop         ecx
 0055526D    pop         ebp
 0055526E    ret         4
end;*}

//00555274
{*procedure sub_00555274(?:?; ?:?; ?:?; ?:?);
begin
 00555274    push        ebp
 00555275    mov         ebp,esp
 00555277    push        ecx
 00555278    mov         ecx,0D
 0055527D    push        0
 0055527F    push        0
 00555281    dec         ecx
>00555282    jne         0055527D
 00555284    push        ecx
 00555285    xchg        ecx,dword ptr [ebp-4]
 00555288    push        ebx
 00555289    push        esi
 0055528A    push        edi
 0055528B    mov         dword ptr [ebp-10],ecx
 0055528E    mov         dword ptr [ebp-0C],edx
 00555291    mov         ebx,eax
 00555293    xor         eax,eax
 00555295    push        ebp
 00555296    push        55562E
 0055529B    push        dword ptr fs:[eax]
 0055529E    mov         dword ptr fs:[eax],esp
 005552A1    mov         cl,1
 005552A3    mov         edx,dword ptr [ebp-0C]
 005552A6    mov         eax,ebx
 005552A8    call        TJvCustomAppStorage.IsFolder
 005552AD    test        al,al
>005552AF    je          0055555C
 005552B5    mov         dl,1
 005552B7    mov         eax,[0043C7BC];TStringList
 005552BC    call        TStringList.Create;TStringList.Create
 005552C1    mov         dword ptr [ebp-14],eax
 005552C4    xor         eax,eax
 005552C6    push        ebp
 005552C7    push        555555
 005552CC    push        dword ptr fs:[eax]
 005552CF    mov         dword ptr fs:[eax],esp
 005552D2    lea         edx,[ebp-24]
 005552D5    mov         eax,dword ptr [ebp-10]
 005552D8    call        0054BBB0
 005552DD    mov         edx,dword ptr [ebp-24]
 005552E0    lea         eax,[ebp-20]
 005552E3    mov         ecx,555644;['{7DAD5224-46EA-11D5-B0C0-4854E825F345}']
 005552E8    call        @IntfCast
 005552ED    mov         eax,dword ptr [ebp-20]
 005552F0    lea         edx,[ebp-1C]
 005552F3    mov         ecx,dword ptr [eax]
 005552F5    call        dword ptr [ecx+28]
 005552F8    mov         edx,dword ptr [ebp-1C]
 005552FB    lea         eax,[ebp-4]
 005552FE    mov         ecx,555654;['{7DAD5222-46EA-11D5-B0C0-4854E825F345}']
 00555303    call        @IntfCast
 00555308    mov         eax,dword ptr [ebp-4]
 0055530B    mov         edx,dword ptr [eax]
 0055530D    call        dword ptr [edx+20]
 00555310    dec         al
>00555312    je          00555487
 00555318    dec         al
>0055531A    je          00555403
 00555320    dec         al
>00555322    jne         00555528
 00555328    lea         edx,[ebp-30]
 0055532B    mov         eax,dword ptr [ebp-10]
 0055532E    call        0054BBB0
 00555333    mov         edx,dword ptr [ebp-30]
 00555336    lea         eax,[ebp-2C]
 00555339    mov         ecx,555644;['{7DAD5224-46EA-11D5-B0C0-4854E825F345}']
 0055533E    call        @IntfCast
 00555343    mov         eax,dword ptr [ebp-2C]
 00555346    lea         edx,[ebp-28]
 00555349    mov         ecx,dword ptr [eax]
 0055534B    call        dword ptr [ecx+28]
 0055534E    mov         edx,dword ptr [ebp-28]
 00555351    lea         eax,[ebp-8]
 00555354    mov         ecx,555664;['{7DAD5223-46EA-11D5-B0C0-4854E825F345}']
 00555359    call        @IntfCast
 0055535E    mov         eax,dword ptr [ebp-8]
 00555361    mov         edx,dword ptr [eax]
 00555363    call        dword ptr [edx+28]
 00555366    mov         esi,eax
 00555368    mov         eax,dword ptr [ebp-8]
 0055536B    mov         edx,dword ptr [eax]
 0055536D    call        dword ptr [edx+2C]
 00555370    sub         eax,esi
>00555372    jl          005553D5
 00555374    inc         eax
 00555375    mov         dword ptr [ebp-18],eax
 00555378    lea         eax,[ebp-34]
 0055537B    push        eax
 0055537C    mov         eax,dword ptr [ebp-0C]
 0055537F    mov         dword ptr [ebp-3C],eax
 00555382    lea         ecx,[ebp-40]
 00555385    mov         edx,esi
 00555387    mov         eax,dword ptr [ebp-8]
 0055538A    mov         edi,dword ptr [eax]
 0055538C    call        dword ptr [edi+34]
 0055538F    mov         eax,dword ptr [ebp-40]
 00555392    mov         dword ptr [ebp-38],eax
 00555395    lea         edx,[ebp-3C]
 00555398    mov         eax,dword ptr [ebx]
 0055539A    mov         ecx,1
 0055539F    call        TJvCustomAppStorage.ConcatPaths
 005553A4    mov         edx,dword ptr [ebp-34]
 005553A7    xor         ecx,ecx
 005553A9    mov         eax,ebx
 005553AB    mov         edi,dword ptr [eax]
 005553AD    call        dword ptr [edi+0C0];TJvCustomAppStorage.sub_00553698
 005553B3    test        al,al
>005553B5    je          005553CF
 005553B7    lea         ecx,[ebp-44]
 005553BA    mov         edx,esi
 005553BC    mov         eax,dword ptr [ebp-8]
 005553BF    mov         edi,dword ptr [eax]
 005553C1    call        dword ptr [edi+34]
 005553C4    mov         edx,dword ptr [ebp-44]
 005553C7    mov         eax,dword ptr [ebp-14]
 005553CA    mov         ecx,dword ptr [eax]
 005553CC    call        dword ptr [ecx+38];TStringList.Add
 005553CF    inc         esi
 005553D0    dec         dword ptr [ebp-18]
>005553D3    jne         00555378
 005553D5    lea         edx,[ebp-4C]
 005553D8    mov         eax,dword ptr [ebp-10]
 005553DB    call        0054BBB0
 005553E0    mov         edx,dword ptr [ebp-4C]
 005553E3    lea         eax,[ebp-48]
 005553E6    mov         ecx,555644;['{7DAD5224-46EA-11D5-B0C0-4854E825F345}']
 005553EB    call        @IntfCast
 005553F0    mov         eax,dword ptr [ebp-48]
 005553F3    mov         edx,dword ptr [ebp+8]
 005553F6    mov         ecx,dword ptr [ebp-14]
 005553F9    mov         ebx,dword ptr [eax]
 005553FB    call        dword ptr [ebx+30]
>005553FE    jmp         0055553F
 00555403    mov         edx,dword ptr [ebp+8]
 00555406    xor         ecx,ecx
 00555408    mov         eax,dword ptr [ebp-10]
 0055540B    call        0054C238
 00555410    mov         eax,dword ptr [ebp-4]
 00555413    mov         edx,dword ptr [eax]
 00555415    call        dword ptr [edx+28]
 00555418    mov         esi,eax
 0055541A    mov         eax,dword ptr [ebp-4]
 0055541D    mov         edx,dword ptr [eax]
 0055541F    call        dword ptr [edx+2C]
 00555422    sub         eax,esi
>00555424    jl          0055553F
 0055542A    inc         eax
 0055542B    mov         dword ptr [ebp-18],eax
 0055542E    lea         eax,[ebp-50]
 00555431    push        eax
 00555432    mov         eax,dword ptr [ebp-0C]
 00555435    mov         dword ptr [ebp-3C],eax
 00555438    lea         ecx,[ebp-54]
 0055543B    mov         edx,esi
 0055543D    mov         eax,ebx
 0055543F    mov         edi,dword ptr [eax]
 00555441    call        dword ptr [edi+0FC];TJvCustomAppStorage.GetCharName
 00555447    mov         eax,dword ptr [ebp-54]
 0055544A    mov         dword ptr [ebp-38],eax
 0055544D    lea         edx,[ebp-3C]
 00555450    mov         eax,dword ptr [ebx]
 00555452    mov         ecx,1
 00555457    call        TJvCustomAppStorage.ConcatPaths
 0055545C    mov         edx,dword ptr [ebp-50]
 0055545F    xor         ecx,ecx
 00555461    mov         eax,ebx
 00555463    mov         edi,dword ptr [eax]
 00555465    call        dword ptr [edi+0C0];TJvCustomAppStorage.sub_00553698
 0055546B    test        al,al
>0055546D    je          0055547C
 0055546F    mov         eax,dword ptr [ebp+8]
 00555472    mov         edx,esi
 00555474    cmp         edx,1F
>00555477    ja          0055547C
 00555479    bts         dword ptr [eax],edx
 0055547C    inc         esi
 0055547D    dec         dword ptr [ebp-18]
>00555480    jne         0055542E
>00555482    jmp         0055553F
 00555487    mov         eax,dword ptr [ebp-4]
 0055548A    mov         edx,dword ptr [eax]
 0055548C    call        dword ptr [edx+28]
 0055548F    mov         esi,eax
 00555491    mov         eax,dword ptr [ebp-4]
 00555494    mov         edx,dword ptr [eax]
 00555496    call        dword ptr [edx+2C]
 00555499    sub         eax,esi
>0055549B    jl          005554FD
 0055549D    inc         eax
 0055549E    mov         dword ptr [ebp-18],eax
 005554A1    lea         eax,[ebp-58]
 005554A4    push        eax
 005554A5    mov         eax,dword ptr [ebp-0C]
 005554A8    mov         dword ptr [ebp-3C],eax
 005554AB    lea         ecx,[ebp-5C]
 005554AE    mov         edx,esi
 005554B0    mov         eax,ebx
 005554B2    mov         edi,dword ptr [eax]
 005554B4    call        dword ptr [edi+100];TJvCustomAppStorage.GetIntName
 005554BA    mov         eax,dword ptr [ebp-5C]
 005554BD    mov         dword ptr [ebp-38],eax
 005554C0    lea         edx,[ebp-3C]
 005554C3    mov         eax,dword ptr [ebx]
 005554C5    mov         ecx,1
 005554CA    call        TJvCustomAppStorage.ConcatPaths
 005554CF    mov         edx,dword ptr [ebp-58]
 005554D2    xor         ecx,ecx
 005554D4    mov         eax,ebx
 005554D6    mov         edi,dword ptr [eax]
 005554D8    call        dword ptr [edi+0C0];TJvCustomAppStorage.sub_00553698
 005554DE    test        al,al
>005554E0    je          005554F7
 005554E2    lea         edx,[ebp-60]
 005554E5    mov         eax,esi
 005554E7    call        IntToStr
 005554EC    mov         edx,dword ptr [ebp-60]
 005554EF    mov         eax,dword ptr [ebp-14]
 005554F2    mov         ecx,dword ptr [eax]
 005554F4    call        dword ptr [ecx+38];TStringList.Add
 005554F7    inc         esi
 005554F8    dec         dword ptr [ebp-18]
>005554FB    jne         005554A1
 005554FD    lea         edx,[ebp-68]
 00555500    mov         eax,dword ptr [ebp-10]
 00555503    call        0054BBB0
 00555508    mov         edx,dword ptr [ebp-68]
 0055550B    lea         eax,[ebp-64]
 0055550E    mov         ecx,555644;['{7DAD5224-46EA-11D5-B0C0-4854E825F345}']
 00555513    call        @IntfCast
 00555518    mov         eax,dword ptr [ebp-64]
 0055551B    mov         edx,dword ptr [ebp+8]
 0055551E    mov         ecx,dword ptr [ebp-14]
 00555521    mov         ebx,dword ptr [eax]
 00555523    call        dword ptr [ebx+30]
>00555526    jmp         0055553F
 00555528    mov         ecx,dword ptr ds:[78DA80];^SResString320:TResStringRec
 0055552E    mov         dl,1
 00555530    mov         eax,[0054D11C];EJVCLAppStorageError
 00555535    call        Exception.CreateRes;EJVCLAppStorageError.Create
 0055553A    call        @RaiseExcept
 0055553F    xor         eax,eax
 00555541    pop         edx
 00555542    pop         ecx
 00555543    pop         ecx
 00555544    mov         dword ptr fs:[eax],edx
 00555547    push        555591
 0055554C    lea         eax,[ebp-14]
 0055554F    call        FreeAndNil
 00555554    ret
>00555555    jmp         @HandleFinally
>0055555A    jmp         0055554C
 0055555C    lea         eax,[ebp-6C]
 0055555F    push        eax
 00555560    push        0
 00555562    lea         eax,[ebp-70]
 00555565    push        eax
 00555566    mov         edx,dword ptr [ebp+0C]
 00555569    mov         cl,1
 0055556B    mov         eax,dword ptr [ebp-10]
 0055556E    call        0054C1D0
 00555573    mov         ecx,dword ptr [ebp-70]
 00555576    mov         edx,dword ptr [ebp-0C]
 00555579    mov         eax,ebx
 0055557B    mov         ebx,dword ptr [eax]
 0055557D    call        dword ptr [ebx+0A8];TJvCustomAppStorage.sub_00553258
 00555583    mov         ecx,dword ptr [ebp-6C]
 00555586    mov         edx,dword ptr [ebp+8]
 00555589    mov         eax,dword ptr [ebp-10]
 0055558C    call        0054C238
 00555591    xor         eax,eax
 00555593    pop         edx
 00555594    pop         ecx
 00555595    pop         ecx
 00555596    mov         dword ptr fs:[eax],edx
 00555599    push        555638
 0055559E    lea         eax,[ebp-70]
 005555A1    mov         edx,2
 005555A6    call        @UStrArrayClr
 005555AB    lea         eax,[ebp-68]
 005555AE    call        @IntfClear
 005555B3    lea         eax,[ebp-64]
 005555B6    call        @IntfClear
 005555BB    lea         eax,[ebp-60]
 005555BE    mov         edx,5
 005555C3    call        @UStrArrayClr
 005555C8    lea         eax,[ebp-4C]
 005555CB    call        @IntfClear
 005555D0    lea         eax,[ebp-48]
 005555D3    call        @IntfClear
 005555D8    lea         eax,[ebp-44]
 005555DB    mov         edx,2
 005555E0    call        @UStrArrayClr
 005555E5    lea         eax,[ebp-34]
 005555E8    call        @UStrClr
 005555ED    lea         eax,[ebp-30]
 005555F0    call        @IntfClear
 005555F5    lea         eax,[ebp-2C]
 005555F8    call        @IntfClear
 005555FD    lea         eax,[ebp-28]
 00555600    call        @IntfClear
 00555605    lea         eax,[ebp-24]
 00555608    call        @IntfClear
 0055560D    lea         eax,[ebp-20]
 00555610    call        @IntfClear
 00555615    lea         eax,[ebp-1C]
 00555618    call        @IntfClear
 0055561D    lea         eax,[ebp-8]
 00555620    call        @IntfClear
 00555625    lea         eax,[ebp-4]
 00555628    call        @IntfClear
 0055562D    ret
>0055562E    jmp         @HandleFinally
>00555633    jmp         0055559E
 00555638    pop         edi
 00555639    pop         esi
 0055563A    pop         ebx
 0055563B    mov         esp,ebp
 0055563D    pop         ebp
 0055563E    ret         8
end;*}

//00555674
{*procedure sub_00555674(?:?; ?:?; ?:?);
begin
 00555674    push        ebp
 00555675    mov         ebp,esp
 00555677    push        ecx
 00555678    mov         ecx,0C
 0055567D    push        0
 0055567F    push        0
 00555681    dec         ecx
>00555682    jne         0055567D
 00555684    push        ecx
 00555685    xchg        ecx,dword ptr [ebp-4]
 00555688    push        ebx
 00555689    push        esi
 0055568A    push        edi
 0055568B    mov         esi,ecx
 0055568D    mov         dword ptr [ebp-0C],edx
 00555690    mov         ebx,eax
 00555692    xor         eax,eax
 00555694    push        ebp
 00555695    push        555A0D
 0055569A    push        dword ptr fs:[eax]
 0055569D    mov         dword ptr fs:[eax],esp
 005556A0    mov         eax,dword ptr [ebx+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005556A6    cmp         byte ptr [eax+12],0;TJvCustomAppStorageOptions.FSetAsStr:Boolean
>005556AA    je          005556D3
 005556AC    push        0
 005556AE    lea         eax,[ebp-18]
 005556B1    push        eax
 005556B2    mov         edx,dword ptr [ebp+8]
 005556B5    mov         cl,1
 005556B7    mov         eax,esi
 005556B9    call        0054C1D0
 005556BE    mov         ecx,dword ptr [ebp-18]
 005556C1    mov         edx,dword ptr [ebp-0C]
 005556C4    mov         eax,ebx
 005556C6    mov         ebx,dword ptr [eax]
 005556C8    call        dword ptr [ebx+0AC];TJvCustomAppStorage.sub_00553350
>005556CE    jmp         00555970
 005556D3    mov         dl,1
 005556D5    mov         eax,[0043C7BC];TStringList
 005556DA    call        TStringList.Create;TStringList.Create
 005556DF    mov         dword ptr [ebp-10],eax
 005556E2    xor         eax,eax
 005556E4    push        ebp
 005556E5    push        555969
 005556EA    push        dword ptr fs:[eax]
 005556ED    mov         dword ptr fs:[eax],esp
 005556F0    lea         edx,[ebp-24]
 005556F3    mov         eax,esi
 005556F5    call        0054BBB0
 005556FA    mov         edx,dword ptr [ebp-24]
 005556FD    lea         eax,[ebp-20]
 00555700    mov         ecx,555A20;['{7DAD5224-46EA-11D5-B0C0-4854E825F345}']
 00555705    call        @IntfCast
 0055570A    mov         eax,dword ptr [ebp-20]
 0055570D    lea         edx,[ebp-1C]
 00555710    mov         ecx,dword ptr [eax]
 00555712    call        dword ptr [ecx+28]
 00555715    mov         edx,dword ptr [ebp-1C]
 00555718    lea         eax,[ebp-4]
 0055571B    mov         ecx,555A30;['{7DAD5222-46EA-11D5-B0C0-4854E825F345}']
 00555720    call        @IntfCast
 00555725    mov         eax,dword ptr [ebp-4]
 00555728    mov         edx,dword ptr [eax]
 0055572A    call        dword ptr [edx+20]
 0055572D    dec         al
>0055572F    je          00555899
 00555735    dec         al
>00555737    je          00555825
 0055573D    dec         al
>0055573F    jne         0055593C
 00555745    mov         eax,dword ptr [ebp-10]
 00555748    push        eax
 00555749    lea         edx,[ebp-2C]
 0055574C    mov         eax,esi
 0055574E    call        0054BBB0
 00555753    mov         edx,dword ptr [ebp-2C]
 00555756    lea         eax,[ebp-28]
 00555759    mov         ecx,555A20;['{7DAD5224-46EA-11D5-B0C0-4854E825F345}']
 0055575E    call        @IntfCast
 00555763    mov         eax,dword ptr [ebp-28]
 00555766    mov         edx,dword ptr [ebp+8]
 00555769    xor         ecx,ecx
 0055576B    mov         edi,dword ptr [eax]
 0055576D    call        dword ptr [edi+2C]
 00555770    lea         edx,[ebp-38]
 00555773    mov         eax,esi
 00555775    call        0054BBB0
 0055577A    mov         edx,dword ptr [ebp-38]
 0055577D    lea         eax,[ebp-34]
 00555780    mov         ecx,555A20;['{7DAD5224-46EA-11D5-B0C0-4854E825F345}']
 00555785    call        @IntfCast
 0055578A    mov         eax,dword ptr [ebp-34]
 0055578D    lea         edx,[ebp-30]
 00555790    mov         ecx,dword ptr [eax]
 00555792    call        dword ptr [ecx+28]
 00555795    mov         edx,dword ptr [ebp-30]
 00555798    lea         eax,[ebp-8]
 0055579B    mov         ecx,555A40;['{7DAD5223-46EA-11D5-B0C0-4854E825F345}']
 005557A0    call        @IntfCast
 005557A5    mov         eax,dword ptr [ebp-8]
 005557A8    mov         edx,dword ptr [eax]
 005557AA    call        dword ptr [edx+28]
 005557AD    mov         esi,eax
 005557AF    mov         eax,dword ptr [ebp-8]
 005557B2    mov         edx,dword ptr [eax]
 005557B4    call        dword ptr [edx+2C]
 005557B7    sub         eax,esi
>005557B9    jl          00555953
 005557BF    inc         eax
 005557C0    mov         dword ptr [ebp-14],eax
 005557C3    lea         ecx,[ebp-3C]
 005557C6    mov         edx,esi
 005557C8    mov         eax,dword ptr [ebp-8]
 005557CB    mov         edi,dword ptr [eax]
 005557CD    call        dword ptr [edi+34]
 005557D0    mov         edx,dword ptr [ebp-3C]
 005557D3    mov         eax,dword ptr [ebp-10]
 005557D6    mov         ecx,dword ptr [eax]
 005557D8    call        dword ptr [ecx+54];TStringList.IndexOf
 005557DB    inc         eax
 005557DC    setg        al
 005557DF    push        eax
 005557E0    lea         eax,[ebp-40]
 005557E3    push        eax
 005557E4    mov         eax,dword ptr [ebp-0C]
 005557E7    mov         dword ptr [ebp-48],eax
 005557EA    lea         ecx,[ebp-4C]
 005557ED    mov         edx,esi
 005557EF    mov         eax,dword ptr [ebp-8]
 005557F2    mov         edi,dword ptr [eax]
 005557F4    call        dword ptr [edi+34]
 005557F7    mov         eax,dword ptr [ebp-4C]
 005557FA    mov         dword ptr [ebp-44],eax
 005557FD    lea         edx,[ebp-48]
 00555800    mov         eax,dword ptr [ebx]
 00555802    mov         ecx,1
 00555807    call        TJvCustomAppStorage.ConcatPaths
 0055580C    mov         edx,dword ptr [ebp-40]
 0055580F    mov         eax,ebx
 00555811    pop         ecx
 00555812    mov         edi,dword ptr [eax]
 00555814    call        dword ptr [edi+0C4];TJvCustomAppStorage.sub_00553894
 0055581A    inc         esi
 0055581B    dec         dword ptr [ebp-14]
>0055581E    jne         005557C3
>00555820    jmp         00555953
 00555825    mov         eax,dword ptr [ebp-4]
 00555828    mov         edx,dword ptr [eax]
 0055582A    call        dword ptr [edx+28]
 0055582D    mov         esi,eax
 0055582F    mov         eax,dword ptr [ebp-4]
 00555832    mov         edx,dword ptr [eax]
 00555834    call        dword ptr [edx+2C]
 00555837    sub         eax,esi
>00555839    jl          00555953
 0055583F    inc         eax
 00555840    mov         dword ptr [ebp-14],eax
 00555843    lea         eax,[ebp-50]
 00555846    push        eax
 00555847    mov         eax,dword ptr [ebp-0C]
 0055584A    mov         dword ptr [ebp-48],eax
 0055584D    lea         ecx,[ebp-54]
 00555850    mov         edx,esi
 00555852    mov         eax,ebx
 00555854    mov         edi,dword ptr [eax]
 00555856    call        dword ptr [edi+0FC];TJvCustomAppStorage.GetCharName
 0055585C    mov         eax,dword ptr [ebp-54]
 0055585F    mov         dword ptr [ebp-44],eax
 00555862    lea         edx,[ebp-48]
 00555865    mov         eax,dword ptr [ebx]
 00555867    mov         ecx,1
 0055586C    call        TJvCustomAppStorage.ConcatPaths
 00555871    mov         edx,dword ptr [ebp-50]
 00555874    mov         eax,dword ptr [ebp+8]
 00555877    mov         ecx,esi
 00555879    cmp         ecx,1F
>0055587C    ja          00555881
 0055587E    bt          dword ptr [eax],ecx
 00555881    setb        cl
 00555884    mov         eax,ebx
 00555886    mov         edi,dword ptr [eax]
 00555888    call        dword ptr [edi+0C4];TJvCustomAppStorage.sub_00553894
 0055588E    inc         esi
 0055588F    dec         dword ptr [ebp-14]
>00555892    jne         00555843
>00555894    jmp         00555953
 00555899    mov         eax,dword ptr [ebp-10]
 0055589C    push        eax
 0055589D    lea         edx,[ebp-5C]
 005558A0    mov         eax,esi
 005558A2    call        0054BBB0
 005558A7    mov         edx,dword ptr [ebp-5C]
 005558AA    lea         eax,[ebp-58]
 005558AD    mov         ecx,555A20;['{7DAD5224-46EA-11D5-B0C0-4854E825F345}']
 005558B2    call        @IntfCast
 005558B7    mov         eax,dword ptr [ebp-58]
 005558BA    mov         edx,dword ptr [ebp+8]
 005558BD    xor         ecx,ecx
 005558BF    mov         esi,dword ptr [eax]
 005558C1    call        dword ptr [esi+2C]
 005558C4    mov         eax,dword ptr [ebp-4]
 005558C7    mov         edx,dword ptr [eax]
 005558C9    call        dword ptr [edx+28]
 005558CC    mov         esi,eax
 005558CE    mov         eax,dword ptr [ebp-4]
 005558D1    mov         edx,dword ptr [eax]
 005558D3    call        dword ptr [edx+2C]
 005558D6    sub         eax,esi
>005558D8    jl          00555953
 005558DA    inc         eax
 005558DB    mov         dword ptr [ebp-14],eax
 005558DE    lea         eax,[ebp-60]
 005558E1    push        eax
 005558E2    mov         eax,dword ptr [ebp-0C]
 005558E5    mov         dword ptr [ebp-48],eax
 005558E8    lea         ecx,[ebp-64]
 005558EB    mov         edx,esi
 005558ED    mov         eax,ebx
 005558EF    mov         edi,dword ptr [eax]
 005558F1    call        dword ptr [edi+100];TJvCustomAppStorage.GetIntName
 005558F7    mov         eax,dword ptr [ebp-64]
 005558FA    mov         dword ptr [ebp-44],eax
 005558FD    lea         edx,[ebp-48]
 00555900    mov         eax,dword ptr [ebx]
 00555902    mov         ecx,1
 00555907    call        TJvCustomAppStorage.ConcatPaths
 0055590C    mov         eax,dword ptr [ebp-60]
 0055590F    push        eax
 00555910    lea         edx,[ebp-68]
 00555913    mov         eax,esi
 00555915    call        IntToStr
 0055591A    mov         edx,dword ptr [ebp-68]
 0055591D    mov         eax,dword ptr [ebp-10]
 00555920    mov         ecx,dword ptr [eax]
 00555922    call        dword ptr [ecx+54];TStringList.IndexOf
 00555925    inc         eax
 00555926    setg        cl
 00555929    mov         eax,ebx
 0055592B    pop         edx
 0055592C    mov         edi,dword ptr [eax]
 0055592E    call        dword ptr [edi+0C4];TJvCustomAppStorage.sub_00553894
 00555934    inc         esi
 00555935    dec         dword ptr [ebp-14]
>00555938    jne         005558DE
>0055593A    jmp         00555953
 0055593C    mov         ecx,dword ptr ds:[78DA80];^SResString320:TResStringRec
 00555942    mov         dl,1
 00555944    mov         eax,[0054D11C];EJVCLAppStorageError
 00555949    call        Exception.CreateRes;EJVCLAppStorageError.Create
 0055594E    call        @RaiseExcept
 00555953    xor         eax,eax
 00555955    pop         edx
 00555956    pop         ecx
 00555957    pop         ecx
 00555958    mov         dword ptr fs:[eax],edx
 0055595B    push        555970
 00555960    lea         eax,[ebp-10]
 00555963    call        FreeAndNil
 00555968    ret
>00555969    jmp         @HandleFinally
>0055596E    jmp         00555960
 00555970    xor         eax,eax
 00555972    pop         edx
 00555973    pop         ecx
 00555974    pop         ecx
 00555975    mov         dword ptr fs:[eax],edx
 00555978    push        555A17
 0055597D    lea         eax,[ebp-68]
 00555980    mov         edx,3
 00555985    call        @UStrArrayClr
 0055598A    lea         eax,[ebp-5C]
 0055598D    call        @IntfClear
 00555992    lea         eax,[ebp-58]
 00555995    call        @IntfClear
 0055599A    lea         eax,[ebp-54]
 0055599D    mov         edx,3
 005559A2    call        @UStrArrayClr
 005559A7    lea         eax,[ebp-40]
 005559AA    mov         edx,2
 005559AF    call        @UStrArrayClr
 005559B4    lea         eax,[ebp-38]
 005559B7    call        @IntfClear
 005559BC    lea         eax,[ebp-34]
 005559BF    call        @IntfClear
 005559C4    lea         eax,[ebp-30]
 005559C7    call        @IntfClear
 005559CC    lea         eax,[ebp-2C]
 005559CF    call        @IntfClear
 005559D4    lea         eax,[ebp-28]
 005559D7    call        @IntfClear
 005559DC    lea         eax,[ebp-24]
 005559DF    call        @IntfClear
 005559E4    lea         eax,[ebp-20]
 005559E7    call        @IntfClear
 005559EC    lea         eax,[ebp-1C]
 005559EF    call        @IntfClear
 005559F4    lea         eax,[ebp-18]
 005559F7    call        @UStrClr
 005559FC    lea         eax,[ebp-8]
 005559FF    call        @IntfClear
 00555A04    lea         eax,[ebp-4]
 00555A07    call        @IntfClear
 00555A0C    ret
>00555A0D    jmp         @HandleFinally
>00555A12    jmp         0055597D
 00555A17    pop         edi
 00555A18    pop         esi
 00555A19    pop         ebx
 00555A1A    mov         esp,ebp
 00555A1C    pop         ebp
 00555A1D    ret         4
end;*}

//00555A50
{*procedure TJvCustomAppStorage.ReadSet(Path:string; ATypeInfo:PTypeInfo; Value:?; Default:?);
begin
 00555A50    push        ebp
 00555A51    mov         ebp,esp
 00555A53    add         esp,0FFFFFFF8
 00555A56    push        ebx
 00555A57    push        esi
 00555A58    push        edi
 00555A59    xor         ebx,ebx
 00555A5B    mov         dword ptr [ebp-4],ebx
 00555A5E    mov         edi,ecx
 00555A60    mov         esi,edx
 00555A62    mov         ebx,eax
 00555A64    xor         eax,eax
 00555A66    push        ebp
 00555A67    push        555AB5
 00555A6C    push        dword ptr fs:[eax]
 00555A6F    mov         dword ptr fs:[eax],esp
 00555A72    lea         eax,[ebp-4]
 00555A75    call        @UStrClr
 00555A7A    push        eax
 00555A7B    lea         ecx,[ebp-8]
 00555A7E    mov         edx,esi
 00555A80    mov         eax,ebx
 00555A82    call        TJvCustomAppStorage.ResolvePath
 00555A87    mov         eax,dword ptr [ebp+0C]
 00555A8A    push        eax
 00555A8B    mov         eax,dword ptr [ebp+8]
 00555A8E    push        eax
 00555A8F    mov         ecx,edi
 00555A91    mov         edx,dword ptr [ebp-4]
 00555A94    mov         eax,dword ptr [ebp-8]
 00555A97    mov         ebx,dword ptr [eax]
 00555A99    call        dword ptr [ebx+0D0];TJvCustomAppStorage.sub_00555274
 00555A9F    xor         eax,eax
 00555AA1    pop         edx
 00555AA2    pop         ecx
 00555AA3    pop         ecx
 00555AA4    mov         dword ptr fs:[eax],edx
 00555AA7    push        555ABC
 00555AAC    lea         eax,[ebp-4]
 00555AAF    call        @UStrClr
 00555AB4    ret
>00555AB5    jmp         @HandleFinally
>00555ABA    jmp         00555AAC
 00555ABC    pop         edi
 00555ABD    pop         esi
 00555ABE    pop         ebx
 00555ABF    pop         ecx
 00555AC0    pop         ecx
 00555AC1    pop         ebp
 00555AC2    ret         8
end;*}

//00555AC8
{*procedure TJvCustomAppStorage.WriteSet(Path:string; ATypeInfo:PTypeInfo; Value:?);
begin
 00555AC8    push        ebp
 00555AC9    mov         ebp,esp
 00555ACB    add         esp,0FFFFFFF8
 00555ACE    push        ebx
 00555ACF    push        esi
 00555AD0    push        edi
 00555AD1    xor         ebx,ebx
 00555AD3    mov         dword ptr [ebp-4],ebx
 00555AD6    mov         edi,ecx
 00555AD8    mov         esi,edx
 00555ADA    mov         ebx,eax
 00555ADC    xor         eax,eax
 00555ADE    push        ebp
 00555ADF    push        555B35
 00555AE4    push        dword ptr fs:[eax]
 00555AE7    mov         dword ptr fs:[eax],esp
 00555AEA    lea         eax,[ebp-4]
 00555AED    call        @UStrClr
 00555AF2    push        eax
 00555AF3    lea         ecx,[ebp-8]
 00555AF6    mov         edx,esi
 00555AF8    mov         eax,ebx
 00555AFA    call        TJvCustomAppStorage.ResolvePath
 00555AFF    mov         eax,dword ptr [ebp-8]
 00555B02    call        TJvCustomAppMemoryFileStorage.GetReadOnly
 00555B07    test        al,al
>00555B09    jne         00555B1F
 00555B0B    mov         eax,dword ptr [ebp+8]
 00555B0E    push        eax
 00555B0F    mov         ecx,edi
 00555B11    mov         edx,dword ptr [ebp-4]
 00555B14    mov         eax,dword ptr [ebp-8]
 00555B17    mov         ebx,dword ptr [eax]
 00555B19    call        dword ptr [ebx+0D4];TJvCustomAppStorage.sub_00555674
 00555B1F    xor         eax,eax
 00555B21    pop         edx
 00555B22    pop         ecx
 00555B23    pop         ecx
 00555B24    mov         dword ptr fs:[eax],edx
 00555B27    push        555B3C
 00555B2C    lea         eax,[ebp-4]
 00555B2F    call        @UStrClr
 00555B34    ret
>00555B35    jmp         @HandleFinally
>00555B3A    jmp         00555B2C
 00555B3C    pop         edi
 00555B3D    pop         esi
 00555B3E    pop         ebx
 00555B3F    pop         ecx
 00555B40    pop         ecx
 00555B41    pop         ebp
 00555B42    ret         4
end;*}

//00555B48
procedure TJvCustomAppStorage.ReadProperty(Path:string; PersObj:TPersistent; ClearFirst:Boolean; Recursive:Boolean; PropName:string);
begin
{*
 00555B48    push        ebp
 00555B49    mov         ebp,esp
 00555B4B    push        ecx
 00555B4C    mov         ecx,8
 00555B51    push        0
 00555B53    push        0
 00555B55    dec         ecx
>00555B56    jne         00555B51
 00555B58    push        ecx
 00555B59    xchg        ecx,dword ptr [ebp-4]
 00555B5C    push        ebx
 00555B5D    push        esi
 00555B5E    push        edi
 00555B5F    mov         ebx,ecx
 00555B61    mov         dword ptr [ebp-4],edx
 00555B64    mov         edi,eax
 00555B66    mov         esi,dword ptr [ebp+10]
 00555B69    xor         eax,eax
 00555B6B    push        ebp
 00555B6C    push        555F42
 00555B71    push        dword ptr fs:[eax]
 00555B74    mov         dword ptr fs:[eax],esp
 00555B77    test        ebx,ebx
>00555B79    je          00555EF0
 00555B7F    mov         edx,esi
 00555B81    mov         eax,ebx
 00555B83    call        PropType
 00555B88    and         eax,7F
 00555B8B    cmp         eax,12
>00555B8E    ja          00555EF0
 00555B94    jmp         dword ptr [eax*4+555B9B]
 00555B94    dd          00555EF0
 00555B94    dd          00555D0B
 00555B94    dd          00555D0B
 00555B94    dd          00555C43
 00555B94    dd          00555D89
 00555B94    dd          00555BE7
 00555B94    dd          00555CC9
 00555B94    dd          00555E0B
 00555B94    dd          00555EF0
 00555B94    dd          00555D0B
 00555B94    dd          00555BE7
 00555B94    dd          00555C15
 00555B94    dd          00555C85
 00555B94    dd          00555EF0
 00555B94    dd          00555EF0
 00555B94    dd          00555EF0
 00555B94    dd          00555D4D
 00555B94    dd          00555EF0
 00555B94    dd          00555BE7
 00555BE7    lea         eax,[ebp-0C]
 00555BEA    push        eax
 00555BEB    lea         ecx,[ebp-10]
 00555BEE    mov         edx,esi
 00555BF0    mov         eax,ebx
 00555BF2    call        GetStrProp
 00555BF7    mov         ecx,dword ptr [ebp-10]
 00555BFA    mov         edx,dword ptr [ebp-4]
 00555BFD    mov         eax,edi
 00555BFF    call        TJvCustomAppStorage.ReadString
 00555C04    mov         ecx,dword ptr [ebp-0C]
 00555C07    mov         edx,esi
 00555C09    mov         eax,ebx
 00555C0B    call        00436B04
>00555C10    jmp         00555EF0
 00555C15    lea         eax,[ebp-14]
 00555C18    push        eax
 00555C19    lea         ecx,[ebp-18]
 00555C1C    mov         edx,esi
 00555C1E    mov         eax,ebx
 00555C20    call        GetInterfaceProp
 00555C25    mov         ecx,dword ptr [ebp-18]
 00555C28    mov         edx,dword ptr [ebp-4]
 00555C2B    mov         eax,edi
 00555C2D    call        TJvCustomAppStorage.ReadWideString
 00555C32    mov         ecx,dword ptr [ebp-14]
 00555C35    mov         edx,esi
 00555C37    mov         eax,ebx
 00555C39    call        GetMethodProp
>00555C3E    jmp         00555EF0
 00555C43    mov         edx,esi
 00555C45    mov         eax,ebx
 00555C47    call        GetDynArrayProp
 00555C4C    mov         dword ptr [ebp-8],eax
 00555C4F    lea         eax,[ebp-8]
 00555C52    push        eax
 00555C53    lea         eax,[ebp-8]
 00555C56    push        eax
 00555C57    mov         ecx,dword ptr ds:[555F54];0x0 gvar_00555F54
 00555C5D    mov         edx,esi
 00555C5F    mov         eax,ebx
 00555C61    call        GetPropInfo
 00555C66    mov         eax,dword ptr [eax]
 00555C68    mov         ecx,dword ptr [eax]
 00555C6A    mov         edx,dword ptr [ebp-4]
 00555C6D    mov         eax,edi
 00555C6F    call        TJvCustomAppStorage.ReadEnumeration
 00555C74    mov         ecx,dword ptr [ebp-8]
 00555C77    mov         edx,esi
 00555C79    mov         eax,ebx
 00555C7B    call        GetAnsiStrProp
>00555C80    jmp         00555EF0
 00555C85    lea         eax,[ebp-2C]
 00555C88    push        eax
 00555C89    lea         ecx,[ebp-40]
 00555C8C    mov         edx,esi
 00555C8E    mov         eax,ebx
 00555C90    call        GetVariantProp
 00555C95    lea         eax,[ebp-40]
 00555C98    lea         edx,[ebp-30]
 00555C9B    call        VarToStr
 00555CA0    mov         ecx,dword ptr [ebp-30]
 00555CA3    mov         edx,dword ptr [ebp-4]
 00555CA6    mov         eax,edi
 00555CA8    call        TJvCustomAppStorage.ReadString
 00555CAD    mov         edx,dword ptr [ebp-2C]
 00555CB0    lea         eax,[ebp-28]
 00555CB3    call        @VarFromUStr
 00555CB8    lea         ecx,[ebp-28]
 00555CBB    mov         edx,esi
 00555CBD    mov         eax,ebx
 00555CBF    call        GetWideStrProp
>00555CC4    jmp         00555EF0
 00555CC9    mov         edx,esi
 00555CCB    mov         eax,ebx
 00555CCD    call        GetDynArrayProp
 00555CD2    mov         dword ptr [ebp-8],eax
 00555CD5    lea         eax,[ebp-8]
 00555CD8    push        eax
 00555CD9    lea         eax,[ebp-8]
 00555CDC    push        eax
 00555CDD    mov         ecx,dword ptr ds:[555F54];0x0 gvar_00555F54
 00555CE3    mov         edx,esi
 00555CE5    mov         eax,ebx
 00555CE7    call        GetPropInfo
 00555CEC    mov         eax,dword ptr [eax]
 00555CEE    mov         ecx,dword ptr [eax]
 00555CF0    mov         edx,dword ptr [ebp-4]
 00555CF3    mov         eax,edi
 00555CF5    call        TJvCustomAppStorage.ReadSet
 00555CFA    mov         ecx,dword ptr [ebp-8]
 00555CFD    mov         edx,esi
 00555CFF    mov         eax,ebx
 00555D01    call        GetAnsiStrProp
>00555D06    jmp         00555EF0
 00555D0B    mov         edx,esi
 00555D0D    mov         eax,ebx
 00555D0F    call        GetDynArrayProp
 00555D14    mov         dword ptr [ebp-8],eax
 00555D17    lea         eax,[ebp-8]
 00555D1A    push        eax
 00555D1B    lea         eax,[ebp-8]
 00555D1E    push        eax
 00555D1F    mov         ecx,dword ptr ds:[555F54];0x0 gvar_00555F54
 00555D25    mov         edx,esi
 00555D27    mov         eax,ebx
 00555D29    call        GetPropInfo
 00555D2E    mov         eax,dword ptr [eax]
 00555D30    mov         ecx,dword ptr [eax]
 00555D32    mov         edx,dword ptr [ebp-4]
 00555D35    mov         eax,edi
 00555D37    call        TJvCustomAppStorage.ReadEnumeration
 00555D3C    mov         ecx,dword ptr [ebp-8]
 00555D3F    mov         edx,esi
 00555D41    mov         eax,ebx
 00555D43    call        GetAnsiStrProp
>00555D48    jmp         00555EF0
 00555D4D    lea         eax,[ebp-44]
 00555D50    push        eax
 00555D51    mov         edx,esi
 00555D53    mov         eax,ebx
 00555D55    call        GetInt64Prop
 00555D5A    push        edx
 00555D5B    push        eax
 00555D5C    lea         eax,[ebp-48]
 00555D5F    call        IntToStr
 00555D64    mov         ecx,dword ptr [ebp-48]
 00555D67    mov         edx,dword ptr [ebp-4]
 00555D6A    mov         eax,edi
 00555D6C    call        TJvCustomAppStorage.ReadString
 00555D71    mov         eax,dword ptr [ebp-44]
 00555D74    call        StrToInt64
 00555D79    push        edx
 00555D7A    push        eax
 00555D7B    mov         edx,esi
 00555D7D    mov         eax,ebx
 00555D7F    call        SetInt64Prop
>00555D84    jmp         00555EF0
 00555D89    mov         ecx,dword ptr ds:[555F58];0x3FFFFF gvar_00555F58
 00555D8F    mov         edx,esi
 00555D91    mov         eax,ebx
 00555D93    call        GetPropInfo
 00555D98    test        eax,eax
>00555D9A    je          00555DDC
 00555D9C    cmp         dword ptr [eax],0
>00555D9F    je          00555DDC
 00555DA1    mov         eax,dword ptr [eax]
 00555DA3    mov         eax,dword ptr [eax]
 00555DA5    cmp         eax,dword ptr ds:[401F44];TDateTime
>00555DAB    jne         00555DDC
 00555DAD    mov         edx,esi
 00555DAF    mov         eax,ebx
 00555DB1    call        GetFloatProp
 00555DB6    add         esp,0FFFFFFF8
 00555DB9    fstp        qword ptr [esp]
 00555DBC    wait
 00555DBD    mov         edx,dword ptr [ebp-4]
 00555DC0    mov         eax,edi
 00555DC2    call        TJvCustomAppStorage.ReadDateTime
 00555DC7    add         esp,0FFFFFFF4
 00555DCA    fstp        tbyte ptr [esp]
 00555DCD    wait
 00555DCE    mov         edx,esi
 00555DD0    mov         eax,ebx
 00555DD2    call        SetFloatProp
>00555DD7    jmp         00555EF0
 00555DDC    mov         edx,esi
 00555DDE    mov         eax,ebx
 00555DE0    call        GetFloatProp
 00555DE5    add         esp,0FFFFFFF4
 00555DE8    fstp        tbyte ptr [esp]
 00555DEB    wait
 00555DEC    mov         edx,dword ptr [ebp-4]
 00555DEF    mov         eax,edi
 00555DF1    call        TJvCustomAppStorage.ReadFloat
 00555DF6    add         esp,0FFFFFFF4
 00555DF9    fstp        tbyte ptr [esp]
 00555DFC    wait
 00555DFD    mov         edx,esi
 00555DFF    mov         eax,ebx
 00555E01    call        SetFloatProp
>00555E06    jmp         00555EF0
 00555E0B    xor         ecx,ecx
 00555E0D    mov         edx,esi
 00555E0F    mov         eax,ebx
 00555E11    call        GetEnumProp
 00555E16    mov         esi,eax
 00555E18    call        00550C88
 00555E1D    test        eax,eax
 00555E1F    setne       al
 00555E22    and         al,byte ptr [ebp+0C]
>00555E25    je          00555E4A
 00555E27    push        ebx
 00555E28    push        esi
 00555E29    movzx       eax,byte ptr [ebp+0C]
 00555E2D    push        eax
 00555E2E    movzx       eax,byte ptr [ebp+8]
 00555E32    push        eax
 00555E33    call        00550C88
 00555E38    mov         ecx,dword ptr [ebp-4]
 00555E3B    mov         edx,edi
 00555E3D    call        TJvAppStoragePropertyEngineList.ReadProperty
 00555E42    test        al,al
>00555E44    jne         00555EF0
 00555E4A    mov         eax,esi
 00555E4C    mov         edx,dword ptr ds:[43B934];TStrings
 00555E52    call        @IsClass
 00555E57    test        al,al
>00555E59    je          00555E73
 00555E5B    movzx       eax,byte ptr [ebp+8]
 00555E5F    push        eax
 00555E60    push        555F68;'Item'
 00555E65    mov         ecx,esi
 00555E67    mov         edx,dword ptr [ebp-4]
 00555E6A    mov         eax,edi
 00555E6C    call        TJvCustomAppStorage.ReadStringList
>00555E71    jmp         00555EF0
 00555E73    mov         eax,esi
 00555E75    mov         edx,dword ptr ds:[43A9AC];TPersistent
 00555E7B    call        @IsClass
 00555E80    and         al,byte ptr [ebp+0C]
>00555E83    je          00555EF0
 00555E85    mov         eax,esi
 00555E87    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 00555E8D    call        @IsClass
 00555E92    test        al,al
>00555E94    je          00555EB2
 00555E96    mov         edx,dword ptr [ebp-4]
 00555E99    mov         eax,esi
 00555E9B    mov         ecx,dword ptr [eax]
 00555E9D    call        dword ptr [ecx+3C]
 00555EA0    mov         edx,edi
 00555EA2    mov         eax,esi
 00555EA4    mov         ecx,dword ptr [eax]
 00555EA6    call        dword ptr [ecx+40]
 00555EA9    mov         eax,esi
 00555EAB    mov         edx,dword ptr [eax]
 00555EAD    call        dword ptr [edx+50]
>00555EB0    jmp         00555EF0
 00555EB2    mov         eax,esi
 00555EB4    mov         edx,dword ptr ds:[43B0FC];TCollection
 00555EBA    call        @IsClass
 00555EBF    test        al,al
>00555EC1    je          00555EDB
 00555EC3    movzx       eax,byte ptr [ebp+8]
 00555EC7    push        eax
 00555EC8    push        555F68;'Item'
 00555ECD    mov         ecx,esi
 00555ECF    mov         edx,dword ptr [ebp-4]
 00555ED2    mov         eax,edi
 00555ED4    call        TJvCustomAppStorage.ReadCollection
>00555ED9    jmp         00555EF0
 00555EDB    push        1
 00555EDD    movzx       eax,byte ptr [ebp+8]
 00555EE1    push        eax
 00555EE2    push        0
 00555EE4    mov         ecx,esi
 00555EE6    mov         edx,dword ptr [ebp-4]
 00555EE9    mov         eax,edi
 00555EEB    call        TJvCustomAppStorage.ReadPersistent
 00555EF0    xor         eax,eax
 00555EF2    pop         edx
 00555EF3    pop         ecx
 00555EF4    pop         ecx
 00555EF5    mov         dword ptr fs:[eax],edx
 00555EF8    push        555F49
 00555EFD    lea         eax,[ebp-48]
 00555F00    mov         edx,2
 00555F05    call        @UStrArrayClr
 00555F0A    lea         eax,[ebp-40]
 00555F0D    call        @VarClr
 00555F12    lea         eax,[ebp-30]
 00555F15    mov         edx,2
 00555F1A    call        @UStrArrayClr
 00555F1F    lea         eax,[ebp-28]
 00555F22    call        @VarClr
 00555F27    lea         eax,[ebp-18]
 00555F2A    mov         edx,2
 00555F2F    call        @WStrArrayClr
 00555F34    lea         eax,[ebp-10]
 00555F37    mov         edx,2
 00555F3C    call        @UStrArrayClr
 00555F41    ret
>00555F42    jmp         @HandleFinally
>00555F47    jmp         00555EFD
 00555F49    pop         edi
 00555F4A    pop         esi
 00555F4B    pop         ebx
 00555F4C    mov         esp,ebp
 00555F4E    pop         ebp
 00555F4F    ret         0C
*}
end;

//00555F74
{*function sub_00555F74(?:PPropInfo; ?:?):?;
begin
 00555F74    push        ebp
 00555F75    mov         ebp,esp
 00555F77    push        ebx
 00555F78    mov         ebx,eax
 00555F7A    mov         eax,dword ptr [ebp+8]
 00555F7D    mov         eax,dword ptr [eax-4]
 00555F80    mov         edx,ebx
 00555F82    call        GetOrdProp
 00555F87    mov         edx,eax
 00555F89    mov         eax,dword ptr [ebx+14]
 00555F8C    cmp         eax,80000000
>00555F91    je          00555F97
 00555F93    cmp         eax,edx
>00555F95    je          00555F9C
 00555F97    xor         eax,eax
 00555F99    pop         ebx
 00555F9A    pop         ebp
 00555F9B    ret
 00555F9C    mov         al,1
 00555F9E    pop         ebx
 00555F9F    pop         ebp
 00555FA0    ret
end;*}

//00555FA4
{*function sub_00555FA4(?:PPropInfo; ?:?):?;
begin
 00555FA4    push        ebp
 00555FA5    mov         ebp,esp
 00555FA7    push        0
 00555FA9    push        ebx
 00555FAA    mov         ebx,eax
 00555FAC    xor         eax,eax
 00555FAE    push        ebp
 00555FAF    push        555FED
 00555FB4    push        dword ptr fs:[eax]
 00555FB7    mov         dword ptr fs:[eax],esp
 00555FBA    lea         ecx,[ebp-4]
 00555FBD    mov         eax,dword ptr [ebp+8]
 00555FC0    mov         eax,dword ptr [eax-4]
 00555FC3    mov         edx,ebx
 00555FC5    call        GetWideStrProp
 00555FCA    mov         eax,dword ptr [ebp-4]
 00555FCD    xor         edx,edx
 00555FCF    call        @WStrEqual
 00555FD4    sete        bl
 00555FD7    xor         eax,eax
 00555FD9    pop         edx
 00555FDA    pop         ecx
 00555FDB    pop         ecx
 00555FDC    mov         dword ptr fs:[eax],edx
 00555FDF    push        555FF4
 00555FE4    lea         eax,[ebp-4]
 00555FE7    call        @WStrClr
 00555FEC    ret
>00555FED    jmp         @HandleFinally
>00555FF2    jmp         00555FE4
 00555FF4    mov         eax,ebx
 00555FF6    pop         ebx
 00555FF7    pop         ecx
 00555FF8    pop         ebp
 00555FF9    ret
end;*}

//00555FFC
{*function sub_00555FFC(?:PPropInfo; ?:?):Boolean;
begin
 00555FFC    push        ebp
 00555FFD    mov         ebp,esp
 00555FFF    add         esp,0FFFFFFF8
 00556002    mov         edx,dword ptr [ebp+8]
 00556005    mov         edx,dword ptr [edx-4]
 00556008    xchg        eax,edx
 00556009    call        GetInt64Prop
 0055600E    mov         dword ptr [ebp-8],eax
 00556011    mov         dword ptr [ebp-4],edx
 00556014    cmp         dword ptr [ebp-4],0
>00556018    jne         0055601E
 0055601A    cmp         dword ptr [ebp-8],0
 0055601E    sete        al
 00556021    pop         ecx
 00556022    pop         ecx
 00556023    pop         ebp
 00556024    ret
end;*}

//00556028
{*function sub_00556028(?:PPropInfo; ?:?):Boolean;
begin
 00556028    push        ebp
 00556029    mov         ebp,esp
 0055602B    add         esp,0FFFFFFF0
 0055602E    mov         edx,dword ptr [ebp+8]
 00556031    mov         edx,dword ptr [edx-4]
 00556034    xchg        eax,edx
 00556035    call        GetFloatProp
 0055603A    fstp        tbyte ptr [ebp-10]
 0055603D    wait
 0055603E    fld         tbyte ptr [ebp-10]
 00556041    fcomp       dword ptr ds:[556054];0:Single
 00556047    wait
 00556048    fnstsw      al
 0055604A    sahf
 0055604B    sete        al
 0055604E    mov         esp,ebp
 00556050    pop         ebp
 00556051    ret
end;*}

//00556058
procedure TJvCustomAppStorage.WriteProperty(Path:string; PersObj:TPersistent; Recursive:Boolean; PropName:string);
begin
{*
 00556058    push        ebp
 00556059    mov         ebp,esp
 0055605B    push        ecx
 0055605C    mov         ecx,5
 00556061    push        0
 00556063    push        0
 00556065    dec         ecx
>00556066    jne         00556061
 00556068    xchg        ecx,dword ptr [ebp-4]
 0055606B    push        ebx
 0055606C    push        esi
 0055606D    push        edi
 0055606E    mov         dword ptr [ebp-4],ecx
 00556071    mov         dword ptr [ebp-8],edx
 00556074    mov         esi,eax
 00556076    mov         edi,dword ptr [ebp+0C]
 00556079    xor         eax,eax
 0055607B    push        ebp
 0055607C    push        5564AA
 00556081    push        dword ptr fs:[eax]
 00556084    mov         dword ptr fs:[eax],esp
 00556087    cmp         dword ptr [ebp-4],0
>0055608B    je          00556474
 00556091    mov         ecx,dword ptr ds:[5564BC];0x3FFFFF gvar_005564BC
 00556097    mov         edx,edi
 00556099    mov         eax,dword ptr [ebp-4]
 0055609C    call        GetPropInfo
 005560A1    mov         ebx,eax
 005560A3    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005560A9    cmp         byte ptr [eax+17],0;TJvCustomAppStorageOptions.FStoreDefaultValues:Boolean
>005560AD    jne         005560D5
 005560AF    cmp         dword ptr [ebx+4],0
>005560B3    je          00556474
 005560B9    cmp         dword ptr [ebx+8],0
>005560BD    je          00556474
 005560C3    mov         edx,ebx
 005560C5    mov         eax,dword ptr [ebp-4]
 005560C8    call        IsStoredProp
 005560CD    test        al,al
>005560CF    je          00556474
 005560D5    mov         edx,edi
 005560D7    mov         eax,dword ptr [ebp-4]
 005560DA    call        PropType
 005560DF    and         eax,7F
 005560E2    cmp         eax,12
>005560E5    ja          00556474
 005560EB    jmp         dword ptr [eax*4+5560F2]
 005560EB    dd          00556474
 005560EB    dd          0055627F
 005560EB    dd          0055627F
 005560EB    dd          005561FD
 005560EB    dd          0055632A
 005560EB    dd          0055613E
 005560EB    dd          0055623E
 005560EB    dd          0055639C
 005560EB    dd          00556474
 005560EB    dd          0055627F
 005560EB    dd          0055613E
 005560EB    dd          0055617A
 005560EB    dd          005561B6
 005560EB    dd          00556474
 005560EB    dd          00556474
 005560EB    dd          00556474
 005560EB    dd          005562E7
 005560EB    dd          00556474
 005560EB    dd          0055613E
 0055613E    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00556144    cmp         byte ptr [eax+17],0;TJvCustomAppStorageOptions.FStoreDefaultValues:Boolean
>00556148    jne         0055615B
 0055614A    push        ebp
 0055614B    mov         eax,ebx
 0055614D    call        00555FA4
 00556152    pop         ecx
 00556153    test        al,al
>00556155    jne         00556474
 0055615B    lea         ecx,[ebp-10]
 0055615E    mov         edx,edi
 00556160    mov         eax,dword ptr [ebp-4]
 00556163    call        GetStrProp
 00556168    mov         ecx,dword ptr [ebp-10]
 0055616B    mov         edx,dword ptr [ebp-8]
 0055616E    mov         eax,esi
 00556170    call        TJvCustomAppStorage.WriteString
>00556175    jmp         00556474
 0055617A    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00556180    cmp         byte ptr [eax+17],0;TJvCustomAppStorageOptions.FStoreDefaultValues:Boolean
>00556184    jne         00556197
 00556186    push        ebp
 00556187    mov         eax,ebx
 00556189    call        00555FA4
 0055618E    pop         ecx
 0055618F    test        al,al
>00556191    jne         00556474
 00556197    lea         ecx,[ebp-14]
 0055619A    mov         edx,edi
 0055619C    mov         eax,dword ptr [ebp-4]
 0055619F    call        GetInterfaceProp
 005561A4    mov         ecx,dword ptr [ebp-14]
 005561A7    mov         edx,dword ptr [ebp-8]
 005561AA    mov         eax,esi
 005561AC    call        TJvCustomAppStorage.WriteWideString
>005561B1    jmp         00556474
 005561B6    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005561BC    cmp         byte ptr [eax+17],0;TJvCustomAppStorageOptions.FStoreDefaultValues:Boolean
>005561C0    jne         005561D3
 005561C2    push        ebp
 005561C3    mov         eax,ebx
 005561C5    call        00555FA4
 005561CA    pop         ecx
 005561CB    test        al,al
>005561CD    jne         00556474
 005561D3    lea         ecx,[ebp-28]
 005561D6    mov         edx,edi
 005561D8    mov         eax,dword ptr [ebp-4]
 005561DB    call        GetVariantProp
 005561E0    lea         eax,[ebp-28]
 005561E3    lea         edx,[ebp-18]
 005561E6    call        VarToStr
 005561EB    mov         ecx,dword ptr [ebp-18]
 005561EE    mov         edx,dword ptr [ebp-8]
 005561F1    mov         eax,esi
 005561F3    call        TJvCustomAppStorage.WriteString
>005561F8    jmp         00556474
 005561FD    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00556203    cmp         byte ptr [eax+17],0;TJvCustomAppStorageOptions.FStoreDefaultValues:Boolean
>00556207    jne         0055621A
 00556209    push        ebp
 0055620A    mov         eax,ebx
 0055620C    call        00555F74
 00556211    pop         ecx
 00556212    test        al,al
>00556214    jne         00556474
 0055621A    mov         edx,edi
 0055621C    mov         eax,dword ptr [ebp-4]
 0055621F    call        GetDynArrayProp
 00556224    mov         dword ptr [ebp-0C],eax
 00556227    lea         eax,[ebp-0C]
 0055622A    push        eax
 0055622B    mov         eax,dword ptr [ebx]
 0055622D    mov         ecx,dword ptr [eax]
 0055622F    mov         edx,dword ptr [ebp-8]
 00556232    mov         eax,esi
 00556234    call        TJvCustomAppStorage.WriteEnumeration
>00556239    jmp         00556474
 0055623E    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00556244    cmp         byte ptr [eax+17],0;TJvCustomAppStorageOptions.FStoreDefaultValues:Boolean
>00556248    jne         0055625B
 0055624A    push        ebp
 0055624B    mov         eax,ebx
 0055624D    call        00555F74
 00556252    pop         ecx
 00556253    test        al,al
>00556255    jne         00556474
 0055625B    mov         edx,edi
 0055625D    mov         eax,dword ptr [ebp-4]
 00556260    call        GetDynArrayProp
 00556265    mov         dword ptr [ebp-0C],eax
 00556268    lea         eax,[ebp-0C]
 0055626B    push        eax
 0055626C    mov         eax,dword ptr [ebx]
 0055626E    mov         ecx,dword ptr [eax]
 00556270    mov         edx,dword ptr [ebp-8]
 00556273    mov         eax,esi
 00556275    call        TJvCustomAppStorage.WriteSet
>0055627A    jmp         00556474
 0055627F    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00556285    cmp         byte ptr [eax+17],0;TJvCustomAppStorageOptions.FStoreDefaultValues:Boolean
>00556289    jne         0055629C
 0055628B    push        ebp
 0055628C    mov         eax,ebx
 0055628E    call        00555F74
 00556293    pop         ecx
 00556294    test        al,al
>00556296    jne         00556474
 0055629C    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005562A2    cmp         byte ptr [eax+11],0;TJvCustomAppStorageOptions.FIntAsStr:Boolean
>005562A6    je          005562CC
 005562A8    mov         edx,edi
 005562AA    mov         eax,dword ptr [ebp-4]
 005562AD    call        GetDynArrayProp
 005562B2    mov         dword ptr [ebp-0C],eax
 005562B5    lea         eax,[ebp-0C]
 005562B8    push        eax
 005562B9    mov         eax,dword ptr [ebx]
 005562BB    mov         ecx,dword ptr [eax]
 005562BD    mov         edx,dword ptr [ebp-8]
 005562C0    mov         eax,esi
 005562C2    call        TJvCustomAppStorage.WriteEnumeration
>005562C7    jmp         00556474
 005562CC    mov         edx,edi
 005562CE    mov         eax,dword ptr [ebp-4]
 005562D1    call        GetDynArrayProp
 005562D6    mov         ecx,eax
 005562D8    mov         edx,dword ptr [ebp-8]
 005562DB    mov         eax,esi
 005562DD    call        TJvCustomAppStorage.WriteInteger
>005562E2    jmp         00556474
 005562E7    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 005562ED    cmp         byte ptr [eax+17],0;TJvCustomAppStorageOptions.FStoreDefaultValues:Boolean
>005562F1    jne         00556304
 005562F3    push        ebp
 005562F4    mov         eax,ebx
 005562F6    call        00555FFC
 005562FB    pop         ecx
 005562FC    test        al,al
>005562FE    jne         00556474
 00556304    mov         edx,edi
 00556306    mov         eax,dword ptr [ebp-4]
 00556309    call        GetInt64Prop
 0055630E    push        edx
 0055630F    push        eax
 00556310    lea         eax,[ebp-2C]
 00556313    call        IntToStr
 00556318    mov         ecx,dword ptr [ebp-2C]
 0055631B    mov         edx,dword ptr [ebp-8]
 0055631E    mov         eax,esi
 00556320    call        TJvCustomAppStorage.WriteString
>00556325    jmp         00556474
 0055632A    mov         eax,dword ptr [esi+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00556330    cmp         byte ptr [eax+17],0;TJvCustomAppStorageOptions.FStoreDefaultValues:Boolean
>00556334    jne         00556347
 00556336    push        ebp
 00556337    mov         eax,ebx
 00556339    call        00556028
 0055633E    pop         ecx
 0055633F    test        al,al
>00556341    jne         00556474
 00556347    test        ebx,ebx
>00556349    je          0055637C
 0055634B    cmp         dword ptr [ebx],0
>0055634E    je          0055637C
 00556350    mov         eax,dword ptr [ebx]
 00556352    mov         eax,dword ptr [eax]
 00556354    cmp         eax,dword ptr ds:[401F44];TDateTime
>0055635A    jne         0055637C
 0055635C    mov         edx,edi
 0055635E    mov         eax,dword ptr [ebp-4]
 00556361    call        GetFloatProp
 00556366    add         esp,0FFFFFFF8
 00556369    fstp        qword ptr [esp]
 0055636C    wait
 0055636D    mov         edx,dword ptr [ebp-8]
 00556370    mov         eax,esi
 00556372    call        TJvCustomAppStorage.WriteDateTime
>00556377    jmp         00556474
 0055637C    mov         edx,edi
 0055637E    mov         eax,dword ptr [ebp-4]
 00556381    call        GetFloatProp
 00556386    add         esp,0FFFFFFF4
 00556389    fstp        tbyte ptr [esp]
 0055638C    wait
 0055638D    mov         edx,dword ptr [ebp-8]
 00556390    mov         eax,esi
 00556392    call        TJvCustomAppStorage.WriteFloat
>00556397    jmp         00556474
 0055639C    xor         ecx,ecx
 0055639E    mov         edx,edi
 005563A0    mov         eax,dword ptr [ebp-4]
 005563A3    call        GetEnumProp
 005563A8    mov         edi,eax
 005563AA    call        00550C88
 005563AF    test        eax,eax
 005563B1    setne       al
 005563B4    and         al,byte ptr [ebp+8]
>005563B7    je          005563DA
 005563B9    mov         eax,dword ptr [ebp-4]
 005563BC    push        eax
 005563BD    push        edi
 005563BE    movzx       eax,byte ptr [ebp+8]
 005563C2    push        eax
 005563C3    call        00550C88
 005563C8    mov         ecx,dword ptr [ebp-8]
 005563CB    mov         edx,esi
 005563CD    call        TJvAppStoragePropertyEngineList.WriteProperty
 005563D2    test        al,al
>005563D4    jne         00556474
 005563DA    mov         eax,edi
 005563DC    mov         edx,dword ptr ds:[43B934];TStrings
 005563E2    call        @IsClass
 005563E7    test        al,al
>005563E9    je          005563FE
 005563EB    push        5564CC;'Item'
 005563F0    mov         ecx,edi
 005563F2    mov         edx,dword ptr [ebp-8]
 005563F5    mov         eax,esi
 005563F7    call        TJvCustomAppStorage.WriteStringList
>005563FC    jmp         00556474
 005563FE    mov         eax,edi
 00556400    mov         edx,dword ptr ds:[43A9AC];TPersistent
 00556406    call        @IsClass
 0055640B    and         al,byte ptr [ebp+8]
>0055640E    je          00556474
 00556410    mov         eax,edi
 00556412    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 00556418    call        @IsClass
 0055641D    test        al,al
>0055641F    je          0055643D
 00556421    mov         edx,dword ptr [ebp-8]
 00556424    mov         eax,edi
 00556426    mov         ecx,dword ptr [eax]
 00556428    call        dword ptr [ecx+3C]
 0055642B    mov         edx,esi
 0055642D    mov         eax,edi
 0055642F    mov         ecx,dword ptr [eax]
 00556431    call        dword ptr [ecx+40]
 00556434    mov         eax,edi
 00556436    mov         edx,dword ptr [eax]
 00556438    call        dword ptr [edx+4C]
>0055643B    jmp         00556474
 0055643D    mov         eax,edi
 0055643F    mov         edx,dword ptr ds:[43B0FC];TCollection
 00556445    call        @IsClass
 0055644A    test        al,al
>0055644C    je          00556461
 0055644E    push        5564CC;'Item'
 00556453    mov         ecx,edi
 00556455    mov         edx,dword ptr [ebp-8]
 00556458    mov         eax,esi
 0055645A    call        TJvCustomAppStorage.WriteCollection
>0055645F    jmp         00556474
 00556461    movzx       eax,byte ptr [ebp+8]
 00556465    push        eax
 00556466    push        0
 00556468    mov         ecx,edi
 0055646A    mov         edx,dword ptr [ebp-8]
 0055646D    mov         eax,esi
 0055646F    call        TJvCustomAppStorage.WritePersistent
 00556474    xor         eax,eax
 00556476    pop         edx
 00556477    pop         ecx
 00556478    pop         ecx
 00556479    mov         dword ptr fs:[eax],edx
 0055647C    push        5564B1
 00556481    lea         eax,[ebp-2C]
 00556484    call        @UStrClr
 00556489    lea         eax,[ebp-28]
 0055648C    call        @VarClr
 00556491    lea         eax,[ebp-18]
 00556494    call        @UStrClr
 00556499    lea         eax,[ebp-14]
 0055649C    call        @WStrClr
 005564A1    lea         eax,[ebp-10]
 005564A4    call        @UStrClr
 005564A9    ret
>005564AA    jmp         @HandleFinally
>005564AF    jmp         00556481
 005564B1    pop         edi
 005564B2    pop         esi
 005564B3    pop         ebx
 005564B4    mov         esp,ebp
 005564B6    pop         ebp
 005564B7    ret         8
*}
end;

//005564D8
procedure TJvCustomAppStorage.ReadPersistent(Path:string; PersObj:TPersistent; IgnoreProperties:TStrings; ClearFirst:Boolean; Recursive:Boolean);
begin
{*
 005564D8    push        ebp
 005564D9    mov         ebp,esp
 005564DB    add         esp,0FFFFFFE0
 005564DE    push        ebx
 005564DF    push        esi
 005564E0    push        edi
 005564E1    xor         ebx,ebx
 005564E3    mov         dword ptr [ebp-4],ebx
 005564E6    mov         dword ptr [ebp-8],ebx
 005564E9    mov         dword ptr [ebp-0C],ebx
 005564EC    mov         dword ptr [ebp-10],ebx
 005564EF    mov         ebx,ecx
 005564F1    mov         dword ptr [ebp-14],edx
 005564F4    mov         esi,eax
 005564F6    xor         eax,eax
 005564F8    push        ebp
 005564F9    push        556607
 005564FE    push        dword ptr fs:[eax]
 00556501    mov         dword ptr fs:[eax],esp
 00556504    test        ebx,ebx
>00556506    je          005565E4
 0055650C    lea         eax,[ebp-10]
 0055650F    call        @IntfClear
 00556514    mov         ecx,eax
 00556516    mov         edx,556618;['{E3754817-49A3-4612-A228-5D44A088681D}']
 0055651B    mov         eax,ebx
 0055651D    call        Supports
 00556522    test        al,al
>00556524    je          00556533
 00556526    mov         ecx,dword ptr [ebp-14]
 00556529    mov         edx,esi
 0055652B    mov         eax,dword ptr [ebp-10]
 0055652E    mov         edi,dword ptr [eax]
 00556530    call        dword ptr [edi+0C]
 00556533    mov         edx,556618;['{E3754817-49A3-4612-A228-5D44A088681D}']
 00556538    mov         eax,ebx
 0055653A    call        004270E0
 0055653F    test        al,al
>00556541    je          00556557
 00556543    mov         edx,556628
 00556548    mov         eax,ebx
 0055654A    call        004270E0
 0055654F    test        al,al
>00556551    je          005565E4
 00556557    mov         edx,ebx
 00556559    mov         eax,esi
 0055655B    call        005516B8
 00556560    mov         edi,eax
 00556562    dec         edi
 00556563    test        edi,edi
>00556565    jl          005565E4
 00556567    inc         edi
 00556568    mov         dword ptr [ebp-18],0
 0055656F    lea         eax,[ebp-4]
 00556572    push        eax
 00556573    mov         ecx,dword ptr [ebp-18]
 00556576    mov         edx,ebx
 00556578    mov         eax,esi
 0055657A    call        005516D0
 0055657F    push        0
 00556581    lea         eax,[ebp-8]
 00556584    push        eax
 00556585    mov         ecx,dword ptr [ebp-4]
 00556588    mov         edx,ebx
 0055658A    mov         eax,esi
 0055658C    call        TJvCustomAppStorage.TranslatePropertyName
 00556591    lea         eax,[ebp-0C]
 00556594    push        eax
 00556595    mov         eax,dword ptr [ebp-14]
 00556598    mov         dword ptr [ebp-20],eax
 0055659B    mov         eax,dword ptr [ebp-8]
 0055659E    mov         dword ptr [ebp-1C],eax
 005565A1    lea         edx,[ebp-20]
 005565A4    mov         ecx,1
 005565A9    mov         eax,dword ptr [esi]
 005565AB    call        TJvCustomAppStorage.ConcatPaths
 005565B0    cmp         dword ptr [ebp+8],0
>005565B4    je          005565C4
 005565B6    mov         edx,dword ptr [ebp-4]
 005565B9    mov         eax,dword ptr [ebp+8]
 005565BC    mov         ecx,dword ptr [eax]
 005565BE    call        dword ptr [ecx+54];TStrings.IndexOf
 005565C1    inc         eax
>005565C2    jne         005565DE
 005565C4    mov         eax,dword ptr [ebp-4]
 005565C7    push        eax
 005565C8    movzx       eax,byte ptr [ebp+10]
 005565CC    push        eax
 005565CD    movzx       eax,byte ptr [ebp+0C]
 005565D1    push        eax
 005565D2    mov         ecx,ebx
 005565D4    mov         edx,dword ptr [ebp-0C]
 005565D7    mov         eax,esi
 005565D9    call        TJvCustomAppStorage.ReadProperty
 005565DE    inc         dword ptr [ebp-18]
 005565E1    dec         edi
>005565E2    jne         0055656F
 005565E4    xor         eax,eax
 005565E6    pop         edx
 005565E7    pop         ecx
 005565E8    pop         ecx
 005565E9    mov         dword ptr fs:[eax],edx
 005565EC    push        55660E
 005565F1    lea         eax,[ebp-10]
 005565F4    call        @IntfClear
 005565F9    lea         eax,[ebp-0C]
 005565FC    mov         edx,3
 00556601    call        @UStrArrayClr
 00556606    ret
>00556607    jmp         @HandleFinally
>0055660C    jmp         005565F1
 0055660E    pop         edi
 0055660F    pop         esi
 00556610    pop         ebx
 00556611    mov         esp,ebp
 00556613    pop         ebp
 00556614    ret         0C
*}
end;

//00556638
procedure TJvCustomAppStorage.WritePersistent(Path:string; PersObj:TPersistent; IgnoreProperties:TStrings; Recursive:Boolean);
begin
{*
 00556638    push        ebp
 00556639    mov         ebp,esp
 0055663B    add         esp,0FFFFFFE0
 0055663E    push        ebx
 0055663F    push        esi
 00556640    push        edi
 00556641    xor         ebx,ebx
 00556643    mov         dword ptr [ebp-4],ebx
 00556646    mov         dword ptr [ebp-8],ebx
 00556649    mov         dword ptr [ebp-0C],ebx
 0055664C    mov         dword ptr [ebp-10],ebx
 0055664F    mov         ebx,ecx
 00556651    mov         dword ptr [ebp-14],edx
 00556654    mov         esi,eax
 00556656    xor         eax,eax
 00556658    push        ebp
 00556659    push        556762
 0055665E    push        dword ptr fs:[eax]
 00556661    mov         dword ptr fs:[eax],esp
 00556664    test        ebx,ebx
>00556666    je          0055673F
 0055666C    lea         eax,[ebp-10]
 0055666F    call        @IntfClear
 00556674    mov         ecx,eax
 00556676    mov         edx,556774;['{E3754817-49A3-4612-A228-5D44A088681D}']
 0055667B    mov         eax,ebx
 0055667D    call        Supports
 00556682    test        al,al
>00556684    je          00556693
 00556686    mov         ecx,dword ptr [ebp-14]
 00556689    mov         edx,esi
 0055668B    mov         eax,dword ptr [ebp-10]
 0055668E    mov         edi,dword ptr [eax]
 00556690    call        dword ptr [edi+10]
 00556693    mov         edx,556774;['{E3754817-49A3-4612-A228-5D44A088681D}']
 00556698    mov         eax,ebx
 0055669A    call        004270E0
 0055669F    test        al,al
>005566A1    je          005566B7
 005566A3    mov         edx,556784
 005566A8    mov         eax,ebx
 005566AA    call        004270E0
 005566AF    test        al,al
>005566B1    je          0055673F
 005566B7    mov         edx,ebx
 005566B9    mov         eax,esi
 005566BB    call        005516B8
 005566C0    mov         edi,eax
 005566C2    dec         edi
 005566C3    test        edi,edi
>005566C5    jl          0055673F
 005566C7    inc         edi
 005566C8    mov         dword ptr [ebp-18],0
 005566CF    lea         eax,[ebp-4]
 005566D2    push        eax
 005566D3    mov         ecx,dword ptr [ebp-18]
 005566D6    mov         edx,ebx
 005566D8    mov         eax,esi
 005566DA    call        005516D0
 005566DF    push        0
 005566E1    lea         eax,[ebp-8]
 005566E4    push        eax
 005566E5    mov         ecx,dword ptr [ebp-4]
 005566E8    mov         edx,ebx
 005566EA    mov         eax,esi
 005566EC    call        TJvCustomAppStorage.TranslatePropertyName
 005566F1    lea         eax,[ebp-0C]
 005566F4    push        eax
 005566F5    mov         eax,dword ptr [ebp-14]
 005566F8    mov         dword ptr [ebp-20],eax
 005566FB    mov         eax,dword ptr [ebp-8]
 005566FE    mov         dword ptr [ebp-1C],eax
 00556701    lea         edx,[ebp-20]
 00556704    mov         ecx,1
 00556709    mov         eax,dword ptr [esi]
 0055670B    call        TJvCustomAppStorage.ConcatPaths
 00556710    cmp         dword ptr [ebp+8],0
>00556714    je          00556724
 00556716    mov         edx,dword ptr [ebp-4]
 00556719    mov         eax,dword ptr [ebp+8]
 0055671C    mov         ecx,dword ptr [eax]
 0055671E    call        dword ptr [ecx+54];TStrings.IndexOf
 00556721    inc         eax
>00556722    jne         00556739
 00556724    mov         eax,dword ptr [ebp-4]
 00556727    push        eax
 00556728    movzx       eax,byte ptr [ebp+0C]
 0055672C    push        eax
 0055672D    mov         ecx,ebx
 0055672F    mov         edx,dword ptr [ebp-0C]
 00556732    mov         eax,esi
 00556734    call        TJvCustomAppStorage.WriteProperty
 00556739    inc         dword ptr [ebp-18]
 0055673C    dec         edi
>0055673D    jne         005566CF
 0055673F    xor         eax,eax
 00556741    pop         edx
 00556742    pop         ecx
 00556743    pop         ecx
 00556744    mov         dword ptr fs:[eax],edx
 00556747    push        556769
 0055674C    lea         eax,[ebp-10]
 0055674F    call        @IntfClear
 00556754    lea         eax,[ebp-0C]
 00556757    mov         edx,3
 0055675C    call        @UStrArrayClr
 00556761    ret
>00556762    jmp         @HandleFinally
>00556767    jmp         0055674C
 00556769    pop         edi
 0055676A    pop         esi
 0055676B    pop         ebx
 0055676C    mov         esp,ebp
 0055676E    pop         ebp
 0055676F    ret         8
*}
end;

//00556794
{*procedure TJvCustomAppStorage.GetCharName(Ch:Char; ?:?);
begin
 00556794    push        ebp
 00556795    mov         ebp,esp
 00556797    push        0
 00556799    push        0
 0055679B    push        ebx
 0055679C    push        esi
 0055679D    mov         esi,ecx
 0055679F    mov         ebx,edx
 005567A1    xor         eax,eax
 005567A3    push        ebp
 005567A4    push        55680F
 005567A9    push        dword ptr fs:[eax]
 005567AC    mov         dword ptr fs:[eax],esp
 005567AF    mov         edx,55681C
 005567B4    mov         eax,ebx
 005567B6    call        CharInSet
 005567BB    test        al,al
>005567BD    je          005567DA
 005567BF    lea         eax,[ebp-4]
 005567C2    mov         edx,ebx
 005567C4    call        @UStrFromWChar
 005567C9    mov         ecx,dword ptr [ebp-4]
 005567CC    mov         eax,esi
 005567CE    mov         edx,556848;'Char_'
 005567D3    call        @UStrCat3
>005567D8    jmp         005567F4
 005567DA    lea         edx,[ebp-8]
 005567DD    movzx       eax,bx
 005567E0    call        IntToStr
 005567E5    mov         ecx,dword ptr [ebp-8]
 005567E8    mov         eax,esi
 005567EA    mov         edx,556860;'Char#'
 005567EF    call        @UStrCat3
 005567F4    xor         eax,eax
 005567F6    pop         edx
 005567F7    pop         ecx
 005567F8    pop         ecx
 005567F9    mov         dword ptr fs:[eax],edx
 005567FC    push        556816
 00556801    lea         eax,[ebp-8]
 00556804    mov         edx,2
 00556809    call        @UStrArrayClr
 0055680E    ret
>0055680F    jmp         @HandleFinally
>00556814    jmp         00556801
 00556816    pop         esi
 00556817    pop         ebx
 00556818    pop         ecx
 00556819    pop         ecx
 0055681A    pop         ebp
 0055681B    ret
end;*}

//0055686C
{*procedure TJvCustomAppStorage.GetIntName(Value:Integer; ?:?);
begin
 0055686C    push        ebp
 0055686D    mov         ebp,esp
 0055686F    push        0
 00556871    push        ebx
 00556872    push        esi
 00556873    mov         esi,ecx
 00556875    mov         ebx,edx
 00556877    xor         eax,eax
 00556879    push        ebp
 0055687A    push        5568B4
 0055687F    push        dword ptr fs:[eax]
 00556882    mov         dword ptr fs:[eax],esp
 00556885    lea         edx,[ebp-4]
 00556888    mov         eax,ebx
 0055688A    call        IntToStr
 0055688F    mov         ecx,dword ptr [ebp-4]
 00556892    mov         eax,esi
 00556894    mov         edx,5568CC;'Int_'
 00556899    call        @UStrCat3
 0055689E    xor         eax,eax
 005568A0    pop         edx
 005568A1    pop         ecx
 005568A2    pop         ecx
 005568A3    mov         dword ptr fs:[eax],edx
 005568A6    push        5568BB
 005568AB    lea         eax,[ebp-4]
 005568AE    call        @UStrClr
 005568B3    ret
>005568B4    jmp         @HandleFinally
>005568B9    jmp         005568AB
 005568BB    pop         esi
 005568BC    pop         ebx
 005568BD    pop         ecx
 005568BE    pop         ebp
 005568BF    ret
end;*}

//005568D8
{*procedure sub_005568D8(?:TJvCustomAppStorage; ?:?; ?:?);
begin
 005568D8    push        ebp
 005568D9    mov         ebp,esp
 005568DB    push        0
 005568DD    push        0
 005568DF    push        0
 005568E1    push        ebx
 005568E2    push        esi
 005568E3    mov         esi,ecx
 005568E5    mov         dword ptr [ebp-4],edx
 005568E8    mov         ebx,eax
 005568EA    mov         eax,dword ptr [ebp-4]
 005568ED    call        @UStrAddRef
 005568F2    xor         eax,eax
 005568F4    push        ebp
 005568F5    push        556977
 005568FA    push        dword ptr fs:[eax]
 005568FD    mov         dword ptr fs:[eax],esp
 00556900    cmp         word ptr [ebx+11A],0;TJvCustomAppStorage.?f11A:word
>00556908    je          0055694A
 0055690A    mov         eax,ebx
 0055690C    call        TJvCustomAppStorage.IsPropertyValueCryptEnabled
 00556911    test        al,al
>00556913    je          0055694A
 00556915    lea         edx,[ebp-4]
 00556918    mov         eax,dword ptr [ebx+11C];TJvCustomAppStorage.?f11C:dword
 0055691E    call        dword ptr [ebx+118];TJvCustomAppStorage.FOnEncryptPropertyValue
 00556924    lea         eax,[ebp-0C]
 00556927    mov         edx,dword ptr [ebp-4]
 0055692A    mov         ecx,0
 0055692F    call        @LStrFromUStr
 00556934    mov         eax,dword ptr [ebp-0C]
 00556937    lea         edx,[ebp-8]
 0055693A    call        0054C650
 0055693F    mov         edx,dword ptr [ebp-8]
 00556942    lea         eax,[ebp-4]
 00556945    call        @UStrFromLStr
 0055694A    mov         eax,esi
 0055694C    mov         edx,dword ptr [ebp-4]
 0055694F    call        @UStrAsg
 00556954    xor         eax,eax
 00556956    pop         edx
 00556957    pop         ecx
 00556958    pop         ecx
 00556959    mov         dword ptr fs:[eax],edx
 0055695C    push        55697E
 00556961    lea         eax,[ebp-0C]
 00556964    mov         edx,2
 00556969    call        @LStrArrayClr
 0055696E    lea         eax,[ebp-4]
 00556971    call        @UStrClr
 00556976    ret
>00556977    jmp         @HandleFinally
>0055697C    jmp         00556961
 0055697E    pop         esi
 0055697F    pop         ebx
 00556980    mov         esp,ebp
 00556982    pop         ebp
 00556983    ret
end;*}

//00556984
{*procedure sub_00556984(?:TJvCustomAppStorage; ?:?; ?:?);
begin
 00556984    push        ebp
 00556985    mov         ebp,esp
 00556987    push        0
 00556989    push        0
 0055698B    push        0
 0055698D    push        ebx
 0055698E    push        esi
 0055698F    mov         esi,ecx
 00556991    mov         dword ptr [ebp-4],edx
 00556994    mov         ebx,eax
 00556996    mov         eax,dword ptr [ebp-4]
 00556999    call        @UStrAddRef
 0055699E    xor         eax,eax
 005569A0    push        ebp
 005569A1    push        556A23
 005569A6    push        dword ptr fs:[eax]
 005569A9    mov         dword ptr fs:[eax],esp
 005569AC    cmp         word ptr [ebx+122],0;TJvCustomAppStorage.?f122:word
>005569B4    je          005569F6
 005569B6    mov         eax,ebx
 005569B8    call        TJvCustomAppStorage.IsPropertyValueCryptEnabled
 005569BD    test        al,al
>005569BF    je          005569F6
 005569C1    lea         eax,[ebp-0C]
 005569C4    mov         edx,dword ptr [ebp-4]
 005569C7    mov         ecx,0
 005569CC    call        @LStrFromUStr
 005569D1    mov         eax,dword ptr [ebp-0C]
 005569D4    lea         edx,[ebp-8]
 005569D7    call        0054C6A0
 005569DC    mov         edx,dword ptr [ebp-8]
 005569DF    lea         eax,[ebp-4]
 005569E2    call        @UStrFromLStr
 005569E7    lea         edx,[ebp-4]
 005569EA    mov         eax,dword ptr [ebx+124];TJvCustomAppStorage.?f124:dword
 005569F0    call        dword ptr [ebx+120];TJvCustomAppStorage.FOnDecryptPropertyValue
 005569F6    mov         eax,esi
 005569F8    mov         edx,dword ptr [ebp-4]
 005569FB    call        @UStrAsg
 00556A00    xor         eax,eax
 00556A02    pop         edx
 00556A03    pop         ecx
 00556A04    pop         ecx
 00556A05    mov         dword ptr fs:[eax],edx
 00556A08    push        556A2A
 00556A0D    lea         eax,[ebp-0C]
 00556A10    mov         edx,2
 00556A15    call        @LStrArrayClr
 00556A1A    lea         eax,[ebp-4]
 00556A1D    call        @UStrClr
 00556A22    ret
>00556A23    jmp         @HandleFinally
>00556A28    jmp         00556A0D
 00556A2A    pop         esi
 00556A2B    pop         ebx
 00556A2C    mov         esp,ebp
 00556A2E    pop         ebp
 00556A2F    ret
end;*}

//00556A30
{*procedure TJvCustomAppStorage.TranslatePropertyName(Instance:TPersistent; AName:string; ?:?; Reading:Boolean);
begin
 00556A30    push        ebp
 00556A31    mov         ebp,esp
 00556A33    add         esp,0FFFFFFF8
 00556A36    push        ebx
 00556A37    push        esi
 00556A38    push        edi
 00556A39    xor         ebx,ebx
 00556A3B    mov         dword ptr [ebp-8],ebx
 00556A3E    mov         dword ptr [ebp-4],ecx
 00556A41    mov         esi,edx
 00556A43    mov         edi,eax
 00556A45    mov         ebx,dword ptr [ebp+8]
 00556A48    xor         eax,eax
 00556A4A    push        ebp
 00556A4B    push        556AAF
 00556A50    push        dword ptr fs:[eax]
 00556A53    mov         dword ptr fs:[eax],esp
 00556A56    mov         eax,ebx
 00556A58    mov         edx,dword ptr [ebp-4]
 00556A5B    call        @UStrAsg
 00556A60    mov         eax,esi
 00556A62    mov         edx,dword ptr ds:[784A2C];0x0 gvar_00784A2C
 00556A68    call        @IsClass
 00556A6D    test        al,al
>00556A6F    je          00556A89
 00556A71    lea         ecx,[ebp-8]
 00556A74    mov         edx,dword ptr [ebx]
 00556A76    mov         eax,esi
 00556A78    mov         esi,dword ptr [eax]
 00556A7A    call        dword ptr [esi+5C]
 00556A7D    mov         edx,dword ptr [ebp-8]
 00556A80    mov         eax,ebx
 00556A82    call        @UStrAsg
>00556A87    jmp         00556A99
 00556A89    movzx       eax,byte ptr [ebp+0C]
 00556A8D    push        eax
 00556A8E    mov         ecx,ebx
 00556A90    mov         edx,esi
 00556A92    mov         eax,edi
 00556A94    call        00552C20
 00556A99    xor         eax,eax
 00556A9B    pop         edx
 00556A9C    pop         ecx
 00556A9D    pop         ecx
 00556A9E    mov         dword ptr fs:[eax],edx
 00556AA1    push        556AB6
 00556AA6    lea         eax,[ebp-8]
 00556AA9    call        @UStrClr
 00556AAE    ret
>00556AAF    jmp         @HandleFinally
>00556AB4    jmp         00556AA6
 00556AB6    pop         edi
 00556AB7    pop         esi
 00556AB8    pop         ebx
 00556AB9    pop         ecx
 00556ABA    pop         ecx
 00556ABB    pop         ebp
 00556ABC    ret         8
end;*}

//00556AC0
procedure TJvCustomAppMemoryFileStorage.SetReadOnly(Value:Boolean);
begin
{*
 00556AC0    mov         byte ptr [eax+144],dl;TJvCustomAppMemoryFileStorage.FReadOnly:Boolean
 00556AC6    ret
*}
end;

//00556AC8
{*function TJvCustomAppMemoryFileStorage.GetReadOnly:?;
begin
 00556AC8    push        ebx
 00556AC9    mov         ebx,eax
 00556ACB    test        byte ptr [ebx+1C],10;TJvCustomAppMemoryFileStorage.FComponentState:TComponentState
>00556ACF    je          00556ADA
 00556AD1    movzx       eax,byte ptr [ebx+144];TJvCustomAppMemoryFileStorage.FReadOnly:Boolean
 00556AD8    pop         ebx
 00556AD9    ret
 00556ADA    cmp         byte ptr [ebx+144],0;TJvCustomAppMemoryFileStorage.FReadOnly:Boolean
>00556AE1    jne         00556AF5
 00556AE3    mov         eax,ebx
 00556AE5    mov         edx,dword ptr [eax]
 00556AE7    call        dword ptr [edx+0D8];TJvCustomAppMemoryFileStorage.sub_00557CDC
 00556AED    test        al,al
>00556AEF    jne         00556AF5
 00556AF1    xor         eax,eax
>00556AF3    jmp         00556AF7
 00556AF5    mov         al,1
 00556AF7    pop         ebx
 00556AF8    ret
end;*}

//00556AFC
{*function sub_00556AFC:?;
begin
 00556AFC    xor         eax,eax
 00556AFE    ret
end;*}

//00556B00
procedure TJvCustomAppStorage.GetStoredValues(Path:string; Strings:TStrings; Options:TJvAppStorageEnumOptions);
begin
{*
 00556B00    push        ebp
 00556B01    mov         ebp,esp
 00556B03    add         esp,0FFFFFFE0
 00556B06    push        ebx
 00556B07    push        esi
 00556B08    push        edi
 00556B09    xor         ebx,ebx
 00556B0B    mov         dword ptr [ebp-20],ebx
 00556B0E    mov         dword ptr [ebp-1C],ebx
 00556B11    mov         dword ptr [ebp-4],ebx
 00556B14    mov         dword ptr [ebp-8],ebx
 00556B17    mov         dword ptr [ebp-0C],ecx
 00556B1A    mov         edi,edx
 00556B1C    mov         esi,eax
 00556B1E    mov         ebx,dword ptr [ebp+8]
 00556B21    xor         eax,eax
 00556B23    push        ebp
 00556B24    push        556C1E
 00556B29    push        dword ptr fs:[eax]
 00556B2C    mov         dword ptr fs:[eax],esp
 00556B2F    mov         eax,dword ptr [ebp-0C]
 00556B32    call        TStrings.BeginUpdate
 00556B37    xor         eax,eax
 00556B39    push        ebp
 00556B3A    push        556BEF
 00556B3F    push        dword ptr fs:[eax]
 00556B42    mov         dword ptr fs:[eax],esp
 00556B45    mov         eax,dword ptr [ebp-0C]
 00556B48    mov         edx,dword ptr [eax]
 00556B4A    call        dword ptr [edx+44];TStrings.Clear
 00556B4D    mov         dword ptr [ebp-10],edi
 00556B50    lea         eax,[ebp-10]
 00556B53    lea         ecx,[ebp-4]
 00556B56    xor         edx,edx
 00556B58    call        00550CD0
 00556B5D    test        bl,8
>00556B60    je          00556B75
 00556B62    mov         eax,dword ptr [ebp-0C]
 00556B65    push        eax
 00556B66    push        ebx
 00556B67    mov         ecx,dword ptr [ebp-4]
 00556B6A    xor         edx,edx
 00556B6C    mov         eax,esi
 00556B6E    call        00552854
>00556B73    jmp         00556BD9
 00556B75    lea         edx,[ebp-1C]
 00556B78    mov         eax,esi
 00556B7A    call        00552B8C
 00556B7F    mov         eax,dword ptr [ebp-1C]
 00556B82    mov         dword ptr [ebp-18],eax
 00556B85    mov         eax,dword ptr [ebp-4]
 00556B88    mov         dword ptr [ebp-14],eax
 00556B8B    lea         eax,[ebp-18]
 00556B8E    lea         ecx,[ebp-8]
 00556B91    mov         edx,1
 00556B96    call        00550CD0
 00556B9B    mov         eax,dword ptr [ebp-0C]
 00556B9E    push        eax
 00556B9F    push        ebx
 00556BA0    lea         eax,[ebp-20]
 00556BA3    mov         ecx,556C3C;'\'
 00556BA8    mov         edx,dword ptr [ebp-8]
 00556BAB    call        @UStrCat3
 00556BB0    mov         edx,dword ptr [ebp-20]
 00556BB3    mov         ecx,dword ptr [ebp-4]
 00556BB6    mov         eax,esi
 00556BB8    call        00552854
 00556BBD    mov         edx,dword ptr [ebp-8]
 00556BC0    mov         eax,dword ptr [ebp-0C]
 00556BC3    mov         ecx,dword ptr [eax]
 00556BC5    call        dword ptr [ecx+54];TStrings.IndexOf
 00556BC8    mov         esi,eax
 00556BCA    cmp         esi,0FFFFFFFF
>00556BCD    jle         00556BD9
 00556BCF    mov         edx,esi
 00556BD1    mov         eax,dword ptr [ebp-0C]
 00556BD4    mov         ecx,dword ptr [eax]
 00556BD6    call        dword ptr [ecx+48];TStrings.Delete
 00556BD9    xor         eax,eax
 00556BDB    pop         edx
 00556BDC    pop         ecx
 00556BDD    pop         ecx
 00556BDE    mov         dword ptr fs:[eax],edx
 00556BE1    push        556BF6
 00556BE6    mov         eax,dword ptr [ebp-0C]
 00556BE9    call        TStrings.EndUpdate
 00556BEE    ret
>00556BEF    jmp         @HandleFinally
>00556BF4    jmp         00556BE6
 00556BF6    xor         eax,eax
 00556BF8    pop         edx
 00556BF9    pop         ecx
 00556BFA    pop         ecx
 00556BFB    mov         dword ptr fs:[eax],edx
 00556BFE    push        556C25
 00556C03    lea         eax,[ebp-20]
 00556C06    mov         edx,2
 00556C0B    call        @UStrArrayClr
 00556C10    lea         eax,[ebp-8]
 00556C13    mov         edx,2
 00556C18    call        @UStrArrayClr
 00556C1D    ret
>00556C1E    jmp         @HandleFinally
>00556C23    jmp         00556C03
 00556C25    pop         edi
 00556C26    pop         esi
 00556C27    pop         ebx
 00556C28    mov         esp,ebp
 00556C2A    pop         ebp
 00556C2B    ret         4
*}
end;

//00556C40
procedure TJvCustomAppStorage.EnablePropertyValueCrypt;
begin
{*
 00556C40    inc         dword ptr [eax+128];TJvCustomAppStorage.FCryptEnabledStatus:Integer
 00556C46    ret
*}
end;

//00556C48
procedure TJvCustomAppStorage.DisablePropertyValueCrypt;
begin
{*
 00556C48    dec         dword ptr [eax+128];TJvCustomAppStorage.FCryptEnabledStatus:Integer
 00556C4E    ret
*}
end;

//00556C50
function TJvCustomAppStorage.IsPropertyValueCryptEnabled:Boolean;
begin
{*
 00556C50    cmp         dword ptr [eax+128],0;TJvCustomAppStorage.FCryptEnabledStatus:Integer
 00556C57    setg        al
 00556C5A    ret
*}
end;

//00556C5C
{*procedure TJvCustomAppStorage.ItemNameIndexPath(ItemName:string; Index:Integer; ?:?);
begin
 00556C5C    push        ebp
 00556C5D    mov         ebp,esp
 00556C5F    push        0
 00556C61    push        0
 00556C63    push        ebx
 00556C64    push        esi
 00556C65    push        edi
 00556C66    mov         esi,ecx
 00556C68    mov         ebx,edx
 00556C6A    mov         edi,dword ptr [ebp+8]
 00556C6D    xor         edx,edx
 00556C6F    push        ebp
 00556C70    push        556CDE
 00556C75    push        dword ptr fs:[edx]
 00556C78    mov         dword ptr fs:[edx],esp
 00556C7B    mov         eax,dword ptr [eax+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00556C81    cmp         byte ptr [eax+19],0;TJvCustomAppStorageOptions.FUseOldItemNameFormat:Boolean
>00556C85    je          00556C9F
 00556C87    lea         edx,[ebp-4]
 00556C8A    mov         eax,esi
 00556C8C    call        IntToStr
 00556C91    mov         ecx,dword ptr [ebp-4]
 00556C94    mov         eax,edi
 00556C96    mov         edx,ebx
 00556C98    call        @UStrCat3
>00556C9D    jmp         00556CC3
 00556C9F    push        ebx
 00556CA0    push        556CFC;'['
 00556CA5    lea         edx,[ebp-8]
 00556CA8    mov         eax,esi
 00556CAA    call        IntToStr
 00556CAF    push        dword ptr [ebp-8]
 00556CB2    push        556D0C;']'
 00556CB7    mov         eax,edi
 00556CB9    mov         edx,4
 00556CBE    call        @UStrCatN
 00556CC3    xor         eax,eax
 00556CC5    pop         edx
 00556CC6    pop         ecx
 00556CC7    pop         ecx
 00556CC8    mov         dword ptr fs:[eax],edx
 00556CCB    push        556CE5
 00556CD0    lea         eax,[ebp-8]
 00556CD3    mov         edx,2
 00556CD8    call        @UStrArrayClr
 00556CDD    ret
>00556CDE    jmp         @HandleFinally
>00556CE3    jmp         00556CD0
 00556CE5    pop         edi
 00556CE6    pop         esi
 00556CE7    pop         ebx
 00556CE8    pop         ecx
 00556CE9    pop         ecx
 00556CEA    pop         ebp
 00556CEB    ret         4
end;*}

//00556D10
procedure TJvCustomAppStorage.Loaded;
begin
{*
 00556D10    push        ebx
 00556D11    mov         ebx,eax
 00556D13    mov         eax,ebx
 00556D15    call        TComponent.Loaded
 00556D1A    mov         eax,ebx
 00556D1C    call        0055720C
 00556D21    test        al,al
>00556D23    jne         00556D2F
 00556D25    mov         eax,ebx
 00556D27    mov         edx,dword ptr [eax]
 00556D29    call        dword ptr [edx+0F0];TJvCustomAppStorage.Reload
 00556D2F    pop         ebx
 00556D30    ret
*}
end;

//00556D34
procedure TJvCustomAppStorage.BeginUpdate;
begin
{*
 00556D34    push        ebp
 00556D35    mov         ebp,esp
 00556D37    mov         ecx,18
 00556D3C    push        0
 00556D3E    push        0
 00556D40    dec         ecx
>00556D41    jne         00556D3C
 00556D43    push        ecx
 00556D44    push        ebx
 00556D45    push        esi
 00556D46    push        edi
 00556D47    mov         ebx,eax
 00556D49    xor         eax,eax
 00556D4B    push        ebp
 00556D4C    push        556DD1
 00556D51    push        dword ptr fs:[eax]
 00556D54    mov         dword ptr fs:[eax],esp
 00556D57    lea         edx,[ebp-0C4]
 00556D5D    mov         eax,ebx
 00556D5F    call        00557110
 00556D64    mov         eax,ebx
 00556D66    call        TJvCustomAppStorage.ReloadIfNeeded
 00556D6B    inc         dword ptr [ebx+130];TJvCustomAppStorage.FUpdateCount:Integer
 00556D71    mov         eax,dword ptr [ebx+108];TJvCustomAppStorage.FSubStorages:TJvAppSubStorages
 00556D77    call        TCollection.GetCount
 00556D7C    mov         edi,eax
 00556D7E    dec         edi
 00556D7F    test        edi,edi
>00556D81    jl          00556DB2
 00556D83    inc         edi
 00556D84    xor         esi,esi
 00556D86    mov         edx,esi
 00556D88    mov         eax,dword ptr [ebx+108];TJvCustomAppStorage.FSubStorages:TJvAppSubStorages
 00556D8E    call        00557550
 00556D93    cmp         dword ptr [eax+10],0
>00556D97    je          00556DAE
 00556D99    mov         edx,esi
 00556D9B    mov         eax,dword ptr [ebx+108];TJvCustomAppStorage.FSubStorages:TJvAppSubStorages
 00556DA1    call        00557550
 00556DA6    mov         eax,dword ptr [eax+10]
 00556DA9    call        TJvCustomAppStorage.BeginUpdate
 00556DAE    inc         esi
 00556DAF    dec         edi
>00556DB0    jne         00556D86
 00556DB2    xor         eax,eax
 00556DB4    pop         edx
 00556DB5    pop         ecx
 00556DB6    pop         ecx
 00556DB7    mov         dword ptr fs:[eax],edx
 00556DBA    push        556DD8
 00556DBF    lea         eax,[ebp-0C4]
 00556DC5    mov         edx,dword ptr ds:[41AB24];TFormatSettings
 00556DCB    call        @FinalizeRecord
 00556DD0    ret
>00556DD1    jmp         @HandleFinally
>00556DD6    jmp         00556DBF
 00556DD8    pop         edi
 00556DD9    pop         esi
 00556DDA    pop         ebx
 00556DDB    mov         esp,ebp
 00556DDD    pop         ebp
 00556DDE    ret
*}
end;

//00556DE0
procedure TJvCustomAppStorage.CheckDeletePathByVersion(Path:string; VersionNumber:Integer; VersionName:string; WriteVersionNumber:Boolean; DeleteIfNotEqual:Boolean);
begin
{*
 00556DE0    push        ebp
 00556DE1    mov         ebp,esp
 00556DE3    add         esp,0FFFFFFE4
 00556DE6    push        ebx
 00556DE7    push        esi
 00556DE8    push        edi
 00556DE9    xor         ebx,ebx
 00556DEB    mov         dword ptr [ebp-1C],ebx
 00556DEE    mov         dword ptr [ebp-10],ebx
 00556DF1    mov         dword ptr [ebp-4],ebx
 00556DF4    mov         dword ptr [ebp-8],ecx
 00556DF7    mov         ebx,edx
 00556DF9    mov         esi,eax
 00556DFB    mov         edi,dword ptr [ebp+8]
 00556DFE    xor         eax,eax
 00556E00    push        ebp
 00556E01    push        556F18
 00556E06    push        dword ptr fs:[eax]
 00556E09    mov         dword ptr fs:[eax],esp
 00556E0C    lea         eax,[ebp-4]
 00556E0F    call        @UStrClr
 00556E14    push        eax
 00556E15    lea         ecx,[ebp-0C]
 00556E18    mov         edx,ebx
 00556E1A    mov         eax,esi
 00556E1C    call        TJvCustomAppStorage.ResolvePath
 00556E21    mov         eax,dword ptr [ebp-0C]
 00556E24    call        TJvCustomAppMemoryFileStorage.GetReadOnly
 00556E29    test        al,al
>00556E2B    jne         00556EF2
 00556E31    test        edi,edi
>00556E33    je          00556EF2
 00556E39    mov         eax,dword ptr [ebp-0C]
 00556E3C    call        TJvCustomAppStorage.BeginUpdate
 00556E41    xor         eax,eax
 00556E43    push        ebp
 00556E44    push        556EEB
 00556E49    push        dword ptr fs:[eax]
 00556E4C    mov         dword ptr fs:[eax],esp
 00556E4F    lea         eax,[ebp-10]
 00556E52    push        eax
 00556E53    mov         dword ptr [ebp-18],ebx
 00556E56    mov         dword ptr [ebp-14],edi
 00556E59    lea         edx,[ebp-18]
 00556E5C    mov         eax,dword ptr [ebp-0C]
 00556E5F    mov         eax,dword ptr [eax]
 00556E61    mov         ecx,1
 00556E66    call        TJvCustomAppStorage.ConcatPaths
 00556E6B    mov         edx,dword ptr [ebp-10]
 00556E6E    xor         ecx,ecx
 00556E70    mov         eax,dword ptr [ebp-0C]
 00556E73    call        TJvCustomAppStorage.ReadInteger
 00556E78    mov         esi,eax
 00556E7A    cmp         byte ptr [ebp+10],0
>00556E7E    je          00556E91
 00556E80    cmp         esi,dword ptr [ebp-8]
>00556E83    je          00556E91
 00556E85    mov         edx,ebx
 00556E87    mov         eax,dword ptr [ebp-0C]
 00556E8A    call        TJvCustomAppStorage.DeleteSubTree
>00556E8F    jmp         00556EA0
 00556E91    cmp         esi,dword ptr [ebp-8]
>00556E94    jge         00556EA0
 00556E96    mov         edx,ebx
 00556E98    mov         eax,dword ptr [ebp-0C]
 00556E9B    call        TJvCustomAppStorage.DeleteSubTree
 00556EA0    cmp         esi,dword ptr [ebp-8]
 00556EA3    setne       al
 00556EA6    and         al,byte ptr [ebp+0C]
>00556EA9    je          00556ED5
 00556EAB    lea         eax,[ebp-1C]
 00556EAE    push        eax
 00556EAF    mov         dword ptr [ebp-18],ebx
 00556EB2    mov         dword ptr [ebp-14],edi
 00556EB5    lea         edx,[ebp-18]
 00556EB8    mov         eax,dword ptr [ebp-0C]
 00556EBB    mov         eax,dword ptr [eax]
 00556EBD    mov         ecx,1
 00556EC2    call        TJvCustomAppStorage.ConcatPaths
 00556EC7    mov         edx,dword ptr [ebp-1C]
 00556ECA    mov         ecx,dword ptr [ebp-8]
 00556ECD    mov         eax,dword ptr [ebp-0C]
 00556ED0    call        TJvCustomAppStorage.WriteInteger
 00556ED5    xor         eax,eax
 00556ED7    pop         edx
 00556ED8    pop         ecx
 00556ED9    pop         ecx
 00556EDA    mov         dword ptr fs:[eax],edx
 00556EDD    push        556EF2
 00556EE2    mov         eax,dword ptr [ebp-0C]
 00556EE5    call        TJvCustomAppStorage.EndUpdate
 00556EEA    ret
>00556EEB    jmp         @HandleFinally
>00556EF0    jmp         00556EE2
 00556EF2    xor         eax,eax
 00556EF4    pop         edx
 00556EF5    pop         ecx
 00556EF6    pop         ecx
 00556EF7    mov         dword ptr fs:[eax],edx
 00556EFA    push        556F1F
 00556EFF    lea         eax,[ebp-1C]
 00556F02    call        @UStrClr
 00556F07    lea         eax,[ebp-10]
 00556F0A    call        @UStrClr
 00556F0F    lea         eax,[ebp-4]
 00556F12    call        @UStrClr
 00556F17    ret
>00556F18    jmp         @HandleFinally
>00556F1D    jmp         00556EFF
 00556F1F    pop         edi
 00556F20    pop         esi
 00556F21    pop         ebx
 00556F22    mov         esp,ebp
 00556F24    pop         ebp
 00556F25    ret         0C
*}
end;

//00556F28
{*procedure sub_00556F28(?:?);
begin
 00556F28    push        ebp
 00556F29    mov         ebp,esp
 00556F2B    mov         ecx,1A
 00556F30    push        0
 00556F32    push        0
 00556F34    dec         ecx
>00556F35    jne         00556F30
 00556F37    push        ecx
 00556F38    push        ebx
 00556F39    push        esi
 00556F3A    push        edi
 00556F3B    mov         dword ptr [ebp-4],edx
 00556F3E    mov         ebx,eax
 00556F40    mov         eax,dword ptr [ebp-4]
 00556F43    call        @UStrAddRef
 00556F48    xor         eax,eax
 00556F4A    push        ebp
 00556F4B    push        556FF0
 00556F50    push        dword ptr fs:[eax]
 00556F53    mov         dword ptr fs:[eax],esp
 00556F56    mov         eax,dword ptr [ebx+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 00556F5C    cmp         byte ptr [eax+1A],0;TJvCustomAppStorageOptions.FUseTranslateStringEngineDateTimeFormats:...
>00556F60    je          00556FBD
 00556F62    xor         edx,edx
 00556F64    push        ebp
 00556F65    push        556F99
 00556F6A    push        dword ptr fs:[edx]
 00556F6D    mov         dword ptr fs:[edx],esp
 00556F70    lea         edx,[ebp-0D4]
 00556F76    mov         eax,ebx
 00556F78    call        00557110
 00556F7D    lea         edx,[ebp-0D4]
 00556F83    mov         eax,dword ptr [ebp-4]
 00556F86    call        StrToTime
 00556F8B    fstp        qword ptr [ebp-10]
 00556F8E    wait
 00556F8F    xor         eax,eax
 00556F91    pop         edx
 00556F92    pop         ecx
 00556F93    pop         ecx
 00556F94    mov         dword ptr fs:[eax],edx
>00556F97    jmp         00556FC9
>00556F99    jmp         @HandleOnException
 00556F9E    dd          1
 00556FA2    dd          0041A0BC;EConvertError
 00556FA6    dd          00556FAA
 00556FAA    mov         eax,dword ptr [ebp-4]
 00556FAD    call        StrToDate
 00556FB2    fstp        qword ptr [ebp-10]
 00556FB5    wait
 00556FB6    call        @DoneExcept
>00556FBB    jmp         00556FC9
 00556FBD    mov         eax,dword ptr [ebp-4]
 00556FC0    call        StrToDate
 00556FC5    fstp        qword ptr [ebp-10]
 00556FC8    wait
 00556FC9    xor         eax,eax
 00556FCB    pop         edx
 00556FCC    pop         ecx
 00556FCD    pop         ecx
 00556FCE    mov         dword ptr fs:[eax],edx
 00556FD1    push        556FF7
 00556FD6    lea         eax,[ebp-0D4]
 00556FDC    mov         edx,dword ptr ds:[41AB24];TFormatSettings
 00556FE2    call        @FinalizeRecord
 00556FE7    lea         eax,[ebp-4]
 00556FEA    call        @UStrClr
 00556FEF    ret
>00556FF0    jmp         @HandleFinally
>00556FF5    jmp         00556FD6
 00556FF7    fld         qword ptr [ebp-10]
 00556FFA    pop         edi
 00556FFB    pop         esi
 00556FFC    pop         ebx
 00556FFD    mov         esp,ebp
 00556FFF    pop         ebp
 00557000    ret
end;*}

//00557004
{*procedure sub_00557004(?:?; ?:?; ?:?);
begin
 00557004    push        ebp
 00557005    mov         ebp,esp
 00557007    mov         ecx,18
 0055700C    push        0
 0055700E    push        0
 00557010    dec         ecx
>00557011    jne         0055700C
 00557013    push        ecx
 00557014    push        ebx
 00557015    push        esi
 00557016    mov         esi,edx
 00557018    mov         ebx,eax
 0055701A    xor         eax,eax
 0055701C    push        ebp
 0055701D    push        557082
 00557022    push        dword ptr fs:[eax]
 00557025    mov         dword ptr fs:[eax],esp
 00557028    mov         eax,dword ptr [ebx+104];TJvCustomAppStorage.FStorageOptions:TJvCustomAppStorageOptions
 0055702E    cmp         byte ptr [eax+1A],0;TJvCustomAppStorageOptions.FUseTranslateStringEngineDateTimeFormats:...
>00557032    je          00557056
 00557034    push        dword ptr [ebp+0C]
 00557037    push        dword ptr [ebp+8]
 0055703A    lea         edx,[ebp-0C4]
 00557040    mov         eax,ebx
 00557042    call        00557110
 00557047    lea         eax,[ebp-0C4]
 0055704D    mov         edx,esi
 0055704F    call        DateTimeToStr
>00557054    jmp         00557063
 00557056    push        dword ptr [ebp+0C]
 00557059    push        dword ptr [ebp+8]
 0055705C    mov         eax,esi
 0055705E    call        CurrToStr
 00557063    xor         eax,eax
 00557065    pop         edx
 00557066    pop         ecx
 00557067    pop         ecx
 00557068    mov         dword ptr fs:[eax],edx
 0055706B    push        557089
 00557070    lea         eax,[ebp-0C4]
 00557076    mov         edx,dword ptr ds:[41AB24];TFormatSettings
 0055707C    call        @FinalizeRecord
 00557081    ret
>00557082    jmp         @HandleFinally
>00557087    jmp         00557070
 00557089    pop         esi
 0055708A    pop         ebx
 0055708B    mov         esp,ebp
 0055708D    pop         ebp
 0055708E    ret         8
end;*}

//00557094
procedure TJvCustomAppStorage.EndUpdate;
begin
{*
 00557094    push        ebx
 00557095    push        esi
 00557096    push        edi
 00557097    mov         ebx,eax
 00557099    mov         eax,dword ptr [ebx+108];TJvCustomAppStorage.FSubStorages:TJvAppSubStorages
 0055709F    call        TCollection.GetCount
 005570A4    mov         edi,eax
 005570A6    dec         edi
 005570A7    test        edi,edi
>005570A9    jl          005570DA
 005570AB    inc         edi
 005570AC    xor         esi,esi
 005570AE    mov         edx,esi
 005570B0    mov         eax,dword ptr [ebx+108];TJvCustomAppStorage.FSubStorages:TJvAppSubStorages
 005570B6    call        00557550
 005570BB    cmp         dword ptr [eax+10],0
>005570BF    je          005570D6
 005570C1    mov         edx,esi
 005570C3    mov         eax,dword ptr [ebx+108];TJvCustomAppStorage.FSubStorages:TJvAppSubStorages
 005570C9    call        00557550
 005570CE    mov         eax,dword ptr [eax+10]
 005570D1    call        TJvCustomAppStorage.EndUpdate
 005570D6    inc         esi
 005570D7    dec         edi
>005570D8    jne         005570AE
 005570DA    dec         dword ptr [ebx+130];TJvCustomAppStorage.FUpdateCount:Integer
 005570E0    mov         eax,ebx
 005570E2    call        TJvCustomAppStorage.FlushIfNeeded
 005570E7    cmp         dword ptr [ebx+130],0;TJvCustomAppStorage.FUpdateCount:Integer
>005570EE    jge         005570F8
 005570F0    xor         eax,eax
 005570F2    mov         dword ptr [ebx+130],eax;TJvCustomAppStorage.FUpdateCount:Integer
 005570F8    pop         edi
 005570F9    pop         esi
 005570FA    pop         ebx
 005570FB    ret
*}
end;

//005570FC
{*function TJvCustomAppStorage.GetActiveTranslateStringEngine:?;
begin
 005570FC    mov         edx,dword ptr [eax+150];TJvCustomAppStorage.FTranslateStringEngine:TJvTranslateString
 00557102    test        edx,edx
>00557104    je          00557109
 00557106    mov         eax,edx
 00557108    ret
 00557109    mov         eax,dword ptr [eax+140];TJvCustomAppStorage.FInternalTranslateStringEngine:TJvTranslateS...
 0055710F    ret
end;*}

//00557110
{*procedure sub_00557110(?:TJvCustomAppStorage; ?:?);
begin
 00557110    push        ebp
 00557111    mov         ebp,esp
 00557113    mov         ecx,18
 00557118    push        0
 0055711A    push        0
 0055711C    dec         ecx
>0055711D    jne         00557118
 0055711F    push        ecx
 00557120    push        ebx
 00557121    push        esi
 00557122    mov         esi,edx
 00557124    mov         ebx,eax
 00557126    xor         eax,eax
 00557128    push        ebp
 00557129    push        5571FE
 0055712E    push        dword ptr fs:[eax]
 00557131    mov         dword ptr fs:[eax],esp
 00557134    mov         eax,ebx
 00557136    call        0055720C
 0055713B    test        al,al
>0055713D    jne         005571CF
 00557143    lea         eax,[ebp-0C4]
 00557149    call        TFormatSettings.Create
 0055714E    lea         edx,[ebp-0C4]
 00557154    lea         eax,[ebx+38];TJvCustomAppStorage.CachedFormatSettings:TFormatSettings
 00557157    mov         ecx,dword ptr ds:[41AB24];TFormatSettings
 0055715D    call        @CopyRecord
 00557162    mov         eax,ebx
 00557164    call        TJvCustomAppStorage.GetActiveTranslateStringEngine
 00557169    test        eax,eax
>0055716B    je          005571CF
 0055716D    mov         eax,ebx
 0055716F    call        TJvCustomAppStorage.GetActiveTranslateStringEngine
 00557174    cmp         dword ptr [eax+58],0
>00557178    je          0055719E
 0055717A    mov         eax,ebx
 0055717C    call        TJvCustomAppStorage.GetActiveTranslateStringEngine
 00557181    mov         edx,dword ptr [eax+58]
 00557184    lea         eax,[ebx+44];TJvCustomAppStorage.CachedFormatSettings.ShortDateFormat:UnicodeString
 00557187    call        @UStrAsg
 0055718C    mov         eax,ebx
 0055718E    call        TJvCustomAppStorage.GetActiveTranslateStringEngine
 00557193    mov         edx,dword ptr [eax+58]
 00557196    lea         eax,[ebx+48];TJvCustomAppStorage.CachedFormatSettings.LongDateFormat:UnicodeString
 00557199    call        @UStrAsg
 0055719E    mov         eax,ebx
 005571A0    call        TJvCustomAppStorage.GetActiveTranslateStringEngine
 005571A5    cmp         dword ptr [eax+68],0
>005571A9    je          005571CF
 005571AB    mov         eax,ebx
 005571AD    call        TJvCustomAppStorage.GetActiveTranslateStringEngine
 005571B2    mov         edx,dword ptr [eax+68]
 005571B5    lea         eax,[ebx+54];TJvCustomAppStorage.CachedFormatSettings.ShortTimeFormat:UnicodeString
 005571B8    call        @UStrAsg
 005571BD    mov         eax,ebx
 005571BF    call        TJvCustomAppStorage.GetActiveTranslateStringEngine
 005571C4    mov         edx,dword ptr [eax+68]
 005571C7    lea         eax,[ebx+58];TJvCustomAppStorage.CachedFormatSettings.LongTimeFormat:UnicodeString
 005571CA    call        @UStrAsg
 005571CF    mov         eax,esi
 005571D1    lea         edx,[ebx+38];TJvCustomAppStorage.CachedFormatSettings:TFormatSettings
 005571D4    mov         ecx,dword ptr ds:[41AB24];TFormatSettings
 005571DA    call        @CopyRecord
 005571DF    xor         eax,eax
 005571E1    pop         edx
 005571E2    pop         ecx
 005571E3    pop         ecx
 005571E4    mov         dword ptr fs:[eax],edx
 005571E7    push        557205
 005571EC    lea         eax,[ebp-0C4]
 005571F2    mov         edx,dword ptr ds:[41AB24];TFormatSettings
 005571F8    call        @FinalizeRecord
 005571FD    ret
>005571FE    jmp         @HandleFinally
>00557203    jmp         005571EC
 00557205    pop         esi
 00557206    pop         ebx
 00557207    mov         esp,ebp
 00557209    pop         ebp
 0055720A    ret
end;*}

//0055720C
function sub_0055720C(?:TJvCustomAppStorage):Boolean;
begin
{*
 0055720C    cmp         dword ptr [eax+130],0;TJvCustomAppStorage.FUpdateCount:Integer
 00557213    setne       al
 00557216    ret
*}
end;

//00557218
{*function sub_00557218(?:?):?;
begin
 00557218    push        ebp
 00557219    mov         ebp,esp
 0055721B    add         esp,0FFFFFFF4
 0055721E    push        ebx
 0055721F    push        esi
 00557220    xor         ebx,ebx
 00557222    mov         dword ptr [ebp-4],ebx
 00557225    mov         esi,edx
 00557227    mov         ebx,eax
 00557229    xor         eax,eax
 0055722B    push        ebp
 0055722C    push        557279
 00557231    push        dword ptr fs:[eax]
 00557234    mov         dword ptr fs:[eax],esp
 00557237    lea         eax,[ebp-4]
 0055723A    push        eax
 0055723B    mov         dword ptr [ebp-0C],esi
 0055723E    mov         eax,557294;'Count'
 00557243    mov         dword ptr [ebp-8],eax
 00557246    lea         edx,[ebp-0C]
 00557249    mov         ecx,1
 0055724E    mov         eax,dword ptr [ebx]
 00557250    call        TJvCustomAppStorage.ConcatPaths
 00557255    mov         edx,dword ptr [ebp-4]
 00557258    xor         ecx,ecx
 0055725A    mov         eax,ebx
 0055725C    call        TJvCustomAppStorage.ReadInteger
 00557261    mov         ebx,eax
 00557263    xor         eax,eax
 00557265    pop         edx
 00557266    pop         ecx
 00557267    pop         ecx
 00557268    mov         dword ptr fs:[eax],edx
 0055726B    push        557280
 00557270    lea         eax,[ebp-4]
 00557273    call        @UStrClr
 00557278    ret
>00557279    jmp         @HandleFinally
>0055727E    jmp         00557270
 00557280    mov         eax,ebx
 00557282    pop         esi
 00557283    pop         ebx
 00557284    mov         esp,ebp
 00557286    pop         ebp
 00557287    ret
end;*}

//005572A0
{*procedure sub_005572A0(?:TJvAppIniFileStorage; ?:TFileName; ?:?; ?:?);
begin
 005572A0    push        ebp
 005572A1    mov         ebp,esp
 005572A3    mov         ecx,4
 005572A8    push        0
 005572AA    push        0
 005572AC    dec         ecx
>005572AD    jne         005572A8
 005572AF    push        ecx
 005572B0    mov         dword ptr [ebp-4],edx
 005572B3    mov         eax,dword ptr [ebp-4]
 005572B6    call        @UStrAddRef
 005572BB    xor         eax,eax
 005572BD    push        ebp
 005572BE    push        55740B
 005572C3    push        dword ptr fs:[eax]
 005572C6    mov         dword ptr fs:[eax],esp
 005572C9    cmp         word ptr [ebp+0A],0
>005572CE    je          005573D0
 005572D4    push        0
 005572D6    lea         edx,[ebp-18]
 005572D9    mov         eax,[0078D6AC];^SResString325:TResStringRec
 005572DE    call        LoadResString
 005572E3    lea         eax,[ebp-18]
 005572E6    mov         edx,dword ptr [ebp-4]
 005572E9    call        @UStrCat
 005572EE    mov         edx,dword ptr [ebp-18]
 005572F1    lea         eax,[ebp-14]
 005572F4    mov         ecx,0
 005572F9    call        @LStrFromUStr
 005572FE    mov         eax,dword ptr [ebp-14]
 00557301    lea         edx,[ebp-10]
 00557304    call        0054CABC
 00557309    mov         edx,dword ptr [ebp-10]
 0055730C    lea         eax,[ebp-0C]
 0055730F    call        @UStrFromLStr
 00557314    mov         eax,dword ptr [ebp-0C]
 00557317    push        eax
 00557318    xor         ecx,ecx
 0055731A    mov         dl,1
 0055731C    mov         eax,[005379D0];TJclMutex
 00557321    call        TJclMutex.Create;TJclMutex.Create
 00557326    mov         dword ptr [ebp-8],eax
 00557329    xor         eax,eax
 0055732B    push        ebp
 0055732C    push        5573C9
 00557331    push        dword ptr fs:[eax]
 00557334    mov         dword ptr fs:[eax],esp
 00557337    mov         eax,dword ptr [ebp-8]
 0055733A    call        TJclDispatcherObject.WaitForever
 0055733F    cmp         al,3
>00557341    jne         00557374
 00557343    xor         eax,eax
 00557345    push        ebp
 00557346    push        55736D
 0055734B    push        dword ptr fs:[eax]
 0055734E    mov         dword ptr fs:[eax],esp
 00557351    mov         eax,dword ptr [ebp+0C]
 00557354    call        dword ptr [ebp+8]
 00557357    xor         eax,eax
 00557359    pop         edx
 0055735A    pop         ecx
 0055735B    pop         ecx
 0055735C    mov         dword ptr fs:[eax],edx
 0055735F    push        5573B3
 00557364    mov         eax,dword ptr [ebp-8]
 00557367    call        TJclMutex.Release
 0055736C    ret
>0055736D    jmp         @HandleFinally
>00557372    jmp         00557364
 00557374    lea         edx,[ebp-24]
 00557377    mov         eax,[0078D6AC];^SResString325:TResStringRec
 0055737C    call        LoadResString
 00557381    lea         eax,[ebp-24]
 00557384    mov         edx,dword ptr [ebp-4]
 00557387    call        @UStrCat
 0055738C    mov         eax,dword ptr [ebp-24]
 0055738F    mov         dword ptr [ebp-20],eax
 00557392    mov         byte ptr [ebp-1C],11
 00557396    lea         eax,[ebp-20]
 00557399    push        eax
 0055739A    push        0
 0055739C    mov         ecx,dword ptr ds:[78D9CC];^SResString324:TResStringRec
 005573A2    mov         dl,1
 005573A4    mov         eax,[00418C04];Exception
 005573A9    call        Exception.CreateResFmt;Exception.Create
 005573AE    call        @RaiseExcept
 005573B3    xor         eax,eax
 005573B5    pop         edx
 005573B6    pop         ecx
 005573B7    pop         ecx
 005573B8    mov         dword ptr fs:[eax],edx
 005573BB    push        5573D0
 005573C0    lea         eax,[ebp-8]
 005573C3    call        FreeAndNil
 005573C8    ret
>005573C9    jmp         @HandleFinally
>005573CE    jmp         005573C0
 005573D0    xor         eax,eax
 005573D2    pop         edx
 005573D3    pop         ecx
 005573D4    pop         ecx
 005573D5    mov         dword ptr fs:[eax],edx
 005573D8    push        557412
 005573DD    lea         eax,[ebp-24]
 005573E0    call        @UStrClr
 005573E5    lea         eax,[ebp-18]
 005573E8    call        @UStrClr
 005573ED    lea         eax,[ebp-14]
 005573F0    mov         edx,2
 005573F5    call        @LStrArrayClr
 005573FA    lea         eax,[ebp-0C]
 005573FD    call        @UStrClr
 00557402    lea         eax,[ebp-4]
 00557405    call        @UStrClr
 0055740A    ret
>0055740B    jmp         @HandleFinally
>00557410    jmp         005573DD
 00557412    mov         esp,ebp
 00557414    pop         ebp
 00557415    ret         8
end;*}

//00557418
{*procedure sub_00557418(?:?; ?:?);
begin
 00557418    push        ebp
 00557419    mov         ebp,esp
 0055741B    add         esp,0FFFFFFF4
 0055741E    push        ebx
 0055741F    push        esi
 00557420    push        edi
 00557421    xor         ebx,ebx
 00557423    mov         dword ptr [ebp-4],ebx
 00557426    mov         edi,ecx
 00557428    mov         esi,edx
 0055742A    mov         ebx,eax
 0055742C    xor         eax,eax
 0055742E    push        ebp
 0055742F    push        55747A
 00557434    push        dword ptr fs:[eax]
 00557437    mov         dword ptr fs:[eax],esp
 0055743A    lea         eax,[ebp-4]
 0055743D    push        eax
 0055743E    mov         dword ptr [ebp-0C],esi
 00557441    mov         eax,557498;'Count'
 00557446    mov         dword ptr [ebp-8],eax
 00557449    lea         edx,[ebp-0C]
 0055744C    mov         ecx,1
 00557451    mov         eax,dword ptr [ebx]
 00557453    call        TJvCustomAppStorage.ConcatPaths
 00557458    mov         edx,dword ptr [ebp-4]
 0055745B    mov         ecx,edi
 0055745D    mov         eax,ebx
 0055745F    call        TJvCustomAppStorage.WriteInteger
 00557464    xor         eax,eax
 00557466    pop         edx
 00557467    pop         ecx
 00557468    pop         ecx
 00557469    mov         dword ptr fs:[eax],edx
 0055746C    push        557481
 00557471    lea         eax,[ebp-4]
 00557474    call        @UStrClr
 00557479    ret
>0055747A    jmp         @HandleFinally
>0055747F    jmp         00557471
 00557481    pop         edi
 00557482    pop         esi
 00557483    pop         ebx
 00557484    mov         esp,ebp
 00557486    pop         ebp
 00557487    ret         4
end;*}

//005574A4
procedure TJvCustomAppStorage.SetTranslateStringEngine(Value:TJvTranslateString);
begin
{*
 005574A4    lea         ecx,[eax+150];TJvCustomAppStorage.FTranslateStringEngine:TJvTranslateString
 005574AA    call        0056D000
 005574AF    ret
*}
end;

//005574B0
{*procedure TJvCustomAppStorage.ReadWideString(Path:string; Default:WideString; ?:?);
begin
 005574B0    push        ebp
 005574B1    mov         ebp,esp
 005574B3    push        ecx
 005574B4    push        ebx
 005574B5    push        esi
 005574B6    mov         dword ptr [ebp-4],ecx
 005574B9    mov         esi,edx
 005574BB    mov         ebx,eax
 005574BD    mov         eax,dword ptr [ebp+8]
 005574C0    push        eax
 005574C1    mov         ecx,dword ptr [ebp-4]
 005574C4    mov         edx,esi
 005574C6    mov         eax,ebx
 005574C8    mov         ebx,dword ptr [eax]
 005574CA    call        dword ptr [ebx+78];TJvCustomAppStorage.sub_00552D7C
 005574CD    pop         esi
 005574CE    pop         ebx
 005574CF    pop         ecx
 005574D0    pop         ebp
 005574D1    ret         4
end;*}

//005574D4
{*procedure sub_005574D4(?:TJvCustomAppStorage; ?:?; ?:?);
begin
 005574D4    push        ebp
 005574D5    mov         ebp,esp
 005574D7    mov         edx,dword ptr [ebp+8]
 005574DA    mov         dword ptr [eax+138],edx;TJvCustomAppStorage.FCurrentInstanceCreateEvent:TJvAppStorageObj...
 005574E0    mov         edx,dword ptr [ebp+0C]
 005574E3    mov         dword ptr [eax+13C],edx;TJvCustomAppStorage.?f13C:dword
 005574E9    pop         ebp
 005574EA    ret         8
end;*}

//005574F0
procedure TJvCustomAppStorage.WriteWideString(Path:string; Value:WideString);
begin
{*
 005574F0    push        ebx
 005574F1    push        esi
 005574F2    mov         esi,eax
 005574F4    mov         eax,esi
 005574F6    mov         ebx,dword ptr [eax]
 005574F8    call        dword ptr [ebx+7C];TJvCustomAppStorage.sub_00552E34
 005574FB    pop         esi
 005574FC    pop         ebx
 005574FD    ret
*}
end;

//00557500
constructor TJvAppSubStorages.Create(AOwner:TJvCustomAppStorage);
begin
{*
 00557500    push        ebx
 00557501    push        esi
 00557502    test        dl,dl
>00557504    je          0055750E
 00557506    add         esp,0FFFFFFF0
 00557509    call        @ClassCreate
 0055750E    mov         ebx,edx
 00557510    mov         esi,eax
 00557512    mov         eax,[0055018C];TJvAppSubStorage
 00557517    push        eax
 00557518    xor         edx,edx
 0055751A    mov         eax,esi
 0055751C    call        TOwnedCollection.Create
 00557521    mov         eax,esi
 00557523    test        bl,bl
>00557525    je          00557536
 00557527    call        @AfterConstruction
 0055752C    pop         dword ptr fs:[0]
 00557533    add         esp,0C
 00557536    mov         eax,esi
 00557538    pop         esi
 00557539    pop         ebx
 0055753A    ret
*}
end;

//0055753C
{*procedure sub_0055753C(?:?);
begin
 0055753C    push        ebx
 0055753D    push        esi
 0055753E    mov         ebx,eax
 00557540    mov         eax,ebx
 00557542    mov         si,0FFFF
 00557546    call        @CallDynaInst
 0055754B    pop         esi
 0055754C    pop         ebx
 0055754D    ret
end;*}

//00557550
{*function sub_00557550(?:TJvAppSubStorages; ?:?):?;
begin
 00557550    push        ebx
 00557551    push        esi
 00557552    mov         esi,edx
 00557554    mov         ebx,eax
 00557556    mov         edx,esi
 00557558    mov         eax,ebx
 0055755A    call        TCollection.GetItem
 0055755F    pop         esi
 00557560    pop         ebx
 00557561    ret
end;*}

//00557564
{*function sub_00557564(?:TCollection; ?:string; ?:Integer):?;
begin
 00557564    push        ebp
 00557565    mov         ebp,esp
 00557567    add         esp,0FFFFFFF8
 0055756A    push        ebx
 0055756B    push        esi
 0055756C    push        edi
 0055756D    xor         ebx,ebx
 0055756F    mov         dword ptr [ebp-4],ebx
 00557572    mov         edi,ecx
 00557574    mov         esi,edx
 00557576    mov         ebx,eax
 00557578    xor         eax,eax
 0055757A    push        ebp
 0055757B    push        5575CC
 00557580    push        dword ptr fs:[eax]
 00557583    mov         dword ptr fs:[eax],esp
 00557586    mov         dword ptr [ebp-8],esi
 00557589    lea         eax,[ebp-8]
 0055758C    lea         ecx,[ebp-4]
 0055758F    xor         edx,edx
 00557591    call        00550CD0
 00557596    lea         eax,[ebp-4]
 00557599    mov         edx,5575E8;'\*'
 0055759E    call        @UStrCat
 005575A3    mov         edx,dword ptr [ebp-4]
 005575A6    mov         ecx,edi
 005575A8    mov         eax,ebx
 005575AA    call        005575F0
 005575AF    test        eax,eax
 005575B1    sete        al
 005575B4    mov         ebx,eax
 005575B6    xor         eax,eax
 005575B8    pop         edx
 005575B9    pop         ecx
 005575BA    pop         ecx
 005575BB    mov         dword ptr fs:[eax],edx
 005575BE    push        5575D3
 005575C3    lea         eax,[ebp-4]
 005575C6    call        @UStrClr
 005575CB    ret
>005575CC    jmp         @HandleFinally
>005575D1    jmp         005575C3
 005575D3    mov         eax,ebx
 005575D5    pop         edi
 005575D6    pop         esi
 005575D7    pop         ebx
 005575D8    pop         ecx
 005575D9    pop         ecx
 005575DA    pop         ebp
 005575DB    ret
end;*}

//005575F0
{*function sub_005575F0(?:TJvAppSubStorages; ?:string; ?:?):?;
begin
 005575F0    push        ebp
 005575F1    mov         ebp,esp
 005575F3    add         esp,0FFFFFFEC
 005575F6    push        ebx
 005575F7    push        esi
 005575F8    push        edi
 005575F9    xor         ebx,ebx
 005575FB    mov         dword ptr [ebp-10],ebx
 005575FE    mov         dword ptr [ebp-8],ecx
 00557601    mov         dword ptr [ebp-4],edx
 00557604    mov         edi,eax
 00557606    mov         eax,dword ptr [ebp-4]
 00557609    call        @UStrAddRef
 0055760E    xor         eax,eax
 00557610    push        ebp
 00557611    push        5576DE
 00557616    push        dword ptr fs:[eax]
 00557619    mov         dword ptr fs:[eax],esp
 0055761C    xor         eax,eax
 0055761E    mov         dword ptr [ebp-0C],eax
 00557621    mov         eax,dword ptr [ebp-4]
 00557624    mov         dword ptr [ebp-14],eax
 00557627    lea         eax,[ebp-14]
 0055762A    lea         ecx,[ebp-10]
 0055762D    xor         edx,edx
 0055762F    call        00550CD0
 00557634    mov         edx,dword ptr [ebp-10]
 00557637    lea         eax,[ebp-4]
 0055763A    call        @UStrLAsg
 0055763F    mov         eax,edi
 00557641    call        TCollection.GetCount
 00557646    mov         esi,eax
 00557648    dec         esi
 00557649    test        esi,esi
>0055764B    jl          005576C0
 0055764D    inc         esi
 0055764E    xor         ebx,ebx
 00557650    cmp         ebx,dword ptr [ebp-8]
>00557653    je          005576BC
 00557655    mov         edx,ebx
 00557657    mov         eax,edi
 00557659    call        00557550
 0055765E    mov         eax,dword ptr [eax+0C]
 00557661    mov         edx,dword ptr [ebp-4]
 00557664    call        AnsiStartsText
 00557669    test        al,al
>0055766B    je          005576BC
 0055766D    mov         edx,ebx
 0055766F    mov         eax,edi
 00557671    call        00557550
 00557676    mov         eax,dword ptr [eax+0C]
 00557679    call        @UStrLen
 0055767E    mov         edx,dword ptr [ebp-4]
 00557681    cmp         word ptr [edx+eax*2],5C
>00557686    jne         005576BC
 00557688    cmp         dword ptr [ebp-0C],0
>0055768C    je          005576B0
 0055768E    mov         edx,ebx
 00557690    mov         eax,edi
 00557692    call        00557550
 00557697    mov         eax,dword ptr [eax+0C]
 0055769A    call        @UStrLen
 0055769F    push        eax
 005576A0    mov         eax,dword ptr [ebp-0C]
 005576A3    mov         eax,dword ptr [eax+0C]
 005576A6    call        @UStrLen
 005576AB    pop         edx
 005576AC    cmp         edx,eax
>005576AE    jle         005576BC
 005576B0    mov         edx,ebx
 005576B2    mov         eax,edi
 005576B4    call        00557550
 005576B9    mov         dword ptr [ebp-0C],eax
 005576BC    inc         ebx
 005576BD    dec         esi
>005576BE    jne         00557650
 005576C0    xor         eax,eax
 005576C2    pop         edx
 005576C3    pop         ecx
 005576C4    pop         ecx
 005576C5    mov         dword ptr fs:[eax],edx
 005576C8    push        5576E5
 005576CD    lea         eax,[ebp-10]
 005576D0    call        @UStrClr
 005576D5    lea         eax,[ebp-4]
 005576D8    call        @UStrClr
 005576DD    ret
>005576DE    jmp         @HandleFinally
>005576E3    jmp         005576CD
 005576E5    mov         eax,dword ptr [ebp-0C]
 005576E8    pop         edi
 005576E9    pop         esi
 005576EA    pop         ebx
 005576EB    mov         esp,ebp
 005576ED    pop         ebp
 005576EE    ret
end;*}

//005576F0
procedure TJvAppSubStorages.Add(RootPath:string; AppStorage:TJvCustomAppStorage);
begin
{*
 005576F0    push        ebp
 005576F1    mov         ebp,esp
 005576F3    add         esp,0FFFFFFF8
 005576F6    push        ebx
 005576F7    push        esi
 005576F8    push        edi
 005576F9    mov         esi,ecx
 005576FB    mov         dword ptr [ebp-4],edx
 005576FE    mov         ebx,eax
 00557700    mov         eax,dword ptr [ebp-4]
 00557703    call        @UStrAddRef
 00557708    xor         eax,eax
 0055770A    push        ebp
 0055770B    push        557781
 00557710    push        dword ptr fs:[eax]
 00557713    mov         dword ptr fs:[eax],esp
 00557716    mov         ecx,ebx
 00557718    mov         dl,1
 0055771A    mov         eax,[0055018C];TJvAppSubStorage
 0055771F    call        TCollectionItem.Create;TJvAppSubStorage.Create
 00557724    mov         dword ptr [ebp-8],eax
 00557727    xor         eax,eax
 00557729    push        ebp
 0055772A    push        557754
 0055772F    push        dword ptr fs:[eax]
 00557732    mov         dword ptr fs:[eax],esp
 00557735    mov         edx,dword ptr [ebp-4]
 00557738    mov         eax,dword ptr [ebp-8]
 0055773B    call        TJvAppSubStorage.SetRootPath
 00557740    mov         edx,esi
 00557742    mov         eax,dword ptr [ebp-8]
 00557745    call        TJvAppSubStorage.SetAppStorage
 0055774A    xor         eax,eax
 0055774C    pop         edx
 0055774D    pop         ecx
 0055774E    pop         ecx
 0055774F    mov         dword ptr fs:[eax],edx
>00557752    jmp         0055776B
>00557754    jmp         @HandleAnyException
 00557759    lea         eax,[ebp-8]
 0055775C    call        FreeAndNil
 00557761    call        @RaiseAgain
 00557766    call        @DoneExcept
 0055776B    xor         eax,eax
 0055776D    pop         edx
 0055776E    pop         ecx
 0055776F    pop         ecx
 00557770    mov         dword ptr fs:[eax],edx
 00557773    push        557788
 00557778    lea         eax,[ebp-4]
 0055777B    call        @UStrClr
 00557780    ret
>00557781    jmp         @HandleFinally
>00557786    jmp         00557778
 00557788    pop         edi
 00557789    pop         esi
 0055778A    pop         ebx
 0055778B    pop         ecx
 0055778C    pop         ecx
 0055778D    pop         ebp
 0055778E    ret
*}
end;

//00557790
procedure TJvAppSubStorages.Delete(Index:Integer);
begin
{*
 00557790    call        TCollection.Delete
 00557795    ret
*}
end;

//00557798
procedure TJvAppSubStorages.Delete(RootPath:string; IncludeSubPaths:Boolean);
begin
{*
 00557798    push        ebp
 00557799    mov         ebp,esp
 0055779B    add         esp,0FFFFFFF0
 0055779E    push        ebx
 0055779F    push        esi
 005577A0    push        edi
 005577A1    xor         ebx,ebx
 005577A3    mov         dword ptr [ebp-0C],ebx
 005577A6    mov         dword ptr [ebp-8],ebx
 005577A9    mov         ebx,ecx
 005577AB    mov         dword ptr [ebp-4],edx
 005577AE    mov         esi,eax
 005577B0    mov         eax,dword ptr [ebp-4]
 005577B3    call        @UStrAddRef
 005577B8    xor         eax,eax
 005577BA    push        ebp
 005577BB    push        557865
 005577C0    push        dword ptr fs:[eax]
 005577C3    mov         dword ptr fs:[eax],esp
 005577C6    mov         eax,dword ptr [ebp-4]
 005577C9    mov         dword ptr [ebp-10],eax
 005577CC    lea         eax,[ebp-10]
 005577CF    lea         ecx,[ebp-0C]
 005577D2    xor         edx,edx
 005577D4    call        00550CD0
 005577D9    mov         edx,dword ptr [ebp-0C]
 005577DC    lea         eax,[ebp-4]
 005577DF    call        @UStrLAsg
 005577E4    cmp         dword ptr [ebp-4],0
>005577E8    je          0055784A
 005577EA    lea         eax,[ebp-8]
 005577ED    mov         ecx,557880;'\'
 005577F2    mov         edx,dword ptr [ebp-4]
 005577F5    call        @UStrCat3
 005577FA    mov         eax,esi
 005577FC    call        TCollection.GetCount
 00557801    mov         edi,eax
 00557803    dec         edi
 00557804    test        edi,edi
>00557806    jl          0055784A
 00557808    mov         edx,edi
 0055780A    mov         eax,esi
 0055780C    call        00557550
 00557811    mov         edx,dword ptr [eax+0C]
 00557814    mov         eax,dword ptr [ebp-4]
 00557817    call        AnsiSameText
 0055781C    test        al,al
>0055781E    jne         0055783C
 00557820    test        bl,bl
>00557822    je          00557845
 00557824    mov         edx,edi
 00557826    mov         eax,esi
 00557828    call        00557550
 0055782D    mov         edx,dword ptr [eax+0C]
 00557830    mov         eax,dword ptr [ebp-8]
 00557833    call        AnsiStartsText
 00557838    test        al,al
>0055783A    je          00557845
 0055783C    mov         edx,edi
 0055783E    mov         eax,esi
 00557840    call        TJvAppSubStorages.Delete
 00557845    dec         edi
 00557846    test        edi,edi
>00557848    jge         00557808
 0055784A    xor         eax,eax
 0055784C    pop         edx
 0055784D    pop         ecx
 0055784E    pop         ecx
 0055784F    mov         dword ptr fs:[eax],edx
 00557852    push        55786C
 00557857    lea         eax,[ebp-0C]
 0055785A    mov         edx,3
 0055785F    call        @UStrArrayClr
 00557864    ret
>00557865    jmp         @HandleFinally
>0055786A    jmp         00557857
 0055786C    pop         edi
 0055786D    pop         esi
 0055786E    pop         ebx
 0055786F    mov         esp,ebp
 00557871    pop         ebp
 00557872    ret
*}
end;

//00557884
procedure TJvAppSubStorages.Delete(AppStorage:TJvCustomAppStorage);
begin
{*
 00557884    push        ebx
 00557885    push        esi
 00557886    push        edi
 00557887    mov         edi,edx
 00557889    mov         esi,eax
 0055788B    mov         eax,esi
 0055788D    call        TCollection.GetCount
 00557892    mov         ebx,eax
 00557894    dec         ebx
 00557895    test        ebx,ebx
>00557897    jl          005578B5
 00557899    mov         edx,ebx
 0055789B    mov         eax,esi
 0055789D    call        00557550
 005578A2    cmp         edi,dword ptr [eax+10]
>005578A5    jne         005578B0
 005578A7    mov         edx,ebx
 005578A9    mov         eax,esi
 005578AB    call        TJvAppSubStorages.Delete
 005578B0    dec         ebx
 005578B1    test        ebx,ebx
>005578B3    jge         00557899
 005578B5    pop         edi
 005578B6    pop         esi
 005578B7    pop         ebx
 005578B8    ret
*}
end;

//005578BC
{*function sub_005578BC(?:TJvAppSubStorage):?;
begin
 005578BC    mov         eax,dword ptr [eax+4]
 005578BF    call        0055753C
 005578C4    ret
end;*}

//005578C8
{*procedure TJvAppSubStorage.GetDisplayName(?:?);
begin
 005578C8    push        ebx
 005578C9    push        esi
 005578CA    mov         esi,edx
 005578CC    mov         ebx,eax
 005578CE    cmp         dword ptr [ebx+0C],0;TJvAppSubStorage.FRootPath:string
>005578D2    je          005578FC
 005578D4    cmp         dword ptr [ebx+10],0;TJvAppSubStorage.FAppStorage:TJvCustomAppStorage
>005578D8    je          005578FC
 005578DA    push        557914;'\'
 005578DF    push        dword ptr [ebx+0C];TJvAppSubStorage.FRootPath:string
 005578E2    push        557924;'='
 005578E7    mov         eax,dword ptr [ebx+10];TJvAppSubStorage.FAppStorage:TJvCustomAppStorage
 005578EA    push        dword ptr [eax+8];TJvCustomAppStorage.FName:TComponentName
 005578ED    mov         eax,esi
 005578EF    mov         edx,4
 005578F4    call        @UStrCatN
 005578F9    pop         esi
 005578FA    pop         ebx
 005578FB    ret
 005578FC    mov         edx,esi
 005578FE    mov         eax,ebx
 00557900    call        TCollectionItem.GetDisplayName
 00557905    pop         esi
 00557906    pop         ebx
 00557907    ret
end;*}

//00557928
procedure TJvAppSubStorage.SetRootPath(Value:string);
begin
{*
 00557928    push        ebp
 00557929    mov         ebp,esp
 0055792B    add         esp,0FFFFFFEC
 0055792E    push        ebx
 0055792F    xor         ecx,ecx
 00557931    mov         dword ptr [ebp-8],ecx
 00557934    mov         dword ptr [ebp-4],edx
 00557937    mov         ebx,eax
 00557939    mov         eax,dword ptr [ebp-4]
 0055793C    call        @UStrAddRef
 00557941    xor         eax,eax
 00557943    push        ebp
 00557944    push        5579E1
 00557949    push        dword ptr fs:[eax]
 0055794C    mov         dword ptr fs:[eax],esp
 0055794F    mov         eax,dword ptr [ebp-4]
 00557952    mov         dword ptr [ebp-0C],eax
 00557955    lea         eax,[ebp-0C]
 00557958    lea         ecx,[ebp-8]
 0055795B    xor         edx,edx
 0055795D    call        00550CD0
 00557962    mov         edx,dword ptr [ebp-8]
 00557965    lea         eax,[ebp-4]
 00557968    call        @UStrLAsg
 0055796D    mov         eax,dword ptr [ebp-4]
 00557970    mov         edx,dword ptr [ebx+0C];TJvAppSubStorage.FRootPath:string
 00557973    call        @UStrEqual
>00557978    je          005579C6
 0055797A    mov         eax,ebx
 0055797C    call        TCollectionItem.GetIndex
 00557981    mov         ecx,eax
 00557983    mov         edx,dword ptr [ebp-4]
 00557986    mov         eax,dword ptr [ebx+4];TJvAppSubStorage.FCollection:TCollection
 00557989    call        00557564
 0055798E    test        al,al
>00557990    je          0055799F
 00557992    lea         eax,[ebx+0C];TJvAppSubStorage.FRootPath:string
 00557995    mov         edx,dword ptr [ebp-4]
 00557998    call        @UStrAsg
>0055799D    jmp         005579C6
 0055799F    mov         eax,dword ptr [ebp-4]
 005579A2    mov         dword ptr [ebp-14],eax
 005579A5    mov         byte ptr [ebp-10],11
 005579A9    lea         eax,[ebp-14]
 005579AC    push        eax
 005579AD    push        0
 005579AF    mov         ecx,dword ptr ds:[78D41C];^SResString322:TResStringRec
 005579B5    mov         dl,1
 005579B7    mov         eax,[0054D11C];EJVCLAppStorageError
 005579BC    call        Exception.CreateResFmt;EJVCLAppStorageError.Create
 005579C1    call        @RaiseExcept
 005579C6    xor         eax,eax
 005579C8    pop         edx
 005579C9    pop         ecx
 005579CA    pop         ecx
 005579CB    mov         dword ptr fs:[eax],edx
 005579CE    push        5579E8
 005579D3    lea         eax,[ebp-8]
 005579D6    mov         edx,2
 005579DB    call        @UStrArrayClr
 005579E0    ret
>005579E1    jmp         @HandleFinally
>005579E6    jmp         005579D3
 005579E8    pop         ebx
 005579E9    mov         esp,ebp
 005579EB    pop         ebp
 005579EC    ret
*}
end;

//005579F0
procedure TJvAppSubStorage.SetAppStorage(Value:TJvCustomAppStorage);
begin
{*
 005579F0    push        ebx
 005579F1    push        esi
 005579F2    mov         esi,edx
 005579F4    mov         ebx,eax
 005579F6    cmp         esi,dword ptr [ebx+10];TJvAppSubStorage.FAppStorage:TJvCustomAppStorage
>005579F9    je          00557A46
 005579FB    test        esi,esi
>005579FD    je          00557A35
 005579FF    mov         eax,ebx
 00557A01    call        005578BC
 00557A06    mov         edx,eax
 00557A08    mov         eax,esi
 00557A0A    call        00552C4C
 00557A0F    test        al,al
>00557A11    jne         00557A1E
 00557A13    mov         eax,ebx
 00557A15    call        005578BC
 00557A1A    cmp         esi,eax
>00557A1C    jne         00557A35
 00557A1E    mov         ecx,dword ptr ds:[78D1F8];^SResString323:TResStringRec
 00557A24    mov         dl,1
 00557A26    mov         eax,[0054D11C];EJVCLAppStorageError
 00557A2B    call        Exception.CreateRes;EJVCLAppStorageError.Create
 00557A30    call        @RaiseExcept
 00557A35    mov         eax,ebx
 00557A37    call        005578BC
 00557A3C    lea         ecx,[ebx+10];TJvAppSubStorage.FAppStorage:TJvCustomAppStorage
 00557A3F    mov         edx,esi
 00557A41    call        0056D000
 00557A46    pop         esi
 00557A47    pop         ebx
 00557A48    ret
*}
end;

//00557A4C
constructor TJvCustomAppMemoryFileStorage.Create(AOwner:TComponent);
begin
{*
 00557A4C    push        ebx
 00557A4D    push        esi
 00557A4E    test        dl,dl
>00557A50    je          00557A5A
 00557A52    add         esp,0FFFFFFF0
 00557A55    call        @ClassCreate
 00557A5A    mov         ebx,edx
 00557A5C    mov         esi,eax
 00557A5E    xor         edx,edx
 00557A60    mov         eax,esi
 00557A62    call        TJvCustomAppStorage.Create
 00557A67    mov         byte ptr [esi+160],3;TJvCustomAppMemoryFileStorage.FLocation:TFileLocation
 00557A6E    mov         byte ptr [esi+170],0;TJvCustomAppMemoryFileStorage.FPhysicalReadOnly:Boolean
 00557A75    mov         byte ptr [esi+171],0;TJvCustomAppMemoryFileStorage.FFileLoaded:Boolean
 00557A7C    mov         eax,esi
 00557A7E    test        bl,bl
>00557A80    je          00557A91
 00557A82    call        @AfterConstruction
 00557A87    pop         dword ptr fs:[0]
 00557A8E    add         esp,0C
 00557A91    mov         eax,esi
 00557A93    pop         esi
 00557A94    pop         ebx
 00557A95    ret
*}
end;

//00557A98
procedure sub_00557A98(?:TJvAppIniFileStorage);
begin
{*
 00557A98    push        ebp
 00557A99    mov         ebp,esp
 00557A9B    mov         ecx,6
 00557AA0    push        0
 00557AA2    push        0
 00557AA4    dec         ecx
>00557AA5    jne         00557AA0
 00557AA7    push        ecx
 00557AA8    push        ebx
 00557AA9    mov         ebx,eax
 00557AAB    xor         eax,eax
 00557AAD    push        ebp
 00557AAE    push        557C67
 00557AB3    push        dword ptr fs:[eax]
 00557AB6    mov         dword ptr fs:[eax],esp
 00557AB9    cmp         dword ptr [ebx+15C],0
>00557AC0    jne         00557ADB
 00557AC2    cmp         byte ptr [ebx+160],0
>00557AC9    je          00557ADB
 00557ACB    lea         eax,[ebx+158]
 00557AD1    call        @UStrClr
>00557AD6    jmp         00557C0D
 00557ADB    mov         eax,ebx
 00557ADD    call        TJvCustomAppStorage.GetActiveTranslateStringEngine
 00557AE2    lea         ecx,[ebp-0C]
 00557AE5    mov         edx,dword ptr [ebx+15C]
 00557AEB    call        TJvTranslateString.TranslateString
 00557AF0    lea         edx,[ebp-4]
 00557AF3    mov         eax,dword ptr [ebp-0C]
 00557AF6    call        ExtractFileName
 00557AFB    mov         eax,dword ptr [ebp-0C]
 00557AFE    call        0053AC48
 00557B03    test        al,al
>00557B05    je          00557B14
 00557B07    lea         eax,[ebp-8]
 00557B0A    mov         edx,dword ptr [ebp-4]
 00557B0D    call        @UStrLAsg
>00557B12    jmp         00557B1F
 00557B14    lea         eax,[ebp-8]
 00557B17    mov         edx,dword ptr [ebp-0C]
 00557B1A    call        @UStrLAsg
 00557B1F    movzx       eax,byte ptr [ebx+160]
 00557B26    cmp         eax,4
>00557B29    ja          00557C0D
 00557B2F    jmp         dword ptr [eax*4+557B36]
 00557B2F    dd          00557B4A
 00557B2F    dd          00557BC3
 00557B2F    dd          00557B9D
 00557B2F    dd          00557B6A
 00557B2F    dd          00557BE9
 00557B4A    lea         edx,[ebp-10]
 00557B4D    mov         eax,ebx
 00557B4F    mov         ecx,dword ptr [eax]
 00557B51    call        dword ptr [ecx+114]
 00557B57    mov         edx,dword ptr [ebp-10]
 00557B5A    lea         eax,[ebx+158]
 00557B60    call        @UStrAsg
>00557B65    jmp         00557C0D
 00557B6A    lea         edx,[ebp-1C]
 00557B6D    xor         eax,eax
 00557B6F    call        ParamStr
 00557B74    mov         eax,dword ptr [ebp-1C]
 00557B77    lea         edx,[ebp-18]
 00557B7A    call        ExtractFilePath
 00557B7F    mov         eax,dword ptr [ebp-18]
 00557B82    lea         edx,[ebp-14]
 00557B85    call        0053AA38
 00557B8A    mov         edx,dword ptr [ebp-14]
 00557B8D    lea         eax,[ebx+158]
 00557B93    mov         ecx,dword ptr [ebp-4]
 00557B96    call        @UStrCat3
>00557B9B    jmp         00557C0D
 00557B9D    lea         eax,[ebp-24]
 00557BA0    call        005334F8
 00557BA5    mov         eax,dword ptr [ebp-24]
 00557BA8    lea         edx,[ebp-20]
 00557BAB    call        0053AA38
 00557BB0    mov         edx,dword ptr [ebp-20]
 00557BB3    lea         eax,[ebx+158]
 00557BB9    mov         ecx,dword ptr [ebp-4]
 00557BBC    call        @UStrCat3
>00557BC1    jmp         00557C0D
 00557BC3    lea         eax,[ebp-2C]
 00557BC6    call        005334BC
 00557BCB    mov         eax,dword ptr [ebp-2C]
 00557BCE    lea         edx,[ebp-28]
 00557BD1    call        0053AA38
 00557BD6    mov         edx,dword ptr [ebp-28]
 00557BD9    lea         eax,[ebx+158]
 00557BDF    mov         ecx,dword ptr [ebp-4]
 00557BE2    call        @UStrCat3
>00557BE7    jmp         00557C0D
 00557BE9    lea         eax,[ebp-34]
 00557BEC    call        00533544
 00557BF1    mov         eax,dword ptr [ebp-34]
 00557BF4    lea         edx,[ebp-30]
 00557BF7    call        0053AA38
 00557BFC    mov         edx,dword ptr [ebp-30]
 00557BFF    lea         eax,[ebx+158]
 00557C05    mov         ecx,dword ptr [ebp-8]
 00557C08    call        @UStrCat3
 00557C0D    mov         eax,dword ptr [ebx+158]
 00557C13    call        0053AFD0
 00557C18    test        al,al
>00557C1A    je          00557C2B
 00557C1C    mov         eax,dword ptr [ebx+158]
 00557C22    call        FileIsReadOnly
 00557C27    test        al,al
>00557C29    jne         00557C2F
 00557C2B    xor         eax,eax
>00557C2D    jmp         00557C31
 00557C2F    mov         al,1
 00557C31    mov         byte ptr [ebx+170],al
 00557C37    xor         eax,eax
 00557C39    pop         edx
 00557C3A    pop         ecx
 00557C3B    pop         ecx
 00557C3C    mov         dword ptr fs:[eax],edx
 00557C3F    push        557C6E
 00557C44    lea         eax,[ebp-34]
 00557C47    mov         edx,9
 00557C4C    call        @UStrArrayClr
 00557C51    lea         eax,[ebp-10]
 00557C54    call        @UStrClr
 00557C59    lea         eax,[ebp-0C]
 00557C5C    mov         edx,3
 00557C61    call        @UStrArrayClr
 00557C66    ret
>00557C67    jmp         @HandleFinally
>00557C6C    jmp         00557C44
 00557C6E    pop         ebx
 00557C6F    mov         esp,ebp
 00557C71    pop         ebp
 00557C72    ret
*}
end;

//00557C74
procedure TJvCustomAppMemoryFileStorage.Reload;
begin
{*
 00557C74    push        ebx
 00557C75    mov         ebx,eax
 00557C77    mov         byte ptr [ebx+171],1;TJvCustomAppMemoryFileStorage.FFileLoaded:Boolean
 00557C7E    mov         eax,dword ptr [ebx+158];TJvCustomAppMemoryFileStorage.FFullFileName:TFileName
 00557C84    call        0053AFD0
 00557C89    test        al,al
>00557C8B    je          00557C9C
 00557C8D    mov         eax,dword ptr [ebx+158];TJvCustomAppMemoryFileStorage.FFullFileName:TFileName
 00557C93    call        FileIsReadOnly
 00557C98    test        al,al
>00557C9A    jne         00557CA0
 00557C9C    xor         eax,eax
>00557C9E    jmp         00557CA2
 00557CA0    mov         al,1
 00557CA2    mov         byte ptr [ebx+170],al;TJvCustomAppMemoryFileStorage.FPhysicalReadOnly:Boolean
 00557CA8    mov         eax,ebx
 00557CAA    call        TJvCustomAppStorage.Reload
 00557CAF    pop         ebx
 00557CB0    ret
*}
end;

//00557CB4
function TJvCustomAppMemoryFileStorage.ReloadNeeded:Boolean;
begin
{*
 00557CB4    push        ebx
 00557CB5    mov         ebx,eax
 00557CB7    cmp         byte ptr [ebx+171],0;TJvCustomAppMemoryFileStorage.FFileLoaded:Boolean
>00557CBE    je          00557CC9
 00557CC0    cmp         byte ptr [ebx+134],0;TJvCustomAppMemoryFileStorage.FAutoReload:Boolean
>00557CC7    je          00557CD4
 00557CC9    mov         eax,ebx
 00557CCB    call        0055720C
 00557CD0    test        al,al
>00557CD2    je          00557CD8
 00557CD4    xor         eax,eax
 00557CD6    pop         ebx
 00557CD7    ret
 00557CD8    mov         al,1
 00557CDA    pop         ebx
 00557CDB    ret
*}
end;

//00557CDC
{*function sub_00557CDC:?;
begin
 00557CDC    movzx       eax,byte ptr [eax+170];TJvCustomAppMemoryFileStorage.FPhysicalReadOnly:Boolean
 00557CE3    ret
end;*}

//00557CE4
{*procedure sub_00557CE4(?:?);
begin
 00557CE4    push        ebx
 00557CE5    push        esi
 00557CE6    mov         esi,edx
 00557CE8    mov         ebx,eax
 00557CEA    mov         eax,ebx
 00557CEC    call        TJvCustomAppStorage.GetActiveTranslateStringEngine
 00557CF1    mov         ecx,esi
 00557CF3    mov         edx,dword ptr [ebx+15C];TJvCustomAppMemoryFileStorage.FFileName:TFileName
 00557CF9    call        TJvTranslateString.TranslateString
 00557CFE    cmp         word ptr [ebx+16A],0;TJvCustomAppMemoryFileStorage.?f16A:word
>00557D06    je          00557D18
 00557D08    mov         ecx,esi
 00557D0A    mov         edx,ebx
 00557D0C    mov         eax,dword ptr [ebx+16C];TJvCustomAppMemoryFileStorage.?f16C:dword
 00557D12    call        dword ptr [ebx+168];TJvCustomAppMemoryFileStorage.FOnGetFileName
 00557D18    pop         esi
 00557D19    pop         ebx
 00557D1A    ret
end;*}

//00557D1C
procedure TJvAppIniFileStorage.SetFileName(Value:TFileName);
begin
{*
 00557D1C    push        ebp
 00557D1D    mov         ebp,esp
 00557D1F    push        0
 00557D21    push        0
 00557D23    push        0
 00557D25    push        ebx
 00557D26    push        esi
 00557D27    mov         esi,edx
 00557D29    mov         ebx,eax
 00557D2B    xor         eax,eax
 00557D2D    push        ebp
 00557D2E    push        557DF1
 00557D33    push        dword ptr fs:[eax]
 00557D36    mov         dword ptr fs:[eax],esp
 00557D39    mov         eax,esi
 00557D3B    mov         edx,dword ptr [ebx+15C];TJvAppIniFileStorage.FFileName:TFileName
 00557D41    call        @UStrEqual
>00557D46    je          00557DD6
 00557D4C    test        byte ptr [ebx+1C],1;TJvAppIniFileStorage.FComponentState:TComponentState
>00557D50    jne         00557D67
 00557D52    mov         eax,ebx
 00557D54    call        0055720C
 00557D59    test        al,al
>00557D5B    jne         00557D67
 00557D5D    mov         eax,ebx
 00557D5F    mov         edx,dword ptr [eax]
 00557D61    call        dword ptr [edx+0EC];TJvAppIniFileStorage.Flush
 00557D67    lea         edx,[ebp-4]
 00557D6A    mov         eax,esi
 00557D6C    call        ExtractFileExt
 00557D71    mov         eax,dword ptr [ebp-4]
 00557D74    call        @UStrLen
 00557D79    test        eax,eax
>00557D7B    jne         00557DA7
 00557D7D    lea         edx,[ebp-0C]
 00557D80    mov         eax,ebx
 00557D82    mov         ecx,dword ptr [eax]
 00557D84    call        dword ptr [ecx+110];TJvAppIniFileStorage.sub_007280D0
 00557D8A    mov         edx,dword ptr [ebp-0C]
 00557D8D    lea         ecx,[ebp-8]
 00557D90    mov         eax,esi
 00557D92    call        0053AA88
 00557D97    mov         edx,dword ptr [ebp-8]
 00557D9A    lea         eax,[ebx+15C];TJvAppIniFileStorage.FFileName:TFileName
 00557DA0    call        @UStrAsg
>00557DA5    jmp         00557DB4
 00557DA7    lea         eax,[ebx+15C];TJvAppIniFileStorage.FFileName:TFileName
 00557DAD    mov         edx,esi
 00557DAF    call        @UStrAsg
 00557DB4    mov         eax,ebx
 00557DB6    call        00557A98
 00557DBB    test        byte ptr [ebx+1C],1;TJvAppIniFileStorage.FComponentState:TComponentState
>00557DBF    jne         00557DD6
 00557DC1    mov         eax,ebx
 00557DC3    call        0055720C
 00557DC8    test        al,al
>00557DCA    jne         00557DD6
 00557DCC    mov         eax,ebx
 00557DCE    mov         edx,dword ptr [eax]
 00557DD0    call        dword ptr [edx+0F0];TJvAppIniFileStorage.Reload
 00557DD6    xor         eax,eax
 00557DD8    pop         edx
 00557DD9    pop         ecx
 00557DDA    pop         ecx
 00557DDB    mov         dword ptr fs:[eax],edx
 00557DDE    push        557DF8
 00557DE3    lea         eax,[ebp-0C]
 00557DE6    mov         edx,3
 00557DEB    call        @UStrArrayClr
 00557DF0    ret
>00557DF1    jmp         @HandleFinally
>00557DF6    jmp         00557DE3
 00557DF8    pop         esi
 00557DF9    pop         ebx
 00557DFA    mov         esp,ebp
 00557DFC    pop         ebp
 00557DFD    ret
*}
end;

//00557E00
{*procedure TJvAppIniFileStorage.SetOnGetFileName(Value:TJvAppStorageGetFileNameEvent; ?:?; ?:?);
begin
 00557E00    push        ebp
 00557E01    mov         ebp,esp
 00557E03    push        ebx
 00557E04    mov         ebx,eax
 00557E06    test        byte ptr [ebx+1C],1;TJvAppIniFileStorage.FComponentState:TComponentState
>00557E0A    jne         00557E21
 00557E0C    mov         eax,ebx
 00557E0E    call        0055720C
 00557E13    test        al,al
>00557E15    jne         00557E21
 00557E17    mov         eax,ebx
 00557E19    mov         edx,dword ptr [eax]
 00557E1B    call        dword ptr [edx+0EC];TJvAppIniFileStorage.Flush
 00557E21    mov         eax,dword ptr [ebp+8]
 00557E24    mov         dword ptr [ebx+168],eax;TJvAppIniFileStorage.FOnGetFileName:TJvAppStorageGetFileNameEven...
 00557E2A    mov         eax,dword ptr [ebp+0C]
 00557E2D    mov         dword ptr [ebx+16C],eax;TJvAppIniFileStorage.?f16C:dword
 00557E33    mov         eax,ebx
 00557E35    call        00557A98
 00557E3A    test        byte ptr [ebx+1C],1;TJvAppIniFileStorage.FComponentState:TComponentState
>00557E3E    jne         00557E55
 00557E40    mov         eax,ebx
 00557E42    call        0055720C
 00557E47    test        al,al
>00557E49    jne         00557E55
 00557E4B    mov         eax,ebx
 00557E4D    mov         edx,dword ptr [eax]
 00557E4F    call        dword ptr [edx+0F0];TJvAppIniFileStorage.Reload
 00557E55    pop         ebx
 00557E56    pop         ebp
 00557E57    ret         8
end;*}

//00557E5C
procedure TJvAppIniFileStorage.SetLocation(Value:TFileLocation);
begin
{*
 00557E5C    push        ebx
 00557E5D    push        esi
 00557E5E    mov         ebx,edx
 00557E60    mov         esi,eax
 00557E62    cmp         bl,byte ptr [esi+160];TJvAppIniFileStorage.FLocation:TFileLocation
>00557E68    je          00557EAD
 00557E6A    test        byte ptr [esi+1C],1;TJvAppIniFileStorage.FComponentState:TComponentState
>00557E6E    jne         00557E85
 00557E70    mov         eax,esi
 00557E72    call        0055720C
 00557E77    test        al,al
>00557E79    jne         00557E85
 00557E7B    mov         eax,esi
 00557E7D    mov         edx,dword ptr [eax]
 00557E7F    call        dword ptr [edx+0EC];TJvAppIniFileStorage.Flush
 00557E85    mov         byte ptr [esi+160],bl;TJvAppIniFileStorage.FLocation:TFileLocation
 00557E8B    mov         eax,esi
 00557E8D    call        00557A98
 00557E92    test        byte ptr [esi+1C],1;TJvAppIniFileStorage.FComponentState:TComponentState
>00557E96    jne         00557EAD
 00557E98    mov         eax,esi
 00557E9A    call        0055720C
 00557E9F    test        al,al
>00557EA1    jne         00557EAD
 00557EA3    mov         eax,esi
 00557EA5    mov         edx,dword ptr [eax]
 00557EA7    call        dword ptr [edx+0F0];TJvAppIniFileStorage.Reload
 00557EAD    pop         esi
 00557EAE    pop         ebx
 00557EAF    ret
*}
end;

//00557EB0
{*procedure sub_00557EB0(?:?);
begin
 00557EB0    push        ebx
 00557EB1    mov         ebx,edx
 00557EB3    mov         eax,ebx
 00557EB5    call        @UStrClr
 00557EBA    pop         ebx
 00557EBB    ret
end;*}

//00557EBC
constructor sub_00557EBC;
begin
{*
 00557EBC    push        ebx
 00557EBD    push        esi
 00557EBE    test        dl,dl
>00557EC0    je          00557ECA
 00557EC2    add         esp,0FFFFFFF0
 00557EC5    call        @ClassCreate
 00557ECA    mov         ebx,edx
 00557ECC    mov         esi,eax
 00557ECE    xor         edx,edx
 00557ED0    mov         eax,esi
 00557ED2    call        TObject.Create
 00557ED7    mov         eax,esi
 00557ED9    test        bl,bl
>00557EDB    je          00557EEC
 00557EDD    call        @AfterConstruction
 00557EE2    pop         dword ptr fs:[0]
 00557EE9    add         esp,0C
 00557EEC    mov         eax,esi
 00557EEE    pop         esi
 00557EEF    pop         ebx
 00557EF0    ret
*}
end;

//00557EF4
function TJvAppStoragePropertyBaseEngine.Supports(AObject:TObject; AProperty:TObject):Boolean;
begin
{*
 00557EF4    xor         eax,eax
 00557EF6    ret
*}
end;

//00557EF8
procedure TJvAppStoragePropertyBaseEngine.ReadProperty(AStorage:TJvCustomAppStorage; APath:string; ClearFirst:Boolean; Recursive:Boolean; AProperty:TObject; AObject:TObject);
begin
{*
 00557EF8    push        ebp
 00557EF9    mov         ebp,esp
 00557EFB    pop         ebp
 00557EFC    ret         10
*}
end;

//00557F00
procedure TJvAppStoragePropertyBaseEngine.WriteProperty(AStorage:TJvCustomAppStorage; APath:string; Recursive:Boolean; AProperty:TObject; AObject:TObject);
begin
{*
 00557F00    push        ebp
 00557F01    mov         ebp,esp
 00557F03    pop         ebp
 00557F04    ret         0C
*}
end;

//00557F08
destructor TJvAppStoragePropertyEngineList.Destroy();
begin
{*
 00557F08    push        ebx
 00557F09    push        esi
 00557F0A    push        edi
 00557F0B    call        @BeforeDestruction
 00557F10    mov         ebx,edx
 00557F12    mov         esi,eax
 00557F14    mov         edi,dword ptr [esi+8];TJvAppStoragePropertyEngineList.FCount:Integer
 00557F17    dec         edi
 00557F18    cmp         edi,0
>00557F1B    jl          00557F3A
 00557F1D    mov         edx,edi
 00557F1F    mov         eax,esi
 00557F21    call        TList.Get
 00557F26    call        TObject.Free
 00557F2B    mov         edx,edi
 00557F2D    mov         eax,esi
 00557F2F    call        TList.Delete
 00557F34    dec         edi
 00557F35    cmp         edi,0FFFFFFFF
>00557F38    jne         00557F1D
 00557F3A    mov         edx,ebx
 00557F3C    and         dl,0FC
 00557F3F    mov         eax,esi
 00557F41    call        TList.Destroy
 00557F46    test        bl,bl
>00557F48    jle         00557F51
 00557F4A    mov         eax,esi
 00557F4C    call        @ClassDestroy
 00557F51    pop         edi
 00557F52    pop         esi
 00557F53    pop         ebx
 00557F54    ret
*}
end;

//00557F58
procedure TJvAppStoragePropertyEngineList.RegisterEngine(AEngineClass:TJvAppStoragePropertyBaseEngineClass);
begin
{*
 00557F58    push        ebx
 00557F59    push        esi
 00557F5A    mov         esi,edx
 00557F5C    mov         ebx,eax
 00557F5E    mov         dl,1
 00557F60    mov         eax,esi
 00557F62    call        dword ptr [eax]
 00557F64    mov         edx,eax
 00557F66    mov         eax,ebx
 00557F68    call        TList.Add
 00557F6D    pop         esi
 00557F6E    pop         ebx
 00557F6F    ret
*}
end;

//00557F70
procedure TJvAppStoragePropertyEngineList.UnregisterEngine(AEngineClass:TJvAppStoragePropertyBaseEngineClass);
begin
{*
 00557F70    push        ebx
 00557F71    push        esi
 00557F72    push        edi
 00557F73    push        ebp
 00557F74    mov         ebp,edx
 00557F76    mov         esi,eax
 00557F78    xor         ebx,ebx
 00557F7A    xor         edi,edi
>00557F7C    jmp         00557FAA
 00557F7E    mov         edx,edi
 00557F80    mov         eax,esi
 00557F82    call        TList.Get
 00557F87    call        TObject.ClassType
 00557F8C    cmp         ebp,eax
>00557F8E    jne         00557FA9
 00557F90    mov         edx,edi
 00557F92    mov         eax,esi
 00557F94    call        TList.Get
 00557F99    call        TObject.Free
 00557F9E    mov         edx,edi
 00557FA0    mov         eax,esi
 00557FA2    call        TList.Delete
 00557FA7    mov         bl,1
 00557FA9    inc         edi
 00557FAA    cmp         edi,dword ptr [esi+8];TJvAppStoragePropertyEngineList.FCount:Integer
>00557FAD    jge         00557FB3
 00557FAF    test        bl,bl
>00557FB1    je          00557F7E
 00557FB3    pop         ebp
 00557FB4    pop         edi
 00557FB5    pop         esi
 00557FB6    pop         ebx
 00557FB7    ret
*}
end;

//00557FB8
function TJvAppStoragePropertyEngineList.GetEngine(AObject:TObject; AProperty:TObject):TJvAppStoragePropertyBaseEngine;
begin
{*
 00557FB8    push        ebx
 00557FB9    push        esi
 00557FBA    push        edi
 00557FBB    push        ebp
 00557FBC    add         esp,0FFFFFFF4
 00557FBF    mov         dword ptr [esp+4],ecx
 00557FC3    mov         dword ptr [esp],edx
 00557FC6    mov         edi,eax
 00557FC8    xor         eax,eax
 00557FCA    mov         dword ptr [esp+8],eax
 00557FCE    mov         esi,dword ptr [edi+8];TJvAppStoragePropertyEngineList.FCount:Integer
 00557FD1    dec         esi
 00557FD2    test        esi,esi
>00557FD4    jl          00558005
 00557FD6    inc         esi
 00557FD7    xor         ebx,ebx
 00557FD9    mov         edx,ebx
 00557FDB    mov         eax,edi
 00557FDD    call        TList.Get
 00557FE2    mov         ecx,dword ptr [esp+4]
 00557FE6    mov         edx,dword ptr [esp]
 00557FE9    mov         ebp,dword ptr [eax]
 00557FEB    call        dword ptr [ebp+4]
 00557FEE    test        al,al
>00557FF0    je          00558001
 00557FF2    mov         edx,ebx
 00557FF4    mov         eax,edi
 00557FF6    call        TList.Get
 00557FFB    mov         dword ptr [esp+8],eax
>00557FFF    jmp         00558005
 00558001    inc         ebx
 00558002    dec         esi
>00558003    jne         00557FD9
 00558005    mov         eax,dword ptr [esp+8]
 00558009    add         esp,0C
 0055800C    pop         ebp
 0055800D    pop         edi
 0055800E    pop         esi
 0055800F    pop         ebx
 00558010    ret
*}
end;

//00558014
function TJvAppStoragePropertyEngineList.ReadProperty(AStorage:TJvCustomAppStorage; APath:string; ClearFirst:Boolean; Recursive:Boolean; AProperty:TObject; AObject:TObject):Boolean;
begin
{*
 00558014    push        ebp
 00558015    mov         ebp,esp
 00558017    add         esp,0FFFFFFF8
 0055801A    push        ebx
 0055801B    push        esi
 0055801C    mov         dword ptr [ebp-8],ecx
 0055801F    mov         dword ptr [ebp-4],edx
 00558022    mov         esi,dword ptr [ebp+14]
 00558025    mov         ecx,dword ptr [ebp+10]
 00558028    mov         edx,esi
 0055802A    call        TJvAppStoragePropertyEngineList.GetEngine
 0055802F    test        eax,eax
 00558031    setne       bl
 00558034    test        bl,bl
>00558036    je          00558052
 00558038    push        esi
 00558039    mov         edx,dword ptr [ebp+10]
 0055803C    push        edx
 0055803D    movzx       edx,byte ptr [ebp+0C]
 00558041    push        edx
 00558042    movzx       edx,byte ptr [ebp+8]
 00558046    push        edx
 00558047    mov         ecx,dword ptr [ebp-8]
 0055804A    mov         edx,dword ptr [ebp-4]
 0055804D    mov         esi,dword ptr [eax]
 0055804F    call        dword ptr [esi+8];TJvAppStoragePropertyBaseEngine.ReadProperty
 00558052    mov         eax,ebx
 00558054    pop         esi
 00558055    pop         ebx
 00558056    pop         ecx
 00558057    pop         ecx
 00558058    pop         ebp
 00558059    ret         10
*}
end;

//0055805C
function TJvAppStoragePropertyEngineList.WriteProperty(AStorage:TJvCustomAppStorage; APath:string; Recursive:Boolean; AProperty:TObject; AObject:TObject):Boolean;
begin
{*
 0055805C    push        ebp
 0055805D    mov         ebp,esp
 0055805F    add         esp,0FFFFFFF8
 00558062    push        ebx
 00558063    push        esi
 00558064    mov         dword ptr [ebp-8],ecx
 00558067    mov         dword ptr [ebp-4],edx
 0055806A    mov         esi,dword ptr [ebp+10]
 0055806D    mov         ecx,dword ptr [ebp+0C]
 00558070    mov         edx,esi
 00558072    call        TJvAppStoragePropertyEngineList.GetEngine
 00558077    test        eax,eax
 00558079    setne       bl
 0055807C    test        bl,bl
>0055807E    je          00558095
 00558080    push        esi
 00558081    mov         edx,dword ptr [ebp+0C]
 00558084    push        edx
 00558085    movzx       edx,byte ptr [ebp+8]
 00558089    push        edx
 0055808A    mov         ecx,dword ptr [ebp-8]
 0055808D    mov         edx,dword ptr [ebp-4]
 00558090    mov         esi,dword ptr [eax]
 00558092    call        dword ptr [esi+0C];TJvAppStoragePropertyBaseEngine.WriteProperty
 00558095    mov         eax,ebx
 00558097    pop         esi
 00558098    pop         ebx
 00558099    pop         ecx
 0055809A    pop         ecx
 0055809B    pop         ebp
 0055809C    ret         0C
*}
end;

end.