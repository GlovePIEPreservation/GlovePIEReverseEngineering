//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit159;

interface

uses
  SysUtils, Classes, TntStdCtrls, DebugWinUnit, PieBase, EmptyForm, KinectSDK, PieKinectSDK;

type
  TForm1 = class(TForm)
  published
    TntMemo1:TTntMemo;//f388
  end;
  NUI_PROPSINDEX = (INDEX_UNIQUE_DEVICE_NAME, INDEX_LAST);
  NUI_PROPSTYPE = (PROPTYPE_UNKNOWN, PROPTYPE_UINT, PROPTYPE_FLOAT, PROPTYPE_BSTR, PROPTYPE_BLOB);
  Vector4 = Vector4 = record//size=10
vector4_f32:?;//f0
vector4_u32:?;//f0
x:Single;//f0
y:Single;//f4
z:Single;//f8
w:Single;//fC
v:?;//f0
u:?;//f0
end;;
  NUI_LOCKED_RECT = NUI_LOCKED_RECT = record//size=8
Pitch:Integer;//f0
pBits:Pointer;//f4
end;;
  NUI_SURFACE_DESC = NUI_SURFACE_DESC = record//size=8
Width:Cardinal;//f0
Height:Cardinal;//f4
end;;
  INuiFrameTexture = class(TObject)
  published
    procedure GetLevelDesc(Level:Cardinal; refDesc:NUI_SURFACE_DESC); stdcall;//0076BAE0
    procedure UnlockRect(Level:Cardinal); stdcall;//0076BAE8
    procedure LockRect(Level:Cardinal; var LockedRect:NUI_LOCKED_RECT; pRectUsuallyNull:PRect; Flags:Cardinal); stdcall;//0076BAD8
    procedure BufferLen; stdcall;//0076BAC8
    procedure Pitch; stdcall;//0076BAD0
  public
    procedure v0; virtual; abstract;//v0//00404A58
    procedure v4; virtual; abstract;//v4//00404A58
    procedure v8; virtual; abstract;//v8//00404A58
    procedure vC; virtual; abstract;//vC//00404A58
    procedure v10; virtual; abstract;//v10//00404A58
  end;
  NUI_IMAGE_TYPE = (NUI_IMAGE_TYPE_DEPTH_AND_PLAYER_INDEX, NUI_IMAGE_TYPE_COLOR, NUI_IMAGE_TYPE_COLOR_YUV, NUI_IMAGE_TYPE_COLOR_RAW_YUV, NUI_IMAGE_TYPE_DEPTH);
  NUI_SKELETON_FRAME = NUI_SKELETON_FRAME = record//size=A68
liTimeStamp:_LARGE_INTEGER;//f0
dwFrameNumber:Cardinal;//f8
dwFlags:Cardinal;//fC
vFloorClipPlane:Vector4;//f10
vNormalToGravity:Vector4;//f20
SkeletonData:?;//f30
end;;
  NUI_TRANSFORM_SMOOTH_PARAMETERS = NUI_TRANSFORM_SMOOTH_PARAMETERS = record//size=14
fSmoothing:Single;//f0
fCorrection:Single;//f4
fPrediction:Single;//f8
fJitterRadius:Single;//fC
fMaxDeviationRadius:Single;//f10
end;;
  NUI_IMAGE_VIEW_AREA = NUI_IMAGE_VIEW_AREA = record//size=C
eDigitalZoom_NotUsed:Integer;//f0
lCenterX_NotUsed:Integer;//f4
lCenterY_NotUsed:Integer;//f8
end;;
  NUI_IMAGE_FRAME = NUI_IMAGE_FRAME = record//size=28
liTimeStamp:_LARGE_INTEGER;//f0
dwFrameNumber:Cardinal;//f8
eImageType:NUI_IMAGE_TYPE;//fC
eResolution:?;//f10
pFrameTexture:INuiFrameTexture;//f14
dwFrameFlags_NotUsed:Cardinal;//f18
ViewArea_NotUsed:NUI_IMAGE_VIEW_AREA;//f1C
end;;
  INuiInstance = class(TObject)
  published
    procedure _NuiImageGetColorPixelCoordinatesFromDepthPixel;//0076CCBC
    procedure _NuiImageStreamReleaseFrame(EDX:Integer; i:INuiInstance; hStream:Cardinal; pImageFrame:PNUI_IMAGE_FRAME);//0076CCB4
    procedure _NuiCameraElevationGetAngle(EDX:Integer; i:INuiInstance; reflAngleDegrees:Integer);//0076CCCC
    procedure _NuiCameraElevationSetAngle(EDX:Integer; i:INuiInstance; lAngleDegrees:Integer);//0076CCC4
    procedure _NuiImageStreamGetNextFrame(EDX:Integer; i:INuiInstance; hStream:Cardinal; dwMillisecondsToWait:Cardinal; refpcImageFrame:PNUI_IMAGE_FRAME);//0076CCAC
    procedure _NuiInitialize(EDX:Integer; i:INuiInstance; dwFlags:Cardinal);//0076CC94
    procedure _InstanceIndex(EDX:Integer; i:INuiInstance);//0076CC8C
    procedure _NuiImageStreamOpen;//0076CCA4
    procedure _NuiShutdown(EDX:Integer; i:INuiInstance);//0076CC9C
    procedure _NuiInstanceName(EDX:Integer; i:INuiInstance);//0076CD04
    procedure _MSR_NuiGetPropsType(EDX:Integer; i:INuiInstance; Index:NUI_PROPSINDEX);//0076CCFC
    procedure _NuiInitializationFlags(EDX:Integer; i:INuiInstance);//0076CD14
    procedure _NuiStatus(EDX:Integer; i:INuiInstance);//0076CD0C
    //procedure _MSR_NuiGetPropsBlob(EDX:Integer; i:INuiInstance; Index:NUI_PROPSINDEX; var Blob:?; var InOutSize:Cardinal);//0076CCF4
    procedure _NuiSkeletonTrackingDisable(EDX:Integer; i:INuiInstance);//0076CCDC
    procedure _NuiSkeletonTrackingEnable(EDX:Integer; i:INuiInstance; hNextFrameEvent:Cardinal; dwFlags:Cardinal);//0076CCD4
    procedure _NuiTransformSmooth(EDX:Integer; i:INuiInstance; var SkeletonFrame:NUI_SKELETON_FRAME; pSmoothingParams:PNUI_TRANSFORM_SMOOTH_PARAMETERS);//0076CCEC
    procedure _NuiSkeletonGetNextFrame(EDX:Integer; i:INuiInstance; dwMillisecondsToWait:Cardinal; var SkeletonFrame:NUI_SKELETON_FRAME);//0076CCE4
    procedure Free;//0076DC84
    //procedure NuiImageGetColorPixelCoordinatesFromDepthPixel(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//0076DD04
    procedure NuiImageStreamReleaseFrame(hStream:Cardinal; pImageFrame:PNUI_IMAGE_FRAME);//0076DD88
    function NuiCameraElevationGetAngle(reflAngleDegrees:Integer):HRESULT;//0076DCDC
    procedure NuiCameraElevationSetAngle(lAngleDegrees:Integer);//0076DCF0
    procedure NuiImageStreamGetNextFrame(hStream:Cardinal; dwMillisecondsToWait:Cardinal; refpcImageFrame:PNUI_IMAGE_FRAME);//0076DD38
    function NuiInitialize(dwFlags:Cardinal):HRESULT;//0076DDAC
    procedure InstanceIndex;//0076DCA0
    //procedure NuiImageStreamOpen(?:?; ?:?; ?:?; ?:?);//0076DD5C
    procedure NuiShutdown;//0076DDE0
    //procedure NuiInstanceName(?:?);//0076DDBC
    procedure MSR_NuiGetPropsType(Index:NUI_PROPSINDEX);//0076DCCC
    procedure NuiInitializationFlags;//0076DDA0
    procedure NuiStatus;//0076DE28
    //procedure MSR_NuiGetPropsBlob(Index:NUI_PROPSINDEX; var Blob:?; var InOutSize:Cardinal);//0076DCAC
    function NuiSkeletonTrackingDisable:HRESULT;//0076DE04
    function NuiSkeletonTrackingEnable(hNextFrameEvent:Cardinal; dwFlags:Cardinal):HRESULT;//0076DE10
    procedure NuiTransformSmooth(var SkeletonFrame:NUI_SKELETON_FRAME; pSmoothingParams:PNUI_TRANSFORM_SMOOTH_PARAMETERS);//0076DE34
    function NuiSkeletonGetNextFrame(dwMillisecondsToWait:Cardinal; var SkeletonFrame:NUI_SKELETON_FRAME):HRESULT;//0076DDEC
  public
    procedure v0; virtual; abstract;//v0//00404A58
    procedure v4; virtual; abstract;//v4//00404A58
    procedure v8; virtual; abstract;//v8//00404A58
    procedure vC; virtual; abstract;//vC//00404A58
    procedure v10; virtual; abstract;//v10//00404A58
    procedure v14; virtual; abstract;//v14//00404A58
    procedure v18; virtual; abstract;//v18//00404A58
    procedure v1C; virtual; abstract;//v1C//00404A58
    procedure v20; virtual; abstract;//v20//00404A58
    procedure v24; virtual; abstract;//v24//00404A58
    procedure v28; virtual; abstract;//v28//00404A58
    procedure v2C; virtual; abstract;//v2C//00404A58
    procedure v30; virtual; abstract;//v30//00404A58
    procedure v34; virtual; abstract;//v34//00404A58
    procedure v38; virtual; abstract;//v38//00404A58
    procedure v3C; virtual; abstract;//v3C//00404A58
    procedure v40; virtual; abstract;//v40//00404A58
    procedure v44; virtual; abstract;//v44//00404A58
  end;
  TKinectValue = class(TObjectValue)
  published
    function GetPerUnits1:TUnits;//0076EBD0
    function GetUnits:TUnits;//0076ECE8
    //procedure GetString(?:?);//0076EC9C
    function GetPerUnits2:TUnits;//0076EBF4
    procedure GetVector(x:Double; y:Double; z:Double);//0076EE30
    procedure GetRotMat(m:TRotMat);//0076EC10
    function Module:TObject;//0076EEAC
    function SetValue(NewValue:Double):Boolean;//0076EEB4
    function CanSet:Boolean;//0076EB10
    function GetDataType:TDataType;//0076EB50
    //procedure ToString(?:?);//0076EF28
    procedure FillClone(c:TExpression);//0076EB30
    procedure CreateClone;//0076EB20
    procedure GetValue;//0076ED24
  public
    ....................................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//0076EF28
    procedure GetValue; virtual;//v2C//0076ED24
    //procedure GetString(?:?); virtual;//v38//0076EC9C
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//0076EE30
    procedure GetRotMat(m:TRotMat); virtual;//v40//0076EC10
    function GetDataType:TDataType; virtual;//v44//0076EB50
    function GetUnits:TUnits; virtual;//v48//0076ECE8
    function GetPerUnits1:TUnits; virtual;//v4C//0076EBD0
    function GetPerUnits2:TUnits; virtual;//v50//0076EBF4
    function SetValue(NewValue:Double):Boolean; virtual;//v58//0076EEB4
    function CanSet:Boolean; virtual;//v68//0076EB10
    procedure CreateClone; virtual;//v80//0076EB20
    procedure FillClone(c:TExpression); virtual;//v84//0076EB30
    function Module:TObject; virtual;//v98//0076EEAC
  end;
  TKinectObject = class(TObject)
  published
    constructor Create(instance:INuiInstance);//007708FC
    destructor Destroy();//0077097C
  public
    instance:INuiInstance;//f4
    name:string;//f8
    LastPitch:Integer;//fC
  end;
  TModuleKinect = class(TPieModule)
  published
    procedure PrepareForGUI;//00770610
    procedure PrepareForMonitoring;//00770614
    procedure MonitorFrame;//00770514
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//007704F8
    function GetDefaultFormat(field:string):TGuiFormat;//0077043C
    procedure StopMonitoring;//007708E0
    procedure Diagnose(L:TStrings);//0076F348
    procedure StopGUI;//007708D8
    procedure StartGUI;//00770890
    procedure StartMonitoring;//0077089C
    procedure StopCompiletime;//007708C4
    constructor Create;//0076F294
    procedure StartCompiletime;//00770884
    procedure StartRuntime;//007708B8
    procedure StopRuntime;//007708E8
    function Read:Boolean;//00770618
    function GetGoodFields:TStringList;//00770498
    procedure ClearRead;//0076F28C
    procedure AddFields;//0076F1B0
    function CreateValue(Identifier:string):TExpression;//0076F2F4
  public
    function CreateValue(Identifier:string):TExpression; virtual;//v14//0076F2F4
    function GetGoodFields:TStringList; virtual;//v1C//00770498
    procedure AddFields; virtual;//v24//0076F1B0
    procedure StartCompiletime; virtual;//v28//00770884
    procedure StopCompiletime; virtual;//v2C//007708C4
    procedure StartRuntime; virtual;//v30//007708B8
    procedure StopRuntime; virtual;//v34//007708E8
    procedure ClearRead; virtual;//v38//0076F28C
    function Read:Boolean; virtual;//v3C//00770618
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//007704F8
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//0077043C
    procedure Diagnose(L:TStrings); virtual;//v4C//0076F348
    procedure PrepareForGUI; virtual;//v50//00770610
    procedure StartGUI; virtual;//v54//00770890
    procedure StopGUI; virtual;//v58//007708D8
    procedure PrepareForMonitoring; virtual;//v5C//00770614
    procedure StartMonitoring; virtual;//v60//0077089C
    procedure StopMonitoring; virtual;//v64//007708E0
    procedure MonitorFrame; virtual;//v68//00770514
  end;
    //function sub_0076CD1C:?;//0076CD1C
    //procedure sub_0076D290(?:?);//0076D290
    //procedure sub_0076D2AC(?:?);//0076D2AC
    //procedure sub_0076D36C(?:?; ?:?; ?:?);//0076D36C
    //procedure sub_0076D414(?:Pointer; ?:?);//0076D414
    //function sub_0076E404(?:Integer):?;//0076E404
    //procedure sub_0076E984(?:?);//0076E984
    //function sub_0076E9B0(?:UnicodeString):?;//0076E9B0
    //function sub_0076EA04(?:string):?;//0076EA04
    procedure sub_0076F01C;//0076F01C
    procedure sub_0076F040;//0076F040
    procedure sub_0076F044;//0076F044
    procedure sub_0076F174;//0076F174

implementation

{$R *.DFM}

//0076BAC8
procedure INuiFrameTexture.BufferLen; stdcall;
begin
{*
>0076BAC8    jmp         @AbstractError
*}
end;

//0076BAD0
procedure INuiFrameTexture.Pitch; stdcall;
begin
{*
>0076BAD0    jmp         @AbstractError
*}
end;

//0076BAD8
procedure INuiFrameTexture.LockRect(Level:Cardinal; var LockedRect:NUI_LOCKED_RECT; pRectUsuallyNull:PRect; Flags:Cardinal); stdcall;
begin
{*
>0076BAD8    jmp         @AbstractError
*}
end;

//0076BAE0
procedure INuiFrameTexture.GetLevelDesc(Level:Cardinal; refDesc:NUI_SURFACE_DESC); stdcall;
begin
{*
>0076BAE0    jmp         @AbstractError
*}
end;

//0076BAE8
procedure INuiFrameTexture.UnlockRect(Level:Cardinal); stdcall;
begin
{*
>0076BAE8    jmp         @AbstractError
*}
end;

//0076CC8C
procedure INuiInstance._InstanceIndex(EDX:Integer; i:INuiInstance);
begin
{*
>0076CC8C    jmp         @AbstractError
*}
end;

//0076CC94
procedure INuiInstance._NuiInitialize(EDX:Integer; i:INuiInstance; dwFlags:Cardinal);
begin
{*
>0076CC94    jmp         @AbstractError
*}
end;

//0076CC9C
procedure INuiInstance._NuiShutdown(EDX:Integer; i:INuiInstance);
begin
{*
>0076CC9C    jmp         @AbstractError
*}
end;

//0076CCA4
procedure INuiInstance._NuiImageStreamOpen;
begin
{*
>0076CCA4    jmp         @AbstractError
*}
end;

//0076CCAC
procedure INuiInstance._NuiImageStreamGetNextFrame(EDX:Integer; i:INuiInstance; hStream:Cardinal; dwMillisecondsToWait:Cardinal; refpcImageFrame:PNUI_IMAGE_FRAME);
begin
{*
>0076CCAC    jmp         @AbstractError
*}
end;

