//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit95;

interface

uses
  SysUtils, Classes, IdStack, ThdTimer, IdException, IdStreamVCL, IdGlobal, IdAntiFreezeBase, IdSocketHandle, IdUDPBase, IdBuffer, IdExceptionCore, IdIntercept, IdIOHandler, System;

type
  TIdAntiFreezeBase = class(TIdBaseComponent)
  published
    function ShouldUse:Boolean;//005AB02C
    procedure Sleep(ATimeout:Integer);//005AB054
    procedure DoProcess(AIdle:Boolean; AOverride:Boolean);//005AAF6C
    destructor Destroy();//005AAF38
    procedure Process;//005AAF30
  public
    FActive:Boolean;//f34
    FApplicationHasPriority:Boolean;//f35
    FIdleTimeOut:Integer;//f38
    FOnlyWhenIdle:Boolean;//f3C
    destructor Destroy(); virtual;//005AAF38
    procedure InitComponent; virtual;//v34//005AAFA4
    procedure v38; virtual; abstract;//v38//00404A58
  end;
  TIdSocketHandles = class(TOwnedCollection)
  published
    function BindingByHandle(AHandle:Cardinal):TIdSocketHandle;//005ACBA4
    function Add:TIdSocketHandle;//005ACB84
    constructor Create;//005ACBE4
  public
    FDefaultPort:Word;//f1C
    function GetItem(Index:Integer):TIdSocketHandle;//005ACC20
  end;
  TIdSocketHandle = class(TCollectionItem)
  published
    procedure GetSockOpt(ALevel:Integer; AOptName:Integer; VOptVal:Integer);//005AC974
    procedure SetBinding(AIP:string; APort:Word; AIPVersion:TIdIPVersion);//005AC594
    function Select(ATimeout:Integer):Boolean;//005AC99C
    procedure SetSockOpt(ALevel:Integer; AOptName:Integer; AOptVal:Integer);//005AC1E4
    procedure SendTo(const AIP:UnicodeString; const APort:TIdPort; const ABuffer:TIdBytes; const AIPVersion:TIdIPVersion);//005AC278
    procedure SendTo(AIP:string; APort:Word; AByteEncoding:TEncoding; AIPVersion:TIdIPVersion; AData:string);//005AC20C
    procedure SetPeer(AIP:string; APort:Word; AIPVersion:TIdIPVersion);//005AC56C
    procedure SendTo(const AIP:UnicodeString; const APort:TIdPort; const ABuffer:TIdBytes; const AOffset:Integer; const ASize:Integer; const AIPVersion:TIdIPVersion);//005AC294
    procedure SetMulticastTTL(AValue:Byte);//005ACB04
    procedure SetLoopBack(AValue:Boolean);//005ACAE4
    procedure SetNagleOpt(AEnabled:Boolean);//005ACB24
    procedure SetTTL(AValue:Integer);//005ACB48
    procedure UpdateBindingPeer;//005AC888
    procedure UpdateBindingLocal;//005AC868
    procedure DropMulticastMembership(AGroupIP:string);//005ACAC0
    procedure AddMulticastMembership(AGroupIP:string);//005ACA98
    procedure Send(const ABuffer:TIdBytes; const AOffset:Integer; const ASize:Integer);//005AC1BC
    procedure Broadcast(const AData:TIdBytes; const APort:TIdPort; const AIP:UnicodeString);//005AC488
    procedure Broadcast(AData:string; APort:Word; AByteEncoding:TEncoding; AIP:string);//005AC424
    procedure Connect;//005AC06C
    procedure CloseSocket;//005AC004
    procedure AllocateSocket(ASocketType:Integer; AProtocol:Integer);//005ABFA8
    function Accept(ASocket:Cardinal):Boolean;//005AC61C
    procedure Bind;//005AC2F4
    procedure Assign(Source:TPersistent);//005AC814
    procedure RecvFrom(var ABuffer:TIdBytes; var VIP:UnicodeString; var VPort:TIdPort; var VIPVersion:TIdIPVersion);//005AC2C8
    procedure Receive(var VBuffer:TIdBytes);//005AC140
    function Send(AData:string; AByteEncoding:TEncoding):Integer;//005AC158
    procedure Reset(AResetLocal:Boolean);//005AC8A8
    destructor Destroy();//005AC0F4
    constructor Create;//005AC6A0
    function Readable(AMSec:Integer):Boolean;//005AC790
    procedure Listen(AQueueCount:Integer);//005AC604
  public
    FClientPortMin:Word;//fC
    FClientPortMax:Word;//fE
    FHandle:Cardinal;//f10
    FHandleAllocated:Boolean;//f14
    FIP:string;//f18
    FPeerIP:string;//f1C
    FPort:word;//f20
    FPeerPort:Word;//f22
    FReadSocketList:TIdSocketList;//f24
    FSocketType:Integer;//f28
    FOverLapped:Boolean;//f2C
    FIPVersion:TIdIPVersion;//f2D
    FConnectionHandle:TIdCriticalSection;//f30
    FBroadcastEnabled:Boolean;//f34
    FUseNagle:Boolean;//f35
    destructor Destroy(); virtual;//005AC0F4
    procedure Assign(Source:TPersistent); virtual;//v8//005AC814
    constructor Create; virtual;//v1C//005AC6A0
    procedure Disconnect; virtual;//v20//005ABFF0
    procedure CloseSocket; virtual;//v24//005AC004
    procedure Connect; virtual;//v28//005AC06C
    procedure BroadcastEnabledChanged;//005AC560
    procedure SetBroadcastEnabled(const AValue:Boolean);//005AC5BC
    procedure SetBroadcastFlag(const AEnabled:Boolean);//005AC5D0
    function TryBind(APort:TIdPort):Boolean;//005AC8E0
    function BindPortReserved:Boolean;//005AC940
    procedure SetHandle(AHandle:TIdStackSocketHandle);//005AC9BC
    procedure SetIPVersion(const Value:TIdIPVersion);//005ACA34
    procedure SetUseNagle(const AValue:Boolean);//005ACB70
  end;
  TIdSocketHandleEvent = procedure(AHandle:TIdSocketHandle) of object;;
  TIdUDPBase = class(TIdComponent)
  published
    function ReceiveString(var VPeerIP:string; var VPeerPort:Word; AEncoding:TEncoding; AMSec:Integer):string;//005AD49C
    function ReceiveString(AMSec:Integer; AEncoding:TEncoding):string;//005AD528
    procedure Send(AHost:string; APort:Word; AEncoding:TEncoding; AData:string);//005AD584
    procedure SendBuffer(const AHost:UnicodeString; const APort:TIdPort; const ABuffer:TIdBytes);//005AD5E8
    procedure SendBuffer(const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion; const ABuffer:TIdBytes);//005AD614
    procedure Broadcast(const AData:TIdBytes; const APort:TIdPort; const AIP:UnicodeString);//005AD280
    procedure Broadcast(AData:string; APort:Word; AEncoding:TEncoding; AIP:string);//005AD254
    destructor Destroy();//005AD2D4
    procedure ReceiveBuffer(var ABuffer:TIdBytes; const AMSec:Integer);//005AD39C
    procedure ReceiveBuffer(var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; var VIPVersion:TIdIPVersion; const AMSec:Integer);//005AD424
    procedure ReceiveBuffer(var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; AMSec:Integer);//005AD3FC
  public
    FBinding:TIdSocketHandle;//f90
    FBufferSize:Integer;//f94
    FDsgnActive:Boolean;//f98
    FHost:string;//f9C
    FPort:Word;//fA0
    FReceiveTimeout:Integer;//fA4
    FIPVersion:TIdIPVersion;//fA8
    FBroadcastEnabled:Boolean;//fA9
    destructor Destroy(); virtual;//005AD2D4
    procedure Loaded; virtual;//vC//005AD378
    procedure InitComponent; virtual;//v34//005AD350
    procedure CloseBinding; virtual;//v44//005AD2C0
    function GetActive:Boolean; virtual;//v48//005AD30C
    procedure GetBinding; virtual; abstract;//v4C//00404A58
    function GetIPVersion:TIdIPVersion; virtual;//v50//005AD340
    procedure SetIPVersion(const AValue:TIdIPVersion); virtual;//v54//005AD71C
    function GetHost:string; virtual;//v58//005AD328
    procedure SetHost(const AValue:UnicodeString); virtual;//v5C//005AD704
    function GetPort:Word; virtual;//v60//005AD348
    procedure SetPort(const AValue:TIdPort); virtual;//v64//005AD724
    procedure ReceiveBuffer(var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; AMSec:Integer); virtual;//v68//005AD3FC
    procedure ReceiveBuffer(var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; var VIPVersion:TIdIPVersion; const AMSec:Integer); virtual;//v6C//005AD424
    procedure ReceiveBuffer(var ABuffer:TIdBytes; const AMSec:Integer); virtual;//v70//005AD39C
    procedure SendBuffer(const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion; const ABuffer:TIdBytes); virtual;//v74//005AD614
    procedure SendBuffer(const AHost:UnicodeString; const APort:TIdPort; const ABuffer:TIdBytes); virtual;//v78//005AD5E8
    procedure BroadcastEnabledChanged; dynamic;//005AD2A8
    procedure SetActive(const Value:Boolean);//005AD690
    procedure SetBroadcastEnabled(const AValue:Boolean);//005AD6D8
  end;
  EIdUDPException = class(EIdException)
  end;
  EIdNotEnoughDataInBuffer = class(EIdException)
  end;
  EIdTooMuchDataInBuffer = class(EIdException)
  end;
  TIdBufferBytesRemoved = procedure(ASender:TObject; ABytes:Integer) of object;;
  TIdBuffer = class(TObject)
  published
    procedure Remove(AByteCount:Integer);//005AEAD0
    function PeekByte(AIndex:Integer):Byte;//005AEFE8
    procedure Write(AString:string; AByteEncoding:TEncoding; ADestIndex:Integer);//005AEE8C
    procedure SaveToStream(AStream:TStream);//005AF094
    function IndexOf(AByte:Byte; AStartPos:Integer):Integer;//005AEDE8
    procedure ExtractToIPv6(AIndex:Integer; var VAddress:TIdIPv6Address);//005AF0BC
    function IndexOf(AString:string; AStartPos:Integer; AByteEncoding:TEncoding):Integer;//005AEC44
    procedure IndexOf(const ABytes:TIdBytes; AStartPos:Integer);//005AECBC
    procedure Write(AValue:Word; ADestIndex:Integer);//005AF220
    procedure Write(AValue:Cardinal; ADestIndex:Integer);//005AF3A0
    procedure Write(AValue:TIdIPv6Address; ADestIndex:Integer);//005AF2BC
    procedure Write(AValue:Byte; ADestIndex:Integer);//005AF278
    procedure Write(const ABytes:TIdBytes; const ALength:Integer; const AOffset:Integer; const ADestIndex:Integer);//005AF3F8
    procedure Write(const ABytes:TIdBytes; const ADestIndex:Integer);//005AEB70
    procedure Write(ADestIndex:Integer; AValue:Int64);//005AF324
    procedure Write(AStream:TStream; AByteCount:Integer);//005AEB94
    procedure CompactHead(ACanShrink:Boolean);//005AEB10
    constructor Create(const ABytes:TIdBytes; const ALength:Integer);//005AE714
    function Extract(AByteCount:Integer; AByteEncoding:TEncoding):string;//005AE7E0
    destructor Destroy();//005AE7A8
    constructor Create();//005AEF98
    procedure Clear;//005AE660
    constructor Create;//005AE690
    constructor Create;//005AE6CC
    function ExtractToWord(AIndex:Integer):Word;//005AF1B4
    function ExtractToByte(AIndex:Integer):Byte;//005AF1F8
    function ExtractToInt64(AIndex:Integer):Int64;//005AF114
    function ExtractToLongWord(AIndex:Integer):Cardinal;//005AF170
    procedure ExtractToStream(AStream:TStream; AByteCount:Integer; AIndex:Integer);//005AE9DC
    function ExtractToString(AByteCount:Integer; AByteEncoding:TEncoding):string;//005AE804
    procedure ExtractToBytes(var VBytes:TIdBytes; AByteCount:Integer; AAppend:Boolean; AIndex:Integer);//005AE8A0
    procedure ExtractToIdBuffer(ABuffer:TIdBuffer; AByteCount:Integer; AIndex:Integer);//005AE978
  public
    FBytes:?;//f4
    FByteEncoding:TEncoding;//f8
    FGrowthFactor:Integer;//fC
    FHeadIndex:Integer;//f10
    FOnBytesRemoved:TIdBufferBytesRemoved;//f18
    FSize:Integer;//f20
    procedure CheckAdd(AByteCount:Integer; const AIndex:Integer);//005AE51C
    procedure CheckByteCount(var VByteCount:Integer; const AIndex:Integer);//005AE57C
    function GetCapacity:Integer;//005AEEF4
    procedure SetCapacity(AValue:Integer);//005AEF00
    function GetAsString:UnicodeString;//005AF558
  end;
  EIdAlreadyConnected = class(EIdException)
  end;
  EIdClosedSocket = class(EIdException)
  end;
  EIdReadTimeout = class(EIdException)
  end;
  EIdReadLnMaxLineLengthExceeded = class(EIdException)
  end;
  EIdReadLnWaitMaxAttemptsExceeded = class(EIdException)
  end;
  EIdPortRequired = class(EIdException)
  end;
  EIdHostRequired = class(EIdException)
  end;
  EIdTCPConnectionError = class(EIdException)
  end;
  EIdObjectTypeNotSupported = class(EIdTCPConnectionError)
  end;
  EIdNoDataToRead = class(EIdTCPConnectionError)
  end;
  EIdFileNotFound = class(EIdTCPConnectionError)
  end;
  EIdNotConnected = class(EIdException)
  end;
  EIdConnectTimeout = class(EIdException)
  end;
  EIdConnectException = class(EIdException)
  end;
  EIdTransparentProxyCantBind = class(EIdException)
  end;
  EIdSocksError = class(EIdException)
  end;
  EIdSocksRequestFailed = class(EIdSocksError)
  end;
  EIdSocksRequestServerFailed = class(EIdSocksError)
  end;
  EIdSocksRequestIdentFailed = class(EIdSocksError)
  end;
  EIdSocksUnknownError = class(EIdSocksError)
  end;
  EIdSocksServerRespondError = class(EIdSocksError)
  end;
  EIdSocksAuthMethodError = class(EIdSocksError)
  end;
  EIdSocksAuthError = class(EIdSocksError)
  end;
  EIdSocksServerGeneralError = class(EIdSocksError)
  end;
  EIdSocksServerPermissionError = class(EIdSocksError)
  end;
  EIdSocksServerNetUnreachableError = class(EIdSocksError)
  end;
  EIdSocksServerHostUnreachableError = class(EIdSocksError)
  end;
  EIdSocksServerConnectionRefusedError = class(EIdSocksError)
  end;
  EIdSocksServerTTLExpiredError = class(EIdSocksError)
  end;
  EIdSocksServerCommandError = class(EIdSocksError)
  end;
  EIdSocksServerAddressError = class(EIdSocksError)
  end;
  EIdMaxCaptureLineExceeded = class(EIdException)
  end;
  EIdInterceptCircularLink = class(EIdException)
  end;
  TIdInterceptNotifyEvent = procedure(ASender:TIdConnectionIntercept) of object;;
  TIdInterceptStreamEvent = procedure(ASender:TIdConnectionIntercept; var ABuffer:TArray<System.Byte>) of object;;
  TIdConnectionIntercept = class(TIdBaseComponent)
  published
    procedure Receive(var VBuffer:TIdBytes);//005B1254
    procedure Send(var VBuffer:TIdBytes);//005B127C
    procedure Connect(AConnection:TComponent);//005B1228
    procedure Disconnect;//005B1200
  public
    FConnection:TComponent;//f34
    FIntercept:TIdConnectionIntercept;//f38
    FIsClient:Boolean;//f3C
    FData:TObject;//f40
    FOnConnect:TIdInterceptNotifyEvent;//f48
    FOnDisconnect:TIdInterceptNotifyEvent;//f50
    FOnReceive:TIdInterceptStreamEvent;//f58
    FOnSend:TIdInterceptStreamEvent;//f60
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//005B135C
    procedure InitComponent; virtual;//v34//005B1384
    procedure Connect(AConnection:TComponent); virtual;//v38//005B1228
    procedure Disconnect; virtual;//v3C//005B1200
    procedure Receive(var VBuffer:TIdBytes); virtual;//v40//005B1254
    procedure Send(var VBuffer:TIdBytes); virtual;//v44//005B127C
    procedure SetIntercept(AValue:TIdConnectionIntercept);//005B12A4
  end;
  EIdIOHandler = class(EIdException)
  end;
  EIdIOHandlerRequiresLargeStream = class(EIdIOHandler)
  end;
  EIdIOHandlerStreamDataTooLarge = class(EIdIOHandler)
  end;
  TIdIOHandler = class(TIdComponent)
  published
    function ReadLnSplit(var AWasSplit:Boolean; ATerminator:string; AByteEncoding:TEncoding; AMaxLineLength:Integer; ATimeout:Integer):string;//005B457C
    function ReadChar(AByteEncoding:TEncoding):Char;//005B3E80
    function ReadLnRFC(var VMsgEnd:Boolean; ALineTerminator:string; AByteEncoding:TEncoding; ADelim:string):string;//005B4510
    function ReadLnWait(AFailCount:Integer; AByteEncoding:TEncoding):string;//005B4638
    function ReadLongWord(AConvert:Boolean):Cardinal;//005B4184
    function ReadLongInt(AConvert:Boolean):Integer;//005B4084
    function ReadByte:Byte;//005B402C
    function ReadString(ABytes:Integer; AByteEncoding:TEncoding):string;//005B3C74
    function ReadLnRFC(var VMsgEnd:Boolean; AByteEncoding:TEncoding):string;//005B44C4
    procedure Capture(ADest:TStrings; ADelim:string; AByteEncoding:TEncoding; AUsesDotTransparency:Boolean);//005B5E6C
    procedure Capture(ADest:TStrings; VLineCount:Integer; AByteEncoding:TEncoding; AUsesDotTransparency:Boolean; ADelim:string);//005B5E10
    procedure Capture(ADest:TStream; VLineCount:Integer; AByteEncoding:TEncoding; AUsesDotTransparency:Boolean; ADelim:string);//005B5D88
    procedure Capture(ADest:TStrings; AByteEncoding:TEncoding);//005B5E38
    function ReadLn(ATerminator:string; AByteEncoding:TEncoding):string;//005B422C
    function ReadLn(ATerminator:string; ATimeout:Integer; AByteEncoding:TEncoding; AMaxLineLength:Integer):string;//005B428C
    procedure ReadBytes(var VBuffer:TIdBytes; AByteCount:Integer; AAppend:Boolean);//005B4C68
    function ReadLn(AByteEncoding:TEncoding):string;//005B41F8
    function ReadInt64(AConvert:Boolean):Int64;//005B40F8
    procedure WriteBufferOpen;//005B61B4
    procedure WriteBufferOpen(AThreshold:Integer);//005B36A4
    procedure WriteBufferFlush;//005B61A8
    procedure WriteBufferFlush(AByteCount:Integer);//005B3724
    procedure InputBufferToStream(AStream:TStream; AByteCount:Integer);//005B5E98
    function InputBufferAsString(AByteEncoding:TEncoding):string;//005B56C0
    function WriteBufferingActive:Boolean;//005B612C
    function InputBufferIsEmpty:Boolean;//005B5EA8
    procedure WriteBufferClose;//005B36D8
    procedure ReadStream(AStream:TStream; AReadUntilDisconnect:Boolean; AByteCount:Int64);//005B4F9C
    procedure ReadStrings(ADest:TStrings; AReadLinesCount:Integer; AByteEncoding:TEncoding);//005B3D0C
    function ReadWord(AConvert:Boolean):Word;//005B3D98
    function ReadSmallInt(AConvert:Boolean):SmallInt;//005B3E0C
    procedure WriteBufferCancel;//005B37A4
    procedure WriteBufferClear;//005B3790
    procedure Discard(AByteCount:Int64);//005B53B4
    procedure DiscardAll;//005B5574
    function WaitFor(AString:string; ARemoveFromBuffer:Boolean; ATimeout:Integer; AByteEncoding:TEncoding; AInclusive:Boolean):string;//005B5C38
    procedure Write(const ABuffer:TIdBytes; const ALength:Integer; const AOffset:Integer);//005B5EB8
    procedure RegisterIOHandler;//005B355C
    procedure SetDefaultClass;//005B351C
    function Readable(AMSec:Integer):Boolean;//005B4EF0
    procedure Write(AOut:string; AByteEncoding:TEncoding);//005B37C0
    procedure WriteDirect(const ABuffer:TIdBytes; const ALength:Integer; const AOffset:Integer);//005B61C0
    procedure Open;//005B3488
    function MakeIOHandler(ABaseType:TIdIOHandlerClass; AOwner:TComponent):TIdIOHandler;//005B3598
    destructor Destroy();//005B342C
    procedure CheckForDisconnect(ARaiseExceptionIfDisconnected:Boolean; AIgnoreBuffer:Boolean);//005B33D0
    procedure AfterAccept;//005B3484
    function Connected:Boolean;//005B4F14
    procedure CloseGracefully;//005B6138
    function MakeDefaultIOHandler(AOwner:TComponent):TIdIOHandler;//005B354C
    function CheckForDataOnSource(ATimeout:Integer):Boolean;//005B49E4
    procedure Close;//005B33D8
    procedure WriteLn(AEncoding:TEncoding);//005B4DC8
    procedure WriteRFCStrings(AStrings:TStrings; AWriteTerminator:Boolean; AByteEncoding:TEncoding);//005B5F44
    function WriteFile(AFile:string; AEnableTransferFile:Boolean):Int64;//005B6004
    procedure Write(AConvert:Boolean; AValue:Int64);//005B39FC
    procedure Write(AStream:TStream; AWriteByteCount:Boolean; ASize:Int64);//005B4A2C
    procedure Capture(ADest:TStream; AByteEncoding:TEncoding);//005B5D68
    procedure Capture(ADest:TStream; ADelim:string; AByteEncoding:TEncoding; AUsesDotTransparency:Boolean);//005B5DB0
    function AllData(AByteEncoding:TEncoding):string;//005B56F4
    function InputLn(AMask:string; AEcho:Boolean; AByteEncoding:TEncoding; AMaxLineLength:Integer; ATabWidth:Integer):string;//005B59B8
    procedure Write(AValue:SmallInt; AConvert:Boolean);//005B3C00
    procedure Write(AValue:TStrings; AWriteLinesCount:Boolean; AByteEncoding:TEncoding);//005B3A7C
    procedure Write(AValue:Byte);//005B3840
    procedure WriteLn(AOut:string; AByteEncoding:TEncoding);//005B4DE4
    procedure WriteLnRFC(AOut:string; AByteEncoding:TEncoding);//005B4E58
    procedure Write(AValue:Integer; AConvert:Boolean);//005B3988
    procedure Write(AValue:Word; AConvert:Boolean);//005B3B8C
    procedure Write(AValue:Char; AByteEncoding:TEncoding);//005B38A0
    procedure Write(AValue:Cardinal; AConvert:Boolean);//005B3914
  public
    FLargeStream:Boolean;//f90
    FClosedGracefully:Boolean;//f91
    FConnectTimeout:Integer;//f94
    FDestination:string;//f98
    FHost:string;//f9C
    FInputBuffer:TIdBuffer;//fA0
    FIntercept:TIdConnectionIntercept;//fA4
    FMaxCapturedLines:Integer;//fA8
    FMaxLineAction:TIdMaxLineAction;//fAC
    FMaxLineLength:Integer;//fB0
    FOpened:Boolean;//fB4
    FPort:Integer;//fB8
    FReadLnSplit:Boolean;//fBC
    FReadLnTimedOut:Boolean;//fBD
    FReadTimeOut:Integer;//fC0
    FRecvBufferSize:Integer;//fC4
    FSendBufferSize:Integer;//fC8
    FWriteBuffer:TIdBuffer;//fCC
    FWriteBufferThreshold:Integer;//fD0
    FDefStringEncoding:TEncoding;//fD4
    destructor Destroy(); virtual;//005B342C
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//005B34B8
    procedure InitComponent; virtual;//v34//005B6140
    function GetDestination:string; virtual;//v44//005B3660
    procedure PerformCapture(const ADest:TObject; var VLineCount:Integer; const ADelim:UnicodeString; AUsesDotTransparency:Boolean; AByteEncoding:TIdTextEncoding); virtual;//v48//005B57D0
    procedure SetDestination(const AValue:UnicodeString); virtual;//v4C//005B3678
    procedure SetHost(const AValue:UnicodeString); virtual;//v50//005B4EF4
    procedure SetPort(Value:Integer); virtual;//v54//005B4F0C
    procedure SetIntercept(AValue:TIdConnectionIntercept); virtual;//v58//005B34E8
    procedure ReadDataFromSource; virtual; abstract;//v5C//00404A58
    procedure WriteDataToTarget; virtual; abstract;//v60//00404A58
    procedure v64; virtual; abstract;//v64//00404A58
    procedure CheckForError; virtual; abstract;//v68//00404A58
    procedure RaiseError; virtual; abstract;//v6C//00404A58
    procedure AfterAccept; virtual;//v70//005B3484
    function Connected:Boolean; virtual;//v74//005B4F14
    procedure CheckForDisconnect; virtual; abstract;//v78//00404A58
    function CheckForDataOnSource(ATimeout:Integer):Boolean; virtual;//v7C//005B49E4
    procedure Close; virtual;//v80//005B33D8
    procedure CloseGracefully; virtual;//v84//005B6138
    procedure Write(const ABuffer:TIdBytes; const ALength:Integer; const AOffset:Integer); virtual;//v88//005B5EB8
    procedure Open; virtual;//v8C//005B3488
    function Readable(AMSec:Integer):Boolean; virtual;//v90//005B4EF0
    procedure Write(AOut:string; AByteEncoding:TEncoding); virtual;//v94//005B37C0
    procedure WriteLn(AOut:string; AByteEncoding:TEncoding); virtual;//v98//005B4DE4
    procedure WriteLnRFC(AOut:string; AByteEncoding:TEncoding); virtual;//v9C//005B4E58
    procedure Write(AValue:TStrings; AWriteLinesCount:Boolean; AByteEncoding:TEncoding); virtual;//vA0//005B3A7C
    procedure Write(AStream:TStream; AWriteByteCount:Boolean; ASize:Int64); virtual;//vA4//005B4A2C
    function WriteFile(AFile:string; AEnableTransferFile:Boolean):Int64; virtual;//vA8//005B6004
    function AllData(AByteEncoding:TEncoding):string; virtual;//vAC//005B56F4
    function InputLn(AMask:string; AEcho:Boolean; AByteEncoding:TEncoding; AMaxLineLength:Integer; ATabWidth:Integer):string; virtual;//vB0//005B59B8
    procedure ReadBytes(var VBuffer:TIdBytes; AByteCount:Integer; AAppend:Boolean); virtual;//vB4//005B4C68
    function ReadLn(ATerminator:string; ATimeout:Integer; AByteEncoding:TEncoding; AMaxLineLength:Integer):string; virtual;//vB8//005B428C
    function ReadLnWait(AFailCount:Integer; AByteEncoding:TEncoding):string; virtual;//vBC//005B4638
    procedure ReadStream(AStream:TStream; AReadUntilDisconnect:Boolean; AByteCount:Int64); virtual;//vC0//005B4F9C
    procedure WriteBufferCancel; virtual;//vC4//005B37A4
    procedure WriteBufferClear; virtual;//vC8//005B3790
    procedure WriteBufferClose; virtual;//vCC//005B36D8
    procedure WriteBufferFlush(AByteCount:Integer); virtual;//vD0//005B3724
    procedure WriteBufferOpen(AThreshold:Integer); virtual;//vD4//005B36A4
    procedure SetDefStringEncoding(const AEncoding:TIdTextEncoding);//005B3528
    procedure BufferRemoveNotify(ASender:TObject; ABytes:Integer);//005B3690
    function ReadFromSource(ARaiseExceptionIfDisconnected:Boolean; ATimeout:Integer; ARaiseExceptionOnTimeout:Boolean):Integer;//005B473C
    procedure RaiseConnClosedGracefully;//005B566C
  end;
    procedure InitComponent;//005AAFA4
    procedure Disconnect;//005ABFF0
    function CheckIsReadable(ALMSec:Integer):Boolean;//005AC720
    procedure BroadcastEnabledChanged;//005AD2A8
    procedure CloseBinding;//005AD2C0
    function GetActive:Boolean;//005AD30C
    function GetHost:string;//005AD328
    function GetIPVersion:TIdIPVersion;//005AD340
    function GetPort:Word;//005AD348
    procedure InitComponent;//005AD350
    procedure Loaded;//005AD378
    procedure SetHost(const AValue:UnicodeString);//005AD704
    procedure SetIPVersion(const AValue:TIdIPVersion);//005AD71C
    procedure SetPort(const AValue:TIdPort);//005AD724
    procedure Notification(AComponent:TComponent; Operation:TOperation);//005B135C
    procedure InitComponent;//005B1384
    procedure Notification(AComponent:TComponent; Operation:TOperation);//005B34B8
    procedure SetIntercept(AValue:TIdConnectionIntercept);//005B34E8
    function GetDestination:string;//005B3660
    procedure SetDestination(const AValue:UnicodeString);//005B3678
    procedure SetHost(const AValue:UnicodeString);//005B4EF4
    procedure SetPort(Value:Integer);//005B4F0C
    procedure AdjustStreamSize(const AStream:TStream; const ASize:TIdStreamSize);//005B4F54
    procedure PerformCapture(const ADest:TObject; var VLineCount:Integer; const ADelim:UnicodeString; AUsesDotTransparency:Boolean; AByteEncoding:TIdTextEncoding);//005B57D0
    procedure InitComponent;//005B6140

implementation

//005AAF30
procedure TIdAntiFreezeBase.Process;
begin
{*
>005AAF30    jmp         @AbstractError
*}
end;

//005AAF38
destructor TIdAntiFreezeBase.Destroy();
begin
{*
 005AAF38    push        ebx
 005AAF39    push        esi
 005AAF3A    call        @BeforeDestruction
 005AAF3F    mov         ebx,edx
 005AAF41    mov         esi,eax
 005AAF43    cmp         esi,dword ptr ds:[789F08]
>005AAF49    jne         005AAF52
 005AAF4B    xor         eax,eax
 005AAF4D    mov         [00789F08],eax
 005AAF52    mov         edx,ebx
 005AAF54    and         dl,0FC
 005AAF57    mov         eax,esi
 005AAF59    call        TComponent.Destroy
 005AAF5E    test        bl,bl
>005AAF60    jle         005AAF69
 005AAF62    mov         eax,esi
 005AAF64    call        @ClassDestroy
 005AAF69    pop         esi
 005AAF6A    pop         ebx
 005AAF6B    ret
*}
end;

//005AAF6C
procedure TIdAntiFreezeBase.DoProcess(AIdle:Boolean; AOverride:Boolean);
begin
{*
 005AAF6C    push        ebx
 005AAF6D    push        esi
 005AAF6E    push        ecx
 005AAF6F    mov         byte ptr [esp],cl
 005AAF72    mov         ebx,edx
 005AAF74    mov         esi,eax
 005AAF76    mov         eax,esi
 005AAF78    call        TIdAntiFreezeBase.ShouldUse
 005AAF7D    test        al,al
>005AAF7F    je          005AAFA0
 005AAF81    mov         eax,[00789F08]
 005AAF86    movzx       eax,byte ptr [eax+3C]
 005AAF8A    xor         al,1
 005AAF8C    or          bl,al
>005AAF8E    jne         005AAF96
 005AAF90    cmp         byte ptr [esp],0
>005AAF94    je          005AAFA0
 005AAF96    mov         eax,[00789F08]
 005AAF9B    mov         edx,dword ptr [eax]
 005AAF9D    call        dword ptr [edx+38]
 005AAFA0    pop         edx
 005AAFA1    pop         esi
 005AAFA2    pop         ebx
 005AAFA3    ret
*}
end;

//005AAFA4
procedure TIdAntiFreezeBase.InitComponent;
begin
{*
 005AAFA4    push        ebp
 005AAFA5    mov         ebp,esp
 005AAFA7    push        0
 005AAFA9    push        ebx
 005AAFAA    mov         ebx,eax
 005AAFAC    xor         eax,eax
 005AAFAE    push        ebp
 005AAFAF    push        5AB01E
 005AAFB4    push        dword ptr fs:[eax]
 005AAFB7    mov         dword ptr fs:[eax],esp
 005AAFBA    mov         eax,ebx
 005AAFBC    call        TIdInitializerComponent.InitComponent
 005AAFC1    mov         eax,ebx
 005AAFC3    call        TIdInitializerComponent.GetIsDesignTime
 005AAFC8    test        al,al
>005AAFCA    jne         005AAFF5
 005AAFCC    cmp         dword ptr ds:[789F08],0
>005AAFD3    je          005AAFEF
 005AAFD5    lea         edx,[ebp-4]
 005AAFD8    mov         eax,[0078CDDC];^SResString652:TResStringRec
 005AAFDD    call        LoadResString
 005AAFE2    mov         edx,dword ptr [ebp-4]
 005AAFE5    mov         eax,[005961F8];EIdException
 005AAFEA    call        EIdException.Toss
 005AAFEF    mov         dword ptr ds:[789F08],ebx
 005AAFF5    mov         byte ptr [ebx+34],1
 005AAFF9    mov         byte ptr [ebx+35],1
 005AAFFD    mov         dword ptr [ebx+38],0FA
 005AB004    mov         byte ptr [ebx+3C],1
 005AB008    xor         eax,eax
 005AB00A    pop         edx
 005AB00B    pop         ecx
 005AB00C    pop         ecx
 005AB00D    mov         dword ptr fs:[eax],edx
 005AB010    push        5AB025
 005AB015    lea         eax,[ebp-4]
 005AB018    call        @UStrClr
 005AB01D    ret
>005AB01E    jmp         @HandleFinally
>005AB023    jmp         005AB015
 005AB025    pop         ebx
 005AB026    pop         ecx
 005AB027    pop         ebp
 005AB028    ret
*}
end;

//005AB02C
function TIdAntiFreezeBase.ShouldUse:Boolean;
begin
{*
 005AB02C    cmp         dword ptr ds:[789F08],0
>005AB033    je          005AB03E
 005AB035    call        InMainThread
 005AB03A    test        al,al
>005AB03C    jne         005AB042
 005AB03E    xor         eax,eax
>005AB040    jmp         005AB044
 005AB042    mov         al,1
 005AB044    test        al,al
>005AB046    je          005AB051
 005AB048    mov         eax,[00789F08]
 005AB04D    movzx       eax,byte ptr [eax+34]
 005AB051    ret
*}
end;

//005AB054
procedure TIdAntiFreezeBase.Sleep(ATimeout:Integer);
begin
{*
 005AB054    push        ebx
 005AB055    push        esi
 005AB056    push        edi
 005AB057    push        ebp
 005AB058    mov         ebx,edx
 005AB05A    mov         esi,eax
 005AB05C    mov         ebp,789F08
 005AB061    mov         eax,esi
 005AB063    call        TIdAntiFreezeBase.ShouldUse
 005AB068    test        al,al
>005AB06A    je          005AB0A4
>005AB06C    jmp         005AB086
 005AB06E    mov         eax,edi
 005AB070    call        IndySleep
 005AB075    mov         eax,dword ptr [ebp]
 005AB078    sub         ebx,dword ptr [eax+38]
 005AB07B    xor         ecx,ecx
 005AB07D    mov         dl,1
 005AB07F    mov         eax,esi
 005AB081    call        TIdAntiFreezeBase.DoProcess
 005AB086    mov         eax,dword ptr [ebp]
 005AB089    mov         edi,dword ptr [eax+38]
 005AB08C    cmp         ebx,edi
>005AB08E    jg          005AB06E
 005AB090    mov         eax,ebx
 005AB092    call        IndySleep
 005AB097    xor         ecx,ecx
 005AB099    mov         dl,1
 005AB09B    mov         eax,esi
 005AB09D    call        TIdAntiFreezeBase.DoProcess
>005AB0A2    jmp         005AB0AB
 005AB0A4    mov         eax,ebx
 005AB0A6    call        IndySleep
 005AB0AB    pop         ebp
 005AB0AC    pop         edi
 005AB0AD    pop         esi
 005AB0AE    pop         ebx
 005AB0AF    ret
*}
end;

//005ABFA8
procedure TIdSocketHandle.AllocateSocket(ASocketType:Integer; AProtocol:Integer);
begin
{*
 005ABFA8    push        ebx
 005ABFA9    push        esi
 005ABFAA    push        edi
 005ABFAB    mov         edi,ecx
 005ABFAD    mov         esi,edx
 005ABFAF    mov         ebx,eax
 005ABFB1    mov         eax,ebx
 005ABFB3    mov         edx,dword ptr [eax]
 005ABFB5    call        dword ptr [edx+24]
 005ABFB8    cmp         byte ptr [ebx+14],0
>005ABFBC    je          005ABFC7
 005ABFBE    mov         dl,1
 005ABFC0    mov         eax,ebx
 005ABFC2    call        TIdSocketHandle.Reset
 005ABFC7    movzx       eax,byte ptr [ebx+2D]
 005ABFCB    push        eax
 005ABFCC    movzx       eax,byte ptr [ebx+2C]
 005ABFD0    push        eax
 005ABFD1    mov         eax,[0078D940];^gvar_00789ED0
 005ABFD6    mov         eax,dword ptr [eax]
 005ABFD8    mov         ecx,edi
 005ABFDA    mov         edx,esi
 005ABFDC    mov         esi,dword ptr [eax]
 005ABFDE    call        dword ptr [esi+50]
 005ABFE1    mov         edx,eax
 005ABFE3    mov         eax,ebx
 005ABFE5    call        TIdSocketHandle.SetHandle
 005ABFEA    pop         edi
 005ABFEB    pop         esi
 005ABFEC    pop         ebx
 005ABFED    ret
*}
end;

//005ABFF0
procedure TIdSocketHandle.Disconnect;
begin
{*
 005ABFF0    mov         edx,dword ptr ds:[78D940];^gvar_00789ED0
 005ABFF6    mov         edx,dword ptr [edx]
 005ABFF8    mov         eax,dword ptr [eax+10]
 005ABFFB    xchg        eax,edx
 005ABFFC    mov         ecx,dword ptr [eax]
 005ABFFE    call        dword ptr [ecx+18]
 005AC001    ret
*}
end;

//005AC004
procedure TIdSocketHandle.CloseSocket;
begin
{*
 005AC004    push        ebp
 005AC005    mov         ebp,esp
 005AC007    push        ecx
 005AC008    mov         dword ptr [ebp-4],eax
 005AC00B    mov         eax,dword ptr [ebp-4]
 005AC00E    cmp         byte ptr [eax+14],0
>005AC012    je          005AC066
 005AC014    mov         eax,dword ptr [ebp-4]
 005AC017    mov         eax,dword ptr [eax+30]
 005AC01A    mov         edx,dword ptr [eax]
 005AC01C    call        dword ptr [edx]
 005AC01E    xor         eax,eax
 005AC020    push        ebp
 005AC021    push        5AC05F
 005AC026    push        dword ptr fs:[eax]
 005AC029    mov         dword ptr fs:[eax],esp
 005AC02C    mov         eax,dword ptr [ebp-4]
 005AC02F    mov         byte ptr [eax+14],0
 005AC033    mov         eax,dword ptr [ebp-4]
 005AC036    mov         edx,dword ptr [eax]
 005AC038    call        dword ptr [edx+20]
 005AC03B    or          edx,0FFFFFFFF
 005AC03E    mov         eax,dword ptr [ebp-4]
 005AC041    call        TIdSocketHandle.SetHandle
 005AC046    xor         eax,eax
 005AC048    pop         edx
 005AC049    pop         ecx
 005AC04A    pop         ecx
 005AC04B    mov         dword ptr fs:[eax],edx
 005AC04E    push        5AC066
 005AC053    mov         eax,dword ptr [ebp-4]
 005AC056    mov         eax,dword ptr [eax+30]
 005AC059    mov         edx,dword ptr [eax]
 005AC05B    call        dword ptr [edx+4]
 005AC05E    ret
>005AC05F    jmp         @HandleFinally
>005AC064    jmp         005AC053
 005AC066    pop         ecx
 005AC067    pop         ebp
 005AC068    ret
*}
end;

//005AC06C
procedure TIdSocketHandle.Connect;
begin
{*
 005AC06C    push        ebp
 005AC06D    mov         ebp,esp
 005AC06F    push        ecx
 005AC070    push        ebx
 005AC071    mov         dword ptr [ebp-4],eax
 005AC074    mov         eax,dword ptr [ebp-4]
 005AC077    movzx       eax,word ptr [eax+22]
 005AC07B    push        eax
 005AC07C    mov         eax,dword ptr [ebp-4]
 005AC07F    movzx       eax,byte ptr [eax+2D]
 005AC083    push        eax
 005AC084    mov         eax,dword ptr [ebp-4]
 005AC087    mov         ecx,dword ptr [eax+1C]
 005AC08A    mov         eax,dword ptr [ebp-4]
 005AC08D    mov         edx,dword ptr [eax+10]
 005AC090    mov         eax,[0078D940];^gvar_00789ED0
 005AC095    mov         eax,dword ptr [eax]
 005AC097    mov         ebx,dword ptr [eax]
 005AC099    call        dword ptr [ebx+10]
 005AC09C    mov         eax,dword ptr [ebp-4]
 005AC09F    mov         eax,dword ptr [eax+30]
 005AC0A2    mov         edx,dword ptr [eax]
 005AC0A4    call        dword ptr [edx]
 005AC0A6    xor         eax,eax
 005AC0A8    push        ebp
 005AC0A9    push        5AC0E6
 005AC0AE    push        dword ptr fs:[eax]
 005AC0B1    mov         dword ptr fs:[eax],esp
 005AC0B4    mov         eax,dword ptr [ebp-4]
 005AC0B7    cmp         byte ptr [eax+14],0
>005AC0BB    je          005AC0CD
 005AC0BD    mov         eax,dword ptr [ebp-4]
 005AC0C0    call        TIdSocketHandle.UpdateBindingLocal
 005AC0C5    mov         eax,dword ptr [ebp-4]
 005AC0C8    call        TIdSocketHandle.UpdateBindingPeer
 005AC0CD    xor         eax,eax
 005AC0CF    pop         edx
 005AC0D0    pop         ecx
 005AC0D1    pop         ecx
 005AC0D2    mov         dword ptr fs:[eax],edx
 005AC0D5    push        5AC0ED
 005AC0DA    mov         eax,dword ptr [ebp-4]
 005AC0DD    mov         eax,dword ptr [eax+30]
 005AC0E0    mov         edx,dword ptr [eax]
 005AC0E2    call        dword ptr [edx+4]
 005AC0E5    ret
>005AC0E6    jmp         @HandleFinally
>005AC0EB    jmp         005AC0DA
 005AC0ED    pop         ebx
 005AC0EE    pop         ecx
 005AC0EF    pop         ebp
 005AC0F0    ret
*}
end;

//005AC0F4
destructor TIdSocketHandle.Destroy();
begin
{*
 005AC0F4    push        ebx
 005AC0F5    push        esi
 005AC0F6    call        @BeforeDestruction
 005AC0FB    mov         ebx,edx
 005AC0FD    mov         esi,eax
 005AC0FF    mov         eax,esi
 005AC101    mov         edx,dword ptr [eax]
 005AC103    call        dword ptr [edx+24]
 005AC106    lea         eax,[esi+30]
 005AC109    mov         edx,dword ptr [eax]
 005AC10B    xor         ecx,ecx
 005AC10D    mov         dword ptr [eax],ecx
 005AC10F    mov         eax,edx
 005AC111    call        TObject.Free
 005AC116    lea         eax,[esi+24]
 005AC119    mov         edx,dword ptr [eax]
 005AC11B    xor         ecx,ecx
 005AC11D    mov         dword ptr [eax],ecx
 005AC11F    mov         eax,edx
 005AC121    call        TObject.Free
 005AC126    mov         edx,ebx
 005AC128    and         dl,0FC
 005AC12B    mov         eax,esi
 005AC12D    call        TCollectionItem.Destroy
 005AC132    test        bl,bl
>005AC134    jle         005AC13D
 005AC136    mov         eax,esi
 005AC138    call        @ClassDestroy
 005AC13D    pop         esi
 005AC13E    pop         ebx
 005AC13F    ret
*}
end;

//005AC140
procedure TIdSocketHandle.Receive(var VBuffer:TIdBytes);
begin
{*
 005AC140    push        ebx
 005AC141    push        esi
 005AC142    mov         esi,eax
 005AC144    mov         ecx,edx
 005AC146    mov         eax,[0078D940];^gvar_00789ED0
 005AC14B    mov         eax,dword ptr [eax]
 005AC14D    mov         edx,dword ptr [esi+10]
 005AC150    mov         ebx,dword ptr [eax]
 005AC152    call        dword ptr [ebx+6C]
 005AC155    pop         esi
 005AC156    pop         ebx
 005AC157    ret
*}
end;

//005AC158
function TIdSocketHandle.Send(AData:string; AByteEncoding:TEncoding):Integer;
begin
{*
 005AC158    push        ebp
 005AC159    mov         ebp,esp
 005AC15B    push        0
 005AC15D    push        ebx
 005AC15E    push        esi
 005AC15F    push        edi
 005AC160    mov         edi,ecx
 005AC162    mov         esi,edx
 005AC164    mov         ebx,eax
 005AC166    xor         eax,eax
 005AC168    push        ebp
 005AC169    push        5AC1AC
 005AC16E    push        dword ptr fs:[eax]
 005AC171    mov         dword ptr fs:[eax],esp
 005AC174    push        0FF
 005AC176    lea         ecx,[ebp-4]
 005AC179    mov         edx,edi
 005AC17B    mov         eax,esi
 005AC17D    call        ToBytes
 005AC182    mov         edx,dword ptr [ebp-4]
 005AC185    xor         ecx,ecx
 005AC187    mov         eax,ebx
 005AC189    call        TIdSocketHandle.Send
 005AC18E    mov         ebx,eax
 005AC190    xor         eax,eax
 005AC192    pop         edx
 005AC193    pop         ecx
 005AC194    pop         ecx
 005AC195    mov         dword ptr fs:[eax],edx
 005AC198    push        5AC1B3
 005AC19D    lea         eax,[ebp-4]
 005AC1A0    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AC1A6    call        @DynArrayClear
 005AC1AB    ret
>005AC1AC    jmp         @HandleFinally
>005AC1B1    jmp         005AC19D
 005AC1B3    mov         eax,ebx
 005AC1B5    pop         edi
 005AC1B6    pop         esi
 005AC1B7    pop         ebx
 005AC1B8    pop         ecx
 005AC1B9    pop         ebp
 005AC1BA    ret
*}
end;

//005AC1BC
procedure TIdSocketHandle.Send(const ABuffer:TIdBytes; const AOffset:Integer; const ASize:Integer);
begin
{*
 005AC1BC    push        ebp
 005AC1BD    mov         ebp,esp
 005AC1BF    push        ebx
 005AC1C0    push        esi
 005AC1C1    push        edi
 005AC1C2    mov         edi,edx
 005AC1C4    mov         esi,eax
 005AC1C6    push        ecx
 005AC1C7    mov         eax,dword ptr [ebp+8]
 005AC1CA    push        eax
 005AC1CB    mov         eax,[0078D940];^gvar_00789ED0
 005AC1D0    mov         eax,dword ptr [eax]
 005AC1D2    mov         edx,dword ptr [esi+10]
 005AC1D5    mov         ecx,edi
 005AC1D7    mov         ebx,dword ptr [eax]
 005AC1D9    call        dword ptr [ebx+70]
 005AC1DC    pop         edi
 005AC1DD    pop         esi
 005AC1DE    pop         ebx
 005AC1DF    pop         ebp
 005AC1E0    ret         4
*}
end;

//005AC1E4
procedure TIdSocketHandle.SetSockOpt(ALevel:Integer; AOptName:Integer; AOptVal:Integer);
begin
{*
 005AC1E4    push        ebp
 005AC1E5    mov         ebp,esp
 005AC1E7    push        ebx
 005AC1E8    push        esi
 005AC1E9    push        edi
 005AC1EA    mov         edi,edx
 005AC1EC    mov         esi,eax
 005AC1EE    push        ecx
 005AC1EF    mov         eax,dword ptr [ebp+8]
 005AC1F2    push        eax
 005AC1F3    mov         eax,[0078D940];^gvar_00789ED0
 005AC1F8    mov         eax,dword ptr [eax]
 005AC1FA    mov         edx,dword ptr [esi+10]
 005AC1FD    mov         ecx,edi
 005AC1FF    mov         ebx,dword ptr [eax]
 005AC201    call        dword ptr [ebx+68]
 005AC204    pop         edi
 005AC205    pop         esi
 005AC206    pop         ebx
 005AC207    pop         ebp
 005AC208    ret         4
*}
end;

//005AC20C
procedure TIdSocketHandle.SendTo(AIP:string; APort:Word; AByteEncoding:TEncoding; AIPVersion:TIdIPVersion; AData:string);
begin
{*
 005AC20C    push        ebp
 005AC20D    mov         ebp,esp
 005AC20F    push        0
 005AC211    push        ebx
 005AC212    push        esi
 005AC213    push        edi
 005AC214    mov         edi,ecx
 005AC216    mov         esi,edx
 005AC218    mov         ebx,eax
 005AC21A    xor         eax,eax
 005AC21C    push        ebp
 005AC21D    push        5AC266
 005AC222    push        dword ptr fs:[eax]
 005AC225    mov         dword ptr fs:[eax],esp
 005AC228    lea         ecx,[ebp-4]
 005AC22B    mov         edx,dword ptr [ebp+8]
 005AC22E    mov         eax,dword ptr [ebp+10]
 005AC231    call        ToBytes
 005AC236    mov         eax,dword ptr [ebp-4]
 005AC239    push        eax
 005AC23A    movzx       eax,byte ptr [ebp+0C]
 005AC23E    push        eax
 005AC23F    mov         ecx,edi
 005AC241    mov         edx,esi
 005AC243    mov         eax,ebx
 005AC245    call        TIdSocketHandle.SendTo
 005AC24A    xor         eax,eax
 005AC24C    pop         edx
 005AC24D    pop         ecx
 005AC24E    pop         ecx
 005AC24F    mov         dword ptr fs:[eax],edx
 005AC252    push        5AC26D
 005AC257    lea         eax,[ebp-4]
 005AC25A    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AC260    call        @DynArrayClear
 005AC265    ret
>005AC266    jmp         @HandleFinally
>005AC26B    jmp         005AC257
 005AC26D    pop         edi
 005AC26E    pop         esi
 005AC26F    pop         ebx
 005AC270    pop         ecx
 005AC271    pop         ebp
 005AC272    ret         0C
*}
end;

//005AC278
procedure TIdSocketHandle.SendTo(const AIP:UnicodeString; const APort:TIdPort; const ABuffer:TIdBytes; const AIPVersion:TIdIPVersion);
begin
{*
 005AC278    push        ebp
 005AC279    mov         ebp,esp
 005AC27B    push        ebx
 005AC27C    mov         ebx,dword ptr [ebp+0C]
 005AC27F    push        ebx
 005AC280    push        0
 005AC282    push        0FF
 005AC284    movzx       ebx,byte ptr [ebp+8]
 005AC288    push        ebx
 005AC289    call        TIdSocketHandle.SendTo
 005AC28E    pop         ebx
 005AC28F    pop         ebp
 005AC290    ret         8
*}
end;

//005AC294
procedure TIdSocketHandle.SendTo(const AIP:UnicodeString; const APort:TIdPort; const ABuffer:TIdBytes; const AOffset:Integer; const ASize:Integer; const AIPVersion:TIdIPVersion);
begin
{*
 005AC294    push        ebp
 005AC295    mov         ebp,esp
 005AC297    push        ebx
 005AC298    push        esi
 005AC299    push        edi
 005AC29A    mov         edi,edx
 005AC29C    mov         esi,eax
 005AC29E    mov         eax,dword ptr [ebp+10]
 005AC2A1    push        eax
 005AC2A2    mov         eax,dword ptr [ebp+0C]
 005AC2A5    push        eax
 005AC2A6    push        edi
 005AC2A7    push        ecx
 005AC2A8    movzx       eax,byte ptr [ebp+8]
 005AC2AC    push        eax
 005AC2AD    mov         eax,[0078D940];^gvar_00789ED0
 005AC2B2    mov         eax,dword ptr [eax]
 005AC2B4    mov         edx,dword ptr [esi+10]
 005AC2B7    mov         ecx,dword ptr [ebp+14]
 005AC2BA    mov         ebx,dword ptr [eax]
 005AC2BC    call        dword ptr [ebx+78]
 005AC2BF    pop         edi
 005AC2C0    pop         esi
 005AC2C1    pop         ebx
 005AC2C2    pop         ebp
 005AC2C3    ret         10
*}
end;

//005AC2C8
procedure TIdSocketHandle.RecvFrom(var ABuffer:TIdBytes; var VIP:UnicodeString; var VPort:TIdPort; var VIPVersion:TIdIPVersion);
begin
{*
 005AC2C8    push        ebp
 005AC2C9    mov         ebp,esp
 005AC2CB    push        ebx
 005AC2CC    push        esi
 005AC2CD    push        edi
 005AC2CE    mov         edi,edx
 005AC2D0    mov         esi,eax
 005AC2D2    push        ecx
 005AC2D3    mov         eax,dword ptr [ebp+0C]
 005AC2D6    push        eax
 005AC2D7    mov         eax,dword ptr [ebp+8]
 005AC2DA    push        eax
 005AC2DB    mov         eax,[0078D940];^gvar_00789ED0
 005AC2E0    mov         eax,dword ptr [eax]
 005AC2E2    mov         ecx,edi
 005AC2E4    mov         edx,dword ptr [esi+10]
 005AC2E7    mov         ebx,dword ptr [eax]
 005AC2E9    call        dword ptr [ebx+74]
 005AC2EC    pop         edi
 005AC2ED    pop         esi
 005AC2EE    pop         ebx
 005AC2EF    pop         ebp
 005AC2F0    ret         8
*}
end;

//005AC2F4
procedure TIdSocketHandle.Bind;
begin
{*
 005AC2F4    push        ebp
 005AC2F5    mov         ebp,esp
 005AC2F7    add         esp,0FFFFFFE4
 005AC2FA    push        ebx
 005AC2FB    push        esi
 005AC2FC    xor         edx,edx
 005AC2FE    mov         dword ptr [ebp-1C],edx
 005AC301    mov         dword ptr [ebp-18],edx
 005AC304    mov         dword ptr [ebp-14],edx
 005AC307    mov         ebx,eax
 005AC309    xor         eax,eax
 005AC30B    push        ebp
 005AC30C    push        5AC416
 005AC311    push        dword ptr fs:[eax]
 005AC314    mov         dword ptr fs:[eax],esp
 005AC317    movzx       esi,word ptr [ebx+20]
 005AC31B    test        si,si
>005AC31E    jne         005AC3CD
 005AC324    cmp         word ptr [ebx+0C],0
>005AC329    je          005AC3CD
 005AC32F    cmp         word ptr [ebx+0E],0
>005AC334    je          005AC3CD
 005AC33A    movzx       eax,word ptr [ebx+0C]
 005AC33E    cmp         ax,word ptr [ebx+0E]
>005AC342    jbe         005AC383
 005AC344    movzx       eax,word ptr [ebx+0C]
 005AC348    mov         dword ptr [ebp-10],eax
 005AC34B    mov         byte ptr [ebp-0C],0
 005AC34F    movzx       eax,word ptr [ebx+0E]
 005AC353    mov         dword ptr [ebp-8],eax
 005AC356    mov         byte ptr [ebp-4],0
 005AC35A    lea         eax,[ebp-10]
 005AC35D    push        eax
 005AC35E    push        1
 005AC360    lea         edx,[ebp-14]
 005AC363    mov         eax,[0078D5CC];^SResString657:TResStringRec
 005AC368    call        LoadResString
 005AC36D    mov         ecx,dword ptr [ebp-14]
 005AC370    mov         dl,1
 005AC372    mov         eax,[0059681C];EIdInvalidPortRange
 005AC377    call        Exception.CreateFmt
 005AC37C    call        @RaiseExcept
>005AC381    jmp         005AC3FB
 005AC383    mov         eax,ebx
 005AC385    call        TIdSocketHandle.BindPortReserved
 005AC38A    test        al,al
>005AC38C    jne         005AC3FB
 005AC38E    movzx       eax,word ptr [ebx+0C]
 005AC392    mov         dword ptr [ebp-10],eax
 005AC395    mov         byte ptr [ebp-0C],0
 005AC399    movzx       eax,word ptr [ebx+0E]
 005AC39D    mov         dword ptr [ebp-8],eax
 005AC3A0    mov         byte ptr [ebp-4],0
 005AC3A4    lea         eax,[ebp-10]
 005AC3A7    push        eax
 005AC3A8    push        1
 005AC3AA    lea         edx,[ebp-18]
 005AC3AD    mov         eax,[0078D6E0];^SResString654:TResStringRec
 005AC3B2    call        LoadResString
 005AC3B7    mov         ecx,dword ptr [ebp-18]
 005AC3BA    mov         dl,1
 005AC3BC    mov         eax,[00596760];EIdCanNotBindPortInRange
 005AC3C1    call        Exception.CreateFmt
 005AC3C6    call        @RaiseExcept
>005AC3CB    jmp         005AC3FB
 005AC3CD    mov         edx,esi
 005AC3CF    mov         eax,ebx
 005AC3D1    call        TIdSocketHandle.TryBind
 005AC3D6    test        al,al
>005AC3D8    jne         005AC3FB
 005AC3DA    lea         edx,[ebp-1C]
 005AC3DD    mov         eax,[0078D28C];^SResString656:TResStringRec
 005AC3E2    call        LoadResString
 005AC3E7    mov         ecx,dword ptr [ebp-1C]
 005AC3EA    mov         dl,1
 005AC3EC    mov         eax,[005966AC];EIdCouldNotBindSocket
 005AC3F1    call        EIdException.Create
 005AC3F6    call        @RaiseExcept
 005AC3FB    xor         eax,eax
 005AC3FD    pop         edx
 005AC3FE    pop         ecx
 005AC3FF    pop         ecx
 005AC400    mov         dword ptr fs:[eax],edx
 005AC403    push        5AC41D
 005AC408    lea         eax,[ebp-1C]
 005AC40B    mov         edx,3
 005AC410    call        @UStrArrayClr
 005AC415    ret
>005AC416    jmp         @HandleFinally
>005AC41B    jmp         005AC408
 005AC41D    pop         esi
 005AC41E    pop         ebx
 005AC41F    mov         esp,ebp
 005AC421    pop         ebp
 005AC422    ret
*}
end;

//005AC424
procedure TIdSocketHandle.Broadcast(AData:string; APort:Word; AByteEncoding:TEncoding; AIP:string);
begin
{*
 005AC424    push        ebp
 005AC425    mov         ebp,esp
 005AC427    push        0
 005AC429    push        ebx
 005AC42A    push        esi
 005AC42B    push        edi
 005AC42C    mov         edi,ecx
 005AC42E    mov         esi,edx
 005AC430    mov         ebx,eax
 005AC432    xor         eax,eax
 005AC434    push        ebp
 005AC435    push        5AC479
 005AC43A    push        dword ptr fs:[eax]
 005AC43D    mov         dword ptr fs:[eax],esp
 005AC440    mov         eax,dword ptr [ebp+0C]
 005AC443    push        eax
 005AC444    lea         ecx,[ebp-4]
 005AC447    mov         edx,dword ptr [ebp+8]
 005AC44A    mov         eax,esi
 005AC44C    call        ToBytes
 005AC451    mov         edx,dword ptr [ebp-4]
 005AC454    mov         ecx,edi
 005AC456    mov         eax,ebx
 005AC458    call        TIdSocketHandle.Broadcast
 005AC45D    xor         eax,eax
 005AC45F    pop         edx
 005AC460    pop         ecx
 005AC461    pop         ecx
 005AC462    mov         dword ptr fs:[eax],edx
 005AC465    push        5AC480
 005AC46A    lea         eax,[ebp-4]
 005AC46D    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AC473    call        @DynArrayClear
 005AC478    ret
>005AC479    jmp         @HandleFinally
>005AC47E    jmp         005AC46A
 005AC480    pop         edi
 005AC481    pop         esi
 005AC482    pop         ebx
 005AC483    pop         ecx
 005AC484    pop         ebp
 005AC485    ret         8
*}
end;

//005AC488
procedure TIdSocketHandle.Broadcast(const AData:TIdBytes; const APort:TIdPort; const AIP:UnicodeString);
begin
{*
 005AC488    push        ebp
 005AC489    mov         ebp,esp
 005AC48B    push        0
 005AC48D    push        0
 005AC48F    push        ebx
 005AC490    push        esi
 005AC491    push        edi
 005AC492    mov         edi,ecx
 005AC494    mov         esi,edx
 005AC496    mov         ebx,eax
 005AC498    xor         eax,eax
 005AC49A    push        ebp
 005AC49B    push        5AC522
 005AC4A0    push        dword ptr fs:[eax]
 005AC4A3    mov         dword ptr fs:[eax],esp
 005AC4A6    lea         edx,[ebp-4]
 005AC4A9    mov         eax,dword ptr [ebp+8]
 005AC4AC    call        Trim
 005AC4B1    cmp         dword ptr [ebp-4],0
>005AC4B5    jne         005AC4C6
 005AC4B7    lea         eax,[ebp-4]
 005AC4BA    mov         edx,5AC540;'255.255.255.255'
 005AC4BF    call        @UStrLAsg
>005AC4C4    jmp         005AC4E8
 005AC4C6    lea         eax,[ebp-8]
 005AC4C9    push        eax
 005AC4CA    mov         eax,[0078D940];^gvar_00789ED0
 005AC4CF    mov         eax,dword ptr [eax]
 005AC4D1    movzx       ecx,byte ptr [ebx+2D]
 005AC4D5    mov         edx,dword ptr [ebp-4]
 005AC4D8    call        TIdStack.ResolveHost
 005AC4DD    mov         edx,dword ptr [ebp-8]
 005AC4E0    lea         eax,[ebp-4]
 005AC4E3    call        @UStrLAsg
 005AC4E8    mov         dl,1
 005AC4EA    mov         eax,ebx
 005AC4EC    call        TIdSocketHandle.SetBroadcastFlag
 005AC4F1    push        esi
 005AC4F2    push        0
 005AC4F4    mov         ecx,edi
 005AC4F6    mov         edx,dword ptr [ebp-4]
 005AC4F9    mov         eax,ebx
 005AC4FB    call        TIdSocketHandle.SendTo
 005AC500    mov         eax,ebx
 005AC502    call        TIdSocketHandle.BroadcastEnabledChanged
 005AC507    xor         eax,eax
 005AC509    pop         edx
 005AC50A    pop         ecx
 005AC50B    pop         ecx
 005AC50C    mov         dword ptr fs:[eax],edx
 005AC50F    push        5AC529
 005AC514    lea         eax,[ebp-8]
 005AC517    mov         edx,2
 005AC51C    call        @UStrArrayClr
 005AC521    ret
>005AC522    jmp         @HandleFinally
>005AC527    jmp         005AC514
 005AC529    pop         edi
 005AC52A    pop         esi
 005AC52B    pop         ebx
 005AC52C    pop         ecx
 005AC52D    pop         ecx
 005AC52E    pop         ebp
 005AC52F    ret         4
*}
end;

//005AC560
procedure TIdSocketHandle.BroadcastEnabledChanged;
begin
{*
 005AC560    movzx       edx,byte ptr [eax+34]
 005AC564    call        TIdSocketHandle.SetBroadcastFlag
 005AC569    ret
*}
end;

//005AC56C
procedure TIdSocketHandle.SetPeer(AIP:string; APort:Word; AIPVersion:TIdIPVersion);
begin
{*
 005AC56C    push        ebp
 005AC56D    mov         ebp,esp
 005AC56F    push        ebx
 005AC570    push        esi
 005AC571    push        edi
 005AC572    mov         edi,ecx
 005AC574    mov         esi,edx
 005AC576    mov         ebx,eax
 005AC578    lea         eax,[ebx+1C]
 005AC57B    mov         edx,esi
 005AC57D    call        @UStrAsg
 005AC582    mov         word ptr [ebx+22],di
 005AC586    movzx       eax,byte ptr [ebp+8]
 005AC58A    mov         byte ptr [ebx+2D],al
 005AC58D    pop         edi
 005AC58E    pop         esi
 005AC58F    pop         ebx
 005AC590    pop         ebp
 005AC591    ret         4
*}
end;

//005AC594
procedure TIdSocketHandle.SetBinding(AIP:string; APort:Word; AIPVersion:TIdIPVersion);
begin
{*
 005AC594    push        ebp
 005AC595    mov         ebp,esp
 005AC597    push        ebx
 005AC598    push        esi
 005AC599    push        edi
 005AC59A    mov         edi,ecx
 005AC59C    mov         esi,edx
 005AC59E    mov         ebx,eax
 005AC5A0    lea         eax,[ebx+18]
 005AC5A3    mov         edx,esi
 005AC5A5    call        @UStrAsg
 005AC5AA    mov         word ptr [ebx+20],di
 005AC5AE    movzx       eax,byte ptr [ebp+8]
 005AC5B2    mov         byte ptr [ebx+2D],al
 005AC5B5    pop         edi
 005AC5B6    pop         esi
 005AC5B7    pop         ebx
 005AC5B8    pop         ebp
 005AC5B9    ret         4
*}
end;

//005AC5BC
procedure TIdSocketHandle.SetBroadcastEnabled(const AValue:Boolean);
begin
{*
 005AC5BC    cmp         dl,byte ptr [eax+34]
>005AC5BF    je          005AC5CF
 005AC5C1    mov         byte ptr [eax+34],dl
 005AC5C4    cmp         byte ptr [eax+14],0
>005AC5C8    je          005AC5CF
 005AC5CA    call        TIdSocketHandle.BroadcastEnabledChanged
 005AC5CF    ret
*}
end;

//005AC5D0
procedure TIdSocketHandle.SetBroadcastFlag(const AEnabled:Boolean);
begin
{*
 005AC5D0    push        ebx
 005AC5D1    push        esi
 005AC5D2    mov         ebx,edx
 005AC5D4    mov         esi,eax
 005AC5D6    push        20
 005AC5D8    xor         ecx,ecx
 005AC5DA    mov         edx,1
 005AC5DF    mov         eax,ebx
 005AC5E1    call        iif
 005AC5E6    push        eax
 005AC5E7    mov         eax,[0078D940];^gvar_00789ED0
 005AC5EC    mov         eax,dword ptr [eax]
 005AC5EE    mov         ecx,0FFFF
 005AC5F3    mov         edx,dword ptr [esi+10]
 005AC5F6    mov         ebx,dword ptr [eax]
 005AC5F8    call        dword ptr [ebx+68]
 005AC5FB    pop         esi
 005AC5FC    pop         ebx
 005AC5FD    ret
*}
end;

//005AC604
procedure TIdSocketHandle.Listen(AQueueCount:Integer);
begin
{*
 005AC604    push        ebx
 005AC605    push        esi
 005AC606    mov         esi,eax
 005AC608    mov         eax,[0078D940];^gvar_00789ED0
 005AC60D    mov         eax,dword ptr [eax]
 005AC60F    mov         ecx,edx
 005AC611    mov         edx,dword ptr [esi+10]
 005AC614    mov         ebx,dword ptr [eax]
 005AC616    call        dword ptr [ebx+3C]
 005AC619    pop         esi
 005AC61A    pop         ebx
 005AC61B    ret
*}
end;

//005AC61C
function TIdSocketHandle.Accept(ASocket:Cardinal):Boolean;
begin
{*
 005AC61C    push        ebp
 005AC61D    mov         ebp,esp
 005AC61F    add         esp,0FFFFFFF8
 005AC622    push        ebx
 005AC623    push        esi
 005AC624    xor         ecx,ecx
 005AC626    mov         dword ptr [ebp-4],ecx
 005AC629    mov         ebx,edx
 005AC62B    mov         esi,eax
 005AC62D    xor         eax,eax
 005AC62F    push        ebp
 005AC630    push        5AC690
 005AC635    push        dword ptr fs:[eax]
 005AC638    mov         dword ptr fs:[eax],esp
 005AC63B    mov         dl,1
 005AC63D    mov         eax,esi
 005AC63F    call        TIdSocketHandle.Reset
 005AC644    lea         eax,[ebp-6]
 005AC647    push        eax
 005AC648    lea         ecx,[ebp-4]
 005AC64B    mov         eax,[0078D940];^gvar_00789ED0
 005AC650    mov         eax,dword ptr [eax]
 005AC652    mov         edx,ebx
 005AC654    call        TIdStack.Accept
 005AC659    cmp         eax,0FFFFFFFF
 005AC65C    setne       bl
 005AC65F    test        bl,bl
>005AC661    je          005AC67A
 005AC663    mov         edx,eax
 005AC665    mov         eax,esi
 005AC667    call        TIdSocketHandle.SetHandle
 005AC66C    mov         eax,esi
 005AC66E    call        TIdSocketHandle.UpdateBindingLocal
 005AC673    mov         eax,esi
 005AC675    call        TIdSocketHandle.UpdateBindingPeer
 005AC67A    xor         eax,eax
 005AC67C    pop         edx
 005AC67D    pop         ecx
 005AC67E    pop         ecx
 005AC67F    mov         dword ptr fs:[eax],edx
 005AC682    push        5AC697
 005AC687    lea         eax,[ebp-4]
 005AC68A    call        @UStrClr
 005AC68F    ret
>005AC690    jmp         @HandleFinally
>005AC695    jmp         005AC687
 005AC697    mov         eax,ebx
 005AC699    pop         esi
 005AC69A    pop         ebx
 005AC69B    pop         ecx
 005AC69C    pop         ecx
 005AC69D    pop         ebp
 005AC69E    ret
*}
end;

//005AC6A0
constructor TIdSocketHandle.Create;
begin
{*
 005AC6A0    push        ebx
 005AC6A1    push        esi
 005AC6A2    push        edi
 005AC6A3    test        dl,dl
>005AC6A5    je          005AC6AF
 005AC6A7    add         esp,0FFFFFFF0
 005AC6AA    call        @ClassCreate
 005AC6AF    mov         esi,ecx
 005AC6B1    mov         ebx,edx
 005AC6B3    mov         edi,eax
 005AC6B5    mov         ecx,esi
 005AC6B7    xor         edx,edx
 005AC6B9    mov         eax,edi
 005AC6BB    call        TCollectionItem.Create
 005AC6C0    mov         byte ptr [edi+35],1
 005AC6C4    mov         dl,1
 005AC6C6    mov         eax,[005970A8];TIdCriticalSection
 005AC6CB    call        TCriticalSection.Create
 005AC6D0    mov         dword ptr [edi+30],eax
 005AC6D3    mov         eax,[005A7B3C];TIdSocketList
 005AC6D8    call        TIdSocketList.CreateSocketList
 005AC6DD    mov         dword ptr [edi+24],eax
 005AC6E0    mov         dl,1
 005AC6E2    mov         eax,edi
 005AC6E4    call        TIdSocketHandle.Reset
 005AC6E9    mov         word ptr [edi+0C],0
 005AC6EF    mov         word ptr [edi+0E],0
 005AC6F5    mov         byte ptr [edi+2D],0
 005AC6F9    test        esi,esi
>005AC6FB    je          005AC705
 005AC6FD    movzx       eax,word ptr [esi+1C]
 005AC701    mov         word ptr [edi+20],ax
 005AC705    mov         eax,edi
 005AC707    test        bl,bl
>005AC709    je          005AC71A
 005AC70B    call        @AfterConstruction
 005AC710    pop         dword ptr fs:[0]
 005AC717    add         esp,0C
 005AC71A    mov         eax,edi
 005AC71C    pop         edi
 005AC71D    pop         esi
 005AC71E    pop         ebx
 005AC71F    ret
*}
end;

//005AC720
function CheckIsReadable(ALMSec:Integer):Boolean;
begin
{*
 005AC720    push        ebp
 005AC721    mov         ebp,esp
 005AC723    push        0
 005AC725    push        ebx
 005AC726    mov         ebx,eax
 005AC728    xor         eax,eax
 005AC72A    push        ebp
 005AC72B    push        5AC781
 005AC730    push        dword ptr fs:[eax]
 005AC733    mov         dword ptr fs:[eax],esp
 005AC736    mov         eax,dword ptr [ebp+8]
 005AC739    mov         eax,dword ptr [eax-4]
 005AC73C    cmp         byte ptr [eax+14],0
>005AC740    jne         005AC75C
 005AC742    lea         edx,[ebp-4]
 005AC745    mov         eax,[0078D56C];^SResString655:TResStringRec
 005AC74A    call        LoadResString
 005AC74F    mov         edx,dword ptr [ebp-4]
 005AC752    mov         eax,[005963E0];EIdConnClosedGracefully
 005AC757    call        EIdException.Toss
 005AC75C    mov         eax,dword ptr [ebp+8]
 005AC75F    mov         eax,dword ptr [eax-4]
 005AC762    mov         edx,ebx
 005AC764    call        TIdSocketHandle.Select
 005AC769    mov         ebx,eax
 005AC76B    xor         eax,eax
 005AC76D    pop         edx
 005AC76E    pop         ecx
 005AC76F    pop         ecx
 005AC770    mov         dword ptr fs:[eax],edx
 005AC773    push        5AC788
 005AC778    lea         eax,[ebp-4]
 005AC77B    call        @UStrClr
 005AC780    ret
>005AC781    jmp         @HandleFinally
>005AC786    jmp         005AC778
 005AC788    mov         eax,ebx
 005AC78A    pop         ebx
 005AC78B    pop         ecx
 005AC78C    pop         ebp
 005AC78D    ret
*}
end;

//005AC790
function TIdSocketHandle.Readable(AMSec:Integer):Boolean;
begin
{*
 005AC790    push        ebp
 005AC791    mov         ebp,esp
 005AC793    push        ecx
 005AC794    push        ebx
 005AC795    push        esi
 005AC796    push        edi
 005AC797    mov         esi,edx
 005AC799    mov         dword ptr [ebp-4],eax
 005AC79C    cmp         esi,0FFFFFFFF
>005AC79F    jne         005AC7A6
 005AC7A1    mov         esi,0FFFFFFFE
 005AC7A6    mov         eax,[005AAC00];TIdAntiFreezeBase
 005AC7AB    call        TIdAntiFreezeBase.ShouldUse
 005AC7B0    test        al,al
>005AC7B2    je          005AC7FE
 005AC7B4    cmp         esi,0FFFFFFFE
>005AC7B7    jne         005AC7F0
 005AC7B9    push        ebp
 005AC7BA    mov         eax,[0078DB60]
 005AC7BF    mov         eax,dword ptr [eax]
 005AC7C1    mov         eax,dword ptr [eax+38]
 005AC7C4    call        CheckIsReadable
 005AC7C9    pop         ecx
 005AC7CA    mov         ebx,eax
 005AC7CC    test        bl,bl
>005AC7CE    je          005AC7B9
>005AC7D0    jmp         005AC809
 005AC7D2    push        ebp
 005AC7D3    mov         eax,[0078DB60]
 005AC7D8    mov         eax,edi
 005AC7DA    call        CheckIsReadable
 005AC7DF    pop         ecx
 005AC7E0    mov         ebx,eax
 005AC7E2    test        bl,bl
>005AC7E4    jne         005AC809
 005AC7E6    mov         eax,[0078DB60]
 005AC7EB    mov         eax,dword ptr [eax]
 005AC7ED    sub         esi,dword ptr [eax+38]
 005AC7F0    mov         eax,[0078DB60]
 005AC7F5    mov         eax,dword ptr [eax]
 005AC7F7    mov         edi,dword ptr [eax+38]
 005AC7FA    cmp         esi,edi
>005AC7FC    jg          005AC7D2
 005AC7FE    push        ebp
 005AC7FF    mov         eax,esi
 005AC801    call        CheckIsReadable
 005AC806    pop         ecx
 005AC807    mov         ebx,eax
 005AC809    mov         eax,ebx
 005AC80B    pop         edi
 005AC80C    pop         esi
 005AC80D    pop         ebx
 005AC80E    pop         ecx
 005AC80F    pop         ebp
 005AC810    ret
*}
end;

//005AC814
procedure TIdSocketHandle.Assign(Source:TPersistent);
begin
{*
 005AC814    push        ebx
 005AC815    push        esi
 005AC816    mov         esi,edx
 005AC818    mov         ebx,eax
 005AC81A    mov         eax,esi
 005AC81C    mov         edx,dword ptr ds:[5AB27C];TIdSocketHandle
 005AC822    call        @IsClass
 005AC827    test        al,al
>005AC829    je          005AC85B
 005AC82B    lea         eax,[ebx+18]
 005AC82E    mov         edx,dword ptr [esi+18]
 005AC831    call        @UStrAsg
 005AC836    movzx       eax,word ptr [esi+20]
 005AC83A    mov         word ptr [ebx+20],ax
 005AC83E    lea         eax,[ebx+1C]
 005AC841    mov         edx,dword ptr [esi+1C]
 005AC844    call        @UStrAsg
 005AC849    movzx       eax,word ptr [esi+22]
 005AC84D    mov         word ptr [ebx+22],ax
 005AC851    movzx       eax,byte ptr [esi+2D]
 005AC855    mov         byte ptr [ebx+2D],al
 005AC858    pop         esi
 005AC859    pop         ebx
 005AC85A    ret
 005AC85B    mov         edx,esi
 005AC85D    mov         eax,ebx
 005AC85F    call        TPersistent.Assign
 005AC864    pop         esi
 005AC865    pop         ebx
 005AC866    ret
*}
end;

//005AC868
procedure TIdSocketHandle.UpdateBindingLocal;
begin
{*
 005AC868    push        ebx
 005AC869    lea         edx,[eax+20]
 005AC86C    push        edx
 005AC86D    lea         edx,[eax+2D]
 005AC870    push        edx
 005AC871    lea         ecx,[eax+18]
 005AC874    mov         edx,dword ptr ds:[78D940];^gvar_00789ED0
 005AC87A    mov         edx,dword ptr [edx]
 005AC87C    mov         eax,dword ptr [eax+10]
 005AC87F    xchg        eax,edx
 005AC880    mov         ebx,dword ptr [eax]
 005AC882    call        dword ptr [ebx+24]
 005AC885    pop         ebx
 005AC886    ret
*}
end;

//005AC888
procedure TIdSocketHandle.UpdateBindingPeer;
begin
{*
 005AC888    push        ebx
 005AC889    lea         edx,[eax+22]
 005AC88C    push        edx
 005AC88D    lea         edx,[eax+2D]
 005AC890    push        edx
 005AC891    lea         ecx,[eax+1C]
 005AC894    mov         edx,dword ptr ds:[78D940];^gvar_00789ED0
 005AC89A    mov         edx,dword ptr [edx]
 005AC89C    mov         eax,dword ptr [eax+10]
 005AC89F    xchg        eax,edx
 005AC8A0    mov         ebx,dword ptr [eax]
 005AC8A2    call        dword ptr [ebx+20]
 005AC8A5    pop         ebx
 005AC8A6    ret
*}
end;

//005AC8A8
procedure TIdSocketHandle.Reset(AResetLocal:Boolean);
begin
{*
 005AC8A8    push        ebx
 005AC8A9    push        esi
 005AC8AA    mov         ebx,edx
 005AC8AC    mov         esi,eax
 005AC8AE    or          edx,0FFFFFFFF
 005AC8B1    mov         eax,esi
 005AC8B3    call        TIdSocketHandle.SetHandle
 005AC8B8    test        bl,bl
>005AC8BA    je          005AC8CA
 005AC8BC    lea         eax,[esi+18]
 005AC8BF    call        @UStrClr
 005AC8C4    mov         word ptr [esi+20],0
 005AC8CA    lea         eax,[esi+1C]
 005AC8CD    call        @UStrClr
 005AC8D2    mov         word ptr [esi+22],0
 005AC8D8    mov         byte ptr [esi+2D],0
 005AC8DC    pop         esi
 005AC8DD    pop         ebx
 005AC8DE    ret
*}
end;

//005AC8E0
function TIdSocketHandle.TryBind(APort:TIdPort):Boolean;
begin
{*
 005AC8E0    push        ebp
 005AC8E1    mov         ebp,esp
 005AC8E3    push        ecx
 005AC8E4    push        ebx
 005AC8E5    push        esi
 005AC8E6    push        edi
 005AC8E7    mov         word ptr [ebp-2],dx
 005AC8EB    mov         esi,eax
 005AC8ED    xor         eax,eax
 005AC8EF    push        ebp
 005AC8F0    push        5AC92A
 005AC8F5    push        dword ptr fs:[eax]
 005AC8F8    mov         dword ptr fs:[eax],esp
 005AC8FB    movzx       eax,word ptr [ebp-2]
 005AC8FF    push        eax
 005AC900    movzx       eax,byte ptr [esi+2D]
 005AC904    push        eax
 005AC905    mov         ecx,dword ptr [esi+18]
 005AC908    mov         edx,dword ptr [esi+10]
 005AC90B    mov         eax,[0078D940];^gvar_00789ED0
 005AC910    mov         eax,dword ptr [eax]
 005AC912    mov         ebx,dword ptr [eax]
 005AC914    call        dword ptr [ebx+0C]
 005AC917    mov         bl,1
 005AC919    mov         eax,esi
 005AC91B    call        TIdSocketHandle.UpdateBindingLocal
 005AC920    xor         eax,eax
 005AC922    pop         edx
 005AC923    pop         ecx
 005AC924    pop         ecx
 005AC925    mov         dword ptr fs:[eax],edx
>005AC928    jmp         005AC936
>005AC92A    jmp         @HandleAnyException
 005AC92F    xor         ebx,ebx
 005AC931    call        @DoneExcept
 005AC936    mov         eax,ebx
 005AC938    pop         edi
 005AC939    pop         esi
 005AC93A    pop         ebx
 005AC93B    pop         ecx
 005AC93C    pop         ebp
 005AC93D    ret
*}
end;

//005AC940
function TIdSocketHandle.BindPortReserved:Boolean;
begin
{*
 005AC940    push        ebx
 005AC941    push        esi
 005AC942    push        edi
 005AC943    push        ebp
 005AC944    mov         edi,eax
 005AC946    xor         ebx,ebx
 005AC948    movzx       esi,word ptr [edi+0E]
 005AC94C    movzx       ebp,word ptr [edi+0C]
 005AC950    sub         bp,si
>005AC953    ja          005AC96D
 005AC955    dec         ebp
 005AC956    mov         edx,esi
 005AC958    mov         eax,edi
 005AC95A    call        TIdSocketHandle.TryBind
 005AC95F    test        al,al
>005AC961    je          005AC967
 005AC963    mov         bl,1
>005AC965    jmp         005AC96D
 005AC967    dec         esi
 005AC968    inc         bp
>005AC96B    jne         005AC956
 005AC96D    mov         eax,ebx
 005AC96F    pop         ebp
 005AC970    pop         edi
 005AC971    pop         esi
 005AC972    pop         ebx
 005AC973    ret
*}
end;

//005AC974
procedure TIdSocketHandle.GetSockOpt(ALevel:Integer; AOptName:Integer; VOptVal:Integer);
begin
{*
 005AC974    push        ebp
 005AC975    mov         ebp,esp
 005AC977    push        ebx
 005AC978    push        esi
 005AC979    push        edi
 005AC97A    mov         edi,edx
 005AC97C    mov         esi,eax
 005AC97E    push        ecx
 005AC97F    mov         eax,dword ptr [ebp+8]
 005AC982    push        eax
 005AC983    mov         eax,[0078D940];^gvar_00789ED0
 005AC988    mov         eax,dword ptr [eax]
 005AC98A    mov         edx,dword ptr [esi+10]
 005AC98D    mov         ecx,edi
 005AC98F    mov         ebx,dword ptr [eax]
 005AC991    call        dword ptr [ebx+64]
 005AC994    pop         edi
 005AC995    pop         esi
 005AC996    pop         ebx
 005AC997    pop         ebp
 005AC998    ret         4
*}
end;

//005AC99C
function TIdSocketHandle.Select(ATimeout:Integer):Boolean;
begin
{*
 005AC99C    push        ebx
 005AC99D    mov         eax,dword ptr [eax+24]
 005AC9A0    mov         ecx,dword ptr [eax]
 005AC9A2    call        dword ptr [ecx+24]
 005AC9A5    mov         ebx,eax
 005AC9A7    test        bl,bl
 005AC9A9    sete        dl
 005AC9AC    xor         ecx,ecx
 005AC9AE    mov         eax,[005AAC00];TIdAntiFreezeBase
 005AC9B3    call        TIdAntiFreezeBase.DoProcess
 005AC9B8    mov         eax,ebx
 005AC9BA    pop         ebx
 005AC9BB    ret
*}
end;

//005AC9BC
procedure TIdSocketHandle.SetHandle(AHandle:TIdStackSocketHandle);
begin
{*
 005AC9BC    push        ebx
 005AC9BD    push        esi
 005AC9BE    push        ecx
 005AC9BF    mov         esi,edx
 005AC9C1    mov         ebx,eax
 005AC9C3    mov         eax,dword ptr [ebx+10]
 005AC9C6    cmp         eax,0FFFFFFFF
>005AC9C9    je          005AC9D5
 005AC9CB    mov         edx,eax
 005AC9CD    mov         eax,dword ptr [ebx+24]
 005AC9D0    mov         ecx,dword ptr [eax]
 005AC9D2    call        dword ptr [ecx+14]
 005AC9D5    mov         eax,esi
 005AC9D7    mov         dword ptr [ebx+10],eax
 005AC9DA    cmp         eax,0FFFFFFFF
 005AC9DD    setne       dl
 005AC9E0    mov         byte ptr [ebx+14],dl
 005AC9E3    test        dl,dl
>005AC9E5    je          005ACA2B
 005AC9E7    mov         edx,dword ptr [ebx+10]
 005AC9EA    mov         eax,dword ptr [ebx+24]
 005AC9ED    mov         ecx,dword ptr [eax]
 005AC9EF    call        dword ptr [ecx+8]
 005AC9F2    lea         eax,[ebx+28]
 005AC9F5    push        eax
 005AC9F6    mov         ecx,1008
 005AC9FB    mov         edx,0FFFF
 005ACA00    mov         eax,ebx
 005ACA02    call        TIdSocketHandle.GetSockOpt
 005ACA07    cmp         dword ptr [ebx+28],1
>005ACA0B    jne         005ACA30
 005ACA0D    push        esp
 005ACA0E    mov         ecx,1
 005ACA13    mov         edx,6
 005ACA18    mov         eax,ebx
 005ACA1A    call        TIdSocketHandle.GetSockOpt
 005ACA1F    cmp         dword ptr [esp],0
 005ACA23    sete        al
 005ACA26    mov         byte ptr [ebx+35],al
>005ACA29    jmp         005ACA30
 005ACA2B    xor         eax,eax
 005ACA2D    mov         dword ptr [ebx+28],eax
 005ACA30    pop         edx
 005ACA31    pop         esi
 005ACA32    pop         ebx
 005ACA33    ret
*}
end;

//005ACA34
procedure TIdSocketHandle.SetIPVersion(const Value:TIdIPVersion);
begin
{*
 005ACA34    push        ebp
 005ACA35    mov         ebp,esp
 005ACA37    push        0
 005ACA39    xor         ecx,ecx
 005ACA3B    push        ebp
 005ACA3C    push        5ACA8C
 005ACA41    push        dword ptr fs:[ecx]
 005ACA44    mov         dword ptr fs:[ecx],esp
 005ACA47    cmp         dl,byte ptr [eax+2D]
>005ACA4A    je          005ACA76
 005ACA4C    cmp         byte ptr [eax+14],0
>005ACA50    je          005ACA73
 005ACA52    lea         edx,[ebp-4]
 005ACA55    mov         eax,[0078D050];^SResString653:TResStringRec
 005ACA5A    call        LoadResString
 005ACA5F    mov         ecx,dword ptr [ebp-4]
 005ACA62    mov         dl,1
 005ACA64    mov         eax,[005968CC];EIdCannotSetIPVersionWhenConnected
 005ACA69    call        EIdException.Create
 005ACA6E    call        @RaiseExcept
 005ACA73    mov         byte ptr [eax+2D],dl
 005ACA76    xor         eax,eax
 005ACA78    pop         edx
 005ACA79    pop         ecx
 005ACA7A    pop         ecx
 005ACA7B    mov         dword ptr fs:[eax],edx
 005ACA7E    push        5ACA93
 005ACA83    lea         eax,[ebp-4]
 005ACA86    call        @UStrClr
 005ACA8B    ret
>005ACA8C    jmp         @HandleFinally
>005ACA91    jmp         005ACA83
 005ACA93    pop         ecx
 005ACA94    pop         ebp
 005ACA95    ret
*}
end;

//005ACA98
procedure TIdSocketHandle.AddMulticastMembership(AGroupIP:string);
begin
{*
 005ACA98    push        ebx
 005ACA99    push        esi
 005ACA9A    push        edi
 005ACA9B    mov         edi,edx
 005ACA9D    mov         esi,eax
 005ACA9F    mov         eax,dword ptr [esi+18]
 005ACAA2    push        eax
 005ACAA3    movzx       eax,byte ptr [esi+2D]
 005ACAA7    push        eax
 005ACAA8    mov         eax,[0078D940];^gvar_00789ED0
 005ACAAD    mov         eax,dword ptr [eax]
 005ACAAF    mov         ecx,edi
 005ACAB1    mov         edx,dword ptr [esi+10]
 005ACAB4    mov         ebx,dword ptr [eax]
 005ACAB6    call        dword ptr [ebx+90]
 005ACABC    pop         edi
 005ACABD    pop         esi
 005ACABE    pop         ebx
 005ACABF    ret
*}
end;

//005ACAC0
procedure TIdSocketHandle.DropMulticastMembership(AGroupIP:string);
begin
{*
 005ACAC0    push        ebx
 005ACAC1    push        esi
 005ACAC2    mov         esi,eax
 005ACAC4    mov         eax,dword ptr [esi+18]
 005ACAC7    push        eax
 005ACAC8    movzx       eax,byte ptr [esi+2D]
 005ACACC    push        eax
 005ACACD    mov         eax,[0078D940];^gvar_00789ED0
 005ACAD2    mov         eax,dword ptr [eax]
 005ACAD4    mov         ecx,edx
 005ACAD6    mov         edx,dword ptr [esi+10]
 005ACAD9    mov         ebx,dword ptr [eax]
 005ACADB    call        dword ptr [ebx+8C]
 005ACAE1    pop         esi
 005ACAE2    pop         ebx
 005ACAE3    ret
*}
end;

//005ACAE4
procedure TIdSocketHandle.SetLoopBack(AValue:Boolean);
begin
{*
 005ACAE4    push        ebx
 005ACAE5    push        esi
 005ACAE6    mov         esi,eax
 005ACAE8    movzx       eax,byte ptr [esi+2D]
 005ACAEC    push        eax
 005ACAED    mov         eax,[0078D940];^gvar_00789ED0
 005ACAF2    mov         eax,dword ptr [eax]
 005ACAF4    mov         ecx,edx
 005ACAF6    mov         edx,dword ptr [esi+10]
 005ACAF9    mov         ebx,dword ptr [eax]
 005ACAFB    call        dword ptr [ebx+88]
 005ACB01    pop         esi
 005ACB02    pop         ebx
 005ACB03    ret
*}
end;

//005ACB04
procedure TIdSocketHandle.SetMulticastTTL(AValue:Byte);
begin
{*
 005ACB04    push        ebx
 005ACB05    push        esi
 005ACB06    mov         esi,eax
 005ACB08    movzx       eax,byte ptr [esi+2D]
 005ACB0C    push        eax
 005ACB0D    mov         eax,[0078D940];^gvar_00789ED0
 005ACB12    mov         eax,dword ptr [eax]
 005ACB14    mov         ecx,edx
 005ACB16    mov         edx,dword ptr [esi+10]
 005ACB19    mov         ebx,dword ptr [eax]
 005ACB1B    call        dword ptr [ebx+84]
 005ACB21    pop         esi
 005ACB22    pop         ebx
 005ACB23    ret
*}
end;

//005ACB24
procedure TIdSocketHandle.SetNagleOpt(AEnabled:Boolean);
begin
{*
 005ACB24    cmp         byte ptr [eax+14],0
>005ACB28    je          005ACB46
 005ACB2A    cmp         dword ptr [eax+28],1
>005ACB2E    jne         005ACB46
 005ACB30    xor         dl,1
 005ACB33    and         edx,7F
 005ACB36    push        edx
 005ACB37    mov         ecx,1
 005ACB3C    mov         edx,6
 005ACB41    call        TIdSocketHandle.SetSockOpt
 005ACB46    ret
*}
end;

//005ACB48
procedure TIdSocketHandle.SetTTL(AValue:Integer);
begin
{*
 005ACB48    cmp         byte ptr [eax+2D],0
>005ACB4C    jne         005ACB5C
 005ACB4E    push        edx
 005ACB4F    mov         ecx,4
 005ACB54    xor         edx,edx
 005ACB56    call        TIdSocketHandle.SetSockOpt
 005ACB5B    ret
 005ACB5C    push        edx
 005ACB5D    mov         ecx,4
 005ACB62    mov         edx,29
 005ACB67    call        TIdSocketHandle.SetSockOpt
 005ACB6C    ret
*}
end;

//005ACB70
procedure TIdSocketHandle.SetUseNagle(const AValue:Boolean);
begin
{*
 005ACB70    cmp         dl,byte ptr [eax+35]
>005ACB73    je          005ACB81
 005ACB75    mov         ecx,edx
 005ACB77    mov         byte ptr [eax+35],cl
 005ACB7A    mov         edx,ecx
 005ACB7C    call        TIdSocketHandle.SetNagleOpt
 005ACB81    ret
*}
end;

//005ACB84
function TIdSocketHandles.Add:TIdSocketHandle;
begin
{*
 005ACB84    push        ebx
 005ACB85    mov         ebx,eax
 005ACB87    mov         eax,ebx
 005ACB89    call        TCollection.Add
 005ACB8E    mov         edx,dword ptr ds:[5AB27C];TIdSocketHandle
 005ACB94    call        @AsClass
 005ACB99    movzx       edx,word ptr [ebx+1C]
 005ACB9D    mov         word ptr [eax+20],dx
 005ACBA1    pop         ebx
 005ACBA2    ret
*}
end;

//005ACBA4
function TIdSocketHandles.BindingByHandle(AHandle:Cardinal):TIdSocketHandle;
begin
{*
 005ACBA4    push        ebx
 005ACBA5    push        esi
 005ACBA6    push        edi
 005ACBA7    push        ebp
 005ACBA8    mov         edi,edx
 005ACBAA    mov         esi,eax
 005ACBAC    xor         ebp,ebp
 005ACBAE    mov         eax,dword ptr [esi+8]
 005ACBB1    mov         ebx,dword ptr [eax+8]
 005ACBB4    dec         ebx
 005ACBB5    cmp         ebx,0
>005ACBB8    jl          005ACBDB
 005ACBBA    mov         edx,ebx
 005ACBBC    mov         eax,esi
 005ACBBE    call        TIdSocketHandles.GetItem
 005ACBC3    cmp         edi,dword ptr [eax+10]
>005ACBC6    jne         005ACBD5
 005ACBC8    mov         edx,ebx
 005ACBCA    mov         eax,esi
 005ACBCC    call        TIdSocketHandles.GetItem
 005ACBD1    mov         ebp,eax
>005ACBD3    jmp         005ACBDB
 005ACBD5    dec         ebx
 005ACBD6    cmp         ebx,0FFFFFFFF
>005ACBD9    jne         005ACBBA
 005ACBDB    mov         eax,ebp
 005ACBDD    pop         ebp
 005ACBDE    pop         edi
 005ACBDF    pop         esi
 005ACBE0    pop         ebx
 005ACBE1    ret
*}
end;

//005ACBE4
constructor TIdSocketHandles.Create;
begin
{*
 005ACBE4    push        ebx
 005ACBE5    push        esi
 005ACBE6    test        dl,dl
>005ACBE8    je          005ACBF2
 005ACBEA    add         esp,0FFFFFFF0
 005ACBED    call        @ClassCreate
 005ACBF2    mov         ebx,edx
 005ACBF4    mov         esi,eax
 005ACBF6    mov         eax,[005AB27C];TIdSocketHandle
 005ACBFB    push        eax
 005ACBFC    xor         edx,edx
 005ACBFE    mov         eax,esi
 005ACC00    call        TOwnedCollection.Create
 005ACC05    mov         eax,esi
 005ACC07    test        bl,bl
>005ACC09    je          005ACC1A
 005ACC0B    call        @AfterConstruction
 005ACC10    pop         dword ptr fs:[0]
 005ACC17    add         esp,0C
 005ACC1A    mov         eax,esi
 005ACC1C    pop         esi
 005ACC1D    pop         ebx
 005ACC1E    ret
*}
end;

//005ACC20
function TIdSocketHandles.GetItem(Index:Integer):TIdSocketHandle;
begin
{*
 005ACC20    push        ebx
 005ACC21    push        esi
 005ACC22    mov         esi,edx
 005ACC24    mov         ebx,eax
 005ACC26    mov         edx,esi
 005ACC28    mov         eax,ebx
 005ACC2A    call        TCollection.GetItem
 005ACC2F    pop         esi
 005ACC30    pop         ebx
 005ACC31    ret
*}
end;

//005AD254
procedure TIdUDPBase.Broadcast(AData:string; APort:Word; AEncoding:TEncoding; AIP:string);
begin
{*
 005AD254    push        ebp
 005AD255    mov         ebp,esp
 005AD257    push        ebx
 005AD258    push        esi
 005AD259    push        edi
 005AD25A    mov         edi,ecx
 005AD25C    mov         esi,edx
 005AD25E    mov         ebx,eax
 005AD260    mov         eax,dword ptr [ebp+0C]
 005AD263    push        eax
 005AD264    mov         eax,dword ptr [ebp+8]
 005AD267    push        eax
 005AD268    mov         eax,ebx
 005AD26A    mov         edx,dword ptr [eax]
 005AD26C    call        dword ptr [edx+4C]
 005AD26F    mov         ecx,edi
 005AD271    mov         edx,esi
 005AD273    call        TIdSocketHandle.Broadcast
 005AD278    pop         edi
 005AD279    pop         esi
 005AD27A    pop         ebx
 005AD27B    pop         ebp
 005AD27C    ret         8
*}
end;

//005AD280
procedure TIdUDPBase.Broadcast(const AData:TIdBytes; const APort:TIdPort; const AIP:UnicodeString);
begin
{*
 005AD280    push        ebp
 005AD281    mov         ebp,esp
 005AD283    push        ebx
 005AD284    push        esi
 005AD285    push        edi
 005AD286    mov         edi,ecx
 005AD288    mov         esi,edx
 005AD28A    mov         ebx,eax
 005AD28C    mov         eax,dword ptr [ebp+8]
 005AD28F    push        eax
 005AD290    mov         eax,ebx
 005AD292    mov         edx,dword ptr [eax]
 005AD294    call        dword ptr [edx+4C]
 005AD297    mov         ecx,edi
 005AD299    mov         edx,esi
 005AD29B    call        TIdSocketHandle.Broadcast
 005AD2A0    pop         edi
 005AD2A1    pop         esi
 005AD2A2    pop         ebx
 005AD2A3    pop         ebp
 005AD2A4    ret         4
*}
end;

//005AD2A8
procedure TIdUDPBase.BroadcastEnabledChanged;
begin
{*
 005AD2A8    push        ebx
 005AD2A9    mov         ebx,eax
 005AD2AB    mov         eax,ebx
 005AD2AD    mov         edx,dword ptr [eax]
 005AD2AF    call        dword ptr [edx+4C]
 005AD2B2    movzx       edx,byte ptr [ebx+0A9]
 005AD2B9    call        TIdSocketHandle.SetBroadcastEnabled
 005AD2BE    pop         ebx
 005AD2BF    ret
*}
end;

//005AD2C0
procedure TIdUDPBase.CloseBinding;
begin
{*
 005AD2C0    add         eax,90
 005AD2C5    mov         edx,dword ptr [eax]
 005AD2C7    xor         ecx,ecx
 005AD2C9    mov         dword ptr [eax],ecx
 005AD2CB    mov         eax,edx
 005AD2CD    call        TObject.Free
 005AD2D2    ret
*}
end;

//005AD2D4
destructor TIdUDPBase.Destroy();
begin
{*
 005AD2D4    push        ebx
 005AD2D5    push        esi
 005AD2D6    call        @BeforeDestruction
 005AD2DB    mov         ebx,edx
 005AD2DD    mov         esi,eax
 005AD2DF    xor         edx,edx
 005AD2E1    mov         eax,esi
 005AD2E3    call        TIdUDPBase.SetActive
 005AD2E8    mov         eax,esi
 005AD2EA    mov         edx,dword ptr [eax]
 005AD2EC    call        dword ptr [edx+44]
 005AD2EF    mov         edx,ebx
 005AD2F1    and         dl,0FC
 005AD2F4    mov         eax,esi
 005AD2F6    call        TIdComponent.Destroy
 005AD2FB    test        bl,bl
>005AD2FD    jle         005AD306
 005AD2FF    mov         eax,esi
 005AD301    call        @ClassDestroy
 005AD306    pop         esi
 005AD307    pop         ebx
 005AD308    ret
*}
end;

//005AD30C
function TIdUDPBase.GetActive:Boolean;
begin
{*
 005AD30C    movzx       edx,byte ptr [eax+98]
 005AD313    test        dl,dl
>005AD315    jne         005AD325
 005AD317    mov         ecx,dword ptr [eax+90]
 005AD31D    test        ecx,ecx
>005AD31F    je          005AD325
 005AD321    movzx       edx,byte ptr [ecx+14]
 005AD325    mov         eax,edx
 005AD327    ret
*}
end;

//005AD328
function TIdUDPBase.GetHost:string;
begin
{*
 005AD328    push        ebx
 005AD329    push        esi
 005AD32A    mov         esi,edx
 005AD32C    mov         ebx,eax
 005AD32E    mov         eax,esi
 005AD330    mov         edx,dword ptr [ebx+9C]
 005AD336    call        @UStrAsg
 005AD33B    pop         esi
 005AD33C    pop         ebx
 005AD33D    ret
*}
end;

//005AD340
function TIdUDPBase.GetIPVersion:TIdIPVersion;
begin
{*
 005AD340    movzx       eax,byte ptr [eax+0A8]
 005AD347    ret
*}
end;

//005AD348
function TIdUDPBase.GetPort:Word;
begin
{*
 005AD348    movzx       eax,word ptr [eax+0A0]
 005AD34F    ret
*}
end;

//005AD350
procedure TIdUDPBase.InitComponent;
begin
{*
 005AD350    push        ebx
 005AD351    mov         ebx,eax
 005AD353    mov         eax,ebx
 005AD355    call        TIdComponent.InitComponent
 005AD35A    mov         dword ptr [ebx+94],2000
 005AD364    mov         dword ptr [ebx+0A4],0FFFFFFFE
 005AD36E    mov         byte ptr [ebx+0A8],0
 005AD375    pop         ebx
 005AD376    ret
*}
end;

//005AD378
procedure TIdUDPBase.Loaded;
begin
{*
 005AD378    push        ebx
 005AD379    mov         ebx,eax
 005AD37B    mov         eax,ebx
 005AD37D    call        TComponent.Loaded
 005AD382    movzx       eax,byte ptr [ebx+98]
 005AD389    mov         byte ptr [ebx+98],0
 005AD390    mov         edx,eax
 005AD392    mov         eax,ebx
 005AD394    call        TIdUDPBase.SetActive
 005AD399    pop         ebx
 005AD39A    ret
*}
end;

//005AD39C
procedure TIdUDPBase.ReceiveBuffer(var ABuffer:TIdBytes; const AMSec:Integer);
begin
{*
 005AD39C    push        ebp
 005AD39D    mov         ebp,esp
 005AD39F    add         esp,0FFFFFFF8
 005AD3A2    push        ebx
 005AD3A3    push        esi
 005AD3A4    push        edi
 005AD3A5    xor         ebx,ebx
 005AD3A7    mov         dword ptr [ebp-4],ebx
 005AD3AA    mov         edi,edx
 005AD3AC    mov         esi,eax
 005AD3AE    xor         eax,eax
 005AD3B0    push        ebp
 005AD3B1    push        5AD3E9
 005AD3B6    push        dword ptr fs:[eax]
 005AD3B9    mov         dword ptr fs:[eax],esp
 005AD3BC    lea         eax,[ebp-6]
 005AD3BF    push        eax
 005AD3C0    lea         eax,[ebp-7]
 005AD3C3    push        eax
 005AD3C4    push        ecx
 005AD3C5    mov         edx,edi
 005AD3C7    lea         ecx,[ebp-4]
 005AD3CA    mov         eax,esi
 005AD3CC    mov         ebx,dword ptr [eax]
 005AD3CE    call        dword ptr [ebx+6C]
 005AD3D1    mov         ebx,eax
 005AD3D3    xor         eax,eax
 005AD3D5    pop         edx
 005AD3D6    pop         ecx
 005AD3D7    pop         ecx
 005AD3D8    mov         dword ptr fs:[eax],edx
 005AD3DB    push        5AD3F0
 005AD3E0    lea         eax,[ebp-4]
 005AD3E3    call        @UStrClr
 005AD3E8    ret
>005AD3E9    jmp         @HandleFinally
>005AD3EE    jmp         005AD3E0
 005AD3F0    mov         eax,ebx
 005AD3F2    pop         edi
 005AD3F3    pop         esi
 005AD3F4    pop         ebx
 005AD3F5    pop         ecx
 005AD3F6    pop         ecx
 005AD3F7    pop         ebp
 005AD3F8    ret
*}
end;

//005AD3FC
procedure TIdUDPBase.ReceiveBuffer(var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; AMSec:Integer);
begin
{*
 005AD3FC    push        ebp
 005AD3FD    mov         ebp,esp
 005AD3FF    push        ecx
 005AD400    push        ebx
 005AD401    push        esi
 005AD402    push        edi
 005AD403    mov         edi,edx
 005AD405    mov         esi,eax
 005AD407    mov         eax,dword ptr [ebp+0C]
 005AD40A    push        eax
 005AD40B    lea         eax,[ebp-1]
 005AD40E    push        eax
 005AD40F    mov         eax,dword ptr [ebp+8]
 005AD412    push        eax
 005AD413    mov         edx,edi
 005AD415    mov         eax,esi
 005AD417    mov         ebx,dword ptr [eax]
 005AD419    call        dword ptr [ebx+6C]
 005AD41C    pop         edi
 005AD41D    pop         esi
 005AD41E    pop         ebx
 005AD41F    pop         ecx
 005AD420    pop         ebp
 005AD421    ret         8
*}
end;

//005AD424
procedure TIdUDPBase.ReceiveBuffer(var ABuffer:TIdBytes; var VPeerIP:UnicodeString; var VPeerPort:TIdPort; var VIPVersion:TIdIPVersion; const AMSec:Integer);
begin
{*
 005AD424    push        ebp
 005AD425    mov         ebp,esp
 005AD427    push        ecx
 005AD428    push        ebx
 005AD429    push        esi
 005AD42A    push        edi
 005AD42B    mov         edi,ecx
 005AD42D    mov         dword ptr [ebp-4],edx
 005AD430    mov         ebx,eax
 005AD432    mov         eax,dword ptr [ebp+8]
 005AD435    cmp         eax,0FFFFFFFF
>005AD438    jne         005AD44F
 005AD43A    mov         eax,dword ptr [ebx+0A4]
 005AD440    test        eax,eax
>005AD442    jne         005AD44B
 005AD444    mov         esi,0FFFFFFFE
>005AD449    jmp         005AD451
 005AD44B    mov         esi,eax
>005AD44D    jmp         005AD451
 005AD44F    mov         esi,eax
 005AD451    mov         eax,ebx
 005AD453    mov         edx,dword ptr [eax]
 005AD455    call        dword ptr [edx+4C]
 005AD458    mov         edx,esi
 005AD45A    call        TIdSocketHandle.Readable
 005AD45F    test        al,al
>005AD461    jne         005AD476
 005AD463    xor         ebx,ebx
 005AD465    mov         eax,edi
 005AD467    call        @UStrClr
 005AD46C    mov         eax,dword ptr [ebp+10]
 005AD46F    mov         word ptr [eax],0
>005AD474    jmp         005AD491
 005AD476    mov         eax,dword ptr [ebp+10]
 005AD479    push        eax
 005AD47A    mov         eax,dword ptr [ebp+0C]
 005AD47D    push        eax
 005AD47E    mov         eax,ebx
 005AD480    mov         edx,dword ptr [eax]
 005AD482    call        dword ptr [edx+4C]
 005AD485    mov         ecx,edi
 005AD487    mov         edx,dword ptr [ebp-4]
 005AD48A    call        TIdSocketHandle.RecvFrom
 005AD48F    mov         ebx,eax
 005AD491    mov         eax,ebx
 005AD493    pop         edi
 005AD494    pop         esi
 005AD495    pop         ebx
 005AD496    pop         ecx
 005AD497    pop         ebp
 005AD498    ret         0C
*}
end;

//005AD49C
function TIdUDPBase.ReceiveString(var VPeerIP:string; var VPeerPort:Word; AEncoding:TEncoding; AMSec:Integer):string;
begin
{*
 005AD49C    push        ebp
 005AD49D    mov         ebp,esp
 005AD49F    push        0
 005AD4A1    push        ebx
 005AD4A2    push        esi
 005AD4A3    push        edi
 005AD4A4    mov         edi,ecx
 005AD4A6    mov         esi,edx
 005AD4A8    mov         ebx,eax
 005AD4AA    xor         eax,eax
 005AD4AC    push        ebp
 005AD4AD    push        5AD518
 005AD4B2    push        dword ptr fs:[eax]
 005AD4B5    mov         dword ptr fs:[eax],esp
 005AD4B8    mov         eax,dword ptr [ebx+94]
 005AD4BE    push        eax
 005AD4BF    lea         eax,[ebp-4]
 005AD4C2    mov         ecx,1
 005AD4C7    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AD4CD    call        @DynArraySetLength
 005AD4D2    add         esp,4
 005AD4D5    push        edi
 005AD4D6    mov         eax,dword ptr [ebp+10]
 005AD4D9    push        eax
 005AD4DA    mov         ecx,esi
 005AD4DC    lea         edx,[ebp-4]
 005AD4DF    mov         eax,ebx
 005AD4E1    mov         ebx,dword ptr [eax]
 005AD4E3    call        dword ptr [ebx+68]
 005AD4E6    mov         ebx,eax
 005AD4E8    mov         eax,dword ptr [ebp+0C]
 005AD4EB    push        eax
 005AD4EC    mov         eax,dword ptr [ebp+8]
 005AD4EF    push        eax
 005AD4F0    mov         ecx,ebx
 005AD4F2    xor         edx,edx
 005AD4F4    mov         eax,dword ptr [ebp-4]
 005AD4F7    call        BytesToString
 005AD4FC    xor         eax,eax
 005AD4FE    pop         edx
 005AD4FF    pop         ecx
 005AD500    pop         ecx
 005AD501    mov         dword ptr fs:[eax],edx
 005AD504    push        5AD51F
 005AD509    lea         eax,[ebp-4]
 005AD50C    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AD512    call        @DynArrayClear
 005AD517    ret
>005AD518    jmp         @HandleFinally
>005AD51D    jmp         005AD509
 005AD51F    pop         edi
 005AD520    pop         esi
 005AD521    pop         ebx
 005AD522    pop         ecx
 005AD523    pop         ebp
 005AD524    ret         0C
*}
end;

//005AD528
function TIdUDPBase.ReceiveString(AMSec:Integer; AEncoding:TEncoding):string;
begin
{*
 005AD528    push        ebp
 005AD529    mov         ebp,esp
 005AD52B    add         esp,0FFFFFFF8
 005AD52E    push        ebx
 005AD52F    push        esi
 005AD530    push        edi
 005AD531    xor         ebx,ebx
 005AD533    mov         dword ptr [ebp-4],ebx
 005AD536    mov         edi,ecx
 005AD538    mov         esi,edx
 005AD53A    mov         ebx,eax
 005AD53C    xor         eax,eax
 005AD53E    push        ebp
 005AD53F    push        5AD573
 005AD544    push        dword ptr fs:[eax]
 005AD547    mov         dword ptr fs:[eax],esp
 005AD54A    push        esi
 005AD54B    push        edi
 005AD54C    mov         eax,dword ptr [ebp+8]
 005AD54F    push        eax
 005AD550    lea         ecx,[ebp-6]
 005AD553    lea         edx,[ebp-4]
 005AD556    mov         eax,ebx
 005AD558    call        TIdUDPBase.ReceiveString
 005AD55D    xor         eax,eax
 005AD55F    pop         edx
 005AD560    pop         ecx
 005AD561    pop         ecx
 005AD562    mov         dword ptr fs:[eax],edx
 005AD565    push        5AD57A
 005AD56A    lea         eax,[ebp-4]
 005AD56D    call        @UStrClr
 005AD572    ret
>005AD573    jmp         @HandleFinally
>005AD578    jmp         005AD56A
 005AD57A    pop         edi
 005AD57B    pop         esi
 005AD57C    pop         ebx
 005AD57D    pop         ecx
 005AD57E    pop         ecx
 005AD57F    pop         ebp
 005AD580    ret         4
*}
end;

//005AD584
procedure TIdUDPBase.Send(AHost:string; APort:Word; AEncoding:TEncoding; AData:string);
begin
{*
 005AD584    push        ebp
 005AD585    mov         ebp,esp
 005AD587    push        0
 005AD589    push        ebx
 005AD58A    push        esi
 005AD58B    push        edi
 005AD58C    mov         edi,ecx
 005AD58E    mov         esi,edx
 005AD590    mov         ebx,eax
 005AD592    xor         eax,eax
 005AD594    push        ebp
 005AD595    push        5AD5D9
 005AD59A    push        dword ptr fs:[eax]
 005AD59D    mov         dword ptr fs:[eax],esp
 005AD5A0    lea         ecx,[ebp-4]
 005AD5A3    mov         edx,dword ptr [ebp+8]
 005AD5A6    mov         eax,dword ptr [ebp+0C]
 005AD5A9    call        ToBytes
 005AD5AE    mov         eax,dword ptr [ebp-4]
 005AD5B1    push        eax
 005AD5B2    mov         ecx,edi
 005AD5B4    mov         edx,esi
 005AD5B6    mov         eax,ebx
 005AD5B8    mov         ebx,dword ptr [eax]
 005AD5BA    call        dword ptr [ebx+78]
 005AD5BD    xor         eax,eax
 005AD5BF    pop         edx
 005AD5C0    pop         ecx
 005AD5C1    pop         ecx
 005AD5C2    mov         dword ptr fs:[eax],edx
 005AD5C5    push        5AD5E0
 005AD5CA    lea         eax,[ebp-4]
 005AD5CD    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AD5D3    call        @DynArrayClear
 005AD5D8    ret
>005AD5D9    jmp         @HandleFinally
>005AD5DE    jmp         005AD5CA
 005AD5E0    pop         edi
 005AD5E1    pop         esi
 005AD5E2    pop         ebx
 005AD5E3    pop         ecx
 005AD5E4    pop         ebp
 005AD5E5    ret         8
*}
end;

//005AD5E8
procedure TIdUDPBase.SendBuffer(const AHost:UnicodeString; const APort:TIdPort; const ABuffer:TIdBytes);
begin
{*
 005AD5E8    push        ebp
 005AD5E9    mov         ebp,esp
 005AD5EB    push        ebx
 005AD5EC    push        esi
 005AD5ED    push        edi
 005AD5EE    mov         edi,ecx
 005AD5F0    mov         esi,edx
 005AD5F2    mov         ebx,eax
 005AD5F4    mov         eax,ebx
 005AD5F6    mov         edx,dword ptr [eax]
 005AD5F8    call        dword ptr [edx+50]
 005AD5FB    push        eax
 005AD5FC    mov         eax,dword ptr [ebp+8]
 005AD5FF    push        eax
 005AD600    mov         ecx,edi
 005AD602    mov         edx,esi
 005AD604    mov         eax,ebx
 005AD606    mov         ebx,dword ptr [eax]
 005AD608    call        dword ptr [ebx+74]
 005AD60B    pop         edi
 005AD60C    pop         esi
 005AD60D    pop         ebx
 005AD60E    pop         ebp
 005AD60F    ret         4
*}
end;

//005AD614
procedure TIdUDPBase.SendBuffer(const AHost:UnicodeString; const APort:TIdPort; const AIPVersion:TIdIPVersion; const ABuffer:TIdBytes);
begin
{*
 005AD614    push        ebp
 005AD615    mov         ebp,esp
 005AD617    add         esp,0FFFFFFF8
 005AD61A    push        ebx
 005AD61B    push        esi
 005AD61C    push        edi
 005AD61D    xor         ebx,ebx
 005AD61F    mov         dword ptr [ebp-4],ebx
 005AD622    mov         word ptr [ebp-6],cx
 005AD626    mov         edi,edx
 005AD628    mov         esi,eax
 005AD62A    mov         ebx,dword ptr [ebp+0C]
 005AD62D    xor         eax,eax
 005AD62F    push        ebp
 005AD630    push        5AD67D
 005AD635    push        dword ptr fs:[eax]
 005AD638    mov         dword ptr fs:[eax],esp
 005AD63B    lea         eax,[ebp-4]
 005AD63E    push        eax
 005AD63F    mov         eax,[0078D940];^gvar_00789ED0
 005AD644    mov         eax,dword ptr [eax]
 005AD646    mov         ecx,ebx
 005AD648    mov         edx,edi
 005AD64A    call        TIdStack.ResolveHost
 005AD64F    mov         eax,dword ptr [ebp+8]
 005AD652    push        eax
 005AD653    push        ebx
 005AD654    mov         eax,esi
 005AD656    mov         edx,dword ptr [eax]
 005AD658    call        dword ptr [edx+4C]
 005AD65B    movzx       ecx,word ptr [ebp-6]
 005AD65F    mov         edx,dword ptr [ebp-4]
 005AD662    call        TIdSocketHandle.SendTo
 005AD667    xor         eax,eax
 005AD669    pop         edx
 005AD66A    pop         ecx
 005AD66B    pop         ecx
 005AD66C    mov         dword ptr fs:[eax],edx
 005AD66F    push        5AD684
 005AD674    lea         eax,[ebp-4]
 005AD677    call        @UStrClr
 005AD67C    ret
>005AD67D    jmp         @HandleFinally
>005AD682    jmp         005AD674
 005AD684    pop         edi
 005AD685    pop         esi
 005AD686    pop         ebx
 005AD687    pop         ecx
 005AD688    pop         ecx
 005AD689    pop         ebp
 005AD68A    ret         8
*}
end;

//005AD690
procedure TIdUDPBase.SetActive(const Value:Boolean);
begin
{*
 005AD690    push        ebx
 005AD691    push        esi
 005AD692    mov         ebx,edx
 005AD694    mov         esi,eax
 005AD696    mov         eax,esi
 005AD698    mov         edx,dword ptr [eax]
 005AD69A    call        dword ptr [edx+48]
 005AD69D    cmp         bl,al
>005AD69F    je          005AD6D3
 005AD6A1    mov         eax,esi
 005AD6A3    call        TIdInitializerComponent.GetIsDesignTime
 005AD6A8    test        al,al
>005AD6AA    jne         005AD6CD
 005AD6AC    mov         eax,esi
 005AD6AE    call        TIdInitializerComponent.GetIsLoading
 005AD6B3    test        al,al
>005AD6B5    jne         005AD6CD
 005AD6B7    test        bl,bl
>005AD6B9    je          005AD6C4
 005AD6BB    mov         eax,esi
 005AD6BD    mov         edx,dword ptr [eax]
 005AD6BF    call        dword ptr [edx+4C]
>005AD6C2    jmp         005AD6D3
 005AD6C4    mov         eax,esi
 005AD6C6    mov         edx,dword ptr [eax]
 005AD6C8    call        dword ptr [edx+44]
>005AD6CB    jmp         005AD6D3
 005AD6CD    mov         byte ptr [esi+98],bl
 005AD6D3    pop         esi
 005AD6D4    pop         ebx
 005AD6D5    ret
*}
end;

//005AD6D8
procedure TIdUDPBase.SetBroadcastEnabled(const AValue:Boolean);
begin
{*
 005AD6D8    push        ebx
 005AD6D9    push        esi
 005AD6DA    mov         ebx,eax
 005AD6DC    cmp         dl,byte ptr [ebx+0A9]
>005AD6E2    je          005AD700
 005AD6E4    mov         byte ptr [ebx+0A9],dl
 005AD6EA    mov         eax,ebx
 005AD6EC    mov         edx,dword ptr [eax]
 005AD6EE    call        dword ptr [edx+48]
 005AD6F1    test        al,al
>005AD6F3    je          005AD700
 005AD6F5    mov         eax,ebx
 005AD6F7    mov         si,0FFF0
 005AD6FB    call        @CallDynaInst
 005AD700    pop         esi
 005AD701    pop         ebx
 005AD702    ret
*}
end;

//005AD704
procedure TIdUDPBase.SetHost(const AValue:UnicodeString);
begin
{*
 005AD704    push        ebx
 005AD705    push        esi
 005AD706    mov         esi,edx
 005AD708    mov         ebx,eax
 005AD70A    lea         eax,[ebx+9C]
 005AD710    mov         edx,esi
 005AD712    call        @UStrAsg
 005AD717    pop         esi
 005AD718    pop         ebx
 005AD719    ret
*}
end;

//005AD71C
procedure TIdUDPBase.SetIPVersion(const AValue:TIdIPVersion);
begin
{*
 005AD71C    mov         byte ptr [eax+0A8],dl
 005AD722    ret
*}
end;

//005AD724
procedure TIdUDPBase.SetPort(const AValue:TIdPort);
begin
{*
 005AD724    mov         word ptr [eax+0A0],dx
 005AD72B    ret
*}
end;

//005AE51C
procedure TIdBuffer.CheckAdd(AByteCount:Integer; const AIndex:Integer);
begin
{*
 005AE51C    push        ebp
 005AE51D    mov         ebp,esp
 005AE51F    push        0
 005AE521    push        ebx
 005AE522    xor         ebx,ebx
 005AE524    push        ebp
 005AE525    push        5AE56E
 005AE52A    push        dword ptr fs:[ebx]
 005AE52D    mov         dword ptr fs:[ebx],esp
 005AE530    mov         ebx,7FFFFFFF
 005AE535    sub         ebx,edx
 005AE537    add         ecx,dword ptr [eax+20]
 005AE53A    cmp         ebx,ecx
>005AE53C    jge         005AE558
 005AE53E    lea         edx,[ebp-4]
 005AE541    mov         eax,[0078DAEC];^SResString683:TResStringRec
 005AE546    call        LoadResString
 005AE54B    mov         edx,dword ptr [ebp-4]
 005AE54E    mov         eax,[005AD934];EIdTooMuchDataInBuffer
 005AE553    call        EIdException.Toss
 005AE558    xor         eax,eax
 005AE55A    pop         edx
 005AE55B    pop         ecx
 005AE55C    pop         ecx
 005AE55D    mov         dword ptr fs:[eax],edx
 005AE560    push        5AE575
 005AE565    lea         eax,[ebp-4]
 005AE568    call        @UStrClr
 005AE56D    ret
>005AE56E    jmp         @HandleFinally
>005AE573    jmp         005AE565
 005AE575    pop         ebx
 005AE576    pop         ecx
 005AE577    pop         ebp
 005AE578    ret
*}
end;

//005AE57C
procedure TIdBuffer.CheckByteCount(var VByteCount:Integer; const AIndex:Integer);
begin
{*
 005AE57C    push        ebp
 005AE57D    mov         ebp,esp
 005AE57F    push        0
 005AE581    push        0
 005AE583    push        0
 005AE585    push        0
 005AE587    push        ebx
 005AE588    push        esi
 005AE589    mov         esi,edx
 005AE58B    mov         ebx,eax
 005AE58D    xor         eax,eax
 005AE58F    push        ebp
 005AE590    push        5AE61F
 005AE595    push        dword ptr fs:[eax]
 005AE598    mov         dword ptr fs:[eax],esp
 005AE59B    cmp         dword ptr [esi],0FFFFFFFF
>005AE59E    jne         005AE5A7
 005AE5A0    add         ecx,dword ptr [ebx+20]
 005AE5A3    mov         dword ptr [esi],ecx
>005AE5A5    jmp         005AE604
 005AE5A7    mov         eax,dword ptr [esi]
 005AE5A9    add         ecx,dword ptr [ebx+20]
 005AE5AC    cmp         eax,ecx
>005AE5AE    jle         005AE604
 005AE5B0    lea         edx,[ebp-8]
 005AE5B3    mov         eax,[0078CE6C];^SResString682:TResStringRec
 005AE5B8    call        LoadResString
 005AE5BD    push        dword ptr [ebp-8]
 005AE5C0    push        5AE638;' ('
 005AE5C5    lea         edx,[ebp-0C]
 005AE5C8    mov         eax,dword ptr [esi]
 005AE5CA    call        IntToStr
 005AE5CF    push        dword ptr [ebp-0C]
 005AE5D2    push        5AE64C;'/'
 005AE5D7    lea         edx,[ebp-10]
 005AE5DA    mov         eax,dword ptr [ebx+20]
 005AE5DD    call        IntToStr
 005AE5E2    push        dword ptr [ebp-10]
 005AE5E5    push        5AE65C;')'
 005AE5EA    lea         eax,[ebp-4]
 005AE5ED    mov         edx,6
 005AE5F2    call        @UStrCatN
 005AE5F7    mov         edx,dword ptr [ebp-4]
 005AE5FA    mov         eax,[005AD87C];EIdNotEnoughDataInBuffer
 005AE5FF    call        EIdException.Toss
 005AE604    xor         eax,eax
 005AE606    pop         edx
 005AE607    pop         ecx
 005AE608    pop         ecx
 005AE609    mov         dword ptr fs:[eax],edx
 005AE60C    push        5AE626
 005AE611    lea         eax,[ebp-10]
 005AE614    mov         edx,4
 005AE619    call        @UStrArrayClr
 005AE61E    ret
>005AE61F    jmp         @HandleFinally
>005AE624    jmp         005AE611
 005AE626    pop         esi
 005AE627    pop         ebx
 005AE628    mov         esp,ebp
 005AE62A    pop         ebp
 005AE62B    ret
*}
end;

//005AE660
procedure TIdBuffer.Clear;
begin
{*
 005AE660    push        ebx
 005AE661    mov         ebx,eax
 005AE663    push        0
 005AE665    lea         eax,[ebx+4]
 005AE668    mov         ecx,1
 005AE66D    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AE673    call        @DynArraySetLength
 005AE678    add         esp,4
 005AE67B    xor         eax,eax
 005AE67D    mov         dword ptr [ebx+10],eax
 005AE680    mov         eax,dword ptr [ebx+4]
 005AE683    call        @DynArrayLength
 005AE688    mov         dword ptr [ebx+20],eax
 005AE68B    pop         ebx
 005AE68C    ret
*}
end;

//005AE690
constructor TIdBuffer.Create;
begin
{*
 005AE690    push        ebx
 005AE691    push        esi
 005AE692    push        edi
 005AE693    test        dl,dl
>005AE695    je          005AE69F
 005AE697    add         esp,0FFFFFFF0
 005AE69A    call        @ClassCreate
 005AE69F    mov         esi,ecx
 005AE6A1    mov         ebx,edx
 005AE6A3    mov         edi,eax
 005AE6A5    xor         edx,edx
 005AE6A7    mov         eax,edi
 005AE6A9    call        TIdBuffer.Create
 005AE6AE    mov         dword ptr [edi+0C],esi
 005AE6B1    mov         eax,edi
 005AE6B3    test        bl,bl
>005AE6B5    je          005AE6C6
 005AE6B7    call        @AfterConstruction
 005AE6BC    pop         dword ptr fs:[0]
 005AE6C3    add         esp,0C
 005AE6C6    mov         eax,edi
 005AE6C8    pop         edi
 005AE6C9    pop         esi
 005AE6CA    pop         ebx
 005AE6CB    ret
*}
end;

//005AE6CC
constructor TIdBuffer.Create;
begin
{*
 005AE6CC    push        ebp
 005AE6CD    mov         ebp,esp
 005AE6CF    push        ebx
 005AE6D0    push        esi
 005AE6D1    test        dl,dl
>005AE6D3    je          005AE6DD
 005AE6D5    add         esp,0FFFFFFF0
 005AE6D8    call        @ClassCreate
 005AE6DD    mov         ebx,edx
 005AE6DF    mov         esi,eax
 005AE6E1    xor         edx,edx
 005AE6E3    mov         eax,esi
 005AE6E5    call        TIdBuffer.Create
 005AE6EA    mov         eax,dword ptr [ebp+8]
 005AE6ED    mov         dword ptr [esi+18],eax
 005AE6F0    mov         eax,dword ptr [ebp+0C]
 005AE6F3    mov         dword ptr [esi+1C],eax
 005AE6F6    mov         eax,esi
 005AE6F8    test        bl,bl
>005AE6FA    je          005AE70B
 005AE6FC    call        @AfterConstruction
 005AE701    pop         dword ptr fs:[0]
 005AE708    add         esp,0C
 005AE70B    mov         eax,esi
 005AE70D    pop         esi
 005AE70E    pop         ebx
 005AE70F    pop         ebp
 005AE710    ret         8
*}
end;

//005AE714
constructor TIdBuffer.Create(const ABytes:TIdBytes; const ALength:Integer);
begin
{*
 005AE714    push        ebp
 005AE715    mov         ebp,esp
 005AE717    push        ecx
 005AE718    push        ebx
 005AE719    push        esi
 005AE71A    push        edi
 005AE71B    test        dl,dl
>005AE71D    je          005AE727
 005AE71F    add         esp,0FFFFFFF0
 005AE722    call        @ClassCreate
 005AE727    mov         edi,ecx
 005AE729    mov         byte ptr [ebp-1],dl
 005AE72C    mov         ebx,eax
 005AE72E    mov         esi,dword ptr [ebp+8]
 005AE731    xor         edx,edx
 005AE733    mov         eax,ebx
 005AE735    call        TIdBuffer.Create
 005AE73A    test        esi,esi
>005AE73C    jge         005AE75A
 005AE73E    lea         eax,[ebx+4]
 005AE741    mov         edx,edi
 005AE743    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 005AE749    call        @DynArrayAsg
 005AE74E    mov         eax,edi
 005AE750    call        @DynArrayLength
 005AE755    mov         dword ptr [ebx+20],eax
>005AE758    jmp         005AE787
 005AE75A    push        esi
 005AE75B    lea         eax,[ebx+4]
 005AE75E    mov         ecx,1
 005AE763    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AE769    call        @DynArraySetLength
 005AE76E    add         esp,4
 005AE771    test        esi,esi
>005AE773    jle         005AE787
 005AE775    push        0
 005AE777    push        esi
 005AE778    lea         ecx,[ebx+4]
 005AE77B    xor         edx,edx
 005AE77D    mov         eax,edi
 005AE77F    call        CopyTIdBytes
 005AE784    mov         dword ptr [ebx+20],esi
 005AE787    mov         eax,ebx
 005AE789    cmp         byte ptr [ebp-1],0
>005AE78D    je          005AE79E
 005AE78F    call        @AfterConstruction
 005AE794    pop         dword ptr fs:[0]
 005AE79B    add         esp,0C
 005AE79E    mov         eax,ebx
 005AE7A0    pop         edi
 005AE7A1    pop         esi
 005AE7A2    pop         ebx
 005AE7A3    pop         ecx
 005AE7A4    pop         ebp
 005AE7A5    ret         4
*}
end;

//005AE7A8
destructor TIdBuffer.Destroy();
begin
{*
 005AE7A8    push        ebx
 005AE7A9    push        esi
 005AE7AA    call        @BeforeDestruction
 005AE7AF    mov         ebx,edx
 005AE7B1    mov         esi,eax
 005AE7B3    mov         eax,esi
 005AE7B5    call        TIdBuffer.Clear
 005AE7BA    mov         edx,ebx
 005AE7BC    and         dl,0FC
 005AE7BF    mov         eax,esi
 005AE7C1    call        TObject.Destroy
 005AE7C6    mov         eax,[005A7FAC];TIdStack
 005AE7CB    call        TIdStack.DecUsage
 005AE7D0    test        bl,bl
>005AE7D2    jle         005AE7DB
 005AE7D4    mov         eax,esi
 005AE7D6    call        @ClassDestroy
 005AE7DB    pop         esi
 005AE7DC    pop         ebx
 005AE7DD    ret
*}
end;

//005AE7E0
function TIdBuffer.Extract(AByteCount:Integer; AByteEncoding:TEncoding):string;
begin
{*
 005AE7E0    push        ebp
 005AE7E1    mov         ebp,esp
 005AE7E3    push        ebx
 005AE7E4    push        esi
 005AE7E5    push        edi
 005AE7E6    mov         edi,ecx
 005AE7E8    mov         esi,edx
 005AE7EA    mov         ebx,eax
 005AE7EC    mov         eax,dword ptr [ebp+8]
 005AE7EF    push        eax
 005AE7F0    mov         ecx,edi
 005AE7F2    mov         edx,esi
 005AE7F4    mov         eax,ebx
 005AE7F6    call        TIdBuffer.ExtractToString
 005AE7FB    pop         edi
 005AE7FC    pop         esi
 005AE7FD    pop         ebx
 005AE7FE    pop         ebp
 005AE7FF    ret         4
*}
end;

//005AE804
function TIdBuffer.ExtractToString(AByteCount:Integer; AByteEncoding:TEncoding):string;
begin
{*
 005AE804    push        ebp
 005AE805    mov         ebp,esp
 005AE807    add         esp,0FFFFFFF8
 005AE80A    push        ebx
 005AE80B    push        esi
 005AE80C    push        edi
 005AE80D    xor         ebx,ebx
 005AE80F    mov         dword ptr [ebp-4],ebx
 005AE812    mov         dword ptr [ebp-8],ecx
 005AE815    mov         ebx,edx
 005AE817    mov         esi,eax
 005AE819    mov         edi,dword ptr [ebp+8]
 005AE81C    xor         eax,eax
 005AE81E    push        ebp
 005AE81F    push        5AE88D
 005AE824    push        dword ptr fs:[eax]
 005AE827    mov         dword ptr fs:[eax],esp
 005AE82A    test        ebx,ebx
>005AE82C    jge         005AE831
 005AE82E    mov         ebx,dword ptr [esi+20]
 005AE831    test        ebx,ebx
>005AE833    jle         005AE86A
 005AE835    cmp         dword ptr [ebp-8],0
>005AE839    jne         005AE84B
 005AE83B    mov         eax,dword ptr [esi+8]
 005AE83E    mov         dword ptr [ebp-8],eax
 005AE841    lea         eax,[ebp-8]
 005AE844    mov         dl,1
 005AE846    call        EnsureEncoding
 005AE84B    push        1
 005AE84D    push        0FF
 005AE84F    lea         edx,[ebp-4]
 005AE852    mov         ecx,ebx
 005AE854    mov         eax,esi
 005AE856    call        TIdBuffer.ExtractToBytes
 005AE85B    mov         ecx,edi
 005AE85D    mov         edx,dword ptr [ebp-8]
 005AE860    mov         eax,dword ptr [ebp-4]
 005AE863    call        BytesToString
>005AE868    jmp         005AE871
 005AE86A    mov         eax,edi
 005AE86C    call        @UStrClr
 005AE871    xor         eax,eax
 005AE873    pop         edx
 005AE874    pop         ecx
 005AE875    pop         ecx
 005AE876    mov         dword ptr fs:[eax],edx
 005AE879    push        5AE894
 005AE87E    lea         eax,[ebp-4]
 005AE881    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AE887    call        @DynArrayClear
 005AE88C    ret
>005AE88D    jmp         @HandleFinally
>005AE892    jmp         005AE87E
 005AE894    pop         edi
 005AE895    pop         esi
 005AE896    pop         ebx
 005AE897    pop         ecx
 005AE898    pop         ecx
 005AE899    pop         ebp
 005AE89A    ret         4
*}
end;

//005AE8A0
procedure TIdBuffer.ExtractToBytes(var VBytes:TIdBytes; AByteCount:Integer; AAppend:Boolean; AIndex:Integer);
begin
{*
 005AE8A0    push        ebp
 005AE8A1    mov         ebp,esp
 005AE8A3    add         esp,0FFFFFFF8
 005AE8A6    push        ebx
 005AE8A7    push        esi
 005AE8A8    push        edi
 005AE8A9    mov         dword ptr [ebp-8],ecx
 005AE8AC    mov         dword ptr [ebp-4],edx
 005AE8AF    mov         ebx,eax
 005AE8B1    mov         esi,dword ptr [ebp+8]
 005AE8B4    cmp         dword ptr [ebp-8],0
>005AE8B8    jge         005AE8C0
 005AE8BA    mov         eax,dword ptr [ebx+20]
 005AE8BD    mov         dword ptr [ebp-8],eax
 005AE8C0    xor         edx,edx
 005AE8C2    mov         eax,esi
 005AE8C4    call        IndyMax
 005AE8C9    cmp         dword ptr [ebp-8],0
>005AE8CD    jle         005AE96F
 005AE8D3    lea         edx,[ebp-8]
 005AE8D6    mov         ecx,eax
 005AE8D8    mov         eax,ebx
 005AE8DA    call        TIdBuffer.CheckByteCount
 005AE8DF    cmp         byte ptr [ebp+0C],0
>005AE8E3    je          005AE90F
 005AE8E5    mov         eax,dword ptr [ebp-4]
 005AE8E8    mov         eax,dword ptr [eax]
 005AE8EA    call        @DynArrayLength
 005AE8EF    mov         edi,eax
 005AE8F1    mov         eax,dword ptr [ebp-8]
 005AE8F4    add         eax,edi
 005AE8F6    push        eax
 005AE8F7    mov         eax,dword ptr [ebp-4]
 005AE8FA    mov         ecx,1
 005AE8FF    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AE905    call        @DynArraySetLength
 005AE90A    add         esp,4
>005AE90D    jmp         005AE93A
 005AE90F    xor         edi,edi
 005AE911    mov         eax,dword ptr [ebp-4]
 005AE914    mov         eax,dword ptr [eax]
 005AE916    call        @DynArrayLength
 005AE91B    cmp         eax,dword ptr [ebp-8]
>005AE91E    jge         005AE93A
 005AE920    mov         eax,dword ptr [ebp-8]
 005AE923    push        eax
 005AE924    mov         eax,dword ptr [ebp-4]
 005AE927    mov         ecx,1
 005AE92C    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AE932    call        @DynArraySetLength
 005AE937    add         esp,4
 005AE93A    test        esi,esi
>005AE93C    jge         005AE95D
 005AE93E    push        edi
 005AE93F    mov         eax,dword ptr [ebp-8]
 005AE942    push        eax
 005AE943    mov         ecx,dword ptr [ebp-4]
 005AE946    mov         edx,dword ptr [ebx+10]
 005AE949    mov         eax,dword ptr [ebx+4]
 005AE94C    call        CopyTIdBytes
 005AE951    mov         edx,dword ptr [ebp-8]
 005AE954    mov         eax,ebx
 005AE956    call        TIdBuffer.Remove
>005AE95B    jmp         005AE96F
 005AE95D    push        edi
 005AE95E    mov         eax,dword ptr [ebp-8]
 005AE961    push        eax
 005AE962    mov         ecx,dword ptr [ebp-4]
 005AE965    mov         edx,esi
 005AE967    mov         eax,dword ptr [ebx+4]
 005AE96A    call        CopyTIdBytes
 005AE96F    pop         edi
 005AE970    pop         esi
 005AE971    pop         ebx
 005AE972    pop         ecx
 005AE973    pop         ecx
 005AE974    pop         ebp
 005AE975    ret         8
*}
end;

//005AE978
procedure TIdBuffer.ExtractToIdBuffer(ABuffer:TIdBuffer; AByteCount:Integer; AIndex:Integer);
begin
{*
 005AE978    push        ebp
 005AE979    mov         ebp,esp
 005AE97B    push        0
 005AE97D    push        ebx
 005AE97E    mov         ebx,edx
 005AE980    xor         edx,edx
 005AE982    push        ebp
 005AE983    push        5AE9CC
 005AE988    push        dword ptr fs:[edx]
 005AE98B    mov         dword ptr fs:[edx],esp
 005AE98E    test        ecx,ecx
>005AE990    jge         005AE995
 005AE992    mov         ecx,dword ptr [eax+20]
 005AE995    push        1
 005AE997    mov         edx,dword ptr [ebp+8]
 005AE99A    push        edx
 005AE99B    lea         edx,[ebp-4]
 005AE99E    call        TIdBuffer.ExtractToBytes
 005AE9A3    or          ecx,0FFFFFFFF
 005AE9A6    mov         edx,dword ptr [ebp-4]
 005AE9A9    mov         eax,ebx
 005AE9AB    call        TIdBuffer.Write
 005AE9B0    xor         eax,eax
 005AE9B2    pop         edx
 005AE9B3    pop         ecx
 005AE9B4    pop         ecx
 005AE9B5    mov         dword ptr fs:[eax],edx
 005AE9B8    push        5AE9D3
 005AE9BD    lea         eax,[ebp-4]
 005AE9C0    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AE9C6    call        @DynArrayClear
 005AE9CB    ret
>005AE9CC    jmp         @HandleFinally
>005AE9D1    jmp         005AE9BD
 005AE9D3    pop         ebx
 005AE9D4    pop         ecx
 005AE9D5    pop         ebp
 005AE9D6    ret         4
*}
end;

//005AE9DC
procedure TIdBuffer.ExtractToStream(AStream:TStream; AByteCount:Integer; AIndex:Integer);
begin
{*
 005AE9DC    push        ebp
 005AE9DD    mov         ebp,esp
 005AE9DF    add         esp,0FFFFFFF4
 005AE9E2    push        ebx
 005AE9E3    push        esi
 005AE9E4    push        edi
 005AE9E5    xor         ebx,ebx
 005AE9E7    mov         dword ptr [ebp-4],ebx
 005AE9EA    mov         dword ptr [ebp-0C],ecx
 005AE9ED    mov         dword ptr [ebp-8],edx
 005AE9F0    mov         ebx,eax
 005AE9F2    mov         esi,dword ptr [ebp+8]
 005AE9F5    xor         eax,eax
 005AE9F7    push        ebp
 005AE9F8    push        5AEAC0
 005AE9FD    push        dword ptr fs:[eax]
 005AEA00    mov         dword ptr fs:[eax],esp
 005AEA03    cmp         dword ptr [ebp-0C],0
>005AEA07    jge         005AEA0F
 005AEA09    mov         eax,dword ptr [ebx+20]
 005AEA0C    mov         dword ptr [ebp-0C],eax
 005AEA0F    xor         edx,edx
 005AEA11    mov         eax,esi
 005AEA13    call        IndyMax
 005AEA18    mov         edi,eax
 005AEA1A    test        esi,esi
>005AEA1C    jge         005AEA55
 005AEA1E    mov         dl,1
 005AEA20    mov         eax,ebx
 005AEA22    call        TIdBuffer.CompactHead
 005AEA27    lea         edx,[ebp-0C]
 005AEA2A    mov         ecx,edi
 005AEA2C    mov         eax,ebx
 005AEA2E    call        TIdBuffer.CheckByteCount
 005AEA33    mov         eax,dword ptr [ebp-0C]
 005AEA36    push        eax
 005AEA37    push        0
 005AEA39    mov         ecx,dword ptr [ebx+4]
 005AEA3C    mov         edx,dword ptr [ebp-8]
 005AEA3F    mov         eax,[00596BE0];TIdStreamHelperVCL
 005AEA44    call        TIdStreamHelperVCL.Write
 005AEA49    mov         edx,dword ptr [ebp-0C]
 005AEA4C    mov         eax,ebx
 005AEA4E    call        TIdBuffer.Remove
>005AEA53    jmp         005AEAA4
 005AEA55    lea         edx,[ebp-0C]
 005AEA58    mov         ecx,edi
 005AEA5A    mov         eax,ebx
 005AEA5C    call        TIdBuffer.CheckByteCount
 005AEA61    mov         eax,dword ptr [ebp-0C]
 005AEA64    push        eax
 005AEA65    lea         eax,[ebp-4]
 005AEA68    mov         ecx,1
 005AEA6D    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AEA73    call        @DynArraySetLength
 005AEA78    add         esp,4
 005AEA7B    push        0
 005AEA7D    mov         eax,dword ptr [ebp-0C]
 005AEA80    push        eax
 005AEA81    lea         ecx,[ebp-4]
 005AEA84    mov         edx,esi
 005AEA86    mov         eax,dword ptr [ebx+4]
 005AEA89    call        CopyTIdBytes
 005AEA8E    mov         eax,dword ptr [ebp-0C]
 005AEA91    push        eax
 005AEA92    push        0
 005AEA94    mov         ecx,dword ptr [ebp-4]
 005AEA97    mov         edx,dword ptr [ebp-8]
 005AEA9A    mov         eax,[00596BE0];TIdStreamHelperVCL
 005AEA9F    call        TIdStreamHelperVCL.Write
 005AEAA4    xor         eax,eax
 005AEAA6    pop         edx
 005AEAA7    pop         ecx
 005AEAA8    pop         ecx
 005AEAA9    mov         dword ptr fs:[eax],edx
 005AEAAC    push        5AEAC7
 005AEAB1    lea         eax,[ebp-4]
 005AEAB4    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AEABA    call        @DynArrayClear
 005AEABF    ret
>005AEAC0    jmp         @HandleFinally
>005AEAC5    jmp         005AEAB1
 005AEAC7    pop         edi
 005AEAC8    pop         esi
 005AEAC9    pop         ebx
 005AEACA    mov         esp,ebp
 005AEACC    pop         ebp
 005AEACD    ret         4
*}
end;

//005AEAD0
procedure TIdBuffer.Remove(AByteCount:Integer);
begin
{*
 005AEAD0    push        ebx
 005AEAD1    push        esi
 005AEAD2    mov         esi,edx
 005AEAD4    mov         ebx,eax
 005AEAD6    cmp         esi,dword ptr [ebx+20]
>005AEAD9    jl          005AEAE4
 005AEADB    mov         eax,ebx
 005AEADD    call        TIdBuffer.Clear
>005AEAE2    jmp         005AEAFB
 005AEAE4    add         dword ptr [ebx+10],esi
 005AEAE7    sub         dword ptr [ebx+20],esi
 005AEAEA    mov         eax,dword ptr [ebx+10]
 005AEAED    cmp         eax,dword ptr [ebx+0C]
>005AEAF0    jle         005AEAFB
 005AEAF2    mov         dl,1
 005AEAF4    mov         eax,ebx
 005AEAF6    call        TIdBuffer.CompactHead
 005AEAFB    cmp         word ptr [ebx+1A],0
>005AEB00    je          005AEB0C
 005AEB02    mov         ecx,esi
 005AEB04    mov         edx,ebx
 005AEB06    mov         eax,dword ptr [ebx+1C]
 005AEB09    call        dword ptr [ebx+18]
 005AEB0C    pop         esi
 005AEB0D    pop         ebx
 005AEB0E    ret
*}
end;

//005AEB10
procedure TIdBuffer.CompactHead(ACanShrink:Boolean);
begin
{*
 005AEB10    push        ebx
 005AEB11    push        esi
 005AEB12    mov         ebx,edx
 005AEB14    mov         esi,eax
 005AEB16    mov         eax,dword ptr [esi+10]
 005AEB19    test        eax,eax
>005AEB1B    jle         005AEB6B
 005AEB1D    push        0
 005AEB1F    mov         edx,dword ptr [esi+20]
 005AEB22    push        edx
 005AEB23    lea         ecx,[esi+4]
 005AEB26    mov         edx,eax
 005AEB28    mov         eax,dword ptr [esi+4]
 005AEB2B    call        CopyTIdBytes
 005AEB30    xor         eax,eax
 005AEB32    mov         dword ptr [esi+10],eax
 005AEB35    test        bl,bl
>005AEB37    je          005AEB6B
 005AEB39    mov         eax,esi
 005AEB3B    call        TIdBuffer.GetCapacity
 005AEB40    sub         eax,dword ptr [esi+20]
 005AEB43    sub         eax,dword ptr [esi+10]
 005AEB46    cmp         eax,dword ptr [esi+0C]
>005AEB49    jle         005AEB6B
 005AEB4B    mov         eax,dword ptr [esi+10]
 005AEB4E    add         eax,dword ptr [esi+20]
 005AEB51    add         eax,dword ptr [esi+0C]
 005AEB54    push        eax
 005AEB55    lea         eax,[esi+4]
 005AEB58    mov         ecx,1
 005AEB5D    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AEB63    call        @DynArraySetLength
 005AEB68    add         esp,4
 005AEB6B    pop         esi
 005AEB6C    pop         ebx
 005AEB6D    ret
*}
end;

//005AEB70
procedure TIdBuffer.Write(const ABytes:TIdBytes; const ADestIndex:Integer);
begin
{*
 005AEB70    push        ebx
 005AEB71    push        esi
 005AEB72    push        edi
 005AEB73    mov         edi,ecx
 005AEB75    mov         esi,edx
 005AEB77    mov         ebx,eax
 005AEB79    push        0
 005AEB7B    push        edi
 005AEB7C    mov         eax,esi
 005AEB7E    call        @DynArrayLength
 005AEB83    mov         ecx,eax
 005AEB85    mov         edx,esi
 005AEB87    mov         eax,ebx
 005AEB89    call        TIdBuffer.Write
 005AEB8E    pop         edi
 005AEB8F    pop         esi
 005AEB90    pop         ebx
 005AEB91    ret
*}
end;

//005AEB94
procedure TIdBuffer.Write(AStream:TStream; AByteCount:Integer);
begin
{*
 005AEB94    push        ebx
 005AEB95    push        esi
 005AEB96    push        edi
 005AEB97    push        ebp
 005AEB98    mov         ebx,ecx
 005AEB9A    mov         edi,edx
 005AEB9C    mov         esi,eax
 005AEB9E    test        ebx,ebx
>005AEBA0    jge         005AEBB5
 005AEBA2    mov         eax,edi
 005AEBA4    mov         edx,dword ptr [eax]
 005AEBA6    call        dword ptr [edx]
 005AEBA8    mov         ebx,eax
 005AEBAA    mov         eax,edi
 005AEBAC    call        TStream.GetPosition
 005AEBB1    sub         ebx,eax
>005AEBB3    jmp         005AEBF4
 005AEBB5    test        ebx,ebx
>005AEBB7    jne         005AEBCE
 005AEBB9    push        0
 005AEBBB    push        0
 005AEBBD    mov         eax,edi
 005AEBBF    call        TStream.SetPosition
 005AEBC4    mov         eax,edi
 005AEBC6    mov         edx,dword ptr [eax]
 005AEBC8    call        dword ptr [edx]
 005AEBCA    mov         ebx,eax
>005AEBCC    jmp         005AEBF4
 005AEBCE    mov         eax,ebx
 005AEBD0    cdq
 005AEBD1    push        edx
 005AEBD2    push        eax
 005AEBD3    mov         eax,edi
 005AEBD5    mov         edx,dword ptr [eax]
 005AEBD7    call        dword ptr [edx]
 005AEBD9    push        edx
 005AEBDA    push        eax
 005AEBDB    mov         eax,edi
 005AEBDD    call        TStream.GetPosition
 005AEBE2    sub         dword ptr [esp],eax
 005AEBE5    sbb         dword ptr [esp+4],edx
 005AEBE9    pop         eax
 005AEBEA    pop         edx
 005AEBEB    push        edx
 005AEBEC    push        eax
 005AEBED    call        IndyMin
 005AEBF2    mov         ebx,eax
 005AEBF4    test        ebx,ebx
>005AEBF6    jle         005AEC3D
 005AEBF8    mov         ebp,dword ptr [esi+20]
 005AEBFB    xor         ecx,ecx
 005AEBFD    mov         edx,ebx
 005AEBFF    mov         eax,esi
 005AEC01    call        TIdBuffer.CheckAdd
 005AEC06    mov         dl,1
 005AEC08    mov         eax,esi
 005AEC0A    call        TIdBuffer.CompactHead
 005AEC0F    lea         eax,[ebx+ebp]
 005AEC12    push        eax
 005AEC13    lea         eax,[esi+4]
 005AEC16    mov         ecx,1
 005AEC1B    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AEC21    call        @DynArraySetLength
 005AEC26    add         esp,4
 005AEC29    push        ebx
 005AEC2A    push        ebp
 005AEC2B    lea         ecx,[esi+4]
 005AEC2E    mov         edx,edi
 005AEC30    mov         eax,[00596BE0];TIdStreamHelperVCL
 005AEC35    call        TIdStreamHelperVCL.ReadBytes
 005AEC3A    add         dword ptr [esi+20],ebx
 005AEC3D    pop         ebp
 005AEC3E    pop         edi
 005AEC3F    pop         esi
 005AEC40    pop         ebx
 005AEC41    ret
*}
end;

//005AEC44
function TIdBuffer.IndexOf(AString:string; AStartPos:Integer; AByteEncoding:TEncoding):Integer;
begin
{*
 005AEC44    push        ebp
 005AEC45    mov         ebp,esp
 005AEC47    add         esp,0FFFFFFF8
 005AEC4A    push        ebx
 005AEC4B    push        esi
 005AEC4C    push        edi
 005AEC4D    xor         ebx,ebx
 005AEC4F    mov         dword ptr [ebp-8],ebx
 005AEC52    mov         dword ptr [ebp-4],ecx
 005AEC55    mov         edi,edx
 005AEC57    mov         ebx,eax
 005AEC59    mov         esi,dword ptr [ebp+8]
 005AEC5C    xor         eax,eax
 005AEC5E    push        ebp
 005AEC5F    push        5AECA8
 005AEC64    push        dword ptr fs:[eax]
 005AEC67    mov         dword ptr fs:[eax],esp
 005AEC6A    test        esi,esi
>005AEC6C    jne         005AEC71
 005AEC6E    mov         esi,dword ptr [ebx+8]
 005AEC71    lea         ecx,[ebp-8]
 005AEC74    mov         edx,esi
 005AEC76    mov         eax,edi
 005AEC78    call        ToBytes
 005AEC7D    mov         edx,dword ptr [ebp-8]
 005AEC80    mov         ecx,dword ptr [ebp-4]
 005AEC83    mov         eax,ebx
 005AEC85    call        TIdBuffer.IndexOf
 005AEC8A    mov         ebx,eax
 005AEC8C    xor         eax,eax
 005AEC8E    pop         edx
 005AEC8F    pop         ecx
 005AEC90    pop         ecx
 005AEC91    mov         dword ptr fs:[eax],edx
 005AEC94    push        5AECAF
 005AEC99    lea         eax,[ebp-8]
 005AEC9C    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AECA2    call        @DynArrayClear
 005AECA7    ret
>005AECA8    jmp         @HandleFinally
>005AECAD    jmp         005AEC99
 005AECAF    mov         eax,ebx
 005AECB1    pop         edi
 005AECB2    pop         esi
 005AECB3    pop         ebx
 005AECB4    pop         ecx
 005AECB5    pop         ecx
 005AECB6    pop         ebp
 005AECB7    ret         4
*}
end;

//005AECBC
procedure TIdBuffer.IndexOf(const ABytes:TIdBytes; AStartPos:Integer);
begin
{*
 005AECBC    push        ebp
 005AECBD    mov         ebp,esp
 005AECBF    add         esp,0FFFFFFDC
 005AECC2    push        ebx
 005AECC3    push        esi
 005AECC4    xor         ebx,ebx
 005AECC6    mov         dword ptr [ebp-24],ebx
 005AECC9    mov         dword ptr [ebp-20],ebx
 005AECCC    mov         ebx,ecx
 005AECCE    mov         dword ptr [ebp-8],edx
 005AECD1    mov         dword ptr [ebp-4],eax
 005AECD4    xor         eax,eax
 005AECD6    push        ebp
 005AECD7    push        5AEDD7
 005AECDC    push        dword ptr fs:[eax]
 005AECDF    mov         dword ptr fs:[eax],esp
 005AECE2    mov         dword ptr [ebp-0C],0FFFFFFFF
 005AECE9    mov         eax,dword ptr [ebp-4]
 005AECEC    cmp         dword ptr [eax+20],0
>005AECF0    jle         005AEDBC
 005AECF6    mov         eax,dword ptr [ebp-8]
 005AECF9    call        @DynArrayLength
 005AECFE    test        eax,eax
>005AED00    jne         005AED1C
 005AED02    lea         edx,[ebp-20]
 005AED05    mov         eax,[0078D814];^SResString700:TResStringRec
 005AED0A    call        LoadResString
 005AED0F    mov         edx,dword ptr [ebp-20]
 005AED12    mov         eax,[005961F8];EIdException
 005AED17    call        EIdException.Toss
 005AED1C    test        ebx,ebx
>005AED1E    jl          005AED28
 005AED20    mov         eax,dword ptr [ebp-4]
 005AED23    cmp         ebx,dword ptr [eax+20]
>005AED26    jl          005AED42
 005AED28    lea         edx,[ebp-24]
 005AED2B    mov         eax,[0078D06C];^SResString701:TResStringRec
 005AED30    call        LoadResString
 005AED35    mov         edx,dword ptr [ebp-24]
 005AED38    mov         eax,[005961F8];EIdException
 005AED3D    call        EIdException.Toss
 005AED42    mov         eax,dword ptr [ebp-8]
 005AED45    call        @DynArrayLength
 005AED4A    mov         dword ptr [ebp-14],eax
 005AED4D    mov         eax,dword ptr [ebp-4]
 005AED50    mov         eax,dword ptr [eax+10]
 005AED53    mov         edx,eax
 005AED55    mov         ecx,dword ptr [ebp-4]
 005AED58    add         edx,dword ptr [ecx+20]
 005AED5B    mov         dword ptr [ebp-10],edx
 005AED5E    mov         ecx,eax
 005AED60    add         ecx,ebx
 005AED62    mov         eax,dword ptr [ebp-10]
 005AED65    sub         eax,dword ptr [ebp-14]
 005AED68    sub         eax,ecx
>005AED6A    jl          005AEDBC
 005AED6C    inc         eax
 005AED6D    mov         dword ptr [ebp-1C],eax
 005AED70    mov         byte ptr [ebp-15],1
 005AED74    mov         edx,dword ptr [ebp-14]
 005AED77    dec         edx
 005AED78    test        edx,edx
>005AED7A    jl          005AEDA3
 005AED7C    inc         edx
 005AED7D    xor         eax,eax
 005AED7F    lea         esi,[eax+ecx]
 005AED82    cmp         esi,dword ptr [ebp-10]
>005AED85    jge         005AEDA3
 005AED87    mov         ebx,dword ptr [ebp-4]
 005AED8A    mov         ebx,dword ptr [ebx+4]
 005AED8D    movzx       ebx,byte ptr [ebx+esi]
 005AED91    mov         esi,dword ptr [ebp-8]
 005AED94    cmp         bl,byte ptr [esi+eax]
>005AED97    je          005AED9F
 005AED99    mov         byte ptr [ebp-15],0
>005AED9D    jmp         005AEDA3
 005AED9F    inc         eax
 005AEDA0    dec         edx
>005AEDA1    jne         005AED7F
 005AEDA3    cmp         byte ptr [ebp-15],0
>005AEDA7    je          005AEDB6
 005AEDA9    mov         eax,dword ptr [ebp-4]
 005AEDAC    mov         edx,ecx
 005AEDAE    sub         edx,dword ptr [eax+10]
 005AEDB1    mov         dword ptr [ebp-0C],edx
>005AEDB4    jmp         005AEDBC
 005AEDB6    inc         ecx
 005AEDB7    dec         dword ptr [ebp-1C]
>005AEDBA    jne         005AED70
 005AEDBC    xor         eax,eax
 005AEDBE    pop         edx
 005AEDBF    pop         ecx
 005AEDC0    pop         ecx
 005AEDC1    mov         dword ptr fs:[eax],edx
 005AEDC4    push        5AEDDE
 005AEDC9    lea         eax,[ebp-24]
 005AEDCC    mov         edx,2
 005AEDD1    call        @UStrArrayClr
 005AEDD6    ret
>005AEDD7    jmp         @HandleFinally
>005AEDDC    jmp         005AEDC9
 005AEDDE    mov         eax,dword ptr [ebp-0C]
 005AEDE1    pop         esi
 005AEDE2    pop         ebx
 005AEDE3    mov         esp,ebp
 005AEDE5    pop         ebp
 005AEDE6    ret
*}
end;

//005AEDE8
function TIdBuffer.IndexOf(AByte:Byte; AStartPos:Integer):Integer;
begin
{*
 005AEDE8    push        ebp
 005AEDE9    mov         ebp,esp
 005AEDEB    add         esp,0FFFFFFF8
 005AEDEE    push        ebx
 005AEDEF    push        esi
 005AEDF0    push        edi
 005AEDF1    xor         ebx,ebx
 005AEDF3    mov         dword ptr [ebp-8],ebx
 005AEDF6    mov         edi,ecx
 005AEDF8    mov         ebx,edx
 005AEDFA    mov         esi,eax
 005AEDFC    xor         eax,eax
 005AEDFE    push        ebp
 005AEDFF    push        5AEE78
 005AEE04    push        dword ptr fs:[eax]
 005AEE07    mov         dword ptr fs:[eax],esp
 005AEE0A    mov         dword ptr [ebp-4],0FFFFFFFF
 005AEE11    cmp         dword ptr [esi+20],0
>005AEE15    jle         005AEE62
 005AEE17    test        edi,edi
>005AEE19    jl          005AEE20
 005AEE1B    cmp         edi,dword ptr [esi+20]
>005AEE1E    jl          005AEE3A
 005AEE20    lea         edx,[ebp-8]
 005AEE23    mov         eax,[0078D06C];^SResString701:TResStringRec
 005AEE28    call        LoadResString
 005AEE2D    mov         edx,dword ptr [ebp-8]
 005AEE30    mov         eax,[005961F8];EIdException
 005AEE35    call        EIdException.Toss
 005AEE3A    mov         eax,dword ptr [esi+10]
 005AEE3D    add         edi,eax
 005AEE3F    mov         edx,eax
 005AEE41    add         edx,dword ptr [esi+20]
 005AEE44    dec         edx
 005AEE45    sub         edx,edi
>005AEE47    jl          005AEE62
 005AEE49    inc         edx
 005AEE4A    mov         eax,edi
 005AEE4C    mov         ecx,dword ptr [esi+4]
 005AEE4F    cmp         bl,byte ptr [ecx+eax]
>005AEE52    jne         005AEE5E
 005AEE54    mov         edx,eax
 005AEE56    sub         edx,dword ptr [esi+10]
 005AEE59    mov         dword ptr [ebp-4],edx
>005AEE5C    jmp         005AEE62
 005AEE5E    inc         eax
 005AEE5F    dec         edx
>005AEE60    jne         005AEE4C
 005AEE62    xor         eax,eax
 005AEE64    pop         edx
 005AEE65    pop         ecx
 005AEE66    pop         ecx
 005AEE67    mov         dword ptr fs:[eax],edx
 005AEE6A    push        5AEE7F
 005AEE6F    lea         eax,[ebp-8]
 005AEE72    call        @UStrClr
 005AEE77    ret
>005AEE78    jmp         @HandleFinally
>005AEE7D    jmp         005AEE6F
 005AEE7F    mov         eax,dword ptr [ebp-4]
 005AEE82    pop         edi
 005AEE83    pop         esi
 005AEE84    pop         ebx
 005AEE85    pop         ecx
 005AEE86    pop         ecx
 005AEE87    pop         ebp
 005AEE88    ret
*}
end;

//005AEE8C
procedure TIdBuffer.Write(AString:string; AByteEncoding:TEncoding; ADestIndex:Integer);
begin
{*
 005AEE8C    push        ebp
 005AEE8D    mov         ebp,esp
 005AEE8F    push        0
 005AEE91    push        ebx
 005AEE92    push        esi
 005AEE93    push        edi
 005AEE94    mov         esi,ecx
 005AEE96    mov         edi,edx
 005AEE98    mov         ebx,eax
 005AEE9A    xor         eax,eax
 005AEE9C    push        ebp
 005AEE9D    push        5AEEE4
 005AEEA2    push        dword ptr fs:[eax]
 005AEEA5    mov         dword ptr fs:[eax],esp
 005AEEA8    test        esi,esi
>005AEEAA    jne         005AEEAF
 005AEEAC    mov         esi,dword ptr [ebx+8]
 005AEEAF    lea         ecx,[ebp-4]
 005AEEB2    mov         edx,esi
 005AEEB4    mov         eax,edi
 005AEEB6    call        ToBytes
 005AEEBB    mov         edx,dword ptr [ebp-4]
 005AEEBE    mov         ecx,dword ptr [ebp+8]
 005AEEC1    mov         eax,ebx
 005AEEC3    call        TIdBuffer.Write
 005AEEC8    xor         eax,eax
 005AEECA    pop         edx
 005AEECB    pop         ecx
 005AEECC    pop         ecx
 005AEECD    mov         dword ptr fs:[eax],edx
 005AEED0    push        5AEEEB
 005AEED5    lea         eax,[ebp-4]
 005AEED8    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AEEDE    call        @DynArrayClear
 005AEEE3    ret
>005AEEE4    jmp         @HandleFinally
>005AEEE9    jmp         005AEED5
 005AEEEB    pop         edi
 005AEEEC    pop         esi
 005AEEED    pop         ebx
 005AEEEE    pop         ecx
 005AEEEF    pop         ebp
 005AEEF0    ret         4
*}
end;

//005AEEF4
function TIdBuffer.GetCapacity:Integer;
begin
{*
 005AEEF4    mov         eax,dword ptr [eax+4]
 005AEEF7    call        @DynArrayLength
 005AEEFC    ret
*}
end;

//005AEF00
procedure TIdBuffer.SetCapacity(AValue:Integer);
begin
{*
 005AEF00    push        ebx
 005AEF01    push        esi
 005AEF02    mov         esi,edx
 005AEF04    mov         ebx,eax
 005AEF06    cmp         esi,dword ptr [ebx+20]
>005AEF09    jge         005AEF1A
 005AEF0B    mov         edx,5AEF4C;'Capacity cannot be smaller than Size'
 005AEF10    mov         eax,[005961F8];EIdException
 005AEF15    call        EIdException.Toss
 005AEF1A    mov         dl,1
 005AEF1C    mov         eax,ebx
 005AEF1E    call        TIdBuffer.CompactHead
 005AEF23    push        esi
 005AEF24    lea         eax,[ebx+4]
 005AEF27    mov         ecx,1
 005AEF2C    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AEF32    call        @DynArraySetLength
 005AEF37    add         esp,4
 005AEF3A    pop         esi
 005AEF3B    pop         ebx
 005AEF3C    ret
*}
end;

//005AEF98
constructor TIdBuffer.Create();
begin
{*
 005AEF98    push        ebx
 005AEF99    push        esi
 005AEF9A    test        dl,dl
>005AEF9C    je          005AEFA6
 005AEF9E    add         esp,0FFFFFFF0
 005AEFA1    call        @ClassCreate
 005AEFA6    mov         ebx,edx
 005AEFA8    mov         esi,eax
 005AEFAA    xor         edx,edx
 005AEFAC    mov         eax,esi
 005AEFAE    call        TObject.Create
 005AEFB3    mov         dword ptr [esi+0C],800
 005AEFBA    mov         eax,esi
 005AEFBC    call        TIdBuffer.Clear
 005AEFC1    mov         eax,[005A7FAC];TIdStack
 005AEFC6    call        TIdStack.IncUsage
 005AEFCB    mov         eax,esi
 005AEFCD    test        bl,bl
>005AEFCF    je          005AEFE0
 005AEFD1    call        @AfterConstruction
 005AEFD6    pop         dword ptr fs:[0]
 005AEFDD    add         esp,0C
 005AEFE0    mov         eax,esi
 005AEFE2    pop         esi
 005AEFE3    pop         ebx
 005AEFE4    ret
*}
end;

//005AEFE8
function TIdBuffer.PeekByte(AIndex:Integer):Byte;
begin
{*
 005AEFE8    push        ebx
 005AEFE9    push        esi
 005AEFEA    mov         esi,edx
 005AEFEC    mov         ebx,eax
 005AEFEE    cmp         dword ptr [ebx+20],0
>005AEFF2    jne         005AF003
 005AEFF4    mov         edx,5AF034;'No bytes in buffer.'
 005AEFF9    mov         eax,[005961F8];EIdException
 005AEFFE    call        EIdException.Toss
 005AF003    test        esi,esi
>005AF005    jl          005AF00C
 005AF007    cmp         esi,dword ptr [ebx+20]
>005AF00A    jl          005AF01B
 005AF00C    mov         edx,5AF068;'Index out of bounds.'
 005AF011    mov         eax,[005961F8];EIdException
 005AF016    call        EIdException.Toss
 005AF01B    add         esi,dword ptr [ebx+10]
 005AF01E    mov         eax,dword ptr [ebx+4]
 005AF021    movzx       eax,byte ptr [eax+esi]
 005AF025    pop         esi
 005AF026    pop         ebx
 005AF027    ret
*}
end;

//005AF094
procedure TIdBuffer.SaveToStream(AStream:TStream);
begin
{*
 005AF094    push        ebx
 005AF095    push        esi
 005AF096    mov         esi,edx
 005AF098    mov         ebx,eax
 005AF09A    xor         edx,edx
 005AF09C    mov         eax,ebx
 005AF09E    call        TIdBuffer.CompactHead
 005AF0A3    mov         eax,dword ptr [ebx+20]
 005AF0A6    push        eax
 005AF0A7    push        0
 005AF0A9    mov         ecx,dword ptr [ebx+4]
 005AF0AC    mov         edx,esi
 005AF0AE    mov         eax,[00596BE0];TIdStreamHelperVCL
 005AF0B3    call        TIdStreamHelperVCL.Write
 005AF0B8    pop         esi
 005AF0B9    pop         ebx
 005AF0BA    ret
*}
end;

//005AF0BC
procedure TIdBuffer.ExtractToIPv6(AIndex:Integer; var VAddress:TIdIPv6Address);
begin
{*
 005AF0BC    push        ebx
 005AF0BD    push        esi
 005AF0BE    push        edi
 005AF0BF    push        ebp
 005AF0C0    add         esp,0FFFFFFF0
 005AF0C3    mov         esi,ecx
 005AF0C5    mov         edi,edx
 005AF0C7    mov         ebx,eax
 005AF0C9    test        edi,edi
>005AF0CB    jge         005AF0D2
 005AF0CD    mov         eax,dword ptr [ebx+10]
>005AF0D0    jmp         005AF0D4
 005AF0D2    mov         eax,edi
 005AF0D4    mov         edx,esi
 005AF0D6    mov         ecx,eax
 005AF0D8    mov         eax,dword ptr [ebx+4]
 005AF0DB    call        BytesToIPv6
 005AF0E0    mov         ecx,esp
 005AF0E2    mov         edx,esi
 005AF0E4    mov         eax,[0078D940];^gvar_00789ED0
 005AF0E9    mov         eax,dword ptr [eax]
 005AF0EB    mov         ebp,dword ptr [eax]
 005AF0ED    call        dword ptr [ebp+60]
 005AF0F0    push        edi
 005AF0F1    mov         edi,esi
 005AF0F3    lea         esi,[esp+4]
 005AF0F7    movs        dword ptr [edi],dword ptr [esi]
 005AF0F8    movs        dword ptr [edi],dword ptr [esi]
 005AF0F9    movs        dword ptr [edi],dword ptr [esi]
 005AF0FA    movs        dword ptr [edi],dword ptr [esi]
 005AF0FB    pop         edi
 005AF0FC    test        edi,edi
>005AF0FE    jge         005AF10C
 005AF100    mov         edx,10
 005AF105    mov         eax,ebx
 005AF107    call        TIdBuffer.Remove
 005AF10C    add         esp,10
 005AF10F    pop         ebp
 005AF110    pop         edi
 005AF111    pop         esi
 005AF112    pop         ebx
 005AF113    ret
*}
end;

//005AF114
function TIdBuffer.ExtractToInt64(AIndex:Integer):Int64;
begin
{*
 005AF114    push        ebx
 005AF115    push        esi
 005AF116    add         esp,0FFFFFFF8
 005AF119    mov         esi,edx
 005AF11B    mov         ebx,eax
 005AF11D    test        esi,esi
>005AF11F    jge         005AF126
 005AF121    mov         eax,dword ptr [ebx+10]
>005AF124    jmp         005AF128
 005AF126    mov         eax,esi
 005AF128    mov         edx,eax
 005AF12A    mov         eax,dword ptr [ebx+4]
 005AF12D    call        BytesToInt64
 005AF132    mov         dword ptr [esp],eax
 005AF135    mov         dword ptr [esp+4],edx
 005AF139    push        dword ptr [esp+4]
 005AF13D    push        dword ptr [esp+4]
 005AF141    mov         eax,[0078D940];^gvar_00789ED0
 005AF146    mov         eax,dword ptr [eax]
 005AF148    mov         edx,dword ptr [eax]
 005AF14A    call        dword ptr [edx+5C]
 005AF14D    mov         dword ptr [esp],eax
 005AF150    mov         dword ptr [esp+4],edx
 005AF154    test        esi,esi
>005AF156    jge         005AF164
 005AF158    mov         edx,8
 005AF15D    mov         eax,ebx
 005AF15F    call        TIdBuffer.Remove
 005AF164    mov         eax,dword ptr [esp]
 005AF167    mov         edx,dword ptr [esp+4]
 005AF16B    pop         ecx
 005AF16C    pop         edx
 005AF16D    pop         esi
 005AF16E    pop         ebx
 005AF16F    ret
*}
end;

//005AF170
function TIdBuffer.ExtractToLongWord(AIndex:Integer):Cardinal;
begin
{*
 005AF170    push        ebx
 005AF171    push        esi
 005AF172    push        edi
 005AF173    mov         edi,edx
 005AF175    mov         ebx,eax
 005AF177    test        edi,edi
>005AF179    jge         005AF180
 005AF17B    mov         eax,dword ptr [ebx+10]
>005AF17E    jmp         005AF182
 005AF180    mov         eax,edi
 005AF182    mov         edx,eax
 005AF184    mov         eax,dword ptr [ebx+4]
 005AF187    call        BytesToLongWord
 005AF18C    mov         esi,eax
 005AF18E    mov         eax,[0078D940];^gvar_00789ED0
 005AF193    mov         eax,dword ptr [eax]
 005AF195    mov         edx,esi
 005AF197    mov         ecx,dword ptr [eax]
 005AF199    call        dword ptr [ecx+58]
 005AF19C    mov         esi,eax
 005AF19E    test        edi,edi
>005AF1A0    jge         005AF1AE
 005AF1A2    mov         edx,4
 005AF1A7    mov         eax,ebx
 005AF1A9    call        TIdBuffer.Remove
 005AF1AE    mov         eax,esi
 005AF1B0    pop         edi
 005AF1B1    pop         esi
 005AF1B2    pop         ebx
 005AF1B3    ret
*}
end;

//005AF1B4
function TIdBuffer.ExtractToWord(AIndex:Integer):Word;
begin
{*
 005AF1B4    push        ebx
 005AF1B5    push        esi
 005AF1B6    push        edi
 005AF1B7    mov         edi,edx
 005AF1B9    mov         ebx,eax
 005AF1BB    test        edi,edi
>005AF1BD    jge         005AF1C4
 005AF1BF    mov         eax,dword ptr [ebx+10]
>005AF1C2    jmp         005AF1C6
 005AF1C4    mov         eax,edi
 005AF1C6    mov         edx,eax
 005AF1C8    mov         eax,dword ptr [ebx+4]
 005AF1CB    call        BytesToWord
 005AF1D0    mov         esi,eax
 005AF1D2    mov         eax,[0078D940];^gvar_00789ED0
 005AF1D7    mov         eax,dword ptr [eax]
 005AF1D9    mov         edx,esi
 005AF1DB    mov         ecx,dword ptr [eax]
 005AF1DD    call        dword ptr [ecx+54]
 005AF1E0    mov         esi,eax
 005AF1E2    test        edi,edi
>005AF1E4    jge         005AF1F2
 005AF1E6    mov         edx,2
 005AF1EB    mov         eax,ebx
 005AF1ED    call        TIdBuffer.Remove
 005AF1F2    mov         eax,esi
 005AF1F4    pop         edi
 005AF1F5    pop         esi
 005AF1F6    pop         ebx
 005AF1F7    ret
*}
end;

//005AF1F8
function TIdBuffer.ExtractToByte(AIndex:Integer):Byte;
begin
{*
 005AF1F8    push        ebx
 005AF1F9    test        edx,edx
>005AF1FB    jge         005AF202
 005AF1FD    mov         ecx,dword ptr [eax+10]
>005AF200    jmp         005AF204
 005AF202    mov         ecx,edx
 005AF204    mov         ebx,dword ptr [eax+4]
 005AF207    movzx       ebx,byte ptr [ebx+ecx]
 005AF20B    test        edx,edx
>005AF20D    jge         005AF219
 005AF20F    mov         edx,1
 005AF214    call        TIdBuffer.Remove
 005AF219    mov         eax,ebx
 005AF21B    pop         ebx
 005AF21C    ret
*}
end;

//005AF220
procedure TIdBuffer.Write(AValue:Word; ADestIndex:Integer);
begin
{*
 005AF220    push        ebx
 005AF221    push        esi
 005AF222    push        edi
 005AF223    mov         edi,edx
 005AF225    mov         ebx,eax
 005AF227    test        ecx,ecx
>005AF229    jge         005AF24D
 005AF22B    mov         esi,dword ptr [ebx+10];TIdBuffer.FHeadIndex:Integer
 005AF22E    add         esi,dword ptr [ebx+20];TIdBuffer.FSize:Integer
 005AF231    lea         eax,[esi+2]
 005AF234    push        eax
 005AF235    lea         eax,[ebx+4];TIdBuffer.FBytes:?
 005AF238    mov         ecx,1
 005AF23D    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AF243    call        @DynArraySetLength
 005AF248    add         esp,4
>005AF24B    jmp         005AF24F
 005AF24D    mov         esi,ecx
 005AF24F    mov         eax,[0078D940];^gvar_00789ED0
 005AF254    mov         eax,dword ptr [eax]
 005AF256    mov         edx,edi
 005AF258    mov         ecx,dword ptr [eax]
 005AF25A    call        dword ptr [ecx+2C]
 005AF25D    lea         edx,[ebx+4];TIdBuffer.FBytes:?
 005AF260    mov         ecx,esi
 005AF262    call        CopyTIdShort
 005AF267    cmp         esi,dword ptr [ebx+20];TIdBuffer.FSize:Integer
>005AF26A    jl          005AF272
 005AF26C    add         esi,2
 005AF26F    mov         dword ptr [ebx+20],esi;TIdBuffer.FSize:Integer
 005AF272    pop         edi
 005AF273    pop         esi
 005AF274    pop         ebx
 005AF275    ret
*}
end;

//005AF278
procedure TIdBuffer.Write(AValue:Byte; ADestIndex:Integer);
begin
{*
 005AF278    push        ebx
 005AF279    push        esi
 005AF27A    push        edi
 005AF27B    mov         ebx,edx
 005AF27D    mov         edi,eax
 005AF27F    test        ecx,ecx
>005AF281    jge         005AF2A5
 005AF283    mov         esi,dword ptr [edi+10]
 005AF286    add         esi,dword ptr [edi+20]
 005AF289    lea         eax,[esi+1]
 005AF28C    push        eax
 005AF28D    lea         eax,[edi+4]
 005AF290    mov         ecx,1
 005AF295    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AF29B    call        @DynArraySetLength
 005AF2A0    add         esp,4
>005AF2A3    jmp         005AF2A7
 005AF2A5    mov         esi,ecx
 005AF2A7    mov         eax,dword ptr [edi+4]
 005AF2AA    mov         byte ptr [eax+esi],bl
 005AF2AD    cmp         esi,dword ptr [edi+20]
>005AF2B0    jl          005AF2B6
 005AF2B2    inc         esi
 005AF2B3    mov         dword ptr [edi+20],esi
 005AF2B6    pop         edi
 005AF2B7    pop         esi
 005AF2B8    pop         ebx
 005AF2B9    ret
*}
end;

//005AF2BC
procedure TIdBuffer.Write(AValue:TIdIPv6Address; ADestIndex:Integer);
begin
{*
 005AF2BC    push        ebx
 005AF2BD    push        esi
 005AF2BE    push        edi
 005AF2BF    add         esp,0FFFFFFEC
 005AF2C2    mov         dword ptr [esp],edx
 005AF2C5    mov         ebx,eax
 005AF2C7    test        ecx,ecx
>005AF2C9    jge         005AF2ED
 005AF2CB    mov         esi,dword ptr [ebx+10]
 005AF2CE    add         esi,dword ptr [ebx+20]
 005AF2D1    lea         eax,[esi+10]
 005AF2D4    push        eax
 005AF2D5    lea         eax,[ebx+4]
 005AF2D8    mov         ecx,1
 005AF2DD    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AF2E3    call        @DynArraySetLength
 005AF2E8    add         esp,4
>005AF2EB    jmp         005AF2EF
 005AF2ED    mov         esi,ecx
 005AF2EF    lea         ecx,[esp+4]
 005AF2F3    mov         edx,dword ptr [esp]
 005AF2F6    mov         eax,[0078D940];^gvar_00789ED0
 005AF2FB    mov         eax,dword ptr [eax]
 005AF2FD    mov         edi,dword ptr [eax]
 005AF2FF    call        dword ptr [edi+38]
 005AF302    lea         edx,[ebx+4]
 005AF305    lea         eax,[esp+4]
 005AF309    mov         ecx,esi
 005AF30B    call        CopyTIdIPV6Address
 005AF310    cmp         esi,dword ptr [ebx+20]
>005AF313    jl          005AF31B
 005AF315    add         esi,10
 005AF318    mov         dword ptr [ebx+20],esi
 005AF31B    add         esp,14
 005AF31E    pop         edi
 005AF31F    pop         esi
 005AF320    pop         ebx
 005AF321    ret
*}
end;

//005AF324
procedure TIdBuffer.Write(ADestIndex:Integer; AValue:Int64);
begin
{*
 005AF324    push        ebp
 005AF325    mov         ebp,esp
 005AF327    add         esp,0FFFFFFF0
 005AF32A    push        ebx
 005AF32B    push        esi
 005AF32C    push        edi
 005AF32D    mov         dword ptr [ebp-4],edx
 005AF330    mov         esi,eax
 005AF332    mov         edi,8
 005AF337    cmp         dword ptr [ebp-4],0
>005AF33B    jge         005AF35F
 005AF33D    mov         ebx,dword ptr [esi+10]
 005AF340    add         ebx,dword ptr [esi+20]
 005AF343    lea         eax,[edi+ebx]
 005AF346    push        eax
 005AF347    lea         eax,[esi+4]
 005AF34A    mov         ecx,1
 005AF34F    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AF355    call        @DynArraySetLength
 005AF35A    add         esp,4
>005AF35D    jmp         005AF362
 005AF35F    mov         ebx,dword ptr [ebp-4]
 005AF362    push        dword ptr [ebp+0C]
 005AF365    push        dword ptr [ebp+8]
 005AF368    mov         eax,[0078D940];^gvar_00789ED0
 005AF36D    mov         eax,dword ptr [eax]
 005AF36F    mov         edx,dword ptr [eax]
 005AF371    call        dword ptr [edx+34]
 005AF374    mov         dword ptr [ebp-10],eax
 005AF377    mov         dword ptr [ebp-0C],edx
 005AF37A    push        dword ptr [ebp-0C]
 005AF37D    push        dword ptr [ebp-10]
 005AF380    lea         eax,[esi+4]
 005AF383    mov         edx,ebx
 005AF385    call        CopyTIdInt64
 005AF38A    cmp         ebx,dword ptr [esi+20]
>005AF38D    jl          005AF394
 005AF38F    add         edi,ebx
 005AF391    mov         dword ptr [esi+20],edi
 005AF394    pop         edi
 005AF395    pop         esi
 005AF396    pop         ebx
 005AF397    mov         esp,ebp
 005AF399    pop         ebp
 005AF39A    ret         8
*}
end;

//005AF3A0
procedure TIdBuffer.Write(AValue:Cardinal; ADestIndex:Integer);
begin
{*
 005AF3A0    push        ebx
 005AF3A1    push        esi
 005AF3A2    push        edi
 005AF3A3    mov         edi,edx
 005AF3A5    mov         esi,eax
 005AF3A7    test        ecx,ecx
>005AF3A9    jge         005AF3CD
 005AF3AB    mov         ebx,dword ptr [esi+10]
 005AF3AE    add         ebx,dword ptr [esi+20]
 005AF3B1    lea         eax,[ebx+4]
 005AF3B4    push        eax
 005AF3B5    lea         eax,[esi+4]
 005AF3B8    mov         ecx,1
 005AF3BD    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AF3C3    call        @DynArraySetLength
 005AF3C8    add         esp,4
>005AF3CB    jmp         005AF3CF
 005AF3CD    mov         ebx,ecx
 005AF3CF    mov         eax,[0078D940];^gvar_00789ED0
 005AF3D4    mov         eax,dword ptr [eax]
 005AF3D6    mov         edx,edi
 005AF3D8    mov         ecx,dword ptr [eax]
 005AF3DA    call        dword ptr [ecx+30]
 005AF3DD    lea         edx,[esi+4]
 005AF3E0    mov         ecx,ebx
 005AF3E2    call        CopyTIdLongWord
 005AF3E7    cmp         ebx,dword ptr [esi+20]
>005AF3EA    jl          005AF3F2
 005AF3EC    add         ebx,4
 005AF3EF    mov         dword ptr [esi+20],ebx
 005AF3F2    pop         edi
 005AF3F3    pop         esi
 005AF3F4    pop         ebx
 005AF3F5    ret
*}
end;

//005AF3F8
procedure TIdBuffer.Write(const ABytes:TIdBytes; const ALength:Integer; const AOffset:Integer; const ADestIndex:Integer);
begin
{*
 005AF3F8    push        ebp
 005AF3F9    mov         ebp,esp
 005AF3FB    add         esp,0FFFFFFF8
 005AF3FE    push        ebx
 005AF3FF    push        esi
 005AF400    push        edi
 005AF401    xor         ebx,ebx
 005AF403    mov         dword ptr [ebp-8],ebx
 005AF406    mov         dword ptr [ebp-4],edx
 005AF409    mov         ebx,eax
 005AF40B    xor         eax,eax
 005AF40D    push        ebp
 005AF40E    push        5AF545
 005AF413    push        dword ptr fs:[eax]
 005AF416    mov         dword ptr fs:[eax],esp
 005AF419    mov         edx,ecx
 005AF41B    mov         eax,dword ptr [ebp-4]
 005AF41E    mov         ecx,dword ptr [ebp+0C]
 005AF421    call        IndyLength
 005AF426    mov         esi,eax
 005AF428    test        esi,esi
>005AF42A    je          005AF529
 005AF430    xor         edx,edx
 005AF432    mov         eax,dword ptr [ebp+8]
 005AF435    call        IndyMax
 005AF43A    mov         edi,eax
 005AF43C    mov         ecx,edi
 005AF43E    mov         edx,esi
 005AF440    mov         eax,ebx
 005AF442    call        TIdBuffer.CheckAdd
 005AF447    cmp         dword ptr [ebx+20],0
>005AF44B    jne         005AF4B6
 005AF44D    xor         eax,eax
 005AF44F    mov         dword ptr [ebx+10],eax
 005AF452    cmp         dword ptr [ebp+8],0
>005AF456    jge         005AF482
 005AF458    lea         eax,[ebp-8]
 005AF45B    push        eax
 005AF45C    mov         ecx,dword ptr [ebp+0C]
 005AF45F    mov         edx,esi
 005AF461    mov         eax,dword ptr [ebp-4]
 005AF464    call        ToBytes
 005AF469    mov         edx,dword ptr [ebp-8]
 005AF46C    lea         eax,[ebx+4]
 005AF46F    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 005AF475    call        @DynArrayAsg
 005AF47A    mov         dword ptr [ebx+20],esi
>005AF47D    jmp         005AF529
 005AF482    mov         edi,dword ptr [ebp+8]
 005AF485    add         edi,esi
 005AF487    mov         dword ptr [ebx+20],edi
 005AF48A    push        edi
 005AF48B    lea         eax,[ebx+4]
 005AF48E    mov         ecx,1
 005AF493    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AF499    call        @DynArraySetLength
 005AF49E    add         esp,4
 005AF4A1    mov         eax,dword ptr [ebp+8]
 005AF4A4    push        eax
 005AF4A5    push        esi
 005AF4A6    lea         ecx,[ebx+4]
 005AF4A9    mov         edx,dword ptr [ebp+0C]
 005AF4AC    mov         eax,dword ptr [ebp-4]
 005AF4AF    call        CopyTIdBytes
>005AF4B4    jmp         005AF529
 005AF4B6    cmp         dword ptr [ebp+8],0
>005AF4BA    jge         005AF50F
 005AF4BC    xor         edx,edx
 005AF4BE    mov         eax,ebx
 005AF4C0    call        TIdBuffer.CompactHead
 005AF4C5    mov         eax,ebx
 005AF4C7    call        TIdBuffer.GetCapacity
 005AF4CC    mov         edi,dword ptr [ebx+20]
 005AF4CF    sub         eax,edi
 005AF4D1    sub         eax,dword ptr [ebx+10]
 005AF4D4    cmp         esi,eax
>005AF4D6    jle         005AF4F4
 005AF4D8    add         edi,esi
 005AF4DA    add         edi,dword ptr [ebx+0C]
 005AF4DD    push        edi
 005AF4DE    lea         eax,[ebx+4]
 005AF4E1    mov         ecx,1
 005AF4E6    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AF4EC    call        @DynArraySetLength
 005AF4F1    add         esp,4
 005AF4F4    mov         eax,dword ptr [ebx+10]
 005AF4F7    add         eax,dword ptr [ebx+20]
 005AF4FA    push        eax
 005AF4FB    push        esi
 005AF4FC    lea         ecx,[ebx+4]
 005AF4FF    mov         edx,dword ptr [ebp+0C]
 005AF502    mov         eax,dword ptr [ebp-4]
 005AF505    call        CopyTIdBytes
 005AF50A    add         dword ptr [ebx+20],esi
>005AF50D    jmp         005AF529
 005AF50F    push        edi
 005AF510    push        esi
 005AF511    lea         ecx,[ebx+4]
 005AF514    mov         edx,dword ptr [ebp+0C]
 005AF517    mov         eax,dword ptr [ebp-4]
 005AF51A    call        CopyTIdBytes
 005AF51F    cmp         edi,dword ptr [ebx+20]
>005AF522    jl          005AF529
 005AF524    add         esi,edi
 005AF526    mov         dword ptr [ebx+20],esi
 005AF529    xor         eax,eax
 005AF52B    pop         edx
 005AF52C    pop         ecx
 005AF52D    pop         ecx
 005AF52E    mov         dword ptr fs:[eax],edx
 005AF531    push        5AF54C
 005AF536    lea         eax,[ebp-8]
 005AF539    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005AF53F    call        @DynArrayClear
 005AF544    ret
>005AF545    jmp         @HandleFinally
>005AF54A    jmp         005AF536
 005AF54C    pop         edi
 005AF54D    pop         esi
 005AF54E    pop         ebx
 005AF54F    pop         ecx
 005AF550    pop         ecx
 005AF551    pop         ebp
 005AF552    ret         8
*}
end;

//005AF558
function TIdBuffer.GetAsString:UnicodeString;
begin
{*
 005AF558    push        ebx
 005AF559    push        esi
 005AF55A    mov         esi,edx
 005AF55C    mov         ebx,eax
 005AF55E    mov         ecx,esi
 005AF560    mov         edx,dword ptr [ebx+8]
 005AF563    mov         eax,dword ptr [ebx+4]
 005AF566    call        BytesToString
 005AF56B    pop         esi
 005AF56C    pop         ebx
 005AF56D    ret
*}
end;

//005B1200
procedure TIdConnectionIntercept.Disconnect;
begin
{*
 005B1200    push        ebx
 005B1201    mov         ebx,eax
 005B1203    mov         eax,dword ptr [ebx+38]
 005B1206    test        eax,eax
>005B1208    je          005B120F
 005B120A    mov         edx,dword ptr [eax]
 005B120C    call        dword ptr [edx+3C]
 005B120F    cmp         word ptr [ebx+52],0
>005B1214    je          005B121E
 005B1216    mov         edx,ebx
 005B1218    mov         eax,dword ptr [ebx+54]
 005B121B    call        dword ptr [ebx+50]
 005B121E    xor         eax,eax
 005B1220    mov         dword ptr [ebx+34],eax
 005B1223    pop         ebx
 005B1224    ret
*}
end;

//005B1228
procedure TIdConnectionIntercept.Connect(AConnection:TComponent);
begin
{*
 005B1228    push        ebx
 005B1229    push        esi
 005B122A    mov         esi,edx
 005B122C    mov         ebx,eax
 005B122E    mov         dword ptr [ebx+34],esi
 005B1231    cmp         word ptr [ebx+4A],0
>005B1236    je          005B1240
 005B1238    mov         edx,ebx
 005B123A    mov         eax,dword ptr [ebx+4C]
 005B123D    call        dword ptr [ebx+48]
 005B1240    mov         eax,dword ptr [ebx+38]
 005B1243    test        eax,eax
>005B1245    je          005B124E
 005B1247    mov         edx,esi
 005B1249    mov         ecx,dword ptr [eax]
 005B124B    call        dword ptr [ecx+38]
 005B124E    pop         esi
 005B124F    pop         ebx
 005B1250    ret
*}
end;

//005B1254
procedure TIdConnectionIntercept.Receive(var VBuffer:TIdBytes);
begin
{*
 005B1254    push        ebx
 005B1255    push        esi
 005B1256    mov         esi,edx
 005B1258    mov         ebx,eax
 005B125A    mov         eax,dword ptr [ebx+38]
 005B125D    test        eax,eax
>005B125F    je          005B1268
 005B1261    mov         edx,esi
 005B1263    mov         ecx,dword ptr [eax]
 005B1265    call        dword ptr [ecx+40]
 005B1268    cmp         word ptr [ebx+5A],0
>005B126D    je          005B1279
 005B126F    mov         ecx,esi
 005B1271    mov         edx,ebx
 005B1273    mov         eax,dword ptr [ebx+5C]
 005B1276    call        dword ptr [ebx+58]
 005B1279    pop         esi
 005B127A    pop         ebx
 005B127B    ret
*}
end;

//005B127C
procedure TIdConnectionIntercept.Send(var VBuffer:TIdBytes);
begin
{*
 005B127C    push        ebx
 005B127D    push        esi
 005B127E    mov         esi,edx
 005B1280    mov         ebx,eax
 005B1282    cmp         word ptr [ebx+62],0
>005B1287    je          005B1293
 005B1289    mov         ecx,esi
 005B128B    mov         edx,ebx
 005B128D    mov         eax,dword ptr [ebx+64]
 005B1290    call        dword ptr [ebx+60]
 005B1293    mov         eax,dword ptr [ebx+38]
 005B1296    test        eax,eax
>005B1298    je          005B12A1
 005B129A    mov         edx,esi
 005B129C    mov         ecx,dword ptr [eax]
 005B129E    call        dword ptr [ecx+44]
 005B12A1    pop         esi
 005B12A2    pop         ebx
 005B12A3    ret
*}
end;

//005B12A4
procedure TIdConnectionIntercept.SetIntercept(AValue:TIdConnectionIntercept);
begin
{*
 005B12A4    push        ebp
 005B12A5    mov         ebp,esp
 005B12A7    add         esp,0FFFFFFEC
 005B12AA    push        ebx
 005B12AB    push        esi
 005B12AC    xor         ecx,ecx
 005B12AE    mov         dword ptr [ebp-10],ecx
 005B12B1    mov         dword ptr [ebp-14],ecx
 005B12B4    mov         dword ptr [ebp-4],edx
 005B12B7    mov         esi,eax
 005B12B9    xor         eax,eax
 005B12BB    push        ebp
 005B12BC    push        5B134E
 005B12C1    push        dword ptr fs:[eax]
 005B12C4    mov         dword ptr fs:[eax],esp
 005B12C7    mov         ebx,dword ptr [ebp-4]
 005B12CA    test        ebx,ebx
>005B12CC    je          005B1314
 005B12CE    cmp         esi,ebx
>005B12D0    jne         005B130D
 005B12D2    lea         edx,[ebp-10]
 005B12D5    mov         eax,dword ptr [esi]
 005B12D7    call        TObject.ClassName
 005B12DC    mov         eax,dword ptr [ebp-10]
 005B12DF    mov         dword ptr [ebp-0C],eax
 005B12E2    mov         byte ptr [ebp-8],11
 005B12E6    lea         eax,[ebp-0C]
 005B12E9    push        eax
 005B12EA    push        0
 005B12EC    lea         edx,[ebp-14]
 005B12EF    mov         eax,[0078D744];^SResString681:TResStringRec
 005B12F4    call        LoadResString
 005B12F9    mov         ecx,dword ptr [ebp-14]
 005B12FC    mov         dl,1
 005B12FE    mov         eax,[005B0CDC];EIdInterceptCircularLink
 005B1303    call        Exception.CreateFmt
 005B1308    call        @RaiseExcept
 005B130D    mov         ebx,dword ptr [ebx+38]
 005B1310    test        ebx,ebx
>005B1312    jne         005B12CE
 005B1314    mov         eax,dword ptr [esi+38]
 005B1317    test        eax,eax
>005B1319    je          005B1322
 005B131B    mov         edx,esi
 005B131D    call        TComponent.RemoveFreeNotification
 005B1322    mov         eax,dword ptr [ebp-4]
 005B1325    mov         dword ptr [esi+38],eax
 005B1328    test        eax,eax
>005B132A    je          005B1333
 005B132C    mov         edx,esi
 005B132E    call        TComponent.FreeNotification
 005B1333    xor         eax,eax
 005B1335    pop         edx
 005B1336    pop         ecx
 005B1337    pop         ecx
 005B1338    mov         dword ptr fs:[eax],edx
 005B133B    push        5B1355
 005B1340    lea         eax,[ebp-14]
 005B1343    mov         edx,2
 005B1348    call        @UStrArrayClr
 005B134D    ret
>005B134E    jmp         @HandleFinally
>005B1353    jmp         005B1340
 005B1355    pop         esi
 005B1356    pop         ebx
 005B1357    mov         esp,ebp
 005B1359    pop         ebp
 005B135A    ret
*}
end;

//005B135C
procedure TIdConnectionIntercept.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 005B135C    push        ebx
 005B135D    push        esi
 005B135E    push        edi
 005B135F    mov         ebx,ecx
 005B1361    mov         esi,edx
 005B1363    mov         edi,eax
 005B1365    mov         ecx,ebx
 005B1367    mov         edx,esi
 005B1369    mov         eax,edi
 005B136B    call        TComponent.Notification
 005B1370    cmp         bl,1
>005B1373    jne         005B137F
 005B1375    cmp         esi,dword ptr [edi+38]
>005B1378    jne         005B137F
 005B137A    xor         eax,eax
 005B137C    mov         dword ptr [edi+38],eax
 005B137F    pop         edi
 005B1380    pop         esi
 005B1381    pop         ebx
 005B1382    ret
*}
end;

//005B1384
procedure TIdConnectionIntercept.InitComponent;
begin
{*
 005B1384    push        ebx
 005B1385    mov         ebx,eax
 005B1387    mov         eax,ebx
 005B1389    call        TIdInitializerComponent.InitComponent
 005B138E    mov         byte ptr [ebx+3C],1
 005B1392    pop         ebx
 005B1393    ret
*}
end;

//005B33D0
procedure TIdIOHandler.CheckForDisconnect(ARaiseExceptionIfDisconnected:Boolean; AIgnoreBuffer:Boolean);
begin
{*
>005B33D0    jmp         @AbstractError
*}
end;

//005B33D8
procedure TIdIOHandler.Close;
begin
{*
 005B33D8    push        ebp
 005B33D9    mov         ebp,esp
 005B33DB    push        ecx
 005B33DC    mov         dword ptr [ebp-4],eax
 005B33DF    xor         edx,edx
 005B33E1    push        ebp
 005B33E2    push        5B3422
 005B33E7    push        dword ptr fs:[edx]
 005B33EA    mov         dword ptr fs:[edx],esp
 005B33ED    mov         eax,dword ptr [ebp-4]
 005B33F0    mov         eax,dword ptr [eax+0A4]
 005B33F6    test        eax,eax
>005B33F8    je          005B33FF
 005B33FA    mov         edx,dword ptr [eax]
 005B33FC    call        dword ptr [edx+3C]
 005B33FF    xor         eax,eax
 005B3401    pop         edx
 005B3402    pop         ecx
 005B3403    pop         ecx
 005B3404    mov         dword ptr fs:[eax],edx
 005B3407    push        5B3429
 005B340C    mov         eax,dword ptr [ebp-4]
 005B340F    mov         byte ptr [eax+0B4],0
 005B3416    mov         eax,dword ptr [ebp-4]
 005B3419    mov         edx,dword ptr [eax]
 005B341B    call        dword ptr [edx+0C8]
 005B3421    ret
>005B3422    jmp         @HandleFinally
>005B3427    jmp         005B340C
 005B3429    pop         ecx
 005B342A    pop         ebp
 005B342B    ret
*}
end;

//005B342C
destructor TIdIOHandler.Destroy();
begin
{*
 005B342C    push        ebx
 005B342D    push        esi
 005B342E    call        @BeforeDestruction
 005B3433    mov         ebx,edx
 005B3435    mov         esi,eax
 005B3437    mov         eax,esi
 005B3439    mov         edx,dword ptr [eax]
 005B343B    call        dword ptr [edx+80]
 005B3441    lea         eax,[esi+0A0]
 005B3447    mov         edx,dword ptr [eax]
 005B3449    xor         ecx,ecx
 005B344B    mov         dword ptr [eax],ecx
 005B344D    mov         eax,edx
 005B344F    call        TObject.Free
 005B3454    lea         eax,[esi+0CC]
 005B345A    mov         edx,dword ptr [eax]
 005B345C    xor         ecx,ecx
 005B345E    mov         dword ptr [eax],ecx
 005B3460    mov         eax,edx
 005B3462    call        TObject.Free
 005B3467    mov         edx,ebx
 005B3469    and         dl,0FC
 005B346C    mov         eax,esi
 005B346E    call        TIdComponent.Destroy
 005B3473    test        bl,bl
>005B3475    jle         005B347E
 005B3477    mov         eax,esi
 005B3479    call        @ClassDestroy
 005B347E    pop         esi
 005B347F    pop         ebx
 005B3480    ret
*}
end;

//005B3484
procedure TIdIOHandler.AfterAccept;
begin
{*
 005B3484    ret
*}
end;

//005B3488
procedure TIdIOHandler.Open;
begin
{*
 005B3488    push        ebx
 005B3489    mov         ebx,eax
 005B348B    mov         byte ptr [ebx+0B4],0
 005B3492    mov         byte ptr [ebx+91],0
 005B3499    mov         eax,ebx
 005B349B    mov         edx,dword ptr [eax]
 005B349D    call        dword ptr [edx+0C8]
 005B34A3    mov         eax,dword ptr [ebx+0A0]
 005B34A9    call        TIdBuffer.Clear
 005B34AE    mov         byte ptr [ebx+0B4],1
 005B34B5    pop         ebx
 005B34B6    ret
*}
end;

//005B34B8
procedure TIdIOHandler.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 005B34B8    push        ebx
 005B34B9    push        esi
 005B34BA    push        edi
 005B34BB    mov         ebx,ecx
 005B34BD    mov         esi,edx
 005B34BF    mov         edi,eax
 005B34C1    mov         ecx,ebx
 005B34C3    mov         edx,esi
 005B34C5    mov         eax,edi
 005B34C7    call        TComponent.Notification
 005B34CC    cmp         bl,1
>005B34CF    jne         005B34E1
 005B34D1    cmp         esi,dword ptr [edi+0A4]
>005B34D7    jne         005B34E1
 005B34D9    xor         eax,eax
 005B34DB    mov         dword ptr [edi+0A4],eax
 005B34E1    pop         edi
 005B34E2    pop         esi
 005B34E3    pop         ebx
 005B34E4    ret
*}
end;

//005B34E8
procedure TIdIOHandler.SetIntercept(AValue:TIdConnectionIntercept);
begin
{*
 005B34E8    push        ebx
 005B34E9    push        esi
 005B34EA    mov         esi,edx
 005B34EC    mov         ebx,eax
 005B34EE    mov         eax,dword ptr [ebx+0A4]
 005B34F4    cmp         esi,eax
>005B34F6    je          005B3516
 005B34F8    test        eax,eax
>005B34FA    je          005B3503
 005B34FC    mov         edx,ebx
 005B34FE    call        TComponent.RemoveFreeNotification
 005B3503    mov         eax,esi
 005B3505    mov         dword ptr [ebx+0A4],eax
 005B350B    test        eax,eax
>005B350D    je          005B3516
 005B350F    mov         edx,ebx
 005B3511    call        TComponent.FreeNotification
 005B3516    pop         esi
 005B3517    pop         ebx
 005B3518    ret
*}
end;

//005B351C
procedure TIdIOHandler.SetDefaultClass;
begin
{*
 005B351C    mov         [00789F0C],eax
 005B3521    call        TIdIOHandler.RegisterIOHandler
 005B3526    ret
*}
end;

//005B3528
procedure TIdIOHandler.SetDefStringEncoding(const AEncoding:TIdTextEncoding);
begin
{*
 005B3528    push        ebx
 005B3529    push        ecx
 005B352A    mov         ebx,eax
 005B352C    cmp         edx,dword ptr [ebx+0D4]
>005B3532    je          005B3549
 005B3534    mov         dword ptr [esp],edx
 005B3537    mov         eax,esp
 005B3539    mov         dl,1
 005B353B    call        EnsureEncoding
 005B3540    mov         eax,dword ptr [esp]
 005B3543    mov         dword ptr [ebx+0D4],eax
 005B3549    pop         edx
 005B354A    pop         ebx
 005B354B    ret
*}
end;

//005B354C
function TIdIOHandler.MakeDefaultIOHandler(AOwner:TComponent):TIdIOHandler;
begin
{*
 005B354C    mov         ecx,edx
 005B354E    mov         eax,[00789F0C]
 005B3553    mov         dl,1
 005B3555    call        TIdBaseComponent.Create
 005B355A    ret
*}
end;

//005B355C
procedure TIdIOHandler.RegisterIOHandler;
begin
{*
 005B355C    push        ebx
 005B355D    mov         ebx,eax
 005B355F    cmp         dword ptr ds:[789F10],0;gvar_00789F10
>005B3566    jne         005B3579
 005B3568    mov         dl,1
 005B356A    mov         eax,[00439644];TList
 005B356F    call        TObject.Create
 005B3574    mov         [00789F10],eax;gvar_00789F10
 005B3579    mov         edx,ebx
 005B357B    mov         eax,[00789F10];gvar_00789F10
 005B3580    call        TList.IndexOf
 005B3585    inc         eax
>005B3586    jne         005B3594
 005B3588    mov         edx,ebx
 005B358A    mov         eax,[00789F10];gvar_00789F10
 005B358F    call        TList.Add
 005B3594    pop         ebx
 005B3595    ret
*}
end;

//005B3598
function TIdIOHandler.MakeIOHandler(ABaseType:TIdIOHandlerClass; AOwner:TComponent):TIdIOHandler;
begin
{*
 005B3598    push        ebp
 005B3599    mov         ebp,esp
 005B359B    add         esp,0FFFFFFF0
 005B359E    push        ebx
 005B359F    push        esi
 005B35A0    push        edi
 005B35A1    xor         ebx,ebx
 005B35A3    mov         dword ptr [ebp-0C],ebx
 005B35A6    mov         dword ptr [ebp-10],ebx
 005B35A9    mov         esi,edx
 005B35AB    mov         edi,789F10;gvar_00789F10
 005B35B0    xor         eax,eax
 005B35B2    push        ebp
 005B35B3    push        5B364D
 005B35B8    push        dword ptr fs:[eax]
 005B35BB    mov         dword ptr fs:[eax],esp
 005B35BE    mov         eax,dword ptr [edi]
 005B35C0    mov         ebx,dword ptr [eax+8]
 005B35C3    dec         ebx
 005B35C4    cmp         ebx,0
>005B35C7    jl          005B35F7
 005B35C9    mov         edx,ebx
 005B35CB    mov         eax,dword ptr [edi]
 005B35CD    call        TList.Get
 005B35D2    mov         edx,esi
 005B35D4    call        TObject.InheritsFrom
 005B35D9    test        al,al
>005B35DB    je          005B35F1
 005B35DD    mov         edx,ebx
 005B35DF    mov         eax,dword ptr [edi]
 005B35E1    call        TList.Get
 005B35E6    mov         dl,1
 005B35E8    call        TIdInitializerComponent.Create
 005B35ED    mov         ebx,eax
>005B35EF    jmp         005B3632
 005B35F1    dec         ebx
 005B35F2    cmp         ebx,0FFFFFFFF
>005B35F5    jne         005B35C9
 005B35F7    lea         edx,[ebp-0C]
 005B35FA    mov         eax,esi
 005B35FC    call        TObject.ClassName
 005B3601    mov         eax,dword ptr [ebp-0C]
 005B3604    mov         dword ptr [ebp-8],eax
 005B3607    mov         byte ptr [ebp-4],11
 005B360B    lea         eax,[ebp-8]
 005B360E    push        eax
 005B360F    push        0
 005B3611    lea         edx,[ebp-10]
 005B3614    mov         eax,[0078D5A8];^SResString703:TResStringRec
 005B3619    call        LoadResString
 005B361E    mov         ecx,dword ptr [ebp-10]
 005B3621    mov         dl,1
 005B3623    mov         eax,[005961F8];EIdException
 005B3628    call        Exception.CreateFmt
 005B362D    call        @RaiseExcept
 005B3632    xor         eax,eax
 005B3634    pop         edx
 005B3635    pop         ecx
 005B3636    pop         ecx
 005B3637    mov         dword ptr fs:[eax],edx
 005B363A    push        5B3654
 005B363F    lea         eax,[ebp-10]
 005B3642    mov         edx,2
 005B3647    call        @UStrArrayClr
 005B364C    ret
>005B364D    jmp         @HandleFinally
>005B3652    jmp         005B363F
 005B3654    mov         eax,ebx
 005B3656    pop         edi
 005B3657    pop         esi
 005B3658    pop         ebx
 005B3659    mov         esp,ebp
 005B365B    pop         ebp
 005B365C    ret
*}
end;

//005B3660
function TIdIOHandler.GetDestination:string;
begin
{*
 005B3660    push        ebx
 005B3661    push        esi
 005B3662    mov         esi,edx
 005B3664    mov         ebx,eax
 005B3666    mov         eax,esi
 005B3668    mov         edx,dword ptr [ebx+98]
 005B366E    call        @UStrAsg
 005B3673    pop         esi
 005B3674    pop         ebx
 005B3675    ret
*}
end;

//005B3678
procedure TIdIOHandler.SetDestination(const AValue:UnicodeString);
begin
{*
 005B3678    push        ebx
 005B3679    push        esi
 005B367A    mov         esi,edx
 005B367C    mov         ebx,eax
 005B367E    lea         eax,[ebx+98]
 005B3684    mov         edx,esi
 005B3686    call        @UStrAsg
 005B368B    pop         esi
 005B368C    pop         ebx
 005B368D    ret
*}
end;

//005B3690
procedure TIdIOHandler.BufferRemoveNotify(ASender:TObject; ABytes:Integer);
begin
{*
 005B3690    push        ebx
 005B3691    mov         ebx,eax
 005B3693    mov         eax,ecx
 005B3695    cdq
 005B3696    push        edx
 005B3697    push        eax
 005B3698    xor         edx,edx
 005B369A    mov         eax,ebx
 005B369C    mov         ecx,dword ptr [eax]
 005B369E    call        dword ptr [ecx+3C]
 005B36A1    pop         ebx
 005B36A2    ret
*}
end;

//005B36A4
procedure TIdIOHandler.WriteBufferOpen(AThreshold:Integer);
begin
{*
 005B36A4    push        ebx
 005B36A5    push        esi
 005B36A6    mov         esi,edx
 005B36A8    mov         ebx,eax
 005B36AA    mov         eax,dword ptr [ebx+0CC]
 005B36B0    test        eax,eax
>005B36B2    je          005B36BB
 005B36B4    call        TIdBuffer.Clear
>005B36B9    jmp         005B36CD
 005B36BB    mov         dl,1
 005B36BD    mov         eax,[005ADA5C];TIdBuffer
 005B36C2    call        TIdBuffer.Create
 005B36C7    mov         dword ptr [ebx+0CC],eax
 005B36CD    mov         dword ptr [ebx+0D0],esi
 005B36D3    pop         esi
 005B36D4    pop         ebx
 005B36D5    ret
*}
end;

//005B36D8
procedure TIdIOHandler.WriteBufferClose;
begin
{*
 005B36D8    push        ebp
 005B36D9    mov         ebp,esp
 005B36DB    push        ecx
 005B36DC    mov         dword ptr [ebp-4],eax
 005B36DF    xor         ecx,ecx
 005B36E1    push        ebp
 005B36E2    push        5B3718
 005B36E7    push        dword ptr fs:[ecx]
 005B36EA    mov         dword ptr fs:[ecx],esp
 005B36ED    mov         eax,dword ptr [ebp-4]
 005B36F0    call        TIdIOHandler.WriteBufferFlush
 005B36F5    xor         eax,eax
 005B36F7    pop         edx
 005B36F8    pop         ecx
 005B36F9    pop         ecx
 005B36FA    mov         dword ptr fs:[eax],edx
 005B36FD    push        5B371F
 005B3702    mov         eax,dword ptr [ebp-4]
 005B3705    add         eax,0CC
 005B370A    mov         edx,dword ptr [eax]
 005B370C    xor         ecx,ecx
 005B370E    mov         dword ptr [eax],ecx
 005B3710    mov         eax,edx
 005B3712    call        TObject.Free
 005B3717    ret
>005B3718    jmp         @HandleFinally
>005B371D    jmp         005B3702
 005B371F    pop         ecx
 005B3720    pop         ebp
 005B3721    ret
*}
end;

//005B3724
procedure TIdIOHandler.WriteBufferFlush(AByteCount:Integer);
begin
{*
 005B3724    push        ebp
 005B3725    mov         ebp,esp
 005B3727    push        0
 005B3729    push        ebx
 005B372A    mov         ebx,eax
 005B372C    xor         eax,eax
 005B372E    push        ebp
 005B372F    push        5B3783
 005B3734    push        dword ptr fs:[eax]
 005B3737    mov         dword ptr fs:[eax],esp
 005B373A    mov         eax,dword ptr [ebx+0CC]
 005B3740    test        eax,eax
>005B3742    je          005B3767
 005B3744    cmp         dword ptr [eax+20],0
>005B3748    jle         005B3767
 005B374A    push        1
 005B374C    push        0FF
 005B374E    lea         ecx,[ebp-4]
 005B3751    xchg        ecx,edx
 005B3753    call        TIdBuffer.ExtractToBytes
 005B3758    push        0
 005B375A    or          ecx,0FFFFFFFF
 005B375D    mov         edx,dword ptr [ebp-4]
 005B3760    mov         eax,ebx
 005B3762    call        TIdIOHandler.WriteDirect
 005B3767    xor         eax,eax
 005B3769    pop         edx
 005B376A    pop         ecx
 005B376B    pop         ecx
 005B376C    mov         dword ptr fs:[eax],edx
 005B376F    push        5B378A
 005B3774    lea         eax,[ebp-4]
 005B3777    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B377D    call        @DynArrayClear
 005B3782    ret
>005B3783    jmp         @HandleFinally
>005B3788    jmp         005B3774
 005B378A    pop         ebx
 005B378B    pop         ecx
 005B378C    pop         ebp
 005B378D    ret
*}
end;

//005B3790
procedure TIdIOHandler.WriteBufferClear;
begin
{*
 005B3790    mov         edx,dword ptr [eax+0CC]
 005B3796    test        edx,edx
>005B3798    je          005B37A1
 005B379A    mov         eax,edx
 005B379C    call        TIdBuffer.Clear
 005B37A1    ret
*}
end;

//005B37A4
procedure TIdIOHandler.WriteBufferCancel;
begin
{*
 005B37A4    push        ebx
 005B37A5    mov         ebx,eax
 005B37A7    mov         eax,ebx
 005B37A9    mov         edx,dword ptr [eax]
 005B37AB    call        dword ptr [edx+0C8]
 005B37B1    mov         eax,ebx
 005B37B3    mov         edx,dword ptr [eax]
 005B37B5    call        dword ptr [edx+0CC]
 005B37BB    pop         ebx
 005B37BC    ret
*}
end;

//005B37C0
procedure TIdIOHandler.Write(AOut:string; AByteEncoding:TEncoding);
begin
{*
 005B37C0    push        ebp
 005B37C1    mov         ebp,esp
 005B37C3    push        0
 005B37C5    push        ebx
 005B37C6    push        esi
 005B37C7    push        edi
 005B37C8    mov         esi,ecx
 005B37CA    mov         edi,edx
 005B37CC    mov         ebx,eax
 005B37CE    xor         eax,eax
 005B37D0    push        ebp
 005B37D1    push        5B3833
 005B37D6    push        dword ptr fs:[eax]
 005B37D9    mov         dword ptr fs:[eax],esp
 005B37DC    test        edi,edi
>005B37DE    je          005B3817
 005B37E0    mov         cl,1
 005B37E2    mov         edx,dword ptr [ebx+0D4]
 005B37E8    mov         eax,esi
 005B37EA    call        iif
 005B37EF    mov         esi,eax
 005B37F1    push        0
 005B37F3    push        esi
 005B37F4    lea         eax,[ebp-4]
 005B37F7    push        eax
 005B37F8    mov         ecx,1
 005B37FD    or          edx,0FFFFFFFF
 005B3800    mov         eax,edi
 005B3802    call        ToBytes
 005B3807    mov         edx,dword ptr [ebp-4]
 005B380A    or          ecx,0FFFFFFFF
 005B380D    mov         eax,ebx
 005B380F    mov         ebx,dword ptr [eax]
 005B3811    call        dword ptr [ebx+88]
 005B3817    xor         eax,eax
 005B3819    pop         edx
 005B381A    pop         ecx
 005B381B    pop         ecx
 005B381C    mov         dword ptr fs:[eax],edx
 005B381F    push        5B383A
 005B3824    lea         eax,[ebp-4]
 005B3827    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B382D    call        @DynArrayClear
 005B3832    ret
>005B3833    jmp         @HandleFinally
>005B3838    jmp         005B3824
 005B383A    pop         edi
 005B383B    pop         esi
 005B383C    pop         ebx
 005B383D    pop         ecx
 005B383E    pop         ebp
 005B383F    ret
*}
end;

//005B3840
procedure TIdIOHandler.Write(AValue:Byte);
begin
{*
 005B3840    push        ebp
 005B3841    mov         ebp,esp
 005B3843    push        0
 005B3845    push        ebx
 005B3846    push        esi
 005B3847    mov         ebx,edx
 005B3849    mov         esi,eax
 005B384B    xor         eax,eax
 005B384D    push        ebp
 005B384E    push        5B3891
 005B3853    push        dword ptr fs:[eax]
 005B3856    mov         dword ptr fs:[eax],esp
 005B3859    push        0
 005B385B    lea         edx,[ebp-4]
 005B385E    mov         eax,ebx
 005B3860    call        ToBytes
 005B3865    mov         edx,dword ptr [ebp-4]
 005B3868    or          ecx,0FFFFFFFF
 005B386B    mov         eax,esi
 005B386D    mov         ebx,dword ptr [eax]
 005B386F    call        dword ptr [ebx+88]
 005B3875    xor         eax,eax
 005B3877    pop         edx
 005B3878    pop         ecx
 005B3879    pop         ecx
 005B387A    mov         dword ptr fs:[eax],edx
 005B387D    push        5B3898
 005B3882    lea         eax,[ebp-4]
 005B3885    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B388B    call        @DynArrayClear
 005B3890    ret
>005B3891    jmp         @HandleFinally
>005B3896    jmp         005B3882
 005B3898    pop         esi
 005B3899    pop         ebx
 005B389A    pop         ecx
 005B389B    pop         ebp
 005B389C    ret
*}
end;

//005B38A0
procedure TIdIOHandler.Write(AValue:Char; AByteEncoding:TEncoding);
begin
{*
 005B38A0    push        ebp
 005B38A1    mov         ebp,esp
 005B38A3    push        0
 005B38A5    push        ebx
 005B38A6    push        esi
 005B38A7    push        edi
 005B38A8    mov         esi,ecx
 005B38AA    mov         edi,edx
 005B38AC    mov         ebx,eax
 005B38AE    xor         eax,eax
 005B38B0    push        ebp
 005B38B1    push        5B3907
 005B38B6    push        dword ptr fs:[eax]
 005B38B9    mov         dword ptr fs:[eax],esp
 005B38BC    mov         cl,1
 005B38BE    mov         edx,dword ptr [ebx+0D4]
 005B38C4    mov         eax,esi
 005B38C6    call        iif
 005B38CB    mov         esi,eax
 005B38CD    push        0
 005B38CF    lea         ecx,[ebp-4]
 005B38D2    mov         edx,esi
 005B38D4    mov         eax,edi
 005B38D6    call        ToBytes
 005B38DB    mov         edx,dword ptr [ebp-4]
 005B38DE    or          ecx,0FFFFFFFF
 005B38E1    mov         eax,ebx
 005B38E3    mov         ebx,dword ptr [eax]
 005B38E5    call        dword ptr [ebx+88]
 005B38EB    xor         eax,eax
 005B38ED    pop         edx
 005B38EE    pop         ecx
 005B38EF    pop         ecx
 005B38F0    mov         dword ptr fs:[eax],edx
 005B38F3    push        5B390E
 005B38F8    lea         eax,[ebp-4]
 005B38FB    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B3901    call        @DynArrayClear
 005B3906    ret
>005B3907    jmp         @HandleFinally
>005B390C    jmp         005B38F8
 005B390E    pop         edi
 005B390F    pop         esi
 005B3910    pop         ebx
 005B3911    pop         ecx
 005B3912    pop         ebp
 005B3913    ret
*}
end;

//005B3914
procedure TIdIOHandler.Write(AValue:Cardinal; AConvert:Boolean);
begin
{*
 005B3914    push        ebp
 005B3915    mov         ebp,esp
 005B3917    push        0
 005B3919    push        ebx
 005B391A    push        esi
 005B391B    push        edi
 005B391C    mov         esi,edx
 005B391E    mov         edi,eax
 005B3920    xor         eax,eax
 005B3922    push        ebp
 005B3923    push        5B397A
 005B3928    push        dword ptr fs:[eax]
 005B392B    mov         dword ptr fs:[eax],esp
 005B392E    test        cl,cl
>005B3930    je          005B3942
 005B3932    mov         eax,[0078D940];^gvar_00789ED0
 005B3937    mov         eax,dword ptr [eax]
 005B3939    mov         edx,esi
 005B393B    mov         ecx,dword ptr [eax]
 005B393D    call        dword ptr [ecx+30]
 005B3940    mov         esi,eax
 005B3942    push        0
 005B3944    lea         edx,[ebp-4]
 005B3947    mov         eax,esi
 005B3949    call        ToBytes
 005B394E    mov         edx,dword ptr [ebp-4]
 005B3951    or          ecx,0FFFFFFFF
 005B3954    mov         eax,edi
 005B3956    mov         ebx,dword ptr [eax]
 005B3958    call        dword ptr [ebx+88]
 005B395E    xor         eax,eax
 005B3960    pop         edx
 005B3961    pop         ecx
 005B3962    pop         ecx
 005B3963    mov         dword ptr fs:[eax],edx
 005B3966    push        5B3981
 005B396B    lea         eax,[ebp-4]
 005B396E    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B3974    call        @DynArrayClear
 005B3979    ret
>005B397A    jmp         @HandleFinally
>005B397F    jmp         005B396B
 005B3981    pop         edi
 005B3982    pop         esi
 005B3983    pop         ebx
 005B3984    pop         ecx
 005B3985    pop         ebp
 005B3986    ret
*}
end;

//005B3988
procedure TIdIOHandler.Write(AValue:Integer; AConvert:Boolean);
begin
{*
 005B3988    push        ebp
 005B3989    mov         ebp,esp
 005B398B    push        0
 005B398D    push        ebx
 005B398E    push        esi
 005B398F    push        edi
 005B3990    mov         esi,edx
 005B3992    mov         edi,eax
 005B3994    xor         eax,eax
 005B3996    push        ebp
 005B3997    push        5B39EE
 005B399C    push        dword ptr fs:[eax]
 005B399F    mov         dword ptr fs:[eax],esp
 005B39A2    test        cl,cl
>005B39A4    je          005B39B6
 005B39A6    mov         eax,[0078D940];^gvar_00789ED0
 005B39AB    mov         eax,dword ptr [eax]
 005B39AD    mov         edx,esi
 005B39AF    mov         ecx,dword ptr [eax]
 005B39B1    call        dword ptr [ecx+30]
 005B39B4    mov         esi,eax
 005B39B6    push        0
 005B39B8    lea         edx,[ebp-4]
 005B39BB    mov         eax,esi
 005B39BD    call        ToBytes
 005B39C2    mov         edx,dword ptr [ebp-4]
 005B39C5    or          ecx,0FFFFFFFF
 005B39C8    mov         eax,edi
 005B39CA    mov         ebx,dword ptr [eax]
 005B39CC    call        dword ptr [ebx+88]
 005B39D2    xor         eax,eax
 005B39D4    pop         edx
 005B39D5    pop         ecx
 005B39D6    pop         ecx
 005B39D7    mov         dword ptr fs:[eax],edx
 005B39DA    push        5B39F5
 005B39DF    lea         eax,[ebp-4]
 005B39E2    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B39E8    call        @DynArrayClear
 005B39ED    ret
>005B39EE    jmp         @HandleFinally
>005B39F3    jmp         005B39DF
 005B39F5    pop         edi
 005B39F6    pop         esi
 005B39F7    pop         ebx
 005B39F8    pop         ecx
 005B39F9    pop         ebp
 005B39FA    ret
*}
end;

//005B39FC
procedure TIdIOHandler.Write(AConvert:Boolean; AValue:Int64);
begin
{*
 005B39FC    push        ebp
 005B39FD    mov         ebp,esp
 005B39FF    push        0
 005B3A01    push        ebx
 005B3A02    push        esi
 005B3A03    mov         esi,eax
 005B3A05    xor         eax,eax
 005B3A07    push        ebp
 005B3A08    push        5B3A6B
 005B3A0D    push        dword ptr fs:[eax]
 005B3A10    mov         dword ptr fs:[eax],esp
 005B3A13    test        dl,dl
>005B3A15    je          005B3A2F
 005B3A17    push        dword ptr [ebp+0C]
 005B3A1A    push        dword ptr [ebp+8]
 005B3A1D    mov         eax,[0078D940];^gvar_00789ED0
 005B3A22    mov         eax,dword ptr [eax]
 005B3A24    mov         edx,dword ptr [eax]
 005B3A26    call        dword ptr [edx+34]
 005B3A29    mov         dword ptr [ebp+8],eax
 005B3A2C    mov         dword ptr [ebp+0C],edx
 005B3A2F    push        0
 005B3A31    push        dword ptr [ebp+0C]
 005B3A34    push        dword ptr [ebp+8]
 005B3A37    lea         eax,[ebp-4]
 005B3A3A    call        ToBytes
 005B3A3F    mov         edx,dword ptr [ebp-4]
 005B3A42    or          ecx,0FFFFFFFF
 005B3A45    mov         eax,esi
 005B3A47    mov         ebx,dword ptr [eax]
 005B3A49    call        dword ptr [ebx+88]
 005B3A4F    xor         eax,eax
 005B3A51    pop         edx
 005B3A52    pop         ecx
 005B3A53    pop         ecx
 005B3A54    mov         dword ptr fs:[eax],edx
 005B3A57    push        5B3A72
 005B3A5C    lea         eax,[ebp-4]
 005B3A5F    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B3A65    call        @DynArrayClear
 005B3A6A    ret
>005B3A6B    jmp         @HandleFinally
>005B3A70    jmp         005B3A5C
 005B3A72    pop         esi
 005B3A73    pop         ebx
 005B3A74    pop         ecx
 005B3A75    pop         ebp
 005B3A76    ret         8
*}
end;

//005B3A7C
procedure TIdIOHandler.Write(AValue:TStrings; AWriteLinesCount:Boolean; AByteEncoding:TEncoding);
begin
{*
 005B3A7C    push        ebp
 005B3A7D    mov         ebp,esp
 005B3A7F    add         esp,0FFFFFFF0
 005B3A82    push        ebx
 005B3A83    push        esi
 005B3A84    push        edi
 005B3A85    xor         ebx,ebx
 005B3A87    mov         dword ptr [ebp-10],ebx
 005B3A8A    mov         ebx,ecx
 005B3A8C    mov         dword ptr [ebp-8],edx
 005B3A8F    mov         dword ptr [ebp-4],eax
 005B3A92    xor         eax,eax
 005B3A94    push        ebp
 005B3A95    push        5B3B7C
 005B3A9A    push        dword ptr fs:[eax]
 005B3A9D    mov         dword ptr fs:[eax],esp
 005B3AA0    mov         eax,dword ptr [ebp-4]
 005B3AA3    mov         edx,dword ptr [eax+0D4]
 005B3AA9    mov         cl,1
 005B3AAB    mov         eax,dword ptr [ebp+8]
 005B3AAE    call        iif
 005B3AB3    mov         dword ptr [ebp+8],eax
 005B3AB6    mov         eax,dword ptr [ebp-4]
 005B3AB9    call        TIdIOHandler.WriteBufferingActive
 005B3ABE    xor         al,1
 005B3AC0    mov         byte ptr [ebp-9],al
 005B3AC3    cmp         byte ptr [ebp-9],0
>005B3AC7    je          005B3AD1
 005B3AC9    mov         eax,dword ptr [ebp-4]
 005B3ACC    call        TIdIOHandler.WriteBufferOpen
 005B3AD1    xor         eax,eax
 005B3AD3    push        ebp
 005B3AD4    push        5B3B46
 005B3AD9    push        dword ptr fs:[eax]
 005B3ADC    mov         dword ptr fs:[eax],esp
 005B3ADF    test        bl,bl
>005B3AE1    je          005B3AF7
 005B3AE3    mov         eax,dword ptr [ebp-8]
 005B3AE6    mov         edx,dword ptr [eax]
 005B3AE8    call        dword ptr [edx+14]
 005B3AEB    mov         edx,eax
 005B3AED    mov         cl,1
 005B3AEF    mov         eax,dword ptr [ebp-4]
 005B3AF2    call        TIdIOHandler.Write
 005B3AF7    mov         eax,dword ptr [ebp-8]
 005B3AFA    mov         edx,dword ptr [eax]
 005B3AFC    call        dword ptr [edx+14]
 005B3AFF    mov         ebx,eax
 005B3B01    dec         ebx
 005B3B02    test        ebx,ebx
>005B3B04    jl          005B3B2B
 005B3B06    inc         ebx
 005B3B07    xor         esi,esi
 005B3B09    lea         ecx,[ebp-10]
 005B3B0C    mov         edx,esi
 005B3B0E    mov         eax,dword ptr [ebp-8]
 005B3B11    mov         edi,dword ptr [eax]
 005B3B13    call        dword ptr [edi+0C]
 005B3B16    mov         edx,dword ptr [ebp-10]
 005B3B19    mov         ecx,dword ptr [ebp+8]
 005B3B1C    mov         eax,dword ptr [ebp-4]
 005B3B1F    mov         edi,dword ptr [eax]
 005B3B21    call        dword ptr [edi+98]
 005B3B27    inc         esi
 005B3B28    dec         ebx
>005B3B29    jne         005B3B09
 005B3B2B    cmp         byte ptr [ebp-9],0
>005B3B2F    je          005B3B3C
 005B3B31    mov         eax,dword ptr [ebp-4]
 005B3B34    mov         edx,dword ptr [eax]
 005B3B36    call        dword ptr [edx+0CC]
 005B3B3C    xor         eax,eax
 005B3B3E    pop         edx
 005B3B3F    pop         ecx
 005B3B40    pop         ecx
 005B3B41    mov         dword ptr fs:[eax],edx
>005B3B44    jmp         005B3B66
>005B3B46    jmp         @HandleAnyException
 005B3B4B    cmp         byte ptr [ebp-9],0
>005B3B4F    je          005B3B5C
 005B3B51    mov         eax,dword ptr [ebp-4]
 005B3B54    mov         edx,dword ptr [eax]
 005B3B56    call        dword ptr [edx+0C4]
 005B3B5C    call        @RaiseAgain
 005B3B61    call        @DoneExcept
 005B3B66    xor         eax,eax
 005B3B68    pop         edx
 005B3B69    pop         ecx
 005B3B6A    pop         ecx
 005B3B6B    mov         dword ptr fs:[eax],edx
 005B3B6E    push        5B3B83
 005B3B73    lea         eax,[ebp-10]
 005B3B76    call        @UStrClr
 005B3B7B    ret
>005B3B7C    jmp         @HandleFinally
>005B3B81    jmp         005B3B73
 005B3B83    pop         edi
 005B3B84    pop         esi
 005B3B85    pop         ebx
 005B3B86    mov         esp,ebp
 005B3B88    pop         ebp
 005B3B89    ret         4
*}
end;

//005B3B8C
procedure TIdIOHandler.Write(AValue:Word; AConvert:Boolean);
begin
{*
 005B3B8C    push        ebp
 005B3B8D    mov         ebp,esp
 005B3B8F    push        0
 005B3B91    push        ebx
 005B3B92    push        esi
 005B3B93    push        edi
 005B3B94    mov         esi,edx
 005B3B96    mov         edi,eax
 005B3B98    xor         eax,eax
 005B3B9A    push        ebp
 005B3B9B    push        5B3BF2
 005B3BA0    push        dword ptr fs:[eax]
 005B3BA3    mov         dword ptr fs:[eax],esp
 005B3BA6    test        cl,cl
>005B3BA8    je          005B3BBA
 005B3BAA    mov         eax,[0078D940];^gvar_00789ED0
 005B3BAF    mov         eax,dword ptr [eax]
 005B3BB1    mov         edx,esi
 005B3BB3    mov         ecx,dword ptr [eax]
 005B3BB5    call        dword ptr [ecx+2C]
 005B3BB8    mov         esi,eax
 005B3BBA    push        0
 005B3BBC    lea         edx,[ebp-4]
 005B3BBF    mov         eax,esi
 005B3BC1    call        ToBytes
 005B3BC6    mov         edx,dword ptr [ebp-4]
 005B3BC9    or          ecx,0FFFFFFFF
 005B3BCC    mov         eax,edi
 005B3BCE    mov         ebx,dword ptr [eax]
 005B3BD0    call        dword ptr [ebx+88]
 005B3BD6    xor         eax,eax
 005B3BD8    pop         edx
 005B3BD9    pop         ecx
 005B3BDA    pop         ecx
 005B3BDB    mov         dword ptr fs:[eax],edx
 005B3BDE    push        5B3BF9
 005B3BE3    lea         eax,[ebp-4]
 005B3BE6    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B3BEC    call        @DynArrayClear
 005B3BF1    ret
>005B3BF2    jmp         @HandleFinally
>005B3BF7    jmp         005B3BE3
 005B3BF9    pop         edi
 005B3BFA    pop         esi
 005B3BFB    pop         ebx
 005B3BFC    pop         ecx
 005B3BFD    pop         ebp
 005B3BFE    ret
*}
end;

//005B3C00
procedure TIdIOHandler.Write(AValue:SmallInt; AConvert:Boolean);
begin
{*
 005B3C00    push        ebp
 005B3C01    mov         ebp,esp
 005B3C03    push        0
 005B3C05    push        ebx
 005B3C06    push        esi
 005B3C07    push        edi
 005B3C08    mov         esi,edx
 005B3C0A    mov         edi,eax
 005B3C0C    xor         eax,eax
 005B3C0E    push        ebp
 005B3C0F    push        5B3C66
 005B3C14    push        dword ptr fs:[eax]
 005B3C17    mov         dword ptr fs:[eax],esp
 005B3C1A    test        cl,cl
>005B3C1C    je          005B3C2E
 005B3C1E    mov         eax,[0078D940];^gvar_00789ED0
 005B3C23    mov         eax,dword ptr [eax]
 005B3C25    mov         edx,esi
 005B3C27    mov         ecx,dword ptr [eax]
 005B3C29    call        dword ptr [ecx+2C]
 005B3C2C    mov         esi,eax
 005B3C2E    push        0
 005B3C30    lea         edx,[ebp-4]
 005B3C33    mov         eax,esi
 005B3C35    call        ToBytes
 005B3C3A    mov         edx,dword ptr [ebp-4]
 005B3C3D    or          ecx,0FFFFFFFF
 005B3C40    mov         eax,edi
 005B3C42    mov         ebx,dword ptr [eax]
 005B3C44    call        dword ptr [ebx+88]
 005B3C4A    xor         eax,eax
 005B3C4C    pop         edx
 005B3C4D    pop         ecx
 005B3C4E    pop         ecx
 005B3C4F    mov         dword ptr fs:[eax],edx
 005B3C52    push        5B3C6D
 005B3C57    lea         eax,[ebp-4]
 005B3C5A    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B3C60    call        @DynArrayClear
 005B3C65    ret
>005B3C66    jmp         @HandleFinally
>005B3C6B    jmp         005B3C57
 005B3C6D    pop         edi
 005B3C6E    pop         esi
 005B3C6F    pop         ebx
 005B3C70    pop         ecx
 005B3C71    pop         ebp
 005B3C72    ret
*}
end;

//005B3C74
function TIdIOHandler.ReadString(ABytes:Integer; AByteEncoding:TEncoding):string;
begin
{*
 005B3C74    push        ebp
 005B3C75    mov         ebp,esp
 005B3C77    add         esp,0FFFFFFF8
 005B3C7A    push        ebx
 005B3C7B    push        esi
 005B3C7C    push        edi
 005B3C7D    xor         ebx,ebx
 005B3C7F    mov         dword ptr [ebp-4],ebx
 005B3C82    mov         dword ptr [ebp-8],ecx
 005B3C85    mov         esi,edx
 005B3C87    mov         ebx,eax
 005B3C89    xor         eax,eax
 005B3C8B    push        ebp
 005B3C8C    push        5B3CF9
 005B3C91    push        dword ptr fs:[eax]
 005B3C94    mov         dword ptr fs:[eax],esp
 005B3C97    test        esi,esi
>005B3C99    jle         005B3CD5
 005B3C9B    push        0
 005B3C9D    lea         edx,[ebp-4]
 005B3CA0    mov         ecx,esi
 005B3CA2    mov         eax,ebx
 005B3CA4    mov         edi,dword ptr [eax]
 005B3CA6    call        dword ptr [edi+0B4]
 005B3CAC    mov         cl,1
 005B3CAE    mov         edx,dword ptr [ebx+0D4]
 005B3CB4    mov         eax,dword ptr [ebp-8]
 005B3CB7    call        iif
 005B3CBC    mov         dword ptr [ebp-8],eax
 005B3CBF    mov         eax,dword ptr [ebp-8]
 005B3CC2    push        eax
 005B3CC3    mov         eax,dword ptr [ebp+8]
 005B3CC6    push        eax
 005B3CC7    mov         ecx,esi
 005B3CC9    xor         edx,edx
 005B3CCB    mov         eax,dword ptr [ebp-4]
 005B3CCE    call        BytesToString
>005B3CD3    jmp         005B3CDD
 005B3CD5    mov         eax,dword ptr [ebp+8]
 005B3CD8    call        @UStrClr
 005B3CDD    xor         eax,eax
 005B3CDF    pop         edx
 005B3CE0    pop         ecx
 005B3CE1    pop         ecx
 005B3CE2    mov         dword ptr fs:[eax],edx
 005B3CE5    push        5B3D00
 005B3CEA    lea         eax,[ebp-4]
 005B3CED    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B3CF3    call        @DynArrayClear
 005B3CF8    ret
>005B3CF9    jmp         @HandleFinally
>005B3CFE    jmp         005B3CEA
 005B3D00    pop         edi
 005B3D01    pop         esi
 005B3D02    pop         ebx
 005B3D03    pop         ecx
 005B3D04    pop         ecx
 005B3D05    pop         ebp
 005B3D06    ret         4
*}
end;

//005B3D0C
procedure TIdIOHandler.ReadStrings(ADest:TStrings; AReadLinesCount:Integer; AByteEncoding:TEncoding);
begin
{*
 005B3D0C    push        ebp
 005B3D0D    mov         ebp,esp
 005B3D0F    add         esp,0FFFFFFF8
 005B3D12    push        ebx
 005B3D13    push        esi
 005B3D14    xor         ebx,ebx
 005B3D16    mov         dword ptr [ebp-8],ebx
 005B3D19    mov         ebx,ecx
 005B3D1B    mov         dword ptr [ebp-4],edx
 005B3D1E    mov         esi,eax
 005B3D20    xor         eax,eax
 005B3D22    push        ebp
 005B3D23    push        5B3D87
 005B3D28    push        dword ptr fs:[eax]
 005B3D2B    mov         dword ptr fs:[eax],esp
 005B3D2E    mov         cl,1
 005B3D30    mov         edx,dword ptr [esi+0D4]
 005B3D36    mov         eax,dword ptr [ebp+8]
 005B3D39    call        iif
 005B3D3E    mov         dword ptr [ebp+8],eax
 005B3D41    test        ebx,ebx
>005B3D43    jge         005B3D50
 005B3D45    mov         dl,1
 005B3D47    mov         eax,esi
 005B3D49    call        TIdIOHandler.ReadLongInt
 005B3D4E    mov         ebx,eax
 005B3D50    dec         ebx
 005B3D51    test        ebx,ebx
>005B3D53    jl          005B3D71
 005B3D55    inc         ebx
 005B3D56    lea         ecx,[ebp-8]
 005B3D59    mov         edx,dword ptr [ebp+8]
 005B3D5C    mov         eax,esi
 005B3D5E    call        TIdIOHandler.ReadLn
 005B3D63    mov         edx,dword ptr [ebp-8]
 005B3D66    mov         eax,dword ptr [ebp-4]
 005B3D69    mov         ecx,dword ptr [eax]
 005B3D6B    call        dword ptr [ecx+38]
 005B3D6E    dec         ebx
>005B3D6F    jne         005B3D56
 005B3D71    xor         eax,eax
 005B3D73    pop         edx
 005B3D74    pop         ecx
 005B3D75    pop         ecx
 005B3D76    mov         dword ptr fs:[eax],edx
 005B3D79    push        5B3D8E
 005B3D7E    lea         eax,[ebp-8]
 005B3D81    call        @UStrClr
 005B3D86    ret
>005B3D87    jmp         @HandleFinally
>005B3D8C    jmp         005B3D7E
 005B3D8E    pop         esi
 005B3D8F    pop         ebx
 005B3D90    pop         ecx
 005B3D91    pop         ecx
 005B3D92    pop         ebp
 005B3D93    ret         4
*}
end;

//005B3D98
function TIdIOHandler.ReadWord(AConvert:Boolean):Word;
begin
{*
 005B3D98    push        ebp
 005B3D99    mov         ebp,esp
 005B3D9B    push        0
 005B3D9D    push        ebx
 005B3D9E    push        esi
 005B3D9F    mov         ebx,edx
 005B3DA1    xor         edx,edx
 005B3DA3    push        ebp
 005B3DA4    push        5B3DFD
 005B3DA9    push        dword ptr fs:[edx]
 005B3DAC    mov         dword ptr fs:[edx],esp
 005B3DAF    push        0
 005B3DB1    lea         edx,[ebp-4]
 005B3DB4    mov         ecx,2
 005B3DB9    mov         esi,dword ptr [eax]
 005B3DBB    call        dword ptr [esi+0B4]
 005B3DC1    xor         edx,edx
 005B3DC3    mov         eax,dword ptr [ebp-4]
 005B3DC6    call        BytesToWord
 005B3DCB    mov         esi,eax
 005B3DCD    test        bl,bl
>005B3DCF    je          005B3DE1
 005B3DD1    mov         eax,[0078D940];^gvar_00789ED0
 005B3DD6    mov         eax,dword ptr [eax]
 005B3DD8    mov         edx,esi
 005B3DDA    mov         ecx,dword ptr [eax]
 005B3DDC    call        dword ptr [ecx+54]
 005B3DDF    mov         esi,eax
 005B3DE1    xor         eax,eax
 005B3DE3    pop         edx
 005B3DE4    pop         ecx
 005B3DE5    pop         ecx
 005B3DE6    mov         dword ptr fs:[eax],edx
 005B3DE9    push        5B3E04
 005B3DEE    lea         eax,[ebp-4]
 005B3DF1    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B3DF7    call        @DynArrayClear
 005B3DFC    ret
>005B3DFD    jmp         @HandleFinally
>005B3E02    jmp         005B3DEE
 005B3E04    mov         eax,esi
 005B3E06    pop         esi
 005B3E07    pop         ebx
 005B3E08    pop         ecx
 005B3E09    pop         ebp
 005B3E0A    ret
*}
end;

//005B3E0C
function TIdIOHandler.ReadSmallInt(AConvert:Boolean):SmallInt;
begin
{*
 005B3E0C    push        ebp
 005B3E0D    mov         ebp,esp
 005B3E0F    push        0
 005B3E11    push        ebx
 005B3E12    push        esi
 005B3E13    mov         ebx,edx
 005B3E15    xor         edx,edx
 005B3E17    push        ebp
 005B3E18    push        5B3E71
 005B3E1D    push        dword ptr fs:[edx]
 005B3E20    mov         dword ptr fs:[edx],esp
 005B3E23    push        0
 005B3E25    lea         edx,[ebp-4]
 005B3E28    mov         ecx,2
 005B3E2D    mov         esi,dword ptr [eax]
 005B3E2F    call        dword ptr [esi+0B4]
 005B3E35    xor         edx,edx
 005B3E37    mov         eax,dword ptr [ebp-4]
 005B3E3A    call        BytesToShort
 005B3E3F    mov         esi,eax
 005B3E41    test        bl,bl
>005B3E43    je          005B3E55
 005B3E45    mov         eax,[0078D940];^gvar_00789ED0
 005B3E4A    mov         eax,dword ptr [eax]
 005B3E4C    mov         edx,esi
 005B3E4E    mov         ecx,dword ptr [eax]
 005B3E50    call        dword ptr [ecx+54]
 005B3E53    mov         esi,eax
 005B3E55    xor         eax,eax
 005B3E57    pop         edx
 005B3E58    pop         ecx
 005B3E59    pop         ecx
 005B3E5A    mov         dword ptr fs:[eax],edx
 005B3E5D    push        5B3E78
 005B3E62    lea         eax,[ebp-4]
 005B3E65    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B3E6B    call        @DynArrayClear
 005B3E70    ret
>005B3E71    jmp         @HandleFinally
>005B3E76    jmp         005B3E62
 005B3E78    mov         eax,esi
 005B3E7A    pop         esi
 005B3E7B    pop         ebx
 005B3E7C    pop         ecx
 005B3E7D    pop         ebp
 005B3E7E    ret
*}
end;

//005B3E80
function TIdIOHandler.ReadChar(AByteEncoding:TEncoding):Char;
begin
{*
 005B3E80    push        ebp
 005B3E81    mov         ebp,esp
 005B3E83    add         esp,0FFFFFFF0
 005B3E86    push        ebx
 005B3E87    push        esi
 005B3E88    xor         ecx,ecx
 005B3E8A    mov         dword ptr [ebp-4],ecx
 005B3E8D    mov         dword ptr [ebp-8],ecx
 005B3E90    mov         dword ptr [ebp-10],edx
 005B3E93    mov         dword ptr [ebp-0C],eax
 005B3E96    xor         eax,eax
 005B3E98    push        ebp
 005B3E99    push        5B3F7B
 005B3E9E    push        dword ptr fs:[eax]
 005B3EA1    mov         dword ptr fs:[eax],esp
 005B3EA4    mov         eax,dword ptr [ebp-0C]
 005B3EA7    mov         edx,dword ptr [eax+0D4]
 005B3EAD    mov         cl,1
 005B3EAF    mov         eax,dword ptr [ebp-10]
 005B3EB2    call        iif
 005B3EB7    mov         dword ptr [ebp-10],eax
 005B3EBA    mov         edx,2
 005B3EBF    mov         eax,dword ptr [ebp-10]
 005B3EC2    mov         ecx,dword ptr [eax]
 005B3EC4    call        dword ptr [ecx+1C]
 005B3EC7    mov         ebx,eax
 005B3EC9    push        ebx
 005B3ECA    lea         eax,[ebp-4]
 005B3ECD    mov         ecx,1
 005B3ED2    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B3ED8    call        @DynArraySetLength
 005B3EDD    add         esp,4
 005B3EE0    push        2
 005B3EE2    lea         eax,[ebp-8]
 005B3EE5    mov         ecx,1
 005B3EEA    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 005B3EF0    call        @DynArraySetLength
 005B3EF5    add         esp,4
 005B3EF8    xor         eax,eax
 005B3EFA    test        ebx,ebx
>005B3EFC    jle         005B3F34
 005B3EFE    mov         esi,ebx
 005B3F00    test        esi,esi
>005B3F02    jle         005B3F34
 005B3F04    mov         ebx,1
 005B3F09    mov         eax,dword ptr [ebp-0C]
 005B3F0C    call        TIdIOHandler.ReadByte
 005B3F11    mov         edx,dword ptr [ebp-4]
 005B3F14    mov         byte ptr [edx+ebx-1],al
 005B3F18    push        ebx
 005B3F19    mov         eax,dword ptr [ebp-8]
 005B3F1C    push        eax
 005B3F1D    push        0
 005B3F1F    xor         ecx,ecx
 005B3F21    mov         edx,dword ptr [ebp-4]
 005B3F24    mov         eax,dword ptr [ebp-10]
 005B3F27    call        TEncoding.GetChars
 005B3F2C    test        eax,eax
>005B3F2E    jg          005B3F34
 005B3F30    inc         ebx
 005B3F31    dec         esi
>005B3F32    jne         005B3F09
 005B3F34    dec         eax
>005B3F35    je          005B3F4B
 005B3F37    mov         ecx,495
 005B3F3C    mov         edx,5B3F98;'C:\Builds\TP\indysockets\lib\core\IdIOHandler.pas'
 005B3F41    mov         eax,5B4008;'Assertion failure'
 005B3F46    call        @Assert
 005B3F4B    mov         eax,dword ptr [ebp-8]
 005B3F4E    movzx       ebx,word ptr [eax]
 005B3F51    xor         eax,eax
 005B3F53    pop         edx
 005B3F54    pop         ecx
 005B3F55    pop         ecx
 005B3F56    mov         dword ptr fs:[eax],edx
 005B3F59    push        5B3F82
 005B3F5E    lea         eax,[ebp-8]
 005B3F61    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 005B3F67    call        @DynArrayClear
 005B3F6C    lea         eax,[ebp-4]
 005B3F6F    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B3F75    call        @DynArrayClear
 005B3F7A    ret
>005B3F7B    jmp         @HandleFinally
>005B3F80    jmp         005B3F5E
 005B3F82    mov         eax,ebx
 005B3F84    pop         esi
 005B3F85    pop         ebx
 005B3F86    mov         esp,ebp
 005B3F88    pop         ebp
 005B3F89    ret
*}
end;

//005B402C
function TIdIOHandler.ReadByte:Byte;
begin
{*
 005B402C    push        ebp
 005B402D    mov         ebp,esp
 005B402F    push        0
 005B4031    push        ebx
 005B4032    xor         edx,edx
 005B4034    push        ebp
 005B4035    push        5B4074
 005B403A    push        dword ptr fs:[edx]
 005B403D    mov         dword ptr fs:[edx],esp
 005B4040    push        0
 005B4042    lea         edx,[ebp-4]
 005B4045    mov         ecx,1
 005B404A    mov         ebx,dword ptr [eax]
 005B404C    call        dword ptr [ebx+0B4]
 005B4052    mov         eax,dword ptr [ebp-4]
 005B4055    movzx       ebx,byte ptr [eax]
 005B4058    xor         eax,eax
 005B405A    pop         edx
 005B405B    pop         ecx
 005B405C    pop         ecx
 005B405D    mov         dword ptr fs:[eax],edx
 005B4060    push        5B407B
 005B4065    lea         eax,[ebp-4]
 005B4068    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B406E    call        @DynArrayClear
 005B4073    ret
>005B4074    jmp         @HandleFinally
>005B4079    jmp         005B4065
 005B407B    mov         eax,ebx
 005B407D    pop         ebx
 005B407E    pop         ecx
 005B407F    pop         ebp
 005B4080    ret
*}
end;

//005B4084
function TIdIOHandler.ReadLongInt(AConvert:Boolean):Integer;
begin
{*
 005B4084    push        ebp
 005B4085    mov         ebp,esp
 005B4087    push        0
 005B4089    push        ebx
 005B408A    push        esi
 005B408B    mov         ebx,edx
 005B408D    xor         edx,edx
 005B408F    push        ebp
 005B4090    push        5B40E9
 005B4095    push        dword ptr fs:[edx]
 005B4098    mov         dword ptr fs:[edx],esp
 005B409B    push        0
 005B409D    lea         edx,[ebp-4]
 005B40A0    mov         ecx,4
 005B40A5    mov         esi,dword ptr [eax]
 005B40A7    call        dword ptr [esi+0B4]
 005B40AD    xor         edx,edx
 005B40AF    mov         eax,dword ptr [ebp-4]
 005B40B2    call        BytesToLongInt
 005B40B7    mov         esi,eax
 005B40B9    test        bl,bl
>005B40BB    je          005B40CD
 005B40BD    mov         eax,[0078D940];^gvar_00789ED0
 005B40C2    mov         eax,dword ptr [eax]
 005B40C4    mov         edx,esi
 005B40C6    mov         ecx,dword ptr [eax]
 005B40C8    call        dword ptr [ecx+58]
 005B40CB    mov         esi,eax
 005B40CD    xor         eax,eax
 005B40CF    pop         edx
 005B40D0    pop         ecx
 005B40D1    pop         ecx
 005B40D2    mov         dword ptr fs:[eax],edx
 005B40D5    push        5B40F0
 005B40DA    lea         eax,[ebp-4]
 005B40DD    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B40E3    call        @DynArrayClear
 005B40E8    ret
>005B40E9    jmp         @HandleFinally
>005B40EE    jmp         005B40DA
 005B40F0    mov         eax,esi
 005B40F2    pop         esi
 005B40F3    pop         ebx
 005B40F4    pop         ecx
 005B40F5    pop         ebp
 005B40F6    ret
*}
end;

//005B40F8
function TIdIOHandler.ReadInt64(AConvert:Boolean):Int64;
begin
{*
 005B40F8    push        ebp
 005B40F9    mov         ebp,esp
 005B40FB    add         esp,0FFFFFFF0
 005B40FE    push        ebx
 005B40FF    push        esi
 005B4100    xor         ecx,ecx
 005B4102    mov         dword ptr [ebp-4],ecx
 005B4105    mov         ebx,edx
 005B4107    xor         edx,edx
 005B4109    push        ebp
 005B410A    push        5B416F
 005B410F    push        dword ptr fs:[edx]
 005B4112    mov         dword ptr fs:[edx],esp
 005B4115    push        0
 005B4117    lea         edx,[ebp-4]
 005B411A    mov         ecx,8
 005B411F    mov         esi,dword ptr [eax]
 005B4121    call        dword ptr [esi+0B4]
 005B4127    xor         edx,edx
 005B4129    mov         eax,dword ptr [ebp-4]
 005B412C    call        BytesToInt64
 005B4131    mov         dword ptr [ebp-10],eax
 005B4134    mov         dword ptr [ebp-0C],edx
 005B4137    test        bl,bl
>005B4139    je          005B4153
 005B413B    push        dword ptr [ebp-0C]
 005B413E    push        dword ptr [ebp-10]
 005B4141    mov         eax,[0078D940];^gvar_00789ED0
 005B4146    mov         eax,dword ptr [eax]
 005B4148    mov         edx,dword ptr [eax]
 005B414A    call        dword ptr [edx+5C]
 005B414D    mov         dword ptr [ebp-10],eax
 005B4150    mov         dword ptr [ebp-0C],edx
 005B4153    xor         eax,eax
 005B4155    pop         edx
 005B4156    pop         ecx
 005B4157    pop         ecx
 005B4158    mov         dword ptr fs:[eax],edx
 005B415B    push        5B4176
 005B4160    lea         eax,[ebp-4]
 005B4163    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B4169    call        @DynArrayClear
 005B416E    ret
>005B416F    jmp         @HandleFinally
>005B4174    jmp         005B4160
 005B4176    mov         eax,dword ptr [ebp-10]
 005B4179    mov         edx,dword ptr [ebp-0C]
 005B417C    pop         esi
 005B417D    pop         ebx
 005B417E    mov         esp,ebp
 005B4180    pop         ebp
 005B4181    ret
*}
end;

//005B4184
function TIdIOHandler.ReadLongWord(AConvert:Boolean):Cardinal;
begin
{*
 005B4184    push        ebp
 005B4185    mov         ebp,esp
 005B4187    push        0
 005B4189    push        ebx
 005B418A    push        esi
 005B418B    mov         ebx,edx
 005B418D    xor         edx,edx
 005B418F    push        ebp
 005B4190    push        5B41E9
 005B4195    push        dword ptr fs:[edx]
 005B4198    mov         dword ptr fs:[edx],esp
 005B419B    push        0
 005B419D    lea         edx,[ebp-4]
 005B41A0    mov         ecx,4
 005B41A5    mov         esi,dword ptr [eax]
 005B41A7    call        dword ptr [esi+0B4]
 005B41AD    xor         edx,edx
 005B41AF    mov         eax,dword ptr [ebp-4]
 005B41B2    call        BytesToLongWord
 005B41B7    mov         esi,eax
 005B41B9    test        bl,bl
>005B41BB    je          005B41CD
 005B41BD    mov         eax,[0078D940];^gvar_00789ED0
 005B41C2    mov         eax,dword ptr [eax]
 005B41C4    mov         edx,esi
 005B41C6    mov         ecx,dword ptr [eax]
 005B41C8    call        dword ptr [ecx+58]
 005B41CB    mov         esi,eax
 005B41CD    xor         eax,eax
 005B41CF    pop         edx
 005B41D0    pop         ecx
 005B41D1    pop         ecx
 005B41D2    mov         dword ptr fs:[eax],edx
 005B41D5    push        5B41F0
 005B41DA    lea         eax,[ebp-4]
 005B41DD    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B41E3    call        @DynArrayClear
 005B41E8    ret
>005B41E9    jmp         @HandleFinally
>005B41EE    jmp         005B41DA
 005B41F0    mov         eax,esi
 005B41F2    pop         esi
 005B41F3    pop         ebx
 005B41F4    pop         ecx
 005B41F5    pop         ebp
 005B41F6    ret
*}
end;

//005B41F8
function TIdIOHandler.ReadLn(AByteEncoding:TEncoding):string;
begin
{*
 005B41F8    push        ebx
 005B41F9    push        esi
 005B41FA    push        edi
 005B41FB    mov         edi,ecx
 005B41FD    mov         esi,edx
 005B41FF    mov         ebx,eax
 005B4201    push        0FF
 005B4203    push        esi
 005B4204    push        edi
 005B4205    or          ecx,0FFFFFFFF
 005B4208    mov         edx,5B4228;'
'
 005B420D    mov         eax,ebx
 005B420F    mov         ebx,dword ptr [eax]
 005B4211    call        dword ptr [ebx+0B8]
 005B4217    pop         edi
 005B4218    pop         esi
 005B4219    pop         ebx
 005B421A    ret
*}
end;

//005B422C
function TIdIOHandler.ReadLn(ATerminator:string; AByteEncoding:TEncoding):string;
begin
{*
 005B422C    push        ebp
 005B422D    mov         ebp,esp
 005B422F    push        ecx
 005B4230    push        ebx
 005B4231    push        esi
 005B4232    mov         esi,ecx
 005B4234    mov         dword ptr [ebp-4],edx
 005B4237    mov         ebx,eax
 005B4239    mov         eax,dword ptr [ebp-4]
 005B423C    call        @UStrAddRef
 005B4241    xor         eax,eax
 005B4243    push        ebp
 005B4244    push        5B427C
 005B4249    push        dword ptr fs:[eax]
 005B424C    mov         dword ptr fs:[eax],esp
 005B424F    push        0FF
 005B4251    push        esi
 005B4252    mov         eax,dword ptr [ebp+8]
 005B4255    push        eax
 005B4256    or          ecx,0FFFFFFFF
 005B4259    mov         edx,dword ptr [ebp-4]
 005B425C    mov         eax,ebx
 005B425E    mov         ebx,dword ptr [eax]
 005B4260    call        dword ptr [ebx+0B8]
 005B4266    xor         eax,eax
 005B4268    pop         edx
 005B4269    pop         ecx
 005B426A    pop         ecx
 005B426B    mov         dword ptr fs:[eax],edx
 005B426E    push        5B4283
 005B4273    lea         eax,[ebp-4]
 005B4276    call        @UStrClr
 005B427B    ret
>005B427C    jmp         @HandleFinally
>005B4281    jmp         005B4273
 005B4283    pop         esi
 005B4284    pop         ebx
 005B4285    pop         ecx
 005B4286    pop         ebp
 005B4287    ret         4
*}
end;

//005B428C
function TIdIOHandler.ReadLn(ATerminator:string; ATimeout:Integer; AByteEncoding:TEncoding; AMaxLineLength:Integer):string;
begin
{*
 005B428C    push        ebp
 005B428D    mov         ebp,esp
 005B428F    add         esp,0FFFFFFE4
 005B4292    push        ebx
 005B4293    push        esi
 005B4294    push        edi
 005B4295    xor         ebx,ebx
 005B4297    mov         dword ptr [ebp-1C],ebx
 005B429A    mov         dword ptr [ebp-8],ebx
 005B429D    mov         dword ptr [ebp-0C],ebx
 005B42A0    mov         dword ptr [ebp-10],ecx
 005B42A3    mov         dword ptr [ebp-4],edx
 005B42A6    mov         ebx,eax
 005B42A8    mov         eax,dword ptr [ebp-4]
 005B42AB    call        @UStrAddRef
 005B42B0    xor         eax,eax
 005B42B2    push        ebp
 005B42B3    push        5B44A4
 005B42B8    push        dword ptr fs:[eax]
 005B42BB    mov         dword ptr fs:[eax],esp
 005B42BE    mov         cl,1
 005B42C0    mov         edx,dword ptr [ebx+0D4]
 005B42C6    mov         eax,dword ptr [ebp+0C]
 005B42C9    call        iif
 005B42CE    mov         dword ptr [ebp+0C],eax
 005B42D1    cmp         dword ptr [ebp+10],0
>005B42D5    jge         005B42E0
 005B42D7    mov         eax,dword ptr [ebx+0B0]
 005B42DD    mov         dword ptr [ebp+10],eax
 005B42E0    cmp         dword ptr [ebp-4],0
>005B42E4    jne         005B42F3
 005B42E6    lea         eax,[ebp-4]
 005B42E9    mov         edx,5B44C0;'
'
 005B42EE    call        @UStrLAsg
 005B42F3    lea         ecx,[ebp-8]
 005B42F6    mov         edx,dword ptr [ebp+0C]
 005B42F9    mov         eax,dword ptr [ebp-4]
 005B42FC    call        ToBytes
 005B4301    mov         byte ptr [ebx+0BC],0
 005B4308    mov         byte ptr [ebx+0BD],0
 005B430F    or          esi,0FFFFFFFF
 005B4312    xor         eax,eax
 005B4314    mov         dword ptr [ebp-14],eax
 005B4317    call        Ticks
 005B431C    mov         dword ptr [ebp-18],eax
 005B431F    mov         eax,dword ptr [ebx+0A0]
 005B4325    mov         edi,dword ptr [eax+20]
 005B4328    test        edi,edi
>005B432A    jle         005B435C
 005B432C    cmp         edi,dword ptr [ebp-14]
>005B432F    jle         005B4340
 005B4331    mov         ecx,dword ptr [ebp-14]
 005B4334    mov         edx,dword ptr [ebp-8]
 005B4337    call        TIdBuffer.IndexOf
 005B433C    mov         esi,eax
>005B433E    jmp         005B4343
 005B4340    or          esi,0FFFFFFFF
 005B4343    mov         eax,dword ptr [ebp-8]
 005B4346    call        @DynArrayLength
 005B434B    dec         eax
 005B434C    push        eax
 005B434D    mov         eax,edi
 005B434F    pop         edx
 005B4350    sub         eax,edx
 005B4352    xor         edx,edx
 005B4354    call        IndyMax
 005B4359    mov         dword ptr [ebp-14],eax
 005B435C    cmp         dword ptr [ebp+10],0
>005B4360    jle         005B43AB
 005B4362    cmp         esi,dword ptr [ebp+10]
>005B4365    jle         005B43AB
 005B4367    cmp         byte ptr [ebx+0AC],0
>005B436E    jne         005B438A
 005B4370    lea         edx,[ebp-1C]
 005B4373    mov         eax,[0078D0A4];^SResString690:TResStringRec
 005B4378    call        LoadResString
 005B437D    mov         edx,dword ptr [ebp-1C]
 005B4380    mov         eax,[005AF778];EIdReadLnMaxLineLengthExceeded
 005B4385    call        EIdException.Toss
 005B438A    mov         byte ptr [ebx+0BC],1
 005B4391    mov         eax,dword ptr [ebp+8]
 005B4394    push        eax
 005B4395    mov         ecx,dword ptr [ebp+0C]
 005B4398    mov         edx,dword ptr [ebp+10]
 005B439B    mov         eax,dword ptr [ebx+0A0]
 005B43A1    call        TIdBuffer.ExtractToString
>005B43A6    jmp         005B4473
 005B43AB    cmp         esi,0FFFFFFFF
>005B43AE    jne         005B4416
 005B43B0    mov         cl,1
 005B43B2    mov         dl,1
 005B43B4    mov         eax,ebx
 005B43B6    mov         edi,dword ptr [eax]
 005B43B8    call        dword ptr [edi+78]
 005B43BB    cmp         dword ptr [ebp-10],0FFFFFFFF
 005B43BF    sete        al
 005B43C2    push        eax
 005B43C3    mov         ecx,dword ptr [ebp-10]
 005B43C6    mov         dl,1
 005B43C8    mov         eax,ebx
 005B43CA    call        TIdIOHandler.ReadFromSource
 005B43CF    inc         eax
 005B43D0    sete        al
 005B43D3    mov         byte ptr [ebx+0BD],al
 005B43D9    cmp         byte ptr [ebx+0BD],0
>005B43E0    jne         005B4403
 005B43E2    cmp         dword ptr [ebp-10],0
>005B43E6    jl          005B4403
 005B43E8    call        Ticks
 005B43ED    mov         edx,eax
 005B43EF    mov         eax,dword ptr [ebp-18]
 005B43F2    call        GetTickDiff
 005B43F7    cmp         eax,dword ptr [ebp-10]
>005B43FA    jb          005B4403
 005B43FC    mov         byte ptr [ebx+0BD],1
 005B4403    cmp         byte ptr [ebx+0BD],0
>005B440A    je          005B4416
 005B440C    mov         eax,dword ptr [ebp+8]
 005B440F    call        @UStrClr
>005B4414    jmp         005B4473
 005B4416    cmp         esi,0FFFFFFFF
>005B4419    jle         005B431F
 005B441F    push        1
 005B4421    push        0FF
 005B4423    mov         eax,dword ptr [ebp-8]
 005B4426    call        @DynArrayLength
 005B442B    mov         ecx,eax
 005B442D    add         ecx,esi
 005B442F    lea         edx,[ebp-0C]
 005B4432    mov         eax,dword ptr [ebx+0A0]
 005B4438    call        TIdBuffer.ExtractToBytes
 005B443D    mov         eax,dword ptr [ebp-4]
 005B4440    mov         edx,5B44C0;'
'
 005B4445    call        @UStrEqual
>005B444A    jne         005B445F
 005B444C    test        esi,esi
>005B444E    jle         005B445F
 005B4450    mov         eax,dword ptr [ebp-0C]
 005B4453    movzx       eax,byte ptr [eax+esi-1]
 005B4458    cmp         ax,0D
>005B445C    jne         005B445F
 005B445E    dec         esi
 005B445F    mov         eax,dword ptr [ebp+0C]
 005B4462    push        eax
 005B4463    mov         eax,dword ptr [ebp+8]
 005B4466    push        eax
 005B4467    mov         ecx,esi
 005B4469    xor         edx,edx
 005B446B    mov         eax,dword ptr [ebp-0C]
 005B446E    call        BytesToString
 005B4473    xor         eax,eax
 005B4475    pop         edx
 005B4476    pop         ecx
 005B4477    pop         ecx
 005B4478    mov         dword ptr fs:[eax],edx
 005B447B    push        5B44AB
 005B4480    lea         eax,[ebp-1C]
 005B4483    call        @UStrClr
 005B4488    lea         eax,[ebp-0C]
 005B448B    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B4491    mov         ecx,2
 005B4496    call        @FinalizeArray
 005B449B    lea         eax,[ebp-4]
 005B449E    call        @UStrClr
 005B44A3    ret
>005B44A4    jmp         @HandleFinally
>005B44A9    jmp         005B4480
 005B44AB    pop         edi
 005B44AC    pop         esi
 005B44AD    pop         ebx
 005B44AE    mov         esp,ebp
 005B44B0    pop         ebp
 005B44B1    ret         0C
*}
end;

//005B44C4
function TIdIOHandler.ReadLnRFC(var VMsgEnd:Boolean; AByteEncoding:TEncoding):string;
begin
{*
 005B44C4    push        ebp
 005B44C5    mov         ebp,esp
 005B44C7    push        ebx
 005B44C8    push        esi
 005B44C9    push        edi
 005B44CA    mov         edi,ecx
 005B44CC    mov         esi,edx
 005B44CE    mov         ebx,eax
 005B44D0    push        5B44FC;'.'
 005B44D5    push        edi
 005B44D6    mov         eax,dword ptr [ebp+8]
 005B44D9    push        eax
 005B44DA    mov         edx,esi
 005B44DC    mov         ecx,5B450C;'
'
 005B44E1    mov         eax,ebx
 005B44E3    call        TIdIOHandler.ReadLnRFC
 005B44E8    pop         edi
 005B44E9    pop         esi
 005B44EA    pop         ebx
 005B44EB    pop         ebp
 005B44EC    ret         4
*}
end;

//005B4510
function TIdIOHandler.ReadLnRFC(var VMsgEnd:Boolean; ALineTerminator:string; AByteEncoding:TEncoding; ADelim:string):string;
begin
{*
 005B4510    push        ebp
 005B4511    mov         ebp,esp
 005B4513    push        ecx
 005B4514    push        ebx
 005B4515    push        esi
 005B4516    push        edi
 005B4517    mov         dword ptr [ebp-4],ecx
 005B451A    mov         edi,edx
 005B451C    mov         esi,eax
 005B451E    mov         ebx,dword ptr [ebp+8]
 005B4521    push        ebx
 005B4522    mov         ecx,dword ptr [ebp+0C]
 005B4525    mov         edx,dword ptr [ebp-4]
 005B4528    mov         eax,esi
 005B452A    call        TIdIOHandler.ReadLn
 005B452F    mov         eax,dword ptr [ebx]
 005B4531    mov         edx,dword ptr [ebp+10]
 005B4534    call        @UStrEqual
>005B4539    jne         005B4540
 005B453B    mov         byte ptr [edi],1
>005B453E    jmp         005B4564
 005B4540    mov         eax,dword ptr [ebx]
 005B4542    mov         edx,5B4578;'.'
 005B4547    call        TextStartsWith
 005B454C    test        al,al
>005B454E    je          005B4561
 005B4550    mov         eax,ebx
 005B4552    mov         ecx,1
 005B4557    mov         edx,1
 005B455C    call        @UStrDelete
 005B4561    mov         byte ptr [edi],0
 005B4564    pop         edi
 005B4565    pop         esi
 005B4566    pop         ebx
 005B4567    pop         ecx
 005B4568    pop         ebp
 005B4569    ret         0C
*}
end;

//005B457C
function TIdIOHandler.ReadLnSplit(var AWasSplit:Boolean; ATerminator:string; AByteEncoding:TEncoding; AMaxLineLength:Integer; ATimeout:Integer):string;
begin
{*
 005B457C    push        ebp
 005B457D    mov         ebp,esp
 005B457F    add         esp,0FFFFFFF4
 005B4582    push        ebx
 005B4583    push        esi
 005B4584    mov         dword ptr [ebp-4],ecx
 005B4587    mov         ebx,edx
 005B4589    mov         dword ptr [ebp-8],eax
 005B458C    mov         eax,dword ptr [ebp-4]
 005B458F    call        @UStrAddRef
 005B4594    xor         eax,eax
 005B4596    push        ebp
 005B4597    push        5B4628
 005B459C    push        dword ptr fs:[eax]
 005B459F    mov         dword ptr fs:[eax],esp
 005B45A2    mov         eax,dword ptr [ebp-8]
 005B45A5    movzx       eax,byte ptr [eax+0AC]
 005B45AC    mov         byte ptr [ebp-9],al
 005B45AF    mov         eax,dword ptr [ebp-8]
 005B45B2    mov         byte ptr [eax+0AC],1
 005B45B9    xor         eax,eax
 005B45BB    push        ebp
 005B45BC    push        5B460B
 005B45C1    push        dword ptr fs:[eax]
 005B45C4    mov         dword ptr fs:[eax],esp
 005B45C7    mov         eax,dword ptr [ebp+10]
 005B45CA    push        eax
 005B45CB    mov         eax,dword ptr [ebp+0C]
 005B45CE    push        eax
 005B45CF    mov         eax,dword ptr [ebp+8]
 005B45D2    push        eax
 005B45D3    mov         ecx,dword ptr [ebp+14]
 005B45D6    mov         edx,dword ptr [ebp-4]
 005B45D9    mov         eax,dword ptr [ebp-8]
 005B45DC    mov         esi,dword ptr [eax]
 005B45DE    call        dword ptr [esi+0B8]
 005B45E4    mov         eax,dword ptr [ebp-8]
 005B45E7    movzx       eax,byte ptr [eax+0BC]
 005B45EE    mov         byte ptr [ebx],al
 005B45F0    xor         eax,eax
 005B45F2    pop         edx
 005B45F3    pop         ecx
 005B45F4    pop         ecx
 005B45F5    mov         dword ptr fs:[eax],edx
 005B45F8    push        5B4612
 005B45FD    mov         eax,dword ptr [ebp-8]
 005B4600    movzx       edx,byte ptr [ebp-9]
 005B4604    mov         byte ptr [eax+0AC],dl
 005B460A    ret
>005B460B    jmp         @HandleFinally
>005B4610    jmp         005B45FD
 005B4612    xor         eax,eax
 005B4614    pop         edx
 005B4615    pop         ecx
 005B4616    pop         ecx
 005B4617    mov         dword ptr fs:[eax],edx
 005B461A    push        5B462F
 005B461F    lea         eax,[ebp-4]
 005B4622    call        @UStrClr
 005B4627    ret
>005B4628    jmp         @HandleFinally
>005B462D    jmp         005B461F
 005B462F    pop         esi
 005B4630    pop         ebx
 005B4631    mov         esp,ebp
 005B4633    pop         ebp
 005B4634    ret         10
*}
end;

//005B4638
function TIdIOHandler.ReadLnWait(AFailCount:Integer; AByteEncoding:TEncoding):string;
begin
{*
 005B4638    push        ebp
 005B4639    mov         ebp,esp
 005B463B    add         esp,0FFFFFFE4
 005B463E    push        ebx
 005B463F    push        esi
 005B4640    push        edi
 005B4641    xor         ebx,ebx
 005B4643    mov         dword ptr [ebp-1C],ebx
 005B4646    mov         dword ptr [ebp-18],ebx
 005B4649    mov         dword ptr [ebp-14],ebx
 005B464C    mov         dword ptr [ebp-8],ecx
 005B464F    mov         dword ptr [ebp-4],edx
 005B4652    mov         esi,eax
 005B4654    mov         edi,dword ptr [ebp+8]
 005B4657    xor         eax,eax
 005B4659    push        ebp
 005B465A    push        5B4729
 005B465F    push        dword ptr fs:[eax]
 005B4662    mov         dword ptr fs:[eax],esp
 005B4665    mov         cl,1
 005B4667    mov         edx,dword ptr [esi+0D4]
 005B466D    mov         eax,dword ptr [ebp-8]
 005B4670    call        iif
 005B4675    mov         dword ptr [ebp-8],eax
 005B4678    mov         eax,edi
 005B467A    call        @UStrClr
 005B467F    xor         eax,eax
 005B4681    mov         dword ptr [ebp-0C],eax
 005B4684    mov         eax,dword ptr [ebp-0C]
 005B4687    cmp         eax,dword ptr [ebp-4]
>005B468A    jge         005B46ED
 005B468C    lea         ecx,[ebp-14]
 005B468F    mov         edx,dword ptr [ebp-8]
 005B4692    mov         eax,esi
 005B4694    call        TIdIOHandler.ReadLn
 005B4699    mov         eax,dword ptr [ebp-14]
 005B469C    mov         edx,edi
 005B469E    call        Trim
 005B46A3    mov         eax,dword ptr [edi]
 005B46A5    mov         dword ptr [ebp-10],eax
 005B46A8    mov         ebx,dword ptr [ebp-10]
 005B46AB    test        ebx,ebx
>005B46AD    je          005B46B4
 005B46AF    sub         ebx,4
 005B46B2    mov         ebx,dword ptr [ebx]
 005B46B4    test        ebx,ebx
>005B46B6    jg          005B470E
 005B46B8    cmp         byte ptr [esi+0BD],0
>005B46BF    je          005B46E2
 005B46C1    lea         edx,[ebp-18]
 005B46C4    mov         eax,[0078CD18];^SResString688:TResStringRec
 005B46C9    call        LoadResString
 005B46CE    mov         ecx,dword ptr [ebp-18]
 005B46D1    mov         dl,1
 005B46D3    mov         eax,[005AF6D0];EIdReadTimeout
 005B46D8    call        EIdException.Create
 005B46DD    call        @RaiseExcept
 005B46E2    inc         dword ptr [ebp-0C]
 005B46E5    mov         eax,dword ptr [ebp-0C]
 005B46E8    cmp         eax,dword ptr [ebp-4]
>005B46EB    jl          005B468C
 005B46ED    lea         edx,[ebp-1C]
 005B46F0    mov         eax,[0078CE38];^SResString689:TResStringRec
 005B46F5    call        LoadResString
 005B46FA    mov         ecx,dword ptr [ebp-1C]
 005B46FD    mov         dl,1
 005B46FF    mov         eax,[005AF840];EIdReadLnWaitMaxAttemptsExceeded
 005B4704    call        EIdException.Create
 005B4709    call        @RaiseExcept
 005B470E    xor         eax,eax
 005B4710    pop         edx
 005B4711    pop         ecx
 005B4712    pop         ecx
 005B4713    mov         dword ptr fs:[eax],edx
 005B4716    push        5B4730
 005B471B    lea         eax,[ebp-1C]
 005B471E    mov         edx,3
 005B4723    call        @UStrArrayClr
 005B4728    ret
>005B4729    jmp         @HandleFinally
>005B472E    jmp         005B471B
 005B4730    pop         edi
 005B4731    pop         esi
 005B4732    pop         ebx
 005B4733    mov         esp,ebp
 005B4735    pop         ebp
 005B4736    ret         4
*}
end;

//005B473C
function TIdIOHandler.ReadFromSource(ARaiseExceptionIfDisconnected:Boolean; ATimeout:Integer; ARaiseExceptionOnTimeout:Boolean):Integer;
begin
{*
 005B473C    push        ebp
 005B473D    mov         ebp,esp
 005B473F    push        ecx
 005B4740    mov         ecx,4
 005B4745    push        0
 005B4747    push        0
 005B4749    dec         ecx
>005B474A    jne         005B4745
 005B474C    xchg        ecx,dword ptr [ebp-4]
 005B474F    push        ebx
 005B4750    push        esi
 005B4751    mov         dword ptr [ebp-10],ecx
 005B4754    mov         byte ptr [ebp-9],dl
 005B4757    mov         dword ptr [ebp-8],eax
 005B475A    xor         eax,eax
 005B475C    push        ebp
 005B475D    push        5B49D2
 005B4762    push        dword ptr fs:[eax]
 005B4765    mov         dword ptr fs:[eax],esp
 005B4768    cmp         dword ptr [ebp-10],0FFFFFFFF
>005B476C    jne         005B478C
 005B476E    mov         eax,dword ptr [ebp-8]
 005B4771    mov         eax,dword ptr [eax+0C0]
 005B4777    cmp         eax,0FFFFFFFF
>005B477A    je          005B4780
 005B477C    test        eax,eax
>005B477E    jne         005B4789
 005B4780    mov         dword ptr [ebp-10],0FFFFFFFE
>005B4787    jmp         005B478C
 005B4789    mov         dword ptr [ebp-10],eax
 005B478C    xor         ebx,ebx
 005B478E    xor         ecx,ecx
 005B4790    movzx       edx,byte ptr [ebp-9]
 005B4794    mov         eax,dword ptr [ebp-8]
 005B4797    mov         esi,dword ptr [eax]
 005B4799    call        dword ptr [esi+78]
 005B479C    mov         eax,dword ptr [ebp-8]
 005B479F    mov         edx,dword ptr [eax]
 005B47A1    call        dword ptr [edx+64]
 005B47A4    test        al,al
>005B47A6    je          005B4982
 005B47AC    xor         eax,eax
 005B47AE    mov         dword ptr [ebp-14],eax
 005B47B1    mov         edx,dword ptr [ebp-10]
 005B47B4    mov         eax,dword ptr [ebp-8]
 005B47B7    mov         ecx,dword ptr [eax]
 005B47B9    call        dword ptr [ecx+90]
 005B47BF    test        al,al
>005B47C1    je          005B4945
 005B47C7    mov         eax,dword ptr [ebp-8]
 005B47CA    cmp         byte ptr [eax+0B4],0
>005B47D1    je          005B48BC
 005B47D7    mov         eax,dword ptr [ebp-8]
 005B47DA    mov         edx,dword ptr [eax]
 005B47DC    call        dword ptr [edx+64]
 005B47DF    test        al,al
>005B47E1    je          005B489A
 005B47E7    mov         eax,dword ptr [ebp-8]
 005B47EA    mov         eax,dword ptr [eax+0C4]
 005B47F0    push        eax
 005B47F1    lea         eax,[ebp-4]
 005B47F4    mov         ecx,1
 005B47F9    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B47FF    call        @DynArraySetLength
 005B4804    add         esp,4
 005B4807    xor         edx,edx
 005B4809    push        ebp
 005B480A    push        5B4893
 005B480F    push        dword ptr fs:[edx]
 005B4812    mov         dword ptr fs:[edx],esp
 005B4815    lea         edx,[ebp-4]
 005B4818    mov         eax,dword ptr [ebp-8]
 005B481B    mov         ecx,dword ptr [eax]
 005B481D    call        dword ptr [ecx+5C]
 005B4820    mov         dword ptr [ebp-14],eax
 005B4823    cmp         dword ptr [ebp-14],0
>005B4827    jle         005B4877
 005B4829    mov         eax,dword ptr [ebp-14]
 005B482C    push        eax
 005B482D    lea         eax,[ebp-4]
 005B4830    mov         ecx,1
 005B4835    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B483B    call        @DynArraySetLength
 005B4840    add         esp,4
 005B4843    mov         eax,dword ptr [ebp-8]
 005B4846    mov         eax,dword ptr [eax+0A4]
 005B484C    test        eax,eax
>005B484E    je          005B4863
 005B4850    lea         edx,[ebp-4]
 005B4853    mov         ecx,dword ptr [eax]
 005B4855    call        dword ptr [ecx+40]
 005B4858    mov         eax,dword ptr [ebp-4]
 005B485B    call        @DynArrayLength
 005B4860    mov         dword ptr [ebp-14],eax
 005B4863    mov         eax,dword ptr [ebp-8]
 005B4866    mov         eax,dword ptr [eax+0A0]
 005B486C    or          ecx,0FFFFFFFF
 005B486F    mov         edx,dword ptr [ebp-4]
 005B4872    call        TIdBuffer.Write
 005B4877    xor         eax,eax
 005B4879    pop         edx
 005B487A    pop         ecx
 005B487B    pop         ecx
 005B487C    mov         dword ptr fs:[eax],edx
 005B487F    push        5B48DC
 005B4884    lea         eax,[ebp-4]
 005B4887    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B488D    call        @DynArrayClear
 005B4892    ret
>005B4893    jmp         @HandleFinally
>005B4898    jmp         005B4884
 005B489A    cmp         byte ptr [ebp-9],0
>005B489E    je          005B48DC
 005B48A0    lea         edx,[ebp-18]
 005B48A3    mov         eax,[0078D2A4];^SResString608:TResStringRec
 005B48A8    call        LoadResString
 005B48AD    mov         edx,dword ptr [ebp-18]
 005B48B0    mov         eax,[005AF624];EIdClosedSocket
 005B48B5    call        EIdException.Toss
>005B48BA    jmp         005B48DC
 005B48BC    cmp         byte ptr [ebp-9],0
>005B48C0    je          005B48DC
 005B48C2    lea         edx,[ebp-1C]
 005B48C5    mov         eax,[0078D0C4];^SResString685:TResStringRec
 005B48CA    call        LoadResString
 005B48CF    mov         edx,dword ptr [ebp-1C]
 005B48D2    mov         eax,[005AFD38];EIdNotConnected
 005B48D7    call        EIdException.Toss
 005B48DC    cmp         dword ptr [ebp-14],0
>005B48E0    jge         005B4922
 005B48E2    mov         edx,dword ptr [ebp-14]
 005B48E5    mov         eax,dword ptr [ebp-8]
 005B48E8    mov         ecx,dword ptr [eax]
 005B48EA    call        dword ptr [ecx+68]
 005B48ED    mov         ebx,eax
 005B48EF    mov         eax,dword ptr [ebp-8]
 005B48F2    mov         byte ptr [eax+91],1
 005B48F9    mov         eax,dword ptr [ebp-8]
 005B48FC    mov         edx,dword ptr [eax]
 005B48FE    call        dword ptr [edx+80]
 005B4904    mov         eax,dword ptr [ebp-8]
 005B4907    call        TIdIOHandler.InputBufferIsEmpty
 005B490C    and         al,byte ptr [ebp-9]
>005B490F    je          005B491B
 005B4911    mov         edx,ebx
 005B4913    mov         eax,dword ptr [ebp-8]
 005B4916    mov         ecx,dword ptr [eax]
 005B4918    call        dword ptr [ecx+6C]
 005B491B    xor         eax,eax
 005B491D    mov         dword ptr [ebp-14],eax
>005B4920    jmp         005B4932
 005B4922    cmp         dword ptr [ebp-14],0
>005B4926    jne         005B4932
 005B4928    mov         eax,dword ptr [ebp-8]
 005B492B    mov         byte ptr [eax+91],1
 005B4932    xor         ecx,ecx
 005B4934    movzx       edx,byte ptr [ebp-9]
 005B4938    mov         eax,dword ptr [ebp-8]
 005B493B    mov         ebx,dword ptr [eax]
 005B493D    call        dword ptr [ebx+78]
 005B4940    mov         ebx,dword ptr [ebp-14]
>005B4943    jmp         005B496A
 005B4945    cmp         byte ptr [ebp+8],0
>005B4949    je          005B4965
 005B494B    lea         edx,[ebp-20]
 005B494E    mov         eax,[0078CD18];^SResString688:TResStringRec
 005B4953    call        LoadResString
 005B4958    mov         edx,dword ptr [ebp-20]
 005B495B    mov         eax,[005AF6D0];EIdReadTimeout
 005B4960    call        EIdException.Toss
 005B4965    or          ebx,0FFFFFFFF
>005B4968    jmp         005B49A9
 005B496A    cmp         dword ptr [ebp-14],0
>005B496E    jne         005B49A9
 005B4970    mov         eax,dword ptr [ebp-8]
 005B4973    mov         edx,dword ptr [eax]
 005B4975    call        dword ptr [edx+64]
 005B4978    test        al,al
>005B497A    jne         005B47AC
>005B4980    jmp         005B49A9
 005B4982    cmp         byte ptr [ebp-9],0
>005B4986    je          005B49A9
 005B4988    lea         edx,[ebp-24]
 005B498B    mov         eax,[0078D0C4];^SResString685:TResStringRec
 005B4990    call        LoadResString
 005B4995    mov         ecx,dword ptr [ebp-24]
 005B4998    mov         dl,1
 005B499A    mov         eax,[005961F8];EIdException
 005B499F    call        EIdException.Create
 005B49A4    call        @RaiseExcept
 005B49A9    xor         eax,eax
 005B49AB    pop         edx
 005B49AC    pop         ecx
 005B49AD    pop         ecx
 005B49AE    mov         dword ptr fs:[eax],edx
 005B49B1    push        5B49D9
 005B49B6    lea         eax,[ebp-24]
 005B49B9    mov         edx,4
 005B49BE    call        @UStrArrayClr
 005B49C3    lea         eax,[ebp-4]
 005B49C6    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B49CC    call        @DynArrayClear
 005B49D1    ret
>005B49D2    jmp         @HandleFinally
>005B49D7    jmp         005B49B6
 005B49D9    mov         eax,ebx
 005B49DB    pop         esi
 005B49DC    pop         ebx
 005B49DD    mov         esp,ebp
 005B49DF    pop         ebp
 005B49E0    ret         4
*}
end;

//005B49E4
function TIdIOHandler.CheckForDataOnSource(ATimeout:Integer):Boolean;
begin
{*
 005B49E4    push        ebx
 005B49E5    push        esi
 005B49E6    push        edi
 005B49E7    push        ebp
 005B49E8    mov         ebp,edx
 005B49EA    mov         esi,eax
 005B49EC    xor         ebx,ebx
 005B49EE    mov         eax,dword ptr [esi+0A0]
 005B49F4    mov         edi,dword ptr [eax+20]
 005B49F7    mov         eax,esi
 005B49F9    mov         edx,dword ptr [eax]
 005B49FB    call        dword ptr [edx+74]
 005B49FE    test        al,al
>005B4A00    je          005B4A24
 005B4A02    mov         eax,dword ptr [esi+0A0]
 005B4A08    cmp         edi,dword ptr [eax+20]
>005B4A0B    jl          005B4A22
 005B4A0D    push        0
 005B4A0F    mov         ecx,ebp
 005B4A11    xor         edx,edx
 005B4A13    mov         eax,esi
 005B4A15    call        TIdIOHandler.ReadFromSource
 005B4A1A    test        eax,eax
>005B4A1C    jg          005B4A22
 005B4A1E    xor         ebx,ebx
>005B4A20    jmp         005B4A24
 005B4A22    mov         bl,1
 005B4A24    mov         eax,ebx
 005B4A26    pop         ebp
 005B4A27    pop         edi
 005B4A28    pop         esi
 005B4A29    pop         ebx
 005B4A2A    ret
*}
end;

//005B4A2C
procedure TIdIOHandler.Write(AStream:TStream; AWriteByteCount:Boolean; ASize:Int64);
begin
{*
 005B4A2C    push        ebp
 005B4A2D    mov         ebp,esp
 005B4A2F    add         esp,0FFFFFFE8
 005B4A32    push        ebx
 005B4A33    push        esi
 005B4A34    push        edi
 005B4A35    xor         ebx,ebx
 005B4A37    mov         dword ptr [ebp-18],ebx
 005B4A3A    mov         dword ptr [ebp-14],ebx
 005B4A3D    mov         dword ptr [ebp-4],ebx
 005B4A40    mov         ebx,ecx
 005B4A42    mov         esi,edx
 005B4A44    mov         dword ptr [ebp-8],eax
 005B4A47    xor         eax,eax
 005B4A49    push        ebp
 005B4A4A    push        5B4C56
 005B4A4F    push        dword ptr fs:[eax]
 005B4A52    mov         dword ptr fs:[eax],esp
 005B4A55    cmp         dword ptr [ebp+0C],0
>005B4A59    jne         005B4A63
 005B4A5B    cmp         dword ptr [ebp+8],0
>005B4A5F    jae         005B4A93
>005B4A61    jmp         005B4A65
>005B4A63    jge         005B4A93
 005B4A65    mov         eax,esi
 005B4A67    call        TStream.GetPosition
 005B4A6C    mov         dword ptr [ebp-10],eax
 005B4A6F    mov         dword ptr [ebp-0C],edx
 005B4A72    mov         eax,esi
 005B4A74    mov         edx,dword ptr [eax]
 005B4A76    call        dword ptr [edx]
 005B4A78    sub         eax,dword ptr [ebp-10]
 005B4A7B    sbb         edx,dword ptr [ebp-0C]
 005B4A7E    mov         dword ptr [ebp+8],eax
 005B4A81    mov         dword ptr [ebp+0C],edx
 005B4A84    push        dword ptr [ebp-0C]
 005B4A87    push        dword ptr [ebp-10]
 005B4A8A    mov         eax,esi
 005B4A8C    call        TStream.SetPosition
>005B4A91    jmp         005B4AB6
 005B4A93    cmp         dword ptr [ebp+0C],0
>005B4A97    jne         005B4AB6
 005B4A99    cmp         dword ptr [ebp+8],0
>005B4A9D    jne         005B4AB6
 005B4A9F    mov         eax,esi
 005B4AA1    mov         edx,dword ptr [eax]
 005B4AA3    call        dword ptr [edx]
 005B4AA5    mov         dword ptr [ebp+8],eax
 005B4AA8    mov         dword ptr [ebp+0C],edx
 005B4AAB    push        0
 005B4AAD    push        0
 005B4AAF    mov         eax,esi
 005B4AB1    call        TStream.SetPosition
 005B4AB6    cmp         dword ptr [ebp+0C],0
>005B4ABA    jne         005B4AC7
 005B4ABC    cmp         dword ptr [ebp+8],7FFFFFFF
>005B4AC3    jbe         005B4AEF
>005B4AC5    jmp         005B4AC9
>005B4AC7    jle         005B4AEF
 005B4AC9    mov         eax,dword ptr [ebp-8]
 005B4ACC    cmp         byte ptr [eax+90],0
>005B4AD3    jne         005B4AEF
 005B4AD5    lea         edx,[ebp-14]
 005B4AD8    mov         eax,[0078D0F4];^SResString691:TResStringRec
 005B4ADD    call        LoadResString
 005B4AE2    mov         edx,dword ptr [ebp-14]
 005B4AE5    mov         eax,[005B1438];EIdIOHandlerRequiresLargeStream
 005B4AEA    call        EIdException.Toss
 005B4AEF    test        bl,bl
>005B4AF1    je          005B4B20
 005B4AF3    mov         eax,dword ptr [ebp-8]
 005B4AF6    cmp         byte ptr [eax+90],0
>005B4AFD    je          005B4B11
 005B4AFF    push        dword ptr [ebp+0C]
 005B4B02    push        dword ptr [ebp+8]
 005B4B05    mov         dl,1
 005B4B07    mov         eax,dword ptr [ebp-8]
 005B4B0A    call        TIdIOHandler.Write
>005B4B0F    jmp         005B4B20
 005B4B11    mov         eax,dword ptr [ebp+8]
 005B4B14    mov         edx,eax
 005B4B16    mov         cl,1
 005B4B18    mov         eax,dword ptr [ebp-8]
 005B4B1B    call        TIdIOHandler.Write
 005B4B20    push        dword ptr [ebp+0C]
 005B4B23    push        dword ptr [ebp+8]
 005B4B26    mov         dl,1
 005B4B28    mov         eax,dword ptr [ebp-8]
 005B4B2B    mov         ecx,dword ptr [eax]
 005B4B2D    call        dword ptr [ecx+38]
 005B4B30    xor         eax,eax
 005B4B32    push        ebp
 005B4B33    push        5B4C26
 005B4B38    push        dword ptr fs:[eax]
 005B4B3B    mov         dword ptr fs:[eax],esp
>005B4B3E    jmp         005B4BE8
 005B4B43    mov         eax,dword ptr [ebp-8]
 005B4B46    mov         eax,dword ptr [eax+0C8]
 005B4B4C    push        eax
 005B4B4D    lea         eax,[ebp-4]
 005B4B50    mov         ecx,1
 005B4B55    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B4B5B    call        @DynArraySetLength
 005B4B60    add         esp,4
 005B4B63    push        dword ptr [ebp+0C]
 005B4B66    push        dword ptr [ebp+8]
 005B4B69    mov         eax,dword ptr [ebp-8]
 005B4B6C    mov         eax,dword ptr [eax+0C8]
 005B4B72    cdq
 005B4B73    push        edx
 005B4B74    push        eax
 005B4B75    call        IndyMin
 005B4B7A    mov         ebx,eax
 005B4B7C    push        ebx
 005B4B7D    push        0
 005B4B7F    lea         ecx,[ebp-4]
 005B4B82    mov         edx,esi
 005B4B84    mov         eax,[00596BE0];TIdStreamHelperVCL
 005B4B89    call        TIdStreamHelperVCL.ReadBytes
 005B4B8E    mov         ebx,eax
 005B4B90    test        ebx,ebx
>005B4B92    jne         005B4BB5
 005B4B94    lea         edx,[ebp-18]
 005B4B97    mov         eax,[0078CED4];^SResString687:TResStringRec
 005B4B9C    call        LoadResString
 005B4BA1    mov         ecx,dword ptr [ebp-18]
 005B4BA4    mov         dl,1
 005B4BA6    mov         eax,[005AFBE0];EIdNoDataToRead
 005B4BAB    call        EIdException.Create
 005B4BB0    call        @RaiseExcept
 005B4BB5    push        ebx
 005B4BB6    lea         eax,[ebp-4]
 005B4BB9    mov         ecx,1
 005B4BBE    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B4BC4    call        @DynArraySetLength
 005B4BC9    add         esp,4
 005B4BCC    push        0
 005B4BCE    or          ecx,0FFFFFFFF
 005B4BD1    mov         edx,dword ptr [ebp-4]
 005B4BD4    mov         eax,dword ptr [ebp-8]
 005B4BD7    mov         edi,dword ptr [eax]
 005B4BD9    call        dword ptr [edi+88]
 005B4BDF    mov         eax,ebx
 005B4BE1    cdq
 005B4BE2    sub         dword ptr [ebp+8],eax
 005B4BE5    sbb         dword ptr [ebp+0C],edx
 005B4BE8    cmp         dword ptr [ebp+0C],0
>005B4BEC    jne         005B4BFA
 005B4BEE    cmp         dword ptr [ebp+8],0
>005B4BF2    ja          005B4B43
>005B4BF8    jmp         005B4C00
>005B4BFA    jg          005B4B43
 005B4C00    xor         eax,eax
 005B4C02    pop         edx
 005B4C03    pop         ecx
 005B4C04    pop         ecx
 005B4C05    mov         dword ptr fs:[eax],edx
 005B4C08    push        5B4C2D
 005B4C0D    mov         dl,1
 005B4C0F    mov         eax,dword ptr [ebp-8]
 005B4C12    mov         ecx,dword ptr [eax]
 005B4C14    call        dword ptr [ecx+40]
 005B4C17    lea         eax,[ebp-4]
 005B4C1A    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B4C20    call        @DynArrayClear
 005B4C25    ret
>005B4C26    jmp         @HandleFinally
>005B4C2B    jmp         005B4C0D
 005B4C2D    xor         eax,eax
 005B4C2F    pop         edx
 005B4C30    pop         ecx
 005B4C31    pop         ecx
 005B4C32    mov         dword ptr fs:[eax],edx
 005B4C35    push        5B4C5D
 005B4C3A    lea         eax,[ebp-18]
 005B4C3D    mov         edx,2
 005B4C42    call        @UStrArrayClr
 005B4C47    lea         eax,[ebp-4]
 005B4C4A    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B4C50    call        @DynArrayClear
 005B4C55    ret
>005B4C56    jmp         @HandleFinally
>005B4C5B    jmp         005B4C3A
 005B4C5D    pop         edi
 005B4C5E    pop         esi
 005B4C5F    pop         ebx
 005B4C60    mov         esp,ebp
 005B4C62    pop         ebp
 005B4C63    ret         8
*}
end;

//005B4C68
procedure TIdIOHandler.ReadBytes(var VBuffer:TIdBytes; AByteCount:Integer; AAppend:Boolean);
begin
{*
 005B4C68    push        ebp
 005B4C69    mov         ebp,esp
 005B4C6B    push        ecx
 005B4C6C    push        ebx
 005B4C6D    push        esi
 005B4C6E    push        edi
 005B4C6F    mov         esi,ecx
 005B4C71    mov         dword ptr [ebp-4],edx
 005B4C74    mov         ebx,eax
 005B4C76    cmp         dword ptr [ebx+0A0],0
>005B4C7D    jne         005B4C93
 005B4C7F    mov         ecx,64C
 005B4C84    mov         edx,5B4D34;'C:\Builds\TP\indysockets\lib\core\IdIOHandler.pas'
 005B4C89    mov         eax,5B4DA4;'Assertion failure'
 005B4C8E    call        @Assert
 005B4C93    test        esi,esi
>005B4C95    jle         005B4CE5
>005B4C97    jmp         005B4CC1
 005B4C99    push        1
 005B4C9B    or          ecx,0FFFFFFFF
 005B4C9E    xor         edx,edx
 005B4CA0    mov         eax,ebx
 005B4CA2    call        TIdIOHandler.ReadFromSource
 005B4CA7    test        eax,eax
>005B4CA9    jle         005B4CB6
 005B4CAB    mov         eax,dword ptr [ebx+0A0]
 005B4CB1    cmp         esi,dword ptr [eax+20]
>005B4CB4    jle         005B4CCC
 005B4CB6    mov         cl,1
 005B4CB8    mov         dl,1
 005B4CBA    mov         eax,ebx
 005B4CBC    mov         edi,dword ptr [eax]
 005B4CBE    call        dword ptr [edi+78]
 005B4CC1    mov         eax,dword ptr [ebx+0A0]
 005B4CC7    cmp         esi,dword ptr [eax+20]
>005B4CCA    jg          005B4C99
 005B4CCC    movzx       eax,byte ptr [ebp+8]
 005B4CD0    push        eax
 005B4CD1    push        0FF
 005B4CD3    mov         edx,dword ptr [ebp-4]
 005B4CD6    mov         ecx,esi
 005B4CD8    mov         eax,dword ptr [ebx+0A0]
 005B4CDE    call        TIdBuffer.ExtractToBytes
>005B4CE3    jmp         005B4D1D
 005B4CE5    test        esi,esi
>005B4CE7    jge         005B4D1D
 005B4CE9    push        0
 005B4CEB    mov         ecx,dword ptr [ebx+0C0]
 005B4CF1    xor         edx,edx
 005B4CF3    mov         eax,ebx
 005B4CF5    call        TIdIOHandler.ReadFromSource
 005B4CFA    mov         cl,1
 005B4CFC    mov         dl,1
 005B4CFE    mov         eax,ebx
 005B4D00    mov         esi,dword ptr [eax]
 005B4D02    call        dword ptr [esi+78]
 005B4D05    movzx       eax,byte ptr [ebp+8]
 005B4D09    push        eax
 005B4D0A    push        0FF
 005B4D0C    mov         edx,dword ptr [ebp-4]
 005B4D0F    or          ecx,0FFFFFFFF
 005B4D12    mov         eax,dword ptr [ebx+0A0]
 005B4D18    call        TIdBuffer.ExtractToBytes
 005B4D1D    pop         edi
 005B4D1E    pop         esi
 005B4D1F    pop         ebx
 005B4D20    pop         ecx
 005B4D21    pop         ebp
 005B4D22    ret         4
*}
end;

//005B4DC8
procedure TIdIOHandler.WriteLn(AEncoding:TEncoding);
begin
{*
 005B4DC8    push        ebx
 005B4DC9    push        esi
 005B4DCA    push        edi
 005B4DCB    mov         edi,edx
 005B4DCD    mov         esi,eax
 005B4DCF    mov         ecx,edi
 005B4DD1    xor         edx,edx
 005B4DD3    mov         eax,esi
 005B4DD5    mov         ebx,dword ptr [eax]
 005B4DD7    call        dword ptr [ebx+98]
 005B4DDD    pop         edi
 005B4DDE    pop         esi
 005B4DDF    pop         ebx
 005B4DE0    ret
*}
end;

//005B4DE4
procedure TIdIOHandler.WriteLn(AOut:string; AByteEncoding:TEncoding);
begin
{*
 005B4DE4    push        ebp
 005B4DE5    mov         ebp,esp
 005B4DE7    push        0
 005B4DE9    push        ebx
 005B4DEA    push        esi
 005B4DEB    push        edi
 005B4DEC    mov         edi,ecx
 005B4DEE    mov         esi,edx
 005B4DF0    mov         ebx,eax
 005B4DF2    xor         eax,eax
 005B4DF4    push        ebp
 005B4DF5    push        5B4E34
 005B4DFA    push        dword ptr fs:[eax]
 005B4DFD    mov         dword ptr fs:[eax],esp
 005B4E00    lea         eax,[ebp-4]
 005B4E03    mov         ecx,5B4E50;'
'
 005B4E08    mov         edx,esi
 005B4E0A    call        @UStrCat3
 005B4E0F    mov         edx,dword ptr [ebp-4]
 005B4E12    mov         ecx,edi
 005B4E14    mov         eax,ebx
 005B4E16    mov         ebx,dword ptr [eax]
 005B4E18    call        dword ptr [ebx+94]
 005B4E1E    xor         eax,eax
 005B4E20    pop         edx
 005B4E21    pop         ecx
 005B4E22    pop         ecx
 005B4E23    mov         dword ptr fs:[eax],edx
 005B4E26    push        5B4E3B
 005B4E2B    lea         eax,[ebp-4]
 005B4E2E    call        @UStrClr
 005B4E33    ret
>005B4E34    jmp         @HandleFinally
>005B4E39    jmp         005B4E2B
 005B4E3B    pop         edi
 005B4E3C    pop         esi
 005B4E3D    pop         ebx
 005B4E3E    pop         ecx
 005B4E3F    pop         ebp
 005B4E40    ret
*}
end;

//005B4E58
procedure TIdIOHandler.WriteLnRFC(AOut:string; AByteEncoding:TEncoding);
begin
{*
 005B4E58    push        ebp
 005B4E59    mov         ebp,esp
 005B4E5B    add         esp,0FFFFFFF8
 005B4E5E    push        ebx
 005B4E5F    push        esi
 005B4E60    push        edi
 005B4E61    xor         ebx,ebx
 005B4E63    mov         dword ptr [ebp-8],ebx
 005B4E66    mov         dword ptr [ebp-4],ecx
 005B4E69    mov         edi,edx
 005B4E6B    mov         esi,eax
 005B4E6D    xor         eax,eax
 005B4E6F    push        ebp
 005B4E70    push        5B4ED1
 005B4E75    push        dword ptr fs:[eax]
 005B4E78    mov         dword ptr fs:[eax],esp
 005B4E7B    mov         edx,5B4EEC;'.'
 005B4E80    mov         eax,edi
 005B4E82    call        TextStartsWith
 005B4E87    test        al,al
>005B4E89    je          005B4EAC
 005B4E8B    lea         eax,[ebp-8]
 005B4E8E    mov         ecx,edi
 005B4E90    mov         edx,5B4EEC;'.'
 005B4E95    call        @UStrCat3
 005B4E9A    mov         edx,dword ptr [ebp-8]
 005B4E9D    mov         ecx,dword ptr [ebp-4]
 005B4EA0    mov         eax,esi
 005B4EA2    mov         ebx,dword ptr [eax]
 005B4EA4    call        dword ptr [ebx+98]
>005B4EAA    jmp         005B4EBB
 005B4EAC    mov         ecx,dword ptr [ebp-4]
 005B4EAF    mov         edx,edi
 005B4EB1    mov         eax,esi
 005B4EB3    mov         ebx,dword ptr [eax]
 005B4EB5    call        dword ptr [ebx+98]
 005B4EBB    xor         eax,eax
 005B4EBD    pop         edx
 005B4EBE    pop         ecx
 005B4EBF    pop         ecx
 005B4EC0    mov         dword ptr fs:[eax],edx
 005B4EC3    push        5B4ED8
 005B4EC8    lea         eax,[ebp-8]
 005B4ECB    call        @UStrClr
 005B4ED0    ret
>005B4ED1    jmp         @HandleFinally
>005B4ED6    jmp         005B4EC8
 005B4ED8    pop         edi
 005B4ED9    pop         esi
 005B4EDA    pop         ebx
 005B4EDB    pop         ecx
 005B4EDC    pop         ecx
 005B4EDD    pop         ebp
 005B4EDE    ret
*}
end;

//005B4EF0
function TIdIOHandler.Readable(AMSec:Integer):Boolean;
begin
{*
 005B4EF0    xor         eax,eax
 005B4EF2    ret
*}
end;

//005B4EF4
procedure TIdIOHandler.SetHost(const AValue:UnicodeString);
begin
{*
 005B4EF4    push        ebx
 005B4EF5    push        esi
 005B4EF6    mov         esi,edx
 005B4EF8    mov         ebx,eax
 005B4EFA    lea         eax,[ebx+9C]
 005B4F00    mov         edx,esi
 005B4F02    call        @UStrAsg
 005B4F07    pop         esi
 005B4F08    pop         ebx
 005B4F09    ret
*}
end;

//005B4F0C
procedure TIdIOHandler.SetPort(Value:Integer);
begin
{*
 005B4F0C    mov         dword ptr [eax+0B8],edx;TIdIOHandler.FPort:Integer
 005B4F12    ret
*}
end;

//005B4F14
function TIdIOHandler.Connected:Boolean;
begin
{*
 005B4F14    push        ebx
 005B4F15    push        esi
 005B4F16    mov         ebx,eax
 005B4F18    xor         ecx,ecx
 005B4F1A    xor         edx,edx
 005B4F1C    mov         eax,ebx
 005B4F1E    mov         esi,dword ptr [eax]
 005B4F20    call        dword ptr [esi+78]
 005B4F23    cmp         byte ptr [ebx+91],0
>005B4F2A    jne         005B4F35
 005B4F2C    cmp         dword ptr [ebx+0A0],0
>005B4F33    jne         005B4F40
 005B4F35    mov         eax,ebx
 005B4F37    call        TIdIOHandler.InputBufferIsEmpty
 005B4F3C    test        al,al
>005B4F3E    jne         005B4F49
 005B4F40    cmp         byte ptr [ebx+0B4],0
>005B4F47    jne         005B4F4E
 005B4F49    xor         eax,eax
 005B4F4B    pop         esi
 005B4F4C    pop         ebx
 005B4F4D    ret
 005B4F4E    mov         al,1
 005B4F50    pop         esi
 005B4F51    pop         ebx
 005B4F52    ret
*}
end;

//005B4F54
procedure AdjustStreamSize(const AStream:TStream; const ASize:TIdStreamSize);
begin
{*
 005B4F54    push        ebp
 005B4F55    mov         ebp,esp
 005B4F57    add         esp,0FFFFFFF8
 005B4F5A    push        ebx
 005B4F5B    mov         ebx,eax
 005B4F5D    mov         eax,ebx
 005B4F5F    call        TStream.GetPosition
 005B4F64    mov         dword ptr [ebp-8],eax
 005B4F67    mov         dword ptr [ebp-4],edx
 005B4F6A    push        dword ptr [ebp+0C]
 005B4F6D    push        dword ptr [ebp+8]
 005B4F70    mov         eax,ebx
 005B4F72    call        TStream.SetSize64
 005B4F77    mov         eax,ebx
 005B4F79    call        TStream.GetPosition
 005B4F7E    cmp         edx,dword ptr [ebp-4]
>005B4F81    jne         005B4F86
 005B4F83    cmp         eax,dword ptr [ebp-8]
>005B4F86    je          005B4F95
 005B4F88    push        dword ptr [ebp-4]
 005B4F8B    push        dword ptr [ebp-8]
 005B4F8E    mov         eax,ebx
 005B4F90    call        TStream.SetPosition
 005B4F95    pop         ebx
 005B4F96    pop         ecx
 005B4F97    pop         ecx
 005B4F98    pop         ebp
 005B4F99    ret         8
*}
end;

//005B4F9C
procedure TIdIOHandler.ReadStream(AStream:TStream; AReadUntilDisconnect:Boolean; AByteCount:Int64);
begin
{*
 005B4F9C    push        ebp
 005B4F9D    mov         ebp,esp
 005B4F9F    add         esp,0FFFFFFD4
 005B4FA2    push        ebx
 005B4FA3    push        esi
 005B4FA4    push        edi
 005B4FA5    xor         ebx,ebx
 005B4FA7    mov         dword ptr [ebp-2C],ebx
 005B4FAA    mov         dword ptr [ebp-4],ebx
 005B4FAD    mov         byte ptr [ebp-0D],cl
 005B4FB0    mov         dword ptr [ebp-0C],edx
 005B4FB3    mov         dword ptr [ebp-8],eax
 005B4FB6    xor         eax,eax
 005B4FB8    push        ebp
 005B4FB9    push        5B5304
 005B4FBE    push        dword ptr fs:[eax]
 005B4FC1    mov         dword ptr fs:[eax],esp
 005B4FC4    cmp         dword ptr [ebp-0C],0
>005B4FC8    jne         005B4FDE
 005B4FCA    mov         ecx,6BE
 005B4FCF    mov         edx,5B5320;'C:\Builds\TP\indysockets\lib\core\IdIOHandler.pas'
 005B4FD4    mov         eax,5B5390;'Assertion failure'
 005B4FD9    call        @Assert
 005B4FDE    cmp         dword ptr [ebp+0C],0FFFFFFFF
>005B4FE2    jne         005B5021
 005B4FE4    cmp         dword ptr [ebp+8],0FFFFFFFF
>005B4FE8    jne         005B5021
 005B4FEA    cmp         byte ptr [ebp-0D],0
>005B4FEE    jne         005B5021
 005B4FF0    mov         eax,dword ptr [ebp-8]
 005B4FF3    cmp         byte ptr [eax+90],0
>005B4FFA    je          005B500E
 005B4FFC    mov         dl,1
 005B4FFE    mov         eax,dword ptr [ebp-8]
 005B5001    call        TIdIOHandler.ReadInt64
 005B5006    mov         dword ptr [ebp-20],eax
 005B5009    mov         dword ptr [ebp-1C],edx
>005B500C    jmp         005B502D
 005B500E    mov         dl,1
 005B5010    mov         eax,dword ptr [ebp-8]
 005B5013    call        TIdIOHandler.ReadLongInt
 005B5018    cdq
 005B5019    mov         dword ptr [ebp-20],eax
 005B501C    mov         dword ptr [ebp-1C],edx
>005B501F    jmp         005B502D
 005B5021    mov         eax,dword ptr [ebp+8]
 005B5024    mov         dword ptr [ebp-20],eax
 005B5027    mov         eax,dword ptr [ebp+0C]
 005B502A    mov         dword ptr [ebp-1C],eax
 005B502D    cmp         dword ptr [ebp-1C],0FFFFFFFF
>005B5031    jne         005B503B
 005B5033    cmp         dword ptr [ebp-20],0FFFFFFFF
>005B5037    jbe         005B5099
>005B5039    jmp         005B503D
>005B503B    jle         005B5099
 005B503D    mov         eax,dword ptr [ebp-0C]
 005B5040    call        TStream.GetPosition
 005B5045    mov         dword ptr [ebp-28],eax
 005B5048    mov         dword ptr [ebp-24],edx
 005B504B    mov         eax,0FFFFFFFF
 005B5050    mov         edx,7FFFFFFF
 005B5055    sub         eax,dword ptr [ebp-28]
 005B5058    sbb         edx,dword ptr [ebp-24]
 005B505B    cmp         edx,dword ptr [ebp-1C]
>005B505E    jne         005B5067
 005B5060    cmp         eax,dword ptr [ebp-20]
>005B5063    jae         005B5083
>005B5065    jmp         005B5069
>005B5067    jge         005B5083
 005B5069    lea         edx,[ebp-2C]
 005B506C    mov         eax,[0078DB64];^SResString692:TResStringRec
 005B5071    call        LoadResString
 005B5076    mov         edx,dword ptr [ebp-2C]
 005B5079    mov         eax,[005B1500];EIdIOHandlerStreamDataTooLarge
 005B507E    call        EIdException.Toss
 005B5083    mov         eax,dword ptr [ebp-28]
 005B5086    mov         edx,dword ptr [ebp-24]
 005B5089    add         eax,dword ptr [ebp-20]
 005B508C    adc         edx,dword ptr [ebp-1C]
 005B508F    push        edx
 005B5090    push        eax
 005B5091    mov         eax,dword ptr [ebp-0C]
 005B5094    call        AdjustStreamSize
 005B5099    cmp         dword ptr [ebp-1C],0FFFFFFFF
>005B509D    jne         005B50A7
 005B509F    cmp         dword ptr [ebp-20],0FFFFFFFF
>005B50A3    ja          005B50B3
>005B50A5    jmp         005B50A9
>005B50A7    jg          005B50B3
 005B50A9    cmp         byte ptr [ebp-0D],0
>005B50AD    jne         005B50B3
 005B50AF    mov         byte ptr [ebp-0D],1
 005B50B3    cmp         byte ptr [ebp-0D],0
>005B50B7    je          005B50C9
 005B50B9    push        0
 005B50BB    push        0
 005B50BD    xor         edx,edx
 005B50BF    mov         eax,dword ptr [ebp-8]
 005B50C2    mov         ecx,dword ptr [eax]
 005B50C4    call        dword ptr [ecx+38]
>005B50C7    jmp         005B50D9
 005B50C9    push        dword ptr [ebp-1C]
 005B50CC    push        dword ptr [ebp-20]
 005B50CF    xor         edx,edx
 005B50D1    mov         eax,dword ptr [ebp-8]
 005B50D4    mov         ecx,dword ptr [eax]
 005B50D6    call        dword ptr [ecx+38]
 005B50D9    xor         eax,eax
 005B50DB    push        ebp
 005B50DC    push        5B52D9
 005B50E1    push        dword ptr fs:[eax]
 005B50E4    mov         dword ptr fs:[eax],esp
 005B50E7    mov         eax,dword ptr [ebp-8]
 005B50EA    mov         eax,dword ptr [eax+0A0]
 005B50F0    mov         ebx,dword ptr [eax+20]
 005B50F3    test        ebx,ebx
>005B50F5    jle         005B5135
 005B50F7    cmp         byte ptr [ebp-0D],0
>005B50FB    je          005B5102
 005B50FD    mov         dword ptr [ebp-14],ebx
>005B5100    jmp         005B511F
 005B5102    mov         eax,ebx
 005B5104    cdq
 005B5105    push        edx
 005B5106    push        eax
 005B5107    push        dword ptr [ebp-1C]
 005B510A    push        dword ptr [ebp-20]
 005B510D    call        IndyMin
 005B5112    mov         dword ptr [ebp-14],eax
 005B5115    mov         eax,dword ptr [ebp-14]
 005B5118    cdq
 005B5119    sub         dword ptr [ebp-20],eax
 005B511C    sbb         dword ptr [ebp-1C],edx
 005B511F    push        0FF
 005B5121    mov         eax,dword ptr [ebp-8]
 005B5124    mov         eax,dword ptr [eax+0A0]
 005B512A    mov         ecx,dword ptr [ebp-14]
 005B512D    mov         edx,dword ptr [ebp-0C]
 005B5130    call        TIdBuffer.ExtractToStream
 005B5135    mov         eax,dword ptr [ebp-8]
 005B5138    mov         eax,dword ptr [eax+0C4]
 005B513E    push        eax
 005B513F    lea         eax,[ebp-4]
 005B5142    mov         ecx,1
 005B5147    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B514D    call        @DynArraySetLength
 005B5152    add         esp,4
 005B5155    cmp         byte ptr [ebp-0D],0
>005B5159    je          005B5168
 005B515B    mov         eax,dword ptr [ebp-4]
 005B515E    call        @DynArrayLength
 005B5163    mov         dword ptr [ebp-14],eax
>005B5166    jmp         005B518B
 005B5168    push        dword ptr [ebp-1C]
 005B516B    push        dword ptr [ebp-20]
 005B516E    mov         eax,dword ptr [ebp-4]
 005B5171    call        @DynArrayLength
 005B5176    cdq
 005B5177    push        edx
 005B5178    push        eax
 005B5179    call        IndyMin
 005B517E    mov         dword ptr [ebp-14],eax
 005B5181    cmp         dword ptr [ebp-14],1
>005B5185    jl          005B527D
 005B518B    xor         eax,eax
 005B518D    push        ebp
 005B518E    push        5B5276
 005B5193    push        dword ptr fs:[eax]
 005B5196    mov         dword ptr fs:[eax],esp
 005B5199    xor         eax,eax
 005B519B    push        ebp
 005B519C    push        5B51C4
 005B51A1    push        dword ptr fs:[eax]
 005B51A4    mov         dword ptr fs:[eax],esp
 005B51A7    push        0
 005B51A9    lea         edx,[ebp-4]
 005B51AC    mov         ecx,dword ptr [ebp-14]
 005B51AF    mov         eax,dword ptr [ebp-8]
 005B51B2    mov         ebx,dword ptr [eax]
 005B51B4    call        dword ptr [ebx+0B4]
 005B51BA    xor         eax,eax
 005B51BC    pop         edx
 005B51BD    pop         ecx
 005B51BE    pop         ecx
 005B51BF    mov         dword ptr fs:[eax],edx
>005B51C2    jmp         005B522E
>005B51C4    jmp         @HandleOnException
 005B51C9    dd          1
 005B51CD    dd          00418C04;Exception
 005B51D1    dd          005B51D5
 005B51D5    mov         ebx,eax
 005B51D7    mov         eax,dword ptr [ebp-8]
 005B51DA    mov         eax,dword ptr [eax+0A0]
 005B51E0    mov         edx,dword ptr [eax+20]
 005B51E3    mov         eax,dword ptr [ebp-14]
 005B51E6    call        IndyMin
 005B51EB    mov         dword ptr [ebp-14],eax
 005B51EE    push        0
 005B51F0    push        0FF
 005B51F2    lea         edx,[ebp-4]
 005B51F5    mov         eax,dword ptr [ebp-8]
 005B51F8    mov         eax,dword ptr [eax+0A0]
 005B51FE    mov         ecx,dword ptr [ebp-14]
 005B5201    call        TIdBuffer.ExtractToBytes
 005B5206    mov         eax,ebx
 005B5208    mov         edx,dword ptr ds:[5963E0];EIdConnClosedGracefully
 005B520E    call        @IsClass
 005B5213    and         al,byte ptr [ebp-0D]
>005B5216    je          005B5224
 005B5218    call        @DoneExcept
 005B521D    call        @TryFinallyExit
>005B5222    jmp         005B527D
 005B5224    call        @RaiseAgain
 005B5229    call        @DoneExcept
 005B522E    xor         ecx,ecx
 005B5230    mov         dl,1
 005B5232    mov         eax,[005AAC00];TIdAntiFreezeBase
 005B5237    call        TIdAntiFreezeBase.DoProcess
 005B523C    xor         eax,eax
 005B523E    pop         edx
 005B523F    pop         ecx
 005B5240    pop         ecx
 005B5241    mov         dword ptr fs:[eax],edx
 005B5244    push        5B5155
 005B5249    cmp         dword ptr [ebp-14],0
>005B524D    jle         005B5275
 005B524F    mov         eax,dword ptr [ebp-14]
 005B5252    push        eax
 005B5253    push        0
 005B5255    mov         ecx,dword ptr [ebp-4]
 005B5258    mov         edx,dword ptr [ebp-0C]
 005B525B    mov         eax,[00596BE0];TIdStreamHelperVCL
 005B5260    call        TIdStreamHelperVCL.Write
 005B5265    cmp         byte ptr [ebp-0D],0
>005B5269    jne         005B5275
 005B526B    mov         eax,dword ptr [ebp-14]
 005B526E    cdq
 005B526F    sub         dword ptr [ebp-20],eax
 005B5272    sbb         dword ptr [ebp-1C],edx
 005B5275    ret
>005B5276    jmp         @HandleFinally
>005B527B    jmp         005B5249
 005B527D    xor         eax,eax
 005B527F    pop         edx
 005B5280    pop         ecx
 005B5281    pop         ecx
 005B5282    mov         dword ptr fs:[eax],edx
 005B5285    push        5B52E0
 005B528A    xor         edx,edx
 005B528C    mov         eax,dword ptr [ebp-8]
 005B528F    mov         ecx,dword ptr [eax]
 005B5291    call        dword ptr [ecx+40]
 005B5294    mov         eax,dword ptr [ebp-0C]
 005B5297    mov         edx,dword ptr [eax]
 005B5299    call        dword ptr [edx]
 005B529B    push        edx
 005B529C    push        eax
 005B529D    mov         eax,dword ptr [ebp-0C]
 005B52A0    call        TStream.GetPosition
 005B52A5    cmp         edx,dword ptr [esp+4]
>005B52A9    jne         005B52B4
 005B52AB    cmp         eax,dword ptr [esp]
 005B52AE    pop         edx
 005B52AF    pop         eax
>005B52B0    jae         005B52CA
>005B52B2    jmp         005B52B8
 005B52B4    pop         edx
 005B52B5    pop         eax
>005B52B6    jge         005B52CA
 005B52B8    mov         eax,dword ptr [ebp-0C]
 005B52BB    call        TStream.GetPosition
 005B52C0    push        edx
 005B52C1    push        eax
 005B52C2    mov         eax,dword ptr [ebp-0C]
 005B52C5    call        TStream.SetSize64
 005B52CA    lea         eax,[ebp-4]
 005B52CD    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B52D3    call        @DynArrayClear
 005B52D8    ret
>005B52D9    jmp         @HandleFinally
>005B52DE    jmp         005B528A
 005B52E0    xor         eax,eax
 005B52E2    pop         edx
 005B52E3    pop         ecx
 005B52E4    pop         ecx
 005B52E5    mov         dword ptr fs:[eax],edx
 005B52E8    push        5B530B
 005B52ED    lea         eax,[ebp-2C]
 005B52F0    call        @UStrClr
 005B52F5    lea         eax,[ebp-4]
 005B52F8    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B52FE    call        @DynArrayClear
 005B5303    ret
>005B5304    jmp         @HandleFinally
>005B5309    jmp         005B52ED
 005B530B    pop         edi
 005B530C    pop         esi
 005B530D    pop         ebx
 005B530E    mov         esp,ebp
 005B5310    pop         ebp
 005B5311    ret         8
*}
end;

//005B53B4
procedure TIdIOHandler.Discard(AByteCount:Int64);
begin
{*
 005B53B4    push        ebp
 005B53B5    mov         ebp,esp
 005B53B7    push        ecx
 005B53B8    push        ebx
 005B53B9    mov         dword ptr [ebp-4],eax
 005B53BC    cmp         dword ptr [ebp+0C],0
>005B53C0    jne         005B53CA
 005B53C2    cmp         dword ptr [ebp+8],0
>005B53C6    jae         005B53E0
>005B53C8    jmp         005B53CC
>005B53CA    jge         005B53E0
 005B53CC    mov         ecx,72F
 005B53D1    mov         edx,5B54E0;'C:\Builds\TP\indysockets\lib\core\IdIOHandler.pas'
 005B53D6    mov         eax,5B5550;'Assertion failure'
 005B53DB    call        @Assert
 005B53E0    cmp         dword ptr [ebp+0C],0
>005B53E4    jne         005B53F2
 005B53E6    cmp         dword ptr [ebp+8],0
>005B53EA    jbe         005B54CC
>005B53F0    jmp         005B53F8
>005B53F2    jle         005B54CC
 005B53F8    push        dword ptr [ebp+0C]
 005B53FB    push        dword ptr [ebp+8]
 005B53FE    xor         edx,edx
 005B5400    mov         eax,dword ptr [ebp-4]
 005B5403    mov         ecx,dword ptr [eax]
 005B5405    call        dword ptr [ecx+38]
 005B5408    xor         eax,eax
 005B540A    push        ebp
 005B540B    push        5B54C5
 005B5410    push        dword ptr fs:[eax]
 005B5413    mov         dword ptr fs:[eax],esp
 005B5416    mov         eax,dword ptr [ebp+8]
 005B5419    push        eax
 005B541A    cmp         dword ptr [ebp+0C],0
>005B541E    jne         005B542C
 005B5420    cmp         dword ptr [ebp+8],7FFFFFFF
 005B5427    setb        al
>005B542A    jmp         005B542F
 005B542C    setl        al
 005B542F    mov         ecx,7FFFFFFF
 005B5434    pop         edx
 005B5435    call        iif
 005B543A    mov         ebx,eax
 005B543C    mov         eax,dword ptr [ebp-4]
 005B543F    call        TIdIOHandler.InputBufferIsEmpty
 005B5444    test        al,al
>005B5446    jne         005B5486
 005B5448    mov         eax,dword ptr [ebp-4]
 005B544B    mov         eax,dword ptr [eax+0A0]
 005B5451    mov         edx,dword ptr [eax+20]
 005B5454    mov         eax,ebx
 005B5456    call        IndyMin
 005B545B    mov         ebx,eax
 005B545D    mov         eax,dword ptr [ebp-4]
 005B5460    mov         eax,dword ptr [eax+0A0]
 005B5466    mov         edx,ebx
 005B5468    call        TIdBuffer.Remove
 005B546D    mov         eax,ebx
 005B546F    cdq
 005B5470    sub         dword ptr [ebp+8],eax
 005B5473    sbb         dword ptr [ebp+0C],edx
 005B5476    cmp         dword ptr [ebp+0C],0
>005B547A    jne         005B5484
 005B547C    cmp         dword ptr [ebp+8],1
>005B5480    jae         005B5486
>005B5482    jmp         005B54AD
>005B5484    jl          005B54AD
 005B5486    push        1
 005B5488    or          ecx,0FFFFFFFF
 005B548B    xor         edx,edx
 005B548D    mov         eax,dword ptr [ebp-4]
 005B5490    call        TIdIOHandler.ReadFromSource
 005B5495    dec         eax
>005B5496    jge         005B5416
 005B549C    mov         cl,1
 005B549E    mov         dl,1
 005B54A0    mov         eax,dword ptr [ebp-4]
 005B54A3    mov         ebx,dword ptr [eax]
 005B54A5    call        dword ptr [ebx+78]
>005B54A8    jmp         005B5416
 005B54AD    xor         eax,eax
 005B54AF    pop         edx
 005B54B0    pop         ecx
 005B54B1    pop         ecx
 005B54B2    mov         dword ptr fs:[eax],edx
 005B54B5    push        5B54CC
 005B54BA    xor         edx,edx
 005B54BC    mov         eax,dword ptr [ebp-4]
 005B54BF    mov         ecx,dword ptr [eax]
 005B54C1    call        dword ptr [ecx+40]
 005B54C4    ret
>005B54C5    jmp         @HandleFinally
>005B54CA    jmp         005B54BA
 005B54CC    pop         ebx
 005B54CD    pop         ecx
 005B54CE    pop         ebp
 005B54CF    ret         8
*}
end;

//005B5574
procedure TIdIOHandler.DiscardAll;
begin
{*
 005B5574    push        ebp
 005B5575    mov         ebp,esp
 005B5577    push        ecx
 005B5578    push        ebx
 005B5579    push        esi
 005B557A    push        edi
 005B557B    mov         dword ptr [ebp-4],eax
 005B557E    push        0
 005B5580    push        0
 005B5582    xor         edx,edx
 005B5584    mov         eax,dword ptr [ebp-4]
 005B5587    mov         ecx,dword ptr [eax]
 005B5589    call        dword ptr [ecx+38]
 005B558C    xor         eax,eax
 005B558E    push        ebp
 005B558F    push        5B565D
 005B5594    push        dword ptr fs:[eax]
 005B5597    mov         dword ptr fs:[eax],esp
 005B559A    mov         eax,dword ptr [ebp-4]
 005B559D    mov         eax,dword ptr [eax+0A0]
 005B55A3    call        TIdBuffer.Clear
 005B55A8    xor         eax,eax
 005B55AA    push        ebp
 005B55AB    push        5B55EF
 005B55B0    push        dword ptr fs:[eax]
 005B55B3    mov         dword ptr fs:[eax],esp
 005B55B6    push        1
 005B55B8    or          ecx,0FFFFFFFF
 005B55BB    xor         edx,edx
 005B55BD    mov         eax,dword ptr [ebp-4]
 005B55C0    call        TIdIOHandler.ReadFromSource
 005B55C5    test        eax,eax
>005B55C7    jle         005B55D9
 005B55C9    mov         eax,dword ptr [ebp-4]
 005B55CC    mov         eax,dword ptr [eax+0A0]
 005B55D2    call        TIdBuffer.Clear
>005B55D7    jmp         005B55E5
 005B55D9    mov         cl,1
 005B55DB    mov         dl,1
 005B55DD    mov         eax,dword ptr [ebp-4]
 005B55E0    mov         ebx,dword ptr [eax]
 005B55E2    call        dword ptr [ebx+78]
 005B55E5    xor         eax,eax
 005B55E7    pop         edx
 005B55E8    pop         ecx
 005B55E9    pop         ecx
 005B55EA    mov         dword ptr fs:[eax],edx
>005B55ED    jmp         005B5632
>005B55EF    jmp         @HandleOnException
 005B55F4    dd          1
 005B55F8    dd          00418C04;Exception
 005B55FC    dd          005B5600
 005B5600    mov         ebx,eax
 005B5602    mov         eax,dword ptr [ebp-4]
 005B5605    mov         eax,dword ptr [eax+0A0]
 005B560B    call        TIdBuffer.Clear
 005B5610    mov         eax,ebx
 005B5612    mov         edx,dword ptr ds:[5963E0];EIdConnClosedGracefully
 005B5618    call        @IsClass
 005B561D    test        al,al
>005B561F    je          005B5628
 005B5621    call        @DoneExcept
>005B5626    jmp         005B5645
 005B5628    call        @RaiseAgain
 005B562D    call        @DoneExcept
 005B5632    xor         ecx,ecx
 005B5634    mov         dl,1
 005B5636    mov         eax,[005AAC00];TIdAntiFreezeBase
 005B563B    call        TIdAntiFreezeBase.DoProcess
>005B5640    jmp         005B55A8
 005B5645    xor         eax,eax
 005B5647    pop         edx
 005B5648    pop         ecx
 005B5649    pop         ecx
 005B564A    mov         dword ptr fs:[eax],edx
 005B564D    push        5B5664
 005B5652    xor         edx,edx
 005B5654    mov         eax,dword ptr [ebp-4]
 005B5657    mov         ecx,dword ptr [eax]
 005B5659    call        dword ptr [ecx+40]
 005B565C    ret
>005B565D    jmp         @HandleFinally
>005B5662    jmp         005B5652
 005B5664    pop         edi
 005B5665    pop         esi
 005B5666    pop         ebx
 005B5667    pop         ecx
 005B5668    pop         ebp
 005B5669    ret
*}
end;

//005B566C
procedure TIdIOHandler.RaiseConnClosedGracefully;
begin
{*
 005B566C    push        ebp
 005B566D    mov         ebp,esp
 005B566F    push        0
 005B5671    xor         eax,eax
 005B5673    push        ebp
 005B5674    push        5B56B6
 005B5679    push        dword ptr fs:[eax]
 005B567C    mov         dword ptr fs:[eax],esp
 005B567F    lea         edx,[ebp-4]
 005B5682    mov         eax,[0078D56C];^SResString655:TResStringRec
 005B5687    call        LoadResString
 005B568C    mov         ecx,dword ptr [ebp-4]
 005B568F    mov         dl,1
 005B5691    mov         eax,[005963E0];EIdConnClosedGracefully
 005B5696    call        EIdException.Create
 005B569B    call        @RaiseExcept
 005B56A0    xor         eax,eax
 005B56A2    pop         edx
 005B56A3    pop         ecx
 005B56A4    pop         ecx
 005B56A5    mov         dword ptr fs:[eax],edx
 005B56A8    push        5B56BD
 005B56AD    lea         eax,[ebp-4]
 005B56B0    call        @UStrClr
 005B56B5    ret
>005B56B6    jmp         @HandleFinally
>005B56BB    jmp         005B56AD
 005B56BD    pop         ecx
 005B56BE    pop         ebp
 005B56BF    ret
*}
end;

//005B56C0
function TIdIOHandler.InputBufferAsString(AByteEncoding:TEncoding):string;
begin
{*
 005B56C0    push        ebx
 005B56C1    push        esi
 005B56C2    push        edi
 005B56C3    push        ebp
 005B56C4    mov         ebp,ecx
 005B56C6    mov         esi,edx
 005B56C8    mov         ebx,eax
 005B56CA    mov         cl,1
 005B56CC    mov         edx,dword ptr [ebx+0D4]
 005B56D2    mov         eax,esi
 005B56D4    call        iif
 005B56D9    mov         esi,eax
 005B56DB    push        ebp
 005B56DC    mov         edi,dword ptr [ebx+0A0]
 005B56E2    mov         edx,dword ptr [edi+20]
 005B56E5    mov         ecx,esi
 005B56E7    mov         eax,edi
 005B56E9    call        TIdBuffer.ExtractToString
 005B56EE    pop         ebp
 005B56EF    pop         edi
 005B56F0    pop         esi
 005B56F1    pop         ebx
 005B56F2    ret
*}
end;

//005B56F4
function TIdIOHandler.AllData(AByteEncoding:TEncoding):string;
begin
{*
 005B56F4    push        ebp
 005B56F5    mov         ebp,esp
 005B56F7    add         esp,0FFFFFFF4
 005B56FA    push        ebx
 005B56FB    push        esi
 005B56FC    push        edi
 005B56FD    mov         dword ptr [ebp-0C],ecx
 005B5700    mov         dword ptr [ebp-8],edx
 005B5703    mov         dword ptr [ebp-4],eax
 005B5706    mov         eax,dword ptr [ebp-0C]
 005B5709    call        @UStrClr
 005B570E    push        0
 005B5710    push        0
 005B5712    xor         edx,edx
 005B5714    mov         eax,dword ptr [ebp-4]
 005B5717    mov         ecx,dword ptr [eax]
 005B5719    call        dword ptr [ecx+38]
 005B571C    xor         edx,edx
 005B571E    push        ebp
 005B571F    push        5B57C2
 005B5724    push        dword ptr fs:[edx]
 005B5727    mov         dword ptr fs:[edx],esp
 005B572A    mov         eax,dword ptr [ebp-4]
 005B572D    mov         edx,dword ptr [eax]
 005B572F    call        dword ptr [edx+74]
 005B5732    test        al,al
>005B5734    je          005B57AA
 005B5736    xor         edx,edx
 005B5738    push        ebp
 005B5739    push        5B57A0
 005B573E    push        dword ptr fs:[edx]
 005B5741    mov         dword ptr fs:[edx],esp
 005B5744    xor         edx,edx
 005B5746    push        ebp
 005B5747    push        5B578F
 005B574C    push        dword ptr fs:[edx]
 005B574F    mov         dword ptr fs:[edx],esp
 005B5752    push        0
 005B5754    mov         ecx,0FA
 005B5759    xor         edx,edx
 005B575B    mov         eax,dword ptr [ebp-4]
 005B575E    call        TIdIOHandler.ReadFromSource
 005B5763    test        eax,eax
>005B5765    jne         005B5752
 005B5767    xor         eax,eax
 005B5769    pop         edx
 005B576A    pop         ecx
 005B576B    pop         ecx
 005B576C    mov         dword ptr fs:[eax],edx
 005B576F    push        5B5796
 005B5774    mov         eax,dword ptr [ebp-4]
 005B5777    call        TIdIOHandler.InputBufferIsEmpty
 005B577C    test        al,al
>005B577E    jne         005B578E
 005B5780    mov         ecx,dword ptr [ebp-0C]
 005B5783    mov         edx,dword ptr [ebp-8]
 005B5786    mov         eax,dword ptr [ebp-4]
 005B5789    call        TIdIOHandler.InputBufferAsString
 005B578E    ret
>005B578F    jmp         @HandleFinally
>005B5794    jmp         005B5774
 005B5796    xor         eax,eax
 005B5798    pop         edx
 005B5799    pop         ecx
 005B579A    pop         ecx
 005B579B    mov         dword ptr fs:[eax],edx
>005B579E    jmp         005B57AA
>005B57A0    jmp         @HandleAnyException
 005B57A5    call        @DoneExcept
 005B57AA    xor         eax,eax
 005B57AC    pop         edx
 005B57AD    pop         ecx
 005B57AE    pop         ecx
 005B57AF    mov         dword ptr fs:[eax],edx
 005B57B2    push        5B57C9
 005B57B7    xor         edx,edx
 005B57B9    mov         eax,dword ptr [ebp-4]
 005B57BC    mov         ecx,dword ptr [eax]
 005B57BE    call        dword ptr [ecx+40]
 005B57C1    ret
>005B57C2    jmp         @HandleFinally
>005B57C7    jmp         005B57B7
 005B57C9    pop         edi
 005B57CA    pop         esi
 005B57CB    pop         ebx
 005B57CC    mov         esp,ebp
 005B57CE    pop         ebp
 005B57CF    ret
*}
end;

//005B57D0
procedure TIdIOHandler.PerformCapture(const ADest:TObject; var VLineCount:Integer; const ADelim:UnicodeString; AUsesDotTransparency:Boolean; AByteEncoding:TIdTextEncoding);
begin
{*
 005B57D0    push        ebp
 005B57D1    mov         ebp,esp
 005B57D3    push        0
 005B57D5    push        0
 005B57D7    push        0
 005B57D9    push        0
 005B57DB    push        0
 005B57DD    push        0
 005B57DF    push        ebx
 005B57E0    push        esi
 005B57E1    push        edi
 005B57E2    mov         esi,ecx
 005B57E4    mov         edi,edx
 005B57E6    mov         dword ptr [ebp-8],eax
 005B57E9    xor         eax,eax
 005B57EB    push        ebp
 005B57EC    push        5B597D
 005B57F1    push        dword ptr fs:[eax]
 005B57F4    mov         dword ptr fs:[eax],esp
 005B57F7    xor         eax,eax
 005B57F9    mov         dword ptr [esi],eax
 005B57FB    mov         eax,dword ptr [ebp-8]
 005B57FE    mov         edx,dword ptr [eax+0D4]
 005B5804    mov         cl,1
 005B5806    mov         eax,dword ptr [ebp+8]
 005B5809    call        iif
 005B580E    mov         dword ptr [ebp+8],eax
 005B5811    xor         eax,eax
 005B5813    mov         dword ptr [ebp-0C],eax
 005B5816    xor         ebx,ebx
 005B5818    mov         eax,edi
 005B581A    mov         edx,dword ptr ds:[43B934];TStrings
 005B5820    call        @IsClass
 005B5825    test        al,al
>005B5827    je          005B582D
 005B5829    mov         ebx,edi
>005B582B    jmp         005B585D
 005B582D    mov         eax,edi
 005B582F    mov         edx,dword ptr ds:[43CE74];TStream
 005B5835    call        @IsClass
 005B583A    test        al,al
>005B583C    je          005B5843
 005B583E    mov         dword ptr [ebp-0C],edi
>005B5841    jmp         005B585D
 005B5843    lea         edx,[ebp-10]
 005B5846    mov         eax,[0078CC50];^SResString686:TResStringRec
 005B584B    call        LoadResString
 005B5850    mov         edx,dword ptr [ebp-10]
 005B5853    mov         eax,[005AFB20];EIdObjectTypeNotSupported
 005B5858    call        EIdException.Toss
 005B585D    push        0
 005B585F    push        0
 005B5861    xor         edx,edx
 005B5863    mov         eax,dword ptr [ebp-8]
 005B5866    mov         ecx,dword ptr [eax]
 005B5868    call        dword ptr [ecx+38]
 005B586B    xor         edx,edx
 005B586D    push        ebp
 005B586E    push        5B5953
 005B5873    push        dword ptr fs:[edx]
 005B5876    mov         dword ptr fs:[edx],esp
 005B5879    lea         ecx,[ebp-4]
 005B587C    mov         edx,dword ptr [ebp+8]
 005B587F    mov         eax,dword ptr [ebp-8]
 005B5882    call        TIdIOHandler.ReadLn
 005B5887    mov         eax,dword ptr [ebp-4]
 005B588A    mov         edx,dword ptr [ebp+10]
 005B588D    call        @UStrEqual
>005B5892    jne         005B589E
 005B5894    call        @TryFinallyExit
>005B5899    jmp         005B595A
 005B589E    mov         eax,dword ptr [ebp-8]
 005B58A1    mov         eax,dword ptr [eax+0A8]
 005B58A7    test        eax,eax
>005B58A9    jle         005B58D0
 005B58AB    cmp         eax,dword ptr [esi]
>005B58AD    jge         005B58D0
 005B58AF    lea         edx,[ebp-14]
 005B58B2    mov         eax,[0078D2FC];^SResString696:TResStringRec
 005B58B7    call        LoadResString
 005B58BC    mov         ecx,dword ptr [ebp-14]
 005B58BF    mov         dl,1
 005B58C1    mov         eax,[005B0C1C];EIdMaxCaptureLineExceeded
 005B58C6    call        EIdException.Create
 005B58CB    call        @RaiseExcept
 005B58D0    cmp         byte ptr [ebp+0C],0
>005B58D4    je          005B58F9
 005B58D6    mov         edx,5B599C;'..'
 005B58DB    mov         eax,dword ptr [ebp-4]
 005B58DE    call        TextStartsWith
 005B58E3    test        al,al
>005B58E5    je          005B58F9
 005B58E7    lea         eax,[ebp-4]
 005B58EA    mov         ecx,1
 005B58EF    mov         edx,1
 005B58F4    call        @UStrDelete
 005B58F9    inc         dword ptr [esi]
 005B58FB    test        ebx,ebx
>005B58FD    je          005B590E
 005B58FF    mov         edx,dword ptr [ebp-4]
 005B5902    mov         eax,ebx
 005B5904    mov         ecx,dword ptr [eax]
 005B5906    call        dword ptr [ecx+38]
>005B5909    jmp         005B5879
 005B590E    cmp         dword ptr [ebp-0C],0
>005B5912    je          005B5879
 005B5918    lea         eax,[ebp-18]
 005B591B    mov         ecx,5B59B0;'
'
 005B5920    mov         edx,dword ptr [ebp-4]
 005B5923    call        @UStrCat3
 005B5928    mov         edx,dword ptr [ebp-18]
 005B592B    mov         ecx,dword ptr [ebp+8]
 005B592E    mov         eax,dword ptr [ebp-0C]
 005B5931    call        WriteStringToStream
>005B5936    jmp         005B5879
 005B593B    xor         eax,eax
 005B593D    pop         edx
 005B593E    pop         ecx
 005B593F    pop         ecx
 005B5940    mov         dword ptr fs:[eax],edx
 005B5943    push        5B595A
 005B5948    xor         edx,edx
 005B594A    mov         eax,dword ptr [ebp-8]
 005B594D    mov         ecx,dword ptr [eax]
 005B594F    call        dword ptr [ecx+40]
 005B5952    ret
>005B5953    jmp         @HandleFinally
>005B5958    jmp         005B5948
 005B595A    xor         eax,eax
 005B595C    pop         edx
 005B595D    pop         ecx
 005B595E    pop         ecx
 005B595F    mov         dword ptr fs:[eax],edx
 005B5962    push        5B5984
 005B5967    lea         eax,[ebp-18]
 005B596A    mov         edx,3
 005B596F    call        @UStrArrayClr
 005B5974    lea         eax,[ebp-4]
 005B5977    call        @UStrClr
 005B597C    ret
>005B597D    jmp         @HandleFinally
>005B5982    jmp         005B5967
 005B5984    pop         edi
 005B5985    pop         esi
 005B5986    pop         ebx
 005B5987    mov         esp,ebp
 005B5989    pop         ebp
 005B598A    ret         0C
*}
end;

//005B59B8
function TIdIOHandler.InputLn(AMask:string; AEcho:Boolean; AByteEncoding:TEncoding; AMaxLineLength:Integer; ATabWidth:Integer):string;
begin
{*
 005B59B8    push        ebp
 005B59B9    mov         ebp,esp
 005B59BB    add         esp,0FFFFFFE4
 005B59BE    push        ebx
 005B59BF    push        esi
 005B59C0    xor         ebx,ebx
 005B59C2    mov         dword ptr [ebp-1C],ebx
 005B59C5    mov         dword ptr [ebp-18],ebx
 005B59C8    mov         dword ptr [ebp-4],ebx
 005B59CB    mov         ebx,ecx
 005B59CD    mov         dword ptr [ebp-0C],edx
 005B59D0    mov         dword ptr [ebp-8],eax
 005B59D3    xor         eax,eax
 005B59D5    push        ebp
 005B59D6    push        5B5BFE
 005B59DB    push        dword ptr fs:[eax]
 005B59DE    mov         dword ptr fs:[eax],esp
 005B59E1    mov         eax,dword ptr [ebp+8]
 005B59E4    call        @UStrClr
 005B59E9    mov         eax,dword ptr [ebp-8]
 005B59EC    mov         edx,dword ptr [eax+0D4]
 005B59F2    mov         cl,1
 005B59F4    mov         eax,dword ptr [ebp+0C]
 005B59F7    call        iif
 005B59FC    mov         dword ptr [ebp+0C],eax
 005B59FF    cmp         dword ptr [ebp+10],0
>005B5A03    jge         005B5A11
 005B5A05    mov         eax,dword ptr [ebp-8]
 005B5A08    mov         eax,dword ptr [eax+0B0]
 005B5A0E    mov         dword ptr [ebp+10],eax
 005B5A11    mov         edx,dword ptr [ebp+0C]
 005B5A14    mov         eax,dword ptr [ebp-8]
 005B5A17    call        TIdIOHandler.ReadChar
 005B5A1C    mov         word ptr [ebp-0E],ax
 005B5A20    mov         eax,dword ptr [ebp+8]
 005B5A23    mov         eax,dword ptr [eax]
 005B5A25    mov         dword ptr [ebp-14],eax
 005B5A28    mov         eax,dword ptr [ebp-14]
 005B5A2B    test        eax,eax
>005B5A2D    je          005B5A34
 005B5A2F    sub         eax,4
 005B5A32    mov         eax,dword ptr [eax]
 005B5A34    mov         esi,eax
 005B5A36    cmp         esi,dword ptr [ebp+10]
>005B5A39    jg          005B5B85
 005B5A3F    movzx       eax,word ptr [ebp-0E]
 005B5A43    add         eax,0FFFFFFF8
 005B5A46    cmp         eax,13
>005B5A49    ja          005B5B35
 005B5A4F    movzx       eax,byte ptr [eax+5B5A5D]
 005B5A56    jmp         dword ptr [eax*4+5B5A71]
 005B5A56    db          1
 005B5A56    db          2
 005B5A56    db          3
 005B5A56    db          0
 005B5A56    db          0
 005B5A56    db          4
 005B5A56    db          0
 005B5A56    db          0
 005B5A56    db          0
 005B5A56    db          0
 005B5A56    db          0
 005B5A56    db          0
 005B5A56    db          0
 005B5A56    db          0
 005B5A56    db          0
 005B5A56    db          0
 005B5A56    db          0
 005B5A56    db          0
 005B5A56    db          0
 005B5A56    db          5
 005B5A56    dd          005B5B35
 005B5A56    dd          005B5A89
 005B5A56    dd          005B5ABC
 005B5A56    dd          005B5B85
 005B5A56    dd          005B5B85
 005B5A56    dd          005B5B85
 005B5A89    test        esi,esi
>005B5A8B    jle         005B5B85
 005B5A91    mov         edx,esi
 005B5A93    dec         edx
 005B5A94    mov         eax,dword ptr [ebp+8]
 005B5A97    call        @UStrSetLength
 005B5A9C    test        bl,bl
>005B5A9E    je          005B5B85
 005B5AA4    mov         ecx,dword ptr [ebp+0C]
 005B5AA7    mov         edx,5B5C1C;' '
 005B5AAC    mov         eax,dword ptr [ebp-8]
 005B5AAF    mov         esi,dword ptr [eax]
 005B5AB1    call        dword ptr [esi+94]
>005B5AB7    jmp         005B5B85
 005B5ABC    cmp         dword ptr [ebp+14],0
>005B5AC0    jle         005B5B06
 005B5AC2    mov         eax,esi
 005B5AC4    cdq
 005B5AC5    idiv        eax,dword ptr [ebp+14]
 005B5AC8    mov         eax,dword ptr [ebp+14]
 005B5ACB    sub         eax,edx
 005B5ACD    mov         esi,eax
 005B5ACF    lea         ecx,[ebp-4]
 005B5AD2    mov         edx,esi
 005B5AD4    mov         ax,20
 005B5AD8    call        StringOfChar
 005B5ADD    mov         eax,dword ptr [ebp+8]
 005B5AE0    mov         edx,dword ptr [ebp-4]
 005B5AE3    call        @UStrCat
 005B5AE8    mov         eax,dword ptr [ebp+8]
 005B5AEB    test        bl,bl
>005B5AED    je          005B5B85
 005B5AF3    mov         ecx,dword ptr [ebp+0C]
 005B5AF6    mov         edx,dword ptr [ebp-4]
 005B5AF9    mov         eax,dword ptr [ebp-8]
 005B5AFC    mov         esi,dword ptr [eax]
 005B5AFE    call        dword ptr [esi+94]
>005B5B04    jmp         005B5B85
 005B5B06    lea         eax,[ebp-18]
 005B5B09    movzx       edx,word ptr [ebp-0E]
 005B5B0D    call        @UStrFromWChar
 005B5B12    mov         edx,dword ptr [ebp-18]
 005B5B15    mov         eax,dword ptr [ebp+8]
 005B5B18    call        @UStrCat
 005B5B1D    mov         eax,dword ptr [ebp+8]
 005B5B20    test        bl,bl
>005B5B22    je          005B5B85
 005B5B24    mov         ecx,dword ptr [ebp+0C]
 005B5B27    movzx       edx,word ptr [ebp-0E]
 005B5B2B    mov         eax,dword ptr [ebp-8]
 005B5B2E    call        TIdIOHandler.Write
>005B5B33    jmp         005B5B85
 005B5B35    lea         eax,[ebp-1C]
 005B5B38    movzx       edx,word ptr [ebp-0E]
 005B5B3C    call        @UStrFromWChar
 005B5B41    mov         edx,dword ptr [ebp-1C]
 005B5B44    mov         eax,dword ptr [ebp+8]
 005B5B47    call        @UStrCat
 005B5B4C    mov         eax,dword ptr [ebp+8]
 005B5B4F    test        bl,bl
>005B5B51    je          005B5B85
 005B5B53    mov         eax,dword ptr [ebp-0C]
 005B5B56    test        eax,eax
>005B5B58    je          005B5B5F
 005B5B5A    sub         eax,4
 005B5B5D    mov         eax,dword ptr [eax]
 005B5B5F    test        eax,eax
>005B5B61    jne         005B5B74
 005B5B63    mov         ecx,dword ptr [ebp+0C]
 005B5B66    movzx       edx,word ptr [ebp-0E]
 005B5B6A    mov         eax,dword ptr [ebp-8]
 005B5B6D    call        TIdIOHandler.Write
>005B5B72    jmp         005B5B85
 005B5B74    mov         ecx,dword ptr [ebp+0C]
 005B5B77    mov         edx,dword ptr [ebp-0C]
 005B5B7A    mov         eax,dword ptr [ebp-8]
 005B5B7D    mov         esi,dword ptr [eax]
 005B5B7F    call        dword ptr [esi+94]
 005B5B85    cmp         word ptr [ebp-0E],0A
>005B5B8A    jne         005B5A11
 005B5B90    mov         eax,dword ptr [ebp+8]
 005B5B93    mov         eax,dword ptr [eax]
 005B5B95    mov         dword ptr [ebp-14],eax
 005B5B98    mov         eax,dword ptr [ebp-14]
 005B5B9B    test        eax,eax
>005B5B9D    je          005B5BA4
 005B5B9F    sub         eax,4
 005B5BA2    mov         eax,dword ptr [eax]
 005B5BA4    mov         esi,eax
>005B5BA6    jmp         005B5BA9
 005B5BA8    dec         esi
 005B5BA9    test        esi,esi
>005B5BAB    jle         005B5BC2
 005B5BAD    mov         eax,dword ptr [ebp+8]
 005B5BB0    mov         eax,dword ptr [eax]
 005B5BB2    mov         ecx,5B5C30;'
'
 005B5BB7    mov         edx,esi
 005B5BB9    call        CharIsInSet
 005B5BBE    test        al,al
>005B5BC0    jne         005B5BA8
 005B5BC2    mov         eax,dword ptr [ebp+8]
 005B5BC5    mov         edx,esi
 005B5BC7    call        @UStrSetLength
 005B5BCC    test        bl,bl
>005B5BCE    je          005B5BDB
 005B5BD0    mov         edx,dword ptr [ebp+0C]
 005B5BD3    mov         eax,dword ptr [ebp-8]
 005B5BD6    call        TIdIOHandler.WriteLn
 005B5BDB    xor         eax,eax
 005B5BDD    pop         edx
 005B5BDE    pop         ecx
 005B5BDF    pop         ecx
 005B5BE0    mov         dword ptr fs:[eax],edx
 005B5BE3    push        5B5C05
 005B5BE8    lea         eax,[ebp-1C]
 005B5BEB    mov         edx,2
 005B5BF0    call        @UStrArrayClr
 005B5BF5    lea         eax,[ebp-4]
 005B5BF8    call        @UStrClr
 005B5BFD    ret
>005B5BFE    jmp         @HandleFinally
>005B5C03    jmp         005B5BE8
 005B5C05    pop         esi
 005B5C06    pop         ebx
 005B5C07    mov         esp,ebp
 005B5C09    pop         ebp
 005B5C0A    ret         10
*}
end;

//005B5C38
function TIdIOHandler.WaitFor(AString:string; ARemoveFromBuffer:Boolean; ATimeout:Integer; AByteEncoding:TEncoding; AInclusive:Boolean):string;
begin
{*
 005B5C38    push        ebp
 005B5C39    mov         ebp,esp
 005B5C3B    add         esp,0FFFFFFF4
 005B5C3E    push        ebx
 005B5C3F    push        esi
 005B5C40    push        edi
 005B5C41    xor         ebx,ebx
 005B5C43    mov         dword ptr [ebp-4],ebx
 005B5C46    mov         byte ptr [ebp-9],cl
 005B5C49    mov         dword ptr [ebp-8],edx
 005B5C4C    mov         esi,eax
 005B5C4E    mov         edi,dword ptr [ebp+10]
 005B5C51    xor         eax,eax
 005B5C53    push        ebp
 005B5C54    push        5B5D56
 005B5C59    push        dword ptr fs:[eax]
 005B5C5C    mov         dword ptr fs:[eax],esp
 005B5C5F    mov         eax,dword ptr [ebp+8]
 005B5C62    call        @UStrClr
 005B5C67    mov         cl,1
 005B5C69    mov         edx,dword ptr [esi+0D4]
 005B5C6F    mov         eax,edi
 005B5C71    call        iif
 005B5C76    mov         edi,eax
 005B5C78    lea         ecx,[ebp-4]
 005B5C7B    mov         edx,edi
 005B5C7D    mov         eax,dword ptr [ebp-8]
 005B5C80    call        ToBytes
 005B5C85    xor         ebx,ebx
 005B5C87    mov         ecx,ebx
 005B5C89    mov         edx,dword ptr [ebp-4]
 005B5C8C    mov         eax,dword ptr [esi+0A0]
 005B5C92    call        TIdBuffer.IndexOf
 005B5C97    mov         ebx,eax
 005B5C99    cmp         ebx,0FFFFFFFF
>005B5C9C    je          005B5D0A
 005B5C9E    movzx       eax,byte ptr [ebp-9]
 005B5CA2    and         al,byte ptr [ebp+14]
>005B5CA5    je          005B5CC6
 005B5CA7    mov         eax,dword ptr [ebp+8]
 005B5CAA    push        eax
 005B5CAB    mov         eax,dword ptr [ebp-4]
 005B5CAE    call        @DynArrayLength
 005B5CB3    mov         edx,eax
 005B5CB5    add         edx,ebx
 005B5CB7    mov         ecx,edi
 005B5CB9    mov         eax,dword ptr [esi+0A0]
 005B5CBF    call        TIdBuffer.ExtractToString
>005B5CC4    jmp         005B5D3A
 005B5CC6    mov         eax,dword ptr [ebp+8]
 005B5CC9    push        eax
 005B5CCA    mov         ecx,edi
 005B5CCC    mov         edx,ebx
 005B5CCE    mov         eax,dword ptr [esi+0A0]
 005B5CD4    call        TIdBuffer.ExtractToString
 005B5CD9    cmp         byte ptr [ebp-9],0
>005B5CDD    je          005B5CF4
 005B5CDF    mov         eax,dword ptr [ebp-4]
 005B5CE2    call        @DynArrayLength
 005B5CE7    mov         edx,eax
 005B5CE9    mov         eax,dword ptr [esi+0A0]
 005B5CEF    call        TIdBuffer.Remove
 005B5CF4    cmp         byte ptr [ebp+14],0
>005B5CF8    je          005B5D3A
 005B5CFA    mov         eax,dword ptr [ebp+8]
 005B5CFD    mov         edx,dword ptr [ebp-8]
 005B5D00    call        @UStrCat
 005B5D05    mov         eax,dword ptr [ebp+8]
>005B5D08    jmp         005B5D3A
 005B5D0A    mov         eax,dword ptr [ebp-4]
 005B5D0D    call        @DynArrayLength
 005B5D12    dec         eax
 005B5D13    mov         edx,dword ptr [esi+0A0]
 005B5D19    mov         edx,dword ptr [edx+20]
 005B5D1C    sub         edx,eax
 005B5D1E    xor         eax,eax
 005B5D20    call        IndyMax
 005B5D25    mov         ebx,eax
 005B5D27    push        1
 005B5D29    mov         ecx,dword ptr [ebp+0C]
 005B5D2C    mov         dl,1
 005B5D2E    mov         eax,esi
 005B5D30    call        TIdIOHandler.ReadFromSource
>005B5D35    jmp         005B5C87
 005B5D3A    xor         eax,eax
 005B5D3C    pop         edx
 005B5D3D    pop         ecx
 005B5D3E    pop         ecx
 005B5D3F    mov         dword ptr fs:[eax],edx
 005B5D42    push        5B5D5D
 005B5D47    lea         eax,[ebp-4]
 005B5D4A    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B5D50    call        @DynArrayClear
 005B5D55    ret
>005B5D56    jmp         @HandleFinally
>005B5D5B    jmp         005B5D47
 005B5D5D    pop         edi
 005B5D5E    pop         esi
 005B5D5F    pop         ebx
 005B5D60    mov         esp,ebp
 005B5D62    pop         ebp
 005B5D63    ret         10
*}
end;

//005B5D68
procedure TIdIOHandler.Capture(ADest:TStream; AByteEncoding:TEncoding);
begin
{*
 005B5D68    push        1
 005B5D6A    push        ecx
 005B5D6B    mov         ecx,5B5D84;'.'
 005B5D70    call        TIdIOHandler.Capture
 005B5D75    ret
*}
end;

//005B5D88
procedure TIdIOHandler.Capture(ADest:TStream; VLineCount:Integer; AByteEncoding:TEncoding; AUsesDotTransparency:Boolean; ADelim:string);
begin
{*
 005B5D88    push        ebp
 005B5D89    mov         ebp,esp
 005B5D8B    push        ebx
 005B5D8C    push        esi
 005B5D8D    push        edi
 005B5D8E    mov         edi,edx
 005B5D90    mov         esi,eax
 005B5D92    mov         eax,dword ptr [ebp+10]
 005B5D95    push        eax
 005B5D96    movzx       eax,byte ptr [ebp+0C]
 005B5D9A    push        eax
 005B5D9B    mov         eax,dword ptr [ebp+8]
 005B5D9E    push        eax
 005B5D9F    mov         edx,edi
 005B5DA1    mov         eax,esi
 005B5DA3    mov         ebx,dword ptr [eax]
 005B5DA5    call        dword ptr [ebx+48]
 005B5DA8    pop         edi
 005B5DA9    pop         esi
 005B5DAA    pop         ebx
 005B5DAB    pop         ebp
 005B5DAC    ret         0C
*}
end;

//005B5DB0
procedure TIdIOHandler.Capture(ADest:TStream; ADelim:string; AByteEncoding:TEncoding; AUsesDotTransparency:Boolean);
begin
{*
 005B5DB0    push        ebp
 005B5DB1    mov         ebp,esp
 005B5DB3    push        ecx
 005B5DB4    push        ebx
 005B5DB5    push        esi
 005B5DB6    mov         esi,edx
 005B5DB8    mov         ebx,eax
 005B5DBA    xor         eax,eax
 005B5DBC    push        ebp
 005B5DBD    push        5B5DF0
 005B5DC2    push        dword ptr fs:[eax]
 005B5DC5    mov         dword ptr fs:[eax],esp
 005B5DC8    push        5B5E0C;'.'
 005B5DCD    movzx       eax,byte ptr [ebp+0C]
 005B5DD1    push        eax
 005B5DD2    mov         eax,dword ptr [ebp+8]
 005B5DD5    push        eax
 005B5DD6    lea         ecx,[ebp-4]
 005B5DD9    mov         edx,esi
 005B5DDB    mov         eax,ebx
 005B5DDD    mov         ebx,dword ptr [eax]
 005B5DDF    call        dword ptr [ebx+48]
 005B5DE2    xor         eax,eax
 005B5DE4    pop         edx
 005B5DE5    pop         ecx
 005B5DE6    pop         ecx
 005B5DE7    mov         dword ptr fs:[eax],edx
 005B5DEA    push        5B5DF7
 005B5DEF    ret
>005B5DF0    jmp         @HandleFinally
>005B5DF5    jmp         005B5DEF
 005B5DF7    pop         esi
 005B5DF8    pop         ebx
 005B5DF9    pop         ecx
 005B5DFA    pop         ebp
 005B5DFB    ret         8
*}
end;

//005B5E10
procedure TIdIOHandler.Capture(ADest:TStrings; VLineCount:Integer; AByteEncoding:TEncoding; AUsesDotTransparency:Boolean; ADelim:string);
begin
{*
 005B5E10    push        ebp
 005B5E11    mov         ebp,esp
 005B5E13    push        ebx
 005B5E14    push        esi
 005B5E15    push        edi
 005B5E16    mov         edi,edx
 005B5E18    mov         esi,eax
 005B5E1A    mov         eax,dword ptr [ebp+10]
 005B5E1D    push        eax
 005B5E1E    movzx       eax,byte ptr [ebp+0C]
 005B5E22    push        eax
 005B5E23    mov         eax,dword ptr [ebp+8]
 005B5E26    push        eax
 005B5E27    mov         edx,edi
 005B5E29    mov         eax,esi
 005B5E2B    mov         ebx,dword ptr [eax]
 005B5E2D    call        dword ptr [ebx+48]
 005B5E30    pop         edi
 005B5E31    pop         esi
 005B5E32    pop         ebx
 005B5E33    pop         ebp
 005B5E34    ret         0C
*}
end;

//005B5E38
procedure TIdIOHandler.Capture(ADest:TStrings; AByteEncoding:TEncoding);
begin
{*
 005B5E38    push        ebx
 005B5E39    push        esi
 005B5E3A    push        edi
 005B5E3B    push        ecx
 005B5E3C    mov         edi,edx
 005B5E3E    mov         esi,eax
 005B5E40    push        5B5E68;'.'
 005B5E45    push        1
 005B5E47    push        ecx
 005B5E48    lea         ecx,[esp+0C]
 005B5E4C    mov         edx,edi
 005B5E4E    mov         eax,esi
 005B5E50    mov         ebx,dword ptr [eax]
 005B5E52    call        dword ptr [ebx+48]
 005B5E55    pop         edx
 005B5E56    pop         edi
 005B5E57    pop         esi
 005B5E58    pop         ebx
 005B5E59    ret
*}
end;

//005B5E6C
procedure TIdIOHandler.Capture(ADest:TStrings; ADelim:string; AByteEncoding:TEncoding; AUsesDotTransparency:Boolean);
begin
{*
 005B5E6C    push        ebp
 005B5E6D    mov         ebp,esp
 005B5E6F    push        ecx
 005B5E70    push        ebx
 005B5E71    push        esi
 005B5E72    push        edi
 005B5E73    mov         edi,edx
 005B5E75    mov         esi,eax
 005B5E77    push        ecx
 005B5E78    movzx       eax,byte ptr [ebp+0C]
 005B5E7C    push        eax
 005B5E7D    mov         eax,dword ptr [ebp+8]
 005B5E80    push        eax
 005B5E81    lea         ecx,[ebp-4]
 005B5E84    mov         edx,edi
 005B5E86    mov         eax,esi
 005B5E88    mov         ebx,dword ptr [eax]
 005B5E8A    call        dword ptr [ebx+48]
 005B5E8D    pop         edi
 005B5E8E    pop         esi
 005B5E8F    pop         ebx
 005B5E90    pop         ecx
 005B5E91    pop         ebp
 005B5E92    ret         8
*}
end;

//005B5E98
procedure TIdIOHandler.InputBufferToStream(AStream:TStream; AByteCount:Integer);
begin
{*
 005B5E98    push        0FF
 005B5E9A    mov         eax,dword ptr [eax+0A0]
 005B5EA0    call        TIdBuffer.ExtractToStream
 005B5EA5    ret
*}
end;

//005B5EA8
function TIdIOHandler.InputBufferIsEmpty:Boolean;
begin
{*
 005B5EA8    mov         eax,dword ptr [eax+0A0]
 005B5EAE    cmp         dword ptr [eax+20],0
 005B5EB2    sete        al
 005B5EB5    ret
*}
end;

//005B5EB8
procedure TIdIOHandler.Write(const ABuffer:TIdBytes; const ALength:Integer; const AOffset:Integer);
begin
{*
 005B5EB8    push        ebp
 005B5EB9    mov         ebp,esp
 005B5EBB    push        ecx
 005B5EBC    push        ebx
 005B5EBD    push        esi
 005B5EBE    mov         dword ptr [ebp-4],ecx
 005B5EC1    mov         esi,edx
 005B5EC3    mov         ebx,eax
 005B5EC5    mov         ecx,dword ptr [ebp+8]
 005B5EC8    mov         edx,dword ptr [ebp-4]
 005B5ECB    mov         eax,esi
 005B5ECD    call        IndyLength
 005B5ED2    test        eax,eax
>005B5ED4    jle         005B5F3A
 005B5ED6    mov         edx,dword ptr [ebx+0CC]
 005B5EDC    test        edx,edx
>005B5EDE    jne         005B5EF1
 005B5EE0    mov         edx,dword ptr [ebp+8]
 005B5EE3    push        edx
 005B5EE4    mov         ecx,eax
 005B5EE6    mov         edx,esi
 005B5EE8    mov         eax,ebx
 005B5EEA    call        TIdIOHandler.WriteDirect
>005B5EEF    jmp         005B5F3A
 005B5EF1    mov         ecx,dword ptr [ebp+8]
 005B5EF4    push        ecx
 005B5EF5    push        0FF
 005B5EF7    mov         ecx,eax
 005B5EF9    mov         eax,edx
 005B5EFB    mov         edx,esi
 005B5EFD    call        TIdBuffer.Write
 005B5F02    mov         edx,dword ptr [ebx+0CC]
 005B5F08    mov         edx,dword ptr [edx+20]
 005B5F0B    mov         eax,dword ptr [ebx+0D0]
 005B5F11    cmp         edx,eax
>005B5F13    jl          005B5F3A
 005B5F15    test        eax,eax
>005B5F17    jle         005B5F3A
 005B5F19    mov         edx,dword ptr [ebx+0D0]
 005B5F1F    mov         eax,ebx
 005B5F21    mov         ecx,dword ptr [eax]
 005B5F23    call        dword ptr [ecx+0D0]
 005B5F29    mov         eax,dword ptr [ebx+0CC]
 005B5F2F    mov         eax,dword ptr [eax+20]
 005B5F32    cmp         eax,dword ptr [ebx+0D0]
>005B5F38    jge         005B5F19
 005B5F3A    pop         esi
 005B5F3B    pop         ebx
 005B5F3C    pop         ecx
 005B5F3D    pop         ebp
 005B5F3E    ret         4
*}
end;

//005B5F44
procedure TIdIOHandler.WriteRFCStrings(AStrings:TStrings; AWriteTerminator:Boolean; AByteEncoding:TEncoding);
begin
{*
 005B5F44    push        ebp
 005B5F45    mov         ebp,esp
 005B5F47    add         esp,0FFFFFFF0
 005B5F4A    push        ebx
 005B5F4B    push        esi
 005B5F4C    push        edi
 005B5F4D    xor         ebx,ebx
 005B5F4F    mov         dword ptr [ebp-10],ebx
 005B5F52    mov         byte ptr [ebp-9],cl
 005B5F55    mov         dword ptr [ebp-8],edx
 005B5F58    mov         dword ptr [ebp-4],eax
 005B5F5B    xor         eax,eax
 005B5F5D    push        ebp
 005B5F5E    push        5B5FE2
 005B5F63    push        dword ptr fs:[eax]
 005B5F66    mov         dword ptr fs:[eax],esp
 005B5F69    mov         eax,dword ptr [ebp-4]
 005B5F6C    mov         edx,dword ptr [eax+0D4]
 005B5F72    mov         cl,1
 005B5F74    mov         eax,dword ptr [ebp+8]
 005B5F77    call        iif
 005B5F7C    mov         dword ptr [ebp+8],eax
 005B5F7F    mov         eax,dword ptr [ebp-8]
 005B5F82    mov         edx,dword ptr [eax]
 005B5F84    call        dword ptr [edx+14]
 005B5F87    mov         ebx,eax
 005B5F89    dec         ebx
 005B5F8A    test        ebx,ebx
>005B5F8C    jl          005B5FB3
 005B5F8E    inc         ebx
 005B5F8F    xor         esi,esi
 005B5F91    lea         ecx,[ebp-10]
 005B5F94    mov         edx,esi
 005B5F96    mov         eax,dword ptr [ebp-8]
 005B5F99    mov         edi,dword ptr [eax]
 005B5F9B    call        dword ptr [edi+0C]
 005B5F9E    mov         edx,dword ptr [ebp-10]
 005B5FA1    mov         ecx,dword ptr [ebp+8]
 005B5FA4    mov         eax,dword ptr [ebp-4]
 005B5FA7    mov         edi,dword ptr [eax]
 005B5FA9    call        dword ptr [edi+9C]
 005B5FAF    inc         esi
 005B5FB0    dec         ebx
>005B5FB1    jne         005B5F91
 005B5FB3    cmp         byte ptr [ebp-9],0
>005B5FB7    je          005B5FCC
 005B5FB9    mov         ecx,dword ptr [ebp+8]
 005B5FBC    mov         edx,5B6000;'.'
 005B5FC1    mov         eax,dword ptr [ebp-4]
 005B5FC4    mov         ebx,dword ptr [eax]
 005B5FC6    call        dword ptr [ebx+98]
 005B5FCC    xor         eax,eax
 005B5FCE    pop         edx
 005B5FCF    pop         ecx
 005B5FD0    pop         ecx
 005B5FD1    mov         dword ptr fs:[eax],edx
 005B5FD4    push        5B5FE9
 005B5FD9    lea         eax,[ebp-10]
 005B5FDC    call        @UStrClr
 005B5FE1    ret
>005B5FE2    jmp         @HandleFinally
>005B5FE7    jmp         005B5FD9
 005B5FE9    pop         edi
 005B5FEA    pop         esi
 005B5FEB    pop         ebx
 005B5FEC    mov         esp,ebp
 005B5FEE    pop         ebp
 005B5FEF    ret         4
*}
end;

//005B6004
function TIdIOHandler.WriteFile(AFile:string; AEnableTransferFile:Boolean):Int64;
begin
{*
 005B6004    push        ebp
 005B6005    mov         ebp,esp
 005B6007    add         esp,0FFFFFFE4
 005B600A    push        ebx
 005B600B    push        esi
 005B600C    xor         ebx,ebx
 005B600E    mov         dword ptr [ebp-1C],ebx
 005B6011    mov         ebx,edx
 005B6013    mov         esi,eax
 005B6015    xor         eax,eax
 005B6017    push        ebp
 005B6018    push        5B6119
 005B601D    push        dword ptr fs:[eax]
 005B6020    mov         dword ptr fs:[eax],esp
 005B6023    mov         dword ptr [ebp-8],0
 005B602A    mov         dword ptr [ebp-4],0
 005B6031    push        1
 005B6033    call        kernel32.SetErrorMode
 005B6038    mov         dword ptr [ebp-10],eax
 005B603B    xor         edx,edx
 005B603D    push        ebp
 005B603E    push        5B60FC
 005B6043    push        dword ptr fs:[edx]
 005B6046    mov         dword ptr fs:[edx],esp
 005B6049    mov         dl,1
 005B604B    mov         eax,ebx
 005B604D    call        FileExists
 005B6052    test        al,al
>005B6054    jne         005B6084
 005B6056    mov         dword ptr [ebp-18],ebx
 005B6059    mov         byte ptr [ebp-14],11
 005B605D    lea         eax,[ebp-18]
 005B6060    push        eax
 005B6061    push        0
 005B6063    lea         edx,[ebp-1C]
 005B6066    mov         eax,[0078D11C];^SResString684:TResStringRec
 005B606B    call        LoadResString
 005B6070    mov         ecx,dword ptr [ebp-1C]
 005B6073    mov         dl,1
 005B6075    mov         eax,[005AFC8C];EIdFileNotFound
 005B607A    call        Exception.CreateFmt
 005B607F    call        @RaiseExcept
 005B6084    mov         ecx,ebx
 005B6086    mov         dl,1
 005B6088    mov         eax,[00596F9C];TIdReadFileExclusiveStream
 005B608D    call        TIdReadFileExclusiveStream.Create
 005B6092    mov         dword ptr [ebp-0C],eax
 005B6095    xor         edx,edx
 005B6097    push        ebp
 005B6098    push        5B60DE
 005B609D    push        dword ptr fs:[edx]
 005B60A0    mov         dword ptr fs:[edx],esp
 005B60A3    push        0
 005B60A5    push        0
 005B60A7    xor         ecx,ecx
 005B60A9    mov         edx,dword ptr [ebp-0C]
 005B60AC    mov         eax,esi
 005B60AE    mov         ebx,dword ptr [eax]
 005B60B0    call        dword ptr [ebx+0A4]
 005B60B6    mov         eax,dword ptr [ebp-0C]
 005B60B9    mov         edx,dword ptr [eax]
 005B60BB    call        dword ptr [edx]
 005B60BD    mov         dword ptr [ebp-8],eax
 005B60C0    mov         dword ptr [ebp-4],edx
 005B60C3    xor         eax,eax
 005B60C5    pop         edx
 005B60C6    pop         ecx
 005B60C7    pop         ecx
 005B60C8    mov         dword ptr fs:[eax],edx
 005B60CB    push        5B60E5
 005B60D0    mov         eax,dword ptr [ebp-0C]
 005B60D3    xor         edx,edx
 005B60D5    mov         dword ptr [ebp-0C],edx
 005B60D8    call        TObject.Free
 005B60DD    ret
>005B60DE    jmp         @HandleFinally
>005B60E3    jmp         005B60D0
 005B60E5    xor         eax,eax
 005B60E7    pop         edx
 005B60E8    pop         ecx
 005B60E9    pop         ecx
 005B60EA    mov         dword ptr fs:[eax],edx
 005B60ED    push        5B6103
 005B60F2    mov         eax,dword ptr [ebp-10]
 005B60F5    push        eax
 005B60F6    call        kernel32.SetErrorMode
 005B60FB    ret
>005B60FC    jmp         @HandleFinally
>005B6101    jmp         005B60F2
 005B6103    xor         eax,eax
 005B6105    pop         edx
 005B6106    pop         ecx
 005B6107    pop         ecx
 005B6108    mov         dword ptr fs:[eax],edx
 005B610B    push        5B6120
 005B6110    lea         eax,[ebp-1C]
 005B6113    call        @UStrClr
 005B6118    ret
>005B6119    jmp         @HandleFinally
>005B611E    jmp         005B6110
 005B6120    mov         eax,dword ptr [ebp-8]
 005B6123    mov         edx,dword ptr [ebp-4]
 005B6126    pop         esi
 005B6127    pop         ebx
 005B6128    mov         esp,ebp
 005B612A    pop         ebp
 005B612B    ret
*}
end;

//005B612C
function TIdIOHandler.WriteBufferingActive:Boolean;
begin
{*
 005B612C    cmp         dword ptr [eax+0CC],0
 005B6133    setne       al
 005B6136    ret
*}
end;

//005B6138
procedure TIdIOHandler.CloseGracefully;
begin
{*
 005B6138    mov         byte ptr [eax+91],1
 005B613F    ret
*}
end;

//005B6140
procedure TIdIOHandler.InitComponent;
begin
{*
 005B6140    push        ebx
 005B6141    mov         ebx,eax
 005B6143    mov         eax,ebx
 005B6145    call        TIdComponent.InitComponent
 005B614A    mov         dword ptr [ebx+0C4],8000
 005B6154    mov         dword ptr [ebx+0C8],8000
 005B615E    mov         dword ptr [ebx+0B0],4000
 005B6168    mov         dword ptr [ebx+0A8],0FFFFFFFF
 005B6172    mov         byte ptr [ebx+90],0
 005B6179    mov         dword ptr [ebx+0C0],0FFFFFFFF
 005B6183    push        ebx
 005B6184    push        5B3690;TIdIOHandler.BufferRemoveNotify
 005B6189    mov         dl,1
 005B618B    mov         eax,[005ADA5C];TIdBuffer
 005B6190    call        TIdBuffer.Create
 005B6195    mov         dword ptr [ebx+0A0],eax
 005B619B    call        TEncoding.GetASCII
 005B61A0    mov         dword ptr [ebx+0D4],eax
 005B61A6    pop         ebx
 005B61A7    ret
*}
end;

//005B61A8
procedure TIdIOHandler.WriteBufferFlush;
begin
{*
 005B61A8    or          edx,0FFFFFFFF
 005B61AB    mov         ecx,dword ptr [eax]
 005B61AD    call        dword ptr [ecx+0D0]
 005B61B3    ret
*}
end;

//005B61B4
procedure TIdIOHandler.WriteBufferOpen;
begin
{*
 005B61B4    or          edx,0FFFFFFFF
 005B61B7    mov         ecx,dword ptr [eax]
 005B61B9    call        dword ptr [ecx+0D4]
 005B61BF    ret
*}
end;

//005B61C0
procedure TIdIOHandler.WriteDirect(const ABuffer:TIdBytes; const ALength:Integer; const AOffset:Integer);
begin
{*
 005B61C0    push        ebp
 005B61C1    mov         ebp,esp
 005B61C3    add         esp,0FFFFFFE0
 005B61C6    push        ebx
 005B61C7    push        esi
 005B61C8    push        edi
 005B61C9    xor         ebx,ebx
 005B61CB    mov         dword ptr [ebp-4],ebx
 005B61CE    mov         dword ptr [ebp-8],ecx
 005B61D1    mov         ebx,edx
 005B61D3    mov         esi,eax
 005B61D5    xor         eax,eax
 005B61D7    push        ebp
 005B61D8    push        5B62EF
 005B61DD    push        dword ptr fs:[eax]
 005B61E0    mov         dword ptr fs:[eax],esp
 005B61E3    mov         cl,1
 005B61E5    mov         dl,1
 005B61E7    mov         eax,esi
 005B61E9    mov         edi,dword ptr [eax]
 005B61EB    call        dword ptr [edi+78]
 005B61EE    lea         eax,[ebp-4]
 005B61F1    push        eax
 005B61F2    mov         ecx,dword ptr [ebp+8]
 005B61F5    mov         edx,dword ptr [ebp-8]
 005B61F8    mov         eax,ebx
 005B61FA    call        ToBytes
 005B61FF    mov         eax,dword ptr [esi+0A4]
 005B6205    test        eax,eax
>005B6207    je          005B6211
 005B6209    lea         edx,[ebp-4]
 005B620C    mov         ecx,dword ptr [eax]
 005B620E    call        dword ptr [ecx+44]
 005B6211    mov         eax,dword ptr [ebp-4]
 005B6214    call        @DynArrayLength
 005B6219    mov         dword ptr [ebp-10],eax
 005B621C    xor         eax,eax
 005B621E    mov         dword ptr [ebp-0C],eax
 005B6221    mov         eax,dword ptr [ebp-0C]
 005B6224    cmp         eax,dword ptr [ebp-10]
>005B6227    jge         005B62D3
 005B622D    mov         eax,dword ptr [ebp-10]
 005B6230    sub         eax,dword ptr [ebp-0C]
 005B6233    push        eax
 005B6234    mov         ecx,dword ptr [ebp-0C]
 005B6237    mov         edx,dword ptr [ebp-4]
 005B623A    mov         eax,esi
 005B623C    mov         ebx,dword ptr [eax]
 005B623E    call        dword ptr [ebx+60]
 005B6241    mov         ebx,eax
 005B6243    test        ebx,ebx
>005B6245    jge         005B6292
 005B6247    push        2
 005B6249    mov         dword ptr [ebp-20],274A
 005B6250    mov         dword ptr [ebp-1C],2745
 005B6257    mov         dword ptr [ebp-18],2746
 005B625E    lea         ecx,[ebp-20]
 005B6261    mov         eax,[0078D940];^gvar_00789ED0
 005B6266    mov         eax,dword ptr [eax]
 005B6268    mov         edx,ebx
 005B626A    call        TIdStack.CheckForSocketError
 005B626F    mov         dword ptr [ebp-14],eax
 005B6272    mov         byte ptr [esi+91],1
 005B6279    mov         eax,esi
 005B627B    mov         edx,dword ptr [eax]
 005B627D    call        dword ptr [edx+80]
 005B6283    mov         eax,[0078D940];^gvar_00789ED0
 005B6288    mov         eax,dword ptr [eax]
 005B628A    mov         edx,dword ptr [ebp-14]
 005B628D    mov         ecx,dword ptr [eax]
 005B628F    call        dword ptr [ecx+4C]
 005B6292    xor         ecx,ecx
 005B6294    xor         edx,edx
 005B6296    mov         eax,[005AAC00];TIdAntiFreezeBase
 005B629B    call        TIdAntiFreezeBase.DoProcess
 005B62A0    test        ebx,ebx
>005B62A2    jne         005B62AB
 005B62A4    mov         byte ptr [esi+91],1
 005B62AB    xor         ecx,ecx
 005B62AD    mov         dl,1
 005B62AF    mov         eax,esi
 005B62B1    mov         edi,dword ptr [eax]
 005B62B3    call        dword ptr [edi+78]
 005B62B6    mov         eax,ebx
 005B62B8    cdq
 005B62B9    push        edx
 005B62BA    push        eax
 005B62BB    mov         dl,1
 005B62BD    mov         eax,esi
 005B62BF    mov         ecx,dword ptr [eax]
 005B62C1    call        dword ptr [ecx+3C]
 005B62C4    add         dword ptr [ebp-0C],ebx
 005B62C7    mov         eax,dword ptr [ebp-0C]
 005B62CA    cmp         eax,dword ptr [ebp-10]
>005B62CD    jl          005B622D
 005B62D3    xor         eax,eax
 005B62D5    pop         edx
 005B62D6    pop         ecx
 005B62D7    pop         ecx
 005B62D8    mov         dword ptr fs:[eax],edx
 005B62DB    push        5B62F6
 005B62E0    lea         eax,[ebp-4]
 005B62E3    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005B62E9    call        @DynArrayClear
 005B62EE    ret
>005B62EF    jmp         @HandleFinally
>005B62F4    jmp         005B62E0
 005B62F6    pop         edi
 005B62F7    pop         esi
 005B62F8    pop         ebx
 005B62F9    mov         esp,ebp
 005B62FB    pop         ebp
 005B62FC    ret         4
*}
end;

end.