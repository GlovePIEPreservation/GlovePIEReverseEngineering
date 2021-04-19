//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit135;

interface

uses
  SysUtils, Classes;

type
  TD3D9Panel = class(TWinControl)
  published
    procedure DoPresent;//006E7F84
    procedure DoRender;//006E7FB4
    function Running:Boolean;//006E81E8
    constructor Create(AOwner:TComponent);//006E7EC4
    destructor Destroy();//006E7F00
    procedure Init;//006E7FD4
    procedure DeviceLost;//006E7F2C
    procedure Done;//006E7F5C
  public
    D3D:IDirect3D9;//f270
    D3DDevice:IDirect3DDevice9;//f274
    Params:_D3DPRESENT_PARAMETERS_;//f278
    RenderFunction:TRenderFunction;//f2B0
    destructor Destroy(); virtual;//006E7F00
    constructor Create(AOwner:TComponent); virtual;//v2C//006E7EC4
    procedure PaintWindow(DC:HDC); virtual;//vD4//006E81E4
    procedure WMPaint(Message:TWMPaint); message WM_PAINT;//006E81FC
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//006E81F4
  end;
  TD3DValue = class(TObjectValue)
  published
    function GetPerUnits2:TUnits;//006EA488
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;//006EAAB8
    function GetUnits:TUnits;//006EA5C8
    function GetPerUnits1:TUnits;//006EA478
    function SetString(NewValue:string):Boolean;//006EA8BC
    procedure SetMatrix(m:TRotMat);//006EA7E4
    procedure GetVector(x:Double; y:Double; z:Double);//006EA6F8
    procedure GetRotMat(m:TRotMat);//006EA498
    //function SetValue(NewValue:Double; ?:?):Boolean;//006EA96C
    //procedure ToString(?:?);//006EAB84
    function GetDataType:TDataType;//006EA420
    function CanSet:Boolean;//006EA3EC
    procedure FillClone(c:TExpression);//006EA400
    //procedure GetString(?:?);//006EA554
    procedure GetValue;//006EA5F0
    procedure CreateClone;//006EA3F0
  public
    ................................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//006EAB84
    procedure GetValue; virtual;//v2C//006EA5F0
    //procedure GetString(?:?); virtual;//v38//006EA554
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//006EA6F8
    procedure GetRotMat(m:TRotMat); virtual;//v40//006EA498
    function GetDataType:TDataType; virtual;//v44//006EA420
    function GetUnits:TUnits; virtual;//v48//006EA5C8
    function GetPerUnits1:TUnits; virtual;//v4C//006EA478
    function GetPerUnits2:TUnits; virtual;//v50//006EA488
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//006EA96C
    function SetString(NewValue:string):Boolean; virtual;//v5C//006EA8BC
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean; virtual;//v60//006EAAB8
    procedure SetMatrix(m:TRotMat); virtual;//v64//006EA7E4
    function CanSet:Boolean; virtual;//v68//006EA3EC
    procedure CreateClone; virtual;//v80//006EA3F0
    procedure FillClone(c:TExpression); virtual;//v84//006EA400
  end;
  TD3DCameraValue = class(TObjectValue)
  published
    function GetPerUnits2:TUnits;//006EC7AC
    function GetPerUnits1:TUnits;//006EC79C
    function GetUnits:TUnits;//006EC868
    procedure GetVector(x:Double; y:Double; z:Double);//006ECA64
    procedure SetMatrix(m:TRotMat);//006ECD50
    procedure GetRotMat(m:TRotMat);//006EC7BC
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;//006ECF6C
    //procedure GetString(?:?);//006EC840
    //function SetValue(NewValue:Double; ?:?):Boolean;//006ECDC4
    function CanSet:Boolean;//006EC704
    function GetDataType:TDataType;//006EC738
    //procedure ToString(?:?);//006ECFCC
    procedure FillClone(c:TExpression);//006EC718
    procedure CreateClone;//006EC708
    procedure GetValue;//006EC8C0
  public
    ..............................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//006ECFCC
    procedure GetValue; virtual;//v2C//006EC8C0
    //procedure GetString(?:?); virtual;//v38//006EC840
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//006ECA64
    procedure GetRotMat(m:TRotMat); virtual;//v40//006EC7BC
    function GetDataType:TDataType; virtual;//v44//006EC738
    function GetUnits:TUnits; virtual;//v48//006EC868
    function GetPerUnits1:TUnits; virtual;//v4C//006EC79C
    function GetPerUnits2:TUnits; virtual;//v50//006EC7AC
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//006ECDC4
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean; virtual;//v60//006ECF6C
    procedure SetMatrix(m:TRotMat); virtual;//v64//006ECD50
    function CanSet:Boolean; virtual;//v68//006EC704
    procedure CreateClone; virtual;//v80//006EC708
    procedure FillClone(c:TExpression); virtual;//v84//006EC718
  end;
  AD3DMaterial = array [1..65536] of _D3DMATERIAL9;
  AID3DTexture = array [1..65536] of IDirect3DTexture9;
  TD3DObject = class(TObject)
  published
    procedure FreeModel;//006EC1B4
    destructor Destroy();//006EC188
    procedure SetModel(NewModel:string);//006EC4B8
    constructor Create;//006EC0E8
    procedure Render(Device:IDirect3DDevice9);//006EC230
  public
    x:Single;//f4
    y:Single;//f8
    z:Single;//fC
    sizex:Single;//f10
    sizey:Single;//f14
    sizez:Single;//f18
    pitch:Single;//f1C
    yaw:Single;//f20
    roll:Single;//f24
    rotmat:_D3DMATRIX;//f28
    useRotMat:Boolean;//f68
    Visible:Boolean;//f69
    color:_D3DCOLORVALUE;//f6A
    Model:string;//f7C
    NumMaterials:Cardinal;//f80
    g_pMesh:ID3DXMesh;//f84
    g_pMeshMaterials:PAD3DMaterial;//f88
    g_pMeshTextures:PAID3DTexture;//f8C
  end;
  TD3DCamera = class(TObject)
  published
    procedure Render(Panel:TD3D9Panel; Device:IDirect3DDevice9; eye:Integer);//006ED130
    procedure UpdateViewMatrix;//006ED524
    constructor Create;//006ED0BC
  public
    x:Single;//f4
    y:Single;//f8
    z:Single;//fC
    fov:Single;//f10
    nearclip:Single;//f14
    farclip:Single;//f18
    ScreenDepth:Single;//f1C
    eyesep:Single;//f20
    pitch:Single;//f24
    yaw:Single;//f28
    roll:Single;//f2C
    Visible:Boolean;//f30
    Stereo:Boolean;//f31
    BackgroundColour:Cardinal;//f34
    AmbientColour:Cardinal;//f38
    ViewMatrix:_D3DMATRIX;//f3C
  end;
    procedure PaintWindow(DC:HDC);//006E81E4
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//006E81F4
    procedure WMPaint(Message:TWMPaint);//006E81FC
    function D3DXVec3Normalize(const v:TD3DVector):PD3DXVector3; stdcall;//006E82BC
    function D3DXMatrixMultiply(const m1:TD3DMatrix; const m2:TD3DMatrix):PD3DXMatrix; stdcall;//006E82C4
    function D3DXMatrixScaling(sx:Single; sy:Single; sz:Single):PD3DXMatrix; stdcall;//006E82CC
    function D3DXMatrixTranslation(x:Single; y:Single; z:Single):PD3DXMatrix; stdcall;//006E82D4
    function D3DXMatrixRotationAxis(const v:TD3DVector; angle:Single):PD3DXMatrix; stdcall;//006E82DC
    function D3DXMatrixPerspectiveFovLH(flovy:Single; aspect:Single; zn:Single; zf:Single):PD3DXMatrix; stdcall;//006E82E4
    function D3DXMatrixPerspectiveOffCenterLH(l:Single; r:Single; b:Single; t:Single; zn:Single; zf:Single):PD3DXMatrix; stdcall;//006E82EC
    function D3DXLoadMeshFromXW(Options:DWORD; pD3DDevice:IDirect3DDevice9; ppAdjacency:PID3DXBuffer; ppMaterials:PID3DXBuffer; ppEffectInstances:PID3DXBuffer; pNumMaterials:PDWORD; var ppMesh:ID3DXMesh):HRESULT; stdcall;//006E8358
    function D3DXCreateTextureFromFileA(pSrcFile:PAnsiChar; var ppTexture:IDirect3DTexture8):HRESULT; stdcall;//006E8360
    procedure sub_006E8DA8;//006E8DA8
    procedure sub_006E90A4;//006E90A4
    procedure sub_006E9208;//006E9208
    //function sub_006E9FD0(?:?):?;//006E9FD0
    //function sub_006EA1C8(?:?):?;//006EA1C8
    procedure sub_006EAC5C;//006EAC5C
    procedure sub_006EAC9C;//006EAC9C
    //procedure sub_006EACA0(?:?; ?:?; ?:?);//006EACA0
    procedure sub_006EB860;//006EB860
    procedure sub_006EB928;//006EB928
    //function sub_006EB9A0:?;//006EB9A0
    //function sub_006EB9E8(?:UnicodeString):?;//006EB9E8
    //procedure sub_006EBA38(?:Integer; ?:?);//006EBA38
    //function sub_006EBA50:?;//006EBA50
    //function sub_006EBAC4(?:?):?;//006EBAC4
    //function sub_006EBBB0(?:UnicodeString):?;//006EBBB0
    //procedure sub_006EBC00(?:Integer; ?:?);//006EBC00
    //function sub_006EBC18:?;//006EBC18
    //function sub_006EBC8C(?:?):?;//006EBC8C
    //procedure sub_006EBD84(?:?; ?:?; ?:?);//006EBD84
    //procedure sub_006EBF68(?:?; ?:?; ?:?);//006EBF68
    //procedure sub_006ED5F0(?:Pointer; ?:?);//006ED5F0

implementation

//006E7EC4
constructor TD3D9Panel.Create(AOwner:TComponent);
begin
{*
 006E7EC4    push        ebx
 006E7EC5    push        esi
 006E7EC6    test        dl,dl
>006E7EC8    je          006E7ED2
 006E7ECA    add         esp,0FFFFFFF0
 006E7ECD    call        @ClassCreate
 006E7ED2    mov         ebx,edx
 006E7ED4    mov         esi,eax
 006E7ED6    xor         edx,edx
 006E7ED8    mov         eax,esi
 006E7EDA    call        TWinControl.Create
 006E7EDF    mov         eax,dword ptr [esi+50];TD3D9Panel.FControlStyle:TControlStyle
 006E7EE2    mov         dword ptr [esi+50],eax;TD3D9Panel.FControlStyle:TControlStyle
 006E7EE5    mov         eax,esi
 006E7EE7    test        bl,bl
>006E7EE9    je          006E7EFA
 006E7EEB    call        @AfterConstruction
 006E7EF0    pop         dword ptr fs:[0]
 006E7EF7    add         esp,0C
 006E7EFA    mov         eax,esi
 006E7EFC    pop         esi
 006E7EFD    pop         ebx
 006E7EFE    ret
*}
end;

//006E7F00
destructor TD3D9Panel.Destroy();
begin
{*
 006E7F00    push        ebx
 006E7F01    push        esi
 006E7F02    call        @BeforeDestruction
 006E7F07    mov         ebx,edx
 006E7F09    mov         esi,eax
 006E7F0B    mov         eax,esi
 006E7F0D    call        TD3D9Panel.Done
 006E7F12    mov         edx,ebx
 006E7F14    and         dl,0FC
 006E7F17    mov         eax,esi
 006E7F19    call        TWinControl.Destroy
 006E7F1E    test        bl,bl
>006E7F20    jle         006E7F29
 006E7F22    mov         eax,esi
 006E7F24    call        @ClassDestroy
 006E7F29    pop         esi
 006E7F2A    pop         ebx
 006E7F2B    ret
*}
end;

//006E7F2C
procedure TD3D9Panel.DeviceLost;
begin
{*
 006E7F2C    push        ebx
 006E7F2D    mov         ebx,eax
 006E7F2F    mov         eax,dword ptr [ebx+274];TD3D9Panel.D3DDevice:IDirect3DDevice9
 006E7F35    push        eax
 006E7F36    mov         eax,dword ptr [eax]
 006E7F38    call        dword ptr [eax+0C]
 006E7F3B    sub         eax,88760869
>006E7F40    je          006E7F44
>006E7F42    jmp         006E7F57
 006E7F44    lea         eax,[ebx+278];TD3D9Panel.Params:_D3DPRESENT_PARAMETERS_
 006E7F4A    push        eax
 006E7F4B    mov         eax,dword ptr [ebx+274];TD3D9Panel.D3DDevice:IDirect3DDevice9
 006E7F51    push        eax
 006E7F52    mov         eax,dword ptr [eax]
 006E7F54    call        dword ptr [eax+40]
 006E7F57    pop         ebx
 006E7F58    ret
*}
end;

//006E7F5C
procedure TD3D9Panel.Done;
begin
{*
 006E7F5C    push        ebx
 006E7F5D    mov         ebx,eax
 006E7F5F    lea         eax,[ebx+274];TD3D9Panel.D3DDevice:IDirect3DDevice9
 006E7F65    call        @IntfClear
 006E7F6A    lea         eax,[ebx+270];TD3D9Panel.D3D:IDirect3D9
 006E7F70    call        @IntfClear
 006E7F75    mov         eax,ebx
 006E7F77    mov         edx,dword ptr [eax]
 006E7F79    call        dword ptr [edx+90];TWinControl.Invalidate
 006E7F7F    pop         ebx
 006E7F80    ret
*}
end;

//006E7F84
procedure TD3D9Panel.DoPresent;
begin
{*
 006E7F84    push        ebx
 006E7F85    mov         ebx,eax
 006E7F87    cmp         dword ptr [ebx+2B0],0;TD3D9Panel.RenderFunction:TRenderFunction
>006E7F8E    je          006E7FB2
 006E7F90    push        0
 006E7F92    push        0
 006E7F94    push        0
 006E7F96    push        0
 006E7F98    mov         eax,dword ptr [ebx+274];TD3D9Panel.D3DDevice:IDirect3DDevice9
 006E7F9E    push        eax
 006E7F9F    mov         eax,dword ptr [eax]
 006E7FA1    call        dword ptr [eax+44]
 006E7FA4    cmp         eax,88760868
>006E7FA9    jne         006E7FB2
 006E7FAB    mov         eax,ebx
 006E7FAD    call        TD3D9Panel.DeviceLost
 006E7FB2    pop         ebx
 006E7FB3    ret
*}
end;

//006E7FB4
procedure TD3D9Panel.DoRender;
begin
{*
 006E7FB4    push        ebx
 006E7FB5    cmp         dword ptr [eax+2B0],0;TD3D9Panel.RenderFunction:TRenderFunction
>006E7FBC    je          006E7FD2
 006E7FBE    mov         ebx,eax
 006E7FC0    mov         ecx,dword ptr [eax+274];TD3D9Panel.D3DDevice:IDirect3DDevice9
 006E7FC6    mov         edx,dword ptr [eax+270];TD3D9Panel.D3D:IDirect3D9
 006E7FCC    call        dword ptr [ebx+2B0]
 006E7FD2    pop         ebx
 006E7FD3    ret
*}
end;

//006E7FD4
procedure TD3D9Panel.Init;
begin
{*
 006E7FD4    push        ebp
 006E7FD5    mov         ebp,esp
 006E7FD7    add         esp,0FFFFFEBC
 006E7FDD    push        ebx
 006E7FDE    push        esi
 006E7FDF    xor         edx,edx
 006E7FE1    mov         dword ptr [ebp-144],edx
 006E7FE7    mov         ebx,eax
 006E7FE9    xor         eax,eax
 006E7FEB    push        ebp
 006E7FEC    push        6E81D7
 006E7FF1    push        dword ptr fs:[eax]
 006E7FF4    mov         dword ptr fs:[eax],esp
 006E7FF7    push        80000020
 006E7FFC    lea         eax,[ebp-144]
 006E8002    push        eax
 006E8003    call        005C33A8
 006E8008    mov         edx,dword ptr [ebp-144]
 006E800E    lea         eax,[ebx+270];TD3D9Panel.D3D:IDirect3D9
 006E8014    call        @IntfCopy
 006E8019    cmp         dword ptr [ebx+270],0;TD3D9Panel.D3D:IDirect3D9
>006E8020    je          006E81BE
 006E8026    lea         eax,[ebp-10]
 006E8029    push        eax
 006E802A    push        0
 006E802C    mov         eax,dword ptr [ebx+270];TD3D9Panel.D3D:IDirect3D9
 006E8032    push        eax
 006E8033    mov         eax,dword ptr [eax]
 006E8035    call        dword ptr [eax+20]
 006E8038    test        eax,80000000
 006E803D    setne       al
 006E8040    neg         al
 006E8042    sbb         eax,eax
 006E8044    test        eax,eax
>006E8046    je          006E8058
 006E8048    lea         eax,[ebx+270];TD3D9Panel.D3D:IDirect3D9
 006E804E    call        @IntfClear
>006E8053    jmp         006E81BE
 006E8058    lea         eax,[ebp-140]
 006E805E    push        eax
 006E805F    push        1
 006E8061    push        0
 006E8063    mov         eax,dword ptr [ebx+270];TD3D9Panel.D3D:IDirect3D9
 006E8069    push        eax
 006E806A    mov         eax,dword ptr [eax]
 006E806C    call        dword ptr [eax+38]
 006E806F    test        eax,80000000
 006E8074    setne       al
 006E8077    neg         al
 006E8079    sbb         eax,eax
 006E807B    test        eax,eax
>006E807D    je          006E808F
 006E807F    lea         eax,[ebx+270];TD3D9Panel.D3D:IDirect3D9
 006E8085    call        @IntfClear
>006E808A    jmp         006E81BE
 006E808F    lea         eax,[ebx+278];TD3D9Panel.Params:_D3DPRESENT_PARAMETERS_
 006E8095    xor         ecx,ecx
 006E8097    mov         edx,38
 006E809C    call        @FillChar
 006E80A1    mov         dword ptr [ebx+298],0FFFFFFFF;TD3D9Panel.Params.EnableAutoDepthStencil:BOOL
 006E80AB    mov         dword ptr [ebx+284],1;TD3D9Panel.Params.BackBufferCount:LongWord
 006E80B5    mov         dword ptr [ebx+290],3;TD3D9Panel.Params.hDeviceWindow:HWND
 006E80BF    mov         dword ptr [ebx+2AC],1
 006E80C9    mov         eax,dword ptr [ebp-4]
 006E80CC    mov         dword ptr [ebx+280],eax;TD3D9Panel.Params.BackBufferFormat:_D3DFORMAT
 006E80D2    mov         dword ptr [ebx+29C],0FFFFFFFF;TD3D9Panel.Params.AutoDepthStencilFormat:_D3DFORMAT
 006E80DC    mov         dword ptr [ebx+2A0],50;TD3D9Panel.Params.Flags:LongInt
 006E80E6    mov         esi,42
 006E80EB    lea         eax,[ebx+274];TD3D9Panel.D3DDevice:IDirect3DDevice9
 006E80F1    call        @IntfClear
 006E80F6    push        eax
 006E80F7    lea         eax,[ebx+278];TD3D9Panel.Params:_D3DPRESENT_PARAMETERS_
 006E80FD    push        eax
 006E80FE    push        esi
 006E80FF    mov         eax,ebx
 006E8101    call        TWinControl.GetHandle
 006E8106    push        eax
 006E8107    push        1
 006E8109    push        0
 006E810B    mov         eax,dword ptr [ebx+270];TD3D9Panel.D3D:IDirect3D9
 006E8111    push        eax
 006E8112    mov         eax,dword ptr [eax]
 006E8114    call        dword ptr [eax+40]
 006E8117    test        eax,80000000
 006E811C    setne       al
 006E811F    neg         al
 006E8121    sbb         eax,eax
 006E8123    test        eax,eax
>006E8125    je          006E81BE
 006E812B    mov         esi,22
 006E8130    lea         eax,[ebx+274];TD3D9Panel.D3DDevice:IDirect3DDevice9
 006E8136    call        @IntfClear
 006E813B    push        eax
 006E813C    lea         eax,[ebx+278];TD3D9Panel.Params:_D3DPRESENT_PARAMETERS_
 006E8142    push        eax
 006E8143    push        esi
 006E8144    mov         eax,ebx
 006E8146    call        TWinControl.GetHandle
 006E814B    push        eax
 006E814C    push        1
 006E814E    push        0
 006E8150    mov         eax,dword ptr [ebx+270];TD3D9Panel.D3D:IDirect3D9
 006E8156    push        eax
 006E8157    mov         eax,dword ptr [eax]
 006E8159    call        dword ptr [eax+40]
 006E815C    test        eax,80000000
 006E8161    setne       al
 006E8164    neg         al
 006E8166    sbb         eax,eax
 006E8168    test        eax,eax
>006E816A    je          006E81BE
 006E816C    lea         eax,[ebx+274];TD3D9Panel.D3DDevice:IDirect3DDevice9
 006E8172    call        @IntfClear
 006E8177    push        eax
 006E8178    lea         eax,[ebx+278];TD3D9Panel.Params:_D3DPRESENT_PARAMETERS_
 006E817E    push        eax
 006E817F    push        esi
 006E8180    mov         eax,ebx
 006E8182    call        TWinControl.GetHandle
 006E8187    push        eax
 006E8188    push        2
 006E818A    push        0
 006E818C    mov         eax,dword ptr [ebx+270];TD3D9Panel.D3D:IDirect3D9
 006E8192    push        eax
 006E8193    mov         eax,dword ptr [eax]
 006E8195    call        dword ptr [eax+40]
 006E8198    test        eax,80000000
 006E819D    setne       al
 006E81A0    neg         al
 006E81A2    sbb         eax,eax
 006E81A4    test        eax,eax
>006E81A6    je          006E81BE
 006E81A8    lea         eax,[ebx+270];TD3D9Panel.D3D:IDirect3D9
 006E81AE    call        @IntfClear
 006E81B3    lea         eax,[ebx+274];TD3D9Panel.D3DDevice:IDirect3DDevice9
 006E81B9    call        @IntfClear
 006E81BE    xor         eax,eax
 006E81C0    pop         edx
 006E81C1    pop         ecx
 006E81C2    pop         ecx
 006E81C3    mov         dword ptr fs:[eax],edx
 006E81C6    push        6E81DE
 006E81CB    lea         eax,[ebp-144]
 006E81D1    call        @IntfClear
 006E81D6    ret
>006E81D7    jmp         @HandleFinally
>006E81DC    jmp         006E81CB
 006E81DE    pop         esi
 006E81DF    pop         ebx
 006E81E0    mov         esp,ebp
 006E81E2    pop         ebp
 006E81E3    ret
*}
end;

//006E81E4
procedure TD3D9Panel.PaintWindow(DC:HDC);
begin
{*
 006E81E4    ret
*}
end;

//006E81E8
function TD3D9Panel.Running:Boolean;
begin
{*
 006E81E8    cmp         dword ptr [eax+274],0;TD3D9Panel.D3DDevice:IDirect3DDevice9
 006E81EF    setne       al
 006E81F2    ret
*}
end;

//006E81F4
procedure TD3D9Panel.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 006E81F4    xor         eax,eax
 006E81F6    mov         dword ptr [edx+0C],eax
 006E81F9    ret
*}
end;

//006E81FC
procedure TD3D9Panel.WMPaint(Message:TWMPaint);
begin
{*
 006E81FC    push        ebx
 006E81FD    push        esi
 006E81FE    push        edi
 006E81FF    push        ebp
 006E8200    add         esp,0FFFFFFB0
 006E8203    mov         edi,edx
 006E8205    mov         ebx,eax
 006E8207    cmp         dword ptr [ebx+274],0;TD3D9Panel.D3DDevice:IDirect3DDevice9
>006E820E    je          006E8234
 006E8210    push        0
 006E8212    mov         eax,ebx
 006E8214    call        TWinControl.GetHandle
 006E8219    push        eax
 006E821A    call        user32.ValidateRect
 006E821F    mov         eax,ebx
 006E8221    call        TD3D9Panel.DoRender
 006E8226    mov         eax,ebx
 006E8228    call        TD3D9Panel.DoPresent
 006E822D    xor         eax,eax
 006E822F    mov         dword ptr [edi+0C],eax
>006E8232    jmp         006E829C
 006E8234    push        esp
 006E8235    mov         eax,ebx
 006E8237    call        TWinControl.GetHandle
 006E823C    push        eax
 006E823D    call        user32.BeginPaint
 006E8242    mov         esi,eax
 006E8244    push        2
 006E8246    call        gdi32.GetStockObject
 006E824B    mov         ebp,eax
 006E824D    push        ebp
 006E824E    mov         eax,ebx
 006E8250    call        TControl.GetClientHeight
 006E8255    push        eax
 006E8256    lea         eax,[esp+48]
 006E825A    push        eax
 006E825B    mov         eax,ebx
 006E825D    call        TControl.GetClientWidth
 006E8262    mov         ecx,eax
 006E8264    xor         edx,edx
 006E8266    xor         eax,eax
 006E8268    call        Rect
 006E826D    lea         eax,[esp+44]
 006E8271    push        eax
 006E8272    push        esi
 006E8273    call        user32.FillRect
 006E8278    push        0A
 006E827A    push        6E82A4;'D3D9 Panel'
 006E827F    push        0
 006E8281    push        0
 006E8283    push        esi
 006E8284    call        gdi32.TextOutW
 006E8289    push        esp
 006E828A    mov         eax,ebx
 006E828C    call        TWinControl.GetHandle
 006E8291    push        eax
 006E8292    call        user32.EndPaint
 006E8297    xor         eax,eax
 006E8299    mov         dword ptr [edi+0C],eax
 006E829C    add         esp,50
 006E829F    pop         ebp
 006E82A0    pop         edi
 006E82A1    pop         esi
 006E82A2    pop         ebx
 006E82A3    ret
*}
end;

//006E82BC
function d3dx9_33.D3DXVec3Normalize(const v:TD3DVector):PD3DXVector3; stdcall;
begin
{*
 006E82BC    jmp         dword ptr ds:[826978]
*}
end;

//006E82C4
function d3dx9_33.D3DXMatrixMultiply(const m1:TD3DMatrix; const m2:TD3DMatrix):PD3DXMatrix; stdcall;
begin
{*
 006E82C4    jmp         dword ptr ds:[826974]
*}
end;

//006E82CC
function d3dx9_33.D3DXMatrixScaling(sx:Single; sy:Single; sz:Single):PD3DXMatrix; stdcall;
begin
{*
 006E82CC    jmp         dword ptr ds:[826970]
*}
end;

//006E82D4
function d3dx9_33.D3DXMatrixTranslation(x:Single; y:Single; z:Single):PD3DXMatrix; stdcall;
begin
{*
 006E82D4    jmp         dword ptr ds:[82696C]
*}
end;

//006E82DC
function d3dx9_33.D3DXMatrixRotationAxis(const v:TD3DVector; angle:Single):PD3DXMatrix; stdcall;
begin
{*
 006E82DC    jmp         dword ptr ds:[826968]
*}
end;

//006E82E4
function d3dx9_33.D3DXMatrixPerspectiveFovLH(flovy:Single; aspect:Single; zn:Single; zf:Single):PD3DXMatrix; stdcall;
begin
{*
 006E82E4    jmp         dword ptr ds:[826964]
*}
end;

//006E82EC
function d3dx9_33.D3DXMatrixPerspectiveOffCenterLH(l:Single; r:Single; b:Single; t:Single; zn:Single; zf:Single):PD3DXMatrix; stdcall;
begin
{*
 006E82EC    jmp         dword ptr ds:[826960]
*}
end;

//006E8358
function d3dx9_33.D3DXLoadMeshFromXW(Options:DWORD; pD3DDevice:IDirect3DDevice9; ppAdjacency:PID3DXBuffer; ppMaterials:PID3DXBuffer; ppEffectInstances:PID3DXBuffer; pNumMaterials:PDWORD; var ppMesh:ID3DXMesh):HRESULT; stdcall;
begin
{*
 006E8358    jmp         dword ptr ds:[82695C]
*}
end;

//006E8360
function d3dx9_33.D3DXCreateTextureFromFileA(pSrcFile:PAnsiChar; var ppTexture:IDirect3DTexture8):HRESULT; stdcall;
begin
{*
 006E8360    jmp         dword ptr ds:[826958]
*}
end;

//006E8DA8
procedure sub_006E8DA8;
begin
{*
 006E8DA8    push        ebx
 006E8DA9    mov         ebx,822724;gvar_00822724:THashTable
 006E8DAE    xor         ecx,ecx
 006E8DB0    mov         edx,6E8EE8;'Visible'
 006E8DB5    mov         eax,dword ptr [ebx]
 006E8DB7    call        THashTable.Add
 006E8DBC    xor         ecx,ecx
 006E8DBE    mov         edx,6E8F04;'Exists'
 006E8DC3    mov         eax,dword ptr [ebx]
 006E8DC5    call        THashTable.Add
 006E8DCA    mov         ecx,4
 006E8DCF    mov         edx,6E8F20;^'RealLeftStick'
 006E8DD4    mov         eax,dword ptr [ebx]
 006E8DD6    call        THashTable.Add
 006E8DDB    mov         ecx,4
 006E8DE0    mov         edx,6E8F34;^'RealLeftStick'
 006E8DE5    mov         eax,dword ptr [ebx]
 006E8DE7    call        THashTable.Add
 006E8DEC    mov         ecx,1
 006E8DF1    mov         edx,6E8F54;'x'
 006E8DF6    mov         eax,dword ptr [ebx]
 006E8DF8    call        THashTable.Add
 006E8DFD    mov         ecx,2
 006E8E02    mov         edx,6E8F64;'y'
 006E8E07    mov         eax,dword ptr [ebx]
 006E8E09    call        THashTable.Add
 006E8E0E    mov         ecx,3
 006E8E13    mov         edx,6E8F74;'z'
 006E8E18    mov         eax,dword ptr [ebx]
 006E8E1A    call        THashTable.Add
 006E8E1F    mov         ecx,8
 006E8E24    mov         edx,6E8F84;'pitch'
 006E8E29    mov         eax,dword ptr [ebx]
 006E8E2B    call        THashTable.Add
 006E8E30    mov         ecx,7
 006E8E35    mov         edx,6E8F9C;'yaw'
 006E8E3A    mov         eax,dword ptr [ebx]
 006E8E3C    call        THashTable.Add
 006E8E41    mov         ecx,9
 006E8E46    mov         edx,6E8FB0;'roll'
 006E8E4B    mov         eax,dword ptr [ebx]
 006E8E4D    call        THashTable.Add
 006E8E52    mov         ecx,5
 006E8E57    mov         edx,6E8FC8;'colour'
 006E8E5C    mov         eax,dword ptr [ebx]
 006E8E5E    call        THashTable.Add
 006E8E63    mov         ecx,5
 006E8E68    mov         edx,6E8FE4;'color'
 006E8E6D    mov         eax,dword ptr [ebx]
 006E8E6F    call        THashTable.Add
 006E8E74    mov         ecx,0A
 006E8E79    mov         edx,6E8FFC;'CubeSize'
 006E8E7E    mov         eax,dword ptr [ebx]
 006E8E80    call        THashTable.Add
 006E8E85    mov         ecx,0B
 006E8E8A    mov         edx,6E901C;'Size'
 006E8E8F    mov         eax,dword ptr [ebx]
 006E8E91    call        THashTable.Add
 006E8E96    mov         ecx,6
 006E8E9B    mov         edx,6E9034;'transparency'
 006E8EA0    mov         eax,dword ptr [ebx]
 006E8EA2    call        THashTable.Add
 006E8EA7    mov         ecx,0C
 006E8EAC    mov         edx,6E905C;'RotMat'
 006E8EB1    mov         eax,dword ptr [ebx]
 006E8EB3    call        THashTable.Add
 006E8EB8    mov         ecx,0C
 006E8EBD    mov         edx,6E9078;'Rotation'
 006E8EC2    mov         eax,dword ptr [ebx]
 006E8EC4    call        THashTable.Add
 006E8EC9    mov         ecx,0D
 006E8ECE    mov         edx,6E9098;'Model'
 006E8ED3    mov         eax,dword ptr [ebx]
 006E8ED5    call        THashTable.Add
 006E8EDA    pop         ebx
 006E8EDB    ret
*}
end;