//0076CCB4
procedure INuiInstance._NuiImageStreamReleaseFrame(EDX:Integer; i:INuiInstance; hStream:Cardinal; pImageFrame:PNUI_IMAGE_FRAME);
begin
{*
>0076CCB4    jmp         @AbstractError
*}
end;

//0076CCBC
procedure INuiInstance._NuiImageGetColorPixelCoordinatesFromDepthPixel;
begin
{*
>0076CCBC    jmp         @AbstractError
*}
end;

//0076CCC4
procedure INuiInstance._NuiCameraElevationSetAngle(EDX:Integer; i:INuiInstance; lAngleDegrees:Integer);
begin
{*
>0076CCC4    jmp         @AbstractError
*}
end;

//0076CCCC
procedure INuiInstance._NuiCameraElevationGetAngle(EDX:Integer; i:INuiInstance; reflAngleDegrees:Integer);
begin
{*
>0076CCCC    jmp         @AbstractError
*}
end;

//0076CCD4
procedure INuiInstance._NuiSkeletonTrackingEnable(EDX:Integer; i:INuiInstance; hNextFrameEvent:Cardinal; dwFlags:Cardinal);
begin
{*
>0076CCD4    jmp         @AbstractError
*}
end;

//0076CCDC
procedure INuiInstance._NuiSkeletonTrackingDisable(EDX:Integer; i:INuiInstance);
begin
{*
>0076CCDC    jmp         @AbstractError
*}
end;

//0076CCE4
procedure INuiInstance._NuiSkeletonGetNextFrame(EDX:Integer; i:INuiInstance; dwMillisecondsToWait:Cardinal; var SkeletonFrame:NUI_SKELETON_FRAME);
begin
{*
>0076CCE4    jmp         @AbstractError
*}
end;

//0076CCEC
procedure INuiInstance._NuiTransformSmooth(EDX:Integer; i:INuiInstance; var SkeletonFrame:NUI_SKELETON_FRAME; pSmoothingParams:PNUI_TRANSFORM_SMOOTH_PARAMETERS);
begin
{*
>0076CCEC    jmp         @AbstractError
*}
end;

//0076CCF4
{*procedure INuiInstance._MSR_NuiGetPropsBlob(EDX:Integer; i:INuiInstance; Index:NUI_PROPSINDEX; var Blob:?; var InOutSize:Cardinal);
begin
>0076CCF4    jmp         @AbstractError
end;*}

//0076CCFC
procedure INuiInstance._MSR_NuiGetPropsType(EDX:Integer; i:INuiInstance; Index:NUI_PROPSINDEX);
begin
{*
>0076CCFC    jmp         @AbstractError
*}
end;

//0076CD04
procedure INuiInstance._NuiInstanceName(EDX:Integer; i:INuiInstance);
begin
{*
>0076CD04    jmp         @AbstractError
*}
end;

//0076CD0C
procedure INuiInstance._NuiStatus(EDX:Integer; i:INuiInstance);
begin
{*
>0076CD0C    jmp         @AbstractError
*}
end;

//0076CD14
procedure INuiInstance._NuiInitializationFlags(EDX:Integer; i:INuiInstance);
begin
{*
>0076CD14    jmp         @AbstractError
*}
end;

//0076CD1C
{*function sub_0076CD1C:?;
begin
 0076CD1C    push        ebx
 0076CD1D    push        esi
 0076CD1E    mov         esi,78CA28;gvar_0078CA28:HMODULE
 0076CD23    cmp         dword ptr [esi],0
>0076CD26    je          0076CD2F
 0076CD28    mov         bl,1
>0076CD2A    jmp         0076CEDE
 0076CD2F    xor         ebx,ebx
 0076CD31    mov         dword ptr ds:[78C9E8],76D2AC
 0076CD3B    push        76CEE4;'MSRKinectNui.dll'
 0076CD40    call        kernel32.LoadLibraryW
 0076CD45    mov         dword ptr [esi],eax
 0076CD47    cmp         dword ptr [esi],0
>0076CD4A    je          0076CEDE
 0076CD50    push        76CF08;'NuiInitialize'
 0076CD55    mov         eax,dword ptr [esi]
 0076CD57    push        eax
 0076CD58    call        GetProcAddress
 0076CD5D    mov         [00822D70],eax;gvar_00822D70:Pointer
 0076CD62    push        76CF24;'NuiShutdown'
 0076CD67    mov         eax,dword ptr [esi]
 0076CD69    push        eax
 0076CD6A    call        GetProcAddress
 0076CD6F    mov         [00822D74],eax;gvar_00822D74:Pointer
 0076CD74    push        76CF3C;'MSR_NUIGetDeviceCount'
 0076CD79    mov         eax,dword ptr [esi]
 0076CD7B    push        eax
 0076CD7C    call        GetProcAddress
 0076CD81    mov         [0078C9E8],eax;gvar_0078C9E8:Pointer
 0076CD86    push        76CF68;'MSR_NuiSetDeviceStatusCallback'
 0076CD8B    mov         eax,dword ptr [esi]
 0076CD8D    push        eax
 0076CD8E    call        GetProcAddress
 0076CD93    mov         [0078C9EC],eax;gvar_0078C9EC:Pointer
 0076CD98    push        76CFA8;'MSR_NuiGetPropsBlob'
 0076CD9D    mov         eax,dword ptr [esi]
 0076CD9F    push        eax
 0076CDA0    call        GetProcAddress
 0076CDA5    mov         [0078C9F0],eax;gvar_0078C9F0:Pointer
 0076CDAA    push        76CFD0;'MSR_NuiGetPropsType'
 0076CDAF    mov         eax,dword ptr [esi]
 0076CDB1    push        eax
 0076CDB2    call        GetProcAddress
 0076CDB7    mov         [0078C9F4],eax;gvar_0078C9F4:Pointer
 0076CDBC    push        76CFF8;'MSR_NuiCreateInstanceByIndex'
 0076CDC1    mov         eax,dword ptr [esi]
 0076CDC3    push        eax
 0076CDC4    call        GetProcAddress
 0076CDC9    mov         [0078C9F8],eax;gvar_0078C9F8:Pointer
 0076CDCE    push        76D034;'MSR_NuiDestroyInstance'
 0076CDD3    mov         eax,dword ptr [esi]
 0076CDD5    push        eax
 0076CDD6    call        GetProcAddress
 0076CDDB    mov         [0078C9FC],eax;gvar_0078C9FC:Pointer
 0076CDE0    push        76D064;'NuiImageStreamOpen'
 0076CDE5    mov         eax,dword ptr [esi]
 0076CDE7    push        eax
 0076CDE8    call        GetProcAddress
 0076CDED    mov         [0078CA00],eax;gvar_0078CA00:Pointer
 0076CDF2    push        76D08C;'NuiImageStreamGetNextFrame'
 0076CDF7    mov         eax,dword ptr [esi]
 0076CDF9    push        eax
 0076CDFA    call        GetProcAddress
 0076CDFF    mov         [0078CA04],eax;gvar_0078CA04:Pointer
 0076CE04    push        76D0C4;'NuiImageStreamReleaseFrame'
 0076CE09    mov         eax,dword ptr [esi]
 0076CE0B    push        eax
 0076CE0C    call        GetProcAddress
 0076CE11    mov         [0078CA08],eax;gvar_0078CA08:Pointer
 0076CE16    push        76D0FC;'NuiImageGetColorPixelCoordinatesFromDepthPixel'
 0076CE1B    mov         eax,dword ptr [esi]
 0076CE1D    push        eax
 0076CE1E    call        GetProcAddress
 0076CE23    mov         [0078CA0C],eax;gvar_0078CA0C:Pointer
 0076CE28    push        76D15C;'NuiCameraElevationSetAngle'
 0076CE2D    mov         eax,dword ptr [esi]
 0076CE2F    push        eax
 0076CE30    call        GetProcAddress
 0076CE35    mov         [0078CA10],eax;gvar_0078CA10:Pointer
 0076CE3A    push        76D194;'NuiCameraElevationGetAngle'
 0076CE3F    mov         eax,dword ptr [esi]
 0076CE41    push        eax
 0076CE42    call        GetProcAddress
 0076CE47    mov         [0078CA14],eax;gvar_0078CA14:Pointer
 0076CE4C    push        76D1CC;'NuiSkeletonTrackingEnable'
 0076CE51    mov         eax,dword ptr [esi]
 0076CE53    push        eax
 0076CE54    call        GetProcAddress
 0076CE59    mov         [0078CA18],eax;gvar_0078CA18:Pointer
 0076CE5E    push        76D200;'NuiSkeletonTrackingDisable'
 0076CE63    mov         eax,dword ptr [esi]
 0076CE65    push        eax
 0076CE66    call        GetProcAddress
 0076CE6B    mov         [0078CA1C],eax;gvar_0078CA1C:Pointer
 0076CE70    push        76D238;'NuiSkeletonGetNextFrame'
 0076CE75    mov         eax,dword ptr [esi]
 0076CE77    push        eax
 0076CE78    call        GetProcAddress
 0076CE7D    mov         [0078CA20],eax;gvar_0078CA20:Pointer
 0076CE82    push        76D268;'NuiTransformSmooth'
 0076CE87    mov         eax,dword ptr [esi]
 0076CE89    push        eax
 0076CE8A    call        GetProcAddress
 0076CE8F    mov         [0078CA24],eax;gvar_0078CA24:Pointer
 0076CE94    cmp         dword ptr ds:[822D70],0;gvar_00822D70:Pointer
>0076CE9B    je          0076CEDE
 0076CE9D    cmp         dword ptr ds:[822D74],0;gvar_00822D74:Pointer
>0076CEA4    je          0076CEDE
 0076CEA6    cmp         dword ptr ds:[78C9FC],0;gvar_0078C9FC:Pointer
>0076CEAD    je          0076CEDE
 0076CEAF    cmp         dword ptr ds:[78C9E8],0;gvar_0078C9E8:Pointer
>0076CEB6    je          0076CEDE
 0076CEB8    cmp         dword ptr ds:[78C9EC],0;gvar_0078C9EC:Pointer
>0076CEBF    je          0076CEDE
 0076CEC1    cmp         dword ptr ds:[78C9F0],0;gvar_0078C9F0:Pointer
>0076CEC8    je          0076CEDE
 0076CECA    cmp         dword ptr ds:[78C9F4],0;gvar_0078C9F4:Pointer
>0076CED1    je          0076CEDE
 0076CED3    cmp         dword ptr ds:[78C9F8],0;gvar_0078C9F8:Pointer
>0076CEDA    je          0076CEDE
 0076CEDC    mov         bl,1
 0076CEDE    mov         eax,ebx
 0076CEE0    pop         esi
 0076CEE1    pop         ebx
 0076CEE2    ret
end;*}

//0076D290
{*procedure sub_0076D290(?:?);
begin
 0076D290    push        ebx
 0076D291    mov         ebx,eax
 0076D293    call        0076CD1C
 0076D298    test        al,al
>0076D29A    je          0076D2A6
 0076D29C    mov         eax,dword ptr [ebx]
 0076D29E    push        eax
 0076D29F    call        dword ptr ds:[78C9FC]
 0076D2A5    pop         ecx
 0076D2A6    xor         eax,eax
 0076D2A8    mov         dword ptr [ebx],eax
 0076D2AA    pop         ebx
 0076D2AB    ret
end;*}

//0076D2AC
{*procedure sub_0076D2AC(?:?);
begin
 0076D2AC    push        ebp
 0076D2AD    mov         ebp,esp
 0076D2AF    push        ebx
 0076D2B0    mov         ebx,dword ptr [ebp+8]
 0076D2B3    call        0076CD1C
 0076D2B8    test        al,al
>0076D2BA    jne         0076D2C8
 0076D2BC    xor         eax,eax
 0076D2BE    mov         dword ptr [ebx],eax
 0076D2C0    mov         eax,80004002
 0076D2C5    pop         ebx
 0076D2C6    pop         ebp
 0076D2C7    ret
 0076D2C8    push        ebx
 0076D2C9    call        dword ptr ds:[78C9E8]
 0076D2CF    pop         ecx
 0076D2D0    pop         ebx
 0076D2D1    pop         ebp
 0076D2D2    ret
end;*}

//0076D36C
{*procedure sub_0076D36C(?:?; ?:?; ?:?);
begin
 0076D36C    push        ebp
 0076D36D    mov         ebp,esp
 0076D36F    push        0
 0076D371    push        ebx
 0076D372    push        esi
 0076D373    push        edi
 0076D374    mov         ebx,ecx
 0076D376    mov         edi,edx
 0076D378    mov         esi,eax
 0076D37A    xor         eax,eax
 0076D37C    push        ebp
 0076D37D    push        76D3F6
 0076D382    push        dword ptr fs:[eax]
 0076D385    mov         dword ptr fs:[eax],esp
 0076D388    test        esi,esi
>0076D38A    jbe         0076D3B4
 0076D38C    lea         eax,[ebp-4]
 0076D38F    mov         edx,esi
 0076D391    and         edx,0F
 0076D394    movzx       edx,word ptr [edx*2+78CA2C]
 0076D39C    call        @UStrFromWChar
 0076D3A1    mov         edx,dword ptr [ebp-4]
 0076D3A4    mov         ecx,dword ptr [ebx]
 0076D3A6    mov         eax,ebx
 0076D3A8    call        @UStrCat3
 0076D3AD    shr         esi,4
 0076D3B0    test        esi,esi
>0076D3B2    ja          0076D38C
 0076D3B4    cmp         dword ptr [ebx],0
>0076D3B7    jne         0076D3D5
 0076D3B9    mov         eax,ebx
 0076D3BB    mov         edx,76D410;'0'
 0076D3C0    call        @UStrAsg
>0076D3C5    jmp         0076D3D5
 0076D3C7    mov         ecx,dword ptr [ebx]
 0076D3C9    mov         eax,ebx
 0076D3CB    mov         edx,76D410;'0'
 0076D3D0    call        @UStrCat3
 0076D3D5    mov         eax,dword ptr [ebx]
 0076D3D7    call        @UStrLen
 0076D3DC    cmp         edi,eax
>0076D3DE    jg          0076D3C7
 0076D3E0    xor         eax,eax
 0076D3E2    pop         edx
 0076D3E3    pop         ecx
 0076D3E4    pop         ecx
 0076D3E5    mov         dword ptr fs:[eax],edx
 0076D3E8    push        76D3FD
 0076D3ED    lea         eax,[ebp-4]
 0076D3F0    call        @UStrClr
 0076D3F5    ret
>0076D3F6    jmp         @HandleFinally
>0076D3FB    jmp         0076D3ED
 0076D3FD    pop         edi
 0076D3FE    pop         esi
 0076D3FF    pop         ebx
 0076D400    pop         ecx
 0076D401    pop         ebp
 0076D402    ret
end;*}

