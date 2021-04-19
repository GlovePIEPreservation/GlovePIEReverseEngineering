//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit IdStack;

interface

uses
  SysUtils, Classes, ThdTimer, IdException, IdStreamVCL, IdGlobal;

type
  EIdSocketError = class(EIdException)
  published
    constructor CreateError(AMsg:string);//005A9330
  public
    FLastError:Integer;//f18
    constructor CreateError(AMsg:string); virtual;//vC//005A9330
  end;
  EIdStackError = class(EIdException)
  end;
  EIdIPVersionUnsupported = class(EIdStackError)
  end;
  EIdNotASocket = class(EIdSocketError)
  end;
  TIdSocketList = class(TObject)
  published
    procedure Lock;//005A92E8
    procedure ContainsSocket(AHandle:Cardinal);//005A7F94
    procedure Clear;//005A7F8C
    function Select(AReadList:TIdSocketList; AWriteList:TIdSocketList; ATimeout:Integer; AExceptList:TIdSocketList):Boolean;//005A92FC
    procedure Unlock;//005A9318
    procedure SelectReadList(var VSocketList:TIdSocketList; ATimeout:Integer);//005A7FA4
    procedure SelectRead(ATimeout:Integer);//005A7F9C
    procedure Add(AHandle:Cardinal);//005A7F6C
    destructor Destroy();//005A9294
    constructor Create();//005A9220
    procedure Clone;//005A7F74
    procedure Remove(AHandle:Cardinal);//005A7F84
    function CreateSocketList:TIdSocketList;//005A9274
    procedure Count;//005A7F7C
  public
    FLock:TIdCriticalSection;//f4
    destructor Destroy(); virtual;//005A9294
    procedure GetItem; virtual; abstract;//v0//00404A58
    constructor Create(); virtual;//v4//005A9220
    procedure Add; virtual; abstract;//v8//00404A58
    procedure Clone; virtual; abstract;//vC//00404A58
    procedure Count; virtual; abstract;//v10//00404A58
    procedure Remove; virtual; abstract;//v14//00404A58
    procedure Clear; virtual; abstract;//v18//00404A58
    procedure ContainsSocket; virtual; abstract;//v1C//00404A58
    function Select(AReadList:TIdSocketList; AWriteList:TIdSocketList; ATimeout:Integer; AExceptList:TIdSocketList):Boolean; virtual;//v20//005A92FC
    procedure SelectRead; virtual; abstract;//v24//00404A58
    procedure SelectReadList; virtual; abstract;//v28//00404A58
  end;
  TIdStack = class(TObject)
  published
    function ResolveHost(AHost:string; AIPVersion:TIdIPVersion):string;//005A9774
    procedure SetSocketOption(ASocket:Cardinal; ALevel:Integer; AOptVal:Integer; AOptName:Integer);//005A9160
    procedure GetSocketOption(ASocket:Cardinal; ALevel:Integer; AOptVal:Integer; AOptName:Integer);//005A9158
    procedure ReceiveFrom;//005A9178
    procedure Send;//005A9170
    procedure Receive;//005A9168
    function NetworkToHost(AValue:TIdIPv6Address):TIdIPv6Address;//005AA128
    procedure NewSocketHandle(ASocketType:Integer; AProtocol:Integer; AOverlapped:Boolean; AIPVersion:TIdIPVersion);//005A9138
    procedure RaiseSocketError(AErr:Integer);//005A9C0C
    procedure RaiseLastSocketError;//005A9BF0
    procedure NetworkToHost(AValue:Int64);//005A9150
    procedure NetworkToHost(AValue:Cardinal);//005A9148
    procedure NetworkToHost(AValue:Word);//005A9140
    procedure AddMulticastMembership(AHandle:Cardinal; AGroupIP:string; AIPVersion:TIdIPVersion; ALocalIP:string);//005A91B0
    procedure DropMulticastMembership(AHandle:Cardinal; AGroupIP:string; AIPVersion:TIdIPVersion; ALocalIP:string);//005A91A8
    procedure SetLoopBack(AHandle:Cardinal; AValue:Boolean; AIPVersion:TIdIPVersion);//005A91A0
    procedure AddLocalAddressesToList(AAddresses:TStrings);//005A91C0
    procedure WriteChecksum;//005A91B8
    procedure CalcCheckSum(const AData:TIdBytes);//005AA2A8
    procedure SetMulticastTTL(AHandle:Cardinal; AValue:Byte; AIPVersion:TIdIPVersion);//005A9198
    procedure ReceiveMsg;//005A9188
    procedure SendTo;//005A9180
    procedure SendTo(ASocket:TIdStackSocketHandle; const ABuffer:TIdBytes; const AOffset:Integer; const AIP:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion);//005A985C
    function IsValidIPv6MulticastGroup(Value:string):Boolean;//005AA224
    function IsValidIPv4MulticastGroup(Value:string):Boolean;//005AA168
    procedure SupportsIPv6;//005A9190
    procedure DecUsage;//005A989C
    procedure IncUsage;//005A99C8
    procedure IOControl(s:Cardinal; cmd:Cardinal; var arg:Cardinal);//005A90E8
    procedure GetSocketName(ASocket:Cardinal; var VIP:string; var VPort:Word);//005A94E0
    procedure GetPeerName(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word);//005A90F0
    procedure GetPeerName(ASocket:Cardinal; var VIP:string; var VPort:Word);//005A94B0
    procedure Disconnect(ASocket:Cardinal);//005A90E0
    procedure Bind(ASocket:Cardinal; AIP:string; AIPVersion:TIdIPVersion; APort:Word);//005A90D0
    procedure Accept(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word);//005A90C8
    function Accept(ASocket:Cardinal; var VIP:string; var VPort:Word):Cardinal;//005A947C
    destructor Destroy();//005A93C8
    constructor Create();//005A9384
    procedure Connect(ASocket:Cardinal; AIP:string; AIPVersion:TIdIPVersion; APort:Word);//005A90D8
    procedure WSSetLastError(AErr:Integer);//005A9130
    procedure WSGetLastError;//005A9128
    procedure Listen(ASocket:Cardinal; ABackLog:Integer);//005A9120
    procedure CheckForSocketError(const AResult:Integer; const AIgnore:array[$0..-$1] of System.Integer; const _Dv_:$0..-$1);//005A9B84
    function CheckForSocketError(AResult:Integer):Integer;//005A9B5C
    function WSTranslateSocketErrorMsg(AErr:Integer):string;//005A9CAC
    function IsIP(AIP:string):Boolean;//005A95DC
    procedure HostToNetwork(AValue:Word);//005A9108
    procedure HostByAddress(AAddress:string; AIPVersion:TIdIPVersion);//005A9100
    procedure GetSocketName(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word);//005A90F8
    function HostToNetwork(AValue:TIdIPv6Address):TIdIPv6Address;//005AA0E8
    procedure HostToNetwork(AValue:Int64);//005A9118
    procedure HostToNetwork(AValue:Cardinal);//005A9110
  public
    FLocalAddresses:TStrings;//f4
    destructor Destroy(); virtual;//005A93C8
    procedure HostByName; virtual; abstract;//v0//00404A58
    procedure ReadHostName; virtual; abstract;//v4//00404A58
    procedure Accept; virtual; abstract;//v8//00404A58
    procedure Bind; virtual; abstract;//vC//00404A58
    procedure Connect; virtual; abstract;//v10//00404A58
    constructor Create(); virtual;//v14//005A9384
    procedure Disconnect; virtual; abstract;//v18//00404A58
    procedure IOControl; virtual; abstract;//v1C//00404A58
    procedure GetPeerName; virtual; abstract;//v20//00404A58
    procedure GetSocketName; virtual; abstract;//v24//00404A58
    procedure HostByAddress; virtual; abstract;//v28//00404A58
    procedure HostToNetwork; virtual; abstract;//v2C//00404A58
    procedure HostToNetwork; virtual; abstract;//v30//00404A58
    procedure HostToNetwork; virtual; abstract;//v34//00404A58
    function HostToNetwork(AValue:TIdIPv6Address):TIdIPv6Address; virtual;//v38//005AA0E8
    procedure Listen; virtual; abstract;//v3C//00404A58
    procedure WSGetLastError; virtual; abstract;//v40//00404A58
    procedure WSSetLastError; virtual; abstract;//v44//00404A58
    function WSTranslateSocketErrorMsg(AErr:Integer):string; virtual;//v48//005A9CAC
    procedure RaiseSocketError(AErr:Integer); virtual;//v4C//005A9C0C
    procedure NewSocketHandle; virtual; abstract;//v50//00404A58
    procedure NetworkToHost; virtual; abstract;//v54//00404A58
    procedure NetworkToHost; virtual; abstract;//v58//00404A58
    procedure NetworkToHost; virtual; abstract;//v5C//00404A58
    function NetworkToHost(AValue:TIdIPv6Address):TIdIPv6Address; virtual;//v60//005AA128
    procedure GetSocketOption; virtual; abstract;//v64//00404A58
    procedure SetSocketOption; virtual; abstract;//v68//00404A58
    procedure Receive; virtual; abstract;//v6C//00404A58
    procedure Send; virtual; abstract;//v70//00404A58
    procedure ReceiveFrom; virtual; abstract;//v74//00404A58
    procedure SendTo; virtual; abstract;//v78//00404A58
    procedure ReceiveMsg; virtual; abstract;//v7C//00404A58
    procedure SupportsIPv6; virtual; abstract;//v80//00404A58
    procedure SetMulticastTTL; virtual; abstract;//v84//00404A58
    procedure SetLoopBack; virtual; abstract;//v88//00404A58
    procedure DropMulticastMembership; virtual; abstract;//v8C//00404A58
    procedure AddMulticastMembership; virtual; abstract;//v90//00404A58
    procedure CalcCheckSum(const AData:TIdBytes); virtual;//v94//005AA2A8
    procedure WriteChecksum; virtual; abstract;//v98//00404A58
    procedure AddLocalAddressesToList; virtual; abstract;//v9C//00404A58
    procedure IPVersionUnsupported;//005A941C
    function GetLocalAddresses:TStrings;//005A9510
    function GetLocalAddress:UnicodeString;//005A9560
    function MakeCanonicalIPv6Address(const AAddr:UnicodeString):UnicodeString;//005A9754
  end;
    procedure Reset;//005A91C8

implementation

//005A7F6C
procedure TIdSocketList.Add(AHandle:Cardinal);
begin
{*
>005A7F6C    jmp         @AbstractError
*}
end;

//005A7F74
procedure TIdSocketList.Clone;
begin
{*
>005A7F74    jmp         @AbstractError
*}
end;

