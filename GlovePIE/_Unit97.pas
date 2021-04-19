//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit97;

interface

uses
  SysUtils, Classes, IdReply, IdReplyRFC, IdTCPConnection, IdTCPClient, IdSocks, IdUDPClient, IdYarn, IdThreadSafe, IdThread, IdAntiFreezeBase, IdSocketHandle, IdUDPBase, IdBuffer, IdExceptionCore, IdIntercept, IdIOHandler, IdCustomTransparentProxy, IdIOHandlerSocket, IdIPAddress, IdIOHandlerStack, ThdTimer, IdException, IdStreamVCL, IdGlobal, System;

type
  TIdReply = class(TCollectionItem)
  published
    function ReplyExists:Boolean;//005B982C
    procedure RaiseReplyError;//005B9334
    procedure SetReply(ACode:Integer; AText:string);//005B989C
    procedure UpdateText;//005B9A28
    procedure SetReply(ACode:string; AText:string);//005B99EC
    constructor Create;//005B96FC
    procedure Clear;//005B969C
    constructor CreateWithReplyTexts(AReplyTexts:TIdReplies);//005B96B4
    function IsEndMarker(ALine:string):Boolean;//005B9A0C
    destructor Destroy();//005B9738
  public
    FCode:string;//fC
    FFormattedReply:TStrings;//f10
    FReplyTexts:TIdReplies;//f14
    FText:TStrings;//f18
    destructor Destroy(); virtual;//005B9738
    procedure AssignTo(ADest:TPersistent); virtual;//v0//005B965C
    function GetDisplayName:UnicodeString; virtual;//vC//005B97A4
    constructor Create; virtual;//v1C//005B96FC
    function GetFormattedReplyStrings:TStrings; virtual;//v20//005B9A18
    //function v24:?; virtual;//v24//005B9A08
    procedure v28; virtual;//v28//005B9A10
    procedure SetFormattedReply; virtual; abstract;//v2C//00404A58
    procedure Clear; virtual;//v30//005B969C
    constructor CreateWithReplyTexts(AReplyTexts:TIdReplies); virtual;//v34//005B96B4
    function IsEndMarker(ALine:string):Boolean; virtual;//v38//005B9A0C
    procedure RaiseReplyError; virtual; abstract;//v3C//00404A58
    function ReplyExists:Boolean; virtual;//v40//005B982C
    procedure SetReply(ACode:Integer; AText:string); virtual;//v44//005B989C
    procedure SetReply(ACode:string; AText:string); virtual;//v48//005B99EC
    procedure CommonInit;//005B9780
    procedure SetNumericCode(const AValue:Integer);//005B9838
    procedure SetText(const AValue:TStrings);//005B9888
    function GetNumericCode:Integer;//005B98F4
    procedure SetCode(const AValue:UnicodeString);//005B9900
  end;
  TIdReplies = class(TOwnedCollection)
  published
    constructor Create(AReplyClass:TIdReplyClass);//005B9B00
    function Find(ACode:string; AIgnore:TIdReply):TIdReply;//005B9B40
    procedure UpdateText(AReply:TIdReply);//005B9BBC
    function Add:TIdReply;//005B9A38
    function Add(ACode:Integer; AText:string):TIdReply;//005B9A44
    function Add(ACode:string; AText:string):TIdReply;//005B9AA0
  public
    constructor Create(AReplyClass:TIdReplyClass); virtual;//v28//005B9B00
    function Find(ACode:string; AIgnore:TIdReply):TIdReply; virtual;//v2C//005B9B40
    procedure UpdateText(AReply:TIdReply); virtual;//v30//005B9BBC
    function GetItem(Index:Integer):TIdReply;//005B9BA8
  end;
  EIdReplyError = class(EIdException)
  end;
  TIdReplyRFC = class(TIdReply)
  published
    function ReplyExists:Boolean;//005BA15C
    procedure RaiseReplyError;//005BA0FC
    function IsEndMarker(ALine:string):Boolean;//005BA0E0
  public
    procedure AssignTo(ADest:TPersistent); virtual;//v0//005B9ED4
    function CheckIfCodeIsValid(const ACode:UnicodeString):Boolean; virtual;//v24//005B9F18
    function GetFormattedReply:TStrings; virtual;//v28//005B9F84
    procedure SetFormattedReply(const AValue:TStrings); virtual;//v2C//005BA180
    function IsEndMarker(ALine:string):Boolean; virtual;//v38//005BA0E0
    procedure RaiseReplyError; virtual;//v3C//005BA0FC
    function ReplyExists:Boolean; virtual;//v40//005BA15C
  end;
  EIdReplyRFCError = class(EIdReplyError)
  published
    constructor CreateError(AReplyMessage:string);//005BA270
  public
    FErrorCode:Integer;//f18
    constructor CreateError(AReplyMessage:string); virtual;//vC//005BA270
  end;
  TIdTCPConnection = class(TIdComponent)
  published
    procedure RaiseExceptionForLastCmdResult;//005BAE84
    procedure RaiseExceptionForLastCmdResult(AException:TClassIdException);//005BAE28
    function GetResponse(AAllowedResponse:string; AEncoding:TEncoding):string;//005BB4D4
    function GetResponse(AAllowedResponse:SmallInt; AEncoding:TEncoding):SmallInt;//005BB4A0
    procedure GetResponse(const AAllowedResponses:array[$0..-$1] of System.SmallInt; const _Dv_:$0..-$1; AEncoding:TIdTextEncoding);//005BADF4
    procedure WriteHeader(AHeader:TStrings);//005BB124
    procedure WriteRFCStrings(AStrings:TStrings);//005BB47C
    function SendCmd(AOut:string; AResponse:string; AEncoding:TEncoding):string;//005BB508
    function SendCmd(AOut:string; AResponse:SmallInt; AEncoding:TEncoding):SmallInt;//005BB25C
    procedure SendCmd(AOut:UnicodeString; const AResponse:array[$0..-$1] of System.SmallInt; const _Dv_:$0..-$1; AEncoding:TIdTextEncoding);//005BAE90
    function CheckResponse(AResponse:string; AAllowedResponse:string):string;//005BB58C
    function Connected:Boolean;//005BACBC
    procedure CheckResponse(const AResponse:SmallInt; const AAllowedResponses:array[$0..-$1] of System.SmallInt; const _Dv_:$0..-$1);//005BB35C
    procedure CreateIOHandler(ABaseType:TIdIOHandlerClass);//005BAC20
    procedure CheckForGracefulDisconnect(ARaiseExceptionIfDisconnected:Boolean);//005BB2E4
    procedure DisconnectNotifyPeer;//005BB674
    procedure GetInternalResponse(AEncoding:TEncoding);//005BB3AC
    procedure Disconnect(ANotifyPeer:Boolean);//005BAD4C
    destructor Destroy();//005BACDC
    procedure Disconnect;//005BB66C
  public
    FGreeting:TIdReply;//f90
    FIntercept:TIdConnectionIntercept;//f94
    FIOHandler:TIdIOHandler;//f98
    FLastCmdResult:TIdReply;//f9C
    FManagedIOHandler:Boolean;//fA0
    FOnDisconnected:TNotifyEvent;//fA8
    FSocket:TIdIOHandlerSocket;//fB0
    FReplyClass:TIdReplyClass;//fB4
    destructor Destroy(); virtual;//005BACDC
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//005BAF18
    procedure InitComponent; virtual;//v34//005BB5C4
    procedure DoOnDisconnected; virtual;//v44//005BADD4
    function GetIntercept:TIdConnectionIntercept; virtual;//v48//005BAC00
    constructor Create; virtual;//v4C//005BAC18
    procedure SetIntercept(AValue:TIdConnectionIntercept); virtual;//v50//005BAF60
    procedure SetIOHandler(AValue:TIdIOHandler); virtual;//v54//005BB014
    procedure v58; virtual;//v58//005BB678
    procedure CheckForGracefulDisconnect(ARaiseExceptionIfDisconnected:Boolean); virtual;//v5C//005BB2E4
    procedure CheckResponse(const AResponse:SmallInt; const AAllowedResponses:array[$0..-$1] of System.SmallInt; const _Dv_:$0..-$1); virtual;//v60//005BB35C
    function CheckResponse(AResponse:string; AAllowedResponse:string):string; virtual;//v64//005BB58C
    function Connected:Boolean; virtual;//v68//005BACBC
    procedure Disconnect(ANotifyPeer:Boolean); virtual;//v6C//005BAD4C
    procedure DisconnectNotifyPeer; virtual;//v70//005BB674
    procedure GetInternalResponse(AEncoding:TEncoding); virtual;//v74//005BB3AC
    procedure GetResponse(const AAllowedResponses:array[$0..-$1] of System.SmallInt; const _Dv_:$0..-$1; AEncoding:TIdTextEncoding); virtual;//v78//005BADF4
    function GetResponse(AAllowedResponse:string; AEncoding:TEncoding):string; virtual;//v7C//005BB4D4
    procedure RaiseExceptionForLastCmdResult; virtual;//v80//005BAE84
    procedure RaiseExceptionForLastCmdResult(AException:TClassIdException); virtual;//v84//005BAE28
    procedure SendCmd(AOut:UnicodeString; const AResponse:array[$0..-$1] of System.SmallInt; const _Dv_:$0..-$1; AEncoding:TIdTextEncoding); virtual;//v88//005BAE90
    procedure CheckConnected;//005BB608
    procedure SetGreeting(AValue:TIdReply);//005BB660
  end;
  TIdTCPClientCustom = class(TIdTCPConnection)
  published
    procedure Connect(AHost:string; APort:Word);//005BC6DC
    function ConnectAndGetAll:string;//005BC328
    procedure Connect;//005BC040
    procedure Connect(AHost:string);//005BC6C0
  public
    FBoundIP:string;//fB8
    FBoundPort:Word;//fBC
    FBoundPortMax:Word;//fBE
    FBoundPortMin:Word;//fC0
    FConnectTimeout:Integer;//fC4
    FDestination:string;//fC8
    FHost:string;//fCC
    FIPVersion:TIdIPVersion;//fD0
    FOnConnected:TNotifyEvent;//fD8
    FPassword:string;//fE0
    FPort:Word;//fE4
    FReadTimeout:Integer;//fE8
    FUsername:string;//fEC
    FReuseSocket:TIdReuseSocket;//fF0
    FUseNagle:Boolean;//fF1
    FOnBeforeBind:TNotifyEvent;//fF8
    FOnAfterBind:TNotifyEvent;//f100
    FOnSocketAllocated:TNotifyEvent;//f108
    procedure InitComponent; virtual;//v34//005BC008
    procedure SetIOHandler(AValue:TIdIOHandler); virtual;//v54//005BC598
    procedure DoOnConnected; virtual;//v8C//005BC384
    function MakeImplicitClientHandler:TIdIOHandler; virtual;//v90//005BC6B0
    procedure SetHost(const AValue:UnicodeString); virtual;//v94//005BC488
    procedure SetPort(const AValue:TIdPort); virtual;//v98//005BC4B4
    procedure SetIPVersion(const AValue:TIdIPVersion); virtual;//v9C//005BC4D8
    procedure Connect; virtual;//vA0//005BC040
    function ConnectAndGetAll:string; virtual;//vA4//005BC328
    procedure SetConnectTimeout(const AValue:Integer);//005BC3A4
    procedure SetReadTimeout(const AValue:Integer);//005BC3BC
    procedure SetReuseSocket(const AValue:TIdReuseSocket);//005BC3D4
    procedure SetUseNagle(const AValue:Boolean);//005BC3EC
    procedure SetBoundIP(const AValue:UnicodeString);//005BC404
    procedure SetBoundPort(const AValue:TIdPort);//005BC434
    procedure SetBoundPortMax(const AValue:TIdPort);//005BC450
    procedure SetBoundPortMin(const AValue:TIdPort);//005BC46C
    procedure SetOnBeforeBind(AValue:TNotifyEvent);//005BC4F0
    procedure SetOnAfterBind(AValue:TNotifyEvent);//005BC528
    procedure SetOnSocketAllocated(AValue:TNotifyEvent);//005BC560
    function GetReadTimeout:Integer;//005BC708
    function GetReuseSocket:TIdReuseSocket;//005BC720
    function GetUseNagle:Boolean;//005BC73C
  end;
  TIdTCPClient = class(TIdTCPClientCustom)
  end;
  EIdSocksUDPNotSupportedBySOCKSVersion = class(EIdException)
  end;
  TSocksVersion = (svNoSocks, svSocks4, svSocks4A, svSocks5);
  TSocksAuthentication = (saNoAuthentication, saUsernamePassword);
  TIdSocksInfo = class(TIdCustomTransparentProxy)
  published
    procedure RecvFromUDP(AHandle:TIdSocketHandle; var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; var VIPVersion:TIdIPVersion; AMSec:Integer);//005BF434
    procedure OpenUDP(AHandle:TIdSocketHandle; AHost:string; AIPVersion:TIdIPVersion; APort:Word);//005BEED4
    procedure CloseUDP(AHandle:TIdSocketHandle);//005BEE68
    procedure SendToUDP(AHandle:TIdSocketHandle; const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion; const ABuffer:TIdBytes);//005BF588
    destructor Destroy();//005BF62C
    procedure Assign(ASource:TPersistent);//005BCD90
    function Listen(AIOHandler:TIdIOHandler; ATimeOut:Integer):Boolean;//005BE3A8
    procedure Bind(AIOHandler:TIdIOHandler; AHost:string; AIPVersion:TIdIPVersion; APort:Word);//005BE370
  public
    FAuthentication:TSocksAuthentication;//fA8
    FVersion:TSocksVersion;//fA9
    FUDPSocksAssociation:TIdIOHandlerSocket;//fAC
    destructor Destroy(); virtual;//005BF62C
    procedure Assign(ASource:TPersistent); virtual;//v8//005BCD90
    procedure InitComponent; virtual;//v34//005BDB1C
    function GetEnabled:Boolean; virtual;//v44//005BDB0C
    procedure MakeConnection(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion); virtual;//v4C//005BDAD8
    procedure OpenUDP(AHandle:TIdSocketHandle; AHost:string; AIPVersion:TIdIPVersion; APort:Word); virtual;//v50//005BEED4
    procedure CloseUDP(AHandle:TIdSocketHandle); virtual;//v54//005BEE68
    procedure RecvFromUDP(AHandle:TIdSocketHandle; var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; var VIPVersion:TIdIPVersion; AMSec:Integer); virtual;//v58//005BF434
    procedure SendToUDP(AHandle:TIdSocketHandle; const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion; const ABuffer:TIdBytes); virtual;//v5C//005BF588
    procedure Bind(AIOHandler:TIdIOHandler; AHost:string; AIPVersion:TIdIPVersion; APort:Word); virtual;//v60//005BE370
    function Listen(AIOHandler:TIdIOHandler; ATimeOut:Integer):Boolean; virtual;//v64//005BE3A8
    procedure MakeSocks4Request(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort; const ARequest:Byte);//005BCDD0
    procedure MakeSocks4Connection(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort);//005BD120
    procedure MakeSocks5Request(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort; const ARequest:Byte; var VBuf:TIdBytes; var VLen:Integer);//005BD240
    procedure MakeSocks5Connection(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion);//005BD4B8
    procedure MakeSocks4Bind(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort);//005BD804
    procedure AuthenticateSocks5Connection(AIOHandler:TIdIOHandler);//005BDB58
    procedure MakeSocks5Bind(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion);//005BDE28
    function MakeSocks5Listen(AIOHandler:TIdIOHandler; const ATimeOut:Integer):Boolean;//005BE3D8
    function MakeSocks4Listen(AIOHandler:TIdIOHandler; const ATimeOut:Integer):Boolean;//005BE79C
    procedure CloseSocks5UDPAssociation;//005BE998
    procedure MakeSocks5UDPAssociation(AHandle:TIdSocketHandle);//005BE9B0
    function DisasmUDPReplyPacket(const APacket:TIdBytes; var VHost:UnicodeString; var VPort:TIdPort; var VIPVersion:TIdIPVersion):TIdBytes;//005BEF44
    function MakeUDPRequestPacket(const AData:TIdBytes; const AHost:UnicodeString; const APort:TIdPort):TIdBytes;//005BF170
  end;
  EIdMustUseOpenProxy = class(EIdUDPException)
  end;
  TIdUDPClient = class(TIdUDPBase)
  published
    procedure Send(AData:string; AEncoding:TEncoding);//005C0230
    procedure ReceiveBuffer(var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; var VIPVersion:TIdIPVersion; const AMSec:Integer);//005C05B8
    procedure ReceiveBuffer(var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; AMSec:Integer);//005C0208
    procedure SendBuffer(const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion; const ABuffer:TIdBytes);//005C0644
    procedure SendBuffer(const ABuffer:TIdBytes);//005C0290
    procedure SendBuffer(const AHost:UnicodeString; const APort:TIdPort; const ABuffer:TIdBytes);//005C036C
    procedure ReceiveBuffer(var ABuffer:TIdBytes; const AMSec:Integer);//005C00D0
    procedure CloseProxy;//005BFD24
    procedure OpenProxy;//005C0094
    destructor Destroy();//005C0560
    function Connected:Boolean;//005BFEE4
    procedure Disconnect;//005BFF04
    procedure Connect;//005BFD58
  public
    FBoundIP:string;//fB0
    FBoundPort:Word;//fB4
    FBoundPortMin:Word;//fB6
    FBoundPortMax:Word;//fB8
    FProxyOpened:Boolean;//fBA
    FOnConnected:TNotifyEvent;//fC0
    FOnDisconnected:TNotifyEvent;//fC8
    FConnected:Boolean;//fD0
    FTransparentProxy:TIdCustomTransparentProxy;//fD4
    destructor Destroy(); virtual;//005C0560
    procedure InitComponent; virtual;//v34//005C005C
    function GetBinding:TIdSocketHandle; virtual;//v4C//005BFFA0
    procedure SetIPVersion(const AValue:TIdIPVersion); virtual;//v54//005C03FC
    procedure SetHost(const AValue:UnicodeString); virtual;//v5C//005C03D0
    procedure SetPort(const AValue:TIdPort); virtual;//v64//005C0420
    procedure ReceiveBuffer(var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; AMSec:Integer); virtual;//v68//005C0208
    procedure ReceiveBuffer(var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; var VIPVersion:TIdIPVersion; const AMSec:Integer); virtual;//v6C//005C05B8
    procedure ReceiveBuffer(var ABuffer:TIdBytes; const AMSec:Integer); virtual;//v70//005C00D0
    procedure SendBuffer(const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion; const ABuffer:TIdBytes); virtual;//v74//005C0644
    procedure SendBuffer(const AHost:UnicodeString; const APort:TIdPort; const ABuffer:TIdBytes); virtual;//v78//005C036C
    procedure DoOnConnected; virtual;//v7C//005BFF60
    procedure DoOnDisconnected; virtual;//v80//005BFF80
    procedure Connect; virtual;//v84//005BFD58
    procedure Disconnect; virtual;//v88//005BFF04
    function GetTransparentProxy:TIdCustomTransparentProxy;//005C0034
    procedure RaiseUseProxyError;//005C01B4
    procedure SetTransparentProxy(AProxy:TIdCustomTransparentProxy);//005C0448
    function UseProxy:Boolean;//005C0548
  end;
  TIdYarn = class(TObject)
  end;
  TIdThreadSafe = class(TObject)
  published
    procedure Lock;//005C0AF8
    procedure Unlock;//005C0B00
    constructor Create();//005C0A7C
    destructor Destroy();//005C0AC0
  public
    FCriticalSection:TIdCriticalSection;//f4
    destructor Destroy(); virtual;//005C0AC0
    constructor Create(); virtual;//v0//005C0A7C
  end;
  TIdThreadSafeInteger = class(TIdThreadSafe)
  published
    function Increment:Integer;//005C0C04
    function Increment(AValue:Integer):Integer;//005C0C58
    function Decrement:Integer;//005C0B0C
    function Decrement(AValue:Integer):Integer;//005C0B60
  public
    FValue:Integer;//f8
  end;
  EIdThreadException = class(EIdException)
  end;
  EIdThreadTerminateAndWaitFor = class(EIdThreadException)
  end;
  TIdThreadStopMode = (smTerminate, smSuspend);
  TIdExceptionThreadEvent = procedure(AThread:TIdThread; AException:Exception) of object;;
  TIdNotifyThreadEvent = procedure(AThread:TIdThread) of object;;
  :3 = (itoStopped, itoReqCleanup, itoDataOwner, itoTag);
  TIdThreadOptions = set of :3;
  TIdThread = class(TThread)
  published
    procedure Synchronize(Method:TThreadMethod);//005C1CF0
    procedure Terminate;//005C1BB0
    procedure TerminateAndWaitFor;//005C157C
    procedure Stop;//005C1AA4
    constructor Create(AName:string; ALoop:Boolean);//005C18A4
    destructor Destroy();//005C192C
    procedure Start;//005C1A30
  public
    FData:TObject;//f40
    FLock:TIdCriticalSection;//f44
    FLoop:Boolean;//f48
    FName:string;//f4C
    FStopMode:TIdThreadStopMode;//f50
    FOptions:TIdThreadOptions;//f51
    FTerminatingException:string;//f54
    FTerminatingExceptionClass:TClass;//f58
    FYarn:TIdYarn;//f5C
    FOnException:TIdExceptionThreadEvent;//f60
    FOnStopped:TIdNotifyThreadEvent;//f68
    destructor Destroy(); virtual;//005C192C
    procedure Execute; virtual;//v4//005C1600
    procedure AfterRun; virtual;//v8//005C15F4
    procedure vC; virtual;//vC//005C15FC
    procedure v10; virtual;//v10//005C15F8
    procedure v14; virtual;//v14//005C15F0
    procedure Cleanup; virtual;//v18//005C1CBC
    procedure DoException(AException:Exception); virtual;//v1C//005C1B98
    procedure DoStopped; virtual;//v20//005C1B84
    //function v24:?; virtual;//v24//005C1CEC
    constructor Create(AName:string; ALoop:Boolean); virtual;//v2C//005C18A4
    procedure Start; virtual;//v30//005C1A30
    procedure Stop; virtual;//v34//005C1AA4
    procedure Terminate; virtual;//v38//005C1BB0
    procedure TerminateAndWaitFor; virtual;//v3C//005C157C
    function GetStopped:Boolean;//005C1B0C
  end;
    procedure AssignTo(ADest:TPersistent);//005B965C
    function GetDisplayName:UnicodeString;//005B97A4
    //function sub_005B9A08:?;//005B9A08
    procedure sub_005B9A10;//005B9A10
    function GetFormattedReplyStrings:TStrings;//005B9A18
    procedure AssignTo(ADest:TPersistent);//005B9ED4
    function CheckIfCodeIsValid(const ACode:UnicodeString):Boolean;//005B9F18
    function GetFormattedReply:TStrings;//005B9F84
    procedure SetFormattedReply(const AValue:TStrings);//005BA180
    function GetIntercept:TIdConnectionIntercept;//005BAC00
    constructor Create;//005BAC18
    procedure DoOnDisconnected;//005BADD4
    procedure Notification(AComponent:TComponent; Operation:TOperation);//005BAF18
    procedure SetIntercept(AValue:TIdConnectionIntercept);//005BAF60
    procedure SetIOHandler(AValue:TIdIOHandler);//005BB014
    procedure InitComponent;//005BB5C4
    procedure sub_005BB678;//005BB678
    procedure InitComponent;//005BC008
    procedure DoOnConnected;//005BC384
    procedure SetHost(const AValue:UnicodeString);//005BC488
    procedure SetPort(const AValue:TIdPort);//005BC4B4
    procedure SetIPVersion(const AValue:TIdIPVersion);//005BC4D8
    procedure SetIOHandler(AValue:TIdIOHandler);//005BC598
    function MakeImplicitClientHandler:TIdIOHandler;//005BC6B0
    procedure MakeConnection(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion);//005BDAD8
    function GetEnabled:Boolean;//005BDB0C
    procedure InitComponent;//005BDB1C
    procedure DoOnConnected;//005BFF60
    procedure DoOnDisconnected;//005BFF80
    function GetBinding:TIdSocketHandle;//005BFFA0
    procedure InitComponent;//005C005C
    procedure SetHost(const AValue:UnicodeString);//005C03D0
    procedure SetIPVersion(const AValue:TIdIPVersion);//005C03FC
    procedure SetPort(const AValue:TIdPort);//005C0420
    function GetValue:Cardinal;//005C0BB8
    procedure SetValue(const AValue:Cardinal);//005C0CB0
    procedure sub_005C15F0;//005C15F0
    procedure AfterRun;//005C15F4
    procedure sub_005C15F8;//005C15F8
    procedure sub_005C15FC;//005C15FC
    procedure Execute;//005C1600
    procedure DoStopped;//005C1B84
    procedure DoException(AException:Exception);//005C1B98
    procedure Cleanup;//005C1CBC
    //function sub_005C1CEC:?;//005C1CEC

implementation

//005B9334
procedure TIdReply.RaiseReplyError;
begin
{*
>005B9334    jmp         @AbstractError
*}
end;

//005B965C
procedure TIdReply.AssignTo(ADest:TPersistent);
begin
{*
 005B965C    push        ebx
 005B965D    push        esi
 005B965E    push        edi
 005B965F    mov         ebx,edx
 005B9661    mov         esi,eax
 005B9663    mov         eax,ebx
 005B9665    mov         edx,dword ptr ds:[5B8EC4];TIdReply
 005B966B    call        @IsClass
 005B9670    test        al,al
>005B9672    je          005B968D
 005B9674    mov         edi,ebx
 005B9676    mov         edx,dword ptr [esi+0C]
 005B9679    mov         eax,edi
 005B967B    call        TIdReply.SetCode
 005B9680    mov         eax,dword ptr [edi+18]
 005B9683    mov         edx,dword ptr [esi+18]
 005B9686    mov         ecx,dword ptr [eax]
 005B9688    call        dword ptr [ecx+8]
>005B968B    jmp         005B9696
 005B968D    mov         edx,ebx
 005B968F    mov         eax,esi
 005B9691    call        TPersistent.AssignTo
 005B9696    pop         edi
 005B9697    pop         esi
 005B9698    pop         ebx
 005B9699    ret
*}
end;

//005B969C
procedure TIdReply.Clear;
begin
{*
 005B969C    push        ebx
 005B969D    mov         ebx,eax
 005B969F    mov         eax,dword ptr [ebx+18]
 005B96A2    mov         edx,dword ptr [eax]
 005B96A4    call        dword ptr [edx+44]
 005B96A7    lea         eax,[ebx+0C]
 005B96AA    call        @UStrClr
 005B96AF    pop         ebx
 005B96B0    ret
*}
end;

//005B96B4
constructor TIdReply.CreateWithReplyTexts(AReplyTexts:TIdReplies);
begin
{*
 005B96B4    push        ebp
 005B96B5    mov         ebp,esp
 005B96B7    push        ebx
 005B96B8    push        esi
 005B96B9    test        dl,dl
>005B96BB    je          005B96C5
 005B96BD    add         esp,0FFFFFFF0
 005B96C0    call        @ClassCreate
 005B96C5    mov         ebx,edx
 005B96C7    mov         esi,eax
 005B96C9    xor         edx,edx
 005B96CB    mov         eax,esi
 005B96CD    call        TCollectionItem.Create
 005B96D2    mov         eax,dword ptr [ebp+8]
 005B96D5    mov         dword ptr [esi+14],eax
 005B96D8    mov         eax,esi
 005B96DA    call        TIdReply.CommonInit
 005B96DF    mov         eax,esi
 005B96E1    test        bl,bl
>005B96E3    je          005B96F4
 005B96E5    call        @AfterConstruction
 005B96EA    pop         dword ptr fs:[0]
 005B96F1    add         esp,0C
 005B96F4    mov         eax,esi
 005B96F6    pop         esi
 005B96F7    pop         ebx
 005B96F8    pop         ebp
 005B96F9    ret         4
*}
end;

//005B96FC
constructor TIdReply.Create;
begin
{*
 005B96FC    push        ebx
 005B96FD    push        esi
 005B96FE    test        dl,dl
>005B9700    je          005B970A
 005B9702    add         esp,0FFFFFFF0
 005B9705    call        @ClassCreate
 005B970A    mov         ebx,edx
 005B970C    mov         esi,eax
 005B970E    xor         edx,edx
 005B9710    mov         eax,esi
 005B9712    call        TCollectionItem.Create
 005B9717    mov         eax,esi
 005B9719    call        TIdReply.CommonInit
 005B971E    mov         eax,esi
 005B9720    test        bl,bl
>005B9722    je          005B9733
 005B9724    call        @AfterConstruction
 005B9729    pop         dword ptr fs:[0]
 005B9730    add         esp,0C
 005B9733    mov         eax,esi
 005B9735    pop         esi
 005B9736    pop         ebx
 005B9737    ret
*}
end;

//005B9738
destructor TIdReply.Destroy();
begin
{*
 005B9738    push        ebx
 005B9739    push        esi
 005B973A    call        @BeforeDestruction
 005B973F    mov         ebx,edx
 005B9741    mov         esi,eax
 005B9743    lea         eax,[esi+18]
 005B9746    mov         edx,dword ptr [eax]
 005B9748    xor         ecx,ecx
 005B974A    mov         dword ptr [eax],ecx
 005B974C    mov         eax,edx
 005B974E    call        TObject.Free
 005B9753    lea         eax,[esi+10]
 005B9756    mov         edx,dword ptr [eax]
 005B9758    xor         ecx,ecx
 005B975A    mov         dword ptr [eax],ecx
 005B975C    mov         eax,edx
 005B975E    call        TObject.Free
 005B9763    mov         edx,ebx
 005B9765    and         dl,0FC
 005B9768    mov         eax,esi
 005B976A    call        TCollectionItem.Destroy
 005B976F    test        bl,bl
>005B9771    jle         005B977A
 005B9773    mov         eax,esi
 005B9775    call        @ClassDestroy
 005B977A    pop         esi
 005B977B    pop         ebx
 005B977C    ret
*}
end;

//005B9780
procedure TIdReply.CommonInit;
begin
{*
 005B9780    push        ebx
 005B9781    mov         ebx,eax
 005B9783    mov         dl,1
 005B9785    mov         eax,[0043C7BC];TStringList
 005B978A    call        TStringList.Create
 005B978F    mov         dword ptr [ebx+10],eax
 005B9792    mov         dl,1
 005B9794    mov         eax,[0043C7BC];TStringList
 005B9799    call        TStringList.Create
 005B979E    mov         dword ptr [ebx+18],eax
 005B97A1    pop         ebx
 005B97A2    ret
*}
end;

//005B97A4
function TIdReply.GetDisplayName:UnicodeString;
begin
{*
 005B97A4    push        ebp
 005B97A5    mov         ebp,esp
 005B97A7    push        0
 005B97A9    push        ebx
 005B97AA    push        esi
 005B97AB    mov         esi,edx
 005B97AD    mov         ebx,eax
 005B97AF    xor         eax,eax
 005B97B1    push        ebp
 005B97B2    push        5B980F
 005B97B7    push        dword ptr fs:[eax]
 005B97BA    mov         dword ptr fs:[eax],esp
 005B97BD    mov         eax,dword ptr [ebx+18]
 005B97C0    mov         edx,dword ptr [eax]
 005B97C2    call        dword ptr [edx+14]
 005B97C5    test        eax,eax
>005B97C7    jle         005B97EF
 005B97C9    push        dword ptr [ebx+0C]
 005B97CC    push        5B9828;' '
 005B97D1    lea         ecx,[ebp-4]
 005B97D4    xor         edx,edx
 005B97D6    mov         eax,dword ptr [ebx+18]
 005B97D9    mov         ebx,dword ptr [eax]
 005B97DB    call        dword ptr [ebx+0C]
 005B97DE    push        dword ptr [ebp-4]
 005B97E1    mov         eax,esi
 005B97E3    mov         edx,3
 005B97E8    call        @UStrCatN
>005B97ED    jmp         005B97F9
 005B97EF    mov         eax,esi
 005B97F1    mov         edx,dword ptr [ebx+0C]
 005B97F4    call        @UStrAsg
 005B97F9    xor         eax,eax
 005B97FB    pop         edx
 005B97FC    pop         ecx
 005B97FD    pop         ecx
 005B97FE    mov         dword ptr fs:[eax],edx
 005B9801    push        5B9816
 005B9806    lea         eax,[ebp-4]
 005B9809    call        @UStrClr
 005B980E    ret
>005B980F    jmp         @HandleFinally
>005B9814    jmp         005B9806
 005B9816    pop         esi
 005B9817    pop         ebx
 005B9818    pop         ecx
 005B9819    pop         ebp
 005B981A    ret
*}
end;

//005B982C
function TIdReply.ReplyExists:Boolean;
begin
{*
 005B982C    push        ebx
 005B982D    mov         ebx,eax
 005B982F    cmp         dword ptr [ebx+0C],0
 005B9833    setne       al
 005B9836    pop         ebx
 005B9837    ret
*}
end;

//005B9838
procedure TIdReply.SetNumericCode(const AValue:Integer);
begin
{*
 005B9838    push        ebp
 005B9839    mov         ebp,esp
 005B983B    push        0
 005B983D    push        ebx
 005B983E    push        esi
 005B983F    mov         esi,edx
 005B9841    mov         ebx,eax
 005B9843    xor         eax,eax
 005B9845    push        ebp
 005B9846    push        5B987B
 005B984B    push        dword ptr fs:[eax]
 005B984E    mov         dword ptr fs:[eax],esp
 005B9851    lea         edx,[ebp-4]
 005B9854    mov         eax,esi
 005B9856    call        IntToStr
 005B985B    mov         edx,dword ptr [ebp-4]
 005B985E    mov         eax,ebx
 005B9860    call        TIdReply.SetCode
 005B9865    xor         eax,eax
 005B9867    pop         edx
 005B9868    pop         ecx
 005B9869    pop         ecx
 005B986A    mov         dword ptr fs:[eax],edx
 005B986D    push        5B9882
 005B9872    lea         eax,[ebp-4]
 005B9875    call        @UStrClr
 005B987A    ret
>005B987B    jmp         @HandleFinally
>005B9880    jmp         005B9872
 005B9882    pop         esi
 005B9883    pop         ebx
 005B9884    pop         ecx
 005B9885    pop         ebp
 005B9886    ret
*}
end;

//005B9888
procedure TIdReply.SetText(const AValue:TStrings);
begin
{*
 005B9888    push        esi
 005B9889    push        edi
 005B988A    mov         edi,edx
 005B988C    mov         esi,eax
 005B988E    mov         edx,edi
 005B9890    mov         eax,dword ptr [esi+18]
 005B9893    mov         ecx,dword ptr [eax]
 005B9895    call        dword ptr [ecx+8]
 005B9898    pop         edi
 005B9899    pop         esi
 005B989A    ret
*}
end;

//005B989C
procedure TIdReply.SetReply(ACode:Integer; AText:string);
begin
{*
 005B989C    push        ebp
 005B989D    mov         ebp,esp
 005B989F    push        0
 005B98A1    push        ebx
 005B98A2    push        esi
 005B98A3    push        edi
 005B98A4    mov         edi,ecx
 005B98A6    mov         esi,edx
 005B98A8    mov         ebx,eax
 005B98AA    xor         eax,eax
 005B98AC    push        ebp
 005B98AD    push        5B98E4
 005B98B2    push        dword ptr fs:[eax]
 005B98B5    mov         dword ptr fs:[eax],esp
 005B98B8    lea         edx,[ebp-4]
 005B98BB    mov         eax,esi
 005B98BD    call        IntToStr
 005B98C2    mov         edx,dword ptr [ebp-4]
 005B98C5    mov         ecx,edi
 005B98C7    mov         eax,ebx
 005B98C9    mov         ebx,dword ptr [eax]
 005B98CB    call        dword ptr [ebx+48]
 005B98CE    xor         eax,eax
 005B98D0    pop         edx
 005B98D1    pop         ecx
 005B98D2    pop         ecx
 005B98D3    mov         dword ptr fs:[eax],edx
 005B98D6    push        5B98EB
 005B98DB    lea         eax,[ebp-4]
 005B98DE    call        @UStrClr
 005B98E3    ret
>005B98E4    jmp         @HandleFinally
>005B98E9    jmp         005B98DB
 005B98EB    pop         edi
 005B98EC    pop         esi
 005B98ED    pop         ebx
 005B98EE    pop         ecx
 005B98EF    pop         ebp
 005B98F0    ret
*}
end;

//005B98F4
function TIdReply.GetNumericCode:Integer;
begin
{*
 005B98F4    xor         edx,edx
 005B98F6    mov         eax,dword ptr [eax+0C]
 005B98F9    call        IndyStrToInt
 005B98FE    ret
*}
end;

//005B9900
procedure TIdReply.SetCode(const AValue:UnicodeString);
begin
{*
 005B9900    push        ebp
 005B9901    mov         ebp,esp
 005B9903    add         esp,0FFFFFFF0
 005B9906    push        ebx
 005B9907    push        esi
 005B9908    push        edi
 005B9909    xor         ecx,ecx
 005B990B    mov         dword ptr [ebp-10],ecx
 005B990E    mov         dword ptr [ebp-0C],ecx
 005B9911    mov         esi,edx
 005B9913    mov         ebx,eax
 005B9915    xor         eax,eax
 005B9917    push        ebp
 005B9918    push        5B99DC
 005B991D    push        dword ptr fs:[eax]
 005B9920    mov         dword ptr fs:[eax],esp
 005B9923    mov         eax,dword ptr [ebx+0C]
 005B9926    mov         edx,esi
 005B9928    call        @UStrEqual
>005B992D    je          005B99C1
 005B9933    mov         edx,esi
 005B9935    mov         eax,ebx
 005B9937    mov         ecx,dword ptr [eax]
 005B9939    call        dword ptr [ecx+24]
 005B993C    test        al,al
>005B993E    jne         005B996E
 005B9940    mov         dword ptr [ebp-8],esi
 005B9943    mov         byte ptr [ebp-4],11
 005B9947    lea         eax,[ebp-8]
 005B994A    push        eax
 005B994B    push        0
 005B994D    lea         edx,[ebp-0C]
 005B9950    mov         eax,[0078D6DC];^SResString704:TResStringRec
 005B9955    call        LoadResString
 005B995A    mov         ecx,dword ptr [ebp-0C]
 005B995D    mov         dl,1
 005B995F    mov         eax,[005961F8];EIdException
 005B9964    call        Exception.CreateFmt
 005B9969    call        @RaiseExcept
 005B996E    mov         eax,dword ptr [ebx+4]
 005B9971    test        eax,eax
>005B9973    je          005B99B0
 005B9975    xor         ecx,ecx
 005B9977    mov         edx,esi
 005B9979    mov         edi,dword ptr [eax]
 005B997B    call        dword ptr [edi+2C]
 005B997E    test        eax,eax
>005B9980    je          005B99B0
 005B9982    mov         dword ptr [ebp-8],esi
 005B9985    mov         byte ptr [ebp-4],11
 005B9989    lea         eax,[ebp-8]
 005B998C    push        eax
 005B998D    push        0
 005B998F    lea         edx,[ebp-10]
 005B9992    mov         eax,[0078D810];^SResString705:TResStringRec
 005B9997    call        LoadResString
 005B999C    mov         ecx,dword ptr [ebp-10]
 005B999F    mov         dl,1
 005B99A1    mov         eax,[005961F8];EIdException
 005B99A6    call        Exception.CreateFmt
 005B99AB    call        @RaiseExcept
 005B99B0    mov         eax,ebx
 005B99B2    mov         edx,dword ptr [eax]
 005B99B4    call        dword ptr [edx+30]
 005B99B7    lea         eax,[ebx+0C]
 005B99BA    mov         edx,esi
 005B99BC    call        @UStrAsg
 005B99C1    xor         eax,eax
 005B99C3    pop         edx
 005B99C4    pop         ecx
 005B99C5    pop         ecx
 005B99C6    mov         dword ptr fs:[eax],edx
 005B99C9    push        5B99E3
 005B99CE    lea         eax,[ebp-10]
 005B99D1    mov         edx,2
 005B99D6    call        @UStrArrayClr
 005B99DB    ret
>005B99DC    jmp         @HandleFinally
>005B99E1    jmp         005B99CE
 005B99E3    pop         edi
 005B99E4    pop         esi
 005B99E5    pop         ebx
 005B99E6    mov         esp,ebp
 005B99E8    pop         ebp
 005B99E9    ret
*}
end;

//005B99EC
procedure TIdReply.SetReply(ACode:string; AText:string);
begin
{*
 005B99EC    push        esi
 005B99ED    push        edi
 005B99EE    mov         edi,ecx
 005B99F0    mov         esi,eax
 005B99F2    mov         eax,esi
 005B99F4    call        TIdReply.SetCode
 005B99F9    mov         edx,edi
 005B99FB    mov         eax,dword ptr [esi+18]
 005B99FE    mov         ecx,dword ptr [eax]
 005B9A00    call        dword ptr [ecx+2C]
 005B9A03    pop         edi
 005B9A04    pop         esi
 005B9A05    ret
*}
end;

//005B9A08
{*function sub_005B9A08:?;
begin
 005B9A08    mov         al,1
 005B9A0A    ret
end;*}

//005B9A0C
function TIdReply.IsEndMarker(ALine:string):Boolean;
begin
{*
 005B9A0C    xor         eax,eax
 005B9A0E    ret
*}
end;

//005B9A10
procedure sub_005B9A10;
begin
{*
 005B9A10    mov         edx,dword ptr [eax]
 005B9A12    call        dword ptr [edx+20];TIdReply.GetFormattedReplyStrings
 005B9A15    ret
*}
end;

//005B9A18
function TIdReply.GetFormattedReplyStrings:TStrings;
begin
{*
 005B9A18    push        ebx
 005B9A19    mov         ebx,eax
 005B9A1B    mov         eax,dword ptr [ebx+10]
 005B9A1E    mov         edx,dword ptr [eax]
 005B9A20    call        dword ptr [edx+44]
 005B9A23    mov         eax,dword ptr [ebx+10]
 005B9A26    pop         ebx
 005B9A27    ret
*}
end;

//005B9A28
procedure TIdReply.UpdateText;
begin
{*
 005B9A28    mov         edx,dword ptr [eax+14]
 005B9A2B    test        edx,edx
>005B9A2D    je          005B9A35
 005B9A2F    xchg        eax,edx
 005B9A30    mov         ecx,dword ptr [eax]
 005B9A32    call        dword ptr [ecx+30]
 005B9A35    ret
*}
end;

//005B9A38
function TIdReplies.Add:TIdReply;
begin
{*
 005B9A38    push        ebx
 005B9A39    mov         ebx,eax
 005B9A3B    mov         eax,ebx
 005B9A3D    call        TCollection.Add
 005B9A42    pop         ebx
 005B9A43    ret
*}
end;

//005B9A44
function TIdReplies.Add(ACode:Integer; AText:string):TIdReply;
begin
{*
 005B9A44    push        ebp
 005B9A45    mov         ebp,esp
 005B9A47    push        0
 005B9A49    push        ebx
 005B9A4A    push        esi
 005B9A4B    push        edi
 005B9A4C    mov         edi,ecx
 005B9A4E    mov         esi,edx
 005B9A50    mov         ebx,eax
 005B9A52    xor         eax,eax
 005B9A54    push        ebp
 005B9A55    push        5B9A8E
 005B9A5A    push        dword ptr fs:[eax]
 005B9A5D    mov         dword ptr fs:[eax],esp
 005B9A60    lea         edx,[ebp-4]
 005B9A63    mov         eax,esi
 005B9A65    call        IntToStr
 005B9A6A    mov         edx,dword ptr [ebp-4]
 005B9A6D    mov         ecx,edi
 005B9A6F    mov         eax,ebx
 005B9A71    call        TIdReplies.Add
 005B9A76    mov         ebx,eax
 005B9A78    xor         eax,eax
 005B9A7A    pop         edx
 005B9A7B    pop         ecx
 005B9A7C    pop         ecx
 005B9A7D    mov         dword ptr fs:[eax],edx
 005B9A80    push        5B9A95
 005B9A85    lea         eax,[ebp-4]
 005B9A88    call        @UStrClr
 005B9A8D    ret
>005B9A8E    jmp         @HandleFinally
>005B9A93    jmp         005B9A85
 005B9A95    mov         eax,ebx
 005B9A97    pop         edi
 005B9A98    pop         esi
 005B9A99    pop         ebx
 005B9A9A    pop         ecx
 005B9A9B    pop         ebp
 005B9A9C    ret
*}
end;

//005B9AA0
function TIdReplies.Add(ACode:string; AText:string):TIdReply;
begin
{*
 005B9AA0    push        ebp
 005B9AA1    mov         ebp,esp
 005B9AA3    push        ecx
 005B9AA4    push        ebx
 005B9AA5    push        esi
 005B9AA6    push        edi
 005B9AA7    mov         edi,ecx
 005B9AA9    mov         esi,edx
 005B9AAB    mov         ebx,eax
 005B9AAD    mov         eax,ebx
 005B9AAF    call        TIdReplies.Add
 005B9AB4    mov         dword ptr [ebp-4],eax
 005B9AB7    xor         edx,edx
 005B9AB9    push        ebp
 005B9ABA    push        5B9ADB
 005B9ABF    push        dword ptr fs:[edx]
 005B9AC2    mov         dword ptr fs:[edx],esp
 005B9AC5    mov         ecx,edi
 005B9AC7    mov         edx,esi
 005B9AC9    mov         eax,dword ptr [ebp-4]
 005B9ACC    mov         ebx,dword ptr [eax]
 005B9ACE    call        dword ptr [ebx+48]
 005B9AD1    xor         eax,eax
 005B9AD3    pop         edx
 005B9AD4    pop         ecx
 005B9AD5    pop         ecx
 005B9AD6    mov         dword ptr fs:[eax],edx
>005B9AD9    jmp         005B9AF7
>005B9ADB    jmp         @HandleAnyException
 005B9AE0    mov         eax,dword ptr [ebp-4]
 005B9AE3    xor         edx,edx
 005B9AE5    mov         dword ptr [ebp-4],edx
 005B9AE8    call        TObject.Free
 005B9AED    call        @RaiseAgain
 005B9AF2    call        @DoneExcept
 005B9AF7    mov         eax,dword ptr [ebp-4]
 005B9AFA    pop         edi
 005B9AFB    pop         esi
 005B9AFC    pop         ebx
 005B9AFD    pop         ecx
 005B9AFE    pop         ebp
 005B9AFF    ret
*}
end;

//005B9B00
constructor TIdReplies.Create(AReplyClass:TIdReplyClass);
begin
{*
 005B9B00    push        ebp
 005B9B01    mov         ebp,esp
 005B9B03    push        ebx
 005B9B04    push        esi
 005B9B05    test        dl,dl
>005B9B07    je          005B9B11
 005B9B09    add         esp,0FFFFFFF0
 005B9B0C    call        @ClassCreate
 005B9B11    mov         ebx,edx
 005B9B13    mov         esi,eax
 005B9B15    mov         eax,dword ptr [ebp+8]
 005B9B18    push        eax
 005B9B19    xor         edx,edx
 005B9B1B    mov         eax,esi
 005B9B1D    call        TOwnedCollection.Create
 005B9B22    mov         eax,esi
 005B9B24    test        bl,bl
>005B9B26    je          005B9B37
 005B9B28    call        @AfterConstruction
 005B9B2D    pop         dword ptr fs:[0]
 005B9B34    add         esp,0C
 005B9B37    mov         eax,esi
 005B9B39    pop         esi
 005B9B3A    pop         ebx
 005B9B3B    pop         ebp
 005B9B3C    ret         4
*}
end;

//005B9B40
function TIdReplies.Find(ACode:string; AIgnore:TIdReply):TIdReply;
begin
{*
 005B9B40    push        ebx
 005B9B41    push        esi
 005B9B42    push        edi
 005B9B43    push        ebp
 005B9B44    add         esp,0FFFFFFF8
 005B9B47    mov         dword ptr [esp],ecx
 005B9B4A    mov         ebp,edx
 005B9B4C    mov         esi,eax
 005B9B4E    xor         eax,eax
 005B9B50    mov         dword ptr [esp+4],eax
 005B9B54    test        ebp,ebp
>005B9B56    je          005B9B9C
 005B9B58    mov         eax,dword ptr [esi+8]
 005B9B5B    mov         edi,dword ptr [eax+8]
 005B9B5E    dec         edi
 005B9B5F    test        edi,edi
>005B9B61    jl          005B9B9C
 005B9B63    inc         edi
 005B9B64    xor         ebx,ebx
 005B9B66    mov         edx,ebx
 005B9B68    mov         eax,esi
 005B9B6A    call        TIdReplies.GetItem
 005B9B6F    mov         eax,dword ptr [eax+0C]
 005B9B72    mov         edx,ebp
 005B9B74    call        @UStrEqual
>005B9B79    jne         005B9B98
 005B9B7B    mov         edx,ebx
 005B9B7D    mov         eax,esi
 005B9B7F    call        TIdReplies.GetItem
 005B9B84    cmp         eax,dword ptr [esp]
>005B9B87    je          005B9B98
 005B9B89    mov         edx,ebx
 005B9B8B    mov         eax,esi
 005B9B8D    call        TIdReplies.GetItem
 005B9B92    mov         dword ptr [esp+4],eax
>005B9B96    jmp         005B9B9C
 005B9B98    inc         ebx
 005B9B99    dec         edi
>005B9B9A    jne         005B9B66
 005B9B9C    mov         eax,dword ptr [esp+4]
 005B9BA0    pop         ecx
 005B9BA1    pop         edx
 005B9BA2    pop         ebp
 005B9BA3    pop         edi
 005B9BA4    pop         esi
 005B9BA5    pop         ebx
 005B9BA6    ret
*}
end;

//005B9BA8
function TIdReplies.GetItem(Index:Integer):TIdReply;
begin
{*
 005B9BA8    push        ebx
 005B9BA9    push        esi
 005B9BAA    mov         esi,edx
 005B9BAC    mov         ebx,eax
 005B9BAE    mov         edx,esi
 005B9BB0    mov         eax,ebx
 005B9BB2    call        TCollection.GetItem
 005B9BB7    pop         esi
 005B9BB8    pop         ebx
 005B9BB9    ret
*}
end;

//005B9BBC
procedure TIdReplies.UpdateText(AReply:TIdReply);
begin
{*
 005B9BBC    push        ebx
 005B9BBD    push        esi
 005B9BBE    push        edi
 005B9BBF    mov         esi,edx
 005B9BC1    mov         ebx,eax
 005B9BC3    mov         eax,dword ptr [esi+18]
 005B9BC6    mov         edx,dword ptr [eax]
 005B9BC8    call        dword ptr [edx+14]
 005B9BCB    test        eax,eax
>005B9BCD    jne         005B9BEC
 005B9BCF    mov         ecx,esi
 005B9BD1    mov         edx,dword ptr [esi+0C]
 005B9BD4    mov         eax,ebx
 005B9BD6    mov         ebx,dword ptr [eax]
 005B9BD8    call        dword ptr [ebx+2C]
 005B9BDB    mov         edi,eax
 005B9BDD    test        edi,edi
>005B9BDF    je          005B9BEC
 005B9BE1    mov         edx,dword ptr [edi+18]
 005B9BE4    mov         eax,dword ptr [esi+18]
 005B9BE7    mov         ecx,dword ptr [eax]
 005B9BE9    call        dword ptr [ecx+8]
 005B9BEC    pop         edi
 005B9BED    pop         esi
 005B9BEE    pop         ebx
 005B9BEF    ret
*}
end;

//005B9ED4
procedure TIdReplyRFC.AssignTo(ADest:TPersistent);
begin
{*
 005B9ED4    push        ebx
 005B9ED5    push        esi
 005B9ED6    push        edi
 005B9ED7    mov         ebx,edx
 005B9ED9    mov         esi,eax
 005B9EDB    mov         eax,ebx
 005B9EDD    mov         edx,dword ptr ds:[5B9BF0];TIdReplyRFC
 005B9EE3    call        @IsClass
 005B9EE8    test        al,al
>005B9EEA    je          005B9F0B
 005B9EEC    mov         edi,ebx
 005B9EEE    mov         eax,esi
 005B9EF0    call        TIdReply.GetNumericCode
 005B9EF5    mov         edx,eax
 005B9EF7    mov         eax,edi
 005B9EF9    call        TIdReply.SetNumericCode
 005B9EFE    mov         eax,dword ptr [edi+18]
 005B9F01    mov         edx,dword ptr [esi+18]
 005B9F04    mov         ecx,dword ptr [eax]
 005B9F06    call        dword ptr [ecx+8]
>005B9F09    jmp         005B9F14
 005B9F0B    mov         edx,ebx
 005B9F0D    mov         eax,esi
 005B9F0F    call        TIdReply.AssignTo
 005B9F14    pop         edi
 005B9F15    pop         esi
 005B9F16    pop         ebx
 005B9F17    ret
*}
end;

//005B9F18
function TIdReplyRFC.CheckIfCodeIsValid(const ACode:UnicodeString):Boolean;
begin
{*
 005B9F18    push        ebp
 005B9F19    mov         ebp,esp
 005B9F1B    push        0
 005B9F1D    push        ebx
 005B9F1E    push        esi
 005B9F1F    mov         esi,edx
 005B9F21    xor         eax,eax
 005B9F23    push        ebp
 005B9F24    push        5B9F75
 005B9F29    push        dword ptr fs:[eax]
 005B9F2C    mov         dword ptr fs:[eax],esp
 005B9F2F    xor         edx,edx
 005B9F31    mov         eax,esi
 005B9F33    call        IndyStrToInt
 005B9F38    mov         ebx,eax
 005B9F3A    cmp         ebx,64
>005B9F3D    jl          005B9F47
 005B9F3F    cmp         ebx,3E8
>005B9F45    jl          005B9F5B
 005B9F47    lea         edx,[ebp-4]
 005B9F4A    mov         eax,esi
 005B9F4C    call        Trim
 005B9F51    cmp         dword ptr [ebp-4],0
>005B9F55    je          005B9F5B
 005B9F57    xor         eax,eax
>005B9F59    jmp         005B9F5D
 005B9F5B    mov         al,1
 005B9F5D    mov         ebx,eax
 005B9F5F    xor         eax,eax
 005B9F61    pop         edx
 005B9F62    pop         ecx
 005B9F63    pop         ecx
 005B9F64    mov         dword ptr fs:[eax],edx
 005B9F67    push        5B9F7C
 005B9F6C    lea         eax,[ebp-4]
 005B9F6F    call        @UStrClr
 005B9F74    ret
>005B9F75    jmp         @HandleFinally
>005B9F7A    jmp         005B9F6C
 005B9F7C    mov         eax,ebx
 005B9F7E    pop         esi
 005B9F7F    pop         ebx
 005B9F80    pop         ecx
 005B9F81    pop         ebp
 005B9F82    ret
*}
end;

//005B9F84
function TIdReplyRFC.GetFormattedReply:TStrings;
begin
{*
 005B9F84    push        ebp
 005B9F85    mov         ebp,esp
 005B9F87    xor         ecx,ecx
 005B9F89    push        ecx
 005B9F8A    push        ecx
 005B9F8B    push        ecx
 005B9F8C    push        ecx
 005B9F8D    push        ecx
 005B9F8E    push        ecx
 005B9F8F    push        ecx
 005B9F90    push        ebx
 005B9F91    push        esi
 005B9F92    push        edi
 005B9F93    mov         esi,eax
 005B9F95    xor         eax,eax
 005B9F97    push        ebp
 005B9F98    push        5BA0AD
 005B9F9D    push        dword ptr fs:[eax]
 005B9FA0    mov         dword ptr fs:[eax],esp
 005B9FA3    mov         eax,esi
 005B9FA5    mov         edx,dword ptr [eax]
 005B9FA7    call        dword ptr [edx+20]
 005B9FAA    mov         dword ptr [ebp-8],eax
 005B9FAD    mov         eax,esi
 005B9FAF    call        TIdReply.GetNumericCode
 005B9FB4    mov         ebx,eax
 005B9FB6    test        ebx,ebx
>005B9FB8    jle         005BA073
 005B9FBE    lea         edx,[ebp-4]
 005B9FC1    mov         eax,ebx
 005B9FC3    call        IntToStr
 005B9FC8    mov         eax,dword ptr [esi+18]
 005B9FCB    mov         edx,dword ptr [eax]
 005B9FCD    call        dword ptr [edx+14]
 005B9FD0    test        eax,eax
>005B9FD2    jle         005BA066
 005B9FD8    mov         eax,dword ptr [esi+18]
 005B9FDB    mov         edx,dword ptr [eax]
 005B9FDD    call        dword ptr [edx+14]
 005B9FE0    dec         eax
 005B9FE1    test        eax,eax
>005B9FE3    jl          005BA08A
 005B9FE9    inc         eax
 005B9FEA    mov         dword ptr [ebp-0C],eax
 005B9FED    xor         ebx,ebx
 005B9FEF    mov         eax,dword ptr [esi+18]
 005B9FF2    mov         edx,dword ptr [eax]
 005B9FF4    call        dword ptr [edx+14]
 005B9FF7    dec         eax
 005B9FF8    cmp         ebx,eax
>005B9FFA    jge         005BA02E
 005B9FFC    push        dword ptr [ebp-4]
 005B9FFF    push        5BA0CC;'-'
 005BA004    lea         ecx,[ebp-14]
 005BA007    mov         edx,ebx
 005BA009    mov         eax,dword ptr [esi+18]
 005BA00C    mov         edi,dword ptr [eax]
 005BA00E    call        dword ptr [edi+0C]
 005BA011    push        dword ptr [ebp-14]
 005BA014    lea         eax,[ebp-10]
 005BA017    mov         edx,3
 005BA01C    call        @UStrCatN
 005BA021    mov         edx,dword ptr [ebp-10]
 005BA024    mov         eax,dword ptr [ebp-8]
 005BA027    mov         ecx,dword ptr [eax]
 005BA029    call        dword ptr [ecx+38]
>005BA02C    jmp         005BA05E
 005BA02E    push        dword ptr [ebp-4]
 005BA031    push        5BA0DC;' '
 005BA036    lea         ecx,[ebp-1C]
 005BA039    mov         edx,ebx
 005BA03B    mov         eax,dword ptr [esi+18]
 005BA03E    mov         edi,dword ptr [eax]
 005BA040    call        dword ptr [edi+0C]
 005BA043    push        dword ptr [ebp-1C]
 005BA046    lea         eax,[ebp-18]
 005BA049    mov         edx,3
 005BA04E    call        @UStrCatN
 005BA053    mov         edx,dword ptr [ebp-18]
 005BA056    mov         eax,dword ptr [ebp-8]
 005BA059    mov         ecx,dword ptr [eax]
 005BA05B    call        dword ptr [ecx+38]
 005BA05E    inc         ebx
 005BA05F    dec         dword ptr [ebp-0C]
>005BA062    jne         005B9FEF
>005BA064    jmp         005BA08A
 005BA066    mov         edx,dword ptr [ebp-4]
 005BA069    mov         eax,dword ptr [ebp-8]
 005BA06C    mov         ecx,dword ptr [eax]
 005BA06E    call        dword ptr [ecx+38]
>005BA071    jmp         005BA08A
 005BA073    mov         eax,dword ptr [esi+18]
 005BA076    mov         edx,dword ptr [eax]
 005BA078    call        dword ptr [edx+14]
 005BA07B    test        eax,eax
>005BA07D    jle         005BA08A
 005BA07F    mov         edx,dword ptr [esi+18]
 005BA082    mov         eax,dword ptr [ebp-8]
 005BA085    mov         ecx,dword ptr [eax]
 005BA087    call        dword ptr [ecx+40]
 005BA08A    xor         eax,eax
 005BA08C    pop         edx
 005BA08D    pop         ecx
 005BA08E    pop         ecx
 005BA08F    mov         dword ptr fs:[eax],edx
 005BA092    push        5BA0B4
 005BA097    lea         eax,[ebp-1C]
 005BA09A    mov         edx,4
 005BA09F    call        @UStrArrayClr
 005BA0A4    lea         eax,[ebp-4]
 005BA0A7    call        @UStrClr
 005BA0AC    ret
>005BA0AD    jmp         @HandleFinally
>005BA0B2    jmp         005BA097
 005BA0B4    mov         eax,dword ptr [ebp-8]
 005BA0B7    pop         edi
 005BA0B8    pop         esi
 005BA0B9    pop         ebx
 005BA0BA    mov         esp,ebp
 005BA0BC    pop         ebp
 005BA0BD    ret
*}
end;

//005BA0E0
function TIdReplyRFC.IsEndMarker(ALine:string):Boolean;
begin
{*
 005BA0E0    mov         eax,edx
 005BA0E2    test        eax,eax
>005BA0E4    je          005BA0EB
 005BA0E6    sub         eax,4
 005BA0E9    mov         eax,dword ptr [eax]
 005BA0EB    cmp         eax,4
>005BA0EE    jl          005BA0F9
 005BA0F0    cmp         word ptr [edx+6],20
 005BA0F5    sete        al
 005BA0F8    ret
 005BA0F9    mov         al,1
 005BA0FB    ret
*}
end;

//005BA0FC
procedure TIdReplyRFC.RaiseReplyError;
begin
{*
 005BA0FC    push        ebp
 005BA0FD    mov         ebp,esp
 005BA0FF    push        0
 005BA101    push        ebx
 005BA102    mov         ebx,eax
 005BA104    xor         eax,eax
 005BA106    push        ebp
 005BA107    push        5BA151
 005BA10C    push        dword ptr fs:[eax]
 005BA10F    mov         dword ptr fs:[eax],esp
 005BA112    lea         edx,[ebp-4]
 005BA115    mov         eax,dword ptr [ebx+18]
 005BA118    mov         ecx,dword ptr [eax]
 005BA11A    call        dword ptr [ecx+1C]
 005BA11D    mov         eax,dword ptr [ebp-4]
 005BA120    push        eax
 005BA121    mov         eax,ebx
 005BA123    call        TIdReply.GetNumericCode
 005BA128    mov         ecx,eax
 005BA12A    mov         dl,1
 005BA12C    mov         eax,[005B9D7C];EIdReplyRFCError
 005BA131    call        EIdReplyRFCError.CreateError
 005BA136    call        @RaiseExcept
 005BA13B    xor         eax,eax
 005BA13D    pop         edx
 005BA13E    pop         ecx
 005BA13F    pop         ecx
 005BA140    mov         dword ptr fs:[eax],edx
 005BA143    push        5BA158
 005BA148    lea         eax,[ebp-4]
 005BA14B    call        @UStrClr
 005BA150    ret
>005BA151    jmp         @HandleFinally
>005BA156    jmp         005BA148
 005BA158    pop         ebx
 005BA159    pop         ecx
 005BA15A    pop         ebp
 005BA15B    ret
*}
end;

//005BA15C
function TIdReplyRFC.ReplyExists:Boolean;
begin
{*
 005BA15C    push        ebx
 005BA15D    mov         ebx,eax
 005BA15F    mov         eax,ebx
 005BA161    call        TIdReply.GetNumericCode
 005BA166    test        eax,eax
>005BA168    jg          005BA17A
 005BA16A    mov         eax,dword ptr [ebx+18]
 005BA16D    mov         edx,dword ptr [eax]
 005BA16F    call        dword ptr [edx+14]
 005BA172    test        eax,eax
>005BA174    jg          005BA17A
 005BA176    xor         eax,eax
 005BA178    pop         ebx
 005BA179    ret
 005BA17A    mov         al,1
 005BA17C    pop         ebx
 005BA17D    ret
*}
end;

//005BA180
procedure TIdReplyRFC.SetFormattedReply(const AValue:TStrings);
begin
{*
 005BA180    push        ebp
 005BA181    mov         ebp,esp
 005BA183    xor         ecx,ecx
 005BA185    push        ecx
 005BA186    push        ecx
 005BA187    push        ecx
 005BA188    push        ecx
 005BA189    push        ecx
 005BA18A    push        ecx
 005BA18B    push        ecx
 005BA18C    push        ebx
 005BA18D    push        esi
 005BA18E    push        edi
 005BA18F    mov         dword ptr [ebp-8],edx
 005BA192    mov         esi,eax
 005BA194    xor         eax,eax
 005BA196    push        ebp
 005BA197    push        5BA260
 005BA19C    push        dword ptr fs:[eax]
 005BA19F    mov         dword ptr fs:[eax],esp
 005BA1A2    mov         eax,esi
 005BA1A4    mov         edx,dword ptr [eax]
 005BA1A6    call        dword ptr [edx+30]
 005BA1A9    mov         eax,dword ptr [ebp-8]
 005BA1AC    mov         edx,dword ptr [eax]
 005BA1AE    call        dword ptr [edx+14]
 005BA1B1    test        eax,eax
>005BA1B3    jle         005BA23D
 005BA1B9    lea         eax,[ebp-10]
 005BA1BC    push        eax
 005BA1BD    lea         ecx,[ebp-14]
 005BA1C0    xor         edx,edx
 005BA1C2    mov         eax,dword ptr [ebp-8]
 005BA1C5    mov         ebx,dword ptr [eax]
 005BA1C7    call        dword ptr [ebx+0C]
 005BA1CA    mov         eax,dword ptr [ebp-14]
 005BA1CD    mov         ecx,3
 005BA1D2    mov         edx,1
 005BA1D7    call        @UStrCopy
 005BA1DC    mov         eax,dword ptr [ebp-10]
 005BA1DF    lea         edx,[ebp-4]
 005BA1E2    call        Trim
 005BA1E7    mov         edx,dword ptr [ebp-4]
 005BA1EA    mov         eax,esi
 005BA1EC    call        TIdReply.SetCode
 005BA1F1    mov         eax,dword ptr [ebp-8]
 005BA1F4    mov         edx,dword ptr [eax]
 005BA1F6    call        dword ptr [edx+14]
 005BA1F9    mov         ebx,eax
 005BA1FB    dec         ebx
 005BA1FC    test        ebx,ebx
>005BA1FE    jl          005BA23D
 005BA200    inc         ebx
 005BA201    mov         dword ptr [ebp-0C],0
 005BA208    lea         eax,[ebp-18]
 005BA20B    push        eax
 005BA20C    lea         ecx,[ebp-1C]
 005BA20F    mov         edx,dword ptr [ebp-0C]
 005BA212    mov         eax,dword ptr [ebp-8]
 005BA215    mov         edi,dword ptr [eax]
 005BA217    call        dword ptr [edi+0C]
 005BA21A    mov         eax,dword ptr [ebp-1C]
 005BA21D    mov         ecx,7FFFFFFF
 005BA222    mov         edx,5
 005BA227    call        @UStrCopy
 005BA22C    mov         edx,dword ptr [ebp-18]
 005BA22F    mov         eax,dword ptr [esi+18]
 005BA232    mov         ecx,dword ptr [eax]
 005BA234    call        dword ptr [ecx+38]
 005BA237    inc         dword ptr [ebp-0C]
 005BA23A    dec         ebx
>005BA23B    jne         005BA208
 005BA23D    xor         eax,eax
 005BA23F    pop         edx
 005BA240    pop         ecx
 005BA241    pop         ecx
 005BA242    mov         dword ptr fs:[eax],edx
 005BA245    push        5BA267
 005BA24A    lea         eax,[ebp-1C]
 005BA24D    mov         edx,4
 005BA252    call        @UStrArrayClr
 005BA257    lea         eax,[ebp-4]
 005BA25A    call        @UStrClr
 005BA25F    ret
>005BA260    jmp         @HandleFinally
>005BA265    jmp         005BA24A
 005BA267    pop         edi
 005BA268    pop         esi
 005BA269    pop         ebx
 005BA26A    mov         esp,ebp
 005BA26C    pop         ebp
 005BA26D    ret
*}
end;

//005BA270
constructor EIdReplyRFCError.CreateError(AReplyMessage:string);
begin
{*
 005BA270    push        ebp
 005BA271    mov         ebp,esp
 005BA273    push        ebx
 005BA274    push        esi
 005BA275    push        edi
 005BA276    test        dl,dl
>005BA278    je          005BA282
 005BA27A    add         esp,0FFFFFFF0
 005BA27D    call        @ClassCreate
 005BA282    mov         esi,ecx
 005BA284    mov         ebx,edx
 005BA286    mov         edi,eax
 005BA288    mov         ecx,dword ptr [ebp+8]
 005BA28B    xor         edx,edx
 005BA28D    mov         eax,edi
 005BA28F    call        EIdException.Create
 005BA294    mov         dword ptr [edi+18],esi
 005BA297    mov         eax,edi
 005BA299    test        bl,bl
>005BA29B    je          005BA2AC
 005BA29D    call        @AfterConstruction
 005BA2A2    pop         dword ptr fs:[0]
 005BA2A9    add         esp,0C
 005BA2AC    mov         eax,edi
 005BA2AE    pop         edi
 005BA2AF    pop         esi
 005BA2B0    pop         ebx
 005BA2B1    pop         ebp
 005BA2B2    ret         4
*}
end;

//005BAC00
function TIdTCPConnection.GetIntercept:TIdConnectionIntercept;
begin
{*
 005BAC00    mov         edx,dword ptr [eax+98]
 005BAC06    test        edx,edx
>005BAC08    je          005BAC11
 005BAC0A    mov         eax,dword ptr [edx+0A4]
 005BAC10    ret
 005BAC11    mov         eax,dword ptr [eax+94]
 005BAC17    ret
*}
end;

//005BAC18
constructor TIdReplyRFC.Create;
begin
{*
 005BAC18    mov         eax,[005B9BF0];TIdReplyRFC
 005BAC1D    ret
*}
end;

//005BAC20
procedure TIdTCPConnection.CreateIOHandler(ABaseType:TIdIOHandlerClass);
begin
{*
 005BAC20    push        ebp
 005BAC21    mov         ebp,esp
 005BAC23    push        0
 005BAC25    push        ebx
 005BAC26    push        esi
 005BAC27    mov         esi,edx
 005BAC29    mov         ebx,eax
 005BAC2B    xor         eax,eax
 005BAC2D    push        ebp
 005BAC2E    push        5BACAD
 005BAC33    push        dword ptr fs:[eax]
 005BAC36    mov         dword ptr fs:[eax],esp
 005BAC39    mov         eax,ebx
 005BAC3B    mov         edx,dword ptr [eax]
 005BAC3D    call        dword ptr [edx+68]
 005BAC40    test        al,al
>005BAC42    je          005BAC5E
 005BAC44    lea         edx,[ebp-4]
 005BAC47    mov         eax,[0078D470];^SResString702:TResStringRec
 005BAC4C    call        LoadResString
 005BAC51    mov         edx,dword ptr [ebp-4]
 005BAC54    mov         eax,[005961F8];EIdException
 005BAC59    call        EIdException.Toss
 005BAC5E    test        esi,esi
>005BAC60    je          005BAC7B
 005BAC62    xor         ecx,ecx
 005BAC64    mov         edx,esi
 005BAC66    mov         eax,[005B15E4];TIdIOHandler
 005BAC6B    call        TIdIOHandler.MakeIOHandler
 005BAC70    mov         edx,eax
 005BAC72    mov         eax,ebx
 005BAC74    mov         ecx,dword ptr [eax]
 005BAC76    call        dword ptr [ecx+54]
>005BAC79    jmp         005BAC90
 005BAC7B    xor         edx,edx
 005BAC7D    mov         eax,[005B15E4];TIdIOHandler
 005BAC82    call        TIdIOHandler.MakeDefaultIOHandler
 005BAC87    mov         edx,eax
 005BAC89    mov         eax,ebx
 005BAC8B    mov         ecx,dword ptr [eax]
 005BAC8D    call        dword ptr [ecx+54]
 005BAC90    mov         byte ptr [ebx+0A0],1
 005BAC97    xor         eax,eax
 005BAC99    pop         edx
 005BAC9A    pop         ecx
 005BAC9B    pop         ecx
 005BAC9C    mov         dword ptr fs:[eax],edx
 005BAC9F    push        5BACB4
 005BACA4    lea         eax,[ebp-4]
 005BACA7    call        @UStrClr
 005BACAC    ret
>005BACAD    jmp         @HandleFinally
>005BACB2    jmp         005BACA4
 005BACB4    pop         esi
 005BACB5    pop         ebx
 005BACB6    pop         ecx
 005BACB7    pop         ebp
 005BACB8    ret
*}
end;

//005BACBC
function TIdTCPConnection.Connected:Boolean;
begin
{*
 005BACBC    push        esi
 005BACBD    mov         esi,dword ptr [eax+98]
 005BACC3    test        esi,esi
 005BACC5    setne       dl
 005BACC8    test        dl,dl
>005BACCA    je          005BACD5
 005BACCC    mov         eax,esi
 005BACCE    mov         edx,dword ptr [eax]
 005BACD0    call        dword ptr [edx+74]
 005BACD3    mov         edx,eax
 005BACD5    mov         eax,edx
 005BACD7    pop         esi
 005BACD8    ret
*}
end;

//005BACDC
destructor TIdTCPConnection.Destroy();
begin
{*
 005BACDC    push        ebx
 005BACDD    push        esi
 005BACDE    push        ecx
 005BACDF    call        @BeforeDestruction
 005BACE4    mov         byte ptr [esp],dl
 005BACE7    mov         ebx,eax
 005BACE9    mov         esi,dword ptr [ebx+98]
 005BACEF    test        esi,esi
>005BACF1    je          005BAD06
 005BACF3    mov         eax,esi
 005BACF5    mov         edx,dword ptr [eax]
 005BACF7    call        dword ptr [edx+80]
 005BACFD    xor         edx,edx
 005BACFF    mov         eax,ebx
 005BAD01    mov         ecx,dword ptr [eax]
 005BAD03    call        dword ptr [ecx+54]
 005BAD06    lea         eax,[ebx+9C]
 005BAD0C    mov         edx,dword ptr [eax]
 005BAD0E    xor         ecx,ecx
 005BAD10    mov         dword ptr [eax],ecx
 005BAD12    mov         eax,edx
 005BAD14    call        TObject.Free
 005BAD19    lea         eax,[ebx+90]
 005BAD1F    mov         edx,dword ptr [eax]
 005BAD21    xor         ecx,ecx
 005BAD23    mov         dword ptr [eax],ecx
 005BAD25    mov         eax,edx
 005BAD27    call        TObject.Free
 005BAD2C    movzx       edx,byte ptr [esp]
 005BAD30    and         dl,0FC
 005BAD33    mov         eax,ebx
 005BAD35    call        TIdComponent.Destroy
 005BAD3A    cmp         byte ptr [esp],0
>005BAD3E    jle         005BAD47
 005BAD40    mov         eax,ebx
 005BAD42    call        @ClassDestroy
 005BAD47    pop         edx
 005BAD48    pop         esi
 005BAD49    pop         ebx
 005BAD4A    ret
*}
end;

//005BAD4C
procedure TIdTCPConnection.Disconnect(ANotifyPeer:Boolean);
begin
{*
 005BAD4C    push        ebp
 005BAD4D    mov         ebp,esp
 005BAD4F    push        ecx
 005BAD50    mov         dword ptr [ebp-4],eax
 005BAD53    xor         ecx,ecx
 005BAD55    push        ebp
 005BAD56    push        5BADCA
 005BAD5B    push        dword ptr fs:[ecx]
 005BAD5E    mov         dword ptr fs:[ecx],esp
 005BAD61    test        dl,dl
>005BAD63    je          005BAD79
 005BAD65    mov         eax,dword ptr [ebp-4]
 005BAD68    mov         edx,dword ptr [eax]
 005BAD6A    call        dword ptr [edx+68]
 005BAD6D    test        al,al
>005BAD6F    je          005BAD79
 005BAD71    mov         eax,dword ptr [ebp-4]
 005BAD74    mov         edx,dword ptr [eax]
 005BAD76    call        dword ptr [edx+70]
 005BAD79    xor         eax,eax
 005BAD7B    pop         edx
 005BAD7C    pop         ecx
 005BAD7D    pop         ecx
 005BAD7E    mov         dword ptr fs:[eax],edx
 005BAD81    push        5BADD1
 005BAD86    mov         eax,dword ptr [ebp-4]
 005BAD89    mov         eax,dword ptr [eax+98]
 005BAD8F    test        eax,eax
>005BAD91    je          005BADC9
 005BAD93    cmp         byte ptr [eax+0B4],0
>005BAD9A    je          005BADC9
 005BAD9C    mov         dl,3
 005BAD9E    mov         eax,dword ptr [ebp-4]
 005BADA1    call        TIdComponent.DoStatus
 005BADA6    mov         eax,dword ptr [ebp-4]
 005BADA9    mov         eax,dword ptr [eax+98]
 005BADAF    mov         edx,dword ptr [eax]
 005BADB1    call        dword ptr [edx+80]
 005BADB7    mov         eax,dword ptr [ebp-4]
 005BADBA    mov         edx,dword ptr [eax]
 005BADBC    call        dword ptr [edx+44]
 005BADBF    mov         dl,4
 005BADC1    mov         eax,dword ptr [ebp-4]
 005BADC4    call        TIdComponent.DoStatus
 005BADC9    ret
>005BADCA    jmp         @HandleFinally
>005BADCF    jmp         005BAD86
 005BADD1    pop         ecx
 005BADD2    pop         ebp
 005BADD3    ret
*}
end;

//005BADD4
procedure TIdTCPConnection.DoOnDisconnected;
begin
{*
 005BADD4    push        ebx
 005BADD5    cmp         word ptr [eax+0AA],0
>005BADDD    je          005BADEF
 005BADDF    mov         ebx,eax
 005BADE1    mov         edx,eax
 005BADE3    mov         eax,dword ptr [ebx+0AC]
 005BADE9    call        dword ptr [ebx+0A8]
 005BADEF    pop         ebx
 005BADF0    ret
*}
end;

//005BADF4
procedure TIdTCPConnection.GetResponse(const AAllowedResponses:array[$0..-$1] of System.SmallInt; const _Dv_:$0..-$1; AEncoding:TIdTextEncoding);
begin
{*
 005BADF4    push        ebp
 005BADF5    mov         ebp,esp
 005BADF7    push        ebx
 005BADF8    push        esi
 005BADF9    push        edi
 005BADFA    mov         edi,ecx
 005BADFC    mov         esi,edx
 005BADFE    mov         ebx,eax
 005BAE00    mov         edx,dword ptr [ebp+8]
 005BAE03    mov         eax,ebx
 005BAE05    mov         ecx,dword ptr [eax]
 005BAE07    call        dword ptr [ecx+74]
 005BAE0A    push        edi
 005BAE0B    mov         eax,dword ptr [ebx+9C]
 005BAE11    call        TIdReply.GetNumericCode
 005BAE16    mov         edx,eax
 005BAE18    mov         ecx,esi
 005BAE1A    mov         eax,ebx
 005BAE1C    mov         ebx,dword ptr [eax]
 005BAE1E    call        dword ptr [ebx+60]
 005BAE21    pop         edi
 005BAE22    pop         esi
 005BAE23    pop         ebx
 005BAE24    pop         ebp
 005BAE25    ret         4
*}
end;

//005BAE28
procedure TIdTCPConnection.RaiseExceptionForLastCmdResult(AException:TClassIdException);
begin
{*
 005BAE28    push        ebp
 005BAE29    mov         ebp,esp
 005BAE2B    push        0
 005BAE2D    push        ebx
 005BAE2E    push        esi
 005BAE2F    mov         esi,edx
 005BAE31    mov         ebx,eax
 005BAE33    xor         eax,eax
 005BAE35    push        ebp
 005BAE36    push        5BAE77
 005BAE3B    push        dword ptr fs:[eax]
 005BAE3E    mov         dword ptr fs:[eax],esp
 005BAE41    lea         edx,[ebp-4]
 005BAE44    mov         eax,dword ptr [ebx+9C]
 005BAE4A    mov         eax,dword ptr [eax+18]
 005BAE4D    mov         ecx,dword ptr [eax]
 005BAE4F    call        dword ptr [ecx+1C]
 005BAE52    mov         ecx,dword ptr [ebp-4]
 005BAE55    mov         dl,1
 005BAE57    mov         eax,esi
 005BAE59    call        dword ptr [eax+8]
 005BAE5C    call        @RaiseExcept
 005BAE61    xor         eax,eax
 005BAE63    pop         edx
 005BAE64    pop         ecx
 005BAE65    pop         ecx
 005BAE66    mov         dword ptr fs:[eax],edx
 005BAE69    push        5BAE7E
 005BAE6E    lea         eax,[ebp-4]
 005BAE71    call        @UStrClr
 005BAE76    ret
>005BAE77    jmp         @HandleFinally
>005BAE7C    jmp         005BAE6E
 005BAE7E    pop         esi
 005BAE7F    pop         ebx
 005BAE80    pop         ecx
 005BAE81    pop         ebp
 005BAE82    ret
*}
end;

//005BAE84
procedure TIdTCPConnection.RaiseExceptionForLastCmdResult;
begin
{*
 005BAE84    mov         eax,dword ptr [eax+9C]
 005BAE8A    mov         edx,dword ptr [eax]
 005BAE8C    call        dword ptr [edx+3C]
 005BAE8F    ret
*}
end;

//005BAE90
procedure TIdTCPConnection.SendCmd(AOut:UnicodeString; const AResponse:array[$0..-$1] of System.SmallInt; const _Dv_:$0..-$1; AEncoding:TIdTextEncoding);
begin
{*
 005BAE90    push        ebp
 005BAE91    mov         ebp,esp
 005BAE93    add         esp,0FFFFFFF8
 005BAE96    push        ebx
 005BAE97    push        esi
 005BAE98    push        edi
 005BAE99    mov         dword ptr [ebp-8],ecx
 005BAE9C    mov         dword ptr [ebp-4],edx
 005BAE9F    mov         ebx,eax
 005BAEA1    mov         esi,dword ptr [ebp+8]
 005BAEA4    mov         eax,dword ptr [ebp-4]
 005BAEA7    call        @UStrAddRef
 005BAEAC    xor         eax,eax
 005BAEAE    push        ebp
 005BAEAF    push        5BAF04
 005BAEB4    push        dword ptr fs:[eax]
 005BAEB7    mov         dword ptr fs:[eax],esp
 005BAEBA    mov         eax,ebx
 005BAEBC    call        TIdTCPConnection.CheckConnected
 005BAEC1    lea         edx,[ebp-4]
 005BAEC4    mov         eax,ebx
 005BAEC6    mov         ecx,dword ptr [eax]
 005BAEC8    call        dword ptr [ecx+58]
 005BAECB    mov         ecx,esi
 005BAECD    mov         edx,dword ptr [ebp-4]
 005BAED0    mov         eax,dword ptr [ebx+98]
 005BAED6    mov         edi,dword ptr [eax]
 005BAED8    call        dword ptr [edi+98]
 005BAEDE    push        esi
 005BAEDF    mov         edx,dword ptr [ebp-8]
 005BAEE2    mov         ecx,dword ptr [ebp+0C]
 005BAEE5    mov         eax,ebx
 005BAEE7    mov         ebx,dword ptr [eax]
 005BAEE9    call        dword ptr [ebx+78]
 005BAEEC    mov         ebx,eax
 005BAEEE    xor         eax,eax
 005BAEF0    pop         edx
 005BAEF1    pop         ecx
 005BAEF2    pop         ecx
 005BAEF3    mov         dword ptr fs:[eax],edx
 005BAEF6    push        5BAF0B
 005BAEFB    lea         eax,[ebp-4]
 005BAEFE    call        @UStrClr
 005BAF03    ret
>005BAF04    jmp         @HandleFinally
>005BAF09    jmp         005BAEFB
 005BAF0B    mov         eax,ebx
 005BAF0D    pop         edi
 005BAF0E    pop         esi
 005BAF0F    pop         ebx
 005BAF10    pop         ecx
 005BAF11    pop         ecx
 005BAF12    pop         ebp
 005BAF13    ret         8
*}
end;

//005BAF18
procedure TIdTCPConnection.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 005BAF18    push        ebx
 005BAF19    push        esi
 005BAF1A    push        edi
 005BAF1B    mov         ebx,ecx
 005BAF1D    mov         esi,edx
 005BAF1F    mov         edi,eax
 005BAF21    mov         ecx,ebx
 005BAF23    mov         edx,esi
 005BAF25    mov         eax,edi
 005BAF27    call        TComponent.Notification
 005BAF2C    cmp         bl,1
>005BAF2F    jne         005BAF59
 005BAF31    cmp         esi,dword ptr [edi+94]
>005BAF37    jne         005BAF41
 005BAF39    xor         eax,eax
 005BAF3B    mov         dword ptr [edi+94],eax
 005BAF41    cmp         esi,dword ptr [edi+98]
>005BAF47    jne         005BAF59
 005BAF49    xor         eax,eax
 005BAF4B    mov         dword ptr [edi+98],eax
 005BAF51    xor         eax,eax
 005BAF53    mov         dword ptr [edi+0B0],eax
 005BAF59    pop         edi
 005BAF5A    pop         esi
 005BAF5B    pop         ebx
 005BAF5C    ret
*}
end;

//005BAF60
procedure TIdTCPConnection.SetIntercept(AValue:TIdConnectionIntercept);
begin
{*
 005BAF60    push        ebp
 005BAF61    mov         ebp,esp
 005BAF63    push        0
 005BAF65    push        ebx
 005BAF66    push        esi
 005BAF67    mov         esi,edx
 005BAF69    mov         ebx,eax
 005BAF6B    xor         eax,eax
 005BAF6D    push        ebp
 005BAF6E    push        5BB007
 005BAF73    push        dword ptr fs:[eax]
 005BAF76    mov         dword ptr fs:[eax],esp
 005BAF79    cmp         esi,dword ptr [ebx+94]
>005BAF7F    je          005BAFF1
 005BAF81    cmp         dword ptr [ebx+98],0
>005BAF88    je          005BAFBC
 005BAF8A    test        esi,esi
>005BAF8C    je          005BAFBC
 005BAF8E    mov         eax,dword ptr [ebx+98]
 005BAF94    mov         eax,dword ptr [eax+0A4]
 005BAF9A    test        eax,eax
>005BAF9C    je          005BAFBC
 005BAF9E    cmp         esi,eax
>005BAFA0    je          005BAFBC
 005BAFA2    lea         edx,[ebp-4]
 005BAFA5    mov         eax,[0078DB48];^SResString697:TResStringRec
 005BAFAA    call        LoadResString
 005BAFAF    mov         edx,dword ptr [ebp-4]
 005BAFB2    mov         eax,[005961F8];EIdException
 005BAFB7    call        EIdException.Toss
 005BAFBC    mov         eax,dword ptr [ebx+94]
 005BAFC2    test        eax,eax
>005BAFC4    je          005BAFCD
 005BAFC6    mov         edx,ebx
 005BAFC8    call        TComponent.RemoveFreeNotification
 005BAFCD    mov         eax,esi
 005BAFCF    mov         dword ptr [ebx+94],eax
 005BAFD5    test        eax,eax
>005BAFD7    je          005BAFE0
 005BAFD9    mov         edx,ebx
 005BAFDB    call        TComponent.FreeNotification
 005BAFE0    mov         eax,dword ptr [ebx+98]
 005BAFE6    test        eax,eax
>005BAFE8    je          005BAFF1
 005BAFEA    mov         edx,esi
 005BAFEC    mov         ecx,dword ptr [eax]
 005BAFEE    call        dword ptr [ecx+58]
 005BAFF1    xor         eax,eax
 005BAFF3    pop         edx
 005BAFF4    pop         ecx
 005BAFF5    pop         ecx
 005BAFF6    mov         dword ptr fs:[eax],edx
 005BAFF9    push        5BB00E
 005BAFFE    lea         eax,[ebp-4]
 005BB001    call        @UStrClr
 005BB006    ret
>005BB007    jmp         @HandleFinally
>005BB00C    jmp         005BAFFE
 005BB00E    pop         esi
 005BB00F    pop         ebx
 005BB010    pop         ecx
 005BB011    pop         ebp
 005BB012    ret
*}
end;

//005BB014
procedure TIdTCPConnection.SetIOHandler(AValue:TIdIOHandler);
begin
{*
 005BB014    push        ebp
 005BB015    mov         ebp,esp
 005BB017    push        0
 005BB019    push        ebx
 005BB01A    push        esi
 005BB01B    mov         esi,edx
 005BB01D    mov         ebx,eax
 005BB01F    xor         eax,eax
 005BB021    push        ebp
 005BB022    push        5BB118
 005BB027    push        dword ptr fs:[eax]
 005BB02A    mov         dword ptr fs:[eax],esp
 005BB02D    cmp         esi,dword ptr [ebx+98]
>005BB033    je          005BB102
 005BB039    test        esi,esi
>005BB03B    je          005BB072
 005BB03D    cmp         dword ptr [ebx+94],0
>005BB044    je          005BB072
 005BB046    mov         eax,dword ptr [esi+0A4]
 005BB04C    test        eax,eax
>005BB04E    je          005BB072
 005BB050    cmp         eax,dword ptr [ebx+94]
>005BB056    je          005BB072
 005BB058    lea         edx,[ebp-4]
 005BB05B    mov         eax,[0078DB48];^SResString697:TResStringRec
 005BB060    call        LoadResString
 005BB065    mov         edx,dword ptr [ebp-4]
 005BB068    mov         eax,[005961F8];EIdException
 005BB06D    call        EIdException.Toss
 005BB072    cmp         byte ptr [ebx+0A0],0
>005BB079    je          005BB097
 005BB07B    cmp         dword ptr [ebx+98],0
>005BB082    je          005BB097
 005BB084    lea         eax,[ebx+98]
 005BB08A    mov         edx,dword ptr [eax]
 005BB08C    xor         ecx,ecx
 005BB08E    mov         dword ptr [eax],ecx
 005BB090    mov         eax,edx
 005BB092    call        TObject.Free
 005BB097    xor         eax,eax
 005BB099    mov         dword ptr [ebx+0B0],eax
 005BB09F    mov         byte ptr [ebx+0A0],0
 005BB0A6    mov         eax,dword ptr [ebx+98]
 005BB0AC    test        eax,eax
>005BB0AE    je          005BB0BF
 005BB0B0    xor         edx,edx
 005BB0B2    mov         dword ptr [eax+88],edx
 005BB0B8    mov         edx,ebx
 005BB0BA    call        TComponent.RemoveFreeNotification
 005BB0BF    test        esi,esi
>005BB0C1    je          005BB0FC
 005BB0C3    mov         edx,ebx
 005BB0C5    mov         eax,esi
 005BB0C7    call        TComponent.FreeNotification
 005BB0CC    mov         dword ptr [esi+88],ebx
 005BB0D2    mov         eax,dword ptr [ebx+94]
 005BB0D8    test        eax,eax
>005BB0DA    je          005BB0E5
 005BB0DC    mov         edx,eax
 005BB0DE    mov         eax,esi
 005BB0E0    mov         ecx,dword ptr [eax]
 005BB0E2    call        dword ptr [ecx+58]
 005BB0E5    mov         eax,esi
 005BB0E7    mov         edx,dword ptr ds:[5B6E90];TIdIOHandlerSocket
 005BB0ED    call        @IsClass
 005BB0F2    test        al,al
>005BB0F4    je          005BB0FC
 005BB0F6    mov         dword ptr [ebx+0B0],esi
 005BB0FC    mov         dword ptr [ebx+98],esi
 005BB102    xor         eax,eax
 005BB104    pop         edx
 005BB105    pop         ecx
 005BB106    pop         ecx
 005BB107    mov         dword ptr fs:[eax],edx
 005BB10A    push        5BB11F
 005BB10F    lea         eax,[ebp-4]
 005BB112    call        @UStrClr
 005BB117    ret
>005BB118    jmp         @HandleFinally
>005BB11D    jmp         005BB10F
 005BB11F    pop         esi
 005BB120    pop         ebx
 005BB121    pop         ecx
 005BB122    pop         ebp
 005BB123    ret
*}
end;

//005BB124
procedure TIdTCPConnection.WriteHeader(AHeader:TStrings);
begin
{*
 005BB124    push        ebp
 005BB125    mov         ebp,esp
 005BB127    add         esp,0FFFFFFEC
 005BB12A    push        ebx
 005BB12B    push        esi
 005BB12C    push        edi
 005BB12D    xor         ecx,ecx
 005BB12F    mov         dword ptr [ebp-10],ecx
 005BB132    mov         dword ptr [ebp-14],ecx
 005BB135    mov         dword ptr [ebp-4],edx
 005BB138    mov         ebx,eax
 005BB13A    xor         eax,eax
 005BB13C    push        ebp
 005BB13D    push        5BB22A
 005BB142    push        dword ptr fs:[eax]
 005BB145    mov         dword ptr fs:[eax],esp
 005BB148    mov         eax,ebx
 005BB14A    call        TIdTCPConnection.CheckConnected
 005BB14F    mov         eax,dword ptr [ebx+98]
 005BB155    mov         dword ptr [ebp-0C],eax
 005BB158    mov         eax,dword ptr [ebp-0C]
 005BB15B    call        TIdIOHandler.WriteBufferingActive
 005BB160    xor         al,1
 005BB162    mov         byte ptr [ebp-5],al
 005BB165    cmp         byte ptr [ebp-5],0
>005BB169    je          005BB173
 005BB16B    mov         eax,dword ptr [ebp-0C]
 005BB16E    call        TIdIOHandler.WriteBufferOpen
 005BB173    xor         eax,eax
 005BB175    push        ebp
 005BB176    push        5BB1EF
 005BB17B    push        dword ptr fs:[eax]
 005BB17E    mov         dword ptr fs:[eax],esp
 005BB181    mov         eax,dword ptr [ebp-4]
 005BB184    mov         edx,dword ptr [eax]
 005BB186    call        dword ptr [edx+14]
 005BB189    mov         ebx,eax
 005BB18B    dec         ebx
 005BB18C    test        ebx,ebx
>005BB18E    jl          005BB1CA
 005BB190    inc         ebx
 005BB191    xor         esi,esi
 005BB193    lea         eax,[ebp-10]
 005BB196    push        eax
 005BB197    lea         ecx,[ebp-14]
 005BB19A    mov         edx,esi
 005BB19C    mov         eax,dword ptr [ebp-4]
 005BB19F    mov         edi,dword ptr [eax]
 005BB1A1    call        dword ptr [edi+0C]
 005BB1A4    mov         eax,dword ptr [ebp-14]
 005BB1A7    mov         ecx,5BB244;': '
 005BB1AC    mov         edx,5BB258;'='
 005BB1B1    call        ReplaceOnlyFirst
 005BB1B6    mov         edx,dword ptr [ebp-10]
 005BB1B9    xor         ecx,ecx
 005BB1BB    mov         eax,dword ptr [ebp-0C]
 005BB1BE    mov         edi,dword ptr [eax]
 005BB1C0    call        dword ptr [edi+98]
 005BB1C6    inc         esi
 005BB1C7    dec         ebx
>005BB1C8    jne         005BB193
 005BB1CA    xor         edx,edx
 005BB1CC    mov         eax,dword ptr [ebp-0C]
 005BB1CF    call        TIdIOHandler.WriteLn
 005BB1D4    cmp         byte ptr [ebp-5],0
>005BB1D8    je          005BB1E5
 005BB1DA    mov         eax,dword ptr [ebp-0C]
 005BB1DD    mov         edx,dword ptr [eax]
 005BB1DF    call        dword ptr [edx+0CC]
 005BB1E5    xor         eax,eax
 005BB1E7    pop         edx
 005BB1E8    pop         ecx
 005BB1E9    pop         ecx
 005BB1EA    mov         dword ptr fs:[eax],edx
>005BB1ED    jmp         005BB20F
>005BB1EF    jmp         @HandleAnyException
 005BB1F4    cmp         byte ptr [ebp-5],0
>005BB1F8    je          005BB205
 005BB1FA    mov         eax,dword ptr [ebp-0C]
 005BB1FD    mov         edx,dword ptr [eax]
 005BB1FF    call        dword ptr [edx+0C4]
 005BB205    call        @RaiseAgain
 005BB20A    call        @DoneExcept
 005BB20F    xor         eax,eax
 005BB211    pop         edx
 005BB212    pop         ecx
 005BB213    pop         ecx
 005BB214    mov         dword ptr fs:[eax],edx
 005BB217    push        5BB231
 005BB21C    lea         eax,[ebp-14]
 005BB21F    mov         edx,2
 005BB224    call        @UStrArrayClr
 005BB229    ret
>005BB22A    jmp         @HandleFinally
>005BB22F    jmp         005BB21C
 005BB231    pop         edi
 005BB232    pop         esi
 005BB233    pop         ebx
 005BB234    mov         esp,ebp
 005BB236    pop         ebp
 005BB237    ret
*}
end;

//005BB25C
function TIdTCPConnection.SendCmd(AOut:string; AResponse:SmallInt; AEncoding:TEncoding):SmallInt;
begin
{*
 005BB25C    push        ebp
 005BB25D    mov         ebp,esp
 005BB25F    add         esp,0FFFFFFF8
 005BB262    push        ebx
 005BB263    push        esi
 005BB264    push        edi
 005BB265    mov         esi,ecx
 005BB267    mov         dword ptr [ebp-4],edx
 005BB26A    mov         ebx,eax
 005BB26C    mov         edi,dword ptr [ebp+8]
 005BB26F    mov         eax,dword ptr [ebp-4]
 005BB272    call        @UStrAddRef
 005BB277    xor         eax,eax
 005BB279    push        ebp
 005BB27A    push        5BB2D0
 005BB27F    push        dword ptr fs:[eax]
 005BB282    mov         dword ptr fs:[eax],esp
 005BB285    test        si,si
>005BB288    jge         005BB2A1
 005BB28A    push        0FF
 005BB28C    push        edi
 005BB28D    lea         ecx,[ebp-4]
 005BB290    mov         edx,dword ptr [ebp-4]
 005BB293    mov         eax,ebx
 005BB295    mov         ebx,dword ptr [eax]
 005BB297    call        dword ptr [ebx+88]
 005BB29D    mov         ebx,eax
>005BB29F    jmp         005BB2BA
 005BB2A1    push        0
 005BB2A3    push        edi
 005BB2A4    mov         word ptr [ebp-8],si
 005BB2A8    lea         ecx,[ebp-8]
 005BB2AB    mov         edx,dword ptr [ebp-4]
 005BB2AE    mov         eax,ebx
 005BB2B0    mov         ebx,dword ptr [eax]
 005BB2B2    call        dword ptr [ebx+88]
 005BB2B8    mov         ebx,eax
 005BB2BA    xor         eax,eax
 005BB2BC    pop         edx
 005BB2BD    pop         ecx
 005BB2BE    pop         ecx
 005BB2BF    mov         dword ptr fs:[eax],edx
 005BB2C2    push        5BB2D7
 005BB2C7    lea         eax,[ebp-4]
 005BB2CA    call        @UStrClr
 005BB2CF    ret
>005BB2D0    jmp         @HandleFinally
>005BB2D5    jmp         005BB2C7
 005BB2D7    mov         eax,ebx
 005BB2D9    pop         edi
 005BB2DA    pop         esi
 005BB2DB    pop         ebx
 005BB2DC    pop         ecx
 005BB2DD    pop         ecx
 005BB2DE    pop         ebp
 005BB2DF    ret         4
*}
end;

//005BB2E4
procedure TIdTCPConnection.CheckForGracefulDisconnect(ARaiseExceptionIfDisconnected:Boolean);
begin
{*
 005BB2E4    push        ebp
 005BB2E5    mov         ebp,esp
 005BB2E7    push        0
 005BB2E9    push        ebx
 005BB2EA    push        esi
 005BB2EB    push        edi
 005BB2EC    mov         esi,eax
 005BB2EE    xor         eax,eax
 005BB2F0    push        ebp
 005BB2F1    push        5BB34C
 005BB2F6    push        dword ptr fs:[eax]
 005BB2F9    mov         dword ptr fs:[eax],esp
 005BB2FC    mov         edi,dword ptr [esi+98]
 005BB302    test        edi,edi
>005BB304    je          005BB311
 005BB306    xor         ecx,ecx
 005BB308    mov         eax,edi
 005BB30A    mov         ebx,dword ptr [eax]
 005BB30C    call        dword ptr [ebx+78]
>005BB30F    jmp         005BB336
 005BB311    test        dl,dl
>005BB313    je          005BB336
 005BB315    lea         edx,[ebp-4]
 005BB318    mov         eax,[0078D0C4];^SResString685:TResStringRec
 005BB31D    call        LoadResString
 005BB322    mov         ecx,dword ptr [ebp-4]
 005BB325    mov         dl,1
 005BB327    mov         eax,[005961F8];EIdException
 005BB32C    call        EIdException.Create
 005BB331    call        @RaiseExcept
 005BB336    xor         eax,eax
 005BB338    pop         edx
 005BB339    pop         ecx
 005BB33A    pop         ecx
 005BB33B    mov         dword ptr fs:[eax],edx
 005BB33E    push        5BB353
 005BB343    lea         eax,[ebp-4]
 005BB346    call        @UStrClr
 005BB34B    ret
>005BB34C    jmp         @HandleFinally
>005BB351    jmp         005BB343
 005BB353    pop         edi
 005BB354    pop         esi
 005BB355    pop         ebx
 005BB356    pop         ecx
 005BB357    pop         ebp
 005BB358    ret
*}
end;

//005BB35C
procedure TIdTCPConnection.CheckResponse(const AResponse:SmallInt; const AAllowedResponses:array[$0..-$1] of System.SmallInt; const _Dv_:$0..-$1);
begin
{*
 005BB35C    push        ebp
 005BB35D    mov         ebp,esp
 005BB35F    add         esp,0FFFFFFF8
 005BB362    push        esi
 005BB363    push        edi
 005BB364    mov         dword ptr [ebp-8],ecx
 005BB367    mov         edi,edx
 005BB369    mov         dword ptr [ebp-4],eax
 005BB36C    mov         edx,dword ptr [ebp+8]
 005BB36F    mov         ecx,edx
 005BB371    cmp         ecx,0FFFFFFFF
>005BB374    jle         005BB3A0
 005BB376    xor         eax,eax
 005BB378    mov         esi,ecx
 005BB37A    test        esi,esi
>005BB37C    jl          005BB391
 005BB37E    inc         esi
 005BB37F    mov         edx,dword ptr [ebp-8]
 005BB382    cmp         di,word ptr [edx]
>005BB385    jne         005BB38B
 005BB387    mov         al,1
>005BB389    jmp         005BB391
 005BB38B    add         edx,2
 005BB38E    dec         esi
>005BB38F    jne         005BB382
 005BB391    test        al,al
>005BB393    jne         005BB3A0
 005BB395    mov         eax,dword ptr [ebp-4]
 005BB398    mov         edx,dword ptr [eax]
 005BB39A    call        dword ptr [edx+80]
 005BB3A0    mov         eax,edi
 005BB3A2    pop         edi
 005BB3A3    pop         esi
 005BB3A4    pop         ecx
 005BB3A5    pop         ecx
 005BB3A6    pop         ebp
 005BB3A7    ret         4
*}
end;

//005BB3AC
procedure TIdTCPConnection.GetInternalResponse(AEncoding:TEncoding);
begin
{*
 005BB3AC    push        ebp
 005BB3AD    mov         ebp,esp
 005BB3AF    add         esp,0FFFFFFF8
 005BB3B2    push        ebx
 005BB3B3    push        esi
 005BB3B4    push        edi
 005BB3B5    xor         ecx,ecx
 005BB3B7    mov         dword ptr [ebp-4],ecx
 005BB3BA    mov         esi,edx
 005BB3BC    mov         ebx,eax
 005BB3BE    xor         eax,eax
 005BB3C0    push        ebp
 005BB3C1    push        5BB46C
 005BB3C6    push        dword ptr fs:[eax]
 005BB3C9    mov         dword ptr fs:[eax],esp
 005BB3CC    mov         eax,ebx
 005BB3CE    call        TIdTCPConnection.CheckConnected
 005BB3D3    mov         dl,1
 005BB3D5    mov         eax,[0043C7BC];TStringList
 005BB3DA    call        TStringList.Create
 005BB3DF    mov         dword ptr [ebp-8],eax
 005BB3E2    xor         edx,edx
 005BB3E4    push        ebp
 005BB3E5    push        5BB44F
 005BB3EA    push        dword ptr fs:[edx]
 005BB3ED    mov         dword ptr fs:[edx],esp
 005BB3F0    lea         eax,[ebp-4]
 005BB3F3    push        eax
 005BB3F4    mov         eax,dword ptr [ebx+98]
 005BB3FA    mov         ecx,esi
 005BB3FC    mov         edx,7FFFFFFF
 005BB401    mov         edi,dword ptr [eax]
 005BB403    call        dword ptr [edi+0BC]
 005BB409    mov         edx,dword ptr [ebp-4]
 005BB40C    mov         eax,dword ptr [ebp-8]
 005BB40F    mov         ecx,dword ptr [eax]
 005BB411    call        dword ptr [ecx+38]
 005BB414    mov         eax,dword ptr [ebx+9C]
 005BB41A    mov         eax,dword ptr [eax]
 005BB41C    mov         edx,dword ptr [ebp-4]
 005BB41F    call        dword ptr [eax+38]
 005BB422    test        al,al
>005BB424    je          005BB3F0
 005BB426    mov         eax,dword ptr [ebx+9C]
 005BB42C    mov         edx,dword ptr [ebp-8]
 005BB42F    mov         ecx,dword ptr [eax]
 005BB431    call        dword ptr [ecx+2C]
 005BB434    xor         eax,eax
 005BB436    pop         edx
 005BB437    pop         ecx
 005BB438    pop         ecx
 005BB439    mov         dword ptr fs:[eax],edx
 005BB43C    push        5BB456
 005BB441    mov         eax,dword ptr [ebp-8]
 005BB444    xor         edx,edx
 005BB446    mov         dword ptr [ebp-8],edx
 005BB449    call        TObject.Free
 005BB44E    ret
>005BB44F    jmp         @HandleFinally
>005BB454    jmp         005BB441
 005BB456    xor         eax,eax
 005BB458    pop         edx
 005BB459    pop         ecx
 005BB45A    pop         ecx
 005BB45B    mov         dword ptr fs:[eax],edx
 005BB45E    push        5BB473
 005BB463    lea         eax,[ebp-4]
 005BB466    call        @UStrClr
 005BB46B    ret
>005BB46C    jmp         @HandleFinally
>005BB471    jmp         005BB463
 005BB473    pop         edi
 005BB474    pop         esi
 005BB475    pop         ebx
 005BB476    pop         ecx
 005BB477    pop         ecx
 005BB478    pop         ebp
 005BB479    ret
*}
end;

//005BB47C
procedure TIdTCPConnection.WriteRFCStrings(AStrings:TStrings);
begin
{*
 005BB47C    push        ebx
 005BB47D    push        esi
 005BB47E    mov         esi,edx
 005BB480    mov         ebx,eax
 005BB482    mov         eax,ebx
 005BB484    call        TIdTCPConnection.CheckConnected
 005BB489    push        0
 005BB48B    mov         cl,1
 005BB48D    mov         edx,esi
 005BB48F    mov         eax,dword ptr [ebx+98]
 005BB495    call        TIdIOHandler.WriteRFCStrings
 005BB49A    pop         esi
 005BB49B    pop         ebx
 005BB49C    ret
*}
end;

//005BB4A0
function TIdTCPConnection.GetResponse(AAllowedResponse:SmallInt; AEncoding:TEncoding):SmallInt;
begin
{*
 005BB4A0    push        ebx
 005BB4A1    push        esi
 005BB4A2    push        ecx
 005BB4A3    mov         esi,eax
 005BB4A5    test        dx,dx
>005BB4A8    jge         005BB4BB
 005BB4AA    push        ecx
 005BB4AB    lea         edx,[esp+4]
 005BB4AF    mov         eax,esi
 005BB4B1    or          ecx,0FFFFFFFF
 005BB4B4    mov         ebx,dword ptr [eax]
 005BB4B6    call        dword ptr [ebx+78]
>005BB4B9    jmp         005BB4D0
 005BB4BB    push        ecx
 005BB4BC    mov         word ptr [esp+4],dx
 005BB4C1    lea         eax,[esp+4]
 005BB4C5    mov         edx,eax
 005BB4C7    mov         eax,esi
 005BB4C9    xor         ecx,ecx
 005BB4CB    mov         ebx,dword ptr [eax]
 005BB4CD    call        dword ptr [ebx+78]
 005BB4D0    pop         edx
 005BB4D1    pop         esi
 005BB4D2    pop         ebx
 005BB4D3    ret
*}
end;

//005BB4D4
function TIdTCPConnection.GetResponse(AAllowedResponse:string; AEncoding:TEncoding):string;
begin
{*
 005BB4D4    push        ebp
 005BB4D5    mov         ebp,esp
 005BB4D7    push        ecx
 005BB4D8    push        ebx
 005BB4D9    push        esi
 005BB4DA    mov         dword ptr [ebp-4],ecx
 005BB4DD    mov         ebx,edx
 005BB4DF    mov         esi,eax
 005BB4E1    mov         edx,dword ptr [ebp-4]
 005BB4E4    mov         eax,esi
 005BB4E6    mov         ecx,dword ptr [eax]
 005BB4E8    call        dword ptr [ecx+74]
 005BB4EB    mov         eax,dword ptr [ebp+8]
 005BB4EE    push        eax
 005BB4EF    mov         eax,dword ptr [esi+9C]
 005BB4F5    mov         edx,dword ptr [eax+0C]
 005BB4F8    mov         ecx,ebx
 005BB4FA    mov         eax,esi
 005BB4FC    mov         ebx,dword ptr [eax]
 005BB4FE    call        dword ptr [ebx+64]
 005BB501    pop         esi
 005BB502    pop         ebx
 005BB503    pop         ecx
 005BB504    pop         ebp
 005BB505    ret         4
*}
end;

//005BB508
function TIdTCPConnection.SendCmd(AOut:string; AResponse:string; AEncoding:TEncoding):string;
begin
{*
 005BB508    push        ebp
 005BB509    mov         ebp,esp
 005BB50B    add         esp,0FFFFFFF8
 005BB50E    push        ebx
 005BB50F    push        esi
 005BB510    push        edi
 005BB511    mov         dword ptr [ebp-8],ecx
 005BB514    mov         dword ptr [ebp-4],edx
 005BB517    mov         ebx,eax
 005BB519    mov         esi,dword ptr [ebp+0C]
 005BB51C    mov         eax,dword ptr [ebp-4]
 005BB51F    call        @UStrAddRef
 005BB524    xor         eax,eax
 005BB526    push        ebp
 005BB527    push        5BB57C
 005BB52C    push        dword ptr fs:[eax]
 005BB52F    mov         dword ptr fs:[eax],esp
 005BB532    mov         eax,ebx
 005BB534    call        TIdTCPConnection.CheckConnected
 005BB539    lea         edx,[ebp-4]
 005BB53C    mov         eax,ebx
 005BB53E    mov         ecx,dword ptr [eax]
 005BB540    call        dword ptr [ecx+58]
 005BB543    mov         ecx,esi
 005BB545    mov         edx,dword ptr [ebp-4]
 005BB548    mov         eax,dword ptr [ebx+98]
 005BB54E    mov         edi,dword ptr [eax]
 005BB550    call        dword ptr [edi+98]
 005BB556    mov         eax,dword ptr [ebp+8]
 005BB559    push        eax
 005BB55A    mov         ecx,esi
 005BB55C    mov         edx,dword ptr [ebp-8]
 005BB55F    mov         eax,ebx
 005BB561    mov         ebx,dword ptr [eax]
 005BB563    call        dword ptr [ebx+7C]
 005BB566    xor         eax,eax
 005BB568    pop         edx
 005BB569    pop         ecx
 005BB56A    pop         ecx
 005BB56B    mov         dword ptr fs:[eax],edx
 005BB56E    push        5BB583
 005BB573    lea         eax,[ebp-4]
 005BB576    call        @UStrClr
 005BB57B    ret
>005BB57C    jmp         @HandleFinally
>005BB581    jmp         005BB573
 005BB583    pop         edi
 005BB584    pop         esi
 005BB585    pop         ebx
 005BB586    pop         ecx
 005BB587    pop         ecx
 005BB588    pop         ebp
 005BB589    ret         8
*}
end;

//005BB58C
function TIdTCPConnection.CheckResponse(AResponse:string; AAllowedResponse:string):string;
begin
{*
 005BB58C    push        ebp
 005BB58D    mov         ebp,esp
 005BB58F    push        ebx
 005BB590    push        esi
 005BB591    push        edi
 005BB592    mov         esi,ecx
 005BB594    mov         ebx,edx
 005BB596    mov         edi,eax
 005BB598    test        esi,esi
>005BB59A    je          005BB5B3
 005BB59C    mov         edx,esi
 005BB59E    mov         eax,ebx
 005BB5A0    call        TextIsSame
 005BB5A5    test        al,al
>005BB5A7    jne         005BB5B3
 005BB5A9    mov         eax,edi
 005BB5AB    mov         edx,dword ptr [eax]
 005BB5AD    call        dword ptr [edx+80]
 005BB5B3    mov         eax,dword ptr [ebp+8]
 005BB5B6    mov         edx,ebx
 005BB5B8    call        @UStrAsg
 005BB5BD    pop         edi
 005BB5BE    pop         esi
 005BB5BF    pop         ebx
 005BB5C0    pop         ebp
 005BB5C1    ret         4
*}
end;

//005BB5C4
procedure TIdTCPConnection.InitComponent;
begin
{*
 005BB5C4    push        ebx
 005BB5C5    push        esi
 005BB5C6    mov         ebx,eax
 005BB5C8    mov         eax,ebx
 005BB5CA    call        TIdComponent.InitComponent
 005BB5CF    mov         eax,ebx
 005BB5D1    mov         edx,dword ptr [eax]
 005BB5D3    call        dword ptr [edx+4C]
 005BB5D6    mov         esi,eax
 005BB5D8    mov         dword ptr [ebx+0B4],esi
 005BB5DE    push        0
 005BB5E0    xor         ecx,ecx
 005BB5E2    mov         dl,1
 005BB5E4    mov         eax,esi
 005BB5E6    call        dword ptr [eax+34]
 005BB5E9    mov         dword ptr [ebx+90],eax
 005BB5EF    push        0
 005BB5F1    xor         ecx,ecx
 005BB5F3    mov         dl,1
 005BB5F5    mov         eax,dword ptr [ebx+0B4]
 005BB5FB    call        dword ptr [eax+34]
 005BB5FE    mov         dword ptr [ebx+9C],eax
 005BB604    pop         esi
 005BB605    pop         ebx
 005BB606    ret
*}
end;

//005BB608
procedure TIdTCPConnection.CheckConnected;
begin
{*
 005BB608    push        ebp
 005BB609    mov         ebp,esp
 005BB60B    push        0
 005BB60D    xor         edx,edx
 005BB60F    push        ebp
 005BB610    push        5BB654
 005BB615    push        dword ptr fs:[edx]
 005BB618    mov         dword ptr fs:[edx],esp
 005BB61B    cmp         dword ptr [eax+98],0
>005BB622    jne         005BB63E
 005BB624    lea         edx,[ebp-4]
 005BB627    mov         eax,[0078D0C4];^SResString685:TResStringRec
 005BB62C    call        LoadResString
 005BB631    mov         edx,dword ptr [ebp-4]
 005BB634    mov         eax,[005AFD38];EIdNotConnected
 005BB639    call        EIdException.Toss
 005BB63E    xor         eax,eax
 005BB640    pop         edx
 005BB641    pop         ecx
 005BB642    pop         ecx
 005BB643    mov         dword ptr fs:[eax],edx
 005BB646    push        5BB65B
 005BB64B    lea         eax,[ebp-4]
 005BB64E    call        @UStrClr
 005BB653    ret
>005BB654    jmp         @HandleFinally
>005BB659    jmp         005BB64B
 005BB65B    pop         ecx
 005BB65C    pop         ebp
 005BB65D    ret
*}
end;

//005BB660
procedure TIdTCPConnection.SetGreeting(AValue:TIdReply);
begin
{*
 005BB660    mov         eax,dword ptr [eax+90]
 005BB666    mov         ecx,dword ptr [eax]
 005BB668    call        dword ptr [ecx+8]
 005BB66B    ret
*}
end;

//005BB66C
procedure TIdTCPConnection.Disconnect;
begin
{*
 005BB66C    mov         dl,1
 005BB66E    mov         ecx,dword ptr [eax]
 005BB670    call        dword ptr [ecx+6C]
 005BB673    ret
*}
end;

//005BB674
procedure TIdTCPConnection.DisconnectNotifyPeer;
begin
{*
 005BB674    ret
*}
end;

//005BB678
procedure sub_005BB678;
begin
{*
 005BB678    ret
*}
end;

//005BC008
procedure TIdTCPClientCustom.InitComponent;
begin
{*
 005BC008    push        ebx
 005BC009    mov         ebx,eax
 005BC00B    mov         eax,ebx
 005BC00D    call        TIdTCPConnection.InitComponent
 005BC012    mov         dword ptr [ebx+0E8],0FFFFFFFF
 005BC01C    mov         word ptr [ebx+0BC],0
 005BC025    mov         word ptr [ebx+0C0],0
 005BC02E    mov         word ptr [ebx+0BE],0
 005BC037    mov         byte ptr [ebx+0F1],1
 005BC03E    pop         ebx
 005BC03F    ret
*}
end;

//005BC040
procedure TIdTCPClientCustom.Connect;
begin
{*
 005BC040    push        ebp
 005BC041    mov         ebp,esp
 005BC043    add         esp,0FFFFFFF0
 005BC046    push        ebx
 005BC047    push        esi
 005BC048    push        edi
 005BC049    xor         edx,edx
 005BC04B    mov         dword ptr [ebp-8],edx
 005BC04E    mov         dword ptr [ebp-4],eax
 005BC051    xor         eax,eax
 005BC053    push        ebp
 005BC054    push        5BC31A
 005BC059    push        dword ptr fs:[eax]
 005BC05C    mov         dword ptr fs:[eax],esp
 005BC05F    mov         eax,dword ptr [ebp-4]
 005BC062    mov         edx,dword ptr [eax]
 005BC064    call        dword ptr [edx+68]
 005BC067    test        al,al
>005BC069    je          005BC085
 005BC06B    lea         edx,[ebp-8]
 005BC06E    mov         eax,[0078CF68];^SResString695:TResStringRec
 005BC073    call        LoadResString
 005BC078    mov         edx,dword ptr [ebp-8]
 005BC07B    mov         eax,[005AF570];EIdAlreadyConnected
 005BC080    call        EIdException.Toss
 005BC085    mov         eax,dword ptr [ebp-4]
 005BC088    cmp         dword ptr [eax+0CC],0
>005BC08F    jne         005BC09D
 005BC091    xor         edx,edx
 005BC093    mov         eax,[005AF9BC];EIdHostRequired
 005BC098    call        EIdException.Toss
 005BC09D    mov         eax,dword ptr [ebp-4]
 005BC0A0    cmp         word ptr [eax+0E4],0
>005BC0A8    jne         005BC0B6
 005BC0AA    xor         edx,edx
 005BC0AC    mov         eax,[005AF910];EIdPortRequired
 005BC0B1    call        EIdException.Toss
 005BC0B6    mov         eax,dword ptr [ebp-4]
 005BC0B9    cmp         dword ptr [eax+98],0
>005BC0C0    jne         005BC0F9
 005BC0C2    mov         eax,dword ptr [ebp-4]
 005BC0C5    mov         edx,dword ptr [eax]
 005BC0C7    call        dword ptr [edx+90]
 005BC0CD    mov         edx,eax
 005BC0CF    mov         eax,dword ptr [ebp-4]
 005BC0D2    mov         ecx,dword ptr [eax]
 005BC0D4    call        dword ptr [ecx+54]
 005BC0D7    mov         eax,dword ptr [ebp-4]
 005BC0DA    mov         eax,dword ptr [eax+98]
 005BC0E0    mov         edx,dword ptr [ebp-4]
 005BC0E3    mov         ecx,dword ptr [edx+38]
 005BC0E6    mov         dword ptr [eax+38],ecx
 005BC0E9    mov         ecx,dword ptr [edx+3C]
 005BC0EC    mov         dword ptr [eax+3C],ecx
 005BC0EF    mov         eax,dword ptr [ebp-4]
 005BC0F2    mov         byte ptr [eax+0A0],1
 005BC0F9    xor         edx,edx
 005BC0FB    push        ebp
 005BC0FC    push        5BC2CA
 005BC101    push        dword ptr fs:[edx]
 005BC104    mov         dword ptr fs:[edx],esp
 005BC107    mov         eax,dword ptr [ebp-4]
 005BC10A    cmp         dword ptr [eax+0C8],0
>005BC111    je          005BC12A
 005BC113    mov         eax,dword ptr [ebp-4]
 005BC116    mov         edx,dword ptr [eax+0C8]
 005BC11C    mov         eax,dword ptr [ebp-4]
 005BC11F    mov         eax,dword ptr [eax+98]
 005BC125    mov         ecx,dword ptr [eax]
 005BC127    call        dword ptr [ecx+4C]
 005BC12A    mov         eax,dword ptr [ebp-4]
 005BC12D    movzx       edx,word ptr [eax+0E4]
 005BC134    mov         eax,dword ptr [ebp-4]
 005BC137    mov         eax,dword ptr [eax+98]
 005BC13D    mov         ecx,dword ptr [eax]
 005BC13F    call        dword ptr [ecx+54]
 005BC142    mov         eax,dword ptr [ebp-4]
 005BC145    mov         edx,dword ptr [eax+0CC]
 005BC14B    mov         eax,dword ptr [ebp-4]
 005BC14E    mov         eax,dword ptr [eax+98]
 005BC154    mov         ecx,dword ptr [eax]
 005BC156    call        dword ptr [ecx+50]
 005BC159    mov         edx,dword ptr [ebp-4]
 005BC15C    mov         edx,dword ptr [edx+0C4]
 005BC162    mov         eax,dword ptr [ebp-4]
 005BC165    mov         eax,dword ptr [eax+98]
 005BC16B    mov         dword ptr [eax+94],edx
 005BC171    mov         edx,dword ptr [ebp-4]
 005BC174    mov         edx,dword ptr [edx+0E8]
 005BC17A    mov         dword ptr [eax+0C0],edx
 005BC180    mov         eax,dword ptr [ebp-4]
 005BC183    mov         ebx,dword ptr [eax+0B0]
 005BC189    test        ebx,ebx
>005BC18B    je          005BC26A
 005BC191    lea         eax,[ebx+0DC]
 005BC197    mov         edx,dword ptr [ebp-4]
 005BC19A    mov         edx,dword ptr [edx+0B8]
 005BC1A0    call        @UStrAsg
 005BC1A5    mov         edx,dword ptr [ebp-4]
 005BC1A8    movzx       edx,word ptr [edx+0BC]
 005BC1AF    mov         eax,dword ptr [ebp-4]
 005BC1B2    mov         eax,dword ptr [eax+0B0]
 005BC1B8    mov         word ptr [eax+0E0],dx
 005BC1BF    mov         edx,dword ptr [ebp-4]
 005BC1C2    movzx       edx,word ptr [edx+0C0]
 005BC1C9    mov         word ptr [eax+0E4],dx
 005BC1D0    mov         edx,dword ptr [ebp-4]
 005BC1D3    movzx       edx,word ptr [edx+0BE]
 005BC1DA    mov         word ptr [eax+0E2],dx
 005BC1E1    mov         edx,dword ptr [ebp-4]
 005BC1E4    movzx       edx,byte ptr [edx+0D0]
 005BC1EB    mov         byte ptr [eax+106],dl
 005BC1F1    mov         edx,dword ptr [ebp-4]
 005BC1F4    movzx       edx,byte ptr [edx+0F0]
 005BC1FB    mov         byte ptr [eax+105],dl
 005BC201    mov         edx,dword ptr [ebp-4]
 005BC204    movzx       edx,byte ptr [edx+0F1]
 005BC20B    call        TIdIOHandlerSocket.SetUseNagle
 005BC210    mov         eax,dword ptr [ebp-4]
 005BC213    mov         eax,dword ptr [eax+0B0]
 005BC219    mov         edx,dword ptr [ebp-4]
 005BC21C    mov         ecx,dword ptr [edx+0F8]
 005BC222    mov         dword ptr [eax+0E8],ecx
 005BC228    mov         ecx,dword ptr [edx+0FC]
 005BC22E    mov         dword ptr [eax+0EC],ecx
 005BC234    mov         edx,dword ptr [ebp-4]
 005BC237    mov         ecx,dword ptr [edx+100]
 005BC23D    mov         dword ptr [eax+0F0],ecx
 005BC243    mov         ecx,dword ptr [edx+104]
 005BC249    mov         dword ptr [eax+0F4],ecx
 005BC24F    mov         edx,dword ptr [ebp-4]
 005BC252    mov         ecx,dword ptr [edx+108]
 005BC258    mov         dword ptr [eax+0F8],ecx
 005BC25E    mov         ecx,dword ptr [edx+10C]
 005BC264    mov         dword ptr [eax+0FC],ecx
 005BC26A    mov         eax,dword ptr [ebp-4]
 005BC26D    mov         eax,dword ptr [eax+98]
 005BC273    mov         edx,dword ptr [eax]
 005BC275    call        dword ptr [edx+8C]
 005BC27B    mov         eax,dword ptr [ebp-4]
 005BC27E    mov         eax,dword ptr [eax+98]
 005BC284    mov         eax,dword ptr [eax+0A4]
 005BC28A    test        eax,eax
>005BC28C    je          005BC296
 005BC28E    mov         edx,dword ptr [ebp-4]
 005BC291    mov         ecx,dword ptr [eax]
 005BC293    call        dword ptr [ecx+38]
 005BC296    push        0
 005BC298    mov         eax,dword ptr [ebp-4]
 005BC29B    mov         eax,dword ptr [eax+0CC]
 005BC2A1    mov         dword ptr [ebp-10],eax
 005BC2A4    mov         byte ptr [ebp-0C],11
 005BC2A8    lea         ecx,[ebp-10]
 005BC2AB    mov         dl,2
 005BC2AD    mov         eax,dword ptr [ebp-4]
 005BC2B0    call        TIdComponent.DoStatus
 005BC2B5    mov         eax,dword ptr [ebp-4]
 005BC2B8    mov         edx,dword ptr [eax]
 005BC2BA    call        dword ptr [edx+8C]
 005BC2C0    xor         eax,eax
 005BC2C2    pop         edx
 005BC2C3    pop         ecx
 005BC2C4    pop         ecx
 005BC2C5    mov         dword ptr fs:[eax],edx
>005BC2C8    jmp         005BC304
>005BC2CA    jmp         @HandleAnyException
 005BC2CF    mov         eax,dword ptr [ebp-4]
 005BC2D2    mov         eax,dword ptr [eax+98]
 005BC2D8    test        eax,eax
>005BC2DA    je          005BC2FA
 005BC2DC    mov         edx,dword ptr [eax]
 005BC2DE    call        dword ptr [edx+80]
 005BC2E4    mov         eax,dword ptr [ebp-4]
 005BC2E7    cmp         byte ptr [eax+0A0],0
>005BC2EE    je          005BC2FA
 005BC2F0    xor         edx,edx
 005BC2F2    mov         eax,dword ptr [ebp-4]
 005BC2F5    mov         ecx,dword ptr [eax]
 005BC2F7    call        dword ptr [ecx+54]
 005BC2FA    call        @RaiseAgain
 005BC2FF    call        @DoneExcept
 005BC304    xor         eax,eax
 005BC306    pop         edx
 005BC307    pop         ecx
 005BC308    pop         ecx
 005BC309    mov         dword ptr fs:[eax],edx
 005BC30C    push        5BC321
 005BC311    lea         eax,[ebp-8]
 005BC314    call        @UStrClr
 005BC319    ret
>005BC31A    jmp         @HandleFinally
>005BC31F    jmp         005BC311
 005BC321    pop         edi
 005BC322    pop         esi
 005BC323    pop         ebx
 005BC324    mov         esp,ebp
 005BC326    pop         ebp
 005BC327    ret
*}
end;

//005BC328
function TIdTCPClientCustom.ConnectAndGetAll:string;
begin
{*
 005BC328    push        ebp
 005BC329    mov         ebp,esp
 005BC32B    push        ecx
 005BC32C    push        ebx
 005BC32D    mov         ebx,edx
 005BC32F    mov         dword ptr [ebp-4],eax
 005BC332    mov         eax,dword ptr [ebp-4]
 005BC335    mov         edx,dword ptr [eax]
 005BC337    call        dword ptr [edx+0A0]
 005BC33D    xor         eax,eax
 005BC33F    push        ebp
 005BC340    push        5BC376
 005BC345    push        dword ptr fs:[eax]
 005BC348    mov         dword ptr fs:[eax],esp
 005BC34B    mov         ecx,ebx
 005BC34D    mov         eax,dword ptr [ebp-4]
 005BC350    mov         eax,dword ptr [eax+98]
 005BC356    xor         edx,edx
 005BC358    mov         ebx,dword ptr [eax]
 005BC35A    call        dword ptr [ebx+0AC]
 005BC360    xor         eax,eax
 005BC362    pop         edx
 005BC363    pop         ecx
 005BC364    pop         ecx
 005BC365    mov         dword ptr fs:[eax],edx
 005BC368    push        5BC37D
 005BC36D    mov         eax,dword ptr [ebp-4]
 005BC370    call        TIdTCPConnection.Disconnect
 005BC375    ret
>005BC376    jmp         @HandleFinally
>005BC37B    jmp         005BC36D
 005BC37D    pop         ebx
 005BC37E    pop         ecx
 005BC37F    pop         ebp
 005BC380    ret
*}
end;

//005BC384
procedure TIdTCPClientCustom.DoOnConnected;
begin
{*
 005BC384    push        ebx
 005BC385    cmp         word ptr [eax+0DA],0
>005BC38D    je          005BC39F
 005BC38F    mov         ebx,eax
 005BC391    mov         edx,eax
 005BC393    mov         eax,dword ptr [ebx+0DC]
 005BC399    call        dword ptr [ebx+0D8]
 005BC39F    pop         ebx
 005BC3A0    ret
*}
end;

//005BC3A4
procedure TIdTCPClientCustom.SetConnectTimeout(const AValue:Integer);
begin
{*
 005BC3A4    mov         dword ptr [eax+0C4],edx
 005BC3AA    mov         ecx,dword ptr [eax+98]
 005BC3B0    test        ecx,ecx
>005BC3B2    je          005BC3BA
 005BC3B4    mov         dword ptr [ecx+94],edx
 005BC3BA    ret
*}
end;

//005BC3BC
procedure TIdTCPClientCustom.SetReadTimeout(const AValue:Integer);
begin
{*
 005BC3BC    mov         dword ptr [eax+0E8],edx
 005BC3C2    mov         ecx,dword ptr [eax+98]
 005BC3C8    test        ecx,ecx
>005BC3CA    je          005BC3D2
 005BC3CC    mov         dword ptr [ecx+0C0],edx
 005BC3D2    ret
*}
end;

//005BC3D4
procedure TIdTCPClientCustom.SetReuseSocket(const AValue:TIdReuseSocket);
begin
{*
 005BC3D4    mov         byte ptr [eax+0F0],dl
 005BC3DA    mov         ecx,dword ptr [eax+0B0]
 005BC3E0    test        ecx,ecx
>005BC3E2    je          005BC3EA
 005BC3E4    mov         byte ptr [ecx+105],dl
 005BC3EA    ret
*}
end;

//005BC3EC
procedure TIdTCPClientCustom.SetUseNagle(const AValue:Boolean);
begin
{*
 005BC3EC    mov         byte ptr [eax+0F1],dl
 005BC3F2    mov         ecx,dword ptr [eax+0B0]
 005BC3F8    test        ecx,ecx
>005BC3FA    je          005BC403
 005BC3FC    mov         eax,ecx
 005BC3FE    call        TIdIOHandlerSocket.SetUseNagle
 005BC403    ret
*}
end;

//005BC404
procedure TIdTCPClientCustom.SetBoundIP(const AValue:UnicodeString);
begin
{*
 005BC404    push        ebx
 005BC405    push        esi
 005BC406    push        edi
 005BC407    mov         esi,edx
 005BC409    mov         ebx,eax
 005BC40B    lea         eax,[ebx+0B8]
 005BC411    mov         edx,esi
 005BC413    call        @UStrAsg
 005BC418    mov         edi,dword ptr [ebx+0B0]
 005BC41E    test        edi,edi
>005BC420    je          005BC42F
 005BC422    lea         eax,[edi+0DC]
 005BC428    mov         edx,esi
 005BC42A    call        @UStrAsg
 005BC42F    pop         edi
 005BC430    pop         esi
 005BC431    pop         ebx
 005BC432    ret
*}
end;

//005BC434
procedure TIdTCPClientCustom.SetBoundPort(const AValue:TIdPort);
begin
{*
 005BC434    mov         word ptr [eax+0BC],dx
 005BC43B    mov         ecx,dword ptr [eax+0B0]
 005BC441    test        ecx,ecx
>005BC443    je          005BC44C
 005BC445    mov         word ptr [ecx+0E0],dx
 005BC44C    ret
*}
end;

//005BC450
procedure TIdTCPClientCustom.SetBoundPortMax(const AValue:TIdPort);
begin
{*
 005BC450    mov         word ptr [eax+0BE],dx
 005BC457    mov         ecx,dword ptr [eax+0B0]
 005BC45D    test        ecx,ecx
>005BC45F    je          005BC468
 005BC461    mov         word ptr [ecx+0E2],dx
 005BC468    ret
*}
end;

//005BC46C
procedure TIdTCPClientCustom.SetBoundPortMin(const AValue:TIdPort);
begin
{*
 005BC46C    mov         word ptr [eax+0C0],dx
 005BC473    mov         ecx,dword ptr [eax+0B0]
 005BC479    test        ecx,ecx
>005BC47B    je          005BC484
 005BC47D    mov         word ptr [ecx+0E4],dx
 005BC484    ret
*}
end;

//005BC488
procedure TIdTCPClientCustom.SetHost(const AValue:UnicodeString);
begin
{*
 005BC488    push        ebx
 005BC489    push        esi
 005BC48A    push        edi
 005BC48B    mov         esi,edx
 005BC48D    mov         ebx,eax
 005BC48F    lea         eax,[ebx+0CC]
 005BC495    mov         edx,esi
 005BC497    call        @UStrAsg
 005BC49C    mov         edi,dword ptr [ebx+98]
 005BC4A2    test        edi,edi
>005BC4A4    je          005BC4AF
 005BC4A6    mov         edx,esi
 005BC4A8    mov         eax,edi
 005BC4AA    mov         ecx,dword ptr [eax]
 005BC4AC    call        dword ptr [ecx+50]
 005BC4AF    pop         edi
 005BC4B0    pop         esi
 005BC4B1    pop         ebx
 005BC4B2    ret
*}
end;

//005BC4B4
procedure TIdTCPClientCustom.SetPort(const AValue:TIdPort);
begin
{*
 005BC4B4    push        esi
 005BC4B5    push        edi
 005BC4B6    mov         esi,eax
 005BC4B8    mov         word ptr [esi+0E4],dx
 005BC4BF    mov         edi,dword ptr [esi+98]
 005BC4C5    test        edi,edi
>005BC4C7    je          005BC4D5
 005BC4C9    movzx       eax,dx
 005BC4CC    mov         edx,eax
 005BC4CE    mov         eax,edi
 005BC4D0    mov         ecx,dword ptr [eax]
 005BC4D2    call        dword ptr [ecx+54]
 005BC4D5    pop         edi
 005BC4D6    pop         esi
 005BC4D7    ret
*}
end;

//005BC4D8
procedure TIdTCPClientCustom.SetIPVersion(const AValue:TIdIPVersion);
begin
{*
 005BC4D8    mov         byte ptr [eax+0D0],dl
 005BC4DE    mov         ecx,dword ptr [eax+0B0]
 005BC4E4    test        ecx,ecx
>005BC4E6    je          005BC4EE
 005BC4E8    mov         byte ptr [ecx+106],dl
 005BC4EE    ret
*}
end;

//005BC4F0
procedure TIdTCPClientCustom.SetOnBeforeBind(AValue:TNotifyEvent);
begin
{*
 005BC4F0    push        ebp
 005BC4F1    mov         ebp,esp
 005BC4F3    mov         edx,dword ptr [ebp+8]
 005BC4F6    mov         dword ptr [eax+0F8],edx
 005BC4FC    mov         edx,dword ptr [ebp+0C]
 005BC4FF    mov         dword ptr [eax+0FC],edx
 005BC505    mov         edx,dword ptr [eax+0B0]
 005BC50B    test        edx,edx
>005BC50D    je          005BC521
 005BC50F    mov         eax,dword ptr [ebp+8]
 005BC512    mov         dword ptr [edx+0E8],eax
 005BC518    mov         eax,dword ptr [ebp+0C]
 005BC51B    mov         dword ptr [edx+0EC],eax
 005BC521    pop         ebp
 005BC522    ret         8
*}
end;

//005BC528
procedure TIdTCPClientCustom.SetOnAfterBind(AValue:TNotifyEvent);
begin
{*
 005BC528    push        ebp
 005BC529    mov         ebp,esp
 005BC52B    mov         edx,dword ptr [ebp+8]
 005BC52E    mov         dword ptr [eax+100],edx
 005BC534    mov         edx,dword ptr [ebp+0C]
 005BC537    mov         dword ptr [eax+104],edx
 005BC53D    mov         edx,dword ptr [eax+0B0]
 005BC543    test        edx,edx
>005BC545    je          005BC559
 005BC547    mov         eax,dword ptr [ebp+8]
 005BC54A    mov         dword ptr [edx+0F0],eax
 005BC550    mov         eax,dword ptr [ebp+0C]
 005BC553    mov         dword ptr [edx+0F4],eax
 005BC559    pop         ebp
 005BC55A    ret         8
*}
end;

//005BC560
procedure TIdTCPClientCustom.SetOnSocketAllocated(AValue:TNotifyEvent);
begin
{*
 005BC560    push        ebp
 005BC561    mov         ebp,esp
 005BC563    mov         edx,dword ptr [ebp+8]
 005BC566    mov         dword ptr [eax+108],edx
 005BC56C    mov         edx,dword ptr [ebp+0C]
 005BC56F    mov         dword ptr [eax+10C],edx
 005BC575    mov         edx,dword ptr [eax+0B0]
 005BC57B    test        edx,edx
>005BC57D    je          005BC591
 005BC57F    mov         eax,dword ptr [ebp+8]
 005BC582    mov         dword ptr [edx+0F8],eax
 005BC588    mov         eax,dword ptr [ebp+0C]
 005BC58B    mov         dword ptr [edx+0FC],eax
 005BC591    pop         ebp
 005BC592    ret         8
*}
end;

//005BC598
procedure TIdTCPClientCustom.SetIOHandler(AValue:TIdIOHandler);
begin
{*
 005BC598    push        ebx
 005BC599    push        esi
 005BC59A    mov         esi,eax
 005BC59C    mov         eax,esi
 005BC59E    call        TIdTCPConnection.SetIOHandler
 005BC5A3    mov         eax,dword ptr [esi+98]
 005BC5A9    test        eax,eax
>005BC5AB    je          005BC5E8
 005BC5AD    movzx       edx,word ptr [esi+0E4]
 005BC5B4    mov         ecx,dword ptr [eax]
 005BC5B6    call        dword ptr [ecx+54]
 005BC5B9    mov         edx,dword ptr [esi+0CC]
 005BC5BF    mov         eax,dword ptr [esi+98]
 005BC5C5    mov         ecx,dword ptr [eax]
 005BC5C7    call        dword ptr [ecx+50]
 005BC5CA    mov         eax,dword ptr [esi+98]
 005BC5D0    mov         edx,dword ptr [esi+0C4]
 005BC5D6    mov         dword ptr [eax+94],edx
 005BC5DC    mov         edx,dword ptr [esi+0E8]
 005BC5E2    mov         dword ptr [eax+0C0],edx
 005BC5E8    mov         ebx,dword ptr [esi+0B0]
 005BC5EE    test        ebx,ebx
>005BC5F0    je          005BC6AB
 005BC5F6    lea         eax,[ebx+0DC]
 005BC5FC    mov         edx,dword ptr [esi+0B8]
 005BC602    call        @UStrAsg
 005BC607    mov         eax,dword ptr [esi+0B0]
 005BC60D    movzx       edx,word ptr [esi+0BC]
 005BC614    mov         word ptr [eax+0E0],dx
 005BC61B    movzx       edx,word ptr [esi+0C0]
 005BC622    mov         word ptr [eax+0E4],dx
 005BC629    movzx       edx,word ptr [esi+0BE]
 005BC630    mov         word ptr [eax+0E2],dx
 005BC637    movzx       edx,byte ptr [esi+0D0]
 005BC63E    mov         byte ptr [eax+106],dl
 005BC644    movzx       edx,byte ptr [esi+0F0]
 005BC64B    mov         byte ptr [eax+105],dl
 005BC651    movzx       edx,byte ptr [esi+0F1]
 005BC658    call        TIdIOHandlerSocket.SetUseNagle
 005BC65D    mov         eax,dword ptr [esi+0B0]
 005BC663    mov         edx,dword ptr [esi+0F8]
 005BC669    mov         dword ptr [eax+0E8],edx
 005BC66F    mov         edx,dword ptr [esi+0FC]
 005BC675    mov         dword ptr [eax+0EC],edx
 005BC67B    mov         edx,dword ptr [esi+100]
 005BC681    mov         dword ptr [eax+0F0],edx
 005BC687    mov         edx,dword ptr [esi+104]
 005BC68D    mov         dword ptr [eax+0F4],edx
 005BC693    mov         edx,dword ptr [esi+108]
 005BC699    mov         dword ptr [eax+0F8],edx
 005BC69F    mov         edx,dword ptr [esi+10C]
 005BC6A5    mov         dword ptr [eax+0FC],edx
 005BC6AB    pop         esi
 005BC6AC    pop         ebx
 005BC6AD    ret
*}
end;

//005BC6B0
function TIdTCPClientCustom.MakeImplicitClientHandler:TIdIOHandler;
begin
{*
 005BC6B0    mov         edx,eax
 005BC6B2    mov         eax,[005B15E4];TIdIOHandler
 005BC6B7    call        TIdIOHandler.MakeDefaultIOHandler
 005BC6BC    ret
*}
end;

//005BC6C0
procedure TIdTCPClientCustom.Connect(AHost:string);
begin
{*
 005BC6C0    push        esi
 005BC6C1    mov         esi,eax
 005BC6C3    mov         eax,esi
 005BC6C5    mov         ecx,dword ptr [eax]
 005BC6C7    call        dword ptr [ecx+94]
 005BC6CD    mov         eax,esi
 005BC6CF    mov         edx,dword ptr [eax]
 005BC6D1    call        dword ptr [edx+0A0]
 005BC6D7    pop         esi
 005BC6D8    ret
*}
end;

//005BC6DC
procedure TIdTCPClientCustom.Connect(AHost:string; APort:Word);
begin
{*
 005BC6DC    push        esi
 005BC6DD    push        edi
 005BC6DE    mov         edi,ecx
 005BC6E0    mov         esi,eax
 005BC6E2    mov         eax,esi
 005BC6E4    mov         ecx,dword ptr [eax]
 005BC6E6    call        dword ptr [ecx+94]
 005BC6EC    mov         edx,edi
 005BC6EE    mov         eax,esi
 005BC6F0    mov         ecx,dword ptr [eax]
 005BC6F2    call        dword ptr [ecx+98]
 005BC6F8    mov         eax,esi
 005BC6FA    mov         edx,dword ptr [eax]
 005BC6FC    call        dword ptr [edx+0A0]
 005BC702    pop         edi
 005BC703    pop         esi
 005BC704    ret
*}
end;

//005BC708
function TIdTCPClientCustom.GetReadTimeout:Integer;
begin
{*
 005BC708    mov         edx,dword ptr [eax+98]
 005BC70E    test        edx,edx
>005BC710    je          005BC719
 005BC712    mov         eax,dword ptr [edx+0C0]
 005BC718    ret
 005BC719    mov         eax,dword ptr [eax+0E8]
 005BC71F    ret
*}
end;

//005BC720
function TIdTCPClientCustom.GetReuseSocket:TIdReuseSocket;
begin
{*
 005BC720    mov         edx,dword ptr [eax+0B0]
 005BC726    test        edx,edx
>005BC728    je          005BC732
 005BC72A    movzx       eax,byte ptr [edx+105]
 005BC731    ret
 005BC732    movzx       eax,byte ptr [eax+0F0]
 005BC739    ret
*}
end;

//005BC73C
function TIdTCPClientCustom.GetUseNagle:Boolean;
begin
{*
 005BC73C    mov         edx,dword ptr [eax+0B0]
 005BC742    test        edx,edx
>005BC744    je          005BC74E
 005BC746    mov         eax,edx
 005BC748    call        TIdIOHandlerSocket.GetUseNagle
 005BC74D    ret
 005BC74E    movzx       eax,byte ptr [eax+0F1]
 005BC755    ret
*}
end;

//005BCD90
procedure TIdSocksInfo.Assign(ASource:TPersistent);
begin
{*
 005BCD90    push        ebx
 005BCD91    push        esi
 005BCD92    mov         esi,edx
 005BCD94    mov         ebx,eax
 005BCD96    mov         eax,esi
 005BCD98    mov         edx,dword ptr ds:[5BC8D0];TIdSocksInfo
 005BCD9E    call        @IsClass
 005BCDA3    test        al,al
>005BCDA5    je          005BCDC3
 005BCDA7    mov         eax,esi
 005BCDA9    movzx       edx,byte ptr [eax+0A8]
 005BCDB0    mov         byte ptr [ebx+0A8],dl
 005BCDB6    movzx       eax,byte ptr [eax+0A9]
 005BCDBD    mov         byte ptr [ebx+0A9],al
 005BCDC3    mov         edx,esi
 005BCDC5    mov         eax,ebx
 005BCDC7    call        TIdCustomTransparentProxy.Assign
 005BCDCC    pop         esi
 005BCDCD    pop         ebx
 005BCDCE    ret
*}
end;

//005BCDD0
procedure TIdSocksInfo.MakeSocks4Request(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort; const ARequest:Byte);
begin
{*
 005BCDD0    push        ebp
 005BCDD1    mov         ebp,esp
 005BCDD3    push        ecx
 005BCDD4    mov         ecx,8
 005BCDD9    push        0
 005BCDDB    push        0
 005BCDDD    dec         ecx
>005BCDDE    jne         005BCDD9
 005BCDE0    push        ecx
 005BCDE1    xchg        ecx,dword ptr [ebp-4]
 005BCDE4    push        ebx
 005BCDE5    push        esi
 005BCDE6    push        edi
 005BCDE7    mov         esi,ecx
 005BCDE9    mov         dword ptr [ebp-8],edx
 005BCDEC    mov         ebx,eax
 005BCDEE    xor         eax,eax
 005BCDF0    push        ebp
 005BCDF1    push        5BD0E2
 005BCDF6    push        dword ptr fs:[eax]
 005BCDF9    mov         dword ptr fs:[eax],esp
 005BCDFC    mov         eax,dword ptr [ebp-8]
 005BCDFF    call        TIdIOHandler.WriteBufferingActive
 005BCE04    xor         al,1
 005BCE06    mov         byte ptr [ebp-9],al
 005BCE09    cmp         byte ptr [ebp-9],0
>005BCE0D    je          005BCE17
 005BCE0F    mov         eax,dword ptr [ebp-8]
 005BCE12    call        TIdIOHandler.WriteBufferOpen
 005BCE17    xor         eax,eax
 005BCE19    push        ebp
 005BCE1A    push        5BD03C
 005BCE1F    push        dword ptr fs:[eax]
 005BCE22    mov         dword ptr fs:[eax],esp
 005BCE25    push        0
 005BCE27    lea         edx,[ebp-10]
 005BCE2A    mov         al,4
 005BCE2C    call        ToBytes
 005BCE31    mov         edx,dword ptr [ebp-10]
 005BCE34    or          ecx,0FFFFFFFF
 005BCE37    mov         eax,dword ptr [ebp-8]
 005BCE3A    mov         edi,dword ptr [eax]
 005BCE3C    call        dword ptr [edi+88]
 005BCE42    push        0
 005BCE44    lea         edx,[ebp-14]
 005BCE47    movzx       eax,byte ptr [ebp+8]
 005BCE4B    call        ToBytes
 005BCE50    mov         edx,dword ptr [ebp-14]
 005BCE53    or          ecx,0FFFFFFFF
 005BCE56    mov         eax,dword ptr [ebp-8]
 005BCE59    mov         edi,dword ptr [eax]
 005BCE5B    call        dword ptr [edi+88]
 005BCE61    mov         eax,[0078D940];^gvar_00789ED0
 005BCE66    mov         eax,dword ptr [eax]
 005BCE68    movzx       edx,word ptr [ebp+0C]
 005BCE6C    mov         ecx,dword ptr [eax]
 005BCE6E    call        dword ptr [ecx+2C]
 005BCE71    mov         edi,eax
 005BCE73    push        0
 005BCE75    lea         edx,[ebp-18]
 005BCE78    mov         eax,edi
 005BCE7A    call        ToBytes
 005BCE7F    mov         edx,dword ptr [ebp-18]
 005BCE82    or          ecx,0FFFFFFFF
 005BCE85    mov         eax,dword ptr [ebp-8]
 005BCE88    mov         edi,dword ptr [eax]
 005BCE8A    call        dword ptr [edi+88]
 005BCE90    cmp         byte ptr [ebx+0A9],2
>005BCE97    jne         005BCEA8
 005BCE99    lea         eax,[ebp-4]
 005BCE9C    mov         edx,5BD100;'0.0.0.1'
 005BCEA1    call        @UStrLAsg
>005BCEA6    jmp         005BCEBC
 005BCEA8    lea         eax,[ebp-4]
 005BCEAB    push        eax
 005BCEAC    mov         eax,[0078D940];^gvar_00789ED0
 005BCEB1    mov         eax,dword ptr [eax]
 005BCEB3    xor         ecx,ecx
 005BCEB5    mov         edx,esi
 005BCEB7    call        TIdStack.ResolveHost
 005BCEBC    push        0
 005BCEBE    push        1
 005BCEC0    lea         eax,[ebp-20]
 005BCEC3    push        eax
 005BCEC4    lea         eax,[ebp-4]
 005BCEC7    mov         cl,1
 005BCEC9    mov         edx,5BD11C;'.'
 005BCECE    call        Fetch
 005BCED3    mov         eax,dword ptr [ebp-20]
 005BCED6    call        IndyStrToInt
 005BCEDB    lea         edx,[ebp-1C]
 005BCEDE    call        ToBytes
 005BCEE3    mov         edx,dword ptr [ebp-1C]
 005BCEE6    or          ecx,0FFFFFFFF
 005BCEE9    mov         eax,dword ptr [ebp-8]
 005BCEEC    mov         edi,dword ptr [eax]
 005BCEEE    call        dword ptr [edi+88]
 005BCEF4    push        0
 005BCEF6    push        1
 005BCEF8    lea         eax,[ebp-28]
 005BCEFB    push        eax
 005BCEFC    lea         eax,[ebp-4]
 005BCEFF    mov         cl,1
 005BCF01    mov         edx,5BD11C;'.'
 005BCF06    call        Fetch
 005BCF0B    mov         eax,dword ptr [ebp-28]
 005BCF0E    call        IndyStrToInt
 005BCF13    lea         edx,[ebp-24]
 005BCF16    call        ToBytes
 005BCF1B    mov         edx,dword ptr [ebp-24]
 005BCF1E    or          ecx,0FFFFFFFF
 005BCF21    mov         eax,dword ptr [ebp-8]
 005BCF24    mov         edi,dword ptr [eax]
 005BCF26    call        dword ptr [edi+88]
 005BCF2C    push        0
 005BCF2E    push        1
 005BCF30    lea         eax,[ebp-30]
 005BCF33    push        eax
 005BCF34    lea         eax,[ebp-4]
 005BCF37    mov         cl,1
 005BCF39    mov         edx,5BD11C;'.'
 005BCF3E    call        Fetch
 005BCF43    mov         eax,dword ptr [ebp-30]
 005BCF46    call        IndyStrToInt
 005BCF4B    lea         edx,[ebp-2C]
 005BCF4E    call        ToBytes
 005BCF53    mov         edx,dword ptr [ebp-2C]
 005BCF56    or          ecx,0FFFFFFFF
 005BCF59    mov         eax,dword ptr [ebp-8]
 005BCF5C    mov         edi,dword ptr [eax]
 005BCF5E    call        dword ptr [edi+88]
 005BCF64    push        0
 005BCF66    push        1
 005BCF68    lea         eax,[ebp-38]
 005BCF6B    push        eax
 005BCF6C    lea         eax,[ebp-4]
 005BCF6F    mov         cl,1
 005BCF71    mov         edx,5BD11C;'.'
 005BCF76    call        Fetch
 005BCF7B    mov         eax,dword ptr [ebp-38]
 005BCF7E    call        IndyStrToInt
 005BCF83    lea         edx,[ebp-34]
 005BCF86    call        ToBytes
 005BCF8B    mov         edx,dword ptr [ebp-34]
 005BCF8E    or          ecx,0FFFFFFFF
 005BCF91    mov         eax,dword ptr [ebp-8]
 005BCF94    mov         edi,dword ptr [eax]
 005BCF96    call        dword ptr [edi+88]
 005BCF9C    push        0
 005BCF9E    lea         ecx,[ebp-3C]
 005BCFA1    mov         eax,dword ptr [ebx+9C]
 005BCFA7    xor         edx,edx
 005BCFA9    call        ToBytes
 005BCFAE    mov         edx,dword ptr [ebp-3C]
 005BCFB1    or          ecx,0FFFFFFFF
 005BCFB4    mov         eax,dword ptr [ebp-8]
 005BCFB7    mov         edi,dword ptr [eax]
 005BCFB9    call        dword ptr [edi+88]
 005BCFBF    push        0
 005BCFC1    lea         edx,[ebp-40]
 005BCFC4    xor         eax,eax
 005BCFC6    call        ToBytes
 005BCFCB    mov         edx,dword ptr [ebp-40]
 005BCFCE    or          ecx,0FFFFFFFF
 005BCFD1    mov         eax,dword ptr [ebp-8]
 005BCFD4    mov         edi,dword ptr [eax]
 005BCFD6    call        dword ptr [edi+88]
 005BCFDC    cmp         byte ptr [ebx+0A9],2
>005BCFE3    jne         005BD021
 005BCFE5    push        0
 005BCFE7    lea         ecx,[ebp-44]
 005BCFEA    xor         edx,edx
 005BCFEC    mov         eax,esi
 005BCFEE    call        ToBytes
 005BCFF3    mov         edx,dword ptr [ebp-44]
 005BCFF6    or          ecx,0FFFFFFFF
 005BCFF9    mov         eax,dword ptr [ebp-8]
 005BCFFC    mov         ebx,dword ptr [eax]
 005BCFFE    call        dword ptr [ebx+88]
 005BD004    push        0
 005BD006    lea         edx,[ebp-48]
 005BD009    xor         eax,eax
 005BD00B    call        ToBytes
 005BD010    mov         edx,dword ptr [ebp-48]
 005BD013    or          ecx,0FFFFFFFF
 005BD016    mov         eax,dword ptr [ebp-8]
 005BD019    mov         ebx,dword ptr [eax]
 005BD01B    call        dword ptr [ebx+88]
 005BD021    cmp         byte ptr [ebp-9],0
>005BD025    je          005BD032
 005BD027    mov         eax,dword ptr [ebp-8]
 005BD02A    mov         edx,dword ptr [eax]
 005BD02C    call        dword ptr [edx+0CC]
 005BD032    xor         eax,eax
 005BD034    pop         edx
 005BD035    pop         ecx
 005BD036    pop         ecx
 005BD037    mov         dword ptr fs:[eax],edx
>005BD03A    jmp         005BD05C
>005BD03C    jmp         @HandleAnyException
 005BD041    cmp         byte ptr [ebp-9],0
>005BD045    je          005BD052
 005BD047    mov         eax,dword ptr [ebp-8]
 005BD04A    mov         edx,dword ptr [eax]
 005BD04C    call        dword ptr [edx+0C4]
 005BD052    call        @RaiseAgain
 005BD057    call        @DoneExcept
 005BD05C    xor         eax,eax
 005BD05E    pop         edx
 005BD05F    pop         ecx
 005BD060    pop         ecx
 005BD061    mov         dword ptr fs:[eax],edx
 005BD064    push        5BD0E9
 005BD069    lea         eax,[ebp-48]
 005BD06C    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BD072    mov         ecx,4
 005BD077    call        @FinalizeArray
 005BD07C    lea         eax,[ebp-38]
 005BD07F    call        @UStrClr
 005BD084    lea         eax,[ebp-34]
 005BD087    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BD08D    call        @DynArrayClear
 005BD092    lea         eax,[ebp-30]
 005BD095    call        @UStrClr
 005BD09A    lea         eax,[ebp-2C]
 005BD09D    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BD0A3    call        @DynArrayClear
 005BD0A8    lea         eax,[ebp-28]
 005BD0AB    call        @UStrClr
 005BD0B0    lea         eax,[ebp-24]
 005BD0B3    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BD0B9    call        @DynArrayClear
 005BD0BE    lea         eax,[ebp-20]
 005BD0C1    call        @UStrClr
 005BD0C6    lea         eax,[ebp-1C]
 005BD0C9    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BD0CF    mov         ecx,4
 005BD0D4    call        @FinalizeArray
 005BD0D9    lea         eax,[ebp-4]
 005BD0DC    call        @UStrClr
 005BD0E1    ret
>005BD0E2    jmp         @HandleFinally
>005BD0E7    jmp         005BD069
 005BD0E9    pop         edi
 005BD0EA    pop         esi
 005BD0EB    pop         ebx
 005BD0EC    mov         esp,ebp
 005BD0EE    pop         ebp
 005BD0EF    ret         8
*}
end;

//005BD120
procedure TIdSocksInfo.MakeSocks4Connection(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort);
begin
{*
 005BD120    push        ebp
 005BD121    mov         ebp,esp
 005BD123    push        0
 005BD125    push        0
 005BD127    push        0
 005BD129    push        0
 005BD12B    push        0
 005BD12D    push        ebx
 005BD12E    push        esi
 005BD12F    mov         esi,edx
 005BD131    xor         edx,edx
 005BD133    push        ebp
 005BD134    push        5BD231
 005BD139    push        dword ptr fs:[edx]
 005BD13C    mov         dword ptr fs:[edx],esp
 005BD13F    movzx       edx,word ptr [ebp+8]
 005BD143    push        edx
 005BD144    push        1
 005BD146    mov         edx,esi
 005BD148    call        TIdSocksInfo.MakeSocks4Request
 005BD14D    push        0
 005BD14F    lea         edx,[ebp-4]
 005BD152    mov         ecx,8
 005BD157    mov         eax,esi
 005BD159    mov         ebx,dword ptr [eax]
 005BD15B    call        dword ptr [ebx+0B4]
 005BD161    mov         eax,dword ptr [ebp-4]
 005BD164    movzx       eax,byte ptr [eax+1]
 005BD168    sub         al,5A
>005BD16A    je          005BD208
 005BD170    dec         al
>005BD172    je          005BD17E
 005BD174    dec         al
>005BD176    je          005BD1A1
 005BD178    dec         al
>005BD17A    je          005BD1C4
>005BD17C    jmp         005BD1E7
 005BD17E    lea         edx,[ebp-8]
 005BD181    mov         eax,[0078D384];^SResString666:TResStringRec
 005BD186    call        LoadResString
 005BD18B    mov         ecx,dword ptr [ebp-8]
 005BD18E    mov         dl,1
 005BD190    mov         eax,[005B00B4];EIdSocksRequestFailed
 005BD195    call        EIdException.Create
 005BD19A    call        @RaiseExcept
>005BD19F    jmp         005BD208
 005BD1A1    lea         edx,[ebp-0C]
 005BD1A4    mov         eax,[0078CE14];^SResString667:TResStringRec
 005BD1A9    call        LoadResString
 005BD1AE    mov         ecx,dword ptr [ebp-0C]
 005BD1B1    mov         dl,1
 005BD1B3    mov         eax,[005B016C];EIdSocksRequestServerFailed
 005BD1B8    call        EIdException.Create
 005BD1BD    call        @RaiseExcept
>005BD1C2    jmp         005BD208
 005BD1C4    lea         edx,[ebp-10]
 005BD1C7    mov         eax,[0078D5C8];^SResString668:TResStringRec
 005BD1CC    call        LoadResString
 005BD1D1    mov         ecx,dword ptr [ebp-10]
 005BD1D4    mov         dl,1
 005BD1D6    mov         eax,[005B0230];EIdSocksRequestIdentFailed
 005BD1DB    call        EIdException.Create
 005BD1E0    call        @RaiseExcept
>005BD1E5    jmp         005BD208
 005BD1E7    lea         edx,[ebp-14]
 005BD1EA    mov         eax,[0078D5C4];^SResString669:TResStringRec
 005BD1EF    call        LoadResString
 005BD1F4    mov         ecx,dword ptr [ebp-14]
 005BD1F7    mov         dl,1
 005BD1F9    mov         eax,[005B02F0];EIdSocksUnknownError
 005BD1FE    call        EIdException.Create
 005BD203    call        @RaiseExcept
 005BD208    xor         eax,eax
 005BD20A    pop         edx
 005BD20B    pop         ecx
 005BD20C    pop         ecx
 005BD20D    mov         dword ptr fs:[eax],edx
 005BD210    push        5BD238
 005BD215    lea         eax,[ebp-14]
 005BD218    mov         edx,4
 005BD21D    call        @UStrArrayClr
 005BD222    lea         eax,[ebp-4]
 005BD225    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BD22B    call        @DynArrayClear
 005BD230    ret
>005BD231    jmp         @HandleFinally
>005BD236    jmp         005BD215
 005BD238    pop         esi
 005BD239    pop         ebx
 005BD23A    mov         esp,ebp
 005BD23C    pop         ebp
 005BD23D    ret         4
*}
end;

//005BD240
procedure TIdSocksInfo.MakeSocks5Request(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort; const ARequest:Byte; var VBuf:TIdBytes; var VLen:Integer);
begin
{*
 005BD240    push        ebp
 005BD241    mov         ebp,esp
 005BD243    push        0
 005BD245    push        0
 005BD247    push        0
 005BD249    push        0
 005BD24B    push        0
 005BD24D    push        0
 005BD24F    push        0
 005BD251    push        0
 005BD253    push        ebx
 005BD254    push        esi
 005BD255    mov         ebx,ecx
 005BD257    xor         eax,eax
 005BD259    push        ebp
 005BD25A    push        5BD4A7
 005BD25F    push        dword ptr fs:[eax]
 005BD262    mov         dword ptr fs:[eax],esp
 005BD265    mov         eax,dword ptr [ebp+0C]
 005BD268    mov         eax,dword ptr [eax]
 005BD26A    mov         byte ptr [eax],5
 005BD26D    mov         eax,dword ptr [ebp+0C]
 005BD270    mov         eax,dword ptr [eax]
 005BD272    movzx       edx,byte ptr [ebp+10]
 005BD276    mov         byte ptr [eax+1],dl
 005BD279    mov         eax,dword ptr [ebp+0C]
 005BD27C    mov         eax,dword ptr [eax]
 005BD27E    mov         byte ptr [eax+2],0
 005BD282    lea         edx,[ebp-0C]
 005BD285    mov         eax,ebx
 005BD287    call        MakeCanonicalIPv6Address
 005BD28C    mov         eax,dword ptr [ebp-0C]
 005BD28F    mov         dword ptr [ebp-10],eax
 005BD292    mov         eax,dword ptr [ebp-10]
 005BD295    test        eax,eax
>005BD297    je          005BD29E
 005BD299    sub         eax,4
 005BD29C    mov         eax,dword ptr [eax]
 005BD29E    test        eax,eax
>005BD2A0    jle         005BD32D
 005BD2A6    mov         eax,dword ptr [ebp+0C]
 005BD2A9    mov         eax,dword ptr [eax]
 005BD2AB    mov         byte ptr [eax+3],4
 005BD2AF    mov         eax,dword ptr [ebp+0C]
 005BD2B2    mov         eax,dword ptr [eax]
 005BD2B4    mov         byte ptr [eax+4],10
 005BD2B8    mov         eax,dword ptr [ebp+8]
 005BD2BB    mov         dword ptr [eax],5
 005BD2C1    mov         edx,ebx
 005BD2C3    mov         eax,[005B7B44];TIdIPAddress
 005BD2C8    call        TIdIPAddress.MakeAddressObject
 005BD2CD    mov         dword ptr [ebp-8],eax
 005BD2D0    xor         edx,edx
 005BD2D2    push        ebp
 005BD2D3    push        5BD31B
 005BD2D8    push        dword ptr fs:[edx]
 005BD2DB    mov         dword ptr fs:[edx],esp
 005BD2DE    cmp         dword ptr [ebp-8],0
>005BD2E2    je          005BD300
 005BD2E4    push        4
 005BD2E6    push        10
 005BD2E8    lea         edx,[ebp-14]
 005BD2EB    mov         eax,dword ptr [ebp-8]
 005BD2EE    call        TIdIPAddress.HToNBytes
 005BD2F3    mov         eax,dword ptr [ebp-14]
 005BD2F6    mov         ecx,dword ptr [ebp+0C]
 005BD2F9    xor         edx,edx
 005BD2FB    call        CopyTIdBytes
 005BD300    xor         eax,eax
 005BD302    pop         edx
 005BD303    pop         ecx
 005BD304    pop         ecx
 005BD305    mov         dword ptr fs:[eax],edx
 005BD308    push        5BD322
 005BD30D    mov         eax,dword ptr [ebp-8]
 005BD310    xor         edx,edx
 005BD312    mov         dword ptr [ebp-8],edx
 005BD315    call        TObject.Free
 005BD31A    ret
>005BD31B    jmp         @HandleFinally
>005BD320    jmp         005BD30D
 005BD322    mov         eax,dword ptr [ebp+8]
 005BD325    add         dword ptr [eax],10
>005BD328    jmp         005BD439
 005BD32D    mov         eax,[0078D940];^gvar_00789ED0
 005BD332    mov         eax,dword ptr [eax]
 005BD334    mov         edx,ebx
 005BD336    call        TIdStack.IsIP
 005BD33B    test        al,al
>005BD33D    je          005BD3B7
 005BD33F    mov         eax,dword ptr [ebp+0C]
 005BD342    mov         eax,dword ptr [eax]
 005BD344    mov         byte ptr [eax+3],1
 005BD348    mov         edx,ebx
 005BD34A    mov         eax,[005B7B44];TIdIPAddress
 005BD34F    call        TIdIPAddress.MakeAddressObject
 005BD354    mov         dword ptr [ebp-8],eax
 005BD357    xor         edx,edx
 005BD359    push        ebp
 005BD35A    push        5BD3A2
 005BD35F    push        dword ptr fs:[edx]
 005BD362    mov         dword ptr fs:[edx],esp
 005BD365    cmp         dword ptr [ebp-8],0
>005BD369    je          005BD387
 005BD36B    push        4
 005BD36D    push        4
 005BD36F    lea         edx,[ebp-18]
 005BD372    mov         eax,dword ptr [ebp-8]
 005BD375    call        TIdIPAddress.HToNBytes
 005BD37A    mov         eax,dword ptr [ebp-18]
 005BD37D    mov         ecx,dword ptr [ebp+0C]
 005BD380    xor         edx,edx
 005BD382    call        CopyTIdBytes
 005BD387    xor         eax,eax
 005BD389    pop         edx
 005BD38A    pop         ecx
 005BD38B    pop         ecx
 005BD38C    mov         dword ptr fs:[eax],edx
 005BD38F    push        5BD3A9
 005BD394    mov         eax,dword ptr [ebp-8]
 005BD397    xor         edx,edx
 005BD399    mov         dword ptr [ebp-8],edx
 005BD39C    call        TObject.Free
 005BD3A1    ret
>005BD3A2    jmp         @HandleFinally
>005BD3A7    jmp         005BD394
 005BD3A9    mov         eax,dword ptr [ebp+8]
 005BD3AC    mov         dword ptr [eax],8
>005BD3B2    jmp         005BD439
 005BD3B7    mov         eax,dword ptr [ebp+0C]
 005BD3BA    mov         eax,dword ptr [eax]
 005BD3BC    mov         byte ptr [eax+3],3
 005BD3C0    mov         esi,ebx
 005BD3C2    mov         eax,esi
 005BD3C4    test        eax,eax
>005BD3C6    je          005BD3CD
 005BD3C8    sub         eax,4
 005BD3CB    mov         eax,dword ptr [eax]
 005BD3CD    mov         edx,dword ptr [ebp+0C]
 005BD3D0    mov         edx,dword ptr [edx]
 005BD3D2    mov         byte ptr [edx+4],al
 005BD3D5    mov         eax,dword ptr [ebp+8]
 005BD3D8    mov         dword ptr [eax],5
 005BD3DE    mov         eax,esi
 005BD3E0    test        eax,eax
>005BD3E2    je          005BD3E9
 005BD3E4    sub         eax,4
 005BD3E7    mov         eax,dword ptr [eax]
 005BD3E9    test        eax,eax
>005BD3EB    jle         005BD429
 005BD3ED    lea         ecx,[ebp-1C]
 005BD3F0    xor         edx,edx
 005BD3F2    mov         eax,ebx
 005BD3F4    call        ToBytes
 005BD3F9    mov         edx,dword ptr [ebp-1C]
 005BD3FC    lea         eax,[ebp-4]
 005BD3FF    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 005BD405    call        @DynArrayAsg
 005BD40A    mov         eax,esi
 005BD40C    test        eax,eax
>005BD40E    je          005BD415
 005BD410    sub         eax,4
 005BD413    mov         eax,dword ptr [eax]
 005BD415    mov         edx,dword ptr [ebp+8]
 005BD418    mov         edx,dword ptr [edx]
 005BD41A    push        edx
 005BD41B    push        eax
 005BD41C    mov         ecx,dword ptr [ebp+0C]
 005BD41F    xor         edx,edx
 005BD421    mov         eax,dword ptr [ebp-4]
 005BD424    call        CopyTIdBytes
 005BD429    mov         eax,esi
 005BD42B    test        eax,eax
>005BD42D    je          005BD434
 005BD42F    sub         eax,4
 005BD432    mov         eax,dword ptr [eax]
 005BD434    mov         edx,dword ptr [ebp+8]
 005BD437    add         dword ptr [edx],eax
 005BD439    mov         eax,[0078D940];^gvar_00789ED0
 005BD43E    mov         eax,dword ptr [eax]
 005BD440    movzx       edx,word ptr [ebp+14]
 005BD444    mov         ecx,dword ptr [eax]
 005BD446    call        dword ptr [ecx+2C]
 005BD449    mov         ebx,eax
 005BD44B    mov         eax,dword ptr [ebp+8]
 005BD44E    mov         eax,dword ptr [eax]
 005BD450    push        eax
 005BD451    push        2
 005BD453    lea         edx,[ebp-20]
 005BD456    mov         eax,ebx
 005BD458    call        ToBytes
 005BD45D    mov         eax,dword ptr [ebp-20]
 005BD460    mov         ecx,dword ptr [ebp+0C]
 005BD463    xor         edx,edx
 005BD465    call        CopyTIdBytes
 005BD46A    mov         eax,dword ptr [ebp+8]
 005BD46D    add         dword ptr [eax],2
 005BD470    xor         eax,eax
 005BD472    pop         edx
 005BD473    pop         ecx
 005BD474    pop         ecx
 005BD475    mov         dword ptr fs:[eax],edx
 005BD478    push        5BD4AE
 005BD47D    lea         eax,[ebp-20]
 005BD480    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BD486    mov         ecx,4
 005BD48B    call        @FinalizeArray
 005BD490    lea         eax,[ebp-0C]
 005BD493    call        @UStrClr
 005BD498    lea         eax,[ebp-4]
 005BD49B    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BD4A1    call        @DynArrayClear
 005BD4A6    ret
>005BD4A7    jmp         @HandleFinally
>005BD4AC    jmp         005BD47D
 005BD4AE    pop         esi
 005BD4AF    pop         ebx
 005BD4B0    mov         esp,ebp
 005BD4B2    pop         ebp
 005BD4B3    ret         10
*}
end;

//005BD4B8
procedure TIdSocksInfo.MakeSocks5Connection(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion);
begin
{*
 005BD4B8    push        ebp
 005BD4B9    mov         ebp,esp
 005BD4BB    push        ecx
 005BD4BC    mov         ecx,6
 005BD4C1    push        0
 005BD4C3    push        0
 005BD4C5    dec         ecx
>005BD4C6    jne         005BD4C1
 005BD4C8    push        ecx
 005BD4C9    xchg        ecx,dword ptr [ebp-4]
 005BD4CC    push        ebx
 005BD4CD    push        esi
 005BD4CE    push        edi
 005BD4CF    mov         edi,ecx
 005BD4D1    mov         ebx,edx
 005BD4D3    mov         esi,eax
 005BD4D5    xor         eax,eax
 005BD4D7    push        ebp
 005BD4D8    push        5BD7F2
 005BD4DD    push        dword ptr fs:[eax]
 005BD4E0    mov         dword ptr fs:[eax],esp
 005BD4E3    mov         edx,ebx
 005BD4E5    mov         eax,esi
 005BD4E7    call        TIdSocksInfo.AuthenticateSocks5Connection
 005BD4EC    push        0FF
 005BD4F1    lea         eax,[ebp-4]
 005BD4F4    mov         ecx,1
 005BD4F9    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BD4FF    call        @DynArraySetLength
 005BD504    add         esp,4
 005BD507    movzx       eax,word ptr [ebp+0C]
 005BD50B    push        eax
 005BD50C    push        1
 005BD50E    lea         eax,[ebp-4]
 005BD511    push        eax
 005BD512    lea         eax,[ebp-8]
 005BD515    push        eax
 005BD516    mov         ecx,edi
 005BD518    mov         edx,ebx
 005BD51A    mov         eax,esi
 005BD51C    call        TIdSocksInfo.MakeSocks5Request
 005BD521    lea         eax,[ebp-0C]
 005BD524    push        eax
 005BD525    xor         ecx,ecx
 005BD527    mov         edx,dword ptr [ebp-8]
 005BD52A    mov         eax,dword ptr [ebp-4]
 005BD52D    call        ToBytes
 005BD532    mov         edx,dword ptr [ebp-0C]
 005BD535    lea         eax,[ebp-4]
 005BD538    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 005BD53E    call        @DynArrayAsg
 005BD543    push        0
 005BD545    or          ecx,0FFFFFFFF
 005BD548    mov         edx,dword ptr [ebp-4]
 005BD54B    mov         eax,ebx
 005BD54D    call        TIdIOHandler.WriteDirect
 005BD552    xor         eax,eax
 005BD554    push        ebp
 005BD555    push        5BD57E
 005BD55A    push        dword ptr fs:[eax]
 005BD55D    mov         dword ptr fs:[eax],esp
 005BD560    push        0
 005BD562    lea         edx,[ebp-4]
 005BD565    mov         ecx,5
 005BD56A    mov         eax,ebx
 005BD56C    mov         esi,dword ptr [eax]
 005BD56E    call        dword ptr [esi+0B4]
 005BD574    xor         eax,eax
 005BD576    pop         edx
 005BD577    pop         ecx
 005BD578    pop         ecx
 005BD579    mov         dword ptr fs:[eax],edx
>005BD57C    jmp         005BD5A9
>005BD57E    jmp         @HandleAnyException
 005BD583    lea         edx,[ebp-10]
 005BD586    mov         eax,[0078CD98];^SResString670:TResStringRec
 005BD58B    call        LoadResString
 005BD590    mov         ecx,dword ptr [ebp-10]
 005BD593    mov         dl,1
 005BD595    mov         eax,[005B03A8];EIdSocksServerRespondError
 005BD59A    call        EIdException.Create
 005BD59F    call        @RaiseExcept
 005BD5A4    call        @DoneExcept
 005BD5A9    mov         eax,dword ptr [ebp-4]
 005BD5AC    movzx       eax,byte ptr [eax+1]
 005BD5B0    cmp         eax,8
>005BD5B3    ja          005BD710
 005BD5B9    jmp         dword ptr [eax*4+5BD5C0]
 005BD5B9    dd          005BD731
 005BD5B9    dd          005BD5E9
 005BD5B9    dd          005BD60F
 005BD5B9    dd          005BD635
 005BD5B9    dd          005BD65B
 005BD5B9    dd          005BD681
 005BD5B9    dd          005BD6A7
 005BD5B9    dd          005BD6CA
 005BD5B9    dd          005BD6ED
>005BD5E4    jmp         005BD731
 005BD5E9    lea         edx,[ebp-14]
 005BD5EC    mov         eax,[0078D0B0];^SResString673:TResStringRec
 005BD5F1    call        LoadResString
 005BD5F6    mov         ecx,dword ptr [ebp-14]
 005BD5F9    mov         dl,1
 005BD5FB    mov         eax,[005B05D4];EIdSocksServerGeneralError
 005BD600    call        EIdException.Create
 005BD605    call        @RaiseExcept
>005BD60A    jmp         005BD731
 005BD60F    lea         edx,[ebp-18]
 005BD612    mov         eax,[0078CC78];^SResString674:TResStringRec
 005BD617    call        LoadResString
 005BD61C    mov         ecx,dword ptr [ebp-18]
 005BD61F    mov         dl,1
 005BD621    mov         eax,[005B0694];EIdSocksServerPermissionError
 005BD626    call        EIdException.Create
 005BD62B    call        @RaiseExcept
>005BD630    jmp         005BD731
 005BD635    lea         edx,[ebp-1C]
 005BD638    mov         eax,[0078CDC4];^SResString675:TResStringRec
 005BD63D    call        LoadResString
 005BD642    mov         ecx,dword ptr [ebp-1C]
 005BD645    mov         dl,1
 005BD647    mov         eax,[005B075C];EIdSocksServerNetUnreachableError
 005BD64C    call        EIdException.Create
 005BD651    call        @RaiseExcept
>005BD656    jmp         005BD731
 005BD65B    lea         edx,[ebp-20]
 005BD65E    mov         eax,[0078D64C];^SResString676:TResStringRec
 005BD663    call        LoadResString
 005BD668    mov         ecx,dword ptr [ebp-20]
 005BD66B    mov         dl,1
 005BD66D    mov         eax,[005B082C];EIdSocksServerHostUnreachableError
 005BD672    call        EIdException.Create
 005BD677    call        @RaiseExcept
>005BD67C    jmp         005BD731
 005BD681    lea         edx,[ebp-24]
 005BD684    mov         eax,[0078D0F0];^SResString677:TResStringRec
 005BD689    call        LoadResString
 005BD68E    mov         ecx,dword ptr [ebp-24]
 005BD691    mov         dl,1
 005BD693    mov         eax,[005B08FC];EIdSocksServerConnectionRefusedError
 005BD698    call        EIdException.Create
 005BD69D    call        @RaiseExcept
>005BD6A2    jmp         005BD731
 005BD6A7    lea         edx,[ebp-28]
 005BD6AA    mov         eax,[0078D1C8];^SResString678:TResStringRec
 005BD6AF    call        LoadResString
 005BD6B4    mov         ecx,dword ptr [ebp-28]
 005BD6B7    mov         dl,1
 005BD6B9    mov         eax,[005B09D4];EIdSocksServerTTLExpiredError
 005BD6BE    call        EIdException.Create
 005BD6C3    call        @RaiseExcept
>005BD6C8    jmp         005BD731
 005BD6CA    lea         edx,[ebp-2C]
 005BD6CD    mov         eax,[0078CF2C];^SResString679:TResStringRec
 005BD6D2    call        LoadResString
 005BD6D7    mov         ecx,dword ptr [ebp-2C]
 005BD6DA    mov         dl,1
 005BD6DC    mov         eax,[005B0A9C];EIdSocksServerCommandError
 005BD6E1    call        EIdException.Create
 005BD6E6    call        @RaiseExcept
>005BD6EB    jmp         005BD731
 005BD6ED    lea         edx,[ebp-30]
 005BD6F0    mov         eax,[0078D9D8];^SResString680:TResStringRec
 005BD6F5    call        LoadResString
 005BD6FA    mov         ecx,dword ptr [ebp-30]
 005BD6FD    mov         dl,1
 005BD6FF    mov         eax,[005B0B5C];EIdSocksServerAddressError
 005BD704    call        EIdException.Create
 005BD709    call        @RaiseExcept
>005BD70E    jmp         005BD731
 005BD710    lea         edx,[ebp-34]
 005BD713    mov         eax,[0078D5C4];^SResString669:TResStringRec
 005BD718    call        LoadResString
 005BD71D    mov         ecx,dword ptr [ebp-34]
 005BD720    mov         dl,1
 005BD722    mov         eax,[005B02F0];EIdSocksUnknownError
 005BD727    call        EIdException.Create
 005BD72C    call        @RaiseExcept
 005BD731    mov         eax,dword ptr [ebp-4]
 005BD734    movzx       eax,byte ptr [eax+3]
 005BD738    dec         al
>005BD73A    je          005BD746
 005BD73C    sub         al,2
>005BD73E    je          005BD74F
 005BD740    dec         al
>005BD742    je          005BD75E
>005BD744    jmp         005BD765
 005BD746    mov         dword ptr [ebp-8],6
>005BD74D    jmp         005BD765
 005BD74F    mov         eax,dword ptr [ebp-4]
 005BD752    movzx       eax,byte ptr [eax+4]
 005BD756    add         eax,2
 005BD759    mov         dword ptr [ebp-8],eax
>005BD75C    jmp         005BD765
 005BD75E    mov         dword ptr [ebp-8],12
 005BD765    xor         eax,eax
 005BD767    push        ebp
 005BD768    push        5BD790
 005BD76D    push        dword ptr fs:[eax]
 005BD770    mov         dword ptr fs:[eax],esp
 005BD773    push        0
 005BD775    mov         ecx,dword ptr [ebp-8]
 005BD778    dec         ecx
 005BD779    lea         edx,[ebp-4]
 005BD77C    mov         eax,ebx
 005BD77E    mov         ebx,dword ptr [eax]
 005BD780    call        dword ptr [ebx+0B4]
 005BD786    xor         eax,eax
 005BD788    pop         edx
 005BD789    pop         ecx
 005BD78A    pop         ecx
 005BD78B    mov         dword ptr fs:[eax],edx
>005BD78E    jmp         005BD7BB
>005BD790    jmp         @HandleAnyException
 005BD795    lea         edx,[ebp-38]
 005BD798    mov         eax,[0078CD98];^SResString670:TResStringRec
 005BD79D    call        LoadResString
 005BD7A2    mov         ecx,dword ptr [ebp-38]
 005BD7A5    mov         dl,1
 005BD7A7    mov         eax,[005B03A8];EIdSocksServerRespondError
 005BD7AC    call        EIdException.Create
 005BD7B1    call        @RaiseExcept
 005BD7B6    call        @DoneExcept
 005BD7BB    xor         eax,eax
 005BD7BD    pop         edx
 005BD7BE    pop         ecx
 005BD7BF    pop         ecx
 005BD7C0    mov         dword ptr fs:[eax],edx
 005BD7C3    push        5BD7F9
 005BD7C8    lea         eax,[ebp-38]
 005BD7CB    mov         edx,0B
 005BD7D0    call        @UStrArrayClr
 005BD7D5    lea         eax,[ebp-0C]
 005BD7D8    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BD7DE    call        @DynArrayClear
 005BD7E3    lea         eax,[ebp-4]
 005BD7E6    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BD7EC    call        @DynArrayClear
 005BD7F1    ret
>005BD7F2    jmp         @HandleFinally
>005BD7F7    jmp         005BD7C8
 005BD7F9    pop         edi
 005BD7FA    pop         esi
 005BD7FB    pop         ebx
 005BD7FC    mov         esp,ebp
 005BD7FE    pop         ebp
 005BD7FF    ret         8
*}
end;

//005BD804
procedure TIdSocksInfo.MakeSocks4Bind(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort);
begin
{*
 005BD804    push        ebp
 005BD805    mov         ebp,esp
 005BD807    push        ecx
 005BD808    mov         ecx,5
 005BD80D    push        0
 005BD80F    push        0
 005BD811    dec         ecx
>005BD812    jne         005BD80D
 005BD814    push        ecx
 005BD815    xchg        ecx,dword ptr [ebp-4]
 005BD818    push        ebx
 005BD819    push        esi
 005BD81A    push        edi
 005BD81B    mov         edi,ecx
 005BD81D    mov         ebx,edx
 005BD81F    mov         esi,eax
 005BD821    xor         eax,eax
 005BD823    push        ebp
 005BD824    push        5BDAB8
 005BD829    push        dword ptr fs:[eax]
 005BD82C    mov         dword ptr fs:[eax],esp
 005BD82F    xor         ecx,ecx
 005BD831    mov         dl,1
 005BD833    mov         eax,[005BBCBC];TIdTCPClient
 005BD838    call        TIdBaseComponent.Create
 005BD83D    mov         dword ptr [ebp-8],eax
 005BD840    xor         edx,edx
 005BD842    push        ebp
 005BD843    push        5BDA88
 005BD848    push        dword ptr fs:[edx]
 005BD84B    mov         dword ptr fs:[edx],esp
 005BD84E    push        8
 005BD850    lea         eax,[ebp-4]
 005BD853    mov         ecx,1
 005BD858    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BD85E    call        @DynArraySetLength
 005BD863    add         esp,4
 005BD866    xor         edx,edx
 005BD868    mov         eax,ebx
 005BD86A    mov         ecx,dword ptr [eax]
 005BD86C    call        dword ptr [ecx+0EC]
 005BD872    mov         edx,ebx
 005BD874    mov         eax,dword ptr [ebp-8]
 005BD877    mov         ecx,dword ptr [eax]
 005BD879    call        dword ptr [ecx+54]
 005BD87C    mov         edx,dword ptr [esi+90]
 005BD882    mov         eax,dword ptr [ebp-8]
 005BD885    mov         ecx,dword ptr [eax]
 005BD887    call        dword ptr [ecx+94]
 005BD88D    movzx       edx,word ptr [esi+98]
 005BD894    mov         eax,dword ptr [ebp-8]
 005BD897    mov         ecx,dword ptr [eax]
 005BD899    call        dword ptr [ecx+98]
 005BD89F    mov         eax,dword ptr [ebp-8]
 005BD8A2    mov         edx,dword ptr [eax]
 005BD8A4    call        dword ptr [edx+0A0]
 005BD8AA    mov         edx,esi
 005BD8AC    mov         eax,ebx
 005BD8AE    mov         ecx,dword ptr [eax]
 005BD8B0    call        dword ptr [ecx+0EC]
 005BD8B6    movzx       eax,word ptr [ebp+8]
 005BD8BA    push        eax
 005BD8BB    push        2
 005BD8BD    mov         ecx,edi
 005BD8BF    mov         edx,ebx
 005BD8C1    mov         eax,esi
 005BD8C3    call        TIdSocksInfo.MakeSocks4Request
 005BD8C8    push        0
 005BD8CA    lea         edx,[ebp-4]
 005BD8CD    mov         ecx,2
 005BD8D2    mov         eax,ebx
 005BD8D4    mov         esi,dword ptr [eax]
 005BD8D6    call        dword ptr [esi+0B4]
 005BD8DC    mov         eax,dword ptr [ebp-4]
 005BD8DF    movzx       eax,byte ptr [eax+1]
 005BD8E3    sub         al,5A
>005BD8E5    je          005BD983
 005BD8EB    dec         al
>005BD8ED    je          005BD8F9
 005BD8EF    dec         al
>005BD8F1    je          005BD91C
 005BD8F3    dec         al
>005BD8F5    je          005BD93F
>005BD8F7    jmp         005BD962
 005BD8F9    lea         edx,[ebp-0C]
 005BD8FC    mov         eax,[0078D384];^SResString666:TResStringRec
 005BD901    call        LoadResString
 005BD906    mov         ecx,dword ptr [ebp-0C]
 005BD909    mov         dl,1
 005BD90B    mov         eax,[005B00B4];EIdSocksRequestFailed
 005BD910    call        EIdException.Create
 005BD915    call        @RaiseExcept
>005BD91A    jmp         005BD983
 005BD91C    lea         edx,[ebp-10]
 005BD91F    mov         eax,[0078CE14];^SResString667:TResStringRec
 005BD924    call        LoadResString
 005BD929    mov         ecx,dword ptr [ebp-10]
 005BD92C    mov         dl,1
 005BD92E    mov         eax,[005B016C];EIdSocksRequestServerFailed
 005BD933    call        EIdException.Create
 005BD938    call        @RaiseExcept
>005BD93D    jmp         005BD983
 005BD93F    lea         edx,[ebp-14]
 005BD942    mov         eax,[0078D5C8];^SResString668:TResStringRec
 005BD947    call        LoadResString
 005BD94C    mov         ecx,dword ptr [ebp-14]
 005BD94F    mov         dl,1
 005BD951    mov         eax,[005B0230];EIdSocksRequestIdentFailed
 005BD956    call        EIdException.Create
 005BD95B    call        @RaiseExcept
>005BD960    jmp         005BD983
 005BD962    lea         edx,[ebp-18]
 005BD965    mov         eax,[0078D5C4];^SResString669:TResStringRec
 005BD96A    call        LoadResString
 005BD96F    mov         ecx,dword ptr [ebp-18]
 005BD972    mov         dl,1
 005BD974    mov         eax,[005B02F0];EIdSocksUnknownError
 005BD979    call        EIdException.Create
 005BD97E    call        @RaiseExcept
 005BD983    xor         eax,eax
 005BD985    push        ebp
 005BD986    push        5BDA38
 005BD98B    push        dword ptr fs:[eax]
 005BD98E    mov         dword ptr fs:[eax],esp
 005BD991    push        0
 005BD993    lea         edx,[ebp-4]
 005BD996    mov         ecx,6
 005BD99B    mov         eax,ebx
 005BD99D    mov         esi,dword ptr [eax]
 005BD99F    call        dword ptr [esi+0B4]
 005BD9A5    push        0
 005BD9A7    lea         edx,[ebp-20]
 005BD9AA    mov         eax,dword ptr [ebp-4]
 005BD9AD    movzx       eax,byte ptr [eax+2]
 005BD9B1    call        IntToStr
 005BD9B6    push        dword ptr [ebp-20]
 005BD9B9    push        5BDAD4;'.'
 005BD9BE    lea         edx,[ebp-24]
 005BD9C1    mov         eax,dword ptr [ebp-4]
 005BD9C4    movzx       eax,byte ptr [eax+3]
 005BD9C8    call        IntToStr
 005BD9CD    push        dword ptr [ebp-24]
 005BD9D0    push        5BDAD4;'.'
 005BD9D5    lea         edx,[ebp-28]
 005BD9D8    mov         eax,dword ptr [ebp-4]
 005BD9DB    movzx       eax,byte ptr [eax+4]
 005BD9DF    call        IntToStr
 005BD9E4    push        dword ptr [ebp-28]
 005BD9E7    push        5BDAD4;'.'
 005BD9EC    lea         edx,[ebp-2C]
 005BD9EF    mov         eax,dword ptr [ebp-4]
 005BD9F2    movzx       eax,byte ptr [eax+5]
 005BD9F6    call        IntToStr
 005BD9FB    push        dword ptr [ebp-2C]
 005BD9FE    lea         eax,[ebp-1C]
 005BDA01    mov         edx,7
 005BDA06    call        @UStrCatN
 005BDA0B    mov         edx,dword ptr [ebp-1C]
 005BDA0E    mov         eax,dword ptr [ebp-4]
 005BDA11    movzx       eax,byte ptr [eax]
 005BDA14    mov         ecx,eax
 005BDA16    shl         ecx,8
 005BDA19    mov         eax,dword ptr [ebp-4]
 005BDA1C    movzx       eax,byte ptr [eax+1]
 005BDA20    add         cx,ax
 005BDA23    mov         eax,dword ptr [ebx+0D8]
 005BDA29    call        TIdSocketHandle.SetBinding
 005BDA2E    xor         eax,eax
 005BDA30    pop         edx
 005BDA31    pop         ecx
 005BDA32    pop         ecx
 005BDA33    mov         dword ptr fs:[eax],edx
>005BDA36    jmp         005BDA63
>005BDA38    jmp         @HandleAnyException
 005BDA3D    lea         edx,[ebp-30]
 005BDA40    mov         eax,[0078CD98];^SResString670:TResStringRec
 005BDA45    call        LoadResString
 005BDA4A    mov         ecx,dword ptr [ebp-30]
 005BDA4D    mov         dl,1
 005BDA4F    mov         eax,[005B03A8];EIdSocksServerRespondError
 005BDA54    call        EIdException.Create
 005BDA59    call        @RaiseExcept
 005BDA5E    call        @DoneExcept
 005BDA63    xor         eax,eax
 005BDA65    pop         edx
 005BDA66    pop         ecx
 005BDA67    pop         ecx
 005BDA68    mov         dword ptr fs:[eax],edx
 005BDA6B    push        5BDA8F
 005BDA70    xor         edx,edx
 005BDA72    mov         eax,dword ptr [ebp-8]
 005BDA75    mov         ecx,dword ptr [eax]
 005BDA77    call        dword ptr [ecx+54]
 005BDA7A    mov         eax,dword ptr [ebp-8]
 005BDA7D    xor         edx,edx
 005BDA7F    mov         dword ptr [ebp-8],edx
 005BDA82    call        TObject.Free
 005BDA87    ret
>005BDA88    jmp         @HandleFinally
>005BDA8D    jmp         005BDA70
 005BDA8F    xor         eax,eax
 005BDA91    pop         edx
 005BDA92    pop         ecx
 005BDA93    pop         ecx
 005BDA94    mov         dword ptr fs:[eax],edx
 005BDA97    push        5BDABF
 005BDA9C    lea         eax,[ebp-30]
 005BDA9F    mov         edx,0A
 005BDAA4    call        @UStrArrayClr
 005BDAA9    lea         eax,[ebp-4]
 005BDAAC    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BDAB2    call        @DynArrayClear
 005BDAB7    ret
>005BDAB8    jmp         @HandleFinally
>005BDABD    jmp         005BDA9C
 005BDABF    pop         edi
 005BDAC0    pop         esi
 005BDAC1    pop         ebx
 005BDAC2    mov         esp,ebp
 005BDAC4    pop         ebp
 005BDAC5    ret         4
*}
end;

//005BDAD8
procedure TIdSocksInfo.MakeConnection(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion);
begin
{*
 005BDAD8    push        ebp
 005BDAD9    mov         ebp,esp
 005BDADB    push        ebx
 005BDADC    movzx       ebx,byte ptr [eax+0A9]
 005BDAE3    dec         ebx
 005BDAE4    sub         bl,2
>005BDAE7    jb          005BDAED
>005BDAE9    je          005BDAF9
>005BDAEB    jmp         005BDB05
 005BDAED    movzx       ebx,word ptr [ebp+0C]
 005BDAF1    push        ebx
 005BDAF2    call        TIdSocksInfo.MakeSocks4Connection
>005BDAF7    jmp         005BDB05
 005BDAF9    movzx       ebx,word ptr [ebp+0C]
 005BDAFD    push        ebx
 005BDAFE    push        0
 005BDB00    call        TIdSocksInfo.MakeSocks5Connection
 005BDB05    pop         ebx
 005BDB06    pop         ebp
 005BDB07    ret         8
*}
end;

//005BDB0C
function TIdSocksInfo.GetEnabled:Boolean;
begin
{*
 005BDB0C    movzx       eax,byte ptr [eax+0A9]
 005BDB13    dec         eax
 005BDB14    sub         al,3
 005BDB16    setb        al
 005BDB19    ret
*}
end;

//005BDB1C
procedure TIdSocksInfo.InitComponent;
begin
{*
 005BDB1C    push        ebx
 005BDB1D    mov         ebx,eax
 005BDB1F    mov         eax,ebx
 005BDB21    call        TIdComponent.InitComponent
 005BDB26    mov         byte ptr [ebx+0A8],0
 005BDB2D    mov         byte ptr [ebx+0A9],0
 005BDB34    mov         word ptr [ebx+98],438
 005BDB3D    mov         byte ptr [ebx+9A],0
 005BDB44    mov         dl,1
 005BDB46    mov         eax,[005B8344];TIdIOHandlerStack
 005BDB4B    call        TIdInitializerComponent.Create
 005BDB50    mov         dword ptr [ebx+0AC],eax
 005BDB56    pop         ebx
 005BDB57    ret
*}
end;

//005BDB58
procedure TIdSocksInfo.AuthenticateSocks5Connection(AIOHandler:TIdIOHandler);
begin
{*
 005BDB58    push        ebp
 005BDB59    mov         ebp,esp
 005BDB5B    xor         ecx,ecx
 005BDB5D    push        ecx
 005BDB5E    push        ecx
 005BDB5F    push        ecx
 005BDB60    push        ecx
 005BDB61    push        ecx
 005BDB62    push        ecx
 005BDB63    push        ecx
 005BDB64    push        ecx
 005BDB65    push        ebx
 005BDB66    push        esi
 005BDB67    push        edi
 005BDB68    mov         esi,edx
 005BDB6A    mov         ebx,eax
 005BDB6C    xor         eax,eax
 005BDB6E    push        ebp
 005BDB6F    push        5BDE17
 005BDB74    push        dword ptr fs:[eax]
 005BDB77    mov         dword ptr fs:[eax],esp
 005BDB7A    push        3
 005BDB7C    lea         eax,[ebp-4]
 005BDB7F    mov         ecx,1
 005BDB84    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BDB8A    call        @DynArraySetLength
 005BDB8F    add         esp,4
 005BDB92    cmp         byte ptr [ebx+0A8],0
>005BDB99    jne         005BDBA4
 005BDB9B    mov         eax,dword ptr [ebp-4]
 005BDB9E    mov         byte ptr [eax+2],0
>005BDBA2    jmp         005BDBAB
 005BDBA4    mov         eax,dword ptr [ebp-4]
 005BDBA7    mov         byte ptr [eax+2],2
 005BDBAB    mov         eax,dword ptr [ebp-4]
 005BDBAE    movzx       eax,byte ptr [eax+2]
 005BDBB2    mov         byte ptr [ebp-5],al
 005BDBB5    mov         eax,dword ptr [ebp-4]
 005BDBB8    mov         byte ptr [eax],5
 005BDBBB    mov         eax,dword ptr [ebp-4]
 005BDBBE    mov         byte ptr [eax+1],1
 005BDBC2    push        0
 005BDBC4    or          ecx,0FFFFFFFF
 005BDBC7    mov         edx,dword ptr [ebp-4]
 005BDBCA    mov         eax,esi
 005BDBCC    call        TIdIOHandler.WriteDirect
 005BDBD1    xor         edx,edx
 005BDBD3    push        ebp
 005BDBD4    push        5BDBFD
 005BDBD9    push        dword ptr fs:[edx]
 005BDBDC    mov         dword ptr fs:[edx],esp
 005BDBDF    push        0
 005BDBE1    lea         edx,[ebp-4]
 005BDBE4    mov         ecx,2
 005BDBE9    mov         eax,esi
 005BDBEB    mov         edi,dword ptr [eax]
 005BDBED    call        dword ptr [edi+0B4]
 005BDBF3    xor         eax,eax
 005BDBF5    pop         edx
 005BDBF6    pop         ecx
 005BDBF7    pop         ecx
 005BDBF8    mov         dword ptr fs:[eax],edx
>005BDBFB    jmp         005BDC34
>005BDBFD    jmp         @HandleOnException
 005BDC02    dd          1
 005BDC06    dd          00418C04;Exception
 005BDC0A    dd          005BDC0E
 005BDC0E    lea         edx,[ebp-0C]
 005BDC11    mov         eax,[0078CD98];^SResString670:TResStringRec
 005BDC16    call        LoadResString
 005BDC1B    mov         ecx,dword ptr [ebp-0C]
 005BDC1E    mov         dl,1
 005BDC20    mov         eax,[005B03A8];EIdSocksServerRespondError
 005BDC25    call        EIdException.Create
 005BDC2A    call        @RaiseExcept
 005BDC2F    call        @DoneExcept
 005BDC34    mov         eax,dword ptr [ebp-4]
 005BDC37    movzx       eax,byte ptr [eax+1]
 005BDC3B    cmp         al,byte ptr [ebp-5]
>005BDC3E    jne         005BDC44
 005BDC40    cmp         al,0FF
>005BDC42    jne         005BDC65
 005BDC44    lea         edx,[ebp-10]
 005BDC47    mov         eax,[0078CCEC];^SResString671:TResStringRec
 005BDC4C    call        LoadResString
 005BDC51    mov         ecx,dword ptr [ebp-10]
 005BDC54    mov         dl,1
 005BDC56    mov         eax,[005B0468];EIdSocksAuthMethodError
 005BDC5B    call        EIdException.Create
 005BDC60    call        @RaiseExcept
 005BDC65    cmp         byte ptr [ebx+0A8],1
>005BDC6C    jne         005BDDCE
 005BDC72    mov         eax,dword ptr [ebx+9C]
 005BDC78    test        eax,eax
>005BDC7A    je          005BDC81
 005BDC7C    sub         eax,4
 005BDC7F    mov         eax,dword ptr [eax]
 005BDC81    mov         byte ptr [ebp-6],al
 005BDC84    mov         eax,dword ptr [ebx+94]
 005BDC8A    test        eax,eax
>005BDC8C    je          005BDC93
 005BDC8E    sub         eax,4
 005BDC91    mov         eax,dword ptr [eax]
 005BDC93    mov         byte ptr [ebp-7],al
 005BDC96    movzx       eax,byte ptr [ebp-6]
 005BDC9A    add         eax,3
 005BDC9D    movzx       edx,byte ptr [ebp-7]
 005BDCA1    add         eax,edx
 005BDCA3    push        eax
 005BDCA4    lea         eax,[ebp-4]
 005BDCA7    mov         ecx,1
 005BDCAC    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BDCB2    call        @DynArraySetLength
 005BDCB7    add         esp,4
 005BDCBA    mov         eax,dword ptr [ebp-4]
 005BDCBD    mov         byte ptr [eax],1
 005BDCC0    mov         eax,dword ptr [ebp-4]
 005BDCC3    movzx       edx,byte ptr [ebp-6]
 005BDCC7    mov         byte ptr [eax+1],dl
 005BDCCA    mov         edi,2
 005BDCCF    cmp         byte ptr [ebp-6],0
>005BDCD3    jbe         005BDCFE
 005BDCD5    push        edi
 005BDCD6    movzx       eax,byte ptr [ebp-6]
 005BDCDA    push        eax
 005BDCDB    lea         ecx,[ebp-14]
 005BDCDE    mov         eax,dword ptr [ebx+9C]
 005BDCE4    xor         edx,edx
 005BDCE6    call        ToBytes
 005BDCEB    mov         eax,dword ptr [ebp-14]
 005BDCEE    lea         ecx,[ebp-4]
 005BDCF1    xor         edx,edx
 005BDCF3    call        CopyTIdBytes
 005BDCF8    movzx       eax,byte ptr [ebp-6]
 005BDCFC    add         edi,eax
 005BDCFE    mov         eax,dword ptr [ebp-4]
 005BDD01    movzx       edx,byte ptr [ebp-7]
 005BDD05    mov         byte ptr [eax+edi],dl
 005BDD08    inc         edi
 005BDD09    cmp         byte ptr [ebp-7],0
>005BDD0D    jbe         005BDD32
 005BDD0F    push        edi
 005BDD10    movzx       eax,byte ptr [ebp-7]
 005BDD14    push        eax
 005BDD15    lea         ecx,[ebp-18]
 005BDD18    mov         eax,dword ptr [ebx+94]
 005BDD1E    xor         edx,edx
 005BDD20    call        ToBytes
 005BDD25    mov         eax,dword ptr [ebp-18]
 005BDD28    lea         ecx,[ebp-4]
 005BDD2B    xor         edx,edx
 005BDD2D    call        CopyTIdBytes
 005BDD32    push        0
 005BDD34    or          ecx,0FFFFFFFF
 005BDD37    mov         edx,dword ptr [ebp-4]
 005BDD3A    mov         eax,esi
 005BDD3C    call        TIdIOHandler.WriteDirect
 005BDD41    xor         edx,edx
 005BDD43    push        ebp
 005BDD44    push        5BDD6D
 005BDD49    push        dword ptr fs:[edx]
 005BDD4C    mov         dword ptr fs:[edx],esp
 005BDD4F    push        0
 005BDD51    lea         edx,[ebp-4]
 005BDD54    mov         ecx,2
 005BDD59    mov         eax,esi
 005BDD5B    mov         ebx,dword ptr [eax]
 005BDD5D    call        dword ptr [ebx+0B4]
 005BDD63    xor         eax,eax
 005BDD65    pop         edx
 005BDD66    pop         ecx
 005BDD67    pop         ecx
 005BDD68    mov         dword ptr fs:[eax],edx
>005BDD6B    jmp         005BDDA4
>005BDD6D    jmp         @HandleOnException
 005BDD72    dd          1
 005BDD76    dd          00418C04;Exception
 005BDD7A    dd          005BDD7E
 005BDD7E    lea         edx,[ebp-1C]
 005BDD81    mov         eax,[0078CD98];^SResString670:TResStringRec
 005BDD86    call        LoadResString
 005BDD8B    mov         ecx,dword ptr [ebp-1C]
 005BDD8E    mov         dl,1
 005BDD90    mov         eax,[005B03A8];EIdSocksServerRespondError
 005BDD95    call        EIdException.Create
 005BDD9A    call        @RaiseExcept
 005BDD9F    call        @DoneExcept
 005BDDA4    mov         eax,dword ptr [ebp-4]
 005BDDA7    cmp         byte ptr [eax+1],0
>005BDDAB    je          005BDDCE
 005BDDAD    lea         edx,[ebp-20]
 005BDDB0    mov         eax,[0078CDAC];^SResString672:TResStringRec
 005BDDB5    call        LoadResString
 005BDDBA    mov         ecx,dword ptr [ebp-20]
 005BDDBD    mov         dl,1
 005BDDBF    mov         eax,[005B0524];EIdSocksAuthError
 005BDDC4    call        EIdException.Create
 005BDDC9    call        @RaiseExcept
 005BDDCE    xor         eax,eax
 005BDDD0    pop         edx
 005BDDD1    pop         ecx
 005BDDD2    pop         ecx
 005BDDD3    mov         dword ptr fs:[eax],edx
 005BDDD6    push        5BDE1E
 005BDDDB    lea         eax,[ebp-20]
 005BDDDE    mov         edx,2
 005BDDE3    call        @UStrArrayClr
 005BDDE8    lea         eax,[ebp-18]
 005BDDEB    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BDDF1    mov         ecx,2
 005BDDF6    call        @FinalizeArray
 005BDDFB    lea         eax,[ebp-10]
 005BDDFE    mov         edx,2
 005BDE03    call        @UStrArrayClr
 005BDE08    lea         eax,[ebp-4]
 005BDE0B    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BDE11    call        @DynArrayClear
 005BDE16    ret
>005BDE17    jmp         @HandleFinally
>005BDE1C    jmp         005BDDDB
 005BDE1E    pop         edi
 005BDE1F    pop         esi
 005BDE20    pop         ebx
 005BDE21    mov         esp,ebp
 005BDE23    pop         ebp
 005BDE24    ret
*}
end;

//005BDE28
procedure TIdSocksInfo.MakeSocks5Bind(AIOHandler:TIdIOHandler; const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion);
begin
{*
 005BDE28    push        ebp
 005BDE29    mov         ebp,esp
 005BDE2B    push        ecx
 005BDE2C    mov         ecx,0E
 005BDE31    push        0
 005BDE33    push        0
 005BDE35    dec         ecx
>005BDE36    jne         005BDE31
 005BDE38    xchg        ecx,dword ptr [ebp-4]
 005BDE3B    push        ebx
 005BDE3C    push        esi
 005BDE3D    push        edi
 005BDE3E    mov         dword ptr [ebp-8],ecx
 005BDE41    mov         ebx,edx
 005BDE43    mov         esi,eax
 005BDE45    xor         eax,eax
 005BDE47    push        ebp
 005BDE48    push        5BE34E
 005BDE4D    push        dword ptr fs:[eax]
 005BDE50    mov         dword ptr fs:[eax],esp
 005BDE53    xor         ecx,ecx
 005BDE55    mov         dl,1
 005BDE57    mov         eax,[005BBCBC];TIdTCPClient
 005BDE5C    call        TIdBaseComponent.Create
 005BDE61    mov         dword ptr [ebp-10],eax
 005BDE64    xor         edx,edx
 005BDE66    push        ebp
 005BDE67    push        5BE310
 005BDE6C    push        dword ptr fs:[edx]
 005BDE6F    mov         dword ptr fs:[edx],esp
 005BDE72    push        0FF
 005BDE77    lea         eax,[ebp-4]
 005BDE7A    mov         ecx,1
 005BDE7F    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BDE85    call        @DynArraySetLength
 005BDE8A    add         esp,4
 005BDE8D    xor         edx,edx
 005BDE8F    mov         edi,ebx
 005BDE91    mov         eax,edi
 005BDE93    mov         ecx,dword ptr [eax]
 005BDE95    call        dword ptr [ecx+0EC]
 005BDE9B    mov         edx,ebx
 005BDE9D    mov         eax,dword ptr [ebp-10]
 005BDEA0    mov         ecx,dword ptr [eax]
 005BDEA2    call        dword ptr [ecx+54]
 005BDEA5    mov         edx,dword ptr [esi+90]
 005BDEAB    mov         eax,dword ptr [ebp-10]
 005BDEAE    mov         ecx,dword ptr [eax]
 005BDEB0    call        dword ptr [ecx+94]
 005BDEB6    movzx       edx,byte ptr [esi+9A]
 005BDEBD    mov         eax,dword ptr [ebp-10]
 005BDEC0    mov         ecx,dword ptr [eax]
 005BDEC2    call        dword ptr [ecx+9C]
 005BDEC8    movzx       edx,word ptr [esi+98]
 005BDECF    mov         eax,dword ptr [ebp-10]
 005BDED2    mov         ecx,dword ptr [eax]
 005BDED4    call        dword ptr [ecx+98]
 005BDEDA    mov         eax,dword ptr [ebp-10]
 005BDEDD    mov         edx,dword ptr [eax]
 005BDEDF    call        dword ptr [edx+0A0]
 005BDEE5    mov         edx,esi
 005BDEE7    mov         eax,edi
 005BDEE9    mov         ecx,dword ptr [eax]
 005BDEEB    call        dword ptr [ecx+0EC]
 005BDEF1    mov         edx,ebx
 005BDEF3    mov         eax,esi
 005BDEF5    call        TIdSocksInfo.AuthenticateSocks5Connection
 005BDEFA    movzx       eax,word ptr [ebp+0C]
 005BDEFE    push        eax
 005BDEFF    push        2
 005BDF01    lea         eax,[ebp-4]
 005BDF04    push        eax
 005BDF05    lea         eax,[ebp-0C]
 005BDF08    push        eax
 005BDF09    mov         ecx,dword ptr [ebp-8]
 005BDF0C    mov         edx,ebx
 005BDF0E    mov         eax,esi
 005BDF10    call        TIdSocksInfo.MakeSocks5Request
 005BDF15    push        0
 005BDF17    lea         eax,[ebp-28]
 005BDF1A    push        eax
 005BDF1B    xor         ecx,ecx
 005BDF1D    mov         edx,dword ptr [ebp-0C]
 005BDF20    mov         eax,dword ptr [ebp-4]
 005BDF23    call        ToBytes
 005BDF28    mov         edx,dword ptr [ebp-28]
 005BDF2B    or          ecx,0FFFFFFFF
 005BDF2E    mov         eax,ebx
 005BDF30    mov         esi,dword ptr [eax]
 005BDF32    call        dword ptr [esi+88]
 005BDF38    xor         eax,eax
 005BDF3A    push        ebp
 005BDF3B    push        5BDF64
 005BDF40    push        dword ptr fs:[eax]
 005BDF43    mov         dword ptr fs:[eax],esp
 005BDF46    push        0
 005BDF48    lea         edx,[ebp-4]
 005BDF4B    mov         ecx,4
 005BDF50    mov         eax,ebx
 005BDF52    mov         esi,dword ptr [eax]
 005BDF54    call        dword ptr [esi+0B4]
 005BDF5A    xor         eax,eax
 005BDF5C    pop         edx
 005BDF5D    pop         ecx
 005BDF5E    pop         ecx
 005BDF5F    mov         dword ptr fs:[eax],edx
>005BDF62    jmp         005BDF8F
>005BDF64    jmp         @HandleAnyException
 005BDF69    lea         edx,[ebp-2C]
 005BDF6C    mov         eax,[0078CD98];^SResString670:TResStringRec
 005BDF71    call        LoadResString
 005BDF76    mov         ecx,dword ptr [ebp-2C]
 005BDF79    mov         dl,1
 005BDF7B    mov         eax,[005B03A8];EIdSocksServerRespondError
 005BDF80    call        EIdException.Create
 005BDF85    call        @RaiseExcept
 005BDF8A    call        @DoneExcept
 005BDF8F    mov         eax,dword ptr [ebp-4]
 005BDF92    movzx       eax,byte ptr [eax+1]
 005BDF96    cmp         eax,8
>005BDF99    ja          005BE0F6
 005BDF9F    jmp         dword ptr [eax*4+5BDFA6]
 005BDF9F    dd          005BE117
 005BDF9F    dd          005BDFCF
 005BDF9F    dd          005BDFF5
 005BDF9F    dd          005BE01B
 005BDF9F    dd          005BE041
 005BDF9F    dd          005BE067
 005BDF9F    dd          005BE08D
 005BDF9F    dd          005BE0B0
 005BDF9F    dd          005BE0D3
>005BDFCA    jmp         005BE117
 005BDFCF    lea         edx,[ebp-30]
 005BDFD2    mov         eax,[0078D0B0];^SResString673:TResStringRec
 005BDFD7    call        LoadResString
 005BDFDC    mov         ecx,dword ptr [ebp-30]
 005BDFDF    mov         dl,1
 005BDFE1    mov         eax,[005B05D4];EIdSocksServerGeneralError
 005BDFE6    call        EIdException.Create
 005BDFEB    call        @RaiseExcept
>005BDFF0    jmp         005BE117
 005BDFF5    lea         edx,[ebp-34]
 005BDFF8    mov         eax,[0078CC78];^SResString674:TResStringRec
 005BDFFD    call        LoadResString
 005BE002    mov         ecx,dword ptr [ebp-34]
 005BE005    mov         dl,1
 005BE007    mov         eax,[005B0694];EIdSocksServerPermissionError
 005BE00C    call        EIdException.Create
 005BE011    call        @RaiseExcept
>005BE016    jmp         005BE117
 005BE01B    lea         edx,[ebp-38]
 005BE01E    mov         eax,[0078CDC4];^SResString675:TResStringRec
 005BE023    call        LoadResString
 005BE028    mov         ecx,dword ptr [ebp-38]
 005BE02B    mov         dl,1
 005BE02D    mov         eax,[005B075C];EIdSocksServerNetUnreachableError
 005BE032    call        EIdException.Create
 005BE037    call        @RaiseExcept
>005BE03C    jmp         005BE117
 005BE041    lea         edx,[ebp-3C]
 005BE044    mov         eax,[0078D64C];^SResString676:TResStringRec
 005BE049    call        LoadResString
 005BE04E    mov         ecx,dword ptr [ebp-3C]
 005BE051    mov         dl,1
 005BE053    mov         eax,[005B082C];EIdSocksServerHostUnreachableError
 005BE058    call        EIdException.Create
 005BE05D    call        @RaiseExcept
>005BE062    jmp         005BE117
 005BE067    lea         edx,[ebp-40]
 005BE06A    mov         eax,[0078D0F0];^SResString677:TResStringRec
 005BE06F    call        LoadResString
 005BE074    mov         ecx,dword ptr [ebp-40]
 005BE077    mov         dl,1
 005BE079    mov         eax,[005B08FC];EIdSocksServerConnectionRefusedError
 005BE07E    call        EIdException.Create
 005BE083    call        @RaiseExcept
>005BE088    jmp         005BE117
 005BE08D    lea         edx,[ebp-44]
 005BE090    mov         eax,[0078D1C8];^SResString678:TResStringRec
 005BE095    call        LoadResString
 005BE09A    mov         ecx,dword ptr [ebp-44]
 005BE09D    mov         dl,1
 005BE09F    mov         eax,[005B09D4];EIdSocksServerTTLExpiredError
 005BE0A4    call        EIdException.Create
 005BE0A9    call        @RaiseExcept
>005BE0AE    jmp         005BE117
 005BE0B0    lea         edx,[ebp-48]
 005BE0B3    mov         eax,[0078CF2C];^SResString679:TResStringRec
 005BE0B8    call        LoadResString
 005BE0BD    mov         ecx,dword ptr [ebp-48]
 005BE0C0    mov         dl,1
 005BE0C2    mov         eax,[005B0A9C];EIdSocksServerCommandError
 005BE0C7    call        EIdException.Create
 005BE0CC    call        @RaiseExcept
>005BE0D1    jmp         005BE117
 005BE0D3    lea         edx,[ebp-4C]
 005BE0D6    mov         eax,[0078D9D8];^SResString680:TResStringRec
 005BE0DB    call        LoadResString
 005BE0E0    mov         ecx,dword ptr [ebp-4C]
 005BE0E3    mov         dl,1
 005BE0E5    mov         eax,[005B0B5C];EIdSocksServerAddressError
 005BE0EA    call        EIdException.Create
 005BE0EF    call        @RaiseExcept
>005BE0F4    jmp         005BE117
 005BE0F6    lea         edx,[ebp-50]
 005BE0F9    mov         eax,[0078D5C4];^SResString669:TResStringRec
 005BE0FE    call        LoadResString
 005BE103    mov         ecx,dword ptr [ebp-50]
 005BE106    mov         dl,1
 005BE108    mov         eax,[005B02F0];EIdSocksUnknownError
 005BE10D    call        EIdException.Create
 005BE112    call        @RaiseExcept
 005BE117    mov         eax,dword ptr [ebp-4]
 005BE11A    movzx       eax,byte ptr [eax+3]
 005BE11E    mov         byte ptr [ebp-11],al
 005BE121    movzx       eax,byte ptr [ebp-11]
 005BE125    dec         al
>005BE127    je          005BE133
 005BE129    sub         al,2
>005BE12B    je          005BE13C
 005BE12D    dec         al
>005BE12F    je          005BE14B
>005BE131    jmp         005BE152
 005BE133    mov         dword ptr [ebp-0C],6
>005BE13A    jmp         005BE152
 005BE13C    mov         eax,dword ptr [ebp-4]
 005BE13F    movzx       eax,byte ptr [eax+4]
 005BE143    add         eax,2
 005BE146    mov         dword ptr [ebp-0C],eax
>005BE149    jmp         005BE152
 005BE14B    mov         dword ptr [ebp-0C],12
 005BE152    xor         eax,eax
 005BE154    push        ebp
 005BE155    push        5BE2C0
 005BE15A    push        dword ptr fs:[eax]
 005BE15D    mov         dword ptr fs:[eax],esp
 005BE160    push        0
 005BE162    lea         edx,[ebp-4]
 005BE165    mov         ecx,dword ptr [ebp-0C]
 005BE168    mov         eax,ebx
 005BE16A    mov         esi,dword ptr [eax]
 005BE16C    call        dword ptr [esi+0B4]
 005BE172    movzx       eax,byte ptr [ebp-11]
 005BE176    dec         al
>005BE178    je          005BE18F
 005BE17A    sub         al,2
>005BE17C    je          005BE21D
 005BE182    dec         al
>005BE184    je          005BE278
>005BE18A    jmp         005BE2B6
 005BE18F    push        0
 005BE191    lea         edx,[ebp-58]
 005BE194    mov         eax,dword ptr [ebp-4]
 005BE197    movzx       eax,byte ptr [eax]
 005BE19A    call        IntToStr
 005BE19F    push        dword ptr [ebp-58]
 005BE1A2    push        5BE36C;'.'
 005BE1A7    lea         edx,[ebp-5C]
 005BE1AA    mov         eax,dword ptr [ebp-4]
 005BE1AD    movzx       eax,byte ptr [eax+1]
 005BE1B1    call        IntToStr
 005BE1B6    push        dword ptr [ebp-5C]
 005BE1B9    push        5BE36C;'.'
 005BE1BE    lea         edx,[ebp-60]
 005BE1C1    mov         eax,dword ptr [ebp-4]
 005BE1C4    movzx       eax,byte ptr [eax+2]
 005BE1C8    call        IntToStr
 005BE1CD    push        dword ptr [ebp-60]
 005BE1D0    push        5BE36C;'.'
 005BE1D5    lea         edx,[ebp-64]
 005BE1D8    mov         eax,dword ptr [ebp-4]
 005BE1DB    movzx       eax,byte ptr [eax+3]
 005BE1DF    call        IntToStr
 005BE1E4    push        dword ptr [ebp-64]
 005BE1E7    lea         eax,[ebp-54]
 005BE1EA    mov         edx,7
 005BE1EF    call        @UStrCatN
 005BE1F4    mov         edx,dword ptr [ebp-54]
 005BE1F7    mov         eax,dword ptr [ebp-4]
 005BE1FA    movzx       eax,byte ptr [eax+4]
 005BE1FE    mov         ecx,eax
 005BE200    shl         ecx,8
 005BE203    mov         eax,dword ptr [ebp-4]
 005BE206    movzx       eax,byte ptr [eax+5]
 005BE20A    add         cx,ax
 005BE20D    mov         eax,dword ptr [ebx+0D8]
 005BE213    call        TIdSocketHandle.SetPeer
>005BE218    jmp         005BE2B6
 005BE21D    mov         esi,ebx
 005BE21F    movzx       eax,byte ptr [esi+106]
 005BE226    push        eax
 005BE227    lea         eax,[ebp-68]
 005BE22A    push        eax
 005BE22B    push        0
 005BE22D    lea         eax,[ebp-6C]
 005BE230    push        eax
 005BE231    mov         ecx,dword ptr [ebp-0C]
 005BE234    sub         ecx,2
 005BE237    xor         edx,edx
 005BE239    mov         eax,dword ptr [ebp-4]
 005BE23C    call        BytesToString
 005BE241    mov         edx,dword ptr [ebp-6C]
 005BE244    mov         eax,[0078D940];^gvar_00789ED0
 005BE249    mov         eax,dword ptr [eax]
 005BE24B    xor         ecx,ecx
 005BE24D    call        TIdStack.ResolveHost
 005BE252    mov         edx,dword ptr [ebp-68]
 005BE255    mov         eax,dword ptr [ebp-4]
 005BE258    movzx       eax,byte ptr [eax+4]
 005BE25C    mov         ecx,eax
 005BE25E    shl         ecx,8
 005BE261    mov         eax,dword ptr [ebp-4]
 005BE264    movzx       eax,byte ptr [eax+5]
 005BE268    add         cx,ax
 005BE26B    mov         eax,dword ptr [esi+0D8]
 005BE271    call        TIdSocketHandle.SetPeer
>005BE276    jmp         005BE2B6
 005BE278    lea         edx,[ebp-22]
 005BE27B    xor         ecx,ecx
 005BE27D    mov         eax,dword ptr [ebp-4]
 005BE280    call        BytesToIPv6
 005BE285    push        1
 005BE287    lea         edx,[ebp-70]
 005BE28A    lea         eax,[ebp-22]
 005BE28D    call        IPv6AddressToStr
 005BE292    mov         edx,dword ptr [ebp-70]
 005BE295    mov         eax,dword ptr [ebp-4]
 005BE298    movzx       eax,byte ptr [eax+10]
 005BE29C    mov         ecx,eax
 005BE29E    shl         ecx,8
 005BE2A1    mov         eax,dword ptr [ebp-4]
 005BE2A4    movzx       eax,byte ptr [eax+11]
 005BE2A8    add         cx,ax
 005BE2AB    mov         eax,dword ptr [ebx+0D8]
 005BE2B1    call        TIdSocketHandle.SetPeer
 005BE2B6    xor         eax,eax
 005BE2B8    pop         edx
 005BE2B9    pop         ecx
 005BE2BA    pop         ecx
 005BE2BB    mov         dword ptr fs:[eax],edx
>005BE2BE    jmp         005BE2EB
>005BE2C0    jmp         @HandleAnyException
 005BE2C5    lea         edx,[ebp-74]
 005BE2C8    mov         eax,[0078CD98];^SResString670:TResStringRec
 005BE2CD    call        LoadResString
 005BE2D2    mov         ecx,dword ptr [ebp-74]
 005BE2D5    mov         dl,1
 005BE2D7    mov         eax,[005B03A8];EIdSocksServerRespondError
 005BE2DC    call        EIdException.Create
 005BE2E1    call        @RaiseExcept
 005BE2E6    call        @DoneExcept
 005BE2EB    xor         eax,eax
 005BE2ED    pop         edx
 005BE2EE    pop         ecx
 005BE2EF    pop         ecx
 005BE2F0    mov         dword ptr fs:[eax],edx
 005BE2F3    push        5BE317
 005BE2F8    xor         edx,edx
 005BE2FA    mov         eax,dword ptr [ebp-10]
 005BE2FD    mov         ecx,dword ptr [eax]
 005BE2FF    call        dword ptr [ecx+54]
 005BE302    mov         eax,dword ptr [ebp-10]
 005BE305    xor         edx,edx
 005BE307    mov         dword ptr [ebp-10],edx
 005BE30A    call        TObject.Free
 005BE30F    ret
>005BE310    jmp         @HandleFinally
>005BE315    jmp         005BE2F8
 005BE317    xor         eax,eax
 005BE319    pop         edx
 005BE31A    pop         ecx
 005BE31B    pop         ecx
 005BE31C    mov         dword ptr fs:[eax],edx
 005BE31F    push        5BE355
 005BE324    lea         eax,[ebp-74]
 005BE327    mov         edx,13
 005BE32C    call        @UStrArrayClr
 005BE331    lea         eax,[ebp-28]
 005BE334    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BE33A    call        @DynArrayClear
 005BE33F    lea         eax,[ebp-4]
 005BE342    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BE348    call        @DynArrayClear
 005BE34D    ret
>005BE34E    jmp         @HandleFinally
>005BE353    jmp         005BE324
 005BE355    pop         edi
 005BE356    pop         esi
 005BE357    pop         ebx
 005BE358    mov         esp,ebp
 005BE35A    pop         ebp
 005BE35B    ret         8
*}
end;

//005BE370
procedure TIdSocksInfo.Bind(AIOHandler:TIdIOHandler; AHost:string; AIPVersion:TIdIPVersion; APort:Word);
begin
{*
 005BE370    push        ebp
 005BE371    mov         ebp,esp
 005BE373    push        ebx
 005BE374    movzx       ebx,byte ptr [eax+0A9]
 005BE37B    dec         ebx
 005BE37C    sub         bl,2
>005BE37F    jb          005BE385
>005BE381    je          005BE391
>005BE383    jmp         005BE3A0
 005BE385    movzx       ebx,word ptr [ebp+0C]
 005BE389    push        ebx
 005BE38A    call        TIdSocksInfo.MakeSocks4Bind
>005BE38F    jmp         005BE3A0
 005BE391    movzx       ebx,word ptr [ebp+0C]
 005BE395    push        ebx
 005BE396    movzx       ebx,byte ptr [ebp+8]
 005BE39A    push        ebx
 005BE39B    call        TIdSocksInfo.MakeSocks5Bind
 005BE3A0    pop         ebx
 005BE3A1    pop         ebp
 005BE3A2    ret         8
*}
end;

//005BE3A8
function TIdSocksInfo.Listen(AIOHandler:TIdIOHandler; ATimeOut:Integer):Boolean;
begin
{*
 005BE3A8    push        ebx
 005BE3A9    push        esi
 005BE3AA    mov         esi,ecx
 005BE3AC    xor         ecx,ecx
 005BE3AE    movzx       ebx,byte ptr [eax+0A9]
 005BE3B5    dec         ebx
 005BE3B6    sub         bl,2
>005BE3B9    jb          005BE3BF
>005BE3BB    je          005BE3CA
>005BE3BD    jmp         005BE3D3
 005BE3BF    mov         ecx,esi
 005BE3C1    call        TIdSocksInfo.MakeSocks4Listen
 005BE3C6    mov         ecx,eax
>005BE3C8    jmp         005BE3D3
 005BE3CA    mov         ecx,esi
 005BE3CC    call        TIdSocksInfo.MakeSocks5Listen
 005BE3D1    mov         ecx,eax
 005BE3D3    mov         eax,ecx
 005BE3D5    pop         esi
 005BE3D6    pop         ebx
 005BE3D7    ret
*}
end;

//005BE3D8
function TIdSocksInfo.MakeSocks5Listen(AIOHandler:TIdIOHandler; const ATimeOut:Integer):Boolean;
begin
{*
 005BE3D8    push        ebp
 005BE3D9    mov         ebp,esp
 005BE3DB    push        ecx
 005BE3DC    mov         ecx,0B
 005BE3E1    push        0
 005BE3E3    push        0
 005BE3E5    dec         ecx
>005BE3E6    jne         005BE3E1
 005BE3E8    push        ecx
 005BE3E9    xchg        ecx,dword ptr [ebp-4]
 005BE3EC    push        ebx
 005BE3ED    push        esi
 005BE3EE    push        edi
 005BE3EF    mov         ebx,ecx
 005BE3F1    mov         esi,edx
 005BE3F3    xor         eax,eax
 005BE3F5    push        ebp
 005BE3F6    push        5BE77B
 005BE3FB    push        dword ptr fs:[eax]
 005BE3FE    mov         dword ptr fs:[eax],esp
 005BE401    push        0FF
 005BE406    lea         eax,[ebp-4]
 005BE409    mov         ecx,1
 005BE40E    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BE414    call        @DynArraySetLength
 005BE419    add         esp,4
 005BE41C    mov         eax,dword ptr [esi+0D8]
 005BE422    mov         edx,ebx
 005BE424    call        TIdSocketHandle.Readable
 005BE429    mov         ebx,eax
 005BE42B    test        bl,bl
>005BE42D    je          005BE752
 005BE433    push        0
 005BE435    lea         edx,[ebp-4]
 005BE438    mov         ecx,4
 005BE43D    mov         eax,esi
 005BE43F    mov         edi,dword ptr [eax]
 005BE441    call        dword ptr [edi+0B4]
 005BE447    mov         eax,dword ptr [ebp-4]
 005BE44A    movzx       eax,byte ptr [eax+1]
 005BE44E    cmp         eax,8
>005BE451    ja          005BE5AE
 005BE457    jmp         dword ptr [eax*4+5BE45E]
 005BE457    dd          005BE5CF
 005BE457    dd          005BE487
 005BE457    dd          005BE4AD
 005BE457    dd          005BE4D3
 005BE457    dd          005BE4F9
 005BE457    dd          005BE51F
 005BE457    dd          005BE545
 005BE457    dd          005BE568
 005BE457    dd          005BE58B
>005BE482    jmp         005BE5CF
 005BE487    lea         edx,[ebp-20]
 005BE48A    mov         eax,[0078D0B0];^SResString673:TResStringRec
 005BE48F    call        LoadResString
 005BE494    mov         ecx,dword ptr [ebp-20]
 005BE497    mov         dl,1
 005BE499    mov         eax,[005B05D4];EIdSocksServerGeneralError
 005BE49E    call        EIdException.Create
 005BE4A3    call        @RaiseExcept
>005BE4A8    jmp         005BE5CF
 005BE4AD    lea         edx,[ebp-24]
 005BE4B0    mov         eax,[0078CC78];^SResString674:TResStringRec
 005BE4B5    call        LoadResString
 005BE4BA    mov         ecx,dword ptr [ebp-24]
 005BE4BD    mov         dl,1
 005BE4BF    mov         eax,[005B0694];EIdSocksServerPermissionError
 005BE4C4    call        EIdException.Create
 005BE4C9    call        @RaiseExcept
>005BE4CE    jmp         005BE5CF
 005BE4D3    lea         edx,[ebp-28]
 005BE4D6    mov         eax,[0078CDC4];^SResString675:TResStringRec
 005BE4DB    call        LoadResString
 005BE4E0    mov         ecx,dword ptr [ebp-28]
 005BE4E3    mov         dl,1
 005BE4E5    mov         eax,[005B075C];EIdSocksServerNetUnreachableError
 005BE4EA    call        EIdException.Create
 005BE4EF    call        @RaiseExcept
>005BE4F4    jmp         005BE5CF
 005BE4F9    lea         edx,[ebp-2C]
 005BE4FC    mov         eax,[0078D64C];^SResString676:TResStringRec
 005BE501    call        LoadResString
 005BE506    mov         ecx,dword ptr [ebp-2C]
 005BE509    mov         dl,1
 005BE50B    mov         eax,[005B082C];EIdSocksServerHostUnreachableError
 005BE510    call        EIdException.Create
 005BE515    call        @RaiseExcept
>005BE51A    jmp         005BE5CF
 005BE51F    lea         edx,[ebp-30]
 005BE522    mov         eax,[0078D0F0];^SResString677:TResStringRec
 005BE527    call        LoadResString
 005BE52C    mov         ecx,dword ptr [ebp-30]
 005BE52F    mov         dl,1
 005BE531    mov         eax,[005B08FC];EIdSocksServerConnectionRefusedError
 005BE536    call        EIdException.Create
 005BE53B    call        @RaiseExcept
>005BE540    jmp         005BE5CF
 005BE545    lea         edx,[ebp-34]
 005BE548    mov         eax,[0078D1C8];^SResString678:TResStringRec
 005BE54D    call        LoadResString
 005BE552    mov         ecx,dword ptr [ebp-34]
 005BE555    mov         dl,1
 005BE557    mov         eax,[005B09D4];EIdSocksServerTTLExpiredError
 005BE55C    call        EIdException.Create
 005BE561    call        @RaiseExcept
>005BE566    jmp         005BE5CF
 005BE568    lea         edx,[ebp-38]
 005BE56B    mov         eax,[0078CF2C];^SResString679:TResStringRec
 005BE570    call        LoadResString
 005BE575    mov         ecx,dword ptr [ebp-38]
 005BE578    mov         dl,1
 005BE57A    mov         eax,[005B0A9C];EIdSocksServerCommandError
 005BE57F    call        EIdException.Create
 005BE584    call        @RaiseExcept
>005BE589    jmp         005BE5CF
 005BE58B    lea         edx,[ebp-3C]
 005BE58E    mov         eax,[0078D9D8];^SResString680:TResStringRec
 005BE593    call        LoadResString
 005BE598    mov         ecx,dword ptr [ebp-3C]
 005BE59B    mov         dl,1
 005BE59D    mov         eax,[005B0B5C];EIdSocksServerAddressError
 005BE5A2    call        EIdException.Create
 005BE5A7    call        @RaiseExcept
>005BE5AC    jmp         005BE5CF
 005BE5AE    lea         edx,[ebp-40]
 005BE5B1    mov         eax,[0078D5C4];^SResString669:TResStringRec
 005BE5B6    call        LoadResString
 005BE5BB    mov         ecx,dword ptr [ebp-40]
 005BE5BE    mov         dl,1
 005BE5C0    mov         eax,[005B02F0];EIdSocksUnknownError
 005BE5C5    call        EIdException.Create
 005BE5CA    call        @RaiseExcept
 005BE5CF    mov         eax,dword ptr [ebp-4]
 005BE5D2    movzx       eax,byte ptr [eax+3]
 005BE5D6    mov         byte ptr [ebp-9],al
 005BE5D9    movzx       eax,byte ptr [ebp-9]
 005BE5DD    dec         al
>005BE5DF    je          005BE5E7
 005BE5E1    sub         al,2
>005BE5E3    je          005BE5F0
>005BE5E5    jmp         005BE5FF
 005BE5E7    mov         dword ptr [ebp-8],6
>005BE5EE    jmp         005BE606
 005BE5F0    mov         eax,dword ptr [ebp-4]
 005BE5F3    movzx       eax,byte ptr [eax+4]
 005BE5F7    add         eax,2
 005BE5FA    mov         dword ptr [ebp-8],eax
>005BE5FD    jmp         005BE606
 005BE5FF    mov         dword ptr [ebp-8],12
 005BE606    push        0
 005BE608    lea         edx,[ebp-4]
 005BE60B    mov         ecx,dword ptr [ebp-8]
 005BE60E    mov         eax,esi
 005BE610    mov         edi,dword ptr [eax]
 005BE612    call        dword ptr [edi+0B4]
 005BE618    movzx       eax,byte ptr [ebp-9]
 005BE61C    dec         al
>005BE61E    je          005BE62D
 005BE620    sub         al,2
>005BE622    je          005BE6BB
>005BE628    jmp         005BE714
 005BE62D    push        0
 005BE62F    lea         edx,[ebp-48]
 005BE632    mov         eax,dword ptr [ebp-4]
 005BE635    movzx       eax,byte ptr [eax]
 005BE638    call        IntToStr
 005BE63D    push        dword ptr [ebp-48]
 005BE640    push        5BE798;'.'
 005BE645    lea         edx,[ebp-4C]
 005BE648    mov         eax,dword ptr [ebp-4]
 005BE64B    movzx       eax,byte ptr [eax+1]
 005BE64F    call        IntToStr
 005BE654    push        dword ptr [ebp-4C]
 005BE657    push        5BE798;'.'
 005BE65C    lea         edx,[ebp-50]
 005BE65F    mov         eax,dword ptr [ebp-4]
 005BE662    movzx       eax,byte ptr [eax+2]
 005BE666    call        IntToStr
 005BE66B    push        dword ptr [ebp-50]
 005BE66E    push        5BE798;'.'
 005BE673    lea         edx,[ebp-54]
 005BE676    mov         eax,dword ptr [ebp-4]
 005BE679    movzx       eax,byte ptr [eax+3]
 005BE67D    call        IntToStr
 005BE682    push        dword ptr [ebp-54]
 005BE685    lea         eax,[ebp-44]
 005BE688    mov         edx,7
 005BE68D    call        @UStrCatN
 005BE692    mov         edx,dword ptr [ebp-44]
 005BE695    mov         eax,dword ptr [ebp-4]
 005BE698    movzx       eax,byte ptr [eax+4]
 005BE69C    mov         ecx,eax
 005BE69E    shl         ecx,8
 005BE6A1    mov         eax,dword ptr [ebp-4]
 005BE6A4    movzx       eax,byte ptr [eax+5]
 005BE6A8    add         cx,ax
 005BE6AB    mov         eax,dword ptr [esi+0D8]
 005BE6B1    call        TIdSocketHandle.SetPeer
>005BE6B6    jmp         005BE752
 005BE6BB    movzx       eax,byte ptr [esi+106]
 005BE6C2    push        eax
 005BE6C3    lea         eax,[ebp-58]
 005BE6C6    push        eax
 005BE6C7    push        0
 005BE6C9    lea         eax,[ebp-5C]
 005BE6CC    push        eax
 005BE6CD    mov         ecx,dword ptr [ebp-8]
 005BE6D0    sub         ecx,2
 005BE6D3    xor         edx,edx
 005BE6D5    mov         eax,dword ptr [ebp-4]
 005BE6D8    call        BytesToString
 005BE6DD    mov         edx,dword ptr [ebp-5C]
 005BE6E0    mov         eax,[0078D940];^gvar_00789ED0
 005BE6E5    mov         eax,dword ptr [eax]
 005BE6E7    xor         ecx,ecx
 005BE6E9    call        TIdStack.ResolveHost
 005BE6EE    mov         edx,dword ptr [ebp-58]
 005BE6F1    mov         eax,dword ptr [ebp-4]
 005BE6F4    movzx       eax,byte ptr [eax+4]
 005BE6F8    mov         ecx,eax
 005BE6FA    shl         ecx,8
 005BE6FD    mov         eax,dword ptr [ebp-4]
 005BE700    movzx       eax,byte ptr [eax+5]
 005BE704    add         cx,ax
 005BE707    mov         eax,dword ptr [esi+0D8]
 005BE70D    call        TIdSocketHandle.SetPeer
>005BE712    jmp         005BE752
 005BE714    lea         edx,[ebp-1A]
 005BE717    xor         ecx,ecx
 005BE719    mov         eax,dword ptr [ebp-4]
 005BE71C    call        BytesToIPv6
 005BE721    push        1
 005BE723    lea         edx,[ebp-60]
 005BE726    lea         eax,[ebp-1A]
 005BE729    call        IPv6AddressToStr
 005BE72E    mov         edx,dword ptr [ebp-60]
 005BE731    mov         eax,dword ptr [ebp-4]
 005BE734    movzx       eax,byte ptr [eax+10]
 005BE738    mov         ecx,eax
 005BE73A    shl         ecx,8
 005BE73D    mov         eax,dword ptr [ebp-4]
 005BE740    movzx       eax,byte ptr [eax+11]
 005BE744    add         cx,ax
 005BE747    mov         eax,dword ptr [esi+0D8]
 005BE74D    call        TIdSocketHandle.SetPeer
 005BE752    xor         eax,eax
 005BE754    pop         edx
 005BE755    pop         ecx
 005BE756    pop         ecx
 005BE757    mov         dword ptr fs:[eax],edx
 005BE75A    push        5BE782
 005BE75F    lea         eax,[ebp-60]
 005BE762    mov         edx,11
 005BE767    call        @UStrArrayClr
 005BE76C    lea         eax,[ebp-4]
 005BE76F    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BE775    call        @DynArrayClear
 005BE77A    ret
>005BE77B    jmp         @HandleFinally
>005BE780    jmp         005BE75F
 005BE782    mov         eax,ebx
 005BE784    pop         edi
 005BE785    pop         esi
 005BE786    pop         ebx
 005BE787    mov         esp,ebp
 005BE789    pop         ebp
 005BE78A    ret
*}
end;

//005BE79C
function TIdSocksInfo.MakeSocks4Listen(AIOHandler:TIdIOHandler; const ATimeOut:Integer):Boolean;
begin
{*
 005BE79C    push        ebp
 005BE79D    mov         ebp,esp
 005BE79F    push        ecx
 005BE7A0    mov         ecx,4
 005BE7A5    push        0
 005BE7A7    push        0
 005BE7A9    dec         ecx
>005BE7AA    jne         005BE7A5
 005BE7AC    push        ecx
 005BE7AD    xchg        ecx,dword ptr [ebp-4]
 005BE7B0    push        ebx
 005BE7B1    push        esi
 005BE7B2    push        edi
 005BE7B3    mov         ebx,ecx
 005BE7B5    mov         esi,edx
 005BE7B7    xor         eax,eax
 005BE7B9    push        ebp
 005BE7BA    push        5BE975
 005BE7BF    push        dword ptr fs:[eax]
 005BE7C2    mov         dword ptr fs:[eax],esp
 005BE7C5    push        6
 005BE7C7    lea         eax,[ebp-4]
 005BE7CA    mov         ecx,1
 005BE7CF    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BE7D5    call        @DynArraySetLength
 005BE7DA    add         esp,4
 005BE7DD    mov         eax,dword ptr [esi+0D8]
 005BE7E3    mov         edx,ebx
 005BE7E5    call        TIdSocketHandle.Readable
 005BE7EA    mov         ebx,eax
 005BE7EC    test        bl,bl
>005BE7EE    je          005BE94C
 005BE7F4    push        0
 005BE7F6    lea         edx,[ebp-4]
 005BE7F9    mov         ecx,2
 005BE7FE    mov         eax,esi
 005BE800    mov         edi,dword ptr [eax]
 005BE802    call        dword ptr [edi+0B4]
 005BE808    mov         eax,dword ptr [ebp-4]
 005BE80B    movzx       eax,byte ptr [eax+1]
 005BE80F    sub         al,5A
>005BE811    je          005BE8AF
 005BE817    dec         al
>005BE819    je          005BE825
 005BE81B    dec         al
>005BE81D    je          005BE848
 005BE81F    dec         al
>005BE821    je          005BE86B
>005BE823    jmp         005BE88E
 005BE825    lea         edx,[ebp-8]
 005BE828    mov         eax,[0078D384];^SResString666:TResStringRec
 005BE82D    call        LoadResString
 005BE832    mov         ecx,dword ptr [ebp-8]
 005BE835    mov         dl,1
 005BE837    mov         eax,[005B00B4];EIdSocksRequestFailed
 005BE83C    call        EIdException.Create
 005BE841    call        @RaiseExcept
>005BE846    jmp         005BE8AF
 005BE848    lea         edx,[ebp-0C]
 005BE84B    mov         eax,[0078CE14];^SResString667:TResStringRec
 005BE850    call        LoadResString
 005BE855    mov         ecx,dword ptr [ebp-0C]
 005BE858    mov         dl,1
 005BE85A    mov         eax,[005B016C];EIdSocksRequestServerFailed
 005BE85F    call        EIdException.Create
 005BE864    call        @RaiseExcept
>005BE869    jmp         005BE8AF
 005BE86B    lea         edx,[ebp-10]
 005BE86E    mov         eax,[0078D5C8];^SResString668:TResStringRec
 005BE873    call        LoadResString
 005BE878    mov         ecx,dword ptr [ebp-10]
 005BE87B    mov         dl,1
 005BE87D    mov         eax,[005B0230];EIdSocksRequestIdentFailed
 005BE882    call        EIdException.Create
 005BE887    call        @RaiseExcept
>005BE88C    jmp         005BE8AF
 005BE88E    lea         edx,[ebp-14]
 005BE891    mov         eax,[0078D5C4];^SResString669:TResStringRec
 005BE896    call        LoadResString
 005BE89B    mov         ecx,dword ptr [ebp-14]
 005BE89E    mov         dl,1
 005BE8A0    mov         eax,[005B02F0];EIdSocksUnknownError
 005BE8A5    call        EIdException.Create
 005BE8AA    call        @RaiseExcept
 005BE8AF    push        0
 005BE8B1    lea         edx,[ebp-4]
 005BE8B4    mov         ecx,6
 005BE8B9    mov         eax,esi
 005BE8BB    mov         edi,dword ptr [eax]
 005BE8BD    call        dword ptr [edi+0B4]
 005BE8C3    push        0
 005BE8C5    lea         edx,[ebp-1C]
 005BE8C8    mov         eax,dword ptr [ebp-4]
 005BE8CB    movzx       eax,byte ptr [eax+2]
 005BE8CF    call        IntToStr
 005BE8D4    push        dword ptr [ebp-1C]
 005BE8D7    push        5BE994;'.'
 005BE8DC    lea         edx,[ebp-20]
 005BE8DF    mov         eax,dword ptr [ebp-4]
 005BE8E2    movzx       eax,byte ptr [eax+3]
 005BE8E6    call        IntToStr
 005BE8EB    push        dword ptr [ebp-20]
 005BE8EE    push        5BE994;'.'
 005BE8F3    lea         edx,[ebp-24]
 005BE8F6    mov         eax,dword ptr [ebp-4]
 005BE8F9    movzx       eax,byte ptr [eax+4]
 005BE8FD    call        IntToStr
 005BE902    push        dword ptr [ebp-24]
 005BE905    push        5BE994;'.'
 005BE90A    lea         edx,[ebp-28]
 005BE90D    mov         eax,dword ptr [ebp-4]
 005BE910    movzx       eax,byte ptr [eax+5]
 005BE914    call        IntToStr
 005BE919    push        dword ptr [ebp-28]
 005BE91C    lea         eax,[ebp-18]
 005BE91F    mov         edx,7
 005BE924    call        @UStrCatN
 005BE929    mov         edx,dword ptr [ebp-18]
 005BE92C    mov         eax,dword ptr [ebp-4]
 005BE92F    movzx       eax,byte ptr [eax]
 005BE932    mov         ecx,eax
 005BE934    shl         ecx,8
 005BE937    mov         eax,dword ptr [ebp-4]
 005BE93A    movzx       eax,byte ptr [eax+1]
 005BE93E    add         cx,ax
 005BE941    mov         eax,dword ptr [esi+0D8]
 005BE947    call        TIdSocketHandle.SetPeer
 005BE94C    xor         eax,eax
 005BE94E    pop         edx
 005BE94F    pop         ecx
 005BE950    pop         ecx
 005BE951    mov         dword ptr fs:[eax],edx
 005BE954    push        5BE97C
 005BE959    lea         eax,[ebp-28]
 005BE95C    mov         edx,9
 005BE961    call        @UStrArrayClr
 005BE966    lea         eax,[ebp-4]
 005BE969    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BE96F    call        @DynArrayClear
 005BE974    ret
>005BE975    jmp         @HandleFinally
>005BE97A    jmp         005BE959
 005BE97C    mov         eax,ebx
 005BE97E    pop         edi
 005BE97F    pop         esi
 005BE980    pop         ebx
 005BE981    mov         esp,ebp
 005BE983    pop         ebp
 005BE984    ret
*}
end;

//005BE998
procedure TIdSocksInfo.CloseSocks5UDPAssociation;
begin
{*
 005BE998    push        esi
 005BE999    mov         esi,dword ptr [eax+0AC]
 005BE99F    test        esi,esi
>005BE9A1    je          005BE9AD
 005BE9A3    mov         eax,esi
 005BE9A5    mov         edx,dword ptr [eax]
 005BE9A7    call        dword ptr [edx+80]
 005BE9AD    pop         esi
 005BE9AE    ret
*}
end;

//005BE9B0
procedure TIdSocksInfo.MakeSocks5UDPAssociation(AHandle:TIdSocketHandle);
begin
{*
 005BE9B0    push        ebp
 005BE9B1    mov         ebp,esp
 005BE9B3    mov         ecx,7
 005BE9B8    push        0
 005BE9BA    push        0
 005BE9BC    dec         ecx
>005BE9BD    jne         005BE9B8
 005BE9BF    push        ecx
 005BE9C0    push        ebx
 005BE9C1    push        esi
 005BE9C2    push        edi
 005BE9C3    mov         esi,edx
 005BE9C5    mov         dword ptr [ebp-8],eax
 005BE9C8    xor         eax,eax
 005BE9CA    push        ebp
 005BE9CB    push        5BEE2A
 005BE9D0    push        dword ptr fs:[eax]
 005BE9D3    mov         dword ptr fs:[eax],esp
 005BE9D6    mov         eax,dword ptr [ebp-8]
 005BE9D9    mov         edx,dword ptr [eax+90]
 005BE9DF    mov         eax,dword ptr [ebp-8]
 005BE9E2    mov         eax,dword ptr [eax+0AC]
 005BE9E8    mov         ecx,dword ptr [eax]
 005BE9EA    call        dword ptr [ecx+50]
 005BE9ED    mov         eax,dword ptr [ebp-8]
 005BE9F0    movzx       edx,word ptr [eax+98]
 005BE9F7    mov         eax,dword ptr [ebp-8]
 005BE9FA    mov         eax,dword ptr [eax+0AC]
 005BEA00    mov         ecx,dword ptr [eax]
 005BEA02    call        dword ptr [ecx+54]
 005BEA05    mov         edx,dword ptr [ebp-8]
 005BEA08    movzx       edx,byte ptr [edx+9A]
 005BEA0F    mov         eax,dword ptr [ebp-8]
 005BEA12    mov         eax,dword ptr [eax+0AC]
 005BEA18    mov         byte ptr [eax+106],dl
 005BEA1E    mov         edx,dword ptr [ebp-8]
 005BEA21    movzx       ebx,byte ptr [edx+9A]
 005BEA28    mov         edx,dword ptr [eax]
 005BEA2A    call        dword ptr [edx+8C]
 005BEA30    xor         edx,edx
 005BEA32    push        ebp
 005BEA33    push        5BEDC7
 005BEA38    push        dword ptr fs:[edx]
 005BEA3B    mov         dword ptr fs:[edx],esp
 005BEA3E    push        0FF
 005BEA43    lea         eax,[ebp-4]
 005BEA46    mov         ecx,1
 005BEA4B    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BEA51    call        @DynArraySetLength
 005BEA56    add         esp,4
 005BEA59    mov         eax,dword ptr [ebp-8]
 005BEA5C    mov         edx,dword ptr [eax+0AC]
 005BEA62    mov         eax,dword ptr [ebp-8]
 005BEA65    call        TIdSocksInfo.AuthenticateSocks5Connection
 005BEA6A    mov         eax,dword ptr [ebp-8]
 005BEA6D    cmp         byte ptr [eax+9A],0
>005BEA74    jne         005BEA9A
 005BEA76    push        0
 005BEA78    push        3
 005BEA7A    lea         eax,[ebp-4]
 005BEA7D    push        eax
 005BEA7E    lea         eax,[ebp-0C]
 005BEA81    push        eax
 005BEA82    mov         eax,dword ptr [ebp-8]
 005BEA85    mov         edx,dword ptr [eax+0AC]
 005BEA8B    mov         ecx,5BEE44;'0.0.0.0'
 005BEA90    mov         eax,dword ptr [ebp-8]
 005BEA93    call        TIdSocksInfo.MakeSocks5Request
>005BEA98    jmp         005BEABC
 005BEA9A    push        0
 005BEA9C    push        3
 005BEA9E    lea         eax,[ebp-4]
 005BEAA1    push        eax
 005BEAA2    lea         eax,[ebp-0C]
 005BEAA5    push        eax
 005BEAA6    mov         eax,dword ptr [ebp-8]
 005BEAA9    mov         edx,dword ptr [eax+0AC]
 005BEAAF    mov         ecx,5BEE60;'::0'
 005BEAB4    mov         eax,dword ptr [ebp-8]
 005BEAB7    call        TIdSocksInfo.MakeSocks5Request
 005BEABC    push        0
 005BEABE    lea         eax,[ebp-10]
 005BEAC1    push        eax
 005BEAC2    xor         ecx,ecx
 005BEAC4    mov         edx,dword ptr [ebp-0C]
 005BEAC7    mov         eax,dword ptr [ebp-4]
 005BEACA    call        ToBytes
 005BEACF    mov         edx,dword ptr [ebp-10]
 005BEAD2    mov         eax,dword ptr [ebp-8]
 005BEAD5    mov         eax,dword ptr [eax+0AC]
 005BEADB    or          ecx,0FFFFFFFF
 005BEADE    mov         edi,dword ptr [eax]
 005BEAE0    call        dword ptr [edi+88]
 005BEAE6    xor         eax,eax
 005BEAE8    push        ebp
 005BEAE9    push        5BEB19
 005BEAEE    push        dword ptr fs:[eax]
 005BEAF1    mov         dword ptr fs:[eax],esp
 005BEAF4    push        0
 005BEAF6    lea         edx,[ebp-4]
 005BEAF9    mov         eax,dword ptr [ebp-8]
 005BEAFC    mov         eax,dword ptr [eax+0AC]
 005BEB02    mov         ecx,2
 005BEB07    mov         edi,dword ptr [eax]
 005BEB09    call        dword ptr [edi+0B4]
 005BEB0F    xor         eax,eax
 005BEB11    pop         edx
 005BEB12    pop         ecx
 005BEB13    pop         ecx
 005BEB14    mov         dword ptr fs:[eax],edx
>005BEB17    jmp         005BEB44
>005BEB19    jmp         @HandleAnyException
 005BEB1E    lea         edx,[ebp-14]
 005BEB21    mov         eax,[0078CD98];^SResString670:TResStringRec
 005BEB26    call        LoadResString
 005BEB2B    mov         ecx,dword ptr [ebp-14]
 005BEB2E    mov         dl,1
 005BEB30    mov         eax,[005B03A8];EIdSocksServerRespondError
 005BEB35    call        EIdException.Create
 005BEB3A    call        @RaiseExcept
 005BEB3F    call        @DoneExcept
 005BEB44    mov         eax,dword ptr [ebp-4]
 005BEB47    movzx       eax,byte ptr [eax+1]
 005BEB4B    cmp         eax,8
>005BEB4E    ja          005BECAB
 005BEB54    jmp         dword ptr [eax*4+5BEB5B]
 005BEB54    dd          005BECCC
 005BEB54    dd          005BEB84
 005BEB54    dd          005BEBAA
 005BEB54    dd          005BEBD0
 005BEB54    dd          005BEBF6
 005BEB54    dd          005BEC1C
 005BEB54    dd          005BEC42
 005BEB54    dd          005BEC65
 005BEB54    dd          005BEC88
>005BEB7F    jmp         005BECCC
 005BEB84    lea         edx,[ebp-18]
 005BEB87    mov         eax,[0078D0B0];^SResString673:TResStringRec
 005BEB8C    call        LoadResString
 005BEB91    mov         ecx,dword ptr [ebp-18]
 005BEB94    mov         dl,1
 005BEB96    mov         eax,[005B05D4];EIdSocksServerGeneralError
 005BEB9B    call        EIdException.Create
 005BEBA0    call        @RaiseExcept
>005BEBA5    jmp         005BECCC
 005BEBAA    lea         edx,[ebp-1C]
 005BEBAD    mov         eax,[0078CC78];^SResString674:TResStringRec
 005BEBB2    call        LoadResString
 005BEBB7    mov         ecx,dword ptr [ebp-1C]
 005BEBBA    mov         dl,1
 005BEBBC    mov         eax,[005B0694];EIdSocksServerPermissionError
 005BEBC1    call        EIdException.Create
 005BEBC6    call        @RaiseExcept
>005BEBCB    jmp         005BECCC
 005BEBD0    lea         edx,[ebp-20]
 005BEBD3    mov         eax,[0078CDC4];^SResString675:TResStringRec
 005BEBD8    call        LoadResString
 005BEBDD    mov         ecx,dword ptr [ebp-20]
 005BEBE0    mov         dl,1
 005BEBE2    mov         eax,[005B075C];EIdSocksServerNetUnreachableError
 005BEBE7    call        EIdException.Create
 005BEBEC    call        @RaiseExcept
>005BEBF1    jmp         005BECCC
 005BEBF6    lea         edx,[ebp-24]
 005BEBF9    mov         eax,[0078D64C];^SResString676:TResStringRec
 005BEBFE    call        LoadResString
 005BEC03    mov         ecx,dword ptr [ebp-24]
 005BEC06    mov         dl,1
 005BEC08    mov         eax,[005B082C];EIdSocksServerHostUnreachableError
 005BEC0D    call        EIdException.Create
 005BEC12    call        @RaiseExcept
>005BEC17    jmp         005BECCC
 005BEC1C    lea         edx,[ebp-28]
 005BEC1F    mov         eax,[0078D0F0];^SResString677:TResStringRec
 005BEC24    call        LoadResString
 005BEC29    mov         ecx,dword ptr [ebp-28]
 005BEC2C    mov         dl,1
 005BEC2E    mov         eax,[005B08FC];EIdSocksServerConnectionRefusedError
 005BEC33    call        EIdException.Create
 005BEC38    call        @RaiseExcept
>005BEC3D    jmp         005BECCC
 005BEC42    lea         edx,[ebp-2C]
 005BEC45    mov         eax,[0078D1C8];^SResString678:TResStringRec
 005BEC4A    call        LoadResString
 005BEC4F    mov         ecx,dword ptr [ebp-2C]
 005BEC52    mov         dl,1
 005BEC54    mov         eax,[005B09D4];EIdSocksServerTTLExpiredError
 005BEC59    call        EIdException.Create
 005BEC5E    call        @RaiseExcept
>005BEC63    jmp         005BECCC
 005BEC65    lea         edx,[ebp-30]
 005BEC68    mov         eax,[0078CF2C];^SResString679:TResStringRec
 005BEC6D    call        LoadResString
 005BEC72    mov         ecx,dword ptr [ebp-30]
 005BEC75    mov         dl,1
 005BEC77    mov         eax,[005B0A9C];EIdSocksServerCommandError
 005BEC7C    call        EIdException.Create
 005BEC81    call        @RaiseExcept
>005BEC86    jmp         005BECCC
 005BEC88    lea         edx,[ebp-34]
 005BEC8B    mov         eax,[0078D9D8];^SResString680:TResStringRec
 005BEC90    call        LoadResString
 005BEC95    mov         ecx,dword ptr [ebp-34]
 005BEC98    mov         dl,1
 005BEC9A    mov         eax,[005B0B5C];EIdSocksServerAddressError
 005BEC9F    call        EIdException.Create
 005BECA4    call        @RaiseExcept
>005BECA9    jmp         005BECCC
 005BECAB    lea         edx,[ebp-38]
 005BECAE    mov         eax,[0078D5C4];^SResString669:TResStringRec
 005BECB3    call        LoadResString
 005BECB8    mov         ecx,dword ptr [ebp-38]
 005BECBB    mov         dl,1
 005BECBD    mov         eax,[005B02F0];EIdSocksUnknownError
 005BECC2    call        EIdException.Create
 005BECC7    call        @RaiseExcept
 005BECCC    push        0
 005BECCE    lea         edx,[ebp-4]
 005BECD1    mov         eax,dword ptr [ebp-8]
 005BECD4    mov         eax,dword ptr [eax+0AC]
 005BECDA    mov         ecx,2
 005BECDF    mov         edi,dword ptr [eax]
 005BECE1    call        dword ptr [edi+0B4]
 005BECE7    mov         eax,dword ptr [ebp-4]
 005BECEA    movzx       eax,byte ptr [eax+1]
 005BECEE    dec         al
>005BECF0    je          005BECFC
 005BECF2    sub         al,2
>005BECF4    je          005BED07
 005BECF6    dec         al
>005BECF8    je          005BED16
>005BECFA    jmp         005BED1F
 005BECFC    mov         dword ptr [ebp-0C],6
 005BED03    xor         ebx,ebx
>005BED05    jmp         005BED1F
 005BED07    mov         eax,dword ptr [ebp-4]
 005BED0A    movzx       eax,byte ptr [eax+4]
 005BED0E    add         eax,2
 005BED11    mov         dword ptr [ebp-0C],eax
>005BED14    jmp         005BED1F
 005BED16    mov         dword ptr [ebp-0C],12
 005BED1D    mov         bl,1
 005BED1F    xor         eax,eax
 005BED21    push        ebp
 005BED22    push        5BED92
 005BED27    push        dword ptr fs:[eax]
 005BED2A    mov         dword ptr fs:[eax],esp
 005BED2D    push        0
 005BED2F    lea         edx,[ebp-4]
 005BED32    mov         eax,dword ptr [ebp-8]
 005BED35    mov         eax,dword ptr [eax+0AC]
 005BED3B    mov         ecx,dword ptr [ebp-0C]
 005BED3E    mov         edi,dword ptr [eax]
 005BED40    call        dword ptr [edi+0B4]
 005BED46    push        ebx
 005BED47    mov         eax,dword ptr [ebp-8]
 005BED4A    mov         eax,dword ptr [eax+0AC]
 005BED50    mov         edx,dword ptr ds:[5B8344];TIdIOHandlerStack
 005BED56    call        @AsClass
 005BED5B    mov         eax,dword ptr [eax+0D8]
 005BED61    mov         edx,dword ptr [eax+1C]
 005BED64    mov         eax,dword ptr [ebp-4]
 005BED67    movzx       eax,byte ptr [eax+4]
 005BED6B    mov         ecx,eax
 005BED6D    shl         ecx,8
 005BED70    mov         eax,dword ptr [ebp-4]
 005BED73    movzx       eax,byte ptr [eax+5]
 005BED77    add         cx,ax
 005BED7A    mov         eax,esi
 005BED7C    call        TIdSocketHandle.SetPeer
 005BED81    mov         eax,esi
 005BED83    mov         edx,dword ptr [eax]
 005BED85    call        dword ptr [edx+28]
 005BED88    xor         eax,eax
 005BED8A    pop         edx
 005BED8B    pop         ecx
 005BED8C    pop         ecx
 005BED8D    mov         dword ptr fs:[eax],edx
>005BED90    jmp         005BEDBD
>005BED92    jmp         @HandleAnyException
 005BED97    lea         edx,[ebp-3C]
 005BED9A    mov         eax,[0078CD98];^SResString670:TResStringRec
 005BED9F    call        LoadResString
 005BEDA4    mov         ecx,dword ptr [ebp-3C]
 005BEDA7    mov         dl,1
 005BEDA9    mov         eax,[005B03A8];EIdSocksServerRespondError
 005BEDAE    call        EIdException.Create
 005BEDB3    call        @RaiseExcept
 005BEDB8    call        @DoneExcept
 005BEDBD    xor         eax,eax
 005BEDBF    pop         edx
 005BEDC0    pop         ecx
 005BEDC1    pop         ecx
 005BEDC2    mov         dword ptr fs:[eax],edx
>005BEDC5    jmp         005BEDF3
>005BEDC7    jmp         @HandleOnException
 005BEDCC    dd          1
 005BEDD0    dd          00418C04;Exception
 005BEDD4    dd          005BEDD8
 005BEDD8    mov         eax,dword ptr [ebp-8]
 005BEDDB    mov         eax,dword ptr [eax+0AC]
 005BEDE1    mov         edx,dword ptr [eax]
 005BEDE3    call        dword ptr [edx+80]
 005BEDE9    call        @RaiseAgain
 005BEDEE    call        @DoneExcept
 005BEDF3    xor         eax,eax
 005BEDF5    pop         edx
 005BEDF6    pop         ecx
 005BEDF7    pop         ecx
 005BEDF8    mov         dword ptr fs:[eax],edx
 005BEDFB    push        5BEE31
 005BEE00    lea         eax,[ebp-3C]
 005BEE03    mov         edx,0B
 005BEE08    call        @UStrArrayClr
 005BEE0D    lea         eax,[ebp-10]
 005BEE10    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BEE16    call        @DynArrayClear
 005BEE1B    lea         eax,[ebp-4]
 005BEE1E    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BEE24    call        @DynArrayClear
 005BEE29    ret
>005BEE2A    jmp         @HandleFinally
>005BEE2F    jmp         005BEE00
 005BEE31    pop         edi
 005BEE32    pop         esi
 005BEE33    pop         ebx
 005BEE34    mov         esp,ebp
 005BEE36    pop         ebp
 005BEE37    ret
*}
end;

//005BEE68
procedure TIdSocksInfo.CloseUDP(AHandle:TIdSocketHandle);
begin
{*
 005BEE68    push        ebp
 005BEE69    mov         ebp,esp
 005BEE6B    push        0
 005BEE6D    xor         edx,edx
 005BEE6F    push        ebp
 005BEE70    push        5BEECA
 005BEE75    push        dword ptr fs:[edx]
 005BEE78    mov         dword ptr fs:[edx],esp
 005BEE7B    movzx       edx,byte ptr [eax+0A9]
 005BEE82    dec         edx
 005BEE83    sub         dl,2
>005BEE86    jb          005BEE8C
>005BEE88    je          005BEEAF
>005BEE8A    jmp         005BEEB4
 005BEE8C    lea         edx,[ebp-4]
 005BEE8F    mov         eax,[0078DAC8];^SResString665:TResStringRec
 005BEE94    call        LoadResString
 005BEE99    mov         ecx,dword ptr [ebp-4]
 005BEE9C    mov         dl,1
 005BEE9E    mov         eax,[005BC758];EIdSocksUDPNotSupportedBySOCKSVersion
 005BEEA3    call        EIdException.Create
 005BEEA8    call        @RaiseExcept
>005BEEAD    jmp         005BEEB4
 005BEEAF    call        TIdSocksInfo.CloseSocks5UDPAssociation
 005BEEB4    xor         eax,eax
 005BEEB6    pop         edx
 005BEEB7    pop         ecx
 005BEEB8    pop         ecx
 005BEEB9    mov         dword ptr fs:[eax],edx
 005BEEBC    push        5BEED1
 005BEEC1    lea         eax,[ebp-4]
 005BEEC4    call        @UStrClr
 005BEEC9    ret
>005BEECA    jmp         @HandleFinally
>005BEECF    jmp         005BEEC1
 005BEED1    pop         ecx
 005BEED2    pop         ebp
 005BEED3    ret
*}
end;

//005BEED4
procedure TIdSocksInfo.OpenUDP(AHandle:TIdSocketHandle; AHost:string; AIPVersion:TIdIPVersion; APort:Word);
begin
{*
 005BEED4    push        ebp
 005BEED5    mov         ebp,esp
 005BEED7    push        0
 005BEED9    push        ebx
 005BEEDA    xor         ecx,ecx
 005BEEDC    push        ebp
 005BEEDD    push        5BEF37
 005BEEE2    push        dword ptr fs:[ecx]
 005BEEE5    mov         dword ptr fs:[ecx],esp
 005BEEE8    movzx       ecx,byte ptr [eax+0A9]
 005BEEEF    dec         ecx
 005BEEF0    sub         cl,2
>005BEEF3    jb          005BEEF9
>005BEEF5    je          005BEF1C
>005BEEF7    jmp         005BEF21
 005BEEF9    lea         edx,[ebp-4]
 005BEEFC    mov         eax,[0078DAC8];^SResString665:TResStringRec
 005BEF01    call        LoadResString
 005BEF06    mov         ecx,dword ptr [ebp-4]
 005BEF09    mov         dl,1
 005BEF0B    mov         eax,[005BC758];EIdSocksUDPNotSupportedBySOCKSVersion
 005BEF10    call        EIdException.Create
 005BEF15    call        @RaiseExcept
>005BEF1A    jmp         005BEF21
 005BEF1C    call        TIdSocksInfo.MakeSocks5UDPAssociation
 005BEF21    xor         eax,eax
 005BEF23    pop         edx
 005BEF24    pop         ecx
 005BEF25    pop         ecx
 005BEF26    mov         dword ptr fs:[eax],edx
 005BEF29    push        5BEF3E
 005BEF2E    lea         eax,[ebp-4]
 005BEF31    call        @UStrClr
 005BEF36    ret
>005BEF37    jmp         @HandleFinally
>005BEF3C    jmp         005BEF2E
 005BEF3E    pop         ebx
 005BEF3F    pop         ecx
 005BEF40    pop         ebp
 005BEF41    ret         8
*}
end;

//005BEF44
function TIdSocksInfo.DisasmUDPReplyPacket(const APacket:TIdBytes; var VHost:UnicodeString; var VPort:TIdPort; var VIPVersion:TIdIPVersion):TIdBytes;
begin
{*
 005BEF44    push        ebp
 005BEF45    mov         ebp,esp
 005BEF47    push        ecx
 005BEF48    mov         ecx,6
 005BEF4D    push        0
 005BEF4F    push        0
 005BEF51    dec         ecx
>005BEF52    jne         005BEF4D
 005BEF54    xchg        ecx,dword ptr [ebp-4]
 005BEF57    push        ebx
 005BEF58    push        esi
 005BEF59    push        edi
 005BEF5A    mov         dword ptr [ebp-8],ecx
 005BEF5D    mov         esi,edx
 005BEF5F    xor         eax,eax
 005BEF61    push        ebp
 005BEF62    push        5BF150
 005BEF67    push        dword ptr fs:[eax]
 005BEF6A    mov         dword ptr fs:[eax],esp
 005BEF6D    mov         eax,esi
 005BEF6F    call        @DynArrayLength
 005BEF74    cmp         eax,5
>005BEF77    jl          005BF127
 005BEF7D    movzx       eax,byte ptr [esi+3]
 005BEF81    dec         al
>005BEF83    je          005BEF8E
 005BEF85    sub         al,2
>005BEF87    je          005BEFF6
>005BEF89    jmp         005BF05A
 005BEF8E    mov         edi,8
 005BEF93    lea         edx,[ebp-20]
 005BEF96    movzx       eax,byte ptr [esi+4]
 005BEF9A    call        IntToStr
 005BEF9F    push        dword ptr [ebp-20]
 005BEFA2    push        5BF16C;'.'
 005BEFA7    lea         edx,[ebp-24]
 005BEFAA    movzx       eax,byte ptr [esi+5]
 005BEFAE    call        IntToStr
 005BEFB3    push        dword ptr [ebp-24]
 005BEFB6    push        5BF16C;'.'
 005BEFBB    lea         edx,[ebp-28]
 005BEFBE    movzx       eax,byte ptr [esi+6]
 005BEFC2    call        IntToStr
 005BEFC7    push        dword ptr [ebp-28]
 005BEFCA    push        5BF16C;'.'
 005BEFCF    lea         edx,[ebp-2C]
 005BEFD2    movzx       eax,byte ptr [esi+7]
 005BEFD6    call        IntToStr
 005BEFDB    push        dword ptr [ebp-2C]
 005BEFDE    mov         eax,dword ptr [ebp-8]
 005BEFE1    mov         edx,7
 005BEFE6    call        @UStrCatN
 005BEFEB    mov         eax,dword ptr [ebp+0C]
 005BEFEE    mov         byte ptr [eax],0
>005BEFF1    jmp         005BF0D7
 005BEFF6    movzx       edi,byte ptr [esi+4]
 005BEFFA    add         edi,4
 005BEFFD    mov         eax,esi
 005BEFFF    call        @DynArrayLength
 005BF004    lea         edx,[edi+5]
 005BF007    cmp         eax,edx
>005BF009    jl          005BF127
 005BF00F    movzx       eax,byte ptr [esi+4]
 005BF013    push        eax
 005BF014    lea         eax,[ebp-4]
 005BF017    mov         ecx,1
 005BF01C    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BF022    call        @DynArraySetLength
 005BF027    add         esp,4
 005BF02A    push        0
 005BF02C    movzx       eax,byte ptr [esi+4]
 005BF030    push        eax
 005BF031    lea         ecx,[ebp-4]
 005BF034    mov         edx,5
 005BF039    mov         eax,esi
 005BF03B    call        CopyTIdBytes
 005BF040    lea         ecx,[ebp-30]
 005BF043    xor         edx,edx
 005BF045    mov         eax,dword ptr [ebp-4]
 005BF048    call        BytesToString
 005BF04D    mov         edx,dword ptr [ebp-30]
 005BF050    mov         eax,dword ptr [ebp-8]
 005BF053    call        @UStrAsg
>005BF058    jmp         005BF0D7
 005BF05A    mov         edi,14
 005BF05F    push        10
 005BF061    lea         eax,[ebp-4]
 005BF064    mov         ecx,1
 005BF069    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BF06F    call        @DynArraySetLength
 005BF074    add         esp,4
 005BF077    push        0
 005BF079    push        10
 005BF07B    lea         ecx,[ebp-4]
 005BF07E    mov         edx,5
 005BF083    mov         eax,esi
 005BF085    call        CopyTIdBytes
 005BF08A    lea         edx,[ebp-1C]
 005BF08D    xor         ecx,ecx
 005BF08F    mov         eax,dword ptr [ebp-4]
 005BF092    call        BytesToIPv6
 005BF097    mov         dword ptr [ebp-0C],8
 005BF09E    lea         ebx,[ebp-1C]
 005BF0A1    mov         eax,[0078D940];^gvar_00789ED0
 005BF0A6    mov         eax,dword ptr [eax]
 005BF0A8    movzx       edx,word ptr [ebx]
 005BF0AB    mov         ecx,dword ptr [eax]
 005BF0AD    call        dword ptr [ecx+54]
 005BF0B0    mov         word ptr [ebx],ax
 005BF0B3    add         ebx,2
 005BF0B6    dec         dword ptr [ebp-0C]
>005BF0B9    jne         005BF0A1
 005BF0BB    lea         edx,[ebp-34]
 005BF0BE    lea         eax,[ebp-1C]
 005BF0C1    call        IPv6AddressToStr
 005BF0C6    mov         edx,dword ptr [ebp-34]
 005BF0C9    mov         eax,dword ptr [ebp-8]
 005BF0CC    call        @UStrAsg
 005BF0D1    mov         eax,dword ptr [ebp+0C]
 005BF0D4    mov         byte ptr [eax],1
 005BF0D7    movzx       eax,byte ptr [esi+edi]
 005BF0DB    shl         eax,8
 005BF0DE    movzx       edx,byte ptr [esi+edi+1]
 005BF0E3    add         ax,dx
 005BF0E6    mov         edx,dword ptr [ebp+10]
 005BF0E9    mov         word ptr [edx],ax
 005BF0EC    add         edi,2
 005BF0EF    mov         eax,esi
 005BF0F1    call        @DynArrayLength
 005BF0F6    sub         eax,edi
 005BF0F8    push        eax
 005BF0F9    mov         eax,dword ptr [ebp+8]
 005BF0FC    mov         ecx,1
 005BF101    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BF107    call        @DynArraySetLength
 005BF10C    add         esp,4
 005BF10F    push        0
 005BF111    mov         eax,esi
 005BF113    call        @DynArrayLength
 005BF118    sub         eax,edi
 005BF11A    push        eax
 005BF11B    mov         ecx,dword ptr [ebp+8]
 005BF11E    mov         edx,edi
 005BF120    mov         eax,esi
 005BF122    call        CopyTIdBytes
 005BF127    xor         eax,eax
 005BF129    pop         edx
 005BF12A    pop         ecx
 005BF12B    pop         ecx
 005BF12C    mov         dword ptr fs:[eax],edx
 005BF12F    push        5BF157
 005BF134    lea         eax,[ebp-34]
 005BF137    mov         edx,6
 005BF13C    call        @UStrArrayClr
 005BF141    lea         eax,[ebp-4]
 005BF144    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BF14A    call        @DynArrayClear
 005BF14F    ret
>005BF150    jmp         @HandleFinally
>005BF155    jmp         005BF134
 005BF157    pop         edi
 005BF158    pop         esi
 005BF159    pop         ebx
 005BF15A    mov         esp,ebp
 005BF15C    pop         ebp
 005BF15D    ret         0C
*}
end;

//005BF170
function TIdSocksInfo.MakeUDPRequestPacket(const AData:TIdBytes; const AHost:UnicodeString; const APort:TIdPort):TIdBytes;
begin
{*
 005BF170    push        ebp
 005BF171    mov         ebp,esp
 005BF173    push        ecx
 005BF174    mov         ecx,4
 005BF179    push        0
 005BF17B    push        0
 005BF17D    dec         ecx
>005BF17E    jne         005BF179
 005BF180    push        ecx
 005BF181    xchg        ecx,dword ptr [ebp-4]
 005BF184    push        ebx
 005BF185    push        esi
 005BF186    mov         ebx,ecx
 005BF188    mov         dword ptr [ebp-8],edx
 005BF18B    xor         eax,eax
 005BF18D    push        ebp
 005BF18E    push        5BF425
 005BF193    push        dword ptr fs:[eax]
 005BF196    mov         dword ptr fs:[eax],esp
 005BF199    push        400
 005BF19E    mov         eax,dword ptr [ebp+8]
 005BF1A1    mov         ecx,1
 005BF1A6    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BF1AC    call        @DynArraySetLength
 005BF1B1    add         esp,4
 005BF1B4    mov         eax,dword ptr [ebp+8]
 005BF1B7    mov         eax,dword ptr [eax]
 005BF1B9    mov         byte ptr [eax],0
 005BF1BC    mov         eax,dword ptr [ebp+8]
 005BF1BF    mov         eax,dword ptr [eax]
 005BF1C1    mov         byte ptr [eax+1],0
 005BF1C5    mov         eax,dword ptr [ebp+8]
 005BF1C8    mov         eax,dword ptr [eax]
 005BF1CA    mov         byte ptr [eax+2],0
 005BF1CE    lea         edx,[ebp-14]
 005BF1D1    mov         eax,ebx
 005BF1D3    call        MakeCanonicalIPv6Address
 005BF1D8    mov         eax,dword ptr [ebp-14]
 005BF1DB    mov         dword ptr [ebp-18],eax
 005BF1DE    mov         eax,dword ptr [ebp-18]
 005BF1E1    test        eax,eax
>005BF1E3    je          005BF1EA
 005BF1E5    sub         eax,4
 005BF1E8    mov         eax,dword ptr [eax]
 005BF1EA    test        eax,eax
>005BF1EC    jle         005BF275
 005BF1F2    mov         eax,dword ptr [ebp+8]
 005BF1F5    mov         eax,dword ptr [eax]
 005BF1F7    mov         byte ptr [eax+3],4
 005BF1FB    mov         eax,dword ptr [ebp+8]
 005BF1FE    mov         eax,dword ptr [eax]
 005BF200    mov         byte ptr [eax+4],10
 005BF204    mov         dword ptr [ebp-0C],5
 005BF20B    mov         edx,ebx
 005BF20D    mov         eax,[005B7B44];TIdIPAddress
 005BF212    call        TIdIPAddress.MakeAddressObject
 005BF217    mov         dword ptr [ebp-10],eax
 005BF21A    xor         edx,edx
 005BF21C    push        ebp
 005BF21D    push        5BF265
 005BF222    push        dword ptr fs:[edx]
 005BF225    mov         dword ptr fs:[edx],esp
 005BF228    cmp         dword ptr [ebp-10],0
>005BF22C    je          005BF24A
 005BF22E    push        4
 005BF230    push        10
 005BF232    lea         edx,[ebp-1C]
 005BF235    mov         eax,dword ptr [ebp-10]
 005BF238    call        TIdIPAddress.HToNBytes
 005BF23D    mov         eax,dword ptr [ebp-1C]
 005BF240    mov         ecx,dword ptr [ebp+8]
 005BF243    xor         edx,edx
 005BF245    call        CopyTIdBytes
 005BF24A    xor         eax,eax
 005BF24C    pop         edx
 005BF24D    pop         ecx
 005BF24E    pop         ecx
 005BF24F    mov         dword ptr fs:[eax],edx
 005BF252    push        5BF26C
 005BF257    mov         eax,dword ptr [ebp-10]
 005BF25A    xor         edx,edx
 005BF25C    mov         dword ptr [ebp-10],edx
 005BF25F    call        TObject.Free
 005BF264    ret
>005BF265    jmp         @HandleFinally
>005BF26A    jmp         005BF257
 005BF26C    add         dword ptr [ebp-0C],10
>005BF270    jmp         005BF37F
 005BF275    mov         eax,[0078D940];^gvar_00789ED0
 005BF27A    mov         eax,dword ptr [eax]
 005BF27C    mov         edx,ebx
 005BF27E    call        TIdStack.IsIP
 005BF283    test        al,al
>005BF285    je          005BF303
 005BF287    mov         eax,dword ptr [ebp+8]
 005BF28A    mov         eax,dword ptr [eax]
 005BF28C    mov         byte ptr [eax+3],1
 005BF290    mov         eax,dword ptr [ebp+8]
 005BF293    mov         eax,dword ptr [eax]
 005BF295    mov         byte ptr [eax+4],4
 005BF299    mov         edx,ebx
 005BF29B    mov         eax,[005B7B44];TIdIPAddress
 005BF2A0    call        TIdIPAddress.MakeAddressObject
 005BF2A5    mov         dword ptr [ebp-10],eax
 005BF2A8    xor         edx,edx
 005BF2AA    push        ebp
 005BF2AB    push        5BF2F3
 005BF2B0    push        dword ptr fs:[edx]
 005BF2B3    mov         dword ptr fs:[edx],esp
 005BF2B6    cmp         dword ptr [ebp-10],0
>005BF2BA    je          005BF2D8
 005BF2BC    push        4
 005BF2BE    push        4
 005BF2C0    lea         edx,[ebp-20]
 005BF2C3    mov         eax,dword ptr [ebp-10]
 005BF2C6    call        TIdIPAddress.HToNBytes
 005BF2CB    mov         eax,dword ptr [ebp-20]
 005BF2CE    mov         ecx,dword ptr [ebp+8]
 005BF2D1    xor         edx,edx
 005BF2D3    call        CopyTIdBytes
 005BF2D8    xor         eax,eax
 005BF2DA    pop         edx
 005BF2DB    pop         ecx
 005BF2DC    pop         ecx
 005BF2DD    mov         dword ptr fs:[eax],edx
 005BF2E0    push        5BF2FA
 005BF2E5    mov         eax,dword ptr [ebp-10]
 005BF2E8    xor         edx,edx
 005BF2EA    mov         dword ptr [ebp-10],edx
 005BF2ED    call        TObject.Free
 005BF2F2    ret
>005BF2F3    jmp         @HandleFinally
>005BF2F8    jmp         005BF2E5
 005BF2FA    mov         dword ptr [ebp-0C],8
>005BF301    jmp         005BF37F
 005BF303    mov         eax,dword ptr [ebp+8]
 005BF306    mov         eax,dword ptr [eax]
 005BF308    mov         byte ptr [eax+3],3
 005BF30C    mov         esi,ebx
 005BF30E    mov         eax,esi
 005BF310    test        eax,eax
>005BF312    je          005BF319
 005BF314    sub         eax,4
 005BF317    mov         eax,dword ptr [eax]
 005BF319    mov         edx,dword ptr [ebp+8]
 005BF31C    mov         edx,dword ptr [edx]
 005BF31E    mov         byte ptr [edx+4],al
 005BF321    mov         dword ptr [ebp-0C],5
 005BF328    mov         eax,esi
 005BF32A    test        eax,eax
>005BF32C    je          005BF333
 005BF32E    sub         eax,4
 005BF331    mov         eax,dword ptr [eax]
 005BF333    test        eax,eax
>005BF335    jle         005BF371
 005BF337    lea         ecx,[ebp-24]
 005BF33A    xor         edx,edx
 005BF33C    mov         eax,ebx
 005BF33E    call        ToBytes
 005BF343    mov         edx,dword ptr [ebp-24]
 005BF346    lea         eax,[ebp-4]
 005BF349    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 005BF34F    call        @DynArrayAsg
 005BF354    mov         eax,esi
 005BF356    test        eax,eax
>005BF358    je          005BF35F
 005BF35A    sub         eax,4
 005BF35D    mov         eax,dword ptr [eax]
 005BF35F    mov         edx,dword ptr [ebp-0C]
 005BF362    push        edx
 005BF363    push        eax
 005BF364    mov         ecx,dword ptr [ebp+8]
 005BF367    xor         edx,edx
 005BF369    mov         eax,dword ptr [ebp-4]
 005BF36C    call        CopyTIdBytes
 005BF371    mov         eax,esi
 005BF373    test        eax,eax
>005BF375    je          005BF37C
 005BF377    sub         eax,4
 005BF37A    mov         eax,dword ptr [eax]
 005BF37C    add         dword ptr [ebp-0C],eax
 005BF37F    mov         eax,[0078D940];^gvar_00789ED0
 005BF384    mov         eax,dword ptr [eax]
 005BF386    movzx       edx,word ptr [ebp+0C]
 005BF38A    mov         ecx,dword ptr [eax]
 005BF38C    call        dword ptr [ecx+2C]
 005BF38F    mov         ebx,eax
 005BF391    mov         eax,dword ptr [ebp-0C]
 005BF394    push        eax
 005BF395    push        2
 005BF397    lea         edx,[ebp-28]
 005BF39A    mov         eax,ebx
 005BF39C    call        ToBytes
 005BF3A1    mov         eax,dword ptr [ebp-28]
 005BF3A4    mov         ecx,dword ptr [ebp+8]
 005BF3A7    xor         edx,edx
 005BF3A9    call        CopyTIdBytes
 005BF3AE    add         dword ptr [ebp-0C],2
 005BF3B2    mov         eax,dword ptr [ebp-8]
 005BF3B5    call        @DynArrayLength
 005BF3BA    add         eax,dword ptr [ebp-0C]
 005BF3BD    push        eax
 005BF3BE    mov         eax,dword ptr [ebp+8]
 005BF3C1    mov         ecx,1
 005BF3C6    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BF3CC    call        @DynArraySetLength
 005BF3D1    add         esp,4
 005BF3D4    mov         eax,dword ptr [ebp-0C]
 005BF3D7    push        eax
 005BF3D8    mov         eax,dword ptr [ebp-8]
 005BF3DB    call        @DynArrayLength
 005BF3E0    push        eax
 005BF3E1    mov         ecx,dword ptr [ebp+8]
 005BF3E4    xor         edx,edx
 005BF3E6    mov         eax,dword ptr [ebp-8]
 005BF3E9    call        CopyTIdBytes
 005BF3EE    xor         eax,eax
 005BF3F0    pop         edx
 005BF3F1    pop         ecx
 005BF3F2    pop         ecx
 005BF3F3    mov         dword ptr fs:[eax],edx
 005BF3F6    push        5BF42C
 005BF3FB    lea         eax,[ebp-28]
 005BF3FE    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BF404    mov         ecx,4
 005BF409    call        @FinalizeArray
 005BF40E    lea         eax,[ebp-14]
 005BF411    call        @UStrClr
 005BF416    lea         eax,[ebp-4]
 005BF419    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BF41F    call        @DynArrayClear
 005BF424    ret
>005BF425    jmp         @HandleFinally
>005BF42A    jmp         005BF3FB
 005BF42C    pop         esi
 005BF42D    pop         ebx
 005BF42E    mov         esp,ebp
 005BF430    pop         ebp
 005BF431    ret         8
*}
end;

//005BF434
procedure TIdSocksInfo.RecvFromUDP(AHandle:TIdSocketHandle; var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; var VIPVersion:TIdIPVersion; AMSec:Integer);
begin
{*
 005BF434    push        ebp
 005BF435    mov         ebp,esp
 005BF437    push        0
 005BF439    push        0
 005BF43B    push        0
 005BF43D    push        0
 005BF43F    push        ebx
 005BF440    push        esi
 005BF441    push        edi
 005BF442    mov         dword ptr [ebp-8],ecx
 005BF445    mov         ebx,edx
 005BF447    mov         esi,eax
 005BF449    mov         edi,dword ptr [ebp+14]
 005BF44C    xor         eax,eax
 005BF44E    push        ebp
 005BF44F    push        5BF576
 005BF454    push        dword ptr fs:[eax]
 005BF457    mov         dword ptr fs:[eax],esp
 005BF45A    movzx       eax,byte ptr [esi+0A9]
 005BF461    dec         eax
 005BF462    sub         al,2
>005BF464    jae         005BF487
 005BF466    lea         edx,[ebp-0C]
 005BF469    mov         eax,[0078DAC8];^SResString665:TResStringRec
 005BF46E    call        LoadResString
 005BF473    mov         ecx,dword ptr [ebp-0C]
 005BF476    mov         dl,1
 005BF478    mov         eax,[005BC758];EIdSocksUDPNotSupportedBySOCKSVersion
 005BF47D    call        EIdException.Create
 005BF482    call        @RaiseExcept
 005BF487    mov         eax,dword ptr [ebp-8]
 005BF48A    mov         eax,dword ptr [eax]
 005BF48C    call        @DynArrayLength
 005BF491    add         eax,0C8
 005BF496    push        eax
 005BF497    lea         eax,[ebp-4]
 005BF49A    mov         ecx,1
 005BF49F    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BF4A5    call        @DynArraySetLength
 005BF4AA    add         esp,4
 005BF4AD    mov         edx,dword ptr [ebp+8]
 005BF4B0    mov         eax,ebx
 005BF4B2    call        TIdSocketHandle.Readable
 005BF4B7    test        al,al
>005BF4B9    jne         005BF4D4
 005BF4BB    xor         ebx,ebx
 005BF4BD    mov         eax,edi
 005BF4BF    call        @UStrClr
 005BF4C4    mov         eax,dword ptr [ebp+10]
 005BF4C7    mov         word ptr [eax],0
 005BF4CC    mov         eax,dword ptr [ebp+0C]
 005BF4CF    mov         byte ptr [eax],0
>005BF4D2    jmp         005BF544
 005BF4D4    mov         eax,dword ptr [ebp+10]
 005BF4D7    push        eax
 005BF4D8    mov         eax,dword ptr [ebp+0C]
 005BF4DB    push        eax
 005BF4DC    mov         ecx,edi
 005BF4DE    lea         edx,[ebp-4]
 005BF4E1    mov         eax,ebx
 005BF4E3    call        TIdSocketHandle.RecvFrom
 005BF4E8    mov         ebx,eax
 005BF4EA    push        ebx
 005BF4EB    lea         eax,[ebp-4]
 005BF4EE    mov         ecx,1
 005BF4F3    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BF4F9    call        @DynArraySetLength
 005BF4FE    add         esp,4
 005BF501    mov         eax,dword ptr [ebp+10]
 005BF504    push        eax
 005BF505    mov         eax,dword ptr [ebp+0C]
 005BF508    push        eax
 005BF509    lea         eax,[ebp-10]
 005BF50C    push        eax
 005BF50D    mov         ecx,edi
 005BF50F    mov         edx,dword ptr [ebp-4]
 005BF512    mov         eax,esi
 005BF514    call        TIdSocksInfo.DisasmUDPReplyPacket
 005BF519    mov         edx,dword ptr [ebp-10]
 005BF51C    lea         eax,[ebp-4]
 005BF51F    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 005BF525    call        @DynArrayAsg
 005BF52A    mov         eax,dword ptr [ebp-4]
 005BF52D    call        @DynArrayLength
 005BF532    mov         ebx,eax
 005BF534    push        0
 005BF536    push        ebx
 005BF537    mov         ecx,dword ptr [ebp-8]
 005BF53A    xor         edx,edx
 005BF53C    mov         eax,dword ptr [ebp-4]
 005BF53F    call        CopyTIdBytes
 005BF544    xor         eax,eax
 005BF546    pop         edx
 005BF547    pop         ecx
 005BF548    pop         ecx
 005BF549    mov         dword ptr fs:[eax],edx
 005BF54C    push        5BF57D
 005BF551    lea         eax,[ebp-10]
 005BF554    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BF55A    call        @DynArrayClear
 005BF55F    lea         eax,[ebp-0C]
 005BF562    call        @UStrClr
 005BF567    lea         eax,[ebp-4]
 005BF56A    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BF570    call        @DynArrayClear
 005BF575    ret
>005BF576    jmp         @HandleFinally
>005BF57B    jmp         005BF551
 005BF57D    mov         eax,ebx
 005BF57F    pop         edi
 005BF580    pop         esi
 005BF581    pop         ebx
 005BF582    mov         esp,ebp
 005BF584    pop         ebp
 005BF585    ret         10
*}
end;

//005BF588
procedure TIdSocksInfo.SendToUDP(AHandle:TIdSocketHandle; const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion; const ABuffer:TIdBytes);
begin
{*
 005BF588    push        ebp
 005BF589    mov         ebp,esp
 005BF58B    push        0
 005BF58D    push        0
 005BF58F    push        ebx
 005BF590    push        esi
 005BF591    push        edi
 005BF592    mov         edi,ecx
 005BF594    mov         esi,edx
 005BF596    mov         ebx,eax
 005BF598    xor         eax,eax
 005BF59A    push        ebp
 005BF59B    push        5BF61A
 005BF5A0    push        dword ptr fs:[eax]
 005BF5A3    mov         dword ptr fs:[eax],esp
 005BF5A6    movzx       eax,byte ptr [ebx+0A9]
 005BF5AD    dec         eax
 005BF5AE    sub         al,2
>005BF5B0    jae         005BF5D3
 005BF5B2    lea         edx,[ebp-8]
 005BF5B5    mov         eax,[0078DAC8];^SResString665:TResStringRec
 005BF5BA    call        LoadResString
 005BF5BF    mov         ecx,dword ptr [ebp-8]
 005BF5C2    mov         dl,1
 005BF5C4    mov         eax,[005BC758];EIdSocksUDPNotSupportedBySOCKSVersion
 005BF5C9    call        EIdException.Create
 005BF5CE    call        @RaiseExcept
 005BF5D3    movzx       eax,word ptr [ebp+10]
 005BF5D7    push        eax
 005BF5D8    lea         eax,[ebp-4]
 005BF5DB    push        eax
 005BF5DC    mov         ecx,edi
 005BF5DE    mov         edx,dword ptr [ebp+8]
 005BF5E1    mov         eax,ebx
 005BF5E3    call        TIdSocksInfo.MakeUDPRequestPacket
 005BF5E8    push        0FF
 005BF5EA    xor         ecx,ecx
 005BF5EC    mov         edx,dword ptr [ebp-4]
 005BF5EF    mov         eax,esi
 005BF5F1    call        TIdSocketHandle.Send
 005BF5F6    xor         eax,eax
 005BF5F8    pop         edx
 005BF5F9    pop         ecx
 005BF5FA    pop         ecx
 005BF5FB    mov         dword ptr fs:[eax],edx
 005BF5FE    push        5BF621
 005BF603    lea         eax,[ebp-8]
 005BF606    call        @UStrClr
 005BF60B    lea         eax,[ebp-4]
 005BF60E    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005BF614    call        @DynArrayClear
 005BF619    ret
>005BF61A    jmp         @HandleFinally
>005BF61F    jmp         005BF603
 005BF621    pop         edi
 005BF622    pop         esi
 005BF623    pop         ebx
 005BF624    pop         ecx
 005BF625    pop         ecx
 005BF626    pop         ebp
 005BF627    ret         0C
*}
end;

//005BF62C
destructor TIdSocksInfo.Destroy();
begin
{*
 005BF62C    push        ebx
 005BF62D    push        esi
 005BF62E    call        @BeforeDestruction
 005BF633    mov         ebx,edx
 005BF635    mov         esi,eax
 005BF637    lea         eax,[esi+0AC]
 005BF63D    mov         edx,dword ptr [eax]
 005BF63F    xor         ecx,ecx
 005BF641    mov         dword ptr [eax],ecx
 005BF643    mov         eax,edx
 005BF645    call        TObject.Free
 005BF64A    mov         edx,ebx
 005BF64C    and         dl,0FC
 005BF64F    mov         eax,esi
 005BF651    call        TIdComponent.Destroy
 005BF656    test        bl,bl
>005BF658    jle         005BF661
 005BF65A    mov         eax,esi
 005BF65C    call        @ClassDestroy
 005BF661    pop         esi
 005BF662    pop         ebx
 005BF663    ret
*}
end;

//005BFD24
procedure TIdUDPClient.CloseProxy;
begin
{*
 005BFD24    push        ebx
 005BFD25    mov         ebx,eax
 005BFD27    mov         eax,ebx
 005BFD29    call        TIdUDPClient.UseProxy
 005BFD2E    test        al,al
>005BFD30    je          005BFD56
 005BFD32    cmp         byte ptr [ebx+0BA],0
>005BFD39    je          005BFD56
 005BFD3B    mov         eax,ebx
 005BFD3D    mov         edx,dword ptr [eax]
 005BFD3F    call        dword ptr [edx+4C]
 005BFD42    mov         edx,eax
 005BFD44    mov         eax,dword ptr [ebx+0D4]
 005BFD4A    mov         ecx,dword ptr [eax]
 005BFD4C    call        dword ptr [ecx+54]
 005BFD4F    mov         byte ptr [ebx+0BA],0
 005BFD56    pop         ebx
 005BFD57    ret
*}
end;

//005BFD58
procedure TIdUDPClient.Connect;
begin
{*
 005BFD58    push        ebp
 005BFD59    mov         ebp,esp
 005BFD5B    xor         ecx,ecx
 005BFD5D    push        ecx
 005BFD5E    push        ecx
 005BFD5F    push        ecx
 005BFD60    push        ecx
 005BFD61    push        ecx
 005BFD62    push        ecx
 005BFD63    push        ecx
 005BFD64    push        ecx
 005BFD65    push        ebx
 005BFD66    push        esi
 005BFD67    mov         ebx,eax
 005BFD69    xor         eax,eax
 005BFD6B    push        ebp
 005BFD6C    push        5BFED5
 005BFD71    push        dword ptr fs:[eax]
 005BFD74    mov         dword ptr fs:[eax],esp
 005BFD77    mov         eax,ebx
 005BFD79    call        TIdUDPClient.Connected
 005BFD7E    test        al,al
>005BFD80    je          005BFD8C
 005BFD82    mov         eax,ebx
 005BFD84    mov         edx,dword ptr [eax]
 005BFD86    call        dword ptr [edx+88]
 005BFD8C    mov         esi,dword ptr [ebx+0D4]
 005BFD92    test        esi,esi
>005BFD94    je          005BFDE1
 005BFD96    mov         eax,esi
 005BFD98    mov         edx,dword ptr [eax]
 005BFD9A    call        dword ptr [edx+44]
 005BFD9D    test        al,al
>005BFD9F    je          005BFDE1
 005BFDA1    mov         eax,ebx
 005BFDA3    mov         edx,dword ptr [eax]
 005BFDA5    call        dword ptr [edx+60]
 005BFDA8    push        eax
 005BFDA9    push        0
 005BFDAB    lea         edx,[ebp-8]
 005BFDAE    mov         eax,ebx
 005BFDB0    mov         ecx,dword ptr [eax]
 005BFDB2    call        dword ptr [ecx+58]
 005BFDB5    mov         eax,dword ptr [ebp-8]
 005BFDB8    push        eax
 005BFDB9    mov         eax,ebx
 005BFDBB    mov         edx,dword ptr [eax]
 005BFDBD    call        dword ptr [edx+4C]
 005BFDC0    mov         edx,eax
 005BFDC2    mov         eax,dword ptr [ebx+0D4]
 005BFDC8    pop         ecx
 005BFDC9    mov         esi,dword ptr [eax]
 005BFDCB    call        dword ptr [esi+50]
 005BFDCE    mov         byte ptr [ebx+0BA],1
 005BFDD5    mov         byte ptr [ebx+0D0],1
>005BFDDC    jmp         005BFEAD
 005BFDE1    lea         edx,[ebp-0C]
 005BFDE4    mov         eax,ebx
 005BFDE6    mov         ecx,dword ptr [eax]
 005BFDE8    call        dword ptr [ecx+58]
 005BFDEB    mov         edx,dword ptr [ebp-0C]
 005BFDEE    mov         eax,[0078D940];^gvar_00789ED0
 005BFDF3    mov         eax,dword ptr [eax]
 005BFDF5    call        TIdStack.IsIP
 005BFDFA    test        al,al
>005BFDFC    jne         005BFE4D
 005BFDFE    cmp         word ptr [ebx+3A],0
>005BFE03    je          005BFE27
 005BFE05    push        0
 005BFE07    lea         edx,[ebp-18]
 005BFE0A    mov         eax,ebx
 005BFE0C    mov         ecx,dword ptr [eax]
 005BFE0E    call        dword ptr [ecx+58]
 005BFE11    mov         eax,dword ptr [ebp-18]
 005BFE14    mov         dword ptr [ebp-14],eax
 005BFE17    mov         byte ptr [ebp-10],11
 005BFE1B    lea         ecx,[ebp-14]
 005BFE1E    xor         edx,edx
 005BFE20    mov         eax,ebx
 005BFE22    call        TIdComponent.DoStatus
 005BFE27    lea         eax,[ebp-4]
 005BFE2A    push        eax
 005BFE2B    lea         edx,[ebp-1C]
 005BFE2E    mov         eax,ebx
 005BFE30    mov         ecx,dword ptr [eax]
 005BFE32    call        dword ptr [ecx+58]
 005BFE35    mov         edx,dword ptr [ebp-1C]
 005BFE38    mov         eax,[0078D940];^gvar_00789ED0
 005BFE3D    mov         eax,dword ptr [eax]
 005BFE3F    movzx       ecx,byte ptr [ebx+0A8]
 005BFE46    call        TIdStack.ResolveHost
>005BFE4B    jmp         005BFE57
 005BFE4D    lea         edx,[ebp-4]
 005BFE50    mov         eax,ebx
 005BFE52    mov         ecx,dword ptr [eax]
 005BFE54    call        dword ptr [ecx+58]
 005BFE57    push        0
 005BFE59    mov         eax,ebx
 005BFE5B    mov         edx,dword ptr [eax]
 005BFE5D    call        dword ptr [edx+60]
 005BFE60    push        eax
 005BFE61    mov         eax,ebx
 005BFE63    mov         edx,dword ptr [eax]
 005BFE65    call        dword ptr [edx+4C]
 005BFE68    mov         edx,dword ptr [ebp-4]
 005BFE6B    pop         ecx
 005BFE6C    call        TIdSocketHandle.SetPeer
 005BFE71    mov         eax,ebx
 005BFE73    mov         edx,dword ptr [eax]
 005BFE75    call        dword ptr [edx+4C]
 005BFE78    mov         edx,dword ptr [eax]
 005BFE7A    call        dword ptr [edx+28]
 005BFE7D    push        0
 005BFE7F    lea         edx,[ebp-20]
 005BFE82    mov         eax,ebx
 005BFE84    mov         ecx,dword ptr [eax]
 005BFE86    call        dword ptr [ecx+58]
 005BFE89    mov         eax,dword ptr [ebp-20]
 005BFE8C    mov         dword ptr [ebp-14],eax
 005BFE8F    mov         byte ptr [ebp-10],11
 005BFE93    lea         ecx,[ebp-14]
 005BFE96    mov         dl,2
 005BFE98    mov         eax,ebx
 005BFE9A    call        TIdComponent.DoStatus
 005BFE9F    mov         eax,ebx
 005BFEA1    mov         edx,dword ptr [eax]
 005BFEA3    call        dword ptr [edx+7C]
 005BFEA6    mov         byte ptr [ebx+0D0],1
 005BFEAD    xor         eax,eax
 005BFEAF    pop         edx
 005BFEB0    pop         ecx
 005BFEB1    pop         ecx
 005BFEB2    mov         dword ptr fs:[eax],edx
 005BFEB5    push        5BFEDC
 005BFEBA    lea         eax,[ebp-20]
 005BFEBD    mov         edx,3
 005BFEC2    call        @UStrArrayClr
 005BFEC7    lea         eax,[ebp-0C]
 005BFECA    mov         edx,3
 005BFECF    call        @UStrArrayClr
 005BFED4    ret
>005BFED5    jmp         @HandleFinally
>005BFEDA    jmp         005BFEBA
 005BFEDC    pop         esi
 005BFEDD    pop         ebx
 005BFEDE    mov         esp,ebp
 005BFEE0    pop         ebp
 005BFEE1    ret
*}
end;

//005BFEE4
function TIdUDPClient.Connected:Boolean;
begin
{*
 005BFEE4    movzx       edx,byte ptr [eax+0D0]
 005BFEEB    test        dl,dl
>005BFEED    je          005BFF01
 005BFEEF    mov         edx,dword ptr [eax+90]
 005BFEF5    test        edx,edx
>005BFEF7    je          005BFEFF
 005BFEF9    movzx       edx,byte ptr [edx+14]
>005BFEFD    jmp         005BFF01
 005BFEFF    xor         edx,edx
 005BFF01    mov         eax,edx
 005BFF03    ret
*}
end;

//005BFF04
procedure TIdUDPClient.Disconnect;
begin
{*
 005BFF04    push        ebx
 005BFF05    mov         ebx,eax
 005BFF07    mov         eax,ebx
 005BFF09    call        TIdUDPClient.Connected
 005BFF0E    test        al,al
>005BFF10    je          005BFF5B
 005BFF12    mov         dl,3
 005BFF14    mov         eax,ebx
 005BFF16    call        TIdComponent.DoStatus
 005BFF1B    mov         eax,ebx
 005BFF1D    call        TIdUDPClient.UseProxy
 005BFF22    test        al,al
>005BFF24    je          005BFF36
 005BFF26    cmp         byte ptr [ebx+0BA],0
>005BFF2D    je          005BFF36
 005BFF2F    mov         eax,ebx
 005BFF31    call        TIdUDPClient.CloseProxy
 005BFF36    mov         eax,dword ptr [ebx+90]
 005BFF3C    mov         edx,dword ptr [eax]
 005BFF3E    call        dword ptr [edx+24]
 005BFF41    mov         eax,ebx
 005BFF43    mov         edx,dword ptr [eax]
 005BFF45    call        dword ptr [edx+80]
 005BFF4B    mov         dl,4
 005BFF4D    mov         eax,ebx
 005BFF4F    call        TIdComponent.DoStatus
 005BFF54    mov         byte ptr [ebx+0D0],0
 005BFF5B    pop         ebx
 005BFF5C    ret
*}
end;

//005BFF60
procedure TIdUDPClient.DoOnConnected;
begin
{*
 005BFF60    push        ebx
 005BFF61    cmp         word ptr [eax+0C2],0
>005BFF69    je          005BFF7B
 005BFF6B    mov         ebx,eax
 005BFF6D    mov         edx,eax
 005BFF6F    mov         eax,dword ptr [ebx+0C4]
 005BFF75    call        dword ptr [ebx+0C0]
 005BFF7B    pop         ebx
 005BFF7C    ret
*}
end;

//005BFF80
procedure TIdUDPClient.DoOnDisconnected;
begin
{*
 005BFF80    push        ebx
 005BFF81    cmp         word ptr [eax+0CA],0
>005BFF89    je          005BFF9B
 005BFF8B    mov         ebx,eax
 005BFF8D    mov         edx,eax
 005BFF8F    mov         eax,dword ptr [ebx+0CC]
 005BFF95    call        dword ptr [ebx+0C8]
 005BFF9B    pop         ebx
 005BFF9C    ret
*}
end;

//005BFFA0
function TIdUDPClient.GetBinding:TIdSocketHandle;
begin
{*
 005BFFA0    push        ebx
 005BFFA1    push        esi
 005BFFA2    mov         ebx,eax
 005BFFA4    cmp         dword ptr [ebx+90],0
>005BFFAB    jne         005BFFC1
 005BFFAD    xor         ecx,ecx
 005BFFAF    mov         dl,1
 005BFFB1    mov         eax,[005AB27C];TIdSocketHandle
 005BFFB6    call        TIdSocketHandle.Create
 005BFFBB    mov         dword ptr [ebx+90],eax
 005BFFC1    mov         esi,dword ptr [ebx+90]
 005BFFC7    cmp         byte ptr [esi+14],0
>005BFFCB    jne         005C002A
 005BFFCD    xor         ecx,ecx
 005BFFCF    mov         edx,2
 005BFFD4    mov         eax,esi
 005BFFD6    call        TIdSocketHandle.AllocateSocket
 005BFFDB    lea         eax,[esi+18]
 005BFFDE    mov         edx,dword ptr [ebx+0B0]
 005BFFE4    call        @UStrAsg
 005BFFE9    movzx       eax,word ptr [ebx+0B4]
 005BFFF0    mov         word ptr [esi+20],ax
 005BFFF4    movzx       eax,word ptr [ebx+0B6]
 005BFFFB    mov         word ptr [esi+0C],ax
 005BFFFF    movzx       eax,word ptr [ebx+0B8]
 005C0006    mov         word ptr [esi+0E],ax
 005C000A    movzx       edx,byte ptr [ebx+0A8]
 005C0011    mov         eax,esi
 005C0013    call        TIdSocketHandle.SetIPVersion
 005C0018    mov         eax,esi
 005C001A    call        TIdSocketHandle.Bind
 005C001F    mov         eax,ebx
 005C0021    mov         si,0FFF0
 005C0025    call        @CallDynaInst
 005C002A    mov         eax,dword ptr [ebx+90]
 005C0030    pop         esi
 005C0031    pop         ebx
 005C0032    ret
*}
end;

//005C0034
function TIdUDPClient.GetTransparentProxy:TIdCustomTransparentProxy;
begin
{*
 005C0034    push        ebx
 005C0035    mov         ebx,eax
 005C0037    cmp         dword ptr [ebx+0D4],0
>005C003E    jne         005C0054
 005C0040    xor         ecx,ecx
 005C0042    mov         dl,1
 005C0044    mov         eax,[005BC8D0];TIdSocksInfo
 005C0049    call        TIdBaseComponent.Create
 005C004E    mov         dword ptr [ebx+0D4],eax
 005C0054    mov         eax,dword ptr [ebx+0D4]
 005C005A    pop         ebx
 005C005B    ret
*}
end;

//005C005C
procedure TIdUDPClient.InitComponent;
begin
{*
 005C005C    push        ebx
 005C005D    mov         ebx,eax
 005C005F    mov         eax,ebx
 005C0061    call        TIdUDPBase.InitComponent
 005C0066    mov         byte ptr [ebx+0BA],0
 005C006D    mov         byte ptr [ebx+0D0],0
 005C0074    mov         word ptr [ebx+0B4],0
 005C007D    mov         word ptr [ebx+0B6],0
 005C0086    mov         word ptr [ebx+0B8],0
 005C008F    pop         ebx
 005C0090    ret
*}
end;

//005C0094
procedure TIdUDPClient.OpenProxy;
begin
{*
 005C0094    push        ebx
 005C0095    push        esi
 005C0096    mov         ebx,eax
 005C0098    mov         eax,ebx
 005C009A    call        TIdUDPClient.UseProxy
 005C009F    test        al,al
>005C00A1    je          005C00CD
 005C00A3    cmp         byte ptr [ebx+0BA],0
>005C00AA    jne         005C00CD
 005C00AC    push        0
 005C00AE    push        0
 005C00B0    mov         eax,ebx
 005C00B2    mov         edx,dword ptr [eax]
 005C00B4    call        dword ptr [edx+4C]
 005C00B7    mov         edx,eax
 005C00B9    xor         ecx,ecx
 005C00BB    mov         eax,dword ptr [ebx+0D4]
 005C00C1    mov         esi,dword ptr [eax]
 005C00C3    call        dword ptr [esi+50]
 005C00C6    mov         byte ptr [ebx+0BA],1
 005C00CD    pop         esi
 005C00CE    pop         ebx
 005C00CF    ret
*}
end;

//005C00D0
procedure TIdUDPClient.ReceiveBuffer(var ABuffer:TIdBytes; const AMSec:Integer);
begin
{*
 005C00D0    push        ebp
 005C00D1    mov         ebp,esp
 005C00D3    add         esp,0FFFFFFF4
 005C00D6    push        ebx
 005C00D7    push        esi
 005C00D8    push        edi
 005C00D9    xor         ebx,ebx
 005C00DB    mov         dword ptr [ebp-4],ebx
 005C00DE    mov         dword ptr [ebp-8],edx
 005C00E1    mov         ebx,eax
 005C00E3    xor         eax,eax
 005C00E5    push        ebp
 005C00E6    push        5C01A4
 005C00EB    push        dword ptr fs:[eax]
 005C00EE    mov         dword ptr fs:[eax],esp
 005C00F1    xor         edi,edi
 005C00F3    cmp         ecx,0FFFFFFFF
>005C00F6    jne         005C010D
 005C00F8    mov         eax,dword ptr [ebx+0A4]
 005C00FE    test        eax,eax
>005C0100    jne         005C0109
 005C0102    mov         esi,0FFFFFFFE
>005C0107    jmp         005C010F
 005C0109    mov         esi,eax
>005C010B    jmp         005C010F
 005C010D    mov         esi,ecx
 005C010F    mov         eax,ebx
 005C0111    call        TIdUDPClient.UseProxy
 005C0116    test        al,al
>005C0118    je          005C0152
 005C011A    cmp         byte ptr [ebx+0BA],0
>005C0121    jne         005C012A
 005C0123    mov         eax,ebx
 005C0125    call        TIdUDPClient.RaiseUseProxyError
 005C012A    lea         eax,[ebp-4]
 005C012D    push        eax
 005C012E    lea         eax,[ebp-0A]
 005C0131    push        eax
 005C0132    lea         eax,[ebp-0B]
 005C0135    push        eax
 005C0136    push        esi
 005C0137    mov         eax,ebx
 005C0139    mov         edx,dword ptr [eax]
 005C013B    call        dword ptr [edx+4C]
 005C013E    mov         edx,eax
 005C0140    mov         ecx,dword ptr [ebp-8]
 005C0143    mov         eax,dword ptr [ebx+0D4]
 005C0149    mov         ebx,dword ptr [eax]
 005C014B    call        dword ptr [ebx+58]
 005C014E    mov         edi,eax
>005C0150    jmp         005C018E
 005C0152    mov         eax,ebx
 005C0154    call        TIdUDPClient.Connected
 005C0159    test        al,al
>005C015B    je          005C0180
 005C015D    mov         edx,esi
 005C015F    mov         eax,dword ptr [ebx+90]
 005C0165    call        TIdSocketHandle.Readable
 005C016A    test        al,al
>005C016C    je          005C018E
 005C016E    mov         edx,dword ptr [ebp-8]
 005C0171    mov         eax,dword ptr [ebx+90]
 005C0177    call        TIdSocketHandle.Receive
 005C017C    mov         edi,eax
>005C017E    jmp         005C018E
 005C0180    mov         edx,dword ptr [ebp-8]
 005C0183    mov         ecx,esi
 005C0185    mov         eax,ebx
 005C0187    call        TIdUDPBase.ReceiveBuffer
 005C018C    mov         edi,eax
 005C018E    xor         eax,eax
 005C0190    pop         edx
 005C0191    pop         ecx
 005C0192    pop         ecx
 005C0193    mov         dword ptr fs:[eax],edx
 005C0196    push        5C01AB
 005C019B    lea         eax,[ebp-4]
 005C019E    call        @UStrClr
 005C01A3    ret
>005C01A4    jmp         @HandleFinally
>005C01A9    jmp         005C019B
 005C01AB    mov         eax,edi
 005C01AD    pop         edi
 005C01AE    pop         esi
 005C01AF    pop         ebx
 005C01B0    mov         esp,ebp
 005C01B2    pop         ebp
 005C01B3    ret
*}
end;

//005C01B4
procedure TIdUDPClient.RaiseUseProxyError;
begin
{*
 005C01B4    push        ebp
 005C01B5    mov         ebp,esp
 005C01B7    push        0
 005C01B9    xor         eax,eax
 005C01BB    push        ebp
 005C01BC    push        5C01FE
 005C01C1    push        dword ptr fs:[eax]
 005C01C4    mov         dword ptr fs:[eax],esp
 005C01C7    lea         edx,[ebp-4]
 005C01CA    mov         eax,[0078CEE8];^SResString706:TResStringRec
 005C01CF    call        LoadResString
 005C01D4    mov         ecx,dword ptr [ebp-4]
 005C01D7    mov         dl,1
 005C01D9    mov         eax,[005BF664];EIdMustUseOpenProxy
 005C01DE    call        EIdException.Create
 005C01E3    call        @RaiseExcept
 005C01E8    xor         eax,eax
 005C01EA    pop         edx
 005C01EB    pop         ecx
 005C01EC    pop         ecx
 005C01ED    mov         dword ptr fs:[eax],edx
 005C01F0    push        5C0205
 005C01F5    lea         eax,[ebp-4]
 005C01F8    call        @UStrClr
 005C01FD    ret
>005C01FE    jmp         @HandleFinally
>005C0203    jmp         005C01F5
 005C0205    pop         ecx
 005C0206    pop         ebp
 005C0207    ret
*}
end;

//005C0208
procedure TIdUDPClient.ReceiveBuffer(var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; AMSec:Integer);
begin
{*
 005C0208    push        ebp
 005C0209    mov         ebp,esp
 005C020B    push        ecx
 005C020C    push        ebx
 005C020D    push        esi
 005C020E    push        edi
 005C020F    mov         edi,edx
 005C0211    mov         esi,eax
 005C0213    mov         eax,dword ptr [ebp+0C]
 005C0216    push        eax
 005C0217    lea         eax,[ebp-1]
 005C021A    push        eax
 005C021B    mov         eax,dword ptr [ebp+8]
 005C021E    push        eax
 005C021F    mov         edx,edi
 005C0221    mov         eax,esi
 005C0223    mov         ebx,dword ptr [eax]
 005C0225    call        dword ptr [ebx+6C]
 005C0228    pop         edi
 005C0229    pop         esi
 005C022A    pop         ebx
 005C022B    pop         ecx
 005C022C    pop         ebp
 005C022D    ret         8
*}
end;

//005C0230
procedure TIdUDPClient.Send(AData:string; AEncoding:TEncoding);
begin
{*
 005C0230    push        ebp
 005C0231    mov         ebp,esp
 005C0233    push        0
 005C0235    push        ebx
 005C0236    push        esi
 005C0237    push        edi
 005C0238    mov         edi,ecx
 005C023A    mov         esi,edx
 005C023C    mov         ebx,eax
 005C023E    xor         eax,eax
 005C0240    push        ebp
 005C0241    push        5C0283
 005C0246    push        dword ptr fs:[eax]
 005C0249    mov         dword ptr fs:[eax],esp
 005C024C    push        esi
 005C024D    push        edi
 005C024E    lea         edx,[ebp-4]
 005C0251    mov         eax,ebx
 005C0253    mov         ecx,dword ptr [eax]
 005C0255    call        dword ptr [ecx+58]
 005C0258    mov         eax,dword ptr [ebp-4]
 005C025B    push        eax
 005C025C    mov         eax,ebx
 005C025E    mov         edx,dword ptr [eax]
 005C0260    call        dword ptr [edx+60]
 005C0263    mov         ecx,eax
 005C0265    mov         eax,ebx
 005C0267    pop         edx
 005C0268    call        TIdUDPBase.Send
 005C026D    xor         eax,eax
 005C026F    pop         edx
 005C0270    pop         ecx
 005C0271    pop         ecx
 005C0272    mov         dword ptr fs:[eax],edx
 005C0275    push        5C028A
 005C027A    lea         eax,[ebp-4]
 005C027D    call        @UStrClr
 005C0282    ret
>005C0283    jmp         @HandleFinally
>005C0288    jmp         005C027A
 005C028A    pop         edi
 005C028B    pop         esi
 005C028C    pop         ebx
 005C028D    pop         ecx
 005C028E    pop         ebp
 005C028F    ret
*}
end;

//005C0290
procedure TIdUDPClient.SendBuffer(const ABuffer:TIdBytes);
begin
{*
 005C0290    push        ebp
 005C0291    mov         ebp,esp
 005C0293    push        0
 005C0295    push        0
 005C0297    push        ebx
 005C0298    push        esi
 005C0299    mov         esi,edx
 005C029B    mov         ebx,eax
 005C029D    xor         eax,eax
 005C029F    push        ebp
 005C02A0    push        5C035D
 005C02A5    push        dword ptr fs:[eax]
 005C02A8    mov         dword ptr fs:[eax],esp
 005C02AB    mov         eax,ebx
 005C02AD    call        TIdUDPClient.UseProxy
 005C02B2    test        al,al
>005C02B4    je          005C02FC
 005C02B6    cmp         byte ptr [ebx+0BA],0
>005C02BD    jne         005C02C6
 005C02BF    mov         eax,ebx
 005C02C1    call        TIdUDPClient.RaiseUseProxyError
 005C02C6    mov         eax,ebx
 005C02C8    mov         edx,dword ptr [eax]
 005C02CA    call        dword ptr [edx+60]
 005C02CD    push        eax
 005C02CE    mov         eax,ebx
 005C02D0    mov         edx,dword ptr [eax]
 005C02D2    call        dword ptr [edx+50]
 005C02D5    push        eax
 005C02D6    push        esi
 005C02D7    lea         edx,[ebp-4]
 005C02DA    mov         eax,ebx
 005C02DC    mov         ecx,dword ptr [eax]
 005C02DE    call        dword ptr [ecx+58]
 005C02E1    mov         eax,dword ptr [ebp-4]
 005C02E4    push        eax
 005C02E5    mov         eax,ebx
 005C02E7    mov         edx,dword ptr [eax]
 005C02E9    call        dword ptr [edx+4C]
 005C02EC    mov         edx,eax
 005C02EE    mov         eax,dword ptr [ebx+0D4]
 005C02F4    pop         ecx
 005C02F5    mov         ebx,dword ptr [eax]
 005C02F7    call        dword ptr [ebx+5C]
>005C02FA    jmp         005C0342
 005C02FC    mov         eax,ebx
 005C02FE    call        TIdUDPClient.Connected
 005C0303    test        al,al
>005C0305    je          005C031A
 005C0307    push        0FF
 005C0309    xor         ecx,ecx
 005C030B    mov         edx,esi
 005C030D    mov         eax,dword ptr [ebx+90]
 005C0313    call        TIdSocketHandle.Send
>005C0318    jmp         005C0342
 005C031A    mov         eax,ebx
 005C031C    mov         edx,dword ptr [eax]
 005C031E    call        dword ptr [edx+50]
 005C0321    push        eax
 005C0322    push        esi
 005C0323    lea         edx,[ebp-8]
 005C0326    mov         eax,ebx
 005C0328    mov         ecx,dword ptr [eax]
 005C032A    call        dword ptr [ecx+58]
 005C032D    mov         eax,dword ptr [ebp-8]
 005C0330    push        eax
 005C0331    mov         eax,ebx
 005C0333    mov         edx,dword ptr [eax]
 005C0335    call        dword ptr [edx+60]
 005C0338    mov         ecx,eax
 005C033A    mov         eax,ebx
 005C033C    pop         edx
 005C033D    call        TIdUDPBase.SendBuffer
 005C0342    xor         eax,eax
 005C0344    pop         edx
 005C0345    pop         ecx
 005C0346    pop         ecx
 005C0347    mov         dword ptr fs:[eax],edx
 005C034A    push        5C0364
 005C034F    lea         eax,[ebp-8]
 005C0352    mov         edx,2
 005C0357    call        @UStrArrayClr
 005C035C    ret
>005C035D    jmp         @HandleFinally
>005C0362    jmp         005C034F
 005C0364    pop         esi
 005C0365    pop         ebx
 005C0366    pop         ecx
 005C0367    pop         ecx
 005C0368    pop         ebp
 005C0369    ret
*}
end;

//005C036C
procedure TIdUDPClient.SendBuffer(const AHost:UnicodeString; const APort:TIdPort; const ABuffer:TIdBytes);
begin
{*
 005C036C    push        ebp
 005C036D    mov         ebp,esp
 005C036F    push        ebx
 005C0370    push        esi
 005C0371    push        edi
 005C0372    mov         edi,ecx
 005C0374    mov         esi,edx
 005C0376    mov         ebx,eax
 005C0378    mov         eax,ebx
 005C037A    call        TIdUDPClient.UseProxy
 005C037F    test        al,al
>005C0381    je          005C03B8
 005C0383    cmp         byte ptr [ebx+0BA],0
>005C038A    jne         005C0393
 005C038C    mov         eax,ebx
 005C038E    call        TIdUDPClient.RaiseUseProxyError
 005C0393    push        edi
 005C0394    mov         eax,ebx
 005C0396    mov         edx,dword ptr [eax]
 005C0398    call        dword ptr [edx+50]
 005C039B    push        eax
 005C039C    mov         eax,dword ptr [ebp+8]
 005C039F    push        eax
 005C03A0    mov         eax,ebx
 005C03A2    mov         edx,dword ptr [eax]
 005C03A4    call        dword ptr [edx+4C]
 005C03A7    mov         edx,eax
 005C03A9    mov         ecx,esi
 005C03AB    mov         eax,dword ptr [ebx+0D4]
 005C03B1    mov         ebx,dword ptr [eax]
 005C03B3    call        dword ptr [ebx+5C]
>005C03B6    jmp         005C03C7
 005C03B8    mov         eax,dword ptr [ebp+8]
 005C03BB    push        eax
 005C03BC    mov         ecx,edi
 005C03BE    mov         edx,esi
 005C03C0    mov         eax,ebx
 005C03C2    call        TIdUDPBase.SendBuffer
 005C03C7    pop         edi
 005C03C8    pop         esi
 005C03C9    pop         ebx
 005C03CA    pop         ebp
 005C03CB    ret         4
*}
end;

//005C03D0
procedure TIdUDPClient.SetHost(const AValue:UnicodeString);
begin
{*
 005C03D0    push        ebx
 005C03D1    push        esi
 005C03D2    mov         esi,edx
 005C03D4    mov         ebx,eax
 005C03D6    mov         eax,dword ptr [ebx+9C]
 005C03DC    mov         edx,esi
 005C03DE    call        @UStrEqual
>005C03E3    je          005C03EF
 005C03E5    mov         eax,ebx
 005C03E7    mov         edx,dword ptr [eax]
 005C03E9    call        dword ptr [edx+88]
 005C03EF    mov         edx,esi
 005C03F1    mov         eax,ebx
 005C03F3    call        TIdUDPBase.SetHost
 005C03F8    pop         esi
 005C03F9    pop         ebx
 005C03FA    ret
*}
end;

//005C03FC
procedure TIdUDPClient.SetIPVersion(const AValue:TIdIPVersion);
begin
{*
 005C03FC    push        ebx
 005C03FD    push        esi
 005C03FE    mov         ebx,edx
 005C0400    mov         esi,eax
 005C0402    cmp         bl,byte ptr [esi+0A8]
>005C0408    je          005C0414
 005C040A    mov         eax,esi
 005C040C    mov         edx,dword ptr [eax]
 005C040E    call        dword ptr [edx+88]
 005C0414    mov         edx,ebx
 005C0416    mov         eax,esi
 005C0418    call        TIdUDPBase.SetIPVersion
 005C041D    pop         esi
 005C041E    pop         ebx
 005C041F    ret
*}
end;

//005C0420
procedure TIdUDPClient.SetPort(const AValue:TIdPort);
begin
{*
 005C0420    push        ebx
 005C0421    push        esi
 005C0422    mov         esi,edx
 005C0424    mov         ebx,eax
 005C0426    cmp         si,word ptr [ebx+0A0]
>005C042D    je          005C0439
 005C042F    mov         eax,ebx
 005C0431    mov         edx,dword ptr [eax]
 005C0433    call        dword ptr [edx+88]
 005C0439    mov         edx,esi
 005C043B    mov         eax,ebx
 005C043D    call        TIdUDPBase.SetPort
 005C0442    pop         esi
 005C0443    pop         ebx
 005C0444    ret
*}
end;

//005C0448
procedure TIdUDPClient.SetTransparentProxy(AProxy:TIdCustomTransparentProxy);
begin
{*
 005C0448    push        ebx
 005C0449    push        esi
 005C044A    push        edi
 005C044B    mov         esi,edx
 005C044D    mov         ebx,eax
 005C044F    test        esi,esi
>005C0451    je          005C050D
 005C0457    cmp         dword ptr [esi+4],0
>005C045B    jne         005C04D0
 005C045D    mov         eax,dword ptr [ebx+0D4]
 005C0463    test        eax,eax
>005C0465    je          005C047C
 005C0467    cmp         dword ptr [eax+4],0
>005C046B    je          005C047C
 005C046D    mov         edx,ebx
 005C046F    call        TComponent.RemoveFreeNotification
 005C0474    xor         eax,eax
 005C0476    mov         dword ptr [ebx+0D4],eax
 005C047C    mov         edx,dword ptr [esi]
 005C047E    mov         eax,edx
 005C0480    mov         edi,eax
 005C0482    mov         edx,dword ptr [ebx+0D4]
 005C0488    test        edx,edx
>005C048A    je          005C04A7
 005C048C    mov         edx,dword ptr [edx]
 005C048E    mov         eax,edx
 005C0490    cmp         edi,eax
>005C0492    je          005C04A7
 005C0494    lea         eax,[ebx+0D4]
 005C049A    mov         edx,dword ptr [eax]
 005C049C    xor         ecx,ecx
 005C049E    mov         dword ptr [eax],ecx
 005C04A0    mov         eax,edx
 005C04A2    call        TObject.Free
 005C04A7    cmp         dword ptr [ebx+0D4],0
>005C04AE    jne         005C04C1
 005C04B0    xor         ecx,ecx
 005C04B2    mov         dl,1
 005C04B4    mov         eax,edi
 005C04B6    call        TIdBaseComponent.Create
 005C04BB    mov         dword ptr [ebx+0D4],eax
 005C04C1    mov         edx,esi
 005C04C3    mov         eax,dword ptr [ebx+0D4]
 005C04C9    mov         ecx,dword ptr [eax]
 005C04CB    call        dword ptr [ecx+8]
>005C04CE    jmp         005C0541
 005C04D0    mov         eax,dword ptr [ebx+0D4]
 005C04D6    test        eax,eax
>005C04D8    je          005C04FC
 005C04DA    cmp         dword ptr [eax+4],0
>005C04DE    jne         005C04F5
 005C04E0    lea         eax,[ebx+0D4]
 005C04E6    mov         edx,dword ptr [eax]
 005C04E8    xor         ecx,ecx
 005C04EA    mov         dword ptr [eax],ecx
 005C04EC    mov         eax,edx
 005C04EE    call        TObject.Free
>005C04F3    jmp         005C04FC
 005C04F5    mov         edx,ebx
 005C04F7    call        TComponent.RemoveFreeNotification
 005C04FC    mov         eax,esi
 005C04FE    mov         dword ptr [ebx+0D4],eax
 005C0504    mov         edx,ebx
 005C0506    call        TComponent.FreeNotification
>005C050B    jmp         005C0541
 005C050D    mov         eax,dword ptr [ebx+0D4]
 005C0513    test        eax,eax
>005C0515    je          005C0541
 005C0517    cmp         dword ptr [eax+4],0
>005C051B    jne         005C0532
 005C051D    lea         eax,[ebx+0D4]
 005C0523    mov         edx,dword ptr [eax]
 005C0525    xor         ecx,ecx
 005C0527    mov         dword ptr [eax],ecx
 005C0529    mov         eax,edx
 005C052B    call        TObject.Free
>005C0530    jmp         005C0541
 005C0532    mov         edx,ebx
 005C0534    call        TComponent.RemoveFreeNotification
 005C0539    xor         eax,eax
 005C053B    mov         dword ptr [ebx+0D4],eax
 005C0541    pop         edi
 005C0542    pop         esi
 005C0543    pop         ebx
 005C0544    ret
*}
end;

//005C0548
function TIdUDPClient.UseProxy:Boolean;
begin
{*
 005C0548    mov         edx,dword ptr [eax+0D4]
 005C054E    test        edx,edx
>005C0550    je          005C055A
 005C0552    mov         eax,edx
 005C0554    mov         edx,dword ptr [eax]
 005C0556    call        dword ptr [edx+44]
 005C0559    ret
 005C055A    xor         eax,eax
 005C055C    ret
*}
end;

//005C0560
destructor TIdUDPClient.Destroy();
begin
{*
 005C0560    push        ebx
 005C0561    push        esi
 005C0562    call        @BeforeDestruction
 005C0567    mov         ebx,edx
 005C0569    mov         esi,eax
 005C056B    mov         eax,esi
 005C056D    call        TIdUDPClient.UseProxy
 005C0572    test        al,al
>005C0574    je          005C0586
 005C0576    cmp         byte ptr [esi+0BA],0
>005C057D    je          005C0586
 005C057F    mov         eax,esi
 005C0581    call        TIdUDPClient.CloseProxy
 005C0586    mov         eax,esi
 005C0588    call        TIdUDPClient.Connected
 005C058D    test        al,al
>005C058F    je          005C059B
 005C0591    mov         eax,esi
 005C0593    mov         edx,dword ptr [eax]
 005C0595    call        dword ptr [edx+88]
 005C059B    mov         edx,ebx
 005C059D    and         dl,0FC
 005C05A0    mov         eax,esi
 005C05A2    call        TIdUDPBase.Destroy
 005C05A7    test        bl,bl
>005C05A9    jle         005C05B2
 005C05AB    mov         eax,esi
 005C05AD    call        @ClassDestroy
 005C05B2    pop         esi
 005C05B3    pop         ebx
 005C05B4    ret
*}
end;

//005C05B8
procedure TIdUDPClient.ReceiveBuffer(var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; var VIPVersion:TIdIPVersion; const AMSec:Integer);
begin
{*
 005C05B8    push        ebp
 005C05B9    mov         ebp,esp
 005C05BB    push        ecx
 005C05BC    push        ebx
 005C05BD    push        esi
 005C05BE    push        edi
 005C05BF    mov         dword ptr [ebp-4],ecx
 005C05C2    mov         edi,edx
 005C05C4    mov         ebx,eax
 005C05C6    mov         eax,dword ptr [ebp+8]
 005C05C9    cmp         eax,0FFFFFFFF
>005C05CC    jne         005C05E3
 005C05CE    mov         eax,dword ptr [ebx+0A4]
 005C05D4    test        eax,eax
>005C05D6    jne         005C05DF
 005C05D8    mov         esi,0FFFFFFFE
>005C05DD    jmp         005C05E5
 005C05DF    mov         esi,eax
>005C05E1    jmp         005C05E5
 005C05E3    mov         esi,eax
 005C05E5    mov         eax,ebx
 005C05E7    call        TIdUDPClient.UseProxy
 005C05EC    test        al,al
>005C05EE    je          005C0625
 005C05F0    cmp         byte ptr [ebx+0BA],0
>005C05F7    jne         005C0600
 005C05F9    mov         eax,ebx
 005C05FB    call        TIdUDPClient.RaiseUseProxyError
 005C0600    mov         eax,dword ptr [ebp-4]
 005C0603    push        eax
 005C0604    mov         eax,dword ptr [ebp+10]
 005C0607    push        eax
 005C0608    mov         eax,dword ptr [ebp+0C]
 005C060B    push        eax
 005C060C    push        esi
 005C060D    mov         eax,ebx
 005C060F    mov         edx,dword ptr [eax]
 005C0611    call        dword ptr [edx+4C]
 005C0614    mov         edx,eax
 005C0616    mov         ecx,edi
 005C0618    mov         eax,dword ptr [ebx+0D4]
 005C061E    mov         ebx,dword ptr [eax]
 005C0620    call        dword ptr [ebx+58]
>005C0623    jmp         005C063A
 005C0625    mov         eax,dword ptr [ebp+10]
 005C0628    push        eax
 005C0629    mov         eax,dword ptr [ebp+0C]
 005C062C    push        eax
 005C062D    push        esi
 005C062E    mov         ecx,dword ptr [ebp-4]
 005C0631    mov         edx,edi
 005C0633    mov         eax,ebx
 005C0635    call        TIdUDPBase.ReceiveBuffer
 005C063A    pop         edi
 005C063B    pop         esi
 005C063C    pop         ebx
 005C063D    pop         ecx
 005C063E    pop         ebp
 005C063F    ret         0C
*}
end;

//005C0644
procedure TIdUDPClient.SendBuffer(const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion; const ABuffer:TIdBytes);
begin
{*
 005C0644    push        ebp
 005C0645    mov         ebp,esp
 005C0647    push        ebx
 005C0648    push        esi
 005C0649    push        edi
 005C064A    mov         edi,ecx
 005C064C    mov         esi,edx
 005C064E    mov         ebx,eax
 005C0650    mov         eax,ebx
 005C0652    call        TIdUDPClient.UseProxy
 005C0657    test        al,al
>005C0659    je          005C068D
 005C065B    cmp         byte ptr [ebx+0BA],0
>005C0662    jne         005C066B
 005C0664    mov         eax,ebx
 005C0666    call        TIdUDPClient.RaiseUseProxyError
 005C066B    push        edi
 005C066C    movzx       eax,byte ptr [ebp+0C]
 005C0670    push        eax
 005C0671    mov         eax,dword ptr [ebp+8]
 005C0674    push        eax
 005C0675    mov         eax,ebx
 005C0677    mov         edx,dword ptr [eax]
 005C0679    call        dword ptr [edx+4C]
 005C067C    mov         edx,eax
 005C067E    mov         ecx,esi
 005C0680    mov         eax,dword ptr [ebx+0D4]
 005C0686    mov         ebx,dword ptr [eax]
 005C0688    call        dword ptr [ebx+5C]
>005C068B    jmp         005C06A1
 005C068D    movzx       eax,byte ptr [ebp+0C]
 005C0691    push        eax
 005C0692    mov         eax,dword ptr [ebp+8]
 005C0695    push        eax
 005C0696    mov         ecx,edi
 005C0698    mov         edx,esi
 005C069A    mov         eax,ebx
 005C069C    call        TIdUDPBase.SendBuffer
 005C06A1    pop         edi
 005C06A2    pop         esi
 005C06A3    pop         ebx
 005C06A4    pop         ebp
 005C06A5    ret         8
*}
end;

//005C0A7C
constructor TIdThreadSafe.Create();
begin
{*
 005C0A7C    push        ebx
 005C0A7D    push        esi
 005C0A7E    test        dl,dl
>005C0A80    je          005C0A8A
 005C0A82    add         esp,0FFFFFFF0
 005C0A85    call        @ClassCreate
 005C0A8A    mov         ebx,edx
 005C0A8C    mov         esi,eax
 005C0A8E    xor         edx,edx
 005C0A90    mov         eax,esi
 005C0A92    call        TObject.Create
 005C0A97    mov         dl,1
 005C0A99    mov         eax,[005970A8];TIdCriticalSection
 005C0A9E    call        TCriticalSection.Create
 005C0AA3    mov         dword ptr [esi+4],eax
 005C0AA6    mov         eax,esi
 005C0AA8    test        bl,bl
>005C0AAA    je          005C0ABB
 005C0AAC    call        @AfterConstruction
 005C0AB1    pop         dword ptr fs:[0]
 005C0AB8    add         esp,0C
 005C0ABB    mov         eax,esi
 005C0ABD    pop         esi
 005C0ABE    pop         ebx
 005C0ABF    ret
*}
end;

//005C0AC0
destructor TIdThreadSafe.Destroy();
begin
{*
 005C0AC0    push        ebx
 005C0AC1    push        esi
 005C0AC2    call        @BeforeDestruction
 005C0AC7    mov         ebx,edx
 005C0AC9    mov         esi,eax
 005C0ACB    lea         eax,[esi+4]
 005C0ACE    mov         edx,dword ptr [eax]
 005C0AD0    xor         ecx,ecx
 005C0AD2    mov         dword ptr [eax],ecx
 005C0AD4    mov         eax,edx
 005C0AD6    call        TObject.Free
 005C0ADB    mov         edx,ebx
 005C0ADD    and         dl,0FC
 005C0AE0    mov         eax,esi
 005C0AE2    call        TObject.Destroy
 005C0AE7    test        bl,bl
>005C0AE9    jle         005C0AF2
 005C0AEB    mov         eax,esi
 005C0AED    call        @ClassDestroy
 005C0AF2    pop         esi
 005C0AF3    pop         ebx
 005C0AF4    ret
*}
end;

//005C0AF8
procedure TIdThreadSafe.Lock;
begin
{*
 005C0AF8    mov         eax,dword ptr [eax+4]
 005C0AFB    mov         edx,dword ptr [eax]
 005C0AFD    call        dword ptr [edx]
 005C0AFF    ret
*}
end;

//005C0B00
procedure TIdThreadSafe.Unlock;
begin
{*
 005C0B00    mov         eax,dword ptr [eax+4]
 005C0B03    mov         edx,dword ptr [eax]
 005C0B05    call        dword ptr [edx+4]
 005C0B08    ret
*}
end;

//005C0B0C
function TIdThreadSafeInteger.Decrement:Integer;
begin
{*
 005C0B0C    push        ebp
 005C0B0D    mov         ebp,esp
 005C0B0F    add         esp,0FFFFFFF8
 005C0B12    mov         dword ptr [ebp-4],eax
 005C0B15    mov         eax,dword ptr [ebp-4]
 005C0B18    call        TIdThreadSafe.Lock
 005C0B1D    xor         eax,eax
 005C0B1F    push        ebp
 005C0B20    push        5C0B50
 005C0B25    push        dword ptr fs:[eax]
 005C0B28    mov         dword ptr fs:[eax],esp
 005C0B2B    mov         eax,dword ptr [ebp-4]
 005C0B2E    mov         eax,dword ptr [eax+8]
 005C0B31    mov         dword ptr [ebp-8],eax
 005C0B34    mov         eax,dword ptr [ebp-4]
 005C0B37    dec         dword ptr [eax+8]
 005C0B3A    xor         eax,eax
 005C0B3C    pop         edx
 005C0B3D    pop         ecx
 005C0B3E    pop         ecx
 005C0B3F    mov         dword ptr fs:[eax],edx
 005C0B42    push        5C0B57
 005C0B47    mov         eax,dword ptr [ebp-4]
 005C0B4A    call        TIdThreadSafe.Unlock
 005C0B4F    ret
>005C0B50    jmp         @HandleFinally
>005C0B55    jmp         005C0B47
 005C0B57    mov         eax,dword ptr [ebp-8]
 005C0B5A    pop         ecx
 005C0B5B    pop         ecx
 005C0B5C    pop         ebp
 005C0B5D    ret
*}
end;

//005C0B60
function TIdThreadSafeInteger.Decrement(AValue:Integer):Integer;
begin
{*
 005C0B60    push        ebp
 005C0B61    mov         ebp,esp
 005C0B63    add         esp,0FFFFFFF8
 005C0B66    push        ebx
 005C0B67    mov         ebx,edx
 005C0B69    mov         dword ptr [ebp-4],eax
 005C0B6C    mov         eax,dword ptr [ebp-4]
 005C0B6F    call        TIdThreadSafe.Lock
 005C0B74    xor         eax,eax
 005C0B76    push        ebp
 005C0B77    push        5C0BA7
 005C0B7C    push        dword ptr fs:[eax]
 005C0B7F    mov         dword ptr fs:[eax],esp
 005C0B82    mov         eax,dword ptr [ebp-4]
 005C0B85    mov         eax,dword ptr [eax+8]
 005C0B88    mov         dword ptr [ebp-8],eax
 005C0B8B    mov         eax,dword ptr [ebp-4]
 005C0B8E    sub         dword ptr [eax+8],ebx
 005C0B91    xor         eax,eax
 005C0B93    pop         edx
 005C0B94    pop         ecx
 005C0B95    pop         ecx
 005C0B96    mov         dword ptr fs:[eax],edx
 005C0B99    push        5C0BAE
 005C0B9E    mov         eax,dword ptr [ebp-4]
 005C0BA1    call        TIdThreadSafe.Unlock
 005C0BA6    ret
>005C0BA7    jmp         @HandleFinally
>005C0BAC    jmp         005C0B9E
 005C0BAE    mov         eax,dword ptr [ebp-8]
 005C0BB1    pop         ebx
 005C0BB2    pop         ecx
 005C0BB3    pop         ecx
 005C0BB4    pop         ebp
 005C0BB5    ret
*}
end;

//005C0BB8
function TIdThreadSafeCardinal.GetValue:Cardinal;
begin
{*
 005C0BB8    push        ebp
 005C0BB9    mov         ebp,esp
 005C0BBB    add         esp,0FFFFFFF8
 005C0BBE    mov         dword ptr [ebp-4],eax
 005C0BC1    mov         eax,dword ptr [ebp-4]
 005C0BC4    call        TIdThreadSafe.Lock
 005C0BC9    xor         eax,eax
 005C0BCB    push        ebp
 005C0BCC    push        5C0BF6
 005C0BD1    push        dword ptr fs:[eax]
 005C0BD4    mov         dword ptr fs:[eax],esp
 005C0BD7    mov         eax,dword ptr [ebp-4]
 005C0BDA    mov         eax,dword ptr [eax+8]
 005C0BDD    mov         dword ptr [ebp-8],eax
 005C0BE0    xor         eax,eax
 005C0BE2    pop         edx
 005C0BE3    pop         ecx
 005C0BE4    pop         ecx
 005C0BE5    mov         dword ptr fs:[eax],edx
 005C0BE8    push        5C0BFD
 005C0BED    mov         eax,dword ptr [ebp-4]
 005C0BF0    call        TIdThreadSafe.Unlock
 005C0BF5    ret
>005C0BF6    jmp         @HandleFinally
>005C0BFB    jmp         005C0BED
 005C0BFD    mov         eax,dword ptr [ebp-8]
 005C0C00    pop         ecx
 005C0C01    pop         ecx
 005C0C02    pop         ebp
 005C0C03    ret
*}
end;

//005C0C04
function TIdThreadSafeInteger.Increment:Integer;
begin
{*
 005C0C04    push        ebp
 005C0C05    mov         ebp,esp
 005C0C07    add         esp,0FFFFFFF8
 005C0C0A    mov         dword ptr [ebp-4],eax
 005C0C0D    mov         eax,dword ptr [ebp-4]
 005C0C10    call        TIdThreadSafe.Lock
 005C0C15    xor         eax,eax
 005C0C17    push        ebp
 005C0C18    push        5C0C48
 005C0C1D    push        dword ptr fs:[eax]
 005C0C20    mov         dword ptr fs:[eax],esp
 005C0C23    mov         eax,dword ptr [ebp-4]
 005C0C26    mov         eax,dword ptr [eax+8]
 005C0C29    mov         dword ptr [ebp-8],eax
 005C0C2C    mov         eax,dword ptr [ebp-4]
 005C0C2F    inc         dword ptr [eax+8]
 005C0C32    xor         eax,eax
 005C0C34    pop         edx
 005C0C35    pop         ecx
 005C0C36    pop         ecx
 005C0C37    mov         dword ptr fs:[eax],edx
 005C0C3A    push        5C0C4F
 005C0C3F    mov         eax,dword ptr [ebp-4]
 005C0C42    call        TIdThreadSafe.Unlock
 005C0C47    ret
>005C0C48    jmp         @HandleFinally
>005C0C4D    jmp         005C0C3F
 005C0C4F    mov         eax,dword ptr [ebp-8]
 005C0C52    pop         ecx
 005C0C53    pop         ecx
 005C0C54    pop         ebp
 005C0C55    ret
*}
end;

//005C0C58
function TIdThreadSafeInteger.Increment(AValue:Integer):Integer;
begin
{*
 005C0C58    push        ebp
 005C0C59    mov         ebp,esp
 005C0C5B    add         esp,0FFFFFFF8
 005C0C5E    push        ebx
 005C0C5F    mov         ebx,edx
 005C0C61    mov         dword ptr [ebp-4],eax
 005C0C64    mov         eax,dword ptr [ebp-4]
 005C0C67    call        TIdThreadSafe.Lock
 005C0C6C    xor         eax,eax
 005C0C6E    push        ebp
 005C0C6F    push        5C0C9F
 005C0C74    push        dword ptr fs:[eax]
 005C0C77    mov         dword ptr fs:[eax],esp
 005C0C7A    mov         eax,dword ptr [ebp-4]
 005C0C7D    mov         eax,dword ptr [eax+8]
 005C0C80    mov         dword ptr [ebp-8],eax
 005C0C83    mov         eax,dword ptr [ebp-4]
 005C0C86    add         dword ptr [eax+8],ebx
 005C0C89    xor         eax,eax
 005C0C8B    pop         edx
 005C0C8C    pop         ecx
 005C0C8D    pop         ecx
 005C0C8E    mov         dword ptr fs:[eax],edx
 005C0C91    push        5C0CA6
 005C0C96    mov         eax,dword ptr [ebp-4]
 005C0C99    call        TIdThreadSafe.Unlock
 005C0C9E    ret
>005C0C9F    jmp         @HandleFinally
>005C0CA4    jmp         005C0C96
 005C0CA6    mov         eax,dword ptr [ebp-8]
 005C0CA9    pop         ebx
 005C0CAA    pop         ecx
 005C0CAB    pop         ecx
 005C0CAC    pop         ebp
 005C0CAD    ret
*}
end;

//005C0CB0
procedure TIdThreadSafeCardinal.SetValue(const AValue:Cardinal);
begin
{*
 005C0CB0    push        ebp
 005C0CB1    mov         ebp,esp
 005C0CB3    push        ecx
 005C0CB4    push        ebx
 005C0CB5    mov         ebx,edx
 005C0CB7    mov         dword ptr [ebp-4],eax
 005C0CBA    mov         eax,dword ptr [ebp-4]
 005C0CBD    call        TIdThreadSafe.Lock
 005C0CC2    xor         eax,eax
 005C0CC4    push        ebp
 005C0CC5    push        5C0CEC
 005C0CCA    push        dword ptr fs:[eax]
 005C0CCD    mov         dword ptr fs:[eax],esp
 005C0CD0    mov         eax,dword ptr [ebp-4]
 005C0CD3    mov         dword ptr [eax+8],ebx
 005C0CD6    xor         eax,eax
 005C0CD8    pop         edx
 005C0CD9    pop         ecx
 005C0CDA    pop         ecx
 005C0CDB    mov         dword ptr fs:[eax],edx
 005C0CDE    push        5C0CF3
 005C0CE3    mov         eax,dword ptr [ebp-4]
 005C0CE6    call        TIdThreadSafe.Unlock
 005C0CEB    ret
>005C0CEC    jmp         @HandleFinally
>005C0CF1    jmp         005C0CE3
 005C0CF3    pop         ebx
 005C0CF4    pop         ecx
 005C0CF5    pop         ebp
 005C0CF6    ret
*}
end;

//005C157C
procedure TIdThread.TerminateAndWaitFor;
begin
{*
 005C157C    push        ebp
 005C157D    mov         ebp,esp
 005C157F    push        0
 005C1581    push        ebx
 005C1582    mov         ebx,eax
 005C1584    xor         eax,eax
 005C1586    push        ebp
 005C1587    push        5C15E4
 005C158C    push        dword ptr fs:[eax]
 005C158F    mov         dword ptr fs:[eax],esp
 005C1592    cmp         byte ptr [ebx+0F],0
>005C1596    je          005C15B9
 005C1598    lea         edx,[ebp-4]
 005C159B    mov         eax,[0078D550];^SResString694:TResStringRec
 005C15A0    call        LoadResString
 005C15A5    mov         ecx,dword ptr [ebp-4]
 005C15A8    mov         dl,1
 005C15AA    mov         eax,[005C0DA4];EIdThreadTerminateAndWaitFor
 005C15AF    call        EIdException.Create
 005C15B4    call        @RaiseExcept
 005C15B9    mov         eax,ebx
 005C15BB    mov         edx,dword ptr [eax]
 005C15BD    call        dword ptr [edx+38]
 005C15C0    mov         eax,ebx
 005C15C2    mov         edx,dword ptr [eax]
 005C15C4    call        dword ptr [edx+30]
 005C15C7    mov         eax,ebx
 005C15C9    call        TThread.WaitFor
 005C15CE    xor         eax,eax
 005C15D0    pop         edx
 005C15D1    pop         ecx
 005C15D2    pop         ecx
 005C15D3    mov         dword ptr fs:[eax],edx
 005C15D6    push        5C15EB
 005C15DB    lea         eax,[ebp-4]
 005C15DE    call        @UStrClr
 005C15E3    ret
>005C15E4    jmp         @HandleFinally
>005C15E9    jmp         005C15DB
 005C15EB    pop         ebx
 005C15EC    pop         ecx
 005C15ED    pop         ebp
 005C15EE    ret
*}
end;

//005C15F0
procedure sub_005C15F0;
begin
{*
 005C15F0    ret
*}
end;

//005C15F4
procedure TIdThread.AfterRun;
begin
{*
 005C15F4    ret
*}
end;

//005C15F8
procedure sub_005C15F8;
begin
{*
 005C15F8    ret
*}
end;

//005C15FC
procedure sub_005C15FC;
begin
{*
 005C15FC    ret
*}
end;

//005C1600
procedure TIdThread.Execute;
begin
{*
 005C1600    push        ebp
 005C1601    mov         ebp,esp
 005C1603    push        ecx
 005C1604    push        ebx
 005C1605    push        esi
 005C1606    push        edi
 005C1607    mov         dword ptr [ebp-4],eax
 005C160A    mov         eax,dword ptr [ebp-4]
 005C160D    cmp         dword ptr [eax+4C],0
>005C1611    jne         005C1623
 005C1613    mov         eax,dword ptr [ebp-4]
 005C1616    add         eax,4C
 005C1619    mov         edx,5C187C;'IdThread (unknown)'
 005C161E    call        @UStrAsg
 005C1623    mov         eax,dword ptr [ebp-4]
 005C1626    mov         eax,dword ptr [eax+4C]
 005C1629    or          edx,0FFFFFFFF
 005C162C    call        SetThreadName
 005C1631    xor         edx,edx
 005C1633    push        ebp
 005C1634    push        5C1825
 005C1639    push        dword ptr fs:[edx]
 005C163C    mov         dword ptr fs:[edx],esp
 005C163F    mov         eax,dword ptr [ebp-4]
 005C1642    mov         edx,dword ptr [eax]
 005C1644    call        dword ptr [edx+10]
 005C1647    xor         eax,eax
 005C1649    push        ebp
 005C164A    push        5C1814
 005C164F    push        dword ptr fs:[eax]
 005C1652    mov         dword ptr fs:[eax],esp
>005C1655    jmp         005C17F1
 005C165A    mov         eax,dword ptr [ebp-4]
 005C165D    call        TIdThread.GetStopped
 005C1662    test        al,al
>005C1664    je          005C169E
 005C1666    mov         eax,dword ptr [ebp-4]
 005C1669    mov         edx,dword ptr [eax]
 005C166B    call        dword ptr [edx+20]
 005C166E    mov         eax,dword ptr [ebp-4]
 005C1671    call        TIdThread.GetStopped
 005C1676    test        al,al
>005C1678    je          005C169E
 005C167A    mov         eax,dword ptr [ebp-4]
 005C167D    cmp         byte ptr [eax+0D],0
>005C1681    jne         005C17FE
 005C1687    mov         dl,1
 005C1689    mov         eax,dword ptr [ebp-4]
 005C168C    call        TThread.SetSuspended
 005C1691    mov         eax,dword ptr [ebp-4]
 005C1694    cmp         byte ptr [eax+0D],0
>005C1698    jne         005C17FE
 005C169E    mov         eax,dword ptr [ebp-4]
 005C16A1    or          byte ptr [eax+51],2
 005C16A5    xor         eax,eax
 005C16A7    push        ebp
 005C16A8    push        5C17EA
 005C16AD    push        dword ptr fs:[eax]
 005C16B0    mov         dword ptr fs:[eax],esp
 005C16B3    xor         eax,eax
 005C16B5    push        ebp
 005C16B6    push        5C17BD
 005C16BB    push        dword ptr fs:[eax]
 005C16BE    mov         dword ptr fs:[eax],esp
 005C16C1    mov         eax,dword ptr [ebp-4]
 005C16C4    mov         edx,dword ptr [eax]
 005C16C6    call        dword ptr [edx+14]
 005C16C9    xor         eax,eax
 005C16CB    push        ebp
 005C16CC    push        5C17AC
 005C16D1    push        dword ptr fs:[eax]
 005C16D4    mov         dword ptr fs:[eax],esp
 005C16D7    mov         eax,dword ptr [ebp-4]
 005C16DA    cmp         byte ptr [eax+48],0
>005C16DE    je          005C1743
>005C16E0    jmp         005C1735
 005C16E2    xor         eax,eax
 005C16E4    push        ebp
 005C16E5    push        5C1702
 005C16EA    push        dword ptr fs:[eax]
 005C16ED    mov         dword ptr fs:[eax],esp
 005C16F0    mov         eax,dword ptr [ebp-4]
 005C16F3    mov         edx,dword ptr [eax]
 005C16F5    call        dword ptr [edx+28]
 005C16F8    xor         eax,eax
 005C16FA    pop         edx
 005C16FB    pop         ecx
 005C16FC    pop         ecx
 005C16FD    mov         dword ptr fs:[eax],edx
>005C1700    jmp         005C1735
>005C1702    jmp         @HandleOnException
 005C1707    dd          1
 005C170B    dd          00418C04;Exception
 005C170F    dd          005C1713
 005C1713    mov         ebx,eax
 005C1715    mov         edx,ebx
 005C1717    mov         eax,dword ptr [ebp-4]
 005C171A    mov         ecx,dword ptr [eax]
 005C171C    call        dword ptr [ecx+24]
 005C171F    test        al,al
>005C1721    jne         005C1730
 005C1723    mov         eax,dword ptr [ebp-4]
 005C1726    mov         edx,dword ptr [eax]
 005C1728    call        dword ptr [edx+38]
 005C172B    call        @RaiseAgain
 005C1730    call        @DoneExcept
 005C1735    mov         eax,dword ptr [ebp-4]
 005C1738    call        TIdThread.GetStopped
 005C173D    test        al,al
>005C173F    je          005C16E2
>005C1741    jmp         005C1796
 005C1743    xor         eax,eax
 005C1745    push        ebp
 005C1746    push        5C1763
 005C174B    push        dword ptr fs:[eax]
 005C174E    mov         dword ptr fs:[eax],esp
 005C1751    mov         eax,dword ptr [ebp-4]
 005C1754    mov         edx,dword ptr [eax]
 005C1756    call        dword ptr [edx+28]
 005C1759    xor         eax,eax
 005C175B    pop         edx
 005C175C    pop         ecx
 005C175D    pop         ecx
 005C175E    mov         dword ptr fs:[eax],edx
>005C1761    jmp         005C1796
>005C1763    jmp         @HandleOnException
 005C1768    dd          1
 005C176C    dd          00418C04;Exception
 005C1770    dd          005C1774
 005C1774    mov         esi,eax
 005C1776    mov         edx,esi
 005C1778    mov         eax,dword ptr [ebp-4]
 005C177B    mov         ecx,dword ptr [eax]
 005C177D    call        dword ptr [ecx+24]
 005C1780    test        al,al
>005C1782    jne         005C1791
 005C1784    mov         eax,dword ptr [ebp-4]
 005C1787    mov         edx,dword ptr [eax]
 005C1789    call        dword ptr [edx+38]
 005C178C    call        @RaiseAgain
 005C1791    call        @DoneExcept
 005C1796    xor         eax,eax
 005C1798    pop         edx
 005C1799    pop         ecx
 005C179A    pop         ecx
 005C179B    mov         dword ptr fs:[eax],edx
 005C179E    push        5C17B3
 005C17A3    mov         eax,dword ptr [ebp-4]
 005C17A6    mov         edx,dword ptr [eax]
 005C17A8    call        dword ptr [edx+8]
 005C17AB    ret
>005C17AC    jmp         @HandleFinally
>005C17B1    jmp         005C17A3
 005C17B3    xor         eax,eax
 005C17B5    pop         edx
 005C17B6    pop         ecx
 005C17B7    pop         ecx
 005C17B8    mov         dword ptr fs:[eax],edx
>005C17BB    jmp         005C17D4
>005C17BD    jmp         @HandleAnyException
 005C17C2    mov         eax,dword ptr [ebp-4]
 005C17C5    mov         edx,dword ptr [eax]
 005C17C7    call        dword ptr [edx+38]
 005C17CA    call        @RaiseAgain
 005C17CF    call        @DoneExcept
 005C17D4    xor         eax,eax
 005C17D6    pop         edx
 005C17D7    pop         ecx
 005C17D8    pop         ecx
 005C17D9    mov         dword ptr fs:[eax],edx
 005C17DC    push        5C17F1
 005C17E1    mov         eax,dword ptr [ebp-4]
 005C17E4    mov         edx,dword ptr [eax]
 005C17E6    call        dword ptr [edx+18]
 005C17E9    ret
>005C17EA    jmp         @HandleFinally
>005C17EF    jmp         005C17E1
 005C17F1    mov         eax,dword ptr [ebp-4]
 005C17F4    cmp         byte ptr [eax+0D],0
>005C17F8    je          005C165A
 005C17FE    xor         eax,eax
 005C1800    pop         edx
 005C1801    pop         ecx
 005C1802    pop         ecx
 005C1803    mov         dword ptr fs:[eax],edx
 005C1806    push        5C181B
 005C180B    mov         eax,dword ptr [ebp-4]
 005C180E    mov         edx,dword ptr [eax]
 005C1810    call        dword ptr [edx+0C]
 005C1813    ret
>005C1814    jmp         @HandleFinally
>005C1819    jmp         005C180B
 005C181B    xor         eax,eax
 005C181D    pop         edx
 005C181E    pop         ecx
 005C181F    pop         ecx
 005C1820    mov         dword ptr fs:[eax],edx
>005C1823    jmp         005C1867
>005C1825    jmp         @HandleOnException
 005C182A    dd          1
 005C182E    dd          00418C04;Exception
 005C1832    dd          005C1836
 005C1836    mov         ebx,eax
 005C1838    mov         edx,dword ptr [ebx]
 005C183A    mov         eax,edx
 005C183C    mov         edx,dword ptr [ebp-4]
 005C183F    mov         dword ptr [edx+58],eax
 005C1842    mov         eax,dword ptr [ebp-4]
 005C1845    add         eax,54
 005C1848    mov         edx,dword ptr [ebx+4]
 005C184B    call        @UStrAsg
 005C1850    mov         edx,ebx
 005C1852    mov         eax,dword ptr [ebp-4]
 005C1855    mov         ecx,dword ptr [eax]
 005C1857    call        dword ptr [ecx+1C]
 005C185A    mov         eax,dword ptr [ebp-4]
 005C185D    mov         edx,dword ptr [eax]
 005C185F    call        dword ptr [edx+38]
 005C1862    call        @DoneExcept
 005C1867    pop         edi
 005C1868    pop         esi
 005C1869    pop         ebx
 005C186A    pop         ecx
 005C186B    pop         ebp
 005C186C    ret
*}
end;

//005C18A4
constructor TIdThread.Create(AName:string; ALoop:Boolean);
begin
{*
 005C18A4    push        ebp
 005C18A5    mov         ebp,esp
 005C18A7    push        ecx
 005C18A8    push        ebx
 005C18A9    push        esi
 005C18AA    test        dl,dl
>005C18AC    je          005C18B6
 005C18AE    add         esp,0FFFFFFF0
 005C18B1    call        @ClassCreate
 005C18B6    mov         ebx,ecx
 005C18B8    mov         byte ptr [ebp-1],dl
 005C18BB    mov         esi,eax
 005C18BD    movzx       eax,byte ptr ds:[5C1928]
 005C18C4    mov         byte ptr [esi+51],al
 005C18C7    test        bl,bl
>005C18C9    je          005C18CF
 005C18CB    or          byte ptr [esi+51],1
 005C18CF    mov         dl,1
 005C18D1    mov         eax,[005970A8];TIdCriticalSection
 005C18D6    call        TCriticalSection.Create
 005C18DB    mov         dword ptr [esi+44],eax
 005C18DE    movzx       eax,byte ptr [ebp+0C]
 005C18E2    mov         byte ptr [esi+48],al
 005C18E5    lea         eax,[esi+4C]
 005C18E8    mov         edx,dword ptr [ebp+8]
 005C18EB    call        @UStrAsg
 005C18F0    mov         ecx,ebx
 005C18F2    xor         edx,edx
 005C18F4    mov         eax,esi
 005C18F6    call        TThread.Create
 005C18FB    mov         eax,[00789F14]
 005C1900    call        TIdThreadSafeInteger.Increment
 005C1905    mov         eax,esi
 005C1907    cmp         byte ptr [ebp-1],0
>005C190B    je          005C191C
 005C190D    call        @AfterConstruction
 005C1912    pop         dword ptr fs:[0]
 005C1919    add         esp,0C
 005C191C    mov         eax,esi
 005C191E    pop         esi
 005C191F    pop         ebx
 005C1920    pop         ecx
 005C1921    pop         ebp
 005C1922    ret         8
*}
end;

//005C192C
destructor TIdThread.Destroy();
begin
{*
 005C192C    push        ebp
 005C192D    mov         ebp,esp
 005C192F    add         esp,0FFFFFFF8
 005C1932    call        @BeforeDestruction
 005C1937    mov         byte ptr [ebp-5],dl
 005C193A    mov         dword ptr [ebp-4],eax
 005C193D    mov         eax,dword ptr [ebp-4]
 005C1940    mov         byte ptr [eax+0F],0
 005C1944    mov         eax,dword ptr [ebp-4]
 005C1947    mov         edx,dword ptr [eax]
 005C1949    call        dword ptr [edx+38]
 005C194C    xor         ecx,ecx
 005C194E    push        ebp
 005C194F    push        5C1A04
 005C1954    push        dword ptr fs:[ecx]
 005C1957    mov         dword ptr fs:[ecx],esp
 005C195A    mov         eax,dword ptr [ebp-4]
 005C195D    test        byte ptr [eax+51],2
>005C1961    je          005C196B
 005C1963    mov         eax,dword ptr [ebp-4]
 005C1966    mov         edx,dword ptr [eax]
 005C1968    call        dword ptr [edx+18]
 005C196B    xor         eax,eax
 005C196D    pop         edx
 005C196E    pop         ecx
 005C196F    pop         ecx
 005C1970    mov         dword ptr fs:[eax],edx
 005C1973    push        5C1A0E
 005C1978    xor         ecx,ecx
 005C197A    push        ebp
 005C197B    push        5C19FC
 005C1980    push        dword ptr fs:[ecx]
 005C1983    mov         dword ptr fs:[ecx],esp
 005C1986    mov         eax,dword ptr [ebp-4]
 005C1989    add         eax,5C
 005C198C    mov         edx,dword ptr [eax]
 005C198E    xor         ecx,ecx
 005C1990    mov         dword ptr [eax],ecx
 005C1992    mov         eax,edx
 005C1994    call        TObject.Free
 005C1999    xor         eax,eax
 005C199B    pop         edx
 005C199C    pop         ecx
 005C199D    pop         ecx
 005C199E    mov         dword ptr fs:[eax],edx
 005C19A1    push        5C1A03
 005C19A6    mov         eax,dword ptr [ebp-4]
 005C19A9    mov         eax,dword ptr [eax+44]
 005C19AC    mov         edx,dword ptr [eax]
 005C19AE    call        dword ptr [edx]
 005C19B0    xor         eax,eax
 005C19B2    push        ebp
 005C19B3    push        5C19D7
 005C19B8    push        dword ptr fs:[eax]
 005C19BB    mov         dword ptr fs:[eax],esp
 005C19BE    xor         eax,eax
 005C19C0    pop         edx
 005C19C1    pop         ecx
 005C19C2    pop         ecx
 005C19C3    mov         dword ptr fs:[eax],edx
 005C19C6    push        5C19DE
 005C19CB    mov         eax,dword ptr [ebp-4]
 005C19CE    mov         eax,dword ptr [eax+44]
 005C19D1    mov         edx,dword ptr [eax]
 005C19D3    call        dword ptr [edx+4]
 005C19D6    ret
>005C19D7    jmp         @HandleFinally
>005C19DC    jmp         005C19CB
 005C19DE    mov         eax,dword ptr [ebp-4]
 005C19E1    add         eax,44
 005C19E4    mov         edx,dword ptr [eax]
 005C19E6    xor         ecx,ecx
 005C19E8    mov         dword ptr [eax],ecx
 005C19EA    mov         eax,edx
 005C19EC    call        TObject.Free
 005C19F1    mov         eax,[00789F14]
 005C19F6    call        TIdThreadSafeInteger.Decrement
 005C19FB    ret
>005C19FC    jmp         @HandleFinally
>005C1A01    jmp         005C19A6
 005C1A03    ret
>005C1A04    jmp         @HandleFinally
>005C1A09    jmp         005C1978
 005C1A0E    movzx       edx,byte ptr [ebp-5]
 005C1A12    and         dl,0FC
 005C1A15    mov         eax,dword ptr [ebp-4]
 005C1A18    call        TThread.Destroy
 005C1A1D    cmp         byte ptr [ebp-5],0
>005C1A21    jle         005C1A2B
 005C1A23    mov         eax,dword ptr [ebp-4]
 005C1A26    call        @ClassDestroy
 005C1A2B    pop         ecx
 005C1A2C    pop         ecx
 005C1A2D    pop         ebp
 005C1A2E    ret
*}
end;

//005C1A30
procedure TIdThread.Start;
begin
{*
 005C1A30    push        ebp
 005C1A31    mov         ebp,esp
 005C1A33    push        ecx
 005C1A34    mov         dword ptr [ebp-4],eax
 005C1A37    mov         eax,dword ptr [ebp-4]
 005C1A3A    mov         eax,dword ptr [eax+44]
 005C1A3D    mov         edx,dword ptr [eax]
 005C1A3F    call        dword ptr [edx]
 005C1A41    xor         eax,eax
 005C1A43    push        ebp
 005C1A44    push        5C1A97
 005C1A49    push        dword ptr fs:[eax]
 005C1A4C    mov         dword ptr fs:[eax],esp
 005C1A4F    mov         eax,dword ptr [ebp-4]
 005C1A52    call        TIdThread.GetStopped
 005C1A57    test        al,al
>005C1A59    je          005C1A7E
 005C1A5B    mov         eax,dword ptr [ebp-4]
 005C1A5E    cmp         byte ptr [eax+0D],0
>005C1A62    je          005C1A6D
 005C1A64    mov         eax,dword ptr [ebp-4]
 005C1A67    or          byte ptr [eax+51],1
>005C1A6B    jmp         005C1A74
 005C1A6D    mov         eax,dword ptr [ebp-4]
 005C1A70    and         byte ptr [eax+51],0FE
 005C1A74    xor         edx,edx
 005C1A76    mov         eax,dword ptr [ebp-4]
 005C1A79    call        TThread.SetSuspended
 005C1A7E    xor         eax,eax
 005C1A80    pop         edx
 005C1A81    pop         ecx
 005C1A82    pop         ecx
 005C1A83    mov         dword ptr fs:[eax],edx
 005C1A86    push        5C1A9E
 005C1A8B    mov         eax,dword ptr [ebp-4]
 005C1A8E    mov         eax,dword ptr [eax+44]
 005C1A91    mov         edx,dword ptr [eax]
 005C1A93    call        dword ptr [edx+4]
 005C1A96    ret
>005C1A97    jmp         @HandleFinally
>005C1A9C    jmp         005C1A8B
 005C1A9E    pop         ecx
 005C1A9F    pop         ebp
 005C1AA0    ret
*}
end;

//005C1AA4
procedure TIdThread.Stop;
begin
{*
 005C1AA4    push        ebp
 005C1AA5    mov         ebp,esp
 005C1AA7    push        ecx
 005C1AA8    mov         dword ptr [ebp-4],eax
 005C1AAB    mov         eax,dword ptr [ebp-4]
 005C1AAE    mov         eax,dword ptr [eax+44]
 005C1AB1    mov         edx,dword ptr [eax]
 005C1AB3    call        dword ptr [edx]
 005C1AB5    xor         eax,eax
 005C1AB7    push        ebp
 005C1AB8    push        5C1B02
 005C1ABD    push        dword ptr fs:[eax]
 005C1AC0    mov         dword ptr fs:[eax],esp
 005C1AC3    mov         eax,dword ptr [ebp-4]
 005C1AC6    call        TIdThread.GetStopped
 005C1ACB    test        al,al
>005C1ACD    jne         005C1AE9
 005C1ACF    mov         eax,dword ptr [ebp-4]
 005C1AD2    movzx       eax,byte ptr [eax+50]
 005C1AD6    sub         al,1
>005C1AD8    jae         005C1AE2
 005C1ADA    mov         eax,dword ptr [ebp-4]
 005C1ADD    mov         edx,dword ptr [eax]
 005C1ADF    call        dword ptr [edx+38]
 005C1AE2    mov         eax,dword ptr [ebp-4]
 005C1AE5    or          byte ptr [eax+51],1
 005C1AE9    xor         eax,eax
 005C1AEB    pop         edx
 005C1AEC    pop         ecx
 005C1AED    pop         ecx
 005C1AEE    mov         dword ptr fs:[eax],edx
 005C1AF1    push        5C1B09
 005C1AF6    mov         eax,dword ptr [ebp-4]
 005C1AF9    mov         eax,dword ptr [eax+44]
 005C1AFC    mov         edx,dword ptr [eax]
 005C1AFE    call        dword ptr [edx+4]
 005C1B01    ret
>005C1B02    jmp         @HandleFinally
>005C1B07    jmp         005C1AF6
 005C1B09    pop         ecx
 005C1B0A    pop         ebp
 005C1B0B    ret
*}
end;

//005C1B0C
function TIdThread.GetStopped:Boolean;
begin
{*
 005C1B0C    push        ebp
 005C1B0D    mov         ebp,esp
 005C1B0F    add         esp,0FFFFFFF8
 005C1B12    mov         dword ptr [ebp-4],eax
 005C1B15    mov         eax,dword ptr [ebp-4]
 005C1B18    mov         eax,dword ptr [eax+44]
 005C1B1B    test        eax,eax
>005C1B1D    je          005C1B75
 005C1B1F    mov         edx,dword ptr [eax]
 005C1B21    call        dword ptr [edx]
 005C1B23    xor         eax,eax
 005C1B25    push        ebp
 005C1B26    push        5C1B6E
 005C1B2B    push        dword ptr fs:[eax]
 005C1B2E    mov         dword ptr fs:[eax],esp
 005C1B31    mov         eax,dword ptr [ebp-4]
 005C1B34    cmp         byte ptr [eax+0D],0
>005C1B38    jne         005C1B50
 005C1B3A    mov         eax,dword ptr [ebp-4]
 005C1B3D    test        byte ptr [eax+51],1
>005C1B41    jne         005C1B50
 005C1B43    mov         eax,dword ptr [ebp-4]
 005C1B46    cmp         byte ptr [eax+0E],0
>005C1B4A    jne         005C1B50
 005C1B4C    xor         eax,eax
>005C1B4E    jmp         005C1B52
 005C1B50    mov         al,1
 005C1B52    mov         byte ptr [ebp-5],al
 005C1B55    xor         eax,eax
 005C1B57    pop         edx
 005C1B58    pop         ecx
 005C1B59    pop         ecx
 005C1B5A    mov         dword ptr fs:[eax],edx
 005C1B5D    push        5C1B79
 005C1B62    mov         eax,dword ptr [ebp-4]
 005C1B65    mov         eax,dword ptr [eax+44]
 005C1B68    mov         edx,dword ptr [eax]
 005C1B6A    call        dword ptr [edx+4]
 005C1B6D    ret
>005C1B6E    jmp         @HandleFinally
>005C1B73    jmp         005C1B62
 005C1B75    mov         byte ptr [ebp-5],1
 005C1B79    movzx       eax,byte ptr [ebp-5]
 005C1B7D    pop         ecx
 005C1B7E    pop         ecx
 005C1B7F    pop         ebp
 005C1B80    ret
*}
end;

//005C1B84
procedure TIdThread.DoStopped;
begin
{*
 005C1B84    push        ebx
 005C1B85    cmp         word ptr [eax+6A],0
>005C1B8A    je          005C1B96
 005C1B8C    mov         ebx,eax
 005C1B8E    mov         edx,eax
 005C1B90    mov         eax,dword ptr [ebx+6C]
 005C1B93    call        dword ptr [ebx+68]
 005C1B96    pop         ebx
 005C1B97    ret
*}
end;

//005C1B98
procedure TIdThread.DoException(AException:Exception);
begin
{*
 005C1B98    push        ebx
 005C1B99    cmp         word ptr [eax+62],0
>005C1B9E    je          005C1BAC
 005C1BA0    mov         ebx,eax
 005C1BA2    mov         ecx,edx
 005C1BA4    mov         edx,eax
 005C1BA6    mov         eax,dword ptr [ebx+64]
 005C1BA9    call        dword ptr [ebx+60]
 005C1BAC    pop         ebx
 005C1BAD    ret
*}
end;

//005C1BB0
procedure TIdThread.Terminate;
begin
{*
 005C1BB0    push        ebp
 005C1BB1    mov         ebp,esp
 005C1BB3    push        ecx
 005C1BB4    mov         dword ptr [ebp-4],eax
 005C1BB7    mov         eax,dword ptr [ebp-4]
 005C1BBA    cmp         dword ptr [eax+44],0
>005C1BBE    jne         005C1BD4
 005C1BC0    mov         ecx,21A
 005C1BC5    mov         edx,5C1C2C;'C:\Builds\TP\indysockets\lib\core\IdThread.pas'
 005C1BCA    mov         eax,5C1C98;'Assertion failure'
 005C1BCF    call        @Assert
 005C1BD4    mov         eax,dword ptr [ebp-4]
 005C1BD7    mov         eax,dword ptr [eax+44]
 005C1BDA    mov         edx,dword ptr [eax]
 005C1BDC    call        dword ptr [edx]
 005C1BDE    xor         eax,eax
 005C1BE0    push        ebp
 005C1BE1    push        5C1C14
 005C1BE6    push        dword ptr fs:[eax]
 005C1BE9    mov         dword ptr fs:[eax],esp
 005C1BEC    mov         eax,dword ptr [ebp-4]
 005C1BEF    or          byte ptr [eax+51],1
 005C1BF3    mov         eax,dword ptr [ebp-4]
 005C1BF6    call        TThread.Terminate
 005C1BFB    xor         eax,eax
 005C1BFD    pop         edx
 005C1BFE    pop         ecx
 005C1BFF    pop         ecx
 005C1C00    mov         dword ptr fs:[eax],edx
 005C1C03    push        5C1C1B
 005C1C08    mov         eax,dword ptr [ebp-4]
 005C1C0B    mov         eax,dword ptr [eax+44]
 005C1C0E    mov         edx,dword ptr [eax]
 005C1C10    call        dword ptr [edx+4]
 005C1C13    ret
>005C1C14    jmp         @HandleFinally
>005C1C19    jmp         005C1C08
 005C1C1B    pop         ecx
 005C1C1C    pop         ebp
 005C1C1D    ret
*}
end;

//005C1CBC
procedure TIdThread.Cleanup;
begin
{*
 005C1CBC    push        ebx
 005C1CBD    mov         ebx,eax
 005C1CBF    and         byte ptr [ebx+51],0FD
 005C1CC3    lea         eax,[ebx+5C]
 005C1CC6    mov         edx,dword ptr [eax]
 005C1CC8    xor         ecx,ecx
 005C1CCA    mov         dword ptr [eax],ecx
 005C1CCC    mov         eax,edx
 005C1CCE    call        TObject.Free
 005C1CD3    test        byte ptr [ebx+51],4
>005C1CD7    je          005C1CE9
 005C1CD9    lea         eax,[ebx+40]
 005C1CDC    mov         edx,dword ptr [eax]
 005C1CDE    xor         ecx,ecx
 005C1CE0    mov         dword ptr [eax],ecx
 005C1CE2    mov         eax,edx
 005C1CE4    call        TObject.Free
 005C1CE9    pop         ebx
 005C1CEA    ret
*}
end;

//005C1CEC
{*function sub_005C1CEC:?;
begin
 005C1CEC    xor         eax,eax
 005C1CEE    ret
end;*}

//005C1CF0
procedure TIdThread.Synchronize(Method:TThreadMethod);
begin
{*
 005C1CF0    push        ebp
 005C1CF1    mov         ebp,esp
 005C1CF3    push        dword ptr [ebp+0C]
 005C1CF6    push        dword ptr [ebp+8]
 005C1CF9    call        TThread.Synchronize
 005C1CFE    pop         ebp
 005C1CFF    ret         8
*}
end;

Initialization
//00781684
{*
 00781684    sub         dword ptr ds:[8155D4],1
>0078168B    jae         007816B5
 0078168D    mov         dl,1
 0078168F    mov         eax,[005C08A8];TIdThreadSafeInteger
 00781694    call        TIdThreadSafe.Create
 00781699    mov         [00789F14],eax
 0078169E    mov         eax,[00789F14]
 007816A3    call        IndyRegisterExpectedMemoryLeak
 007816A8    mov         eax,[00789F14]
 007816AD    mov         eax,dword ptr [eax+4]
 007816B0    call        IndyRegisterExpectedMemoryLeak
 007816B5    ret
*}
Finalization
end.