//0076D414
{*procedure sub_0076D414(?:Pointer; ?:?);
begin
 0076D414    push        ebx
 0076D415    push        esi
 0076D416    mov         esi,edx
 0076D418    mov         ebx,eax
 0076D41A    mov         eax,ebx
 0076D41C    cmp         eax,800704DF
>0076D421    jg          0076D4D5
>0076D427    je          0076D642
 0076D42D    cmp         eax,80070005
>0076D432    jg          0076D48B
>0076D434    je          0076D606
 0076D43A    cmp         eax,80004003
>0076D43F    jg          0076D469
>0076D441    je          0076D5CA
 0076D447    sub         eax,8000000A
>0076D44C    je          0076D615
 0076D452    sub         eax,3FF7
>0076D457    je          0076D58E
 0076D45D    dec         eax
>0076D45E    je          0076D5BB
>0076D464    jmp         0076D714
 0076D469    sub         eax,80004004
>0076D46E    je          0076D5E8
 0076D474    dec         eax
>0076D475    je          0076D5F7
 0076D47B    sub         eax,0BFFA
>0076D480    je          0076D57F
>0076D486    jmp         0076D714
 0076D48B    cmp         eax,80070057
>0076D490    jg          0076D4BA
>0076D492    je          0076D5AC
 0076D498    sub         eax,80070006
>0076D49D    je          0076D5D9
 0076D4A3    sub         eax,8
>0076D4A6    je          0076D59D
 0076D4AC    sub         eax,7
>0076D4AF    je          0076D633
>0076D4B5    jmp         0076D714
 0076D4BA    sub         eax,80070103
>0076D4BF    je          0076D651
 0076D4C5    sub         eax,38C
>0076D4CA    je          0076D624
>0076D4D0    jmp         0076D714
 0076D4D5    cmp         eax,8301000E
>0076D4DA    jg          0076D52B
>0076D4DC    je          0076D6BA
 0076D4E2    add         eax,7CFEFFFF
 0076D4E7    cmp         eax,0C
>0076D4EA    ja          0076D714
 0076D4F0    jmp         dword ptr [eax*4+76D4F7]
 0076D4F0    dd          0076D660
 0076D4F0    dd          0076D66F
 0076D4F0    dd          0076D67E
 0076D4F0    dd          0076D68D
 0076D4F0    dd          0076D69C
 0076D4F0    dd          0076D714
 0076D4F0    dd          0076D714
 0076D4F0    dd          0076D714
 0076D4F0    dd          0076D714
 0076D4F0    dd          0076D714
 0076D4F0    dd          0076D714
 0076D4F0    dd          0076D714
 0076D4F0    dd          0076D6AB
 0076D52B    cmp         eax,8301027F
>0076D530    jg          0076D55A
>0076D532    je          0076D6F6
 0076D538    sub         eax,83010014
>0076D53D    je          0076D6C9
 0076D543    dec         eax
>0076D544    je          0076D6D8
 0076D54A    sub         eax,95
>0076D54F    je          0076D6E7
>0076D555    jmp         0076D714
 0076D55A    sub         eax,83010585
>0076D55F    je          0076D705
 0076D565    sub         eax,7CFEFA7B
>0076D56A    jne         0076D714
 0076D570    mov         eax,esi
 0076D572    mov         edx,76D734;'S_OK'
 0076D577    call        @UStrAsg
 0076D57C    pop         esi
 0076D57D    pop         ebx
 0076D57E    ret
 0076D57F    mov         eax,esi
 0076D581    mov         edx,76D74C;'E_UNEXPECTED'
 0076D586    call        @UStrAsg
 0076D58B    pop         esi
 0076D58C    pop         ebx
 0076D58D    ret
 0076D58E    mov         eax,esi
 0076D590    mov         edx,76D774;'E_NOTIMPL'
 0076D595    call        @UStrAsg
 0076D59A    pop         esi
 0076D59B    pop         ebx
 0076D59C    ret
 0076D59D    mov         eax,esi
 0076D59F    mov         edx,76D794;'E_OUTOFMEMORY'
 0076D5A4    call        @UStrAsg
 0076D5A9    pop         esi
 0076D5AA    pop         ebx
 0076D5AB    ret
 0076D5AC    mov         eax,esi
 0076D5AE    mov         edx,76D7BC;'E_INVALIDARG'
 0076D5B3    call        @UStrAsg
 0076D5B8    pop         esi
 0076D5B9    pop         ebx
 0076D5BA    ret
 0076D5BB    mov         eax,esi
 0076D5BD    mov         edx,76D7E4;'E_NOINTERFACE'
 0076D5C2    call        @UStrAsg
 0076D5C7    pop         esi
 0076D5C8    pop         ebx
 0076D5C9    ret
 0076D5CA    mov         eax,esi
 0076D5CC    mov         edx,76D80C;'E_POINTER'
 0076D5D1    call        @UStrAsg
 0076D5D6    pop         esi
 0076D5D7    pop         ebx
 0076D5D8    ret
 0076D5D9    mov         eax,esi
 0076D5DB    mov         edx,76D82C;'E_HANDLE'
 0076D5E0    call        @UStrAsg
 0076D5E5    pop         esi
 0076D5E6    pop         ebx
 0076D5E7    ret
 0076D5E8    mov         eax,esi
 0076D5EA    mov         edx,76D84C;'E_ABORT'
 0076D5EF    call        @UStrAsg
 0076D5F4    pop         esi
 0076D5F5    pop         ebx
 0076D5F6    ret
 0076D5F7    mov         eax,esi
 0076D5F9    mov         edx,76D868;'E_FAIL'
 0076D5FE    call        @UStrAsg
 0076D603    pop         esi
 0076D604    pop         ebx
 0076D605    ret
 0076D606    mov         eax,esi
 0076D608    mov         edx,76D884;'E_ACCESSDENIED'
 0076D60D    call        @UStrAsg
 0076D612    pop         esi
 0076D613    pop         ebx
 0076D614    ret
 0076D615    mov         eax,esi
 0076D617    mov         edx,76D8B0;'E_PENDING'
 0076D61C    call        @UStrAsg
 0076D621    pop         esi
 0076D622    pop         ebx
 0076D623    ret
 0076D624    mov         eax,esi
 0076D626    mov         edx,76D8D0;'E_NUI_DEVICE_NOT_CONNECTED'
 0076D62B    call        @UStrAsg
 0076D630    pop         esi
 0076D631    pop         ebx
 0076D632    ret
 0076D633    mov         eax,esi
 0076D635    mov         edx,76D914;'E_NUI_DEVICE_NOT_READY'
 0076D63A    call        @UStrAsg
 0076D63F    pop         esi
 0076D640    pop         ebx
 0076D641    ret
 0076D642    mov         eax,esi
 0076D644    mov         edx,76D950;'E_NUI_ALREADY_INITIALIZED'
 0076D649    call        @UStrAsg
 0076D64E    pop         esi
 0076D64F    pop         ebx
 0076D650    ret
 0076D651    mov         eax,esi
 0076D653    mov         edx,76D990;'E_NUI_NO_MORE_ITEMS'
 0076D658    call        @UStrAsg
 0076D65D    pop         esi
 0076D65E    pop         ebx
 0076D65F    ret
 0076D660    mov         eax,esi
 0076D662    mov         edx,76D9C4;'E_NUI_FRAME_NO_DATA'
 0076D667    call        @UStrAsg
 0076D66C    pop         esi
 0076D66D    pop         ebx
 0076D66E    ret
 0076D66F    mov         eax,esi
 0076D671    mov         edx,76D9F8;'E_NUI_STREAM_NOT_ENABLED'
 0076D676    call        @UStrAsg
 0076D67B    pop         esi
 0076D67C    pop         ebx
 0076D67D    ret
 0076D67E    mov         eax,esi
 0076D680    mov         edx,76DA38;'E_NUI_IMAGE_STREAM_IN_USE'
 0076D685    call        @UStrAsg
 0076D68A    pop         esi
 0076D68B    pop         ebx
 0076D68C    ret
 0076D68D    mov         eax,esi
 0076D68F    mov         edx,76DA78;'E_NUI_FRAME_LIMIT_EXCEEDED'
 0076D694    call        @UStrAsg
 0076D699    pop         esi
 0076D69A    pop         ebx
 0076D69B    ret
 0076D69C    mov         eax,esi
 0076D69E    mov         edx,76DABC;'E_NUI_FEATURE_NOT_INITIALIZED'
 0076D6A3    call        @UStrAsg
 0076D6A8    pop         esi
 0076D6A9    pop         ebx
 0076D6AA    ret
 0076D6AB    mov         eax,esi
 0076D6AD    mov         edx,76DB04;'E_NUI_DATABASE_NOT_FOUND'
 0076D6B2    call        @UStrAsg
 0076D6B7    pop         esi
 0076D6B8    pop         ebx
 0076D6B9    ret
 0076D6BA    mov         eax,esi
 0076D6BC    mov         edx,76DB44;'E_NUI_DATABASE_VERSION_MISMATCH'
 0076D6C1    call        @UStrAsg
 0076D6C6    pop         esi
 0076D6C7    pop         ebx
 0076D6C8    ret
 0076D6C9    mov         eax,esi
 0076D6CB    mov         edx,76DB90;'E_NUI_NOTCONNECTED'
 0076D6D0    call        @UStrAsg
 0076D6D5    pop         esi
 0076D6D6    pop         ebx
 0076D6D7    ret
 0076D6D8    mov         eax,esi
 0076D6DA    mov         edx,76DBC4;'E_NUI_NOTREADY'
 0076D6DF    call        @UStrAsg
 0076D6E4    pop         esi
 0076D6E5    pop         ebx
 0076D6E6    ret
 0076D6E7    mov         eax,esi
 0076D6E9    mov         edx,76DBF0;'E_NUI_SKELETAL_ENGINE_BUSY'
 0076D6EE    call        @UStrAsg
 0076D6F3    pop         esi
 0076D6F4    pop         ebx
 0076D6F5    ret
 0076D6F6    mov         eax,esi
 0076D6F8    mov         edx,76DC34;'E_NUI_NOTPOWERED'
 0076D6FD    call        @UStrAsg
 0076D702    pop         esi
 0076D703    pop         ebx
 0076D704    ret
 0076D705    mov         eax,esi
 0076D707    mov         edx,76DC64;'E_NUI_BADIINDEX'
 0076D70C    call        @UStrAsg
 0076D711    pop         esi
 0076D712    pop         ebx
 0076D713    ret
 0076D714    mov         ecx,esi
 0076D716    mov         edx,8
 0076D71B    mov         eax,ebx
 0076D71D    call        0076D36C
 0076D722    pop         esi
 0076D723    pop         ebx
 0076D724    ret
end;*}

//0076DC84
procedure INuiInstance.Free;
begin
{*
 0076DC84    push        ecx
 0076DC85    mov         dword ptr [esp],eax
 0076DC88    cmp         dword ptr [esp],0
>0076DC8C    je          0076DC9D
 0076DC8E    mov         eax,dword ptr [esp]
 0076DC91    call        INuiInstance.NuiShutdown
 0076DC96    mov         eax,esp
 0076DC98    call        0076D290
 0076DC9D    pop         edx
 0076DC9E    ret
*}
end;

//0076DCA0
procedure INuiInstance.InstanceIndex;
begin
{*
 0076DCA0    push        ebx
 0076DCA1    mov         ecx,eax
 0076DCA3    xor         edx,edx
 0076DCA5    mov         ebx,dword ptr [eax]
 0076DCA7    call        dword ptr [ebx];@AbstractError
 0076DCA9    pop         ebx
 0076DCAA    ret
*}
end;

//0076DCAC
{*procedure INuiInstance.MSR_NuiGetPropsBlob(Index:NUI_PROPSINDEX; var Blob:?; var InOutSize:Cardinal);
begin
 0076DCAC    push        ebp
 0076DCAD    mov         ebp,esp
 0076DCAF    push        ebx
 0076DCB0    push        esi
 0076DCB1    mov         esi,eax
 0076DCB3    mov         eax,dword ptr [ebp+8]
 0076DCB6    push        eax
 0076DCB7    push        ecx
 0076DCB8    push        edx
 0076DCB9    mov         eax,esi
 0076DCBB    xor         edx,edx
 0076DCBD    mov         ecx,esi
 0076DCBF    mov         ebx,dword ptr [eax]
 0076DCC1    call        dword ptr [ebx+34];@AbstractError
 0076DCC4    pop         esi
 0076DCC5    pop         ebx
 0076DCC6    pop         ebp
 0076DCC7    ret         4
end;*}

//0076DCCC
procedure INuiInstance.MSR_NuiGetPropsType(Index:NUI_PROPSINDEX);
begin
{*
 0076DCCC    push        ebx
 0076DCCD    push        edx
 0076DCCE    mov         ecx,eax
 0076DCD0    xor         edx,edx
 0076DCD2    mov         ebx,dword ptr [eax]
 0076DCD4    call        dword ptr [ebx+38];@AbstractError
 0076DCD7    pop         ebx
 0076DCD8    ret
*}
end;

//0076DCDC
function INuiInstance.NuiCameraElevationGetAngle(reflAngleDegrees:Integer):HRESULT;
begin
{*
 0076DCDC    push        ebx
 0076DCDD    push        esi
 0076DCDE    mov         esi,eax
 0076DCE0    push        edx
 0076DCE1    mov         ecx,esi
 0076DCE3    mov         eax,esi
 0076DCE5    xor         edx,edx
 0076DCE7    mov         ebx,dword ptr [eax]
 0076DCE9    call        dword ptr [ebx+20];@AbstractError
 0076DCEC    pop         esi
 0076DCED    pop         ebx
 0076DCEE    ret
*}
end;

//0076DCF0
procedure INuiInstance.NuiCameraElevationSetAngle(lAngleDegrees:Integer);
begin
{*
 0076DCF0    push        ebx
 0076DCF1    push        esi
 0076DCF2    mov         esi,eax
 0076DCF4    push        edx
 0076DCF5    mov         ecx,esi
 0076DCF7    mov         eax,esi
 0076DCF9    xor         edx,edx
 0076DCFB    mov         ebx,dword ptr [eax]
 0076DCFD    call        dword ptr [ebx+1C];@AbstractError
 0076DD00    pop         esi
 0076DD01    pop         ebx
 0076DD02    ret
*}
end;