//005A7F7C
procedure TIdSocketList.Count;
begin
{*
>005A7F7C    jmp         @AbstractError
*}
end;

//005A7F84
procedure TIdSocketList.Remove(AHandle:Cardinal);
begin
{*
>005A7F84    jmp         @AbstractError
*}
end;

//005A7F8C
procedure TIdSocketList.Clear;
begin
{*
>005A7F8C    jmp         @AbstractError
*}
end;

//005A7F94
procedure TIdSocketList.ContainsSocket(AHandle:Cardinal);
begin
{*
>005A7F94    jmp         @AbstractError
*}
end;

//005A7F9C
procedure TIdSocketList.SelectRead(ATimeout:Integer);
begin
{*
>005A7F9C    jmp         @AbstractError
*}
end;

//005A7FA4
procedure TIdSocketList.SelectReadList(var VSocketList:TIdSocketList; ATimeout:Integer);
begin
{*
>005A7FA4    jmp         @AbstractError
*}
end;

//005A90C8
procedure TIdStack.Accept(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word);
begin
{*
>005A90C8    jmp         @AbstractError
*}
end;

//005A90D0
procedure TIdStack.Bind(ASocket:Cardinal; AIP:string; AIPVersion:TIdIPVersion; APort:Word);
begin
{*
>005A90D0    jmp         @AbstractError
*}
end;

//005A90D8
procedure TIdStack.Connect(ASocket:Cardinal; AIP:string; AIPVersion:TIdIPVersion; APort:Word);
begin
{*
>005A90D8    jmp         @AbstractError
*}
end;

//005A90E0
procedure TIdStack.Disconnect(ASocket:Cardinal);
begin
{*
>005A90E0    jmp         @AbstractError
*}
end;

//005A90E8
procedure TIdStack.IOControl(s:Cardinal; cmd:Cardinal; var arg:Cardinal);
begin
{*
>005A90E8    jmp         @AbstractError
*}
end;

//005A90F0
procedure TIdStack.GetPeerName(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word);
begin
{*
>005A90F0    jmp         @AbstractError
*}
end;

//005A90F8
procedure TIdStack.GetSocketName(ASocket:Cardinal; var VIP:string; var VIPVersion:TIdIPVersion; var VPort:Word);
begin
{*
>005A90F8    jmp         @AbstractError
*}
end;

//005A9100
procedure TIdStack.HostByAddress(AAddress:string; AIPVersion:TIdIPVersion);
begin
{*
>005A9100    jmp         @AbstractError
*}
end;

//005A9108
procedure TIdStack.HostToNetwork(AValue:Word);
begin
{*
>005A9108    jmp         @AbstractError
*}
end;

//005A9110
procedure TIdStack.HostToNetwork(AValue:Cardinal);
begin
{*
>005A9110    jmp         @AbstractError
*}
end;

//005A9118
procedure TIdStack.HostToNetwork(AValue:Int64);
begin
{*
>005A9118    jmp         @AbstractError
*}
end;

//005A9120
procedure TIdStack.Listen(ASocket:Cardinal; ABackLog:Integer);
begin
{*
>005A9120    jmp         @AbstractError
*}
end;

//005A9128
procedure TIdStack.WSGetLastError;
begin
{*
>005A9128    jmp         @AbstractError
*}
end;

//005A9130
procedure TIdStack.WSSetLastError(AErr:Integer);
begin
{*
>005A9130    jmp         @AbstractError
*}
end;

//005A9138
procedure TIdStack.NewSocketHandle(ASocketType:Integer; AProtocol:Integer; AOverlapped:Boolean; AIPVersion:TIdIPVersion);
begin
{*
>005A9138    jmp         @AbstractError
*}
end;

//005A9140
procedure TIdStack.NetworkToHost(AValue:Word);
begin
{*
>005A9140    jmp         @AbstractError
*}
end;

//005A9148
procedure TIdStack.NetworkToHost(AValue:Cardinal);
begin
{*
>005A9148    jmp         @AbstractError
*}
end;

//005A9150
procedure TIdStack.NetworkToHost(AValue:Int64);
begin
{*
>005A9150    jmp         @AbstractError
*}
end;

//005A9158
procedure TIdStack.GetSocketOption(ASocket:Cardinal; ALevel:Integer; AOptVal:Integer; AOptName:Integer);
begin
{*
>005A9158    jmp         @AbstractError
*}
end;

//005A9160
procedure TIdStack.SetSocketOption(ASocket:Cardinal; ALevel:Integer; AOptVal:Integer; AOptName:Integer);
begin
{*
>005A9160    jmp         @AbstractError
*}
end;

//005A9168
procedure TIdStack.Receive;
begin
{*
>005A9168    jmp         @AbstractError
*}
end;

//005A9170
procedure TIdStack.Send;
begin
{*
>005A9170    jmp         @AbstractError
*}
end;

//005A9178
procedure TIdStack.ReceiveFrom;
begin
{*
>005A9178    jmp         @AbstractError
*}
end;

//005A9180
procedure TIdStack.SendTo;
begin
{*
>005A9180    jmp         @AbstractError
*}
end;

//005A9188
procedure TIdStack.ReceiveMsg;
begin
{*
>005A9188    jmp         @AbstractError
*}
end;

//005A9190
procedure TIdStack.SupportsIPv6;
begin
{*
>005A9190    jmp         @AbstractError
*}
end;

//005A9198
procedure TIdStack.SetMulticastTTL(AHandle:Cardinal; AValue:Byte; AIPVersion:TIdIPVersion);
begin
{*
>005A9198    jmp         @AbstractError
*}
end;

//005A91A0
procedure TIdStack.SetLoopBack(AHandle:Cardinal; AValue:Boolean; AIPVersion:TIdIPVersion);
begin
{*
>005A91A0    jmp         @AbstractError
*}
end;

//005A91A8
procedure TIdStack.DropMulticastMembership(AHandle:Cardinal; AGroupIP:string; AIPVersion:TIdIPVersion; ALocalIP:string);
begin
{*
>005A91A8    jmp         @AbstractError
*}
end;

//005A91B0
procedure TIdStack.AddMulticastMembership(AHandle:Cardinal; AGroupIP:string; AIPVersion:TIdIPVersion; ALocalIP:string);
begin
{*
>005A91B0    jmp         @AbstractError
*}
end;

//005A91B8
procedure TIdStack.WriteChecksum;
begin
{*
>005A91B8    jmp         @AbstractError
*}
end;

//005A91C0
procedure TIdStack.AddLocalAddressesToList(AAddresses:TStrings);
begin
{*
>005A91C0    jmp         @AbstractError
*}
end;

//005A91C8
procedure TIdPacketInfo.Reset;
begin
{*
 005A91C8    push        ebp
 005A91C9    mov         ebp,esp
 005A91CB    push        ecx
 005A91CC    mov         dword ptr [ebp-4],eax
 005A91CF    mov         eax,dword ptr [ebp-4]
 005A91D2    add         eax,4
 005A91D5    call        @UStrClr
 005A91DA    mov         eax,dword ptr [ebp-4]
 005A91DD    mov         word ptr [eax+8],0
 005A91E3    mov         eax,dword ptr [ebp-4]
 005A91E6    xor         edx,edx
 005A91E8    mov         dword ptr [eax+0C],edx
 005A91EB    mov         eax,dword ptr [ebp-4]
 005A91EE    mov         byte ptr [eax+10],0
 005A91F2    mov         eax,dword ptr [ebp-4]
 005A91F5    add         eax,14
 005A91F8    call        @UStrClr
 005A91FD    mov         eax,dword ptr [ebp-4]
 005A9200    mov         word ptr [eax+18],0
 005A9206    mov         eax,dword ptr [ebp-4]
 005A9209    xor         edx,edx
 005A920B    mov         dword ptr [eax+1C],edx
 005A920E    mov         eax,dword ptr [ebp-4]
 005A9211    mov         byte ptr [eax+20],0
 005A9215    mov         eax,dword ptr [ebp-4]
 005A9218    mov         byte ptr [eax+21],0
 005A921C    pop         ecx
 005A921D    pop         ebp
 005A921E    ret
*}
end;

//005A9220
constructor TIdSocketList.Create();
begin
{*
 005A9220    push        ebp
 005A9221    mov         ebp,esp
 005A9223    add         esp,0FFFFFFF8
 005A9226    test        dl,dl
>005A9228    je          005A9232
 005A922A    add         esp,0FFFFFFF0
 005A922D    call        @ClassCreate
 005A9232    mov         byte ptr [ebp-5],dl
 005A9235    mov         dword ptr [ebp-4],eax
 005A9238    xor         edx,edx
 005A923A    mov         eax,dword ptr [ebp-4]
 005A923D    call        TObject.Create
 005A9242    mov         dl,1
 005A9244    mov         eax,[005970A8];TIdCriticalSection
 005A9249    call        TCriticalSection.Create
 005A924E    mov         edx,dword ptr [ebp-4]
 005A9251    mov         dword ptr [edx+4],eax
 005A9254    mov         eax,dword ptr [ebp-4]
 005A9257    cmp         byte ptr [ebp-5],0
>005A925B    je          005A926C
 005A925D    call        @AfterConstruction
 005A9262    pop         dword ptr fs:[0]
 005A9269    add         esp,0C
 005A926C    mov         eax,dword ptr [ebp-4]
 005A926F    pop         ecx
 005A9270    pop         ecx
 005A9271    pop         ebp
 005A9272    ret
*}
end;

//005A9274
function TIdSocketList.CreateSocketList:TIdSocketList;
begin
{*
 005A9274    push        ebp
 005A9275    mov         ebp,esp
 005A9277    add         esp,0FFFFFFF8
 005A927A    mov         dword ptr [ebp-4],eax
 005A927D    mov         dl,1
 005A927F    mov         eax,[008155C0];GSocketListClass:TIdSocketListClass
 005A9284    call        dword ptr [eax+4]
 005A9287    mov         dword ptr [ebp-8],eax
 005A928A    mov         eax,dword ptr [ebp-8]
 005A928D    pop         ecx
 005A928E    pop         ecx
 005A928F    pop         ebp
 005A9290    ret
*}
end;