//006E90A4
procedure sub_006E90A4;
begin
{*
 006E90A4    push        ebx
 006E90A5    mov         ebx,822728;gvar_00822728:THashTable
 006E90AA    xor         ecx,ecx
 006E90AC    mov         edx,6E9148;'Active'
 006E90B1    mov         eax,dword ptr [ebx]
 006E90B3    call        THashTable.Add
 006E90B8    xor         ecx,ecx
 006E90BA    mov         edx,6E9164;'Visible'
 006E90BF    mov         eax,dword ptr [ebx]
 006E90C1    call        THashTable.Add
 006E90C6    xor         ecx,ecx
 006E90C8    mov         edx,6E9180;'Exists'
 006E90CD    mov         eax,dword ptr [ebx]
 006E90CF    call        THashTable.Add
 006E90D4    mov         ecx,1
 006E90D9    mov         edx,6E919C;'x'
 006E90DE    mov         eax,dword ptr [ebx]
 006E90E0    call        THashTable.Add
 006E90E5    mov         ecx,2
 006E90EA    mov         edx,6E91AC;'y'
 006E90EF    mov         eax,dword ptr [ebx]
 006E90F1    call        THashTable.Add
 006E90F6    mov         ecx,3
 006E90FB    mov         edx,6E91BC;'z'
 006E9100    mov         eax,dword ptr [ebx]
 006E9102    call        THashTable.Add
 006E9107    mov         ecx,4
 006E910C    mov         edx,6E91CC;^'RealLeftStick'
 006E9111    mov         eax,dword ptr [ebx]
 006E9113    call        THashTable.Add
 006E9118    mov         ecx,5
 006E911D    mov         edx,6E91E0;'colour'
 006E9122    mov         eax,dword ptr [ebx]
 006E9124    call        THashTable.Add
 006E9129    mov         ecx,5
 006E912E    mov         edx,6E91FC;'color'
 006E9133    mov         eax,dword ptr [ebx]
 006E9135    call        THashTable.Add
 006E913A    pop         ebx
 006E913B    ret
*}
end;

//006E9208
procedure sub_006E9208;
begin
{*
 006E9208    push        ebx
 006E9209    mov         ebx,82272C;gvar_0082272C:THashTable
 006E920E    xor         ecx,ecx
 006E9210    mov         edx,6E9500;'Active'
 006E9215    mov         eax,dword ptr [ebx]
 006E9217    call        THashTable.Add
 006E921C    xor         ecx,ecx
 006E921E    mov         edx,6E951C;'Visible'
 006E9223    mov         eax,dword ptr [ebx]
 006E9225    call        THashTable.Add
 006E922A    xor         ecx,ecx
 006E922C    mov         edx,6E9538;'Exists'
 006E9231    mov         eax,dword ptr [ebx]
 006E9233    call        THashTable.Add
 006E9238    mov         ecx,1
 006E923D    mov         edx,6E9554;'x'
 006E9242    mov         eax,dword ptr [ebx]
 006E9244    call        THashTable.Add
 006E9249    mov         ecx,2
 006E924E    mov         edx,6E9564;'y'
 006E9253    mov         eax,dword ptr [ebx]
 006E9255    call        THashTable.Add
 006E925A    mov         ecx,3
 006E925F    mov         edx,6E9574;'z'
 006E9264    mov         eax,dword ptr [ebx]
 006E9266    call        THashTable.Add
 006E926B    mov         ecx,17
 006E9270    mov         edx,6E9584;'NearClip'
 006E9275    mov         eax,dword ptr [ebx]
 006E9277    call        THashTable.Add
 006E927C    mov         ecx,18
 006E9281    mov         edx,6E95A4;'FarClip'
 006E9286    mov         eax,dword ptr [ebx]
 006E9288    call        THashTable.Add
 006E928D    mov         ecx,17
 006E9292    mov         edx,6E95C0;'NearClippingPlane'
 006E9297    mov         eax,dword ptr [ebx]
 006E9299    call        THashTable.Add
 006E929E    mov         ecx,18
 006E92A3    mov         edx,6E95F0;'FarClippingPlane'
 006E92A8    mov         eax,dword ptr [ebx]
 006E92AA    call        THashTable.Add
 006E92AF    mov         ecx,6
 006E92B4    mov         edx,6E9620;^'RealLeftStick'
 006E92B9    mov         eax,dword ptr [ebx]
 006E92BB    call        THashTable.Add
 006E92C0    mov         ecx,6
 006E92C5    mov         edx,6E9634;^'RealLeftStick'
 006E92CA    mov         eax,dword ptr [ebx]
 006E92CC    call        THashTable.Add
 006E92D1    mov         ecx,7
 006E92D6    mov         edx,6E9654;'yaw'
 006E92DB    mov         eax,dword ptr [ebx]
 006E92DD    call        THashTable.Add
 006E92E2    mov         ecx,8
 006E92E7    mov         edx,6E9668;'pitch'
 006E92EC    mov         eax,dword ptr [ebx]
 006E92EE    call        THashTable.Add
 006E92F3    mov         ecx,9
 006E92F8    mov         edx,6E9680;'roll'
 006E92FD    mov         eax,dword ptr [ebx]
 006E92FF    call        THashTable.Add
 006E9304    mov         ecx,4
 006E9309    mov         edx,6E9698;'BgColour'
 006E930E    mov         eax,dword ptr [ebx]
 006E9310    call        THashTable.Add
 006E9315    mov         ecx,4
 006E931A    mov         edx,6E96B8;'BgColor'
 006E931F    mov         eax,dword ptr [ebx]
 006E9321    call        THashTable.Add
 006E9326    mov         ecx,4
 006E932B    mov         edx,6E96D4;'BackgroundColour'
 006E9330    mov         eax,dword ptr [ebx]
 006E9332    call        THashTable.Add
 006E9337    mov         ecx,4
 006E933C    mov         edx,6E9704;'BackgroundColor'
 006E9341    mov         eax,dword ptr [ebx]
 006E9343    call        THashTable.Add
 006E9348    mov         ecx,19
 006E934D    mov         edx,6E9730;'AmbientColour'
 006E9352    mov         eax,dword ptr [ebx]
 006E9354    call        THashTable.Add
 006E9359    mov         ecx,19
 006E935E    mov         edx,6E9758;'AmbientColor'
 006E9363    mov         eax,dword ptr [ebx]
 006E9365    call        THashTable.Add
 006E936A    mov         ecx,5
 006E936F    mov         edx,6E9780;'vFov'
 006E9374    mov         eax,dword ptr [ebx]
 006E9376    call        THashTable.Add
 006E937B    mov         ecx,5
 006E9380    mov         edx,6E9798;'FOV'
 006E9385    mov         eax,dword ptr [ebx]
 006E9387    call        THashTable.Add
 006E938C    mov         ecx,0B
 006E9391    mov         edx,6E97AC;'FwdDir'
 006E9396    mov         eax,dword ptr [ebx]
 006E9398    call        THashTable.Add
 006E939D    mov         ecx,0C
 006E93A2    mov         edx,6E97C8;'BackDir'
 006E93A7    mov         eax,dword ptr [ebx]
 006E93A9    call        THashTable.Add
 006E93AE    mov         ecx,0D
 006E93B3    mov         edx,6E97E4;'LeftDir'
 006E93B8    mov         eax,dword ptr [ebx]
 006E93BA    call        THashTable.Add
 006E93BF    mov         ecx,0E
 006E93C4    mov         edx,6E9800;'RightDir'
 006E93C9    mov         eax,dword ptr [ebx]
 006E93CB    call        THashTable.Add
 006E93D0    mov         ecx,0F
 006E93D5    mov         edx,6E9820;'UpDir'
 006E93DA    mov         eax,dword ptr [ebx]
 006E93DC    call        THashTable.Add
 006E93E1    mov         ecx,10
 006E93E6    mov         edx,6E9838;'DownDir'
 006E93EB    mov         eax,dword ptr [ebx]
 006E93ED    call        THashTable.Add
 006E93F2    mov         ecx,11
 006E93F7    mov         edx,6E9854;'WalkFwdDir'
 006E93FC    mov         eax,dword ptr [ebx]
 006E93FE    call        THashTable.Add
 006E9403    mov         ecx,12
 006E9408    mov         edx,6E9878;'WalkBackDir'
 006E940D    mov         eax,dword ptr [ebx]
 006E940F    call        THashTable.Add
 006E9414    mov         ecx,13
 006E9419    mov         edx,6E989C;'WalkLeftDir'
 006E941E    mov         eax,dword ptr [ebx]
 006E9420    call        THashTable.Add
 006E9425    mov         ecx,14
 006E942A    mov         edx,6E98C0;'WalkRightDir'
 006E942F    mov         eax,dword ptr [ebx]
 006E9431    call        THashTable.Add
 006E9436    mov         ecx,15
 006E943B    mov         edx,6E98E8;'WalkUpDir'
 006E9440    mov         eax,dword ptr [ebx]
 006E9442    call        THashTable.Add
 006E9447    mov         ecx,16
 006E944C    mov         edx,6E9908;'WalkDownDir'
 006E9451    mov         eax,dword ptr [ebx]
 006E9453    call        THashTable.Add
 006E9458    mov         ecx,1A
 006E945D    mov         edx,6E992C;'EyeSeparation'
 006E9462    mov         eax,dword ptr [ebx]
 006E9464    call        THashTable.Add
 006E9469    mov         ecx,1A
 006E946E    mov         edx,6E9954;'EyeSeperation'
 006E9473    mov         eax,dword ptr [ebx]
 006E9475    call        THashTable.Add
 006E947A    mov         ecx,1B
 006E947F    mov         edx,6E997C;'Stereoscopic'
 006E9484    mov         eax,dword ptr [ebx]
 006E9486    call        THashTable.Add
 006E948B    mov         ecx,1B
 006E9490    mov         edx,6E99A4;'Stereo'
 006E9495    mov         eax,dword ptr [ebx]
 006E9497    call        THashTable.Add
 006E949C    mov         ecx,1B
 006E94A1    mov         edx,6E99C0;'Stereo3D'
 006E94A6    mov         eax,dword ptr [ebx]
 006E94A8    call        THashTable.Add
 006E94AD    mov         ecx,1B
 006E94B2    mov         edx,6E99E0;'S3D'
 006E94B7    mov         eax,dword ptr [ebx]
 006E94B9    call        THashTable.Add
 006E94BE    mov         ecx,1C
 006E94C3    mov         edx,6E99F4;'RotMat'
 006E94C8    mov         eax,dword ptr [ebx]
 006E94CA    call        THashTable.Add
 006E94CF    mov         ecx,1C
 006E94D4    mov         edx,6E9A10;'Rotation'
 006E94D9    mov         eax,dword ptr [ebx]
 006E94DB    call        THashTable.Add
 006E94E0    mov         ecx,1D
 006E94E5    mov         edx,6E9A30;'ScreenDepth'
 006E94EA    mov         eax,dword ptr [ebx]
 006E94EC    call        THashTable.Add
 006E94F1    pop         ebx
 006E94F2    ret
*}
end;

//006E9FD0
{*function sub_006E9FD0(?:?):?;
begin
 006E9FD0    push        ebp
 006E9FD1    mov         ebp,esp
 006E9FD3    add         esp,0FFFFFFF4
 006E9FD6    push        ebx
 006E9FD7    push        esi
 006E9FD8    xor         edx,edx
 006E9FDA    mov         dword ptr [ebp-8],edx
 006E9FDD    mov         dword ptr [ebp-4],eax
 006E9FE0    mov         eax,dword ptr [ebp-4]
 006E9FE3    call        @UStrAddRef
 006E9FE8    xor         eax,eax
 006E9FEA    push        ebp
 006E9FEB    push        6EA161
 006E9FF0    push        dword ptr fs:[eax]
 006E9FF3    mov         dword ptr fs:[eax],esp
 006E9FF6    xor         eax,eax
 006E9FF8    mov         dword ptr [ebp-0C],eax
 006E9FFB    lea         eax,[ebp-8]
 006E9FFE    mov         edx,dword ptr [ebp-4]
 006EA001    call        @UStrLAsg
 006EA006    lea         eax,[ebp-8]
 006EA009    mov         edx,6EA180;'D3D'
 006EA00E    call        004F9BD0
 006EA013    test        al,al
>006EA015    jne         006EA03D
 006EA017    lea         eax,[ebp-8]
 006EA01A    mov         edx,6EA194;'Object'
 006EA01F    call        004F9BD0
 006EA024    test        al,al
>006EA026    jne         006EA03D
 006EA028    lea         eax,[ebp-8]
 006EA02B    mov         edx,6EA1B0;'obj'
 006EA030    call        004F9BD0
 006EA035    test        al,al
>006EA037    je          006EA146
 006EA03D    lea         eax,[ebp-8]
 006EA040    call        004F9D00
 006EA045    mov         ebx,eax
 006EA047    lea         eax,[ebp-8]
 006EA04A    mov         edx,6EA1C4;'.'
 006EA04F    call        004F9BD0
 006EA054    test        al,al
>006EA056    je          006EA146
 006EA05C    mov         eax,dword ptr [ebp-8]
 006EA05F    call        006EB9E8
 006EA064    mov         esi,eax
 006EA066    test        esi,esi
>006EA068    jl          006EA146
 006EA06E    mov         dl,1
 006EA070    mov         eax,[006E8368];TD3DValue
 006EA075    call        TObject.Create;TD3DValue.Create
 006EA07A    mov         dword ptr [ebp-0C],eax
 006EA07D    mov         eax,dword ptr [ebp-0C]
 006EA080    mov         dword ptr [eax+20],esi;TD3DValue..................................Item:Integer
 006EA083    test        ebx,ebx
>006EA085    jge         006EA08C
 006EA087    mov         ebx,1
 006EA08C    cmp         ebx,3E7
>006EA092    jne         006EA0F2
 006EA094    mov         eax,[00822738];gvar_00822738:TObjectList
 006EA099    cmp         dword ptr [eax+8],20
>006EA09D    jg          006EA0AE
 006EA09F    mov         edx,21
 006EA0A4    mov         eax,[00822738];gvar_00822738:TObjectList
 006EA0A9    call        TList.SetCount
 006EA0AE    xor         ebx,ebx
 006EA0B0    mov         esi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA0B6    mov         edx,ebx
 006EA0B8    mov         eax,esi
 006EA0BA    call        TList.Get
 006EA0BF    test        eax,eax
>006EA0C1    jne         006EA0E0
 006EA0C3    mov         esi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA0C9    mov         dl,1
 006EA0CB    mov         eax,[006E9A48];TD3DObject
 006EA0D0    call        TD3DObject.Create;TD3DObject.Create
 006EA0D5    mov         ecx,eax
 006EA0D7    mov         edx,ebx
 006EA0D9    mov         eax,esi
 006EA0DB    call        TList.Put
 006EA0E0    inc         ebx
 006EA0E1    cmp         ebx,21
>006EA0E4    jne         006EA0B0
 006EA0E6    mov         eax,dword ptr [ebp-0C]
 006EA0E9    mov         dword ptr [eax+18],20;TD3DValue............................................................
>006EA0F0    jmp         006EA13F
 006EA0F2    mov         eax,dword ptr [ebp-0C]
 006EA0F5    mov         dword ptr [eax+18],ebx;TD3DValue...........................................................
 006EA0F8    mov         eax,[00822738];gvar_00822738:TObjectList
 006EA0FD    cmp         ebx,dword ptr [eax+8]
>006EA100    jl          006EA10F
 006EA102    lea         edx,[ebx+1]
 006EA105    mov         eax,[00822738];gvar_00822738:TObjectList
 006EA10A    call        TList.SetCount
 006EA10F    mov         esi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA115    mov         edx,ebx
 006EA117    mov         eax,esi
 006EA119    call        TList.Get
 006EA11E    test        eax,eax
>006EA120    jne         006EA13F
 006EA122    mov         esi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA128    mov         dl,1
 006EA12A    mov         eax,[006E9A48];TD3DObject
 006EA12F    call        TD3DObject.Create;TD3DObject.Create
 006EA134    mov         ecx,eax
 006EA136    mov         edx,ebx
 006EA138    mov         eax,esi
 006EA13A    call        TList.Put
 006EA13F    mov         byte ptr ds:[822730],1;gvar_00822730
 006EA146    xor         eax,eax
 006EA148    pop         edx
 006EA149    pop         ecx
 006EA14A    pop         ecx
 006EA14B    mov         dword ptr fs:[eax],edx
 006EA14E    push        6EA168
 006EA153    lea         eax,[ebp-8]
 006EA156    mov         edx,2
 006EA15B    call        @UStrArrayClr
 006EA160    ret
>006EA161    jmp         @HandleFinally
>006EA166    jmp         006EA153
 006EA168    mov         eax,dword ptr [ebp-0C]
 006EA16B    pop         esi
 006EA16C    pop         ebx
 006EA16D    mov         esp,ebp
 006EA16F    pop         ebp
 006EA170    ret
end;*}

//006EA1C8
{*function sub_006EA1C8(?:?):?;
begin
 006EA1C8    push        ebp
 006EA1C9    mov         ebp,esp
 006EA1CB    add         esp,0FFFFFFF8
 006EA1CE    push        ebx
 006EA1CF    push        esi
 006EA1D0    push        edi
 006EA1D1    xor         edx,edx
 006EA1D3    mov         dword ptr [ebp-8],edx
 006EA1D6    mov         dword ptr [ebp-4],eax
 006EA1D9    mov         eax,dword ptr [ebp-4]
 006EA1DC    call        @UStrAddRef
 006EA1E1    xor         eax,eax
 006EA1E3    push        ebp
 006EA1E4    push        6EA2B2
 006EA1E9    push        dword ptr fs:[eax]
 006EA1EC    mov         dword ptr fs:[eax],esp
 006EA1EF    xor         ebx,ebx
 006EA1F1    lea         eax,[ebp-8]
 006EA1F4    mov         edx,dword ptr [ebp-4]
 006EA1F7    call        @UStrLAsg
 006EA1FC    lea         eax,[ebp-8]
 006EA1FF    mov         edx,6EA2D0;'D3DCamera'
 006EA204    call        004F9BD0
 006EA209    test        al,al
>006EA20B    jne         006EA22F
 006EA20D    lea         eax,[ebp-8]
 006EA210    mov         edx,6EA2F0;'Camera'
 006EA215    call        004F9BD0
 006EA21A    test        al,al
>006EA21C    jne         006EA22F
 006EA21E    lea         eax,[ebp-8]
 006EA221    mov         edx,6EA30C;'Cam'
 006EA226    call        004F9BD0
 006EA22B    test        al,al
>006EA22D    je          006EA297
 006EA22F    lea         eax,[ebp-8]
 006EA232    call        004F9D00
 006EA237    mov         edi,eax
 006EA239    lea         eax,[ebp-8]
 006EA23C    mov         edx,6EA320;'.'
 006EA241    call        004F9BD0
 006EA246    test        al,al
>006EA248    je          006EA297
 006EA24A    mov         eax,dword ptr [ebp-8]
 006EA24D    call        006EBBB0
 006EA252    mov         esi,eax
 006EA254    test        esi,esi
>006EA256    jl          006EA297
 006EA258    cmp         esi,1B
>006EA25B    jne         006EA273
 006EA25D    mov         ecx,6EA330;'Stereoscopic 3D support has been removed due to MTBS3D banning me, please pr...
 006EA262    mov         dl,1
 006EA264    mov         eax,[0043912C];EParserError
 006EA269    call        Exception.Create;EParserError.Create
 006EA26E    call        @RaiseExcept
 006EA273    mov         dl,1
 006EA275    mov         eax,[006E8860];TD3DCameraValue
 006EA27A    call        TObject.Create;TD3DCameraValue.Create
 006EA27F    mov         ebx,eax
 006EA281    mov         dword ptr [ebx+20],esi;TD3DCameraValue................................Item:Integer
 006EA284    test        edi,edi
>006EA286    jge         006EA28D
 006EA288    mov         edi,1
 006EA28D    mov         dword ptr [ebx+18],edi;TD3DCameraValue.....................................................
 006EA290    mov         byte ptr ds:[822730],1;gvar_00822730
 006EA297    xor         eax,eax
 006EA299    pop         edx
 006EA29A    pop         ecx
 006EA29B    pop         ecx
 006EA29C    mov         dword ptr fs:[eax],edx
 006EA29F    push        6EA2B9
 006EA2A4    lea         eax,[ebp-8]
 006EA2A7    mov         edx,2
 006EA2AC    call        @UStrArrayClr
 006EA2B1    ret
>006EA2B2    jmp         @HandleFinally
>006EA2B7    jmp         006EA2A4
 006EA2B9    mov         eax,ebx
 006EA2BB    pop         edi
 006EA2BC    pop         esi
 006EA2BD    pop         ebx
 006EA2BE    pop         ecx
 006EA2BF    pop         ecx
 006EA2C0    pop         ebp
 006EA2C1    ret
end;*}

//006EA3EC
function TD3DValue.CanSet:Boolean;
begin
{*
 006EA3EC    mov         al,1
 006EA3EE    ret
*}
end;

//006EA3F0
procedure TD3DValue.CreateClone;
begin
{*
 006EA3F0    mov         dl,1
 006EA3F2    mov         eax,[006E8368];TD3DValue
 006EA3F7    call        TObject.Create;TD3DValue.Create
 006EA3FC    ret
*}
end;

//006EA400
procedure TD3DValue.FillClone(c:TExpression);
begin
{*
 006EA400    push        ebx
 006EA401    push        esi
 006EA402    mov         esi,edx
 006EA404    mov         ebx,eax
 006EA406    mov         edx,esi
 006EA408    mov         eax,ebx
 006EA40A    call        TExpression.FillClone
 006EA40F    mov         eax,esi
 006EA411    mov         edx,dword ptr [ebx+20];TD3DValue...................................Item:Integer
 006EA414    mov         dword ptr [eax+20],edx
 006EA417    mov         edx,dword ptr [ebx+18];TD3DValue...........................................................
 006EA41A    mov         dword ptr [eax+18],edx
 006EA41D    pop         esi
 006EA41E    pop         ebx
 006EA41F    ret
*}
end;

//006EA420
function TD3DValue.GetDataType:TDataType;
begin
{*
 006EA420    mov         eax,dword ptr [eax+20];TD3DValue....................................Item:Integer
 006EA423    cmp         eax,0D
>006EA426    ja          006EA472
 006EA428    movzx       eax,byte ptr [eax+6EA436]
 006EA42F    jmp         dword ptr [eax*4+6EA444]
 006EA42F    db          1
 006EA42F    db          0
 006EA42F    db          0
 006EA42F    db          0
 006EA42F    db          4
 006EA42F    db          2
 006EA42F    db          0
 006EA42F    db          0
 006EA42F    db          0
 006EA42F    db          0
 006EA42F    db          0
 006EA42F    db          3
 006EA42F    db          5
 006EA42F    db          6
 006EA42F    dd          006EA472
 006EA42F    dd          006EA460
 006EA42F    dd          006EA463
 006EA42F    dd          006EA466
 006EA42F    dd          006EA469
 006EA42F    dd          006EA46C
 006EA42F    dd          006EA46F
 006EA460    mov         al,3
 006EA462    ret
 006EA463    mov         al,7
 006EA465    ret
 006EA466    mov         al,5
 006EA468    ret
 006EA469    mov         al,5
 006EA46B    ret
 006EA46C    mov         al,6
 006EA46E    ret
 006EA46F    mov         al,4
 006EA471    ret
 006EA472    xor         eax,eax
 006EA474    ret
*}
end;

//006EA478
function TD3DValue.GetPerUnits1:TUnits;
begin
{*
 006EA478    mov         eax,dword ptr [eax+20];TD3DValue.....................................Item:Integer
 006EA47B    sub         eax,1
>006EA47E    jae         006EA483
 006EA480    xor         eax,eax
 006EA482    ret
 006EA483    xor         eax,eax
 006EA485    ret
*}
end;

//006EA488
function TD3DValue.GetPerUnits2:TUnits;
begin
{*
 006EA488    mov         eax,dword ptr [eax+20];TD3DValue......................................Item:Integer
 006EA48B    sub         eax,1
>006EA48E    jae         006EA493
 006EA490    xor         eax,eax
 006EA492    ret
 006EA493    xor         eax,eax
 006EA495    ret
*}
end;

//006EA498
procedure TD3DValue.GetRotMat(m:TRotMat);
begin
{*
 006EA498    push        ebx
 006EA499    push        esi
 006EA49A    push        edi
 006EA49B    add         esp,0FFFFFFF8
 006EA49E    mov         dword ptr [esp],edx
 006EA4A1    mov         ebx,eax
 006EA4A3    mov         esi,dword ptr [ebx+18];TD3DValue...........................................................
 006EA4A6    test        esi,esi
>006EA4A8    jl          006EA4B4
 006EA4AA    mov         eax,[00822738];gvar_00822738:TObjectList
 006EA4AF    cmp         esi,dword ptr [eax+8]
>006EA4B2    jl          006EA4B8
 006EA4B4    mov         al,1
>006EA4B6    jmp         006EA4CC
 006EA4B8    mov         edi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA4BE    mov         edx,esi
 006EA4C0    mov         eax,edi
 006EA4C2    call        TList.Get
 006EA4C7    test        eax,eax
 006EA4C9    sete        al
 006EA4CC    test        al,al
>006EA4CE    je          006EA500
 006EA4D0    xor         ecx,ecx
 006EA4D2    mov         esi,dword ptr [esp]
 006EA4D5    xor         edx,edx
 006EA4D7    mov         eax,esi
 006EA4D9    cmp         edx,ecx
 006EA4DB    sete        bl
 006EA4DE    movsx       ebx,bl
 006EA4E1    mov         dword ptr [esp+4],ebx
 006EA4E5    fild        dword ptr [esp+4]
 006EA4E9    fstp        qword ptr [eax]
 006EA4EB    wait
 006EA4EC    inc         edx
 006EA4ED    add         eax,8
 006EA4F0    cmp         edx,3
>006EA4F3    jne         006EA4D9
 006EA4F5    inc         ecx
 006EA4F6    add         esi,18
 006EA4F9    cmp         ecx,3
>006EA4FC    jne         006EA4D5
>006EA4FE    jmp         006EA54B
 006EA500    mov         esi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA506    mov         edx,dword ptr [ebx+18];TD3DValue...........................................................
 006EA509    mov         eax,esi
 006EA50B    call        TList.Get
 006EA510    mov         edx,dword ptr [ebx+20];TD3DValue.......................................Item:Integer
 006EA513    sub         edx,0C
>006EA516    jne         006EA541
 006EA518    fld         dword ptr [eax+20]
 006EA51B    add         esp,0FFFFFFF8
 006EA51E    fstp        qword ptr [esp]
 006EA521    wait
 006EA522    fld         dword ptr [eax+1C]
 006EA525    add         esp,0FFFFFFF8
 006EA528    fstp        qword ptr [esp]
 006EA52B    wait
 006EA52C    fld         dword ptr [eax+24]
 006EA52F    add         esp,0FFFFFFF8
 006EA532    fstp        qword ptr [esp]
 006EA535    wait
 006EA536    mov         eax,dword ptr [esp+18]
 006EA53A    call        005C361C
>006EA53F    jmp         006EA54B
 006EA541    mov         edx,dword ptr [esp]
 006EA544    mov         eax,ebx
 006EA546    call        TExpression.GetRotMat
 006EA54B    pop         ecx
 006EA54C    pop         edx
 006EA54D    pop         edi
 006EA54E    pop         esi
 006EA54F    pop         ebx
 006EA550    ret
*}
end;

//006EA554
{*procedure TD3DValue.GetString(?:?);
begin
 006EA554    push        ebx
 006EA555    push        esi
 006EA556    push        edi
 006EA557    push        ebp
 006EA558    mov         edi,edx
 006EA55A    mov         ebx,eax
 006EA55C    mov         esi,dword ptr [ebx+18];TD3DValue...........................................................
 006EA55F    test        esi,esi
>006EA561    jl          006EA56D
 006EA563    mov         eax,[00822738];gvar_00822738:TObjectList
 006EA568    cmp         esi,dword ptr [eax+8]
>006EA56B    jl          006EA571
 006EA56D    mov         al,1
>006EA56F    jmp         006EA585
 006EA571    mov         ebp,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA577    mov         edx,esi
 006EA579    mov         eax,ebp
 006EA57B    call        TList.Get
 006EA580    test        eax,eax
 006EA582    sete        al
 006EA585    test        al,al
>006EA587    je          006EA592
 006EA589    mov         eax,edi
 006EA58B    call        @UStrClr
>006EA590    jmp         006EA5C1
 006EA592    mov         esi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA598    mov         edx,dword ptr [ebx+18];TD3DValue...........................................................
 006EA59B    mov         eax,esi
 006EA59D    call        TList.Get
 006EA5A2    mov         esi,eax
 006EA5A4    mov         eax,dword ptr [ebx+20];TD3DValue........................................Item:Integer
 006EA5A7    sub         eax,0D
>006EA5AA    jne         006EA5B8
 006EA5AC    mov         eax,edi
 006EA5AE    mov         edx,dword ptr [esi+7C]
 006EA5B1    call        @UStrAsg
>006EA5B6    jmp         006EA5C1
 006EA5B8    mov         edx,edi
 006EA5BA    mov         eax,ebx
 006EA5BC    call        TExpression.GetString
 006EA5C1    pop         ebp
 006EA5C2    pop         edi
 006EA5C3    pop         esi
 006EA5C4    pop         ebx
 006EA5C5    ret
end;*}