//0076DD04
{*procedure INuiInstance.NuiImageGetColorPixelCoordinatesFromDepthPixel(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0076DD04    push        ebp
 0076DD05    mov         ebp,esp
 0076DD07    push        ebx
 0076DD08    push        esi
 0076DD09    push        edi
 0076DD0A    mov         edi,edx
 0076DD0C    mov         esi,eax
 0076DD0E    mov         eax,dword ptr [ebp+8]
 0076DD11    push        eax
 0076DD12    mov         eax,dword ptr [ebp+0C]
 0076DD15    push        eax
 0076DD16    movzx       eax,word ptr [ebp+10]
 0076DD1A    push        eax
 0076DD1B    mov         eax,dword ptr [ebp+14]
 0076DD1E    push        eax
 0076DD1F    mov         eax,dword ptr [ebp+18]
 0076DD22    push        eax
 0076DD23    push        ecx
 0076DD24    push        edi
 0076DD25    xor         edx,edx
 0076DD27    mov         eax,esi
 0076DD29    mov         ecx,esi
 0076DD2B    mov         ebx,dword ptr [eax]
 0076DD2D    call        dword ptr [ebx+18];@AbstractError
 0076DD30    pop         edi
 0076DD31    pop         esi
 0076DD32    pop         ebx
 0076DD33    pop         ebp
 0076DD34    ret         14
end;*}

//0076DD38
procedure INuiInstance.NuiImageStreamGetNextFrame(hStream:Cardinal; dwMillisecondsToWait:Cardinal; refpcImageFrame:PNUI_IMAGE_FRAME);
begin
{*
 0076DD38    push        ebp
 0076DD39    mov         ebp,esp
 0076DD3B    push        ebx
 0076DD3C    push        esi
 0076DD3D    push        edi
 0076DD3E    mov         edi,edx
 0076DD40    mov         esi,eax
 0076DD42    mov         eax,dword ptr [ebp+8]
 0076DD45    push        eax
 0076DD46    push        ecx
 0076DD47    push        edi
 0076DD48    xor         edx,edx
 0076DD4A    mov         eax,esi
 0076DD4C    mov         ecx,esi
 0076DD4E    mov         ebx,dword ptr [eax]
 0076DD50    call        dword ptr [ebx+10];@AbstractError
 0076DD53    pop         edi
 0076DD54    pop         esi
 0076DD55    pop         ebx
 0076DD56    pop         ebp
 0076DD57    ret         4
*}
end;

//0076DD5C
{*procedure INuiInstance.NuiImageStreamOpen(?:?; ?:?; ?:?; ?:?);
begin
 0076DD5C    push        ebp
 0076DD5D    mov         ebp,esp
 0076DD5F    push        ebx
 0076DD60    push        esi
 0076DD61    mov         esi,eax
 0076DD63    mov         eax,dword ptr [ebp+8]
 0076DD66    push        eax
 0076DD67    mov         eax,dword ptr [ebp+0C]
 0076DD6A    push        eax
 0076DD6B    mov         eax,dword ptr [ebp+10]
 0076DD6E    push        eax
 0076DD6F    mov         eax,dword ptr [ebp+14]
 0076DD72    push        eax
 0076DD73    push        ecx
 0076DD74    push        edx
 0076DD75    mov         eax,esi
 0076DD77    xor         edx,edx
 0076DD79    mov         ecx,esi
 0076DD7B    mov         ebx,dword ptr [eax]
 0076DD7D    call        dword ptr [ebx+0C];@AbstractError
 0076DD80    pop         esi
 0076DD81    pop         ebx
 0076DD82    pop         ebp
 0076DD83    ret         10
end;*}

//0076DD88
procedure INuiInstance.NuiImageStreamReleaseFrame(hStream:Cardinal; pImageFrame:PNUI_IMAGE_FRAME);
begin
{*
 0076DD88    push        ebx
 0076DD89    push        esi
 0076DD8A    push        edi
 0076DD8B    mov         edi,edx
 0076DD8D    mov         esi,eax
 0076DD8F    push        ecx
 0076DD90    push        edi
 0076DD91    xor         edx,edx
 0076DD93    mov         eax,esi
 0076DD95    mov         ecx,esi
 0076DD97    mov         ebx,dword ptr [eax]
 0076DD99    call        dword ptr [ebx+14];@AbstractError
 0076DD9C    pop         edi
 0076DD9D    pop         esi
 0076DD9E    pop         ebx
 0076DD9F    ret
*}
end;

//0076DDA0
procedure INuiInstance.NuiInitializationFlags;
begin
{*
 0076DDA0    push        ebx
 0076DDA1    mov         ecx,eax
 0076DDA3    xor         edx,edx
 0076DDA5    mov         ebx,dword ptr [eax]
 0076DDA7    call        dword ptr [ebx+44];@AbstractError
 0076DDAA    pop         ebx
 0076DDAB    ret
*}
end;

//0076DDAC
function INuiInstance.NuiInitialize(dwFlags:Cardinal):HRESULT;
begin
{*
 0076DDAC    push        ebx
 0076DDAD    push        edx
 0076DDAE    mov         ecx,eax
 0076DDB0    xor         edx,edx
 0076DDB2    mov         ebx,dword ptr [eax]
 0076DDB4    call        dword ptr [ebx+4];@AbstractError
 0076DDB7    pop         ebx
 0076DDB8    ret
*}
end;

//0076DDBC
{*procedure INuiInstance.NuiInstanceName(?:?);
begin
 0076DDBC    push        ebx
 0076DDBD    push        esi
 0076DDBE    push        ecx
 0076DDBF    mov         esi,edx
 0076DDC1    mov         ebx,eax
 0076DDC3    mov         ecx,ebx
 0076DDC5    xor         edx,edx
 0076DDC7    mov         eax,ebx
 0076DDC9    mov         ebx,dword ptr [eax]
 0076DDCB    call        dword ptr [ebx+3C];@AbstractError
 0076DDCE    mov         dword ptr [esp],eax
 0076DDD1    mov         edx,dword ptr [esp]
 0076DDD4    mov         eax,esi
 0076DDD6    call        @WStrAsg
 0076DDDB    pop         edx
 0076DDDC    pop         esi
 0076DDDD    pop         ebx
 0076DDDE    ret
end;*}

//0076DDE0
procedure INuiInstance.NuiShutdown;
begin
{*
 0076DDE0    push        ebx
 0076DDE1    mov         ecx,eax
 0076DDE3    xor         edx,edx
 0076DDE5    mov         ebx,dword ptr [eax]
 0076DDE7    call        dword ptr [ebx+8];@AbstractError
 0076DDEA    pop         ebx
 0076DDEB    ret
*}
end;

//0076DDEC
function INuiInstance.NuiSkeletonGetNextFrame(dwMillisecondsToWait:Cardinal; var SkeletonFrame:NUI_SKELETON_FRAME):HRESULT;
begin
{*
 0076DDEC    push        ebx
 0076DDED    push        esi
 0076DDEE    push        edi
 0076DDEF    mov         edi,edx
 0076DDF1    mov         esi,eax
 0076DDF3    push        ecx
 0076DDF4    push        edi
 0076DDF5    xor         edx,edx
 0076DDF7    mov         eax,esi
 0076DDF9    mov         ecx,esi
 0076DDFB    mov         ebx,dword ptr [eax]
 0076DDFD    call        dword ptr [ebx+2C];@AbstractError
 0076DE00    pop         edi
 0076DE01    pop         esi
 0076DE02    pop         ebx
 0076DE03    ret
*}
end;

//0076DE04
function INuiInstance.NuiSkeletonTrackingDisable:HRESULT;
begin
{*
 0076DE04    push        ebx
 0076DE05    mov         ecx,eax
 0076DE07    xor         edx,edx
 0076DE09    mov         ebx,dword ptr [eax]
 0076DE0B    call        dword ptr [ebx+28];@AbstractError
 0076DE0E    pop         ebx
 0076DE0F    ret
*}
end;

//0076DE10
function INuiInstance.NuiSkeletonTrackingEnable(hNextFrameEvent:Cardinal; dwFlags:Cardinal):HRESULT;
begin
{*
 0076DE10    push        ebx
 0076DE11    push        esi
 0076DE12    push        edi
 0076DE13    mov         edi,edx
 0076DE15    mov         esi,eax
 0076DE17    push        ecx
 0076DE18    push        edi
 0076DE19    xor         edx,edx
 0076DE1B    mov         eax,esi
 0076DE1D    mov         ecx,esi
 0076DE1F    mov         ebx,dword ptr [eax]
 0076DE21    call        dword ptr [ebx+24];@AbstractError
 0076DE24    pop         edi
 0076DE25    pop         esi
 0076DE26    pop         ebx
 0076DE27    ret
*}
end;

//0076DE28
procedure INuiInstance.NuiStatus;
begin
{*
 0076DE28    push        ebx
 0076DE29    mov         ecx,eax
 0076DE2B    xor         edx,edx
 0076DE2D    mov         ebx,dword ptr [eax]
 0076DE2F    call        dword ptr [ebx+40];@AbstractError
 0076DE32    pop         ebx
 0076DE33    ret
*}
end;

//0076DE34
procedure INuiInstance.NuiTransformSmooth(var SkeletonFrame:NUI_SKELETON_FRAME; pSmoothingParams:PNUI_TRANSFORM_SMOOTH_PARAMETERS);
begin
{*
 0076DE34    push        ebx
 0076DE35    push        esi
 0076DE36    mov         esi,eax
 0076DE38    push        ecx
 0076DE39    push        edx
 0076DE3A    mov         eax,esi
 0076DE3C    xor         edx,edx
 0076DE3E    mov         ecx,esi
 0076DE40    mov         ebx,dword ptr [eax]
 0076DE42    call        dword ptr [ebx+30];@AbstractError
 0076DE45    pop         esi
 0076DE46    pop         ebx
 0076DE47    ret
*}
end;

//0076E404
{*function sub_0076E404(?:Integer):?;
begin
 0076E404    test        eax,eax
>0076E406    jl          0076E40D
 0076E408    cmp         eax,4
>0076E40B    jle         0076E410
 0076E40D    xor         eax,eax
 0076E40F    ret
 0076E410    test        eax,eax
>0076E412    jne         0076E41B
 0076E414    mov         eax,[00822D7C];gvar_00822D7C:TKinectObject
>0076E419    jmp         0076E422
 0076E41B    mov         eax,dword ptr [eax*4+822D78];gvar_00822D78
 0076E422    ret
end;*}

//0076E984
{*procedure sub_0076E984(?:?);
begin
 0076E984    mov         byte ptr ds:[822D78],1;gvar_00822D78
 0076E98B    mov         edx,dword ptr ds:[822DBC];gvar_00822DBC:TModuleKinect
 0076E991    mov         byte ptr [edx+24],1
 0076E995    test        eax,eax
>0076E997    jne         0076E9A1
 0076E999    mov         byte ptr ds:[822D8C],1;gvar_00822D8C
 0076E9A0    ret
 0076E9A1    cmp         eax,4
>0076E9A4    jg          0076E9AD
 0076E9A6    mov         byte ptr [eax+822D8B],1
 0076E9AD    ret
end;*}

//0076E9B0
{*function sub_0076E9B0(?:UnicodeString):?;
begin
 0076E9B0    push        ebp
 0076E9B1    mov         ebp,esp
 0076E9B3    push        ecx
 0076E9B4    push        ebx
 0076E9B5    mov         dword ptr [ebp-4],eax
 0076E9B8    mov         eax,dword ptr [ebp-4]
 0076E9BB    call        @UStrAddRef
 0076E9C0    xor         eax,eax
 0076E9C2    push        ebp
 0076E9C3    push        76E9F6
 0076E9C8    push        dword ptr fs:[eax]
 0076E9CB    mov         dword ptr fs:[eax],esp
 0076E9CE    mov         eax,[00822DBC];gvar_00822DBC:TModuleKinect
 0076E9D3    mov         eax,dword ptr [eax+1C]
 0076E9D6    mov         edx,dword ptr [ebp-4]
 0076E9D9    call        THashTable.Get
 0076E9DE    mov         ebx,eax
 0076E9E0    xor         eax,eax
 0076E9E2    pop         edx
 0076E9E3    pop         ecx
 0076E9E4    pop         ecx
 0076E9E5    mov         dword ptr fs:[eax],edx
 0076E9E8    push        76E9FD
 0076E9ED    lea         eax,[ebp-4]
 0076E9F0    call        @UStrClr
 0076E9F5    ret
>0076E9F6    jmp         @HandleFinally
>0076E9FB    jmp         0076E9ED
 0076E9FD    mov         eax,ebx
 0076E9FF    pop         ebx
 0076EA00    pop         ecx
 0076EA01    pop         ebp
 0076EA02    ret
end;*}

//0076EA04
{*function sub_0076EA04(?:string):?;
begin
 0076EA04    push        ebp
 0076EA05    mov         ebp,esp
 0076EA07    add         esp,0FFFFFFF8
 0076EA0A    push        ebx
 0076EA0B    push        esi
 0076EA0C    push        edi
 0076EA0D    xor         edx,edx
 0076EA0F    mov         dword ptr [ebp-8],edx
 0076EA12    mov         dword ptr [ebp-4],eax
 0076EA15    mov         eax,dword ptr [ebp-4]
 0076EA18    call        @UStrAddRef
 0076EA1D    xor         eax,eax
 0076EA1F    push        ebp
 0076EA20    push        76EAD2
 0076EA25    push        dword ptr fs:[eax]
 0076EA28    mov         dword ptr fs:[eax],esp
 0076EA2B    xor         esi,esi
 0076EA2D    lea         eax,[ebp-8]
 0076EA30    mov         edx,dword ptr [ebp-4]
 0076EA33    call        @UStrLAsg
 0076EA38    lea         eax,[ebp-8]
 0076EA3B    mov         edx,76EAF0;'Kinect'
 0076EA40    call        004F9BD0
 0076EA45    test        al,al
>0076EA47    je          0076EAB7
 0076EA49    lea         eax,[ebp-8]
 0076EA4C    call        004F9D00
 0076EA51    mov         ebx,eax
 0076EA53    lea         eax,[ebp-8]
 0076EA56    mov         edx,76EB0C;'.'
 0076EA5B    call        004F9BD0
 0076EA60    test        al,al
>0076EA62    je          0076EAB7
 0076EA64    mov         eax,dword ptr [ebp-8]
 0076EA67    call        0076E9B0
 0076EA6C    mov         edi,eax
 0076EA6E    test        edi,edi
>0076EA70    jl          0076EAB7
 0076EA72    mov         dl,1
 0076EA74    mov         eax,[0076DE48];TKinectValue
 0076EA79    call        TObject.Create;TKinectValue.Create
 0076EA7E    mov         esi,eax
 0076EA80    mov         dword ptr [esi+20],edi;TKinectValue......................................Item:Integer
 0076EA83    test        ebx,ebx
>0076EA85    jg          0076EA8C
 0076EA87    mov         ebx,1
 0076EA8C    mov         dword ptr [esi+18],ebx;TKinectValue........................................................
 0076EA8F    mov         byte ptr ds:[822D78],1;gvar_00822D78
 0076EA96    cmp         ebx,4
>0076EA99    jg          0076EAAE
 0076EA9B    mov         byte ptr [ebx+822D8B],1
 0076EAA2    cmp         edi,9
>0076EAA5    jne         0076EAAE
 0076EAA7    mov         byte ptr [ebx+822D8F],1
 0076EAAE    mov         eax,[00822DBC];gvar_00822DBC:TModuleKinect
 0076EAB3    mov         byte ptr [eax+24],1
 0076EAB7    xor         eax,eax
 0076EAB9    pop         edx
 0076EABA    pop         ecx
 0076EABB    pop         ecx
 0076EABC    mov         dword ptr fs:[eax],edx
 0076EABF    push        76EAD9
 0076EAC4    lea         eax,[ebp-8]
 0076EAC7    mov         edx,2
 0076EACC    call        @UStrArrayClr
 0076EAD1    ret
>0076EAD2    jmp         @HandleFinally
>0076EAD7    jmp         0076EAC4
 0076EAD9    mov         eax,esi
 0076EADB    pop         edi
 0076EADC    pop         esi
 0076EADD    pop         ebx
 0076EADE    pop         ecx
 0076EADF    pop         ecx
 0076EAE0    pop         ebp
 0076EAE1    ret
end;*}

//0076EB10
function TKinectValue.CanSet:Boolean;
begin
{*
 0076EB10    mov         eax,dword ptr [eax+20];TKinectValue.......................................Item:Integer
 0076EB13    sub         eax,38
>0076EB16    jne         0076EB1B
 0076EB18    mov         al,1
 0076EB1A    ret
 0076EB1B    xor         eax,eax
 0076EB1D    ret
*}
end;

//0076EB20
procedure TKinectValue.CreateClone;
begin
{*
 0076EB20    mov         dl,1
 0076EB22    mov         eax,[0076DE48];TKinectValue
 0076EB27    call        TObject.Create;TKinectValue.Create
 0076EB2C    ret
*}
end;

//0076EB30
procedure TKinectValue.FillClone(c:TExpression);
begin
{*
 0076EB30    push        ebx
 0076EB31    push        esi
 0076EB32    mov         esi,edx
 0076EB34    mov         ebx,eax
 0076EB36    mov         edx,esi
 0076EB38    mov         eax,ebx
 0076EB3A    call        TExpression.FillClone
 0076EB3F    mov         eax,esi
 0076EB41    mov         edx,dword ptr [ebx+20];TKinectValue........................................Item:Integer
 0076EB44    mov         dword ptr [eax+20],edx
 0076EB47    mov         edx,dword ptr [ebx+18];TKinectValue........................................................
 0076EB4A    mov         dword ptr [eax+18],edx
 0076EB4D    pop         esi
 0076EB4E    pop         ebx
 0076EB4F    ret
*}
end;

//0076EB50
function TKinectValue.GetDataType:TDataType;
begin
{*
 0076EB50    mov         eax,dword ptr [eax+20];TKinectValue.........................................Item:Integer
 0076EB53    cmp         eax,18
>0076EB56    jge         0076EB88
 0076EB58    cmp         eax,8
>0076EB5B    ja          0076EBCA
 0076EB5D    jmp         dword ptr [eax*4+76EB64]
 0076EB5D    dd          0076EBB5
 0076EB5D    dd          0076EBB8
 0076EB5D    dd          0076EBC1
 0076EB5D    dd          0076EBB8
 0076EB5D    dd          0076EBB8
 0076EB5D    dd          0076EBCA
 0076EB5D    dd          0076EBCA
 0076EB5D    dd          0076EBCA
 0076EB5D    dd          0076EBC1
 0076EB88    cmp         eax,32
>0076EB8B    jge         0076EBA1
 0076EB8D    add         eax,0FFFFFFE8
 0076EB90    sub         eax,3
>0076EB93    jb          0076EBBB
 0076EB95    sub         eax,0E
>0076EB98    je          0076EBB8
 0076EB9A    sub         eax,5
>0076EB9D    je          0076EBC7
>0076EB9F    jmp         0076EBCA
 0076EBA1    add         eax,0FFFFFFCE
 0076EBA4    sub         eax,2
>0076EBA7    jb          0076EBC7
 0076EBA9    sub         eax,3C
>0076EBAC    je          0076EBBE
 0076EBAE    sub         eax,10
>0076EBB1    je          0076EBC4
>0076EBB3    jmp         0076EBCA
 0076EBB5    mov         al,3
 0076EBB7    ret
 0076EBB8    mov         al,2
 0076EBBA    ret
 0076EBBB    mov         al,2
 0076EBBD    ret
 0076EBBE    mov         al,6
 0076EBC0    ret
 0076EBC1    mov         al,4
 0076EBC3    ret
 0076EBC4    mov         al,7
 0076EBC6    ret
 0076EBC7    mov         al,5
 0076EBC9    ret
 0076EBCA    xor         eax,eax
 0076EBCC    ret
*}
end;

//0076EBD0
function TKinectValue.GetPerUnits1:TUnits;
begin
{*
 0076EBD0    mov         eax,dword ptr [eax+20];TKinectValue..........................................Item:Intege...
 0076EBD3    sub         eax,1
>0076EBD6    jb          0076EBEA
 0076EBD8    add         eax,0FFFFFFCF
 0076EBDB    sub         eax,2
>0076EBDE    jb          0076EBED
 0076EBE0    add         eax,0FFFFFFFB
 0076EBE3    sub         eax,6
>0076EBE6    jb          0076EBED
>0076EBE8    jmp         0076EBF0
 0076EBEA    xor         eax,eax
 0076EBEC    ret
 0076EBED    mov         al,11
 0076EBEF    ret
 0076EBF0    xor         eax,eax
 0076EBF2    ret
*}
end;

//0076EBF4
function TKinectValue.GetPerUnits2:TUnits;
begin
{*
 0076EBF4    mov         eax,dword ptr [eax+20];TKinectValue...........................................Item:Integ...
 0076EBF7    add         eax,0FFFFFFCE
 0076EBFA    sub         eax,2
>0076EBFD    jb          0076EC07
 0076EBFF    add         eax,0FFFFFFFB
 0076EC02    sub         eax,6
>0076EC05    jae         0076EC0A
 0076EC07    mov         al,11
 0076EC09    ret
 0076EC0A    xor         eax,eax
 0076EC0C    ret
*}
end;

//0076EC10
procedure TKinectValue.GetRotMat(m:TRotMat);
begin
{*
 0076EC10    push        ebx
 0076EC11    push        esi
 0076EC12    push        edi
 0076EC13    push        ecx
 0076EC14    mov         esi,edx
 0076EC16    mov         ebx,eax
 0076EC18    mov         eax,dword ptr [ebx+18];TKinectValue........................................................
 0076EC1B    call        0076E404
 0076EC20    test        eax,eax
>0076EC22    jne         0076EC57
 0076EC24    cmp         dword ptr [ebx+20],29;TKinectValue............................................Item:Integ...
>0076EC28    je          0076EC57
 0076EC2A    xor         ecx,ecx
 0076EC2C    mov         edi,esi
 0076EC2E    xor         eax,eax
 0076EC30    mov         edx,edi
 0076EC32    cmp         eax,ecx
 0076EC34    sete        bl
 0076EC37    movsx       ebx,bl
 0076EC3A    mov         dword ptr [esp],ebx
 0076EC3D    fild        dword ptr [esp]
 0076EC40    fstp        qword ptr [edx]
 0076EC42    wait
 0076EC43    inc         eax
 0076EC44    add         edx,8
 0076EC47    cmp         eax,3
>0076EC4A    jne         0076EC32
 0076EC4C    inc         ecx
 0076EC4D    add         edi,18
 0076EC50    cmp         ecx,3
>0076EC53    jne         0076EC2E
>0076EC55    jmp         0076EC95
 0076EC57    mov         eax,dword ptr [ebx+20];TKinectValue.............................................Item:Int...
 0076EC5A    sub         eax,70
>0076EC5D    jne         0076EC8C
 0076EC5F    xor         ecx,ecx
 0076EC61    mov         edi,esi
 0076EC63    xor         eax,eax
 0076EC65    mov         edx,edi
 0076EC67    cmp         eax,ecx
 0076EC69    sete        bl
 0076EC6C    movsx       ebx,bl
 0076EC6F    mov         dword ptr [esp],ebx
 0076EC72    fild        dword ptr [esp]
 0076EC75    fstp        qword ptr [edx]
 0076EC77    wait
 0076EC78    inc         eax
 0076EC79    add         edx,8
 0076EC7C    cmp         eax,3
>0076EC7F    jne         0076EC67
 0076EC81    inc         ecx
 0076EC82    add         edi,18
 0076EC85    cmp         ecx,3
>0076EC88    jne         0076EC63
>0076EC8A    jmp         0076EC95
 0076EC8C    mov         edx,esi
 0076EC8E    mov         eax,ebx
 0076EC90    call        TExpression.GetRotMat
 0076EC95    pop         edx
 0076EC96    pop         edi
 0076EC97    pop         esi
 0076EC98    pop         ebx
 0076EC99    ret
*}
end;

//0076EC9C
{*procedure TKinectValue.GetString(?:?);
begin
 0076EC9C    push        ebx
 0076EC9D    push        esi
 0076EC9E    push        edi
 0076EC9F    mov         edi,edx
 0076ECA1    mov         ebx,eax
 0076ECA3    mov         eax,dword ptr [ebx+18];TKinectValue........................................................
 0076ECA6    call        0076E404
 0076ECAB    mov         esi,eax
 0076ECAD    test        esi,esi
>0076ECAF    jne         0076ECC5
 0076ECB1    mov         eax,ebx
 0076ECB3    mov         edx,dword ptr [eax]
 0076ECB5    call        dword ptr [edx+44];TKinectValue.GetDataType
 0076ECB8    cmp         al,4
>0076ECBA    jne         0076ECC5
 0076ECBC    mov         eax,edi
 0076ECBE    call        @UStrClr
>0076ECC3    jmp         0076ECE2
 0076ECC5    mov         eax,dword ptr [ebx+20];TKinectValue..............................................Item:In...
 0076ECC8    sub         eax,8
>0076ECCB    jne         0076ECD9
 0076ECCD    mov         eax,edi
 0076ECCF    mov         edx,dword ptr [esi+8]
 0076ECD2    call        @UStrAsg
>0076ECD7    jmp         0076ECE2
 0076ECD9    mov         edx,edi
 0076ECDB    mov         eax,ebx
 0076ECDD    call        TExpression.GetString
 0076ECE2    pop         edi
 0076ECE3    pop         esi
 0076ECE4    pop         ebx
 0076ECE5    ret
end;*}

//0076ECE8
function TKinectValue.GetUnits:TUnits;
begin
{*
 0076ECE8    mov         eax,dword ptr [eax+20];TKinectValue...............................................Item:I...
 0076ECEB    cmp         eax,39
>0076ECEE    jge         0076ED05
 0076ECF0    sub         eax,9
>0076ECF3    je          0076ED1A
 0076ECF5    add         eax,0FFFFFFD7
 0076ECF8    sub         eax,2
>0076ECFB    jb          0076ED1A
 0076ECFD    dec         eax
 0076ECFE    sub         eax,4
>0076ED01    jb          0076ED17
>0076ED03    jmp         0076ED20
 0076ED05    add         eax,0FFFFFFC7
 0076ED08    sub         eax,6
>0076ED0B    jb          0076ED1A
 0076ED0D    sub         eax,2B
>0076ED10    je          0076ED1D
 0076ED12    sub         eax,0B
>0076ED15    jne         0076ED20
 0076ED17    mov         al,18
 0076ED19    ret
 0076ED1A    mov         al,5
 0076ED1C    ret
 0076ED1D    mov         al,18
 0076ED1F    ret
 0076ED20    xor         eax,eax
 0076ED22    ret
*}
end;

//0076ED24
procedure TKinectValue.GetValue;
begin
{*
 0076ED24    push        ebx
 0076ED25    push        esi
 0076ED26    add         esp,0FFFFFFF0
 0076ED29    mov         ebx,eax
 0076ED2B    mov         eax,dword ptr [ebx+18];TKinectValue........................................................
 0076ED2E    call        0076E404
 0076ED33    mov         esi,eax
 0076ED35    test        esi,esi
>0076ED37    jne         0076ED4D
 0076ED39    cmp         dword ptr [ebx+20],29;TKinectValue................................................Item:I...
>0076ED3D    je          0076ED4D
 0076ED3F    xor         eax,eax
 0076ED41    mov         dword ptr [esp],eax
 0076ED44    mov         dword ptr [esp+4],eax
>0076ED48    jmp         0076EE24
 0076ED4D    mov         eax,dword ptr [ebx+20];TKinectValue.................................................Item...
 0076ED50    cmp         eax,9
>0076ED53    jg          0076ED70
>0076ED55    je          0076EDF6
 0076ED5B    sub         eax,1
>0076ED5E    jb          0076ED84
>0076ED60    je          0076EE10
 0076ED66    sub         eax,5
>0076ED69    je          0076EDA9
>0076ED6B    jmp         0076EE1B
 0076ED70    sub         eax,29
>0076ED73    je          0076ED9D
 0076ED75    sub         eax,0D
>0076ED78    je          0076EDA9
 0076ED7A    sub         eax,2
>0076ED7D    je          0076EDA9
>0076ED7F    jmp         0076EE1B
 0076ED84    test        esi,esi
 0076ED86    setne       al
 0076ED89    movsx       eax,al
 0076ED8C    mov         dword ptr [esp+0C],eax
 0076ED90    fild        dword ptr [esp+0C]
 0076ED94    fstp        qword ptr [esp]
 0076ED97    wait
>0076ED98    jmp         0076EE24
 0076ED9D    fild        dword ptr ds:[822D94];gvar_00822D94:Single
 0076EDA3    fstp        qword ptr [esp]
 0076EDA6    wait
>0076EDA7    jmp         0076EE24
 0076EDA9    lea         edx,[esp+8]
 0076EDAD    mov         eax,dword ptr [esi+4]
 0076EDB0    call        INuiInstance.NuiCameraElevationGetAngle
 0076EDB5    cmp         dword ptr [esp+8],0FFFFFFC0
>0076EDBA    je          0076EDC5
 0076EDBC    mov         eax,dword ptr [esp+8]
 0076EDC0    mov         dword ptr [esi+0C],eax
>0076EDC3    jmp         0076EDEC
 0076EDC5    mov         eax,dword ptr [esi+0C]
 0076EDC8    cmp         eax,1E
>0076EDCB    jle         0076EDD7
 0076EDCD    mov         dword ptr [esp+8],40
>0076EDD5    jmp         0076EDEC
 0076EDD7    cmp         eax,0FFFFFFE2
>0076EDDA    jge         0076EDE6
 0076EDDC    mov         dword ptr [esp+8],0FFFFFFC0
>0076EDE4    jmp         0076EDEC
 0076EDE6    xor         eax,eax
 0076EDE8    mov         dword ptr [esp+8],eax
 0076EDEC    fild        dword ptr [esp+8]
 0076EDF0    fstp        qword ptr [esp]
 0076EDF3    wait
>0076EDF4    jmp         0076EE24
 0076EDF6    mov         eax,dword ptr [ebx+18];TKinectValue........................................................
 0076EDF9    mov         edx,dword ptr [eax*8+822D90];gvar_00822D90
 0076EE00    mov         dword ptr [esp],edx
 0076EE03    mov         edx,dword ptr [eax*8+822D94];gvar_00822D94:Single
 0076EE0A    mov         dword ptr [esp+4],edx
>0076EE0E    jmp         0076EE24
 0076EE10    xor         eax,eax
 0076EE12    mov         dword ptr [esp],eax
 0076EE15    mov         dword ptr [esp+4],eax
>0076EE19    jmp         0076EE24
 0076EE1B    xor         eax,eax
 0076EE1D    mov         dword ptr [esp],eax
 0076EE20    mov         dword ptr [esp+4],eax
 0076EE24    fld         qword ptr [esp]
 0076EE27    add         esp,10
 0076EE2A    pop         esi
 0076EE2B    pop         ebx
 0076EE2C    ret
*}
end;

//0076EE30
procedure TKinectValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 0076EE30    push        ebp
 0076EE31    mov         ebp,esp
 0076EE33    push        ebx
 0076EE34    push        esi
 0076EE35    push        edi
 0076EE36    mov         edi,ecx
 0076EE38    mov         esi,edx
 0076EE3A    mov         ebx,eax
 0076EE3C    mov         eax,dword ptr [ebx+18];TKinectValue........................................................
 0076EE3F    call        0076E404
 0076EE44    test        eax,eax
>0076EE46    jne         0076EE68
 0076EE48    cmp         dword ptr [ebx+20],29;TKinectValue..................................................Item...
>0076EE4C    je          0076EE68
 0076EE4E    xor         eax,eax
 0076EE50    mov         dword ptr [esi],eax
 0076EE52    mov         dword ptr [esi+4],eax
 0076EE55    xor         eax,eax
 0076EE57    mov         dword ptr [edi],eax
 0076EE59    mov         dword ptr [edi+4],eax
 0076EE5C    mov         eax,dword ptr [ebp+8]
 0076EE5F    xor         edx,edx
 0076EE61    mov         dword ptr [eax],edx
 0076EE63    mov         dword ptr [eax+4],edx
>0076EE66    jmp         0076EEA4
 0076EE68    mov         eax,dword ptr [ebx+20];TKinectValue...................................................It...
 0076EE6B    add         eax,0FFFFFFD2
 0076EE6E    sub         eax,2
>0076EE71    jb          0076EE7B
 0076EE73    add         eax,0FFFFFFFE
 0076EE76    sub         eax,2
>0076EE79    jae         0076EE95
 0076EE7B    xor         eax,eax
 0076EE7D    mov         dword ptr [esi],eax
 0076EE7F    mov         dword ptr [esi+4],eax
 0076EE82    xor         eax,eax
 0076EE84    mov         dword ptr [edi],eax
 0076EE86    mov         dword ptr [edi+4],eax
 0076EE89    mov         eax,dword ptr [ebp+8]
 0076EE8C    xor         edx,edx
 0076EE8E    mov         dword ptr [eax],edx
 0076EE90    mov         dword ptr [eax+4],edx
>0076EE93    jmp         0076EEA4
 0076EE95    mov         eax,dword ptr [ebp+8]
 0076EE98    push        eax
 0076EE99    mov         ecx,edi
 0076EE9B    mov         edx,esi
 0076EE9D    mov         eax,ebx
 0076EE9F    call        TExpression.GetVector
 0076EEA4    pop         edi
 0076EEA5    pop         esi
 0076EEA6    pop         ebx
 0076EEA7    pop         ebp
 0076EEA8    ret         4
*}
end;