//005A9294
destructor TIdSocketList.Destroy();
begin
{*
 005A9294    push        ebp
 005A9295    mov         ebp,esp
 005A9297    add         esp,0FFFFFFF0
 005A929A    call        @BeforeDestruction
 005A929F    mov         byte ptr [ebp-5],dl
 005A92A2    mov         dword ptr [ebp-4],eax
 005A92A5    mov         eax,dword ptr [ebp-4]
 005A92A8    add         eax,4
 005A92AB    mov         dword ptr [ebp-0C],eax
 005A92AE    mov         eax,dword ptr [ebp-0C]
 005A92B1    mov         eax,dword ptr [eax]
 005A92B3    mov         dword ptr [ebp-10],eax
 005A92B6    mov         eax,dword ptr [ebp-0C]
 005A92B9    xor         edx,edx
 005A92BB    mov         dword ptr [eax],edx
 005A92BD    mov         eax,dword ptr [ebp-10]
 005A92C0    call        TObject.Free
 005A92C5    mov         dl,byte ptr [ebp-5]
 005A92C8    and         dl,0FC
 005A92CB    mov         eax,dword ptr [ebp-4]
 005A92CE    call        TObject.Destroy
 005A92D3    cmp         byte ptr [ebp-5],0
>005A92D7    jle         005A92E1
 005A92D9    mov         eax,dword ptr [ebp-4]
 005A92DC    call        @ClassDestroy
 005A92E1    mov         esp,ebp
 005A92E3    pop         ebp
 005A92E4    ret
*}
end;

//005A92E8
procedure TIdSocketList.Lock;
begin
{*
 005A92E8    push        ebp
 005A92E9    mov         ebp,esp
 005A92EB    push        ecx
 005A92EC    mov         dword ptr [ebp-4],eax
 005A92EF    mov         eax,dword ptr [ebp-4]
 005A92F2    mov         eax,dword ptr [eax+4]
 005A92F5    mov         edx,dword ptr [eax]
 005A92F7    call        dword ptr [edx]
 005A92F9    pop         ecx
 005A92FA    pop         ebp
 005A92FB    ret
*}
end;

//005A92FC
function TIdSocketList.Select(AReadList:TIdSocketList; AWriteList:TIdSocketList; ATimeout:Integer; AExceptList:TIdSocketList):Boolean;
begin
{*
 005A92FC    push        ebp
 005A92FD    mov         ebp,esp
 005A92FF    add         esp,0FFFFFFF0
 005A9302    mov         dword ptr [ebp-10],ecx
 005A9305    mov         dword ptr [ebp-0C],edx
 005A9308    mov         dword ptr [ebp-4],eax
 005A930B    mov         byte ptr [ebp-5],0
 005A930F    mov         al,byte ptr [ebp-5]
 005A9312    mov         esp,ebp
 005A9314    pop         ebp
 005A9315    ret         8
*}
end;

//005A9318
procedure TIdSocketList.Unlock;
begin
{*
 005A9318    push        ebp
 005A9319    mov         ebp,esp
 005A931B    push        ecx
 005A931C    mov         dword ptr [ebp-4],eax
 005A931F    mov         eax,dword ptr [ebp-4]
 005A9322    mov         eax,dword ptr [eax+4]
 005A9325    mov         edx,dword ptr [eax]
 005A9327    call        dword ptr [edx+4]
 005A932A    pop         ecx
 005A932B    pop         ebp
 005A932C    ret
*}
end;

//005A9330
constructor EIdSocketError.CreateError(AMsg:string);
begin
{*
 005A9330    push        ebp
 005A9331    mov         ebp,esp
 005A9333    add         esp,0FFFFFFF4
 005A9336    test        dl,dl
>005A9338    je          005A9342
 005A933A    add         esp,0FFFFFFF0
 005A933D    call        @ClassCreate
 005A9342    mov         dword ptr [ebp-0C],ecx
 005A9345    mov         byte ptr [ebp-5],dl
 005A9348    mov         dword ptr [ebp-4],eax
 005A934B    mov         ecx,dword ptr [ebp+8]
 005A934E    xor         edx,edx
 005A9350    mov         eax,dword ptr [ebp-4]
 005A9353    call        EIdException.Create
 005A9358    mov         eax,dword ptr [ebp-4]
 005A935B    mov         edx,dword ptr [ebp-0C]
 005A935E    mov         dword ptr [eax+18],edx
 005A9361    mov         eax,dword ptr [ebp-4]
 005A9364    cmp         byte ptr [ebp-5],0
>005A9368    je          005A9379
 005A936A    call        @AfterConstruction
 005A936F    pop         dword ptr fs:[0]
 005A9376    add         esp,0C
 005A9379    mov         eax,dword ptr [ebp-4]
 005A937C    mov         esp,ebp
 005A937E    pop         ebp
 005A937F    ret         4
*}
end;

//005A9384
constructor TIdStack.Create();
begin
{*
 005A9384    push        ebp
 005A9385    mov         ebp,esp
 005A9387    add         esp,0FFFFFFF8
 005A938A    test        dl,dl
>005A938C    je          005A9396
 005A938E    add         esp,0FFFFFFF0
 005A9391    call        @ClassCreate
 005A9396    mov         byte ptr [ebp-5],dl
 005A9399    mov         dword ptr [ebp-4],eax
 005A939C    xor         edx,edx
 005A939E    mov         eax,dword ptr [ebp-4]
 005A93A1    call        TObject.Create
 005A93A6    mov         eax,dword ptr [ebp-4]
 005A93A9    cmp         byte ptr [ebp-5],0
>005A93AD    je          005A93BE
 005A93AF    call        @AfterConstruction
 005A93B4    pop         dword ptr fs:[0]
 005A93BB    add         esp,0C
 005A93BE    mov         eax,dword ptr [ebp-4]
 005A93C1    pop         ecx
 005A93C2    pop         ecx
 005A93C3    pop         ebp
 005A93C4    ret
*}
end;

//005A93C8
destructor TIdStack.Destroy();
begin
{*
 005A93C8    push        ebp
 005A93C9    mov         ebp,esp
 005A93CB    add         esp,0FFFFFFF0
 005A93CE    call        @BeforeDestruction
 005A93D3    mov         byte ptr [ebp-5],dl
 005A93D6    mov         dword ptr [ebp-4],eax
 005A93D9    mov         eax,dword ptr [ebp-4]
 005A93DC    add         eax,4
 005A93DF    mov         dword ptr [ebp-0C],eax
 005A93E2    mov         eax,dword ptr [ebp-0C]
 005A93E5    mov         eax,dword ptr [eax]
 005A93E7    mov         dword ptr [ebp-10],eax
 005A93EA    mov         eax,dword ptr [ebp-0C]
 005A93ED    xor         edx,edx
 005A93EF    mov         dword ptr [eax],edx
 005A93F1    mov         eax,dword ptr [ebp-10]
 005A93F4    call        TObject.Free
 005A93F9    mov         dl,byte ptr [ebp-5]
 005A93FC    and         dl,0FC
 005A93FF    mov         eax,dword ptr [ebp-4]
 005A9402    call        TObject.Destroy
 005A9407    cmp         byte ptr [ebp-5],0
>005A940B    jle         005A9415
 005A940D    mov         eax,dword ptr [ebp-4]
 005A9410    call        @ClassDestroy
 005A9415    mov         esp,ebp
 005A9417    pop         ebp
 005A9418    ret
*}
end;

//005A941C
procedure TIdStack.IPVersionUnsupported;
begin
{*
 005A941C    push        ebp
 005A941D    mov         ebp,esp
 005A941F    add         esp,0FFFFFFF8
 005A9422    xor         edx,edx
 005A9424    mov         dword ptr [ebp-8],edx
 005A9427    mov         dword ptr [ebp-4],eax
 005A942A    xor         eax,eax
 005A942C    push        ebp
 005A942D    push        5A946F
 005A9432    push        dword ptr fs:[eax]
 005A9435    mov         dword ptr fs:[eax],esp
 005A9438    lea         edx,[ebp-8]
 005A943B    mov         eax,[0078CF74];^SResString661:TResStringRec
 005A9440    call        LoadResString
 005A9445    mov         ecx,dword ptr [ebp-8]
 005A9448    mov         dl,1
 005A944A    mov         eax,[005A79E4];EIdIPVersionUnsupported
 005A944F    call        EIdException.Create
 005A9454    call        @RaiseExcept
 005A9459    xor         eax,eax
 005A945B    pop         edx
 005A945C    pop         ecx
 005A945D    pop         ecx
 005A945E    mov         dword ptr fs:[eax],edx
 005A9461    push        5A9476
 005A9466    lea         eax,[ebp-8]
 005A9469    call        @UStrClr
 005A946E    ret
>005A946F    jmp         @HandleFinally
>005A9474    jmp         005A9466
 005A9476    pop         ecx
 005A9477    pop         ecx
 005A9478    pop         ebp
 005A9479    ret
*}
end;

//005A947C
function TIdStack.Accept(ASocket:Cardinal; var VIP:string; var VPort:Word):Cardinal;
begin
{*
 005A947C    push        ebp
 005A947D    mov         ebp,esp
 005A947F    add         esp,0FFFFFFEC
 005A9482    push        ebx
 005A9483    mov         dword ptr [ebp-0C],ecx
 005A9486    mov         dword ptr [ebp-8],edx
 005A9489    mov         dword ptr [ebp-4],eax
 005A948C    mov         eax,dword ptr [ebp+8]
 005A948F    push        eax
 005A9490    lea         eax,[ebp-11]
 005A9493    push        eax
 005A9494    mov         ecx,dword ptr [ebp-0C]
 005A9497    mov         edx,dword ptr [ebp-8]
 005A949A    mov         eax,dword ptr [ebp-4]
 005A949D    mov         ebx,dword ptr [eax]
 005A949F    call        dword ptr [ebx+8]
 005A94A2    mov         dword ptr [ebp-10],eax
 005A94A5    mov         eax,dword ptr [ebp-10]
 005A94A8    pop         ebx
 005A94A9    mov         esp,ebp
 005A94AB    pop         ebp
 005A94AC    ret         4
*}
end;

//005A94B0
procedure TIdStack.GetPeerName(ASocket:Cardinal; var VIP:string; var VPort:Word);
begin
{*
 005A94B0    push        ebp
 005A94B1    mov         ebp,esp
 005A94B3    add         esp,0FFFFFFF0
 005A94B6    push        ebx
 005A94B7    mov         dword ptr [ebp-0C],ecx
 005A94BA    mov         dword ptr [ebp-8],edx
 005A94BD    mov         dword ptr [ebp-4],eax
 005A94C0    mov         eax,dword ptr [ebp+8]
 005A94C3    push        eax
 005A94C4    lea         eax,[ebp-0D]
 005A94C7    push        eax
 005A94C8    mov         ecx,dword ptr [ebp-0C]
 005A94CB    mov         edx,dword ptr [ebp-8]
 005A94CE    mov         eax,dword ptr [ebp-4]
 005A94D1    mov         ebx,dword ptr [eax]
 005A94D3    call        dword ptr [ebx+20]
 005A94D6    pop         ebx
 005A94D7    mov         esp,ebp
 005A94D9    pop         ebp
 005A94DA    ret         4
*}
end;