//006EA5C8
function TD3DValue.GetUnits:TUnits;
begin
{*
 006EA5C8    mov         eax,dword ptr [eax+20];TD3DValue.........................................Item:Integer
 006EA5CB    sub         eax,1
>006EA5CE    jb          006EA5E4
 006EA5D0    sub         eax,4
>006EA5D3    jb          006EA5E7
 006EA5D5    add         eax,0FFFFFFFE
 006EA5D8    sub         eax,3
>006EA5DB    jb          006EA5EA
 006EA5DD    sub         eax,2
>006EA5E0    jb          006EA5E7
>006EA5E2    jmp         006EA5ED
 006EA5E4    xor         eax,eax
 006EA5E6    ret
 006EA5E7    mov         al,5
 006EA5E9    ret
 006EA5EA    mov         al,18
 006EA5EC    ret
 006EA5ED    xor         eax,eax
 006EA5EF    ret
*}
end;

//006EA5F0
procedure TD3DValue.GetValue;
begin
{*
 006EA5F0    push        ebx
 006EA5F1    push        esi
 006EA5F2    push        edi
 006EA5F3    add         esp,0FFFFFFF8
 006EA5F6    mov         ebx,eax
 006EA5F8    mov         esi,dword ptr [ebx+18];TD3DValue...........................................................
 006EA5FB    test        esi,esi
>006EA5FD    jl          006EA609
 006EA5FF    mov         eax,[00822738];gvar_00822738:TObjectList
 006EA604    cmp         esi,dword ptr [eax+8]
>006EA607    jl          006EA60D
 006EA609    mov         al,1
>006EA60B    jmp         006EA621
 006EA60D    mov         edi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA613    mov         edx,esi
 006EA615    mov         eax,edi
 006EA617    call        TList.Get
 006EA61C    test        eax,eax
 006EA61E    sete        al
 006EA621    test        al,al
>006EA623    je          006EA633
 006EA625    xor         eax,eax
 006EA627    mov         dword ptr [esp],eax
 006EA62A    mov         dword ptr [esp+4],eax
>006EA62E    jmp         006EA6E8
 006EA633    mov         esi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA639    mov         edx,dword ptr [ebx+18];TD3DValue...........................................................
 006EA63C    mov         eax,esi
 006EA63E    call        TList.Get
 006EA643    mov         edx,dword ptr [ebx+20];TD3DValue..........................................Item:Integer
 006EA646    cmp         edx,0A
>006EA649    ja          006EA6DF
 006EA64F    jmp         dword ptr [edx*4+6EA656]
 006EA64F    dd          006EA682
 006EA64F    dd          006EA691
 006EA64F    dd          006EA69A
 006EA64F    dd          006EA6A3
 006EA64F    dd          006EA6DF
 006EA64F    dd          006EA6DF
 006EA64F    dd          006EA6D0
 006EA64F    dd          006EA6B5
 006EA64F    dd          006EA6AC
 006EA64F    dd          006EA6BE
 006EA64F    dd          006EA6C7
 006EA682    movzx       eax,byte ptr [eax+69]
 006EA686    call        00686074
 006EA68B    fstp        qword ptr [esp]
 006EA68E    wait
>006EA68F    jmp         006EA6E8
 006EA691    fld         dword ptr [eax+4]
 006EA694    fstp        qword ptr [esp]
 006EA697    wait
>006EA698    jmp         006EA6E8
 006EA69A    fld         dword ptr [eax+8]
 006EA69D    fstp        qword ptr [esp]
 006EA6A0    wait
>006EA6A1    jmp         006EA6E8
 006EA6A3    fld         dword ptr [eax+0C]
 006EA6A6    fstp        qword ptr [esp]
 006EA6A9    wait
>006EA6AA    jmp         006EA6E8
 006EA6AC    fld         dword ptr [eax+1C]
 006EA6AF    fstp        qword ptr [esp]
 006EA6B2    wait
>006EA6B3    jmp         006EA6E8
 006EA6B5    fld         dword ptr [eax+20]
 006EA6B8    fstp        qword ptr [esp]
 006EA6BB    wait
>006EA6BC    jmp         006EA6E8
 006EA6BE    fld         dword ptr [eax+24]
 006EA6C1    fstp        qword ptr [esp]
 006EA6C4    wait
>006EA6C5    jmp         006EA6E8
 006EA6C7    fld         dword ptr [eax+10]
 006EA6CA    fstp        qword ptr [esp]
 006EA6CD    wait
>006EA6CE    jmp         006EA6E8
 006EA6D0    fld         dword ptr ds:[6EA6F4];1:Single
 006EA6D6    fsub        dword ptr [eax+76]
 006EA6D9    fstp        qword ptr [esp]
 006EA6DC    wait
>006EA6DD    jmp         006EA6E8
 006EA6DF    xor         eax,eax
 006EA6E1    mov         dword ptr [esp],eax
 006EA6E4    mov         dword ptr [esp+4],eax
 006EA6E8    fld         qword ptr [esp]
 006EA6EB    pop         ecx
 006EA6EC    pop         edx
 006EA6ED    pop         edi
 006EA6EE    pop         esi
 006EA6EF    pop         ebx
 006EA6F0    ret
*}
end;

//006EA6F8
procedure TD3DValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 006EA6F8    push        ebp
 006EA6F9    mov         ebp,esp
 006EA6FB    add         esp,0FFFFFFF8
 006EA6FE    push        ebx
 006EA6FF    push        esi
 006EA700    push        edi
 006EA701    mov         dword ptr [ebp-4],ecx
 006EA704    mov         edi,edx
 006EA706    mov         ebx,eax
 006EA708    mov         esi,dword ptr [ebx+18];TD3DValue...........................................................
 006EA70B    test        esi,esi
>006EA70D    jl          006EA719
 006EA70F    mov         eax,[00822738];gvar_00822738:TObjectList
 006EA714    cmp         esi,dword ptr [eax+8]
>006EA717    jl          006EA71D
 006EA719    mov         al,1
>006EA71B    jmp         006EA734
 006EA71D    mov         eax,[00822738];gvar_00822738:TObjectList
 006EA722    mov         dword ptr [ebp-8],eax
 006EA725    mov         edx,esi
 006EA727    mov         eax,dword ptr [ebp-8]
 006EA72A    call        TList.Get
 006EA72F    test        eax,eax
 006EA731    sete        al
 006EA734    test        al,al
>006EA736    je          006EA758
 006EA738    xor         eax,eax
 006EA73A    mov         dword ptr [edi],eax
 006EA73C    mov         dword ptr [edi+4],eax
 006EA73F    mov         eax,dword ptr [ebp-4]
 006EA742    xor         edx,edx
 006EA744    mov         dword ptr [eax],edx
 006EA746    mov         dword ptr [eax+4],edx
 006EA749    mov         eax,dword ptr [ebp+8]
 006EA74C    xor         edx,edx
 006EA74E    mov         dword ptr [eax],edx
 006EA750    mov         dword ptr [eax+4],edx
>006EA753    jmp         006EA7D8
 006EA758    mov         esi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA75E    mov         edx,dword ptr [ebx+18];TD3DValue...........................................................
 006EA761    mov         eax,esi
 006EA763    call        TList.Get
 006EA768    mov         edx,dword ptr [ebx+20];TD3DValue...........................................Item:Integer
 006EA76B    sub         edx,4
>006EA76E    je          006EA77A
 006EA770    dec         edx
>006EA771    je          006EA794
 006EA773    sub         edx,6
>006EA776    je          006EA7AE
>006EA778    jmp         006EA7C8
 006EA77A    fld         dword ptr [eax+4]
 006EA77D    fstp        qword ptr [edi]
 006EA77F    wait
 006EA780    fld         dword ptr [eax+8]
 006EA783    mov         edx,dword ptr [ebp-4]
 006EA786    fstp        qword ptr [edx]
 006EA788    wait
 006EA789    fld         dword ptr [eax+0C]
 006EA78C    mov         eax,dword ptr [ebp+8]
 006EA78F    fstp        qword ptr [eax]
 006EA791    wait
>006EA792    jmp         006EA7D8
 006EA794    fld         dword ptr [eax+6A]
 006EA797    fstp        qword ptr [edi]
 006EA799    wait
 006EA79A    fld         dword ptr [eax+6E]
 006EA79D    mov         edx,dword ptr [ebp-4]
 006EA7A0    fstp        qword ptr [edx]
 006EA7A2    wait
 006EA7A3    fld         dword ptr [eax+72]
 006EA7A6    mov         eax,dword ptr [ebp+8]
 006EA7A9    fstp        qword ptr [eax]
 006EA7AB    wait
>006EA7AC    jmp         006EA7D8
 006EA7AE    fld         dword ptr [eax+10]
 006EA7B1    fstp        qword ptr [edi]
 006EA7B3    wait
 006EA7B4    fld         dword ptr [eax+14]
 006EA7B7    mov         edx,dword ptr [ebp-4]
 006EA7BA    fstp        qword ptr [edx]
 006EA7BC    wait
 006EA7BD    fld         dword ptr [eax+18]
 006EA7C0    mov         eax,dword ptr [ebp+8]
 006EA7C3    fstp        qword ptr [eax]
 006EA7C5    wait
>006EA7C6    jmp         006EA7D8
 006EA7C8    mov         eax,dword ptr [ebp+8]
 006EA7CB    push        eax
 006EA7CC    mov         ecx,dword ptr [ebp-4]
 006EA7CF    mov         edx,edi
 006EA7D1    mov         eax,ebx
 006EA7D3    call        TExpression.GetVector
 006EA7D8    pop         edi
 006EA7D9    pop         esi
 006EA7DA    pop         ebx
 006EA7DB    pop         ecx
 006EA7DC    pop         ecx
 006EA7DD    pop         ebp
 006EA7DE    ret         4
*}
end;

//006EA7E4
procedure TD3DValue.SetMatrix(m:TRotMat);
begin
{*
 006EA7E4    push        ebx
 006EA7E5    push        esi
 006EA7E6    push        edi
 006EA7E7    add         esp,0FFFFFFA0
 006EA7EA    mov         esi,edx
 006EA7EC    lea         edi,[esp+18]
 006EA7F0    mov         ecx,12
 006EA7F5    rep movs    dword ptr [edi],dword ptr [esi]
 006EA7F7    mov         ebx,eax
 006EA7F9    mov         esi,dword ptr [ebx+18];TD3DValue...........................................................
 006EA7FC    test        esi,esi
>006EA7FE    jl          006EA80A
 006EA800    mov         eax,[00822738];gvar_00822738:TObjectList
 006EA805    cmp         esi,dword ptr [eax+8]
>006EA808    jl          006EA80E
 006EA80A    mov         al,1
>006EA80C    jmp         006EA822
 006EA80E    mov         edi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA814    mov         edx,esi
 006EA816    mov         eax,edi
 006EA818    call        TList.Get
 006EA81D    test        eax,eax
 006EA81F    sete        al
 006EA822    test        al,al
>006EA824    je          006EA82D
 006EA826    xor         eax,eax
>006EA828    jmp         006EA8B4
 006EA82D    mov         esi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA833    mov         edx,dword ptr [ebx+18];TD3DValue...........................................................
 006EA836    mov         eax,esi
 006EA838    call        TList.Get
 006EA83D    mov         esi,eax
 006EA83F    mov         eax,dword ptr [ebx+20];TD3DValue............................................Item:Integer
 006EA842    sub         eax,0C
>006EA845    jne         006EA8A9
 006EA847    lea         eax,[esp+10]
 006EA84B    push        eax
 006EA84C    lea         ecx,[esp+0C]
 006EA850    lea         edx,[esp+4]
 006EA854    lea         eax,[esp+1C]
 006EA858    call        005C3550
 006EA85D    fld         qword ptr [esp]
 006EA860    fstp        dword ptr [esi+20]
 006EA863    wait
 006EA864    fld         qword ptr [esp+8]
 006EA868    fstp        dword ptr [esi+1C]
 006EA86B    wait
 006EA86C    fld         qword ptr [esp+10]
 006EA870    fstp        dword ptr [esi+24]
 006EA873    wait
 006EA874    mov         dword ptr [esi+64],3F800000
 006EA87B    xor         ecx,ecx
 006EA87D    lea         ebx,[esp+18]
 006EA881    xor         edx,edx
 006EA883    mov         eax,ebx
 006EA885    fld         qword ptr [eax]
 006EA887    mov         edi,ecx
 006EA889    add         edi,edi
 006EA88B    lea         edi,[esi+edi*8]
 006EA88E    fstp        dword ptr [edi+edx*4+28]
 006EA892    wait
 006EA893    inc         edx
 006EA894    add         eax,8
 006EA897    cmp         edx,3
>006EA89A    jne         006EA885
 006EA89C    inc         ecx
 006EA89D    add         ebx,18
 006EA8A0    cmp         ecx,3
>006EA8A3    jne         006EA881
 006EA8A5    mov         al,1
>006EA8A7    jmp         006EA8B4
 006EA8A9    lea         edx,[esp+18]
 006EA8AD    mov         eax,ebx
 006EA8AF    call        TExpression.SetMatrix
 006EA8B4    add         esp,60
 006EA8B7    pop         edi
 006EA8B8    pop         esi
 006EA8B9    pop         ebx
 006EA8BA    ret
*}
end;

//006EA8BC
function TD3DValue.SetString(NewValue:string):Boolean;
begin
{*
 006EA8BC    push        ebp
 006EA8BD    mov         ebp,esp
 006EA8BF    push        ecx
 006EA8C0    push        ebx
 006EA8C1    push        esi
 006EA8C2    push        edi
 006EA8C3    mov         dword ptr [ebp-4],edx
 006EA8C6    mov         edi,eax
 006EA8C8    mov         eax,dword ptr [ebp-4]
 006EA8CB    call        @UStrAddRef
 006EA8D0    xor         eax,eax
 006EA8D2    push        ebp
 006EA8D3    push        6EA95C
 006EA8D8    push        dword ptr fs:[eax]
 006EA8DB    mov         dword ptr fs:[eax],esp
 006EA8DE    mov         esi,dword ptr [edi+18];TD3DValue...........................................................
 006EA8E1    test        esi,esi
>006EA8E3    jl          006EA8EF
 006EA8E5    mov         eax,[00822738];gvar_00822738:TObjectList
 006EA8EA    cmp         esi,dword ptr [eax+8]
>006EA8ED    jl          006EA8F3
 006EA8EF    mov         al,1
>006EA8F1    jmp         006EA907
 006EA8F3    mov         ebx,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA8F9    mov         edx,esi
 006EA8FB    mov         eax,ebx
 006EA8FD    call        TList.Get
 006EA902    test        eax,eax
 006EA904    sete        al
 006EA907    test        al,al
>006EA909    je          006EA90F
 006EA90B    xor         ebx,ebx
>006EA90D    jmp         006EA946
 006EA90F    mov         ebx,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA915    mov         edx,dword ptr [edi+18];TD3DValue...........................................................
 006EA918    mov         eax,ebx
 006EA91A    call        TList.Get
 006EA91F    mov         esi,eax
 006EA921    mov         bl,1
 006EA923    mov         eax,dword ptr [edi+20];TD3DValue.............................................Item:Intege...
 006EA926    sub         eax,0D
>006EA929    jne         006EA944
 006EA92B    mov         eax,dword ptr [ebp-4]
 006EA92E    mov         edx,dword ptr [esi+7C]
 006EA931    call        @UStrEqual
>006EA936    je          006EA946
 006EA938    mov         edx,dword ptr [ebp-4]
 006EA93B    mov         eax,esi
 006EA93D    call        TD3DObject.SetModel
>006EA942    jmp         006EA946
 006EA944    xor         ebx,ebx
 006EA946    xor         eax,eax
 006EA948    pop         edx
 006EA949    pop         ecx
 006EA94A    pop         ecx
 006EA94B    mov         dword ptr fs:[eax],edx
 006EA94E    push        6EA963
 006EA953    lea         eax,[ebp-4]
 006EA956    call        @UStrClr
 006EA95B    ret
>006EA95C    jmp         @HandleFinally
>006EA961    jmp         006EA953
 006EA963    mov         eax,ebx
 006EA965    pop         edi
 006EA966    pop         esi
 006EA967    pop         ebx
 006EA968    pop         ecx
 006EA969    pop         ebp
 006EA96A    ret
*}
end;

//006EA96C
{*function TD3DValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 006EA96C    push        ebp
 006EA96D    mov         ebp,esp
 006EA96F    push        ebx
 006EA970    push        esi
 006EA971    push        edi
 006EA972    mov         edi,eax
 006EA974    mov         esi,dword ptr [edi+18];TD3DValue...........................................................
 006EA977    test        esi,esi
>006EA979    jl          006EA985
 006EA97B    mov         eax,[00822738];gvar_00822738:TObjectList
 006EA980    cmp         esi,dword ptr [eax+8]
>006EA983    jl          006EA989
 006EA985    mov         al,1
>006EA987    jmp         006EA99D
 006EA989    mov         ebx,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA98F    mov         edx,esi
 006EA991    mov         eax,ebx
 006EA993    call        TList.Get
 006EA998    test        eax,eax
 006EA99A    sete        al
 006EA99D    test        al,al
>006EA99F    je          006EA9A8
 006EA9A1    xor         ebx,ebx
>006EA9A3    jmp         006EAAA6
 006EA9A8    mov         esi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EA9AE    mov         edx,dword ptr [edi+18];TD3DValue...........................................................
 006EA9B1    mov         eax,esi
 006EA9B3    call        TList.Get
 006EA9B8    mov         esi,eax
 006EA9BA    mov         bl,1
 006EA9BC    mov         eax,dword ptr [edi+20];TD3DValue..............................................Item:Integ...
 006EA9BF    cmp         eax,0A
>006EA9C2    ja          006EAAA4
 006EA9C8    jmp         dword ptr [eax*4+6EA9CF]
 006EA9C8    dd          006EA9FB
 006EA9C8    dd          006EAA0E
 006EA9C8    dd          006EAA1A
 006EA9C8    dd          006EAA26
 006EA9C8    dd          006EAAA4
 006EA9C8    dd          006EAAA4
 006EA9C8    dd          006EAA61
 006EA9C8    dd          006EAA38
 006EA9C8    dd          006EAA2F
 006EA9C8    dd          006EAA41
 006EA9C8    dd          006EAA4A
 006EA9FB    push        dword ptr [ebp+0C]
 006EA9FE    push        dword ptr [ebp+8]
 006EAA01    call        00686060
 006EAA06    mov         byte ptr [esi+69],al
>006EAA09    jmp         006EAAA6
 006EAA0E    fld         qword ptr [ebp+8]
 006EAA11    fstp        dword ptr [esi+4]
 006EAA14    wait
>006EAA15    jmp         006EAAA6
 006EAA1A    fld         qword ptr [ebp+8]
 006EAA1D    fstp        dword ptr [esi+8]
 006EAA20    wait
>006EAA21    jmp         006EAAA6
 006EAA26    fld         qword ptr [ebp+8]
 006EAA29    fstp        dword ptr [esi+0C]
 006EAA2C    wait
>006EAA2D    jmp         006EAAA6
 006EAA2F    fld         qword ptr [ebp+8]
 006EAA32    fstp        dword ptr [esi+1C]
 006EAA35    wait
>006EAA36    jmp         006EAAA6
 006EAA38    fld         qword ptr [ebp+8]
 006EAA3B    fstp        dword ptr [esi+20]
 006EAA3E    wait
>006EAA3F    jmp         006EAAA6
 006EAA41    fld         qword ptr [ebp+8]
 006EAA44    fstp        dword ptr [esi+24]
 006EAA47    wait
>006EAA48    jmp         006EAAA6
 006EAA4A    fld         qword ptr [ebp+8]
 006EAA4D    fstp        dword ptr [esi+10]
 006EAA50    wait
 006EAA51    fld         qword ptr [ebp+8]
 006EAA54    fstp        dword ptr [esi+14]
 006EAA57    wait
 006EAA58    fld         qword ptr [ebp+8]
 006EAA5B    fstp        dword ptr [esi+18]
 006EAA5E    wait
>006EAA5F    jmp         006EAAA6
 006EAA61    fld         qword ptr [ebp+8]
 006EAA64    fcomp       dword ptr ds:[6EAAB0];1:Single
 006EAA6A    wait
 006EAA6B    fnstsw      al
 006EAA6D    sahf
>006EAA6E    jbe         006EAA7E
 006EAA70    xor         eax,eax
 006EAA72    mov         dword ptr [ebp+8],eax
 006EAA75    mov         dword ptr [ebp+0C],3FF00000
>006EAA7C    jmp         006EAA95
 006EAA7E    fld         qword ptr [ebp+8]
 006EAA81    fcomp       dword ptr ds:[6EAAB4];0:Single
 006EAA87    wait
 006EAA88    fnstsw      al
 006EAA8A    sahf
>006EAA8B    jae         006EAA95
 006EAA8D    xor         eax,eax
 006EAA8F    mov         dword ptr [ebp+8],eax
 006EAA92    mov         dword ptr [ebp+0C],eax
 006EAA95    fld         dword ptr ds:[6EAAB0];1:Single
 006EAA9B    fsub        qword ptr [ebp+8]
 006EAA9E    fstp        dword ptr [esi+76]
 006EAAA1    wait
>006EAAA2    jmp         006EAAA6
 006EAAA4    xor         ebx,ebx
 006EAAA6    mov         eax,ebx
 006EAAA8    pop         edi
 006EAAA9    pop         esi
 006EAAAA    pop         ebx
 006EAAAB    pop         ebp
 006EAAAC    ret         8
end;*}

//006EAAB8
{*function TD3DValue.SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;
begin
 006EAAB8    push        ebp
 006EAAB9    mov         ebp,esp
 006EAABB    push        ebx
 006EAABC    push        esi
 006EAABD    push        edi
 006EAABE    mov         ebx,eax
 006EAAC0    mov         esi,dword ptr [ebx+18];TD3DValue...........................................................
 006EAAC3    test        esi,esi
>006EAAC5    jl          006EAAD1
 006EAAC7    mov         eax,[00822738];gvar_00822738:TObjectList
 006EAACC    cmp         esi,dword ptr [eax+8]
>006EAACF    jl          006EAAD5
 006EAAD1    mov         al,1
>006EAAD3    jmp         006EAAE9
 006EAAD5    mov         edi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EAADB    mov         edx,esi
 006EAADD    mov         eax,edi
 006EAADF    call        TList.Get
 006EAAE4    test        eax,eax
 006EAAE6    sete        al
 006EAAE9    test        al,al
>006EAAEB    je          006EAAF4
 006EAAED    xor         edx,edx
>006EAAEF    jmp         006EAB78
 006EAAF4    mov         esi,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EAAFA    mov         edx,dword ptr [ebx+18];TD3DValue...........................................................
 006EAAFD    mov         eax,esi
 006EAAFF    call        TList.Get
 006EAB04    mov         dl,1
 006EAB06    mov         ecx,dword ptr [ebx+20];TD3DValue...............................................Item:Inte...
 006EAB09    sub         ecx,4
>006EAB0C    je          006EAB2F
 006EAB0E    dec         ecx
>006EAB0F    je          006EAB18
 006EAB11    sub         ecx,6
>006EAB14    je          006EAB46
>006EAB16    jmp         006EAB5D
 006EAB18    fld         qword ptr [ebp+18]
 006EAB1B    fstp        dword ptr [eax+6A]
 006EAB1E    wait
 006EAB1F    fld         qword ptr [ebp+10]
 006EAB22    fstp        dword ptr [eax+6E]
 006EAB25    wait
 006EAB26    fld         qword ptr [ebp+8]
 006EAB29    fstp        dword ptr [eax+72]
 006EAB2C    wait
>006EAB2D    jmp         006EAB78
 006EAB2F    fld         qword ptr [ebp+18]
 006EAB32    fstp        dword ptr [eax+4]
 006EAB35    wait
 006EAB36    fld         qword ptr [ebp+10]
 006EAB39    fstp        dword ptr [eax+8]
 006EAB3C    wait
 006EAB3D    fld         qword ptr [ebp+8]
 006EAB40    fstp        dword ptr [eax+0C]
 006EAB43    wait
>006EAB44    jmp         006EAB78
 006EAB46    fld         qword ptr [ebp+18]
 006EAB49    fstp        dword ptr [eax+10]
 006EAB4C    wait
 006EAB4D    fld         qword ptr [ebp+10]
 006EAB50    fstp        dword ptr [eax+14]
 006EAB53    wait
 006EAB54    fld         qword ptr [ebp+8]
 006EAB57    fstp        dword ptr [eax+18]
 006EAB5A    wait
>006EAB5B    jmp         006EAB78
 006EAB5D    push        dword ptr [ebp+1C]
 006EAB60    push        dword ptr [ebp+18]
 006EAB63    push        dword ptr [ebp+14]
 006EAB66    push        dword ptr [ebp+10]
 006EAB69    push        dword ptr [ebp+0C]
 006EAB6C    push        dword ptr [ebp+8]
 006EAB6F    mov         eax,ebx
 006EAB71    call        TExpression.SetVector
 006EAB76    mov         edx,eax
 006EAB78    mov         eax,edx
 006EAB7A    pop         edi
 006EAB7B    pop         esi
 006EAB7C    pop         ebx
 006EAB7D    pop         ebp
 006EAB7E    ret         18
end;*}

//006EAB84
{*procedure TD3DValue.ToString(?:?);
begin
 006EAB84    push        ebp
 006EAB85    mov         ebp,esp
 006EAB87    push        0
 006EAB89    push        0
 006EAB8B    push        0
 006EAB8D    push        ebx
 006EAB8E    push        esi
 006EAB8F    push        edi
 006EAB90    mov         esi,edx
 006EAB92    mov         ebx,eax
 006EAB94    xor         eax,eax
 006EAB96    push        ebp
 006EAB97    push        6EAC11
 006EAB9C    push        dword ptr fs:[eax]
 006EAB9F    mov         dword ptr fs:[eax],esp
 006EABA2    mov         edi,dword ptr [ebx+18];TD3DValue...........................................................
 006EABA5    test        edi,edi
>006EABA7    jle         006EABDC
 006EABA9    push        6EAC2C;'D3D'
 006EABAE    lea         edx,[ebp-4]
 006EABB1    mov         eax,edi
 006EABB3    call        IntToStr
 006EABB8    push        dword ptr [ebp-4]
 006EABBB    push        6EAC40;'.'
 006EABC0    lea         edx,[ebp-8]
 006EABC3    mov         eax,dword ptr [ebx+20];TD3DValue................................................Item:Int...
 006EABC6    call        006EBA38
 006EABCB    push        dword ptr [ebp-8]
 006EABCE    mov         eax,esi
 006EABD0    mov         edx,4
 006EABD5    call        @UStrCatN
>006EABDA    jmp         006EABF6
 006EABDC    lea         edx,[ebp-0C]
 006EABDF    mov         eax,dword ptr [ebx+20];TD3DValue.................................................Item:In...
 006EABE2    call        006EBA38
 006EABE7    mov         ecx,dword ptr [ebp-0C]
 006EABEA    mov         eax,esi
 006EABEC    mov         edx,6EAC50;'D3D.'
 006EABF1    call        @UStrCat3
 006EABF6    xor         eax,eax
 006EABF8    pop         edx
 006EABF9    pop         ecx
 006EABFA    pop         ecx
 006EABFB    mov         dword ptr fs:[eax],edx
 006EABFE    push        6EAC18
 006EAC03    lea         eax,[ebp-0C]
 006EAC06    mov         edx,3
 006EAC0B    call        @UStrArrayClr
 006EAC10    ret
>006EAC11    jmp         @HandleFinally
>006EAC16    jmp         006EAC03
 006EAC18    pop         edi
 006EAC19    pop         esi
 006EAC1A    pop         ebx
 006EAC1B    mov         esp,ebp
 006EAC1D    pop         ebp
 006EAC1E    ret
end;*}

//006EAC5C
procedure sub_006EAC5C;
begin
{*
 006EAC5C    mov         eax,[00822738];gvar_00822738:TObjectList
 006EAC61    xor         edx,edx
 006EAC63    mov         dword ptr ds:[822738],edx;gvar_00822738:TObjectList
 006EAC69    call        TObject.Free
 006EAC6E    mov         cl,1
 006EAC70    mov         dl,1
 006EAC72    mov         eax,[00471630];TObjectList
 006EAC77    call        TObjectList.Create;TObjectList.Create
 006EAC7C    mov         [00822738],eax;gvar_00822738:TObjectList
 006EAC81    mov         cl,1
 006EAC83    mov         dl,1
 006EAC85    mov         eax,[00471630];TObjectList
 006EAC8A    call        TObjectList.Create;TObjectList.Create
 006EAC8F    mov         [0082273C],eax;gvar_0082273C:TObjectList
 006EAC94    mov         byte ptr ds:[822730],0;gvar_00822730
 006EAC9B    ret
*}
end;

//006EAC9C
procedure sub_006EAC9C;
begin
{*
 006EAC9C    ret
*}
end;