//0076EEAC
function TKinectValue.Module:TObject;
begin
{*
 0076EEAC    mov         eax,[00822DBC];gvar_00822DBC:TModuleKinect
 0076EEB1    ret
*}
end;

//0076EEB4
function TKinectValue.SetValue(NewValue:Double):Boolean;
begin
{*
 0076EEB4    push        ebp
 0076EEB5    mov         ebp,esp
 0076EEB7    push        ebx
 0076EEB8    push        esi
 0076EEB9    push        edi
 0076EEBA    mov         edi,eax
 0076EEBC    mov         eax,dword ptr [edi+18];TKinectValue........................................................
 0076EEBF    call        0076E404
 0076EEC4    mov         esi,eax
 0076EEC6    test        esi,esi
>0076EEC8    je          0076EED0
 0076EECA    cmp         dword ptr [esi+4],0
>0076EECE    jne         0076EEDA
 0076EED0    cmp         dword ptr [edi+20],29;TKinectValue....................................................It...
>0076EED4    je          0076EEDA
 0076EED6    xor         ebx,ebx
>0076EED8    jmp         0076EF1F
 0076EEDA    mov         bl,1
 0076EEDC    mov         eax,dword ptr [edi+20];TKinectValue........................................................
 0076EEDF    cmp         eax,36
>0076EEE2    jg          0076EEF8
>0076EEE4    je          0076EF09
 0076EEE6    dec         eax
>0076EEE7    je          0076EF1F
 0076EEE9    sub         eax,2
>0076EEEC    je          0076EF1F
 0076EEEE    dec         eax
>0076EEEF    je          0076EF1F
 0076EEF1    sub         eax,2
>0076EEF4    je          0076EF09
>0076EEF6    jmp         0076EF1D
 0076EEF8    sub         eax,38
>0076EEFB    je          0076EF09
 0076EEFD    sub         eax,32
>0076EF00    je          0076EF1F
 0076EF02    sub         eax,0B
>0076EF05    je          0076EF1F
>0076EF07    jmp         0076EF1D
 0076EF09    fld         qword ptr [ebp+8]
 0076EF0C    call        @ROUND
 0076EF11    mov         edx,eax
 0076EF13    mov         eax,dword ptr [esi+4]
 0076EF16    call        INuiInstance.NuiCameraElevationSetAngle
>0076EF1B    jmp         0076EF1F
 0076EF1D    xor         ebx,ebx
 0076EF1F    mov         eax,ebx
 0076EF21    pop         edi
 0076EF22    pop         esi
 0076EF23    pop         ebx
 0076EF24    pop         ebp
 0076EF25    ret         8
*}
end;