//005A94E0
procedure TIdStack.GetSocketName(ASocket:Cardinal; var VIP:string; var VPort:Word);
begin
{*
 005A94E0    push        ebp
 005A94E1    mov         ebp,esp
 005A94E3    add         esp,0FFFFFFF0
 005A94E6    push        ebx
 005A94E7    mov         dword ptr [ebp-0C],ecx
 005A94EA    mov         dword ptr [ebp-8],edx
 005A94ED    mov         dword ptr [ebp-4],eax
 005A94F0    mov         eax,dword ptr [ebp+8]
 005A94F3    push        eax
 005A94F4    lea         eax,[ebp-0D]
 005A94F7    push        eax
 005A94F8    mov         ecx,dword ptr [ebp-0C]
 005A94FB    mov         edx,dword ptr [ebp-8]
 005A94FE    mov         eax,dword ptr [ebp-4]
 005A9501    mov         ebx,dword ptr [eax]
 005A9503    call        dword ptr [ebx+24]
 005A9506    pop         ebx
 005A9507    mov         esp,ebp
 005A9509    pop         ebp
 005A950A    ret         4
*}
end;

//005A9510
function TIdStack.GetLocalAddresses:TStrings;
begin
{*
 005A9510    push        ebp
 005A9511    mov         ebp,esp
 005A9513    add         esp,0FFFFFFF8
 005A9516    mov         dword ptr [ebp-4],eax
 005A9519    mov         eax,dword ptr [ebp-4]
 005A951C    cmp         dword ptr [eax+4],0
>005A9520    jne         005A9534
 005A9522    mov         dl,1
 005A9524    mov         eax,[0043C7BC];TStringList
 005A9529    call        TStringList.Create
 005A952E    mov         edx,dword ptr [ebp-4]
 005A9531    mov         dword ptr [edx+4],eax
 005A9534    mov         eax,dword ptr [ebp-4]
 005A9537    mov         eax,dword ptr [eax+4]
 005A953A    mov         edx,dword ptr [eax]
 005A953C    call        dword ptr [edx+44]
 005A953F    mov         eax,dword ptr [ebp-4]
 005A9542    mov         edx,dword ptr [eax+4]
 005A9545    mov         eax,dword ptr [ebp-4]
 005A9548    mov         ecx,dword ptr [eax]
 005A954A    call        dword ptr [ecx+9C]
 005A9550    mov         eax,dword ptr [ebp-4]
 005A9553    mov         eax,dword ptr [eax+4]
 005A9556    mov         dword ptr [ebp-8],eax
 005A9559    mov         eax,dword ptr [ebp-8]
 005A955C    pop         ecx
 005A955D    pop         ecx
 005A955E    pop         ebp
 005A955F    ret
*}
end;

//005A9560
function TIdStack.GetLocalAddress:UnicodeString;
begin
{*
 005A9560    push        ebp
 005A9561    mov         ebp,esp
 005A9563    add         esp,0FFFFFFF4
 005A9566    push        ebx
 005A9567    mov         dword ptr [ebp-8],edx
 005A956A    mov         dword ptr [ebp-4],eax
 005A956D    mov         eax,dword ptr [ebp-8]
 005A9570    call        @UStrClr
 005A9575    mov         dl,1
 005A9577    mov         eax,[0043C7BC];TStringList
 005A957C    call        TStringList.Create
 005A9581    mov         dword ptr [ebp-0C],eax
 005A9584    xor         eax,eax
 005A9586    push        ebp
 005A9587    push        5A95CF
 005A958C    push        dword ptr fs:[eax]
 005A958F    mov         dword ptr fs:[eax],esp
 005A9592    mov         edx,dword ptr [ebp-0C]
 005A9595    mov         eax,dword ptr [ebp-4]
 005A9598    mov         ecx,dword ptr [eax]
 005A959A    call        dword ptr [ecx+9C]
 005A95A0    mov         eax,dword ptr [ebp-0C]
 005A95A3    mov         edx,dword ptr [eax]
 005A95A5    call        dword ptr [edx+14]
 005A95A8    test        eax,eax
>005A95AA    jle         005A95B9
 005A95AC    mov         ecx,dword ptr [ebp-8]
 005A95AF    xor         edx,edx
 005A95B1    mov         eax,dword ptr [ebp-0C]
 005A95B4    mov         ebx,dword ptr [eax]
 005A95B6    call        dword ptr [ebx+0C]
 005A95B9    xor         eax,eax
 005A95BB    pop         edx
 005A95BC    pop         ecx
 005A95BD    pop         ecx
 005A95BE    mov         dword ptr fs:[eax],edx
 005A95C1    push        5A95D6
 005A95C6    mov         eax,dword ptr [ebp-0C]
 005A95C9    call        TObject.Free
 005A95CE    ret
>005A95CF    jmp         @HandleFinally
>005A95D4    jmp         005A95C6
 005A95D6    pop         ebx
 005A95D7    mov         esp,ebp
 005A95D9    pop         ebp
 005A95DA    ret
*}
end;

//005A95DC
function TIdStack.IsIP(AIP:string):Boolean;
begin
{*
 005A95DC    push        ebp
 005A95DD    mov         ebp,esp
 005A95DF    add         esp,0FFFFFFE0
 005A95E2    xor         ecx,ecx
 005A95E4    mov         dword ptr [ebp-20],ecx
 005A95E7    mov         dword ptr [ebp-1C],ecx
 005A95EA    mov         dword ptr [ebp-18],ecx
 005A95ED    mov         dword ptr [ebp-14],ecx
 005A95F0    mov         dword ptr [ebp-8],edx
 005A95F3    mov         dword ptr [ebp-4],eax
 005A95F6    mov         eax,dword ptr [ebp-8]
 005A95F9    call        @UStrAddRef
 005A95FE    xor         eax,eax
 005A9600    push        ebp
 005A9601    push        5A9733
 005A9606    push        dword ptr fs:[eax]
 005A9609    mov         dword ptr fs:[eax],esp
 005A960C    push        1
 005A960E    lea         eax,[ebp-14]
 005A9611    push        eax
 005A9612    lea         eax,[ebp-8]
 005A9615    mov         cl,1
 005A9617    mov         edx,5A9750;'.'
 005A961C    call        Fetch
 005A9621    mov         eax,dword ptr [ebp-14]
 005A9624    or          edx,0FFFFFFFF
 005A9627    call        IndyStrToInt
 005A962C    mov         dword ptr [ebp-10],eax
 005A962F    cmp         dword ptr [ebp-10],0FFFFFFFF
>005A9633    jle         005A963E
 005A9635    cmp         dword ptr [ebp-10],100
>005A963C    jl          005A9642
 005A963E    xor         eax,eax
>005A9640    jmp         005A9644
 005A9642    mov         al,1
 005A9644    mov         byte ptr [ebp-9],al
 005A9647    push        1
 005A9649    lea         eax,[ebp-18]
 005A964C    push        eax
 005A964D    lea         eax,[ebp-8]
 005A9650    mov         cl,1
 005A9652    mov         edx,5A9750;'.'
 005A9657    call        Fetch
 005A965C    mov         eax,dword ptr [ebp-18]
 005A965F    or          edx,0FFFFFFFF
 005A9662    call        IndyStrToInt
 005A9667    mov         dword ptr [ebp-10],eax
 005A966A    cmp         byte ptr [ebp-9],0
>005A966E    je          005A967F
 005A9670    cmp         dword ptr [ebp-10],0FFFFFFFF
>005A9674    jle         005A967F
 005A9676    cmp         dword ptr [ebp-10],100
>005A967D    jl          005A9683
 005A967F    xor         eax,eax
>005A9681    jmp         005A9685
 005A9683    mov         al,1
 005A9685    mov         byte ptr [ebp-9],al
 005A9688    push        1
 005A968A    lea         eax,[ebp-1C]
 005A968D    push        eax
 005A968E    lea         eax,[ebp-8]
 005A9691    mov         cl,1
 005A9693    mov         edx,5A9750;'.'
 005A9698    call        Fetch
 005A969D    mov         eax,dword ptr [ebp-1C]
 005A96A0    or          edx,0FFFFFFFF
 005A96A3    call        IndyStrToInt
 005A96A8    mov         dword ptr [ebp-10],eax
 005A96AB    cmp         byte ptr [ebp-9],0
>005A96AF    je          005A96C0
 005A96B1    cmp         dword ptr [ebp-10],0FFFFFFFF
>005A96B5    jle         005A96C0
 005A96B7    cmp         dword ptr [ebp-10],100
>005A96BE    jl          005A96C4
 005A96C0    xor         eax,eax
>005A96C2    jmp         005A96C6
 005A96C4    mov         al,1
 005A96C6    mov         byte ptr [ebp-9],al
 005A96C9    push        1
 005A96CB    lea         eax,[ebp-20]
 005A96CE    push        eax
 005A96CF    lea         eax,[ebp-8]
 005A96D2    mov         cl,1
 005A96D4    mov         edx,5A9750;'.'
 005A96D9    call        Fetch
 005A96DE    mov         eax,dword ptr [ebp-20]
 005A96E1    or          edx,0FFFFFFFF
 005A96E4    call        IndyStrToInt
 005A96E9    mov         dword ptr [ebp-10],eax
 005A96EC    cmp         byte ptr [ebp-9],0
>005A96F0    je          005A9707
 005A96F2    cmp         dword ptr [ebp-10],0FFFFFFFF
>005A96F6    jle         005A9707
 005A96F8    cmp         dword ptr [ebp-10],100
>005A96FF    jge         005A9707
 005A9701    cmp         dword ptr [ebp-8],0
>005A9705    je          005A970B
 005A9707    xor         eax,eax
>005A9709    jmp         005A970D
 005A970B    mov         al,1
 005A970D    mov         byte ptr [ebp-9],al
 005A9710    xor         eax,eax
 005A9712    pop         edx
 005A9713    pop         ecx
 005A9714    pop         ecx
 005A9715    mov         dword ptr fs:[eax],edx
 005A9718    push        5A973A
 005A971D    lea         eax,[ebp-20]
 005A9720    mov         edx,4
 005A9725    call        @UStrArrayClr
 005A972A    lea         eax,[ebp-8]
 005A972D    call        @UStrClr
 005A9732    ret
>005A9733    jmp         @HandleFinally
>005A9738    jmp         005A971D
 005A973A    mov         al,byte ptr [ebp-9]
 005A973D    mov         esp,ebp
 005A973F    pop         ebp
 005A9740    ret
*}
end;