//006EACA0
{*procedure sub_006EACA0(?:?; ?:?; ?:?);
begin
 006EACA0    push        ebx
 006EACA1    push        esi
 006EACA2    push        edi
 006EACA3    push        ebp
 006EACA4    add         esp,0FFFFFE04
 006EACAA    mov         ebx,ecx
 006EACAC    mov         esi,esp
 006EACAE    lea         edi,[esp+4C]
 006EACB2    lea         ebp,[esp+0A0]
 006EACB9    push        0
 006EACBB    mov         eax,78C368;gvar_0078C368:IInterface
 006EACC0    call        @IntfClear
 006EACC5    push        eax
 006EACC6    push        0
 006EACC8    push        12
 006EACCA    push        0
 006EACCC    push        960
 006EACD1    push        ebx
 006EACD2    mov         eax,dword ptr [ebx]
 006EACD4    call        dword ptr [eax+68]
 006EACD7    test        eax,80000000
 006EACDC    setne       al
 006EACDF    neg         al
 006EACE1    sbb         eax,eax
 006EACE3    test        eax,eax
>006EACE5    je          006EACF6
 006EACE7    mov         eax,78C368;gvar_0078C368:IInterface
 006EACEC    call        @IntfClear
>006EACF1    jmp         006EB852
 006EACF6    push        0
 006EACF8    push        esi
 006EACF9    push        0
 006EACFB    push        0
 006EACFD    mov         eax,[0078C368];0x0 gvar_0078C368:IInterface
 006EAD02    push        eax
 006EAD03    mov         eax,dword ptr [eax]
 006EAD05    call        dword ptr [eax+2C]
 006EAD08    test        eax,80000000
 006EAD0D    setne       al
 006EAD10    neg         al
 006EAD12    sbb         eax,eax
 006EAD14    test        eax,eax
>006EAD16    jne         006EB852
 006EAD1C    mov         dword ptr [esp+4],0BF000000
 006EAD24    mov         dword ptr [esp+8],3F000000
 006EAD2C    mov         dword ptr [esp+0C],0BF000000
 006EAD34    mov         eax,dword ptr [esi]
 006EAD36    mov         edx,dword ptr [esp+4]
 006EAD3A    mov         dword ptr [eax],edx
 006EAD3C    mov         edx,dword ptr [esp+8]
 006EAD40    mov         dword ptr [eax+4],edx
 006EAD43    mov         edx,dword ptr [esp+0C]
 006EAD47    mov         dword ptr [eax+8],edx
 006EAD4A    mov         dword ptr [esp+10],3F000000
 006EAD52    mov         dword ptr [esp+14],3F000000
 006EAD5A    mov         dword ptr [esp+18],0BF000000
 006EAD62    mov         eax,dword ptr [esi]
 006EAD64    mov         edx,dword ptr [esp+10]
 006EAD68    mov         dword ptr [eax+18],edx
 006EAD6B    mov         edx,dword ptr [esp+14]
 006EAD6F    mov         dword ptr [eax+1C],edx
 006EAD72    mov         edx,dword ptr [esp+18]
 006EAD76    mov         dword ptr [eax+20],edx
 006EAD79    mov         dword ptr [esp+1C],0BF000000
 006EAD81    mov         dword ptr [esp+20],0BF000000
 006EAD89    mov         dword ptr [esp+24],0BF000000
 006EAD91    mov         eax,dword ptr [esi]
 006EAD93    mov         edx,dword ptr [esp+1C]
 006EAD97    mov         dword ptr [eax+30],edx
 006EAD9A    mov         edx,dword ptr [esp+20]
 006EAD9E    mov         dword ptr [eax+34],edx
 006EADA1    mov         edx,dword ptr [esp+24]
 006EADA5    mov         dword ptr [eax+38],edx
 006EADA8    mov         dword ptr [esp+28],3F000000
 006EADB0    mov         dword ptr [esp+2C],3F000000
 006EADB8    mov         dword ptr [esp+30],0BF000000
 006EADC0    mov         eax,dword ptr [esi]
 006EADC2    mov         edx,dword ptr [esp+28]
 006EADC6    mov         dword ptr [eax+48],edx
 006EADC9    mov         edx,dword ptr [esp+2C]
 006EADCD    mov         dword ptr [eax+4C],edx
 006EADD0    mov         edx,dword ptr [esp+30]
 006EADD4    mov         dword ptr [eax+50],edx
 006EADD7    mov         dword ptr [esp+34],3F000000
 006EADDF    mov         dword ptr [esp+38],0BF000000
 006EADE7    mov         dword ptr [esp+3C],0BF000000
 006EADEF    mov         eax,dword ptr [esi]
 006EADF1    mov         edx,dword ptr [esp+34]
 006EADF5    mov         dword ptr [eax+60],edx
 006EADF8    mov         edx,dword ptr [esp+38]
 006EADFC    mov         dword ptr [eax+64],edx
 006EADFF    mov         edx,dword ptr [esp+3C]
 006EAE03    mov         dword ptr [eax+68],edx
 006EAE06    mov         dword ptr [esp+40],0BF000000
 006EAE0E    mov         dword ptr [esp+44],0BF000000
 006EAE16    mov         dword ptr [esp+48],0BF000000
 006EAE1E    mov         eax,dword ptr [esi]
 006EAE20    mov         edx,dword ptr [esp+40]
 006EAE24    mov         dword ptr [eax+78],edx
 006EAE27    mov         edx,dword ptr [esp+44]
 006EAE2B    mov         dword ptr [eax+7C],edx
 006EAE2E    mov         edx,dword ptr [esp+48]
 006EAE32    mov         dword ptr [eax+80],edx
 006EAE38    xor         eax,eax
 006EAE3A    xor         edx,edx
 006EAE3C    mov         dword ptr [edi],edx
 006EAE3E    xor         edx,edx
 006EAE40    mov         dword ptr [edi+4],edx
 006EAE43    mov         dword ptr [edi+8],0BF800000
 006EAE4A    lea         edx,[eax+eax*2]
 006EAE4D    mov         ecx,dword ptr [esi]
 006EAE4F    mov         ebx,dword ptr [edi]
 006EAE51    mov         dword ptr [ecx+edx*8+0C],ebx
 006EAE55    mov         ebx,dword ptr [edi+4]
 006EAE58    mov         dword ptr [ecx+edx*8+10],ebx
 006EAE5C    mov         ebx,dword ptr [edi+8]
 006EAE5F    mov         dword ptr [ecx+edx*8+14],ebx
 006EAE63    inc         eax
 006EAE64    cmp         eax,6
>006EAE67    jne         006EAE3A
 006EAE69    mov         dword ptr [esp+58],3F000000
 006EAE71    mov         dword ptr [esp+5C],3F000000
 006EAE79    mov         dword ptr [esp+60],0BF000000
 006EAE81    mov         eax,dword ptr [esi]
 006EAE83    mov         edx,dword ptr [esp+58]
 006EAE87    mov         dword ptr [eax+90],edx
 006EAE8D    mov         edx,dword ptr [esp+5C]
 006EAE91    mov         dword ptr [eax+94],edx
 006EAE97    mov         edx,dword ptr [esp+60]
 006EAE9B    mov         dword ptr [eax+98],edx
 006EAEA1    mov         dword ptr [esp+64],3F000000
 006EAEA9    mov         dword ptr [esp+68],3F000000
 006EAEB1    mov         dword ptr [esp+6C],3F000000
 006EAEB9    mov         eax,dword ptr [esi]
 006EAEBB    mov         edx,dword ptr [esp+64]
 006EAEBF    mov         dword ptr [eax+0A8],edx
 006EAEC5    mov         edx,dword ptr [esp+68]
 006EAEC9    mov         dword ptr [eax+0AC],edx
 006EAECF    mov         edx,dword ptr [esp+6C]
 006EAED3    mov         dword ptr [eax+0B0],edx
 006EAED9    mov         dword ptr [esp+70],3F000000
 006EAEE1    mov         dword ptr [esp+74],0BF000000
 006EAEE9    mov         dword ptr [esp+78],0BF000000
 006EAEF1    mov         eax,dword ptr [esi]
 006EAEF3    mov         edx,dword ptr [esp+70]
 006EAEF7    mov         dword ptr [eax+0C0],edx
 006EAEFD    mov         edx,dword ptr [esp+74]
 006EAF01    mov         dword ptr [eax+0C4],edx
 006EAF07    mov         edx,dword ptr [esp+78]
 006EAF0B    mov         dword ptr [eax+0C8],edx
 006EAF11    mov         dword ptr [esp+7C],3F000000
 006EAF19    mov         dword ptr [esp+80],3F000000
 006EAF24    mov         dword ptr [esp+84],3F000000
 006EAF2F    mov         eax,dword ptr [esi]
 006EAF31    mov         edx,dword ptr [esp+7C]
 006EAF35    mov         dword ptr [eax+0D8],edx
 006EAF3B    mov         edx,dword ptr [esp+80]
 006EAF42    mov         dword ptr [eax+0DC],edx
 006EAF48    mov         edx,dword ptr [esp+84]
 006EAF4F    mov         dword ptr [eax+0E0],edx
 006EAF55    mov         dword ptr [esp+88],3F000000
 006EAF60    mov         dword ptr [esp+8C],0BF000000
 006EAF6B    mov         dword ptr [esp+90],3F000000
 006EAF76    mov         eax,dword ptr [esi]
 006EAF78    mov         edx,dword ptr [esp+88]
 006EAF7F    mov         dword ptr [eax+0F0],edx
 006EAF85    mov         edx,dword ptr [esp+8C]
 006EAF8C    mov         dword ptr [eax+0F4],edx
 006EAF92    mov         edx,dword ptr [esp+90]
 006EAF99    mov         dword ptr [eax+0F8],edx
 006EAF9F    mov         dword ptr [esp+94],3F000000
 006EAFAA    mov         dword ptr [esp+98],0BF000000
 006EAFB5    mov         dword ptr [esp+9C],0BF000000
 006EAFC0    mov         eax,dword ptr [esi]
 006EAFC2    mov         edx,dword ptr [esp+94]
 006EAFC9    mov         dword ptr [eax+108],edx
 006EAFCF    mov         edx,dword ptr [esp+98]
 006EAFD6    mov         dword ptr [eax+10C],edx
 006EAFDC    mov         edx,dword ptr [esp+9C]
 006EAFE3    mov         dword ptr [eax+110],edx
 006EAFE9    mov         eax,6
 006EAFEE    mov         dword ptr [ebp],3F800000
 006EAFF5    xor         edx,edx
 006EAFF7    mov         dword ptr [ebp+4],edx
 006EAFFA    xor         edx,edx
 006EAFFC    mov         dword ptr [ebp+8],edx
 006EAFFF    lea         edx,[eax+eax*2]
 006EB002    mov         ecx,dword ptr [esi]
 006EB004    mov         ebx,dword ptr [ebp]
 006EB007    mov         dword ptr [ecx+edx*8+0C],ebx
 006EB00B    mov         ebx,dword ptr [ebp+4]
 006EB00E    mov         dword ptr [ecx+edx*8+10],ebx
 006EB012    mov         ebx,dword ptr [ebp+8]
 006EB015    mov         dword ptr [ecx+edx*8+14],ebx
 006EB019    inc         eax
 006EB01A    cmp         eax,0C
>006EB01D    jne         006EAFEE
 006EB01F    mov         dword ptr [esp+0AC],0BF000000
 006EB02A    mov         dword ptr [esp+0B0],3F000000
 006EB035    mov         dword ptr [esp+0B4],3F000000
 006EB040    mov         eax,dword ptr [esi]
 006EB042    mov         edx,dword ptr [esp+0AC]
 006EB049    mov         dword ptr [eax+120],edx
 006EB04F    mov         edx,dword ptr [esp+0B0]
 006EB056    mov         dword ptr [eax+124],edx
 006EB05C    mov         edx,dword ptr [esp+0B4]
 006EB063    mov         dword ptr [eax+128],edx
 006EB069    mov         dword ptr [esp+0B8],3F000000
 006EB074    mov         dword ptr [esp+0BC],3F000000
 006EB07F    mov         dword ptr [esp+0C0],3F000000
 006EB08A    mov         eax,dword ptr [esi]
 006EB08C    mov         edx,dword ptr [esp+0B8]
 006EB093    mov         dword ptr [eax+138],edx
 006EB099    mov         edx,dword ptr [esp+0BC]
 006EB0A0    mov         dword ptr [eax+13C],edx
 006EB0A6    mov         edx,dword ptr [esp+0C0]
 006EB0AD    mov         dword ptr [eax+140],edx
 006EB0B3    mov         dword ptr [esp+0C4],0BF000000
 006EB0BE    mov         dword ptr [esp+0C8],3F000000
 006EB0C9    mov         dword ptr [esp+0CC],0BF000000
 006EB0D4    mov         eax,dword ptr [esi]
 006EB0D6    mov         edx,dword ptr [esp+0C4]
 006EB0DD    mov         dword ptr [eax+150],edx
 006EB0E3    mov         edx,dword ptr [esp+0C8]
 006EB0EA    mov         dword ptr [eax+154],edx
 006EB0F0    mov         edx,dword ptr [esp+0CC]
 006EB0F7    mov         dword ptr [eax+158],edx
 006EB0FD    mov         dword ptr [esp+0D0],3F000000
 006EB108    mov         dword ptr [esp+0D4],3F000000
 006EB113    mov         dword ptr [esp+0D8],3F000000
 006EB11E    mov         eax,dword ptr [esi]
 006EB120    mov         edx,dword ptr [esp+0D0]
 006EB127    mov         dword ptr [eax+168],edx
 006EB12D    mov         edx,dword ptr [esp+0D4]
 006EB134    mov         dword ptr [eax+16C],edx
 006EB13A    mov         edx,dword ptr [esp+0D8]
 006EB141    mov         dword ptr [eax+170],edx
 006EB147    mov         dword ptr [esp+0DC],3F000000
 006EB152    mov         dword ptr [esp+0E0],3F000000
 006EB15D    mov         dword ptr [esp+0E4],0BF000000
 006EB168    mov         eax,dword ptr [esi]
 006EB16A    mov         edx,dword ptr [esp+0DC]
 006EB171    mov         dword ptr [eax+180],edx
 006EB177    mov         edx,dword ptr [esp+0E0]
 006EB17E    mov         dword ptr [eax+184],edx
 006EB184    mov         edx,dword ptr [esp+0E4]
 006EB18B    mov         dword ptr [eax+188],edx
 006EB191    mov         dword ptr [esp+0E8],0BF000000
 006EB19C    mov         dword ptr [esp+0EC],3F000000
 006EB1A7    mov         dword ptr [esp+0F0],0BF000000
 006EB1B2    mov         eax,dword ptr [esi]
 006EB1B4    mov         edx,dword ptr [esp+0E8]
 006EB1BB    mov         dword ptr [eax+198],edx
 006EB1C1    mov         edx,dword ptr [esp+0EC]
 006EB1C8    mov         dword ptr [eax+19C],edx
 006EB1CE    mov         edx,dword ptr [esp+0F0]
 006EB1D5    mov         dword ptr [eax+1A0],edx
 006EB1DB    mov         eax,0C
 006EB1E0    xor         edx,edx
 006EB1E2    mov         dword ptr [esp+0F4],edx
 006EB1E9    mov         dword ptr [esp+0F8],3F800000
 006EB1F4    xor         edx,edx
 006EB1F6    mov         dword ptr [esp+0FC],edx
 006EB1FD    lea         edx,[eax+eax*2]
 006EB200    mov         ecx,dword ptr [esi]
 006EB202    mov         ebx,dword ptr [esp+0F4]
 006EB209    mov         dword ptr [ecx+edx*8+0C],ebx
 006EB20D    mov         ebx,dword ptr [esp+0F8]
 006EB214    mov         dword ptr [ecx+edx*8+10],ebx
 006EB218    mov         ebx,dword ptr [esp+0FC]
 006EB21F    mov         dword ptr [ecx+edx*8+14],ebx
 006EB223    inc         eax
 006EB224    cmp         eax,12
>006EB227    jne         006EB1E0
 006EB229    mov         dword ptr [esp+100],0BF000000
 006EB234    mov         dword ptr [esp+104],3F000000
 006EB23F    mov         dword ptr [esp+108],3F000000
 006EB24A    mov         eax,dword ptr [esi]
 006EB24C    mov         edx,dword ptr [esp+100]
 006EB253    mov         dword ptr [eax+1C8],edx
 006EB259    mov         edx,dword ptr [esp+104]
 006EB260    mov         dword ptr [eax+1CC],edx
 006EB266    mov         edx,dword ptr [esp+108]
 006EB26D    mov         dword ptr [eax+1D0],edx
 006EB273    mov         dword ptr [esp+10C],3F000000
 006EB27E    mov         dword ptr [esp+110],3F000000
 006EB289    mov         dword ptr [esp+114],3F000000
 006EB294    mov         eax,dword ptr [esi]
 006EB296    mov         edx,dword ptr [esp+10C]
 006EB29D    mov         dword ptr [eax+1B0],edx
 006EB2A3    mov         edx,dword ptr [esp+110]
 006EB2AA    mov         dword ptr [eax+1B4],edx
 006EB2B0    mov         edx,dword ptr [esp+114]
 006EB2B7    mov         dword ptr [eax+1B8],edx
 006EB2BD    mov         dword ptr [esp+118],0BF000000
 006EB2C8    mov         dword ptr [esp+11C],0BF000000
 006EB2D3    mov         dword ptr [esp+120],3F000000
 006EB2DE    mov         eax,dword ptr [esi]
 006EB2E0    mov         edx,dword ptr [esp+118]
 006EB2E7    mov         dword ptr [eax+1E0],edx
 006EB2ED    mov         edx,dword ptr [esp+11C]
 006EB2F4    mov         dword ptr [eax+1E4],edx
 006EB2FA    mov         edx,dword ptr [esp+120]
 006EB301    mov         dword ptr [eax+1E8],edx
 006EB307    mov         dword ptr [esp+124],3F000000
 006EB312    mov         dword ptr [esp+128],3F000000
 006EB31D    mov         dword ptr [esp+12C],3F000000
 006EB328    mov         eax,dword ptr [esi]
 006EB32A    mov         edx,dword ptr [esp+124]
 006EB331    mov         dword ptr [eax+210],edx
 006EB337    mov         edx,dword ptr [esp+128]
 006EB33E    mov         dword ptr [eax+214],edx
 006EB344    mov         edx,dword ptr [esp+12C]
 006EB34B    mov         dword ptr [eax+218],edx
 006EB351    mov         dword ptr [esp+130],3F000000
 006EB35C    mov         dword ptr [esp+134],0BF000000
 006EB367    mov         dword ptr [esp+138],3F000000
 006EB372    mov         eax,dword ptr [esi]
 006EB374    mov         edx,dword ptr [esp+130]
 006EB37B    mov         dword ptr [eax+1F8],edx
 006EB381    mov         edx,dword ptr [esp+134]
 006EB388    mov         dword ptr [eax+1FC],edx
 006EB38E    mov         edx,dword ptr [esp+138]
 006EB395    mov         dword ptr [eax+200],edx
 006EB39B    mov         dword ptr [esp+13C],0BF000000
 006EB3A6    mov         dword ptr [esp+140],0BF000000
 006EB3B1    mov         dword ptr [esp+144],3F000000
 006EB3BC    mov         eax,dword ptr [esi]
 006EB3BE    mov         edx,dword ptr [esp+13C]
 006EB3C5    mov         dword ptr [eax+228],edx
 006EB3CB    mov         edx,dword ptr [esp+140]
 006EB3D2    mov         dword ptr [eax+22C],edx
 006EB3D8    mov         edx,dword ptr [esp+144]
 006EB3DF    mov         dword ptr [eax+230],edx
 006EB3E5    mov         eax,12
 006EB3EA    xor         edx,edx
 006EB3EC    mov         dword ptr [esp+148],edx
 006EB3F3    xor         edx,edx
 006EB3F5    mov         dword ptr [esp+14C],edx
 006EB3FC    mov         dword ptr [esp+150],3F800000
 006EB407    lea         edx,[eax+eax*2]
 006EB40A    mov         ecx,dword ptr [esi]
 006EB40C    mov         ebx,dword ptr [esp+148]
 006EB413    mov         dword ptr [ecx+edx*8+0C],ebx
 006EB417    mov         ebx,dword ptr [esp+14C]
 006EB41E    mov         dword ptr [ecx+edx*8+10],ebx
 006EB422    mov         ebx,dword ptr [esp+150]
 006EB429    mov         dword ptr [ecx+edx*8+14],ebx
 006EB42D    inc         eax
 006EB42E    cmp         eax,18
>006EB431    jne         006EB3EA
 006EB433    mov         dword ptr [esp+154],0BF000000
 006EB43E    mov         dword ptr [esp+158],3F000000
 006EB449    mov         dword ptr [esp+15C],0BF000000
 006EB454    mov         eax,dword ptr [esi]
 006EB456    mov         edx,dword ptr [esp+154]
 006EB45D    mov         dword ptr [eax+258],edx
 006EB463    mov         edx,dword ptr [esp+158]
 006EB46A    mov         dword ptr [eax+25C],edx
 006EB470    mov         edx,dword ptr [esp+15C]
 006EB477    mov         dword ptr [eax+260],edx
 006EB47D    mov         dword ptr [esp+160],0BF000000
 006EB488    mov         dword ptr [esp+164],3F000000
 006EB493    mov         dword ptr [esp+168],3F000000
 006EB49E    mov         eax,dword ptr [esi]
 006EB4A0    mov         edx,dword ptr [esp+160]
 006EB4A7    mov         dword ptr [eax+240],edx
 006EB4AD    mov         edx,dword ptr [esp+164]
 006EB4B4    mov         dword ptr [eax+244],edx
 006EB4BA    mov         edx,dword ptr [esp+168]
 006EB4C1    mov         dword ptr [eax+248],edx
 006EB4C7    mov         dword ptr [esp+16C],0BF000000
 006EB4D2    mov         dword ptr [esp+170],0BF000000
 006EB4DD    mov         dword ptr [esp+174],0BF000000
 006EB4E8    mov         eax,dword ptr [esi]
 006EB4EA    mov         edx,dword ptr [esp+16C]
 006EB4F1    mov         dword ptr [eax+270],edx
 006EB4F7    mov         edx,dword ptr [esp+170]
 006EB4FE    mov         dword ptr [eax+274],edx
 006EB504    mov         edx,dword ptr [esp+174]
 006EB50B    mov         dword ptr [eax+278],edx
 006EB511    mov         dword ptr [esp+178],0BF000000
 006EB51C    mov         dword ptr [esp+17C],3F000000
 006EB527    mov         dword ptr [esp+180],3F000000
 006EB532    mov         eax,dword ptr [esi]
 006EB534    mov         edx,dword ptr [esp+178]
 006EB53B    mov         dword ptr [eax+2A0],edx
 006EB541    mov         edx,dword ptr [esp+17C]
 006EB548    mov         dword ptr [eax+2A4],edx
 006EB54E    mov         edx,dword ptr [esp+180]
 006EB555    mov         dword ptr [eax+2A8],edx
 006EB55B    mov         dword ptr [esp+184],0BF000000
 006EB566    mov         dword ptr [esp+188],0BF000000
 006EB571    mov         dword ptr [esp+18C],3F000000
 006EB57C    mov         eax,dword ptr [esi]
 006EB57E    mov         edx,dword ptr [esp+184]
 006EB585    mov         dword ptr [eax+288],edx
 006EB58B    mov         edx,dword ptr [esp+188]
 006EB592    mov         dword ptr [eax+28C],edx
 006EB598    mov         edx,dword ptr [esp+18C]
 006EB59F    mov         dword ptr [eax+290],edx
 006EB5A5    mov         dword ptr [esp+190],0BF000000
 006EB5B0    mov         dword ptr [esp+194],0BF000000
 006EB5BB    mov         dword ptr [esp+198],0BF000000
 006EB5C6    mov         eax,dword ptr [esi]
 006EB5C8    mov         edx,dword ptr [esp+190]
 006EB5CF    mov         dword ptr [eax+2B8],edx
 006EB5D5    mov         edx,dword ptr [esp+194]
 006EB5DC    mov         dword ptr [eax+2BC],edx
 006EB5E2    mov         edx,dword ptr [esp+198]
 006EB5E9    mov         dword ptr [eax+2C0],edx
 006EB5EF    mov         eax,18
 006EB5F4    mov         dword ptr [esp+19C],0BF800000
 006EB5FF    xor         edx,edx
 006EB601    mov         dword ptr [esp+1A0],edx
 006EB608    xor         edx,edx
 006EB60A    mov         dword ptr [esp+1A4],edx
 006EB611    lea         edx,[eax+eax*2]
 006EB614    mov         ecx,dword ptr [esi]
 006EB616    mov         ebx,dword ptr [esp+19C]
 006EB61D    mov         dword ptr [ecx+edx*8+0C],ebx
 006EB621    mov         ebx,dword ptr [esp+1A0]
 006EB628    mov         dword ptr [ecx+edx*8+10],ebx
 006EB62C    mov         ebx,dword ptr [esp+1A4]
 006EB633    mov         dword ptr [ecx+edx*8+14],ebx
 006EB637    inc         eax
 006EB638    cmp         eax,1E
>006EB63B    jne         006EB5F4
 006EB63D    mov         dword ptr [esp+1A8],0BF000000
 006EB648    mov         dword ptr [esp+1AC],0BF000000
 006EB653    mov         dword ptr [esp+1B0],3F000000
 006EB65E    mov         eax,dword ptr [esi]
 006EB660    mov         edx,dword ptr [esp+1A8]
 006EB667    mov         dword ptr [eax+2E8],edx
 006EB66D    mov         edx,dword ptr [esp+1AC]
 006EB674    mov         dword ptr [eax+2EC],edx
 006EB67A    mov         edx,dword ptr [esp+1B0]
 006EB681    mov         dword ptr [eax+2F0],edx
 006EB687    mov         dword ptr [esp+1B4],3F000000
 006EB692    mov         dword ptr [esp+1B8],0BF000000
 006EB69D    mov         dword ptr [esp+1BC],3F000000
 006EB6A8    mov         eax,dword ptr [esi]
 006EB6AA    mov         edx,dword ptr [esp+1B4]
 006EB6B1    mov         dword ptr [eax+2D0],edx
 006EB6B7    mov         edx,dword ptr [esp+1B8]
 006EB6BE    mov         dword ptr [eax+2D4],edx
 006EB6C4    mov         edx,dword ptr [esp+1BC]
 006EB6CB    mov         dword ptr [eax+2D8],edx
 006EB6D1    mov         dword ptr [esp+1C0],0BF000000
 006EB6DC    mov         dword ptr [esp+1C4],0BF000000
 006EB6E7    mov         dword ptr [esp+1C8],0BF000000
 006EB6F2    mov         eax,dword ptr [esi]
 006EB6F4    mov         edx,dword ptr [esp+1C0]
 006EB6FB    mov         dword ptr [eax+300],edx
 006EB701    mov         edx,dword ptr [esp+1C4]
 006EB708    mov         dword ptr [eax+304],edx
 006EB70E    mov         edx,dword ptr [esp+1C8]
 006EB715    mov         dword ptr [eax+308],edx
 006EB71B    mov         dword ptr [esp+1CC],3F000000
 006EB726    mov         dword ptr [esp+1D0],0BF000000
 006EB731    mov         dword ptr [esp+1D4],3F000000
 006EB73C    mov         eax,dword ptr [esi]
 006EB73E    mov         edx,dword ptr [esp+1CC]
 006EB745    mov         dword ptr [eax+330],edx
 006EB74B    mov         edx,dword ptr [esp+1D0]
 006EB752    mov         dword ptr [eax+334],edx
 006EB758    mov         edx,dword ptr [esp+1D4]
 006EB75F    mov         dword ptr [eax+338],edx
 006EB765    mov         dword ptr [esp+1D8],3F000000
 006EB770    mov         dword ptr [esp+1DC],0BF000000
 006EB77B    mov         dword ptr [esp+1E0],0BF000000
 006EB786    mov         eax,dword ptr [esi]
 006EB788    mov         edx,dword ptr [esp+1D8]
 006EB78F    mov         dword ptr [eax+318],edx
 006EB795    mov         edx,dword ptr [esp+1DC]
 006EB79C    mov         dword ptr [eax+31C],edx
 006EB7A2    mov         edx,dword ptr [esp+1E0]
 006EB7A9    mov         dword ptr [eax+320],edx
 006EB7AF    mov         dword ptr [esp+1E4],0BF000000
 006EB7BA    mov         dword ptr [esp+1E8],0BF000000
 006EB7C5    mov         dword ptr [esp+1EC],0BF000000
 006EB7D0    mov         eax,dword ptr [esi]
 006EB7D2    mov         edx,dword ptr [esp+1E4]
 006EB7D9    mov         dword ptr [eax+348],edx
 006EB7DF    mov         edx,dword ptr [esp+1E8]
 006EB7E6    mov         dword ptr [eax+34C],edx
 006EB7EC    mov         edx,dword ptr [esp+1EC]
 006EB7F3    mov         dword ptr [eax+350],edx
 006EB7F9    mov         eax,1E
 006EB7FE    xor         edx,edx
 006EB800    mov         dword ptr [esp+1F0],edx
 006EB807    mov         dword ptr [esp+1F4],0BF800000
 006EB812    xor         edx,edx
 006EB814    mov         dword ptr [esp+1F8],edx
 006EB81B    lea         edx,[eax+eax*2]
 006EB81E    mov         ecx,dword ptr [esi]
 006EB820    mov         ebx,dword ptr [esp+1F0]
 006EB827    mov         dword ptr [ecx+edx*8+0C],ebx
 006EB82B    mov         ebx,dword ptr [esp+1F4]
 006EB832    mov         dword ptr [ecx+edx*8+10],ebx
 006EB836    mov         ebx,dword ptr [esp+1F8]
 006EB83D    mov         dword ptr [ecx+edx*8+14],ebx
 006EB841    inc         eax
 006EB842    cmp         eax,24
>006EB845    jne         006EB7FE
 006EB847    mov         eax,[0078C368];0x0 gvar_0078C368:IInterface
 006EB84C    push        eax
 006EB84D    mov         eax,dword ptr [eax]
 006EB84F    call        dword ptr [eax+30]
 006EB852    add         esp,1FC
 006EB858    pop         ebp
 006EB859    pop         edi
 006EB85A    pop         esi
 006EB85B    pop         ebx
 006EB85C    ret
end;*}

//006EB860
procedure sub_006EB860;
begin
{*
 006EB860    push        ebx
 006EB861    cmp         byte ptr ds:[822730],0;gvar_00822730
>006EB868    je          006EB926
 006EB86E    mov         dl,1
 006EB870    mov         eax,[006E9D50];TD3DCamera
 006EB875    call        TD3DCamera.Create;TD3DCamera.Create
 006EB87A    mov         [00822740],eax;gvar_00822740:TD3DCamera
 006EB87F    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006EB884    mov         eax,dword ptr [eax]
 006EB886    mov         eax,dword ptr [eax+5E4]
 006EB88C    call        TControl.BringToFront
 006EB891    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006EB896    mov         eax,dword ptr [eax]
 006EB898    mov         eax,dword ptr [eax+5E4]
 006EB89E    mov         dl,1
 006EB8A0    call        TControl.SetVisible
 006EB8A5    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006EB8AA    mov         eax,dword ptr [eax]
 006EB8AC    mov         eax,dword ptr [eax+5E4]
 006EB8B2    xor         edx,edx
 006EB8B4    mov         dword ptr [eax+2B0],edx
 006EB8BA    mov         edx,dword ptr ds:[78D61C];^gvar_00822CA0:TEditorForm
 006EB8C0    call        TD3D9Panel.Init
 006EB8C5    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006EB8CA    mov         eax,dword ptr [eax]
 006EB8CC    mov         eax,dword ptr [eax+5E4]
 006EB8D2    call        TD3D9Panel.Running
 006EB8D7    mov         [00822731],al;gvar_00822731:Boolean
 006EB8DC    cmp         byte ptr ds:[822731],0;gvar_00822731:Boolean
>006EB8E3    je          006EB926
 006EB8E5    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006EB8EA    mov         eax,dword ptr [eax]
 006EB8EC    mov         eax,dword ptr [eax+5E4]
 006EB8F2    mov         ecx,dword ptr [eax+274]
 006EB8F8    mov         edx,dword ptr ds:[78D61C];^gvar_00822CA0:TEditorForm
 006EB8FE    mov         edx,dword ptr [eax+270]
 006EB904    mov         ebx,dword ptr ds:[78D61C];^gvar_00822CA0:TEditorForm
 006EB90A    call        006EACA0
 006EB90F    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006EB914    mov         eax,dword ptr [eax]
 006EB916    mov         eax,dword ptr [eax+5E4]
 006EB91C    mov         dword ptr [eax+2B0],6EBF68;sub_006EBF68
 006EB926    pop         ebx
 006EB927    ret
*}
end;