//0076EF28
{*procedure TKinectValue.ToString(?:?);
begin
 0076EF28    push        ebp
 0076EF29    mov         ebp,esp
 0076EF2B    push        0
 0076EF2D    push        0
 0076EF2F    push        0
 0076EF31    push        ebx
 0076EF32    push        esi
 0076EF33    push        edi
 0076EF34    mov         esi,edx
 0076EF36    mov         ebx,eax
 0076EF38    xor         eax,eax
 0076EF3A    push        ebp
 0076EF3B    push        76EFC5
 0076EF40    push        dword ptr fs:[eax]
 0076EF43    mov         dword ptr fs:[eax],esp
 0076EF46    mov         edi,dword ptr [ebx+18];TKinectValue........................................................
 0076EF49    test        edi,edi
>0076EF4B    jle         0076EF88
 0076EF4D    push        76EFE0;'Kinect'
 0076EF52    lea         edx,[ebp-4]
 0076EF55    mov         eax,edi
 0076EF57    call        IntToStr
 0076EF5C    push        dword ptr [ebp-4]
 0076EF5F    push        76EFFC;'.'
 0076EF64    lea         ecx,[ebp-8]
 0076EF67    mov         eax,[00822DBC];gvar_00822DBC:TModuleKinect
 0076EF6C    mov         eax,dword ptr [eax+1C]
 0076EF6F    mov         edx,dword ptr [ebx+20];TKinectValue........................................................
 0076EF72    call        THashTable.Get
 0076EF77    push        dword ptr [ebp-8]
 0076EF7A    mov         eax,esi
 0076EF7C    mov         edx,4
 0076EF81    call        @UStrCatN
>0076EF86    jmp         0076EFAA
 0076EF88    lea         ecx,[ebp-0C]
 0076EF8B    mov         eax,[00822DBC];gvar_00822DBC:TModuleKinect
 0076EF90    mov         eax,dword ptr [eax+1C]
 0076EF93    mov         edx,dword ptr [ebx+20];TKinectValue........................................................
 0076EF96    call        THashTable.Get
 0076EF9B    mov         ecx,dword ptr [ebp-0C]
 0076EF9E    mov         eax,esi
 0076EFA0    mov         edx,76F00C;'Kinect.'
 0076EFA5    call        @UStrCat3
 0076EFAA    xor         eax,eax
 0076EFAC    pop         edx
 0076EFAD    pop         ecx
 0076EFAE    pop         ecx
 0076EFAF    mov         dword ptr fs:[eax],edx
 0076EFB2    push        76EFCC
 0076EFB7    lea         eax,[ebp-0C]
 0076EFBA    mov         edx,3
 0076EFBF    call        @UStrArrayClr
 0076EFC4    ret
>0076EFC5    jmp         @HandleFinally
>0076EFCA    jmp         0076EFB7
 0076EFCC    pop         edi
 0076EFCD    pop         esi
 0076EFCE    pop         ebx
 0076EFCF    mov         esp,ebp
 0076EFD1    pop         ebp
 0076EFD2    ret
end;*}

//0076F01C
procedure sub_0076F01C;
begin
{*
 0076F01C    mov         byte ptr ds:[822D78],0;gvar_00822D78
 0076F023    mov         ecx,4
 0076F028    mov         eax,822D8C;gvar_00822D8C
 0076F02D    mov         edx,822D90;gvar_00822D90
 0076F032    mov         byte ptr [eax],0
 0076F035    mov         byte ptr [edx],0
 0076F038    inc         edx
 0076F039    inc         eax
 0076F03A    dec         ecx
>0076F03B    jne         0076F032
 0076F03D    ret
*}
end;

//0076F040
procedure sub_0076F040;
begin
{*
 0076F040    ret
*}
end;

//0076F044
procedure sub_0076F044;
begin
{*
 0076F044    push        ebp
 0076F045    mov         ebp,esp
 0076F047    add         esp,0FFFFFFF0
 0076F04A    push        ebx
 0076F04B    push        esi
 0076F04C    push        edi
 0076F04D    xor         eax,eax
 0076F04F    mov         dword ptr [ebp-10],eax
 0076F052    xor         eax,eax
 0076F054    push        ebp
 0076F055    push        76F166
 0076F05A    push        dword ptr fs:[eax]
 0076F05D    mov         dword ptr fs:[eax],esp
 0076F060    cmp         byte ptr ds:[822D78],0;gvar_00822D78
>0076F067    je          0076F13C
 0076F06D    push        822D94;gvar_00822D94:Single
 0076F072    mov         eax,[0078CD60];^gvar_0078C9E8:Pointer
 0076F077    mov         eax,dword ptr [eax]
 0076F079    call        eax
 0076F07B    pop         ecx
 0076F07C    mov         dword ptr [ebp-4],eax
 0076F07F    test        byte ptr [ebp-1],80
>0076F083    jne         0076F11F
 0076F089    mov         byte ptr ds:[822D79],1;gvar_00822D79
 0076F090    mov         ebx,1
 0076F095    mov         esi,822D8C;gvar_00822D8C
 0076F09A    mov         edi,822D7C;gvar_00822D7C:TKinectObject
 0076F09F    mov         dword ptr [ebp-0C],822D90;gvar_00822D90
 0076F0A6    cmp         byte ptr [esi],0
>0076F0A9    je          0076F110
 0076F0AB    lea         eax,[ebp-8]
 0076F0AE    push        eax
 0076F0AF    mov         eax,ebx
 0076F0B1    dec         eax
 0076F0B2    push        eax
 0076F0B3    mov         eax,[0078D24C];^gvar_0078C9F8:Pointer
 0076F0B8    mov         eax,dword ptr [eax]
 0076F0BA    call        eax
 0076F0BC    add         esp,8
 0076F0BF    mov         dword ptr [ebp-4],eax
 0076F0C2    test        byte ptr [ebp-1],80
>0076F0C6    jne         0076F105
 0076F0C8    mov         ecx,dword ptr [ebp-8]
 0076F0CB    mov         dl,1
 0076F0CD    mov         eax,[0076E2A8];TKinectObject
 0076F0D2    call        TKinectObject.Create;TKinectObject.Create
 0076F0D7    mov         dword ptr [edi],eax
 0076F0D9    mov         eax,dword ptr [edi]
 0076F0DB    mov         eax,dword ptr [eax+4]
 0076F0DE    mov         edx,9
 0076F0E3    call        INuiInstance.NuiInitialize
 0076F0E8    mov         eax,dword ptr [ebp-0C]
 0076F0EB    cmp         byte ptr [eax],0
>0076F0EE    je          0076F110
 0076F0F0    cmp         ebx,1
>0076F0F3    je          0076F110
 0076F0F5    mov         eax,dword ptr [edi]
 0076F0F7    mov         eax,dword ptr [eax+4]
 0076F0FA    xor         ecx,ecx
 0076F0FC    xor         edx,edx
 0076F0FE    call        INuiInstance.NuiSkeletonTrackingEnable
>0076F103    jmp         0076F110
 0076F105    lea         edx,[ebp-10]
 0076F108    mov         eax,dword ptr [ebp-4]
 0076F10B    call        0076D414
 0076F110    inc         ebx
 0076F111    inc         dword ptr [ebp-0C]
 0076F114    add         edi,4
 0076F117    inc         esi
 0076F118    cmp         ebx,5
>0076F11B    jne         0076F0A6
>0076F11D    jmp         0076F150
 0076F11F    mov         byte ptr ds:[822D79],0;gvar_00822D79
 0076F126    mov         ebx,4
 0076F12B    mov         eax,822D7C;gvar_00822D7C:TKinectObject
 0076F130    xor         edx,edx
 0076F132    mov         dword ptr [eax],edx
 0076F134    add         eax,4
 0076F137    dec         ebx
>0076F138    jne         0076F130
>0076F13A    jmp         0076F150
 0076F13C    mov         ebx,4
 0076F141    mov         eax,822D7C;gvar_00822D7C:TKinectObject
 0076F146    xor         edx,edx
 0076F148    mov         dword ptr [eax],edx
 0076F14A    add         eax,4
 0076F14D    dec         ebx
>0076F14E    jne         0076F146
 0076F150    xor         eax,eax
 0076F152    pop         edx
 0076F153    pop         ecx
 0076F154    pop         ecx
 0076F155    mov         dword ptr fs:[eax],edx
 0076F158    push        76F16D
 0076F15D    lea         eax,[ebp-10]
 0076F160    call        @UStrClr
 0076F165    ret
>0076F166    jmp         @HandleFinally
>0076F16B    jmp         0076F15D
 0076F16D    pop         edi
 0076F16E    pop         esi
 0076F16F    pop         ebx
 0076F170    mov         esp,ebp
 0076F172    pop         ebp
 0076F173    ret
*}
end;

//0076F174
procedure sub_0076F174;
begin
{*
 0076F174    push        ebx
 0076F175    push        esi
 0076F176    movzx       eax,byte ptr ds:[822D78];gvar_00822D78
 0076F17D    and         al,byte ptr ds:[822D79];gvar_00822D79
>0076F183    je          0076F1AB
 0076F185    mov         byte ptr ds:[822D79],0;gvar_00822D79
 0076F18C    mov         esi,4
 0076F191    mov         ebx,822D7C;gvar_00822D7C:TKinectObject
 0076F196    mov         eax,dword ptr [ebx]
 0076F198    test        eax,eax
>0076F19A    je          0076F1A5
 0076F19C    call        TObject.Free
 0076F1A1    xor         eax,eax
 0076F1A3    mov         dword ptr [ebx],eax
 0076F1A5    add         ebx,4
 0076F1A8    dec         esi
>0076F1A9    jne         0076F196
 0076F1AB    pop         esi
 0076F1AC    pop         ebx
 0076F1AD    ret
*}
end;

//0076F1B0
procedure TModuleKinect.AddFields;
begin
{*
 0076F1B0    push        ebx
 0076F1B1    mov         ebx,eax
 0076F1B3    xor         ecx,ecx
 0076F1B5    mov         edx,76F218;'exists'
 0076F1BA    mov         eax,dword ptr [ebx+1C];TModuleKinect.Fields:THashTable
 0076F1BD    call        THashTable.Add
 0076F1C2    mov         ecx,8
 0076F1C7    mov         edx,76F234;'name'
 0076F1CC    mov         eax,dword ptr [ebx+1C];TModuleKinect.Fields:THashTable
 0076F1CF    call        THashTable.Add
 0076F1D4    mov         ecx,29
 0076F1D9    mov         edx,76F24C;'count'
 0076F1DE    mov         eax,dword ptr [ebx+1C];TModuleKinect.Fields:THashTable
 0076F1E1    call        THashTable.Add
 0076F1E6    mov         ecx,38
 0076F1EB    mov         edx,76F264;'SmoothPitch'
 0076F1F0    mov         eax,dword ptr [ebx+1C];TModuleKinect.Fields:THashTable
 0076F1F3    call        THashTable.Add
 0076F1F8    mov         ecx,9
 0076F1FD    mov         edx,76F288;'y'
 0076F202    mov         eax,dword ptr [ebx+1C];TModuleKinect.Fields:THashTable
 0076F205    call        THashTable.Add
 0076F20A    pop         ebx
 0076F20B    ret
*}
end;

//0076F28C
procedure TModuleKinect.ClearRead;
begin
{*
 0076F28C    call        TPieModule.ClearRead
 0076F291    ret
*}
end;

//0076F294
constructor TModuleKinect.Create;
begin
{*
 0076F294    push        ebx
 0076F295    push        esi
 0076F296    test        dl,dl
>0076F298    je          0076F2A2
 0076F29A    add         esp,0FFFFFFF0
 0076F29D    call        @ClassCreate
 0076F2A2    mov         ebx,edx
 0076F2A4    mov         esi,eax
 0076F2A6    push        0
 0076F2A8    push        0
 0076F2AA    push        0
 0076F2AC    push        0
 0076F2AE    mov         ecx,76F2E4;'Kinect'
 0076F2B3    xor         edx,edx
 0076F2B5    mov         eax,esi
 0076F2B7    call        005E48EC
 0076F2BC    mov         eax,esi
 0076F2BE    test        bl,bl
>0076F2C0    je          0076F2D1
 0076F2C2    call        @AfterConstruction
 0076F2C7    pop         dword ptr fs:[0]
 0076F2CE    add         esp,0C
 0076F2D1    mov         eax,esi
 0076F2D3    pop         esi
 0076F2D4    pop         ebx
 0076F2D5    ret
*}
end;

//0076F2F4
function TModuleKinect.CreateValue(Identifier:string):TExpression;
begin
{*
 0076F2F4    push        ebp
 0076F2F5    mov         ebp,esp
 0076F2F7    push        ecx
 0076F2F8    push        ebx
 0076F2F9    mov         dword ptr [ebp-4],edx
 0076F2FC    mov         ebx,eax
 0076F2FE    mov         eax,dword ptr [ebp-4]
 0076F301    call        @UStrAddRef
 0076F306    xor         eax,eax
 0076F308    push        ebp
 0076F309    push        76F338
 0076F30E    push        dword ptr fs:[eax]
 0076F311    mov         dword ptr fs:[eax],esp
 0076F314    mov         byte ptr [ebx+24],1;TModuleKinect.Used:Boolean
 0076F318    mov         eax,dword ptr [ebp-4]
 0076F31B    call        0076EA04
 0076F320    mov         ebx,eax
 0076F322    xor         eax,eax
 0076F324    pop         edx
 0076F325    pop         ecx
 0076F326    pop         ecx
 0076F327    mov         dword ptr fs:[eax],edx
 0076F32A    push        76F33F
 0076F32F    lea         eax,[ebp-4]
 0076F332    call        @UStrClr
 0076F337    ret
>0076F338    jmp         @HandleFinally
>0076F33D    jmp         0076F32F
 0076F33F    mov         eax,ebx
 0076F341    pop         ebx
 0076F342    pop         ecx
 0076F343    pop         ebp
 0076F344    ret
*}
end;