//005A9754
function TIdStack.MakeCanonicalIPv6Address(const AAddr:UnicodeString):UnicodeString;
begin
{*
 005A9754    push        ebp
 005A9755    mov         ebp,esp
 005A9757    add         esp,0FFFFFFF4
 005A975A    mov         dword ptr [ebp-0C],ecx
 005A975D    mov         dword ptr [ebp-8],edx
 005A9760    mov         dword ptr [ebp-4],eax
 005A9763    mov         edx,dword ptr [ebp-0C]
 005A9766    mov         eax,dword ptr [ebp-8]
 005A9769    call        MakeCanonicalIPv6Address
 005A976E    mov         esp,ebp
 005A9770    pop         ebp
 005A9771    ret
*}
end;

//005A9774
function TIdStack.ResolveHost(AHost:string; AIPVersion:TIdIPVersion):string;
begin
{*
 005A9774    push        ebp
 005A9775    mov         ebp,esp
 005A9777    add         esp,0FFFFFFF4
 005A977A    push        ebx
 005A977B    mov         byte ptr [ebp-9],cl
 005A977E    mov         dword ptr [ebp-8],edx
 005A9781    mov         dword ptr [ebp-4],eax
 005A9784    mov         eax,dword ptr [ebp+8]
 005A9787    call        @UStrClr
 005A978C    mov         al,byte ptr [ebp-9]
 005A978F    sub         al,1
>005A9791    jb          005A9797
>005A9793    je          005A97E5
>005A9795    jmp         005A980D
 005A9797    mov         edx,5A9828;'LOCALHOST'
 005A979C    mov         eax,dword ptr [ebp-8]
 005A979F    call        TextIsSame
 005A97A4    test        al,al
>005A97A6    je          005A97B7
 005A97A8    mov         eax,dword ptr [ebp+8]
 005A97AB    mov         edx,5A9848;'127.0.0.1'
 005A97B0    call        @UStrAsg
>005A97B5    jmp         005A9815
 005A97B7    mov         edx,dword ptr [ebp-8]
 005A97BA    mov         eax,dword ptr [ebp-4]
 005A97BD    call        TIdStack.IsIP
 005A97C2    test        al,al
>005A97C4    je          005A97D3
 005A97C6    mov         eax,dword ptr [ebp+8]
 005A97C9    mov         edx,dword ptr [ebp-8]
 005A97CC    call        @UStrAsg
>005A97D1    jmp         005A9815
 005A97D3    mov         eax,dword ptr [ebp+8]
 005A97D6    push        eax
 005A97D7    xor         ecx,ecx
 005A97D9    mov         edx,dword ptr [ebp-8]
 005A97DC    mov         eax,dword ptr [ebp-4]
 005A97DF    mov         ebx,dword ptr [eax]
 005A97E1    call        dword ptr [ebx]
>005A97E3    jmp         005A9815
 005A97E5    mov         ecx,dword ptr [ebp+8]
 005A97E8    mov         edx,dword ptr [ebp-8]
 005A97EB    mov         eax,dword ptr [ebp-4]
 005A97EE    call        TIdStack.MakeCanonicalIPv6Address
 005A97F3    mov         eax,dword ptr [ebp+8]
 005A97F6    cmp         dword ptr [eax],0
>005A97F9    jne         005A9815
 005A97FB    mov         eax,dword ptr [ebp+8]
 005A97FE    push        eax
 005A97FF    mov         cl,1
 005A9801    mov         edx,dword ptr [ebp-8]
 005A9804    mov         eax,dword ptr [ebp-4]
 005A9807    mov         ebx,dword ptr [eax]
 005A9809    call        dword ptr [ebx]
>005A980B    jmp         005A9815
 005A980D    mov         eax,dword ptr [ebp-4]
 005A9810    call        TIdStack.IPVersionUnsupported
 005A9815    pop         ebx
 005A9816    mov         esp,ebp
 005A9818    pop         ebp
 005A9819    ret         4
*}
end;

//005A985C
procedure TIdStack.SendTo(ASocket:TIdStackSocketHandle; const ABuffer:TIdBytes; const AOffset:Integer; const AIP:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion);
begin
{*
 005A985C    push        ebp
 005A985D    mov         ebp,esp
 005A985F    add         esp,0FFFFFFF0
 005A9862    push        ebx
 005A9863    mov         dword ptr [ebp-0C],ecx
 005A9866    mov         dword ptr [ebp-8],edx
 005A9869    mov         dword ptr [ebp-4],eax
 005A986C    mov         eax,dword ptr [ebp+14]
 005A986F    push        eax
 005A9870    push        0FF
 005A9872    mov         eax,dword ptr [ebp+10]
 005A9875    push        eax
 005A9876    mov         ax,word ptr [ebp+0C]
 005A987A    push        eax
 005A987B    mov         al,byte ptr [ebp+8]
 005A987E    push        eax
 005A987F    mov         ecx,dword ptr [ebp-0C]
 005A9882    mov         edx,dword ptr [ebp-8]
 005A9885    mov         eax,dword ptr [ebp-4]
 005A9888    mov         ebx,dword ptr [eax]
 005A988A    call        dword ptr [ebx+78]
 005A988D    mov         dword ptr [ebp-10],eax
 005A9890    mov         eax,dword ptr [ebp-10]
 005A9893    pop         ebx
 005A9894    mov         esp,ebp
 005A9896    pop         ebp
 005A9897    ret         10
*}
end;

//005A989C
procedure TIdStack.DecUsage;
begin
{*
 005A989C    push        ebp
 005A989D    mov         ebp,esp
 005A989F    add         esp,0FFFFFFF8
 005A98A2    mov         dword ptr [ebp-4],eax
 005A98A5    cmp         dword ptr ds:[789EE0],0
>005A98AC    jne         005A98C2
 005A98AE    mov         ecx,253
 005A98B3    mov         edx,5A9938;'C:\Builds\TP\indysockets\lib\system\IdStack.pas'
 005A98B8    mov         eax,5A99A4;'Assertion failure'
 005A98BD    call        @Assert
 005A98C2    mov         eax,[00789EE0]
 005A98C7    mov         edx,dword ptr [eax]
 005A98C9    call        dword ptr [edx]
 005A98CB    xor         eax,eax
 005A98CD    push        ebp
 005A98CE    push        5A9920
 005A98D3    push        dword ptr fs:[eax]
 005A98D6    mov         dword ptr fs:[eax],esp
 005A98D9    cmp         dword ptr ds:[789EDC],0
>005A98E0    jbe         005A9908
 005A98E2    dec         dword ptr ds:[789EDC]
 005A98E8    cmp         dword ptr ds:[789EDC],0
>005A98EF    jne         005A9908
 005A98F1    mov         eax,[00789ED0];gvar_00789ED0
 005A98F6    mov         dword ptr [ebp-8],eax
 005A98F9    xor         eax,eax
 005A98FB    mov         [00789ED0],eax;gvar_00789ED0
 005A9900    mov         eax,dword ptr [ebp-8]
 005A9903    call        TObject.Free
 005A9908    xor         eax,eax
 005A990A    pop         edx
 005A990B    pop         ecx
 005A990C    pop         ecx
 005A990D    mov         dword ptr fs:[eax],edx
 005A9910    push        5A9927
 005A9915    mov         eax,[00789EE0]
 005A991A    mov         edx,dword ptr [eax]
 005A991C    call        dword ptr [edx+4]
 005A991F    ret
>005A9920    jmp         @HandleFinally
>005A9925    jmp         005A9915
 005A9927    pop         ecx
 005A9928    pop         ecx
 005A9929    pop         ebp
 005A992A    ret
*}
end;

//005A99C8
procedure TIdStack.IncUsage;
begin
{*
 005A99C8    push        ebp
 005A99C9    mov         ebp,esp
 005A99CB    push        0
 005A99CD    push        0
 005A99CF    push        0
 005A99D1    mov         dword ptr [ebp-4],eax
 005A99D4    xor         eax,eax
 005A99D6    push        ebp
 005A99D7    push        5A9AB4
 005A99DC    push        dword ptr fs:[eax]
 005A99DF    mov         dword ptr fs:[eax],esp
 005A99E2    cmp         dword ptr ds:[789EE0],0
>005A99E9    jne         005A99FF
 005A99EB    mov         ecx,265
 005A99F0    mov         edx,5A9ACC;'C:\Builds\TP\indysockets\lib\system\IdStack.pas'
 005A99F5    mov         eax,5A9B38;'Assertion failure'
 005A99FA    call        @Assert
 005A99FF    mov         eax,[00789EE0]
 005A9A04    mov         edx,dword ptr [eax]
 005A9A06    call        dword ptr [edx]
 005A9A08    xor         eax,eax
 005A9A0A    push        ebp
 005A9A0B    push        5A9A92
 005A9A10    push        dword ptr fs:[eax]
 005A9A13    mov         dword ptr fs:[eax],esp
 005A9A16    cmp         dword ptr ds:[789EDC],0
>005A9A1D    jne         005A9A74
 005A9A1F    cmp         dword ptr ds:[789ED0],0;gvar_00789ED0
>005A9A26    je          005A9A42
 005A9A28    lea         edx,[ebp-8]
 005A9A2B    mov         eax,[0078D424];^SResString651:TResStringRec
 005A9A30    call        LoadResString
 005A9A35    mov         edx,dword ptr [ebp-8]
 005A9A38    mov         eax,[005961F8];EIdException
 005A9A3D    call        EIdException.Toss
 005A9A42    cmp         dword ptr ds:[789ED8],0
>005A9A49    jne         005A9A65
 005A9A4B    lea         edx,[ebp-0C]
 005A9A4E    mov         eax,[0078CFF8];^SResString650:TResStringRec
 005A9A53    call        LoadResString
 005A9A58    mov         edx,dword ptr [ebp-0C]
 005A9A5B    mov         eax,[005961F8];EIdException
 005A9A60    call        EIdException.Toss
 005A9A65    mov         dl,1
 005A9A67    mov         eax,[00789ED8]
 005A9A6C    call        dword ptr [eax+14]
 005A9A6F    mov         [00789ED0],eax;gvar_00789ED0
 005A9A74    inc         dword ptr ds:[789EDC]
 005A9A7A    xor         eax,eax
 005A9A7C    pop         edx
 005A9A7D    pop         ecx
 005A9A7E    pop         ecx
 005A9A7F    mov         dword ptr fs:[eax],edx
 005A9A82    push        5A9A99
 005A9A87    mov         eax,[00789EE0]
 005A9A8C    mov         edx,dword ptr [eax]
 005A9A8E    call        dword ptr [edx+4]
 005A9A91    ret
>005A9A92    jmp         @HandleFinally
>005A9A97    jmp         005A9A87
 005A9A99    xor         eax,eax
 005A9A9B    pop         edx
 005A9A9C    pop         ecx
 005A9A9D    pop         ecx
 005A9A9E    mov         dword ptr fs:[eax],edx
 005A9AA1    push        5A9ABB
 005A9AA6    lea         eax,[ebp-0C]
 005A9AA9    mov         edx,2
 005A9AAE    call        @UStrArrayClr
 005A9AB3    ret
>005A9AB4    jmp         @HandleFinally
>005A9AB9    jmp         005A9AA6
 005A9ABB    mov         esp,ebp
 005A9ABD    pop         ebp
 005A9ABE    ret
*}
end;