//006EB928
procedure sub_006EB928;
begin
{*
 006EB928    movzx       eax,byte ptr ds:[822730];gvar_00822730
 006EB92F    and         al,byte ptr ds:[822731];gvar_00822731:Boolean
>006EB935    je          006EB98A
 006EB937    mov         eax,78C368;gvar_0078C368:IInterface
 006EB93C    call        @IntfClear
 006EB941    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006EB946    mov         eax,dword ptr [eax]
 006EB948    mov         eax,dword ptr [eax+5E4]
 006EB94E    call        TD3D9Panel.Done
 006EB953    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006EB958    mov         eax,dword ptr [eax]
 006EB95A    mov         eax,dword ptr [eax+5E4]
 006EB960    xor         edx,edx
 006EB962    call        TControl.SetVisible
 006EB967    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006EB96C    mov         eax,dword ptr [eax]
 006EB96E    mov         eax,dword ptr [eax+5E4]
 006EB974    call        TControl.SendToBack
 006EB979    mov         eax,[00822740];gvar_00822740:TD3DCamera
 006EB97E    call        TObject.Free
 006EB983    mov         byte ptr ds:[822731],0;gvar_00822731:Boolean
 006EB98A    mov         eax,[00822738];gvar_00822738:TObjectList
 006EB98F    xor         edx,edx
 006EB991    mov         dword ptr ds:[822738],edx;gvar_00822738:TObjectList
 006EB997    call        TObject.Free
 006EB99C    ret
*}
end;

//006EB9A0
{*function sub_006EB9A0:?;
begin
 006EB9A0    push        ebx
 006EB9A1    mov         bl,1
 006EB9A3    movzx       eax,byte ptr ds:[822730];gvar_00822730
 006EB9AA    and         al,byte ptr ds:[822731];gvar_00822731:Boolean
>006EB9B0    je          006EB9E4
 006EB9B2    movzx       eax,byte ptr ds:[822732];gvar_00822732
 006EB9B9    xor         al,1
 006EB9BB    mov         [00822732],al;gvar_00822732
 006EB9C0    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006EB9C5    mov         eax,dword ptr [eax]
 006EB9C7    mov         eax,dword ptr [eax+5E4]
 006EB9CD    call        TD3D9Panel.DoRender
 006EB9D2    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006EB9D7    mov         eax,dword ptr [eax]
 006EB9D9    mov         eax,dword ptr [eax+5E4]
 006EB9DF    call        TD3D9Panel.DoPresent
 006EB9E4    mov         eax,ebx
 006EB9E6    pop         ebx
 006EB9E7    ret
end;*}

//006EB9E8
{*function sub_006EB9E8(?:UnicodeString):?;
begin
 006EB9E8    push        ebp
 006EB9E9    mov         ebp,esp
 006EB9EB    push        ecx
 006EB9EC    push        ebx
 006EB9ED    mov         dword ptr [ebp-4],eax
 006EB9F0    mov         eax,dword ptr [ebp-4]
 006EB9F3    call        @UStrAddRef
 006EB9F8    xor         eax,eax
 006EB9FA    push        ebp
 006EB9FB    push        6EBA2B
 006EBA00    push        dword ptr fs:[eax]
 006EBA03    mov         dword ptr fs:[eax],esp
 006EBA06    mov         edx,dword ptr [ebp-4]
 006EBA09    mov         eax,[00822724];gvar_00822724:THashTable
 006EBA0E    call        THashTable.Get
 006EBA13    mov         ebx,eax
 006EBA15    xor         eax,eax
 006EBA17    pop         edx
 006EBA18    pop         ecx
 006EBA19    pop         ecx
 006EBA1A    mov         dword ptr fs:[eax],edx
 006EBA1D    push        6EBA32
 006EBA22    lea         eax,[ebp-4]
 006EBA25    call        @UStrClr
 006EBA2A    ret
>006EBA2B    jmp         @HandleFinally
>006EBA30    jmp         006EBA22
 006EBA32    mov         eax,ebx
 006EBA34    pop         ebx
 006EBA35    pop         ecx
 006EBA36    pop         ebp
 006EBA37    ret
end;*}

//006EBA38
{*procedure sub_006EBA38(?:Integer; ?:?);
begin
 006EBA38    push        ebx
 006EBA39    push        esi
 006EBA3A    mov         esi,edx
 006EBA3C    mov         ebx,eax
 006EBA3E    mov         ecx,esi
 006EBA40    mov         edx,ebx
 006EBA42    mov         eax,[00822724];gvar_00822724:THashTable
 006EBA47    call        THashTable.Get
 006EBA4C    pop         esi
 006EBA4D    pop         ebx
 006EBA4E    ret
end;*}

//006EBA50
{*function sub_006EBA50:?;
begin
 006EBA50    push        ebp
 006EBA51    mov         ebp,esp
 006EBA53    push        0
 006EBA55    push        ebx
 006EBA56    push        esi
 006EBA57    xor         eax,eax
 006EBA59    push        ebp
 006EBA5A    push        6EBAB4
 006EBA5F    push        dword ptr fs:[eax]
 006EBA62    mov         dword ptr fs:[eax],esp
 006EBA65    mov         dl,1
 006EBA67    mov         eax,[0043C7BC];TStringList
 006EBA6C    call        TStringList.Create;TStringList.Create
 006EBA71    mov         esi,eax
 006EBA73    mov         dl,1
 006EBA75    mov         eax,esi
 006EBA77    call        TStringList.SetSorted
 006EBA7C    xor         ebx,ebx
 006EBA7E    lea         edx,[ebp-4]
 006EBA81    mov         eax,ebx
 006EBA83    call        006EBA38
 006EBA88    cmp         dword ptr [ebp-4],0
>006EBA8C    je          006EBA98
 006EBA8E    mov         edx,dword ptr [ebp-4]
 006EBA91    mov         eax,esi
 006EBA93    mov         ecx,dword ptr [eax]
 006EBA95    call        dword ptr [ecx+38];TStringList.Add
 006EBA98    inc         ebx
 006EBA99    cmp         ebx,0E
>006EBA9C    jne         006EBA7E
 006EBA9E    xor         eax,eax
 006EBAA0    pop         edx
 006EBAA1    pop         ecx
 006EBAA2    pop         ecx
 006EBAA3    mov         dword ptr fs:[eax],edx
 006EBAA6    push        6EBABB
 006EBAAB    lea         eax,[ebp-4]
 006EBAAE    call        @UStrClr
 006EBAB3    ret
>006EBAB4    jmp         @HandleFinally
>006EBAB9    jmp         006EBAAB
 006EBABB    mov         eax,esi
 006EBABD    pop         esi
 006EBABE    pop         ebx
 006EBABF    pop         ecx
 006EBAC0    pop         ebp
 006EBAC1    ret
end;*}

//006EBAC4
{*function sub_006EBAC4(?:?):?;
begin
 006EBAC4    push        ebp
 006EBAC5    mov         ebp,esp
 006EBAC7    push        ecx
 006EBAC8    push        ebx
 006EBAC9    mov         dword ptr [ebp-4],eax
 006EBACC    mov         eax,dword ptr [ebp-4]
 006EBACF    call        @UStrAddRef
 006EBAD4    xor         eax,eax
 006EBAD6    push        ebp
 006EBAD7    push        6EBB4E
 006EBADC    push        dword ptr fs:[eax]
 006EBADF    mov         dword ptr fs:[eax],esp
 006EBAE2    lea         eax,[ebp-4]
 006EBAE5    mov         edx,6EBB68;'D3D'
 006EBAEA    call        004F9BD0
 006EBAEF    test        al,al
>006EBAF1    jne         006EBB19
 006EBAF3    lea         eax,[ebp-4]
 006EBAF6    mov         edx,6EBB7C;'Object'
 006EBAFB    call        004F9BD0
 006EBB00    test        al,al
>006EBB02    jne         006EBB19
 006EBB04    lea         eax,[ebp-4]
 006EBB07    mov         edx,6EBB98;'Obj'
 006EBB0C    call        004F9BD0
 006EBB11    test        al,al
>006EBB13    jne         006EBB19
 006EBB15    xor         ebx,ebx
>006EBB17    jmp         006EBB38
 006EBB19    lea         eax,[ebp-4]
 006EBB1C    call        004F9D00
 006EBB21    lea         eax,[ebp-4]
 006EBB24    mov         edx,6EBBAC;'.'
 006EBB29    call        004F9BD0
 006EBB2E    test        al,al
>006EBB30    jne         006EBB36
 006EBB32    xor         ebx,ebx
>006EBB34    jmp         006EBB38
 006EBB36    mov         bl,1
 006EBB38    xor         eax,eax
 006EBB3A    pop         edx
 006EBB3B    pop         ecx
 006EBB3C    pop         ecx
 006EBB3D    mov         dword ptr fs:[eax],edx
 006EBB40    push        6EBB55
 006EBB45    lea         eax,[ebp-4]
 006EBB48    call        @UStrClr
 006EBB4D    ret
>006EBB4E    jmp         @HandleFinally
>006EBB53    jmp         006EBB45
 006EBB55    mov         eax,ebx
 006EBB57    pop         ebx
 006EBB58    pop         ecx
 006EBB59    pop         ebp
 006EBB5A    ret
end;*}

//006EBBB0
{*function sub_006EBBB0(?:UnicodeString):?;
begin
 006EBBB0    push        ebp
 006EBBB1    mov         ebp,esp
 006EBBB3    push        ecx
 006EBBB4    push        ebx
 006EBBB5    mov         dword ptr [ebp-4],eax
 006EBBB8    mov         eax,dword ptr [ebp-4]
 006EBBBB    call        @UStrAddRef
 006EBBC0    xor         eax,eax
 006EBBC2    push        ebp
 006EBBC3    push        6EBBF3
 006EBBC8    push        dword ptr fs:[eax]
 006EBBCB    mov         dword ptr fs:[eax],esp
 006EBBCE    mov         edx,dword ptr [ebp-4]
 006EBBD1    mov         eax,[0082272C];gvar_0082272C:THashTable
 006EBBD6    call        THashTable.Get
 006EBBDB    mov         ebx,eax
 006EBBDD    xor         eax,eax
 006EBBDF    pop         edx
 006EBBE0    pop         ecx
 006EBBE1    pop         ecx
 006EBBE2    mov         dword ptr fs:[eax],edx
 006EBBE5    push        6EBBFA
 006EBBEA    lea         eax,[ebp-4]
 006EBBED    call        @UStrClr
 006EBBF2    ret
>006EBBF3    jmp         @HandleFinally
>006EBBF8    jmp         006EBBEA
 006EBBFA    mov         eax,ebx
 006EBBFC    pop         ebx
 006EBBFD    pop         ecx
 006EBBFE    pop         ebp
 006EBBFF    ret
end;*}

//006EBC00
{*procedure sub_006EBC00(?:Integer; ?:?);
begin
 006EBC00    push        ebx
 006EBC01    push        esi
 006EBC02    mov         esi,edx
 006EBC04    mov         ebx,eax
 006EBC06    mov         ecx,esi
 006EBC08    mov         edx,ebx
 006EBC0A    mov         eax,[0082272C];gvar_0082272C:THashTable
 006EBC0F    call        THashTable.Get
 006EBC14    pop         esi
 006EBC15    pop         ebx
 006EBC16    ret
end;*}

//006EBC18
{*function sub_006EBC18:?;
begin
 006EBC18    push        ebp
 006EBC19    mov         ebp,esp
 006EBC1B    push        0
 006EBC1D    push        ebx
 006EBC1E    push        esi
 006EBC1F    xor         eax,eax
 006EBC21    push        ebp
 006EBC22    push        6EBC7C
 006EBC27    push        dword ptr fs:[eax]
 006EBC2A    mov         dword ptr fs:[eax],esp
 006EBC2D    mov         dl,1
 006EBC2F    mov         eax,[0043C7BC];TStringList
 006EBC34    call        TStringList.Create;TStringList.Create
 006EBC39    mov         esi,eax
 006EBC3B    mov         dl,1
 006EBC3D    mov         eax,esi
 006EBC3F    call        TStringList.SetSorted
 006EBC44    xor         ebx,ebx
 006EBC46    lea         edx,[ebp-4]
 006EBC49    mov         eax,ebx
 006EBC4B    call        006EBC00
 006EBC50    cmp         dword ptr [ebp-4],0
>006EBC54    je          006EBC60
 006EBC56    mov         edx,dword ptr [ebp-4]
 006EBC59    mov         eax,esi
 006EBC5B    mov         ecx,dword ptr [eax]
 006EBC5D    call        dword ptr [ecx+38];TStringList.Add
 006EBC60    inc         ebx
 006EBC61    cmp         ebx,1E
>006EBC64    jne         006EBC46
 006EBC66    xor         eax,eax
 006EBC68    pop         edx
 006EBC69    pop         ecx
 006EBC6A    pop         ecx
 006EBC6B    mov         dword ptr fs:[eax],edx
 006EBC6E    push        6EBC83
 006EBC73    lea         eax,[ebp-4]
 006EBC76    call        @UStrClr
 006EBC7B    ret
>006EBC7C    jmp         @HandleFinally
>006EBC81    jmp         006EBC73
 006EBC83    mov         eax,esi
 006EBC85    pop         esi
 006EBC86    pop         ebx
 006EBC87    pop         ecx
 006EBC88    pop         ebp
 006EBC89    ret
end;*}

//006EBC8C
{*function sub_006EBC8C(?:?):?;
begin
 006EBC8C    push        ebp
 006EBC8D    mov         ebp,esp
 006EBC8F    push        ecx
 006EBC90    push        ebx
 006EBC91    mov         dword ptr [ebp-4],eax
 006EBC94    mov         eax,dword ptr [ebp-4]
 006EBC97    call        @UStrAddRef
 006EBC9C    xor         eax,eax
 006EBC9E    push        ebp
 006EBC9F    push        6EBD16
 006EBCA4    push        dword ptr fs:[eax]
 006EBCA7    mov         dword ptr fs:[eax],esp
 006EBCAA    lea         eax,[ebp-4]
 006EBCAD    mov         edx,6EBD30;'D3DCamera'
 006EBCB2    call        004F9BD0
 006EBCB7    test        al,al
>006EBCB9    jne         006EBCE1
 006EBCBB    lea         eax,[ebp-4]
 006EBCBE    mov         edx,6EBD50;'Camera'
 006EBCC3    call        004F9BD0
 006EBCC8    test        al,al
>006EBCCA    jne         006EBCE1
 006EBCCC    lea         eax,[ebp-4]
 006EBCCF    mov         edx,6EBD6C;'Cam'
 006EBCD4    call        004F9BD0
 006EBCD9    test        al,al
>006EBCDB    jne         006EBCE1
 006EBCDD    xor         ebx,ebx
>006EBCDF    jmp         006EBD00
 006EBCE1    lea         eax,[ebp-4]
 006EBCE4    call        004F9D00
 006EBCE9    lea         eax,[ebp-4]
 006EBCEC    mov         edx,6EBD80;'.'
 006EBCF1    call        004F9BD0
 006EBCF6    test        al,al
>006EBCF8    jne         006EBCFE
 006EBCFA    xor         ebx,ebx
>006EBCFC    jmp         006EBD00
 006EBCFE    mov         bl,1
 006EBD00    xor         eax,eax
 006EBD02    pop         edx
 006EBD03    pop         ecx
 006EBD04    pop         ecx
 006EBD05    mov         dword ptr fs:[eax],edx
 006EBD08    push        6EBD1D
 006EBD0D    lea         eax,[ebp-4]
 006EBD10    call        @UStrClr
 006EBD15    ret
>006EBD16    jmp         @HandleFinally
>006EBD1B    jmp         006EBD0D
 006EBD1D    mov         eax,ebx
 006EBD1F    pop         ebx
 006EBD20    pop         ecx
 006EBD21    pop         ebp
 006EBD22    ret
end;*}

//006EBD84
{*procedure sub_006EBD84(?:?; ?:?; ?:?);
begin
 006EBD84    push        ebx
 006EBD85    push        esi
 006EBD86    push        edi
 006EBD87    push        ebp
 006EBD88    add         esp,0FFFFFF34
 006EBD8E    mov         ebp,ecx
 006EBD90    xor         eax,eax
 006EBD92    mov         [00822744],eax;gvar_00822744
 006EBD97    lea         eax,[esp+8]
 006EBD9B    xor         ecx,ecx
 006EBD9D    mov         edx,44
 006EBDA2    call        @FillChar
 006EBDA7    mov         dword ptr [esp+8],3F800000
 006EBDAF    mov         dword ptr [esp+18],3F800000
 006EBDB7    mov         dword ptr [esp+0C],3F800000
 006EBDBF    mov         dword ptr [esp+1C],3F800000
 006EBDC7    xor         eax,eax
 006EBDC9    mov         dword ptr [esp+10],eax
 006EBDCD    xor         eax,eax
 006EBDCF    mov         dword ptr [esp+20],eax
 006EBDD3    mov         dword ptr [esp+14],3F800000
 006EBDDB    mov         dword ptr [esp+24],3F800000
 006EBDE3    lea         eax,[esp+8]
 006EBDE7    push        eax
 006EBDE8    push        ebp
 006EBDE9    mov         eax,dword ptr [ebp]
 006EBDEC    call        dword ptr [eax+0C4]
 006EBDF2    mov         eax,[0082273C];gvar_0082273C:TObjectList
 006EBDF7    mov         eax,dword ptr [eax+8]
 006EBDFA    test        eax,eax
>006EBDFC    jle         006EBE3E
 006EBDFE    mov         esi,eax
 006EBE00    dec         esi
 006EBE01    test        esi,esi
>006EBE03    jl          006EBF4C
 006EBE09    inc         esi
 006EBE0A    xor         ebx,ebx
 006EBE0C    mov         edi,dword ptr ds:[82273C];gvar_0082273C:TObjectList
 006EBE12    mov         edx,ebx
 006EBE14    mov         eax,edi
 006EBE16    call        TList.Get
 006EBE1B    test        eax,eax
>006EBE1D    je          006EBE35
 006EBE1F    mov         edi,dword ptr ds:[82273C];gvar_0082273C:TObjectList
 006EBE25    mov         edx,ebx
 006EBE27    mov         eax,edi
 006EBE29    call        TList.Get
 006EBE2E    mov         edx,ebp
 006EBE30    call        006ED5F0
 006EBE35    inc         ebx
 006EBE36    dec         esi
>006EBE37    jne         006EBE0C
>006EBE39    jmp         006EBF4C
 006EBE3E    lea         eax,[esp+58]
 006EBE42    xor         ecx,ecx
 006EBE44    mov         edx,68
 006EBE49    call        @FillChar
 006EBE4E    mov         dword ptr [esp+58],3
 006EBE56    mov         dword ptr [esp+5C],3F800000
 006EBE5E    mov         dword ptr [esp+60],3F800000
 006EBE66    mov         dword ptr [esp+64],3F800000
 006EBE6E    mov         dword ptr [esp+7C],3E4CCCCD
 006EBE76    mov         dword ptr [esp+80],3E4CCCCD
 006EBE81    mov         dword ptr [esp+84],3E4CCCCD
 006EBE8C    mov         dword ptr [esp+6C],3F800000
 006EBE94    mov         dword ptr [esp+70],3F800000
 006EBE9C    mov         dword ptr [esp+74],3F800000
 006EBEA4    call        00682F08
 006EBEA9    add         esp,0FFFFFFF4
 006EBEAC    fstp        tbyte ptr [esp]
 006EBEAF    wait
 006EBEB0    call        Cos
 006EBEB5    fstp        dword ptr [esp]
 006EBEB8    wait
 006EBEB9    call        00682F08
 006EBEBE    add         esp,0FFFFFFF4
 006EBEC1    fstp        tbyte ptr [esp]
 006EBEC4    wait
 006EBEC5    call        Sin
 006EBECA    fstp        dword ptr [esp+4]
 006EBECE    wait
 006EBECF    mov         eax,dword ptr [esp]
 006EBED2    mov         dword ptr [esp+0C0],eax
 006EBED9    mov         dword ptr [esp+0C4],3F800000
 006EBEE4    mov         eax,dword ptr [esp+4]
 006EBEE8    mov         dword ptr [esp+0C8],eax
 006EBEEF    mov         eax,dword ptr [esp+0C0]
 006EBEF6    mov         dword ptr [esp+4C],eax
 006EBEFA    mov         eax,dword ptr [esp+0C4]
 006EBF01    mov         dword ptr [esp+50],eax
 006EBF05    mov         eax,dword ptr [esp+0C8]
 006EBF0C    mov         dword ptr [esp+54],eax
 006EBF10    lea         eax,[esp+4C]
 006EBF14    push        eax
 006EBF15    lea         eax,[esp+9C]
 006EBF1C    push        eax
 006EBF1D    call        d3dx9_33.D3DXVec3Normalize
 006EBF22    mov         dword ptr [esp+0A4],447A0000
 006EBF2D    lea         eax,[esp+58]
 006EBF31    push        eax
 006EBF32    push        0
 006EBF34    push        ebp
 006EBF35    mov         eax,dword ptr [ebp]
 006EBF38    call        dword ptr [eax+0CC]
 006EBF3E    push        0FF
 006EBF40    push        0
 006EBF42    push        ebp
 006EBF43    mov         eax,dword ptr [ebp]
 006EBF46    call        dword ptr [eax+0D4]
 006EBF4C    push        1
 006EBF4E    push        89
 006EBF53    push        ebp
 006EBF54    mov         eax,dword ptr [ebp]
 006EBF57    call        dword ptr [eax+0E4]
 006EBF5D    add         esp,0CC
 006EBF63    pop         ebp
 006EBF64    pop         edi
 006EBF65    pop         esi
 006EBF66    pop         ebx
 006EBF67    ret
end;*}

//006EBF68
{*procedure sub_006EBF68(?:?; ?:?; ?:?);
begin
 006EBF68    push        ebx
 006EBF69    push        esi
 006EBF6A    push        edi
 006EBF6B    push        ebp
 006EBF6C    add         esp,0FFFFFFF8
 006EBF6F    mov         edi,ecx
 006EBF71    mov         ebx,edx
 006EBF73    mov         dword ptr [esp],eax
 006EBF76    cmp         dword ptr ds:[822740],0;gvar_00822740:TD3DCamera
>006EBF7D    je          006EBFEB
 006EBF7F    mov         eax,[00822740];gvar_00822740:TD3DCamera
 006EBF84    cmp         byte ptr [eax+31],0
>006EBF88    je          006EBFEB
 006EBF8A    push        edi
 006EBF8B    mov         eax,dword ptr [edi]
 006EBF8D    call        dword ptr [eax+0A4]
 006EBF93    movzx       eax,byte ptr ds:[822732];gvar_00822732
 006EBF9A    inc         eax
 006EBF9B    push        eax
 006EBF9C    mov         ecx,edi
 006EBF9E    mov         edx,dword ptr [esp+4]
 006EBFA2    mov         eax,[00822740];gvar_00822740:TD3DCamera
 006EBFA7    call        TD3DCamera.Render
 006EBFAC    mov         ecx,edi
 006EBFAE    mov         edx,ebx
 006EBFB0    mov         eax,dword ptr [esp]
 006EBFB3    call        006EBD84
 006EBFB8    mov         eax,[00822738];gvar_00822738:TObjectList
 006EBFBD    mov         ebx,dword ptr [eax+8]
 006EBFC0    dec         ebx
 006EBFC1    test        ebx,ebx
>006EBFC3    jl          006EC0D7
 006EBFC9    inc         ebx
 006EBFCA    xor         esi,esi
 006EBFCC    mov         ebp,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EBFD2    mov         edx,esi
 006EBFD4    mov         eax,ebp
 006EBFD6    call        TList.Get
 006EBFDB    mov         edx,edi
 006EBFDD    call        TD3DObject.Render
 006EBFE2    inc         esi
 006EBFE3    dec         ebx
>006EBFE4    jne         006EBFCC
>006EBFE6    jmp         006EC0D7
 006EBFEB    cmp         dword ptr ds:[822740],0;gvar_00822740:TD3DCamera
>006EBFF2    je          006EC08F
 006EBFF8    mov         eax,[00822740];gvar_00822740:TD3DCamera
 006EBFFD    cmp         byte ptr [eax+31],0
>006EC001    je          006EC08F
 006EC007    push        edi
 006EC008    mov         eax,dword ptr [edi]
 006EC00A    call        dword ptr [eax+0A4]
 006EC010    push        0
 006EC012    push        3F800000
 006EC017    mov         eax,[00822740];gvar_00822740:TD3DCamera
 006EC01C    mov         eax,dword ptr [eax+34]
 006EC01F    push        eax
 006EC020    push        3
 006EC022    push        0
 006EC024    push        0
 006EC026    push        edi
 006EC027    mov         eax,dword ptr [edi]
 006EC029    call        dword ptr [eax+0AC]
 006EC02F    mov         ecx,edi
 006EC031    mov         edx,ebx
 006EC033    mov         eax,dword ptr [esp]
 006EC036    call        006EBD84
 006EC03B    mov         dword ptr [esp+4],1
 006EC043    mov         eax,dword ptr [esp+4]
 006EC047    push        eax
 006EC048    mov         ecx,edi
 006EC04A    mov         edx,dword ptr [esp+4]
 006EC04E    mov         eax,[00822740];gvar_00822740:TD3DCamera
 006EC053    call        TD3DCamera.Render
 006EC058    mov         eax,[00822738];gvar_00822738:TObjectList
 006EC05D    mov         ebx,dword ptr [eax+8]
 006EC060    dec         ebx
 006EC061    test        ebx,ebx
>006EC063    jl          006EC082
 006EC065    inc         ebx
 006EC066    xor         esi,esi
 006EC068    mov         ebp,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EC06E    mov         edx,esi
 006EC070    mov         eax,ebp
 006EC072    call        TList.Get
 006EC077    mov         edx,edi
 006EC079    call        TD3DObject.Render
 006EC07E    inc         esi
 006EC07F    dec         ebx
>006EC080    jne         006EC068
 006EC082    inc         dword ptr [esp+4]
 006EC086    cmp         dword ptr [esp+4],3
>006EC08B    jne         006EC043
>006EC08D    jmp         006EC0D7
 006EC08F    push        0
 006EC091    mov         ecx,edi
 006EC093    mov         edx,dword ptr [esp+4]
 006EC097    mov         eax,[00822740];gvar_00822740:TD3DCamera
 006EC09C    call        TD3DCamera.Render
 006EC0A1    mov         ecx,edi
 006EC0A3    mov         edx,ebx
 006EC0A5    mov         eax,dword ptr [esp]
 006EC0A8    call        006EBD84
 006EC0AD    mov         eax,[00822738];gvar_00822738:TObjectList
 006EC0B2    mov         ebx,dword ptr [eax+8]
 006EC0B5    dec         ebx
 006EC0B6    test        ebx,ebx
>006EC0B8    jl          006EC0D7
 006EC0BA    inc         ebx
 006EC0BB    xor         esi,esi
 006EC0BD    mov         ebp,dword ptr ds:[822738];gvar_00822738:TObjectList
 006EC0C3    mov         edx,esi
 006EC0C5    mov         eax,ebp
 006EC0C7    call        TList.Get
 006EC0CC    mov         edx,edi
 006EC0CE    call        TD3DObject.Render
 006EC0D3    inc         esi
 006EC0D4    dec         ebx
>006EC0D5    jne         006EC0BD
 006EC0D7    push        edi
 006EC0D8    mov         eax,dword ptr [edi]
 006EC0DA    call        dword ptr [eax+0A8]
 006EC0E0    pop         ecx
 006EC0E1    pop         edx
 006EC0E2    pop         ebp
 006EC0E3    pop         edi
 006EC0E4    pop         esi
 006EC0E5    pop         ebx
 006EC0E6    ret
end;*}

//006EC0E8
constructor TD3DObject.Create;
begin
{*
 006EC0E8    push        ebx
 006EC0E9    push        esi
 006EC0EA    test        dl,dl
>006EC0EC    je          006EC0F6
 006EC0EE    add         esp,0FFFFFFF0
 006EC0F1    call        @ClassCreate
 006EC0F6    mov         ebx,edx
 006EC0F8    mov         esi,eax
 006EC0FA    mov         byte ptr [esi+69],1;TD3DObject.Visible:Boolean
 006EC0FE    xor         eax,eax
 006EC100    mov         dword ptr [esi+4],eax;TD3DObject.x:Single
 006EC103    xor         eax,eax
 006EC105    mov         dword ptr [esi+8],eax;TD3DObject.y:Single
 006EC108    xor         eax,eax
 006EC10A    mov         dword ptr [esi+0C],eax;TD3DObject.z:Single
 006EC10D    xor         eax,eax
 006EC10F    mov         dword ptr [esi+1C],eax;TD3DObject.pitch:Single
 006EC112    xor         eax,eax
 006EC114    mov         dword ptr [esi+20],eax;TD3DObject.yaw:Single
 006EC117    xor         eax,eax
 006EC119    mov         dword ptr [esi+24],eax;TD3DObject.roll:Single
 006EC11C    mov         dword ptr [esi+10],3F800000;TD3DObject.sizex:Single
 006EC123    mov         dword ptr [esi+14],3F800000;TD3DObject.sizey:Single
 006EC12A    mov         dword ptr [esi+18],3F800000;TD3DObject.sizez:Single
 006EC131    mov         dword ptr [esi+6A],3F666666;TD3DObject.color:_D3DCOLORVALUE
 006EC138    mov         dword ptr [esi+6E],3F666666;TD3DObject.color.g:TD3DValue
 006EC13F    mov         dword ptr [esi+72],3F666666;TD3DObject.color.b:TD3DValue
 006EC146    mov         dword ptr [esi+76],3F800000
 006EC14D    mov         edx,6EC180;'box'
 006EC152    mov         eax,esi
 006EC154    call        TD3DObject.SetModel
 006EC159    mov         eax,esi
 006EC15B    test        bl,bl
>006EC15D    je          006EC16E
 006EC15F    call        @AfterConstruction
 006EC164    pop         dword ptr fs:[0]
 006EC16B    add         esp,0C
 006EC16E    mov         eax,esi
 006EC170    pop         esi
 006EC171    pop         ebx
 006EC172    ret
*}
end;

//006EC188
destructor TD3DObject.Destroy();
begin
{*
 006EC188    push        ebx
 006EC189    push        esi
 006EC18A    call        @BeforeDestruction
 006EC18F    mov         ebx,edx
 006EC191    mov         esi,eax
 006EC193    mov         eax,esi
 006EC195    call        TD3DObject.FreeModel
 006EC19A    mov         edx,ebx
 006EC19C    and         dl,0FC
 006EC19F    mov         eax,esi
 006EC1A1    call        TObject.Destroy
 006EC1A6    test        bl,bl
>006EC1A8    jle         006EC1B1
 006EC1AA    mov         eax,esi
 006EC1AC    call        @ClassDestroy
 006EC1B1    pop         esi
 006EC1B2    pop         ebx
 006EC1B3    ret
*}
end;

