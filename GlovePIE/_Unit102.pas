//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit102;

interface

uses
  SysUtils, Classes, JvHidControllerClass, PieAccelerometers, PieGuiMonitor, LightstoneClassUnit, SpacePointClassUnit, WiimoteManagerUnit, ManagedHidUnit, AccelerometerClassUnit, PieWiimoteX;

type
  SP_DEVINFO_DATA = SP_DEVINFO_DATA = record//size=1C
cbSize:Cardinal;//f0
ClassGuid:TGUID;//f4
DevInst:Cardinal;//f14
Reserved:Cardinal;//f18
end;;
  HIDD_CONFIGURATION = HIDD_CONFIGURATION = record//size=C
cookie:Pointer;//f0
size:Cardinal;//f4
RingBufferSize:Cardinal;//f8
end;;
  HIDD_ATTRIBUTES = HIDD_ATTRIBUTES = record//size=C
Size:Cardinal;//f0
VendorID:Word;//f4
ProductID:Word;//f6
VersionNumber:Word;//f8
end;;
  USAGE_AND_PAGE = USAGE_AND_PAGE = record//size=4
Usage:Word;//f0
UsagePage:Word;//f2
end;;
  HIDP_BUTTON_CAPS = HIDP_BUTTON_CAPS = record//size=48
UsagePage:Word;//f0
ReportID:Byte;//f2
IsAlias:ByteBool;//f3
BitField:Word;//f4
LinkCollection:Word;//f6
LinkUsage:Word;//f8
LinkUsagePage:Word;//fA
IsRange:ByteBool;//fC
IsStringRange:ByteBool;//fD
IsDesignatorRange:ByteBool;//fE
IsAbsolute:ByteBool;//fF
Reserved:?;//f10
UsageMin:Word;//f38
UsageMax:Word;//f3A
StringMin:Word;//f3C
StringMax:Word;//f3E
DesignatorMin:Word;//f40
DesignatorMax:Word;//f42
DataIndexMin:Word;//f44
DataIndexMax:Word;//f46
Usage:Word;//f38
Reserved1:Word;//f3A
StringIndex:Word;//f3C
Reserved2:Word;//f3E
DesignatorIndex:Word;//f40
Reserved3:Word;//f42
DataIndex:Word;//f44
Reserved4:Word;//f46
end;;
  HIDP_VALUE_CAPS = HIDP_VALUE_CAPS = record//size=48
UsagePage:Word;//f0
ReportID:Byte;//f2
IsAlias:ByteBool;//f3
BitField:Word;//f4
LinkCollection:Word;//f6
LinkUsage:Word;//f8
LinkUsagePage:Word;//fA
IsRange:ByteBool;//fC
IsStringRange:ByteBool;//fD
IsDesignatorRange:ByteBool;//fE
IsAbsolute:ByteBool;//fF
HasNull:ByteBool;//f10
Reserved:Byte;//f11
BitSize:Word;//f12
ReportCount:Word;//f14
Reserved_:?;//f16
UnitsExp:Cardinal;//f20
Units:Cardinal;//f24
LogicalMin:Integer;//f28
LogicalMax:Integer;//f2C
PhysicalMin:Integer;//f30
PhysicalMax:Integer;//f34
UsageMin:Word;//f38
UsageMax:Word;//f3A
StringMin:Word;//f3C
StringMax:Word;//f3E
DesignatorMin:Word;//f40
DesignatorMax:Word;//f42
DataIndexMin:Word;//f44
DataIndexMax:Word;//f46
Usage:Word;//f38
Reserved1:Word;//f3A
StringIndex:Word;//f3C
Reserved2:Word;//f3E
DesignatorIndex:Word;//f40
Reserved3:Word;//f42
DataIndex:Word;//f44
Reserved4:Word;//f46
end;;
  HIDP_LINK_COLLECTION_NODE = HIDP_LINK_COLLECTION_NODE = record//size=14
LinkUsage:Word;//f0
LinkUsagePage:Word;//f2
Parent:Word;//f4
NumberOfChildren:Word;//f6
NextSibling:Word;//f8
FirstChild:Word;//fA
CollectionType:Byte;//fC
IsAlias:Byte;//fD
Reserved:Word;//fE
UserContext:Pointer;//f10
end;;
  HIDP_CAPS = HIDP_CAPS = record//size=40
Usage:Word;//f0
UsagePage:Word;//f2
InputReportByteLength:Word;//f4
OutputReportByteLength:Word;//f6
FeatureReportByteLength:Word;//f8
Reserved:?;//fA
NumberLinkCollectionNodes:Word;//f2C
NumberInputButtonCaps:Word;//f2E
NumberInputValueCaps:Word;//f30
NumberInputDataIndices:Word;//f32
NumberOutputButtonCaps:Word;//f34
NumberOutputValueCaps:Word;//f36
NumberOutputDataIndices:Word;//f38
NumberFeatureButtonCaps:Word;//f3A
NumberFeatureValueCaps:Word;//f3C
NumberFeatureDataIndices:Word;//f3E
end;;
  HIDP_DATA = HIDP_DATA = record//size=8
DataIndex:Word;//f0
Reserved:Word;//f2
RawValue:Cardinal;//f4
On_:ByteBool;//f4
end;;
  HIDP_UNKNOWN_TOKEN = HIDP_UNKNOWN_TOKEN = record//size=8
Token:Byte;//f0
Reserved:?;//f1
BitField:Cardinal;//f4
end;;
  HIDP_EXTENDED_ATTRIBUTES = HIDP_EXTENDED_ATTRIBUTES = record//size=C
NumGlobalUnknowns:Byte;//f0
Reserved:?;//f1
GlobalUnknowns:PHIDPUnknownToken;//f4
Data:?;//f8
end;;
  TJvHidEnumerateEvent = function(HidDev:TJvHidDevice; const Idx:Integer):Boolean of object;;
  TJvHidPlugEvent = procedure(HidDev:TJvHidDevice) of object;;
  TJvHidDataEvent = procedure(HidDev:TJvHidDevice; ReportID:Byte; const Data:Pointer; Size:Word) of object;;
  TJvHidDataErrorEvent = procedure(HidDev:TJvHidDevice; Error:Cardinal) of object;;
  TJvHidOpenExMode = (omhRead, omhWrite);
  TJvPhysicalDescriptor = array of Word;
//elSize = 2;
  TJvHidPnPInfo = class(TObject)
  published
    destructor Destroy();//005DE5E4
    constructor Create(APnPHandle:Pointer; ADevicePath:PWideChar; ADevData:SP_DEVINFO_DATA);//005DE2E8
  public
    FDeviceID:Cardinal;//f4
    FDevicePath:string;//f8
    FCapabilities:Cardinal;//fC
    FClassDescr:string;//f10
    FClassGUID:string;//f14
    FCompatibleIDs:TStringList;//f18
    FConfigFlags:Cardinal;//f1C
    FDeviceDescr:string;//f20
    FDriver:string;//f24
    FFriendlyName:string;//f28
    FHardwareID:TStringList;//f2C
    FLowerFilters:TStringList;//f30
    FMfg:string;//f34
    FUpperFilters:TStringList;//f38
    FAddress:string;//f3C
    FBusNumber:Cardinal;//f40
    FBusType:string;//f44
    FCharacteristics:string;//f48
    FDevType:Cardinal;//f4C
    FEnumeratorName:string;//f50
    FExclusive:Cardinal;//f54
    FLegacyBusType:Cardinal;//f58
    FLocationInfo:string;//f5C
    FPhysDevObjName:string;//f60
    FSecuritySDS:string;//f64
    FService:string;//f68
    FUINumber:Cardinal;//f6C
    FUINumberFormat:string;//f70
  end;
  :TJvHidDeviceReadThread.:1 = array of Byte;
//elSize = 1
//varType equivalent: varByte;
  TJvHidDeviceReadThread = class(TThread)
  published
    constructor sub_005DE174(CreateSuspended:Boolean);//005DE174
    procedure Execute;//005DE200
  public
    FErr:Cardinal;//f40
    Device:TJvHidDevice;//f44
    NumBytesRead:Cardinal;//f48
    Report::1;//f4C
    procedure Execute; virtual;//v4//005DE200
    constructor Create;//005DE100
  end;
  :TJvHidDevice.:1 = array of HIDP_LINK_COLLECTION_NODE;
//elSize = 14;
  TJvHidDevice = class(TObject)
  published
    //function SetUsages(UsageList:PUsage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;//005DF914
    //function SetScaledUsageValue(UsageValue:Integer; var Report:?; ReportLength:Cardinal):Integer;//005DFC2C
    //function SetUsageValue(UsageValue:Cardinal; var Report:?; ReportLength:Cardinal):Integer;//005DFBC8
    //function UnsetButtons(UsageList:PUsage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;//005DFA34
    //function SetUsageValueArray(UsageValue:PAnsiChar; UsageValueByteLength:Word; ReportLength:Cardinal; var Report:?):Integer;//005DFC90
    function OpenFileEx(Mode:TJvHidOpenExMode):Boolean;//005DEC1C
    function OpenFile:Boolean;//005DEB74
    //function SetButtons(UsageList:PUsage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;//005DF974
    //function SetFeature(var Report:?; Size:Integer):Boolean;//005DF5A8
    //function SetData(DataList:PHIDPData; var DataLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;//005DF754
    function GetExtendedAttributes(ReportType:Cardinal; DataIndex:Word; var LengthAttributes:Cardinal; Attributes:PHIDPExtendedAttributes):Integer;//005DFEB4
    function CheckOut:Boolean;//005DFE78
    //function InitializeReportForID(ReportType:Cardinal; ReportID:Byte; ReportLength:Cardinal; var Report:?):Integer;//005DFEE8
    //function SetOutputReport(var Report:?; Size:Cardinal):Boolean;//005DFF5C
    //function GetInputReport(var Report:?; Size:Cardinal):Boolean;//005DFF1C
    //function ReadFile(var Report:?; ToRead:Cardinal; var BytesRead:Cardinal):Boolean;//005DFD48
    //function UnsetUsages(UsageList:PUsage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;//005DF9D4
    //function ReadFileEx(var Report:?; ToRead:Cardinal; CallBack:Pointer):Boolean;//005DFDC8
    //function WriteFileEx(var Report:?; ToWrite:Cardinal; CallBack:Pointer):Boolean;//005DFE20
    //function WriteFile(var Report:?; ToWrite:Cardinal; var BytesWritten:Cardinal):Boolean;//005DFD88
    function FlushQueue:Boolean;//005DF548
    function DeviceIoControl(IoControlCode:Cardinal; InBuffer:Pointer; var BytesReturned:Cardinal; OutSize:Cardinal; OutBuffer:Pointer; InSize:Cardinal):Boolean;//005DFCFC
    function GetButtonCaps(ButtonCaps:PHIDPButtonCaps; var Count:Word):Integer;//005DF634
    //function GetButtonsEx(UsageList:PUsageAndPage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;//005DF8BC
    //function GetButtons(UsageList:PUsage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;//005DF804
    destructor Destroy();//005DE9E8
    constructor sub_005DE7A8;//005DE7A8
    function CancelIO(Mode:TJvHidOpenExMode):Boolean;//005DF4B8
    procedure CloseFileEx(Mode:TJvHidOpenExMode);//005DF50C
    procedure CloseFile;//005DF4EC
    //function GetUsagesEx(UsageList:PUsageAndPage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;//005DF864
    //function GetUsages(UsageList:PUsage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;//005DF7A4
    //function GetUsageValue(var UsageValue:Cardinal; var Report:?; ReportLength:Cardinal):Integer;//005DFA94
    function GetValueCaps(ValueCaps:PHIDPValueCaps; var Count:Word):Integer;//005DF6C8
    //function GetUsageValueArray(UsageValue:PAnsiChar; UsageValueByteLength:Word; ReportLength:Cardinal; var Report:?):Integer;//005DFB5C
    //function GetFeature(var Report:?; Size:Integer):Boolean;//005DF574
    //function GetData(DataList:PHIDPData; var DataLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;//005DF704
    //function GetScaledUsageValue(var UsageValue:Integer; var Report:?; ReportLength:Cardinal):Integer;//005DFAF8
    function GetSpecificValueCaps(ValueCaps:PHIDPValueCaps; var Count:Word):Integer;//005DF670
    function GetSpecificButtonCaps(ButtonCaps:PHIDPButtonCaps; var Count:Word):Integer;//005DF5DC
  public
    FMyController:TJvHidDeviceController;//f4
    FIsPluggedIn:Boolean;//f8
    FIsCheckedOut:Boolean;//f9
    FIsEnumerated:Boolean;//fA
    FHidFileHandle:Cardinal;//fC
    FHidOverlappedRead:Cardinal;//f10
    FHidOverlappedWrite:Cardinal;//f14
    FOvlRead:_OVERLAPPED;//f18
    FOvlWrite:_OVERLAPPED;//f2C
    FAttributes:HIDD_ATTRIBUTES;//f40
    FPnPInfo:TJvHidPnPInfo;//f4C
    FVendorName:WideString;//f50
    FProductName:WideString;//f54
    FPhysicalDescriptor:TJvPhysicalDescriptor;//f58
    FPreparsedData:Pointer;//f5C
    FSerialNumber:WideString;//f60
    FLanguageStrings:TStringList;//f64
    FNumInputBuffers:Integer;//f68
    FNumOverlappedBuffers:Integer;//f6C
    FThreadSleepTime:Integer;//f70
    FLinkCollection::1;//f74
    FMaxDataListLength:Cardinal;//f78
    FMaxUsageListLength:Cardinal;//f7C
    FMaxButtonListLength:Cardinal;//f80
    FReportTypeParam:Cardinal;//f84
    FUsagePageParam:word;//f88
    FLinkCollectionParam:word;//f8A
    FUsageParam:word;//f8C
    FData:TJvHidDataEvent;//f90
    f92:word;//f92
    f94:dword;//f94
    FDataError:TJvHidDataErrorEvent;//f98
    FUnplug:TJvHidPlugEvent;//fA0
    fA4:TManagedHidObject;//fA4
    FHasReadWriteAccess:Boolean;//fA8
    FDataThread:TJvHidDeviceReadThread;//fAC
    FTag:Integer;//fB0
    //constructor Create(?:?);//005DE808
  end;
  TJvHidDeviceController = class(TJvComponent)
  published
    function CountByClass(ClassName:string):Integer;//005E0DE4
    function CountByID(Vid:Integer; Pid:Integer):Integer;//005E0E44
    function CheckOutByVendorName(var HidDev:TJvHidDevice; VendorName:WideString):Boolean;//005E0AD8
    procedure CheckOutByCallback(var HidDev:TJvHidDevice; Check:TJvHidCheckCallback);//005E0B8C
    function CountByProductName(ProductName:WideString):Integer;//005E0EC0
    function Enumerate:Integer;//005E0968
    //procedure HidVersion(?:?);//005E064C
    function CountByVendorName(VendorName:WideString):Integer;//005E0F5C
    function CountByCallback(Check:TJvHidCheckCallback):Integer;//005E0FF8
    destructor Destroy();//005E00B0
    procedure CheckIn(var HidDev:TJvHidDevice);//005E0D8C
    procedure DeviceChange;//005E0398
    constructor Create(AOwner:TComponent);//005DFF9C
    procedure CheckOut(var HidDev:TJvHidDevice);//005E0D4C
    function CheckOutByIndex(var HidDev:TJvHidDevice; Idx:Integer):Boolean;//005E0D20
    function CheckOutByProductName(var HidDev:TJvHidDevice; ProductName:WideString):Boolean;//005E0A24
    function CheckOutByClass(var HidDev:TJvHidDevice; ClassName:string):Boolean;//005E0C28
    procedure CheckOutByID(var HidDev:TJvHidDevice; Vid:Integer; Pid:Integer);//005E0C9C
  public
    FHidGuid:TGUID;//f38
    FArrivalEvent:TJvHidPlugEvent;//f48
    f4C:TWiimoteManager;//f4C
    FDeviceChangeEvent:TNotifyEvent;//f50
    f54:dword;//f54
    FEnumerateEvent:TJvHidEnumerateEvent;//f58
    f5C:dword;//f5C
    FDevDataEvent:TJvHidDataEvent;//f60
    f64:dword;//f64
    FDevDataErrorEvent:TJvHidDataErrorEvent;//f68
    f6C:dword;//f6C
    FDevUnplugEvent:TJvHidPlugEvent;//f70
    f74:dword;//f74
    FRemovalEvent:TJvHidPlugEvent;//f78
    f7C:TWiimoteManager;//f7C
    FDevThreadSleepTime:Integer;//f80
    FVersion:string;//f84
    FDummy:string;//f88
    FList:TList;//f8C
    FNumCheckedInDevices:Integer;//f90
    FNumCheckedOutDevices:Integer;//f94
    FNumUnpluggedDevices:Integer;//f98
    FInDeviceChange:Boolean;//f9C
    FLParam:Integer;//fA0
    FHWnd:HWND;//fA4
    destructor Destroy(); virtual;//005E00B0
    constructor Create(AOwner:TComponent); virtual;//v2C//005DFF9C
    //procedure SetOnDeviceChange(Value:TNotifyEvent; ?:?; ?:?);//005E0758
    //procedure SetOnEnumerate(Value:TJvHidEnumerateEvent; ?:?; ?:?);//005E07D0
    procedure SetDevThreadSleepTime(Value:Integer);//005E07E4
    //procedure SetOnDeviceData(Value:TJvHidDataEvent; ?:?; ?:?);//005E0834
    //procedure SetOnDeviceDataError(Value:TJvHidDataErrorEvent; ?:?; ?:?);//005E0890
    //procedure SetOnDeviceUnplug(Value:TJvHidPlugEvent; ?:?; ?:?);//005E08FC
  end;
  EControllerError = class(EJVCLException)
  end;
  :TJvHidDeviceController.:1 = array of Byte;
//elSize = 1
//varType equivalent: varByte;
  TAccelerometers = class(TObject)
  published
    constructor Create;//005E12AC
    //function Reset:?;//005E12E8
    //procedure Update(newgz:Double; ?:?; newgy:Double; ?:?; newgx:Double; ?:?);//005E1348
  public
    gx:Double;//f8
    fC:dword;//fC
    gy:Double;//f10
    f14:dword;//f14
    gz:Double;//f18
    f1C:dword;//f1C
    lng:Double;//f20
    f24:dword;//f24
    tolerance:Double;//f28
    f2C:dword;//f2C
    upx:Double;//f30
    f34:dword;//f34
    upy:Double;//f38
    f3C:dword;//f3C
    upz:Double;//f40
    f44:dword;//f44
    pitch:Double;//f48
    f4C:dword;//f4C
    roll:Double;//f50
    f54:dword;//f54
    SmoothPitch:Double;//f58
    f5C:dword;//f5C
    SmoothRoll:Double;//f60
    f64:dword;//f64
  end;
  DIDEVICEINSTANCEA = DIDEVICEINSTANCEA = record//size=244
dwSize:Cardinal;//f0
guidInstance:TGUID;//f4
guidProduct:TGUID;//f14
dwDevType:Cardinal;//f24
tszInstanceName:?;//f28
tszProductName:?;//f12C
guidFFDriver:TGUID;//f230
wUsagePage:Word;//f240
wUsage:Word;//f242
end;;
  DIJOYSTATE2 = DIJOYSTATE2 = record//size=110
lX:Integer;//f0
lY:Integer;//f4
lZ:Integer;//f8
lRx:Integer;//fC
lRy:Integer;//f10
lRz:Integer;//f14
rglSlider:?;//f18
rgdwPOV:?;//f20
rgbButtons:?;//f30
lVX:Integer;//fB0
lVY:Integer;//fB4
lVZ:Integer;//fB8
lVRx:Integer;//fBC
lVRy:Integer;//fC0
lVRz:Integer;//fC4
rglVSlider:?;//fC8
lAX:Integer;//fD0
lAY:Integer;//fD4
lAZ:Integer;//fD8
lARx:Integer;//fDC
lARy:Integer;//fE0
lARz:Integer;//fE4
rglASlider:?;//fE8
lFX:Integer;//fF0
lFY:Integer;//fF4
lFZ:Integer;//fF8
lFRx:Integer;//fFC
lFRy:Integer;//f100
lFRz:Integer;//f104
rglFSlider:?;//f108
end;;
  TTimeObject = class(TObject)
  published
    constructor Create;//005E27A4
  public
    ..Value:Double;//f8
  end;
    //function sub_005D24BC(?:?; ?:UString):?;//005D24BC
    //procedure sub_005D253C(?:?);//005D253C
    //function sub_005D2554(?:?; ?:UString; ?:?):?;//005D2554
    //function sub_005D263C:?;//005D263C
    procedure sub_005D87F4;//005D87F4
    //function sub_005D9F40(?:?):?;//005D9F40
    //function sub_005D9F5C(?:?):?;//005D9F5C
    function sub_005D9F78:Boolean;//005D9F78
    //function sub_005D9F84:?;//005D9F84
    procedure sub_005DAC6C;//005DAC6C
    function ReadFileEx(lpBuffer:Pointer; nNumberOfBytesToRead:DWORD; lpOverlapped:POverlapped; lpCompletionRoutine:Pointer):LongBool; stdcall;//005DE0F0
    function WriteFileEx(lpBuffer:Pointer; nNumberOfBytesToWrite:DWORD; const lpOverlapped:_OVERLAPPED; lpCompletionRoutine:Pointer):LongBool; stdcall;//005DE0F8
    procedure sub_005DE1AC(?:TJvHidDeviceReadThread);//005DE1AC
    //procedure sub_005DE63C(?:?; ?:?);//005DE63C
    //function sub_005DE694(?:?):?;//005DE694
    //function sub_005DE76C(?:?):?;//005DE76C
    //function sub_005DEB5C(?:TJvHidDevice):?;//005DEB5C
    procedure sub_005DECD4(?:Pointer);//005DECD4
    //procedure sub_005DED90(?:?);//005DED90
    //procedure sub_005DEE04(?:?; ?:?);//005DEE04
    procedure sub_005DEE10(?:TJvHidDevice; ?:Integer);//005DEE10
    //function sub_005DEE68(?:TJvHidDevice):?;//005DEE68
    //procedure sub_005DEE9C(?:TJvHidDevice; ?:?);//005DEE9C
    //procedure sub_005DEEC8(?:Pointer; ?:?);//005DEEC8
    //procedure sub_005DEF40(?:Pointer; ?:?);//005DEF40
    //procedure sub_005DEFB8(?:TJvHidDevice; ?:?);//005DEFB8
    //function sub_005DF304(?:TJvHidDevice):?;//005DF304
    //procedure sub_005DF390(?:TJvHidDevice; ?:?; ?:?; ?:?);//005DF390
    procedure sub_005DF3C4(?:TJvHidDevice);//005DF3C4
    procedure sub_005DF408(?:TJvHidDevice);//005DF408
    //function sub_005DF43C(?:Cardinal):?;//005DF43C
    procedure sub_005E0160(?:TJvHidDeviceController; ?:Pointer);//005E0160
    procedure sub_005E0180(?:TJvHidDeviceController; ?:Pointer);//005E0180
    procedure sub_005E01A0(?:TJvHidDeviceController);//005E01A0
    //procedure sub_005E0214(?:?);//005E0214
    //function sub_005E0780(?:TJvHidDeviceController; ?:Pointer; ?:?):?;//005E0780
    //function sub_005E09BC(?:TJvHidDeviceController; ?:TJvHidDevice; ?:Integer; ?:?):?;//005E09BC
    function DirectInput8Create(dwVersion:DWORD; const riidltf:TGUID; var ppvOut:void ; punkOuter:IUnknown):HRESULT; stdcall;//005E1910
    procedure sub_005E19F8;//005E19F8
    procedure sub_005E1B80;//005E1B80
    //procedure sub_005E1B94(?:?; ?:?; ?:?; ?:?; ?:?);//005E1B94
    //procedure sub_005E2300(?:?);//005E2300
    //procedure sub_005E238C(?:?);//005E238C
    //procedure sub_005E2444(?:?);//005E2444
    //procedure sub_005E2540(?:?);//005E2540
    procedure sub_005E263C;//005E263C
    procedure sub_005E265C;//005E265C
    procedure sub_005E267C;//005E267C
    //function sub_005E2694:?;//005E2694

implementation

//005D24BC
{*function sub_005D24BC(?:?; ?:UString):?;
begin
 005D24BC    push        ebp
 005D24BD    mov         ebp,esp
 005D24BF    add         esp,0FFFFFFF8
 005D24C2    push        ebx
 005D24C3    xor         ecx,ecx
 005D24C5    mov         dword ptr [ebp-8],ecx
 005D24C8    mov         dword ptr [ebp-4],edx
 005D24CB    mov         ebx,eax
 005D24CD    mov         eax,dword ptr [ebp-4]
 005D24D0    call        @UStrAddRef
 005D24D5    xor         eax,eax
 005D24D7    push        ebp
 005D24D8    push        5D252C
 005D24DD    push        dword ptr fs:[eax]
 005D24E0    mov         dword ptr fs:[eax],esp
 005D24E3    cmp         dword ptr [ebx],0
>005D24E6    jne         005D2509
 005D24E8    mov         eax,dword ptr [ebp-4]
 005D24EB    call        @UStrToPWChar
 005D24F0    mov         edx,eax
 005D24F2    lea         eax,[ebp-8]
 005D24F5    call        @UStrFromPWChar
 005D24FA    mov         eax,dword ptr [ebp-8]
 005D24FD    mov         edx,8000
 005D2502    call        SafeLoadLibrary
 005D2507    mov         dword ptr [ebx],eax
 005D2509    cmp         dword ptr [ebx],0
 005D250C    setne       al
 005D250F    mov         ebx,eax
 005D2511    xor         eax,eax
 005D2513    pop         edx
 005D2514    pop         ecx
 005D2515    pop         ecx
 005D2516    mov         dword ptr fs:[eax],edx
 005D2519    push        5D2533
 005D251E    lea         eax,[ebp-8]
 005D2521    mov         edx,2
 005D2526    call        @UStrArrayClr
 005D252B    ret
>005D252C    jmp         @HandleFinally
>005D2531    jmp         005D251E
 005D2533    mov         eax,ebx
 005D2535    pop         ebx
 005D2536    pop         ecx
 005D2537    pop         ecx
 005D2538    pop         ebp
 005D2539    ret
end;*}

//005D253C
{*procedure sub_005D253C(?:?);
begin
 005D253C    push        ebx
 005D253D    mov         ebx,eax
 005D253F    cmp         dword ptr [ebx],0
>005D2542    je          005D254C
 005D2544    mov         eax,dword ptr [ebx]
 005D2546    push        eax
 005D2547    call        kernel32.FreeLibrary
 005D254C    xor         eax,eax
 005D254E    mov         dword ptr [ebx],eax
 005D2550    pop         ebx
 005D2551    ret
end;*}

//005D2554
{*function sub_005D2554(?:?; ?:UString; ?:?):?;
begin
 005D2554    push        ebp
 005D2555    mov         ebp,esp
 005D2557    push        ecx
 005D2558    push        ebx
 005D2559    push        esi
 005D255A    push        edi
 005D255B    mov         esi,ecx
 005D255D    mov         dword ptr [ebp-4],edx
 005D2560    mov         edi,eax
 005D2562    mov         eax,dword ptr [ebp-4]
 005D2565    call        @UStrAddRef
 005D256A    xor         eax,eax
 005D256C    push        ebp
 005D256D    push        5D25B6
 005D2572    push        dword ptr fs:[eax]
 005D2575    mov         dword ptr fs:[eax],esp
 005D2578    xor         ebx,ebx
 005D257A    test        edi,edi
>005D257C    je          005D258F
 005D257E    mov         eax,dword ptr [ebp-4]
 005D2581    call        @UStrToPWChar
 005D2586    push        eax
 005D2587    push        edi
 005D2588    call        GetProcAddress
 005D258D    mov         ebx,eax
 005D258F    cmp         byte ptr [esi],0
>005D2592    je          005D2598
 005D2594    test        ebx,ebx
>005D2596    jne         005D259C
 005D2598    xor         eax,eax
>005D259A    jmp         005D259E
 005D259C    mov         al,1
 005D259E    mov         byte ptr [esi],al
 005D25A0    xor         eax,eax
 005D25A2    pop         edx
 005D25A3    pop         ecx
 005D25A4    pop         ecx
 005D25A5    mov         dword ptr fs:[eax],edx
 005D25A8    push        5D25BD
 005D25AD    lea         eax,[ebp-4]
 005D25B0    call        @UStrClr
 005D25B5    ret
>005D25B6    jmp         @HandleFinally
>005D25BB    jmp         005D25AD
 005D25BD    mov         eax,ebx
 005D25BF    pop         edi
 005D25C0    pop         esi
 005D25C1    pop         ebx
 005D25C2    pop         ecx
 005D25C3    pop         ebp
 005D25C4    ret
end;*}

//005D263C
{*function sub_005D263C:?;
begin
 005D263C    push        ebx
 005D263D    push        esi
 005D263E    push        ecx
 005D263F    mov         ebx,78A03C
 005D2644    mov         esi,esp
 005D2646    mov         byte ptr [esi],1
 005D2649    inc         dword ptr ds:[78A040];gvar_0078A040
 005D264F    cmp         dword ptr ds:[78A040],1;gvar_0078A040
>005D2656    jg          005D43E1
 005D265C    mov         eax,ebx
 005D265E    mov         edx,5D43F4;'SetupApi.dll'
 005D2663    call        005D24BC
 005D2668    mov         byte ptr [esi],al
 005D266A    cmp         byte ptr [esi],0
>005D266D    je          005D43E1
 005D2673    mov         ecx,esi
 005D2675    mov         edx,5D441C;'SetupGetInfInformationA'
 005D267A    mov         eax,dword ptr [ebx]
 005D267C    call        005D2554
 005D2681    mov         [00815AC0],eax;gvar_00815AC0
 005D2686    mov         ecx,esi
 005D2688    mov         edx,5D4458;'SetupGetInfInformationW'
 005D268D    mov         eax,dword ptr [ebx]
 005D268F    call        005D2554
 005D2694    mov         [00815AC4],eax;gvar_00815AC4
 005D2699    mov         ecx,esi
 005D269B    mov         edx,5D4458;'SetupGetInfInformationW'
 005D26A0    mov         eax,dword ptr [ebx]
 005D26A2    call        005D2554
 005D26A7    mov         [00815AC8],eax;gvar_00815AC8
 005D26AC    mov         ecx,esi
 005D26AE    mov         edx,5D4494;'SetupQueryInfFileInformationA'
 005D26B3    mov         eax,dword ptr [ebx]
 005D26B5    call        005D2554
 005D26BA    mov         [00815ACC],eax;gvar_00815ACC
 005D26BF    mov         ecx,esi
 005D26C1    mov         edx,5D44DC;'SetupQueryInfFileInformationW'
 005D26C6    mov         eax,dword ptr [ebx]
 005D26C8    call        005D2554
 005D26CD    mov         [00815AD0],eax;gvar_00815AD0
 005D26D2    mov         ecx,esi
 005D26D4    mov         edx,5D44DC;'SetupQueryInfFileInformationW'
 005D26D9    mov         eax,dword ptr [ebx]
 005D26DB    call        005D2554
 005D26E0    mov         [00815AD4],eax;gvar_00815AD4
 005D26E5    mov         ecx,esi
 005D26E7    mov         edx,5D4524;'SetupQueryInfVersionInformationA'
 005D26EC    mov         eax,dword ptr [ebx]
 005D26EE    call        005D2554
 005D26F3    mov         [00815AD8],eax;gvar_00815AD8
 005D26F8    mov         ecx,esi
 005D26FA    mov         edx,5D4574;'SetupQueryInfVersionInformationW'
 005D26FF    mov         eax,dword ptr [ebx]
 005D2701    call        005D2554
 005D2706    mov         [00815ADC],eax;gvar_00815ADC
 005D270B    mov         ecx,esi
 005D270D    mov         edx,5D4574;'SetupQueryInfVersionInformationW'
 005D2712    mov         eax,dword ptr [ebx]
 005D2714    call        005D2554
 005D2719    mov         [00815AE0],eax;gvar_00815AE0
 005D271E    mov         ecx,esi
 005D2720    mov         edx,5D45C4;'SetupGetInfFileListA'
 005D2725    mov         eax,dword ptr [ebx]
 005D2727    call        005D2554
 005D272C    mov         [00815AE4],eax;gvar_00815AE4
 005D2731    mov         ecx,esi
 005D2733    mov         edx,5D45FC;'SetupGetInfFileListW'
 005D2738    mov         eax,dword ptr [ebx]
 005D273A    call        005D2554
 005D273F    mov         [00815AE8],eax;gvar_00815AE8
 005D2744    mov         ecx,esi
 005D2746    mov         edx,5D45FC;'SetupGetInfFileListW'
 005D274B    mov         eax,dword ptr [ebx]
 005D274D    call        005D2554
 005D2752    mov         [00815AEC],eax;gvar_00815AEC
 005D2757    mov         ecx,esi
 005D2759    mov         edx,5D4634;'SetupOpenInfFileA'
 005D275E    mov         eax,dword ptr [ebx]
 005D2760    call        005D2554
 005D2765    mov         [00815AF0],eax;gvar_00815AF0
 005D276A    mov         ecx,esi
 005D276C    mov         edx,5D4664;'SetupOpenInfFileW'
 005D2771    mov         eax,dword ptr [ebx]
 005D2773    call        005D2554
 005D2778    mov         [00815AF4],eax;gvar_00815AF4
 005D277D    mov         ecx,esi
 005D277F    mov         edx,5D4664;'SetupOpenInfFileW'
 005D2784    mov         eax,dword ptr [ebx]
 005D2786    call        005D2554
 005D278B    mov         [00815AF8],eax;gvar_00815AF8
 005D2790    mov         ecx,esi
 005D2792    mov         edx,5D4694;'SetupOpenMasterInf'
 005D2797    mov         eax,dword ptr [ebx]
 005D2799    call        005D2554
 005D279E    mov         [00815AFC],eax;gvar_00815AFC
 005D27A3    mov         ecx,esi
 005D27A5    mov         edx,5D46C8;'SetupOpenAppendInfFileA'
 005D27AA    mov         eax,dword ptr [ebx]
 005D27AC    call        005D2554
 005D27B1    mov         [00815B00],eax;gvar_00815B00
 005D27B6    mov         ecx,esi
 005D27B8    mov         edx,5D4704;'SetupOpenAppendInfFileW'
 005D27BD    mov         eax,dword ptr [ebx]
 005D27BF    call        005D2554
 005D27C4    mov         [00815B04],eax;gvar_00815B04
 005D27C9    mov         ecx,esi
 005D27CB    mov         edx,5D4704;'SetupOpenAppendInfFileW'
 005D27D0    mov         eax,dword ptr [ebx]
 005D27D2    call        005D2554
 005D27D7    mov         [00815B08],eax;gvar_00815B08
 005D27DC    mov         ecx,esi
 005D27DE    mov         edx,5D4740;'SetupCloseInfFile'
 005D27E3    mov         eax,dword ptr [ebx]
 005D27E5    call        005D2554
 005D27EA    mov         [00815B0C],eax;gvar_00815B0C
 005D27EF    mov         ecx,esi
 005D27F1    mov         edx,5D4770;'SetupFindFirstLineA'
 005D27F6    mov         eax,dword ptr [ebx]
 005D27F8    call        005D2554
 005D27FD    mov         [00815B10],eax;gvar_00815B10
 005D2802    mov         ecx,esi
 005D2804    mov         edx,5D47A4;'SetupFindFirstLineW'
 005D2809    mov         eax,dword ptr [ebx]
 005D280B    call        005D2554
 005D2810    mov         [00815B14],eax;gvar_00815B14
 005D2815    mov         ecx,esi
 005D2817    mov         edx,5D47A4;'SetupFindFirstLineW'
 005D281C    mov         eax,dword ptr [ebx]
 005D281E    call        005D2554
 005D2823    mov         [00815B18],eax;gvar_00815B18
 005D2828    mov         ecx,esi
 005D282A    mov         edx,5D47D8;'SetupFindNextLine'
 005D282F    mov         eax,dword ptr [ebx]
 005D2831    call        005D2554
 005D2836    mov         [00815B1C],eax;gvar_00815B1C
 005D283B    mov         ecx,esi
 005D283D    mov         edx,5D4808;'SetupFindNextMatchLineA'
 005D2842    mov         eax,dword ptr [ebx]
 005D2844    call        005D2554
 005D2849    mov         [00815B20],eax;gvar_00815B20
 005D284E    mov         ecx,esi
 005D2850    mov         edx,5D4844;'SetupFindNextMatchLineW'
 005D2855    mov         eax,dword ptr [ebx]
 005D2857    call        005D2554
 005D285C    mov         [00815B24],eax;gvar_00815B24
 005D2861    mov         ecx,esi
 005D2863    mov         edx,5D4844;'SetupFindNextMatchLineW'
 005D2868    mov         eax,dword ptr [ebx]
 005D286A    call        005D2554
 005D286F    mov         [00815B28],eax;gvar_00815B28
 005D2874    mov         ecx,esi
 005D2876    mov         edx,5D4880;'SetupGetLineByIndexA'
 005D287B    mov         eax,dword ptr [ebx]
 005D287D    call        005D2554
 005D2882    mov         [00815B2C],eax;gvar_00815B2C
 005D2887    mov         ecx,esi
 005D2889    mov         edx,5D48B8;'SetupGetLineByIndexW'
 005D288E    mov         eax,dword ptr [ebx]
 005D2890    call        005D2554
 005D2895    mov         [00815B30],eax;gvar_00815B30
 005D289A    mov         ecx,esi
 005D289C    mov         edx,5D48B8;'SetupGetLineByIndexW'
 005D28A1    mov         eax,dword ptr [ebx]
 005D28A3    call        005D2554
 005D28A8    mov         [00815B34],eax;gvar_00815B34
 005D28AD    mov         ecx,esi
 005D28AF    mov         edx,5D48F0;'SetupGetLineCountA'
 005D28B4    mov         eax,dword ptr [ebx]
 005D28B6    call        005D2554
 005D28BB    mov         [00815B38],eax;gvar_00815B38
 005D28C0    mov         ecx,esi
 005D28C2    mov         edx,5D4924;'SetupGetLineCountW'
 005D28C7    mov         eax,dword ptr [ebx]
 005D28C9    call        005D2554
 005D28CE    mov         [00815B3C],eax;gvar_00815B3C
 005D28D3    mov         ecx,esi
 005D28D5    mov         edx,5D4924;'SetupGetLineCountW'
 005D28DA    mov         eax,dword ptr [ebx]
 005D28DC    call        005D2554
 005D28E1    mov         [00815B40],eax;gvar_00815B40
 005D28E6    mov         ecx,esi
 005D28E8    mov         edx,5D4958;'SetupGetLineTextA'
 005D28ED    mov         eax,dword ptr [ebx]
 005D28EF    call        005D2554
 005D28F4    mov         [00815B44],eax;gvar_00815B44
 005D28F9    mov         ecx,esi
 005D28FB    mov         edx,5D4988;'SetupGetLineTextW'
 005D2900    mov         eax,dword ptr [ebx]
 005D2902    call        005D2554
 005D2907    mov         [00815B48],eax;gvar_00815B48
 005D290C    mov         ecx,esi
 005D290E    mov         edx,5D4988;'SetupGetLineTextW'
 005D2913    mov         eax,dword ptr [ebx]
 005D2915    call        005D2554
 005D291A    mov         [00815B4C],eax;gvar_00815B4C
 005D291F    mov         ecx,esi
 005D2921    mov         edx,5D49B8;'SetupGetFieldCount'
 005D2926    mov         eax,dword ptr [ebx]
 005D2928    call        005D2554
 005D292D    mov         [00815B50],eax;gvar_00815B50
 005D2932    mov         ecx,esi
 005D2934    mov         edx,5D49EC;'SetupGetStringFieldA'
 005D2939    mov         eax,dword ptr [ebx]
 005D293B    call        005D2554
 005D2940    mov         [00815B54],eax;gvar_00815B54
 005D2945    mov         ecx,esi
 005D2947    mov         edx,5D4A24;'SetupGetStringFieldW'
 005D294C    mov         eax,dword ptr [ebx]
 005D294E    call        005D2554
 005D2953    mov         [00815B58],eax;gvar_00815B58
 005D2958    mov         ecx,esi
 005D295A    mov         edx,5D4A24;'SetupGetStringFieldW'
 005D295F    mov         eax,dword ptr [ebx]
 005D2961    call        005D2554
 005D2966    mov         [00815B5C],eax;gvar_00815B5C
 005D296B    mov         ecx,esi
 005D296D    mov         edx,5D4A5C;'SetupGetIntField'
 005D2972    mov         eax,dword ptr [ebx]
 005D2974    call        005D2554
 005D2979    mov         [00815B60],eax;gvar_00815B60
 005D297E    mov         ecx,esi
 005D2980    mov         edx,5D4A8C;'SetupGetMultiSzFieldA'
 005D2985    mov         eax,dword ptr [ebx]
 005D2987    call        005D2554
 005D298C    mov         [00815B64],eax;gvar_00815B64
 005D2991    mov         ecx,esi
 005D2993    mov         edx,5D4AC4;'SetupGetMultiSzFieldW'
 005D2998    mov         eax,dword ptr [ebx]
 005D299A    call        005D2554
 005D299F    mov         [00815B68],eax;gvar_00815B68
 005D29A4    mov         ecx,esi
 005D29A6    mov         edx,5D4AC4;'SetupGetMultiSzFieldW'
 005D29AB    mov         eax,dword ptr [ebx]
 005D29AD    call        005D2554
 005D29B2    mov         [00815B6C],eax;gvar_00815B6C
 005D29B7    mov         ecx,esi
 005D29B9    mov         edx,5D4AFC;'SetupGetBinaryField'
 005D29BE    mov         eax,dword ptr [ebx]
 005D29C0    call        005D2554
 005D29C5    mov         [00815B70],eax;gvar_00815B70
 005D29CA    mov         ecx,esi
 005D29CC    mov         edx,5D4B30;'SetupGetFileCompressionInfoA'
 005D29D1    mov         eax,dword ptr [ebx]
 005D29D3    call        005D2554
 005D29D8    mov         [00815B74],eax;gvar_00815B74
 005D29DD    mov         ecx,esi
 005D29DF    mov         edx,5D4B78;'SetupGetFileCompressionInfoW'
 005D29E4    mov         eax,dword ptr [ebx]
 005D29E6    call        005D2554
 005D29EB    mov         [00815B78],eax;gvar_00815B78
 005D29F0    mov         ecx,esi
 005D29F2    mov         edx,5D4B78;'SetupGetFileCompressionInfoW'
 005D29F7    mov         eax,dword ptr [ebx]
 005D29F9    call        005D2554
 005D29FE    mov         [00815B7C],eax;gvar_00815B7C
 005D2A03    mov         ecx,esi
 005D2A05    mov         edx,5D4BC0;'SetupDecompressOrCopyFileA'
 005D2A0A    mov         eax,dword ptr [ebx]
 005D2A0C    call        005D2554
 005D2A11    mov         [00815B80],eax;gvar_00815B80
 005D2A16    mov         ecx,esi
 005D2A18    mov         edx,5D4C04;'SetupDecompressOrCopyFileW'
 005D2A1D    mov         eax,dword ptr [ebx]
 005D2A1F    call        005D2554
 005D2A24    mov         [00815B84],eax;gvar_00815B84
 005D2A29    mov         ecx,esi
 005D2A2B    mov         edx,5D4C04;'SetupDecompressOrCopyFileW'
 005D2A30    mov         eax,dword ptr [ebx]
 005D2A32    call        005D2554
 005D2A37    mov         [00815B88],eax;gvar_00815B88
 005D2A3C    mov         ecx,esi
 005D2A3E    mov         edx,5D4C48;'SetupGetSourceFileLocationA'
 005D2A43    mov         eax,dword ptr [ebx]
 005D2A45    call        005D2554
 005D2A4A    mov         [00815B8C],eax;gvar_00815B8C
 005D2A4F    mov         ecx,esi
 005D2A51    mov         edx,5D4C8C;'SetupGetSourceFileLocationW'
 005D2A56    mov         eax,dword ptr [ebx]
 005D2A58    call        005D2554
 005D2A5D    mov         [00815B90],eax;gvar_00815B90
 005D2A62    mov         ecx,esi
 005D2A64    mov         edx,5D4C8C;'SetupGetSourceFileLocationW'
 005D2A69    mov         eax,dword ptr [ebx]
 005D2A6B    call        005D2554
 005D2A70    mov         [00815B94],eax;gvar_00815B94
 005D2A75    mov         ecx,esi
 005D2A77    mov         edx,5D4CD0;'SetupGetSourceFileSizeA'
 005D2A7C    mov         eax,dword ptr [ebx]
 005D2A7E    call        005D2554
 005D2A83    mov         [00815B98],eax;gvar_00815B98
 005D2A88    mov         ecx,esi
 005D2A8A    mov         edx,5D4D0C;'SetupGetSourceFileSizeW'
 005D2A8F    mov         eax,dword ptr [ebx]
 005D2A91    call        005D2554
 005D2A96    mov         [00815B9C],eax;gvar_00815B9C
 005D2A9B    mov         ecx,esi
 005D2A9D    mov         edx,5D4D0C;'SetupGetSourceFileSizeW'
 005D2AA2    mov         eax,dword ptr [ebx]
 005D2AA4    call        005D2554
 005D2AA9    mov         [00815BA0],eax;gvar_00815BA0
 005D2AAE    mov         ecx,esi
 005D2AB0    mov         edx,5D4D48;'SetupGetTargetPathA'
 005D2AB5    mov         eax,dword ptr [ebx]
 005D2AB7    call        005D2554
 005D2ABC    mov         [00815BA4],eax;gvar_00815BA4
 005D2AC1    mov         ecx,esi
 005D2AC3    mov         edx,5D4D7C;'SetupGetTargetPathW'
 005D2AC8    mov         eax,dword ptr [ebx]
 005D2ACA    call        005D2554
 005D2ACF    mov         [00815BA8],eax;gvar_00815BA8
 005D2AD4    mov         ecx,esi
 005D2AD6    mov         edx,5D4D7C;'SetupGetTargetPathW'
 005D2ADB    mov         eax,dword ptr [ebx]
 005D2ADD    call        005D2554
 005D2AE2    mov         [00815BAC],eax;gvar_00815BAC
 005D2AE7    mov         ecx,esi
 005D2AE9    mov         edx,5D4DB0;'SetupSetSourceListA'
 005D2AEE    mov         eax,dword ptr [ebx]
 005D2AF0    call        005D2554
 005D2AF5    mov         [00815BB0],eax;gvar_00815BB0
 005D2AFA    mov         ecx,esi
 005D2AFC    mov         edx,5D4DE4;'SetupSetSourceListW'
 005D2B01    mov         eax,dword ptr [ebx]
 005D2B03    call        005D2554
 005D2B08    mov         [00815BB4],eax;gvar_00815BB4
 005D2B0D    mov         ecx,esi
 005D2B0F    mov         edx,5D4DE4;'SetupSetSourceListW'
 005D2B14    mov         eax,dword ptr [ebx]
 005D2B16    call        005D2554
 005D2B1B    mov         [00815BB8],eax;gvar_00815BB8
 005D2B20    mov         ecx,esi
 005D2B22    mov         edx,5D4E18;'SetupCancelTemporarySourceList'
 005D2B27    mov         eax,dword ptr [ebx]
 005D2B29    call        005D2554
 005D2B2E    mov         [00815BBC],eax;gvar_00815BBC
 005D2B33    mov         ecx,esi
 005D2B35    mov         edx,5D4E64;'SetupAddToSourceListA'
 005D2B3A    mov         eax,dword ptr [ebx]
 005D2B3C    call        005D2554
 005D2B41    mov         [00815BC0],eax;gvar_00815BC0
 005D2B46    mov         ecx,esi
 005D2B48    mov         edx,5D4E9C;'SetupAddToSourceListW'
 005D2B4D    mov         eax,dword ptr [ebx]
 005D2B4F    call        005D2554
 005D2B54    mov         [00815BC4],eax;gvar_00815BC4
 005D2B59    mov         ecx,esi
 005D2B5B    mov         edx,5D4E9C;'SetupAddToSourceListW'
 005D2B60    mov         eax,dword ptr [ebx]
 005D2B62    call        005D2554
 005D2B67    mov         [00815BC8],eax;gvar_00815BC8
 005D2B6C    mov         ecx,esi
 005D2B6E    mov         edx,5D4ED4;'SetupRemoveFromSourceListA'
 005D2B73    mov         eax,dword ptr [ebx]
 005D2B75    call        005D2554
 005D2B7A    mov         [00815BCC],eax;gvar_00815BCC
 005D2B7F    mov         ecx,esi
 005D2B81    mov         edx,5D4F18;'SetupRemoveFromSourceListW'
 005D2B86    mov         eax,dword ptr [ebx]
 005D2B88    call        005D2554
 005D2B8D    mov         [00815BD0],eax;gvar_00815BD0
 005D2B92    mov         ecx,esi
 005D2B94    mov         edx,5D4F18;'SetupRemoveFromSourceListW'
 005D2B99    mov         eax,dword ptr [ebx]
 005D2B9B    call        005D2554
 005D2BA0    mov         [00815BD4],eax;gvar_00815BD4
 005D2BA5    mov         ecx,esi
 005D2BA7    mov         edx,5D4F5C;'SetupQuerySourceListA'
 005D2BAC    mov         eax,dword ptr [ebx]
 005D2BAE    call        005D2554
 005D2BB3    mov         [00815BD8],eax;gvar_00815BD8
 005D2BB8    mov         ecx,esi
 005D2BBA    mov         edx,5D4F94;'SetupQuerySourceListW'
 005D2BBF    mov         eax,dword ptr [ebx]
 005D2BC1    call        005D2554
 005D2BC6    mov         [00815BDC],eax;gvar_00815BDC
 005D2BCB    mov         ecx,esi
 005D2BCD    mov         edx,5D4F94;'SetupQuerySourceListW'
 005D2BD2    mov         eax,dword ptr [ebx]
 005D2BD4    call        005D2554
 005D2BD9    mov         [00815BE0],eax;gvar_00815BE0
 005D2BDE    mov         ecx,esi
 005D2BE0    mov         edx,5D4FCC;'SetupFreeSourceListA'
 005D2BE5    mov         eax,dword ptr [ebx]
 005D2BE7    call        005D2554
 005D2BEC    mov         [00815BE4],eax;gvar_00815BE4
 005D2BF1    mov         ecx,esi
 005D2BF3    mov         edx,5D5004;'SetupFreeSourceListW'
 005D2BF8    mov         eax,dword ptr [ebx]
 005D2BFA    call        005D2554
 005D2BFF    mov         [00815BE8],eax;gvar_00815BE8
 005D2C04    mov         ecx,esi
 005D2C06    mov         edx,5D5004;'SetupFreeSourceListW'
 005D2C0B    mov         eax,dword ptr [ebx]
 005D2C0D    call        005D2554
 005D2C12    mov         [00815BEC],eax;gvar_00815BEC
 005D2C17    mov         ecx,esi
 005D2C19    mov         edx,5D503C;'SetupPromptForDiskA'
 005D2C1E    mov         eax,dword ptr [ebx]
 005D2C20    call        005D2554
 005D2C25    mov         [00815BF0],eax;gvar_00815BF0
 005D2C2A    mov         ecx,esi
 005D2C2C    mov         edx,5D5070;'SetupPromptForDiskW'
 005D2C31    mov         eax,dword ptr [ebx]
 005D2C33    call        005D2554
 005D2C38    mov         [00815BF4],eax;gvar_00815BF4
 005D2C3D    mov         ecx,esi
 005D2C3F    mov         edx,5D5070;'SetupPromptForDiskW'
 005D2C44    mov         eax,dword ptr [ebx]
 005D2C46    call        005D2554
 005D2C4B    mov         [00815BF8],eax;gvar_00815BF8
 005D2C50    mov         ecx,esi
 005D2C52    mov         edx,5D50A4;'SetupCopyErrorA'
 005D2C57    mov         eax,dword ptr [ebx]
 005D2C59    call        005D2554
 005D2C5E    mov         [00815BFC],eax;gvar_00815BFC
 005D2C63    mov         ecx,esi
 005D2C65    mov         edx,5D50D0;'SetupCopyErrorW'
 005D2C6A    mov         eax,dword ptr [ebx]
 005D2C6C    call        005D2554
 005D2C71    mov         [00815C00],eax;gvar_00815C00
 005D2C76    mov         ecx,esi
 005D2C78    mov         edx,5D50D0;'SetupCopyErrorW'
 005D2C7D    mov         eax,dword ptr [ebx]
 005D2C7F    call        005D2554
 005D2C84    mov         [00815C04],eax;gvar_00815C04
 005D2C89    mov         ecx,esi
 005D2C8B    mov         edx,5D50FC;'SetupRenameErrorA'
 005D2C90    mov         eax,dword ptr [ebx]
 005D2C92    call        005D2554
 005D2C97    mov         [00815C08],eax;gvar_00815C08
 005D2C9C    mov         ecx,esi
 005D2C9E    mov         edx,5D512C;'SetupRenameErrorW'
 005D2CA3    mov         eax,dword ptr [ebx]
 005D2CA5    call        005D2554
 005D2CAA    mov         [00815C0C],eax;gvar_00815C0C
 005D2CAF    mov         ecx,esi
 005D2CB1    mov         edx,5D512C;'SetupRenameErrorW'
 005D2CB6    mov         eax,dword ptr [ebx]
 005D2CB8    call        005D2554
 005D2CBD    mov         [00815C10],eax;gvar_00815C10
 005D2CC2    mov         ecx,esi
 005D2CC4    mov         edx,5D515C;'SetupDeleteErrorA'
 005D2CC9    mov         eax,dword ptr [ebx]
 005D2CCB    call        005D2554
 005D2CD0    mov         [00815C14],eax;gvar_00815C14
 005D2CD5    mov         ecx,esi
 005D2CD7    mov         edx,5D518C;'SetupDeleteErrorW'
 005D2CDC    mov         eax,dword ptr [ebx]
 005D2CDE    call        005D2554
 005D2CE3    mov         [00815C18],eax;gvar_00815C18
 005D2CE8    mov         ecx,esi
 005D2CEA    mov         edx,5D518C;'SetupDeleteErrorW'
 005D2CEF    mov         eax,dword ptr [ebx]
 005D2CF1    call        005D2554
 005D2CF6    mov         [00815C1C],eax;gvar_00815C1C
 005D2CFB    mov         ecx,esi
 005D2CFD    mov         edx,5D51BC;'SetupSetDirectoryIdA'
 005D2D02    mov         eax,dword ptr [ebx]
 005D2D04    call        005D2554
 005D2D09    mov         [00815C20],eax;gvar_00815C20
 005D2D0E    mov         ecx,esi
 005D2D10    mov         edx,5D51F4;'SetupSetDirectoryIdW'
 005D2D15    mov         eax,dword ptr [ebx]
 005D2D17    call        005D2554
 005D2D1C    mov         [00815C24],eax;gvar_00815C24
 005D2D21    mov         ecx,esi
 005D2D23    mov         edx,5D51F4;'SetupSetDirectoryIdW'
 005D2D28    mov         eax,dword ptr [ebx]
 005D2D2A    call        005D2554
 005D2D2F    mov         [00815C28],eax;gvar_00815C28
 005D2D34    mov         ecx,esi
 005D2D36    mov         edx,5D522C;'SetupSetDirectoryIdExA'
 005D2D3B    mov         eax,dword ptr [ebx]
 005D2D3D    call        005D2554
 005D2D42    mov         [00815C2C],eax;gvar_00815C2C
 005D2D47    mov         ecx,esi
 005D2D49    mov         edx,5D5268;'SetupSetDirectoryIdExW'
 005D2D4E    mov         eax,dword ptr [ebx]
 005D2D50    call        005D2554
 005D2D55    mov         [00815C30],eax;gvar_00815C30
 005D2D5A    mov         ecx,esi
 005D2D5C    mov         edx,5D5268;'SetupSetDirectoryIdExW'
 005D2D61    mov         eax,dword ptr [ebx]
 005D2D63    call        005D2554
 005D2D68    mov         [00815C34],eax;gvar_00815C34
 005D2D6D    mov         ecx,esi
 005D2D6F    mov         edx,5D52A4;'SetupGetSourceInfoA'
 005D2D74    mov         eax,dword ptr [ebx]
 005D2D76    call        005D2554
 005D2D7B    mov         [00815C38],eax;gvar_00815C38
 005D2D80    mov         ecx,esi
 005D2D82    mov         edx,5D52D8;'SetupGetSourceInfoW'
 005D2D87    mov         eax,dword ptr [ebx]
 005D2D89    call        005D2554
 005D2D8E    mov         [00815C3C],eax;gvar_00815C3C
 005D2D93    mov         ecx,esi
 005D2D95    mov         edx,5D52D8;'SetupGetSourceInfoW'
 005D2D9A    mov         eax,dword ptr [ebx]
 005D2D9C    call        005D2554
 005D2DA1    mov         [00815C40],eax;gvar_00815C40
 005D2DA6    mov         ecx,esi
 005D2DA8    mov         edx,5D530C;'SetupInstallFileA'
 005D2DAD    mov         eax,dword ptr [ebx]
 005D2DAF    call        005D2554
 005D2DB4    mov         [00815C44],eax;gvar_00815C44
 005D2DB9    mov         ecx,esi
 005D2DBB    mov         edx,5D533C;'SetupInstallFileW'
 005D2DC0    mov         eax,dword ptr [ebx]
 005D2DC2    call        005D2554
 005D2DC7    mov         [00815C48],eax;gvar_00815C48
 005D2DCC    mov         ecx,esi
 005D2DCE    mov         edx,5D533C;'SetupInstallFileW'
 005D2DD3    mov         eax,dword ptr [ebx]
 005D2DD5    call        005D2554
 005D2DDA    mov         [00815C4C],eax;gvar_00815C4C
 005D2DDF    mov         ecx,esi
 005D2DE1    mov         edx,5D536C;'SetupInstallFileExA'
 005D2DE6    mov         eax,dword ptr [ebx]
 005D2DE8    call        005D2554
 005D2DED    mov         [00815C50],eax;gvar_00815C50
 005D2DF2    mov         ecx,esi
 005D2DF4    mov         edx,5D53A0;'SetupInstallFileExW'
 005D2DF9    mov         eax,dword ptr [ebx]
 005D2DFB    call        005D2554
 005D2E00    mov         [00815C54],eax;gvar_00815C54
 005D2E05    mov         ecx,esi
 005D2E07    mov         edx,5D53A0;'SetupInstallFileExW'
 005D2E0C    mov         eax,dword ptr [ebx]
 005D2E0E    call        005D2554
 005D2E13    mov         [00815C58],eax;gvar_00815C58
 005D2E18    mov         ecx,esi
 005D2E1A    mov         edx,5D53D4;'SetupOpenFileQueue'
 005D2E1F    mov         eax,dword ptr [ebx]
 005D2E21    call        005D2554
 005D2E26    mov         [00815C5C],eax;gvar_00815C5C
 005D2E2B    mov         ecx,esi
 005D2E2D    mov         edx,5D5408;'SetupCloseFileQueue'
 005D2E32    mov         eax,dword ptr [ebx]
 005D2E34    call        005D2554
 005D2E39    mov         [00815C60],eax;gvar_00815C60
 005D2E3E    mov         ecx,esi
 005D2E40    mov         edx,5D543C;'SetupSetPlatformPathOverrideA'
 005D2E45    mov         eax,dword ptr [ebx]
 005D2E47    call        005D2554
 005D2E4C    mov         [00815C64],eax;gvar_00815C64
 005D2E51    mov         ecx,esi
 005D2E53    mov         edx,5D5484;'SetupSetPlatformPathOverrideW'
 005D2E58    mov         eax,dword ptr [ebx]
 005D2E5A    call        005D2554
 005D2E5F    mov         [00815C68],eax;gvar_00815C68
 005D2E64    mov         ecx,esi
 005D2E66    mov         edx,5D5484;'SetupSetPlatformPathOverrideW'
 005D2E6B    mov         eax,dword ptr [ebx]
 005D2E6D    call        005D2554
 005D2E72    mov         [00815C6C],eax;gvar_00815C6C
 005D2E77    mov         ecx,esi
 005D2E79    mov         edx,5D54CC;'SetupQueueCopyA'
 005D2E7E    mov         eax,dword ptr [ebx]
 005D2E80    call        005D2554
 005D2E85    mov         [00815C70],eax;gvar_00815C70
 005D2E8A    mov         ecx,esi
 005D2E8C    mov         edx,5D54F8;'SetupQueueCopyW'
 005D2E91    mov         eax,dword ptr [ebx]
 005D2E93    call        005D2554
 005D2E98    mov         [00815C74],eax;gvar_00815C74
 005D2E9D    mov         ecx,esi
 005D2E9F    mov         edx,5D54F8;'SetupQueueCopyW'
 005D2EA4    mov         eax,dword ptr [ebx]
 005D2EA6    call        005D2554
 005D2EAB    mov         [00815C78],eax;gvar_00815C78
 005D2EB0    mov         ecx,esi
 005D2EB2    mov         edx,5D5524;'SetupQueueDefaultCopyA'
 005D2EB7    mov         eax,dword ptr [ebx]
 005D2EB9    call        005D2554
 005D2EBE    mov         [00815C7C],eax;gvar_00815C7C
 005D2EC3    mov         ecx,esi
 005D2EC5    mov         edx,5D5560;'SetupQueueDefaultCopyW'
 005D2ECA    mov         eax,dword ptr [ebx]
 005D2ECC    call        005D2554
 005D2ED1    mov         [00815C80],eax;gvar_00815C80
 005D2ED6    mov         ecx,esi
 005D2ED8    mov         edx,5D5560;'SetupQueueDefaultCopyW'
 005D2EDD    mov         eax,dword ptr [ebx]
 005D2EDF    call        005D2554
 005D2EE4    mov         [00815C84],eax;gvar_00815C84
 005D2EE9    mov         ecx,esi
 005D2EEB    mov         edx,5D559C;'SetupQueueCopySectionA'
 005D2EF0    mov         eax,dword ptr [ebx]
 005D2EF2    call        005D2554
 005D2EF7    mov         [00815C88],eax;gvar_00815C88
 005D2EFC    mov         ecx,esi
 005D2EFE    mov         edx,5D55D8;'SetupQueueCopySectionW'
 005D2F03    mov         eax,dword ptr [ebx]
 005D2F05    call        005D2554
 005D2F0A    mov         [00815C8C],eax;gvar_00815C8C
 005D2F0F    mov         ecx,esi
 005D2F11    mov         edx,5D55D8;'SetupQueueCopySectionW'
 005D2F16    mov         eax,dword ptr [ebx]
 005D2F18    call        005D2554
 005D2F1D    mov         [00815C90],eax;gvar_00815C90
 005D2F22    mov         ecx,esi
 005D2F24    mov         edx,5D5614;'SetupQueueDeleteA'
 005D2F29    mov         eax,dword ptr [ebx]
 005D2F2B    call        005D2554
 005D2F30    mov         [00815C94],eax;gvar_00815C94
 005D2F35    mov         ecx,esi
 005D2F37    mov         edx,5D5644;'SetupQueueDeleteW'
 005D2F3C    mov         eax,dword ptr [ebx]
 005D2F3E    call        005D2554
 005D2F43    mov         [00815C98],eax;gvar_00815C98
 005D2F48    mov         ecx,esi
 005D2F4A    mov         edx,5D5644;'SetupQueueDeleteW'
 005D2F4F    mov         eax,dword ptr [ebx]
 005D2F51    call        005D2554
 005D2F56    mov         [00815C9C],eax;gvar_00815C9C
 005D2F5B    mov         ecx,esi
 005D2F5D    mov         edx,5D5674;'SetupQueueDeleteSectionA'
 005D2F62    mov         eax,dword ptr [ebx]
 005D2F64    call        005D2554
 005D2F69    mov         [00815CA0],eax;gvar_00815CA0
 005D2F6E    mov         ecx,esi
 005D2F70    mov         edx,5D56B4;'SetupQueueDeleteSectionW'
 005D2F75    mov         eax,dword ptr [ebx]
 005D2F77    call        005D2554
 005D2F7C    mov         [00815CA4],eax;gvar_00815CA4
 005D2F81    mov         ecx,esi
 005D2F83    mov         edx,5D56B4;'SetupQueueDeleteSectionW'
 005D2F88    mov         eax,dword ptr [ebx]
 005D2F8A    call        005D2554
 005D2F8F    mov         [00815CA8],eax;gvar_00815CA8
 005D2F94    mov         ecx,esi
 005D2F96    mov         edx,5D56F4;'SetupQueueRenameA'
 005D2F9B    mov         eax,dword ptr [ebx]
 005D2F9D    call        005D2554
 005D2FA2    mov         [00815CAC],eax;gvar_00815CAC
 005D2FA7    mov         ecx,esi
 005D2FA9    mov         edx,5D5724;'SetupQueueRenameW'
 005D2FAE    mov         eax,dword ptr [ebx]
 005D2FB0    call        005D2554
 005D2FB5    mov         [00815CB0],eax;gvar_00815CB0
 005D2FBA    mov         ecx,esi
 005D2FBC    mov         edx,5D5724;'SetupQueueRenameW'
 005D2FC1    mov         eax,dword ptr [ebx]
 005D2FC3    call        005D2554
 005D2FC8    mov         [00815CB4],eax;gvar_00815CB4
 005D2FCD    mov         ecx,esi
 005D2FCF    mov         edx,5D5754;'SetupQueueRenameSectionA'
 005D2FD4    mov         eax,dword ptr [ebx]
 005D2FD6    call        005D2554
 005D2FDB    mov         [00815CB8],eax;gvar_00815CB8
 005D2FE0    mov         ecx,esi
 005D2FE2    mov         edx,5D5794;'SetupQueueRenameSectionW'
 005D2FE7    mov         eax,dword ptr [ebx]
 005D2FE9    call        005D2554
 005D2FEE    mov         [00815CBC],eax;gvar_00815CBC
 005D2FF3    mov         ecx,esi
 005D2FF5    mov         edx,5D5794;'SetupQueueRenameSectionW'
 005D2FFA    mov         eax,dword ptr [ebx]
 005D2FFC    call        005D2554
 005D3001    mov         [00815CC0],eax;gvar_00815CC0
 005D3006    mov         ecx,esi
 005D3008    mov         edx,5D57D4;'SetupCommitFileQueueA'
 005D300D    mov         eax,dword ptr [ebx]
 005D300F    call        005D2554
 005D3014    mov         [00815CC4],eax;gvar_00815CC4
 005D3019    mov         ecx,esi
 005D301B    mov         edx,5D580C;'SetupCommitFileQueueW'
 005D3020    mov         eax,dword ptr [ebx]
 005D3022    call        005D2554
 005D3027    mov         [00815CC8],eax;gvar_00815CC8
 005D302C    mov         ecx,esi
 005D302E    mov         edx,5D580C;'SetupCommitFileQueueW'
 005D3033    mov         eax,dword ptr [ebx]
 005D3035    call        005D2554
 005D303A    mov         [00815CCC],eax;gvar_00815CCC
 005D303F    mov         ecx,esi
 005D3041    mov         edx,5D5844;'SetupScanFileQueueA'
 005D3046    mov         eax,dword ptr [ebx]
 005D3048    call        005D2554
 005D304D    mov         [00815CD0],eax;gvar_00815CD0
 005D3052    mov         ecx,esi
 005D3054    mov         edx,5D5878;'SetupScanFileQueueW'
 005D3059    mov         eax,dword ptr [ebx]
 005D305B    call        005D2554
 005D3060    mov         [00815CD4],eax;gvar_00815CD4
 005D3065    mov         ecx,esi
 005D3067    mov         edx,5D5878;'SetupScanFileQueueW'
 005D306C    mov         eax,dword ptr [ebx]
 005D306E    call        005D2554
 005D3073    mov         [00815CD8],eax;gvar_00815CD8
 005D3078    mov         ecx,esi
 005D307A    mov         edx,5D58AC;'SetupCopyOEMInfA'
 005D307F    mov         eax,dword ptr [ebx]
 005D3081    call        005D2554
 005D3086    mov         [00815CDC],eax;gvar_00815CDC
 005D308B    mov         ecx,esi
 005D308D    mov         edx,5D58DC;'SetupCopyOEMInfW'
 005D3092    mov         eax,dword ptr [ebx]
 005D3094    call        005D2554
 005D3099    mov         [00815CE0],eax;gvar_00815CE0
 005D309E    mov         ecx,esi
 005D30A0    mov         edx,5D58DC;'SetupCopyOEMInfW'
 005D30A5    mov         eax,dword ptr [ebx]
 005D30A7    call        005D2554
 005D30AC    mov         [00815CE4],eax;gvar_00815CE4
 005D30B1    mov         ecx,esi
 005D30B3    mov         edx,5D590C;'SetupCreateDiskSpaceListA'
 005D30B8    mov         eax,dword ptr [ebx]
 005D30BA    call        005D2554
 005D30BF    mov         [00815CE8],eax;gvar_00815CE8
 005D30C4    mov         ecx,esi
 005D30C6    mov         edx,5D594C;'SetupCreateDiskSpaceListW'
 005D30CB    mov         eax,dword ptr [ebx]
 005D30CD    call        005D2554
 005D30D2    mov         [00815CEC],eax;gvar_00815CEC
 005D30D7    mov         ecx,esi
 005D30D9    mov         edx,5D594C;'SetupCreateDiskSpaceListW'
 005D30DE    mov         eax,dword ptr [ebx]
 005D30E0    call        005D2554
 005D30E5    mov         [00815CF0],eax;gvar_00815CF0
 005D30EA    mov         ecx,esi
 005D30EC    mov         edx,5D598C;'SetupDuplicateDiskSpaceListA'
 005D30F1    mov         eax,dword ptr [ebx]
 005D30F3    call        005D2554
 005D30F8    mov         [00815CF4],eax;gvar_00815CF4
 005D30FD    mov         ecx,esi
 005D30FF    mov         edx,5D59D4;'SetupDuplicateDiskSpaceListW'
 005D3104    mov         eax,dword ptr [ebx]
 005D3106    call        005D2554
 005D310B    mov         [00815CF8],eax;gvar_00815CF8
 005D3110    mov         ecx,esi
 005D3112    mov         edx,5D59D4;'SetupDuplicateDiskSpaceListW'
 005D3117    mov         eax,dword ptr [ebx]
 005D3119    call        005D2554
 005D311E    mov         [00815CFC],eax;gvar_00815CFC
 005D3123    mov         ecx,esi
 005D3125    mov         edx,5D5A1C;'SetupDestroyDiskSpaceList'
 005D312A    mov         eax,dword ptr [ebx]
 005D312C    call        005D2554
 005D3131    mov         [00815D00],eax;gvar_00815D00
 005D3136    mov         ecx,esi
 005D3138    mov         edx,5D5A5C;'SetupQueryDrivesInDiskSpaceListA'
 005D313D    mov         eax,dword ptr [ebx]
 005D313F    call        005D2554
 005D3144    mov         [00815D04],eax;gvar_00815D04
 005D3149    mov         ecx,esi
 005D314B    mov         edx,5D5AAC;'SetupQueryDrivesInDiskSpaceListW'
 005D3150    mov         eax,dword ptr [ebx]
 005D3152    call        005D2554
 005D3157    mov         [00815D08],eax;gvar_00815D08
 005D315C    mov         ecx,esi
 005D315E    mov         edx,5D5AAC;'SetupQueryDrivesInDiskSpaceListW'
 005D3163    mov         eax,dword ptr [ebx]
 005D3165    call        005D2554
 005D316A    mov         [00815D0C],eax;gvar_00815D0C
 005D316F    mov         ecx,esi
 005D3171    mov         edx,5D5AFC;'SetupQuerySpaceRequiredOnDriveA'
 005D3176    mov         eax,dword ptr [ebx]
 005D3178    call        005D2554
 005D317D    mov         [00815D10],eax;gvar_00815D10
 005D3182    mov         ecx,esi
 005D3184    mov         edx,5D5B48;'SetupQuerySpaceRequiredOnDriveW'
 005D3189    mov         eax,dword ptr [ebx]
 005D318B    call        005D2554
 005D3190    mov         [00815D14],eax;gvar_00815D14
 005D3195    mov         ecx,esi
 005D3197    mov         edx,5D5B48;'SetupQuerySpaceRequiredOnDriveW'
 005D319C    mov         eax,dword ptr [ebx]
 005D319E    call        005D2554
 005D31A3    mov         [00815D18],eax;gvar_00815D18
 005D31A8    mov         ecx,esi
 005D31AA    mov         edx,5D5B94;'SetupAdjustDiskSpaceListA'
 005D31AF    mov         eax,dword ptr [ebx]
 005D31B1    call        005D2554
 005D31B6    mov         [00815D1C],eax;gvar_00815D1C
 005D31BB    mov         ecx,esi
 005D31BD    mov         edx,5D5BD4;'SetupAdjustDiskSpaceListW'
 005D31C2    mov         eax,dword ptr [ebx]
 005D31C4    call        005D2554
 005D31C9    mov         [00815D20],eax;gvar_00815D20
 005D31CE    mov         ecx,esi
 005D31D0    mov         edx,5D5BD4;'SetupAdjustDiskSpaceListW'
 005D31D5    mov         eax,dword ptr [ebx]
 005D31D7    call        005D2554
 005D31DC    mov         [00815D24],eax;gvar_00815D24
 005D31E1    mov         ecx,esi
 005D31E3    mov         edx,5D5C14;'SetupAddToDiskSpaceListA'
 005D31E8    mov         eax,dword ptr [ebx]
 005D31EA    call        005D2554
 005D31EF    mov         [00815D28],eax;gvar_00815D28
 005D31F4    mov         ecx,esi
 005D31F6    mov         edx,5D5C54;'SetupAddToDiskSpaceListW'
 005D31FB    mov         eax,dword ptr [ebx]
 005D31FD    call        005D2554
 005D3202    mov         [00815D2C],eax;gvar_00815D2C
 005D3207    mov         ecx,esi
 005D3209    mov         edx,5D5C54;'SetupAddToDiskSpaceListW'
 005D320E    mov         eax,dword ptr [ebx]
 005D3210    call        005D2554
 005D3215    mov         [00815D30],eax;gvar_00815D30
 005D321A    mov         ecx,esi
 005D321C    mov         edx,5D5C94;'SetupAddSectionToDiskSpaceListA'
 005D3221    mov         eax,dword ptr [ebx]
 005D3223    call        005D2554
 005D3228    mov         [00815D34],eax;gvar_00815D34
 005D322D    mov         ecx,esi
 005D322F    mov         edx,5D5CE0;'SetupAddSectionToDiskSpaceListW'
 005D3234    mov         eax,dword ptr [ebx]
 005D3236    call        005D2554
 005D323B    mov         [00815D38],eax;gvar_00815D38
 005D3240    mov         ecx,esi
 005D3242    mov         edx,5D5CE0;'SetupAddSectionToDiskSpaceListW'
 005D3247    mov         eax,dword ptr [ebx]
 005D3249    call        005D2554
 005D324E    mov         [00815D3C],eax;gvar_00815D3C
 005D3253    mov         ecx,esi
 005D3255    mov         edx,5D5D2C;'SetupAddInstallSectionToDiskSpaceListA'
 005D325A    mov         eax,dword ptr [ebx]
 005D325C    call        005D2554
 005D3261    mov         [00815D40],eax;gvar_00815D40
 005D3266    mov         ecx,esi
 005D3268    mov         edx,5D5D88;'SetupAddInstallSectionToDiskSpaceListW'
 005D326D    mov         eax,dword ptr [ebx]
 005D326F    call        005D2554
 005D3274    mov         [00815D44],eax;gvar_00815D44
 005D3279    mov         ecx,esi
 005D327B    mov         edx,5D5D88;'SetupAddInstallSectionToDiskSpaceListW'
 005D3280    mov         eax,dword ptr [ebx]
 005D3282    call        005D2554
 005D3287    mov         [00815D48],eax;gvar_00815D48
 005D328C    mov         ecx,esi
 005D328E    mov         edx,5D5DE4;'SetupRemoveFromDiskSpaceListA'
 005D3293    mov         eax,dword ptr [ebx]
 005D3295    call        005D2554
 005D329A    mov         [00815D4C],eax;gvar_00815D4C
 005D329F    mov         ecx,esi
 005D32A1    mov         edx,5D5E2C;'SetupRemoveFromDiskSpaceListW'
 005D32A6    mov         eax,dword ptr [ebx]
 005D32A8    call        005D2554
 005D32AD    mov         [00815D50],eax;gvar_00815D50
 005D32B2    mov         ecx,esi
 005D32B4    mov         edx,5D5E2C;'SetupRemoveFromDiskSpaceListW'
 005D32B9    mov         eax,dword ptr [ebx]
 005D32BB    call        005D2554
 005D32C0    mov         [00815D54],eax;gvar_00815D54
 005D32C5    mov         ecx,esi
 005D32C7    mov         edx,5D5E74;'SetupRemoveSectionFromDiskSpaceListA'
 005D32CC    mov         eax,dword ptr [ebx]
 005D32CE    call        005D2554
 005D32D3    mov         [00815D58],eax;gvar_00815D58
 005D32D8    mov         ecx,esi
 005D32DA    mov         edx,5D5ECC;'SetupRemoveSectionFromDiskSpaceListW'
 005D32DF    mov         eax,dword ptr [ebx]
 005D32E1    call        005D2554
 005D32E6    mov         [00815D5C],eax;gvar_00815D5C
 005D32EB    mov         ecx,esi
 005D32ED    mov         edx,5D5ECC;'SetupRemoveSectionFromDiskSpaceListW'
 005D32F2    mov         eax,dword ptr [ebx]
 005D32F4    call        005D2554
 005D32F9    mov         [00815D60],eax;gvar_00815D60
 005D32FE    mov         ecx,esi
 005D3300    mov         edx,5D5F24;'SetupRemoveInstallSectionFromDiskSpaceListA'
 005D3305    mov         eax,dword ptr [ebx]
 005D3307    call        005D2554
 005D330C    mov         [00815D64],eax;gvar_00815D64
 005D3311    mov         ecx,esi
 005D3313    mov         edx,5D5F88;'SetupRemoveInstallSectionFromDiskSpaceListW'
 005D3318    mov         eax,dword ptr [ebx]
 005D331A    call        005D2554
 005D331F    mov         [00815D68],eax;gvar_00815D68
 005D3324    mov         ecx,esi
 005D3326    mov         edx,5D5F88;'SetupRemoveInstallSectionFromDiskSpaceListW'
 005D332B    mov         eax,dword ptr [ebx]
 005D332D    call        005D2554
 005D3332    mov         [00815D6C],eax;gvar_00815D6C
 005D3337    mov         ecx,esi
 005D3339    mov         edx,5D5FEC;'SetupIterateCabinetA'
 005D333E    mov         eax,dword ptr [ebx]
 005D3340    call        005D2554
 005D3345    mov         [00815D70],eax;gvar_00815D70
 005D334A    mov         ecx,esi
 005D334C    mov         edx,5D6024;'SetupIterateCabinetW'
 005D3351    mov         eax,dword ptr [ebx]
 005D3353    call        005D2554
 005D3358    mov         [00815D74],eax;gvar_00815D74
 005D335D    mov         ecx,esi
 005D335F    mov         edx,5D6024;'SetupIterateCabinetW'
 005D3364    mov         eax,dword ptr [ebx]
 005D3366    call        005D2554
 005D336B    mov         [00815D78],eax;gvar_00815D78
 005D3370    mov         ecx,esi
 005D3372    mov         edx,5D605C;'SetupPromptReboot'
 005D3377    mov         eax,dword ptr [ebx]
 005D3379    call        005D2554
 005D337E    mov         [00815D7C],eax;gvar_00815D7C
 005D3383    mov         ecx,esi
 005D3385    mov         edx,5D608C;'SetupInitDefaultQueueCallback'
 005D338A    mov         eax,dword ptr [ebx]
 005D338C    call        005D2554
 005D3391    mov         [00815D80],eax;gvar_00815D80
 005D3396    mov         ecx,esi
 005D3398    mov         edx,5D60D4;'SetupInitDefaultQueueCallbackEx'
 005D339D    mov         eax,dword ptr [ebx]
 005D339F    call        005D2554
 005D33A4    mov         [00815D84],eax;gvar_00815D84
 005D33A9    mov         ecx,esi
 005D33AB    mov         edx,5D6120;'SetupTermDefaultQueueCallback'
 005D33B0    mov         eax,dword ptr [ebx]
 005D33B2    call        005D2554
 005D33B7    mov         [00815D88],eax;gvar_00815D88
 005D33BC    mov         ecx,esi
 005D33BE    mov         edx,5D6168;'SetupDefaultQueueCallbackA'
 005D33C3    mov         eax,dword ptr [ebx]
 005D33C5    call        005D2554
 005D33CA    mov         [00815D8C],eax;gvar_00815D8C
 005D33CF    mov         ecx,esi
 005D33D1    mov         edx,5D61AC;'SetupDefaultQueueCallbackW'
 005D33D6    mov         eax,dword ptr [ebx]
 005D33D8    call        005D2554
 005D33DD    mov         [00815D90],eax;gvar_00815D90
 005D33E2    mov         ecx,esi
 005D33E4    mov         edx,5D61AC;'SetupDefaultQueueCallbackW'
 005D33E9    mov         eax,dword ptr [ebx]
 005D33EB    call        005D2554
 005D33F0    mov         [00815D94],eax;gvar_00815D94
 005D33F5    mov         ecx,esi
 005D33F7    mov         edx,5D61F0;'SetupInstallFromInfSectionA'
 005D33FC    mov         eax,dword ptr [ebx]
 005D33FE    call        005D2554
 005D3403    mov         [00815D98],eax;gvar_00815D98
 005D3408    mov         ecx,esi
 005D340A    mov         edx,5D6234;'SetupInstallFromInfSectionW'
 005D340F    mov         eax,dword ptr [ebx]
 005D3411    call        005D2554
 005D3416    mov         [00815D9C],eax;gvar_00815D9C
 005D341B    mov         ecx,esi
 005D341D    mov         edx,5D6234;'SetupInstallFromInfSectionW'
 005D3422    mov         eax,dword ptr [ebx]
 005D3424    call        005D2554
 005D3429    mov         [00815DA0],eax;gvar_00815DA0
 005D342E    mov         ecx,esi
 005D3430    mov         edx,5D6278;'SetupInstallFilesFromInfSectionA'
 005D3435    mov         eax,dword ptr [ebx]
 005D3437    call        005D2554
 005D343C    mov         [00815DA4],eax;gvar_00815DA4
 005D3441    mov         ecx,esi
 005D3443    mov         edx,5D62C8;'SetupInstallFilesFromInfSectionW'
 005D3448    mov         eax,dword ptr [ebx]
 005D344A    call        005D2554
 005D344F    mov         [00815DA8],eax;gvar_00815DA8
 005D3454    mov         ecx,esi
 005D3456    mov         edx,5D62C8;'SetupInstallFilesFromInfSectionW'
 005D345B    mov         eax,dword ptr [ebx]
 005D345D    call        005D2554
 005D3462    mov         [00815DAC],eax;gvar_00815DAC
 005D3467    mov         ecx,esi
 005D3469    mov         edx,5D6318;'SetupInstallServicesFromInfSectionA'
 005D346E    mov         eax,dword ptr [ebx]
 005D3470    call        005D2554
 005D3475    mov         [00815DB0],eax;gvar_00815DB0
 005D347A    mov         ecx,esi
 005D347C    mov         edx,5D636C;'SetupInstallServicesFromInfSectionW'
 005D3481    mov         eax,dword ptr [ebx]
 005D3483    call        005D2554
 005D3488    mov         [00815DB4],eax;gvar_00815DB4
 005D348D    mov         ecx,esi
 005D348F    mov         edx,5D636C;'SetupInstallServicesFromInfSectionW'
 005D3494    mov         eax,dword ptr [ebx]
 005D3496    call        005D2554
 005D349B    mov         [00815DB8],eax;gvar_00815DB8
 005D34A0    mov         ecx,esi
 005D34A2    mov         edx,5D63C0;'SetupInstallServicesFromInfSectionExA'
 005D34A7    mov         eax,dword ptr [ebx]
 005D34A9    call        005D2554
 005D34AE    mov         [00815DBC],eax;gvar_00815DBC
 005D34B3    mov         ecx,esi
 005D34B5    mov         edx,5D6418;'SetupInstallServicesFromInfSectionExW'
 005D34BA    mov         eax,dword ptr [ebx]
 005D34BC    call        005D2554
 005D34C1    mov         [00815DC0],eax;gvar_00815DC0
 005D34C6    mov         ecx,esi
 005D34C8    mov         edx,5D6418;'SetupInstallServicesFromInfSectionExW'
 005D34CD    mov         eax,dword ptr [ebx]
 005D34CF    call        005D2554
 005D34D4    mov         [00815DC4],eax;gvar_00815DC4
 005D34D9    mov         ecx,esi
 005D34DB    mov         edx,5D6470;'SetupInitializeFileLogA'
 005D34E0    mov         eax,dword ptr [ebx]
 005D34E2    call        005D2554
 005D34E7    mov         [00815DC8],eax;gvar_00815DC8
 005D34EC    mov         ecx,esi
 005D34EE    mov         edx,5D64AC;'SetupInitializeFileLogW'
 005D34F3    mov         eax,dword ptr [ebx]
 005D34F5    call        005D2554
 005D34FA    mov         [00815DCC],eax;gvar_00815DCC
 005D34FF    mov         ecx,esi
 005D3501    mov         edx,5D64AC;'SetupInitializeFileLogW'
 005D3506    mov         eax,dword ptr [ebx]
 005D3508    call        005D2554
 005D350D    mov         [00815DD0],eax;gvar_00815DD0
 005D3512    mov         ecx,esi
 005D3514    mov         edx,5D64E8;'SetupTerminateFileLog'
 005D3519    mov         eax,dword ptr [ebx]
 005D351B    call        005D2554
 005D3520    mov         [00815DD4],eax;gvar_00815DD4
 005D3525    mov         ecx,esi
 005D3527    mov         edx,5D6520;'SetupLogFileA'
 005D352C    mov         eax,dword ptr [ebx]
 005D352E    call        005D2554
 005D3533    mov         [00815DD8],eax;gvar_00815DD8
 005D3538    mov         ecx,esi
 005D353A    mov         edx,5D6548;'SetupLogFileW'
 005D353F    mov         eax,dword ptr [ebx]
 005D3541    call        005D2554
 005D3546    mov         [00815DDC],eax;gvar_00815DDC
 005D354B    mov         ecx,esi
 005D354D    mov         edx,5D6548;'SetupLogFileW'
 005D3552    mov         eax,dword ptr [ebx]
 005D3554    call        005D2554
 005D3559    mov         [00815DE0],eax;gvar_00815DE0
 005D355E    mov         ecx,esi
 005D3560    mov         edx,5D6570;'SetupRemoveFileLogEntryA'
 005D3565    mov         eax,dword ptr [ebx]
 005D3567    call        005D2554
 005D356C    mov         [00815DE4],eax;gvar_00815DE4
 005D3571    mov         ecx,esi
 005D3573    mov         edx,5D65B0;'SetupRemoveFileLogEntryW'
 005D3578    mov         eax,dword ptr [ebx]
 005D357A    call        005D2554
 005D357F    mov         [00815DE8],eax;gvar_00815DE8
 005D3584    mov         ecx,esi
 005D3586    mov         edx,5D65B0;'SetupRemoveFileLogEntryW'
 005D358B    mov         eax,dword ptr [ebx]
 005D358D    call        005D2554
 005D3592    mov         [00815DEC],eax;gvar_00815DEC
 005D3597    mov         ecx,esi
 005D3599    mov         edx,5D65F0;'SetupQueryFileLogA'
 005D359E    mov         eax,dword ptr [ebx]
 005D35A0    call        005D2554
 005D35A5    mov         [00815DF0],eax;gvar_00815DF0
 005D35AA    mov         ecx,esi
 005D35AC    mov         edx,5D6624;'SetupQueryFileLogW'
 005D35B1    mov         eax,dword ptr [ebx]
 005D35B3    call        005D2554
 005D35B8    mov         [00815DF4],eax;gvar_00815DF4
 005D35BD    mov         ecx,esi
 005D35BF    mov         edx,5D6624;'SetupQueryFileLogW'
 005D35C4    mov         eax,dword ptr [ebx]
 005D35C6    call        005D2554
 005D35CB    mov         [00815DF8],eax;gvar_00815DF8
 005D35D0    mov         ecx,esi
 005D35D2    mov         edx,5D6658;'SetupOpenLog'
 005D35D7    mov         eax,dword ptr [ebx]
 005D35D9    call        005D2554
 005D35DE    mov         [00815DFC],eax;gvar_00815DFC
 005D35E3    mov         ecx,esi
 005D35E5    mov         edx,5D6680;'SetupLogErrorA'
 005D35EA    mov         eax,dword ptr [ebx]
 005D35EC    call        005D2554
 005D35F1    mov         [00815E00],eax;gvar_00815E00
 005D35F6    mov         ecx,esi
 005D35F8    mov         edx,5D66AC;'SetupLogErrorW'
 005D35FD    mov         eax,dword ptr [ebx]
 005D35FF    call        005D2554
 005D3604    mov         [00815E04],eax;gvar_00815E04
 005D3609    mov         ecx,esi
 005D360B    mov         edx,5D66AC;'SetupLogErrorW'
 005D3610    mov         eax,dword ptr [ebx]
 005D3612    call        005D2554
 005D3617    mov         [00815E08],eax;gvar_00815E08
 005D361C    mov         ecx,esi
 005D361E    mov         edx,5D66D8;'SetupCloseLog'
 005D3623    mov         eax,dword ptr [ebx]
 005D3625    call        005D2554
 005D362A    mov         [00815E0C],eax;gvar_00815E0C
 005D362F    mov         ecx,esi
 005D3631    mov         edx,5D6700;'SetupDiCreateDeviceInfoList'
 005D3636    mov         eax,dword ptr [ebx]
 005D3638    call        005D2554
 005D363D    mov         [00815E10],eax;gvar_00815E10
 005D3642    mov         ecx,esi
 005D3644    mov         edx,5D6744;'SetupDiCreateDeviceInfoListExA'
 005D3649    mov         eax,dword ptr [ebx]
 005D364B    call        005D2554
 005D3650    mov         [00815E14],eax;gvar_00815E14
 005D3655    mov         ecx,esi
 005D3657    mov         edx,5D6790;'SetupDiCreateDeviceInfoListExW'
 005D365C    mov         eax,dword ptr [ebx]
 005D365E    call        005D2554
 005D3663    mov         [00815E18],eax;gvar_00815E18
 005D3668    mov         ecx,esi
 005D366A    mov         edx,5D6790;'SetupDiCreateDeviceInfoListExW'
 005D366F    mov         eax,dword ptr [ebx]
 005D3671    call        005D2554
 005D3676    mov         [00815E1C],eax;gvar_00815E1C
 005D367B    mov         ecx,esi
 005D367D    mov         edx,5D67DC;'SetupDiGetDeviceInfoListClass'
 005D3682    mov         eax,dword ptr [ebx]
 005D3684    call        005D2554
 005D3689    mov         [00815E20],eax;gvar_00815E20
 005D368E    mov         ecx,esi
 005D3690    mov         edx,5D6824;'SetupDiGetDeviceInfoListDetailA'
 005D3695    mov         eax,dword ptr [ebx]
 005D3697    call        005D2554
 005D369C    mov         [00815E24],eax;gvar_00815E24
 005D36A1    mov         ecx,esi
 005D36A3    mov         edx,5D6870;'SetupDiGetDeviceInfoListDetailW'
 005D36A8    mov         eax,dword ptr [ebx]
 005D36AA    call        005D2554
 005D36AF    mov         [00815E28],eax;gvar_00815E28
 005D36B4    mov         ecx,esi
 005D36B6    mov         edx,5D6870;'SetupDiGetDeviceInfoListDetailW'
 005D36BB    mov         eax,dword ptr [ebx]
 005D36BD    call        005D2554
 005D36C2    mov         [00815E2C],eax;gvar_00815E2C
 005D36C7    mov         ecx,esi
 005D36C9    mov         edx,5D68BC;'SetupDiCreateDeviceInfoA'
 005D36CE    mov         eax,dword ptr [ebx]
 005D36D0    call        005D2554
 005D36D5    mov         [00815E30],eax;gvar_00815E30
 005D36DA    mov         ecx,esi
 005D36DC    mov         edx,5D68FC;'SetupDiCreateDeviceInfoW'
 005D36E1    mov         eax,dword ptr [ebx]
 005D36E3    call        005D2554
 005D36E8    mov         [00815E34],eax;gvar_00815E34
 005D36ED    mov         ecx,esi
 005D36EF    mov         edx,5D68FC;'SetupDiCreateDeviceInfoW'
 005D36F4    mov         eax,dword ptr [ebx]
 005D36F6    call        005D2554
 005D36FB    mov         [00815E38],eax;gvar_00815E38
 005D3700    mov         ecx,esi
 005D3702    mov         edx,5D693C;'SetupDiOpenDeviceInfoA'
 005D3707    mov         eax,dword ptr [ebx]
 005D3709    call        005D2554
 005D370E    mov         [00815E3C],eax;gvar_00815E3C
 005D3713    mov         ecx,esi
 005D3715    mov         edx,5D6978;'SetupDiOpenDeviceInfoW'
 005D371A    mov         eax,dword ptr [ebx]
 005D371C    call        005D2554
 005D3721    mov         [00815E40],eax;gvar_00815E40
 005D3726    mov         ecx,esi
 005D3728    mov         edx,5D6978;'SetupDiOpenDeviceInfoW'
 005D372D    mov         eax,dword ptr [ebx]
 005D372F    call        005D2554
 005D3734    mov         [00815E44],eax;gvar_00815E44
 005D3739    mov         ecx,esi
 005D373B    mov         edx,5D69B4;'SetupDiGetDeviceInstanceIdA'
 005D3740    mov         eax,dword ptr [ebx]
 005D3742    call        005D2554
 005D3747    mov         [00815E48],eax;gvar_00815E48
 005D374C    mov         ecx,esi
 005D374E    mov         edx,5D69F8;'SetupDiGetDeviceInstanceIdW'
 005D3753    mov         eax,dword ptr [ebx]
 005D3755    call        005D2554
 005D375A    mov         [00815E4C],eax;gvar_00815E4C
 005D375F    mov         ecx,esi
 005D3761    mov         edx,5D69F8;'SetupDiGetDeviceInstanceIdW'
 005D3766    mov         eax,dword ptr [ebx]
 005D3768    call        005D2554
 005D376D    mov         [00815E50],eax;gvar_00815E50
 005D3772    mov         ecx,esi
 005D3774    mov         edx,5D6A3C;'SetupDiDeleteDeviceInfo'
 005D3779    mov         eax,dword ptr [ebx]
 005D377B    call        005D2554
 005D3780    mov         [00815E54],eax;gvar_00815E54
 005D3785    mov         ecx,esi
 005D3787    mov         edx,5D6A78;'SetupDiEnumDeviceInfo'
 005D378C    mov         eax,dword ptr [ebx]
 005D378E    call        005D2554
 005D3793    mov         [00815E58],eax;gvar_00815E58
 005D3798    mov         ecx,esi
 005D379A    mov         edx,5D6AB0;'SetupDiDestroyDeviceInfoList'
 005D379F    mov         eax,dword ptr [ebx]
 005D37A1    call        005D2554
 005D37A6    mov         [00815E5C],eax;gvar_00815E5C
 005D37AB    mov         ecx,esi
 005D37AD    mov         edx,5D6AF8;'SetupDiEnumDeviceInterfaces'
 005D37B2    mov         eax,dword ptr [ebx]
 005D37B4    call        005D2554
 005D37B9    mov         [00815E60],eax;gvar_00815E60
 005D37BE    mov         ecx,esi
 005D37C0    mov         edx,5D6AF8;'SetupDiEnumDeviceInterfaces'
 005D37C5    mov         eax,dword ptr [ebx]
 005D37C7    call        005D2554
 005D37CC    mov         [00815E64],eax;gvar_00815E64
 005D37D1    mov         ecx,esi
 005D37D3    mov         edx,5D6B3C;'SetupDiCreateDeviceInterfaceA'
 005D37D8    mov         eax,dword ptr [ebx]
 005D37DA    call        005D2554
 005D37DF    mov         [00815E68],eax;gvar_00815E68
 005D37E4    mov         ecx,esi
 005D37E6    mov         edx,5D6B3C;'SetupDiCreateDeviceInterfaceA'
 005D37EB    mov         eax,dword ptr [ebx]
 005D37ED    call        005D2554
 005D37F2    mov         [00815E6C],eax;gvar_00815E6C
 005D37F7    mov         ecx,esi
 005D37F9    mov         edx,5D6B84;'SetupDiCreateDeviceInterfaceW'
 005D37FE    mov         eax,dword ptr [ebx]
 005D3800    call        005D2554
 005D3805    mov         [00815E70],eax;gvar_00815E70
 005D380A    mov         ecx,esi
 005D380C    mov         edx,5D6B84;'SetupDiCreateDeviceInterfaceW'
 005D3811    mov         eax,dword ptr [ebx]
 005D3813    call        005D2554
 005D3818    mov         [00815E74],eax;gvar_00815E74
 005D381D    mov         ecx,esi
 005D381F    mov         edx,5D6B84;'SetupDiCreateDeviceInterfaceW'
 005D3824    mov         eax,dword ptr [ebx]
 005D3826    call        005D2554
 005D382B    mov         [00815E78],eax;gvar_00815E78
 005D3830    mov         ecx,esi
 005D3832    mov         edx,5D6B84;'SetupDiCreateDeviceInterfaceW'
 005D3837    mov         eax,dword ptr [ebx]
 005D3839    call        005D2554
 005D383E    mov         [00815E7C],eax;gvar_00815E7C
 005D3843    mov         ecx,esi
 005D3845    mov         edx,5D6BCC;'SetupDiOpenDeviceInterfaceA'
 005D384A    mov         eax,dword ptr [ebx]
 005D384C    call        005D2554
 005D3851    mov         [00815E80],eax;gvar_00815E80
 005D3856    mov         ecx,esi
 005D3858    mov         edx,5D6BCC;'SetupDiOpenDeviceInterfaceA'
 005D385D    mov         eax,dword ptr [ebx]
 005D385F    call        005D2554
 005D3864    mov         [00815E84],eax;gvar_00815E84
 005D3869    mov         ecx,esi
 005D386B    mov         edx,5D6C10;'SetupDiOpenDeviceInterfaceW'
 005D3870    mov         eax,dword ptr [ebx]
 005D3872    call        005D2554
 005D3877    mov         [00815E88],eax;gvar_00815E88
 005D387C    mov         ecx,esi
 005D387E    mov         edx,5D6C10;'SetupDiOpenDeviceInterfaceW'
 005D3883    mov         eax,dword ptr [ebx]
 005D3885    call        005D2554
 005D388A    mov         [00815E8C],eax;gvar_00815E8C
 005D388F    mov         ecx,esi
 005D3891    mov         edx,5D6C10;'SetupDiOpenDeviceInterfaceW'
 005D3896    mov         eax,dword ptr [ebx]
 005D3898    call        005D2554
 005D389D    mov         [00815E90],eax;gvar_00815E90
 005D38A2    mov         ecx,esi
 005D38A4    mov         edx,5D6C10;'SetupDiOpenDeviceInterfaceW'
 005D38A9    mov         eax,dword ptr [ebx]
 005D38AB    call        005D2554
 005D38B0    mov         [00815E94],eax;gvar_00815E94
 005D38B5    mov         ecx,esi
 005D38B7    mov         edx,5D6C54;'SetupDiGetDeviceInterfaceAlias'
 005D38BC    mov         eax,dword ptr [ebx]
 005D38BE    call        005D2554
 005D38C3    mov         [00815E98],eax;gvar_00815E98
 005D38C8    mov         ecx,esi
 005D38CA    mov         edx,5D6C54;'SetupDiGetDeviceInterfaceAlias'
 005D38CF    mov         eax,dword ptr [ebx]
 005D38D1    call        005D2554
 005D38D6    mov         [00815E9C],eax;gvar_00815E9C
 005D38DB    mov         ecx,esi
 005D38DD    mov         edx,5D6CA0;'SetupDiDeleteDeviceInterfaceData'
 005D38E2    mov         eax,dword ptr [ebx]
 005D38E4    call        005D2554
 005D38E9    mov         [00815EA0],eax;gvar_00815EA0
 005D38EE    mov         ecx,esi
 005D38F0    mov         edx,5D6CA0;'SetupDiDeleteDeviceInterfaceData'
 005D38F5    mov         eax,dword ptr [ebx]
 005D38F7    call        005D2554
 005D38FC    mov         [00815EA4],eax;gvar_00815EA4
 005D3901    mov         ecx,esi
 005D3903    mov         edx,5D6CF0;'SetupDiRemoveDeviceInterface'
 005D3908    mov         eax,dword ptr [ebx]
 005D390A    call        005D2554
 005D390F    mov         [00815EA8],eax;gvar_00815EA8
 005D3914    mov         ecx,esi
 005D3916    mov         edx,5D6CF0;'SetupDiRemoveDeviceInterface'
 005D391B    mov         eax,dword ptr [ebx]
 005D391D    call        005D2554
 005D3922    mov         [00815EAC],eax;gvar_00815EAC
 005D3927    mov         ecx,esi
 005D3929    mov         edx,5D6D38;'SetupDiGetDeviceInterfaceDetailA'
 005D392E    mov         eax,dword ptr [ebx]
 005D3930    call        005D2554
 005D3935    mov         [00815EB0],eax;gvar_00815EB0
 005D393A    mov         ecx,esi
 005D393C    mov         edx,5D6D38;'SetupDiGetDeviceInterfaceDetailA'
 005D3941    mov         eax,dword ptr [ebx]
 005D3943    call        005D2554
 005D3948    mov         [00815EB4],eax;gvar_00815EB4
 005D394D    mov         ecx,esi
 005D394F    mov         edx,5D6D88;'SetupDiGetDeviceInterfaceDetailW'
 005D3954    mov         eax,dword ptr [ebx]
 005D3956    call        005D2554
 005D395B    mov         [00815EB8],eax;gvar_00815EB8
 005D3960    mov         ecx,esi
 005D3962    mov         edx,5D6D88;'SetupDiGetDeviceInterfaceDetailW'
 005D3967    mov         eax,dword ptr [ebx]
 005D3969    call        005D2554
 005D396E    mov         [00815EBC],eax;gvar_00815EBC
 005D3973    mov         ecx,esi
 005D3975    mov         edx,5D6D88;'SetupDiGetDeviceInterfaceDetailW'
 005D397A    mov         eax,dword ptr [ebx]
 005D397C    call        005D2554
 005D3981    mov         [00815EC0],eax;gvar_00815EC0
 005D3986    mov         ecx,esi
 005D3988    mov         edx,5D6D88;'SetupDiGetDeviceInterfaceDetailW'
 005D398D    mov         eax,dword ptr [ebx]
 005D398F    call        005D2554
 005D3994    mov         [00815EC4],eax;gvar_00815EC4
 005D3999    mov         ecx,esi
 005D399B    mov         edx,5D6DD8;'SetupDiInstallDeviceInterfaces'
 005D39A0    mov         eax,dword ptr [ebx]
 005D39A2    call        005D2554
 005D39A7    mov         [00815EC8],eax;gvar_00815EC8
 005D39AC    mov         ecx,esi
 005D39AE    mov         edx,5D6DD8;'SetupDiInstallDeviceInterfaces'
 005D39B3    mov         eax,dword ptr [ebx]
 005D39B5    call        005D2554
 005D39BA    mov         [00815ECC],eax;gvar_00815ECC
 005D39BF    mov         ecx,esi
 005D39C1    mov         edx,5D6E24;'SetupDiRegisterDeviceInfo'
 005D39C6    mov         eax,dword ptr [ebx]
 005D39C8    call        005D2554
 005D39CD    mov         [00815ED0],eax;gvar_00815ED0
 005D39D2    mov         ecx,esi
 005D39D4    mov         edx,5D6E64;'SetupDiBuildDriverInfoList'
 005D39D9    mov         eax,dword ptr [ebx]
 005D39DB    call        005D2554
 005D39E0    mov         [00815ED4],eax;gvar_00815ED4
 005D39E5    mov         ecx,esi
 005D39E7    mov         edx,5D6EA8;'SetupDiCancelDriverInfoSearch'
 005D39EC    mov         eax,dword ptr [ebx]
 005D39EE    call        005D2554
 005D39F3    mov         [00815ED8],eax;gvar_00815ED8
 005D39F8    mov         ecx,esi
 005D39FA    mov         edx,5D6EF0;'SetupDiEnumDriverInfoA'
 005D39FF    mov         eax,dword ptr [ebx]
 005D3A01    call        005D2554
 005D3A06    mov         [00815EDC],eax;gvar_00815EDC
 005D3A0B    mov         ecx,esi
 005D3A0D    mov         edx,5D6F2C;'SetupDiEnumDriverInfoW'
 005D3A12    mov         eax,dword ptr [ebx]
 005D3A14    call        005D2554
 005D3A19    mov         [00815EE0],eax;gvar_00815EE0
 005D3A1E    mov         ecx,esi
 005D3A20    mov         edx,5D6F2C;'SetupDiEnumDriverInfoW'
 005D3A25    mov         eax,dword ptr [ebx]
 005D3A27    call        005D2554
 005D3A2C    mov         [00815EE4],eax;gvar_00815EE4
 005D3A31    mov         ecx,esi
 005D3A33    mov         edx,5D6F68;'SetupDiGetSelectedDriverA'
 005D3A38    mov         eax,dword ptr [ebx]
 005D3A3A    call        005D2554
 005D3A3F    mov         [00815EE8],eax;gvar_00815EE8
 005D3A44    mov         ecx,esi
 005D3A46    mov         edx,5D6FA8;'SetupDiGetSelectedDriverW'
 005D3A4B    mov         eax,dword ptr [ebx]
 005D3A4D    call        005D2554
 005D3A52    mov         [00815EEC],eax;gvar_00815EEC
 005D3A57    mov         ecx,esi
 005D3A59    mov         edx,5D6FA8;'SetupDiGetSelectedDriverW'
 005D3A5E    mov         eax,dword ptr [ebx]
 005D3A60    call        005D2554
 005D3A65    mov         [00815EF0],eax;gvar_00815EF0
 005D3A6A    mov         ecx,esi
 005D3A6C    mov         edx,5D6FE8;'SetupDiSetSelectedDriverA'
 005D3A71    mov         eax,dword ptr [ebx]
 005D3A73    call        005D2554
 005D3A78    mov         [00815EF4],eax;gvar_00815EF4
 005D3A7D    mov         ecx,esi
 005D3A7F    mov         edx,5D7028;'SetupDiSetSelectedDriverW'
 005D3A84    mov         eax,dword ptr [ebx]
 005D3A86    call        005D2554
 005D3A8B    mov         [00815EF8],eax;gvar_00815EF8
 005D3A90    mov         ecx,esi
 005D3A92    mov         edx,5D7028;'SetupDiSetSelectedDriverW'
 005D3A97    mov         eax,dword ptr [ebx]
 005D3A99    call        005D2554
 005D3A9E    mov         [00815EFC],eax;gvar_00815EFC
 005D3AA3    mov         ecx,esi
 005D3AA5    mov         edx,5D7068;'SetupDiGetDriverInfoDetailA'
 005D3AAA    mov         eax,dword ptr [ebx]
 005D3AAC    call        005D2554
 005D3AB1    mov         [00815F00],eax;gvar_00815F00
 005D3AB6    mov         ecx,esi
 005D3AB8    mov         edx,5D70AC;'SetupDiGetDriverInfoDetailW'
 005D3ABD    mov         eax,dword ptr [ebx]
 005D3ABF    call        005D2554
 005D3AC4    mov         [00815F04],eax;gvar_00815F04
 005D3AC9    mov         ecx,esi
 005D3ACB    mov         edx,5D70AC;'SetupDiGetDriverInfoDetailW'
 005D3AD0    mov         eax,dword ptr [ebx]
 005D3AD2    call        005D2554
 005D3AD7    mov         [00815F08],eax;gvar_00815F08
 005D3ADC    mov         ecx,esi
 005D3ADE    mov         edx,5D70F0;'SetupDiDestroyDriverInfoList'
 005D3AE3    mov         eax,dword ptr [ebx]
 005D3AE5    call        005D2554
 005D3AEA    mov         [00815F0C],eax;gvar_00815F0C
 005D3AEF    mov         ecx,esi
 005D3AF1    mov         edx,5D7138;'SetupDiGetClassDevsA'
 005D3AF6    mov         eax,dword ptr [ebx]
 005D3AF8    call        005D2554
 005D3AFD    mov         [00815F10],eax;gvar_00815F10
 005D3B02    mov         ecx,esi
 005D3B04    mov         edx,5D7170;'SetupDiGetClassDevsW'
 005D3B09    mov         eax,dword ptr [ebx]
 005D3B0B    call        005D2554
 005D3B10    mov         [00815F14],eax;gvar_00815F14
 005D3B15    mov         ecx,esi
 005D3B17    mov         edx,5D7170;'SetupDiGetClassDevsW'
 005D3B1C    mov         eax,dword ptr [ebx]
 005D3B1E    call        005D2554
 005D3B23    mov         [00815F18],eax;gvar_00815F18
 005D3B28    mov         ecx,esi
 005D3B2A    mov         edx,5D71A8;'SetupDiGetClassDevsExA'
 005D3B2F    mov         eax,dword ptr [ebx]
 005D3B31    call        005D2554
 005D3B36    mov         [00815F1C],eax;gvar_00815F1C
 005D3B3B    mov         ecx,esi
 005D3B3D    mov         edx,5D71E4;'SetupDiGetClassDevsExW'
 005D3B42    mov         eax,dword ptr [ebx]
 005D3B44    call        005D2554
 005D3B49    mov         [00815F20],eax;gvar_00815F20
 005D3B4E    mov         ecx,esi
 005D3B50    mov         edx,5D71E4;'SetupDiGetClassDevsExW'
 005D3B55    mov         eax,dword ptr [ebx]
 005D3B57    call        005D2554
 005D3B5C    mov         [00815F24],eax;gvar_00815F24
 005D3B61    mov         ecx,esi
 005D3B63    mov         edx,5D7220;'SetupDiGetINFClassA'
 005D3B68    mov         eax,dword ptr [ebx]
 005D3B6A    call        005D2554
 005D3B6F    mov         [00815F28],eax;gvar_00815F28
 005D3B74    mov         ecx,esi
 005D3B76    mov         edx,5D7254;'SetupDiGetINFClassW'
 005D3B7B    mov         eax,dword ptr [ebx]
 005D3B7D    call        005D2554
 005D3B82    mov         [00815F2C],eax;gvar_00815F2C
 005D3B87    mov         ecx,esi
 005D3B89    mov         edx,5D7254;'SetupDiGetINFClassW'
 005D3B8E    mov         eax,dword ptr [ebx]
 005D3B90    call        005D2554
 005D3B95    mov         [00815F30],eax;gvar_00815F30
 005D3B9A    mov         ecx,esi
 005D3B9C    mov         edx,5D7288;'SetupDiBuildClassInfoList'
 005D3BA1    mov         eax,dword ptr [ebx]
 005D3BA3    call        005D2554
 005D3BA8    mov         [00815F34],eax;gvar_00815F34
 005D3BAD    mov         ecx,esi
 005D3BAF    mov         edx,5D72C8;'SetupDiBuildClassInfoListExA'
 005D3BB4    mov         eax,dword ptr [ebx]
 005D3BB6    call        005D2554
 005D3BBB    mov         [00815F38],eax;gvar_00815F38
 005D3BC0    mov         ecx,esi
 005D3BC2    mov         edx,5D7310;'SetupDiBuildClassInfoListExW'
 005D3BC7    mov         eax,dword ptr [ebx]
 005D3BC9    call        005D2554
 005D3BCE    mov         [00815F3C],eax;gvar_00815F3C
 005D3BD3    mov         ecx,esi
 005D3BD5    mov         edx,5D7310;'SetupDiBuildClassInfoListExW'
 005D3BDA    mov         eax,dword ptr [ebx]
 005D3BDC    call        005D2554
 005D3BE1    mov         [00815F40],eax;gvar_00815F40
 005D3BE6    mov         ecx,esi
 005D3BE8    mov         edx,5D7358;'SetupDiGetClassDescriptionA'
 005D3BED    mov         eax,dword ptr [ebx]
 005D3BEF    call        005D2554
 005D3BF4    mov         [00815F44],eax;gvar_00815F44
 005D3BF9    mov         ecx,esi
 005D3BFB    mov         edx,5D739C;'SetupDiGetClassDescriptionW'
 005D3C00    mov         eax,dword ptr [ebx]
 005D3C02    call        005D2554
 005D3C07    mov         [00815F48],eax;gvar_00815F48
 005D3C0C    mov         ecx,esi
 005D3C0E    mov         edx,5D739C;'SetupDiGetClassDescriptionW'
 005D3C13    mov         eax,dword ptr [ebx]
 005D3C15    call        005D2554
 005D3C1A    mov         [00815F4C],eax;gvar_00815F4C
 005D3C1F    mov         ecx,esi
 005D3C21    mov         edx,5D73E0;'SetupDiGetClassDescriptionExA'
 005D3C26    mov         eax,dword ptr [ebx]
 005D3C28    call        005D2554
 005D3C2D    mov         [00815F50],eax;gvar_00815F50
 005D3C32    mov         ecx,esi
 005D3C34    mov         edx,5D7428;'SetupDiGetClassDescriptionExW'
 005D3C39    mov         eax,dword ptr [ebx]
 005D3C3B    call        005D2554
 005D3C40    mov         [00815F54],eax;gvar_00815F54
 005D3C45    mov         ecx,esi
 005D3C47    mov         edx,5D7428;'SetupDiGetClassDescriptionExW'
 005D3C4C    mov         eax,dword ptr [ebx]
 005D3C4E    call        005D2554
 005D3C53    mov         [00815F58],eax;gvar_00815F58
 005D3C58    mov         ecx,esi
 005D3C5A    mov         edx,5D7470;'SetupDiCallClassInstaller'
 005D3C5F    mov         eax,dword ptr [ebx]
 005D3C61    call        005D2554
 005D3C66    mov         [00815F5C],eax;gvar_00815F5C
 005D3C6B    mov         ecx,esi
 005D3C6D    mov         edx,5D74B0;'SetupDiSelectDevice'
 005D3C72    mov         eax,dword ptr [ebx]
 005D3C74    call        005D2554
 005D3C79    mov         [00815F60],eax;gvar_00815F60
 005D3C7E    mov         ecx,esi
 005D3C80    mov         edx,5D74E4;'SetupDiSelectBestCompatDrv'
 005D3C85    mov         eax,dword ptr [ebx]
 005D3C87    call        005D2554
 005D3C8C    mov         [00815F64],eax;gvar_00815F64
 005D3C91    mov         ecx,esi
 005D3C93    mov         edx,5D7528;'SetupDiInstallDevice'
 005D3C98    mov         eax,dword ptr [ebx]
 005D3C9A    call        005D2554
 005D3C9F    mov         [00815F68],eax;gvar_00815F68
 005D3CA4    mov         ecx,esi
 005D3CA6    mov         edx,5D7560;'SetupDiInstallDriverFiles'
 005D3CAB    mov         eax,dword ptr [ebx]
 005D3CAD    call        005D2554
 005D3CB2    mov         [00815F6C],eax;gvar_00815F6C
 005D3CB7    mov         ecx,esi
 005D3CB9    mov         edx,5D75A0;'SetupDiRegisterCoDeviceInstallers'
 005D3CBE    mov         eax,dword ptr [ebx]
 005D3CC0    call        005D2554
 005D3CC5    mov         [00815F70],eax;gvar_00815F70
 005D3CCA    mov         ecx,esi
 005D3CCC    mov         edx,5D75F0;'SetupDiRemoveDevice'
 005D3CD1    mov         eax,dword ptr [ebx]
 005D3CD3    call        005D2554
 005D3CD8    mov         [00815F74],eax;gvar_00815F74
 005D3CDD    mov         ecx,esi
 005D3CDF    mov         edx,5D7624;'SetupDiUnremoveDevice'
 005D3CE4    mov         eax,dword ptr [ebx]
 005D3CE6    call        005D2554
 005D3CEB    mov         [00815F78],eax;gvar_00815F78
 005D3CF0    mov         ecx,esi
 005D3CF2    mov         edx,5D765C;'SetupDiMoveDuplicateDevice'
 005D3CF7    mov         eax,dword ptr [ebx]
 005D3CF9    call        005D2554
 005D3CFE    mov         [00815F7C],eax;gvar_00815F7C
 005D3D03    mov         ecx,esi
 005D3D05    mov         edx,5D76A0;'SetupDiChangeState'
 005D3D0A    mov         eax,dword ptr [ebx]
 005D3D0C    call        005D2554
 005D3D11    mov         [00815F80],eax;gvar_00815F80
 005D3D16    mov         ecx,esi
 005D3D18    mov         edx,5D76D4;'SetupDiInstallClassA'
 005D3D1D    mov         eax,dword ptr [ebx]
 005D3D1F    call        005D2554
 005D3D24    mov         [00815F84],eax;gvar_00815F84
 005D3D29    mov         ecx,esi
 005D3D2B    mov         edx,5D770C;'SetupDiInstallClassW'
 005D3D30    mov         eax,dword ptr [ebx]
 005D3D32    call        005D2554
 005D3D37    mov         [00815F88],eax;gvar_00815F88
 005D3D3C    mov         ecx,esi
 005D3D3E    mov         edx,5D770C;'SetupDiInstallClassW'
 005D3D43    mov         eax,dword ptr [ebx]
 005D3D45    call        005D2554
 005D3D4A    mov         [00815F8C],eax;gvar_00815F8C
 005D3D4F    mov         ecx,esi
 005D3D51    mov         edx,5D7744;'SetupDiInstallClassExA'
 005D3D56    mov         eax,dword ptr [ebx]
 005D3D58    call        005D2554
 005D3D5D    mov         [00815F90],eax;gvar_00815F90
 005D3D62    mov         ecx,esi
 005D3D64    mov         edx,5D7780;'SetupDiInstallClassExW'
 005D3D69    mov         eax,dword ptr [ebx]
 005D3D6B    call        005D2554
 005D3D70    mov         [00815F94],eax;gvar_00815F94
 005D3D75    mov         ecx,esi
 005D3D77    mov         edx,5D7780;'SetupDiInstallClassExW'
 005D3D7C    mov         eax,dword ptr [ebx]
 005D3D7E    call        005D2554
 005D3D83    mov         [00815F98],eax;gvar_00815F98
 005D3D88    mov         ecx,esi
 005D3D8A    mov         edx,5D77BC;'SetupDiOpenClassRegKey'
 005D3D8F    mov         eax,dword ptr [ebx]
 005D3D91    call        005D2554
 005D3D96    mov         [00815F9C],eax;gvar_00815F9C
 005D3D9B    mov         ecx,esi
 005D3D9D    mov         edx,5D77F8;'SetupDiOpenClassRegKeyExA'
 005D3DA2    mov         eax,dword ptr [ebx]
 005D3DA4    call        005D2554
 005D3DA9    mov         [00815FA0],eax;gvar_00815FA0
 005D3DAE    mov         ecx,esi
 005D3DB0    mov         edx,5D7838;'SetupDiOpenClassRegKeyExW'
 005D3DB5    mov         eax,dword ptr [ebx]
 005D3DB7    call        005D2554
 005D3DBC    mov         [00815FA4],eax;gvar_00815FA4
 005D3DC1    mov         ecx,esi
 005D3DC3    mov         edx,5D7838;'SetupDiOpenClassRegKeyExW'
 005D3DC8    mov         eax,dword ptr [ebx]
 005D3DCA    call        005D2554
 005D3DCF    mov         [00815FA8],eax;gvar_00815FA8
 005D3DD4    mov         ecx,esi
 005D3DD6    mov         edx,5D7878;'SetupDiCreateDeviceInterfaceRegKeyA'
 005D3DDB    mov         eax,dword ptr [ebx]
 005D3DDD    call        005D2554
 005D3DE2    mov         [00815FAC],eax;gvar_00815FAC
 005D3DE7    mov         ecx,esi
 005D3DE9    mov         edx,5D7878;'SetupDiCreateDeviceInterfaceRegKeyA'
 005D3DEE    mov         eax,dword ptr [ebx]
 005D3DF0    call        005D2554
 005D3DF5    mov         [00815FB0],eax;gvar_00815FB0
 005D3DFA    mov         ecx,esi
 005D3DFC    mov         edx,5D78CC;'SetupDiCreateDeviceInterfaceRegKeyW'
 005D3E01    mov         eax,dword ptr [ebx]
 005D3E03    call        005D2554
 005D3E08    mov         [00815FB4],eax;gvar_00815FB4
 005D3E0D    mov         ecx,esi
 005D3E0F    mov         edx,5D78CC;'SetupDiCreateDeviceInterfaceRegKeyW'
 005D3E14    mov         eax,dword ptr [ebx]
 005D3E16    call        005D2554
 005D3E1B    mov         [00815FB8],eax;gvar_00815FB8
 005D3E20    mov         ecx,esi
 005D3E22    mov         edx,5D78CC;'SetupDiCreateDeviceInterfaceRegKeyW'
 005D3E27    mov         eax,dword ptr [ebx]
 005D3E29    call        005D2554
 005D3E2E    mov         [00815FBC],eax;gvar_00815FBC
 005D3E33    mov         ecx,esi
 005D3E35    mov         edx,5D78CC;'SetupDiCreateDeviceInterfaceRegKeyW'
 005D3E3A    mov         eax,dword ptr [ebx]
 005D3E3C    call        005D2554
 005D3E41    mov         [00815FC0],eax;gvar_00815FC0
 005D3E46    mov         ecx,esi
 005D3E48    mov         edx,5D7920;'SetupDiOpenDeviceInterfaceRegKey'
 005D3E4D    mov         eax,dword ptr [ebx]
 005D3E4F    call        005D2554
 005D3E54    mov         [00815FC4],eax;gvar_00815FC4
 005D3E59    mov         ecx,esi
 005D3E5B    mov         edx,5D7920;'SetupDiOpenDeviceInterfaceRegKey'
 005D3E60    mov         eax,dword ptr [ebx]
 005D3E62    call        005D2554
 005D3E67    mov         [00815FC8],eax;gvar_00815FC8
 005D3E6C    mov         ecx,esi
 005D3E6E    mov         edx,5D7970;'SetupDiDeleteDeviceInterfaceRegKey'
 005D3E73    mov         eax,dword ptr [ebx]
 005D3E75    call        005D2554
 005D3E7A    mov         [00815FCC],eax;gvar_00815FCC
 005D3E7F    mov         ecx,esi
 005D3E81    mov         edx,5D7970;'SetupDiDeleteDeviceInterfaceRegKey'
 005D3E86    mov         eax,dword ptr [ebx]
 005D3E88    call        005D2554
 005D3E8D    mov         [00815FD0],eax;gvar_00815FD0
 005D3E92    mov         ecx,esi
 005D3E94    mov         edx,5D79C4;'SetupDiCreateDevRegKeyA'
 005D3E99    mov         eax,dword ptr [ebx]
 005D3E9B    call        005D2554
 005D3EA0    mov         [00815FD4],eax;gvar_00815FD4
 005D3EA5    mov         ecx,esi
 005D3EA7    mov         edx,5D7A00;'SetupDiCreateDevRegKeyW'
 005D3EAC    mov         eax,dword ptr [ebx]
 005D3EAE    call        005D2554
 005D3EB3    mov         [00815FD8],eax;gvar_00815FD8
 005D3EB8    mov         ecx,esi
 005D3EBA    mov         edx,5D7A00;'SetupDiCreateDevRegKeyW'
 005D3EBF    mov         eax,dword ptr [ebx]
 005D3EC1    call        005D2554
 005D3EC6    mov         [00815FDC],eax;gvar_00815FDC
 005D3ECB    mov         ecx,esi
 005D3ECD    mov         edx,5D7A3C;'SetupDiOpenDevRegKey'
 005D3ED2    mov         eax,dword ptr [ebx]
 005D3ED4    call        005D2554
 005D3ED9    mov         [00815FE0],eax;gvar_00815FE0
 005D3EDE    mov         ecx,esi
 005D3EE0    mov         edx,5D7A74;'SetupDiDeleteDevRegKey'
 005D3EE5    mov         eax,dword ptr [ebx]
 005D3EE7    call        005D2554
 005D3EEC    mov         [00815FE4],eax;gvar_00815FE4
 005D3EF1    mov         ecx,esi
 005D3EF3    mov         edx,5D7AB0;'SetupDiGetHwProfileList'
 005D3EF8    mov         eax,dword ptr [ebx]
 005D3EFA    call        005D2554
 005D3EFF    mov         [00815FE8],eax;gvar_00815FE8
 005D3F04    mov         ecx,esi
 005D3F06    mov         edx,5D7AEC;'SetupDiGetHwProfileListExA'
 005D3F0B    mov         eax,dword ptr [ebx]
 005D3F0D    call        005D2554
 005D3F12    mov         [00815FEC],eax;gvar_00815FEC
 005D3F17    mov         ecx,esi
 005D3F19    mov         edx,5D7B30;'SetupDiGetHwProfileListExW'
 005D3F1E    mov         eax,dword ptr [ebx]
 005D3F20    call        005D2554
 005D3F25    mov         [00815FF0],eax;gvar_00815FF0
 005D3F2A    mov         ecx,esi
 005D3F2C    mov         edx,5D7B30;'SetupDiGetHwProfileListExW'
 005D3F31    mov         eax,dword ptr [ebx]
 005D3F33    call        005D2554
 005D3F38    mov         [00815FF4],eax;gvar_00815FF4
 005D3F3D    mov         ecx,esi
 005D3F3F    mov         edx,5D7B74;'SetupDiGetDeviceRegistryPropertyA'
 005D3F44    mov         eax,dword ptr [ebx]
 005D3F46    call        005D2554
 005D3F4B    mov         [00815FF8],eax;gvar_00815FF8
 005D3F50    mov         ecx,esi
 005D3F52    mov         edx,5D7BC4;'SetupDiGetDeviceRegistryPropertyW'
 005D3F57    mov         eax,dword ptr [ebx]
 005D3F59    call        005D2554
 005D3F5E    mov         [00815FFC],eax;gvar_00815FFC
 005D3F63    mov         ecx,esi
 005D3F65    mov         edx,5D7BC4;'SetupDiGetDeviceRegistryPropertyW'
 005D3F6A    mov         eax,dword ptr [ebx]
 005D3F6C    call        005D2554
 005D3F71    mov         [00816000],eax;gvar_00816000
 005D3F76    mov         ecx,esi
 005D3F78    mov         edx,5D7C14;'SetupDiSetDeviceRegistryPropertyA'
 005D3F7D    mov         eax,dword ptr [ebx]
 005D3F7F    call        005D2554
 005D3F84    mov         [00816004],eax;gvar_00816004
 005D3F89    mov         ecx,esi
 005D3F8B    mov         edx,5D7C64;'SetupDiSetDeviceRegistryPropertyW'
 005D3F90    mov         eax,dword ptr [ebx]
 005D3F92    call        005D2554
 005D3F97    mov         [00816008],eax;gvar_00816008
 005D3F9C    mov         ecx,esi
 005D3F9E    mov         edx,5D7C64;'SetupDiSetDeviceRegistryPropertyW'
 005D3FA3    mov         eax,dword ptr [ebx]
 005D3FA5    call        005D2554
 005D3FAA    mov         [0081600C],eax;gvar_0081600C
 005D3FAF    mov         ecx,esi
 005D3FB1    mov         edx,5D7CB4;'SetupDiGetDeviceInstallParamsA'
 005D3FB6    mov         eax,dword ptr [ebx]
 005D3FB8    call        005D2554
 005D3FBD    mov         [00816010],eax;gvar_00816010
 005D3FC2    mov         ecx,esi
 005D3FC4    mov         edx,5D7D00;'SetupDiGetDeviceInstallParamsW'
 005D3FC9    mov         eax,dword ptr [ebx]
 005D3FCB    call        005D2554
 005D3FD0    mov         [00816014],eax;gvar_00816014
 005D3FD5    mov         ecx,esi
 005D3FD7    mov         edx,5D7D00;'SetupDiGetDeviceInstallParamsW'
 005D3FDC    mov         eax,dword ptr [ebx]
 005D3FDE    call        005D2554
 005D3FE3    mov         [00816018],eax;gvar_00816018
 005D3FE8    mov         ecx,esi
 005D3FEA    mov         edx,5D7D4C;'SetupDiGetClassInstallParamsA'
 005D3FEF    mov         eax,dword ptr [ebx]
 005D3FF1    call        005D2554
 005D3FF6    mov         [0081601C],eax;gvar_0081601C
 005D3FFB    mov         ecx,esi
 005D3FFD    mov         edx,5D7D94;'SetupDiGetClassInstallParamsW'
 005D4002    mov         eax,dword ptr [ebx]
 005D4004    call        005D2554
 005D4009    mov         [00816020],eax;gvar_00816020
 005D400E    mov         ecx,esi
 005D4010    mov         edx,5D7D94;'SetupDiGetClassInstallParamsW'
 005D4015    mov         eax,dword ptr [ebx]
 005D4017    call        005D2554
 005D401C    mov         [00816024],eax;gvar_00816024
 005D4021    mov         ecx,esi
 005D4023    mov         edx,5D7DDC;'SetupDiSetDeviceInstallParamsA'
 005D4028    mov         eax,dword ptr [ebx]
 005D402A    call        005D2554
 005D402F    mov         [00816028],eax;gvar_00816028
 005D4034    mov         ecx,esi
 005D4036    mov         edx,5D7E28;'SetupDiSetDeviceInstallParamsW'
 005D403B    mov         eax,dword ptr [ebx]
 005D403D    call        005D2554
 005D4042    mov         [0081602C],eax;gvar_0081602C
 005D4047    mov         ecx,esi
 005D4049    mov         edx,5D7E28;'SetupDiSetDeviceInstallParamsW'
 005D404E    mov         eax,dword ptr [ebx]
 005D4050    call        005D2554
 005D4055    mov         [00816030],eax;gvar_00816030
 005D405A    mov         ecx,esi
 005D405C    mov         edx,5D7E74;'SetupDiSetClassInstallParamsA'
 005D4061    mov         eax,dword ptr [ebx]
 005D4063    call        005D2554
 005D4068    mov         [00816034],eax;gvar_00816034
 005D406D    mov         ecx,esi
 005D406F    mov         edx,5D7EBC;'SetupDiSetClassInstallParamsW'
 005D4074    mov         eax,dword ptr [ebx]
 005D4076    call        005D2554
 005D407B    mov         [00816038],eax;gvar_00816038
 005D4080    mov         ecx,esi
 005D4082    mov         edx,5D7EBC;'SetupDiSetClassInstallParamsW'
 005D4087    mov         eax,dword ptr [ebx]
 005D4089    call        005D2554
 005D408E    mov         [0081603C],eax;gvar_0081603C
 005D4093    mov         ecx,esi
 005D4095    mov         edx,5D7F04;'SetupDiGetDriverInstallParamsA'
 005D409A    mov         eax,dword ptr [ebx]
 005D409C    call        005D2554
 005D40A1    mov         [00816040],eax;gvar_00816040
 005D40A6    mov         ecx,esi
 005D40A8    mov         edx,5D7F50;'SetupDiGetDriverInstallParamsW'
 005D40AD    mov         eax,dword ptr [ebx]
 005D40AF    call        005D2554
 005D40B4    mov         [00816044],eax;gvar_00816044
 005D40B9    mov         ecx,esi
 005D40BB    mov         edx,5D7F50;'SetupDiGetDriverInstallParamsW'
 005D40C0    mov         eax,dword ptr [ebx]
 005D40C2    call        005D2554
 005D40C7    mov         [00816048],eax;gvar_00816048
 005D40CC    mov         ecx,esi
 005D40CE    mov         edx,5D7F9C;'SetupDiSetDriverInstallParamsA'
 005D40D3    mov         eax,dword ptr [ebx]
 005D40D5    call        005D2554
 005D40DA    mov         [0081604C],eax;gvar_0081604C
 005D40DF    mov         ecx,esi
 005D40E1    mov         edx,5D7FE8;'SetupDiSetDriverInstallParamsW'
 005D40E6    mov         eax,dword ptr [ebx]
 005D40E8    call        005D2554
 005D40ED    mov         [00816050],eax;gvar_00816050
 005D40F2    mov         ecx,esi
 005D40F4    mov         edx,5D7FE8;'SetupDiSetDriverInstallParamsW'
 005D40F9    mov         eax,dword ptr [ebx]
 005D40FB    call        005D2554
 005D4100    mov         [00816054],eax;gvar_00816054
 005D4105    mov         ecx,esi
 005D4107    mov         edx,5D8034;'SetupDiLoadClassIcon'
 005D410C    mov         eax,dword ptr [ebx]
 005D410E    call        005D2554
 005D4113    mov         [00816058],eax;gvar_00816058
 005D4118    mov         ecx,esi
 005D411A    mov         edx,5D806C;'SetupDiDrawMiniIcon'
 005D411F    mov         eax,dword ptr [ebx]
 005D4121    call        005D2554
 005D4126    mov         [0081605C],eax;gvar_0081605C
 005D412B    mov         ecx,esi
 005D412D    mov         edx,5D80A0;'SetupDiGetClassBitmapIndex'
 005D4132    mov         eax,dword ptr [ebx]
 005D4134    call        005D2554
 005D4139    mov         [00816060],eax;gvar_00816060
 005D413E    mov         ecx,esi
 005D4140    mov         edx,5D80E4;'SetupDiGetClassImageList'
 005D4145    mov         eax,dword ptr [ebx]
 005D4147    call        005D2554
 005D414C    mov         [00816064],eax;gvar_00816064
 005D4151    mov         ecx,esi
 005D4153    mov         edx,5D8124;'SetupDiGetClassImageListExA'
 005D4158    mov         eax,dword ptr [ebx]
 005D415A    call        005D2554
 005D415F    mov         [00816068],eax;gvar_00816068
 005D4164    mov         ecx,esi
 005D4166    mov         edx,5D8168;'SetupDiGetClassImageListExW'
 005D416B    mov         eax,dword ptr [ebx]
 005D416D    call        005D2554
 005D4172    mov         [0081606C],eax;gvar_0081606C
 005D4177    mov         ecx,esi
 005D4179    mov         edx,5D8168;'SetupDiGetClassImageListExW'
 005D417E    mov         eax,dword ptr [ebx]
 005D4180    call        005D2554
 005D4185    mov         [00816070],eax;gvar_00816070
 005D418A    mov         ecx,esi
 005D418C    mov         edx,5D81AC;'SetupDiGetClassImageIndex'
 005D4191    mov         eax,dword ptr [ebx]
 005D4193    call        005D2554
 005D4198    mov         [00816074],eax;gvar_00816074
 005D419D    mov         ecx,esi
 005D419F    mov         edx,5D81EC;'SetupDiDestroyClassImageList'
 005D41A4    mov         eax,dword ptr [ebx]
 005D41A6    call        005D2554
 005D41AB    mov         [00816078],eax;gvar_00816078
 005D41B0    mov         ecx,esi
 005D41B2    mov         edx,5D8234;'SetupDiGetClassDevPropertySheetsA'
 005D41B7    mov         eax,dword ptr [ebx]
 005D41B9    call        005D2554
 005D41BE    mov         [0081607C],eax;gvar_0081607C
 005D41C3    mov         ecx,esi
 005D41C5    mov         edx,5D8284;'SetupDiGetClassDevPropertySheetsW'
 005D41CA    mov         eax,dword ptr [ebx]
 005D41CC    call        005D2554
 005D41D1    mov         [00816080],eax;gvar_00816080
 005D41D6    mov         ecx,esi
 005D41D8    mov         edx,5D8284;'SetupDiGetClassDevPropertySheetsW'
 005D41DD    mov         eax,dword ptr [ebx]
 005D41DF    call        005D2554
 005D41E4    mov         [00816084],eax;gvar_00816084
 005D41E9    mov         ecx,esi
 005D41EB    mov         edx,5D82D4;'SetupDiAskForOEMDisk'
 005D41F0    mov         eax,dword ptr [ebx]
 005D41F2    call        005D2554
 005D41F7    mov         [00816088],eax;gvar_00816088
 005D41FC    mov         ecx,esi
 005D41FE    mov         edx,5D830C;'SetupDiSelectOEMDrv'
 005D4203    mov         eax,dword ptr [ebx]
 005D4205    call        005D2554
 005D420A    mov         [0081608C],eax;gvar_0081608C
 005D420F    mov         ecx,esi
 005D4211    mov         edx,5D8340;'SetupDiClassNameFromGuidA'
 005D4216    mov         eax,dword ptr [ebx]
 005D4218    call        005D2554
 005D421D    mov         [00816090],eax;gvar_00816090
 005D4222    mov         ecx,esi
 005D4224    mov         edx,5D8380;'SetupDiClassNameFromGuidW'
 005D4229    mov         eax,dword ptr [ebx]
 005D422B    call        005D2554
 005D4230    mov         [00816094],eax;gvar_00816094
 005D4235    mov         ecx,esi
 005D4237    mov         edx,5D8380;'SetupDiClassNameFromGuidW'
 005D423C    mov         eax,dword ptr [ebx]
 005D423E    call        005D2554
 005D4243    mov         [00816098],eax;gvar_00816098
 005D4248    mov         ecx,esi
 005D424A    mov         edx,5D83C0;'SetupDiClassNameFromGuidExA'
 005D424F    mov         eax,dword ptr [ebx]
 005D4251    call        005D2554
 005D4256    mov         [0081609C],eax;gvar_0081609C
 005D425B    mov         ecx,esi
 005D425D    mov         edx,5D8404;'SetupDiClassNameFromGuidExW'
 005D4262    mov         eax,dword ptr [ebx]
 005D4264    call        005D2554
 005D4269    mov         [008160A0],eax;gvar_008160A0
 005D426E    mov         ecx,esi
 005D4270    mov         edx,5D8404;'SetupDiClassNameFromGuidExW'
 005D4275    mov         eax,dword ptr [ebx]
 005D4277    call        005D2554
 005D427C    mov         [008160A4],eax;gvar_008160A4
 005D4281    mov         ecx,esi
 005D4283    mov         edx,5D8448;'SetupDiClassGuidsFromNameA'
 005D4288    mov         eax,dword ptr [ebx]
 005D428A    call        005D2554
 005D428F    mov         [008160A8],eax;gvar_008160A8
 005D4294    mov         ecx,esi
 005D4296    mov         edx,5D848C;'SetupDiClassGuidsFromNameW'
 005D429B    mov         eax,dword ptr [ebx]
 005D429D    call        005D2554
 005D42A2    mov         [008160AC],eax;gvar_008160AC
 005D42A7    mov         ecx,esi
 005D42A9    mov         edx,5D848C;'SetupDiClassGuidsFromNameW'
 005D42AE    mov         eax,dword ptr [ebx]
 005D42B0    call        005D2554
 005D42B5    mov         [008160B0],eax;gvar_008160B0
 005D42BA    mov         ecx,esi
 005D42BC    mov         edx,5D84D0;'SetupDiClassGuidsFromNameExA'
 005D42C1    mov         eax,dword ptr [ebx]
 005D42C3    call        005D2554
 005D42C8    mov         [008160B4],eax;gvar_008160B4
 005D42CD    mov         ecx,esi
 005D42CF    mov         edx,5D8518;'SetupDiClassGuidsFromNameExW'
 005D42D4    mov         eax,dword ptr [ebx]
 005D42D6    call        005D2554
 005D42DB    mov         [008160B8],eax;gvar_008160B8
 005D42E0    mov         ecx,esi
 005D42E2    mov         edx,5D8518;'SetupDiClassGuidsFromNameExW'
 005D42E7    mov         eax,dword ptr [ebx]
 005D42E9    call        005D2554
 005D42EE    mov         [008160BC],eax;gvar_008160BC
 005D42F3    mov         ecx,esi
 005D42F5    mov         edx,5D8560;'SetupDiGetHwProfileFriendlyNameA'
 005D42FA    mov         eax,dword ptr [ebx]
 005D42FC    call        005D2554
 005D4301    mov         [008160C0],eax;gvar_008160C0
 005D4306    mov         ecx,esi
 005D4308    mov         edx,5D85B0;'SetupDiGetHwProfileFriendlyNameW'
 005D430D    mov         eax,dword ptr [ebx]
 005D430F    call        005D2554
 005D4314    mov         [008160C4],eax;gvar_008160C4
 005D4319    mov         ecx,esi
 005D431B    mov         edx,5D85B0;'SetupDiGetHwProfileFriendlyNameW'
 005D4320    mov         eax,dword ptr [ebx]
 005D4322    call        005D2554
 005D4327    mov         [008160C8],eax;gvar_008160C8
 005D432C    mov         ecx,esi
 005D432E    mov         edx,5D8600;'SetupDiGetHwProfileFriendlyNameExA'
 005D4333    mov         eax,dword ptr [ebx]
 005D4335    call        005D2554
 005D433A    mov         [008160CC],eax;gvar_008160CC
 005D433F    mov         ecx,esi
 005D4341    mov         edx,5D8654;'SetupDiGetHwProfileFriendlyNameExW'
 005D4346    mov         eax,dword ptr [ebx]
 005D4348    call        005D2554
 005D434D    mov         [008160D0],eax;gvar_008160D0
 005D4352    mov         ecx,esi
 005D4354    mov         edx,5D8654;'SetupDiGetHwProfileFriendlyNameExW'
 005D4359    mov         eax,dword ptr [ebx]
 005D435B    call        005D2554
 005D4360    mov         [008160D4],eax;gvar_008160D4
 005D4365    mov         ecx,esi
 005D4367    mov         edx,5D86A8;'SetupDiGetWizardPage'
 005D436C    mov         eax,dword ptr [ebx]
 005D436E    call        005D2554
 005D4373    mov         [008160D8],eax;gvar_008160D8
 005D4378    mov         ecx,esi
 005D437A    mov         edx,5D86E0;'SetupDiGetSelectedDevice'
 005D437F    mov         eax,dword ptr [ebx]
 005D4381    call        005D2554
 005D4386    mov         [008160DC],eax;gvar_008160DC
 005D438B    mov         ecx,esi
 005D438D    mov         edx,5D8720;'SetupDiSetSelectedDevice'
 005D4392    mov         eax,dword ptr [ebx]
 005D4394    call        005D2554
 005D4399    mov         [008160E0],eax;gvar_008160E0
 005D439E    mov         ecx,esi
 005D43A0    mov         edx,5D8760;'SetupDiGetActualSectionToInstallA'
 005D43A5    mov         eax,dword ptr [ebx]
 005D43A7    call        005D2554
 005D43AC    mov         [008160E4],eax;gvar_008160E4
 005D43B1    mov         ecx,esi
 005D43B3    mov         edx,5D87B0;'SetupDiGetActualSectionToInstallW'
 005D43B8    mov         eax,dword ptr [ebx]
 005D43BA    call        005D2554
 005D43BF    mov         [008160E8],eax;gvar_008160E8
 005D43C4    mov         ecx,esi
 005D43C6    mov         edx,5D87B0;'SetupDiGetActualSectionToInstallW'
 005D43CB    mov         eax,dword ptr [ebx]
 005D43CD    call        005D2554
 005D43D2    mov         [008160EC],eax;gvar_008160EC
 005D43D7    cmp         byte ptr [esi],0
>005D43DA    jne         005D43E1
 005D43DC    call        005D87F4
 005D43E1    movzx       eax,byte ptr [esi]
 005D43E4    pop         edx
 005D43E5    pop         esi
 005D43E6    pop         ebx
 005D43E7    ret
end;*}

//005D87F4
procedure sub_005D87F4;
begin
{*
 005D87F4    dec         dword ptr ds:[78A040];gvar_0078A040
 005D87FA    cmp         dword ptr ds:[78A040],0;gvar_0078A040
>005D8801    jg          005D92E5
 005D8807    mov         eax,78A03C
 005D880C    call        005D253C
 005D8811    xor         eax,eax
 005D8813    mov         [00815AC0],eax;gvar_00815AC0
 005D8818    xor         eax,eax
 005D881A    mov         [00815AC4],eax;gvar_00815AC4
 005D881F    xor         eax,eax
 005D8821    mov         [00815AC8],eax;gvar_00815AC8
 005D8826    xor         eax,eax
 005D8828    mov         [00815ACC],eax;gvar_00815ACC
 005D882D    xor         eax,eax
 005D882F    mov         [00815AD0],eax;gvar_00815AD0
 005D8834    xor         eax,eax
 005D8836    mov         [00815AD4],eax;gvar_00815AD4
 005D883B    xor         eax,eax
 005D883D    mov         [00815AD8],eax;gvar_00815AD8
 005D8842    xor         eax,eax
 005D8844    mov         [00815ADC],eax;gvar_00815ADC
 005D8849    xor         eax,eax
 005D884B    mov         [00815AE0],eax;gvar_00815AE0
 005D8850    xor         eax,eax
 005D8852    mov         [00815AE4],eax;gvar_00815AE4
 005D8857    xor         eax,eax
 005D8859    mov         [00815AE8],eax;gvar_00815AE8
 005D885E    xor         eax,eax
 005D8860    mov         [00815AEC],eax;gvar_00815AEC
 005D8865    xor         eax,eax
 005D8867    mov         [00815AF0],eax;gvar_00815AF0
 005D886C    xor         eax,eax
 005D886E    mov         [00815AF4],eax;gvar_00815AF4
 005D8873    xor         eax,eax
 005D8875    mov         [00815AF8],eax;gvar_00815AF8
 005D887A    xor         eax,eax
 005D887C    mov         [00815AFC],eax;gvar_00815AFC
 005D8881    xor         eax,eax
 005D8883    mov         [00815B00],eax;gvar_00815B00
 005D8888    xor         eax,eax
 005D888A    mov         [00815B04],eax;gvar_00815B04
 005D888F    xor         eax,eax
 005D8891    mov         [00815B08],eax;gvar_00815B08
 005D8896    xor         eax,eax
 005D8898    mov         [00815B0C],eax;gvar_00815B0C
 005D889D    xor         eax,eax
 005D889F    mov         [00815B10],eax;gvar_00815B10
 005D88A4    xor         eax,eax
 005D88A6    mov         [00815B14],eax;gvar_00815B14
 005D88AB    xor         eax,eax
 005D88AD    mov         [00815B18],eax;gvar_00815B18
 005D88B2    xor         eax,eax
 005D88B4    mov         [00815B1C],eax;gvar_00815B1C
 005D88B9    xor         eax,eax
 005D88BB    mov         [00815B20],eax;gvar_00815B20
 005D88C0    xor         eax,eax
 005D88C2    mov         [00815B24],eax;gvar_00815B24
 005D88C7    xor         eax,eax
 005D88C9    mov         [00815B28],eax;gvar_00815B28
 005D88CE    xor         eax,eax
 005D88D0    mov         [00815B2C],eax;gvar_00815B2C
 005D88D5    xor         eax,eax
 005D88D7    mov         [00815B30],eax;gvar_00815B30
 005D88DC    xor         eax,eax
 005D88DE    mov         [00815B34],eax;gvar_00815B34
 005D88E3    xor         eax,eax
 005D88E5    mov         [00815B38],eax;gvar_00815B38
 005D88EA    xor         eax,eax
 005D88EC    mov         [00815B3C],eax;gvar_00815B3C
 005D88F1    xor         eax,eax
 005D88F3    mov         [00815B40],eax;gvar_00815B40
 005D88F8    xor         eax,eax
 005D88FA    mov         [00815B44],eax;gvar_00815B44
 005D88FF    xor         eax,eax
 005D8901    mov         [00815B48],eax;gvar_00815B48
 005D8906    xor         eax,eax
 005D8908    mov         [00815B4C],eax;gvar_00815B4C
 005D890D    xor         eax,eax
 005D890F    mov         [00815B50],eax;gvar_00815B50
 005D8914    xor         eax,eax
 005D8916    mov         [00815B54],eax;gvar_00815B54
 005D891B    xor         eax,eax
 005D891D    mov         [00815B58],eax;gvar_00815B58
 005D8922    xor         eax,eax
 005D8924    mov         [00815B5C],eax;gvar_00815B5C
 005D8929    xor         eax,eax
 005D892B    mov         [00815B60],eax;gvar_00815B60
 005D8930    xor         eax,eax
 005D8932    mov         [00815B64],eax;gvar_00815B64
 005D8937    xor         eax,eax
 005D8939    mov         [00815B68],eax;gvar_00815B68
 005D893E    xor         eax,eax
 005D8940    mov         [00815B6C],eax;gvar_00815B6C
 005D8945    xor         eax,eax
 005D8947    mov         [00815B70],eax;gvar_00815B70
 005D894C    xor         eax,eax
 005D894E    mov         [00815B74],eax;gvar_00815B74
 005D8953    xor         eax,eax
 005D8955    mov         [00815B78],eax;gvar_00815B78
 005D895A    xor         eax,eax
 005D895C    mov         [00815B7C],eax;gvar_00815B7C
 005D8961    xor         eax,eax
 005D8963    mov         [00815B80],eax;gvar_00815B80
 005D8968    xor         eax,eax
 005D896A    mov         [00815B84],eax;gvar_00815B84
 005D896F    xor         eax,eax
 005D8971    mov         [00815B88],eax;gvar_00815B88
 005D8976    xor         eax,eax
 005D8978    mov         [00815B8C],eax;gvar_00815B8C
 005D897D    xor         eax,eax
 005D897F    mov         [00815B90],eax;gvar_00815B90
 005D8984    xor         eax,eax
 005D8986    mov         [00815B94],eax;gvar_00815B94
 005D898B    xor         eax,eax
 005D898D    mov         [00815B98],eax;gvar_00815B98
 005D8992    xor         eax,eax
 005D8994    mov         [00815B9C],eax;gvar_00815B9C
 005D8999    xor         eax,eax
 005D899B    mov         [00815BA0],eax;gvar_00815BA0
 005D89A0    xor         eax,eax
 005D89A2    mov         [00815BA4],eax;gvar_00815BA4
 005D89A7    xor         eax,eax
 005D89A9    mov         [00815BA8],eax;gvar_00815BA8
 005D89AE    xor         eax,eax
 005D89B0    mov         [00815BAC],eax;gvar_00815BAC
 005D89B5    xor         eax,eax
 005D89B7    mov         [00815BB0],eax;gvar_00815BB0
 005D89BC    xor         eax,eax
 005D89BE    mov         [00815BB4],eax;gvar_00815BB4
 005D89C3    xor         eax,eax
 005D89C5    mov         [00815BB8],eax;gvar_00815BB8
 005D89CA    xor         eax,eax
 005D89CC    mov         [00815BBC],eax;gvar_00815BBC
 005D89D1    xor         eax,eax
 005D89D3    mov         [00815BC0],eax;gvar_00815BC0
 005D89D8    xor         eax,eax
 005D89DA    mov         [00815BC4],eax;gvar_00815BC4
 005D89DF    xor         eax,eax
 005D89E1    mov         [00815BC8],eax;gvar_00815BC8
 005D89E6    xor         eax,eax
 005D89E8    mov         [00815BCC],eax;gvar_00815BCC
 005D89ED    xor         eax,eax
 005D89EF    mov         [00815BD0],eax;gvar_00815BD0
 005D89F4    xor         eax,eax
 005D89F6    mov         [00815BD4],eax;gvar_00815BD4
 005D89FB    xor         eax,eax
 005D89FD    mov         [00815BD8],eax;gvar_00815BD8
 005D8A02    xor         eax,eax
 005D8A04    mov         [00815BDC],eax;gvar_00815BDC
 005D8A09    xor         eax,eax
 005D8A0B    mov         [00815BE0],eax;gvar_00815BE0
 005D8A10    xor         eax,eax
 005D8A12    mov         [00815BE4],eax;gvar_00815BE4
 005D8A17    xor         eax,eax
 005D8A19    mov         [00815BE8],eax;gvar_00815BE8
 005D8A1E    xor         eax,eax
 005D8A20    mov         [00815BEC],eax;gvar_00815BEC
 005D8A25    xor         eax,eax
 005D8A27    mov         [00815BF0],eax;gvar_00815BF0
 005D8A2C    xor         eax,eax
 005D8A2E    mov         [00815BF4],eax;gvar_00815BF4
 005D8A33    xor         eax,eax
 005D8A35    mov         [00815BF8],eax;gvar_00815BF8
 005D8A3A    xor         eax,eax
 005D8A3C    mov         [00815BFC],eax;gvar_00815BFC
 005D8A41    xor         eax,eax
 005D8A43    mov         [00815C00],eax;gvar_00815C00
 005D8A48    xor         eax,eax
 005D8A4A    mov         [00815C04],eax;gvar_00815C04
 005D8A4F    xor         eax,eax
 005D8A51    mov         [00815C08],eax;gvar_00815C08
 005D8A56    xor         eax,eax
 005D8A58    mov         [00815C0C],eax;gvar_00815C0C
 005D8A5D    xor         eax,eax
 005D8A5F    mov         [00815C10],eax;gvar_00815C10
 005D8A64    xor         eax,eax
 005D8A66    mov         [00815C14],eax;gvar_00815C14
 005D8A6B    xor         eax,eax
 005D8A6D    mov         [00815C18],eax;gvar_00815C18
 005D8A72    xor         eax,eax
 005D8A74    mov         [00815C1C],eax;gvar_00815C1C
 005D8A79    xor         eax,eax
 005D8A7B    mov         [00815C20],eax;gvar_00815C20
 005D8A80    xor         eax,eax
 005D8A82    mov         [00815C24],eax;gvar_00815C24
 005D8A87    xor         eax,eax
 005D8A89    mov         [00815C28],eax;gvar_00815C28
 005D8A8E    xor         eax,eax
 005D8A90    mov         [00815C2C],eax;gvar_00815C2C
 005D8A95    xor         eax,eax
 005D8A97    mov         [00815C30],eax;gvar_00815C30
 005D8A9C    xor         eax,eax
 005D8A9E    mov         [00815C34],eax;gvar_00815C34
 005D8AA3    xor         eax,eax
 005D8AA5    mov         [00815C38],eax;gvar_00815C38
 005D8AAA    xor         eax,eax
 005D8AAC    mov         [00815C3C],eax;gvar_00815C3C
 005D8AB1    xor         eax,eax
 005D8AB3    mov         [00815C40],eax;gvar_00815C40
 005D8AB8    xor         eax,eax
 005D8ABA    mov         [00815C44],eax;gvar_00815C44
 005D8ABF    xor         eax,eax
 005D8AC1    mov         [00815C48],eax;gvar_00815C48
 005D8AC6    xor         eax,eax
 005D8AC8    mov         [00815C4C],eax;gvar_00815C4C
 005D8ACD    xor         eax,eax
 005D8ACF    mov         [00815C50],eax;gvar_00815C50
 005D8AD4    xor         eax,eax
 005D8AD6    mov         [00815C54],eax;gvar_00815C54
 005D8ADB    xor         eax,eax
 005D8ADD    mov         [00815C58],eax;gvar_00815C58
 005D8AE2    xor         eax,eax
 005D8AE4    mov         [00815C5C],eax;gvar_00815C5C
 005D8AE9    xor         eax,eax
 005D8AEB    mov         [00815C60],eax;gvar_00815C60
 005D8AF0    xor         eax,eax
 005D8AF2    mov         [00815C64],eax;gvar_00815C64
 005D8AF7    xor         eax,eax
 005D8AF9    mov         [00815C68],eax;gvar_00815C68
 005D8AFE    xor         eax,eax
 005D8B00    mov         [00815C6C],eax;gvar_00815C6C
 005D8B05    xor         eax,eax
 005D8B07    mov         [00815C70],eax;gvar_00815C70
 005D8B0C    xor         eax,eax
 005D8B0E    mov         [00815C74],eax;gvar_00815C74
 005D8B13    xor         eax,eax
 005D8B15    mov         [00815C78],eax;gvar_00815C78
 005D8B1A    xor         eax,eax
 005D8B1C    mov         [00815C7C],eax;gvar_00815C7C
 005D8B21    xor         eax,eax
 005D8B23    mov         [00815C80],eax;gvar_00815C80
 005D8B28    xor         eax,eax
 005D8B2A    mov         [00815C84],eax;gvar_00815C84
 005D8B2F    xor         eax,eax
 005D8B31    mov         [00815C88],eax;gvar_00815C88
 005D8B36    xor         eax,eax
 005D8B38    mov         [00815C8C],eax;gvar_00815C8C
 005D8B3D    xor         eax,eax
 005D8B3F    mov         [00815C90],eax;gvar_00815C90
 005D8B44    xor         eax,eax
 005D8B46    mov         [00815C94],eax;gvar_00815C94
 005D8B4B    xor         eax,eax
 005D8B4D    mov         [00815C98],eax;gvar_00815C98
 005D8B52    xor         eax,eax
 005D8B54    mov         [00815C9C],eax;gvar_00815C9C
 005D8B59    xor         eax,eax
 005D8B5B    mov         [00815CA0],eax;gvar_00815CA0
 005D8B60    xor         eax,eax
 005D8B62    mov         [00815CA4],eax;gvar_00815CA4
 005D8B67    xor         eax,eax
 005D8B69    mov         [00815CA8],eax;gvar_00815CA8
 005D8B6E    xor         eax,eax
 005D8B70    mov         [00815CAC],eax;gvar_00815CAC
 005D8B75    xor         eax,eax
 005D8B77    mov         [00815CB0],eax;gvar_00815CB0
 005D8B7C    xor         eax,eax
 005D8B7E    mov         [00815CB4],eax;gvar_00815CB4
 005D8B83    xor         eax,eax
 005D8B85    mov         [00815CB8],eax;gvar_00815CB8
 005D8B8A    xor         eax,eax
 005D8B8C    mov         [00815CBC],eax;gvar_00815CBC
 005D8B91    xor         eax,eax
 005D8B93    mov         [00815CC0],eax;gvar_00815CC0
 005D8B98    xor         eax,eax
 005D8B9A    mov         [00815CC4],eax;gvar_00815CC4
 005D8B9F    xor         eax,eax
 005D8BA1    mov         [00815CC8],eax;gvar_00815CC8
 005D8BA6    xor         eax,eax
 005D8BA8    mov         [00815CCC],eax;gvar_00815CCC
 005D8BAD    xor         eax,eax
 005D8BAF    mov         [00815CD0],eax;gvar_00815CD0
 005D8BB4    xor         eax,eax
 005D8BB6    mov         [00815CD4],eax;gvar_00815CD4
 005D8BBB    xor         eax,eax
 005D8BBD    mov         [00815CD8],eax;gvar_00815CD8
 005D8BC2    xor         eax,eax
 005D8BC4    mov         [00815CDC],eax;gvar_00815CDC
 005D8BC9    xor         eax,eax
 005D8BCB    mov         [00815CE0],eax;gvar_00815CE0
 005D8BD0    xor         eax,eax
 005D8BD2    mov         [00815CE4],eax;gvar_00815CE4
 005D8BD7    xor         eax,eax
 005D8BD9    mov         [00815CE8],eax;gvar_00815CE8
 005D8BDE    xor         eax,eax
 005D8BE0    mov         [00815CEC],eax;gvar_00815CEC
 005D8BE5    xor         eax,eax
 005D8BE7    mov         [00815CF0],eax;gvar_00815CF0
 005D8BEC    xor         eax,eax
 005D8BEE    mov         [00815CF4],eax;gvar_00815CF4
 005D8BF3    xor         eax,eax
 005D8BF5    mov         [00815CF8],eax;gvar_00815CF8
 005D8BFA    xor         eax,eax
 005D8BFC    mov         [00815CFC],eax;gvar_00815CFC
 005D8C01    xor         eax,eax
 005D8C03    mov         [00815D00],eax;gvar_00815D00
 005D8C08    xor         eax,eax
 005D8C0A    mov         [00815D04],eax;gvar_00815D04
 005D8C0F    xor         eax,eax
 005D8C11    mov         [00815D08],eax;gvar_00815D08
 005D8C16    xor         eax,eax
 005D8C18    mov         [00815D0C],eax;gvar_00815D0C
 005D8C1D    xor         eax,eax
 005D8C1F    mov         [00815D10],eax;gvar_00815D10
 005D8C24    xor         eax,eax
 005D8C26    mov         [00815D14],eax;gvar_00815D14
 005D8C2B    xor         eax,eax
 005D8C2D    mov         [00815D18],eax;gvar_00815D18
 005D8C32    xor         eax,eax
 005D8C34    mov         [00815D1C],eax;gvar_00815D1C
 005D8C39    xor         eax,eax
 005D8C3B    mov         [00815D20],eax;gvar_00815D20
 005D8C40    xor         eax,eax
 005D8C42    mov         [00815D24],eax;gvar_00815D24
 005D8C47    xor         eax,eax
 005D8C49    mov         [00815D28],eax;gvar_00815D28
 005D8C4E    xor         eax,eax
 005D8C50    mov         [00815D2C],eax;gvar_00815D2C
 005D8C55    xor         eax,eax
 005D8C57    mov         [00815D30],eax;gvar_00815D30
 005D8C5C    xor         eax,eax
 005D8C5E    mov         [00815D34],eax;gvar_00815D34
 005D8C63    xor         eax,eax
 005D8C65    mov         [00815D38],eax;gvar_00815D38
 005D8C6A    xor         eax,eax
 005D8C6C    mov         [00815D3C],eax;gvar_00815D3C
 005D8C71    xor         eax,eax
 005D8C73    mov         [00815D40],eax;gvar_00815D40
 005D8C78    xor         eax,eax
 005D8C7A    mov         [00815D44],eax;gvar_00815D44
 005D8C7F    xor         eax,eax
 005D8C81    mov         [00815D48],eax;gvar_00815D48
 005D8C86    xor         eax,eax
 005D8C88    mov         [00815D4C],eax;gvar_00815D4C
 005D8C8D    xor         eax,eax
 005D8C8F    mov         [00815D50],eax;gvar_00815D50
 005D8C94    xor         eax,eax
 005D8C96    mov         [00815D54],eax;gvar_00815D54
 005D8C9B    xor         eax,eax
 005D8C9D    mov         [00815D58],eax;gvar_00815D58
 005D8CA2    xor         eax,eax
 005D8CA4    mov         [00815D5C],eax;gvar_00815D5C
 005D8CA9    xor         eax,eax
 005D8CAB    mov         [00815D60],eax;gvar_00815D60
 005D8CB0    xor         eax,eax
 005D8CB2    mov         [00815D64],eax;gvar_00815D64
 005D8CB7    xor         eax,eax
 005D8CB9    mov         [00815D68],eax;gvar_00815D68
 005D8CBE    xor         eax,eax
 005D8CC0    mov         [00815D6C],eax;gvar_00815D6C
 005D8CC5    xor         eax,eax
 005D8CC7    mov         [00815D70],eax;gvar_00815D70
 005D8CCC    xor         eax,eax
 005D8CCE    mov         [00815D74],eax;gvar_00815D74
 005D8CD3    xor         eax,eax
 005D8CD5    mov         [00815D78],eax;gvar_00815D78
 005D8CDA    xor         eax,eax
 005D8CDC    mov         [00815D7C],eax;gvar_00815D7C
 005D8CE1    xor         eax,eax
 005D8CE3    mov         [00815D80],eax;gvar_00815D80
 005D8CE8    xor         eax,eax
 005D8CEA    mov         [00815D84],eax;gvar_00815D84
 005D8CEF    xor         eax,eax
 005D8CF1    mov         [00815D88],eax;gvar_00815D88
 005D8CF6    xor         eax,eax
 005D8CF8    mov         [00815D8C],eax;gvar_00815D8C
 005D8CFD    xor         eax,eax
 005D8CFF    mov         [00815D90],eax;gvar_00815D90
 005D8D04    xor         eax,eax
 005D8D06    mov         [00815D94],eax;gvar_00815D94
 005D8D0B    xor         eax,eax
 005D8D0D    mov         [00815D98],eax;gvar_00815D98
 005D8D12    xor         eax,eax
 005D8D14    mov         [00815D9C],eax;gvar_00815D9C
 005D8D19    xor         eax,eax
 005D8D1B    mov         [00815DA0],eax;gvar_00815DA0
 005D8D20    xor         eax,eax
 005D8D22    mov         [00815DA4],eax;gvar_00815DA4
 005D8D27    xor         eax,eax
 005D8D29    mov         [00815DA8],eax;gvar_00815DA8
 005D8D2E    xor         eax,eax
 005D8D30    mov         [00815DAC],eax;gvar_00815DAC
 005D8D35    xor         eax,eax
 005D8D37    mov         [00815DB0],eax;gvar_00815DB0
 005D8D3C    xor         eax,eax
 005D8D3E    mov         [00815DB4],eax;gvar_00815DB4
 005D8D43    xor         eax,eax
 005D8D45    mov         [00815DB8],eax;gvar_00815DB8
 005D8D4A    xor         eax,eax
 005D8D4C    mov         [00815DBC],eax;gvar_00815DBC
 005D8D51    xor         eax,eax
 005D8D53    mov         [00815DC0],eax;gvar_00815DC0
 005D8D58    xor         eax,eax
 005D8D5A    mov         [00815DC4],eax;gvar_00815DC4
 005D8D5F    xor         eax,eax
 005D8D61    mov         [00815DC8],eax;gvar_00815DC8
 005D8D66    xor         eax,eax
 005D8D68    mov         [00815DCC],eax;gvar_00815DCC
 005D8D6D    xor         eax,eax
 005D8D6F    mov         [00815DD0],eax;gvar_00815DD0
 005D8D74    xor         eax,eax
 005D8D76    mov         [00815DD4],eax;gvar_00815DD4
 005D8D7B    xor         eax,eax
 005D8D7D    mov         [00815DD8],eax;gvar_00815DD8
 005D8D82    xor         eax,eax
 005D8D84    mov         [00815DDC],eax;gvar_00815DDC
 005D8D89    xor         eax,eax
 005D8D8B    mov         [00815DE0],eax;gvar_00815DE0
 005D8D90    xor         eax,eax
 005D8D92    mov         [00815DE4],eax;gvar_00815DE4
 005D8D97    xor         eax,eax
 005D8D99    mov         [00815DE8],eax;gvar_00815DE8
 005D8D9E    xor         eax,eax
 005D8DA0    mov         [00815DEC],eax;gvar_00815DEC
 005D8DA5    xor         eax,eax
 005D8DA7    mov         [00815DF0],eax;gvar_00815DF0
 005D8DAC    xor         eax,eax
 005D8DAE    mov         [00815DF4],eax;gvar_00815DF4
 005D8DB3    xor         eax,eax
 005D8DB5    mov         [00815DF8],eax;gvar_00815DF8
 005D8DBA    xor         eax,eax
 005D8DBC    mov         [00815DFC],eax;gvar_00815DFC
 005D8DC1    xor         eax,eax
 005D8DC3    mov         [00815E00],eax;gvar_00815E00
 005D8DC8    xor         eax,eax
 005D8DCA    mov         [00815E04],eax;gvar_00815E04
 005D8DCF    xor         eax,eax
 005D8DD1    mov         [00815E08],eax;gvar_00815E08
 005D8DD6    xor         eax,eax
 005D8DD8    mov         [00815E0C],eax;gvar_00815E0C
 005D8DDD    xor         eax,eax
 005D8DDF    mov         [00815E10],eax;gvar_00815E10
 005D8DE4    xor         eax,eax
 005D8DE6    mov         [00815E14],eax;gvar_00815E14
 005D8DEB    xor         eax,eax
 005D8DED    mov         [00815E18],eax;gvar_00815E18
 005D8DF2    xor         eax,eax
 005D8DF4    mov         [00815E1C],eax;gvar_00815E1C
 005D8DF9    xor         eax,eax
 005D8DFB    mov         [00815E20],eax;gvar_00815E20
 005D8E00    xor         eax,eax
 005D8E02    mov         [00815E24],eax;gvar_00815E24
 005D8E07    xor         eax,eax
 005D8E09    mov         [00815E28],eax;gvar_00815E28
 005D8E0E    xor         eax,eax
 005D8E10    mov         [00815E2C],eax;gvar_00815E2C
 005D8E15    xor         eax,eax
 005D8E17    mov         [00815E30],eax;gvar_00815E30
 005D8E1C    xor         eax,eax
 005D8E1E    mov         [00815E34],eax;gvar_00815E34
 005D8E23    xor         eax,eax
 005D8E25    mov         [00815E38],eax;gvar_00815E38
 005D8E2A    xor         eax,eax
 005D8E2C    mov         [00815E3C],eax;gvar_00815E3C
 005D8E31    xor         eax,eax
 005D8E33    mov         [00815E40],eax;gvar_00815E40
 005D8E38    xor         eax,eax
 005D8E3A    mov         [00815E44],eax;gvar_00815E44
 005D8E3F    xor         eax,eax
 005D8E41    mov         [00815E48],eax;gvar_00815E48
 005D8E46    xor         eax,eax
 005D8E48    mov         [00815E4C],eax;gvar_00815E4C
 005D8E4D    xor         eax,eax
 005D8E4F    mov         [00815E50],eax;gvar_00815E50
 005D8E54    xor         eax,eax
 005D8E56    mov         [00815E54],eax;gvar_00815E54
 005D8E5B    xor         eax,eax
 005D8E5D    mov         [00815E58],eax;gvar_00815E58
 005D8E62    xor         eax,eax
 005D8E64    mov         [00815E5C],eax;gvar_00815E5C
 005D8E69    xor         eax,eax
 005D8E6B    mov         [00815E60],eax;gvar_00815E60
 005D8E70    xor         eax,eax
 005D8E72    mov         [00815E64],eax;gvar_00815E64
 005D8E77    xor         eax,eax
 005D8E79    mov         [00815E68],eax;gvar_00815E68
 005D8E7E    xor         eax,eax
 005D8E80    mov         [00815E6C],eax;gvar_00815E6C
 005D8E85    xor         eax,eax
 005D8E87    mov         [00815E70],eax;gvar_00815E70
 005D8E8C    xor         eax,eax
 005D8E8E    mov         [00815E74],eax;gvar_00815E74
 005D8E93    xor         eax,eax
 005D8E95    mov         [00815E78],eax;gvar_00815E78
 005D8E9A    xor         eax,eax
 005D8E9C    mov         [00815E7C],eax;gvar_00815E7C
 005D8EA1    xor         eax,eax
 005D8EA3    mov         [00815E80],eax;gvar_00815E80
 005D8EA8    xor         eax,eax
 005D8EAA    mov         [00815E84],eax;gvar_00815E84
 005D8EAF    xor         eax,eax
 005D8EB1    mov         [00815E88],eax;gvar_00815E88
 005D8EB6    xor         eax,eax
 005D8EB8    mov         [00815E8C],eax;gvar_00815E8C
 005D8EBD    xor         eax,eax
 005D8EBF    mov         [00815E90],eax;gvar_00815E90
 005D8EC4    xor         eax,eax
 005D8EC6    mov         [00815E94],eax;gvar_00815E94
 005D8ECB    xor         eax,eax
 005D8ECD    mov         [00815E98],eax;gvar_00815E98
 005D8ED2    xor         eax,eax
 005D8ED4    mov         [00815E9C],eax;gvar_00815E9C
 005D8ED9    xor         eax,eax
 005D8EDB    mov         [00815EA0],eax;gvar_00815EA0
 005D8EE0    xor         eax,eax
 005D8EE2    mov         [00815EA4],eax;gvar_00815EA4
 005D8EE7    xor         eax,eax
 005D8EE9    mov         [00815EA8],eax;gvar_00815EA8
 005D8EEE    xor         eax,eax
 005D8EF0    mov         [00815EAC],eax;gvar_00815EAC
 005D8EF5    xor         eax,eax
 005D8EF7    mov         [00815EB0],eax;gvar_00815EB0
 005D8EFC    xor         eax,eax
 005D8EFE    mov         [00815EB4],eax;gvar_00815EB4
 005D8F03    xor         eax,eax
 005D8F05    mov         [00815EB8],eax;gvar_00815EB8
 005D8F0A    xor         eax,eax
 005D8F0C    mov         [00815EBC],eax;gvar_00815EBC
 005D8F11    xor         eax,eax
 005D8F13    mov         [00815EC0],eax;gvar_00815EC0
 005D8F18    xor         eax,eax
 005D8F1A    mov         [00815EC4],eax;gvar_00815EC4
 005D8F1F    xor         eax,eax
 005D8F21    mov         [00815EC8],eax;gvar_00815EC8
 005D8F26    xor         eax,eax
 005D8F28    mov         [00815ECC],eax;gvar_00815ECC
 005D8F2D    xor         eax,eax
 005D8F2F    mov         [00815ED0],eax;gvar_00815ED0
 005D8F34    xor         eax,eax
 005D8F36    mov         [00815ED4],eax;gvar_00815ED4
 005D8F3B    xor         eax,eax
 005D8F3D    mov         [00815ED8],eax;gvar_00815ED8
 005D8F42    xor         eax,eax
 005D8F44    mov         [00815EDC],eax;gvar_00815EDC
 005D8F49    xor         eax,eax
 005D8F4B    mov         [00815EE0],eax;gvar_00815EE0
 005D8F50    xor         eax,eax
 005D8F52    mov         [00815EE4],eax;gvar_00815EE4
 005D8F57    xor         eax,eax
 005D8F59    mov         [00815EE8],eax;gvar_00815EE8
 005D8F5E    xor         eax,eax
 005D8F60    mov         [00815EEC],eax;gvar_00815EEC
 005D8F65    xor         eax,eax
 005D8F67    mov         [00815EF0],eax;gvar_00815EF0
 005D8F6C    xor         eax,eax
 005D8F6E    mov         [00815EF4],eax;gvar_00815EF4
 005D8F73    xor         eax,eax
 005D8F75    mov         [00815EF8],eax;gvar_00815EF8
 005D8F7A    xor         eax,eax
 005D8F7C    mov         [00815EFC],eax;gvar_00815EFC
 005D8F81    xor         eax,eax
 005D8F83    mov         [00815F00],eax;gvar_00815F00
 005D8F88    xor         eax,eax
 005D8F8A    mov         [00815F04],eax;gvar_00815F04
 005D8F8F    xor         eax,eax
 005D8F91    mov         [00815F08],eax;gvar_00815F08
 005D8F96    xor         eax,eax
 005D8F98    mov         [00815F0C],eax;gvar_00815F0C
 005D8F9D    xor         eax,eax
 005D8F9F    mov         [00815F10],eax;gvar_00815F10
 005D8FA4    xor         eax,eax
 005D8FA6    mov         [00815F14],eax;gvar_00815F14
 005D8FAB    xor         eax,eax
 005D8FAD    mov         [00815F18],eax;gvar_00815F18
 005D8FB2    xor         eax,eax
 005D8FB4    mov         [00815F1C],eax;gvar_00815F1C
 005D8FB9    xor         eax,eax
 005D8FBB    mov         [00815F20],eax;gvar_00815F20
 005D8FC0    xor         eax,eax
 005D8FC2    mov         [00815F24],eax;gvar_00815F24
 005D8FC7    xor         eax,eax
 005D8FC9    mov         [00815F28],eax;gvar_00815F28
 005D8FCE    xor         eax,eax
 005D8FD0    mov         [00815F2C],eax;gvar_00815F2C
 005D8FD5    xor         eax,eax
 005D8FD7    mov         [00815F30],eax;gvar_00815F30
 005D8FDC    xor         eax,eax
 005D8FDE    mov         [00815F34],eax;gvar_00815F34
 005D8FE3    xor         eax,eax
 005D8FE5    mov         [00815F38],eax;gvar_00815F38
 005D8FEA    xor         eax,eax
 005D8FEC    mov         [00815F3C],eax;gvar_00815F3C
 005D8FF1    xor         eax,eax
 005D8FF3    mov         [00815F40],eax;gvar_00815F40
 005D8FF8    xor         eax,eax
 005D8FFA    mov         [00815F44],eax;gvar_00815F44
 005D8FFF    xor         eax,eax
 005D9001    mov         [00815F48],eax;gvar_00815F48
 005D9006    xor         eax,eax
 005D9008    mov         [00815F4C],eax;gvar_00815F4C
 005D900D    xor         eax,eax
 005D900F    mov         [00815F50],eax;gvar_00815F50
 005D9014    xor         eax,eax
 005D9016    mov         [00815F54],eax;gvar_00815F54
 005D901B    xor         eax,eax
 005D901D    mov         [00815F58],eax;gvar_00815F58
 005D9022    xor         eax,eax
 005D9024    mov         [00815F5C],eax;gvar_00815F5C
 005D9029    xor         eax,eax
 005D902B    mov         [00815F60],eax;gvar_00815F60
 005D9030    xor         eax,eax
 005D9032    mov         [00815F64],eax;gvar_00815F64
 005D9037    xor         eax,eax
 005D9039    mov         [00815F68],eax;gvar_00815F68
 005D903E    xor         eax,eax
 005D9040    mov         [00815F6C],eax;gvar_00815F6C
 005D9045    xor         eax,eax
 005D9047    mov         [00815F70],eax;gvar_00815F70
 005D904C    xor         eax,eax
 005D904E    mov         [00815F74],eax;gvar_00815F74
 005D9053    xor         eax,eax
 005D9055    mov         [00815F78],eax;gvar_00815F78
 005D905A    xor         eax,eax
 005D905C    mov         [00815F7C],eax;gvar_00815F7C
 005D9061    xor         eax,eax
 005D9063    mov         [00815F80],eax;gvar_00815F80
 005D9068    xor         eax,eax
 005D906A    mov         [00815F84],eax;gvar_00815F84
 005D906F    xor         eax,eax
 005D9071    mov         [00815F88],eax;gvar_00815F88
 005D9076    xor         eax,eax
 005D9078    mov         [00815F8C],eax;gvar_00815F8C
 005D907D    xor         eax,eax
 005D907F    mov         [00815F90],eax;gvar_00815F90
 005D9084    xor         eax,eax
 005D9086    mov         [00815F94],eax;gvar_00815F94
 005D908B    xor         eax,eax
 005D908D    mov         [00815F98],eax;gvar_00815F98
 005D9092    xor         eax,eax
 005D9094    mov         [00815F9C],eax;gvar_00815F9C
 005D9099    xor         eax,eax
 005D909B    mov         [00815FA0],eax;gvar_00815FA0
 005D90A0    xor         eax,eax
 005D90A2    mov         [00815FA4],eax;gvar_00815FA4
 005D90A7    xor         eax,eax
 005D90A9    mov         [00815FA8],eax;gvar_00815FA8
 005D90AE    xor         eax,eax
 005D90B0    mov         [00815FAC],eax;gvar_00815FAC
 005D90B5    xor         eax,eax
 005D90B7    mov         [00815FB0],eax;gvar_00815FB0
 005D90BC    xor         eax,eax
 005D90BE    mov         [00815FB4],eax;gvar_00815FB4
 005D90C3    xor         eax,eax
 005D90C5    mov         [00815FB8],eax;gvar_00815FB8
 005D90CA    xor         eax,eax
 005D90CC    mov         [00815FBC],eax;gvar_00815FBC
 005D90D1    xor         eax,eax
 005D90D3    mov         [00815FC0],eax;gvar_00815FC0
 005D90D8    xor         eax,eax
 005D90DA    mov         [00815FC4],eax;gvar_00815FC4
 005D90DF    xor         eax,eax
 005D90E1    mov         [00815FC8],eax;gvar_00815FC8
 005D90E6    xor         eax,eax
 005D90E8    mov         [00815FCC],eax;gvar_00815FCC
 005D90ED    xor         eax,eax
 005D90EF    mov         [00815FD0],eax;gvar_00815FD0
 005D90F4    xor         eax,eax
 005D90F6    mov         [00815FD4],eax;gvar_00815FD4
 005D90FB    xor         eax,eax
 005D90FD    mov         [00815FD8],eax;gvar_00815FD8
 005D9102    xor         eax,eax
 005D9104    mov         [00815FDC],eax;gvar_00815FDC
 005D9109    xor         eax,eax
 005D910B    mov         [00815FE0],eax;gvar_00815FE0
 005D9110    xor         eax,eax
 005D9112    mov         [00815FE4],eax;gvar_00815FE4
 005D9117    xor         eax,eax
 005D9119    mov         [00815FE8],eax;gvar_00815FE8
 005D911E    xor         eax,eax
 005D9120    mov         [00815FEC],eax;gvar_00815FEC
 005D9125    xor         eax,eax
 005D9127    mov         [00815FF0],eax;gvar_00815FF0
 005D912C    xor         eax,eax
 005D912E    mov         [00815FF4],eax;gvar_00815FF4
 005D9133    xor         eax,eax
 005D9135    mov         [00815FF8],eax;gvar_00815FF8
 005D913A    xor         eax,eax
 005D913C    mov         [00815FFC],eax;gvar_00815FFC
 005D9141    xor         eax,eax
 005D9143    mov         [00816000],eax;gvar_00816000
 005D9148    xor         eax,eax
 005D914A    mov         [00816004],eax;gvar_00816004
 005D914F    xor         eax,eax
 005D9151    mov         [00816008],eax;gvar_00816008
 005D9156    xor         eax,eax
 005D9158    mov         [0081600C],eax;gvar_0081600C
 005D915D    xor         eax,eax
 005D915F    mov         [00816010],eax;gvar_00816010
 005D9164    xor         eax,eax
 005D9166    mov         [00816014],eax;gvar_00816014
 005D916B    xor         eax,eax
 005D916D    mov         [00816018],eax;gvar_00816018
 005D9172    xor         eax,eax
 005D9174    mov         [0081601C],eax;gvar_0081601C
 005D9179    xor         eax,eax
 005D917B    mov         [00816020],eax;gvar_00816020
 005D9180    xor         eax,eax
 005D9182    mov         [00816024],eax;gvar_00816024
 005D9187    xor         eax,eax
 005D9189    mov         [00816028],eax;gvar_00816028
 005D918E    xor         eax,eax
 005D9190    mov         [0081602C],eax;gvar_0081602C
 005D9195    xor         eax,eax
 005D9197    mov         [00816030],eax;gvar_00816030
 005D919C    xor         eax,eax
 005D919E    mov         [00816034],eax;gvar_00816034
 005D91A3    xor         eax,eax
 005D91A5    mov         [00816038],eax;gvar_00816038
 005D91AA    xor         eax,eax
 005D91AC    mov         [0081603C],eax;gvar_0081603C
 005D91B1    xor         eax,eax
 005D91B3    mov         [00816040],eax;gvar_00816040
 005D91B8    xor         eax,eax
 005D91BA    mov         [00816044],eax;gvar_00816044
 005D91BF    xor         eax,eax
 005D91C1    mov         [00816048],eax;gvar_00816048
 005D91C6    xor         eax,eax
 005D91C8    mov         [0081604C],eax;gvar_0081604C
 005D91CD    xor         eax,eax
 005D91CF    mov         [00816050],eax;gvar_00816050
 005D91D4    xor         eax,eax
 005D91D6    mov         [00816054],eax;gvar_00816054
 005D91DB    xor         eax,eax
 005D91DD    mov         [00816058],eax;gvar_00816058
 005D91E2    xor         eax,eax
 005D91E4    mov         [0081605C],eax;gvar_0081605C
 005D91E9    xor         eax,eax
 005D91EB    mov         [00816060],eax;gvar_00816060
 005D91F0    xor         eax,eax
 005D91F2    mov         [00816064],eax;gvar_00816064
 005D91F7    xor         eax,eax
 005D91F9    mov         [00816068],eax;gvar_00816068
 005D91FE    xor         eax,eax
 005D9200    mov         [0081606C],eax;gvar_0081606C
 005D9205    xor         eax,eax
 005D9207    mov         [00816070],eax;gvar_00816070
 005D920C    xor         eax,eax
 005D920E    mov         [00816074],eax;gvar_00816074
 005D9213    xor         eax,eax
 005D9215    mov         [00816078],eax;gvar_00816078
 005D921A    xor         eax,eax
 005D921C    mov         [0081607C],eax;gvar_0081607C
 005D9221    xor         eax,eax
 005D9223    mov         [00816080],eax;gvar_00816080
 005D9228    xor         eax,eax
 005D922A    mov         [00816084],eax;gvar_00816084
 005D922F    xor         eax,eax
 005D9231    mov         [00816088],eax;gvar_00816088
 005D9236    xor         eax,eax
 005D9238    mov         [0081608C],eax;gvar_0081608C
 005D923D    xor         eax,eax
 005D923F    mov         [00816090],eax;gvar_00816090
 005D9244    xor         eax,eax
 005D9246    mov         [00816094],eax;gvar_00816094
 005D924B    xor         eax,eax
 005D924D    mov         [00816098],eax;gvar_00816098
 005D9252    xor         eax,eax
 005D9254    mov         [0081609C],eax;gvar_0081609C
 005D9259    xor         eax,eax
 005D925B    mov         [008160A0],eax;gvar_008160A0
 005D9260    xor         eax,eax
 005D9262    mov         [008160A4],eax;gvar_008160A4
 005D9267    xor         eax,eax
 005D9269    mov         [008160A8],eax;gvar_008160A8
 005D926E    xor         eax,eax
 005D9270    mov         [008160AC],eax;gvar_008160AC
 005D9275    xor         eax,eax
 005D9277    mov         [008160B0],eax;gvar_008160B0
 005D927C    xor         eax,eax
 005D927E    mov         [008160B4],eax;gvar_008160B4
 005D9283    xor         eax,eax
 005D9285    mov         [008160B8],eax;gvar_008160B8
 005D928A    xor         eax,eax
 005D928C    mov         [008160BC],eax;gvar_008160BC
 005D9291    xor         eax,eax
 005D9293    mov         [008160C0],eax;gvar_008160C0
 005D9298    xor         eax,eax
 005D929A    mov         [008160C4],eax;gvar_008160C4
 005D929F    xor         eax,eax
 005D92A1    mov         [008160C8],eax;gvar_008160C8
 005D92A6    xor         eax,eax
 005D92A8    mov         [008160CC],eax;gvar_008160CC
 005D92AD    xor         eax,eax
 005D92AF    mov         [008160D0],eax;gvar_008160D0
 005D92B4    xor         eax,eax
 005D92B6    mov         [008160D4],eax;gvar_008160D4
 005D92BB    xor         eax,eax
 005D92BD    mov         [008160D8],eax;gvar_008160D8
 005D92C2    xor         eax,eax
 005D92C4    mov         [008160DC],eax;gvar_008160DC
 005D92C9    xor         eax,eax
 005D92CB    mov         [008160E0],eax;gvar_008160E0
 005D92D0    xor         eax,eax
 005D92D2    mov         [008160E4],eax;gvar_008160E4
 005D92D7    xor         eax,eax
 005D92D9    mov         [008160E8],eax;gvar_008160E8
 005D92DE    xor         eax,eax
 005D92E0    mov         [008160EC],eax;gvar_008160EC
 005D92E5    ret
*}
end;

//005D9F40
{*function sub_005D9F40(?:?):?;
begin
 005D9F40    push        ebp
 005D9F41    mov         ebp,esp
 005D9F43    push        ebx
 005D9F44    mov         ebx,dword ptr [ebp+8]
 005D9F47    push        ebx
 005D9F48    push        ecx
 005D9F49    push        edx
 005D9F4A    push        0
 005D9F4C    push        0
 005D9F4E    push        0
 005D9F50    push        eax
 005D9F51    call        dword ptr ds:[816144]
 005D9F57    pop         ebx
 005D9F58    pop         ebp
 005D9F59    ret         4
end;*}

//005D9F5C
{*function sub_005D9F5C(?:?):?;
begin
 005D9F5C    push        ebp
 005D9F5D    mov         ebp,esp
 005D9F5F    push        ebx
 005D9F60    mov         ebx,dword ptr [ebp+8]
 005D9F63    push        ebx
 005D9F64    push        ecx
 005D9F65    push        edx
 005D9F66    push        0
 005D9F68    push        0
 005D9F6A    push        0
 005D9F6C    push        eax
 005D9F6D    call        dword ptr ds:[816148]
 005D9F73    pop         ebx
 005D9F74    pop         ebp
 005D9F75    ret         4
end;*}

//005D9F78
function sub_005D9F78:Boolean;
begin
{*
 005D9F78    cmp         dword ptr ds:[78A044],0;gvar_0078A044
 005D9F7F    setne       al
 005D9F82    ret
*}
end;

//005D9F84
{*function sub_005D9F84:?;
begin
 005D9F84    push        ebx
 005D9F85    push        esi
 005D9F86    push        ecx
 005D9F87    mov         ebx,78A044;gvar_0078A044
 005D9F8C    mov         esi,esp
 005D9F8E    mov         eax,ebx
 005D9F90    mov         edx,5DA360;'HID.dll'
 005D9F95    call        005D24BC
 005D9F9A    mov         byte ptr [esi],al
 005D9F9C    cmp         byte ptr [esi],0
>005D9F9F    je          005DA34B
 005D9FA5    mov         ecx,esi
 005D9FA7    mov         edx,5DA37C;'HidD_Hello'
 005D9FAC    mov         eax,dword ptr [ebx]
 005D9FAE    call        005D2554
 005D9FB3    mov         [008160F0],eax;gvar_008160F0
 005D9FB8    mov         ecx,esi
 005D9FBA    mov         edx,5DA3A0;'HidD_GetHidGuid'
 005D9FBF    mov         eax,dword ptr [ebx]
 005D9FC1    call        005D2554
 005D9FC6    mov         [008160F4],eax;gvar_008160F4
 005D9FCB    mov         ecx,esi
 005D9FCD    mov         edx,5DA3CC;'HidD_GetPreparsedData'
 005D9FD2    mov         eax,dword ptr [ebx]
 005D9FD4    call        005D2554
 005D9FD9    mov         [008160F8],eax;gvar_008160F8
 005D9FDE    mov         ecx,esi
 005D9FE0    mov         edx,5DA404;'HidD_FreePreparsedData'
 005D9FE5    mov         eax,dword ptr [ebx]
 005D9FE7    call        005D2554
 005D9FEC    mov         [008160FC],eax;gvar_008160FC
 005D9FF1    mov         ecx,esi
 005D9FF3    mov         edx,5DA440;'HidD_GetConfiguration'
 005D9FF8    mov         eax,dword ptr [ebx]
 005D9FFA    call        005D2554
 005D9FFF    mov         [00816100],eax;gvar_00816100
 005DA004    mov         ecx,esi
 005DA006    mov         edx,5DA478;'HidD_SetConfiguration'
 005DA00B    mov         eax,dword ptr [ebx]
 005DA00D    call        005D2554
 005DA012    mov         [00816104],eax;gvar_00816104
 005DA017    mov         ecx,esi
 005DA019    mov         edx,5DA4B0;'HidD_FlushQueue'
 005DA01E    mov         eax,dword ptr [ebx]
 005DA020    call        005D2554
 005DA025    mov         [00816108],eax;gvar_00816108
 005DA02A    mov         ecx,esi
 005DA02C    mov         edx,5DA4DC;'HidD_GetFeature'
 005DA031    mov         eax,dword ptr [ebx]
 005DA033    call        005D2554
 005DA038    mov         [0081610C],eax;gvar_0081610C
 005DA03D    mov         ecx,esi
 005DA03F    mov         edx,5DA508;'HidD_SetFeature'
 005DA044    mov         eax,dword ptr [ebx]
 005DA046    call        005D2554
 005DA04B    mov         [00816110],eax;gvar_00816110
 005DA050    mov         ecx,esi
 005DA052    mov         edx,5DA534;'HidD_GetNumInputBuffers'
 005DA057    mov         eax,dword ptr [ebx]
 005DA059    call        005D2554
 005DA05E    mov         [00816114],eax;gvar_00816114
 005DA063    mov         ecx,esi
 005DA065    mov         edx,5DA570;'HidD_SetNumInputBuffers'
 005DA06A    mov         eax,dword ptr [ebx]
 005DA06C    call        005D2554
 005DA071    mov         [00816118],eax;gvar_00816118
 005DA076    mov         ecx,esi
 005DA078    mov         edx,5DA5AC;'HidD_GetAttributes'
 005DA07D    mov         eax,dword ptr [ebx]
 005DA07F    call        005D2554
 005DA084    mov         [0081611C],eax;gvar_0081611C
 005DA089    mov         ecx,esi
 005DA08B    mov         edx,5DA5E0;'HidD_GetManufacturerString'
 005DA090    mov         eax,dword ptr [ebx]
 005DA092    call        005D2554
 005DA097    mov         [00816120],eax;gvar_00816120
 005DA09C    mov         ecx,esi
 005DA09E    mov         edx,5DA624;'HidD_GetProductString'
 005DA0A3    mov         eax,dword ptr [ebx]
 005DA0A5    call        005D2554
 005DA0AA    mov         [00816124],eax;gvar_00816124
 005DA0AF    mov         ecx,esi
 005DA0B1    mov         edx,5DA65C;'HidD_GetSerialNumberString'
 005DA0B6    mov         eax,dword ptr [ebx]
 005DA0B8    call        005D2554
 005DA0BD    mov         [00816128],eax;gvar_00816128
 005DA0C2    mov         ecx,esi
 005DA0C4    mov         edx,5DA6A0;'HidD_GetPhysicalDescriptor'
 005DA0C9    mov         eax,dword ptr [ebx]
 005DA0CB    call        005D2554
 005DA0D0    mov         [0081612C],eax;gvar_0081612C
 005DA0D5    mov         ecx,esi
 005DA0D7    mov         edx,5DA6E4;'HidD_GetIndexedString'
 005DA0DC    mov         eax,dword ptr [ebx]
 005DA0DE    call        005D2554
 005DA0E3    mov         [00816130],eax;gvar_00816130
 005DA0E8    mov         eax,[0078DB58];^gvar_00784C7C
 005DA0ED    cmp         dword ptr [eax],2
>005DA0F0    jne         005DA12C
 005DA0F2    mov         eax,[0078D080];^gvar_00784C80
 005DA0F7    cmp         dword ptr [eax],5
>005DA0FA    jl          005DA12C
 005DA0FC    mov         eax,[0078D6F0];^gvar_00784C84
 005DA101    cmp         dword ptr [eax],1
>005DA104    jl          005DA12C
 005DA106    mov         ecx,esi
 005DA108    mov         edx,5DA71C;'HidD_GetInputReport'
 005DA10D    mov         eax,dword ptr [ebx]
 005DA10F    call        005D2554
 005DA114    mov         [00816134],eax;gvar_00816134
 005DA119    mov         ecx,esi
 005DA11B    mov         edx,5DA750;'HidD_SetOutputReport'
 005DA120    mov         eax,dword ptr [ebx]
 005DA122    call        005D2554
 005DA127    mov         [00816138],eax;gvar_00816138
 005DA12C    mov         ecx,esi
 005DA12E    mov         edx,5DA788;'HidP_GetCaps'
 005DA133    mov         eax,dword ptr [ebx]
 005DA135    call        005D2554
 005DA13A    mov         [0081613C],eax;gvar_0081613C
 005DA13F    mov         ecx,esi
 005DA141    mov         edx,5DA7B0;'HidP_GetLinkCollectionNodes'
 005DA146    mov         eax,dword ptr [ebx]
 005DA148    call        005D2554
 005DA14D    mov         [00816140],eax;gvar_00816140
 005DA152    mov         ecx,esi
 005DA154    mov         edx,5DA7F4;'HidP_GetSpecificButtonCaps'
 005DA159    mov         eax,dword ptr [ebx]
 005DA15B    call        005D2554
 005DA160    mov         [00816144],eax;gvar_00816144
 005DA165    mov         ecx,esi
 005DA167    mov         edx,5DA838;'HidP_GetSpecificValueCaps'
 005DA16C    mov         eax,dword ptr [ebx]
 005DA16E    call        005D2554
 005DA173    mov         [00816148],eax;gvar_00816148
 005DA178    mov         ecx,esi
 005DA17A    mov         edx,5DA878;'HidP_GetData'
 005DA17F    mov         eax,dword ptr [ebx]
 005DA181    call        005D2554
 005DA186    mov         [0081614C],eax;gvar_0081614C
 005DA18B    mov         ecx,esi
 005DA18D    mov         edx,5DA8A0;'HidP_SetData'
 005DA192    mov         eax,dword ptr [ebx]
 005DA194    call        005D2554
 005DA199    mov         [00816150],eax;gvar_00816150
 005DA19E    mov         ecx,esi
 005DA1A0    mov         edx,5DA8C8;'HidP_MaxDataListLength'
 005DA1A5    mov         eax,dword ptr [ebx]
 005DA1A7    call        005D2554
 005DA1AC    mov         [00816154],eax;gvar_00816154
 005DA1B1    mov         ecx,esi
 005DA1B3    mov         edx,5DA904;'HidP_GetUsages'
 005DA1B8    mov         eax,dword ptr [ebx]
 005DA1BA    call        005D2554
 005DA1BF    mov         [00816158],eax;gvar_00816158
 005DA1C4    mov         ecx,esi
 005DA1C6    mov         edx,5DA904;'HidP_GetUsages'
 005DA1CB    mov         eax,dword ptr [ebx]
 005DA1CD    call        005D2554
 005DA1D2    mov         [0081615C],eax;gvar_0081615C
 005DA1D7    mov         ecx,esi
 005DA1D9    mov         edx,5DA930;'HidP_GetUsagesEx'
 005DA1DE    mov         eax,dword ptr [ebx]
 005DA1E0    call        005D2554
 005DA1E5    mov         [00816160],eax;gvar_00816160
 005DA1EA    mov         ecx,esi
 005DA1EC    mov         edx,5DA930;'HidP_GetUsagesEx'
 005DA1F1    mov         eax,dword ptr [ebx]
 005DA1F3    call        005D2554
 005DA1F8    mov         [00816164],eax;gvar_00816164
 005DA1FD    mov         ecx,esi
 005DA1FF    mov         edx,5DA960;'HidP_SetUsages'
 005DA204    mov         eax,dword ptr [ebx]
 005DA206    call        005D2554
 005DA20B    mov         [00816168],eax;gvar_00816168
 005DA210    mov         ecx,esi
 005DA212    mov         edx,5DA960;'HidP_SetUsages'
 005DA217    mov         eax,dword ptr [ebx]
 005DA219    call        005D2554
 005DA21E    mov         [0081616C],eax;gvar_0081616C
 005DA223    mov         ecx,esi
 005DA225    mov         edx,5DA98C;'HidP_UnsetUsages'
 005DA22A    mov         eax,dword ptr [ebx]
 005DA22C    call        005D2554
 005DA231    mov         [00816170],eax;gvar_00816170
 005DA236    mov         ecx,esi
 005DA238    mov         edx,5DA98C;'HidP_UnsetUsages'
 005DA23D    mov         eax,dword ptr [ebx]
 005DA23F    call        005D2554
 005DA244    mov         [00816174],eax;gvar_00816174
 005DA249    mov         ecx,esi
 005DA24B    mov         edx,5DA9BC;'HidP_MaxUsageListLength'
 005DA250    mov         eax,dword ptr [ebx]
 005DA252    call        005D2554
 005DA257    mov         [00816178],eax;gvar_00816178
 005DA25C    mov         ecx,esi
 005DA25E    mov         edx,5DA9BC;'HidP_MaxUsageListLength'
 005DA263    mov         eax,dword ptr [ebx]
 005DA265    call        005D2554
 005DA26A    mov         [0081617C],eax;gvar_0081617C
 005DA26F    mov         ecx,esi
 005DA271    mov         edx,5DA9F8;'HidP_GetUsageValue'
 005DA276    mov         eax,dword ptr [ebx]
 005DA278    call        005D2554
 005DA27D    mov         [00816180],eax;gvar_00816180
 005DA282    mov         ecx,esi
 005DA284    mov         edx,5DAA2C;'HidP_GetScaledUsageValue'
 005DA289    mov         eax,dword ptr [ebx]
 005DA28B    call        005D2554
 005DA290    mov         [00816184],eax;gvar_00816184
 005DA295    mov         ecx,esi
 005DA297    mov         edx,5DAA6C;'HidP_GetUsageValueArray'
 005DA29C    mov         eax,dword ptr [ebx]
 005DA29E    call        005D2554
 005DA2A3    mov         [00816188],eax;gvar_00816188
 005DA2A8    mov         ecx,esi
 005DA2AA    mov         edx,5DAAA8;'HidP_SetUsageValue'
 005DA2AF    mov         eax,dword ptr [ebx]
 005DA2B1    call        005D2554
 005DA2B6    mov         [0081618C],eax;gvar_0081618C
 005DA2BB    mov         ecx,esi
 005DA2BD    mov         edx,5DAADC;'HidP_SetScaledUsageValue'
 005DA2C2    mov         eax,dword ptr [ebx]
 005DA2C4    call        005D2554
 005DA2C9    mov         [00816190],eax;gvar_00816190
 005DA2CE    mov         ecx,esi
 005DA2D0    mov         edx,5DAB1C;'HidP_SetUsageValueArray'
 005DA2D5    mov         eax,dword ptr [ebx]
 005DA2D7    call        005D2554
 005DA2DC    mov         [00816194],eax;gvar_00816194
 005DA2E1    mov         ecx,esi
 005DA2E3    mov         edx,5DAB58;'HidP_UsageListDifference'
 005DA2E8    mov         eax,dword ptr [ebx]
 005DA2EA    call        005D2554
 005DA2EF    mov         [00816198],eax;gvar_00816198
 005DA2F4    mov         ecx,esi
 005DA2F6    mov         edx,5DAB98;'HidP_TranslateUsagesToI8042ScanCodes'
 005DA2FB    mov         eax,dword ptr [ebx]
 005DA2FD    call        005D2554
 005DA302    mov         [0081619C],eax;gvar_0081619C
 005DA307    mov         eax,[0078DB58];^gvar_00784C7C
 005DA30C    cmp         dword ptr [eax],2
>005DA30F    jne         005DA341
 005DA311    mov         eax,[0078D080];^gvar_00784C80
 005DA316    cmp         dword ptr [eax],5
>005DA319    jl          005DA341
 005DA31B    mov         ecx,esi
 005DA31D    mov         edx,5DABF0;'HidP_GetExtendedAttributes'
 005DA322    mov         eax,dword ptr [ebx]
 005DA324    call        005D2554
 005DA329    mov         [008161A0],eax;gvar_008161A0
 005DA32E    mov         ecx,esi
 005DA330    mov         edx,5DAC34;'HidP_InitializeReportForID'
 005DA335    mov         eax,dword ptr [ebx]
 005DA337    call        005D2554
 005DA33C    mov         [008161A4],eax;gvar_008161A4
 005DA341    cmp         byte ptr [esi],0
>005DA344    jne         005DA34B
 005DA346    call        005DAC6C
 005DA34B    movzx       eax,byte ptr [esi]
 005DA34E    pop         edx
 005DA34F    pop         esi
 005DA350    pop         ebx
 005DA351    ret
end;*}

//005DAC6C
procedure sub_005DAC6C;
begin
{*
 005DAC6C    mov         eax,78A044;gvar_0078A044
 005DAC71    call        005D253C
 005DAC76    xor         eax,eax
 005DAC78    mov         [008160F0],eax;gvar_008160F0
 005DAC7D    xor         eax,eax
 005DAC7F    mov         [008160F4],eax;gvar_008160F4
 005DAC84    xor         eax,eax
 005DAC86    mov         [008160F8],eax;gvar_008160F8
 005DAC8B    xor         eax,eax
 005DAC8D    mov         [008160FC],eax;gvar_008160FC
 005DAC92    xor         eax,eax
 005DAC94    mov         [00816100],eax;gvar_00816100
 005DAC99    xor         eax,eax
 005DAC9B    mov         [00816104],eax;gvar_00816104
 005DACA0    xor         eax,eax
 005DACA2    mov         [00816108],eax;gvar_00816108
 005DACA7    xor         eax,eax
 005DACA9    mov         [00816110],eax;gvar_00816110
 005DACAE    xor         eax,eax
 005DACB0    mov         [00816114],eax;gvar_00816114
 005DACB5    xor         eax,eax
 005DACB7    mov         [00816118],eax;gvar_00816118
 005DACBC    xor         eax,eax
 005DACBE    mov         [0081611C],eax;gvar_0081611C
 005DACC3    xor         eax,eax
 005DACC5    mov         [00816120],eax;gvar_00816120
 005DACCA    xor         eax,eax
 005DACCC    mov         [00816124],eax;gvar_00816124
 005DACD1    xor         eax,eax
 005DACD3    mov         [00816128],eax;gvar_00816128
 005DACD8    xor         eax,eax
 005DACDA    mov         [0081612C],eax;gvar_0081612C
 005DACDF    xor         eax,eax
 005DACE1    mov         [00816130],eax;gvar_00816130
 005DACE6    xor         eax,eax
 005DACE8    mov         [00816134],eax;gvar_00816134
 005DACED    xor         eax,eax
 005DACEF    mov         [00816138],eax;gvar_00816138
 005DACF4    xor         eax,eax
 005DACF6    mov         [00816140],eax;gvar_00816140
 005DACFB    xor         eax,eax
 005DACFD    mov         [00816144],eax;gvar_00816144
 005DAD02    xor         eax,eax
 005DAD04    mov         [00816148],eax;gvar_00816148
 005DAD09    xor         eax,eax
 005DAD0B    mov         [0081614C],eax;gvar_0081614C
 005DAD10    xor         eax,eax
 005DAD12    mov         [00816150],eax;gvar_00816150
 005DAD17    xor         eax,eax
 005DAD19    mov         [00816154],eax;gvar_00816154
 005DAD1E    xor         eax,eax
 005DAD20    mov         [00816158],eax;gvar_00816158
 005DAD25    xor         eax,eax
 005DAD27    mov         [0081615C],eax;gvar_0081615C
 005DAD2C    xor         eax,eax
 005DAD2E    mov         [00816160],eax;gvar_00816160
 005DAD33    xor         eax,eax
 005DAD35    mov         [00816164],eax;gvar_00816164
 005DAD3A    xor         eax,eax
 005DAD3C    mov         [00816168],eax;gvar_00816168
 005DAD41    xor         eax,eax
 005DAD43    mov         [0081616C],eax;gvar_0081616C
 005DAD48    xor         eax,eax
 005DAD4A    mov         [00816170],eax;gvar_00816170
 005DAD4F    xor         eax,eax
 005DAD51    mov         [00816174],eax;gvar_00816174
 005DAD56    xor         eax,eax
 005DAD58    mov         [00816178],eax;gvar_00816178
 005DAD5D    xor         eax,eax
 005DAD5F    mov         [0081617C],eax;gvar_0081617C
 005DAD64    xor         eax,eax
 005DAD66    mov         [00816180],eax;gvar_00816180
 005DAD6B    xor         eax,eax
 005DAD6D    mov         [00816184],eax;gvar_00816184
 005DAD72    xor         eax,eax
 005DAD74    mov         [00816188],eax;gvar_00816188
 005DAD79    xor         eax,eax
 005DAD7B    mov         [0081618C],eax;gvar_0081618C
 005DAD80    xor         eax,eax
 005DAD82    mov         [00816190],eax;gvar_00816190
 005DAD87    xor         eax,eax
 005DAD89    mov         [00816194],eax;gvar_00816194
 005DAD8E    xor         eax,eax
 005DAD90    mov         [00816198],eax;gvar_00816198
 005DAD95    xor         eax,eax
 005DAD97    mov         [0081619C],eax;gvar_0081619C
 005DAD9C    xor         eax,eax
 005DAD9E    mov         [008161A0],eax;gvar_008161A0
 005DADA3    xor         eax,eax
 005DADA5    mov         [008161A4],eax;gvar_008161A4
 005DADAA    ret
*}
end;

//005DE0F0
function kernel32.ReadFileEx(lpBuffer:Pointer; nNumberOfBytesToRead:DWORD; lpOverlapped:POverlapped; lpCompletionRoutine:Pointer):LongBool; stdcall;
begin
{*
 005DE0F0    jmp         dword ptr ds:[826904]
*}
end;

//005DE0F8
function kernel32.WriteFileEx(lpBuffer:Pointer; nNumberOfBytesToWrite:DWORD; const lpOverlapped:_OVERLAPPED; lpCompletionRoutine:Pointer):LongBool; stdcall;
begin
{*
 005DE0F8    jmp         dword ptr ds:[826900]
*}
end;

//005DE100
constructor TJvHidDeviceReadThread.Create;
begin
{*
 005DE100    push        ebp
 005DE101    mov         ebp,esp
 005DE103    add         esp,0FFFFFFC0
 005DE106    push        ebx
 005DE107    push        esi
 005DE108    push        edi
 005DE109    test        dl,dl
>005DE10B    je          005DE115
 005DE10D    add         esp,0FFFFFFF0
 005DE110    call        @ClassCreate
 005DE115    mov         esi,ecx
 005DE117    mov         ebx,edx
 005DE119    mov         edi,eax
 005DE11B    xor         ecx,ecx
 005DE11D    xor         edx,edx
 005DE11F    mov         eax,edi
 005DE121    call        TThread.Create
 005DE126    mov         dword ptr [edi+44],esi
 005DE129    xor         eax,eax
 005DE12B    mov         dword ptr [edi+48],eax
 005DE12E    lea         edx,[ebp-40]
 005DE131    mov         eax,esi
 005DE133    call        005DEE9C
 005DE138    movzx       eax,word ptr [ebp-3C]
 005DE13C    push        eax
 005DE13D    lea         eax,[edi+4C]
 005DE140    mov         ecx,1
 005DE145    mov         edx,dword ptr ds:[5DB988];:TJvHidDeviceReadThread.:1
 005DE14B    call        @DynArraySetLength
 005DE150    add         esp,4
 005DE153    mov         eax,edi
 005DE155    test        bl,bl
>005DE157    je          005DE168
 005DE159    call        @AfterConstruction
 005DE15E    pop         dword ptr fs:[0]
 005DE165    add         esp,0C
 005DE168    mov         eax,edi
 005DE16A    pop         edi
 005DE16B    pop         esi
 005DE16C    pop         ebx
 005DE16D    mov         esp,ebp
 005DE16F    pop         ebp
 005DE170    ret
*}
end;

//005DE174
constructor sub_005DE174(CreateSuspended:Boolean);
begin
{*
 005DE174    test        dl,dl
>005DE176    je          005DE180
 005DE178    add         esp,0FFFFFFF0
 005DE17B    call        @ClassCreate
 005DE180    mov         ecx,dword ptr ds:[78D5E8];^SResString327:TResStringRec
 005DE186    mov         dl,1
 005DE188    mov         eax,[005DE040];EControllerError
 005DE18D    call        Exception.CreateRes;EControllerError.Create
 005DE192    call        @RaiseExcept
 005DE197    test        dl,dl
>005DE199    je          005DE1AA
 005DE19B    call        @AfterConstruction
 005DE1A0    pop         dword ptr fs:[0]
 005DE1A7    add         esp,0C
 005DE1AA    ret
*}
end;

//005DE1AC
procedure sub_005DE1AC(?:TJvHidDeviceReadThread);
begin
{*
 005DE1AC    push        ebx
 005DE1AD    mov         ecx,dword ptr [eax+4C]
 005DE1B0    inc         ecx
 005DE1B1    push        ecx
 005DE1B2    movzx       ecx,word ptr [eax+48]
 005DE1B6    dec         ecx
 005DE1B7    push        ecx
 005DE1B8    mov         ecx,dword ptr [eax+4C]
 005DE1BB    movzx       ecx,byte ptr [ecx]
 005DE1BE    mov         edx,dword ptr [eax+44]
 005DE1C1    mov         ebx,edx
 005DE1C3    mov         eax,dword ptr [ebx+94]
 005DE1C9    call        dword ptr [ebx+90]
 005DE1CF    pop         ebx
 005DE1D0    ret
*}
end;

//005DE200
procedure TJvHidDeviceReadThread.Execute;
begin
{*
 005DE200    push        ebx
 005DE201    push        esi
 005DE202    push        edi
 005DE203    push        ebp
 005DE204    add         esp,0FFFFFFC0
 005DE207    mov         ebp,eax
 005DE209    mov         esi,0C0
>005DE20E    jmp         005DE2C3
 005DE213    mov         esi,0C0
 005DE218    mov         edx,esp
 005DE21A    mov         eax,dword ptr [ebp+44];TJvHidDeviceReadThread.Device:TJvHidDevice
 005DE21D    call        005DEE9C
 005DE222    movzx       edx,word ptr [esp+4]
 005DE227    mov         eax,dword ptr [ebp+4C];TJvHidDeviceReadThread.Report::1
 005DE22A    xor         ecx,ecx
 005DE22C    call        @FillChar
 005DE231    push        5DE1F8
 005DE236    lea         edx,[esp+4]
 005DE23A    mov         edi,dword ptr [ebp+44];TJvHidDeviceReadThread.Device:TJvHidDevice
 005DE23D    mov         eax,edi
 005DE23F    call        005DEE9C
 005DE244    movzx       ecx,word ptr [esp+8]
 005DE249    mov         edx,dword ptr [ebp+4C];TJvHidDeviceReadThread.Report::1
 005DE24C    mov         eax,edi
 005DE24E    call        TJvHidDevice.ReadFileEx
 005DE253    test        al,al
>005DE255    je          005DE2AE
 005DE257    push        0FF
 005DE259    mov         eax,dword ptr [ebp+44];TJvHidDeviceReadThread.Device:TJvHidDevice
 005DE25C    mov         eax,dword ptr [eax+70];TJvHidDevice.FThreadSleepTime:Integer
 005DE25F    push        eax
 005DE260    call        kernel32.SleepEx
 005DE265    mov         esi,eax
 005DE267    movzx       ebx,byte ptr [ebp+0D];TJvHidDeviceReadThread.FTerminated:Boolean
 005DE26B    test        bl,bl
>005DE26D    jne         005DE277
 005DE26F    cmp         esi,0C0
>005DE275    jne         005DE257
 005DE277    test        bl,bl
>005DE279    jne         005DE2C3
 005DE27B    mov         eax,dword ptr [ebp+44];TJvHidDeviceReadThread.Device:TJvHidDevice
 005DE27E    call        005DF304
 005DE283    mov         dword ptr [ebp+48],eax;TJvHidDeviceReadThread.NumBytesRead:Cardinal
 005DE286    cmp         dword ptr [ebp+48],0;TJvHidDeviceReadThread.NumBytesRead:Cardinal
>005DE28A    jbe         005DE2C3
 005DE28C    mov         eax,[0078CB94];^IsLibrary:Boolean
 005DE291    cmp         byte ptr [eax],0
>005DE294    je          005DE29F
 005DE296    mov         eax,ebp
 005DE298    call        005DE1AC
>005DE29D    jmp         005DE2C3
 005DE29F    push        ebp
 005DE2A0    push        5DE1AC;sub_005DE1AC
 005DE2A5    mov         eax,ebp
 005DE2A7    call        TThread.Synchronize
>005DE2AC    jmp         005DE2C3
 005DE2AE    call        kernel32.GetLastError
 005DE2B3    mov         dword ptr [ebp+40],eax;TJvHidDeviceReadThread.FErr:Cardinal
 005DE2B6    push        ebp
 005DE2B7    push        5DE1D4
 005DE2BC    mov         eax,ebp
 005DE2BE    call        TThread.Synchronize
 005DE2C3    cmp         byte ptr [ebp+0D],0;TJvHidDeviceReadThread.FTerminated:Boolean
>005DE2C7    je          005DE213
 005DE2CD    cmp         esi,0C0
>005DE2D3    je          005DE2DF
 005DE2D5    xor         edx,edx
 005DE2D7    mov         eax,dword ptr [ebp+44];TJvHidDeviceReadThread.Device:TJvHidDevice
 005DE2DA    call        TJvHidDevice.CancelIO
 005DE2DF    add         esp,40
 005DE2E2    pop         ebp
 005DE2E3    pop         edi
 005DE2E4    pop         esi
 005DE2E5    pop         ebx
 005DE2E6    ret
*}
end;

//005DE2E8
constructor TJvHidPnPInfo.Create(APnPHandle:Pointer; ADevicePath:PWideChar; ADevData:SP_DEVINFO_DATA);
begin
{*
 005DE2E8    push        ebp
 005DE2E9    mov         ebp,esp
 005DE2EB    push        ecx
 005DE2EC    mov         ecx,0B
 005DE2F1    push        0
 005DE2F3    push        0
 005DE2F5    dec         ecx
>005DE2F6    jne         005DE2F1
 005DE2F8    xchg        ecx,dword ptr [ebp-4]
 005DE2FB    push        ebx
 005DE2FC    push        esi
 005DE2FD    push        edi
 005DE2FE    test        dl,dl
>005DE300    je          005DE30A
 005DE302    add         esp,0FFFFFFF0
 005DE305    call        @ClassCreate
 005DE30A    mov         esi,dword ptr [ebp+0C]
 005DE30D    lea         edi,[ebp-1D]
 005DE310    push        ecx
 005DE311    mov         ecx,7
 005DE316    rep movs    dword ptr [edi],dword ptr [esi]
 005DE318    pop         ecx
 005DE319    mov         esi,ecx
 005DE31B    mov         byte ptr [ebp-1],dl
 005DE31E    mov         ebx,eax
 005DE320    lea         edi,[ebp-1D]
 005DE323    xor         eax,eax
 005DE325    push        ebp
 005DE326    push        5DE5BA
 005DE32B    push        dword ptr fs:[eax]
 005DE32E    mov         dword ptr fs:[eax],esp
 005DE331    xor         edx,edx
 005DE333    mov         eax,ebx
 005DE335    call        TObject.Create
 005DE33A    mov         eax,dword ptr [edi+14]
 005DE33D    mov         dword ptr [ebx+4],eax;TJvHidPnPInfo.FDeviceID:Cardinal
 005DE340    lea         eax,[ebx+8];TJvHidPnPInfo.FDevicePath:string
 005DE343    mov         edx,dword ptr [ebp+8]
 005DE346    call        @UStrFromPWChar
 005DE34B    push        0F
 005DE34D    mov         ecx,edi
 005DE34F    mov         edx,esi
 005DE351    mov         eax,ebx
 005DE353    call        005DE76C
 005DE358    mov         dword ptr [ebx+0C],eax;TJvHidPnPInfo.FCapabilities:Cardinal
 005DE35B    push        7
 005DE35D    lea         eax,[ebp-24]
 005DE360    push        eax
 005DE361    mov         ecx,edi
 005DE363    mov         edx,esi
 005DE365    mov         eax,ebx
 005DE367    call        005DE63C
 005DE36C    mov         edx,dword ptr [ebp-24]
 005DE36F    lea         eax,[ebx+10];TJvHidPnPInfo.FClassDescr:string
 005DE372    call        @UStrAsg
 005DE377    push        8
 005DE379    lea         eax,[ebp-28]
 005DE37C    push        eax
 005DE37D    mov         ecx,edi
 005DE37F    mov         edx,esi
 005DE381    mov         eax,ebx
 005DE383    call        005DE63C
 005DE388    mov         edx,dword ptr [ebp-28]
 005DE38B    lea         eax,[ebx+14];TJvHidPnPInfo.FClassGUID:string
 005DE38E    call        @UStrAsg
 005DE393    push        2
 005DE395    mov         ecx,edi
 005DE397    mov         edx,esi
 005DE399    mov         eax,ebx
 005DE39B    call        005DE694
 005DE3A0    mov         dword ptr [ebx+18],eax;TJvHidPnPInfo.FCompatibleIDs:TStringList
 005DE3A3    push        0A
 005DE3A5    mov         ecx,edi
 005DE3A7    mov         edx,esi
 005DE3A9    mov         eax,ebx
 005DE3AB    call        005DE76C
 005DE3B0    mov         dword ptr [ebx+1C],eax;TJvHidPnPInfo.FConfigFlags:Cardinal
 005DE3B3    push        0
 005DE3B5    lea         eax,[ebp-2C]
 005DE3B8    push        eax
 005DE3B9    mov         ecx,edi
 005DE3BB    mov         edx,esi
 005DE3BD    mov         eax,ebx
 005DE3BF    call        005DE63C
 005DE3C4    mov         edx,dword ptr [ebp-2C]
 005DE3C7    lea         eax,[ebx+20];TJvHidPnPInfo.FDeviceDescr:string
 005DE3CA    call        @UStrAsg
 005DE3CF    push        9
 005DE3D1    lea         eax,[ebp-30]
 005DE3D4    push        eax
 005DE3D5    mov         ecx,edi
 005DE3D7    mov         edx,esi
 005DE3D9    mov         eax,ebx
 005DE3DB    call        005DE63C
 005DE3E0    mov         edx,dword ptr [ebp-30]
 005DE3E3    lea         eax,[ebx+24];TJvHidPnPInfo.FDriver:string
 005DE3E6    call        @UStrAsg
 005DE3EB    push        0C
 005DE3ED    lea         eax,[ebp-34]
 005DE3F0    push        eax
 005DE3F1    mov         ecx,edi
 005DE3F3    mov         edx,esi
 005DE3F5    mov         eax,ebx
 005DE3F7    call        005DE63C
 005DE3FC    mov         edx,dword ptr [ebp-34]
 005DE3FF    lea         eax,[ebx+28];TJvHidPnPInfo.FFriendlyName:string
 005DE402    call        @UStrAsg
 005DE407    push        1
 005DE409    mov         ecx,edi
 005DE40B    mov         edx,esi
 005DE40D    mov         eax,ebx
 005DE40F    call        005DE694
 005DE414    mov         dword ptr [ebx+2C],eax;TJvHidPnPInfo.FHardwareID:TStringList
 005DE417    push        12
 005DE419    mov         ecx,edi
 005DE41B    mov         edx,esi
 005DE41D    mov         eax,ebx
 005DE41F    call        005DE694
 005DE424    mov         dword ptr [ebx+30],eax;TJvHidPnPInfo.FLowerFilters:TStringList
 005DE427    push        0B
 005DE429    lea         eax,[ebp-38]
 005DE42C    push        eax
 005DE42D    mov         ecx,edi
 005DE42F    mov         edx,esi
 005DE431    mov         eax,ebx
 005DE433    call        005DE63C
 005DE438    mov         edx,dword ptr [ebp-38]
 005DE43B    lea         eax,[ebx+34];TJvHidPnPInfo.FMfg:string
 005DE43E    call        @UStrAsg
 005DE443    push        11
 005DE445    mov         ecx,edi
 005DE447    mov         edx,esi
 005DE449    mov         eax,ebx
 005DE44B    call        005DE694
 005DE450    mov         dword ptr [ebx+38],eax;TJvHidPnPInfo.FUpperFilters:TStringList
 005DE453    push        4
 005DE455    lea         eax,[ebp-3C]
 005DE458    push        eax
 005DE459    mov         ecx,edi
 005DE45B    mov         edx,esi
 005DE45D    mov         eax,ebx
 005DE45F    call        005DE63C
 005DE464    mov         edx,dword ptr [ebp-3C]
 005DE467    lea         eax,[ebx+68];TJvHidPnPInfo.FService:string
 005DE46A    call        @UStrAsg
 005DE46F    push        1C
 005DE471    lea         eax,[ebp-40]
 005DE474    push        eax
 005DE475    mov         ecx,edi
 005DE477    mov         edx,esi
 005DE479    mov         eax,ebx
 005DE47B    call        005DE63C
 005DE480    mov         edx,dword ptr [ebp-40]
 005DE483    lea         eax,[ebx+3C];TJvHidPnPInfo.FAddress:string
 005DE486    call        @UStrAsg
 005DE48B    push        15
 005DE48D    mov         ecx,edi
 005DE48F    mov         edx,esi
 005DE491    mov         eax,ebx
 005DE493    call        005DE76C
 005DE498    mov         dword ptr [ebx+40],eax;TJvHidPnPInfo.FBusNumber:Cardinal
 005DE49B    push        13
 005DE49D    lea         eax,[ebp-44]
 005DE4A0    push        eax
 005DE4A1    mov         ecx,edi
 005DE4A3    mov         edx,esi
 005DE4A5    mov         eax,ebx
 005DE4A7    call        005DE63C
 005DE4AC    mov         edx,dword ptr [ebp-44]
 005DE4AF    lea         eax,[ebx+44];TJvHidPnPInfo.FBusType:string
 005DE4B2    call        @UStrAsg
 005DE4B7    push        1B
 005DE4B9    lea         eax,[ebp-48]
 005DE4BC    push        eax
 005DE4BD    mov         ecx,edi
 005DE4BF    mov         edx,esi
 005DE4C1    mov         eax,ebx
 005DE4C3    call        005DE63C
 005DE4C8    mov         edx,dword ptr [ebp-48]
 005DE4CB    lea         eax,[ebx+48];TJvHidPnPInfo.FCharacteristics:string
 005DE4CE    call        @UStrAsg
 005DE4D3    push        19
 005DE4D5    mov         ecx,edi
 005DE4D7    mov         edx,esi
 005DE4D9    mov         eax,ebx
 005DE4DB    call        005DE76C
 005DE4E0    mov         dword ptr [ebx+4C],eax;TJvHidPnPInfo.FDevType:Cardinal
 005DE4E3    push        16
 005DE4E5    lea         eax,[ebp-4C]
 005DE4E8    push        eax
 005DE4E9    mov         ecx,edi
 005DE4EB    mov         edx,esi
 005DE4ED    mov         eax,ebx
 005DE4EF    call        005DE63C
 005DE4F4    mov         edx,dword ptr [ebp-4C]
 005DE4F7    lea         eax,[ebx+50];TJvHidPnPInfo.FEnumeratorName:string
 005DE4FA    call        @UStrAsg
 005DE4FF    push        1A
 005DE501    mov         ecx,edi
 005DE503    mov         edx,esi
 005DE505    mov         eax,ebx
 005DE507    call        005DE76C
 005DE50C    mov         dword ptr [ebx+54],eax;TJvHidPnPInfo.FExclusive:Cardinal
 005DE50F    push        14
 005DE511    mov         ecx,edi
 005DE513    mov         edx,esi
 005DE515    mov         eax,ebx
 005DE517    call        005DE76C
 005DE51C    mov         dword ptr [ebx+58],eax;TJvHidPnPInfo.FLegacyBusType:Cardinal
 005DE51F    push        0D
 005DE521    lea         eax,[ebp-50]
 005DE524    push        eax
 005DE525    mov         ecx,edi
 005DE527    mov         edx,esi
 005DE529    mov         eax,ebx
 005DE52B    call        005DE63C
 005DE530    mov         edx,dword ptr [ebp-50]
 005DE533    lea         eax,[ebx+5C];TJvHidPnPInfo.FLocationInfo:string
 005DE536    call        @UStrAsg
 005DE53B    push        0E
 005DE53D    lea         eax,[ebp-54]
 005DE540    push        eax
 005DE541    mov         ecx,edi
 005DE543    mov         edx,esi
 005DE545    mov         eax,ebx
 005DE547    call        005DE63C
 005DE54C    mov         edx,dword ptr [ebp-54]
 005DE54F    lea         eax,[ebx+60];TJvHidPnPInfo.FPhysDevObjName:string
 005DE552    call        @UStrAsg
 005DE557    push        18
 005DE559    lea         eax,[ebp-58]
 005DE55C    push        eax
 005DE55D    mov         ecx,edi
 005DE55F    mov         edx,esi
 005DE561    mov         eax,ebx
 005DE563    call        005DE63C
 005DE568    mov         edx,dword ptr [ebp-58]
 005DE56B    lea         eax,[ebx+64];TJvHidPnPInfo.FSecuritySDS:string
 005DE56E    call        @UStrAsg
 005DE573    push        10
 005DE575    mov         ecx,edi
 005DE577    mov         edx,esi
 005DE579    mov         eax,ebx
 005DE57B    call        005DE76C
 005DE580    mov         dword ptr [ebx+6C],eax;TJvHidPnPInfo.FUINumber:Cardinal
 005DE583    push        1E
 005DE585    lea         eax,[ebp-5C]
 005DE588    push        eax
 005DE589    mov         ecx,edi
 005DE58B    mov         edx,esi
 005DE58D    mov         eax,ebx
 005DE58F    call        005DE63C
 005DE594    mov         edx,dword ptr [ebp-5C]
 005DE597    lea         eax,[ebx+70];TJvHidPnPInfo.FUINumberFormat:string
 005DE59A    call        @UStrAsg
 005DE59F    xor         eax,eax
 005DE5A1    pop         edx
 005DE5A2    pop         ecx
 005DE5A3    pop         ecx
 005DE5A4    mov         dword ptr fs:[eax],edx
 005DE5A7    push        5DE5C1
 005DE5AC    lea         eax,[ebp-5C]
 005DE5AF    mov         edx,0F
 005DE5B4    call        @UStrArrayClr
 005DE5B9    ret
>005DE5BA    jmp         @HandleFinally
>005DE5BF    jmp         005DE5AC
 005DE5C1    mov         eax,ebx
 005DE5C3    cmp         byte ptr [ebp-1],0
>005DE5C7    je          005DE5D8
 005DE5C9    call        @AfterConstruction
 005DE5CE    pop         dword ptr fs:[0]
 005DE5D5    add         esp,0C
 005DE5D8    mov         eax,ebx
 005DE5DA    pop         edi
 005DE5DB    pop         esi
 005DE5DC    pop         ebx
 005DE5DD    mov         esp,ebp
 005DE5DF    pop         ebp
 005DE5E0    ret         8
*}
end;

//005DE5E4
destructor TJvHidPnPInfo.Destroy();
begin
{*
 005DE5E4    push        ebx
 005DE5E5    push        esi
 005DE5E6    call        @BeforeDestruction
 005DE5EB    mov         ebx,edx
 005DE5ED    mov         esi,eax
 005DE5EF    mov         eax,dword ptr [esi+18];TJvHidPnPInfo.FCompatibleIDs:TStringList
 005DE5F2    call        TObject.Free
 005DE5F7    mov         eax,dword ptr [esi+2C];TJvHidPnPInfo.FHardwareID:TStringList
 005DE5FA    call        TObject.Free
 005DE5FF    mov         eax,dword ptr [esi+30];TJvHidPnPInfo.FLowerFilters:TStringList
 005DE602    call        TObject.Free
 005DE607    mov         eax,dword ptr [esi+38];TJvHidPnPInfo.FUpperFilters:TStringList
 005DE60A    call        TObject.Free
 005DE60F    mov         edx,ebx
 005DE611    and         dl,0FC
 005DE614    mov         eax,esi
 005DE616    call        TObject.Destroy
 005DE61B    test        bl,bl
>005DE61D    jle         005DE626
 005DE61F    mov         eax,esi
 005DE621    call        @ClassDestroy
 005DE626    pop         esi
 005DE627    pop         ebx
 005DE628    ret
*}
end;

//005DE63C
{*procedure sub_005DE63C(?:?; ?:?);
begin
 005DE63C    push        ebp
 005DE63D    mov         ebp,esp
 005DE63F    add         esp,0FFFFF7F8
 005DE645    xor         eax,eax
 005DE647    mov         dword ptr [ebp-4],eax
 005DE64A    xor         eax,eax
 005DE64C    mov         dword ptr [ebp-8],eax
 005DE64F    mov         word ptr [ebp-808],0
 005DE658    lea         eax,[ebp-4]
 005DE65B    push        eax
 005DE65C    push        800
 005DE661    lea         eax,[ebp-808]
 005DE667    push        eax
 005DE668    lea         eax,[ebp-8]
 005DE66B    push        eax
 005DE66C    mov         eax,dword ptr [ebp+0C]
 005DE66F    push        eax
 005DE670    push        ecx
 005DE671    push        edx
 005DE672    mov         eax,[0078D218];^gvar_00816000
 005DE677    mov         eax,dword ptr [eax]
 005DE679    call        eax
 005DE67B    mov         eax,dword ptr [ebp+8]
 005DE67E    lea         edx,[ebp-808]
 005DE684    mov         ecx,400
 005DE689    call        @UStrFromWArray
 005DE68E    mov         esp,ebp
 005DE690    pop         ebp
 005DE691    ret         8
end;*}

//005DE694
{*function sub_005DE694(?:?):?;
begin
 005DE694    push        ebp
 005DE695    mov         ebp,esp
 005DE697    push        eax
 005DE698    mov         eax,8
 005DE69D    add         esp,0FFFFF004
 005DE6A3    push        eax
 005DE6A4    dec         eax
>005DE6A5    jne         005DE69D
 005DE6A7    mov         eax,dword ptr [ebp-4]
 005DE6AA    add         esp,0FFFFFFF8
 005DE6AD    push        ebx
 005DE6AE    push        esi
 005DE6AF    xor         ebx,ebx
 005DE6B1    mov         dword ptr [ebp-800C],ebx
 005DE6B7    xor         eax,eax
 005DE6B9    push        ebp
 005DE6BA    push        5DE758
 005DE6BF    push        dword ptr fs:[eax]
 005DE6C2    mov         dword ptr fs:[eax],esp
 005DE6C5    xor         eax,eax
 005DE6C7    mov         dword ptr [ebp-4],eax
 005DE6CA    xor         eax,eax
 005DE6CC    mov         dword ptr [ebp-8],eax
 005DE6CF    mov         word ptr [ebp-8008],0
 005DE6D8    lea         eax,[ebp-4]
 005DE6DB    push        eax
 005DE6DC    push        8000
 005DE6E1    lea         eax,[ebp-8008]
 005DE6E7    push        eax
 005DE6E8    lea         eax,[ebp-8]
 005DE6EB    push        eax
 005DE6EC    mov         eax,dword ptr [ebp+8]
 005DE6EF    push        eax
 005DE6F0    push        ecx
 005DE6F1    push        edx
 005DE6F2    mov         eax,[0078D218];^gvar_00816000
 005DE6F7    mov         eax,dword ptr [eax]
 005DE6F9    call        eax
 005DE6FB    mov         dl,1
 005DE6FD    mov         eax,[0043C7BC];TStringList
 005DE702    call        TStringList.Create;TStringList.Create
 005DE707    mov         esi,eax
 005DE709    lea         ebx,[ebp-8008]
>005DE70F    jmp         005DE739
 005DE711    lea         eax,[ebp-800C]
 005DE717    mov         edx,ebx
 005DE719    call        @UStrFromPWChar
 005DE71E    mov         edx,dword ptr [ebp-800C]
 005DE724    mov         eax,esi
 005DE726    mov         ecx,dword ptr [eax]
 005DE728    call        dword ptr [ecx+38];TStringList.Add
 005DE72B    mov         eax,ebx
 005DE72D    call        StrLen
 005DE732    add         eax,eax
 005DE734    add         ebx,eax
 005DE736    add         ebx,2
 005DE739    cmp         word ptr [ebx],0
>005DE73D    jne         005DE711
 005DE73F    xor         eax,eax
 005DE741    pop         edx
 005DE742    pop         ecx
 005DE743    pop         ecx
 005DE744    mov         dword ptr fs:[eax],edx
 005DE747    push        5DE75F
 005DE74C    lea         eax,[ebp-800C]
 005DE752    call        @UStrClr
 005DE757    ret
>005DE758    jmp         @HandleFinally
>005DE75D    jmp         005DE74C
 005DE75F    mov         eax,esi
 005DE761    pop         esi
 005DE762    pop         ebx
 005DE763    mov         esp,ebp
 005DE765    pop         ebp
 005DE766    ret         4
end;*}

//005DE76C
{*function sub_005DE76C(?:?):?;
begin
 005DE76C    push        ebp
 005DE76D    mov         ebp,esp
 005DE76F    add         esp,0FFFFFFF4
 005DE772    xor         eax,eax
 005DE774    mov         dword ptr [ebp-8],eax
 005DE777    xor         eax,eax
 005DE779    mov         dword ptr [ebp-0C],eax
 005DE77C    xor         eax,eax
 005DE77E    mov         dword ptr [ebp-4],eax
 005DE781    lea         eax,[ebp-8]
 005DE784    push        eax
 005DE785    push        4
 005DE787    lea         eax,[ebp-4]
 005DE78A    push        eax
 005DE78B    lea         eax,[ebp-0C]
 005DE78E    push        eax
 005DE78F    mov         eax,dword ptr [ebp+8]
 005DE792    push        eax
 005DE793    push        ecx
 005DE794    push        edx
 005DE795    mov         eax,[0078D218];^gvar_00816000
 005DE79A    mov         eax,dword ptr [eax]
 005DE79C    call        eax
 005DE79E    mov         eax,dword ptr [ebp-4]
 005DE7A1    mov         esp,ebp
 005DE7A3    pop         ebp
 005DE7A4    ret         4
end;*}

//005DE7A8
constructor sub_005DE7A8;
begin
{*
 005DE7A8    push        ebx
 005DE7A9    test        dl,dl
>005DE7AB    je          005DE7B5
 005DE7AD    add         esp,0FFFFFFF0
 005DE7B0    call        @ClassCreate
 005DE7B5    mov         ebx,eax
 005DE7B7    xor         edx,edx
 005DE7B9    mov         eax,ebx
 005DE7BB    call        TObject.Create
 005DE7C0    mov         dword ptr [ebx+0C],0FFFFFFFF;TJvHidDevice.FHidFileHandle:Cardinal
 005DE7C7    mov         dword ptr [ebx+10],0FFFFFFFF;TJvHidDevice.FHidOverlappedRead:Cardinal
 005DE7CE    mov         dword ptr [ebx+14],0FFFFFFFF;TJvHidDevice.FHidOverlappedWrite:Cardinal
 005DE7D5    mov         ecx,dword ptr ds:[78D448];^SResString328:TResStringRec
 005DE7DB    mov         dl,1
 005DE7DD    mov         eax,[005DE040];EControllerError
 005DE7E2    call        Exception.CreateRes;EControllerError.Create
 005DE7E7    call        @RaiseExcept
 005DE7EC    mov         eax,ebx
 005DE7EE    test        dl,dl
>005DE7F0    je          005DE801
 005DE7F2    call        @AfterConstruction
 005DE7F7    pop         dword ptr fs:[0]
 005DE7FE    add         esp,0C
 005DE801    mov         eax,ebx
 005DE803    pop         ebx
 005DE804    ret
*}
end;

//005DE808
{*constructor TJvHidDevice.Create(?:?);
begin
 005DE808    push        ebp
 005DE809    mov         ebp,esp
 005DE80B    push        ecx
 005DE80C    push        ebx
 005DE80D    push        esi
 005DE80E    push        edi
 005DE80F    test        dl,dl
>005DE811    je          005DE81B
 005DE813    add         esp,0FFFFFFF0
 005DE816    call        @ClassCreate
 005DE81B    mov         ebx,ecx
 005DE81D    mov         byte ptr [ebp-1],dl
 005DE820    mov         edi,eax
 005DE822    mov         esi,dword ptr [ebp+8]
 005DE825    xor         edx,edx
 005DE827    mov         eax,edi
 005DE829    call        TObject.Create
 005DE82E    mov         dword ptr [edi+4C],ebx
 005DE831    mov         dword ptr [edi+4],esi
 005DE834    mov         byte ptr [edi+8],1
 005DE838    mov         byte ptr [edi+9],0
 005DE83C    mov         byte ptr [edi+0A],0
 005DE840    mov         dword ptr [edi+10],0FFFFFFFF
 005DE847    mov         dword ptr [edi+14],0FFFFFFFF
 005DE84E    lea         eax,[edi+50]
 005DE851    call        @WStrClr
 005DE856    lea         eax,[edi+54]
 005DE859    call        @WStrClr
 005DE85E    xor         eax,eax
 005DE860    mov         dword ptr [edi+5C],eax
 005DE863    push        0
 005DE865    lea         eax,[edi+58]
 005DE868    mov         ecx,1
 005DE86D    mov         edx,dword ptr ds:[5DB010];TJvPhysicalDescriptor
 005DE873    call        @DynArraySetLength
 005DE878    add         esp,4
 005DE87B    lea         eax,[edi+60]
 005DE87E    call        @WStrClr
 005DE883    mov         dl,1
 005DE885    mov         eax,[0043C7BC];TStringList
 005DE88A    call        TStringList.Create;TStringList.Create
 005DE88F    mov         dword ptr [edi+64],eax
 005DE892    xor         eax,eax
 005DE894    mov         dword ptr [edi+68],eax
 005DE897    xor         eax,eax
 005DE899    mov         dword ptr [edi+6C],eax
 005DE89C    push        0
 005DE89E    lea         eax,[edi+74]
 005DE8A1    mov         ecx,1
 005DE8A6    mov         edx,dword ptr ds:[5DBB70];:TJvHidDevice.:1
 005DE8AC    call        @DynArraySetLength
 005DE8B1    add         esp,4
 005DE8B4    xor         eax,eax
 005DE8B6    mov         dword ptr [edi+78],eax
 005DE8B9    xor         eax,eax
 005DE8BB    mov         dword ptr [edi+7C],eax
 005DE8BE    xor         eax,eax
 005DE8C0    mov         dword ptr [edi+80],eax
 005DE8C6    xor         eax,eax
 005DE8C8    mov         dword ptr [edi+84],eax
 005DE8CE    mov         dword ptr [edi+70],64
 005DE8D5    mov         word ptr [edi+88],0
 005DE8DE    mov         word ptr [edi+8A],0
 005DE8E7    mov         word ptr [edi+8C],0
 005DE8F0    xor         eax,eax
 005DE8F2    mov         dword ptr [edi+0AC],eax
 005DE8F8    push        dword ptr [esi+64]
 005DE8FB    push        dword ptr [esi+60]
 005DE8FE    mov         eax,edi
 005DE900    call        005DF390
 005DE905    mov         eax,dword ptr [esi+70]
 005DE908    mov         dword ptr [edi+0A0],eax
 005DE90E    mov         eax,dword ptr [esi+74]
 005DE911    mov         dword ptr [edi+0A4],eax
 005DE917    push        0
 005DE919    push        0
 005DE91B    push        3
 005DE91D    push        0
 005DE91F    push        3
 005DE921    push        0C0000000
 005DE926    mov         eax,dword ptr [edi+4C]
 005DE929    mov         eax,dword ptr [eax+8]
 005DE92C    call        @UStrToPWChar
 005DE931    push        eax
 005DE932    call        kernel32.CreateFileW
 005DE937    mov         esi,eax
 005DE939    mov         dword ptr [edi+0C],esi
 005DE93C    cmp         esi,0FFFFFFFF
 005DE93F    setne       al
 005DE942    mov         byte ptr [edi+0A8],al
 005DE948    test        al,al
>005DE94A    jne         005DE96C
 005DE94C    push        0
 005DE94E    push        0
 005DE950    push        3
 005DE952    push        0
 005DE954    push        3
 005DE956    push        0
 005DE958    mov         eax,dword ptr [edi+4C]
 005DE95B    mov         eax,dword ptr [eax+8]
 005DE95E    call        @UStrToPWChar
 005DE963    push        eax
 005DE964    call        kernel32.CreateFileW
 005DE969    mov         dword ptr [edi+0C],eax
 005DE96C    cmp         dword ptr [edi+0C],0FFFFFFFF
>005DE970    je          005DE9A7
 005DE972    mov         dword ptr [edi+40],0C
 005DE979    lea         eax,[edi+40]
 005DE97C    push        eax
 005DE97D    mov         eax,dword ptr [edi+0C]
 005DE980    push        eax
 005DE981    mov         eax,[0078CCC4];^gvar_0081611C
 005DE986    mov         eax,dword ptr [eax]
 005DE988    call        eax
 005DE98A    test        eax,eax
>005DE98C    jne         005DE9BE
 005DE98E    mov         ecx,dword ptr ds:[78DA24];^SResString329:TResStringRec
 005DE994    mov         dl,1
 005DE996    mov         eax,[005DE040];EControllerError
 005DE99B    call        Exception.CreateRes;EControllerError.Create
 005DE9A0    call        @RaiseExcept
>005DE9A5    jmp         005DE9BE
 005DE9A7    mov         ecx,dword ptr ds:[78D624];^SResString330:TResStringRec
 005DE9AD    mov         dl,1
 005DE9AF    mov         eax,[005DE040];EControllerError
 005DE9B4    call        Exception.CreateRes;EControllerError.Create
 005DE9B9    call        @RaiseExcept
 005DE9BE    mov         eax,edi
 005DE9C0    call        TJvHidDevice.CloseFile
 005DE9C5    mov         eax,edi
 005DE9C7    cmp         byte ptr [ebp-1],0
>005DE9CB    je          005DE9DC
 005DE9CD    call        @AfterConstruction
 005DE9D2    pop         dword ptr fs:[0]
 005DE9D9    add         esp,0C
 005DE9DC    mov         eax,edi
 005DE9DE    pop         edi
 005DE9DF    pop         esi
 005DE9E0    pop         ebx
 005DE9E1    pop         ecx
 005DE9E2    pop         ebp
 005DE9E3    ret         4
end;*}

//005DE9E8
destructor TJvHidDevice.Destroy();
begin
{*
 005DE9E8    push        ebx
 005DE9E9    push        esi
 005DE9EA    push        edi
 005DE9EB    push        ebp
 005DE9EC    add         esp,0FFFFFFE8
 005DE9EF    call        @BeforeDestruction
 005DE9F4    mov         byte ptr [esp],dl
 005DE9F7    mov         ebx,eax
 005DE9F9    mov         eax,dword ptr [ebx+90];TJvHidDevice.FData:TJvHidDataEvent
 005DE9FF    mov         dword ptr [esp+8],eax
 005DEA03    mov         eax,dword ptr [ebx+94];TJvHidDevice.?f94:dword
 005DEA09    mov         dword ptr [esp+0C],eax
 005DEA0D    mov         eax,dword ptr [ebx+0A0];TJvHidDevice.FUnplug:TJvHidPlugEvent
 005DEA13    mov         dword ptr [esp+10],eax
 005DEA17    mov         eax,dword ptr [ebx+0A4];TJvHidDevice.?fA4:TManagedHidObject
 005DEA1D    mov         dword ptr [esp+14],eax
 005DEA21    push        0
 005DEA23    push        0
 005DEA25    mov         eax,ebx
 005DEA27    call        005DF390
 005DEA2C    xor         eax,eax
 005DEA2E    mov         dword ptr [ebx+0A0],eax;TJvHidDevice.FUnplug:TJvHidPlugEvent
 005DEA34    mov         dword ptr [ebx+0A4],eax;TJvHidDevice.?fA4:TManagedHidObject
 005DEA3A    mov         eax,ebx
 005DEA3C    call        TJvHidDevice.CloseFile
 005DEA41    xor         edx,edx
 005DEA43    mov         eax,ebx
 005DEA45    call        TJvHidDevice.CloseFileEx
 005DEA4A    mov         dl,1
 005DEA4C    mov         eax,ebx
 005DEA4E    call        TJvHidDevice.CloseFileEx
 005DEA53    mov         eax,dword ptr [ebx+5C];TJvHidDevice.FPreparsedData:Pointer
 005DEA56    test        eax,eax
>005DEA58    je          005DEA64
 005DEA5A    push        eax
 005DEA5B    mov         eax,[0078D5C0];^gvar_008160FC
 005DEA60    mov         eax,dword ptr [eax]
 005DEA62    call        eax
 005DEA64    mov         eax,dword ptr [ebx+64];TJvHidDevice.FLanguageStrings:TStringList
 005DEA67    call        TObject.Free
 005DEA6C    mov         eax,dword ptr [ebx+4];TJvHidDevice.FMyController:TJvHidDeviceController
 005DEA6F    test        eax,eax
>005DEA71    je          005DEB30
 005DEA77    mov         esi,eax
 005DEA79    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005DEA7F    mov         ebp,dword ptr [eax+8];TList.FCount:Integer
 005DEA82    dec         ebp
 005DEA83    test        ebp,ebp
>005DEA85    jl          005DEB30
 005DEA8B    inc         ebp
 005DEA8C    xor         edi,edi
 005DEA8E    mov         edx,edi
 005DEA90    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005DEA96    call        TList.Get
 005DEA9B    cmp         ebx,eax
>005DEA9D    jne         005DEB28
 005DEAA3    cmp         byte ptr [ebx+8],0;TJvHidDevice.FIsPluggedIn:Boolean
>005DEAA7    je          005DEB13
 005DEAA9    mov         eax,dword ptr [ebx+4];TJvHidDevice.FMyController:TJvHidDeviceController
 005DEAAC    push        eax
 005DEAAD    mov         ecx,dword ptr [ebx+4C];TJvHidDevice.FPnPInfo:TJvHidPnPInfo
 005DEAB0    mov         dl,1
 005DEAB2    mov         eax,[005DBBB4];TJvHidDevice
 005DEAB7    call        TJvHidDevice.Create;TJvHidDevice.Create
 005DEABC    mov         ebp,eax
 005DEABE    push        dword ptr [esp+0C]
 005DEAC2    push        dword ptr [esp+0C]
 005DEAC6    mov         eax,ebp
 005DEAC8    call        005DF390
 005DEACD    mov         eax,dword ptr [esp+10]
 005DEAD1    mov         dword ptr [ebp+0A0],eax;TJvHidDevice.FUnplug:TJvHidPlugEvent
 005DEAD7    mov         eax,dword ptr [esp+14]
 005DEADB    mov         dword ptr [ebp+0A4],eax;TJvHidDevice.?fA4:TManagedHidObject
 005DEAE1    mov         edx,dword ptr [ebx+70];TJvHidDevice.FThreadSleepTime:Integer
 005DEAE4    mov         eax,ebp
 005DEAE6    call        005DEE10
 005DEAEB    mov         ecx,ebp
 005DEAED    mov         edx,edi
 005DEAEF    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005DEAF5    call        TList.Put
 005DEAFA    xor         eax,eax
 005DEAFC    mov         dword ptr [ebx+4C],eax;TJvHidDevice.FPnPInfo:TJvHidPnPInfo
 005DEAFF    cmp         byte ptr [ebx+9],0;TJvHidDevice.FIsCheckedOut:Boolean
>005DEB03    je          005DEB30
 005DEB05    dec         dword ptr [esi+94];TJvHidDeviceController.FNumCheckedOutDevices:Integer
 005DEB0B    inc         dword ptr [esi+90];TJvHidDeviceController.FNumCheckedInDevices:Integer
>005DEB11    jmp         005DEB30
 005DEB13    mov         edx,edi
 005DEB15    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005DEB1B    call        TList.Delete
 005DEB20    dec         dword ptr [esi+98];TJvHidDeviceController.FNumUnpluggedDevices:Integer
>005DEB26    jmp         005DEB30
 005DEB28    inc         edi
 005DEB29    dec         ebp
>005DEB2A    jne         005DEA8E
 005DEB30    mov         eax,dword ptr [ebx+4C];TJvHidDevice.FPnPInfo:TJvHidPnPInfo
 005DEB33    call        TObject.Free
 005DEB38    movzx       edx,byte ptr [esp]
 005DEB3C    and         dl,0FC
 005DEB3F    mov         eax,ebx
 005DEB41    call        TObject.Destroy
 005DEB46    cmp         byte ptr [esp],0
>005DEB4A    jle         005DEB53
 005DEB4C    mov         eax,ebx
 005DEB4E    call        @ClassDestroy
 005DEB53    add         esp,18
 005DEB56    pop         ebp
 005DEB57    pop         edi
 005DEB58    pop         esi
 005DEB59    pop         ebx
 005DEB5A    ret
*}
end;

//005DEB5C
{*function sub_005DEB5C(?:TJvHidDevice):?;
begin
 005DEB5C    cmp         byte ptr [eax+8],0
>005DEB60    je          005DEB6E
 005DEB62    cmp         byte ptr [eax+9],0
>005DEB66    jne         005DEB71
 005DEB68    cmp         byte ptr [eax+0A],0
>005DEB6C    jne         005DEB71
 005DEB6E    xor         eax,eax
 005DEB70    ret
 005DEB71    mov         al,1
 005DEB73    ret
end;*}

//005DEB74
function TJvHidDevice.OpenFile:Boolean;
begin
{*
 005DEB74    push        ebx
 005DEB75    push        esi
 005DEB76    mov         ebx,eax
 005DEB78    mov         eax,ebx
 005DEB7A    call        005DEB5C
 005DEB7F    test        al,al
>005DEB81    je          005DEC11
 005DEB87    cmp         dword ptr [ebx+0C],0FFFFFFFF;TJvHidDevice.FHidFileHandle:Cardinal
>005DEB8B    jne         005DEC11
 005DEB91    push        0
 005DEB93    push        0
 005DEB95    push        3
 005DEB97    push        0
 005DEB99    push        3
 005DEB9B    push        0C0000000
 005DEBA0    mov         eax,dword ptr [ebx+4C];TJvHidDevice.FPnPInfo:TJvHidPnPInfo
 005DEBA3    mov         eax,dword ptr [eax+8];TJvHidPnPInfo.FDevicePath:string
 005DEBA6    call        @UStrToPWChar
 005DEBAB    push        eax
 005DEBAC    call        kernel32.CreateFileW
 005DEBB1    mov         esi,eax
 005DEBB3    mov         dword ptr [ebx+0C],esi;TJvHidDevice.FHidFileHandle:Cardinal
 005DEBB6    cmp         esi,0FFFFFFFF
 005DEBB9    setne       al
 005DEBBC    mov         byte ptr [ebx+0A8],al;TJvHidDevice.FHasReadWriteAccess:Boolean
 005DEBC2    test        al,al
>005DEBC4    jne         005DEBE6
 005DEBC6    push        0
 005DEBC8    push        0
 005DEBCA    push        3
 005DEBCC    push        0
 005DEBCE    push        3
 005DEBD0    push        0
 005DEBD2    mov         eax,dword ptr [ebx+4C];TJvHidDevice.FPnPInfo:TJvHidPnPInfo
 005DEBD5    mov         eax,dword ptr [eax+8];TJvHidPnPInfo.FDevicePath:string
 005DEBD8    call        @UStrToPWChar
 005DEBDD    push        eax
 005DEBDE    call        kernel32.CreateFileW
 005DEBE3    mov         dword ptr [ebx+0C],eax;TJvHidDevice.FHidFileHandle:Cardinal
 005DEBE6    mov         eax,dword ptr [ebx+0C];TJvHidDevice.FHidFileHandle:Cardinal
 005DEBE9    cmp         eax,0FFFFFFFF
>005DEBEC    je          005DEC11
 005DEBEE    mov         edx,dword ptr [ebx+68];TJvHidDevice.FNumInputBuffers:Integer
 005DEBF1    test        edx,edx
>005DEBF3    je          005DEC00
 005DEBF5    push        edx
 005DEBF6    push        eax
 005DEBF7    mov         eax,[0078CD94];^gvar_00816118
 005DEBFC    mov         eax,dword ptr [eax]
 005DEBFE    call        eax
 005DEC00    lea         eax,[ebx+68];TJvHidDevice.FNumInputBuffers:Integer
 005DEC03    push        eax
 005DEC04    mov         eax,dword ptr [ebx+0C];TJvHidDevice.FHidFileHandle:Cardinal
 005DEC07    push        eax
 005DEC08    mov         eax,[0078D564];^gvar_00816114
 005DEC0D    mov         eax,dword ptr [eax]
 005DEC0F    call        eax
 005DEC11    cmp         dword ptr [ebx+0C],0FFFFFFFF;TJvHidDevice.FHidFileHandle:Cardinal
 005DEC15    setne       al
 005DEC18    pop         esi
 005DEC19    pop         ebx
 005DEC1A    ret
*}
end;

//005DEC1C
function TJvHidDevice.OpenFileEx(Mode:TJvHidOpenExMode):Boolean;
begin
{*
 005DEC1C    push        ebx
 005DEC1D    push        esi
 005DEC1E    push        ecx
 005DEC1F    mov         byte ptr [esp],dl
 005DEC22    mov         esi,eax
 005DEC24    xor         ebx,ebx
 005DEC26    mov         eax,esi
 005DEC28    call        005DEB5C
 005DEC2D    test        al,al
>005DEC2F    je          005DECCD
 005DEC35    cmp         byte ptr [esp],0
>005DEC39    jne         005DEC9A
 005DEC3B    cmp         dword ptr [esi+10],0FFFFFFFF;TJvHidDevice.FHidOverlappedRead:Cardinal
>005DEC3F    jne         005DEC91
 005DEC41    push        0
 005DEC43    push        40000000
 005DEC48    push        3
 005DEC4A    push        0
 005DEC4C    push        3
 005DEC4E    push        80000000
 005DEC53    mov         eax,dword ptr [esi+4C];TJvHidDevice.FPnPInfo:TJvHidPnPInfo
 005DEC56    mov         eax,dword ptr [eax+8];TJvHidPnPInfo.FDevicePath:string
 005DEC59    call        @UStrToPWChar
 005DEC5E    push        eax
 005DEC5F    call        kernel32.CreateFileW
 005DEC64    mov         ebx,eax
 005DEC66    mov         dword ptr [esi+10],ebx;TJvHidDevice.FHidOverlappedRead:Cardinal
 005DEC69    cmp         ebx,0FFFFFFFF
>005DEC6C    je          005DEC91
 005DEC6E    mov         eax,dword ptr [esi+6C];TJvHidDevice.FNumOverlappedBuffers:Integer
 005DEC71    test        eax,eax
>005DEC73    je          005DEC80
 005DEC75    push        eax
 005DEC76    push        ebx
 005DEC77    mov         eax,[0078CD94];^gvar_00816118
 005DEC7C    mov         eax,dword ptr [eax]
 005DEC7E    call        eax
 005DEC80    lea         eax,[esi+6C];TJvHidDevice.FNumOverlappedBuffers:Integer
 005DEC83    push        eax
 005DEC84    mov         eax,dword ptr [esi+10];TJvHidDevice.FHidOverlappedRead:Cardinal
 005DEC87    push        eax
 005DEC88    mov         eax,[0078D564];^gvar_00816114
 005DEC8D    mov         eax,dword ptr [eax]
 005DEC8F    call        eax
 005DEC91    cmp         dword ptr [esi+10],0FFFFFFFF;TJvHidDevice.FHidOverlappedRead:Cardinal
 005DEC95    setne       bl
>005DEC98    jmp         005DECCD
 005DEC9A    cmp         dword ptr [esi+14],0FFFFFFFF;TJvHidDevice.FHidOverlappedWrite:Cardinal
>005DEC9E    jne         005DECC6
 005DECA0    push        0
 005DECA2    push        40000000
 005DECA7    push        3
 005DECA9    push        0
 005DECAB    push        3
 005DECAD    push        40000000
 005DECB2    mov         eax,dword ptr [esi+4C];TJvHidDevice.FPnPInfo:TJvHidPnPInfo
 005DECB5    mov         eax,dword ptr [eax+8];TJvHidPnPInfo.FDevicePath:string
 005DECB8    call        @UStrToPWChar
 005DECBD    push        eax
 005DECBE    call        kernel32.CreateFileW
 005DECC3    mov         dword ptr [esi+14],eax;TJvHidDevice.FHidOverlappedWrite:Cardinal
 005DECC6    cmp         dword ptr [esi+14],0FFFFFFFF;TJvHidDevice.FHidOverlappedWrite:Cardinal
 005DECCA    setne       bl
 005DECCD    mov         eax,ebx
 005DECCF    pop         edx
 005DECD0    pop         esi
 005DECD1    pop         ebx
 005DECD2    ret
*}
end;

//005DECD4
procedure sub_005DECD4(?:Pointer);
begin
{*
 005DECD4    push        ebx
 005DECD5    mov         ebx,eax
 005DECD7    mov         eax,ebx
 005DECD9    call        TJvHidDevice.CloseFile
 005DECDE    xor         edx,edx
 005DECE0    mov         eax,ebx
 005DECE2    call        TJvHidDevice.CloseFileEx
 005DECE7    mov         dl,1
 005DECE9    mov         eax,ebx
 005DECEB    call        TJvHidDevice.CloseFileEx
 005DECF0    mov         byte ptr [ebx+8],0
 005DECF4    cmp         word ptr [ebx+0A2],0
>005DECFC    je          005DED0C
 005DECFE    mov         edx,ebx
 005DED00    mov         eax,dword ptr [ebx+0A4]
 005DED06    call        dword ptr [ebx+0A0]
 005DED0C    xor         eax,eax
 005DED0E    mov         dword ptr [ebx+0A0],eax
 005DED14    mov         dword ptr [ebx+0A4],eax
 005DED1A    pop         ebx
 005DED1B    ret
*}
end;

//005DED90
{*procedure sub_005DED90(?:?);
begin
 005DED90    push        ebx
 005DED91    mov         ebx,eax
 005DED93    mov         eax,ebx
 005DED95    call        005DEB5C
 005DED9A    test        al,al
>005DED9C    je          005DEE02
 005DED9E    mov         eax,ebx
 005DEDA0    call        005DEE68
 005DEDA5    push        eax
 005DEDA6    mov         eax,dword ptr [ebx+84]
 005DEDAC    push        eax
 005DEDAD    mov         eax,[0078CBCC];^gvar_00816154
 005DEDB2    mov         eax,dword ptr [eax]
 005DEDB4    call        eax
 005DEDB6    mov         dword ptr [ebx+78],eax
 005DEDB9    mov         eax,ebx
 005DEDBB    call        005DEE68
 005DEDC0    push        eax
 005DEDC1    movzx       eax,word ptr [ebx+88]
 005DEDC8    push        eax
 005DEDC9    mov         eax,dword ptr [ebx+84]
 005DEDCF    push        eax
 005DEDD0    mov         eax,[0078CBF4];^gvar_00816178
 005DEDD5    mov         eax,dword ptr [eax]
 005DEDD7    call        eax
 005DEDD9    mov         dword ptr [ebx+7C],eax
 005DEDDC    mov         eax,ebx
 005DEDDE    call        005DEE68
 005DEDE3    push        eax
 005DEDE4    movzx       eax,word ptr [ebx+88]
 005DEDEB    push        eax
 005DEDEC    mov         eax,dword ptr [ebx+84]
 005DEDF2    push        eax
 005DEDF3    mov         eax,[0078CB54];^gvar_0081617C
 005DEDF8    mov         eax,dword ptr [eax]
 005DEDFA    call        eax
 005DEDFC    mov         dword ptr [ebx+80],eax
 005DEE02    pop         ebx
 005DEE03    ret
end;*}

//005DEE04
{*procedure sub_005DEE04(?:?; ?:?);
begin
 005DEE04    mov         dword ptr [eax+84],edx
 005DEE0A    call        005DED90
 005DEE0F    ret
end;*}

//005DEE10
procedure sub_005DEE10(?:TJvHidDevice; ?:Integer);
begin
{*
 005DEE10    cmp         edx,0A
>005DEE13    jl          005DEE20
 005DEE15    cmp         edx,2710
>005DEE1B    jg          005DEE20
 005DEE1D    mov         dword ptr [eax+70],edx;TJvHidDevice.FThreadSleepTime:Integer
 005DEE20    ret
*}
end;

//005DEE68
{*function sub_005DEE68(?:TJvHidDevice):?;
begin
 005DEE68    push        ebx
 005DEE69    mov         ebx,eax
 005DEE6B    cmp         dword ptr [ebx+5C],0
>005DEE6F    jne         005DEE94
 005DEE71    mov         eax,ebx
 005DEE73    call        TJvHidDevice.OpenFile
 005DEE78    test        al,al
>005DEE7A    je          005DEE94
 005DEE7C    lea         eax,[ebx+5C]
 005DEE7F    push        eax
 005DEE80    mov         eax,dword ptr [ebx+0C]
 005DEE83    push        eax
 005DEE84    mov         eax,[0078DB34];^gvar_008160F8
 005DEE89    mov         eax,dword ptr [eax]
 005DEE8B    call        eax
 005DEE8D    mov         eax,ebx
 005DEE8F    call        TJvHidDevice.CloseFile
 005DEE94    mov         eax,dword ptr [ebx+5C]
 005DEE97    pop         ebx
 005DEE98    ret
end;*}

//005DEE9C
{*procedure sub_005DEE9C(?:TJvHidDevice; ?:?);
begin
 005DEE9C    push        ebx
 005DEE9D    push        esi
 005DEE9E    mov         esi,edx
 005DEEA0    mov         ebx,eax
 005DEEA2    mov         eax,esi
 005DEEA4    xor         ecx,ecx
 005DEEA6    mov         edx,40
 005DEEAB    call        @FillChar
 005DEEB0    push        esi
 005DEEB1    mov         eax,ebx
 005DEEB3    call        005DEE68
 005DEEB8    push        eax
 005DEEB9    mov         eax,[0078D158];^gvar_0081613C
 005DEEBE    mov         eax,dword ptr [eax]
 005DEEC0    call        eax
 005DEEC2    pop         esi
 005DEEC3    pop         ebx
 005DEEC4    ret
end;*}

//005DEEC8
{*procedure sub_005DEEC8(?:Pointer; ?:?);
begin
 005DEEC8    push        ebx
 005DEEC9    push        esi
 005DEECA    add         esp,0FFFFFE04
 005DEED0    mov         esi,edx
 005DEED2    mov         ebx,eax
 005DEED4    mov         eax,dword ptr [ebx+50]
 005DEED7    xor         edx,edx
 005DEED9    call        @WStrEqual
>005DEEDE    jne         005DEF2A
 005DEEE0    mov         eax,ebx
 005DEEE2    call        TJvHidDevice.OpenFile
 005DEEE7    test        al,al
>005DEEE9    je          005DEF2A
 005DEEEB    mov         eax,esp
 005DEEED    xor         ecx,ecx
 005DEEEF    mov         edx,1FC
 005DEEF4    call        @FillChar
 005DEEF9    push        1FC
 005DEEFE    lea         eax,[esp+4]
 005DEF02    push        eax
 005DEF03    mov         eax,dword ptr [ebx+0C]
 005DEF06    push        eax
 005DEF07    mov         eax,[0078D438];^gvar_00816120
 005DEF0C    mov         eax,dword ptr [eax]
 005DEF0E    call        eax
 005DEF10    test        eax,eax
>005DEF12    je          005DEF23
 005DEF14    lea         eax,[ebx+50]
 005DEF17    mov         edx,esp
 005DEF19    mov         ecx,0FE
 005DEF1E    call        @WStrFromWArray
 005DEF23    mov         eax,ebx
 005DEF25    call        TJvHidDevice.CloseFile
 005DEF2A    mov         eax,esi
 005DEF2C    mov         edx,dword ptr [ebx+50]
 005DEF2F    call        @WStrAsg
 005DEF34    add         esp,1FC
 005DEF3A    pop         esi
 005DEF3B    pop         ebx
 005DEF3C    ret
end;*}

//005DEF40
{*procedure sub_005DEF40(?:Pointer; ?:?);
begin
 005DEF40    push        ebx
 005DEF41    push        esi
 005DEF42    add         esp,0FFFFFE04
 005DEF48    mov         esi,edx
 005DEF4A    mov         ebx,eax
 005DEF4C    mov         eax,dword ptr [ebx+54]
 005DEF4F    xor         edx,edx
 005DEF51    call        @WStrEqual
>005DEF56    jne         005DEFA2
 005DEF58    mov         eax,ebx
 005DEF5A    call        TJvHidDevice.OpenFile
 005DEF5F    test        al,al
>005DEF61    je          005DEFA2
 005DEF63    mov         eax,esp
 005DEF65    xor         ecx,ecx
 005DEF67    mov         edx,1FC
 005DEF6C    call        @FillChar
 005DEF71    push        1FC
 005DEF76    lea         eax,[esp+4]
 005DEF7A    push        eax
 005DEF7B    mov         eax,dword ptr [ebx+0C]
 005DEF7E    push        eax
 005DEF7F    mov         eax,[0078D770];^gvar_00816124
 005DEF84    mov         eax,dword ptr [eax]
 005DEF86    call        eax
 005DEF88    test        eax,eax
>005DEF8A    je          005DEF9B
 005DEF8C    lea         eax,[ebx+54]
 005DEF8F    mov         edx,esp
 005DEF91    mov         ecx,0FE
 005DEF96    call        @WStrFromWArray
 005DEF9B    mov         eax,ebx
 005DEF9D    call        TJvHidDevice.CloseFile
 005DEFA2    mov         eax,esi
 005DEFA4    mov         edx,dword ptr [ebx+54]
 005DEFA7    call        @WStrAsg
 005DEFAC    add         esp,1FC
 005DEFB2    pop         esi
 005DEFB3    pop         ebx
 005DEFB4    ret
end;*}

//005DEFB8
{*procedure sub_005DEFB8(?:TJvHidDevice; ?:?);
begin
 005DEFB8    push        ebx
 005DEFB9    push        esi
 005DEFBA    push        edi
 005DEFBB    add         esp,0FFFFFC04
 005DEFC1    mov         dword ptr [esp],edx
 005DEFC4    mov         ebx,eax
 005DEFC6    mov         eax,dword ptr [ebx+60]
 005DEFC9    xor         edx,edx
 005DEFCB    call        @WStrEqual
>005DEFD0    jne         005DF0B4
 005DEFD6    mov         eax,ebx
 005DEFD8    call        TJvHidDevice.OpenFile
 005DEFDD    test        al,al
>005DEFDF    je          005DF0B4
 005DEFE5    lea         eax,[esp+200]
 005DEFEC    xor         ecx,ecx
 005DEFEE    mov         edx,1FC
 005DEFF3    call        @FillChar
 005DEFF8    push        1FC
 005DEFFD    lea         eax,[esp+204]
 005DF004    push        eax
 005DF005    mov         eax,dword ptr [ebx+0C]
 005DF008    push        eax
 005DF009    mov         eax,[0078D608];^gvar_00816128
 005DF00E    mov         eax,dword ptr [eax]
 005DF010    call        eax
 005DF012    test        eax,eax
>005DF014    je          005DF0AD
 005DF01A    lea         eax,[esp+4]
 005DF01E    mov         ecx,0FF
 005DF023    mov         edx,1FC
 005DF028    call        @FillChar
 005DF02D    xor         esi,esi
 005DF02F    push        1FC
 005DF034    lea         eax,[esp+8]
 005DF038    push        eax
 005DF039    push        0
 005DF03B    mov         eax,dword ptr [ebx+0C]
 005DF03E    push        eax
 005DF03F    mov         eax,[0078DB24];^gvar_00816130
 005DF044    mov         eax,dword ptr [eax]
 005DF046    call        eax
 005DF048    mov         edi,0FD
 005DF04D    lea         eax,[esp+1FE]
 005DF054    movzx       edx,word ptr [eax]
 005DF057    cmp         dx,0FFFF
>005DF05C    je          005DF06C
 005DF05E    test        dx,dx
>005DF061    jne         005DF067
 005DF063    mov         esi,edi
>005DF065    jmp         005DF075
 005DF067    lea         esi,[edi+1]
>005DF06A    jmp         005DF075
 005DF06C    dec         edi
 005DF06D    sub         eax,2
 005DF070    cmp         edi,0FFFFFFFF
>005DF073    jne         005DF054
 005DF075    dec         esi
 005DF076    test        esi,esi
>005DF078    jl          005DF0AD
 005DF07A    inc         esi
 005DF07B    lea         eax,[esp+4]
 005DF07F    lea         edx,[esp+200]
 005DF086    movzx       ecx,word ptr [eax]
 005DF089    cmp         cx,word ptr [edx]
>005DF08C    je          005DF0A4
 005DF08E    lea         eax,[ebx+60]
 005DF091    lea         edx,[esp+200]
 005DF098    mov         ecx,0FE
 005DF09D    call        @WStrFromWArray
>005DF0A2    jmp         005DF0AD
 005DF0A4    add         edx,2
 005DF0A7    add         eax,2
 005DF0AA    dec         esi
>005DF0AB    jne         005DF086
 005DF0AD    mov         eax,ebx
 005DF0AF    call        TJvHidDevice.CloseFile
 005DF0B4    mov         eax,dword ptr [esp]
 005DF0B7    mov         edx,dword ptr [ebx+60]
 005DF0BA    call        @WStrAsg
 005DF0BF    add         esp,3FC
 005DF0C5    pop         edi
 005DF0C6    pop         esi
 005DF0C7    pop         ebx
 005DF0C8    ret
end;*}

//005DF304
{*function sub_005DF304(?:TJvHidDevice):?;
begin
 005DF304    push        ebx
 005DF305    push        esi
 005DF306    push        ecx
 005DF307    mov         ebx,eax
 005DF309    xor         eax,eax
 005DF30B    mov         dword ptr [esp],eax
 005DF30E    mov         esi,dword ptr [ebx+10];TJvHidDevice.FHidOverlappedRead:Cardinal
 005DF311    cmp         esi,0FFFFFFFF
>005DF314    je          005DF330
 005DF316    push        0
 005DF318    lea         eax,[esp+4]
 005DF31C    push        eax
 005DF31D    lea         eax,[ebx+18];TJvHidDevice.FOvlRead:_OVERLAPPED
 005DF320    push        eax
 005DF321    push        esi
 005DF322    call        kernel32.GetOverlappedResult
 005DF327    test        eax,eax
>005DF329    jne         005DF330
 005DF32B    xor         eax,eax
 005DF32D    mov         dword ptr [esp],eax
 005DF330    mov         eax,dword ptr [esp]
 005DF333    pop         edx
 005DF334    pop         esi
 005DF335    pop         ebx
 005DF336    ret
end;*}

//005DF390
{*procedure sub_005DF390(?:TJvHidDevice; ?:?; ?:?; ?:?);
begin
 005DF390    push        ebp
 005DF391    mov         ebp,esp
 005DF393    push        ebx
 005DF394    mov         ebx,eax
 005DF396    cmp         word ptr [ebp+0A],0
>005DF39B    jne         005DF3A4
 005DF39D    mov         eax,ebx
 005DF39F    call        005DF408
 005DF3A4    mov         eax,dword ptr [ebp+8]
 005DF3A7    mov         dword ptr [ebx+90],eax;TJvHidDevice.FData:TJvHidDataEvent
 005DF3AD    mov         eax,dword ptr [ebp+0C]
 005DF3B0    mov         dword ptr [ebx+94],eax;TJvHidDevice.?f94:dword
 005DF3B6    mov         eax,ebx
 005DF3B8    call        005DF3C4
 005DF3BD    pop         ebx
 005DF3BE    pop         ebp
 005DF3BF    ret         8
end;*}

//005DF3C4
procedure sub_005DF3C4(?:TJvHidDevice);
begin
{*
 005DF3C4    push        ebx
 005DF3C5    mov         ebx,eax
 005DF3C7    cmp         word ptr [ebx+92],0;TJvHidDevice.?f92:word
>005DF3CF    je          005DF403
 005DF3D1    cmp         byte ptr [ebx+8],0;TJvHidDevice.FIsPluggedIn:Boolean
>005DF3D5    je          005DF403
 005DF3D7    cmp         byte ptr [ebx+9],0;TJvHidDevice.FIsCheckedOut:Boolean
>005DF3DB    je          005DF403
 005DF3DD    cmp         byte ptr [ebx+0A8],0;TJvHidDevice.FHasReadWriteAccess:Boolean
>005DF3E4    je          005DF403
 005DF3E6    cmp         dword ptr [ebx+0AC],0;TJvHidDevice.FDataThread:TJvHidDeviceReadThread
>005DF3ED    jne         005DF403
 005DF3EF    mov         ecx,ebx
 005DF3F1    mov         dl,1
 005DF3F3    mov         eax,[005DB9D4];TJvHidDeviceReadThread
 005DF3F8    call        TJvHidDeviceReadThread.Create;TJvHidDeviceReadThread.Create
 005DF3FD    mov         dword ptr [ebx+0AC],eax;TJvHidDevice.FDataThread:TJvHidDeviceReadThread
 005DF403    pop         ebx
 005DF404    ret
*}
end;

//005DF408
procedure sub_005DF408(?:TJvHidDevice);
begin
{*
 005DF408    push        ebx
 005DF409    mov         ebx,eax
 005DF40B    mov         eax,dword ptr [ebx+0AC];TJvHidDevice.FDataThread:TJvHidDeviceReadThread
 005DF411    test        eax,eax
>005DF413    je          005DF438
 005DF415    call        TThread.Terminate
 005DF41A    mov         eax,dword ptr [ebx+0AC];TJvHidDevice.FDataThread:TJvHidDeviceReadThread
 005DF420    call        TThread.WaitFor
 005DF425    mov         eax,dword ptr [ebx+0AC];TJvHidDevice.FDataThread:TJvHidDeviceReadThread
 005DF42B    call        TObject.Free
 005DF430    xor         eax,eax
 005DF432    mov         dword ptr [ebx+0AC],eax;TJvHidDevice.FDataThread:TJvHidDeviceReadThread
 005DF438    pop         ebx
 005DF439    ret
*}
end;

//005DF43C
{*function sub_005DF43C(?:Cardinal):?;
begin
 005DF43C    push        ebp
 005DF43D    mov         ebp,esp
 005DF43F    push        ecx
 005DF440    push        ebx
 005DF441    push        esi
 005DF442    push        edi
 005DF443    mov         dword ptr [ebp-4],eax
 005DF446    push        5DF488;'kernel32.dll'
 005DF44B    call        kernel32.GetModuleHandleW
 005DF450    mov         ebx,eax
 005DF452    cmp         ebx,0FFFFFFFF
 005DF455    setne       al
 005DF458    test        al,al
>005DF45A    je          005DF47F
 005DF45C    push        5DF4A4;'CancelIO'
 005DF461    push        ebx
 005DF462    call        GetProcAddress
 005DF467    mov         edi,eax
 005DF469    mov         esi,edi
 005DF46B    test        edi,edi
>005DF46D    je          005DF47D
 005DF46F    mov         eax,dword ptr [ebp-4]
 005DF472    push        eax
 005DF473    call        esi
 005DF475    cmp         eax,1
 005DF478    sbb         eax,eax
 005DF47A    inc         eax
>005DF47B    jmp         005DF47F
 005DF47D    xor         eax,eax
 005DF47F    pop         edi
 005DF480    pop         esi
 005DF481    pop         ebx
 005DF482    pop         ecx
 005DF483    pop         ebp
 005DF484    ret
end;*}

//005DF4B8
function TJvHidDevice.CancelIO(Mode:TJvHidOpenExMode):Boolean;
begin
{*
 005DF4B8    xor         ecx,ecx
 005DF4BA    test        dl,dl
>005DF4BC    jne         005DF4D1
 005DF4BE    cmp         dword ptr [eax+10],0FFFFFFFF;TJvHidDevice.FHidOverlappedRead:Cardinal
>005DF4C2    je          005DF4D1
 005DF4C4    mov         eax,dword ptr [eax+10];TJvHidDevice.FHidOverlappedRead:Cardinal
 005DF4C7    call        005DF43C
 005DF4CC    mov         ecx,eax
 005DF4CE    mov         eax,ecx
 005DF4D0    ret
 005DF4D1    cmp         dl,1
>005DF4D4    jne         005DF4E6
 005DF4D6    cmp         dword ptr [eax+14],0FFFFFFFF;TJvHidDevice.FHidOverlappedWrite:Cardinal
>005DF4DA    je          005DF4E6
 005DF4DC    mov         eax,dword ptr [eax+14];TJvHidDevice.FHidOverlappedWrite:Cardinal
 005DF4DF    call        005DF43C
 005DF4E4    mov         ecx,eax
 005DF4E6    mov         eax,ecx
 005DF4E8    ret
*}
end;

//005DF4EC
procedure TJvHidDevice.CloseFile;
begin
{*
 005DF4EC    push        ebx
 005DF4ED    mov         ebx,eax
 005DF4EF    mov         eax,dword ptr [ebx+0C];TJvHidDevice.FHidFileHandle:Cardinal
 005DF4F2    cmp         eax,0FFFFFFFF
>005DF4F5    je          005DF4FD
 005DF4F7    push        eax
 005DF4F8    call        kernel32.CloseHandle
 005DF4FD    xor         eax,eax
 005DF4FF    mov         dword ptr [ebx+68],eax;TJvHidDevice.FNumInputBuffers:Integer
 005DF502    mov         dword ptr [ebx+0C],0FFFFFFFF;TJvHidDevice.FHidFileHandle:Cardinal
 005DF509    pop         ebx
 005DF50A    ret
*}
end;

//005DF50C
procedure TJvHidDevice.CloseFileEx(Mode:TJvHidOpenExMode);
begin
{*
 005DF50C    push        ebx
 005DF50D    mov         ebx,eax
 005DF50F    test        dl,dl
>005DF511    jne         005DF52F
 005DF513    mov         eax,dword ptr [ebx+10];TJvHidDevice.FHidOverlappedRead:Cardinal
 005DF516    cmp         eax,0FFFFFFFF
>005DF519    je          005DF521
 005DF51B    push        eax
 005DF51C    call        kernel32.CloseHandle
 005DF521    xor         eax,eax
 005DF523    mov         dword ptr [ebx+6C],eax;TJvHidDevice.FNumOverlappedBuffers:Integer
 005DF526    mov         dword ptr [ebx+10],0FFFFFFFF;TJvHidDevice.FHidOverlappedRead:Cardinal
 005DF52D    pop         ebx
 005DF52E    ret
 005DF52F    mov         eax,dword ptr [ebx+14];TJvHidDevice.FHidOverlappedWrite:Cardinal
 005DF532    cmp         eax,0FFFFFFFF
>005DF535    je          005DF53D
 005DF537    push        eax
 005DF538    call        kernel32.CloseHandle
 005DF53D    mov         dword ptr [ebx+14],0FFFFFFFF;TJvHidDevice.FHidOverlappedWrite:Cardinal
 005DF544    pop         ebx
 005DF545    ret
*}
end;

//005DF548
function TJvHidDevice.FlushQueue:Boolean;
begin
{*
 005DF548    push        ebx
 005DF549    push        esi
 005DF54A    mov         esi,eax
 005DF54C    xor         ebx,ebx
 005DF54E    mov         eax,esi
 005DF550    call        TJvHidDevice.OpenFile
 005DF555    test        al,al
>005DF557    je          005DF56C
 005DF559    mov         eax,dword ptr [esi+0C];TJvHidDevice.FHidFileHandle:Cardinal
 005DF55C    push        eax
 005DF55D    mov         eax,[0078DAE4];^gvar_00816108
 005DF562    mov         eax,dword ptr [eax]
 005DF564    call        eax
 005DF566    cmp         eax,1
 005DF569    sbb         ebx,ebx
 005DF56B    inc         ebx
 005DF56C    mov         eax,ebx
 005DF56E    pop         esi
 005DF56F    pop         ebx
 005DF570    ret
*}
end;

//005DF574
{*function TJvHidDevice.GetFeature(var Report:?; Size:Integer):Boolean;
begin
 005DF574    push        ebx
 005DF575    push        esi
 005DF576    push        edi
 005DF577    push        ebp
 005DF578    mov         ebp,ecx
 005DF57A    mov         edi,edx
 005DF57C    mov         esi,eax
 005DF57E    xor         ebx,ebx
 005DF580    mov         eax,esi
 005DF582    call        TJvHidDevice.OpenFile
 005DF587    test        al,al
>005DF589    je          005DF5A0
 005DF58B    push        ebp
 005DF58C    push        edi
 005DF58D    mov         eax,dword ptr [esi+0C];TJvHidDevice.FHidFileHandle:Cardinal
 005DF590    push        eax
 005DF591    mov         eax,[0078D434];^gvar_0081610C
 005DF596    mov         eax,dword ptr [eax]
 005DF598    call        eax
 005DF59A    cmp         eax,1
 005DF59D    sbb         ebx,ebx
 005DF59F    inc         ebx
 005DF5A0    mov         eax,ebx
 005DF5A2    pop         ebp
 005DF5A3    pop         edi
 005DF5A4    pop         esi
 005DF5A5    pop         ebx
 005DF5A6    ret
end;*}

//005DF5A8
{*function TJvHidDevice.SetFeature(var Report:?; Size:Integer):Boolean;
begin
 005DF5A8    push        ebx
 005DF5A9    push        esi
 005DF5AA    push        edi
 005DF5AB    push        ebp
 005DF5AC    mov         ebp,ecx
 005DF5AE    mov         edi,edx
 005DF5B0    mov         esi,eax
 005DF5B2    xor         ebx,ebx
 005DF5B4    mov         eax,esi
 005DF5B6    call        TJvHidDevice.OpenFile
 005DF5BB    test        al,al
>005DF5BD    je          005DF5D4
 005DF5BF    push        ebp
 005DF5C0    push        edi
 005DF5C1    mov         eax,dword ptr [esi+0C];TJvHidDevice.FHidFileHandle:Cardinal
 005DF5C4    push        eax
 005DF5C5    mov         eax,[0078CCAC];^gvar_00816110
 005DF5CA    mov         eax,dword ptr [eax]
 005DF5CC    call        eax
 005DF5CE    cmp         eax,1
 005DF5D1    sbb         ebx,ebx
 005DF5D3    inc         ebx
 005DF5D4    mov         eax,ebx
 005DF5D6    pop         ebp
 005DF5D7    pop         edi
 005DF5D8    pop         esi
 005DF5D9    pop         ebx
 005DF5DA    ret
end;*}

//005DF5DC
function TJvHidDevice.GetSpecificButtonCaps(ButtonCaps:PHIDPButtonCaps; var Count:Word):Integer;
begin
{*
 005DF5DC    push        ebx
 005DF5DD    push        esi
 005DF5DE    push        edi
 005DF5DF    push        ebp
 005DF5E0    mov         ebp,ecx
 005DF5E2    mov         edi,edx
 005DF5E4    mov         ebx,eax
 005DF5E6    mov         esi,80110001
 005DF5EB    mov         eax,ebx
 005DF5ED    call        005DEB5C
 005DF5F2    test        al,al
>005DF5F4    je          005DF62A
 005DF5F6    mov         eax,ebx
 005DF5F8    call        005DEE68
 005DF5FD    push        eax
 005DF5FE    push        ebp
 005DF5FF    push        edi
 005DF600    movzx       eax,word ptr [ebx+8C];TJvHidDevice.FUsageParam:word
 005DF607    push        eax
 005DF608    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DF60F    push        eax
 005DF610    movzx       eax,word ptr [ebx+88];TJvHidDevice.FUsagePageParam:word
 005DF617    push        eax
 005DF618    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DF61E    push        eax
 005DF61F    mov         eax,[0078D1DC];^gvar_00816144
 005DF624    mov         eax,dword ptr [eax]
 005DF626    call        eax
 005DF628    mov         esi,eax
 005DF62A    mov         eax,esi
 005DF62C    pop         ebp
 005DF62D    pop         edi
 005DF62E    pop         esi
 005DF62F    pop         ebx
 005DF630    ret
*}
end;

//005DF634
function TJvHidDevice.GetButtonCaps(ButtonCaps:PHIDPButtonCaps; var Count:Word):Integer;
begin
{*
 005DF634    push        ebx
 005DF635    push        esi
 005DF636    push        edi
 005DF637    push        ebp
 005DF638    mov         ebp,ecx
 005DF63A    mov         edi,edx
 005DF63C    mov         ebx,eax
 005DF63E    mov         esi,80110001
 005DF643    mov         eax,ebx
 005DF645    call        005DEB5C
 005DF64A    test        al,al
>005DF64C    je          005DF667
 005DF64E    mov         eax,ebx
 005DF650    call        005DEE68
 005DF655    push        eax
 005DF656    mov         ecx,ebp
 005DF658    mov         edx,edi
 005DF65A    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DF660    call        005D9F40
 005DF665    mov         esi,eax
 005DF667    mov         eax,esi
 005DF669    pop         ebp
 005DF66A    pop         edi
 005DF66B    pop         esi
 005DF66C    pop         ebx
 005DF66D    ret
*}
end;

//005DF670
function TJvHidDevice.GetSpecificValueCaps(ValueCaps:PHIDPValueCaps; var Count:Word):Integer;
begin
{*
 005DF670    push        ebx
 005DF671    push        esi
 005DF672    push        edi
 005DF673    push        ebp
 005DF674    mov         ebp,ecx
 005DF676    mov         edi,edx
 005DF678    mov         ebx,eax
 005DF67A    mov         esi,80110001
 005DF67F    mov         eax,ebx
 005DF681    call        005DEB5C
 005DF686    test        al,al
>005DF688    je          005DF6BE
 005DF68A    mov         eax,ebx
 005DF68C    call        005DEE68
 005DF691    push        eax
 005DF692    push        ebp
 005DF693    push        edi
 005DF694    movzx       eax,word ptr [ebx+8C];TJvHidDevice.FUsageParam:word
 005DF69B    push        eax
 005DF69C    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DF6A3    push        eax
 005DF6A4    movzx       eax,word ptr [ebx+88];TJvHidDevice.FUsagePageParam:word
 005DF6AB    push        eax
 005DF6AC    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DF6B2    push        eax
 005DF6B3    mov         eax,[0078CF88];^gvar_00816148
 005DF6B8    mov         eax,dword ptr [eax]
 005DF6BA    call        eax
 005DF6BC    mov         esi,eax
 005DF6BE    mov         eax,esi
 005DF6C0    pop         ebp
 005DF6C1    pop         edi
 005DF6C2    pop         esi
 005DF6C3    pop         ebx
 005DF6C4    ret
*}
end;

//005DF6C8
function TJvHidDevice.GetValueCaps(ValueCaps:PHIDPValueCaps; var Count:Word):Integer;
begin
{*
 005DF6C8    push        ebx
 005DF6C9    push        esi
 005DF6CA    push        edi
 005DF6CB    push        ebp
 005DF6CC    mov         ebp,ecx
 005DF6CE    mov         edi,edx
 005DF6D0    mov         ebx,eax
 005DF6D2    mov         esi,80110001
 005DF6D7    mov         eax,ebx
 005DF6D9    call        005DEB5C
 005DF6DE    test        al,al
>005DF6E0    je          005DF6FB
 005DF6E2    mov         eax,ebx
 005DF6E4    call        005DEE68
 005DF6E9    push        eax
 005DF6EA    mov         ecx,ebp
 005DF6EC    mov         edx,edi
 005DF6EE    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DF6F4    call        005D9F5C
 005DF6F9    mov         esi,eax
 005DF6FB    mov         eax,esi
 005DF6FD    pop         ebp
 005DF6FE    pop         edi
 005DF6FF    pop         esi
 005DF700    pop         ebx
 005DF701    ret
*}
end;

//005DF704
{*function TJvHidDevice.GetData(DataList:PHIDPData; var DataLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;
begin
 005DF704    push        ebp
 005DF705    mov         ebp,esp
 005DF707    push        ecx
 005DF708    push        ebx
 005DF709    push        esi
 005DF70A    push        edi
 005DF70B    mov         dword ptr [ebp-4],ecx
 005DF70E    mov         edi,edx
 005DF710    mov         ebx,eax
 005DF712    mov         esi,80110001
 005DF717    mov         eax,ebx
 005DF719    call        005DEB5C
 005DF71E    test        al,al
>005DF720    je          005DF749
 005DF722    mov         eax,dword ptr [ebp+8]
 005DF725    push        eax
 005DF726    mov         eax,dword ptr [ebp+0C]
 005DF729    push        eax
 005DF72A    mov         eax,ebx
 005DF72C    call        005DEE68
 005DF731    push        eax
 005DF732    mov         eax,dword ptr [ebp-4]
 005DF735    push        eax
 005DF736    push        edi
 005DF737    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DF73D    push        eax
 005DF73E    mov         eax,[0078CC28];^gvar_0081614C
 005DF743    mov         eax,dword ptr [eax]
 005DF745    call        eax
 005DF747    mov         esi,eax
 005DF749    mov         eax,esi
 005DF74B    pop         edi
 005DF74C    pop         esi
 005DF74D    pop         ebx
 005DF74E    pop         ecx
 005DF74F    pop         ebp
 005DF750    ret         8
end;*}

//005DF754
{*function TJvHidDevice.SetData(DataList:PHIDPData; var DataLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;
begin
 005DF754    push        ebp
 005DF755    mov         ebp,esp
 005DF757    push        ecx
 005DF758    push        ebx
 005DF759    push        esi
 005DF75A    push        edi
 005DF75B    mov         dword ptr [ebp-4],ecx
 005DF75E    mov         edi,edx
 005DF760    mov         ebx,eax
 005DF762    mov         esi,80110001
 005DF767    mov         eax,ebx
 005DF769    call        005DEB5C
 005DF76E    test        al,al
>005DF770    je          005DF799
 005DF772    mov         eax,dword ptr [ebp+8]
 005DF775    push        eax
 005DF776    mov         eax,dword ptr [ebp+0C]
 005DF779    push        eax
 005DF77A    mov         eax,ebx
 005DF77C    call        005DEE68
 005DF781    push        eax
 005DF782    mov         eax,dword ptr [ebp-4]
 005DF785    push        eax
 005DF786    push        edi
 005DF787    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DF78D    push        eax
 005DF78E    mov         eax,[0078D4D8];^gvar_00816150
 005DF793    mov         eax,dword ptr [eax]
 005DF795    call        eax
 005DF797    mov         esi,eax
 005DF799    mov         eax,esi
 005DF79B    pop         edi
 005DF79C    pop         esi
 005DF79D    pop         ebx
 005DF79E    pop         ecx
 005DF79F    pop         ebp
 005DF7A0    ret         8
end;*}

//005DF7A4
{*function TJvHidDevice.GetUsages(UsageList:PUsage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;
begin
 005DF7A4    push        ebp
 005DF7A5    mov         ebp,esp
 005DF7A7    push        ecx
 005DF7A8    push        ebx
 005DF7A9    push        esi
 005DF7AA    push        edi
 005DF7AB    mov         dword ptr [ebp-4],ecx
 005DF7AE    mov         edi,edx
 005DF7B0    mov         ebx,eax
 005DF7B2    mov         esi,80110001
 005DF7B7    mov         eax,ebx
 005DF7B9    call        005DEB5C
 005DF7BE    test        al,al
>005DF7C0    je          005DF7F9
 005DF7C2    mov         eax,dword ptr [ebp+8]
 005DF7C5    push        eax
 005DF7C6    mov         eax,dword ptr [ebp+0C]
 005DF7C9    push        eax
 005DF7CA    mov         eax,ebx
 005DF7CC    call        005DEE68
 005DF7D1    push        eax
 005DF7D2    mov         eax,dword ptr [ebp-4]
 005DF7D5    push        eax
 005DF7D6    push        edi
 005DF7D7    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DF7DE    push        eax
 005DF7DF    movzx       eax,word ptr [ebx+88];TJvHidDevice.FUsagePageParam:word
 005DF7E6    push        eax
 005DF7E7    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DF7ED    push        eax
 005DF7EE    mov         eax,[0078D620];^gvar_00816158
 005DF7F3    mov         eax,dword ptr [eax]
 005DF7F5    call        eax
 005DF7F7    mov         esi,eax
 005DF7F9    mov         eax,esi
 005DF7FB    pop         edi
 005DF7FC    pop         esi
 005DF7FD    pop         ebx
 005DF7FE    pop         ecx
 005DF7FF    pop         ebp
 005DF800    ret         8
end;*}

//005DF804
{*function TJvHidDevice.GetButtons(UsageList:PUsage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;
begin
 005DF804    push        ebp
 005DF805    mov         ebp,esp
 005DF807    push        ecx
 005DF808    push        ebx
 005DF809    push        esi
 005DF80A    push        edi
 005DF80B    mov         dword ptr [ebp-4],ecx
 005DF80E    mov         edi,edx
 005DF810    mov         ebx,eax
 005DF812    mov         esi,80110001
 005DF817    mov         eax,ebx
 005DF819    call        005DEB5C
 005DF81E    test        al,al
>005DF820    je          005DF859
 005DF822    mov         eax,dword ptr [ebp+8]
 005DF825    push        eax
 005DF826    mov         eax,dword ptr [ebp+0C]
 005DF829    push        eax
 005DF82A    mov         eax,ebx
 005DF82C    call        005DEE68
 005DF831    push        eax
 005DF832    mov         eax,dword ptr [ebp-4]
 005DF835    push        eax
 005DF836    push        edi
 005DF837    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DF83E    push        eax
 005DF83F    movzx       eax,word ptr [ebx+88];TJvHidDevice.FUsagePageParam:word
 005DF846    push        eax
 005DF847    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DF84D    push        eax
 005DF84E    mov         eax,[0078D598];^gvar_0081615C
 005DF853    mov         eax,dword ptr [eax]
 005DF855    call        eax
 005DF857    mov         esi,eax
 005DF859    mov         eax,esi
 005DF85B    pop         edi
 005DF85C    pop         esi
 005DF85D    pop         ebx
 005DF85E    pop         ecx
 005DF85F    pop         ebp
 005DF860    ret         8
end;*}

//005DF864
{*function TJvHidDevice.GetUsagesEx(UsageList:PUsageAndPage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;
begin
 005DF864    push        ebp
 005DF865    mov         ebp,esp
 005DF867    push        ecx
 005DF868    push        ebx
 005DF869    push        esi
 005DF86A    push        edi
 005DF86B    mov         dword ptr [ebp-4],ecx
 005DF86E    mov         edi,edx
 005DF870    mov         ebx,eax
 005DF872    mov         esi,80110001
 005DF877    mov         eax,ebx
 005DF879    call        005DEB5C
 005DF87E    test        al,al
>005DF880    je          005DF8B1
 005DF882    mov         eax,dword ptr [ebp+8]
 005DF885    push        eax
 005DF886    mov         eax,dword ptr [ebp+0C]
 005DF889    push        eax
 005DF88A    mov         eax,ebx
 005DF88C    call        005DEE68
 005DF891    push        eax
 005DF892    mov         eax,dword ptr [ebp-4]
 005DF895    push        eax
 005DF896    push        edi
 005DF897    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DF89E    push        eax
 005DF89F    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DF8A5    push        eax
 005DF8A6    mov         eax,[0078D9D4];^gvar_00816160
 005DF8AB    mov         eax,dword ptr [eax]
 005DF8AD    call        eax
 005DF8AF    mov         esi,eax
 005DF8B1    mov         eax,esi
 005DF8B3    pop         edi
 005DF8B4    pop         esi
 005DF8B5    pop         ebx
 005DF8B6    pop         ecx
 005DF8B7    pop         ebp
 005DF8B8    ret         8
end;*}

//005DF8BC
{*function TJvHidDevice.GetButtonsEx(UsageList:PUsageAndPage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;
begin
 005DF8BC    push        ebp
 005DF8BD    mov         ebp,esp
 005DF8BF    push        ecx
 005DF8C0    push        ebx
 005DF8C1    push        esi
 005DF8C2    push        edi
 005DF8C3    mov         dword ptr [ebp-4],ecx
 005DF8C6    mov         edi,edx
 005DF8C8    mov         ebx,eax
 005DF8CA    mov         esi,80110001
 005DF8CF    mov         eax,ebx
 005DF8D1    call        005DEB5C
 005DF8D6    test        al,al
>005DF8D8    je          005DF909
 005DF8DA    mov         eax,dword ptr [ebp+8]
 005DF8DD    push        eax
 005DF8DE    mov         eax,dword ptr [ebp+0C]
 005DF8E1    push        eax
 005DF8E2    mov         eax,ebx
 005DF8E4    call        005DEE68
 005DF8E9    push        eax
 005DF8EA    mov         eax,dword ptr [ebp-4]
 005DF8ED    push        eax
 005DF8EE    push        edi
 005DF8EF    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DF8F6    push        eax
 005DF8F7    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DF8FD    push        eax
 005DF8FE    mov         eax,[0078D900];^gvar_00816164
 005DF903    mov         eax,dword ptr [eax]
 005DF905    call        eax
 005DF907    mov         esi,eax
 005DF909    mov         eax,esi
 005DF90B    pop         edi
 005DF90C    pop         esi
 005DF90D    pop         ebx
 005DF90E    pop         ecx
 005DF90F    pop         ebp
 005DF910    ret         8
end;*}

//005DF914
{*function TJvHidDevice.SetUsages(UsageList:PUsage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;
begin
 005DF914    push        ebp
 005DF915    mov         ebp,esp
 005DF917    push        ecx
 005DF918    push        ebx
 005DF919    push        esi
 005DF91A    push        edi
 005DF91B    mov         dword ptr [ebp-4],ecx
 005DF91E    mov         edi,edx
 005DF920    mov         ebx,eax
 005DF922    mov         esi,80110001
 005DF927    mov         eax,ebx
 005DF929    call        005DEB5C
 005DF92E    test        al,al
>005DF930    je          005DF969
 005DF932    mov         eax,dword ptr [ebp+8]
 005DF935    push        eax
 005DF936    mov         eax,dword ptr [ebp+0C]
 005DF939    push        eax
 005DF93A    mov         eax,ebx
 005DF93C    call        005DEE68
 005DF941    push        eax
 005DF942    mov         eax,dword ptr [ebp-4]
 005DF945    push        eax
 005DF946    push        edi
 005DF947    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DF94E    push        eax
 005DF94F    movzx       eax,word ptr [ebx+88];TJvHidDevice.FUsagePageParam:word
 005DF956    push        eax
 005DF957    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DF95D    push        eax
 005DF95E    mov         eax,[0078CE68];^gvar_00816168
 005DF963    mov         eax,dword ptr [eax]
 005DF965    call        eax
 005DF967    mov         esi,eax
 005DF969    mov         eax,esi
 005DF96B    pop         edi
 005DF96C    pop         esi
 005DF96D    pop         ebx
 005DF96E    pop         ecx
 005DF96F    pop         ebp
 005DF970    ret         8
end;*}

//005DF974
{*function TJvHidDevice.SetButtons(UsageList:PUsage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;
begin
 005DF974    push        ebp
 005DF975    mov         ebp,esp
 005DF977    push        ecx
 005DF978    push        ebx
 005DF979    push        esi
 005DF97A    push        edi
 005DF97B    mov         dword ptr [ebp-4],ecx
 005DF97E    mov         edi,edx
 005DF980    mov         ebx,eax
 005DF982    mov         esi,80110001
 005DF987    mov         eax,ebx
 005DF989    call        005DEB5C
 005DF98E    test        al,al
>005DF990    je          005DF9C9
 005DF992    mov         eax,dword ptr [ebp+8]
 005DF995    push        eax
 005DF996    mov         eax,dword ptr [ebp+0C]
 005DF999    push        eax
 005DF99A    mov         eax,ebx
 005DF99C    call        005DEE68
 005DF9A1    push        eax
 005DF9A2    mov         eax,dword ptr [ebp-4]
 005DF9A5    push        eax
 005DF9A6    push        edi
 005DF9A7    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DF9AE    push        eax
 005DF9AF    movzx       eax,word ptr [ebx+88];TJvHidDevice.FUsagePageParam:word
 005DF9B6    push        eax
 005DF9B7    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DF9BD    push        eax
 005DF9BE    mov         eax,[0078CDD8];^gvar_0081616C
 005DF9C3    mov         eax,dword ptr [eax]
 005DF9C5    call        eax
 005DF9C7    mov         esi,eax
 005DF9C9    mov         eax,esi
 005DF9CB    pop         edi
 005DF9CC    pop         esi
 005DF9CD    pop         ebx
 005DF9CE    pop         ecx
 005DF9CF    pop         ebp
 005DF9D0    ret         8
end;*}

//005DF9D4
{*function TJvHidDevice.UnsetUsages(UsageList:PUsage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;
begin
 005DF9D4    push        ebp
 005DF9D5    mov         ebp,esp
 005DF9D7    push        ecx
 005DF9D8    push        ebx
 005DF9D9    push        esi
 005DF9DA    push        edi
 005DF9DB    mov         dword ptr [ebp-4],ecx
 005DF9DE    mov         edi,edx
 005DF9E0    mov         ebx,eax
 005DF9E2    mov         esi,80110001
 005DF9E7    mov         eax,ebx
 005DF9E9    call        005DEB5C
 005DF9EE    test        al,al
>005DF9F0    je          005DFA29
 005DF9F2    mov         eax,dword ptr [ebp+8]
 005DF9F5    push        eax
 005DF9F6    mov         eax,dword ptr [ebp+0C]
 005DF9F9    push        eax
 005DF9FA    mov         eax,ebx
 005DF9FC    call        005DEE68
 005DFA01    push        eax
 005DFA02    mov         eax,dword ptr [ebp-4]
 005DFA05    push        eax
 005DFA06    push        edi
 005DFA07    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DFA0E    push        eax
 005DFA0F    movzx       eax,word ptr [ebx+88];TJvHidDevice.FUsagePageParam:word
 005DFA16    push        eax
 005DFA17    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DFA1D    push        eax
 005DFA1E    mov         eax,[0078DA60];^gvar_00816170
 005DFA23    mov         eax,dword ptr [eax]
 005DFA25    call        eax
 005DFA27    mov         esi,eax
 005DFA29    mov         eax,esi
 005DFA2B    pop         edi
 005DFA2C    pop         esi
 005DFA2D    pop         ebx
 005DFA2E    pop         ecx
 005DFA2F    pop         ebp
 005DFA30    ret         8
end;*}

//005DFA34
{*function TJvHidDevice.UnsetButtons(UsageList:PUsage; var UsageLength:Cardinal; ReportLength:Cardinal; var Report:?):Integer;
begin
 005DFA34    push        ebp
 005DFA35    mov         ebp,esp
 005DFA37    push        ecx
 005DFA38    push        ebx
 005DFA39    push        esi
 005DFA3A    push        edi
 005DFA3B    mov         dword ptr [ebp-4],ecx
 005DFA3E    mov         edi,edx
 005DFA40    mov         ebx,eax
 005DFA42    mov         esi,80110001
 005DFA47    mov         eax,ebx
 005DFA49    call        005DEB5C
 005DFA4E    test        al,al
>005DFA50    je          005DFA89
 005DFA52    mov         eax,dword ptr [ebp+8]
 005DFA55    push        eax
 005DFA56    mov         eax,dword ptr [ebp+0C]
 005DFA59    push        eax
 005DFA5A    mov         eax,ebx
 005DFA5C    call        005DEE68
 005DFA61    push        eax
 005DFA62    mov         eax,dword ptr [ebp-4]
 005DFA65    push        eax
 005DFA66    push        edi
 005DFA67    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DFA6E    push        eax
 005DFA6F    movzx       eax,word ptr [ebx+88];TJvHidDevice.FUsagePageParam:word
 005DFA76    push        eax
 005DFA77    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DFA7D    push        eax
 005DFA7E    mov         eax,[0078D9B0];^gvar_00816174
 005DFA83    mov         eax,dword ptr [eax]
 005DFA85    call        eax
 005DFA87    mov         esi,eax
 005DFA89    mov         eax,esi
 005DFA8B    pop         edi
 005DFA8C    pop         esi
 005DFA8D    pop         ebx
 005DFA8E    pop         ecx
 005DFA8F    pop         ebp
 005DFA90    ret         8
end;*}

//005DFA94
{*function TJvHidDevice.GetUsageValue(var UsageValue:Cardinal; var Report:?; ReportLength:Cardinal):Integer;
begin
 005DFA94    push        ebp
 005DFA95    mov         ebp,esp
 005DFA97    push        ecx
 005DFA98    push        ebx
 005DFA99    push        esi
 005DFA9A    push        edi
 005DFA9B    mov         dword ptr [ebp-4],ecx
 005DFA9E    mov         edi,edx
 005DFAA0    mov         ebx,eax
 005DFAA2    mov         esi,80110001
 005DFAA7    mov         eax,ebx
 005DFAA9    call        005DEB5C
 005DFAAE    test        al,al
>005DFAB0    je          005DFAED
 005DFAB2    mov         eax,dword ptr [ebp+8]
 005DFAB5    push        eax
 005DFAB6    mov         eax,dword ptr [ebp-4]
 005DFAB9    push        eax
 005DFABA    mov         eax,ebx
 005DFABC    call        005DEE68
 005DFAC1    push        eax
 005DFAC2    push        edi
 005DFAC3    movzx       eax,word ptr [ebx+8C];TJvHidDevice.FUsageParam:word
 005DFACA    push        eax
 005DFACB    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DFAD2    push        eax
 005DFAD3    movzx       eax,word ptr [ebx+88];TJvHidDevice.FUsagePageParam:word
 005DFADA    push        eax
 005DFADB    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DFAE1    push        eax
 005DFAE2    mov         eax,[0078CC74];^gvar_00816180
 005DFAE7    mov         eax,dword ptr [eax]
 005DFAE9    call        eax
 005DFAEB    mov         esi,eax
 005DFAED    mov         eax,esi
 005DFAEF    pop         edi
 005DFAF0    pop         esi
 005DFAF1    pop         ebx
 005DFAF2    pop         ecx
 005DFAF3    pop         ebp
 005DFAF4    ret         4
end;*}

//005DFAF8
{*function TJvHidDevice.GetScaledUsageValue(var UsageValue:Integer; var Report:?; ReportLength:Cardinal):Integer;
begin
 005DFAF8    push        ebp
 005DFAF9    mov         ebp,esp
 005DFAFB    push        ecx
 005DFAFC    push        ebx
 005DFAFD    push        esi
 005DFAFE    push        edi
 005DFAFF    mov         dword ptr [ebp-4],ecx
 005DFB02    mov         edi,edx
 005DFB04    mov         ebx,eax
 005DFB06    mov         esi,80110001
 005DFB0B    mov         eax,ebx
 005DFB0D    call        005DEB5C
 005DFB12    test        al,al
>005DFB14    je          005DFB51
 005DFB16    mov         eax,dword ptr [ebp+8]
 005DFB19    push        eax
 005DFB1A    mov         eax,dword ptr [ebp-4]
 005DFB1D    push        eax
 005DFB1E    mov         eax,ebx
 005DFB20    call        005DEE68
 005DFB25    push        eax
 005DFB26    push        edi
 005DFB27    movzx       eax,word ptr [ebx+8C];TJvHidDevice.FUsageParam:word
 005DFB2E    push        eax
 005DFB2F    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DFB36    push        eax
 005DFB37    movzx       eax,word ptr [ebx+88];TJvHidDevice.FUsagePageParam:word
 005DFB3E    push        eax
 005DFB3F    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DFB45    push        eax
 005DFB46    mov         eax,[0078D648];^gvar_00816184
 005DFB4B    mov         eax,dword ptr [eax]
 005DFB4D    call        eax
 005DFB4F    mov         esi,eax
 005DFB51    mov         eax,esi
 005DFB53    pop         edi
 005DFB54    pop         esi
 005DFB55    pop         ebx
 005DFB56    pop         ecx
 005DFB57    pop         ebp
 005DFB58    ret         4
end;*}

//005DFB5C
{*function TJvHidDevice.GetUsageValueArray(UsageValue:PAnsiChar; UsageValueByteLength:Word; ReportLength:Cardinal; var Report:?):Integer;
begin
 005DFB5C    push        ebp
 005DFB5D    mov         ebp,esp
 005DFB5F    push        ecx
 005DFB60    push        ebx
 005DFB61    push        esi
 005DFB62    push        edi
 005DFB63    mov         word ptr [ebp-2],cx
 005DFB67    mov         edi,edx
 005DFB69    mov         ebx,eax
 005DFB6B    mov         esi,80110001
 005DFB70    mov         eax,ebx
 005DFB72    call        005DEB5C
 005DFB77    test        al,al
>005DFB79    je          005DFBBB
 005DFB7B    mov         eax,dword ptr [ebp+8]
 005DFB7E    push        eax
 005DFB7F    mov         eax,dword ptr [ebp+0C]
 005DFB82    push        eax
 005DFB83    mov         eax,ebx
 005DFB85    call        005DEE68
 005DFB8A    push        eax
 005DFB8B    movzx       eax,word ptr [ebp-2]
 005DFB8F    push        eax
 005DFB90    push        edi
 005DFB91    movzx       eax,word ptr [ebx+8C];TJvHidDevice.FUsageParam:word
 005DFB98    push        eax
 005DFB99    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DFBA0    push        eax
 005DFBA1    movzx       eax,word ptr [ebx+88];TJvHidDevice.FUsagePageParam:word
 005DFBA8    push        eax
 005DFBA9    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DFBAF    push        eax
 005DFBB0    mov         eax,[0078D8BC];^gvar_00816188
 005DFBB5    mov         eax,dword ptr [eax]
 005DFBB7    call        eax
 005DFBB9    mov         esi,eax
 005DFBBB    mov         eax,esi
 005DFBBD    pop         edi
 005DFBBE    pop         esi
 005DFBBF    pop         ebx
 005DFBC0    pop         ecx
 005DFBC1    pop         ebp
 005DFBC2    ret         8
end;*}

//005DFBC8
{*function TJvHidDevice.SetUsageValue(UsageValue:Cardinal; var Report:?; ReportLength:Cardinal):Integer;
begin
 005DFBC8    push        ebp
 005DFBC9    mov         ebp,esp
 005DFBCB    push        ecx
 005DFBCC    push        ebx
 005DFBCD    push        esi
 005DFBCE    push        edi
 005DFBCF    mov         dword ptr [ebp-4],ecx
 005DFBD2    mov         edi,edx
 005DFBD4    mov         ebx,eax
 005DFBD6    mov         esi,80110001
 005DFBDB    mov         eax,ebx
 005DFBDD    call        005DEB5C
 005DFBE2    test        al,al
>005DFBE4    je          005DFC21
 005DFBE6    mov         eax,dword ptr [ebp+8]
 005DFBE9    push        eax
 005DFBEA    mov         eax,dword ptr [ebp-4]
 005DFBED    push        eax
 005DFBEE    mov         eax,ebx
 005DFBF0    call        005DEE68
 005DFBF5    push        eax
 005DFBF6    push        edi
 005DFBF7    movzx       eax,word ptr [ebx+8C];TJvHidDevice.FUsageParam:word
 005DFBFE    push        eax
 005DFBFF    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DFC06    push        eax
 005DFC07    movzx       eax,word ptr [ebx+88];TJvHidDevice.FUsagePageParam:word
 005DFC0E    push        eax
 005DFC0F    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DFC15    push        eax
 005DFC16    mov         eax,[0078D52C];^gvar_0081618C
 005DFC1B    mov         eax,dword ptr [eax]
 005DFC1D    call        eax
 005DFC1F    mov         esi,eax
 005DFC21    mov         eax,esi
 005DFC23    pop         edi
 005DFC24    pop         esi
 005DFC25    pop         ebx
 005DFC26    pop         ecx
 005DFC27    pop         ebp
 005DFC28    ret         4
end;*}

//005DFC2C
{*function TJvHidDevice.SetScaledUsageValue(UsageValue:Integer; var Report:?; ReportLength:Cardinal):Integer;
begin
 005DFC2C    push        ebp
 005DFC2D    mov         ebp,esp
 005DFC2F    push        ecx
 005DFC30    push        ebx
 005DFC31    push        esi
 005DFC32    push        edi
 005DFC33    mov         dword ptr [ebp-4],ecx
 005DFC36    mov         edi,edx
 005DFC38    mov         ebx,eax
 005DFC3A    mov         esi,80110001
 005DFC3F    mov         eax,ebx
 005DFC41    call        005DEB5C
 005DFC46    test        al,al
>005DFC48    je          005DFC85
 005DFC4A    mov         eax,dword ptr [ebp+8]
 005DFC4D    push        eax
 005DFC4E    mov         eax,dword ptr [ebp-4]
 005DFC51    push        eax
 005DFC52    mov         eax,ebx
 005DFC54    call        005DEE68
 005DFC59    push        eax
 005DFC5A    push        edi
 005DFC5B    movzx       eax,word ptr [ebx+8C];TJvHidDevice.FUsageParam:word
 005DFC62    push        eax
 005DFC63    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DFC6A    push        eax
 005DFC6B    movzx       eax,word ptr [ebx+88];TJvHidDevice.FUsagePageParam:word
 005DFC72    push        eax
 005DFC73    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DFC79    push        eax
 005DFC7A    mov         eax,[0078CE80];^gvar_00816190
 005DFC7F    mov         eax,dword ptr [eax]
 005DFC81    call        eax
 005DFC83    mov         esi,eax
 005DFC85    mov         eax,esi
 005DFC87    pop         edi
 005DFC88    pop         esi
 005DFC89    pop         ebx
 005DFC8A    pop         ecx
 005DFC8B    pop         ebp
 005DFC8C    ret         4
end;*}

//005DFC90
{*function TJvHidDevice.SetUsageValueArray(UsageValue:PAnsiChar; UsageValueByteLength:Word; ReportLength:Cardinal; var Report:?):Integer;
begin
 005DFC90    push        ebp
 005DFC91    mov         ebp,esp
 005DFC93    push        ecx
 005DFC94    push        ebx
 005DFC95    push        esi
 005DFC96    push        edi
 005DFC97    mov         word ptr [ebp-2],cx
 005DFC9B    mov         edi,edx
 005DFC9D    mov         ebx,eax
 005DFC9F    mov         esi,80110001
 005DFCA4    mov         eax,ebx
 005DFCA6    call        005DEB5C
 005DFCAB    test        al,al
>005DFCAD    je          005DFCEF
 005DFCAF    mov         eax,dword ptr [ebp+8]
 005DFCB2    push        eax
 005DFCB3    mov         eax,dword ptr [ebp+0C]
 005DFCB6    push        eax
 005DFCB7    mov         eax,ebx
 005DFCB9    call        005DEE68
 005DFCBE    push        eax
 005DFCBF    movzx       eax,word ptr [ebp-2]
 005DFCC3    push        eax
 005DFCC4    push        edi
 005DFCC5    movzx       eax,word ptr [ebx+8C];TJvHidDevice.FUsageParam:word
 005DFCCC    push        eax
 005DFCCD    movzx       eax,word ptr [ebx+8A];TJvHidDevice.FLinkCollectionParam:word
 005DFCD4    push        eax
 005DFCD5    movzx       eax,word ptr [ebx+88];TJvHidDevice.FUsagePageParam:word
 005DFCDC    push        eax
 005DFCDD    mov         eax,dword ptr [ebx+84];TJvHidDevice.FReportTypeParam:Cardinal
 005DFCE3    push        eax
 005DFCE4    mov         eax,[0078D144];^gvar_00816194
 005DFCE9    mov         eax,dword ptr [eax]
 005DFCEB    call        eax
 005DFCED    mov         esi,eax
 005DFCEF    mov         eax,esi
 005DFCF1    pop         edi
 005DFCF2    pop         esi
 005DFCF3    pop         ebx
 005DFCF4    pop         ecx
 005DFCF5    pop         ebp
 005DFCF6    ret         8
end;*}

//005DFCFC
function TJvHidDevice.DeviceIoControl(IoControlCode:Cardinal; InBuffer:Pointer; var BytesReturned:Cardinal; OutSize:Cardinal; OutBuffer:Pointer; InSize:Cardinal):Boolean;
begin
{*
 005DFCFC    push        ebp
 005DFCFD    mov         ebp,esp
 005DFCFF    push        ecx
 005DFD00    push        ebx
 005DFD01    push        esi
 005DFD02    push        edi
 005DFD03    mov         dword ptr [ebp-4],ecx
 005DFD06    mov         edi,edx
 005DFD08    mov         esi,eax
 005DFD0A    xor         ebx,ebx
 005DFD0C    mov         eax,esi
 005DFD0E    call        TJvHidDevice.OpenFile
 005DFD13    test        al,al
>005DFD15    je          005DFD3D
 005DFD17    push        0
 005DFD19    mov         eax,dword ptr [ebp+8]
 005DFD1C    push        eax
 005DFD1D    mov         eax,dword ptr [ebp+0C]
 005DFD20    push        eax
 005DFD21    mov         eax,dword ptr [ebp+10]
 005DFD24    push        eax
 005DFD25    mov         eax,dword ptr [ebp+14]
 005DFD28    push        eax
 005DFD29    mov         eax,dword ptr [ebp-4]
 005DFD2C    push        eax
 005DFD2D    push        edi
 005DFD2E    mov         eax,dword ptr [esi+0C];TJvHidDevice.FHidFileHandle:Cardinal
 005DFD31    push        eax
 005DFD32    call        kernel32.DeviceIoControl
 005DFD37    cmp         eax,1
 005DFD3A    sbb         ebx,ebx
 005DFD3C    inc         ebx
 005DFD3D    mov         eax,ebx
 005DFD3F    pop         edi
 005DFD40    pop         esi
 005DFD41    pop         ebx
 005DFD42    pop         ecx
 005DFD43    pop         ebp
 005DFD44    ret         10
*}
end;

//005DFD48
{*function TJvHidDevice.ReadFile(var Report:?; ToRead:Cardinal; var BytesRead:Cardinal):Boolean;
begin
 005DFD48    push        ebp
 005DFD49    mov         ebp,esp
 005DFD4B    push        ecx
 005DFD4C    push        ebx
 005DFD4D    push        esi
 005DFD4E    push        edi
 005DFD4F    mov         dword ptr [ebp-4],ecx
 005DFD52    mov         edi,edx
 005DFD54    mov         esi,eax
 005DFD56    xor         ebx,ebx
 005DFD58    mov         eax,esi
 005DFD5A    call        TJvHidDevice.OpenFile
 005DFD5F    test        al,al
>005DFD61    je          005DFD7D
 005DFD63    push        0
 005DFD65    mov         eax,dword ptr [ebp+8]
 005DFD68    push        eax
 005DFD69    mov         eax,dword ptr [ebp-4]
 005DFD6C    push        eax
 005DFD6D    push        edi
 005DFD6E    mov         eax,dword ptr [esi+0C];TJvHidDevice.FHidFileHandle:Cardinal
 005DFD71    push        eax
 005DFD72    call        kernel32.ReadFile
 005DFD77    cmp         eax,1
 005DFD7A    sbb         ebx,ebx
 005DFD7C    inc         ebx
 005DFD7D    mov         eax,ebx
 005DFD7F    pop         edi
 005DFD80    pop         esi
 005DFD81    pop         ebx
 005DFD82    pop         ecx
 005DFD83    pop         ebp
 005DFD84    ret         4
end;*}

//005DFD88
{*function TJvHidDevice.WriteFile(var Report:?; ToWrite:Cardinal; var BytesWritten:Cardinal):Boolean;
begin
 005DFD88    push        ebp
 005DFD89    mov         ebp,esp
 005DFD8B    push        ecx
 005DFD8C    push        ebx
 005DFD8D    push        esi
 005DFD8E    push        edi
 005DFD8F    mov         dword ptr [ebp-4],ecx
 005DFD92    mov         edi,edx
 005DFD94    mov         esi,eax
 005DFD96    xor         ebx,ebx
 005DFD98    mov         eax,esi
 005DFD9A    call        TJvHidDevice.OpenFile
 005DFD9F    test        al,al
>005DFDA1    je          005DFDBD
 005DFDA3    push        0
 005DFDA5    mov         eax,dword ptr [ebp+8]
 005DFDA8    push        eax
 005DFDA9    mov         eax,dword ptr [ebp-4]
 005DFDAC    push        eax
 005DFDAD    push        edi
 005DFDAE    mov         eax,dword ptr [esi+0C];TJvHidDevice.FHidFileHandle:Cardinal
 005DFDB1    push        eax
 005DFDB2    call        kernel32.WriteFile
 005DFDB7    cmp         eax,1
 005DFDBA    sbb         ebx,ebx
 005DFDBC    inc         ebx
 005DFDBD    mov         eax,ebx
 005DFDBF    pop         edi
 005DFDC0    pop         esi
 005DFDC1    pop         ebx
 005DFDC2    pop         ecx
 005DFDC3    pop         ebp
 005DFDC4    ret         4
end;*}

//005DFDC8
{*function TJvHidDevice.ReadFileEx(var Report:?; ToRead:Cardinal; CallBack:Pointer):Boolean;
begin
 005DFDC8    push        ebp
 005DFDC9    mov         ebp,esp
 005DFDCB    push        ecx
 005DFDCC    push        ebx
 005DFDCD    push        esi
 005DFDCE    push        edi
 005DFDCF    mov         dword ptr [ebp-4],ecx
 005DFDD2    mov         edi,edx
 005DFDD4    mov         esi,eax
 005DFDD6    xor         ebx,ebx
 005DFDD8    xor         edx,edx
 005DFDDA    mov         eax,esi
 005DFDDC    call        TJvHidDevice.OpenFileEx
 005DFDE1    test        al,al
>005DFDE3    je          005DFE13
 005DFDE5    lea         eax,[esi+18];TJvHidDevice.FOvlRead:_OVERLAPPED
 005DFDE8    xor         ecx,ecx
 005DFDEA    mov         edx,14
 005DFDEF    call        @FillChar
 005DFDF4    mov         dword ptr [esi+28],esi
 005DFDF7    mov         eax,dword ptr [ebp+8]
 005DFDFA    push        eax
 005DFDFB    lea         eax,[esi+18];TJvHidDevice.FOvlRead:_OVERLAPPED
 005DFDFE    push        eax
 005DFDFF    mov         eax,dword ptr [ebp-4]
 005DFE02    push        eax
 005DFE03    push        edi
 005DFE04    mov         eax,dword ptr [esi+10];TJvHidDevice.FHidOverlappedRead:Cardinal
 005DFE07    push        eax
 005DFE08    call        kernel32.ReadFileEx
 005DFE0D    cmp         eax,1
 005DFE10    sbb         ebx,ebx
 005DFE12    inc         ebx
 005DFE13    mov         eax,ebx
 005DFE15    pop         edi
 005DFE16    pop         esi
 005DFE17    pop         ebx
 005DFE18    pop         ecx
 005DFE19    pop         ebp
 005DFE1A    ret         4
end;*}

//005DFE20
{*function TJvHidDevice.WriteFileEx(var Report:?; ToWrite:Cardinal; CallBack:Pointer):Boolean;
begin
 005DFE20    push        ebp
 005DFE21    mov         ebp,esp
 005DFE23    push        ecx
 005DFE24    push        ebx
 005DFE25    push        esi
 005DFE26    push        edi
 005DFE27    mov         dword ptr [ebp-4],ecx
 005DFE2A    mov         edi,edx
 005DFE2C    mov         esi,eax
 005DFE2E    xor         ebx,ebx
 005DFE30    mov         dl,1
 005DFE32    mov         eax,esi
 005DFE34    call        TJvHidDevice.OpenFileEx
 005DFE39    test        al,al
>005DFE3B    je          005DFE6B
 005DFE3D    lea         eax,[esi+2C];TJvHidDevice.FOvlWrite:_OVERLAPPED
 005DFE40    xor         ecx,ecx
 005DFE42    mov         edx,14
 005DFE47    call        @FillChar
 005DFE4C    mov         dword ptr [esi+3C],esi
 005DFE4F    mov         eax,dword ptr [ebp+8]
 005DFE52    push        eax
 005DFE53    lea         eax,[esi+2C];TJvHidDevice.FOvlWrite:_OVERLAPPED
 005DFE56    push        eax
 005DFE57    mov         eax,dword ptr [ebp-4]
 005DFE5A    push        eax
 005DFE5B    push        edi
 005DFE5C    mov         eax,dword ptr [esi+14];TJvHidDevice.FHidOverlappedWrite:Cardinal
 005DFE5F    push        eax
 005DFE60    call        kernel32.WriteFileEx
 005DFE65    cmp         eax,1
 005DFE68    sbb         ebx,ebx
 005DFE6A    inc         ebx
 005DFE6B    mov         eax,ebx
 005DFE6D    pop         edi
 005DFE6E    pop         esi
 005DFE6F    pop         ebx
 005DFE70    pop         ecx
 005DFE71    pop         ebp
 005DFE72    ret         4
end;*}

//005DFE78
function TJvHidDevice.CheckOut:Boolean;
begin
{*
 005DFE78    push        ebx
 005DFE79    cmp         dword ptr [eax+4],0;TJvHidDevice.FMyController:TJvHidDeviceController
>005DFE7D    je          005DFE8B
 005DFE7F    cmp         byte ptr [eax+8],0;TJvHidDevice.FIsPluggedIn:Boolean
>005DFE83    je          005DFE8B
 005DFE85    cmp         byte ptr [eax+9],0;TJvHidDevice.FIsCheckedOut:Boolean
>005DFE89    je          005DFE8F
 005DFE8B    xor         ebx,ebx
>005DFE8D    jmp         005DFE91
 005DFE8F    mov         bl,1
 005DFE91    test        bl,bl
>005DFE93    je          005DFEB0
 005DFE95    mov         byte ptr [eax+9],1;TJvHidDevice.FIsCheckedOut:Boolean
 005DFE99    mov         edx,dword ptr [eax+4];TJvHidDevice.FMyController:TJvHidDeviceController
 005DFE9C    inc         dword ptr [edx+94];TJvHidDeviceController.FNumCheckedOutDevices:Integer
 005DFEA2    mov         edx,dword ptr [eax+4];TJvHidDevice.FMyController:TJvHidDeviceController
 005DFEA5    dec         dword ptr [edx+90];TJvHidDeviceController.FNumCheckedInDevices:Integer
 005DFEAB    call        005DF3C4
 005DFEB0    mov         eax,ebx
 005DFEB2    pop         ebx
 005DFEB3    ret
*}
end;

//005DFEB4
function TJvHidDevice.GetExtendedAttributes(ReportType:Cardinal; DataIndex:Word; var LengthAttributes:Cardinal; Attributes:PHIDPExtendedAttributes):Integer;
begin
{*
 005DFEB4    push        ebp
 005DFEB5    mov         ebp,esp
 005DFEB7    push        ebx
 005DFEB8    mov         ebx,dword ptr ds:[78D348];^gvar_008161A0
 005DFEBE    cmp         dword ptr [ebx],0
>005DFEC1    je          005DFEDC
 005DFEC3    mov         ebx,dword ptr [ebp+8]
 005DFEC6    push        ebx
 005DFEC7    mov         ebx,dword ptr [ebp+0C]
 005DFECA    push        ebx
 005DFECB    mov         eax,dword ptr [eax+5C];TJvHidDevice.FPreparsedData:Pointer
 005DFECE    push        eax
 005DFECF    push        ecx
 005DFED0    push        edx
 005DFED1    mov         eax,[0078D348];^gvar_008161A0
 005DFED6    mov         eax,dword ptr [eax]
 005DFED8    call        eax
>005DFEDA    jmp         005DFEE1
 005DFEDC    mov         eax,0C0110020
 005DFEE1    pop         ebx
 005DFEE2    pop         ebp
 005DFEE3    ret         8
*}
end;

//005DFEE8
{*function TJvHidDevice.InitializeReportForID(ReportType:Cardinal; ReportID:Byte; ReportLength:Cardinal; var Report:?):Integer;
begin
 005DFEE8    push        ebp
 005DFEE9    mov         ebp,esp
 005DFEEB    push        ebx
 005DFEEC    mov         ebx,dword ptr ds:[78D410];^gvar_008161A4
 005DFEF2    cmp         dword ptr [ebx],0
>005DFEF5    je          005DFF10
 005DFEF7    mov         ebx,dword ptr [ebp+8]
 005DFEFA    push        ebx
 005DFEFB    mov         ebx,dword ptr [ebp+0C]
 005DFEFE    push        ebx
 005DFEFF    mov         eax,dword ptr [eax+5C];TJvHidDevice.FPreparsedData:Pointer
 005DFF02    push        eax
 005DFF03    push        ecx
 005DFF04    push        edx
 005DFF05    mov         eax,[0078D410];^gvar_008161A4
 005DFF0A    mov         eax,dword ptr [eax]
 005DFF0C    call        eax
>005DFF0E    jmp         005DFF15
 005DFF10    mov         eax,0C0110020
 005DFF15    pop         ebx
 005DFF16    pop         ebp
 005DFF17    ret         8
end;*}

//005DFF1C
{*function TJvHidDevice.GetInputReport(var Report:?; Size:Cardinal):Boolean;
begin
 005DFF1C    push        ebx
 005DFF1D    push        esi
 005DFF1E    push        edi
 005DFF1F    push        ebp
 005DFF20    mov         ebp,ecx
 005DFF22    mov         edi,edx
 005DFF24    mov         esi,eax
 005DFF26    xor         ebx,ebx
 005DFF28    mov         eax,[0078D758];^gvar_00816134
 005DFF2D    cmp         dword ptr [eax],0
>005DFF30    je          005DFF52
 005DFF32    mov         eax,esi
 005DFF34    call        TJvHidDevice.OpenFile
 005DFF39    test        al,al
>005DFF3B    je          005DFF52
 005DFF3D    push        ebp
 005DFF3E    push        edi
 005DFF3F    mov         eax,dword ptr [esi+0C];TJvHidDevice.FHidFileHandle:Cardinal
 005DFF42    push        eax
 005DFF43    mov         eax,[0078D758];^gvar_00816134
 005DFF48    mov         eax,dword ptr [eax]
 005DFF4A    call        eax
 005DFF4C    cmp         eax,1
 005DFF4F    sbb         ebx,ebx
 005DFF51    inc         ebx
 005DFF52    mov         eax,ebx
 005DFF54    pop         ebp
 005DFF55    pop         edi
 005DFF56    pop         esi
 005DFF57    pop         ebx
 005DFF58    ret
end;*}

//005DFF5C
{*function TJvHidDevice.SetOutputReport(var Report:?; Size:Cardinal):Boolean;
begin
 005DFF5C    push        ebx
 005DFF5D    push        esi
 005DFF5E    push        edi
 005DFF5F    push        ebp
 005DFF60    mov         ebp,ecx
 005DFF62    mov         edi,edx
 005DFF64    mov         esi,eax
 005DFF66    xor         ebx,ebx
 005DFF68    mov         eax,[0078DB94];^gvar_00816138
 005DFF6D    cmp         dword ptr [eax],0
>005DFF70    je          005DFF92
 005DFF72    mov         eax,esi
 005DFF74    call        TJvHidDevice.OpenFile
 005DFF79    test        al,al
>005DFF7B    je          005DFF92
 005DFF7D    push        ebp
 005DFF7E    push        edi
 005DFF7F    mov         eax,dword ptr [esi+0C];TJvHidDevice.FHidFileHandle:Cardinal
 005DFF82    push        eax
 005DFF83    mov         eax,[0078DB94];^gvar_00816138
 005DFF88    mov         eax,dword ptr [eax]
 005DFF8A    call        eax
 005DFF8C    cmp         eax,1
 005DFF8F    sbb         ebx,ebx
 005DFF91    inc         ebx
 005DFF92    mov         eax,ebx
 005DFF94    pop         ebp
 005DFF95    pop         edi
 005DFF96    pop         esi
 005DFF97    pop         ebx
 005DFF98    ret
end;*}

//005DFF9C
constructor TJvHidDeviceController.Create(AOwner:TComponent);
begin
{*
 005DFF9C    push        ebp
 005DFF9D    mov         ebp,esp
 005DFF9F    push        ecx
 005DFFA0    push        ebx
 005DFFA1    push        esi
 005DFFA2    push        edi
 005DFFA3    test        dl,dl
>005DFFA5    je          005DFFAF
 005DFFA7    add         esp,0FFFFFFF0
 005DFFAA    call        @ClassCreate
 005DFFAF    mov         byte ptr [ebp-1],dl
 005DFFB2    mov         ebx,eax
 005DFFB4    xor         edx,edx
 005DFFB6    mov         eax,ebx
 005DFFB8    call        TComponent.Create
 005DFFBD    xor         eax,eax
 005DFFBF    mov         dword ptr [ebx+50],eax;TJvHidDeviceController.FDeviceChangeEvent:TNotifyEvent
 005DFFC2    mov         dword ptr [ebx+54],eax;TJvHidDeviceController.?f54:dword
 005DFFC5    xor         eax,eax
 005DFFC7    mov         dword ptr [ebx+58],eax;TJvHidDeviceController.FEnumerateEvent:TJvHidEnumerateEvent
 005DFFCA    mov         dword ptr [ebx+5C],eax;TJvHidDeviceController.?f5C:dword
 005DFFCD    xor         eax,eax
 005DFFCF    mov         dword ptr [ebx+70],eax;TJvHidDeviceController.FDevUnplugEvent:TJvHidPlugEvent
 005DFFD2    mov         dword ptr [ebx+74],eax;TJvHidDeviceController.?f74:dword
 005DFFD5    xor         eax,eax
 005DFFD7    mov         dword ptr [ebx+90],eax;TJvHidDeviceController.FNumCheckedInDevices:Integer
 005DFFDD    xor         eax,eax
 005DFFDF    mov         dword ptr [ebx+94],eax;TJvHidDeviceController.FNumCheckedOutDevices:Integer
 005DFFE5    xor         eax,eax
 005DFFE7    mov         dword ptr [ebx+98],eax;TJvHidDeviceController.FNumUnpluggedDevices:Integer
 005DFFED    mov         dword ptr [ebx+80],64;TJvHidDeviceController.FDevThreadSleepTime:Integer
 005DFFF7    lea         eax,[ebx+84];TJvHidDeviceController.FVersion:string
 005DFFFD    mov         edx,5E00A0;'1.0.35'
 005E0002    call        @UStrAsg
 005E0007    mov         byte ptr [ebx+9C],0;TJvHidDeviceController.FInDeviceChange:Boolean
 005E000E    mov         dl,1
 005E0010    mov         eax,[00439644];TList
 005E0015    call        TObject.Create;TList.Create
 005E001A    mov         dword ptr [ebx+8C],eax;TJvHidDeviceController.FList:TList
 005E0020    call        005D263C
 005E0025    test        al,al
>005E0027    je          005E002E
 005E0029    call        005D9F84
 005E002E    call        005D9F78
 005E0033    test        al,al
>005E0035    je          005E0068
 005E0037    lea         eax,[ebx+38];TJvHidDeviceController.FHidGuid:TGUID
 005E003A    push        eax
 005E003B    mov         eax,[0078CC34];^gvar_008160F4
 005E0040    mov         eax,dword ptr [eax]
 005E0042    call        eax
 005E0044    push        ebx
 005E0045    push        5E01B4
 005E004A    call        AllocateHWnd
 005E004F    mov         esi,eax
 005E0051    mov         dword ptr [ebx+0A4],esi;TJvHidDeviceController.FHWnd:HWND
 005E0057    push        0FF
 005E0059    push        7
 005E005B    push        219
 005E0060    push        esi
 005E0061    call        user32.PostMessageW
>005E0066    jmp         005E0074
 005E0068    lea         edi,[ebx+38];TJvHidDeviceController.FHidGuid:TGUID
 005E006B    mov         esi,78A048
 005E0070    movs        dword ptr [edi],dword ptr [esi]
 005E0071    movs        dword ptr [edi],dword ptr [esi]
 005E0072    movs        dword ptr [edi],dword ptr [esi]
 005E0073    movs        dword ptr [edi],dword ptr [esi]
 005E0074    mov         eax,ebx
 005E0076    cmp         byte ptr [ebp-1],0
>005E007A    je          005E008B
 005E007C    call        @AfterConstruction
 005E0081    pop         dword ptr fs:[0]
 005E0088    add         esp,0C
 005E008B    mov         eax,ebx
 005E008D    pop         edi
 005E008E    pop         esi
 005E008F    pop         ebx
 005E0090    pop         ecx
 005E0091    pop         ebp
 005E0092    ret
*}
end;

//005E00B0
destructor TJvHidDeviceController.Destroy();
begin
{*
 005E00B0    push        ebx
 005E00B1    push        esi
 005E00B2    push        edi
 005E00B3    push        ebp
 005E00B4    call        @BeforeDestruction
 005E00B9    mov         ebx,edx
 005E00BB    mov         edi,eax
 005E00BD    xor         eax,eax
 005E00BF    mov         dword ptr [edi+50],eax;TJvHidDeviceController.FDeviceChangeEvent:TNotifyEvent
 005E00C2    mov         dword ptr [edi+54],eax;TJvHidDeviceController.?f54:dword
 005E00C5    xor         eax,eax
 005E00C7    mov         dword ptr [edi+70],eax;TJvHidDeviceController.FDevUnplugEvent:TJvHidPlugEvent
 005E00CA    mov         dword ptr [edi+74],eax;TJvHidDeviceController.?f74:dword
 005E00CD    push        0
 005E00CF    push        0
 005E00D1    mov         eax,edi
 005E00D3    call        TJvHidDeviceController.SetOnEnumerate
 005E00D8    call        005D9F78
 005E00DD    test        al,al
>005E00DF    je          005E00EC
 005E00E1    mov         eax,dword ptr [edi+0A4];TJvHidDeviceController.FHWnd:HWND
 005E00E7    call        DeallocateHWnd
 005E00EC    mov         eax,dword ptr [edi+8C];TJvHidDeviceController.FList:TList
 005E00F2    mov         esi,dword ptr [eax+8];TList.FCount:Integer
 005E00F5    dec         esi
 005E00F6    test        esi,esi
>005E00F8    jl          005E0125
 005E00FA    inc         esi
 005E00FB    xor         ebp,ebp
 005E00FD    mov         eax,dword ptr [edi+8C];TJvHidDeviceController.FList:TList
 005E0103    mov         edx,ebp
 005E0105    call        TList.Get
 005E010A    xor         edx,edx
 005E010C    mov         dword ptr [eax+4],edx
 005E010F    cmp         byte ptr [eax+9],0
>005E0113    je          005E011C
 005E0115    call        005DECD4
>005E011A    jmp         005E0121
 005E011C    call        TObject.Free
 005E0121    inc         ebp
 005E0122    dec         esi
>005E0123    jne         005E00FD
 005E0125    mov         eax,dword ptr [edi+8C];TJvHidDeviceController.FList:TList
 005E012B    call        TObject.Free
 005E0130    call        005D9F78
 005E0135    test        al,al
>005E0137    je          005E013E
 005E0139    call        005D87F4
 005E013E    call        005DAC6C
 005E0143    mov         edx,ebx
 005E0145    and         dl,0FC
 005E0148    mov         eax,edi
 005E014A    call        TComponent.Destroy
 005E014F    test        bl,bl
>005E0151    jle         005E015A
 005E0153    mov         eax,edi
 005E0155    call        @ClassDestroy
 005E015A    pop         ebp
 005E015B    pop         edi
 005E015C    pop         esi
 005E015D    pop         ebx
 005E015E    ret
*}
end;

//005E0160
procedure sub_005E0160(?:TJvHidDeviceController; ?:Pointer);
begin
{*
 005E0160    push        ebx
 005E0161    push        esi
 005E0162    mov         ebx,edx
 005E0164    cmp         word ptr [eax+4A],0
>005E0169    je          005E017D
 005E016B    mov         byte ptr [ebx+0A],1
 005E016F    mov         esi,eax
 005E0171    mov         edx,ebx
 005E0173    mov         eax,dword ptr [esi+4C]
 005E0176    call        dword ptr [esi+48]
 005E0179    mov         byte ptr [ebx+0A],0
 005E017D    pop         esi
 005E017E    pop         ebx
 005E017F    ret
*}
end;

//005E0180
procedure sub_005E0180(?:TJvHidDeviceController; ?:Pointer);
begin
{*
 005E0180    push        ebx
 005E0181    push        esi
 005E0182    mov         ebx,edx
 005E0184    cmp         word ptr [eax+7A],0
>005E0189    je          005E019D
 005E018B    mov         byte ptr [ebx+0A],1
 005E018F    mov         esi,eax
 005E0191    mov         edx,ebx
 005E0193    mov         eax,dword ptr [esi+7C]
 005E0196    call        dword ptr [esi+78]
 005E0199    mov         byte ptr [ebx+0A],0
 005E019D    pop         esi
 005E019E    pop         ebx
 005E019F    ret
*}
end;

//005E01A0
procedure sub_005E01A0(?:TJvHidDeviceController);
begin
{*
 005E01A0    push        ebx
 005E01A1    cmp         word ptr [eax+52],0
>005E01A6    je          005E01B2
 005E01A8    mov         ebx,eax
 005E01AA    mov         edx,eax
 005E01AC    mov         eax,dword ptr [ebx+54]
 005E01AF    call        dword ptr [ebx+50]
 005E01B2    pop         ebx
 005E01B3    ret
*}
end;

//005E0214
{*procedure sub_005E0214(?:?);
begin
 005E0214    push        ebp
 005E0215    mov         ebp,esp
 005E0217    add         esp,0FFFFFFB0
 005E021A    push        ebx
 005E021B    push        esi
 005E021C    push        edi
 005E021D    call        005D9F78
 005E0222    test        al,al
>005E0224    je          005E038F
 005E022A    push        12
 005E022C    push        0
 005E022E    push        0
 005E0230    mov         eax,dword ptr [ebp+8]
 005E0233    mov         eax,dword ptr [eax-4]
 005E0236    add         eax,38
 005E0239    push        eax
 005E023A    mov         eax,[0078D1C4];^gvar_00815F18
 005E023F    mov         eax,dword ptr [eax]
 005E0241    call        eax
 005E0243    mov         dword ptr [ebp-4],eax
 005E0246    cmp         dword ptr [ebp-4],0FFFFFFFF
>005E024A    je          005E038F
 005E0250    xor         eax,eax
 005E0252    mov         dword ptr [ebp-10],eax
 005E0255    mov         dword ptr [ebp-50],1C
 005E025C    lea         eax,[ebp-50]
 005E025F    push        eax
 005E0260    mov         eax,dword ptr [ebp-10]
 005E0263    push        eax
 005E0264    mov         eax,dword ptr [ebp+8]
 005E0267    mov         eax,dword ptr [eax-4]
 005E026A    add         eax,38
 005E026D    push        eax
 005E026E    push        0
 005E0270    mov         eax,dword ptr [ebp-4]
 005E0273    push        eax
 005E0274    mov         eax,[0078D70C];^gvar_00815E60
 005E0279    mov         eax,dword ptr [eax]
 005E027B    call        eax
 005E027D    mov         dword ptr [ebp-0C],eax
 005E0280    cmp         dword ptr [ebp-0C],0
>005E0284    je          005E0378
 005E028A    mov         dword ptr [ebp-34],1C
 005E0291    xor         eax,eax
 005E0293    mov         dword ptr [ebp-14],eax
 005E0296    lea         eax,[ebp-34]
 005E0299    push        eax
 005E029A    lea         eax,[ebp-14]
 005E029D    push        eax
 005E029E    push        0
 005E02A0    push        0
 005E02A2    lea         eax,[ebp-50]
 005E02A5    push        eax
 005E02A6    mov         eax,dword ptr [ebp-4]
 005E02A9    push        eax
 005E02AA    mov         eax,[0078D5F4];^gvar_00815EC0
 005E02AF    mov         eax,dword ptr [eax]
 005E02B1    call        eax
 005E02B3    cmp         dword ptr [ebp-14],0
>005E02B7    je          005E0378
 005E02BD    call        kernel32.GetLastError
 005E02C2    cmp         eax,7A
>005E02C5    jne         005E0378
 005E02CB    mov         eax,dword ptr [ebp-14]
 005E02CE    call        AllocMem
 005E02D3    mov         dword ptr [ebp-8],eax
 005E02D6    mov         eax,dword ptr [ebp-8]
 005E02D9    mov         dword ptr [eax],6
 005E02DF    lea         eax,[ebp-34]
 005E02E2    push        eax
 005E02E3    lea         eax,[ebp-14]
 005E02E6    push        eax
 005E02E7    mov         eax,dword ptr [ebp-14]
 005E02EA    push        eax
 005E02EB    mov         eax,dword ptr [ebp-8]
 005E02EE    push        eax
 005E02EF    lea         eax,[ebp-50]
 005E02F2    push        eax
 005E02F3    mov         eax,dword ptr [ebp-4]
 005E02F6    push        eax
 005E02F7    mov         eax,[0078D5F4];^gvar_00815EC0
 005E02FC    mov         eax,dword ptr [eax]
 005E02FE    call        eax
 005E0300    test        eax,eax
>005E0302    je          005E0370
 005E0304    lea         eax,[ebp-34]
 005E0307    push        eax
 005E0308    mov         eax,dword ptr [ebp-8]
 005E030B    add         eax,4
 005E030E    push        eax
 005E030F    mov         ecx,dword ptr [ebp-4]
 005E0312    mov         dl,1
 005E0314    mov         eax,[005DB058];TJvHidPnPInfo
 005E0319    call        TJvHidPnPInfo.Create;TJvHidPnPInfo.Create
 005E031E    mov         dword ptr [ebp-18],eax
 005E0321    xor         edx,edx
 005E0323    push        ebp
 005E0324    push        5E035B
 005E0329    push        dword ptr fs:[edx]
 005E032C    mov         dword ptr fs:[edx],esp
 005E032F    mov         eax,dword ptr [ebp+8]
 005E0332    mov         eax,dword ptr [eax-4]
 005E0335    push        eax
 005E0336    mov         ecx,dword ptr [ebp-18]
 005E0339    mov         dl,1
 005E033B    mov         eax,[005DBBB4];TJvHidDevice
 005E0340    call        TJvHidDevice.Create;TJvHidDevice.Create
 005E0345    mov         edx,dword ptr [ebp+8]
 005E0348    mov         edx,dword ptr [edx-8]
 005E034B    xchg        eax,edx
 005E034C    call        TList.Add
 005E0351    xor         eax,eax
 005E0353    pop         edx
 005E0354    pop         ecx
 005E0355    pop         ecx
 005E0356    mov         dword ptr fs:[eax],edx
>005E0359    jmp         005E036D
>005E035B    jmp         @HandleAnyException
 005E0360    mov         eax,dword ptr [ebp-18]
 005E0363    call        TObject.Free
 005E0368    call        @DoneExcept
 005E036D    inc         dword ptr [ebp-10]
 005E0370    mov         eax,dword ptr [ebp-8]
 005E0373    call        @FreeMem
 005E0378    cmp         dword ptr [ebp-0C],0
>005E037C    jne         005E0255
 005E0382    mov         eax,dword ptr [ebp-4]
 005E0385    push        eax
 005E0386    mov         eax,[0078DB98];^gvar_00815E5C
 005E038B    mov         eax,dword ptr [eax]
 005E038D    call        eax
 005E038F    pop         edi
 005E0390    pop         esi
 005E0391    pop         ebx
 005E0392    mov         esp,ebp
 005E0394    pop         ebp
 005E0395    ret
end;*}

//005E0398
procedure TJvHidDeviceController.DeviceChange;
begin
{*
 005E0398    push        ebp
 005E0399    mov         ebp,esp
 005E039B    add         esp,0FFFFFFF0
 005E039E    push        ebx
 005E039F    push        esi
 005E03A0    push        edi
 005E03A1    mov         dword ptr [ebp-4],eax
 005E03A4    mov         eax,dword ptr [ebp-4]
 005E03A7    cmp         dword ptr [eax+0A0],0FFFFFFFF;TJvHidDeviceController.FLParam:Integer
 005E03AE    sete        byte ptr [ebp-9]
 005E03B2    mov         dl,1
 005E03B4    mov         eax,[00439644];TList
 005E03B9    call        TObject.Create;TList.Create
 005E03BE    mov         dword ptr [ebp-8],eax
 005E03C1    push        ebp
 005E03C2    call        005E0214
 005E03C7    pop         ecx
 005E03C8    mov         eax,dword ptr [ebp-4]
 005E03CB    mov         eax,dword ptr [eax+8C];TJvHidDeviceController.FList:TList
 005E03D1    mov         esi,dword ptr [eax+8];TList.FCount:Integer
 005E03D4    dec         esi
 005E03D5    cmp         esi,0
>005E03D8    jl          005E0455
 005E03DA    mov         eax,dword ptr [ebp-4]
 005E03DD    mov         eax,dword ptr [eax+8C];TJvHidDeviceController.FList:TList
 005E03E3    mov         edx,esi
 005E03E5    call        TList.Get
 005E03EA    mov         edi,eax
 005E03EC    mov         eax,dword ptr [ebp-8]
 005E03EF    mov         ebx,dword ptr [eax+8];TList.FCount:Integer
 005E03F2    dec         ebx
 005E03F3    cmp         ebx,0
>005E03F6    jl          005E0420
 005E03F8    mov         edx,ebx
 005E03FA    mov         eax,dword ptr [ebp-8]
 005E03FD    call        TList.Get
 005E0402    mov         eax,dword ptr [eax+4C]
 005E0405    mov         eax,dword ptr [eax+4]
 005E0408    mov         edx,dword ptr [edi+4C]
 005E040B    cmp         eax,dword ptr [edx+4]
>005E040E    jne         005E041A
 005E0410    cmp         byte ptr [edi+8],0
>005E0414    je          005E041A
 005E0416    xor         edi,edi
>005E0418    jmp         005E0420
 005E041A    dec         ebx
 005E041B    cmp         ebx,0FFFFFFFF
>005E041E    jne         005E03F8
 005E0420    test        edi,edi
>005E0422    je          005E044F
 005E0424    mov         eax,edi
 005E0426    call        005DECD4
 005E042B    mov         edx,edi
 005E042D    mov         eax,dword ptr [ebp-4]
 005E0430    call        005E0180
 005E0435    cmp         byte ptr [edi+9],0
>005E0439    jne         005E044B
 005E043B    mov         eax,dword ptr [ebp-4]
 005E043E    mov         eax,dword ptr [eax+8C];TJvHidDeviceController.FList:TList
 005E0444    mov         edx,esi
 005E0446    call        TList.Delete
 005E044B    mov         byte ptr [ebp-9],1
 005E044F    dec         esi
 005E0450    cmp         esi,0FFFFFFFF
>005E0453    jne         005E03DA
 005E0455    mov         eax,dword ptr [ebp-8]
 005E0458    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 005E045B    dec         eax
 005E045C    test        eax,eax
>005E045E    jl          005E04F8
 005E0464    inc         eax
 005E0465    mov         dword ptr [ebp-10],eax
 005E0468    xor         esi,esi
 005E046A    mov         eax,dword ptr [ebp-4]
 005E046D    mov         eax,dword ptr [eax+8C];TJvHidDeviceController.FList:TList
 005E0473    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 005E0476    dec         edi
 005E0477    test        edi,edi
>005E0479    jl          005E04EE
 005E047B    inc         edi
 005E047C    xor         ebx,ebx
 005E047E    mov         edx,esi
 005E0480    mov         eax,dword ptr [ebp-8]
 005E0483    call        TList.Get
 005E0488    mov         eax,dword ptr [eax+4C]
 005E048B    mov         eax,dword ptr [eax+4]
 005E048E    push        eax
 005E048F    mov         eax,dword ptr [ebp-4]
 005E0492    mov         eax,dword ptr [eax+8C];TJvHidDeviceController.FList:TList
 005E0498    mov         edx,ebx
 005E049A    call        TList.Get
 005E049F    mov         eax,dword ptr [eax+4C]
 005E04A2    pop         edx
 005E04A3    cmp         edx,dword ptr [eax+4]
>005E04A6    jne         005E04EA
 005E04A8    mov         eax,dword ptr [ebp-4]
 005E04AB    mov         eax,dword ptr [eax+8C];TJvHidDeviceController.FList:TList
 005E04B1    mov         edx,ebx
 005E04B3    call        TList.Get
 005E04B8    cmp         byte ptr [eax+8],0
>005E04BC    je          005E04EA
 005E04BE    mov         edx,esi
 005E04C0    mov         eax,dword ptr [ebp-8]
 005E04C3    call        TList.Get
 005E04C8    xor         edx,edx
 005E04CA    mov         dword ptr [eax+4],edx
 005E04CD    mov         edx,esi
 005E04CF    mov         eax,dword ptr [ebp-8]
 005E04D2    call        TList.Get
 005E04D7    call        TObject.Free
 005E04DC    xor         ecx,ecx
 005E04DE    mov         edx,esi
 005E04E0    mov         eax,dword ptr [ebp-8]
 005E04E3    call        TList.Put
>005E04E8    jmp         005E04EE
 005E04EA    inc         ebx
 005E04EB    dec         edi
>005E04EC    jne         005E047E
 005E04EE    inc         esi
 005E04EF    dec         dword ptr [ebp-10]
>005E04F2    jne         005E046A
 005E04F8    mov         eax,dword ptr [ebp-8]
 005E04FB    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 005E04FE    dec         eax
 005E04FF    test        eax,eax
>005E0501    jl          005E054F
 005E0503    inc         eax
 005E0504    mov         dword ptr [ebp-10],eax
 005E0507    xor         esi,esi
 005E0509    mov         edx,esi
 005E050B    mov         eax,dword ptr [ebp-8]
 005E050E    call        TList.Get
 005E0513    test        eax,eax
>005E0515    je          005E0549
 005E0517    mov         edx,esi
 005E0519    mov         eax,dword ptr [ebp-8]
 005E051C    call        TList.Get
 005E0521    mov         edx,eax
 005E0523    mov         eax,dword ptr [ebp-4]
 005E0526    mov         eax,dword ptr [eax+8C];TJvHidDeviceController.FList:TList
 005E052C    call        TList.Add
 005E0531    mov         byte ptr [ebp-9],1
 005E0535    mov         edx,esi
 005E0537    mov         eax,dword ptr [ebp-8]
 005E053A    call        TList.Get
 005E053F    mov         edx,eax
 005E0541    mov         eax,dword ptr [ebp-4]
 005E0544    call        005E0160
 005E0549    inc         esi
 005E054A    dec         dword ptr [ebp-10]
>005E054D    jne         005E0509
 005E054F    mov         eax,dword ptr [ebp-8]
 005E0552    call        TObject.Free
 005E0557    mov         eax,dword ptr [ebp-4]
 005E055A    xor         edx,edx
 005E055C    mov         dword ptr [eax+90],edx;TJvHidDeviceController.FNumCheckedInDevices:Integer
 005E0562    mov         eax,dword ptr [ebp-4]
 005E0565    xor         edx,edx
 005E0567    mov         dword ptr [eax+94],edx;TJvHidDeviceController.FNumCheckedOutDevices:Integer
 005E056D    mov         eax,dword ptr [ebp-4]
 005E0570    xor         edx,edx
 005E0572    mov         dword ptr [eax+98],edx;TJvHidDeviceController.FNumUnpluggedDevices:Integer
 005E0578    mov         eax,dword ptr [ebp-4]
 005E057B    mov         eax,dword ptr [eax+8C];TJvHidDeviceController.FList:TList
 005E0581    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 005E0584    dec         eax
 005E0585    test        eax,eax
>005E0587    jl          005E05D8
 005E0589    inc         eax
 005E058A    mov         dword ptr [ebp-10],eax
 005E058D    xor         esi,esi
 005E058F    mov         eax,dword ptr [ebp-4]
 005E0592    mov         eax,dword ptr [eax+8C];TJvHidDeviceController.FList:TList
 005E0598    mov         edx,esi
 005E059A    call        TList.Get
 005E059F    mov         edi,eax
 005E05A1    movzx       eax,byte ptr [edi+9]
 005E05A5    xor         al,1
 005E05A7    and         eax,7F
 005E05AA    mov         edx,dword ptr [ebp-4]
 005E05AD    add         dword ptr [edx+90],eax;TJvHidDeviceController.FNumCheckedInDevices:Integer
 005E05B3    movzx       eax,byte ptr [edi+9]
 005E05B7    mov         edx,dword ptr [ebp-4]
 005E05BA    add         dword ptr [edx+94],eax;TJvHidDeviceController.FNumCheckedOutDevices:Integer
 005E05C0    movzx       eax,byte ptr [edi+8]
 005E05C4    xor         al,1
 005E05C6    and         eax,7F
 005E05C9    mov         edx,dword ptr [ebp-4]
 005E05CC    add         dword ptr [edx+98],eax;TJvHidDeviceController.FNumUnpluggedDevices:Integer
 005E05D2    inc         esi
 005E05D3    dec         dword ptr [ebp-10]
>005E05D6    jne         005E058F
 005E05D8    mov         eax,dword ptr [ebp-4]
 005E05DB    mov         eax,dword ptr [eax+98];TJvHidDeviceController.FNumUnpluggedDevices:Integer
 005E05E1    mov         edx,dword ptr [ebp-4]
 005E05E4    sub         dword ptr [edx+94],eax
 005E05EA    cmp         byte ptr [ebp-9],0
>005E05EE    je          005E05F8
 005E05F0    mov         eax,dword ptr [ebp-4]
 005E05F3    call        005E01A0
 005E05F8    pop         edi
 005E05F9    pop         esi
 005E05FA    pop         ebx
 005E05FB    mov         esp,ebp
 005E05FD    pop         ebp
 005E05FE    ret
*}
end;

//005E064C
{*procedure TJvHidDeviceController.HidVersion(?:?);
begin
 005E064C    push        ebp
 005E064D    mov         ebp,esp
 005E064F    add         esp,0FFFFFFF0
 005E0652    push        ebx
 005E0653    xor         ecx,ecx
 005E0655    mov         dword ptr [ebp-4],ecx
 005E0658    mov         ebx,edx
 005E065A    xor         eax,eax
 005E065C    push        ebp
 005E065D    push        5E06F4
 005E0662    push        dword ptr fs:[eax]
 005E0665    mov         dword ptr fs:[eax],esp
 005E0668    mov         eax,ebx
 005E066A    call        @UStrClr
 005E066F    lea         eax,[ebp-8]
 005E0672    push        eax
 005E0673    push        5E0700;'HID.dll'
 005E0678    call        version.GetFileVersionInfoSizeW
 005E067D    mov         dword ptr [ebp-0C],eax
 005E0680    cmp         dword ptr [ebp-0C],0
>005E0684    jbe         005E06D8
 005E0686    mov         eax,dword ptr [ebp-0C]
 005E0689    push        eax
 005E068A    lea         eax,[ebp-4]
 005E068D    mov         ecx,1
 005E0692    mov         edx,dword ptr ds:[5E0600];:TJvHidDeviceController.:1
 005E0698    call        @DynArraySetLength
 005E069D    add         esp,4
 005E06A0    mov         eax,dword ptr [ebp-4]
 005E06A3    push        eax
 005E06A4    mov         eax,dword ptr [ebp-0C]
 005E06A7    push        eax
 005E06A8    push        0FF
 005E06AA    push        5E0700;'HID.dll'
 005E06AF    call        version.GetFileVersionInfoW
 005E06B4    lea         eax,[ebp-0C]
 005E06B7    push        eax
 005E06B8    lea         eax,[ebp-10]
 005E06BB    push        eax
 005E06BC    push        5E0710;'StringFileInfo\040904E4\FileVersion'
 005E06C1    mov         eax,dword ptr [ebp-4]
 005E06C4    push        eax
 005E06C5    call        version.VerQueryValueW
 005E06CA    test        eax,eax
>005E06CC    je          005E06D8
 005E06CE    mov         eax,ebx
 005E06D0    mov         edx,dword ptr [ebp-10]
 005E06D3    call        @UStrFromPWChar
 005E06D8    xor         eax,eax
 005E06DA    pop         edx
 005E06DB    pop         ecx
 005E06DC    pop         ecx
 005E06DD    mov         dword ptr fs:[eax],edx
 005E06E0    push        5E06FB
 005E06E5    lea         eax,[ebp-4]
 005E06E8    mov         edx,dword ptr ds:[5E0600];:TJvHidDeviceController.:1
 005E06EE    call        @DynArrayClear
 005E06F3    ret
>005E06F4    jmp         @HandleFinally
>005E06F9    jmp         005E06E5
 005E06FB    pop         ebx
 005E06FC    mov         esp,ebp
 005E06FE    pop         ebp
 005E06FF    ret
end;*}

//005E0758
{*procedure TJvHidDeviceController.SetOnDeviceChange(Value:TNotifyEvent; ?:?; ?:?);
begin
 005E0758    push        ebp
 005E0759    mov         ebp,esp
 005E075B    mov         edx,dword ptr [eax+50];TJvHidDeviceController.FDeviceChangeEvent:TNotifyEvent
 005E075E    cmp         edx,dword ptr [ebp+8]
>005E0761    je          005E077A
 005E0763    mov         edx,dword ptr [ebp+8]
 005E0766    mov         dword ptr [eax+50],edx;TJvHidDeviceController.FDeviceChangeEvent:TNotifyEvent
 005E0769    mov         edx,dword ptr [ebp+0C]
 005E076C    mov         dword ptr [eax+54],edx;TJvHidDeviceController.?f54:dword
 005E076F    test        byte ptr [eax+1C],1;TJvHidDeviceController.FComponentState:TComponentState
>005E0773    jne         005E077A
 005E0775    call        TJvHidDeviceController.DeviceChange
 005E077A    pop         ebp
 005E077B    ret         8
end;*}

//005E0780
{*function sub_005E0780(?:TJvHidDeviceController; ?:Pointer; ?:?):?;
begin
 005E0780    push        ebx
 005E0781    push        esi
 005E0782    push        ecx
 005E0783    mov         dword ptr [esp],ecx
 005E0786    mov         esi,edx
 005E0788    xor         ebx,ebx
 005E078A    cmp         word ptr [eax+5A],0
>005E078F    je          005E07C7
 005E0791    mov         byte ptr [esi+0A],1
 005E0795    mov         ebx,eax
 005E0797    mov         ecx,dword ptr [esp]
 005E079A    mov         edx,esi
 005E079C    mov         eax,dword ptr [ebx+5C]
 005E079F    call        dword ptr [ebx+58]
 005E07A2    mov         ebx,eax
 005E07A4    mov         byte ptr [esi+0A],0
 005E07A8    cmp         byte ptr [esi+9],0
>005E07AC    jne         005E07C7
 005E07AE    mov         eax,esi
 005E07B0    call        TJvHidDevice.CloseFile
 005E07B5    xor         edx,edx
 005E07B7    mov         eax,esi
 005E07B9    call        TJvHidDevice.CloseFileEx
 005E07BE    mov         dl,1
 005E07C0    mov         eax,esi
 005E07C2    call        TJvHidDevice.CloseFileEx
 005E07C7    mov         eax,ebx
 005E07C9    pop         edx
 005E07CA    pop         esi
 005E07CB    pop         ebx
 005E07CC    ret
end;*}

//005E07D0
{*procedure TJvHidDeviceController.SetOnEnumerate(Value:TJvHidEnumerateEvent; ?:?; ?:?);
begin
 005E07D0    push        ebp
 005E07D1    mov         ebp,esp
 005E07D3    mov         edx,dword ptr [ebp+8]
 005E07D6    mov         dword ptr [eax+58],edx;TJvHidDeviceController.FEnumerateEvent:TJvHidEnumerateEvent
 005E07D9    mov         edx,dword ptr [ebp+0C]
 005E07DC    mov         dword ptr [eax+5C],edx;TJvHidDeviceController.?f5C:dword
 005E07DF    pop         ebp
 005E07E0    ret         8
end;*}

//005E07E4
procedure TJvHidDeviceController.SetDevThreadSleepTime(Value:Integer);
begin
{*
 005E07E4    push        ebx
 005E07E5    push        esi
 005E07E6    push        edi
 005E07E7    push        ebp
 005E07E8    mov         ebp,edx
 005E07EA    mov         ebx,eax
 005E07EC    cmp         ebp,dword ptr [ebx+80];TJvHidDeviceController.FDevThreadSleepTime:Integer
>005E07F2    je          005E082E
 005E07F4    mov         eax,dword ptr [ebx+8C];TJvHidDeviceController.FList:TList
 005E07FA    mov         esi,dword ptr [eax+8];TList.FCount:Integer
 005E07FD    dec         esi
 005E07FE    test        esi,esi
>005E0800    jl          005E0828
 005E0802    inc         esi
 005E0803    xor         edi,edi
 005E0805    mov         edx,edi
 005E0807    mov         eax,dword ptr [ebx+8C];TJvHidDeviceController.FList:TList
 005E080D    call        TList.Get
 005E0812    mov         edx,dword ptr [eax+70]
 005E0815    cmp         edx,dword ptr [ebx+80];TJvHidDeviceController.FDevThreadSleepTime:Integer
>005E081B    jne         005E0824
 005E081D    mov         edx,ebp
 005E081F    call        005DEE10
 005E0824    inc         edi
 005E0825    dec         esi
>005E0826    jne         005E0805
 005E0828    mov         dword ptr [ebx+80],ebp;TJvHidDeviceController.FDevThreadSleepTime:Integer
 005E082E    pop         ebp
 005E082F    pop         edi
 005E0830    pop         esi
 005E0831    pop         ebx
 005E0832    ret
*}
end;

//005E0834
{*procedure TJvHidDeviceController.SetOnDeviceData(Value:TJvHidDataEvent; ?:?; ?:?);
begin
 005E0834    push        ebp
 005E0835    mov         ebp,esp
 005E0837    push        ebx
 005E0838    push        esi
 005E0839    push        edi
 005E083A    mov         ebx,eax
 005E083C    mov         eax,dword ptr [ebp+8]
 005E083F    cmp         eax,dword ptr [ebx+60];TJvHidDeviceController.FDevDataEvent:TJvHidDataEvent
>005E0842    je          005E0888
 005E0844    mov         eax,dword ptr [ebx+8C];TJvHidDeviceController.FList:TList
 005E084A    mov         esi,dword ptr [eax+8];TList.FCount:Integer
 005E084D    dec         esi
 005E084E    test        esi,esi
>005E0850    jl          005E087C
 005E0852    inc         esi
 005E0853    xor         edi,edi
 005E0855    mov         edx,edi
 005E0857    mov         eax,dword ptr [ebx+8C];TJvHidDeviceController.FList:TList
 005E085D    call        TList.Get
 005E0862    mov         edx,dword ptr [eax+90]
 005E0868    cmp         edx,dword ptr [ebx+60];TJvHidDeviceController.FDevDataEvent:TJvHidDataEvent
>005E086B    jne         005E0878
 005E086D    push        dword ptr [ebp+0C]
 005E0870    push        dword ptr [ebp+8]
 005E0873    call        005DF390
 005E0878    inc         edi
 005E0879    dec         esi
>005E087A    jne         005E0855
 005E087C    mov         eax,dword ptr [ebp+8]
 005E087F    mov         dword ptr [ebx+60],eax;TJvHidDeviceController.FDevDataEvent:TJvHidDataEvent
 005E0882    mov         eax,dword ptr [ebp+0C]
 005E0885    mov         dword ptr [ebx+64],eax;TJvHidDeviceController.?f64:dword
 005E0888    pop         edi
 005E0889    pop         esi
 005E088A    pop         ebx
 005E088B    pop         ebp
 005E088C    ret         8
end;*}

//005E0890
{*procedure TJvHidDeviceController.SetOnDeviceDataError(Value:TJvHidDataErrorEvent; ?:?; ?:?);
begin
 005E0890    push        ebp
 005E0891    mov         ebp,esp
 005E0893    push        ecx
 005E0894    push        ebx
 005E0895    push        esi
 005E0896    mov         ebx,eax
 005E0898    mov         eax,dword ptr [ebp+8]
 005E089B    cmp         eax,dword ptr [ebx+68];TJvHidDeviceController.FDevDataErrorEvent:TJvHidDataErrorEvent
>005E089E    je          005E08F3
 005E08A0    mov         eax,dword ptr [ebx+8C];TJvHidDeviceController.FList:TList
 005E08A6    mov         esi,dword ptr [eax+8];TList.FCount:Integer
 005E08A9    dec         esi
 005E08AA    test        esi,esi
>005E08AC    jl          005E08E7
 005E08AE    inc         esi
 005E08AF    mov         dword ptr [ebp-4],0
 005E08B6    mov         edx,dword ptr [ebp-4]
 005E08B9    mov         eax,dword ptr [ebx+8C];TJvHidDeviceController.FList:TList
 005E08BF    call        TList.Get
 005E08C4    mov         edx,dword ptr [eax+98]
 005E08CA    cmp         edx,dword ptr [ebx+68];TJvHidDeviceController.FDevDataErrorEvent:TJvHidDataErrorEvent
>005E08CD    jne         005E08E1
 005E08CF    mov         edx,dword ptr [ebp+8]
 005E08D2    mov         dword ptr [eax+98],edx
 005E08D8    mov         edx,dword ptr [ebp+0C]
 005E08DB    mov         dword ptr [eax+9C],edx
 005E08E1    inc         dword ptr [ebp-4]
 005E08E4    dec         esi
>005E08E5    jne         005E08B6
 005E08E7    mov         eax,dword ptr [ebp+8]
 005E08EA    mov         dword ptr [ebx+68],eax;TJvHidDeviceController.FDevDataErrorEvent:TJvHidDataErrorEvent
 005E08ED    mov         eax,dword ptr [ebp+0C]
 005E08F0    mov         dword ptr [ebx+6C],eax;TJvHidDeviceController.?f6C:dword
 005E08F3    pop         esi
 005E08F4    pop         ebx
 005E08F5    pop         ecx
 005E08F6    pop         ebp
 005E08F7    ret         8
end;*}

//005E08FC
{*procedure TJvHidDeviceController.SetOnDeviceUnplug(Value:TJvHidPlugEvent; ?:?; ?:?);
begin
 005E08FC    push        ebp
 005E08FD    mov         ebp,esp
 005E08FF    push        ecx
 005E0900    push        ebx
 005E0901    push        esi
 005E0902    mov         ebx,eax
 005E0904    mov         eax,dword ptr [ebp+8]
 005E0907    cmp         eax,dword ptr [ebx+70];TJvHidDeviceController.FDevUnplugEvent:TJvHidPlugEvent
>005E090A    je          005E095F
 005E090C    mov         eax,dword ptr [ebx+8C];TJvHidDeviceController.FList:TList
 005E0912    mov         esi,dword ptr [eax+8];TList.FCount:Integer
 005E0915    dec         esi
 005E0916    test        esi,esi
>005E0918    jl          005E0953
 005E091A    inc         esi
 005E091B    mov         dword ptr [ebp-4],0
 005E0922    mov         edx,dword ptr [ebp-4]
 005E0925    mov         eax,dword ptr [ebx+8C];TJvHidDeviceController.FList:TList
 005E092B    call        TList.Get
 005E0930    mov         edx,dword ptr [eax+0A0]
 005E0936    cmp         edx,dword ptr [ebx+70];TJvHidDeviceController.FDevUnplugEvent:TJvHidPlugEvent
>005E0939    jne         005E094D
 005E093B    mov         edx,dword ptr [ebp+8]
 005E093E    mov         dword ptr [eax+0A0],edx
 005E0944    mov         edx,dword ptr [ebp+0C]
 005E0947    mov         dword ptr [eax+0A4],edx
 005E094D    inc         dword ptr [ebp-4]
 005E0950    dec         esi
>005E0951    jne         005E0922
 005E0953    mov         eax,dword ptr [ebp+8]
 005E0956    mov         dword ptr [ebx+70],eax;TJvHidDeviceController.FDevUnplugEvent:TJvHidPlugEvent
 005E0959    mov         eax,dword ptr [ebp+0C]
 005E095C    mov         dword ptr [ebx+74],eax;TJvHidDeviceController.?f74:dword
 005E095F    pop         esi
 005E0960    pop         ebx
 005E0961    pop         ecx
 005E0962    pop         ebp
 005E0963    ret         8
end;*}

//005E0968
function TJvHidDeviceController.Enumerate:Integer;
begin
{*
 005E0968    push        ebx
 005E0969    push        esi
 005E096A    push        edi
 005E096B    push        ebp
 005E096C    mov         esi,eax
 005E096E    xor         ebp,ebp
 005E0970    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0976    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 005E0979    dec         edi
 005E097A    test        edi,edi
>005E097C    jl          005E09B5
 005E097E    inc         edi
 005E097F    xor         ebx,ebx
 005E0981    mov         edx,ebx
 005E0983    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0989    call        TList.Get
 005E098E    cmp         byte ptr [eax+8],0
>005E0992    je          005E09B1
 005E0994    inc         ebp
 005E0995    mov         edx,ebx
 005E0997    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E099D    call        TList.Get
 005E09A2    mov         edx,eax
 005E09A4    mov         ecx,ebx
 005E09A6    mov         eax,esi
 005E09A8    call        005E0780
 005E09AD    test        al,al
>005E09AF    je          005E09B5
 005E09B1    inc         ebx
 005E09B2    dec         edi
>005E09B3    jne         005E0981
 005E09B5    mov         eax,ebp
 005E09B7    pop         ebp
 005E09B8    pop         edi
 005E09B9    pop         esi
 005E09BA    pop         ebx
 005E09BB    ret
*}
end;

//005E09BC
{*function sub_005E09BC(?:TJvHidDeviceController; ?:TJvHidDevice; ?:Integer; ?:?):?;
begin
 005E09BC    push        ebp
 005E09BD    mov         ebp,esp
 005E09BF    push        ecx
 005E09C0    push        ebx
 005E09C1    push        esi
 005E09C2    push        edi
 005E09C3    mov         dword ptr [ebp-4],ecx
 005E09C6    mov         edi,edx
 005E09C8    mov         esi,eax
 005E09CA    cmp         byte ptr [ebp+8],0
>005E09CE    je          005E09E4
 005E09D0    mov         edx,dword ptr [ebp-4]
 005E09D3    mov         eax,dword ptr [esi+8C]
 005E09D9    call        TList.Get
 005E09DE    cmp         byte ptr [eax+9],0
>005E09E2    je          005E09E8
 005E09E4    xor         ebx,ebx
>005E09E6    jmp         005E09EA
 005E09E8    mov         bl,1
 005E09EA    test        bl,bl
>005E09EC    je          005E0A17
 005E09EE    mov         edx,dword ptr [ebp-4]
 005E09F1    mov         eax,dword ptr [esi+8C]
 005E09F7    call        TList.Get
 005E09FC    mov         dword ptr [edi],eax
 005E09FE    mov         eax,dword ptr [edi]
 005E0A00    mov         byte ptr [eax+9],1
 005E0A04    inc         dword ptr [esi+94]
 005E0A0A    dec         dword ptr [esi+90]
 005E0A10    mov         eax,dword ptr [edi]
 005E0A12    call        005DF3C4
 005E0A17    mov         eax,ebx
 005E0A19    pop         edi
 005E0A1A    pop         esi
 005E0A1B    pop         ebx
 005E0A1C    pop         ecx
 005E0A1D    pop         ebp
 005E0A1E    ret         4
end;*}

//005E0A24
function TJvHidDeviceController.CheckOutByProductName(var HidDev:TJvHidDevice; ProductName:WideString):Boolean;
begin
{*
 005E0A24    push        ebp
 005E0A25    mov         ebp,esp
 005E0A27    add         esp,0FFFFFFF0
 005E0A2A    push        ebx
 005E0A2B    push        esi
 005E0A2C    push        edi
 005E0A2D    xor         ebx,ebx
 005E0A2F    mov         dword ptr [ebp-10],ebx
 005E0A32    mov         dword ptr [ebp-8],ecx
 005E0A35    mov         dword ptr [ebp-4],edx
 005E0A38    mov         esi,eax
 005E0A3A    xor         eax,eax
 005E0A3C    push        ebp
 005E0A3D    push        5E0AC3
 005E0A42    push        dword ptr fs:[eax]
 005E0A45    mov         dword ptr fs:[eax],esp
 005E0A48    mov         byte ptr [ebp-9],0
 005E0A4C    mov         eax,dword ptr [ebp-4]
 005E0A4F    xor         edx,edx
 005E0A51    mov         dword ptr [eax],edx
 005E0A53    mov         eax,dword ptr [ebp-8]
 005E0A56    xor         edx,edx
 005E0A58    call        @WStrEqual
>005E0A5D    je          005E0AAD
 005E0A5F    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0A65    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 005E0A68    dec         edi
 005E0A69    test        edi,edi
>005E0A6B    jl          005E0AAD
 005E0A6D    inc         edi
 005E0A6E    xor         ebx,ebx
 005E0A70    mov         edx,ebx
 005E0A72    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0A78    call        TList.Get
 005E0A7D    lea         edx,[ebp-10]
 005E0A80    call        005DEF40
 005E0A85    mov         edx,dword ptr [ebp-10]
 005E0A88    mov         eax,dword ptr [ebp-8]
 005E0A8B    call        @WStrEqual
 005E0A90    sete        al
 005E0A93    push        eax
 005E0A94    mov         edx,dword ptr [ebp-4]
 005E0A97    mov         ecx,ebx
 005E0A99    mov         eax,esi
 005E0A9B    call        005E09BC
 005E0AA0    mov         byte ptr [ebp-9],al
 005E0AA3    cmp         byte ptr [ebp-9],0
>005E0AA7    jne         005E0AAD
 005E0AA9    inc         ebx
 005E0AAA    dec         edi
>005E0AAB    jne         005E0A70
 005E0AAD    xor         eax,eax
 005E0AAF    pop         edx
 005E0AB0    pop         ecx
 005E0AB1    pop         ecx
 005E0AB2    mov         dword ptr fs:[eax],edx
 005E0AB5    push        5E0ACA
 005E0ABA    lea         eax,[ebp-10]
 005E0ABD    call        @WStrClr
 005E0AC2    ret
>005E0AC3    jmp         @HandleFinally
>005E0AC8    jmp         005E0ABA
 005E0ACA    movzx       eax,byte ptr [ebp-9]
 005E0ACE    pop         edi
 005E0ACF    pop         esi
 005E0AD0    pop         ebx
 005E0AD1    mov         esp,ebp
 005E0AD3    pop         ebp
 005E0AD4    ret
*}
end;

//005E0AD8
function TJvHidDeviceController.CheckOutByVendorName(var HidDev:TJvHidDevice; VendorName:WideString):Boolean;
begin
{*
 005E0AD8    push        ebp
 005E0AD9    mov         ebp,esp
 005E0ADB    add         esp,0FFFFFFF0
 005E0ADE    push        ebx
 005E0ADF    push        esi
 005E0AE0    push        edi
 005E0AE1    xor         ebx,ebx
 005E0AE3    mov         dword ptr [ebp-10],ebx
 005E0AE6    mov         dword ptr [ebp-8],ecx
 005E0AE9    mov         dword ptr [ebp-4],edx
 005E0AEC    mov         esi,eax
 005E0AEE    xor         eax,eax
 005E0AF0    push        ebp
 005E0AF1    push        5E0B77
 005E0AF6    push        dword ptr fs:[eax]
 005E0AF9    mov         dword ptr fs:[eax],esp
 005E0AFC    mov         byte ptr [ebp-9],0
 005E0B00    mov         eax,dword ptr [ebp-4]
 005E0B03    xor         edx,edx
 005E0B05    mov         dword ptr [eax],edx
 005E0B07    mov         eax,dword ptr [ebp-8]
 005E0B0A    xor         edx,edx
 005E0B0C    call        @WStrEqual
>005E0B11    je          005E0B61
 005E0B13    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0B19    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 005E0B1C    dec         edi
 005E0B1D    test        edi,edi
>005E0B1F    jl          005E0B61
 005E0B21    inc         edi
 005E0B22    xor         ebx,ebx
 005E0B24    mov         edx,ebx
 005E0B26    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0B2C    call        TList.Get
 005E0B31    lea         edx,[ebp-10]
 005E0B34    call        005DEEC8
 005E0B39    mov         edx,dword ptr [ebp-10]
 005E0B3C    mov         eax,dword ptr [ebp-8]
 005E0B3F    call        @WStrEqual
 005E0B44    sete        al
 005E0B47    push        eax
 005E0B48    mov         edx,dword ptr [ebp-4]
 005E0B4B    mov         ecx,ebx
 005E0B4D    mov         eax,esi
 005E0B4F    call        005E09BC
 005E0B54    mov         byte ptr [ebp-9],al
 005E0B57    cmp         byte ptr [ebp-9],0
>005E0B5B    jne         005E0B61
 005E0B5D    inc         ebx
 005E0B5E    dec         edi
>005E0B5F    jne         005E0B24
 005E0B61    xor         eax,eax
 005E0B63    pop         edx
 005E0B64    pop         ecx
 005E0B65    pop         ecx
 005E0B66    mov         dword ptr fs:[eax],edx
 005E0B69    push        5E0B7E
 005E0B6E    lea         eax,[ebp-10]
 005E0B71    call        @WStrClr
 005E0B76    ret
>005E0B77    jmp         @HandleFinally
>005E0B7C    jmp         005E0B6E
 005E0B7E    movzx       eax,byte ptr [ebp-9]
 005E0B82    pop         edi
 005E0B83    pop         esi
 005E0B84    pop         ebx
 005E0B85    mov         esp,ebp
 005E0B87    pop         ebp
 005E0B88    ret
*}
end;

//005E0B8C
procedure TJvHidDeviceController.CheckOutByCallback(var HidDev:TJvHidDevice; Check:TJvHidCheckCallback);
begin
{*
 005E0B8C    push        ebx
 005E0B8D    push        esi
 005E0B8E    push        edi
 005E0B8F    push        ebp
 005E0B90    add         esp,0FFFFFFF4
 005E0B93    mov         dword ptr [esp+4],ecx
 005E0B97    mov         dword ptr [esp],edx
 005E0B9A    mov         ebp,eax
 005E0B9C    mov         byte ptr [esp+8],0
 005E0BA1    mov         eax,dword ptr [esp]
 005E0BA4    xor         edx,edx
 005E0BA6    mov         dword ptr [eax],edx
 005E0BA8    mov         eax,dword ptr [ebp+8C];TJvHidDeviceController.FList:TList
 005E0BAE    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 005E0BB1    dec         edi
 005E0BB2    test        edi,edi
>005E0BB4    jl          005E0C18
 005E0BB6    inc         edi
 005E0BB7    xor         esi,esi
 005E0BB9    mov         eax,dword ptr [ebp+8C];TJvHidDeviceController.FList:TList
 005E0BBF    mov         edx,esi
 005E0BC1    call        TList.Get
 005E0BC6    mov         ebx,eax
 005E0BC8    cmp         byte ptr [ebx+9],0
>005E0BCC    jne         005E0C14
 005E0BCE    mov         byte ptr [ebx+0A],1
 005E0BD2    push        ebx
 005E0BD3    call        dword ptr [esp+8]
 005E0BD7    push        eax
 005E0BD8    mov         edx,dword ptr [esp+4]
 005E0BDC    mov         ecx,esi
 005E0BDE    mov         eax,ebp
 005E0BE0    call        005E09BC
 005E0BE5    mov         byte ptr [esp+8],al
 005E0BE9    mov         byte ptr [ebx+0A],0
 005E0BED    cmp         byte ptr [esp+8],0
>005E0BF2    jne         005E0C0D
 005E0BF4    mov         eax,ebx
 005E0BF6    call        TJvHidDevice.CloseFile
 005E0BFB    xor         edx,edx
 005E0BFD    mov         eax,ebx
 005E0BFF    call        TJvHidDevice.CloseFileEx
 005E0C04    mov         dl,1
 005E0C06    mov         eax,ebx
 005E0C08    call        TJvHidDevice.CloseFileEx
 005E0C0D    cmp         byte ptr [esp+8],0
>005E0C12    jne         005E0C18
 005E0C14    inc         esi
 005E0C15    dec         edi
>005E0C16    jne         005E0BB9
 005E0C18    movzx       eax,byte ptr [esp+8]
 005E0C1D    add         esp,0C
 005E0C20    pop         ebp
 005E0C21    pop         edi
 005E0C22    pop         esi
 005E0C23    pop         ebx
 005E0C24    ret
*}
end;

//005E0C28
function TJvHidDeviceController.CheckOutByClass(var HidDev:TJvHidDevice; ClassName:string):Boolean;
begin
{*
 005E0C28    push        ebx
 005E0C29    push        esi
 005E0C2A    push        edi
 005E0C2B    push        ebp
 005E0C2C    add         esp,0FFFFFFF8
 005E0C2F    mov         dword ptr [esp],ecx
 005E0C32    mov         ebp,edx
 005E0C34    mov         esi,eax
 005E0C36    mov         byte ptr [esp+4],0
 005E0C3B    xor         eax,eax
 005E0C3D    mov         dword ptr [ebp],eax
 005E0C40    cmp         dword ptr [esp],0
>005E0C44    je          005E0C90
 005E0C46    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0C4C    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 005E0C4F    dec         edi
 005E0C50    test        edi,edi
>005E0C52    jl          005E0C90
 005E0C54    inc         edi
 005E0C55    xor         ebx,ebx
 005E0C57    mov         edx,ebx
 005E0C59    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0C5F    call        TList.Get
 005E0C64    mov         eax,dword ptr [eax+4C]
 005E0C67    mov         edx,dword ptr [eax+10]
 005E0C6A    mov         eax,dword ptr [esp]
 005E0C6D    call        @UStrEqual
 005E0C72    sete        al
 005E0C75    push        eax
 005E0C76    mov         edx,ebp
 005E0C78    mov         ecx,ebx
 005E0C7A    mov         eax,esi
 005E0C7C    call        005E09BC
 005E0C81    mov         byte ptr [esp+4],al
 005E0C85    cmp         byte ptr [esp+4],0
>005E0C8A    jne         005E0C90
 005E0C8C    inc         ebx
 005E0C8D    dec         edi
>005E0C8E    jne         005E0C57
 005E0C90    movzx       eax,byte ptr [esp+4]
 005E0C95    pop         ecx
 005E0C96    pop         edx
 005E0C97    pop         ebp
 005E0C98    pop         edi
 005E0C99    pop         esi
 005E0C9A    pop         ebx
 005E0C9B    ret
*}
end;

//005E0C9C
procedure TJvHidDeviceController.CheckOutByID(var HidDev:TJvHidDevice; Vid:Integer; Pid:Integer);
begin
{*
 005E0C9C    push        ebp
 005E0C9D    mov         ebp,esp
 005E0C9F    add         esp,0FFFFFFF8
 005E0CA2    push        ebx
 005E0CA3    push        esi
 005E0CA4    push        edi
 005E0CA5    mov         dword ptr [ebp-8],ecx
 005E0CA8    mov         dword ptr [ebp-4],edx
 005E0CAB    mov         esi,eax
 005E0CAD    xor         eax,eax
 005E0CAF    mov         edx,dword ptr [ebp-4]
 005E0CB2    xor         ecx,ecx
 005E0CB4    mov         dword ptr [edx],ecx
 005E0CB6    mov         edx,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0CBC    mov         edi,dword ptr [edx+8];TList.FCount:Integer
 005E0CBF    dec         edi
 005E0CC0    test        edi,edi
>005E0CC2    jl          005E0D14
 005E0CC4    inc         edi
 005E0CC5    xor         ebx,ebx
 005E0CC7    mov         edx,ebx
 005E0CC9    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0CCF    call        TList.Get
 005E0CD4    movzx       eax,word ptr [eax+44]
 005E0CD8    cmp         eax,dword ptr [ebp-8]
>005E0CDB    jne         005E0CF9
 005E0CDD    mov         edx,ebx
 005E0CDF    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0CE5    call        TList.Get
 005E0CEA    movzx       eax,word ptr [eax+46]
 005E0CEE    cmp         eax,dword ptr [ebp+8]
>005E0CF1    je          005E0CFD
 005E0CF3    cmp         dword ptr [ebp+8],0FFFFFFFF
>005E0CF7    je          005E0CFD
 005E0CF9    xor         eax,eax
>005E0CFB    jmp         005E0CFF
 005E0CFD    mov         al,1
 005E0CFF    push        eax
 005E0D00    mov         edx,dword ptr [ebp-4]
 005E0D03    mov         ecx,ebx
 005E0D05    mov         eax,esi
 005E0D07    call        005E09BC
 005E0D0C    test        al,al
>005E0D0E    jne         005E0D14
 005E0D10    inc         ebx
 005E0D11    dec         edi
>005E0D12    jne         005E0CC7
 005E0D14    pop         edi
 005E0D15    pop         esi
 005E0D16    pop         ebx
 005E0D17    pop         ecx
 005E0D18    pop         ecx
 005E0D19    pop         ebp
 005E0D1A    ret         4
*}
end;

//005E0D20
function TJvHidDeviceController.CheckOutByIndex(var HidDev:TJvHidDevice; Idx:Integer):Boolean;
begin
{*
 005E0D20    push        ebx
 005E0D21    push        esi
 005E0D22    mov         esi,edx
 005E0D24    xor         edx,edx
 005E0D26    xor         ebx,ebx
 005E0D28    mov         dword ptr [esi],ebx
 005E0D2A    test        ecx,ecx
>005E0D2C    jl          005E0D44
 005E0D2E    mov         ebx,dword ptr [eax+8C];TJvHidDeviceController.FList:TList
 005E0D34    cmp         ecx,dword ptr [ebx+8];TList.FCount:Integer
>005E0D37    jge         005E0D44
 005E0D39    push        1
 005E0D3B    mov         edx,esi
 005E0D3D    call        005E09BC
 005E0D42    mov         edx,eax
 005E0D44    mov         eax,edx
 005E0D46    pop         esi
 005E0D47    pop         ebx
 005E0D48    ret
*}
end;

//005E0D4C
procedure TJvHidDeviceController.CheckOut(var HidDev:TJvHidDevice);
begin
{*
 005E0D4C    push        ebx
 005E0D4D    push        esi
 005E0D4E    push        edi
 005E0D4F    push        ecx
 005E0D50    mov         dword ptr [esp],edx
 005E0D53    mov         edi,eax
 005E0D55    xor         eax,eax
 005E0D57    mov         edx,dword ptr [esp]
 005E0D5A    xor         ecx,ecx
 005E0D5C    mov         dword ptr [edx],ecx
 005E0D5E    mov         edx,dword ptr [edi+8C];TJvHidDeviceController.FList:TList
 005E0D64    mov         ebx,dword ptr [edx+8];TList.FCount:Integer
 005E0D67    dec         ebx
 005E0D68    test        ebx,ebx
>005E0D6A    jl          005E0D86
 005E0D6C    inc         ebx
 005E0D6D    xor         esi,esi
 005E0D6F    push        1
 005E0D71    mov         edx,dword ptr [esp+4]
 005E0D75    mov         ecx,esi
 005E0D77    mov         eax,edi
 005E0D79    call        005E09BC
 005E0D7E    test        al,al
>005E0D80    jne         005E0D86
 005E0D82    inc         esi
 005E0D83    dec         ebx
>005E0D84    jne         005E0D6F
 005E0D86    pop         edx
 005E0D87    pop         edi
 005E0D88    pop         esi
 005E0D89    pop         ebx
 005E0D8A    ret
*}
end;

//005E0D8C
procedure TJvHidDeviceController.CheckIn(var HidDev:TJvHidDevice);
begin
{*
 005E0D8C    push        ebx
 005E0D8D    push        esi
 005E0D8E    mov         ebx,edx
 005E0D90    mov         esi,eax
 005E0D92    cmp         dword ptr [ebx],0
>005E0D95    je          005E0DDE
 005E0D97    mov         eax,dword ptr [ebx]
 005E0D99    call        005DF408
 005E0D9E    mov         eax,dword ptr [ebx]
 005E0DA0    call        TJvHidDevice.CloseFile
 005E0DA5    mov         eax,dword ptr [ebx]
 005E0DA7    xor         edx,edx
 005E0DA9    call        TJvHidDevice.CloseFileEx
 005E0DAE    mov         eax,dword ptr [ebx]
 005E0DB0    mov         dl,1
 005E0DB2    call        TJvHidDevice.CloseFileEx
 005E0DB7    mov         eax,dword ptr [ebx]
 005E0DB9    cmp         byte ptr [eax+8],0;TJvHidDevice.FIsPluggedIn:Boolean
>005E0DBD    je          005E0DD3
 005E0DBF    mov         eax,dword ptr [ebx]
 005E0DC1    mov         byte ptr [eax+9],0;TJvHidDevice.FIsCheckedOut:Boolean
 005E0DC5    dec         dword ptr [esi+94];TJvHidDeviceController.FNumCheckedOutDevices:Integer
 005E0DCB    inc         dword ptr [esi+90];TJvHidDeviceController.FNumCheckedInDevices:Integer
>005E0DD1    jmp         005E0DDA
 005E0DD3    mov         eax,dword ptr [ebx]
 005E0DD5    call        TObject.Free
 005E0DDA    xor         eax,eax
 005E0DDC    mov         dword ptr [ebx],eax
 005E0DDE    pop         esi
 005E0DDF    pop         ebx
 005E0DE0    ret
*}
end;

//005E0DE4
function TJvHidDeviceController.CountByClass(ClassName:string):Integer;
begin
{*
 005E0DE4    push        ebx
 005E0DE5    push        esi
 005E0DE6    push        edi
 005E0DE7    push        ebp
 005E0DE8    push        ecx
 005E0DE9    mov         ebp,edx
 005E0DEB    mov         esi,eax
 005E0DED    xor         eax,eax
 005E0DEF    mov         dword ptr [esp],eax
 005E0DF2    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0DF8    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 005E0DFB    dec         edi
 005E0DFC    test        edi,edi
>005E0DFE    jl          005E0E39
 005E0E00    inc         edi
 005E0E01    xor         ebx,ebx
 005E0E03    mov         edx,ebx
 005E0E05    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0E0B    call        TList.Get
 005E0E10    cmp         byte ptr [eax+8],0
>005E0E14    je          005E0E35
 005E0E16    mov         edx,ebx
 005E0E18    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0E1E    call        TList.Get
 005E0E23    mov         eax,dword ptr [eax+4C]
 005E0E26    mov         edx,dword ptr [eax+10]
 005E0E29    mov         eax,ebp
 005E0E2B    call        @UStrEqual
>005E0E30    jne         005E0E35
 005E0E32    inc         dword ptr [esp]
 005E0E35    inc         ebx
 005E0E36    dec         edi
>005E0E37    jne         005E0E03
 005E0E39    mov         eax,dword ptr [esp]
 005E0E3C    pop         edx
 005E0E3D    pop         ebp
 005E0E3E    pop         edi
 005E0E3F    pop         esi
 005E0E40    pop         ebx
 005E0E41    ret
*}
end;

//005E0E44
function TJvHidDeviceController.CountByID(Vid:Integer; Pid:Integer):Integer;
begin
{*
 005E0E44    push        ebx
 005E0E45    push        esi
 005E0E46    push        edi
 005E0E47    push        ebp
 005E0E48    add         esp,0FFFFFFF8
 005E0E4B    mov         ebp,ecx
 005E0E4D    mov         dword ptr [esp],edx
 005E0E50    mov         esi,eax
 005E0E52    xor         eax,eax
 005E0E54    mov         dword ptr [esp+4],eax
 005E0E58    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0E5E    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 005E0E61    dec         edi
 005E0E62    test        edi,edi
>005E0E64    jl          005E0EB4
 005E0E66    inc         edi
 005E0E67    xor         ebx,ebx
 005E0E69    mov         edx,ebx
 005E0E6B    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0E71    call        TList.Get
 005E0E76    cmp         byte ptr [eax+8],0
>005E0E7A    je          005E0EB0
 005E0E7C    mov         edx,ebx
 005E0E7E    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0E84    call        TList.Get
 005E0E89    movzx       eax,word ptr [eax+44]
 005E0E8D    cmp         eax,dword ptr [esp]
>005E0E90    jne         005E0EB0
 005E0E92    mov         edx,ebx
 005E0E94    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0E9A    call        TList.Get
 005E0E9F    movzx       eax,word ptr [eax+46]
 005E0EA3    cmp         ebp,eax
>005E0EA5    je          005E0EAC
 005E0EA7    cmp         ebp,0FFFFFFFF
>005E0EAA    jne         005E0EB0
 005E0EAC    inc         dword ptr [esp+4]
 005E0EB0    inc         ebx
 005E0EB1    dec         edi
>005E0EB2    jne         005E0E69
 005E0EB4    mov         eax,dword ptr [esp+4]
 005E0EB8    pop         ecx
 005E0EB9    pop         edx
 005E0EBA    pop         ebp
 005E0EBB    pop         edi
 005E0EBC    pop         esi
 005E0EBD    pop         ebx
 005E0EBE    ret
*}
end;

//005E0EC0
function TJvHidDeviceController.CountByProductName(ProductName:WideString):Integer;
begin
{*
 005E0EC0    push        ebp
 005E0EC1    mov         ebp,esp
 005E0EC3    add         esp,0FFFFFFF4
 005E0EC6    push        ebx
 005E0EC7    push        esi
 005E0EC8    push        edi
 005E0EC9    xor         ecx,ecx
 005E0ECB    mov         dword ptr [ebp-0C],ecx
 005E0ECE    mov         dword ptr [ebp-4],edx
 005E0ED1    mov         esi,eax
 005E0ED3    xor         eax,eax
 005E0ED5    push        ebp
 005E0ED6    push        5E0F49
 005E0EDB    push        dword ptr fs:[eax]
 005E0EDE    mov         dword ptr fs:[eax],esp
 005E0EE1    xor         eax,eax
 005E0EE3    mov         dword ptr [ebp-8],eax
 005E0EE6    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0EEC    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 005E0EEF    dec         edi
 005E0EF0    test        edi,edi
>005E0EF2    jl          005E0F33
 005E0EF4    inc         edi
 005E0EF5    xor         ebx,ebx
 005E0EF7    mov         edx,ebx
 005E0EF9    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0EFF    call        TList.Get
 005E0F04    cmp         byte ptr [eax+8],0
>005E0F08    je          005E0F2F
 005E0F0A    mov         edx,ebx
 005E0F0C    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0F12    call        TList.Get
 005E0F17    lea         edx,[ebp-0C]
 005E0F1A    call        005DEF40
 005E0F1F    mov         edx,dword ptr [ebp-0C]
 005E0F22    mov         eax,dword ptr [ebp-4]
 005E0F25    call        @WStrEqual
>005E0F2A    jne         005E0F2F
 005E0F2C    inc         dword ptr [ebp-8]
 005E0F2F    inc         ebx
 005E0F30    dec         edi
>005E0F31    jne         005E0EF7
 005E0F33    xor         eax,eax
 005E0F35    pop         edx
 005E0F36    pop         ecx
 005E0F37    pop         ecx
 005E0F38    mov         dword ptr fs:[eax],edx
 005E0F3B    push        5E0F50
 005E0F40    lea         eax,[ebp-0C]
 005E0F43    call        @WStrClr
 005E0F48    ret
>005E0F49    jmp         @HandleFinally
>005E0F4E    jmp         005E0F40
 005E0F50    mov         eax,dword ptr [ebp-8]
 005E0F53    pop         edi
 005E0F54    pop         esi
 005E0F55    pop         ebx
 005E0F56    mov         esp,ebp
 005E0F58    pop         ebp
 005E0F59    ret
*}
end;

//005E0F5C
function TJvHidDeviceController.CountByVendorName(VendorName:WideString):Integer;
begin
{*
 005E0F5C    push        ebp
 005E0F5D    mov         ebp,esp
 005E0F5F    add         esp,0FFFFFFF4
 005E0F62    push        ebx
 005E0F63    push        esi
 005E0F64    push        edi
 005E0F65    xor         ecx,ecx
 005E0F67    mov         dword ptr [ebp-0C],ecx
 005E0F6A    mov         dword ptr [ebp-4],edx
 005E0F6D    mov         esi,eax
 005E0F6F    xor         eax,eax
 005E0F71    push        ebp
 005E0F72    push        5E0FE5
 005E0F77    push        dword ptr fs:[eax]
 005E0F7A    mov         dword ptr fs:[eax],esp
 005E0F7D    xor         eax,eax
 005E0F7F    mov         dword ptr [ebp-8],eax
 005E0F82    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0F88    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 005E0F8B    dec         edi
 005E0F8C    test        edi,edi
>005E0F8E    jl          005E0FCF
 005E0F90    inc         edi
 005E0F91    xor         ebx,ebx
 005E0F93    mov         edx,ebx
 005E0F95    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0F9B    call        TList.Get
 005E0FA0    cmp         byte ptr [eax+8],0
>005E0FA4    je          005E0FCB
 005E0FA6    mov         edx,ebx
 005E0FA8    mov         eax,dword ptr [esi+8C];TJvHidDeviceController.FList:TList
 005E0FAE    call        TList.Get
 005E0FB3    lea         edx,[ebp-0C]
 005E0FB6    call        005DEEC8
 005E0FBB    mov         edx,dword ptr [ebp-0C]
 005E0FBE    mov         eax,dword ptr [ebp-4]
 005E0FC1    call        @WStrEqual
>005E0FC6    jne         005E0FCB
 005E0FC8    inc         dword ptr [ebp-8]
 005E0FCB    inc         ebx
 005E0FCC    dec         edi
>005E0FCD    jne         005E0F93
 005E0FCF    xor         eax,eax
 005E0FD1    pop         edx
 005E0FD2    pop         ecx
 005E0FD3    pop         ecx
 005E0FD4    mov         dword ptr fs:[eax],edx
 005E0FD7    push        5E0FEC
 005E0FDC    lea         eax,[ebp-0C]
 005E0FDF    call        @WStrClr
 005E0FE4    ret
>005E0FE5    jmp         @HandleFinally
>005E0FEA    jmp         005E0FDC
 005E0FEC    mov         eax,dword ptr [ebp-8]
 005E0FEF    pop         edi
 005E0FF0    pop         esi
 005E0FF1    pop         ebx
 005E0FF2    mov         esp,ebp
 005E0FF4    pop         ebp
 005E0FF5    ret
*}
end;

//005E0FF8
function TJvHidDeviceController.CountByCallback(Check:TJvHidCheckCallback):Integer;
begin
{*
 005E0FF8    push        ebx
 005E0FF9    push        esi
 005E0FFA    push        edi
 005E0FFB    push        ebp
 005E0FFC    add         esp,0FFFFFFF8
 005E0FFF    mov         dword ptr [esp],edx
 005E1002    mov         ebp,eax
 005E1004    xor         eax,eax
 005E1006    mov         dword ptr [esp+4],eax
 005E100A    mov         eax,dword ptr [ebp+8C];TJvHidDeviceController.FList:TList
 005E1010    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 005E1013    dec         edi
 005E1014    test        edi,edi
>005E1016    jl          005E1075
 005E1018    inc         edi
 005E1019    xor         esi,esi
 005E101B    mov         eax,dword ptr [ebp+8C];TJvHidDeviceController.FList:TList
 005E1021    mov         edx,esi
 005E1023    call        TList.Get
 005E1028    cmp         byte ptr [eax+8],0
>005E102C    je          005E1071
 005E102E    mov         eax,dword ptr [ebp+8C];TJvHidDeviceController.FList:TList
 005E1034    mov         edx,esi
 005E1036    call        TList.Get
 005E103B    mov         ebx,eax
 005E103D    mov         byte ptr [ebx+0A],1
 005E1041    push        ebx
 005E1042    call        dword ptr [esp+4]
 005E1046    test        al,al
>005E1048    je          005E104E
 005E104A    inc         dword ptr [esp+4]
 005E104E    mov         byte ptr [ebx+0A],0
 005E1052    cmp         byte ptr [ebx+9],0
>005E1056    jne         005E1071
 005E1058    mov         eax,ebx
 005E105A    call        TJvHidDevice.CloseFile
 005E105F    xor         edx,edx
 005E1061    mov         eax,ebx
 005E1063    call        TJvHidDevice.CloseFileEx
 005E1068    mov         dl,1
 005E106A    mov         eax,ebx
 005E106C    call        TJvHidDevice.CloseFileEx
 005E1071    inc         esi
 005E1072    dec         edi
>005E1073    jne         005E101B
 005E1075    mov         eax,dword ptr [esp+4]
 005E1079    pop         ecx
 005E107A    pop         edx
 005E107B    pop         ebp
 005E107C    pop         edi
 005E107D    pop         esi
 005E107E    pop         ebx
 005E107F    ret
*}
end;

//005E12AC
constructor TAccelerometers.Create;
begin
{*
 005E12AC    test        dl,dl
>005E12AE    je          005E12B8
 005E12B0    add         esp,0FFFFFFF0
 005E12B3    call        @ClassCreate
 005E12B8    mov         dword ptr [eax+28],0EB851EB8;TAccelerometers.tolerance:Double
 005E12BF    mov         dword ptr [eax+2C],3F9EB851;TAccelerometers.?f2C:dword
 005E12C6    xor         ecx,ecx
 005E12C8    mov         dword ptr [eax+38],ecx;TAccelerometers.upy:Double
 005E12CB    mov         dword ptr [eax+3C],3FF00000;TAccelerometers.?f3C:dword
 005E12D2    test        dl,dl
>005E12D4    je          005E12E5
 005E12D6    call        @AfterConstruction
 005E12DB    pop         dword ptr fs:[0]
 005E12E2    add         esp,0C
 005E12E5    ret
*}
end;

//005E12E8
{*function TAccelerometers.Reset:?;
begin
 005E12E8    xor         edx,edx
 005E12EA    mov         dword ptr [eax+8],edx;TAccelerometers.gx:Double
 005E12ED    mov         dword ptr [eax+0C],edx;TAccelerometers.?fC:dword
 005E12F0    xor         edx,edx
 005E12F2    mov         dword ptr [eax+10],edx;TAccelerometers.gy:Double
 005E12F5    mov         dword ptr [eax+14],edx;TAccelerometers.?f14:dword
 005E12F8    xor         edx,edx
 005E12FA    mov         dword ptr [eax+18],edx;TAccelerometers.gz:Double
 005E12FD    mov         dword ptr [eax+1C],edx;TAccelerometers.?f1C:dword
 005E1300    xor         edx,edx
 005E1302    mov         dword ptr [eax+20],edx;TAccelerometers.lng:Double
 005E1305    mov         dword ptr [eax+24],edx;TAccelerometers.?f24:dword
 005E1308    xor         edx,edx
 005E130A    mov         dword ptr [eax+30],edx;TAccelerometers.upx:Double
 005E130D    mov         dword ptr [eax+34],edx;TAccelerometers.?f34:dword
 005E1310    xor         edx,edx
 005E1312    mov         dword ptr [eax+38],edx;TAccelerometers.upy:Double
 005E1315    mov         dword ptr [eax+3C],3FF00000;TAccelerometers.?f3C:dword
 005E131C    xor         edx,edx
 005E131E    mov         dword ptr [eax+40],edx;TAccelerometers.upz:Double
 005E1321    mov         dword ptr [eax+44],edx;TAccelerometers.?f44:dword
 005E1324    xor         edx,edx
 005E1326    mov         dword ptr [eax+48],edx;TAccelerometers.pitch:Double
 005E1329    mov         dword ptr [eax+4C],edx;TAccelerometers.?f4C:dword
 005E132C    xor         edx,edx
 005E132E    mov         dword ptr [eax+50],edx;TAccelerometers.roll:Double
 005E1331    mov         dword ptr [eax+54],edx;TAccelerometers.?f54:dword
 005E1334    xor         edx,edx
 005E1336    mov         dword ptr [eax+58],edx;TAccelerometers.SmoothPitch:Double
 005E1339    mov         dword ptr [eax+5C],edx;TAccelerometers.?f5C:dword
 005E133C    xor         edx,edx
 005E133E    mov         dword ptr [eax+60],edx;TAccelerometers.SmoothRoll:Double
 005E1341    mov         dword ptr [eax+64],edx;TAccelerometers.?f64:dword
 005E1344    ret
end;*}

//005E1348
{*procedure TAccelerometers.Update(newgz:Double; ?:?; newgy:Double; ?:?; newgx:Double; ?:?);
begin
 005E1348    push        ebp
 005E1349    mov         ebp,esp
 005E134B    add         esp,0FFFFFF98
 005E134E    push        ebx
 005E134F    mov         ebx,eax
 005E1351    mov         eax,dword ptr [ebp+18]
 005E1354    mov         dword ptr [ebx+8],eax;TAccelerometers.gx:Double
 005E1357    mov         eax,dword ptr [ebp+1C]
 005E135A    mov         dword ptr [ebx+0C],eax;TAccelerometers.?fC:dword
 005E135D    mov         eax,dword ptr [ebp+10]
 005E1360    mov         dword ptr [ebx+10],eax;TAccelerometers.gy:Double
 005E1363    mov         eax,dword ptr [ebp+14]
 005E1366    mov         dword ptr [ebx+14],eax;TAccelerometers.?f14:dword
 005E1369    mov         eax,dword ptr [ebp+8]
 005E136C    mov         dword ptr [ebx+18],eax;TAccelerometers.gz:Double
 005E136F    mov         eax,dword ptr [ebp+0C]
 005E1372    mov         dword ptr [ebx+1C],eax;TAccelerometers.?f1C:dword
 005E1375    fld         qword ptr [ebx+8];TAccelerometers.gx:Double
 005E1378    fmul        st,st(0)
 005E137A    fstp        tbyte ptr [ebp-5C]
 005E137D    wait
 005E137E    fld         qword ptr [ebx+10];TAccelerometers.gy:Double
 005E1381    fmul        st,st(0)
 005E1383    fld         tbyte ptr [ebp-5C]
 005E1386    faddp       st(1),st
 005E1388    fstp        tbyte ptr [ebp-68]
 005E138B    wait
 005E138C    fld         qword ptr [ebx+18];TAccelerometers.gz:Double
 005E138F    fmul        st,st(0)
 005E1391    fld         tbyte ptr [ebp-68]
 005E1394    faddp       st(1),st
 005E1396    add         esp,0FFFFFFF4
 005E1399    fstp        tbyte ptr [esp]
 005E139C    wait
 005E139D    call        Sqrt
 005E13A2    fstp        qword ptr [ebx+20];TAccelerometers.lng:Double
 005E13A5    wait
 005E13A6    fld         dword ptr ds:[5E14AC];1:Single
 005E13AC    fsub        qword ptr [ebx+28];TAccelerometers.tolerance:Double
 005E13AF    fcomp       qword ptr [ebx+20];TAccelerometers.lng:Double
 005E13B2    wait
 005E13B3    fnstsw      al
 005E13B5    sahf
>005E13B6    ja          005E143F
 005E13BC    fld         dword ptr ds:[5E14AC];1:Single
 005E13C2    fadd        qword ptr [ebx+28];TAccelerometers.tolerance:Double
 005E13C5    fcomp       qword ptr [ebx+20];TAccelerometers.lng:Double
 005E13C8    wait
 005E13C9    fnstsw      al
 005E13CB    sahf
>005E13CC    jb          005E143F
 005E13CE    fld         qword ptr [ebx+8];TAccelerometers.gx:Double
 005E13D1    fdiv        qword ptr [ebx+20];TAccelerometers.lng:Double
 005E13D4    fstp        qword ptr [ebx+30];TAccelerometers.upx:Double
 005E13D7    wait
 005E13D8    fld         qword ptr [ebx+10];TAccelerometers.gy:Double
 005E13DB    fdiv        qword ptr [ebx+20];TAccelerometers.lng:Double
 005E13DE    fstp        qword ptr [ebx+38];TAccelerometers.upy:Double
 005E13E1    wait
 005E13E2    fld         qword ptr [ebx+18];TAccelerometers.gz:Double
 005E13E5    fdiv        qword ptr [ebx+20];TAccelerometers.lng:Double
 005E13E8    fstp        qword ptr [ebx+40];TAccelerometers.upz:Double
 005E13EB    wait
 005E13EC    push        dword ptr [ebx+34];TAccelerometers.?f34:dword
 005E13EF    push        dword ptr [ebx+30];TAccelerometers.upx:Double
 005E13F2    push        dword ptr [ebx+3C];TAccelerometers.?f3C:dword
 005E13F5    push        dword ptr [ebx+38];TAccelerometers.upy:Double
 005E13F8    call        00454A9C
 005E13FD    fstp        qword ptr [ebp-8]
 005E1400    wait
 005E1401    fld         tbyte ptr ds:[5E14B0];57.2957795130823:Extended
 005E1407    fmul        qword ptr [ebp-8]
 005E140A    fstp        qword ptr [ebp-10]
 005E140D    wait
 005E140E    fld         qword ptr [ebp-10]
 005E1411    fchs
 005E1413    fstp        qword ptr [ebx+50];TAccelerometers.roll:Double
 005E1416    wait
 005E1417    push        dword ptr [ebx+44];TAccelerometers.?f44:dword
 005E141A    push        dword ptr [ebx+40];TAccelerometers.upz:Double
 005E141D    call        00454A5C
 005E1422    fstp        qword ptr [ebp-18]
 005E1425    wait
 005E1426    fld         tbyte ptr ds:[5E14B0];57.2957795130823:Extended
 005E142C    fmul        qword ptr [ebp-18]
 005E142F    fstp        qword ptr [ebp-20]
 005E1432    wait
 005E1433    mov         eax,dword ptr [ebp-20]
 005E1436    mov         dword ptr [ebx+48],eax;TAccelerometers.pitch:Double
 005E1439    mov         eax,dword ptr [ebp-1C]
 005E143C    mov         dword ptr [ebx+4C],eax;TAccelerometers.?f4C:dword
 005E143F    fld         qword ptr [ebx+20];TAccelerometers.lng:Double
 005E1442    fcomp       dword ptr ds:[5E14BC];0:Single
 005E1448    wait
 005E1449    fnstsw      al
 005E144B    sahf
>005E144C    je          005E14A5
 005E144E    push        dword ptr [ebx+0C];TAccelerometers.?fC:dword
 005E1451    push        dword ptr [ebx+8];TAccelerometers.gx:Double
 005E1454    push        dword ptr [ebx+14];TAccelerometers.?f14:dword
 005E1457    push        dword ptr [ebx+10];TAccelerometers.gy:Double
 005E145A    call        00454A9C
 005E145F    fstp        qword ptr [ebp-28]
 005E1462    wait
 005E1463    fld         tbyte ptr ds:[5E14B0];57.2957795130823:Extended
 005E1469    fmul        qword ptr [ebp-28]
 005E146C    fstp        qword ptr [ebp-30]
 005E146F    wait
 005E1470    fld         qword ptr [ebp-30]
 005E1473    fchs
 005E1475    fstp        qword ptr [ebx+60];TAccelerometers.SmoothRoll:Double
 005E1478    wait
 005E1479    fld         qword ptr [ebx+18];TAccelerometers.gz:Double
 005E147C    fdiv        qword ptr [ebx+20];TAccelerometers.lng:Double
 005E147F    add         esp,0FFFFFFF4
 005E1482    fstp        tbyte ptr [esp]
 005E1485    wait
 005E1486    call        00454A44
 005E148B    fstp        tbyte ptr [ebp-40]
 005E148E    wait
 005E148F    fld         tbyte ptr [ebp-40]
 005E1492    fld         tbyte ptr ds:[5E14B0];57.2957795130823:Extended
 005E1498    fmulp       st(1),st
 005E149A    fstp        tbyte ptr [ebp-50]
 005E149D    wait
 005E149E    fld         tbyte ptr [ebp-50]
 005E14A1    fstp        qword ptr [ebx+58];TAccelerometers.SmoothPitch:Double
 005E14A4    wait
 005E14A5    pop         ebx
 005E14A6    mov         esp,ebp
 005E14A8    pop         ebp
 005E14A9    ret         18
end;*}

//005E1910
function dinput8.DirectInput8Create(dwVersion:DWORD; const riidltf:TGUID; var ppvOut:void ; punkOuter:IUnknown):HRESULT; stdcall;
begin
{*
 005E1910    jmp         dword ptr ds:[82690C]
*}
end;

//005E19F8
procedure sub_005E19F8;
begin
{*
 005E19F8    xor         eax,eax
 005E19FA    mov         dword ptr ds:[8161B0],eax;gvar_008161B0:Double
 005E1A00    mov         dword ptr ds:[8161B4],eax;gvar_008161B4
 005E1A06    xor         eax,eax
 005E1A08    mov         dword ptr ds:[8161C8],eax;gvar_008161C8:Double
 005E1A0E    mov         dword ptr ds:[8161CC],eax;gvar_008161CC
 005E1A14    cmp         dword ptr ds:[8161AC],0;gvar_008161AC:TStringList
>005E1A1B    jne         005E1A30
 005E1A1D    mov         dl,1
 005E1A1F    mov         eax,[0043C7BC];TStringList
 005E1A24    call        TStringList.Create;TStringList.Create
 005E1A29    mov         [008161AC],eax;gvar_008161AC:TStringList
>005E1A2E    jmp         005E1A3A
 005E1A30    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E1A35    mov         edx,dword ptr [eax]
 005E1A37    call        dword ptr [edx+44]
 005E1A3A    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E1A3F    mov         byte ptr [eax+39],0
 005E1A43    xor         edx,edx
 005E1A45    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E1A4A    call        TStringList.SetCaseSensitive
 005E1A4F    cmp         dword ptr ds:[8161C0],0;gvar_008161C0:TStringList
>005E1A56    jne         005E1A6B
 005E1A58    mov         dl,1
 005E1A5A    mov         eax,[0043C7BC];TStringList
 005E1A5F    call        TStringList.Create;TStringList.Create
 005E1A64    mov         [008161C0],eax;gvar_008161C0:TStringList
>005E1A69    jmp         005E1A75
 005E1A6B    mov         eax,[008161C0];gvar_008161C0:TStringList
 005E1A70    mov         edx,dword ptr [eax]
 005E1A72    call        dword ptr [edx+44]
 005E1A75    mov         eax,[008161C0];gvar_008161C0:TStringList
 005E1A7A    mov         byte ptr [eax+39],0
 005E1A7E    xor         edx,edx
 005E1A80    mov         eax,[008161C0];gvar_008161C0:TStringList
 005E1A85    call        TStringList.SetCaseSensitive
 005E1A8A    cmp         dword ptr ds:[8161D8],0;gvar_008161D8:TStringList
>005E1A91    jne         005E1AA6
 005E1A93    mov         dl,1
 005E1A95    mov         eax,[0043C7BC];TStringList
 005E1A9A    call        TStringList.Create;TStringList.Create
 005E1A9F    mov         [008161D8],eax;gvar_008161D8:TStringList
>005E1AA4    jmp         005E1AB0
 005E1AA6    mov         eax,[008161D8];gvar_008161D8:TStringList
 005E1AAB    mov         edx,dword ptr [eax]
 005E1AAD    call        dword ptr [edx+44]
 005E1AB0    mov         eax,[008161D8];gvar_008161D8:TStringList
 005E1AB5    mov         byte ptr [eax+39],0
 005E1AB9    xor         edx,edx
 005E1ABB    mov         eax,[008161D8];gvar_008161D8:TStringList
 005E1AC0    call        TStringList.SetCaseSensitive
 005E1AC5    cmp         dword ptr ds:[8161DC],0;gvar_008161DC:TStringList
>005E1ACC    jne         005E1AE1
 005E1ACE    mov         dl,1
 005E1AD0    mov         eax,[0043C7BC];TStringList
 005E1AD5    call        TStringList.Create;TStringList.Create
 005E1ADA    mov         [008161DC],eax;gvar_008161DC:TStringList
>005E1ADF    jmp         005E1AEB
 005E1AE1    mov         eax,[008161DC];gvar_008161DC:TStringList
 005E1AE6    mov         edx,dword ptr [eax]
 005E1AE8    call        dword ptr [edx+44]
 005E1AEB    mov         eax,[008161DC];gvar_008161DC:TStringList
 005E1AF0    mov         byte ptr [eax+39],0
 005E1AF4    xor         edx,edx
 005E1AF6    mov         eax,[008161DC];gvar_008161DC:TStringList
 005E1AFB    call        TStringList.SetCaseSensitive
 005E1B00    mov         eax,[008161DC];gvar_008161DC:TStringList
 005E1B05    mov         byte ptr [eax+50],1
 005E1B09    cmp         dword ptr ds:[8161B8],0;gvar_008161B8:TStringList
>005E1B10    jne         005E1B25
 005E1B12    mov         dl,1
 005E1B14    mov         eax,[0043C7BC];TStringList
 005E1B19    call        TStringList.Create;TStringList.Create
 005E1B1E    mov         [008161B8],eax;gvar_008161B8:TStringList
>005E1B23    jmp         005E1B2F
 005E1B25    mov         eax,[008161B8];gvar_008161B8:TStringList
 005E1B2A    mov         edx,dword ptr [eax]
 005E1B2C    call        dword ptr [edx+44]
 005E1B2F    mov         eax,[008161B8];gvar_008161B8:TStringList
 005E1B34    mov         byte ptr [eax+39],0
 005E1B38    xor         edx,edx
 005E1B3A    mov         eax,[008161B8];gvar_008161B8:TStringList
 005E1B3F    call        TStringList.SetCaseSensitive
 005E1B44    cmp         dword ptr ds:[8161BC],0;gvar_008161BC:TStringList
>005E1B4B    jne         005E1B60
 005E1B4D    mov         dl,1
 005E1B4F    mov         eax,[0043C7BC];TStringList
 005E1B54    call        TStringList.Create;TStringList.Create
 005E1B59    mov         [008161BC],eax;gvar_008161BC:TStringList
>005E1B5E    jmp         005E1B6A
 005E1B60    mov         eax,[008161BC];gvar_008161BC:TStringList
 005E1B65    mov         edx,dword ptr [eax]
 005E1B67    call        dword ptr [edx+44]
 005E1B6A    mov         eax,[008161BC];gvar_008161BC:TStringList
 005E1B6F    mov         byte ptr [eax+39],0
 005E1B73    xor         edx,edx
 005E1B75    mov         eax,[008161BC];gvar_008161BC:TStringList
 005E1B7A    call        TStringList.SetCaseSensitive
 005E1B7F    ret
*}
end;

//005E1B80
procedure sub_005E1B80;
begin
{*
 005E1B80    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E1B85    xor         edx,edx
 005E1B87    mov         dword ptr ds:[8161AC],edx;gvar_008161AC:TStringList
 005E1B8D    call        TObject.Free
 005E1B92    ret
*}
end;

//005E1B94
{*procedure sub_005E1B94(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 005E1B94    push        ebp
 005E1B95    mov         ebp,esp
 005E1B97    add         esp,0FFFFFFBC
 005E1B9A    push        ebx
 005E1B9B    push        esi
 005E1B9C    push        edi
 005E1B9D    xor         ebx,ebx
 005E1B9F    mov         dword ptr [ebp-44],ebx
 005E1BA2    mov         dword ptr [ebp-4],ebx
 005E1BA5    mov         dword ptr [ebp-8],ebx
 005E1BA8    mov         dword ptr [ebp-0C],ebx
 005E1BAB    mov         dword ptr [ebp-10],ebx
 005E1BAE    mov         dword ptr [ebp-1C],ecx
 005E1BB1    mov         dword ptr [ebp-18],edx
 005E1BB4    mov         dword ptr [ebp-14],eax
 005E1BB7    mov         eax,dword ptr [ebp-14]
 005E1BBA    test        eax,eax
>005E1BBC    je          005E1BC2
 005E1BBE    xor         edx,edx
 005E1BC0    mov         dword ptr [eax],edx
 005E1BC2    mov         eax,dword ptr [ebp-1C]
 005E1BC5    test        eax,eax
>005E1BC7    je          005E1BCD
 005E1BC9    xor         edx,edx
 005E1BCB    mov         dword ptr [eax],edx
 005E1BCD    mov         eax,dword ptr [ebp+0C]
 005E1BD0    test        eax,eax
>005E1BD2    je          005E1BD8
 005E1BD4    xor         edx,edx
 005E1BD6    mov         dword ptr [eax],edx
 005E1BD8    mov         eax,dword ptr [ebp+8]
 005E1BDB    test        eax,eax
>005E1BDD    je          005E1BE3
 005E1BDF    xor         edx,edx
 005E1BE1    mov         dword ptr [eax],edx
 005E1BE3    xor         eax,eax
 005E1BE5    push        ebp
 005E1BE6    push        5E214E
 005E1BEB    push        dword ptr fs:[eax]
 005E1BEE    mov         dword ptr fs:[eax],esp
 005E1BF1    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E1BF6    mov         edx,dword ptr [eax]
 005E1BF8    call        dword ptr [edx+14]
 005E1BFB    test        eax,eax
>005E1BFD    jne         005E1C2D
 005E1BFF    mov         eax,dword ptr [ebp-14]
 005E1C02    call        @UStrClr
 005E1C07    mov         eax,dword ptr [ebp-18]
 005E1C0A    mov         dword ptr [eax],0FFFFFFFF
 005E1C10    mov         eax,dword ptr [ebp-1C]
 005E1C13    call        @UStrClr
 005E1C18    mov         eax,dword ptr [ebp+0C]
 005E1C1B    call        @UStrClr
 005E1C20    mov         eax,dword ptr [ebp+8]
 005E1C23    call        @UStrClr
>005E1C28    jmp         005E1F5D
 005E1C2D    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E1C32    mov         edx,dword ptr [eax]
 005E1C34    call        dword ptr [edx+14]
 005E1C37    dec         eax
>005E1C38    jne         005E1E18
 005E1C3E    mov         eax,[008161BC];gvar_008161BC:TStringList
 005E1C43    mov         edx,dword ptr [eax]
 005E1C45    call        dword ptr [edx+14]
 005E1C48    test        eax,eax
>005E1C4A    jne         005E1E18
 005E1C50    mov         eax,[008161D8];gvar_008161D8:TStringList
 005E1C55    mov         edx,dword ptr [eax]
 005E1C57    call        dword ptr [edx+14]
 005E1C5A    dec         eax
>005E1C5B    jne         005E1C74
 005E1C5D    mov         eax,dword ptr [ebp+0C]
 005E1C60    mov         edx,5E216C;'DoubleClicked'
 005E1C65    call        @UStrAsg
 005E1C6A    mov         eax,dword ptr [ebp+8]
 005E1C6D    call        @UStrClr
>005E1C72    jmp         005E1CDF
 005E1C74    fld         qword ptr ds:[8161B0];gvar_008161B0:Double
 005E1C7A    fcomp       dword ptr ds:[5E2188];1:Single
 005E1C80    wait
 005E1C81    fnstsw      al
 005E1C83    sahf
>005E1C84    jbe         005E1CCF
 005E1C86    mov         eax,dword ptr [ebp+0C]
 005E1C89    mov         edx,5E2198;'HeldDown'
 005E1C8E    call        @UStrAsg
 005E1C93    push        dword ptr ds:[8161B4];gvar_008161B4
 005E1C99    push        dword ptr ds:[8161B0];gvar_008161B0:Double
 005E1C9F    mov         al,0FE
 005E1CA1    call        00454908
 005E1CA6    fstp        tbyte ptr [ebp-30]
 005E1CA9    wait
 005E1CAA    movzx       eax,word ptr [ebp-28]
 005E1CAE    push        eax
 005E1CAF    push        dword ptr [ebp-2C]
 005E1CB2    push        dword ptr [ebp-30]
 005E1CB5    lea         edx,[ebp-0C]
 005E1CB8    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 005E1CBD    call        FloatToStr
 005E1CC2    mov         eax,dword ptr [ebp+8]
 005E1CC5    mov         edx,dword ptr [ebp-0C]
 005E1CC8    call        @UStrAsg
>005E1CCD    jmp         005E1CDF
 005E1CCF    mov         eax,dword ptr [ebp+0C]
 005E1CD2    call        @UStrClr
 005E1CD7    mov         eax,dword ptr [ebp+8]
 005E1CDA    call        @UStrClr
 005E1CDF    lea         ecx,[ebp-4]
 005E1CE2    xor         edx,edx
 005E1CE4    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E1CE9    mov         ebx,dword ptr [eax]
 005E1CEB    call        dword ptr [ebx+0C]
 005E1CEE    mov         edx,dword ptr [ebp-4]
 005E1CF1    mov         eax,5E21B8;'.'
 005E1CF6    call        Pos
 005E1CFB    mov         ebx,eax
 005E1CFD    test        ebx,ebx
>005E1CFF    jg          005E1D22
 005E1D01    mov         eax,dword ptr [ebp-14]
 005E1D04    call        @UStrClr
 005E1D09    mov         eax,dword ptr [ebp-18]
 005E1D0C    mov         dword ptr [eax],0FFFFFFFF
 005E1D12    mov         eax,dword ptr [ebp-1C]
 005E1D15    mov         edx,dword ptr [ebp-4]
 005E1D18    call        @UStrAsg
>005E1D1D    jmp         005E1F5D
 005E1D22    mov         esi,dword ptr [ebp-4]
 005E1D25    test        esi,esi
>005E1D27    je          005E1D2E
 005E1D29    sub         esi,4
 005E1D2C    mov         esi,dword ptr [esi]
 005E1D2E    mov         eax,dword ptr [ebp-1C]
 005E1D31    push        eax
 005E1D32    lea         edx,[ebx+1]
 005E1D35    mov         ecx,esi
 005E1D37    mov         eax,dword ptr [ebp-4]
 005E1D3A    call        @UStrCopy
 005E1D3F    lea         eax,[ebp-4]
 005E1D42    push        eax
 005E1D43    mov         ecx,ebx
 005E1D45    dec         ecx
 005E1D46    mov         edx,1
 005E1D4B    mov         eax,dword ptr [ebp-4]
 005E1D4E    call        @UStrCopy
 005E1D53    lea         eax,[ebp-4]
 005E1D56    mov         edx,5E21C8;'P5'
 005E1D5B    call        004F9BD0
 005E1D60    test        al,al
>005E1D62    je          005E1D76
 005E1D64    mov         eax,dword ptr [ebp-14]
 005E1D67    mov         edx,5E21C8;'P5'
 005E1D6C    call        @UStrAsg
>005E1D71    jmp         005E1E03
 005E1D76    lea         eax,[ebp-4]
 005E1D79    mov         edx,5E21DC;'Z800'
 005E1D7E    call        004F9BD0
 005E1D83    test        al,al
>005E1D85    je          005E1D96
 005E1D87    mov         eax,dword ptr [ebp-14]
 005E1D8A    mov         edx,5E21DC;'Z800'
 005E1D8F    call        @UStrAsg
>005E1D94    jmp         005E1E03
 005E1D96    lea         eax,[ebp-4]
 005E1D99    mov         edx,5E21F4;'DualShock3'
 005E1D9E    call        004F9BD0
 005E1DA3    test        al,al
>005E1DA5    je          005E1DB6
 005E1DA7    mov         eax,dword ptr [ebp-14]
 005E1DAA    mov         edx,5E2218;'SIXAXIS'
 005E1DAF    call        @UStrAsg
>005E1DB4    jmp         005E1E03
 005E1DB6    mov         eax,dword ptr [ebp-4]
 005E1DB9    test        eax,eax
>005E1DBB    je          005E1DC2
 005E1DBD    sub         eax,4
 005E1DC0    mov         eax,dword ptr [eax]
 005E1DC2    mov         ebx,eax
>005E1DC4    jmp         005E1DC7
 005E1DC6    dec         ebx
 005E1DC7    test        ebx,ebx
>005E1DC9    jle         005E1DE1
 005E1DCB    mov         eax,dword ptr [ebp-4]
 005E1DCE    movzx       eax,word ptr [eax+ebx*2-2]
 005E1DD3    mov         edx,5E2228
 005E1DD8    call        CharInSet
 005E1DDD    test        al,al
>005E1DDF    jne         005E1DC6
 005E1DE1    mov         eax,dword ptr [ebp-14]
 005E1DE4    push        eax
 005E1DE5    mov         ecx,ebx
 005E1DE7    mov         edx,1
 005E1DEC    mov         eax,dword ptr [ebp-4]
 005E1DEF    call        @UStrCopy
 005E1DF4    lea         eax,[ebp-4]
 005E1DF7    mov         ecx,ebx
 005E1DF9    mov         edx,1
 005E1DFE    call        @UStrDelete
 005E1E03    or          edx,0FFFFFFFF
 005E1E06    mov         eax,dword ptr [ebp-8]
 005E1E09    call        StrToIntDef
 005E1E0E    mov         edx,dword ptr [ebp-18]
 005E1E11    mov         dword ptr [edx],eax
>005E1E13    jmp         005E1F5D
 005E1E18    fld         qword ptr ds:[8161B0];gvar_008161B0:Double
 005E1E1E    fcomp       dword ptr ds:[5E2188];1:Single
 005E1E24    wait
 005E1E25    fnstsw      al
 005E1E27    sahf
>005E1E28    jbe         005E1E73
 005E1E2A    mov         eax,dword ptr [ebp+0C]
 005E1E2D    mov         edx,5E2198;'HeldDown'
 005E1E32    call        @UStrAsg
 005E1E37    push        dword ptr ds:[8161B4];gvar_008161B4
 005E1E3D    push        dword ptr ds:[8161B0];gvar_008161B0:Double
 005E1E43    mov         al,0FE
 005E1E45    call        00454908
 005E1E4A    fstp        tbyte ptr [ebp-40]
 005E1E4D    wait
 005E1E4E    movzx       eax,word ptr [ebp-38]
 005E1E52    push        eax
 005E1E53    push        dword ptr [ebp-3C]
 005E1E56    push        dword ptr [ebp-40]
 005E1E59    lea         edx,[ebp-10]
 005E1E5C    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 005E1E61    call        FloatToStr
 005E1E66    mov         eax,dword ptr [ebp+8]
 005E1E69    mov         edx,dword ptr [ebp-10]
 005E1E6C    call        @UStrAsg
>005E1E71    jmp         005E1E83
 005E1E73    mov         eax,dword ptr [ebp+0C]
 005E1E76    call        @UStrClr
 005E1E7B    mov         eax,dword ptr [ebp+8]
 005E1E7E    call        @UStrClr
 005E1E83    mov         eax,dword ptr [ebp-14]
 005E1E86    call        @UStrClr
 005E1E8B    mov         eax,dword ptr [ebp-18]
 005E1E8E    mov         dword ptr [eax],0FFFFFFFF
 005E1E94    mov         eax,dword ptr [ebp-1C]
 005E1E97    call        @UStrClr
 005E1E9C    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E1EA1    mov         edx,dword ptr [eax]
 005E1EA3    call        dword ptr [edx+14]
 005E1EA6    mov         esi,eax
 005E1EA8    dec         esi
 005E1EA9    test        esi,esi
>005E1EAB    jl          005E1F5D
 005E1EB1    inc         esi
 005E1EB2    xor         ebx,ebx
 005E1EB4    lea         ecx,[ebp-4]
 005E1EB7    mov         edx,ebx
 005E1EB9    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E1EBE    mov         edi,dword ptr [eax]
 005E1EC0    call        dword ptr [edi+0C]
 005E1EC3    mov         edx,dword ptr [ebp-4]
 005E1EC6    mov         eax,[008161D8];gvar_008161D8:TStringList
 005E1ECB    mov         ecx,dword ptr [eax]
 005E1ECD    call        dword ptr [ecx+54]
 005E1ED0    test        eax,eax
 005E1ED2    setge       byte ptr [ebp-1D]
 005E1ED6    lea         edx,[ebp-44]
 005E1ED9    mov         eax,dword ptr [ebp-4]
 005E1EDC    call        LowerCase
 005E1EE1    mov         eax,dword ptr [ebp-44]
 005E1EE4    mov         edx,5E2254;'keyboard.end'
 005E1EE9    call        @UStrEqual
>005E1EEE    jne         005E1EFF
 005E1EF0    lea         eax,[ebp-4]
 005E1EF3    mov         edx,5E227C;'Key.End'
 005E1EF8    call        @UStrLAsg
>005E1EFD    jmp         005E1F0C
 005E1EFF    lea         eax,[ebp-4]
 005E1F02    mov         edx,5E2298;'Keyboard.'
 005E1F07    call        004F9BD0
 005E1F0C    test        ebx,ebx
>005E1F0E    je          005E1F20
 005E1F10    mov         eax,dword ptr [ebp-1C]
 005E1F13    mov         edx,5E22B8;' and '
 005E1F18    call        @UStrCat
 005E1F1D    mov         eax,dword ptr [ebp-1C]
 005E1F20    cmp         byte ptr [ebp-1D],0
>005E1F24    je          005E1F47
 005E1F26    mov         eax,dword ptr [ebp-1C]
 005E1F29    push        dword ptr [eax]
 005E1F2B    push        5E22D0;'DoubleClicked('
 005E1F30    push        dword ptr [ebp-4]
 005E1F33    push        5E22FC;')'
 005E1F38    mov         eax,dword ptr [ebp-1C]
 005E1F3B    mov         edx,4
 005E1F40    call        @UStrCatN
>005E1F45    jmp         005E1F55
 005E1F47    mov         eax,dword ptr [ebp-1C]
 005E1F4A    mov         edx,dword ptr [ebp-4]
 005E1F4D    call        @UStrCat
 005E1F52    mov         eax,dword ptr [ebp-1C]
 005E1F55    inc         ebx
 005E1F56    dec         esi
>005E1F57    jne         005E1EB4
 005E1F5D    mov         eax,[008161BC];gvar_008161BC:TStringList
 005E1F62    mov         edx,dword ptr [eax]
 005E1F64    call        dword ptr [edx+14]
 005E1F67    dec         eax
>005E1F68    jne         005E20C0
 005E1F6E    mov         eax,dword ptr [ebp-1C]
 005E1F71    cmp         dword ptr [eax],0
>005E1F74    jne         005E20C0
 005E1F7A    mov         eax,dword ptr [ebp+0C]
 005E1F7D    call        @UStrClr
 005E1F82    mov         eax,dword ptr [ebp+8]
 005E1F85    call        @UStrClr
 005E1F8A    lea         ecx,[ebp-4]
 005E1F8D    xor         edx,edx
 005E1F8F    mov         eax,[008161BC];gvar_008161BC:TStringList
 005E1F94    mov         ebx,dword ptr [eax]
 005E1F96    call        dword ptr [ebx+0C]
 005E1F99    mov         edx,dword ptr [ebp-4]
 005E1F9C    mov         eax,5E21B8;'.'
 005E1FA1    call        Pos
 005E1FA6    mov         ebx,eax
 005E1FA8    test        ebx,ebx
>005E1FAA    jg          005E1FCD
 005E1FAC    mov         eax,dword ptr [ebp-14]
 005E1FAF    call        @UStrClr
 005E1FB4    mov         eax,dword ptr [ebp-18]
 005E1FB7    mov         dword ptr [eax],0FFFFFFFF
 005E1FBD    mov         eax,dword ptr [ebp-1C]
 005E1FC0    mov         edx,dword ptr [ebp-4]
 005E1FC3    call        @UStrAsg
>005E1FC8    jmp         005E212B
 005E1FCD    mov         esi,dword ptr [ebp-4]
 005E1FD0    test        esi,esi
>005E1FD2    je          005E1FD9
 005E1FD4    sub         esi,4
 005E1FD7    mov         esi,dword ptr [esi]
 005E1FD9    mov         eax,dword ptr [ebp-1C]
 005E1FDC    push        eax
 005E1FDD    lea         edx,[ebx+1]
 005E1FE0    mov         ecx,esi
 005E1FE2    mov         eax,dword ptr [ebp-4]
 005E1FE5    call        @UStrCopy
 005E1FEA    lea         eax,[ebp-4]
 005E1FED    push        eax
 005E1FEE    mov         ecx,ebx
 005E1FF0    dec         ecx
 005E1FF1    mov         edx,1
 005E1FF6    mov         eax,dword ptr [ebp-4]
 005E1FF9    call        @UStrCopy
 005E1FFE    lea         eax,[ebp-4]
 005E2001    mov         edx,5E21C8;'P5'
 005E2006    call        004F9BD0
 005E200B    test        al,al
>005E200D    je          005E2021
 005E200F    mov         eax,dword ptr [ebp-14]
 005E2012    mov         edx,5E21C8;'P5'
 005E2017    call        @UStrAsg
>005E201C    jmp         005E20AE
 005E2021    lea         eax,[ebp-4]
 005E2024    mov         edx,5E21DC;'Z800'
 005E2029    call        004F9BD0
 005E202E    test        al,al
>005E2030    je          005E2041
 005E2032    mov         eax,dword ptr [ebp-14]
 005E2035    mov         edx,5E21DC;'Z800'
 005E203A    call        @UStrAsg
>005E203F    jmp         005E20AE
 005E2041    lea         eax,[ebp-4]
 005E2044    mov         edx,5E21F4;'DualShock3'
 005E2049    call        004F9BD0
 005E204E    test        al,al
>005E2050    je          005E2061
 005E2052    mov         eax,dword ptr [ebp-14]
 005E2055    mov         edx,5E2218;'SIXAXIS'
 005E205A    call        @UStrAsg
>005E205F    jmp         005E20AE
 005E2061    mov         eax,dword ptr [ebp-4]
 005E2064    test        eax,eax
>005E2066    je          005E206D
 005E2068    sub         eax,4
 005E206B    mov         eax,dword ptr [eax]
 005E206D    mov         ebx,eax
>005E206F    jmp         005E2072
 005E2071    dec         ebx
 005E2072    test        ebx,ebx
>005E2074    jle         005E208C
 005E2076    mov         eax,dword ptr [ebp-4]
 005E2079    movzx       eax,word ptr [eax+ebx*2-2]
 005E207E    mov         edx,5E2228
 005E2083    call        CharInSet
 005E2088    test        al,al
>005E208A    jne         005E2071
 005E208C    mov         eax,dword ptr [ebp-14]
 005E208F    push        eax
 005E2090    mov         ecx,ebx
 005E2092    mov         edx,1
 005E2097    mov         eax,dword ptr [ebp-4]
 005E209A    call        @UStrCopy
 005E209F    lea         eax,[ebp-4]
 005E20A2    mov         ecx,ebx
 005E20A4    mov         edx,1
 005E20A9    call        @UStrDelete
 005E20AE    or          edx,0FFFFFFFF
 005E20B1    mov         eax,dword ptr [ebp-8]
 005E20B4    call        StrToIntDef
 005E20B9    mov         edx,dword ptr [ebp-18]
 005E20BC    mov         dword ptr [edx],eax
>005E20BE    jmp         005E212B
 005E20C0    mov         eax,[008161BC];gvar_008161BC:TStringList
 005E20C5    mov         edx,dword ptr [eax]
 005E20C7    call        dword ptr [edx+14]
 005E20CA    test        eax,eax
>005E20CC    jle         005E212B
 005E20CE    mov         eax,dword ptr [ebp+0C]
 005E20D1    call        @UStrClr
 005E20D6    mov         eax,dword ptr [ebp+8]
 005E20D9    call        @UStrClr
 005E20DE    mov         eax,[008161BC];gvar_008161BC:TStringList
 005E20E3    mov         edx,dword ptr [eax]
 005E20E5    call        dword ptr [edx+14]
 005E20E8    mov         esi,eax
 005E20EA    dec         esi
 005E20EB    test        esi,esi
>005E20ED    jl          005E212B
 005E20EF    inc         esi
 005E20F0    xor         ebx,ebx
 005E20F2    lea         ecx,[ebp-4]
 005E20F5    mov         edx,ebx
 005E20F7    mov         eax,[008161BC];gvar_008161BC:TStringList
 005E20FC    mov         edi,dword ptr [eax]
 005E20FE    call        dword ptr [edi+0C]
 005E2101    mov         eax,dword ptr [ebp-1C]
 005E2104    cmp         dword ptr [eax],0
>005E2107    je          005E2119
 005E2109    mov         eax,dword ptr [ebp-1C]
 005E210C    mov         edx,5E22B8;' and '
 005E2111    call        @UStrCat
 005E2116    mov         eax,dword ptr [ebp-1C]
 005E2119    mov         eax,dword ptr [ebp-1C]
 005E211C    mov         edx,dword ptr [ebp-4]
 005E211F    call        @UStrCat
 005E2124    mov         eax,dword ptr [ebp-1C]
 005E2127    inc         ebx
 005E2128    dec         esi
>005E2129    jne         005E20F2
 005E212B    xor         eax,eax
 005E212D    pop         edx
 005E212E    pop         ecx
 005E212F    pop         ecx
 005E2130    mov         dword ptr fs:[eax],edx
 005E2133    push        5E2155
 005E2138    lea         eax,[ebp-44]
 005E213B    call        @UStrClr
 005E2140    lea         eax,[ebp-10]
 005E2143    mov         edx,4
 005E2148    call        @UStrArrayClr
 005E214D    ret
>005E214E    jmp         @HandleFinally
>005E2153    jmp         005E2138
 005E2155    pop         edi
 005E2156    pop         esi
 005E2157    pop         ebx
 005E2158    mov         esp,ebp
 005E215A    pop         ebp
 005E215B    ret         8
end;*}

//005E2300
{*procedure sub_005E2300(?:?);
begin
 005E2300    push        ebp
 005E2301    mov         ebp,esp
 005E2303    push        ecx
 005E2304    mov         dword ptr [ebp-4],eax
 005E2307    mov         eax,dword ptr [ebp-4]
 005E230A    call        @UStrAddRef
 005E230F    xor         eax,eax
 005E2311    push        ebp
 005E2312    push        5E2371
 005E2317    push        dword ptr fs:[eax]
 005E231A    mov         dword ptr fs:[eax],esp
 005E231D    lea         eax,[ebp-4]
 005E2320    push        eax
 005E2321    mov         edx,dword ptr [ebp-4]
 005E2324    mov         eax,5E2388;'.'
 005E2329    call        004F9230
 005E232E    mov         ecx,eax
 005E2330    mov         edx,1
 005E2335    mov         eax,dword ptr [ebp-4]
 005E2338    call        @UStrCopy
 005E233D    mov         edx,dword ptr [ebp-4]
 005E2340    mov         eax,[008161B8];gvar_008161B8:TStringList
 005E2345    mov         ecx,dword ptr [eax]
 005E2347    call        dword ptr [ecx+54]
 005E234A    test        eax,eax
>005E234C    jge         005E235B
 005E234E    mov         edx,dword ptr [ebp-4]
 005E2351    mov         eax,[008161B8];gvar_008161B8:TStringList
 005E2356    mov         ecx,dword ptr [eax]
 005E2358    call        dword ptr [ecx+38]
 005E235B    xor         eax,eax
 005E235D    pop         edx
 005E235E    pop         ecx
 005E235F    pop         ecx
 005E2360    mov         dword ptr fs:[eax],edx
 005E2363    push        5E2378
 005E2368    lea         eax,[ebp-4]
 005E236B    call        @UStrClr
 005E2370    ret
>005E2371    jmp         @HandleFinally
>005E2376    jmp         005E2368
 005E2378    pop         ecx
 005E2379    pop         ebp
 005E237A    ret
end;*}

//005E238C
{*procedure sub_005E238C(?:?);
begin
 005E238C    push        ebp
 005E238D    mov         ebp,esp
 005E238F    add         esp,0FFFFFFF8
 005E2392    xor         edx,edx
 005E2394    mov         dword ptr [ebp-8],edx
 005E2397    mov         dword ptr [ebp-4],eax
 005E239A    mov         eax,dword ptr [ebp-4]
 005E239D    call        @UStrAddRef
 005E23A2    xor         eax,eax
 005E23A4    push        ebp
 005E23A5    push        5E2426
 005E23AA    push        dword ptr fs:[eax]
 005E23AD    mov         dword ptr fs:[eax],esp
 005E23B0    lea         eax,[ebp-8]
 005E23B3    push        eax
 005E23B4    mov         edx,dword ptr [ebp-4]
 005E23B7    mov         eax,5E2440;'.'
 005E23BC    call        004F9230
 005E23C1    mov         ecx,eax
 005E23C3    mov         edx,1
 005E23C8    mov         eax,dword ptr [ebp-4]
 005E23CB    call        @UStrCopy
 005E23D0    mov         edx,dword ptr [ebp-8]
 005E23D3    mov         eax,[008161B8];gvar_008161B8:TStringList
 005E23D8    mov         ecx,dword ptr [eax]
 005E23DA    call        dword ptr [ecx+54]
 005E23DD    test        eax,eax
>005E23DF    jl          005E23ED
 005E23E1    mov         edx,eax
 005E23E3    mov         eax,[008161B8];gvar_008161B8:TStringList
 005E23E8    mov         ecx,dword ptr [eax]
 005E23EA    call        dword ptr [ecx+48]
 005E23ED    mov         edx,dword ptr [ebp-4]
 005E23F0    mov         eax,[008161BC];gvar_008161BC:TStringList
 005E23F5    mov         ecx,dword ptr [eax]
 005E23F7    call        dword ptr [ecx+54]
 005E23FA    test        eax,eax
>005E23FC    jge         005E240B
 005E23FE    mov         edx,dword ptr [ebp-4]
 005E2401    mov         eax,[008161BC];gvar_008161BC:TStringList
 005E2406    mov         ecx,dword ptr [eax]
 005E2408    call        dword ptr [ecx+38]
 005E240B    xor         eax,eax
 005E240D    pop         edx
 005E240E    pop         ecx
 005E240F    pop         ecx
 005E2410    mov         dword ptr fs:[eax],edx
 005E2413    push        5E242D
 005E2418    lea         eax,[ebp-8]
 005E241B    mov         edx,2
 005E2420    call        @UStrArrayClr
 005E2425    ret
>005E2426    jmp         @HandleFinally
>005E242B    jmp         005E2418
 005E242D    pop         ecx
 005E242E    pop         ecx
 005E242F    pop         ebp
 005E2430    ret
end;*}

//005E2444
{*procedure sub_005E2444(?:?);
begin
 005E2444    push        ebp
 005E2445    mov         ebp,esp
 005E2447    add         esp,0FFFFFFF0
 005E244A    push        esi
 005E244B    mov         dword ptr [ebp-4],eax
 005E244E    mov         eax,dword ptr [ebp-4]
 005E2451    call        @UStrAddRef
 005E2456    xor         eax,eax
 005E2458    push        ebp
 005E2459    push        5E2534
 005E245E    push        dword ptr fs:[eax]
 005E2461    mov         dword ptr fs:[eax],esp
 005E2464    call        00682F08
 005E2469    fstp        qword ptr [ebp-10]
 005E246C    wait
 005E246D    mov         eax,dword ptr [ebp-10]
 005E2470    mov         dword ptr ds:[8161C8],eax;gvar_008161C8:Double
 005E2476    mov         eax,dword ptr [ebp-0C]
 005E2479    mov         dword ptr ds:[8161CC],eax;gvar_008161CC
 005E247F    mov         edx,dword ptr [ebp-4]
 005E2482    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E2487    mov         ecx,dword ptr [eax]
 005E2489    call        dword ptr [ecx+54]
 005E248C    test        eax,eax
>005E248E    jge         005E249D
 005E2490    mov         edx,dword ptr [ebp-4]
 005E2493    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E2498    mov         ecx,dword ptr [eax]
 005E249A    call        dword ptr [ecx+38]
 005E249D    mov         edx,dword ptr [ebp-4]
 005E24A0    mov         eax,[008161C0];gvar_008161C0:TStringList
 005E24A5    mov         ecx,dword ptr [eax]
 005E24A7    call        dword ptr [ecx+54]
 005E24AA    test        eax,eax
>005E24AC    jge         005E24BB
 005E24AE    mov         edx,dword ptr [ebp-4]
 005E24B1    mov         eax,[008161C0];gvar_008161C0:TStringList
 005E24B6    mov         ecx,dword ptr [eax]
 005E24B8    call        dword ptr [ecx+38]
 005E24BB    mov         edx,dword ptr [ebp-4]
 005E24BE    mov         eax,[008161DC];gvar_008161DC:TStringList
 005E24C3    mov         ecx,dword ptr [eax]
 005E24C5    call        dword ptr [ecx+54]
 005E24C8    mov         esi,eax
 005E24CA    test        esi,esi
>005E24CC    jl          005E251E
 005E24CE    mov         edx,esi
 005E24D0    mov         eax,[008161DC];gvar_008161DC:TStringList
 005E24D5    mov         ecx,dword ptr [eax]
 005E24D7    call        dword ptr [ecx+18]
 005E24DA    fld         qword ptr [eax+8]
 005E24DD    fsubr       qword ptr [ebp-10]
 005E24E0    fstp        qword ptr [ebp-10]
 005E24E3    wait
 005E24E4    fld         qword ptr [ebp-10]
 005E24E7    mov         eax,[0078D980];^gvar_0081ECF0:Double
 005E24EC    fcomp       qword ptr [eax]
 005E24EE    wait
 005E24EF    fnstsw      al
 005E24F1    sahf
>005E24F2    ja          005E2512
 005E24F4    mov         edx,dword ptr [ebp-4]
 005E24F7    mov         eax,[008161D8];gvar_008161D8:TStringList
 005E24FC    mov         ecx,dword ptr [eax]
 005E24FE    call        dword ptr [ecx+54]
 005E2501    test        eax,eax
>005E2503    jge         005E2512
 005E2505    mov         edx,dword ptr [ebp-4]
 005E2508    mov         eax,[008161D8];gvar_008161D8:TStringList
 005E250D    mov         ecx,dword ptr [eax]
 005E250F    call        dword ptr [ecx+38]
 005E2512    mov         edx,esi
 005E2514    mov         eax,[008161DC];gvar_008161DC:TStringList
 005E2519    mov         ecx,dword ptr [eax]
 005E251B    call        dword ptr [ecx+48]
 005E251E    xor         eax,eax
 005E2520    pop         edx
 005E2521    pop         ecx
 005E2522    pop         ecx
 005E2523    mov         dword ptr fs:[eax],edx
 005E2526    push        5E253B
 005E252B    lea         eax,[ebp-4]
 005E252E    call        @UStrClr
 005E2533    ret
>005E2534    jmp         @HandleFinally
>005E2539    jmp         005E252B
 005E253B    pop         esi
 005E253C    mov         esp,ebp
 005E253E    pop         ebp
 005E253F    ret
end;*}

//005E2540
{*procedure sub_005E2540(?:?);
begin
 005E2540    push        ebp
 005E2541    mov         ebp,esp
 005E2543    add         esp,0FFFFFFF0
 005E2546    push        ebx
 005E2547    mov         dword ptr [ebp-4],eax
 005E254A    mov         eax,dword ptr [ebp-4]
 005E254D    call        @UStrAddRef
 005E2552    xor         eax,eax
 005E2554    push        ebp
 005E2555    push        5E2629
 005E255A    push        dword ptr fs:[eax]
 005E255D    mov         dword ptr fs:[eax],esp
 005E2560    call        00682F08
 005E2565    fstp        qword ptr [ebp-10]
 005E2568    wait
 005E2569    fld         qword ptr ds:[8161B0];gvar_008161B0:Double
 005E256F    fcomp       dword ptr ds:[5E2638];0:Single
 005E2575    wait
 005E2576    fnstsw      al
 005E2578    sahf
>005E2579    jne         005E25AC
 005E257B    fld         qword ptr [ebp-10]
 005E257E    fcomp       qword ptr ds:[8161C8];gvar_008161C8:Double
 005E2584    wait
 005E2585    fnstsw      al
 005E2587    sahf
>005E2588    jbe         005E25AC
 005E258A    fld         qword ptr ds:[8161C8];gvar_008161C8:Double
 005E2590    fcomp       dword ptr ds:[5E2638];0:Single
 005E2596    wait
 005E2597    fnstsw      al
 005E2599    sahf
>005E259A    jbe         005E25AC
 005E259C    fld         qword ptr [ebp-10]
 005E259F    fsub        qword ptr ds:[8161C8];gvar_008161C8:Double
 005E25A5    fstp        qword ptr ds:[8161B0];gvar_008161B0:Double
 005E25AB    wait
 005E25AC    mov         edx,dword ptr [ebp-4]
 005E25AF    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E25B4    mov         ecx,dword ptr [eax]
 005E25B6    call        dword ptr [ecx+54]
 005E25B9    test        eax,eax
>005E25BB    jge         005E25CA
 005E25BD    mov         edx,dword ptr [ebp-4]
 005E25C0    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E25C5    mov         ecx,dword ptr [eax]
 005E25C7    call        dword ptr [ecx+38]
 005E25CA    mov         edx,dword ptr [ebp-4]
 005E25CD    mov         eax,[008161C0];gvar_008161C0:TStringList
 005E25D2    mov         ecx,dword ptr [eax]
 005E25D4    call        dword ptr [ecx+54]
 005E25D7    test        eax,eax
>005E25D9    jl          005E25E7
 005E25DB    mov         edx,eax
 005E25DD    mov         eax,[008161C0];gvar_008161C0:TStringList
 005E25E2    mov         ecx,dword ptr [eax]
 005E25E4    call        dword ptr [ecx+48]
 005E25E7    mov         edx,dword ptr [ebp-4]
 005E25EA    mov         eax,[008161DC];gvar_008161DC:TStringList
 005E25EF    mov         ecx,dword ptr [eax]
 005E25F1    call        dword ptr [ecx+54]
 005E25F4    test        eax,eax
>005E25F6    jge         005E2613
 005E25F8    mov         dl,1
 005E25FA    mov         eax,[005E1918];TTimeObject
 005E25FF    call        TTimeObject.Create;TTimeObject.Create
 005E2604    mov         ecx,eax
 005E2606    mov         edx,dword ptr [ebp-4]
 005E2609    mov         eax,[008161DC];gvar_008161DC:TStringList
 005E260E    mov         ebx,dword ptr [eax]
 005E2610    call        dword ptr [ebx+3C]
 005E2613    xor         eax,eax
 005E2615    pop         edx
 005E2616    pop         ecx
 005E2617    pop         ecx
 005E2618    mov         dword ptr fs:[eax],edx
 005E261B    push        5E2630
 005E2620    lea         eax,[ebp-4]
 005E2623    call        @UStrClr
 005E2628    ret
>005E2629    jmp         @HandleFinally
>005E262E    jmp         005E2620
 005E2630    pop         ebx
 005E2631    mov         esp,ebp
 005E2633    pop         ebp
 005E2634    ret
end;*}

//005E263C
procedure sub_005E263C;
begin
{*
 005E263C    call        005E3568
 005E2641    mov         byte ptr ds:[78BC50],0;gvar_0078BC50
 005E2648    call        005E19F8
 005E264D    call        00682F08
 005E2652    fstp        qword ptr ds:[8161D0];gvar_008161D0:Double
 005E2658    wait
 005E2659    ret
*}
end;

//005E265C
procedure sub_005E265C;
begin
{*
 005E265C    call        005E36E0
 005E2661    mov         byte ptr ds:[78BC50],1;gvar_0078BC50
 005E2668    call        005E19F8
 005E266D    call        00682F08
 005E2672    fstp        qword ptr ds:[8161D0];gvar_008161D0:Double
 005E2678    wait
 005E2679    ret
*}
end;

//005E267C
procedure sub_005E267C;
begin
{*
 005E267C    cmp         byte ptr ds:[78BC50],0;gvar_0078BC50
>005E2683    je          005E268B
 005E2685    call        005E3960
 005E268A    ret
 005E268B    call        005E3858
 005E2690    ret
*}
end;

//005E2694
{*function sub_005E2694:?;
begin
 005E2694    push        ebx
 005E2695    push        esi
 005E2696    add         esp,0FFFFFFF0
 005E2699    mov         esi,8161DC;gvar_008161DC:TStringList
 005E269E    call        00682F08
 005E26A3    fstp        qword ptr [esp]
 005E26A6    wait
 005E26A7    cmp         byte ptr ds:[78BC50],0;gvar_0078BC50
>005E26AE    je          005E26B7
 005E26B0    call        005E3B20
>005E26B5    jmp         005E26BC
 005E26B7    call        005E3A68
 005E26BC    xor         ebx,ebx
>005E26BE    jmp         005E26F1
 005E26C0    mov         edx,ebx
 005E26C2    mov         eax,dword ptr [esi]
 005E26C4    mov         ecx,dword ptr [eax]
 005E26C6    call        dword ptr [ecx+18]
 005E26C9    fld         qword ptr [eax+8]
 005E26CC    fsubr       qword ptr [esp]
 005E26CF    fstp        qword ptr [esp+8]
 005E26D3    wait
 005E26D4    fld         qword ptr [esp+8]
 005E26D8    mov         eax,[0078D980];^gvar_0081ECF0:Double
 005E26DD    fcomp       qword ptr [eax]
 005E26DF    wait
 005E26E0    fnstsw      al
 005E26E2    sahf
>005E26E3    jbe         005E26F0
 005E26E5    mov         edx,ebx
 005E26E7    mov         eax,dword ptr [esi]
 005E26E9    mov         ecx,dword ptr [eax]
 005E26EB    call        dword ptr [ecx+48]
>005E26EE    jmp         005E26F1
 005E26F0    inc         ebx
 005E26F1    mov         eax,dword ptr [esi]
 005E26F3    mov         edx,dword ptr [eax]
 005E26F5    call        dword ptr [edx+14]
 005E26F8    dec         eax
 005E26F9    cmp         ebx,eax
>005E26FB    jle         005E26C0
 005E26FD    fld         qword ptr [esp]
 005E2700    fsub        qword ptr ds:[8161D0];gvar_008161D0:Double
 005E2706    fcomp       dword ptr ds:[5E279C];8:Single
 005E270C    wait
 005E270D    fnstsw      al
 005E270F    sahf
>005E2710    jbe         005E2732
 005E2712    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E2717    mov         edx,dword ptr [eax]
 005E2719    call        dword ptr [edx+14]
 005E271C    test        eax,eax
>005E271E    jne         005E2732
 005E2720    mov         eax,[008161B8];gvar_008161B8:TStringList
 005E2725    mov         edx,dword ptr [eax]
 005E2727    call        dword ptr [edx+14]
 005E272A    test        eax,eax
>005E272C    jne         005E2732
 005E272E    mov         dl,1
>005E2730    jmp         005E2792
 005E2732    mov         eax,[008161C0];gvar_008161C0:TStringList
 005E2737    mov         edx,dword ptr [eax]
 005E2739    call        dword ptr [edx+14]
 005E273C    test        eax,eax
>005E273E    jne         005E2779
 005E2740    mov         eax,dword ptr [esi]
 005E2742    mov         edx,dword ptr [eax]
 005E2744    call        dword ptr [edx+14]
 005E2747    test        eax,eax
>005E2749    jne         005E2779
 005E274B    mov         eax,[008161B8];gvar_008161B8:TStringList
 005E2750    mov         edx,dword ptr [eax]
 005E2752    call        dword ptr [edx+14]
 005E2755    test        eax,eax
>005E2757    jne         005E2779
 005E2759    mov         eax,[008161AC];gvar_008161AC:TStringList
 005E275E    mov         edx,dword ptr [eax]
 005E2760    call        dword ptr [edx+14]
 005E2763    mov         ebx,eax
 005E2765    mov         eax,[008161BC];gvar_008161BC:TStringList
 005E276A    mov         edx,dword ptr [eax]
 005E276C    call        dword ptr [edx+14]
 005E276F    add         ebx,eax
 005E2771    test        ebx,ebx
>005E2773    jle         005E2779
 005E2775    mov         dl,1
>005E2777    jmp         005E2792
 005E2779    xor         edx,edx
 005E277B    fld         qword ptr [esp]
 005E277E    fsub        qword ptr ds:[8161D0];gvar_008161D0:Double
 005E2784    fcomp       dword ptr ds:[5E27A0];20:Single
 005E278A    wait
 005E278B    fnstsw      al
 005E278D    sahf
>005E278E    jbe         005E2792
 005E2790    mov         dl,1
 005E2792    mov         eax,edx
 005E2794    add         esp,10
 005E2797    pop         esi
 005E2798    pop         ebx
 005E2799    ret
end;*}

//005E27A4
constructor TTimeObject.Create;
begin
{*
 005E27A4    push        ebx
 005E27A5    push        esi
 005E27A6    test        dl,dl
>005E27A8    je          005E27B2
 005E27AA    add         esp,0FFFFFFF0
 005E27AD    call        @ClassCreate
 005E27B2    mov         ebx,edx
 005E27B4    mov         esi,eax
 005E27B6    call        00682F08
 005E27BB    fstp        qword ptr [esi+8];TTimeObject....Value:Double
 005E27BE    wait
 005E27BF    mov         eax,esi
 005E27C1    test        bl,bl
>005E27C3    je          005E27D4
 005E27C5    call        @AfterConstruction
 005E27CA    pop         dword ptr fs:[0]
 005E27D1    add         esp,0C
 005E27D4    mov         eax,esi
 005E27D6    pop         esi
 005E27D7    pop         ebx
 005E27D8    ret
*}
end;

end.