//005A9B5C
function TIdStack.CheckForSocketError(AResult:Integer):Integer;
begin
{*
 005A9B5C    push        ebp
 005A9B5D    mov         ebp,esp
 005A9B5F    add         esp,0FFFFFFF4
 005A9B62    mov         dword ptr [ebp-8],edx
 005A9B65    mov         dword ptr [ebp-4],eax
 005A9B68    cmp         dword ptr [ebp-8],0FFFFFFFF
>005A9B6C    jne         005A9B76
 005A9B6E    mov         eax,dword ptr [ebp-4]
 005A9B71    call        TIdStack.RaiseLastSocketError
 005A9B76    mov         eax,dword ptr [ebp-8]
 005A9B79    mov         dword ptr [ebp-0C],eax
 005A9B7C    mov         eax,dword ptr [ebp-0C]
 005A9B7F    mov         esp,ebp
 005A9B81    pop         ebp
 005A9B82    ret
*}
end;

//005A9B84
procedure TIdStack.CheckForSocketError(const AResult:Integer; const AIgnore:array[$0..-$1] of System.Integer; const _Dv_:$0..-$1);
begin
{*
 005A9B84    push        ebp
 005A9B85    mov         ebp,esp
 005A9B87    add         esp,0FFFFFFE4
 005A9B8A    mov         dword ptr [ebp-0C],ecx
 005A9B8D    mov         dword ptr [ebp-8],edx
 005A9B90    mov         dword ptr [ebp-4],eax
 005A9B93    mov         eax,dword ptr [ebp-8]
 005A9B96    mov         dword ptr [ebp-10],eax
 005A9B99    cmp         dword ptr [ebp-8],0FFFFFFFF
>005A9B9D    jne         005A9BE5
 005A9B9F    mov         eax,dword ptr [ebp-4]
 005A9BA2    mov         edx,dword ptr [eax]
 005A9BA4    call        dword ptr [edx+40]
 005A9BA7    mov         dword ptr [ebp-18],eax
 005A9BAA    mov         eax,dword ptr [ebp+8]
 005A9BAD    test        eax,eax
>005A9BAF    jl          005A9BDA
 005A9BB1    inc         eax
 005A9BB2    mov         dword ptr [ebp-1C],eax
 005A9BB5    mov         dword ptr [ebp-14],0
 005A9BBC    mov         eax,dword ptr [ebp-0C]
 005A9BBF    mov         edx,dword ptr [ebp-14]
 005A9BC2    mov         eax,dword ptr [eax+edx*4]
 005A9BC5    cmp         eax,dword ptr [ebp-18]
>005A9BC8    jne         005A9BD2
 005A9BCA    mov         eax,dword ptr [ebp-18]
 005A9BCD    mov         dword ptr [ebp-10],eax
>005A9BD0    jmp         005A9BE5
 005A9BD2    inc         dword ptr [ebp-14]
 005A9BD5    dec         dword ptr [ebp-1C]
>005A9BD8    jne         005A9BBC
 005A9BDA    mov         edx,dword ptr [ebp-18]
 005A9BDD    mov         eax,dword ptr [ebp-4]
 005A9BE0    mov         ecx,dword ptr [eax]
 005A9BE2    call        dword ptr [ecx+4C]
 005A9BE5    mov         eax,dword ptr [ebp-10]
 005A9BE8    mov         esp,ebp
 005A9BEA    pop         ebp
 005A9BEB    ret         4
*}
end;

//005A9BF0
procedure TIdStack.RaiseLastSocketError;
begin
{*
 005A9BF0    push        ebp
 005A9BF1    mov         ebp,esp
 005A9BF3    push        ecx
 005A9BF4    mov         dword ptr [ebp-4],eax
 005A9BF7    mov         eax,dword ptr [ebp-4]
 005A9BFA    mov         edx,dword ptr [eax]
 005A9BFC    call        dword ptr [edx+40]
 005A9BFF    mov         edx,eax
 005A9C01    mov         eax,dword ptr [ebp-4]
 005A9C04    mov         ecx,dword ptr [eax]
 005A9C06    call        dword ptr [ecx+4C]
 005A9C09    pop         ecx
 005A9C0A    pop         ebp
 005A9C0B    ret
*}
end;

//005A9C0C
procedure TIdStack.RaiseSocketError(AErr:Integer);
begin
{*
 005A9C0C    push        ebp
 005A9C0D    mov         ebp,esp
 005A9C0F    add         esp,0FFFFFFF0
 005A9C12    push        ebx
 005A9C13    xor         ecx,ecx
 005A9C15    mov         dword ptr [ebp-10],ecx
 005A9C18    mov         dword ptr [ebp-0C],ecx
 005A9C1B    mov         dword ptr [ebp-8],edx
 005A9C1E    mov         dword ptr [ebp-4],eax
 005A9C21    xor         eax,eax
 005A9C23    push        ebp
 005A9C24    push        5A9C9F
 005A9C29    push        dword ptr fs:[eax]
 005A9C2C    mov         dword ptr fs:[eax],esp
 005A9C2F    cmp         dword ptr [ebp-8],2736
>005A9C36    jne         005A9C5E
 005A9C38    lea         ecx,[ebp-0C]
 005A9C3B    mov         edx,dword ptr [ebp-8]
 005A9C3E    mov         eax,dword ptr [ebp-4]
 005A9C41    mov         ebx,dword ptr [eax]
 005A9C43    call        dword ptr [ebx+48]
 005A9C46    mov         eax,dword ptr [ebp-0C]
 005A9C49    push        eax
 005A9C4A    mov         ecx,dword ptr [ebp-8]
 005A9C4D    mov         dl,1
 005A9C4F    mov         eax,[005A7A98];EIdNotASocket
 005A9C54    call        EIdSocketError.CreateError
 005A9C59    call        @RaiseExcept
 005A9C5E    lea         ecx,[ebp-10]
 005A9C61    mov         edx,dword ptr [ebp-8]
 005A9C64    mov         eax,dword ptr [ebp-4]
 005A9C67    mov         ebx,dword ptr [eax]
 005A9C69    call        dword ptr [ebx+48]
 005A9C6C    mov         eax,dword ptr [ebp-10]
 005A9C6F    push        eax
 005A9C70    mov         ecx,dword ptr [ebp-8]
 005A9C73    mov         dl,1
 005A9C75    mov         eax,[005A7804];EIdSocketError
 005A9C7A    call        EIdSocketError.CreateError
 005A9C7F    call        @RaiseExcept
 005A9C84    xor         eax,eax
 005A9C86    pop         edx
 005A9C87    pop         ecx
 005A9C88    pop         ecx
 005A9C89    mov         dword ptr fs:[eax],edx
 005A9C8C    push        5A9CA6
 005A9C91    lea         eax,[ebp-10]
 005A9C94    mov         edx,2
 005A9C99    call        @UStrArrayClr
 005A9C9E    ret
>005A9C9F    jmp         @HandleFinally
>005A9CA4    jmp         005A9C91
 005A9CA6    pop         ebx
 005A9CA7    mov         esp,ebp
 005A9CA9    pop         ebp
 005A9CAA    ret
*}
end;