//006EC1B4
procedure TD3DObject.FreeModel;
begin
{*
 006EC1B4    push        ebx
 006EC1B5    push        esi
 006EC1B6    push        edi
 006EC1B7    push        ebp
 006EC1B8    mov         ebx,eax
 006EC1BA    mov         eax,dword ptr [ebx+88];TD3DObject.g_pMeshMaterials:PAD3DMaterial
 006EC1C0    test        eax,eax
>006EC1C2    je          006EC1C9
 006EC1C4    call        @FreeMem
 006EC1C9    xor         eax,eax
 006EC1CB    mov         dword ptr [ebx+88],eax;TD3DObject.g_pMeshMaterials:PAD3DMaterial
 006EC1D1    cmp         dword ptr [ebx+8C],0;TD3DObject.g_pMeshTextures:PAID3DTexture
>006EC1D8    je          006EC215
 006EC1DA    mov         edi,dword ptr [ebx+80];TD3DObject.NumMaterials:Cardinal
 006EC1E0    dec         edi
 006EC1E1    test        edi,edi
>006EC1E3    jb          006EC202
 006EC1E5    inc         edi
 006EC1E6    xor         esi,esi
 006EC1E8    mov         ebp,dword ptr [ebx+8C];TD3DObject.g_pMeshTextures:PAID3DTexture
 006EC1EE    cmp         dword ptr [ebp+esi*4],0
>006EC1F3    je          006EC1FE
 006EC1F5    lea         eax,[ebp+esi*4]
 006EC1F9    call        @IntfClear
 006EC1FE    inc         esi
 006EC1FF    dec         edi
>006EC200    jne         006EC1E8
 006EC202    mov         eax,dword ptr [ebx+8C];TD3DObject.g_pMeshTextures:PAID3DTexture
 006EC208    call        @FreeMem
 006EC20D    xor         eax,eax
 006EC20F    mov         dword ptr [ebx+8C],eax;TD3DObject.g_pMeshTextures:PAID3DTexture
 006EC215    xor         eax,eax
 006EC217    mov         dword ptr [ebx+80],eax;TD3DObject.NumMaterials:Cardinal
 006EC21D    lea         eax,[ebx+84];TD3DObject.g_pMesh:ID3DXMesh
 006EC223    call        @IntfClear
 006EC228    pop         ebp
 006EC229    pop         edi
 006EC22A    pop         esi
 006EC22B    pop         ebx
 006EC22C    ret
*}
end;

//006EC230
procedure TD3DObject.Render(Device:IDirect3DDevice9);
begin
{*
 006EC230    push        ebp
 006EC231    mov         ebp,esp
 006EC233    add         esp,0FFFFFE28
 006EC239    push        ebx
 006EC23A    push        esi
 006EC23B    push        edi
 006EC23C    mov         dword ptr [ebp-4],edx
 006EC23F    mov         esi,eax
 006EC241    mov         eax,dword ptr [ebp-4]
 006EC244    call        @IntfAddRef
 006EC249    xor         eax,eax
 006EC24B    push        ebp
 006EC24C    push        6EC496
 006EC251    push        dword ptr fs:[eax]
 006EC254    mov         dword ptr fs:[eax],esp
 006EC257    test        esi,esi
>006EC259    je          006EC480
 006EC25F    cmp         byte ptr [esi+69],0;TD3DObject.Visible:Boolean
>006EC263    je          006EC480
 006EC269    lea         eax,[ebp-8C]
 006EC26F    xor         ecx,ecx
 006EC271    mov         edx,44
 006EC276    call        @FillChar
 006EC27B    push        esi
 006EC27C    add         esi,6A;TD3DObject.color:_D3DCOLORVALUE
 006EC27F    lea         edi,[ebp-8C]
 006EC285    movs        dword ptr [edi],dword ptr [esi]
 006EC286    movs        dword ptr [edi],dword ptr [esi]
 006EC287    movs        dword ptr [edi],dword ptr [esi]
 006EC288    movs        dword ptr [edi],dword ptr [esi]
 006EC289    pop         esi
 006EC28A    push        esi
 006EC28B    add         esi,6A;TD3DObject.color:_D3DCOLORVALUE
 006EC28E    lea         edi,[ebp-7C]
 006EC291    movs        dword ptr [edi],dword ptr [esi]
 006EC292    movs        dword ptr [edi],dword ptr [esi]
 006EC293    movs        dword ptr [edi],dword ptr [esi]
 006EC294    movs        dword ptr [edi],dword ptr [esi]
 006EC295    pop         esi
 006EC296    lea         eax,[ebp-8C]
 006EC29C    push        eax
 006EC29D    mov         eax,dword ptr [ebp-4]
 006EC2A0    push        eax
 006EC2A1    mov         eax,dword ptr [eax]
 006EC2A3    call        dword ptr [eax+0C4]
 006EC2A9    cmp         byte ptr [esi+68],0;TD3DObject.useRotMat:Boolean
>006EC2AD    je          006EC2C6
 006EC2AF    push        esi
 006EC2B0    add         esi,28;TD3DObject.rotmat:_D3DMATRIX
 006EC2B3    lea         edi,[ebp-0CC]
 006EC2B9    mov         ecx,10
 006EC2BE    rep movs    dword ptr [edi],dword ptr [esi]
 006EC2C0    pop         esi
>006EC2C1    jmp         006EC359
 006EC2C6    fld         dword ptr [esi+20];TD3DObject.yaw:Single
 006EC2C9    add         esp,0FFFFFFF8
 006EC2CC    fstp        qword ptr [esp]
 006EC2CF    wait
 006EC2D0    fld         dword ptr [esi+1C];TD3DObject.pitch:Single
 006EC2D3    add         esp,0FFFFFFF8
 006EC2D6    fstp        qword ptr [esp]
 006EC2D9    wait
 006EC2DA    fld         dword ptr [esi+24];TD3DObject.roll:Single
 006EC2DD    add         esp,0FFFFFFF8
 006EC2E0    fstp        qword ptr [esp]
 006EC2E3    wait
 006EC2E4    lea         eax,[ebp-1D8]
 006EC2EA    call        005C361C
 006EC2EF    xor         eax,eax
 006EC2F1    mov         dword ptr [esi+58],eax;TD3DObject.rotmat._41:TD3DValue
 006EC2F4    xor         eax,eax
 006EC2F6    mov         dword ptr [esi+5C],eax;TD3DObject.rotmat._42:TD3DValue
 006EC2F9    xor         eax,eax
 006EC2FB    mov         dword ptr [esi+60],eax;TD3DObject.rotmat._43:TD3DValue
 006EC2FE    mov         dword ptr [esi+64],3F800000
 006EC305    xor         eax,eax
 006EC307    mov         dword ptr [esi+34],eax;TD3DObject.rotmat._14:TD3DValue
 006EC30A    xor         eax,eax
 006EC30C    mov         dword ptr [esi+44],eax;TD3DObject.rotmat._24:TD3DValue
 006EC30F    xor         eax,eax
 006EC311    mov         dword ptr [esi+54],eax;TD3DObject.rotmat._34:TD3DValue
 006EC314    xor         eax,eax
 006EC316    mov         dword ptr [ebp-8],eax
 006EC319    lea         ecx,[ebp-1D8]
 006EC31F    xor         edx,edx
 006EC321    mov         eax,ecx
 006EC323    fld         qword ptr [eax]
 006EC325    mov         ebx,dword ptr [ebp-8]
 006EC328    add         ebx,ebx
 006EC32A    lea         ebx,[esi+ebx*8]
 006EC32D    fstp        dword ptr [ebx+edx*4+28]
 006EC331    wait
 006EC332    inc         edx
 006EC333    add         eax,8
 006EC336    cmp         edx,3
>006EC339    jne         006EC323
 006EC33B    inc         dword ptr [ebp-8]
 006EC33E    add         ecx,18
 006EC341    cmp         dword ptr [ebp-8],3
>006EC345    jne         006EC31F
 006EC347    push        esi
 006EC348    add         esi,28;TD3DObject.rotmat:_D3DMATRIX
 006EC34B    lea         edi,[ebp-0CC]
 006EC351    mov         ecx,10
 006EC356    rep movs    dword ptr [edi],dword ptr [esi]
 006EC358    pop         esi
 006EC359    push        dword ptr [esi+0C];TD3DObject.z:Single
 006EC35C    push        dword ptr [esi+8];TD3DObject.y:Single
 006EC35F    push        dword ptr [esi+4];TD3DObject.x:Single
 006EC362    lea         eax,[ebp-14C]
 006EC368    push        eax
 006EC369    call        d3dx9_33.D3DXMatrixTranslation
 006EC36E    lea         eax,[ebp-14C]
 006EC374    push        eax
 006EC375    lea         eax,[ebp-0CC]
 006EC37B    push        eax
 006EC37C    lea         eax,[ebp-10C]
 006EC382    push        eax
 006EC383    call        d3dx9_33.D3DXMatrixMultiply
 006EC388    push        dword ptr [esi+18];TD3DObject.sizez:Single
 006EC38B    push        dword ptr [esi+14];TD3DObject.sizey:Single
 006EC38E    push        dword ptr [esi+10];TD3DObject.sizex:Single
 006EC391    lea         eax,[ebp-18C]
 006EC397    push        eax
 006EC398    call        d3dx9_33.D3DXMatrixScaling
 006EC39D    lea         eax,[ebp-10C]
 006EC3A3    push        eax
 006EC3A4    lea         eax,[ebp-18C]
 006EC3AA    push        eax
 006EC3AB    lea         eax,[ebp-48]
 006EC3AE    push        eax
 006EC3AF    call        d3dx9_33.D3DXMatrixMultiply
 006EC3B4    lea         eax,[ebp-48]
 006EC3B7    push        eax
 006EC3B8    push        100
 006EC3BD    mov         eax,dword ptr [ebp-4]
 006EC3C0    push        eax
 006EC3C1    mov         eax,dword ptr [eax]
 006EC3C3    call        dword ptr [eax+0B0]
 006EC3C9    push        18
 006EC3CB    push        0
 006EC3CD    mov         eax,[0078C368];0x0 gvar_0078C368:IInterface
 006EC3D2    push        eax
 006EC3D3    push        0
 006EC3D5    mov         eax,dword ptr [ebp-4]
 006EC3D8    push        eax
 006EC3D9    mov         eax,dword ptr [eax]
 006EC3DB    call        dword ptr [eax+190]
 006EC3E1    cmp         dword ptr [esi+7C],0;TD3DObject.Model:string
>006EC3E5    je          006EC480
 006EC3EB    mov         eax,dword ptr [esi+7C];TD3DObject.Model:string
 006EC3EE    mov         edx,6EC4B0;'box'
 006EC3F3    call        @UStrEqual
>006EC3F8    jne         006EC41C
 006EC3FA    push        12
 006EC3FC    mov         eax,dword ptr [ebp-4]
 006EC3FF    push        eax
 006EC400    mov         eax,dword ptr [eax]
 006EC402    call        dword ptr [eax+164]
 006EC408    push        0C
 006EC40A    push        0
 006EC40C    push        4
 006EC40E    mov         eax,dword ptr [ebp-4]
 006EC411    push        eax
 006EC412    mov         eax,dword ptr [eax]
 006EC414    call        dword ptr [eax+144]
>006EC41A    jmp         006EC480
 006EC41C    mov         ebx,dword ptr [esi+80];TD3DObject.NumMaterials:Cardinal
 006EC422    dec         ebx
 006EC423    test        ebx,ebx
>006EC425    jl          006EC480
 006EC427    inc         ebx
 006EC428    mov         dword ptr [ebp-8],0
 006EC42F    mov         eax,dword ptr [ebp-8]
 006EC432    mov         edx,eax
 006EC434    shl         eax,4
 006EC437    add         eax,edx
 006EC439    mov         edx,dword ptr [esi+88];TD3DObject.g_pMeshMaterials:PAD3DMaterial
 006EC43F    lea         eax,[edx+eax*4]
 006EC442    push        eax
 006EC443    mov         eax,dword ptr [ebp-4]
 006EC446    push        eax
 006EC447    mov         eax,dword ptr [eax]
 006EC449    call        dword ptr [eax+0C4]
 006EC44F    mov         eax,dword ptr [esi+8C];TD3DObject.g_pMeshTextures:PAID3DTexture
 006EC455    mov         edx,dword ptr [ebp-8]
 006EC458    mov         eax,dword ptr [eax+edx*4]
 006EC45B    push        eax
 006EC45C    push        0
 006EC45E    mov         eax,dword ptr [ebp-4]
 006EC461    push        eax
 006EC462    mov         eax,dword ptr [eax]
 006EC464    call        dword ptr [eax+104]
 006EC46A    mov         eax,dword ptr [ebp-8]
 006EC46D    push        eax
 006EC46E    mov         eax,dword ptr [esi+84];TD3DObject.g_pMesh:ID3DXMesh
 006EC474    push        eax
 006EC475    mov         eax,dword ptr [eax]
 006EC477    call        dword ptr [eax+0C]
 006EC47A    inc         dword ptr [ebp-8]
 006EC47D    dec         ebx
>006EC47E    jne         006EC42F
 006EC480    xor         eax,eax
 006EC482    pop         edx
 006EC483    pop         ecx
 006EC484    pop         ecx
 006EC485    mov         dword ptr fs:[eax],edx
 006EC488    push        6EC49D
 006EC48D    lea         eax,[ebp-4]
 006EC490    call        @IntfClear
 006EC495    ret
>006EC496    jmp         @HandleFinally
>006EC49B    jmp         006EC48D
 006EC49D    pop         edi
 006EC49E    pop         esi
 006EC49F    pop         ebx
 006EC4A0    mov         esp,ebp
 006EC4A2    pop         ebp
 006EC4A3    ret
*}
end;

//006EC4B8
procedure TD3DObject.SetModel(NewModel:string);
begin
{*
 006EC4B8    push        ebp
 006EC4B9    mov         ebp,esp
 006EC4BB    xor         ecx,ecx
 006EC4BD    push        ecx
 006EC4BE    push        ecx
 006EC4BF    push        ecx
 006EC4C0    push        ecx
 006EC4C1    push        ecx
 006EC4C2    push        ecx
 006EC4C3    push        ecx
 006EC4C4    push        ebx
 006EC4C5    push        esi
 006EC4C6    push        edi
 006EC4C7    mov         dword ptr [ebp-4],edx
 006EC4CA    mov         ebx,eax
 006EC4CC    mov         eax,dword ptr [ebp-4]
 006EC4CF    call        @UStrAddRef
 006EC4D4    xor         eax,eax
 006EC4D6    push        ebp
 006EC4D7    push        6EC6CD
 006EC4DC    push        dword ptr fs:[eax]
 006EC4DF    mov         dword ptr fs:[eax],esp
 006EC4E2    mov         eax,ebx
 006EC4E4    call        TD3DObject.FreeModel
 006EC4E9    lea         eax,[ebx+7C];TD3DObject.Model:string
 006EC4EC    mov         edx,dword ptr [ebp-4]
 006EC4EF    call        @UStrAsg
 006EC4F4    lea         edx,[ebp-8]
 006EC4F7    mov         eax,dword ptr [ebx+7C];TD3DObject.Model:string
 006EC4FA    call        LowerCase
 006EC4FF    cmp         dword ptr [ebp-8],0
>006EC503    je          006EC69D
 006EC509    mov         eax,dword ptr [ebp-8]
 006EC50C    mov         edx,6EC6E8;'box'
 006EC511    call        @UStrEqual
>006EC516    je          006EC69D
 006EC51C    lea         edx,[ebp-18]
 006EC51F    mov         eax,dword ptr [ebp-8]
 006EC522    call        ExtractFileExt
 006EC527    cmp         dword ptr [ebp-18],0
>006EC52B    jne         006EC548
 006EC52D    lea         ecx,[ebp-1C]
 006EC530    mov         edx,6EC6FC;'.x'
 006EC535    mov         eax,dword ptr [ebp-8]
 006EC538    call        ChangeFileExt
 006EC53D    mov         edx,dword ptr [ebp-1C]
 006EC540    lea         eax,[ebp-8]
 006EC543    call        @UStrLAsg
 006EC548    lea         eax,[ebx+84];TD3DObject.g_pMesh:ID3DXMesh
 006EC54E    call        @IntfClear
 006EC553    push        eax
 006EC554    lea         eax,[ebx+80];TD3DObject.NumMaterials:Cardinal
 006EC55A    push        eax
 006EC55B    push        0
 006EC55D    lea         eax,[ebp-0C]
 006EC560    push        eax
 006EC561    push        0
 006EC563    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006EC568    mov         eax,dword ptr [eax]
 006EC56A    mov         eax,dword ptr [eax+5E4]
 006EC570    mov         eax,dword ptr [eax+274]
 006EC576    push        eax
 006EC577    push        110
 006EC57C    mov         eax,dword ptr [ebp-8]
 006EC57F    call        @UStrToPWChar
 006EC584    push        eax
 006EC585    call        d3dx9_33.D3DXLoadMeshFromXW
 006EC58A    test        eax,80000000
 006EC58F    setne       al
 006EC592    neg         al
 006EC594    sbb         eax,eax
 006EC596    test        eax,eax
>006EC598    jne         006EC69D
 006EC59E    mov         eax,dword ptr [ebp-0C]
 006EC5A1    push        eax
 006EC5A2    mov         eax,dword ptr [eax]
 006EC5A4    call        dword ptr [eax+0C]
 006EC5A7    mov         dword ptr [ebp-10],eax
 006EC5AA    imul        eax,dword ptr [ebx+80],44;TD3DObject.NumMaterials:Cardinal
 006EC5B1    call        @GetMem
 006EC5B6    mov         dword ptr [ebx+88],eax;TD3DObject.g_pMeshMaterials:PAD3DMaterial
 006EC5BC    mov         eax,dword ptr [ebx+80];TD3DObject.NumMaterials:Cardinal
 006EC5C2    add         eax,eax
 006EC5C4    add         eax,eax
 006EC5C6    call        @GetMem
 006EC5CB    mov         esi,eax
 006EC5CD    mov         dword ptr [ebx+8C],esi;TD3DObject.g_pMeshTextures:PAID3DTexture
 006EC5D3    mov         edx,dword ptr [ebx+80];TD3DObject.NumMaterials:Cardinal
 006EC5D9    add         edx,edx
 006EC5DB    add         edx,edx
 006EC5DD    mov         eax,esi
 006EC5DF    xor         ecx,ecx
 006EC5E1    call        @FillChar
 006EC5E6    mov         eax,dword ptr [ebx+80];TD3DObject.NumMaterials:Cardinal
 006EC5EC    dec         eax
 006EC5ED    test        eax,eax
>006EC5EF    jl          006EC695
 006EC5F5    inc         eax
 006EC5F6    mov         dword ptr [ebp-14],eax
 006EC5F9    xor         esi,esi
 006EC5FB    lea         edx,[esi+esi*8]
 006EC5FE    mov         ecx,dword ptr [ebp-10]
 006EC601    lea         edx,[ecx+edx*8]
 006EC604    push        edx
 006EC605    mov         eax,esi
 006EC607    shl         eax,4
 006EC60A    add         eax,esi
 006EC60C    mov         edx,dword ptr [ebx+88];TD3DObject.g_pMeshMaterials:PAD3DMaterial
 006EC612    pop         ecx
 006EC613    push        esi
 006EC614    mov         esi,ecx
 006EC616    lea         edi,[edx+eax*4]
 006EC619    mov         ecx,11
 006EC61E    rep movs    dword ptr [edi],dword ptr [esi]
 006EC620    pop         esi
 006EC621    mov         edx,dword ptr [ebx+88];TD3DObject.g_pMeshMaterials:PAD3DMaterial
 006EC627    mov         ecx,dword ptr [ebx+88];TD3DObject.g_pMeshMaterials:PAD3DMaterial
 006EC62D    push        esi
 006EC62E    lea         esi,[edx+eax*4]
 006EC631    lea         edi,[ecx+eax*4+10]
 006EC635    movs        dword ptr [edi],dword ptr [esi]
 006EC636    movs        dword ptr [edi],dword ptr [esi]
 006EC637    movs        dword ptr [edi],dword ptr [esi]
 006EC638    movs        dword ptr [edi],dword ptr [esi]
 006EC639    pop         esi
 006EC63A    mov         eax,dword ptr [ebx+8C];TD3DObject.g_pMeshTextures:PAID3DTexture
 006EC640    lea         eax,[eax+esi*4]
 006EC643    call        @IntfClear
 006EC648    push        eax
 006EC649    lea         eax,[esi+esi*8]
 006EC64C    mov         edx,dword ptr [ebp-10]
 006EC64F    mov         eax,dword ptr [edx+eax*8+44]
 006EC653    push        eax
 006EC654    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006EC659    mov         eax,dword ptr [eax]
 006EC65B    mov         eax,dword ptr [eax+5E4]
 006EC661    mov         eax,dword ptr [eax+274]
 006EC667    push        eax
 006EC668    call        d3dx9_33.D3DXCreateTextureFromFileA
 006EC66D    test        eax,80000000
 006EC672    setne       al
 006EC675    neg         al
 006EC677    sbb         eax,eax
 006EC679    test        eax,eax
>006EC67B    je          006EC68B
 006EC67D    mov         eax,dword ptr [ebx+8C];TD3DObject.g_pMeshTextures:PAID3DTexture
 006EC683    lea         eax,[eax+esi*4]
 006EC686    call        @IntfClear
 006EC68B    inc         esi
 006EC68C    dec         dword ptr [ebp-14]
>006EC68F    jne         006EC5FB
 006EC695    lea         eax,[ebp-0C]
 006EC698    call        @IntfClear
 006EC69D    xor         eax,eax
 006EC69F    pop         edx
 006EC6A0    pop         ecx
 006EC6A1    pop         ecx
 006EC6A2    mov         dword ptr fs:[eax],edx
 006EC6A5    push        6EC6D4
 006EC6AA    lea         eax,[ebp-1C]
 006EC6AD    mov         edx,2
 006EC6B2    call        @UStrArrayClr
 006EC6B7    lea         eax,[ebp-0C]
 006EC6BA    call        @IntfClear
 006EC6BF    lea         eax,[ebp-8]
 006EC6C2    mov         edx,2
 006EC6C7    call        @UStrArrayClr
 006EC6CC    ret
>006EC6CD    jmp         @HandleFinally
>006EC6D2    jmp         006EC6AA
 006EC6D4    pop         edi
 006EC6D5    pop         esi
 006EC6D6    pop         ebx
 006EC6D7    mov         esp,ebp
 006EC6D9    pop         ebp
 006EC6DA    ret
*}
end;

//006EC704
function TD3DCameraValue.CanSet:Boolean;
begin
{*
 006EC704    mov         al,1
 006EC706    ret
*}
end;

//006EC708
procedure TD3DCameraValue.CreateClone;
begin
{*
 006EC708    mov         dl,1
 006EC70A    mov         eax,[006E8860];TD3DCameraValue
 006EC70F    call        TObject.Create;TD3DCameraValue.Create
 006EC714    ret
*}
end;

//006EC718
procedure TD3DCameraValue.FillClone(c:TExpression);
begin
{*
 006EC718    push        ebx
 006EC719    push        esi
 006EC71A    mov         esi,edx
 006EC71C    mov         ebx,eax
 006EC71E    mov         edx,esi
 006EC720    mov         eax,ebx
 006EC722    call        TExpression.FillClone
 006EC727    mov         eax,esi
 006EC729    mov         edx,dword ptr [ebx+20];TD3DCameraValue.................................Item:Integer
 006EC72C    mov         dword ptr [eax+20],edx
 006EC72F    mov         edx,dword ptr [ebx+18];TD3DCameraValue.....................................................
 006EC732    mov         dword ptr [eax+18],edx
 006EC735    pop         esi
 006EC736    pop         ebx
 006EC737    ret
*}
end;

//006EC738
function TD3DCameraValue.GetDataType:TDataType;
begin
{*
 006EC738    mov         eax,dword ptr [eax+20];TD3DCameraValue..................................Item:Integer
 006EC73B    cmp         eax,1C
>006EC73E    ja          006EC799
 006EC740    movzx       eax,byte ptr [eax+6EC74E]
 006EC747    jmp         dword ptr [eax*4+6EC76B]
 006EC747    db          1
 006EC747    db          0
 006EC747    db          0
 006EC747    db          0
 006EC747    db          2
 006EC747    db          0
 006EC747    db          4
 006EC747    db          3
 006EC747    db          3
 006EC747    db          3
 006EC747    db          0
 006EC747    db          4
 006EC747    db          4
 006EC747    db          4
 006EC747    db          4
 006EC747    db          4
 006EC747    db          4
 006EC747    db          4
 006EC747    db          4
 006EC747    db          4
 006EC747    db          4
 006EC747    db          4
 006EC747    db          4
 006EC747    db          0
 006EC747    db          0
 006EC747    db          0
 006EC747    db          0
 006EC747    db          5
 006EC747    db          6
 006EC747    dd          006EC799
 006EC747    dd          006EC787
 006EC747    dd          006EC78A
 006EC747    dd          006EC78D
 006EC747    dd          006EC790
 006EC747    dd          006EC793
 006EC747    dd          006EC796
 006EC787    mov         al,3
 006EC789    ret
 006EC78A    mov         al,2
 006EC78C    ret
 006EC78D    xor         eax,eax
 006EC78F    ret
 006EC790    mov         al,5
 006EC792    ret
 006EC793    mov         al,3
 006EC795    ret
 006EC796    mov         al,6
 006EC798    ret
 006EC799    xor         eax,eax
 006EC79B    ret
*}
end;

//006EC79C
function TD3DCameraValue.GetPerUnits1:TUnits;
begin
{*
 006EC79C    mov         eax,dword ptr [eax+20];TD3DCameraValue...................................Item:Integer
 006EC79F    sub         eax,1
>006EC7A2    jae         006EC7A7
 006EC7A4    xor         eax,eax
 006EC7A6    ret
 006EC7A7    xor         eax,eax
 006EC7A9    ret
*}
end;

//006EC7AC
function TD3DCameraValue.GetPerUnits2:TUnits;
begin
{*
 006EC7AC    mov         eax,dword ptr [eax+20];TD3DCameraValue....................................Item:Integer
 006EC7AF    sub         eax,1
>006EC7B2    jae         006EC7B7
 006EC7B4    xor         eax,eax
 006EC7B6    ret
 006EC7B7    xor         eax,eax
 006EC7B9    ret
*}
end;

//006EC7BC
procedure TD3DCameraValue.GetRotMat(m:TRotMat);
begin
{*
 006EC7BC    push        ebx
 006EC7BD    push        esi
 006EC7BE    push        edi
 006EC7BF    push        ebp
 006EC7C0    add         esp,0FFFFFFF8
 006EC7C3    mov         ebx,822740;gvar_00822740:TD3DCamera
 006EC7C8    cmp         dword ptr [ebx],0
>006EC7CB    jne         006EC7FC
 006EC7CD    xor         esi,esi
 006EC7CF    mov         edi,edx
 006EC7D1    xor         eax,eax
 006EC7D3    mov         ecx,edi
 006EC7D5    cmp         eax,esi
 006EC7D7    sete        bl
 006EC7DA    movsx       ebx,bl
 006EC7DD    mov         dword ptr [esp+4],ebx
 006EC7E1    fild        dword ptr [esp+4]
 006EC7E5    fstp        qword ptr [ecx]
 006EC7E7    wait
 006EC7E8    inc         eax
 006EC7E9    add         ecx,8
 006EC7EC    cmp         eax,3
>006EC7EF    jne         006EC7D5
 006EC7F1    inc         esi
 006EC7F2    add         edi,18
 006EC7F5    cmp         esi,3
>006EC7F8    jne         006EC7D1
>006EC7FA    jmp         006EC839
 006EC7FC    mov         ecx,dword ptr [eax+20];TD3DCameraValue.....................................Item:Integer
 006EC7FF    sub         ecx,1C
>006EC802    jne         006EC834
 006EC804    xor         esi,esi
 006EC806    mov         dword ptr [esp],edx
 006EC809    xor         eax,eax
 006EC80B    mov         ecx,dword ptr [esp]
 006EC80E    mov         edi,eax
 006EC810    add         edi,edi
 006EC812    mov         ebp,dword ptr [ebx]
 006EC814    lea         edi,[ebp+edi*8]
 006EC818    fld         dword ptr [edi+esi*4+3C]
 006EC81C    fstp        qword ptr [ecx]
 006EC81E    wait
 006EC81F    inc         eax
 006EC820    add         ecx,8
 006EC823    cmp         eax,3
>006EC826    jne         006EC80E
 006EC828    inc         esi
 006EC829    add         dword ptr [esp],18
 006EC82D    cmp         esi,3
>006EC830    jne         006EC809
>006EC832    jmp         006EC839
 006EC834    call        TExpression.GetRotMat
 006EC839    pop         ecx
 006EC83A    pop         edx
 006EC83B    pop         ebp
 006EC83C    pop         edi
 006EC83D    pop         esi
 006EC83E    pop         ebx
 006EC83F    ret
*}
end;

//006EC840
{*procedure TD3DCameraValue.GetString(?:?);
begin
 006EC840    push        ebx
 006EC841    push        esi
 006EC842    mov         esi,edx
 006EC844    mov         ebx,eax
 006EC846    mov         eax,dword ptr [ebx+20];TD3DCameraValue......................................Item:Integer
 006EC849    sub         eax,1
>006EC84C    jae         006EC85A
 006EC84E    mov         edx,esi
 006EC850    mov         eax,ebx
 006EC852    call        TExpression.GetString
 006EC857    pop         esi
 006EC858    pop         ebx
 006EC859    ret
 006EC85A    mov         edx,esi
 006EC85C    mov         eax,ebx
 006EC85E    call        TExpression.GetString
 006EC863    pop         esi
 006EC864    pop         ebx
 006EC865    ret
end;*}

//006EC868
function TD3DCameraValue.GetUnits:TUnits;
begin
{*
 006EC868    mov         eax,dword ptr [eax+20];TD3DCameraValue.......................................Item:Intege...
 006EC86B    cmp         eax,1D
>006EC86E    ja          006EC8BC
 006EC870    movzx       eax,byte ptr [eax+6EC87E]
 006EC877    jmp         dword ptr [eax*4+6EC89C]
 006EC877    db          1
 006EC877    db          2
 006EC877    db          2
 006EC877    db          2
 006EC877    db          0
 006EC877    db          4
 006EC877    db          2
 006EC877    db          3
 006EC877    db          3
 006EC877    db          3
 006EC877    db          0
 006EC877    db          0
 006EC877    db          0
 006EC877    db          0
 006EC877    db          0
 006EC877    db          0
 006EC877    db          0
 006EC877    db          0
 006EC877    db          0
 006EC877    db          0
 006EC877    db          0
 006EC877    db          0
 006EC877    db          0
 006EC877    db          2
 006EC877    db          2
 006EC877    db          0
 006EC877    db          2
 006EC877    db          0
 006EC877    db          0
 006EC877    db          2
 006EC877    dd          006EC8BC
 006EC877    dd          006EC8B0
 006EC877    dd          006EC8B3
 006EC877    dd          006EC8B6
 006EC877    dd          006EC8B9
 006EC8B0    xor         eax,eax
 006EC8B2    ret
 006EC8B3    mov         al,5
 006EC8B5    ret
 006EC8B6    mov         al,18
 006EC8B8    ret
 006EC8B9    mov         al,18
 006EC8BB    ret
 006EC8BC    xor         eax,eax
 006EC8BE    ret
*}
end;