//0076F348
procedure TModuleKinect.Diagnose(L:TStrings);
begin
{*
 0076F348    push        ebp
 0076F349    mov         ebp,esp
 0076F34B    mov         ecx,0D
 0076F350    push        0
 0076F352    push        0
 0076F354    dec         ecx
>0076F355    jne         0076F350
 0076F357    push        ecx
 0076F358    push        ebx
 0076F359    push        esi
 0076F35A    push        edi
 0076F35B    mov         dword ptr [ebp-4],edx
 0076F35E    xor         edx,edx
 0076F360    push        ebp
 0076F361    push        76F7EC
 0076F366    push        dword ptr fs:[edx]
 0076F369    mov         dword ptr fs:[edx],esp
 0076F36C    mov         edx,dword ptr [ebp-4]
 0076F36F    call        TPieModule.Diagnose
 0076F374    xor         edx,edx
 0076F376    push        ebp
 0076F377    push        76F3F0
 0076F37C    push        dword ptr fs:[edx]
 0076F37F    mov         dword ptr fs:[edx],esp
 0076F382    push        76F7FC;'CLNUIDevice.dll'
 0076F387    call        kernel32.LoadLibraryW
 0076F38C    test        eax,eax
>0076F38E    jne         0076F3B9
 0076F390    mov         edx,76F828;'Good news: alternative Kinect driver CL NUI''s CLNUIDevice.dll is not instal...
 0076F395    mov         eax,dword ptr [ebp-4]
 0076F398    mov         ecx,dword ptr [eax]
 0076F39A    call        dword ptr [ecx+38];TStrings.Add
 0076F39D    mov         edx,76F8D4;'But that doesn''t guarantee CL NUI drivers are not installed.'
 0076F3A2    mov         eax,dword ptr [ebp-4]
 0076F3A5    mov         ecx,dword ptr [eax]
 0076F3A7    call        dword ptr [ecx+38];TStrings.Add
 0076F3AA    mov         edx,76F95C;'CL NUI drivers don''t support skeleton tracking, and are not supported by Gl...
 0076F3AF    mov         eax,dword ptr [ebp-4]
 0076F3B2    mov         ecx,dword ptr [eax]
 0076F3B4    call        dword ptr [ecx+38];TStrings.Add
>0076F3B7    jmp         0076F3E6
 0076F3B9    push        eax
 0076F3BA    call        kernel32.FreeLibrary
 0076F3BF    mov         edx,76FA10;'Warning: alternative Kinect driver CL NUI''s CLNUIDevice.dll is installed.'
 0076F3C4    mov         eax,dword ptr [ebp-4]
 0076F3C7    mov         ecx,dword ptr [eax]
 0076F3C9    call        dword ptr [ecx+38];TStrings.Add
 0076F3CC    mov         edx,76F95C;'CL NUI drivers don''t support skeleton tracking, and are not supported by Gl...
 0076F3D1    mov         eax,dword ptr [ebp-4]
 0076F3D4    mov         ecx,dword ptr [eax]
 0076F3D6    call        dword ptr [ecx+38];TStrings.Add
 0076F3D9    mov         edx,76FAB0;'they may interfere with the Microsoft Kinect SDK, so I recommend uninstallin...
 0076F3DE    mov         eax,dword ptr [ebp-4]
 0076F3E1    mov         ecx,dword ptr [eax]
 0076F3E3    call        dword ptr [ecx+38];TStrings.Add
 0076F3E6    xor         eax,eax
 0076F3E8    pop         edx
 0076F3E9    pop         ecx
 0076F3EA    pop         ecx
 0076F3EB    mov         dword ptr fs:[eax],edx
>0076F3EE    jmp         0076F447
>0076F3F0    jmp         @HandleOnException
 0076F3F5    dd          1
 0076F3F9    dd          00418C04;Exception
 0076F3FD    dd          0076F401
 0076F401    mov         ebx,eax
 0076F403    push        76FB64;'LoadLibrary("CLNUIDevice.dll") Exception '
 0076F408    lea         edx,[ebp-20]
 0076F40B    mov         eax,dword ptr [ebx]
 0076F40D    call        TObject.ClassName
 0076F412    push        dword ptr [ebp-20]
 0076F415    push        76FBC4;': '
 0076F41A    push        dword ptr [ebx+4];Exception.FMessage:string
 0076F41D    lea         eax,[ebp-1C]
 0076F420    mov         edx,4
 0076F425    call        @UStrCatN
 0076F42A    mov         edx,dword ptr [ebp-1C]
 0076F42D    mov         eax,dword ptr [ebp-4]
 0076F430    mov         ecx,dword ptr [eax]
 0076F432    call        dword ptr [ecx+38];TStrings.Add
 0076F435    mov         edx,76FBD8;'Don''t worry, we don''t use CL NUI, but you should uninstall it.'
 0076F43A    mov         eax,dword ptr [ebp-4]
 0076F43D    mov         ecx,dword ptr [eax]
 0076F43F    call        dword ptr [ecx+38];TStrings.Add
 0076F442    call        @DoneExcept
 0076F447    xor         edx,edx
 0076F449    mov         eax,dword ptr [ebp-4]
 0076F44C    mov         ecx,dword ptr [eax]
 0076F44E    call        dword ptr [ecx+38];TStrings.Add
 0076F451    xor         eax,eax
 0076F453    push        ebp
 0076F454    push        76F772
 0076F459    push        dword ptr fs:[eax]
 0076F45C    mov         dword ptr fs:[eax],esp
 0076F45F    lea         eax,[ebp-0C]
 0076F462    push        eax
 0076F463    mov         eax,[0078CD60];^gvar_0078C9E8:Pointer
 0076F468    mov         eax,dword ptr [eax]
 0076F46A    call        eax
 0076F46C    pop         ecx
 0076F46D    mov         ebx,eax
 0076F46F    test        ebx,80000000
>0076F475    jne         0076F71F
 0076F47B    mov         edx,76FC64;'Microsoft Kinect SDK (unknown version) is installed.'
 0076F480    mov         eax,dword ptr [ebp-4]
 0076F483    mov         ecx,dword ptr [eax]
 0076F485    call        dword ptr [ecx+38];TStrings.Add
 0076F488    mov         edx,76FCDC;'If it is not version Beta 2, then it might crash.'
 0076F48D    mov         eax,dword ptr [ebp-4]
 0076F490    mov         ecx,dword ptr [eax]
 0076F492    call        dword ptr [ecx+38];TStrings.Add
 0076F495    lea         edx,[ebp-24]
 0076F498    mov         eax,dword ptr [ebp-0C]
 0076F49B    call        IntToStr
 0076F4A0    lea         eax,[ebp-24]
 0076F4A3    mov         edx,76FD4C;' Kinects were detected by the MS Kinect SDK.'
 0076F4A8    call        @UStrCat
 0076F4AD    mov         edx,dword ptr [ebp-24]
 0076F4B0    mov         eax,dword ptr [ebp-4]
 0076F4B3    mov         ecx,dword ptr [eax]
 0076F4B5    call        dword ptr [ecx+38];TStrings.Add
 0076F4B8    cmp         dword ptr [ebp-0C],4
>0076F4BC    jle         0076F4F0
 0076F4BE    push        76FDB4;'GlovePIE only supports the first '
 0076F4C3    lea         edx,[ebp-2C]
 0076F4C6    mov         eax,4
 0076F4CB    call        IntToStr
 0076F4D0    push        dword ptr [ebp-2C]
 0076F4D3    push        76FE04;' though.'
 0076F4D8    lea         eax,[ebp-28]
 0076F4DB    mov         edx,3
 0076F4E0    call        @UStrCatN
 0076F4E5    mov         edx,dword ptr [ebp-28]
 0076F4E8    mov         eax,dword ptr [ebp-4]
 0076F4EB    mov         ecx,dword ptr [eax]
 0076F4ED    call        dword ptr [ecx+38];TStrings.Add
 0076F4F0    cmp         dword ptr [ebp-0C],1
>0076F4F4    jle         0076F503
 0076F4F6    mov         edx,76FE24;'GlovePIE only supports skeleton tracking on Kinect 1 though.'
 0076F4FB    mov         eax,dword ptr [ebp-4]
 0076F4FE    mov         ecx,dword ptr [eax]
 0076F500    call        dword ptr [ecx+38];TStrings.Add
 0076F503    cmp         dword ptr [ebp-0C],0
>0076F507    jg          0076F523
 0076F509    mov         edx,76FEAC;'You will not be able to use the Kinect in GlovePIE'
 0076F50E    mov         eax,dword ptr [ebp-4]
 0076F511    mov         ecx,dword ptr [eax]
 0076F513    call        dword ptr [ecx+38];TStrings.Add
 0076F516    mov         edx,76FF20;'until the MS Kinect SDK detects it is connected.'
 0076F51B    mov         eax,dword ptr [ebp-4]
 0076F51E    mov         ecx,dword ptr [eax]
 0076F520    call        dword ptr [ecx+38];TStrings.Add
 0076F523    mov         eax,dword ptr [ebp-0C]
 0076F526    dec         eax
 0076F527    test        eax,eax
>0076F529    jl          0076F768
 0076F52F    inc         eax
 0076F530    mov         dword ptr [ebp-18],eax
 0076F533    mov         dword ptr [ebp-8],0
 0076F53A    lea         eax,[ebp-14]
 0076F53D    push        eax
 0076F53E    mov         eax,dword ptr [ebp-8]
 0076F541    push        eax
 0076F542    mov         eax,[0078D24C];^gvar_0078C9F8:Pointer
 0076F547    mov         eax,dword ptr [eax]
 0076F549    call        eax
 0076F54B    add         esp,8
 0076F54E    mov         ebx,eax
 0076F550    test        ebx,80000000
>0076F556    jne         0076F6D3
 0076F55C    xor         eax,eax
 0076F55E    push        ebp
 0076F55F    push        76F6CC
 0076F564    push        dword ptr fs:[eax]
 0076F567    mov         dword ptr fs:[eax],esp
 0076F56A    push        76FF90;'Kinect '
 0076F56F    lea         edx,[ebp-34]
 0076F572    mov         esi,dword ptr [ebp-8]
 0076F575    inc         esi
 0076F576    mov         eax,esi
 0076F578    call        IntToStr
 0076F57D    push        dword ptr [ebp-34]
 0076F580    push        76FFAC;': "'
 0076F585    lea         edx,[ebp-3C]
 0076F588    mov         eax,dword ptr [ebp-14]
 0076F58B    call        INuiInstance.NuiInstanceName
 0076F590    mov         edx,dword ptr [ebp-3C]
 0076F593    lea         eax,[ebp-38]
 0076F596    call        @UStrFromWStr
 0076F59B    push        dword ptr [ebp-38]
 0076F59E    push        76FFC0;'"'
 0076F5A3    lea         eax,[ebp-30]
 0076F5A6    mov         edx,5
 0076F5AB    call        @UStrCatN
 0076F5B0    mov         edx,dword ptr [ebp-30]
 0076F5B3    mov         eax,dword ptr [ebp-4]
 0076F5B6    mov         ecx,dword ptr [eax]
 0076F5B8    call        dword ptr [ecx+38];TStrings.Add
 0076F5BB    mov         edx,9
 0076F5C0    mov         eax,dword ptr [ebp-14]
 0076F5C3    call        INuiInstance.NuiInitialize
 0076F5C8    mov         ebx,eax
 0076F5CA    test        ebx,80000000
>0076F5D0    jne         0076F67A
 0076F5D6    xor         eax,eax
 0076F5D8    push        ebp
 0076F5D9    push        76F673
 0076F5DE    push        dword ptr fs:[eax]
 0076F5E1    mov         dword ptr fs:[eax],esp
 0076F5E4    mov         edx,76FFD0;'initialized successfully. Kinect should work in GlovePIE.'
 0076F5E9    mov         eax,dword ptr [ebp-4]
 0076F5EC    mov         ecx,dword ptr [eax]
 0076F5EE    call        dword ptr [ecx+38];TStrings.Add
 0076F5F1    lea         edx,[ebp-10]
 0076F5F4    mov         eax,dword ptr [ebp-14]
 0076F5F7    call        INuiInstance.NuiCameraElevationGetAngle
 0076F5FC    mov         ebx,eax
 0076F5FE    test        ebx,80000000
>0076F604    jne         0076F638
 0076F606    push        770050;'current angle = '
 0076F60B    lea         edx,[ebp-44]
 0076F60E    mov         eax,dword ptr [ebp-10]
 0076F611    call        IntToStr
 0076F616    push        dword ptr [ebp-44]
 0076F619    push        770080;' degrees'
 0076F61E    lea         eax,[ebp-40]
 0076F621    mov         edx,3
 0076F626    call        @UStrCatN
 0076F62B    mov         edx,dword ptr [ebp-40]
 0076F62E    mov         eax,dword ptr [ebp-4]
 0076F631    mov         ecx,dword ptr [eax]
 0076F633    call        dword ptr [ecx+38];TStrings.Add
>0076F636    jmp         0076F65D
 0076F638    lea         edx,[ebp-4C]
 0076F63B    mov         eax,ebx
 0076F63D    call        0076D414
 0076F642    mov         ecx,dword ptr [ebp-4C]
 0076F645    lea         eax,[ebp-48]
 0076F648    mov         edx,7700A0;'failed to read angle: '
 0076F64D    call        @UStrCat3
 0076F652    mov         edx,dword ptr [ebp-48]
 0076F655    mov         eax,dword ptr [ebp-4]
 0076F658    mov         ecx,dword ptr [eax]
 0076F65A    call        dword ptr [ecx+38];TStrings.Add
 0076F65D    xor         eax,eax
 0076F65F    pop         edx
 0076F660    pop         ecx
 0076F661    pop         ecx
 0076F662    mov         dword ptr fs:[eax],edx
 0076F665    push        76F6B6
 0076F66A    mov         eax,dword ptr [ebp-14]
 0076F66D    call        INuiInstance.NuiShutdown
 0076F672    ret
>0076F673    jmp         @HandleFinally
>0076F678    jmp         0076F66A
 0076F67A    push        7700DC;'failed to initialize Kinect '
 0076F67F    lea         edx,[ebp-54]
 0076F682    mov         eax,esi
 0076F684    call        IntToStr
 0076F689    push        dword ptr [ebp-54]
 0076F68C    push        76FBC4;': '
 0076F691    lea         edx,[ebp-58]
 0076F694    mov         eax,ebx
 0076F696    call        0076D414
 0076F69B    push        dword ptr [ebp-58]
 0076F69E    lea         eax,[ebp-50]
 0076F6A1    mov         edx,4
 0076F6A6    call        @UStrCatN
 0076F6AB    mov         edx,dword ptr [ebp-50]
 0076F6AE    mov         eax,dword ptr [ebp-4]
 0076F6B1    mov         ecx,dword ptr [eax]
 0076F6B3    call        dword ptr [ecx+38];TStrings.Add
 0076F6B6    xor         eax,eax
 0076F6B8    pop         edx
 0076F6B9    pop         ecx
 0076F6BA    pop         ecx
 0076F6BB    mov         dword ptr fs:[eax],edx
 0076F6BE    push        76F711
 0076F6C3    lea         eax,[ebp-14]
 0076F6C6    call        0076D290
 0076F6CB    ret
>0076F6CC    jmp         @HandleFinally
>0076F6D1    jmp         0076F6C3
 0076F6D3    push        76FF90;'Kinect '
 0076F6D8    lea         edx,[ebp-60]
 0076F6DB    mov         eax,dword ptr [ebp-8]
 0076F6DE    inc         eax
 0076F6DF    call        IntToStr
 0076F6E4    push        dword ptr [ebp-60]
 0076F6E7    push        770124;': MSR_NuiCreateInstanceByIndex failed, '
 0076F6EC    lea         edx,[ebp-64]
 0076F6EF    mov         eax,ebx
 0076F6F1    call        0076D414
 0076F6F6    push        dword ptr [ebp-64]
 0076F6F9    lea         eax,[ebp-5C]
 0076F6FC    mov         edx,4
 0076F701    call        @UStrCatN
 0076F706    mov         edx,dword ptr [ebp-5C]
 0076F709    mov         eax,dword ptr [ebp-4]
 0076F70C    mov         ecx,dword ptr [eax]
 0076F70E    call        dword ptr [ecx+38];TStrings.Add
 0076F711    inc         dword ptr [ebp-8]
 0076F714    dec         dword ptr [ebp-18]
>0076F717    jne         0076F53A
>0076F71D    jmp         0076F768
 0076F71F    sub         ebx,80004002
>0076F725    jne         0076F768
 0076F727    mov         edx,770180;'Microsoft Kinect SDK (unknown version) is NOT installed.'
 0076F72C    mov         eax,dword ptr [ebp-4]
 0076F72F    mov         ecx,dword ptr [eax]
 0076F731    call        dword ptr [ecx+38];TStrings.Add
 0076F734    mov         edx,770200;'This Free version of GlovePIE is only compatible with the Microsoft Kinect S...
 0076F739    mov         eax,dword ptr [ebp-4]
 0076F73C    mov         ecx,dword ptr [eax]
 0076F73E    call        dword ptr [ecx+38];TStrings.Add
 0076F741    mov         edx,7702AC;'You will need to uninstall any CLNui, OpenKinect, or OpenNI/NITE drivers'
 0076F746    mov         eax,dword ptr [ebp-4]
 0076F749    mov         ecx,dword ptr [eax]
 0076F74B    call        dword ptr [ecx+38];TStrings.Add
 0076F74E    mov         edx,77034C;'and then install the Microsoft Kinect SDK.'
 0076F753    mov         eax,dword ptr [ebp-4]
 0076F756    mov         ecx,dword ptr [eax]
 0076F758    call        dword ptr [ecx+38];TStrings.Add
 0076F75B    mov         edx,7703B0;'http://kinectforwindows.org/'
 0076F760    mov         eax,dword ptr [ebp-4]
 0076F763    mov         ecx,dword ptr [eax]
 0076F765    call        dword ptr [ecx+38];TStrings.Add
 0076F768    xor         eax,eax
 0076F76A    pop         edx
 0076F76B    pop         ecx
 0076F76C    pop         ecx
 0076F76D    mov         dword ptr fs:[eax],edx
>0076F770    jmp         0076F7BC
>0076F772    jmp         @HandleOnException
 0076F777    dd          1
 0076F77B    dd          00418C04;Exception
 0076F77F    dd          0076F783
 0076F783    mov         ebx,eax
 0076F785    push        7703F8;'MSR_NUIGetDeviceCount Exception '
 0076F78A    lea         edx,[ebp-6C]
 0076F78D    mov         eax,dword ptr [ebx]
 0076F78F    call        TObject.ClassName
 0076F794    push        dword ptr [ebp-6C]
 0076F797    push        76FBC4;': '
 0076F79C    push        dword ptr [ebx+4];Exception.FMessage:string
 0076F79F    lea         eax,[ebp-68]
 0076F7A2    mov         edx,4
 0076F7A7    call        @UStrCatN
 0076F7AC    mov         edx,dword ptr [ebp-68]
 0076F7AF    mov         eax,dword ptr [ebp-4]
 0076F7B2    mov         ecx,dword ptr [eax]
 0076F7B4    call        dword ptr [ecx+38];TStrings.Add
 0076F7B7    call        @DoneExcept
 0076F7BC    xor         eax,eax
 0076F7BE    pop         edx
 0076F7BF    pop         ecx
 0076F7C0    pop         ecx
 0076F7C1    mov         dword ptr fs:[eax],edx
 0076F7C4    push        76F7F3
 0076F7C9    lea         eax,[ebp-6C]
 0076F7CC    mov         edx,0C
 0076F7D1    call        @UStrArrayClr
 0076F7D6    lea         eax,[ebp-3C]
 0076F7D9    call        @WStrClr
 0076F7DE    lea         eax,[ebp-38]
 0076F7E1    mov         edx,8
 0076F7E6    call        @UStrArrayClr
 0076F7EB    ret
>0076F7EC    jmp         @HandleFinally
>0076F7F1    jmp         0076F7C9
 0076F7F3    pop         edi
 0076F7F4    pop         esi
 0076F7F5    pop         ebx
 0076F7F6    mov         esp,ebp
 0076F7F8    pop         ebp
 0076F7F9    ret
*}
end;