//005A9CAC
function TIdStack.WSTranslateSocketErrorMsg(AErr:Integer):string;
begin
{*
 005A9CAC    push        ebp
 005A9CAD    mov         ebp,esp
 005A9CAF    add         esp,0FFFFFFDC
 005A9CB2    push        ebx
 005A9CB3    xor         ebx,ebx
 005A9CB5    mov         dword ptr [ebp-10],ebx
 005A9CB8    mov         dword ptr [ebp-14],ebx
 005A9CBB    mov         dword ptr [ebp-0C],ecx
 005A9CBE    mov         dword ptr [ebp-8],edx
 005A9CC1    mov         dword ptr [ebp-4],eax
 005A9CC4    xor         eax,eax
 005A9CC6    push        ebp
 005A9CC7    push        5AA0DC
 005A9CCC    push        dword ptr fs:[eax]
 005A9CCF    mov         dword ptr fs:[eax],esp
 005A9CD2    mov         eax,dword ptr [ebp-0C]
 005A9CD5    call        @UStrClr
 005A9CDA    mov         eax,dword ptr [ebp-8]
 005A9CDD    add         eax,0FFFFD8EC
 005A9CE2    cmp         eax,3E
>005A9CE5    ja          005AA07D
 005A9CEB    jmp         dword ptr [eax*4+5A9CF2]
 005A9CEB    dd          005A9DEE
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005A9E00
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005A9E12
 005A9CEB    dd          005A9E24
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005A9E36
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005A9E48
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005AA07D
 005A9CEB    dd          005A9E5A
 005A9CEB    dd          005A9E6C
 005A9CEB    dd          005A9E7E
 005A9CEB    dd          005A9E90
 005A9CEB    dd          005A9EA2
 005A9CEB    dd          005A9EB4
 005A9CEB    dd          005A9EC6
 005A9CEB    dd          005A9ED8
 005A9CEB    dd          005A9EEA
 005A9CEB    dd          005A9EFC
 005A9CEB    dd          005A9F0E
 005A9CEB    dd          005A9F20
 005A9CEB    dd          005A9F32
 005A9CEB    dd          005A9F44
 005A9CEB    dd          005A9F56
 005A9CEB    dd          005A9F68
 005A9CEB    dd          005A9F7A
 005A9CEB    dd          005A9F8C
 005A9CEB    dd          005A9F9E
 005A9CEB    dd          005A9FB0
 005A9CEB    dd          005A9FC2
 005A9CEB    dd          005A9FD4
 005A9CEB    dd          005A9FE6
 005A9CEB    dd          005A9FF8
 005A9CEB    dd          005AA007
 005A9CEB    dd          005AA016
 005A9CEB    dd          005AA025
 005A9CEB    dd          005AA034
 005A9CEB    dd          005AA043
 005A9CEB    dd          005AA052
 005A9CEB    dd          005AA061
 005A9CEB    dd          005AA070
 005A9DEE    mov         edx,dword ptr [ebp-0C]
 005A9DF1    mov         eax,[0078CC60];^SResString611:TResStringRec
 005A9DF6    call        LoadResString
>005A9DFB    jmp         005AA07D
 005A9E00    mov         edx,dword ptr [ebp-0C]
 005A9E03    mov         eax,[0078CFFC];^SResString612:TResStringRec
 005A9E08    call        LoadResString
>005A9E0D    jmp         005AA07D
 005A9E12    mov         edx,dword ptr [ebp-0C]
 005A9E15    mov         eax,[0078D2AC];^SResString613:TResStringRec
 005A9E1A    call        LoadResString
>005A9E1F    jmp         005AA07D
 005A9E24    mov         edx,dword ptr [ebp-0C]
 005A9E27    mov         eax,[0078D08C];^SResString614:TResStringRec
 005A9E2C    call        LoadResString
>005A9E31    jmp         005AA07D
 005A9E36    mov         edx,dword ptr [ebp-0C]
 005A9E39    mov         eax,[0078D5F8];^SResString615:TResStringRec
 005A9E3E    call        LoadResString
>005A9E43    jmp         005AA07D
 005A9E48    mov         edx,dword ptr [ebp-0C]
 005A9E4B    mov         eax,[0078DA54];^SResString616:TResStringRec
 005A9E50    call        LoadResString
>005A9E55    jmp         005AA07D
 005A9E5A    mov         edx,dword ptr [ebp-0C]
 005A9E5D    mov         eax,[0078DA50];^SResString617:TResStringRec
 005A9E62    call        LoadResString
>005A9E67    jmp         005AA07D
 005A9E6C    mov         edx,dword ptr [ebp-0C]
 005A9E6F    mov         eax,[0078CF4C];^SResString618:TResStringRec
 005A9E74    call        LoadResString
>005A9E79    jmp         005AA07D
 005A9E7E    mov         edx,dword ptr [ebp-0C]
 005A9E81    mov         eax,[0078D450];^SResString619:TResStringRec
 005A9E86    call        LoadResString
>005A9E8B    jmp         005AA07D
 005A9E90    mov         edx,dword ptr [ebp-0C]
 005A9E93    mov         eax,[0078D7B8];^SResString620:TResStringRec
 005A9E98    call        LoadResString
>005A9E9D    jmp         005AA07D
 005A9EA2    mov         edx,dword ptr [ebp-0C]
 005A9EA5    mov         eax,[0078D4C0];^SResString621:TResStringRec
 005A9EAA    call        LoadResString
>005A9EAF    jmp         005AA07D
 005A9EB4    mov         edx,dword ptr [ebp-0C]
 005A9EB7    mov         eax,[0078CBD4];^SResString622:TResStringRec
 005A9EBC    call        LoadResString
>005A9EC1    jmp         005AA07D
 005A9EC6    mov         edx,dword ptr [ebp-0C]
 005A9EC9    mov         eax,[0078CE70];^SResString623:TResStringRec
 005A9ECE    call        LoadResString
>005A9ED3    jmp         005AA07D
 005A9ED8    mov         edx,dword ptr [ebp-0C]
 005A9EDB    mov         eax,[0078CC08];^SResString624:TResStringRec
 005A9EE0    call        LoadResString
>005A9EE5    jmp         005AA07D
 005A9EEA    mov         edx,dword ptr [ebp-0C]
 005A9EED    mov         eax,[0078D190];^SResString625:TResStringRec
 005A9EF2    call        LoadResString
>005A9EF7    jmp         005AA07D
 005A9EFC    mov         edx,dword ptr [ebp-0C]
 005A9EFF    mov         eax,[0078D388];^SResString626:TResStringRec
 005A9F04    call        LoadResString
>005A9F09    jmp         005AA07D
 005A9F0E    mov         edx,dword ptr [ebp-0C]
 005A9F11    mov         eax,[0078D548];^SResString627:TResStringRec
 005A9F16    call        LoadResString
>005A9F1B    jmp         005AA07D
 005A9F20    mov         edx,dword ptr [ebp-0C]
 005A9F23    mov         eax,[0078D5D4];^SResString628:TResStringRec
 005A9F28    call        LoadResString
>005A9F2D    jmp         005AA07D
 005A9F32    mov         edx,dword ptr [ebp-0C]
 005A9F35    mov         eax,[0078D3C0];^SResString629:TResStringRec
 005A9F3A    call        LoadResString
>005A9F3F    jmp         005AA07D
 005A9F44    mov         edx,dword ptr [ebp-0C]
 005A9F47    mov         eax,[0078D974];^SResString630:TResStringRec
 005A9F4C    call        LoadResString
>005A9F51    jmp         005AA07D
 005A9F56    mov         edx,dword ptr [ebp-0C]
 005A9F59    mov         eax,[0078CC54];^SResString631:TResStringRec
 005A9F5E    call        LoadResString
>005A9F63    jmp         005AA07D
 005A9F68    mov         edx,dword ptr [ebp-0C]
 005A9F6B    mov         eax,[0078CF6C];^SResString632:TResStringRec
 005A9F70    call        LoadResString
>005A9F75    jmp         005AA07D
 005A9F7A    mov         edx,dword ptr [ebp-0C]
 005A9F7D    mov         eax,[0078CDF0];^SResString633:TResStringRec
 005A9F82    call        LoadResString
>005A9F87    jmp         005AA07D
 005A9F8C    mov         edx,dword ptr [ebp-0C]
 005A9F8F    mov         eax,[0078D044];^SResString634:TResStringRec
 005A9F94    call        LoadResString
>005A9F99    jmp         005AA07D
 005A9F9E    mov         edx,dword ptr [ebp-0C]
 005A9FA1    mov         eax,[0078D984];^SResString635:TResStringRec
 005A9FA6    call        LoadResString
>005A9FAB    jmp         005AA07D
 005A9FB0    mov         edx,dword ptr [ebp-0C]
 005A9FB3    mov         eax,[0078D504];^SResString636:TResStringRec
 005A9FB8    call        LoadResString
>005A9FBD    jmp         005AA07D
 005A9FC2    mov         edx,dword ptr [ebp-0C]
 005A9FC5    mov         eax,[0078D6B4];^SResString637:TResStringRec
 005A9FCA    call        LoadResString
>005A9FCF    jmp         005AA07D
 005A9FD4    mov         edx,dword ptr [ebp-0C]
 005A9FD7    mov         eax,[0078D9B4];^SResString638:TResStringRec
 005A9FDC    call        LoadResString
>005A9FE1    jmp         005AA07D
 005A9FE6    mov         edx,dword ptr [ebp-0C]
 005A9FE9    mov         eax,[0078D18C];^SResString639:TResStringRec
 005A9FEE    call        LoadResString
>005A9FF3    jmp         005AA07D
 005A9FF8    mov         edx,dword ptr [ebp-0C]
 005A9FFB    mov         eax,[0078D030];^SResString640:TResStringRec
 005AA000    call        LoadResString
>005AA005    jmp         005AA07D
 005AA007    mov         edx,dword ptr [ebp-0C]
 005AA00A    mov         eax,[0078D778];^SResString641:TResStringRec
 005AA00F    call        LoadResString
>005AA014    jmp         005AA07D
 005AA016    mov         edx,dword ptr [ebp-0C]
 005AA019    mov         eax,[0078D5B4];^SResString642:TResStringRec
 005AA01E    call        LoadResString
>005AA023    jmp         005AA07D
 005AA025    mov         edx,dword ptr [ebp-0C]
 005AA028    mov         eax,[0078CF0C];^SResString643:TResStringRec
 005AA02D    call        LoadResString
>005AA032    jmp         005AA07D
 005AA034    mov         edx,dword ptr [ebp-0C]
 005AA037    mov         eax,[0078D300];^SResString644:TResStringRec
 005AA03C    call        LoadResString
>005AA041    jmp         005AA07D
 005AA043    mov         edx,dword ptr [ebp-0C]
 005AA046    mov         eax,[0078D02C];^SResString645:TResStringRec
 005AA04B    call        LoadResString
>005AA050    jmp         005AA07D
 005AA052    mov         edx,dword ptr [ebp-0C]
 005AA055    mov         eax,[0078D7B4];^SResString646:TResStringRec
 005AA05A    call        LoadResString
>005AA05F    jmp         005AA07D
 005AA061    mov         edx,dword ptr [ebp-0C]
 005AA064    mov         eax,[0078D678];^SResString647:TResStringRec
 005AA069    call        LoadResString
>005AA06E    jmp         005AA07D
 005AA070    mov         edx,dword ptr [ebp-0C]
 005AA073    mov         eax,[0078D568];^SResString648:TResStringRec
 005AA078    call        LoadResString
 005AA07D    lea         eax,[ebp-10]
 005AA080    push        eax
 005AA081    lea         edx,[ebp-14]
 005AA084    mov         eax,[0078CBC0];^SResString610:TResStringRec
 005AA089    call        LoadResString
 005AA08E    mov         eax,dword ptr [ebp-14]
 005AA091    push        eax
 005AA092    mov         eax,dword ptr [ebp-8]
 005AA095    mov         dword ptr [ebp-24],eax
 005AA098    mov         byte ptr [ebp-20],0
 005AA09C    mov         eax,dword ptr [ebp-0C]
 005AA09F    mov         eax,dword ptr [eax]
 005AA0A1    mov         dword ptr [ebp-1C],eax
 005AA0A4    mov         byte ptr [ebp-18],11
 005AA0A8    lea         edx,[ebp-24]
 005AA0AB    mov         ecx,1
 005AA0B0    pop         eax
 005AA0B1    call        IndyFormat
 005AA0B6    mov         edx,dword ptr [ebp-10]
 005AA0B9    mov         eax,dword ptr [ebp-0C]
 005AA0BC    call        @UStrAsg
 005AA0C1    xor         eax,eax
 005AA0C3    pop         edx
 005AA0C4    pop         ecx
 005AA0C5    pop         ecx
 005AA0C6    mov         dword ptr fs:[eax],edx
 005AA0C9    push        5AA0E3
 005AA0CE    lea         eax,[ebp-14]
 005AA0D1    mov         edx,2
 005AA0D6    call        @UStrArrayClr
 005AA0DB    ret
>005AA0DC    jmp         @HandleFinally
>005AA0E1    jmp         005AA0CE
 005AA0E3    pop         ebx
 005AA0E4    mov         esp,ebp
 005AA0E6    pop         ebp
 005AA0E7    ret
*}
end;