//006EC8C0
procedure TD3DCameraValue.GetValue;
begin
{*
 006EC8C0    push        ebx
 006EC8C1    add         esp,0FFFFFFD8
 006EC8C4    cmp         dword ptr ds:[822740],0;gvar_00822740:TD3DCamera
>006EC8CB    jne         006EC8DB
 006EC8CD    xor         eax,eax
 006EC8CF    mov         dword ptr [esp],eax
 006EC8D2    mov         dword ptr [esp+4],eax
>006EC8D6    jmp         006ECA59
 006EC8DB    mov         ebx,dword ptr ds:[822740];gvar_00822740:TD3DCamera
 006EC8E1    mov         eax,dword ptr [eax+20];TD3DCameraValue........................................Item:Integ...
 006EC8E4    cmp         eax,1D
>006EC8E7    ja          006ECA50
 006EC8ED    jmp         dword ptr [eax*4+6EC8F4]
 006EC8ED    dd          006EC96C
 006EC8ED    dd          006EC97E
 006EC8ED    dd          006EC98A
 006EC8ED    dd          006EC996
 006EC8ED    dd          006EC9C6
 006EC8ED    dd          006EC9DD
 006EC8ED    dd          006EC9E6
 006EC8ED    dd          006EC9A2
 006EC8ED    dd          006EC9AE
 006EC8ED    dd          006EC9BA
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA35
 006EC8ED    dd          006ECA3E
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA2C
 006EC8ED    dd          006ECA1D
 006EC8ED    dd          006ECA50
 006EC8ED    dd          006ECA47
 006EC96C    movzx       eax,byte ptr [ebx+30]
 006EC970    call        00686074
 006EC975    fstp        qword ptr [esp]
 006EC978    wait
>006EC979    jmp         006ECA59
 006EC97E    fld         dword ptr [ebx+4]
 006EC981    fstp        qword ptr [esp]
 006EC984    wait
>006EC985    jmp         006ECA59
 006EC98A    fld         dword ptr [ebx+8]
 006EC98D    fstp        qword ptr [esp]
 006EC990    wait
>006EC991    jmp         006ECA59
 006EC996    fld         dword ptr [ebx+0C]
 006EC999    fstp        qword ptr [esp]
 006EC99C    wait
>006EC99D    jmp         006ECA59
 006EC9A2    fld         dword ptr [ebx+28]
 006EC9A5    fstp        qword ptr [esp]
 006EC9A8    wait
>006EC9A9    jmp         006ECA59
 006EC9AE    fld         dword ptr [ebx+24]
 006EC9B1    fstp        qword ptr [esp]
 006EC9B4    wait
>006EC9B5    jmp         006ECA59
 006EC9BA    fld         dword ptr [ebx+2C]
 006EC9BD    fstp        qword ptr [esp]
 006EC9C0    wait
>006EC9C1    jmp         006ECA59
 006EC9C6    mov         eax,dword ptr [ebx+34]
 006EC9C9    mov         dword ptr [esp+8],eax
 006EC9CD    xor         eax,eax
 006EC9CF    mov         dword ptr [esp+0C],eax
 006EC9D3    fild        qword ptr [esp+8]
 006EC9D7    fstp        qword ptr [esp]
 006EC9DA    wait
>006EC9DB    jmp         006ECA59
 006EC9DD    fld         dword ptr [ebx+10]
 006EC9E0    fstp        qword ptr [esp]
 006EC9E3    wait
>006EC9E4    jmp         006ECA59
 006EC9E6    fld         dword ptr [ebx+4]
 006EC9E9    fmul        st,st(0)
 006EC9EB    fstp        tbyte ptr [esp+10]
 006EC9EF    wait
 006EC9F0    fld         dword ptr [ebx+8]
 006EC9F3    fmul        st,st(0)
 006EC9F5    fld         tbyte ptr [esp+10]
 006EC9F9    faddp       st(1),st
 006EC9FB    fstp        tbyte ptr [esp+1C]
 006EC9FF    wait
 006ECA00    fld         dword ptr [ebx+0C]
 006ECA03    fmul        st,st(0)
 006ECA05    fld         tbyte ptr [esp+1C]
 006ECA09    faddp       st(1),st
 006ECA0B    add         esp,0FFFFFFF4
 006ECA0E    fstp        tbyte ptr [esp]
 006ECA11    wait
 006ECA12    call        Sqrt
 006ECA17    fstp        qword ptr [esp]
 006ECA1A    wait
>006ECA1B    jmp         006ECA59
 006ECA1D    movzx       eax,byte ptr [ebx+31]
 006ECA21    call        00686074
 006ECA26    fstp        qword ptr [esp]
 006ECA29    wait
>006ECA2A    jmp         006ECA59
 006ECA2C    fld         dword ptr [ebx+20]
 006ECA2F    fstp        qword ptr [esp]
 006ECA32    wait
>006ECA33    jmp         006ECA59
 006ECA35    fld         dword ptr [ebx+14]
 006ECA38    fstp        qword ptr [esp]
 006ECA3B    wait
>006ECA3C    jmp         006ECA59
 006ECA3E    fld         dword ptr [ebx+18]
 006ECA41    fstp        qword ptr [esp]
 006ECA44    wait
>006ECA45    jmp         006ECA59
 006ECA47    fld         dword ptr [ebx+1C]
 006ECA4A    fstp        qword ptr [esp]
 006ECA4D    wait
>006ECA4E    jmp         006ECA59
 006ECA50    xor         eax,eax
 006ECA52    mov         dword ptr [esp],eax
 006ECA55    mov         dword ptr [esp+4],eax
 006ECA59    fld         qword ptr [esp]
 006ECA5C    add         esp,28
 006ECA5F    pop         ebx
 006ECA60    ret
*}
end;

//006ECA64
procedure TD3DCameraValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 006ECA64    push        ebp
 006ECA65    mov         ebp,esp
 006ECA67    push        ebx
 006ECA68    push        esi
 006ECA69    push        edi
 006ECA6A    mov         edi,ecx
 006ECA6C    mov         esi,edx
 006ECA6E    cmp         dword ptr ds:[822740],0;gvar_00822740:TD3DCamera
>006ECA75    jne         006ECA94
 006ECA77    xor         eax,eax
 006ECA79    mov         dword ptr [esi],eax
 006ECA7B    mov         dword ptr [esi+4],eax
 006ECA7E    xor         eax,eax
 006ECA80    mov         dword ptr [edi],eax
 006ECA82    mov         dword ptr [edi+4],eax
 006ECA85    mov         eax,dword ptr [ebp+8]
 006ECA88    xor         edx,edx
 006ECA8A    mov         dword ptr [eax],edx
 006ECA8C    mov         dword ptr [eax+4],edx
>006ECA8F    jmp         006ECD39
 006ECA94    mov         ebx,dword ptr ds:[822740];gvar_00822740:TD3DCamera
 006ECA9A    mov         edx,dword ptr [eax+20];TD3DCameraValue.........................................Item:Inte...
 006ECA9D    add         edx,0FFFFFFFA
 006ECAA0    cmp         edx,10
>006ECAA3    ja          006ECD2C
 006ECAA9    jmp         dword ptr [edx*4+6ECAB0]
 006ECAA9    dd          006ECAF4
 006ECAA9    dd          006ECD2C
 006ECAA9    dd          006ECD2C
 006ECAA9    dd          006ECD2C
 006ECAA9    dd          006ECD2C
 006ECAA9    dd          006ECB42
 006ECAA9    dd          006ECB9C
 006ECAA9    dd          006ECB5C
 006ECAA9    dd          006ECB0E
 006ECAA9    dd          006ECB28
 006ECAA9    dd          006ECB7C
 006ECAA9    dd          006ECC98
 006ECAA9    dd          006ECCE0
 006ECAA9    dd          006ECC4B
 006ECAA9    dd          006ECBFE
 006ECAA9    dd          006ECBBC
 006ECAA9    dd          006ECBDD
 006ECAF4    fld         dword ptr [ebx+4]
 006ECAF7    fstp        qword ptr [esi]
 006ECAF9    wait
 006ECAFA    fld         dword ptr [ebx+8]
 006ECAFD    fstp        qword ptr [edi]
 006ECAFF    wait
 006ECB00    fld         dword ptr [ebx+0C]
 006ECB03    mov         eax,dword ptr [ebp+8]
 006ECB06    fstp        qword ptr [eax]
 006ECB08    wait
>006ECB09    jmp         006ECD39
 006ECB0E    fld         dword ptr [ebx+3C]
 006ECB11    fstp        qword ptr [esi]
 006ECB13    wait
 006ECB14    fld         dword ptr [ebx+4C]
 006ECB17    fstp        qword ptr [edi]
 006ECB19    wait
 006ECB1A    fld         dword ptr [ebx+5C]
 006ECB1D    mov         eax,dword ptr [ebp+8]
 006ECB20    fstp        qword ptr [eax]
 006ECB22    wait
>006ECB23    jmp         006ECD39
 006ECB28    fld         dword ptr [ebx+40]
 006ECB2B    fstp        qword ptr [esi]
 006ECB2D    wait
 006ECB2E    fld         dword ptr [ebx+50]
 006ECB31    fstp        qword ptr [edi]
 006ECB33    wait
 006ECB34    fld         dword ptr [ebx+60]
 006ECB37    mov         eax,dword ptr [ebp+8]
 006ECB3A    fstp        qword ptr [eax]
 006ECB3C    wait
>006ECB3D    jmp         006ECD39
 006ECB42    fld         dword ptr [ebx+44]
 006ECB45    fstp        qword ptr [esi]
 006ECB47    wait
 006ECB48    fld         dword ptr [ebx+54]
 006ECB4B    fstp        qword ptr [edi]
 006ECB4D    wait
 006ECB4E    fld         dword ptr [ebx+64]
 006ECB51    mov         eax,dword ptr [ebp+8]
 006ECB54    fstp        qword ptr [eax]
 006ECB56    wait
>006ECB57    jmp         006ECD39
 006ECB5C    fld         dword ptr [ebx+3C]
 006ECB5F    fchs
 006ECB61    fstp        qword ptr [esi]
 006ECB63    wait
 006ECB64    fld         dword ptr [ebx+4C]
 006ECB67    fchs
 006ECB69    fstp        qword ptr [edi]
 006ECB6B    wait
 006ECB6C    fld         dword ptr [ebx+5C]
 006ECB6F    fchs
 006ECB71    mov         eax,dword ptr [ebp+8]
 006ECB74    fstp        qword ptr [eax]
 006ECB76    wait
>006ECB77    jmp         006ECD39
 006ECB7C    fld         dword ptr [ebx+40]
 006ECB7F    fchs
 006ECB81    fstp        qword ptr [esi]
 006ECB83    wait
 006ECB84    fld         dword ptr [ebx+50]
 006ECB87    fchs
 006ECB89    fstp        qword ptr [edi]
 006ECB8B    wait
 006ECB8C    fld         dword ptr [ebx+60]
 006ECB8F    fchs
 006ECB91    mov         eax,dword ptr [ebp+8]
 006ECB94    fstp        qword ptr [eax]
 006ECB96    wait
>006ECB97    jmp         006ECD39
 006ECB9C    fld         dword ptr [ebx+44]
 006ECB9F    fchs
 006ECBA1    fstp        qword ptr [esi]
 006ECBA3    wait
 006ECBA4    fld         dword ptr [ebx+54]
 006ECBA7    fchs
 006ECBA9    fstp        qword ptr [edi]
 006ECBAB    wait
 006ECBAC    fld         dword ptr [ebx+64]
 006ECBAF    fchs
 006ECBB1    mov         eax,dword ptr [ebp+8]
 006ECBB4    fstp        qword ptr [eax]
 006ECBB6    wait
>006ECBB7    jmp         006ECD39
 006ECBBC    xor         eax,eax
 006ECBBE    mov         dword ptr [esi],eax
 006ECBC0    mov         dword ptr [esi+4],eax
 006ECBC3    xor         eax,eax
 006ECBC5    mov         dword ptr [edi],eax
 006ECBC7    mov         dword ptr [edi+4],3FF00000
 006ECBCE    mov         eax,dword ptr [ebp+8]
 006ECBD1    xor         edx,edx
 006ECBD3    mov         dword ptr [eax],edx
 006ECBD5    mov         dword ptr [eax+4],edx
>006ECBD8    jmp         006ECD39
 006ECBDD    xor         eax,eax
 006ECBDF    mov         dword ptr [esi],eax
 006ECBE1    mov         dword ptr [esi+4],eax
 006ECBE4    xor         eax,eax
 006ECBE6    mov         dword ptr [edi],eax
 006ECBE8    mov         dword ptr [edi+4],0BFF00000
 006ECBEF    mov         eax,dword ptr [ebp+8]
 006ECBF2    xor         edx,edx
 006ECBF4    mov         dword ptr [eax],edx
 006ECBF6    mov         dword ptr [eax+4],edx
>006ECBF9    jmp         006ECD39
 006ECBFE    fld         tbyte ptr ds:[6ECD40];3.14159265358979:Extended
 006ECC04    fmul        dword ptr [ebx+28]
 006ECC07    fdiv        dword ptr ds:[6ECD4C];180:Single
 006ECC0D    add         esp,0FFFFFFF4
 006ECC10    fstp        tbyte ptr [esp]
 006ECC13    wait
 006ECC14    call        Sin
 006ECC19    fchs
 006ECC1B    mov         eax,dword ptr [ebp+8]
 006ECC1E    fstp        qword ptr [eax]
 006ECC20    wait
 006ECC21    xor         eax,eax
 006ECC23    mov         dword ptr [edi],eax
 006ECC25    mov         dword ptr [edi+4],eax
 006ECC28    fld         tbyte ptr ds:[6ECD40];3.14159265358979:Extended
 006ECC2E    fmul        dword ptr [ebx+28]
 006ECC31    fdiv        dword ptr ds:[6ECD4C];180:Single
 006ECC37    add         esp,0FFFFFFF4
 006ECC3A    fstp        tbyte ptr [esp]
 006ECC3D    wait
 006ECC3E    call        Cos
 006ECC43    fstp        qword ptr [esi]
 006ECC45    wait
>006ECC46    jmp         006ECD39
 006ECC4B    fld         tbyte ptr ds:[6ECD40];3.14159265358979:Extended
 006ECC51    fmul        dword ptr [ebx+28]
 006ECC54    fdiv        dword ptr ds:[6ECD4C];180:Single
 006ECC5A    add         esp,0FFFFFFF4
 006ECC5D    fstp        tbyte ptr [esp]
 006ECC60    wait
 006ECC61    call        Sin
 006ECC66    mov         eax,dword ptr [ebp+8]
 006ECC69    fstp        qword ptr [eax]
 006ECC6B    wait
 006ECC6C    xor         eax,eax
 006ECC6E    mov         dword ptr [edi],eax
 006ECC70    mov         dword ptr [edi+4],eax
 006ECC73    fld         tbyte ptr ds:[6ECD40];3.14159265358979:Extended
 006ECC79    fmul        dword ptr [ebx+28]
 006ECC7C    fdiv        dword ptr ds:[6ECD4C];180:Single
 006ECC82    add         esp,0FFFFFFF4
 006ECC85    fstp        tbyte ptr [esp]
 006ECC88    wait
 006ECC89    call        Cos
 006ECC8E    fchs
 006ECC90    fstp        qword ptr [esi]
 006ECC92    wait
>006ECC93    jmp         006ECD39
 006ECC98    fld         tbyte ptr ds:[6ECD40];3.14159265358979:Extended
 006ECC9E    fmul        dword ptr [ebx+28]
 006ECCA1    fdiv        dword ptr ds:[6ECD4C];180:Single
 006ECCA7    add         esp,0FFFFFFF4
 006ECCAA    fstp        tbyte ptr [esp]
 006ECCAD    wait
 006ECCAE    call        Cos
 006ECCB3    mov         eax,dword ptr [ebp+8]
 006ECCB6    fstp        qword ptr [eax]
 006ECCB8    wait
 006ECCB9    xor         eax,eax
 006ECCBB    mov         dword ptr [edi],eax
 006ECCBD    mov         dword ptr [edi+4],eax
 006ECCC0    fld         tbyte ptr ds:[6ECD40];3.14159265358979:Extended
 006ECCC6    fmul        dword ptr [ebx+28]
 006ECCC9    fdiv        dword ptr ds:[6ECD4C];180:Single
 006ECCCF    add         esp,0FFFFFFF4
 006ECCD2    fstp        tbyte ptr [esp]
 006ECCD5    wait
 006ECCD6    call        Sin
 006ECCDB    fstp        qword ptr [esi]
 006ECCDD    wait
>006ECCDE    jmp         006ECD39
 006ECCE0    fld         tbyte ptr ds:[6ECD40];3.14159265358979:Extended
 006ECCE6    fmul        dword ptr [ebx+28]
 006ECCE9    fdiv        dword ptr ds:[6ECD4C];180:Single
 006ECCEF    add         esp,0FFFFFFF4
 006ECCF2    fstp        tbyte ptr [esp]
 006ECCF5    wait
 006ECCF6    call        Cos
 006ECCFB    fchs
 006ECCFD    mov         eax,dword ptr [ebp+8]
 006ECD00    fstp        qword ptr [eax]
 006ECD02    wait
 006ECD03    xor         eax,eax
 006ECD05    mov         dword ptr [edi],eax
 006ECD07    mov         dword ptr [edi+4],eax
 006ECD0A    fld         tbyte ptr ds:[6ECD40];3.14159265358979:Extended
 006ECD10    fmul        dword ptr [ebx+28]
 006ECD13    fdiv        dword ptr ds:[6ECD4C];180:Single
 006ECD19    add         esp,0FFFFFFF4
 006ECD1C    fstp        tbyte ptr [esp]
 006ECD1F    wait
 006ECD20    call        Sin
 006ECD25    fchs
 006ECD27    fstp        qword ptr [esi]
 006ECD29    wait
>006ECD2A    jmp         006ECD39
 006ECD2C    mov         edx,dword ptr [ebp+8]
 006ECD2F    push        edx
 006ECD30    mov         ecx,edi
 006ECD32    mov         edx,esi
 006ECD34    call        TExpression.GetVector
 006ECD39    pop         edi
 006ECD3A    pop         esi
 006ECD3B    pop         ebx
 006ECD3C    pop         ebp
 006ECD3D    ret         4
*}
end;

//006ECD50
procedure TD3DCameraValue.SetMatrix(m:TRotMat);
begin
{*
 006ECD50    push        ebx
 006ECD51    push        esi
 006ECD52    push        edi
 006ECD53    add         esp,0FFFFFFA0
 006ECD56    mov         esi,edx
 006ECD58    lea         edi,[esp+18]
 006ECD5C    mov         ecx,12
 006ECD61    rep movs    dword ptr [edi],dword ptr [esi]
 006ECD63    cmp         dword ptr ds:[822740],0;gvar_00822740:TD3DCamera
>006ECD6A    jne         006ECD70
 006ECD6C    xor         ebx,ebx
>006ECD6E    jmp         006ECDB8
 006ECD70    mov         esi,dword ptr ds:[822740];gvar_00822740:TD3DCamera
 006ECD76    mov         bl,1
 006ECD78    mov         eax,dword ptr [eax+20];TD3DCameraValue..........................................Item:Int...
 006ECD7B    sub         eax,1C
>006ECD7E    jne         006ECDB6
 006ECD80    lea         eax,[esp+10]
 006ECD84    push        eax
 006ECD85    lea         ecx,[esp+0C]
 006ECD89    lea         edx,[esp+4]
 006ECD8D    lea         eax,[esp+1C]
 006ECD91    call        005C3550
 006ECD96    fld         qword ptr [esp]
 006ECD99    fstp        dword ptr [esi+28]
 006ECD9C    wait
 006ECD9D    fld         qword ptr [esp+8]
 006ECDA1    fstp        dword ptr [esi+24]
 006ECDA4    wait
 006ECDA5    fld         qword ptr [esp+10]
 006ECDA9    fstp        dword ptr [esi+2C]
 006ECDAC    wait
 006ECDAD    mov         eax,esi
 006ECDAF    call        TD3DCamera.UpdateViewMatrix
>006ECDB4    jmp         006ECDB8
 006ECDB6    xor         ebx,ebx
 006ECDB8    mov         eax,ebx
 006ECDBA    add         esp,60
 006ECDBD    pop         edi
 006ECDBE    pop         esi
 006ECDBF    pop         ebx
 006ECDC0    ret
*}
end;

//006ECDC4
{*function TD3DCameraValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 006ECDC4    push        ebp
 006ECDC5    mov         ebp,esp
 006ECDC7    push        ebx
 006ECDC8    push        esi
 006ECDC9    cmp         dword ptr ds:[822740],0;gvar_00822740:TD3DCamera
>006ECDD0    jne         006ECDD9
 006ECDD2    xor         ebx,ebx
>006ECDD4    jmp         006ECF63
 006ECDD9    mov         esi,dword ptr ds:[822740];gvar_00822740:TD3DCamera
 006ECDDF    mov         bl,1
 006ECDE1    mov         edx,dword ptr [eax+20];TD3DCameraValue...........................................Item:In...
 006ECDE4    cmp         edx,1D
>006ECDE7    ja          006ECF61
 006ECDED    jmp         dword ptr [edx*4+6ECDF4]
 006ECDED    dd          006ECE6C
 006ECDED    dd          006ECE7F
 006ECDED    dd          006ECE92
 006ECDED    dd          006ECEA5
 006ECDED    dd          006ECEEE
 006ECDED    dd          006ECEFB
 006ECDED    dd          006ECF38
 006ECDED    dd          006ECEB8
 006ECDED    dd          006ECECB
 006ECDED    dd          006ECEDE
 006ECDED    dd          006ECF61
 006ECDED    dd          006ECF52
 006ECDED    dd          006ECF52
 006ECDED    dd          006ECF52
 006ECDED    dd          006ECF52
 006ECDED    dd          006ECF52
 006ECDED    dd          006ECF52
 006ECDED    dd          006ECF52
 006ECDED    dd          006ECF52
 006ECDED    dd          006ECF52
 006ECDED    dd          006ECF52
 006ECDED    dd          006ECF52
 006ECDED    dd          006ECF52
 006ECDED    dd          006ECF04
 006ECDED    dd          006ECF0D
 006ECDED    dd          006ECF61
 006ECDED    dd          006ECF2F
 006ECDED    dd          006ECF1F
 006ECDED    dd          006ECF61
 006ECDED    dd          006ECF16
 006ECE6C    push        dword ptr [ebp+0C]
 006ECE6F    push        dword ptr [ebp+8]
 006ECE72    call        00686060
 006ECE77    mov         byte ptr [esi+30],al
>006ECE7A    jmp         006ECF63
 006ECE7F    fld         qword ptr [ebp+8]
 006ECE82    fstp        dword ptr [esi+4]
 006ECE85    wait
 006ECE86    mov         eax,esi
 006ECE88    call        TD3DCamera.UpdateViewMatrix
>006ECE8D    jmp         006ECF63
 006ECE92    fld         qword ptr [ebp+8]
 006ECE95    fstp        dword ptr [esi+8]
 006ECE98    wait
 006ECE99    mov         eax,esi
 006ECE9B    call        TD3DCamera.UpdateViewMatrix
>006ECEA0    jmp         006ECF63
 006ECEA5    fld         qword ptr [ebp+8]
 006ECEA8    fstp        dword ptr [esi+0C]
 006ECEAB    wait
 006ECEAC    mov         eax,esi
 006ECEAE    call        TD3DCamera.UpdateViewMatrix
>006ECEB3    jmp         006ECF63
 006ECEB8    fld         qword ptr [ebp+8]
 006ECEBB    fstp        dword ptr [esi+28]
 006ECEBE    wait
 006ECEBF    mov         eax,esi
 006ECEC1    call        TD3DCamera.UpdateViewMatrix
>006ECEC6    jmp         006ECF63
 006ECECB    fld         qword ptr [ebp+8]
 006ECECE    fstp        dword ptr [esi+24]
 006ECED1    wait
 006ECED2    mov         eax,esi
 006ECED4    call        TD3DCamera.UpdateViewMatrix
>006ECED9    jmp         006ECF63
 006ECEDE    fld         qword ptr [ebp+8]
 006ECEE1    fstp        dword ptr [esi+2C]
 006ECEE4    wait
 006ECEE5    mov         eax,esi
 006ECEE7    call        TD3DCamera.UpdateViewMatrix
>006ECEEC    jmp         006ECF63
 006ECEEE    fld         qword ptr [ebp+8]
 006ECEF1    call        @ROUND
 006ECEF6    mov         dword ptr [esi+34],eax
>006ECEF9    jmp         006ECF63
 006ECEFB    fld         qword ptr [ebp+8]
 006ECEFE    fstp        dword ptr [esi+10]
 006ECF01    wait
>006ECF02    jmp         006ECF63
 006ECF04    fld         qword ptr [ebp+8]
 006ECF07    fstp        dword ptr [esi+14]
 006ECF0A    wait
>006ECF0B    jmp         006ECF63
 006ECF0D    fld         qword ptr [ebp+8]
 006ECF10    fstp        dword ptr [esi+18]
 006ECF13    wait
>006ECF14    jmp         006ECF63
 006ECF16    fld         qword ptr [ebp+8]
 006ECF19    fstp        dword ptr [esi+1C]
 006ECF1C    wait
>006ECF1D    jmp         006ECF63
 006ECF1F    push        dword ptr [ebp+0C]
 006ECF22    push        dword ptr [ebp+8]
 006ECF25    call        00686060
 006ECF2A    mov         byte ptr [esi+31],al
>006ECF2D    jmp         006ECF63
 006ECF2F    fld         qword ptr [ebp+8]
 006ECF32    fstp        dword ptr [esi+20]
 006ECF35    wait
>006ECF36    jmp         006ECF63
 006ECF38    fld         qword ptr [ebp+8]
 006ECF3B    fstp        dword ptr [esi+0C]
 006ECF3E    wait
 006ECF3F    xor         eax,eax
 006ECF41    mov         dword ptr [esi+4],eax
 006ECF44    xor         eax,eax
 006ECF46    mov         dword ptr [esi+8],eax
 006ECF49    mov         eax,esi
 006ECF4B    call        TD3DCamera.UpdateViewMatrix
>006ECF50    jmp         006ECF63
 006ECF52    push        dword ptr [ebp+0C]
 006ECF55    push        dword ptr [ebp+8]
 006ECF58    call        TExpression.SetValue
 006ECF5D    mov         ebx,eax
>006ECF5F    jmp         006ECF63
 006ECF61    xor         ebx,ebx
 006ECF63    mov         eax,ebx
 006ECF65    pop         esi
 006ECF66    pop         ebx
 006ECF67    pop         ebp
 006ECF68    ret         8
end;*}

//006ECF6C
{*function TD3DCameraValue.SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;
begin
 006ECF6C    push        ebp
 006ECF6D    mov         ebp,esp
 006ECF6F    push        ebx
 006ECF70    cmp         dword ptr ds:[822740],0;gvar_00822740:TD3DCamera
>006ECF77    jne         006ECF7D
 006ECF79    xor         ebx,ebx
>006ECF7B    jmp         006ECFC4
 006ECF7D    mov         edx,dword ptr ds:[822740];gvar_00822740:TD3DCamera
 006ECF83    mov         bl,1
 006ECF85    mov         ecx,dword ptr [eax+20];TD3DCameraValue............................................Item:I...
 006ECF88    sub         ecx,6
>006ECF8B    jne         006ECFAB
 006ECF8D    fld         qword ptr [ebp+18]
 006ECF90    fstp        dword ptr [edx+4]
 006ECF93    wait
 006ECF94    fld         qword ptr [ebp+10]
 006ECF97    fstp        dword ptr [edx+8]
 006ECF9A    wait
 006ECF9B    fld         qword ptr [ebp+8]
 006ECF9E    fstp        dword ptr [edx+0C]
 006ECFA1    wait
 006ECFA2    mov         eax,edx
 006ECFA4    call        TD3DCamera.UpdateViewMatrix
>006ECFA9    jmp         006ECFC4
 006ECFAB    push        dword ptr [ebp+1C]
 006ECFAE    push        dword ptr [ebp+18]
 006ECFB1    push        dword ptr [ebp+14]
 006ECFB4    push        dword ptr [ebp+10]
 006ECFB7    push        dword ptr [ebp+0C]
 006ECFBA    push        dword ptr [ebp+8]
 006ECFBD    call        TExpression.SetVector
 006ECFC2    mov         ebx,eax
 006ECFC4    mov         eax,ebx
 006ECFC6    pop         ebx
 006ECFC7    pop         ebp
 006ECFC8    ret         18
end;*}

//006ECFCC
{*procedure TD3DCameraValue.ToString(?:?);
begin
 006ECFCC    push        ebp
 006ECFCD    mov         ebp,esp
 006ECFCF    push        0
 006ECFD1    push        0
 006ECFD3    push        0
 006ECFD5    push        ebx
 006ECFD6    push        esi
 006ECFD7    push        edi
 006ECFD8    mov         esi,edx
 006ECFDA    mov         ebx,eax
 006ECFDC    xor         eax,eax
 006ECFDE    push        ebp
 006ECFDF    push        6ED059
 006ECFE4    push        dword ptr fs:[eax]
 006ECFE7    mov         dword ptr fs:[eax],esp
 006ECFEA    mov         edi,dword ptr [ebx+18];TD3DCameraValue.....................................................
 006ECFED    test        edi,edi
>006ECFEF    jle         006ED024
 006ECFF1    push        6ED074;'D3DCamera'
 006ECFF6    lea         edx,[ebp-4]
 006ECFF9    mov         eax,edi
 006ECFFB    call        IntToStr
 006ED000    push        dword ptr [ebp-4]
 006ED003    push        6ED094;'.'
 006ED008    lea         edx,[ebp-8]
 006ED00B    mov         eax,dword ptr [ebx+20];TD3DCameraValue.............................................Item:...
 006ED00E    call        006EBC00
 006ED013    push        dword ptr [ebp-8]
 006ED016    mov         eax,esi
 006ED018    mov         edx,4
 006ED01D    call        @UStrCatN
>006ED022    jmp         006ED03E
 006ED024    lea         edx,[ebp-0C]
 006ED027    mov         eax,dword ptr [ebx+20];TD3DCameraValue..............................................Item...
 006ED02A    call        006EBC00
 006ED02F    mov         ecx,dword ptr [ebp-0C]
 006ED032    mov         eax,esi
 006ED034    mov         edx,6ED0A4;'D3DCamera.'
 006ED039    call        @UStrCat3
 006ED03E    xor         eax,eax
 006ED040    pop         edx
 006ED041    pop         ecx
 006ED042    pop         ecx
 006ED043    mov         dword ptr fs:[eax],edx
 006ED046    push        6ED060
 006ED04B    lea         eax,[ebp-0C]
 006ED04E    mov         edx,3
 006ED053    call        @UStrArrayClr
 006ED058    ret
>006ED059    jmp         @HandleFinally
>006ED05E    jmp         006ED04B
 006ED060    pop         edi
 006ED061    pop         esi
 006ED062    pop         ebx
 006ED063    mov         esp,ebp
 006ED065    pop         ebp
 006ED066    ret
end;*}