//0077043C
function TModuleKinect.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 0077043C    push        ebp
 0077043D    mov         ebp,esp
 0077043F    push        ecx
 00770440    push        ebx
 00770441    mov         dword ptr [ebp-4],edx
 00770444    mov         ebx,eax
 00770446    mov         eax,dword ptr [ebp-4]
 00770449    call        @UStrAddRef
 0077044E    xor         eax,eax
 00770450    push        ebp
 00770451    push        770488
 00770456    push        dword ptr fs:[eax]
 00770459    mov         dword ptr fs:[eax],esp
 0077045C    mov         edx,dword ptr [ebp-4]
 0077045F    mov         eax,dword ptr [ebx+1C];TModuleKinect.Fields:THashTable
 00770462    call        THashTable.Get
 00770467    sub         eax,1
>0077046A    jae         00770470
 0077046C    xor         ebx,ebx
>0077046E    jmp         00770472
 00770470    mov         bl,9
 00770472    xor         eax,eax
 00770474    pop         edx
 00770475    pop         ecx
 00770476    pop         ecx
 00770477    mov         dword ptr fs:[eax],edx
 0077047A    push        77048F
 0077047F    lea         eax,[ebp-4]
 00770482    call        @UStrClr
 00770487    ret
>00770488    jmp         @HandleFinally
>0077048D    jmp         0077047F
 0077048F    mov         eax,ebx
 00770491    pop         ebx
 00770492    pop         ecx
 00770493    pop         ebp
 00770494    ret
*}
end;

//00770498
function TModuleKinect.GetGoodFields:TStringList;
begin
{*
 00770498    push        ebx
 00770499    mov         dl,1
 0077049B    mov         eax,[0043C7BC];TStringList
 007704A0    call        TStringList.Create;TStringList.Create
 007704A5    mov         ebx,eax
 007704A7    mov         edx,7704D0;'SmoothPitch'
 007704AC    mov         eax,ebx
 007704AE    mov         ecx,dword ptr [eax]
 007704B0    call        dword ptr [ecx+38];TStringList.Add
 007704B3    mov         edx,7704F4;'y'
 007704B8    mov         eax,ebx
 007704BA    mov         ecx,dword ptr [eax]
 007704BC    call        dword ptr [ecx+38];TStringList.Add
 007704BF    mov         eax,ebx
 007704C1    pop         ebx
 007704C2    ret
*}
end;

//007704F8
procedure TModuleKinect.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 007704F8    push        ebp
 007704F9    mov         ebp,esp
 007704FB    mov         byte ptr [edx],1
 007704FE    mov         dword ptr [ecx],1
 00770504    mov         eax,dword ptr [ebp+8]
 00770507    mov         dword ptr [eax],4
 0077050D    pop         ebp
 0077050E    ret         4
*}
end;

//00770514
procedure TModuleKinect.MonitorFrame;
begin
{*
 00770514    push        ebp
 00770515    mov         ebp,esp
 00770517    push        0
 00770519    push        0
 0077051B    push        ebx
 0077051C    push        esi
 0077051D    push        edi
 0077051E    mov         edi,eax
 00770520    xor         eax,eax
 00770522    push        ebp
 00770523    push        7705B7
 00770528    push        dword ptr fs:[eax]
 0077052B    mov         dword ptr fs:[eax],esp
 0077052E    cmp         byte ptr [edi+28],0;TModuleKinect.Monitoring:Boolean
>00770532    je          0077059C
 00770534    mov         eax,edi
 00770536    mov         edx,dword ptr [eax]
 00770538    call        dword ptr [edx+3C];TModuleKinect.Read
 0077053B    test        al,al
>0077053D    je          0077059C
 0077053F    mov         esi,dword ptr ds:[822D94];gvar_00822D94:Single
 00770545    test        esi,esi
>00770547    jle         00770595
 00770549    mov         ebx,1
 0077054E    mov         eax,ebx
 00770550    call        0076E404
 00770555    test        eax,eax
>00770557    je          00770591
 00770559    cmp         ebx,1
>0077055C    jne         0077056D
 0077055E    lea         eax,[ebp-4]
 00770561    mov         edx,7705D4;'Kinect.'
 00770566    call        @UStrLAsg
>0077056B    jmp         00770591
 0077056D    push        7705F0;'Kinect'
 00770572    lea         edx,[ebp-8]
 00770575    mov         eax,ebx
 00770577    call        IntToStr
 0077057C    push        dword ptr [ebp-8]
 0077057F    push        77060C;'.'
 00770584    lea         eax,[ebp-4]
 00770587    mov         edx,3
 0077058C    call        @UStrCatN
 00770591    inc         ebx
 00770592    dec         esi
>00770593    jne         0077054E
 00770595    mov         eax,edi
 00770597    call        005E509C
 0077059C    xor         eax,eax
 0077059E    pop         edx
 0077059F    pop         ecx
 007705A0    pop         ecx
 007705A1    mov         dword ptr fs:[eax],edx
 007705A4    push        7705BE
 007705A9    lea         eax,[ebp-8]
 007705AC    mov         edx,2
 007705B1    call        @UStrArrayClr
 007705B6    ret
>007705B7    jmp         @HandleFinally
>007705BC    jmp         007705A9
 007705BE    pop         edi
 007705BF    pop         esi
 007705C0    pop         ebx
 007705C1    pop         ecx
 007705C2    pop         ecx
 007705C3    pop         ebp
 007705C4    ret
*}
end;

//00770610
procedure TModuleKinect.PrepareForGUI;
begin
{*
 00770610    ret
*}
end;

//00770614
procedure TModuleKinect.PrepareForMonitoring;
begin
{*
 00770614    ret
*}
end;

//00770618
function TModuleKinect.Read:Boolean;
begin
{*
 00770618    push        ebp
 00770619    mov         ebp,esp
 0077061B    add         esp,0FFFFF570
 00770621    push        ebx
 00770622    push        esi
 00770623    push        edi
 00770624    xor         edx,edx
 00770626    mov         dword ptr [ebp-0A88],edx
 0077062C    mov         dword ptr [ebp-0A8C],edx
 00770632    mov         dword ptr [ebp-0A90],edx
 00770638    mov         dword ptr [ebp-0A7C],edx
 0077063E    mov         dword ptr [ebp-0A80],edx
 00770644    mov         dword ptr [ebp-0A84],edx
 0077064A    xor         eax,eax
 0077064C    push        ebp
 0077064D    push        7707C7
 00770652    push        dword ptr fs:[eax]
 00770655    mov         dword ptr fs:[eax],esp
 00770658    mov         byte ptr [ebp-1],1
 0077065C    mov         edi,2
 00770661    mov         esi,822D91;gvar_00822D91
 00770666    mov         ebx,822D80;gvar_00822D80
 0077066B    mov         dword ptr [ebp-0C],822DA0
 00770672    cmp         byte ptr [esi],0
>00770675    je          00770797
 0077067B    cmp         dword ptr [ebx],0
>0077067E    je          00770797
 00770684    mov         eax,dword ptr [ebx]
 00770686    lea         ecx,[ebp-0A78]
 0077068C    mov         eax,dword ptr [eax+4]
 0077068F    xor         edx,edx
 00770691    call        INuiInstance.NuiSkeletonGetNextFrame
 00770696    mov         dword ptr [ebp-8],eax
 00770699    test        byte ptr [ebp-5],80
>0077069D    je          00770743
 007706A3    cmp         dword ptr [ebp-8],83010001
>007706AA    je          00770797
 007706B0    push        7707E8;'Kinect'
 007706B5    lea         edx,[ebp-0A80]
 007706BB    mov         eax,edi
 007706BD    call        IntToStr
 007706C2    push        dword ptr [ebp-0A80]
 007706C8    push        770804;'.y NuiSkeletonGetNextFrame '
 007706CD    lea         edx,[ebp-0A84]
 007706D3    mov         eax,dword ptr [ebp-8]
 007706D6    call        0076D414
 007706DB    push        dword ptr [ebp-0A84]
 007706E1    lea         eax,[ebp-0A7C]
 007706E7    mov         edx,4
 007706EC    call        @UStrCatN
 007706F1    push        7707E8;'Kinect'
 007706F6    lea         edx,[ebp-0A8C]
 007706FC    mov         eax,edi
 007706FE    call        IntToStr
 00770703    push        dword ptr [ebp-0A8C]
 00770709    push        770848;'.y KinectSDK Read failed: '
 0077070E    lea         edx,[ebp-0A90]
 00770714    mov         eax,dword ptr [ebp-8]
 00770717    call        0076D414
 0077071C    push        dword ptr [ebp-0A90]
 00770722    lea         eax,[ebp-0A88]
 00770728    mov         edx,4
 0077072D    call        @UStrCatN
 00770732    mov         eax,dword ptr [ebp-0A88]
 00770738    call        004FA5FC
 0077073D    mov         byte ptr [ebp-1],0
>00770741    jmp         00770797
 00770743    fld         dword ptr [ebp-0A68]
 00770749    fcomp       dword ptr ds:[770880];0:Single
 0077074F    wait
 00770750    fnstsw      al
 00770752    sahf
>00770753    jne         0077078B
 00770755    fld         dword ptr [ebp-0A64]
 0077075B    fcomp       dword ptr ds:[770880];0:Single
 00770761    wait
 00770762    fnstsw      al
 00770764    sahf
>00770765    jne         0077078B
 00770767    fld         dword ptr [ebp-0A60]
 0077076D    fcomp       dword ptr ds:[770880];0:Single
 00770773    wait
 00770774    fnstsw      al
 00770776    sahf
>00770777    jne         0077078B
 00770779    fld         dword ptr [ebp-0A5C]
 0077077F    fcomp       dword ptr ds:[770880];0:Single
 00770785    wait
 00770786    fnstsw      al
 00770788    sahf
>00770789    je          00770797
 0077078B    fld         dword ptr [ebp-0A5C]
 00770791    mov         eax,dword ptr [ebp-0C]
 00770794    fstp        qword ptr [eax]
 00770796    wait
 00770797    inc         edi
 00770798    add         dword ptr [ebp-0C],8
 0077079C    add         ebx,4
 0077079F    inc         esi
 007707A0    cmp         edi,5
>007707A3    jne         00770672
 007707A9    xor         eax,eax
 007707AB    pop         edx
 007707AC    pop         ecx
 007707AD    pop         ecx
 007707AE    mov         dword ptr fs:[eax],edx
 007707B1    push        7707CE
 007707B6    lea         eax,[ebp-0A90]
 007707BC    mov         edx,6
 007707C1    call        @UStrArrayClr
 007707C6    ret
>007707C7    jmp         @HandleFinally
>007707CC    jmp         007707B6
 007707CE    movzx       eax,byte ptr [ebp-1]
 007707D2    pop         edi
 007707D3    pop         esi
 007707D4    pop         ebx
 007707D5    mov         esp,ebp
 007707D7    pop         ebp
 007707D8    ret
*}
end;

//00770884
procedure TModuleKinect.StartCompiletime;
begin
{*
 00770884    call        TPieModule.StartCompiletime
 00770889    call        0076F01C
 0077088E    ret
*}
end;

//00770890
procedure TModuleKinect.StartGUI;
begin
{*
 00770890    call        0074BF10
 00770895    call        TWiimoteManager.StartGUI
 0077089A    ret
*}
end;

//0077089C
procedure TModuleKinect.StartMonitoring;
begin
{*
 0077089C    push        ebx
 0077089D    mov         ebx,eax
 0077089F    mov         byte ptr [ebx+28],1;TModuleKinect.Monitoring:Boolean
 007708A3    mov         eax,dword ptr [ebx+30];TModuleKinect.OldButtonsDown:TStringList
 007708A6    mov         edx,dword ptr [eax]
 007708A8    call        dword ptr [edx+44];TStringList.Clear
 007708AB    mov         eax,dword ptr [ebx+2C];TModuleKinect.ButtonsDown:TStringList
 007708AE    mov         edx,dword ptr [eax]
 007708B0    call        dword ptr [edx+44];TStringList.Clear
 007708B3    pop         ebx
 007708B4    ret
*}
end;

//007708B8
procedure TModuleKinect.StartRuntime;
begin
{*
 007708B8    call        TPieModule.StartRuntime
 007708BD    call        0076F044
 007708C2    ret
*}
end;

//007708C4
procedure TModuleKinect.StopCompiletime;
begin
{*
 007708C4    push        ebx
 007708C5    mov         ebx,eax
 007708C7    call        0076F040
 007708CC    mov         eax,ebx
 007708CE    call        TPieModule.StopCompiletime
 007708D3    pop         ebx
 007708D4    ret
*}
end;

//007708D8
procedure TModuleKinect.StopGUI;
begin
{*
 007708D8    mov         edx,dword ptr [eax]
 007708DA    call        dword ptr [edx+34];TModuleKinect.StopRuntime
 007708DD    ret
*}
end;

//007708E0
procedure TModuleKinect.StopMonitoring;
begin
{*
 007708E0    mov         byte ptr [eax+28],0;TModuleKinect.Monitoring:Boolean
 007708E4    ret
*}
end;

//007708E8
procedure TModuleKinect.StopRuntime;
begin
{*
 007708E8    push        ebx
 007708E9    mov         ebx,eax
 007708EB    call        0076F174
 007708F0    mov         eax,ebx
 007708F2    call        TPieModule.StopRuntime
 007708F7    pop         ebx
 007708F8    ret
*}
end;

//007708FC
constructor TKinectObject.Create(instance:INuiInstance);
begin
{*
 007708FC    push        ebp
 007708FD    mov         ebp,esp
 007708FF    push        0
 00770901    push        ebx
 00770902    push        esi
 00770903    push        edi
 00770904    test        dl,dl
>00770906    je          00770910
 00770908    add         esp,0FFFFFFF0
 0077090B    call        @ClassCreate
 00770910    mov         esi,ecx
 00770912    mov         ebx,edx
 00770914    mov         edi,eax
 00770916    xor         eax,eax
 00770918    push        ebp
 00770919    push        770957
 0077091E    push        dword ptr fs:[eax]
 00770921    mov         dword ptr fs:[eax],esp
 00770924    mov         dword ptr [edi+4],esi;TKinectObject.instance:INuiInstance
 00770927    lea         edx,[ebp-4]
 0077092A    mov         eax,esi
 0077092C    call        INuiInstance.NuiInstanceName
 00770931    mov         edx,dword ptr [ebp-4]
 00770934    lea         eax,[edi+8];TKinectObject.name:string
 00770937    call        @UStrFromWStr
 0077093C    xor         eax,eax
 0077093E    mov         dword ptr [edi+0C],eax;TKinectObject.LastPitch:Integer
 00770941    xor         eax,eax
 00770943    pop         edx
 00770944    pop         ecx
 00770945    pop         ecx
 00770946    mov         dword ptr fs:[eax],edx
 00770949    push        77095E
 0077094E    lea         eax,[ebp-4]
 00770951    call        @WStrClr
 00770956    ret
>00770957    jmp         @HandleFinally
>0077095C    jmp         0077094E
 0077095E    mov         eax,edi
 00770960    test        bl,bl
>00770962    je          00770973
 00770964    call        @AfterConstruction
 00770969    pop         dword ptr fs:[0]
 00770970    add         esp,0C
 00770973    mov         eax,edi
 00770975    pop         edi
 00770976    pop         esi
 00770977    pop         ebx
 00770978    pop         ecx
 00770979    pop         ebp
 0077097A    ret
*}
end;

//0077097C
destructor TKinectObject.Destroy();
begin
{*
 0077097C    push        ebx
 0077097D    push        esi
 0077097E    call        @BeforeDestruction
 00770983    mov         ebx,edx
 00770985    mov         esi,eax
 00770987    mov         eax,dword ptr [esi+4];TKinectObject.instance:INuiInstance
 0077098A    call        INuiInstance.Free
 0077098F    mov         edx,ebx
 00770991    and         dl,0FC
 00770994    mov         eax,esi
 00770996    call        TObject.Destroy
 0077099B    test        bl,bl
>0077099D    jle         007709A6
 0077099F    mov         eax,esi
 007709A1    call        @ClassDestroy
 007709A6    pop         esi
 007709A7    pop         ebx
 007709A8    ret
*}
end;

Initialization
//0078306C
{*
 0078306C    sub         dword ptr ds:[822DB8],1
>00783073    jae         00783090
 00783075    mov         dl,1
 00783077    mov         eax,[0076E424];TModuleKinect
 0078307C    call        TModuleKinect.Create;TModuleKinect.Create
 00783081    mov         [00822DBC],eax;gvar_00822DBC:TModuleKinect
 00783086    mov         eax,[00822DBC];gvar_00822DBC:TModuleKinect
 0078308B    call        005E31AC
 00783090    ret
*}
Finalization
end.