//005AA0E8
function TIdStack.HostToNetwork(AValue:TIdIPv6Address):TIdIPv6Address;
begin
{*
 005AA0E8    push        ebp
 005AA0E9    mov         ebp,esp
 005AA0EB    add         esp,0FFFFFFF0
 005AA0EE    mov         dword ptr [ebp-0C],ecx
 005AA0F1    mov         dword ptr [ebp-8],edx
 005AA0F4    mov         dword ptr [ebp-4],eax
 005AA0F7    xor         eax,eax
 005AA0F9    mov         dword ptr [ebp-10],eax
 005AA0FC    mov         eax,dword ptr [ebp-8]
 005AA0FF    mov         edx,dword ptr [ebp-10]
 005AA102    mov         dx,word ptr [eax+edx*2]
 005AA106    mov         eax,dword ptr [ebp-4]
 005AA109    mov         ecx,dword ptr [eax]
 005AA10B    call        dword ptr [ecx+2C]
 005AA10E    mov         edx,dword ptr [ebp-0C]
 005AA111    mov         ecx,dword ptr [ebp-10]
 005AA114    mov         word ptr [edx+ecx*2],ax
 005AA118    inc         dword ptr [ebp-10]
 005AA11B    cmp         dword ptr [ebp-10],8
>005AA11F    jne         005AA0FC
 005AA121    mov         esp,ebp
 005AA123    pop         ebp
 005AA124    ret
*}
end;

//005AA128
function TIdStack.NetworkToHost(AValue:TIdIPv6Address):TIdIPv6Address;
begin
{*
 005AA128    push        ebp
 005AA129    mov         ebp,esp
 005AA12B    add         esp,0FFFFFFF0
 005AA12E    mov         dword ptr [ebp-0C],ecx
 005AA131    mov         dword ptr [ebp-8],edx
 005AA134    mov         dword ptr [ebp-4],eax
 005AA137    xor         eax,eax
 005AA139    mov         dword ptr [ebp-10],eax
 005AA13C    mov         eax,dword ptr [ebp-8]
 005AA13F    mov         edx,dword ptr [ebp-10]
 005AA142    mov         dx,word ptr [eax+edx*2]
 005AA146    mov         eax,dword ptr [ebp-4]
 005AA149    mov         ecx,dword ptr [eax]
 005AA14B    call        dword ptr [ecx+54]
 005AA14E    mov         edx,dword ptr [ebp-0C]
 005AA151    mov         ecx,dword ptr [ebp-10]
 005AA154    mov         word ptr [edx+ecx*2],ax
 005AA158    inc         dword ptr [ebp-10]
 005AA15B    cmp         dword ptr [ebp-10],8
>005AA15F    jne         005AA13C
 005AA161    mov         esp,ebp
 005AA163    pop         ebp
 005AA164    ret
*}
end;

//005AA168
function TIdStack.IsValidIPv4MulticastGroup(Value:string):Boolean;
begin
{*
 005AA168    push        ebp
 005AA169    mov         ebp,esp
 005AA16B    add         esp,0FFFFFFE8
 005AA16E    xor         ecx,ecx
 005AA170    mov         dword ptr [ebp-18],ecx
 005AA173    mov         dword ptr [ebp-10],ecx
 005AA176    mov         dword ptr [ebp-8],edx
 005AA179    mov         dword ptr [ebp-4],eax
 005AA17C    xor         eax,eax
 005AA17E    push        ebp
 005AA17F    push        5AA203
 005AA184    push        dword ptr fs:[eax]
 005AA187    mov         dword ptr fs:[eax],esp
 005AA18A    mov         byte ptr [ebp-9],0
 005AA18E    mov         edx,dword ptr [ebp-8]
 005AA191    mov         eax,[00789ED0];gvar_00789ED0
 005AA196    call        TIdStack.IsIP
 005AA19B    test        al,al
>005AA19D    je          005AA1E5
 005AA19F    lea         eax,[ebp-10]
 005AA1A2    mov         edx,dword ptr [ebp-8]
 005AA1A5    call        @UStrLAsg
 005AA1AA    push        1
 005AA1AC    lea         eax,[ebp-18]
 005AA1AF    push        eax
 005AA1B0    lea         eax,[ebp-10]
 005AA1B3    mov         cl,1
 005AA1B5    mov         edx,5AA220;'.'
 005AA1BA    call        Fetch
 005AA1BF    mov         eax,dword ptr [ebp-18]
 005AA1C2    call        IndyStrToInt
 005AA1C7    mov         dword ptr [ebp-14],eax
 005AA1CA    cmp         dword ptr [ebp-14],0E0
>005AA1D1    jl          005AA1DC
 005AA1D3    cmp         dword ptr [ebp-14],0EF
>005AA1DA    jle         005AA1E0
 005AA1DC    xor         eax,eax
>005AA1DE    jmp         005AA1E2
 005AA1E0    mov         al,1
 005AA1E2    mov         byte ptr [ebp-9],al
 005AA1E5    xor         eax,eax
 005AA1E7    pop         edx
 005AA1E8    pop         ecx
 005AA1E9    pop         ecx
 005AA1EA    mov         dword ptr fs:[eax],edx
 005AA1ED    push        5AA20A
 005AA1F2    lea         eax,[ebp-18]
 005AA1F5    call        @UStrClr
 005AA1FA    lea         eax,[ebp-10]
 005AA1FD    call        @UStrClr
 005AA202    ret
>005AA203    jmp         @HandleFinally
>005AA208    jmp         005AA1F2
 005AA20A    mov         al,byte ptr [ebp-9]
 005AA20D    mov         esp,ebp
 005AA20F    pop         ebp
 005AA210    ret
*}
end;

//005AA224
function TIdStack.IsValidIPv6MulticastGroup(Value:string):Boolean;
begin
{*
 005AA224    push        ebp
 005AA225    mov         ebp,esp
 005AA227    add         esp,0FFFFFFF0
 005AA22A    xor         ecx,ecx
 005AA22C    mov         dword ptr [ebp-10],ecx
 005AA22F    mov         dword ptr [ebp-8],edx
 005AA232    mov         dword ptr [ebp-4],eax
 005AA235    xor         eax,eax
 005AA237    push        ebp
 005AA238    push        5AA283
 005AA23D    push        dword ptr fs:[eax]
 005AA240    mov         dword ptr fs:[eax],esp
 005AA243    lea         ecx,[ebp-10]
 005AA246    mov         edx,dword ptr [ebp-8]
 005AA249    mov         eax,dword ptr [ebp-4]
 005AA24C    call        TIdStack.MakeCanonicalIPv6Address
 005AA251    cmp         dword ptr [ebp-10],0
>005AA255    je          005AA269
 005AA257    mov         edx,5AA2A0;'FF'
 005AA25C    mov         eax,dword ptr [ebp-10]
 005AA25F    call        TextStartsWith
 005AA264    mov         byte ptr [ebp-9],al
>005AA267    jmp         005AA26D
 005AA269    mov         byte ptr [ebp-9],0
 005AA26D    xor         eax,eax
 005AA26F    pop         edx
 005AA270    pop         ecx
 005AA271    pop         ecx
 005AA272    mov         dword ptr fs:[eax],edx
 005AA275    push        5AA28A
 005AA27A    lea         eax,[ebp-10]
 005AA27D    call        @UStrClr
 005AA282    ret
>005AA283    jmp         @HandleFinally
>005AA288    jmp         005AA27A
 005AA28A    mov         al,byte ptr [ebp-9]
 005AA28D    mov         esp,ebp
 005AA28F    pop         ebp
 005AA290    ret
*}
end;

//005AA2A8
procedure TIdStack.CalcCheckSum(const AData:TIdBytes);
begin
{*
 005AA2A8    push        ebp
 005AA2A9    mov         ebp,esp
 005AA2AB    add         esp,0FFFFFFE8
 005AA2AE    mov         dword ptr [ebp-8],edx
 005AA2B1    mov         dword ptr [ebp-4],eax
 005AA2B4    xor         eax,eax
 005AA2B6    mov         dword ptr [ebp-18],eax
 005AA2B9    xor         eax,eax
 005AA2BB    mov         dword ptr [ebp-10],eax
 005AA2BE    mov         eax,dword ptr [ebp-8]
 005AA2C1    call        @DynArrayLength
 005AA2C6    mov         dword ptr [ebp-14],eax
 005AA2C9    cmp         dword ptr [ebp-14],1
>005AA2CD    jle         005AA2EE
 005AA2CF    mov         edx,dword ptr [ebp-10]
 005AA2D2    mov         eax,dword ptr [ebp-8]
 005AA2D5    call        BytesToWord
 005AA2DA    movzx       eax,ax
 005AA2DD    add         dword ptr [ebp-18],eax
 005AA2E0    sub         dword ptr [ebp-14],2
 005AA2E4    add         dword ptr [ebp-10],2
 005AA2E8    cmp         dword ptr [ebp-14],1
>005AA2EC    jg          005AA2CF
 005AA2EE    cmp         dword ptr [ebp-14],0
>005AA2F2    jle         005AA301
 005AA2F4    mov         eax,dword ptr [ebp-8]
 005AA2F7    mov         edx,dword ptr [ebp-10]
 005AA2FA    movzx       eax,byte ptr [eax+edx]
 005AA2FE    add         dword ptr [ebp-18],eax
 005AA301    mov         eax,dword ptr [ebp-18]
 005AA304    shr         eax,10
 005AA307    mov         edx,dword ptr [ebp-18]
 005AA30A    and         edx,0FFFF
 005AA310    add         eax,edx
 005AA312    mov         dword ptr [ebp-18],eax
 005AA315    mov         eax,dword ptr [ebp-18]
 005AA318    shr         eax,10
 005AA31B    add         dword ptr [ebp-18],eax
 005AA31E    mov         ax,word ptr [ebp-18]
 005AA322    not         ax
 005AA325    mov         word ptr [ebp-0A],ax
 005AA329    mov         ax,word ptr [ebp-0A]
 005AA32D    mov         esp,ebp
 005AA32F    pop         ebp
 005AA330    ret
*}
end;

Initialization
//00781624
{*
 00781624    sub         dword ptr ds:[8155C4],1
>0078162B    jae         00781652
 0078162D    mov         eax,[005A49E0];TIdStackWindows
 00781632    mov         [00789ED8],eax
 00781637    mov         dl,1
 00781639    mov         eax,[005970A8];TIdCriticalSection
 0078163E    call        TCriticalSection.Create
 00781643    mov         [00789EE0],eax
 00781648    mov         eax,[00789EE0]
 0078164D    call        IndyRegisterExpectedMemoryLeak
 00781652    ret
*}
Finalization
end.