//006ED0BC
constructor TD3DCamera.Create;
begin
{*
 006ED0BC    push        ebx
 006ED0BD    push        esi
 006ED0BE    test        dl,dl
>006ED0C0    je          006ED0CA
 006ED0C2    add         esp,0FFFFFFF0
 006ED0C5    call        @ClassCreate
 006ED0CA    mov         ebx,edx
 006ED0CC    mov         esi,eax
 006ED0CE    mov         dword ptr [esi+0C],0C0A00000;TD3DCamera.z:Single
 006ED0D5    mov         dword ptr [esi+10],42340000;TD3DCamera.fov:Single
 006ED0DC    mov         dword ptr [esi+14],3E99999A;TD3DCamera.nearclip:Single
 006ED0E3    mov         dword ptr [esi+18],42C80000;TD3DCamera.farclip:Single
 006ED0EA    mov         byte ptr [esi+30],1;TD3DCamera.Visible:Boolean
 006ED0EE    mov         dword ptr [esi+20],3D23D70A;TD3DCamera.eyesep:Single
 006ED0F5    mov         byte ptr [esi+31],0;TD3DCamera.Stereo:Boolean
 006ED0F9    mov         dword ptr [esi+1C],3F800000;TD3DCamera.ScreenDepth:Single
 006ED100    mov         dword ptr [esi+34],808080;TD3DCamera.BackgroundColour:Cardinal
 006ED107    mov         dword ptr [esi+38],202020;TD3DCamera.AmbientColour:Cardinal
 006ED10E    mov         eax,esi
 006ED110    call        TD3DCamera.UpdateViewMatrix
 006ED115    mov         eax,esi
 006ED117    test        bl,bl
>006ED119    je          006ED12A
 006ED11B    call        @AfterConstruction
 006ED120    pop         dword ptr fs:[0]
 006ED127    add         esp,0C
 006ED12A    mov         eax,esi
 006ED12C    pop         esi
 006ED12D    pop         ebx
 006ED12E    ret
*}
end;

//006ED130
procedure TD3DCamera.Render(Panel:TD3D9Panel; Device:IDirect3DDevice9; eye:Integer);
begin
{*
 006ED130    push        ebp
 006ED131    mov         ebp,esp
 006ED133    add         esp,0FFFFFF64
 006ED139    push        ebx
 006ED13A    push        esi
 006ED13B    push        edi
 006ED13C    mov         dword ptr [ebp-4],ecx
 006ED13F    mov         ebx,edx
 006ED141    mov         esi,eax
 006ED143    mov         edi,dword ptr [ebp+8]
 006ED146    mov         eax,dword ptr [ebp-4]
 006ED149    call        @IntfAddRef
 006ED14E    xor         eax,eax
 006ED150    push        ebp
 006ED151    push        6ED4F8
 006ED156    push        dword ptr fs:[eax]
 006ED159    mov         dword ptr fs:[eax],esp
 006ED15C    test        esi,esi
>006ED15E    je          006ED166
 006ED160    cmp         byte ptr [esi+30],0;TD3DCamera.Visible:Boolean
>006ED164    jne         006ED19E
 006ED166    push        0
 006ED168    push        3F800000
 006ED16D    push        0
 006ED16F    push        3
 006ED171    push        0
 006ED173    push        0
 006ED175    mov         eax,dword ptr [ebp-4]
 006ED178    push        eax
 006ED179    mov         eax,dword ptr [eax]
 006ED17B    call        dword ptr [eax+0AC]
 006ED181    mov         eax,dword ptr [ebp-4]
 006ED184    push        eax
 006ED185    mov         eax,dword ptr [eax]
 006ED187    call        dword ptr [eax+0A4]
 006ED18D    mov         eax,dword ptr [ebp-4]
 006ED190    push        eax
 006ED191    mov         eax,dword ptr [eax]
 006ED193    call        dword ptr [eax+0A8]
>006ED199    jmp         006ED4E2
 006ED19E    test        edi,edi
>006ED1A0    jne         006ED233
 006ED1A6    push        0
 006ED1A8    push        3F800000
 006ED1AD    mov         eax,[00822740];gvar_00822740:TD3DCamera
 006ED1B2    mov         eax,dword ptr [eax+34]
 006ED1B5    push        eax
 006ED1B6    push        3
 006ED1B8    push        0
 006ED1BA    push        0
 006ED1BC    mov         eax,dword ptr [ebp-4]
 006ED1BF    push        eax
 006ED1C0    mov         eax,dword ptr [eax]
 006ED1C2    call        dword ptr [eax+0AC]
 006ED1C8    mov         eax,dword ptr [ebp-4]
 006ED1CB    push        eax
 006ED1CC    mov         eax,dword ptr [eax]
 006ED1CE    call        dword ptr [eax+0A4]
 006ED1D4    push        7
 006ED1D6    push        0A8
 006ED1DB    mov         eax,dword ptr [ebp-4]
 006ED1DE    push        eax
 006ED1DF    mov         eax,dword ptr [eax]
 006ED1E1    call        dword ptr [eax+0E4]
 006ED1E7    lea         eax,[esi+3C];TD3DCamera.ViewMatrix:_D3DMATRIX
 006ED1EA    push        eax
 006ED1EB    push        2
 006ED1ED    mov         eax,dword ptr [ebp-4]
 006ED1F0    push        eax
 006ED1F1    mov         eax,dword ptr [eax]
 006ED1F3    call        dword ptr [eax+0B0]
 006ED1F9    push        dword ptr [esi+18];TD3DCamera.farclip:Single
 006ED1FC    push        dword ptr [esi+14];TD3DCamera.nearclip:Single
 006ED1FF    fild        dword ptr [ebx+48];TD3D9Panel.FWidth:Integer
 006ED202    fild        dword ptr [ebx+4C];TD3D9Panel.FHeight:Integer
 006ED205    fdivp       st(1),st
 006ED207    add         esp,0FFFFFFFC
 006ED20A    fstp        dword ptr [esp]
 006ED20D    wait
 006ED20E    fld         dword ptr [esi+10];TD3DCamera.fov:Single
 006ED211    mov         eax,[0078D48C];^gvar_0078C364:Single
 006ED216    fmul        dword ptr [eax]
 006ED218    fdiv        dword ptr ds:[6ED508];180:Single
 006ED21E    add         esp,0FFFFFFFC
 006ED221    fstp        dword ptr [esp]
 006ED224    wait
 006ED225    lea         eax,[ebp-5C]
 006ED228    push        eax
 006ED229    call        d3dx9_33.D3DXMatrixPerspectiveFovLH
>006ED22E    jmp         006ED4A8
 006ED233    cmp         edi,1
>006ED236    jne         006ED370
 006ED23C    push        0
 006ED23E    push        3F800000
 006ED243    mov         eax,[00822740];gvar_00822740:TD3DCamera
 006ED248    mov         eax,dword ptr [eax+34]
 006ED24B    push        eax
 006ED24C    push        2
 006ED24E    push        0
 006ED250    push        0
 006ED252    mov         eax,dword ptr [ebp-4]
 006ED255    push        eax
 006ED256    mov         eax,dword ptr [eax]
 006ED258    call        dword ptr [eax+0AC]
 006ED25E    push        1
 006ED260    push        0A8
 006ED265    mov         eax,dword ptr [ebp-4]
 006ED268    push        eax
 006ED269    mov         eax,dword ptr [eax]
 006ED26B    call        dword ptr [eax+0E4]
 006ED271    fld         dword ptr [esi+3C];TD3DCamera.ViewMatrix:_D3DMATRIX
 006ED274    fmul        dword ptr [esi+20];TD3DCamera.eyesep:Single
 006ED277    fmul        dword ptr ds:[6ED50C];0.5:Single
 006ED27D    fstp        dword ptr [ebp-8]
 006ED280    wait
 006ED281    fld         dword ptr [esi+4C];TD3DCamera.ViewMatrix._21:TD3DValue
 006ED284    fmul        dword ptr [esi+20];TD3DCamera.eyesep:Single
 006ED287    fmul        dword ptr ds:[6ED50C];0.5:Single
 006ED28D    fstp        dword ptr [ebp-0C]
 006ED290    wait
 006ED291    fld         dword ptr [esi+5C];TD3DCamera.ViewMatrix._31:TD3DValue
 006ED294    fmul        dword ptr [esi+20];TD3DCamera.eyesep:Single
 006ED297    fmul        dword ptr ds:[6ED50C];0.5:Single
 006ED29D    fstp        dword ptr [ebp-10]
 006ED2A0    wait
 006ED2A1    push        dword ptr [ebp-10]
 006ED2A4    push        dword ptr [ebp-0C]
 006ED2A7    push        dword ptr [ebp-8]
 006ED2AA    lea         eax,[ebp-9C]
 006ED2B0    push        eax
 006ED2B1    call        d3dx9_33.D3DXMatrixTranslation
 006ED2B6    lea         eax,[esi+3C];TD3DCamera.ViewMatrix:_D3DMATRIX
 006ED2B9    push        eax
 006ED2BA    lea         eax,[ebp-9C]
 006ED2C0    push        eax
 006ED2C1    lea         eax,[ebp-5C]
 006ED2C4    push        eax
 006ED2C5    call        d3dx9_33.D3DXMatrixMultiply
 006ED2CA    lea         eax,[ebp-5C]
 006ED2CD    push        eax
 006ED2CE    push        2
 006ED2D0    mov         eax,dword ptr [ebp-4]
 006ED2D3    push        eax
 006ED2D4    mov         eax,dword ptr [eax]
 006ED2D6    call        dword ptr [eax+0B0]
 006ED2DC    fld         dword ptr [esi+14];TD3DCamera.nearclip:Single
 006ED2DF    fdiv        dword ptr [esi+1C];TD3DCamera.ScreenDepth:Single
 006ED2E2    fstp        dword ptr [ebp-14]
 006ED2E5    wait
 006ED2E6    fld         tbyte ptr ds:[6ED510];3.14159265358979:Extended
 006ED2EC    fmul        dword ptr [esi+10];TD3DCamera.fov:Single
 006ED2EF    fdiv        dword ptr ds:[6ED508];180:Single
 006ED2F5    fdiv        dword ptr ds:[6ED51C];2:Single
 006ED2FB    add         esp,0FFFFFFF4
 006ED2FE    fstp        tbyte ptr [esp]
 006ED301    wait
 006ED302    call        00454ACC
 006ED307    fmul        dword ptr [esi+14];TD3DCamera.nearclip:Single
 006ED30A    fstp        dword ptr [ebp-1C]
 006ED30D    wait
 006ED30E    fild        dword ptr [ebx+48];TD3D9Panel.FWidth:Integer
 006ED311    fmul        dword ptr [ebp-1C]
 006ED314    fild        dword ptr [ebx+4C];TD3D9Panel.FHeight:Integer
 006ED317    fdivp       st(1),st
 006ED319    fstp        dword ptr [ebp-18]
 006ED31C    wait
 006ED31D    push        dword ptr [esi+18];TD3DCamera.farclip:Single
 006ED320    push        dword ptr [esi+14];TD3DCamera.nearclip:Single
 006ED323    push        dword ptr [ebp-1C]
 006ED326    fld         dword ptr [ebp-1C]
 006ED329    fchs
 006ED32B    add         esp,0FFFFFFFC
 006ED32E    fstp        dword ptr [esp]
 006ED331    wait
 006ED332    fld         dword ptr [esi+20];TD3DCamera.eyesep:Single
 006ED335    fmul        dword ptr ds:[6ED50C];0.5:Single
 006ED33B    fmul        dword ptr [ebp-14]
 006ED33E    fadd        dword ptr [ebp-18]
 006ED341    add         esp,0FFFFFFFC
 006ED344    fstp        dword ptr [esp]
 006ED347    wait
 006ED348    fld         dword ptr [esi+20];TD3DCamera.eyesep:Single
 006ED34B    fmul        dword ptr ds:[6ED50C];0.5:Single
 006ED351    fmul        dword ptr [ebp-14]
 006ED354    fld         dword ptr [ebp-18]
 006ED357    fchs
 006ED359    faddp       st(1),st
 006ED35B    add         esp,0FFFFFFFC
 006ED35E    fstp        dword ptr [esp]
 006ED361    wait
 006ED362    lea         eax,[ebp-5C]
 006ED365    push        eax
 006ED366    call        d3dx9_33.D3DXMatrixPerspectiveOffCenterLH
>006ED36B    jmp         006ED4A8
 006ED370    cmp         edi,2
>006ED373    jne         006ED4A8
 006ED379    push        0
 006ED37B    push        3F800000
 006ED380    mov         eax,[00822740];gvar_00822740:TD3DCamera
 006ED385    mov         eax,dword ptr [eax+34]
 006ED388    push        eax
 006ED389    push        2
 006ED38B    push        0
 006ED38D    push        0
 006ED38F    mov         eax,dword ptr [ebp-4]
 006ED392    push        eax
 006ED393    mov         eax,dword ptr [eax]
 006ED395    call        dword ptr [eax+0AC]
 006ED39B    push        6
 006ED39D    push        0A8
 006ED3A2    mov         eax,dword ptr [ebp-4]
 006ED3A5    push        eax
 006ED3A6    mov         eax,dword ptr [eax]
 006ED3A8    call        dword ptr [eax+0E4]
 006ED3AE    fld         dword ptr [esi+3C];TD3DCamera.ViewMatrix:_D3DMATRIX
 006ED3B1    fmul        dword ptr [esi+20];TD3DCamera.eyesep:Single
 006ED3B4    fmul        dword ptr ds:[6ED520];-0.5:Single
 006ED3BA    fstp        dword ptr [ebp-8]
 006ED3BD    wait
 006ED3BE    fld         dword ptr [esi+4C];TD3DCamera.ViewMatrix._21:TD3DValue
 006ED3C1    fmul        dword ptr [esi+20];TD3DCamera.eyesep:Single
 006ED3C4    fmul        dword ptr ds:[6ED520];-0.5:Single
 006ED3CA    fstp        dword ptr [ebp-0C]
 006ED3CD    wait
 006ED3CE    fld         dword ptr [esi+5C];TD3DCamera.ViewMatrix._31:TD3DValue
 006ED3D1    fmul        dword ptr [esi+20];TD3DCamera.eyesep:Single
 006ED3D4    fmul        dword ptr ds:[6ED520];-0.5:Single
 006ED3DA    fstp        dword ptr [ebp-10]
 006ED3DD    wait
 006ED3DE    push        dword ptr [ebp-10]
 006ED3E1    push        dword ptr [ebp-0C]
 006ED3E4    push        dword ptr [ebp-8]
 006ED3E7    lea         eax,[ebp-9C]
 006ED3ED    push        eax
 006ED3EE    call        d3dx9_33.D3DXMatrixTranslation
 006ED3F3    lea         eax,[esi+3C];TD3DCamera.ViewMatrix:_D3DMATRIX
 006ED3F6    push        eax
 006ED3F7    lea         eax,[ebp-9C]
 006ED3FD    push        eax
 006ED3FE    lea         eax,[ebp-5C]
 006ED401    push        eax
 006ED402    call        d3dx9_33.D3DXMatrixMultiply
 006ED407    lea         eax,[ebp-5C]
 006ED40A    push        eax
 006ED40B    push        2
 006ED40D    mov         eax,dword ptr [ebp-4]
 006ED410    push        eax
 006ED411    mov         eax,dword ptr [eax]
 006ED413    call        dword ptr [eax+0B0]
 006ED419    fld         dword ptr [esi+14];TD3DCamera.nearclip:Single
 006ED41C    fdiv        dword ptr [esi+1C];TD3DCamera.ScreenDepth:Single
 006ED41F    fstp        dword ptr [ebp-14]
 006ED422    wait
 006ED423    fld         tbyte ptr ds:[6ED510];3.14159265358979:Extended
 006ED429    fmul        dword ptr [esi+10];TD3DCamera.fov:Single
 006ED42C    fdiv        dword ptr ds:[6ED508];180:Single
 006ED432    fdiv        dword ptr ds:[6ED51C];2:Single
 006ED438    add         esp,0FFFFFFF4
 006ED43B    fstp        tbyte ptr [esp]
 006ED43E    wait
 006ED43F    call        00454ACC
 006ED444    fmul        dword ptr [esi+14];TD3DCamera.nearclip:Single
 006ED447    fstp        dword ptr [ebp-1C]
 006ED44A    wait
 006ED44B    fild        dword ptr [ebx+48];TD3D9Panel.FWidth:Integer
 006ED44E    fmul        dword ptr [ebp-1C]
 006ED451    fild        dword ptr [ebx+4C];TD3D9Panel.FHeight:Integer
 006ED454    fdivp       st(1),st
 006ED456    fstp        dword ptr [ebp-18]
 006ED459    wait
 006ED45A    push        dword ptr [esi+18];TD3DCamera.farclip:Single
 006ED45D    push        dword ptr [esi+14];TD3DCamera.nearclip:Single
 006ED460    push        dword ptr [ebp-1C]
 006ED463    fld         dword ptr [ebp-1C]
 006ED466    fchs
 006ED468    add         esp,0FFFFFFFC
 006ED46B    fstp        dword ptr [esp]
 006ED46E    wait
 006ED46F    fld         dword ptr [esi+20];TD3DCamera.eyesep:Single
 006ED472    fmul        dword ptr ds:[6ED50C];0.5:Single
 006ED478    fmul        dword ptr [ebp-14]
 006ED47B    fsubr       dword ptr [ebp-18]
 006ED47E    add         esp,0FFFFFFFC
 006ED481    fstp        dword ptr [esp]
 006ED484    wait
 006ED485    fld         dword ptr [esi+20];TD3DCamera.eyesep:Single
 006ED488    fmul        dword ptr ds:[6ED50C];0.5:Single
 006ED48E    fmul        dword ptr [ebp-14]
 006ED491    fld         dword ptr [ebp-18]
 006ED494    fchs
 006ED496    fsubrp      st(1),st
 006ED498    add         esp,0FFFFFFFC
 006ED49B    fstp        dword ptr [esp]
 006ED49E    wait
 006ED49F    lea         eax,[ebp-5C]
 006ED4A2    push        eax
 006ED4A3    call        d3dx9_33.D3DXMatrixPerspectiveOffCenterLH
 006ED4A8    lea         eax,[ebp-5C]
 006ED4AB    push        eax
 006ED4AC    push        3
 006ED4AE    mov         eax,dword ptr [ebp-4]
 006ED4B1    push        eax
 006ED4B2    mov         eax,dword ptr [eax]
 006ED4B4    call        dword ptr [eax+0B0]
 006ED4BA    mov         eax,dword ptr [esi+38];TD3DCamera.AmbientColour:Cardinal
 006ED4BD    push        eax
 006ED4BE    push        8B
 006ED4C3    mov         eax,dword ptr [ebp-4]
 006ED4C6    push        eax
 006ED4C7    mov         eax,dword ptr [eax]
 006ED4C9    call        dword ptr [eax+0E4]
 006ED4CF    push        1
 006ED4D1    push        8F
 006ED4D6    mov         eax,dword ptr [ebp-4]
 006ED4D9    push        eax
 006ED4DA    mov         eax,dword ptr [eax]
 006ED4DC    call        dword ptr [eax+0E4]
 006ED4E2    xor         eax,eax
 006ED4E4    pop         edx
 006ED4E5    pop         ecx
 006ED4E6    pop         ecx
 006ED4E7    mov         dword ptr fs:[eax],edx
 006ED4EA    push        6ED4FF
 006ED4EF    lea         eax,[ebp-4]
 006ED4F2    call        @IntfClear
 006ED4F7    ret
>006ED4F8    jmp         @HandleFinally
>006ED4FD    jmp         006ED4EF
 006ED4FF    pop         edi
 006ED500    pop         esi
 006ED501    pop         ebx
 006ED502    mov         esp,ebp
 006ED504    pop         ebp
 006ED505    ret         4
*}
end;

//006ED524
procedure TD3DCamera.UpdateViewMatrix;
begin
{*
 006ED524    push        ebx
 006ED525    add         esp,0FFFFFF38
 006ED52B    mov         ebx,eax
 006ED52D    fld         dword ptr [ebx+28];TD3DCamera.yaw:Single
 006ED530    fchs
 006ED532    add         esp,0FFFFFFF8
 006ED535    fstp        qword ptr [esp]
 006ED538    wait
 006ED539    fld         dword ptr [ebx+24];TD3DCamera.pitch:Single
 006ED53C    fchs
 006ED53E    add         esp,0FFFFFFF8
 006ED541    fstp        qword ptr [esp]
 006ED544    wait
 006ED545    fld         dword ptr [ebx+2C];TD3DCamera.roll:Single
 006ED548    fchs
 006ED54A    add         esp,0FFFFFFF8
 006ED54D    fstp        qword ptr [esp]
 006ED550    wait
 006ED551    lea         eax,[esp+18]
 006ED555    call        005C361C
 006ED55A    lea         edx,[esp+48]
 006ED55E    mov         eax,esp
 006ED560    call        005C34E8
 006ED565    lea         eax,[esp+88]
 006ED56C    xor         ecx,ecx
 006ED56E    mov         edx,40
 006ED573    call        @FillChar
 006ED578    mov         dword ptr [esp+88],3F800000
 006ED583    mov         dword ptr [esp+9C],3F800000
 006ED58E    mov         dword ptr [esp+0B0],3F800000
 006ED599    mov         dword ptr [esp+0C4],3F800000
 006ED5A4    lea         eax,[esp+88]
 006ED5AB    fld         dword ptr [ebx+4];TD3DCamera.x:Single
 006ED5AE    fchs
 006ED5B0    fstp        dword ptr [esp+0B8]
 006ED5B7    wait
 006ED5B8    fld         dword ptr [ebx+8];TD3DCamera.y:Single
 006ED5BB    fchs
 006ED5BD    fstp        dword ptr [esp+0BC]
 006ED5C4    wait
 006ED5C5    fld         dword ptr [ebx+0C];TD3DCamera.z:Single
 006ED5C8    fchs
 006ED5CA    fstp        dword ptr [esp+0C0]
 006ED5D1    wait
 006ED5D2    lea         eax,[esp+48]
 006ED5D6    push        eax
 006ED5D7    lea         eax,[esp+8C]
 006ED5DE    push        eax
 006ED5DF    lea         eax,[ebx+3C];TD3DCamera.ViewMatrix:_D3DMATRIX
 006ED5E2    push        eax
 006ED5E3    call        d3dx9_33.D3DXMatrixMultiply
 006ED5E8    add         esp,0C8
 006ED5EE    pop         ebx
 006ED5EF    ret
*}
end;

//006ED5F0
{*procedure sub_006ED5F0(?:Pointer; ?:?);
begin
 006ED5F0    push        ebp
 006ED5F1    mov         ebp,esp
 006ED5F3    add         esp,0FFFFFF7C
 006ED5F9    push        ebx
 006ED5FA    mov         dword ptr [ebp-4],edx
 006ED5FD    mov         ebx,eax
 006ED5FF    mov         eax,dword ptr [ebp-4]
 006ED602    call        @IntfAddRef
 006ED607    xor         eax,eax
 006ED609    push        ebp
 006ED60A    push        6ED717
 006ED60F    push        dword ptr fs:[eax]
 006ED612    mov         dword ptr fs:[eax],esp
 006ED615    cmp         byte ptr [ebx+14],0
>006ED619    je          006ED6EF
 006ED61F    lea         eax,[ebp-6C]
 006ED622    xor         ecx,ecx
 006ED624    mov         edx,68
 006ED629    call        @FillChar
 006ED62E    mov         dword ptr [ebp-6C],3
 006ED635    mov         eax,dword ptr [ebx+15]
 006ED638    mov         dword ptr [ebp-68],eax
 006ED63B    mov         eax,dword ptr [ebx+19]
 006ED63E    mov         dword ptr [ebp-64],eax
 006ED641    mov         eax,dword ptr [ebx+1D]
 006ED644    mov         dword ptr [ebp-60],eax
 006ED647    fld         tbyte ptr ds:[6ED724];0.2:Extended
 006ED64D    fmul        dword ptr [ebx+15]
 006ED650    fstp        dword ptr [ebp-48]
 006ED653    wait
 006ED654    fld         tbyte ptr ds:[6ED724];0.2:Extended
 006ED65A    fmul        dword ptr [ebx+19]
 006ED65D    fstp        dword ptr [ebp-44]
 006ED660    wait
 006ED661    fld         tbyte ptr ds:[6ED724];0.2:Extended
 006ED667    fmul        dword ptr [ebx+1D]
 006ED66A    fstp        dword ptr [ebp-40]
 006ED66D    wait
 006ED66E    mov         eax,dword ptr [ebx+15]
 006ED671    mov         dword ptr [ebp-58],eax
 006ED674    mov         eax,dword ptr [ebx+19]
 006ED677    mov         dword ptr [ebp-54],eax
 006ED67A    mov         eax,dword ptr [ebx+1D]
 006ED67D    mov         dword ptr [ebp-50],eax
 006ED680    fld         dword ptr [ebx+8]
 006ED683    fchs
 006ED685    fstp        dword ptr [ebp-84]
 006ED68B    wait
 006ED68C    fld         dword ptr [ebx+0C]
 006ED68F    fchs
 006ED691    fstp        dword ptr [ebp-80]
 006ED694    wait
 006ED695    fld         dword ptr [ebx+10]
 006ED698    fchs
 006ED69A    fstp        dword ptr [ebp-7C]
 006ED69D    wait
 006ED69E    mov         eax,dword ptr [ebp-84]
 006ED6A4    mov         dword ptr [ebp-78],eax
 006ED6A7    mov         eax,dword ptr [ebp-80]
 006ED6AA    mov         dword ptr [ebp-74],eax
 006ED6AD    mov         eax,dword ptr [ebp-7C]
 006ED6B0    mov         dword ptr [ebp-70],eax
 006ED6B3    lea         eax,[ebp-78]
 006ED6B6    push        eax
 006ED6B7    lea         eax,[ebp-2C]
 006ED6BA    push        eax
 006ED6BB    call        d3dx9_33.D3DXVec3Normalize
 006ED6C0    mov         dword ptr [ebp-20],447A0000
 006ED6C7    lea         eax,[ebp-6C]
 006ED6CA    push        eax
 006ED6CB    mov         eax,dword ptr [ebx+4]
 006ED6CE    push        eax
 006ED6CF    mov         eax,dword ptr [ebp-4]
 006ED6D2    push        eax
 006ED6D3    mov         eax,dword ptr [eax]
 006ED6D5    call        dword ptr [eax+0CC]
 006ED6DB    push        0FF
 006ED6DD    mov         eax,dword ptr [ebx+4]
 006ED6E0    push        eax
 006ED6E1    mov         eax,dword ptr [ebp-4]
 006ED6E4    push        eax
 006ED6E5    mov         eax,dword ptr [eax]
 006ED6E7    call        dword ptr [eax+0D4]
>006ED6ED    jmp         006ED701
 006ED6EF    push        0
 006ED6F1    mov         eax,dword ptr [ebx+4]
 006ED6F4    push        eax
 006ED6F5    mov         eax,dword ptr [ebp-4]
 006ED6F8    push        eax
 006ED6F9    mov         eax,dword ptr [eax]
 006ED6FB    call        dword ptr [eax+0D4]
 006ED701    xor         eax,eax
 006ED703    pop         edx
 006ED704    pop         ecx
 006ED705    pop         ecx
 006ED706    mov         dword ptr fs:[eax],edx
 006ED709    push        6ED71E
 006ED70E    lea         eax,[ebp-4]
 006ED711    call        @IntfClear
 006ED716    ret
>006ED717    jmp         @HandleFinally
>006ED71C    jmp         006ED70E
 006ED71E    pop         ebx
 006ED71F    mov         esp,ebp
 006ED721    pop         ebp
 006ED722    ret
end;*}

Initialization
//00782C2C
{*
 00782C2C    sub         dword ptr ds:[822734],1
>00782C33    jae         00782C77
 00782C35    mov         dl,1
 00782C37    mov         eax,[0067D4A4];THashTable
 00782C3C    call        THashTable.Create;THashTable.Create
 00782C41    mov         [00822724],eax;gvar_00822724:THashTable
 00782C46    call        006E8DA8
 00782C4B    mov         dl,1
 00782C4D    mov         eax,[0067D4A4];THashTable
 00782C52    call        THashTable.Create;THashTable.Create
 00782C57    mov         [00822728],eax;gvar_00822728:THashTable
 00782C5C    call        006E90A4
 00782C61    mov         dl,1
 00782C63    mov         eax,[0067D4A4];THashTable
 00782C68    call        THashTable.Create;THashTable.Create
 00782C6D    mov         [0082272C],eax;gvar_0082272C:THashTable
 00782C72    call        006E9208
 00782C77    ret
*}
Finalization
//006ED730
{*
 006ED730    push        ebp
 006ED731    mov         ebp,esp
 006ED733    xor         eax,eax
 006ED735    push        ebp
 006ED736    push        6ED79C
 006ED73B    push        dword ptr fs:[eax]
 006ED73E    mov         dword ptr fs:[eax],esp
 006ED741    inc         dword ptr ds:[822734]
>006ED747    jne         006ED78E
 006ED749    mov         eax,[00822724];gvar_00822724:THashTable
 006ED74E    xor         edx,edx
 006ED750    mov         dword ptr ds:[822724],edx;gvar_00822724:THashTable
 006ED756    call        TObject.Free
 006ED75B    mov         eax,[00822728];gvar_00822728:THashTable
 006ED760    xor         edx,edx
 006ED762    mov         dword ptr ds:[822728],edx;gvar_00822728:THashTable
 006ED768    call        TObject.Free
 006ED76D    mov         eax,[0082272C];gvar_0082272C:THashTable
 006ED772    xor         edx,edx
 006ED774    mov         dword ptr ds:[82272C],edx;gvar_0082272C:THashTable
 006ED77A    call        TObject.Free
 006ED77F    call        006EB928
 006ED784    mov         eax,78C368;gvar_0078C368:IInterface
 006ED789    call        @IntfClear
 006ED78E    xor         eax,eax
 006ED790    pop         edx
 006ED791    pop         ecx
 006ED792    pop         ecx
 006ED793    mov         dword ptr fs:[eax],edx
 006ED796    push        6ED7A3
 006ED79B    ret
>006ED79C    jmp         @HandleFinally
>006ED7A1    jmp         006ED79B
 006ED7A3    pop         ebp
 006ED7A4    ret
*}
end.